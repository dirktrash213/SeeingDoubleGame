vibratingLeft = false;
vibratingRight = false;
hspeed = 0;
x = xstart;
gravity = dropGravity;

var _pitch = 0.25;

audio_play_sound_on(obj_control.reverb_emitter, sfx_tinyImpact2, 0, 1, 1, 0, _pitch);
