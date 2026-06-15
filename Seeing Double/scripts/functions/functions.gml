
function drawPauseMenu() {

	if global.paused {

		var _oldFont = draw_get_font();
		draw_set_font(font_pauseMenu);
		draw_set_halign(fa_center);

		//var _x = camera_get_view_x(VIEW) + camera_get_view_width(VIEW)/2;
		//var _y = camera_get_view_y(VIEW) + camera_get_view_height(VIEW)/2;
	
		//draw_sprite_ext(sprite_index, 0, _x, _y, xScale, yScale, 0, c_white, image_alpha);
		
		//var _x = 960;
		//var _y = 540;
		var _x = display_get_gui_width()/2;
		var _y = display_get_gui_height()/2;
		
		//draw_sprite_ext(sprite_index, 0, _x, _y, xScale, yScale, 0, c_white, image_alpha);
		
		var _w = 1200;
		var _h = 600;
		
		draw_sprite_stretched(sprite_index, 0, _x - (_w/2), _y - (_h/2), _w, _h);
	
		var _masterOffsetY = -210;
		
		var _menuSpritePitter = spr_pitter_jump_x4;
		var _menuSpritePatter = spr_patter_curious_x4;
		
		var _canDrawMenuSprites = true;
	
		switch pauseMenuSublevel {
		
			case 0: {
	
				var _defeatString = global.splitScreenActive ?  " [spr_pitter_defeat_x4][spr_patter_defeat_x4]x" : " [spr_pitter_defeat_x4]x ";  
	
				//var _statText = scribble("[spr_interactable_coin]x " + string(global.coinCount) + "\n[spr_interactable_cherry]x " + string(global.cherryCount) + "\n[spr_pitter_defeat]x " + string(global.defeatCount));
				var _statText = scribble("[spr_interactable_coin_x4]x " + string(global.coinCount) + " [spr_interactable_cherry_x4]x " + string(global.cherryCount) + _defeatString + string(global.defeatCount));

				_statText.starting_format("font_pauseMenu", c_white);
				//_coinText.wrap(335); 
				_statText.align(fa_center, fa_top); 
	
				
	
				var _offsetX = 0;
				var _offsetY = 150;
	
				_statText.draw(_x + _offsetX, _y + _offsetY, typist);
	
				var _resumeString = "Resume";
				var _optionsString = "\nOptions";
				var _exitString = "\nExit Game";
	
				if pauseMenuPosition == 0 _resumeString = "[wave]Resume[/wave]";
				if pauseMenuPosition == 1 _optionsString = "[wave]\nOptions[/wave]";
				if pauseMenuPosition == 2 _exitString = "[wave]\nExit Game[/wave]";
	
				//show_debug_message("pauseMenuPosition: " + string(pauseMenuPosition))

	
				//var _menuText = scribble(_resumeString + _optionsString + _exitString);
	
				//_menuText.starting_format("font_pauseMenu", c_white);
				//_menuText.align(fa_center, fa_top); 
	
				_offsetX = 0;
				_offsetY = _masterOffsetY;
	
				//_menuText.draw(_x + _offsetX, _y + _offsetY, typist2);
			
				draw_text_scribble(_x + _offsetX, _y + _offsetY, _resumeString + _optionsString + _exitString);
				
				if global.foundRose {
					
					draw_sprite(spr_interactable_rose_64x64, 0, 1000, 200);
					
				}
				
				if global.foundLily {
					
					draw_sprite(spr_interactable_lily_64x64, 0, 1185, 200);
					
				}
			
			
			} break;
		
			case 1: {
	
				switch submenuType {
			
					case "Options": {
			
						var _backString = "Back";
						var _videoString = "\nVideo";
						var _audioString = "\nAudio";
						var _gameplayString = "\nGameplay";
	
						if pauseMenuPosition == 0 _backString = "[wave]Back[/wave]";
						if pauseMenuPosition == 1 _videoString = "[wave]\nVideo[/wave]";
						if pauseMenuPosition == 2 _audioString = "[wave]\nAudio[/wave]";
						if pauseMenuPosition == 3 _gameplayString = "[wave]\nGameplay[/wave]";
	
						var _offsetX = 0;
						var _offsetY = _masterOffsetY;
	
						draw_text_scribble(_x + _offsetX, _y + _offsetY, _backString + _videoString + _audioString + _gameplayString);
			
					} break;
				
					case "Exit": {
						
						_menuSpritePitter = spr_pitter_begPlayer_x8;
						_menuSpritePatter = spr_patter_begPlayer_x8;
			
						var _confirmString = "Exit the game?";
						var _noString = "\nDon't exit";
						var _yesString = "\nExit";
		
						if pauseMenuPosition == 0 _noString = "[wave]\nDon't exit[/wave]";
						if pauseMenuPosition == 1 _yesString = "[wave]\nExit[/wave]";
					
						var _offsetX = 0;
						var _offsetY = _masterOffsetY;
	
						draw_text_scribble(_x + _offsetX, _y + _offsetY, _confirmString + _noString + _yesString);
			
					} break;
			
				}
		
			} break;
		
			case 2: {
				
				switch submenuType {
			
					case "Video settings": {
				
						var _backString = "Back";
						var _fullscreenString = "\nFullscreen";
						var _scoreUIstring = global.scoreUIenabled ? "\nShow score UI: ON" : "\nShow score UI: OFF";
						var _timerString = global.displayGameTime ? "\nShow timer: ON" : "\nShow timer: OFF";
	
						if pauseMenuPosition == 0 _backString = "[wave]Back[/wave]";
						if pauseMenuPosition == 1 _fullscreenString = "[wave]\nFullscreen[/wave]";
						if pauseMenuPosition == 2 _scoreUIstring = global.scoreUIenabled ? "[wave]\nShow score UI: ON[/wave]" : "[wave]\nShow score UI: OFF[/wave]";
						if pauseMenuPosition == 3 _timerString = global.displayGameTime ? "[wave]\nShow timer: ON[/wave]" : "[wave]\nShow timer: OFF[/wave]";
				
						var _offsetX = 0;
						var _offsetY = _masterOffsetY;
	
						draw_text_scribble(_x + _offsetX, _y + _offsetY, _backString + _fullscreenString + _scoreUIstring + _timerString);
				
					} break;
					
					case "Audio settings": {
						
						_canDrawMenuSprites = false;
				
						var _backString = "Back";
						var _masterVolumeString = "\nMaster Volume";
						var _sfxVolumeString = "\nSFX Volume";
						var _bgmVolumeString = "\nMusic Volume";
						var _ambVolumeString = "\nAmbience";
					
						if pauseMenuPosition == 0 _backString = "[wave]Back[/wave]";
						if pauseMenuPosition == 1 _masterVolumeString = "[wave]\nMaster Volume[/wave]";
						if pauseMenuPosition == 2 _sfxVolumeString = "[wave]\nSFX Volume[/wave]";
						if pauseMenuPosition == 3 _bgmVolumeString = "[wave]\nMusic Volume[/wave]";
						if pauseMenuPosition == 4 _ambVolumeString = "[wave]\nAmbience[/wave]";
				
						var _offsetX = -485;
						var _offsetY = _masterOffsetY;
	
						draw_set_halign(fa_left);
						draw_text_scribble(_x + _offsetX, _y + _offsetY, _backString + _masterVolumeString + _sfxVolumeString + _bgmVolumeString + _ambVolumeString);
						draw_set_halign(fa_center);
				
						_offsetX = 330;
						_offsetY = -80;
					
						var _spacing = 80;
						var _iconOffsetX = 150;
				
						draw_sprite(volumeSliderSprite, global.volumeMaster, _x + _offsetX, _y + _offsetY);
						draw_sprite(volumeMuteIcon, 0, _x + _offsetX - _iconOffsetX, _y + _offsetY);
						draw_sprite(volumeLoudIcon, 0, _x + _offsetX + _iconOffsetX, _y + _offsetY);
					
						draw_sprite(volumeSliderSprite, global.volumeSFX, _x + _offsetX, _y + _offsetY + _spacing);
						draw_sprite(volumeMuteIcon, 0, _x + _offsetX - _iconOffsetX, _y + _offsetY + _spacing);
						draw_sprite(volumeLoudIcon, 0, _x + _offsetX + _iconOffsetX, _y + _offsetY + _spacing);
					
						draw_sprite(volumeSliderSprite, global.volumeBGM, _x + _offsetX, _y + _offsetY + _spacing*2);
						draw_sprite(volumeMuteIcon, 0, _x + _offsetX - _iconOffsetX, _y + _offsetY + _spacing*2);
						draw_sprite(volumeLoudIcon, 0, _x + _offsetX + _iconOffsetX, _y + _offsetY + _spacing*2);
						
						draw_sprite(volumeSliderSprite, global.volumeAMB, _x + _offsetX, _y + _offsetY + _spacing*3);
						draw_sprite(volumeMuteIcon, 0, _x + _offsetX - _iconOffsetX, _y + _offsetY + _spacing*3);
						draw_sprite(volumeLoudIcon, 0, _x + _offsetX + _iconOffsetX, _y + _offsetY + _spacing*3);
				
					} break;
					
					case "Gameplay settings": {
				
						var _backString = "Back";
						var _runModeString = global.runModeIsToggle ? "\nToggle Run: ON" : "\nToggle Run: OFF";
						var _assistModeString = global.assistMode ? "\nAssistance: ON" : "\nAssistance: OFF";
						var _screenShakeString = global.screenShake ? "\nScreen Shake: ON" : "\nScreen Shake: OFF";
	
						if pauseMenuPosition == 0 _backString = "[wave]Back[/wave]";
						if pauseMenuPosition == 1 _runModeString = global.runModeIsToggle ? "[wave]\nToggle Run: ON[/wave]" : "[wave]\nToggle Run: OFF[/wave]";
						if pauseMenuPosition == 2 _assistModeString = global.assistMode ? "[wave]\nAssistance: ON[/wave]" : "[wave]\nAssistance: OFF[/wave]";
						if pauseMenuPosition == 3 _screenShakeString = global.screenShake ? "[wave]\nScreen Shake: ON" : "[wave]\nScreen Shake: OFF";
				
						var _offsetX = 0;
						var _offsetY = _masterOffsetY;
	
						draw_text_scribble(_x + _offsetX, _y + _offsetY, _backString + _runModeString + _assistModeString + _screenShakeString);
				
					} break;
			
				}
		
			} break;
	
		}
		
		var _menuSpriteOffsetX = 400;
		var _menuSpriteOffsetY = -40;
	
		if _canDrawMenuSprites {
	
			draw_sprite(_menuSpritePitter, 0, _x - _menuSpriteOffsetX, _y + _menuSpriteOffsetY);
			if global.splitScreenActive draw_sprite(_menuSpritePatter, 0, _x + _menuSpriteOffsetX, _y + _menuSpriteOffsetY);
		
		}
	
		draw_set_halign(fa_left);
		draw_set_font(_oldFont);

	}
	
}

