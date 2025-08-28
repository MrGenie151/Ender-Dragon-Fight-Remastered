tellraw @s ["",{"text":"\n\n\n\n\n"},{"text":"The Ender Dragon Fight Remastered","color":"dark_purple"},{"text":"\nConfiguration Menu"}]

execute if score MusicMode EDFR.config matches 1 run tellraw @s ["Music: ",{"clickEvent":{"action":"run_command","value":"/function endfight:config/music_off"},"color":"red","text":"[Off]"}," ",{"clickEvent":{"action":"run_command","value":"/function endfight:config/music_resource_pack"},"color":"green","text":"[Resource Pack]"}]
execute if score MusicMode EDFR.config matches 0 run tellraw @s ["Music: ",{"clickEvent":{"action":"run_command","value":"/function endfight:config/music_off"},"color":"green","text":"[Off]"}," ",{"clickEvent":{"action":"run_command","value":"/function endfight:config/music_resource_pack"},"color":"red","text":"[Resource Pack]"}]

tellraw @s ["Dragon Health: ",{"clickEvent":{"action":"run_command","value":"/function endfight:config/health_minus"},"color":"red","text":"-"}," ",{"score":{"name":"DragonHealth","objective":"EDFR.config"}}," ",{"clickEvent":{"action":"run_command","value":"/function endfight:config/health_add"},"color":"green","text":"+"}]
