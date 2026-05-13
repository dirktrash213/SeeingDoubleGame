with other {
	
	audio_play_sound(sfx_explosion, 1, 0);
	
	var _piecesAmount = 20;

	//var _rotationSpeedMin = 1;
	//var _rotationSpeedMax = 10;
	
	var _gravity = 0.05;
	
	//var _speed = random_range(5, 10);
	//var _direction = random_range(230, 310);
	//var _direction = random_range(0, 0);
	
	for(var i = 0; i < _piecesAmount; i++) {

		with instance_create_layer(x, y, "Instances", obj_background_squareRockPiece) {
	
			speed = random_range(10, 15);
			
			if global.caughtByCaveGhostAmount == 1 direction = random_range(330, 350);
			if global.caughtByCaveGhostAmount == 2 direction = random_range(250, 290);
			if global.caughtByCaveGhostAmount >= 3 direction = random_range(0, 40);
			
			gravity = _gravity;
			
			image_angle = random_range(0, 360);
			//rotationSpeed = random_range(_rotationSpeedMin, _rotationSpeedMax);
				
		}
	
	}
	
	instance_destroy();
	
}



