//application_surface_draw_enable(true); //If global glitch shader added, may need to remove this

//if !audio_is_playing(amb_campfire) audio_play_sound(amb_campfire, 1, 1);


if !audio_is_playing(obj_control.bgmCaveRestArea) audio_play_sound(obj_control.bgmCaveRestArea, 1, 1);
if audio_is_playing(obj_control.bgmCave) audio_stop_sound(obj_control.bgmCave);

global.verticalLevel = false;

enableSmallReverb();

awardPlayerAchievement("CAMPER");