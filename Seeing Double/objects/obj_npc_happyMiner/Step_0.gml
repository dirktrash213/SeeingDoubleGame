//Apply gravity
ySpeed += grav;


//Cap falling speed
if ySpeed > termVelocity ySpeed = termVelocity;

y += ySpeed;