if global.verticalLevel {

	if obj_player_pitter.binocularsActive && x < global.patterOffsetX exit;
	if obj_player_patter.binocularsActive && x > global.patterOffsetX exit;

} else {

	if obj_player_pitter.binocularsActive && y < global.patterOffsetY exit;
	if obj_player_patter.binocularsActive && y > global.patterOffsetY exit;

}

draw_self();






