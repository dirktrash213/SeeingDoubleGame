// Initialize the global variable if it doesn't exist
// 0 = Keyboard & Mouse
// 1 = Gamepad
if (!variable_global_exists("input_source")) {
    global.input_source = 0; 
}

function input_check_source() {
    
    // --- 1. CHECK KEYBOARD & MOUSE ---
    // If any key is pressed or mouse moves/clicks
   // if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any) || (mouse_x != mouse_xprevious || mouse_y != mouse_yprevious)) {
    if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)) {
        global.input_source = 0;
        return; // Exit early to save processing
    }

    // --- 2. CHECK GAMEPAD ---
    // We loop through the first 4 gamepad slots (usually enough)
    for (var i = 0; i < 4; i++) {
        if (gamepad_is_connected(i)) {
            
			var _stickDriftThreshold = 0.2;
			
            // A. Check Axes (Sticks and Triggers)
            // We use a threshold (0.2) to ignore stick drift
            if (abs(gamepad_axis_value(i, gp_axislh)) > _stickDriftThreshold || 
                abs(gamepad_axis_value(i, gp_axislv)) > _stickDriftThreshold ||
                abs(gamepad_axis_value(i, gp_axisrh)) > _stickDriftThreshold || 
                abs(gamepad_axis_value(i, gp_axisrv)) > _stickDriftThreshold) {
                
                global.input_source = 1;
                break; // Stop looping
            }
            
            // B. Check Buttons
            // Unfortunately there is no "gp_any_button", so we check the most common ones.
            // You can add more if needed.
            if (gamepad_button_check_pressed(i, gp_face1) || // A / Cross
                gamepad_button_check_pressed(i, gp_face2) || // B / Circle
                gamepad_button_check_pressed(i, gp_face3) || // X / Square
                gamepad_button_check_pressed(i, gp_face4) || // Y / Triangle
                gamepad_button_check_pressed(i, gp_start) || 
                gamepad_button_check_pressed(i, gp_select) ||
                gamepad_button_check_pressed(i, gp_padu) ||
                gamepad_button_check_pressed(i, gp_padd) ||
                gamepad_button_check_pressed(i, gp_padl) ||
                gamepad_button_check_pressed(i, gp_padr) ||
                gamepad_button_check_pressed(i, gp_shoulderl) ||
                gamepad_button_check_pressed(i, gp_shoulderr)) {
                
                global.input_source = 1;
                break;
            }
        }
    }
}