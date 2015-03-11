import flash.events.MouseEvent;
import flash.ui.Mouse;
	
//Table of Contents
//0. PARSER
//1: TEXT FUNCTIONS
//2. DISPLAY STUFF
//3. UTILITY FUNCTIONS
//4. MOVEMENTS


public function doParse(script:String, markdown:Boolean = false):String 
{
	return parser.recursiveParser(script, markdown);
}


/*
MOST of this should be broken up into simple shim-functions that call the real, relevant function in userInterface:GUI
I'm breaking it out into a separate class, and just manipulating those class variables for the moment
once that's working, I can start piecemeal moving things to functions in GUI.

*/

//1: TEXT FUNCTIONS
public function output(words:String, markdown:Boolean = false, parse:Boolean = true):void 
{
	if (parse) this.userInterface.outputBuffer += doParse(words, markdown);
	else this.userInterface.outputBuffer += words;
	this.userInterface.output();
}

public function clearOutput():void 
{
	if (this.userInterface.imgString != null && this.userInterface.imgString.length > 0) this.userInterface.imgString = "";
	this.userInterface.clearOutput();
}

public function output2(words:String, markdown:Boolean = false):void
{
	this.userInterface.outputBuffer2 += doParse(words, markdown);
	this.userInterface.output2();
}

public function clearOutput2():void
{
	this.userInterface.clearOutput2();
}

public function outputCodex(words:String, markdown:Boolean = false):void
{
	this.userInterface.outputCodexBuffer += doParse(words, markdown);
}

public function clearOutputCodex():void
{
	this.userInterface.clearOutputCodex();
}

// HTML tag formatting wrappers, because lazy as fuck
public function header(words:String):String
{
	return String("<span class='header'>" + words + "</span>\n");
}

public function blockHeader(words:String):String
{
	return String("<span class='blockHeader'>" + words + "</span>\n");
}

public function num2Text(number:Number):String {
	var returnVar:String = null;
	var numWords:Array = new Array("zero","one","two","three","four","five","six","seven","eight","nine","ten");
	if (number > 10 || int(number) != number) {
		returnVar = "" + number;
	} 
	else {
		returnVar = numWords[number];
	}
	return(returnVar);
}
public function num2Text2(number:int):String {
	var returnVar:String = null;
	var numWords:Array = new Array("zero","first","second","third","fourth","fifth","sixth","seventh","eighth","ninth","tenth");
	if (number > 10) {
		returnVar = "" + number + "th";
	} 
	else {
		returnVar = numWords[number];
	}
	return(returnVar);
}

public function author(arg:String):void 
{
	userInterface.author(arg);
}


public function upperCase(str:String):String {
	var firstChar:String = str.substr(0,1);
	var restOfString:String = str.substr(1,str.length);
	return firstChar.toUpperCase()+restOfString.toLowerCase();
}

public function plural(str:String):String {
	//var lastChar: String = str.substr(str.length - 1, str.length);
	//var nextToLastChar: String = str.substr(str.length - 2, str.length - 1);
	var lastChar: String = str.substr(str.length - 1);
	var nextToLastChar: String = str.substr(str.length - 2, 1); //Someone here confused .substr with .substring!
	//Various weird pluralize shits
	if (lastChar == "s") str += "es";
	else if (nextToLastChar == "s" && lastChar == "h") str += "es";
	else if (lastChar == "x") str += "es";
	//Ends in y and consonant before, ex: pussy -> pussies
	else if (lastChar == "y" && nextToLastChar != "e" && nextToLastChar != "a" && nextToLastChar != "u" && nextToLastChar != "o" && nextToLastChar != "i") 
	{
		var temp:String = str.substr(0, str.length-1);
		str = temp + "ies";
	}
	//Normal pluralizes
	else str += "s";
	return str;
}
public function possessive(str:String):String {
	var lastChar:String = str.substr(str.length-1,str.length);
	if(lastChar == "s") str += "'";
	else str += "'s";
	return str;
}

