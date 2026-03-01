visible = false;

xSpeed = 0;
ySpeed = 0;

bonked = false;
secret = false;

inert = false;

typist = scribble_typist();
typist.in(0.9, 0.9);
typist.sound(sfx_footstep, false, 1.5, 1.7); 
textDisplayDuration = 240;
wrapAmount = 75;


triggered = false;