if inactive {

	sprite_index = spr_interactable_switch_groundPound_inactive;
	
	//exit;

} else {

	sprite_index = pressed ? spr_interactable_switch_groundPound_pressed : spr_interactable_switch_groundPound_unpressed;

}





if pressed && !triggered {

	triggered = true;

	with obj_interactable_labDoor {
	
		lifting = true;
		alarm[0] = 60;
	
	}
	
	if room == rm_cave_chase_longRun {
	
		global.dialogueVariables.talkedToLostMiner = true;
		
		with obj_npc_minerGreenDad {
			
			lookingAtPlayer = true;
			
		}
		
		with obj_trigger_dialogue {
		
			var _customTextDisplayDuration = 360
		
			count = 0;
			alarm[0] = _customTextDisplayDuration;
			dialogueString = [];
			
			for (var i = 0; i < array_length(global.dialogueStringArrays.cavesOpenLabDoor); ++i) {
	 
				dialogueString[i] = global.dialogueStringArrays.cavesOpenLabDoor[i];
	 
			}
				
		}
	
	}

}