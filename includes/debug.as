
/*

Debug pane and related functions

Author: Fake-Name

*/

/*
public function monkeyStartConfirm():void
{
	outputText(<![CDATA[

Chaos Monkah!

This is a testing tool intended to generate random button presses.

**THIS CAN (and probably will) OVERWRITE YOUR SAVE FILES AS A CONSEQUENCE OF HOW IT WORKS**

**SERIOUSLY. YOU NEED TO BE SURE YOU WANT TO DO THIS, AND DO NOT COMPLAIN IF YOU TRIED IT JUST "BECAUSE YOU WERE CURIOUS"**

If you have an open-game, it **WILL** cause your PC to take actions which you 
probably do not intend. 

**CAUTION. THE ONLY WAY TO STOP THE CHAOS MONKEY IS TO CLOSE THE GAME**   
(Yeah, I want to fix that)
	]]>, true, true);

	this.monkey.throwOnSyntaxError = false;
	this.monkey.excludeMenuKeys = false;
	menu();
	addButton(0, "ChaosMonkey",   monkeyStartReallyConfirm);
	addButton(1, "NoMenuMonkey",   noSaveMonkey);
	addButton(5, "SyntaxMonkey",   syntaxMonkey);
	addButton(9, "No",            debugPane)
}


public function syntaxMonkey():void
{
	this.monkey.throwOnSyntaxError = true;
	this.monkey.excludeMenuKeys = true;			// Syntax checking monkey should ignore the menu keys (they're irrelevant to it's functions)
	monkeyStartReallyConfirm()
}

public function noSaveMonkey():void
{
	this.monkey.excludeMenuKeys = true;
	monkeyStartReallyConfirm()
}


public function monkeyStartReallyConfirm():void
{
	outputText(<![CDATA[

**NO REALLY, THIS WILL PROBABLY OVERWRITE YOUR SAVES.**

**ARE YOU REALLY, *REALLY* SURE?**

	]]>, true, true);

	doYesNo(initiateTheMonkey, debugPane)
}


public function initiateTheMonkey():void
{
	// I swear, half the fun of this is just the function names I can write.
	outputText(<![CDATA[
INITIATING MONKEY
	]]>, true, true);
	
	this.monkey.createChaos();

	if (this.player.str) // we're in a game
		doNext(13);      // so dump out to the camp scene
	else
		doNext(newGameGo);   // not in a game, create a char randomly
}

*/
public function debugPaneExit():void
{

	this.userInterface.clearMenu();
	if (this.pc.short != "uncreated")
		this.postLoadToZeGame();
	else
		this.mainMenu();
}


public function debugPane():void
{
	this.userInterface.hideMainMenu();
	this.clearOutput();

	this.output("<b>Debug information!</b>\n");

	this.output("\nPossible flash sandboxing contexts:");
	this.output("<ul>");
	this.output("<li><b>\"localWithNetwork\"</b> means images <b><u>will not work</u></b>!</li>");
	this.output("<li><b>\"localWithFile\"</b> means images can work.</li>");
	this.output("<li><b>\"localTrusted\"</b> means images can work, and you've somehow managed to install this swf into a flash trusted directory. How did you manage that?</li>");
	this.output("</ul>");
	this.output("\nNote that you still need the proper folder structure to have functional images.");

	this.output("\n\nCurrent Sandbox mode: <b>" + Security.sandboxType + "</b>");
	this.output("\n<hr /> --------"); // HR Tag! WHY U NO WORK?

	// this.output("\nCurrently have " + images.getLoadedImageCount() + " images loaded into cache.");
	


	//if (CoC_Settings.haltOnErrors)  // Using a static class so I can grab it from anywhere.
	//	this.output("\nCurrently set to halt on all errors.");
	//else
	//	this.output("\nParsing or description errors only generate warning message");

	this.output("\n<hr /> --------"); // HR Tag! WHY U NO WORK?

	this.output("\n\n<b>FUNCTIONALITY ON THIS PAGE IS IN ALPHA-RELEASE STATUS</b>\n");
	this.output("<b>IF YOU DON'T KNOW WHAT YOU ARE DOING AND/OR HAVE UNSAVED GAME PROGRESS, DO NOT CLICK ANY BUTTON EXCEPT \"BACK\"</b>\n");

	
	//this.output(images.showImage("monster-ceraph"));

	this.userInterface.clearMenu();
	//this.userInterface.addButton(0, "Event Tester", eventTestingPane);
	//this.userInterface.addButton(1, "Test Input", eventTester);
	this.userInterface.addButton(5, "Parser Tests", doThatTestingThang);
	//this.userInterface.addButton(6, "Halt on Errors", toggleHaltSettings);
	//this.userInterface.addButton(3, "ChaosMonkey", monkeyStartConfirm)
	this.userInterface.addButton(9, "Back", debugPaneExit);
}
/*
public function toggleHaltSettings():void
{
	//toggle debug
	if(CoC_Settings.haltOnErrors)
		CoC_Settings.haltOnErrors = false;
	else
		CoC_Settings.haltOnErrors = true;
	debugPane();
	return;
}
*/



