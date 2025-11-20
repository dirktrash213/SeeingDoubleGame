if triggered || other.object_index == obj_player_patter exit;

triggered = true;

other.x = x;

activateCutscene();



global.currentCutsceneID = CUTSCENE_ID.DOUBLE_JUMP_BARREL;
obj_cutsceneSystem.cutsceneState = DOUBLE_JUMP_BARREL_CUTSCENE_STATE.SOAKING;

obj_cutsceneSystem.alarm[1] = soakDuration;
