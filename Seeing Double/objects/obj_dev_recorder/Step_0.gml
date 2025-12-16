if !global.devTools exit;

// START RECORDING (Press Q)
if (keyboard_check_pressed(ord("Q"))) {
    recording = true;
    frames = []; // Clear old data
    show_debug_message("--- RECORDING STARTED ---");
}

// STOP AND SAVE (Press E)
if (keyboard_check_pressed(ord("E")) && recording) {
    recording = false;
    
    // Convert array to JSON string
    var _json_string = json_stringify(frames);
    
    // Save to a file
    var _buffer = buffer_create(string_byte_length(_json_string) + 1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, _json_string);
    buffer_save(_buffer, save_name);
    buffer_delete(_buffer);
    
    show_debug_message("--- SAVED TO: " + save_name + " ---");
}

// CAPTURE FRAME
if (recording && pitterPlayerIsPresent()) {
    // Create a struct for this single frame of data
    var _frame_data = {
        x: obj_player_pitter.x,
        y: obj_player_pitter.y,
        spr: obj_player_pitter.sprite_index,
        img: obj_player_pitter.image_index,
        scale: obj_player_pitter.image_xscale,
		faceDir: obj_player_pitter.faceDir
    };
    
    // Add to our list
    array_push(frames, _frame_data);
}

//if (recording && patterPlayerIsPresent()) {
//    // Create a struct for this single frame of data
//    var _frame_data = {
//        x: obj_player_patter.x,
//        y: obj_player_patter.y,
//        spr: obj_player_patter.sprite_index,
//        img: obj_player_patter.image_index,
//        scale: obj_player_patter.image_xscale,
//		faceDir: obj_player_patter.faceDir
//    };
//    
//    // Add to our list
//    array_push(frames, _frame_data);
//}


