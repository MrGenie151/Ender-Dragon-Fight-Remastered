# Dragon Init
scoreboard players set @e[type=minecraft:ender_dragon,tag=!ticked] dragonAttackTimer 800
scoreboard players set @e[type=minecraft:ender_dragon,tag=!ticked] customDragonPhase 1
execute as @e[type=minecraft:ender_dragon,tag=!ticked] run data merge entity @s {Health:500f,Attributes:[{Name:generic.max_health,Base:500}]}
#execute as @e[type=minecraft:ender_dragon,tag=!ticked] run say hooray
execute as @e[type=minecraft:ender_dragon,tag=!ticked] run kill @e[tag=crystal]
execute as @e[type=minecraft:ender_dragon,tag=!ticked] run tag @e[tag=crystalInit] remove crystalInit
tag @e[type=minecraft:ender_dragon,tag=!ticked] add ticked
execute as @e[type=minecraft:ender_dragon,tag=ticked] if predicate endfight:is_aggro run say hi
execute as @e[type=minecraft:ender_dragon,tag=ticked] in minecraft:the_end run function endfight:dragon

#Registering end crystal respawn locations
execute as @e[type=minecraft:end_crystal,tag=!crystalInit] at @s run summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,PersistenceRequired:1b,Tags:["crystal"]}
tag @e[type=minecraft:end_crystal,tag=!crystalInit] add crystalInit

# End Zombie stuff
execute as @e[tag=endZombie] at @s unless block ~ ~ ~ air run tp ~ ~1 ~
execute as @e[tag=endZombie] at @s if entity @e[type=minecraft:arrow,distance=..5] run summon marker ~ ~ ~ {Tags:["arrow"]}
execute as @e[tag=endZombie] at @s run kill @e[type=minecraft:arrow,distance=..5]
execute as @e[tag=endZombie] at @s if entity @e[tag=arrow,distance=..5] run tp ^1 ^ ^
kill @e[tag=arrow]

# Stop the music if the Ender Dragon is dead
execute unless entity @e[tag=music] run stopsound @a record minecraft:end-fight.fight1
execute unless entity @e[tag=MAD] run stopsound @a record minecraft:end-fight.fight2

#Miniboss Bossbar stuff
execute as @e[tag=miniboss] at @s store result bossbar miniboss max run data get entity @s Attributes[3].Base
execute as @e[tag=miniboss] at @s store result bossbar miniboss value run data get entity @s Health
execute if entity @e[tag=miniboss] run bossbar set miniboss visible true
execute unless entity @e[tag=miniboss] run bossbar set miniboss visible false
bossbar set minecraft:miniboss players @a

# End Monument Marker needed. Does it exist? If not, spawn one in, and teleport it down
#execute in minecraft:the_end unless entity @e[tag=monumentMarker] run summon minecraft:armor_stand 0 200 0 {Tags:["monumentMarker"],Marker:1b,Invisible:1}
execute as @e[tag=monumentMarker] at @s if block ~ ~-1 ~ air run tp ~ ~-1 ~
