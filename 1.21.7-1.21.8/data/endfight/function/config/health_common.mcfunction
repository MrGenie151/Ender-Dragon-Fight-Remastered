scoreboard players operation MadThreshold EDFR.config = DragonHealth EDFR.config
scoreboard players operation MadThreshold EDFR.config /= DivisionConstant EDFR.config

execute in minecraft:the_end as @e[type=ender_dragon,tag=!engaged] run data merge entity @s {Health:9999f,attributes:[{id:max_health,base:9999}]}
execute in minecraft:the_end as @e[type=ender_dragon,tag=!engaged] store result entity @s attributes[0].base double 1.0 run scoreboard players get DragonHealth EDFR.config
execute in minecraft:the_end as @e[type=ender_dragon,tag=!engaged] store result entity @s Health double 1.0 run scoreboard players get DragonHealth EDFR.config

#scoreboard players set RunDragon EDFR.config 1
function endfight:open_config
