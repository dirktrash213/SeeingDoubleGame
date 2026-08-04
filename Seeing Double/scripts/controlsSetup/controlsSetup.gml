function controlsSetup() {

	jumpBufferTime = 5;

	jumpKeyBuffered = 0;
	jumpKeyBufferTimer = 0;

	moveLeft = 0;
	moveLeftPressed = 0;
	moveRight = 0;
	moveRightPressed = 0;
	moveUp = 0;
	moveUpPressed = 0;
	moveDown = 0;
	moveDownPressed = 0;
	jump = 0;
	jumpPressed = 0;
	pause = 0;
	run = 0;
	runPressed = 0;

}

//TODO: make controller deadzones adjustable?

function getControls() {
    if (global.coopActive && object_index == obj_player_patter) exit;
    
    if (global.playerControl && !global.paused && !global.cutsceneActive) {
        var _dev = global.pitterDevice;
        
        // Decide input sources
        // If _dev is -2 (Single Player), allow both Keyboard AND Gamepad
        var _useKeyboard = (_dev == -1 || _dev == -2);
        
        // Find pad index: use assigned device if set, or auto-detect first connected pad in SP
        var _gpIndex = _dev;
        if (_dev == -2) {
            _gpIndex = -1;
            for (var i = 0; i < 12; i++) {
                if (gamepad_is_connected(i)) { _gpIndex = i; break; }
            }
        }
        var _useGamepad = (_gpIndex >= 0);
        
        // --- KEYBOARD INPUTS ---
        var _kbLeft  = _useKeyboard && keyboard_check(ord("A"));
        var _kbRight = _useKeyboard && keyboard_check(ord("D"));
        var _kbUp    = _useKeyboard && keyboard_check(ord("W"));
        var _kbDown  = _useKeyboard && keyboard_check(ord("S"));
        var _kbJump  = _useKeyboard && keyboard_check(vk_space);
        var _kbJumpP = _useKeyboard && keyboard_check_pressed(vk_space);
        var _kbPause = _useKeyboard && keyboard_check_pressed(vk_escape);
        var _kbRun   = _useKeyboard && keyboard_check(vk_shift);
        var _kbRunP  = _useKeyboard && keyboard_check_pressed(vk_shift);
        
        // --- GAMEPAD INPUTS ---
        var _gpLeft  = _useGamepad && (gamepad_axis_value(_gpIndex, gp_axislh) < -0.5 || gamepad_button_check(_gpIndex, gp_padl));
        var _gpRight = _useGamepad && (gamepad_axis_value(_gpIndex, gp_axislh) > 0.5  || gamepad_button_check(_gpIndex, gp_padr));
        var _gpUp    = _useGamepad && (gamepad_axis_value(_gpIndex, gp_axislv) < -0.3 || gamepad_button_check(_gpIndex, gp_padu));
        var _gpDown  = _useGamepad && (gamepad_axis_value(_gpIndex, gp_axislv) > 0.3  || gamepad_button_check(_gpIndex, gp_padd));
        var _gpJump  = _useGamepad && gamepad_button_check(_gpIndex, gp_face1);
        var _gpJumpP = _useGamepad && gamepad_button_check_pressed(_gpIndex, gp_face1);
        var _gpPause = _useGamepad && gamepad_button_check_pressed(_gpIndex, gp_start);
        var _gpRun   = _useGamepad && gamepad_button_check(_gpIndex, gp_face3);
        var _gpRunP  = _useGamepad && gamepad_button_check_pressed(_gpIndex, gp_face3);
        
        // --- COMBINE INPUTS ---
        moveLeft    = _kbLeft || _gpLeft;
        moveRight   = _kbRight || _gpRight;
        moveUp      = _kbUp || _gpUp;
        moveDown    = _kbDown || _gpDown;
        jump        = _kbJump || _gpJump;
        jumpPressed = _kbJumpP || _gpJumpP;
        pause       = _kbPause || _gpPause;
        run         = _kbRun || _gpRun;
        runPressed  = _kbRunP || _gpRunP;
    }

    // Clamp values
    moveRight   = clamp(moveRight, 0, 1);
    moveLeft    = clamp(moveLeft, 0, 1);
    moveUp      = clamp(moveUp, 0, 1);
    moveDown    = clamp(moveDown, 0, 1);
    jumpPressed = clamp(jumpPressed, 0, 1);
    jump        = clamp(jump, 0, 1);
    run         = clamp(run, 0, 1);
    runPressed  = clamp(runPressed, 0, 1);

    // Jump key buffering logic
    if (jumpPressed && !jumpDisabled && !global.cutsceneActive) {
        jumpKeyBufferTimer = jumpBufferTime;
    }

    if (jumpKeyBufferTimer > 0) {
        jumpKeyBuffered = 1;
        jumpKeyBufferTimer--;
    } else {
        jumpKeyBuffered = 0;
    }
}

