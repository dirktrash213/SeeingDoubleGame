//application_surface_draw_enable(true); //If global glitch shader added, may need to remove this

if !audio_is_playing(amb_droplets_in_a_cave) audio_play_sound(amb_droplets_in_a_cave, 1, 1);

objBktGlitchDemo.enable_split_screen = false;

if audio_is_playing(obj_control.bgmForest) audio_stop_sound(obj_control.bgmForest)
if !audio_is_playing(obj_control.bgmCave) audio_play_sound(obj_control.bgmCave, 1, 1);

if !global.caughtByForestGhost global.escapedForestGhost = true;

if audio_is_playing(bgm_abyssalDescent) audio_stop_sound(bgm_abyssalDescent);
if audio_is_playing(bgm_cursedAtmosphere) audio_stop_sound(bgm_cursedAtmosphere);
if audio_is_playing(bgm_cursedAtmosphere_LOUD) audio_stop_sound(bgm_cursedAtmosphere_LOUD);
if audio_is_playing(bgm_cursedAtmosphere_VERYLOUD) audio_stop_sound(bgm_cursedAtmosphere_VERYLOUD);
if audio_is_playing(bgm_ephemeralEcho) audio_stop_sound(bgm_ephemeralEcho);
if audio_is_playing(bgm_ghostlyReverberations) audio_stop_sound(bgm_ghostlyReverberations);
if audio_is_playing(bgm_paranormalInfusion) audio_stop_sound(bgm_paranormalInfusion);
if audio_is_playing(sfx_ghost_scream) audio_stop_sound(sfx_ghost_scream);
if audio_is_playing(sfx_ghost_scream_LOUD) audio_stop_sound(sfx_ghost_scream_LOUD);
if audio_is_playing(sfx_ghost_scream_VERYLOUD) audio_stop_sound(sfx_ghost_scream_VERYLOUD);
if audio_is_playing(sfx_ghost_scream2) audio_stop_sound(sfx_ghost_scream2);
if audio_is_playing(sfx_ghost_scream2_LOUD) audio_stop_sound(sfx_ghost_scream2_LOUD);
if audio_is_playing(sfx_glitch_loop) audio_stop_sound(sfx_glitch_loop);
if audio_is_playing(sfx_glitch_loop2) audio_stop_sound(sfx_glitch_loop2);

global.verticalLevel = false;
global.customLevel = false;

disableReverb();