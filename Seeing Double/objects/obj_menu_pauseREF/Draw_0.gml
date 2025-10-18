//exit;


// Set our font
draw_set_font(font_dialogue);

// Dynamically get width of our menu
var _new_w = 0;

for (var i = 0; i < op_length; i++){
	
	var _op_w = string_width(option[menu_level, i]);
	
	// Get the width of the longest menu option
	_new_w = max(_new_w, _op_w);
	
}


width = _new_w + op_border*2;

// Dynamically get height of our menu
height = op_border*2 + string_height(option[0,0]) + (op_length-1) * op_space;


// Center menu
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2;

//Vars to make the background box fit the screen
var _x = camera_get_view_x(view_camera[0]); 
var _y = camera_get_view_y(view_camera[0]);
var _w = camera_get_view_width(view_camera[0]);
var _h = camera_get_view_height(view_camera[0]);

//Vars for centering things
var _xCenter = camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])/2);
var _yCenter = camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2);


//Background box
draw_sprite_stretched(spr_menuBoxInnerWhiteBorderTransparent, image_index, _x, _y, _w, _h);

draw_set_font(font_menuHeader);
draw_set_halign(fa_center);

//Title text

switch (menu_level) {
			
	case 0: draw_text_scribble(_xCenter, _yCenter-120, "Pause"); break; 
	case 1: draw_text_scribble(_xCenter, _yCenter-120, "Options"); break; 
	case 2: draw_text_scribble(_xCenter, _yCenter-120, "Window Size"); break; 
	case 3: draw_text_scribble(_xCenter, _yCenter-120, "Volume"); break; 
	case 4: draw_text_scribble(_xCenter, _yCenter-120, "Controls"); break; 
	case 6: draw_text_scribble(_xCenter, _yCenter-120, "Gameplay"); break; 
				
}


draw_set_font(font_dialogue);
draw_set_halign(fa_left);



//Menu background art
draw_sprite(spr_symbolOfProphecyLarge, 0 , _xCenter, _yCenter);

var _dpadMenuOffsetX = 10;
var _dpadMenuOffsetY = -65;

var _keysMenuOffsetX = -125;
var _keysMenuOffsetY = -15;

var _keysMenuSpacing = 30;

