scoreboard players set #diff mh 1
scoreboard players set #atkcd mh 18
scoreboard players set #reach mh 25
scoreboard players set #crit mh 0
scoreboard players set #bow mh 0
scoreboard players set #bowcd mh 120
scoreboard players set #catchup mh 0
execute as @a[tag=mh.bot] run function manhunt:bot/kit
tellraw @a [{"text":"[Manhunt] ","color":"gold"},{"text":"Difficulty: Easy","color":"green"},{"text":" (stone gear, slow swings, no bow)","color":"gray"}]
