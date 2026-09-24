checkForMenuInput();
analogStickMenuMovement();
analogStickMenuMovementPlayer2();
input_check_source(); //Check if player's most recent input is keyboard or gamepad

//show_debug_message("portals active: " + string(global.portalsActive))
//show_debug_message("global.patterOffsetY: " + string(global.patterOffsetY))

//show_debug_message("global.coopActive: " + string(global.coopActive))

//if global.coopActive && global.coopDetectingPlayer2Input && global.splitScreenActive {
//
//	coopDetectPlayer2Input();
//
//}

//if (!global.coopActive) {
//	
//    // Single Player: Actively track the most recently used device for P1
//    detectPlayer1Input();
//	
//} else if (global.coopDetectingPlayer2Input && global.splitScreenActive) {
//	
//    // Co-op Mode: Wait for P2 to press a button on a DIFFERENT device
//    coopDetectPlayer2Input();
//	
//}

// Allow Player 1 to freely swap devices in Single Player, OR in Co-op before the split-screen starts
if (!global.coopActive || !global.splitScreenActive) {
    detectPlayer1Input();
} 
// Once Co-op and Split Screen are both active, lock P1's device and listen for P2
else if (global.coopDetectingPlayer2Input) {
    coopDetectPlayer2Input();
}


if !global.paused {
	
    global.gameTimeMilliseconds += delta_time / 1000; 
    global.gameTimeMilliseconds = floor(global.gameTimeMilliseconds);
	
    global.gameTimeMillisecondsRegional += delta_time / 1000; 
    global.gameTimeMillisecondsRegional = floor(global.gameTimeMillisecondsRegional);
   
}

calculateElapsedTime(); //Calculate speedrun timer

#region Audio

audio_master_gain(global.volumeMaster/10);
audio_group_set_gain(audiogroup_sfx, global.volumeSFX/10, 1);
audio_group_set_gain(audiogroup_bgm, global.volumeBGM/10, 1);
audio_group_set_gain(audiogroup_amb, global.volumeAMB/10, 1);

#endregion

#region Pause/Menu handling

