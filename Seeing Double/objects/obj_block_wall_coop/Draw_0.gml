coopObjectBlockDrawCode();
/*

if !global.coopActive exit;

// 1. Get the Tilemap ID for your "LevelTiles" layer
var _layerID = layer_get_id("LevelTiles");
var _tilemapID = layer_tilemap_get_id(_layerID);

// 2. Extract the actual Tileset Asset pointer needed for draw_tile()
var _tilesetID = tilemap_get_tileset(_tilemapID);

// 3. Define the sample offset and your tile size (16x16)
var _yOffset = isOnPitterScreen ? global.patterOffsetY : -global.patterOffsetY;
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
        var _sampleX = _drawX;
        var _sampleY = _drawY + _yOffset;
        
        // Read tile data from the "LevelTiles" tilemap at the offset position
        var _tileData = tilemap_get_at_pixel(_tilemapID, _sampleX, _sampleY);
        
        // If there is a valid tile at that sampled location, draw it!
        if (_tileData != 0) {
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
			if (tile_get_index(_tileData) < 400) { 
			    draw_tile(_tilesetID, _tileData, 0, _drawX, _drawY);
			}
			
			
			
			
        } else {
			//show_debug_message("No tile data")
		}
    }
}


//var _sprite = choose(spr_1, spr_2);

//draw_sprite(_sprite, 0, _drawX, _drawY)



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

















//// --- SOFT COLOR TINT ---
//draw_set_color(#F3C2D8); // Tint color
//draw_set_alpha(0.35);   // Tint strength (0.0 = invisible, 1.0 = solid color)
//
//draw_rectangle(x, y, x + sprite_width - 1, y + sprite_height - 1, false);
//
//// Always reset alpha and color!
//draw_set_alpha(1.0);
//draw_set_color(c_white);


//// Turn on fog override with your desired blend color before drawing
//var _tintColor = #F3C2D8; // Color to force onto the tiles
//gpu_set_fog(true, _tintColor, 0, 0);
//
//// Loop and draw tiles as usual
//for (var _col = 0; _col < _numCols; _col++) {
//    for (var _row = 0; _row < _numRows; _row++) {
//        var _drawX = x + (_col * _tileSize);
//        var _drawY = y + (_row * _tileSize);
//        var _tileData = tilemap_get_at_pixel(_tilemapID, _drawX, _drawY + _yOffset);
//        
//        if (_tileData != 0) {
//            draw_tile(_tilesetID, _tileData, 0, _drawX, _drawY);
//        }
//    }
//}
//
//// Turn fog off immediately after drawing
//gpu_set_fog(false, c_white, 0, 0);
//





//show_debug_message("===============================================")




















/*
// 1. Define the 16x16 sprite to tile over the whole block
var _tileSprite = tileSprite; // Replace with your sprite name

// 2. Get the dimensions of a single 16x16 tile
var _tileWidth  = sprite_get_width(_tileSprite);
var _tileHeight = sprite_get_height(_tileSprite);

// 3. Calculate total columns (X) and rows (Y) needed to fill the stretched block
var _numCols = floor(sprite_width / _tileWidth);   // Width scaled by image_xscale
var _numRows = floor(sprite_height / _tileHeight); // Height scaled by image_yscale

image_blend = #F3C2D8;

// 4. Nested loop to tile both horizontally and vertically
for (var _col = 0; _col < _numCols; _col++) {
	
    for (var _row = 0; _row < _numRows; _row++) {
        
		var _subImage = 0;
		
		if _row == 0 {
		
			if _col == 0 _subImage = 1;
			if _col == (_numCols-1) _subImage = 2;
			if _numCols == 1 _subImage = 9;
		
		}
		
		if _row > 0 {
		
			_subImage = 3;
			if _col == 0 _subImage = 4;
			if _col == (_numCols-1) _subImage = 5;
			if _numCols == 1 _subImage = 10;
		
		}
		
		draw_sprite_ext(
            _tileSprite, 
            _subImage, 
            x + (_col * _tileWidth), 
            y + (_row * _tileHeight),
			1,
			1,
			0,
			image_blend,
			image_alpha
        );
		
    }
	
}