function activateCutscene() {

	global.cutsceneActive = true;
	global.playerControl = false;

	if playerIsPresent() {
		
		obj_player.jumpDisabled = true;
		
		cancelGroundPound();
		
	}
	
	if room == rm_forest_doubleJumpGet {
	
		audio_sound_gain(amb_forest_ambience, 0, 2000);
		audio_sound_gain(obj_control.bgmForest, 0, 2000);
		audio_play_sound(sfx_liquid_splash, 1, 0);
		audio_play_sound(sfx_cinematic_rumble, 1, 0);
		
		if pitterPlayerIsPresent() && patterPlayerIsPresent() {
		
			obj_player_pitter.image_alpha = 0;
			obj_player_patter.image_alpha = 0;
		
		}
	
	}
	
	if room == rm_cave_groundPoundGet {
	
		audio_sound_gain(amb_cave_with_water_dripping, 0, 2000);
		audio_sound_gain(obj_control.bgmCave, 0, 2000);
		audio_play_sound(sfx_liquid_splash, 1, 0);
		audio_play_sound(sfx_cinematic_rumble, 1, 0);
		
		if pitterPlayerIsPresent() && patterPlayerIsPresent() {
		
			obj_player_pitter.image_alpha = 0;
			obj_player_patter.image_alpha = 0;
		
		}
	
	}

}

function deactivateCutscene() {

	global.cutsceneActive = false;
	global.playerControl = true;

	if playerIsPresent() obj_player.jumpDisabled = false;

}

function scr_isControllerConnected() {

	var _connected = false;
	var gp_num = gamepad_get_device_count();
	for (var i = 0; i < gp_num; i++;) {
		
	    if gamepad_is_connected(i) _connected = true;
		
	}
		
	return _connected;

}

function playerIsPresent() {

	return instance_exists(obj_player);

}

function pitterPlayerIsPresent() {

	return instance_exists(obj_player_pitter);

}

function patterPlayerIsPresent() {

	return instance_exists(obj_player_patter);

}

function normalizeStretching() {

	if xStretch > 1 {

		xStretch -= stretchAdjustAmount;
		xStretch = max(xStretch, 1);

	} else {

		xStretch += stretchAdjustAmount;
		xStretch = min(xStretch, 1);

	}

	if yStretch > 1 {

		yStretch -= stretchAdjustAmount;
		yStretch = max(yStretch, 1);

	} else {

		yStretch += stretchAdjustAmount;
		yStretch = min(yStretch, 1);

	}

}

//Sets up the title screen menu
function titleScreenIntro() {

	//scribble_anim_wave(1, 0.1, 0.1);
	scribble_anim_wave(5, 0.1, 0.1);
	
	particleSetup();

	global.titleScreenMenuActive = true;
	global.playerControl = false;
	
	obj_control.alarm[1] = global.delayBeforeTitleScreen;

	if playerIsPresent() {
	
		with obj_player {
		
			happyPicnic = true;
			sprite_index = happySprite;
			alarm[0] = heartParticleSpawnRate;
		
		}
	
	}

}

function startNewGame() {

	var _delayUntilCutsceneBegins = 60;

	typingNewGame = false;
	//global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.PAD_WARMING_UP;
	global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.STARTING_CUTSCENE;
	obj_control.alarm[1] = _delayUntilCutsceneBegins;



}

function spawnPitter() {
	
	//show_debug_message("Respawning")

	var _offsetY = 20;

	obj_control.canDrawDivider = true;
	
	with objBktGlitchDemo {
	
		intensity = 0;
		channelShift = 0;
		channelDispersion = 0;
		intensityIncrementType = INCREMENT_TYPE.DECREASING_TO_ZERO;
	
	}
	
	if audio_is_playing(obj_control.bgmCaveChase) {
	
		audio_stop_sound(obj_control.bgmCaveChase);
		audio_sound_pitch(obj_control.bgmCaveChase, 1.0);
	
	}
	
	
	
	instance_destroy(obj_background_blackScreen);
	
	//application_surface_draw_enable(true);
	
	//room_goto(obj_player_pitter.roomRespawn);
	var _roomToSpawnIn = asset_get_index(global.roomToSpawnIn);
	
	with obj_background_cloud {
	
		if room == _roomToSpawnIn {
			
			destroy = false;
			alarm[0] = 2;
			
		}
		
	}
	
	audio_stop_sound(sfx_portal_idle);
	
	//room_goto(asset_get_index(global.roomToSpawnIn));
	room_goto(_roomToSpawnIn);
	
	//show_debug_message("global.xRespawnPitter: " + string(global.xRespawnPitter))
	//show_debug_message("global.yRespawnPitter: " + string(global.yRespawnPitter))
	
	//TEMP
	//global.portalsActive = true;
	//global.patterOffsetY = -144;
	
	//obj_player_pitter.x = obj_player_pitter.xRespawn;
	//obj_player_pitter.y = obj_player_pitter.yRespawn - _offsetY;
	obj_player_pitter.x = global.xRespawnPitter;
	obj_player_pitter.y = global.yRespawnPitter - _offsetY;
	
	//show_debug_message("obj_player_pitter.x: " + string(obj_player_pitter.x))
	//show_debug_message("obj_player_pitter.y: " + string(obj_player_pitter.y))
	
	obj_player_pitter.crushed = false;
	obj_player_pitter.enemyKilledPlayer = false;
	
	obj_player_pitter.jumpMax = 1;
	obj_player_pitter.gemPowerupDoubleJump = false;
	
	//Reset checkpoint defeat count for new checkpoints
	if instance_nearest(obj_player_pitter.x, obj_player_pitter.y, obj_trigger_checkPoint) != global.currentCheckpoint {
		
		global.currentCheckpointDefeatCount = 0;
		//show_debug_message("Checkpoint defeat count reset")
		
	}
	
	
	//Track number of defeats at this checkpoint
	global.currentCheckpoint = instance_nearest(obj_player_pitter.x, obj_player_pitter.y, obj_trigger_checkPoint);
	
	//if !global.currentCheckpoint.portalCheckpoint {
	//	
	//	show_debug_message("Portals have been de-activated via respawn")
	//	global.portalsActive = false;
	//	
	//} else {
	//
	//	show_debug_message("Portals have been activated via respawn")
	//	global.portalsActive = true;
	//
	//}
	
	global.portalsActive = false;
	
	global.currentCheckpointDefeatCount++;
	
	//show_debug_message("global.currentCheckpointDefeatCount: " + string(global.currentCheckpointDefeatCount))
	
	//Spawn the assist mode helper if player died enough times	
	if  global.currentCheckpoint != noone {
	
		if (global.currentCheckpointDefeatCount >= global.currentCheckpoint.trigger_threshold) {
	  
			//show_debug_message("Attempting to create shadow assist")
	
			var _delayUntilShadowSpawn = 2;
		
			obj_control.alarm[3] = _delayUntilShadowSpawn;
	
		}
	
	}
	
}

