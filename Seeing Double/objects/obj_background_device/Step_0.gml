if spawningSparks {

	pulseSpeed+= 0.001;

	sparkParticleSpawnRate -= sparkParticleSpawnRateDecreaseAmount;
	
	if sparkParticleSpawnRate <= 20 && playerIsPresent() {
	
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
			alarm[2] = 35;
			
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
			
			var _delayBeforePadFires = 30;
			
			alarm[1] = _delayBeforePadFires;
		
		}
		
	}
	
	
	
}





