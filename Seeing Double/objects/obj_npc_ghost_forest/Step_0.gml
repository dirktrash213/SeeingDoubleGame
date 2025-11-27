show_debug_message(path_position);

var _pathCheckpoint = 0.66;
var _pathCheckpoint2 = 0.77;

image_xscale = (path_position >= _pathCheckpoint && path_position <= _pathCheckpoint2) ? -1 : 1;

if patterPlayerIsPresent() {

	if !playerDetected {

		var _distance = point_distance(x, y, obj_player_patter.x, obj_player_patter.y);

		var _playerHidden = false;
		
		with obj_player_patter {
		
			if place_meeting(x, y, obj_trigger_behindLayer) _playerHidden = true;
		
		}

		if _distance <= detectionRadius && !_playerHidden && path_position <= _pathCheckpoint {
    
			playerDetected = true;
			path_end();
			//show_debug_message("player detected!!")
		
		} 

	}

	if playerDetected {

		var _rushSpeed = 5;

		mp_linear_step(obj_player_patter.x, obj_player_patter.y, _rushSpeed, false);

	}

}