function spawnPatter() {
	
	var _offsetY = 20;

	obj_control.canDrawDivider = true;

	//show_debug_message()

	obj_player_patter.x = global.xRespawnPatter;
	obj_player_patter.y = global.yRespawnPatter - _offsetY;
	
	obj_player_patter.crushed = false;
	obj_player_patter.enemyKilledPlayer = false;
	
	obj_player_patter.jumpMax = 1;
	obj_player_patter.gemPowerupDoubleJump = false;

}



function playerDefeated() {

	if global.playerDefeated exit;

	global.playerDefeated = true;
	global.defeatCount++;

	audio_play_sound(sfx_hurt, 1, 0);
	global.playerControl = false;
	obj_control.alarm[0] = global.playerRespawnTime; 

	other.sprite_index = other.defeatSprite;
	other.xStretch = 1;
	other.yStretch = 1;
	
	if other.object_index == obj_player_pitter {

	

	}

}

function playerCaughtByForestGhost() {

	if global.playerDefeated exit;

	global.playerDefeated = true;
	global.defeatCount++;
	
	with objBktGlitchDemo {
	
		intensity = 0;
		channelShift = 0;
		channelDispersion = 0;
	
	}

	audio_play_sound(sfx_hurt, 1, 0);
	audio_play_sound(sfx_mouseScream, 1, 0);
	global.playerControl = false;
	
	var _extraRespawnTime = 180;
	
	obj_control.alarm[0] = global.playerRespawnTime + _extraRespawnTime; 

	other.sprite_index = other.defeatSprite;
	
	with obj_manager_spookyForestGhost {
	
		timer = 0;
		timerActive = false;
		ambienceFadingIn = false;
		ambienceFadingIn2 = false;
		ambienceFadingIn3 = false;
		glitchesAppearing = false;
		textAppearing = false;
		textFinishedAppearing = false;
		ghostArriving = false;
		ambienceFadingOut = false;
		ghostDeparting = false;
		ghostGone = false;
	
	}
	
	obj_control.canDrawDivider = false;
	
	if audio_is_playing(bgm_abyssalDescent) audio_stop_sound(bgm_abyssalDescent);
	if audio_is_playing(bgm_cursedAtmosphere) audio_stop_sound(bgm_cursedAtmosphere);
	if audio_is_playing(bgm_cursedAtmosphere_LOUD) audio_stop_sound(bgm_cursedAtmosphere_LOUD);
	if audio_is_playing(bgm_cursedAtmosphere_VERYLOUD) audio_stop_sound(bgm_cursedAtmosphere_VERYLOUD);
	if audio_is_playing(bgm_ephemeralEcho) audio_stop_sound(bgm_ephemeralEcho);
	if audio_is_playing(bgm_ghostlyReverberations) audio_stop_sound(bgm_ghostlyReverberations);
	if audio_is_playing(bgm_paranormalInfusion) audio_stop_sound(bgm_paranormalInfusion);
	if audio_is_playing(sfx_ghost_scream) audio_stop_sound(sfx_ghost_scream);
	if audio_is_playing(sfx_ghost_scream_LOUD) audio_stop_sound(sfx_ghost_scream_LOUD);
	if audio_is_playing(sfx_ghost_scream_VERYLOUD) audio_stop_sound(sfx_ghost_scream_VERYLOUD);
	if audio_is_playing(sfx_ghost_scream2) audio_stop_sound(sfx_ghost_scream2);
	if audio_is_playing(sfx_ghost_scream2_LOUD) audio_stop_sound(sfx_ghost_scream2_LOUD);
	if audio_is_playing(sfx_glitch_loop) audio_stop_sound(sfx_glitch_loop);
	if audio_is_playing(sfx_glitch_loop2) audio_stop_sound(sfx_glitch_loop2);
	
	if other.object_index == obj_player_pitter {

	

	}

}


function checkForMenuInput() {

	confirm = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) ||
	gamepad_button_check_pressed(global.controllerPort, gp_face1) || gamepad_button_check_pressed(global.controllerPort, gp_start);
	
	back = keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_backspace) || gamepad_button_check_pressed(global.controllerPort, gp_face2);
	
	moveUp = keyboard_check_pressed(ord("W")) || global.moveUp;
	moveDown = keyboard_check_pressed(ord("S")) || global.moveDown;
	moveLeft = keyboard_check_pressed(ord("A")) || global.moveLeft;
	moveRight = keyboard_check_pressed(ord("D")) || global.moveRight;
	
	if global.paused {
	
		if moveUp || moveDown audio_play_sound(sfx_select, 1, 0);
	
	}
	

}

function pauseButtonPressed() {

	return keyboard_check_pressed(vk_enter) || 
	keyboard_check_pressed(vk_escape) || 
	gamepad_button_check_pressed(global.controllerPort, gp_start);

}


function togglePause() {
	
	//if playerIsPresent() {
	//
	//	if obj_player.groundPounding return;
	//
	//}
	
	audio_play_sound(sfx_pause, 1, 0);
	
	if global.paused {
	
		show_debug_message("Game is now paused")
		
		obj_control.pauseMenuPosition = 0;
	
		with (all) {
		
			//Save all instance image speeds
			gamePausedImageSpeed = image_speed;
			
			image_speed = 0;
		
		}
		
	} else {
	
		show_debug_message("Game is now unpaused")
	
	
	
		with (all) {
			
			if variable_instance_exists(id, "gamePausedImageSpeed") {
		
				image_speed = gamePausedImageSpeed;
			
			} else {
			
				image_speed = 1;
				//image_speed = global.paused ? 0 : 1; //Use this if saving/loading can happen while game is paused
			
			}
			
		}
	
		if playerIsPresent() {
			
			with obj_player {
	
				jumpDisabled = true;
		
			}
		
		}
	
	}

}


