if other.canCollide {
	
	if room == rm_cave_chase_minecarts 
	|| room == rm_cave_chase_timedBlocks 
	|| room == rm_cave_chase_longRun {
	
		obj_npc_ghost_cavesChase.playerCaught = true;
		global.caveChaseOver = false;
		caughtByCaveGhost();
		exit;
	
	}
	
	playerDefeated();

}

if edgeCase {

	if room == rm_forest_doubleJumpCrystal {
	
		global.respawnEdgeCases.speedUpForestPlatform = true;
	
	}

}