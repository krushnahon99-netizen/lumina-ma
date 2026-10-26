# Plain `use` (no argument) releases the drawn bow and fires.
player @s use
scoreboard players operation @s mh.bcd = #bowcd mh
function manhunt:bot/exit_state
