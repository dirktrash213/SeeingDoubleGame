if event_data[? "event_type"] == "sprite event" {
	
    switch (event_data[? "message"]) {
       
		case "breakNoise": {
			
			if !audio_is_playing(sfx_tinyImpact) {
				
				audio_play_sound_on(obj_control.reverb_emitter, sfx_tinyImpact, 0, 1, 1, 0, breakNoisePitch);
			
				breakNoisePitch += breakNoisePitchIncreaseAmount;
				
				if breakNoisePitch > (breakNoisePitchDefault + breakNoisePitchIncreaseAmount*3 ) breakNoisePitch = breakNoisePitchDefault;
				
			}
			
		} break;
		
	}
	
}


