# Check and run
execute if entity @s[scores={rcube.dragonRework_customDragonPhase=1}] in minecraft:the_end at @s run function rcube:dragon_rework/attacks/enderman_aggro
execute if entity @s[scores={rcube.dragonRework_customDragonPhase=2}] in minecraft:the_end at @s run function rcube:dragon_rework/attacks/end_zombie
execute if entity @s[scores={rcube.dragonRework_customDragonPhase=3}] in minecraft:the_end at @s run function rcube:dragon_rework/attacks/raining_fireballs
execute if entity @s[scores={rcube.dragonRework_customDragonPhase=4}] in minecraft:the_end at @s run function rcube:dragon_rework/attacks/perch
execute if entity @s[tag=dragon_rework.MAD] run function rcube:dragon_rework/attacks/do_mad

# Increment + Cap phase (only if not mad)
scoreboard players add @s customDragonPhase 1
execute if entity @s[scores={rcube.dragonRework_customDragonPhase=5..},tag=!MAD] run scoreboard players set @s customDragonPhase 1
execute if entity @s[scores={rcube.dragonRework_customDragonPhase=9..},tag=MAD] run scoreboard players set @s customDragonPhase 1
