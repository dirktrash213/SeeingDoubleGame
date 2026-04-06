//Cutscene progression

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
				
				var _jumpDuration = 116;
		
				alarm[1] = _jumpDuration;
				
				obj_scienceJuice_doubleJump.state = BARREL_STRETCH_STATE.SHOOTING;
				
				var _offsetY = -16;

				with obj_scienceJuice_doubleJump part_particles_create(global.particleSystemDevice, x, y + _offsetY, global.scienceJuiceSparksDoubleJump, 100);
				
				audio_stop_sound(sfx_cinematic_rumble);
				audio_play_sound(sfx_cake_firework, 1, 0);
				
				with obj_player {
					
					image_alpha = 1;
					spawnAfterimages = true;
					alarm[4] = afterimageSpawnRate;
					
				}
		
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
				
				with obj_player {
					
					spawnAfterimages = false;
					
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
				
				audio_sound_gain(amb_forest_ambience, 0.1, 2000);
				audio_sound_gain(obj_control.bgmForest, 0.8, 2000);
				
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
	
	case CUTSCENE_ID.GROUND_POUND_BARREL: {
	
		switch cutsceneState {

			case GROUND_POUND_BARREL_CUTSCENE_STATE.SOAKING: {
				
				cutsceneState = GROUND_POUND_BARREL_CUTSCENE_STATE.JUMPING_OUT;
				
				var _jumpDuration = 116;
		
				alarm[1] = _jumpDuration;
				
				obj_scienceJuice_groundPound.state = BARREL_STRETCH_STATE.SHOOTING;
				
				var _offsetY = -16;

				with obj_scienceJuice_groundPound part_particles_create(global.particleSystemDevice, x, y + _offsetY, global.scienceJuiceSparksGroundPound, 100);
				
				audio_stop_sound(sfx_cinematic_rumble);
				audio_play_sound(sfx_cake_firework, 1, 0);
				
				with obj_player {
					
					image_alpha = 1;
					spawnAfterimages = true;
					afterimageSpawnColor = c_orange;
					alarm[4] = afterimageSpawnRate;
					
				}
		
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
	
			case GROUND_POUND_BARREL_CUTSCENE_STATE.JUMPING_OUT: {
				
				//show_debug_message("posing")
	
				cutsceneState = GROUND_POUND_BARREL_CUTSCENE_STATE.POSING;
				
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
				
				with obj_player {
					
					spawnAfterimages = false;
					
				}
		
			} break;
			
			case GROUND_POUND_BARREL_CUTSCENE_STATE.POSING: {
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
				
					obj_player_pitter.grav = global.playerDefaultGrav;
					obj_player_patter.grav = global.playerDefaultGrav;
					
					obj_player_pitter.jumpMax = 2;
					obj_player_patter.jumpMax = 2;
				
					global.groundPoundActive = true;
			
				}
				
				//audio_stop_all();
				
				//audio_play_sound(bgm_forest_ambience, 1, 1);
				//audio_play_sound(bgm_inSync, 1, 1);
				
				audio_sound_gain(amb_cave_with_water_dripping, 0.1, 2000);
				audio_sound_gain(obj_control.bgmCave, 0.8, 2000);
				
				deactivateCutscene();
		
			} break;

		}

	} break; 
	
	case CUTSCENE_ID.CAVES_HAUNTING: {
	
		switch cutsceneState { 
			
			case CAVES_HAUNTING_CUTSCENE_STATE.LOOKING_AT_SCAMMER: {
				
				cutsceneState = CAVES_HAUNTING_CUTSCENE_STATE.WALKING_TO_SCAMMER;
				
				var _walkDuration = 60;
				
				alarm[1] = _walkDuration;
				
				with obj_trigger_dialogue {
				
					triggered = true;

					alarm[0] = textDisplayDuration;

				}
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
				
					obj_player_pitter.hspeed = 1;
					
				}
		
			} break;
			
			case CAVES_HAUNTING_CUTSCENE_STATE.WALKING_TO_SCAMMER: {
				
				cutsceneState = CAVES_HAUNTING_CUTSCENE_STATE.BEHIND_SCAMMER;
				
				var _lookDuration = 1000;
				
				alarm[1] = _lookDuration;
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
			
					obj_player_pitter.hspeed = 0;
					
				}
				
			} break;
			
			case CAVES_HAUNTING_CUTSCENE_STATE.BEHIND_SCAMMER: {
				
				cutsceneState = CAVES_HAUNTING_CUTSCENE_STATE.POKING_SCAMMER;
				
				var _duration = 60;
				
				alarm[1] = _duration;
				
				with obj_trigger_dialogue {
				
					count = 0;
					alarm[0] = textDisplayDuration;
					dialogueString = [];
					
					if global.gotScammed {

						dialogueString[0] = global.dialogueStringArrays.cavesHaunting[3];
						
					} else {

						dialogueString[0] = "Player was not scammed.";

					}

				}
				
				with obj_npc_scammer_mines {
				
					image_xscale = 1;
					sprite_index = spr_npc_scammer_shocked;
					
					vspeed = vSpeedAmount;
					gravity = gravAmount;
				
				}
				
			} break;
			
			case CAVES_HAUNTING_CUTSCENE_STATE.POKING_SCAMMER: {
				
				cutsceneState = CAVES_HAUNTING_CUTSCENE_STATE.TALKING_TO_SCAMMER;
				
				var _duration = 1600;
				
				alarm[1] = _duration;
				
				with obj_trigger_dialogue {
				
					var _customTextDisplayDuration = 120;
				
					count = 0;
					alarm[0] = _customTextDisplayDuration;
					dialogueString = [];
					
					if global.gotScammed {

						
						
						dialogueString[0] = global.dialogueStringArrays.cavesHaunting[4];
						dialogueString[1] = global.dialogueStringArrays.cavesHaunting[5];
						dialogueString[2] = global.dialogueStringArrays.cavesHaunting[6];
						dialogueString[3] = global.dialogueStringArrays.cavesHaunting[7];
						dialogueString[4] = global.dialogueStringArrays.cavesHaunting[8];
						

					} else {

						dialogueString[0] = "Player was not scammed.";

					}

				}
				
			} break;
			
			case CAVES_HAUNTING_CUTSCENE_STATE.TALKING_TO_SCAMMER: {
			
				obj_npc_scammer_mines.lookingAtPlayer = true;
				
				//if patterPlayerIsPresent() obj_player_patter.aboutToBeatUpScammer = false;
				setPatterAngrySprites();
				deactivateCutscene();
			
			}
			
		}
	
	} break;
	
	case CUTSCENE_ID.GO_BEAT_UP_SCAMMER_FIRST: {
		
		switch cutsceneState { 
			
			case GO_BEAT_UP_SCAMMER_FIRST_CUTSCENE_STATE.SHAKING_HEAD: {
				
				cutsceneState = GO_BEAT_UP_SCAMMER_FIRST_CUTSCENE_STATE.WALKING_BACK;
				
				var _duration = 60;
				
				alarm[1] = _duration;
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
					
					obj_player_pitter.hspeed = -1;
					obj_player_pitter.image_xscale = -1;
					
					obj_player_patter.hspeed = -1;
					obj_player_patter.image_xscale = -1;
					
				}
				
			} break;
			
			case GO_BEAT_UP_SCAMMER_FIRST_CUTSCENE_STATE.WALKING_BACK: {
			
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
					
					obj_player_pitter.hspeed = 0;
					obj_player_pitter.image_xscale = 1;
					
					obj_player_patter.hspeed = 0;
					obj_player_patter.image_xscale = 1;
					
				}
				
				with obj_trigger_beatUpScammerFirst triggered = false;
				
				deactivateCutscene();
			
			}
			
		}
		
	} break;
	//@
	case CUTSCENE_ID.CAVES_HAUNTING_PART2: {
		
		switch cutsceneState { 
			
			case CAVES_HAUNTING_PART2_CUTSCENE_STATE.WALKING_BACK: {
				
				cutsceneState = CAVES_HAUNTING_PART2_CUTSCENE_STATE.HEARING_SCAMMER_BEG;
				
				var _duration = 1800;
				
				alarm[1] = _duration;
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
					
					obj_player_pitter.hspeed = 0;
					obj_player_pitter.image_xscale = 1;
					obj_player_pitter.faceDir = 1;
					
					obj_player_patter.hspeed = 0;
					obj_player_patter.image_xscale = 1;
					obj_player_patter.faceDir = 1;
					
				}
				
			} break;
			
			case CAVES_HAUNTING_PART2_CUTSCENE_STATE.HEARING_SCAMMER_BEG: {
				
				cutsceneState = CAVES_HAUNTING_PART2_CUTSCENE_STATE.THINKING;
				
				var _duration = 180;
				
				alarm[1] = _duration;
				
				if patterPlayerIsPresent() instance_create_layer(obj_player_patter.x, obj_player_patter.y - 15, "Instances", obj_background_elipses);
				
				with obj_trigger_dialogue {
				
					var _customTextDisplayDuration = 120;
				
					count = 0;
					alarm[0] = _customTextDisplayDuration;
					dialogueString = [];
					
					dialogueString[0] = "";
				
				}
				
			} break;
			
			case CAVES_HAUNTING_PART2_CUTSCENE_STATE.THINKING: {
				
				cutsceneState = CAVES_HAUNTING_PART2_CUTSCENE_STATE.HEARING_GHOST_APPROACH;
				
				var _duration = 900;
				
				alarm[1] = _duration;
				
				with obj_trigger_dialogue {
				
					var _customTextDisplayDuration = 200;
				
					count = 0;
					alarm[0] = _customTextDisplayDuration;
					dialogueString = [];
					
					dialogueString[0] = global.dialogueStringArrays.cavesHauntingPart2[6]; //"What's that noise?"
					dialogueString[1] = global.dialogueStringArrays.cavesHauntingPart2[7];
					dialogueString[2] = global.dialogueStringArrays.cavesHauntingPart2[8];
					dialogueString[3] = global.dialogueStringArrays.cavesHauntingPart2[9];
					dialogueString[4] = global.dialogueStringArrays.cavesHauntingPart2[10];
						
				}
				
			} break;
			
			case CAVES_HAUNTING_PART2_CUTSCENE_STATE.HEARING_GHOST_APPROACH: {
				
				cutsceneState = CAVES_HAUNTING_PART2_CUTSCENE_STATE.RUNNING_TO_HIDING_SPOT;
				
				var _duration = 135;
				
				alarm[1] = _duration;
				
				with obj_trigger_dialogue {
				
					var _customTextDisplayDuration = 300;
				
					count = 0;
					alarm[0] = _customTextDisplayDuration;
					dialogueString = [];
					
					dialogueString[0] = global.dialogueStringArrays.cavesHauntingPart2[11];
				
				}
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
					
					var _runSpeed = 2.5;
					
					obj_player_pitter.hspeed = -_runSpeed;
					obj_player_pitter.image_xscale = -1;
					
					obj_player_patter.hspeed = -_runSpeed;
					obj_player_patter.image_xscale = -1;
					
					obj_npc_scammer_mines.hspeed = -_runSpeed;
					obj_npc_scammer_mines.image_xscale = -1;
					
					obj_npc_scammer_mines.sprite_index = spr_npc_scammer_run_scared;
					
				}
				
			} break;
			
			case CAVES_HAUNTING_PART2_CUTSCENE_STATE.RUNNING_TO_HIDING_SPOT: {
				
				cutsceneState = CAVES_HAUNTING_PART2_CUTSCENE_STATE.HIDING;
				
				var _duration = 600;
				
				alarm[1] = _duration;
				
				with obj_npc_scammer_mines {
				
					lookingAtPlayer = false;
					lookingLeftAndRight = true;
					alarm[0] = lookingLeftAndRightRate;
					
					hspeed = 0;
					sprite_index = spr_npc_scammer_veryScared;
				
				}
				
				with obj_trigger_dialogue {
				
					var _customTextDisplayDuration = 300;
				
					count = 0;
					alarm[0] = _customTextDisplayDuration;
					dialogueString = [];
					
					dialogueString[0] = "";
				
				}
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
					
					obj_player_pitter.hspeed = 0;
					obj_player_pitter.image_xscale = 1;
					obj_player_pitter.faceDir = 1;
					
					obj_player_patter.hspeed = 0;
					obj_player_patter.image_xscale = 1;
					obj_player_patter.faceDir = 1;
					
					//obj_npc_scammer_mines.hspeed = 0;
					//obj_npc_scammer_mines.image_xscale = 1;
					
					//obj_npc_scammer_mines.sprite_index = spr_npc_scammer_veryScared;
					
				}
				
			} break;
			
			case CAVES_HAUNTING_PART2_CUTSCENE_STATE.HIDING: {
				
				cutsceneState = CAVES_HAUNTING_PART2_CUTSCENE_STATE.LEAVING_HIDING_SPOT;
				
				var _duration = 120;
				
				alarm[1] = _duration;
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
					
					var _walkSpeed = 1;
					
					obj_player_pitter.hspeed = _walkSpeed;
					obj_player_pitter.image_xscale = 1;
					
					obj_player_patter.hspeed = _walkSpeed;
					obj_player_patter.image_xscale = 1;
					
					obj_npc_scammer_mines.hspeed = _walkSpeed;
					obj_npc_scammer_mines.image_xscale = 1;
					
					obj_npc_scammer_mines.image_xscale = -1;
					obj_npc_scammer_mines.sprite_index = spr_npc_scammer_run_scared;
					obj_npc_scammer_mines.lookingLeftAndRight = false;
					
				}
				
			} break;
			
			case CAVES_HAUNTING_PART2_CUTSCENE_STATE.LEAVING_HIDING_SPOT: {
				
				cutsceneState = CAVES_HAUNTING_PART2_CUTSCENE_STATE.SCAMMER_YELLING;
				
				var _duration = 360;
				
				alarm[1] = _duration;
				
				with obj_trigger_dialogue {
				
					var _customTextDisplayDuration = 180;
				
					count = 0;
					alarm[0] = _customTextDisplayDuration;
					dialogueString = [];
					
					dialogueString[0] =  "...";
					dialogueString[1] =  global.dialogueStringArrays.cavesHauntingPart2[12];
					//dialogueString[1] =  global.dialogueStringArrays.cavesHauntingPart2[13];
					//dialogueString[2] =  global.dialogueStringArrays.cavesHauntingPart2[14];
				
				}
				
				if pitterPlayerIsPresent() && patterPlayerIsPresent() {
					
					obj_player_pitter.hspeed = 0;
					obj_player_pitter.image_xscale = 1;
					obj_player_pitter.faceDir = 1;
					
					obj_player_patter.hspeed = 0;
					obj_player_patter.image_xscale = 1;
					obj_player_patter.faceDir = 1;
					
					obj_npc_scammer_mines.hspeed = 0;
					obj_npc_scammer_mines.image_xscale = 1;
					obj_npc_scammer_mines.sprite_index = spr_npc_scammer_eyesClosed;
					
				}
				
			} break;
			
			case CAVES_HAUNTING_PART2_CUTSCENE_STATE.SCAMMER_YELLING: {
				
				cutsceneState = CAVES_HAUNTING_PART2_CUTSCENE_STATE.GHOST_RETURNING;
				
				var _duration = 360;
				
				alarm[1] = _duration;
				
				obj_npc_scammer_mines.sprite_index = spr_npc_scammer_processing;
				
				with obj_trigger_dialogue {
				
					var _customTextDisplayDuration = 180;
				
					count = 0;
					alarm[0] = _customTextDisplayDuration;
					dialogueString = [];
					
					dialogueString[0] =  "...";
					dialogueString[1] =  global.dialogueStringArrays.cavesHauntingPart2[13];
				
				}
				
			} break;
			
			case CAVES_HAUNTING_PART2_CUTSCENE_STATE.GHOST_RETURNING: {
				
				cutsceneState = CAVES_HAUNTING_PART2_CUTSCENE_STATE.SCAMMER_FLEEING;
				
				var _duration = 60;
				
				alarm[1] = _duration;
				
				with obj_npc_scammer_mines {
				
					sprite_index = spr_npc_scammer_run_terrified;
					hspeed = 5;
					image_xscale = -1;
				
				}
				
				with obj_trigger_dialogue {
				
					var _customTextDisplayDuration = 60;
				
					count = 0;
					alarm[0] = _customTextDisplayDuration;
					dialogueString = [];
					
					dialogueString[0] =  global.dialogueStringArrays.cavesHauntingPart2[14];
				
				}
				
			} break;
			
			case CAVES_HAUNTING_PART2_CUTSCENE_STATE.SCAMMER_FLEEING: {
				
				//resetPatterSprites();
				setPitterScaredSprites();
				setPatterScaredSprites();
				instance_destroy(obj_trigger_beatUpScammerFirst);
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




