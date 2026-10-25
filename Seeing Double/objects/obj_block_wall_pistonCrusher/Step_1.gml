//show_debug_message("readyToCrush: " + string(readyToCrush))
//show_debug_message("alarm[0]: " + string(alarm[0]))

var _detectionRadius = 60;
coopObjectStepEventCode(_detectionRadius);

mask_index = sprite_index;

//if !readyToCrush && path_position >= 0.95 && path_index == crusherPathLift {
if !readyToCrush && path_position >= 0.95 && path_index == crusherPathLift {

	readyToCrush = true;
	
	alarm[0] = timerDuration;
	
}