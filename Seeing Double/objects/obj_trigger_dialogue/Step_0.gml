if global.paused {
	
	alarm[0] = alarm[0]+1;
	
	exit;
	
}

//Special cases

if global.dialogueVariables.beatMinigame && room == rm_forest_canopyUpperFloor_enemyMinigames && !specialDialogueTriggered && allowSpecialDialogue {

	specialDialogueTriggered = true;
	
	count = 0;
	alarm[0] = textDisplayDuration;
	
	dialogueString = [];

	dialogueString[0] = "[rainbow]Congratulations![/rainbow] Quite the problem solver you are! Here is your wonderful prize!"
	//dialogueString[1] = "Enjoy this state of the art parachute. And no refunds!"
	//dialogueString[2] = "This is even more sample dialogue."

}

if !global.gotScammed && global.dialogueVariables.boughtParachuteFromScammer && room == rm_forest_canopyUpperFloor_jumpBackDown {

	global.gotScammed = true;
	
	count = 0;
	alarm[0] = textDisplayDuration;
	
	dialogueString = [];

	dialogueString[0] = "Wisely bought, my guy! I knew you were a smart one."
	dialogueString[1] = "Enjoy this state of the art parachute. And no refunds!"
	//dialogueString[2] = "This is even more sample dialogue."

}

if global.dialogueVariables.solvedForestPuzzle && room == rm_forest_spotTheDifference && !specialDialogueTriggered {

	specialDialogueTriggered = true;

	count = 0;
	//alarm[0] = textDisplayDuration;
	alarm[0] = -1;
	triggered = false;
	
	dialogueString = [];

	//dialogueString[0] = "Ah! What fortioutous luck! The way ahead is clear!"
	//dialogueString[1] = "I mustn't keep the missus waiting any longer. Oh how she shines a light into my heart!"
	dialogueString[0] = "Aha! The way ahead is clear! My sleuthing skills save the day!"
	dialogueString[1] = "I mustn't keep the missus waiting any longer. Oh how she shines a light into my heart!"

}