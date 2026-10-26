# Distances are in tenths of a block. distance=0.. keeps the target in the bot's own dimension.
scoreboard players set @s mh.dh -1
execute unless entity @a[tag=mh.runner,gamemode=!spectator,distance=0..] run return 0
execute store result score @s mh.dh run distance from @s to @a[tag=mh.runner,gamemode=!spectator,distance=0..,sort=nearest,limit=1] horizontal e 1
execute store result score @s mh.y run data get entity @s Pos[1] 10
execute store result score @s mh.dy run data get entity @a[tag=mh.runner,gamemode=!spectator,distance=0..,sort=nearest,limit=1] Pos[1] 10
scoreboard players operation @s mh.dy -= @s mh.y
# Real melee reach: from the bot's eyes to the closest point of the runner's hitbox.
execute anchored eyes positioned ^ ^ ^ store result score @s mh.reach run distance from ~ ~ ~ toHitbox @a[tag=mh.runner,gamemode=!spectator,distance=0..,sort=nearest,limit=1] e 1
execute store result score @s mh.hp run data get entity @s Health
execute store result score @s mh.food run data get entity @s foodLevel
scoreboard players set @s mh.lost 0
