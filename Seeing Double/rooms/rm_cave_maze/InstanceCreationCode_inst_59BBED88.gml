wrapAmount = 150;
typist.sound(sfx_mouseChirp, false, 0.8, 1.2); 

//textDisplayDuration = 360;
textDisplayDuration = 300;

if !global.dialogueVariables.beatCaveMinigame {

	dialogueString[0] = "Bah! Stupid maze. I bet the prize ain't even good.";
	dialogueString[1] = "I ain't no spring chicken! How's I supposed to make some them jumps?";
	dialogueString[2] = "And, come to think of it, who's this circus bloke anyhow!? What's he even doin' down way here?";
	dialogueString[3] = "Bah! Nonsense.";

} else {

	dialogueString[0] = "Bah!";

}