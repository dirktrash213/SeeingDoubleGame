dialogueString[0] = "This is sample dialogue."
//dialogueString[1] = "This is more sample dialogue."
//dialogueString[2] = "This is even more sample dialogue."

count = 0;

triggered = false;

typist = scribble_typist();

typist.in(0.9, 0.9);
typist.sound(sfx_mouseChirp, false, 1.5, 1.7); 


textDisplayDuration = 240;


wrapAmount = 75;
specialDialogueTriggered = false;
allowSpecialDialogue = false;

//boughtParachuteEarly = false;

dialogueSpawner = instance_nearest(x,y,obj_spawner_dialogue);


eatenCaveCherry = false;