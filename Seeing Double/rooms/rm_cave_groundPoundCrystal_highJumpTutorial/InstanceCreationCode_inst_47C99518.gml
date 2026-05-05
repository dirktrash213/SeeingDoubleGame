wrapAmount = 130;
typist.sound(sfx_mouseChirp, false, 0.8, 1.2); 
variableTextDisplayDuration = true;
//textDisplayDuration = 360;
textDisplayDuration = 300;

if !global.dialogueVariables.eatenCaveCherry {
	
	if !global.dialogueVariables.talkedToHungryMiner {

		for (var i = 0; i < array_length(global.dialogueStringArrays.cavesHungryMiner); ++i) {
	 
			dialogueString[i] = global.dialogueStringArrays.cavesHungryMiner[i];
	 
		}
	
	} else {
	
		for (var i = 0; i < array_length(global.dialogueStringArrays.cavesHungryMinerHint); ++i) {
	 
			dialogueString[i] = global.dialogueStringArrays.cavesHungryMinerHint[i];
	 
		}
	
	}

} else {

	for (var i = 0; i < array_length(global.dialogueStringArrays.cavesHungryMinerSad); ++i) {
	 
		dialogueString[i] = global.dialogueStringArrays.cavesHungryMinerSad[i];
	 
	}

}