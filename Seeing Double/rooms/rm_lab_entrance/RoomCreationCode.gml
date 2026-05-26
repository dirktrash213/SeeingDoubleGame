if audio_is_playing(amb_droplets_in_a_cave) audio_stop_sound(amb_droplets_in_a_cave);


if !audio_is_playing(obj_control.bgmLab) audio_play_sound(obj_control.bgmLab, 1, true);

audio_stop_sound(sfx_portal_idle);

global.verticalLevel = false;
global.customLevel = false;

global.groundPoundActive = true;
global.doubleJumpActive = true;

disableReverb();

awardPlayerAchievement("COMPLETE_CAVE");

if global.cherryCountRegional == global.cherryMaxCave {

	awardPlayerAchievement("CHERRIES_CAVE");

}

if global.coinCountRegional >= global.coinLotsAmountCave {

	awardPlayerAchievement("COINS_CAVE");

}

show_debug_message("Player collected this many cherries in cave: " + string(global.cherryCountRegional))
show_debug_message("Player collected this many coins in cave: " + string(global.coinCountRegional))

global.coinCountRegional = 0;
global.cherryCountRegional = 0;