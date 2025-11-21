with obj_pickup_coin_temporary {
	
	var _image_index = image_index;
	
	with instance_create_layer(x, y, "Collectables", obj_pickup_coin_empty) {
	
		image_index = _image_index;
	
	}
	
	instance_destroy();

}

