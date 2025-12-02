if !active || global.paused exit;

if scr_isControllerConnected() {

	sprite_index = controllerSprite;

} else {

	sprite_index = keyboardSprite;

}

var _distance = point_distance(x, y, obj_player_pitter.x, obj_player_pitter.y);

	if (_distance <= detectionRadius) {
    
	    fadingIn = true;
		fadingOut = false;
		
		//show_debug_message("enemy is now active")
		
	} else {
	
		fadingIn = false;
		fadingOut = true;
	
	}

if fadingIn {

	image_alpha += fadeInRate;
	
	image_alpha = min(image_alpha, 1.0);

}

if fadingOut {

	image_alpha -= fadeOutRate;
	
	image_alpha = max(image_alpha, 0.0);

}

//Move in a circle
dir += rotationSpeed;

//Get our target positions
var _targetX = xstart + lengthdir_x(radius, dir);
var _targetY = ystart + lengthdir_y(radius, dir);

//Get speeds
xSpeed = vertical ? 0 : _targetX - x;
ySpeed = horizontal ? 0 : _targetY - y;

//Move
x += xSpeed;
y += ySpeed;



