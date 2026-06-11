if inactive {

	sprite_index = spr_interactable_switch_groundPound_inactive;
	
	//exit;

} else {

	sprite_index = pressed ? spr_interactable_switch_groundPound_pressed : spr_interactable_switch_groundPound_unpressed;

}





if pressed && !triggered {

	//triggered = true;

	audio_play_sound(sfx_blip, 1, false);

	//with obj_interactable_labDoor {
	//
	//	lifting = true;
	//	alarm[0] = 60;
	//	audio_play_sound(sfx_mechanicalDoor, 1, false);
	//
	//}
	
	if switchType == SWITCH_TYPE.SPIKE_TOGGLE_TIMED {
	
		//show_debug_message("switch spike toggle on")
		
		var _otherSwitchIsActive = false;
		
		var _switchID = IDnumber;
		
		var _timerDuration = timerDuration;
		
		with obj_interactable_switch_groundPound {
	
			if triggered && _switchID == IDnumber {
		
				_otherSwitchIsActive = true;
			
				alarm[0] = _timerDuration;
			
				//show_debug_message("timer of block set to: " + string(timerDuration))
		
			}
	
		}
		
		
		if !_otherSwitchIsActive {
		
			alarm[0] = timerDuration;
		
			//var _switchID = IDnumber;
			
			audio_play_sound(sfx_mechanicalDoor, 1, false, 1.0, 0, 2.5);
		
			with obj_interactable_hazard_spikes_retractable {
		
				if _switchID == IDnumber {
			
					active = !active;
			
				}
		
			}
		
		}
	
	}
	
	
	if room == rm_cave_chase_longRun {
	
		global.dialogueVariables.talkedToLostMiner = true;
		
		with obj_npc_minerGreenDad {
			
			lookingAtPlayer = true;
			
		}
		
		with obj_interactable_labDoor {
	
			lifting = true;
			alarm[0] = 60;
			audio_play_sound(sfx_mechanicalDoor, 1, false);
	
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
	
	triggered = true;

}

//Timer beeps
if triggered && switchType == SWITCH_TYPE.SPIKE_TOGGLE_TIMED {

	if alarm[0] > -1 {

		var _beepSound = sfx_tempSwitchBeep_low;
	
		var _rate = alarm[0] <= 120 ? 15 : 30;

		if alarm[0] % _rate == 0 {
	
			audio_play_sound(_beepSound, 1, 0);
	
		}
	
	}

}