import classes.UIComponents.ContentModules.RotateMinigameModule;
import classes.UIComponents.ContentModuleComponents.RGMK;

public function syriQuestAkkadiBaseSecurityOffice():void
{
	clearOutput();
	author("Savin");
	output("You're standing in the security office, a large circular room with bay windows overlooking the entrance hall on one side, and ");
	if (flags["SYRIQUEST_POWER_STATE"] == undefined) output("some dark chamber on the other");
	else output("a sprawling bull pen on the other with dozens of cubicles circling around a terminal of monitors and readouts everyone could see from their workspace");
	output(". You can see no entrance into this second area.");
	output("\n\nThe security office itself is a mess: several chairs have been knocked over, and you can see a couple puddles of drinks spilled across the metal floor. Looks like the guards left in a hurry. The computer terminals and monitors are all ");
	if (flags["SYRIQUEST_POWER_STATE"] == undefined) output("locked on a red screen with the ausar word for 'EMERGENCY' flashing across them. No amount of fiddling is going to make them useful with the power out.");
	else output("turning back on, showing flickering glimpses of security footage and other, more technical readouts.");
	
//	clearMenu();
	if (flags["SYRIQUEST_ELEVATOR_STATE"] == 2) addDisabledButton(0,"Cameras");
	else if (flags["SYRIQUEST_POWER_STATE"] == undefined) addDisabledButton(0, "Cameras", "Cameras", "Not avaible during a power outage.");
	else addButton(0, "Cameras", syriQuestAkkadiBaseCameras, undefined, "Cameras", "See what's going on in the facility.");
}

public function syriQuestAkkadiBaseCameras():void
{
	clearOutput();
	author("Savin");
	output("You step over to the office's central monitor hub and wave a hand across it, bringing it online. Most of the internal cameras appear to be down entirely, but there's enough external ones left that you can get a decent picture of what's going on outside. The canyon you were just overlooking is now suffering from gale force winds, picking up tons of snow and whipping it around into a blinding veil over the exterior of the facility. You can just barely make out the shapes of Syri and the rest of the Haskarn's crew taking cover behind on the half-built walls on the far side of the canyon, trying not to get blown away with the blizzard.");
	output("\n\nThe very few internal cameras you have access to show other parts of the facility than you've been in already, all locked down tight just like the main floor. You see laboratories and fabrication centers mostly, sealed by the lockdown. Ausar scientists trapped inside are banging on the doors or trying to access their comm devices, to no avail. Good, they can't get in your way while they're locked in their labs.");
	output("\n\nYou bring up a floor plan on another of the monitors, trying to match the cameras that remain with the map. It only takes you a few seconds to realize that something's off... one of the floors doesn't <b>have</b> any security cameras at all. It's not that the cameras are all down -- plenty of floors are totally dark -- but this one floor just doesn't seem to have any feeds to begin with.");
	output("\n\nIf you had to guess which floor has a miniature government blacksite on it, you'd guess that one.");

//	clearMenu();
	if (flags["SYRIQUEST_ELEVATOR_STATE"] != undefined) addButton(0,"ElevatorAccess",syriQuestAkkadiBaseElevatorAccess,undefined,"Elevator Access","Try and get access to the mysterious floor.");
	else addDisabledButton(0,"Cameras");
}

public function syriQuestAkkadiBaseElevatorAccess():void
{
	clearOutput();
	author("Savin");
	output("Glancing from the map monitor to one of the nearby terminals, you quickly sit down and start working, trying to bring up a protocol to unlock the elevator.");
	output("\n\nIt's a clever setup they have here. During a lockdown, only one secure floor can be opened at a time: all other are remotely sealed from here in the security office. ");
	output("\n\nYou tap the button for the mysterious floor, way down in heart of the glacier. A little symbol pops up, confirming that floor is unlocked. Alright, time to go!");
	flags["SYRIQUEST_ELEVATOR_STATE"] = 2;
	rooms["AKD M27"].removeFlag(GLOBAL.OBJECTIVE);
	rooms["AKD K25"].removeFlag(GLOBAL.LIFTUP);
	rooms["AKD K25"].addFlag(GLOBAL.LIFTDOWN);
	generateMap();

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
		if (flags["SYRIQUEST_ELEVATOR_STATE"] == 2) {
			if(currentLocation == "AKD K15") addDisabledButton(2,"R&D Level","R&D Level","You are already here.");
			else addButton(2, "R&D Level", syriQuestElevatorAKDK15, undefined);
		}
		else addDisabledButton(2,"Locked");
	}
}

public function syriQuestElevatorAKDK25():void {
	currentLocation = "AKD K25";
	mainGameMenu();
}

public function syriQuestElevatorAKDC15():void {
	currentLocation = "AKD C15";
	mainGameMenu();
}

public function syriQuestElevatorAKDK15():void {
	currentLocation = "AKD K15";
	mainGameMenu();
}

public var syriQuestBackupGeneratorsButtons:Array = [0, 0, 0, 0, 0];

public function syriQuestBackupGenerators(doOutput:Boolean = true):void
{
	if (doOutput)
	{
		clearOutput();
		author("Savin");
		output("Staring down into the dark abyss, you steel yourself and swing down onto the ladder. It's not a long trip down, but it's slow going when you can barely see, forced to feel around for every rung. But you do make it down, and turning up your Codex's brightness as high as it'll go, you're able to make out the shapes of several small fusion boxes. They seem to be powered off, just as Syri promised. They clearly can't handle powering both facilities at once.");
		output("\n\nYou go over to the nearest one and flip its control console open. A dim holographic readout springs to light, printing out the hash-like characters of the ausar language. You're presented with several different settings and power regulation options; glancing through them, it looks like you'll need to adjust the power output to just be high enough to get emergency systems back online. Too much, and the whole facility will come back on -- including security systems. Too little, and it'll just reset.");
		output("\n\nYou need {X} amount of power to stay in the sweet spot, and all three generators need to be online to work.");
	}

	clearMenu();
	syriQuestBackupGeneratorsButtons = [0, 0, 0, 0, 0];

	addButton(0, "Reactor Feed", SQToggleEngine, 0);
	userInterface.setButtonBlue(0);

	addButton(1, "Ion Chamber", SQToggleEngine, 1);
	userInterface.setButtonBlue(1);

	addButton(2, "Neutron Accel.", SQToggleEngine, 2);
	userInterface.setButtonBlue(2);

	addButton(3, "Particle Inj.", SQToggleEngine, 3);
	userInterface.setButtonBlue(3);

	addButton(4, "Prefire Chamber", SQToggleEngine, 4);
	userInterface.setButtonBlue(4);
}

public function SQToggleEngine(slot:int):void
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

	var powah:int = syriQuestGeneratorscalculatePowerLevel();
	var sweetSpot:int = 45;
	var ohFuckValue:int = 48;
	
	clearOutput();
	output("The power reading is flashing ‘" + powah + "%’.");
	
	if (powah == sweetSpot) syriQuestBackupGeneratorsSuccess();
	if (powah >= ohFuckValue) syriQuestBackupGeneratorsSuccessOverload();
}

public function syriQuestGeneratorscalculatePowerLevel():int
{
	var SQPowerLevel:Array = [33, 22, 7, 40, 16]

	var powah:int = 0;
	
	for (var i:int = 0; i < SQPowerLevel.length; i++)
	{
		if (syriQuestBackupGeneratorsButtons[i] == 1) powah += SQPowerLevel[i];
	}
	
	return powah;
}

