if global.paused {

	draw_set_halign(fa_center);

	var _x = camera_get_view_x(VIEW) + camera_get_view_width(VIEW)/2;
	var _y = camera_get_view_y(VIEW) + camera_get_view_height(VIEW)/2;
	
	draw_sprite_ext(sprite_index, 0, _x, _y, xScale, yScale, 0, c_white, image_alpha);
	
	
	switch pauseMenuSublevel {
		
		case 0: {
	
			var _defeatString = global.splitScreenActive ?  " [spr_pitter_defeat][spr_patter_defeat]x" : " [spr_pitter_defeat]x ";  
	
			//var _statText = scribble("[spr_interactable_coin]x " + string(global.coinCount) + "\n[spr_interactable_cherry]x " + string(global.cherryCount) + "\n[spr_pitter_defeat]x " + string(global.defeatCount));
			var _statText = scribble("[spr_interactable_coin]x " + string(global.coinCount) + " [spr_interactable_cherry]x " + string(global.cherryCount) + _defeatString + string(global.defeatCount));

			_statText.starting_format("font_titleMenu", c_white);
			//_coinText.wrap(335); 
			_statText.align(fa_center, fa_top); 
	
	
			var _offsetX = 0;
			var _offsetY = 50;
	
			_statText.draw(_x + _offsetX, _y + _offsetY, typist);
	
			var _resumeString = "Resume";
			var _optionsString = "\nOptions";
			var _exitString = "\nExit Game";
	
			if pauseMenuPosition == 0 _resumeString = "[wave]Resume[/wave]";
			if pauseMenuPosition == 1 _optionsString = "[wave]\nOptions[/wave]";
			if pauseMenuPosition == 2 _exitString = "[wave]\nExit Game[/wave]";
	
			//show_debug_message("pauseMenuPosition: " + string(pauseMenuPosition))

	
			//var _menuText = scribble(_resumeString + _optionsString + _exitString);
	
			//_menuText.starting_format("font_titleMenu", c_white);
			//_menuText.align(fa_center, fa_top); 
	
			_offsetX = 0;
			_offsetY = -50;
	
			//_menuText.draw(_x + _offsetX, _y + _offsetY, typist2);
			
			draw_text_scribble(_x + _offsetX, _y + _offsetY, _resumeString + _optionsString + _exitString);
			
			
		} break;
		
		case 1: {
	
			switch submenuType {
			
				case "Options": {
			
					var _backString = "Back";
					var _videoString = "\nVideo";
					var _audioString = "\nAudio";
	
					if pauseMenuPosition == 0 _backString = "[wave]Back[/wave]";
					if pauseMenuPosition == 1 _videoString = "[wave]\nVideo[/wave]";
					if pauseMenuPosition == 2 _audioString = "[wave]\nAudio[/wave]";
	
					var _offsetX = 0;
					var _offsetY = -50;
	
					draw_text_scribble(_x + _offsetX, _y + _offsetY, _backString + _videoString + _audioString);
			
				} break;
				
				case "Exit": {
			
					var _confirmString = "Exit the game?";
					var _noString = "\nDon't exit";
					var _yesString = "\nExit";
		
					if pauseMenuPosition == 0 _noString = "[wave]\nDon't exit[/wave]";
					if pauseMenuPosition == 1 _yesString = "[wave]\nExit[/wave]";
					
					var _offsetX = 0;
					var _offsetY = -50;
	
					draw_text_scribble(_x + _offsetX, _y + _offsetY, _confirmString + _noString + _yesString);
			
				} break;
			
			}
		
		} break;
		
		case 2: {
		
			switch submenuType {
			
				case "Video settings": {
				
					var _backString = "Back";
					var _fullscreenString = "\nToggle Fullscreen";
	
					if pauseMenuPosition == 0 _backString = "[wave]Back[/wave]";
					if pauseMenuPosition == 1 _fullscreenString = "[wave]\nToggle Fullscreen[/wave]";
				
					var _offsetX = 0;
					var _offsetY = -50;
	
					draw_text_scribble(_x + _offsetX, _y + _offsetY, _backString + _fullscreenString);
				
				} break;
				
				case "Audio settings": {
				
					var _backString = "Back";
					var _masterVolumeString = "\nMaster Volume";
					var _sfxVolumeString = "\nSFX Volume";
					var _bgmVolumeString = "\nMusic Volume";
					
					if pauseMenuPosition == 0 _backString = "[wave]Back[/wave]";
					if pauseMenuPosition == 1 _masterVolumeString = "[wave]\nMaster Volume[/wave]";
					if pauseMenuPosition == 2 _sfxVolumeString = "[wave]\nSFX Volume[/wave]";
					if pauseMenuPosition == 3 _bgmVolumeString = "[wave]\nMusic Volume[/wave]";
				
					var _offsetX = -145;
					var _offsetY = -50;
	
					draw_set_halign(fa_left);
					draw_text_scribble(_x + _offsetX, _y + _offsetY, _backString + _masterVolumeString + _sfxVolumeString + _bgmVolumeString);
					draw_set_halign(fa_center);
				
					_offsetX = 85;
					_offsetY = -20;
					
					var _spacing = 20;
					var _iconOffsetX = 50;
				
					draw_sprite(volumeSliderSprite, global.volumeMaster, _x + _offsetX, _y + _offsetY);
					draw_sprite(volumeMuteIcon, 0, _x + _offsetX - _iconOffsetX, _y + _offsetY);
					draw_sprite(volumeLoudIcon, 0, _x + _offsetX + _iconOffsetX, _y + _offsetY);
					
					draw_sprite(volumeSliderSprite, global.volumeSFX, _x + _offsetX, _y + _offsetY + _spacing);
					draw_sprite(volumeMuteIcon, 0, _x + _offsetX - _iconOffsetX, _y + _offsetY + _spacing);
					draw_sprite(volumeLoudIcon, 0, _x + _offsetX + _iconOffsetX, _y + _offsetY + _spacing);
					
					draw_sprite(volumeSliderSprite, global.volumeBGM, _x + _offsetX, _y + _offsetY + _spacing*2);
					draw_sprite(volumeMuteIcon, 0, _x + _offsetX - _iconOffsetX, _y + _offsetY + _spacing*2);
					draw_sprite(volumeLoudIcon, 0, _x + _offsetX + _iconOffsetX, _y + _offsetY + _spacing*2);
				
				} break;
			
			}
		
		} break;
	
	}
	

}



draw_set_halign(fa_left);
