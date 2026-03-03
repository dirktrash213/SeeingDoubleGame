if triggered && image_speed == 0 {

	image_speed = breakSpeed;

}

if isLastAnimationFrame() {

	var _visible = visible;
	var _breakSpeed = breakSpeed;

	with instance_create_layer(x, y, "Instances", obj_interactable_breakableFloor_broken) {
	
		visible = _visible;
		breakSpeed = _breakSpeed;
	
	}
	
	instance_destroy();

}






