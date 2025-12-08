
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
					
					show_debug_message("Found Rose")
					//draw_sprite(spr_interactable_rose_64x64, 0, 500, 200);
					draw_sprite(spr_interactable_rose_64x64, 0, 1000, 200);
					
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
	
						if pauseMenuPosition == 0 _backString = "[wave]Back[/wave]";
						if pauseMenuPosition == 1 _fullscreenString = "[wave]\nFullscreen[/wave]";
				
						var _offsetX = 0;
						var _offsetY = _masterOffsetY;
	
						draw_text_scribble(_x + _offsetX, _y + _offsetY, _backString + _fullscreenString);
				
					} break;
					//@
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
						var _fullscreenString = global.runModeIsToggle ? "\nToggle Run: ON" : "\nToggle Run: OFF";
	
						if pauseMenuPosition == 0 _backString = "[wave]Back[/wave]";
						if pauseMenuPosition == 1 _fullscreenString = global.runModeIsToggle ? "[wave]\nToggle Run: ON[/wave]" : "[wave]\nToggle Run: OFF[/wave]";
				
						var _offsetX = 0;
						var _offsetY = _masterOffsetY;
	
						draw_text_scribble(_x + _offsetX, _y + _offsetY, _backString + _fullscreenString);
				
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

	if playerIsPresent() obj_player.jumpDisabled = true;
	
	if room == rm_forest_doubleJumpGet {
	
		audio_sound_gain(amb_forest_ambience, 0, 2000);
		audio_sound_gain(bgm_inSync, 0, 2000);
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

	var _offsetY = 20;

	obj_control.canDrawDivider = true;
	
	//room_goto(obj_player_pitter.roomRespawn);
	var _roomToSpawnIn = asset_get_index(global.roomToSpawnIn);
	
	with obj_background_cloud {
	
		if room == _roomToSpawnIn {
			
			destroy = false;
			alarm[0] = 2;
			
		}
		
	}
	
	//room_goto(asset_get_index(global.roomToSpawnIn));
	room_goto(_roomToSpawnIn);
	
	//obj_player_pitter.x = obj_player_pitter.xRespawn;
	//obj_player_pitter.y = obj_player_pitter.yRespawn - _offsetY;
	obj_player_pitter.x = global.xRespawnPitter;
	obj_player_pitter.y = global.yRespawnPitter - _offsetY;
	
	obj_player_pitter.crushed = false;
	obj_player_pitter.enemyKilledPlayer = false;
	
	obj_player_pitter.jumpMax = 1;
	obj_player_pitter.gemPowerupDoubleJump = false;
	
	//if pitterPlayerIsPresent() {
	//
	//	if obj_player_pitter.jumpCount >= obj_player_pitter.jumpMax && obj_player_pitter.gemPowerupDoubleJump {
	//
	//		obj_player_pitter.jumpMax = 1;
	//
	//		obj_player_pitter.gemPowerupDoubleJump = false;
	//		if patterPlayerIsPresent() obj_player_patter.gemPowerupDoubleJump = false;
	//
	//	}
	//
	//}

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

function togglePause() {
	
	audio_play_sound(sfx_pause, 1, 0);

	if global.paused {
	
		show_debug_message("Game is now paused")
		
		obj_control.pauseMenuPosition = 0;
		
		//if playerIsPresent() {
		//
		//	with obj_player {
		//	
		//		wasPaused = true;
		//	
		//	}
		//
		//}
		
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