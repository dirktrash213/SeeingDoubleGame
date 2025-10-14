//Fullscreen toggle
if keyboard_check_pressed(vk_f8) {
	
	window_set_fullscreen(!window_get_fullscreen());
	
}

if !playerIsPresent() exit;

//Get camera properties from viewport 0
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

//Center camera on player
var _camX = obj_player_pitter.x - _camWidth/2;
var _camY = obj_player_pitter.y - _camHeight/2;

//Clamp cam to room borders
_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

//Set cam coordinate variables (for smoother cam movement up slopes and stuff)
finalCamX += (_camX - finalCamX) * camTrailSpeed;
finalCamY += (_camY - finalCamY) * camTrailSpeed;



//Set camera coordinates
camera_set_view_pos(view_camera[0], finalCamX, finalCamY);



