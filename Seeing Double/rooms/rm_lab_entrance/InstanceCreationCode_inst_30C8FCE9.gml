textDisplayDuration = 300;
wrapAmount = 455;
typist.sound(sfx_footstep, false, 1.5, 1.7); 
var _epicGamer = "";

var _speedsterText = global.speedrunTimer <= -50000 ? "\nYou move with purpose." : "";
var _noDeathsText = global.defeatCount <= 0 ? "\nYou have kept something precious alive." : "";
var _moneybagsText = global.coinCount >= global.coinLotsAmount ? "\nYou have gathered funds for a future." : "";
var _allCherriesText = global.cherryCount >= global.cherryMax ? "\nYou have recovered the lost picnic contents." : "";
var _foundRoseText = global.foundLily ? "\nYou have found something sentimental." : "";

var _defeatText = global.coopActive ? "\nPitter deaths: [spr_pitter_defeat]" + string(global.defeatCountPitter) + "\nPatter deaths: [spr_patter_defeat]" + string(global.defeatCountPatter) : "\nDeaths: [spr_pitter_defeat][spr_patter_defeat]" + string(global.defeatCount);

dialogueString[0] = "";
dialogueString[1] = "";
dialogueString[2] = "";
dialogueString[3] = "";
dialogueString[4] = "";
dialogueString[5] = "";
dialogueString[6] = "";
dialogueString[7] = "Coins: [spr_interactable_coin]" + string(global.coinCount)
+ "\nCherries: [spr_interactable_cherry]" + string(global.cherryCount) + "/" + string(global.cherryMax)
+ _defeatText
+ _noDeathsText
+ _moneybagsText
+ _allCherriesText
+ _foundRoseText;