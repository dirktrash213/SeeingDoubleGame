/*



//effect_create_above(ef_cloud, 100, 100, 1000, c_white);
	
	//Title screen particle effects
	global.particleSystemHearts = part_system_create_layer("HeartParticles", false);
	global.particleSystemDevice = part_system_create_layer("DeviceParticles", false);
	
	//global.emitterPinkHearts = part_emitter_create(global.particleSystemHearts);
	//global.emitterBlueHearts = part_emitter_create(global.particleSystemHearts);
	//global.emitterDeviceSparks = part_emitter_create(global.particleSystemDevice);

	global.particleHeartPink = part_type_create();
	global.particleHeartBlue = part_type_create();
	global.particleSparkDevice = part_type_create();

	part_type_sprite(global.particleHeartPink, spr_patter_heart, 0, 0, 0);
	part_type_speed(global.particleHeartPink, 1, 2, 0, 0);
	part_type_direction(global.particleHeartPink, 80, 100, 0, 0);
	
	//var _offsetY = -5;
	//
	//part_emitter_region(
	//
	//	global.particleSystemHearts, 
	//	global.emitterPinkHearts, 
	//	obj_player_pitter.x, 
	//	obj_player_pitter.x, 
	//	obj_player_pitter.y + _offsetY, 
	//	obj_player_pitter.y + _offsetY, 
	//	ps_shape_rectangle, 
	//	ps_distr_gaussian
	//
	//);
	
	
	
	//part_emitter_stream(global.particleSystemHearts, global.emitterPinkHearts, global.particleHeartPink, 1);
	
	
	
	part_type_sprite(global.particleHeartBlue, spr_pitter_heart, 0, 0, 0);
	
	part_type_sprite(global.particleSparkDevice, spr_background_pixel, 0, 0, 0);

