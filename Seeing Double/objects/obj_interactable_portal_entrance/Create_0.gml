portalID = 0;
patterOffsetY = -144;


active = true;



if playerIsPresent() depth = obj_player.depth + 10;


portal_snd_instance = noone;



portal_snd_instance = audio_play_sound(sfx_portal_idle, 1, true);

setPortalFloat();

xStretch = 1;
yStretch = 1;
stretchAdjustAmount = 0.1;