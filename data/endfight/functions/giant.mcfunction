execute as @e[tag=giant_brain] at @s unless entity @e[type=minecraft:giant,dy=-10] run kill @s

execute at @s run effect give @a[distance=..3] minecraft:instant_damage 1 0 true