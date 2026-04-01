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

	dialogueString[0] = "[rainbow]Congratulations![/rainbow] Quite the problem solver you are! Here is your wonderful prize!";
	//dialogueString[1] = "Enjoy this state of the art parachute. And no refunds!"
	//dialogueString[2] = "This is even more sample dialogue."

}

//show_debug_message("global.dialogueVariables.beatCaveMinigame:" + string(global.dialogueVariables.beatCaveMinigame))
//show_debug_message("room:" + string(room == rm_cave_maze))
//show_debug_message("specialDialogueTriggered:" + string(specialDialogueTriggered))
//show_debug_message("allowSpecialDialogue:" + string(allowSpecialDialogue))

if global.dialogueVariables.beatCaveMinigame && room == rm_cave_maze && !specialDialogueTriggered && allowSpecialDialogue {

	specialDialogueTriggered = true;
	
	count = 0;
	alarm[0] = textDisplayDuration;
	
	dialogueString = [];
	

	dialogueString[0] = x < 500 ?  "[rainbow]Congratulations![/rainbow] That maze was child's play!" : "What!? Ya [slant]solved it!?[/slant] Bah! Lucky!";

}

if !global.gotScammed && global.dialogueVariables.boughtParachuteFromScammer && room == rm_forest_canopyUpperFloor_jumpBackDown {

	global.gotScammed = true;
	
	if (count == 5 || global.dialogueVariables.talkedToScammer) {
	
		
		count = 0;
		alarm[0] = textDisplayDuration;
	
		dialogueString = [];

		dialogueString[0] = "Wisely bought, my guy! I knew you were a smart one."
		dialogueString[1] = "Enjoy this state of the art parachute, which! May I reiterate! Is [slant]absolutely unbreakable.[/slant] And no refunds!"
	
	} else {
	
		count = 0;
		alarm[0] = textDisplayDuration;
	
		dialogueString = [];

		dialogueString[0] = "Wow, guy! You went and bought that parachute before I could even finish selling you it!"
		dialogueString[1] = "Enjoy this unbreakable parachute, you go-getter! And no refunds!"
	
	}

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
	//dialogueString[1] = "I mustn't keep the missus waiting any longer. Oh how she shines a light into my heart!"

}

if global.dialogueVariables.eatenCaveCherry && room == rm_cave_groundPoundCrystal_highJumpTutorial && !specialDialogueTriggered && eatenCaveCherry {

	//show_debug_message("cave cherry step dialogue triggered")
	
	specialDialogueTriggered = true;

	count = 0;
	alarm[0] = textDisplayDuration;
	//triggered = false;
	
	dialogueString = [];

	dialogueString[0] = "NOOOO!! How could you!?";

}