/*
 *	flag:
 * RATPUTATION
 * RATCOUNTERS
 * RAT_ANUSES_TAKEN: the bit for 2^n handles the anus of rat n (used only for the mouse boys for now)
 */

//Check 
public function showRats(ratCount:int = 1):void
{
	author("William");
	showName("\nRAT'S RAIDERS");
	showBust("KASE");
	if (rat0 == null && ratCount > 0) return;
	switch (ratCount)
	{
		default:
		case 0: /* show group bust */ break;
		case 1: showBust(rat0.bustDisplay); break;
		case 2: showBust(rat0.bustDisplay, rat1.bustDisplay); break;
		case 3: showBust(rat0.bustDisplay, rat1.bustDisplay, rat2.bustDisplay); break;
		case -1: showBust("MABBS", "URBOLG"); showName("\nRobbery?"); break;
	}
}

public var rat0:RatsRaider = null;
public var rat1:RatsRaider = null;
public var rat2:RatsRaider = null;

public function ratMenu():void
{
	if (rat0 == null) ratSetupGroup();

	clearMenu();
	clearOutput();
	showRats(3);
	author("lighterfluid");
	showName("VERMIN\nSTOCKROOM");

	output("Currently working with Group Nº" + rat0.ratVariety/3);
	
	output("\n\n<b>Ratcounters:</b> " + (flags["RATCOUNTERS"] == undefined ? 0 : flags["RATCOUNTERS"]));
	output("\n<b>Rat Reputation:</b> ");
	switch (ratputation())
	{
		case RatsRaider.RAT_REP_NONE: output("Unknown"); break;
		case RatsRaider.RAT_REP_LOW: output("Poor (" + flags["RATPUTATION"] + ")"); break;
		case RatsRaider.RAT_REP_MID: output("Average (" + flags["RATPUTATION"] + ")"); break;
		case RatsRaider.RAT_REP_HIGH: output("Good (" + flags["RATPUTATION"] + ")"); break;
		case RatsRaider.RAT_REP_GOOD_CEO: output("Friend"); break;
	}
	output("\n<b>Rat Booty:</b>");
	output("\n-Credits: " + (flags["RAT_CREDITS_STOLEN"] == undefined ? 0 : flags["RAT_CREDITS_STOLEN"]));
	output("\n-Small Gems: " + (flags["RAT_SMOL_GEMS_STOLEN"] == undefined ? 0 : flags["RAT_SMOL_GEMS_STOLEN"]));
	output("\n-Large Gems: " + (flags["RAT_BIG_GEMS_STOLEN"] == undefined ? 0 : flags["RAT_BIG_GEMS_STOLEN"]));
	output("\n<b>Ratbutt Virginities:</b> " + (flags["RAT_ANUSES_TAKEN"] == undefined ? 0 : flags["RAT_ANUSES_TAKEN"]));
	output("\n<b>rat0.legs:</b> [rat0.legs]");
	
	addButton(0, "Fight!", ratDebugFight);
	addButton(2, "Random Encounter", ratInTheMineEncounter);
	addButton(3, "Urbolg Introduction", ratAttemptUrbolgRobbery);
	addButton(4, "GoodCEO", ratDebugSetRep, 101);
	addButton(5, "Set Rep Low", ratDebugSetRep, 25);
	addButton(6, "Set Rep Mid", ratDebugSetRep, 50);
	addButton(7, "Set Rep Hi", ratDebugSetRep, 75);
	addButton(8, "Buttfuck 1", ratDebugButtfuck, 1);
	addButton(9, "Buttfuck 2", ratDebugButtfuck, 4);
	addButton(10, "Ratputation +5", function(){ratputation(5);ratMenu();});
	addButton(11, "Ratputation -5", function(){ratputation(-5);ratMenu();});
	addButton(9, "Switch Rats", function(){ratSetupGroup((rat0.ratVariety == 0 ? 1 : 0)); ratMenu();});
	
	addButton(14, "Done", ratDebugDone);
}

