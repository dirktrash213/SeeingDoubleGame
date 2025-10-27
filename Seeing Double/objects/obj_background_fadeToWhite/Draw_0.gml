var _x = camera_get_view_x(VIEW) + camera_get_view_width(VIEW)/2;
var _y = camera_get_view_y(VIEW) + camera_get_view_height(VIEW)/2;
	
draw_sprite_ext(sprite_index, 0, _x, _y, xScale, yScale, 0, c_white, image_alpha);

var _oldFont = draw_get_font();

if obj_cutsceneSystem.cutsceneState == SPLIT_SCREEN_CUTSCENE_STATE.TEXT_TYPING 
|| obj_cutsceneSystem.cutsceneState == SPLIT_SCREEN_CUTSCENE_STATE.TEXT_DONE_TYPING 
|| obj_cutsceneSystem.cutsceneState == SPLIT_SCREEN_CUTSCENE_STATE.DIVIDER_DESCENDING 
|| obj_cutsceneSystem.cutsceneState == SPLIT_SCREEN_CUTSCENE_STATE.FADING_OUT_WHITE {

	//var _spacing = 25;
	var _spacing = 0;
	
	var _a = "[alpha, " + string(textAlpha) + "]";

	//show_debug_message(_a)

	//var _seeingText = scribble("[pulse]Seeing");
	var _seeingText = scribble("Seeing");
	
		
	var _offsetX = 0;
	var _offsetY = 0;
	
	_seeingText.starting_format("font_pauseMenu", c_black);
	_seeingText.align(fa_center, fa_middle); 
	
	
	if obj_cutsceneSystem.cutsceneState == SPLIT_SCREEN_CUTSCENE_STATE.TEXT_TYPING {
		
		_seeingText.draw(_x + seeingTextOffsetX, _y + seeingTextOffsetY + _spacing, typist);
		
	} else {
	
		draw_set_font(font_pauseMenu);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text_scribble(_x + seeingTextOffsetX, _y + seeingTextOffsetY + _spacing, _a+"[c_black]Seeing");
		draw_set_font(_oldFont);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
	
	}
	
	var _doubleText = scribble("Double");
		
	_offsetX = 0;
	_offsetY = 0;
	
	_doubleText.starting_format("font_pauseMenu", c_black);
	_doubleText.align(fa_center, fa_middle); 
	
	if obj_cutsceneSystem.cutsceneState == SPLIT_SCREEN_CUTSCENE_STATE.TEXT_TYPING {
	
		_doubleText.draw(_x + doubleTextOffsetX, _y + doubleTextOffsetY - _spacing, typist2);
	
	} else {
	
		draw_set_font(font_pauseMenu);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text_scribble(_x + doubleTextOffsetX, _y + doubleTextOffsetY - _spacing, _a+"[c_black]Double");
		draw_set_font(_oldFont);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	
	}
	
	if obj_cutsceneSystem.cutsceneState == SPLIT_SCREEN_CUTSCENE_STATE.DIVIDER_DESCENDING textAlpha -= 0.005;
		
}