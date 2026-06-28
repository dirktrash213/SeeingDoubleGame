if readyToCrush {

	readyToCrush = false;

	path_start(crusherPathCrush, 5, path_action_stop, false);
	
	alarm[0] = durationBeforeLift;
	
	var _crusherPathCrush = crusherPathCrush;
	
	with obj_block_wall_crusher {
	
		path_start(_crusherPathCrush, 5, path_action_stop, false);
	
	}

} else {

	path_start(crusherPathLift, 2, path_action_stop, false);
	
	var _crusherPathLift = crusherPathLift;
	
	with obj_block_wall_crusher {
	
		path_start(_crusherPathLift, 2, path_action_stop, false);
	
	}


}

