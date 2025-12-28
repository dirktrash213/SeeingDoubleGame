if global.doubleJumpActive && jumpMax == 1 jumpMax = 2; //Ensure player can double jump if they have unlocked it

if global.playerDefeated || global.paused {

	if global.playerDefeated {
		
		setOnGround(false); //This prevents a weird bug where if the player dies on a platform their respawn location is messed up
		
		moveDir = 0;
		
		sprite_index = defeatSprite;
		
		if crushed sprite_index = crushedSprite;
		
	}
	
	x = x;
	y = y;
	
	exit;

}

normalizeStretching();

//make_layer_transparent("SecretTiles", 0, 0.05);

if object_index == obj_player_pitter && global.splitScreenActive {

	//show_debug_message("jumpMax: " + string(jumpMax))
	//show_debug_message("jumpCount: " + string(jumpCount))
	
	//show_debug_message("---------------------------")

}

//Keep patter in sync with pitter
if object_index == obj_player_patter && global.splitScreenActive {

	if pitterPlayerIsPresent() {
	
		if !global.verticalLevel {
		
			x = obj_player_pitter.x;
			y = obj_player_pitter.y + global.patterOffsetY;
		
		} else {
		
			x = obj_player_pitter.x + global.patterOffsetX;
			y = obj_player_pitter.y;
		
		}
	
	}

}

//show_debug_message("Pitter x: " + string(obj_player_pitter.x) + ", Pitter y: " + string(obj_player_pitter.y))
//show_debug_message("Patter x: " + string(obj_player_patter.x) + ", Patter y: " + string(obj_player_patter.y))
//show_debug_message("--------------")

if object_index == obj_player_patter && global.splitScreenActive && !global.cutsceneActive {

	if y < 319 && !global.verticalLevel {
		
		obj_player_patter.image_alpha = 0;
		obj_player_patter.canCollide = false;
		
	} else {
	
		obj_player_patter.image_alpha = 1;
		obj_player_patter.canCollide = true;
	
	}
	
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

//Looking up
if moveUp && onGround {

	lookingUp = true;

}


//if moveUpPressed && place_meeting(x, y, obj_block_ladder) {
if moveUp && place_meeting(x, y, obj_block_ladder) && canGrabLadder {

	climbing = true;
	lookingUp = false;
	jumpCount = 0;

}

//if !place_meeting(x,y, obj_block_ladder) {
//	
//	climbing = false;
//	
//}



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

if lookingUp && (!moveUp || !onGround) {

	lookingUp = false;

}



//X movement

//Move direction
moveDir = moveRight - moveLeft;
//if crouching moveDir = 0;



//Face direction
if moveDir != 0 faceDir = moveDir;


//Get xSpeed

if !global.runModeIsToggle {

	runType = run;

} else {

	if runPressed runType = !runType;

}


xSpeed = moveDir * moveSpeed[runType];

if crouching xSpeed = 0;
if lookingUp xSpeed = 0;
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
	
			
			//Stretch when hitting wall
			if !wallStretching {
				
				wallStretching = true;
			
				if abs(xSpeed) >= moveSpeed[1] {
				
					xStretch = 0.5;
					yStretch = 1.5;
					
					if !audio_is_playing(sfx_bonk) audio_play_sound(sfx_bonk, 1, 0, 1, 0, 0.5);
				
				} else {
			
					xStretch = 0.8;
					yStretch = 1.2;
					
					if !audio_is_playing(sfx_bonk) audio_play_sound(sfx_bonk, 1, 0, 1, 0, 0.7);
				
				}
			
			}
			//Collide
			xSpeed = 0;
			
		}
	
	}

}

if (!moveLeft && !moveRight) || (moveLeft && moveRight) wallStretching = false;

//Collide with enemy on side

var collidingEnemy = instance_place(x + xSpeed, y, obj_enemy) 

