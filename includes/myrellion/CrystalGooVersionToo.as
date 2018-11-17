import classes.Items.Transformatives.GooBallBlue;
import classes.Items.Transformatives.GooBallGreen;
import classes.Items.Transformatives.GooBallOrange;
import classes.Items.Transformatives.GooBallPink;
import classes.Items.Transformatives.GooBallPurple;
import classes.Items.Transformatives.GooBallRed;
import classes.Items.Transformatives.GooBallYellow;

public function encounterCrystalGooV2():void 
{
	if (rand(2) == 0) crystalGooEncounterType1();
	else crystalGooEncounterType2();
}	

public function crystalGooEncounterType1():void
{
	var tEnemy:Creature = new CrystalGooT1();

	// First time with a type 1 (type 2 tracked separately)
	if (flags["CRYSTALGOO_T1_ENCOUNTERS"] == undefined)
	{
		flags["CRYSTALGOO_T1_ENCOUNTERS"] = 0;
		output("\n\nA ‘shff’ sound intrudes on your attention, but you find no one. The only other living things nearby are the lichens, mushrooms, and insects, none of which are large enough to make the noise. An eerie sensation of being watched stiffens your back.");
		
		output("\n\nYou move another step, and hear another ‘shff’. Convinced now that you’re not alone, you check again and find a patch of fungi upon a lichen carpet that tremble of themselves, without wind. The unnerving little mushrooms stop moving after a few seconds, and you turn away again, cold fingers of panic tightening on your throat.");
		
		output("\n\nA third scrape comes from behind. Struck with fear, you turn back instantly. Your pulse thunders as a dark maw opens in the lichen, revealing spindly limbs that grab for you!");
		
		// Do a reflex check to determine if the PC is grappled
		if ((pc.reflexes() + rand(30) + 1) / 2 > tEnemy.reflexes())
		{
			// No grapple
			output("\n\nWith a leap that would impress a gazelle you spring away and the creature crashes at your feet, then recovers with fluid grace and scurries away in a sinuous wave. Your assailant coils to face you again for the scuffle, lifting up to reveal a body under the concealing vegetation. A placid " + tEnemy.skinTone + " face with opaque eyes stares at you - no, not a face. A mask, unchanging and eerie. The creature raises gauntleted arms to ward blows, and under them you glimpse a solid chest sculpted into nipple-less teardrop breasts.");
			if (flags["MET_NYREA_BETA"] != undefined || flags["MET_NYREA_ALPHA"] != undefined) output(" From the waist up, it resembles the nyrea prowling the caves, but below");
			else output(" Below the waist");
			output(" its body changes to a segmented trunk of abutted plates, each section fitted with the fearful grasping legs.");
		}
		else
		{
			pc.createStatusEffect("Grappled", 3); // 9999
			// Grappled
			output("\n\nYou recoil but not far enough, and the creature wraps around you. As the umbral glow of fungus infiltrates its lichen cloak, your terrified mind assembles snatches of imagery into a picture of your assailant. It peers down with an unemotional face, like a cat observing an insect pinned under its paw. No, less a face than a mask - the creature’s whole body is covered in sculpted plates. Two gauntleted arms guard its torso plate, which is ornamented by pert, smooth breasts");
			if (flags["MET_NYREA_ALPHA"] != undefined || flags["MET_NYREA_BETA"] != undefined) output(" that lend it a resemblance to the nyrea who prowl the caves.");
			else output(". Below the waist is a frightening segmented trunk bearing the grasping legs that have closed around you.");
		}

		output("\n\nYour codex beeps out a belated warning: <i>“Ganrael detected. An amorphous, intelligent lifeform capable of hardening its outer skin into exoskeletal arms and armor. Available reports indicate that ganrael will attempt to harvest genetic material from individuals they encounter.”</i>");

		CodexManager.unlockEntry("Ganrael");

		if (pc.isGoo())
		{
			output("\n\nThe alien speaks. If its mouth could open, it wouldn’t be a surprise if it spat at you. <i>“Little droplet, do you think you stand a chance");
			if (pc.armor is EmptySlot) output(" without armor");
			output("? You will be punished for hunting in my territory.”</i>");
		}
		else output("\n\nThe alien trembles, and if its mouth could open you’re certain it would be salivating. <i>“Pleased to meet you,”</i> it buzzes. <i>“Hold still so I can enjoy myself.”</i>");

		output("\n\n<b>It’s a fight!</b>");
	}
	// Repeat
	else
	{
		output("When you move through this area, one of the lichenous rocks makes more noise than rocks are generally known for. You scan the surroundings, trying to pick out the lurking enemy that you know is there. For a tense moment, nothing moves - even the insects seem to stop crawling and watch.");

		//make a combined int/aim check to determine if PC detects enemy (copy to/from attack 3, ‘false retreat’) 9999
		if ((pc.aim() + pc.intelligence() + rand(60)) / 4 > (tEnemy.aim() + tEnemy.intelligence()))
		{
			output("\n\nA twitching fungus alerts you to its location.");
			if (!pc.hasRangedWeapon())
			{
				output(" You flick");
				tEnemy.shieldsRaw -= 3;
			}
			else
			{
				output(" Drawing quickly, you fire");
				tEnemy.shieldsRaw -= 11;
			}
			output(" your [pc.rangedWeapon] at the lichen and score a glancing hit as it dives aside. It uncurls into a ganrael ambusher and scurries away, trying to outrange you.");

			output("\n\n<i>“How clever");
			if (pc.race().indexOf("nyrea") != -1 ||
				(
					(pc.skinType == GLOBAL.SKIN_TYPE_CHITIN || pc.hasSkinFlag(GLOBAL.FLAG_CHITINOUS))
					&& pc.biggestTitSize() >= 3
					&& (pc.hasCock() && pc.isCrotchExposed() && pc.totalCocks(GLOBAL.TYPE_EQUINE) > 0)
				)
			) output(", nyrea");
			else if (pc.race().indexOf("myr") != -1 || pc.race().indexOf("zil") != -1) output(", myr");
			else if (pc.isGoo()) output(", droplet");
			output(",”</i> the alien sneers, covering the chip you made with its hand. It assumes a defensive posture and advances again with serpentine menace.");

			//go to fight
			//begin fight with 11 points of damage on enemy shield if armed, else 3 if unarmed (wibble the numbers with RNG if you feel like it)
			output("\n\n<b>It’s a fight!</b>");
		}
		else
		{
			output("\n\nThough you try, you can’t detect the predator before it’s on you. A stripe of lichen rears up, revealing a ganrael ambusher! It grabs and you raise your [pc.meleeWeapon], trying to intercept it.");

			if ((pc.reflexes() + rand(30) + 1) / 2 > tEnemy.reflexes())
			{
				output(" Your blow lands dead center, sending the ganrael’s charge off-course. It recovers in a rolling slither of loops while spitting what you imagine are curses.");
				if (pc.hasMeleeWeapon()) tEnemy.shieldsRaw -= 17;
				else tEnemy.shieldsRaw -= 6;
			}
			else
			{
				output(" Your slow strike glances harmlessly to the side as the ganrael barrels into you, coiling and holding you with spindly, jointed legs.");
				pc.createStatusEffect("Grappled", 3); // 9999
			}

			output("\n\n<i>“You’re a feisty ");
			if (pc.race().indexOf("nyrea") != -1) output("nyrea");
			else if (pc.race().indexOf("myr") != -1 || pc.race().indexOf("zil") != -1) output("myr");
			else if (pc.isGoo()) output("droplet");
			else output("one");
			output(",”</i> it hisses. <i>“I don’t like feisty.”</i>");

			output("\n\n<b>It’s a fight!</b>");
		}
	}

	flags["CRYSTALGOO_T1_ENCOUNTERS"]++;

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(pcDefeatsCrystalGooToo);
	CombatManager.lossScene(crystalGooPCLoss);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.displayLocation("CRYSTAL GOO");

	showCrystalGooToo();
	showBust("CRYSTAL_GOO_T1_" + tEnemy.skinTone.toUpperCase());
	showName("\nAMBUSH!");

	clearMenu();
	addButton(0, "Next", CombatManager.beginCombat);
}

public function crystalGooEncounterType2():void
{
	var tEnemy:Creature = new CrystalGooT2();

	//encounter intro
	//no (intentional) ambush; ganrael is open, martially proud, and aggressive (physically and sexually)
	//when choosing a color for the NPC, green is most common, blue next, then yellow, then pink - finally, red should be exceedingly rare (1%)

	//first time for type 2
	if (flags["CRYSTALGOO_T2_ENCOUNTERS"] == undefined)
	{
		flags["CRYSTALGOO_T2_ENCOUNTERS"] = 0;
		output("\n\nA feminine figure stands in the center of this area, immobile, like a statue. Tiny glowing mushrooms lend it an unworldly air; you creep closer for an examination and the details come into relief.");
		
		output("\n\nThe piece’s beauty is remarkable. It’s suited in " +tEnemy.skinTone+ " armor shaped to resemble a nude woman. The chestplate is ornamented with two smooth breasts, at least C-cup, and circling to the rear reveals a toned back and shoulders above a depending plate molded like a tight, cute butt. Even the head, with its short, pointed ears and representation of cropped, wavy hair, is a masked helmet covering the true face underneath. Darker, glossier "+tEnemy.skinTone+", perhaps representing the model’s skin, is visible on the few unarmored areas like the groin.");
		if (CodexManager.entryUnlocked("Nyrea")) output(" It very much resembles an idealized version of the nyrea who call these caves home.");
		
		output("\n\nThe poor thing looks like a victim of a horrible attack; crude picks and needles protrude from gaps in its armor. Perhaps it honors some ill-fated messenger who brought warning to her people despite terrible wounds. The stone is clean and unweathered by age; whoever put it here must have done so recently. The feet stand in the dirt rather than on a plinth, posing some question as to how it’s expected to stay upright.");
		
		output("\n\nYou’ve almost completed your somber tour when the statue turns its head and speaks. <i>“How do I look? Cute?”</i>");
		
		output("\n\nYou stagger backwards; the statue steps forward to maintain the distance, but stops when you raise a");
		if (pc.hasEquippedWeapon()) output(" weapon");
		else output(" fist");
		output(". <i>“");
		if (pc.race().indexOf("nyrea") != -1) output("Nyrea always want to fight...");
		else if (pc.race().indexOf("myr") != -1 || pc.race().indexOf("zil") != -1) output("Do you really want to fight so far from home, myr?");
		else if (pc.isGoo()) output("Are you trying to poach my territory? That’s not nice,");
		else output("Oh? We can fight if you like,");
		output("”</i> it sighs, in a feminine voice.");
		
		output("\n\nYour codex beeps out a warning too late: <i>“Ganrael detected. An amorphous, intelligent lifeform capable of hardening its outer skin into exoskeletal arms and armor. Available reports indicate that ganrael will attempt to harvest genetic material from individuals they encounter.”</i> On cue, the statue closes in!");
		CodexManager.unlockEntry("Ganrael");
		output("\n\n<b>It’s a fight!</b>");
		//go to fight
	}
	else
	{
		//repeat
		output("\n\nThe statuesque figure of a ganrael dominates the area’s ethos, her hand outstretched in a");
		var randSelect:int = rand(3);
		if (randSelect == 0) output(" striving, inspirational pose");
		else if (randSelect == 1) output(" seductive finger curl");
		else output(" stern, martial command");
		output(". Not apt to be fooled twice, you take a defensive stance. When she sees you prepared to attack, she speaks.");
		
		output("\n\n<i>“Are you sure you want to fight already");
		if (pc.race().indexOf("nyrea") != -1) output(", nyrea");
		else if (pc.race().indexOf("myr") != -1 || pc.race().indexOf("zil") != -1) output(", myr");
		else if (pc.isGoo()) output(", droplet");
		output("?”</i> she asks, in a singsong tone. <i>“If you want to stop and look for a bit, that’s fine. I like it when you look.”</i> She can’t be serious... can she?");
		
		output("\n\n<b>It’s a fight!</b>");
		//go to fight
	}

	flags["CRYSTALGOO_T2_ENCOUNTERS"]++;

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(pcDefeatsCrystalGooToo);
	CombatManager.lossScene(crystalGooPCLoss);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.displayLocation("CRYSTAL GOO");

	showCrystalGooToo();
	showBust("CRYSTAL_GOO_T2_" + tEnemy.skinTone.toUpperCase());
	showName("\nAMBUSH!");

	clearMenu();
	addButton(0, "Next", CombatManager.beginCombat);
}

public function showCrystalGooToo(wasFight:Boolean = false):void
{
	author("Zeikfried");
	if (enemy != null)
	{
		if (!enemy.hasStatusEffect("Unarmored"))
		{
			showBust(enemy.bustDisplay);
		}

		var nameStr:String = "";
		if (wasFight)
		{
			if (pc.HP() <= 0 || pc.lust() >= pc.lustMax()) nameStr = "DEFEAT:\n";
			else if (enemy.HP() <= 0 || enemy.lust() >= enemy.lustMax()) nameStr = "VICTORY:\n";
			else nameStr = "FIGHT:\n";

			if (enemy is CrystalGooT1) nameStr += "AMBUSHER";
			else nameStr += "DEADEYE";
		}
		else
		{
			if (enemy is CrystalGooT1) nameStr = "GANRAEL\nAMBUSHER";
			else nameStr = "GANRAEL\nDEADEYE";
		}
		showName(nameStr);
	}
	else
	{
		if (!wasFight) showName("CRYSTAL\nGOO");
		else showName("FIGHT:\nCRYSTAL GOO");
	}
}

public function pcDefeatsCrystalGooToo():void
{
	// Armor check (just in case!)
	if (enemy.shields() <= 0 && !enemy.hasStatusEffect("Unarmored")) 
	{
		enemy.createStatusEffect("Unarmored");
	}
	
	clearOutput();
	showCrystalGooToo(true);

	//if PC destroyed armor
	if (enemy.hasStatusEffect("Unarmored"))
	{
		//bust: ganrael blank

		output("The goopy, sexless alien inside the destroyed armor falls onto its butt with a ‘plop’, and holds up a chubby hand.");

		output("\n\n<i>“");
		if (enemy.HP() <= 0) output("No... that’s enough");
		else output("I’m horny");
		output(". I surrender,”</i> it says. It pulls a few shards from its surface, and the malleable plasm continues to stick out where it clung to the crystals. The little peaks don’t recede until it smooths them all in one wave, demonstrating just how sculptable its flesh is.");

		clearMenu();
		if (pc.lust() < 33)
		{
			output("\n\nYou’re not aroused enough to take advantage of the creature and its yielding body, though.");
			addDisabledButton(0, "F. Sculpt", "Sculpt the Goo", "Shape your lover into a big-breasted, wide-hipped sex bomb and fuck it.");
			addDisabledButton(1, "M. Sculpt", "Sculpt the Goo", "Shape your malleable lover into a big-dicked masculine stud and ride it.");
			addDisabledButton(2, "FormFuck", "Free Form Fucking", (pc.hasCock() ? "Let your dick do the sculpting." : "Ride the creature until it’s a green smear under your booty."));
			addDisabledButton(3, "Cuddlebug", "Cuddlebug", "");
		}
		else
		{
			output("\n\nThe ganrael quivers when you reach out a hand but doesn’t flinch, suggesting that it won’t resist being shaped however you like... and that it’s excited.");
			addButton(0, "F. Sculpt", crystalGooSculptingFem, undefined, "Sculpt the Goo", "Shape your lover into a big-breasted, wide-hipped sex bomb and fuck it.");
			addButton(1, "M. Sculpt", crystalGooSculptingMale, undefined, "Sculpt the Goo", "Shape your malleable lover into a big-dicked masculine stud and ride it.");
			addButton(2, "FormFuck", crystalGooFreeformFucks, undefined, "Free Form Fucking", (pc.hasCock() ? "Let your dick do the sculpting." : "Ride the creature until it’s a green smear under your booty."));
		}

		if (enemy is CrystalGooT1) addDisabledButton(3, "Cuddlebug", "Cuddlebug", "The ganrael can’t embrace you all over if you break off all its limbs.");
		else addDisabledButton(3, "Sounding", "Sounding", "The ganrael’s very slippery and unstable without its plating. This is not the time to ask for precision work.");
	}
	//PC didn’t destroy armor
	else
	{
		output("The ganrael pulls back,");
		if (enemy is CrystalGooT1) output(" scraping its trunk against itself in frustration.");
		else output(" rubbing her thighs together.");
		output(" One hand goes up to stay your advance.");

		output("\n\n");
		if (enemy.HP() <= 0 || enemy is CrystalGooT1) output("<i>“That’s enough... you win,”</i> the alien admits. <i>“Do what you like.”</i>");
		else output("<i>“Ugh... I’m horny. Can we just fuck?”</i> the alien asks.");

		if (pc.lust() < 33) output(" You’re not aroused enough to take the offer.");

		//display/hide sex buttons as befits lust, plus ‘Leave’ or w/e

		addDisabledButton(0, "F. Sculpt", "Sculpt the goo", "You’ll need to break the ganrael’s armor to modify its body shape.");
		addDisabledButton(1, "M. Sculpt", "Sculpt the goo", "You’ll need to break the ganrael’s armor to modify its body shape.");

		if (pc.lust() < 33)
		{
			addDisabledButton(2, "FormFuck", "Free Form Fucking", "Fuck the ganrael however you can, without worrying about the armor.");
			if (enemy is CrystalGooT1) addDisabledButton(3, "Cuddlebug", "Cuddlebug", "Wrap yourself in the ganrael’s embrace and let it enjoy your vulnerable body, or booty.");
			else addDisabledButton(3, "Sounding", "Sounding", "Employ this ganrael’s sculptor ‘talents’ to make a smooth, sturdy rod and tease your urethra with it.");
		}
		else
		{
			addButton(2, "FormFuck", crystalGooFreeformFucks, undefined, "Free Form Fucking", "Fuck the ganrael however you can, without worrying about the armor.");
			if (enemy is CrystalGooT1) addButton(3, "Cuddlebug", crystalGooCuddlebug, true, "Cuddlebug", "Wrap yourself in the ganrael’s embrace and let it enjoy your vulnerable body, or booty.");
			else
			{
				if (pc.hasCock() || pc.hasVagina()) addButton(3, "Sounding", crystalGooSounding, true, "Sounding", "Employ this ganrael’s sculptor ‘talents’ to make a smooth, sturdy rod and tease your urethra with it.");
				else addDisabledButton(3, "Sounding", "Sounding", "You should probably locate your urethra before asking your partner to stick anything in it.");
			}
		}
	}

	addButton(14, "Leave", crystalGooLeaveAfterWin);
}

