
function particleSetup() {

	//effect_create_above(ef_cloud, 100, 100, 1000, c_white);
	
	//Title screen particle effects
	global.particleSystemHearts = part_system_create_layer("HeartParticles", false);
	//global.particleSystemHearts = part_system_create();
	global.particleSystemDevice = part_system_create();
	
	global.particleHeartPink = part_type_create();
	global.particleHeartBlue = part_type_create();
	global.particleSparkDevice = part_type_create();
	global.particleWherePatter = part_type_create();
	global.particleCallForPatter = part_type_create();
	global.particleWhereCherries = part_type_create();
	
	global.particleCoinSparkle = part_type_create();
	global.particleCoinSparkleRed = part_type_create();

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
	
	part_type_sprite(global.particleWherePatter, spr_particle_wherePatter, 0, 0, 0);
	part_type_speed(global.particleWherePatter, 0.2, 2, 0, 0);
	part_type_direction(global.particleWherePatter, 60, 120, 0, 0);
	
	part_type_sprite(global.particleWhereCherries, spr_particle_whereCherries, 0, 0, 0);
	part_type_speed(global.particleWhereCherries, 0.2, 0.2, 0, 0);
	part_type_direction(global.particleWhereCherries, 90, 90, 0, 0);
	part_type_life(global.particleWhereCherries, 300, 300);
	
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

