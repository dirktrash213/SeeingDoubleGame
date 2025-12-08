if !audio_is_playing(bgm_inSync) audio_play_sound(bgm_inSync, 1, 1);
if audio_is_playing(amb_soft_wind) audio_stop_sound(amb_soft_wind);
if !audio_is_playing(amb_forest_ambience) audio_play_sound(amb_forest_ambience, 1, 1);

global.verticalLevel = true;