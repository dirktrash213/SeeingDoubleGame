xScale = 2;
yScale = 2;

depth = -14000;

typist = scribble_typist();
typist2 = scribble_typist();
//typist.in(0.5, 0.9);
typist.in(0.85, 0.9);
typist.sound(sfx_footstep, false, 1, 1); 

typist2.in(0.85, 0.9);
typist2.sound(sfx_footstep, false, 1, 1); 

//image_alpha = 0.75;

pauseMenuPosition = 0;

pauseMenuSublevel = 0;

submenuType = "";

volumeSliderSprite = spr_UI_volumeSlider;
volumeMuteIcon = spr_UI_volumeIcon_mute;
volumeLoudIcon = spr_UI_volumeIcon_loud;