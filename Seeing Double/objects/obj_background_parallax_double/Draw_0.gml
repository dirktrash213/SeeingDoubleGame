var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);

var _x2 = camera_get_view_x(view_camera[1]);
var _y2 = camera_get_view_y(view_camera[1]);

if bigHorizontalRoom {

	var _offsetY = 0;

	switch parallaxMult {
	    
		case 0.81: {
	   
			_offsetY = 113;
		
	   	} break;
		
		case 0.86: {
	   
			_offsetY = 83;
		
	   	} break;
		
		case 0.9: {
	   
			_offsetY = 59;
		
	   	} break;
		
	}
	
	var _offsetX = sprite_width;
	
	for (var i = 0; i < 3; ++i) {
		   
		draw_sprite(sprite_index, 0, _x*parallaxMult + _offsetX*i, _y*parallaxMult);
		draw_sprite(sprite_index, 0, _x2*parallaxMult + _offsetX*i, (_y2*parallaxMult) + _offsetY);
	   
	}

	//draw_sprite(sprite_index, 0, _x*parallaxMult, _y*parallaxMult);
	//draw_sprite(sprite_index, 0, _x2*parallaxMult, (_y2*parallaxMult) + _offsetY);
	
} else {

	if horizontalScrolling {

		//draw_sprite(sprite_index, 0, _x*parallaxMult, _y);
		//draw_sprite(sprite_index, 0, _x2*parallaxMult, _y2);
		
		var _offsetX = sprite_width;
	
		//draw_sprite(sprite_index, 0, _x*parallaxMult + _offsetX, _y);
		//draw_sprite(sprite_index, 0, _x2*parallaxMult + _offsetX, _y2);
		//
		//draw_sprite(sprite_index, 0, _x*parallaxMult + _offsetX*2, _y);
		//draw_sprite(sprite_index, 0, _x2*parallaxMult + _offsetX*2, _y2);
		
		for (var i = 0; i < 3; ++i) {
		   
			draw_sprite(sprite_index, 0, _x*parallaxMult + _offsetX*i, _y);
			draw_sprite(sprite_index, 0, _x2*parallaxMult + _offsetX*i, _y2);
		   
		}
		
	} else {

		draw_sprite(sprite_index, 0, _x, _y*parallaxMult);
		draw_sprite(sprite_index, 0, _x2, _y2*parallaxMult);

	}

}





