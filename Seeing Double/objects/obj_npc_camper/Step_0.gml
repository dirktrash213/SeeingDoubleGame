if !pitterPlayerIsPresent() exit;

image_xscale = obj_player_pitter.x > x ? -1 : 1;


if global.dialogueVariables.talkedToCamperTwice image_xscale = 1;