private function addCrystalGooBallLoot():void
{
	if (enemy.hasStatusEffect("Unarmored") && rand(5) <= 1)
	{	
		switch (enemy.skinTone)
		{
			case "green": enemy.inventory.push(new GooBallGreen()); break;
			case "blue": enemy.inventory.push(new GooBallBlue()); break;
			case "yellow": enemy.inventory.push(new GooBallYellow()); break;
			case "pink": enemy.inventory.push(new GooBallPink()); break;
			case "red": enemy.inventory.push(new GooBallRed()); break;
			case "purple": enemy.inventory.push(new GooBallPurple()); break;
			case "orange": enemy.inventory.push(new GooBallOrange()); break;
			default: break;
		}
	}
}

public function crystalGooLeaveAfterWin():void
{
	clearOutput();
	showCrystalGooToo();
	
	output("You give the ganrael’s offer a momentary thought, but ultimately opt to leave.");
	output("\n\n");
	
	addCrystalGooBallLoot();
	
	clearMenu();
	if(!enemy.hasStatusEffect("Unarmored") && hasGooArmorOnSelf() && !hasGooArmorUpgrade("ganrael")) addButton(0,"Next",armorGooVictoryShits);
	else CombatManager.genericVictory();
}

public function crystalGooSculptingMale():void
{
	clearOutput();
	showCrystalGooToo();
	showBust("CRYSTAL_GOO_" + enemy.skinTone.toUpperCase() + "_BRO");

	var holeIdx:int = -1;
	if (pc.hasVagina())
	{
		holeIdx = pc.cuntThatFits(enemy.biggestCockVolume());
		if (holeIdx == -1) holeIdx = pc.biggestVaginaIndex();
	}

	output("The featureless alien looks up from the floor, waiting for you to make a move. You unfasten your [pc.gear], wondering how to do it.");

	output("\n\n");
	if (pc.isBimbo()) output("<i>“So, um, do you not have, like... a big cock hidden anywhere?”</i> you stammer at the goopy blank.");
	else if (pc.isBro()) output("<i>“You got, like, no tone, bro,”</i> you point out, pitying the squishy thing.");
	else if (pc.isNice()) output("<i>“So... how do you have sex like that?”</i> you inquire.");
	else if (pc.isMischievous()) output("<i>“You remind me of an off-brand action figure,”</i> you say.");
	else output("<i>“You look like a scalded child. Completely unappealing,”</i> you dismiss.");
	
	output("\n\nThe alien spreads its arms");
	if (!pc.isNude()) output(" when you slip out of your last garment");
	output(". <i>“What should I be, instead?”</i> it asks. <i>“Show me.”</i>");
	
	output("\n\nYou make a wry note of the invitation and cozy up, feeling the mild warmth of the creature. <i>“Well...”</i> you begin.");
	
	output("\n\nThe ganrael leans into an intimate, confidential posture, eager to be taken advantage of. Its skin is slick and slightly bubbly; it clings to yours. The alien clasps your hand, then raises it to its face. Picturing a masculine form, you start to shape. You give the ganrael an angular, strong jawline, with a defined nose and slight cheekbones. With a pinch for each, you shape two thin lips. The creature smiles, and you realize it’s smiling <i>back</i>; you’re enjoying it like a new toy. With your thumbs, you press its forehead into a powerful brow, and form two eyes below. You add the ears along the same level and study the face.");
	
	output("\n\n<i>“Good?”</i> the alien asks, subtly shifting out the irregularities from your freehand. You think, then lower its eyelids just a shade. It doesn’t hesitate to turn its new bedroom eyes on you and send a flutter through your stomach - you give it a quick kiss on its neck to tamp down your desire, and it shivers.");
	
	output("\n\nYou move to the narrow shoulders next, pulling them much wider. A bicep improves each arm, and the ganrael’s hands look better when you broaden them. Now the chest looks silly, dwindling away below its rugged shoulders, so you spread it to match, tracing the curves of pectoral muscles to give it tone. The flesh trembles under your touch, and watching your partner enjoy your body play sets off a sympathetic shudder in you. The canny alien takes your shoulders and pulls you close, pressing its broad chest into your");
	if (pc.biggestTitSize() < 1) output("s");
	else output(" [pc.breasts]");
	output(". Surprised but feeling safe, you relax. It caresses your [pc.skinFurScales] and without meaning to, you begin to think of the ganrael not as an ‘it’, but as a ‘he’.");
	
	output("\n\n<i>“Keep going,”</i> the new manrael encourages. Still held close, your hands creep to his stomach. He hums happily as you trace the bumps of abdominal muscle, and releases you when you tell him that you’re ready to do his lower half.");
	
	output("\n\nYou give him a great butt, holding your hands stiffly in position. The alien intuitively takes the hint, keeping it firm when you pull away. Your blood is starting to race now; you’re so eager to jump him that it’s frustrating there’s nothing to jump yet. You make a hasty decision to hurry everything else, just so you can get to sculpting <i>that</i>. The ganrael’s legs and feet take shape beneath your blurred hands - he teases you a bit, pretending to have burns from your speed, but you’re finished soon and staring a hole in his crotch.");
	
	output("\n\n<i>“Fun part now?”</i> he guesses. Without thinking, you moisten your lips and extend your hand.");
	
	output("\n\nThe ganrael man shivers and spreads, offering you the canvas. You dive in, burning with lust and intent. His plasm slops through your overeager fingers, which squeeze haphazardly as you pull out the material you intend to use. Though the delay pains, you take care to roll the flesh into a perfect ten-inch tube, thickening and squeezing until he understands you want it stiff. Using one finger, you poke a slit and tickle a little collar into being below the crown, then tilt the head to the perfect angle. The alien shows every sign of relish as you create his sex, and faint shadows congregate in the semi-opaque flesh. His pleasure grows as more arrive; he’s literally shifting his erogenous zones to his new prick. You envy his ability, but mostly you just stare at the rod, hungry. One thing’s missing, though. Below your masterpiece, you pull out a handful of plasm and cup it until his new manhood has a pair of luscious balls.");
	
	if (pc.hasCock() && pc.biggestCockLength() < 10)
	{
		output("\n\nThe ganrael seems happy, but keeps glancing at your modest endowment. After a moment of consideration, his tool shrinks in your hand until it matches yours. <i>“Big is good, but I like this size best,”</i> the alien says, stroking your prick with the back of his fingers. You blush at the compliment, and your [pc.cocks] swell");
		if (pc.cocks.length > 1) output("s");
		output(".");
	}

	if (pc.hasCock())
	{
		output("\n\nYour lover’s hand migrates down as you feel him up, working its way to your ass. He pushes gently, trying to get you to scoot closer, so you oblige him until your erect prick is pointed at him like a mirror image. The ganrael’s legs entwine with your");
		if (pc.isBiped() && pc.legCount > 1) output("s");
		else output(" [pc.legOrLegs]");
		output(", bringing you together. Your [pc.cocks] contact");
		if (pc.cocks.length == 1) output("s");
		output(" the slippery, alien tool with a shudder, and the ganrael begins to rock back and forth, rubbing against it.");
		if (pc.cocks.length > 1) output("Bubbles of precum form at your tips and then break");
		else output(" A bubble of precum forms at your tip and then breaks");
		output(", drooling down the [pc.cockHeads]. Your lover touches it with his finger, then shakes with excitement and recognition, frotting faster and faster. You groan and pull away, not really wanting to but knowing that if you don’t, you’ll blow your load before you can take his perfect cock inside. He looks downcast, but cheers up soon enough.");
	
	}

	output("\n\nEagerly, you untangle yourself and move over him, lining your");
	if (holeIdx == -1) output(" [pc.asshole]");
	else output(" [pc.vagina "+holeIdx+"]");
	output(" up with his spongy tip. Your ganrael pumps his pelvis slightly, tickling your");
	if (pc.hasVagina()) output(" labia");
	else output(" pucker");
	output(" with his crown, and you both quiver from the contact. Sweltering with desire, you can’t hold back any longer. Your hips drop and capture his cock, then slowly glide down the slick tool until he’s hilted inside you.");
	if (pc.hasVagina())
	{
		pc.cuntChange(holeIdx, enemy.biggestCockVolume(), true, false);
	}
	else
	{
		pc.buttChange(enemy.biggestCockVolume(), true, false);
	}
	output(" He wraps his arms around you again, pulling you close enough to stare into his eyes while you make love.");
	
	output("\n\nYou roll once, savoring the feeling of the permanently-lubricated penis stroking the walls of your");
	if (holeIdx == -1) output(" [pc.asshole]");
	else output(" [pc.vaginaNoun "+holeIdx+"]");
	output(", then your patience is gone. The ganrael braces and you start to ride like a demon, cranking your ass high on his prick and slapping down hard enough that his balls are splattered with lube. He pumps too, cheating by spreading his flexible body against the ground to get extra distance before slamming his cock home, sending force rippling through your [pc.ass]. His once-perfect face looks frantic; his eyes are screwed up with pleasure and the thin mouth gasps and kisses your neck");
	if (pc.biggestTitSize() >= 1) output(" and breasts");
	output(" greedily, sucking at your [pc.skinFurScales]. Your mad fuck-lust infects him, and the devil starts to swell his cock inside you, growing thicker in a bid to smear more of his erogenous zones against your insides on each pass. In a fog of fifteen-minutes-to-fuck, you race him to climax and win.");
	
	output("\n\nYour [pc.vagOrAss "+holeIdx+"] shudders, battering and deforming the tool with fierce contractions");
	if (pc.hasCock())
	{
		output(" while your stiff prick");
		if (pc.cocks.length > 1) output("s unload");
		else output(" unloads");
		output(" a");
		if (pc.cumQ() < 250) output(" sprinkle");
		else output(" surge");
		output(" of slop that makes your lover shiver in ecstasy.");
		if (pc.cumQ() >= 1000) output(" You cum hard, pumping out [pc.cumVisc] [pc.cumNoun] in a heady attempt to get jizz everywhere, but his absorbent skin gloms every drop of sperm until your [pc.cumColor] adulterates his body.");
	}
	else if (pc.hasVagina()) output(" while squirting [pc.girlCum] through the sloppy seal, diluting his crotch with your own color.");
	output("The ganrael keeps pumping, agonizing your climax with waves of pleasure and pulling out such a calamitously long orgasm that you worry you won’t get to breathe before you pass out. A reprieve finally comes when he shivers all over and collapses, melting against you. His cock spasms and then decoheres, spreading through your insides.");

	//big male cum
	if (pc.cumQ() >= 2500)
	{
		output("\n\n<i>“Oh... o-oh...”</i> your lover stutters. <i>“Something’s happening....”</i>");
		
		output("\n\nHis chest quivers under the pile of [pc.cumNoun] you left, slurping the sperm down into its depths. Your ganrael pushes at your hips urgently and you find the strength to slip off of him, wincing when his expanded dong drags out. He rolls over onto his hands and knees, trembling as your massive load filters through every part of him and swells his limbs with new fluid. With a mad tremor, his body bulges and begins to fray, peeling apart at the fingers and toes. His new arms wrap themselves around his chest for leverage and a second body pulls away, briefly resembling a lewd picture of two lovers before the newcomer’s crotch separates from the original’s ass with a final tug. The new body - your offspring - relaxes its grip and falls off as the first collapses.");
		
		output("\n\n<i>“Never done...”</i> your ganrael gasps, <i>“...never happened so fast before.”</i> He reaches a hand out to you and laces his goopy fingers with yours. <i>“Amazing.”</i>");
		
		output("\n\nThe other reaches as well, petting at your swollen, aftershocking [pc.cocksNounSimple]. You pull back quickly before your naive child can touch it; it changes focus to the sculpted rod on your alien lover instead. You collect your things while watching, feeling strange urges that encourage you to hurry.");
	}
	else
	{
		output("\n\nIt takes him a minute to recover from his jellifying - he apologizes and regains the masculine ideal while his cock surges in reverse inside you, scraping your ridges as it slides out. You pet his chest, too tired to");
		if (!pc.isAss()) output(" pretend to");
		output(" punish him for something you secretly enjoyed. He holds you until you decide to get up; when you leave, he continues to recline, enjoying your genetic material.");
	}
	output("\n\n");
	//end, time, lust, rewards

	processTime(20+rand(10));
	pc.orgasm();

	addCrystalGooBallLoot();
	
	clearMenu();
	CombatManager.genericVictory();
}

