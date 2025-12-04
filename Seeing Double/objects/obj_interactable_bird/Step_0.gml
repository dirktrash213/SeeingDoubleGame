//if pitterPlayerIsPresent() && state != BIRD_STATE.FLYING {
//
//	var _distance = point_distance(x, y, obj_player.x, obj_player.y);
//
//	if (_distance <= detectionRadius) {
//    
//		state = BIRD_STATE.FLYING;
//		sprite_index = spr_interactable_bird_fly;
//		show_debug_message("fly away")
//		
//	} 
//
//}

//show_debug_message(state)


// 1. Check for Player
if (instance_exists(obj_player)) {

	//show_debug_message("Player exists")

    var _dist = point_distance(x, y, obj_player_pitter.x, obj_player_pitter.y);
    var _dist2 = point_distance(x, y, obj_player_patter.x, obj_player_patter.y);

	//show_debug_message(_dist2)
  
    if (_dist < detect_radius) || (_dist2 < detect_radius) && state != BIRD_STATE.FLYING {
        
		state = BIRD_STATE.FLYING;
		
		speed = 0;
		gravity = 0;
	  
        // 2. Determine direction AWAY from player
        // sign() returns 1 (right) or -1 (left)
        var _dir = sign(x - obj_player.x);
      
        // If strictly vertical alignment (0), pick random side
        if (_dir == 0) _dir = choose(1, -1);
      
        // Set initial horizontal speed
        hsp = _dir * fly_speed_h;
      
        // Set sprite to face direction
        image_xscale = -_dir; 
      
        // Optional: Change sprite to flying animation
        // sprite_index = spr_bird_fly;
    }
}

switch state {

	case BIRD_STATE.IDLE: {
	
		 if canHop {
			 
			 canHop = false;
			 alarm[0] = 0;
			 state = BIRD_STATE.HOPPING;
			 
			 speed = hopSpeed;
			 
			 
			 
			 direction = choose(hopDirectionRight, hopDirectionLeft);
			 
			 var _wallDetectionX = 16;
			 var _floorDetectionX = 25;
			 var _floorDetectionY = 5;
			 
			 if place_meeting(x + _wallDetectionX, y, obj_block_wall)
			 || (!place_meeting(x + _floorDetectionX, y + _floorDetectionY, obj_block_wall) && !place_meeting(x + _floorDetectionX, y + _floorDetectionY, obj_block_wall_semiSolid)) {
			 
				 direction = hopDirectionLeft;
			 
			 }
			 
			 if place_meeting(x - _wallDetectionX, y, obj_block_wall)
			 || (!place_meeting(x - _floorDetectionX, y + _floorDetectionY, obj_block_wall) && !place_meeting(x - _floorDetectionX, y + _floorDetectionY, obj_block_wall_semiSolid)) {
			 
				 direction = hopDirectionRight;
			 
			 }
			 
			 gravity = hopGravity;
			 
			 image_xscale = direction == hopDirectionRight ? -1 : 1;
			 
			 sprite_index = spr_interactable_bird_jump;
			 
		 }
	
	} break;
	
	case BIRD_STATE.HOPPING: {
	
		 if y > ystart {
			 
			y = ystart;
			state = BIRD_STATE.IDLE;
			sprite_index = spr_interactable_bird_idle;
			gravity = 0;
			speed = 0;
			
			var _r = random_range(-179, 60);
			alarm[0] = idleDuration + _r;
			
			var _r2 = random_range(-179, 60);
			alarm[1] = timeUntilHop + _r2;
		 
		 }
	
	} break;
	
	case BIRD_STATE.PECKING: {
	
		 sprite_index = spr_interactable_bird_peck;
		 
		 if isLastAnimationFrame() {
		 
			sprite_index = spr_interactable_bird_idle;
			state = BIRD_STATE.IDLE;
			
			var _r = random_range(-179, 60);
			
			alarm[0] = idleDuration + _r;
		 
		 }
	
	} break;
	
	case BIRD_STATE.FLYING: {
	
		 // --- THE CURVE LOGIC ---
    
		sprite_index = spr_interactable_bird_fly;
	
		//if playerIsPresent() {
		//
		//	var _nearestPlayer = instance_nearest(x, y, obj_player);
		//	
		//	if _nearestPlayer.x < x image_xscale = -1;
		//
		//}
	
	    // 1. Apply Horizontal Movement (Linear)
	    x += hsp;
    
	    // 2. Apply Vertical Acceleration (The Curve)
	    // We subtract from vsp because Y decreases as you go UP in GameMaker.
	    vsp -= fly_accel_v;
    
	    // Clamp the speed so it doesn't reach lightspeed
	    if (abs(vsp) > max_fly_speed_v) {
	        vsp = -max_fly_speed_v;
	    }
    
	    // Apply Vertical Movement
	    y += vsp;
    
		// Add a "Flap" wobble
		// This adds a small up/down motion on top of the main flight path
		//y += sin(current_time * 0.02) * 1.5;
	
	    // 3. Cleanup
	    // Destroy bird if it flies off screen to save memory
	    if (y < -50 || x < -50 || x > room_width + 50) {
	        instance_destroy();
	    }
	
	
	
	} break;


}

//if (state == BIRD_STATE.IDLE) {
//   
//}
//else if (state == BIRD_STATE.FLYING) {
//   
//}




