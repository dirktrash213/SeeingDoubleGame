var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);

var _x2 = camera_get_view_x(view_camera[1]);
var _y2 = camera_get_view_y(view_camera[1]);

if horizontalScrolling {

	draw_sprite(sprite_index, 0, _x*parallaxMult, _y);
	draw_sprite(sprite_index, 0, _x2*parallaxMult, _y2);

} else {

	draw_sprite(sprite_index, 0, _x, _y*parallaxMult);
	draw_sprite(sprite_index, 0, _x2, _y2*parallaxMult);

	//draw_sprite(sprite_index, 0, _x*parallaxMult, _y*parallaxMult);
	//draw_sprite(sprite_index, 0, _x2*parallaxMult + 264, _y2*parallaxMult);
	
	//draw_sprite(sprite_index, 0, (_x*parallaxMult)/2, _y*parallaxMult);
	//draw_sprite(sprite_index, 0, (_x2*parallaxMult)/2, _y2*parallaxMult);

}





