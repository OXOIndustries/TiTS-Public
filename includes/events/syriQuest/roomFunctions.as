import classes.UIComponents.ContentModules.RotateMinigameModule;
import classes.UIComponents.ContentModuleComponents.RGMK;

public function syriQuestAkkadiBaseSecurityOffice():void
{
	clearOutput();
	author("Savin");
	output("You’re standing in the security office, a large circular room with bay windows overlooking the entrance hall on one side, and ");
	if (flags["SYRIQUEST_POWER_STATE"] == undefined) output("some dark chamber on the other");
	else output("a sprawling bull pen on the other with dozens of cubicles circling around a terminal of monitors and readouts everyone could see from their workspace");
	output(". You can see no entrance into this second area.");
	output("\n\nThe security office itself is a mess: several chairs have been knocked over, and you can see a couple puddles of drinks spilled across the metal floor. Looks like the guards left in a hurry. The computer terminals and monitors are all ");
	if (flags["SYRIQUEST_POWER_STATE"] == undefined) output("locked on a red screen with the ausar word for ‘EMERGENCY’ flashing across them. No amount of fiddling is going to make them useful with the power out.");
	else output("turning back on, showing flickering glimpses of security footage and other, more technical readouts.");
	
//	clearMenu();
	if (flags["SYRIQUEST_STATE"] == 5) addDisabledButton(0,"Cameras");
	else if (flags["SYRIQUEST_POWER_STATE"] == undefined) addDisabledButton(0, "Cameras", "Cameras", "Not avaible during a power outage.");
	else addButton(0, "Cameras", syriQuestAkkadiBaseCameras, undefined, "Cameras", "See what’s going on in the facility.");
}

public function syriQuestAkkadiBaseCameras():void
{
	clearOutput();
	author("Savin");
	output("You step over to the office’s central monitor hub and wave a hand across it, bringing it online. Most of the internal cameras appear to be down entirely, but there’s enough external ones left that you can get a decent picture of what’s going on outside. The canyon you were just overlooking is now suffering from gale force winds, picking up tons of snow and whipping it around into a blinding veil over the exterior of the facility. You can just barely make out the shapes of Syri and the rest of the Haskarn’s crew taking cover behind on the half-built walls on the far side of the canyon, trying not to get blown away with the blizzard.");
	output("\n\nThe very few internal cameras you have access to show other parts of the facility than you’ve been in already, all locked down tight just like the main floor. You see laboratories and fabrication centers mostly, sealed by the lockdown. Ausar scientists trapped inside are banging on the doors or trying to access their comm devices, to no avail. Good, they can’t get in your way while they’re locked in their labs.");
	output("\n\nYou bring up a floor plan on another of the monitors, trying to match the cameras that remain with the map. It only takes you a few seconds to realize that something’s off... one of the floors doesn’t <b>have</b> any security cameras at all. It’s not that the cameras are all down -- plenty of floors are totally dark -- but this one floor just doesn’t seem to have any feeds to begin with.");
	output("\n\nIf you had to guess which floor has a miniature government blacksite on it, you’d guess that one.");

//	clearMenu();
	if (flags["SYRIQUEST_ELEVATOR_STATE"] != undefined) addButton(0,"ElevatorAccess",syriQuestAkkadiBaseElevatorAccess,undefined,"Elevator Access","Try and get access to the mysterious floor.");
	else addDisabledButton(0,"Cameras");
}

public function syriQuestAkkadiBaseElevatorAccess():void
{
	clearOutput();
	author("Savin");
	output("Glancing from the map monitor to one of the nearby terminals, you quickly sit down and start working, trying to bring up a protocol to unlock the elevator.");
	output("\n\nIt’s a clever setup they have here. During a lockdown, only one secure floor can be opened at a time: all other are remotely sealed from here in the security office. ");
	output("\n\nYou tap the button for the mysterious floor, way down in heart of the glacier. A little symbol pops up, confirming that floor is unlocked. Alright, time to go!");
	flags["SYRIQUEST_STATE"] = 5;
	processTime(5);

//	clearMenu();
	addDisabledButton(0,"Cameras");
}

