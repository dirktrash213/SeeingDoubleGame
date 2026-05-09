if global.demoBuild instance_destroy();

if global.dialogueVariables.talkedToScaredMiner instance_destroy();

variableTextDisplayDuration = true;
wrapAmount = 125;
typist.sound(sfx_mouseChirp, false, 0.7, 1.5); 
textDisplayDuration = 360;



for (var i = 0; i < array_length(global.dialogueStringArrays.cavesEntanceMiner); ++i) {

	dialogueString[i] = global.dialogueStringArrays.cavesEntanceMiner[i];

}



