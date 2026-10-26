advancement revoke @s only manhunt:changed_dim
execute unless entity @s[tag=mh.runner] run return 0
data modify storage manhunt:tmp portal.dim set from entity @s Dimension
execute store result storage manhunt:tmp portal.x double 0.01 run data get entity @s Pos[0] 100
execute store result storage manhunt:tmp portal.y double 0.01 run data get entity @s Pos[1] 100
execute store result storage manhunt:tmp portal.z double 0.01 run data get entity @s Pos[2] 100
