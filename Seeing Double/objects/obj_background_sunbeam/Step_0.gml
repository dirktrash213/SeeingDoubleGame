// Increase the timer
timer += fade_speed;

/* sin(timer) returns -1 to 1.
   We multiply by alpha_range to set the intensity.
   Then we add it to the base_alpha.
*/
image_alpha = base_alpha + (sin(timer) * alpha_range);