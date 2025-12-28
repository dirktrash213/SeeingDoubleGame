if triggered && image_speed == 0 {

	image_speed = 1;

}

if isLastAnimationFrame() {

	var _visible = visible;

	with instance_create_layer(x, y, "Instances", obj_interactable_breakableFloor_broken) {
	
		visible = _visible;
	
	}
	
	instance_destroy();

}






