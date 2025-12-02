/// @description Particles

//if happyPicnic {
if global.titleScreenCutsceneState == TITLE_SCREEN_CUTSCENE_STATE.ON_MENU 
|| global.titleScreenCutsceneState == TITLE_SCREEN_CUTSCENE_STATE.STARTING_CUTSCENE 
|| global.titleScreenCutsceneState == TITLE_SCREEN_CUTSCENE_STATE.PITTER_PATTER_HUGGING {

	var _offsetY = -10;

	var _particleToSpawn;

	if object_index == obj_player_pitter _particleToSpawn = global.particleHeartPink;
	if object_index == obj_player_patter _particleToSpawn = global.particleHeartBlue;

	part_particles_create(global.particleSystemHearts, x, y + _offsetY, _particleToSpawn, 1);

	var _r = random_range(-6.0, 6.0);

	alarm[0] = heartParticleSpawnRate + _r;
	
	//audio_play_sound(sfx_mouseChirp, 1, 0, 0.1, 0, 6.0);
	audio_play_sound(sfx_mouseChirp, 1, 0, 1.0, 0, 6.0);
	//audio_play_sound(sfx_collect_cherry, 1, 0, 1.0, 0, 6.0);

}

if searchingForPatterPicnic {
	
	var _offsetY = -16;

	part_particles_create(global.particleSystemHearts, x, y + _offsetY, global.particleWherePatter, 1);
	
	audio_play_sound(sfx_mouseChirp, 1, 0, 0.5, 0, 1.2);
	
	alarm[0] = wherePatterParticleSpawnRate;

}

if instance_exists(obj_manager_spookyForestGhost) && object_index == obj_player_patter {
	
	if sprite_index == spr_patter_scared_shaking && isLastAnimationFrame() && scaredSweating {
	
		var _rangeX = 3;
	
		var _offsetX = random_range(-_rangeX, _rangeX);
		var _offsetY = -8;
		
		var _numberOfParticles = irandom(2);

		part_particles_create(global.particleSystemDevice, x + _offsetX, y + _offsetY, global.particleSweatdrop, _numberOfParticles);
	
		alarm[0] = sweatParticleSpawnRate;
	
	}

}



