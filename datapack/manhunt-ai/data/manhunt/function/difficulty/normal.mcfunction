scoreboard players set #diff mh 2
scoreboard players set #atkcd mh 13
scoreboard players set #reach mh 28
scoreboard players set #crit mh 0
scoreboard players set #bow mh 1
scoreboard players set #bowcd mh 80
scoreboard players set #catchup mh 1500
execute as @a[tag=mh.bot] run function manhunt:bot/kit
tellraw @a [{"text":"[Manhunt] ","color":"gold"},{"text":"Difficulty: Normal","color":"yellow"},{"text":" (iron gear, full-charge swings, bow)","color":"gray"}]
