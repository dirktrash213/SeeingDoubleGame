if coinsCollected == coinsNeeded {

	with instance_create_layer(x, y, "Collectables", obj_pickup_cherry) {
	
		redCoinCherry = true;
	
	}
	
	audio_play_sound(sfx_pause, 1, 0, 1, 0, 2.0);

	instance_destroy();

}







