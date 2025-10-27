if global.splitScreenActive {

	var _x = 720;
	var _y = 0;
	
	var _xScale = 10;
	var _yScale = 1000;

	//FPS is controlled via spr_UI_box
	draw_sprite_ext(spr_UI_screenDivider, image_index, _x, _y, _xScale, _yScale, 0, c_white, 1.0);


} else {

	if obj_cutsceneSystem.cutsceneState == SPLIT_SCREEN_CUTSCENE_STATE.DIVIDER_DESCENDING {

		var _x = 720;
		var _y = 0;
	
		var _xScale = 10;
		var _yScale = 0;

		draw_sprite_ext(spr_UI_screenDivider, image_index, _x, _y, _xScale, dividerYscale, 0, c_white, 1.0);
		
		dividerYscale += dividerYscaleIncreaseAmount;
		
		var _yScaleMax = 800;
		
		dividerYscale = min(dividerYscale, _yScaleMax);
		
		if dividerYscale >= _yScaleMax {
		
			global.splitScreenActive = true;
			obj_cutsceneSystem.cutsceneState = SPLIT_SCREEN_CUTSCENE_STATE.FADING_OUT_WHITE;
			obj_background_fadeToWhite.fadingOut = true;
			global.cutsceneActive = false;
			global.playerControl = true;
			instance_create_layer(100, 100, "Instances", obj_player_patter);
			view_visible[1] = true;
			
			with obj_spawner {
			
				instance_create_layer(x,y, "Instances", obj_block_wall_semiSolid);
			
			}
			
			instance_destroy(obj_trigger_cutscene);
			
			if !audio_is_playing(bgm_inSync) audio_play_sound(bgm_inSync, 1, 1);
		
		}

	}


}

drawPauseMenu();