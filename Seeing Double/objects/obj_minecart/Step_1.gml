/*if !triggered exit;

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
path_speed = cart_speed;



image_angle = direction;

if image_angle > 90 && image_angle < 270 image_angle += 180; //Keeps the minecart sprite upright



if path_position == 1.0 {



}