//show_debug_message("4eo8ijtoet")

if !canCollideWithPlayer2 || !global.coopActive exit;

//show_debug_message("4eo8ijtoet")

canCollideWithPlayer2 = false;

alarm[1] = collideCooldown2;

checkpointTouched();

saveGame();