xSpeed = 0;
ySpeed = 0;

visible = false;
mask_index = spr_empty;

//if global.coopActive instance_deactivate_object(id);


active = false;
activeGraceTimer = 60;


//tileSprite = spr_coopTile_generic; //Make child objects?
tileSprite = spr_coopTile_forest; //Make child objects?

pitterColor = #6DD0F7;
patterColor = #F3C2D8;


if !global.verticalLevel {
	
	if !global.customLevel {
	
		isOnPitterScreen = y < global.patterOffsetY;
	
	} else {
	
		isOnPitterScreen = y < global.defaultCustomLevelPatterOffsetY;
	
	}
	
} else {

	isOnPitterScreen = x < global.patterOffsetX;

}

blendColor = isOnPitterScreen ? patterColor : pitterColor;

alarm[1] = 1; //Prevents platforms from appearing too early



if playerIsPresent() depth = obj_player.depth + 10;



