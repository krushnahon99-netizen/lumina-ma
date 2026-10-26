scoreboard players remove #timer mh 1
scoreboard players operation #rem mh = #timer mh
scoreboard players operation #rem mh %= #20 mh
scoreboard players operation #sec mh = #timer mh
scoreboard players operation #sec mh /= #20 mh
execute if score #rem mh matches 0 run title @a actionbar [{"text":"Hunters released in ","color":"gray"},{"score":{"name":"#sec","objective":"mh"},"color":"red"},{"text":"s","color":"gray"}]
execute if score #timer mh matches ..0 run function manhunt:game/release
