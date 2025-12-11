//if global.dialogueVariables.solvedForestPuzzle instance_destroy();
if global.solvedForestPuzzle instance_destroy();

wrapAmount = 125;
typist.sound(sfx_mouseChirp, false, 0.5, 0.7); 

if !global.dialogueVariables.talkedToExplorer {

	dialogueString[0] = "How strange... This wasn't here earlier.";
	dialogueString[1] = "The way ahead appears to be blocked by some odd mechanism.";
	//dialogueString[2] = "This wasn't here earlier.";
	dialogueString[2] = "Could it be some sort of puzzle? How annoying... I'm going to be late for supper...";
	dialogueString[3] = "But perhaps there are some clues nearby in the environment?";
	//dialogueString[4] = "Yes, yes indeed. There must be a clue close by. I should keep a keen eye open.";
	dialogueString[4] = "Yes, yes indeed. I should keep a keen eye open for anything that stands out.";
	
} else { 
	
	if !global.dialogueVariables.talkedToExplorerTwice {
	
		//dialogueString[0] = "Hmmmm... perhaps there are some clues nearby in the environment?";
		//dialogueString[1] = "Yes, yes indeed. There must be something close by. I should keep a keen eye open.";
		dialogueString[0] = "I wonder... those ruins... could it be there?";
		//dialogueString[1] = "Yes, yes indeed. There must be something close by. I should keep a keen eye open.";
	
	} else {
	
		//dialogueString[0] = "Hmmmm... now that I think of it, that tree back there seemed a little... off.";
		dialogueString[0] = "Hmmmm... now that I think of it, one of those pillars back there did seem a little... off.";
	
	}
	
}