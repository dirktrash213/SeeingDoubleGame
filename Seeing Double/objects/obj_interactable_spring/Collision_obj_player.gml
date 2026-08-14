if !active || global.playerDefeated exit;
active = false;
alarm[0] = cooldown;

image_speed = 1;

//if !audio_is_playing(sfx_jump_patter) audio_play_sound(sfx_jump_patter, 1, 0, 1, 0, 0.2);
if canPlayAudio {
	
	//audio_play_sound(sfx_jump_patter, 1, 0, 1, 0, 0.2);
	//if !audio_is_playing(sfx_jump_patter) audio_play_sound(sfx_jump_patter, 1, 0, 1, 0, 0.2);
	
	var _duplicateAudio = false;
	
	with obj_interactable_spring {
	
		if duplicateAudio _duplicateAudio = true;
	
	}
	
	if !_duplicateAudio {
	
		audio_play_sound_on(obj_control.reverb_emitter, sfx_jump_patter, false, 1, 1, 0, 0.2);
	
		//if !global.coopActive {
		//
		//	if !audio_is_playing(sfx_jump_patter) audio_play_sound_on(obj_control.reverb_emitter, sfx_jump_patter, false, 1, 1, 0, 0.2);
		//
		//} else {
		//
		//	audio_play_sound_on(obj_control.reverb_emitter, sfx_jump_patter, false, 1, 1, 0, 0.2);
		//
		//}
	
		canPlayAudio = false;
		alarm[1] = audioCooldown;
	
		if global.doubleJumpActive {
			
			if other.jumpCount == other.jumpMax other.jumpCount--;
			
		}
	
		duplicateAudio = true;
	
	}
	
}

var _ySpeed = springYspeed;

with other {

	setOnGround(false);
	ySpeed = _ySpeed;


}


