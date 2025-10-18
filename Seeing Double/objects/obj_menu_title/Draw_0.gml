checkForMenuInput();

var _newGameTextFinishedTyping = typist.get_state();

//show_debug_message(_newGameTextFinishedTyping)

//var _a = "[rainbow]";
var _a = "";
var _b = "";

if typingNewGame {

	var _newGameText = scribble(_a + "[wave]New Game");
	
	_newGameText.starting_format("font_titleMenu", c_white);
	_newGameText.wrap(335); 
	_newGameText.align(fa_center, fa_top); 
	
	//_newGameText.draw(room_width/2, room_height/2, typist);
	_newGameText.draw(215, 85, typist);
	
	

}

if typingContinue {

	var _continueText = scribble("Continue");

}

if confirm && _newGameTextFinishedTyping >= 1 && global.titleScreenCutsceneState == TITLE_SCREEN_CUTSCENE_STATE.ON_MENU {
	
	var _delayUntilCutsceneBegins = 60;

	typingNewGame = false;
	global.titleScreenCutsceneState = TITLE_SCREEN_CUTSCENE_STATE.PAD_WARMING_UP;
	obj_control.alarm[1] = _delayUntilCutsceneBegins;

}
