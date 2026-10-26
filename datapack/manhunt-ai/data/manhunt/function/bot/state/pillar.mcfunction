player @s look down
# Level with the runner (or close enough to swing): stop building and fight.
execute if score @s mh.dy matches ..5 run return run function manhunt:bot/exit_state
execute unless score @s mh.dh matches ..40 run return run function manhunt:bot/exit_state
execute unless items entity @s hotbar.1 #manhunt:blocks run return run function manhunt:bot/exit_state
execute if score @s mh.t matches 300.. run return run function manhunt:bot/exit_state
# No height gained for 1.5 s (ceiling above): give up.
scoreboard players operation #m mh = @s mh.t
scoreboard players operation #m mh %= #30 mh
execute if score #m mh matches 0 if score @s mh.y <= @s mh.py run return run function manhunt:bot/exit_state
execute if score #m mh matches 0 run scoreboard players operation @s mh.py = @s mh.y
