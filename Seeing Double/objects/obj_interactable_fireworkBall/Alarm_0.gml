var _numberOfParticles = 200;

audio_play_sound(sfx_firecracker_corsair, 1, 0);
	
part_type_colour_rgb(global.particleFireworkSparkBall, 0, 255, 0, 255, 0, 255);

part_particles_create(global.particleSystemDevice, x, y, global.particleFireworkSparkBall, _numberOfParticles);

instance_destroy();