if collidingEnemy {

	if !collidingEnemy.defeated && !collidingEnemy.harmless {
		
		//show_debug_message("player defeated x collision")
		//if instance_place(x, y + ySpeed, obj_enemy) != collidingEnemy playerDefeated();
		enemyKilledPlayer = true;
		
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

if !global.cutsceneActive x += xSpeed;


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
	
	if jumpCount == 0 && coyoteJumpTimer <= 0 {
		
		if !climbing jumpCount = 1;
		
	}
	
	coyoteHangTimer = 0;

}

//show_debug_message("jumpCount: " + string(jumpCount))

//Initiate the jump

//if jumpKeyBuffered && jumpCount < jumpMax && !jumpDisabled { //RE ENABLE FOR CROUCH JUMP

var _floorIsSolid = false;
if instance_exists(myFloorPlat) && (myFloorPlat.object_index == obj_block_wall || object_is_ancestor(myFloorPlat.object_index, obj_block_wall)) {

	_floorIsSolid = true;

}

//Perform the jump
//if jumpKeyBuffered && jumpCount < jumpMax && !jumpDisabled && (!moveDown || _floorIsSolid) {
if jumpKeyBuffered && jumpCount < jumpMax && !jumpDisabled {

	//Reset jump buffer
	jumpKeyBuffered = false;
	jumpKeyBufferTimer = 0;
	
	//Increase number of performed jumps
	jumpCount++;
	
	if pitterPlayerIsPresent() {
	
		if obj_player_pitter.jumpCount >= obj_player_pitter.jumpMax && obj_player_pitter.gemPowerupDoubleJump {
	
			obj_player_pitter.jumpMax = 1;
	
			obj_player_pitter.gemPowerupDoubleJump = false;
			if patterPlayerIsPresent() obj_player_patter.gemPowerupDoubleJump = false;
	
		}
	
	}
	
	//Set jump hold timer
	jumpHoldTimer = jumpHoldFrames[jumpCount-1];
	
	setOnGround(false);
	coyoteJumpTimer = 0; //NOTE: if having coyote time issues check this line
	
	var _pitch = random_range(0.9, 1.1);
	
	if jumpCount >= 2 {
		
		_pitch += 0.3;
		
		with obj_player {
			
			xStretch = 0.5;
			yStretch = 1.5;
			//instance_create_layer(x, y, "Instances", obj_vfx_actionLines_doubleJump);
			
		}
		
		if global.doubleJumpActive {
		
			instance_create_layer(x, y, "Instances", obj_vfx_actionLines_doubleJump);
		
		} else {
		
			with obj_player instance_create_layer(x, y, "Instances", obj_vfx_actionLines_doubleJump);
		
		}
		
		//if pitterPlayerIsPresent() {
		//	
		//	show_debug_message("pitter double jump vfx created")
		//	instance_create_layer(obj_player_pitter.x, obj_player_pitter.y, "Instances", obj_vfx_actionLines_doubleJump);
		//	
		//}
		//
		//
		//if patterPlayerIsPresent() {
		//	
		//	show_debug_message("patter double jump vfx created")
		//	instance_create_layer(obj_player_patter.x, obj_player_patter.y, "Instances", obj_vfx_actionLines_doubleJump);
		//	
		//}
		
	} else {
	
		instance_create_layer(x, y, "Instances", obj_vfx_dust_jump);
	
	}
	
	audio_play_sound(jumpSfx, 1, 0, 1, 0, _pitch);
	
	
	
	xStretch = 0.5;
	yStretch = 1.5;
	
	if climbing {
		
		canGrabLadder = false;
		alarm[5] = ladderGrabCooldown;
		
	}
	
	climbing = false;
	
	image_speed = 1;
	
	//show_debug_message("jumpCount: " + string(jumpCount))

}

//Cut off the jump by releasing the jump button
if !jump {

	jumpHoldTimer = 0;

}

//Jump based on the timer/holding the button (unless player is climbing)
if jumpHoldTimer > 0 && !climbing {
	
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



//Check if stomped on enemy
collidingEnemy = instance_place(x, y + ySpeed, obj_enemy); 

if collidingEnemy {

	if !collidingEnemy.defeated {

		if ySpeed > 0 && !climbing {
	//	if !climbing {
	
			if !audio_is_playing(sfx_slice) audio_play_sound(sfx_slice, 1, 0, 1, 0, 1.5);
			
			if global.doubleJumpActive {
			
				if jumpCount == jumpMax jumpCount--;
			
			}
			
			if !collidingEnemy.invincible {
			
				with obj_player instance_create_layer(x, y, "Instances", obj_vfx_actionLines_enemyImpact);
			
			} else {
			
				instance_create_layer(x, y, "Instances", obj_vfx_actionLines_enemyImpact);
			
			}
	
			if !collidingEnemy.invincible collidingEnemy.defeated = true;
			collidingEnemy.xStretch = 1.5;
			collidingEnemy.yStretch = 0.5;
			setOnGround(false);
			ySpeed = jump ? jumpOffEnemySpeed[1] : jumpOffEnemySpeed[0];
			enemyKilledPlayer = false;
	
		} else {

			//show_debug_message("player defeated y collision")
			if !collidingEnemy.harmless enemyKilledPlayer = true;
			//enemyKilledPlayer = true;
			//playerDefeated();
	
		}
	
	}

}

if enemyKilledPlayer playerDefeated();

//Check if bonked a switch block
if place_meeting(x, y + ySpeed, obj_interactable_switch_block_parent) && ySpeed < 0 {

	with instance_nearest(x,y,obj_interactable_switch_block_parent) {
	
		if object_index == obj_interactable_switch_block_shop {
		
			if !itemBought {
			
				if global.coinCount >= itemPrice {
			
					itemBought = true;
					global.coinCount -= itemPrice;
					bonked = true;
					
					if instance_exists(obj_shopItem_parachute) {
						
						audio_play_sound(sfx_purchase_scammed, 1, 0, 3, 0, 0.3);
						
					} else {
					
						audio_play_sound(sfx_collect_coin, 1, 0, 3, 0, 0.5);
						
					}
						
				} else {
				
					audio_play_sound(sfx_mouseChirp, 1, 0, 1, 0, 1.0);
				
				}
			
			}
		
		} else {
	
			if !inert {
	
				bonked = true;
				if visible || secret audio_play_sound(sfx_pause, 1, 0, 1, 0, 2.0);
			
			}
		
		}
	
	}

}

if place_meeting(x, y + ySpeed, obj_block_wall) && canCollide {

	var _pixelCheck = _subPixel * sign(ySpeed);
	
	while !place_meeting(x, y + _pixelCheck, obj_block_wall) {
	
		y += _pixelCheck;
	
	}
	
	//Bonk head on ceiling 
	if ySpeed < 0 {
		
		if !audio_is_playing(sfx_footstep) audio_play_sound(sfx_footstep, 1, 0, 1, 0, 0.5);
		jumpHoldTimer = 0;
		
		//xStretch = 1.5;
		//yStretch = 0.5;
		
	}
	
	groundCollideSpeed = ySpeed;
	
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

//One last check to confirm floor platform is infact below us or if platform has moved away
if instance_exists(myFloorPlat) && !place_meeting(x, y + movePlatYspeedMax, myFloorPlat) {

	myFloorPlat = noone;

}
//@
//Land on ground platform if there is one (except if player is climbing up)
if instance_exists(myFloorPlat) && (!climbing || !moveUp) {
//if instance_exists(myFloorPlat) && !climbing {

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
	
	groundCollideSpeed = ySpeed;
	ySpeed = 0;
	
	//Collide with ground
	setOnGround(true);
	
	//if myFloorPlat.object_index == obj_interactable_breakableFloor {
	//
	//	myFloorPlat.triggered = true;
	//
	//}
	
	
	if myFloorPlat.object_index == obj_block_wall_semiSolid_moving
	|| myFloorPlat.object_index == obj_block_wall_moving
	|| object_is_ancestor(myFloorPlat.object_index, obj_block_wall_semiSolid_moving) 
	|| object_is_ancestor(myFloorPlat.object_index, obj_block_wall_moving) {
	
		if myFloorPlat.onRails {
	
			with myFloorPlat {
		
				if stationary {
		
					stationary = false;
					movingOnRails = true;
					path_start(railPath, pathSpeed, path_action_reverse, false);
			
				}
		
			}
	
		}
	
	}
	
}

//Manually fall through a semisolid platform
//if moveDown && jumpPressed && !global.cutsceneActive {
//
//	//Make sure we have a floor platform that is a semisolid
//	if instance_exists(myFloorPlat) && (myFloorPlat.object_index == obj_block_wall_semiSolid || object_is_ancestor(myFloorPlat.object_index, obj_block_wall_semiSolid)) {
//	
//		//Check if we can go below the semisolid platform
//		
//		var _yCheck = max(1, myFloorPlat.ySpeed+1);
//		if !place_meeting(x, y + _yCheck, obj_block_wall) {
//		
//			y += 1;
//			
//			//Inherit downward movespeed from my platform so it doesn't catch me
//			ySpeed = _yCheck-1;
//			
//			//Forget this platform so we don't get caught on it again
//			forgetSemisolid = myFloorPlat;
//			
//			setOnGround(false);
//		
//		}
//	
//	}
//
//}



//Climbing
if climbing {
	
	onGround = false;

	ySpeed = 0;
	
	var _climbSpeed = run ? climbSpeed[1] : climbSpeed[0];
	
	if moveUp ySpeed = -_climbSpeed;
	if moveDown ySpeed = _climbSpeed;
	
	if moveUp || moveDown || moveLeft || moveRight {
	
		image_speed = 1;
	
	} else {
	
		image_speed = 0;
	
	}
	
	if !place_meeting(x+xSpeed,y, obj_block_ladder) {
		
		x -= xSpeed;
		
	}
	
	if !place_meeting(x,y+ySpeed, obj_block_ladder) {
		
		y -= ySpeed;
		
	}

}

//show_debug_message(image_index)


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
if instance_exists(myFloorPlat) && (myFloorPlat.ySpeed != 0
|| myFloorPlat.object_index == obj_block_wall_moving
|| object_is_ancestor(myFloorPlat.object_index, obj_block_wall_moving)
|| myFloorPlat.object_index == obj_block_wall_semiSolid_moving
|| object_is_ancestor(myFloorPlat.object_index, obj_block_wall_semiSolid_moving)) {

	if !place_meeting(x, myFloorPlat.bbox_top, obj_block_wall) && myFloorPlat.bbox_top >= bbox_bottom-movePlatYspeedMax {
	
		y = myFloorPlat.bbox_top; //Unfloor y when on moving platform
		
		if myFloorPlat.onRails y += myFloorPlat.ySpeed;
	
	}
	
	
	
}


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
image_blend = c_white;
if place_meeting(x, y, obj_block_wall) 
//&& !place_meeting(x, y, obj_interactable_onOff_block_on) 
&& !place_meeting(x, y, obj_interactable_switch_block_parent) 
&& !place_meeting(x, y, obj_interactable_breakableFloor) 
&& !place_meeting(x, y, obj_interactable_switch_block_inert) {

	crushTimer++;
	if crushTimer > crushGraceFrames {
		
		//image_blend = c_blue;
		crushed = true;
		playerDefeated();
	
	}

} else {

	crushTimer = 0;

}
//@

// 1. Create a temporary list to hold the results
var __breakableFloorList = ds_list_create();

// 2. Check for collisions and store the count
// instance_place_list(x, y, obj, list, ordered)
var _num = instance_place_list(x, y+1, obj_interactable_breakableFloor, __breakableFloorList, false);

// 3. If we hit something (count > 0)
if (_num > 0) {
    // Loop through every object in the list
    for (var i = 0; i < _num; i++) {
        
        // Get the specific instance ID from the list
        var _inst = __breakableFloorList[| i];
        
        // --- DO YOUR LOGIC HERE ---
        // Example: Break the floor
        with (_inst) {
			triggered = true;
            //instance_destroy();
        }
    }
}

// 4. IMPORTANT: Clean up the list to prevent memory leaks
ds_list_destroy(_list);


//Prevent player from getting crushed by breakable floors
var _breakableFloor = instance_place(x, y, obj_interactable_breakableFloor);
if _breakableFloor != noone {

	crushTimer = 0;
	
	y = _breakableFloor.y - 0;
	
}

//Prevent player from getting crushed by onOffBlocks
var _onOffBlock = instance_place(x, y, obj_interactable_onOff_block_on);
if _onOffBlock != noone && crushTimer > 0 {

	crushTimer = 0;
	
	x = faceDir = 1 ? _onOffBlock.x + 18 : _onOffBlock.x - 2; 
	y = _onOffBlock.y + 8;
	
}

var _switchBlock = instance_place(x, y, obj_interactable_switch_block_parent);
if _switchBlock != noone {

	//x = faceDir = 1 ? _onOffBlock.x + 18 : _onOffBlock.x - 2; 
	y = _switchBlock.y + 22;
	
}

//var _barrel = instance_place(x, y, obj_scienceJuice_doubleJump);
//if _barrel != noone {
//
//	//x = _barrel.x + 8;
//	//y = _switchBlock.y + 22;
//	
//}


if !global.runModeIsToggle {

	if run && (moveLeftPressed || moveRightPressed) && onGround && !climbing {

		var _xScale = moveDir;

		with instance_create_layer(x, y, "Instances", obj_vfx_dust_sprint) {
	
			image_xscale = _xScale;
	
		}
	
	}

} else { //"Toggle run" mode on

	if runType == 1 && (moveLeftPressed || moveRightPressed) && onGround && !climbing {

		var _xScale = moveDir;

		with instance_create_layer(x, y, "Instances", obj_vfx_dust_sprint) {
	
			image_xscale = _xScale;
	
		}
	
	}

}

if runPressed && onGround && !climbing {
	
	var _xScale = moveDir;

	with instance_create_layer(x, y, "Instances", obj_vfx_dust_sprint) {
	
		image_xscale = _xScale;
	
	}

}


//Sprite Control

if sprite_index == spr_patter_scared_shaking {

	lookingUp = false;
	crouching = false;

}

if !global.cutsceneActive && !recoveringFromFear {

	if !climbing {

		if abs(xSpeed) > 0 sprite_index = walkSprite;

		if abs(xSpeed) >= moveSpeed[1] sprite_index = runSprite;
	
		if xSpeed == 0 sprite_index = idleSprite;

		if !onGround sprite_index = jumpSprite;

		if lookingUp sprite_index = lookingUpSprite;
	
		if crouching sprite_index = crouchSprite;

		mask_index = maskSprite; //Use this collision mask
		if crouching mask_index = crouchSprite;

	} else {

		sprite_index = climbingSprite;

	}

}


if recoveringFromFear {

	if xSpeed == 0 && !standingUp {
		
		standingUp = true;
		
		image_speed = 1;
		image_index = 0;
		sprite_index = spr_patter_scared_recoveringSigh;
		
		//show_debug_message("image_speed: " + string(image_speed))
		
	}
	
}

if standingUp {

	if isLastAnimationFrame() || xSpeed != 0 || !onGround {
	
		standingUp = false;
		recoveringFromFear = false;
	
	}

}


if instance_exists(obj_manager_spookyForestGhost) && object_index == obj_player_patter {

	if (obj_manager_spookyForestGhost.glitchesAppearing || obj_manager_spookyForestGhost.textAppearing || obj_manager_spookyForestGhost.ghostArriving) && !obj_manager_spookyForestGhost.ghostDeparting {
		
		var _idleSprite = spr_patter_scared_idle;
		
	//	if place_meeting(x,y,obj_trigger_behindLayer) && !recoveringFromFear _idleSprite = spr_patter_scared_shaking;
		if place_meeting(x,y,obj_trigger_behindLayer) _idleSprite = spr_patter_scared_shaking;
	
		if abs(xSpeed) > 0 sprite_index = spr_patter_scared_walk;

		if abs(xSpeed) >= moveSpeed[1] sprite_index = spr_patter_scared_run;
	
		if xSpeed == 0 sprite_index = _idleSprite;

		if !onGround sprite_index = spr_patter_scared_jump;

		if lookingUp sprite_index = _idleSprite;
	
		if crouching sprite_index = _idleSprite;

		mask_index = maskSprite; //Use this collision mask
		if crouching mask_index = crouchSprite;
		
		if sprite_index == spr_patter_scared_shaking && isLastAnimationFrame() {
		
			image_speed = 0;
			
			var _vibrateRange = 0.1;

			var _offsetX = random_range(-_vibrateRange, _vibrateRange);
			
			sprite_set_offset(spr_patter_scared_shaking, 8+_offsetX, 16)
			
			if !scaredSweating {
			
				scaredSweating = true;
				alarm[0] = sweatParticleSpawnRate;
			
			}
		
		} else {
		
			scaredSweating = false;
			image_speed = 1;
		
		}
	
	}
	
}


//Cutscene sprite control






if global.cutsceneActive {
	
	//if onGround sprite_index = idleSprite;
	
	moveDir = 0;
	xSpeed = 0;
	//ySpeed = 0;

	switch global.currentCutsceneID {
	
		case CUTSCENE_ID.OPENING: {
			
			//show_debug_message("pitter x: " + string(obj_player_pitter.x))
			
			//ySpeed = -0.5;
		
			switch global.titleScreenCutsceneState {
			
				case TITLE_SCREEN_CUTSCENE_STATE.ON_MENU: {
				
					sprite_index = happySprite;
				
				} break;
				
				case TITLE_SCREEN_CUTSCENE_STATE.STARTING_CUTSCENE: {
				
					sprite_index = happySprite;
				
				} break;
				
				case TITLE_SCREEN_CUTSCENE_STATE.PITTER_HOLDING_CHERRY: {
				
					if object_index == obj_player_pitter sprite_index = spr_pitter_giveCherry;
					if object_index == obj_player_patter sprite_index = spr_patter_forward_left;
				
				} break;
				
				case TITLE_SCREEN_CUTSCENE_STATE.PITTER_THROWING_CHERRY: {
				
					var _patterSprite = global.titleScreenCherriesEaten == 1 ? spr_patter_happy : spr_patter_happy_eat;
				
					if object_index == obj_player_pitter sprite_index = spr_pitter_gaveCherry;
					if object_index == obj_player_patter sprite_index = _patterSprite;
				
				} break;
				
				case TITLE_SCREEN_CUTSCENE_STATE.PATTER_HOLDING_CHERRY: {
				
					if object_index == obj_player_pitter sprite_index = spr_pitter_forward;
					if object_index == obj_player_patter sprite_index = spr_patter_giveCherry;
				
				} break;
				
				case TITLE_SCREEN_CUTSCENE_STATE.PATTER_THROWING_CHERRY: {
				
					var _pitterSprite = global.titleScreenCherriesEaten == 2 ? spr_pitter_happy : spr_pitter_happy_eat;
				
					if object_index == obj_player_pitter sprite_index = _pitterSprite;
					if object_index == obj_player_patter sprite_index = spr_patter_gaveCherry;
				
				} break;
				
				case TITLE_SCREEN_CUTSCENE_STATE.PITTER_PATTER_HUGGING: {
				
					var _pitterSprite = global.pitterPatterHugging ? spr_pitter_hugPatter : spr_pitter_walk;
					var _pitterHspeed = global.pitterPatterHugging ? 0.0 : 0.5;
					
					if object_index == obj_player_pitter sprite_index = _pitterSprite;
					if object_index == obj_player_patter sprite_index = spr_patter_walk_left;
					if object_index == obj_player_pitter hspeed = _pitterHspeed;
					if object_index == obj_player_patter hspeed = -0.5;
				
				} break;
				
				case TITLE_SCREEN_CUTSCENE_STATE.PAD_FIRING: {
				
				
				} break;
			
			}
		
			//if happyPicnic sprite_index = happySprite;
			//if concernedPicnic sprite_index = concernSprite;
			//if scaredPicnic sprite_index = scaredSprite;
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
			//
			if thinkingPicnic {
			
				hspeed = 0;
				image_xscale = 1;
				sprite_index = spr_pitter_curious_nervous;
			
				var _offsetX = -1;
				var _offsetY = -20;
			
				if !instance_exists(obj_background_elipses) {
			
					instance_create_layer(x + _offsetX, y + _offsetY, "Instances", obj_background_elipses);
			
				} 
			
			}
			
			if wonderingAboutCherriesPicnic {
			
				sprite_index = spr_pitter_determined;
			
			}
			
		} break;
		
		case CUTSCENE_ID.SPLIT_SCREEN_ACTIVATE: {
		
			if onGround sprite_index = idleSprite;
			
			if onGround && obj_cutsceneSystem.cutsceneState == SPLIT_SCREEN_CUTSCENE_STATE.NONE {
			
				obj_cutsceneSystem.cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.PITTER_PONDERING;
					
				with instance_create_layer (x, y - 15, "Instances", obj_background_elipses) {
				
					duration = 300;
				
				}
			
			}
		
			if obj_cutsceneSystem.cutsceneState == SPLIT_SCREEN_CUTSCENE_STATE.PITTER_PONDERING
			||  obj_cutsceneSystem.cutsceneState == SPLIT_SCREEN_CUTSCENE_STATE.PITTER_WAITING_FOR_RESPONSE {
			
				sprite_index = spr_pitter_curious;
			
			}
			
			if obj_cutsceneSystem.cutsceneState == SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SHOUTING_LEFT {
			
				sprite_index = spr_pitter_callOut;
				image_xscale = -1;
			
			}
			
			if obj_cutsceneSystem.cutsceneState == SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SHOUTING_RIGHT {
			
				sprite_index = spr_pitter_callOut;
				image_xscale = 1;
			
			}
			
			if obj_cutsceneSystem.cutsceneState == SPLIT_SCREEN_CUTSCENE_STATE.PITTER_SAD {
			
				sprite_index = spr_pitter_sad;
				
			}
			
			if obj_cutsceneSystem.cutsceneState == SPLIT_SCREEN_CUTSCENE_STATE.FADING_IN_WHITE {
				
				sprite_index = faceDir == -1 ? spr_pitter_curious_nervous_questionMarks_mirrored : spr_pitter_curious_nervous_questionMarks;

			}
		
		} break;
		
		case CUTSCENE_ID.DOUBLE_JUMP_BARREL: { 
			
			if obj_cutsceneSystem.cutsceneState == DOUBLE_JUMP_BARREL_CUTSCENE_STATE.JUMPING_OUT
			|| obj_cutsceneSystem.cutsceneState == DOUBLE_JUMP_BARREL_CUTSCENE_STATE.POSING {
			
				if object_index == obj_player_pitter sprite_index = spr_pitter_findItem;
				if object_index == obj_player_patter sprite_index = spr_patter_findItem;
			
			}
			
		} break;
		
		case CUTSCENE_ID.FOREST_HAUNTING: { 
			
			if obj_cutsceneSystem.cutsceneState == FOREST_HAUNTING_CUTSCENE_STATE.LOOKING_AT_FLOWER {
			
				if object_index == obj_player_pitter sprite_index = spr_pitter_forward;
				if object_index == obj_player_patter sprite_index = spr_patter_forward;
			
			}
			
			if obj_cutsceneSystem.cutsceneState == FOREST_HAUNTING_CUTSCENE_STATE.WALKING_TO_FLOWER {
			
				if object_index == obj_player_pitter sprite_index = spr_pitter_walk;
				if object_index == obj_player_patter sprite_index = spr_patter_walk;
			
			}
			
			if obj_cutsceneSystem.cutsceneState == FOREST_HAUNTING_CUTSCENE_STATE.PICKING_FLOWER {
			
				if object_index == obj_player_pitter sprite_index = spr_pitter_holdingPinkFlower;
				if object_index == obj_player_patter sprite_index = spr_patter_holdingBlueFlower;
			
			}
			
			if obj_cutsceneSystem.cutsceneState == FOREST_HAUNTING_CUTSCENE_STATE.THINKING_ABOUT_PARTNER {
			
				if object_index == obj_player_pitter sprite_index = spr_pitter_holdingPinkFlower_sad;
				if object_index == obj_player_patter sprite_index = spr_patter_holdingBlueFlower_sad;
			
			}
			
			if obj_cutsceneSystem.cutsceneState == FOREST_HAUNTING_CUTSCENE_STATE.PUTTING_FLOWER_AWAY {
			
				if object_index == obj_player_pitter sprite_index = spr_pitter_sad;
				if object_index == obj_player_patter sprite_index = spr_patter_sad;
			
			}
			
			if obj_cutsceneSystem.cutsceneState == FOREST_HAUNTING_CUTSCENE_STATE.LOOKING_AT_CAVE {
			
				if object_index == obj_player_pitter sprite_index = spr_pitter_forward;
				if object_index == obj_player_patter sprite_index = spr_patter_forward;
			
			}
			
			if obj_cutsceneSystem.cutsceneState == FOREST_HAUNTING_CUTSCENE_STATE.WALKING_TO_CAVE {
			
				if object_index == obj_player_pitter sprite_index = spr_pitter_walk;
				if object_index == obj_player_patter sprite_index = spr_patter_walk;
			
			}
			
			if obj_cutsceneSystem.cutsceneState == FOREST_HAUNTING_CUTSCENE_STATE.KNOCKING_ON_BOULDER {
			
				if object_index == obj_player_pitter {
					
					if sprite_index != spr_pitter_curious_knock {
						
						sprite_index = spr_pitter_curious_knock;
						
						//show_debug_message("spr_pitter_curious_knockALT sprite set")
						
					}
					
				}
				
			//	if object_index == obj_player_pitter sprite_index = spr_pitter_curious;
				if object_index == obj_player_patter {
					
					if sprite_index != spr_patter_curious_poke sprite_index = spr_patter_curious_poke;
					
				}
			
			}
			
			if obj_cutsceneSystem.cutsceneState == FOREST_HAUNTING_CUTSCENE_STATE.SHAKING_HEAD {
			
				if object_index == obj_player_pitter sprite_index = spr_pitter_sad_shakeHead;
				if object_index == obj_player_patter sprite_index = spr_patter_annoyed;
			
			}
			
			if obj_cutsceneSystem.cutsceneState == FOREST_HAUNTING_CUTSCENE_STATE.WALKING_BACK {
			
				if object_index == obj_player_pitter sprite_index = spr_pitter_walk;
				if object_index == obj_player_patter sprite_index = spr_patter_walk;
			
			}
			
			if obj_cutsceneSystem.cutsceneState == FOREST_HAUNTING_CUTSCENE_STATE.THINKING {
			
				if object_index == obj_player_pitter sprite_index = spr_pitter_thinking;
				if object_index == obj_player_patter sprite_index = spr_patter_thinking;
			
			}
			
		} break;
		
	}

}

//show_debug_message("image_speed: " + string(image_speed))

//image_index = 1;

//Keep patter in sync with pitter (except on moving platforms because it looks weird)
//if object_index == obj_player_patter && global.splitScreenActive && !instance_exists(myFloorPlat) {
//if object_index == obj_player_patter && global.splitScreenActive {
//
//	if pitterPlayerIsPresent() {
//	
//		if !global.verticalLevel {
//		
//			x = obj_player_pitter.x;
//			y = obj_player_pitter.y + global.patterOffsetY;
//		
//		} else {
//		
//			x = obj_player_pitter.x + global.patterOffsetX;
//			y = obj_player_pitter.y;
//		
//		}
//	
//	}
//
//}