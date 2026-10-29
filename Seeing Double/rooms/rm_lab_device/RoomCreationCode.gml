if !audio_is_playing(obj_control.bgmDevicePhase1) audio_play_sound(obj_control.bgmDevicePhase1, 1, true);

if audio_is_playing(obj_control.bgmLab) audio_stop_sound(obj_control.bgmLab);

global.verticalLevel = false;
global.customLevel = true;


//enableLargeReverb();