public function ratDebugDone():void
{
	ratCleanup();
	mainGameMenu();
}

public function ratDebugSetRep(newRep:int):void
{
	if (newRep == 101)
	{
		flags["RATPUTATION"] = 101;
	}
	else
	{
		flags["RATPUTATION"] = newRep;
		if (flags["RATPUTATION"] > 100) flags["RATPUTATION"] = 100;
		else if (flags["RATPUTATION"] < 0) flags["RATPUTATION"] = 0;
	}
	
	ratMenu();
}

public function ratDebugFight():void
{
	if (rat0 == null) return addButton(0, "Error", mainGameMenu);
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(rat0, rat1, rat2);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(ratDebugFightWrapup);
	CombatManager.lossScene(ratDebugFightWrapup);
	CombatManager.displayLocation("RAT THIEVES");
	CombatManager.encounterTextGenerator(ratcounterTextGenerator);
	CombatManager.beginCombat();
}

public function ratDebugFightWrapup():void
{
	ratCleanup();
	clearOutput();
	
	if (pc.isDefeated()) output("Player lost");
	else output("Rats lost");
	
	output("\n" + int(CombatManager.getHostileActors().length) + " rats remaining.");
	CombatManager.abortCombat();
}

public function ratDebugButtfuck(maus:int):void
{
	if (flags["RAT_ANUSES_TAKEN"] == undefined) 
	flags["RAT_ANUSES_TAKEN"] |= 1<<maus;
	ratMenu();
}
 
public function ratPCIsPoor():Boolean
{
	if (pc.credits >= 2000) return false;
	for each (var item:ItemSlotClass in pc.inventory)
		if (item.type == GLOBAL.GEM && !item.hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE))
			return false;
	return true;
}
 
public function ratputation(increase:int = 0, goodCEO:Boolean = false):int
{
	//improve rep
	if (increase && flags["RATPUTATION"] != 101)
	{
		if (flags["RATPUTATION"] == undefined) flags["RATPUTATION"] = increase;
		else flags["RATPUTATION"] += increase;
		if (flags["RATPUTATION"] > 100) flags["RATPUTATION"] = 100;
		else if (flags["RATPUTATION"] < 0) flags["RATPUTATION"] = 0;
	}
	if (goodCEO) flags["RATPUTATION"] = 101;
	//return rep
	if (flags["RATPUTATION"] == undefined) return RatsRaider.RAT_REP_NONE;
	else if (flags["RATPUTATION"] < 30) return RatsRaider.RAT_REP_LOW;
	else if (flags["RATPUTATION"] < 70) return RatsRaider.RAT_REP_MID;
	else if (flags["RATPUTATION"] < 101) return RatsRaider.RAT_REP_HIGH;
	else return RatsRaider.RAT_REP_GOOD_CEO;
}

public function ratTheftPercent(bounty:int, inFight:Boolean = false):Number
{
	//No idea where the numbers come from, they just work
	var percent:int = 10 + 35*Math.exp(-bounty/300000);//Math.exp(3.5-pc.credits/300000);
	if (ratputation() == RatsRaider.RAT_REP_GOOD_CEO) percent /= 3;
	else if (!inFight) percent *= 2/3;
	percent += 2.5 - rand(6);
	return Math.min(100, Math.max(5, percent));
	//Goodbye beautiful legacy code, William couldn't withstand your greatness. -lighterfluid
	/*
	//Based on 6d6-26
	var odds:Array = [{v:10,w:1666}, {v:20,w:1161}, {v:30,w:756}, {v:40,w:456}, {v:50,w:252}, {v:60,w:126}, {v:70,w:56}, {v:80,w:21}, {v:90,w:6}, {v:100,w:1}];
	return Math.min(Math.max(5, weightedRand(odds) + mod),100);
	*/
}