public function crystalGooSculptingFem():void
{
	clearOutput();
	showCrystalGooToo();
	showBust("CRYSTAL_GOO_" + enemy.skinTone.toUpperCase() + "_BIMBO");

	output("You address the vulnerable creature.");
	if (pc.isBimbo() || pc.isBro()) output(" <i>“So, like... can you hold any other shape?”</i>");
	else if (pc.isNice()) output(" <i>“Are you prepared for this? You look too fragile.”</i>");
	else if (pc.isMischievous()) output(" <i>“I always loved playing with modeling clay. My penis-shaped ashtray collection was huge.”</i>");
	else output(" <i>“You look like a child. Take some other form.”</i>");
	
	output("\n\nIts featureless face turns toward you. <i>“Whatever you like,");
	if (pc.race().indexOf("nyrea") != -1 ||
		(
			(pc.skinType == GLOBAL.SKIN_TYPE_CHITIN || pc.hasSkinFlag(GLOBAL.FLAG_CHITINOUS))
			&& pc.biggestTitSize() >= 3
			&& (pc.hasCock() && pc.isCrotchExposed() && pc.totalCocks(GLOBAL.TYPE_EQUINE) > 0)
		)
	) output(" nyrea");
	else if (pc.race().indexOf("myr") != -1 || pc.race().indexOf("zil") != -1) output(" myr");
	else if (pc.isGoo()) output(" droplet");
	else output(" strange one");
	output(",”</i> its voice resonates. It holds its arms apart, displaying its body. <i>“Show me what arouses you.”</i>");
	
	output("\n\nThat’s exactly what you wanted to hear. You fix the lover you want in your mind while you strip and set your [pc.gear] aside. The alien’s waif chic is leagues away from the wide-hipped, boob-dacious sexpot of your dreams, but when you place your naked palm on its body, it leans in. Warm plasm shifts under your fingers, waiting for you to share your muse.");
	
	output("\n\nYou cozy up until you can feel its mild body heat. Its mannequin face is the farthest from your ideal. Eyes closed, you kiss the alien deeply, feeling it quiver, then pull away with a fierce love bite. Another kiss, and another bite. The marks settle into a pair of full, plump lips - you nudge them into shape with your finger, glad the creature understood your cues, and it smiles. Like a creeping dawn, the full potential your obedient lover warms you to your work. You push at its face with your thumbs, giving it a pair of cheekbones, then a cute nose, two large, expressive eyes, and sleek ears.");
	
	output("\n\n<i>“Is this what you like?”</i> the creature asks sweetly, smoothing and unifying its hand-hewn features.");
	
	output("\n\nNo, not yet. You bury your hands into the ganrael’s scalp and pull. Using your fingers as both comb and brush, you tease its bare head, picturing a voluminous set of curls that would look at home in any JoyCo cosmetics");
	output(" commercial. The ganrael shivers and touches its lips as you produce strand after strand of slippery coiffure, enjoying the creative act as much as you are. When you finish, the creature’s head is crowned with a goopy drape of luxurious hair.");
	
	output("\n\nYou admire your efforts, then look lower. The alien’s neckline is a bit masculine, so you push its shoulders down, then pinch two thick ridges to give it elegant collarbones. Its neck vibrates under your touch - the creature is humming and you realize that you were too, engrossed in your erotic work.");
	
	output("\n\nThe next act gives you an anticipatory tingle. Cupping your palms to the creature’s chest, you issue the order: <i>“Fill.”</i>");
	
	output("\n\nThe ganrael giggles, then thrusts its chest forward and begins to concentrate. The gooey skin burgeons and expands, filling the cups. You move your hands, and the ganrael understands - it fills the cups again while you continue raising the bar, wondering when you should stop. It swells past C-cup, then D-cup, DD... E... F....");

	output("\n\nThe creature’s growth slows between G- and H-cup, and you can see its chubby legs and arms thinning as it runs out of easy flesh to retrieve");
	if (pc.isMischievous()) output(". You consider continuing until it’s just a head and a pair of giant tits, but");
	else output(", so you");
	output(" let it rest, satisfied with its enthusiasm. It definitely doesn’t look like a mannequin anymore, with its pornstar rack and dick-sucking lips. You mentally rechristen it a ‘she’.");
	
	output("\n\n<i>“Oh, my,”</i> the new ganrael girl sighs, swaying her chest and watching the massive breasts swing. <i>“So you like this? You like big?”</i>");
	
	output("\n\nYour blood stirs from the gorgeous globes jiggling in your face, but you merely grasp a breast and kiss it deeply. You nip at the flesh with your teeth, pulling it just enough to make a little point, then trace the ganrael’s new nipple with your tongue. She shudders and sighs, wrapping her arms around you to bring the other breast close for its turn.");
	
	output("\n\nYou’re so cranked up by this point that");
	if (pc.hasCock())
	{
		output(" [pc.eachCock] could hold up a shipping container by");
		if (pc.cocks.length == 1) output(" itself,");
		else output(" themselves,");
	}
	else output(" your [pc.vagOrAss] could win a floriculture ribbon for ‘Best Bloom’,");
	output(" and you move on from the breasts of your dreams before you blow your wad. The ganrael slumps when your lips depart, but smiles again when your hands press on her sides, parenthesizing her midsection into a curvy waist and then punctuating it with one finger for a belly button. She giggles.");
	
	output("\n\n<i>“It’s cute, but what does it do?”</i> the gooey girl asks, exploring her new navel.");
	
	output("\n\nIn a sweat to pluck the fruit of your labors, you lump her plasm into a bootylicious, heart-shaped ass, caressing the perfect half-spheres, then pull them into a pair of wide hips and funnel down juicy thighs and sculpted calves. You take a bit more care on her feet, giving her a set of cute toes, but she doesn’t have the fine control for them - they maintain their outlines but gloop and stick back together. It doesn’t matter. You’ve already moved on to sex in your head, and your body rises automatically into position. The ganrael shudders in anticipation.");
	
	output("\n\n<i>“All done playing?”</i> she guesses.");

	//cock ending - probably preferred where eligible
	if (pc.hasCock())
	{
		var cockIdx:int = pc.biggestCockIndex();
		output("\n\nYou grunt like a beast and fall upon the girl, sliding a hand up her thigh to her crotch. The ganrael squirms and moves her own to cover it, squeezing her knees together. Your middle finger begins to rub out a furrow; her hand strokes yours, and her arm pushes her breasts against your cheek when it does. Happy with the labia you’ve made, you press in on the center of her putative pussy, poking deep. Your other hand strokes [pc.oneCock], and the ganrael notices. She shivers hard, and the flesh around your finger recedes as she shifts to fit your [pc.cock "+cockIdx+"].");
		
		output("\n\n<i>“Are you going to cum inside now?”</i> she asks, lying back and opening her thighs. Her goopy hair flows along the ground until her face is framed by a rippled bay of "+enemy.skinTone+" waves. <i>“I love it when you cum inside.”</i>");
		
		output("\n\nLust to take your lover burns in you. Her pussy swallows your [pc.cockNoun] like a lubricated onahole, and she bites her new bottom lip while you bury yourself to the hilt. She doesn’t utter a cross word when you skip ramping up, hooking her goopy hands under her knees and spreading wide for your furious pounding. Her whole fluid form ripples with your influence; little ridges travel her surface with every thrust, colliding and dissipating.");
		
		output("\n\nYou can barely endure the hot, form-fitting sleeve that wraps around your penis... your foreplay was too effective. Tamping it down with force of will is all you can do to enjoy the female ideal as long as possible. The effort is so titanic and so doomed - you’re already orgasming but holding the cum inside with your pelvic muscles, and the ganrael senses it by your awkward movement. She folds her goopy legs around your back with a sly smile. They wouldn’t be solid enough to stop you sober, but now, battling climax, you can’t escape. She stares at you innocently, as if not conscious of her trick, and your orgasm slips free.");

	//big cum only
		if (pc.cumQ() >= 2500)
		{
			output("\n\nThe slip turns into a surge as your");
			// {(PC not weeaboo race)massively modified }
			output(" body pushes out a spectacular load of [pc.cumNoun]. The ganrael’s legs slacken when the first wave sloshes in. Her hourglass waist bulges with lumps of spooge and your messy ejaculation flogs her make-do pussy out of shape; not a drop spills back out because she’s so drunk on your sauce that she’s given up all control of her form. Her made-to-order breasts spread apart as the cum forces further up her torso, and continue to migrate until the last stroke of sperm exits your gawping cock.");
			
			output("\n\n<i>“Oooohh... so much...”</i> she moans. <i>“Ooh, nooo, it’s happening already!”</i> Her distended stomach begins to churn, spreading [pc.cum]. You pull your [pc.cockNounSimple "+cockIdx+"] free, shivering from the new movement inside her body. The ganrael’s color mingles with your seed’s, and her stomach smushes flat, sending chubby waves down every limb. Her body swells double and then stretches upwards, like the top half is trying to sit up while the bottom wants to lie flat. She groans as a furrow forms and her front pulls away into a second body that climbs out of the first, a busty beauty exiting a bimbo-shaped bathtub. The new body rolls off, making a full tumble to lie spread eagle as well.");
			
			output("\n\n<i>“Ssso intense...”</i> the original body slurs. <i>“So much seed... already made....”</i> The new body - your offspring with her? - took not only her cum-stained color but also her face and breasts with it when it split off, leaving her once-again blank aspect framed by luxurious curls. She sits up on her leftover bubble butt, holds her goopy knees, and sighs. <i>“You’re... you’re just great. That’s neverr... happened to me before.”</i> The new offspring begins to explore the globes its mother gifted it, pressing its beautiful breasts under its hands and arousing very strange feelings in you.");
			
			output("\n\n<i>“I’ll remember you,”</i> your lover says, when you shake off and begin to collect your things. Both the ganrael and her daughter are contaminated all over with your shade of [pc.cumColor] and caressing themselves, intoxicated by you. It’s difficult to leave, but you tear yourself away.");
		}
		//else not big cum
		else
		{
			output("\n\n");
			if (pc.cumQ() <= 250) output("The ganrael shudders as scant few beads of [pc.cum] touch her plasm. Her stomach spasms, smearing the clean [pc.cumColor] droplets into blurry messes to better mingle them with her body.");
			else output("[pc.Cum] lances from your cock, disfiguring the ganrael’s perfect midriff with slashes of [pc.cumVisc] [pc.cumColor] slop. The girl shakes with tremors from the foreign genetic material, grasping her stomach with both hands so hard that her fingers sink in. A long, rolling sigh of delirium percolates all over, vibrating the goopy flesh on its way out.");
			
			output("\n\n<i>“Even better than I hoped,”</i> she slurs, tracing a line on her stomach to wick cum through her body. <i>“");
			if (pc.race().indexOf("nyrea") != -1) output("You’re so much better than the other nyrea...");
			else if (pc.race().indexOf("myr") != -1 || pc.race().indexOf("zil") != -1) output("Imagine finding a myr like you down here...");
			else if (pc.isGoo()) output("I’ve never felt this way about my own kind before...");
			else output("I don’t know what you are, but...");
			output(" I could drink you up all day.”</i>");
			
			output("\n\nHer velvety hands slide up your chest but you pull away before she can wrap herself around any tighter, easily breaking her leg-lock now. She continues to reach until you pull free of her clingy, semen-smeared cunt, and then gives up and flops over, completely lushed on your jizz.");
		}
	}
	else if (pc.hasVagina())
	{
		output("\n\nYou shiver. The girl reclines, and you part her thighs violently");
		if (pc.hasLegs()) output(". Spreading your own legs, you");
		else output(", then");
		output(" press your [pc.vaginas] against her. With each roll of your hips, her warmth parts and flows, building furrows around your labia that cling and caress. You ride her for minutes,");
		if (pc.hasLegs()) output(" legs laced together and");
		output(" getting hotter and hotter, before you notice what she’s doing. Her crotch is shifting with every pass into a coarse-grained copy of your own. The flattery inspires you to rub harder.");
		
		output("\n\nHer puss");
		if (pc.vaginas.length == 1) output("y");
		else output("ies");
		output(" quake under your punishing tribadism, always springing back for the next push. The slippery lips slide perfectly though yours, tickling your clit");
		if (pc.totalClits() > 1) output("s");
		output(" on each pass while your own labia drag against the alien’s nub. Your orgasm dangles just beyond your grasp. The maddening pleasure spurs you on; you chafe so hard that her hips deform, growing wider and moving further up her torso as you literally grind on her. Before you can scissor her in half, you cum.");
		
		output("\n\n");
		if (!pc.isSquirter() || pc.girlCumQ() <= 100)
		{
			output("[pc.EachVagina] spasms and sucks at her labia, shivering your lower back into a tense clench. You’re helpless in the grip of orgasm, but the inexperienced ganrael continues to rub, tickling your achingly sensitive clit");
			if (pc.totalClits() > 1) output("s");
			output(" with her slippery, soft lips. Your eyes roll as your pleasure is boosted to the next level by the callow alien.");
		}
		else
		{
			output("[pc.EachVagina] gushes like a broken dam, flooding its mirror with your [pc.girlCumNoun]. The ganrael shakes with pleasure as her crotch becomes a soup of mingled fluids and the ground a sodden swamp.");
		}
		output(" When your back finally unlocks, you pull away from the greedy ganrael.");
		
		output("\n\n<i>“That was fun,”</i> she sings out, lowering a hand to frig her new cunt. <i>“We should play this game again.”</i> Watching the ideal woman play with her slick pussy is stirring tempting urges. You turn away and gather your things before you lose any more time here, but pocket her suggestion for later.");
	}
	else
	{
		output("\n\nYou smile. The girl tilts her head curiously.");
		
		output("\n\n<i>“");
		if (pc.isNice()) output("Could you make one of these?");
		else output("Make one of these,");
		output("<i>“ you beckon, pointing to your mouth. She leans in, and you");
		if (!pc.hasLongTongue()) output(" stick out your tongue.");
		else output(" uncurl your long tongue.");
		
		output("\n\nThe ganrael obeys, dribbling goo between her lips until she has a [pc.tongue] of her own, accurate in every detail");
		if (pc.skinTone != enemy.skinTone) output(" but color");
		output(". She");
		if (!pc.hasLongTongue()) output(" waggles it");
		else output(" curls it in an obscene, rolling wave");
		output(" while she waits for your next instruction. Your pulse hammers at your temples, and your [pc.asshole] screams for her stimulation.");
		
		output("\n\nYou turn around,");
		if (pc.isTaur()) output(" backing your pucker toward her.");
		else output(" spreading your anus wide with your fingers.");
		output(" The girl’s hands press to your [pc.ass] and she dives in without hesitation; the big, jiggly breasts you made together squish against your [pc.thighs] when she buries her face in your pucker like she’s trying to squeeze inside.");
		if (pc.ass.looseness() >= 3) output(" She almost does it, so stretched-out is your backdoor - you can feel the girl’s face contort on the edge of your ring as her tongue slides up your rectum.");
		else output(" Picturing it gives you a giddy thrill - you fantasize about loosening your asshole enough to smuggle her off-planet and keep her as a lover.");
		
		output("\n\nThe foreplay did its job too well; you’re almost ready to cum, and she just started licking. Her tongue spirals inside you, abandoning its shape to scrape and stick to your nerves as she collects the genetic material she wants from your well-lubed hole.");
		
		output("\n\nWith");
		if (pc.hasLegs()) output(" buckling knees");
		else output(" a quivering collapse");
		output(", you orgasm, shoving your ass into the girl’s face and wringing her tongue. She waits patiently, rippling and rolling her plasm while your body unkinks, until your climax fades. Panting, you slump over, dragging her stretchy extension with you. She yanks it back into her mouth like a chameleon.");
		
		output("\n\n<i>“You’re a fun");
		if (pc.race().indexOf("nyrea") != -1) output(" nyrea");
		else if (pc.race().indexOf("myr") != -1 || pc.race().indexOf("zil") != -1) output(" myr");
		else if (pc.isGoo()) output(" droplet");
		else output(" stranger");
		output(",”</i> says the ganrael, leaning down and finally kissing you back. <i>“Bye now.”</i>");
	}
	output("\n\n");

	processTime(30+rand(10));
	pc.orgasm();
	
	addCrystalGooBallLoot();
	
	clearMenu();
	CombatManager.genericVictory();
}

