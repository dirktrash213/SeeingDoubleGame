if readyToCrush {

	readyToCrush = false;

	path_start(crusherPathCrush, crusherFallSpeed, path_action_stop, false);
	
	alarm[0] = durationBeforeLift;
	
	var _crusherPathCrush = crusherPathCrush;
	var _crusherFallSpeed = crusherFallSpeed;
	
	with obj_block_wall_crusher {
	
		path_start(_crusherPathCrush, _crusherFallSpeed, path_action_stop, false);
	
	}

} else {

	path_start(crusherPathLift, crusherLiftSpeed, path_action_stop, false);
	
	var _crusherPathLift = crusherPathLift;
	var _crusherLiftSpeed = crusherLiftSpeed;
	
	with obj_block_wall_crusher {
	
		path_start(_crusherPathLift, _crusherLiftSpeed, path_action_stop, false);
	
	}


}

