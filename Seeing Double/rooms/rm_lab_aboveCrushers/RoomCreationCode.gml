if !audio_is_playing(obj_control.bgmLab) audio_play_sound(obj_control.bgmLab, 1, true);

global.verticalLevel = false;
global.customLevel = false;

global.groundPoundActive = true;
global.doubleJumpActive = true;


if !global.destroyedLabDoor with obj_npc_robot_broken visible = false;

if global.destroyedLabDoor {
	
	with obj_npc_robot_running visible = false;
	with obj_npc_robot_running_fast visible = false;
	with obj_interactable_switch_groundPound {
		
		pressed = true;
		triggered = true;
		
	}
	
	instance_destroy(obj_interactable_labDoor);
	
	with obj_trigger_dialogue {
	
		if IDnumber == 1 active = false;
		if IDnumber == 2 active = true;
	
	}
	
	with obj_spawner_dialogue {
	
		if IDnumber == 1 active = false;
		if IDnumber == 2 active = true;
	
	}
	
	with obj_interactable_conveyor {
	
		if IDnumber == 1 conveyorSpeed = 0;
	
	}
	
}