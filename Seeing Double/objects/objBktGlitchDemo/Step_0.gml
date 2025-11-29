__bktgtlich_ui_step();

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