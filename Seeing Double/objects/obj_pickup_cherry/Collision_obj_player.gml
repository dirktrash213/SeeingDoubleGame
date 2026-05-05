event_inherited();

instance_create_layer(x, y, "Instances", obj_textPopup);

global.cherryCount++;

if global.cherryCount == global.cherryMax audio_play_sound(sfx_magical_transition, 1, 0);

switch room {
	
    case rm_cave_groundPoundCrystal_highJumpTutorial: {
       
	   global.dialogueVariables.eatenCaveCherry = true;
	   
	   with instance_nearest(x,y,obj_trigger_dialogue) {
	   
		  eatenCaveCherry = true;
	   
	   }
	   
	   
	   with obj_npc_hungryMiner {
	   
		   vspeed = vSpeedAmount;
		   gravity = gravAmount;
		   lookingAtPlayer = true;
	   
	   }
	   
	} break;
    
}