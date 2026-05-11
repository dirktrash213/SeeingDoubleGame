//if (keyboard_check_pressed(ord("T"))) {
//   
//   show_debug_message("shader toggle");
//   
//   enable_split_screen = !enable_split_screen; // Flip true/false
//}

__bktgtlich_ui_step();

//if increasingIntensityToMaxTiny {
//
//	intensity += intensityIncreaseAmount;
//	intensity = min(intensity, intensityMaxTiny);
//
//}

switch intensityIncrementType {
	
	case INCREMENT_TYPE.INCREASING_TO_TINY: {
		
		if intensity <= intensityMaxTiny {
		
			intensity += intensityIncreaseAmount;
			intensity = min(intensity, intensityMaxTiny);
		
		} else {
		
			intensity -= intensityDecreaseAmount2;
			intensity = max(intensity, intensityMaxTiny);
		
		}
		
		channelShift -= channelShiftDecreaseAmount;
		channelShift = max(channelShift, 0);
		
		channelDispersion -= channelDispersionDecreaseAmount;
		channelDispersion = max(channelDispersion, 0);
	   
	} break;
	
	case INCREMENT_TYPE.INCREASING_TO_SMALL: {
       
		if intensity <= intensityMaxSmall {
		
			intensity += intensityIncreaseAmount;
			intensity = min(intensity, intensityMaxSmall);
		
		} else {
		
			intensity -= intensityDecreaseAmount2;
			intensity = max(intensity, intensityMaxSmall);
		
		}
		
		channelShift -= channelShiftDecreaseAmount;
		channelShift = max(channelShift, 0);
		
		channelDispersion -= channelDispersionDecreaseAmount;
		channelDispersion = max(channelDispersion, 0);
	   
	} break;
	
	case INCREMENT_TYPE.INCREASING_TO_LARGE: {
       
		intensity += intensityIncreaseAmount;
		intensity = min(intensity, intensityMaxLarge);
		
		channelShift += channelShiftIncreaseAmount;
		channelShift = min(channelShift, channelShiftMax);
		
		channelDispersion += channelDispersionIncreaseAmount;
		channelDispersion = min(channelDispersion, channelDispersionMax);
	   
	} break;
	
	case INCREMENT_TYPE.DECREASING_TO_ZERO: {
       
		intensity -= intensityDecreaseAmount2;
		intensity = max(intensity, 0);
	   
	    channelShift -= channelShiftDecreaseAmount;
		channelShift = max(channelShift, 0);
		
		channelDispersion -= channelDispersionDecreaseAmount;
		channelDispersion = max(channelDispersion, 0);
	   
	} break;
    
}



//Below system is only used for the forest ghost segment, newer ghost segments use above system
if instance_exists(obj_manager_spookyForestGhost) {

	if obj_manager_spookyForestGhost.ambienceFadingOut {
	
		intensity -= intensityDecreaseAmount;
		intensity = max(intensity, 0);
		
		channelShift -= channelShiftDecreaseAmount;
		channelShift = max(channelShift, 0);
		
		channelDispersion -= channelDispersionDecreaseAmount;
		channelDispersion = max(channelDispersion, 0);
	
	} else {

		if obj_manager_spookyForestGhost.glitchesAppearing && !obj_manager_spookyForestGhost.ghostArriving {
	
			intensity += intensityIncreaseAmount;
			intensity = min(intensity, intensityMax);
	
		}
	
		if obj_manager_spookyForestGhost.ghostArriving {
	
			intensity += intensityIncreaseAmount2;
			intensity = min(intensity, intensityMax2);
			
			channelShift += channelShiftIncreaseAmount;
			channelShift = min(channelShift, channelShiftMax);
			
			channelDispersion += channelDispersionIncreaseAmount;
			channelDispersion = min(channelDispersion, channelDispersionMax);
			
		}
	
	}

}