targetView = 0; //Decides which screen to draw to, overriden in creation code

coopObjectCreateEventCode();

timerDuration = 70;
durationBeforeLift = 60; //120

crusherFallSpeed = 5; 
crusherLiftSpeed = 5; 

crusherPathCrush = path_crusher_piston_crush;
crusherPathLift = path_crusher_piston_lift;


readyToCrush = true;


alarm[0] = timerDuration;

//crusherID = 0;