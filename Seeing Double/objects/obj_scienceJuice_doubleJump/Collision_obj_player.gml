//if triggered || other.object_index == obj_player_patter exit;
if triggered exit;

if !global.coopActive && other.object_index == obj_player_patter exit;

triggered = true;

if global.coopActive {

	if x > global.patterOffsetX {
	
		obj_player_pitter.x = x - global.patterOffsetX;
		obj_player_pitter.y = y;
		
		obj_player_patter.x = x;
		obj_player_patter.y = y;
	
	} else {
	
		obj_player_pitter.x = x;
		obj_player_pitter.y = y;
		
		obj_player_patter.x = x + global.patterOffsetX;
		obj_player_patter.y = y;
	
	}

} else {

	other.x = x;

}

activateCutscene();



global.currentCutsceneID = CUTSCENE_ID.DOUBLE_JUMP_BARREL;
obj_cutsceneSystem.cutsceneState = DOUBLE_JUMP_BARREL_CUTSCENE_STATE.SOAKING;

obj_cutsceneSystem.alarm[1] = soakDuration;



