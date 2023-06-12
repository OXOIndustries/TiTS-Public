import classes.Characters.PlayerCharacter;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.DamageResult;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.Engine.Combat.DamageTypes.DamageFlag;
import classes.RoomClass;
/* Steele Biomedical Deepsea Research Facility by Couch*/

/**
	 * ...
	 * @author DrunkZombie
	 */

//UVETO_DEEPSEALAB_QUEST null = not started, 0 seen sign, 1 permission given, 2 started, 3 typhoon and janeria core defeated, 4 completed, 5 paid
//UVETO_DEEPSEALAB_SPAWN count of how many spawn are left
//UVETO_DEEPSEALAB_DEPTHSUIT 1 = grabbed suit
//UVETO_DEEPSEALAB_TYPHON 1 = defeated, 2 killed
//UVETO_DEEPSEALAB_JANERIACORE 1 = defeated
//UVETO_DEEPSEALAB_BACONTIMER timestamp for bacon
//UVETO_DEEPSEALAB_NOVA_UPGRADE 1 = nova was around to get the janeria upgrade
//UVETO_DEEPSEALAB_STEPS how many steps since last encounter

//the tile before the elevator, this will start the quest
public function steeleBioElevatorEntranceBonus():Boolean
{
	author("Couch");
	var questStatus:int = flags["UVETO_DEEPSEALAB_QUEST"];
	
	if (questStatus >= 2)
	{
		output("Although the shaft is now open, the maintenance crews shoo you away. Large signs and cordon tape warn that the area is under repairs. It looks like you won't be able to go back down for a while.");
		flags["NAV_DISABLED"] = NAV_SOUTH_DISABLE;
	}
	else if (questStatus == 1)
	{
		output("The ID card you’ve been given will allow you access to the shaft, if you're ready for whatever’s lurking down there.");
	}
	else
	{
		output("A sign warns that anyone wishing to gain access to the research shaft should contact Dr. Lessau at the surface office.");
		flags["UVETO_DEEPSEALAB_QUEST"] = 0;
		flags["NAV_DISABLED"] = NAV_SOUTH_DISABLE;
	}
	
	return false;
}
//this only triggers when steele returns from completing the quest
public function steeleBioElevatorTopBonus():Boolean
{
	author("Couch");
	var questStatus:int = flags["UVETO_DEEPSEALAB_QUEST"];
	var killedTyphoon:Boolean = false;
	if (flags["UVETO_DEEPSEALAB_TYPHON"] == 2) killedTyphoon = true;
	
	if (questStatus == 3)
	{
		moveTo("UVI J36");
		output("The ride back up the elevator is mercifully calmer than the ride down. Nothing bars your ascent, though you don’t feel fully safe until you’re off the platform and back on solid ground.");
		output("\n\nA paramedic team is waiting, taking you in as you step off to ensure that you’re unharmed. Dr. Lessau and several members of his team are with them, looking relieved.");
		output("\n\n<i>“We just received notice that the power came back online. Are you alright, [pc.name]?”</i>");
		output("\n\nYou reassure Lessau that you’re fine, relaying the events underwater to him.");
		if (killedTyphoon)
		{
			output("\n\nYou briefly hesitate when it comes time to describe Typhon’s fate, opting to leave out the gory details, though there’s no skirting around the fact that you ended his suffering as his last words requested.");
			output("\n\n<i>“I see...if that’s what you thought was best, [pc.name]. Thank you.”</i>");
		}
		else
		{
			output("\n\nYou also hand over the data bead containing the broken Typhon AI, leaving out the gory details but describing the general mess that had been made of him. Lessau pockets the data bead with a sigh.");
			output("\n\n<i>“Thank you, [pc.name]. I’ll try to make sure he doesn’t suffer.”</i>");
		}
		output("\n\n<i>“The hazard team will be here shortly, they’ll make sure the conduit that started this mess is sealed. I’ve sent notice about ensuring we take care to use sturdier insulation in the future when working down at the seabed.”</i>");
		output("\n\nYou’re taken away by the paramedics shortly after, subjected to a thorough decontamination process to ensure that there’s no remains of the creature anywhere on you. Eventually you’re given a clean bill of health and let go, with the promise that both Akkadi and Steele Tech will be showing their appreciation in the near future.");
	
		output("\n\nDo you turn in the two key cards you collected or keep them?");
		processTime(180);	
		clearMenu();
		flags["UVETO_DEEPSEALAB_QUEST"] = 4;
		//set time to pay 24 hours
		flags["UVETO_DEEPSEALAB_BACONTIMER"] = GetGameTimestamp();
		addButton(0, "Turn In", steeleBioElevatorTopBonusTurnIn);
		addButton(1, "Keep", steeleBioElevatorTopBonusKeep);
		return true;	
	}
	return false;
}
//remove the key cards from inventory to reduce clutter
public function steeleBioElevatorTopBonusTurnIn():void
{
	clearOutput();
	showName("HAZARD\nTEAM");
	author("Couch");
	
	output("You hand the two key cards to the hazard team leader. He takes them and thanks you.");
	
	pc.removeKeyItem("Steele Biomedical Lab Mainframe Card");
	pc.removeKeyItem("Steele Biomedical Lab Storage Card");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//let the player have their momentos
public function steeleBioElevatorTopBonusKeep():void
{
	clearOutput();
	showName("HAZARD\nTEAM");
	author("Couch");
	
	output("You decide to keep the key cards.");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//controls all the differents states of the elevator based on quest status
public function steeleBioElevatorBottomBonus():Boolean
{
	author("Couch");
	currentLocation = "SBRF LIFT";
	var questStatus:int = flags["UVETO_DEEPSEALAB_QUEST"];
	//added for rare case where player leaves the facility and then loads a save from earlier
	rooms[currentLocation].outExit = "";
	rooms[currentLocation].outText = "";
	
	if (questStatus >= 3)
	{
		output("The elevator shaft looms above you, the surface a tiny pinprick of light in the distance.");
		output("\n\nThe elevator is operational again, you can return to the surface at any time.\n\n<b>You should finish any business you have here, there probably won’t be any coming back.</b>");
		rooms[currentLocation].outExit = "UVI RES LIFT";
		rooms[currentLocation].outText = "Up";
	}
	else if (questStatus == 2)
	{
		output("The elevator shaft looms above you, the surface a tiny pinprick of light in the distance.");
		if (flags["UVETO_DEEPSEALAB_JANERIACORE"] == 1 && flags["UVETO_DEEPSEALAB_TYPHON"] == undefined) output("\n\nPower has been restored to the elevator, but now the systems are locked down. There must be something else keeping you here.");
		else output("\n\nThe elevator console still has power, but reports the shaft is nonfunctional. You’ll need to restore power if you don’t want to be trapped down here.");		
	}
	else 
	{
		output("The elevator descends swiftly down the research shaft, the clear tube giving you a view of the water outside. It starts out a calming blue, but gradually shifts to pitch-black as you leave the surface behind, moving towards the lightless depths of the ocean floor. You have a few miles to go, leaving you some time alone with your thoughts. This is seeming more and more a fool’s errand by the moment, but it’s too late to back out now.");
		output("\n\nHalfway down the shaft, you hear an unsettling clunk. You make a dash for the handrail, grabbing it just as the bright lights of the platform give way to the red of emergency lighting and the smooth descent of the elevator gives way to freefall. You hold on for dear life, your [pc.feet] almost lifting off the floor as you pick up speed, plummeting down thousands of feet in minutes. Your life flashes before your eyes: is this really how it ends, trapped in a collapsing elevator miles below the surface of a frozen wasteland?");
		output("\n\nPressure hits your [pc.legs] as your descent suddenly slows, which is much better than suddenly stopping. Your speed gradually decreases to something a little less frightening, the emergency inertial compensators doing their job of preventing you from turning into paste as the elevator makes its landing at the bottom.");
		output("\n\nIt’s dark down here, the emergency lights the only thing you can see by. The console reports no power in the bottom half of the shaft, the entire facility is on emergency power only. You grab a welding torch from the elevator’s emergency supply cabinet, just in case.");
		output("\n\nNo turning back now; time to see if you can restore power and get out of here.");
	
		processTime(60);	
		clearMenu();
		flags["UVETO_DEEPSEALAB_QUEST"] = 2;
		addButton(0, "Next", mainGameMenu)
		return true;
	}
	
	return false;
}
//blocks the path outside without airtight and pressurized armor
public function steeleBioResearchAirlockBonus():Boolean
{
	author("Couch");
	var hasDepthSuit:Boolean = false;
	if (pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT) && pc.armor.hasFlag(GLOBAL.ITEM_FLAG_PRESSURIZED)) hasDepthSuit = true;
	
	if (hasDepthSuit) output("\n\nWith your depthsuit you should be able to get out onto the ocean floor. Hopefully there’s a way into the generator room from there.");
	else
	{
		output("\n\nGoing out there without appropriate equipment would be suicide, but if you can find one you might be able to find a route into the generator room.");
		flags["NAV_DISABLED"] = NAV_WEST_DISABLE;
	}
	
	return steeleBioJaneriaSpawnReport();
}
//can get mainframe key card
public function steeleBioRuinedLaboratoryBonus():Boolean
{	
	author("Couch");
	if (!pc.hasKeyItem("Steele Biomedical Lab Mainframe Card"))
	{
		output("\n\nThere’s something glinting on one of the counters.");
		addButton(0, "Examine",steeleBioDeepSeaGetMainframeCard,undefined,"Examine","Get Mainframe Access Card");
	}
		
	return steeleBioJaneriaSpawnReport();
}
//can get storage key card, drone techs can also get the laser upgrade for their drones
public function steeleBioMainframeChamberBonus():Boolean
{	
	author("Couch");
	if (flags["UVETO_DEEPSEALAB_TYPHON"] == undefined) return encounterTyphon();
	else
	{
		if (!pc.hasKeyItem("Steele Biomedical Lab Storage Card"))
		{
			output("\n\nThere’s another access card lying on top of the main console.");
			addButton(0, "Examine",steeleBioDeepSeaGetStorageCard,undefined,"Examine","Get Storage Access Card");
		}
		if (pc.hasPerk("Attack Drone") && flags["UVETO_DEEPSEALAB_LASERDRONE"] == undefined)
		{
			output("\n\nHm, the laser turrets don’t look all that badly damaged. Maybe you can scavenge something from them.");
			if (pc.inventory.length < pc.inventorySlots()) addButton(1, "Laser",steeleBioDeepSeaGetLaserDrone,undefined,"Laser","Get Laser Drone");
			else addDisabledButton(1, "Laser", "Laser", "Your inventory is full.");
		}
	}
	return false;
}
//locks the door while janeria is alive
public function steeleBioGeneratorAccessBonus():Boolean
{
	author("Couch");
	var janeriaCoreBeaten:Boolean = false;
	if (flags["UVETO_DEEPSEALAB_JANERIACORE"] == 1) janeriaCoreBeaten = true;
	
	if (janeriaCoreBeaten)
	{
		output("With power restored the water leakage in this corridor seems to have stopped for the moment, and you can get back into the generator room if you need to. It would be fastest to go west if you want to get out of here as soon as possible.");
	}
	else
	{
		output("Water is flowing along the floor of this hallway from the cracked south door leading to the main generator room. Try as you might, you can’t pry it open from this side. Thankfully the east and west doors are still operational.");
		flags["NAV_DISABLED"] = NAV_SOUTH_DISABLE;		
	}
		
	return steeleBioJaneriaSpawnReport();	
}
//locks the door to the closet if storage card not owned
public function steeleBioRuinedBreakRoomBonus():Boolean
{
	author("Couch");
	if (pc.hasKeyItem("Steele Biomedical Lab Storage Card"))
	{
		output(" To the east is a door leading into a storage closet, which the card you picked up in the mainframe chamber can hopefully unlock.");
	}
	else
	{
		output(" To the east is a door leading into a storage closet, which you don’t have the key for right now. Maybe someone left it behind somewhere?");
		flags["NAV_DISABLED"] = NAV_EAST_DISABLE;		
	}
		
	return steeleBioJaneriaSpawnReport();	
}
//locks the door to the mainframe if card not owned
public function steeleBioRuinedOfficesBonus():Boolean
{	
	author("Couch");
	if (pc.hasKeyItem("Steele Biomedical Lab Mainframe Card"))
	{
		output(" To the west is the door into the central mainframe, which the key you found in the lab is able to unlock.");
	}
	else
	{
		output(" To the west is the door into the central mainframe, which you don’t have a key for.");
		flags["NAV_DISABLED"] = NAV_WEST_DISABLE;		
	}
		
	return steeleBioJaneriaSpawnReport();
}
//makes the depthsuit available if not grabbed yet
public function steeleBioStorageClosetBonus():Boolean
{	
	author("Couch");
	if (flags["UVETO_DEEPSEALAB_DEPTHSUIT"] != 1)
	{
		output(" On the far wall you see a real sight for sore eyes: an armored depthsuit, one of Akkadi’s newest models at that. Pity about the orange color, but right now it’ll do just fine.");
		if (pc.inventory.length < pc.inventorySlots()) addButton(0, "Depthsuit", steeleBioDeepSeaGetDepthSuit, undefined, "Depthsuit", "Take Armored Depthsuit");
		else addDisabledButton(0, "Depthsuit", "Depthsuit", "Your inventory is full.");
	}
		
	return false;
}
//starts the encounter with janeria
public function steeleBioGeneratorRoomBonus():Boolean
{	
	author("Couch");
	if (flags["UVETO_DEEPSEALAB_JANERIACORE"] == undefined) return encounterJaneriaCore();

	return false;
}
//goes to bad end if steele takes off suit while outside like an idiot
public function steeleBioOutsideBonus():Boolean
{	
	author("Couch");
	if (!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT) || !pc.armor.hasFlag(GLOBAL.ITEM_FLAG_PRESSURIZED)) return steeleBioDeepSeaRemoveSuitBadEnd();

	return false;
}
//checks for spawn encounter and adds flavor text if no encounter
public function steeleBioJaneriaSpawnReport():Boolean
{
	author("Couch");
	if (flags["UVETO_DEEPSEALAB_SPAWN"] == undefined) flags["UVETO_DEEPSEALAB_SPAWN"] = 4;
	var spawnLeft:int = flags["UVETO_DEEPSEALAB_SPAWN"];
	IncrementFlag("UVETO_DEEPSEALAB_STEPS");
	
	//min 3 steps per encounter and the more spawn there are the greater chance of meeting one after that (50%, 40%, 30%, 20%)
	if (flags["UVETO_DEEPSEALAB_STEPS"] >= 3 && spawnLeft > 0 && rand(10) < spawnLeft + 1)
	{
		flags["UVETO_DEEPSEALAB_STEPS"] = 0;
		return encounterJaneriaSpawn();
	}
	else
	{
		if (spawnLeft >= 4) output("\n\nYou can hear scuttling noises echoing throughout the halls, making it hard not to shiver. What <i>is</i> that?");
		else if (spawnLeft == 3) output("\n\nYou can hear the jellyfish infesting the facility all around you, though with all the echoing it’s hard to tell exactly where they might be.");
		else if (spawnLeft == 2) output("\n\nThe sounds of the remaining jellyfish are fainter now than before, but you know you haven’t gotten them all. One could pop out at any moment.");
		else if (spawnLeft == 1) output("\n\nYou’re pretty sure you’ve killed most of the jellyfish, but there’s still the occasional noise of one’s presence somewhere nearby. It’s almost worse when there’s just one left.");
		else output("\n\nThe hallways are mercifully quiet. You think you’ve managed to kill all of the jellyfish roaming the facility.");
	}
	return false;
}
//outside text generation
public function steeleBioOutsideTile3RoomBonus():Boolean
{	
	author("Couch");
	if (flags["UVETO_DEEPSEALAB_JANERIACORE"] == undefined) output("Rounding the bend in the path you can see the invader, a giant glowing jellyfish wrapped around the generator room. Electricity crackles along its body in time with the rise and fall of its glow, coming in pulses from the generator up and into its main body. What the hell <i>is</i> this monster?");
	else output("Rounding the bend in the path you can see the generator room where you fought the giant jellyfish.");
	
	return steeleBioOutsideBonus();
}
//outside text generation
public function steeleBioOutsideTile4RoomBonus():Boolean
{	
	author("Couch");
	if (flags["UVETO_DEEPSEALAB_JANERIACORE"] == undefined) output(" The giant jellyfish hasn’t noticed you yet, but you’re pretty sure it will as soon as you enter. This is your last chance to back out, <b>you’d better be ready to fight.</b>");
	
	return steeleBioOutsideBonus();
}