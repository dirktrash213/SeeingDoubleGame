var _delayBeforePadFires = 45;

if spawningSparks {

	pulseSpeed+= 0.001;

	sparkParticleSpawnRate -= sparkParticleSpawnRateDecreaseAmount;
	
	if sparkParticleSpawnRate <= 20 && playerIsPresent() {
	
		if !audio_is_playing(sfx_laser_chargeUp) audio_play_sound(sfx_laser_chargeUp, 1, 0);
		
		sparkParticleSpawnRateDecreaseAmount = 0.1;
		
		with obj_player_pitter {
		
			sprite_index = spr_pitter_hugPatter_curious;
			//concernedPicnic = true;
			//happyPicnic = false;
		
		}
	
	}
	
	if sparkParticleSpawnRate <= sparkParticleSpawnRateMin && playerIsPresent() {
	
		sparkParticleSpawnRate = sparkParticleSpawnRateMin;
		
		var _beamedUp = global.patterBeamedAway;
		
		if !alarm2Triggered {
			
			show_debug_message("alarm2 started")
			alarm2Triggered = true;
			//alarm[2] = 35;
			alarm[2] = _delayBeforePadFires + 5;
			
		}
		
		with obj_player_pitter {
	
			var _pitterSprite = global.patterBeamedAway ? spr_pitter_scared : spr_pitter_hugPatter_scared; 
		
			sprite_index = _pitterSprite;
		
		}
		
		if global.titleScreenCutsceneState != TITLE_SCREEN_CUTSCENE_STATE.PAD_FIRING {
		
			//depth = -14000;
			
			global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.PAD_FIRING;
			
			//with obj_player_pitter {
			//
			//	//show_debug_message(global.patterBeamedAway)
			//	//show_debug_message(_beamedUp)
			//
			//	//var _pitterSprite = global.patterBeamedAway ? spr_pitter_scared : spr_pitter_hugPatter_scared; 
			//	var _pitterSprite = global.patterBeamedAway ? spr_pitter_scared : spr_pitter_scared; 
			//
			//	sprite_index = _pitterSprite;
			//	//concernedPicnic = false;
			//	//scaredPicnic = true;
			//
			//}
			
		
			
			alarm[1] = _delayBeforePadFires;
		
		}
		
	}
	
	
	
}





