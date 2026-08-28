if !visible && global.coopActive && !secret mask_index = spr_empty;

if bonked && (visible || secret) {

	if room == rm_forest_spotTheDifference {
		
		global.dialogueVariables.solvedForestPuzzle = true;
		global.solvedForestPuzzle = true;
		
	}
	
	if room == rm_cave_spotTheDifference {
		
		global.dialogueVariables.solvedCavePuzzle = true;
		global.solvedCavePuzzle = true;
		
	}

	visible = true;
	
	bonked = false;
	
	gravity = 0.5;
	vspeed = -3;
	
	with obj_interactable_onOff_block_on {
	
		var _visible = visible;
		var _invisCoop = invisCoop;
		var _solidCoop = solidCoop;
		var _alarm10Timer = alarm[10];
		var _image_alpha = image_alpha;
		var _coopActive = coopActive;
	
		if canSwap {
		
			instance_destroy();
			
			if room != rm_forest_spotTheDifference && room != rm_cave_spotTheDifference {
			
				with instance_create_layer(x,y, "Instances", obj_interactable_onOff_block_off) {
			
					canSwap = false;
					
					if (_invisCoop || _solidCoop) && global.coopActive {
					
						if _invisCoop coopObjectInstanceCreationCode();
						if _solidCoop coopObjectSolidInstanceCreationCode();
						
						visible = _visible;
						alarm[10] = _alarm10Timer;
						image_alpha = _image_alpha;
						coopActive = _coopActive;
					
					} else {
					
						visible = _visible;
					
					}
			
				}
			
			}
		
		}
	
	}
	
	with obj_interactable_onOff_block_off {
	
		var _visible = visible;
		var _invisCoop = invisCoop;
		var _solidCoop = solidCoop;
		var _alarm10Timer = alarm[10];
		var _image_alpha = image_alpha;
		var _coopActive = coopActive;
		
		if canSwap {
		
			instance_destroy();
			with instance_create_layer(x,y, "Instances", obj_interactable_onOff_block_on) {
			
				canSwap = false;
				
				if (_invisCoop || _solidCoop) && global.coopActive {
					
					if _invisCoop coopObjectInstanceCreationCode();
					if _solidCoop coopObjectSolidInstanceCreationCode();
					
					visible = _visible;
					alarm[10] = _alarm10Timer;
					image_alpha = _image_alpha;
					coopActive = _coopActive;
					
				} else {
				
					visible = _visible;
				
				}
			
			}
		
		}
	
	}

}

if y > ystart {
	
	y = ystart;
	gravity = 0;
	vspeed = 0;
	
}