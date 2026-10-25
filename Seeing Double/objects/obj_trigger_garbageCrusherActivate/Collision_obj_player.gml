if triggered exit;
triggered = true;

if global.coopActive {
	
	var _duplicateTrigger = findNearestObjectWithSameObjectIndex();
	
	_duplicateTrigger.triggered = true;
	
}

with obj_block_wall_garbageCrusher {

	if readyToCrush alarm[0] = timerDuration;

}