public function crystalGooFreeformFucks():void
{
	clearOutput();
	showCrystalGooToo();
	showBust("CRYSTAL_GOO_" + enemy.skinTone.toUpperCase());

	// enclosing this here so that I can use a short name...
	var cgender:Function = function(a:String, b:String):String {
		if (enemy is CrystalGooT2 && !enemy.hasStatusEffect("Unarmored")) return a;
		else return b;
	}

	var carmor:Function = function():String {
		if (enemy.hasStatusEffect("Unarmored")) return "soft";
		else return "hard";
	}

	output("Just fucking the easy creature");
	if (!enemy.hasStatusEffect("Unarmored")) output(" concealed in the sexualized armor");
	output(" is all you’re interested in right now. You strip off,");
	if (!(pc.lowerUndergarment is EmptySlot)) output(" lowering your [pc.lowerUndergarment] with relish and");
	output(" setting your gear aside. The ganrael");
	if (enemy.hasStatusEffect("Unarmored") || enemy is CrystalGooT1) output(" reclines as it watches, trying not to show its very visible excitement.");
	else output(" watches you strip and then, when your attention returns, places her hands atop her knees and pushes her thighs apart in a pose that displays her sculpted breasts and stomach.");
	
	output("\n\n");
	if (enemy.hasStatusEffect("Unarmored")) output("<i>“Does that mean you’re going to cum for me?”</i> it asks. <i>“I mean, would you like to? I’m yours to use.”</i>");
	else if (enemy is CrystalGooT1) output("<i>“Well then,”</i> it says, spreading its legs to expose its underside, <i>“I’m at your discretion.”</i>");
	else
	{
		output("<i>“" + pc.mf("Handsome", "Cute"));
		if (pc.race().indexOf("nyrea") != -1) output(" nyrea");
		else if (pc.race().indexOf("myr") != -1 || pc.race().indexOf("zil") != -1) output(" myr");
		else if (pc.isGoo()) output(" droplets");
		else output(" strangers");
		output(" like you always want to cum </i>aallll<i> over me,”</i> she says, emphasizing the ‘all’ with a gesture that sweeps from her out-thrust chest to her groin. <i>“I get so dirty, but... I don’t mind.”</i>");
	}
	
	output("\n\nBlood rushes to your crotch; the alien placing "+ cgender("her", "it") +"self willingly in your power stirs your arousal in the most basal way. "+cgender("She", "It") +" titters as your");
	if (pc.hasCock())
	{
		output(" [pc.cocksLight] stiffen");
		if (pc.cocks.length > 1) output("s");
		output(" and a dribble of precum emerges.");
	}
	else if (pc.hasVagina()) 
	{
		output(" [pc.vaginas] flush");
		if(!pc.hasVaginas()) output("es");
		output(" with color, becoming puffy and sticky with lubrication.");
	}
	else output(" empty groin comes into sharp relief.");
	
	output("\n\n<i>“Is that a sign?”</i> "+cgender("she", "it") +" inquires. Unwilling to endure more pillow talk, you fall on the alien. "+ cgender("She", "It") +" doesn’t resist when your clutching hands lock onto "+ cgender("her", "its") +" hips.");

	//cocks
	if (pc.hasCock())
	{
		var cockIdx:int = pc.biggestCockIndex();
		var multiCock:Boolean = (enemy.hasStatusEffect("Unarmored") && pc.cocks.length > 1);

		output("\n\nYour crotch collides with the ganrael’s, trying to force your [pc.multiCocks] inside.");
		if (enemy.hasStatusEffect("Unarmored"))
		{
			output(" The creature’s flesh offers no resistance, and you spear it on your [pc.cocksLight], [pc.eachCock] plowing its own custom cunt through the yielding plasm.");
			if (pc.cocks.length == 1) output(" Your horny, stiff dick finds a home");
			else if (pc.cocks.length == 2) output(" Both of your horny, stiff dicks find homes");
			else output(" All "+ num2Text(pc.cocks.length) +" of your horny, stiff dicks find homes")
			output(" in its body, streaming with precum as if the lube weren’t enough already.");
		}
		else
		{
			output(" Your [pc.cock "+cockIdx+"]");
			if (pc.cocks.length >= 3) output(", above all others,");
			output(" batters at the alien’s plating, knocking for admission. The shivering ganrael");
			if (enemy is CrystalGooT1) output(" uses its legs to force apart two plates in its trunk, making a [pc.cockNounSimple "+cockIdx+"]-sized gap just below its abdomen.");
			else output(" pries her depending crotch-plate up with her fingers, exposing herself to you.");
			output(cgender(" She", " It") +" parts the revealed plasm");
			if (enemy is CrystalGooT2) output(" with her fingers");
			output(", making a needy pussy bloom. It accepts your dick without complaint, warping to conform and suck like a mouth.");
		}
		
		output("\n\nYou start to hump; "+cgender("she", "it") +" wraps "+cgender("her", "its") +" arms around to keep you close.");
		if (!enemy.hasStatusEffect("Unarmored"))
		{
			if (enemy is CrystalGooT2) output(" Her knees");
			else output(" Its idle legs");
			output(" follow suit, clamping your [pc.hips] with such wanton lust that they hinder your return strokes.");
		}
		output(" On every stroke, the alien pulls you into "+cgender("her", "its") +" " + (multiCock ? "cunts" : "sex") + " with enough enthusiasm that you can coast on half power, concentrating on the wet, slimy puss" + (multiCock ? "ies" : "y") + " searching for every nerve. The ganrael’s cunt" + (multiCock ? "s each feel" : " feels") + " like the perfect onahole - molded to your exact dimensions, lubricated, and heated by the heavy breathing of a cum-starved");
		// has visited new texas
		if (flags["SEEN_TEXAS_SURFACE"] != undefined) output(" New Texas breeder");
		else output(" whore");
		output(" waiting for your load on the other end.");

		if (enemy.hasStatusEffect("Unarmored"))
		{
			output("\n\nThe arousal the alien inspires starts to take a toll. Your hammering thrusts pick up force from your impending orgasm, splattering its goopy flesh with blows of raw fuck-lust. There’s no need for it to migrate to its erogenous zones; waves travel up its body, compressing every single one.");
			if (pc.cocks[cockIdx].cLength() >= 36)
			{
				if(multiCock && pc.smallestCockLength() >= 36) output(" Your monstrous [pc.cocksNounSimple] bulldoze it with each plunge, and when you get so painfully hard and eager to cum that you lose all restraint, [pc.cockHead "+cockIdx+"]-shaped bulges appear in its shoulders and neck - the results of your engorged pricks penetrating its entire length.");
				else output(" Your monstrous [pc.cockNounSimple "+cockIdx+"] bulldozes it with each plunge, and when you get so painfully hard and eager to cum that you lose all restraint, [pc.cockHead "+cockIdx+"]-shaped bulges appear in its shoulders and neck - the results of your engorged prick penetrating its entire length.");
			}
			output(" The poor thing is being remade by your demented libido.");
		}
		else
		{
			output("\n\nThe slime-"+cgender("girl", "creature") +"’s pseudo-sex runs amok on your nerves, and "+ cgender("she", "it") +" shoves "+ cgender("her", "its") +" chest forward, all but begging you to touch "+ cgender("her", "its") +" sculpted breasts.");
			if (pc.isTaur()) output(" You raise a fore[pc.leg] and place your [pc.foot] between them, grinding the ganrael into the dirt with your weight.");
			else output(" You grant "+ cgender("her", "its") +" wish, squeezing the firm teardrops and feeling the ganrael push back.");
			output(cgender(" She", " It") +" shivers as the pressure translates to the erogenous zones underneath, and "+ cgender("her", "its") +" pussy shifts and tightens, returning the favor.");
		}
	}
	else if (pc.hasVagina())
	{
		output("\n\nYou push your [pc.vaginas] toward the ganrael; "+ cgender("she", "it") +" answers");
		if (!enemy.hasStatusEffect("Unarmored") && enemy is CrystalGooT1) output(" by raising its trunk to meet the swollen lips, rubbing them with its warm plates.");
		else output(" by raising a knee and rubbing your swollen labia playfully. You slap the knee away and the ganrael giggles, spreading "+ cgender("her", "its") +" legs to expose "+ cgender("her", "its") +" groin.");
		output(" The receptivity makes you hot to be touched, and you lower yourself, pressing on your [pc.vaginaBiggest] with its body.");
		if (enemy.hasStatusEffect("Unarmored") || enemy is CrystalGooT2) output(" Your lover leans back on "+ cgender("her", "its") +" elbows and "+ cgender("her", "its") +" legs wrap around you.");
		
		output("\n\nWithout a pause, you grind against the alien, smearing your labia and teasing your [pc.clit] free. "+ cgender("She", "It") +" pushes back, dragging");
		if (enemy.hasStatusEffect("Unarmored")) output(" slimy skin");
		else output(" firm ridges");
		output(" through your intimate folds, wicking [pc.girlCum] from your wet snatch to");
		if (enemy.hasStatusEffect("Unarmored"))
		{
			output(" mingle with its plasm. The flesh flows and sticks to you, infiltrating your blossom with the tendrils of slime your labia has kneaded up. With concerted effort, the ganrael shudders and pushes mass toward you, swamping your erect button");
			if (pc.totalClits() > 1) output("s");
			output(" in a tide of liquid tongues that caresses every side and leaves you howling for release.");
		}
		else
		{
			output(" lubricate the surface. Your lover’s covering is warmer than the air and not perfectly smooth - the little pores and bumps feel magnified one hundred times on your sensitive lips and exposed button. Coated with your [pc.girlCumFlavor], girlish juices, it’s like a rough tongue is licking your pussy on every stroke. The ganrael pushes into you, trying to heighten your pleasure for a quicker, deeper climax.");
			if (enemy is CrystalGooT1) output(" Its trunk even curls up, supporting your [pc.butt], allowing you to put more force into your hips. When you take advantage, several legs curl around your chest.");
		}
	}
	else
	{
		//anal trib
		output("\n\nYou push your [pc.ass] toward the confused ganrael, who nonetheless reaches out a hand to explore. "+ cgender("Her", "Its") +" fingers contact your inflamed [pc.skin] and that’s all you need; you look over your shoulder and back into "+ cgender("her", "it") +", spreading your cheeks and revealing your");
		if (pc.ass.wetness() >= 2) output(" wet,");
		output(" aroused pucker. You can only imagine the ganrael’s feelings as you lower your wide-open ass onto "+ cgender("her", "its"));
		if (enemy.hasStatusEffect("Unarmored")) output(" slimy skin");
		else output(" hard plating");
		output(" and start to swivel your hips, dragging the ring over "+ cgender("her", "it") +" for your own relief.");
		
		output("\n\n");
		if (enemy.hasStatusEffect("Unarmored")) output("The alien’s goopy, soft flesh feels incredible; there’s nowhere you can shift it that doesn’t feel like an eager tongue smearing your [pc.asshole] with hot saliva. The ganrael pushes against you, trying to infiltrate further, but you’re too engaged with sticky pleasure to allow it. It groans in frustration while you defeat its investigations again and again, monopolizing its body.");
		else output("The alien’s warm plate is slightly rough to the touch, pitted on the minute scale with tiny pores and bumps that make it feel like a rough tongue on your wanton little hole. It clings to you like a suspicion, kneading the pliant skin of your anus and making each stroke ever more arousing. ");
	}

	//merge vag/ass
	if (!pc.hasCock())
	{
		output("\n\nYour ardor is so intense that");
		if (enemy.hasStatusEffect("Unarmored")) output(" the poor alien’s body begins to deform. More and more of it is pushed outward by the broad circles of your [pc.ass], like dough being stretched. The ganrael doesn’t say a word of complaint as you grind an irregular, bowl-shaped depression into its pelvis, enjoying it as much as you are. Once in a while you can feel a thicker bit of slime you just moved shift back; it doesn’t penetrate your fuck-haze that these must be its most erogenous zones and it’s eager to keep them right where you can touch them.");
		else
		{
			if (pc.hasVagina())
			{
				output(" the [pc.girlCum] dribbling from you threatens to spill over the edge of the creature’s body; every so often "+ cgender("her", "its") +" hands leave your hips ungrasped for just a moment to ensure that not a drop is wasted on the damp dirt. The creature’s desperation for your genes is so foreign as to be stunning and titillating, and makes you want to grant it. How many of the men and herms you’ve met have had that same urge about you? The image of a sticky load brewing up plays through your thoughts; you shift from grinding to rocking back and forth, pretending you’re about to jizz all over your cum-hungry lover. The ganrael will never know why you smile and laugh as you near climax.");
			}
			else
			{
				output(" the hot plating begins to stick to your asshole just a bit too much. You twist and look at the ganrael, who is shivering and enjoying the pressure of your weight. Your finger swipes through an unguarded gap in "+ cgender("her", "its") +" armor, collecting moisture. The alien appears almost startled by this, until you smear the fluid on your smutty anus. You smile, but the ganrael revenges "+ cgender("her", "it") +"self when "+ cgender("she", "it") +" pops two fingers into your hot mouth, collecting spit and rubbing it into your asshole too. A sound like a giggle seems to come from under the alien’s armor.");
			}
		}
	}

	//merge all
	output("\n\nYour lusts peak, sapping muscle control to power the sloppy fuck; the approaching finish makes your strokes shorter and faster, running headlong toward relief. The ganrael notices.");
	if (enemy.hasStatusEffect("Unarmored")) output(" Its plasm rushes toward your "+ (pc.hasVagina() || pc.hasCock() ? "sex" : "anus") +", building up extra flesh. The hot, wet goo licks at your [pc.legFurScales] like an army of passionate tongues.");
	else if (enemy is CrystalGooT1)
	{
		output(" Its legs clasp your [pc.ass] hard, lending you extra force as you fuck, and it reaches out to place its hands");
		if (pc.isTaur()) output(" on your chest");
		else output(" along your face");
		output(" as a sign of affection.");
	}
	else output(" She moans loudly, and her arms raise over her head to entwine, striking a sexually-charged pose that looks awfully like a woman enjoying a great orgasm. The erotic display amps your own libido, intensifying your efforts to climax.");
	output(" Within a few more movements, you cum.");

	//pussy/ass ending
	if (!pc.hasCock())
	{
		if (pc.hasVagina())
		{
			var vagIdx:int = pc.biggestVaginaIndex();
			output("\n\n[pc.GirlCum]");
			if (pc.girlCumQ() <= 250) output(" sputters");
			else output(" streams");
			output(" out,");
			if (!enemy.hasStatusEffect("Unarmored")) output(" running along the armor’s ridges and");
			output(" mingling with the creature’s plasm.");
			if (pc.isSquirter()) output(" So much fluid comes from your wet, ever-ready pussy that the creature begins to laugh as if intoxicated; "+ cgender("her", "its") +" limbs slacken and release you.");
			output(" Your [pc.vagina "+vagIdx+"] quavers and quakes, shooting knots up your back that double you over and bring you face-to");
			if (pc.isTaur()) output(" floor.");
			else output(" face with your lover. "+ cgender("She", "It") +" strokes your brow, displaying "+ cgender("her", "its") +" affection.");
		}
		else
		{
			output("\n\nYour pucker spasms, scraping the alien’s surface with a vigor that tugs on the entire bottom half of your nervous system. The ganrael, unable to look away, watches your anal orgasm. Your ring clenches and pulses like a pufferfish without a date, trying to squeeze down on something, anything; the adventurous alien sticks two fingers inside and your grateful sphincter suckles on them. The digital stimulation makes the end of your orgasm a shuddering, bone-shaking success.");
		}

		if (!pc.hasVagina() || pc.wettestVaginalWetness() <= 2)
		{
			output("\n\nYour body winds down your climax, and you begin to climb off the ganrael, feeling boneless.");

			output("\n\n<i>“Wait, that’s all?”</i> "+ cgender("she", "it") +" asks, sounding impatient.");

			output("\n\nYou shrug and nod with the peace of mind of someone who has just gotten laid.");

			output("\n\n<i>“But... but...”</i> "+ cgender("she", "it") +" stammers, <i>“...I didn’t get enough! I need more seed!”</i> "+ cgender("She", "It") +" reaches for your oversensitive [pc.vagOrAss] and you back away on reflex. The alien tries again with the same result, then drops "+ cgender("her", "its") +" arm, defeated.");

			output("\n\n<i>“Maybe next time,”</i> you offer");
			if (pc.isNice()) output(" politely.");
			else output(" sarcastically.");
		}
		else
		{
			output("\n\nYour body winds down from your messy orgasm, and you almost slide off the ganrael when you separate.");
			
			output("\n\n<i>“That was good,”</i> "+ cgender("she", "it") +" murmurs, playing with your [pc.girlCumNoun]. <i>“You can cum a lot... I like you.”</i>");
			
			output("\n\nThe ganrael pets your face with "+ cgender("her", "its") +" sticky hand, and you recoil.");
			if (enemy is CrystalGooT2 && !enemy.hasStatusEffect("Unarmored")) output(" She laughs and lies down while you collect your things. Whenever you happen to glance over, the ganrael raises one knee and arches her back in a sultry, exaggerated pose, trying to tempt you back into bed.");
			else
			{
				output(" It giggles and helps you collect your things, though it does take every opportunity to touch your [pc.skinFurScales]");
				if (!pc.isNude()) output(" while you re-dress");
				output(", letting you know there’s another round of sex if you want it.");
			}
			output(" You pass for now, but make a note to come back and play in the caves again sometime.");
		}
	}
	else
	{
		//unarmored + cock ending
		if (enemy.hasStatusEffect("Unarmored"))
		{
			output("\n\n");
			if (pc.cumQ() <= 500) output("Jizz dribbles from your depleted organ, quietly depositing a few dots in the ganrael. It shudders in happiness and plunges its own hand through the skin to swirl your [pc.cum] around, enhancing its buzz.");
			else output("The ganrael’s body softens even more when the first stroke of your sperm lands. With a perverse thrill, you continue to fuck the creature’s cunt" + (multiCock ? "s" : "") + " while your orgasming body begs for reprieve. [pc.EachCock] jabs into it unguided, plowing aside goopy plasm to forge a new path each time; you hold briefly at every plunge to fire another spurt of [pc.cum], then pull out to blaze a new trail.");
			if (pc.cumQ() > 500 && pc.cumQ() <= 2500) output(" When your climax fades, the creature has pockets of your slop all over and is quaking in ecstasy from your genetic contribution.");

			//big cum only
			if (pc.cumQ() > 2500)
			{
				output("\n\n[pc.CumNoun] rushes from you in torrents, turning your scheduled deposits into a swamp of plasm-swirled jizz. The elastic ganrael bulges with cum-babies as you dump your tremendous load, and wave upon wave of sperm renders it higher than a leithan’s ceiling and quite unable to move. ”</i>No... more...”</i> it groans. <i>“Ohhh... gonna... pop!”</i>");
				
				output("\n\nThe alien’s distended body churns violently, swirling the monster load like an invisible stand mixer and distributing it to every corner. It swells with growth, packing on inches so fast you worry that it’ll explode. Instead, it thrashes and deforms with odd shapes that reach out from the inside. The alien lies flat, and its demon possession starts to emerge, pushing two hands through the stomach to brace against the ground and help a new body climb out. A second ganrael separates from your cum-dump, still carrying your jizzy color.");
				
				output("\n\n<i>“Fantastic...”</i> mumbles the original. <i>“Usually takes... longer.”</i> The copy - rather, your offspring - reaches for your dribbling [pc.cockNounSimple "+ cockIdx +"], caressing the crown and collecting an aftershock from your stretched slit; its other parent just looks on, too cum-drunk or debased to stop the sort-of-incest. Filled with unholy ideas, you pull back and look around for your things before you act on them.");
			}
			//not big cum
			else
			{
				output("\n\n”</i>I could get addicted to you...”</i> it murmurs, petting your [pc.skinFurScales].");
			}
			output(" You pop free of the goo-pussy with a ‘slurp’, still drooling aftershocks. It lies on the cave floor, too hopped up to pretend to focus on you, but you’re sure it’s watching as you collect your things.");
		}
		else
		{
			//armored + cock ending
			output("\n\n");
			if (pc.cumQ() <= 500) output("[pc.Cum] bubbles from you, dropping all you can muster in the ganrael’s gooey pussy. "+ cgender("She", "It") +" shivers and "+ cgender("her", "its") +" hands fall on "+ cgender("her", "its") +" abdomen reflexively as the buzz kicks in.");
			else if (pc.cumQ() <= 2500) output("Your [pc.cockNounSimple "+cockIdx+"] fires a stroke of [pc.cumNoun] into the ganrael, who trembles when the foreign genetic material touches "+ cgender("her", "its") +" insides. You keep pumping, letting "+ cgender("her", "its") +" clenches drag the sperm from your shaft; all of "+ cgender("her", "its") +" focus shifts to wringing jizz from your [pc.cockNounSimple "+cockIdx+"].");
			else output("The urethra in your [pc.cockHead "+cockIdx+"] dilates for the massive load of jism that’s already boiling up your dick. The first burst hits the ganrael like a bomb, and the creature’s back arches as the [pc.cumNoun] battles for space inside "+ cgender("her", "its") +" constricting armor. The sheer volume of semen you produce pushes gooey flesh through the gaps, so much so that by the time you finish "+ cgender("she", "it") +" looks like a lump of [enemy.skinTone] dough that has been squeezed by a giant hand. A sound like <i>“guh-guh”</i> comes from your partner as your intoxicating sperm mingles with "+ cgender("her", "its") +" plasm around the edges, but deeper it’s still pure [pc.cumNoun], ensuring "+ cgender("she", "it") +"’ll be high for a good while.");
			
			output("\n\n<i>“You’re... amazing,”</i> the ganrael says.");
			if (enemy.hasStatusEffect("Unarmored")) output(" Her thighs squeeze");
			else output(" Its plates clamp down");
			output(", trying to keep you inside, but "+ cgender("she", "it") +" doesn’t have enough strength to stop you pulling free. <i>“I want to see you again... I think I’m addicted,”</i> "+ cgender("she", "it") +" confesses.");
			
			output("\n\n");
			if (pc.isAss()) output("You laugh at the stoned ganrael’s admission. Without giving it a second thought, you collect your gear and leave.");
			else output("The stoned ganrael’s proposal makes you nervous, and you separate from it. "+ cgender("Her", "Its") +" sudden devotion must be from "+ cgender("her", "its") +" drug-like reaction, but you still collect your gear and move on.");
		}
	}
	output("\n\n");

	processTime(30+rand(10));
	pc.orgasm();

	addCrystalGooBallLoot();
	
	clearMenu();
	CombatManager.genericVictory();
}

