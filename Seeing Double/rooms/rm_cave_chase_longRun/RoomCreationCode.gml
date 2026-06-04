if !audio_is_playing(amb_droplets_in_a_cave) audio_play_sound(amb_droplets_in_a_cave, 1, 1);

if !global.caveChaseOver caveGhostIsVeryClose();

if audio_is_playing(amb_drizzle) audio_stop_sound(amb_drizzle);
if audio_is_playing(amb_waterfall) audio_stop_sound(amb_waterfall);


global.verticalLevel = false;
global.customLevel = false;

global.groundPoundActive = true;

enableSmallReverb();

if global.caveChaseOver audio_play_sound(sfx_portal_idle, 0, true, 0.5, 0, 3.0);