public function ratTallyLoot(thief:RatsRaider, returned:Boolean = false):void
{
	var mult:int = (returned ? -1 : 1);
	if (flags["RAT_BIG_GEMS_STOLEN"] == undefined) flags["RAT_BIG_GEMS_STOLEN"] = 0;
	if (flags["RAT_SMOL_GEMS_STOLEN"] == undefined) flags["RAT_SMOL_GEMS_STOLEN"] = 0;
	if (flags["RAT_CREDITS_STOLEN"] == undefined) flags["RAT_CREDITS_STOLEN"] = 0;
	flags["RAT_SMOL_GEMS_STOLEN"] += thief.statusEffectv2("Plunder over Pillage!")*mult;
	flags["RAT_BIG_GEMS_STOLEN"] += thief.statusEffectv3("Plunder over Pillage!")*mult;
	flags["RAT_CREDITS_STOLEN"] += thief.credits*mult;
}

public function ratSetupGroup(ratGroup = -1):void
{
	ratCleanup();
	if (ratGroup < 0) ratGroup = rand(2);
	if (ratGroup == 0)
	{
		rat0 = new RatsRaider(RatsRaider.PINK_RODENIAN);
		rat1 = new RatsRaider(RatsRaider.TAN_MOUSEBOY);
		rat2 = new RatsRaider(RatsRaider.HALF_GIRL);
	}
	else
	{
		rat0 = new RatsRaider(RatsRaider.WHITE_RODENIAN);
		rat1 = new RatsRaider(RatsRaider.FAIR_MOUSEBOY);
		rat2 = new RatsRaider(RatsRaider.HALF_BOY);
	}
}

// [RAT BEGIN]

public function ratAttemptUrbolgRobbery():void
{
	clearMenu();
	clearOutput();
	showRats(-1);
	
	output("Inside the hangar on Zheng Shi you cast a wary eye over your ship, satisfied that it remains unmolested. Whatever the pirates hanging out here are doing, at least they're not big on trying to crack your airlock. Before you take your next step, a loud <b>bang</b> breaks your concentration. Goosebumps thrum across your [pc.skinFurScalesNoun]. Instinctively, you hunch down, looking in the direction of Urbolg's workshop, noting that the independent engineer isn't there.");
	output("\n\nA hair-raising crash follows several booming gunshots. A metallic clamor precedes two small figures darting out from around a pile of scrap, short of breath and running past you on all fours - mostly, they stagger like frightened, drunken animals - as they flee from the nerve-fraying gunfire. They move much too fast for you to appraise aside from their all-black getup and mouse-like limbs.");
	output("\n\n<i>\"Get out, you fekken' pests!\"</i> you hear Urbolg bellow, and another two rats scream as they dive out of the way of a turret's shredding salvo. <i>\"Ye thought you could steal from Urbolg?\"</i> he snarls, firing off another booming shot. Squealing like wounded animals the last two rush past you with the speed of surging lightning, stopping for nothing as the stocky korgonne shuffles out from behind the mounds of discarded metal like a swirling tornado of rage about to touch down on the land.");
	output("\n\n<i>\"Oi, new [pc.guyGirl], move over,\"</i> he raises his oil-soaked hand and stomps past you insistently. He squeezes off another deafening shot into the dark, and before you mentally quip about his blind firing, you hear a shrill scream and the tell-tale concussive shock of a collapsing shield in the distance. That act of vengeance quells the anger in the fluffy mechanic. He holsters his handcannon before turning to you, frustration etched like a fresh scar on his livid features.");
	output("\n\n<i>\"Bloody rats, rootin' around for what they haven't earned, can't keep their shitestained paws to 'emselves!\"</i> he curses, ears and tail flexing out the dissipating anger. You");
	if (pc.isBimbo() || pc.isBro()) output(" breathily");
	else if (pc.isAss()) output(" bluntly");
	else output (" softly");
	output(" inquire as to what all that was about.");
	output("\n\nNow calmer and wearing a sly grin, he ushers you back to the workshop, walking and talking with an urging paw on your shoulder. <i>\"One of the big five gangs here on the station. You'll get to know 'em all eventually, but those ones?\"</i> he stops and grips a piece of metal, eyeing the workshop direly, <i>\"the fekken' worst! Paste-fingered loingrommets think I'm so old and stupid that I won't see 'em tryin' to steal!\"</i>");
	output("\n\nHis sigh is more like a ragged growl, and you quickly put two and two together as he wipes his arm off with a dirty cloth. <i>\"Those rodents work in groups, so ye best be wary, new [pc.guyGirl]. You may have proved yourself to 'ol Urbolg, but they don't give up, and they're fekken everywhere. Watch yourself now, y'hear? Lest you <i>want</i> to lose everything you've got!\"</i>");
	if (flags["SEXED_URBOLG"] == undefined) output("\n\nYou nod lightly, thanking him for the information as you move on.");
	else output("\n\nNodding, you smile and thank Urbolg, watching his tail thump against the workbench behind him.");
	output("\n\nLooks like you'll have to watch out for a bunch of thieving vermin now…");

	flags["RATS_ENABLED"] = 1;
	flags["RAT_ANUSES_TAKEN"] = 0;
	flags["RAT_BIG_GEMS_STOLEN"] = 0;
	flags["RAT_SMOL_GEMS_STOLEN"] = 0;
	flags["RAT_CREDITS_STOLEN"] = 0;

	addButton(0, "Next", mainGameMenu);
}

