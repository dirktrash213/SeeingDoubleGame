if audio_is_playing(amb_droplets_in_a_cave) audio_stop_sound(amb_droplets_in_a_cave);


if !audio_is_playing(obj_control.bgmLab) audio_play_sound(obj_control.bgmLab, 1, true);

audio_stop_sound(sfx_portal_idle);

global.verticalLevel = false;
global.customLevel = false;

global.groundPoundActive = true;
global.doubleJumpActive = true;

disableReverb();