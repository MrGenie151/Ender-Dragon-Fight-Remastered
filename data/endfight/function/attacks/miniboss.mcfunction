##
 # miniboss.mcfunction
 # attacks
 #
 # Created by .
##

execute at @e[tag=monumentMarker,limit=1] unless entity @s[tag=spawnedMiniboss] unless entity @e[tag=miniboss] run summon skeleton ~ ~ ~ {CustomNameVisible:1b,Health:100f,Tags:["miniboss"],CustomName:{"bold":false,"color":"red","italic":false,"text":"Warrior of Years Past","underlined":false},equipment:{feet:{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:6911}}},legs:{id:"minecraft:golden_leggings",Count:1b,tag:{Enchantments:[{id:"minecraft:unbreaking",lvl:10s},{id:"minecraft:swift_sneak",lvl:1s}]}},chest:{id:"minecraft:diamond_chestplate",Count:1b,tag:{Enchantments:[{id:"minecraft:protection",lvl:4s},{id:"minecraft:fire_protection",lvl:4s},{id:"minecraft:blast_protection",lvl:4s}]}},head:{id:"minecraft:iron_helmet",Count:1b},mainhand:{id:"minecraft:bow",Count:1b,tag:{display:{Name:'{"text":"The Bow of Old","color":"dark_purple","italic":false}'},Enchantments:[{id:"minecraft:unbreaking",lvl:5s},{id:"minecraft:power",lvl:3s},{id:"minecraft:punch",lvl:3s},{id:"minecraft:flame",lvl:1s},{id:"minecraft:infinity",lvl:1s}]}}},attributes:[{id:"minecraft:follow_range",base:100},{id:"minecraft:max_health",base:100},{id:"minecraft:movement_speed",base:0.5}]}
execute unless entity @s[tag=spawnedMiniboss] run tag @s add spawnedMiniboss
