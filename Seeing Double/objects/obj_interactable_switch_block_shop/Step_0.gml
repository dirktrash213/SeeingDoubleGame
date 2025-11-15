if bonked && visible {

	bonked = false;
	
	gravity = 0.5;
	vspeed = -3;
	
	var _shopItem = instance_nearest(x,y,obj_shopItem);
	
	//show_debug_message(object_get_name(_shopItem))
	
	if _shopItem == noone {
		
		//show_debug_message("exit!")
		
		exit;
		
	}
	
	if _shopItem.object_index == obj_shopItem_parachute {
		
		//show_debug_message("scammed!")
		
		global.dialogueVariables.boughtParachuteFromScammer = true;
		//global.gotScammed = true;
		
	}
	
	instance_destroy(_shopItem);

}

if y > ystart {
	
	y = ystart;
	gravity = 0;
	vspeed = 0;
	
}