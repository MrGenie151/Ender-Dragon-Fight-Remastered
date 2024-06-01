# Made by: @rcube.
# Okay, dragon has been ticked off. time to do a really epic
#
# Called By: rcube:dragon_rework/tick
# Ran as: Entity, Ender Dragon (dragonInit = true)

# Timer + Attack handling
execute if entity @s[tag=dragon_rework.music] run scoreboard players remove @s rcube.dragonRework_dragonAttackTimer 1
execute if entity @s[tag=dragon_rework.music] if entity @s[scores={rcube.dragonRework_dragonAttackTimer=0}] run function rcube:dragon_rework/attacks/do
execute if entity @s[tag=dragon_rework.music] unless entity @s[tag=dragon_rework.MAD] if entity @s[scores={rcube.dragonRework_dragonAttackTimer=0}] run scoreboard players set @s rcube.dragonRework_dragonAttackTimer 400
execute if entity @s[tag=dragon_rework.music] if entity @s[tag=dragon_rework.MAD] if entity @s[scores={rcube.dragonRework_dragonAttackTimer=0}] run scoreboard players set @s rcube.dragonRework_dragonAttackTimer 200

# Health handling
execute store result score @s rcube.dragonRework_dragonHealth run data get entity @s Health
execute if entity @s[scores={rcube.dragonRework_dragonHealth=..499},tag=!dragon_rework.music] run playsound rcube:dragon_rework/fight1 record @a ~ ~ ~ 1 1 1
execute if entity @s[scores={rcube.dragonRework_dragonHealth=..499},tag=!dragon_rework.music] run function rcube:dragon_rework/dragontitle
execute if entity @s[scores={rcube.dragonRework_dragonHealth=..499},tag=!dragon_rework.music] run tag @s add dragon_rework.music
execute if entity @s[tag=dragon_rework.music] run stopsound @a music

# Handle becoming MAD
execute if entity @s[scores={rcube.dragonRework_dragonHealth=0..250},tag=!dragon_rework.MAD] run execute in minecraft:the_end as @e[tag=dragon_rework.crystal,sort=random,limit=3] at @s run summon minecraft:end_crystal ~ ~ ~ {Tags:["dragon_rework.crystalInit"]}
execute if entity @s[scores={rcube.dragonRework_dragonHealth=0..250},tag=!dragon_rework.MAD] run stopsound @a record rcube:dragon_rework/fight1
execute if entity @s[scores={rcube.dragonRework_dragonHealth=0..250},tag=!dragon_rework.MAD] run playsound rcube:dragon_rework/fight2 record @a ~ ~ ~ 1 1 1
execute if entity @s[scores={rcube.dragonRework_dragonHealth=0..250},tag=!dragon_rework.MAD] run tag @s add dragon_rework.MAD
execute if entity @s[tag=dragon_rework.MAD] at @s run particle portal ~ ~ ~ 3 3 3 1 50 force

# Handle Death
execute if entity @s[scores={rcube.dragonRework_dragonHealth=0}] run stopsound @a record rcube:dragon_rework/fight1
execute if entity @s[scores={rcube.dragonRework_dragonHealth=0}] run stopsound @a record rcube:dragon_rework/fight2
kill @e[tag=dragon_rework.removeAfterDeath]

# Remove beds
#fill ~8 ~8 ~8 ~-8 ~-8 ~-8 air replace #minecraft:beds

# Miniboss check
execute if entity @e[tag=dragon_rework.miniboss] run tp 0 100 0