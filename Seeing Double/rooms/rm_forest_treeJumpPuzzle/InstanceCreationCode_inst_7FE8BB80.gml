if !global.coopActive instance_destroy();

wrapAmount = 125;
typist.sound(sfx_mouseChirp, false, 0.2, 2.5); 
textDisplayDuration = 300;

if !global.dialogueVariables.talkedToCoopNPCPlatforms {
	
	displayDialogue(global.dialogueStringArrays.forestCoopNpcPlatforms);

} else {
	
	displayDialogue(global.dialogueStringArrays.forestCoopNpcNoRepeat);

}