if global.coopActive {

	var _nearestExitPortal;
	var _portalID = portalID;

	with obj_interactable_portal_exit {

		if portalID = _portalID _nearestExitPortal = id;

	}
	
	other.x = _nearestExitPortal.x;
	other.y = _nearestExitPortal.y;

	playGreenPortalJumpEffects();

}

