wrapAmount = 130;
typist.sound(sfx_mouseChirp, false, 0.8, 1.2); 

//textDisplayDuration = 360;
textDisplayDuration = 240;

if !global.dialogueVariables.eatenCaveCherry {
	
	if !global.dialogueVariables.talkedToHungryMiner {

		dialogueString[0] = "Hey! [shake]Back off[/shake], thief! I saw it first!!";
		dialogueString[1] = "Oh delicious cherry! Won't you be a good girl and come down? [wave]Pretty please?";
		dialogueString[2] = "Try as I may, I simply can't reach you. Not even with my double jump!";
		dialogueString[3] = "If only there was a way to gain a little more height, then I'd feast on your succulent red innards...";
	
	} else {
	
		dialogueString[0] = "More height! I need more height! How irritating! It makes me want to [shake]pound the ground[/shake] in anger!";
	
	}

} else {

	dialogueString[0] = "I would have gotten it eventually...";

}