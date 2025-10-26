var _x = camera_get_view_x(VIEW) + camera_get_view_width(VIEW)/2;
var _y = camera_get_view_y(VIEW) + camera_get_view_height(VIEW)/2;
	
draw_sprite_ext(sprite_index, 0, _x, _y, xScale, yScale, 0, c_white, image_alpha);




switch obj_cutsceneSystem.cutsceneState {
		
	case SPLIT_SCREEN_CUTSCENE_STATE.TEXT_TYPING: {
	
		//var _spacing = 25;
		var _spacing = 0;
	
		//var _seeingText = scribble("[pulse]Seeing");
		var _seeingText = scribble("Seeing");
			
		var _offsetX = 0;
		var _offsetY = 0;
		
		_seeingText.starting_format("font_pauseMenu", c_black);
		_seeingText.align(fa_center, fa_middle); 
		_seeingText.draw(_x + seeingTextOffsetX, _y + seeingTextOffsetY + _spacing, typist);
		
		var _doubleText = scribble("Double");
			
		_offsetX = 0;
		_offsetY = 0;
		
		_doubleText.starting_format("font_pauseMenu", c_black);
		_doubleText.align(fa_center, fa_middle); 
		_doubleText.draw(_x + doubleTextOffsetX, _y + doubleTextOffsetY - _spacing, typist2);
		
		
		
		
		
		
		
		
		
		
		
	
	} break; 
		
}