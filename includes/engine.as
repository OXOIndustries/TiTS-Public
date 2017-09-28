import flash.events.MouseEvent;
import flash.ui.Mouse;

public function doParse(script:String, markdown:Boolean = false):String 
{
	return parser.recursiveParser(script, markdown);
}

// HTML tag formatting wrappers, because lazy as fuck
public function header(words:String, newLine:Boolean = true):String
{
	if(!newLine) return String("<span class='header'>" + words + "</span>");
	return String("<span class='header'>" + words + "</span>\n");
}

public function blockHeader(words:String, newLine:Boolean = true):String
{
	if(!newLine) return String("<span class='blockHeader'>" + words + "</span>");
	return String("<span class='blockHeader'>" + words + "</span>\n");
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

public function updatePCStats():void 
{
	if (!inCombat()) userInterface.showPlayerParty([pc]); // Combat will handle this correctly
	
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
//Args[1] = max size.
//Args[2] = boolean for if strapon allowed
//Args[3] = min size
public function penisRouter(args:Array):void
{
	var scene:Function = args[0];
	var maxFit:Number = 700;
	var minFit:Number = 0;
	var straponAllowed:Boolean = true;
	if(args.length > 1) maxFit = args[1];
	if(args.length > 2) straponAllowed = args[2];
	if(args.length > 3) minFit = args[3];

	//Build up a choice of boners:
	var choices:Array = [];
	var ineligibles:Array = [];
	if(pc.hasHardLightEquipped() && straponAllowed) choices.push(-1);
	for(var x:int = 0; x < pc.cockTotal(); x++)
	{
		if(pc.cockVolume(x, true) <= maxFit && pc.cockVolume(x, false) >= minFit) choices.push(x);
		else ineligibles.push(x);
	}
	//Only 1 choice? Go right ahead with no menu.
	if(choices.length == 1) scene(choices[0]);
	else if(choices.length > 1)
	{
		clearOutput();
		showName("\nSELECTING...");
		output("Which of your phallic implements will you use?\n");
		clearMenu();
		for(x = 0; x < choices.length; x++)
		{
			switch(choices[x])
			{
				case -1:
					output("\n(" + (x+1) + ") Your hardlight strap-on?");
					addButton(x,"HL Strapon",scene,choices[x]);
					break;
				case 0:
					output("\n(" + (x+1) + ") Your " + pc.numTwoText(choices[x]+1) + " " + num2Text(pc.cLength(choices[x])) + "-inch [pc.cockNoun " + choices[x] + "]?");
					addButton(x,"First Penis",scene,choices[x]);
					break;
				case 1:
					output("\n(" + (x+1) + ") Your " + pc.numTwoText(choices[x]+1) + " " + num2Text(pc.cLength(choices[x])) + "-inch [pc.cockNoun " + choices[x] + "]?");
					addButton(x,"Second Penis",scene,choices[x]);
					break;
				case 2:
					output("\n(" + (x+1) + ") Your " + pc.numTwoText(choices[x]+1) + " " + num2Text(pc.cLength(choices[x])) + "-inch [pc.cockNoun " + choices[x] + "]?");
					addButton(x,"Third Penis",scene,choices[x]);
					break;
				case 3:
					output("\n(" + (x+1) + ") Your " + pc.numTwoText(choices[x]+1) + " " + num2Text(pc.cLength(choices[x])) + "-inch [pc.cockNoun " + choices[x] + "]?");
					addButton(x,"Fourth Penis",scene,choices[x]);
					break;
				case 4:
					output("\n(" + (x+1) + ") Your " + pc.numTwoText(choices[x]+1) + " " + num2Text(pc.cLength(choices[x])) + "-inch [pc.cockNoun " + choices[x] + "]?");
					addButton(x,"Fifth Penis",scene,choices[x]);
					break;
				case 5:
					output("\n(" + (x+1) + ") Your " + pc.numTwoText(choices[x]+1) + " " + num2Text(pc.cLength(choices[x])) + "-inch [pc.cockNoun " + choices[x] + "]?");
					addButton(x,"Sixth Penis",scene,choices[x]);
					break;
				case 6:
					output("\n(" + (x+1) + ") Your " + pc.numTwoText(choices[x]+1) + " " + num2Text(pc.cLength(choices[x])) + "-inch [pc.cockNoun " + choices[x] + "]?");
					addButton(x,"Seventh Penis",scene,choices[x]);
					break;
				case 7:
					output("\n(" + (x+1) + ") Your " + pc.numTwoText(choices[x]+1) + " " + num2Text(pc.cLength(choices[x])) + "-inch [pc.cockNoun " + choices[x] + "]?");
					addButton(x,"Eight Penis",scene,choices[x]);
					break;
				case 8:
					output("\n(" + (x+1) + ") Your " + pc.numTwoText(choices[x]+1) + " " + num2Text(pc.cLength(choices[x])) + "-inch [pc.cockNoun " + choices[x] + "]?");
					addButton(x,"Ninth Penis",scene,choices[x]);
					break;
				case 9:
					output("\n(" + (x+1) + ") Your " + pc.numTwoText(choices[x]+1) + " " + num2Text(pc.cLength(choices[x])) + "-inch [pc.cockNoun " + choices[x] + "]?");
					addButton(x,"Tenth Penis",scene,choices[x]);
					break;
				default:
					output("\n(" + (x+1) + ") Your " + pc.numTwoText(choices[x]+1) + " " + num2Text(pc.cLength(choices[x])) + "-inch [pc.cockNoun " + choices[x] + "]?");
					addButton(x,"2ManyPenis",scene,choices[x]);
					break;
			}
		}
		if(ineligibles.length > 0) output("\n\nUnsuitable:")
		for(x = 0; x < ineligibles.length; x++)
		{
			output("\n" + pc.NumTwoText(ineligibles[x]+1) + " penis, type: [pc.cockNoun " + ineligibles[x] + "].");
			if(pc.cockVolume(ineligibles[x], true) > maxFit) output(" Reason: Too large.");
			if(pc.cockVolume(ineligibles[x], false) < minFit) output(" Reason: Too small.");
		}
	}
	//Failsafe - assume primary ween
	else scene(0);
}