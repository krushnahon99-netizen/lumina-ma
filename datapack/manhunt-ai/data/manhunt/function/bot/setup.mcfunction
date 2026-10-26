execute unless entity @s[type=player] run return 0
execute if score @s mh.sess = #session mh run return 0
scoreboard players operation @s mh.sess = #session mh
tag @s add mh.bot
team join mh.hunters @s
gamemode survival @s
player @s autojump true
scoreboard players set @s mh.deaths 0
scoreboard players set @s mh.bcd 100
scoreboard players set @s mh.ecd 0
function manhunt:bot/kit
function manhunt:bot/reset
tellraw @a [{"text":"[Manhunt] ","color":"gold"},{"selector":"@s","color":"red"},{"text":" is ready to hunt.","color":"gray"}]