function analogStickMenuMovement() {

	//Handle moving in menus with the analog stick 
	
	var _axisSensitivity = 0.5;

	global.moveUp = false;
	global.moveDown = false;
	global.moveLeft = false;
	global.moveRight = false;

	if !global.hasMovedUp && gamepad_axis_value(global.controllerPort,gp_axislv) < -_axisSensitivity {
	
		global.moveUp = true;
		global.hasMovedUp = true;
	
	}

	if global.hasMovedUp && gamepad_axis_value(global.controllerPort,gp_axislv) == 0 {

		global.hasMovedUp = false;

	}

	if !global.hasMovedDown && gamepad_axis_value(global.controllerPort,gp_axislv) > _axisSensitivity {
	
		global.moveDown = true;
		global.hasMovedDown = true;
	
	}

	if global.hasMovedDown && gamepad_axis_value(global.controllerPort,gp_axislv) == 0 {

		global.hasMovedDown = false;

	}

	if !global.hasMovedLeft && gamepad_axis_value(global.controllerPort,gp_axislh) < -_axisSensitivity {
	
		global.moveLeft = true;
		global.hasMovedLeft = true;
	
	}

	if global.hasMovedLeft && gamepad_axis_value(global.controllerPort,gp_axislh) == 0 {

		global.hasMovedLeft = false;

	}

	if !global.hasMovedRight && gamepad_axis_value(global.controllerPort,gp_axislh) > _axisSensitivity {
	
		global.moveRight = true;
		global.hasMovedRight = true;
	
	}

	if global.hasMovedRight && gamepad_axis_value(global.controllerPort,gp_axislh) == 0 {

		global.hasMovedRight = false;

	} 


}

function isLastAnimationFrame() {

	return image_index > image_number - 1 ? true : false;
	
}

function drawWhiteTextWithBlackOutline() { //For drawing white text with black outline

	var _xx = argument[0];
	var _yy = argument[1];
	var _tt = argument[2];
			
	draw_set_color(c_black);
			
	draw_text_scribble(_xx+1,_yy,_tt);
	draw_text_scribble(_xx-1,_yy,_tt);
	draw_text_scribble(_xx,_yy+1,_tt);
	draw_text_scribble(_xx,_yy-1,_tt);

	draw_set_color(c_white);
			
	draw_text_scribble(_xx, _yy, _tt); 

}

function triggerFireworkMachines() {

	with obj_interactable_firework {
		
		if triggered exit;
	
		triggered = true;
	
		if !audio_is_playing(sfx_cake_firework) audio_play_sound(sfx_cake_firework, 1, 0, 0.5, 0, 1.5);
		if !audio_is_playing(sfx_powerup) audio_play_sound(sfx_powerup, 1, 0, 0.5, 0, 2.0);

		instance_create_layer(x, y, "Instances", obj_interactable_fireworkBall);
	
	}

}

function spawnGroundPoundFloorPieces() {

	var _piecesAmount = 4;
	
	var _hSpeedMin = -3;
	var _hSpeedMax = 3;
	var _vSpeedMin = -5;
	var _vSpeedMax = -2;
	
	var _rotationSpeed = random_range(2, 900);
	
	var _rotationSpeedMin = 1;
	var _rotationSpeedMax = 10;
	
	var _gravity = 0.05;
		
	for(var i = 0; i < _piecesAmount; i++) {

		with instance_create_layer(x, y, "Instances", obj_background_groundPoundFloorPiece) {
	
			sprite_index = choose(
			
				spr_background_groundPoundFloorPiece,
				spr_background_groundPoundFloorPiece2,
				spr_background_groundPoundFloorPiece3,
			
			);
	
			hspeed = random_range(_hSpeedMin, _hSpeedMax);
			vspeed = random_range(_vSpeedMin, _vSpeedMax);
			
			gravity = _gravity;
			
			image_angle = random_range(0, 360);
			rotationSpeed = random_range(_rotationSpeedMin, _rotationSpeedMax);
			
			depth = -10000;
	
		}
	
	}
	
	var _pitch = random_range(0.25, 0.35);
	
	//if !audio_is_playing(sfx_slice) audio_play_sound(sfx_slice, 1, 0, 1, 0, _pitch);
	if audio_is_playing(sfx_slice) audio_stop_sound(sfx_slice);
	
	audio_play_sound(sfx_slice, 1, 0, 1, 0, _pitch);

}

function spawnBreakableFloorPieces() {

	var _piecesAmount = 4;
	
	var _hSpeedMin = -2;
	var _hSpeedMax = 2;
	var _vSpeedMin = -5;
	var _vSpeedMax = -2;
	
	var _rotationSpeed = random_range(2, 900);
	
	var _rotationSpeedMin = 1;
	var _rotationSpeedMax = 10;
	
	var _gravity = 0.05;
		
	for(var i = 0; i < _piecesAmount; i++) {

		with instance_create_layer(x + (sprite_width/2), y, "Instances", obj_background_breakableFloorPiece) {
	
			sprite_index = choose(
			
				spr_background_breakableFloorPiece,
				spr_background_breakableFloorPiece2,
				spr_background_breakableFloorPiece3,
			
			);
	
			hspeed = random_range(_hSpeedMin, _hSpeedMax);
			vspeed = random_range(_vSpeedMin, _vSpeedMax);
			
			gravity = _gravity;
			
			image_angle = random_range(0, 360);
			rotationSpeed = random_range(_rotationSpeedMin, _rotationSpeedMax);
			
			depth = -10000;
	
		}
	
	}
	
	//var _pitch = random_range(0.25, 0.35);
	
	//if !audio_is_playing(sfx_slice) audio_play_sound(sfx_slice, 1, 0, 1, 0, _pitch);
	//if audio_is_playing(sfx_slice) audio_stop_sound(sfx_slice);
	
	//audio_play_sound(sfx_slice, 1, 0, 1, 0, _pitch);

}

function shakeScreen(_mag, _frames) {
    
	if !global.screenShake return;
	
	// We tell the camera object to start shaking
    with (obj_camera) {
        if (_mag > shake_remain) { // Only override if the new shake is stronger
            shake_magnitude = _mag;
            shake_remain = _mag;
            shake_length = _frames;
        }
    }
}
//@
function detectMiscObjectDuringGroundPound(_object) {

	if _object != noone && groundPoundFalling {
	
		if _object.object_index == obj_interactable_switch_groundPound 
		|| _object.object_index == obj_interactable_switch_groundPound_1 
		|| _object.object_index == obj_interactable_switch_groundPound_2 
		|| _object.object_index == obj_interactable_switch_groundPound_3 
		|| _object.object_index == obj_interactable_switch_groundPound_4 {
			
			if !_object.inactive _object.pressed = true;
			
		}
				
	}

}

function detectFloorDuringGroundPound(_floor) {

	if _floor != noone && groundPoundFalling {
	
		if _floor.object_index != obj_interactable_groundPoundFloor {
			
			//show_debug_message("floor ground pounded")
			
			if _floor.object_index == obj_interactable_switch_block_onOffBlock 
			|| _floor.object_index == obj_interactable_switch_block_tempActivator_oneTimeUse {
			
				//show_debug_message("switch block ground pounded")
				
				with _floor {
				
					if !inert {
	
						bonked = true;
						if visible || secret audio_play_sound(sfx_pause, 1, 0, 1, 0, 2.0);
			
					}
				
				}
				
			}
			
			if _floor.object_index == obj_interactable_demoBoulder && (room != rm_cave_bigBreakableRockFloor && room != rm_cave_chase_bigBreakableRockFloor) {
			
				//show_debug_message("boulder ground pounded")
				
				if _floor.moveDistance >= 24 {
			//	if _floor.moveDistance >= 2 {
				
					//var _fallSpeed = _floor.fallingSpeed; //8
				
					//_floor.vspeed = _fallSpeed;
					_floor.vspeed = _floor.fallingSpeed;
					
					stuckOnBoulder = true;
					
					ySpeed = 0;
					
					obj_control.playerFallingWithBoulder = true;
				
				}
				
				_floor.y += _floor.moveDistance;
				
				_floor.moveDistance *= 2;
				
			}
			
			y = _floor.y;
			groundPounding = false;
			groundPoundRising = false;
			groundPoundFalling = false;
			vspeed = 0;
			gravity = 0;
			jumpCount = 0;
					
			var _offsetX = 5;
		
			instance_create_layer(x - _offsetX, y, "Instances", obj_vfx_dust_groundPound);
			instance_create_layer(x + _offsetX, y, "Instances", obj_vfx_dust_groundPound, {image_xscale : -1});
		
			var _pitch = random_range(1.10, 1.20);
			audio_play_sound(sfx_explosion, 1, 0, 1, 0, _pitch);
			
			var _screenShakeMagnitude = 2;
			var _screenShakeFrames = 10;
			
			shakeScreen(_screenShakeMagnitude, _screenShakeFrames);
		
		}
	
	}

}

