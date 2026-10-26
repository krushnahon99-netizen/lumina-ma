# Aim a little above the eyes to cancel arrow drop: about 0.19 degrees per block of distance.
execute store result storage manhunt:tmp bow.p float 0.019 run scoreboard players get @s mh.dh
function manhunt:bot/bow_aim_at with storage manhunt:tmp bow
