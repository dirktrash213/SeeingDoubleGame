if !textAppearing exit;
if textFinishedAppearing exit;

var _hideText = scribble("HIDE.");

_hideText.starting_format("font_pauseMenu", c_white);
//_hideText.wrap(335); 
_hideText.align(fa_center, fa_top); 

var _x = 1100;
var _y = 100;

//var _offsetX = 0;
//var _offsetY = 150;

_hideText.draw(_x, _y, typist);
//_hideText.draw(_x + _offsetX, _y + _offsetY, typist);



