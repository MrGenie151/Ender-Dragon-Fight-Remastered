tellraw @s ["",{"text":"\n\n\n\n\n"},{"text":"The Ender Dragon Fight Remastered","color":"dark_purple"},{"text":"\nConfiguration Menu"}]

execute if score MusicMode EDFR.config matches 1 run tellraw @s ["Music: ",{"click_event":{"action":"run_command","command":"/function endfight:config/music_off"},"color":"red","text":"[Off]"}," ",{"click_event":{"action":"run_command","command":"/function endfight:config/music_resource_pack"},"color":"green","text":"[Resource Pack]"}]
execute if score MusicMode EDFR.config matches 0 run tellraw @s ["Music: ",{"click_event":{"action":"run_command","command":"/function endfight:config/music_off"},"color":"green","text":"[Off]"}," ",{"click_event":{"action":"run_command","command":"/function endfight:config/music_resource_pack"},"color":"red","text":"[Resource Pack]"}]

tellraw @s ["Dragon Health: ",{"click_event":{"action":"run_command","command":"/function endfight:config/health_minus"},"color":"red","text":"-"}," ",{"score":{"name":"DragonHealth","objective":"EDFR.config"}}," ",{"click_event":{"action":"run_command","command":"/function endfight:config/health_add"},"color":"green","text":"+"}]
