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

//For line-specific text display durations/sprite expressions, use below block
if variableTextDisplayDuration {

	switch dialogueString[count] { //Check which dialogue string is currently displaying
		
		case global.dialogueStringArrays.cavesHaunting[2]: { //Dialogue strings can be found in the dialogueStrings script
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_pleading;
		
		} break;
		
		case global.dialogueStringArrays.cavesHaunting[5]: {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer;
		
		} break;
		
		case global.dialogueStringArrays.cavesHaunting[6]: {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_pensive;
		
		} break;
			
		case global.dialogueStringArrays.cavesHaunting[7]: {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_laugh;
		
		} break;
		
		case global.dialogueStringArrays.cavesHaunting[8]: {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer;
		
		} break;
		
		case global.dialogueStringArrays.cavesHauntingPart2[2]: {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_worried;
		
		} break;
		
		case global.dialogueStringArrays.cavesHauntingPart2[3]: {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_pensive;
			
			with instance_create_layer(obj_npc_scammer_mines.x, obj_npc_scammer_mines.y, "Collectables", obj_pickup_parachute_gold) {
			
				speed = 3.5;
				direction = 135;
				gravity = 0.25;
			
			}
		
		} break;
		
		case global.dialogueStringArrays.cavesHauntingPart2[7]: {
	      
			alarm[0] = 260;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_laugh;
		
		} break;
		
		case global.dialogueStringArrays.cavesHauntingPart2[8]: {
	      
			alarm[0] = 90;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_pensive;
		
		} break;
		
		case global.dialogueStringArrays.cavesHauntingPart2[9]: {
	      
			alarm[0] = 200;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_eyebrowRaise;
		
		} break;
		
		case global.dialogueStringArrays.cavesHauntingPart2[10]: {
	      
			alarm[0] = 200;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_scared;
		
		} break;
		
		case global.dialogueStringArrays.cavesHauntingPart2[13]: {
	      
			alarm[0] = 200;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_oops;
		
		} break;
		
		//case global.dialogueStringArrays.cavesHauntingPart2[11]: {
	    //  
		//	alarm[0] = textDisplayDuration;
		//	obj_npc_scammer_mines.sprite_index = spr_npc_scammer_run_scared;
		//
		//} break;
		
		default: {
		
			//show_debug_message("Default duration value")
			alarm[0] = textDisplayDuration;
	
		} break;
	
	}

} else {

	//show_debug_message("No variable text duration")
	alarm[0] = textDisplayDuration;

}





