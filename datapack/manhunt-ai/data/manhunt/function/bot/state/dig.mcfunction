player @s look down
execute if score @s mh.t matches 200.. run return run function manhunt:bot/exit_state
execute if score @s mh.reach <= #reach mh run return run function manhunt:bot/exit_state
execute unless score @s mh.dy matches ..-15 run return run function manhunt:bot/exit_state
execute unless score @s mh.dh matches ..20 run return run function manhunt:bot/exit_state
execute if block ~ ~-0.5 ~ #manhunt:unmineable run return run function manhunt:bot/exit_state
execute if block ~ ~-1.5 ~ minecraft:lava run return run function manhunt:bot/exit_state
