if !global.coopActive exit;

if triggered exit;

triggered = true;

//other.faceDir = -1;
if patterPlayerIsPresent() obj_player_patter.faceDir = 1;

global.currentCutsceneID = cutsceneID;	
obj_cutsceneSystem.alarm[0] = delay;	
	