public function syriQuestAkkadiBaseElevators():void
{
	author("Savin")
	clearMenu();
	if (flags["SYRIQUEST_POWER_STATE"] == undefined) {
		addDisabledButton(0, "Main Floor", "Main Floor", "Not avaible during a power outage.");
		addDisabledButton(1, "Staff Quarters", "Staff Quarters", "Not avaible during a power outage.");
		addDisabledButton(2, "R&D Level", "R&D Level", "Not avaible during a power outage.");
	}
	else {
		if (currentLocation == "AKD K25") addDisabledButton(0,"Main Floor","Main Floor","You are already here.");
		else addButton(0, "Main Floor", syriQuestElevatorAKDK25, undefined);
		if(currentLocation == "AKD C15") addDisabledButton(1,"Staff Quarters","Staff Quarters","You are already here.");
		else addButton(1, "Staff Quarters", syriQuestElevatorAKDC15, undefined);
		if (flags["SYRIQUEST_STATE"] >= 5) {
			if(currentLocation == "AKD K15") addDisabledButton(2,"R&D Level","R&D Level","You are already here.");
			else addButton(2, "R&D Level", syriQuestElevatorAKDK15, undefined);
		}
		else addDisabledButton(2,"Locked");
	}
}

public function syriQuestElevatorAKDK25():void {
	moveTo("AKD K25");
	flags["SYRIQUEST_ELEVATOR_STATE"] = 0;
	mainGameMenu();
}

public function syriQuestElevatorAKDC15():void {
	moveTo("AKD C15");
	flags["SYRIQUEST_ELEVATOR_STATE"] = 1;
	mainGameMenu();
}

public function syriQuestElevatorAKDK15():void {
	moveTo("AKD K15");
	flags["SYRIQUEST_ELEVATOR_STATE"] = 2;
	mainGameMenu();
}

/*
 *Generator Layout:
 * 
 * 8 | 9  | 16
 * 4 | 10 | 21
 * 6 | 11 | 15
*/

public var syriQuestBackupGeneratorsButtons:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

public function syriQuestBackupGenerators(doOutput:Boolean = true):void
{
	author("Savin");
	if (doOutput)
	{
		clearOutput();
		output("Staring down into the dark abyss, you steel yourself and swing down onto the ladder. It’s not a long trip down, but it’s slow going when you can barely see, forced to feel around for every rung. But you do make it down, and turning up your Codex’s brightness as high as it’ll go, you’re able to make out the shapes of several small fusion boxes. They seem to be powered off, just as Syri promised. They clearly can’t handle powering both facilities at once.");
		output("\n\nYou go over to the nearest one and flip its control console open. A dim holographic readout springs to light, printing out the hash-like characters of the ausar language. You’re presented with several different settings and power regulation options; glancing through them, it looks like you’ll need to adjust the power output to just be high enough to get emergency systems back online. Too much, and the whole facility will come back on -- including security systems. Too little, and it just won’t work.");
		output("\n\nYou need 40% power to stay in the sweet spot, and all three generators need to be online to work.");
	}

	clearMenu();
	syriQuestBackupGeneratorsButtons = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

	userInterface.setButtonPurple(0);
	addDisabledButton(0, "Generator A:");

	addButton(1, "Control Unit A", syriQuestToggleSettings, 1);
	userInterface.setButtonBlue(1);

	addButton(2, "Flux Field A", syriQuestToggleSettings, 2);
	userInterface.setButtonBlue(2);

	addButton(3, "Plasma Coil A", syriQuestToggleSettings, 3);
	userInterface.setButtonBlue(3);

	userInterface.setButtonPurple(5);
	addDisabledButton(5, "Generator B:");

	addButton(6, "Control Unit B", syriQuestToggleSettings, 6);
	userInterface.setButtonBlue(6);

	addButton(7, "Flux Field B", syriQuestToggleSettings, 7);
	userInterface.setButtonBlue(7);

	addButton(8, "Plasma Coil B", syriQuestToggleSettings, 8);
	userInterface.setButtonBlue(8);

	userInterface.setButtonPurple(10);
	addDisabledButton(10, "Generator C:");

	addButton(11, "Control Unit C", syriQuestToggleSettings, 11);
	userInterface.setButtonBlue(11);

	addButton(12, "Flux Field C", syriQuestToggleSettings, 12);
	userInterface.setButtonBlue(12);

	addButton(13, "Plasma Coil C", syriQuestToggleSettings, 13);
	userInterface.setButtonBlue(13);

	addDisabledButton(14, "Rest");
}