public function crystalGooCuddlebug(pcVictory:Boolean = false):void
{
	//avail. for type 1 only and requires unbroken armor
	//copied mostly to/from unique type 1 armor intact loss scene
	//shares victory menu button with Crystal Sounding
	//gan reclines and nestles PC in-between crystal legs, then traps PC while sticking it up his ass
	//tooltip: Wrap yourself in the ganrael’s embrace and let it enjoy your vulnerable body, or booty. 
	//tooltip disabled, armor broken: The ganrael can’t embrace you all over if you break off all its limbs.

	//victory ver. intro
	if (pcVictory)
	{
		clearOutput();
		showCrystalGooToo();

		if (pc.isBimbo()) output("<i>“Damn right,”</i> you snap. <i>“And how are you gonna plow my hot little hole?”</i>");
		else if (pc.isBro()) output("<i>“I dunno...”</i> you temporize, <i>“I don’t feel like all that effort.”</i>");
		else if (pc.isAss()) output("<i>“What the hell am I supposed to do with your useless ass?”</i> you demand, pointing to the creature’s plated trunk.");
		else output("<i>“What am I supposed to do?”</i> you ask, gesturing to the creature’s plated trunk.");

		output("\n\nThe ganrael reclines unexpectedly, turning belly-up. <i>“I can take the lead,”</i> it offers. It spreads its crystalline legs in a liberal display that’s probably meant to be inviting but looks like a spider trying to right itself. <i>“I’ll do all the work,”</i> it adds, trying to entice you. <i>“Make you feel good.”</i>");

		output("\n\nYou set aside misgivings and approach, close enough that it could strike you if it wanted. After a minute of standoff, you decide that it’s not going to, and");
		if (!pc.isNude()) output(" disrobe");
		else output(" set aside your gear");
		output(". It watches you and indicates for you to lie on its trunk. Trembling, you do so, and it uncurls to accommodate your height until your whole body feels like it’s resting on warm, mossy stones.");

		output("\n\n");
	}
	else
	{
		output("\n\nThe ganrael creeps up, first disarming and then coiling around until you sit in the center of a circle of legs. Its impassive mask stares while it probes and tests your");
		if (pc.isNude()) output(" nude body.");
		else output(" gear, unfastening and pulling until your naked form is exposed.");
		output(" Once it’s satisfied that you’re harmless, it makes an odd move: it cups your face in its smooth hands and pulls you forward, reclining and bringing you to rest on top of it. The creature’s plating feels like warm, mossy stone and it uncoils to match your height until your whole body can lie in its embrace.");
	}

	//shared body starts here
	output("The creature’s legs clasp your sides. With far gentler touches than it used to fight, it explores your skin, tracing meaningless patterns on a hunt for your sensitive zones. Predictably, the ganrael finds and fixates on");
	if (pc.hasCock())
	{
		output(" your [pc.multiCocks], stroking until blood engorges");
		if (pc.cocks.length == 1) output(" it");
		else output(" them");
		output(" to erectness. The creature pins");
		if (pc.cocks.length == 1) output(" your cock");
		else if (pc.cocks.length == 2) output(" both cocks");
		else output(" as many cocks as will fit");
		output(" between your bodies");
		if (pc.biggestCockLength() > (pc.tallness / 2))
		{
			output(" and guides your [pc.cock "+pc.biggestCockIndex()+"] into the channel");
			if (pc.biggestTitSize() <= 2) output(" of its sculpted cleavage");
			else output(" formed between its sculpted breasts and your [pc.chest]");
		}
		output(", then rubs your cheek affectionately when the friction makes you shiver.");
	}
	else if (pc.hasVagina() && pc.biggestTitSize() >= 1)
	{
		output(" your [pc.chest], tweaking your [pc.nipple]. When you shiver and smile, it strokes your cheek.");
	}
	else if (pc.hasVagina())
	{
		output(" [pc.oneVagina]. It explores your cunt, testing the clitoris and noting the sudden way your mouth hangs open. The alien slips a finger in and you suck on it as your pussy is penetrated by two more warm, smooth digits.");
	}
	else
	{
		output(" your [pc.asshole]. Having nothing else to play with, it pushes at your backside, spreading and smushing your");
		if (pc.buttRating() <= 3) output(" sparing");
		else if (pc.buttRating() <= 7) output(" handfuls of");
		else if (pc.buttRating() <= 12) output(" generous");
		else output(" enormous");
		output(" ass and petting your face when the pressure makes you smile.");
	}
	output(" While it stimulates its find, its other legs continue to explore, mapping your body’s resistance.");
	
	output("\n\n<i>“Curious,”</i> the alien remarks. You stare at its mask as it ministers to your vulnerable form - it seems almost doting, somehow.");
	
	output("\n\nThe numerous legs finish searching and settle into steady waves, falling onto your back and kneading your [pc.skinFurScales].");
	if (!pc.isNice()) 
	{
		output(" The unexpected kindness niggles at you. It isn’t the treatment you’d have expected... but there’s no denying that it feels good.");
		output(" You shudder, melting atop the creature’s torso.");
	}
	output(" The tension release continues until your masseuse is satisfied; it tests your muscles, making sure you’ve turned to jelly all over. Your arms are dangling lazily over the creature’s side when you feel its trunk flex, and you raise your head, not expecting what happens next.");
	
	output("\n\nThe ganrael’s legs fold over your back, sobering you like an ice bath. You turn on reflex - the mask which seemed salutary and welcoming now leers like a predator. Squirm though you may, its cage holds tight. The bottom half of its trunk curls upward,");
	if (pc.isGoo()) output(" parting your fluid undercarriage and covering your [pc.ass].");
	else if (pc.legCount == 1) output(" wrapping over your [pc.leg] and pressing against your [pc.ass].");
	else output(" forcing your legs apart and pressing against your [pc.ass].");
	
	output("\n\n<i>“Relax,”</i> the ganrael warns, though you’re not liable to listen. Four legs holding your [pc.hips] release and pry at the creature’s folded-over tail. The armor plates against your butt part under their leverage, allowing the ganrael’s wet flesh to ooze out. It slides through your [pc.ass], creeping down your crack and pooling in your anus, but when you turn to watch, the alien seizes your face in its hands, forcing you to look forward. While you stare into the impassive mask, worried, the slime infiltrating you begins to take shape.");
	
	output("\n\nYou shift uneasily, and the creature’s spindly limbs flex, pulling your cheeks apart. The slime stirs as it drools deeper into your [pc.asshole].");
	if (pc.ass.looseness() <= 1)
	{
		output(" Though your");
		if (pc.ass.looseness() == 0) output(" virginal");
		else output(" tight");
		output(" hole resists, the nearest legs spear inward, spreading you far enough for the sludge to drip in. You wince, still held transfixed, while it fills your diameter, growing more solid and bumpy by the second.");
	}
	else if (pc.ass.looseness() <= 3)
	{
		output(" Your ass resists the slime at first, but the warmth and wetness begin to arouse you and your pucker blooms for just a moment, allowing the slippery goop to surge inside. You shiver with lust, staring into the intense mask, as the slime thickens to a semi-solid, nubbed rod.");
	}
	else
	{
		output(" Your loosened asshole offers no resistance at all to the sludge, which pours into you like liquor into a kui-tan tourist. In short order, your ass is so full of ganrael that the slop can form a massive cock, nubbed at the tip and bearing enough girth to fill even your incorrigible anus.");
	}
	pc.buttChange(pc.analCapacity());
	
	output("\n\nThe ganrael draws its cock from you with a long pull, teasing and lubricating your asshole, and its hands shift to your shoulders, to better brace you against the thrust. In a smooth motion, the tool plunges back in, dragging nubs over the nervous rings of your anus like a xylophone. The quick crescendo of pleasure quiets your alarm and causes your head to droop below your shoulders");
	// and not in spikehawk/mohawk/topknot/afro style)
	if (pc.hairLength > 12 && !InCollection(pc.hairStyle, ["spike hawk", "mohawk", "topknot", "afro"])) output(", pouring your [pc.hair] onto the alien’s breastplate in a satiny cascade");
	output(". Your alien lover withdraws and thrusts again, faster this time, trusting your spasming asshole to wring the lubrication you need from the spongy faux-phallus.");
	if (pc.hasCock())
	{
		output(" The accelerating fuck tells on your trapped shaft");
		if (pc.cocks.length > 1) output("s");
		output(", scraping");
		if (pc.cocks.length == 1) output(" it");
		else output(" them");
		output(" against the ganrael’s molded chest whenever the creature pumps into you. Each time its cock hilts, a stream of precum is forced out of your prostate, smearing");
		if (pc.biggestTitSize() >= 2) output(" your [pc.breasts]");
		else output(" the creature’s statuesque tits");
		output(" with your smut.");
	}
	else if (pc.isLactating()) output(" The pulses of the alien’s lovemaking compress your [pc.breasts] with wide, circular motions, dragging your [pc.milkyNipples] until they squirt in spurts timed to match.");
	
	output("\n\nVigor mounting, the creature fucks faster and faster. You can feel the nubs on its glans swell inside your [pc.asshole] as the ganrael shifts mass around, and the creature itself starts to shiver as it sodomizes you. It’s pushing its own erogenous zones into the fake cock. The new sensations charge the alien’s pace - soon it’s pounding you so forcefully that the cage of crystalline legs digs into your [pc.ass]. The pain isn’t even on your radar, though; the radiant orgasm building in your sensitized anus");
	if (pc.hasCock())
	{
		output(" and [pc.cumNoun]-smeared cock");
		if (pc.cocks.length > 1) output("s");
	}
	output(" is all-consuming.");
	
	output("\n\nThat orgasm breaks irresistibly, and your body curls in climax, pressing your");
	if (pc.hasCock()) output(" back");
	else output(" butt");
	output(" hard into the crystal cage.");
	if (pc.hasCock())
	{
		output(" [pc.EachCock]");
		if (pc.cumQ() <= 250) output(" squeezes up what meager jizz you can produce and cheerfully drizzles it onto the ganrael’s stomach.");
		else if (pc.cumQ() <= 1000) output(" flings [pc.cum] jubilantly onto the ganrael’s pre-smeared chest, covering its breasts with a garland of [pc.cumVisc] [pc.cumColor].");
		else output(" hoses the ganrael’s torso with the seed welling from your [pc.balls] until the alien is inundated with such a flood that the peaks and valleys of its cleavage are all the same level.");
	}
	else if (pc.hasVagina())
	{
		output(" [pc.EachVagina] twitches from the anal stimulation, left out of the hedonistic celebration but aroused just the same by the banging going on next door.");
		if (pc.isSquirter()) output(" A warm, wet spot grows on the alien’s trunk where your [pc.girlCumNoun] squirts out, mashed into your sodden cunt as your lover continues to pump.");
	}
	output(" Your [pc.asshole] ripples and wrings the goo-cock, trying to hold it but only aggravating you when the malleable tool escapes and returns with a more irregular, ass-teasing shape on every thrust.");
	
	output("\n\nYou’re trapped in your own body, quivering and helpless, while the experience is drawn out by the ganrael’s indifference to your orgasm; the alien creature continues to sodomize you until you feel like another minute of");
	if (pc.hasCock()) output(" ejaculation");
	else output(" climax");
	output(" would take ten years off your life.");
	if (pc.hasCock()) output(" When you bow low in exhaustion, it even seems to take perverse pleasure in pressing you into its cum-spattered breastplate, then wiping away the [pc.cumNoun], exulting in the seed it harvested.");
	output(" Only after your orgasm fizzles out in a whimpering finale does your partner stop moving inside your butthole and shrink down the swollen nubs of its cock.");
	//end shared body

	processTime(30+rand(10));
	pc.orgasm();
	pc.loadInAss(enemy);

	//victory ver. outro
	if (pcVictory)
	{
		output("\n\n<i>“See,”</i> the ganrael");
		if (pc.hasCock() && pc.cumQ() >= 2500) output(" slurs");
		else output(" asserts");
		output(" as it slides from your stretched anus, <i>“I told you I’d do all the work.”</i> It rolls over with you clasped in its legs, then opens the");
		if (pc.hasCock()) output(" semen-stained");
		output(" cage, placing you on the ground with care. Your head lolls back from the all-over tenderizing you just took. <i>“Bye bye,”</i> it says, leaving you alone to collect your muscle tension and rein in your still-twitching asshole.");
		output("\n\n");
		addCrystalGooBallLoot();
		
		clearMenu();
		CombatManager.genericVictory();
	}
	else
	{
		output("\n\nWith your genetic material seized, the ganrael rolls over and unceremoniously dumps your exhausted");
		if (pc.hasCock()) output(", semen-stained");
		output(" body onto the ground. It retracts the gooey prong it used to ravage you");
		if (pc.hasCock()) output(", folds its hands and legs together to cup as much jizz as possible against its chest,");
		output(" and skitters away. Left alone, you doze, dreaming dreams of fantastic context for the throbbing of your abused asshole.");
		output("\n\n");
		clearMenu();
		CombatManager.genericLoss();
	}
	//end, lust, time, rewards
}

