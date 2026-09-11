if sprite_index != spr_interactable_portalCircle_idle_green exit;

global.portalsActive = true;

//var _nearestExitPortal = instance_nearest(x,y,obj_interactable_portal_exit);
//var _offsetY = 10;


//global.patterOffsetY = _nearestExitPortal.y - obj_player_pitter.y + _offsetY;
global.patterOffsetY = patterOffsetY;

instance_activate_object(obj_block_wall_temp);

if global.coopActive {

	with obj_block_wall_temp {

		visible = true;
	
	}
	
	with obj_block_wall_temp_reverse {

		visible = false;
	
	}

	var _nearestExitPortal;
	var _portalID = portalID;

	with obj_interactable_portal_exit {

		if portalID = _portalID _nearestExitPortal = id;

	}
	
	other.x = _nearestExitPortal.x;
	other.y = _nearestExitPortal.y;

}

//instance_deactivate_object(obj_block_wall_temp_reverse);

playGreenPortalJumpEffects();
