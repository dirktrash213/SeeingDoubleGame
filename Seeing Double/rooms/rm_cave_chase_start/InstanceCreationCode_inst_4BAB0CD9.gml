//if global.groundPoundActive instance_destroy();
textDisplayDuration = 360;
variableTextDisplayDuration = true;
wrapAmount = 125;
typist.sound(sfx_footstep, false, 1.5, 1.7); 

if global.gotScammed {

	dialogueString[0] = global.dialogueStringArrays.cavesHaunting[0];
	dialogueString[1] = global.dialogueStringArrays.cavesHaunting[1];
	dialogueString[2] = global.dialogueStringArrays.cavesHaunting[2];

} else {

	dialogueString[0] = "Player was not scammed.";

}

/* 

if !global.dialogueVariables.talkedToScammer {

	dialogueString[0] = "Hey. Hey guy. C'mere."
	dialogueString[1] = "Yeah. That's right. Lookie what I got."
	dialogueString[2] = "Parachute, see? Top of the line, mint condition."
	dialogueString[3] = "Absolutely garaunteed not to break. Ever."
	dialogueString[4] = "I could part with it for, I dunno... 100 [spr_interactable_coin]coins."
	dialogueString[5] = "How about it? 100 [spr_interactable_coin]coins and this piece of... [slant]fine[/slant] craftsmanship... is all yours."

} else {

	if !global.dialogueVariables.talkedToScammerTwice {

		dialogueString[0] = "C'mon, guy. You can totally trust me!"
		dialogueString[1] = "You really think someone would do that? Just go out there and sell people junk?"
		dialogueString[2] = "But hey guy. It's your loss. This baby's my top seller, so don't come back cryin' if you snooze and lose."
	//	dialogueString[2] = "C'mon! This here parachute is state of the art! One of a kind! 100 [spr_interactable_coin]coins is a bargain and a half!"
	//	dialogueString[2] = "C'mon! 100 [spr_interactable_coin]coins is a bargain and a half!"
		//dialogueString[2] = "C'mon! 100 [spr_interactable_coin]coins? It's practically a steal!"
	
	} else {
		
		if !global.dialogueVariables.talkedToScammerThrice {
	
			dialogueString[0] = "Alright, alright I get it. Too pricey, eh?"
			dialogueString[1] = "Sheesh. You're really twistin' my ears here, guy, you know that?"
			//dialogueString[2] = "Smart and savvy. Can't help but respect that."
			//dialogueString[2] = "Ok, since you're a smart and savvy conessiuer"
			dialogueString[2] = "Can't help but respect the hustle, though. You've got some real grit. Panache. Moxie. I like it."
			dialogueString[3] = "Tell you what. I suppose I could come all the way down to the low, low price of... let's say..."
			dialogueString[4] = "99 [spr_interactable_coin]coins. How about it? It's practically a steal!"
		
		} else {
		
			dialogueString[0] = "Well?"
		
		}
	
	}

}