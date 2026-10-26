scoreboard objectives add mh dummy
scoreboard objectives add mh.st dummy
scoreboard objectives add mh.t dummy
scoreboard objectives add mh.cd dummy
scoreboard objectives add mh.bcd dummy
scoreboard objectives add mh.ecd dummy
scoreboard objectives add mh.dh dummy
scoreboard objectives add mh.dy dummy
scoreboard objectives add mh.y dummy
scoreboard objectives add mh.py dummy
scoreboard objectives add mh.reach dummy
scoreboard objectives add mh.hp dummy
scoreboard objectives add mh.food dummy
scoreboard objectives add mh.lost dummy
scoreboard objectives add mh.far dummy
scoreboard objectives add mh.px dummy
scoreboard objectives add mh.pz dummy
scoreboard objectives add mh.stk dummy
scoreboard objectives add mh.ct dummy
scoreboard objectives add mh.sess dummy
scoreboard objectives add mh.deaths deathCount

scoreboard players set #20 mh 20
scoreboard players set #30 mh 30
scoreboard players add #session mh 1

team add mh.hunters
team modify mh.hunters color red
team modify mh.hunters friendlyFire false
team modify mh.hunters prefix {"text":"[Hunter] ","color":"red"}
team add mh.runners
team modify mh.runners color green
team modify mh.runners prefix {"text":"[Runner] ","color":"green"}

execute unless score #diff mh matches 1..3 run function manhunt:difficulty/normal
execute unless score #headstart mh matches 0.. run scoreboard players set #headstart mh 15
execute unless score #state mh matches 0.. run scoreboard players set #state mh 0

tellraw @a [{"text":"[Manhunt AI] ","color":"gold"},{"text":"Loaded. Type ","color":"gray"},{"text":"/function manhunt:help","color":"yellow"}]
