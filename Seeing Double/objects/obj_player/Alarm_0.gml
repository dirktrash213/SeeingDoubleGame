/// @description Particles

if happyPicnic {

	var _offsetY = -10;

	var _particleToSpawn;

	if object_index == obj_player_pitter _particleToSpawn = global.particleHeartPink;
	if object_index == obj_player_patter _particleToSpawn = global.particleHeartBlue;

	part_particles_create(global.particleSystemHearts, x, y + _offsetY, _particleToSpawn, 1);

	alarm[0] = heartParticleSpawnRate;

}

if searchingForPatterPicnic {
	
	var _offsetY = -16;

	part_particles_create(global.particleSystemHearts, x, y + _offsetY, global.particleWherePatter, 1);
	
	alarm[0] = wherePatterParticleSpawnRate;

}



