if global.splitScreenActive {

	var _x = 720;
	var _y = 0;
	
	var _xScale = 10;
	var _yScale = 1000;

	//FPS is controlled via spr_UI_box
	draw_sprite_ext(spr_UI_screenDivider, image_index, _x, _y, _xScale, _yScale, 0, c_white, 1.0);


}

drawPauseMenu();