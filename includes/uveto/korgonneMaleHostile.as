import classes.Characters.KorgonneMale;

/* Located in korgonneFemaleHostile.as:
public function korgiTranslate():Boolean
{
	return true;
}*/

public function showKorgiMaleHostile(nude:Boolean = false):void
{
	showName("MALE\nKORGONNE");

	if (enemy != null)
	{
		if (nude) showBust(enemy.bustDisplay + "_NUDE");
		else showBust(enemy.bustDisplay);
	}
	else
	{
		if(nude) showBust("KORGONNE_MALE_NUDE");
		else showBust("KORGONNE_MALE");
	}
}

/*references (for me)
By Zeikfried

the pitch:
//15,000 word max payout
A random korgonne raider from a nearby village, looking to get some fuk treasure from an unsuspecting offworlder. Encounter would be in the snowy Ice Plains. Your choice of single or group fite (group could have mixed genders). Should probably add in a weapon or item they could drop. Likely that the korgonne have acquired shield generators and some tech from other "victims" over the years, so mix up the primitive and high tech if you want.

Additional reference art: 1, 2, 3

Adjatha’s female korgonne (scum me for items):
https://docs.google.com/document/d/1nre7QbHOdZmkX4KMP1w5j0NDZ38iWc-YzSFUgqjp0jM/edit#

the codex:
https://docs.google.com/document/d/1HdVxwqS6nrLnGfPcZ6C9aVStriJJWNQg8LC7hImkOXs/edit

existing framework/canon:
-male korg are taciturn; female korgonne have pheromone pussy juice to overcome it and start sex with a snoot full of puss
-Fen wants to add a village with a chieftan and a chieftain’s daughter (written by Fen)
-korg girls have huge, loose pussies with the nerves on the inside to receive knot, so males had better have knot
-korg have pads on hands and feet
-short and pudgy as a racial feature, like eskimos
-Fen wants digitigrade feet
	-add wide, splayed toes like a camel's to keep atop the shifting snows

information to find out:
-will pussy pheromones be an ingredient of the korgonne TF (if one is created)?


male traits and sexuality (new):
-doesn’t fuck the PC after a fight unless the PC has raised his lust
-really likes wide hips and other signs of childbearing capability, because of the korg female’s less-than-ideal birthrate (sense/tease tendency)
-korg male sexuality is much more sudden and impulsive than female because they only fuck when teased to arousal, so the korg male gets naked in the snow without worrying about shelter
-korg knot swells with cum throughout the fuck, but doesn't 'open the gate' until orgasm
-during orgasm, cum must be squeezed from the knot by outside pressure (this is why the korg female pussy goes from being loose to locking down hard enough to cramp your hand)
-if cum is not squeezed out, it will only come out in a long, tormenting trickle that frustrates the korg immensely
-possible that getting aroused again before emptying off causes the 'gate' to close, locking in the last load and adding a new one to it; this could form the basis of a korgonne 'dominatrix'/orgasm denial fetish culture based on a /frequent/ stimulation rather than lack of it

summary (coder/reviewer start here)
counterpart to the female korgonne barbarian; no new items but contains a pregnancy sequence for korgonne-PC children


new mechanics

korgonne may offer to surrender when heavily damaged
//korg may offer to surrender when badly injured/high lust and PC may 'wait' on the next turn to agree (requires a little fiddling with attack timings and/or re-checking health and overriding the NPC's previously-selected attack to make the sequence work, I think)
//if PC agrees, 25% chance of getting a salable item, 50% chance of simply ending fight, and 25% chance of the korgonne launching a heavy attack when PC's guard is down

korgonne cocks
//new cock type corresponding to the korgonne's cock description in the codex should be created
//from codex: "Males are equipped with a retractable phallus, black in color, that expands in size the longer it kept aroused. A single, large gonad provides sperm, pooling it in a canid knot at the base of the shaft during arousal."

observes racial cues, but poorly
//the korgonne addresses PCs differently depending on whether they're canine, feline, or other
//example distinction: {(if PC is milodan, kaithrit, naleen, or other cat-morph)cat/(if PC is korg, ausar, huskar, or other dog)outsider/(else)alien}

(optional) loss scene selection weighted by enemy sexual preferences
 //I think it would be a cool mechanic to assign the loss scene selections varying weights according to the particular individual's randomly-determined sexual preferences (the ones revealed by 'Sense' skill), to more integrate the combat and post-combat scenes
//I've done some very preliminary suggestions on the loss scenes as to which preferences they're suited to
*/

public function korgMaleEncounter():void
{
	author("Zeikfried");

	var tEnemy:KorgonneMale = new KorgonneMale();
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(winVsKorgonneMale);
	CombatManager.lossScene(maleKorgonneLossRouter);
	CombatManager.displayLocation("KORGONNE (M)");
	
	showBust(tEnemy.bustDisplay);

	if(flags["MET_KORG_MALE"] == undefined)
	{
		var missed:Boolean = true;
		output("\n\nSomething flies past you and buries itself in the snow! ");
		//(high rfx dodges)
		if(rangedCombatMiss(tEnemy, pc)) output("You immediately hunch low and sidestep just as two more hit where you were standing. One disappears, but the other gets stuck in your densely-packed tracks.");
		//(low rfx gets hit)
		else 
		{
			missed = false
			output("You react too slowly; two more follow it, hitting you in the shoulder.");
			//(shielded)
			if(pc.shields() > 1) 
			{
				output(" Your shield flickers as they glance off and fall nearby.");
				pc.changeShields(-3);
			}
			else
			{
				output(" Two sharp pinches hit home; as pain begins to radiate through your shoulder, you reach back and retrieve the projectile.");
				//Deal 3 damage and poison yer bootyhole.
				//(if poisoned)
				if(!pc.hasStatusEffect("Poisoned"))
				{
					output(" <b>You have been poisoned!</b>");
					if (!pc.hasStatusEffect("Poison")) output(" <b>You’re poisoned!</b>");
					CombatAttacks.applyPoison(pc, 1, 3, 15);
				}
				output(" It’s a small, spiny bone dart with flanges of fur.");
			}
		}
		output("\n\nYou pan the area and a shape rises from the snow, shaking powder from its back. ");
		//(has met fem korg)
		if(CodexManager.entryUnlocked("Korgonne")) output("It’s a korgonne! And from the flat chest and the legs wrapped in hides instead of brazenly exposed, this one looks to be male.");
		else output("It’s a stocky dog-man of some sort, with his legs wrapped in hides and the rest of him covered in a big coat with many flaps and bulging pockets.");
		output(" Under his whip-stitched hood, his " + tEnemy.eyeColor + " eyes flash and his ");
		//(dodged or shielded)
		if(missed) 
		{
			output("grimacing muzzle exposes bluish gums. <i>“Stupid ");
			//(PC is a type of cat-morph)
			if(InCollection(pc.raceShort(), ["kaithrit", "milodan", "feline"])) output("cat");
			else if (InCollection(pc.raceShort(), ["ausar", "huskar", "korgonne", "canine", "vulpine", "lupine"])) output("outsider");
			else output("alien");
			output(", why you no darted?”</i>");
		}
		else output("grinning muzzle exposes bluish gums. <i>“Awooo? Korgonne too much for you!”</i>");

		if(!CodexManager.entryUnlocked("Korgonne")) 
		{
			output("\n\nYour codex beeps. <i>“Korgonne identified. Tribal species native to Uveto VII that is frequently hostile to outsiders. Females are sexually aggressive and will use force and genital pheromones to entice mating, while males are less libidinous but no less violent. Individuals hunting afield or raiding generally do so via ambush. Use caution when traversing government-recognized korgonne lands.”</i>");
			CodexManager.unlockEntry("Korgonne");
			output("\n\nNo kidding?");
		}
		output("\n\n<b>It’s a fight!</b>");
		//begin combat; subtract the cost of three dart attacks (see below) from korg’s starting energy
		//make sure to set up the combat earlier for eyetype determination.
	}
	//repeat, random 1 (dart throw)
	//tie likelihood to low PC shield strength if you like?
	//ambush much less likely to hit now that PC expects korgonne in the area, but same rules if it does hit
	else if(rand(2) == 0)
	{
		output("\n\nA blur in the snow is all the warning you get before a pair of darts come flying at you! ");
		//(miss)
		if(combatMiss(tEnemy, pc)) output("Luckily you were expecting them - this is korgonne hunting land, after all. You stop short and they continue past, through where you would have been.");
		//(hit, shielded)
		else if(pc.shields() > 3) 
		{
			output("They ping your shield harmlessly and fall to the ground.");
			pc.changeShields(-3);
		}
		else
		{
			output("They ");
			if(pc.shields() > 0)
			{
				output("penetrate your shield and ");
				output("embed themselves, and an ill feeling twists your gut.");
				pc.changeShields(-3);
			}
			//(if poisoned)
			if(!pc.hasStatusEffect("Poisoned"))
			{
				output(" <b>You have been poisoned!</b>");
				if (!pc.hasStatusEffect("Poison")) output(" <b>You’re poisoned!</b>");
				CombatAttacks.applyPoison(pc, 1, 3, 15);
			}
		}
		output("\n\n<b>It’s a fight!</b>");
		//subtract 2 dart cost from korg’s starting energy, begin combat
		tEnemy.energy(-10);
	}
	//repeat, random 2 (knife ambush)
	//slightly more likely to hit than the repeat dart since korgo is right on top of PC
	else
	{
		output("\n\nThe snow explodes beside you and a flash of brown ");
		if(tEnemy.furColor != "brown") output("and " + tEnemy.furColor);
		output(" surges forward! ");
		//(miss)
		if(combatMiss(tEnemy, pc)) output("Already on alert in korgonne lands, you sidestep and one of their raiders sails by, knife in hand. He plants face-first in the snow, then scrambles to his feet and challenges you again.");
		else
		{
			output("The weight of a stocky korgonne raider hits you, grappling and slashing at you. You recover your wits and push him back, but not before he’s done some superficial");
			if(pc.hasShields() && pc.shields() > 0) output(" damage to your shield");
			output(".");
			//deal simple kinetic slashing damage if hit (no bleed)
			var damage:TypeCollection = tEnemy.meleeDamage();
			damageRand(damage, 15);
			applyDamage(damage, tEnemy, pc, "minimal");
		}
		output("\n\n<b>It’s a fight!</b>");
	}
	IncrementFlag("MET_KORG_MALE");
	//begin combat
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}


//normal PC win intro (target words < 500):
//only used if fight ends normally; the benign ‘mercy’s reward’ outros override the default win intro (but lead to same sex menu)
public function winVsKorgonneMale():void
{
	if(enemy.statusEffectv1("PEACEFUL_WIN") == 2)
	{
		//functions as end of combat and sex intro; normal drop table is overridden with savicite/picardine
		output("The korgonne looks pleased when you stay your hand. <i>“");
		if(enemy.lust() >= 33 && pc.mf("","girl") == "girl") output("You pretty...");
		else output("You nice...");
		output("”</i> he says. His paw emerges from the pocket holding a glittering stone! <i>“");
		//(enemy lust >= 30% and PC feminine)
		if(enemy.lust() >= 33 && pc.mf("","girl") == "girl") output("Pretty for pretty?");
		else output("Valuable stone... like?");
		output("”</i>");

		//load gem reward into enemy loot.
		if(rand(2) == 0) enemy.inventory.push(new Savicite());
		else enemy.inventory.push(new Picardine());

		output("\n\nThe fight has concluded on very good terms. ");
		//(PC lust too low)
		if(pc.lust() < 33) output("Not aroused enough to get intimate, you accept the expensive gift and leave the korgonne behind.");
		else 
		{
			output("You accept the expensive gift and the korgonne smiles");
			if(enemy.lust() >= 33 && pc.mf("","girl") == "girl") output(", searching your body with his odd eyes. He’d definitely ");
			else output(". He’d probably ");
			output("be into ‘exploring’ your new relationship further, if you asked.");
			//(tailcunt needs feeding)
			if (target.hasCuntSnake() && flags["DAYS_SINCE_FED_CUNT_TAIL"] != undefined && flags["DAYS_SINCE_FED_CUNT_TAIL"] >= 7)
			{
				output(" Your parasitic tail-cunt apparently feels the same way, because it lunges for the korgonne’s dick as you grab the gem!");
				//shunt into 'Cowgirl' sexscene, cunnertail variant.
				clearMenu();
				addButton(0,"Next",korgCowgirlWin,true);
				return;
			}
			//end fight and queue up gem reward instead of normal drops
			//else if tailcunt needs feeding, do ‘Next’ and shunt into ‘Cowgirl’ sex scene, tailcunt variation
			//else present sex menu
		}
	}
	//50% chance of cease-fire; fight ends early but with normal drop table
	else if(enemy.statusEffectv1("PEACEFUL_WIN") == 1)
	{
		//functions as end of combat and sex intro; normal drop table is intact
		output("The korgonne looks pleased when you remain still. <i>“");
		if(enemy.lust() >= 33 && pc.mf("","girl") == "girl") output("You pretty...");
		else output("You nice...");
		output("”</i> he says. His paw emerges from the large pocket holding a beat-up tin. <i>“Want canned eel?”</i>");

		output("\n\nYou decide not to contract the Uveton version of botulism and shake your head.");

		output("\n\n<i>“You no take canned eel?”</i> he says, faintly disappointed.");
		if(enemy.lust() >= 33 && pc.mf("","girl") == "girl") output(" <i>“Maybe... share korgonne heat instead?”</i>");

		output("\n\nThe fight has concluded on somewhat friendly terms");
		if(pc.lust() < 33) output(". Disinclined to suggest anything more intimate, you leave the korgonne behind.\n\n");
		//else
		else 
		{
			output(", and the korgonne seems amenable to ‘exploring’ your new relationship further.");
			//(tailcunt needs feeding)
			if (target.hasCuntSnake() && flags["DAYS_SINCE_FED_CUNT_TAIL"] != undefined && flags["DAYS_SINCE_FED_CUNT_TAIL"] >= 7)
			{
				output(" Your parasitic tail-cunt apparently feels the same way, because it lunges for the korgonne’s dick, spreading its lips wide!");
				//else if tailcunt needs feeding, do ‘Next’ and shunt into ‘Cowgirl’ sex scene, tailcunt variation
			}
		}
		//end fight, but with normal drops
		//if lust too low, do whatever
		//else present sex menu
	}
	//if tailcunt hasn’t been fed
	if (pc.hasCuntSnake() && flags["DAYS_SINCE_FED_CUNT_TAIL"] != undefined && flags["DAYS_SINCE_FED_CUNT_TAIL"] >= 7)
	{
		output("You consider the korgonne, but before you have time to make a decision, one is made for you! Your parasitic [pc.tail], starved of intimacy for too long, lunges at the korgonne’s crotch!");
		//go automatically to ‘Cowgirl’ sex, tailcunt var.
		clearMenu();
		addButton(0,"Next",korgCowgirlWin,true);
		return;
	}
	//else
	else
	{
		output("You consider the korgonne");
		if(pc.lust() < 33) output(", but you’re not horny enough to do anything with him");
		output(".");
		if(pc.lust() >= 33) output(" His eyes dance with alive interest in you... you could have him if you want. Do you take him, and how?");

		//buttons ‘Cowgirl’, ‘Pitch Anal’, ‘Pussy-worship’, ‘Mutual Masturbation’
	}
	output("\n\n");
	korgWinSexMenu();
}

