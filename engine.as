import flash.events.MouseEvent;
import flash.ui.Mouse;

//Table of Contents
//0. PARSER
//1: TEXT FUNCTIONS
//2. DISPLAY STUFF
//3. UTILITY FUNCTIONS
//4. MOVEMENTS

//================================
//0. PARSER
//Pervineer here... I am messing up all your shit!

//THESE THREE LINES IMPORT A FILE
//[Embed(source="scripts/test1.txt", mimeType="application/octet-stream")]
//const test1 : Class;
//var test1String = (new test1()).toString();
//How to parse:
//outputParser(test1String, "");

//Pervineer here!  More fuckery!
//function scriptExample():void {
//	outputParser(test1String, "test3");
//}
//Alright, Pervineer here.  Lets get this show on the road.
//Let me hook in your nice little parser here!
function outputParser(script:String, section:String=""):void {
	output(parser.ParseScriptSection(script, section));
}

//1: TEXT FUNCTIONS
function output(words:String):void {
	outputBuffer += parser.ParseScriptSection(words,"");
	mainTextField.htmlText = outputBuffer;
	updateScroll(e);
}

function clearOutput():void {
	pushToBuffer();
	mainTextField.visible = true;
	mainTextField2.visible = false;
	mainTextField.htmlText = "\n";
	outputBuffer = "\n";
	updateScroll(e);
	leftSideBar.sceneBy.text = "Probably Fenoxo";
	textPage = 4;
	bufferButtonUpdater();
	//Menu buttons update!
	menuButtonsOn();
	deglow();
}
//Used for main menu & data settings
function clearOutput2():void {
	mainTextField.visible = false;
	mainTextField2.visible = true;
	outputBuffer2 = "\n";
	updateScroll(e);
}
function output2(words:String):void {
	outputBuffer2 += parser.ParseScriptSection(words,"");
	mainTextField2.htmlText = outputBuffer2;
	updateScroll(e);
}

function num2Text(number:Number):String {
	var returnVar:String = null;
	var numWords = new Array("zero","one","two","three","four","five","six","seven","eight","nine","ten");
	if (number > 10 || int(number) != number) {
		returnVar = "" + number;
	} 
	else {
		returnVar = numWords[number];
	}
	return(returnVar);
}
function num2Text2(number:int):String {
	var returnVar:String = null;
	var numWords = new Array("zero","first","second","third","fourth","fifth","sixth","seventh","eighth","ninth","tenth");
	if (number > 10) {
		returnVar = "" + number + "th";
	} 
	else {
		returnVar = numWords[number];
	}
	return(returnVar);
}
function author(arg:String):void {
	leftSideBar.sceneBy.visible = true;
	leftSideBar.sceneByTag.visible = true;
	leftSideBar.sceneBy.text = arg;
}


//2. DISPLAY STUFF
function showBust(arg:int):void {
	//leftSideBar.sceneTitle.filters = [glow];
	if(arg == 0) leftSideBar.npcBusts.visible = false;
	else {
		leftSideBar.sceneTitle.text = caps(characters[arg].short);
		leftSideBar.npcBusts.visible = true;
		leftSideBar.npcBusts.gotoAndStop(arg);
	}
}

//EXAMPLE: setupStatBar(monsterSex,"SEX","Genderless");
function setupStatBar(arg:MovieClip,title:String = "",value = undefined, max = undefined):void {
	if(title != "" && title is String) arg.masks.labels.text = title;
	if(max is Number && value is Number) {
		arg.bar.width = (value / max) * 180;
		arg.background.x = -1 * (1 - value / max) * 180;
	}
	if(max == undefined) {
		arg.bar.visible = false;
		arg.background.x = -180;
	}
	if(value != undefined) arg.values.text = String(value);
}
function upperCase(str:String):String {
	var firstChar:String = str.substr(0,1);
	var restOfString:String = str.substr(1,str.length);
	return firstChar.toUpperCase()+restOfString.toLowerCase();
}
function caps(str:String):String {
	return str.toUpperCase();
}
function plural(str:String):String {
	var lastChar:String = str.substr(str.length-1,str.length);
	if(lastChar == "s") str += "es";
	else str += "s";
	return str;
}
function possessive(str:String):String {
	var lastChar:String = str.substr(str.length-1,str.length);
	if(lastChar == "s") str += "'";
	else str += "'s";
	return str;
}

