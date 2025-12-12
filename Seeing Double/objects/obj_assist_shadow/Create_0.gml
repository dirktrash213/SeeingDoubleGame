// Visuals
image_alpha = 0.5;
//image_blend = c_black; // Make it a silhouette

// Playback variables
frames = [];
current_frame = 0;
loaded = false;

// Function to load a specific file
function load_recording(_filename) {
    if (file_exists(_filename)) {
        var _buffer = buffer_load(_filename);
        var _string = buffer_read(_buffer, buffer_string);
        buffer_delete(_buffer);
        
        frames = json_parse(_string);
        loaded = true;
    } else {
	
		loaded = false;
		show_debug_message("Could not find file: " + string(_filename))
	
	}
}

show_debug_message("Shadow assist created")