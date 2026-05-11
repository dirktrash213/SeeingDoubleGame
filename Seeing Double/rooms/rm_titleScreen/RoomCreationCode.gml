if !audio_is_playing(amb_soft_wind) audio_play_sound_looped_soft_wind();
//if !audio_is_playing(bgm_soft_wind) audio_play_sound(bgm_cursedAtmosphere, 1, 1);
if audio_is_playing(amb_droplets_in_a_cave) audio_stop_sound(amb_droplets_in_a_cave);
if audio_is_playing(amb_scifiCave) audio_stop_sound(amb_scifiCave);

disableReverb();

//application_surface_draw_enable(true);