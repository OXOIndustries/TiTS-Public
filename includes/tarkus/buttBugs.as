// Butt Bugs: A Tarkus Parasite
// Created By: Preacher
// Proofread By: In large part Kirbu, Tori Toritori and RanmaChan, don’t know how much Thaumx, Vento and some anons.
/*
Summary of parasite: 
Male and female variants, males are quite phallic and look like dildos with six legs attached to a bulbous base and females look like butt plugs with anuses on both ends with incredibly soft tiny legs on their underside. The female is the actual parasite, variant type doesn’t appear until after victory/loss to save up on coding several enemies. Parasite is technically hidden, which means it won’t affect other scenes in the slightest unless someone specifically wrote a scene with them in mind. You’ll also only see mention of them or notice them if one of their scenes are activated or if you look in character description. While fighting and in the codex it is shown and referenced as a sand worm; but in most other aspects it is referenced as a ‘butt bug.’ Having the female increases minimum lust by 15; getting butt fucked by a male while parasitized causes butt bug pregnancy. Pregnancy durations depend on the variant of the female, but in the case of the normal one it is a week of gestation inside you before they are anally lain. The female undergoes an infertile laying sequence when you get the anally filled status by someone or something that is not a butt bug male, and skips straight to the laying of the eggs outside you.
*/

public function showSandworm():void
{
	if (enemy != null && enemy is SandWorm)
	{
		showBust(enemy.bustDisplay);
	}
	else
	{
		showBust("SANDWORM");
	}
	showName("\nSAND WORM");
}
public function showButtBug(variant:int = 0):void
{
	showBust(buttBugBustDisplay(variant));
	showName("\nBUTT BUG");
}
public function buttBugBustDisplay(variant:int = 0):String
{
	var sBust:String = "BUTTBUG";
	
	switch(variant) 
	{
		// Male
		case -1: sBust += "_M"; break;
		// Females
		case 0: sBust += "_F_0"; break;
		case 1: sBust += "_F_1"; break;
		case 2: sBust += "_F_2"; break;
	}
	
	return sBust;
}
public function getButtBugPregContainer(variant:int = 0):PregnancyPlaceholder
{
	var ppButtBug:PregnancyPlaceholder = new PregnancyPlaceholder();
	var maxMilk:Number = 1000;
	var maxCum:Number = 1000;
	var maxGirlCum:Number = 1000;
	
	if(!ppButtBug.hasCock()) ppButtBug.createCock();
	ppButtBug.shiftCock(0, GLOBAL.TYPE_SANDWORM_PARASITE);
	
	switch(variant) 
	{
		// Male
		case -1:
			ppButtBug.cocks[0].cockColor = "yellow";
			ppButtBug.cocks[0].cLengthRaw = 10;
			ppButtBug.cocks[0].cThicknessRatioRaw = 1;
			ppButtBug.cocks[0].knotMultiplier = 1;
			ppButtBug.cocks[0].addFlag(GLOBAL.FLAG_SMOOTH);
			ppButtBug.cocks[0].addFlag(GLOBAL.FLAG_PREHENSILE);
			maxMilk = 0;
			maxCum = 5000;
			maxGirlCum = 0;
			ppButtBug.impregnationType = "ButtBugPregnancy";
			break;
		// Females
		case 0:
			ppButtBug.cocks[0].cockColor = "beige";
			ppButtBug.cocks[0].cLengthRaw = 6 + rand(3);
			ppButtBug.cocks[0].cThicknessRatioRaw = 1;
			ppButtBug.cocks[0].knotMultiplier = 1;
			ppButtBug.cocks[0].addFlag(GLOBAL.FLAG_PREHENSILE);
			ppButtBug.cocks[0].addFlag(GLOBAL.FLAG_OVIPOSITOR);
			if(!ppButtBug.hasVagina()) ppButtBug.createVagina();
			ppButtBug.shiftVagina(0, GLOBAL.TYPE_SANDWORM_PARASITE);
			ppButtBug.vaginas[0].addFlag(GLOBAL.FLAG_PREHENSILE);
			ppButtBug.vaginas[0].addFlag(GLOBAL.FLAG_SMOOTH);
			maxMilk = 0;
			maxCum = 0;
			maxGirlCum = 3000;
			break;
		case 1:
			ppButtBug.cocks[0].cockColor = "green";
			ppButtBug.cocks[0].cLengthRaw = 8 + rand(3);
			ppButtBug.cocks[0].cThicknessRatioRaw = 1;
			ppButtBug.cocks[0].knotMultiplier = 1;
			ppButtBug.cocks[0].addFlag(GLOBAL.FLAG_PREHENSILE);
			ppButtBug.cocks[0].addFlag(GLOBAL.FLAG_OVIPOSITOR);
			if(!ppButtBug.hasVagina()) ppButtBug.createVagina();
			ppButtBug.shiftVagina(0, GLOBAL.TYPE_SANDWORM_PARASITE);
			ppButtBug.vaginas[0].addFlag(GLOBAL.FLAG_PREHENSILE);
			ppButtBug.vaginas[0].addFlag(GLOBAL.FLAG_NUBBY);
			maxMilk = 0;
			maxCum = 0;
			maxGirlCum = 5000;
			break;
		case 2:
			ppButtBug.cocks[0].cockColor = "orange";
			ppButtBug.cocks[0].cLengthRaw = 12 + rand(3);
			ppButtBug.cocks[0].cThicknessRatioRaw = 1;
			ppButtBug.cocks[0].knotMultiplier = 1;
			ppButtBug.cocks[0].addFlag(GLOBAL.FLAG_PREHENSILE);
			ppButtBug.cocks[0].addFlag(GLOBAL.FLAG_OVIPOSITOR);
			if(!ppButtBug.hasVagina()) ppButtBug.createVagina();
			ppButtBug.shiftVagina(0, GLOBAL.TYPE_SANDWORM_PARASITE);
			ppButtBug.vaginas[0].addFlag(GLOBAL.FLAG_PREHENSILE);
			ppButtBug.vaginas[0].addFlag(GLOBAL.FLAG_SMOOTH);
			maxMilk = 0;
			maxCum = 0;
			maxGirlCum = 7000;
			break;
	}
	ppButtBug.createPerk("Fixed MilkQ", maxMilk, 0, 0, 0);
	ppButtBug.createPerk("Fixed CumQ", maxCum, 0, 0, 0);
	ppButtBug.createPerk("Fixed GirlCumQ", maxGirlCum, 0, 0, 0);
	
	return ppButtBug;
}

public function attachButtBugFemale(variant:int = -1):void
{
	// Status Effect: "Butt Bug (Female)"
	// v1: occupied female variant
	// v2: fertilization toggle
	// v3: 
	// v4: number of offspring produced
	pc.createStatusEffect("Butt Bug (Female)", -1, 0, 0, 0, true, "Icon_Donut", "Currently infected by a female butt bug.", false, 0);
	pc.setStatusValue("Butt Bug (Female)", 1, variant);
	pc.setStatusValue("Butt Bug (Female)", 2, 0);
	pc.setStatusValue("Butt Bug (Female)", 3, 0);
	pc.setStatusValue("Butt Bug (Female)", 4, 0);
	
	// Add and activate egg cycle for overproductive type
	// Status Effect: "Butt Bug Egg Cycle"
	// v1: 1 on, 0 off
	// v2: total time under cycle before new eggs
	if(variant == 1) pc.createStatusEffect("Butt Bug Egg Cycle", 1, 0, 0, 0, true, "Icon_Haste", "Weekly egg cycle.", false, (7 * 24 * 60));
	else pc.removeStatusEffect("Butt Bug Egg Cycle");
	
	// Delay messages
	pc.createStatusEffect("Butt Bug Message Cooldown", 0, 0, 0, 0, true, "", "", false);
	pc.setStatusMinutes("Butt Bug Message Cooldown", 1440);
}
public function resetButtBugEggCycle():void
{
	pc.setStatusValue("Butt Bug Egg Cycle", 1, 0);
	pc.setStatusValue("Butt Bug Egg Cycle", 2, 0);
	pc.setStatusMinutes("Butt Bug Egg Cycle", (7 * 24 * 60));
}

