var _x = camera_get_view_x(view_camera[0]) + x;
var _y = camera_get_view_y(view_camera[0]);

var _x2 = camera_get_view_x(view_camera[1]) + x;
var _y2 = camera_get_view_y(view_camera[1]);

//draw_sprite(sprite_index, 0, _x*parallaxMult, _y*parallaxMult);

if !global.verticalLevel {

	if y > global.patterOffsetY {

		draw_sprite(sprite_index, 0, _x2*parallaxMult, y);

	} else {

		draw_sprite(sprite_index, 0, _x*parallaxMult, y);

	}

} else {

	if x > global.patterOffsetX {
	
		draw_sprite(sprite_index, 0, _x, _y2 + 100);
	
	} else {
	
		draw_sprite(sprite_index, 0, _x, _y + 100);
	
	}
	
	//if x > global.patterOffsetX {
	//
	//	draw_sprite(sprite_index, 0, x, _y2);
	//
	//} else {
	//
	//	draw_sprite(sprite_index, 0, x, _y);
	//
	//}
	
	//if y > global.patterOffsetY {
	//
	//	draw_sprite(sprite_index, 0, _x2*parallaxMult, _y2*1);
	//
	//} else {
	//
	//	draw_sprite(sprite_index, 0, _x*parallaxMult, _y*1);
	//
	//}

}








