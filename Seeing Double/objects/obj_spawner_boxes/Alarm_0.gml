alarm[0] = spawnRate + random_range(-spawnRateVariance, spawnRateVariance);

var _spawnVisibleBoxes = spawnVisibleBoxes;

with instance_create_layer(x, y, "Instances", obj_block_wall_box_small) {

	if !_spawnVisibleBoxes visible = false;

}

if alternateVisibleBoxes spawnVisibleBoxes = !spawnVisibleBoxes;







