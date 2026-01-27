var _platformRailPath = platformRailPath;
var _platformSpawnSpeed = platformSpawnSpeed;
var _depth = depth;
var _visible = visible;

with instance_create_layer(x, y, "Instances", platformToSpawn) {

	depth = _depth - 10;
	visible = _visible;
	path_start(_platformRailPath, _platformSpawnSpeed, path_action_stop, false);


}
alarm[0] = platformSpawnRate;







