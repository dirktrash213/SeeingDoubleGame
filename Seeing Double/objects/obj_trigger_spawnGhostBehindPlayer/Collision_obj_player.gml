//var _player = other;
var _player = obj_player_pitter;

with obj_npc_ghost_cavesChase {

	var _offsetX = -125;
	
	if global.coopActive _offsetX = -155; //-155
	
	alarm[0] = 2;
	
	x = _player.x + _offsetX;
	y = _player.y;

}

var _pitch = 0.85;
var _gain = 0.10;

//audio_play_sound(sfx_ghost_scream2_LOUD, 1, false, _gain, 0, _pitch);
audio_play_sound(sfx_ghost_scream_LOUD, 1, false, _gain, 0, _pitch);

instance_destroy();



