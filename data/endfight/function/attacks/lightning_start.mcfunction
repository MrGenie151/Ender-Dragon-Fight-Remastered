execute in minecraft:the_end as @a[distance=..1000] at @s run summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Tags:["lightning"]}
execute in minecraft:the_end as @a[distance=..1000] run function endfight:attacks/warning
schedule function endfight:sch/lightning_do 1s
#function endfight:sch/lightning_do
