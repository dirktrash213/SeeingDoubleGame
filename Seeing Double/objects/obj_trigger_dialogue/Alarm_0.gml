var _l = array_length(dialogueString);

if count == _l-1 {
	
	if room == rm_forest_treeBase {
		
		if global.dialogueVariables.talkedToGreenBrother global.dialogueVariables.talkedToGreenBrotherTwice = true;
		
		global.dialogueVariables.talkedToGreenBrother = true;
		
	}
	
	exit;
	
}

count++;

alarm[0] = textDisplayDuration;





