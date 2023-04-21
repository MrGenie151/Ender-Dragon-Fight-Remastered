# Check and run
execute if entity @s[scores={customDragonPhase=1}] in minecraft:the_end at @s run function endfight:attacks/enderman_aggro
execute if entity @s[scores={customDragonPhase=2}] in minecraft:the_end at @s run function endfight:attacks/shulker
execute if entity @s[scores={customDragonPhase=3}] in minecraft:the_end at @s run function endfight:attacks/raining_fireballs
execute if entity @s[tag=MAD] run function endfight:attacks/do_mad

#Increment and cap Phase (if not mad of course)
scoreboard players add @s customDragonPhase 1
execute if entity @s[scores={customDragonPhase=4..},tag=!MAD] run scoreboard players set @s customDragonPhase 1
execute if entity @s[scores={customDragonPhase=7..},tag=MAD] run scoreboard players set @s customDragonPhase 1
