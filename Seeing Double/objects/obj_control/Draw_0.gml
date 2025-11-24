//// 1. Set the drawing alpha to your variable
////draw_set_alpha(tileLayerAlpha);
//draw_set_alpha(0);
//
//// 2. Draw the tilemap manually
//// draw_tilemap(tilemap_element_id, x, y)
//// We usually draw it at 0,0 because the tilemap positions are relative to the room.
//draw_tilemap(tilemapID, 0, 0);
//
//// 3. IMPORTANT: Reset the alpha back to 1
//// If you forget this, everything drawn after this object will also be transparent.
//draw_set_alpha(1);