function detectEnemyDuringGroundPound(_enemy) {

	if _enemy != noone && groundPoundFalling {
	
		show_debug_message("enemy ground pounded")
	
		y = _enemy.y;
		groundPounding = false;
		groundPoundRising = false;
		groundPoundFalling = false;
		vspeed = 0;
		gravity = 0;
		jumpCount = 0;
				
		var _offsetX = 5;
		
		//var _launchSpeed = jumpOffEnemySpeed[1];
		var _launchSpeed = -9;
		
		if _enemy.object_index != obj_enemy_beetle_dead
		&& _enemy.object_index != obj_enemy_beetle_horned_dead _enemy.defeated = true;
		//_enemy.xStretch = 1.5;
		//_enemy.yStretch = 0.5;
		_enemy.xStretch = 1.9;
		_enemy.yStretch = 0.1;
		setOnGround(false);
		ySpeed = _launchSpeed;
		enemyKilledPlayer = false;
		
		//instance_create_layer(x - _offsetX, y, "Instances", obj_vfx_dust_groundPound);
		//instance_create_layer(x + _offsetX, y, "Instances", obj_vfx_dust_groundPound, {image_xscale : -1});
		
		var _actionLinesOffsetY = -15;
		
		instance_create_layer(x, y + _actionLinesOffsetY, "Instances", obj_vfx_actionLines_enemyImpact);
		
		var _pitch = random_range(1.10, 1.20);
		audio_play_sound(sfx_explosion, 1, 0, 1, 0, _pitch);
		
		var _screenShakeMagnitude = 2;
		var _screenShakeFrames = 10;
		
		shakeScreen(_screenShakeMagnitude, _screenShakeFrames);
		
		exit;
		
	}

}

function detectScammerDuringGroundPound(_scammer) {

	if _scammer != noone if groundPoundFalling {
	
		//show_debug_message("scammer ground pounded")
		
		scammerGroundPoundCount++;
		
		var _scammerGroundPoundCount = scammerGroundPoundCount;
	
		_scammer.sprite_index = spr_npc_scammer_pain;
		
		var _coinsToSpawn = irandom_range(8, 12);
		
		for (var i = 0; i < _coinsToSpawn; ++i) {
		   
			with instance_create_layer(_scammer.x, _scammer.y, "Instances", obj_pickup_coin_gravity) {
		 
				gravity = 0.5;
				speed = random_range(5, 15);
				direction = random_range(40, 140);
		
			}
		  
		}
		
		var _spitParticlesToSpawn = irandom_range(8, 12);
		
		for (var i = 0; i < _spitParticlesToSpawn; ++i) {
		   
			with instance_create_layer(_scammer.x, _scammer.y, "Instances", obj_background_mistCloud) {
		 
				gravity = 0.5;
				speed = random_range(5, 15);
				direction = random_range(40, 140);
				
				var _scale = 0.25;
				
				image_xscale = _scale;
				image_yscale = _scale;
		
			}
		  
		}
		
		with _scammer {
		
			vspeed = vSpeedAmount2;
			gravity = gravAmount;

		}
		
		with obj_trigger_dialogue {
		
			var _text = choose("OW, OW, STOP!", "MY COINS!", "SO MUCH PAIN!", "UNCLE, UNCLE!", "MY HEAD!", "OW, PLEASE LADY!", "IT HURTS!", "OW, MOMMY!!");
			
			while _text == dialogueString[0] {
			
				_text = choose("OW, OW, STOP!", "MY COINS!", "SO MUCH PAIN!", "UNCLE, UNCLE!", "MY HEAD!", "OW, PLEASE LADY!", "IT HURTS!", "OW, MOMMY!!");
			
			}
			
			var _textArray = [
			
				"OW!",
				"OW, WHAT THE HELL!? STOP THAT!",
				"OW, OW, STOP!",
				"MY COINS!", 
				"SO MUCH PAIN!", 
				"UNCLE, UNCLE!", 
				"MY HEAD!", 
				"OW, PLEASE LADY!", 
				"IT HURTS!", 
				"OW, MOMMY!!",
				"BLEAUGH!!",
			
			];
		
			count = 0;
			alarm[0] = textDisplayDuration;
			dialogueString = [];
			//dialogueString[0] = _scammerGroundPoundCount == 1 ? "OW, WHAT THE HELL!? STOP THAT!" : choose("OW, OW, STOP!", "OW, MY COINS!", "THE PAIN!", "UNCLE, UNCLE!", "OW, MY HEAD!", "OW, PLEASE LADY!");
			//dialogueString[0] = _scammerGroundPoundCount == 1 ? "OW, WHAT THE HELL!? STOP THAT!" : _text;
			dialogueString[0] = _textArray[_scammerGroundPoundCount];
			
			if _scammerGroundPoundCount >= 10 {
			
				var _cutsceneID = 10;
				var _delay = 10;
				var _customtextDisplayDuration = 180;
				
				alarm[0] = _customtextDisplayDuration;
				
				global.currentCutsceneID = CUTSCENE_ID.CAVES_HAUNTING_PART2;	
				obj_cutsceneSystem.alarm[0] = _delay;	
				
				obj_player_patter.aboutToBeatUpScammer = false;
				
				dialogueString[0] = global.dialogueStringArrays.cavesHauntingPart2[0];
				dialogueString[1] = global.dialogueStringArrays.cavesHauntingPart2[1];
				dialogueString[2] = global.dialogueStringArrays.cavesHauntingPart2[2];
				dialogueString[3] = global.dialogueStringArrays.cavesHauntingPart2[3];
				dialogueString[4] = global.dialogueStringArrays.cavesHauntingPart2[4];
				dialogueString[5] = global.dialogueStringArrays.cavesHauntingPart2[5];
				
				with obj_npc_scammer_mines {
				
					jumping = true;
					alarm[1] = delayBeforeJump;
				
				}
				
				
			
			
			}
		
		}
	
		y = _scammer.y;
		groundPounding = false;
		groundPoundRising = false;
		groundPoundFalling = false;
		vspeed = 0;
		gravity = 0;
		jumpCount = 0;
				
		
		
		//var _launchSpeed = jumpOffEnemySpeed[1];
		var _launchSpeed = -9;
		
	
		_scammer.xStretch = 1.9;
		_scammer.yStretch = 0.1;
		setOnGround(false);
		ySpeed = _launchSpeed;
	
		var _actionLinesOffsetY = -15;
		
		instance_create_layer(x, y + _actionLinesOffsetY, "Instances", obj_vfx_actionLines_enemyImpact);
		
		var _offsetX = 5;
		
		instance_create_layer(x - _offsetX, y, "Instances", obj_vfx_dust_groundPound);
		instance_create_layer(x + _offsetX, y, "Instances", obj_vfx_dust_groundPound, {image_xscale : -1});
		
		var _pitch = random_range(1.10, 1.20);
		//audio_play_sound(sfx_explosion, 1, 0, 1, 0, _pitch);
		
		var _screenShakeMagnitude = 2;
		var _screenShakeFrames = 10;
		
		shakeScreen(_screenShakeMagnitude, _screenShakeFrames);
		
		exit;
		
	}

}

function setPatterAngrySprites() {

	with obj_player_patter {

		maskSprite = spr_patter_idle; 
		idleSprite = spr_patter_idle_veryAngry;
		walkSprite = spr_patter_walk_veryAngry;
		runSprite = spr_patter_run_veryAngry;
		jumpSprite = spr_patter_jump_veryAngry;
		crouchSprite = spr_patter_crouch_veryAngry;
		lookingUpSprite = spr_patter_lookUp_veryAngry;
		climbingSprite = spr_patter_climb;
		defeatSprite = spr_patter_defeat;
		crushedSprite = spr_patter_splat;
		happySprite = spr_patter_happy_animated;
		concernSprite = spr_patter_pause;
		scaredSprite = spr_patter_scared;
		curiousSprite = spr_patter_curious;
		groundPoundJumpSprite = spr_patter_groundPound_jump_veryAngry;
		groundPoundFallSprite = spr_patter_groundPound_fall_veryAngry;
		groundPoundFallBoulderSprite = spr_patter_groundPound_fall_angry;
	
	}

}