public function crystalGooSounding(pcVictory:Boolean = false):void
{
	if (pcVictory)
	{
		clearOutput();
		showCrystalGooToo();

		output("You eye the creature’s crystal needles and, despite yourself, get a horrible idea.");
		if (!pc.isCrotchExposed())
		{
			output(" Quickly");
			if (!(pc.armor is EmptySlot)) output(" dumping your [pc.armor]");
			if (!(pc.armor is EmptySlot) && !(pc.lowerUndergarment is EmptySlot)) output(" and");
			if (!(pc.lowerUndergarment is EmptySlot)) output(" lowering your [pc.lowerUndergarment]");
			output(", you expose yourself.");
		}
		else output(" You place your nude crotch prominently before the ganrael and watch her reaction.");
		output(" The interested alien raises a finger to touch, but you pull away.");
		
		output("\n\n");
		if (pc.isBimbo() || pc.isBro() || pc.isNice()) output("<i>“Can you make one of those things, but not so sharp?”</i> you ask, indicating a needle.");
		else if (pc.isMischievous()) output("<i>“Want to test your accuracy? I have a small target in mind,”</i> you hint.");
		else output("<i>“Think you can create a little blunt rod without fucking it up?”</i> you ask brusquely.");
		
		output("\n\n<i>“Yeah, any time,”</i> the alien answers, settling into a proud pose as soon as your gaze lands on her. <i>“Why?”</i>");
		
		output("\n\n");
		if (pc.hasPerk("Easy") || pc.libido() >= (pc.libidoMax() * 0.66))
		{
			output("You stroke your");
			if (pc.hasCock()) output(" dick");
			else output(" cunt");
			output(" with a wide grin and tickle the urethra right in front the alien, spreading it between your fingers.");
		}
		else
		{
			output("A little embarrassed, you spread the urethral slit in your");
			if (pc.hasCock()) output(" dick");
			else output(" cunt");
			output(" and hope that she won’t need your request spelled out.");
		}
		output(" It seems to send the message; she giggles with a faint, bubbly sound and reaches out to pull you closer.");
		
		output("\n\n<i>“You’re such a pervert,”</i> she teases.");
	}
	else
	{
		output("\n\nThe idealized");
		if (CodexManager.entryUnlocked("Nyrea")) output(" nyrea");
		else output(" female");
		output(" figure approaches your fallen form, disarming you and");
		if (pc.isCrotchExposed()) output(" paying special heed to your [pc.crotch].");
		else output(" sliding sculpted fingers into your [pc.lowerGarments] until she finds your genitals. She pulls the gear away until you’re exposed.");
		output(" The ganrael idly traces the [pc.legFurScales] near your crotch, deciding what to do. Something apparently suggests itself, because she leans in closer and begins a prurient study that makes you");
		if (pc.libido() >= pc.libidoMax() * 0.66 || pc.hasPerk("Easy")) output(" hot and eager to fuck.");
		else output(" blush.");
	}

	var cockIdx:int = -1;
	var megaDong:Boolean = false;
	
	//shared body sharts here
	if (pc.hasCock())
	{
		cockIdx = pc.biggestCockIndex();
		
		if (pc.cocks[cockIdx].cLength() >= 48 && pc.cocks[cockIdx].thickness() >= 12)
		{
			megaDong = true;
			output("\n\nThe ganrael appraises your monstrous [pc.cockNounSimple "+cockIdx+"] and her fingers dip into the wide slit, scraping at the fringe, until her measurement is done. She jabs those same fingers under the plating of one palm and yanks hard, tearing it away. A stream of gel pours forth, bubbling and hardening as it extends, until her hand rests at the terminus of a two-foot-long, three-inch-thick rod with a clubbed tip. You swallow hard when she raises it to your [pc.cockHead "+cockIdx+"].");
		}
	}
	
	if (!megaDong)
	{
		output("\n\nThe ganrael inspects the opening, then slides a finger under the palm plate of her left hand and pries upward; "+enemy.skinTone+" gel drools from the ‘wound’, forming a thin strand with a teardrop tip. It bubbles and clouds, stiffening into a small rod. She takes a knee and brings the newly-made sound to your genitals, and you shudder.");
	}
	
	output("\n\nThe alien begins slowly, testing your urethra with ticklish care. The");
	if (!megaDong) output(" rod");
	else output(" truncheon");
	output(" looks frightening, but the ganrael’s judgement must be better than yours - with a pleasant pinch, the bulb slides into you, still wet from being goo’s lifeblood.");

	//cock branch
	if (pc.hasCock())
	{
		output("\n\n<i>“Ungh,”</i> you grunt, as the foreign object spreads your [pc.cockHead "+cockIdx+"].");
		
		output("\n\nThe impassive alien makes no acknowledgment but to swirl the sound a bit, dragging your shaft in a cute loop through the air. She pushes, and with the push comes new pressure as the sound descends. The rod advances insolently, pushing through the flesh like a frontiersman parting tall grass. Farther it slides, past the glans, then the neck");
		if (pc.cocks[cockIdx].cLength() >= 15) output(", then [pc.sheath "+cockIdx+"]");
		output(", until the stone-faced beauty can insert it no farther.");
		if(pc.hasKnot(cockIdx)) 
		{
			output(" The ganrael’s touch lingers on your fleshy ");
			if(pc.cocks[cockIdx].cType != GLOBAL.TYPE_NYREA) output("knot");
			else output("egg-knot");
			output(" a bit too long, and the bulge begins to stiffen. She releases it to extend your pleasure, or torment, further.");
		}
		else if (!pc.isTaur() || pc.cocks[cockIdx].cLength() >= 72) output(" She stares up at you, studying.");

		output("\n\n<i>“Looks enjoyable,”</i> the soft voice reverberates. Without waiting for an answer, she pulls at the sound, and whatever response you had turns to a grunt of pleasure. The tip moving back up is like a miniature orgasm on its own, and when your lover pops the bulbous head free, a");
		if (pc.cumQ() <= 250) output(" trickle");
		else output(" rush");
		output(" of [pc.cumVisc] pre-cum escapes in its train. She intercepts the stream with her hand, dragging her fingers up the underside of your [pc.cock "+cockIdx+"]. The touches make you even stiffer.");
		
		output("\n\nThe sound slides in again, parting the pre to lodge in your throbbing [pc.cockHead "+cockIdx+"]. Instead of pushing on, the alien releases it, allowing the rod to bob with every twitch of your manhood. Her fingers trace your length, digging in but harmless with slick precum coating; the sensation makes you quake, which only torments your tip with the sound again.");
		if (pc.balls > 0 && pc.ballSize() > 0) output(" The ganrael’s hand finds your [pc.sack]. Curious, she squeezes softly, watching you squirm.");
		else if (pc.hasVagina()) output(" You squirm as her pre-slicked fingers invade [pc.oneVagina], discovering the urethra therein. She pauses, and for a fearful moment you worry she may be considering a second toy. When she slips out and resumes stimulating your cock, you sigh with relief.");
		else output(" Curious at the lack of nyrean knot she caresses your pubic mound but, finding it not particularly sensitive, moves back to the tip.");
		
		output("\n\nSatisfied with her exploration, the ganrael grips the sound and once again spits your engorged [pc.cockNounSimple "+cockIdx+"] on it. As the rod slides into your [pc.cock "+cockIdx+"] this time, her hand wraps around the shaft. The palm presses on the underside as the rod’s tip slips lower, pinching your nerves and holding them captive before the bulb.");
		
		output("\n\n<i>“");
		if (pc.race().indexOf("nyrea") != -1) output("How like a nyrea");
		else if (pc.race().indexOf("myr") != -1 || pc.race().indexOf("zil") != -1) output("How like a myr");
		else output("A familiar response");
		output(",”</i> the creature observes, while your back");
		if (pc.isTaur()) output(" legs paw the ground.");
		else output(" arches.");
		if (!pc.isTaur() || pc.cocks[cockIdx].cLength() >= 72) output(" You stare into her face, transfixed by the unemotive "+enemy.skinTone+" mask. A shadow flickers over the stolid mouth, and for a moment the effect is almost like a smile. Then it’s gone.");
		
		output("\n\nWith the sound lodged and moving to the ganrael’s whim, she masturbates you, squeezing you against the intruder. She slows every stroke when it gets to the bulb, letting you feel her stiff, pre-slicked palm stutter over it; your orgasm shivers awake as your cock is stroked both inside and out, building up momentum behind the obstruction until it feels like you could burst. With the toy occupying your cum’s escape route, your impending ejaculation feels like an emergency.");
		
		if (pc.balls <= 0 || pc.ballSize() <= 0) output("\n\n<i>“Cumming!”</i> you announce, part whine and warning.\n\n");
		else output("\n\nYour tightening scrotum cues the alien.");

		output(" With a hand like cold glass, she squeezes the base of your cock. The bulb slides upward, each inch of regression carrying the terrible promise of release if only your patience would hold. As the rod nears the end, the line between ecstasy and torture starts to blur.");
		
		output("\n\nThe sound clears the last inch before the tip, and your lover scoots backward and nestles your [pc.cockHead "+cockIdx+"] in the perfect, sculpted cleavage of her chest, pressing firmly. Your control overreaches when she caresses your blood-engorged glans - with the bulb still inside you, you give up on holding back. You surrender to orgasm, only hoping your churning load will push the toy out or the alien will pull it free.");

		//li’l cum
		//you STOLE fizzy lifting drinks
		if (pc.cumQ() <= 250)
		{
			output("\n\nYour exhausted body releases a piddling squirt of [pc.cumNoun], nowhere near enough to budge the sound. Lurching once, your body goes limp; the ganrael continues to tease your overstimulated penis, unaware that you’ve already finished. When you slump instead of spasming in further climax, the alien stops. She pulls the sound loose and leans in to inspect, but the arrested cum is already oozing back down your cock, invisible.");
			
			output("\n\nThe alien’s grip on the sound tightens when she understands what’s happened");
			if (!megaDong) output(", and a faint cracking sound reveals her frustration. The sound snaps in two");
			output(", and the confounded ganrael hurls it away with a word your translators don’t interpret but whose meaning is obvious. Stiffly, she gets to her feet and leaves.");
			//li’l cum version ends here; time, lust, rewards/penalties, etc.
			//handle the reflow however - can deplete cum or not
		}
		else if (pc.cumQ() <= 1000)
		{
			output("\n\nThe first shot of [pc.cumNoun] is accompanied by a mighty pelvic thrust from you, and the sound vibrates violently in the ganrael’s hand as your jizz tries to batter free. The alien withdraws it in time for the next stroke, which powers through the stalled load to squirt all over her breasts. The sloppy, [pc.cumVisc] fluid scribbles on the statuesque ganrael like graffiti, distorting her beautiful, martial body with blotches of [pc.cumColor]. Two more");
			if (pc.cumQ() >= 750) output(" thick");
			output(" spurts follow, catching her on the chin. She accepts with poise, neither flinching nor leaning into it.");
			
			output("\n\n<i>“Hee hee,”</i> she titters, laying her hand against her forehead and pretending to swoon. <i>“You’re dirty.”</i>");
		}
		else
		{
			output("\n\nThe torrent of jizz you produce is enough to send the sound tumbling through the air. The ganrael barely notices, preoccupied with the blasts of molten love washing over her. With stoic grace, she folds her hands and allows your wild [pc.cockNounSimple] to lurch and fire stroke after stroke after stroke into her sculpted cleavage and elegant neck, washing out her "+enemy.skinTone+" with floods of your own");
			// {(color mismatch)
			if(enemy.skinTone != pc.fluidColorSimple(pc.cumType)) output(" [pc.cumColor]");
			output(" until even her shape is obliterated by the [pc.cumVisc], spermy sludge. When you finally sigh and stop cumming, the gooey pile gets to its feet, giggling drunkenly.");
			
			output("\n\n<i>“That’s... really something,”</i> she sighs, rubbing semen into the gaps of her armor where it can touch her skin and shivering.");
			//end of cock branch; go to loss or victory version outro unless li’l cum
		}
	}
	else
	{
		//vag branch for no cock PCs
		output("\n\nYou shudder as the alien object penetrates your urethra. The transgressive act feels wrong, but the pressure radiates through you, lighting nerves and stimulating bloodflow until your vulva and [pc.clitoris] are engorged and puffy. The ganrael teases you further, using her other hand to explore the strange features of an alien cunt. Your poor clitoris is at the curious creature’s mercy; she rolls it between her fingers and drags a tip over it with force enough to spasm your back. All the while, she swirls the sound with her other hand, slowly stretching you to prepare for full insertion.");
		
		output("\n\nWith her hard-cast mask, it’s impossible to anticipate when she’ll decide to push on; all you can do is try to stay relaxed. The ganrael doesn’t keep you in suspense long - once the first inch of urethra is stretched to accommodate the thin bulb, she invades your narrow duct with steady force. The deep sounding creates an awkward, pleasant sensation of fullness, but in the wrong hole.");
		if (!pc.isTaur()) output(" She follows your facial expressions with uncanny accuracy, intensifying her strokes when you show ecstasy and going slowly at pain; more amazingly, she offers reassuring ‘eye’ contact by raising her mask to you during the tense final few inches.");
		
		output("\n\nA long, stuttered sigh escapes from you when the bold invader finally comes to rest. The ganrael’s fingers also stop teasing, leaving you in an aroused, uncomfortable limbo that lasts as long as they meander down to your wet, empty pussy. They slide in and she begins once more to swirl the sound, provoking another groan.");
		
		var vagIdx:int = pc.biggestVaginaIndex();

		output("\n\n");
		// {(PC is nyrea/similar chitinous race but without nyrean sperm-cunt)
		if (pc.race().indexOf("nyrea") != -1) output("<i>“Strange nyrea,”</i> the ganrael muses, digging deeper in your [pc.vagina "+vagIdx+"].");
		else if (pc.race().indexOf("myr") != -1 || pc.race().indexOf("zil") != -1) output("<i>“Silly myr,”</i> the ganrael teases, <i>“venturing too far from home.”</i>");
		else output("<i>“Like a myr,”</i> the ganrael muses, exploring your intimate place.");
		output(" Her fingertips drag the insides of your pussy, hunting for something. In their erotic ambulation, they chance to brush against the shared wall with the urethra. The pressure pinches a bundle of nerves between her fingers and the sound, sending you into a paroxysm of lust. The ganrael seems almost surprised... but once she works out that she’s causing pleasure and not pain, she attacks your newly-found g-spot without remorse.");
		
		output("\n\n");
		// {(nyrea/similar w/out sperm-sacs)
		if (pc.race().indexOf("nyrea") != -1) output("<i>“Strange,”</i> she repeats,");
		else output("<i>“Fun feature,”</i> she observes,");
		output(" pulling the bulb into position and mercilessly stroking your g-spot on both sides. Your muscles desert as your body goes into good-fuck mode,");
		if (!pc.isNaga()) output(" kicking");
		else output(" lashing");
		output(" and clawing at the dirt. Orgasm builds to full in moments and then remains there, unable to carry you away while the ganrael still controls your little bundle of nerves. The pleasure keeps right on until you’re beyond where you expected to cum, rocking your hips and helpless to end your ecstasy.");
		
		output("\n\nFor several lifelong minutes you’re transfixed, until the ganrael loses interest in her discovery and withdraws her hand to play with your [pc.clitoris] some more. Free from the g-spot stimulation, you climax almost as soon as she touches your pleasure-button, soaking her with a");
		if (!pc.isSquirter()) output(" gush");
		else output(" torrent");
		output(" of [pc.girlCum]. The speed and suddenness of your squirt take the alien by surprise, and she catches it right in her lap. She slides the sound out slowly as she fondles your throbbing clitoris, until your orgasm finishes and you collapse. Only then does she swipe up some [pc.girlCumVisc] juice and examine it.");
		//vag branch ends; go to loss or victory version outro
		//shared body ends here
	}

	if (pcVictory)
	{
		output("\n\nThe ganrael watches over you from a distance while you recover from your intense orgasm,");
		if (pc.hasCock() && pc.cumQ() > 1000) output(" drunkenly laughing as you groan and flop.");
		else output(" practicing her inspiring poses and occasionally picking large mushrooms.");
		output(" When you can finally sit up again, she says a shy farewell. <i>“See you later... pervert.”</i>");
		output("\n\n");

		// 9999
		//if biggest cock is > 12 width and 48 length add Composite Club to drop table @ 15-25% chance
		// theres also some shit about potentially not getting to cum, eyeball that

		processTime(30+rand(10));
		pc.orgasm();

		addCrystalGooBallLoot();
		
		clearMenu();
		CombatManager.genericVictory();
	}
	else
	{
		output("\n\nYou lie there for some time, half-dozing through the pulse of your de-stretching urethra. When it finally feels numb enough that you can bear to");
		if (!pc.isNude()) output(" get dressed");
		else output(" walk");
		output(", you collect your things.");
		output("\n\n");

		processTime(30+rand(10));
		pc.orgasm();

		clearMenu();
		CombatManager.genericLoss();
	}
}

public function crystalGooPCLoss():void
{
	// Armor check (just in case!)
	if (enemy.shields() <= 0 && !enemy.hasStatusEffect("Unarmored")) 
	{
		enemy.createStatusEffect("Unarmored");
	}
	
	clearOutput();
	showCrystalGooToo();

	if (pc.HP() <= 0) output("You stumble on the dirty cave floor, try to get your balance, and fall again. With a thump, you plop down on your ass.");
	else output("You quiver and lose balance, falling on your ass. Fantasies parade through your thoughts, distracting you so much that you don’t immediately remember how to stand again.");
	if (enemy.hasStatusEffect("Unarmored")) output(" The sexless, blank-faced ganrael approaches by inches, trying to conceal its vulnerability until it understands that you’re even worse off. Once it understands, though, it acts.");
	else if (enemy is CrystalGooT1) output(" The ganrael’s legs skitter and scrape over the stones as it winds around you, carefully watching. Only after you’re encircled does it chance to act.");
	else output(" The ganrael stands stationary, exultant and statuesque in a victorious martial pose. She remains like that for several seconds, possibly thinking how best to use you, before she acts.");

	if (enemy is CrystalGooT1 && !enemy.hasStatusEffect("Unarmored") && rand(20) == 0)
	{
		crystalGooCuddlebug(false);
	}
	else if (enemy is CrystalGooT2 && !enemy.hasStatusEffect("Unarmored") && (pc.hasCock() || pc.hasVagina()) && rand(20) == 0)
	{
		crystalGooSounding(false);
	}
	else
	{
		if (!pc.hasCock() && !pc.hasVagina())
		{
			crystalGooUnsexedLoss();
		}
		else if (pc.hasCock())
		{
			crystalGooDongerLoss();
		}
		else 
		{
			crystalGooVagooLoss();
		}
	}
}

