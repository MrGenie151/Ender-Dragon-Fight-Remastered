# Dragon Init
execute as @e[type=ender_dragon,tag=!ticked] run function endfight:dragon_init
execute as @e[type=minecraft:ender_dragon,tag=ticked] if predicate endfight:is_aggro run say hi
execute as @e[type=minecraft:ender_dragon,tag=ticked] in minecraft:the_end run function endfight:dragon

#Registering end crystal respawn locations
execute as @e[type=minecraft:end_crystal,tag=!crystalInit] at @s run summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,PersistenceRequired:1b,Tags:["crystal"]}
tag @e[type=minecraft:end_crystal,tag=!crystalInit] add crystalInit

# End Zombie stuff
execute as @e[tag=endZombie] at @s unless block ~ ~ ~ air run tp ~ ~1 ~
execute as @e[tag=endZombie] at @s if entity @e[type=minecraft:arrow,distance=..3] run tp ^1 ^ ^
execute as @e[tag=endZombie,type=zombie] run effect give @s slow_falling 1 0 true

# Stop the music if the Ender Dragon is dead
execute unless entity @e[tag=ticked] run scoreboard players reset * musicTimer
execute unless entity @e[tag=music] run stopsound @a record endfight:boss.phase1
execute unless entity @e[tag=MAD] run stopsound @a record endfight:boss.phase2
execute unless entity @e[tag=ticked] run tag @a[tag=playerMusic] remove playerMusic
execute unless entity @e[tag=ticked] run tag @a[tag=playerMusic.timerInit] remove playerMusic.timerInit
execute unless entity @e[tag=ticked] run tag @a[tag=playerMusicMAD] remove playerMusicMAD
execute unless entity @e[tag=ticked] run tag @a[tag=playerMusicMAD.init] remove playerMusicMAD.init
execute unless entity @e[tag=ticked] run tag @a[tag=playerMusicMAD.timerInit] remove playerMusicMAD.timerInit
execute unless entity @e[tag=ticked] run scoreboard players reset * dragonAttackTimer
execute unless entity @e[tag=ticked] run scoreboard players reset * dragonHealth
execute unless entity @e[tag=ticked] run scoreboard players reset * customDragonPhase

#Miniboss Bossbar stuff
execute as @e[tag=miniboss] at @s store result bossbar miniboss max run data get entity @s attributes[{id:"minecraft:max_health"}].base
execute as @e[tag=miniboss] at @s store result bossbar miniboss value run data get entity @s Health
execute if entity @e[tag=miniboss] run bossbar set miniboss visible true
execute unless entity @e[tag=miniboss] run bossbar set miniboss visible false
bossbar set minecraft:miniboss players @a

# End Monument Marker needed. Does it exist? If not, spawn one in, and teleport it down
#execute in minecraft:the_end unless entity @e[tag=monumentMarker] run summon minecraft:armor_stand 0 200 0 {Tags:["monumentMarker"],Marker:1b,Invisible:1}
execute as @e[tag=monumentMarker] at @s if block ~ ~-1 ~ air run tp ~ ~-1 ~