function setPitterScaredSprites() {

	with obj_player_pitter {

		maskSprite = spr_pitter_idle; 
		idleSprite = spr_pitter_scared_idle;
		walkSprite = spr_pitter_scared_walk;
		runSprite = spr_pitter_scared_run;
		jumpSprite = spr_pitter_scared_jump;
		crouchSprite = spr_pitter_crouch;
		lookingUpSprite = spr_pitter_scared_lookUp;
		climbingSprite = spr_pitter_climb;
		defeatSprite = spr_pitter_defeat;
		crushedSprite = spr_pitter_splat;
		happySprite = spr_pitter_happy_animated;
		concernSprite = spr_pitter_pause;
		scaredSprite = spr_pitter_scared;
		curiousSprite = spr_pitter_curious;
		groundPoundJumpSprite = spr_pitter_scared_groundPound_jump;
		groundPoundFallSprite = spr_pitter_scared_groundPound_fall;
		//groundPoundFallBoulderSprite = spr_pitter_groundPound_fall_angry;
	
	}

}

function setPatterScaredSprites() {

	with obj_player_patter {

		maskSprite = spr_patter_idle; 
		idleSprite = spr_patter_scared_idle;
		walkSprite = spr_patter_scared_walk;
		runSprite = spr_patter_scared_run;
		jumpSprite = spr_patter_scared_jump;
		crouchSprite = spr_patter_crouch;
		lookingUpSprite = spr_patter_scared_lookUp;
		climbingSprite = spr_patter_climb;
		defeatSprite = spr_patter_defeat;
		crushedSprite = spr_patter_splat;
		happySprite = spr_patter_happy_animated;
		concernSprite = spr_patter_pause;
		scaredSprite = spr_patter_scared;
		curiousSprite = spr_patter_curious;
		groundPoundJumpSprite = spr_patter_scared_groundPound_jump;
		groundPoundFallSprite = spr_patter_scared_groundPound_fall;
		groundPoundFallBoulderSprite = spr_patter_groundPound_fall_angry;
	
	}

}

function resetPitterSprites() {

	with obj_player_pitter {

		maskSprite = spr_pitter_idle; 
		idleSprite = spr_pitter_idle;
		walkSprite = spr_pitter_walk;
		runSprite = spr_pitter_run;
		jumpSprite = spr_pitter_jump;
		crouchSprite = spr_pitter_crouch;
		lookingUpSprite = spr_pitter_curious;
		climbingSprite = spr_pitter_climb;
		defeatSprite = spr_pitter_defeat;
		crushedSprite = spr_pitter_splat;
		happySprite = spr_pitter_happy_animated;
		concernSprite = spr_pitter_pause;
		scaredSprite = spr_pitter_scared;
		curiousSprite = spr_pitter_curious;
		groundPoundJumpSprite = spr_pitter_groundPound_jump;
		groundPoundFallSprite = spr_pitter_groundPound_fall;
		groundPoundFallBoulderSprite = spr_pitter_groundPound_fall_scared;
	
	}

}

function resetPatterSprites() {

	with obj_player_patter {

		maskSprite = spr_patter_idle; 
		idleSprite = spr_patter_idle;
		walkSprite = spr_patter_walk;
		runSprite = spr_patter_run;
		jumpSprite = spr_patter_jump;
		crouchSprite = spr_patter_crouch;
		lookingUpSprite = spr_patter_curious;
		climbingSprite = spr_patter_climb;
		defeatSprite = spr_patter_defeat;
		crushedSprite = spr_patter_splat;
		happySprite = spr_patter_happy_animated;
		concernSprite = spr_patter_pause;
		scaredSprite = spr_patter_scared;
		curiousSprite = spr_patter_curious;
		groundPoundJumpSprite = spr_patter_groundPound_jump;
		groundPoundFallSprite = spr_patter_groundPound_fall;
		groundPoundFallBoulderSprite = spr_patter_groundPound_fall_angry;
	
	}

}

function resetCameraLeading() {

	with obj_camera {
	
		if cameraLeadingX > 0 cameraLeadingX--;
		if cameraLeadingX < 0 cameraLeadingX++;
	
	}

}

function cancelGroundPound() {

	with obj_player {
			
		groundPounding = false;
		groundPoundRising = false;
		groundPoundFalling = false;
		vspeed = 0;
		gravity = 0;
	
	}

}

function setUpSpookyGhostAudio() {

	audio_play_sound(bgm_ghostlyReverberations, 1, 1);
	audio_sound_gain(bgm_ghostlyReverberations, 0, 0);

	audio_play_sound(bgm_ephemeralEcho, 1, 1);
	audio_sound_gain(bgm_ephemeralEcho, 0, 0);

	audio_play_sound(bgm_cursedAtmosphere_LOUD, 1, 1);
	audio_sound_gain(bgm_cursedAtmosphere_LOUD, 0, 0);

	audio_play_sound(sfx_glitch_loop, 1, 1);
	audio_sound_gain(sfx_glitch_loop, 0, 0);

	audio_play_sound(sfx_glitch_loop2, 1, 1);
	audio_sound_gain(sfx_glitch_loop2, 0, 0);

}

function fadeOutSpookyGhostAudio() {

	var _fadeOutTime = 12000;
	
	audio_sound_gain(bgm_ghostlyReverberations, 0, _fadeOutTime);
	audio_sound_gain(bgm_ephemeralEcho, 0, _fadeOutTime);
	audio_sound_gain(bgm_cursedAtmosphere, 0, _fadeOutTime);
	audio_sound_gain(bgm_cursedAtmosphere_LOUD, 0, _fadeOutTime);
	audio_sound_gain(bgm_cursedAtmosphere_VERYLOUD, 0, _fadeOutTime);
	audio_sound_gain(sfx_glitch_loop, 0, _fadeOutTime);
	audio_sound_gain(sfx_glitch_loop2, 0, _fadeOutTime);
	audio_sound_gain(sfx_ghost_whisper, 0, _fadeOutTime);
	
}

function resetDialogueStrings(_textDisplayDuration = textDisplayDuration) {

	count = 0;
	alarm[0] = _textDisplayDuration;
	dialogueString = [];

}

function playAudioWithFalloff(_audio, _maxDist = 600, _pitch = 1.0, _loop = false, _useReverb = false) {

	//Calculate distance and volume
	if playerIsPresent() {
	
		var _nearestPlayer = instance_nearest(x,y,obj_player);
	
	   // var _maxDist = 600; // The distance (in pixels) where the sound becomes silent
	    var _dist = point_distance(x, y, _nearestPlayer.x, _nearestPlayer.y);
    
	    // This creates a value between 1 (on top of player) and 0 (far away)
	    var _volume = 1 - (_dist / _maxDist);
	    _volume = clamp(_volume, 0, 1); // Ensure volume doesn't go below 0
    
	    // 3. Play the sound with the calculated volume
	    // Syntax: audio_play_sound(index, priority, loop, gain)
		
		if _useReverb {
		
			audio_play_sound_on(obj_control.reverb_emitter, _audio, _loop, 1, _volume, 0, _pitch);
		
		} else {
		
			audio_play_sound(_audio, 1, _loop, _volume, 0, _pitch);
		
		}
		
	}

}

function disableReverb() {

	obj_control.reverb_effect.bypass = true;

}

function enableTinyReverb() {

	obj_control.reverb_effect.bypass = false;
	obj_control.reverb_effect.size = 0.5;
	obj_control.reverb_effect.damp = 0.95;
	obj_control.reverb_effect.mix = 0.35;

}

function enableSmallReverb() {

	obj_control.reverb_effect.bypass = false;
	obj_control.reverb_effect.size = 0.65;
	obj_control.reverb_effect.damp = 0.95;
	obj_control.reverb_effect.mix = 0.55;

}

