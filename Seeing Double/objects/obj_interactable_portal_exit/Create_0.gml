portalID = 0;

active = true;

portal_snd_instance = noone;

if playerIsPresent() depth = obj_player.depth + 10;

portal_snd_instance = audio_play_sound(sfx_portal_idle, 1, true);

setPortalFloat();

xStretch = 1;
yStretch = 1;
stretchAdjustAmount = 0.1;