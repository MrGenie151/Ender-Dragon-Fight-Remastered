# Phase 1
execute if entity @e[tag=musicPhase1] as @a[tag=playerMusic] at @s run stopsound @s record endfight:boss.phase1
execute if entity @e[tag=musicPhase1] as @a[tag=playerMusic] at @s run playsound endfight:boss.phase1 record @s 0 ~ 0 1 1 1

# MAD
execute if entity @e[tag=musicMAD] as @a[tag=playerMusicMAD] at @s run stopsound @s record endfight:boss.phase2
execute if entity @e[tag=musicMAD] as @a[tag=playerMusicMAD] at @s run playsound endfight:boss.phase2 record @s 0 ~ 0 1 1 1
