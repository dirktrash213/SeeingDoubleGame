if event_data[? "event_type"] == "sprite event" {
	
    switch (event_data[? "message"]) {
       
		case "wingFlap": {
			
			if !audio_is_playing(sfx_slice) audio_play_sound(sfx_slice, 1, 0, 1, 0, 10.0);
			
		} break;
		
	}
	
}