if global.paused {

	//show_debug_message("pauseMenuSublevel: " + string(pauseMenuSublevel))

	

	if confirm {
		
		if pauseMenuSublevel != 0 || pauseMenuPosition != 0 {
			
			if submenuType == "Audio settings" {
				
				if pauseMenuPosition == 0 audio_play_sound(sfx_jump_patter, 1, 0);
			
			} else { 
				
				audio_play_sound(sfx_jump_patter, 1, 0);
				
			}
			
		}
	
		switch pauseMenuSublevel {
	
			case 0: { //Sublevel 0
		
				switch pauseMenuPosition {
	
					case 0: { //Resume game
		
						global.paused = !global.paused;
						
						saveSettings();
	
						togglePause();
			
						exit;
		
					} break;
					
					case 1: { //Go to Options
		
						submenuType = "Options";
						
						pauseMenuSublevel++;
						
						pauseMenuPosition = 0;
						
						exit;
		
					} break;
					//@@
					case 2: { //Retry
						
						if global.canRetry {
						
							global.killPlayerAfterUnpause = true;
						
							global.paused = !global.paused;
						
							saveSettings();
	
							togglePause();
						
						} else {
						
							audio_play_sound(sfx_wrongBuzzer, 1, false);
						
						}
						
						exit;
		
					} break;
					
					case 3: { //Exit game
						
						submenuType = "Exit";
		
						pauseMenuSublevel++;
						
						pauseMenuPosition = 0;
						
						exit;
		
					} break;
	
				}
		
			} break;
			
			case 1: { //Sublevel 1
			
				switch submenuType {
				
					case "Options": {
					
						switch pauseMenuPosition {
						
							case 0: { //Back to main menu
							
								submenuType = "";
		
								pauseMenuSublevel--;
						
								pauseMenuPosition = 0;
						
								exit;
							
							} break;
							
							case 1: { //Go to video settings
							
								submenuType = "Video settings";
								
								pauseMenuSublevel++;
						
								pauseMenuPosition = 0;
						
								exit;
							
							} break;
							
							case 2: { //Go to audio settings
							
								submenuType = "Audio settings";
								
								pauseMenuSublevel++;
						
								pauseMenuPosition = 0;
						
								exit;
							
							} break;
							
							case 3: { //Go to gameplay settings
							
								submenuType = "Gameplay settings";
								
								pauseMenuSublevel++;
						
								pauseMenuPosition = 0;
						
								exit;
							
							} break;
						
						}
					
					} break;
					
					case "Exit": {
					
						switch pauseMenuPosition {
						
							case 0: { //Back to main menu
							
								submenuType = "";
		
								pauseMenuSublevel--;
						
								pauseMenuPosition = 0;
						
								exit;
							
							} break;
							
							case 1: { //Exit game
							
								saveSettings();
								game_end();
							
							} break;
							
						}
					
					}
				
				}
			
			} break;
			
			case 2: { //Sublevel 2
				
				switch submenuType {
				
					case "Video settings": {
					
						switch pauseMenuPosition {
						
							case 0: { //Back to options menu
						
								submenuType = "Options";
		
								pauseMenuSublevel--;
					
								pauseMenuPosition = 0;
					
								exit;
						
							} break;
							
							case 1: { //Toggle fullscreen
						
								//window_set_fullscreen(!window_get_fullscreen());
								
								if global.fullScreen {
								
									global.fullScreen = false;
									window_set_fullscreen(false);
								
								} else {
								
									global.fullScreen = true;
									window_set_fullscreen(true);
								
								}
								
							} break;
							
							case 2: { //Toggle score UI
						
								global.scoreUIenabled = !global.scoreUIenabled;
								
							} break;
							
							case 3: { //Toggle timer
								
								global.displayGameTime = !global.displayGameTime;
								
							} break;
							
						}
					
					} break;
					
					case "Audio settings": {
					
						switch pauseMenuPosition { 
							
							case 0: { //Back to options menu
						
								submenuType = "Options";
		
								pauseMenuSublevel--;
					
								pauseMenuPosition = 0;
					
								exit;
						
							} break;
							
						}
				
					} break;
					
					case "Gameplay settings": {
					
						switch pauseMenuPosition { 
							
							case 0: { //Back to options menu
						
								submenuType = "Options";
		
								pauseMenuSublevel--;
					
								pauseMenuPosition = 0;
					
								exit;
						
							} break;
							
							case 1: { //Toggle dash mode
						
								global.runModeIsToggle = !global.runModeIsToggle;
						
							} break;
							
							case 2: { //Toggle assist mode
						
								global.assistMode = !global.assistMode;
								
								with obj_assist_shadow current_frame = 0;
						
							} break;
							
							case 3: { //Toggle screen shake
						
								global.screenShake = !global.screenShake;
						
							} break;
							
							case 4: { //Toggle co-op
						
								//global.coopActive = !global.coopActive;
								setCoopMode(!global.coopActive);
								global.killPlayerAfterUnpause = true;
						
							} break;
							
						}
						
					} break;
					
				}
				
			}
	
		}
	
	}
	
	if moveUp {
		
		pauseMenuPosition--;
		
	}
	
	if moveDown {
		
		pauseMenuPosition++;
		
	}
	
	switch pauseMenuSublevel { //Handle selecting menus
	
		case 0: {
		
			if pauseMenuPosition < 0 pauseMenuPosition = 3;
			if pauseMenuPosition > 3 pauseMenuPosition = 0;
		
		} break;
		
		case 1: { 
			
			switch submenuType {
				
				case "Options": {
				
					if pauseMenuPosition < 0 pauseMenuPosition = 3;
					if pauseMenuPosition > 3 pauseMenuPosition = 0;
				
				} break;
				
				case "Exit": {
				
					if pauseMenuPosition < 0 pauseMenuPosition = 1;
					if pauseMenuPosition > 1 pauseMenuPosition = 0;
				
				} break;
					
			}
			
		} break;
		
		case 2: {
		
			switch submenuType {
				
				case "Video settings": {
				
					if pauseMenuPosition < 0 pauseMenuPosition = 3;
					if pauseMenuPosition > 3 pauseMenuPosition = 0;
				
				} break;
				
				case "Audio settings": {
				
					if pauseMenuPosition < 0 pauseMenuPosition = 4;
					if pauseMenuPosition > 4 pauseMenuPosition = 0;
				
				} break;
				
				case "Gameplay settings": {
				
					if pauseMenuPosition < 0 pauseMenuPosition = 4;
					if pauseMenuPosition > 4 pauseMenuPosition = 0;
				
				} break;
					
			}
		
		} break;
		
	}
	
	if submenuType == "Audio settings" {
	
		//show_debug_message("Audio settings menu active")
		
		var _canPlaySelectSFX = true;
		
		if back	{
				
			audio_play_sound(sfx_jump_patter, 1, 0);
			pauseMenuSublevel--;
			submenuType = "Options";
			pauseMenuPosition = 2;
		
		}
		
		switch pauseMenuPosition {
		
			case 0: {
			
				//if back	{
				//
				//	audio_play_sound(sfx_jump_patter, 1, 0);
				//	pauseMenuSublevel--;
				//	submenuType = "Options";
				//
				//}
			
			} break;
			
			case 1: {
				
				if global.volumeMaster == 10 && moveRight _canPlaySelectSFX = false;
				if global.volumeMaster == 0 && moveLeft _canPlaySelectSFX = false;
				
				//if moveLeft || back global.volumeMaster--;
				//if moveRight || confirm global.volumeMaster++;
				
				if moveLeft global.volumeMaster--;
				if moveRight global.volumeMaster++;
				
				if (moveLeft || moveRight || back || confirm) && _canPlaySelectSFX audio_play_sound(sfx_jump_patter, 1, 0);
				
				global.volumeMaster = clamp(global.volumeMaster, 0, 10);
			
			} break;
			
			case 2: {
			
				if global.volumeSFX == 10 && moveRight _canPlaySelectSFX = false;
				if global.volumeSFX == 0 && moveLeft _canPlaySelectSFX = false;
			
				if moveLeft global.volumeSFX--;
				if moveRight global.volumeSFX++;
				
				if (moveLeft || moveRight || back || confirm) && _canPlaySelectSFX audio_play_sound(sfx_jump_patter, 1, 0);
				
				global.volumeSFX = clamp(global.volumeSFX, 0, 10);
			
			} break;
			
			case 3: {
			
				if global.volumeBGM == 10 && moveRight _canPlaySelectSFX = false;
				if global.volumeBGM == 0 && moveLeft _canPlaySelectSFX = false;
			
				if moveLeft global.volumeBGM--;
				if moveRight global.volumeBGM++;
				
				if (moveLeft || moveRight || back || confirm) && _canPlaySelectSFX audio_play_sound(sfx_jump_patter, 1, 0);
				
				global.volumeBGM = clamp(global.volumeBGM, 0, 10);
			
			} break;
			
			case 4: {
			
				if global.volumeAMB == 10 && moveRight _canPlaySelectSFX = false;
				if global.volumeAMB == 0 && moveLeft _canPlaySelectSFX = false;
			
				if moveLeft global.volumeAMB--;
				if moveRight global.volumeAMB++;
				
				if (moveLeft || moveRight || back || confirm) && _canPlaySelectSFX audio_play_sound(sfx_jump_patter, 1, 0);
				
				global.volumeAMB = clamp(global.volumeAMB, 0, 10);
			
			} break;
		
		}
		
		exit;
	
	}

}

