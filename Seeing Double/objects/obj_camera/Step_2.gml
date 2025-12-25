//Camera moves in end step event since the player will move first in the step event
//Always position camera after all movement has been completed

#macro VIEW view_camera[0]
#macro VIEW2 view_camera[1]

//Set size of view
camera_set_view_size(VIEW, view_width, view_height); //If the camera has zooming effects, set that up here, before positioning the view
camera_set_view_size(VIEW2, view_width, view_height); //If the camera has zooming effects, set that up here, before positioning the view

//show_debug_message("global.cameraFreeze")
//show_debug_message(global.cameraFreeze)

//camera_set_view_size(view_camera[0], view_wport[0]/4, view_hport[0]/2);

if global.customLevel {

	pitterCameraOffsetY = 272;
	patterCameraOffsetY = 864; 

} else {

	pitterCameraOffsetY = 0;
	patterCameraOffsetY = 320; 

}

if global.splitScreenActive { //Halve viewport sizes if two exist

	camera_set_view_size(VIEW, view_width/2, view_height);
	camera_set_view_size(VIEW2, view_width/2, view_height);

} else {

	view_set_visible(1, false);

}



//Set position of view by centering it on the player  

var _cameraClampValue = 4;
var _cameraRoomBoundValue = global.splitScreenActive ? 2 : 1;
//@
if pitterPlayerIsPresent() {

	//if abs(xSpeed) >= moveSpeed[1]
	//var _cameraLeadingX = 0;
	
	var _runningMult = abs(obj_player_pitter.xSpeed) >= obj_player_pitter.moveSpeed[1] ? 3 : 1;
		
	if obj_player_pitter.moveDir == 1 {
		
		cameraLeadingX += cameraLeadAdjustSpeedX * _runningMult;
		cameraLeadingX = min(cameraLeadingX, cameraLeadingXmax)
		
	}
	
	if obj_player_pitter.moveDir == -1 {
		
		cameraLeadingX -= cameraLeadAdjustSpeedX * _runningMult;
		cameraLeadingX = max(cameraLeadingX, -cameraLeadingXmax)
		
	}
	
	if global.verticalLevel {
	
		if obj_player_pitter.crouching {
	
			verticalLevelOffsetY += verticalLevelOffsetYUpdateAmount;
			verticalLevelOffsetY = min(verticalLevelOffsetY, verticalLevelOffsetYMax)
	
		}
	
		if obj_player_pitter.lookingUp {
	
			verticalLevelOffsetY -= verticalLevelOffsetYUpdateAmount;
			verticalLevelOffsetY = max(verticalLevelOffsetY, verticalLevelOffsetYMin)
	
		}
	
	}
	
	if !global.verticalLevel {
	
		var _customMaxClampY = 273; 
	
		//Vars that center the camera on player
		var _x = clamp((obj_player_pitter.x-view_width/_cameraClampValue) + cameraLeadingX, 0, room_width-view_width/_cameraRoomBoundValue); //Clamp the x and y values so the view cant leave the room
		var _y = clamp(obj_player_pitter.y-view_height/_cameraClampValue, 0, room_height-view_height/_cameraRoomBoundValue);
		if global.customLevel _y = clamp(obj_player_pitter.y-view_height + 100, 0, _customMaxClampY);
	
	} else {
	
		//Vars that center the camera on player
		var _x = clamp((obj_player_pitter.x-view_width/_cameraClampValue) + cameraLeadingX, 0, 240); //Special values for vertical levels
		var _y = clamp((obj_player_pitter.y-view_height/_cameraClampValue) + verticalLevelOffsetY, 0, room_height-view_height);
	
	}

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
		//camera_set_view_pos(VIEW, _x, _y);
		
		if !global.verticalLevel {
		
			camera_set_view_pos(VIEW, _x, pitterCameraOffsetY); //TODO: change camera movement type depending on level type? Or find a way to draw bounds for the cameras
			if global.customLevel camera_set_view_pos(VIEW, _x, _y); 
	
		} else {
		
			camera_set_view_pos(VIEW, _x, _y);
			
		}
	
	}
	
	// Current app window size (your reference)
	var _windowWidth = 1920;
	var _windowHeight = 1080;
	
	// The current camera view size (480x270)
	var _camWidth = camera_get_view_width(VIEW);
	var _camHeight = camera_get_view_height(VIEW);
	
	//show_debug_message(_camWidth)
	
	// --- NEW VIEWPORT DIMENSIONS ---
	// New Viewport Width: Half the window width (960)
	var _newPortWidth = _windowWidth / 2; // 960
	// New Viewport Height: Full window height (1080)
	var _newPortHeight = _windowHeight; // 1080
	
	// --- NEW VIEWPORT POSITION (Left Side) ---
	var _newPortX = 0; // Starts at the far left
	var _newPortY = 0;
	
	// Set the new viewport size (960x1080)
	view_set_wport(0, _newPortWidth);
	view_set_hport(0, _newPortHeight);
	
	// Set the new viewport position (top-left corner of the window)
	view_set_xport(0, _newPortX);
	view_set_yport(0, _newPortY);
	
	
	
}

