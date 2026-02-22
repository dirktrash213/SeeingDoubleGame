event_inherited();

if global.paused || !active {

	x = x;
	y = y;
	
	exit;

}

xSpeed = moveDir == WALKING_DIRECTION.LEFT ? -walkSpeed : walkSpeed;

//X collision

//How close can we get to a wall
var _subPixel = 0.5;

//if place_meeting(x + xSpeed, y, obj_block_wall) {
//
//	//Collide
//	//xSpeed = 0;
//	moveDir = moveDir == WALKING_DIRECTION.LEFT ? WALKING_DIRECTION.RIGHT : WALKING_DIRECTION.LEFT;
//
//}

var _mult = 20;

//if !fallOffLedges && (!place_meeting(x + xSpeed*_mult, y+1, obj_block_wall) && !place_meeting(x + xSpeed*_mult, y+1, obj_block_wall_semiSolid)) {
//
//	moveDir = moveDir == WALKING_DIRECTION.LEFT ? WALKING_DIRECTION.RIGHT : WALKING_DIRECTION.LEFT;
//
//}

//if defeated || moveDir == WALKING_DIRECTION.NONE xSpeed = 0;
xSpeed = 0;

//Move
//x += xSpeed;
x = 0;

sprite_index = defeatSprite;

////Sprite control
//if moveDir != WALKING_DIRECTION.NONE {
//	
//	sprite_index = walkSprite;
//	
//} else {
//
//	sprite_index = idleSprite;
//
//}
//
//if defeated sprite_index = defeatSprite;
//