//function getControls() {
//    if (global.coopActive && object_index == obj_player_patter) exit;
//    
//    if (global.playerControl && !global.paused && !global.cutsceneActive) {
//        var _dev = global.pitterDevice;
//		
//		show_debug_message("global.pitterDevice: " + string(global.pitterDevice))
//        
//        // Check keyboard input if assigned to keyboard (-1)
//        var _kbLeft  = (_dev == -1) && keyboard_check(ord("A"));
//        var _kbRight = (_dev == -1) && keyboard_check(ord("D"));
//        var _kbUp    = (_dev == -1) && keyboard_check(ord("W"));
//        var _kbDown  = (_dev == -1) && keyboard_check(ord("S"));
//        var _kbJump  = (_dev == -1) && keyboard_check(vk_space);
//        var _kbJumpP = (_dev == -1) && keyboard_check_pressed(vk_space);
//        var _kbPause = (_dev == -1) && keyboard_check_pressed(vk_escape);
//        var _kbRun   = (_dev == -1) && keyboard_check(vk_shift);
//        var _kbRunP  = (_dev == -1) && keyboard_check_pressed(vk_shift);
//        
//        // Check gamepad input if assigned to a gamepad (>= 0)
//        var _gpLeft  = (_dev >= 0) && (gamepad_axis_value(_dev, gp_axislh) < -0.5 || gamepad_button_check(_dev, gp_padl));
//        var _gpRight = (_dev >= 0) && (gamepad_axis_value(_dev, gp_axislh) > 0.5  || gamepad_button_check(_dev, gp_padr));
//        var _gpUp    = (_dev >= 0) && (gamepad_axis_value(_dev, gp_axislv) < -0.3 || gamepad_button_check(_dev, gp_padu));
//        var _gpDown  = (_dev >= 0) && (gamepad_axis_value(_dev, gp_axislv) > 0.3  || gamepad_button_check(_dev, gp_padd));
//        var _gpJump  = (_dev >= 0) && gamepad_button_check(_dev, gp_face1);
//        var _gpJumpP = (_dev >= 0) && gamepad_button_check_pressed(_dev, gp_face1);
//        var _gpPause = (_dev >= 0) && gamepad_button_check_pressed(_dev, gp_start);
//        var _gpRun   = (_dev >= 0) && gamepad_button_check(_dev, gp_face3);
//        var _gpRunP  = (_dev >= 0) && gamepad_button_check_pressed(_dev, gp_face3);
//        
//        // Combine inputs
//        moveLeft  = _kbLeft || _gpLeft;
//        moveRight = _kbRight || _gpRight;
//        moveUp    = _kbUp || _gpUp;
//        moveDown  = _kbDown || _gpDown;
//        jump      = _kbJump || _gpJump;
//        jumpPressed = _kbJumpP || _gpJumpP;
//        pause     = _kbPause || _gpPause;
//        run       = _kbRun || _gpRun;
//        runPressed = _kbRunP || _gpRunP;
//    }
//
//    // Clamp values
//    moveRight = clamp(moveRight, 0, 1);
//    moveLeft  = clamp(moveLeft, 0, 1);
//    moveUp    = clamp(moveUp, 0, 1);
//    moveDown  = clamp(moveDown, 0, 1);
//    jumpPressed = clamp(jumpPressed, 0, 1);
//    jump      = clamp(jump, 0, 1);
//    run       = clamp(run, 0, 1);
//    runPressed = clamp(runPressed, 0, 1);
//
//    // Jump key buffering logic
//    if (jumpPressed && !jumpDisabled && !global.cutsceneActive) {
//        jumpKeyBufferTimer = jumpBufferTime;
//    }
//
//    if (jumpKeyBufferTimer > 0) {
//        jumpKeyBuffered = 1;
//        jumpKeyBufferTimer--;
//    } else {
//        jumpKeyBuffered = 0;
//    }
//}

