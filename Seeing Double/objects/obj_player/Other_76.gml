if event_data[? "event_type"] == "sprite event" {
	
    switch (event_data[? "message"]) {
       
		case "footstep": {
			
			var _pitch = random_range(0.5, 1.5);
			
			audio_play_sound(sfx_footstep, 1, 0, 1, 0, _pitch);
			
		} break;
		
		case "ladder": {
			
			var _pitch = random_range(1.5, 2.5);
			
			audio_play_sound(sfx_footstep, 1, 0, 0.35, 0, _pitch);
			
		} break;
		
		case "knock": {
			
			var _pitch = random_range(1.5, 2.5);
			
			audio_play_sound(sfx_footstep, 1, 0, 0.35, 0, _pitch);
			
		} break;
		
	}
	
}



