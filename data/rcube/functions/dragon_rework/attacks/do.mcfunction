# Check and run
execute if entity @s[scores={rcube.dragonRework_customDragonPhase=1}] in minecraft:the_end at @s run function rcube:dragon_rework/attacks/normal/enderman_aggro
execute if entity @s[scores={rcube.dragonRework_customDragonPhase=2}] in minecraft:the_end at @s run function rcube:dragon_rework/attacks/normal/end_zombie
execute if entity @s[scores={rcube.dragonRework_customDragonPhase=3}] in minecraft:the_end at @s run function rcube:dragon_rework/attacks/normal/raining_fireballs
execute if entity @s[scores={rcube.dragonRework_customDragonPhase=4}] in minecraft:the_end at @s run function rcube:dragon_rework/attacks/normal/perch
execute if entity @s[tag=dragon_rework.MAD] run function rcube:dragon_rework/attacks/do_mad

# Increment + Cap phase (only if not mad)
scoreboard players add @s rcube.dragonRework_customDragonPhase 1
execute if entity @s[scores={rcube.dragonRework_customDragonPhase=5..},tag=!dragon_rework.MAD] run scoreboard players set @s rcube.dragonRework_customDragonPhase 1
execute if entity @s[scores={rcube.dragonRework_customDragonPhase=9..},tag=dragon_rework.MAD] run scoreboard players set @s rcube.dragonRework_customDragonPhase 1
