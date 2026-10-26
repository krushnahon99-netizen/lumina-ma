scoreboard players set @s mh.far 0
execute at @a[tag=mh.runner,gamemode=!spectator,distance=0..,sort=nearest,limit=1] rotated ~ 0 positioned ^ ^ ^-40 positioned over motion_blocking_no_leaves unless block ~ ~-1 ~ #manhunt:liquid run tp @s ~ ~ ~
