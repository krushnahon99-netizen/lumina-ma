# Fixed hotbar layout the brain relies on:
# 1 weapon | 2 blocks | 3 pickaxe | 4 bow | 5 food   (item slots hotbar.0 - hotbar.4)
clear @s
effect clear @s
execute if score #diff mh matches 1 run function manhunt:bot/kit/easy
execute if score #diff mh matches 2 run function manhunt:bot/kit/normal
execute if score #diff mh matches 3 run function manhunt:bot/kit/hard
item replace entity @s hotbar.1 with minecraft:cobblestone 64
item replace entity @s hotbar.4 with minecraft:cooked_beef 16
player @s hotbar 1