public function korgWinSexMenu():void
{
	clearMenu();
	if(pc.lust() >= 33)
	{
		addButton(0,"Cowgirl",korgCowgirlWin,undefined,"Cowgirl","Ride the raider’s naughty, knotty dick with your [pc.vagOrAss].");
		if(pc.hasCuntSnake()) addButton(1,"Cowgirl(Tail)",korgCowgirlWin,true,"Cowgirl(Tail)","Snake your insatiable tail into the raider’s legwraps and stuff it with knotty korgonne dick.");
		else addDisabledButton(1,"Cowgirl(Tail)","Cowgirl(Tail)","You need a parasitic tail-vagina for this.");

		if((pc.hasCock() && pc.cockThatFits(enemy.analCapacity()) >= 0) || pc.hasHardLightEquipped() || pc.hasTailCock()) addButton(2,"Pitch Anal",pitchKorgAnal,undefined,"Pitch Anal","Fill the korgonne’s ass with a phallic object.");
		else if(pc.hasCock()) addDisabledButton(2,"Pitch Anal","Pitch Anal","You won’t fit him with your mountainous meat.");
		else addDisabledButton(2,"Pitch Anal","Pitch Anal","You don’t have anything to fuck the raider’s ass with!");

		if(pc.hasVagina() && pc.blockedVaginas() == 0) addButton(3,"PussyWorship",korgPussWorship,undefined,"Pussy-Worship","Entice the korg-boy to serve with a snoot full of pussy.");
		else if(pc.blockedVaginas() > 0 && pc.hasVagina()) addDisabledButton(3,"PussyWorship","Pussy-Worship","You should get rid of whatever is blocking your [pc.vaginas] first.");
		else if(pc.hasCuntSnake()) addDisabledButton(3,"PussyWorship","Pussy-Worship","You need to have a pussy to make the korgonne worship - your parasitic tail-cunt isn’t interested in reverence, only sperm.");
		else addDisabledButton(3,"PussyWorship","Pussy-Worship","You need to have a pussy to make the korgonne worship.");

		if(!pc.hasGenitals()) addDisabledButton(4,"Mutual Mast.","Mutual Mast.","Before the korgonne can masturbate your genitals to orgasm, you need to get some genitals!");
		else if(pc.hasVagina() && !pc.hasCock() && pc.blockedVaginas() > 0) addDisabledButton(4,"Mutual Mast.","Mutual Masturbation","You should get rid of whatever you have blocking your pussy up first.");
		else if(pc.isTaur() && !pc.hasCock()) addDisabledButton(4,"Mutual Mast.","Mutual Mast.","The korgonne can’t reach your pussy all the way at the end of your body!");
		else addButton(4,"Mutual Mast.",mutualMasturbkorg,undefined,"Mutual Masturbation","Have the korgonne use his hand to bring you to orgasm while you stroke him off.");
	}
	else
	{
		addDisabledButton(0,"Cowgirl","Cowgirl","You aren’t aroused enough for this.");
		addDisabledButton(1,"Cowgirl(Tail)","Cowgirl (Tail)","You aren’t aroused enough for this.");
		addDisabledButton(2,"Pitch Anal","Pitch Anal","You aren’t aroused enough for this.");
		addDisabledButton(3,"PussyWorship","Pussy-Worship","You aren’t aroused enough for this.");
		addDisabledButton(4,"Mutual Mast.","Mutual Masturbation","You aren’t aroused enough for this.");
	}
	addButton(14,"Leave",CombatManager.genericVictory);
}

//Cowgirl (target words: 1500) (current words: 1820)
//suitable for all PCs
//PC rides the korg with vag, ass, or tailcunt
//tailcunt does it inside the korg’s clothes, everyone else gets naked
//tooltip: {(if using pussy or ass)Ride the raider’s naughty, knotty dick with your {pussy/asshole}. /(else using tailcunt)Snake your insatiable tail into the raider’s legwraps and stuff it with knotty korgonne dick. }

public function korgCowgirlWin(tailForce:Boolean = false):void
{
	clearOutput();
	showKorgiMaleHostile(true);
	author("Zeikfried");
	
	var vIdx:int = -1;
	if(pc.hasVagina() && pc.blockedVaginas() == 0) {
		vIdx = pc.findEmptyPregnancySlot(1);
		if(vIdx < 0) vIdx = pc.smallestVaginaIndex();
	}
	
	//special tailcunt opener
	if(tailForce)
	{
		output("Your eager parasite quickly finds the raider’s waistband and disappears inside, and you can feel the end of it open up to grope the bewildered dog-man. After some blind searching, it runs across the tapered tip of his cock and grabs on, trying to keep a grip with a wet, horny pussy as the rest of your tail thrashes and twists to push his pants aside. The activity and intimacy stir the raider’s arousal; his cock hardens, giving your tail the leverage to work itself free of his loose leg-wraps With a big wave, it jerks the raider’s pants down and exposes his cock: a big, black doggy-dick.");
		if(pc.hasCock() && !pc.isCrotchExposed()) 
		{
			output(" The sight and feel of it fairly dancing around the hole in your tail-pussy sets you a-shiver, and your own ");
			if(pc.cockTotal() == 1) output("cock hardens");
			else output("cocks harden");
			output(". Eagerly, you strip off your [pc.crotchCovers], exposing yourself as well.");
		}
	}
	//else non-tailcunt opener
	else
	{
		output("You slip a hand into the korgonne’s legwraps, searching for his cock. Your fingers brush across a wet, tapered tip, and you wrap them around it, gingerly teasing and tousling. ");
		if(enemy.HP() <= 0) output("The korgonne’s demeanor calms almost immediately when you do; he changes from distrustful to affectionate. ");
		output("The dick in your hand begins to harden, and you release it. The raider whimpers like a puppy, but you need both hands to navigate his complicated leg-wraps. You unfasten them and pull them down, exposing your lover: his dick is big, black, and veiny, and points at you with just as much intensity as his hungry eyes.");
	}
	//merge openers here
	output("\n\nThe excited korgonne draws close to you, pulled in by ");
	if(tailForce) output("your tail on ");
	output("his dick; he places his hand on your waist and pushes you gently. His other hand comes down on your shoulder - he’s trying to turn you around and bend you over. The korgonne whimpers urgently, coaxingly, trying to communicate his wishes. ");
	if(pc.isNice() || pc.isMischievous()) output("It might be fun to let him take you from behind... but it’s not what you had in mind for today. Firmly, you remove his hands");
	else output("The fuck? This beaten dog has some nerve, trying to shove you down and ride your ass. Roughly, you knock his hands away");
	output(" and push the alien to the ground. He resists at first, but you rub his black dick with a [pc.knee], re-asserting your intentions.");

	output("\n\nAssured he’s still getting what he wants, the korgonne leans back on his elbows, relaxing in the snow. You straddle him with a [pc.thigh] on each side, and place your hands against his chest. Little toggles stuck through hide loops hold his thick coat closed over his broad chest... ");
	if(pc.isAss()) output("you smile sadistically and slash each one with a flick of his knife, then fling the coat open to the cold air and run your fingers greedily through his dense, comfortable fur.");
	else 
	{
		output("you nibble your lip, and unfasten each one in turn. Your pinned lover’s alien eyes search yours, wide pupils dancing as your ");
		if(pc.aim() + pc.reflexes() < 30) output("clumsy");
		else output("nimble");
		output(" fingers pop each fastener. When the last toggle is free, you slide your hands under the hem of the coat and find his firm stomach, then <i>slowly</i> push upwards, feeling the short, dense fur move between your fingers as you force the coat apart.");
	}
	output(" The korgonne’s breath hitches once, and then deepens; you can see his chest move, just enough to rock you slightly on your perch. His little [enemy.nippleColor] nipples are sticking up.");

	if(!pc.isTaur()) output("\n\nBehind");
	else output("\n\nUnder");
	output(" you, his black cock becomes even harder, poking from its animal sheath like a turtle and depositing a little dab of doggy pre onto your ");
	if(pc.isTaur()) output("[pc.belly]");
	else if(pc.tailCount > 0) output("[pc.tail]");
	else output("[pc.ass]");
	output(". You ");
	if(pc.isTaur()) output("stick your ass out and ");
	output("rub against it, and feel a sigh of pleasure");
	if(!pc.isTaur()) output(" under your hands");
	output(" in the rise and fall of the korgonne’s chest. ");
	if(tailForce) output("Your [pc.tail] is sitting like a cap atop his penis, pushed up by the rapid erection; with great gusto, you slide it down again, consuming the raider in your alien parasite pussy.");
	else if(pc.isTaur()) 
	{
		output("It’s necessary to scoot forward to present your [pc.vagOrAss " + vIdx + "] for the korgonne... you do so, and wiggle out your instructions in squeezes and nudges, buffeting him with your larger tauric body like an ocean gently urging a boat along. His hands find your [pc.hips], and then his crown your ");
		if(vIdx >= 0) output("labia");
		else output("anus");
		output("; pleased, you lower your rump and savor every vein and bump of the shaft entering you.");
	}
	else
	{
		output("You spread yourself over the korgonne’s muscular, stocky chest like a drape, gently ");
		if(pc.biggestTitSize() >= 2) output("jostling him with your [pc.breasts] and ");
		output("nudging his stiff doggy dick with your ass. He seems to take the hint. A pair of soft-padded hands find your [pc.hips] and hold you in place, then a hot, spongy crown ");
		if(vIdx >= 0) output("parts your labia");
		else output("pokes at your asshole");
		output(". You tease yourself as long as you can stand it, utterly sure of your power over the eager korgonne");
		if(pc.isBimbo()) output("; you continue so long, gyrating and brushing pre from his throbbing cock, that he whimpers like a puppy");
		output(". Then, with a smooth downward push, you finally grant yourself the next stage of relief.");
	}
	output("\n\nYour itch-scratching is interrupted, though, by a surprise korgonne. A bulge swells inside your ");
	if(tailForce) output("tail");
	else output("[pc.vagOrAss " + vIdx + "]");
	output(", pressing outward, pinning your nerves. His alien cock is growing! The base inflates slowly, insistently, as if filling with pressurized fluid, balling up into a hard knot.");
	// stretch check here
	if(!tailForce)
	{
		if(vIdx >= 0) pc.cuntChange(0,enemy.cockVolume(0));
		else pc.buttChange(enemy.cockVolume(0));
	}

	output("\n\n<i>“You so fiery,”</i> the korgonne grunts, as his hot knot presses into the walls of your ");
	if(tailForce) output("tailcunt");
	else output("[pc.vagOrAss " + vIdx + "]");
	output(".");
	var looseness:Number = 1;
	if(tailForce) looseness = 1;
	else if(vIdx >= 0) looseness = pc.vaginas[vIdx].looseness();
	else looseness = pc.ass.looseness();
	if(looseness < 3) output(" <i>“Grip so tight.”</i>");

	//if has cock
	if(pc.hasCock())
	{
		output("\n\nYou look down at the korgonne you’re riding, watching his caprine eyes roll with pleasure in his snubby face. His blue nose twitches in the cold, and a wisp of steam escapes as he exhales hot breath. He’s so cute...");
		if(pc.libido() >= 70) output(" he’d look even cuter covered in your cum");
		else output(" his earnest little eyes are turning you on even more");
		output(".");
		
		if(pc.isTaur() || pc.isAss()) 
		{
			output("\n\n<i>“Hey,”</i> you interrupt. The korgonne’s eyes focus. You meet them, then look down at your [pc.cocks]. He grimaces a little, and you thrust it at him, just for emphasis. He grunts as your ");
			if(tailForce) output("tail");
			else if(vIdx >= 0) output("pussy");
			else output("asshole");
			output(" swivels around his tight knot, and haltingly, timidly, moves his hand from your hip. Soft, leathery pads touch your [pc.sheath]; the raider’s fingers wrap around, making a tight little ring for you to thrust through while you pivot on his dick.");
		}
		else output("\n\nYou lean down and press your chest to his, catching his lips with an affectionate kiss, and your hand creeps to your [pc.cock]. The korgonne smiles when you break away... but when you sit up again, fingers tight around your [pc.cockHead] and aiming toward his mouth, the smile turns to a pout. It doesn’t last long, though; when you resume pivoting on his doggy dick, his pout becomes a whine of pleasure and he once again becomes distracted, panting and lolling his tongue out.");
	}
	//rejoin
	output("\n\nThe knot inside you makes it hard to pump your hips the way you want, but with the way it’s filling you, it hits every nerve in your stretched hole regardless. You gyrate your hips, rolling on the fleshy bulb, feeling its blood vessels in relief as you lean into them; the korgonne howls quietly whenever you bend over particularly far, enchanted by your ");
	if(vIdx >= 0 || tailForce) output("cunt’s");
	else output("asshole’s");
	output(" intimate grip. His own hips pump slightly, shifting the knot back and forth and making sure it stretches you to the limit. His tip taps out poetry deep inside you; trapped in the groove like a record needle, it can only rub against your ");
	if(vIdx >= 0 || tailForce) output("pussy");
	else output("asshole");
	output(" whenever you lean in... so you make sure to lean in a lot, bending over ");
	if(!pc.isTaur()) output("to kiss the korgonne whenever he looks cute ");
	output("and burying the tip deep. Your lovers cries become sharper and more urgent; whatever you’re doing to his dick, it’s about to make him cum. You slow down, trying to ride it as long as you can, but your own climax is drawing close as well....");

	output("\n\nThe korgonne whines softly, and the first stroke of doggy jizz hits your ");
	if(tailForce) output("tail");
	else if(vIdx >= 0) output("cervix");
	else output("asshole");
	output(". He pumps his hips, pushing the knot against the walls of your stretched hole and squeezing out cum; it washes over your intimate inside places as he grunts and paws at your hips. You oblige by pushing up, pinching the trapped alien organ with your ring, and a huge wave of cum distends his cock, climbing upwards to release in a bulge so big you can feel it moving. The korgonne’s mouth opens wide, and he staggers out a cry. <i>“Give you puppies!”</i> he urges, looking deep into your eyes.");

	output("\n\nThe korgonne’s impassioned stare and the slick knot grinding in your nerves sets you off. With a grunt as loud as your lover’s, you cum, churning the pup’s poor knot with your spasming ");
	if(tailForce) output("tail");
	else output("[pc.vagOrAss " + vIdx + "]");
	output(" and squeezing the next load of doggy sperm free to ");
	if(tailForce) output("fertilize your parasite");
	else if(vIdx >= 0) output("seek your eggs");
	else output("bloat your [pc.belly]");
	output(".");
	if(pc.hasCock())
	{
		output(" [pc.EachCock] pulses hotly in ");
		if(pc.isNice()) output("your hand");
		else output("the korgonne’s hand");
		output(" and spurts; ");
		if(pc.cumQ() < 40) output("little droplets");
		else if(pc.cumQ() < 600) output("great ropes");
		else output("massive floods");
		output(" of [pc.cum] cover the surprised raider’s face, painting him like he paints your ");
		if(tailForce) output("tail");
		else if(vIdx >= 0) output("womb");
		else output("guts");
		output(".");
	}

	if(looseness <= 3)
	{
		output("\n\nThe korgonne’s hips gradually stop pumping and his gasps weaken, but his swollen knot remains lodged inside your ");
		if(tailForce) output("tail");
		else output("[pc.vagOrAss " + vIdx + "]");
		output(". Every time you try to pull away from his softening doggy dick, another spurt of egg-hunting jizz squeezes free, and the korgonne issues a soft whine. <i>“Take all heat,”</i> he insists, <i>“have many puppies.”</i> It looks like you don’t have much choice... you relax against the alien’s plush fur as you wait for his swollen gonad to finish leaking seed into you. After five minutes, he’s finally empty enough to dismount.");
	}
	//(else if loose enough)
	else
	{
		output("\n\nThe korgonne’s hips go still long before new squirts of doggy-cum stop warming your insides; his hands weaken and fall from your hips, but the thick knot in your [pc.vagOrAss " + vIdx + "] still grips you in their place. <i>“Take all heat,”</i> the korgonne grunts, <i>“have many pups.”</i> Hahhh... you’re not sure if that’s in the plans, but you do know you’d prefer not to sit half-naked in the freezing cold, heating implement or otherwise. You get your [pc.legs] under you and push off of the korgonne; your super-loose hole relinquishes his still-swollen knot with a loud, wet ‘pop’. The korgonne’s eyes widen as you end his impregnation session prematurely and a gush of warm doggy jizz drools from your abused ");
		if(tailForce || vIdx >= 0) output("pussy");
		else output("anus");
		output(" to harden on your [pc.thigh] in the bitter wind. He whimpers at the sight, and the next spurt of cum strokes from his cock, only to find cold, unwelcoming air and a crash-landing on his furry chest.");
	}
	output("\n\nYou collect your gear, blow the exhausted alien a kiss, and leave.");

	//do time, pc orgasm, korgonne load in selected slot
	//reduce vaginal impreg chance by a lot if PC vag capacity is high enough for the knot to slip out
	processTime(30);
	if(looseness <= 3) processTime(20);
	pc.orgasm();
	if(tailForce) pc.loadInCuntTail(enemy);
	else if(vIdx >= 0) pc.loadInCunt(enemy,vIdx);
	else pc.loadInAss(enemy);

	output("\n\n");
	CombatManager.genericVictory();
}

//Pitch Anal (target words: 1500) (current words: 1428)
//req. a fit cock, hardlight dildo, or tail-cock
public function pitchKorgAnal():void
{
	var targets:Array = [];
	if(pc.hasHardLightEquipped()) targets.push(-2);
	if(pc.hasCockTail()) targets.push(-1);
	for(var x:int = 0; x < pc.cockTotal(); x++)
	{
		targets.push(x);
	}
	if(targets.length < 1) {
		output("ERROR!\n\n");
		CombatManager.genericVictory();
		return;
	}

	if(targets.length == 1) actualKorgAnalPitch(targets[0]);
	else
	{
		clearOutput();
		showKorgiMaleHostile();
		output("What will you pitch with?");
		
		output("\n\n<b><u>Suitable:</u></b>");
		clearMenu();
		for(x = 0; x < targets.length; x++)
		{
			if(targets[x] == -2) {
				output("\n<b>Hardlight Strap-On:</b> " + StringUtil.toDisplayCase(pc.lowerUndergarment.longName));
				addButton(x,"Hardlight",actualKorgAnalPitch,targets[x],"Hardlight","Fill the korgonne’s ass with your hardlight dildo.");
			}
			else if(targets[x] == -1) {
				output("\n<b>Tail-cock:</b> " + StringUtil.toDisplayCase(pc.oneTailGenitalDescript()));
				addButton(x,"Tailcock",actualKorgAnalPitch,targets[x],"Tailcock","Fill the korgonne’s ass with your tailcock.");
			}
			else {
				if(pc.cocks.length == 1) {
					output("\n<b>Penis:</b>" + penisRouterCockDesc(targets[x]));
					addButton(x,"Penis",actualKorgAnalPitch,targets[x],"Penis","Fill the korgonne’s ass with your cock.");
				}
				else {
					output("\n<b>" + StringUtil.capitalize(num2Ordinal(targets[x] + 1)) + " Penis:</b>" + penisRouterCockDesc(targets[x]));
					addButton(x,"Penis " + (targets[x] + 1),actualKorgAnalPitch,targets[x],StringUtil.capitalize(num2Ordinal(targets[x] + 1)) + " Penis","Fill the korgonne’s ass with your cock.");
				}
			}
		}
	}
}

