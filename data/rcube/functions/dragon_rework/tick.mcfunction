# Made by: @rcube.
#
# Called By: #minecraft:tick

# Dragon Init
scoreboard players set @e[type=minecraft:ender_dragon,tag=!dragon_rework.dragonInit] rcube.dragonRework_dragonAttackTimer 800
scoreboard players set @e[type=minecraft:ender_dragon,tag=!dragon_rework.dragonInit] rcube.dragonRework_customDragonPhase 1
execute as @e[type=minecraft:ender_dragon,tag=!dragon_rework.dragonInit] run data merge entity @s {Health:500f,Attributes:[{Name:generic.max_health,Base:500}]}
execute as @e[type=minecraft:ender_dragon,tag=!dragon_rework.dragonInit] run kill @e[tag=crystal]
execute as @e[type=minecraft:ender_dragon,tag=!dragon_rework.dragonInit] run tag @e[tag=crystalInit] remove dragon_rework.crystalInit
tag @e[type=minecraft:ender_dragon,tag=!dragon_rework.dragonInit] add dragon_rework.dragonInit
execute as @e[type=minecraft:ender_dragon,tag=dragon_rework.dragonInit] in minecraft:the_end run function rcube:dragon_rework/dragon

# DEBUG
#execute as @e[type=minecraft:ender_dragon,tag=ticked] if predicate rcube:dragon_rework/is_aggro run say hi

# Register End Crystal locations
execute as @e[type=minecraft:end_crystal,tag=!dragon_rework.crystalInit] at @s run summon marker ~ ~ ~ {Tags:["dragon_rework.crystal"]}
tag @e[type=minecraft:end_crystal,tag=!dragon_rework.crystalInit] add dragon_rework.crystalInit

# End Zombies   
execute as @e[tag=dragon_rework.endZombie] at @s unless block ~ ~ ~ air run tp ~ ~1 ~
execute as @e[tag=dragon_rework.endZombie] at @s if entity @e[type=minecraft:arrow,distance=..3] run tp ^1 ^ ^

# Stop the music if the Ender Dragon is dead
execute unless entity @e[tag=dragon_rework.music] run stopsound @a record rcube:dragon_rework/fight1
execute unless entity @e[tag=dragon_rework.MAD] run stopsound @a record rcube:dragon_rework/fight2

# Miniboss Bossbars
execute as @e[tag=dragon_rework.miniboss] at @s store result bossbar rcube:dragon_rework.miniboss max run data get entity @s Attributes[3].Base
execute as @e[tag=dragon_rework.miniboss] at @s store result bossbar rcube:dragon_rework.miniboss value run data get entity @s Health
execute if entity @e[tag=dragon_rework.miniboss] run bossbar set rcube:dragon_rework.miniboss visible true
execute unless entity @e[tag=dragon_rework.miniboss] run bossbar set rcube:dragon_rework.miniboss visible false
bossbar set rcube:dragon_rework.miniboss players @a

# End Monument Marker needed. Does it exist? If not, spawn one in, and teleport it down
#execute in minecraft:the_end unless entity @e[tag=monumentMarker] run summon minecraft:armor_stand 0 200 0 {Tags:["monumentMarker"],Marker:1b,Invisible:1}
execute as @e[tag=dragon_rework.monumentMarker] at @s if block ~ ~-1 ~ air run tp ~ ~-1 ~
