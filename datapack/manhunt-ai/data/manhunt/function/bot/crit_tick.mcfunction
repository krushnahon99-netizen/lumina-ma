scoreboard players add @s mh.ct 1
function manhunt:bot/aim
player @s move forward
execute if score @s mh.ct matches 3.. if predicate manhunt:falling unless predicate manhunt:on_ground run return run function manhunt:bot/crit_hit
execute if score @s mh.ct matches 14.. run function manhunt:bot/crit_hit
