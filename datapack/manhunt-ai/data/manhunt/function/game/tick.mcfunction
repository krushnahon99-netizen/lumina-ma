execute as @a[tag=mh.runner,scores={mh.deaths=1..}] run function manhunt:game/runner_died
execute unless score #state mh matches 2 run return 0
execute as @e[type=player,tag=mh.bot,scores={mh.deaths=1..}] run function manhunt:bot/respawned
execute as @e[type=player,tag=mh.bot] at @s run function manhunt:bot/tick