//-2 = hardlight, -1 = tailcock, else cocknum
public function actualKorgAnalPitch(target:Number):void
{
	clearOutput();
	showKorgiMaleHostile(true);
	author("Zeikfried");
	//if using hardlight
	if(target == -2)
	{
		output("\n\nThe korgonne stares " + pc.mf("quizzically","excitedly") + " when you ");
		if(pc.isCrotchExposedByArmor()) output("show off");
		else output("strip down to");
		output(" your [pc.lowerUndergarment], but you quickly set him straight - with a ‘bzzt’, you key up the hardlight projector and manifest your nine-inch, holographic prick. The dog-man’s caprine eyes quiver at the sight, and his mouth turns down in a frown... ");
		if(pc.hasVagina()) output("either because he’s not getting to explore the girly bits underneath your cute underwear or, more probably, because ");
		output("he’s just realized that he’s in for a hard time with your hard light.");
	}
	//else
	else
	{
		output("The korgonne watches you warily as you ");
		if(!pc.isCrotchExposed()) 
		{
			output("strip down; when you first begin to lower your [pc.crotchCover] he grins happily, but when your [pc.cocksLight] make");
			if(pc.cockTotal() == 1) output("s");
			output(" an appearance, his nervous expression returns.");
		}
		else output("approach, poking a stiffening [pc.cocksLight] at him.");
	}
	//merge
	if(pc.isNice()) output("\n\nYou offer the raider your hand and he takes it curiously;");
	else output("\n\nYou grab the raider’s hand and pull him in range to position, then");
	output(" with a clear picture of how you want to take him in your mind, you turn him about and bend him over. He resists a little at first, but only a little, and only reflexively... a bulge in his pants hints that he’s not as confused by this as his wary eyes look. You ");
	if(pc.isNice()) output("unfasten his legwraps");
	else output("slash the cord to his legwraps");
	output(", loosening them enough to pull them down over his fluffy tail and expose his muscular ass. Below it dangles his tapered, half-erect doggy-dick, like a black exclamation mark.");

	output("\n\nBlue and shy, his little butthole peeks from his dense, bushy fur, winking in wonder as you press close. The raider looks nervously over his shoulder, waiting with bated breath and an awkward half-smile; his first time, maybe? No... not with that smile... but he’s definitely a neophyte: his hips tremble and his eyes are watching you carefully, wide and nervous.");

	output("\n\n<i>“Please careful,”</i> he whines. <i>“Not as large as female.”</i>");

	output("\n\nYou ");
	if(pc.isTaur()) output("step over and straddle him");
	else output("grip his hips with your hands");
	output(", steadying the unready pup; his fur prickles with goosebumps against your [pc.skinFurScales]. With great care and great relish, you rub ");
	//(dildo)
	if(target == -2) output("your dildo against the tip of the korgonne’s big, black cock, dangling half-erect between his legs. The dog-man shudders as your hardlight hard-on draws a long string of precum from him, but not as badly as he shudders when you lean over his back and drag the pre through his butt, smearing it over his little blue pucker. Over and over you pull from his cock, frotting until there’s more pre than you can catch and his throbbing, drooling shaft has melted a petite hole of desire in the snow beneath him.");
	else
	{
		output("your ");
		if(target == -1) output("tail-cock");
		else output("[pc.cocks]");
		output(" against his tight pucker");
		if(target >= 0 && pc.cockTotal() > 1) output(" in turn");
		output(", depositing a dab of hot, [pc.cumFlavor] precum");
		if(target >= 0 && pc.cockTotal() > 1) output(" with each");
		output(" that you work into his boyhole. The korgonne’s eyes shut tight while you smear him liberally, teasing and forecasting your penetration with mock-thrusts that oil his ring inside and out. Between his legs, his black cock throbs with desire, naively drooling its own useless pre.");
	}
	output("\n\nYou hold back as long as you can, until the heat from the pre and the korgonne’s body and your body all begin to blur together, until the dog-man whines louder than the bitter wind and his hips vibrate ");
	if(pc.isTaur()) output("against your [pc.belly]");
	else output("in your hands");
	output(", so frantic that it’s becoming difficult to stay lined-up with him. When you can wait no more, you lean into the raider; he stiffens and grimaces, knowing what comes next - his back straightens, trying to make your path as direct as possible, and a soft, anxious whine still escapes, even through gritted teeth. You slip the ");
	if(target == -2) output("crown of the hardlight toy");
	else if(target == -1) output("glans of the alien parasite");
	else output("[pc.cockHead " + target + "] of your [pc.cockNounSimple " + target + "]");
	output(" into the korgonne’s ass and rest atop of him, feeling his back move with short, tense breaths.");
	pc.cockChange();

	output("\n\nThe dog-man shivers under you as you test him with your first strokes... you fancy that it’s pleasure which makes him quake so, and not the bitter cold. His body is certainly hot enough under your ");
	if(!pc.isTaur()) output("hands");
	else output("[pc.belly]");
	output(", like a little furnace, stoked higher every time your ");
	if(target == -2) output("hard holo-rod");
	else if(target == -1) output("parasite-oozing tail");
	else output("[pc.cock " + target + "]");
	output(" shovels another load of smoldering pleasure along his tingling, nerve-laden passage.");

	output("\n\nThe pleasure is overbearing, and so it is with your posture as well... without noticing, you’re beginning to ride the horny korgonne harder and harder, pushing his ass up into the air and his chest down into the ground. Like a broody animal, he receives your strokes, back arched and chest tamping down the snow; his curled, fluffy tail tickles your [pc.belly], becoming more matted and squalid with sweat ");
	//(no dildos)
	if(target != -2) output("and pre ");
	output("at each stroke.");

	output("\n\nThe mess only worsens when the korgonne gets into it. As your strokes build in pitch, working the dog-man’s loosening butthole with your slick dick, he actually begins to wag his tail in joy, smearing the sweaty mess across your stomach and thumping you with his excited brush. The other thing dangling between his legs is no less excited or mobile: his black dog-dick sways back and forth as you punish his hips. The knot at the base is so swollen that it’s almost perfectly round, and whenever you hilt in the korgonne’s ass, the whole cock jerks up and twitches, dropping strings of pre in the snow. The raider");
	if(pc.isTaur()) output("’s hand is magnetized to it, trying his best to get off alongside you, and by the way he pants with his tongue hanging out of his mouth, it’s not going to be much longer. ");
	else output(" whimpers and pouts until you move a hand to it and jerk him off; when you do, he begins to pant happily, and you can feel his stiff cock straining with near-orgasm, ready to blow. ");
	output("Your own nerves are on edge too - after a few more minutes of stroking, you’re overwhelmed with the urge to cum.");

	//if dildoing
	if(target == -2)
	{
		if(pc.hasGenitals())
		{
			output("\n\nYour ");
			if(pc.hasCock()) output("[pc.cocks]");
			if(pc.isHerm()) output(" and ");
			if(pc.hasVagina()) output("[pc.vaginas]");
			if(pc.totalGenitals() > 1) output(" tremble and release");
			else output(" trembles and releases");
			output(", filling your [pc.lowerUndergarment] with ");
			if(pc.hasCock()) output("[pc.cum]");
			if(pc.isHerm()) output(" and ");
			if(pc.hasVagina()) output("[pc.girlCum]");
			output(".");
		}
		else
		{
			output("\n\nYour whole body quivers in climax as if the hardlight cock were your own; your strokes become jerky and abbreviated as your muscles weaken and your mind fogs.");
		}
		output(" The korgonne, oblivious and still in pursuit of his own ejaculation, continues to thrust against the hardlight, forcing sensation through the feedback to your overloaded nerves. A low groan escapes as the giddy dog-boy pumps and pumps you, doubling and trebling the intensity of your orgasm; he continues until his cock gratefully releases, drooling pearly cum from its black tip. Consumed by his own cumming, his hand ");
		if(!pc.isTaur()) output("covers yours and ");
		output("grips his knot, squeezing the bloated ball to force the drool up to a spurt.");
	}
	//else if cock/tailcock
	else
	{
		output("\n\nYour ");
		if(target == -1) output("lurching, parasite-spilling tail");
		else output("[pc.cockNoun " + target + "]");
		output(" blows like a bomb, spurting ");
		if(pc.cumType == GLOBAL.FLUID_TYPE_CUM) output("alien seed");
		else output("[pc.cum]");
		output(" into the poor canine’s asshole - his back tenses when he feels the first hot stroke, and you ");
		if(pc.isTaur()) output("bear down on him, almost flattening him into the snow to make sure he can’t interrupt your ecstatic ejaculation.");
		else 
		{
			output("reach for his shoulder, pulling him upright until his weight causes him to sink all the way down to your ");
			if(pc.balls == 0) output("base");
			else output("[pc.sack]");
			output(" and form a seal to prevent your [pc.cumNoun] from escaping.");
		}
		if(target >= 0 && pc.cumQ() >= 2000)
		{
			output(" You need it, too... your massive load is bloating the poor doggy’s gut so much that his coat begins to ride up on his rounding belly.");
		}
		output(" He whimpers at being treated like your cum-dump, but his black doggy dick still spurts shamefully from the pleasure of the hot seed painting his insides");
		if(!pc.isTaur()) output("; you guide it with your hand, ");
		if(!pc.isNice()) output("squeezing the knot to force your little bitch-boy to cum <i>hard</i> and ");
		output("cutting deep lines in the snow with strokes of dog jizz.");
	}
	//merge to end
	output("\n\nThe korgonne pants contentedly atop your pole, recovering from his taxing orgasm. ");
	if(!pc.isAss()) output("You wait with him for a bit, then gently urge him off when the cold becomes too irritating.");
	else output("You push him off roughly, sending him toppling into a faceful of snow and his own cum.");
	//(not dildo)
	if(target != -2) output(" Seed trickles from his asshole, running down his wet, matted fur and drawing a crooked line of sharp contrast against his black dick.");
	output(" He grudgingly pulls on his pants, ");
	if(!pc.isCrotchExposed()) output("and you do the same. Then you part");
	else output("then parts");
	output(" ways.");

	//end, pc orgasm, pass time
	processTime(30);
	pc.orgasm();
	output("\n\n");
	if(target != -2) enemy.loadInAss(pc);
	CombatManager.genericVictory();
}

