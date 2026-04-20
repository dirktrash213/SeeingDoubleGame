var _offsetX = 4;
var _offsetY = 10;

with instance_create_layer(x + _offsetX, y + _offsetY, "Instances", obj_interactable_waterDroplet) {

	gravity = 0.1;

}

alarm[0] = dripRate + random_range(-dripRateVariation, dripRateVariation);











