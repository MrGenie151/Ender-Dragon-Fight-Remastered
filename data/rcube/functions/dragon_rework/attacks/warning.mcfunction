# Made by: @rcube.
# Okay, dragon has been ticked off. time to do a really epic
#
# Called By:
#   rcube:dragon_rework/attacks/normal/lightning_start
#   rcube:dragon_rework/attacks/normal/anvil
# Ran as: Player

playsound entity.experience_orb.pickup master @a ~ ~ ~ 1 1 1
title @a[predicate=rcube:dragon_rework/end_centre] times 5t 1s 10t
title @a[predicate=rcube:dragon_rework/end_centre] title ""
title @a[predicate=rcube:dragon_rework/end_centre] subtitle {"text":">> Watch out! <<","color":"red"}
