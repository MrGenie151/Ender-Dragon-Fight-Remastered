execute in minecraft:the_end as @a[distance=..1000] at @s run summon armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Tags:["lightning"]}
function rcube:dragon_revamp/attacks/warning
schedule function rcube:dragon_revamp/sch/lightning_do 1s
#function rcube:dragon_revamp/sch/lightning_do