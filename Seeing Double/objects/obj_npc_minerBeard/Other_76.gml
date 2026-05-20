if event_data[? "event_type"] == "sprite event" {
	
    switch (event_data[? "message"]) {
       
		case "pickaxeNoise": {
			
			var _pitch = random_range(4.0, 6.0);
			
			//if !audio_is_playing(sfx_footstep) audio_play_sound(sfx_footstep, 1, 0, 1, 0, _pitch);
			//if !audio_is_playing(sfx_footstep) audio_play_sound_on(obj_control.reverb_emitter, sfx_footstep, 0, 1, 1, 0, _pitch);
			audio_play_sound_on(obj_control.reverb_emitter, sfx_footstep, 0, 1, 1, 0, _pitch);
			
			//Create spark particles
			
			var _rangeX = 3;
	
			var _offsetX = 16;
			var _offsetY = -8;
		
			var _numberOfParticles = irandom_range(1,2);

			part_particles_create(global.particleSystemDevice, x + _offsetX, y + _offsetY, global.particlePickaxeSpark, _numberOfParticles);
			
		} break;
		
	}
	
}








