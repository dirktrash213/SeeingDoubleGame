if inactive {

	sprite_index = spr_interactable_switch_groundPound_inactive;
	
	//exit;

} else {

	sprite_index = pressed ? spr_interactable_switch_groundPound_pressed_4 : spr_interactable_switch_groundPound_4;

}





if pressed && !triggered {

	triggered = true;

	audio_play_sound(sfx_blip, 1, false);

	alarm[0] = pressedDuration;
	
	array_push(codeManager.currentCode, number);
		
		//with obj_interactable_labDoor {
		//
		//	lifting = true;
		//	alarm[0] = 60;
		//	audio_play_sound(sfx_mechanicalDoor, 1, false);
		//
		//}
		
		
	
	

}










