variableTextDisplayDuration = true;
wrapAmount = 125;
typist.sound(sfx_mouseChirp, false, 0.7, 1.5); 
textDisplayDuration = 360;


if !global.groundPoundActive {

	for (var i = 0; i < array_length(global.dialogueStringArrays.cavesMinerByScienceJuice); ++i) {
 
		dialogueString[i] = global.dialogueStringArrays.cavesMinerByScienceJuice[i];
 
	}

} else {

	for (var i = 0; i < array_length(global.dialogueStringArrays.cavesMinerByScienceJuiceShocked); ++i) {
 
		dialogueString[i] = global.dialogueStringArrays.cavesMinerByScienceJuiceShocked[i];
 
	}

}

triggerID = "caveScienceJuice";