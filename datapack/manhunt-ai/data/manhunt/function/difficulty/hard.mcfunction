scoreboard players set #diff mh 3
scoreboard players set #atkcd mh 13
scoreboard players set #reach mh 29
scoreboard players set #crit mh 1
scoreboard players set #bow mh 1
scoreboard players set #bowcd mh 60
scoreboard players set #catchup mh 1000
execute as @a[tag=mh.bot] run function manhunt:bot/kit
tellraw @a [{"text":"[Manhunt] ","color":"gold"},{"text":"Difficulty: Hard","color":"red"},{"text":" (diamond sword, crit jumps, bow, catches up faster)","color":"gray"}]
