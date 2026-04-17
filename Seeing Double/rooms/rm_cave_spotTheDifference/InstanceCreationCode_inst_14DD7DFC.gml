//if global.dialogueVariables.solvedForestPuzzle instance_destroy();
if global.solvedCavePuzzle instance_destroy();

wrapAmount = 125;
typist.sound(sfx_mouseChirp, false, 0.5, 0.7); 

if !global.dialogueVariables.talkedToExplorerCave {

	for (var i = 0; i < array_length(global.dialogueStringArrays.cavesSolvingSpotTheDifference); ++i) {
	 
		dialogueString[i] = global.dialogueStringArrays.cavesSolvingSpotTheDifference[i];
	 
	}
	
} else { 
	
	if !global.dialogueVariables.talkedToExplorerCaveTwice {
	
		for (var i = 0; i < array_length(global.dialogueStringArrays.cavesSpotTheDifferenceHint); ++i) {
	
			dialogueString[i] = global.dialogueStringArrays.cavesSpotTheDifferenceHint[i];
	
		}
	
	} else {
	
		for (var i = 0; i < array_length(global.dialogueStringArrays.cavesSpotTheDifferenceHint2); ++i) {
	
			dialogueString[i] = global.dialogueStringArrays.cavesSpotTheDifferenceHint2[i];
	
		}
	
	}
	
}