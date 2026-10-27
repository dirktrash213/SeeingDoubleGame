/// @description Ignore crushers that aren't meant for Pitter

// obj_block_wall_crusher is a child of obj_block_wall, so it is picked up by every wall
// check in obj_player's Step (movement, landing, moving platforms, crush detection).
// Crushers with pitterCrusher == false get an empty collision mask for the duration of
// Pitter's Step only, so Pitter passes through them as if they weren't there.
// The masks are restored straight after, so Patter, enemies and boxes still collide with them.

var _ignoredCrushers = [];

with (obj_block_wall_crusher) {
	if (!pitterCrusher) {
		array_push(_ignoredCrushers, { inst: id, mask: mask_index });
		mask_index = spr_empty;
	}
}

event_inherited(); //Run obj_player's Step as normal (an exit in there only ends the parent event)

for (var i = 0; i < array_length(_ignoredCrushers); i++) {
	var _entry = _ignoredCrushers[i];
	if (instance_exists(_entry.inst)) _entry.inst.mask_index = _entry.mask;
}






