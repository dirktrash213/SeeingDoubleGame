if !triggered {
	
	bonked = false;
	
	exit;
	
}

if bonked && (visible || secret) {

	url_open("https://discord.gg/uUWAUBEfcu");

	visible = true;
	
	bonked = false;
	
	gravity = 0.5;
	vspeed = -3;
	
}

if y > ystart {
	
	y = ystart;
	gravity = 0;
	vspeed = 0;
	
}