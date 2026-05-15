//if !audio_is_playing(bgm_inSync) audio_play_sound(bgm_inSync, 1, 1);
objBktGlitchDemo.enable_split_screen = true;
global.verticalLevel = false;

if audio_is_playing(amb_droplets_in_a_cave) audio_stop_sound(amb_droplets_in_a_cave);
if audio_is_playing(obj_control.bgmCaveRestArea) audio_stop_sound(obj_control.bgmCaveRestArea);


disableReverb();

global.doubleJumpActive = true;