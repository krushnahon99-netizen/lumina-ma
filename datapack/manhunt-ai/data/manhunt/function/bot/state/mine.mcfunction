# Clear a 2-high hole in front: head block first, then feet block.
execute if score @s mh.t matches 120.. run return run function manhunt:bot/exit_state
execute if score @s mh.reach <= #reach mh run return run function manhunt:bot/exit_state
execute rotated ~ 0 positioned ^ ^1.5 ^0.8 unless block ~ ~ ~ #manhunt:passable unless block ~ ~ ~ #manhunt:unmineable align xyz positioned ~0.5 ~0.5 ~0.5 run return run player @s look at ~ ~ ~
execute rotated ~ 0 positioned ^ ^0.5 ^0.8 unless block ~ ~ ~ #manhunt:passable unless block ~ ~ ~ #manhunt:unmineable align xyz positioned ~0.5 ~0.5 ~0.5 run return run player @s look at ~ ~ ~
function manhunt:bot/exit_state
