global.caveChaseOver = true;

resetPitterSprites();
resetPatterSprites();

var _numberOfGhostParticles = 30;

//var _range = 10;
//
//var _offsetX = random_range(-_range, _range);
//var _offsetY = 5;

var _offsetX = 0;
var _offsetY = 0;

for (var i = 0; i < _numberOfGhostParticles; ++i) {
	
    with instance_create_layer(obj_npc_ghost_cavesChase.x + _offsetX, obj_npc_ghost_cavesChase.y + _offsetY, "Instances", obj_background_mistCloud) {

		direction =  random_range(0, 360);
		speed =  random_range(5, 10);
	
		//var _scale =  random_range(0.8, 1.2);
		//
		//image_xscale = _scale;
		//image_yscale = _scale;
	
		//sprite_index = spr_background_mistCloud;
	
		depth = -1000;

	}
	
}

obj_spawner_forcefieldBubbles.active = true;

instance_destroy(obj_npc_ghost_cavesChase);

fadeOutSpookyGhostAudio();

//instance_activate_object(obj_block_wall_temp);

with obj_block_wall_temp {

	mask_index = sprite_index;

}

audio_sound_gain(obj_control.bgmCaveChase, 0, 5000);

objBktGlitchDemo.intensityIncrementType = INCREMENT_TYPE.DECREASING_TO_ZERO;

//if !audio_is_playing(sfx_ghost_scream4) audio_play_sound(sfx_ghost_scream4, 0, false, 0.25);
audio_play_sound(sfx_ghost_scream4, 0, false, 0.5);
audio_play_sound(sfx_portal_idle, 0, true, 0.5, 0, 3.0);



//audio_play_sound(sfx_slice, 1, false);
//audio_play_sound(sfx_hurt, 1, false);
audio_play_sound(sfx_explosion, 1, false);
audio_play_sound(sfx_explosion_fire, 1, false);

var _pitch = random_range(0.10, 0.20);
audio_play_sound(sfx_explosion, 1, false, 1, 0, _pitch);

var _screenShakeMagnitude = 10; //10
var _screenShakeFrames = 20; //10

shakeScreen(_screenShakeMagnitude, _screenShakeFrames);

audio_stop_sound(sfx_ghost_scream);
audio_stop_sound(sfx_ghost_scream_LOUD);
audio_stop_sound(sfx_ghost_scream_VERYLOUD);
audio_stop_sound(sfx_ghost_scream2);
audio_stop_sound(sfx_ghost_scream2_LOUD);

instance_destroy();