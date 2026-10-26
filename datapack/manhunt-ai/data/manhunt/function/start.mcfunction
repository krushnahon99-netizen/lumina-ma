execute unless entity @a[tag=mh.runner] run return run tellraw @a {"text":"[Manhunt] No runner yet. Run /function manhunt:runner first.","color":"red"}
execute unless entity @a[tag=mh.bot] run return run tellraw @a {"text":'[Manhunt] No hunters yet. Use /function manhunt:spawn {name:"hunter1"}',"color":"red"}
scoreboard players set @a mh.deaths 0
execute as @a[tag=mh.bot] run function manhunt:bot/reset
scoreboard players operation #timer mh = #headstart mh
scoreboard players operation #timer mh *= #20 mh
scoreboard players set #state mh 1
title @a times 5 40 10
title @a title {"text":"MANHUNT","color":"gold"}
title @a subtitle [{"text":"Runner head start: ","color":"gray"},{"score":{"name":"#headstart","objective":"mh"},"color":"yellow"},{"text":"s","color":"gray"}]
tellraw @a [{"text":"[Manhunt] ","color":"gold"},{"text":"The hunt begins! Hunters are frozen for ","color":"gray"},{"score":{"name":"#headstart","objective":"mh"},"color":"yellow"},{"text":" seconds.","color":"gray"}]
execute if score #timer mh matches ..0 run function manhunt:game/release
