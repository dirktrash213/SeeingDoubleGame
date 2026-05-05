portalID = 0;
patterOffsetY = global.defaultPatterOffsetY;
disablePortals = true;


portal_snd_instance = noone;
portal_snd_instance = audio_play_sound(sfx_portal_idle, 1, true);


xStretch = 1;
yStretch = 1;
stretchAdjustAmount = 0.1;

setPortalFloat();