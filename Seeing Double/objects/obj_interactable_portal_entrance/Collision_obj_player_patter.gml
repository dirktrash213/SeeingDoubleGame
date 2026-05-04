if sprite_index != spr_interactable_portalCircle_idle_green exit;

global.portalsActive = true;

//var _nearestExitPortal = instance_nearest(x,y,obj_interactable_portal_exit);
//var _offsetY = 10;


//global.patterOffsetY = _nearestExitPortal.y - obj_player_pitter.y + _offsetY;
global.patterOffsetY = patterOffsetY;

instance_activate_object(obj_block_wall_temp);
//instance_deactivate_object(obj_block_wall_temp_reverse);

audio_play_sound(sfx_portal_jump, 1, false);

xStretch = 0.5;
yStretch = 1.5;


with instance_nearest(x, y, obj_interactable_portal_exit) {

	xStretch = 0.5;
	yStretch = 1.5;

}