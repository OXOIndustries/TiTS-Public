var version:String = "0.01c";
//===****** CHEAT NOTES ******===//
//var my_color:Color = new Color(levelUpButton.plusses);
//my_color.setRGB(0xFF0000); // this will turn mcTarget completly to red
//===***** END CHEATS *****===//

/*leftSideBar Components
sceneTitle
planet
system
monsterHP
monsterHPBar
monsterLust
monsterLustBar
monsterEnergy
monsterEnergyBar
monsterLevel
monsterRace
monsterSex
time
days
sceneBy
sceneByTag

rightSideBar components
nameText
playerHP
playerLust
playerEnergy
playerLevel
playerXP
playerCredits
playerPhysique
playerPhysiqueBar
playerReflexes
playerReflexesBar
playerAim
playerAimBar
playerIntelligence
playerIntelligenceBar
playerWillpower
playerWillpowerBar

central components
mainTextField
scrollbar
*/

//temporary nonsense variables.
var e:MouseEvent;
var temp:int = 0;


import creature;
import itemSlotClass;
import flash.net.registerClassAlias;
import ScriptParser;
import shipClass;
//import purpleButton;
//import blueButton;
registerClassAlias("creature", creature);
registerClassAlias("itemSlotClass", itemSlotClass);
registerClassAlias("shipClass", shipClass);
registerClassAlias("cockClass", cockClass);
registerClassAlias("vaginaClass", vaginaClass);
registerClassAlias("breastRowClass",breastRowClass);
registerClassAlias("itemSlotClass",itemSlotClass);
registerClassAlias("roomClass",roomClass);
registerClassAlias("storageClass",storageClass);


var characters:Array = new Array();
var foes:Array = new Array();
var textBuffer:Array = new Array("","","","");
//Used for temp buffer stuff
var tempText:String = "";
var tempAuthor:String = "";
var currentPCNotes:String = undefined;
//Used for output()
var outputBuffer:String = "";
var outputBuffer2:String = "";
var authorBuffer:Array = new Array("","","","");
var textPage:int = 4;
var days:int = 0;
var hours:int = 0;
var minutes:int = 0;
var eventQueue:Array = new Array();
var eventBuffer:String = "";

//What inventory screen is up?
var shopkeep:creature = undefined;
var itemScreen = undefined;
var lootScreen = undefined;
var lootList:Array = new Array();
var useItemFunction = undefined;
var itemUser:creature = undefined;
var itemTarget:creature = undefined;

//Toggles
var silly:Boolean = false;
var easy:Boolean = false;
var debug:Boolean = false;

//Lazy man state checking
var showingPCAppearance:Boolean = false;
var saveHere:Boolean = false;
var location:int = 0;
var shipLocation:int = 0;

//PERVINEER HERE!
var testBool:Boolean;
var testString:String;
var testInt:int;
//Pervineer here!
var parser:ScriptParser = new ScriptParser(this);

setupCharacters();

function setupCharacters():void {
	for(var count:int = 0; count < 100; count++) {
		characters[count] = new creature();
		trace("Character #" + count + " initialized.");
	}
	foes[0] = new creature();
	trace("One foe slot initialized.");
}

var flags:Dictionary = new Dictionary();
initializeFlags();


function initializeFlags():void 
{
	flags = new Dictionary();
	/*
	for (var x:int = 0; x < 10000; x++) {
		flags[x] = undefined;
	}
	*/
}

function setCheatPointers():void {
	pc = characters[0];
	celise = characters[CELISE];
	rival = characters[RIVAL];
	geoff = characters[GEOFF];
	flahne = characters[FLAHNE];
}