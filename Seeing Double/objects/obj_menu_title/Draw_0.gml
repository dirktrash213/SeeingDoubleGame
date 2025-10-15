var _a = "[rainbow]";
var _b = "";

if typingNewGame {

	var _newGameText = scribble(_a + "New Game");
	
	_newGameText.starting_format("font_titleMenu", c_white);
	_newGameText.wrap(335); 
	_newGameText.align(fa_center, fa_top); 
	
	//_newGameText.draw(room_width/2, room_height/2, typist);
	_newGameText.draw(215, 85, typist);

}

if typingContinue {

	var _continueText = scribble("Continue");

}


