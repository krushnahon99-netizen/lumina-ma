function manhunt:bot/bow_aim
execute if score @s mh.dh matches ..60 run return run function manhunt:bot/bow_release
execute if score @s mh.t matches 24.. run function manhunt:bot/bow_release
