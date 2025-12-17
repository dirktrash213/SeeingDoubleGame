event_inherited();

instance_create_layer(x, y, "Instances", obj_textPopup);

global.cherryCount++;

if global.cherryCount == global.cherryMax audio_play_sound(sfx_magical_transition, 1, 0);
