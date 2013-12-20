import flash.events.MouseEvent;
import flash.ui.Mouse;

import classes.StatBarSmall;
import classes.StatBarBig;
	
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
	output(parser.recursiveParser(script, true));
}


/*
MOST of this should be broken up into simple shim-functions that call the real, relevant function in userInterface:GUI
I'm breaking it out into a separate class, and just manipulating those class variables for the moment
once that's working, I can start piecemeal moving things to functions in GUI.

*/

//1: TEXT FUNCTIONS
function output(words:String):void {
	this.userInterface.outputBuffer += parser.recursiveParser(words, true);
	this.userInterface.mainTextField.htmlText = this.userInterface.outputBuffer;
	this.userInterface.updateScroll(this.userInterface.tempEvent);
}

function clearOutput():void {
	this.userInterface.pushToBuffer();
	this.userInterface.mainTextField.visible = true;
	this.userInterface.mainTextField2.visible = false;
	this.userInterface.mainTextField.htmlText = "\n";
	this.userInterface.outputBuffer = "\n";
	this.userInterface.updateScroll(this.userInterface.tempEvent);
	this.userInterface.leftSideBar.sceneBy.text = "Probably Fenoxo";
	this.userInterface.textPage = 4;
	bufferButtonUpdater();
	//Menu buttons update!
	this.userInterface.menuButtonsOn();
	this.userInterface.deglow();
}
//Used for main menu & data settings
function clearOutput2():void {
	this.userInterface.mainTextField.visible = false;
	this.userInterface.mainTextField2.visible = true;
	this.userInterface.outputBuffer2 = "\n";
	this.userInterface.updateScroll(this.userInterface.tempEvent);
}
function output2(words:String):void {
	this.userInterface.outputBuffer2 += parser.recursiveParser(words, true);
	this.userInterface.mainTextField2.htmlText = this.userInterface.outputBuffer2;
	this.userInterface.updateScroll(this.userInterface.tempEvent);
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
	this.userInterface.leftSideBar.sceneBy.visible = true;
	this.userInterface.leftSideBar.sceneByTag.visible = true;
	this.userInterface.leftSideBar.sceneBy.text = arg;
}


function upperCase(str:String):String {
	var firstChar:String = str.substr(0,1);
	var restOfString:String = str.substr(1,str.length);
	return firstChar.toUpperCase()+restOfString.toLowerCase();
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
	this.userInterface.leftBarClear();
}
function hidePCStats():void {
	this.userInterface.hidePCStats()
}
function showPCStats():void {
	this.userInterface.showPCStats()
}
function showNPCStats():void {
	this.userInterface.showNPCStats()
}
function hideNPCStats():void {
	this.userInterface.hideNPCStats()
}
function deglow():void 
{
	this.userInterface.deglow()
}	
function updatePCStats():void {
	if (pc.short != "uncreated")
		this.userInterface.setGuiPlayerNameText(pc.short);
	else
		this.userInterface.setGuiPlayerNameText("");

	updateStatBar(this.userInterface.playerShields,pc.shields(),pc.shieldsMax());

	updateStatBar(this.userInterface.playerHP,pc.HP(),pc.HPMax());
	updateStatBar(this.userInterface.playerLust,pc.lust(),pc.lustMax());
	updateStatBar(this.userInterface.playerEnergy,pc.energy(),pc.energyMax());
	
	updateStatBar(this.userInterface.playerPhysique,pc.physique(),pc.physiqueMax());	
	updateStatBar(this.userInterface.playerReflexes,pc.reflexes(),pc.reflexesMax());
	updateStatBar(this.userInterface.playerAim,pc.aim(),pc.aimMax());
	updateStatBar(this.userInterface.playerIntelligence,pc.intelligence(),pc.intelligenceMax());
	updateStatBar(this.userInterface.playerWillpower,pc.willpower(),pc.willpowerMax());
	updateStatBar(this.userInterface.playerLibido,pc.libido(),pc.libidoMax());
	this.userInterface.leftSideBar.time.text = timeText();
	this.userInterface.leftSideBar.days.text = String(this.userInterface.days);
	this.userInterface.leftSideBar.sceneBy.visible = true;
	this.userInterface.leftSideBar.sceneByTag.visible = true;
	updateNPCStats();
}
function timeText():String {
	var buffer:String = ""
	if(this.userInterface.hours < 10) buffer += "0";
	buffer += this.userInterface.hours + ":";
	if(this.userInterface.minutes < 10) buffer += "0";
	buffer += this.userInterface.minutes;
	return buffer;
}
function updateNPCStats():void {
	if(foes.length >= 1) {
		updateStatBar(this.userInterface.monsterShield, foes[0].shields(),  foes[0].shieldsMax());
		updateStatBar(this.userInterface.monsterHP,     foes[0].HP(),       foes[0].HPMax());
		updateStatBar(this.userInterface.monsterLust,   foes[0].lust(),     foes[0].lustMax());
		updateStatBar(this.userInterface.monsterEnergy, foes[0].energy(),   foes[0].energyMax());
		
		this.userInterface.monsterLevel.values.text = String(foes[0].level);
		this.userInterface.monsterRace.values.text = "Galotian";
		if(foes[0].hasCock()) {
			if(foes[0].hasVagina())	
				this.userInterface.monsterSex.values.text = "Hermaphrodite";
			else this.userInterface.monsterSex.values.text = "Male";
		}
		else if(foes[0].hasVagina()) this.userInterface.monsterSex.values.text = "Female";
		else this.userInterface.monsterSex.values.text = "????";
	}
}
function updateStatBar(arg:MovieClip,value = undefined, max = undefined):void {
	//if(title != "" && title is String) arg.masks.labels.text = title;
	if(max != undefined) 
		arg.setMax(max);
	if(value != undefined && arg.visible == true) 
	{
		if(arg.getGoal() != value) 
		{
			arg.setGoal(value);
			//trace("SETTING GOAL");
		}
	}
}
function setLocation(title:String,planet:String = "Error Planet",system:String = "Error System"):void {
	this.userInterface.leftSideBar.sceneTitle.text = title;
	this.userInterface.leftSideBar.planet.text = planet;
	this.userInterface.leftSideBar.system.text = system;
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

function holeChange(target:Creature,hole:int,volume:Number,display:Boolean = true, spacingsF:Boolean = true, spacingsB:Boolean = false):Boolean {
	var stretched:Boolean = false;
	var devirgined:Boolean = false;
	var capacity:Number;
	var holePointer:VaginaClass;
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