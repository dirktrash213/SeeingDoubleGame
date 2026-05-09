if audio_is_playing(amb_droplets_in_a_cave) audio_stop_sound(amb_droplets_in_a_cave);
if !audio_is_playing(amb_drizzle) audio_play_sound(amb_drizzle, 1, 1);


if audio_is_playing(obj_control.bgmCave) audio_stop_sound(obj_control.bgmCave);
if audio_is_playing(obj_control.bgmCaveRestArea) audio_stop_sound(obj_control.bgmCaveRestArea);

global.verticalLevel = false;
global.customLevel = false;

enableSmallReverb();