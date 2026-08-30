xSpeed = 0;
ySpeed = 0;

//visible = false;
mask_index = sprite_index;

//if global.coopActive instance_deactivate_object(id);

defaultAlpha = global.coopTransluscentBlocksDefaultAlpha;

image_alpha = defaultAlpha;

active = true;
activeGraceTimer = 60;


//tileSprite = spr_coopTile_generic; //Make child objects?
tileSprite = spr_coopTile_forest; //Make child objects?

pitterColor = #6DD0F7;
patterColor = #F3C2D8;


isOnPitterScreen = y < global.patterOffsetY;

blendColor = isOnPitterScreen ? patterColor : pitterColor;

alarm[1] = 1; //Prevents platforms from appearing too early
//alarm[0] = 3; 





// Get tileset info and store the total tile count
//var _info = tileset_get_info(tiles_standard); // Replace with your tileset asset name
//max_tiles = _info.tile_count;


if playerIsPresent() depth = obj_player.depth + 10;