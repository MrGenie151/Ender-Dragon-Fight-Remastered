execute at @s run tag @e[type=minecraft:enderman,limit=5,sort=nearest] add ANGRY
execute at @s run tag @r add VICTIM
#execute as @a[tag=VICTIM] run say HELP IM BEING TARGETED
execute as @e[tag=ANGRY] run data modify entity @s AngerTime set value 1200
execute as @e[tag=ANGRY] run data modify entity @s AngryAt set from entity @a[tag=VICTIM,limit=1] UUID
tag @e[tag=ANGRY] remove ANGRY
tag @e[tag=VICTIM] remove VICTIM