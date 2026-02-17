if triggered exit;

triggered = true;

alarm[0] = textDisplayDuration;

if instance_exists(obj_interactable_monitor_parent) {

	with instance_nearest(x, y, obj_interactable_monitor_parent) {
	
		image_speed = 1;
	
	}

}




