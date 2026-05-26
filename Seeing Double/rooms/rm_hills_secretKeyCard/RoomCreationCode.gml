if global.dialogueVariables.spookedBySmallGhost global.dialogueVariables.spookedBySmallGhostOver = true;

if audio_is_playing(amb_soft_wind) && global.dialogueVariables.talkedToSmallGhostTwice && !global.dialogueVariables.spookedBySmallGhost {
	
	global.dialogueVariables.spookedBySmallGhost = true;
	layer_enable_fx("Wind", false);
	audio_stop_sound(amb_soft_wind);
	
}

awardPlayerAchievement("GHOST_GUY");