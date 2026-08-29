if !global.coopActive exit;

// --- CALCULATE TINT COLOR & ALPHA BEFORE DRAWING ---
var _tintColor;

if (!active) {
    _tintColor = c_white;
    image_alpha = defaultAlpha;
} else {
    _tintColor = blendColor;
}

image_alpha = clamp(image_alpha, defaultAlpha, 1.0);

// 1. Get Tilemap and Tileset info
var _layerID = layer_get_id("LevelTiles");
var _tilemapID = layer_tilemap_get_id(_layerID);
var _tilesetID = tilemap_get_tileset(_tilemapID);

// 2. Define sample offset and tile size
var _yOffset = isOnPitterScreen ? global.patterOffsetY : -global.patterOffsetY;
var _tileSize = 16; 

var _numCols = floor(sprite_width / _tileSize);
var _numRows = floor(sprite_height / _tileSize);

// --- START SHADER TINT ---
shader_set(shd_tile_tint);

// Pass tint color and alpha to shader uniform
var _uTint = shader_get_uniform(shd_tile_tint, "u_vTint");
var _r = color_get_red(_tintColor) / 255.0;
var _g = color_get_green(_tintColor) / 255.0;
var _b = color_get_blue(_tintColor) / 255.0;

shader_set_uniform_f(_uTint, _r, _g, _b, image_alpha);

// 3. Loop and draw tiles inside shader pass
for (var _col = 0; _col < _numCols; _col++) {
    for (var _row = 0; _row < _numRows; _row++) {
        
        var _drawX = x + (_col * _tileSize);
        var _drawY = y + (_row * _tileSize);
        
        var _sampleX = _drawX;
        var _sampleY = _drawY + _yOffset;
        
        var _tileData = tilemap_get_at_pixel(_tilemapID, _sampleX, _sampleY);
        
        if (_tileData != 0) {
            if (tile_get_index(_tileData) < 400) { 
                draw_tile(_tilesetID, _tileData, 0, _drawX, _drawY);
            }
        }
    }
}

// --- RESET SHADER ---
shader_reset();

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
           
			if (tile_get_index(_tileData) < 400) { 
			    draw_tile(_tilesetID, _tileData, 0, _drawX, _drawY);
			}
			
        } else {
			//show_debug_message("No tile data")
		}
    }
}



// --- TINT THE TILES ---
var _tintColor; 


//= blendColor; // Set to whatever color you want (or use image_blend)

if !active {
	
	_tintColor = c_white;
	image_alpha = defaultAlpha;
	
} else {

	_tintColor = blendColor;
	//image_alpha = defaultAlpha;

}

image_alpha = clamp(image_alpha, defaultAlpha, 1.0);

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







