ySpeed += gravityForce;
xSpeed = 0;


if global.moveLeft {

	xSpeed = -hSpeedDefault;

}

if global.moveRight {

	xSpeed = hSpeedDefault;

}

if place_meeting(x, y+1, obj_block_collision) {

	ySpeed = 0;
	
	if global.jump {
	
		ySpeed = jumpForce;
		//ySpeed += jumpForce;
	
	}

}


//This function handles movement and collision
move_and_collide(xSpeed, ySpeed, obj_block_collision);



