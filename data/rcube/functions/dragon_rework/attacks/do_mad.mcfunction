execute if entity @s[scores={rcube.dragonRework_customDragonPhase=5}] in minecraft:the_end at @s run function rcube:dragon_rework/attacks/mad/teleport
execute if entity @s[scores={rcube.dragonRework_customDragonPhase=6}] in minecraft:the_end at @s run function rcube:dragon_rework/attacks/mad/lightning_start
# remove anvil attack in favour of something else
execute if entity @s[scores={rcube.dragonRework_customDragonPhase=7}] in minecraft:the_end at @s run function rcube:dragon_rework/attacks/mad/anvil
execute if entity @s[scores={rcube.dragonRework_customDragonPhase=8}] in minecraft:the_end at @s run function rcube:dragon_rework/attacks/mad/miniboss