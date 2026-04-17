if !pitterPlayerIsPresent() exit;

image_xscale = -1;

//image_xscale = obj_player_pitter.x > x ? -1 : 1;

if global.dialogueVariables.solvedForestPuzzle sprite_index = spr_npc_explorer_happy;
if global.dialogueVariables.solvedCavePuzzle sprite_index = spr_npc_explorer_happy;
