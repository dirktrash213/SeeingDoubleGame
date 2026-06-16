instance_destroy(obj_interactable_labDoor);


audio_play_sound(sfx_explosion, 1, false, 1, 0, 1.0);
audio_play_sound(sfx_crazyImpact, 1, false, 1, 0, 1.0);
audio_play_sound(sfx_explosion_fire, 1, false, 1, 0, 1.5);

var _pitch = random_range(0.10, 0.20);
audio_play_sound(sfx_explosion, 1, 0, 1, 0, _pitch);

var _screenShakeMagnitude = 20; 
var _screenShakeFrames = 20; 

shakeScreen(_screenShakeMagnitude, _screenShakeFrames);