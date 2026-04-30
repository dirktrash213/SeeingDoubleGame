platformRailPath = path_platform_elevator_right;
platformSpawnRate = 120;
platformToSpawn = obj_block_wall_semiSolid_moving_elevator;
platformSpawnSpeed = 1.0;
delayBeforeFirstSpawn = 2;
alarm[0] = delayBeforeFirstSpawn;


if playerIsPresent() {

	depth = obj_player.depth + 10;

}


//playAudioWithFalloff(sfx_elevator, 600, 1.0, true);




