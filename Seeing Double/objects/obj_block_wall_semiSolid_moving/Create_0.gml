event_inherited();

//active = true;
//activeGraceTimer = 60;
//invisCoop = false;
//pitterColor = #6DD0F7;
//patterColor = #F3C2D8;
//
//if !global.verticalLevel {
//	
//	if !global.customLevel {
//	
//		isOnPitterScreen = y < global.patterOffsetY;
//	
//	} else {
//	
//		isOnPitterScreen = y < global.defaultCustomLevelPatterOffsetY;
//	
//	}
//	
//} else {
//
//	isOnPitterScreen = x < global.patterOffsetX;
//
//}
//

coopObjectCreateEventCode();





dir = 0;
rotationSpeed = 360/180;
radius = 32;

horizontal = false;
vertical = false;

onRails = false;
movingOnRails = false;
stationary = false;

railPath = path_platform_elevator_up;
pathSpeed = 1;

// Store the object's position from the previous step
previousX = x;
previousY = y;

// Variables to store the calculated speeds
//pathHspeed = 0;
//pathVspeed = 0;

storedSpeed = 1;
