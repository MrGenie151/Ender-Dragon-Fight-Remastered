execute in minecraft:the_end as @a[distance=..1000] at @s run summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Tags:["fangs"]}
execute in minecraft:the_end as @a[distance=..1000] run function endfight:attacks/warning
schedule function endfight:sch/spawn_fangs 1s
