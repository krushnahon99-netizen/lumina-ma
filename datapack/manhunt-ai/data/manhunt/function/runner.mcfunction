execute unless entity @s[type=player] run return run tellraw @a {"text":"[Manhunt] Run this as a player, e.g. /execute as Steve run function manhunt:runner","color":"red"}
execute if entity @s[tag=mh.bot] run return run tellraw @a {"text":"[Manhunt] A hunter bot can't be the runner.","color":"red"}
tag @s add mh.runner
tag @s remove mh.out
team join mh.runners @s
tellraw @a [{"text":"[Manhunt] ","color":"gold"},{"selector":"@s","color":"green"},{"text":" is now a runner.","color":"gray"}]