public function syriQuestBackupGeneratorsSuccess():void
{
	author("Savin");
	output("\n\nThat's it! You lean back, watching the red emergency lights slowly, dimly flicker on. There's juuuust enough juice coming out of the three generators to turn on the most minimal systems. You breathe a sigh of relief as you're finally able to see again, and you turn back to the ladder. ");
	output("\n\nWhen you get back to the main level, you're greeted with exactly what you expected: dim red lights illuminating the halls, and emergency seals starting to come undone... on critical entrances and exits, anyway. That's all you need to get access to the elevators, though!");

	flags["SYRIQUEST_POWER_STATE"] = 1;
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function syriQuestBackupGeneratorsSuccessOverload():void
{
	author("Savin");
	output("\n\nThat's it! You lean back as the power spools up... and up... and up. Uh oh. The red warning lights flare all around you, and you hear machinery start whirring in the walls. You turn back to the consoles, trying to pull the power back down, but no luck. You're locked out!");
	output("\n\nGuess you're going to be dealing with security now!");

	flags["SYRIQUEST_POWER_STATE"] = 2;
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
	rooms["AKD Q15"].addFlag(GLOBAL.HAZARD);
	rooms["AKD M23"].removeFlag(GLOBAL.OBJECTIVE);
	rooms["AKD M27"].addFlag(GLOBAL.OBJECTIVE);
	generateMap();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function syriQuestBackupGeneratorsFailure():void
{
	author("Savin");
	output("\n\nNo, no... that's not right at all. You shut it all down, let the generators cool off, and try again...");
	syriQuestBackupGenerators(false);
}

public var syriQuestBackupShowerLocked:Boolean = false;

public function syriQuestAkkadiBaseStaffRoom():void{
		author("Savin");
		if (syriQuestBackupShowerLocked) {
			setNavDisabled(NAV_NORTH_DISABLE);
		}
}

//Play the first time the PC enters E9 Showers *if* the PC hasn't resolved Valden's encounter. Else, just basic room description.
public function syriQuestAkkadiBaseShowers():Boolean
{
	clearOutput();
	author("Savin");
	if (flags["MET_SCHORA"] == undefined) {
		showCommanderSchora(true);
		output("Everywhere else in this place has been abandoned, and so you don't think twice about sliding open the glass panel door at the far end of the locker room. The moment you do, though, you're assaulted with unexpected sensation: a rich smell of roses and wine leaks out of the crack in the door, followed by billowing steam that clings to your [pc.skinFurScales].");
		output("\n\nWater is running inside, pounding down from multiple shower heads and hissing across the tile floor. You glimpse a half dozen stalls inside, separated by slender walls, but only one of them's got its curtain closed. The cheap plastic curtain's thin and almost transparent, letting you see the dark outline of a large woman inside: statuesque and tall, not thick like a huskar but shapely in all the right places, with large breasts from which water cascades down onto the shower floor. ");
		output("\n\nShe's moaning softly, and you can see one of her hands moving sensually up and down her body, stopping to grope one of her meaty bosoms before delving down between her legs or reaching around to grope the plump mounds of assflesh swaying behind her.");
		output("\n\nShe hasn't noticed you yet, if you want to sneak away...");
		clearMenu();
		addButton(0,"Watch",syriQuestAkkadiBaseShowersWatch,undefined,"Watch","Looks like somebody's enjoying the showerhead in there...");
		addButton(1,"Approach", syriQuestAkkadiBaseShowersApproach,undefined,"Approach","Try and speak to the lusty lady.");
	//Puts you back outside. Can repeat above scene as long as Valden hasn't been encountered.");
		addButton(2, "Leave", move, rooms[currentLocation].southExit);
		return true;
	}
	else {
		output("The Akkadi facility's showers are a small affair, with a half dozen tile cubicles each sealed off by nothing more than a sheer, largely transparent curtain. It's much better lit than the rest of the facility has been, thanks to all the aromatic candles that have been arranged around the perimeter. A light smell of roses and wine permeates the air");
		if (flags["SCHORA_SEXED"] != undefined) output(", mixed with the linger scent of sex and cum");
		output(".");
		return false;
	}
}

public function syriQuestAkkadiBaseShowersWatch():void
{
	clearOutput();
	showCommanderSchora(true);
	author("Savin");
	output("Considering everybody's trapped on the lower levels, you guess you have a few minutes to enjoy the veiled sight of a busty Akkadi babe fucking <i>herself</i>. You slide the door open just enough to slip inside -- wouldn't want her to get cold, after all -- and find a seat against the wall opposite her.");
	output("\n\nThe mysterious woman is a dark, shadowy outline on the other side of the curtain, just defined enough to let you see the womanly shape of her body and a hint of bronze-colored flesh and rose-gold hair. One of her hands is wrapped around a breast, fingers sinking into soft flesh and pinching a coal-black nipple. ");
	output("\n\nHer other hand's got something in it down between her legs. At first, you think it's the shower head, blasting her pussy with the stream... until she leans back against one of the walls, and you see something small but distinctly cock-shaped jutting out from her crotch. Maybe five or six inches, quite small compared to her ample breasts and the baseball-sized sack hanging underneath it.");
	output("\n\nWhat a twist!");
	output("\n\nYou watch as the alien dick-girl wraps her fingers around her petite prick, slowly gliding up and down the wet shaft.");
	output("\n\n<i>“Fuck yeah,”</i> she moans, so softly you can barely hear it over the roar of the shower. <i>“Pound my worthless pussy!”</i>");
	output("\n\nHer breath quickens, little moans emphasizing the rise and fall of her chest. Her breasts jiggle in her grasp, quaking as she starts thrusting her hips against her hand. You hear the familiar wet slapping sound of flesh on slippery skin. The dickgirl's going hard now, thrusting into the tight grip of her hand.");
	output("\n\nSuddenly, she arches her back and goes rigid, pumping her cock to the very base -- the thick, knotty base, you note. You catch a glimpse of a nice, thick streak of cum squirt out from between her fingers, arcing far enough to splatter on the far wall. The woman gasps, shivers, and slowly starts to slide down the wall to a sit.");
	output("\n\nNow would be a good time to make yourself known, if you want...");

	processTime(15);
	clearMenu();
	addButton(0,"Approach", syriQuestAkkadiBaseShowersApproach,undefined,"Approach","Try and speak to the lusty lady.");
	addButton(1, "Leave", syriQuestAkkadiBaseShowersLeave, undefined,"Leave","Leave her to recover on her own.");
}

public function syriQuestAkkadiBaseShowersLeave():void
{
	syriQuestBackupShowerLocked = true;
	move(rooms[currentLocation].southExit);
}

public function syriQuestAkkadiBaseShowersApproach():void
{
	flags["MET_SCHORA"] = 1;
	clearOutput();
	showCommanderSchora(true);
	author("Savin");
	output("You take an intentionally loud step forward, rapping your knuckles on the glass of the door as you stride towards the showers.");
	output("\n\nThe alien woman gasps and jumps up. <i>“Oh shit! What time is it?”</i> she yelps, wrapping an arm around her chest. You still can't make out too much of her actual features, other than her shapely figure and a pair of horns growing out from her brow, sweeping back across her scalp.");
	if (flags["SYRIQUEST_LOCK_BYPASS"] >= 1) output(" Wait, is that the so-called 'commander' who boarded the hovercraft after you? Halfbreeds with horns can't be <i>that</i> common, after all...");
	output("\n\n<i>“Lost track of time");
	if (flags["SYRIQUEST_LOCK_BYPASS"] >= 1) output(", commander");
	output("?”</i> you ask, continuing to approach.");
	output("\n\nShe laughs, slowly lowering her arm from her bosoms. <i>“Yeah, maybe. Why? You didn't hear anything, did you?”</i>");
	output("\n\nDid you?");

	processTime(3);
	clearMenu();
	addButton(0,"What's Up?", syriQuestAkkadiBaseShowersWhatsUp,undefined,"What's Up?","She's the first actual person you've seen since you got here. Shouldn't there be an entire staff here... and security... and researchers?");
	addButton(1,"Yeah I Did.", syriQuestAkkadiBaseShowersYeahIDid,undefined,"Yeah I Did.","You sure heard something. Maybe something you could get in on...");
}

public function syriQuestAkkadiBaseShowersWhatsUp():void
{
	clearOutput();
	showCommanderSchora(true);
	author("Savin")
	output("<i>“Forget that. Where is everyone?”</i> you ask. <i>“You're the only other person I've seen!”</i>");
	output("\n\nThe conversation's tone changes immediately. The woman yanks back a corner of the curtain, revealing a bronze-skinned face fringed by sodden rose-gold hair, parted around horns and fuzzy pointed ears. She stares at you with hard red eyes, brow furrowed. <i>“What do you mean 'where's everyone'? And who are <b>you</b> supposed to be?”</i>");
	output("\n\nSkirting the second question, you tell her that there's nobody in the halls. The facility's on lockdown. The power's barely running.");
	output("\n\nThe woman curses and throws the curtain aside -- giving you a momentary look at a full rack of F-cup tits, each capped with a coal-black nipple, and a small knotty human cock over a comparatively massive set of balls swinging between her legs -- before she grabs a towel and throws it over herself.");
	output("\n\nShe's got little regard for modesty, roughly slapping the water off her body while demanding <i>“Why didn't you say so!? Fuck, what happened?”</i>");
	if (pc.isNice()) output("\n\n<i>“Power went out,”</i> you tell her. It's the truth... just not all of it.");
	else output("\n\nYou shrug.");
	output("\n\n<i>“I told them to put alarms in here. I told them!”</i> she growls, throwing the towel in your face. She stomps past you into the locker room, letting her balls and boobs bounce with utter disregard for you. With movements so confident that they have to be practiced, the woman throws open one of the lockers and stuffs herself into a very tight blue Akkadi uniform, then pulls on a ballistic vest over it.");
	output("\n\nYou get a moment's worry when she pulls out a belt with a holstered hand cannon on it, but she just clips it on and yells over her shoulder, <i>“Don't go anywhere.”</i> The woman jogs out of the locker room and down the hall towards the elevator.");
	output("\n\nWell, there she goes, you guess. You were kind of hoping she might shed some light on what happened in the few minutes between the power dropping and your arrival, but it looks like she was just as clueless as you were.");

	rooms["AKD E9"].removeFlag(GLOBAL.NPC);
	generateMap();
	processTime(5);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function syriQuestAkkadiBaseShowersYeahIDid():void
{
	clearOutput();
	showCommanderSchora(true);
	author("Savin");
	output("<i>“Oh I heard something alright,”</i> you say, stepping forward with a sexy swagger. <i>“");
	if (pc.isAss()) output("Something about a dirty girl needing her worthless pussy pounded");
	else output("Some needy girl's been getting dirty in the shower");
	output(".”</i>");
	output("\n\nThe alien woman growls and pulls back a corner of the shower curtain, revealing a chiseled, bronze-skinned face fringed by rose-gold hair. A pair of perky ears twitch on either side of a pair of curling horns that grow from her brow. She's not a dzaan, though... not purely, anyway, if the big knot and patches of fuzz are anything to go by. A half-ausar, maybe");
	if (pc.isTreated()) output(", unless she's been getting poked on New Texas recently");
	output("? She's scowling, but you can see a coal-black nipple peeking out, still rock-hard.");
	output("\n\nYou play it cool, closing the distance. After all, if she didn't want somebody seeing her lewd display, she wouldn't have been doing it in a public shower, would she? She was just hoping someone would stumble on her... and take advantage. You say as much, and the halfbreed's skin darkens... but she doesn't deny it.");
	output("\n\nIndeed, the woman bites her lower lip for a moment, then fixes you with her dark red eyes. She throws the curtain aside, revealing a lusciously thick, curvaceous body; not chubby like a huskar, but statuesque like a dzaan alpha. Her big F-cup breasts rise and fall hypnotically with her quick breaths, jiggling softly, and between her legs... your eyes fixate on a human-shaped cock, relatively small, but with a plump knot and a big apple-sized sack hanging behind it.");
	output("\n\n<i>“So what, you offering?”</i>");
	output("\n\n<i>“Wouldn't be interrupting the show if I wasn't,”</i> you answer, starting to pull off your [pc.gear]. ");
	output("\n\nThe dog-eared woman blinks, then laughs and steps back into the rushing waters of the shower, crooking a finger to you.");
	output("\n\nYou follow her in, shrugging off the last of your gear before submerging yourself in the steamy downpour. The dusky dickgirl keeps retreating until her back's against the wall, letting you pin her between yourself and the slick tile. <i>“I guess I deserve one more day of vacation,”</i> she moans as you grab her ass, pinning her little dick between your bodies and groping one of her meaty breasts.");

	processTime(10);
	clearMenu();
	addButton(0,"TreatHerRight", syriQuestAkkadiBaseShowersTreatHerRight,undefined,"Treat Her Right","A beauty like this needs to be treated like a lady... a dirty, slutty dickgirl of a lady, but still.");
	addButton(1,"TreatHerBad", syriQuestAkkadiBaseShowersTreatHerBad,undefined,"Treat Her Bad","Treat this chunky dickgirl like the big, slutty half-puppy she is.");
}

public function syriQuestAkkadiBaseShowersTreatHerRight():void
{
	clearOutput();
	showCommanderSchora(true);
	author("Savin");

	output("<i>“Schora. Alyru Schora.”</i>");
	output("\n\nYou quirk an eyebrow.");
	output("\n\n<i>“That's the name you're gonna be moaning,”</i> she winks, circling a leg around yours. You feel her little dick throb, pressed against your [pc.belly], and her arms settle around your shoulders.");
	output("\n\n<i>“[pc.name],”</i> you answer back, circling your fingers around one of her pebbly black areola. Alyru moans approvingly, slowly gyrating her hips to rub her prick against your [pc.skinFurScales]. You guess that's the formalities out of the way, so you push her back against the stall wall and thrust your [pc.tongue] into her mouth, exploring the sharp little fangs and the broad, ausar-like tongue within. ");
	output("\n\nThe hands that were wrapped around your back slip downwards, tracing across your [pc.chest]");
	if (pc.hasBreasts()) output(" and groping at your breasts, cupping and squeezing them");
	else output(", running her fingers across the muscles there");
	output(". Oh, that's nice... especially when those magic fingers start playing around your [pc.nipples], pinching and stroking until you're getting just as excited as Alyru and her rock-hard cock.");
	if (pc.hasCock()) {
		output("\n\nYou feel your own [pc.cock] stiffening, grinding against the half-dzaan's bronzed thigh until it's at full mast, searching for a hole to slide into. One of Alyru's hands reaches down, wrapping around your turgid girth and starting to stroke it, slowly at first, letting the water lubricate her motions until she's properly pumping away. You push back against the lustful dickgirl, squishing her a little tighter between you and the wall, digging your hands into her plush flesh.");
		output("\n\nIt's taken you no time at all to go from idle curiosity to unrestrained desire for this chocolate she-wolf's body. You dig your hands into her plump flanks and turn her around, pushing her face-first into the tiles. Her ass is fucking <i>huge</i>, a pair of perfectly shaped mounds of jiggling booty that thrust back against your crotch. Your cock's almost instantly enveloped, swallowed up into the butt-cleavage you've suddenly exposed -- and you wouldn't have it any other way. Alyru's been in here long enough that the water's soaked into all the hard to reach places, making it nice and slick for you: it's easy to rock your hips back and forth, fucking her crack between hard spanks and squeezes and gropes.");
		output("\n\n<i>“Oh! That's the stuff!”</i> Alyru moans, thrusting back against you. One of her hands hefts up a plump bronze boob, squeezing it between her fingers, while the other reaches back, brushing against your thigh. Gently, she guides your hands to her hips, her intentions clear: hold on, and fuck her hard.");
		output("\n\nYou give her exactly what she wants.");
		output("\n\nYou tighten your grip on Alyru, holding her steady while you pull your own hips back, dragging your [pc.cock] back through the channel of her asscrack. A little work and you're lined up with the slick pussyslit hidden between those full-moon cheeks. Your [pc.cockHead] presses in between her lips, gently parting the fleshy folds. Alyru lets loose a soft moan as you start to enter her, and you can feel her muscles tightening -- including her cock twitching, leaking dickmilk onto her thighs.");
		output("\n\nAlyru flashes you a little grin over her shoulder and wiggles her hips, taking the first inch of your dick. <i>“C'mon, stud, give it to me!”</i>");
		output("\n\nShe asked for it. You slam yourself in ");
		if (pc.biggestCockLength() >= 8) output("as deep as you can go");
		else output("all the way to the hilt");
		output(", and Alyru's scream of pleasure echoes throughout the room. Her body goes stiff for a moment, clenching hard around your sudden invasion, before relaxing as she sighs and moans. The tension bleeds out of her, letting you start to move your [pc.hips] and fuck that pussy like it deserves: hard, fast, and loud.");
		output("\n\nThe sound of your hips slapping against Alyru's ass fills the showers. Your partner's plump balls swing underneath her, rocking back and forth with the impacts. You can feel just how full and heavy they are just from the way they move! The halfbreed slut gropes herself and strokes her cock, letting you decide exactly how hard to pound her into the wall.");
		output("\n\nAnd how she gets off, apparently. Alyru's pussy clenches around your [pc.cock] at the apex of one womb-deep thrust, holding you inside her. Even drenched in hot water as you are, you're able to feel a sudden flood of sultry moisture around your shaft, spilling down her dusky thighs. The real show is in front of her, though: her cock is pressed straight downward, crown swelling against the tile before leaking a thick streak of white cream. Her cum smears across the shower wall, drooling downwards in thick rivulets before being washed away by the beating rain of the shower.");
		output("\n\n<i>“Oh, <b>fuck</b>,”</i> Alyru says with a shudder you feel all the way to your [pc.knot]. You don't let up just because she came, of course. The second her grip on your [pc.cock] slacks, you start thrusting again, just as hard as before. <i>“Oh fuck oh fuck oh FUCK!”</i>");
		output("\n\nIt's all of a minute of her blubbering and gasping before her cock stiffens again, and more of that sweet, musky white is dripping down the walls. Alyru desperately tugs on her little dick, milking out more and more until her cum-swollen sack attains its sweet release. You reach down and give her balls a gentle squeeze, feeling how much lighter they've gotten since you starting pounding her pussy. You can see the fruits of your labor splattered on the tiles between Alyru's legs, pooling under her dainty little feet.");
		output("\n\nYou let the twitches and erratic clenches of Alyru's orgasming quim finally lead you to your own climax. ");
		if (pc.hasKnot()) output("You give her one last, mighty thrust, burying your [pc.knot] into the sodden slit of her pussy. Alyru screams and cums again, spraying her cockmilk all over the wall one last time while you unload into her waiting womb. With nowhere else to go, your [pc.cum] fills her up from the depths out, trapped inside her spasming slit.");
		else output(" [pc.Cum] rushes up through your [pc.cock], swelling your member turgid for a split second before erupting into Alyru's innermost depths.");
			output(" You gasp, a ragged sound from deep in your chest, as your orgasm paints the halfbreed's inner walls [pc.cumColor]. Your [pc.chest] presses into her back, holding this naked stranger close until your climax passes, leaving her full of your jizz and the shower floor a sloppy mess between your [pc.feet].");
		if (pc.hasKnot()) output("\n\nThankfully for your mission, the water's lubed Alyru up inside and out. With a little work, you're able to pull your knot back out of her -- but not without triggering one last orgasm from the poor half-ausar. She's only able to give you a few little spasms from her dick, dripping the last of her cum onto the ground. When your [pc.knot] pops free, a deluge of spunk spills free, leaving Alyru's thighs a creamy [pc.cumColor].");
		output("\n\n<i>“Fuck yeah!”</i> Alyru sighs, shivering as a little of your seed leaks down her legs. <i>“First day back on the job... pretty good so far.”</i>");
		output("\n\nShe laughs, slowly slumping down onto the floor. Guess you've satiated the lusty halfbreed, though you're no closer to your actual goals. ");
		output("\n\nBut hey, never a bad time to get your dick wet, right?");
	}
	else {
		output("\n\nOne particular pinch makes you gasp, squirming until Alyru lets you go. She's giggling, and her hands quickly settle on your shoulders, gently pushing downwards. <i>“You've got a good tongue,”</i> she smirks. <i>“Can I see what it feels like around my dick?”</i>");
		output("\n\nWell, if she insists.");
		output("\n\nYou slip down onto your [pc.knees], letting your hands play around all the tender flesh between her lips and her vulva as you cup the apple-sized black sack hanging low beneath her dick. It's wonderfully heavy and soft, letting your fingers find the actual nuts inside and give them gentle, loving caresses. That small effort alone is enough to make Alyru's member jump from excitement, bouncing around as her muscles contract and pre bubbles up around her brown bellend. ");
		output("\n\nBut that's just the teaser. Your eyes focus on the tip of her dick, the perfect dark mushroom bobbing in the air just above the tip of your nose. It's glistening in the light, just like so much of her bronze body, and even with the deluge of pure water all around you, you can smell the desire radiating off of its hungry crown. Grinning up at Alyru, you lean in and plant a kiss on her cockhead, slowly spreading your [pc.lips] around her girth. Your partner gasps, grasping at your [pc.hair] as you slide down her dick. It isn't a difficult cock to swallow: she's a hair over five inches, but just thick enough to make your throat strain a little. It's only a moment before you're wrapping your [pc.lips] around the thick bulge of knot-flesh around her base, gently sucking on it while your [pc.tongue] licks and caresses the underside of her cock.");
		output("\n\n<i>“Oooh, that's the stuff!”</i> Alyru moans, grinding her hips against your [pc.face]. <i>“That's what I call a magic mouth!”</i>");
		output("\n\nSo you've heard, but you aren't satisfied just giving a blowjob... and you doubt she's content just letting you play with her pecker, either. Glancing up at the bronze beauty, you give her lush ass a firm squeeze as you pull off her rod, letting it bounce and wobble under the water's pressure. Before Alyru can ask what's going on, you tighten your grip on her ass and pull her down onto the floor with you. She yelps, legs sprawling out and hands gripping your back tightly.");
		output("\n\n<i>“Oh! I like a " + pc.mf("man","woman") + " who takes charge!”</i> Alyru moans, tightening her grip around you. Her knees press into your sides, helping to pull you tight against her soft body. A little wiggling (and a little groping) and you've got your [pc.vagOrAss] angled just above her dusky crown, letting its rounded head slowly start to press into you. ");
		output("\n\nYou take it slow, letting gravity do most of the work. You feel every throb and twitch rippling up through Alyru's cock; feel your body inexorably spreading around her turgid girth, hungry to accept every inch of it. The half-dzaan's breath catches as she bottoms out inside you, her thickening knot pressing against your entrance. Your body stops its descent against that bulging bitch-breaker, [pc.vagOrAss] quivering with the tension of its attempted entrance.");
		output("\n\n<i>“Gonna bounce for me?”</i> Alyru murmurs, nuzzling against your shoulder, <i>“Or do you just want to tie me down by the dick and ride me?”</i>");
		output("\n\nYour body answers the question for you, instinctively pushing back on your [pc.knees] up the short length of her dick. Your [pc.hips] shake back and forth, grinding Alyru's mushroom-shaped cockhead around inside you while you slide back down. By the time your [pc.vagOrAss] is pressed against her knot again, your entire lower body is trembling with pleasure.");
		if (pc.hasTail()) output(" Your [pc.tail] beats against the sodden floor of the shower, a visceral show of your enjoyment.");
		if (pc.hasBreasts()) output(" Your [pc.boobs] squish against Alyru's, nipples rubbing wetly against her own. Grinning at you, the halfbreed hefts up her breasts, holding the big, soft mounds still (or at least, as much as she can with so much jiggly boobflesh) so that you can grind your [pc.nipples] against her own faster. Flesh glides across flesh, sending little chills of pleasure through your chest with every move you make.");
		output("\n\nThe steaming water beats down on you, making it oh-so easy to slide yourself up and down the dickgirl's rod. Harder and hard, you fuck yourself on her short little shaft, bouncing in her lap. Alyru's hands wrap around your [pc.butt], lifting you up and letting you slide on back down until her knot's pressing against your entrance. Every thrust takes it deeper, making you stretch open just a little wider every time.");
		output("\n\nEventually, the inevitable end of ausar-fucking comes home to roost: you feel Alyru's knot press hard against the " + (pc.hasVagina() ? "lips" : "rim") + " of your [pc.vagOrAss]. There's a moment of overwhelming pressure, threatening to tear you apart, before the bitch-breaker breaks you in, lodging itself " + (pc.hasVagina() ? "just past your pussylips" : "in your ass") + ". You know you scream, crying out in pleasure, but your voice sounds a million miles away, drowned out by the orgasm Alyru's knot is ripping out of you. Your body convulses, clenching and cumming, wringing the half-dzaan's cock until she, too, stiffens. You feel her dick throb, swelling for a brief second before you feel that wonderful wetness squirting into your body, smearing across your inner walls.");
		output("\n\nHeat radiates out through your [pc.vagOrAss], helping to calm you from your orgasmic high. You focus yourself on the warmth inside you; on the cum settling in your " + (pc.hasVagina() ? "womb" : "colon") + ". Alyru's fingers dig into your [pc.butt], holding you tight until her dick's finished discharging its hefty load. Feels like she pumped a soda can's worth of cum into you.");
		output("\n\nLucky for your mission, the shower's kept your body nice and slick, inside and out. It only takes a little effort to dislodge yourself from Alyru's knot, letting loose a deluge of steaming ausar semen onto the floor between her legs. She grins at the sight, crimson eyes transfixed on your " + (pc.hasVagina() ? "[pc.cunt]" : "cum-smeared thighs") + ".");
		output("\n\n<i>“That's a good look,”</i> she murmurs, watching you start for the door. <i>“God damn, best way to end a vacation ever.”</i>");
	}
	pc.orgasm();
	chars["SCHORA"].orgasm();
	flags["SCHORA_SEXED"] = 1;
	processTime(30+rand(15));
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function syriQuestAkkadiBaseShowersTreatHerBad():void
{
	clearOutput();
	showCommanderSchora(true);
	author("Savin");

	output("You reach down and grab the dusky halfbreed's cock, drawing a gasp from her. She squirms in your grip, pinned between you and the wall, completely at your mercy... and the way her dick is starting to throb and leak in your grasp, she's loving every second of it.");
	output("\n\n<i>“What's your name, slut?”</i> you breathe into her ear, stroking her off with forceful, even motions.");
	output("\n\nShe moans, clutching at your [pc.butt], trying to keep her balance. <i>“A-Alyru. Alyru Schora.”</i>");
	output("\n\n<i>“Good. Now get on your knees and put that mouth to use for something,”</i> you growl, releasing her dick in exchange for one of her meaty tits, squeezing it until she complies. The bronzed halfbreed slinks down, resting her hands on your [pc.hips] and fixes her gaze on what's between your [pc.legs]. No time for that. You wrap your fingers around her dark horns and just smash her face right down in there.");
	if (pc.hasCock()) {
		output("\n\nThe dusky little exhibitionist knows exactly what to do with a dick -- surprising nobody, considering the stiff little prick wobbling between her legs. If she hasn't been sucking her own cock, then she's clearly the office fucktoy. Without hesitation, she wraps her lips around your [pc.cockHead], swirling her tongue around the tip before opening her throat for you. She doesn't move past that, just slobbering all over your knob, waiting for your pleasure.");
		output("\n\nHer horns are handlebars, at the perfect height for you to hold her head steady and start face-fucking her. No preamble, no foreplay; you just start slamming your hips into her face, driving your [pc.cock] deep into the dickgirl's clenching throat. She's got exactly no gag reflex, but seems perfectly capable of rhythmically squeezing her throat around your thrusting member. You grin down at her, watching your [pc.cock] disappear between her dark lips again and again, coming back shining with spittle every time, only to have it washed away by the beating waters before it goes balls-deep back in again.");
		output("\n\nAlyru's rosey rump swishes in the water while you use her mouth. She's shameless about enjoying it, even reaching down to tug on her own little prick.");
		output("\n\nCan't have any of that. You take her horns and pull her sideways, off her knees and sprawling her out on the shower floor. Her dick bobs in the air, bumping into her plump ballsack when you push it up out of the way, revealing the thick, dark lips of her sex. ");
		output("\n\n<i>“Hands off,”</i> you command, lacing your fingers through hers and pinning Alyru's hands against the tile. Her sack's heavy enough with pent-up desire to hold her dick down and out of the way, and you're able to press your [pc.cockHead] to her pussylips, parting the slick folds of her sex ever so slightly. Alyru shivers, whining with shameless desire, and her pussy quivers around your crown. You push your hips forward, and are immediately rewarded with a visible throb of the dickgirl's pinned pecker; her hands clench around yours, trying desperately to break free and pleasure herself, but you hold her fast. Her legs squirm on either side of you, kicking haplessly in the water while you slowly grind your [pc.cock] into her pussy.");
		output("\n\nEmphasis on slow. You take your own time, enjoying the way her pussy clenches and squeezes around every inch of your shaft. She's a soaking wet mess, inside and out, making it almost too easy to slide all the way in. She can't resist you, even if she wanted to, only able to add a little slick friction to your penetration that enhances your pleasure. By the time you've bottomed out in the buxom bitch, there's a broad smear of halfbreed cream on her belly; a constant stream of pre leaks from her dusky cockhead, bubbling up with every little movement of your [pc.cock].");
		output("\n\nYou don't want to let her adjust to your size, so you start moving immediately, pumping your [pc.hips] against her plump posterior. Her ass jiggles with every impact, sending shockwaves through her plush body that reach all the way to her mammoth bosoms, making the olive mounds bounce every time your dick slams back home inside her. Alyru's voice is nothing but a cascade of gasps, whimpers, and cries of pleasure, driven insensate by your relentless fucking. You can tell she desperately wants to jack off, to have some measure of control over the waves of ecstasy crashing through her, but you refuse to let her move, dominating her mind and body with your [pc.cock].");
		output("\n\nAlyru squirms harder suddenly, thrashing her legs and tail around your waist until her back arches and her dick juts up with enough force to dislodge it from underneath her balls. An absolute geyser of white cream lances up from her crown, arcing through the sultry air between your bodies before ");
		if(pc.biggestTitSize() >= 5) output("coming down in a hot smear across the tops of your [pc.boobs].");
		else output("splattering down all over Alyru's belly.");
		output("\n\nYou grin down fiercely at the subby slut, not skipping a beat in the movements of your hips. You're relentless, pounding her plump puss until the halfbreed whore's screaming, arching her back and leaking her dickmilk again... and again... and again. You're sure now that she gets off on the helplessness, on her complete, whimpering submission to a stranger fucking her into the ground. By the time you feel your own orgasm building, Alyru's belly is coated in a thick veneer of her own semen. Her balls, once apple-sized, bounce airily with your rapid thrusts, so emptied by their owner's repeated orgasms that they feel almost weightless each time they swing back and slap against your crotch.");
		output("\n\nThere's not much of a reason to hold back, at this point. Alyru's gone limp in your arms, eyes rolled back in her head; she's panting hard, slowly swishing her tail through the water and continuing to leak cum and girl-juice into the beating waters of the shower. You thrust your [pc.cock] deep into the gushing lips of Alyru's sex{, hard enough for your [pc.knot] to lodge itself in there } before you blow your load, pumping thick wads of [pc.cum] into the half-ausar's womb.");
		output("\n\nThe only reaction you get from your impromptu lover is a throaty, hoarse moan and a last little spurt from the tip of her dick. The watery white aftershots run down her belly, washed away in the downpour. Your cum isn't going anywhere, though{, thanks to your [pc.knot]}. You feel the warm liquid load settling around your [pc.cockHead], painting her inner walls [pc.cumColor].");
		output("\n\nWhen you're done, you lean back on your [pc.knees], ")
		if (pc.hasKnot()) output("tugging your knot back out of Alyru's gaping twat. Luckily for your mission, she's wet enough inside and out that it isn't too hard to pop out, letting the excess of your orgasm spill out of her");
		else output("dragging your cock out of her in a deluge of mixed juices");
	output(". You take a moment to catch your breath, survey the spunk-slathered, fuck-drunk slut you're leaving behind before you stand up and head for the door.");
		output("\n\nThe way she's whimpering, still rock hard, you don't think she's going to be walking any time soon!");

		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else {
		output("\n\nThe halfbreed skank's tongue flicks out, licking at your thighs, trailing up towards your [pc.vagOrAss]. ");
		if (pc.hasVagina()) output("You spread your [pc.legs], letting Alyru's tongue wind its way to the [pc.pussyLips] between them. A little swirl of her tongue, and she's inside you, teasing her way through your " + (pc.vaginas[0].looseness() < 3 ? "tight" : "loose") + " passage.");
		else output("With a little maneuvering, you twist your body so that Alyru has ready access to your asshole. She goes after the sinful hole without hesitation, pressing her tongue against your [pc.asshole] and putting just enough pressure against your dark star that your body bends around her, admitting entrance.");
		output(" That's the stuff! ");
		output("\n\nWith your hands still wrapped around Alyru's horns, you pull her down on your sex, grinding her face into your [pc.vagOrAss]. She's got a broad tongue, if not a long one, and with a little wiggling she's able to splay your inner passage open. You can't help but shiver as her alien tongue slithers deeper, licking and caressing every inch of tender inner flesh. For both your sakes, you make sure she gets you nice and wet, slobbering up your [pc.vagOrAss] before you push her down on her back, kicking her legs apart so that you've got uninterrupted access to the little five-inch pillar of fuckmeat jutting up from her crotch.");
		output("\n\nAlyru's hands settle on her tits, groping at the marshmallow pillows while you slip down and straddle her broad hips. You slip a pair of fingers down, caressing your [pc.vagOrAss] and stretching it open. It's easy to line her up with your entrance: she's got a plump mushroom-shaped crown, just like a human's dick, letting it wedge right into your entrance. There's enough moisture built up on the buxom babe's " + (silly ? "benis" : "dick") + " that all you feel is a moment's strain, and then the wonderfully fulfilling sensation of your [pc.vagOrAss] being filled with dick. Alyru moans underneath you, tugging on her chocolate nipples until your [pc.butt] is pressed into her thighs and her cock is fully sheathed inside you. Once you're settled, you put your hands on hers, squeezing down on those big bronze beefers. You can feel her little shaft throbbing inside you, squeezed between the walls of your [pc.vagOrAss]. Her balls are flush against your [pc.butt], churning with their owner's growing need.");
		output("\n\n<i>“Big strong girl like you... and you just love being on bottom, don't you?”</i> you tease, pinching a dusky tit. She whines, but her dick leaks inside you, an undeniable admission from her oversexed body. When her pre spills into you, though, you're immediately treated to a thrill of pleasure that suffuses into a low heat spreading through your loins.");
		output("\n\nMust be the dzaan half of her doing its job. You can probably handle a dose or two, but those balls are full, and she feels like she's gonna pop any second now. Hope she's not too addictive... ");
		output("\n\nJust thinking about taking a load of drug-laced xenocum makes your [pc.vagOrAss] quiver with anticipation, which is apparently enough to make the naughty dickgirl gasp, arching her back off the shower floor and thrusting her dick knot-deep into you. The warm sensation sextouples, following something wet and warm smearing inside you, painting your inner walls with Alyru's intoxicating seed.");
		output("\n\nYou shiver, feeling her dzaan-half's drugs at work. All it makes you want to do, though, is ride her harder. Digging your fingers into Alyru's meaty rack, you start to shake your hips, rising up on her petite shaft before dropping back down again, refusing to give her the chance to come down off her own orgasmic high. The halfbreed cries out, squirming and moaning underneath you, clearly trying not to scream. her throes of pleasure only make you move faster, bouncing in her lap, dragging her drugged-up spunk all through your " + (pc.hasVagina() ? "pussy" : "ass") + ". Your entire sex is smeared with her seed, and stars above, it feels <i>good</i>!");
		output("\n\nAlyru doesn't even have a chance to get soft after giving you that first creampie. Your ceaseless motions keep her nice and hard, no matter how much agonizing pleasure that inflicts on her; no matter how many whimpers and cries of over-stimulation she makes; no matter how she squirms and leaks between your [pc.legs]. When she cums again, a bare couple minutes after the first time, you're riding Alyru's cock with all the lust in your heart, high on her jizz and loving every second of it. The second dose is shot right into your " + (pc.hasVagina() ? "womb" : "belly") + " to a celebratory chorus of Alyru's feral screams of pleasure and the slamming sounds of your [pc.skin] coming down in wet smacks against the dusky dickgirl's thighs.");
		output("\n\nYou're breathing hard, blind to the world around you. All you can see... feel... even think about is the lush slut under you. Her dick, pulsing and leaking inside you, is the center of your entire universe. Pleasuring it is the only thing that matters. Alyru's second cumshot is enough to drive you over the edge, and with a thrill of sheer, drug-induced ecstasy at your dedication to the futadick inside you, you push yourself down hard on the thick knot of cockflesh. Your body accepts it eagerly, spreading around the bitchbreaker -- and stars above does it <i>break</i> you. You throw your head back and cum, clenching hard around every inch of throbbing futaflesh while the thunderbolts of orgasm tear through your body.");
		output("\n\nWhen they pass, you collapse face-first onto Alyru's pillowy chest, burying your [pc.face] between those soft, dark mountains while she slowly deflates inside you. As wet as you are, you're sure you could extricate yourself if you wanted to... but why would you? You let out a quiet little moan and clutch at Alyru's chest and shoulders, holding her tight.");
		output("\n\n<i>“Yeah... I still got it...”</i> she breathes, settling her hands on your [pc.butt]. <i>“Oh yeah.”</i>");

		clearMenu();
		addButton(0, "Next", syriQuestAkkadiBaseShowersTreatHerBadOutro);
	}
	pc.orgasm();
	chars["SCHORA"].orgasm();
	flags["SCHORA_SEXED"] = 2;
	processTime(30+rand(15));
}

public function syriQuestAkkadiBaseShowersTreatHerBadOutro():void
{
	clearOutput();
	showCommanderSchora(true);
	author("Savin");
	output("You wake up some time later, sore in the loins and tingly all over. Alyru's passed out on the floor, so you quietly slip out of her embrace and out of the shower, groping around for a towel. So much for your mission being swift. Wonder how Syri's kept the power down all this time?");

	processTime(30);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}



// Torra, Assistent Researcher
public function syriQuestAkkadiBaseCheckPoint():Boolean
{
	clearOutput();
	showTorra();
	author("Savin");
	output("As you make your way to the end of the hallway, you see a security checkpoint coming up. It's nothing you haven't seen a million times before at Steele Tech offices, just a little scanner row at the end of the hall to make sure nobody's smuggling weapons in, or company property out. Since there's nobody manning it, it's child's play to just hop the guard station rather than going through the scanner. The system so far hasn't picked you up just walking down the halls, but there's no sense in risking it.");
	output("\n\nWhen you land on the other side, you feel strong arms grabbing your shoulders.");
	output("\n\nYou spin around, instinctively bringing your [pc.weapon] up as you face the figure that's grabbed you. It's not a security robot, at least: your gaze settles on a pair of slender arms wrapped in blue latex, leading up to an enormously voluptuous, naked body covered in a thick layer of soft white fur, spotted with circles of black. She's a humanoid cat-morph with long fangs sticking out of a short muzzled tipped with a heart-shaped pink nose. A shock of fiery orange hair flows from between her fuzzy feline ears down her back and spills over her shoulders, drawing your eyes to the huge, weighty tits sitting high, proud, and bare on her chest. The puffy black teats at their tips are both pierced with gold rings so small they don't quite reach the bottoms of her wide areolas.");
	output("\n\n<i>“Please,”</i> the busty cat-woman breathes, pawing at your shoulders. <i>“Oh, spirits of ice and sea, please!”</i>");
	output("\n\nShe's babbling, but it's clear to see what she wants. One of her hands glides down between her legs, rubbing at the black lips of her twat. She's bare down there, too: the only clothing she's wearing is the latex arms and legs of her corporate jumpsuit. With everything laid bare, you can see she's dripping wet, and her teats are hard as rocks. And you can see something long and black hanging out from behind her lush thighs -- something's rammed up her ass, and it's vibrating softly as she paws at you.");
	output("\n\nThis cat needs a good hard fuck, and it doesn't look like she's going to say no!");
	processTime(10);
	clearMenu();
	flags["MET_TORRA"] = 1;
	addButton(0,"Fight", syriQuestAkkadiTorraFight,undefined,"Fight","You've got a bad feeling about submitting to this needy kitty.");
	addButton(1,"Fuck", syriQuestAkkadiTorraFuck,undefined,"Fuck","Why bother fighting? You both wan't the same thing anyway!");
	return true;
}

public function syriQuestAkkadiTorraFight():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new Torra());
	CombatManager.displayLocation("ASSISTANT\nRESEARCHER");
	CombatManager.victoryScene(syriQuestAkkadiTorraVictory);
	CombatManager.lossScene(syriQuestAkkadiTorraDefeat);
	CombatManager.encounterTextGenerator(syriQuestAkkadiTorraFightText);
	CombatManager.beginCombat();
}

public function syriQuestAkkadiTorraFightText():String
{
	var eText:String = "";
	eText += "You're fighting the Milodan Researcher!";
	eText += "\n\nShe's a tall furry woman with the ears and colors of a snow leopard. Her figure is the very definition of fertile: she has broad hips, thick thighs, and a thin waist. And her breasts, well, they're <i>beyond</i> fertile: the huge, succulent mounds sit high and heavy on her chest, each capped with a prominent black teat. She's well beyond an H-cup, if they even make bras big enough to contain such mammalian magnificence. She's unarmed, save for the razor-like feline claws protruding from her digits, and the meaty black vibrater lodged inside her. That's a kind of weapon, right?";
	
	return eText;
}

public function syriQuestAkkadiTorraDefeat():void
{
	CombatManager.genericLoss();
	syriQuestAkkadiTorraFuck();
}

public function syriQuestAkkadiTorraFuck():void
{
	clearOutput();
	showTorra(true);
	author("Savin");
	 output("Before you can blink, the milodan matron is on you, ");
	if (pc.isNude()) output("tearing your clothes away with her claws and ");
	output("pressing her dark lips to yours. Her hands run roughly over your body, groping and squeezing every inch of tender flesh they lay bare. When they find your own hands, the milodan woman grabs them fiercely, guiding them to her broad hips and plush ass. Even in her state, she wants you to be an active participant, urging you to grope and hold her in return while she slakes her rampant lusts on your yielding body.");
	output("\n\nHer overbearing sensual assault quickly leaves you scrambling backwards, trying to gain purchase on the slick metal floor. Her huge, furry breasts press against your [pc.chest] as your back hits the wall, pinning you between unrelenting metal and soft, supple titflesh.");
	output("\n\n<i>“Need to... need to... need to...”</i> the cat-woman huffs, sniffing and groping at you. One of her hands wanders between your [pc.legs], grabbing at your crotch.");
	if (pc.hasCock()) output("\n\n<i>“Ah, yes! Good!”</i> she mewls, wrapping her fluffy fingers around your [pc.cock]. <i>“Need this... so bad. Can barely think!”</i>");
	else output("\n\n<i>“What -- no breeding rod?”</i> she huffs, squeezing your crotch. <i>“Noooo I need to </i>breed<i>!”</i>");
	output("\n\nHer grip on your tightens, pushing you towards the ground; you slide down the wall, splaying your [pc.legs] while the milodan's hands grope all over your body, exploring every inch as she tears you out of your [pc.gear]. All the while you can hear the ever-present purr of her vibrator buzzing away inside her, making the science-slut pant and gasp as she works. Her nipples are rock hard, every breath pushing the jutting black mountains of pleasure into your face. You manage to wrest your hands free through her frantic stripping and grab the kitty's big titties, hard enough to make her howl in pleasure. Her fluffy tail thumps hard against your [pc.leg], silent encouragement to keep kneading her nipples until she's able to grind her dripping slit against your " + (pc.hasGenitals() ? "[pc.genitals]" : "thigh") + ".");
	if (pc.hasCock()) {
		output("\n\nThe horny cat-woman purrs hungrily, straddling your hips and pressing your puffy puss against your rock-hard cock. She thrusts herself down on you the moment you're lined up, spearing herself on your [pc.cock] with a howl of bliss that echoes throughout the base. You yourself are busy gritting your teeth as her claws rake your [pc.skinFurScales], pinning you against the wall while the kitty starts to ride you.");
		output("\n\nIt takes you a moment to realize some of the gripping, writhing pleasure encasing your cock isn't just from her needy cunt. The vibrator knotted in her ass is buzzing away so hard that you can feel it perfectly through her inner walls; the knot is right next to your " + (pc.hasKnot() ? "own knot" : "dick's base") + ", sending waves of pleasure up your shaft and back to your [pc.balls]. Fuck that feels good!");
		output("\n\nNot as good as your sexual assailant riding you full throttle, though. The vibrator's just the garnesh to top off the squeeze of her cunt and the flow of orgasmic juices as the rods inside her bring the milfy kitty to climax again. And again. And again. She's a relentless fuck-machine, pounding down on your pelvis through a dozen screeching orgasms. ");
		output("\n\nOnly after so many climaxes is she able to focus enough to form a few cogent words: <i>“C-cum for me. Please, stranger, oh please! I neeeeed it!”</i>");
		output("\n\nYou couldn't resist her if you tried; your [pc.cock] is already on the edge inside her, throbbing with a desperate need for release between the cumsoaked lips of her pussy. ");
		if (pc.hasKnot()) output(" With one last surge of energy, your body responds to an instinctual demand: you thrust your [pc.hips] forward, driving your [pc.knot] into her cunt's embrace before you join her in orgasm. ");
		output("You grit your teeth and grab the bouncing slut's plush bosom, shoving her down to the hilt on your dick before your load blows inside her, filling her hungry cunt with [pc.cumNoun].");
		output("\n\nThe milodan slut cries with pleasure as you fill her up, sating her desperate need to breed. Her body goes limp as the aftershots of your orgasm leak into her, pushing her chest into yours and resting her cheek against your [pc.face]. For whatever reason, when she slumps forward you can feel the vibrator that's been going full-blast inside her slow down, decelerating to a steady thrum. You didn't touch anything... wonder what triggered it to turn down?");
		output("\n\nEither way, you squirm around until you can hook your hands under the milodan's ass and ");
		if (pc.hasKnot()) output("roll the two of you over, putting the tuckered-out kitty on bottom while you wait for you knot to deflate. It takes a while, especially with the vibe still buzzing through her pussy walls, but eventually you manage to wriggle free. Cum pours out of her plump puss as you stand up.");
		else output("pull her off your dick, letting loose a little stream of cum from her soaked snatch as you set her down.");
		output(" You get your gear and turn to the task at hand.");
	}
	else {
		output("\n\nShe's a beast, obsessed with nothing but her own pleasure, sliding her drooling pussy against your thigh with single minded desire. Her breath comes hot and ragged against your bare [pc.skinFurScales], and her heavy breasts bouncing and rub against your [pc.chest]. A few moments of that and you start feeling a strange tingle working up your [pc.skin] where her glowing green piercings are rubbing against your flesh.");
		output("\n\nIs that <i>savicite</i>!? No wonder she's so lust-addled! You squirm, trying to distance yourself from the psionic stones, but your struggling just makes the milodan shove herself against you, trying awkwardly to hold you down and trib with you. Her grip's strong and firm, keeping you pinned right where she wants you until the lust-fueling piercings have you panting, flushed with unbidden need.");
		output("\n\n<i>“You feel it too?”</i> the kitty purrs, flicking her tongue on your neck. <i>“You need it?”</i>");
		output("\n\nYou want to resist, to push her off and tell her no... but your body is much more honest, stiffening your [pc.nipples] and making your loins ache with desire. You can't stop your hands from wandering, grabbing at the cat-woman's ass and urging her legs to press into your crotch, and with a little effort, you adjust your positions so that your legs are splayed together and each of you has your arms behind you, supporting the undulation of your hips grinding against each other.");
		output("\n\nThat's more like it! Her fur is like the softest silk against your " + (pc.hasVagina() ? "twat" : "bare groin") + ", and the slightest touch makes you shiver uncontrollably with carnal pleasure. You get more than a gentle caress, though: the milodan is eager to get back to work, shaking her hips with desperate desire the moment she can resume her lurid work. You watch has her huge, pierced tits bounce with every thrust, and feel her plush ass grinding against your [pc.leg], jiggling obscenely with the weight of her matronly curves. Her pussy's a mess of girl-cum and desire, lubricating its own lurid motions.");
		output("\n\nLittle whines of pleasure escape your assailant's muzzle, and her movements quickly become more frantic. She's so wet and loud already that it's hard to know when exactly her orgasm hits, but the growing puddle of fem-cum beneath your [pc.leg] and the ragged gasps as she slumps backwards sure give you a hint when it's over. She only stays passive for a moment, long enough to catch your breath, before she thrusts her hips up and starts moving again with the same bestial determination.");
		output("\n\nYou can barely keep up with her! The milodan is as fast as a Terran tiger when she wants to be, and she <i>definitely</i> wants to use that speed to get you off. She's cum at least once, maybe more, and now her attention seems to have focused entirely on your groin, rubbing her pussy against your " + (pc.hasVagina() ? "[pc.cunt], grinding on your [pc.clit]" : "sensitive-but-bare crotch") + ". You can only imagine that what you're feeling now is a fraction of what her savicite-laden body is enduring, an overwhelming, crushing pleasure that threatens to drown out your remaining composure in bliss despite your weakening will's best efforts. You can't help but thrust back against the needy cat-girl, eeking out more friction on your " + (pc.hasVagina() ? "[pc.clit]" : "groin") + " from her wiggling hips and juicy twat.");
		output("\n\n<i>“That's it!”</i> the kitty growls, matching your movements point for point. <i>“I knew you had it in you. Come on... come on! Cum with me!”</i>");
		output("\n\nNot like you have much choice by this point, your body's already so close to the edge. You grab the slut's foot and squeeze, the closest thing to an acknowledgement you can muster before you feel the fires of lust burning over in your loins, and your skin feels alight with ecstasy. Your scream of pleasure echoes off the sterile walls of the facility's corridors. ");
		output("\n\nWhen your body-rocking climax finally passes, you're left sliding onto your back drenched in femcum and sweat. The milodan whimpers and grabs at the vibrator still lodged in her ass, pushing it in deeper until even its massive knot has almost vanished inside her and geysers of girl-cum are squirting from her much-abused puss. Even when you manage to disentangle yourself, she just keep fucking away, rubbing her clit and pumping the vibe in her ass until you've gathered your gear and turned on your way.");
	}
	pc.orgasm();
	chars["TORRA"].orgasm();
	processTime(30);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function syriQuestAkkadiTorraVictory():void
{
	clearOutput();
	showTorra();
	author("Savin");
	
	if(CombatManager.getHostileActors()[0].HP() <= 0)
	{
		output("The over-eager milodan whines and slumps onto a knee, trying to keep coming at you but unable to maintain her footing. Finally, she collapses backwards with a pathetic whine. <i>“P-please,”</i> she moans, grabbing the base of the vibrator lodged in her ass. <i>“I'm sorry! But I need it so bad. Please!”</i>");
	}
	else
	{
		output("<i>“Whyyy,”</i> the milodan whines, falling onto her knees. <i>“You want it! I <b>need</b> it! Please, please, please fuck me! I can't stand it anymore.”</i>");
	}
	output("\n\nWhat are you going to do with this lusty kitten?\n\n");

	CombatManager.genericVictory();
	processTime(3);
	clearMenu();
	if (pc.hasCock()) addButton(0,"Pound Puss",syriQuestAkkadiTorraPoundPuss,undefined,"Pound Puss","Take this curvy catgirl to the pound.");
	else addDisabledButton(0,"Pound Puss","Pound Puss","You need a penis for this.");
	addButton(1,"Leave",syriQuestAkkadiTorraLeave,undefined,"Leave","Go away, cat.");
}

public function syriQuestAkkadiTorraPoundPuss():void
{
	clearOutput();
	showTorra(true);
	author("Savin");
	output("Now that the overly-amorous fuck-kitten has been put in her place, maybe you can see about relieving the overwhelming lust wracking her body. You stride forward, shedding your [pc.gear] as you go and cupping the lusty cat's cheeks. She whimpers, stroking her pussy with one hand and using the other to paw pleadingly at your crotch. Her fingers are drawn straight to your [pc.cock], wrapping around your stiffening member and pumping her wrist up and down your length until your [pc.cockHead] is pressing against her dark lips.");
	output("\n\n<i>“Get me ready,”</i> you command her. She needs dick too badly to even think of resisting your instructions, no matter that you're delaying her release -- the threat of getting nothing is too great. She opens wide and wraps her black lips around your crown, running her tongue around your glans and through your slit, letting you take charge of thrusting deeper into her mouth. While you're busy slamming your [pc.knot] against her nose, her hands fall away from you and slip down to her poor neglected puss. She shoves a few fingers in, stirring herself up while the other hand grips the knotted dildo in her ass and shifts it side to side, creating a staccato rhythm that quickly brings a howling climax ripping through her body. The kitty slut's pussy leaks a pool of girl-cum between her legs, and her oversized tits heave with the aftershocks of orgasm.");
	output("\n\nThe orgasm doesn't even slow her down.");
	output("\n\nShe keeps sucking, bobbing her head up and down your rod until your entire [pc.cock] is sheathed in spittle. Only then do her lips release you, letting you smear them with pre as you pull out.");
	output("\n\n<i>“You're gonna fuck me, right?”</i> she pleads, groping at her titties. <i>“I need it so bad!”</i>");
	output("\n\nOf course you are... but you don't mind stringing her along a little. You take your time stroking yourself and circling around behind the kneeling milodan, running a hand through her messy red hair before grabbing her shoulders and pushing her forward onto all fours. The naked cat gasps, but in the same breath raises her fluffy grey tail to expose her plugged ass and drooling gash.");
	output("\n\nThat's what you like to see. You slink down on your [pc.knees] and throw the kitty's tail over your shoulder, letting your [pc.cock] flop into the fluffy trench between her fat asscheeks. Your [pc.cockHead] rubs against the sex toy buried in her tailhole, feeling the rapid vibrations assaulting her insides. Damn, that thing's turned up <i>high</i>! Between that and all the savicite piercings... no wonder the cat-babe's so lust-addled. She probably can't put two thoughts together with all that ecstacy running through her.");
	output("\n\nWell, she doesn't need to think much to take a dick, does she? You rock your [pc.hips] back and push the crown of your cock into the thick, wet lips of her pussy; your member pushes the curtains of her sex apart, letting loose a trickle of pent-up femcum that lubes you up to a nice shine in the harsh office lights. Setting your hands on the kitty-slut's broodbearing hips, you thrust yourself deep inside her sodden depths. Her constantly lurid moans peak into a husky wail of orgasmic delight as your [pc.cock] sinks into her, delving the dank depths of her quivering quim until your [pc.knot] is throbbing between her pussylips. ");
	output("\n\nIt's shockingly easy to sink your dick into the milodan's twat, but she makes you fight for every inch you try and pull out of her. For such a " + (silly ? "<i>thicc</i>" : "plush") + " slut, this kitten's got a hell of a lot of muscle between her legs, and she's using every bit of pussy-power to keep you trapped inside her. The vibrator up her ass kicks into overdrive of its own accord, starting to buzz so violently that you can see it twisting around inside her -- and you can feel it, too, sending vibrations right through the walls of her pussy and into your [pc.cock]. Stars, that thing really must be driving her mad! Lest it do the same to you, you dig your fingers into the kitten's plush rump and leverage it to slowly, laboriously drag your [pc.cock] back out of her cunt's wet embrace. Her twat clenches and grips in random spasms of orgasmic pleasure, leaking lube and your own pre back out around your slowly-pistoning dick.");
	output("\n\nEven then, you can still feel the incessant vibrations in your [pc.cockHead], sending shivers down the shaft of your [pc.cock]. You have to bite your lip to keep from shuddering, gripping the kitten's hips hard until you can muster up the strength to hammer your cock back into her. The milodan slut howls, throwing her head back and cumming hard to your womb-deep thrust. Hot juices flow down your [pc.cock], and her huge tits bounce wildly as you start to properly pound her pussy, in and out despite her clenching resistance.");
	output("\n\nYou fuck her harder, harder until her voice is a non-stop wail of orgasmic bliss. Her face sinks down into the ground, pushing her ass up into your crotch and wrapping your hips in her fluffy tail. Before long her tits are getting use like big, fluffy pillows under her body, absorbing some of the shock each time your [pc.hips] pound into her thick ass. You're not sure anymore if she's actually having distinct, separate orgasms, one after the other... or if the tigress is just locked in one unending climax so long as you and the vibrator absolutely destroy her holes.");
	output("\n\nThere's no point in trying to hold back -- you've all but shattered this slut's oversexed senses already. You let your own pleasure rise as it will, milked out by her squeezing cunt and the vibrations echoing through her from the toy firmly wedged inside her. When you feel [pc.cum] rising in your loins, burning its way towards the cat-woman womb, you're almost relieved to feel it coming. With a feral grunt, you hilt yourself in the sodden pussy and let loose, pumping a fat wad of [pc.cum] right into her deepest depths. The milodan squeals in delight, clawing at the ground and battering you with her tail until you've blown the entirety of your load into her spasming quim.");
	output("\n\nWhen you've finished filling her cunt with your [pc.cum], you start to notice something feels... different. A quick press against the vibe in her ass tells you what's up: whatever has been controlling the toy seems satisfied now that she's gotten a load right inside. The vibrator's turned itself down to a pleasant rumble, just enough to keep the woman moaning softly as she basks in the afterglow.");
	output("\n\nYou slowly pull out, letting a waterfall of fem-spunk and [pc.cum] spill out onto her thighs, and go to find your gear...");
	pc.orgasm();
	chars["TORRA"].orgasm();
	processTime(30);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function syriQuestAkkadiTorraLeave():void
{
	clearOutput();
	showTorra();
	author("Savin");
	output("You put your hand on the milodan's face and push her back. She yelps and flops onto her ass, legs splayed around the buzzing dildo lodged inside her. You ignore her, and she's powerless to do anything about it but sit there and masturbate.");
	output("\n\nTime to find Valden.");
	processTime(3);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Enemy functions (most are placeholder!!!)
public function syriQuestAkkadiBaseSecurityRobotsTrigger():Boolean
{
	IncrementFlag("SYRIQUEST_AKKADI_BASE_STEPS");

	var encChance:int = 5;
	if (flags["SYRIQUEST_AKKADI_BASE_STEPS"] > 3 && rand(100) < (flags["SYRIQUEST_AKKADI_BASE_STEPS"] * (flags["CHIEF_NEYKKAR_WITH_PC"] == 2 ? 20 : 5)))
	{
		flags["SYRIQUEST_AKKADI_BASE_STEPS"] = 0;

		syriQuestAkkadiBaseSecurityRobotsEncounter();
		return true;
	}
	return false;
}

public function syriQuestAkkadiBaseSecurityRobotsEncounter():void
{
	clearOutput();
	showAkkadiSecBots();
	author("Savin");
	output("As you're running down the sterile corridor, you suddenly hear a shuddering <i>creeeak</i> of metal grinding on metal. You spin around, watching panels slide open on the walls behind you. From hidden alcoves, several quadrupedal security robots -- each not much bigger than a trash can, and plated with shiny Akkadi-blue armor -- stomp out. They've got angled blast shields in place of faces, and between the plates, each robot has the all-too-familiar shape of a gun barrel peeking out, scanning around for targets.");
	output("\n\nAnd they settle on you!");
	output("\n\n<i>“INTRUDER! CEASE RESISTANCE, DISARM, AND LAY FLAT ON THE GROUND.”</i>");
	
	var numEnemies:int = 3+rand(3);
	var hostiles:Array = [];
	for (var i:int = 0; i < numEnemies; i++)
	{
		hostiles.push(new AkkadiSecurityRobots());
	}
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(hostiles);
	CombatManager.displayLocation("SECURITY ROBOTS");
	CombatManager.victoryScene(syriQuestAkkadiBaseSecurityRobotsVictory);
	CombatManager.lossScene(syriQuestAkkadiBaseSecurityRobotsDefeat);
	CombatManager.encounterTextGenerator(syriQuestAkkadiBaseSecurityRobotsFightText);

	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function syriQuestAkkadiBaseSecurityRobotsFightText():void
{
	clearOutput();
	showAkkadiSecBots();
	author("Savin");
	output("You're fighting Akkadi security bots!");
	output("\n\nEach bot is a mechanical biped, more lizard-like than canid, with a squat body covered in sleek armor plates. Rather than a head, they have angled blast shields that face you, parted around the barrel of a gun and a laser sight that ceaselessly tracks your movements. There's {still one/two standing // still several robots in the fray}!");
}

public function syriQuestAkkadiBaseSecurityRobotsDefeat():void
{
//-1000 Credits; -1000 more per guard bot defeated
	clearOutput();
	showAkkadiSecBots();
	author("Savin");
	output("One of the robots growls, stomping over and delivering a solid kick to your stomach, planting you directly in the ground. <i>“Intruder neutralized!”</i> it barks, stomping on your chest to pin you on the ground.");
	output("\n\nA moment passes.");
	output("\n\nThen another.");
	output("\n\nYou groan and squirm under the robot, but it's... not moving. At all. Slowly, warily, you push the robotic guard-dog's leg off your chest. It doesn't fight back until you're completely out from under it, whereupon the robot beeps noisily and looks up at you.");
	output("\n\n<i>“SECURITY PERSONNEL ARE PREOCCUPIED. WE WILL LET YOU OFF WITH A FINE THIS TIME.”</i>");
	output("\n\nUh, okay. The guard-bot's gun is still tracking you, and you really don't want to get shot by more beanbags... so when a little screen pops out of its flank, you just swipe your Codex and be done with it. {PC has 0 money: The fact that you're broke doesn't seem to bother the guard bot. It just beeps at you and then takes its pack and retreats into the side panels from whence it came //else: The robot siphons off some credits and beeps approvingly before leading its pack back into the wall alcoves and disappearing.}");
	//PC is on 1st floor: Wonder what happened to the security staff...");
	CombatManager.genericLoss();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function syriQuestAkkadiBaseSecurityRobotsVictory():void
{
	clearOutput();
	showAkkadiSecBots();
	author("Savin");
	output("The last of the robots collapses, and as the din of weapon fire fades, you're left once more with an eerie silence. There's... nothing. Nobody's rushing out to see what's happening. No screams. No jackbooted security guards charging you. The lockdown's keeping everyone, even the people in charge, sealed out of your way.");
	output("\n\nGlancing around warily, you put your [pc.weapon] away and turn back to the hall ahead. Better get a move on.");
	CombatManager.genericVictory();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}