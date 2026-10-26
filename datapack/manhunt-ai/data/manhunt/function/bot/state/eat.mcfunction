function manhunt:bot/aim
execute if score @s mh.reach matches ..40 run return run function manhunt:bot/eat_done
execute if score @s mh.t matches 40.. run function manhunt:bot/eat_done
