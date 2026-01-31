wrapAmount = 155;
typist.sound(sfx_mouseChirp, false, 0.7, 0.5); 
textDisplayDuration = 260;

if !global.dialogueVariables.talkedToMiner {

	if !global.foundRose {

		dialogueString[0] = "There be somethin' strange 'bout this place.";
		dialogueString[1] = "Miners be vanishin' without a trace lately, aye.";
		dialogueString[2] = "And some even talk of a scupperin' [slant]ghost[/slant] roamin' the forests.";
		dialogueString[3] = "Now, I ain't one for superstitions. But, laddie, I hafta be honest...";
		dialogueString[4] = "Lately it be feelin' like this whole damn island's cursed.";
		//dialogueString[4] = "It be feelin' as if this whole damn island is cursed.";
	
	} else {
	
		dialogueString[0] = "That be a lovely flower ye got there, laddie.";
		dialogueString[1] = "I'd hold onto that. They say flowers hold powerful memories.";
		dialogueString[2] = "Aye, well [slant]some[/slant] say that. I think it's a bucket o' bilgewater.";
	
	}
	
} else { 
	
	dialogueString[0] = "Leave me be.";
	
}