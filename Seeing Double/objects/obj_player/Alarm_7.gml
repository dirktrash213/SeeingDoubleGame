/// @description For waterfall effects

if !underWaterfall exit;

var offsetX = 0;
var offsetY = -8;

with instance_create_layer(x + offsetX, y + offsetY, "Instances", obj_vfx_dust_jump) {

	//depth = obj_player.depth - 10;
	depth = obj_player.depth - 1000;

}

var _pitch = random_range(2.9, 3.1);
//var _pitch = 1.0;
audio_play_sound_on(obj_control.reverb_emitter, sfx_slice, 0, 1, 1, 0, _pitch);

alarm[7] = waterfallVFXspawnRate;










