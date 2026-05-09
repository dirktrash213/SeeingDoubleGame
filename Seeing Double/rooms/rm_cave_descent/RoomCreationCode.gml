//application_surface_draw_enable(true); //If global glitch shader added, may need to remove this

if !audio_is_playing(amb_droplets_in_a_cave) audio_play_sound(amb_droplets_in_a_cave, 1, 1);
if audio_is_playing(amb_campfire) audio_stop_sound(amb_campfire);
if audio_is_playing(obj_control.bgmCaveRestArea) audio_stop_sound(obj_control.bgmCaveRestArea);

//objBktGlitchDemo.enable_split_screen = false;

if !audio_is_playing(obj_control.bgmCave) audio_play_sound(obj_control.bgmCave, 1, 1);

global.verticalLevel = true;

enableLargeReverb();