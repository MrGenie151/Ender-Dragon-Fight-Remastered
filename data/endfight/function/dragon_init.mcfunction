scoreboard players set @s dragonAttackTimer 800
scoreboard players set @s customDragonPhase 1
data merge entity @s {Health:9999f,attributes:[{id:"minecraft:generic.max_health",base:9999}]}
execute store result entity @s attributes[{id:"minecraft:generic.max_health"}].base double 1.0 run scoreboard players get DragonHealth EDFR.config
execute store result entity @s Health double 1.0 run scoreboard players get DragonHealth EDFR.config
#execute as @e[type=minecraft:ender_dragon,tag=!ticked] run say hooray
kill @e[tag=crystal]
tag @e[tag=crystalInit] remove crystalInit
tag @s add ticked
