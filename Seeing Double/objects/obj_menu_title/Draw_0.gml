checkForMenuInput();

var _newGameTextFinishedTyping = typist.get_state();

//show_debug_message(_newGameTextFinishedTyping)

if typingNewGame {
	
	if confirmingNewGame {
		
		var _str = menuPosition == 0 ? "\n[wave]No[/wave]\nYes" : "\nNo\n[wave]Yes[/wave]";
		
		draw_set_halign(fa_center);
		draw_text_scribble(215, 65, "Starting a new game\nwill override previous save.\nProceed anyway?"+_str);
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

//TODO: Continue loads save, new game asks for confirmation before starting new game, does not override save until player touches first checkpoint

if confirm && _newGameTextFinishedTyping >= 1 && global.titleScreenCutsceneState == TITLE_SCREEN_CUTSCENE_STATE.ON_MENU {
	
	if !file_exists("save.txt") {
	
		startNewGame();
	
	} else {
	
		if !confirmingNewGame {
		
			if menuPosition == 0 { //Continue game
			
				//Fade to black, then load player's last room and load game
				
				with instance_create_depth(x,y, -14000, obj_background_fadeToBlack_continueGame) {
				
					fadingIn = true;
					alarm[0] = 60;
				
				}
			
			} else { //Ask player to confirm new game
			
				confirmingNewGame = true;
				menuPosition = 0;
			
			}
		
		} else {
		
			if menuPosition == 0 { //Back to main menu
			
				confirmingNewGame = false;
				
			} else { //Start new game
			
				startNewGame();
			
			}
		
		}
	
	}
	
}
