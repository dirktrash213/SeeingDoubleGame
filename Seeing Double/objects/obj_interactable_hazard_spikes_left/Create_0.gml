event_inherited();
coopObjectCreateEventCode();

attachedToPlatform = false;
platform = instance_nearest(x,y,obj_block_wall_semiSolid_moving);

duplicate = false;
duplicatedObject = noone; //Use this if gems need to move in sync in step event
if global.coopActive alarm[1] = 2;