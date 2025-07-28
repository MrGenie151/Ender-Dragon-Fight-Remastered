#Okay, dragon has been ticked off. time to do a really epic

#Timer and attack handling
execute if entity @s[tag=music] run scoreboard players remove @s dragonAttackTimer 1
#say haha
execute if entity @s[tag=music] if entity @s[scores={dragonAttackTimer=0}] run function endfight:attacks/do
execute if entity @s[tag=music] unless entity @s[tag=MAD] if entity @s[scores={dragonAttackTimer=..0}] run scoreboard players set @s dragonAttackTimer 400
execute if entity @s[tag=music] if entity @s[tag=MAD] if entity @s[scores={dragonAttackTimer=..0}] run scoreboard players set @s dragonAttackTimer 200

#Health handling
execute store result score @s dragonHealth run data get entity @s Health
execute if score @s dragonHealth < DragonHealth EDFR.config if entity @s[tag=!music] run function endfight:dragontitle
execute if score @s dragonHealth < DragonHealth EDFR.config if entity @s[tag=!engaged] run tag @s add engaged

# Music handling
## Timer
execute as @a[tag=playerMusic,tag=!playerMusic.timerInit] run scoreboard players set @s musicTimer 1
execute as @a[tag=playerMusic,tag=!playerMusic.timerInit] run tag @s add playerMusic.timerInit
execute as @a[tag=playerMusicMAD,tag=!playerMusicMAD.timerInit] run scoreboard players set @s musicTimer 1
execute as @a[tag=playerMusicMAD,tag=!playerMusicMAD.timerInit] run tag @s add playerMusicMAD.timerInit
execute as @a[tag=playerMusic,tag=!playerMusicMAD] run scoreboard players remove @s musicTimer 1
execute as @a[tag=playerMusicMAD] run scoreboard players remove @s musicTimer 1
execute if score MusicMode EDFR.config matches 1 as @a[tag=playerMusic,tag=!playerMusicMAD] if entity @s[scores={musicTimer=0}] run function endfight:music
execute if score MusicMode EDFR.config matches 1 as @a[tag=playerMusicMAD] if entity @s[scores={musicTimer=0}] run function endfight:music
execute as @a[tag=playerMusic,tag=!playerMusicMAD] if entity @s[scores={musicTimer=0}] run scoreboard players set @s musicTimer 5377
execute as @a[tag=playerMusicMAD] if entity @s[scores={musicTimer=0}] run scoreboard players set @s musicTimer 5131
execute if entity @s[tag=music] run stopsound @a[distance=..500] music
## Play
# Phase 1
execute if score @s dragonHealth < DragonHealth EDFR.config if entity @s[tag=!MAD] run tag @s add musicPhase1
execute if entity @s[tag=musicPhase1] as @a[predicate=endfight:end_centre,tag=!playerMusic] run tag @s add playerMusic
execute if entity @s[tag=musicPhase1,tag=!music] run tag @s add music
# MAD
execute if score @s dragonHealth < MadThreshold EDFR.config run tag @s add musicMAD
execute if entity @s[tag=musicMAD,tag=musicPhase1] run tag @s remove musicPhase1
execute if entity @s[tag=musicMAD] as @a[predicate=endfight:end_centre,tag=!playerMusicMAD.init] run stopsound @s record endfight:boss.phase1
execute if entity @s[tag=musicMAD] as @a[predicate=endfight:end_centre,tag=!playerMusicMAD.init] run tag @s add playerMusicMAD.init
execute if entity @s[tag=musicMAD] as @a[predicate=endfight:end_centre,tag=playerMusicMAD.init] run tag @s add playerMusicMAD
## If player dies or goes to outer end island
execute as @a[predicate=!endfight:end_centre,tag=playerMusic.timerInit] run scoreboard players reset @s musicTimer
# Phase 1
execute as @a[predicate=!endfight:end_centre,tag=playerMusic] run tag @s remove playerMusic
execute as @a[predicate=!endfight:end_centre,tag=playerMusic.timerInit] run tag @s remove playerMusic.timerInit
execute as @a[predicate=!endfight:end_centre] run stopsound @s record endfight:boss.phase1
# MAD
execute as @a[predicate=!endfight:end_centre,tag=playerMusicMAD] run tag @s remove playerMusicMAD
execute as @a[predicate=!endfight:end_centre,tag=playerMusicMAD.timerInit] run tag @s remove playerMusicMAD.timerInit
execute as @a[predicate=!endfight:end_centre,tag=playerMusicMAD.init] run tag @s remove playerMusicMAD.init
execute as @a[predicate=!endfight:end_centre] run stopsound @s record endfight:boss.phase2

# Non-music
execute if score @s dragonHealth < MadThreshold EDFR.config if entity @s[tag=!MAD] run execute in minecraft:the_end as @e[tag=crystal,limit=3] at @s run summon minecraft:end_crystal ~ ~ ~ {Tags:["crystalInit"]}
execute if score @s dragonHealth < MadThreshold EDFR.config if entity @s[tag=!MAD] run tag @s add MAD
execute if entity @s[tag=MAD] at @s run particle portal ~ ~ ~ 3 3 3 1 50 force

#Remove beds
#fill ~8 ~8 ~8 ~-8 ~-8 ~-8 air replace #minecraft:beds

#miniboss check
execute if entity @e[tag=miniboss] run tp 0 100 0