

// Get inputs

//show_debug_message("INDEX");
//show_debug_message("OPTION: ");
//show_debug_message(option);


//show_debug_message("MENU LEVEL: ");
//show_debug_message(menu_level);



//up_key = keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(global.controllerPort,gp_padu) || global.moveUp;
//down_key = keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(global.controllerPort,gp_padd) || global.moveDown;
//right_key = keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(global.controllerPort,gp_padr) || global.moveUp;
//left_key = keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(global.controllerPort,gp_padl) || global.moveDown;
up_key = keyboard_check_pressed(ord("W")) || global.moveUp;
down_key = keyboard_check_pressed(ord("S")) || global.moveDown;
right_key = keyboard_check_pressed(ord("D")) || global.moveRight;
left_key = keyboard_check_pressed(ord("A")) || global.moveLeft;
accept_key = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(global.pitterDevice,gp_face1);
back_key = keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(global.pitterDevice,gp_face2);




	
if (up_key || down_key) && menu_level != 4 {audio_play_sound(snd_select2,1,0)};
if(accept_key) {audio_play_sound(snd_impact,1,0)};

// Move through menu
pos += down_key - up_key;

// Loop back if at first or last option
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length-1};

if back_key {

	if menu_level == 1 menu_level = 0; //From Options to Main Menu
	if menu_level == 2 menu_level = 1;
	if menu_level == 3 menu_level = 1;
	if menu_level == 4 menu_level = 1;
	if menu_level == 5 menu_level = 0; //From Exit to Main Menu
	if menu_level == 6 menu_level = 1; //From Gameplay to Options

}

// Store number of menu options in currently viewed menu
op_length = array_length(option[menu_level]);

if menu_level == 4 {

	if left_key {
	
		if obj_control.connectedController == 0 {
		
			obj_control.connectedController = 2;
		
		} else {
	
			obj_control.connectedController--;
		
		}
	
	}
	
	if right_key {
	
		if obj_control.connectedController == 2 {
		
			obj_control.connectedController = 0;
		
		} else {
	
			obj_control.connectedController++;
		
		}
	
	}


}

if menu_level == 6 { //Gameplay menu

	switch (pos) {

		case 0: {
			
		
												
		} break;

		case 1: { //Show debuff description
		
			if right_key || left_key audio_play_sound(snd_select2,1,0);
		
			if accept_key || right_key || left_key {
	
				global.showBuffDescriptions = !global.showBuffDescriptions;
	
			}
		
		} break;
		
	}

}

	
//If the player presses the accept key
if accept_key {

	var _sml = menu_level;

	switch (menu_level) {
	
		//Resume
		case 0:
	
			switch (pos) {

				case 0: {
					
					//Unpause
					scr_pauseGame();
														
					} break;

				case 1: {
					menu_level = 1;
				};
					break;
	
				case 2: menu_level = 5;	break;
	
			}
	
		break;
	
		//Settings menu
		case 1:
	
			switch (pos) {

				//Window Size
				case 0: {
					menu_level = 2;
				}; break;

				//Volume
				case 1: {
					menu_level = 3;
				}; break;
	
				//Controls
				case 2: {
					menu_level = 4;
				}; break;
				
				//Gameplay
				case 3: {
					menu_level = 6;
				}; break;
	
				//Back
				case 4: menu_level = 0; break;
	
			}
	
		break;
		
		//Window Size menu
		case 2:
	
			switch (pos) {

				//1920x1080
				case 0: {
				
				if window_get_fullscreen()
				
				    {
					
					    window_set_fullscreen(false);
				
			        }
				
				} break;

				//Fullscreen
				case 1: {
				
				if !window_get_fullscreen()
				
				    {
					
					    window_set_fullscreen(true);
				
			        }
				
				} break;
	
				//Back
				case 2: menu_level = 1; break;
	
			}
	
		break;
		
		//Volume menu
		case 3:
	
			switch (pos) {

				//Master Volume
				case 0: break;

				//Music
				case 1: break;
	
				//SFX
				case 2: break;
				
				//Back
				case 3: menu_level = 1; break;
	
			}
	
		break;
		
		//Controls menu
		case 4:
	
			switch (pos) {

				//Back
				case 0: menu_level = 1; break;
				
			
		//		case 1: menu_level = 1; break;
	
			}
	
		break;
		
		//Confirm quit menu
		case 5:
	
			switch (pos) {

				//Back 
				case 0: menu_level = 0; break;
				
				//Quit
				case 1: {
					
					game_end();

				} break;
	
			}
	
		break;
		
		//Gameplay options menu
		case 6:
	
			switch (pos) {

				//Back 
				case 0: menu_level = 1; break;
				
				//Quit
				case 1: {
					
					

				} break;
	
			}
	
		break;
		
	}
	
	// Take the player to the top of the menu they enter, also prevents array out of bounds errors
	if _sml != menu_level {pos = 0};

	show_debug_message("op_length")
	show_debug_message(op_length)

	// Correct option length
	op_length = array_length(option[menu_level]);

	
}
	
	

