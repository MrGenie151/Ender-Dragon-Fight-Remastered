#scoreboard players set RunDragon EDFR.config 0
execute unless score DragonHealth EDFR.config matches 200 run scoreboard players remove DragonHealth EDFR.config 10
function endfight:config/health_common
