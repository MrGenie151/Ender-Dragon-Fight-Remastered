# Made by: @rcube.
# Register this datapack and all its dependencies
#
# Called By: #minecraft:load

tellraw @a {"text":"Dragon Rework","color":"dark_purple"}
scoreboard objectives add rcube.dragonRework_dragonAttackTimer dummy
scoreboard objectives add rcube.dragonRework_customDragonPhase dummy
scoreboard objectives add rcube.dragonRework_dragonHealth dummy
bossbar add rcube:dragon_rework.miniboss {"text":"Warrior of Years Past","color":"red","bold":false,"italic":false,"underlined":false}
bossbar set rcube:dragon_rework.miniboss color yellow
execute in minecraft:the_end unless entity @e[tag=dragon_rework.monumentMarker] run summon marker 0 200 0 {Tags:["dragon_rework.monumentMarker"]}

# Debug display
#scoreboard objectives setdisplay sidebar rcube.dragonRework_dragonAttackTimer