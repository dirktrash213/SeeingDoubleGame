image_alpha = global.assistMode ? 0.5 : 0.0;

if !loaded image_alpha = 0.0;

if global.paused exit;

if (loaded && array_length(frames) > 0) {
    // 1. Get data for current frame
    var _data = frames[current_frame];
    
    // 2. Apply to self
    x = _data.x;
    y = _data.y;
    sprite_index = _data.spr;
    image_index = _data.img;
    image_xscale = _data.scale * _data.faceDir;
	
	if sprite_index = spr_pitter_walk sprite_index = spr_pitter_walk_silent;
	if sprite_index = spr_pitter_run sprite_index = spr_pitter_run_silent;
	if sprite_index = spr_patter_walk sprite_index = spr_patter_walk_silent;
	if sprite_index = spr_patter_run sprite_index = spr_patter_run_silent;
	if sprite_index = spr_patter_climb sprite_index = spr_patter_climb_silent;
	
	sprite_index = spr_pitter_ball;
    
    // 3. Advance Frame
    current_frame++;
    
    // 4. Loop if finished
    if (current_frame >= array_length(frames)) {
        current_frame = 0;
    }
}