public function ratInTheMineEncounter():Boolean
{
	if (rat0 == null) ratSetupGroup();
	clearMenu();
	clearOutput();
	showRats(3);
	output("hello we're rats");
	addButton(0, "Next", ratDebugFight);
	return true;
}

public function ratCleanup():void
{
	rat0 = null;
	rat1 = null;
	rat2 = null;
}

// [COMBAT STUFF]

public function explosionDodgeBlurb(dodgers:int, attacker:Creature, target:Creature, special:String):void
{
	if (dodgers <= 0) return;
	switch (special)
	{
		case "cluster":
		case "explosion":
			var back:String = (special == "cluster" ? "back" : "away from your bomb");
			output("\n\nWith an almost preternatural sense of self-preservation,");
			if (dodgers > 1) output(" they dive " + back + " and take");
			else
			{
				if (RatsRaider.ratCount(false) > 0) output(RatsRaider.getLeaderRat(false).mf(" he", " she"));
				else output(" the enemy");
				output(" dives " + back + " and takes");
			} 
			output(" cover just before");
			if (special == "cluster")
			{
				if (attacker == pc) output(" your");
				else output(possessive(attacker.getCombatName()));
				output(" micro-grenades detonate.");
			}
			else output(" detonation.");
			output(" As the smoke clears, you see ");
			if (dodgers > 1) output("them stand, heads");
			else
			{
				if (RatsRaider.ratCount(false) > 0) output(RatsRaider.getLeaderRat(false).mf(" he", " she"));
				else output(" the enemy");
				output(" stand, head");
			}
			output(" shaking, and looking hardly worse for wear!");
			break;
		case "gas": 
			output("\n\nWith an almost preternatural sense of self-preservation, " + (dodgers > 1 ? "they dive away from the hissing canister and take" : "{he/she} dives away from the hissing canister and takes") + "  cover just before detonation. The pink smog billows and lingers, and the");
			if (RatsRaider.ratCount(false) > 0) output(" confused " + (dodgers > 1 ? "rats stand, idly groping themselves" : "rat stands, idly groping " + RatsRaider.getLeaderRat(false).mf("himself", "herself")) + ". <i>\"You… W-what the h-hell is this? Did you get tha… thaaaa-TT from one of the <i>Vipers</i>?!\"</i> comes a lewd cry, the lust obvious in their unsteady speech.");
			else if (dodgers > 1) output(" enemies stand, idly groping themselves.");
			else output(" enemy stands, idly groping around.");
			break;
	}
}

