//Camera moves in end step event since the player will move first in the step event
//Always position camera after all movement has been completed

#macro VIEW view_camera[0]

//Set size of view
camera_set_view_size(VIEW, view_width, view_height); //If the camera has zooming effects, set that up here, before positioning the view

//show_debug_message("global.cameraFreeze")
//show_debug_message(global.cameraFreeze)

//Set position of view by centering it on the player  



if(instance_exists(obj_player)) {

	//Vars that center the camera on player
	var _x = clamp(obj_player.x-view_width/2, 0, room_width-view_width); //Clamp the x and y values so the view cant leave the room
	var _y = clamp(obj_player.y-view_height/2, 0, room_height-view_height);
	

	//Camera smoothing
	
	//Get view's current position
	var _cur_x = camera_get_view_x(VIEW);
	var _cur_y = camera_get_view_y(VIEW);
	
	//How fast will our camera follow?
	var _spd = 0.5; //0.1
	
	if freeze { //Camera does not follow player if this variable is triggered during cutscenes
	
		//camera_set_view_pos(view, lerp(_cur_x, _x, _spd), lerp(_cur_y, _y, _spd));
		//camera_set_view_pos(VIEW, _cur_x,_cur_y);
	
	} else { //Otherwise camera follows player
	
		//camera_set_view_pos(view, lerp(_cur_x, _x, _spd), lerp(_cur_y, _y, _spd));
		camera_set_view_pos(VIEW, _x, _y);
	
	}
	
}
/*
if(instance_exists(obj_cameraMover)) { //For camera movements during cutscenes, the camera follows obj_cameraMover (top left origin)

	var _x = clamp(obj_cameraMover.x, 0, room_width-view_width); 
	var _y = clamp(obj_cameraMover.y, 0, room_height-view_height);
	
	//var _x = clamp(obj_cameraMover.x-view_width/2, 0, room_width-view_width); //Clamp the x value so the view cant leave the room on the right
	//var _y = clamp(obj_cameraMover.y-view_height/2, 0, room_height-view_height);
	
	camera_set_view_pos(VIEW, _x, _y);

}
