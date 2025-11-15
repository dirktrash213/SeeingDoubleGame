if global.paused {
	
	alarm[0] = alarm[0]+1;
	
	exit;
	
}

//Special cases

if !global.gotScammed && global.dialogueVariables.boughtParachuteFromScammer {

	global.gotScammed = true;
	
	count = 0;
	alarm[0] = textDisplayDuration;
	
	dialogueString = [];

	dialogueString[0] = "Aha! Wisely bought, my guy! I knew you were a smart one."
	dialogueString[1] = "Enjoy this state of the art parachute. And no refunds!"
	//dialogueString[2] = "This is even more sample dialogue."

}