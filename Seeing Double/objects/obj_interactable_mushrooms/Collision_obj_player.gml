if abs(other.xSpeed) >= other.moveSpeed[1] {

	//var _pitch = random_range(1.5, 3.5);
	var _pitch = random_range(0.75, 1.5);
	
	//audio_play_sound(sfx_slice, 1, 0, 1, 0, _pitch);
	audio_play_sound(sfx_tinyImpact2, 1, 0, 1, 0, _pitch);
	
	var _muhsroomPiecesAmount;

	
	var _playerRunningLeft = other.xSpeed < 0 ? -1 : 1;
	
	//var _hSpeed = random_range(2, 6) * _playerRunningLeft;
	//var _vSpeed = random_range(-1, -4);
	
	var _hSpeedMin = 2;
	var _hSpeedMax = 6;
	var _vSpeedMin = -4;
	var _vSpeedMax = -1;
	
	var _rotationSpeed = random_range(2, 900) * _playerRunningLeft;
	
	//var _rotationSpeedMin = 1;
	//var _rotationSpeedMax = 10;
	
	var _rotationSpeedMin = 1;
	var _rotationSpeedMax = 10;
	
	//var _rotationSpeedMin = 0;
	//var _rotationSpeedMax = 0;
	
	var _gravity = 0.05;
	
	switch object_index {
	
		case obj_interactable_mushrooms_v1: {
		
			_muhsroomPiecesAmount = 2;
		
			for(var i = 0; i < _muhsroomPiecesAmount; i++) {

				with instance_create_layer(x, y, "Instances", obj_background_mushroomPiece) {
			
					sprite_index = choose(
					
						spr_background_mushroomPiece,
						spr_background_mushroomPiece2,
						//spr_background_mushroomPiece3,
						spr_background_mushroomPiece4,
						//spr_background_mushroomPiece5,
						//spr_background_mushroomPiece6,
						//spr_background_mushroomPiece7,
						//spr_background_mushroomPiece8,
					
					);
			
					hspeed = random_range(_hSpeedMin, _hSpeedMax) * _playerRunningLeft;
					vspeed = random_range(_vSpeedMin, _vSpeedMax);
					
					gravity = _gravity;
					
					image_angle = random_range(0, 360);
					rotationSpeed = random_range(_rotationSpeedMin, _rotationSpeedMax) * _playerRunningLeft;
					
					//image_angle = _rotationSpeed;
			
				}
			
			}
		
		} break;
		
		case obj_interactable_mushrooms_v2: {
		
			_muhsroomPiecesAmount = 2;
		
			for(var i = 0; i < _muhsroomPiecesAmount; i++) {

				with instance_create_layer(x, y, "Instances", obj_background_mushroomPiece) {
			
					sprite_index = choose(
					
						//spr_background_mushroomPiece,
						//spr_background_mushroomPiece2,
						spr_background_mushroomPiece3,
						//spr_background_mushroomPiece4,
						spr_background_mushroomPiece5,
						//spr_background_mushroomPiece6,
						spr_background_mushroomPiece7,
						//spr_background_mushroomPiece8,
						
					);
			
					hspeed = random_range(_hSpeedMin, _hSpeedMax) * _playerRunningLeft;
					vspeed = random_range(_vSpeedMin, _vSpeedMax);
					
					gravity = _gravity;
					
					image_angle = random_range(0, 360);
					rotationSpeed = random_range(_rotationSpeedMin, _rotationSpeedMax) * _playerRunningLeft;
			
				}
			
			}
		
		} break;
		
		case obj_interactable_mushrooms_v3: {
		
			_muhsroomPiecesAmount = 2;
		
			for(var i = 0; i < _muhsroomPiecesAmount; i++) {

				with instance_create_layer(x, y, "Instances", obj_background_mushroomPiece) {
			
					sprite_index = choose(
					
						spr_background_mushroomPiece,
						//spr_background_mushroomPiece2,
						//spr_background_mushroomPiece3,
						spr_background_mushroomPiece4,
						//spr_background_mushroomPiece5,
						//spr_background_mushroomPiece6,
						//spr_background_mushroomPiece7,
						//spr_background_mushroomPiece8,
						
					);
			
					hspeed = random_range(_hSpeedMin, _hSpeedMax) * _playerRunningLeft;
					vspeed = random_range(_vSpeedMin, _vSpeedMax);
					
					gravity = _gravity;
					
					image_angle = random_range(0, 360);
					rotationSpeed = random_range(_rotationSpeedMin, _rotationSpeedMax) * _playerRunningLeft;
			
				}
			
			}
		
		} break;
		
		case obj_interactable_mushrooms_v4: {
		
			_muhsroomPiecesAmount = 3;
		
			for(var i = 0; i < _muhsroomPiecesAmount; i++) {

				with instance_create_layer(x, y, "Instances", obj_background_mushroomPiece) {
			
					sprite_index = choose(
					
						//spr_background_mushroomPiece,
						//spr_background_mushroomPiece2,
						spr_background_mushroomPiece3,
						//spr_background_mushroomPiece4,
						spr_background_mushroomPiece5,
						//spr_background_mushroomPiece6,
						spr_background_mushroomPiece7,
						spr_background_mushroomPiece8,
						
					);
			
					hspeed = random_range(_hSpeedMin, _hSpeedMax) * _playerRunningLeft;
					vspeed = random_range(_vSpeedMin, _vSpeedMax);
					
					gravity = _gravity;
					
					image_angle = random_range(0, 360);
					rotationSpeed = random_range(_rotationSpeedMin, _rotationSpeedMax) * _playerRunningLeft;
			
				}
			
			}
		
		} break;
		
		case obj_interactable_mushrooms_v5: {
		
			_muhsroomPiecesAmount = 4;
		
			for(var i = 0; i < _muhsroomPiecesAmount; i++) {

				with instance_create_layer(x, y, "Instances", obj_background_mushroomPiece) {
			
					sprite_index = choose(
					
						spr_background_mushroomPiece,
						spr_background_mushroomPiece2,
						spr_background_mushroomPiece3,
						spr_background_mushroomPiece4,
						spr_background_mushroomPiece5,
						spr_background_mushroomPiece6,
						spr_background_mushroomPiece7,
						spr_background_mushroomPiece8,
						
					);
			
					hspeed = random_range(_hSpeedMin, _hSpeedMax) * _playerRunningLeft;
					vspeed = random_range(_vSpeedMin, _vSpeedMax);
					
					gravity = _gravity;
					
					image_angle = random_range(0, 360);
					rotationSpeed = random_range(_rotationSpeedMin, _rotationSpeedMax) * _playerRunningLeft;
			
				}
			
			}
		
		} break;
		
		case obj_interactable_mushrooms_v6: {
		
			_muhsroomPiecesAmount = 3;
		
			for(var i = 0; i < _muhsroomPiecesAmount; i++) {

				with instance_create_layer(x, y, "Instances", obj_background_mushroomPiece) {
			
					sprite_index = choose(
					
						spr_background_mushroomPiece,
						//spr_background_mushroomPiece2,
						//spr_background_mushroomPiece3,
						spr_background_mushroomPiece4,
						//spr_background_mushroomPiece5,
						spr_background_mushroomPiece6,
						//spr_background_mushroomPiece7,
						//spr_background_mushroomPiece8,
						
					);
			
					hspeed = random_range(_hSpeedMin, _hSpeedMax) * _playerRunningLeft;
					vspeed = random_range(_vSpeedMin, _vSpeedMax);
					
					gravity = _gravity;
					
					image_angle = random_range(0, 360);
					rotationSpeed = random_range(_rotationSpeedMin, _rotationSpeedMax) * _playerRunningLeft;
			
				}
			
			}
		
		} break;
		
	}

	instance_destroy();

}



