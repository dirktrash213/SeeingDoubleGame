if event_data[? "event_type"] == "sprite event" {
	
    switch (event_data[? "message"]) {
       
		case "wheelNoise": {
			
			if path_position <= 0 exit; 
			if path_position == 1 exit; 
			
		//	var _pitch = random_range(0.5, 1.5);
			var _pitch = random_range(2.5, 2.5);
		//	var _pitch = random_range(0.25, 0.25);
			
			//audio_play_sound(sfx_footstep, 1, 0, 1, 0, _pitch);
			audio_play_sound_on(obj_control.reverb_emitter, sfx_footstep, false, 1, 0.5, 0, _pitch);
			
			if !visible exit;
			
			//Sparks
			var _offsetX = -8;
			var _offsetY = 0;
		
			var _numberOfParticles = irandom_range(2,3);
			
			part_particles_create(global.particleSystemDevice, x + _offsetX, y + _offsetY, global.particleMinecartSpark, _numberOfParticles);
			
		} break;
		
	}
	
}