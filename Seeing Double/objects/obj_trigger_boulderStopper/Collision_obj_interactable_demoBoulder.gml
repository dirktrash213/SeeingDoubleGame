if !obj_control.playerFallingWithBoulder exit;

obj_control.playerFallingWithBoulder = false;

obj_player.stuckOnBoulder = false;
obj_player.y -= other.fallingSpeed;

obj_player.ySpeed = -other.fallingSpeed;

//other.vspeed = 0;
//other.y = y + other.fallingSpeed;
other.y = y;

var _screenShakeMagnitude = 10;
var _screenShakeFrames = 10;

shakeScreen(_screenShakeMagnitude, _screenShakeFrames);







