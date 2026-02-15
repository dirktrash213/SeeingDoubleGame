//if object_index == obj_player_pitter draw_circle(x,y,9, false);

if wearingParachute {

	draw_sprite(spr_parachute, 0, x, y);

}

if wearingBrokenParachute {

	draw_sprite(spr_parachute_broken, 0, x, y);

}

//if gemPowerupDoubleJump image_blend = c_green;

//image_blend = gemPowerupDoubleJump ? c_lime : c_white;
//image_blend = gemPowerupGroundPound ? c_orange : c_white;

image_blend = c_white;

if gemPowerupDoubleJump image_blend = c_lime;
//if gemPowerupGroundPound image_blend = c_orange;
if gemPowerupGroundPound image_blend = c_orange;



draw_sprite_ext(sprite_index, image_index, x, y, image_xscale*faceDir*xStretch, image_yscale*yStretch, image_angle, image_blend, image_alpha);








