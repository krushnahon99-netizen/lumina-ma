scoreboard players add @s mh.stk 1
execute rotated ~ 0 positioned ^ ^1.5 ^0.8 unless block ~ ~ ~ #manhunt:passable unless block ~ ~ ~ #manhunt:unmineable run return run function manhunt:bot/enter/mine
execute rotated ~ 0 positioned ^ ^0.5 ^0.8 unless block ~ ~ ~ #manhunt:passable unless block ~ ~ ~ #manhunt:unmineable run return run function manhunt:bot/enter/mine
player @s jump once
