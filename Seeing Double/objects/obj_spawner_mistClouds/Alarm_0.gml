with instance_create_layer(x, y, "Instances", obj_background_mistCloud) {

	//gravity = 0.2;
	
	//direction =  random_range(45, 135);
	direction =  random_range(0, 180);
	speed =  random_range(2, 5);
	
	//var _scale =  random_range(0.8, 1.2);
	//
	//image_xscale = _scale;
	//image_yscale = _scale;

}

alarm[0] = spawnRate + random_range(-spawnRateVariance, spawnRateVariance);