public function ratcounterTextGenerator():String
{
	var encText:String = "";
	var randomDialogue:Array = new Array();
	var rat:RatsRaider = null;
	var downedRat:RatsRaider = null;
	var totalRats:int = 0;
	for each (var enemy:Creature in CombatManager.getHostileActors())
	{
		if (!(enemy is RatsRaider)) continue;
		//Get leader rat, replace if another is fit for duty
		if (rat == null || rat.isDefeated() || rat.isImmobilized()) rat = enemy as RatsRaider;
		//Get downed rat, 50% chance to switch so it's not always the first rat that gets picked
		if (enemy.isDefeated() && (downedRat == null || rand(2) == 0)) downedRat = enemy as RatsRaider;
		if (!enemy.isDefeated()) ++totalRats;
	}
	
	switch(totalRats)
	{
		case 3:
			encText += "Three diminutive mouse pirates stare you down with unwavering focus, weaving slowly near each other with confident smiles on their smooth and furry faces as colorful as their attitudes. They exchange knowing glances and mime invisible instructions between their thin lips, utterly assured of their victory against you through numbers alone. They make frequent attempts to bypass and surround you, their smooth undulations and whip-cracking tails a constant hair-raising reminder to be on guard.";
			encText += "\n\nThey're protected by cobbled together suits of matte-black armor made of parts scrapped from a variety of manufacturers, giving them each a unique take on the dress code. Their helmets have special plates that fold over their wobbling, dish-shaped ears - even their tails, adorned with ribbons, are armored… <i>bladed</i>. On their gloved wrists, however, they each wear the same luminous wristband that spells 'RAT'S RAIDERS' in bright blue around the tight hoop. Those words leave fugitive shadows in the wake of elusive motions.";

			switch(ratputation())
			{
				case RatsRaider.RAT_REP_GOOD_CEO: randomDialogue.push(
					"<i>\"Show us something new this time, [pc.mister] CEO!\"</i> the rodenian girl smirks.",
					"<i>\"Make sure to give us a reward no matter what!\"</i> the freckled mouse-boy laughs.",
					"<i>\"Whatever happens, we'll take care of you, [pc.mister] CEO!\"</i> the halfbreed [rat2.boyGirl] smirks.",
					"The rats all rap their fists against their chests; the rodenian declares, <i>\"We'll beat you this time, [pc.mister] CEO! Just watch us!\"</i> There's a slight blush on their cheeks.",
					"<i>\"Show us something new this time, [pc.mister] CEO!\"</i> the rodenian girl smirks."
				); break;
				case RatsRaider.RAT_REP_HIGH:
				case RatsRaider.RAT_REP_MID:
				case RatsRaider.RAT_REP_LOW: randomDialogue.push(
					"<i>\"Heh,\"</i> the rats scoff, shivering in some recess of lust, <i>\"we've never had the chance to catch a CEO before! Teaching a greedy executive not to trod on the poor has never felt so good!\"</i>",
					"<i>\"You're finally gonna get what's comin' to ya, [pc.mister] CEO!\"</i> one rat says, <i>\"Yeah! You'll pay for your crimes! We'll make sure what you have is used to help others!\"</i>",
					"<i>\"Heh,\"</i> the rats scoff, shivering in some recess of lust, <i>\"we've never had the chance to catch a CEO before! Teaching a greedy executive not to trod on the poor has never felt so good!\"</i>"
				);
				default: randomDialogue.push(
					"<i>\"Why are you putting up a fight? You can't beat all three of us!\"</i> crows an effeminate mouse boy.",
					"<i>\"You're gonna pay extra, you know!\"</i> The furthest rodent calls out. <i>\"Just give up, you don't have to get hurt!\"</i>",
					"<i>\"Hey,\"</i> the rodenian girl coos, <i>\"we don't need to fight, just pay your due! We don't want to hurt you!\"</i>",
					"<i>\"Why are you putting up a fight? You can't beat all three of us!\"</i> crows an effeminate mouse boy.",
					"<i>\"You're gonna pay extra, you know!\"</i> The furthest rodent calls out. <i>\"Just give up, you don't have to get hurt!\"</i>"
				);
			}

			encText += "\n\n" + RandomInCollection(randomDialogue);

			encText += "\n\nThey keep you on edge, faking you out by pretending to swing or shoot. When one does this, another smacks the wall with their shock baton: the zaps and cascading sparks make the hairs on your body stand every time. In those split seconds, you see them stare hungrily at your bags and pouches, coveting the wealth they believe is contained within."
			
			if (pc.hasStatusEffect("Grappled")) encText = "The hands and paws and feet keeping you splayed and vulnerable are pushing back strong against all resistance. The bandits on your face and body work fast when you're not pushing back.";
			
			break;
		case 2:
			encText += "Two riled rodents are left standing, and their morale is undoubtedly shaken. They cast frequent and nervous glances to their insensate friend as well as each other. You dare to smirk at them, a chuckle rumbling up from your throat as they shrink back in mite fear from you. In some odd self-assuring maneuver, their tails wrap around their own ankles, strangling their urge to flee.";

			switch(ratputation())
			{
				case RatsRaider.RAT_REP_GOOD_CEO: randomDialogue.push(
					"<i>\"N-not bad… But you're still up against two of us!\"</i> one rat shouts.",
					"<i>\"G-geez, [pc.mister] CEO... You're really not gonna go easy are you?\"</i> one of the duo murmurs.",
					"<i>\"S-so be it! There's still two of us you know!\"</i> a shaky-legged mouse-thief says."
				); break;
				case RatsRaider.RAT_REP_HIGH:
				case RatsRaider.RAT_REP_MID:
				case RatsRaider.RAT_REP_LOW: randomDialogue.push(
					"<i>\"Y... You've got some fight for some big business punk!\"</i> one of the duo stammers, planting " + rat.mf("his", "her") + " feet.",
					"<i>\"You'll pay for hurting " + downedRat.mf("him", "her") + ", you slimeball CEO!\"</i> snarls the " + (rat == rat0 ? "fuzzy rodenian" : (rat == rat1 ? "freckled boy" : "fuzzy-limbed [rat2.bopGirl]."))
				);
				default: randomDialogue.push(
					"<i>\"Dammit... Y-y-you're not gonna get away with this!\"</i> one of them shouts at you, though it sounds more pitiful than threatening.",
					"<i>\"Damn you, why couldn't you have just paid!?\"</i> one shouts, smacking " + rat.mf("his", "her") + " baton against the ground."
				);
			}
			
			encText += "\n\n" + RandomInCollection(randomDialogue);

			encText += "\n\nThey feel the pressure all too intimately now that their smug poise has dissipated, though they're not about to give up just yet! They keep you back with hard, air-blurring swings, waiting for another opening.";
      
			if (pc.hasStatusEffect("Grappled")) encText = "The two rats pinning you down are resilient and quick-witted, able to keep your limbs splayed and vulnerable while they frantically work. Knowing that you have a stronger chance without all three, you brace for an opportunity.";
			
			break;
		case 1:
			encText += "One little mouse remains standing, regarding you with abject terror. In " + rat.mf("his", "her") + " eyes, you can see the desire to flee burning in one iris and camaraderie flickering in the other. " + rat.mf("He", "She") + " cries out with every swing when you approach.";

			switch(ratputation())
			{
				case RatsRaider.RAT_REP_GOOD_CEO:
					randomDialogue.push("<i>\"I'm still standing! I'll give it my all, just you wait!\"</i> " + rat.mf("he", "she") + " shouts!");
					randomDialogue.push("<i>\"[pc.Mister] CEO, I won't go down without a fight!\"</i> the last rat declares.");
					break;
				case RatsRaider.RAT_REP_HIGH:
				case RatsRaider.RAT_REP_MID:
				case RatsRaider.RAT_REP_LOW:
					randomDialogue.push("<i>\"Greedy to the end, you can't help but hurt those who don't have anything, you crook! Cheater! It comes natural for you put others down, doesn't it!?\"</i> the remaining rodent scoffs.");
				default:
					randomDialogue.push("<i>\"You won't get me, you'll pay extra for this, I swear it! E-even if I go down we'll get you!\"</i>");
			}
			
			encText += " " + RandomInCollection(randomDialogue);
			
			encText += "\n\nThe shaking in " + rat.mf("his", "her") + " legs, however, tells a much different story, even if " + rat.mf("his", "her") + " fright-fueled swings are no less ferocious.";
		
			break;
	}
	
	return encText;
}

