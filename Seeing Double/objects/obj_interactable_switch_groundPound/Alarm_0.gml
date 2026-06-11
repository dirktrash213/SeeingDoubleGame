var _switchID = IDnumber;

audio_play_sound(sfx_mechanicalDoor, 1, false, 1.0, 0, 2.5);

with obj_interactable_hazard_spikes_retractable {

	if _switchID == IDnumber {
	
		active = !active;
	
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




