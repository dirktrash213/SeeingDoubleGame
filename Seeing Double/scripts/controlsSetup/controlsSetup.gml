function controlsSetup() {

	jumpBufferTime = 5;

	jumpKeyBuffered = 0;
	jumpKeyBufferTimer = 0;








}


function getControls() {
	
	if global.playerControl {

		moveLeft = keyboard_check(ord("A")) || gamepad_axis_value(global.controllerPort,gp_axislh) < 0;
		moveRight = keyboard_check(ord("D")) || gamepad_axis_value(global.controllerPort,gp_axislh) > 0;
		moveUp = keyboard_check(ord("W")) || gamepad_axis_value(global.controllerPort,gp_axislv) < 0;
		moveDown = keyboard_check(ord("S")) || gamepad_axis_value(global.controllerPort,gp_axislv) > 0;
		jump = keyboard_check(vk_space) || gamepad_button_check(global.controllerPort, gp_face1);
		jumpPressed = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(global.controllerPort, gp_face1);
		pause = keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(global.controllerPort,gp_start);
		run = keyboard_check(vk_shift) || gamepad_button_check(global.controllerPort, gp_face3);

	}

	moveRight = clamp(moveRight, 0, 1);
	moveLeft = clamp(moveLeft, 0, 1);
	jumpPressed = clamp(jumpPressed, 0, 1);
	jump = clamp(jump, 0, 1);
	run = clamp(run, 0, 1);

	//Jump key buffering
	
	if jumpPressed {
	
		jumpKeyBufferTimer = jumpBufferTime;
	
	}

	if jumpKeyBufferTimer > 0 {
	
		jumpKeyBuffered = 1;
		jumpKeyBufferTimer--;
	
	} else {
	
		jumpKeyBuffered = 0;
	
	}









}