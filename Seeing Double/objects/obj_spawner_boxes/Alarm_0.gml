alarm[0] = spawnRate + random_range(-spawnRateVariance, spawnRateVariance);

var _IDnumber = IDnumber;

var _spawnVisibleBoxes = spawnVisibleBoxes;

var _objectToSpawn = obj_block_wall_box_small;

if stackedBoxes {
	
	_objectToSpawn = obj_block_wall_box_smallStack;
	
	with instance_create_layer(x, y, "Instances", obj_interactable_hazard_spikes_boxes) { //Spawn the spikes on the box

		attachedToSolidPlatform = true;
		
		if !_spawnVisibleBoxes {
			
			if global.coopActive {
			
				coopObjectInstanceCreationCode();
			
			} else {
			
				visible = false;
			
			}
			
		}
		
		IDnumber = _IDnumber;
	
	}
	
}

if bigBoxes {

	_objectToSpawn = obj_block_wall_box_large;

}

with instance_create_layer(x, y, "Instances", _objectToSpawn) { //Spawn the box

	if !_spawnVisibleBoxes {
			
		if global.coopActive {
		
			coopObjectInstanceCreationCode();
		
		} else {
		
			visible = false;
		
		}
		
	}
	
}



if alternateVisibleBoxes spawnVisibleBoxes = !spawnVisibleBoxes;







