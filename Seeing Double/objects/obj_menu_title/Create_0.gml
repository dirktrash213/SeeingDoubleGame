
typingNewGame = true;
typingContinue = false;


typist = scribble_typist();
typist.in(0.10, 0.9);
typist.sound(sfx_footstep, false, 1, 1); 
typist.character_delay_add(",", 100);
typist.character_delay_add(".", 200);
typist.character_delay_add("!", 200);
typist.character_delay_add("?", 200);