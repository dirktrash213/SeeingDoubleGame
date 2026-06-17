if !active exit;
if triggered exit;


triggered = true;

alarm[0] = textDisplayDuration;

if instance_exists(obj_interactable_monitor_parent) {
	
	audio_play_sound(sfx_monitorOn, 1, false);

	with instance_nearest(x, y, obj_interactable_monitor_parent) {
	
		image_speed = 1;
	
	}

}
 
switch room { 
		
	case rm_cave_groundPoundCrystal_highJumpTutorial: {
		
		if dialogueString[0] == global.dialogueStringArrays.cavesHungryMiner[0] {
		
			with obj_npc_hungryMiner {
		
				sprite_index = spr_npc_hungryMiner_annoyed;
				lookingAtPlayer = true;
		
			}
		
		}
	
	} break;

}