if global.playerControl && pauseButtonPressed() {
	
	if global.paused {
	
		if pauseMenuSublevel == 0 {
			
			global.paused = !global.paused;
			togglePause();
			
		}
	
	} else {

		if playerIsPresent() {
		
			if obj_player.groundPounding exit;
		
		}

		global.paused = !global.paused;
		togglePause();
	
	}
	
}

if back {
	
	//if !global.paused audio_play_sound(sfx_jump_patter, 1, 0);
	
	show_debug_message("back pressed")
	show_debug_message("submenuType: " +string(submenuType))
	
	if pauseMenuSublevel != 0 audio_play_sound(sfx_jump_patter, 1, 0);
	
	//show_debug_message("submenuType: " + string(submenuType))
	
	switch (submenuType) {
	   
		case "Video settings": {
	    
			submenuType = "Options";
		
		} break;
		
		case "Audio settings": {
	    
			submenuType = "Options";
		
		} break;
		
		case "Gameplay settings": {
	    
			submenuType = "Options";
		
		} break;
	  
	}
	
	if pauseMenuSublevel > 0 pauseMenuSublevel--;
	
}

#endregion

#region Controller Port + Input type detection

// Get and assign a controller port for a connected controller
//var gp_num = gamepad_get_device_count();
//
//for (var i = 0; i < gp_num; i++;) {
//	   
//	if gamepad_is_connected(i) global.controllerPort = i;
//	   
//}




