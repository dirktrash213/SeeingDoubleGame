wrapAmount = 125;
typist.sound(sfx_mouseChirp, false, 0.2, 2.5); 
textDisplayDuration = 360;

if !global.dialogueVariables.talkedToCamper {

	dialogueString[0] = "Huh... so ya found my little hidey hole, eh sonny? Like what I've done with the place?"
	dialogueString[1] = "What brings ya down to these cavernous depths? Ya don't look like a miner. Or an explorer."
	dialogueString[2] = "Ya looking for something? Or someone? Heh. Good luck finding anything in these pits."
	dialogueString[3] = "Y'know. These caves connect to some sort of hi tech facility deeper in."
	dialogueString[4] = "Seems like it's been there for ages, too. Makes me wonder who built it, and why."
	dialogueString[5] = "Could never figure out how to open that door, though, so we'll probably never know."
	dialogueString[6] = "But... you seem like a resourceful young feller. Maybe you'll succeed where I couldn't."
	dialogueString[7] = "And who knows? Maybe inside you'll find just what you're looking fer."

} else {

	if !global.dialogueVariables.talkedToCamperTwice {

		dialogueString[0] = "What brings ya back here, sonny? Wondering why I'm holed up in this little nook, that it?"
		dialogueString[1] = "Well, to put it simply... I like explorin'. Findin' little unknown places like this..."
		dialogueString[2] = "It makes me feel so young! Like a kid, almost. Guess I never quite grew up, heheh."
		dialogueString[3] = "Y'know, sonny... between you and me... I've seen things you probably wouldn't believe."
		dialogueString[4] = "There's a whole 'nother world out there. And I ain't talkin' 'bout beyond the island."
		dialogueString[5] = "It's right here, all around us. In this very room even, I'd wager."
		dialogueString[6] = "Heh. You must think I'm crazy. I used to get that a lot. Part of the reason I live here now."
		dialogueString[7] = "Probably provin' 'em right by doin' so, but I could care less."
		dialogueString[8] = "You're alright, kid. Probably should get going, though. Don't wanna keep anyone waitin', do ya?"

	} else {
	
		dialogueString[0] = "[wave]zzzzzzz..."
	
	}

}