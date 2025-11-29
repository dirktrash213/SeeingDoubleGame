application_surface_draw_enable(true); //If global glitch shader added, may need to remove this

if audio_is_playing(bgm_inSync) audio_stop_sound(bgm_inSync)
if !audio_is_playing(bgm_caveDwellers) audio_play_sound(bgm_caveDwellers, 1, 1);

if !global.caughtByForestGhost global.escapedForestGhost = true;

global.verticalLevel = false;