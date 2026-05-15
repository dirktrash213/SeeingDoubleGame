switch state {
    
	case BAT_STATE.IDLE: {

		if sprite_index == spr_interactable_bat_openWings && isLastAnimationFrame() {

			sprite_index = spr_interactable_bat_idle;
			image_index = 0;
		
		}
	   
	} break;
    
}




