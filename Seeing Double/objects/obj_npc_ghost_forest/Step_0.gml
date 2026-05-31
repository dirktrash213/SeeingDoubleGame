//show_debug_message(path_position);

if path_position >= 0.95 instance_destroy();

path_speed = global.paused? 0 : 1;

var _pathCheckpoint = 0.66;
var _pathCheckpoint2 = 0.77;

image_xscale = (path_position >= _pathCheckpoint && path_position <= _pathCheckpoint2) ? -1 : 1;

if path_position >= _pathCheckpoint canDetectPlayer = false;

if patterPlayerIsPresent() {

	if !playerDetected && canDetectPlayer {

		var _distance = point_distance(x, y, obj_player_patter.x, obj_player_patter.y);

		var _playerHidden = false;
		
		with obj_player_patter {
		
			if place_meeting(x, y, obj_trigger_behindLayer) _playerHidden = true;
		
		}

		//if _distance <= detectionRadius && !_playerHidden && path_position <= _pathCheckpoint {
		if _distance <= detectionRadius && !_playerHidden && obj_manager_spookyForestGhost.ghostArriving {
    
			playerDetected = true;
			path_end();
			//show_debug_message("player detected!!")
			
			if instance_exists(obj_interactable_caveBoulder) {
			
				destroyForestBoulder();
		
			}
		
		} 

	}

	if playerDetected {

		var _rushSpeed = 5;

		mp_linear_step(obj_player_patter.x, obj_player_patter.y, _rushSpeed, false);

	}

}