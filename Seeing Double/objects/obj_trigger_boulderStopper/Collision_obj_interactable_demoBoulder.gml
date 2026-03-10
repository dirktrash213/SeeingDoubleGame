if !obj_control.playerFallingWithBoulder exit;

obj_control.playerFallingWithBoulder = false;

obj_player.stuckOnBoulder = false;
//obj_player.y -= other.fallingSpeed;

obj_player_pitter.y -= other.fallingSpeed;
obj_player_patter.y -= other.fallingSpeed;

obj_player.ySpeed = -other.fallingSpeed;

//other.vspeed = 0;
//other.y = y + other.fallingSpeed;
other.y = y;

var _pitch = random_range(0.10, 0.20);
audio_play_sound(sfx_explosion, 1, 0, 1, 0, _pitch);

var _screenShakeMagnitude = 10; //10
var _screenShakeFrames = 20; //10

shakeScreen(_screenShakeMagnitude, _screenShakeFrames);







