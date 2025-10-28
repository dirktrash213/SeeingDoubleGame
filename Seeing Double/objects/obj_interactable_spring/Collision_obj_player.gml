if !active || global.playerDefeated exit;
active = false;
alarm[0] = cooldown;

image_speed = 1;

audio_play_sound(sfx_jump_patter, 1, 0, 1, 0, 0.2);

var _ySpeed = springYspeed;

with other {

	setOnGround(false);
	ySpeed = _ySpeed;


}


