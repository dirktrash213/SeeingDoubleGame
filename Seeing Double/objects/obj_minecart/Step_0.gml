if !triggered exit;

var _id = id;
depth = 100;

// 1. Find the current height and the height slightly ahead on the path
var curr_y = path_get_y(pth_minecart_track, path_position);
var next_pos = path_position + 0.01; // Look 1% ahead on the path
var next_y = path_get_y(pth_minecart_track, next_pos);

// 2. Calculate the "slope" (Difference in Y)
// If next_y > curr_y, the cart is going DOWN (accelerate)
// If next_y < curr_y, the cart is going UP (decelerate)
var slope = next_y - curr_y;

// 3. Apply gravity based on the slope
cart_speed += slope * gravity_power;

// 4. Apply basic friction and clamp speed
cart_speed -= sign(cart_speed) * friction_power;
cart_speed = clamp(cart_speed, min_speed, max_speed);

// 5. Update the path movement
// path_speed is pixels per step; we convert our speed to the path's movement
path_speed = global.paused ? 0 : cart_speed;

// 6. Sync animation to speed
// We divide current speed by a "reference speed" to get a multiplier.
// Using abs() ensures the wheels turn even if cart_speed is negative.
var _reference_speed = max_speed; 

if path_speed != 0 {
	
	var _anim_multiplier = 1.5; // Crank this up to make wheels spin faster overall
	image_speed = (abs(cart_speed) / max_speed) * _anim_multiplier;

} else {
	
    image_speed = 0;
	
}


image_angle = direction;

if image_angle > 90 && image_angle < 270 image_angle += 180; //Keeps the minecart sprite upright

//show_debug_message("image_angle: " + string(image_angle))
//show_debug_message("direction: " + string(direction))
//show_debug_message("----------------")

if path_position == 1.0 {

	image_speed = 0;
	
	if travelSoundID != noone audio_stop_sound(travelSoundID);

	with obj_player {
		
		if currentMinecart == _id {
	
			ridingMinecart = false;
			//adjustingMinecartX = false;
			currentMinecart = noone;
			
			sprite_set_offset(spr_pitter_jump, 8, 16); 
			sprite_set_offset(spr_patter_jump, 8, 16);
			
			sprite_set_offset(spr_pitter_scared_jump, 8, 16); 
			sprite_set_offset(spr_patter_scared_jump, 8, 16);

		}

	}
		
}

if path_position == 0 image_speed = 0;