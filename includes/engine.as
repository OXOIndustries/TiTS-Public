import flash.events.MouseEvent;
import flash.ui.Mouse;

public function doParse(script:String, markdown:Boolean = false):String 
{
	return parser.recursiveParser(script, markdown);
}

// HTML tag formatting wrappers, because lazy as fuck
public function header(words:String, newLine:Boolean = true):String
{
	if(!newLine) return ("<span class='header'>" + words + "</span>");
	return ("<span class='header'>" + words + "</span>\n");
}

public function blockHeader(words:String, newLine:Boolean = true):String
{
	if(!newLine) return ("<span class='blockHeader'>" + words + "</span>");
	return ("<span class='blockHeader'>" + words + "</span>\n");
}

//1: TEXT FUNCTIONS
private var _bufferChanged:Boolean = false;
private var _buffer2Changed:Boolean = false;

private function updateBuffers(e:Event = null):void
{
	if (_bufferChanged)
	{
		_bufferChanged = false;
		userInterface.output();
	}
	if (_buffer2Changed)
	{
		_buffer2Changed = false;
		userInterface.output2();
	}
}

public function output(words:String, markdown:Boolean = false, parse:Boolean = true):void 
{
	if (parse) this.userInterface.outputBuffer += doParse(words, markdown);
	else this.userInterface.outputBuffer += words;
	
	_bufferChanged = true;
	//this.userInterface.output();
}

public function clearOutput():void 
{
	if (this.userInterface.imgString != null && this.userInterface.imgString.length > 0) this.userInterface.imgString = "";
	this.userInterface.clearOutput();
	_bufferChanged = true;
	//If clearOutput is called in a way that would prevent the player seeing their event notices, append those notices to the new page.
	if (flags["EVENT_BUFFER_OVERRIDE"])
	{
		if(samePageLog)
		{
			var eventBuffer:String = processEventBuffer();
			if (eventBuffer != "") output(eventBuffer + "<b><u>End log.</u></b>\n\n");
			clearEventBuffer();
		}
		flags["EVENT_BUFFER_OVERRIDE"] = undefined;
	}
}

public function output2(words:String, markdown:Boolean = false):void
{
	this.userInterface.outputBuffer2 += doParse(words, markdown);
	_buffer2Changed = true;
	//this.userInterface.output2();
}

