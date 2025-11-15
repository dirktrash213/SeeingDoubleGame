draw_self();

var _distance = point_distance(x, y, obj_player_pitter.x, obj_player_pitter.y);

if _distance <= detectionRadius && !itemBought {
    
	//var _text = scribble(itemName + ": " + itemPrice);
	var _text = scribble(itemPriceText);
	_text.starting_format("font_npc", c_white);
	_text.align(fa_center, fa_bottom); 
	_text.wrap(wrapAmount); 

	//var _dialogueSpawner = instance_nearest(x,y,obj_spawner_dialogue);

	var _offsetX = 8;
	var _offsetY = -16;

	_text.draw(x + _offsetX, y + _offsetY, typist);
	//_text.draw(_dialogueSpawner.x, _dialogueSpawner.y, typist);

	//draw_text_scribble(x,y, itemName + itemPrice);

}


