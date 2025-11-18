if triggered exit;

triggered = true;

alarm[0] = respawnDuration;

//var _sparkleCount = 20;

//part_particles_create(global.particleSystemDevice, x, y, global.particleCoinSparkle, _sparkleCount);

audio_play_sound(sfx_collect_cherry, 1, 0);

sprite_index = emptySprite;



if pitterPlayerIsPresent() {

	obj_player_pitter.gemPowerupDoubleJump = true;
	obj_player_pitter.jumpMax = 2;
	
	if obj_player_pitter.jumpCount > 1 obj_player_pitter.jumpCount = 1;

}

if patterPlayerIsPresent() {

	obj_player_patter.gemPowerupDoubleJump = true;

}

//instance_destroy();