function enableLargeReverb() {

	obj_control.reverb_effect.bypass = false;
	obj_control.reverb_effect.size = 0.85;
	obj_control.reverb_effect.damp = 0.95;
	obj_control.reverb_effect.mix = 0.75;

}

function playPortalAnimationGreenSprite() {

	if isLastAnimationFrame() && active && sprite_index == spr_interactable_portalCircle_forming_green {

		sprite_index = spr_interactable_portalCircle_idle_green;
		image_index = 1;
		
		//if !audio_is_playing(sfx_portal_idle) portal_snd_instance = audio_play_sound(sfx_portal_idle, 1, true);
		portal_snd_instance = audio_play_sound(sfx_portal_idle, 1, true);

	}
	
}

function playPortalAnimationRedSprite() {

	if isLastAnimationFrame() && active && sprite_index == spr_interactable_portalCircle_forming_red {

		sprite_index = spr_interactable_portalCircle_idle_red;
		image_index = 1;
		
		//if !audio_is_playing(sfx_portal_idle) portal_snd_instance = audio_play_sound(sfx_portal_idle, 1, true);
		portal_snd_instance = audio_play_sound(sfx_portal_idle, 1, true);

	}
	
}

function managePortalAudioFalloff() {

	if playerIsPresent() {
	
		var _nearestPlayer = instance_nearest(x, y, obj_player);
	
	    var _dist = point_distance(x, y, _nearestPlayer.x, _nearestPlayer.y);
	    var _max_dist = 300; // Distance where sound is silent
    
	    // Calculate volume: 1 at 0px distance, 0 at 600px distance
	    var _vol = clamp(1 - (_dist / _max_dist), 0, 0.8);
	
		//show_debug_message("_vol in green portal: " + string(_vol))
    
	    // Apply volume to a sound that is already playing
	    // (Note: You'd need to start the sound once in the Create event)
	    audio_sound_gain(portal_snd_instance, _vol, 0);
	
	}

}

function setPortalFloat() {

	// The starting Y position to hover around
	anchor_y = y;

	// How fast it floats (higher = faster)
	float_speed = 2; 

	// How far it floats up and down (in pixels)
	float_distance = 8; 

	// A timer to keep track of the wave progression
	float_timer = 0;

}

function portalFloat() {

	// Increase the timer
	float_timer += float_speed;

	// Calculate the new Y position
	// dsin() returns a value between -1 and 1
	y = anchor_y + dsin(float_timer) * float_distance;

}


function playGreenPortalJumpEffects() {
	
	var _nearestExitPortal;
	var _portalID = portalID;

	var _fakeEntrancePortal = collision_line(x, 0, x, room_height, obj_interactable_portal_entrance_FAKE, false, true);
	
	if _fakeEntrancePortal != noone {
	
		with _fakeEntrancePortal {
		
			xStretch = 0.5;
			yStretch = 1.5;
			
			//var _rangeX = 3;
	
			var _offsetX = 0;
			var _offsetY = 0;

			var _numberOfParticles = irandom_range(8,10);

			part_particles_create(global.particleSystemDevice, x + _offsetX, y + _offsetY, global.particlePortalGreen, _numberOfParticles);
		
		}
	
	}
	
	var _fakeEntranceResetPortal = collision_line(x, 0, x, room_height, obj_interactable_portal_entrance_reset_FAKE, false, true);
	
	if _fakeEntranceResetPortal != noone {
	
		with _fakeEntranceResetPortal {
		
			xStretch = 0.5;
			yStretch = 1.5;
			
			//var _rangeX = 3;
	
			var _offsetX = 0;
			var _offsetY = 0;

			var _numberOfParticles = irandom_range(8,10);

			part_particles_create(global.particleSystemDevice, x + _offsetX, y + _offsetY, global.particlePortalGreen, _numberOfParticles);
		
		}
	
	}

	with obj_interactable_portal_exit {

		if portalID = _portalID _nearestExitPortal = id;

	}

	audio_play_sound(sfx_portal_jump, 1, false);

	xStretch = 0.5;
	yStretch = 1.5;

	//with instance_nearest(x, y, obj_interactable_portal_exit) {
	with _nearestExitPortal {

		xStretch = 0.5;
		yStretch = 1.5;

	}

	//var _rangeX = 3;
	
	var _offsetX = 0;
	var _offsetY = 0;

	var _numberOfParticles = irandom_range(8,10);

	part_particles_create(global.particleSystemDevice, x + _offsetX, y + _offsetY, global.particlePortalGreen, _numberOfParticles);

	//with instance_nearest(x, y, obj_interactable_portal_exit) { 
	with _nearestExitPortal { 
	
		_numberOfParticles = irandom_range(8,10);
	
		part_particles_create(global.particleSystemDevice, x + _offsetX, y + _offsetY, global.particlePortalRed, _numberOfParticles);	
		
		var _extraExitPortal = collision_line(x, 0, x, room_height, obj_interactable_portal_exit, false, true);
	
		if _extraExitPortal != noone {
	
			with _extraExitPortal {
		
				xStretch = 0.5;
				yStretch = 1.5;
			
				//_rangeX = 3;
	
				_offsetX = 0;
				_offsetY = 0;

				_numberOfParticles = irandom_range(8,10);

				part_particles_create(global.particleSystemDevice, x + _offsetX, y + _offsetY, global.particlePortalRed, _numberOfParticles);
		
			}
	
		}
		
	}

}

function spawnGoldenParachute() {

	with instance_create_layer(obj_npc_scammer_mines.x, obj_npc_scammer_mines.y, "Collectables", obj_pickup_parachute_gold) {
			
		speed = 4.5;
		direction = 135;
		gravity = 0.25;
	
	}

}

function caughtByCaveGhost() {

	if global.playerDefeated exit;

	global.playerDefeated = true;
	global.defeatCount++;
	
	global.caughtByCaveGhostAmount++;
	
	with obj_player {
	
		instance_create_depth(x, y, -10000, obj_background_blackScreen);
	
	}
	
	//instance_create_depth(obj_player.x, obj_player.y, -10000, obj_background_blackScreen);
	//instance_create_depth(x, y, -10000, obj_background_blackScreen);
	//instance_create_depth(0, 0, -10000, obj_background_blackScreen);
	
	if audio_is_playing(sfx_ghost_screamAlerted) audio_stop_sound(sfx_ghost_screamAlerted);
	//if audio_is_playing(sfx_ghost_screamAlerted) audio_stop_sound(sfx_ghost_screamAlerted);
	
	resetPitterSprites();
	resetPatterSprites();
	
	//application_surface_draw_enable(false);
	
	//with objBktGlitchDemo {
	//
	//	intensity = 0;
	//	channelShift = 0;
	//	channelDispersion = 0;
	//
	//}

	audio_play_sound(sfx_hurt, 1, 0);
	audio_play_sound(sfx_mouseScream, 1, 0);
	global.playerControl = false;
	
	var _extraRespawnTime = 180;
	
	obj_control.alarm[0] = global.playerRespawnTime + _extraRespawnTime; 

	other.sprite_index = other.defeatSprite;
	
	obj_control.canDrawDivider = false;
	
	if audio_is_playing(sfx_glitch_loop) audio_stop_sound(sfx_glitch_loop);
	if audio_is_playing(sfx_glitch_loop2) audio_stop_sound(sfx_glitch_loop2);
	
	//objBktGlitchDemo.intensityIncrementType = INCREMENT_TYPE.DECREASING_TO_ZERO;

}


function caveGhostIsFar() {
	
	//audio_play_sound(bgm_ghostlyReverberations, 1, 1);
	audio_sound_gain(bgm_ghostlyReverberations, 0, 0);

	//audio_play_sound(bgm_ephemeralEcho, 1, 1);
	audio_sound_gain(bgm_ephemeralEcho, 0, 0);

	//audio_play_sound(bgm_cursedAtmosphere_LOUD, 1, 1);
	audio_sound_gain(bgm_cursedAtmosphere_LOUD, 0, 0);

	//audio_play_sound(sfx_glitch_loop, 1, true);
	audio_sound_gain(sfx_glitch_loop, 0, 0);

	//audio_play_sound(sfx_glitch_loop2, 1, true);
	audio_sound_gain(sfx_glitch_loop2, 0, 0);

	with objBktGlitchDemo {
	
		intensityIncrementType = INCREMENT_TYPE.INCREASING_TO_TINY;
		audio_sound_gain(sfx_glitch_loop, 0.025, 2000);
		audio_sound_gain(sfx_glitch_loop2,  0.025, 2000);
	
	}

}

