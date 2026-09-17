//draw_set_color(c_white);
//draw_text(32, 32, "Elapsed Time: " + global.gameTimeString);

var _GUIcenterX = 720;
var _GUIcenterY = 405;

if global.displayGameTime {

	var _oldFont = draw_get_font();
	draw_set_font(font_scoreUI);
	
	var _offsetY = 0;
	
	//if global.playerControl && !global.paused && !global.cutsceneActive && global.scoreUIenabled _offsetY = 70;
	if global.playerControl && !global.cutsceneActive && global.scoreUIenabled _offsetY = 70;
	
	drawWhiteTextWithBlackOutline(0, _offsetY, "[spr_icon_clock_x2]" + global.gameTimeString);
	
	if showingBlinkingSpeedrunText drawWhiteTextWithBlackOutline(0, _offsetY + 30, blinkingSpeedrunText);
	
	draw_set_font(_oldFont);

}

if global.coopActive && global.coopDetectingPlayer2Input && global.splitScreenActive && !global.paused {

	var _oldFont = draw_get_font();
	draw_set_font(font_scoreUI);
	
	draw_set_halign(fa_center)
	
	drawWhiteTextWithBlackOutline(_GUIcenterX + (_GUIcenterX/2), _GUIcenterY - (_GUIcenterY*0.8), "Detecting input. \nPress a button on the controller \nor connect via Steam Remote Play.");

	draw_set_font(_oldFont);
	draw_set_halign(fa_left);

}

