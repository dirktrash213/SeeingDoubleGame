wrapAmount = 125;
typist.sound(sfx_mouseChirp, false, 0.2, 2.5); 
textDisplayDuration = 360;

if !global.dialogueVariables.talkedToCamper {

	for (var i = 0; i < array_length(global.dialogueStringArrays.cavesCamper); ++i) {
	 
		dialogueString[i] = global.dialogueStringArrays.cavesCamper[i];
	 
	}

} else {

	if !global.dialogueVariables.talkedToCamperTwice {

		for (var i = 0; i < array_length(global.dialogueStringArrays.cavesCamperMore); ++i) {
	 
			dialogueString[i] = global.dialogueStringArrays.cavesCamperMore[i];
	 
		}

	} else {
	
		for (var i = 0; i < array_length(global.dialogueStringArrays.cavesCamperSleep); ++i) {
	 
			dialogueString[i] = global.dialogueStringArrays.cavesCamperSleep[i];
	 
		}
	
	}

}