function caveGhostIsClose() {

	with objBktGlitchDemo {
	
		intensityIncrementType = INCREMENT_TYPE.INCREASING_TO_SMALL;
		audio_sound_gain(sfx_glitch_loop, 0.04, 2000);
		audio_sound_gain(sfx_glitch_loop2,  0.04, 2000);
	
	}

}

function caveGhostIsCloseInstant() {

	with objBktGlitchDemo {
	
		intensity = intensityMaxSmall;
		intensityIncrementType = INCREMENT_TYPE.INCREASING_TO_SMALL;
		audio_sound_gain(sfx_glitch_loop, 0.04, 5);
		audio_sound_gain(sfx_glitch_loop2,  0.04, 5);
	
	}

}

function caveGhostIsVeryClose() {

	with objBktGlitchDemo {
	
		intensityIncrementType = INCREMENT_TYPE.INCREASING_TO_LARGE;
		audio_sound_gain(sfx_glitch_loop, 0.1, 2000);
		audio_sound_gain(sfx_glitch_loop2,  0.1, 2000);
	
	}

}

function breakCaveBoulder() {

	//Break nearest cave boulder

	instance_destroy(instance_nearest(x, y, obj_interactable_caveBoulder));


}

function showGlitchDemoVariables() {

	with objBktGlitchDemo {

		show_debug_message("=============================================================================================" )
		show_debug_message("intensity: " + string(intensity))
		show_debug_message("intensityIncreaseAmount: " + string(intensityIncreaseAmount))
		show_debug_message("intensityIncreaseAmount2: " + string(intensityIncreaseAmount2))
		show_debug_message("intensityMax: " + string(intensityMax))
		show_debug_message("intensityMax2: " + string(intensityMax2))
		show_debug_message("channelShift: " + string(channelShift))
		show_debug_message("channelShiftMax: " + string(channelShiftMax))
		show_debug_message("channelShiftIncreaseAmount: " + string(channelShiftIncreaseAmount))
		show_debug_message("channelDispersion: " + string(channelDispersion))
		show_debug_message("channelDispersionMax: " + string(channelDispersionMax))
		show_debug_message("channelDispersionIncreaseAmount: " + string(channelDispersionIncreaseAmount))
		show_debug_message("---------------------------------------------------------------------------------------------" )
		
	}

}

function awardPlayerAchievement(_name) { //_name = String

	if global.steamTracking {
	
		steam_update();
		steam_init();
		steam_update();
	
		if steam_stats_ready() {
		
			if !steam_get_achievement(_name) {
			
				steam_set_achievement(_name);
				show_debug_message("Achievement awarded: " + string(_name))
			
			} else {
			
				show_debug_message("Achievement has already been awarded: " + string(_name))
			
			}
			
			steam_update();
		
		}
	
	} else {
	
		show_debug_message("Achievement awarded (test): " + string(_name))
	
	}

}

function destroyForestBoulder() {

	with obj_interactable_caveBoulder {
	
		audio_play_sound(sfx_explosion, 1, 0);
	
		var _rangeX = 32;
		var _rangeY = 32;
	
		var _offsetX = random_range(-_rangeX, _rangeX);
		var _offsetY = random_range(-_rangeY, _rangeY);
	
		var _numberOfParticles = 20;

		part_particles_create(global.particleSystemDevice, x + _offsetX, y + _offsetY, global.particleRock, _numberOfParticles);
	
	
		instance_destroy();
	
	}

}

function calculateElapsedTime() {

	// 1. Get the total milliseconds elapsed since launch
	var _total_ms = global.gameTimeMilliseconds;

	// 2. Break it down into time units using div and mod
	var _hours   = _total_ms div 3600000;
	var _minutes = (_total_ms div 60000) mod 60;
	var _seconds = (_total_ms div 1000) mod 60;
	var _ms      = _total_ms mod 1000;

	// 3. Legacy Formatting: Convert to strings and manually pad with zeroes

	// Pad Hours (e.g., 5 -> "05")
	var _str_hours = string(_hours);
	if (_hours < 10) _str_hours = "0" + _str_hours;

	// Pad Minutes (e.g., 9 -> "09")
	var _str_minutes = string(_minutes);
	if (_minutes < 10) _str_minutes = "0" + _str_minutes;

	// Pad Seconds (e.g., 2 -> "02")
	var _str_seconds = string(_seconds);
	if (_seconds < 10) _str_seconds = "0" + _str_seconds;

	// Pad Milliseconds (Needs to handle 3 digits: e.g., 5 -> "005", 45 -> "045")
	var _str_ms = string(_ms);
	if (_ms < 10) {
	    _str_ms = "00" + _str_ms;
	} else if (_ms < 100) {
	    _str_ms = "0" + _str_ms;
	}

	// 4. Combine into a single string
	//var _time_string = _str_hours + ":" + _str_minutes + ":" + _str_seconds + "." + _str_ms;
	global.gameTimeString = _str_hours + ":" + _str_minutes + ":" + _str_seconds + "." + _str_ms;

	
}

function calculateRegionalTime() {

	// 1. Get the total milliseconds elapsed since launch
	var _total_ms = global.gameTimeMillisecondsRegional;

	// 2. Break it down into time units using div and mod
	var _hours   = _total_ms div 3600000;
	var _minutes = (_total_ms div 60000) mod 60;
	var _seconds = (_total_ms div 1000) mod 60;
	var _ms      = _total_ms mod 1000;

	// 3. Legacy Formatting: Convert to strings and manually pad with zeroes

	// Pad Hours (e.g., 5 -> "05")
	var _str_hours = string(_hours);
	if (_hours < 10) _str_hours = "0" + _str_hours;

	// Pad Minutes (e.g., 9 -> "09")
	var _str_minutes = string(_minutes);
	if (_minutes < 10) _str_minutes = "0" + _str_minutes;

	// Pad Seconds (e.g., 2 -> "02")
	var _str_seconds = string(_seconds);
	if (_seconds < 10) _str_seconds = "0" + _str_seconds;

	// Pad Milliseconds (Needs to handle 3 digits: e.g., 5 -> "005", 45 -> "045")
	var _str_ms = string(_ms);
	if (_ms < 10) {
	    _str_ms = "00" + _str_ms;
	} else if (_ms < 100) {
	    _str_ms = "0" + _str_ms;
	}

	// 4. Combine into a single string
	//var _time_string = _str_hours + ":" + _str_minutes + ":" + _str_seconds + "." + _str_ms;
	global.gameTimeStringRegional = _str_hours + ":" + _str_minutes + ":" + _str_seconds + "." + _str_ms;



}

function displayRegionalTime() {

	if global.displayGameTime {
	
		scribble_anim_blink(30, 30, 0);
	
		calculateRegionalTime();

		with obj_control {
	
			//blinkingSpeedrunText = "[blink][spr_icon_clock_x2]" + global.gameTimeStringRegional;
			blinkingSpeedrunText = "[spr_icon_clock_x2]" + global.gameTimeStringRegional;
			showingBlinkingSpeedrunText = true;
			alarm[5] = 600;
	
		}
	
	}
	
}

function conveyorLogic() {

	var _conveyor = instance_place(x, y+1, obj_interactable_conveyor);
	
	if _conveyor == noone exit;
	
	var _wallPadding = _conveyor.conveyorSpeed; //Prevents player getting crushed in walls
	
	if _conveyor.facingRight && !place_meeting(x+_wallPadding, y, obj_block_wall) x += _conveyor.conveyorSpeed;
	if !_conveyor.facingRight && !place_meeting(x-_wallPadding, y, obj_block_wall) x -= _conveyor.conveyorSpeed;
	
	

}