if playerIsPresent() {
	
	var _nearestPlayer = instance_nearest(x, y, obj_player);

	var _distance = point_distance(x, y, _nearestPlayer.x, _nearestPlayer.y);

	if (_distance <= detectionRadius) {
    
	    active = true;
		
	} else {
	
		active = false;
	
	}
	
	if obj_player_pitter.binocularsActive active = true;
	if obj_player_patter.binocularsActive active = true;

}
