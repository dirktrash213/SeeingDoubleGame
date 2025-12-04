//dialogueString = "Have you seen my little brother?"
//dialogueString = "Have you seen my little brother? He hasn't come back from the hills."
if !global.dialogueVariables.talkedToGreenBrother {

//dialogueString[0] = "Have you seen my little bro, mister?"
dialogueString[0] = "Have you seen my papa, mister?"
dialogueString[1] = "He ain't came back from the hills."
dialogueString[2] = "Mama said there's spikes there."
//dialogueString[3] = "I told him not to go, but he didn't listen."
dialogueString[3] = "I begged him not to go, but he didn't listen."
dialogueString[4] = "Please mister. I'm mighty worried about him."

} else {

	if !global.dialogueVariables.talkedToGreenBrotherTwice {

		//dialogueString[0] = "Please mister. Have you seen him?"
		dialogueString[0] = "Please mister. Please tell me he's ok."
	
	} else {
	
		dialogueString[0] = "..."
	
	}

}