//@
if patterPlayerIsPresent() {

	if obj_player_patter.moveDir == 1 {
		
		cameraLeadingX += cameraLeadAdjustSpeedX;
		cameraLeadingX = min(cameraLeadingX, cameraLeadingXmax)
		
	}
	
	if obj_player_patter.moveDir == -1 {
		
		cameraLeadingX -= cameraLeadAdjustSpeedX;
		cameraLeadingX = max(cameraLeadingX, -cameraLeadingXmax)
		
	}
	
	if !global.verticalLevel {
	
		var _customMinClampY = 592; //591
	
		//Vars that center the camera on patter
		var _x = clamp(obj_player_patter.x-view_width/_cameraClampValue + cameraLeadingX, 0, room_width-view_width/_cameraRoomBoundValue); //Clamp the x and y values so the view cant leave the room
		var _y = clamp(obj_player_patter.y-view_height/_cameraClampValue, 0, room_height-view_height/_cameraRoomBoundValue);
		if global.customLevel _y = clamp(obj_player_patter.y-view_height + 100, _customMinClampY, room_height-view_height);
	
	} else {
	
		var _x = clamp(obj_player_patter.x-view_width/_cameraClampValue + cameraLeadingX, patterCameraOffsetX, room_width-view_width/_cameraRoomBoundValue); //Clamp the x and y values so the view cant leave the room
		var _y = clamp((obj_player_patter.y-view_height/_cameraClampValue) + verticalLevelOffsetY, 0, room_height-view_height/_cameraRoomBoundValue*2);
	
	}


	//Camera smoothing
	
	//Get view's current position
	var _cur_x = camera_get_view_x(VIEW2);
	var _cur_y = camera_get_view_y(VIEW2);
	
	//How fast will our camera follow?
	var _spd = 0.5; //0.1
	
	if freeze { //Camera does not follow player if this variable is triggered during cutscenes
	
		//camera_set_view_pos(view, lerp(_cur_x, _x, _spd), lerp(_cur_y, _y, _spd));
		//camera_set_view_pos(VIEW, _cur_x,_cur_y);
	
	} else { //Otherwise camera follows player
	
		//camera_set_view_pos(view, lerp(_cur_x, _x, _spd), lerp(_cur_y, _y, _spd));
		//camera_set_view_pos(VIEW, _x, _y);
		if !global.verticalLevel {
			
		camera_set_view_pos(VIEW2, _x, patterCameraOffsetY); 
		if global.customLevel camera_set_view_pos(VIEW2, _x, _y); 
		
		} else {
		
			camera_set_view_pos(VIEW2, _x, _y);
			
		}
	
	
	}
	
	var _windowWidth = 1920;
	var _windowHeight = 1080;

	var _camWidth = camera_get_view_width(VIEW2);
	var _camHeight = camera_get_view_height(VIEW2);
	
	// --- NEW VIEWPORT DIMENSIONS ---
	// New Viewport Width: Half the window width (960)
	var _newPortWidth = _windowWidth / 2; // 960
	// New Viewport Height: Full window height (1080)
	var _newPortHeight = _windowHeight; // 1080
	
	// --- NEW VIEWPORT POSITION (Right Side) ---
	var _newPortX = 960; // Starts at the right
	//_newPortY = 305;
	var _newPortY = 0;
	
	// Set the new viewport size (960x1080)
	view_set_wport(1, _newPortWidth);
	view_set_hport(1, _newPortHeight);
	
	// Set the new viewport position (top-left corner of the window)
	view_set_xport(1, _newPortX);
	view_set_yport(1, _newPortY);










}

/*
if(instance_exists(obj_cameraMover)) { //For camera movements during cutscenes, the camera follows obj_cameraMover (top left origin)

	var _x = clamp(obj_cameraMover.x, 0, room_width-view_width); 
	var _y = clamp(obj_cameraMover.y, 0, room_height-view_height);
	
	//var _x = clamp(obj_cameraMover.x-view_width/2, 0, room_width-view_width); //Clamp the x value so the view cant leave the room on the right
	//var _y = clamp(obj_cameraMover.y-view_height/2, 0, room_height-view_height);
	
	camera_set_view_pos(VIEW, _x, _y);

}