public function leftBarClear():void {
	this.userInterface.leftBarClear();
}
public function hidePCStats():void {
	this.userInterface.hidePCStats()
}
public function showPCStats():void {
	this.userInterface.showPCStats()
}
public function showNPCStats():void {
	this.userInterface.showNPCStats()
}
public function hideNPCStats():void {
	this.userInterface.hideNPCStats()
}
public function showMinimap():void {
	this.userInterface.showMinimap();
}
public function hideMinimap():void {
	this.userInterface.hideMinimap();
}
public function deglow():void 
{
	this.userInterface.deglow()
}
public function resetBarStates():void
{
	userInterface.playerShields.updateBar(0, 100, true);
	userInterface.playerHP.updateBar(0, 100, true);
	userInterface.playerEnergy.updateBar(0, 100, true);
	
	userInterface.playerPhysique.updateBar(0, 5, true);
	userInterface.playerReflexes.updateBar(0, 5, true);
	userInterface.playerAim.updateBar(0, 5, true);
	userInterface.playerIntelligence.updateBar(0, 5, true);
	userInterface.playerWillpower.updateBar(0, 5, true);
	userInterface.playerLibido.updateBar(0, 5, true);
	userInterface.playerXP.updateBar(0, 500, true);
	userInterface.playerLevel.updateBar(0, 8, true);
	userInterface.playerCredits.updateBar(0, 500, true);
}
public function updatePCStats(setBars:Boolean = false):void 
{
	if (pc.short != "uncreated" && pc.short.length > 0)
		this.userInterface.setGuiPlayerNameText(pc.short);
	else
		this.userInterface.setGuiPlayerNameText("");

	userInterface.playerShields.updateBar(pc.shields(),pc.shieldsMax(), setBars);

	userInterface.playerHP.updateBar(pc.HP(),pc.HPMax(), setBars);
	userInterface.playerLust.updateBar(pc.lust(),pc.lustMax(), setBars);
	userInterface.playerEnergy.updateBar(pc.energy(),pc.energyMax(), setBars);
	
	userInterface.playerPhysique.updateBar(pc.physique(),pc.physiqueMax(), setBars);	
	userInterface.playerReflexes.updateBar(pc.reflexes(),pc.reflexesMax(), setBars);
	userInterface.playerAim.updateBar(pc.aim(),pc.aimMax(), setBars);
	userInterface.playerIntelligence.updateBar(pc.intelligence(),pc.intelligenceMax(), setBars);
	userInterface.playerWillpower.updateBar(pc.willpower(),pc.willpowerMax(), setBars);
	userInterface.playerLibido.updateBar(pc.libido(), pc.libidoMax(), setBars);
	userInterface.playerXP.updateBar(pc.XP(), pc.XPMax(), setBars);
	
	userInterface.playerStatusEffects = this.chars["PC"].statusEffects;
	userInterface.playerLevel.updateBar(pc.level, Number.NaN, setBars);
	userInterface.playerCredits.updateBar(pc.credits, Number.NaN, setBars);
	
	userInterface.time = timeText();
	userInterface.days = String(days);
	userInterface.showSceneTag();
	
	if ((pc as PlayerCharacter).levelUpAvailable())
	{
		if (gameOverEvent == true || inSceneBlockSaving == true)
		{
			userInterface.levelUpButton.Deactivate();
		}
		else
		{
			userInterface.levelUpButton.Activate();
		}
	}
	else
	{
		userInterface.levelUpButton.Deactivate();
	}
	
	updateNPCStats();
}
public function timeText():String 
{
	var buffer:String = ""
	
	if (hours < 10)
	{
		buffer += "0";
	}
	
	buffer += hours + ":";
	
	if (minutes < 10) 
	{
		buffer += "0";
	}
	
	buffer += minutes;
	return buffer;
}

public function resetNPCBarStates():void
{
	userInterface.monsterShield.updateBar(0, 100, true);
	userInterface.monsterHP.updateBar(0, 100, true);
	userInterface.monsterLust.updateBar(0, 100, true);
	userInterface.monsterEnergy.updateBar(0, 100, true);
}

public function updateNPCStats():void {
	if(foes.length >= 1) {
		userInterface.monsterShield.updateBar(foes[0].shields(),  foes[0].shieldsMax());
		userInterface.monsterHP.updateBar(foes[0].HP(),       foes[0].HPMax());
		userInterface.monsterLust.updateBar(foes[0].lust(),     foes[0].lustMax());
		userInterface.monsterEnergy.updateBar(foes[0].energy(),   foes[0].energyMax());
		
		this.userInterface.monsterLevel.updateBar(String(foes[0].level));
		this.userInterface.monsterRace.updateBar(StringUtil.toTitleCase(foes[0].originalRace));
		
		var gText:String = "";
		if(foes[0] is NyreaAlpha || foes[0] is NyreaBeta) gText = "Female???";
		else if(foes[0].hasCock()) {
			if (foes[0].hasVagina()) gText = "Herm";
			else gText = "Male";
		}
		else if (foes[0].hasVagina()) gText = "Female";
		else gText = "???";
		
		this.userInterface.monsterSex.updateBar(gText);
		
		this.userInterface.monsterStatusEffects = foes[0].statusEffects;
	}
}
public function updateStatBar(arg:MovieClip, value:* = undefined, max:* = undefined):void {
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

public function setLocation(title:String, planet:String = "Error Planet", system:String = "Error System"):void 
{
	userInterface.setLocation(title, planet, system);
}

//3. UTILITY FUNCTIONS
public function rand(max:Number):Number
{
	return int(Math.random()*max);
}

public function clearList():void {
	list = new Array();
}
public var list:Array = new Array();
public function addToList(arg:*):void {
	list[list.length] = arg;
}
public function formatList():String {
	var stuff:String = "";
	if(list.length == 1) return list[0];
	for(var x:int = 0; x < list.length; x++) {
		stuff += list[x];
		if(list.length == 2 && x == 0) {
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