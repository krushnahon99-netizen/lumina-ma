# Look straight down, hold jump and hold place: one block per jump (tested: 1 block every 0.5 s).
player @s stop
player @s hotbar 2
player @s look down
player @s jump continuous
player @s use continuous
scoreboard players set @s mh.st 1
scoreboard players set @s mh.t 0
scoreboard players operation @s mh.py = @s mh.y
