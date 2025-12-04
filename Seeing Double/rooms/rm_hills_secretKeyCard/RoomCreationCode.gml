if global.dialogueVariables.spookedBySmallGhost global.dialogueVariables.spookedBySmallGhostOver = true;

if audio_is_playing(bgm_soft_wind) && global.dialogueVariables.talkedToSmallGhostTwice && !global.dialogueVariables.spookedBySmallGhost {
	
	global.dialogueVariables.spookedBySmallGhost = true;
	layer_enable_fx("Wind", false);
	audio_stop_sound(bgm_soft_wind);
	
}