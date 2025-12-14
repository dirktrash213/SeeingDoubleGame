wrapAmount = 150;
typist.sound(sfx_mouseChirp, false, 0.8, 1.2); 

//textDisplayDuration = 360;
textDisplayDuration = 300;

if !global.dialogueVariables.beatMinigame {

	dialogueString[0] = "Come one, come all! Step right up! Try your hand at our game!";
	dialogueString[1] = "What is the game, you ask? Simple! Look up at this handsome blue fellow!";
	dialogueString[2] = "All you need to do is guide him through the course to the blue outline!";
	//dialogueString[3] = "If he gets stuck, simply hit our patented [wave]RESET BUTTON (TM)[/wave] to start over!";
	dialogueString[3] = "If he gets stuck, simply hit our patented [wave][spr_interactable_switch_resetMinigame]ESET BUTTON[/wave] to start over!";
	//dialogueString[4] = "Go on! Guide him to the blue outline! You can do it!";

} else {

	dialogueString[0] = "Thank you for playing! We'll meet again, I'm sure!";

}