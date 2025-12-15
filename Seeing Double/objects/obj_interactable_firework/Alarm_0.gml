alarm[0] = particleSpawnRate;



if triggered {

	

	//var _rangeX = 3;
	
	//var _offsetX = random_range(-_rangeX, _rangeX);
	var _offsetX = 0;
	var _offsetY = -16;
	
	//var _numberOfParticles = irandom(2);
	var _numberOfParticles = 2;
	
	part_type_colour_rgb(global.particleFireworkSpark, 0, 255, 0, 255, 0, 255);

	//part_type_gravity(global.particleFireworkSpark, 0.0, 270);

	part_particles_create(global.particleSystemDevice, x + _offsetX, y + _offsetY, global.particleFireworkSpark, _numberOfParticles);
	
	//part_type_gravity(global.particleFireworkSpark, 1.5, 270);

}










