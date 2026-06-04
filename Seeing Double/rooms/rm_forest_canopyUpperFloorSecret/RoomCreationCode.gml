//if audio_is_playing(amb_forest_ambience) audio_stop_sound(amb_forest_ambience);
if audio_is_playing(obj_control.bgmForest) audio_stop_sound(obj_control.bgmForest);
if !audio_is_playing(amb_soft_wind) audio_play_sound_looped_soft_wind();
if !audio_is_playing(obj_control.bgmSecretFlowerArea) audio_play_sound(obj_control.bgmSecretFlowerArea, 1, true);

global.verticalLevel = true;