public function clearOutput2():void
{
	_buffer2Changed = true;
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

/*
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
*/

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

public function updatePCStats(asInit:Boolean = false):void 
{
	if (!inCombat()) userInterface.showPlayerParty([pc], asInit); // Combat will handle this correctly
	
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
}

public function setLocation(title:String, planet:String = "Error Planet", system:String = "Error System"):void 
{
	userInterface.setLocation(title, planet, system);
}

public function clearList():void
{
	list = new Array();
}

public var list:Array = new Array();

public function addToList(arg:*):void
{
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

//Args[0] = target scene.
//Args[1] = Cock Size, if known.
//Args[2] = -1 if butts only, 0 if vagina only, 1 if both :3
//Args[3] = 1 must be pregnant, -1 if must not be pregnant, 0 if it doesnt matter
//Args[4] = true/false to disable/enable blocked orifices, respectively
public function vaginaRouter(args:Array):void
{
	var scene:Function = args[0];
	var cockSize:Number = 0;
	if(args.length > 1) cockSize = args[1];
	var buttsOkay:Boolean = false;
	var cuntsOkay:Boolean = true;
	if(args.length > 2) 
	{
		buttsOkay = (args[2] == -1 || args[2] == 1);
		cuntsOkay = (args[2] == 0 || args[2] == 1);
	}
	var pregHoles:Boolean = false;
	var unpregHoles:Boolean = false;
	if(args.length > 3)
	{
		pregHoles = (args[3] >= 0);
		unpregHoles = (args[3] <= 0);
	}
	var noBlockedHoles:Boolean = (args.length > 4 ? args[4] : false);

	//Build up a choice of holes.
	var choices:Array = [];
	var ineligibles:Array = [];
	//Cunts to build :3
	if(cuntsOkay && pc.hasVagina())
	{
		for(var x:int = 0; x < pc.totalVaginas(); x++)
		{
			if(noBlockedHoles && pc.isBlocked(x)) ineligibles.push(x);
			else if((pregHoles && unpregHoles) || (pregHoles && pc.isPregnant(x)) || (unpregHoles && !pc.isPregnant(x))) choices.push(x);
			else ineligibles.push(x);
		}
	}
	//Butt check :3
	if(buttsOkay)
	{
		if(noBlockedHoles && pc.isBlocked(-1)) ineligibles.push(-1);
		else if((pregHoles && unpregHoles) || (pregHoles && pc.isPregnant(3)) || (unpregHoles && !pc.isPregnant(3))) choices.push(-1);
		else ineligibles.push(-1);
	}

	//Only one choice? Use it
	if(choices.length == 1) scene(choices[0]);
	//If choices, pick one.
	else if(choices.length > 1)
	{
		clearOutput();
		showName("\nSELECTING...");
		output("Which of your ");
		if(cuntsOkay && buttsOkay) output("holes");
		else output("vaginas");
		output(" will you use?");
		clearMenu();
		if(choices.length > 0) output("\n\n<b><u>Suitable:</u></b>");
		for(x = 0; x < choices.length; x++)
		{
			switch(choices[x])
			{
				case -1:
					output("\n<b>Anus:</b> " + vaginaRouterDesc(choices[x]));
					addButton(x, "Anus", scene, choices[x], "Anus", "Use your [pc.asshole].");
					break;
				default:
					if(choices[x] == 0 && pc.vaginas.length == 1)
					{
						output("\n<b>Vagina:</b>" + vaginaRouterDesc(choices[x]));
						addButton(x, "Vagina", scene, choices[x], "Vagina", "Use your [pc.vagina].");
					}
					else
					{
						output("\n<b>" + StringUtil.capitalize(num2Ordinal(choices[x] + 1)) + " Vagina:</b>" + vaginaRouterDesc(choices[x]));
						addButton(x, ("Vagina " + (choices[x] + 1)), scene, choices[x], StringUtil.capitalize(num2Ordinal(choices[x] + 1)) + " Vagina", "Use your [pc.vagina " + choices[x] + "].");
					}
					break;
			}
			if(choices[x] >= 0)
			{
				if(cockSize > pc.vaginalCapacity(choices[x])) output(", <b>Stretch Likely!</b>");
				else if(cockSize > pc.vaginalCapacity(choices[x]) * 0.75) output(", <b>Stretch Possible!</b>")
			}
			else
			{
				if(cockSize > pc.analCapacity()) output(", <b>Stretch Likely!</b>");
				else if(cockSize > pc.analCapacity() * 0.75) output(", <b>Stretch Possible!</b>")
			}
		}
		if(ineligibles.length > 0) output("\n\n<b><u>Unsuitable:</u></b>");
		for(x = 0; x < ineligibles.length; x++)
		{
			if(ineligibles[x] == -1) output("\n<b>Anus:</b> " + vaginaRouterDesc(ineligibles[x]));
			else if(ineligibles[x] == 0 && pc.vaginas.length == 1) output("\n<b>Vagina:</b>" + vaginaRouterDesc(ineligibles[x]));
			else output("\n<b>" + StringUtil.capitalize(num2Ordinal(ineligibles[x] + 1)) + " Vagina:</b>" + vaginaRouterDesc(ineligibles[x]));
			
			var notes:Array = [];
			
			if(noBlockedHoles && pc.isBlocked(ineligibles[x])) notes.push("Orifice Blocked.");
			if(!cuntsOkay && ineligibles[x] >= 0) notes.push("Vaginas Ineligible.");
			if(!buttsOkay && ineligibles[x] < 0) notes.push("Anal Ineligible.");
			if(ineligibles[x] >= 0 && pc.isPregnant(ineligibles[x]) && !pregHoles && unpregHoles) notes.push("Pregnancy Blocked.");
			if(ineligibles[x] < 0 && pc.isPregnant(3) && !pregHoles && unpregHoles) notes.push("Pregnancy Blocked.");
			if(ineligibles[x] >= 0 && !pc.isPregnant(ineligibles[x]) && !unpregHoles && pregHoles) notes.push("Req’s Pregnancy.");
			if(ineligibles[x] < 0 && !pc.isPregnant(3) && !unpregHoles && pregHoles) notes.push("Req’s Pregnancy.");
			
			if(notes.length > 0)
			{
				var note:String = "";
				for(var n:int = 0; n < notes.length; n++)
				{
					if(n > 0) note += " ";
					note += notes[n];
				}
				if(note != "") output(" (" + note + ")");
			}
		}
	}
	//Failsafe - assume primary vagina, if exists
	else {
		clearOutput();
		showName("\nFUCK");
		output("ERROR: Eligible: " + choices.length + ", Uneligible: " + ineligibles.length + ", Preg: " + pregHoles + ", Unpreg: " + unpregHoles);
	}
	//scene((cuntsOkay && pc.hasVagina()) ? 0 : -1);
}
public function vaginaRouterDesc(vIdx:int = -1, fullDesc:Boolean = false):String
{
	var hole:VaginaClass = (vIdx < 0 ? pc.ass : pc.vaginas[vIdx]);
	
	var msg:String = "";
	var i:int = 0;
	
	if(fullDesc)
	{
		if(hole.vagooFlags.length > 0)
		{
			for(i = 0; i < hole.vagooFlags.length; i++)
			{
				msg += (" " + GLOBAL.FLAG_NAMES[hole.vagooFlags[i]] + ",");
			}
		}
		if(vIdx >= 0 && hole.vaginaColor != "") msg += (" " + StringUtil.toDisplayCase(hole.vaginaColor) + ",");
	}
	if((vIdx < 0 && pc.analVirgin) || (vIdx >= 0 && hole.hymen)) msg += (" Virgin");
	if(vIdx >= 0) msg += (" " + GLOBAL.TYPE_NAMES[hole.type]);
	else msg += (" Asshole");
	if(hole.looseness() > 0) msg += (", " + formatFloat(hole.looseness(), 3) + "/5 looseness");
	if(hole.wetness() > 0) msg += (", " + formatFloat(hole.wetness(), 3) + "/5 wetness");
	
	return msg;
}

//Args[0] = target scene.
//Args[1] = max size. (80085 for infinite!)
//Args[2] = boolean for if strapon allowed
//Args[3] = min size
//Args[4] = unselectable indexes
public function cockSelect(args:Array):void { penisRouter(args); }
public function penisRouter(args:Array):void
{
	var scene:Function = args[0];
	var maxFit:Number = 700;
	var minFit:Number = 0;
	var straponAllowed:Boolean = true;
	var noSelect:Array = [];
	if(args.length > 1) maxFit = args[1];
	if(args.length > 2) straponAllowed = args[2];
	if(args.length > 3) minFit = args[3];
	if(args.length > 4) noSelect = args[4];

	//Build up a choice of boners:
	var choices:Array = [];
	var ineligibles:Array = [];
	if(pc.hasHardLightEquipped() && straponAllowed) choices.push(-1);
	for(var x:int = 0; x < pc.cockTotal(); x++)
	{
		if(pc.cockVolume(x, true) <= maxFit && pc.cockVolume(x, false) >= minFit && noSelect.indexOf(x) < 0) choices.push(x);
		//maxfit of 80085 = infinite dongers!
		else if(pc.cockVolume(x, false && noSelect.indexOf(x) < 0) >= minFit) choices.push(x);
		else ineligibles.push(x);
	}
	//Only 1 choice? Go right ahead with no menu.
	if(choices.length == 1) scene(choices[0]);
	else if(choices.length > 1)
	{
		clearOutput();
		showName("\nSELECTING...");
		output("Which of your phallic implements will you use?");
		clearMenu();
		if(choices.length > 0) output("\n\n<b><u>Suitable:</u></b>");
		for(x = 0; x < choices.length; x++)
		{
			switch(choices[x])
			{
				case -1:
					output("\n<b>Hardlight Strap-On:</b> " + StringUtil.toDisplayCase(pc.lowerUndergarment.longName));
					addButton(x, "HL Strapon", scene, choices[x], "Hardlight Strap-On", "Use the dildo from your [pc.lowerUndergarment].");
					break;
				default:
					if(choices[x] == 0 && pc.cocks.length == 1)
					{
						output("\n<b>Penis:</b>" + penisRouterCockDesc(choices[x]));
						addButton(x, "Penis", scene, choices[x], "Penis", "Use your [pc.cock].");
					}
					else
					{
						output("\n<b>" + StringUtil.capitalize(num2Ordinal(choices[x] + 1)) + " Penis:</b>" + penisRouterCockDesc(choices[x]));
						addButton(x, ("Penis " + (choices[x] + 1)), scene, choices[x], StringUtil.capitalize(num2Ordinal(choices[x] + 1)) + " Penis", "Use your [pc.cock " + choices[x] + "].");
					}
					break;
			}
		}
		if(ineligibles.length > 0) output("\n\n<b><u>Unsuitable:</u></b>");
		for(x = 0; x < ineligibles.length; x++)
		{
			if(ineligibles[x] == -1) output("\n<b>Hardlight Strap-On:</b> " + StringUtil.toDisplayCase(pc.lowerUndergarment.longName));
			else if(ineligibles[x] == 0 && pc.cocks.length == 1) output("\n<b>Penis:</b>" + penisRouterCockDesc(ineligibles[x]));
			else output("\n<b>" + StringUtil.capitalize(num2Ordinal(ineligibles[x] + 1)) + " Penis:</b>" + penisRouterCockDesc(ineligibles[x]));
			
			var notes:Array = [];
			
			if(pc.cockVolume(ineligibles[x], true) > maxFit) notes.push("Too large.");
			if(pc.cockVolume(ineligibles[x], false) < minFit) notes.push("Too small.");
			
			if(notes.length > 0)
			{
				var note:String = "";
				for(var n:int = 0; n < notes.length; n++)
				{
					if(n > 0) note += " ";
					note += notes[n];
				}
				if(note != "") output(" (" + note + ")");
			}
		}
	}
	//Failsafe - assume primary ween
	else scene(0);
}
public function penisRouterCockDesc(cIdx:int = 0, fullDesc:Boolean = false):String
{
	if(cIdx < 0 || cIdx >= pc.cocks.length) return (" ERROR: Penis of index " + cIdx + " does not exist!");
	
	var msg:String = "";
	var i:int = 0;
	
	if(fullDesc)
	{
		if(pc.cocks[cIdx].cockFlags.length > 0)
		{
			for(i = 0; i < pc.cocks[cIdx].cockFlags.length; i++)
			{
				msg += (" " + GLOBAL.FLAG_NAMES[pc.cocks[cIdx].cockFlags[i]] + ",");
			}
		}
		if(pc.cocks[cIdx].cockColor != "") msg += (" " + StringUtil.toDisplayCase(pc.cocks[cIdx].cockColor) + ",");
	}
	msg += (" " + GLOBAL.TYPE_NAMES[pc.cocks[cIdx].cType]);
	if(pc.cocks[cIdx].cLength() > 0) msg += (", " + formatFloat(pc.cocks[cIdx].cLength(), 3) + " in long");
	if(pc.cocks[cIdx].thickness() > 0) msg += (", " + formatFloat(pc.cocks[cIdx].thickness(), 3) + " in thick");
	
	return msg;
}

// args:
// 0 - scene function, should be (genitalIndex:int, useVag:Boolean):void
// 1 - penisArgs for penisRouter (required, skip scene)
// 2 - vaginaArgs for vaginaRouter (required, skip scene)
// 3 - use vagina 0 if neuter pc? (default yes)
public function hermRouter(args:Array):void
{
	var scene:Function = args[0];
	var penisArgs:Array = [function (cockIdx:int):void { scene(cockIdx, false) }].concat(args[1]);
	var vaginaArgs:Array = [function (vagIdx:int):void { scene(vagIdx, true) }].concat(args[2]);
	var vagDefault:Boolean = (args.length > 3 ? args[3] : true);
	if (pc.isHerm())
	{
		clearOutput();
		showName("\nSELECTING...");
		output("Which set of implements will you use?");
		clearMenu();
		addButton(0, (pc.hasCocks() ? "Penises" : "Penis"), penisRouter, penisArgs);
		addButton(1, (pc.hasVaginas() ? "Vaginas" : "Vagina"), vaginaRouter, vaginaArgs);
	}
	else if (pc.hasCock()) penisRouter(penisArgs);
	else if (pc.hasVagina()) vaginaRouter(vaginaArgs);
	else scene(0, vagDefault);
}