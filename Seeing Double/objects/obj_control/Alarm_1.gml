/// @description Title screen menu / cutscene

switch global.titleScreenCutsceneState {

	case TITLE_SCREEN_CUTSCENE_STATE.ON_MENU: {
	
		instance_create_depth(room_width/2, room_height/2, -12000, obj_menu_title);
	
	} break;
	
	case TITLE_SCREEN_CUTSCENE_STATE.STARTING_CUTSCENE: {
		
		global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.PITTER_HOLDING_CHERRY;
	
		var _sceneDuration = 120;
		
		alarm[1] = _sceneDuration;
	
	} break;
	
	case TITLE_SCREEN_CUTSCENE_STATE.PITTER_HOLDING_CHERRY: {
		
		global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.PITTER_THROWING_CHERRY;
	
		var _sceneDuration = 180;
		
		alarm[1] = _sceneDuration;
		
		audio_play_sound(sfx_slice, 1, 0, 1, 0, 3.0);
		
		var _offsetX = 20;
		var _offsetY = -30;
		
		with instance_create_layer(obj_player_pitter.x+_offsetX, obj_player_pitter.y+_offsetY, "Instances", obj_background_cherry) {
		
			hspeed = 0.1;
			vspeed = -4;
			gravity = 0.1;
		
		}
	
	} break;
	
	case TITLE_SCREEN_CUTSCENE_STATE.PITTER_THROWING_CHERRY: {
		
		global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.PATTER_HOLDING_CHERRY;
	
		var _sceneDuration = 120;
		
		alarm[1] = _sceneDuration;
		
		
	
	} break;
	
	case TITLE_SCREEN_CUTSCENE_STATE.PATTER_HOLDING_CHERRY: {
		
		global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.PATTER_THROWING_CHERRY;
	
		var _sceneDuration = 240;
		
		alarm[1] = _sceneDuration;
		
		audio_play_sound(sfx_slice, 1, 0, 1, 0, 3.0);
		
		var _offsetX = -15;
		var _offsetY = -30;
		
		with instance_create_layer(obj_player_patter.x+_offsetX, obj_player_patter.y+_offsetY, "Instances", obj_background_cherry) {
		
			hspeed = -0.1;
			vspeed = -5;
			gravity = 0.1;
		
		}
		
		//var _timeUntilPitterJumps = 60;
		//
		//obj_player_pitter.alarm[3] = _timeUntilPitterJumps;
	
	} break;
	
	case TITLE_SCREEN_CUTSCENE_STATE.PATTER_THROWING_CHERRY: {
		
		global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.PITTER_PATTER_HUGGING;
	
		var _sceneDuration = 60;
		
		alarm[1] = _sceneDuration;
		
		
	
	} break;
	
	case TITLE_SCREEN_CUTSCENE_STATE.PITTER_PATTER_HUGGING: {
		
		global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.PAD_WARMING_UP;
	
		var _sceneDuration = 120;
		
		alarm[1] = _sceneDuration;
		
		
	
	} break;
	
	case TITLE_SCREEN_CUTSCENE_STATE.PAD_WARMING_UP: {
	
		audio_play_sound(sfx_laser_chargeUp2, 1, 0);
		
		with obj_background_device {
	
			spawningSparks = true;
			alarm[0] = sparkParticleSpawnRate;
		
		}
		
	} break;
	
	case TITLE_SCREEN_CUTSCENE_STATE.PAD_FIRING: {
		
		global.patterBeamedAway = true;
		
		global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.PAD_FIRED;
	
		if pitterPlayerIsPresent() {
		
			with obj_player_pitter {
			
				searchingForPatterPicnic = false;
				thinkingPicnic = true;
			
			}
		
		}
	
	} break;
	
	case TITLE_SCREEN_CUTSCENE_STATE.PAD_FIRED: {
	
		if pitterPlayerIsPresent() obj_player_pitter.wonderingAboutCherriesPicnic = false;
		
		global.playerControl = true;
		global.cutsceneActive = false;
		
		if instance_exists(obj_background_controlsDisplay) {
		
			with obj_background_controlsDisplay {
			
				var _activationDelay = 300;
				
				alarm[0] = _activationDelay;
			
			}
		
		}
		
	} break;

}