//Pussy-worship (target words: 1500) (current words: 1617)
//for organic, cage-free pussies only (no tail- or nipple-cunts)
//PC sticks a snootful of muff in his face (like fem korg do) to arouse him, gets licked
//scene is agnostic of cunt size and does no stretching
//tooltip: Entice the korg-boy to serve with a snoot full of pussy.
//disabled tooltip, no crotch pussy: You need to have a pussy to make the korgonne worship it{(tailcunt) - your parasitic tail-cunt isn’t interested in reverence, only sperm}.
public function korgPussWorship():void
{
	clearOutput();
	showKorgiMaleHostile(true);
	author("Zeikfried");
	output("The barbarian boy’s alien eyes magnetize to your crotch as you ");
	if(pc.isCrotchExposed()) 
	{
		output("move closer, widening your stride to show off your ");
		var multi:Boolean = false;
		for(var x:int = 0; x < pc.totalVaginas(); x++)
		{
			if(x > 0)
			{
				if(pc.vaginas[x].vaginaColor != pc.vaginas[x-1].vaginaColor) multi = true;
			}
		}
		if(multi) output("multicolor");
		else output("[pc.vaginaColor]");
		output(" lips.");
	}
	else output("peel off your [pc.lowerGarments] and expose your [pc.vaginas].");
	output(" He swallows hard, and his long tongue peeks from his mouth to wet his lips.");

	if(pc.isNice() || pc.isMischievous()) output("\n\nYou place your hands on his shoulders and gently ");
	else output("\n\nGrinning sadistically, you ");
	output("push him to his knees. <i>“");
	//(if PC milodan, kaithrit, or other catrace)
	if(InCollection(pc.raceShort(), ["kaithrit", "milodan", "feline"])) output("Kitty want play?");
	else if (InCollection(pc.raceShort(), ["ausar", "huskar", "korgonne", "canine", "vulpine", "lupine"])) output("Stranger move like den-mate...");
	else output("Alien talk like korgonne female... no talk,");
	output("”</i> he rasps. His parched voice cracks - the sight of your pussy is making his breaths shallower and faster, sucking in more dry Uveton air, and he licks his lips again. You draw nearer, imagining an even better way to keep his mouth out of the cold.");

	//if PC is taur/other rear-pussy
	if(pc.isTaur() || pc.isDrider()) 
	{
		output("\n\nNow that the korgonne is on his knees where you want him, you turn about to give him the proper view of your [pc.vaginas]. With utmost deliberacy, you back into your captive raider, inching in until you feel the press of his soft paws on your [pc.ass]");
		if(pc.buttRating() >= 16) output(", trying to restrain the monstrous flesh of your derrière before it crushes him");
		output(". With a sick thrill, you push through his resistance and feel his nose slide between the lips of your [pc.vaginaNoun].");

		output("\n\nAs your pliable cunt stuns the barbarian boy and saps his will, you step back, pinning his legs with yours and preventing him from pulling away. The korgonne doesn’t seem to mind... or perhaps it’s more correct to say he doesn’t even notice, so spellbound by the scent and sight of your ");
		if(pc.wettestVaginalWetness() >= 4) output("drooling, ");
		output("[pc.girlCumGem]-walled pussy is he. His jaw moves, heralding a wonderful event - tremulous at first, the korgonne’s timid tongue begins to lap at the edge of your opening, sampling your heady flavor.");
		if(pc.tailCount > 0) output(" Spasming from the contact, [pc.eachTail] jerks from side to side, pushing his hood down and parting his hair.");
	}
	//else if pussy in normal front spot
	else
	{
		output("\n\nThe sight of the korgonne on his knees and obsessing over your pussy stirs your imagination to queenly heights. You push his hood aside and grip his " + enemy.hairColor + " hair in two fists, then pull his snub-nose forward, right into your crotch");
		if(pc.balls > 1) output(", until your [pc.balls] are sitting astride it");
		output(". It parts your labia to rest against your");
		if(pc.vaginas[0].hasFlag(GLOBAL.FLAG_NUBBY)) output("nubby");
		else output("silky");
		output(" skin inside, and you can <i>feel</i> his nostrils widen as he inhales the aroma of your [pc.vaginaNoun].");

		output("\n\nHot air rushes against your slit as your convert gulps down your scent, and his jaw parts to swallow even more. The long tongue oozes over teeth and gums; it slithers upon your sex while the korgonne falls deeper into his greedy trance. Finally, it slips over the threshold and is inside.");
	}
	//merge locations, then re-fork for pussy flavor/type; listed order is recommended priority

	//if blueberry yogurt girlcum
	if(pc.girlCumType == GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT)
	{
		output("\n\n<i>“Sweet like fruit and milk,”</i> the korgonne comments, surprised by your blueberry-rific baby-baker. <i>“Keep rations in female place?”</i> You only laugh, remembering the chain of events that led to your strange ‘charm’.");
	}
	//if girlcum type is any kind of male cum or cumsap, such as nyrean ‘girlcum’
	else if(pc.girlCumType == GLOBAL.FLUID_TYPE_CUM || pc.girlCumType == GLOBAL.FLUID_TYPE_CUMSAP || pc.girlCumType == GLOBAL.FLUID_TYPE_SYDIAN_CUM || pc.girlCumType == GLOBAL.FLUID_TYPE_GABILANI_CUM || pc.girlCumType == GLOBAL.FLUID_TYPE_NYREA_CUM || pc.girlCumType == GLOBAL.FLUID_TYPE_NYREA_GIRLCUM)
	{
		output("\n\nYou can feel the korgonne grimace. <i>“You no female...”</i> he whines, as he samples your sperm-producing cunt. You push him deeper inside, ");
		if(pc.isNice()) output("regretful but too invested to stop.");
		else output("sniggering perversely.");
	}
	//if girlcum is either type of vanae milk
	else if(pc.girlCumType == GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK || pc.girlCumType == GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK)
	{
		output("\n\nThe korgonne’s pupils widen as your mutated, hallucinogen-dispensing pussy oozes a drop of vanae milk onto his tongue. <i>“Colors! Ducal colors!”</i> he barks, lapping enthusiastically as psychedelic patterns overtake his sight. This is followed by a sad realization: <i>“Korgonne colorblind...”</i>");
	}
	//if has any other kind of milk or milksap for girlcum
	else if(pc.girlCumType == GLOBAL.FLUID_TYPE_MILK || pc.girlCumType == GLOBAL.FLUID_TYPE_MILKSAP || pc.girlCumType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK || pc.girlCumType == GLOBAL.FLUID_TYPE_STRAWBERRY_MILK || pc.girlCumType == GLOBAL.FLUID_TYPE_LEITHAN_MILK || pc.girlCumType == GLOBAL.FLUID_TYPE_MILK)
	{
		output("\n\n<i>“Taste like mother-water...”</i> he murmurs, nostalgic from your flavor. He nurses on your clit like a nipple; it sends a spark through your spine, right into your brain’s most primal pleasure centers.");
	}
	//if honey/nectar girlcum
	else if(pc.girlCumType == GLOBAL.FLUID_TYPE_HONEY || pc.girlCumType == GLOBAL.FLUID_TYPE_NECTAR)
	{
		output("\n\n<i>“Sweet,”</i> he notes. <i>“Many sweet... be sick unless eat meat soon.”</i> As if to tease, he nips gently at your labia with his teeth. You ");
		if(pc.isTaur() || pc.isNaga()) output("squeeze his chest between your [pc.thighs], ");
		else output("pull his ear, ");
		output("playing right back.");
	}
	//if oil girlcum /or/ synthetic pussy
	else if(pc.girlCumType == GLOBAL.FLUID_TYPE_OIL || pc.vaginas[0].type == GLOBAL.TYPE_SYNTHETIC)
	{
		output("\n\nThe korgonne spits and gags at the first taste of your oily, synthetic fluids. <i>“Urrgh! Taste like power-cell!”</i> You ");
		if(pc.isAss()) output("relish his discomfort as you");
		else output("guiltily");
		output(" force his mouth back to your artificial cunt.");
	}
	//if pussy is goo
	else if(pc.vaginas[0].hasFlag(GLOBAL.FLAG_GOOEY)) output("\n\nThe korgonne licks his own lips as often as your gooey pussy. <i>“Taste sour fruit,”</i> he assesses. <i>“And water melons.”</i>");

	//if korgonne puss is a separate type from canine and PC has korg puss, /or/ if the korg TF just has canine pussy
	else if(pc.vaginas[0].type == GLOBAL.TYPE_CANINE)
	{
		output("\n\nWhen the familiar pheromone of canine pussy hits him, his nose probes deeper, intoxicated. <i>“Smell like home...”</i> he murmurs. <i>“Many memory of love...”</i>");
	}
	//if korg/canine pussies are separate types and PC has canine
	//output("\n\nThe korgonne recoils at your canine, but not quite korgonne, flavors... but then goes back in for closer scrutiny. <i>“Taste familiar like home, but family gone away....”</i>");

	//if equine puss
	else if(pc.vaginas[0].type == GLOBAL.TYPE_EQUINE) output("\n\nThe korgonne can’t get enough of your humid, equine snatch. He grabs your ass and buries his snout, sniffing deep draughts of mare’s musk. <i>“Smell of beast,”</i> he huffs windlessly. <i>“Strong and hot.”</i>");

	//else flavor/type not listed
	else output("\n\nWith the shock wearing off, you notice that the korgonne’s cunnilingus is relatively tame - his worship could definitely be more full-throated. You jostle him and he doubles down, opening wide and digging deep with his long, blue tongue.");

	//merge flavor forks here
	output("\n\nUrged onward, the korgonne’s tongue unwinds, stretching and sticking like taffy to your sweltering, needy sex. It can’t be his first time - he’s too good at it. The tip of his muscle spirals and futters furrows through you, coiling tightly one second and then unwinding at your entrance to touch every nerve. His canine lips kiss your labia, locking and stroking, sliding up ");
	if(pc.vaginas[0].clits > 1) output("and down ");
	output("to brush your [pc.clits], and the hot breath continues to come, swamping you in waves as inexorable and moving as tides.");

	output("\n\nWithout intending it, you close your eyes and lose yourself in the korgonne’s lush tropical mouth - you’re completely on vacation from the bitter cold of Uveto, living only for the next stroke of warm skin to cross yours. Your moans quaver and peak in " + pc.mf("low","high") + " breaks, rolling from you in time with your dog-boy’s oral grandstanding. He smiles, curling a lip in self-satisfaction, knowing that his worship is pleasing you. Below him, only occasionally brushing against your [pc.leg] whenever your korgonne leans in, a hard bulge of flesh stretches his leg-wraps: proof of your reciprocal effect on his sex. As his cock hardens from the heat and taste and touch of your [pc.vagina], his efforts climb in speed and power, pushing your orgasm closer and closer to the surface.");

	if(pc.hasCock() && !pc.isTaur()) 
	{
		output("\n\nWhen his lips curl once again to wrap your [pc.clits] in lush gowning, your arousal becomes too much to contain. Your grip on his mane loosens, and you find your hands migrating irresistibly to your [pc.cockBiggest]");
		if(pc.hasSheath(pc.biggestCockIndex()) || pc.hasStatusEffect("Genital Slit")) 
		{
			output(", which is about halfway through emerging from your ");
			if(!pc.hasStatusEffect("Genital Slit")) output("sheath");
			else output("slit");
		}
		output(". Starting at the bottom, you coax stiffness into it, sliding your hand from [pc.sheath " + pc.biggestCockIndex() + "] to tip and feeling blood pulse through the capillaries.");
		if(pc.balls > 0 && pc.ballDiameter() < 3) output(" Your [pc.sack] dances atop the korgonne’s brow as you tug your cock, patting out the steps to a jig of masturbatory joy.");
		else if(pc.balls > 0) output(" The groaning weight of your [pc.balls] begins to move with each stroke, wobbling to the soft blows of your open, pre-slicked fist on your shaft.");
		output(" While the korgonne’s tongue simulates an obedient, servile shaft for the pleasure of your pussy, your hand plays cunt to your throbbing, neglected cock and the two building orgasms fill you with vainglory.");
	}
	output("\n\nYour climax tensions your body like a champagne cork, tightening and tightening as the korgonne’s curling tongue screws into you. You resist, trying to hold onto your peak, but soon... pop! Your orgasm escapes in a rush, carrying out a long moan as it arches your back and ripples your pussy around the korgonne’s snubby nose.");
	if(pc.hasCock())
	{
		if(pc.cumQ() < 50) output(" Dribbles");
		else if(pc.cumQ() < 500) output(" Strokes");
		else output(" Streamers");
		output(" of [pc.cum] erupt from [pc.eachCock], painting the korgonne’s " + enemy.furColor + " face [pc.cumColor] and filling his leather hood with a lewd surprise for later, and a");
	}
	else if(pc.hasVagina() && pc.isSquirter())
	{
		output(" A");
		if(!pc.isSquirter()) output(" trickle");
		else if(pc.girlCumQ() < 100) output("squirt");
		else if(pc.girlCumQ() < 300) output("gush");
		else output("blast");
		output(" of [pc.girlCum] rides the korgonne’s tongue like a waterslide, pooling in the back of his throat just as fast as he can swallow. Your [pc.thighs] squeeze the poor dog’s head, pressing his curious ears flat");
		if(pc.tone >= 75)
		{
			output(", and if he worries about the ");
			if(pc.thickness < 50) output("impressive");
			else output("astonishing");
			output(" muscles wrapped around him tightly enough to juice a coconut, he doesn’t show it");
		}
		output(".");
	}
	output(" You ride his face, grinding on his little button nose, until you come down several minutes later and finally dismount - his long tongue winds out of you like a [pc.girlCumNoun]-covered firehose being stowed.");

	output("\n\nThe korgonne reads your body language as you step away from him, trying to figure out if he’s going to get off too... and apparently, he doesn’t like what he concludes. He whimpers, rubbing his bulging pants - a big, cock-shaped bulge with a huge swollen knot. The realization that this exchange is only one-way must be dawning on him. You ");
	if(pc.isNice()) output("frown, mumble an apology");
	else output("smile, run your finger along it");
	if(!pc.isCrotchExposed()) output(", and re-dress, then ");
	else output(", then ");
	output("leave him there. Maybe next time, pup.");
	//end, do pc.orgasm, pass time
	processTime(30);
	pc.orgasm();
	output("\n\n");
	enemy.girlCumInMouth(pc);
	CombatManager.genericVictory();
}

//Mutual Masturbation (target 1500) (current words ~2180; needs editing)
//today we’re going to learn about doggy dicks
//unsexed PCs, tail/nipple genitals, and hardlights not eligible
//tauric PCs with rear genitals not eligible unless using a cock
//the korgonne always indexes the PC’s canine/korgonne dick to jerk off, if one is present
//tooltip: Have the korgonne {jerk your dick/rub your pussy} to orgasm while you stroke him off.
//disabled tooltip, pc is unsexed: Before the korgonne can masturbate your genitals to orgasm, you need to get some genitals!
//disabled tooltip, tauric and no cock: The korgonne can’t reach your pussy all the way at the end of your body!

