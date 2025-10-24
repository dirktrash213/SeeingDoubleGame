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
			
			
			} break;
		
			case 1: {
	
				switch submenuType {
			
					case "Options": {
			
						var _backString = "Back";
						var _videoString = "\nVideo";
						var _audioString = "\nAudio";
	
						if pauseMenuPosition == 0 _backString = "[wave]Back[/wave]";
						if pauseMenuPosition == 1 _videoString = "[wave]\nVideo[/wave]";
						if pauseMenuPosition == 2 _audioString = "[wave]\nAudio[/wave]";
	
						var _offsetX = 0;
						var _offsetY = _masterOffsetY;
	
						draw_text_scribble(_x + _offsetX, _y + _offsetY, _backString + _videoString + _audioString);
			
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
				
					case "Audio settings": {
						
						_canDrawMenuSprites = false;
				
						var _backString = "Back";
						var _masterVolumeString = "\nMaster Volume";
						var _sfxVolumeString = "\nSFX Volume";
						var _bgmVolumeString = "\nMusic Volume";
					
						if pauseMenuPosition == 0 _backString = "[wave]Back[/wave]";
						if pauseMenuPosition == 1 _masterVolumeString = "[wave]\nMaster Volume[/wave]";
						if pauseMenuPosition == 2 _sfxVolumeString = "[wave]\nSFX Volume[/wave]";
						if pauseMenuPosition == 3 _bgmVolumeString = "[wave]\nMusic Volume[/wave]";
				
						var _offsetX = -485;
						var _offsetY = _masterOffsetY;
	
						draw_set_halign(fa_left);
						draw_text_scribble(_x + _offsetX, _y + _offsetY, _backString + _masterVolumeString + _sfxVolumeString + _bgmVolumeString);
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

//Sets up the title screen menu
function titleScreenIntro() {

	scribble_anim_wave(1, 0.1, 0.1);
	
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
	global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.PAD_WARMING_UP;
	obj_control.alarm[1] = _delayUntilCutsceneBegins;



}

function spawnPitter() {

	var _offsetY = 20;

	//room_goto(obj_player_pitter.roomRespawn);
	room_goto(asset_get_index(global.roomToSpawnIn));

	//obj_player_pitter.x = obj_player_pitter.xRespawn;
	//obj_player_pitter.y = obj_player_pitter.yRespawn - _offsetY;
	obj_player_pitter.x = global.xRespawnPitter;
	obj_player_pitter.y = global.yRespawnPitter - _offsetY;
	
	obj_player_pitter.crushed = false;

}

function spawnPatter() {
	
	var _offsetY = 20;

	obj_player_patter.x = global.xRespawnPatter;
	obj_player_patter.y = global.xRespawnPatter - _offsetY;

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


function particleSetup() {

	//effect_create_above(ef_cloud, 100, 100, 1000, c_white);
	
	//Title screen particle effects
	global.particleSystemHearts = part_system_create_layer("HeartParticles", false);
	global.particleSystemDevice = part_system_create();
	
	global.particleHeartPink = part_type_create();
	global.particleHeartBlue = part_type_create();
	global.particleSparkDevice = part_type_create();
	global.particleWherePatter = part_type_create();
	global.particleWhereCherries = part_type_create();

	var _heartDirMin = 60;
	var _heartDirMax = 120;
	
	var _sparkDirMin = 90;
	var _sparkDirMax = 90;
	
	var _sparkSpdMin = 2;
	var _sparkSpdMax = 4;

	part_type_sprite(global.particleHeartPink, spr_particle_heart_pink, 0, 0, 0);
	part_type_speed(global.particleHeartPink, 1, 2, 0, 0);
	part_type_direction(global.particleHeartPink, _heartDirMin, _heartDirMax, 0, 0);
	
	part_type_sprite(global.particleHeartBlue, spr_particle_heart_blue, 0, 0, 0);
	part_type_speed(global.particleHeartBlue, 1, 2, 0, 0);
	part_type_direction(global.particleHeartBlue, _heartDirMin, _heartDirMax, 0, 0);
	
	part_type_sprite(global.particleSparkDevice, spr_background_pixel, 0, 0, 0);
	part_type_speed(global.particleSparkDevice, _sparkSpdMin, _sparkSpdMax, 0, 0);
	part_type_direction(global.particleSparkDevice, _sparkDirMin, _sparkDirMax, 0, 0);
	
	part_type_sprite(global.particleWherePatter, spr_particle_wherePatter, 0, 0, 0);
	part_type_speed(global.particleWherePatter, 0.2, 2, 0, 0);
	part_type_direction(global.particleWherePatter, 60, 120, 0, 0);
	
	part_type_sprite(global.particleWhereCherries, spr_particle_whereCherries, 0, 0, 0);
	part_type_speed(global.particleWhereCherries, 0.2, 0.2, 0, 0);
	part_type_direction(global.particleWhereCherries, 90, 90, 0, 0);
	part_type_life(global.particleWhereCherries, 300, 300);
	
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