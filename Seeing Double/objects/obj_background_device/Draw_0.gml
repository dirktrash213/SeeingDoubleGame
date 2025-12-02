draw_self();

if spawningSparks {

	// 1. Update the pulse timer
	pulseTimer += pulseSpeed;

	// 2. Calculate the blend amount (0 to 1)
	// The cos() function oscillates from -1 to 1.
	// We map it to the 0 to 1 range for the color lerp.
	var _blendAmount = (cos(pulseTimer) + 1) * 0.5;

	// 3. Calculate the blended color
	// lerp(startColor, endColor, amount)
	// As _blendAmount goes from 0 to 1, the color transitions from white to red.
	// As _blendAmount goes from 1 back to 0, the color transitions from red back to white.
	var _blendedColor = merge_colour(colorRed, colorWhite, _blendAmount);

	// 4. Apply the blended color to the object
	image_blend = _blendedColor;
	
	//show_debug_message(_blendedColor)
	//show_debug_message(colorRed)
	//show_debug_message("-------------")
	
	//if _blendedColor == colorRed audio_play_sound(sfx_blip, 1, 0, 1, 0, 0.2);

}

if firing {

	//draw_sprite_stretched(spr_background_pixel, 0, x, y, whiteBoxWidth, whiteBoxHeight);
	//draw_sprite_ext(spr_background_pixel, 0, x, y, 100, 1000, 0, c_white, 1.0);

}







