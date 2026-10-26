# Back-bridge: face away from the runner, look down at the block edge, sneak backwards and keep placing.
player @s stop
player @s hotbar 2
player @s sneak
execute facing entity @a[tag=mh.runner,gamemode=!spectator,distance=0..,sort=nearest,limit=1] feet rotated ~180 78 run rotate @s ~ ~
player @s move backward
player @s use interval 4
scoreboard players set @s mh.st 3
scoreboard players set @s mh.t 0
