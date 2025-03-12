# Dragon Init
scoreboard players set @e[type=minecraft:ender_dragon,tag=!ticked] dragonAttackTimer 800
scoreboard players set @e[type=minecraft:ender_dragon,tag=!ticked] customDragonPhase 1
execute as @e[type=minecraft:ender_dragon,tag=!ticked] run data merge entity @s {Health:500f,attributes:[{id:max_health,base:500}]}
#execute as @e[type=minecraft:ender_dragon,tag=!ticked] run say hooray
execute as @e[type=minecraft:ender_dragon,tag=!ticked] run kill @e[tag=crystal]
execute as @e[type=minecraft:ender_dragon,tag=!ticked] run tag @e[tag=crystalInit] remove crystalInit
tag @e[type=minecraft:ender_dragon,tag=!ticked,nbt={attributes:[{}]}] add ticked
#execute as @e[type=minecraft:ender_dragon,tag=ticked] if predicate endfight:is_aggro run say hi
execute as @e[type=minecraft:ender_dragon,tag=ticked] in minecraft:the_end run function endfight:dragon

#Registering end crystal respawn locations
execute as @e[type=minecraft:end_crystal,tag=!crystalInit] at @s run summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,PersistenceRequired:1b,Tags:["crystal"]}
tag @e[type=minecraft:end_crystal,tag=!crystalInit] add crystalInit

# End Zombie stuff
execute as @e[type=minecraft:zombie,tag=endZombie] at @s unless block ~ ~ ~ air run tp ~ ~1 ~
execute as @e[type=minecraft:zombie,tag=endZombie] at @s if entity @e[type=minecraft:arrow,distance=..3] run tp ^1 ^ ^

# Stop the music if the Ender Dragon is dead
execute unless entity @e[type=minecraft:ender_dragon,tag=ticked] run function endfight:endmusic
execute unless entity @e[tag=music] run stopsound @a record endfight:boss.phase1
execute unless entity @e[tag=MAD] run stopsound @a record endfight:boss.phase2

#Miniboss Bossbar stuff
execute as @e[type=minecraft:skeleton,tag=miniboss] at @s store result bossbar miniboss max run data get entity @s attributes[3].base
execute as @e[type=minecraft:skeleton,tag=miniboss] at @s store result bossbar miniboss value run data get entity @s Health
execute if entity @e[type=minecraft:skeleton,tag=miniboss] run bossbar set miniboss visible true
execute unless entity @e[type=minecraft:skeleton,tag=miniboss] run bossbar set miniboss visible false
bossbar set minecraft:miniboss players @a

# End Monument Marker needed. Does it exist? If not, spawn one in, and teleport it down
#execute in minecraft:the_end unless entity @e[tag=monumentMarker] run summon minecraft:armor_stand 0 200 0 {Tags:["monumentMarker"],Marker:1b,Invisible:1}
execute as @e[type=armor_stand,tag=monumentMarker] at @s if block ~ ~-1 ~ air run tp ~ ~-1 ~
