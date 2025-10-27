image_alpha = 0.0

fadeInRate = 0.05;
fadeOutRate = 0.05;

fadingIn = false;
fadingOut = false;

xScale = 1000;
yScale = 1000;



typist = scribble_typist();
typist2 = scribble_typist();

var _typeSpeed = 0.05
var _fadeInSpeed = 0.9

typist.in(_typeSpeed, _fadeInSpeed);
//typist.sound(sfx_footstep, false, 1, 1); 

typist2.in(_typeSpeed, _fadeInSpeed);
//typist2.sound(sfx_footstep, false, 1, 1); 

seeingTextOffsetX = 0;
seeingTextOffsetY = 0;
doubleTextOffsetX = 0;
doubleTextOffsetY = 0;

textOccilating = true;
textAlpha = 1.0;
//textAlpha = "[alpha,<value>]";

dir = 0;
//rotationSpeed = 360/180;
rotationSpeed = 360/360;
radius = 0;
radiusMax = 1;
radiusIncreaseAmount = 0.01;