function leftBarClear():void {
	leftSideBar.sceneByTag.visible = false;
	leftSideBar.sceneBy.visible = false;
	leftSideBar.sceneTitle.visible = false;
	leftSideBar.planet.visible = false;
	leftSideBar.system.visible = false;
	leftSideBar.time.visible = false;
	leftSideBar.days.visible = false;
	leftSideBar.quicksaveButton.visible = false;
	leftSideBar.dataButton.visible = false;
	leftSideBar.statsButton.visible = false;
	leftSideBar.perksButton.visible = false;
	leftSideBar.levelUpButton.visible = false;
}
function hidePCStats():void {
	playerShields.visible = false;
	playerHP.visible = false;
	playerLust.visible = false;
	playerEnergy.visible = false;
	playerLevel.visible = false;
	playerXP.visible = false;
	playerCredits.visible = false;
	playerPhysique.visible = false;
	playerReflexes.visible = false;
	playerAim.visible = false;
	playerIntelligence.visible = false;
	playerWillpower.visible = false;
	playerLibido.visible = false;
}
function showPCStats():void {
	playerShields.visible = true;
	playerHP.visible = true;
	playerLust.visible = true;
	playerEnergy.visible = true;
	playerLevel.visible = true;
	playerXP.visible = true;
	playerCredits.visible = true;
	playerPhysique.visible = true;
	playerReflexes.visible = true;
	playerAim.visible = true;
	playerIntelligence.visible = true;
	playerWillpower.visible = true;
	playerLibido.visible = true;
}
function showNPCStats():void {
	monsterHP.visible = true;
	monsterLust.visible = true;
	monsterEnergy.visible = true;
	monsterLevel.visible = true;
	monsterRace.visible = true;
	monsterSex.visible = true;
}
function hideNPCStats():void {
	monsterHP.visible = false;
	monsterLust.visible = false;
	monsterEnergy.visible = false;
	monsterLevel.visible = false;
	monsterRace.visible = false;
	monsterSex.visible = false;
}
function deglow():void {
	playerShields.clearGlo();
	playerHP.clearGlo();
	playerLust.clearGlo();
	playerEnergy.clearGlo();
	playerXP.clearGlo();
	playerLevel.clearGlo();
	playerCredits.clearGlo();
	playerPhysique.clearGlo();
	playerReflexes.clearGlo();
	playerAim.clearGlo();
	playerIntelligence.clearGlo();
	playerWillpower.clearGlo();
	playerLibido.clearGlo();
	monsterHP.clearGlo();
	monsterLust.clearGlo();
	monsterEnergy.clearGlo();
}	
function updatePCStats():void {
	rightSidebar.nameText.text = pc.short;
	updateStatBar(playerShields,pc.shields(),pc.shieldsMax());
	updateStatBar(playerHP,pc.HP(),pc.HPMax());
	updateStatBar(playerLust,pc.lust(),pc.lustMax());
	updateStatBar(playerEnergy,pc.energy(),pc.energyMax());
	
	updateStatBar(playerPhysique,pc.physique(),pc.physiqueMax());	
	updateStatBar(playerReflexes,pc.reflexes(),pc.reflexesMax());
	updateStatBar(playerAim,pc.aim(),pc.aimMax());
	updateStatBar(playerIntelligence,pc.intelligence(),pc.intelligenceMax());
	updateStatBar(playerWillpower,pc.willpower(),pc.willpowerMax());
	updateStatBar(playerLibido,pc.libido(),pc.libidoMax());
	leftSideBar.time.text = timeText();
	leftSideBar.days.text = String(days);
	leftSideBar.sceneBy.visible = true;
	leftSideBar.sceneByTag.visible = true;
	//playerLevel.values.text = "" + pc.level;
	updateStatBar(playerLevel,pc.level,20);
	updateStatBar(playerXP,pc.XP,pc.level * pc.level * 100);
	//playerCredits.values.text = String(pc.credits);	
	updateStatBar(playerCredits,pc.credits,100000000);
	
	updateNPCStats();
}
function timeText():String {
	var buffer:String = ""
	if(hours < 10) buffer += "0";
	buffer += hours + ":";
	if(minutes < 10) buffer += "0";
	buffer += minutes;
	return buffer;
}
function updateNPCStats():void {
	if(foes.length >= 1) {
		updateStatBar(monsterHP,foes[0].HP(),foes[0].HPMax());
		updateStatBar(monsterLust,foes[0].lust(),foes[0].lustMax());
		updateStatBar(monsterEnergy,foes[0].energy(),foes[0].energyMax());
		monsterLevel.values.text = String(foes[0].level);
		monsterRace.values.text = "Galotian";
		if(foes[0].hasCock()) {
			if(foes[0].hasVagina())	monsterSex.values.text = "Hermaphrodite";
			else monsterSex.values.text = "Male";
		}
		else if(foes[0].hasVagina()) monsterSex.values.text = "Female";
		else monsterSex.values.text = "????";
	}
}
function updateStatBar(arg:MovieClip,value = undefined, max = undefined):void {
	//if(title != "" && title is String) arg.masks.labels.text = title;
	if(max != undefined) arg.setMax(max);
	if(value != undefined && arg.visible == true) {
		if(arg.getGoal() != value) {
			arg.setGoal(value);
			//trace("SETTING GOAL");
		}
	}
}
function setLocation(title:String,planet:String = "Error Planet",system:String = "Error System"):void {
	leftSideBar.sceneTitle.text = title;
	leftSideBar.planet.text = planet;
	leftSideBar.system.text = system;
}

