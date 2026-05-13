if other.canCollide {
	
	if room == rm_cave_chase_minecarts 
	|| room == rm_cave_chase_timedBlocks {
	
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