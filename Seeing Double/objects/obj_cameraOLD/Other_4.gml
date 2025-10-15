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

//Center camera on player
finalCamX = _camX;
finalCamY = _camY;