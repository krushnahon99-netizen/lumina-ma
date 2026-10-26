# HeroBot aims from the bot's real eye position. The old vanilla `rotate ... facing` ran from the feet,
# which tilted the head up (about -28 degrees at 3 blocks) so swings went over the runner's head.
# Runner above: aim at the eyes so the swing clears the edge of the block they stand on.
execute if score @s mh.dy matches 5.. run return run player @s look upon @a[tag=mh.runner,gamemode=!spectator,distance=0..,sort=nearest,limit=1] eyes
player @s look upon @a[tag=mh.runner,gamemode=!spectator,distance=0..,sort=nearest,limit=1] closest
