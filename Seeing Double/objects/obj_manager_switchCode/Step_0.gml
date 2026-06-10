//show_debug_message("current code: " + string(currentCode));


for (var i = 0; i < array_length(currentCode); ++i) {
    
	if currentCode[i] != correctCode[i] currentCode = [];
	
}


if array_equals(currentCode, correctCode) && !codeSolved {

	//show_debug_message("Code solved");
	
	codeSolved = true;
	
	obj_interactable_switch_groundPound_1.inactive = true;
	obj_interactable_switch_groundPound_2.inactive = true;
	obj_interactable_switch_groundPound_3.inactive = true;
	obj_interactable_switch_groundPound_4.inactive = true;
	
	with obj_interactable_labDoor {

		lifting = true;
		alarm[0] = 60;
		audio_play_sound(sfx_mechanicalDoor, 1, false);

	}

}