public function syriQuestToggleSettings(slot:int):void
{
	if (syriQuestBackupGeneratorsButtons[slot] == 0)
	{
		syriQuestBackupGeneratorsButtons[slot] = 1;
		userInterface.setButtonPurple(slot);
	}
	else
	{
		syriQuestBackupGeneratorsButtons[slot] = 0;
		userInterface.setButtonBlue(slot);
	}

	var syriQuestBackupGeneratorsPower:int = syriQuestBackupGeneratorsCalculateThePower();
	var sweetSpot:int = 40;
	var overCharged:int = 41;
	
	clearOutput();
	author("Savin");
	output("The power reading is flashing ‘" + syriQuestBackupGeneratorsPower + "%’.");
	output("\n\nYou need 40% power to stay in the sweet spot, and all three generators need to be online to work.");

	if (syriQuestBackupGeneratorsPower != 0 ) addButton(14, "Rest", syriQuestBackupGeneratorsFailure);
	else addDisabledButton(14, "Rest");

	if (syriQuestBackupGeneratorsPower == sweetSpot) {
		if (syriQuestBackupGeneratorsActiveA() && syriQuestBackupGeneratorsActiveB() && syriQuestBackupGeneratorsActiveC()) syriQuestBackupGeneratorsSuccess();
	}
	if (syriQuestBackupGeneratorsPower >= overCharged) {
		if (syriQuestBackupGeneratorsActiveA() && syriQuestBackupGeneratorsActiveB() && syriQuestBackupGeneratorsActiveC()) syriQuestBackupGeneratorsSuccessOverload();
		else syriQuestBackupGeneratorsFailure();
	}
}

public function syriQuestBackupGeneratorsCalculateThePower():int
{
	//0s represent slots that doent have buttos attached to them
	var syriQuestBackupGeneratorsPowerOutput:Array = [0, 8, 9, 16, 0, 0, 4, 10, 21, 0, 0, 6, 11, 15]

	var syriQuestBackupGeneratorsPower:int = 0;
	
	for (var i:int = 0; i < syriQuestBackupGeneratorsPowerOutput.length; i++)
	{
		if (syriQuestBackupGeneratorsButtons[i] == 1) syriQuestBackupGeneratorsPower += syriQuestBackupGeneratorsPowerOutput[i];
	}
	
	return syriQuestBackupGeneratorsPower;
}

public function syriQuestBackupGeneratorsActiveA():Boolean
{
	if (syriQuestBackupGeneratorsButtons[0] == 1 || syriQuestBackupGeneratorsButtons[1] == 1 || syriQuestBackupGeneratorsButtons[2] == 1) return true;
	return false;
}

public function syriQuestBackupGeneratorsActiveB():Boolean
{
	if (syriQuestBackupGeneratorsButtons[6] == 1 || syriQuestBackupGeneratorsButtons[7] == 1 || syriQuestBackupGeneratorsButtons[8] == 1) return true;
	return false;
}

public function syriQuestBackupGeneratorsActiveC():Boolean
{
	if (syriQuestBackupGeneratorsButtons[11] == 1 || syriQuestBackupGeneratorsButtons[12] == 1 || syriQuestBackupGeneratorsButtons[13] == 1) return true;
	return false;
}

public function syriQuestBackupGeneratorsFailure():void
{
	clearOutput();
	author("Savin");
	output("No, no... that’s not right at all. You shut it all down, let the generators cool off, and try again...");
	syriQuestBackupGenerators(false);
}