// Toggle butt bugs on/off
public function encounterSandWormOptions(btnSlot:int = 0):void
{
	output("\n\nThere is an electronic bulletin message with the words “Sand Worms” scrawled acrossed it. You can attempt to give it a read if you desire.");
	
	addButton(btnSlot, "Sand Worms", encounterSandWormOptionSet, -1, "Sand Worms Note", "Read the bulletin.");
}
public function encounterSandWormOptionSet(option:int = -1):void
{
	clearOutput();
	showBust("");
	showName("\nSAND WORMS");
	author("Jacques00");
	clearMenu();
	
	switch(option)
	{
		case -1:
			output("You look closer at the holo-bulletin and its letters come into view, clear enough for your codex to translate the language. After the message is deciphered, it reads:");
			output("\n\n<i><b>Note:</b> Chance of encountering “sand worms” in the wild may be significant. These creatures house parasitic bugs that can latch onto the body via the anal cavity. Once infected, the victim may be subject to various involuntary, rectum-related events. Such events may not be palatable. Take caution and be careful!</i>");
			
			CodexManager.unlockEntry("Sand Worms");
			
			output("\n\nHow do you feel about the potenitally parasitic sand worms?");
			
			output("\n\n(Sand worm encounters are currently set to: <b>");
			switch(flags["ENABLE_SANDWORM"])
			{
				case undefined: output("Away"); break;
				case 1: output("Active, Uncommon"); break;
				case 2: output("Active, Common"); break;
			}
			output("</b>)");
			output("\n\n");
			
			if(flags["ENABLE_SANDWORM"] == undefined) addDisabledButton(0, "Ew");
			else addButton(0, "Ew", encounterSandWormOptionSet, 0, "Nah.", "Nope. You want to avoid these parasites at all costs.");
			if(flags["ENABLE_SANDWORM"] == 1) addDisabledButton(1, "Okay");
			else addButton(1, "Okay", encounterSandWormOptionSet, 1, "Okay...", "You would be okay with running into these parasites.");
			if(flags["ENABLE_SANDWORM"] == 2) addDisabledButton(2, "FUCK YES");
			else addButton(2, "FUCK YES", encounterSandWormOptionSet, 2, "Oh Yeah!", "You would love to encounter any of these parasites in the wild.");
			
			addButton(14, "Back", mainGameMenu);
			break;
		case 0:
			output("You think and over and decide that having these parasitic bugs find a way to crawl up your butt as very displeasing, if not disgusting. Hopefully they will be asleep underground whenever you are exploring the wastes.");
			output("\n\n(<b>Butt bug content has been disabled!</b>)");
			output("\n\n");
			
			flags["ENABLE_SANDWORM"] = undefined;
			
			addButton(0, "Next", mainGameMenu);
			break;
		case 1:
			output("You decide that encountering these parasitic bugs would not be such a big deal, but you do realize that being caught by one may have consequences outside of your control. Hopefully finding them in the wastes will be a rare occurance.");
			output("\n\n(<b>Butt bug content has been enabled with natural frequency!</b>)");
			output("\n\n");
			
			flags["ENABLE_SANDWORM"] = 1;
			
			addButton(0, "Next", mainGameMenu);
			break;
		case 2:
			output("Butt bugs? Well why not?! You are giddy about the probability of running into such a rare parasitic creature and welcome having it crawl up your [pc.asshole], forcing you to do lewd and nasty things. Hopefully you will find them often while traversing the wastes.");
			output("\n\n(<b>Butt bug content has been enabled with unnatural frequency!</b>)");
			output("\n\n");
			
			flags["ENABLE_SANDWORM"] = 2;
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

public function encounterSandWormChance():Boolean
{
	if(flags["ENABLE_SANDWORM"] == undefined) return false;
	if(flags["ENABLE_SANDWORM"] == 1 && rand(3) != 0) return true;
	return true;
}
public function encounterSandWorm():void
{
	author("Preacher");
	
	output("\n\nThe only sounds as you traverse the wastes of Tarkus are those of the wind howling across the dunes, and the soft crunching of sand under your [pc.feet]. The relative silence is broken when you hear an unfamiliar shifting in the sand. You look around quickly, and confirm that there is nobody following you. You’re about to chalk the sound you heard up to paranoia, until you notice a slight bulge forming in the sand. Something is digging around underground, and it is heading towards you!");
	output("\n\nYour codex beeps with a notification of hostile life in the area.");
	if(flags["ENCOUNTERED_SANDWORM"] == undefined) output(" <i>“Sand worm detected, a hostile burrowing organism, parasitic in nature. Capable of using chemicals in its saliva to arouse and paralyze targets before implanting itself into their rectum. Medical staff or advanced medications are necessary for removal.”</i> Readying yourself for this new enemy, you hope it won’t be too much trouble.");
	else output(" You recognize this activity as belonging to members of the sand worm species you’ve fought earlier. Hopefully you can end this battle without gaining a new passenger.");
	
	CodexManager.unlockEntry("Sand Worms");
	
	IncrementFlag("ENCOUNTERED_SANDWORM");
	
	var allies:Array = [chars["PC"]];
	var hostiles:Array = [new SandWorm()];
	
	hostiles[0].changePosition(0);
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(allies);
	CombatManager.setHostileActors(hostiles);
	CombatManager.victoryScene(combatSandWormVictory);
	CombatManager.lossScene(combatSandWormDefeat);
	CombatManager.displayLocation("SAND WORM");
	
	showSandworm();
	
	clearMenu();
	addButton(0, "Next", CombatManager.beginCombat);
}

public function attackSandworm(target:Creature, attacker:Creature, special:String = ""):Boolean
{
	if(target.hasStatusEffect("Burrowed")) return false;
	
	var passAttack:Boolean = false;
	var damage:TypeCollection = new TypeCollection();
	switch(special)
	{
		case "melee": damage = attacker.meleeDamage(); break;
		case "ranged": damage = attacker.rangedDamage(); break;
	}
	var missed:Boolean = (((1 + rand(100)) > Math.round((attacker.AQ() * 0.5) + (attacker.RQ() * 0.5))) && damage.hasHPDamage());
	var plural:Boolean = ((attacker is PlayerCharacter) || attacker.isPlural);
	
	switch(special)
	{
		case "melee":
			output(StringUtil.capitalize(attacker.getCombatName(), false) + " " + attacker.meleeWeapon.attackVerb + " at the worm’s soft-looking front end with " + attacker.getCombatPronoun("hisher") + " " + attacker.meleeWeapon.longName + " to see if " + attacker.getCombatPronoun("heshe") + " can end this battle quickly.");
			// aboveGroundMeleeDodge
			if(missed) {
				output(" Sensing " + attacker.getCombatPronoun("hisher") + " attack somehow, the worm swiftly re-buries itself, leaving " + attacker.getCombatPronoun("himher") + " with nothing but a half-buried weapon and a face full of dirt. The worm pops up again a short distance away while doing a little jiggle, almost as if it is mocking " + attacker.getCombatPronoun("himher") + ". Slightly irritated, " + attacker.getCombatPronoun("heshe") + " remove" + (plural ? "" : "s") + " " + attacker.getCombatPronoun("hisher") + " " + attacker.meleeWeapon.longName + " from the sandy earth and read" + (plural ? "y" : "ies") + " " + ((attacker is PlayerCharacter) ? "your" : attacker.getCombatPronoun("himher")) + "self again.");
				
				passAttack = true;
			}
			// aboveGroundMeleeHit
			else {
				output(" Through either blind luck or immense skill, " + attacker.getCombatPronoun("hisher") + " attack connects with a satisfying splattering of green flesh. Strange liquids and chitin shards go flying in the direction of " + attacker.getCombatPronoun("hisher") + " " + attacker.meleeWeapon.attackNoun + "! The worm has stopped moving now, with most of its body heavily damaged.");
				
				target.HPRaw = 0;
				
				passAttack = true;
			}
			break;
		case "ranged":
			output(StringUtil.capitalize(attacker.getCombatName(), false) + " " + attacker.rangedWeapon.attackVerb + " at the worm’s soft-looking front end with " + attacker.getCombatPronoun("hisher") + " " + attacker.rangedWeapon.longName + " to see if " + attacker.getCombatPronoun("heshe") + " can end this battle quickly.");
			// aboveGroundRangedDodge
			if(missed) {
				output(" Bad luck strikes " + attacker.getCombatPronoun("himher") + " as the worm twists itself away in a random direction, causing " + attacker.getCombatPronoun("hisher") + " " + attacker.rangedWeapon.attackNoun + " to land behind it.");
				
				passAttack = true;
			}
			// aboveGroundRangedHit
			else {
				output(" Through either blind luck or immense skill, " + attacker.getCombatPronoun("hisher") + " attack connects with a satisfying splattering of green flesh. Strange liquids and chitin shards spray out the other side of the worm! " + StringUtil.capitalize(attacker.getCombatPronoun("heshe")) + " seem" + (plural ? "" : "s") + " to have stopped it, what with the gaping hole through most of its body.");
				
				target.HPRaw = 0;
				
				passAttack = true;
			}
			break;
		default:
			// specialAttackFailure
			if(missed) {
				output(possessive(StringUtil.capitalize(attacker.getCombatName(), false)) + " most recent attack seems to have had no effect whatsoever as <b>the worm ducks, dodges, and re-burrows itself.</b> Maybe " + attacker.getCombatPronoun("heshe") + " need to try a more direct approach?");
				
				(target as SandWorm).changePosition(0);
				
				passAttack = true;
			}
			break;
	}
	return passAttack;
}

// After battle:
// random variable 0 or 1 assigned to variable integer swGender (stands for sand worm gender), 0 a female and 1 a male.
// if swGender = 0: assign random number 0 – 2 to variable integer swfVariant (Stands for sand worm female variant)0 being a normal female, 1 being an over productive female, 2 being a large female.

// Victory
public function combatSandWormVictory():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	
	showSandworm();
	author("Preacher");
	
	var swfVariant:int = -1;
	if(!pc.hasAnalPregnancy() && rand(3) != 0)
	{
		if(rand(5) == 0) swfVariant = 2;
		else if(rand(3) == 0) swfVariant = 1;
		else swfVariant = 0;
	}
	
	output("Although the freshly defeated worm sticks halfway out of the ground, it would seem that it is not dead yet. The frontal opening sputters out fresh goo, while what’s left of the body twitches and pulsates as if trying to deposit something. Sure enough, a much more solid object slides through the opening like some sort of strange birthing hole. It flops onto the slimy green sand, giving you time to clearly make out its " + (swfVariant >= 0 ? "oddly segmented, butt plug-shaped form" : "strangely phallic form, attached to a bulbous base with six spindly legs") + ".");
	if(swfVariant >= 0)
	{
		output("\n\nLittle nub-like legs you didn’t notice until now wiggle a little in the air as it tries to right itself. During the process it spins several times in a full circle, rather amusingly in fact. You notice that on both ends of its body it has what looks like anal rings that ooze a transparent green liquid. It eventually finds a way back on it’s feet and tries to crawl away from you. However it moves very slowly. Now that you can see its form more clearly, you can see that");
		switch(swfVariant) {
			case 0: output(" it has a bland brownish sandy color to it with almost no variable textures across its body"); break;
			case 1: output(" its skin is as green as the worm it crawled out of, and is covered in bumps of a lighter green color"); break;
			case 2: output(" it is almost double the size that you first estimated it to be. The entire underside of the creature, as well as a singular stripe along its back, is a bright orange"); break;
		}
		output(". Your codex goes off again: <i>“Target organism identified as a female.”</i>");
	}
	else
	{
		output("\n\nSooner than you expected it to, its legs twitch, and in a rather comical way it flips onto its six legs as its phallic top jiggles around uncontrollably. Kind of like a floppy dildo with legs. Noticing that it has been spotted, the walking phallus skitters away from you in a slow, rather drunken-looking, attempt at an escape. Your codex goes off again: <i>“Target organism identified as a male.”</i>");
	}
	if(enemy.hasItemByClass(Kirkite)) output("\n\nOh, look! There seems to be an object glittering in the flesh of the worm. You remember some dissection skills that you haven’t used since your high school science class and extract a crystalline object. The color is hard to make out since it is still covered in green goop, so you wipe it off. No matter how much you wipe, the green doesn’t fade and pretty soon the crystal is as dry as a bone. Huh, it would seem it is an emerald-looking gem. A quick scan of your codex says it’s a kirkite crystal. Sweet!");
	
	processTime(2);
	
	var tEventCall:Function = (function(c_swfVariant:int):Function
	{
		return function():void
		{
			clearOutput();
			showButtBug(c_swfVariant);
			author("Preacher");
			clearMenu();
			if(pc.lust() < 33)
			{
				output("Not seeing a reason for any further interaction with the creature, you decide to let it scurry away.");
				output("\n\n");
				
				addButton(0, "Next", mainGameMenu);
			}
			else
			{
				output("Seeing the overly suggestive body shape of the little critter has reminded you of some of your more pressing needs. You’ll salvage what you can from the fight later, right now there may be a way to sate your lust with the little insect.");
				output("\n\n");
				
				//Gives male or female menus depending on swGender.
				if(c_swfVariant >= 0)
				{
					if(pc.hasCock() && !pc.isTaur()) addButton(0, "Bionahole", sexButtBugBionahole, c_swfVariant, "Bionahole", "Use the female as a temporary bionahole.");
					else addDisabledButton(0, "Bionahole", "Bionahole", "Use the female as a temporary bionahole. You must have at least one dick and not be tauric.");
					if(flags["BUTTBUG_SEX_OFFERBUTT"] != undefined || CodexManager.entryViewed("Sand Worms")) addButton(1, "OfferButt", sexButtBugOfferButt, c_swfVariant, "Offer Butt", "Willingly let the female enter your butt. There might be a fight if you already have one inside you, or some other occupant.");
					else addDisabledButton(1, "OfferButt", "Offer Butt", "You do not know much about the bug to try this.");
				}
				else
				{
					addButton(0, "Use", sexButtBugUse, undefined, "Use", "Use him to sate your anal desires.");
				}
				addButton(14, "Leave", combatSandWormVictoryLeave, c_swfVariant);
			}
		}
	})(swfVariant);
	eventQueue.push(tEventCall);
	
	output("\n\n");
	CombatManager.genericVictory();
}
public function combatSandWormVictoryLeave(variant:int = 0):void
{
	clearOutput();
	showButtBug(variant);
	author("Preacher");
	
	output("Deciding against doing anything with it for now, you let the " + (variant >= 0 ? "female" : "male") + " be.");
	output("\n\n");
	
	processTime(1);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function sexButtBugBionahole(swfVariant:int = 0):void
{
	clearOutput();
	showButtBug(swfVariant);
	author("Preacher");
	
	var cIdx:int = rand(pc.cocks.length);
	var vIdx:int = (pc.hasVagina() ? rand(pc.vaginas.length) : -1);
	
	output("Finding it impossible to ignore your raging hardon any longer, you come up with the perfect idea to alleviate some pressure while staying well within what you estimate would be a safe zone regarding the butt parasites.");
	output("\n\nYou walk over to the female parasite, past the shell of the worm once controlled by the creature. As she tries to wiggle away, you");
	if(pc.isNice()) output(" gently pick it up as you");
	else if(pc.isMischievous()) output(" grip it with a single hand and lift it up to tickle the insect on her underside while you");
	else output(" forcefully yank it off the ground with enough strength that one might think that you’re hurting her. As the dust settles you");
	output(" try your best to remove your [pc.gear] with one hand. She squeals in your grasp and tries to wriggle away. Some tendril-like structures slimily slide out from one of the parasite’s orifices and try to pry your hand away from it’s body, but your grip is too strong for her.");
	output("\n\nNow ready to carry out your plan, you swiftly drop your [pc.ass] on the sandy earth with the bug still in your hand.");
	if(silly) output(" Some sand gets in your crack but that’s okay.");
	output(" You align her with [pc.oneCock] an inch or two above the head, just to build some suspense for yourself. It pays off as the female bug’s oozing juices flow down to cover your [pc.cock " + cIdx + "] with just enough fluids to allow the soft breeze of the wastes to give your dick a slight chill. The tendrils wriggle around in the air above your cock" + (pc.cocks.length == 1 ? "" : "s") + ", before they reach down towards your [pc.cocks].");
	output("\n\nMost of them twirl all around it: either it is trying to figure out what your cock is, or dicks might be a familiar form to them. You position your cock-head directly at the entrance of its orifice with the tiny tentacles still twirling around your shaft. In one squelching movement you push your [pc.cock " + cIdx + "] into the surprisingly welcoming embrace of the bug’s asshole. The inside of her is soft, wet, and delightfully warm. Soon her instincts take over and she adjusts herself to perfectly fit your member. You start pumping her up and down your [pc.cock " + cIdx + "], which fills the air with lewd squelches.");
	
	pc.cockChange();
	
	output("\n\n");
	if(pc.cLength(cIdx) <= 12) output("Her insides wetly massage your [pc.cock " + cIdx + "] like the hands of a well-trained masseuse. Every time you fully sheath yourself into her, muscled undulations roll across your member in an instinctually controlled fashion. Somehow she seems to know what areas will coax the most pre-cum out of you, and pays special attention to them. Her tendrils still wring your cock inside of her as the slime make them slip about with each movement.");
	else output("Though she handles your girth without hassle, she seems to be struggling with your length. Some of your cock pokes out the other end with each pump even as she tries her best to pleasure the part of your [pc.cock " + cIdx + "] that is still inside her. While you go through the unique pleasure of penetrating two assholes at once, her tendrils catch your attention as you see them coil around your head and feel them slip around your shaft.");
	output("\n\n");
	switch(swfVariant)
	{
		case 0:
			output("Though she is part of the most mundane subspecies of sand worms currently known, she still manages to impress you. The worm-like parasite twists and turns this way and that with each pump, despite being locked in your grip. These movements provide new sensations and textile friction to keep inching you on as you continually grind into new territories of stimulation. With every third pump or so she squeezes her entire form around your [pc.cock " + cIdx + "], locking in blood for that moment, spiking your sensitivity.");
			break;
		case 1:
			output("You expected this to be a little weird, just due to the texture your hands are feeling on the female bug’s nubby skin alone, but inside the creature you are unsure of what is happening. Smooth and pliable orb-like structures that line her insides provide odd yet pleasurable sensations for your [pc.cock " + cIdx + "]. Each time one of the orbs is bumped, she quivers, vibrates, and squirts out even more lubrication to add to the already slick, slimy slip and slide of her insides.");
			break;
		case 2:
			output("A bit unwieldy by average bionahole standards, this large orange-colored female eventually forces you to switch to using both hands, maximizing your pleasure for the effort. Her large anal opening kisses sloppily at your groin, leaving sticky green strands of fluid. She vainly attempts to keep you fully inside for as long as possible, before you inevitably make her rise up again. This seems to prove that she just might be experiencing pleasure from your cock. The parasite sucks at your [pc.cockHead " + cIdx + "] like a lollipop each time your [pc.cock " + cIdx + "] nearly exits her while she tries to keep you there. Not that she needs to, as you have every intention of using her until you’re finished.");
			break;
	}
	output("\n\nEnjoying yourself now, you change your technique after every dozen thrusts or so, trying to last a little bit longer. You shift from short quick bursts to long drawn out thrusts of your cock, and enjoy the ever increasing heights of penetrative pleasures. The worm-like cocksleeve seems to enjoy this too and stops using her tentacles in an attempt to stop you from cumming too quickly. Unfortunately for her though, she just feels too good.");
	output("\n\nEveryone has their limits, and you are fast approaching yours. You pump your [pc.cock " + cIdx + "] faster and faster with your improvised living bionahole. The familiar sensation in your [pc.balls] rears its head");
	if(vIdx >= 0) output(" while your [pc.vagina " + vIdx + "] anticipates the upcoming release and clenches as it tries to squeeze around a cock that isn’t there");
	output(". Your orgasm crashes upon you as you thrust your [pc.hips] and smack your groin against the bug’s flesh. The pumping motions of your hands quicken in the throes of your intense release as your [pc.cum]");
	if(vIdx >= 0) output(" and [pc.girlcum] ");
	output(" " + (vIdx < 0 ? "is" : "are") + " gloriously sprayed onto the sandy earth in front of you. Your fluids moisten the ground for a little while before they quickly seep into the sand and dry out like they were never there in the first place. Utterly spent and out of breath, you finally let go of the insect. As you slowly stand up to retrieve your [pc.gear] she slides off your cock rather unceremoniously and flops back onto her little feet. She wiggles away to hide somewhere and recover, but some of your [pc.cum] forms a streak of musky [pc.cumColor] as it leaks out of her, leaving a trail as a telltale sign of what you did with her.");
	output("\n\n");
	
	processTime(29);
	IncrementFlag("BUTTBUG_SEX_BIONAHOLE");
	
	pc.orgasm();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function sexButtBugOfferButt(swfVariant:int = 0):void
{
	clearOutput();
	showButtBug(swfVariant);
	author("Preacher");
	
	// sets boolean "hasFemaleInside" to true after scene and sets integer variable "BBFInside" to same number as swfVariant to set what variant of female is inside you. Need to have read the codex entry on them or have a history with them in your butt in order for this button to appear and your Steele to even think about doing this.
	// set integer "defendingFemale" to "BBFInside" and integer "invadingFemale" to "swfVariant"
	// set boolean "invasionSuccess" to true if invading female wins game, false if invading female loses.
	// create boolean "parasiteSuccess". Not used in female variant game, used to determine if a large parasite(or some other weird type that might be added later on) can actually go inside you or not.
	// create boolean firstTimeBB
	
	var newBug:int = swfVariant;
	var oldBug:int = (pc.hasStatusEffect("Butt Bug (Female)") ? pc.statusEffectv1("Butt Bug (Female)") : -1);
	
	// parasite success
	var success:Boolean = false;
	// no bug
	if(newBug >= 0 && oldBug < 0) success = true;
	// matching bug
	if(newBug == oldBug) success = true;
	// capacity check
	if(newBug == 2) success = (pc.analCapacity() > 60 ? true : false);
	
	var cIdx:int = (pc.hasCock() ? rand(pc.cocks.length) : -1);
	var vIdx:int = (pc.hasVagina() ? rand(pc.vaginas.length) : -1);
	
	var ppButtBug:PregnancyPlaceholder = getButtBugPregContainer(newBug);
	
	output("You know full well what the function of the females in this species are. Fantasies about how it would feel to have one of them inside your ass pop into your head while your [pc.asshole] clenches in anticipation of what’s to come. As you move over to the critter whilst dropping your [pc.gear] along the way, you rile yourself up even more. Your imagination gets the better of you as");
	if(vIdx >= 0) output(" your [pc.vaginas] moisten" + (pc.vaginas.length == 1 ? "s" : "") + " while");
	if(cIdx >= 0) output(" your [pc.cocks] harden" + (pc.cocks.length == 1 ? "s" : "") + " and");
	output(" your body flushes with desire at the prospect of having this creature in your ass.");
	if(oldBug >= 0) output(" The bug you already have inside of you has picked up the new female’s scent, and is starting to protest your actions by wiggling this way and that. She’ll have to fight for her right to your ass if she wants to stay.");
	else output(" In fact, as you think about it, your ass feels increasingly empty, and the desire to fill that void in your backside grows almost unbearable. This bug will do quite nicely for the time being, maybe even permanently.");
	output("\n\nYou pick up the insect and inspect it. It is oddly similar to a double-ended butt plug. As you handle her, it becomes quite clear that she is very uncomfortable in your hands. Luckily for her, her circumstances are soon going to change. She tries to wiggle out of your hands, even deploying some of her slippery tendrils from one of her holes to try and pry open your mitts, but she can’t break free from your grasp. You lower yourself to your [pc.knees] and make yourself comfortable as you lean backwards slightly. Your [pc.eyes] rove over the parasite hungrily now as you ache with anticipation and lust, wondering how it will feel inside of you.");
	output("\n\n");
	if(pc.ass.wetness() <= 1) output("For the upcoming anal escapades, preparation will be necessary for both you and the insect.");
	else output("Although the lube in your [pc.asshole] is guaranteed to ease the passage of any insertion, you figure that a little more moisture would be a welcome addition.");
	output(" Your digits prod at the female’s entrance, and you manage to slip a finger into her anal-like orifice. It instantly encases your finger and soaks it in her juices. You dig around inside the insect and stimulate her further in order to kickstart the production of more of her green fluids.");
	output("\n\nAfter a minute of poking and prodding, green ooze gushes back over your finger and covers the majority of your hand. The hyper-sensitizing goop makes each thrust of your invading digit feel like you’re pleasurably thrusting a dick inside of her instead of a finger. With the parasite finally primed and ready, you reluctantly extract your sensitive finger from her depths, and watch as a tiny waterfall of her fluids drips warmly onto your chest. You smear the secreted fluids all over your [pc.chest] with your free hand, fascinated by the way that it makes you breathe more rapidly as it seeps into your [pc.skinFurScales]. With your body becoming hotter by the second, your urges scream at your mind to satisfy yourself here and now. You succumb to your desires, and against your better judgement drop the bug to the sand, as your hands move to your [pc.groin].");
	output("\n\nYou shouldn’t have done that. Your slime covered hand has spread the sensitivity increasing ooze, and now the entirety of your nether regions feels impossibly oversensitized. Each caress and every touch sends lightning bolts through the entirety of your being. Nothing matters anymore, aside from your pent-up lust and your goal to get that bug in your ass.");
	if(oldBug >= 0) output(" The parasite inside you is really starting to worry now. The aphrodisiac-inducing ooze has probably reached her as well, if her delightful squirming against your anal walls is anything to go by.");
	else output(" Your [pc.asshole] is already twitching uncontrollably, and it hasn’t even been smeared with the slime yet. The flood of hormones in your bloodstream flows through your veins, having its way with your body and causing you to ache for anal stimulation.");
	output("\n\nYou move to sit on the parasite, making sure to position it as close to your pucker as possible, so she knows just what is in store for her. As you grind your [pc.asshole] against her she starts to squirm under your gyrations. Her movements against your anus only slightly alleviate your carnal cravings, as she has yet to realize your intentions. Not half a minute later do you feel something else down there entirely. As you look down, you see her tendrils deploying from her orifice, and slithering towards your bum hole. Having finally convinced the female parasite you mean to let her enter you, she kicks into high gear. Like a strike from a cobra she attempts to plunge all six of her appendages inside you at once!");
	// If hasFemaleInside = true
	if(oldBug >= 0)
	{
		output("\n\nBefore the tentacular feelers can even reach your [pc.asshole], tiny tentacles from your current occupant emerge and tangle with the invading tendrils. Your anal tenant puts up a good fight but she is at a disadvantage here. She only has four available tentacles to beat off the aggressor, and is losing fast. The sensations provided by their “arm wrestling” are giving your ass some of the most wonderful sensations you’ve ever experienced down there. Each twist and turn of your anal guest as she spasms her muscles to keep her opponent at bay has a delightfully strong impact on your nerves. Alas, her strength is weakening and it was inevitable that she would lose the initial onslaught anyway.");
		output("\n\nThe tendrils retreat for now while she saves up what is left of her strength for what is to come. With the defender no longer resisting the invader’s entry, the invader’s tentacles are now free to enter. They prod at your now unprotected winking star and slip in next to your current female parasite. Squelches can be heard from your rear end as they squirm and scrape against your anal walls to make room for the parasitic invader.");
	}
	output(" Each tendril is barely over the width of a pinky, but all six add up to a substantial size");
	if(pc.ass.looseness() > 3) output(". Not that your welcoming asshole is unused to insertions of this size.");
	else output(", and are really stretching you out.");
	if(pc.analVirgin)
	{
		output(" The invasion into your unclaimed pucker is done with vigor. The first to dive into your once virgin anus causes you to groan in discomfort as <b>they take your anal virginity</b>.");
		
		pc.buttChange(ppButtBug.cockVolume(0), false);
	}
	else pc.buttChange(ppButtBug.cockVolume(0));
	
	output("\n\nThe bug doesn’t need any more encouragement. You lift your ass from on top of her body and seat yourself in front of her, tendrils still lodged deep within you. Because of this it will take the parasite longer to get the rest of her to your ass, but it allows you to tend to your own needs a bit.");
	if(cIdx >= 0 && vIdx >= 0)
	{
		output(" Your hands go towards your ooze-covered private parts. The slime makes the sensations from rubbing your [pc.cocks] as well as jilling your [pc.cunts] more enjoyable than ever before. The hormones in the slime cause your body twitch as it forces tiny orgasms into you with even the slightest stimulation. [pc.GirlCum] from your feminine folds flow and create a growing puddle beneath you as your [pc.pussies] drip" + (pc.vaginas.length == 1 ? "s" : "") + " and squirt" + (pc.vaginas.length == 1 ? "s" : "") + " your fluids to the now wet sand below.");
		if(pc.balls >= 2) output(" Your balls stir while [pc.cumColor] precum oozes out your urethra" + (pc.cocks.length == 1 ? "" : "s") + " and add" + (pc.cocks.length == 1 ? "s" : "") + " even more fluids to the lubrication of [pc.eachCock].");
		else output(" Your prostate twitches as it is stimulated even further by the various movements inside you. [pc.CumColor] precum oozes out your urethra" + (pc.cocks.length == 1 ? "" : "s") + " and add" + (pc.cocks.length == 1 ? "s" : "") + " even more fluids to the lubrication of [pc.eachCock].");
	}
	else if(cIdx >= 0)
	{
		output(" You grip your [pc.cocks] and and marvel, it is like grabbing onto a rod of nirvana. Your entire being seems to move along with the motion of lustful pumps.");
		if(pc.balls >= 2) output(" Your balls brush against your taint, and you are suddenly hit by an instant, drug-induced mini-orgasm.");
		else output(" You can feel your prostate twitching already, and are suddenly hit by an instant drug-induced miniature orgasm, intensified by the squirming tendrils that rub up against it.");
		output(" With your brain drenched in even more dopamine, your [pc.cumColor] pre flows out your urethra" + (pc.cocks.length == 1 ? "" : "s") + " and adds frothy lubrication to the pre-slicked surface already provided by the aphrodisiac ooze.");
	}
	else if(vIdx >= 0) output(" You rub your palm across your [pc.clits] with one hand, and dig into your [pc.vaginas] with the other. There is already a puddle of [pc.girlCum] forming underneath you, and under your ministrations it only continues to grow. The first of many tiny orgasms are already flowing through your womanhood, spurred on by the writhing sensations inside your ass. [pc.GirlCum] squirts out in tiny spurts and promises to keep you as slick as the slime made you earlier.");
	else output(" Even though you have no genitals your bare groin is now just as sensitive as the glans of a cock or the clit of a pussy. Your digits trace along the surface and fill you up with an all encompassing inner warmth and joy that makes you want to giggle. The writhing feelers in your ass contribute to this feeling, while they send shivers through you and search deeper into your depths. Your breath hastens and the warmth that heats up your body with every stroke along your groin builds, until your mind is hit by a small explosion of euphoria that fades away quickly. The need for more keeps you going while you send yourself through several waves of these strange, hot bursts of pleasure, while you lose track of time completely.");
	// if parasiteSuccess = true
	if(success)
	{
		output("\n\nYour mind is pulled away from your fun as you feel something else prodding at your [pc.asshole]. Looking between your legs, you see the female’s ass-like orifice rubbing itself against your own. She uses the tendrils to spread you wider and allow her entry. A gooey heat hits you from inside as the parasite squirts a fresh helping of green ooze directly into your slightly gaping hole, hyper-sensitizing you all over again. Pupils dilating, this latest hit of hormones rushes through you causing you to go stiff with pleasure. The bug uses this opportunity and your rigidity to further plunge into your freshly lubed asshole. She further spreads you open, not with her feelers anymore, but with her own body. She undulates and wiggles her worm-like form into you, and stretches you further with each bit of progress she makes.");
		output("\n\nNow halfway through and at her thickest, her form stretches your [pc.asshole] like");
		switch(newBug)
		{
			case 0: output(" an apple would, her smooth surface sensually rubbing against your anal insides"); break;
			case 1: output(" a baseball would, her bumpy surface scraping against your rectal walls"); break;
			case 2: output(" a football would, her large form stretching you further than most would think possible"); break;
		}
		output(". With the sensory overload finally wearing off a bit, you weakly gain control of your body again. The first thought that races through your mind being");
		if(cIdx >= 0 && vIdx >= 0) output(" about the pure primeval lust emanating from your throbbing [pc.cocks] and [pc.pussies]. Both sets of organs add to the mess of fluids covering and dripping from your lower body.");
		else if(cIdx >= 0) output(" just how hard your blood is pumping through your throbbing [pc.cocks], " + (pc.balls >= 2 ? "balls ready to blow at any second" : "your overstimulated prostate aching to be released") + ".");
		else if(vIdx >= 0) output(" how wet you’ve become. You are practically a waterfall at this point.");
		else output(" how hot your body feels, heat focussed like a furnace around your bare groin.");
		output("\n\nSome relief flows through you as the bug slips past her halfway point and your anal ring slackens a bit around the parasite. This relief is short lived however, as she now easily slips further into you, filling you up even more. Her entry is punctuated with a perverse ‘slurp’ that you hope");
		if(pc.exhibitionism() < 50) output(" no one heard");
		else output(" all of Tarkus heard");
		output(". With her fully inside you now, save for one of her orifices still sticking out slightly, you can feel her starting her integration into your body. Not being able to pull her out now, and without having full control of your body, there is not much you can do about this. Then again, you did allow this to happen.");
		// If hasFemaleInside = true
		if(oldBug >= 0)
		{
			output("\n\nHowever, the integration will have to wait. As soon as the invading female’s tip disappears into your body, the competition for your ass begins. You feel a slight sting and a painless tearing sensation accompanies it. More slime oozes out from your ass and signals the drug-like rush to come. These chemicals are much more potent than what has been used on you so far by these creatures. Even the breeze blowing across your pucker sends orgasmic shivers up your spine. The parasites tumble and wrestle inside you, tendrils lashing this way and that as the attack on your nerves makes you gasp and moan with each passing moment. The sensations prove to be too much too quickly, as the stimulation from your ass alone spirals you into the realm of a hands-free climax.");
			output("\n\n");
			if(cIdx >= 0 && vIdx >= 0) output("The surge of sensations emanating from your groin threatens to break your mind as [pc.eachCock] spray" + (pc.cocks.length == 1 ? "s its" : " their") + " load into the air accompanied by the [pc.girlCumColor] discharge from your spasming cunt" + (pc.vaginas.length == 1 ? "" : "s") + ". Time goes on and yet they don’t stop All of your thoughts are replaced by the waves of pleasure assaulting your mind.");
			else if(cIdx >= 0) output("[pc.Cocks] twitching towards the sky, throbbing with untouched pleasure as " + (pc.cocks.length == 1 ? "it shoots" : "they shoot") + " your [pc.cumColor] seed into the air. Musky droplets rain down onto you continuously as the fighting females send you over the edge several more times and keep you in a bliss-filled, moaning state.");
			else if(vIdx >= 0) output("You squeal with clenched teeth as your [pc.cunts] spasm" + (pc.vaginas.length == 1 ? "s" : "") + " uncontrollably without even being touched since the parasite’s first entry. [pc.girlCumColor] droplets fly from your womanhood as you ride out the first of many orgasms and eventually lose track of just how many you’ve had.");
			else output("Not sure how to process the feelings coming from your bare groin, all you can do is let things run their course, allowing the heat building up to reach unbearable levels. Unexpected bliss hits your mind as usual when these feelings become too much, but for some reason the heat doesn’t go away this time. The sensations assaulting your psyche alternate between intense pleasure and the unbearable heat, not giving you a moment to gain a foothold in your own mind.");
			output("\n\nAfter some time, your head comes to its senses again, and you are given a moment to recover, body drenched in sweat and other sticky fluids.You wince with the movement of the parasites inside you, but they’ve slowed down tremendously, most likely tired out from the fighting. It is then that you receive the oddest of sensation you have felt so far inside your ass: they’ve lined up, and one of them is expanding! You grunt with the pressure of the dilating female stretching out your anal walls, and brace for the other to do the same, yet it doesn’t.");
			output("\n\nThe presence of the one not expanding slowly disappears from your ass, as you figure out that the one who lost the fight is going inside of the one who won! A short while later your anal ring is stretched open yet again, this time with only the tip of the winning female. She undulates as she slowly deposits the losing female through herself with perverse slippery sounds. These sounds continue to emanate from your [pc.asshole] until she is finally plopped onto the sticky sand below. The parasite wiggles herself upright as she crawls away to safety, leaving you with the victor firmly entrenched in your asshole.");
			
			// invasion success
			success = false;
			// power triangle game
			if(newBug == 0 && oldBug == 1) success = true;
			if(newBug == 1 && oldBug == 2) success = true;
			if(newBug == 2 && oldBug == 0) success = true;
			
			if(success)
			{
				output(" Which seems to be the ");
				switch(newBug)
				{
					case 0: output("beige"); break;
					case 1: output("green"); break;
					case 2: output("orange-striped"); break;
				}
				output(" one you just defeated.");
			}
			else
			{
				output(" Which seems to be the ");
				switch(oldBug)
				{
					case 0: output("beige"); break;
					case 1: output("green"); break;
					case 2: output("orange-striped"); break;
				}
				output(" one you’ve had all along.");
			}
		}
		output("\n\nShe redeploys her feelers inside you and wastes no time in searching for your most exposed nerves");
		if(cIdx >= 0) output(", conveniently located near your prostate");
		output(". A pinch is felt, along with the sensation of two types of flesh merging, and the odd feeling of no longer being alone in your mind. Now finally able to, you stand up with a woozy head and an occupant in your ass.");
		if(oldBug < 0) output(" Having a bug in your ass is an odd sensation indeed. Her occasional twitching feels kind of good, actually. Looking at your anus in the reflection provided by your codex reveals that she isn’t actually entirely inside you. One of her ass-like ends is actually poking out somewhat, and it is changing color to make it look like she is actually your anal ring.");
		else output(" Ah... that wonderful sensation of feeling full again. You look forward to gallivanting around the universe with a bug in your ass once more.");
		if(oldBug != 2 && newBug == 2) output(" Good god is she huge! How is she even staying in there without permanently turning your ass into a warp gate!? Her squishy body must be playing a role. It’ll take some getting used to her huge presence in your ass.");
		output("\n\nYou turn to pick up your gear and resolve to make the best you can of this parasite, your ass still twitching from the stretching it received. You hazard a guess that if anyone’s going to fuck your ass with this thing in you they’ll probably be fucking the parasite instead. They’re probably going to stretch you out all the same either way, since they are still technically fucking your ass though. You wonder how a lover will react when you tell them that they’ve actually been screwing a little insect. Oh well, that’s a thought for another time.");
		
		if(success) attachButtBugFemale(newBug);
	}
	// if parasiteSuccess = false
	else
	{
		// if invadingFemale = 2
		if(newBug == 2)
		{
			output("\n\nHer body touches your [pc.asshole] and drags your attention from your self-pleasuring towards her. Seeing her so close makes you wonder if she’s even going to fit inside you. You throw caution to the wind and let her continue her advancement, hoping that she might just fit. Her tip enters you and slowly makes progress. It isn’t long until her advancements become incredibly painful, and she isn’t even halfway in yet! She wiggles forward one more time and it’s the most uncomfortably stretched feeling you’ve ever had!");
			output("\n\nNope, you’re bailing. Gripping the female by the sides with both hands, you pull her out of you. The tendrils noisily slurp out of you and cause more than a few shivers to go down your spine. Now that she’s out of you, you");
			if(!pc.isAss()) output(" chuck her behind some rocks and junk. Out of sight and out of mind.");
			else {
				output(" put her on the ground and give her a swift");
				if(pc.isGoo()) output(" slap with your goo");
				else if(pc.isNaga()) output(" swat with your tail");
				else if(pc.isTaur()) output(" kick with your tauric front leg");
				else output(" kick");
			}
			output(" away from you. She lands in the sand quite a distance away and crawls away from the crater she made faster than you thought these critters could move.");
		}
		output("\n\nDamn these bugs, why must these be so difficult. Oh well, might as well finish what you’ve started.");
		if(cIdx >= 0 && vIdx >= 0) output(" As you grip your cock" + (pc.cocks.length == 1 ? "" : "s") + " and rub your mound" + (pc.vaginas.length == 1 ? "" : "s") + ", you go at it in a comfortable rhythm and tempo. As sensitive as they are, even the lightest caress is astoundingly pleasurable. It doesn’t take you long at all to drive yourself over the edge again, and you paint the sand with your fluids, filling the air with your sounds of orgasmic pleasure.");
		else if(cIdx >= 0) output(" Once more you grip your [pc.cocks] and gently stroke " + (pc.cocks.length == 1 ? "it" : "them") + " to get yourself going. Any faster and you might pass out from the sensation. It doesn’t take long to finally get off, seeing as the aphrodisiac is still coursing through you. You grunt and give a few final jerks before your " + (pc.balls >= 2 ? "balls churn" : "prostate spasms") + " while you spray your [pc.cum] across the sand.");
		else if(vIdx >= 0) output(" Once again you tease your [pc.clits] and rub your [pc.pussies], quickly raising your heartbeat as your body goes flush from the sensations. With the aphrodisiacs still in your system, it doesn’t take long to reach orgasm as you gasp, spraying your [pc.girlCum] into a puddle below you.");
		else output(" Having no genitals, you have to resort to using the sensitivity the slime gave you to get off. You rub your bare groin with your digits and quickly become an erotic artist as your fingers stroke streaks of pleasure across your [pc.skinFurScales]. A few moments later and ecstasy without focus erupts from within you. It quickly ebbs away, and leaves only pure bliss and a clear mind.");
		output(" Finally satisfied, you move to pick up your gear and continue with your adventures. Maybe some other type would be more suited to your body.");
	}
	output("\n\n");
	
	processTime(36);
	IncrementFlag("BUTTBUG_SEX_OFFERBUTT");
	
	pc.orgasm();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function sexButtBugUse():void
{
	clearOutput();
	showButtBug(-1);
	author("Preacher");
	
	// create boolean "hasMaleBug"
	// Only used to set whether or not you have the male and to give you the option of capturing one if you do not. You can’t have more than one, not even one in ship storage and one on you.
	
	var buttBugM:StorageClass = pc.getKeyItem("Butt Bug (Male)");
	var buttBugF:StorageClass = pc.getStatusEffect("Butt Bug (Female)");
	
	var cIdx:int = (pc.hasCock() ? rand(pc.cocks.length) : -1);
	var vIdx:int = (pc.hasVagina() ? rand(pc.vaginas.length) : -1);
	var cumQ:Number = pc.cumQ();
	var vWetness:Number = pc.wettestVaginalWetness();
	
	var ppButtBug:PregnancyPlaceholder = getButtBugPregContainer(-1);
	
	output("With the main body dealt with and heightened hormone levels coursing through you, your eyes are set on the phallic insect that skitters away from you. The little shit has gotten you all hot and bothered and now it’s trying to get away. You simply won’t stand for this. He’ll satisfy whether he wants to or not. Slowly coming out of its drunken stupor, he’s starting to gain some speed.");
	output("\n\nIt looks like you’ll have to chase after him. Sand is kicked up with your first stride as your chase begins. Luckily for you, he seems more focused on your position rather than where he is going. As quickly as the chase started, it ends with him smacking into the face of a large hunk of metal. He pulls away only to dizzily fall into the sand, now motionless. He isn’t even that far away. You reach his location without having broken a sweat.");
	output("\n\nYou bend down and pick up the phallic insect, and as you grip him by the shaft you almost laugh at the absurdity of its shape. It’s weird, but you can feel this creature actually has veins beneath its smooth surface. They are probably going to be a lot more pronounced in a bit, too. Doing what you would do to awaken any cock, you stroke it along its length, feeling it harden with each pass from bulbous base to oddly human, throbbing tip. Some life springs from the bug as his little eyes glare at you and his spindly legs twitch frantically as he tries to escape your grip.");
	output("\n\nYou grab his base in an attempt to subdue him, and feel some definite ball-like objects just below the soft chitin. Now you have him by the balls, literally. He doesn’t dare escape now, and even leans into your strokes while you pump him to full mast. His cock grows to double its flaccid size, and at 12 inches it’s basically larger than the rest of him.");
	if(!pc.isNude())
	{
		output("\n\nA thought strikes you: what about your gear? You can’t effectively screw a dick with all your stuff on, even if it is a cock with legs. Deciding to take the risk, you set him down and keep your hands close just in case he decides to bolt it. It turns out that he can’t run away anyway, let alone move from where you’ve put him. He corkscrews in the sand with his cock’s head in the middle of the circle like some perverted clock.");
		output("\n\nTaking the opportunity before he goes soft, you swiftly move to drop your [pc.gear]. The desert wind blowing across your nude form is refreshingly cool and doesn’t even move your [pc.hair] with its delicate breeze. Back to the bug in the sand you pick him up once more and bring him up towards your mouth whilst lowering your form as you lean against the metallic chunk for support. It’ll be a snowy day on Tarkus before you let something go into you dry.");
	}
	output("\n\nYou part your [pc.lips] with his human-like cock head and flick your tongue across his insectoid urethral slit, while licking up a surprisingly sweet drop of pre. Deeper it goes, tongue slathering the probably sensitive glans, and making it throb harder than before. The bug struggles to resist your talents, but finds you too effective for his own good. His legs twitch with each lick as more pre flows into your mouth. Seeing this as an opportune moment to administer some lube, you pull it out, softly popping your lips off the head.");
	output("\n\nYou slather the now exposed cock with a mixture of your saliva and its pre to quickly coat it in make-shift lube and prep him for penetration. He’s ready now; maybe a bit too ready as he seems way too excited to enter you. His insectoid veins bulge with more and more primal lust, the closer he gets to your ass. Your [pc.asshole] clenches with anticipation as you position the head near your winking pucker.");
	// if hasFemaleInside = true
	if(buttBugF != null)
	{
		output("\n\nThe hilinara parasite inside you senses the male, and is already expanding its tip to provide better access. The tendrils inside of her start moving, and you can feel every inch of their presence as they start their journey out of ‘your’ asshole. The first pokes its tip out, and with it there follows a tiny stream of slime that drips onto the male. This excites him. The pheromones of the female literally dripping onto him makes his dick throb in a way that almost looks like it is breathing. The rest of the tendrils slip out, dripping even more goop onto the male as they entwine around the shaft and his base, ensuring he won’t slip out during copulation.");
		output("\n\nWithout letting you get ready, your impatient tenant uses her tiny tentacles to aim the phallic insect at her slightly gaping orifice, before roughly forcing the male inside. His cock stretches her body and your anus a bit more than the female already has, and continues to penetrate even further. Your parasite’s unique physiology allows the dick to slide in gracefully while allowing you to feel what she feels through both your connected nerves. The tendrils around it makes for a very pleasurable textile adventure while they continue to spiral around him. There aren’t many cocks in the universe that have tentacles swirling around them as they enter you, and you enjoy it greatly.");
		
		pc.buttChange(ppButtBug.cockVolume(0));
		
		output("\n\nThe most the male can do at the moment is allow the female to have her fun, and for now you are in a similar predicament. At least you have the power to make it even more pleasurable for yourself. You " + (pc.hasBreasts() ? "grab a breast" : "tweak a nipple") + " with one hand as you prepare for some self pleasuring.");
		output("\n\nMoving your other hand you");
		if(cIdx >= 0 && vIdx >= 0) output(" decide to not have either single set of genitalia be the focus of pleasure this time. Grabbing " + (pc.cocks.length == 1 ? "your [pc.cock " + cIdx + "]" : "[pc.oneCock]") + " with only your thumb and index finger you use your three other digits to stimulate your womanly folds. Shortly pumping at the [pc.base " + cIdx + "] of your dick leaves you enough room to manipulate the digits in your cunt" + (pc.vaginas.length == 1 ? "" : "s") + ". " + (pc.balls >= 2 ? "Your scrotum is used to rub your clit" + (pc.totalClits() == 1 ? "" : "s") + ", as you can’t quite reach " + (pc.totalClits() == 1 ? "it" : "them") + " directly, their texture making for a uniquely sensual experience" : "Using the remainder of your digits, you slip them in halfway repeatedly until you’ve found yourself a nice rhythm to your jerk and finger combo") + ".");
		else if(cIdx >= 0) output(" grasp " + (pc.cocks.length == 1 ? "your [pc.cock " + cIdx + "]" : "[pc.oneCock]") + " while stroking it to a made up beat in your head. Occasionally you use a thumb to rub your cock’s glans in a circular fashion before moving back to stroking yourself with more and more pre lube as time goes on.");
		else if(vIdx >= 0) output(" rub at your [pc.pussies], slipping in an entire digit at times to further tease yourself. Your thumb inevitably grazes [pc.oneClit] with your continued self-stimulation, each making you moan while they send a delightful jolt of pleasure through you.");
		else output(" instinctively rub at your bare groin, realizing you have no genitals to speak of you keep going. These rubs somehow gives you a small measure of residual happiness that spreads through your body.");
		output(" All the while, you");
		if(pc.hasBreasts()) output(" massage one of your [pc.breasts], digits sinking into your boobflesh as " + (pc.isLactating() ? "[pc.milk] flows out, streaming down your body and into the dry sand below" : "occasionally tweak a hardened [pc.nipple] for some small manner of extra pleasure") + ".");
		else output(" tweak a hardened [pc.nipple], the sensitivity of it building as you feel more and more pleasure from the act.");
		output("\n\nYour parasite quickens her pace, noisily ramming the male with more fervor than ever before, and fucking you harder and faster as well. Her gooey excretions ooze out, and have already completely covered the male at this point. Green slime drips from him as it forms small puddles below you. Even through the female you can feel the male’s cock stretching out every sphincter muscle you have. The feelings from both your nerves and hers mix to make it seem like the insectoid phallus is some sort of quantum dick that’s fucking you twice in the same timespan.");
		output("\n\nBeing overstimulated like this, you can’t help but increase your pace as well, sweat already dripping down your form from the exertion.");
		if(cIdx >= 0 && vIdx >= 0) output(" What were you thinking when you tried to pleasure both your sexes with only one hand? It’s clearly inefficient. Reaching back with your chest-occupied hand, you finger your [pc.pussies] from behind while the other jerks [pc.oneCock]. It is like an online vid switching to a higher quality while you watch it, utter satisfaction. Exploiting your physiology as best you can you ride out the wave of satisfactory pleasure hitting your mind.");
		else if(cIdx >= 0) output(" Your hand bolts up and down [pc.oneCock] as the other moves away from your chest to " + (pc.balls >= 2 ? "fondle your swinging balls" : "slip a digit into your parasite-hosting anus along with the male’s tentacle covered shaft") + ".");
		else if(vIdx >= 0) output(" You can’t handle the teasing anymore. You need more, and the hand on your [pc.chest] won’t suffice. You send it to vigorously finger your folds while the other handles clit duty, and a stream of [pc.girlCum] forms between your legs.");
		else output(" Your continued sensual rubs of your bare groin has turned your waves of happiness into those of heat and need. Lusting for more, the hand that caresses your upper body moves to join its twin as you feel hotter with every circular motion.");
		output("\n\nThe male’s tentacle-covered cock-body suddenly throbs. Its veins bulge out and you can feel the first of many warm spurts of green cum filling up your backside. A few last powerful thrusts into your parasite occupied anus sends you over the brink as well. Fast-paced exclamations and profanities of pleasure escape you as your");
		if(cIdx >= 0 && vIdx >= 0) output(" herm physiology lets you experience two orgasmic sources at once. Cock" + (pc.cocks.length == 1 ? "" : "s") + " " + (pc.balls >= 2 ? "emptying your balls" : "relieving your prostate") + " as " + (pc.cocks.length == 1 ? "it" : "they") + " release your [pc.cum] into the world. Meanwhile, your [pc.pussies] spastically clench" + (pc.vaginas.length == 1 ? "es" : "") + " around your digits and gush forth [pc.girlCum] until you fall onto the sand.");
		else if(cIdx >= 0) output(" " + (pc.balls >= 2 ? "balls go into overdrive" : "prostate clenches hard") + " while pumping your [pc.cum] through your shaft" + (pc.cocks.length == 1 ? "" : "s") + " to meet the desert sand. [pc.Cocks] still half hard, you collapse with breath ragged, utterly spent into sand.");
		else if(vIdx >= 0) output(" vaginal walls clamp down around your digits while streams of [pc.girlCum] leak out of you. Bringing your hand up to lick yourself clean you breathe a sigh of exertion before sinking downwards to rest.");
		else output(" your hot fever of need briefly lights up your nerves and explodes inside you. Your mind slowly ebbs into a realm of satisfaction and relief while you cool off and rest for the time being.");
		output("\n\nFeeling the phallic bug still inside you, or rather still inside the anal parasite, a groan escapes you as she unwraps her tendrils and lets go of him. He slowly slips out like some kind of dildo, losing his rigidness, but still connected to you by strands of various sexual fluids that cover his form. His head wetly plops out of the female and into the now muddy earth below your ass, while the female’s tendrils move into action yet again.");
	}
	// hasFemaleInside = false
	else
	{
		output("\n\nAs you check to make sure you’ve aimed right, you see that the phallic bug looks like he can’t wait to get inside you. However, he still seems hesitant. When his head pokes at your pucker, it pushes the bug to action. His legs extend to press his slickened head past your anal ring. You gasp as it pops into you");
		if(pc.balls > 0) output(", his shaft grinding against the back of your [pc.balls] as");
		output(". You");
		if(pc.analVirgin) {
			output(" take your first cock up the ass as far as it will go. <b>Your anal virginity has been taken</b>.");
			pc.buttChange(ppButtBug.cockVolume(0), false);
		}
		else if(pc.ass.looseness() <= 2) {
			output(" slowly slide him in until your ass hits his base. You enjoy the feeling of him filling you up. This isn’t your first visitor through the backdoor after all.");
			pc.buttChange(ppButtBug.cockVolume(0));
		}
		else {
			output(" take his cock like a pro. Your [pc.asshole] slurps it up without a single second of discomfort.");
			pc.buttChange(ppButtBug.cockVolume(0));
		}
		output(" It’s an interesting feeling to be stuffed with his veiny cock, each throb resonating through your anal walls.");
		output("\n\nHe’s getting restless sitting there with his dick up your bum, and squirms this way and that as he tries to get stimulation in any way possible. You tell him to stop fidgeting in a firm voice, but he either isn’t listening, or doesn’t understand. With your ass hovering above the ground, it’ll be easy to descend to the ground and fully sit on him. Maybe that’ll remind him who’s in charge here. Telling him again to stop, you relax your [pc.legOrLegs] until you’re basically sitting in the sand, with your ass cheeks smothering him. With his wide base pressed up against your [pc.asshole] it provides a nice barrier to stop his entire form from entering you. With your weight upon him, his attempts to move have stopped. Maybe now he’ll let you do your own thing.");
		output("\n\nHowever, as you lift off of him, he springs to action again, and pistons his legs as he smacks into your ass.");
		if(cIdx >= 0 && vIdx >= 0) output(" Both your masculine and feminine organs tingle with residual stimulation as he pounds your ass and " + (pc.balls > 0 ? "frots against the backside of your [pc.balls]" : "makes droplets of his makeshift lube splatter against your lower labia") + ".");
		else if(cIdx >= 0) output(" Your [pc.cocks] throb each time he hilts into you, and he " + (pc.balls >= 2 ? "rubs your balls as he goes" : "bumps your prostate on the way in and out") + " Your [pc.cocks] drip [pc.cumColor] precum from the stimulation while the liquid flows down your frenulum.");
		else if(vIdx >= 0) output(" His efforts are hardly right for stimulating one such as yourself, but at the very least his enthusiasm makes up for his lack of skill. However, you need just a little more to truly satisfy yourself. You move one of your hands to rub at your [pc.cunts].");
		else output(" Strange tingles move through your form while the bug pistons into your backside, more pleasurable than uncomfortable. It feels as if a ten-armed massage expert is having his way with your nerves, and you reflect on the idea that having no genitals doesn’t mean that you have to miss out.");
		output(" It seems the little dick hasn’t learned a thing, as three times you sit on him only to go back up with a twelve inch piston in your ass.");
		output("\n\nThe fourth time, however, he’s slowed down considerably. Once more ought to do it. This time when you lift off only slight movements are felt, and he stops completely when you tell him to. It was about time that he learned his place. At this moment, he’s your toy and nothing else. Slowly at first, you bounce on the phallus as you gyrate your hips this way and that to scratch all the right itches. Anal squelching sounds can be heard as your ass connects to his base over and over again, while the sticky lube continues to create strands of fluid that connect the two of you together.");
		output("\n\nYour breath hastens as you gradually pick up the pace, losing the gyrations and really kicking your [pc.legOrLegs] into high gear.");
		if(cIdx >= 0 && vIdx >= 0) output(" Each bounce makes your dick" + (pc.cocks.length == 1 ? "" : "s") + (pc.balls > 0 ? " and [pc.balls]" : "") + " do cyclical slaps between your stomach and your womanhood, stimulating you as trickles of [pc.girlCumColor] flow in between your legs and [pc.cumColor] pre flings from your urethra" + ((pc.cocks.length == 1 && !pc.cocks[0].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) ? "" : "s") + ".");
		else if(cIdx >= 0) output(" [pc.Cocks] bouncing " + (pc.balls > 0 ? "and [pc.balls] jiggling" : "and prostate clenching") + ", even more [pc.cumColor] pre drips from your urethra" + ((pc.cocks.length == 1 && !pc.cocks[0].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) ? "" : "s") + ".");
		else if(vIdx >= 0) output(" Your hand quickens in your ministrations on your labial lips as your thumb polishes your pearl" + (pc.totalClits() == 1 ? "" : "s") + ", occasionally slipping inside for a quick frig.");
		else output(" The tingles inside you build up, adding to those from before.");
		output(" The sounds of drawn out moans and your ass’s squishy slapping against his base fill the air, lewd enough to arouse anyone within earshot.");
		output("\n\nAs you near the point of no return, you begin to tire, sweat dripping from your form. The male senses this and gives one rough jump of his legs, unexpectedly hitting you so hard that all that comes is a loud and sudden moan. Not receiving any order to stop, he keeps going. He’s learning just the right times to take control. His efforts and yours are just too much, and you are both pushed over the brink with one final thrust.");
		output("\n\nYou cum when his base hits your anal ring.");
		if(cIdx >= 0 && vIdx >= 0)
		{
			output(" Both sets of your genitals go off at the same time, letting you bask in the euphoria of dual sexed orgasms. Your [pc.pussies] wet" + (pc.vaginas.length == 1 ? "s" : "") + " the ground below with");
			if(vWetness <= 1) output(" small streams");
			else if(vWetness <= 4) output(" infrequent squirts");
			else output(" volumous sprays");
			output(" of [pc.girlcum] while your " + (pc.balls >= 2 ? "[pc.balls] draw tight against you" : "overstimulated prostate spastically twitches") + " as " + (pc.balls >= 2 ? "it pumps" : "they pump") + " your");
			if(cumQ < 100) output(" small");
			else if(cumQ < 10000) output(" adequate");
			else output(" tremendous");
			output(" load of [pc.cum] a small distance away from you, and makes an appropriately sized puddle of cum.");
		}
		if(cIdx >= 0)
		{
			output(" [pc.Cocks] twitching as your " + (pc.balls >= 2 ? "[pc.balls] churn" : "spasming prostate clenches") + ", the frenum of your cock" + ((pc.cocks.length == 1) ? " bulges" : "s bulge") + " with your load pumping through your masculinity. [pc.CumColor] bursts from your urethra as you empty your [pc.balls] into the desert air, making a");
			if(cumQ < 100) output(" tiny puddle");
			else if(cumQ < 10000) output(" relatively large puddle");
			else output(" huge lake");
			output(" of [pc.cum] before draining away in the sand.");
		}
		if(vIdx >= 0)
		{
			output(" [pc.Pussies] spasming around your digits, your hips buck with the");
			if(vWetness <= 1) output(" trickling river");
			else if(vWetness <= 4) output(" occasional squirts");
			else output(" explosive burst");
			output(" of [pc.girlCum], rapidly wetting the ground below you.");
		}
		else output(" Your entire nervous system lights up in a flash of pleasure, leaving your mouth gaping as you’re left motionless for the few seconds your brain struggles to process what’s going on. Slowly you regain environmental awareness and feel tired but satisfied in a way that can only be described as a weird form of happiness.");
		output(" The aftermath of your climax still rolling through you, you collapse exhausted into the sand. The insect’s dick pops out soon after as a couple of last squirts fly into the air before he too falls to the grainy earth.");
	}
	if(buttBugF != null) output("\n\nHaving had its fill, the parasite inside you gathers the leftover dripping seed from your cheeks with its tendrils before closing back up. Undulating pressures roll through your anus as the female prepares her freshly fertilized young for incubation, soon to be laid in your gut. Gathering your gear, you look forward to carrying them until they’re ready for the world.");
	else output("\n\nThe male’s seed drips from your [pc.asshole], creating a nice gooey feeling between your asscheeks, and filling the void in your slightly gaping ass for now. You wonder if things would have turned out different had you had a female of the species in you. Maybe next time.");
	
	processTime(34);
	IncrementFlag("BUTTBUG_SEX_USE");
	
	pc.loadInAss(ppButtBug);
	pc.orgasm();
	
	clearMenu();
	if(buttBugM != null)
	{
		output("\n\nWell that was fun. Hopefully your own little guy won’t be too upset that you kinda cheated on him. You leave the bug there to recover, and prepare to hit the road.");
		output("\n\n");
		
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		output("\n\nWhew, what a ride! It would be nice if you could have one of these critters with you to fuck whenever you feel like. It’s not like he’d complain. In fact, you could store him in one of your item pods. Do you do so?");
		output("\n\n");
		
		addButton(0, "Leave", mainGameMenu);
		// Self explanatory, button appears after using the male. The thing it is stored in is my own headcanon for how steele stores shit, with a couple of adaptable inventory storage pods. Then again it might become normal canon if added to game, who knows...
		addButton(1, "Capture", captureButtBugMale, undefined, "Capture", "Capture the male you’ve just fucked into submission.");
	}
}

public function captureButtBugMale():void
{
	clearOutput();
	showButtBug(-1);
	author("Preacher");
	
	output("Thinking you could have some use for the little bugger if you need to relieve yourself again, you walk up to him with an item container in hand and capture in mind. It’s only fair, since he attacked you and all. It seems the fucking really did a number on the little guy, as he’s still as limp as any other post-orgasm cock you’ve seen. Taking advantage of the situation, you grab him by the shaft and lift him up with barely any effort, dropping him into the container.");
	output("\n\nThe lid closes automatically, sealing with a hiss as the small electronic label on it flashes from a green “Open” to a red “Secured” in a matter of seconds. It scans the slowly reviving male butt bug inside of it, and determines the object to be alive and organic before the self-modification system kicks in. It visibly transforms itself in order to keep the organic creatures inside it alive, complete with atmosphere generators, air filters, and even a low grade replicator to give it water and sustenance pellets from appropriate particles in the surrounding environment.");
	output("\n\nHe doesn’t seem too bothered being captured. In fact, you think he might even look kind of excited. He must’ve figured out that you were going to keep him and use him again when you felt like it. As he takes an experimental nibble on a pellet, you wonder what it must feel like for him to now be your personal sex toy. Shrugging it off, you store him away, and quickly check your gear before moving on. With the little guy now excitedly nomming away at his pellet, you’ve now obtained a living insectoid dildo.");
	
	processTime(7);
	IncrementFlag("BUTTBUG_MALE_CAPTURED");
	// set hasMaleBug to true
	// add male butt bug to key items
	output("\n\n<b>You have obtained a Butt Bug (Male).</b>");
	// Key Item: "Butt Bug (Male)"
	// v1: times anally masturbated with
	// v2: times vaginally masturbated with
	// v3: 
	// v4: 
	pc.createKeyItem("Butt Bug (Male)", 0, 0, 0, 0, "A bio-sustaining canister that houses a living male butt bug.");
	
	output("\n\n");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Masturbation option, available outside of combat when carrying a captured butt bug male.
public function masturbateButtBugMale():void
{
	var buttBugM:StorageClass = pc.getKeyItem("Butt Bug (Male)");
	var buttBugF:StorageClass = pc.getStatusEffect("Butt Bug (Female)");
	
	var cIdx:int = (pc.hasCock() ? rand(pc.cocks.length) : -1);
	var vIdx:int = (pc.hasVagina() ? rand(pc.vaginas.length) : -1);
	var cumQ:Number = pc.cumQ();
	var vWetness:Number = pc.wettestVaginalWetness();
	
	masturbateButtBugMaleScene(["intro", buttBugM, buttBugF, cIdx, vIdx, cumQ, vWetness]);
}
public function masturbateButtBugMaleScene(arg:Array):void
{
	var response:String = (arg.length > 0 ? arg[0] : "intro");
	
	var buttBugM:StorageClass = (arg.length > 1 ? arg[1] : pc.getKeyItem("Butt Bug (Male)"));
	var buttBugF:StorageClass = (arg.length > 2 ? arg[2] : pc.getStatusEffect("Butt Bug (Female)"));
	
	var cIdx:int = (arg.length > 3 ? arg[3] : (pc.hasCock() ? rand(pc.cocks.length) : -1));
	var vIdx:int = (arg.length > 4 ? arg[4] : (pc.hasVagina() ? rand(pc.vaginas.length) : -1));
	var cumQ:Number = (arg.length > 5 ? arg[5] : pc.cumQ());
	var vWetness:Number = (arg.length > 6 ? arg[6] : pc.wettestVaginalWetness());
	
	var ppButtBug:PregnancyPlaceholder = null;
	
	clearOutput();
	showButtBug(-1);
	author("Preacher");
	clearMenu();
	
	switch(response)
	{
		case "intro":
			output("As you ponder how you’re going to satisfy yourself this time, small taps against glass hit your auditory senses. Their source seems to emanate from the item pod where your captured male butt bug is stored. A spindly insectoid foot is making the noise, and his phallic body seems half erect at the prospect of intercourse. He knows you too well, and is always at the ready for a bout of fun. A few keystrokes later, and with a hiss the container switches from “secure” to “open”.");
			output("\n\nYou set the pod on the ground, and step back as you turn around to show your [pc.ass]. A quick strip of your gear and a slap of the ass is all that’s needed for him to skitter out of the glass pod and bounce around excitedly at your [pc.feet]. Unfortunately, the excitement gets the best of him and causes his erection to become large enough to immobilize him as it topples him over. Even though he can’t really move, those legs keep on trying to get his dick upright. It’s kind of cute, in a way.");
			
			if(vIdx >= 0)
			{
				output("\n\nHow shall you take him?");
				
				addButton(0, "Ass", masturbateButtBugMaleScene, ["ass", buttBugM, buttBugF, cIdx, vIdx, cumQ, vWetness], "Ass", "Use the male butt bug on your [pc.asshole].");
				addButton(1, "Vagina", masturbateButtBugMaleScene, ["vag", buttBugM, buttBugF, cIdx, vIdx, cumQ, vWetness], "Vagina", "Use the male butt bug on your [pc.vaginas].");
			}
			else addButton(0, "Next", masturbateButtBugMaleScene, ["ass", buttBugM, buttBugF, cIdx, vIdx, cumQ, vWetness]);
			break;
		case "vag":
			ppButtBug = getButtBugPregContainer(-1);
			
			output("These bugs may be designed to fuck asses, but that doesn’t mean they can’t be used in other ways. The nice thing about them is that they can’t fertilize anything other than their own females, meaning there’s no need for a condom. Y");
			if(buttBugF != null) output("our anal-lodged parasite might not like this, but it is what you want. And besides, y");
			output("our [pc.pussies] " + (pc.vaginas.length == 1 ? "has" : "have") + " been craving for some action.");
			if(pc.vaginalVirgin) output(" Although as a virgin, you’re not quite sure what that action is going to be like.");
			output(" You lower your form until your vaginal lips are about a foot away from the erect insect.");
			if(cIdx >= 0) output(" Your own [pc.cocks] " + (pc.cocks.length == 1 ? "is" : "are") + " also hard at the prospect of this encounter.");
			output(" One of your hands sneaks back to give the bug a little help in keeping himself upright. He’s definitely a bit too endowed for his own good. His human-like cockhead lies pressed at " + (pc.vaginas.length == 1 ? "your womanly entrance" : "one of your womanly entrances") + " before you sink his phallus through your fleshy veil.");
			
			if(pc.vaginalVirgin)
			{
				if(pc.vaginas[vIdx].hymen) output(" Your hymen is torn, and you wince at the stinging sensation coming from within you. Pretty soon however, the pain goes away and is completely replaced by a sense of fulfillment and pleasure.");
				output(" <b>Your vaginal virginity has been taken.</b>");
				
				pc.cuntChange(vIdx, ppButtBug.cockVolume(0), false);
			}
			else pc.cuntChange(vIdx, ppButtBug.cockVolume(0));
			
			if(cIdx >= 0) output(" The insertion has caused some [pc.cumColor] pre to leak from the tips of your cock" + (pc.cocks.length == 1 ? "" : "s") + ", and it now drips along the underside of your shaft" + (pc.cocks.length == 1 ? "" : "s") + ".");
			output("\n\nNow that he’s in, you remove your hand from his now veiny cock, but he does not move. You quickly realize that his training when you tamed him must be the cause of his sessility, and with a few reassuring words, you have him moving in no time. Drawn out wet squelches fill the air as he pumps his insectoid shaft in and out of your vagina. Like some kind of arachnid-based piston device, the spindly legs attached to his base do their best to move the entire 10 inch erectile mass above them for you pleasure.");
			output("\n\nWhile he goes about stimulating your vaginal walls, you set out to stimulate parts that he cannot. The hand that was on him now moves to rub at your clit" + (pc.totalClits() == 1 ? "" : "s") + " while the other clasps");
			if(cIdx >= 0) output(" " + (pc.cocks.length == 1 ? "your cock" : "one of your cocks") + ". You passionately stroke your shaft as more and more pre is coaxed out with every pass, creating a convenient lube in no time at all.");
			else output(" one of your [pc.nipples]. " + (!pc.hasBreasts() ? "Your flat chest makes your nipples the prime receivers of your manual ministrations, and as hard as they are now they’re so delightfully sensitive." : "As your thumb and index finger handles your sensitive nipple your other digits dig into your breast flesh as you massage one of your [pc.breastCupSize " + 0 + "] tits."));
			output("\n\nThe bug is actually quite good at what he’s doing. You are uncertain whether it’s enthusiasm or actual skill, but it makes for an enjoyable ride all things considered. However, your greedy pussy wants more and you indulge it without a second thought. You use your [pc.legOrLegs] to bounce up and down on the insect’s dick, in tune with his own efforts. Quickened breath and pleasured gasps ensue as the exertion exponentially increases your stimulation.");
			output("\n\nThe faster pace doesn’t let you last much longer though. A tingle in your quim is all the warning you get before a fast approaching orgasm hits you from out of the blue. Gasps turn into loud moans as your vaginal muscles clench around the shaft of the male bug below you, and your [pc.girlcum] covers him from ‘head’ to base.");
			if(cIdx >= 0) output("\n\nYour own masculine organs reciprocate your vagina’s orgasmic pulses. Your hips buck forward as your " + (pc.balls >= 2 ? "[pc.balls] pull tight against you" : "your prostate twinges") + " and your [pc.cum] is pumped through your urethra" + ((pc.cocks.length == 1 && !pc.cocks[0].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) ? "" : "s") + " to splatter against on the floor.");
			output(" The insect’s phallic organ throbs inside your feminine folds as he too is driven over the edge. He spurts his thick green load, coating your vaginal walls with his seed. His semen unloads within you until the excess dribbles out around him and eventually covers his entire body. Having nowhere else to go, the green sperm then drips down to the floor and adds to the puddle formed by your sexual fluids.");
			output("\n\nWith the both of you drained of your energy and fluids, there is little that can be done other than collapse onto the floor. Your bug’s cock slides out of your vaginal lips, limp and completely spent, while his verdant semen oozes out in little dribbles.");
			// if hasFemaleInside = true
			if(buttBugF != null) output(" A tendril from your anal tenant briefly shoots out of her protruding orifice and slaps your ass in a whip-like motion. This causes an ‘eep’ to escape your mouth and leaves quite the mark on your bum. It was a bit physical, but you guess this is her way of scolding you for leaving her out of the fun.");
			output("\n\n");
			
			processTime(17);
			pc.addKeyValue("Butt Bug (Male)", 2, 1);
			IncrementFlag("BUTTBUG_MASTURBATE_MALE");
			
			pc.loadInCunt(ppButtBug, vIdx);
			pc.orgasm();
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "ass":
			ppButtBug = getButtBugPregContainer(-1);
			
			output("You’ve been itching for some butt fun, and you know just the expert for the job.");
			// if hasFemaleInside = true
			if(buttBugF != null) output("Judging from the leakage already coming from her poked out orifice, you’re pretty sure your own hilinara parasite is going to like this as well.");
			output(" You lower your hindquarters so that your puckered target is closer to the frantically enthusiastic body of the male insect.");
			if(buttBugF != null) output(" The closer your ass gets to him, the more impatient the female inside you gets. Her tiny feet wiggle against your anal walls, tickling the insides of your rectum and forcing a sultry giggle out of you.");
			output(" You use a free hand to help the male bug stay upright despite his 10 inch veiny length. Like a rocket that’s ready to pierce the heavens he is ready and raring to penetrate your");
			if(buttBugF != null) output(" – or rather her –");
			output(" anal star.");
			// if hasFemaleInside = true
			if(buttBugF != null)
			{
				output("\n\nBefore you have a chance do it yourself, the tentacles of the female parasite burst out to wrap around the shaft. Their slimy surfaces slither over and under your grasp until they’ve pried your digits from their objective. Not that they needed to. She lifts him from the ground and inserts his slimy tentacle-covered cock into the drippy anus you share with her. It feels like two dicks have entered you at once, yet you know that it’s only your ass spreading as you experience the stretching of the female’s own walls. Due to the female’s link with your nerves, you feel everything that is happening down there, from the swirls of the tendrils to the veiny girth of the male’s penis against the walls of the parasite’s insides.");
				
				pc.buttChange(ppButtBug.cockVolume(0));
				
				output("\n\nAs these sensations build up, it becomes impossible to keep your hands off yourself. One hand");
				if(cIdx >= 0 && vIdx >= 0) output(" grips the base of [pc.oneCock] and sensually jerks your meat. The other " + (pc.balls > 0 ? "maneuvers around your [pc.balls]" : "slides in between your [pc.thighs]") + " as you use some of your fingers to spread your lips while the others jill " + (pc.vaginas.length == 1 ? "your vagina" : "one of your vaginas") + ".");
				else if(cIdx >= 0) output(" moves to jerk [pc.oneCock] as the other " + (pc.balls > 0 ? "rolls your [pc.balls] around in its palm" : "rubs its digits along the sensitive spots of your glans") + ".");
				else if(vIdx >= 0) output(" rubs itself along your vaginal slit" + (pc.vaginas.length == 1 ? "" : "s") + " as the other occasionally spreads them open so the first can dig deeper.");
				else output(" somehow finds itself against your bare groin while the other rubs at your chest. No matter how hard you try, the instinctual need to stimulate yourself is met with subpar sensitivity that amounts to little more than a tickle. Luckily the efforts of the butt bugs, along with the female’s senses and your roaming hands is enough to provide all the stimulation you need.");
				output(" With your hands out of their penetrative equation, you’ve been promoted to being the person who masturbates in a threesome. The only difference is that since the other two are fucking inside of you, it feels like you are the one that is receiving the dicking.");
				output("\n\nIs it just you, or is your orgasm arriving faster than usual? It must be the dual sensory signals you’re receiving as your own [pc.asshole] is spread and the female’s experiences turn her experiences into your own. As your pleasure nears its peak, the anal parasite shoves the male into you both with more fervor than before. It seems the nerve link you share is a two way street. It’s unlikely you’d both orgasm at the same time otherwise. The cock-like insect goes off first as his base contracts, pumping thick gooey semen into his feminine counterpart. By sheer force, some of his seed even manages to reach the depths of your actual anus. The warm fluid being pumped into your orifices sets both of you off, while both of your sphincter lined organs clench around the throbbing shaft of insect meat inside you.");
				output("\n\nYour anal-embedded parasite squirts her own greenish liquid glee out around him onto the floor as");
				if(cIdx >= 0 && vIdx >= 0) output(" both your masculine and feminine organs undergo their own separate orgasms. The veins of your [pc.cocks] throb while " + (pc.cocks.length == 1 ? "its" : "their") + " urethra" + ((pc.cocks.length == 1 && !pc.cocks[0].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) ? " bulges" : "s bulge") + ", pumping your seed out from " + (pc.balls >= 2 ? "your balls" : "your prostate") + " to meet the brisk air and make stains wherever it lands. Your vaginal lips quiver from their stimulation as they too wet the ground and your digits with their [pc.girlcum] discharge.");
				else if(cIdx >= 0) output(" " + (pc.balls >= 2 ? "your balls churn and pump their" : "prostate clenches and pumps its") + " [pc.cum] load through your urethra" + ((pc.cocks.length == 1 && !pc.cocks[0].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) ? "" : "s") + ". Streams of your jizz fly through the air to splatter on whatever surface they find until your supply runs out and you’re left with half hard cock" + (pc.cocks.length == 1 ? "" : "s") + ".");
				else if(vIdx >= 0) output(" your digits dig deep into your vagina" + (pc.vaginas.length == 1 ? "" : "s") + " one last time so there is at least something to squeeze around. Each of your phalanx appendages feels the force of your muscles clenching around them while they are covered in your [pc.girlcum]. The hand on your clit" + (pc.totalClits() == 1 ? "" : "s") + " tries to milk the orgasm for as long as it can, but you’re soon just too sensitive to touch, and you resolve to just ride out what’s left of your pleasures.");
				else output(" your mind undergoes orgasmic highs that are both yours and not. The sexual bliss from the female in your ass mingles with the explosion of nirvana throughout the entirety of your form, leaving your mouth agape from sensory overload. Not long afterwards you regain conscious control of your body, with the slowly softening cock of the male still in the grip of your parasite.");
				output("\n\nThe now finally satisfied female bug finally lets go of her masculine counterpart, and you witness him splash into the puddle of sexual fluids below. She gathers what sperm of his managed to leak out around your [pc.ass] before her tendrils disappear once more into her protruding orifice. Man that took a lot out of you. The floor looks so damn comfortable now. Against possible better judgement, your body has decided to spend a minute or two on the floor to rest.");
			}
			// if hasFemaleInside = false
			else
			{
				output("\n\nWherever your ass moves, he orientates his point towards your pucker. Like a turret on auto aim, your overeager animate insectoid dildo positions itself to enter you as you lower yourself onto him. His oddly humanoid dickhead teasingly prods at your sphincter as you play a little with his instincts. Each time it seems like he’s going to go in, you raise your backside and watch as his spindly legs start quivering from being denied entry. Not wanting to break your toy before he can be used, you finally rest your [pc.asshole] on the tip of his cock and release your grip.");
				output("\n\nImpatience gets the better of him; his legs extend and he pops the smooth glans of his shaft past your anal ring before pressing onwards. You gasp as his initial entry takes you a bit by surprise and groan when he continues to forge onwards. His first inch parts your anal walls in short, rapid squelches, but he can go no further, since your ass is still too high for him to fully penetrate. You’re going to have to go even lower, but it’s gotta be timed right. In, out and down you go as you impale yourself upon the thrusting cock of your butt bug. The girth of his veiny insect dick carves its way into your rectum and is pulled out just as fast. Each thrust has him pull out all the way to his glans before it’s thrust right back in. Not even a second is given to get used to the presence of him in your ass; rather, all you can think of is how loud your moaning is.");
				
				pc.buttChange(ppButtBug.cockVolume(0));
				
				output("\n\nEvery thrust feels as intense as the initial insertion as it noisily slams itself against your derriere.");
				if(pc.hasBreasts()) output(" Your breasts sway as your body rocks with the force of your living dildo’s efforts.");
				output(" Your thoughts don’t extend any further than keeping your balance as");
				if(cIdx >= 0 && vIdx >= 0) output(" your phallus" + (pc.cocks.length == 1 ? "" : "es") + " jump up and down in the air and slap against your lower belly. The muscles of your cunt" + (pc.vaginas.length == 1 ? "" : "s") + " clench with every lunge of the insect’s cock, and " + (pc.vaginas.length == 1 ? "its" : "their") + " [pc.girlCumColor] lubrication increases in tandem to the amount of pleasure hitting your nerves.");
				else if(cIdx >= 0) output(" your cock" + (pc.cocks.length == 1 ? " bobs" : "s bob") + " with the reverberations of the ass-pounding you’re receiving. The underside of the male’s cock bumps your prostate each time he fully hilts himself, which jumpstarts your pre production. In no time at all your shaft" + (pc.cocks.length == 1 ? " has been covered in its" : "s have been covered in their") + " own [pc.cumColor] fluids.");
				else if(vIdx >= 0) output(" drops of [pc.girlCumColor] drip from the valley of your vaginal lips. While the base of the bug continues to slam against your ass, your inner labia quiver in response to the anal pleasure you’re receiving. The proof of your pleasures puddle below you and occasionally connect you and the floor with strands of [pc.girlcum].");
				else output(" a sense of warmth spreads from your ass towards to the rest of your body. It’s an indescribable heat,, almost as if a passionate flame has sparked itself within you. It builds and seems to have focussed upon the bare [pc.skinFurScales] of your groin as it becomes a source of pleasure on your mind.");
				output("\n\nThe dildo-like insect’s entry becomes slippery when what feels like his first drops of pre lubricates your anal walls. His climax must be close. A few last powerful thrusts signal his inevitable release until with the very last he fully hilts himself into the flashy tunnel of your anus. Shivers race up your spine as globules of his warm gooey semen squirt into your bowels and set off your own imminent orgasm.");
				output("\n\nWith barely a second to prepare,");
				if(cIdx >= 0 && vIdx >= 0) output(" both phallic and vaginal sides of your genitals go into orgasmic overdrive. " + (pc.balls >= 2 ? "Balls drawing tight" : "Prostate clenching hard") + ", your hips buck forward while [pc.cum] flies from your dick" + (pc.cocks.length == 1 ? "" : "s") + ". Meanwhile, the floor below you gets drenched in [pc.girlCum] from the spasms of your vagina" + (pc.vaginas.length == 1 ? "" : "s") + ".");
				else if(cIdx >= 0) output(" your cock" + (pc.cocks.length == 1 ? " throbs powerfully before its" : "s throb powerfully before their") + " urethra" + ((pc.cocks.length == 1 && !pc.cocks[0].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) ? "s dilate" : " dilates") + " with the oncoming liquid pressure. Your hips buck and " + (pc.balls >= 2 ? "your balls draw tight against you" : "your prostate clenches within you") + " while the stream" + (pc.cocks.length == 1 ? "" : "s") + " of [pc.cum] from your [pc.cocks] spray" + (pc.cocks.length == 1 ? "s" : "") + " and stain whatever is in " + (pc.cocks.length == 1 ? "its" : "their") + " path.");
				else if(vIdx >= 0) output(" your womanhood" + (pc.vaginas.length == 1 ? " releases its" : "s release their") + " feminine fluids and add to the already present puddle of [pc.girlcum]. The muscles within your feminine folds try to spastically clench onto a cock that isn’t there, causing you to buckle in the throes of your bliss.");
				else output(" your nerve system is set aflame in a lustful explosion. Your oversensitive bare groin and ass that radiate an ecstasy that leaves only calm happiness in its wake.");
				output(" The bug’s legs give out, and so does the rigidity of his penis. It slips out of you as the male insect collapses to the floor in a wet splatter of fluids. He’s so winded he doesn’t even care about his own seed that oozes out of your anus and onto his softening body. Post orgasmic drowsiness creeps up on you as well, and you become more sure by the minute that it wouldn’t hurt if you took a little nap.");
			}
			output("\n\nRecovering before you, the male bug slowly scampers towards his pod like a good little insect, climbing back in to rest further. It’s good to know he won’t just run off after you’ve used him. Then again he could have an ulterior motive. Who knows? You gather your gear before you once more lock the pod with the phallic insect inside it. Bringing this guy along was definitely a good idea.");
			output("\n\n");
			
			processTime(19);
			pc.addKeyValue("Butt Bug (Male)", 1, 1);
			IncrementFlag("BUTTBUG_MASTURBATE_MALE");
			
			pc.loadInAss(ppButtBug);
			pc.orgasm();
			
			addButton(0, "Next", mainGameMenu);
			break;
		default:
			output("<b>ERROR:</b> Event response not found!");
			output("\n\n");
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

// Loss
public function combatSandWormDefeat():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	
	var lustLoss:Boolean = (pc.lust() >= pc.lustMax());
	
	var buttBugM:StorageClass = pc.getKeyItem("Butt Bug (Male)");
	var buttBugF:StorageClass = pc.getStatusEffect("Butt Bug (Female)");
	
	var swfVariant:int = -1;
	if(!pc.hasAnalPregnancy() && rand(3) != 0)
	{
		if(rand(5) == 0) swfVariant = 2;
		else if(rand(3) == 0) swfVariant = 1;
		else swfVariant = 0;
	}
	
	var ppButtBug:PregnancyPlaceholder = getButtBugPregContainer(swfVariant);
	
	var cIdx:int = (pc.hasCock() ? rand(pc.cocks.length) : -1);
	var vIdx:int = (pc.hasVagina() ? rand(pc.vaginas.length) : -1);
	var cumQ:Number = pc.cumQ();
	var vWetness:Number = pc.wettestVaginalWetness();
	var analLooseness:Number = pc.ass.loosenessRaw;
	
	showSandworm();
	author("Preacher");
	
	if(lustLoss) output("Slime covered and breathing raggedly, you find yourself unable to resist your aphrodisiac-induced lusts. You fall to the ground, trying to relieve yourself. " + (!pc.isNude() ? "Your clothing just can’t come off fast enough, and there is no hesitation in the decision to rub yourself through it." : "You just can’t help yourself; your hands on your [pc.groin] feel so good."));
	else output("Bruised and beaten, that last knock hit you a little too hard, and now you’re finding it difficult to recover. No matter how you try, you just can’t find the energy to stand up or escape.");
	output("\n\nAfter silently checking you out for a moment, the worm re-burrows out of sight. For a second, it seems as if you lucked out of this encounter, but the thought quickly vanishes from your mind as tremors cause the ground to shake. An eruption occurs, and a column of sand rockets burst from the dunes before it falls back down. As the column crashes towards the ground, it scatters dust everywhere and forces you to");
	if(lustLoss) output(" stop your masturbation and");
	else output(" gather what strength you can to");
	output(" cover your face. When the dust settles, and you can finally see again, you feast your eyes on the full form of the worm in front of you. Only now do you see just how massive it actually is! It is almost twenty times longer than what you saw during the fight, like five or six mega busses placed in a row, front to back. The width however stays relatively uniform from its head until it tapers around its tail end.");
	output("\n\nThe worm you lost against slithers across the sand like some kind of serpent inspecting its latest victim. It doesn’t see you as a threat anymore, and as such sees little reason to stay underground. It is really reminiscent of the desert themed movies you watched as a kid where giant worms burrow through the sand. Only this one doesn’t really have a circular gaping mouth, full of teeth. Instead, this one is more like the mouth structure of a toothless snake, filled with several green tapered tip tentacles and constantly drooling emerald-colored slime.");
	output("\n\nBut you can’t dwell on that now. It’s either going to eat you, screw you, or give you a parasite, and none of those options sound really good.");
	if(lustLoss) output(" A nice screw would definitely help your little predicament, but then again, if it’s the parasitic kind it might not turn out in your favor.");
	if(buttBugF != null) output(" The parasite you already have is giving you enough issues as it is.");
	output("\n\nYou do your best to shimmy away, but your futile attempt to escape has only reminded you of the situation you’re in. The worm is much faster than you’ll ever be at this moment, and it’s right on you in seconds. From behind its jaws, there emerges four sets of pincer-ended appendages that all snap at your own limbs. Thoughts go through your head about whether it’s trying to kill you or restrain you as you move your arms and [pc.legOrLegs] in an evasive manner. Your answer is given when it snatches one of your arms and you discover that there isn’t a single sharp section in the entirety of the crab-like claws. Just lines upon lines of lime-colored soft tissue that act more like human fingertips than anything else.");
	output("\n\nYour moment of inspection has given the worm a perfect window of opportunity to get a hold of the rest of your body.");
	if(pc.isGoo()) output(" Unfortunately for the worm, your goopy body slips out of its pincers with little to no effort. The beast is momentarily stumped over what to do with you, and you are briefly filled with hope. However, that hope is very short-lived as the creature begins to drool an almost solid form of its slime onto you, which mixes with your own goo and dries it out very quickly. The consistency of your goop changes to that of a gummy candy which doesn’t hurt, but it has made it easier for the worm to actually grab onto you. Now it is child’s play for it to restrain you, and you find yourself completely in the clutches of the");
	else if(pc.isNaga()) output(" You’d think your coils would prove to be an issue for the sand worm, but no. Perhaps because it has fought with other worms in the past, it soon has your other arm as well as the entirely of your lower body’s length in its grip. You are now immobilized by the");
	else if(pc.isTaur()) output(" Rather awkwardly, but still strongly held, you’ve ended up looking like one of those animals that get carried by their legs. Now in the grip of the");
	else output(" You find yourself on your back, with both your legs and now your other arm trapped in the clutches of the");
	output(" cylindrical beast.");
	output("\n\nThere is little you can do in the department of struggling. But with what strength you can manage, you nonetheless try to break free. It’s no use. Your shaking limbs and squirming body are met with adamant resistance on the worm’s side, and the realization that you might just be completely helpless kicks in.");
	output("\n\nWith the six tentacles in its mouth, the creature has its way with what’s on your body. Expertly, it maneuvers its appendages to remove your [pc.gear] and chuck it sideways. Once your");
	if(!pc.isNude()) output(" now");
	output(" nude body is on display, slippery sounds emanate from its mouth as its pincers shift your form in such a manner as to lift your ass and expose your [pc.asshole]. When the sounds stop, it opens its mouth and starts drooling more of its slime. This time the target seems to be your exposed pucker. The goop is about body temperature and is actually sorta soothing in a strange way.");
	output("\n\nThe way it drips into your crack, only to be spread around and liberally cover your ass is so sensual. It is actually slippery enough that very miniscule amounts of it find their way into your anus regardless of your tightness. You could sell this stuff as top market lube! The sensuality of the situation has even");
	if(cIdx >= 0 && vIdx >= 0) output(" caused [pc.eachCock] and [pc.eachVagina] to swell");
	else if(cIdx >= 0) output(" made [pc.eachCock] harden and throb");
	else if(vIdx >= 0) output(" made [pc.eachVagina] moisten");
	else output(" your bare groin to heighten in sensitivity");
	output(". Wait a minute. You know exactly what this thing’s slime does. It’s spiking your hormones while it lubes your ass for " + (silly ? "its anal shenanigans" : "what it has in mind") + ".");
	output("\n\nShlicks and other slippery sounds divert your eyes to their source, and you’re greeted with the sight of several of its smooth tentacles making their way towards your anus.");
	if(silly) output(" You aren’t being filmed are you? A quick look around says no, but you’re hoping that you don’t end up on one of those sites that are loaded with all kinds of tentacle porn.");
	output(" What you’ve surmised to be it’s two-inch-thick tongues are already at your ass.");
	output("\n\nEach one looks as if it’s reluctant to go first. All of a sudden, the one in the middle prods its tip against your anal ring and pops it into you with little to no effort at all.");
	if(pc.analVirgin)
	{
		output(" What a way to lose your anal virginity: not a struggle, not an ounce of pain, and no uncomfortable stretching. Okay, you might be lying about the last one. It kind of felt as if your anus was one of those lengthy party balloons being filled with a slimy tentacle instead of air. <b>You’ve lost your anal virginity.</b>");
		// set pc.analVirginity to false, if analLooseness = 0: set analLooseness to 1
		if(analLooseness < 1) pc.ass.loosenessRaw = 1;
	}
	output("\n\nYour [pc.lips] pucker and your eyes squint at its uncomfortably effortless entry. Meanwhile, the tentacle wiggles around inside your rectum and spreads the slime further into you. You groan as your [pc.hips]");
	if(lustLoss) output(" buck along with the rhythm of the tentacle spreading lube in your anal passage, [pc.groin] further pumped with blood with your enthusiasm.");
	else output(" shake this way and that in an attempt to deter the worm from its anal invasion.");
	output(" The other tentacles prod their tips at your ass beside the first one as well.");
	output("\n\nThey poke and push");
	if(analLooseness <= 1) output(", but only the first fits inside you.");
	else if(analLooseness <= 2) output(" until a second slips in alongside its brother.");
	else if(analLooseness <= 3) output(" until two extra tongue tentacles slide into your ass.");
	else if(analLooseness <= 4) output(" until four of its lengthy tongues manages to pop in with the first.");
	else output(" until all six of its tentacular tongues slip into your rectal passage.");
	output(" " + (pc.ass.looseness() <= 1 ? "It is" : "They are") + " really digging into your ass, almost as if the worm is looking for something. After a couple of thrusts and inquisitive turns, " + (pc.ass.looseness() <= 1 ? "it retracts" : "they retract") + " from");
	if(buttBugF != null) output(" ‘your’ anal cavity. It must’ve found the parasite inside your rectum, and somehow you get the impression that they are kinda " + (swfVariant >= 0 ? "pissed" : "glad") + " with the discovery.");
	else output(" your anal cavity, and somehow you get the impression that they are kinda " + (swfVariant >= 0 ? "glad" : "pissed") + " with the discovery.");
	
	processTime(8);
	
	// [Insert next button]
	clearMenu();
	addButton(0, "Next", combatSandWormDefeatScene, ["intro", lustLoss, buttBugM, buttBugF, swfVariant, ppButtBug, cIdx, vIdx, cumQ, vWetness]);
}
public function combatSandWormDefeatScene(arg:Array):void
{
	var response:String = (arg.length > 0 ? arg[0] : "intro");
	
	var lustLoss:Boolean = (arg.length > 1 ? arg[1] : (pc.lust() >= pc.lustMax()));
	
	var buttBugM:StorageClass = (arg.length > 2 ? arg[2] : pc.getKeyItem("Butt Bug (Male)"));
	var buttBugF:StorageClass = (arg.length > 3 ? arg[3] : pc.getStatusEffect("Butt Bug (Female)"));
	
	var swfVariant:int = (arg.length > 4 ? arg[4] : -1);
	
	var ppButtBug:PregnancyPlaceholder = (arg.length > 5 ? arg[5] : getButtBugPregContainer(swfVariant));
	
	var cIdx:int = (arg.length > 6 ? arg[6] : (pc.hasCock() ? rand(pc.cocks.length) : -1));
	var vIdx:int = (arg.length > 7 ? arg[7] : (pc.hasVagina() ? rand(pc.vaginas.length) : -1));
	var cumQ:Number = (arg.length > 8 ? arg[8] : pc.cumQ());
	var vWetness:Number = (arg.length > 9 ? arg[9] : pc.wettestVaginalWetness());
	var analLooseness:Number = pc.ass.loosenessRaw;
	
	clearOutput();
	showButtBug(swfVariant);
	author("Preacher");
	clearMenu();
	
	switch(response)
	{
		case "intro":
			// if swGender = 0 && hasFemaleInside = false
			if(swfVariant >= 0 && buttBugF == null)
			{
				output("Uh oh... that means this must be the female parasite, and by the looks of your predicament it doesn’t seem like you’ll be walking away from this");
				if(hasParasites()) output(" without another parasite");
				else output(" alone");
				output(". Instinct takes over as this realization causes adrenaline to rush through your body. Strength born from desperation surges through you, and your struggle against the crab-like claws begins anew. You don’t know how you’re doing it, considering your previous state, but the once seemingly indestructible limbs that held you in place now shake from your thrashing.");
				output("\n\nInsectoid clicks and hisses emanate from the female worm as your newfound resistance makes it impossible for her to keep a grip on all of you. An arm slips free, and you use that opportunity to punch this bitch straight in the middle of what seems to be the forehead. The worm emits a pained screech when you do that, and it isn’t until you pull away that you see the large cracked impact your fist made in the chitin of the creature.");
				output("\n\nThey are actually kinda soft for their size. She shakes her head, recovering from your attack before her jaws open and screams straight at you like a hellish banshee, leaving you temporarily paralyzed with fear. A golden opportunity like none other, the pincer your arm escaped from recaptures your limb in a flash of movement. Cuffed by its claw yet again, you feel yourself falling, and are left nauseous.");
				output("\n\nImpact shoots through your form as she repeatedly smashes you into the sand. If it were any other sort of ground you’d really be receiving some serious damage, but all this really does is bruise you and sap your resolve. Sense of direction vanishes");
				if(silly) output(" as the blue danube plays in your head");
				output(", and the energy you gained from your adrenal reserves is slowly being drained from you. Any time it seems like you might try something, she once again thrashes you into the reasonably soft ground. Then she stops, and you’re raised once more into the air so that she can see whether or not she’s finally beaten the resistance out of you. It doesn’t take long before she truly has; you can still move, but it takes so much effort to do so that it doesn’t seem worth it. Now that her target is unable to do anything but submit, she can finally commence with her original plan for you. Lower to the ground you go until you’re almost a meter from the sand, and it is then that you hear odd creaks and cracks coming from the worm.");
				output("\n\nYou lift your head and notice that the rest of her has slowed down considerably, eventually leaving the entirety of her body in a statuesque stillness. With you still in its clutches, the worm’s cracked forehead chitin splits from the middle and swings open like a large double door cupboard. Strands of greenish slime connect the interior of the forehead chitin with the smooth lime flesh it once protected. In the middle of this exposed flesh there is an oddly vaginal slit that also drips a verdant fluid. The slit gapes all on its own, sputtering its fluids all over your lower extremities until the tip of what seems like an anal ring pokes through.");
				output("\n\nMore and more of its ringed form inches out while tiny nub-like legs reminiscent of a caterpillar’s can be seen underneath it. This must be the true form of the female controlling the worm. Your eyes widen as six tentacular tendrils deploy from her frontal orifice and wiggle in the air in front of you. Her tendrils touch the [pc.skinFurScales] of your butt cheeks before she completely plops out of the slit and onto the top of your [pc.asshole] like some strange form of birth. Though she is still relatively ooze covered, you can make out her");
				switch(swfVariant)
				{
					case 0: output(" beige colors and smooth, featureless textures"); break;
					case 1: output(" dark green colors and the lighter green nubs that dot her otherwise smooth dermis"); break;
					case 2: output(" orange stripe going along her top and bottom. This parasite’s much larger than she originally seemed. It’ll take a long time for your ass to recover from this, if it ever does"); break;
				}
				output(".");
				output("\n\nYou’d probably have been able to escape now, if not for that last series of hits you’ve received. The worm is probably nothing more than a goo-filled husk, now that the female has been ejected. For some reason all that she’s doing now is staring at your ass like a kid in a candy store. What is the parasite even doing? The answer is soon given as she squirts a translucent verdant green ooze onto your previously tongue-lubed anal ring, causing you to hiss through your teeth. It’s cool, yet it burns like when you apply a strong ointment to a sunburn, and leaves a sensually blissful sensation as she spreads it with her tendrils. What is the point of all this? If she’s planning to butter you up with a pleasurable massage is not going to... OH FUCK! Each stroke of her tiny, goop-spreading tentacles hikes your sensitivity up into levels you’d never have thought possible!");
				output("\n\nHeart beating, your blood rushes through your body, causing your");
				if(cIdx >= 0)
				{
					output(" [pc.cocks] to");
					if(pc.totalSheaths() >= pc.cocks.length) output(" slide from your [pc.sheath] as " + (pc.cocks.length == 1 ? "it" : "they"));
					else if(pc.hasStatusEffect("Genital Slit")) output(" slip from your genital slit as " + (pc.cocks.length == 1 ? "it" : "they"));
					output(" " + (pc.cocks.length == 1 ? "hardens and visibly bulges with its" : "harden and visibly bulge with their") + " veins");
					if(vIdx >= 0) output(". Your [pc.vaginas] go flush with need as well, and " + (pc.vaginas.length == 1 ? "is" : "are") + " already a drippy wet mess");
				}
				else if(vIdx >= 0) output(" [pc.vaginas] to blush with need as your girly fluids drip from your feminine folds");
				else output(" barren groin to flush with the need to be touched");
				output(". You could swear that there was pure evil in her bug-like eyes as she moves her feeler-like tendrils to much more naturally sensitive areas. It’s only light contact, but it feels like you’ve been edged for hours as she");
				if(cIdx >= 0)
				{
					output(" twirls her tendrils once or twice around [pc.eachCock]");
					if(vIdx >= 0) output(" and rubs their sides in between your vaginal lips");
				}
				else if(vIdx >= 0) output(" lightly prods the ends of her tendrils into [pc.eachCunt] and occasionally flicks [pc.eachClit]");
				else output(" tickles your bare groin with each of her six tendrils");
				output(". Her tendrils are like brushes that paint orgasmic pleasure across your extremities while she forces loud moans out of you with every ounce of air your lungs have.");
				output("\n\nWith your head thrown back and filling the air with exaggerated lewd sounds as the rest of your body is paralyzed with pleasure, you don’t notice when three of her six tentacles leave your groin. You’re only made aware of them when you feel their tips prodding at your [pc.asshole]. Already loosened by the worm’s tongues, there is no resistance when she triangularly gapes your butthole wide open with her tiny tentacles. Some of the newer goop drips into your anal depths and an almost choke-worthy gasp erupts from you.");
				output("\n\nYour eyes dilate as you continue to moan with the potent aphrodisiacs that’ve been directly injected into your system through your asshole. She pokes her head in along with the tendrils that were used to gape you, and undulates like the worm she is to get into you. Set aflame with lust, each time she wiggles more of her form within you, your anal ring turned erogenous zone pushes you closer to orgasm.");
				output("\n\nAs each of the rings that make up her body press up against your anal ring,");
				switch(swfVariant)
				{
					case 0: output(" they smoothly slip in"); break;
					case 1: output(" the nubs that decorate her body scrape against your ring as they pop in"); break;
					case 2: output(" they stretch your ring even more. Each of her body rings thicken considerably as they slide in"); break;
				}
				output(" and make a squelching noise when your backdoor re-clenches around the next section. The parasite is widest at her half-way point; she makes you groan in strangely pleasurable discomfort while her girthiest body ring stretches you. With held breath and clenched teeth, you brace yourself.");
				output("\n\nAs soon as the creature’s middle section slips past, the entirety of her form slides into you relatively effortlessly. One loud exhale exits you as the parasite stretches the rest of your anal passage with her body, and her tendrils retract from your most sensitive areas. A pinch is felt within your rectal walls once she’s fully in, and you experience feelings that aren’t yours. That final stretch and pinch pushes you over the edge so quickly that you don’t even know what’s going on anymore, apart from the sensations in your [pc.groin].");
				output("\n\nA wave of muscle spasms roll through you as you experience an orgasm enhanced by the aphrodisiacs that now course through you.");
				if(cIdx >= 0)
				{
					output(" Your [pc.cocks] unleash" + (pc.cocks.length == 1 ? "es" : ""));
					if(cumQ < 1000) output(" several thin spurts and dots your body");
					else if(cumQ < 10000) output(" thick volumous sprays and makes a mess of your body");
					else output(" geyser-like arcs and utterly covers your body");
					output(" with [pc.cum].");
					if(vIdx >= 0)
					{
						output(", while your [pc.cunts] spastically clench" + (pc.vaginas.length == 1 ? "es" : "") + " and");
						if(vWetness <= 1) output(" trickle" + (pc.vaginas.length == 1 ? "s" : ""));
						else if(vWetness <= 2) output(" drip" + (pc.vaginas.length == 1 ? "s" : ""));
						else if(vWetness <= 3) output(" secrete" + (pc.vaginas.length == 1 ? "s" : "") + " a stream of");
						else if(vWetness <= 4) output(" squirt" + (pc.vaginas.length == 1 ? "s" : ""));
						else output(" explosively squirt" + (pc.vaginas.length == 1 ? "s" : ""));
						output(" [pc.girlCum].");
					}
				}
				else if(vIdx >= 0)
				{
					output(" Your [pc.cunts] clench" + (pc.vaginas.length == 1 ? "es" : "") + " with orgasmic spasms and");
					if(vWetness <= 1) output(" trickle" + (pc.vaginas.length == 1 ? "s" : ""));
					else if(vWetness <= 2) output(" drip" + (pc.vaginas.length == 1 ? "s" : ""));
					else if(vWetness <= 4) output(" squirt" + (pc.vaginas.length == 1 ? "s" : ""));
					else output(" explosively squirt" + (pc.vaginas.length == 1 ? "s" : ""));
					output(" " + (pc.vaginas.length == 1 ? "its" : "their") + " [pc.girlCum].");
				}
				else output(" Your nerves explode with a lustful heat that radiates outwards from your [pc.asshole] and bare groin. As the sensations ebb from you, they leave only bliss and the occasional muscle twitch.");
				output(" One last twitch in your limbs sends you falling towards the sand not far below as the pincers of the worm snap off with a loud crack, shattering once you hit the muddy mess that is the ground. To crawl away from the statuesque worm is all you can really do at the moment. Ass still sore, and the rest of you still sensitive from the female’s deeds, you slowly regain your strength as you regather your [pc.gear].");
				if(pc.isGoo()) output(" At least your gooey consistency has more or less returned to normal.");
				output(" Maybe you could try and extricate the worm from your asshole?");
				output("\n\nJust as your hand nears your crack, it is flicked away by an absurdly strong yet tiny tentacle that disappears back into your ass just as fast as it came. You try again, but the same thing happens over and over again. That’s it! Hand being used as bait this time, it is flicked once more, but this time you’ve grabbed onto the tendril with your other hand. It’s slippery with greenish slime, but you’ve got a good grip on it.");
				output("\n\nYou pull at it, but every time you do so there’s extreme pain that shoots through your spine that almost causes you to lose your grip. Could she have already merged with you?");
				if(pc.isGoo()) output(" Are they so good with goop that they can even stay inside your body?");
				output(" Curious to check, your free hand is not whipped away in this instance. She must be acting cautiously, not wanting you to grab any more of her little tentacles. With inquisitive digits, you explore your butthole with tactile sensory reception as your guide.");
				
				pc.buttChange(ppButtBug.cockVolume(0), false);
				
				output("\n\nShe’s");
				switch(swfVariant)
				{
					case 0:
						output(" not that big all things considered, but she does remind you of one of those large butt plugs you’d see in anal focused videos on the extranet.");
						if(analLooseness < 2) {
							output(" <b>You’ve been stretched out a little though.</b>");
							// set pc.analLooseness to 2
							pc.ass.loosenessRaw = 2;
						}
						break;
					case 1:
						output(" a little bigger than you thought, and really reminiscent of those bluntly spiked butt plugs in more niche anal toy markets.");
						if(analLooseness < 3) {
							output(" <b>It was rough but you made it. Your anal ring has been stretched by a reasonable degree.</b>");
							// set pc.analLooseness to 3
							pc.ass.loosenessRaw = 3;
						}
						break;
					case 2:
						output(" absolutely fucking huge! How the hell is your ass even able to take her!? You could now be nominated for size queen contests and possibly win every time.");
						if(analLooseness < 5) {
							output(" <b>You could probably hide a rolled up pillow in your ass now if there wasn’t already a parasite in there.</b> Maybe even then.");
							// set pc.analLooseness to 5
							pc.ass.loosenessRaw = 5;
						}
						break;
				}
				output("\n\nIt feels as if your pucker is just a little bit more pronounced than usual, and it would seem that it still feels like your own anal ring. But you’re not receiving a direct nerve signal, almost as if you’re experiencing sensation through her. You take a snapshot of your pucker with your codex as your asscheek is spread by the tentacle in your hand.");
				if(pc.exhibitionism() < 50) output(" You’ve gotta remember to delete it after this. It’d be too weird and embarrassing to explain the contents of the picture to anybody");
				else output(" It’s gonna be so hot to show this close-up to everyone you know later, you’re already tingling with excitement at the prospect of people having such a personal picture of you with them");
				output(". It’s kind of a close shot but there is enough detail to discern what’s going on.");
				output("\n\nExcept for the discoloration, it’s definitely not what it was before. Although you suppose that even if you showed your asshole to someone they’d likely not be able tell if something’s off unless they were a medical professional. There are color spots in the shot that make it look like she’s taking on your own skin’s color. A second shot confirms this, showing that she’s almost completely blended in to be exactly like your butthole, except for the tentacle sticking out of it. Seems the situation can’t be helped for now. You let go of the tendril and scrunch your face as it quickly slips back into your ass. This time the sensation was much like your own. It looks like she’s fully merged with your nerves too. Whelp, guess you’ve gotta find a professional if you want her out of you. Either that or have access to some high quality immunity treatments.");
				output("\n\n");
				
				attachButtBugFemale(swfVariant);
				
				processTime(19);
				
				pc.orgasm();
				
				CombatManager.genericLoss();
			}
			// if swGender = 0 && hasFemaleInside = true
			else if(swfVariant >= 0 && buttBugF != null)
			{
				var newBug:int = swfVariant;
				var oldBug:int = buttBugF.value1;
				// invasion success
				var success:Boolean = false;
				if(newBug == oldBug) success = (rand(2) == 0);
				// power triangle game
				if(newBug == 0 && oldBug == 1) success = true;
				if(newBug == 1 && oldBug == 2) success = true;
				if(newBug == 2 && oldBug == 0) success = true;
				
				output("Not another one. The one already in you might have been livable, but you’ve no idea how this’ll turn out. Before you can think any further, there is a very deep, loud, bubbly sound emanating from the maw of the large sand worm. It opens wide as you squint your eyes in preparation for what’s to come. A rumbly squirt is heard, and you briefly witness a thick spray of deep green liquid before it hits your face. Your world blackens as the goop forces you to shut your eyes, and you feel the rest of your body being liberally covered with even more slime.");
				output("\n\nYou shake your head to get the goop off your face, and finally open your mouth to breath once it’s not so covered anymore. As you dislodge the ooze from your face, the air is filled with drawn out creaks and cracks that grow more silent as your [pc.face] gets clean. Lashes heavy with sticky fluids, it’s a struggle to get them open again, but through effort and determination you finally peel them from each other to view the world once more.");
				output("\n\nYour [pc.eyes] set themselves on the already open forehead chitin of the female’s worm and widen further as you realize just what type of slime you’re utterly covered with. The slime’s sensitivity raising and lust-inducing drugs seep into you like a contact poison. It hits you hard and fast, your eyes dilate as the entirety of your form is set ablaze in a heat of ecstasy. Even the occasional breeze brings forth moans and sends your system into pleasurable shivers. Your body is quick to respond to the drugged stimulation, writhing in response to even the lightest of touches and is rattling the cage of claws you’re in.");
				output("\n\nThe heightened passion in your blood has");
				if(cIdx >= 0)
				{
					output(" [pc.EachCock] throbbing as " + (pc.cocks.length == 1 ? "it" : "they"));
					if(pc.totalSheaths() >= pc.cocks.length) output(" slide" + (pc.cocks.length == 1 ? "s" : "") + " from your [pc.sheath] and");
					else if(pc.hasStatusEffect("Genital Slit")) output(" slip" + (pc.cocks.length == 1 ? "s" : "") + " from your genital slit and");
					output(" rise" + (pc.cocks.length == 1 ? "s" : "") + " to full erectness.");
					if(vIdx >= 0) output(" Your [pc.cunts] flush" + (pc.vaginas.length == 1 ? "es" : "") + " with your lust as well, having already started to drip [pc.girlCum].");
				}
				else if(vIdx >= 0) output(" [pc.EachCunt] quivering with a need to be touched. Your [pc.clits] have even made an appearance, and accompany the leakage of [pc.girlCum] from your feminine folds.");
				else output(" broken the knob off on your bare groin’s sensitivity levels, to the point of the entire region being like one giant clit. Even the movement of your skin around your groin is enough to bring more pleasure to your mind.");
				output("\n\nThere is little time before the chitin gets too weak to keep you, and the female knows this. Not to mention that the fight with the rival female parasite you’re already housing is going to eat up her time as well. So lost in the throes of your pleasures you are that you barely even notice the female plopping out of the vagina-like slit. She lands squarely onto your ass, and your [pc.hips] twitch as she makes contact with your posterior. A quick glance tells you she’s");
				switch(newBug)
				{
					case 0: output(" beige and relatively featureless"); break;
					case 1: output(" a dark green with lighter green nubs"); break;
					case 2: output(" quite large with an orange stripe across her top and bottom"); break;
				}
				output(". Her nubby little feet wiggle across your asscrack and produce a sensual vibratory sensation that gets stronger the closer she gets to your [pc.asshole].");
				output("\n\nThe female in your rectal cavity senses the aphrodisiacs in your system and suddenly her activity inside you kicks up several gears. You gasp as all four of her available tendrils shoot out of your anal ring at the same time, grabbing onto the external bug as she’s lifted into the air to be thrown off. But the invader won’t be so easily shaken. She deploys her own tiny tentacles, each one grabbing hold of your parasite’s tendrils. Like your ass isn’t even your own, your butt bug puppets your ass to move it in frantic motions as she tries to shake her opponent off. With two tendrils to spare, the one outside your butt circumvents her defenses and hooks her tentacles into your actual anal ring alongside your merged female. She pulls herself closer to your rectum every second, while her other four appendages contend with the tentacles that try to push her away.");
				output("\n\nThis external battle is ultimately futile as the invader has more tendrils available, and realizing this, the bug in your ass withdraws her tentacular feelers. Suddenly without resistance, the outside parasite wetly falls once more onto your butt, this time straight on your asshole. Like a thunderous gong, her impact sends a wave of pleasure throughout your form that has your eyes rolling to the back of your head with a loud gasp.");
				if(cIdx >= 0)
				{
					output(" Your [pc.cocks] twitch" + (pc.cocks.length == 1 ? "" : "es") + " as [pc.cumColor] pre covers your shaft" + (pc.cocks.length == 1 ? "" : "s"));
					if(vIdx >= 0) output(" and a few spurts of [pc.girlCum] erupt from your [pc.cunts]");
					output(" in response to the shockwaves of that last wave of sensation.");
				}
				else if(vIdx >= 0) output(" Your vaginal lips clench, and a few spurts of [pc.girlCum] are sprayed in response to the impact before the flow goes back to a trickle.");
				else output(" Your body breaks out into a sweat as the flames of passion within you heat you to perspiration.");
				output("\n\nJust when you thought you could lift your head to look at what was going on, the outside insect rears all six tendrils to ready her entry. Her tentacles fully invade your butthole while she spreads your [pc.asshole] and pokes most of her front in. She wiggles her form into you and has you grunting with effort to not scream. Once she is halfway in, the rest of her slips in with blissful speed, making you groan all the more as your rectal walls are stretched even more, in order to fit both of the parasites!");
				
				pc.buttChange(ppButtBug.cockVolume(0), false);
				
				if(analLooseness < 4)
				{
					output(" <b>Your anus is stretched by a large degree as it struggles to encompass both of the parasites.</b>");
					// set pc.analLooseness to 4
					pc.ass.loosenessRaw = 4;
				}
				output("\n\nA pinch inside your rectum is felt");
				if(cIdx >= 0) output(" next to your prostate, making your dick" + (pc.cocks.length == 1 ? " spurts" : "s spurt") + " even more [pc.cumColor]");
				output(", and you throw your head back in sensory bliss, mouth agape with ragged sounds that barely escape your throat. The sensations prove to be too much for you, and in an act of desperation your arms flex and completely break off the weakened pincers that hold them. Your upper body flops downward and causes a chain reaction of cracks that break you free from the rest of the crab-like claws before you fall about a meter towards the sand below. A tiny crater into the sandy earth is made from your impact, and your body burns with its hyped up sensitivity.");
				output("\n\nAs you writhe along the ground, most of the goop is scraped off and absorbed by the sand, causing you leave a trail of green sticky sand wherever you go. With the ooze off of your body, your sensitivity starts returning to normal levels and you can finally breathe a sigh of relief, despite the nagging lust still left over in your system. Loud moans emanate from you as the parasites in your ass begin fighting within your rectal passage, and you’re ‘reminded’ of their presence. Like a full washing machine, the parasitic contents of your ass spin and tumble with relentless aggression.");
				output("\n\nYou see a chance to end this quickly, but your incessant needs scream at you to take care of them. You’ve no choice but to try and do both at the same time. Instinctually, one of your hands go to your [pc.groin] while the other already has its digits prodding against your [pc.asshole]. There is no greater pleasure in this situation than to finally have your hand on");
				if(cIdx >= 0)
				{
					output(" " + (pc.cocks.length == 1 ? "your cock" : "one of your cocks") + " after you’ve been unable to stimulate " + (pc.cocks.length == 1 ? "it" : "them") + " this entire time. Unfortunately though, you can’t use both hands for stimulation,");
					if(vIdx >= 0) output(" and your [pc.cunts] will have to wait for now, as");
				}
				else if(vIdx >= 0) output(" your vaginal lips to give them the stimulation they’ve been craving. Proper fingerfucking will have to wait though, as");
				else output(" bare sensitive groin. There isn’t any genitals there but it may as well be an erogenous zone on its own. If only you could use two of your hands but there is no time for that, but");
				output(" you have a few bugs to remove. It’s sensitive, but your overstretched pucker makes it easy for your entire hand to fit inside.");
				output("\n\nThe females go still once you start searching around, but continue when they realize they can use you. Now instead of tumbling around each other, each actively tries to push the other towards your palm. One gets overpowered and is nudged directly into your hand. It’s slippery, but your grip stays true as you start pulling her out of you. Your anal ring stretches around your hand and the parasite in your grip, while greenish slime covers all of what’s been inside you. The female’s body is like a progress bar to your inevitable orgasmic end, and inches you closer and closer to climax as more and more of her is pulled out.");
				output("\n\nMoaning and breathing raggedly, your orgasm hits you like a ton of bricks as the entire bug is finally pulled out with a squelching sound that comes from your rapidly closing anus. She is chucked to the side as");
				if(cIdx >= 0)
				{
					output(" your [pc.cocks] unleash" + (pc.cocks.length == 1 ? "es" : ""));
					if(cumQ < 1000) output(" several thin spurts, dotting your body");
					else if(cumQ < 10000) output(" thick volumous sprays, making a mess of your body");
					else output(" geyser-like arcs, utterly covering your body");
					output(" with [pc.cum]");
					if(vIdx >= 0)
					{
						output(" while your [pc.cunts] spastically clench" + (pc.vaginas.length == 1 ? "es" : "") + " and");
						if(vWetness <= 1) output(" trickle" + (pc.vaginas.length == 1 ? "s" : ""));
						else if(vWetness <= 2) output(" drip" + (pc.vaginas.length == 1 ? "s" : ""));
						else if(vWetness <= 3) output(" secrete" + (pc.vaginas.length == 1 ? "s" : "") + " a stream of");
						else if(vWetness <= 4) output(" squirt" + (pc.vaginas.length == 1 ? "s" : ""));
						else output(" explosively squirt" + (pc.vaginas.length == 1 ? "s" : ""));
						output(" [pc.girlCum]");
					}
					output(".");
				}
				else if(vIdx >= 0)
				{
					output(" your [pc.cunts] clench" + (pc.vaginas.length == 1 ? "es" : "") + " with orgasmic spasms and");
					if(vWetness <= 1) output(" trickle" + (pc.vaginas.length == 1 ? "s" : ""));
					else if(vWetness <= 2) output(" drip" + (pc.vaginas.length == 1 ? "s" : ""));
					else if(vWetness <= 3) output(" secrete" + (pc.vaginas.length == 1 ? "s" : "") + " a stream of");
					else if(vWetness <= 4) output(" squirt" + (pc.vaginas.length == 1 ? "s" : ""));
					else output(" explosively squirt" + (pc.vaginas.length == 1 ? "s" : ""));
					output(" their [pc.girlCum].");
				}
				else output(" your nerves explode with a lustful heat that radiates outwards from your [pc.asshole] and bare groin. As the sensations ebb from you, they leave only bliss and the occasional muscle twitch.");
				output(" As you gather your breath, you look to the side where the defeated bug lies.");
				output("\n\nBy the looks of it, it seems your original parasite has " + (success ? "lost" : "won") + ".");
				if(success)
				{
					attachButtBugFemale(newBug);
				}
				if(newBug == oldBug) output(" Then again, how could you know? The two parasites were identical, after all.");
				output(" Your [pc.hips] twitches once more as you feel another pinch in your ass");
				if(cIdx >= 0) output(" next to your prostate. It pushes just a little bit more cum from your cock" + (pc.cocks.length == 1 ? "" : "s") + " as you realize what’s happened.");
				output(" The winner must’ve just merged with you! You curse to the skies");
				if(silly) output(" and throw a little tantrum");
				output(" before regathering your [pc.gear] and walk off with a sore ass and a body that’s just a little too sensitive.");
				output("\n\n");
				
				processTime(19);
				
				pc.orgasm();
				
				CombatManager.genericLoss();
			}
			// if swGender = 1 && hasFemaleInside = false
			else if(swfVariant < 0 && buttBugF == null)
			{
				output("Its maw opens and you flinch as it screeches into your face and lets several more globs of its sticky slime redecorate your [pc.face]. Some of the stuff makes it into your mouth. It covers your [pc.tongue] and you’re hit with its surprisingly sweet flavor. You wouldn’t have expected that from a creature such as this. Like a swimmer expelling water you spit the majority of the semi-fluid out, in hopes that there won’t be any more. You expected to be absolutely drugged out of your mind because of this, but nothing comes from your face being sprayed. This goop could then only be saliva based and not loaded with aphrodisiacs. It seems like this worm wants you conscious for whatever it has planned. It must be disappointed that you do not have one of their species’ females, so it’s probably a male.");
				output("\n\nYou’re lifted into air, lurching as you get thrown like a cartwheel higher than the worm’s head. Surprisingly, he catches you mid fall. Once your view steadies, you’re greeted to a wormless sight with only it’s claws in your peripheral vision, still holding your limbs. Your position has been swapped, with him now behind you and you still in his clutches high above the ground.");
				output("\n\nWarm wetness runs down your sides as you see two of his tongues appear on both sides your chest. They tickle you and leave slick trails of green saliva wherever they slither and twirl around the");
				if(pc.hasBreasts()) output(" peaks of" + (pc.breastRows.length == 1 ? "" : " the top row of") + " your [pc.breastCupSize " + 0 + "] breasts.");
				else output(" pecs on your flat chest");
				output(". Your [pc.nipples] are flicked and played with until");
				if(pc.hasTentacleNipples()) output(" your [pc.nippleColor] tentacular nipples come out to play. Even your own nipples have betrayed you. They play with the slender tongues while you receive all of their sensitive tactile feedback.");
				else if(pc.hasNippleCocks()) output(" their [pc.dickNipples] slide out. The tongues seamlessly adapt to the situation, and now entwine around and jerk your newly revealed shafts, slickening them with slime from the tentacular tongues.");
				else if(pc.hasCuntNipples()) output(" you gasp as your vaginal nipple gashes open up and secrete their juices. The tentacular tongues find your [pc.nippleCunts] irresistible, and before you can even recover from their previous teasing, they penetrate your nipples with their tapered tips.");
				else if(pc.hasInvertedNipples()) output(" they harden and your hidden nipples pop out to join the party. With your sensitive nubs in the fray, the tongues swirl around them and mercilessly tweak your [pc.nipples].");
				else output(" they harden under the teasing of the tongues which continue to stimulate your [pc.nipples] even then.");
				output("\n\nMoans of pleasure escape you as a result of all the teasing, but they’re cut off as a third tongue slides over your shoulder and plugs your mouth with several inches of its slippery tip. No matter where your head shakes, the prehensile oral organ answers your resistance with clever twists and turns that keep it from slipping out. Like a tentacle beast, he forces his tentacle into your mouth and down your throat and slips his tongue in and out until a frothy mess forms around your [pc.lips]. You’d bite down, but then you’d either choke on its length within your throat, or get killed afterwards. So for now you let it do what it wants. The mixed saliva froth spreads around the majority of his tongue’s length, and dribbles down your chin. Most of it forms a stream that flows down your [pc.chest], continues past your " + (!pc.isTaur() ? "groin" : "tauric half’s front") + ", and forms strands as it falls to the sand below.");
				output("\n\nAll further sounds from you muffled, he continues his oral assault on your body. His other three tapered tongues");
				if(!pc.isTaur()) output(" sneak their way towards your lower back. One pokes its tip into your asscrack, while the other two fork away from each other to go around your [pc.hips] while pointing straight at your [pc.groin].");
				else
				{
					output(" wander over the back flanks of your multi-legged half. One slithers between your tauric ass cheeks, while the other two continue their trip across your body until");
					if(cIdx >= 0 && vIdx >= 0) output(" one finds [pc.eachCock] below your lower body while the other finds [pc.eachCunt] beneath your lubed pucker.");
					else if(cIdx >= 0) output(" they find [pc.eachCock] below your lower body.");
					else if(vIdx >= 0) output(" they find [pc.eachCunt] at the back of your body.");
					else output(" he realizes that you truly have no genitals to speak of. His targetless tongues resolve to join their brother at your pre-lubed asshole.");
				}
				output("\n\nThe first of his last three tongues delves further into your [pc.ass], where it finds your [pc.asshole] and without hesitation rams itself into your anal depths. You give grunts of discomfort that barely escape your tongue-stuffed mouth as several feet of its length is continuously shoved into your rectum. With most of the lube having dripped out of your ass you can now actually feel how your anal cavity is stretching to fit its two inch girth");
				if(analLooseness > 2) output(", not that there is much stretching involved for your experienced asshole");
				output(". Every thrust of tongue flesh bulges out your");
				if(pc.isTaur()) output(" tauric half’s");
				output(" abdomen, occasionally invading the deepest part of your intestinal tract and makes you feel each inch of just how stuffed you are!");
				output("\n\nThe last two tongues have nothing to do but torment you and their target, your " + ((cIdx >= 0 || vIdx >= 0) ? "[pc.groin]" : "[pc.asshole]") + " further. Their tips poke");
				if(cIdx >= 0 && vIdx >= 0)
				{
					output(" and slide around your groin until one wraps around your [pc.cock " + cIdx + "] and the other prods at your [pc.vagina " + vIdx + "]. The tentacle tongue around your cock continues to spiral around your shaft and quickly makes a slippery mess in your groin. You buck into it in an attempt to get more, but no matter your efforts it stays at its current tempo of twirl licking your dick.");
					output("\n\n");
					if(pc.cocks.length > 1) output(" The rest of your shafts seem doomed to receive no stimulation at all assuming things go on like this.");
					output(" While your cock was being stimulated in the worm’s frustratingly slow manner, his other tongue continues to prod at your lower lips. Why must he tease you so? You did lose to him but still, not at least penetrating you is torture in a situation such as this. Just as you thought you could take matters into your own hands and lower your [pc.hips], he penetrates you in one swift movement.");
					if(pc.vaginalVirgin)
					{
						if(pc.vaginas[vIdx].hymen) output(" A high pitched whimper comes from you, muffled by the tentacle still stuck in your mouth as your hymen is torn. But it was so worth it!");
						output(" <b>Your vaginal virginity is lost along with your hymen.</b>");
						
						pc.cuntChange(vIdx, ppButtBug.cockVolume(0), false);
					}
					else pc.cuntChange(vIdx, ppButtBug.cockVolume(0));
					
					output("\n\nFinally!");
					if(pc.vaginas.length > 1) output(" Too bad your other cunts can’t get any action.");
					output(" Deeper and deeper his tongue goes, scraping along your vaginal walls until it hits your cervix and can go no further. It tries to push forward, but cannot, and resolves to continue its vaginal exploration as it thrusts into you repeatedly. Occasionally he shoves in more of his tongue’s length than your cootch can handle and coils quite a lot of it inside you before it goes back out again. His dual gendered assault on your erogenous senses");
				}
				else if(cIdx >= 0)
				{
					output(" into the sides of your shaft" + (pc.cocks.length == 1 ? "" : "s") + ". Right as he finds your cock" + (pc.cocks.length == 1 ? "" : "s") + " his tentacular organs swirl around " + (pc.cocks.length == 1 ? "it" : "them") + " in a death grip of slippery flesh. Tighter and tighter they get until you’re almost certain that the blood supply to [pc.eachCock] has been cut off, but the throbbing of your masculinity continues. With a mixture of pain and pleasure, the green tapered appendages pump your manhood with relentless tightness, making you wonder if you’re actually in the clutches of a poorly programmed cock milker.");
					output("\n\nYou whimper through the tongue in your mouth as the pressure in your dick" + (pc.cocks.length == 1 ? " reach its" : "s reach their") + " maximum, and the torturously pleasurable ring of tentacles reaches the tip" + ((pc.cocks.length == 1 && !pc.cocks[0].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) ? "" : "s") + " of your [pc.cocks]. You moan in sensual relief when the tongues’ grip descends back towards the base of your crotch. The tentacle tongue in your ass causes [pc.cumColor] pre to leak out of your urethra" + ((pc.cocks.length == 1 && !pc.cocks[0].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) ? "" : "s") + " in large amounts as it slides itself across your prostate. Repeated bouts of this painful jerking of your shaft" + (pc.cocks.length == 1 ? "" : "s"));
				}
				else if(vIdx >= 0)
				{
					var vags:Array = [];
					var vIdx0:int = -1;
					var vIdx1:int = -1;
					for(var v:int = 0; v < pc.vaginas.length; v++)
					{
						vags.push(v);
					}
					if(vags.length <= 0) vags.push(vIdx);
					if(vags.length > 0) {
						vIdx0 = vIdx;
						vags.splice(vags.indexOf(vIdx0), 1);
					}
					if(vags.length > 0) {
						vIdx1 = vags[rand(vags.length)];
						vags.splice(vags.indexOf(vIdx1), 1);
					}
					
					output(" and slide through the wet indentation that is your vaginal lips. They slip and slide against each other on [pc.eachCunt] as they make you shakily breathe your pleasures through your nostrils. Each time they rub your cleft" + (pc.vaginas.length == 1 ? "" : "s") + " they tease you by brushing against your [pc.clits], but just enough to barely feel it. If only they’d properly give you the pleasure you crave.");
					output("\n\nYou loudly moan through the tongue flesh in your mouth as your hopes are answered and");
					if(vIdx0 >= 0 && vIdx1 >= 0)
					{
						output(" one parts the lips of your [pc.vagina " + vIdx0 + "] and the other penetrates the fleshy veil of your [pc.vagina " + vIdx1 + "].");
						if(pc.vaginalVirgin)
						{
							if(pc.vaginas[vIdx0].hymen || pc.vaginas[vIdx1].hymen) output(" A tear forms in your eye as your hymen is broken.");
							if(pc.vaginas[vIdx0].hymen) output(" Your first vagina’s virgnity has technically been taken.");
							if(pc.vaginas[vIdx1].hymen) output(" Your second vagina’s virgnity has technically been taken.");
							output(" Pretty soon the pain is replaced with pleasure, although these tentacles might have been just be a bit thicker than you wanted for your first time.");
							
							pc.cuntChange(vIdx0, ppButtBug.cockVolume(0), false);
							pc.cuntChange(vIdx1, ppButtBug.cockVolume(0), false);
						}
						else
						{
							pc.cuntChange(vIdx0, ppButtBug.cockVolume(0));
							pc.cuntChange(vIdx1, ppButtBug.cockVolume(0));
						}
						if(pc.vaginas.length >= 3) output(" Unfortunately for you, he doesn’t have enough oral organs to use on your third pussy, but it clenches like it has a cock in it nonetheless.");
						output(" To have ");
						if(pc.vaginas.length >= 3) output(" two of your");
						else if(pc.vaginas.length == 2) output(" both of");
						else output(" your");
						output(" vaginal passage" + (pc.vaginas.length == 1 ? "" : "s") + " stretched like this is truly a wonderland of pleasure. His tongues spread your labia around their 2-inch diameter as they twist and turn inside your vaginas. Your moans reverberate through your stuffed maw while their deep thrusts batter against your cervices, but luckily for you they never manage to enter them");
					}
					else
					{
						output(" one, then the other tongue parts your labial lips and penetrates into your vaginal passage.");
						if(pc.vaginalVirgin)
						{
							if(pc.vaginas[vIdx].hymen) output(" You tear a little bit at the rather painful loss of your virginity, but as you bear through it pain turns into pleasure and soon you find yourself enjoying it.");
							output(" <b>You’ve lost your vaginal virginity to tongues.</b>");
							
							pc.cuntChange(vIdx, ppButtBug.cockVolume(0), false);
						}
						else pc.cuntChange(vIdx, ppButtBug.cockVolume(0));
						
						output(" The tongues twirl around themselves into a helix as the worm orally fucks your [pc.vagina " + vIdx + "] with as much roughness as he can muster. So deep does he thrust his tongues that they threaten to penetrate your cervix. Luckily though, they never do, but continue to use their tips as battering rams regardless");
					}
				}
				else
				{
					output(" alongside the one that’s been continually railing your ass, trying their luck at getting into your tongue fucked pucker. Their tips");
					if(analLooseness >= 3) output(" easily slide in next to the first");
					else
					{
						output(" knead at your already stretched hole before they too slip into the pre-lubed ring and <b>stretch out your anal passage</b>");
						// set pc.analLooseness to 3
						pc.ass.loosenessRaw = 3;
					}
					output(".");
					
					pc.buttChange(ppButtBug.cockVolume(0));
					
					output("\n\nBefore they get far, the newest two in your butt twirl around the first like vines around a tree and royally wreck your ass with their new triple helix configuration. As the last two go deeper into you, you feel their presence like a whisk in your rectum. Unlike the first, the twirling duo does not go all the way into your intestines. Rather, it would seem that the worm gets more enjoyment out of having you moan your pleasures as he continually thrusts his last two tentacular tongues in and out of your abused anal passage. Your nerves aflutter with penetrative stimulation, his continued misuse of your [pc.asshole]");
				}
				output(", leaving you a quivering mess of pleasure in no time at all.");
				
				output("\n\nWhat feels like an eternity passes, and all memory you have are flashes of your ass being deeply penetrated by tongue tentacles, and the rest of your body being painfully pleasured with no end. Your orgasm creeps up as muffled moans escape you and dopamine hits your mind with the climax of all the forced stimulation.");
				if(cIdx >= 0)
				{
					output(" You buck your [pc.hips] forward as your [pc.Cocks] erupt" + (pc.cocks.length == 1 ? "" : "s") + " with");
					if(cumQ < 1000) output(" several thin spurts");
					else if(cumQ < 10000) output(" thick volumous sprays");
					else output(" geyser-like arcs");
					output(" of [pc.cum] from your [pc.balls]");
					if(vIdx >= 0)
					{
						output(", while your [pc.vaginas] continuously clenches,");
						if(vWetness <= 1) output(" tricklling");
						else if(vWetness <= 2) output(" dripping");
						else if(vWetness <= 3) output(" secreting a stream of");
						else if(vWetness <= 4) output(" squirting");
						else output(" explosively squirting");
						output(" [pc.girlCum] around the tongue" + (pc.vaginas.length == 1 ? "" : "s") + " inside you");
					}
					output(". The sexual fluids coalesce into the greenish wet spot below you, making it all the muddier.");
				}
				else if(vIdx >= 0)
				{
					output(" Your [pc.vaginas] spastically clench" + (pc.vaginas.length == 1 ? "es" : "") + " around the tongues within you,");
					if(vWetness <= 1) output(" trickling");
					else if(vWetness <= 2) output(" dripping");
					else if(vWetness <= 3) output(" secreting a stream of");
					else if(vWetness <= 4) output(" squirting");
					else output(" explosively squirting");
					output(" their [pc.girlCum] before your juices mix with the greenish puddle below you already made by the creature’s saliva.");
				}
				else output(" Like a web set aflame from the center, your nerves light up, spreading orgasmic sensations with your thrice tentacle stuffed [pc.asshole] as the source of your pleasures. Pure bliss surrounds your mind once the sensory wave travels up your spine and hits your brain, leaving only sourceless happiness wherever it goes.");
				output("\n\nOnce your climax has ebbs away the tongues wetly retract from your body, and it seems for one brief blessed moment that you can finally rest from its torment. But you were wrong. Suddenly its pincers let go of you, and you fall into the muddy puddle of fluids that formed below. Splashdown is thankfully soft enough that you don’t receive any damage apart from your bruised pride and empty feeling orifices. You look up at the staring face of the sand worm in front of you and scowl as he stows away his crab-like appendages and set of tongues.");
				output("\n\nHe produces an insectoid snickering sound before the rest of him bundles the creature’s body into a coil. His head lowers and aims down at the middle of the coil disappearing into the ground, along with more and more of its length, until the tail points briefly into the air before it too vanishes into the sand. Jeez, what a jerk! Just dropping you after he’s done with you like that. Maybe you could try and find this guy and teach him a lesson. If not, then at least you could possibly spread a species wide message. But all that sounds like so much work, and you’re too tired to really be motivated about that.");
				output("\n\nEyes heavy from exhaustion, you doze off in the muddy sand and awake several hours later with somewhat sore muscles and");
				if(cIdx >= 0 || vIdx >= 0) output(" musky,");
				output(" greenish, dried out, cracked sand covering the majority of you. It is thankfully easy enough to clean yourself up, but it takes a while to find your equipment as it had been almost entirely covered in sand while you were out. Re-equipping your [pc.gear] takes a couple of minutes, but then you’re ready to go again. Hopefully there are no more worms for a while.");
				output("\n\n");
				
				processTime(19);
				// apply mild soreness effect
				soreDebuff(2);
				
				pc.loadInAss(ppButtBug);
				pc.orgasm();
				
				CombatManager.genericLoss();
			}
			// if swGender = 1 && hasFemaleInside = true
			else if(swfVariant < 0 && buttBugF != null)
			{
				output("Now that she’s been properly roused, your parasite’s tendrils slip out of your [pc.asshole] one by one. Each one that comes out makes slippery wet sounds and elicits a brief little groan from you. Finally, all four of her available tiny tapered tentacles wiggle in the air. What could only be the male in the worm sees this as a sign of acceptance from the female inside you, and already moves his worm into position to hold you while they fuck. The sandworm creaks and cracks while it slowly petrifies itself into a statue made of chitin. As soon as there is not a single inch of movement from the large creature, the chitinous forehead of the worm splits open in front of your ass and reveals its lime green flesh. An oddly vaginal slit sits in the middle of it all, and starts to ooze an emerald colored slime that soon starts to drip towards the sand below.");
				output("\n\nOut from the slit a spindly appendage comes forth, and another, and another, until there are six of what now look like insectoid legs that grip onto the exterior of the vaginal gash. Its legs have a webbing of verdant green slime between them and adds to its already slimy look. They start to flex, trying to pull out whatever it is they’re attached to. Slowly the green slit parts open around a bulbous object that, as it gets more exposed to the air, clearly reveals itself as some sort of base that these legs are attached to.");
				output("\n\nAfter the base pops fully out with a drawn-out squelch, the vertical opening closes once more, although not completely. The smaller insect’s angle changes downward, and you can now clearly see an almost cute mandible-based mouth, coupled with dark insectoid eyes that stare at you through their reflective glare. Along with the reveal of the male’s face, you can see six thin, tendril-like appendages along with one long, thick, veiny protrusion on top of his base that have not yet made it out of the oddly vaginal slit.");
				output("\n\nHe continues to push himself out, but there is a lot of resistance that it seems he just can’t get past. You notice that there are seams joining the thin appendages to his base, which get more and more noticeable with each passing second. While the male is busy, you think to yourself that this would be the perfect time to escape. But alas any body part you try to move feels as if it is asleep, likely induced by being locked into the position you’re in for an extended period of time. It is then that you notice the fingers on one of your hands moving without you even feeling it.");
				output("\n\nWhat the hell is going on? You look to your other hand and notice the same effect. It spreads to your arms, and soon the same happens to the rest of your body. It’s like you’re being puppeted around. Oh no, you realize. The female has taken advantage of your weakened state to take direct control over the majority of your nerves! All but your head has been taken over by your anal parasite, meaning that all you can do is witness the events unfold while your body becomes the female’s plaything.");
				output("\n\nShe moves your [pc.hips] towards the male that is still struggling to climb out of the orifice,and wafts your [pc.ass] in front of him. Your parasite’s tendrils have moved closer, and now lightly caress his face, as if she’s encouraging him to hurry up. With that, his attempts to escape suddenly turn frantic. One by one, the smaller protrusions suddenly snap away from their seams. Just when the last one goes, the male fully undergoes his proverbial birth through the green slit. Like a porn film in reverse, what was thought to simply be a thicker tendril fully reveals itself in all its cock-like glory.");
				output("\n\nHe flops onto your ass and balances himself with his spindly legs, as his pole of insect meat threatens to topple him over below the slit from whence he came. It’s very reminiscent of human dicks, and even has veins, although it does seem a bit oversized for the ‘little’ guy. Now on full display you can see his dick’s about twelve inches in length and looks to be about two inches in girth. If you don’t get back control of your body soon you’re going to have to deal with the female’s fertilized eggs inside you afterwards.");
				output("\n\nWith no time to lose, he flops his large dick over himself, slapping it squarely into your asscrack and the embrace of your female’s tendrils. Some of his cock teasingly rubs against");
				if(cIdx >= 0)
				{
					output(" the underside of your [pc.cocks] and " + (pc.balls >= 2 ? "balls" : "taint"));
					if(vIdx >= 0) output(", while some of it slides along your [pc.cunts]");
				}
				else if(vIdx >= 0) output(" your vagina, and even hits your [pc.clits] along the way");
				else output(" the flat of your bare groin");
				output(". You can still feel the sensations of your extremities, even though the rest of you is mostly numb. There is a large cracking sound from the larger worm and suddenly both of the bugs emit a tiny, frightened squeal. For good reason too, as you could scarcely gather your thoughts before all of the pincers holding you snap under your weight.");
				output("\n\nYou and the phallic insect fall towards the sand below, tumbling away from each other the moment you hit the soft ground, leaving the female’s tendrils still outside of you. A good couple of meters apart, you try and get up so you can escape. Haha! Finally, your arms are doing what you want them to as they lift you up! But you can’t feel them. Ah, fuck. She’s still got a hold of you.");
				output("\n\nIs this the true danger of these parasites? Once their host is properly weakened, do they take over permanently? No, that can’t be. Zombie-like and as if being moved around by some invisible puppeteer, your body rises and walks over to the male who is still trying to get up. As your body slowly treads over to him, you are filled with realization, dread and thoughts about how your life will be as a slave to the female’s egg-bearing desires. She makes you reach down and pick the male up. Now with throbbing phallus in-hand, she bends you over backwards, so far that you almost think your back might break.");
				output("\n\nYour arm moves to position the male’s cock head in front of your bug-occupied anus while his shaft is quickly surrounded by her twirling tentacles. The parasite’s lusts become your own as she wiggles within you and makes your");
				if(cIdx >= 0) output(" [pc.cocks] get erect and ooze [pc.cumColor] precum with the female’s stimulation of your prostate" + (vIdx >= 0 ? " while your [pc.cunts] twitch and leak their [pc.girlCumColor] fluids" : "") + ".");
				else if(vIdx >= 0) output(" vaginal lips twitch with need while your [pc.clits] poke from their hoods and [pc.girlCum] drips from your folds.");
				else output(" flat groin sensitive with the need to be touched and caressed.");
				output("\n\nStrands of slime connect the parasite’s aperture as she slightly expands herself within your [pc.asshole]. She then shoves the male completely inside ‘your’ rectal cavity. His abrupt and sudden entry makes you groan in discomfort and pleasure as you experience both your butt bug’s sensations as well as your own. She realizes that stimulating your parts will pleasure her as well, and moves your free hand towards your groin to experimentally stroke every inch of it.");
				output("\n\nAs you feel the duality of your and her anally penetrative feelings, your controlled hand finds");
				if(cIdx >= 0)
				{
					output(" [pc.oneCock] and jerks it with unfamiliar yet pleasurable movements.");
					if(pc.cocks.length > 0) output(" The rest of your masculinity simply throbs futilely in the air, being ignored by the puppeted ministrations.");
					if(vIdx >= 0) output(" There is a twinge in your clefts, which causes the female to temporarily stop her jerking of your cock. Now aware of another source of pleasure, she leaves the stimulation of your dick to your thumb and index finger while she jills you vaginal lips with whatever digits are in range.");
				}
				else if(vIdx >= 0) output(" your [pc.cunts] and gives one long palm rub through the entirety of your pleasurable femininity. She finds [pc.oneCunt] too irresistable not to play with, and focuses all of your hand’s controlled attentions to vigorously frigging your feminine folds.");
				else output(" your featureless groin and gives it one or two testing pokes before she going utterly crazy in rubbing its flat, sensitive surface.");
				output("\n\nThe air is filled with your throaty moans of pleasure, but deep down you know that it isn’t really you that doing all of this. Your parasite makes herself as tight as possible around the cock of her mate when he’s pulled out by your other controlled hand, and loosens up when he enters. There are times when the male is shoved so deeply that he almost goes into your lower intestine, and you whimper as the female undulates her inner passage along his entire shaft. Being puppeted and used like this has sparked some deep perverted side of you that likes the mistreatment, and you creep closer to your inevitable climax.");
				
				pc.buttChange(ppButtBug.cockVolume(0));
				
				output("\n\nThe deep thrusts into the female in your ass increase in frequency, and the sources of pleasure from your own senses and hers are quick to bring you to orgasm. Both you and the female experience a simultaneous orgasm when she clamps down onto him and the male squirts his slimy green cum into your and her depths. All three of you convulse as you senses are overloaded and");
				if(cIdx >= 0)
				{
					output(" your [pc.cocks] unleash" + (pc.cocks.length == 1 ? "es" : ""));
					if(cumQ < 1000) output(" several thin spurts");
					else if(cumQ < 10000) output(" thick volumous sprays, making a tiny puddle");
					else output(" geyser-like arcs, making a large lake");
					output(" of [pc.cum] onto the sand.");
					if(vIdx >= 0)
					{
						output(" Meanwhile your [pc.cunts] spastically clench" + (pc.vaginas.length == 1 ? "es" : "") + " and");
						if(vWetness <= 1) output(" trickle" + (pc.vaginas.length == 1 ? "s" : ""));
						else if(vWetness <= 2) output(" drip" + (pc.vaginas.length == 1 ? "s" : ""));
						else if(vWetness <= 3) output(" secrete" + (pc.vaginas.length == 1 ? "s" : "") + " a stream of");
						else if(vWetness <= 4) output(" squirt" + (pc.vaginas.length == 1 ? "s" : ""));
						else output(" explosively squirt" + (pc.vaginas.length == 1 ? "s" : ""));
						output(" [pc.girlCum].");
					}
				}
				else if(vIdx >= 0)
				{
					output(" your [pc.cunts] clench" + (pc.vaginas.length == 1 ? "es" : "") + " with orgasmic spasms while");
					if(vWetness <= 1) output(" trickling");
					else if(vWetness <= 2) output(" dripping");
					else if(vWetness <= 3) output(" secreting a stream of");
					else if(vWetness <= 4) output(" squirting");
					else output(" explosively squirting");
					output(" their [pc.girlCum].");
				}
				else output(" the explosion of ecstasy radiating from your bare groin temporarily short circuits the female’s connection with your body. The sensory traffic sends your body into a twitchy mess of muscular movement until your climax ebbs from you, and control falls half and half into the female’s field.");
				output("\n\n");
				
				processTime(19);
				
				pc.loadInAss(ppButtBug);
				pc.orgasm();
				
				// [Next]
				// if willpower < 10: {play taken over bad end scene and game over} else: {play closing paragraph and continue adventure}
				addButton(0, "Next", combatSandWormDefeatScene, [(pc.willpower() < 10 ? "male bad end" : "male end"), lustLoss, buttBugM, buttBugF, swfVariant, ppButtBug, cIdx, vIdx, cumQ, vWetness]);
			}
			else
			{
				output("<b>ERROR:</b> Event response not found!");
				output("\n\n");
				
				CombatManager.genericLoss();
			}
			break;
		case "male end":
			output("The aftermath of your climactic sensory overload leaves you clear headed enough to slowly gain sensation in your body. Like feet that were asleep, your body tingles with pins and needles until those too fade and you’re finally left with your body as your own again. The first thing you do is straighten your back");
			if(silly) output(", before you gain champion baseball skills,");
			output(" and throw the male so far that he disappears from sight. You then clutch yourself in your own arms and just stand there as you bask in how it feels to have your body back. A tear almost escapes you, but the tendrils of your parasite slipping back into your asshole remind you just who you have the ‘pleasure’ of company with. You’ll have to be more careful, who knows if you will still have enough willpower to resist her next time. Groggy and with verdant green ooze dripping from your [pc.asshole], you regather your gear and prepare for the rest of your day.");
			output("\n\n");
			
			processTime(5);
			
			CombatManager.genericLoss();
			break;
		case "male bad end":
			output("Unfortunately for you, your will is simply not strong enough to resist when she returns to taking full control of your body. Though your mind is still untouched, the rest of your head joins the fray of what’s under her control. The male flops out of the female’s cavity, falls to the sand, and loses his erection, at which point he he can finally move around on his own. What comes next is hard to say for certain.");
			output("\n\nIt’s been a long time since you’ve been taken over, and you’ve been trying to ignore the atrocities your hilinara parasite has committed while puppeteering your body around.");
			output("\n\nYou can’t even remember how many eggs you’ve birthed, how large your harem of male bugs are, how many people you’ve kidnapped and infected, and how many years it’s been since you’ve lost control. Your parasite was pretty lucky to find a body as capable as yours, and she’s been quite busy as the puppeteer to your body. Now your body has become a queen, with a deep underground hive and a veritable kingdom of pregnant bellied raskvel breeders,");
			if(buttBugF != null && buttBugF.value1 == 2) output(" hybridized children,");
			output(" mind controlled lapinara scouts, and puppeted worm riding sydian soldiers. It might just be your parasite’s influence, but some part of you thinks it’s good to be the queen, ultimately relinquishing yourself to the worm hive entirely.");
			output("\n\n");
			
			processTime(50400 + rand(1441));
			
			if(buttBugF != null)
			{
				var eggs:int = 0;
				switch(buttBugF.value1) {
					case 0: eggs += (750 + rand(251)); break;
					case 1: eggs += ((750 + rand(251)) * 2); break;
					case 2: eggs += (20 + rand(31)); break;
				}
				
				createButtBugChild(buttBugF.value1, eggs);
			}
			
			processTime(720 + rand(1441));
			
			badEnd();
			break;
	}
}

// Removal
// Medical method could just be the generic wake up drowsy with a sore ass as V-KO says <i>“All B-type parasites have been successfully removed.”</i> for removal. Item removal I imagine will be weird if the bug just suddenly vanishes so this might be needed.
// Can be removed by going to any V-KO equivalent NPC.
// Can also be removed by the immunity booster item
public function removeButtBug():void
{
	resetButtBugEffects();
	pc.removeStatusEffect("Butt Bug (Female)");
}
public function resetButtBugEffects():void
{
	if(pc.pregnancyData.length > 3 && InCollection(pc.pregnancyData[3].pregnancyType, typeButtBugPregList))
	{
		pc.pregnancyData[3].cleanupPregnancy(pc, 3);
	}
	pc.removeStatusEffect("Butt Bug Egg Cycle");
	pc.removeStatusEffect("Butt Bug Message Cooldown");
}
public function removeButtBugImmunoBooster():void
{
	output("\n\nYou feel a pinch inside your ass, and get that feeling of really having to use the bathroom. Not sure whether it’s the real deal you rush to the " + (InPublicSpace() ? "closest lavatory" : "nearest spot you’d consider private enough") + ", but before you can get there, you feel several tentacular objects squirming");
	if(pc.isAssExposed()) output(" inside of your [pc.assCover], and");
	output(" around the outside of your ass. You groan in discomfort as your [pc.asshole] is stretched around the parasite that is now desperate to get out of your ass. The boosters must have somehow made your butt into a really unsavory environment the parasite living there. It pops out");
	if(pc.isAssExposed()) output(", squirms out of your [pc.assCover]");
	output(" and falls towards the ground while desperately trying to get away from you. Well... that worked. It would’ve been better if it didn’t leave you with a sore ass though.");
	// if in any butt bug pregnancies:
	var eggs:int = 0;
	if(pc.pregnancyData.length > 3 && InCollection(pc.pregnancyData[3].pregnancyType, typeButtBugPregList))
	{
		eggs += pc.pregnancyData[3].pregnancyQuantity;
	}
	if(eggs > 0)
	{
		output(" Slight nausea hits you as even the " + (eggs == 1 ? "egg in your gut is" : "eggs in your gut are") + " dissolved by the Immuno-Booster, leaving you with your usual non-pregnant belly.");
		// cancel butt bug pregnancy
	}
	if(pc.ass.loosenessRaw < 3)
	{
		output(" <b>Your anal ring has been stretched a little.</b>");
		// set pc.analLooseness to [pc.analLooseness + 1]
		pc.ass.loosenessRaw += 1;
	}
	removeButtBug();
}

// Character Description Blurb:
public function appearanceButtBugBlurb():String
{
	var txt:String = "";
	
	txt += "Inside your ass you are lugging around ";
	switch(pc.statusEffectv1("Butt Bug (Female)"))
	{
		case 0: txt += "a normal"; break;
		case 1: txt += "an overproductive"; break;
		case 2: txt += "a large"; break;
		default: txt += "an unknown"; break;
	}
	txt += " female variant of the hilinara insectoid parasitic species. What looks like your own [pc.asshole] is actually one of her protruding orifices. She’s merged with your nerves so what she feels will be directly transmitted to you, and she has sort of replaced all functions of your own rectum. You doubt that anyone except a trained medical professional would be able to remove her, or even tell that she was there.";
	
	return txt;
}

// Parasitism:
// While parasitized your minimum lust is raised by 15 and you will receive periodical reminders of the butt bug you are currently host to that increase your lust by a few points. Currently there are only 3 variants of the female parasites. All females lay eggs when the “anally filled” status effect is applied to the character while carrying the parasite, laying unfertilized ones that the female expels from the host after an hour of being filled by any creature that is not a male butt bug. Nyrean eggs and any other egg based anal pregnancies in the future take their effect instead of the butt bug pregnancy on account of female being tricked that there are already eggs that are incubating and will care for them until they look ready to be laid, in other words, normal nyrean or what have you pregnancy. If however the character is anally filled by a male butt bug then a different stage of parasitic anal pregnancy is induced to the player of whose effects vary depending on the type of female inside them. Unfertilized laying increases your lust by 40, on account of not enough stimulation during laying experience but it stimulates you nonetheless. A blurb to include into the character description is included below, it’ll probably fit best at the way bottom of char desc.
public function processButtBugParasitism(deltaT:uint, maxEffectLength:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
{
	// Auto preg for over-productive variant
	if(effect.value1 == 1 && target.statusEffectv1("Butt Bug Egg Cycle") == 1)
	{
		if(!target.hasAnalPregnancy())
		{
			var ppButtBug:PregnancyPlaceholder = getButtBugPregContainer(1);
			ppButtBug.impregnationType = "ButtBugPregnancy1";
			ppButtBug.createPerk("Fixed CumQ", 1000, 0, 0, 0);
			target.tryKnockUp(ppButtBug, 3);
		}
		else if(target.pregnancyData.length > 3 && target.pregnancyData[3].pregnancyType == "ButtBugPregnancy1")
		{
			// Timer loop check
			if(target.pregnancyData[3].pregnancyIncubation > 480) target.pregnancyData[3].pregnancyIncubation = 480;
			
			var eggCycleEffect:StorageClass = target.getStatusEffect("Butt Bug Egg Cycle");
			if(eggCycleEffect != null) eggCycleEffect.value2 += deltaT;
			// Adding eggs
			var eggs:int = Math.floor((eggCycleEffect != null ? eggCycleEffect.value2 : deltaT)/480);
			if(eggs > 0 && target.statusEffectv2("Butt Bug (Female)") <= 0) ButtBugPregnancy1.buttBugAddEggs1(target, 3, eggs);
			
			// Immobilization eject
			if(	target.pregnancyData[3].pregnancyQuantity >= 30 && target.hasStatusEffect("Endowment Immobilized")
			&&	target.statusEffectv2("Butt Bug (Female)") != 1
			&&	eventQueue.indexOf(expelButtBugEggImmobile) == -1
			) eventQueue.push(expelButtBugEggImmobile);
		}
	}
}

// Parasitism Flavor:
// Reminders: While parasitized you will get a reminder of your passenger at random intervals of hours between 6 and 24 just to give your universe a little extra flavor while not being overbearing with reminders, inspired by Kirbu. Each reminder increases your lust by 5 apart from a few exceptions.
public function messageButtBugParasitism(deltaT:uint, maxEffectLength:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
{
	var txt:String = "";
	var msgList:Array = [];
	msgList.push(1);
	if(target.hasLowerGarment() || target.hasUpperGarment()) msgList.push(2);
	msgList.push(3);
	msgList.push(4);
	msgList.push(5);
	msgList.push(6);
	// remove previous message to avoid simultaneous repeats
	if(msgList.indexOf(effect.value3) != -1) msgList.splice(msgList.indexOf(effect.value3), 1);
	var select:int = msgList[rand(msgList.length)];
	
	switch(select)
	{
		case 1:
			txt += "Without any warning, the bug up your arse has starts moving, having decided that it is going to rearrange itself inside you. It takes its sweet time doing so too, as it rolls around tickling your sensitive areas and occasionally prodding its head against your rectal walls before finally resettling. Everything it exists for seems to turn on its host.";
			target.lust(5);
			break;
		// Only available while wearing clothing.
		case 2:
			txt += ParseText("Something seems to be pulling at your [pc.underGarment]. Or rather pushing at it from the inside and tickling at your asshole. You look around to see if anybody is watching before discreetly looking at the back of your [pc.underGarments]. You are greeted with the sight of the butt bugs’ backside visibly making a miniature bulge against your [pc.underGarments]. You quickly swat at the parasite to get it to stop, startling it into going back up your ass faster than you would’ve liked. You experience the shock and pleasures of a singular yet quick penetration, and that leaves you wanting more.");
			target.lust(5);
			break;
		case 3:
			txt += "You occasionally catch yourself fantasizing about wandering the wastes of Tarkus with nothing on your mind except the hunt for male butt bugs to impregnate the parasite you are hosting. Resting afterwards until your belly swells with";
			switch(effect.value1)
			{
				case 0: txt += " parasitic eggs until they are ready to hatch"; break;
				case 1: txt += " a large number of parasitic eggs, bloating your gut until they are due"; break;
				case 2: txt += " a large parasitic egg that distends your midriff"; break;
			}
			txt += ". Then happily spreading your ass cheeks to birth your anal progeny, caring for them until they hatch, and then moving on to find another male. Most of the time you shake the fantasy off, but the thought that you might be better off being a prime carrier for these creatures always lingers at the back of your mind.";
			target.lust(5);
			break;
		case 4:
			txt += ParseText("The sensation of something slipping out of ‘your’ butthole strikes you out of the blue. Some ideas race through your mind of what it might be before the three other identical things alongside it remind you that you have a parasite in your rectum. Why is she using her tentacles now? It’s not like she has a reason to. They tickle your crack as their track alongside your [pc.skinFurScales] takes them into places where they really shouldn’t be. Two of them go to");
			if(target.isHerm()) txt += ParseText(" your genitals, one lightly inserting itself into your [pc.pussy] while the other " + (target.balls > 0 ? "snakes around your [pc.balls] to rub at the underside of your [pc.cocks]" : ("spirals around " + (target.cocks.length == 1 ? "your cock" : "one of your cocks") + " before it briefly squeezes your shaft")));
			if(target.hasCock()) txt += ParseText(" twirl around your shaft and " + (target.balls > 0 ? "spiral around your [pc.balls]" : "squeeze at your base"));
			if(target.hasVagina()) txt += " rub your vaginal lips and occasionally flick at your clit" + (target.totalClits() == 1 ? "" : "s");
			else txt += " sensually rub at your inner thighs, sending shivers up your spine as if they were the caring fingers of a lover";
			txt += ParseText(". The others circle around your ass cheeks to grip them firmly as they deeply massage your [pc.butt].");
			txt += "\n\nJust as quick as they came, the tentacles extricate themselves from your extremities. One by one the slippery tendrils slip back into the female parasites’ slightly poked out orifice, each one’s entry punctuated by a wet ‘schlick’. Oh why didn’t she finish what she started? You feel so unsatisfied now.";
			if(silly) txt += " You just got teased by a parasite. Pretty hot huh?";
			//Exception to lust increase, instead of 5 it increases it by 40.
			target.lust(40);
			break;
		case 5:
			txt += ParseText("As you move around, you feel a distinct moistness from the protruding orifice of your anal parasite. It spreads to cover most of your crack, and with every move you make the moist feeling becomes more noticeable, eventually feeling just like slime. What’s more is that this slimy sensation has started to slowly creep its way towards your [pc.groin]. You stop to take a look at");
			if(target.hasLowerGarment()) txt += ParseText(" your [pc.lowerGarment]. There is a wet greenish spot on your ass and the bottom of your groin that grows even now, almost looking like you’ve made a mess of yourself.");
			else txt += " your uncovered ass. A sheen of greenish ooze is covering most of your inner ass cheeks and has also migrated between your legs where it now drips to the floor.";
			txt += " The tubular parasite within you has leaked her slime all over your lower extremities. A mixture of frustration and embarrassment fills you as an angry blush covers your face. Damn it, now you’ve gotta clean it up. A breeze picks up, cooling your damp ass and groin area to uncomfortable levels. Now you’ve got a cold ass too.";
			if(InPublicSpace())
			{
				txt += "\n\nIt’s not really going to look good if you clean yourself up now; people are around. So you do the next best thing, which is hide behind the largest person you can find and hope nobody notices. Hopefully there is a restroom nearby. By the looks of it there seems to be a washroom of sorts that you slip into like some sort of assassin. From the lack of stares into the room it would seem that none have noticed, either that or they just don’t care. The trip to the cleansing device is thankfully without company. It looks kind of like a cross between a bidet and a shower.";
				txt += ParseText("\n\nWhy every planet has these is a mystery to you. Different needs for different breeds you suppose. A quick drop of your [pc.gear] and a slip into the stall has you quickly turning the nozzle to wash off the slime. The relatively cool water hits your form and is quite refreshing to say the least, while the spout from the floor rinses the ooze from your ass. You decide to include the part of your gear that has been slimed in the process as well. A bit of a warning next time would be appreciated, you think to yourself while hoping she somehow hears your thoughts.");
				txt += ParseText("\n\nIt would seem that that leakage of slime from your anal-lodged parasite ceased at some point during the rinsing. As you step out of the stall all refreshed and clean, the ass of " + RandomInCollection(["an ausar", "a human", "a kaithrit", "a leithan", "a kui-tan", "a gryvain"]) + " slips into a similar stall. You could ask them afterwards what these are truly used for, but that would be too awkward. To spare yourself any possible mental anguish over what you’ve just done, you get your [pc.gear] and bolt out of the room fresh as a daisy.");
				// Decrease lust by 20
				target.lust(-20);
			}
			else
			{
				txt += ParseText("\n\nYou drop your [pc.gear] right where you are, thinking that this parasite might be more trouble than it’s worth. Each one of your movements emits a squishy noise that would be cringe worthy if not for how hot it might sound to a passerby. The liquid has already made a little puddle where you stand, strands of slime that connecting you and the ground. With both your hands, you reach back and try to scoop out as much of the goop as possible. Handfuls of ooze are wiped off, but more just keep coming and the veneer of verdant green semi fluid on your hands isn’t helping much.");
				txt += "\n\nIf only you had something like a cloth this would be a lot less messy. Not to mention you are starting to kind of enjoy the sensation of venturing into your ass crack. The parasite is also getting a kick out of this and is consequentially transmitting her feelings to you isn’t she? Whelp, you figure you might as well go along with this, since she apparently isn’t going to stop until you do so.";
				txt += ParseText("\n\nYour digits slip into her butthole with no resistance at all. There’s even some suckling sensations whenever you extricate one of your phalanx appendages. Even if you weren’t originally enjoying it, the nerve signals hitting your mind say otherwise. The parasite definitely wanted this. The beat of your heart races as blood rushes to your [pc.groin]. In the heat of the moment, you’ve moved from up single digits, and are now four fingers knuckle deep in ‘your’ ass. Slime splatters everywhere with each moist insertion, which really makes a mess of everything around you. Seemingly from nowhere, her tendrils are suddenly around your wrist.");
				txt += "\n\nThey pull at your arm and force you to dig deeper every time. As your own ass has already adjusted to the feats of the parasite, you feel no pain from the experience. Instead, all you receive is pleasure. Once you’re in up to your wrist , you and the parasite both arrive to an orgasm at the same time - although it might just be her giving you a ‘contact’ orgasm. What seems like the last of her green fluids spurt out around your forearm while " + (target.hasGenitals() ? "your own genital fluids make their mark on the ground" : "you simply gasp from all the bliss hitting your mind") + ".";
				txt += "\n\nThe female parasite inside your ass lets go of your wrist, allowing your hand to pop out of her orifice with a satisfying loud and wet sound, revealing the flesh of ‘your’ gaped hole. You collapse forward into the ground from the exhaustive experience, almost hitting the puddle of slime. Once rested enough, you shakily raise your body to an upright position. The immediate area around you is still covered by the slime, but somehow your bottom is spotless. Something tells you that cleaning you up was a ‘thank you’ gift from your anal passenger. Not really much of a gift since she was the one that brought you into this mess in the first place, but it’s better than nothing. With a squeaky clean ass and a skip in your step you pick up your gear once more before continuing your adventure.";
				// reset lust to minimum
				target.orgasm();
			}
			break;
		case 6:
			txt += "You stand still for a second just to take in your surroundings, feeling somehow at peace and yet alert. Something you haven’t really paid attention to recently is the sensation of your body’s activity. The pace of your breath, the beat of your heart, the blood rushing through your veins and... something else. These other sensations originate from within you, more specifically from inside your ass. Most of the time you forget that you have a living creature inside you, one that has its own experiences just like you. Your focus has moves from the environment around you, and towards the parasite that you’re host to.";
			txt += "\n\nIf you concentrate hard enough, you could swear that even her tiniest sensations are subject to the nerves that connect the two of you. Usually you miss it, considering your mind’s priority over other things, but now you feel all that happens at the end of your digestive tract. A tiny heartbeat, and the distinct sensation of something small pumping fluid around within her. She constantly moves her body’s internals at a slow pace. Your hilinara parasite has blended in, a perfect mimic of your digestive system, the slow dilations of her internal muscles performing all the functions that your own sphincters would.";
			txt += "\n\nEven the tiny movements of her nubby feet can be felt through both her and your nerves. In a way, she’s become part of you. An extension to the systems of your body, heightening your pleasures in exchange for the occasional batch of eggs. To have a link as close as this with another creature is quite rare, and sort of enlightening in a way. The amount of time you’ve just spent pondering this is not as long as you thought it was, but still quite substantial. Time to move on, you guess.";
			// has no lust increase
			break;
	}
	
	if(txt != "")
	{
		effect.value3 = select;
		AddLogEvent(txt, "passive", maxEffectLength);
	}
}

// Butt Bug pregnancy types
// normal, overproductive, large
private var typeButtBugPregList:Array = ["ButtBugPregnancy0", "ButtBugPregnancy1", "ButtBugPregnancy2"];
public function loadInButtBug(mother:Creature = null, father:Creature = null):void
{
	// No dad
	if(father == null) return;
	// Already preggos
	if(mother.pregnancyData.length <= 3 || mother.pregnancyData[3].pregnancyType != "")
	{
		if(mother.hasStatusEffect("Butt Bug (Female)"))
		{
			if(mother.pregnancyData[3].pregnancyType.indexOf("ButtBugPregnancy") != -1) mother.addStatusValue("Butt Bug (Female)", 2, 1);
		}
		return;
	}
	// Without butt bug effect
	if(!mother.hasStatusEffect("Butt Bug (Female)"))
	{
		if(father.impregnationType == "ButtBugPregnancy") father.impregnationType = "";
		return;
	}
	// On cooldown
	if(mother.hasStatusEffect("Butt Bug Pregnancy Cooldown")) return;
	
	// Female Butt Bug
	var swfVariant:int = mother.statusEffectv1("Butt Bug (Female)");
	var ppButtBug:PregnancyPlaceholder = new PregnancyPlaceholder();
	
	var cumQ:Number = father.cumQ();
	ppButtBug.createPerk("Fixed CumQ", cumQ, 0, 0, 0);
	
	// Male butt bug father
	if(father.impregnationType == "ButtBugPregnancy")
	{
		switch(swfVariant)
		{
			case 0: ppButtBug.impregnationType = "ButtBugPregnancy0"; break;
			case 1: ppButtBug.impregnationType = "ButtBugPregnancy1"; break;
			case 2: ppButtBug.impregnationType = "ButtBugPregnancy2"; break;
		}
		mother.addStatusValue("Butt Bug (Female)", 2, 1);
		father.impregnationType = "";
	}
	else
	{
		ppButtBug.impregnationType = "ButtBugPregnancy";
	}
	
	// Get preg with butt bugs!
	if(ppButtBug.impregnationType != "") mother.tryKnockUp(ppButtBug, 3);
}
public function trackButtBugEggs(buttBugF:StorageClass, variant:String = "", eggs:int = 0):void
{
	if(variant == "" || eggs == 0) return;
	
	if(buttBugF != null) buttBugF.value4 += eggs;
	StatTracking.track("pregnancy/butt bugs/eggs laid/" + variant, eggs);
	StatTracking.track("pregnancy/butt bugs/eggs laid/total", eggs);
	StatTracking.track("pregnancy/total births", eggs);
}

// Variants:
// When the two females are fighting over who stays in your ass there is a "rock, paper, scissors" thing going on that ultimately determines which one is victorious, normal beats overproductive, overproductive beats large and large beats normal. If more are added then the rules of the "game" will have to be updated.

// Normal female: lmplants eggs, gestate for a week and increase anal looseness by 2 after laying. Initial stage preg bloats you by 1 and expands you by 2 each pregnancy stage.
// Overproductive female: Continuously implants eggs(keeps you pregnant) until a male fertilizes them, increase anal looseness by 2 after laying. Initial stage preg bloats you by 1 and expands you by 1 every week. Gives a week of rest time before it starts laying eggs again.
// Large female: lays 1 large egg which stays inside you for 3 months, during this time it absorbs genetic body plan from you which causes the child to be an insectoid humanoid and eventually is laid to produce sand worm hybrids who are interactable in the nursery to some extent(nothing sexy planned yet). Increase anal looseness by 3 after lay.

// Create boolean FTBBLay(first time butt bug lay)
// Create string eggsLaidBy

// Unfertilized expulsion:
// If has any female bug and gets anally filled status from anything other than a male butt bug, happens after an hour of being filled.
// Does not happen if pc has overproductive female and is not in egg cycle.
public function expelButtBugEgg(eggs:int = 0):void
{
	var buttBugF:StorageClass = pc.getStatusEffect("Butt Bug (Female)");
	var swfVariant:int = ((buttBugF != null) ? buttBugF.value1 : -1);
	var maxLooseness:Number = 2;
	if(pc.pregnancyData.length > 3 && InCollection(pc.pregnancyData[3].pregnancyType, typeButtBugPregList))
	{
		eggs += pc.pregnancyData[3].pregnancyQuantity;
	}
	
	var cIdx:int = (pc.hasCock() ? rand(pc.cocks.length) : -1);
	var vIdx:int = (pc.hasVagina() ? rand(pc.vaginas.length) : -1);
	var FTBBLay:Boolean = (buttBugF == null || buttBugF.value4 <= 0);
	
	clearOutput();
	showButtBug(swfVariant);
	author("Preacher");
	clearMenu();
	
	if(eggs <= 0)
	{
		output("<b>ERROR:</b> No eggs found!");
		output("\n\n");
		
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	output("A gurgling sound emanates from your [pc.belly] as the female butt bug inside you realizes that not only are the eggs she is caring for never going to hatch, but that she was never fucked by a male butt bug in the first place. The weight of the eggs shifts slightly downward as she gets both of you ready to lay the unfertilized eggs. Somehow, she also puts the thought in your head that squatting right now would be a very good idea. You do just that while dropping your [pc.gear]. Green lubricant oozes from your asshole as the female slightly expands her body inside you");
	if(cIdx >= 0) output(", rubbing against your prostate and making your male member" + (pc.cocks.length == 1 ? "" : "s") + " twitch and harden instantly.");
	output(" All the while, she flexes her inner muscles in a slow, drawn-out and slightly pleasurable fashion.");
	if(FTBBLay) output("\n\nPressure fills your anal cavity further as she keeps expanding, stretching your inner walls to their limit as she makes you groan with this strange new sensation. Clutching your abdomen you experience pain and pleasure mixing into a weird cacophony of feelings. Her expansion reaches your sphincter, and even through your clenching, she forcefully pries open your anal ring with her expanding orifice. Employing some of her tendrils she manually spreads open your asscheeks, completly exposing you. Several verdant slime strands connect both your cheeks and the walls of the expanded female’s internal body, as she gapes you to the point where your insides are visible.");
	else output("\n\nThe all-too-well-known pressure in your lower abdomen rears its head again, and the pain you felt the first time is now nonexistent. Adapted to the capabilities of the parasite, you relax your anal walls and accompany the stretching as you enjoy the sensations rolling through your rectum. Not even needing to be forced this time, you insert a few digits of your own accord and help her manually spread you, parting your buttcheeks in the process. Your digits, and even most of your hands get covered in the green slime leaking from her, making the gaping process so much more fun. Without noticing it you’ve gaped yourself to the point of others being able to see into you and the parasite, although not yet not enough to see the other end of your passenger.");
	if(InPublicSpace())
	{
		output("\n\nPeople around you stare in disbelief at what is happening in front of them, a [pc.boyGirl] gaping their anus in front of everyone to see. A puddle of green liquid forms below you as the slime leaking from your ass accumulates. Looking down towards it you see people’s faces looking at you in the reflection, and are reminded that you’re actually in public.");
		if(pc.exhibitionism() < 66) output("\n\nYour face flushes from the attention being given to you. You try to hide your face from the crowd, but you realize it is impossible. They’ve surrounded you, and are watching you with mixed expressions. Some are shocked, some judge you, and some are sporting tents, wet panties, or both. Why are they just staring at you? Can’t they see you need help or at least some privacy?");
		else output("\n\nTheir stares spur you on, making you masturbate as you specifically focus your attentions on some of them. Most are disgusted and leave, but some stay and even start openly pleasuring themselves to the show you’re putting on for them. Those that are adventurous enough grab your ass when it’s close to them, and the more curious ones even poke a hand into your gaping anus, making you gasp as it slicks in and slides out without effort. They step back once they notice you might actually be birthing something, but don’t stop their self pleasuring.");
	}
	switch(swfVariant)
	{
		case 0:
			output("\n\nYou feel the eggs moving already, pushed on by the powerful undulating muscles of the female inside you. You expected the eggs to bulge out your anus a little, but all you feel is the blissfully brief slipping out of each egg like a string of over-lubed anal beads, slightly caressing your passage");
			if(cIdx >= 0) output(" and your prostate");
			if(vIdx >= 0) output(", as well as making your [pc.vaginas] slightly wet,");
			output(" with their movement as your [pc.belly] slowly deflates. Each egg adds to a pile of green eggs until you count there to be about 10 of them laying on top of each other.");
			maxLooseness = 2;
			break;
		case 1:
			output("\n\nAs soon as you’re in position, your gaping anus floods out the cascade of slime-covered eggs that were all somehow crammed up your gut. They quickly cover the floor in their fluids, making wet plopping sounds as each one slips it out of you and splatters onto the already-wet surface below you. There seems to be no end to them as they slide out of your ass");
			if(cIdx >= 0) output(" while grinding against your prostate");
			if(vIdx >= 0) output(", and make you almost cream yourself");
			output(". Before you can reach your peak though, the stream of barely--wide-enough eggs stop, with the last of them plopping out and joining its brethren with a soft ‘splat.’ It would be a rough guess but you could say there were about 30 of them in total, though it’s hard to tell with them all clumped together like that.");
			maxLooseness = 2;
			break;
		case 2:
			output("\n\nThis egg feels larger than you expected it to be. It might actually require some effort to pass. You can feel it pressing against the ring of the female inside you as it is sucked through by the undulation of the female alone. The egg’s mass moves down, and with it so does the bulge in your abdomen. The female’s sucking of the egg has her orifice stretched wide over its surface, and is making your intestinal tract struggle to accommodate such a large object passing through.");
			output("\n\nVarious anal birthing fluids follow its path soon after, as you start to see the surface of the egg in the reflection of the liquids below you. Its progress is slow, but not painfully so. There’s just enough movement to stimulate your insides");
			if(cIdx >= 0) output(", making your dick" + (pc.cocks.length == 1 ? "" : "s") + " ooze a little precum");
			if(vIdx >= 0) output(" and creating a bit of a river between your legs");
			output(" with its movement. She undulates more now than ever before. Her movements roll through your rectal passage and across the surface of the egg. Each inch she pushes the egg through you goes into new territories of wonderful fullness.");
			output("\n\nEvery move of the spherical mass expands what you thought your ass was capable of handling. Your own tract is being pushed to its limits as it tries to fit the large egg without tearing. Reaching the end of her and your passage it comes to a halt, your own anal ring pressing down on the large female and making it harder for the egg to pass through her. Knowing now that you have to participate a bit, you try to push a little while relaxing your already gaped pucker. Sure enough the egg moves again before finally passing through at its widest point and plopping out with a satisfying ‘pop’. The egg glistens in the light as you breathe a sigh of relief of it finally being over.");
			maxLooseness = 3;
			break;
		default: output("\n\n<b>ERROR:</b> Butt bug variant ‘" + swfVariant + "’ not found!"); break;
	}
	if(InPublicSpace())
	{
		output("\n\nWith the show now over");
		if(pc.exhibitionism() < 66)
		{
			output(" people start to lose interest as one by one they walk away. Their looks did turn you on a little however. Maybe there is a little bit of an exhibishionist inside you.");
			// Increase exhibitionism by 5
			pc.exhibitionism(5);
		}
		else output(" the people around you finish off their masturbation, some of them aim directly at you as they cover you with their juices.");
		// inflict "cum covered" status effect
		
	}
	output("\n\nWith the female apparently done, she retracts her tendrils and");
	if(FTBBLay) output(" you experience for the first time your anus rapidly closing back up as the female contracts herself back to her normal size. Crap this is weird, having your rectum just be manually closed like some kind of strange aperture");
	else output(" your anus closes back up once more while she retracts to her normal size, making you wish it wasn’t over as quick as it was");
	output(". It almost looks like your pucker was never gaped open to begin with. You do notice you have been stretched a little bit though. This unfertilized laying was stimulating but not enough to sate you, so you stand up and dispose of the eggs as you resolve to find some other way to get off.");
	// increase anal looseness by 1
	if(pc.ass.loosenessRaw < maxLooseness)
	{
		output(" <b>Your anal ring has been stretched a little.</b>");
		pc.ass.loosenessRaw += 1;
	}
	output("\n\n");
	
	processTime(14);
	
	pc.lust(40);
	
	trackButtBugEggs(buttBugF, "infertile", eggs);
	
	addButton(0, "Next", mainGameMenu);
}

// Normal female Fertilized Laying:
// Seventh day after fertilization
public function birthButtBugType0(eggs:int = 0):void
{
	var buttBugF:StorageClass = pc.getStatusEffect("Butt Bug (Female)");
	var swfVariant:int = ((buttBugF != null) ? buttBugF.value1 : -1);
	var maxLooseness:Number = 2;
	if(pc.pregnancyData.length > 3 && InCollection(pc.pregnancyData[3].pregnancyType, typeButtBugPregList))
	{
		eggs += pc.pregnancyData[3].pregnancyQuantity;
	}
	
	var cIdx:int = (pc.hasCock() ? rand(pc.cocks.length) : -1);
	var vIdx:int = (pc.hasVagina() ? rand(pc.vaginas.length) : -1);
	var FTBBLay:Boolean = (buttBugF == null || buttBugF.value4 <= 0);
	
	clearOutput();
	showButtBug(swfVariant);
	author("Preacher");
	clearMenu();
	
	if(eggs <= 0)
	{
		output("<b>ERROR:</b> No eggs found!");
		output("\n\n");
		
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	output("A rumble in your egg-gestating gut is all the warning you get before green slime oozes from your parasite-occupied [pc.asshole]. You");
	if(InPublicSpace())
	{
		if(pc.exhibitionism() < 66) output(" find a secluded spot away from possible prying eyes to lay in peace");
		else output(" drop into a crouch right where you are standing, regardless of who might be watching");
		output(" and");
	}
	output(" remove your [pc.gear]. With your back against the closest vertical surface and ass as low as it can go, the laying starts. The eggs have already started to move down your digestive tract. As the smooth orbs make their way to your rectum, the tendrils of the female slip out of her poking-out orifice, one by one until all four of them are outside. At least a foot of their length is visible from your perspective, with two of them determined to spread your asscheeks while the others slither across your form.");
	output("\n\nOne");
	if(cIdx >= 0 && vIdx >= 0) output(" decides to jerk you off as it spirals around [pc.oneCock], but the other one looks unsure. It eventually decides to go for " + (pc.vaginas.length == 1 ? "your cunt" : "one of your cunts") + " and darts towards your womanly folds like a scorpion’s sting. Almost like the digit of some skilled bedfellow, it lightly penetrates your vaginal lips while frequently bending itself to get at the most hard to reach places.");
	else if(cIdx >= 0) output(" wraps itself around [pc.oneCock] and slowly pumps it while the other prods its end against your cock’s urethra. The sudden stimulation causes some [pc.cumColor] pre to dribble out and cover the prodding tendril’s tip.");
	else if(vIdx >= 0) output(" rubs itself teasingly along the folds of your cleft" + (pc.vaginas.length == 1 ? "" : "s") + " while the other wraps around" + (pc.totalClits() == 1 ? "your clit" : "one of your clits") + ". It mostly just squeezes your sensitive button, but you almost cream yourself whenever it decides to tug mercilessly at your [pc.clit].");
	else output(" doubles over as it bends back towards the orifice from which it first came to tentafuck your butt—technically the parasite’s anus. The sensations you’re getting through the parasite in your [pc.asshole] make it so you might as well have your ass be an erogenous zone. As if one wasn’t enough, the second twirls around the first to fuck you with the newly formed double helix tentacle.");
	output("\n\nThe lowest egg has reached the female’s internal tip, it’s a lot larger than you remember it being. At least double the size of when they were deposited within you, its smooth surface is engulfed by the front of your butt parasite. Your internal sphincter muscles get stretched open as the female undulates to move the egg through her passage. Her smooth surface slides around against your anal walls while she expands her external tip.");
	output("\n\nT");
	if(cIdx < 0 && vIdx < 0) output("he tentacles fucking you retreat as t");
	output("he slime-covered, anus-like orifice widens considerably as its dermis is stretched around the ovoid object. In a resounding ‘plop’ of finality, it pops out of the parasite and onto the floor, covered in layers of slick fluids. But it’s not over yet. Just as the first left your body, the second is already being enveloped by the bug’s internal aperture.");
	if(cIdx < 0 && vIdx < 0) output(" The free tendrils have resolved to massage your bare groin so as to avoid getting in the way of the rest of the eggs.");
	output("\n\nTime flies by as several more eggs follow the same insectoid oviposition of the first, until only one is left. The female’s efforts egg you on; release is so close you can taste it. The last egg plops out to top off the slimy pyramid below you as you’re pushed blessedly over the edge.");
	if(cIdx >= 0 && vIdx >= 0) output(" Loud moans escape your [pc.lips] as [pc.eachCock] throbs and your [pc.pussies] spasm in tandem. Your cock" + (pc.cocks.length == 1 ? "’s" : "s’") + " veins bulge while [pc.cum] is let loose from " + (pc.cocks.length == 1 ? "its" : "their") + " urethra" + ((pc.cocks.length == 1 && !pc.cocks[0].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) ? "" : "s") + " and splatters onto the ground a few yards in front of you. Whilst your seed is being sprayed, your vagina" + (pc.vaginas.length == 1 ? " convulses" : "s convulse") + ", leaking [pc.girlCum] onto the pile of eggs below.");
	else if(cIdx >= 0) output(" You grunt as [pc.cum] blasts out of of the urethra" + ((pc.cocks.length == 1 && !pc.cocks[0].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) ? "" : "s") + " of your [pc.cocks] while the tendrils continue to stroke [pc.oneCock], with the one formerly at your tip now stimulating the glans of your dick.");
	else if(vIdx >= 0) output(" You squeal as [pc.girlCum] sprays from your quim" + (pc.vaginas.length == 1 ? "" : "s") + " in arcing streams liquid pleasure. The muscles of your cunt" + (pc.vaginas.length == 1 ? " contracts" : "s contract") + " around the tentacle inside you. Even more of your girl cum is sprayed when a final tug on your clit reawakens your spasming vaginal lips.");
	else output(" Heat suffuses your nervous system while numbing sensory waves emanate outwards from your bare groin. Your mouth is left agape as your spine quakes with synesthetic tremors that leave only indescribable bliss afterwards.");
	
	processTime(14);
	
	// set pc.analloseness to [pc.analLooseness + 2]
	if(pc.ass.loosenessRaw < maxLooseness)
	{
		output(" <b>Your anal ring has been stretched a little.</b>");
		pc.ass.loosenessRaw += 1;
	}
	
	output("\n\nAs you ride out the last of your orgasmic waves, the tentacles slurp noisily back into the external orifice of your anal-lodged parasite. Breathless from exertion and with a pile of what seems to be 15 fertile eggs below you, you slowly regather your [pc.gear]. <b>Your anus does feel a bit more loose than before though.</b> After all, you just went through what was basically a bunch of large anal beads. The hilinara eggs will soon hatch, and if not taken care of they will likely pester the locals.");
	if(rooms[currentLocation].planet != "TAVROS STATION") output(" What do you do with them?");
	else output(" As you are already on Tavros Station, the decision seems obvious.");
	output("\n\n");
	
	pc.orgasm();
	
	// set eggsLaidBy to "normal"
	trackButtBugEggs(buttBugF, "type0", eggs);
	
	// display buttons [Leave them] & [Nursery]
	// if on tavros: automatically choose [Nursery]
	// look past the large female pregnancy section, the scene continues there as will be the case of all female variants.
	if(rooms[currentLocation].planet != "TAVROS STATION")
	{
		addButton(0, "Leave Them", birthButtBugLeave, [buttBugF, eggs, swfVariant, FTBBLay, cIdx, vIdx]);
		addButton(1, "Nursery", birthButtBugNursery, [buttBugF, eggs, swfVariant, FTBBLay, cIdx, vIdx]);
	}
	else addButton(0, "Next", birthButtBugNursery, [buttBugF, eggs, swfVariant, FTBBLay, cIdx, vIdx]);
}

// Over productive female Fertilized Laying:
// If is in laying cycle and pc has anally filled status applied from male butt bug
public function birthButtBugType1(eggs:int = 0):void
{
	var buttBugF:StorageClass = pc.getStatusEffect("Butt Bug (Female)");
	var swfVariant:int = ((buttBugF != null) ? buttBugF.value1 : -1);
	var maxLooseness:Number = 2;
	if(pc.pregnancyData.length > 3 && InCollection(pc.pregnancyData[3].pregnancyType, typeButtBugPregList))
	{
		eggs += pc.pregnancyData[3].pregnancyQuantity;
	}
	
	var cIdx:int = (pc.hasCock() ? rand(pc.cocks.length) : -1);
	var vIdx:int = (pc.hasVagina() ? rand(pc.vaginas.length) : -1);
	var FTBBLay:Boolean = (buttBugF == null || buttBugF.value4 <= 0);
	
	clearOutput();
	showButtBug(swfVariant);
	author("Preacher");
	clearMenu();
	
	if(eggs <= 0)
	{
		output("<b>ERROR:</b> No eggs found!");
		output("\n\n");
		
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	output("A wave of movement rolls through your digestive tract as the overproductive female parasite inside you decides that it’s time to lay her egg" + (eggs == 1 ? "" : "s") + ".");
	if(!pc.isNude()) output(" Your anal parasite subconsciously convinces you to remove your [pc.gear] so that the laying can be as obstruction free as possible. Not that you really mind; it’d be a pain to get ooze on your gear anyway.");
	output(" The egg" + (eggs == 1 ? "" : "s") + " must have been fertilized by that male butt bug from earlier. She wouldn’t be laying them like this if that wasn’t the case.");
	output("\n\nThe path of the ovoid object" + (eggs == 1 ? "" : "s") + " making their way to your parasite-occupied rectum is visible through your gut. Her four tendrils peek out of ‘your’ ass, strands of green semi-fluids connecting their slender bodies until the distance between the appendages causes the strands to snap. Your [pc.ass] is spread wide open by the parasite’s surprisingly strong tentacular appendages while verdant slime trickles out of your anus. Groans escape your mouth as the butt bug within you expands herself, stretching your own anal walls in the process. One by one her sphincter muscles expose your inner passage in wet shlicks until finally there is a clear cut tunnel into your egg-occupied depths.");
	if(eggs == 1)
	{
		output("\n\nA single splurt of green slime exits the now gaping hole of your rectum. Along with the goop there plops out a single egg that lands safely into the glob of ooze. Something triggers in your mind with the exit of the egg, and you’re left more clear headed than before, although shivers still run down your spine. Not completely the release you were looking for, but it does make you feel a bit better.");
		
		processTime(9);
		
		// decrease lust by 10
		pc.lust(-10);
	}
	else if(eggs < 25)
	{
		output("\n\nSeveral sputters of ooze exit your ass, each followed in quick succession by an egg. With each ovoid sphere that plops out you receive an absolutely divine tingle down your spine and throughout your limbs. The sensory reverberations are even affecting your groin.");
		if(cIdx >= 0 && vIdx >= 0) output(" Your " + (pc.balls >= 2 ? "balls tingle with activity" : "prostate is stimulated") + " as the eggs slide through your anal canal. These indirect pleasures roll through your crotch as your own fluids are stimulated out of you. The proof of your pleasures leak from your cock" + (pc.cocks.length == 1 ? "’s" : "s’") + " urethra" + ((pc.cocks.length == 1 && !pc.cocks[0].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) ? "" : "s") + " in tiny streams of [pc.cum] pre while [pc.girlCum] forms from the crevice" + (pc.vaginas.length == 1 ? "" : "s") + " " + (pc.balls > 0 ? "behind your [pc.balls]" : ("below your shaft" + (pc.cocks.length == 1 ? "" : "s"))) + ".");
		else if(cIdx >= 0) output(" Your " + (pc.balls >= 2 ? "balls churn" : "prostate tingles") + " with the sensation of the eggs being pushed through your shared anal passage. Evidence of your pleasures bubble out from your urethra" + ((pc.cocks.length == 1 && !pc.cocks[0].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) ? "" : "s") + " as [pc.cum] pre drips down your shafts" + (pc.cocks.length == 1 ? "" : "s") + ".");
		else if(vIdx >= 0) output(" Your vaginal lips quiver with indirect stimulations, leaking their [pc.girlCum] with every egg that exits your parasite-plugged anus.");
		else output(" Your bare groin has become a hot spot of erogenous sensitivity, even the occasional breeze that hits it has your nerves aflutter with erotic sensations.");
		output(" It’s so good that you might, just, cum, but the last one pops out just before you make it. They all land safely into the goop on the floor that acts like some kind of shock absorber, and you’re left ultimately unsatisfied. If only there were more eggs for you to lay.");
		
		processTime(16);
		
		// increase lust by 20
		pc.lust(20);
	}
	else
	{
		output("\n\nThe force of the intermittent streams of egg-filled slime spurting out of the parasite’s gaping orifice has you and your [pc.belly] toppled forward in short matter. The eggs and slime land in a heap behind you quickly piling up as time goes on. The slimy objects that escape your bowels slide against your digestive tract’s walls, becoming all the more pleasurable when those that were deeper inside you slip out and");
		if(cIdx >= 0) output(" rub against your prostate, only to");
		output(" stimulate the female parasite’s inner passage.");
		output("\n\nYou receive all of the female’s sensory signals as well as your own and has you experience the egg laying twice in the same time span. She must enjoy this; the second stream of sensation you’re receiving wouldn’t be this pleasurable if she wasn’t. The signals from your anal parasite have spread from the path of your spine towards the rest of you. They spread her pleasure throughout your form and congregate within the nerves of your groin.");
		output("\n\nThe indirect sensory stimulation is too much to resist. Around the sides of your bloated belly your hands wander towards");
		if(cIdx >= 0 && vIdx >= 0)
		{
			output(" intersexed set of genitals. They slide alongside your groin before one grabs " + (pc.cocks.length == 1 ? "your cock" : "one of your cocks") + " and the other slides its middle digit into " + (pc.vaginas.length == 1 ? "your wet crevice" : "one of your wet crevices") + (pc.balls > 0 ? " underneath your ballsack" : "") + ". You time your motions with the plopping eggs; each of the ovoid objects that exits your anus is a jerk of your dick and an inserted digit into your cunt. The dual sources of pleasure from your mixed genitals are already overwhelming, but the parasite’s sensations are yet another source, and the barrage of sensations is already having its effect on you.");
			output("\n\nSensual moans fill the air while the early signs of your orgasm show. [pc.Cum] pre oozes from your urethra" + ((pc.cocks.length == 1 && !pc.cocks[0].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) ? "" : "s") + " while streams of [pc.girlCum] leak from your cunt" + (pc.vaginas.length == 1 ? "" : "s") + " and cover your hand in their juices. [pc.Belly] no longer supporting you, you now rest on your [pc.knees]. Moans turn into senseless babbling and your [pc.hips] buck in the throes of sexual nirvana as your genitals release their liquid pleasures. Two distinct puddles are formed, one a few yards in front of you consisting of [pc.cum] and one below you that still connects you and the floor with strands of [pc.girlCum].");
		}
		else if(cIdx >= 0)
		{
			output(" the shaft" + (pc.cocks.length == 1 ? "" : "s") + " of throbbing meat nestled in your crotch. One grips the base of " + (pc.cocks.length == 1 ? "your dick" : "one of your dicks") + " and jerks it from top to bottom. The other " + (pc.cocks.length == 1 ? (pc.balls > 0 ? "caresses your scrotum before directly massaging at the firm roundness that is your [pc.balls]" : "rubs with its digits at your taint before moving to stimulate the tip of your cock in circular motions") : "grabs hold of another dick and strokes it sensually before jerking it too in sync with the other like pistons") + ".");
			output("\n\nThe ministrations of your hands along with the intermixed pleasures from the female parasite prove to be too much too fast. While the last of the eggs plop out into the pile, your [pc.cumColor] pre and increased breathing mark the arrival of your inevitable climax. Now on your [pc.knees] a groan escapes you as your hips buck and your [pc.cum] is blasted from the tip" + ((pc.cocks.length == 1 && !pc.cocks[0].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) ? "" : "s") + " of your dick" + (pc.cocks.length == 1 ? "" : "s") + ". It stains what it hits with [pc.cumColor] blotches and fills the air with its musky odour until you’re utterly spent.");
		}
		else if(vIdx >= 0)
		{
			output(" your dripping cunt" + (pc.vaginas.length == 1 ? "" : "s") + ". Their greedy lips ache for attention and you give into it graciously. Your digits spread your vaginal lips and expose the sensitive flesh within before digging into your ravenous depths. A thin sheen of [pc.girlCum] forms on your hands and -thighs as you frig your womanly folds. One hand is already knuckle deep into your cootch while the other " + (pc.vaginas.length == 1 ? ("has its way with " + (pc.totalClits() == 1 ? "your clit" : "each of your clits") + "\n\nEvery tweak of your pleasure buzzer" + (pc.totalClits() == 1 ? "" : "s") + " is like a release valve for your girly fluids. ") : ("clones the actions of its sister on your second vagina, each of your thumbs having their way with your clit" + (pc.totalClits() == 1 ? "" : "s") + ".\n\n")));
			output("The dual signals from the female parasite lodged in your anus as well as your own efforts with your [pc.cunts] push you over the edge in no time. Your breath goes ragged as you, now on your [pc.knees], buck your [pc.hips] along with the plops of the last eggs that join their siblings in the mound of eggs and goop. Girlish squeals escape your [pc.lips] as each buck is answered with the clamping down of your vaginal muscles onto your digits. Every muscle spasm renews the river flowing from your spastic cunt" + (pc.vaginas.length == 1 ? "" : "s") + " until you’re blissed out of your mind and rolling on the floor.");
		}
		else
		{
			output(" your bare groin. Though you have no genitals, the hilinara parasite’s sensations have become one with yours. It may just be the feminine physiology of the insect, but her pleasures have concentrated themselves in your flat crotch and made it quite sensitive. The sensitivity makes even the slightest caress of your digits trace lines of pleasure through your [pc.skinFurScales]. The sensual bolts arc up your spine along with the bug’s own sensations, building in intensity with each egg laid until they explode as the last one makes it out.");
			output("\n\nNo longer supported by your belly, you balance yourself on your [pc.knees]. Barely a sound comes from you while your mouth hangs agape and your mind struggles to process the sensory explosion. The intense feelings racing through your nerves fizzle away as they are replaced by an overwhelming sense of happiness and clear headedness.");
		}
		output("\n\nLaying so many eggs truly takes a lot out of you, and it takes a while for your breathing to return to normal. The pile of " + num2Text(eggs) + " eggs behind you truly makes you wonder just how the hell all of those fit inside you. Then again, they didn’t all go in there at once so you did get some time to stretch out. At least your belly is nice and flat once more. Some small part of you wishes it was not so, but maybe that’s just the parasite talking.");
		
		processTime(27);
		
		// set lust to minimum
		pc.orgasm();
	}
	output("\n\n");
	
	// set pc.analloseness to [pc.analLooseness + 2]
	if(pc.ass.loosenessRaw < maxLooseness)
	{
		output("<b>Your anus does feel a bit stretchier than before.</b> Perks of an egg-laying ass parasite, you guess. ");
		pc.ass.loosenessRaw += 1;
	}
	
	output("Your mind wanders towards the egg" + (eggs == 1 ? "" : "s") + " as you regather your gear. The hilinara eggs will soon hatch, and if not taken care of they will likely pester the locals.");
	if(rooms[currentLocation].planet != "TAVROS STATION") output(" What do you do with them?");
	else output(" Since you are already on Tavros Station, the decision seems obvious.");
	output("\n\n");
	
	// set eggsLaidBy to "productive"
	trackButtBugEggs(buttBugF, "type1", eggs);
	
	// set OPBBE to 0 && end egg cycle
	resetButtBugEggCycle();
	
	// display buttons [Leave them] & [Nursery]
	// if on tavros: automatically choose [Nursery]
	if(rooms[currentLocation].planet != "TAVROS STATION")
	{
		addButton(0, "Leave Them", birthButtBugLeave, [buttBugF, eggs, swfVariant, FTBBLay, cIdx, vIdx]);
		addButton(1, "Nursery", birthButtBugNursery, [buttBugF, eggs, swfVariant, FTBBLay, cIdx, vIdx]);
	}
	else addButton(0, "Next", birthButtBugNursery, [buttBugF, eggs, swfVariant, FTBBLay, cIdx, vIdx]);
}

// Large female Fertilized Laying:
// When three month pregnancy ends
public function birthButtBugType2(eggs:int = 0):void
{
	var buttBugF:StorageClass = pc.getStatusEffect("Butt Bug (Female)");
	var swfVariant:int = ((buttBugF != null) ? buttBugF.value1 : -1);
	var maxLooseness:Number = 2;
	if(pc.pregnancyData.length > 3 && InCollection(pc.pregnancyData[3].pregnancyType, typeButtBugPregList))
	{
		eggs += pc.pregnancyData[3].pregnancyQuantity;
	}
	
	var cIdx:int = (pc.hasCock() ? rand(pc.cocks.length) : -1);
	var vIdx:int = (pc.hasVagina() ? rand(pc.vaginas.length) : -1);
	var FTBBLay:Boolean = (buttBugF == null || buttBugF.value4 <= 0);
	
	clearOutput();
	showButtBug(swfVariant);
	author("Preacher");
	clearMenu();
	
	if(eggs <= 0)
	{
		output("<b>ERROR:</b> No eggs found!");
		output("\n\n");
		
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	output("Abdominal contractions strike you out of the blue. They’re painful enough that you’re quickly forced to the ground in order to alleviate your symptoms. It does not help. Even belly rubs aren’t soothing the aches in your egg-occupied gut. A gurgle and slight movement in the egg’s position follows the latest of your cramps, and you realize that the egg’s due date is today! As fast as your pains allow you,");
	if(pc.isNude()) output(" you shift your nude form into a more comfortable position and");
	output(" you remove your gear just to make it easier on yourself.");
	output("\n\nYou feel three of the butt bug’s tendrils deploy inside of you while the fourth snakes its way out of her external orifice. The fourth’s slimy surface tickles you as it coils around your [pc.legOrLegs] and pulls itself into a tentacular knot. Is she planning to pull the egg out of you?! Groans escape you as the internal tentacles scrape their pointed tips against your digestive tract’s walls and travel upwards to meet with your ovoid cargo.");
	output("\n\nTheir presence in your passage can be clearly seen as three lengthy tubes that bulge out your [pc.skinFurScales]. You slide your hands across them and feel through your [pc.skinFurScales] how they push against the insides of your egg-carrying gut. Each of their advances inside you are answered in a drawn out <i>‘oooh’</i>, making you feel fuller than you already are. Once they meet with the egg lodged in your lower intestine, the tentacles diverge from their group exploration of your insides.");
	output("\n\nLike the claw of a prize machine, the female’s tentacular appendages slither alongside the egg’s surface until they once more meet on the other side. The parasite’s tentacle tips interlock, forming a temporary knot behind the deeper side of the egg. She pulls on the oval mass inside you with all her appendages, with the external tentacle as the only thing that keeps her from being pulled too deep into you. That first pull forces you to make an ‘O’ face as your rectal passage is stretched from the inside out. Clenched teeth and slow grunts accompany you for several minutes as the bug relentlessly pulls on the egg inside you.");
	output("\n\nYou feel like you’re in one of those holovids where they " + (rand(2) == 0 ? "insert oversized objects into the asses of experienced pornstars" : "hold anal dildo size queen competitions") + ", only with you it’s in reverse. Your little fantasy has sparked some arousal from you and your");
	if(cIdx >= 0 && vIdx >= 0) output(" dual gendered genitals are already being pumped with blood");
	else if(cIdx >= 0) output(" [pc.eachCock] is already starting to get erect");
	else if(vIdx >= 0) output(" [pc.cunts] are already moistening");
	else output(" bare groin has already gotten tingly");
	output(" because of it.");
	output("\n\nSubconsciously you sensually caress yourself. From the dome of your belly your hands travel up towards your [pc.chest] and back down again until they hover just above your groin. You just can’t resist your need to indulge in your carnal desires and so you let your hands dive straight to business. With every pull on the egg that the insect makes,");
	if(cIdx >= 0 && vIdx >= 0) output(" you jerk [pc.oneCock] and frig [pc.oneVagina]. When at the top of your cock you rub your tip in circular motions with your thumb while you do the same with [pc.oneClit]. You might just have a birth fetish, your digits are already wet with [pc.girlCum].");
	else if(cIdx >= 0) output(" you tug on your" + (pc.mf("", " girlish", true)) + " penile shaft" + (pc.cocks.length == 1 ? "" : "s") + " and relish in the sensations of her movements stimulating your prostate.");
	else if(vIdx >= 0) output(" you dig your digits into your womanly folds. You alternate thumbs as you polish your pearl" + (pc.totalClits() == 1 ? "" : "s") + ", all of your other fingers wet to the second knuckle in girl juice.");
	else output(" you rub your palms against your sensitive featureless groin. Like an ember sparking a flame in dry tinder, you’ve stoked your nerves into a heat filled passion.");
	output("\n\nThe round bulge in your belly slowly, visibly shifts lower with every tug from the bug lodged in your ass. You’re given a moment of respite when the egg connects with the insect’s internal sphincter, your mouth hanging agape and breathing heavily with exertion and pleasure. The break is short lived though. Your breathing quickens its pace once more while you continue your ministrations and the egg is moved again by your parasite. The second to last segment of its birth is now underway.");
	output("\n\nDetermined and sweat covered, you brace for the egg to stretch the second part of your anus. Your large anal parasite’s presence has already prepared you for this moment, but this egg is larger than even her! To help quicken the process, you push with your anal muscles whenever you feel her start her own pulls. Slowly but surely, the smooth point of the oval object is enveloped by your butt bug’s inner orifice until it unexpectedly slips past its halfway point");
	if(cIdx >= 0) output(" and forces some pre from [pc.oneCock]");
	output(".");
	output("\n\nThat little hiccup has you hissing in a deep inhalation before loudly moaning your pleasure at the bug’s own sensations mixing up with yours through her link in your nerves. While you get used to the egg’s sudden new location, you savour the tactile experience of your ass and her egg laying passage being stretched out at the same time. With the egg’s form visibly bulging out ‘your’ anal ring between your ass cheeks, the final stretch awaits.");
	output("\n\nThe egg holding parasite within you pulses with undulatory movements as it pushes the egg you’re carrying. Each of the fat insect’s undulations are answered with your own anal muscles as they push along with your bug. You keep your anal ring slack to help ease the rectal oviposition. The sensual feedback you’re receiving from the parasite makes it hard not to be further turned on by the experience.");
	output("\n\nYou increase your masturbatory pace as you");
	if(cIdx >= 0 && vIdx >= 0) output(" lustfully stroke your cock to the beat of the bug’s undulations and frig your [pc.girlCum] leaking cunt" + (pc.balls > 0 ? " behind your [pc.balls]" : "") + ".");
	else if(cIdx >= 0) output(" vigorously pump your pre-slicked [pc.oneCock].");
	else if(vIdx >= 0) output(" fervently jill the lips of [pc.oneVagina].");
	else output(" deeply massage your digits into the sensitive flesh of your bare groin, setting your nerves set on fire with the indescript lust coursing through you");
	output(". Starting as a low groan, your voice raises in volume and intensity until you loudly grunt in tactile overflow while ‘your’ pucker parts around the large slimy tip.");
	output("\n\nYou’re pushing with all you can manage as well. Sputters of green slime spurt out around its sides, blessedly lubricating the passage. The natural lube speeds things up exponentially as the oval egg passes its halfway point and slips out of you completely. It’s so large that it doesn’t even fall much once it totally separates from your body. You exhale in pleasurable relief as you’re driven over the edge into your climax. Gasps followed by moans escape you while");
	if(cIdx >= 0 && vIdx >= 0) output(" your [pc.hips] buck in the throes of your pleasures. The bulging veins of [pc.eachCock] and the spastic clenches of [pc.eachCunt] harkens the eruptive diplay of [pc.cum] and [pc.girlCum] emanating from your groin. Pretty soon, your hands and inner thighs become messy with your fluids and all you’re thinking about is in how much bliss you’re now in.");
	else if(cIdx >= 0) output(" [pc.eachCock] throb" + (pc.cocks.length == 1 ? "s" : "") + " and twitches in your hands in tandem to the [pc.cum] being pumped from your [pc.balls]. Your seed blasts through your urethra" + ((pc.cocks.length == 1 && !pc.cocks[0].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) ? "" : "s") + " and flies through the air before it splatters onto the ground.");
	else if(vIdx >= 0) output(" vaginal walls spastically clench down onto your invading digits. Streams of [pc.girlCum] flow from [pc.eachVagina] liberally covering your hands and the floor in [pc.girlCumColor].");
	else output(" your nerves briefly explode in a lustful supernova of pleasure. The sensual heat stays for a while before a state of bliss radiates throughout your form that leaves you as calm as a still lake.");
	output(" The rest of the slime splashes out of your rectum and falls onto the already ooze covered egg like liquid afterbirth and forms quite a large puddle beneath you.");
	output("\n\nDizziness creeps upon your consciousness and you almost fall into a blackout as you collapse onto to fluid covered floor. The parasite’s tendril around your [pc.legOrLegs] unties itself, slipping back into your bug’s now gaping birthing canal and disappearing from your sight. Damn it, your ass is fucking sore! Was it worth it? Maybe. <b>You’re pretty sure your asshole won’t fully recover from this for quite a while.</b> A bit sensitive but glad you’re free of the extra weight while you gather you gear, your mind wanders towards the egg you’ve laid. The hybrid hilinara egg will soon hatch and if not taken care of it will likely pester the locals. Either that, or try and integrate with them.");
	if(rooms[currentLocation].planet != "TAVROS STATION") output(" What do you do with it?");
	else output(" Since you are already on Tavros Station, the choice seems obvious.");
	output("\n\n");
	
	processTime(24);
	
	// set pc.analloseness to [pc.analLooseness + 3]
	if(pc.ass.loosenessRaw < maxLooseness)
	{
		output(" <b>Your anal ring has been stretched a little.</b>");
		pc.ass.loosenessRaw += 1;
	}
	output("\n\n");
	
	pc.orgasm();
	
	// set eggsLaidBy to "large"
	trackButtBugEggs(buttBugF, "type2", eggs);
	
	// display buttons [Leave them] & [Nursery]
	// if on tavros: automatically choose [Nursery]
	if(rooms[currentLocation].planet != "TAVROS STATION")
	{
		addButton(0, "Leave Them", birthButtBugLeave, [buttBugF, eggs, swfVariant, FTBBLay, cIdx, vIdx]);
		addButton(1, "Nursery", birthButtBugNursery, [buttBugF, eggs, swfVariant, FTBBLay, cIdx, vIdx]);
	}
	else addButton(0, "Next", birthButtBugNursery, [buttBugF, eggs, swfVariant, FTBBLay, cIdx, vIdx]);
}

// Post laying Choices:
// [Leave them]
public function birthButtBugLeave(arg:Array):void
{
	var buttBugF:StorageClass = (arg.length > 0 ? arg[0] : pc.getStatusEffect("Butt Bug (Female)"));
	var eggs:int = (arg.length > 1 ? arg[1] : 0);
	var swfVariant:int = (arg.length > 2 ? arg[2] : -1);
	var FTBBLay:Boolean = (arg.length > 3 ? arg[3] : (buttBugF == null || buttBugF.value4 <= 0));
	
	var cIdx:int = (arg.length > 4 ? arg[4] : (pc.hasCock() ? rand(pc.cocks.length) : -1));
	var vIdx:int = (arg.length > 5 ? arg[5] : (pc.hasVagina() ? rand(pc.vaginas.length) : -1));
	
	clearOutput();
	showButtBug(swfVariant);
	author("Preacher");
	
	output("You don’t want anything further to do with " + (eggs == 1 ? "this egg" : "these eggs") + ", and " + (eggs == 1 ? "it" : "they") + " can apparently take care of " + (eggs == 1 ? "itself" : "themselves") + ". Your parasite doesn’t seem to be objecting to your choices either so you guess they’re going to be fine. The butt plug-like parasite in your ass is slowly closing her fleshy aperture so as to once more blend in with your rectal passage.");
	if(FTBBLay) output(" The sensation of her resettling in like this is making you a little uncomfortable with her movements.");
	else output(" You’ve become used to her resettling into your anal tract after her egg laying, but it’s always a little weird.");
	output(" She does eventually settle down however, allowing you to continue with her inside you in relative comfort.");
	output("\n\n");
	
	processTime(2);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
// Create child object
public function createButtBugChild(variant:int = -1, numEggs:int = 0):void
{
	if(variant < 0 || numEggs <= 0) return;
	
	var c:Child = null;
	switch(variant)
	{
		case 0:
		case 1:
			c = Child.NewChild(GLOBAL.TYPE_SANDWORM_PARASITE, 1.0, numEggs, 50, 50, 0, 0);
			break;
		case 2:
			c = Child.NewChild(GLOBAL.TYPE_SANDWORM, 1.0, numEggs, 40, 40, 20, 0);
			break;
	}
	if(c != null) ChildManager.addChild(c);
	
	StatTracking.track("pregnancy/butt bugs/day care/total", numEggs);
	StatTracking.track("pregnancy/total day care", numEggs);
}
// [Nursery]
public function birthButtBugNursery(arg:Array):void
{
	var buttBugF:StorageClass = (arg.length > 0 ? arg[0] : pc.getStatusEffect("Butt Bug (Female)"));
	var eggs:int = (arg.length > 1 ? arg[1] : 0);
	var swfVariant:int = (arg.length > 2 ? arg[2] : -1);
	var FTBBLay:Boolean = (arg.length > 3 ? arg[3] : (buttBugF == null || buttBugF.value4 <= 0));
	
	var cIdx:int = (arg.length > 4 ? arg[4] : (pc.hasCock() ? rand(pc.cocks.length) : -1));
	var vIdx:int = (arg.length > 5 ? arg[5] : (pc.hasVagina() ? rand(pc.vaginas.length) : -1));
	
	clearOutput();
	showButtBug(swfVariant);
	author("Preacher");
	
	output("You’ve put a lot of effort into carrying " + (eggs == 1 ? "this" : "these") + " to term and you’re not about to just leave " + (eggs == 1 ? "it" : "them") + " here. A quick call to the nursery with your codex and barely five minutes later a delivery drone appears to haul what you’ve lain. The butt plug-like parasite in your ass is slowly closing her fleshy aperture so as to once more blend in with your rectal passage, and");
	if(FTBBLay) output(" the sensation of her resettling like this is making you a little uncomfortable with her movements");
	else output(" while you’ve become used to her resettling into your anal tract after her egg laying, it’s always a little weird");
	output(". She does eventually settle down however and allows you to continue with her inside you in relative comfort.");
	switch(swfVariant)
	{
		case 0:
			output("\n\nThe drone scoops the eggs up rather quickly, and fits them snugly into three holding trays. Like three dice with the number ‘5’ facing upwards, the egg trays fit into a box-like container and are then locked inside the bot. With ‘your’ offspring secured, the bot’s thrusters fire up once more as it lifts into the air to deliver its cargo.");
			break;
		case 1:
			output("\n\nThe aerial drone deploys what seems to be a " + (eggs == 1 ? "little box" : "hardlight net") + " in order to transport it’s targeted cargo. Once " + (eggs == 1 ? "it is put into the box by a mechanical arm and sealed away inside the drone" : "all are surrounded by the net the gaps in between the thin light streams close up to form a sealed bag in which your eggs are to be carried") + ". It’s security checks pass and the thrusters on it’s sides start up as it goes into the air to deliver the egg" + (eggs == 1 ? "" : "s") + ".");
			break;
		case 2:
			output("\n\nThe transport drone lands next to the your large egg and indicates with a relatively cartoonish hologram that you yourself should put it into the drone. As you pick it up you realize that it is actually kinda heavy, though not uncomfortably so. However, it is still kind of slimy and hard to get a good grip on it. The bot’s top flips open as you come near, revealing some kind of cylindrical container with a soft seat of pollysponge material inside. You make sure your egg is fastened properly and close the self sealing lid before its main thrusters activate, and it blasts off with your precious cargo.");
			break;
	}
	output("\n\nAs the drone flies off to the nursery, a strange sense of maternal longing creeps up on you. Like what you would feel sending your child to school for the first time. Surely these aren’t your feelings, " + (swfVariant != 2 ? "they technically aren’t even your own offspring" : "but then again there is a small part of your genetics in there") + ". They must be coming from your parasite.");
	output("\n\n");
	
	processTime(5);
	
	createButtBugChild(swfVariant, eggs);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Immobilized by eggs scene:
// Currently only a placeholder scene, for what’s supposed to happen according to the codex. Just want to get the base doc out of the way before I start adding major bells and whistles.
public function expelButtBugEggImmobile():void
{
	var buttBugF:StorageClass = pc.getStatusEffect("Butt Bug (Female)");
	var swfVariant:int = ((buttBugF != null) ? buttBugF.value1 : -1);
	var maxLooseness:Number = 2;
	var eggs:int = 0;
	if(pc.pregnancyData.length > 3 && InCollection(pc.pregnancyData[3].pregnancyType, typeButtBugPregList))
	{
		eggs += pc.pregnancyData[3].pregnancyQuantity;
	}
	
	var cIdx:int = (pc.hasCock() ? rand(pc.cocks.length) : -1);
	var vIdx:int = (pc.hasVagina() ? rand(pc.vaginas.length) : -1);
	var FTBBLay:Boolean = (buttBugF == null || buttBugF.value4 <= 0);
	
	clearOutput();
	showButtBug(swfVariant);
	author("Preacher");
	clearMenu();
	
	output("Damn. these eggs are getting heavy! You’ve been moving slower and slower ever since that last egg was laid. The pressure in your gut exerted by your tightly stretched belly exeeds that which you and your parasite can hold and bursts like a slimy dam! You give exasperated moans and exclamations of pleasure as eggs and green slime suddenly start shooting out your ass like a machine gun. Pretty soon all of them are out and you have a large pile of unfertilized eggs behind you, along with a veritable lake of verdant green ooze below you.");
	output("\n\nWell, that was one way to get them out. Time to move on, you guess. Hopefully you don’t forget about the parasite’s eggs next time.");
	output("\n\n");
	
	processTime(15);
	
	pc.pregnancyData[3].cleanupPregnancy(pc, 3);
	
	// end overproductive parasite egg cycle and set egg count to 0
	resetButtBugEggCycle();
	trackButtBugEggs(buttBugF, "infertile", eggs);
	
	processTime(1);
	
	addButton(0, "Next", mainGameMenu);
}

// Nursery:
// Button and description only available after sending at least one fertile Hilinara parasite egg to the nursery
// create integer BBOS (total tallied butt bug offspring)
// Each hybrid is inserted into an array and operates off of three parameters, body type, gender and maturity. Body types include winged, biped and taur. Genders are the usual female, male and herm. Maturity is simply a timer, set to a month after being added to the nursery and once that timer is up they become interactable.
// create integer BBHWorms (Hilinara worms)
// create integer BBHHybrids (hybrid Hilinara offspring)
// Hybrid gender is randomized when large eggs are sent to nursery.
// Depending on current character body type the hybrids will either get a tauric body, biped body or winged body. If you don’t have wings and are a biped they’ll be biped. If you are tauric(leithan or otherwise) no matter if you have wings or not they will be tauric. If you have wings and are not tauric(biped, goo, naga) then they will be winged.
// Parasite Eggs hatch before you get back to nursery, and hybrids take one month to mature and become interactible(Mostly to save up on coding timers for each egg.)

// Description added to modular corridor

// (could just be called Tarkus room if any other Tarkus based children are had in the game’s future)
// Opens up a button menu and different text display instead of actually going into a room, unless it would be better if there was actually a room then this button can be thrown away and the buttons below can be added to the room.
public function nurseryHilinaraRoom(arg:Array):void
{
	var numButtBugWorm:int = (arg.length > 0 ? arg[0] : ChildManager.numOfTypeInRange(GLOBAL.TYPE_SANDWORM_PARASITE, 0, 9001));
	var numButtBugHybrid:int = (arg.length > 1 ? arg[1] : ChildManager.numOfTypeInRange(GLOBAL.TYPE_SANDWORM, 1, 9001));
	var numButtBugTotal:int = (arg.length > 2 ? arg[2] : (numButtBugWorm + numButtBugHybrid));
	
	clearOutput();
	showBust("");
	showName("HILINARA\nROOM");
	author("Preacher");
	
	// Room description
	output("Trying to understand the scale of this room would make most people confused. Looking at it from a window elsewhere on the station makes it look like a large, domed warehouse, but when inside it is like a vast expanse of a desert environment. There is even an artificial sun on the roof. The interior must be lined with numerous screens to simulate a distant environment. There does seem to be about a circular kilometer of actual space, plenty for your surrogate children. By the looks of it there " + (numButtBugTotal == 1 ? "is" : "are") + " currently");
	if(numButtBugWorm > 0) output(" " + num2Text(numButtBugWorm) + " worm" + (numButtBugWorm == 1 ? "" : "s") + " digging about");
	if(numButtBugWorm > 0 && numButtBugHybrid > 0) output(" and");
	if(numButtBugHybrid > 0) output(" " + num2Text(numButtBugHybrid) + " hybrid" + (numButtBugHybrid == 1 ? "" : "s") + " walking around");
	output(". Perhaps due to a sense of smell or thermal signature,they know you were their carrier and don’t attack you. They don’t attack the droids either. They must either be used to their presence, or not see them as a threat. There also seems to be a small circular structure close to the door. The sign says worm feed. That’s understandable, since any worms that might come here can’t really go to the mess hall to get their food. What will you do now that you’re here?");
	output("\n\n");
	
	processTime(1);
	
	// Buttons in room
	// Displayed when clicked on Hilinara room button or going into room.
	clearMenu();
	// [Petting]: only available if there are worms.
	if(numButtBugWorm > 0) addButton(0, "Petting", nurseryHilinaraPetWorm, [-1, numButtBugWorm, numButtBugHybrid], "Pet Worm", "Pet one of your worms, and maybe play a game with it.");
	else addDisabledButton(0, "Petting", "Pet Worm", "You have no hilinara worms available to pet.");
	// [Talk]: only available if there are hybrids and at least one of them are mature, opens up some other buttons after scene start, chooses a random hybrid out of the bunch in the array.
	if(numButtBugHybrid > 0) addButton(1, "Talk", nurseryHilinaraTalkHybrid, [-1, numButtBugWorm, numButtBugHybrid], "Talk to Hybrid", "Talk to one of your hybrid children.");
	else addDisabledButton(1, "Talk", "Talk to Hybrid", "You have no mature hilinara hybrids to talk to.");
	// [Nurse Droid]: Information gathering from droid
	addButton(2, "Nurse Droid", nurseryHilinaraNurseDroid, [numButtBugWorm, numButtBugHybrid, numButtBugTotal], "Nurse Droid", "Talk to one of the nurse droids to gather some info.");
	
	addButton(14, "Leave", mainGameMenu);
}

public function nurseryHilinaraPetWorm(arg:Array):void
{
	var response:int = (arg.length > 0 ? arg[0] : -1);
	var numButtBugWorm:int = (arg.length > 1 ? arg[1] : ChildManager.numOfTypeInRange(GLOBAL.TYPE_SANDWORM_PARASITE, 0, 9001));
	var numButtBugHybrid:int = (arg.length > 2 ? arg[2] : ChildManager.numOfTypeInRange(GLOBAL.TYPE_SANDWORM, 0, 9001));
	var gender:int = (arg.length > 3 ? arg[3] : 0);
	
	clearOutput();
	showBust("");
	showName("SAND WORM\nPARASITE");
	author("Preacher");
	clearMenu();
	
	switch(response)
	{
		case -1:
			var numButtBugGenders:Genders = ChildManager.numOfTypeAndGenderInRange(GLOBAL.TYPE_SANDWORM_PARASITE, ChildManager.ALL_GENDERS, 0, 9001);
			var genders:Array = [];
			var i:int = 0;
			for(i = 0; i < numButtBugGenders.Male; i++) { genders.push(0); }
			for(i = 0; i < numButtBugGenders.Female; i++) { genders.push(1); }
			if(genders.length > 0) gender = genders[rand(genders.length)];
			
			output("Tapping thrice into the sand with your [pc.foot] seems to attract one of the worms to you. It digs into your direction and slows once at your feet. One more tap causes it to lift its frontal body out of the sand. Still relatively small since available space limits their maximum size, the worm’s frontal length is similar to that of a medium-sized dog. In a strange way, the worm even acts like a dog too. Nudging its still sand-covered tip into your hand, it gives you the impression that it wants some attention, and who are you to say no to such a cute gesture?");
			output("\n\nYou brush your palm across its sides and swipe the sand off from the top of its head as it leans into each one of your rubs, sometimes directing the attention where it is needed. Out of nowhere it suddenly goes back underground. It burrows of in some unknown direction, but comes back just as fast, springing out of the sifting grains with a rock in its mandibles. Slightly covered with greenish saliva it is placed at your feet. It seems like your worm wants you to take the rock and do something with it.");
			output("\n\nDo you play with it?");
			output("\n\n");
			
			processTime(1);
			
			// Display buttons [Yes] and [No]
			addButton(0, "Yes", nurseryHilinaraPetWorm, [1, numButtBugWorm, numButtBugHybrid, gender]);
			addButton(1, "No", nurseryHilinaraPetWorm, [0, numButtBugWorm, numButtBugHybrid, gender]);
			break;
		case 1:
			output("You pick up the rock and suddenly all the worm’s attention is diverted away from you, and straight to the rock. It sways this way and that with focus as you move the rock about with your hands, and the sandworm almost goes straight when you ready for a throw. The baseball sized rock flies");
			var physique:Number = pc.PQ();
			if(physique < 10) output(" a mere 10 or so meters proving little challenge for the worm to fetch. After only a few repeated throws, your shoulder is already starting to cramp up. Maybe you need to work on your throwing arm.");
			else if(physique < 30) output(" an appreciable distance away. The worm finds it easily sometimes, but just as often takes a while to find it. It’s not too bad for someone with your strength, but the constant throwing is tiring you out a bit. The worm is also showing some signs of slowing down.");
			else output(" a sizable distance away. You almost lose sight of it on a few consecutive throws. It always takes a while for the worm to find it, and only brings the rock back a few times before slowing down in it’s efforts. Maybe throwing a rock that distance away in a room like this isn’t a very good idea. You might break something.");
			output("\n\nAfter a few more lobs of the rock, you decide to end the play time. Your fetcher is looking a bit winded as well. This time you set the stone in front of it and give a few more soft caresses before stepping back a little. Understanding your message, the worm picks up the rock once more, and disappears with it into the sand. Well that was fun.");
			output("\n\n");
			
			processTime(9);
			
			// Decrease energy by 10
			// Increase physique by 0.1
			pc.energy(-10);
			pc.slowStatGain("physique", 1);
			
			addButton(0, "Next", mainGameMenu);
			break;
		case 0:
			output("You roll the rock back towards it, but the worm just rolls it back. A couple more bouts of this rolling tennis match go by before you give it a clearer message. With a hand rubbing its head once more you pick up the Stone and put it into the worm’s mouth this time,you step back from your hoping to be playpal. Sagging a little from the realization you don’t want to play, its attentions are drawn elsewhere, burrowing into the sand and bolting off to what seems to be a nursedroid. The nursedroid plays with the worm a bit at least, so you know it won’t be left sad.");
			output("\n\n");
			
			processTime(5);
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

public function nurseryHilinaraTalkHybrid(arg:Array):void
{
	var response:int = (arg.length > 0 ? arg[0] : -1);
	var numButtBugWorm:int = (arg.length > 1 ? arg[1] : ChildManager.numOfTypeInRange(GLOBAL.TYPE_SANDWORM_PARASITE, 0, 9001));
	var numButtBugHybrid:int = (arg.length > 2 ? arg[2] : ChildManager.numOfTypeInRange(GLOBAL.TYPE_SANDWORM, 0, 9001));
	var isWinged:Boolean = (arg.length > 3 ? arg[3] : false);
	var isTaur:Boolean = (arg.length > 4 ? arg[4] : false);
	var gender:int = (arg.length > 5 ? arg[5] : 0);
	
	clearOutput();
	showBust("");
	showName("SAND WORM\nHYBRID");
	author("Preacher");
	
	switch(response)
	{
		case -1:
			if(pc.originalRace.indexOf("gryvain") != -1) isWinged = true;
			if(pc.originalRace.indexOf("leithan") != -1) isTaur = true;
			var numButtBugGenders:Genders = ChildManager.numOfTypeAndGenderInRange(GLOBAL.TYPE_SANDWORM, ChildManager.ALL_GENDERS, 0, 9001);
			var genders:Array = [];
			var i:int = 0;
			for(i = 0; i < numButtBugGenders.Male; i++) { genders.push(0); }
			for(i = 0; i < numButtBugGenders.Female; i++) { genders.push(1); }
			for(i = 0; i < numButtBugGenders.Intersex; i++) { genders.push(2); }
			if(genders.length > 0) gender = genders[rand(genders.length)];
			
			output("You whistle into the fake desert, calling out to a hybrid in the distance and prompting them to turn their head in your direction. By the looks of it, they are happy to see you.");
			if(isWinged) output(" Membranous insectile wings deploy from their back as they fly in your direction, wings barely visible from their fast movement. Some sand is also kicked up by the path of their flight. As they get closer, a low vibrsatory sound can be heard from their wings, slowing in frequency as they get close.");
			else if(isTaur) output(" A multi-legged insectoid underbody is what their humanoid half sits upon, skittering across the sand they quickly make their way towards you. The sounds of sand being shifted about by their six legs fills your auditory field in short time, slowing down as they near you.");
			else output(" Running as a humanoid biped would, their legs kick up some sand while they make their way towards you. It takes a bit, but at least they don’t seem tired.");
			output("\n\nAs near as they are now you can easily make out their more subtle features. Though still manufactured with modern fabrics their attire looks somewhat tribal, consisting of a patterned kilt, sandals and a poncho to cover their upper body. Must be the best for this climate you guess.");
			switch(gender)
			{
				case 0: output(" With a pretty face and curvy body you estimate they must be female. Her small but noticeable breasts would also help to tell anyone that she was a woman."); break;
				case 1: output(" A rugged but overall handsome face and a reasonably muscular looking body has you guessing that this one must be male, with the flat chest and occasional kilt bulge also being dead giveaway."); break;
				case 2: output(" A bit androgynous to your eyes, your guesswork is thrown into a bit of a loop, forcing you to resort to other indicators in order to determine their sex. Some reasonably well developed breasts and slight bulge in their kilt has you guessing they must be a hermaphrodite. Then again, you don’t really know and it would be weird and awkward to ask for a look. Why would you even? There’s nothing you’re interested in under there."); break;
			}
			output("\n\nWithout warning they dive straight at you, embracing you in a hug that would make a bear proud. Untangling from you they look you in the eyes and say, <i>“It is good to see you’re healthy, my carrier. I hope to see many more brothers and sisters from you.”</i> A bit taken aback by their directness, you blush a little while you entertain the thought. Putting a hand on their cheek, you tell them that maybe you will give them more. A smile appears on their segmented humanoid face as they ask, <i>“So... anything specific you want to talk about?”</i>");
			output("\n\n");
			
			processTime(1);
			
			// So I’ve judged myself to be terrible at dumbing things down, I’m going to keep their dialog as is unless someone has some good suggestions.
			// Buttons disappear as you use them
			clearMenu();
			addButton(0, "Them", nurseryHilinaraTalkHybrid, [0, numButtBugWorm, numButtBugHybrid, isWinged, isTaur, gender], "Them", "Ask about them.");
			addButton(1, "You", nurseryHilinaraTalkHybrid, [1, numButtBugWorm, numButtBugHybrid, isWinged, isTaur, gender], "You", "Ask what they think about you.");
			addButton(2, "Doing Now?", nurseryHilinaraTalkHybrid, [2, numButtBugWorm, numButtBugHybrid, isWinged, isTaur, gender], "Doing Now?", "Ask what they are doing now.");
			addButton(14, "Goodbye", nurseryHilinaraTalkHybrid, [14, numButtBugWorm, numButtBugHybrid, isWinged, isTaur, gender], "Goodbye", "");
			break;
		case 0:
			output("<i>“Well as you can see I’m");
			if(isWinged) output(" a rare winged");
			else if(isTaur) output(" an uncommon multi-legged");
			else output(" run of the mill bipedal");
			output(" variety of my species, or so I’ve been told. And I have you to thank for it,”</i> they say while extending a finger in your direction. <i>“I spend my days in this ‘dome’ as the nurses called it, though it looks like a desert to me. Whenever I get hungry, I go into the metal tunnels to grab some grub and then sit in the ‘class’, as they called it, for a few hours before coming back out again.”</i> A bit frustrated, they go on rambling about how it would be better if classes were held outside and other desert related issues. You guess their limited intelligence don’t really allow them to grasp the technology involved on the station.");
			output("\n\n<i>“Don’t tell anyone, but I’ve been having all kinds of cravings for intimate contact. I’ve asked the lecturers about this, and they explained sex to me. I always blush whenever I think about it.”</i> Cravings? Sex? Blush? Direct as usual, but it always surprises you somewhat whenever they do this. A reminder that they should’ve concentrated in class causes them to quickly derail their dirty train of thought.");
			output("\n\n");
			
			processTime(5);
			
			setButtonDisabled(response);
			break;
		case 1:
			output("<i>“");
			if(isWinged)
			{
				if(pc.hasWings() && pc.canFly()) output("I like that we can both fly together, in case we want to start a colony somewhere.");
				else output("Why did you lose your wings? I know you had them, I wouldn’t have them if you didn’t. Oh well. More air for me.");
			}
			else if(isTaur)
			{
				if(pc.isTaur()) output("Having a lot of legs is great isn’t it? We could run to our heart’s content and we won’t get tired. Do you want a race?");
				else output("Our legs might be different but I still know you had them at one point, just wish you stayed the same.");
			}
			else
			{
				if(pc.isBiped()) output("Well... I like you even if our anatomy is a bit bland. At least we’ll fit in more or less anywhere. Other places are apparently mostly built around our body type, so that’s good.");
				else output("You do know that being generic can sometimes be better right? Just trying to save you some trouble.");
			}
			output("”</i>");
			output("\n\n<i>“Otherwise, I’m pleased. You look more or less healthy, and are able to make loads more of us if you want to. I can just imagine how it would be if there were many of us. Oh please say you’ll carry more.”</i> They hop up and down a bit childishly while asking you this. You kinda expected they’d say something like this. They do care about you, but it’s more or less only on the broodmother level. Love in any form is always nice, even if it might be a bit weird in comparison to what you’re used to.");
			output("\n\n");
			
			processTime(5);
			
			setButtonDisabled(response);
			break;
		case 2:
			output(RandomInCollection([
				"<i>“Oh... nothing much. Sometimes I lounge in the sun, other times I work on my hut,”</i> they say while looking around without focus.\n\n<i>“You have a hut?”</i> you ask, surprised.\n\n<i>“Yep, water just doesn’t seem to stick the sand together strong enough, so I’ve been licking what I want to attach and it seems to be holding together well. Apparently we’re kinda specialized for this kind of stuff.”</i> Their hand points into a direction, and you can faintly see a greenish brown looking mud hut. They clearly weren’t kidding about the licking part.",
				"<i>“Making a spear.”</i> Your eyebrow raises as they say that. <i>“I know I’m not supposed to have weapons, but I feel like I need one, don’t you?”</i> You sigh as you go over the details of weapon safety with “your” child, a thought accidentally escapes your lips.\n\n<i>“What is it made of?”</i> you ask as they unhook something from their back.\n\n<i>“Sand, technically. I’ve found out how to make my spit harder. The sand tastes awful but I can make more or less anything with it and it doesn’t break that easily.”</i> You tell them to be careful, and they roll their eyes like almost any teenager these days would, while rehooking their sand spear.",
				"<i>“I’ve been going to the far ends of the desert. There is some kind of hidden wall that I can’t go through. If I walk along it, it always brings me back to the same place. Not even digging under it works. I keep hitting a metal rock layer. I wonder, why is it here?”</i> Taking their hand into yours you try to explain to them what the ‘wall’ is. They clearly don’t understand that they aren’t in a real desert, and follow an ‘I see, I know’ set of logic. They shake their head is disbelief <i>“You must be crazy. Clearly you and I can both see that there is more desert beyond the wall.”</i> Oh well. You can’t really remove a panel to prove this to them. Otherwise you might break something. Soon they’ve already more or less forgotten about what you’ve said, like they never even had a disagreement with you.",
			]));
			output("\n\n");
			if(numButtBugHybrid > 4)
			{
				if(numButtBugHybrid <= 10) output("<i>“Me and some of my siblings have been thinking of making a small village here, instead of staying separate in the dunes.”</i> Apparently that’s what they’re calling this dome. At least they’re getting familiar with it. <i>“Some of us have merged our huts, and it doesn’t look like we’re fighting too much.”</i>");
				else output("<i>“It became impossible for us to walk around and not bump into one another so we banded together to make more use of the space in here. We made a small village.”</i> Somewhat surprised by their progress you congratulate them, but inquire about why they aren’t using their rooms in the station. Looking kind of embarrassed they continue speaking <i>“We simply couldn’t get comfortable in there. Sleeping in the sand feels a lot more natural for most of us anyway so... we kinda got permission from the nice lady to stay here permanently and only go up when we get hungry.”</i> They must be talking about Briget. If she says it’s fine then you guess it’s permissible.");
			}
			else if(numButtBugWorm > 0) output("<i>“Every time I see one of those little worms I feel a kinship with them. The nurses tell me that we are technically the same species. I’ve played with them before, but knowing that now just makes it feel better.”</i>");
			else output("<i>“I feel like I need to look after some form of small creature though. Don’t know why, but it’s just a feeling.”</i>");
			output("\n\n");
			
			processTime(5);
			
			setButtonDisabled(response);
			break;
		case 14:
			output("After a couple more minutes of small talk you say your goodbyes, give a few hugs and watch as they go to their own little spot in the faux desert. It Is good talking to them like this, parental bonding is always important.");
			output("\n\n");
			
			processTime(5);
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
	}
}
public function nurseryHilinaraNurseDroid(arg:Array):void
{
	var numButtBugWorm:int = (arg.length > 0 ? arg[0] : ChildManager.numOfTypeInRange(GLOBAL.TYPE_SANDWORM_PARASITE, 0, 9001));
	var numButtBugHybrid:int = (arg.length > 1 ? arg[1] : ChildManager.numOfTypeInRange(GLOBAL.TYPE_SANDWORM, 1, 9001));
	var numButtBugTotal:int = (arg.length > 2 ? arg[2] : (numButtBugWorm + numButtBugHybrid));
	
	clearOutput();
	showBust("");
	showName("NURSE\nDROID");
	author("Preacher");
	
	output("You move towards a droid that is " + RandomInCollection([
		"moving a bag of worm feed",
		"sweeping some sand from the main platform",
		"on its way to tend to some unknown duty",
	]) + ", and tap on its metallic shoulder to get its attention. Diverting its head towards you, her sensors recognize you and stop what she was currently doing to tend to your requests. <i>“Is there anything you’d like help with [pc.misterMiss] Steele?”</i> they ask as they fold their hands in front of their dress, awaiting your input. Upon telling them you just want some information, they turn into some kind of tour guide, telling you the functions and purposes of various things until finally you reach the end of the tour. <i>“" + RandomInCollection([
		"As you can see, this sectioned-off room is where we keep all the nutritional packages to feed the biological units that cannot make it to the mess hall.",
		"This biodome system is completely automated and designed to simulate Tarkus to the best of the system’s computational abilities. This includes time of day, heat, wind, gravity, horizon, atmosphere and sand composition.",
		"No expense was spared for the raising of any and all desert organism offspring [pc.misterMiss] Steele might produce. This dome is as adaptable as many of the other rooms on this floor.",
		"Domes like this one are actually commonly used in many stations across the galaxy. Most are used for parks or beaches rather than desert simulations, so consider yours a rarity!",
		"We hope you don’t mind, but we’ve synthesized the air in the dome to smell more or less like you. Making the hybrids and worms think you are nearby puts them in a cooperative and calm state.”</i> Really? You don’t smell anythi-... oh. You’re probably used to your own smell so of course it won’t be noticeable.",
	]) + " That concludes the requirements of current query request. For more info, please post queries to another nurse unit.”</i>. She resumes her previous task with no delay. They must be busy. You guess you need to get the attention of a different one if you want to know more.");
	output("\n\n");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

/*

----------------------------------------------------------------------------------------------------------------
[Anything beyond the ^ above ^ line is expansion content ideas and is optional as to whether or not they are added along with the base content package. In other words, devs can disregard whatever stuff is below this line for now if they want.

I will also only complete sections below the line if I’ve got the go ahead for expansion.]

Symbiosis:
//Activates when you’ve gone through 6 pregnancies/egg cycles concerning butt bug eggs.
//Perk is called "Butt Incubator" until a better name is found.
//Halves all future butt bug related pregnancies, in the case of the overproductive one it cuts the time to next egg to every 4 hours.
//Is tied to individual parasites, meaning if you’ve obtained it with one female but then removed that female and gained another one in the future or replaced it through a female fight scene regardless of female type then you won’t have the perk until you’ve gone through 6 pregnancies again with the butt bug you then have.
//Symbioses with this parasite has two bonuses in its perk, one gives you a special ability and the other prevents or locks in a certain bodily parameter depending on your parasite variety.
//Normal female locks anal wetness at max.
//Overproductive female locks anal capacity at max, regardless of your looseness or wetness.
//Large female locks your anal looseness at max.
//Regardless of female type they all give you an aphrodisiac saliva laden kissing ability, dealing more and more lust damage in comparison to your lust level, meaning the higher your lust is the more damage you’ll deal, more specifically it is [Damage = 2+(pc.lust/8)]. It also gives the enemy a status effect that makes them more susceptible to lust damage for two turns, I’m thinking 20% more susceptibility.

Just a recap of possible expansion ideas.

· - Capturing a female and add her to Steeles’ bionahole collection.

· - Fight between ass mimbrane and female.

- Male variants (basically cock types, and cock sleeve parasite type). This expansion would include infected enemy encounters.

- Eventual symbiosis between you and your parasite.

- Bad end scene concerning being overburdened by the overproductive female’s eggs.

*/