public function ratpileHPLoss(rats:int):void
{
	output("\n\nThe futility of your struggle is far too apparent. Even if it wasn't their intention, the wounds you've suffered have become too great to bear. Your whole body shuts down in defiance of your will and want, and a wretched numbness subsumes every sore muscle beneath your [pc.skinFurScalesNoun]. You choke and gargle in blackness, eyes beginning to roll back into the miserable unseeing.");
	output("\n\nThe rat over your face climbs off in shock as soon as your lack of struggle is noticed. You gasp for air seeing " + (rats > 2 ? "two faces" : "a face") + " filled with worry, eyes roaming frantically over you. Four hands rub everywhere, pressing to your neck and your wrists. The rodents check your vitals and lift you up to an unsteady balance on your [pc.thighs]. They know you've lost, but they seem quite thankful they hadn't done worse...");

	output("\n\n<i>\"Game's over,\"</i> the [rat0.furColor] rodenian approaches, grinning");
	if (pc.tallness - 6 > rat0.tallness) output(" up at");
	else if (pc.tallness + 6 < rat0.tallness) output(" down at");
	else output(" level with");
	output(" you with her big front teeth on display. <i>\"Now it's time for you to pay the price.");
	if (ratputation() == RatsRaider.RAT_REP_GOOD_CEO) output(" Thanks for the exercise, [pc.mister] C-E-O, I think we can cut a deal now, huh?");
	else if (ratputation() > RatsRaider.RAT_REP_NONE) output(" Don't be glum, [pc.mister] C-E-O, you're just learning a valuable lesson.");
	output("\"</i>");

	output("\n\nGrumbling and groaning, you lurch forward in dismay.");
}

