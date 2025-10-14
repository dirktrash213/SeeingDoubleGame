

// Get and assign a controller port for a connected controller
var gp_num = gamepad_get_device_count();

for (var i = 0; i < gp_num; i++;) {
	   
	if gamepad_is_connected(i) global.controllerPort = i;
	   
}

/*
//Handle moving in menus with the analog stick 

if !global.hasMovedUp && gamepad_axis_value(global.controllerPort,gp_axislv) < 0 {
	
	global.moveUp = true;
	global.hasMovedUp = true;
	
}

if global.hasMovedUp && gamepad_axis_value(global.controllerPort,gp_axislv) == 0 {

	global.hasMovedUp = false;

}

if !global.hasMovedDown && gamepad_axis_value(global.controllerPort,gp_axislv) > 0 {
	
	global.moveDown = true;
	global.hasMovedDown = true;
	
}

if global.hasMovedDown && gamepad_axis_value(global.controllerPort,gp_axislv) == 0 {

	global.hasMovedDown = false;

}

if !global.hasMovedLeft && gamepad_axis_value(global.controllerPort,gp_axislh) < 0 {
	
	global.moveLeft = true;
	global.hasMovedLeft = true;
	
}

if global.hasMovedLeft && gamepad_axis_value(global.controllerPort,gp_axislh) == 0 {

	global.hasMovedLeft = false;

}

if !global.hasMovedRight && gamepad_axis_value(global.controllerPort,gp_axislh) > 0 {
	
	global.moveRight = true;
	global.hasMovedRight = true;
	
}

if global.hasMovedRight && gamepad_axis_value(global.controllerPort,gp_axislh) == 0 {

	global.hasMovedRight = false;

} */

/*

global.moveLeft = keyboard_check(ord("A")) || gamepad_axis_value(global.controllerPort,gp_axislh) < 0;
global.moveRight = keyboard_check(ord("D")) || gamepad_axis_value(global.controllerPort,gp_axislh) > 0;
global.moveUp = keyboard_check(ord("W")) || gamepad_axis_value(global.controllerPort,gp_axislv) < 0;
global.moveDown = keyboard_check(ord("S")) || gamepad_axis_value(global.controllerPort,gp_axislv) > 0;
global.jump = keyboard_check(vk_space) || gamepad_button_check(global.controllerPort, gp_face1);
global.jumpPressed = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(global.controllerPort, gp_face1);
global.pause = keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(global.controllerPort,gp_start);





global.moveRight = clamp(global.moveRight, 0, 1);
global.moveLeft = clamp(global.moveLeft, 0, 1);
global.jumpPressed = clamp(global.jumpPressed, 0, 1);
global.jump = clamp(global.jump, 0, 1);



//show_debug_message(global.moveLeft)
