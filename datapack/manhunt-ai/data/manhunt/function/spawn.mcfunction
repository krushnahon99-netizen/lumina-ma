execute unless entity @s[type=player] run return run tellraw @a {"text":"[Manhunt] Run spawn as a player; the hunter appears where you stand.","color":"red"}
$data modify storage manhunt:tmp spawn set value {name:"$(name)"}
data modify storage manhunt:tmp spawn.dim set from entity @s Dimension
execute store result storage manhunt:tmp spawn.x double 0.01 run data get entity @s Pos[0] 100
execute store result storage manhunt:tmp spawn.y double 0.01 run data get entity @s Pos[1] 100
execute store result storage manhunt:tmp spawn.z double 0.01 run data get entity @s Pos[2] 100
execute store result storage manhunt:tmp spawn.yaw float 1 run data get entity @s Rotation[0]
function manhunt:internal/spawn_at with storage manhunt:tmp spawn
