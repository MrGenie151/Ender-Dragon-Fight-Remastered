#execute as @s in minecraft:the_end run summon fireball ^ ^-5 ^15 {HasVisualFire:0b,ExplosionPower:5b,power:[0.0,-1.0,0.0],Tags:["drago"],Item:{id:"minecraft:dragon_egg",Count:1b}}
#say haha
execute positioned 0. 0 0. run summon fireball ^ ^ ^.1 {HasVisualFire:0b,ExplosionPower:5b,power:[0.0,-1.0,0.0],Tags:["fireball"],Item:{id:"minecraft:dragon_egg",Count:1b}}
execute as @e[tag=fireball] run data modify entity @s power set from entity @s Pos
execute as @e[tag=fireball] run data modify entity @s Owner set from entity @s UUID
tp @e[tag=fireball] ~ ~ ~
tag @e remove fireball