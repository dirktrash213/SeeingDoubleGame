var _l = array_length(dialogueString);

if count == _l-1 {
	
	with obj_interactable_switch_block_discord {
			
		visible = true;
		triggered = true;
		
	}
	
	with obj_interactable_switch_block_steamPage {
		
		visible = true;
		triggered = true;
		
	}
	
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
		
		global.dialogueVariables.talkedToScaredMiner = true;
		
	}
	
	//Moved to top
	//if room == rm_cave_entrance { 
	//	
	//	with obj_interactable_switch_block_discord {
	//		
	//		visible = true;
	//		triggered = true;
	//		
	//	}
	//	
	//	with obj_interactable_switch_block_steamPage {
	//		
	//		visible = true;
	//		triggered = true;
	//		
	//	}
	//	
	//}
	
	if room == rm_cave_miner { 
		
		global.dialogueVariables.talkedToMiner = true;
		
	}
	
	if room == rm_cave_descentSecret { 
		
		if global.dialogueVariables.talkedToCamper global.dialogueVariables.talkedToCamperTwice = true;
		
		global.dialogueVariables.talkedToCamper = true;
		
	}
	
	if room == rm_cave_spotTheDifference { 
		
		if global.dialogueVariables.talkedToExplorerCave global.dialogueVariables.talkedToExplorerCaveTwice = true;
		
		global.dialogueVariables.talkedToExplorerCave = true;
		
	}
	
	if room == rm_cave_missingMiner { 
		
		global.dialogueVariables.talkedToMinerGroup = true;
		
	}
	
	if room == rm_cave_groundPoundCrystal_highJumpTutorial { 
		
		global.dialogueVariables.talkedToHungryMiner = true;
		
	}
	
	if room == rm_cave_chase_longRun { 
		
		//show_debug_message("grosdiyjtugdersy")
		
		//if global.dialogueVariables.talkedToLostMiner global.dialogueVariables.talkedToLostMinerTwice = true;
		
		//global.dialogueVariables.talkedToLostMiner = true;
		
	}
	
	exit;
	
}



count++;
//@

