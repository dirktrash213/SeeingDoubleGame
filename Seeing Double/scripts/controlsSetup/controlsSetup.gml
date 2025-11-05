function controlsSetup() {

	jumpBufferTime = 5;

	jumpKeyBuffered = 0;
	jumpKeyBufferTimer = 0;

	moveLeft = 0;
	moveRight = 0;
	moveUp = 0;
	moveUpPressed = 0;
	moveDown = 0;
	jump = 0;
	jumpPressed = 0;
	pause = 0;
	run = 0;

}


function getControls() {
	
	if global.playerControl && !global.paused && !global.cutsceneActive {

		moveLeft = keyboard_check(ord("A")) || gamepad_axis_value(global.controllerPort,gp_axislh) < 0;
		moveRight = keyboard_check(ord("D")) || gamepad_axis_value(global.controllerPort,gp_axislh) > 0;
		moveUp = keyboard_check(ord("W")) || gamepad_axis_value(global.controllerPort,gp_axislv) < 0;
		moveUpPressed = keyboard_check_pressed(ord("W")) || global.moveUp;
		moveDown = keyboard_check(ord("S")) || gamepad_axis_value(global.controllerPort,gp_axislv) > 0;
		jump = keyboard_check(vk_space) || gamepad_button_check(global.controllerPort, gp_face1);
		jumpPressed = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(global.controllerPort, gp_face1);
		pause = keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(global.controllerPort,gp_start);
		run = keyboard_check(vk_shift) || gamepad_button_check(global.controllerPort, gp_face3);

	}

	moveRight = clamp(moveRight, 0, 1);
	moveLeft = clamp(moveLeft, 0, 1);
	moveUp = clamp(moveUp, 0, 1);
	moveDown = clamp(moveDown, 0, 1);
	jumpPressed = clamp(jumpPressed, 0, 1);
	jump = clamp(jump, 0, 1);
	run = clamp(run, 0, 1);

	//Jump key buffering
	
	if jumpPressed && !jumpDisabled && !global.cutsceneActive {
	
		//show_debug_message("jump pressed")
		
		jumpKeyBufferTimer = jumpBufferTime;
	
	}

	if jumpKeyBufferTimer > 0 {
	
		jumpKeyBuffered = 1;
		jumpKeyBufferTimer--;
	
	} else {
	
		jumpKeyBuffered = 0;
	
	}









}