public function crystalGooUnsexedLoss():void
{
	//unsexed, armor-agnostic loss
	//avail. for U with either NPC type, regardless of armor state
	//’hidden’ genitals in tail/nips are discounted
	//gan makes out with PC for a long time to draw genetic material from his saliva, leaves PC a horny wreck
	//if NPC unarmored, out-of-control PC hits max lust early and plants hickeys all over its goopy flesh
	//functions you’ll need a lot: {(armored & type 2)she/(else)it}; {(unarmored)soft/(armored)hard}

	var cgender:Function = function(a:String, b:String):String {
		if (enemy is CrystalGooT2 && !enemy.hasStatusEffect("Unarmored")) return a;
		else return b;
	}

	var carmor:Function = function(a:String, b:String):String {
		if (enemy.hasStatusEffect("Unarmored")) return a;
		else return b;
	}

	if (enemy.hasStatusEffect("Unarmored"))
	{
		output("\n\nThe ganrael blank wobbles as close as it dares before it sits with an ungraceful flop. A hand stretches out, half-grasping and half-warding, until it makes up its mind and reaches into your crotch. The alien searches for a few seconds, and then freezes.");
	}
	else if (enemy is CrystalGooT1)
	{
		output("\n\nThe ganrael continues walking the ring until its face is behind you, and then the scritching gets closer. Its hands touch your shoulders and its face appears next to yours, shushing you softly. The lichen mane");
		if (pc.skinType == GLOBAL.SKIN_TYPE_SCALES || pc.skinType == GLOBAL.SKIN_TYPE_CHITIN)
		{
			output(" brushes your");
			if (pc.skinType == GLOBAL.SKIN_TYPE_CHITIN) output(" chitin");
			else output(" scales");
		}
		else output(" tickles your skin");
		output(" when its arms wrap around your body and start to descend your [pc.chest]. The hands move");
		if (pc.isTaur()) output(" over your flank,");
		if (pc.isCrotchExposed()) output(" to your exposed crotch");
		else output(" into your [pc.lowerGarments]");
		output(".");
	}
	else
	{
		output("\n\nThe ganrael kneels in front of you with her hands folded and stares coolly. At first she appears to be considering but, after ten awkward seconds, you start to wonder if she just wants to pose and be admired. Your mouth opens to ask the question just as she abruptly reaches for your crotch. Looking furtive, you close up again while");
		if (pc.isNude()) output(" her fingers start to search.");
		else output(" she rummages in your [pc.lowerGarments].");
	}

	output("\n\n<i>“You... don’t have anything here,”</i> "+ cgender("she", "it") +" says. <i>“Anything at all.”</i>");
	
	output("\n\n");
	if (pc.isMischievous()) output("These are the moments you live for. You smile wide and stare down the alien.");
	else output("You shake your head.");
	
	output("\n\nThe ganrael rallies. <i>“Well... I’m sure I can find something.”</i> "+ cgender("She", "It") +" extricates "+ cgender("her", "its") +" hand and begins to retrace your torso, watching your reaction. The palm");
	if (pc.biggestTitSize() >= 3) output(" cups your [pc.breast], hefting it and squeezing gently, then");
	output(" slides over your [pc.nipple]. Your reaction when the fingers part around your sensitive nub gratifies the alien, but for some reason "+ cgender("she", "it") +" doesn’t linger there. The exploration continues, slinking over your collar");
	// 9999 {bone}
	output(" and up your neck. "+ cgender("Her", "Its") +" hand passes over your throat, but still continues on. The creature strokes your cheek and then a single finger steals into your mouth");
	if (pc.lust() >= pc.lustMax()) output(". Driven by your fully-stoked lusts, you suck on the digit, coating it with saliva. The ganrael pulls it out and examines it.");
	else output(", swirls a bit, and retreats. The ganrael considers its saliva coating.");
	
	output("\n\n<i>“See,”</i> it coos, leaning into you again. It wipes your saliva");
	if (enemy.hasStatusEffect("Unarmored")) output(" on its chest, leaving a little indent.");
	else if (enemy is CrystalGooT1) output(" on your neck, in a little circle.");
	else output(" between its perfect crystal breasts.");
	output(" <i>“I always find something.”</i>");

	//if not unarmored
	if (!enemy.hasStatusEffect("Unarmored"))
	{
		output("\n\nThe ganrael’s fingers slide through again, two this time, and start to explore in detail. "+ cgender("She", "It") +" finds your tongue, finger-walking its rim and outlining your [pc.lipsChaste] before pulling away to deposit the saliva. This repeats a few more times, but you’re not enjoying yourself very much.");
		if (pc.lust() >= pc.lustMax()) output(" Such unsatisfactory foreplay only cools your ardor;");
		else output(" "+ cgender("Her", "Its") +" efforts are more like a dental exam than lovemaking;");
		output(" luckily, the ganrael seems frustrated by the slow pace as well. "+ cgender("She", "It") +" shifts impatiently, and "+ cgender("her", "its") +" face moves closer.");
		
		output("\n\n<i>“Let’s get more intimate,”</i> your lover whispers. "+ cgender("Her", "Its") +" fingers trace your bottom lip one last time, and then move to the creature’s mask. They hook under the chin and begin to pull. The mask trembles and tears away from the skin, still attached by a few ragged streamers of plasm. Within seconds, the flesh underneath has settled and smoothed, leaving the false face tilted up like a helmet visor.");
	}

	output("\n\nYour lover’s countenance draws up to yours, so close that you begin to recoil. Without warning, a thin line appears where its mouth would be and spreads laterally. A border of raised flesh takes shape on either side. The furrow parts, and the ganrael favors you with an open-mouthed grin before closing it again. "+ cgender("She", "It") +" runs "+ cgender("her", "its") +" finger over your mouth one last time, and you can see the coarse outline of your [pc.lipsChaste] appear on the alien’s own, left to right, as it passes.");
	
	output("\n\n<i>“You like?”</i> "+ cgender("she", "it") +" asks, enunciating to show off. Your mouth opens to answer and the sneaky ganrael kisses you. "+ cgender("She", "It") +" pulls back and nibbles at "+ cgender("her", "its") +" lip. <i>“You taste good...”</i>");
	
	output("\n\n" + cgender("Her", "Its") +" flavor does something to you; subtly sweet with earthy, unrefined notes like wildflower honey, it lingers on your lips, hinting at an enveloping depth of savor if only you could get at it. A little is not enough.");
	
	output("\n\nPassion flaring, you shove your [pc.tongue] into the ganrael’s mouth");
	if (!pc.hasLongTongue()) output(", tasting the alien’s clovery skin.");
	else output(". It lurches through the clovery flesh like a hound tracking game.");
	output(" The alien is momentarily stunned, but adapts. Within seconds, you feel a bud swell in the ganrael’s mouth and produce a slippery, smooth tongue of "+ cgender("her", "its") +" own. "+ cgender("Her", "Its") +" tongue begins fencing with yours, wrangling and trying to slide past to explore your own mouth.");
	// 9999 
	if (pc.hasTonguePiercing() || pc.hasLipPiercing()) output(" The little {piercing} in your mouth fascinates the ganrael; "+cgender("she", "it") +" tries repeatedly to capture the shape, but the gooey flesh is too malleable. It squishes and deforms each time, until the alien reluctantly gives up.");
	
	output("\n\n" + cgender("Her", "Its") +" fingers dance over your chest, brushing your erect [pc.nipples] on their way to pull your waist closer.");
	if (enemy.hasStatusEffect("Unarmored") && pc.biggestTitSize() >= 1)
	{
		output(" It holds you so close that your breasts sink into its chest, making");
		if (pc.biggestTitSize() <= 3) output(" small indentations");
		else if (pc.biggestTitSize() <= 12) output(" big dents");
		else output(" huge holes");
		output(".");
	}
	output(" However good the clingy flesh feels against your own, the body contact is only a distraction from the oral invasion - with a surge, <i>another</i> gooey tendril parts your [pc.lipsChaste]. It seems as if the ganrael liked your tongue so much, "+ cgender("she", "it") +" grew two! The wrangling, slick intruders flank you, caressing your tongue from either side and pushing it around your mouth like overeager dance instructors.");

	if (enemy.hasStatusEffect("Unarmored"))
	{
		output("\n\nYour lust is too much for the low-level lovemaking the ganrael offers, even with its perverted tongue mods; every time its flesh touches your body, another wave of desire breaks over you. Your frustration expresses itself suddenly: the ganrael pulls back from a smooch to let you breathe and you fall on it, tackling it to the cave floor. It smiles when you suck on its neck, and its arms go still. You kiss all over its chest and shoulders - needy, suckling busses - abusing your lover’s skin so much that you cover it in raised ‘hickeys’. The ganrael only laughs as you deform it with tens of tiny bumps.");
	}

	output("\n\nThe alien’s efforts become tamer and tamer as your arousal runs wild until soon, "+ cgender("she", "it") +" just stops. <i>“Okay, all done,”</i> "+ cgender("she", "it") +" says, wiping the most recent saliva with a finger and storing it. <i>“You were so good, sexy.”</i>");
	
	output("\n\nYou stare at "+ cgender("her", "it") +", jaw flapping as you try to turn an outgoing kiss into a demand.");
	
	output("\n\n<i>“I got enough of your seed,”</i> your egregious lover explains, chipper as a stonecutter’s apprentice. <i>“Bye now!”</i>");
	
	output("\n\nYou try to hold "+ cgender("her", "it") +", but the ganrael’s "+ carmor("slimy skin", "smooth plating") +" slips your grasp and "+ cgender("she", "it") +" disentangles "+ cgender("her", "it") +"self. Humming a happy burble, the alien leaves you smoldering with need and wondering if there has ever been a greater gulf between two lovers.");
	output("\n\n");

	//end, no extra time penalty, set lust to 100, no orgasm, maybe lib up to fuck with the player
	processTime(10+rand(10));
	pc.lust(pc.lustMax());

	clearMenu();
	CombatManager.genericLoss();
}

