xScale = 1;
yScale = 1;

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

volumeSliderSprite = spr_UI_volumeSlider_x4;
volumeMuteIcon = spr_UI_volumeIcon_mute_x4;
volumeLoudIcon = spr_UI_volumeIcon_loud_x4;

audioBGMLoaded = false;
audioSFXLoaded = false;

dividerYscale = 0;
dividerYscaleIncreaseAmount = 2;

audio_group_load(audiogroup_bgm);
audio_group_load(audiogroup_sfx);

scammedSFXpitch = 1.0; //0.3
scammedSFXpitchDecreaseAmount = 0.001;



//tilemapID = noone;
//tileLayerAlpha = 0.5;