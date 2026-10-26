scoreboard players set #state mh 0
execute as @a[tag=mh.bot] run function manhunt:bot/reset
tellraw @a [{"text":"[Manhunt] ","color":"gold"},{"text":"The hunt was stopped.","color":"gray"}]
