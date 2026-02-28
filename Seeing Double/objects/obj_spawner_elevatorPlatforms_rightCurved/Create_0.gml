platformRailPath = path_platform_elevator_rightCurved;
platformSpawnRate = 120;
platformToSpawn = obj_block_wall_semiSolid_moving_elevator;
platformSpawnSpeed = 1.0;
delayBeforeFirstSpawn = 2;
alarm[0] = delayBeforeFirstSpawn;


if playerIsPresent() {

	depth = obj_player.depth + 10;

}

var _platformRailPath = platformRailPath;
var _platformSpawnSpeed = platformSpawnSpeed;
var _depth = depth;
var _visible = visible;

with instance_create_layer(x, y, "Instances", platformToSpawn) {

	depth = _depth - 10;
	visible = _visible;
	railPath = path_platform_elevator_rightCurved;
	path_start(railPath, _platformSpawnSpeed*5, path_action_stop, false);
	path_position = 0.8;

}