public function syriQuestBackupGeneratorsSuccess():void
{
	author("Savin");
	output("\n\nThat’s it! You lean back, watching the red emergency lights slowly, dimly flicker on. There’s juuuust enough juice coming out of the three generators to turn on the most minimal systems. You breathe a sigh of relief as you’re finally able to see again, and you turn back to the ladder. ");
	output("\n\nWhen you get back to the main level, you’re greeted with exactly what you expected: dim red lights illuminating the halls, and emergency seals starting to come undone... on critical entrances and exits, anyway. That’s all you need to get access to the elevators, though!");

	flags["SYRIQUEST_POWER_STATE"] = 1;
	generateMap();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function syriQuestBackupGeneratorsSuccessOverload():void
{
	author("Savin");
	output("\n\nThat’s it! You lean back as the power spools up... and up... and up. Uh oh. The red warning lights flare all around you, and you hear machinery start whirring in the walls. You turn back to the consoles, trying to pull the power back down, but no luck. You’re locked out!");
	output("\n\nGuess you’re going to be dealing with security now!");

	flags["SYRIQUEST_POWER_STATE"] = 2;
/*	Doesnt really add much to the game
	rooms["AKD K31"].addFlag(GLOBAL.HAZARD);
	rooms["AKD K29"].addFlag(GLOBAL.HAZARD);
	rooms["AKD K27"].addFlag(GLOBAL.HAZARD);
	rooms["AKD I27"].addFlag(GLOBAL.HAZARD);
	rooms["AKD I25"].addFlag(GLOBAL.HAZARD);
	rooms["AKD I23"].addFlag(GLOBAL.HAZARD);
	rooms["AKD I21"].addFlag(GLOBAL.HAZARD);
	rooms["AKD K21"].addFlag(GLOBAL.HAZARD);
	rooms["AKD M21"].addFlag(GLOBAL.HAZARD);
	rooms["AKD C13"].addFlag(GLOBAL.HAZARD);
	rooms["AKD E13"].addFlag(GLOBAL.HAZARD);
	rooms["AKD K13"].addFlag(GLOBAL.HAZARD);
	rooms["AKD M13"].addFlag(GLOBAL.HAZARD);
	rooms["AKD O13"].addFlag(GLOBAL.HAZARD);
	rooms["AKD Q15"].addFlag(GLOBAL.HAZARD);	*/
	generateMap();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function syriQuestAkkadiBaseStaffRoom():void
{
		author("Savin");
		if (flags["MET_SCHORA"] == 2) {
			setNavDisabled(NAV_NORTH_DISABLE);
		}
}

public function syriQuestAkkadiBaseShowers():Boolean
{
	clearOutput();
	author("Savin");
	if (flags["MET_SCHORA"] >= 3 || flags["SYRIQUEST_STATE"] >= 8) {
		output("The Akkadi facility’s showers are a small affair, with a half dozen tile cubicles each sealed off by nothing more than a sheer, largely transparent curtain. It’s much better lit than the rest of the facility has been, thanks to all the aromatic candles that have been arranged around the perimeter. A light smell of roses and wine permeates the air");
		if (flags["MET_SCHORA"] >= 4) output(", mixed with the linger scent of sex and cum");
		output(".");
		return false;
	}
	else {
		showSchora(true);
		flags["MET_SCHORA"] = 1;
		output("Everywhere else in this place has been abandoned, and so you don’t think twice about sliding open the glass panel door at the far end of the locker room. The moment you do, though, you’re assaulted with unexpected sensation: a rich smell of roses and wine leaks out of the crack in the door, followed by billowing steam that clings to your [pc.skinFurScales].");
		output("\n\nWater is running inside, pounding down from multiple shower heads and hissing across the tile floor. You glimpse a half dozen stalls inside, separated by slender walls, but only one of them’s got its curtain closed. The cheap plastic curtain’s thin and almost transparent, letting you see the dark outline of a large woman inside: statuesque and tall, not thick like a huskar but shapely in all the right places, with large breasts from which water cascades down onto the shower floor. ");
		output("\n\nShe’s moaning softly, and you can see one of her hands moving sensually up and down her body, stopping to grope one of her meaty bosoms before delving down between her legs or reaching around to grope the plump mounds of assflesh swaying behind her.");
		output("\n\nShe hasn’t noticed you yet, if you want to sneak away...");
		clearMenu();
		addButton(0, "Watch", syriQuestAkkadiBaseShowersWatch, undefined, "Watch", "Looks like somebody’s enjoying the showerhead in there...");
		addButton(1, "Approach", syriQuestAkkadiBaseShowersApproach, undefined, "Approach", "Try and speak to the lusty lady.");
		//Puts you back outside. Can repeat above scene as long as Valden hasn’t been encountered.");
		addButton(2, "Leave", move, rooms[currentLocation].southExit);
		return true;
	}
}

public function syriQuestAkkadiBaseArchivesStealData():void
{
	clearOutput();
	author("Savin");
	output("You step up to one of the access computers and quickly run a cable from your Codex to a universal port on its side. You make quick work of disabling the firewalls; from the inside, the server defenses aren’t much of an obstacle. It only takes a few moments to bypass them and then start digging around for something tasty to sell. There’s so much data here, way more than you can parse or download on the fly here, so you just go for the project with the highest budget earmarked for it.");
	output("\n\nA bit of searching turns up a new ultra-heavy dreadnought being designed for the Joint Ausar Federation navy. It’s not being built here, but there are some parts being tested in the hangar down below, so they have the full specs for the ship. Somebody’ll pay a pretty penny for this, and it <i>probably</i> won’t actually hurt the navy.");
	output("\n\nYou jack the documents, throw ‘em up on an dark.net forum you’ve visited a few times, and within a minute you’ve got a bid that’s hard to turn down. 12,500 credits are wired to your account, and the files vanish. Nice and easy.");
	pc.credits += 12500;
	flags["SYRIQUEST_DATA_STOLEN"] = 1;
	processTime(10);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function syriQuestAkkadiBaseBioMedLabArtifacts():void
{
	clearOutput();
	author("Savin");

	output("You swagger on over to the sample case at the end of the lab, looking it over as you do. It’s standard corporate fare, and you’ve seen it’s like before: all shiny black polymer, held nice and safe by a small computer lock. One that is easily defeated by a bit of ");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output("hacking");
	else if (pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("security bypassing");
	else output("elbow grease");
	output(". You spend a couple minutes cracking it open, revealing the contents within.");
	output("\n\nIt looks like a flashlight.");
	output("\n\nYou blink, curious as to who locked up a nondescript black metal cylinder and why. Luckily for your insatiable thirst for knowledge, there’s a tag pinned to the protective foam holding the flashlight in place. Squinting at it, you see a familiar name printed on it:");
	output("\n\nSyri Dorna.");
	output("\n\nWhat? You blink, sure for a moment you’ve misread... but the text remains unchanged. Underneath the name is a string of text and numbers you can’t parse, followed by something about ‘sample collected from incident 376-A2.’ The transporter accident, maybe? ");
	output("\n\nNow you’re curious. What kind of biological detritus did Akkadi collect from wherever Syri ended up after her accident? You pick up the cylinder and twist off the cap, staring into the depths of...");
	output("\n\n... <b>There’s a vagina in there.</b>");
	output("\n\nWell, there’s a lot of things you might have expected to find in a cylinder in a box with your friend’s name on it, but that... wasn’t exactly high on the list. But there it is, a pretty pink puss surrounded by a short circle of olive skin that melds into the ring of the cylinder. The pussy seems alive, too, slicked with moisture and radiating warmth against the sterile cold that permeates the place.");
	output("\n\nIt’s like some kind of living onahole");
	if (CodexManager.entryViewed("BionaHoles")) output(" -- or more accurately, a BionaHole");
	output("!");
	output("\n\n<i>“What the hell?”</i> you mutter, staring at... what can only be Syri’s own pussy. Has this really been sitting here all these years, suspended and kept alive? And if so, why... and what happened to Valden, if he didn’t get Syri’s twat?");
	output("\n\nYou throw the living onahole into your pack. <b>Syri’s going to want to see this!</b>");
	flags["SYRIQUEST_SYRI_ONAHOLE"] = 1;
	processTime(10);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Torra, Assistent Researcher
public function syriQuestAkkadiBaseCheckPoint():Boolean
{
	clearOutput();
	author("Savin");
	if (flags["MET_TORRA"] == undefined) {
		showTorra();
		output("As you make your way to the end of the hallway, you see a security checkpoint coming up. It’s nothing you haven’t seen a million times before at Steele Tech offices, just a little scanner row at the end of the hall to make sure nobody’s smuggling weapons in, or company property out. Since there’s nobody manning it, it’s child’s play to just hop the guard station rather than going through the scanner. The system so far hasn’t picked you up just walking down the halls, but there’s no sense in risking it.");
		output("\n\nWhen you land on the other side, you feel strong arms grabbing your shoulders.");
		output("\n\nYou spin around, instinctively bringing your [pc.weapon] up as you face the figure that’s grabbed you. It’s not a security robot, at least: your gaze settles on a pair of slender arms wrapped in blue latex, leading up to an enormously voluptuous, naked body covered in a thick layer of soft white fur, spotted with circles of black. She’s a humanoid cat-morph with long fangs sticking out of a short muzzled tipped with a heart-shaped pink nose. A shock of fiery orange hair flows from between her fuzzy feline ears down her back and spills over her shoulders, drawing your eyes to the huge, weighty tits sitting high, proud, and bare on her chest. The puffy black teats at their tips are both pierced with gold rings so small they don’t quite reach the bottoms of her wide areolas.");
		output("\n\n<i>“Please,”</i> the busty cat-woman breathes, pawing at your shoulders. <i>“Oh, spirits of ice and sea, please!”</i>");
		output("\n\nShe’s babbling, but it’s clear to see what she wants. One of her hands glides down between her legs, rubbing at the black lips of her twat. She’s bare down there, too: the only clothing she’s wearing is the latex arms and legs of her corporate jumpsuit. With everything laid bare, you can see she’s dripping wet, and her teats are hard as rocks. And you can see something long and black hanging out from behind her lush thighs -- something’s rammed up her ass, and it’s vibrating softly as she paws at you.");
		output("\n\nThis cat needs a good hard fuck, and it doesn’t look like she’s going to say no!");
		processTime(10);
		clearMenu();
		flags["MET_TORRA"] = 1;
		addButton(0, "Fight", syriQuestTorraFight, undefined, "Fight", "You’ve got a bad feeling about submitting to this needy kitty.");
		if (pc.hasCock() && pc.cockThatFits(chars["TORRA"].vaginalCapacity()) >= 0) addButton(1,"Fuck",penisRouter,[syriQuestTorraFuck,chars["TORRA"].vaginalCapacity(),false,0],"Fuck","Why bother fighting? You both wan’t the same thing anyway!");
		else addButton(1,"Fuck",syriQuestTorraFuck,-1,"Fuck","Why bother fighting? You both want the same thing anyway!");
		return true;
	}
	else {
		output("You’re standing in a standard-issue corporate security checkpoint, the kind you’ve passed through a million times in the past. There’s a three-row scanner column to detect weapons and contraband connected to a guard post where someone can monitor the comings and goings. Right now, though, it’s occupied by a masturbating milodan scientist; the woman’s still face-down, ass-up on the ground and driving her fingers into her twat.");
		output("\n\nTo the south is a large circular plaza dominated by a very fake looking palm tree. There’s several doors leading off of the plaza into the major labs.");
		return false;
	}
}

public function syriQuestAkkadiBaseResearchDeptPlaza():Boolean
{
	clearOutput();
	author("Savin");
	output("You’re in the beating heart of Akkadi’s Uvetan laboratories. There are three major labs branching off of this plaza, like spokes from a wheel -- one whose hub is a huge, fake palm tree. Guess they were trying to warm the place up a little.");
	output("\n\nTo the west is a door labeled BioMed; to the east, one labelled Starship Lab. And to the south is a seriously heavy-duty metal door with the words ‘Warp Field Lab’ printed above it.");
	if (flags["SYRIQUEST_STATE"] < 9) output(" If you had to take a guess, that’s where you need to go.")
	return syriQuestAkkadiBaseSecurityRobotsTrigger()
	//return false;
}

public function syriQuestAkkadiBaseWarpLab():Boolean
{
	clearOutput();
	author("Savin");
	clearMenu();
	if (flags["SYRIQUEST_STATE"] < 9) {
		if (flags["SYRIQUEST_STATE"] == 8) {
			output("The door to the Warp Field Lab remains steadfastly closed, but the panel beside it beeps and crackles. After a moment, you hear Commander Valden’s voice. He speaks quickly, barely pausing between words. <i>“There you are ! Good... good ! Come inside; I’ll release the locks.”</i>");
			output("\n\nThe panel beeps again, and you hear the seal on the door releasing. Okay... this is it!");
			flags["SYRIQUEST_STATE"] = 9;
			addButton(0, "Next", mainGameMenu);
		}
		else {
			output("You approach the door labeled Warp Field Lab, but rather than sliding open, it stubbornly remains closed. A panel on the wall next to it beeps, reminding you that there is a lockdown in place -- though it seems to only be affecting certain doors on this floor. Wonder what’s going on here?");
			addButton(0, "Next", move, rooms[currentLocation].northExit);
		}
		return true;
	}
	processTime(1);
	output("You’re standing inside the Warp Field Labs of the clandestine Akkadi facility. There’s a boatload of scientific equipment you can’t begin to fathom warbling quietly and ticking out complex equations on radiant holoscreens. The dominant feature of the room, however, is the huge observation window that makes up almost the entirety of the eastern wall. Beyond the window, you’re treated to the sight of what looks almost like a glass pool, ten feet high and maybe twice that across, hexagonal in shape. Rather than water inside the chamber, however, you see several holographic projectors surrounding the edges, all aimed at a central point in the heart of the tank.");
	if (flags["SYRIQUEST_STATE"] < 10) {
		output("\n\nThere you see what can only be Valden himself: a tall, lean ausar man with a short - cropped beard and sand - colored hair, wearing the same blue military overcoat Syri adores so much. He’s floating as if suspended by the holo-projectors, drifting up and down with the rise and fall of his chest.");
		output("\n\nAs you approach, his eyes flick open, locking on you. They’re solid, dark red orbs, glowing with open rage at everything around him.");
		addButton(0, "Approach", syriQuestAproachValdenPeacefully);
	}
	setNavDisabled(NAV_EAST_DISABLE);
	return false;
}

// Enemy functions (most are placeholder!!!)
public function syriQuestAkkadiBaseSecurityRobotsTrigger():Boolean
{
	author("Savin");
	if (flags["SYRIQUEST_POWER_STATE"] == 2) {
		IncrementFlag("SYRIQUEST_AKKADI_BASE_STEPS");
		var encChance:int = 5;
		if (flags["SYRIQUEST_AKKADI_BASE_STEPS"] > 3 && rand(100) < (flags["SYRIQUEST_AKKADI_BASE_STEPS"] * 5))
		{
			flags["SYRIQUEST_AKKADI_BASE_STEPS"] = 0;

			syriQuestAkkadiBaseSecurityRobotsEncounter();
			return true;
		}
	}
	//lets move all that description stuff here so I dont have to make various versions of the above function for every room
	switch (currentLocation)
	{
		case "AKD K31":
			if (flags["SYRIQUEST_POWER_STATE"] == undefined) output("nothing but the faint light of your Codex");
			else output("red emergency lights");
			output(". Ausari words are sprayed on the wall to your left in big, blocky letters: AKKADI RESEARCH & DEVELOPMENT GROUP, IMC. UVETO RIFT DIVISION. Under those is inscribed, ‘Restricted Access. Authorized Personnel Only.’\n\nSouthwards are the huge metal access doors, leading back outside to the Glacial Rift. Ahead, northwards, is a short hallway that leads up to an intersection.");
			break;
		
		case "AKD K27":
			if (flags["SYRIQUEST_POWER_STATE"] == undefined) output("The elevators are locked down, since there’s no power in the facility. The security office is dark as night, too, but the door is open.");
			else output("One elevator has come back online, running off the emergency generator.");
			break;
			
		case "AKD K13":
			if (flags["SYRIQUEST_STATE"] >= 10) {
				output("The door is open! You’re clear to make your escape!");
			}
			else if (flags["SYRIQUEST_ELEVATOR_STATE"] == -1) {
				output("The elevator is still locked down. You’ll have to find some way of overriding the security system on this level if you want to leave.");
				setNavDisabled(NAV_SOUTH_DISABLE);
			}
			else {
				output("The elevator to the south is op-- wait, no! You turn, just in time to see the metal doors sliding shut. The control panel to the side flashes red, refusing all attempts at accessing it. Damn it! You must have tripped some kind of security system.");
				flags["SYRIQUEST_ELEVATOR_STATE"] = -1;
				setNavDisabled(NAV_SOUTH_DISABLE);
			}
			break;

		case "AKD K21":
			setNavDisabled(NAV_NORTH_DISABLE);
			break;
			
		default:
			break;
	}
	return false;
}