if global.paused exit;

var _detectionRadius = 120; 
coopObjectStepEventCode(_detectionRadius);

mask_index = sprite_index;

var _paddingY = 2;

var _conveyor = instance_place(x,y+_paddingY,obj_interactable_conveyor);

if _conveyor != noone {

	if _conveyor.facingRight xSpeed = _conveyor.conveyorSpeed;
	if !_conveyor.facingRight xSpeed = -_conveyor.conveyorSpeed;

} else {

	xSpeed = 0;

}


x += xSpeed;


if falling {

	ySpeed += grav;

}


var _wall = instance_place(x,y+_paddingY,obj_block_wall);

//if place_meeting(x, y+ySpeed, obj_block_wall) {
//if place_meeting(x, y+_paddingY, obj_block_wall) {
if _wall != noone {

	falling = false;
	ySpeed = 0;
	y = _wall.y - sprite_height;
	
	//if !audio_is_playing(thudSound) playAudioWithFalloff(thudSound, 200);
	//if !audio_is_playing(thudSound) audio_play_sound(thudSound, 1, false);
	//if !audio_is_playing(sfx_thud) playAudioWithFalloff(sfx_thud, 200);
	//if thudSound == noone thudSound = playAudioWithFalloff(sfx_thud);
	//if thudSound == noone thudSound = playAudioWithFalloff(sfx_thud);
	
	
	
	//if thudSound == noone thudSound = audio_play_sound(sfx_thud, 1, false);
	
} else {

	falling = true;

}




y += ySpeed;


if place_meeting(x, y+ySpeed, obj_trigger_destroyConveyorBox) {
	
	//instance_destroy();
	
	var _nearestTrigger = instance_nearest(x, y, obj_trigger_destroyConveyorBox);
	
	var _IDnumber = _nearestTrigger.IDnumber;
	
	with instance_nearest(x,y,obj_interactable_hazard_spikes_boxes) {
	
		if _IDnumber = IDnumber {
			
			//show_debug_message("spike destroyed")
			
			instance_destroy();
			
		}
		
	}
	
	instance_destroy();
	
}