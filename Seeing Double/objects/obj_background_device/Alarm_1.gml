firing = true;
spawningSparks = false;

audio_play_sound(sfx_laser_explosion, 1, 0);
audio_play_sound(sfx_explosion, 1, 0);

audio_stop_sound(sfx_laser_chargeUp2);

instance_create_depth(x, y, -14000, obj_background_whiteBeam);


