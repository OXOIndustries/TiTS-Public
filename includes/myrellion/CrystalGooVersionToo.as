public function crystalGooEncounterType1():void
{
	var tEnemy:Creature = new CrystalGooT1();

	// First time with a type 1 (type 2 tracked separately)
	if (flags["CRYSTALGOO_T1_ENCOUNTERS"] == undefined)
	{
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

		output("<b>It’s a fight!</b>");
	}
	// Repeat
	else
	{
		output("When you move through this area, one of the lichenous rocks makes more noise than rocks are generally known for. You scan the surroundings, trying to pick out the lurking enemy that you know is there. For a tense moment, nothing moves - even the insects seem to stop crawling and watch.");

		//make a combined int/aim check to determine if PC detects enemy (copy to/from attack 3, ‘false retreat’) 9999
		if ((pc.aim() + pc.intelligence() + rand(60)) / 4 > (tEnemy.aim() + tEnemy.intelligence()))
		{
			output("\n\nA twitching fungus alerts you to its location.");
			if (pc.rangedWeapon is EmptySlot)
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
			if (pc.race().indexOf("nyrea") != -1) output(", nyrea");
			else if (pc.race().indexOf("myr") != -1 || pc.race().indexOf("zil") != -1) output(", myr");
			else if (pc.isGoo()) output(", droplet");
			output(",”</i> the alien sneers, covering the chip you made with its hand. It assumes a defensive posture and advances again with serpentine menace.");

			//go to fight
			//begin fight with 11 points of damage on enemy shield if armed, else 3 if unarmed (wibble the numbers with RNG if you feel like it)
			output("<b>It’s a fight!</b>");
		}
		else
		{
			output("\n\nThough you try, you can’t detect the predator before it’s on you. A stripe of lichen rears up, revealing a ganrael ambusher! It grabs and you raise your [pc.meleeWeapon], trying to intercept it.");

			if ((pc.reflexes() + rand(30) + 1) / 2 > tEnemy.reflexes())
			{
				output(" Your blow lands dead center, sending the ganrael’s charge off-course. It recovers in a rolling slither of loops while spitting what you imagine are curses.");
				if (!(pc.meleeWeapon is EmptySlot)) tEnemy.shieldsRaw -= 17;
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

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters(pc);
	CombatManager.victoryScene();
	CombatManager.lossScene();
	CombatManager.setHostileCharacters(tEnemy);
	CombatManager.displayLocation("CRYSTAL GOO");

	clearMenu();
	addButton(0, "Next", CombatManager.beginCombat);
}