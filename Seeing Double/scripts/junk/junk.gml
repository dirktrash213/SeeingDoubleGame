/*

/*

function coopObjectBlockDrawCode() {

	if !global.coopActive exit;

	isOnPitterScreen = y < global.patterOffsetY;
	if global.customLevel isOnPitterScreen = y < global.defaultCustomLevelPatterOffsetY;
	if global.verticalLevel isOnPitterScreen = x < global.patterOffsetX;
	blendColor = isOnPitterScreen ? patterColor : pitterColor;

	// 1. Get the Tilemap ID for your "LevelTiles" layer
	var _layerID = layer_get_id("LevelTiles");
	var _tilemapID = layer_tilemap_get_id(_layerID);

	// 2. Extract the actual Tileset Asset pointer needed for draw_tile()
	var _tilesetID = tilemap_get_tileset(_tilemapID);

	// 3. Define the sample offset and your tile size (16x16)
	var _xOffset = 0;
	var _yOffset = 0;

	if global.verticalLevel {

		_xOffset = isOnPitterScreen ? global.patterOffsetX : -global.patterOffsetX;

	} else {

		if global.customLevel {
	
			_yOffset = isOnPitterScreen ? global.defaultCustomLevelPatterOffsetY : -global.defaultCustomLevelPatterOffsetY;
	
		} else {
	
			_yOffset = isOnPitterScreen ? global.patterOffsetY : -global.patterOffsetY;
	
		}

	}

	var _tileSize = 16; 

	// 4. Calculate how many 16x16 cells fit in the stretched block
	var _numCols = floor(sprite_width / _tileSize);
	var _numRows = floor(sprite_height / _tileSize);

	// 5. Loop through every 16x16 cell on the block
	for (var _col = 0; _col < _numCols; _col++) {
	    for (var _row = 0; _row < _numRows; _row++) {
        
			//show_debug_message("_col: " + string(_col))
			//show_debug_message("_row: " + string(_row))
		
	        // Target drawing position on the block
	        var _drawX = x + (_col * _tileSize);
	        var _drawY = y + (_row * _tileSize);
        
	        // Sampling position
	        var _sampleX = _drawX + _xOffset;
	        var _sampleY = _drawY + _yOffset;
        
	        // Read tile data from the "LevelTiles" tilemap at the offset position
	        var _tileData = tilemap_get_at_pixel(_tilemapID, _sampleX, _sampleY);
        
	        // If there is a valid tile at that sampled location, draw it!
	        if (_tileData != 0) {
	 
				if (tile_get_index(_tileData) < 400) { 
				    draw_tile(_tilesetID, _tileData, 0, _drawX, _drawY);
				}
			
	        } else {
				//show_debug_message("No tile data")
			}
	    }
	}

	// --- TINT THE TILES ---
	var _tintColor = blendColor; // Set to whatever color you want (or use image_blend)

	// Enable Multiply blend mode
	gpu_set_blendmode_ext(bm_dest_color, bm_zero);

	// Draw a colored rectangle over the entire block bounds
	draw_set_color(_tintColor);
	draw_set_alpha(image_alpha);
	draw_rectangle(x, y, x + sprite_width - 1, y + sprite_height - 1, false);

	// Reset GPU blend mode and draw color back to normal
	gpu_set_blendmode(bm_normal);
	draw_set_color(c_white);
	draw_set_alpha(1.0);

}
           // Pass _tilesetID here instead of _tilemapID!
				//show_debug_message("Attempting to draw tile")
			
			
				// Extract the tile index from your tiledata variable
				//var _tileIndex = tile_get_index(_tileData);
				//
				//// Only draw if the tile is within valid bounds
				//if (_tileIndex > 0 && _tileIndex < max_tiles) {
				//    draw_tile(_tilesetID, _tileData, 0, _drawX, _drawY);
				//}
			
				//var _tileIndex = tile_get_index(_tileData);
				//
				//// Suppress output by skipping out-of-bounds indices
				//if (_tileIndex > 0 && _tileIndex < 64) { // Replace 64 with your tileset's tile count
				//    draw_tile(ts_your_tileset, _tileData, 0, _drawX, _drawY);
				//}
			
	            //draw_tile(_tilesetID, _tileData, 0, _drawX, _drawY);
			
				// Replaces drawing anything over tile index 0 that is unrealistically high

//Going up a solid wall while on a semi solid platform //REDUNDANT
	//if myFloorPlat.ySpeed < 0 && place_meeting(x, y + myFloorPlat.ySpeed, obj_block_wall) {
	//
	//	
	//	if myFloorPlat.object_index == obj_block_wall_semiSolid || object_is_ancestor(myFloorPlat.object_index, obj_block_wall_semiSolid) {
	//	
	//		_subPixel = 0.25;
	//		
	//		//Get pushed down through semisolid platform
	//		while place_meeting(x, y + myFloorPlat.ySpeed, obj_block_wall) {
	//		
	//			y += _subPixel;
	//		
	//		}
	//		
	//		//If we got pushed into a solid wall going down, push ourselves back out
	//		while place_meeting(x, y, obj_block_wall) {
	//		
	//			y -= _subPixel;
	//		
	//		}
	//		
	//		y = round(y);
	//	
	//	}
	//
	//	setOnGround(false);
	//
	//}

//effect_create_above(ef_cloud, 100, 100, 1000, c_white);
	
	//Title screen particle effects
	global.particleSystemHearts = part_system_create_layer("HeartParticles", false);
	global.particleSystemDevice = part_system_create_layer("DeviceParticles", false);
	
	//global.emitterPinkHearts = part_emitter_create(global.particleSystemHearts);
	//global.emitterBlueHearts = part_emitter_create(global.particleSystemHearts);
	//global.emitterDeviceSparks = part_emitter_create(global.particleSystemDevice);

	global.particleHeartPink = part_type_create();
	global.particleHeartBlue = part_type_create();
	global.particleSparkDevice = part_type_create();

	part_type_sprite(global.particleHeartPink, spr_patter_heart, 0, 0, 0);
	part_type_speed(global.particleHeartPink, 1, 2, 0, 0);
	part_type_direction(global.particleHeartPink, 80, 100, 0, 0);
	
	//var _offsetY = -5;
	//
	//part_emitter_region(
	//
	//	global.particleSystemHearts, 
	//	global.emitterPinkHearts, 
	//	obj_player_pitter.x, 
	//	obj_player_pitter.x, 
	//	obj_player_pitter.y + _offsetY, 
	//	obj_player_pitter.y + _offsetY, 
	//	ps_shape_rectangle, 
	//	ps_distr_gaussian
	//
	//);
	
	
	
	//part_emitter_stream(global.particleSystemHearts, global.emitterPinkHearts, global.particleHeartPink, 1);
	
	
	
	part_type_sprite(global.particleHeartBlue, spr_pitter_heart, 0, 0, 0);
	
	part_type_sprite(global.particleSparkDevice, spr_background_pixel, 0, 0, 0);

