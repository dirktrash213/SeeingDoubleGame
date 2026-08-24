if !global.coopActive instance_destroy();

wrapAmount = 125;
typist.sound(sfx_mouseChirp, false, 0.2, 2.5); 

if !global.dialogueVariables.talkedToCoopNPCEnemies {
	
	displayDialogue(global.dialogueStringArrays.forestCoopNpcEnemies);

} else {
	
	displayDialogue(global.dialogueStringArrays.forestCoopNpcNoRepeat);

}