//show_debug_message("readyToCrush: " + string(readyToCrush))
//show_debug_message("alarm[0]: " + string(alarm[0]))

if !readyToCrush && path_position >= 0.95 && path_index == crusherPathLift {

	readyToCrush = true;
	
	show_debug_message("readyToCrush again")
	
	obj_trigger_garbageCrusherActivate.triggered = false;

}