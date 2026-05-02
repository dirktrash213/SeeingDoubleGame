
function particleSetup() {

	//effect_create_above(ef_cloud, 100, 100, 1000, c_white);
	
	//Title screen particle effects
	global.particleSystemHearts = part_system_create_layer("HeartParticles", false);
	//global.particleSystemHearts = part_system_create();
	global.particleSystemDevice = part_system_create();
	
	global.particleHeartPink = part_type_create();
	global.particleHeartBlue = part_type_create();
	global.particleSparkDevice = part_type_create();
	global.particleWherePitter = part_type_create();
	global.particleWherePatter = part_type_create();
	global.particleCallForPatter = part_type_create();
	global.particleWhereCherries = part_type_create();
	global.particlePitterFindPatter = part_type_create();
	global.particleBeatUpScammer = part_type_create();
	
	global.particleRock = part_type_create();
	global.particleSweatdrop = part_type_create();
	global.particlePickaxeSpark = part_type_create();
	global.particleMinecartSpark = part_type_create();
	global.particleCoinSparkle = part_type_create();
	global.particleCoinSparkleRed = part_type_create();
	global.scienceJuiceSparksDoubleJump = part_type_create();
	global.scienceJuiceSparksGroundPound = part_type_create();
	global.particleFireworkSpark = part_type_create();
	global.particleFireworkSparkBall = part_type_create();

	var _heartDirMin = 60;
	var _heartDirMax = 120;
	
	part_type_sprite(global.particleHeartPink, spr_particle_heart_pink, 0, 0, 0);
	part_type_speed(global.particleHeartPink, 1, 2, 0, 0);
	part_type_direction(global.particleHeartPink, _heartDirMin, _heartDirMax, 0, 0);
	
	part_type_sprite(global.particleHeartBlue, spr_particle_heart_blue, 0, 0, 0);
	part_type_speed(global.particleHeartBlue, 1, 2, 0, 0);
	part_type_direction(global.particleHeartBlue, _heartDirMin, _heartDirMax, 0, 0);
	
	var _sparkDirMin = 90;
	var _sparkDirMax = 90;
	
	var _sparkSpdMin = 2;
	var _sparkSpdMax = 4;
	
	part_type_sprite(global.particleSparkDevice, spr_background_pixel, 0, 0, 0);
	part_type_speed(global.particleSparkDevice, _sparkSpdMin, _sparkSpdMax, 0, 0);
	part_type_direction(global.particleSparkDevice, _sparkDirMin, _sparkDirMax, 0, 0);
	
	part_type_sprite(global.particleRock, spr_particle_rock, 0, 0, 0);
	part_type_speed(global.particleRock, 3.5, 10.5, 0, 0);
	part_type_direction(global.particleRock, 135, 180, 0, 0);
	part_type_life(global.particleRock, 300, 300);
	part_type_gravity(global.particleRock, 0.1, 270);
	part_type_orientation(global.particleRock, 0, 360, 60, 0, false);
	
	part_type_sprite(global.scienceJuiceSparksDoubleJump, spr_particle_scienceJuiceSparks_doubleJump, 0, 0, 0);
	part_type_speed(global.scienceJuiceSparksDoubleJump, 10.5, 11.5, 0, 0);
	part_type_direction(global.scienceJuiceSparksDoubleJump, 0, 180, 0, 0);
	part_type_life(global.scienceJuiceSparksDoubleJump, 300, 300);
	part_type_gravity(global.scienceJuiceSparksDoubleJump, 0.1, 270);
	
	part_type_sprite(global.scienceJuiceSparksGroundPound, spr_particle_scienceJuiceSparks_groundPound, 0, 0, 0);
	part_type_speed(global.scienceJuiceSparksGroundPound, 10.5, 11.5, 0, 0);
	part_type_direction(global.scienceJuiceSparksGroundPound, 0, 180, 0, 0);
	part_type_life(global.scienceJuiceSparksGroundPound, 300, 300);
	part_type_gravity(global.scienceJuiceSparksGroundPound, 0.1, 270);
	
	part_type_sprite(global.particleFireworkSparkBall, spr_particle_sweat, 0, 0, 0);
	part_type_speed(global.particleFireworkSparkBall, 2.5, 3.5, 0, 0);
	part_type_direction(global.particleFireworkSparkBall, 0, 360, 0, 0);
	part_type_life(global.particleFireworkSparkBall, 300, 300);
	part_type_gravity(global.particleFireworkSparkBall, 0.1, 270);
	
	part_type_sprite(global.particleFireworkSpark, spr_particle_sweat, 0, 0, 0);
	part_type_speed(global.particleFireworkSpark, 2.5, 3.5, 0, 0);
	part_type_direction(global.particleFireworkSpark, 80, 100, 0, 0);
	part_type_life(global.particleFireworkSpark, 15, 30);
	part_type_gravity(global.particleFireworkSpark, 0.0, 270);
	
	part_type_sprite(global.particleSweatdrop, spr_particle_sweat, 0, 0, 0);
	part_type_speed(global.particleSweatdrop, 0.5, 1.5, 0, 0);
	part_type_direction(global.particleSweatdrop, 0, 180, 0, 0);
	part_type_life(global.particleSweatdrop, 300, 300);
	part_type_gravity(global.particleSweatdrop, 0.1, 270);
	
	part_type_sprite(global.particleMinecartSpark, spr_particle_sweat, 0, 0, 0);
	part_type_speed(global.particleMinecartSpark, 1.5, 3.5, 0, 0);
	part_type_direction(global.particleMinecartSpark, 90, 180, 0, 0);
	part_type_life(global.particleMinecartSpark, 45, 45);
	part_type_gravity(global.particleMinecartSpark, 0.1, 270);
	
	part_type_sprite(global.particlePickaxeSpark, spr_particle_sweat, 0, 0, 0);
	part_type_speed(global.particlePickaxeSpark, 0.5, 1.5, 0, 0);
	part_type_direction(global.particlePickaxeSpark, 0, 180, 0, 0);
	part_type_life(global.particlePickaxeSpark, 45, 45);
	part_type_gravity(global.particlePickaxeSpark, 0.1, 270);
	
	part_type_sprite(global.particleBeatUpScammer, spr_particle_destroyScammer, 0, 0, 0);
	part_type_speed(global.particleBeatUpScammer, 0.2, 0.5, 0, 0);
	part_type_direction(global.particleBeatUpScammer, 60, 120, 0, 0);
	part_type_life(global.particleBeatUpScammer, 300, 300);
	
	part_type_sprite(global.particleWherePitter, spr_particle_wherePitter, 0, 0, 0);
	part_type_speed(global.particleWherePitter, 0.2, 0.5, 0, 0);
	part_type_direction(global.particleWherePitter, 60, 120, 0, 0);
	part_type_life(global.particleWherePitter, 300, 300);
	
	part_type_sprite(global.particleWherePatter, spr_particle_wherePatter, 0, 0, 0);
	part_type_speed(global.particleWherePatter, 0.5, 1.5, 0, 0);
	part_type_direction(global.particleWherePatter, 60, 120, 0, 0);
	part_type_life(global.particleWherePatter, 300, 300);
	
	part_type_sprite(global.particleWhereCherries, spr_particle_whereCherries, 0, 0, 0);
	part_type_speed(global.particleWhereCherries, 0.2, 0.2, 0, 0);
	part_type_direction(global.particleWhereCherries, 90, 90, 0, 0);
	part_type_life(global.particleWhereCherries, 300, 300);
	
	part_type_sprite(global.particlePitterFindPatter, spr_particle_pitterFindPatter, 0, 0, 0);
	part_type_speed(global.particlePitterFindPatter, 0.2, 0.2, 0, 0);
	part_type_direction(global.particlePitterFindPatter, 90, 90, 0, 0);
	part_type_life(global.particlePitterFindPatter, 600, 600);
	
	part_type_sprite(global.particleCallForPatter, spr_particle_wherePatter_shout, 0, 0, 0);
	part_type_speed(global.particleCallForPatter, 1, 1, 0, 0);
	part_type_direction(global.particleCallForPatter, 80, 100, 0, 0);
	part_type_life(global.particleCallForPatter, 300, 300);
	
	var _coinSparkleSpeedMin = 2;
	var _coinSparkleSpeedMax = 3;
	var _coinSparkleDirMin = 60; //60
	var _coinSparkledirMax = 120; //120
	var _coinSparkleGrav = 0.1;
	var _coinSparkleLifeMin = 10;
	var _coinSparkleLifeMax = 30;
	
	part_type_sprite(global.particleCoinSparkle, spr_particle_coinSparkle, 0, 0, 0);
	part_type_speed(global.particleCoinSparkle, _coinSparkleSpeedMin, _coinSparkleSpeedMax, 0, 0);
	part_type_direction(global.particleCoinSparkle, _coinSparkleDirMin, _coinSparkledirMax, 0, 0);
	part_type_gravity(global.particleCoinSparkle, _coinSparkleGrav, 270);
	part_type_alpha2(global.particleCoinSparkle, 1, 0);
	part_type_life(global.particleCoinSparkle, _coinSparkleLifeMin, _coinSparkleLifeMax);
	
	part_type_sprite(global.particleCoinSparkleRed, spr_particle_coinSparkleRed, 0, 0, 0);
	part_type_speed(global.particleCoinSparkleRed, _coinSparkleSpeedMin, _coinSparkleSpeedMax, 0, 0);
	part_type_direction(global.particleCoinSparkleRed, _coinSparkleDirMin, _coinSparkledirMax, 0, 0);
	part_type_gravity(global.particleCoinSparkleRed, _coinSparkleGrav, 270);
	part_type_alpha2(global.particleCoinSparkleRed, 1, 0);
	part_type_life(global.particleCoinSparkleRed, _coinSparkleLifeMin, _coinSparkleLifeMax);
	
	
	
	
	
	
}

