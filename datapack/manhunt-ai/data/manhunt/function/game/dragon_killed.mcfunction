advancement revoke @s only manhunt:dragon
execute if entity @s[tag=mh.runner] if score #state mh matches 2 run function manhunt:game/runner_win
