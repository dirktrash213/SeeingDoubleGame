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

//Code that spawns platforms on the rails when player loads in
var _startingPlatforms = 10;
var _incrementOffset = 0.0;
var _incrementAmount = 0.105;

for (var i = 0; i < _startingPlatforms; i++;)  {
   
	with instance_create_layer(x, y, "Instances", platformToSpawn) {

		depth = _depth - 10;
		if y > 222 visible = false;
		railPath = path_platform_elevator_rightCurved;
		path_start(railPath, _platformSpawnSpeed, path_action_stop, false);
		alarm[0] = 2;
		customePathStartPoint = 0.0 + _incrementOffset;

	}
	
	_incrementOffset += _incrementAmount;
   
}

//playAudioWithFalloff(sfx_elevator, 600, 1.0, true);