function getControlsPlayer2() {
    if (!global.coopActive || object_index == obj_player_pitter) exit;
    
    if (global.playerControl && !global.paused && !global.cutsceneActive) {
        var _dev = global.patterDevice;

        // Player 2 local Keyboard fallbacks (Arrow Keys)
        var _kbLeft  = (_dev == -1) && keyboard_check(vk_left);
        var _kbRight = (_dev == -1) && keyboard_check(vk_right);
        var _kbUp    = (_dev == -1) && keyboard_check(vk_up);
        var _kbDown  = (_dev == -1) && keyboard_check(vk_down);
        var _kbJump  = (_dev == -1) && keyboard_check(ord("P"));
        var _kbJumpP = (_dev == -1) && keyboard_check_pressed(ord("P"));
        var _kbPause = (_dev == -1) && keyboard_check_pressed(vk_alt);
        var _kbRun   = (_dev == -1) && keyboard_check(ord("O"));
        var _kbRunP  = (_dev == -1) && keyboard_check_pressed(ord("O"));

        // Player 2 Gamepad inputs (Targeting Patter's assigned device)
        var _gpLeft  = (_dev >= 0) && (gamepad_axis_value(_dev, gp_axislh) < -0.5 || gamepad_button_check(_dev, gp_padl));
        var _gpRight = (_dev >= 0) && (gamepad_axis_value(_dev, gp_axislh) > 0.5  || gamepad_button_check(_dev, gp_padr));
        var _gpUp    = (_dev >= 0) && (gamepad_axis_value(_dev, gp_axislv) < -0.3 || gamepad_button_check(_dev, gp_padu));
        var _gpDown  = (_dev >= 0) && (gamepad_axis_value(_dev, gp_axislv) > 0.3  || gamepad_button_check(_dev, gp_padd));
        var _gpJump  = (_dev >= 0) && gamepad_button_check(_dev, gp_face1);
        var _gpJumpP = (_dev >= 0) && gamepad_button_check_pressed(_dev, gp_face1);
        var _gpPause = (_dev >= 0) && gamepad_button_check_pressed(_dev, gp_start);
        var _gpRun   = (_dev >= 0) && gamepad_button_check(_dev, gp_face3);
        var _gpRunP  = (_dev >= 0) && gamepad_button_check_pressed(_dev, gp_face3);

        moveLeft  = _kbLeft || _gpLeft;
        moveRight = _kbRight || _gpRight;
        moveUp    = _kbUp || _gpUp;
        moveDown  = _kbDown || _gpDown;
        jump      = _kbJump || _gpJump;
        jumpPressed = _kbJumpP || _gpJumpP;
        pause     = _kbPause || _gpPause;
        run       = _kbRun || _gpRun;
        runPressed = _kbRunP || _gpRunP;
    }

    // Clamp values
    moveRight = clamp(moveRight, 0, 1);
    moveLeft  = clamp(moveLeft, 0, 1);
    moveUp    = clamp(moveUp, 0, 1);
    moveDown  = clamp(moveDown, 0, 1);
    jumpPressed = clamp(jumpPressed, 0, 1);
    jump      = clamp(jump, 0, 1);
    run       = clamp(run, 0, 1);
    runPressed = clamp(runPressed, 0, 1);

    // Jump key buffering logic
    if (jumpPressed && !jumpDisabled && !global.cutsceneActive) {
        jumpKeyBufferTimer = jumpBufferTime;
    }

    if (jumpKeyBufferTimer > 0) {
        jumpKeyBuffered = 1;
        jumpKeyBufferTimer--;
    } else {
        jumpKeyBuffered = 0;
    }
}

