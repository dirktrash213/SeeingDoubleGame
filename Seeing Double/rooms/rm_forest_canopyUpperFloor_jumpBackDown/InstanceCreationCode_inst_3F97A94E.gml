if global.dialogueVariables.talkedToScammerThrice {
	
	itemPrice = 99;
	itemPriceText = "99[spr_interactable_coin]";
	
}

if global.dialogueVariables.boughtParachuteFromScammer itemBought = true;
if global.gotScammed instance_destroy();