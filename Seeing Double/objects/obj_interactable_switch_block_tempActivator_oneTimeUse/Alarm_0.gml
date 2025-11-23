active = false;

with obj_pickup_coin_temporary {
	
	var _image_index = image_index;
	
	with instance_create_layer(x, y, "Collectables", obj_pickup_coin_empty) {
	
		image_index = _image_index;
	
	}
	
	instance_destroy();

}

with obj_interactable_temp_block_on {
	
	var _visible = visible;

	if canSwap {
	
		instance_destroy();
		with instance_create_layer(x,y, "Instances", obj_interactable_temp_block_off) {
		
			canSwap = false;
			visible = _visible;
		
		}
	
	}

}

with obj_interactable_temp_block_off {

	var _visible = visible;
	
	if canSwap {
	
		instance_destroy();
		with instance_create_layer(x,y, "Instances", obj_interactable_temp_block_on) {
		
			canSwap = false;
			visible = _visible;
		
		}
	
	}

}

with obj_interactable_switch_block_tempActivator_oneTimeUse {
	
	var _visible = visible;
	
	if vanishOnTimeout {
	
		instance_destroy();
		with instance_create_layer(x,y, "Instances", obj_interactable_block_empty) {
		
			visible = _visible;
		
		}
	
	}

}

with obj_interactable_switch_block_inert {
	
	var _visible = visible;
	
	if vanishOnTimeout {
	
		instance_destroy();
		with instance_create_layer(x,y, "Instances", obj_interactable_block_empty) {
		
			visible = _visible;
		
		}
	
	}

}

with obj_interactable_spring {
	
	var _visible = visible;
	
	if vanishOnTimeout {
	
		instance_destroy();
		with instance_create_layer(x,y, "Instances", obj_interactable_spring_empty) {
		
			visible = _visible;
		
		}
	
	}

}
