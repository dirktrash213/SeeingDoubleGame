var _spikeDetectionRadius = 60;
if room == rm_cave_minecartMore _spikeDetectionRadius = 120;
coopObjectStepEventCode(_spikeDetectionRadius);
mask_index = sprite_index;


if attachedToPlatform {

	var _xDiff = platform.xstart - xstart;

	var _offsetY = 16;

	x = platform.x - _xDiff;
	y = platform.y - sprite_height + _offsetY;

}


coopSyncDuplicateObjects();