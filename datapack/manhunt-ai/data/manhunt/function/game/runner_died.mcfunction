scoreboard players set @s mh.deaths 0
tag @s remove mh.runner
tag @s add mh.out
gamemode spectator @s
tellraw @a [{"text":"[Manhunt] ","color":"gold"},{"selector":"@s","color":"green"},{"text":" was hunted down!","color":"red"}]
execute unless entity @a[tag=mh.runner] run function manhunt:game/hunters_win
