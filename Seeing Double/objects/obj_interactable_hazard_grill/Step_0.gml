if active && playerIsPresent() {

	var _perimeter = 1;

	var _collidingPlayer = collision_rectangle(x - _perimeter, y - _perimeter, x + sprite_width + _perimeter, y + sprite_height + _perimeter, obj_player, true, true);
	
	if _collidingPlayer {
	
		playerDefeated(_collidingPlayer);
	
	}

}













