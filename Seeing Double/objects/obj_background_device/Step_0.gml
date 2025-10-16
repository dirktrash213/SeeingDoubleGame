if spawningSparks {

	pulseSpeed+= 0.001;

	sparkParticleSpawnRate -= sparkParticleSpawnRateDecreaseAmount;
	
	if sparkParticleSpawnRate <= 20 && playerIsPresent() {
	
		sparkParticleSpawnRateDecreaseAmount = 0.1;
		
		with obj_player {
		
			sprite_index = concernSprite;
			concernedPicnic = true;
			happyPicnic = false;
		
		}
	
	}
	
	if sparkParticleSpawnRate <= sparkParticleSpawnRateMin && playerIsPresent() {
	
		sparkParticleSpawnRate = sparkParticleSpawnRateMin;
		
		with obj_player {
		
			sprite_index = scaredSprite;
			concernedPicnic = false;
			scaredPicnic = true;
		
		}
		
		if global.titleScreenCutsceneState != TITLE_SCREEN_CUTSCENE_STATE.PAD_FIRING {
		
			//depth = -14000;
			
			global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.PAD_FIRING;
			
			var _delayBeforePadFires = 30;
			
			alarm[1] = _delayBeforePadFires;
		
		}
		
	}
	
	
	
}





