##
 # perch.mcfunction
 # attacks
 #
 # Created by .
##

execute unless entity @s[tag=MAD] run data modify entity @s DragonPhase set value 3
execute if entity @s[tag=MAD] run function rcube:dragon_revamp/sch/fireball