public function crystalGooDongerLoss():void
{
	//penis loss
	//very strongly preferred to vag loss if PC is M or H
	//avail. for either type/armor status; horse-compatible
	//bust: varies
	//gan rides a dick
	//if still armored, gan add’ly maneuvers her plates to pinch the cock pre-orgasm and edge the PC harder
	//always uses cockBiggest if not specified
	//functions you’ll need a lot: {(armored & type2)she/(else)it}; {(unarmored)soft/(armored)hard}

	var cgender:Function = function(a:String, b:String):String {
		if (enemy is CrystalGooT2 && !enemy.hasStatusEffect("Unarmored")) return a;
		else return b;
	}

	var carmor:Function = function(a:String, b:String):String {
		if (enemy.hasStatusEffect("Unarmored")) return a;
		else return b;
	}

	output("\n\nThe ganrael focuses on");
	if (pc.isNude() || (pc.armor is EmptySlot))
	{
		output(" your");
		if (pc.cocks.length > 1) output(" [pc.cocks]");
		else output(" [pc.cockNounSimple]-shaped bulge");
		output(", sliding toward your crotch like home plate");
		if (pc.isNude()) output(" and");
		else output(",");
	}
	output(" kicking your equipment away with a surprising burst of excitement");
	if ((pc.armor is EmptySlot) && !(pc.lowerUndergarment is EmptySlot)) output(" and pulling off your [pc.lowerUndergarment] in a hurry");
	else if (!(pc.armor is EmptySlot)) output(" you with what could charitably be called interest as "+ cgender("she", "it") +" sidles closer. "+ cgender("She", "It") +" disarms you, then searches your armor for fasteners. One hand probing your [pc.lowerUndergarment] bumps against your [pc.cock "+cockIdx+"], and the creature’s demeanor changes dramatically. "+ cgender("She", "It") +" loses all caution, gets right in your face, and pries your [pc.lowerGarments] from you to expose your [pc.cocksLight "+cockIdx+"].");
	
	output("\n\n<i>“I love finding these...”</i> the ganrael hums. <i>“So easy to use.”</i>");
	
	var cockIdx:int = pc.biggestCockIndex();

	output("\n\n"+ cgender("She", "It"));
	if (pc.isTaur()) output(" ducks between your legs and");
	output(" touches your [pc.cock "+cockIdx+"].");
	if (enemy.hasStatusEffect("Unarmored")) output(" The slimy palm glides upward, smearing a wet streak on the [pc.sheath "+cockIdx+"]. Its fingers part around your shaft as they ascend, two on each side, channeling the skin under your crown into a warm, gooey furrow.");
	else
	{
		output(" The cool, hard palm cups your");
		if (pc.balls > 0 && pc.ballSize() > 0) output(" [pc.sack]");
		else if (pc.hasKnot()) output(" [pc.knot]");
		else if (pc.hasVagina()) output(" [pc.vagina]");
		else output(" crotch");
		output(" and then ascends. "+ cgender("Her", "Its") +" fingers part around you and crook upward, rumpling your");
		if (pc.hasSheath()) output(" sheath");
		else output(" skin");
		output(" and dragging your nerves along for a ride. When "+ cgender("she", "it") +" reaches the skin under your crown, the alien rolls "+ cgender("her", "its") +" wrist, massaging and pinching it between parted fingers.");
	}
	if (pc.HP() <= 0) output(" The caresses arouse you and force out a droplet of precum, swelling your [pc.cockNounSimple "+cockIdx+"] until you’re ready to fuck.");
	else output(" Already erect and slick with precum, your [pc.cockNounSimple "+cockIdx+"] swells into a veiny, dribbling tower of fuck.");
	
	output("\n\n");
	if (enemy.hasStatusEffect("Unarmored")) output("The alien releases you, drawing trails of mingled precum and ganrael that stretch and snap in the air. With relish, it tilts your prick forward; your [pc.cockHead "+cockIdx+"] touches the slimy skin of its abdomen and begins to sink in. It stops.");
	else output("The alien releases you, rubbing the crown with a parting stroke. "+ cgender("She", "It") +" leans in, pressing "+ cgender("her", "its") +" sculpted breastplate against your shaft. You slide between the hard teardrops, but just as you resign yourself to receive a titjob from a statue, the ganrael stops.");

	output("\n\n“</i>No...”</i> the alien says, pulling back. "+ cgender("She", "It") +" lowers "+ cgender("her", "its") +" hands below "+ cgender("her", "its") +" abdomen, unintentionally forming a heart shape above where the mons would be. <i>“");
	if (pc.race().indexOf("nyrea") != -1) output("Nyrea like to put it here, don’t you?");
	else if (pc.race().indexOf("myr") != -1 || pc.race().indexOf("zil") != -1) output("Myr like to put it here, don’t you?");
	else output("Instead, here...");
	output("”</i>");
	
	output("\n\n");
	if (enemy.hasStatusEffect("Unarmored"))
	{
		output("The ganrael spreads its legs, pressing its crotch against your [pc.knot "+cockIdx+"]. It glides upwards, frotting your shaft with its empty crotch, until it reaches the tip. Then it slides the last inch, placing your [pc.cockHead "+cockIdx+"] right between its thighs, and descends.");
	}
	else if (enemy is CrystalGooT1) output("The ganrael’s fingers hook into its trunk and it begins to tug gently; the plates slide apart, revealing vulnerable flesh. The creature quivers as it exposes itself, almost as if it were shy. It wriggles closer, closing the last few inches and sinking onto you. Your [pc.cock "+cockIdx+"] twitches as your crown is buried in the wet slit.");
	else output("The ganrael spreads her legs like an impatient whore, and you can already glimpse soft lines of "+enemy.skinTone+" flesh under her armor. Her fingers hook the crotch-covering plate and tug; she shivers and it pulls away, lifting up to expose her. She grabs and pulls you together, impaling herself on your [pc.cockHead "+cockIdx+"]. You barely resist at all.");

	output("\n\nA soft sigh, almost like a fizz, rumbles from the alien. <i>“That’s good,”</i> "+ cgender("she", "it") +" says. "+ cgender("She", "It") +" wraps "+ cgender("her", "its") +" arms around your");
	if (pc.isTaur()) output(" chest");
	else output(" neck");
	output(". Your [pc.cock "+cockIdx+"] is literally shaping its perfect pussy while it penetrates the creature, displacing gooey plasm that streams over your glans and sucks at your [pc.cockColor " + cockIdx + "] skin. Your partner reaches the base of your tool and rests; you can feel flesh pulse and recede as "+ cgender("she", "it") +" shifts "+ cgender("her", "its") +" insides, and then "+ cgender("she", "it") +" begins to climb again.");
	
	output("\n\nThe ganrael’s arms unclasp as "+ cgender("she", "it") +" settles into a rhythm, gaining confidence when your hips join the fun. "+ cgender("Her", "Its") +" hands search for something to do, and end up");
	if (!(pc.upperUndergarment is EmptySlot)) output(" slipping under your [pc.upperUndergarment] to fondle");
	else output(" fondling");
	output(" your [pc.chest].");

	//if PC not horse and has breasts > B, begin species confusion interlude
	if (!pc.isTaur() && pc.biggestTitSize() >= 2 && pc.race() != "nyrea")
	{
		if (pc.hasSkinFlag(GLOBAL.FLAG_CHITINOUS) || pc.skinType == GLOBAL.SKIN_TYPE_CHITIN)
		{
			output("\n\n<i>“You’re a very strange nyrea,”</i> the ganrael comments, confident enough to make pillow talk while "+ cgender("she", "it") +" pinches your nipples. <i>“");
			if (pc.skinTone.indexOf("black") == -1)
			{
				output(" Your coverings are the wrong color.");
				if (!pc.hasCock(GLOBAL.TYPE_NYREA)) output(" And your penis is an unusual shape. Not so bristly...");
				output(" I like it.”</i>");
			}
		}
		else
		{
			output("\n\n<i>“You’re very strange,”</i> the ganrael comments, sliding "+ cgender("her", "its") +" palm over your nipple. <i>“Your");
			if (!pc.hasCock(GLOBAL.TYPE_NYREA)) output(" cock is too nice and");
			output(" your skin is too soft and");
			if (pc.skinType == GLOBAL.SKIN_TYPE_FUR) output(" it’s covered in stuff and");
			else if (pc.skinType == GLOBAL.SKIN_TYPE_SCALES) output(" your coverings are scaly and");
			output(" you smell different. What kind of nyrea are you?”</i>");
		}

		output("\n\nInstead of answering you merely grunt - the alien’s strokes only intensified during the little interrogation and you’re focused on the load about to blow from your [pc.cock "+cockIdx+"].");
	}

	//end species confusion interlude
	output("\n\nThe ganrael’s pace is frightening, now. "+ cgender("She", "It") +" powers up and down your shaft with such vigor that");
	if (enemy.hasStatusEffect("Unarmored")) output(" its fluid body bends from the force and snaps back, giving you brief glimpses of your [pc.cockNounSimple "+cockIdx+"] just below the surface.");
	else output(" "+ cgender("her", "its") +" flesh strains at the plates, bulging through the cracks with every plunge the cum-starved creature takes. Your");
	if (pc.balls > 0 && pc.ballSize() > 0) output(" [pc.sack]");
	else output(" body");
	output(" tenses and prepares to fill "+ cgender("her", "it") +" with seed.");

	//only if armored
	if (!enemy.hasStatusEffect("Unarmored"))
	{
		output("\n\n");
		if (enemy is CrystalGooT1)
		{
			output("The ganrael notices. It hilts on your cock and leans into you, pressing its hands to your");
			if (pc.isTaur()) output(" chest");
			else output(" shoulders and its cheek along yours");
			output(". You’re wondering what it’s trying to convey when you feel a strong pinch on the base of your [pc.cockNoun "+cockIdx+"]. Crystalline legs suddenly clasp around your [pc.ass], locking you in place.");
		}
		else
		{
			output("The ganrael feels your cock twitch");
			if (pc.balls > 0 && pc.ballSize() >= 0) output(" and your balls tighten");
			output(", and settles to await your cum. Or so you’d hoped. As the [pc.cumNoun] races up your cock, you feel a cold, firm pinch on the base where her armored legs clap shut. Her hands join them, gripping your shaft so tightly that nothing can escape.");
		}
		
		output("\n\nYou can’t do anything as the creature’s grip stifles your orgasm - the cum builds painfully behind the clamp, then recedes. "+ cgender("She", "It") +" waits patiently until your mistreated [pc.cockNounSimple "+cockIdx+"] settles. <i>“Once is not enough,”</i> murmurs the ganrael");
		if (!pc.isTaur()) output(" in your ear");
		output(". <i>“I want it all. Every drop you can give.”</i>");
		
		output("\n\nYou don’t have a chance to shrink; "+ cgender("she", "it") +" resumes fucking immediately, sinking your poor [pc.cockNounSimple "+cockIdx+"] back into a mold of warm, sucking goo. Your last orgasm, even ruined, makes it hard to cum again... the pussy’s perfect, sticky shape notwithstanding. Your greedy partner enjoys the handicap immensely, shifting to swirl and drag its movable erogenous zones over your cock-flesh as much as "+ cgender("she", "it") +" pleases. You quietly hope "+ cgender("she", "it") +"’ll let you finish this time, and begin trying to work out an escape plan through the throb of your cock readying a second load.");
	}
	//end armored

	output("\n\nYour");
	if (pc.balls > 0 && pc.ballSize() > 0) output(" [pc.sack]");
	else output(" body");
	output(" tightens, and the ganrael is too enraptured with pleasure to stop the fuck. Pulling a groan from you, your cock");
	if (pc.cumQ() <= 250) output(" splurts a tiny load of [pc.cum] into the creature. "+ cgender("She", "It") +" shivers as the foreign genetic material minges with "+ cgender("her", "its") +" own.");
	else if (pc.cumQ() <= 1000) output(" fires a stroke of [pc.cum] into the creature’s pussy. "+ cgender("She", "It") +" quivers with joy when the foreign genetic materal touches "+ cgender("her", "it") +", and your cock appreciatively unloads several more shots.");
	else
	{
		output(" erupts with an oppressive load of [pc.cum]. The ganrael freezes as so much foreign genetic material hits "+ cgender("her", "its") +" system, too high to move.");
		if (enemy.hasStatusEffect("Unarmored")) output(" Its abdomen bulges with a bubble of [pc.cumColor], swelling so far that the creature is pushed away from you.");
		else output(" Your jizz hits the creature so hard that its plates start to expand, and bubbles of "+enemy.skinTone);
		if(pc.fluidColorSimple(pc.cumType) != enemy.skinTone) output(" filled with [pc.cumColor]");
		output(" press through the cracks.");
	}

	output("\n\nWhen your jizz tapers off, the ganrael shudders and squeezes you tightly,");
	if (!enemy.hasStatusEffect("Unarmored")) output(" compressing you with vise-like plates");
	else output(" covering you in goopy flesh");
	output(". The creature holds you like that for minutes, whispering sweet praise and totally unaware that "+ cgender("she", "it") +"’s cutting off your");
	if (!enemy.hasStatusEffect("Unarmored")) output(" bloodflow");
	else output(" air");
	output(" until you start to pass out. Only when you stop resisting does "+ cgender("she", "it") +" realize something’s amiss and let you go, but by then it’s too late - you slip into a fitful faint with the alien calling at you through a fogbank. When you wake up much later, you’re alone except for a barely translatable scrawl written on your chest in your own semen: <i>“u’re the best”</i>.");
	output("\n\n");

	processTime(220+rand(10));
	
	pc.orgasm();
	if (!enemy.hasStatusEffect("Unarmored")) pc.orgasm();

	clearMenu();
	CombatManager.genericLoss();
}

public function crystalGooVagooLoss():void
{
	//vag loss
	//for vag only - no assholes
	//H should go to dick loss instead
	//available for either encounter and armor state
	//gan infiltrates womb expecting nyrean sperm-cunt, gets frustrated
	//functions you’ll need a lot: {(armored & type2)she/(else)it}; {(unarmored)soft/(armored)hard}

	var cgender:Function = function(a:String, b:String):String {
		if (enemy is CrystalGooT2 && !enemy.hasStatusEffect("Unarmored")) return a;
		else return b;
	}

	var carmor:Function = function(a:String, b:String):String {
		if (enemy.hasStatusEffect("Unarmored")) return a;
		else return b;
	}

	output("\n\nThe ganrael watches you for a bit to make sure you’re disabled, then approaches. "+ cgender("She", "It") +" takes your weapon from you and casts it aside");
	if (!pc.isNude()) output(", then slides a hand into your [pc.armor], finding the fasteners and rendering you as naked as a sunrise in the upper atmosphere");
	output(".");

	//PC resembles a male nyrea (e.g. dark chitin, boobs, vag)
	if ((pc.race().indexOf("nyrea") != -1 && pc.hasVagina()) || (pc.biggestTitSize() >= 2 && (pc.hasSkinFlag(GLOBAL.FLAG_CHITINOUS) || pc.skinType == GLOBAL.SKIN_TYPE_CHITIN) && pc.hasVagina()))
	{
		output("\n\n<i>“Foolish nyrea boy,”</i> "+ cgender("she", "it") +" says. <i>“You left the protection of your enclave, and now your seed is mine.”</i>");

		output("\n\nYou don’t correct the ganrael, transfixed on what "+ cgender("she", "it") +"’s doing.");
	}
	//else goo PC
	else if (pc.isGoo())
	{
		output("\n\n<i>“You need to be punished for hunting in my territory,");
		// (type 1) droplet,
		if(enemy is CrystalGooT1) output(" droplet,");
		output("<i>“ "+ cgender("she", "it") +" says. <i>“I’m going to find your sweet spots and tease them until you beg me for reprieve.”</i>");
		
		output("\n\nYour body quivers at the promise of ‘punishment’.");
	}
	//else other PC
	else
	{
		output("\n\n<i>“You have a very good body,</i>” the ganrael admits. <i>“I’m going to use it until I’m satisfied.”</i>");
	}

	//merge
	output("\n\n"+ cgender("Her", "Its") +" hand creeps to your crotch and cups [pc.oneVagina]. A "+ carmor("goopy", "firm") +" finger presses aside the labia, stroking and testing your hole’s sensitivity and size. The creature seems pleased; "+ cgender("she", "it") +" withdraws the hand, smearing your [pc.clit] with your lubrication on the way up. "+ cgender("She", "It") +" pushes you onto the ground and looms over you.");
	
	output("\n\n");
	if (!enemy.hasStatusEffect("Unarmored") && enemy is CrystalGooT1) output("The ganrael tugs at its abdominal plates with four legs, parting them enough for a tongue of goop to slide out.");
	else if (!enemy.hasStatusEffect("Unarmored") && enemy is CrystalGooT2) output("The ganrael fingers the nubby protrusion of her crotchplate, pulling it away from her skin and revealing a growing bulge.");
	else output("The ganrael’s crotch swells with flesh, distorting into a nascent rod of "+enemy.skinTone+".");
	output(" " + cgender("She", "It") +" presses the bulge to your [pc.vagina], transmitting the sensation of a thick, blunt-tipped rod taking shape.");
	
	output("\n\n<i>“Relax,”</i> "+ cgender("she", "it") +" says.");
	
	output("\n\nThe alien caresses your");
	if (pc.biggestTitSize() < 1) output(" [pc.chest]");
	else output(" [pc.breasts]");
	output(", waiting for you to flinch. You resist as long as possible");
	if (pc.isMischievous()) output(" just to be ornery");
	output(", but when "+ cgender("she", "it") +" pinches your [pc.nipple], your eyes close and your back arches reflexively. The tool nudges aside your labia during the distraction, then thrusts inside you.");
	if (pc.gapestVaginaLooseness() <= 1) output(" It advances slowly in your tight pussy, but the ganrael’s natural lube and selectively-spongy flesh make your penetration a foregone conclusion.");
	else if (pc.gapestVaginaLooseness() <= 3) output(" The tool swells as its owner tests your hole, matching your diameter... and then growing just a bit more for a tight fit.");
	else output(" Your gaping gash takes cock like a starving kaithrit on a chicken farm - the ganrael tries to expand "+ cgender("her", "its") +" tool for a tight fit, but the amount of goop it requires quickly makes the pseudo-phallus unwieldy and "+ cgender("she", "it") +"’s forced to shrink down again.");
	pc.cuntChange(pc.biggestVaginaIndex(), pc.biggestVaginalCapacity()); // 9999
	// {hymen/stretch check
	
	output("\n\n" + cgender("She", "It") +" churns your [pc.vagina], stirring with wide strokes so you have every chance to feel the shaft dragging. The head begins to spread, ciliating into tiny fingers of goo. They search with ticklish thrusts, hunting the walls of your vagina for something.");
	
	output("\n\nThe ganrael’s grunts intensify but "+ cgender("her", "its") +" thrusts also become more awkward. "+ cgender("Her", "Its") +" busy fingers slow down their abuse of your nipple, and "+ cgender("she", "it") +" holds her body at strange angles, scraping every side of your passage. The cilia grow longer and more active until the alien’s pace breaks.");
	
	if (pc.race().indexOf("nyrea") != -1 && pc.hasVagina() || (pc.biggestTitSize() >= 2 && (pc.hasSkinFlag(GLOBAL.FLAG_CHITINOUS) || pc.skinType == GLOBAL.SKIN_TYPE_CHITIN) && pc.hasVagina()))
	{
		output("\n\n<i>“I can’t find your seed, nyrea boy,”</i> "+ cgender("she", "it") +" admits.");

		output("\n\nYou reveal that you don’t have any. The ganrael seems... relieved?");
	}
	else if (pc.isGoo())
	{
		output("\n\n<i>“I can’t find where you’re hiding your sweet spots to punish you,”</i> "+ cgender("she", "it") +" admits.");
		
		output("\n\nYou tell "+ cgender("her", "it") +" that you’re not hiding them - they’re right around the entrance. "+ cgender("She", "It") +" seems surprised by your honesty.");
	}
	else output("\n\n<i>“I got what I need already... but your pussy is really fun,”</i> "+ cgender("she", "it") +" admits.");

	output("\n\nThe interlude ends and the ganrael resumes fucking you, returning to straight, steady thrusts that hilt in your [pc.vagina]. Little bumps move and pulse on the surface of "+ cgender("her", "its") +" cock as its erogenous zones shuffle into position, and the alien shudders when they drag through your ring. "+ cgender("Her", "Its") +" pussy-pounding hits maximum force, buffeting you with the full-body energy of a lover about to finish. Your orgasm lurks just behind your partner’s, tantalizing you with hope that "+ cgender("she", "it") +" can hold on long enough to bring you both off.");

	//if unarmored
	if (enemy.hasStatusEffect("Unarmored"))
	{
		output("\n\nThe alien slathers your");
		if (pc.vaginas.length > 1)
		{
			output(" other puss");
			if (pc.vaginas.length == 2) output("y");
			else output("ies");
			output(" and");
		}
		output(" asshole with tantalizing tongues of plasm every time it plunges in, driving you mad with desire to have");
		if (pc.vaginas.length == 1) output(" it");
		else output(" them");
		output(" filled as well. Your hips rock and shiver against the ganrael on each hilt, trying to get its attention with your empty hole");
		if (pc.vaginas.length > 1) output("s");
		output(". It gradually becomes aware as more goo slops into the receptive, bloomed entrance");
		if (pc.vaginas.length > 1) output("s");
		output(" when the tongues of plasm licked up by your sticky wet passage");
		if (pc.vaginas.length > 1) output("s");
		output(" are an inch high, it pauses with its cock deep inside and grasps your [pc.butt]. The");
		if (pc.vaginas.length == 1) output(" tongue swells and grows");
		else output(" tongues swell and grow");
		output(", producing");
		if (pc.vaginas.length == 2) output(" a");
		output(" perfect cop");
		if (pc.vaginas.length == 2) output("y");
		else output("ies");
		output(" of the blunt-headed pussy probe already wracking you. It starts to pump again.");
	}

	//merge
	output("\n\nThe ganrael begins to hum all over as "+ cgender("her", "its") +" thrusts lose individuality, becoming a parade of perfect strokes designed to put "+ cgender("her", "its") +" sweetest spots right in your tightest clench. "+ cgender("Her", "Its") +" voice crescendoes with passion when "+ cgender("she", "it") +" achieves climax, and "+ cgender("her", "its") +" cock twitches and spreads inside you, released from conscious control to seek out every nook that wants a touch of hot goo. Being filled sets off your own orgasm; your pussy convulses and locks down on the goopy dick");
	if (pc.isSquirter()) output(", adding a gush of your own [pc.girlCum] to the ganrael’s lap");
	output(". The alien’s limbs waver, and "+ cgender("she", "it") +" lowers "+ cgender("her", "it") +"self onto your chest, relieved and released.");

	output("\n\nYou slip into a doze as well. At some point during your strange dream, the alien’s");
	if (!enemy.hasStatusEffect("Unarmored")) output(" cock slides");
	else output(" cocks slide");
	output(" out of you with one last wet lick, giving your visions a randy sexual note.");
	output("\n\n");

	//pass time, penalties, orgasm, etc.
	processTime(30+rand(10));
	pc.orgasm();

	clearMenu();
	CombatManager.genericLoss();
}