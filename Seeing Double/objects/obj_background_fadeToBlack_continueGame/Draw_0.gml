var _x = camera_get_view_x(VIEW) + camera_get_view_width(VIEW)/2;
var _y = camera_get_view_y(VIEW) + camera_get_view_height(VIEW)/2;
	
draw_sprite_ext(sprite_index, 0, _x, _y, xScale, yScale, 0, c_white, image_alpha);