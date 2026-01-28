global.verticalLevel = false;

//if global.caughtByForestGhost exit;

if audio_is_playing(obj_control.bgmForest) audio_stop_sound(obj_control.bgmForest);
if !audio_is_playing(amb_forest_ambience) audio_play_sound(amb_forest_ambience, 1, 1);

global.dontReactivateForestBGM = true;