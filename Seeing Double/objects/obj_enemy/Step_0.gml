//if global.playerDefeated || global.paused {
if global.paused {

	if alarm[0] != -1 alarm[0]++;

	x = x;
	y = y;
	
	exit;

}

if defeated && !beingRemoved {

	beingRemoved = true;
	alarm[0] = removeDuration;

}

//Apply gravity
ySpeed += grav;
setOnGroundEnemy(false);

//Cap falling speed
if ySpeed > termVelocity ySpeed = termVelocity;

#region Old Y Collision Code

var _subPixel = 0.5;

if place_meeting(x, y + ySpeed, obj_block_wall) && canCollide {

	var _pixelCheck = _subPixel * sign(ySpeed);
	
	while !place_meeting(x, y + _pixelCheck, obj_block_wall) {
	
		y += _pixelCheck;
	
	}
	
	//Bonk head on ceiling 
	if ySpeed < 0 {
		
		audio_play_sound(sfx_footstep, 1, 0, 1, 0, 0.5);
		
	}
	
	//Set ySpeed to 0 to collide
	ySpeed = 0;
	
}

//Check if on ground
if ySpeed >= 0 && place_meeting(x, y + 1, obj_block_wall) {

	setOnGroundEnemy(true);

}

#endregion




//Floor Y Collision

//Check for solid and semisolid platforms under the enemy


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

//Loop through colliding wall objects and only return one if its top is below the enemy
for(var i = 0; i < _listSize; i++) {

	var _listInstance = _list[|i];
	
	if (_listInstance != forgetSemisolid && (_listInstance.ySpeed <= ySpeed || instance_exists(myFloorPlat)) 
	&& (_listInstance.ySpeed > 0 || place_meeting(x, y+1 + _clampedYspeed, _listInstance))) {
	// || (_listInstance == _semiSolid)  //HI RES/HI SPEED FIX
		//Return a solid wall or any semisolid walls that are below the enemy
		if _listInstance.object_index == obj_block_wall 
		|| object_is_ancestor(_listInstance.object_index, obj_block_wall) 
		|| floor(bbox_bottom) <= ceil(_listInstance.bbox_top - _listInstance.ySpeed) {
	
			//Return the highest wall object, and check for platforms that pick up the enemy from below
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

//Land on ground platform if there is one (except if enemy is climbing up)
if instance_exists(myFloorPlat) && !climbing {

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
	setOnGroundEnemy(true);
	
}


//Move
//if !place_meeting(x, y+ySpeed, obj_block_wall) && !place_meeting(x, y+ySpeed, obj_block_wall_semiSolid) {
if !place_meeting(x, y+ySpeed, obj_block_wall) {
	
	y += ySpeed;
	
}