public function ratpileLustLoss():void
{
	output("\n\nThe convulsing futility of your struggle has become far too apparent. Even though it wasn't their intention, these rapacious rodents have turned you on, and they have turned you on so bad that their frivolity over-eye is but a distant thunder to the");
	if (!pc.hasGenitals()) output(" phantom feeling of");
	output(" sloughing lust in your seething nethers. You're so painfully aroused that you can't think of getting violent now.");
	
	output("\n\nFortunately(?), they notice your struggles cease, and it surprises you that your grappler dives off to let the others check your vitals. There's a tense fear in their colorful eyes until they acknowledge you aren't dead. The spry bandits flash you gleaming smiles when they note your pink-tinted face and heavy breathing, smiles of victory. You have no choice but to admit surrender to these thieving rodents.");

	if (pc.isBro())
	{
		output("\n\nGroaning in aggravation, you paw at your groin, stricken with irresistible need. <i>\"I don't need any of that stuff. But I do need a good time…\"</i> You murmur");
		if (!pc.isCrotchGarbed())output(", struggling to remove your [pc.crotchCovers]");
		output(".");
	}
	else if (pc.isBimbo()) output("\n\n<i>\"Ughh… You can have whatever you want, I don't care, but pleeeassseee fuck me! I can't take this anymore!\"</i> You wail, hands already roving around your groin.");
	else if (pc.isNice()) output("\n\n<i>\"I can't fight... you win. You can take anything you want but please don't leave me like this!\"</i> you cry as your tremulous loins grow hotter.");
	else if (pc.isMisch()) output("\n\n<i>\"E-enough, you win! Whatever you want you can have, but get me off first!\"</i> you sag, shivering with all-consuming lust as you try to attend yourself.");
	else output("\n\nYou say nothing, merely lunging for your crotch. They know they can take whatever they want, even you, but all that matters is you get off <i>now.</i>");
}
