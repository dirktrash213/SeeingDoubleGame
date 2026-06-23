alarm[0] = spawnRate + random_range(-spawnRateVariance, spawnRateVariance);

var _IDnumber = IDnumber;

var _spawnVisibleBoxes = spawnVisibleBoxes;

var _objectToSpawn = obj_block_wall_box_small;

if stackedBoxes {
	
	_objectToSpawn = obj_block_wall_box_smallStack;
	
	with instance_create_layer(x, y, "Instances", obj_interactable_hazard_spikes_boxes) {

		attachedToSolidPlatform = true;
		
		if !_spawnVisibleBoxes visible = false;
		
		IDnumber = _IDnumber;
	
	}
	
}

with instance_create_layer(x, y, "Instances", _objectToSpawn) {

	if !_spawnVisibleBoxes visible = false;
	
}



if alternateVisibleBoxes spawnVisibleBoxes = !spawnVisibleBoxes;







