instance_destroy();



if pitterPlayerIsPresent() {

	with obj_player_pitter {
		
		if thinkingPicnic {
	
			thinkingPicnic = false;
			wonderingAboutCherriesPicnic = true;
			
			var _offsetY = -16;

			part_particles_create(global.particleSystemHearts, x, y + _offsetY, global.particleWhereCherries, 1);
		
			obj_control.alarm[1] = curiousDuration;
		
		}
	
	}

}






