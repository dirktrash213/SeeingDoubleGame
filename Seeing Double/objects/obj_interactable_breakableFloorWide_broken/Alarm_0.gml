var _visible = visible;
var _breakSpeed = breakSpeed;
var _invisCoop = invisCoop;
var _solidCoop = solidCoop;
var _alarm10Timer = alarm[10];
var _image_alpha = image_alpha;
var _coopActive = coopActive;

with instance_create_layer(x, y, "Instances", obj_interactable_breakableFloorWide) {

	if (_invisCoop || _solidCoop) && global.coopActive {
					
		if _invisCoop coopObjectInstanceCreationCode();
		if _solidCoop coopObjectSolidInstanceCreationCode();
		
		visible = _visible;
		breakSpeed = _breakSpeed;
		alarm[10] = _alarm10Timer;
		image_alpha = _image_alpha;
		coopActive = _coopActive;
		
	} else {
	
		visible = _visible;
		breakSpeed = _breakSpeed;
	
	}

}

instance_destroy();