if (menu_level == 0 && !firstFrame) { //If we draw icons on the first frame they look wonky, so we disable them for that frame
	
	//If the player presses any dPad buttons on the main pause menu they are taken to the respective submenu

//	draw_set_valign(fa_top);
//	draw_set_halign(fa_center);

	var _backOffsetX = -170;
	var _backOffsetY = -110;

	if scr_controllerConnected() {
	
		switch (obj_control.connectedController) {
			
			case CONTROLLER_TYPE.XBOX: draw_text_scribble(_xCenter + _backOffsetX, _yCenter + _backOffsetY, "Back: [spr_xbox_B]"); break; 
			case CONTROLLER_TYPE.PS: draw_text_scribble(_xCenter + _backOffsetX, _yCenter + _backOffsetY, "Back: [spr_playstation_circle]"); break; 
			case CONTROLLER_TYPE.SWITCH: draw_text_scribble(_xCenter + _backOffsetX, _yCenter + _backOffsetY, "Back: [spr_switch_A]"); break; 
				
		}
	
		draw_set_valign(fa_top);
		draw_set_halign(fa_center);
	
	//	draw_sprite(spr_dPad, 0, x-100+_dpadMenuOffsetX, y+150+_dpadMenuOffsetY); //These magic numbers are relative to the x and y of the object
	//	draw_sprite_ext(spr_xbox_dpad, 0, x-90+_dpadMenuOffsetX, y+150+_dpadMenuOffsetY, 2, 2, 0, -1, 1); 
		draw_sprite_ext(global.dpad, 0, x-91+_dpadMenuOffsetX, y+118+_dpadMenuOffsetY, 1, 1, 0, -1, 1); 
		draw_text_scribble(x-90+_dpadMenuOffsetX, y+73+_dpadMenuOffsetY, "Items");
		draw_text_scribble(x-43+_dpadMenuOffsetX, y+110+_dpadMenuOffsetY, "Party");
		draw_text_scribble(x-149+_dpadMenuOffsetX, y+110+_dpadMenuOffsetY, "Glossary");
		draw_text_scribble(x-90+_dpadMenuOffsetX, y+143+_dpadMenuOffsetY, "Addons");
	
	} else {
	
		draw_text_scribble(_xCenter + _backOffsetX, _yCenter + _backOffsetY, "Back: [spr_keyboard_esc]");
	
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
	
		//draw_sprite_ext(spr_keyboard_I, 0, x-165+_keysMenuOffsetX, y+85+_keysMenuOffsetY, 1, 1, 0, -1, 1); 
		//draw_sprite_ext(spr_keyboard_P, 0, x-165+_keysMenuOffsetX, y+115+_keysMenuOffsetY, 1, 1, 0, -1, 1); 
		//draw_sprite_ext(spr_keyboard_N, 0, x-165+_keysMenuOffsetX, y+145+_keysMenuOffsetY, 1, 1, 0, -1, 1); 
		//draw_sprite_ext(spr_keyboard_G, 0, x-165+_keysMenuOffsetX, y+175+_keysMenuOffsetY, 1, 1, 0, -1, 1); 
		draw_text_scribble(x+_keysMenuOffsetX, y+_keysMenuOffsetY, "[spr_keyboard_I] Items");
		draw_text_scribble(x+_keysMenuOffsetX, y+_keysMenuOffsetY + _keysMenuSpacing, "[spr_keyboard_P] Party");
		draw_text_scribble(x+_keysMenuOffsetX, y+_keysMenuOffsetY + _keysMenuSpacing*2, "[spr_keyboard_N] Addons");
		draw_text_scribble(x+_keysMenuOffsetX, y+_keysMenuOffsetY + _keysMenuSpacing*3, "[spr_keyboard_G] Glossary");
		
	}

	draw_set_halign(fa_center);

	var _objectiveTextOffsetX = -140;
	var _objectiveTextOffsetY = 50;

	draw_text_scribble(_xCenter + _objectiveTextOffsetX, _yCenter + _objectiveTextOffsetY, "Current objective:\n" + obj_control.currentObjective);

} //End of menu level 0

//If the controls submenu is selected
if (menu_level == 4) {
	
	//Draw controls menu box
	draw_sprite_ext(spr_dialogueBoxInnerWhiteBorderTransparent, image_index, x-110, y-40, width/sprite_width+3.4, height/sprite_height+1.7, 0, -1, 0.75);
	//draw_sprite_ext(sprite_index, image_index, x-110, y-40, width/sprite_width+3.4, height/sprite_height+1.7, 0, -1, 0.75);
	
} else {
	
	//Draw the menu box as normal
	draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, -1, 0.75);
	
}


draw_set_valign(fa_top);
draw_set_halign(fa_left);


