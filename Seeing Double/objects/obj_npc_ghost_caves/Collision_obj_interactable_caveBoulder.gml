with obj_interactable_caveBoulder {
	
	audio_play_sound(sfx_explosion, 1, 0);
	
	var _rangeX = 32;
	var _rangeY = 32;
	
	var _offsetX = random_range(-_rangeX, _rangeX);
	var _offsetY = random_range(-_rangeY, _rangeY);
	
	var _numberOfParticles = 20;

	part_particles_create(global.particleSystemDevice, x + _offsetX, y + _offsetY, global.particleRock, _numberOfParticles);
	
	
	instance_destroy();
	
}



