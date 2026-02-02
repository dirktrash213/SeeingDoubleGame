wrapAmount = 150;
typist.sound(sfx_mouseChirp, false, 0.8, 1.2); 

//textDisplayDuration = 360;
textDisplayDuration = 300;

if !global.dialogueVariables.beatCaveMinigame {

	dialogueString[0] = "Come one, come all! Step right up! Try your hand at our game!";
	dialogueString[1] = "What is the game this time? Easy! Feast your eyes upon the [rainbow][wave]MYSTERY MAZE!";
	dialogueString[2] = "All you need to do is make your way to the top and claim your wild prizes!";

} else {

	dialogueString[0] = "Thank you for playing! We'll meet again, I'm sure!";

}