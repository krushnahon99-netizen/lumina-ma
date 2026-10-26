execute as @a[tag=mh.bot] run function manhunt:bot/reset
execute as @a[tag=mh.bot] run team leave @s
execute as @a[tag=mh.bot] run player @s disconnect
tag @a remove mh.bot
tellraw @a [{"text":"[Manhunt] ","color":"gold"},{"text":"All hunters removed.","color":"gray"}]
