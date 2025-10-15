
typingNewGame = true;
typingContinue = false;


typist = scribble_typist();
typist.in(0.5, 0.9);
typist.sound(sfx_footstep, false, 1, 1); 
typist.character_delay_add(",", 100);
typist.character_delay_add(".", 200);
typist.character_delay_add("!", 200);
typist.character_delay_add("?", 200);

typist2 = scribble_typist();
typist2.in(0.5, 0.9);
typist2.sound(sfx_footstep, false, 1, 1); 
typist2.character_delay_add(",", 100);
typist2.character_delay_add(".", 200);
typist2.character_delay_add("!", 200);
typist2.character_delay_add("?", 200);

confirm = 0;