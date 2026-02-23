function setOnGroundEnemy(_val = true) {

	if _val {
	
		onGround = true;
	
	} else {
	
		onGround = false;
		myFloorPlat = noone;
	
	}

}

harmless = false;
invincible = false;

onGround = true;

xSpeed = 0;
ySpeed = 0;

grav = 0.275;
termVelocity = 3.8;

canCollide = true;

downSlopeSemiSolid = noone;
movePlatXspeed = 0;
movePlatYspeedMax = termVelocity;
forgetSemisolid = noone;

climbing = false;
spikey = false;

defeated = false;

beingRemoved = false;
removeDuration = 120;
//removeDuration = 1200;
active = false;

detectionRadius = 300;

xStretch = 1;
yStretch = 1;
stretchAdjustAmount = 0.1;