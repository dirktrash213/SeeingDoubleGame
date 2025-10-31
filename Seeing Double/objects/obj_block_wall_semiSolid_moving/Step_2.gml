if onRails {

	// 1. Calculate the speeds
	// Speed is the change in position over the last step (one frame).
	xSpeed = x - previousX;
	ySpeed = y - previousY;

	// 2. Update the previous position for the next frame's calculation
	previousX = x;
	previousY = y;

}