public function mutualMasturbkorg():void
{
	clearOutput();
	showKorgiMaleHostile(true);
	author("Zeikfried");
	output("You look down at the ");
	if(enemy.lust() >= enemy.lustMax()) output("horny");
	else output("beaten");
	output(" korgonne and give him your most disarming");
	if(pc.isAss()) output(", insincere");
	output(" smile. He relaxes a little, and you lean down to find the straps holding his hide pants up. ");
	if(pc.isNice()) output("You slip them loose and pull down the dog-man’s pants; out of the corner of your eye, you can see him grinning and closing his eyes in anticipation.");
	else output("You pick up his knife; his face shows alarm when you flash the blade, but when you cut the leather straps, freeing his pants to slip down around his knees, it changes to resignation... with a hint of a smile. You don’t speak again until a hint of desperation enters his face.");

	var cockSelect:Boolean = false;
	if(pc.isHerm()) cockSelect = (rand(2) == 0);
	else if(pc.hasCock()) cockSelect = true;
	if(pc.hasCock() && pc.blockedVaginas() > 0) cockSelect = true;

	var x:int = -1;

	if(cockSelect)
	{
		for(var i:int = 0; i < pc.cockTotal(); i++)
		{
			if(pc.cocks[i].cType == GLOBAL.TYPE_CANINE) x = i;
		}
		if(x == -1) x = rand(pc.cockTotal());
	}
	else
	{
		for(var ii:int = 0; ii < pc.totalVaginas(); ii++)
		{
			if(pc.vaginas[ii].type == GLOBAL.TYPE_CANINE) x = ii;
		}
		if(x == -1) x = rand(pc.totalVaginas());
	}
	
	output("\n\n");
	if(pc.isBimbo()) output("<i>“Hey, puppy, want to play? I know a game called ‘Red Rocket’...”</i> you tease, staring unabashedly at his crotch and working your fingers.");
	else if(pc.isBro()) output("<i>“Yo, you wanna trade a bro-job?”</i> you ask bluntly, pointing from your crotch to his and back.");
	else if(pc.isNice()) output("<i>“Hey, cutie”</i> you begin bashfully, <i>“... if I return the favor, do you think you could, ah, masturbate me?”</i>");
	else if(pc.isMischievous()) 
	{
		output("<i>“Yooo, dog,”</i> you call to the alien, who looks at you quizzically, <i>“how about we sit down and have a heart-to-heart and hand-to-");
		if(cockSelect) output("cock");
		else output("pussy");
		output("?”</i>");
	}
	output("With a predatory smile, you point at your crotch, then the dog-man’s hand. <i>“How about you come over here and help me rub one out?”</i> you ask. Almost as an afterthought, you add, <i>“And I’ll return the favor for you.”</i>");

	output("\n\nThe dog-man shifts nervously from foot to foot, with his large splayed toes keeping him atop the snows like a camel. It’s sort of... cute. His gaze follows your ");
	if(pc.isCrotchExposed()) 
	{
		output("crotch as you sashay over to him, ");
		if(cockSelect) output("watching your [pc.cocks] bob");
		else output("watching your [pc.thighs]");
	}
	else output("[pc.hips] as you saunter over, observing the line of your body through your obfuscating [pc.crotchCover]");
	output(" and chewing on his bottom lip.");

	//only if clothed
	if(!pc.isCrotchExposed())
	{
		output("\n\nYou ");
		if(!pc.isCrotchExposedByArmor()) output("reach for the fasteners to your [pc.armor], then slip out with a shimmy");
		if(!pc.isCrotchExposedByArmor() && !pc.isCrotchExposedByLowerUndergarment()) output(" and ");
		if(!pc.isCrotchExposedByLowerUndergarment()) output("slip a finger into the waist of your [pc.lowerUndergarment]");
		output(". Watching to make sure the korgonne’s eyes are riveted to you, you expose your ");
		if(cockSelect) output("[pc.cock " + x + "], thrusting it at him. The korgonne laughs nervously.");
		else output("[pc.vagina " + x + "], keeping your [pc.legs] closed as tightly as possible to draw out the suspense. The korgonne leans in, ensorcelled.");
	}

	//rejoin
	output("\n\nHe grins sheepishly, looking for all the world like an embarrassed puppy with his dog-dork hanging out. He fumbles for the toggles of his coat and unfastens them, then slips out of it and places it on the ground.");
	output("\n\n<i>“");

	if(InCollection(pc.raceShort(), ["kaithrit", "milodan", "feline"])) output("Cat");
	else if (InCollection(pc.raceShort(), ["ausar", "huskar", "korgonne", "canine", "vulpine", "lupine"])) output("Outsider");
	else output("Alien");
	output(" sit,”</i> he offers, then plops down beside the coat, in the snow.");

	if(pc.isTaur()) output("\n\nYou do so, but lie down on your side. Pulling the korgonne closer, you tuck him up against your forelegs, then take his hand in yours and guide it to your [pc.cock " + x + "]. Then you reach for his.");
	else 
	{
		output("\n\nYou do so, snuggling up to the korgonne’s warm, dense fur. Taking his hand in yours, you guide it to your ");
		if(cockSelect) output("[pc.cock " + x + "]");
		else output("[pc.vagina " + x + "]");
		output(", then reach for his black, tapered dick.");
	}
	output("\n\nThe dog-man shivers under your fingers, and you feel his cock slide another inch out of his sheath. His blood vessels are in sharp relief now, and a drop of precum beads at the tip, just barely visible in profile. He leans into you and sighs, tickling your [pc.chest] with the plush, " + enemy.furColor + " fur of his shoulder. Across your own ");
	if(cockSelect) output("cock");
	else output("pussy");
	output(", soft finger-pads play sluggishly, distracted by the pleasure; you bump the korgonne’s hand with your own to spur him into focus. He ");
	if(cockSelect) output("wraps his fingers around you");
	else output("parts your labia");
	output(", looks across at you, and grins.");

	output("\n\nYou take his grin for a starter, and start to pump his pistol, which has grown stiff and hot in your hand. The tapered tip dribbles a stream of fluid that makes the black of his shaft even deeper and glistens with proof of his pleasure. ");
	if(cockSelect) 
	{
		output("His leathery, soft-padded fingers wrap around your ");
		//(dog-dick)
		if(pc.cocks[x].cType == GLOBAL.TYPE_CANINE) 
		{
			output("bulbous canine shaft and find their homes quickly - he’s quite at ease with your familiar dog-dick");
			if(Math.round(pc.cocks[x].cLength()) != Math.round(enemy.cocks[0].cLength())) 
			{
				var length:Number = Math.round(pc.cocks[x].cLength());
				output(", though it’s ");
				if(length + 5 < Math.round(enemy.cocks[0].cLength())) output("much smaller");
				else if(length < Math.round(enemy.cocks[0].cLength())) output("smaller");
				else if(length > Math.round(enemy.cocks[0].cLength()) + 5) output("much larger");
				else output("larger");
				output(" than his");
			}
			output(".");
		}
		//(cat dick is indexed)
		else if(pc.cocks[x].cType == GLOBAL.TYPE_FELINE) output("bristly feline prick, finding his comfortable grip more quickly that you expect. Could it be that this dog-man has prior experience?");
		//(other dick)
		else 
		{
			output("[pc.cock " + x + "] and begin to explore the unfamiliar shape. They glide over the [pc.sheath " + x + "], ");
			if(pc.balls > 0) output("down to cup your [pc.sack], and ");
			output("then up the shaft to test your [pc.cockHead " + x + "]. Then they settle into a comfortable position, just below the crown.");
		}
		output(" Smiling nervously once more, the korgonne begins to stroke.");
	}
	//(vag)
	else output("His soft fingerpads trace the inner contours of your labia, an affectionate chamois buffing your nerves until they shine. Just when your excitement reaches the point that you consider asking him to go deeper, they find the entrance to your [pc.vagina " + x + "] and begin to circle the ring. Watching your expression, your lover begins to rub.");

	//fork - check skin type for goo, else check arm flags
	if(pc.skinType == GLOBAL.SKIN_TYPE_GOO)
	{
		output("\n\n<i>“Hand squishy cool,”</i> he korgonne mumbles, squirming in your gooey grip. <i>“Feel like eel.”</i>");
	}
	//if chitin arms
	else if(pc.hasArmFlag(GLOBAL.FLAG_CHITINOUS))
	{
		output("\n\n<i>“Hard hand,”</i> the korgonne says, as you brush his twitching cock with your chitinous skin. <i>“Cold. Feel like ice-job.”</i>");
	}
	//if furry arms
	else if(pc.hasArmFlag(GLOBAL.FLAG_FURRED))
	{
		output("\n\n<i>“Hand tickles,”</i> he grunts, as your fur brushes his knot. <i>“Feel like den-mate.”</i>");
	}
	//if scaly arms
	else if(pc.hasArmFlag(GLOBAL.FLAG_SCALED))
	{
		output("\n\n<i>“Hand smooth and warm,”</i> the korgonne murmurs. <i>“Like tooth.”</i>");
	}
	//else
	else output("\n\n<i>“Soft hand like lover,”</i> the korgonne grunts. <i>“Like deep inside mate.”</i>");

	//merge
	output("\n\nThe korgonne’s dick begins to slide in your palm - his hips are twitching and the pre slicking his hot shaft frees it to move in your wet grip. You bump against the modest knot at the base, and the korgonne shivers... but then pulls away. With his free hand, he tries to move your hand closer to the dribbling tip.");

	output("\n\n<i>“Not yet,”</i> he mumbles. <i>“Knot not ready.”</i> You oblige him, focusing on his tapered, throbbing crown with short, vigorous strokes. The precum streams from him, running down the back of your hand and falling to make perfect holes in the snow. The korgonne’s posture relaxes, and he begins to pump again, closing his eyes and fantasizing about something lewd. The slippery veins of his swollen, flame-shaped cock tickle your palm as the eager alien grinds into it, and his own attention falters as his excitement builds. Your ");
	if(cockSelect) output("cock");
	else output("pussy");
	output(" burns with neglect under his fingertips, and you recall him to duty with a ");
	if(pc.isNice()) output("polite cough");
	else output("gruff demand");
	output(".");

	if(cockSelect)
	{
		output("\n\nHe resumes stroking, and your [pc.cockNounSimple " + x + "] appreciatively dribbles its own pre, matting the alien’s furry hand. It lingers atop of your cock, caressing your [pc.cockHead " + x + "] and sensitive underside with smooth, leathery fingers, working up a load to paint his palm [pc.cumColor]. You hold it for as long as you can, and then let yourself blow. ");
		if(pc.cumQ() < 5) output("A small sprinkle of [pc.cumNoun] oozes from your upright cock, barely making it down to the korgonne’s hand before spending itself.");
		else if(pc.cumQ() < 50)
		{
			if(pc.cumQ() < 25) output("A few");
			else output("Several");
			output(" strokes of [pc.cum] spurt from you, painting lines in the snow and dribbling onto the dog-man’s hand when you try to push the last few out. He helps with a thoughtful stroke.");
		}
		else output("A spray of [pc.cum] rushes up your distended urethra, surprising the dog-man so much he lets go of your suddenly-bulging cock. Your unrestrained [pc.cockNounSimple " + x + "] unloads like a hose on the poor korgonne, the snow, and yourself, shaking and throbbing out an orgasm that would inspire a galotian to worship.");
	}
	//(vag)
	else
	{
		output("\n\nHis fingers go back to work, finding their old places along the nerves of your pussy entrance. As he circles it once more and begins to slip in and out, his furry knuckles run across your [pc.clits], sending a shock that jellies your back and forces you to slump into his hand, hoping for another touch. Even through the haze of his own approaching climax, the korgonne notices - he brushes the nub");
		if(pc.totalClits() > 1) output("s");
		output(" again, smiling smugly at finally finding a weakpoint in the ");
		if(!pc.hasCock()) output(pc.isWoman() ? "woman" : "cunt-boy");
		else output("herm");
		output(" who defeated him. He continues to tease and finger-fuck your hole with his soft pads until you can’t take any more... what he lacks in familiarity with your anatomy, he makes up for in cleverness and quick observation. You groan and cum, ");
		if(!pc.isSquirter()) 
		{
			output("clamping down on his fingers with your pussy until your back tremors and your [pc.thighs] press his arm fur into a sweaty, " + enemy.furColor + " ridge.");
		}
		else output("squirting [pc.girlCum] all over his arm until he’s a wet, [pc.girlCumVisc] mess.");
	}
	output("\n\nYour jerky orgasm translates to your hand, as well... the korgonne’s dick grows hot and twitchy under your short, forceful strokes. The dog-man’s eyes roll in his head, and he makes a strange, yipping whine. You can only assume he’s close to orgasming - his hips rock sharply to smear his needy cockhead on your palm, and his back tenses up. The knot at the base of his cock begins to swell rapidly, rounding out with seed like a lewd fruit. The slight trickle of clear pre from his cockhead turns to a white drip, and he howls softly. He’s cumming too.");

	output("\n\n<i>“");
	if(InCollection(pc.raceShort(), ["kaithrit", "milodan", "feline"])) output("Cat");
	else if (InCollection(pc.raceShort(), ["ausar", "huskar", "korgonne", "canine", "vulpine", "lupine"])) output("Outsider");
	else output("Alien");
	output(" squeeze knot!”</i> the raider moans, <i>“Joy deep in knot! Squeeze release joy!”</i> He grabs your hand and his fingers cover yours, trying to guide you down to the round, fleshy bulb at the base of his cock.");

	//if nice or high libido
	if(pc.isNice() || pc.isMischievous() || pc.libido() >= 66)
	{
		if(pc.isNice()) output("\n\nThe urgent pleading in his voice gets to you, and you");
		else output("\n\nYou shiver at the idea of seeing him unleash his full load, and ");
		output("allow him to wrap your hand around his girthy bitch-breaker. The korgonne’s eyes tremble, staring into your face, begging wordlessly for you to grant his request...");

		output("\n\nYou close your fingers and his expression immediately changes to gratitude, then relief. Far from being the stiff and unyielding plug from before, his knot is spongy, deforming and shifting slightly in your grip, like gates had opened inside it and freed fluid to move around. One squeeze, and the meek dribble of jizz from his cock turns into a stroke that cuts a foot-long line into the snow.");

		output("\n\nThe korgonne’s fingers close around yours again, goading you... harder, faster, squeeze again, wring me dry. You clamp down harder, and another foot of semen lances from him, then sixteen inches, then twenty. As his black rocket’s payload reaches two feet, your hand actually begins to cramp from how hard you’re squeezing, and yet the dog-man’s guiding hand gives no indication of pain, only joy - you’re left wondering just what kind of diamond-presses the female korgonne must be carrying between their legs.");

		output("\n\nWhen you’ve emptied his knot back down to its starting size, the raider finally shivers and releases your arm. He looks into your eyes again, glowing with satisfaction. <i>“");
		if(InCollection(pc.raceShort(), ["kaithrit", "milodan", "feline"])) output("Cat");
		else if (InCollection(pc.raceShort(), ["ausar", "huskar", "korgonne", "canine", "vulpine", "lupine"])) output("Outsider");
		else output("Alien");
		output(" give joy,”</i> he sighs. But his expression darkens. <i>“");
		if(InCollection(pc.raceShort(), ["kaithrit", "milodan", "feline"])) output("Cat");
		else if (InCollection(pc.raceShort(), ["ausar", "huskar", "korgonne", "canine", "vulpine", "lupine"])) output("Outsider");
		else output("Alien");
		output(" leave at peace. No hunt joy-giver on korgonne ice... others not know.”</i>");

		output("\n\nThat’s an abrupt turn. He touches your [pc.ass], gently but firmly urging you off of his coat, then redresses quickly. Once his coat and pants are donned, he gives you one last look. For just a second, he smiles... then he assumes the stern, frigid look of an enemy, turns, and lopes off.");
	}
	//else not nice/libidinous
	else
	{
		output("\n\nThe urgent pleading in his voice gets to you... you brush off his hand and move in the other direction, <i>away</i> from his bulging, veiny knot. His hands go for it in your place, trying to grab on, but you deftly fend them off and entangle them, preventing him from touching the knot as well. The captive dog-man’s eyes widen for just a moment at your unexpected cruelty, but when you just barely tickle the cum-dribbling tip of his tapered prick, they roll back in his head harder than they ever did when you were jerking him off - apparently, an interrupted orgasm causes the korgonne male to become super-sensitive. The weak trickle of doggy jizz intensifies, bearding the black pillar in a dribble of white, but your plaything gets no relief from it. He continues to moan and battle your free hand, trying to touch his throbbing knot, but only one of you is distracted by orgasmic pleasure. He’s no match for you, and you continue to tease him, running the back of your finger up the underside of his cock, feeling his ejaculation creep through his urethra at the slightest pressure.");
		output("\n\nEventually, you tire of playing with him and grab both hands, holding them away. The dog-man whimpers and moans as you restrain him, forcing him to endure an emptiness of stimulation while you wait for his orgasm-clock to run backwards.");
		output("\n\n<i>“");
		if(InCollection(pc.raceShort(), ["kaithrit", "milodan", "feline"])) output("Cat");
		else if (InCollection(pc.raceShort(), ["ausar", "huskar", "korgonne", "canine", "vulpine", "lupine"])) output("Outsider");
		else output("Alien");
		output(" release! Must release!”</i> the dog-man begs, with an expression of creeping dread. You laugh in his face, holding him until his dick flags and begins to shrink... with his knot still swollen too big to put back in his pants. You give his half-limp dick one last stroke, and pick up your gear, leaving him there to sulk.");
		//merge
	}
	//end, do pc orgasm, pass time
	processTime(30);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//PC loss intro:
//coder reminder: the korg does not fuck PC on a loss unless NPC lust is >= 30%
//writer reminder: korg male sexuality is much more abrupt and impulsive because they only fuck when aroused to bursting, so the korg male gets naked in the snow without worrying about shelter
public function maleKorgonneLossRouter():void
{
	author("Zeikfried");
	//if NPC lust < 30%
	if(pc.lust() < 33)
	{
		output("You fall before the korgonne, laid low by ");
		if(pc.HP() <= 0) output("his attacks. He grins and rifles through your stuff,");
		else 
		{
			output("your lusts. He glances at your heaving chest");
			if(pc.hasCock()) output(" and stiffening cock,");
			if(pc.hasVagina()) output(" and quivering, pinched [pc.thighs],");
			if(!pc.hasGenitals()) output(",");
		}
		output(" pondering you... but apparently decides you’re not arousing enough to play with, because he turns and trudges away through the snow. It’s almost a little... insulting?");

		output("\n\nAs you lie on your ");
		if(pc.isTaur()) output("side");
		else output("back");
		output(", staring up at the swirling winter storm, you wonder how the fairer korgonne sex tempts such frigid bastards.");

		//pass time, do other loss penalties, no sex
		output("\n\n");
		CombatManager.genericLoss();
	}
	//if NPC lust >= 30%
	else
	{
		output("You fall before the korgonne, defeated by ");
		if(pc.HP() <= 0) output("his attacks.");
		else output("your own lusts.");
		output(" He doesn’t make a move right away; curious, you turn your attention from your own state. Instead of being pleased, the korgonne looks intense... almost pained. He rubs his thighs together as he considers you, and takes a ponderous step closer, and then another, until you can see his " + enemy.eyeColor + " eyes - they smolder like stoked coals.");
		//do ‘Next’; pick and output a loss sex scene
		clearMenu();
		addButton(0,"Next",pickAKorgLossScene);
	}
}

public function pickAKorgLossScene():void
{
	var highProbs:Array = [];
	var lowProbs:Array = [];
	//intercrural sex
	//more likely if [tbd decide why a korg would pick this] (PC has muscular tone?)
	//does /not/ give the PC an orgasm, so you may or may not want to lower the odds of it being selected
	if(pc.tone >= 75) highProbs.push(worstKorgLoss);
	lowProbs.push(worstKorgLoss);

	//scene is possible if PC has larger breasts than a female korgonne (i think they have E-cup?) (alternately, if the korg has a high preference for boobs and PC’s are C-cup or better)
	//suitable for any sex or gender that meets the boob req, even beardy dudes i guess
	if(pc.biggestTitSize() >= 13) highProbs.push(tittyFuckBoiKorgs);
	if(pc.biggestTitSize() >= 5) lowProbs.push(tittyFuckBoiKorgs);

	//loss, forced oral (target words: 1500) (current words: 1183)
	//suitable for any PC sex
	//more likely if ??? (dunno, maybe default if pc has no attributes the randomly-generated korg likes)
	//korg knots in throat and cums while pc masturbates (where possible) for auto-erotic asphyxiation orgasm
	//if you ever introduce an alternate breathing method (e.g. gills, spiracles, or allowing goo PCs to respirate through their skin), this scene won’t make sense and should not be played for such characters
	if(pc.lipRating() >= 6) highProbs.push(korgForcedOral);
	lowProbs.push(korgForcedOral);

	//loss, vagOrAss penetration (target words: 1500) (current words: 1543)
	//suitable for any PC sex
	//optionally, link the choice to the randomized sexual preferences? (e.g. korgs with higher ass/pussy affinity go for this whenever they can)
	//korg likes it doggy-style (herp derp), prefers pussy if present, and always indexes for the tightest cunt that can fit him
	//korg knots and cums deep inside unless the hole is too loose, in which case he pops out, spills everywhere, and is surprised
	//Fen requested this note (ca. April 2016): because the current vag capacity calc in creature.as with +400 cap for taurs puts them well outside what bipeds can achieve without elasticity or bonus cap (~311.76), there’s no overlap to allow female taurs to be tight enough to lock onto the knot while loose bipeds have it pop out, ergo all taurs will automatically get the loose ending; the ass calc is more forgiving

	if(enemy.sexualPreferences.getPref(GLOBAL.SEXPREF_BIG_BUTTS) > 1) highProbs.push(getKorgedInTheButtOrPussy);
	else lowProbs.push(getKorgedInTheButtOrPussy);

	if(highProbs.length > 0 && rand(4) != 0) highProbs[rand(highProbs.length)]();
	else lowProbs[rand(lowProbs.length)]();
}

//loss, vagOrAss penetration (target words: 1500) (current words: 1543)
//suitable for any PC sex
//optionally, link the choice to the randomized sexual preferences? (e.g. korgs with higher ass/pussy affinity go for this whenever they can)
//korg likes it doggy-style (herp derp), prefers pussy if present, and always indexes for the tightest cunt that can fit him
//korg knots and cums deep inside unless the hole is too loose, in which case he pops out, spills everywhere, and is surprised
//Fen requested this note (ca. April 2016): because the current vag capacity calc in creature.as with +400 cap for taurs puts them well outside what bipeds can achieve without elasticity or bonus cap (~311.76), there’s no overlap to allow female taurs to be tight enough to lock onto the knot while loose bipeds have it pop out, ergo all taurs will automatically get the loose ending; the ass calc is more forgiving

public function getKorgedInTheButtOrPussy():void
{
	clearOutput();
	showKorgiMaleHostile(true);
	author("Zeikfried");
	output("The korgonne falls upon you, ");
	var x:int = -1;

	if(pc.hasVagina() && pc.blockedVaginas() == 0)
	{
		x = pc.findEmptyPregnancySlot(1);
		if(x < 0) x = pc.smallestVaginaIndex();
	}

	//(not wearing heat belt)
	if(pc.hasHeatBelt()) output("pulling aside your gear and groping for your sex.");
	else
	{
		output("clumsily ");
		if(!pc.isCrotchExposedByArmor() && !pc.isAssExposedByArmor()) 
		{
			output("probing and pinching in search of the fasteners to your [pc.armor]. He shells you of your outerwear, ");
			if(!pc.isCrotchExposedByLowerUndergarment() && !pc.isAssExposedByLowerUndergarment()) output("then strips your [pc.lowerUndergarment], ");
			output("exposing your intimates to the bitter cold that pervades even through your specialized gear.");
		}
		else if(!pc.isCrotchExposedByLowerUndergarment() && !pc.isAssExposedByLowerUndergarment()) output("fingering at the hem of your [pc.lowerUndergarment]. He pulls it from you, exposing your intimates to the tingle of cold Uveton air even through the field of your heating equipment.");
		else output("groping in search of your sex. His leathery fingertips push through the heat field of your gear, smuggling in just a wisp of cold air before the micro-computer compensates.");
	}
	output("\n\nWhat he finds must please him... a wolfish grin curls his lip as his leathery finger slips inside your ");
	if(x >= 0)
	{
		if(pc.vaginas[x].wetness() < 3 && pc.lust() <= 50) output("labia");
		else output("wet labia");
	}
	else
	{
		if(pc.ass.wetness() < 1) output("asshole");
		else output("wet asshole");
	}
	output(". You ");
	if(pc.isNice()) output("shiver and moan as his digit stimulates you.");
	else output("bite your tongue as he tickles your nerves, trying not to show weakness, but when you see the predatory look in his eyes, you shiver and moan anyway.");

	output("\n\n<i>“");
	if(InCollection(pc.raceShort(), ["kaithrit", "milodan", "feline"])) output("Cat");
	else if (InCollection(pc.raceShort(), ["ausar", "huskar", "korgonne", "canine", "vulpine", "lupine"])) output("Stranger");
	else output("Alien");

	output(" ");
	if(x >= 0 && (pc.lust() >= 50 || pc.vaginas[x].wetness() >= 3)) output("wet");
	else if((x >= 0 && pc.vaginas[x].looseness() < 3) || (!x < 0 && pc.ass.looseness() < 3)) output("tight");
	else output("loose");
	output(",”</i> he rumbles. <i>“Perfect for mate.”</i>");

	//only if pussy
	if(x >= 0)
	{
		output("\n\nHe pulls his fingers back out, examining the wetness on their tips. His smile breaks into a goofy, lurid grin, and he raises them to his nose, taking a deep scent.");
		output("\n\n");
		if(pc.vaginas[x].type == GLOBAL.TYPE_CANINE) output("<i>“Smell like home too,”</i> he muses.");
		//(feline/milodan pussy)
		else if(pc.vaginas[x].type == GLOBAL.TYPE_FELINE || pc.vaginas[x].type == GLOBAL.TYPE_MILODAN) output("<i>“Smell of cats,”</i> he observes. <i>“Far from tribe.”</i>");
		//(zil/myr/other sweet-producing puss)
		else if(pc.vaginas[x].type == GLOBAL.TYPE_BEE || pc.vaginas[x].type == GLOBAL.TYPE_MYR || pc.girlCumType == GLOBAL.FLUID_TYPE_NECTAR || pc.girlCumType == GLOBAL.FLUID_TYPE_HONEY) output("<i>“Sweet smell,”</i> he mumbles. <i>“Good smell for small burrow.”</i>");
		else output("<i>“Strange smell,”</i> he teases, licking the fingers with his long tongue. <i>“Not bad. Alien.”</i>");
	}
	//rejoin
	output("\n\nNext he moves to the leather cords holding on his breeches. He unfastens them, then pauses to look up at you. He wants something... for you to look at his crotch, you guess from his eyes. The hands work his tight waistband loose, then slide it down until a shadow appears in his fur. A few more inches and it turns from a shadow to a shaft. He frees his sex with a sigh and it springs up: an erect, tapered canine cock. The korgonne studies your reaction, and what he sees in your eyes - ");
	if(pc.libido() >= 66) output("raw lust");
	else output("curiosity");
	output(" - must be gratifying, because he gets a little harder still.");

	output("\n\nYou can see in his caprine eyes the moment when he decides he wants you: they harden, and his smile curls into a snarl as he takes charge of your body once more. He pushes you down, into the snow, until you’re on your knees. His hands slide up your [pc.ass], and you feel a hot, wet point press against your ");
	if(x >= 0) output("labia");
	else output("asshole");
	output(", promising to slide in if he lets gravity take over just for a second.");

	output("\n\nThe raider pauses, and your heart flutters. You stare at him... it’s not intentional, he’s savoring the moment. His grip tightens, and he pushes forward. The tapered glans easily slides inside you, parting and pushing its way through, and the korgonne shivers as the bulbous shape passes through your ring for the first time. A bump hits your ass as his tip touches deep inside; his knot is knocking at the entrance to your [pc.vagOrAss " + x + "], demanding admission as well. ");

	if((x >= 0 && pc.vaginas[x].looseness() < 3) || (x < 0 && pc.ass.looseness() < 3)) 
	{
		output("Your tight hole keeps it out as long as it can, but the korgonne holds all the power in this position... after two abortive thrusts, he finally pushes it in, filling your ");
		if(x >= 0) output("pussy");
		else output("asshole");
		output(" with black dog knot.");
	}
	else
	{
		output("Your loose hole easily accepts it, and the korgonne’s push overshoots. He falls over you, flustered, but quickly recovers his composure.");
	}
	if(x >= 0) pc.cuntChange(x,enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));

	output("\n\n<i>“");
	if(InCollection(pc.raceShort(), ["kaithrit", "milodan", "feline"])) output("Cat");
	else if (InCollection(pc.raceShort(), ["ausar", "huskar", "korgonne", "canine", "vulpine", "lupine"])) output("Stranger");
	else output("Alien");
	output(" make mate,”</i> he grunts, leaning against your ");
	if(x < 0) output("[pc.ass]");
	else output("[pc.belly]");
	output(". <i>“Have many pups.”</i>");

	output("\n\nThe dog-man begins to pump, testing your hole with his pointed prick; he starts with normal strokes, rubbing his cock against you and ploughing the point into your [pc.vagOrAss " + x + "], scraping the walls and leaving behind smears of alien pre. His ardor is burning hot... even with ");
	if(x >= 0 && (pc.lust() >= 50 || pc.vaginas[x].wetness() >= 3)) output("your wetness added to ");
	output("it, his strokes are so eager and quick that they almost cut through the lubrication. You must have teased the puppy to the brink of madness. His knot begins to grow, heralding a shift in his focus....");
	output("\n\nAs his girth gets thicker and thicker, his thrusts grow shallow. The korgonne’s knot is picking up inches; he whimpers and whines with pleasure at each one. Already the sound of it popping in and out of your [pc.vagOrAss " + x + "] is audible over the constant wind; he still pauses outside sometimes to rub his shaft against your labia, but his attention is moving downward. The next time he forces the knot in, it doesn’t come out again. The korgonne tugs gently at it, then a smile spreads gradually over his stubby face.");
	output("\n\n<i>“Joy come soon,”</i> he promises. Scooting closer to you, he changes his thrusts - he focuses on sliding the girthy bitch-breaker back and forth in you, stroking you with it. You find yourself drawing closer to climax, so completely touched on every nerve by the voluminous canine prick. The korgonne, too, is intensifying his efforts. He chokes up on your ass, pulling you into his crotch on the in-stroke with such force that you would expect him to bounce off if he weren’t anchored. Inside you, the knot swells again, rounding out to touch every inch and growing still.");
	// 2nd stretch check, if not loose enough to pop out (see below)
	if(x >= 0) pc.cuntChange(x,enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));

	//very loose/wet hole ending (as it stands now, all taurs will also receive this ending)
	if((x >= 0 && (pc.vaginas[x].looseness() >= 4 || pc.vaginas[x].wetness() >= 4)) || (!x < 0 && pc.ass.looseness() >= 4))
	{
		output("\n\nOr so it would be. Though it’s probably <i>supposed</i> to hold him in place, the korgonne’s knot is merely the equal of your ");
		if((x >= 0 && pc.vaginas[x].looseness() >= 4) || (x < 0 && pc.ass.looseness() >= 4)) output("stretched-out");
		else output("wet");
		output(" hole... but he may have overestimated its worth as an anchor. You can still feel it sliding through your [pc.vagOrAss " + x + "], a fact that has escaped the horny dog-man.");

		output("\n\nHis fat thrusts fill you like few lovers can, pulling on your nerves until you’re at the brink of climax... then over. Your [pc.vagOrAss " + x + "] clenches around the korgonne, and his knees buckle - you can feel him stagger against your [pc.ass]. Something twitches in his cock, and he shakes like he’s starting to cum as well.");

		output("\n\n<i>“Urrgh! Take puppies!”</i> he grunts, digging into your hips. The korgonne’s knot drags your nerves; he’s trying to press it against the walls. But with a terrific ‘pop’, the knot slides through the ring of muscle and falls out. The alien loses his grip on you; with a yip, he falls on his ass in the snow.");
		output("\n\n<i>“Too loose! Knot out!”</i> He grabs wildly at you and penetrates you again, trying to squeeze his knot against you; it slips out again. The korgonne howls in frustration and pull his cock free, then grabs it in his hand and squeezes the knot. A splatter of hot cum hits you in the ass as he empties his knot the only way left to him, whimpering pathetically.");

		output("\n\nHe finishes himself off, squeezing as many strokes as he can on your [pc.ass], then stares at you. You look over your shoulder and meet his eyes ");
		if(pc.isNice()) output("apologetically");
		else if(pc.isMischievous()) output("innocently");
		else output("smugly");
		output(". He opens his mouth as if he wants to speak, but then thinks better... with a huff, he tucks his cock back into his pants");
		output(", rifles through your stuff");
		output(", kicks some snow over you angrily, and leaves.");
		if(pc.isAss()) output(" Dumb mutt.");

		//end scene, pc orgasm, do korgonne load on (not in) ass (still feed ass mimbrane)
		mimbraneFeed("ass");
		processTime(30);
		pc.applyCumSoaked();
		pc.orgasm();
	}
	//no preg check
	//else tight enough to knot ending
	else
	{
		output("\n\nThe korgonne’s knot is so big now, he can barely move inside your [pc.vagOrAss " + x + "]. But rather than lessen his pleasure, he seems to be getting closer and closer to orgasm every time he tugs, abusing and stretching you to fit his growing alien monster.");
		output("\n\n<i>“Knot so joyful,”</i> he moans. The korgonne’s cock twitches, and he pulls so hard against your ");
		if(x >= 0) output("cunt");
		else output("asshole");
		output(" you fear he’ll turn you inside-out. It’s starting to feel very uncomfortable, to turn you back from the brink of orgasm... you shift and pull away from the korgonne instinctively, but he remains anchored in your [pc.vagOrAss " + x + "]. If anything, it’s making him even more eager. With a howl, he digs his fingers into your hips and begins to cum.");
		output("\n\nEvery time he pulls against you, another stroke of cum squirts from him, splattering deep in your ");
		if(x >= 0) output("womb");
		else output("gut");
		output(". The loads of doggy-spunk wash through you, filling you with warmth; your ruined orgasm from before resurges, just barely tipping you over. You whimper, and climax. The korgonne’s head rolls back on his shoulders as your [pc.vagOrAss " + x + "] meekly milks his throbbing knot, and he continues to push-pull into you until he’s emptied his massive load.");
		output("\n\n<i>“Give you puppies,”</i> he sighs, rubbing your [pc.ass] affectionately. He pulls the knot free - it’s still swollen, but not nearly as much as it was when it was packing a load. Your abused hole drools a stream of jizz, too stretched by the incredible expanding knot to close completely. He tucks his cock into his pants, satisfied, then rifles your pack for souvenirs and takes off. Feeling sore and bloated, you eventually do the same... after a rest.");
		//end scene, pc orgasm, do korgonne load in vag w/ preg check
		processTime(30);
		if(x >= 0) pc.loadInCunt(enemy,x);
		else pc.loadInAss(enemy);
	}
	output("\n\n");
	CombatManager.genericLoss();
}