if keyboard_check(ord("W")) || keyboard_check(ord("A")) || keyboard_check(ord("S")) || keyboard_check(ord("D")) || keyboard_check(vk_space)
|| keyboard_check(vk_escape) || keyboard_check(vk_shift) {

	global.lastInputWasController = false;

}

if gamepad_axis_value(global.pitterDevice,gp_axislh) < 0 || gamepad_axis_value(global.pitterDevice,gp_axislh) > 0 
|| gamepad_axis_value(global.pitterDevice,gp_axislv) < 0 || gamepad_axis_value(global.pitterDevice,gp_axislv) > 0
|| gamepad_button_check(global.pitterDevice, gp_face1) || gamepad_button_check(global.pitterDevice, gp_face3) ||
gamepad_button_check_pressed(global.pitterDevice,gp_start) {

	global.lastInputWasController = true;

}

#endregion

if global.customLevel {

	global.patterOffsetY = global.defaultCustomLevelPatterOffsetY;

} else {

	if !global.portalsActive {
	
		global.patterOffsetY = global.defaultPatterOffsetY; 
	
	}

}

if audio_is_playing(sfx_purchase_scammed) {

	audio_sound_pitch(sfx_purchase_scammed, scammedSFXpitch)
	
	scammedSFXpitch -= scammedSFXpitchDecreaseAmount;

}

if global.readytoDisplayTitleScreenMenu {
	
	titleScreenIntro();
	global.readytoDisplayTitleScreenMenu = false;
	

}

if confirm && alarm[1] > 1 && global.titleScreenCutsceneState == TITLE_SCREEN_CUTSCENE_STATE.ON_MENU alarm[1] = 1;

//var _transparentSecretLayer = false;
//
//with obj_trigger_behindLayer {
//
//	if place_meeting(x, y, obj_player_patter) _transparentSecretLayer = true;
//
//}
//
//if _transparentSecretLayer {
//
//	make_layer_transparent("SecretTiles", 0.0, 0.05);
//	show_debug_message("layer is transparent")
//
//} else {
//
//	//make_layer_transparent("SecretTiles", 1.0, 0.05, false);
//	make_layer_transparent("SecretTiles", 0.5, 0.05, false); //??? This works somehow?
//	show_debug_message("layer is not transparent")
//
//}

if playerFallingWithBoulder {

	var _screenShakeMagnitude = 2;
	var _screenShakeFrames = 2;

	shakeScreen(_screenShakeMagnitude, _screenShakeFrames);
	
	audio_play_sound(sfx_hurt, 1, 0, 0.4);
	
	var _rangeX = 3;
	var _offsetX = random_range(-_rangeX, _rangeX);
	var _offsetY = 16;
		
	//var _numberOfParticles = irandom(2);
	var _numberOfParticles = 20;
	
	//show_debug_message(part_system_exists(global.particleSystemDevice))
	
	//if room == rm_cave_descendingOnBigBoulder && part_system_exists(global.particleSystemDevice) {
	if (room == rm_cave_descendingOnBigBoulder || room == rm_cave_chase_descendingOnBigBoulder) && instance_exists(obj_interactable_demoBoulder) {
	
		with obj_interactable_demoBoulder {
	
			part_particles_create(global.particleSystemDevice, x + _offsetX, y + _offsetY, global.particleSparkDevice, _numberOfParticles);
			part_particles_create(global.particleSystemDevice, x + _offsetX + sprite_width, y + _offsetY, global.particleSparkDevice, _numberOfParticles);
	
		}
	
	}

}

//if instance_exists(obj_npc_ghost_cavesChase) {
//
//
//
//
//}



