execute if score @s mh.t matches 240.. run return run function manhunt:bot/exit_state
execute unless items entity @s hotbar.1 #manhunt:blocks run return run function manhunt:bot/exit_state
execute if score @s mh.dh matches ..15 run return run function manhunt:bot/exit_state
execute if score @s mh.dy matches 25.. run return run function manhunt:bot/exit_state
execute if predicate manhunt:falling_far run return run function manhunt:bot/exit_state
# Solid ground two and three blocks further along (behind the bot): we reached land.
execute rotated ~180 0 positioned ^ ^-0.5 ^2 unless block ~ ~ ~ #manhunt:air positioned ^ ^ ^1 unless block ~ ~ ~ #manhunt:air run return run function manhunt:bot/exit_state
