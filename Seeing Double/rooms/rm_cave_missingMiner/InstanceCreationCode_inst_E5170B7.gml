wrapAmount = 125;
typist.sound(sfx_mouseChirp, false, 0.2, 2.5); 
textDisplayDuration = 300;

if !global.dialogueVariables.talkedToMinerGroup {

	dialogueString[0] = "[#00AEF0]So, that's it, then? We's callin' off the search?";
	dialogueString[1] = "[#E5898C]It's been ten days. We've scoured every blasted nook and cranny.";
	dialogueString[2] = "[#E5898C]By now he's certainly...";
	dialogueString[3] = "[#3CB878][wave]sniff[/wave] I just dun' get it. I dun get it atall.";
	dialogueString[4] = "[#3CB878]One minute he's right beside me, then I turn an' next thing I know...";
	dialogueString[5] = "[#3CB878]Aw, shucks, why'd we hafta come to this donggone mine...";
	//dialogueString[6] = "Wherever he is, I hope he's ok.";
	//dialogueString[7] = "He's a tough one. He'll be alright. We need to get back to work.";
	dialogueString[6] = "[#00AEF0]True's that. This mine ain't worth it. Just ain't worth it.";
	dialogueString[7] = "[#E5898C]Quit your blubberin'! We've got a job to do and we're gonna do it, dangit!";
	//dialogueString[8] = "[#00AEF0]...";
	dialogueString[8] = "[#E5898C]...besides, he's a tough'un. He'll be fine.";
	dialogueString[9] = "[#3CB878]Y-yeah! That's right!";
	
} else {

	dialogueString[0] = "...";
	
}