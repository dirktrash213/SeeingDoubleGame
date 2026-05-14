alarm[0] = spawnRate + random_range(-spawnRateVariance, spawnRateVariance);

if !active exit;

var _range = 10;

var _offsetX = random_range(-_range, _range);
var _offsetY = 5;

var _facingUpwards = facingUpwards;

with instance_create_layer(x + _offsetX, y + _offsetY, "Instances", obj_background_mistCloud) {

	//gravity = 0.2;
	
	direction = _facingUpwards ? 90 : 270;
	
	//speed =  random_range(2, 15);
	speed =  random_range(5, 10);
	
	//var _scale =  random_range(0.8, 1.2);
	//
	//image_xscale = _scale;
	//image_yscale = _scale;
	
	//sprite_index = spr_background_mistCloud;
	
	depth = -1000;

}












