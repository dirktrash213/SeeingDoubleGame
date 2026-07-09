if global.dialogueVariables.talkedToSmallGhostTwice instance_destroy();

wrapAmount = 160;
typist.sound(sfx_mouseChirp, false, 0.2, 0.1); 

if !global.dialogueVariables.talkedToSmallGhost {

	dialogueString[0] = "Have you seen the ghost that haunts these woods?"
	dialogueString[1] = "I hear she comes around this area on occasion."
	dialogueString[2] = "Rumors, to be sure. But... to see a real ghost!"
	dialogueString[3] = "They say she has a strange fascination with flowers."
	dialogueString[4] = "I would give her some, if I had the right ones."
	dialogueString[5] = "If you see her, would you do so?"

} else {

	dialogueString[0] = "Heh. Ghosts. You'd be crazy for believing in that nonsense, right?"
	//dialogueString[1] = "That's what I thought at first."
	//dialogueString[1] = "Anyways. I should get back home. My wife's been worried sick."
	//dialogueString[2] = "Can't wait to see junior too. That little green bundle of joy."

}