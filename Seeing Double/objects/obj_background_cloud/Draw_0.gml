var _x = camera_get_view_x(view_camera[0]) + x;
var _y = camera_get_view_y(view_camera[0]) + y;

var _x2 = camera_get_view_x(view_camera[1]) + x;
var _y2 = camera_get_view_y(view_camera[1]) + y;

if !global.verticalLevel {

	if y > global.patterOffsetY {

		draw_sprite(sprite_index, 0, _x2*parallaxMult, y);

	} else {

		draw_sprite(sprite_index, 0, _x*parallaxMult, y);

	}

} else {

	if x > global.patterOffsetX { //Clouds on Patter's side
	
		if view_current == 1 draw_sprite(sprite_index, 0, _x2 - 470, _y2 - 800);
	
	} else { //Clouds on Pitter's side
	
		if !global.coopActive {
			
			draw_sprite(sprite_index, 0, _x - 470 + global.patterOffsetX, _y2 - 800);
			
		} else {
		
			if view_current == 0 draw_sprite(sprite_index, 0, _x - 470 + global.patterOffsetX, _y - 800);
		
		}

	}
	
}








