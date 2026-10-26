"""Live behaviour tests for the hunter bot on the local test server.

Run from scripts/test-server:  python3 test_hunter.py [setup] [melee] [pillar] [bridge] [bow]
"Runner" is a HeroBot fake player with Resistance V, so it survives while we count hits (HurtTime > 0).
"""
import re
import sys
import time

from rcon import R

r = R()
c = r.c
SEL = "hunter1"


def num(cmd):
    out = r.val(cmd)
    m = re.search(r"-?\d+(\.\d+)?", out)
    return float(m.group(0)) if m else None


def snapshot():
    pos = r.val(f"data get entity {SEL} Pos")
    rot = r.val(f"data get entity {SEL} Rotation")
    st = num(f"scoreboard players get {SEL} mh.st")
    reach = num(f"scoreboard players get {SEL} mh.reach")
    dy = num(f"scoreboard players get {SEL} mh.dy")
    hurt = num("data get entity Runner HurtTime")
    return pos, rot, st, reach, dy, hurt


def run(seconds, every=0.25, label=""):
    hits, first = 0, None
    last_hurt = 0
    t0 = time.time()
    while time.time() - t0 < seconds:
        pos, rot, st, reach, dy, hurt = snapshot()
        if hurt and hurt > 0 and (last_hurt == 0 or hurt > last_hurt):
            hits += 1
            first = first or reach
        last_hurt = hurt or 0
        print(f"  {label} t={time.time()-t0:4.1f} st={st} reach={reach} dy={dy} rot={rot} pos={pos} hurt={hurt}")
        time.sleep(every)
    return hits, first


def reset_game(headstart=0):
    c("function manhunt:stop")
    c("player Runner stop")
    c(f"scoreboard players set #headstart mh {headstart}")


def setup():
    print(c("datapack list enabled"))
    c("playerspawn Runner at 0.5 -60 0.5 facing 0 0 in survival")
    time.sleep(2)
    c("fill -30 -61 -30 30 -61 40 stone")
    c("execute as Runner run function manhunt:runner")
    print(c('execute as Runner at Runner run function manhunt:spawn {name:"hunter1"}'))
    for _ in range(20):
        time.sleep(1)
        tags = c(f"tag {SEL} list")
        if "mh.bot" in tags:
            break
    print("hunter tags:", tags)
    print("kit:", r.val(f"data get entity {SEL} Inventory[0].id"), r.val(f"data get entity {SEL} Inventory[1]"))
    c("effect give Runner resistance infinite 4 true")
    c("effect give Runner saturation infinite 1 true")


def melee():
    reset_game()
    c("tp Runner 0.5 -60 0.5 180 0")
    c(f"tp {SEL} 0.5 -60 8.5 180 0")
    time.sleep(1)
    c("function manhunt:start")
    hits, first = run(5, label="melee")
    c("function manhunt:stop")
    print(f"MELEE: {hits} hits in 5 s, first hit at reach {first} (tenths of a block, eye -> hitbox)")


def pillar():
    reset_game()
    c("fill 10 -60 10 10 -56 10 dirt")
    c("tp Runner 10.5 -55 10.5")
    c(f"tp {SEL} 15.5 -60 10.5 90 0")
    c(f"item replace entity {SEL} hotbar.1 with cobblestone 64")
    time.sleep(1)
    c("function manhunt:start")
    hits, first = run(9, label="pillar")
    c("function manhunt:stop")
    print(f"PILLAR: hunter y now {r.val(f'data get entity {SEL} Pos[1]')}, runner y -55, {hits} hits")


def bridge():
    reset_game()
    c("fill -10 -64 20 10 -61 25 air")
    c("tp Runner 0.5 -60 29.5")
    c(f"tp {SEL} 0.5 -60 15.5 0 0")
    c(f"item replace entity {SEL} hotbar.1 with cobblestone 64")
    time.sleep(1)
    c("function manhunt:start")
    hits, first = run(14, every=0.5, label="bridge")
    c("function manhunt:stop")
    print(f"BRIDGE: hunter pos {r.val(f'data get entity {SEL} Pos')}, {hits} hits")


def bow():
    reset_game()
    c("fill -30 -60 -30 30 -50 -5 air")
    c("tp Runner 0.5 -60 -25.5")
    c(f"tp {SEL} 0.5 -60 -5.5 180 0")
    c("player Runner stop")
    time.sleep(1)
    c("function manhunt:start")
    c(f"scoreboard players set {SEL} mh.bcd 0")
    hits, first = run(6, every=0.25, label="bow")
    c("function manhunt:stop")
    print(f"BOW: {hits} hits")


if __name__ == "__main__":
    for name in sys.argv[1:] or ["setup", "melee", "pillar", "bridge", "bow"]:
        print(f"===== {name}")
        globals()[name]()
