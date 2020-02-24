import classes.Items.Armor.AkkadiArmoredDepthsuit;
import classes.Items.Accessories.SteeletechLaserSentry;
/* Steele Biomedical Deepsea Research Facility by Couch*/

/**
	 * ...
	 * @author DrunkZombie
	 */
/*

New Flags:
//UVETO_DEEPSEALAB_QUEST null = not started, 0 seen sign, 1 permission given, 2 started, 3 typhoon and janeria core defeated, 4 completed, 5 paid
//UVETO_DEEPSEALAB_SPAWN count of how many spawn are left
//UVETO_DEEPSEALAB_DEPTHSUIT 1 = grabbed suit
//UVETO_DEEPSEALAB_TYPHON 1 = defeated but kept bead, 2 killed
//UVETO_DEEPSEALAB_JANERIACORE 1 = defeated
//UVETO_DEEPSEALAB_BACONTIMER timer for getting paid
//UVETO_DEEPSEALAB_NOVA_UPGRADE 1 = nova was around to get the janeria upgrade

*/
//grab the mainframe key card
public function steeleBioDeepSeaGetMainframeCard():void
{
	clearOutput();
	showName("MAINFRAME\nCARD");
	author("Couch");
	
	output("You examine the object on the counter. It’s an access card for unlocking a magnetically sealed door. You should be able to use this to get into the mainframe chamber. There might be a clue there as to what’s going on.");
		
	//give mainframe card
	pc.createKeyItem("Steele Biomedical Lab Mainframe Card", 0, 0, 0, 0, "");
	
	processTime(2);	
	clearMenu();
	addButton(0, "Next", mainGameMenu)	
}
//grab the storage key card
public function steeleBioDeepSeaGetStorageCard():void
{
	clearOutput();
	showName("STORAGE\nCARD");
	author("Couch");
	
	output("You pick up the access card lying on the console. This one looks like it should get you into the facility’s storage closet. There ought to be something in there you can use to get to the generator room.");
	
	//give storage card
	pc.createKeyItem("Steele Biomedical Lab Storage Card", 0, 0, 0, 0, "");
	
	processTime(2);	
	clearMenu();
	addButton(0, "Next", mainGameMenu)	
}
//get the depthsuit
public function steeleBioDeepSeaGetDepthSuit():void
{
	clearOutput();
	showName("ARMORED\nDEPTHSUIT");
	author("Couch");
	
	
	itemCollect([new AkkadiArmoredDepthsuit()]);
	flags["UVETO_DEEPSEALAB_DEPTHSUIT"] = 1;
	
	processTime(5);	
	clearMenu();
	addButton(0, "Next", mainGameMenu)	
}
//get the laser drone upgrade (converts the basic drone from elect damag to burning with a 10% dmg boost)
public function steeleBioDeepSeaGetLaserDrone():void
{
	clearOutput();
	showName("LASER\nTURRETS");
	author("Couch");
	
	output("You look over the damaged laser turrets. All of them are irreparable on their own, but with a little luck you manage to salvage enough of the working parts from each of them to put together a working expansion pack for your attack drone.");
	output("\n\nIt takes some doing, but you grew up working with Steele Tech equipment, so the conversion is nice and simple. You don’t even need your workshop on the ship. By the time you’re done you’ve installed a modular port on your attack drone, letting you swap out the old arc caster for this shiny new laser cannon whenever you want. It should make dealing with this place a lot easier.");
	output("\n\n");
	
	//give laser drone	
	itemCollect([new SteeletechLaserSentry()]);
	flags["UVETO_DEEPSEALAB_LASERDRONE"] = 1;
	
	processTime(30 + rand(30));	
	clearMenu();
	addButton(0, "Next", mainGameMenu)	
}
//upgrade nova (gains 50 shields and +25% elect resistance)
public function steeleBioDeepSeaNovaUpgrade():void
{
	clearOutput();
	showName("ARMOR\nUPGRADE");
	author("Couch");
	
	output("The silence is broken after a few moments.");
	output("\n\n<i>“That was cool!”</i> Your goo companion giggles, apparently unfazed by everything that just happened. <i>“I wish I could do that.”</i>");
	output("\n\nYou don’t know if asking which part will make things better or worse. [goo.name] is too distracted to notice your silence, experimenting with shifting herself around a bit, which only makes you more wary. After about a minute or so passes, she gives a triumphant cheer as a shield bubble pops into existence around her.");
	output("\n\n<i>“There we go! Now I can keep the mean things away while we’re making them all horny and stuff so they’ll stop being mean and fuck us!”</i> [goo.name] gives you a cheeky grin. <i>“All I had to do was copy the plastic cell structure that creates storage conduits for electrical impulses. The constant electrical flow throughout the surface produces the layered toroidal magnetic fields that create the formation plane for a shield bubble. It has the side benefit of channeling incoming electrical impulses, turning the primary weakness of microbot-based armor into a strength.”</i>");
	output("\n\nYou blink. [goo.name] looks at you innocently.");
	output("\n\n<i>“...Let’s get out of here,”</i> you offer after a few moments.");
	output("\n\n<i>“Okay!”</i> Your goo hops back on, seeming quite pleased at her new shields.");
	
	if(pc.armor is GooArmor && flags["UVETO_DEEPSEALAB_NOVA_UPGRADE"] == undefined)
	{
		flags["UVETO_DEEPSEALAB_NOVA_UPGRADE"] = 1;
		pc.armor.hasRandomProperties = true;
		pc.armor.shields += 50;
		pc.armor.resistances.electric.resistanceValue += 25;
	}
	//what if pc has it somewhere in inventory...
	for(var x:int = 0; x < pc.inventory.length; x++)
	{
		if(pc.inventory[x].shortName == "Goo Armor" && flags["UVETO_DEEPSEALAB_NOVA_UPGRADE"] == undefined)
		{
			flags["UVETO_DEEPSEALAB_NOVA_UPGRADE"] = 1;
			pc.inventory[x].hasRandomProperties = true;
			pc.inventory[x].shields += 50;
			pc.inventory[x].resistances.electric.resistanceValue += 25;
		}
	}
	
	processTime(5);
	CombatManager.genericVictory();
}
//if the player takes off their airtight and pressurized suit while outside...
public function steeleBioDeepSeaRemoveSuitBadEnd():Boolean
{
	clearOutput();
	showName("GAME\nOVER");
	author("Couch");
	
	output("Now why did you do a damn fool thing like that? Removing your armor has the effect of quickly subjecting you to a truly gruesome simultaneous death by crushing and drowning. Not the most illustrious end to the adventures of Captain Steele.");
		
	badEnd("GAME OVER");
	return true;
}
//does steele need to be paid for completing the quest
public function steeleBioDeepSeaCheckToReceiveBacon(minutes:Number):void
{
	if (flags["UVETO_DEEPSEALAB_BACONTIMER"] != undefined)
	{
		if (GetGameTimestamp() > (flags["UVETO_DEEPSEALAB_BACONTIMER"] + (24 * 60))) steeleBioDeepSeaReceiveBacon(minutes);
	}	
}
//pay steele for the quest and set quest to step 5 which will unlock crackle jelly
public function steeleBioDeepSeaReceiveBacon(minutes:Number):void
{
	AddLogEvent(ParseText("You hear a beep from your Codex informing you that you’ve just received a 50,000 credit deposit to your account. Attached is a letter from Steele Tech’s board of directors thanking you for your assistance and saving the company from the loss of their facility. <b>It seems you’ve scored some points with Steele Tech for this.</b>\n\nA second notification soon follows as you receive a call from Dr. Lessau.\n\n<i>“I wanted to thank you personally for your help, [pc.name]. I’m sure the company has shown their gratitude, but I’ve also begun developing a new product based off the data you provided on that creature. It’s experimental, but come by my lab if you’d like to try using it.”</i>"), "good", minutes);

	pc.credits += 50000;
	//unlock crackle jelly
	flags["UVETO_DEEPSEALAB_QUEST"] = 5;
	flags["UVETO_DEEPSEALAB_BACONTIMER"] = undefined;	
}