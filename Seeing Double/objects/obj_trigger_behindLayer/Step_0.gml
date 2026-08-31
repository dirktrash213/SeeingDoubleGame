//make_layer_transparent("SecretTiles", 0, 0.05);



if room == rm_forest_caveEntrance {
	
	var _collidingObject = global.coopActive ? obj_player_shadow_pitter : obj_player_patter;

	if place_meeting(x, y, _collidingObject) {

		make_layer_transparent("SecretTiles", 0.0, 0.05);

	} else {

		//make_layer_transparent("SecretTiles", 1.0, 0.05, false);
		make_layer_transparent("SecretTiles", 0.5, 0.05, false); //??? This works somehow?

	}
	
	if global.coopActive && place_meeting(x, y, obj_player_patter) && !place_meeting(x, y, obj_player_shadow_pitter) {
	
		//obj_player_patter.x += 3.5;
		//obj_player_patter.x += 5;
		//obj_player_patter.x = 192;
		obj_player_patter.x = 193;
	
	}

} else {

	if place_meeting(x, y, obj_player) {

		make_layer_transparent("SecretTiles", 0.0, 0.05);

	} else {

		//make_layer_transparent("SecretTiles", 1.0, 0.05, false);
		make_layer_transparent("SecretTiles", 0.5, 0.05, false); //??? This works somehow?

	}

}













targetLayerIDalpha = collidingWithPlayer ? 0.0 : 1.0;

//make_layer_transparent("SecretTiles", 0.0, 0.05);
//make_layer_transparent("SecretTiles", targetLayerIDalpha, 0.05);

//layer_background_alpha(targetLayerID, targetLayerIDalpha);
//layer_background_alpha(targetLayerID, 0);


//show_debug_message(collidingWithPlayer)


collidingWithPlayer = false;