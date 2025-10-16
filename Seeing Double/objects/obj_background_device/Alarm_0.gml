if spawningSparks {

	var _offsetX = random_range(-16, 16);
	
	var _offsetY = -0;

	var _particleToSpawn = global.particleSparkDevice;

	part_particles_create(global.particleSystemDevice, x + _offsetX, y + _offsetY, _particleToSpawn, 1);
	
	_offsetX = random_range(-16, 16);
	
	if sparkParticleSpawnRate <= 20 part_particles_create(global.particleSystemDevice, x + _offsetX, y + _offsetY, _particleToSpawn, 1);

	_offsetX = random_range(-16, 16);

	if sparkParticleSpawnRate <= sparkParticleSpawnRateMin part_particles_create(global.particleSystemDevice, x + _offsetX, y + _offsetY, _particleToSpawn, 1);

	alarm[0] = sparkParticleSpawnRate;

	//show_debug_message("spark spawned")

}