//if global.playerControl && !global.paused && !global.cutsceneActive && global.scoreUIenabled {
if global.playerControl && !global.cutsceneActive && global.scoreUIenabled {

	var _oldFont = draw_get_font();
	draw_set_font(font_scoreUI);
	
	var _parachuteString = "";
	
	if pitterPlayerIsPresent() {
	
		if obj_player_pitter.wearingParachute _parachuteString = "\n[spr_parachute_32x32]PARACHUTE STATUS: NEW";
		if obj_player_pitter.wearingBrokenParachute {
			
			if room == rm_forest_parachuteFallingArea
			|| room == rm_forest_canopyUpperFloor_jumpBackDown {
				
				_parachuteString = "\n[spr_parachute_broken_32x32]PARACHUTE STATUS: [shake]BROKEN![/shake]";
				
			} else {
			
				_parachuteString = "\n[spr_parachute_broken_32x32]PARACHUTE STATUS: BROKEN";
			
			}
			
		}
		
		
		//if obj_player_pitter.wearingParachute _parachuteString = "\n[spr_parachute_32x32]PARACHUTE HP: 1,000,000/1,000,000";
		//if obj_player_pitter.wearingBrokenParachute _parachuteString = "\n[spr_parachute_broken_32x32][shake]PARACHUTE HP: 0/1,000,000![/shake]";
	
	}
	
	//drawWhiteTextWithBlackOutline(0, 0, "[spr_interactable_coin_x2]" + string(global.coinCount) + "\n[spr_interactable_cherry_x2]" + string(global.cherryCount) + _parachuteString);
	drawWhiteTextWithBlackOutline(0, 0, "[spr_interactable_coin_x2]" + string(global.coinCount) + "\n[spr_interactable_cherry_x2]" + string(global.cherryCount) + "/" + string(global.cherryMax) + _parachuteString);
	
	var _offsetX = 295;
	var _offsetY = 335;
	
	if pitterPlayerIsPresent() {
		
		if obj_player_pitter.binocularsActive {
	
			var _binoculars = instance_nearest(obj_player_pitter.x, obj_player_pitter.y, obj_interactable_binoculars);
	
			if _binoculars.cameraMoveAmount > 0 draw_sprite(spr_background_camera_arrow_left, image_index, (_GUIcenterX - (_GUIcenterX/2)) - _offsetX, _GUIcenterY);
			if _binoculars.cameraMoveAmount < _binoculars.cameraMoveAmountMax draw_sprite(spr_background_camera_arrow_right, image_index, (_GUIcenterX - (_GUIcenterX/2)) + _offsetX, _GUIcenterY);
			
			if _binoculars.cameraMoveAmountVerticalMax > 0 {
			
				if _binoculars.cameraMoveAmountVertical > _binoculars.cameraMoveAmountVerticalMin draw_sprite(spr_background_camera_arrow_up, image_index, (_GUIcenterX - (_GUIcenterX/2)), _GUIcenterY - _offsetY);
				if _binoculars.cameraMoveAmountVertical < _binoculars.cameraMoveAmountVerticalMax draw_sprite(spr_background_camera_arrow_down, image_index, (_GUIcenterX - (_GUIcenterX/2)), _GUIcenterY + _offsetY);
	
			}
	
			if global.input_source == 0 drawWhiteTextWithBlackOutline(_GUIcenterX - (_GUIcenterX/2) - 100, _GUIcenterY + (_GUIcenterY * 0.825), "[spr_background_controlsDisplay_spacebar_big] to cancel")
			if global.input_source > 0 drawWhiteTextWithBlackOutline(_GUIcenterX - (_GUIcenterX/2) - 100, _GUIcenterY + (_GUIcenterY * 0.825), "[spr_background_controlsDisplay_face1_big] to cancel")
	
			//drawWhiteTextWithBlackOutline(0, 300, _binoculars.cameraMoveAmount); //TEMP
			//drawWhiteTextWithBlackOutline(0, 400, _binoculars.cameraMoveAmountVertical); //TEMP
	
		}
	
	}
	
	if patterPlayerIsPresent() {
	
		if obj_player_patter.binocularsActive {
			
			var _binoculars = instance_nearest(obj_player_patter.x, obj_player_patter.y, obj_interactable_binoculars);
	
			if _binoculars.cameraMoveAmount > 0 draw_sprite(spr_background_camera_arrow_left, image_index, (_GUIcenterX + (_GUIcenterX/2)) - _offsetX, _GUIcenterY);
			if _binoculars.cameraMoveAmount < _binoculars.cameraMoveAmountMax draw_sprite(spr_background_camera_arrow_right, image_index, (_GUIcenterX + (_GUIcenterX/2)) + _offsetX, _GUIcenterY);
	
			if _binoculars.cameraMoveAmountVerticalMax > 0 {
			
				if _binoculars.cameraMoveAmountVertical > _binoculars.cameraMoveAmountVerticalMin draw_sprite(spr_background_camera_arrow_up, image_index, (_GUIcenterX + (_GUIcenterX/2)), _GUIcenterY - _offsetY);
				if _binoculars.cameraMoveAmountVertical < _binoculars.cameraMoveAmountVerticalMax draw_sprite(spr_background_camera_arrow_down, image_index, (_GUIcenterX + (_GUIcenterX/2)), _GUIcenterY + _offsetY);
	
			}
	
			if global.input_source == 0 drawWhiteTextWithBlackOutline(_GUIcenterX + (_GUIcenterX/2) - 100, _GUIcenterY + (_GUIcenterY * 0.825), "[spr_background_controlsDisplay_spacebar_big] to cancel")
			if global.input_source > 0 drawWhiteTextWithBlackOutline(_GUIcenterX + (_GUIcenterX/2) - 100, _GUIcenterY + (_GUIcenterY * 0.825), "[spr_background_controlsDisplay_face1_big] to cancel")
	
		}
	
	}
	
	draw_set_font(_oldFont);

}

if global.splitScreenActive {

	var _x = 720;
	var _y = 0;
	
	var _xScale = 10;
	var _yScale = 1000;

	//FPS is controlled via spr_UI_box
	if canDrawDivider draw_sprite_ext(spr_UI_screenDivider, image_index, _x, _y, _xScale, _yScale, 0, c_white, 1.0);


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
			instance_create_layer(200, 500, "Instances", obj_player_patter); //Wow. This code sucks.
			view_visible[1] = true;
			
			if !global.coopActive {
			
				with obj_spawner {
			
					instance_create_layer(x,y, "Instances", obj_block_wall_semiSolid);
				
					show_debug_message("semisolid wall created")
			
				}
			
				instance_create_layer(272, 160, "Instances", obj_block_wall_semiSolid);
			
			}
			
			instance_destroy(obj_trigger_cutscene);
			
			audio_sound_gain(amb_forest_ambience, 1, 5000);
			
			//if !audio_is_playing(bgm_inSync) audio_play_sound(bgm_inSync, 1, 1);
			if !audio_is_playing(obj_control.bgmForest) audio_play_sound(obj_control.bgmForest, 1, 1);
		
		}

	}


}

drawPauseMenu();