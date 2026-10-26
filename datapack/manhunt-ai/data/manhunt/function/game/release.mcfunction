scoreboard players set #state mh 2
title @a times 5 30 10
title @a title {"text":"RUN!","color":"red"}
title @a subtitle {"text":"The hunters are coming","color":"gray"}
execute as @a at @s run playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 0.5 1.4
tellraw @a [{"text":"[Manhunt] ","color":"gold"},{"text":"Hunters released!","color":"red"}]
