if !global.coopActive {

	active = true;
	mask_index = spr_block_collision_coop;
	exit;

}

if alarm[1] > -1 exit; //Prevents platforms from appearing too early (move to draw)

// Radius around the player shadow where blocks become visible
var _revealRadius = 30; //Adjust this distance to fit your game
var _isNearShadow = false;

var _tempMaskIndex = mask_index;
mask_index = spr_block_collision_coop;

// Check against all active player shadows (handles 1 player or Co-op!)
with (obj_player_shadow) {
    if (collision_circle(x, y, _revealRadius, other.id, true, false) != noone) {
        _isNearShadow = true;
        break; // Found a nearby shadow, no need to check other shadows
    }
}

// Set visibility based on proximity
active = _isNearShadow;

mask_index = _tempMaskIndex;

if active {

	visible = true;
	alarm[0] = -1;
	mask_index = spr_block_collision_coop;
	image_alpha = 1.0;

} else {

	if alarm[0] == -1 alarm[0] = activeGraceTimer;
	image_alpha = alarm[0] / activeGraceTimer; //Makes the temporary platform slowly fade out

}