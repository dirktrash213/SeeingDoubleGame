image_xscale = -1;

if global.dialogueVariables.eatenCaveCherry {
	
	sprite_index = spr_npc_hungryMiner_shocked;
	
	if y > ystart {

		y = ystart;
		gravity = 0;
		vspeed = 0;
		alarm[0] = delayBeforeJump;

	}
	
}



if lookingAtPlayer image_xscale = obj_player_pitter.x > x ? -1 : 1;


