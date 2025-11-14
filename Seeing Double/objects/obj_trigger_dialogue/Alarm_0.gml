var _l = array_length(dialogueString);

if count == _l-1 {
	
	if room == rm_forest_treeBase {
		
		if global.dialogueVariables.talkedToGreenBrother global.dialogueVariables.talkedToGreenBrotherTwice = true;
		
		global.dialogueVariables.talkedToGreenBrother = true;
		
	}
	
	if room == rm_forest_canopyUpperFloor_jumpBackDown {
		
		if global.dialogueVariables.talkedToScammerTwice global.dialogueVariables.talkedToScammerThrice = true;
		
		if global.dialogueVariables.talkedToScammer global.dialogueVariables.talkedToScammerTwice = true;
		
		global.dialogueVariables.talkedToScammer = true;
		
	}
	
	exit;
	
}

count++;

alarm[0] = textDisplayDuration;





