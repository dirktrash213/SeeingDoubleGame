if global.playerDefeated || global.paused {

	if global.playerDefeated {
		
		sprite_index = defeatSprite;
		
		if crushed sprite_index = crushedSprite;
		
	}
	
	x = x;
	y = y;
	
	exit;

}

getControls();


//Unstick from moving solid platforms

var _rightWall = noone;
var _leftWall = noone;
var _bottomWall = noone;
var _topWall = noone;
var _listOfSolidPlatforms = ds_list_create();
var _listOfSolidPlatformsSize = instance_place_list(x, y, obj_block_wall_moving, _listOfSolidPlatforms, false);

for(var i = 0; i < _listOfSolidPlatformsSize; i++) {

	var _listInst = _listOfSolidPlatforms[|i];
	
	//Check for right walls
	if _listInst.bbox_left - _listInst.xSpeed >= bbox_right-1 {
	
		if !instance_exists(_rightWall) || _listInst.bbox_left < _rightWall.bbox_left _rightWall = _listInst;
	
	}
	
	//Left walls
	if _listInst.bbox_right - _listInst.xSpeed <= bbox_left+1 {
	
		if !instance_exists(_leftWall) || _listInst.bbox_right > _leftWall.bbox_right _leftWall = _listInst;
	
	}
	
	//Bottom walls
	if _listInst.bbox_top - _listInst.ySpeed >= bbox_bottom-1 {
	
		if !instance_exists(_bottomWall) || _listInst.bbox_top < _bottomWall.bbox_top _bottomWall = _listInst;
	
	}
	
	//Top walls
	if _listInst.bbox_bottom - _listInst.ySpeed <= bbox_top+1 {
	
		if !instance_exists(_topWall) || _listInst.bbox_bottom > _topWall.bbox_bottom _topWall = _listInst;
	
	}

}

ds_list_destroy(_listOfSolidPlatforms);

//Player gets pushed by moving right walls here
if instance_exists(_rightWall) {

	var _rightDist = bbox_right - x;
	x = _rightWall.bbox_left - _rightDist;

}

//left
if instance_exists(_leftWall) {

	var _leftDist = x - bbox_left;
	x = _leftWall.bbox_right + _leftDist;

}

//bottom
if instance_exists(_bottomWall) {

	var _bottomDist = bbox_bottom - y;
	y = _bottomWall.bbox_top - _bottomDist;

}

//top
if instance_exists(_topWall) {

	var _upDist = y - bbox_top;
	var _targetY = _topWall.bbox_bottom + _upDist;
	
	//Check if wall in the way
	if !place_meeting(x, _targetY, obj_block_wall) {
	
		y = _targetY;
	
	}
	
}


//Don't get dropped by moving platform
earlyMovePlatXSpeed = false;
if instance_exists(myFloorPlat) && myFloorPlat.xSpeed != 0 && !place_meeting(x, y + movePlatYspeedMax+1, myFloorPlat) {

	if !place_meeting(x + myFloorPlat.xSpeed, y, obj_block_wall) {
	
		x += myFloorPlat.xSpeed;
		earlyMovePlatXSpeed = true;
		
	}

}


//Crouching



//if moveDown && instance_exists(myFloorPlat) {
if (moveDown || place_meeting(x, y, obj_block_wall)) && onGround {

	crouching = true;

}

//Automatic
//if onGround && place_meeting(x, y, obj_block_wall) {
//
//	crouching = true;
//
//}

if crouching mask_index = crouchSprite;

if crouching && (!moveDown || !onGround) {

	mask_index = maskSprite;
	//Uncrouch if no solid wall in the way
	if !place_meeting(x, y, obj_block_wall) {
	
		crouching = false;
	
	} else {
	
		mask_index = crouchSprite;
	
	}

}




//X movement

//Move direction
moveDir = moveRight - moveLeft;
//if crouching moveDir = 0;



//Face direction
if moveDir != 0 faceDir = moveDir;


//Get xSpeed

runType = run;
xSpeed = moveDir * moveSpeed[runType];

if crouching xSpeed = 0;
//if crouching xSpeed = moveDir * crouchMoveSpeed; //UNUSED



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

downSlopeSemiSolid = noone;

