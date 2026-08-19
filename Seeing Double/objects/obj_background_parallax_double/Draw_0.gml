// Get the camera for whichever view GameMaker is CURRENTLY rendering
var _cam = view_camera[view_current];
var _x = camera_get_view_x(_cam);
var _y = camera_get_view_y(_cam);

if (bigHorizontalRoom) {

    var _offsetY = 0;

    switch (parallaxMult) {
        case 0.81: _offsetY = 113; break;
        case 0.86: _offsetY = 83; break;
        case 0.9:  _offsetY = 59; break;
    }
    
    // Patter's view (view 1) receives the Y offset adjustment
    var _drawY = (view_current == 1) ? (_y * parallaxMult) + _offsetY : (_y * parallaxMult);
    var _offsetX = sprite_width;
    
    for (var i = 0; i < 3; ++i) {
        draw_sprite(sprite_index, 0, _x * parallaxMult + _offsetX * i, _drawY);
    }
    
} else {

    if (horizontalScrolling) {
        
        var _offsetX = sprite_width;

        for (var i = 0; i < 3; ++i) {
            draw_sprite(sprite_index, 0, _x * parallaxMult + _offsetX * i, _y);
        }
        
    } else { // Vertical level scrolling

        // Draws ONLY the background meant for the view being rendered right now
        draw_sprite(sprite_index, 0, _x, _y * parallaxMult);

    }

}

/*

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
	
} else {

	if horizontalScrolling {
		
		var _offsetX = sprite_width;
	

		for (var i = 0; i < 3; ++i) {
		   
			draw_sprite(sprite_index, 0, _x*parallaxMult + _offsetX*i, _y);
			draw_sprite(sprite_index, 0, _x2*parallaxMult + _offsetX*i, _y2);
		   
		}
		
	} else { //Vertical level scrolling [INSERT CODE FIX INTO THIS BLOCK]

		draw_sprite(sprite_index, 0, _x, _y*parallaxMult);
		draw_sprite(sprite_index, 0, _x2, _y2*parallaxMult);

	}

}





