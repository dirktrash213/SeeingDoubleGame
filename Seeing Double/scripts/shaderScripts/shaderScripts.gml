 function layer_set_alpha() {

	if (event_number == 0) {

		shader_set(shd_layer_alpha);

		shader_set_uniform_f(global.shader_alpha, global.layer_alpha);

	} else {
	
		//show_debug_message("layer alpha not set!")
	
	}

}

function layer_alpha_reset() {
	
	//show_debug_message("Shader reset!")

	if (shader_current() != -1) shader_reset();

}

function layer_alpha_settings(layer_name) {

	if layer_exists(layer_get_id(layer_name)) {

		global.layer_alpha = 1;

		var lay_id = layer_get_id(layer_name);

		global.shader_alpha = shader_get_uniform(shd_layer_alpha, "alpha");

		layer_script_begin(lay_id, layer_set_alpha);

		layer_script_end(lay_id, layer_alpha_reset);

	}

}

function make_layer_transparent(layer_to_collide, min_alpha, spd_alpha, decrease = true) {

	// min_alpha - how transparent the layer will be

	// spd_alpha - speed of change the alpha channel

	if (layer_exists(layer_to_collide)) {

		// Make layer transparent when player collides with

	//	if (place_meeting(x, y,layer_tilemap_get_id(layer_to_collide))) {
		if decrease {

			global.layer_alpha -= spd_alpha;

		}

		else {  

			global.layer_alpha += spd_alpha;

		}

		global.layer_alpha = clamp(global.layer_alpha, min_alpha, 1);

	} else {
	
		show_debug_message("Layer not found!")
	
	}
	
	//show_debug_message("global.layer_alpha:" + string(global.layer_alpha))

} 