if !pitterPlayerIsPresent() exit;

image_xscale = -1;

//image_xscale = obj_player_pitter.x > x ? -1 : 1;

if global.dialogueVariables.solvedForestPuzzle && room == rm_forest_spotTheDifference sprite_index = spr_npc_explorer_happy;
if global.dialogueVariables.solvedCavePuzzle && room == rm_cave_spotTheDifference sprite_index = spr_npc_explorer_happy;
