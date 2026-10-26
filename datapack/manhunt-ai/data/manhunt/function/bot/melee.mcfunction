execute if score #crit mh matches 1 if predicate manhunt:on_ground if predicate manhunt:crit_chance run return run function manhunt:bot/crit_jump
player @s attack once
scoreboard players operation @s mh.cd = #atkcd mh
