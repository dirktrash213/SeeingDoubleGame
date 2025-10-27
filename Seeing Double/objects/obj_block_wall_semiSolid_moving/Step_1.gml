if global.paused exit;

//Move in a circle
dir += rotationSpeed;

//Get our target positions
var _targetX = xstart + lengthdir_x(radius, dir);
var _targetY = ystart + lengthdir_y(radius, dir);

//Get speeds
xSpeed = vertical ? 0 : _targetX - x;
//xSpeed = 0;
ySpeed = horizontal ? 0 : _targetY - y;
//ySpeed = 0;

//Move
x += xSpeed;
y += ySpeed;