/*


function getControls() {
	
	if global.coopActive && object_index == obj_player_patter exit;
	
	if global.playerControl && !global.paused && !global.cutsceneActive {

		moveLeft = keyboard_check(ord("A")) || gamepad_axis_value(global.controllerPort,gp_axislh) < -0.5;
		moveLeftPressed = keyboard_check_pressed(ord("A")) || global.moveLeft;
		moveRight = keyboard_check(ord("D")) || gamepad_axis_value(global.controllerPort,gp_axislh) > 0.5;
		moveRightPressed = keyboard_check_pressed(ord("D")) || global.moveRight;
		moveUp = keyboard_check(ord("W")) || gamepad_axis_value(global.controllerPort,gp_axislv) < -0.3; //-0.95   0.5
		moveUpPressed = keyboard_check_pressed(ord("W")) || global.moveUp;
		moveDown = keyboard_check(ord("S")) || gamepad_axis_value(global.controllerPort,gp_axislv) > 0.3; //0.95   0.5
		moveDownPressed = keyboard_check_pressed(ord("S")) || global.moveDown;
		jump = keyboard_check(vk_space) || gamepad_button_check(global.controllerPort, gp_face1);
		jumpPressed = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(global.controllerPort, gp_face1);
		pause = keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(global.controllerPort,gp_start);
		run = keyboard_check(vk_shift) || gamepad_button_check(global.controllerPort, gp_face3);
		runPressed = keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(global.controllerPort, gp_face3);

	}

	moveRight = clamp(moveRight, 0, 1);
	moveRightPressed = clamp(moveRightPressed, 0, 1);
	moveLeft = clamp(moveLeft, 0, 1);
	moveLeftPressed = clamp(moveLeftPressed, 0, 1);
	moveUp = clamp(moveUp, 0, 1);
	moveUpPressed = clamp(moveUpPressed, 0, 1);
	moveDown = clamp(moveDown, 0, 1);
	moveDownPressed = clamp(moveDownPressed, 0, 1);
	jumpPressed = clamp(jumpPressed, 0, 1);
	jump = clamp(jump, 0, 1);
	run = clamp(run, 0, 1);
	runPressed = clamp(runPressed, 0, 1);

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

function getControlsPlayer2() {
	
	if !global.coopActive || object_index == obj_player_pitter exit;
	
	if global.playerControl && !global.paused && !global.cutsceneActive {

		moveLeft = keyboard_check(vk_left) || gamepad_axis_value(global.controllerPort,gp_axislh) < -0.5;
		moveLeftPressed = keyboard_check_pressed(vk_left) || global.moveLeft;
		moveRight = keyboard_check(vk_right) || gamepad_axis_value(global.controllerPort,gp_axislh) > 0.5;
		moveRightPressed = keyboard_check_pressed(vk_right) || global.moveRight;
		moveUp = keyboard_check(vk_up) || gamepad_axis_value(global.controllerPort,gp_axislv) < -0.3; //-0.95   0.5
		moveUpPressed = keyboard_check_pressed(vk_up) || global.moveUp;
		moveDown = keyboard_check(vk_down) || gamepad_axis_value(global.controllerPort,gp_axislv) > 0.3; //0.95   0.5
		moveDownPressed = keyboard_check_pressed(vk_down) || global.moveDown;
		jump = keyboard_check(ord("P")) || gamepad_button_check(global.controllerPort, gp_face1);
		jumpPressed = keyboard_check_pressed(ord("P")) || gamepad_button_check_pressed(global.controllerPort, gp_face1);
		pause = keyboard_check_pressed(vk_alt) || gamepad_button_check_pressed(global.controllerPort,gp_start);
		run = keyboard_check(ord("O")) || gamepad_button_check(global.controllerPort, gp_face3);
		runPressed = keyboard_check_pressed(ord("O")) || gamepad_button_check_pressed(global.controllerPort, gp_face3);

	}

	moveRight = clamp(moveRight, 0, 1);
	moveRightPressed = clamp(moveRightPressed, 0, 1);
	moveLeft = clamp(moveLeft, 0, 1);
	moveLeftPressed = clamp(moveLeftPressed, 0, 1);
	moveUp = clamp(moveUp, 0, 1);
	moveUpPressed = clamp(moveUpPressed, 0, 1);
	moveDown = clamp(moveDown, 0, 1);
	moveDownPressed = clamp(moveDownPressed, 0, 1);
	jumpPressed = clamp(jumpPressed, 0, 1);
	jump = clamp(jump, 0, 1);
	run = clamp(run, 0, 1);
	runPressed = clamp(runPressed, 0, 1);

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