with obj_interactable_portal_parent {

	active = true;

}

with obj_interactable_portal_entrance {

	sprite_index = spr_interactable_portalCircle_forming_green;
	image_index = 0;
	
}

with obj_interactable_portal_exit {

	sprite_index = spr_interactable_portalCircle_forming_red;
	image_index = 0;
	
}

playAudioWithFalloff(sfx_portal_forming);

instance_destroy();