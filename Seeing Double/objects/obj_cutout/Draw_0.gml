if !global.coopActive exit;

// Get current camera bounds
var _cam = view_camera[view_current];
var _camX = camera_get_view_x(_cam);
var _camY = camera_get_view_y(_cam);
var _camW = camera_get_view_width(_cam);
var _camH = camera_get_view_height(_cam);

// 1. Maintain the surface size to match the viewport
if (!surface_exists(surfSecretTiles)) {
    surfSecretTiles = surface_create(_camW, _camH);
}

// 2. Clear surface to transparent
surface_set_target(surfSecretTiles);
draw_clear_alpha(c_black, 0);

// 3. Draw the SecretTiles layer offset to current view
var _tilemapID = layer_tilemap_get_id(layer_get_id("SecretTiles"));
draw_tilemap(_tilemapID, -_camX, -_camY);

// 4. Erase alpha using the sprite mask of ALL obj_cutout instances
// (This handles co-op / multiple cutouts on screen automatically)
gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha);

with (obj_cutout) {
    draw_sprite_ext(
        sprite_index, 
        image_index, 
        x - _camX, 
        y - _camY, 
        image_xscale, 
        image_yscale, 
        image_angle, 
        c_white, 
        1.0
    );
}

// 5. Reset blend mode and target
gpu_set_blendmode(bm_normal);
surface_reset_target();

// 6. Draw the cut-out tilemap surface to screen
draw_surface(surfSecretTiles, _camX, _camY);

