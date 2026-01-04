if !audio_is_playing(amb_droplets_in_a_cave) audio_play_sound(amb_droplets_in_a_cave, 1, 1);
if !audio_is_playing(amb_drizzle) audio_play_sound(amb_drizzle, 1, 1);


if audio_is_playing(obj_control.bgmCave) audio_stop_sound(obj_control.bgmCave);


global.verticalLevel = false;
global.customLevel = false;