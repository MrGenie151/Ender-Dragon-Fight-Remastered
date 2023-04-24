tellraw @a {"text":"End fight remastered loaded.","color":"dark_purple"}
scoreboard objectives add dragonAttackTimer dummy
scoreboard objectives add customDragonPhase dummy
scoreboard objectives add dragonHealth dummy
bossbar add miniboss {"text":"Warrior of Years Past","color":"red","bold":false,"italic":false,"underlined":false}
bossbar set miniboss color yellow
# Debug display
#scoreboard objectives setdisplay sidebar dragonAttackTimer