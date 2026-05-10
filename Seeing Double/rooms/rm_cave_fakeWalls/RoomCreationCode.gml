//application_surface_draw_enable(true); //If global glitch shader added, may need to remove this

if !audio_is_playing(amb_droplets_in_a_cave) audio_play_sound(amb_droplets_in_a_cave, 1, 1);



if audio_is_playing(obj_control.bgmForest) audio_stop_sound(obj_control.bgmForest)
if !audio_is_playing(obj_control.bgmCave) audio_play_sound(obj_control.bgmCave, 1, 1);

if audio_is_playing(amb_caveWaterflow) audio_stop_sound(amb_caveWaterflow);
if audio_is_playing(amb_caveWaterflow2) audio_stop_sound(amb_caveWaterflow2);

global.verticalLevel = false;
global.customLevel = false;

//disableReverb();
//enableTinyReverb();
enableSmallReverb();