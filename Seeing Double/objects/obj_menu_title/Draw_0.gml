checkForMenuInput();

var _newGameTextFinishedTyping = typist.get_state();

//show_debug_message(_newGameTextFinishedTyping)

if typingNewGame {
	
	if confirmingNewGame { //Player is about to override their existing file with a new game
		
		if choosingCoop { 
			
			var _str = menuPosition == 0 ? "\n[wave]Single Player[/wave]\nCo-op" : "\nSingle Player\n[wave]Co-op[/wave]";
		
			draw_set_halign(fa_center);
			draw_text_scribble(215, 65, _str);
			draw_set_halign(fa_left);
			
		} else {
		
			var _str = menuPosition == 0 ? "\n[wave]No[/wave]\nYes" : "\nNo\n[wave]Yes[/wave]";
		
			draw_set_halign(fa_center);
			draw_text_scribble(215, 65, "Starting a new game\nwill override previous save.\nProceed anyway?"+_str);
			draw_set_halign(fa_left);
		
		}
		
	} else {
		
		if choosingCoop {
		
			var _str = menuPosition == 0 ? "\n[wave]Single Player[/wave]\nCo-op" : "\nSingle Player\n[wave]Co-op[/wave]";
		
			draw_set_halign(fa_center);
			draw_text_scribble(215, 65, _str);
			draw_set_halign(fa_left);
		
		} else {

			var _newGameText = scribble("[wave]New Game");
	
			if file_exists("save.txt") {
		
				//_newGameText = scribble(_a + "[wave]Continue[/wave]\nNew Game");
				_newGameText = menuPosition == 0 ? scribble("[wave]Continue[/wave]\nNew Game") : scribble("Continue\n[wave]New Game[/wave]");
		
			}
	
			_newGameText.starting_format("font_titleMenu", c_white);
			_newGameText.wrap(335); 
			_newGameText.align(fa_center, fa_top); 
	
			//_newGameText.draw(room_width/2, room_height/2, typist);
			_newGameText.draw(215, 85, typist);
	
		}
	
	}

}

if confirm && _newGameTextFinishedTyping >= 1 && global.titleScreenCutsceneState == TITLE_SCREEN_CUTSCENE_STATE.ON_MENU {
	
	if !file_exists("save.txt") { //No save data detected
	
		if !choosingCoop {
			
			choosingCoop = true;
			menuPosition = 0;
			
		} else {
	
			//global.coopActive = menuPosition;
			setCoopMode(menuPosition);
			startNewGame();
		
		}
	
	} else { //Save data detected
	
		if !confirmingNewGame { //If on "Continue or New Game" screen
		
			if menuPosition == 0 { //Player pressed "Continue," continue game from save file
			
				//Fade to black, then load player's last room and load game
				with instance_create_depth(x,y, -14000, obj_background_fadeToBlack_continueGame) {
				
					fadingIn = true;
					alarm[0] = 60;
				
				}
			
			} else { //Player pressed "New Game," ask player to confirm new game
			
				confirmingNewGame = true;
				menuPosition = 0;
			
			}
		
		} else { //Player is confirming if they want to start new game and override previous
		
			if choosingCoop {
			
				//global.coopActive = menuPosition;
				setCoopMode(menuPosition);
				startNewGame();
			
			} else {
			
				if menuPosition == 0 { //Player pressed "No," back to main menu
			
					confirmingNewGame = false;
				
				} else { //Player pressed "Yes," start new game
			
					//startNewGame();
					choosingCoop = true;
					menuPosition = 0;
			
				}
			
			}
		
		}
	
	}
	
}
