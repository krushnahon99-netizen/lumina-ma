# Once a second: if we barely moved while the runner is not close, we're stuck.
scoreboard players operation #m mh = @s mh.t
scoreboard players operation #m mh %= #20 mh
execute unless score #m mh matches 0 run return 0
execute store result score #x mh run data get entity @s Pos[0] 10
execute store result score #z mh run data get entity @s Pos[2] 10
scoreboard players operation #dx mh = #x mh
scoreboard players operation #dx mh -= @s mh.px
scoreboard players operation #dz mh = #z mh
scoreboard players operation #dz mh -= @s mh.pz
scoreboard players operation @s mh.px = #x mh
scoreboard players operation @s mh.pz = #z mh
execute if score #dx mh matches -6..6 if score #dz mh matches -6..6 if score @s mh.dh matches 25.. run return run function manhunt:bot/unstick
scoreboard players set @s mh.stk 0
