tag @s remove mh.crit
execute unless score @s mh.reach <= #reach mh run return 0
player @s attack once
scoreboard players operation @s mh.cd = #atkcd mh
