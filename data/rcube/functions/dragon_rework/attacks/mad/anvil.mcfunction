function rcube:dragon_revamp/attacks/warning
execute as @a[predicate=rcube:dragon_rework/end_centre] at @s run summon falling_block ~ ~20 ~ {BlockState:{Name:"minecraft:anvil"},Time:1,DropItem:0b,HurtEntities:1b,FallHurtMax:40,FallHurtAmount:5f}