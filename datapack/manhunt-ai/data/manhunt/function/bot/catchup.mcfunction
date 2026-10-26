# Runner far away for 10 s (respawned hunter, long run): reappear ~40 blocks behind them. Overworld only.
execute if score #catchup mh matches 0 run return 0
execute unless dimension minecraft:overworld run return 0
execute if score @s mh.dh < #catchup mh run return run scoreboard players set @s mh.far 0
scoreboard players add @s mh.far 1
execute if score @s mh.far matches 200.. run function manhunt:bot/catchup_tp
