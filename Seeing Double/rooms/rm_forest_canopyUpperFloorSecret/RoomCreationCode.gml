if audio_is_playing(amb_forest_ambience) audio_stop_sound(amb_forest_ambience);
if audio_is_playing(bgm_inSync) audio_stop_sound(bgm_inSync);
if !audio_is_playing(amb_soft_wind) audio_play_sound_looped_soft_wind();

global.verticalLevel = true;