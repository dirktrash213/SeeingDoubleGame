var _switchID = IDnumber;

if switchType == SWITCH_TYPE.SPIKE_TOGGLE_TIMED {

	audio_play_sound(sfx_mechanicalDoor, 1, false, 1.0, 0, 2.5);

	with obj_interactable_hazard_spikes_retractable {

		if _switchID == IDnumber {
	
			active = !active;
	
		}

	}

}

if switchType == SWITCH_TYPE.CONVEYOR_ADJUST_TIMED {

	audio_play_sound(sfx_mechanicalDoor, 1, false, 1.0, 0, 3.5);

	//var _oldSpeed = oldSpeed;
	//var _oldFacingRight = oldFacingRight;

	with obj_interactable_conveyor {

		if _switchID == IDnumber {
	
			conveyorSpeed = oldSpeed;
			facingRight = oldFacingRight;
	
		}

	}

}

pressed = false;
triggered = false;

with obj_interactable_switch_groundPound {
	
	if _switchID == IDnumber {

		pressed = false;
		triggered = false;

	}

}




