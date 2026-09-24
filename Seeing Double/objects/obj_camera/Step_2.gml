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

cameraLeadAdjustSpeedX = global.coopActive ? 1.5 : 0.75;

if global.customLevel {

	pitterCameraOffsetY = 272;
	patterCameraOffsetY = 864; //864

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



if global.coopActive {
	
	if pitterPlayerIsPresent() {

		if obj_player_pitter.binocularsActive {
	
			var _binoculars = instance_nearest(obj_player_pitter.x, obj_player_pitter.y, obj_interactable_binoculars);
		
			pitterCameraLeadingX = pitterCameraLeadingXStoredValue;
			pitterCameraLeadingX = _binoculars.reverse ? pitterCameraLeadingX - _binoculars.cameraMoveAmount : pitterCameraLeadingX + _binoculars.cameraMoveAmount;
			
			pitterCameraLeadingY = pitterCameraLeadingYStoredValue;
			pitterCameraLeadingY = _binoculars.reverseVertical ? pitterCameraLeadingY - _binoculars.cameraMoveAmountVertical : pitterCameraLeadingY + _binoculars.cameraMoveAmountVertical;
	
		}

	}

	if patterPlayerIsPresent() {

		if obj_player_patter.binocularsActive {
	
			var _binoculars = instance_nearest(obj_player_patter.x, obj_player_patter.y, obj_interactable_binoculars);
		
			patterCameraLeadingX = patterCameraLeadingXStoredValue;
			patterCameraLeadingX = _binoculars.reverse ? patterCameraLeadingX - _binoculars.cameraMoveAmount : patterCameraLeadingX + _binoculars.cameraMoveAmount;
			
			patterCameraLeadingY = patterCameraLeadingYStoredValue;
			patterCameraLeadingY = _binoculars.reverseVertical ? patterCameraLeadingY - _binoculars.cameraMoveAmountVertical : patterCameraLeadingY + _binoculars.cameraMoveAmountVertical;
	
		}

	}

	coopCameraControls();

} else {
	
	if obj_player.binocularsActive {
	
		var _binoculars = instance_nearest(obj_player_pitter.x, obj_player_pitter.y, obj_interactable_binoculars);
	
		cameraLeadingX = cameraLeadingXStoredValue;
		cameraLeadingX = _binoculars.reverse ? cameraLeadingX - _binoculars.cameraMoveAmount : cameraLeadingX + _binoculars.cameraMoveAmount;
		
		cameraLeadingY = cameraLeadingYStoredValue;
		cameraLeadingY = _binoculars.reverseVertical ? cameraLeadingY - _binoculars.cameraMoveAmountVertical : cameraLeadingY + _binoculars.cameraMoveAmountVertical;
	
	}

	singlePlayerCameraControls();

}

// Update the shake intensity
// This slowly reduces the shake over the duration of the effect
shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

// Apply the shake to the camera position
// Replace 'view_camera[0]' with your actual camera index if different
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

camera_set_view_pos(view_camera[0], 
    _cam_x + random_range(-shake_remain, shake_remain), 
    _cam_y + random_range(-shake_remain, shake_remain)
);

var _cam_x2 = camera_get_view_x(view_camera[1]);
var _cam_y2 = camera_get_view_y(view_camera[1]);

camera_set_view_pos(view_camera[1], 
    _cam_x2 + random_range(-shake_remain, shake_remain), 
    _cam_y2 + random_range(-shake_remain, shake_remain)
);




/*
if(instance_exists(obj_cameraMover)) { //For camera movements during cutscenes, the camera follows obj_cameraMover (top left origin)

	var _x = clamp(obj_cameraMover.x, 0, room_width-view_width); 
	var _y = clamp(obj_cameraMover.y, 0, room_height-view_height);
	
	//var _x = clamp(obj_cameraMover.x-view_width/2, 0, room_width-view_width); //Clamp the x value so the view cant leave the room on the right
	//var _y = clamp(obj_cameraMover.y-view_height/2, 0, room_height-view_height);
	
	camera_set_view_pos(VIEW, _x, _y);

}
