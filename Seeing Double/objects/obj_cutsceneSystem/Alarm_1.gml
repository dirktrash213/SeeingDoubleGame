/// @description Cutscene progression

switch global.currentCutsceneID {

	case CUTSCENE_ID.SPLIT_SCREEN_ACTIVATE: {
	
		switch cutsceneState {

			case SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SHOUTING_LEFT: {
	
				cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SHOUTING_RIGHT;
		
				audio_play_sound(sfx_mouseChirp, 1, 0);
		
				if pitterPlayerIsPresent() {
			
					part_particles_create(global.particleSystemDevice, obj_player_pitter.x, obj_player_pitter.y - 10, global.particleCallForPatter, 1);
			
				}
		
				alarm[1] = 120;
	
			} break;
	
			case SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SHOUTING_RIGHT: {
	
				cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.PITTER_WAITING_FOR_RESPONSE;
				alarm[1] = 180;
	
			} break;
	
			case SPLIT_SCREEN_CUTSCENE_STATE.PITTER_WAITING_FOR_RESPONSE: {
	
				cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SAD;
				alarm[1] = 180;
				audio_play_sound(sfx_mouseChirp, 1, 0, 1, 0, 0.5);
	
			} break;
	
			case SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SAD: {
	
				cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.FADING_IN_WHITE;
		
				with instance_create_depth(100, 100, -14000, obj_background_fadeToWhite) {
		
					fadingIn = true;
					fadeInRate = 0.005;
		
				}
	
			} break;
	
		}
	
	} break; 
	
	case CUTSCENE_ID.DOUBLE_JUMP_BARREL: {
	
		switch cutsceneState {

			case DOUBLE_JUMP_BARREL_CUTSCENE_STATE.SOAKING: {
	
				cutsceneState = DOUBLE_JUMP_BARREL_CUTSCENE_STATE.JUMPING_OUT;
				
				with obj_scienceJuice_doubleJump {
				
					instance_create_layer(x, y, "Collision", obj_scienceJuice_empty);
					instance_destroy();
				
				}
		
				var _jumpDuration = 116;
		
				alarm[1] = _jumpDuration;
		
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
		
					//obj_player_pitter.ySpeed = -5;
					//obj_player_patter.ySpeed = -5;
					
					obj_player_pitter.grav = 0;
					obj_player_patter.grav = 0;
					
					obj_player_pitter.vspeed = -15;
					obj_player_patter.vspeed = -15;
					
					obj_player_pitter.gravity = 0.25;
					obj_player_patter.gravity = 0.25;
			
				}
		
				//show_debug_message("done soaking")
	
			} break;
	
			case DOUBLE_JUMP_BARREL_CUTSCENE_STATE.JUMPING_OUT: {
				
				//show_debug_message("posing")
	
				cutsceneState = DOUBLE_JUMP_BARREL_CUTSCENE_STATE.POSING;
				
				var _poseDuration = 300;
		
				alarm[1] = _poseDuration;
		
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
		
					obj_player_pitter.vspeed = 0;
					obj_player_patter.vspeed = 0;
			
					obj_player_pitter.gravity = 0;
					obj_player_patter.gravity = 0;
		
				}
				
				with obj_trigger_dialogue {
				
					triggered = true;

					alarm[0] = textDisplayDuration;

				}
		
			} break;
			
			case DOUBLE_JUMP_BARREL_CUTSCENE_STATE.POSING: {
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
				
					obj_player_pitter.grav = global.playerDefaultGrav;
					obj_player_patter.grav = global.playerDefaultGrav;
					
					obj_player_pitter.jumpMax = 2;
					obj_player_patter.jumpMax = 2;
				
					global.doubleJumpActive = true;
			
				}
				
				deactivateCutscene();
		
			} break;

		}

	} break; 

}



/*
switch cutsceneState {

	case SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SHOUTING_LEFT: {
	
		cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SHOUTING_RIGHT;
		
		audio_play_sound(sfx_mouseChirp, 1, 0);
		
		if pitterPlayerIsPresent() {
			
			part_particles_create(global.particleSystemDevice, obj_player_pitter.x, obj_player_pitter.y - 10, global.particleCallForPatter, 1);
			
		}
		
		alarm[1] = 120;
	
	} break;
	
	case SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SHOUTING_RIGHT: {
	
		cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.PITTER_WAITING_FOR_RESPONSE;
		alarm[1] = 180;
	
	} break;
	
	case SPLIT_SCREEN_CUTSCENE_STATE.PITTER_WAITING_FOR_RESPONSE: {
	
		cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SAD;
		alarm[1] = 180;
		audio_play_sound(sfx_mouseChirp, 1, 0, 1, 0, 0.5);
	
	} break;
	
	case SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SAD: {
	
		cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.FADING_IN_WHITE;
		
		with instance_create_depth(100, 100, -14000, obj_background_fadeToWhite) {
		
			fadingIn = true;
			fadeInRate = 0.005;
		
		}
	
	} break;
	
	
	case DOUBLE_JUMP_BARREL_CUTSCENE_STATE.SOAKING: {
	
		cutsceneState = DOUBLE_JUMP_BARREL_CUTSCENE_STATE.JUMPING_OUT;
		
		var _jumpDuration = 30;
		
		alarm[1] = _jumpDuration;
		
		if pitterPlayerIsPresent() && patterPlayerIsPresent() {
		
			obj_player_pitter.vspeed = -5;
			obj_player_patter.vspeed = -5;
			
			obj_player_pitter.gravity = 0.15;
			obj_player_patter.gravity = 0.15;
		
		}
		
		//show_debug_message("done soaking")
	
	} break;
	
	case DOUBLE_JUMP_BARREL_CUTSCENE_STATE.JUMPING_OUT: {
		
		//show_debug_message("posing")
	
		cutsceneState = DOUBLE_JUMP_BARREL_CUTSCENE_STATE.POSING;
		
		if pitterPlayerIsPresent() && patterPlayerIsPresent() {
		
			obj_player_pitter.vspeed = 0;
			obj_player_patter.vspeed = 0;
			
			obj_player_pitter.gravity = 0;
			obj_player_patter.gravity = 0;
		
		}
		
	} break;

}