for (var i = 0; i < op_length; i++){
		
	var _c = c_white;
	if pos == i {_c = c_yellow};
	
	//These are in case we want to move the menu text to different areas for specific submenus
	var _extraX = 0;
	var _extraY = 0;
	
	if menu_level == 4 {
	
		_extraX = 0;
		_extraY = 100;
	
	}
	
	draw_text_color(x + op_border +_extraX, y + op_border + op_space*i + _extraY, option[menu_level, i], _c, _c, _c, _c, 1);
	
	//If displaying controls sub menu
	if menu_level == 4 {
		
		draw_set_halign(fa_center);
		
		if scr_controllerConnected() {
	
			var _controllerHeaderOffsetX = 30;
			var _controllerHeaderOffsetY = -30;
			
			var _menuArrowOffsetX = 60;
			var _menuArrowOffsetY = -60;
			
			draw_sprite(spr_menuArrowLeft, 0, _xCenter - _menuArrowOffsetX - sprite_get_width(spr_menuArrowLeft)/2, _yCenter + _menuArrowOffsetY);
			draw_sprite(spr_menuArrowRight, 0, _xCenter + _menuArrowOffsetX - sprite_get_width(spr_menuArrowRight)/2, _yCenter + _menuArrowOffsetY);
	
			switch (obj_control.connectedController) {
			
				case CONTROLLER_TYPE.XBOX: {
					
					draw_text_scribble(_xCenter, y+_controllerHeaderOffsetY, "Controller type:\nXBOX");
					
					draw_set_halign(fa_left);
					
					draw_text_scribble(x-90, y, "[spr_xbox_analogStickLeft] - Move\n[spr_xbox_A] - Interact/Confirm\n[spr_xbox_B] - Back\n[spr_xbox_start] - Pause\n[spr_xbox_RT] - Hold to run");
					
				}	break; 
				
				case CONTROLLER_TYPE.PS: {
					
					draw_text_scribble(_xCenter, y+_controllerHeaderOffsetY, "Controller type:\nPlaystation");
					
					draw_set_halign(fa_left);
					
					draw_text_scribble(x-90, y, "[spr_playstation_analogStickLeft] - Move\n[spr_playstation_X] - Interact/Confirm\n[spr_playstation_circle] - Back\n[spr_playstation_start] - Pause\n[spr_playstation_R2] - Hold to run");
					
				}	break; 
				
				case CONTROLLER_TYPE.SWITCH: {
					
					draw_text_scribble(_xCenter, y+_controllerHeaderOffsetY, "Controller type:\nSwitch");
					
					draw_set_halign(fa_left);
					
					draw_text_scribble(x-90, y, "[spr_switch_analogStickLeft] - Move\n[spr_switch_B] - Interact/Confirm\n[spr_switch_A] - Back\n[spr_switch_start] - Pause\n[spr_switch_ZR] - Hold to run");
					
				}	break; 
				
			}
	
		} else { //Controller not detected
			
			var _noControllerHeaderOffsetX = 30;
			var _noControllerHeaderOffsetY = -25;
			
			draw_text_scribble(_xCenter, y+_noControllerHeaderOffsetY, "Controller not detected");
			
			draw_set_halign(fa_left);
			
			draw_text_scribble(x-90, y, "[spr_keyboard_WASD] - Move\n[spr_keyboard_spacebar] - Interact/Confirm\n[spr_keyboard_esc] - Back\n[spr_keyboard_enter] - Pause\n[spr_keyboard_shift] - Hold to run");
		
		}
		
	}
	
}

//Gameplay menu
if menu_level == 6 {

	switch (pos) {

		case 0: {
		
		
		
		} break;
				
		case 1: {
			
			var _a = "";
			var _b = "";
			
			if global.showBuffDescriptions _a = "[wave][rainbow]";
			if !global.showBuffDescriptions _b = "[wave][rainbow]";
			
			var _offsetX = 160;
			var _offsetY = -90;
			
			var _offsetOptionsX = 140;
			var _offsetOptionsY = 0;
			
			var _optionSpacing = 30;
			
			draw_set_halign(fa_center);
			
			draw_text_scribble_ext(_xCenter + _offsetX, _yCenter + _offsetY, "When a buff is applied in combat, should a description of the buff appear?\n", 120);
			
			draw_text_scribble(_xCenter + _offsetOptionsX, _yCenter + _offsetOptionsY, _a + "Yes");
			draw_text_scribble(_xCenter + _offsetOptionsX + _optionSpacing, _yCenter + _offsetOptionsY, _b + "No");

			draw_set_halign(fa_left);

		} break;
	
	}

	
	







}

//Reset our font
draw_set_font(font_dialogue);



