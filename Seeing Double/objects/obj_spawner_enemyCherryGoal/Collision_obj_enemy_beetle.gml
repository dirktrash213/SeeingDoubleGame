//instance_create_layer(x,y,"Instances", obj_pickup_cherry);

if room == rm_forest_canopyUpperFloor_enemyMinigames global.dialogueVariables.beatMinigame = true;

with obj_interactable_switch_block_inert instance_destroy();

with obj_trigger_dialogue allowSpecialDialogue = true;

audio_play_sound(sfx_pause, 1, 0, 1, 0, 2.0);

instance_destroy(other);
instance_destroy();