//For line-specific text display durations/sprite expressions, use below block
if variableTextDisplayDuration {

	switch dialogueString[count] { //Check which dialogue string is currently displaying 
								   //Dialogue strings can be found in the dialogueStrings script
		
		case global.dialogueStringArrays.cavesEntanceExplorer[4]: { 
	      
			alarm[0] = 360;
			
		} break;
		
		case global.dialogueStringArrays.cavesEntanceMiner[1]: { 
	      
			alarm[0] = textDisplayDuration;
			
			with obj_npc_scaredMiner {
		
				sprite_index = spr_npc_scaredMiner_angry;
				jumping = true;
				vspeed = vSpeedAmount;
				gravity = gravAmount;

		
			}
		
		} break;
		
		case global.dialogueStringArrays.cavesEntanceMiner[2]: { 
	      
			alarm[0] = 400;
			
			var _pitch = 3.0;
			
			audio_play_sound(sfx_slice, 1, false, 1.0, 0, _pitch);
			
			with obj_npc_scaredMiner {
		
				sprite_index = spr_npc_scaredMiner_angry_noPickaxe;
				jumping = false;
		
			}
			
			with instance_create_layer(obj_npc_scaredMiner.x, obj_npc_scaredMiner.y, "Instances", obj_background_pickaxe) {
			
				gravity = 0.2;
				speed = 7;
				direction = obj_npc_scaredMiner.image_xscale == -1 ? 45 : 135;
				imageAngleIncreaseAmount = obj_npc_scaredMiner.image_xscale == -1 ? -31 : 31;
			
			}
		
		} break;
		
		case global.dialogueStringArrays.cavesEntanceMiner[3]: { 
	      
			alarm[0] = textDisplayDuration;
			
			with obj_npc_scaredMiner {
		
				sprite_index = spr_npc_scaredMiner_noPickaxe;
				
		
			}
		
		} break;
		
		case global.dialogueStringArrays.cavesEntanceMiner[5]: { 
	      
			alarm[0] = textDisplayDuration;
			
			with obj_npc_scaredMiner {
		
				sprite_index = spr_npc_scaredMiner_noPickaxe_run;
				hspeed = -5;
				lookingAtPlayer = false;
		
			}
		
		} break;
		
		case global.dialogueStringArrays.cavesHungryMiner[1]: { 
	      
			alarm[0] = textDisplayDuration;
			
			with obj_npc_hungryMiner {
		
				sprite_index = spr_npc_hungryMiner;
				lookingAtPlayer = false;
		
			}
		
		} break;
		//@
		case global.dialogueStringArrays.cavesHaunting[1]: {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_pleading;
			
			objBktGlitchDemo.enable_split_screen = false;
			caveGhostIsFar();
			audio_play_sound_on(obj_control.reverb_emitter, sfx_ghost_screamAlerted, false, 1, 0.5, 0, 0.65); 
			
		} break;
		
		case global.dialogueStringArrays.cavesHaunting[2]: {
	      
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
		
		case global.dialogueStringArrays.cavesHauntingNotScammed[7]: {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_pensive;
		
		} break;
		
		case global.dialogueStringArrays.cavesHauntingNotScammed[8]: {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer;
		
		} break;
		
		case global.dialogueStringArrays.cavesHauntingNotScammed[9]: {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_pleadingSweat;
			
			//spawnGoldenParachute();
		
		} break;
		
		case global.dialogueStringArrays.cavesHauntingNotScammed[10]: {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_pleading;
			
			spawnGoldenParachute();
		
		} break;
		
		case global.dialogueStringArrays.cavesHauntingNotScammed[11]: {
	      
			alarm[0] = 360;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_pensive;
			
			setUpSpookyGhostAudio();
			audio_sound_gain(bgm_ghostlyReverberations, 1, 20000);
			audio_sound_gain(bgm_ephemeralEcho, 1, 10000);
			
			//spawnGoldenParachute();
		
		} break;
		
		case global.dialogueStringArrays.cavesHauntingPart2[2]: {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_worried;
		
		} break;
		
		case global.dialogueStringArrays.cavesHauntingPart2[3]: {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_pensive;
			
			spawnGoldenParachute();
		
		} break;
		
		case global.dialogueStringArrays.cavesHauntingPart2[6]: {
	      
			alarm[0] = 300;	
			//obj_npc_scammer_mines.sprite_index = spr_npc_scammer_pensive;
		
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
			
			//fadeInGlitchVFX();
			objBktGlitchDemo.intensityIncrementType = INCREMENT_TYPE.INCREASING_TO_TINY;
			audio_sound_gain(bgm_cursedAtmosphere_LOUD, 1, 10000);
			audio_sound_gain(sfx_glitch_loop2, 0.2, 15000);
			audio_sound_gain(sfx_glitch_loop, 0.25, 15000);
		
		} break;
		
		case global.dialogueStringArrays.cavesHauntingPart2[10]: {
	      
			alarm[0] = 200;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_scared;
			//audio_sound_gain(bgm_cursedAtmosphere_LOUD, 1, 1000);
			//audio_sound_gain(sfx_glitch_loop2, 0.2, 15000);
			//audio_sound_gain(sfx_glitch_loop, 1.0, 15000);
			
			//audio_play_sound(sfx_ghost_whisper, 1, false, 1, 0, 1.0); 
		
		} break;
		
		case global.dialogueStringArrays.cavesHauntingPart2[12]: {
	      
			alarm[0] = 200;
			//obj_npc_scammer_mines.sprite_index = spr_npc_scammer_shocked;
			
			with obj_npc_scammer_mines {
				
				sprite_index = spr_npc_scammer_shocked;
				
				vspeed = -7;
				gravity = gravAmount;
			
			}
			
			audio_play_sound(sfx_whatIsEvenThat, 1, 0);
		
		} break;
		
		case global.dialogueStringArrays.cavesHauntingPart2[13]: {
	      
			alarm[0] = 200;
			obj_npc_scammer_mines.sprite_index = spr_npc_scammer_oops;
		
		} break;
		
		//----------------------------------------------------------
		
		case global.dialogueStringArrays.cavesMetGreenMinerDad[7]: {
	      
			alarm[0] = textDisplayDuration;
			obj_npc_minerGreenDad.lookingAtPlayer = false;
		
		} break;
		
		case global.dialogueStringArrays.cavesMetGreenMinerDad[8]: { //"Did that activate something?"
	      
			obj_interactable_switch_groundPound.inactive = false;
			alarm[0] = textDisplayDuration;
		
		} break;
		
		case global.dialogueStringArrays.cavesWaitingForGhostToLeave[10]: { //"Well, enough yappin'."
	      
			global.dialogueVariables.talkedToLostMinerTwice = true;
			alarm[0] = textDisplayDuration;
		
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





