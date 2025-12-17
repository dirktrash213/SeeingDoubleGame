//instance_create_layer(x,y,"Instances", obj_pickup_cherry);

if room == rm_forest_canopyUpperFloor_enemyMinigames global.dialogueVariables.beatMinigame = true;

with obj_interactable_switch_block_inert instance_destroy();

with obj_interactable_firework {
	
	triggered = true;
	
	if !audio_is_playing(sfx_cake_firework) audio_play_sound(sfx_cake_firework, 1, 0, 0.5, 0, 1.5);
	if !audio_is_playing(sfx_powerup) audio_play_sound(sfx_powerup, 1, 0, 0.5, 0, 2.0);

	instance_create_layer(x, y, "Instances", obj_interactable_fireworkBall);
	
}


with obj_trigger_dialogue allowSpecialDialogue = true;

audio_play_sound(sfx_pause, 1, 0, 1, 0, 2.0);

instance_destroy(other);
//instance_destroy(obj_enemy_beetle_dead);
//instance_create_layer(x, y, "Instances", obj_enemy_beetle_dead);
instance_destroy();





