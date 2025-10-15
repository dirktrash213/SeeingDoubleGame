function setOnGround(_val = true) {

	if _val {
	
		onGround = true;
		coyoteHangTimer = coyoteHangFrames;
	
	} else {
	
		onGround = false;
		coyoteHangTimer = 0;
	
	}

}

controlsSetup();

//Sprites

maskSprite = spr_pitter_idle; //Use this if you want to use this sprite's collision mask for other sprites
idleSprite = spr_pitter_idle;
walkSprite = spr_pitter_walk;
runSprite = spr_pitter_run;
jumpSprite = spr_pitter_jump;
defeatSprite = spr_pitter_defeat;


jumpSfx = sfx_jump_pitter;



slopeChecksEnabled = false;


//Moving

faceDir = 1;
moveDir = 0;
runType = 0;
moveSpeed[0] = 2; //Walk speed
moveSpeed[1] = 3.5; //Run speed

moveLeft = 0;
moveRight = 0;

xSpeed = 0;
ySpeed = 0;

//Jumping

grav = 0.275;
termVelocity = 4;

jumpMax = 1;
jumpCount = 0;
jumpHoldTimer = 0;

jumpHoldFrames[0] = 10; //18
jumpSpeed[0] = -3.15; //-3.15  -6.15
jumpHoldFrames[1] = 10;
jumpSpeed[1] = -2.85; 

onGround = true;

//Coyote time

//Hangtime
coyoteHangFrames = 3;
coyoteHangTimer = 0;

//Jump buffer

coyoteJumpFrames = 5;
coyoteJumpTimer = 0;



//Respawning

xRespawn = 0;
yRespawn = 0;