//loss, forced oral (target words: 1500) (current words: 1183)
//suitable for any PC sex
//more likely if ??? (dunno, maybe default if pc has no attributes the randomly-generated korg likes)
//korg knots in throat and cums while pc masturbates (where possible) for auto-erotic asphyxiation orgasm
//if you ever introduce an alternate breathing method (e.g. gills, spiracles, or allowing goo PCs to respirate through their skin), this scene won’t make sense and should not be played for such characters
public function korgForcedOral():void
{
	clearOutput();
	showKorgiMaleHostile(true);
	author("Zeikfried");
	output("The alien zeroes in on you. ");
	//(airtight armor)
	if(pc.hasAirtightSuit()) output("You’re in no position to resist - he shucks your complicated armor so quickly you’re left wobbling. ");
	output("With a toothy smile, he reaches for your face and pulls you in close.");

	output("\n\n<i>“Pretty ");
	if(InCollection(pc.raceShort(), ["kaithrit", "milodan", "feline"])) output("kitty");
	else if (InCollection(pc.raceShort(), ["ausar", "huskar", "korgonne", "canine", "vulpine", "lupine"])) output("puppy");
	else output("alien");
	output(",”</i> he murmurs, caressing your cheek with leathery finger pads. <i>“Exotic lips.”</i>");

	output("\n\nYou almost take it as a compliment... until the korgonne unfastens his breeches and reveals a pointed, black canine cock, already erect. It was no flirt. It was a statement of intent.");

	output("\n\nHis grip on your chin tightens and he pulls you in, pressing your face to the tip of his dick. It bumps against your nose, filling you with a strong, musky aroma. He doesn’t leave you time to savor it, though; he opens your mouth with a strong hand and lines up. With a slow, but insistent, push, he forces it inside. The tapered shape makes it quite easy going - until he gets to the knot. It’s already so swollen that he has to push your jaw wide to slip it in, and you feel him shiver as your teeth scrape it. Your nose tickles in his belly fur, and the tip of his cock touches the back of your throat, depositing a warm drop of precum.");

	output("\n\n<i>“Fit so good,”</i> he mumbles.");

	output("\n\nHe pops it out again, then takes your head in both hands and waits for you to look up. Gazing deeply into your eyes, he begins to thrust in your mouth, teasing his glans on your tongue and leaving hot, salty flavors behind. He focuses on the tip and shaft, but every so often, he’ll push the knot past your teeth to feel the scrape. And every time he does, it’s a little bit bigger....");

	output("\n\n");
	//(if masturbation-capable)
	if(pc.canMasturbate() && pc.hasGenitals() && (pc.blockedVaginas() == 0 || pc.hasCock()) && (!pc.isTaur() || pc.biggestCockLength() >= 48)) 
	{
		output("It seems clear, at this point, that he won’t be needing your assistance to get off... you slip your fingers ");
		if(!pc.isCrotchExposed()) output("into your [pc.crotchCover]");
		else output("down to your crotch");
		output(" and find your ");
		if(pc.hasCock()) output("[pc.cock]");
		else output("[pc.vagina]");
		output(", then begin to play with yourself, enjoying the korgonne’s love on more than just a mental level. ");
	}
	output("The korgonne picks up speed, fucking your face like a wife and grunting, shuddering and squirting pre when you curl your [pc.tongue] around it. His pace increases, but the contact with the knot decreases... he’s holding it away, playing with the tip and shaft despite how much pleasure the knot clearly gives him. You begin to worry... even looking at it, you can tell it’s still getting bigger. He moans and grabs at your chin as he thrusts, getting hotter and hotter, and it comes to you quickly: he’s not using the knot because he’s about to cum, and he wants to last longer. Just as realization hits, the dog-man apparently gives up and resigns himself to orgasm. His knot barrels at you, hitting your teeth and forcing your jaw wide; it takes an agonizing second for it to squeeze through, with the korgonne’s muscle control failing and his legs wobbling from the pleasure.");

	output("\n\n<i>“Knot ready!”</i> he barks, pushing it through until it absolutely fills your palate to the point that you can feel the veins. <i>“Take heat-water!”</i>");

	output("\n\nHis excitement is dangerous - not only is the knot stuck behind your teeth, but now it’s so swollen that it can’t even move. The korgonne jerks and thrusts at your face, but all he manages to do is bob your head. Your throat spasms, trying to swallow his bulbous cock; every time your muscles move, the korgonne rumbles in pleasure. The knot bulges a bit more, stretching your jaw to the limit. You can feel the pulsing veins in his skin against your palate, pumping blood furiously in time with his racing heart. Your air has been cut off too long, now - you’re starting to feel euphoric and groggy");
	if(pc.isTaur()) output(", and the urgency makes your neck work harder. The korgonne’s knees buckle, and his eyes begin to roll wildly.");
	else if(!pc.hasCock() && pc.blockedVaginas() > 0) output(", and the urgency makes your neck work harder. The korgonne’s knees buckle, and his eyes begin to roll wildly.");
	else 
	{
		output(", and your ");
		if(pc.hasCock()) output("cock twitches with the buildup of a powerful orgasm, trying desperately to deliver a load before your life is snuffed out.");
		else output("pussy shivers with need, pulling at your fingers as your panicked energy drives you toward a higher and higher climax.");
	}
	output("\n\nThe dog-man lets out a low howl, and wraps his arms around your head. A hot, thick drop of something hits the back of your throat - he’s cumming! You will yourself to hold on, knowing it will be done soon... but the rest of the cum doesn’t come.");

	output("\n\n<i>“Ungh,”</i> the dog-man grunts, stomach quivering against your forehead. <i>“Take seed!”</i>");

	output("\n\nYou’re wondering where the seed he promised is. The bulbous prick stuck in your throat twitches and throbs, but produces nothing. At least, until the korgonne moves his hands to your shoulders, and starts to push you away. As his fat knot is compressed against the back of your teeth, you feel something give way, and it shrinks just a bit. Less than a second later, a glob of hot dog-jizz hits your throat, and begins the slow, slimy slide down to your stomach.");

	output("\n\nThe load blowing from the korgonne only stirs your desperate need for relief higher. Your hand is moving like a blur ");
	if(pc.hasCock()) output("on your [pc.cockNounSimple]");
	else if(pc.blockedVaginas() > 0) output("twisting uselessly against your blocked hole");
	else output("in your [pc.vaginaSimple]");
	output(", nearly out of conscious control as your awareness retreats from lack of oxygen. Your overzealous alien mate tugs again at your teeth, squeezing an even bigger load free; it boils down your throat like oil, coating your esophagus with pungent, salty spunk. Again and again he pulls, sending cumshots straight to your belly, but your tired mouth is closing as the knot shrinks. You just can’t concentrate enough to hold it as wide open as he forced it.");
	//only if masturbating
	if(pc.canMasturbate() && pc.hasGenitals() && (pc.blockedVaginas() == 0 || pc.hasCock()) && (!pc.isTaur() || pc.biggestCockLength() >= 48))
	{
		output("\n\nAs your consciousness teeters on the balance, your orgasm escapes from you, like life fleeing your body. ");
		if(pc.hasCock()) 
		{
			output("[pc.EachCock] erupts with a ");
			if(pc.cumQ() < 5) output("sprinkle");
			else if(pc.cumQ() < 200) output("spurt");
			else output("blast");
			output(" of [pc.cum] that hits the korgonne’s legs");
			if(pc.cumQ() >= 1000) output("; so much escapes and with such force that it melts a hole in the snow behind the korgonne, and he almost loses his footing");
			output(".");
		}
		else if(pc.hasVagina())
		{
			output("[pc.EachVagina] tremors harder than you can remember it cumming, belting out one final");
			//(squirter and clothed)
			if(pc.isSquirter() && !pc.isCrotchExposedByLowerUndergarment()) output(", panty-soaking");
			output(" orgasm before oblivion.");
		}
		output(" The pleasure pushes you over into darkness - you pass out into oxygen-deprived unconsciousness, slumping against the raider’s furry belly. The last thing you feel before you’re out is another shot of cum hitting your throat....");
	}
	//(not masturbating)
	else
	{
		output(" You can’t really concentrate at all, in fact....");
	}
	//rejoin
	//do a ‘Next’ or a ‘Time Passes’ or a ‘X hours later....’ here if you like
	processTime(30);
	pc.changeLust(11);
	if(pc.canMasturbate() && pc.hasGenitals() && (pc.blockedVaginas() == 0 || pc.hasCock()) && (!pc.isTaur() || pc.biggestCockLength() >= 48)) pc.orgasm();
	pc.loadInMouth(enemy);
	clearMenu();
	addButton(0,"Next",korgMouthFilling2);
}

