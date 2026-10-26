tag @s remove mh.idle
execute if entity @s[tag=mh.crit] run return run function manhunt:bot/crit_tick
function manhunt:bot/aim
player @s move forward
player @s sprint
execute if block ~ ~0.4 ~ #manhunt:liquid unless entity @s[tag=mh.swim] run function manhunt:bot/swim_on
execute if entity @s[tag=mh.swim] unless block ~ ~0.4 ~ #manhunt:liquid run function manhunt:bot/swim_off

# Fight when the runner is inside real reach.
execute if score @s mh.reach <= #reach mh if score @s mh.cd matches 0 run return run function manhunt:bot/melee
execute if score @s mh.reach <= #reach mh run return 0

# Runner towered up above us: build up next to them.
execute if score @s mh.dy matches 25.. if score @s mh.dh matches ..30 if predicate manhunt:on_ground if items entity @s hotbar.1 #manhunt:blocks run return run function manhunt:bot/enter/pillar
# Runner dug down right below us: dig after them.
execute if score @s mh.dy matches ..-30 if score @s mh.dh matches ..12 if predicate manhunt:on_ground run return run function manhunt:bot/enter/dig
# Gap (3+ deep) between us and the runner: bridge across.
execute if score @s mh.dh matches 20.. if score @s mh.dy matches -20.. if predicate manhunt:on_ground if items entity @s hotbar.1 #manhunt:blocks facing entity @a[tag=mh.runner,gamemode=!spectator,distance=0..,sort=nearest,limit=1] feet rotated ~ 0 positioned ^ ^-0.5 ^1.2 if block ~ ~ ~ #manhunt:air if block ~ ~-1 ~ #manhunt:air if block ~ ~-2 ~ #manhunt:air run return run function manhunt:bot/enter/bridge
# Mid range: take a bow shot.
execute if score #bow mh matches 1 if score @s mh.bcd matches 0 if score @s mh.dh matches 120..350 if score @s mh.dy matches -60..60 if items entity @s hotbar.3 minecraft:bow if items entity @s container.* minecraft:arrow if predicate manhunt:bow_chance run return run function manhunt:bot/enter/bow
# Out of combat and hurt or hungry: eat.
execute if score @s mh.ecd matches 0 if score @s mh.reach matches 80.. if items entity @s hotbar.4 #manhunt:food run function manhunt:bot/maybe_eat

function manhunt:bot/stuck
function manhunt:bot/catchup
