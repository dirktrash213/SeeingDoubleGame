if global.playerDefeated || global.paused {

	x = x;
	y = y;
	
	exit;

}

getControls();

//Move direction


moveDir = moveRight - moveLeft;

//Face direction
if moveDir != 0 faceDir = moveDir;


//Get xSpeed

runType = run;
xSpeed = moveDir * moveSpeed[runType];



//X Movement

//X collision

//How close can we get to a wall
var _subPixel = 0.5;

if place_meeting(x + xSpeed, y, obj_block_wall) {

	//Check for slope					
	if !place_meeting(x + xSpeed, y - abs(xSpeed)-1, obj_block_wall) {
	
		//Nudge player up to be on top of slope
		while place_meeting(x + xSpeed, y, obj_block_wall) { 
			
			y -= _subPixel;
			
		}
	
	} else { //No slope in front of player, now check for ceil slopes instead
	
		//Check ceiling slopes
		if !place_meeting(x + xSpeed, y + abs(xSpeed)+1, obj_block_wall) {
		
			while place_meeting(x + xSpeed, y, obj_block_wall) { 
			
				y += _subPixel;
			
			}
		
		} else { //Normal wall collision
	
			//Scoot up to wall preciesly
	
			var _pixelCheck = _subPixel * sign(xSpeed);
	
			while !place_meeting(x + _pixelCheck, y, obj_block_wall) {
	
				x += _pixelCheck;
	
			}
	

			//Collide
			xSpeed = 0;
		
		}
	
	}

}


//Going down slopes

//Check if wall not in front but wall below us at aprox 45 degree angle
if ySpeed >= 0 && !place_meeting(x + xSpeed, y + 1, obj_block_wall) && place_meeting(x + xSpeed, y + abs(xSpeed)+1, obj_block_wall) && slopeChecksEnabled {

	while !place_meeting(x + xSpeed, y + _subPixel, obj_block_wall) {
	
		y += _subPixel;
	
	}

}





//Move

x += xSpeed;


//Y movement

//Gravity

if coyoteHangTimer > 0 {

	coyoteHangTimer--;

} else {

	//Apply gravity
	ySpeed += grav;
	
	setOnGround(false);
	
}

//Reset jumping variables

if onGround {

	jumpCount = 0;
	//jumpHoldTimer = 0;
	
	coyoteJumpTimer = coyoteJumpFrames;

} else {

	coyoteJumpTimer--;

	//If player is in the air, make sure they can't do an extra jump and remove coyote hang time
	
	if jumpCount == 0 && coyoteJumpTimer <= 0 jumpCount = 1;
	
	coyoteHangTimer = 0;

}

//Initiate the jump

if jumpKeyBuffered && jumpCount < jumpMax && !jumpDisabled {

	//Reset jump buffer
	jumpKeyBuffered = false;
	jumpKeyBufferTimer = 0;
	
	//Increase number of performed jumps
	jumpCount++;
	
	//Set jump hold timer
	jumpHoldTimer = jumpHoldFrames[jumpCount-1];
	
	setOnGround(false);
	coyoteJumpTimer = 0; //NOTE: if having coyote time issues check this line
	
	var _pitch = random_range(0.9, 1.1);
	
	audio_play_sound(jumpSfx, 1, 0, 1, 0, _pitch);

}

//Cut off the jump by releasing the jump button
if !jump {

	jumpHoldTimer = 0;

}

//Jump based on the timer/holding the button
if jumpHoldTimer > 0 {

	//Constantly set ySpeed to be the jumping speed
	ySpeed = jumpSpeed[jumpCount-1];
	
	//Count down the timer
	jumpHoldTimer--;

}



//Cap falling speed
if ySpeed > termVelocity ySpeed = termVelocity;


//Y Collision

_subPixel = 0.5;

if place_meeting(x, y + ySpeed, obj_block_wall) {

	var _pixelCheck = _subPixel * sign(ySpeed);
	
	while !place_meeting(x, y + _pixelCheck, obj_block_wall) {
	
		y += _pixelCheck;
	
	}
	
	//Bonk head on ceiling (consider removing?)
	if ySpeed < 0 jumpHoldTimer = 0;
	
	//Set ySpeed to 0 to collide
	ySpeed = 0;

}

//Check if on ground
if ySpeed >= 0 && place_meeting(x, y + 1, obj_block_wall) {

	setOnGround(true);

}



//Move

y += ySpeed;

//Sprite Control

if abs(xSpeed) > 0 sprite_index = walkSprite;

if abs(xSpeed) >= moveSpeed[1] sprite_index = runSprite;
	
if xSpeed == 0 sprite_index = idleSprite;

if !onGround sprite_index = jumpSprite;

mask_index = maskSprite; //Use this collision mask

if happyPicnic sprite_index = happySprite;
if concernedPicnic sprite_index = concernSprite;
if scaredPicnic sprite_index = scaredSprite;
if searchingForPatterPicnic {
	
	sprite_index = runScaredSprite;

	if x > 224 && hspeed == freakoutSpeed {
		
		hspeed = -freakoutSpeed;
		image_xscale = -1;
		
	}
	
	if x < 190 && hspeed == -freakoutSpeed {
		
		hspeed = freakoutSpeed;
		image_xscale = 1;
		
	}
	
}

if thinkingPicnic {

	hspeed = 0;
	image_xscale = 1;
	sprite_index = concernSprite;
	
	var _offsetX = -5;
	var _offsetY = -20;
	
	if !instance_exists(obj_background_elipses) {
		
		instance_create_layer(x + _offsetX, y + _offsetY, "Instances", obj_background_elipses);
		
	} 
	
}

if wonderingAboutCherriesPicnic {

	sprite_index = curiousSprite;

}


if global.cutsceneActive {

	switch global.currentCutsceneID {
	
		case "sampleCutscene": {
		
		
		
		} break;
		
		case "sampleCutscene2": {
		
		
		
		} break;
	
	}

}