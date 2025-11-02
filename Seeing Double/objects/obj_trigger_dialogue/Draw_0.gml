if !triggered exit;

var _text = scribble(dialogueString[count]);
_text.starting_format("font_npc", c_white);
_text.align(fa_center, fa_bottom); 
_text.wrap(75); 

var _dialogueSpawner = instance_nearest(x,y,obj_spawner_dialogue);

_text.draw(_dialogueSpawner.x, _dialogueSpawner.y, typist);
//_text.draw(100, 100, typist);