public function korgMouthFilling2():void
{
	clearOutput();
	showKorgiMaleHostile(true);
	author("Zeikfried");
	output("Almost two hours later, you wake up lying on your side. You note with some surprise that you’re still alive. The korgonne is gone");
	if(pc.credits > 0)
	{
		output(", as is some of your money");
		var losing:Number = Math.floor(pc.credits/10);
		if(losing < 1) losing = 1;
		if(losing > 20000) losing = 19000 + rand(1001);
		pc.credits -= losing;
	}
	output("... You sit up, and your extremely full stomach sloshes heavily. The sudden stir draws out a burp, and you realize with ");
	if(pc.libido() >= 66) output("a horny tingle");
	else output("some revulsion");
	output(" that you’ll be belching salty cum for a long while. As a particularly loud burp escapes, you realize just how sore your jaw is, too.");

	//pass much time, do korgonne load in mouth, do pc orgasm if able to masturbate unaided (e.g.: no taurs or neuters), lose a medium amount of energy (tired and sore)
	processTime(70+rand(11));
	pc.energy(-10);
	output("\n\n");
	CombatManager.genericLoss();
}

//loss, tittyfuckin’ (target 1500 wds) (current words: 1328)
//scene is possible if PC has larger breasts than a female korgonne (i think they have E-cup?) (alternately, if the korg has a high preference for boobs and PC’s are C-cup or better)
//suitable for any sex or gender that meets the boob req, even beardy dudes i guess

public function tittyFuckBoiKorgs():void
{
	clearOutput();
	showKorgiMaleHostile(true);
	author("Zeikfried");
	output("The korgonne is upon you quickly, before your ass even has a chance to settle in the snowdrift. He presses close and his stubby fingers move with surprising speed");
	if(pc.hasAirtightSuit()) 
	{
		output(", shelling you of your [pc.armor]");
	}
	else if(!pc.isChestExposedByArmor()) output("pulling off the top of your [pc.armor]");
	output("; clearly, he knows what he wants.");

	output("\n\nHe looks down at your [pc.breasts], staring lewdly with alien eyes, and pushes closer still, holding you to his chest and feeling you against his body. His hands slide up from your stomach, cupping the undersides, testing their weight; his smile deepens as they bounce in his palms.");
	//(bra)
	if(!pc.isChestExposedByUpperUndergarment()) output(" With one motion, he flips up your [pc.upperUndergarment], exposing them completely to view.");
	output("\n\n<i>“Pretty nursery,”</i> he murmurs, caressing them lovingly.");
	if(pc.canMilkSquirt()) output(" When a trickle of [pc.milkNoun] escapes your nipple, he rumbles happily. <i>“Family at home, too....”</i>");

	if(pc.isTaur()) output("\n\nThe alien takes a step back, and puts his hands on your shoulders, then forces you to kneel.");
	else output("\n\nThe alien’s hands trace the outsides of your breasts affectionately, then up to your shoulders; he pushes you onto your back, gentle but insistent.");
	output(" Now above you, he finds the straps to his hide breeches and loosens them... it doesn’t take a pornstar to guess what comes next. His big, bulbous dick springs free, already erect.");

	output("\n\nIt advances on you as the korgonne steps forward again, a little black seneschal, ominous with purpose - he pushes it at you wildly, and it jabs your collar. Controlling himself just enough, he takes it in hand and presses it to your chest instead... and then his restraint evaporates. His hips thrust violently, pushing the throbbing tip through your cleavage; ");
	//(huge tits)
	if(pc.biggestTitSize() >= 40) output("it barely reaches half-way before his length is exhausted by your literally-out-of-hand size.");
	else output("it glides on such slick speed that it pokes into your chin.");

	output("\n\nYour perverted lover shivers. His face tightens, a reflection of the pleasure gotten of your lewd, matronly body, and he takes your breasts in his hands. Your nipples perk up as his soft fingerpads pass over them, and he fixates immediately, grabbing and tugging them to pull your [pc.breasts] closer around his prick.");

	//korgo comments on nipples fork
	//if dicknips
	if(pc.hasDickNipples()) 
	{
		output("\n\nThe stimulation sets you off - reacting to the korgonne’s rough handling, your [pc.nippleCocks] creep from their housing, protruding right into the alien’s palms. He pulls back, startled, and looks down at the dribbling, mutant genitals.");
		output("\n\n<i>“Strange alien,”</i> he blurts. <i>“Nursery hide little men!”</i>");
		output("\n\nDespite the confusion, his dick isn’t getting any softer... it throbs and bulges against your chest urgently until, haltingly, the korgonne steels himself and grab onto your shafts like handles.");
	}
	//if cunt nips, lip nips, or inverted nips
	else if(pc.hasFuckableNipples())
	{
		output("\n\nThe stimulation begins to reach you through your far-away nerves - slowly, your [pc.nipples] grow ");
		if(!pc.hasLipples()) output("puffy and erect");
		else output("wet and loose, ready for penetration");
		output(". The korgonne remains oblivious until, on one wanton squeeze, his thumb slips inside the ring. He freezes, and looks at it.");

		output("\n\n<i>“Nursery empty!”</i> he marvels, feeling out the inside of your nipples. ");
		if(!pc.hasLipples()) output("His thumb runs across your hidden nub, and his expression becomes significantly more mundane. <i>“Or just hidden,”</i> he amends.");
		else output("A bloom of lubrication from your sex-ready nipple-hole soaks his finger, which he has hooked in and is using to tug at your breast. <i>“Feel like mate,”</i> the korgonne continues, testing the depth, <i>“but too young for knotting.”</i>");
	}
	//if multi-nips
	else if(pc.bRows() > 1)
	{
		output("\n\nHe doesn’t shy away from your cow-like udders, either; his fingers glide through them like wolves hunting in a forest, spreading wide in a net that catches and rubs them between.");
		output("\n\n<i>“Alien body like beast’s,”</i> he smiles");
		if(pc.isLactating()) output(", as a dribble of [pc.milkNoun] wets his palm");
		output(". <i>“Keep you and milk you.”</i>");
	}
	//else
	else
	{
		output("\n\nYour [pc.nipples] perk up in his hand, and he grinds his palm against them, half-playful and half-sadistic, watching your reaction to the treatment.");
		output("\n\n<i>“");
		if(InCollection(pc.raceShort(), ["kaithrit", "milodan", "feline"])) output("Cat");
		else if (InCollection(pc.raceShort(), ["ausar", "huskar", "korgonne", "canine", "vulpine", "lupine"])) output("Stranger");
		else output("Alien");
		output(" need milking?”</i> he gibes, pinching them weakly. <i>“Low like pregnant beast. Korgonne will milk.”</i>");
	}
	//merge here
	output("\n\nHe seems pleased by his wit, but not as pleased as by the feel of your [pc.skinFurScales] on his cock. The korgonne begins to move - he pushes up, dragging his canine tip up your cleavage, and breaking the droplet of pre that built up while he was playing with your breasts. It leaves a slick track.");
	output("\n\nYour skin flushes as he rides his track deeper and deeper, drooling pre until your cleavage feels smooth and hot; the korgonne celebrates the coating of your tits by grabbing them and pushing them together, sleeving his cock completely. The heat only intensifies with his dick trapped inside. A faint whimpering escapes your eager lover, and his lips tremble when he begins to thrust again. With nowhere to go, his pre pools atop your breasts, a little sloppy reservoir of spooge that leaks down your cleavage every time he pulls back.");
	output("\n\nThe alien’s thrusts pick up speed as your body-sleeve gets hotter and wetter; you feel his veins against your body and on every up-thrust, his bulbous knot hits the bottom of your chest with a wet smack, leaving a mark. The slaps get bigger and wider every few strokes - his knot is swelling as he fucks, growing in size. You ");
	if(pc.libido() >= 66) output("fantazise about");
	else output("imagine");
	output(" taking that monster inside, and shudder. The korgonne notices - and takes your reaction for enjoyment. His knot swells another quarter-inch as you make eye contact.");
	output("\n\n<i>“Urrgh,”</i> he groans, rolling his head back, <i>“take heat-water!”</i>");

	output("\n\nHe forces your [pc.breasts] together around the knot, pushing against the valley of your cleavage, and you can quite literally see the small, pale-tinted urethra in his dick distend with a white dot. Milliseconds later, a lance of alien spunk launches from it, arcing out at your face as his knot compresses against your chest. His hips are ashiver, jerking back and pushing against your chest again and again to compress the knot and force out his painfully built-up load, and he fondles and re-fondles your breasts, choking up to keep them pressed to his sweltering, pulsing prick - you can only close your eyes and enjoy his touch as hot, sticky dog-jizz covers your face and drips down into your cleavage.");
	//add lots of lust
	pc.changeLust(20);

	//if lactating, or if added lust puts PC over max, PC cums from nipple stimulation (no PC orgasm otherwise)
	if(pc.lust() >= pc.lustMax() || pc.canMilkSquirt())
	{
		if(pc.isLactating()) 
		{
			output("\n\nYour lover pinches your nipples harder every squeeze, lost in pulling your matronly breasts ever-closer around his ejaculating prick. The kneading stirs something deep in you... with a twinge of relief, your milk lets down. You groan in pleasure, climaxing as ");
			if(!pc.canMilkSquirt()) output("steady trickles");
			else output("great spurts");
			output(" of [pc.milkFlavor] foam turn the korgonne’s crotch into a matted, [pc.milkColor] mess.");
			pc.milked();
		}
		else
		{
			output("\n\nYour lover’s soft, leathery fingers curl around your [pc.nipples] over and over, grasping and pushing your breasts closer to his ejaculating knot. The stimulation of having your breasts desired so much yet handled so callously is exhilarating - with the lusts already boiling in you, the added teasing is enough to set you off. As the korgonne ");
			//(big nipp)wraps his hand around
			if(!pc.hasLipples() && (pc.hasDickNipples() || pc.nippleLength(0) >= 4)) output("wraps his hand around");
			else output("runs his palm over");
			output(" your nipple, you slip over into a small orgasm of your own, moaning");
			//(genitals)
			if(pc.hasGenitals()) 
			{
				output(" and cumming");
				//(clothes)
				if(!pc.isCrotchExposed()) output(" in your [pc.lowerGarment]");
				//(nude and male or squirter)
				else if(pc.hasCock() || (pc.hasVagina() && pc.isSquirter())) output(" all over the alien’s furry legs");
			}
			output(" as the oblivious korgonne paints your face with doggy seed.");
		}
	}
	//rejoin
	output("\n\nSated at last, the korgonne looks down at you, covered in jizz, with a big black cock between your [pc.skinFurScalesColor] breasts, and the sight is apparently so funny that he comes out of his lusty trance.");

	output("\n\n<i>“");
	if(InCollection(pc.raceShort(), ["kaithrit", "milodan", "feline"])) output("Cat");
	else if (InCollection(pc.raceShort(), ["ausar", "huskar", "korgonne", "canine", "vulpine", "lupine"])) output("Stranger");
	else output("Alien");
	output(" look like pup with milk on face,”</i> he hoots. <i>“Nurse hard, drink lot!”</i>");

	output("\n\nYou ");
	if(pc.isMischievous()) output("smirk");
	else output("frown");
	output(", and the korgonne withdraws from your tits, tucking his sloppy dick back into his hide pants. He snorts, rifles your pack, and leaves, while you scrub the spunk from your face with handfuls of snow.");

	//end, pass time, loss penalties
	var needCums:Boolean = (pc.lust() >= pc.lustMax() || pc.canMilkSquirt());
	processTime(30);
	if(needCums) pc.orgasm();
	pc.applyCumSoaked();
	output("\n\n");
	CombatManager.genericLoss();
}