//3. UTILITY FUNCTIONS
function rand(max:Number):Number
{
	return int(Math.random()*max);
}
function clone(source:Object):* {
	var copier:ByteArray = new ByteArray();
	copier.writeObject(source);
	copier.position = 0;
	return(copier.readObject());
}
function cuntChange(arg:int,volume:Number,display:Boolean = true, spacingsF:Boolean = true,spacingsB:Boolean = false):Boolean {
	return holeChange(pc,arg,volume,display,spacingsF,spacingsB);
}
function buttChange(volume:Number,display:Boolean = true, spacingsF:Boolean = true,spacingsB:Boolean = false):Boolean {
	return holeChange(pc,-1,volume,display,spacingsF,spacingsB);
}

function holeChange(target:creature,hole:int,volume:Number,display:Boolean = true, spacingsF:Boolean = true, spacingsB:Boolean = false):Boolean {
	var stretched:Boolean = false;
	var devirgined:Boolean = false;
	var capacity:Number;
	var holePointer:vaginaClass;
	//Set capacity based on the hole.
	if(hole == -1) {
		capacity = target.analCapacity();
		holePointer = target.ass;
	}
	else {
		if(hole+1 > target.totalVaginas()) return false;
		else {
			capacity = target.vaginalCapacity(hole);
			holePointer = target.vaginas[hole];
		}
	}
	//cArea > capacity = autostreeeeetch.
	if(volume >= capacity) {
		if(holePointer.looseness >= 5) {}
		else holePointer.looseness++;
		stretched = true;
	}
	//If within top 10% of capacity, 50% stretch
	else if(volume >= .9 * capacity && rand(2) == 0) {
		holePointer.looseness++;
		stretched = true;
	}
	//if within 75th to 90th percentile, 25% stretch
	else if(volume >= .75 * capacity && rand(4) == 0) {
		holePointer.looseness++;
		stretched = true;
	}
	//If virgin
	if(holePointer.hymen || (hole < 0 && target.analVirgin) || (hole >= 0 && target.vaginalVirgin)) {
		if(spacingsF) output(" ");
		if(holePointer.hymen) output("<b>Your hymen is torn</b>");
		else output("<b>You have been penetrated</b>");
		if(hole >= 0 && target.vaginalVirgin) {
			target.vaginalVirgin = false;
			output("<b>, robbing you of your vaginal virginity</b>");
		}
		else if(target.analVirgin) {
			output("<b>, robbing you of your anal virginity</b>");
			target.analVirgin = false;
		}
		output("<b>.</b>");
		if(spacingsB) output(" ");
		devirgined = true;
	}
	//Delay anti-stretching
	if(volume >= .35 * capacity) {
		if(hole >= 0) {
			holePointer.shrinkCounter = 0;
		}
		else {
			holePointer.shrinkCounter = 0;
		}
	}
	if(stretched) {
		trace("HOLE CODE #:" + hole + " STRETCHED TO " + holePointer.looseness + ".");
		//STRETCH SUCCESSFUL - begin flavor text if outputting it!
		if(display) {
			//Virgins get different formatting
			if(devirgined) {
				//If no spaces after virgin loss
				if(!spacingsB) output(" ");
			}
			//Non virgins as usual
			else if(spacingsF) output(" ");
			if(hole >= 0) {
				if(holePointer.looseness >= 5) output("<b>Your " + target.vaginaDescript(hole) + " is stretched painfully wide, gaped in a way that practically invites huge monster-cocks to plow you.</b>");
				else if(holePointer.looseness >= 4) output("<b>Your " + target.vaginaDescript(hole) + " painfully stretches, the lips now wide enough to gape slightly.</b>");
				else if(holePointer.looseness >= 3) output("<b>Your " + target.vaginaDescript(hole) + " is now somewhat loose.</b>");
				else if(holePointer.looseness >= 2) output("<b>Your " + target.vaginaDescript(hole) + " is stretched a little.</b>");
				else output("<b>Your " + target.vaginaDescript(hole) + " is stretched out a little bit.</b>");
			}
			else {
				if(holePointer.looseness >= 5) output("<b>Your " + target.assholeDescript() + " is stretched painfully wide, gaped in a way that practically invites huge monster-cocks to plow you.</b>");
				else if(holePointer.looseness >= 4) output("<b>Your " + target.assholeDescript() + " painfully stretches, the pucker now able to gape slightly.</b>");
				else if(holePointer.looseness >= 3) output("<b>Your " + target.assholeDescript() + " is now somewhat loose.</b>");
				else if(holePointer.looseness >= 2) output("<b>Your " + target.assholeDescript() + " is stretched a little.</b>");
				else output("<b>Your " + target.assholeDescript() + " is stretched out a little bit.</b>");
			}
			if(spacingsB) output(" ");
		}
	}
	return (stretched || devirgined);
}
function clearList():void {
	list = new Array();
}
var list:Array = new Array();
function addToList(arg):void {
	list[list.length] = arg;
}
function formatList():String {
	var stuff:String = "";
	if(list.length == 1) return list[0];
	for(var x:int = 0; x < list.length; x++) {
		stuff += list[x];
		if(list.length == 2 && x == 1) {
			stuff += " and ";
		}
		else if(x < list.length-2) {
			stuff += ", ";
		}
		else if(x < list.length-1) {
			stuff += ", and ";
		}
	}
	list = new Array();
	return stuff;	
}

//4. MOVEMENTS