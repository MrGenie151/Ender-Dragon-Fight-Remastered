#Okay, dragon has been ticked off. time to do a really epic

#Timer and attack handling
execute if entity @s[tag=music] run scoreboard players remove @s dragonAttackTimer 1
#say haha
execute if entity @s[tag=music] if entity @s[scores={dragonAttackTimer=0}] run function endfight:attacks/do
execute if entity @s[tag=music] unless entity @s[tag=MAD] if entity @s[scores={dragonAttackTimer=0}] run scoreboard players set @s dragonAttackTimer 400
execute if entity @s[tag=music] if entity @s[tag=MAD] if entity @s[scores={dragonAttackTimer=0}] run scoreboard players set @s dragonAttackTimer 200

#Health handling
execute store result score @s dragonHealth run data get entity @s Health
execute if entity @s[scores={dragonHealth=..499},tag=!music] run playsound minecraft:end-fight.fight1 record @a ~ ~ ~ 1 1 1
execute if entity @s[scores={dragonHealth=..499},tag=!music] run function endfight:dragontitle
execute if entity @s[scores={dragonHealth=..499},tag=!music] run tag @s add music
execute if entity @s[tag=music] run stopsound @a music

#Handle becoming MAD
execute if entity @s[scores={dragonHealth=0..250},tag=!MAD] run execute in minecraft:the_end as @e[tag=crystal,limit=3] at @s run summon minecraft:end_crystal ~ ~ ~ {Tags:["crystalInit"]}
execute if entity @s[scores={dragonHealth=0..250},tag=!MAD] run stopsound @a record
execute if entity @s[scores={dragonHealth=0..250},tag=!MAD] run playsound minecraft:end-fight.fight2 record @a ~ ~ ~ 1 1 1
execute if entity @s[scores={dragonHealth=0..250},tag=!MAD] run tag @s add MAD
execute if entity @s[tag=MAD] at @s run particle portal ~ ~ ~ 3 3 3 1 50 force

#Handle Death
execute if entity @s[scores={dragonHealth=0}] run stopsound @a record

#Remove beds
#fill ~8 ~8 ~8 ~-8 ~-8 ~-8 air replace #minecraft:beds

#miniboss check
execute if entity @e[tag=miniboss] run tp 0 100 0