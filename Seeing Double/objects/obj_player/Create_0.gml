function setOnGround(_val = true) {

	if _val {
	
		onGround = true;
		coyoteHangTimer = coyoteHangFrames;
	
	} else {
	
		onGround = false;
		myFloorPlat = noone;
		coyoteHangTimer = 0;
	
	}

}

function checkForSemisolidPlatform(_x, _y) {
	
	var _rtrn = noone;

	//We must not be moving upwards, then we check for a normal collision
	
	if ySpeed >= 0 && place_meeting(_x, _y, obj_block_wall_semiSolid) {
	
		var _list = ds_list_create();
		var _listSize = instance_place_list(_x, _y, obj_block_wall_semiSolid, _list, false);
		
		for(var i = 0; i < _listSize; i++) {
		
			var _listInst = _list[|i];
			if _listInst != forgetSemisolid && floor(bbox_bottom) <= ceil(_listInst.bbox_top - _listInst.ySpeed) {
			
				_rtrn = _listInst;
				
				//Exist loop early
				i = _listSize;
			
			}
		
		}
	
		ds_list_destroy(_list);
	
	}

	return _rtrn;

}

controlsSetup();

heartParticleSpawnRate = 10;
wherePatterParticleSpawnRate = 20;

//Sprites

maskSprite = spr_pitter_idle; //Use this if you want to use this sprite's collision mask for other sprites
idleSprite = spr_pitter_idle;
walkSprite = spr_pitter_walk;
runSprite = spr_pitter_run;
jumpSprite = spr_pitter_jump;
defeatSprite = spr_pitter_defeat;
happySprite = spr_pitter_happy;
concernSprite = spr_pitter_pause;
scaredSprite = spr_pitter_scared;
runScaredSprite = spr_pitter_run_scared;
curiousSprite = spr_pitter_curious;


jumpSfx = sfx_jump_pitter;



slopeChecksEnabled = false;


//Moving

faceDir = 1;
moveDir = 0;
runType = 0;
moveSpeed[0] = 2; //Walk speed
moveSpeed[1] = 3.5; //Run speed



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

happyPicnic = false;
concernedPicnic = false;
scaredPicnic = false;
searchingForPatterPicnic = false;
thinkingPicnic = false;
wonderingAboutCherriesPicnic = false;

freakoutDuration = 300;
freakoutSpeed = 1.5;

curiousDuration = 180;

//Respawning

xRespawn = 0;
yRespawn = 0;
roomRespawn = rm_titleScreen;

//Prevent jumping when unpausing
jumpDisabled = false;
jumpDisabledDuration = 2;

//Moving Platforms
downSlopeSemiSolid = noone;
myFloorPlat = noone;
movePlatXspeed = 0;
movePlatYspeedMax = termVelocity;
forgetSemisolid = noone;








