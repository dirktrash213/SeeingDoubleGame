var _visible = visible;
var _breakSpeed = breakSpeed;

with instance_create_layer(x, y, "Instances", obj_interactable_breakableFloor) {

	visible = _visible;
	breakSpeed = _breakSpeed;
	
}

instance_destroy();







