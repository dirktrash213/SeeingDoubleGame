if global.paused exit;



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
	
} else {

	falling = true;

}




y += ySpeed;

////Move in a circle
//dir += rotationSpeed;
//
////Get our target positions
//var _targetX = xstart + lengthdir_x(radius, dir);
//var _targetY = ystart + lengthdir_y(radius, dir);
//
////Get speeds
//xSpeed = _targetX - x;
////xSpeed = 0;
//ySpeed = _targetY - y;
////ySpeed = 0;
//
//
//
////Move
//x += xSpeed;
//y += ySpeed;



if place_meeting(x, y+ySpeed, obj_trigger_destroyConveyorBox) instance_destroy();