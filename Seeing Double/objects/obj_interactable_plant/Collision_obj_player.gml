if rustled exit;

if abs(other.xSpeed) >= other.moveSpeed[1] {

	rustled = true;

	alarm[0] = rustleCooldown;
	
	audio_play_sound(sfx_slice, 1, 0, 1, 0, random_range(9.0, 11.0));

	// Only trigger if we aren't already shaking violently
	// (This prevents the animation from resetting weirdly if you stand inside it)
	if (current_shake < 0.1) {
    
	    // 1. Set max shake
	   // current_shake = 1.0; 
	    current_shake = 0.05; 
    
	    // 2. Calculate Direction
	    // If player x is less than plant x, player is on the LEFT.
	    // Plant should bend RIGHT (positive).
	    if (other.x < x) {
	        hit_dir = 1.0; // Bend Right
	    } else {
	        hit_dir = -1.0; // Bend Left
	    }
		
	
	    // Optional: Reset timer so the sine wave starts at 0 (cleaner look)
	    timer = 0;
	}

	//show_debug_message("rustled")

}

/*

// Only trigger if we aren't already shaking violently
// (This prevents the animation from resetting weirdly if you stand inside it)
if (current_shake < 0.1) {
    
    // 1. Set max shake
    current_shake = 1.0; 
    
    // 2. Calculate Direction
    // If player x is less than plant x, player is on the LEFT.
    // Plant should bend RIGHT (positive).
    if (other.x < x) {
        hit_dir = 1.0; // Bend Right
    } else {
        hit_dir = -1.0; // Bend Left
    }
    
    // Optional: Reset timer so the sine wave starts at 0 (cleaner look)
    timer = 0;
}




