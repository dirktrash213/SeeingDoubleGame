if triggered && image_speed == 0 {

	image_speed = global.paused ? 0 : breakSpeed;

}

if isLastAnimationFrame() {

	var _visible = visible;
	var _breakSpeed = breakSpeed;

	with instance_create_layer(x, y, "Instances", obj_interactable_breakableFloor_broken) {
	
		visible = _visible;
		breakSpeed = _breakSpeed;
	
	}
	
	spawnBreakableFloorPieces();
				
	var _pitch = 2.0;		
				
	audio_play_sound_on(obj_control.reverb_emitter, sfx_explosion, 0, 1, 0.5, 0, _pitch);

	instance_destroy();

}