import flash.system.SecurityDomain;
import flash.system.Security;

public function doThatTestingThang():void
{

	// Excercise the parser. This should catch parser regressions, I think.
	// 
	// 
	this.clearOutput();

	this.output(<![CDATA[

**Parser Tests!**

##Bracket escaping!##

* \\\[cock\\\]
* [cock]

**Single word nouns**

* \\\[pc.gear\\\]                  - [pc.gear]
* \\\[pc.short\\\]                 - [pc.short]
* \\\[pc.name\\\]                  - [pc.name]
* \\\[pc.race\\\]                  - [pc.race]
* \\\[pc.armor\\\]                 - [pc.armor]
* \\\[pc.lowerUndergarment\\\]     - [pc.lowerUndergarment]
* \\\[pc.upperUndergarment\\\]     - [pc.upperUndergarment]
* \\\[pc.originalRace\\\]          - [pc.originalRace]
* \\\[pc.skinFurScales\\\]         - [pc.skinFurScales]
* \\\[pc.skin\\\]                  - [pc.skin]
* \\\[pc.hairDescript\\\]          - [pc.hairDescript]
* \\\[pc.hair\\\]                  - [pc.hair]
* \\\[pc.hairsDescript\\\]         - [pc.hairsDescript]
* \\\[pc.face\\\]                  - [pc.face]
* \\\[pc.lips\\\]                  - [pc.lips]
* \\\[pc.lip\\\]                   - [pc.lip]
* \\\[pc.tongue\\\]                - [pc.tongue]
* \\\[pc.base\\\]                  - [pc.base]
* \\\[pc.sheath\\\]                - [pc.sheath]
* \\\[pc.knot\\\]                  - [pc.knot]
* \\\[pc.multiCockDescript\\\]     - [pc.multiCockDescript]
* \\\[pc.cocks\\\]                 - [pc.cocks]
* \\\[pc.cocksDescript\\\]         - [pc.cocksDescript]
* \\\[pc.cocksDescriptLight\\\]    - [pc.cocksDescriptLight]
* \\\[pc.cocksLight\\\]            - [pc.cocksLight]
* \\\[pc.cockNounComplex\\\]       - [pc.cockNounComplex 0]
* \\\[pc.cockNounSimple\\\]        - [pc.cockNounSimple 0]
* \\\[pc.cockHead\\\]              - [pc.cockHead 0]
* \\\[pc.cockhead\\\]              - [pc.cockhead 0]
* \\\[pc.cockHeads\\\]             - [pc.cockHeads]
* \\\[pc.cockDescript\\\]          - [pc.cockDescript]
* \\\[pc.cock\\\]                  - [pc.cock]
* \\\[pc.biggestCockDescript\\\]   - [pc.biggestCockDescript]
* \\\[pc.biggestCock\\\]           - [pc.biggestCock]
* \\\[pc.cockBiggest\\\]           - [pc.cockBiggest]
* \\\[pc.biggestCockHead\\\]       - [pc.biggestCockHead]
* \\\[pc.cockHeadBiggest\\\]       - [pc.cockHeadBiggest]
* \\\[pc.eachCockHead\\\]          - [pc.eachCockHead]
* \\\[pc.tailCock\\\]              - [pc.tailCock]
* \\\[pc.cockTail\\\]              - [pc.cockTail]
* \\\[pc.nipple\\\]                - [pc.nipple]
* \\\[pc.nippleDescript\\\]        - [pc.nippleDescript]
* \\\[pc.nipples\\\]               - [pc.nipples]
* \\\[pc.nipplesDescript\\\]       - [pc.nipplesDescript]
* \\\[pc.nippleCockDescript\\\]    - [pc.nippleCockDescript]
* \\\[pc.nippleCock\\\]            - [pc.nippleCock]
* \\\[pc.nippleCocksDescript\\\]   - [pc.nippleCocksDescript]
* \\\[pc.nippleCocks\\\]           - [pc.nippleCocks]
* \\\[pc.eachCock\\\]              - [pc.eachCock]
* \\\[pc.oneCock\\\]               - [pc.oneCock]
* \\\[pc.ballsDescript\\\]         - [pc.ballsDescript]
* \\\[pc.balls\\\]                 - [pc.balls]
* \\\[pc.sackDescript\\\]          - [pc.sackDescript]
* \\\[pc.sack\\\]                  - [pc.sack]
* \\\[pc.chestDesc\\\]             - [pc.chestDesc]
* \\\[pc.chest\\\]                 - [pc.chest]
* \\\[pc.allChestDescript\\\]      - [pc.allChestDescript]
* \\\[pc.fullChest\\\]             - [pc.fullChest]
* \\\[pc.biggestBreastDescript\\\] - [pc.biggestBreastDescript]
* \\\[pc.sheathDescript\\\]        - [pc.sheathDescript]
* \\\[pc.sheath\\\]                - [pc.sheath]
* \\\[pc.biggestSheath\\\]         - [pc.biggestSheath]
* \\\[pc.cockClit\\\]              - [pc.cockClit]
* \\\[pc.sackDescript\\\]          - [pc.sackDescript]
* \\\[pc.assholeDescript\\\]       - [pc.assholeDescript]
* \\\[pc.asshole\\\]               - [pc.asshole]
* \\\[pc.buttDescript\\\]          - [pc.buttDescript]
* \\\[pc.butt\\\]                  - [pc.butt]
* \\\[pc.hipDescript\\\]           - [pc.hipDescript]
* \\\[pc.hip\\\]                   - [pc.hip]
* \\\[pc.hipsDescript\\\]          - [pc.hipsDescript]
* \\\[pc.hips\\\]                  - [pc.hips]
* \\\[pc.vaginaDescript\\\]        - [pc.vaginaDescript]
* \\\[pc.vagina\\\]                - [pc.vagina]
* \\\[pc.pussy\\\]                 - [pc.pussy]
* \\\[pc.cunt\\\]                  - [pc.cunt]
* \\\[pc.vaginasDescript\\\]       - [pc.vaginasDescript]
* \\\[pc.vaginas\\\]               - [pc.vaginas]
* \\\[pc.pussies\\\]               - [pc.pussies]
* \\\[pc.eachVagina\\\]            - [pc.eachVagina]
* \\\[pc.oneVagina\\\]             - [pc.oneVagina]
* \\\[pc.vagOrAss\\\]              - [pc.vagOrAss]
* \\\[pc.pussyOrAsshole\\\]        - [pc.pussyOrAsshole]
* \\\[pc.clitDescript\\\]          - [pc.clitDescript]
* \\\[pc.clit\\\]                  - [pc.clit]
* \\\[pc.eachClit\\\]              - [pc.eachClit]
* \\\[pc.oneClit\\\]               - [pc.oneClit]
* \\\[pc.clitsDescript\\\]         - [pc.clitsDescript]
* \\\[pc.clits\\\]                 - [pc.clits]
* \\\[pc.tailVagina\\\]            - [pc.tailVagina]
* \\\[pc.tailCunt\\\]              - [pc.tailCunt]
* \\\[pc.cuntTail\\\]              - [pc.cuntTail]
* \\\[pc.tailgina\\\]              - [pc.tailgina]
* \\\[pc.milkDescript\\\]          - [pc.milkDescript]
* \\\[pc.milk\\\]                  - [pc.milk]
* \\\[pc.cumDescript\\\]           - [pc.cumDescript]
* \\\[pc.cum\\\]                   - [pc.cum]
* \\\[pc.girlCumDescript\\\]       - [pc.girlCumDescript]
* \\\[pc.girlCum\\\]               - [pc.girlCum]
* \\\[pc.cumNoun\\\]               - [pc.cumNoun]
* \\\[pc.cumColor\\\]              - [pc.cumColor]
* \\\[pc.girlCumColor\\\]          - [pc.girlCumColor]
* \\\[pc.milkColor\\\]             - [pc.milkColor]
* \\\[pc.tail\\\]                  - [pc.tail]
* \\\[pc.leg\\\]                   - [pc.leg]
* \\\[pc.legs\\\]                  - [pc.legs]
* \\\[pc.feet\\\]                  - [pc.feet]
* \\\[pc.foot\\\]                  - [pc.foot]
* \\\[pc.toes\\\]                  - [pc.toes]
* \\\[pc.knees\\\]                 - [pc.knees]
* \\\[pc.belly\\\]                 - [pc.belly]



**Boolean tests**

* 1 \\\[if (4==4) HERP|DERP\\\]
* 1 [if (4==4) HERP|DERP]
* 2 \\\[if (4 == 7) HERP|DERP\\\]
* 2 [if (4 == 7) HERP|DERP]
* 3 \\\[if (4==(2+2)) HERP|DERP\\\]
* 3 [if (4==(2+2)) HERP|DERP]
* 4 \\\[if (4==4) HERP|DERP\\\]
* 4 [if (4==4) HERP|DERP]
* 5 \\\[if (4==7) [if (4==7) HERP]\\\]
* 5 [if (4==7) [if (4==7) HERP]]
* 6 \\\[if (4==7) [if (4==7) HERP|DERP]\\\]
* 6 [if (4==7) [if (4==7) HERP|DERP]]
* 7 \\\[if (4=4) [if (4=4) HERP]\\\]
* 7 [if (4=4) [if (4=4) HERP]]
* 8 \\\[if (4==4) [if (4==4) HERP]\\\]
* 8 [if (4==4) [if (4==4) HERP]]
* 9 \\\[if (4==biggesttitsize) \\\]
* 9 [if (4==biggesttitsize) ]
* 10 \\\[if (4==biggesttitsize) HERP|DERP\\\]
* 10 [if (4==biggesttitsize) HERP|DERP]
* 11 \\\[if (analcapacity>3)    HERP|DERP\\\]
* 11 [if (analcapacity>3)    HERP|DERP]
* 12 \\\[if (analcapacity>3) HERP|DERP\\\]
* 12 [if (analcapacity>3) HERP|DERP]
* 13 \\\[if (analcapacity = 0)  HERP|DERP\\\]
* 13 [if (analcapacity = 0)  HERP|DERP]
* 14 \\\[if (analcapacity = 0) HERP|DERP\\\]
* 14 [if (analcapacity = 0) HERP|DERP]
* 15 \\\[if (analcapacity > 0)  HERP|DERP\\\]
* 15 [if (analcapacity > 0)  HERP|DERP]
* 16 \\\[if (analcapacity > 0) HERP|DERP\\\]
* 16 [if (analcapacity > 0) HERP|DERP]
* 17 \\\[if (hasCock == True) HERP|DERP\\\]
* 17 [if (hasCock == True) HERP|DERP]
* 18 \\\[if (hasVagina == True) HERP|DERP\\\]
* 18 [if (hasVagina == True) HERP|DERP]

**Gender tests**

**PC**

**FancyQuotes!**

Convert '  
'herp a derp'

convert "  
"derp a herp"

	]]>, true);


	
	this.userInterface.clearMenu();
	this.userInterface.addButton(4, "Back", debugPane)

}

