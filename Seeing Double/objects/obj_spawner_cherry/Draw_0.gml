draw_self();

var _offsetY = -30;

draw_set_halign(fa_center);

drawWhiteTextWithBlackOutline(x, y+_offsetY, + string(coinsCollected) + "/" + string(coinsNeeded));

draw_set_halign(fa_left);