//Check if wall not in front but wall below us at aprox 45 degree angle
//if ySpeed >= 0 && !place_meeting(x + xSpeed, y + 1, obj_block_wall) && place_meeting(x + xSpeed, y + abs(xSpeed)+1, obj_block_wall) && slopeChecksEnabled {
if ySpeed >= 0 && !place_meeting(x + xSpeed, y + 1, obj_block_wall) && place_meeting(x + xSpeed, y + abs(xSpeed)+1, obj_block_wall) { //TEMP

	//Check for a semisolid in the way
	
	downSlopeSemiSolid = checkForSemisolidPlatform(x+xSpeed, y + abs(xSpeed)+1) //TEMP

	if !instance_exists(downSlopeSemiSolid) { //TEMP
	
		while !place_meeting(x + xSpeed, y + _subPixel, obj_block_wall) {
	
			y += _subPixel;
	
		}
	
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

//if jumpKeyBuffered && jumpCount < jumpMax && !jumpDisabled { //RE ENABLE FOR CROUCH JUMP

var _floorIsSolid = false;
if instance_exists(myFloorPlat) && (myFloorPlat.object_index == obj_block_wall || object_is_ancestor(myFloorPlat.object_index, obj_block_wall)) {

	_floorIsSolid = true;

}

if jumpKeyBuffered && jumpCount < jumpMax && !jumpDisabled && (!moveDown || _floorIsSolid) {

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

#region Old Y Collision Code

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

#endregion




//Floor Y Collision

//Check for solid and semisolid platforms under the player


var _clampedYspeed = max(0, ySpeed);

var _list = ds_list_create(); //Store objects we run into
var _array = array_create(0);
array_push(_array, obj_block_wall, obj_block_wall_semiSolid);

//Do the actual check and add objects to list
var _listSize = instance_place_list(x, y+1 + _clampedYspeed + movePlatYspeedMax, _array, _list, false);

//HI RES ART FIX
//var _yCheck = y+1 + _clampedYspeed;
//if instance_exists(myFloorPlat) _yCheck += max(0, myFloorPlat.ySpeed);
//var _semiSolid = checkForSemisolidPlatform(x, _yCheck);

//Loop through colliding wall objects and only return one if its top is below the player
for(var i = 0; i < _listSize; i++) {

	var _listInstance = _list[|i];
	
	if (_listInstance != forgetSemisolid && (_listInstance.ySpeed <= ySpeed || instance_exists(myFloorPlat)) 
	&& (_listInstance.ySpeed > 0 || place_meeting(x, y+1 + _clampedYspeed, _listInstance))) {
	// || (_listInstance == _semiSolid)  //HI RES/HI SPEED FIX
		//Return a solid wall or any semisolid walls that are below the player
		if _listInstance.object_index == obj_block_wall 
		|| object_is_ancestor(_listInstance.object_index, obj_block_wall) 
		|| floor(bbox_bottom) <= ceil(_listInstance.bbox_top - _listInstance.ySpeed) {
	
			//Return the highest wall object, and check for platforms that pick up the player from below
			if !instance_exists(myFloorPlat) 
			|| _listInstance.bbox_top + _listInstance.ySpeed <= myFloorPlat.bbox_top + myFloorPlat.ySpeed 
			|| _listInstance.bbox_top + _listInstance.ySpeed <= bbox_top {
		
				myFloorPlat = _listInstance;
		
			}
	
		}
	
	}
	
}

//Destroy the list to prevent memory leak
ds_list_destroy(_list);

if instance_exists(downSlopeSemiSolid) myFloorPlat = downSlopeSemiSolid; //TEMP

//One last check to confirm floor platform is infact below us or if playform has moved away
if instance_exists(myFloorPlat) && !place_meeting(x, y + movePlatYspeedMax, myFloorPlat) {

	myFloorPlat = noone;

}

//Land on ground platform if there is one
if instance_exists(myFloorPlat) {

	//Scoot up
	_subPixel = 0.5;
	while !place_meeting(x, y + _subPixel, myFloorPlat) && !place_meeting(x, y, obj_block_wall) {
	
		y += _subPixel;
	
	}
	
	//Make sure we don't end up below the top of a semi soli dplatform
	if myFloorPlat.object_index == obj_block_wall_semiSolid || object_is_ancestor(myFloorPlat.object_index, obj_block_wall_semiSolid) {
	
		while place_meeting(x, y, myFloorPlat) {
		
			y -= _subPixel;
		
		}
		
	}
	
	y = floor(y);
	
	//Collide with ground
	ySpeed = 0;
	setOnGround(true);
	
}

//Manually fall through a semisolid platform
if moveDown && jumpPressed {

	//Make sure we have a floor platform that is a semisolid
	if instance_exists(myFloorPlat) && (myFloorPlat.object_index == obj_block_wall_semiSolid || object_is_ancestor(myFloorPlat.object_index, obj_block_wall_semiSolid)) {
	
		//Check if we can go below the semisolid platform
		
		var _yCheck = max(1, myFloorPlat.ySpeed+1);
		if !place_meeting(x, y + _yCheck, obj_block_wall) {
		
			y += 1;
			
			//Inherit downward movespeed from my platform so it doesn't catch me
			ySpeed = _yCheck-1;
			
			//Forget this platform so we don't get caught on it again
			forgetSemisolid = myFloorPlat;
			
			setOnGround(false);
		
		}
	
	}

}



//Move

if !place_meeting(x, y+ySpeed, obj_block_wall) {
	
	y += ySpeed;
	
}

//Reset forgetSemisolid if no longer touching the platform

if instance_exists(forgetSemisolid) && !place_meeting(x, y, forgetSemisolid) {

	forgetSemisolid = noone;

}


//Moving platform X speed and collision

movePlatXspeed = 0;
if instance_exists(myFloorPlat) movePlatXspeed = myFloorPlat.xSpeed;

if !earlyMovePlatXSpeed {

	if place_meeting(x + movePlatXspeed, y, obj_block_wall) {

		_subPixel = 0.5;
		var _pixelCheck = _subPixel * sign(movePlatXspeed);
	
		while !place_meeting(x + _pixelCheck, y, obj_block_wall) {
	
			x += _pixelCheck;
	
		}

		//Need this otherwise player sticks to wall when platform moves away
		movePlatXspeed = 0;

	}

	//Move with platform
	x += movePlatXspeed;

}


//Y snap to moving floor platform
//if instance_exists(myFloorPlat) && myFloorPlat.ySpeed != 0 {
if instance_exists(myFloorPlat) && (myFloorPlat.ySpeed != 0
|| myFloorPlat.object_index == obj_block_wall_moving
|| object_is_ancestor(myFloorPlat.object_index, obj_block_wall_moving)
|| myFloorPlat.object_index == obj_block_wall_semiSolid_moving
|| object_is_ancestor(myFloorPlat.object_index, obj_block_wall_semiSolid_moving)) {

	if !place_meeting(x, myFloorPlat.bbox_top, obj_block_wall) && myFloorPlat.bbox_top >= bbox_bottom-movePlatYspeedMax {
	
		y = myFloorPlat.bbox_top; //Unfloor y when on moving platform
	
	}
	
	//Going up a solid wall while on a semi solid platform //REDUNDANT
	//if myFloorPlat.ySpeed < 0 && place_meeting(x, y + myFloorPlat.ySpeed, obj_block_wall) {
	//
	//	
	//	if myFloorPlat.object_index == obj_block_wall_semiSolid || object_is_ancestor(myFloorPlat.object_index, obj_block_wall_semiSolid) {
	//	
	//		_subPixel = 0.25;
	//		
	//		//Get pushed down through semisolid platform
	//		while place_meeting(x, y + myFloorPlat.ySpeed, obj_block_wall) {
	//		
	//			y += _subPixel;
	//		
	//		}
	//		
	//		//If we got pushed into a solid wall going down, push ourselves back out
	//		while place_meeting(x, y, obj_block_wall) {
	//		
	//			y -= _subPixel;
	//		
	//		}
	//		
	//		y = round(y);
	//	
	//	}
	//
	//	setOnGround(false);
	//
	//}
	
}

//@
//Get pushed down through a semi solid platform by a moving solid platform
if instance_exists(myFloorPlat) 
&& (myFloorPlat.object_index == obj_block_wall_semiSolid || object_is_ancestor(myFloorPlat.object_index, obj_block_wall_semiSolid)) 
&& place_meeting(x, y, obj_block_wall) {

	var _maxPushDistance = 10;
	var _pushedDistance = 0;
	var _startY = y;
	
	while place_meeting(x, y, obj_block_wall) && _pushedDistance <= _maxPushDistance {
	
		y++;
		_pushedDistance++;
	
	}
	
	setOnGround(false);
	//myFloorPlat = false;
	
	if _pushedDistance > _maxPushDistance y = _startY;

}

//Check if player is crushed
image_blend = c_white
if place_meeting(x, y, obj_block_wall) {

	crushTimer++;
	if crushTimer > crushGraceFrames {
		
		//image_blend = c_blue;
		crushed = true;
		playerDefeated();
	
	}

} else {

	crushTimer = 0;

}





//Sprite Control

if abs(xSpeed) > 0 sprite_index = walkSprite;

if abs(xSpeed) >= moveSpeed[1] sprite_index = runSprite;
	
if xSpeed == 0 sprite_index = idleSprite;

if !onGround sprite_index = jumpSprite;

if crouching sprite_index = crouchSprite;

mask_index = maskSprite; //Use this collision mask
if crouching mask_index = crouchSprite;





//Cutscene sprite control

//if global.cutsceneActive {

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

//}


if global.cutsceneActive { //TODO: make cutscene manager object

	switch global.currentCutsceneID {
	
		case "sampleCutscene": {
		
		
		
		} break;
		
		case "sampleCutscene2": {
		
		
		
		} break;
	
	}

}