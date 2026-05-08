//application_surface_draw_enable(true); //If global glitch shader added, may need to remove this

if !audio_is_playing(amb_droplets_in_a_cave) audio_play_sound(amb_droplets_in_a_cave, 1, 1);

//objBktGlitchDemo.enable_split_screen = false;

if !audio_is_playing(obj_control.bgmCave) audio_play_sound(obj_control.bgmCave, 1, 1);
if !audio_is_playing(amb_waterfall) audio_play_sound_on(obj_control.reverb_emitter, amb_waterfall, true, 1);
if audio_is_playing(amb_elevator) audio_stop_sound(amb_elevator);

global.verticalLevel = false;
global.customLevel = true;

global.groundPoundActive = true;