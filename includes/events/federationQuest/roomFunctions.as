
public function fedQuestBreakBonus():Boolean
{
	author("Savin");
	if(flags["FEDERATION_QUEST_GOLD"] == undefined) addButton(0, "DrinkMachine", fedQuestDrinkMachine, undefined, "DrinkMachine", "Someone turned this machine on recently. Maybe you could take advantage of it.");
	
	return false;
}

public function fedQuestBarracksBonus():Boolean
{
	author("Savin");
	if(flags["FEDERATION_QUEST_GOLD"] == undefined)
	{
		fedQuestSquadFight();
		return true;
	}
	
	showBust("GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER");
	var button:int = 0;
	//output("A makeshift barracks has been set up here: several dozen bunks, footlockers, and racks of uniforms occupy nearly every inch of space on the walls. The middle of the room has a broad, circular card table set up along with about a dozen chairs.");
	if(flags["FEDERATION_QUEST_GOLD"] == 1) output("\n\nSeveral gold myr are slumped over the table or collapsed on the floor, breathing shallowly but steadily. They’re completely out of it, and probably will be for hours. No need to worry about them.");
	else if(flags["FEDERATION_QUEST_GOLD"] >= 2)
	{
		output("\n\nA pile of gold myr soldiers are writhing on the floor, moaning and groping at each other. Some are fisting their sister’s rear-mounted slits; others are suckling on honey-laden tits or kissing each other passionately. The whole squad’s devolved into one big, entwined orgy. They’re completely out of it, entranced by lust. You can walk right by them... or you might be able to join in. You doubt they could, or would, stop you.");
		addButton(button++, "Join In", function():void{clearOutput(); clearMenu(); author("Savin"); if(pc.hasCock())fedQuestOrgyCock(); else fedQuestOrgyCooter();}, undefined, "Join In", "Help yourself to a place in the gold myr orgy sprawling out around you.");
	}
	if(flags["FEDERATION_QUEST_LEVER"] == undefined) addButton(button++, "Search", fedQuestBarracksSearch, undefined, "Search", "Check the barracks for anything useful. ");
	
	return false;
}

public function fedQuestB1StairBonus():Boolean
{
	author("Savin");
	//Trigger Tank Queen fight
	if(flags["FEDERATION_QUEST"] == 2)
	{
		fedQuestQueen();
		return true;
	}
	else
	{
		if(flags["FEDERATION_QUEST_LUSTOXIN"] == undefined) addButton(0, "Investigate", fedQuestInvestigateToxin, undefined, "Investigate", "Take a peek inside and see if there’s anything worthwhile.");
		addButton(5, "Up", function():void{moveTo("T17");processTime(8);clearMenu();mainGameMenu();}, undefined, "", "");
		return false;
	}
}

public function fedQuestTankBonus():Boolean
{
	author("Savin");
	if(flags["FEDERATION_QUEST_TANK"] == undefined)
	{
		if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output("While it’s not quite your normal area of expertise, this tank looks more or less operational. ");
		else if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output("Could use some more guns, but a quick glance says this thing’s ready to roll. ");
		else if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("You don’t know much about this sort of thing, but you don’t see much reason somebody couldn’t climb in and drive the beast right now. ");
		addButton(0, "Tank", fedQuestCheckTank, undefined, "Tank", "Check out the tank.");
	}
	else if(flags["FEDERATION_QUEST_TANK"] == 1)
	{
		output("The tank’s been rendered useless thanks to your machinations. It’s unlikely anybody will notice what you’ve done until it’s too late...");
		addDisabledButton(0, "Tank");
	}
	else output("The tank’s in pristine condition... or at least, as much as it’s ever been. You’ve got no idea how to mess with it further, and you aren’t packing the ordinance required to just blow it up.");
	output("\n\nIt wouldn’t last a second on a modern battlefield, but considering the weapons the myr are armed with, this thing would be an unstoppable behemoth in the tunnels. Unlike most of the gear lying around, the tank isn’t covered in dust: somebody’s been working on this beast, and recently.");
	output("\n\nYou can make out a heavy cargo elevator to the north, and hallways leading out to the west, the northeast, and of course, back south. ");
	
	return false;
}

public function fedQuestStaffBonus():Boolean
{
	author("Savin");
	if(flags["FEDERATION_QUEST_GOLD"] == undefined) 
	{
		output("You can hear a great deal of talking and laughing from inside. Sounds like there’s a bunch of people in there...");
		if(pc.hasItemByClass(Lustoxin)) addButton(0, "Vents", fedQuestVents, undefined, "Vents", "Maybe you could deal with the gold myr in there with a little of their own medicine...");
	}
	
	return false;
}

public function fedQuestRadioBonus():Boolean
{
	author("Savin");
	if(flags["FEDERATION_QUEST_RADIO"] == undefined)
	{
		fedQuestOfficerFight();
		return true;
	}

	var btn:int = 0;
	if(flags["FEDERATION_QUEST_CYPHER"] == undefined)
	{
		output("One of the folders has TOP SECRET and CONFIDENTIAL written all over it. Must be important...");
		addButton(btn++, "Investigate", fedQuestRadioFolder, undefined, "Investigate", "Take a look at that folder...");
	}
	if(flags["FEDERATION_QUEST"] == 1)
	{
		addButton(btn++, "Radio Set", fedQuestRadioSet, undefined, "RadioSet", "The radio the officer was talking through seems to have survived the fight. Considering you just took out the officer, if you get on the horn, <b>there’s a good chance you’re going to end up bringing the enemy down on you -- including the queen.</b>");
		output("\n\nConsidering you just took out the officer, if you get on the horn, <b>there’s a good chance you’re going to end up bringing the enemy down on you -- including the queen.</b>");
	}
	return false;
}

public function fedQuestMotherBonus():Boolean
{
	author("Savin");
	if(flags["FEDERATION_QUEST_MOTHER"] == undefined) addButton(0, "Search", fedQuestMotherSearch, undefined, "Search", "Toss the War Queen’s bedroom. She’s gotta have some treasures hidden around here...");
	else if(flags["FEDERATION_QUEST_MOTHER"] == 1)
	{
		if(flags["FEDERATION_QUEST_KEYS"] == 1) addButton(0, "Safe", fedQuestMotherSafe, undefined, "Safe", "Open the safe on up.");
		else addDisabledButton(0, "Safe", "Safe", "You need to find they keys to open the safe!");
	}
	return false;
}

public function fedQuestChemicalBonus():Boolean
{
	author("Savin");
	
	if(flags["FEDERATION_QUEST_LUSTOXIN"] < 5 || flags["FEDERATION_QUEST_LUSTOXIN"] == undefined) addButton(0, "Chemicals", fedQuestLootChemicals, undefined, "Chemicals", "Take a peek at what the remnant have been storing down here...");
	
	return false;
}
