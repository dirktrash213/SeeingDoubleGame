if global.paused {
	
	alarm[0]++;
	
	exit;
	
}

if alarm[0] > -1 {
	
	//var _beepSound = lastplayedSound == sfx_tempSwitchBeep_low ? sfx_tempSwitchBeep_high : sfx_tempSwitchBeep_low;
	//var _beepSound = lastplayedSound == sfx_tempSwitchBeep_low; //Maybe use for scary moments?
	var _beepSound = sfx_tempSwitchBeep_low;
	
	var _rate = alarm[0] <= 120 ? 15 : 30;

	if alarm[0] % _rate == 0 {
		
		audio_play_sound(_beepSound, 1, 0);
	
		lastplayedSound = _beepSound;
	
	}
	
}

if bonked && !inert && (visible || secret) {

	inert = true;
	bonked = false;
	gravity = 0.5;
	vspeed = -3;
	
	sprite_index = spr_interactable_switch_inert;

	visible = true;
	
	var _otherSwitchIsActive = false;
	
	var _timerDuration = timerDuration;
	
	with obj_interactable_switch_block_tempActivator_oneTimeUse {
	
		if active {
		
			_otherSwitchIsActive = true;
			
			alarm[0] = _timerDuration;
			
			//show_debug_message("timer of block set to: " + string(timerDuration))
		
		}
	
	}
	
	if !_otherSwitchIsActive {
	
		alarm[0] = timerDuration;
		
		//show_debug_message("timer of block set to: " + string(timerDuration))
	
		active = true;
	
		with obj_pickup_coin_empty {
		
			var _image_index = image_index;
	
			with instance_create_layer(x, y, "Collectables", obj_pickup_coin_temporary) {
		
				image_index = _image_index;
		
			}
		
			instance_destroy();
	
		}
	
		with obj_interactable_temp_block_on {
	
			var _visible = visible;
	
			if canSwap {
				
				var _x = xstart;
				var _y = ystart;
		
				instance_destroy();
				with instance_create_layer(_x,_y, "Instances", obj_interactable_temp_block_off) {
			
					canSwap = false;
					visible = _visible;
			
				}
		
			}
	
		}
	
		with obj_interactable_temp_block_off {
	
			var _visible = visible;
		
			if canSwap {
		
				var _x = xstart;
				var _y = ystart;
		
				instance_destroy();
				with instance_create_layer(_x,_y, "Instances", obj_interactable_temp_block_on) {
			
					canSwap = false;
					visible = _visible;
			
				}
		
			}
	
		}
	
	}

}

if y > ystart {
	
	//instance_destroy();
	
	y = ystart;
	gravity = 0;
	vspeed = 0;
	
}