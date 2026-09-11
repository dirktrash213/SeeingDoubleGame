event_inherited();

coopObjectCreateEventCode();

attachedToPlatform = false;
platform = instance_nearest(x + 8,y + 16,obj_block_wall_semiSolid_moving);



attachedToSolidPlatform = false;
solidPlatform = instance_nearest(x + 8,y + 16,obj_block_wall_moving);



duplicate = false;
duplicatedObject = noone; //Use this if gems need to move in sync in step event
if global.coopActive alarm[1] = 2;

portalSpike = false;