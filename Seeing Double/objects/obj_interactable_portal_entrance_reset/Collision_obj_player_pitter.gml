global.portalsActive = false;


var _nearestExitPortal = instance_nearest(x,y,obj_interactable_portal_exit);
//var _offsetY = 10;


//global.patterOffsetY = _nearestExitPortal.y - obj_player_pitter.y + _offsetY;

global.patterOffsetY = global.defaultPatterOffsetY;

other.x = _nearestExitPortal.x;
other.y = _nearestExitPortal.y;


//instance_deactivate_object(obj_block_wall_temp);
instance_activate_object(obj_block_wall_temp_reverse);






