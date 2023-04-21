# Dragon Init
scoreboard players set @e[type=minecraft:ender_dragon,tag=!ticked] dragonAttackTimer 800
scoreboard players set @e[type=minecraft:ender_dragon,tag=!ticked] customDragonPhase 1
execute as @e[type=minecraft:ender_dragon,tag=!ticked] run data merge entity @s {Health:750f,Attributes:[{Name:generic.max_health,Base:750}]}
#execute as @e[type=minecraft:ender_dragon,tag=!ticked] run say hooray
execute as @e[type=minecraft:ender_dragon,tag=!ticked] run kill @e[tag=crystal]
execute as @e[type=minecraft:ender_dragon,tag=!ticked] run tag @e[tag=crystalInit] remove crystalInit
tag @e[type=minecraft:ender_dragon,tag=!ticked] add ticked
execute as @e[type=minecraft:ender_dragon,tag=ticked] if predicate endfight:is_aggro run say hi
execute as @e[type=minecraft:ender_dragon,tag=ticked] in minecraft:the_end run function endfight:dragon

#Registering end crystal respawn locations
execute as @e[type=minecraft:end_crystal,tag=!crystalInit] at @s run summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,PersistenceRequired:1b,Tags:["crystal"]}
tag @e[type=minecraft:end_crystal,tag=!crystalInit] add crystalInit

# Giant Stuff
execute as @e[type=minecraft:giant,tag=!init] at @s run summon giant ~ ~ ~ {Tags:["init","giant"],Passengers:[{id:"minecraft:zombie",NoAI:0b,Tags:["giant_brain","giant"],ActiveEffects:[{Id:14,Amplifier:1b,Duration:999999999999,ShowParticles:0b}]}],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTJhZjYyMzE4OTBiNjQ4MWFkN2Y5NWQxNTBhYzRkNDM3NDA1ODFlZjhiYTA3OTQ0ODc4M2VmYmVlOGVlZjljMCJ9fX0="}}]}
execute as @e[type=minecraft:giant,tag=!init] at @s run tp @s 0 0 0
execute as @e[tag=giant] unless entity @s[tag=!init] run function endfight:giant

# End Zombie stuff
execute as @e[tag=endZombie] at @s unless block ~ ~ ~ air run tp ~ ~1 ~

# Stop the music if the Ender Dragon is dead
execute unless entity @e[tag=music] run stopsound @a record minecraft:end-fight.fight1
execute unless entity @e[tag=MAD] run stopsound @a record minecraft:end-fight.fight2
