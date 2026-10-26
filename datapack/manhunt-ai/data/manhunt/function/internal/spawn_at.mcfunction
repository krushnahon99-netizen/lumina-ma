$playerspawn $(name) at $(x) $(y) $(z) facing $(yaw) 0 in survival on $(dim)
# The bot can join several seconds late on a lagging server, so setup is retried; it only runs once per bot.
$delayed tickDelay 5 command execute as $(name) run function manhunt:bot/setup
$delayed tickDelay 20 command execute as $(name) run function manhunt:bot/setup
$delayed tickDelay 40 command execute as $(name) run function manhunt:bot/setup
$delayed tickDelay 80 command execute as $(name) run function manhunt:bot/setup
$delayed tickDelay 160 command execute as $(name) run function manhunt:bot/setup
$delayed tickDelay 300 command execute as $(name) run function manhunt:bot/setup
$tellraw @a [{"text":"[Manhunt] ","color":"gold"},{"text":"Spawning hunter $(name)...","color":"gray"}]
