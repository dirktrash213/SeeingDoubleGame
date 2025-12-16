draw_self();

//Draw patter shadow
if patterPlayerIsPresent() {

	var _sprite = spr_patter_idle;
	
	switch (sprite_index) {
		
	    case spr_pitter_idle: _sprite = spr_patter_idle break;
	    case spr_pitter_walk_silent: _sprite = spr_patter_walk_silent break;
	    case spr_pitter_run_silent: _sprite = spr_patter_run_silent break;
	    case spr_pitter_climb_silent: _sprite = spr_patter_climb_silent break;
	    case spr_pitter_jump: _sprite = spr_patter_jump break;
	    case spr_pitter_crouch: _sprite = spr_patter_crouch break;
	    case spr_pitter_climb: _sprite = spr_patter_climb break;
	    case spr_pitter_curious: _sprite = spr_patter_curious break;
	  
	}
	
	_sprite = spr_patter_ball;

	if !global.verticalLevel {

		draw_sprite_ext(_sprite, image_index, x, y + global.patterOffsetY, image_xscale, image_yscale, 0, c_white, image_alpha);
	
	} else {
	
		draw_sprite_ext(_sprite, image_index, x + global.patterOffsetX, y , image_xscale, image_yscale, 0, c_white, image_alpha);
	
	}

}


