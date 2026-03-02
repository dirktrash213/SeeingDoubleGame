if obj_cutsceneSystem.cutsceneState == GROUND_POUND_BARREL_CUTSCENE_STATE.SOAKING 
&& obj_cutsceneSystem.alarm[1] < 40
&& state == BARREL_STRETCH_STATE.NONE {

	state = BARREL_STRETCH_STATE.SQUISHING;

}


switch (state) {
	
    case BARREL_STRETCH_STATE.SQUISHING: {
       
	   xStretch -= xStretchDecreaseSpeed;
	   yStretch -= yStretchDecreaseSpeed;
	   
	} break;
	
    case BARREL_STRETCH_STATE.SHOOTING: {
       
	   xStretch += xStretchIncreaseSpeed;
	   yStretch += yStretchIncreaseSpeed;
	   
	   if xStretch >= 0 {
	   
			instance_create_layer(x, y, "Collision", obj_scienceJuice_empty);
			instance_destroy();
			
	   }
	   
	} break;
    
}







