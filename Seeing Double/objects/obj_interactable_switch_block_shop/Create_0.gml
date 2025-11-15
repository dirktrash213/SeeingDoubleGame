xSpeed = 0;
ySpeed = 0;

bonked = false;
itemBought = false;

typist = scribble_typist();

typist.in(0.9, 0.9);
typist.sound(sfx_footstep, false, 1.5, 1.7); 

wrapAmount = 75;

itemName = "Item for sale";
itemPrice = 1; 
itemPriceText = string(itemPrice)+"[spr_interactable_coin]";


detectionRadius = 70;