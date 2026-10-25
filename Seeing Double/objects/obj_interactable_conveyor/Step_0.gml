if facingRight {

	if object_index == obj_interactable_conveyor sprite_index = spr_background_conveyor_middle;
	if object_index == obj_interactable_conveyor_leftEnd sprite_index = spr_background_conveyor_left;
	if object_index == obj_interactable_conveyor_rightEnd sprite_index = spr_background_conveyor_right;

} else {

	if object_index == obj_interactable_conveyor sprite_index = spr_background_conveyor_middle_reverse;
	if object_index == obj_interactable_conveyor_leftEnd sprite_index = spr_background_conveyor_left_reverse;
	if object_index == obj_interactable_conveyor_rightEnd sprite_index = spr_background_conveyor_right_reverse;

}

image_speed = conveyorSpeed/2;


var _revealRadius = 60; 
var _id = id;
var _revealed = false;

//var _visible = visible;


//if global.coopActive {
//
//	with (obj_player_shadow) {
//		
//	    if collision_circle(x, y, _revealRadius, _id, true, true) != noone {
//	        _revealed = true;
//	        break; 
//	    }
//	}
//
//	visible = _revealed ? true : hiddenConveyor;
//
//}

coopObjectStepEventCode();

if coopSolid mask_index = sprite_index;