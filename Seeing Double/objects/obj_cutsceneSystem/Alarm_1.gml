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
				
				//audio_play_sound(sfx_effect_for_logo_intro_LONG, 1, 0, 1, 0, 1.0);
				//audio_play_sound(sfx_effect_for_logo_intro, 1, 0, 1, 0, 1.0);
				audio_play_sound(sfx_effect_for_logo_intro_v2, 1, 0, 1, 0, 1.0);
			//	audio_play_sound(sfx_effect_for_logo_intro_v3, 1, 0, 1, 0, 1.0);
		
				with instance_create_depth(100, 100, -14000, obj_background_fadeToWhite) {
		
					fadingIn = true;
					//fadeInRate = 0.003;
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
		
				audio_play_sound(sfx_powerup, 1, 0);
		
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
				
				//audio_stop_all();
				
				//audio_play_sound(bgm_forest_ambience, 1, 1);
				//audio_play_sound(bgm_inSync, 1, 1);
				
				audio_sound_gain(bgm_forest_ambience, 0.1, 2000);
				audio_sound_gain(bgm_inSync, 0.8, 2000);
				
				deactivateCutscene();
		
			} break;

		}

	} break; 
	
	case CUTSCENE_ID.FOREST_HAUNTING: {
	
		switch cutsceneState { 
			
			case FOREST_HAUNTING_CUTSCENE_STATE.LOOKING_AT_FLOWER: {
				
				cutsceneState = FOREST_HAUNTING_CUTSCENE_STATE.WALKING_TO_FLOWER;
				
				var _walkDuration = 80;
		
				alarm[1] = _walkDuration;
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
				
					obj_player_pitter.hspeed = 1;
					obj_player_patter.hspeed = 1;
				
				}
		
			} break;
			
			case FOREST_HAUNTING_CUTSCENE_STATE.WALKING_TO_FLOWER: {
				
				cutsceneState = FOREST_HAUNTING_CUTSCENE_STATE.PICKING_FLOWER;
				
				instance_destroy(obj_interactable_grass_flower_blue);
				instance_destroy(obj_interactable_grass_flower_pink);
				
				var _pickDuration = 120;
		
				alarm[1] = _pickDuration;
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
				
					var _elipsesOffsetX = -5;
		
					instance_create_layer(obj_player_pitter.x + _elipsesOffsetX, 208, "Instances", obj_background_elipses);
					instance_create_layer(obj_player_patter.x + _elipsesOffsetX, 528, "Instances", obj_background_elipses);
				
					obj_player_pitter.hspeed = 0;
					obj_player_patter.hspeed = 0;
				
				}
		
			} break;
			
			case FOREST_HAUNTING_CUTSCENE_STATE.PICKING_FLOWER: {
				
				cutsceneState = FOREST_HAUNTING_CUTSCENE_STATE.THINKING_ABOUT_PARTNER;
				
				var _sadDuration = 300;
		
				alarm[1] = _sadDuration;
				
				var _offsetY = -12;
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
				
					part_particles_create(global.particleSystemDevice, obj_player_pitter.x, obj_player_pitter.y + _offsetY, global.particleWherePatter, 1);
					part_particles_create(global.particleSystemDevice, obj_player_patter.x, obj_player_patter.y + _offsetY, global.particleWherePitter, 1);
				
				}
		
			} break;
			
			case FOREST_HAUNTING_CUTSCENE_STATE.THINKING_ABOUT_PARTNER: {
				
				cutsceneState = FOREST_HAUNTING_CUTSCENE_STATE.PUTTING_FLOWER_AWAY;
				
				var _cutsceneStateDuration = 10;
		
				alarm[1] = _cutsceneStateDuration;
				
			} break;
			
			case FOREST_HAUNTING_CUTSCENE_STATE.PUTTING_FLOWER_AWAY: {
				
				cutsceneState = FOREST_HAUNTING_CUTSCENE_STATE.LOOKING_AT_CAVE;
				
				var _cutsceneStateDuration = 10;
		
				alarm[1] = _cutsceneStateDuration;
				
			} break;
			
			case FOREST_HAUNTING_CUTSCENE_STATE.LOOKING_AT_CAVE: {
				
				cutsceneState = FOREST_HAUNTING_CUTSCENE_STATE.WALKING_TO_CAVE;
				
				var _cutsceneStateDuration = 134; //134
		
				alarm[1] = _cutsceneStateDuration;
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
				
					obj_player_pitter.hspeed = 1;
					obj_player_patter.hspeed = 1;
				
				}
				
			} break;
			
			case FOREST_HAUNTING_CUTSCENE_STATE.WALKING_TO_CAVE: {
				
				cutsceneState = FOREST_HAUNTING_CUTSCENE_STATE.KNOCKING_ON_BOULDER;
				
				var _cutsceneStateDuration = 180;
		
				alarm[1] = _cutsceneStateDuration;
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
				
					obj_player_pitter.hspeed = 0;
					obj_player_patter.hspeed = 0;
				
				}
				
			} break;
			
			case FOREST_HAUNTING_CUTSCENE_STATE.KNOCKING_ON_BOULDER: {
				
				cutsceneState = FOREST_HAUNTING_CUTSCENE_STATE.SHAKING_HEAD;
				
				var _cutsceneStateDuration = 120;
		
				alarm[1] = _cutsceneStateDuration;
				
				audio_play_sound(sfx_mouseChirp, 1, 0, 1, 0, 0.5);
				
			} break;
			
			case FOREST_HAUNTING_CUTSCENE_STATE.SHAKING_HEAD: {
				
				cutsceneState = FOREST_HAUNTING_CUTSCENE_STATE.WALKING_BACK;
				
				var _cutsceneStateDuration = 120;
		
				alarm[1] = _cutsceneStateDuration;
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
				
					obj_player_pitter.hspeed = -1;
					obj_player_patter.hspeed = -1;
					
					obj_player_pitter.image_xscale = -1;
					obj_player_patter.image_xscale = -1;
				
				}
				
			} break;
			
			case FOREST_HAUNTING_CUTSCENE_STATE.WALKING_BACK: {
				
				cutsceneState = FOREST_HAUNTING_CUTSCENE_STATE.THINKING;
				
				var _cutsceneStateDuration = 180;
		
				alarm[1] = _cutsceneStateDuration;
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
				
					obj_player_pitter.hspeed = 0;
					obj_player_patter.hspeed = 0;
					
					var _elipsesOffsetY = -20;
		
					instance_create_layer(obj_player_pitter.x, 208, "Instances", obj_background_elipses);
					instance_create_layer(obj_player_patter.x, 528, "Instances", obj_background_elipses);
				
				}
				
			} break;
			
			case FOREST_HAUNTING_CUTSCENE_STATE.THINKING: {
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
				
					obj_player_pitter.image_xscale = 1;
					obj_player_patter.image_xscale = 1;
				
				}
				
				deactivateCutscene();
				
				obj_manager_spookyForestGhost.timerActive = true;
				
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




