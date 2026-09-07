//player_alpha_settings("SecretTiles");

function setOnGround(_val = true) {

	if _val {
	
		if !onGround && canLandWithDust && !climbing {
			
			//show_debug_message(groundCollideSpeed)
			
			//if groundCollideSpeed >= termVelocity {
			if groundCollideSpeed >= 2 {
			
				instance_create_layer(x, y, "Instances", obj_vfx_dust_jump);
				if !audio_is_playing(sfx_footstep) audio_play_sound(sfx_footstep, 1, 0, 1, 0, 0.5);
			
				xStretch = 1.5;
				yStretch = 0.5;
			
			} else {
			
				if !audio_is_playing(sfx_footstep) audio_play_sound(sfx_footstep, 1, 0, 1, 0, 0.7);
				
				xStretch = 1.2;
				yStretch = 0.8;
			
			}
			
		}
	
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

//if global.coopActive {
	
if object_index == obj_player_pitter {
	
	//show_debug_message("created shadow")
	
	instance_create_layer(x, y, "Instances", obj_player_shadow_pitter);
	
}

if object_index == obj_player_patter {
	
	//show_debug_message("created shadow")
	
	instance_create_layer(x, y, "Instances", obj_player_shadow_patter);
	
}
	
//}

heartParticleSpawnRate = 10;
wherePatterParticleSpawnRate = 20;

//Sprites

maskSprite = spr_pitter_idle; //Use this if you want to use this sprite's collision mask for other sprites
idleSprite = spr_pitter_idle;
walkSprite = spr_pitter_walk;
runSprite = spr_pitter_run;
jumpSprite = spr_pitter_jump;
crouchSprite = spr_pitter_crouch;
lookingUpSprite = spr_pitter_curious;
climbingSprite = spr_pitter_climb;
defeatSprite = spr_pitter_defeat;
crushedSprite = spr_pitter_splat;
groundPoundJumpSprite = spr_pitter_groundPound_jump;
groundPoundFallSprite = spr_pitter_groundPound_fall;
groundPoundFallBoulderSprite = spr_pitter_groundPound_fall_scared;

happySprite = spr_pitter_happy_animated;
concernSprite = spr_pitter_pause;
scaredSprite = spr_pitter_scared;
runScaredSprite = spr_pitter_run_scared;
curiousSprite = spr_pitter_curious;
crySprite = spr_pitter_cry;



jumpSfx = sfx_jump_pitter;


canCollide = true;

slopeChecksEnabled = false;

wearingParachute = false;
wearingBrokenParachute = false;

//Moving

faceDir = 1;
moveDir = 0;
runType = 0;
moveSpeed[0] = 2; //Walk speed
moveSpeed[1] = 3.5; //Run speed

wallStretching = false;

afterimageSpawnRate = 2;
alarm[4] = afterimageSpawnRate;

climbSpeed[0] = 2;
climbSpeed[1] = 3.5;

canGrabLadder = true;
ladderGrabCooldown = 15;

crouching = false;
lookingUp = false;
climbing = false;

underWaterfall = false;
waterfallVFXspawnRate = 8; 

ridingMinecart = false;
currentMinecart = noone;
//adjustingMinecartX = false;

//onConveyor = false;

xSpeed = 0;
ySpeed = 0;

groundCollideSpeed = 0;

xStretch = 1;
yStretch = 1;

stretchAdjustAmount = 0.1;

spawnAfterimages = false;
afterimageSpawnColor = c_lime;

//Jumping

//grav = 0.275;
grav = global.playerDefaultGrav;
//termVelocity = 4;
termVelocity = 3.8;
termVelocityMinecart = 7.0;

jumpMax = 1;
jumpCount = 0;
jumpHoldTimer = 0;

jumpHoldFrames[0] = 10; //18
jumpSpeed[0] = -3.17; //-3.15
jumpHoldFrames[1] = 10;
jumpSpeed[1] = -2.85; 

enemyKilledPlayer = false;
jumpOffEnemySpeed[0] = -5.34;
jumpOffEnemySpeed[1] = -8;

gemPowerupDoubleJump = false;
gemPowerupGroundPound = false;

onGround = true;

groundPounding = false;
groundPoundRising = false;
groundPoundFalling = false;
groundPoundOnCooldown = false;

groundPoundJumpSpeed = -3.25;
groundPoundGravity = 0.2;
groundPoundFallSpeed = 15;
groundPoundCooldown = 30;

canLandWithDust = false;
timeUntilCanLandWithDust = 5;
alarm[3] = timeUntilCanLandWithDust;

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

freakoutDuration = 290;
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
earlyMovePlatXSpeed = false;
movePlatXspeed = 0;
movePlatYspeedMax = termVelocity;
forgetSemisolid = noone;
crushTimer = 0;
crushGraceFrames = 3;
crushed = false;

immuneToOnOffBlockCollision = false;

sweatParticleSpawnRate = 4; //4
scaredSweating = false;
recoveringFromFear = false;
standingUp = false;

stuckOnBoulder = false;

aboutToBeatUpScammer = false;
scammerGroundPoundCount = 0;
