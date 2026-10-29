//show_debug_message("readyToCrush: " + string(readyToCrush))
//show_debug_message("alarm[0]: " + string(alarm[0]))

//if !global.paused storedPathSpeed = path_speed;

//path_speed = global.paused? 0 : storedPathSpeed;

var _detectionRadius = 60; //60
coopObjectStepEventCode(_detectionRadius);

mask_index = sprite_index;

//if global.paused {
//	
//	alarm[0]++;
//	
//	exit;
//	
//}

//if !readyToCrush && path_position >= 0.95 && path_index == crusherPathLift {
if !readyToCrush && path_position >= 0.95 && path_index == crusherPathLift {

	readyToCrush = true;
	
	alarm[0] = timerDuration;
	
}

