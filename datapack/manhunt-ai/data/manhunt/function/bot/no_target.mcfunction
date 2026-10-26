# No runner in this dimension: wait, then follow through the runner's last portal.
execute unless entity @s[tag=mh.idle] run function manhunt:bot/go_idle
scoreboard players add @s mh.lost 1
execute if score @s mh.lost matches 100.. if entity @a[tag=mh.runner,gamemode=!spectator] if data storage manhunt:tmp portal.dim run function manhunt:bot/follow_dimension
