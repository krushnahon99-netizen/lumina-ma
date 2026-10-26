function manhunt:bot/sense
execute if score @s mh.dh matches -1 run return run function manhunt:bot/no_target
scoreboard players remove @s[scores={mh.cd=1..}] mh.cd 1
scoreboard players remove @s[scores={mh.bcd=1..}] mh.bcd 1
scoreboard players remove @s[scores={mh.ecd=1..}] mh.ecd 1
scoreboard players add @s mh.t 1
execute if score @s mh.st matches 1 run return run function manhunt:bot/state/pillar
execute if score @s mh.st matches 2 run return run function manhunt:bot/state/mine
execute if score @s mh.st matches 3 run return run function manhunt:bot/state/bridge
execute if score @s mh.st matches 4 run return run function manhunt:bot/state/bow
execute if score @s mh.st matches 5 run return run function manhunt:bot/state/eat
execute if score @s mh.st matches 6 run return run function manhunt:bot/state/dig
function manhunt:bot/state/chase
