if !active || global.playerDefeated exit;
active = false;
alarm[0] = cooldown;

image_speed = 1;

if global.doubleJumpActive {
			
	if other.jumpCount == other.jumpMax other.jumpCount--;
		
}

//if !audio_is_playing(sfx_jump_patter) audio_play_sound(sfx_jump_patter, 1, 0, 1, 0, 0.15);
if canPlayAudio {
	
	//audio_play_sound(sfx_jump_patter, 1, 0, 1, 0, 0.15);
	audio_play_sound_on(obj_control.reverb_emitter, sfx_jump_patter, false, 1, 1, 0, 0.15);
	
	//playAudioWithFalloff(sfx_jump_patter, 600, 0.15, false, true);
	
	canPlayAudio = false;
	alarm[1] = audioCooldown;
	
}

var _ySpeed = springYspeed;

with other {

	setOnGround(false);
	ySpeed = _ySpeed;


}


