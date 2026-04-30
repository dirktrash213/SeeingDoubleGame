if !audio_is_playing(amb_droplets_in_a_cave) audio_play_sound(amb_droplets_in_a_cave, 1, 1);


if !audio_is_playing(obj_control.bgmCave) audio_play_sound(obj_control.bgmCave, 1, 1);
if audio_is_playing(amb_drizzle) audio_stop_sound(amb_drizzle);
if audio_is_playing(amb_elevator) audio_stop_sound(amb_elevator);


global.verticalLevel = false;
global.customLevel = false;