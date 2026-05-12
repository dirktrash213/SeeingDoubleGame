//if global.groundPoundActive instance_destroy();
textDisplayDuration = 360;
typist.sound(sfx_mouseChirp, false, 0.7, 1.5); 
variableTextDisplayDuration = true;
wrapAmount = 125;
//typist.sound(sfx_footstep, false, 1.5, 1.7); 

//if global.caughtByCaveGhostAmount > 0 {
//
//	dialogueString[0] = global.dialogueStringArrays.cavesHauntingFakeout[0];
//	dialogueString[1] = global.dialogueStringArrays.cavesHauntingFakeout[1];
//	dialogueString[2] = global.dialogueStringArrays.cavesHauntingFakeout[2];
//
//
//} else {

if global.gotScammed {

	dialogueString[0] = global.dialogueStringArrays.cavesHaunting[0];
	dialogueString[1] = global.dialogueStringArrays.cavesHaunting[1];
	dialogueString[2] = global.dialogueStringArrays.cavesHaunting[2];

} else {

	dialogueString[0] = global.dialogueStringArrays.cavesHauntingNotScammed[0];
	dialogueString[1] = global.dialogueStringArrays.cavesHauntingNotScammed[1];
	dialogueString[2] = global.dialogueStringArrays.cavesHauntingNotScammed[2];
	dialogueString[3] = global.dialogueStringArrays.cavesHauntingNotScammed[3];

}

//}