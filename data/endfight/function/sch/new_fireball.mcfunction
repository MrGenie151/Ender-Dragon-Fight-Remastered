# summon temporary entity "in front of the player", if the player was standing at 0 0 0
execute positioned 0.0 0 0.0 run summon marker ^ ^ ^1 {Tags:["direction"]}

# summon the projectile entity (e.g. sheep, but can also be an arrow/snowball/etc. 
# When using a projectile, you might want to summon it in front of the player so it doesn't hit the player themselves)
# you might want to summon it at the players eyes as well using anchored eyes
summon fireball ^ ^ ^.1 {HasVisualFire:0b,ExplosionPower:5b,Motion:[0.0,-1.0,0.0],Tags:["fireball"],Item:{id:"minecraft:dragon_egg",Count:1b}}

# copy the markers position tag to the sheeps motion tag
data modify entity @e[type=fireball,tag=fireball,limit=1] Motion set from entity @e[type=marker,tag=direction,limit=1] Pos

# clean up
tag @e[tag=fireball] remove fireball
kill @e[tag=direction]