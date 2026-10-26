scoreboard players set #state mh 0
execute as @a[tag=mh.bot] run function manhunt:bot/reset
gamemode survival @a[tag=mh.out]
tag @a[tag=mh.out] add mh.runner
tag @a remove mh.out
