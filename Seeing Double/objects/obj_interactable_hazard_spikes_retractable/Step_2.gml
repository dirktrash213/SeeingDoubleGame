var _spikeDetectionRadius = 60;
if room == rm_cave_minecartMore _spikeDetectionRadius = 120;
coopObjectStepEventCode(_spikeDetectionRadius);
mask_index = sprite_index;


if attachedToPlatform {

	var _xDiff = platform.xstart - xstart;

	x = platform.x - _xDiff;
	y = platform.y - sprite_height;

}


image_index = active ? 0 : 1;

coopSyncDuplicateObjects();