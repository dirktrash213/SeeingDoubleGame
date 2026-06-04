if triggered exit;

triggered = true; 

//show_debug_message("Minecart has been triggered")

path_start(pth_minecart_track, 0, path_action_stop, false);

//travelSoundID = audio_play_sound(amb_elevator, 1, false);

image_speed = 1.0;

other.ridingMinecart = true;
//other.adjustingMinecartX = true;
other.currentMinecart = id;
other.jumpCount = 0;
other.faceDir = 1;
other.moveDir = 1;

other.groundPounding = false;
other.groundPoundRising = false;
other.groundPoundFalling = false;
other.vspeed = 0;
other.ySpeed = 0;
other.gravity = 0;
other.sprite_index = other.jumpSprite;

//var _offsetX = 5;
//var _offsetY = 2;
//
//other.x = x + _offsetX;
//other.y = y + _offsetY;






