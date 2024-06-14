tellraw @a {"text":"End fight remastered loaded.","color":"dark_purple"}
scoreboard objectives add dragonAttackTimer dummy
scoreboard objectives add customDragonPhase dummy
scoreboard objectives add dragonHealth dummy
scoreboard objectives add musicTimer dummy
bossbar add miniboss {"text":"Warrior of Years Past","color":"red","bold":false,"italic":false,"underlined":false}
bossbar set miniboss color yellow
#bossbar set miniboss players @a
execute in minecraft:the_end unless entity @e[tag=monumentMarker] run summon minecraft:armor_stand 0 200 0 {Tags:["monumentMarker"],Marker:1b,Invisible:1}
# Debug display
#scoreboard objectives setdisplay sidebar dragonAttackTimer