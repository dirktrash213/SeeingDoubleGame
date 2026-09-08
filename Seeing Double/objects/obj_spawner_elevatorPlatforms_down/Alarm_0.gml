var _platformRailPath = platformRailPath;
var _platformSpawnSpeed = platformSpawnSpeed;
var _depth = depth;
var _visible = visible;

with instance_create_layer(x, y, "Instances", platformToSpawn) {

	depth = _depth - 10;
	visible = _visible;
	railPath = path_platform_elevator_down;
	path_start(railPath, _platformSpawnSpeed, path_action_stop, false);
	//path_start(path_platform_elevator_down_fast, _platformSpawnSpeed, path_action_stop, false);

	if !_visible && global.coopActive {
		
		coopObjectInstanceCreationCode();
		mask_index = spr_empty;
		
	}

}
alarm[0] = platformSpawnRate;







