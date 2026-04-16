var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);

var _x2 = camera_get_view_x(view_camera[1]);
var _y2 = camera_get_view_y(view_camera[1]);

if bigHorizontalRoom {

	var _offsetY = 0;
	
	//switch sprite_index {
	//    
	//	case spr_background_parallax_caves3_L1: {
	//   
	//		_offsetY = 113;
	//	
	//   	} break;
	//	
	//	case spr_background_parallax_caves3_L2: {
	//   
	//		_offsetY = 83;
	//	
	//   	} break;
	//	
	//	case spr_background_parallax_caves4_L1: {
	//   
	//		_offsetY = 113;
	//	
	//   	} break;
	//	
	//	case spr_background_parallax_caves4_L3ALT: {
	//   	
	//		_offsetY = 59;
	//	
	//   	} break;
	//   
	//}
	
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

	draw_sprite(sprite_index, 0, _x*parallaxMult, _y*parallaxMult);
	draw_sprite(sprite_index, 0, _x2*parallaxMult, (_y2*parallaxMult) + _offsetY);
	
	//draw_sprite(sprite_index, 0, _x*parallaxMult, _y);
	//draw_sprite(sprite_index, 0, _x2*parallaxMult, _y2);

} else {

	if horizontalScrolling {

		draw_sprite(sprite_index, 0, _x*parallaxMult, _y);
		draw_sprite(sprite_index, 0, _x2*parallaxMult, _y2);

	} else {

		draw_sprite(sprite_index, 0, _x, _y*parallaxMult);
		draw_sprite(sprite_index, 0, _x2, _y2*parallaxMult);

	}

}





