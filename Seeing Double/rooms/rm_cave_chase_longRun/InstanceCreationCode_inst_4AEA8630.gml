variableTextDisplayDuration = true;
wrapAmount = 125;
typist.sound(sfx_mouseChirp, false, 0.7, 1.5); 
textDisplayDuration = 360;

if !global.dialogueVariables.talkedToLostMiner && !global.caveChaseOver {

	for (var i = 0; i < array_length(global.dialogueStringArrays.cavesMetGreenMinerDad); ++i) {
	 
		dialogueString[i] = global.dialogueStringArrays.cavesMetGreenMinerDad[i];
	 
	}
	
} else {

	if !global.dialogueVariables.talkedToLostMinerTwice {

		for (var i = 0; i < array_length(global.dialogueStringArrays.cavesWaitingForGhostToLeave); ++i) {
	 
			dialogueString[i] = global.dialogueStringArrays.cavesWaitingForGhostToLeave[i];
	 
		}
	
	} else {
		
		dialogueString[0] = "...";
	
	}

}