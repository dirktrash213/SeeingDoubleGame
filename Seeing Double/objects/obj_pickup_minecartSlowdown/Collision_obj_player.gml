event_inherited();

if !other.ridingMinecart exit;

var _speedDecrease = speedDecrease;

with obj_player {

	currentMinecart.cart_speed -= _speedDecrease;

}

