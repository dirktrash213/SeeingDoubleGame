if triggered exit;

triggered = true; 

show_debug_message("Minecart has been triggered")

path_start(pth_minecart_track, 0, path_action_stop, false);

other.ridingMinecart = true;
other.currentMinecart = id;
other.jumpCount = 0;

var _offsetX = 5;
var _offsetY = 2;

other.x = x + _offsetX;
other.y = y + _offsetY;






