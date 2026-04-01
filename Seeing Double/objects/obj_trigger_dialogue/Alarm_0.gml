var _l = array_length(dialogueString);

if count == _l-1 {
	
	//Edge cases
	if room == rm_hills_secretKeyCard {
		
		if global.dialogueVariables.talkedToSmallGhost global.dialogueVariables.talkedToSmallGhostTwice = true;
		
		global.dialogueVariables.talkedToSmallGhost = true;
		
	}
	
	if room == rm_forest_treeBase {
		
		if global.dialogueVariables.talkedToGreenBrother global.dialogueVariables.talkedToGreenBrotherTwice = true;
		
		global.dialogueVariables.talkedToGreenBrother = true;
		
	}
	
	if room == rm_forest_canopyUpperFloor_enemyJumpTutorial {
		
		global.dialogueVariables.talkedToCrazyGuy = true;
		
	}
	
	if room == rm_forest_canopyUpperFloor_jumpBackDown {
		
		if global.dialogueVariables.talkedToScammerTwice {
			
			global.dialogueVariables.talkedToScammerThrice = true;
			
			with obj_interactable_switch_block_shop {
				
				itemPrice = 99;
				itemPriceText = "99[spr_interactable_coin]";
				
			}
			
		}
		
		if global.dialogueVariables.talkedToScammer global.dialogueVariables.talkedToScammerTwice = true;
		
		global.dialogueVariables.talkedToScammer = true;
		
	}
	
	if room == rm_forest_spotTheDifference { 
		
		if global.dialogueVariables.talkedToExplorer global.dialogueVariables.talkedToExplorerTwice = true;
		
		global.dialogueVariables.talkedToExplorer = true;
		
	}
	
	if room == rm_cave_entrance { 
		
		with obj_interactable_switch_block_discord {
			
			visible = true;
			triggered = true;
			
		}
		
		with obj_interactable_switch_block_steamPage {
			
			visible = true;
			triggered = true;
			
		}
		
	}
	
	if room == rm_cave_miner { 
		
		global.dialogueVariables.talkedToMiner = true;
		
	}
	
	if room == rm_cave_descentSecret { 
		
		if global.dialogueVariables.talkedToCamper global.dialogueVariables.talkedToCamperTwice = true;
		
		global.dialogueVariables.talkedToCamper = true;
		
	}
	
	if room == rm_cave_missingMiner { 
		
		global.dialogueVariables.talkedToMinerGroup = true;
		
	}
	
	if room == rm_cave_groundPoundCrystal_highJumpTutorial { 
		
		global.dialogueVariables.talkedToHungryMiner = true;
		
	}
	
	exit;
	
}



count++;
//@

if variableTextDisplayDuration {

	switch dialogueString[count] {
		
		case "Well, on the bright side, at least I won't run into that blue sucker I scammed in the forest. Heh, what a grade-A sap...": {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_pleading;
		
		} break;
		
		case "Oh... it's just a pretty little lady. Well how do [slant]you[/slant] do, ma'am? Lookin' to buy some authentic jewelry?": {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer;
		
		} break;
		
		case "Hm? What's that? Bluey was your husband? And you overheard what I said about scamming him?": {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_pensive;
		
		} break;
			
		case "HA! So [slant]what[/slant] if I did? Sorry to break it to ya, missy, but all sales are final! He can chalk it up as a learning experience!": {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_laugh;
		
		} break;
		
		case "Oh, what now? What are you gonna do, [c_orange]pound[/color] the money out of me!? I'd like to see you try!!": {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer;
		
		} break;
	
		default: {
		
			//show_debug_message("Default duration value")
			alarm[0] = textDisplayDuration;
	
		} break;
	
	}

} else {

	//show_debug_message("No variable text duration")
	alarm[0] = textDisplayDuration;

}