//loss, intercrural sex (target 1500 wds) (current words 2131; needs editing)
//intercrural sex
//more likely if [tbd decide why a korg would pick this] (PC has muscular tone?)
//does /not/ give the PC an orgasm, so you may or may not want to lower the odds of it being selected
public function worstKorgLoss():void
{
	clearOutput();
	showKorgiMaleHostile(true);
	author("Zeikfried");
	output("The horny dog is on you quickly. His smooth, leathery paws peel your gear from you, leaving you denuded and ready for appraisal. He looks you over, considering; he lingers a long time on your [pc.vagOrAss], but eventually moves on. His eyes pan lower... down to your [pc.legs]. And there they stop.");
	output("\n\nThe strange korgonne smiles, as if he’d come to a decision, and begins to unfasten his hide breeches. He flops out his dick: a bulbous, black canine cock. With it hanging out, he walks over to you and kicks at you.");

	output("\n\n<i>“");
	if(pc.isTaur()) output("Around");
	else output("Over");
	output(",”</i> he orders. <i>“");
	if(pc.isTaur()) output("Around");
	else output("Over");
	output(".”</i>");

	output("\n\nYou turn");
	if(!pc.isTaur()) output(", lying on your stomach in the snow, but the korgonne grabs your hips. He pulls you up, onto your hands and knees");
	output(". You can feel his leathery fingers caressing your [pc.thighs]; when you look back at him, he’s staring at them in rapture. He notices you watching, and barks loudly, pointing at you. You get the message and turn around again, with no choice but to let him explore you in his own time.");

	//fork for leg type
	//snake fork
	if(pc.isNaga())
	{
		output("\n\nYour conqueror surveys his prize, watching your ");
		if(pc.tone < 50) output("back tremble");
		else output("sturdy, muscular back flex");
		output(" as you hold the position he’s put you in. You wait uncomfortably like that for what feels like minutes, studiously staring forward to avoid provoking the alien. Suddenly, a hand grabs your [pc.ass] and the korgonne’s body is pressed up against yours. His black, canine cock, now fully erect, slides across the outside of your [pc.thigh], and the korgonne reaches for your serpentine tail. He passes it over his cock in a loop, wrapping it around to turn your whole body into a heated ");
		if(pc.hasScales() || pc.hasLegFlag(GLOBAL.FLAG_SCALED)) output("scaly ");
		output("love-sleeve.");

		if(!pc.isNice()) 
		{
			output("\n\nYou can’t help but want to sneak a look, so you do. The korgonne is too distracted to notice, this time - his attention is focused on positioning your tail on his sex. You take over, looping it dexterously to lull him into a sense of security. You wrap it around the doggy dick twice, then, as he’s savoring you, loop again... this time, around the swollen, sensitive-looking knot at the base. Before he can whimper a word, you give it a righteous squeeze, hard enough to leave a ");
			if(pc.hasScales() || pc.hasLegFlag(GLOBAL.FLAG_SCALED)) output("scale ");
			output(" pattern. Instead of yelping, though, the alien canine only smiles and moans harder!");
		}
	}
	//goo/amorphous fork
	else if(pc.isGoo())
	{
		output("\n\nYour conqueror looks you over, testing the jiggling borders of your amorphous body with taps of his toe. His expression, when you can sneak a glimpse, is a mixture between unnerved and curious. You wait for what’s definitely more than a minute, holding your assigned pose until your alien works up the courage to try out your body. When he does, though, it’s even a bit of a surprise to you. Instead of lining up with your [pc.vagOrAss], he grips your sloshing backside in both hands and stabs his hot, pointed dick into you well below it, battering a bulge in what would be your thighs. Your gooey skin easily absorbs the punishment, reshaping around the dog-dick as your lover pushes it further and further through you. Eventually, it pokes out the other side... though it would be trivial for you to maintain a complete sleeve, the way the queer korgonne growls when you try suggests that he actually wants it to be exposed to the air on one side! You move one hand underneath to tickle the glans, and he seems to take this much more in stride. Perhaps he’s not ready to <i>completely</i> abandon himself to the pleasures of bizarre alien sex yet....");
	}
	//else fork (including taurs)
	else
	{
		output("\n\nYour korgonne conqueror grunts in satisfaction behind you, checking out your naked ass and watching your ");
		if(pc.tone < 50) output("back tremble");
		else output("sturdy, muscular back flex");
		output(" to hold the position he demands. After only a few seconds of admiration, though, leathery hands grip your [pc.ass] on each side and a hot, wet point begins to press at your [pc.thighs]. With a drawn-out grunt, the korgonne forces his thick, tapered prick through your legs, then slides his hands down to squeeze them closed against the shaft, fine-tuning your pressure. He finds the strength that pleases him best and, warning you to maintain it with claw and growl, moves his hands back up to your [pc.hips] for leverage.");
	}
	//merge for middle section
	if(pc.balls > 0)
	{
		output("\n\nThe korgonne’s head rolls back as his bulbous, tapered dick parts your [pc.thighs] like a fleshy spear, turning them aside and powering through until the tip bumps into your [pc.sack]. His hands shiver on your hips as the hot pre stains your sack... or perhaps it’s your own hips that tremble enough to make his hands shake.");
	}
	//(elseif pussy present)
	else if(pc.hasVagina() && pc.blockedVaginas() == 0) 
	{
		output("\n\nThe korgonne’s tapered dick parts your [pc.thighs] and forces itself inside your personal space, like a spear. The tip glides ahead, but as the bulbous body follows, it begins to drag against your [pc.vaginas], stimulating the labia and tickling your [pc.clits].");
		if(pc.wettestVaginalWetness() >= 3) 
		{
			output(" The korgonne notices as well; when the veins and bumps of his stiff black dick pull dribbles of warm moisture from your over-lubricated puss");
			if(pc.totalVaginas() == 1) output("y");
			else output("ies");
			output(", he trembles. }He leans over you, breathing heavily, and buries his wet nose in ");
			if(pc.hasFur()) output("the fur of ");
			else if(pc.hasScales()) output("the scales of ");
			else if(pc.hasChitin()) output("the chitin of ");
			//(no text for skin)
			output("your back.");
		}
	}
	//(elseif dick present)
	else if(pc.hasCock())
	{
		output("\n\nPredictably, when the korgonne’s bulbous, tapered dick spears through your thighs, the first thing it finds is your limp, dangling [pc.cockNounSimple]. Either oblivious or excited by it, he grips harder and begins to thrust between your [pc.legs], frotting against your [pc.cocks]; the hot skin and sticky pre rubbing over you slowly stirs your shaft");
		if(pc.cockTotal() > 1) output("s");
		output(" to erectness. Within minutes, your own precum begins to ");
		if(pc.cumQ() < 20) output("drip");
		else if(pc.cumQ() < 2000) output("dribble");
		else output("stream");
		output(" from you, tingling its way down your shaft");
		if(pc.cockTotal() > 1) output("s");
		output(" to mingle with the korgonne’s.");
	}
	//(else)
	else
	{
		output("\n\nThe korgonne shudders as his tapered cock spears through your [pc.legs] - as the slow, bulbous curve plows aside the ");
		if(pc.tone < 50) output("fat");
		else output("meat");
		output(" of your ");
		if(pc.tone < 50) output("soft ");
		output("thighs, you can feel every vein and bump on its surface, inflamed with blood. His knees shake and he stumbles slightly, causing his fat dog-dork to rub against your [pc.belly] as well... apparently this pleases him, because he readjusts his feet to lower himself and keep it pressed against you");
		if(pc.biggestTitSize() >= 3 && pc.tallness < 90) output(", just barely poking into the cleavage of your [pc.chest].");
	}
	output("\n\nThe strokes begin to increase in speed, and as his cock-skin strains and tugs at your [pc.legFurScales], the korgonne’s breath comes in shorter and hotter pulses. He abuses your [pc.legs], railing them like a pussy with his hard hammer of a knot, enough to leave a bruise. You can feel it growing through your deadened nerves; every stroke the alien makes, his knot swells a bit more.");
	output("\n\nHe continues to pump until, with a great howl, he climaxes... but the relief you expect doesn’t come. Instead, he switches from long, full-shaft strokes to short jerks with the hard knot buried deep in you. If anything, he’s actually <i>increasing</i> his pace....");

	//re-fork for climax
	//amorphous (goo) leg fork
	//slight pregnancy chance if gooey + has vagina
	if(pc.isGoo())
	{
		output("\n\nAs the korgonne’s intensity grows, so too does his frustration - even with help from his hands, your soft, gooey [pc.thighs] can’t stay firm enough to put pressure on his straining, inflated knot. <i>“Useless fish paste,”</i> he mumbles, trying to mold you into a usable shape.");
		output("\n\nSoon his frustration takes form. Heaving a great sigh-cum-moan, he releases you, allowing your goopy piles to assume their usual slump... then reaches right into your ass! His leathery, smooth fingers push your malleable membrane ahead of them as they sink into you, burrowing down toward his knot. The greedy dog actually grabs his fat dick through your body, wrapping both hands around it through a thin cushion of you! Massive shudders rock his hips as he begins to squeeze down at last, squirting his painful-looking buildup of puppy spunk; as his tongue lolls from his mouth absently, his cock angles up from its new grip until it sinks completely into your lower body again. The hot loads are absorbed into your body, permeating your " + pc.skinTone + " with cum-off-white that spreads and infiltrates everywhere");
		if(!pc.hasPregnancy() && pc.hasVagina() && pc.blockedVaginas() == 0)
		{
			output(", including your tingling, neglected womb");
			if(pc.totalVaginas() > 1) output("s");
			output(".");
		}
		//go to ‘merge all forks to end’
	}
	//else, all other leg type
	else
	{
		output("\n\nThe korgonne’s grip grows stronger as his knot swells painfully - his sharp nails start to curve into your [pc.legFurScales], all regard for your safety is overridden by his terrible need for release. He squeezes your [pc.thighs] close to his cock, and thrusts hard, burying his knot in them. As he presses them together around the angry little ball, the first lance of dog-jizz lurches from his tip, pulling a long groan from him.");
	}
	//merge, then fork again
	//if naga legs or other prehensile unipod, feed leg mimbranes
	if(pc.isNaga() || pc.legCount == 1)
	{
		mimbraneFeed("feet");
		output("\n\nWith his grip focused around his knot, the rest of you is free to play with the distracted alien. You slip coil after coil around him, stacking them up until his whole cock is cocooned in [pc.name]. The next load of jizz to escape the dog man has nowhere to go; it splashes against your prison and runs back over the dog’s dick, coating it in hot, pungent spunk. You wait like that, holding his jizz to him until he finishes - then you wind him up a bit, sliding your coils over him like a big, slippery fist to leave his dick completely covered in cum.");
		output("\n\n<i>“Slimy eel,”</i> he grumbles, pushing your tail away with his hands");
		if(pc.isMischievous()) output(" in a hurry as the tip nears his asshole");
		output(".");
	}
	//elseif big balls(10+ inches), feed leg+all genital mimbs
	//very small preg chance if PC has vag (if you can be bothered) - FEN NOTE: I CAN'T! BWAHAHAHA
	else if(pc.balls > 1 && pc.ballDiameter() >= 10)
	{
		mimbraneFeed("feet");
		mimbraneFeed("cock");
		mimbraneFeed("pussy");
		output("\n\nThe load has nowhere to go with his cockhead tucked in between your [pc.balls], though; your [pc.sack] drapes over the dog-man’s cock so completely that the jizz splashes against the back and pools inside the little nest the tip has made. Stroke after stroke hits the pocket and boils out again, covering your genitals and the dog’s dick in a layer of sticky, hot cum.");
	}
	//elseif big tits (F-cup or bigger), feed chest mimbs
	else if(pc.biggestTitSize() >= 11)
	{
		mimbraneFeed("chest");
		output("\n\nThe load doesn’t get far, though; a glob of hot, sticky spunk hits the underside of your [pc.chest]. The korgonne doesn’t seem to notice or care - he continues squeezing and making tiny pumps, working his knot and bathing your tits in pup-spunk.");
	}
	//elseif big libido and not taur, feed face mimbs
	else if(pc.libido() >= 66 && !pc.isTaur())
	{
		mimbraneFeed("face");
		output("\n\nYou watch the first stroke fly through your arms, a blurred, pearly arrow that cuts a line in the snow, and you shiver. Your burning libido piques your curiosity; you lower your head and stare right down the barrel of the alien’s gun. The tip still drools from the last shot, and you can see and feel him squeezing down on your [pc.thighs] for another stroke. His knot shrinks just a bit, and the cock jerks; the hole at the tapered tip distends, and a white bead appears in the black. You jerk to pull away, but the cumshot launches with surprising speed, hitting you in the face with salty, sticky sperm that runs down your forehead and into your nostrils. Seized by sudden coughing, you don’t pull away in time for the next shot either, and it hits you right in the open mouth. You finally remember to look away, leaving the korgonne to blow the rest in the snow as you try to wipe the sticky jizz out of your eyes.");
	}
	//else, feed no mimbs
	else 
	{
		output("\n\nThe hot stroke flies through your ");
		if(pc.isTaur()) output("forelegs");
		else output("arms");
		output(" and cuts a swath in the cold snow, as does the next one and the one after that. The korgonne fires at least ten shots from his pistola, pumping your [pc.thighs] like bellows to milk the last drop out.");
	}

	//merge all forks to end
	output("\n\nSatisfied at last, the alien pulls his deflated knot free with a wet ‘pop’, then releases his grip. He raises his hand up and smacks your ass hard enough to ");
	if(pc.legCount == 2) output("knock you onto your side");
	else output("make it jiggle");
	output(".");

	output("\n\n<i>“Not den mate,”</i> he assesses you, <i>“but not bad.”</i>");

	output("\n\nYour ");
	if(pc.totalCocks() == 1) output("cock throbs");
	else if(pc.cockTotal() > 1) output("cocks throb");
	else if(pc.totalVaginas() == 1) output("cunt throbs");
	else if(pc.totalVaginas() > 1) output("cunts throb");
	else output("body throbs");
	output(" with unanswered lust from the way he used your crotch as a love-sleeve, and you look urgently at him, trying to ");
	if(!pc.isAss()) output("plead with");
	else output("order");
	output(" him to help you finish too. He meets your eye, and smiles - not a nice smile. Pulling up his pants, he leans in, licks your face, ");
	if(!pc.isTaur()) output("moves your hand to your crotch, ");
	output("and giggles. Then he strides off, leaving you stained with his slowly-freezing cum. Despondently, you reach for your gear and warm up before you allow yourself to relax.");

	//end, pass time, loss penalties
	//add lust, no pc orgasm
	processTime(30);
	pc.changeLust(15);
	output("\n\n");
	CombatManager.genericLoss();
}

/*
output("\n\ndrops:");
output("\n\n//same new items as Adjatha’s korg female; see https://docs.google.com/document/d/1nre7QbHOdZmkX4KMP1w5j0NDZ38iWc-YzSFUgqjp0jM/edit#heading=h.dxdi3s3nppey");

output("\n\n-Improvised Shield Generator");
output("\n\n-New Item: Yappi Strap (melee weapon)");
output("\n\n	"An exotic mixture of a whip and a club. Hurts like you wouldn’t believe.”</i>");
output("\n\n	Deals Kinetic damage. Shield drain.");
output("\n\n-New Item: Insulated Coat (armor)");
output("\n\n	"Stitched leather hides harvested from aquatic mammals in the planetaryaquatic core and dyed to blend in with the icy tundra of Uveto VII. It’s been sewn to consist of several cushioning layers that provide excellent protection against the cold but only moderate protection from everything else. It does have a wide arraywide number of pockets, so that’s a plus!”</i>");
output("\n\n	medium defence vs. Cold attacks, adds one inventory slot");
output("\n\n-empty slot/no drop (replaces female’s flashbangs and pistol)");
output("\n\n-Savicite (only from mercy’s reward)");
output("\n\n-Picardine (only from mercy’s reward)");
*/
//childbirth - removes rfx penalty - @210 days
public function korgonneBabyBirthing(pregSlot:int,c:Child):void
{
	clearOutput();
	author("Zeikfried");
	showName("KORGONNE\nBIRTH!");
	var pData:PregnancyData = (pc.pregnancyData[pregSlot] as PregnancyData);
	var x:int = pregSlot;
	if(pregSlot == 3) x == -1;
	var inShip:Boolean = InShipInterior();
	var inPublic:Boolean = (InPublicSpace() || rooms[currentLocation].planet.toLowerCase().indexOf("station") != -1 || rooms[currentLocation].hasFlag(GLOBAL.INDOOR));
	
	output("Your gut aches suddenly, and a sudden spot of damp grows on your ");
	//(nude)
	if(pc.isCrotchExposed()) output("[pc.thighs]");
	else output("[pc.lowerUndergarment]");
	output("... your water just broke!");

	//on PC’s ship without automatic medbay
	if (inShip)
	{
		output("\n\nYou grab some medical supplies and head for your berth, hoping the alienness of the baby doesn’t cause any complications. Stripping your gear as quickly as your [pc.belly] allows, you recline and begin to breathe in preparation for the labor.");
	}
	//9999on a ship with auto-medbay (not yet available; reminder comment only)
	else if(9999 == 0)
	{
		
	}
	//in public place
	else if(inPublic)
	{
		output("\n\nYour gut cramps in a second contraction, and your pained face attracts the attention of some passers-by. After some confusion and dithering, they help you to a medical aid station and leave you in the capable hands of the staff... and luckily, their painkillers.");
	}
	//in the jungle like a Tarzan bride
	else
	{
		//minor HP damage if you want
		output("\n\nOh, god... the timing couldn’t be worse. You look around furtively for help, but of course there’s no one out here but you. You strip your gear and arrange it to try and keep the baby off of the ground, planning to cope as best you can....");
	}
	//merge all openers
	output("\n\nFor what feels like hours but in reality is no more than forty-five minutes, you grunt and push, forcing the baby through. It’s a big, healthy child");
	//(tight vag)
	if(pc.vaginas[x].looseness() <= 2) output("... you’re glad, of course, but a small part of you screaming out for relief would have been happier with one just a bit smaller.");
	else output(", and your stretched-out sex is more than ready to accommodate.");
	output(" The most work is done getting the widest part of the baby through; once you have, it smoothly slides the rest of the way free, followed by the placenta.");
	if(x >= 0) pc.cuntChange(x,1000);
	else pc.buttChange(1000);

	var itsABoy:Boolean = (c.NumMale > 0);
	output("\n\nThe babe is a ");
	if(itsABoy) output("boy");
	else output("girl");
	output(" and is every bit the hybrid you expected. The downy beginnings of a shaggy korgonne mop top ");
	if(itsABoy) output("his");
	else output("her");
	output(" head, and two canine ears prick from it. ");
	if(itsABoy) output("His");
	else output("Her");
	output(" face is almost human, but with large sideburns, and the slightest up-turned snub-nose. Tellingly, ");
	if(itsABoy) output("his");
	else output("her");
	output(" lips are cerulean blue like a korgonne’s, and though the belly is bare, the downy fur continues down ");
	if(itsABoy) output("his");
	else output("her");
	output(" back, covering ");
	if(itsABoy) output("his");
	else output("her");
	output(" butt and legs. A tiny nub of a tail quivers from the warmth and closeness of your body.");

	output("\n\nYou call for the transport");
	if(pc.isLactating()) 
	{
		output(" and, while waiting, bring the whimpering infant to your breast. Strong hands grasp you and ");
		if(itsABoy) output("he");
		else output("she");
		output(" starts to suckle greedily - ");
		if(itsABoy) output("his");
		else output("her");
		output(" appetite is as healthy as ");
		if(itsABoy) output("he");
		else output("she");
		output(" is.");
	}
	else
	{
		output(" and amuse the little one by tickling ");
		if(itsABoy) output("him");
		else output("her");
		output(" with a finger. ");
		if(itsABoy) output("He");
		else output("She");
		output(" catches on it quickly with a strong grip and tries to put it in ");
		if(itsABoy) output("his");
		else output("her");
		output(" mouth, chewing at it with small, gummy bites.");
	}
	output(" The transport arrives too soon, and beeps at you insistently until you agree to put the child inside, not quite having had your fill of playing with ");
	if(itsABoy) output("him");
	else output("her");
	output(". Wistfully, you watch as it whisks your child away from the frontier to safety and security.");

	//increment child count
	//pregnancy is kor-gone
	processTime(45);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}