if bonked && visible {

	bonked = false;
	
	gravity = 0.5;
	vspeed = -3;
	
	with obj_interactable_onOff_block_on {
	
		var _visible = visible;
	
		if canSwap {
		
			instance_destroy();
			with instance_create_layer(x,y, "Instances", obj_interactable_onOff_block_off) {
			
				canSwap = false;
				visible = _visible;
			
			}
		
		}
	
	}
	
	with obj_interactable_onOff_block_off {
	
		var _visible = visible;
		
		if canSwap {
		
			instance_destroy();
			with instance_create_layer(x,y, "Instances", obj_interactable_onOff_block_on) {
			
				canSwap = false;
				visible = _visible;
			
			}
		
		}
	
	}

}

if y > ystart {
	
	y = ystart;
	gravity = 0;
	vspeed = 0;
	
}