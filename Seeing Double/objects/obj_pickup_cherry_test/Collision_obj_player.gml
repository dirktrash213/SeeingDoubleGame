event_inherited();

instance_create_layer(x, y, "Instances", obj_textPopup);

//global.cherryCount++;

switch room {
	
    case rm_cave_groundPoundCrystal_highJumpTutorial: {
       
	   global.dialogueVariables.eatenCaveCherry = true;
	   
	   with instance_nearest(x,y,obj_trigger_dialogue) {
	   
		  eatenCaveCherry = true;
	   
	   }
	   
	} break;
    
}