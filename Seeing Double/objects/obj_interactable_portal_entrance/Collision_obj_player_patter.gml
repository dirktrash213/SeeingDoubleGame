if sprite_index != spr_interactable_portalCircle_idle_green exit;

global.portalsActive = true;

//var _nearestExitPortal = instance_nearest(x,y,obj_interactable_portal_exit);
//var _offsetY = 10;


//global.patterOffsetY = _nearestExitPortal.y - obj_player_pitter.y + _offsetY;
global.patterOffsetY = patterOffsetY;

instance_activate_object(obj_block_wall_temp);
//instance_deactivate_object(obj_block_wall_temp_reverse);

playGreenPortalJumpEffects();

//audio_play_sound(sfx_portal_jump, 1, false);
//
//xStretch = 0.5;
//yStretch = 1.5;
//
//
//with instance_nearest(x, y, obj_interactable_portal_exit) {
//
//	xStretch = 0.5;
//	yStretch = 1.5;
//
//}
//
//var _rangeX = 3;
//	
//var _offsetX = 0;
//var _offsetY = 0;
//
//var _numberOfParticles = irandom_range(8,10);
//
//part_particles_create(global.particleSystemDevice, x + _offsetX, y + _offsetY, global.particlePortalGreen, _numberOfParticles);
//
//with instance_nearest(x, y, obj_interactable_portal_exit) { 
//	
//	_numberOfParticles = irandom_range(8,10);
//	
//	part_particles_create(global.particleSystemDevice, x + _offsetX, y + _offsetY, global.particlePortalRed, _numberOfParticles);	
//		
//}
