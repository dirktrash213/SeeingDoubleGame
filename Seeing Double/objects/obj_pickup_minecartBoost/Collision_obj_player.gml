event_inherited();

if !other.ridingMinecart exit;

var _speedIncrease = speedIncrease;

with obj_player {

	if currentMinecart == noone exit;

	currentMinecart.cart_speed += _speedIncrease;

}

