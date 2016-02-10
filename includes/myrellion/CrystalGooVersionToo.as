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
	CombatManager.victoryScene(pcDefeatsCrystalGooToo);
	CombatManager.lossScene();
	CombatManager.setHostileCharacters(tEnemy);
	CombatManager.displayLocation("CRYSTAL GOO");

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
			if (pc.HP() <= 0 || pc.lust() >= pc.lustMax) nameStr = "DEFEAT:\n";
			if (enemy.HP() <= 0 || enemy.lust() >= enemy.lustMax()) nameStr = "VICTORY:\n";
			else nameStr = "FIGHT:\n";

			if (enemy is CrystalGooT1) nameStr += "AMBUSHER";
			else nameStr += "DEADEYE";
		}
		else
		{
			if (enemy is CrystalGooT1) nameStr = "GANRAEL\nAMBUSHER";
			else nameStr = "GANRAEL\nDEADEYE";
		}
	}
	else
	{
		if (!wasFight) showName("CRYSTAL\nGOO");
		else showName("FIGHT:\nCRYSTAL GOO");
	}
}

public function pcDefeatsCrystalGooToo():void
{
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
			addDisabledButton(0, "F. Sculpt", "Sculpt the goo", "Shape your lover into a big-breasted, wide-hipped sex bomb and fuck it.");
			addDisabledButton(1, "M. Sculpt", "Sculpt the goo", "Shape your malleable lover into a big-dicked masculine stud and ride it.");
		}
		else
		{
			output("\n\nThe ganrael quivers when you reach out a hand but doesn’t flinch, suggesting that it won’t resist being shaped however you like... and that it’s excited.");
			addButton(0, "F. Sculpt", crystalGooSculptingFem, undefined, "Sculpt the goo", "Shape your lover into a big-breasted, wide-hipped sex bomb and fuck it.");
			addButton(1, "M. Sculpt", crystalGooSculptingMale, undefined, "Sculpt the goo", "Shape your malleable lover into a big-dicked masculine stud and ride it.");
		}
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
	}

	addButton(14, "Leave", );
}

public function crystalGooSculptingMale():void

{
	clearOutput();
	showCrystalGooToo();

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
		
		output("\n\n<i>“Never done...”</i> your ganrael gasps, <i>“... never happened so fast before.”</i> He reaches a hand out to you and laces his goopy fingers with yours. <i>“Amazing.”</i>");
		
		output("\n\nThe other reaches as well, petting at your swollen, aftershocking [pc.cocksNounSimple]. You pull back quickly before your naive child can touch it; it changes focus to the sculpted rod on your alien lover instead. You collect your things while watching, feeling strange urges that encourage you to hurry.");
	}
	else
	{
		output("\n\nIt takes him a minute to recover from his jellifying - he apologizes and regains the masculine ideal while his cock surges in reverse inside you, scraping your ridges as it slides out. You pet his chest, too tired to");
		if (!pc.isAss()) output(" pretend to");
		output(" punish him for something you secretly enjoyed. He holds you until you decide to get up; when you leave, he continues to recline, enjoying your genetic material.");
	}
	//end, time, lust, rewards

	pc.orgasm();
	processTime(20+rand(10));

	clearMenu();
	CombatManager.genericVictory();
}

public function crystalGooSculptingFem():void
{
	clearOutput();
	showCrystalGooToo();

	You address the vulnerable creature. {(bimbro)“So, like... can you hold any other shape?” /(nice)“Are you prepared for this? You look too fragile.” /(misch)“I always loved playing with modeling clay. My penis-shaped ashtray collection was huge.” /(mean)“You look like a child. Take some other form.” }

Its featureless face turns toward you. “Whatever you like, {(nyrea or nyrean criteria above)nyrea/(myr or zil)myr/(goo)droplet/(else)strange one},” its voice resonates. It holds its arms apart, displaying its body. “Show me what arouses you.”

That’s exactly what you wanted to hear. You fix the lover you want in your mind while you strip and set your [pc.gear] aside. The alien’s waif chic is leagues away from the wide-hipped, boob-dacious sexpot of your dreams, but when you place your naked palm on its body, it leans in. Warm plasm shifts under your fingers, waiting for you to share your muse.

You cozy up until you can feel its mild body heat. Its mannequin face is the farthest from your ideal. Eyes closed, you kiss the alien deeply, feeling it quiver, then pull away with a fierce love bite. Another kiss, and another bite. The marks settle into a pair of full, plump lips - you nudge them into shape with your finger, glad the creature understood your cues, and it smiles. Like a creeping dawn, the full potential your obedient lover warms you to your work. You push at its face with your thumbs, giving it a pair of cheekbones, then a cute nose, two large, expressive eyes, and sleek ears.

“Is this what you like?” the creature asks sweetly, smoothing and unifying its hand-hewn features.

No, not yet. You bury your hands into the ganrael’s scalp and pull. Using your fingers as both comb and brush, you tease its bare head, picturing a voluminous set of curls that would look at home in any {cosmetics} commercial. The ganrael shivers and touches its lips as you produce strand after strand of slippery coiffure, enjoying the creative act as much as you are. When you finish, the creature’s head is crowned with a goopy drape of luxurious hair.

You admire your efforts, then look lower. The alien’s neckline is a bit masculine, so you push its shoulders down, then pinch two thick ridges to give it elegant collarbones. Its neck vibrates under your touch - the creature is humming and you realize that you were too, engrossed in your erotic work.

The next act gives you an anticipatory tingle. Cupping your palms to the creature’s chest, you issue the order: “Fill.”

The ganrael giggles, then thrusts its chest forward and begins to concentrate. The gooey skin burgeons and expands, filling the cups. You move your hands, and the ganrael understands - it fills the cups again while you continue raising the bar, wondering when you should stop. It swells past C-cup, then D-cup, DD... E... F....

The creature’s growth slows between G- and H-cup, and you can see its chubby legs and arms thinning as it runs out of easy flesh to retrieve{(misch). You consider continuing until it’s just a head and a pair of giant tits, but /(else), so you }let it rest, satisfied with its enthusiasm. It definitely doesn’t look like a mannequin anymore, with its pornstar rack and dick-sucking lips. You mentally rechristen it a ‘she’.

“Oh, my,” the new ganrael girl sighs, swaying her chest and watching the massive breasts swing. “So you like this? You like big?”

Your blood stirs from the gorgeous globes jiggling in your face, but you merely grasp a breast and kiss it deeply. You nip at the flesh with your teeth, pulling it just enough to make a little point, then trace the ganrael’s new nipple with your tongue. She shudders and sighs, wrapping her arms around you to bring the other breast close for its turn.

You’re so cranked up by this point that {(cocks)[pc.eachCock] could hold up a shipping container by itself, /(vagOrAss)your [pc.vagOrAss] could win a floriculture ribbon for ‘Best Bloom’, }and you move on from the breasts of your dreams before you blow your wad. The ganrael slumps when your lips depart, but smiles again when your hands press on her sides, parenthesizing her midsection into a curvy waist and then punctuating it with one finger for a belly button. She giggles.

“It’s cute, but what does it do?” the gooey girl asks, exploring her new navel.

In a sweat to pluck the fruit of your labors, you lump her plasm into a bootylicious, heart-shaped ass, caressing the perfect half-spheres, then pull them into a pair of wide hips and funnel down juicy thighs and sculpted calves. You take a bit more care on her feet, giving her a set of cute toes, but she doesn’t have the fine control for them - they maintain their outlines but gloop and stick back together. It doesn’t matter. You’ve already moved on to sex in your head, and your body rises automatically into position. The ganrael shudders in anticipation.

“All done playing?” she guesses.

//cock ending - probably preferred where eligible
You grunt like a beast and fall upon the girl, sliding a hand up her thigh to her crotch. The ganrael squirms and moves her own to cover it, squeezing her knees together. Your middle finger begins to rub out a furrow; her hand strokes yours, and her arm pushes her breasts against your cheek when it does. Happy with the labia you’ve made, you press in on the center of her putative pussy, poking deep. Your other hand strokes [pc.oneCock], and the ganrael notices. She shivers hard, and the flesh around your finger recedes as she shifts to fit your [pc.cockBiggest].

“Are you going to cum inside now?” she asks, lying back and opening her thighs. Her goopy hair flows along the ground until her face is framed by a rippled bay of {npc color} waves. “I love it when you cum inside.”

Lust to take your lover burns in you. Her pussy swallows your [pc.cockNoun] like a lubricated onahole, and she bites her new bottom lip while you bury yourself to the hilt. She doesn’t utter a cross word when you skip ramping up, hooking her goopy hands under her knees and spreading wide for your furious pounding. Her whole fluid form ripples with your influence; little ridges travel her surface with every thrust, colliding and dissipating.

You can barely endure the hot, form-fitting sleeve that wraps around your penis... your foreplay was too effective. Tamping it down with force of will is all you can do to enjoy the female ideal as long as possible. The effort is so titanic and so doomed - you’re already orgasming but holding the cum inside with your pelvic muscles, and the ganrael senses it by your awkward movement. She folds her goopy legs around your back with a sly smile. They wouldn’t be solid enough to stop you sober, but now, battling climax, you can’t escape. She stares at you innocently, as if not conscious of her trick, and your orgasm slips free.

//big cum only
The slip turns into a surge as your {(PC not weeaboo race)massively modified }body pushes out a spectacular load of [pc.cumNoun]. The ganrael’s legs slacken when the first wave sloshes in. Her hourglass waist bulges with lumps of spooge and your messy ejaculation flogs her make-do pussy out of shape; not a drop spills back out because she’s so drunk on your sauce that she’s given up all control of her form. Her made-to-order breasts spread apart as the cum forces further up her torso, and continue to migrate until the last stroke of sperm exits your gawping cock.

“Oooohh... so much...” she moans. “Ooh, nooo, it’s happening already!” Her distended stomach begins to churn, spreading [pc.cum]. You pull your [pc.cockNounSimple] free, shivering from the new movement inside her body. The ganrael’s color mingles with your seed’s, and her stomach smushes flat, sending chubby waves down every limb. Her body swells double and then stretches upwards, like the top half is trying to sit up while the bottom wants to lie flat. She groans as a furrow forms and her front pulls away into a second body that climbs out of the first, a busty beauty exiting a bimbo-shaped bathtub. The new body rolls off, making a full tumble to lie spread eagle as well.

“Ssso intense...” the original body slurs. “So much seed... already made....” The new body - your offspring with her? - took not only her cum-stained color but also her face and breasts with it when it split off, leaving her once-again blank aspect framed by luxurious curls. She sits up on her leftover bubble butt, holds her goopy knees, and sighs. “You’re... you’re just great. That’s neverr... happened to me before.” The new offspring begins to explore the globes its mother gifted it, pressing its beautiful breasts under its hands and arousing very strange feelings in you.

“I’ll remember you,” your lover says, when you shake off and begin to collect your things. Both the ganrael and her daughter are contaminated all over with your shade of [pc.cumColor] and caressing themselves, intoxicated by you. It’s difficult to leave, but you tear yourself away.

//else not big cum
{(li’l cum)The ganrael shudders as scant few beads of [pc.cum] touch her plasm. Her stomach spasms, smearing the clean [pc.cumColor] droplets into blurry messes to better mingle them with her body. /(med cum)[pc.Cum] lances from your cock, disfiguring the ganrael’s perfect midriff with slashes of [pc.cumVisc] [pc.cumColor] slop. The girl shakes with tremors from the foreign genetic material, grasping her stomach with both hands so hard that her fingers sink in. A long, rolling sigh of delirium percolates all over, vibrating the goopy flesh on its way out. }

“Even better than I hoped,” she slurs, tracing a line on her stomach to wick cum through her body. “{(nyrea)You’re so much better than the other nyrea... /(myr or zil)Imagine finding a myr like you down here... /(goo)I’ve never felt this way about my own kind before... /(else)I don’t know what you are, but... }I could drink you up all day.”

Her velvety hands slide up your chest but you pull away before she can wrap herself around any tighter, easily breaking her leg-lock now. She continues to reach until you pull free of her clingy, semen-smeared cunt, and then gives up and flops over, completely lushed on your jizz.

//merge cock branch and end
//time, rewards, orgasm, etc.

//vag tribadism ending
//start the skin harvest
You shiver. The girl reclines, and you part her thighs violently{(legs). Spreading your own legs, you /(no legs to spread), then }press your [pc.vaginas] against her. With each roll of your hips, her warmth parts and flows, building furrows around your labia that cling and caress. You ride her for minutes, {legs laced together and }getting hotter and hotter, before you notice what she’s doing. Her crotch is shifting with every pass into a coarse-grained copy of your own. The flattery inspires you to rub harder.

Her puss{y/ies} quake under your punishing tribadism, always springing back for the next push. The slippery lips slide perfectly though yours, tickling your clit{s} on each pass while your own labia drag against the alien’s nub. Your orgasm dangles just beyond your grasp. The maddening pleasure spurs you on; you chafe so hard that her hips deform, growing wider and moving further up her torso as you literally grind on her. Before you can scissor her in half, you cum.

{(no/low squirt)[pc.EachVagina] spasms and sucks at her labia, shivering your lower back into a tense clench. You’re helpless in the grip of orgasm, but the inexperienced ganrael continues to rub, tickling your achingly sensitive clit{s} with her slippery, soft lips. Your eyes roll as your pleasure is boosted to the next level by the callow alien. /(squirter)[pc.EachVagina] gushes like a broken dam, flooding its mirror with your [pc.girlCumNoun]. The ganrael shakes with pleasure as her crotch becomes a soup of mingled fluids and the ground a sodden swamp. }When your back finally unlocks, you pull away from the greedy ganrael.

“That was fun,” she sings out, lowering a hand to frig her new cunt. “We should play this game again.” Watching the ideal woman play with her slick pussy is stirring tempting urges. You turn away and gather your things before you lose any more time here, but pocket her suggestion for later.
//end vag branch
//time, lust, rewards, etc.

//unsex ending
You smile. The girl tilts her head curiously.

“{(nice)Could you make one of these?/(else)Make one of these,}“ you beckon, pointing to your mouth. She leans in, and you {stick out your tongue. /uncurl your long tongue. }

The ganrael obeys, dribbling goo between her lips until she has a [pc.tongue] of her own, accurate in every detail{(skin color mismatch) but color}. She {(short)waggles it /curls it in an obscene, rolling wave }while she waits for your next instruction. Your pulse hammers at your temples, and your [pc.asshole] screams for her stimulation.

You turn around, {(horse)backing your pucker toward her. /(else)spreading your anus wide with your fingers. }The girl’s hands press to your [pc.ass] and she dives in without hesitation; the big, jiggly breasts you made together squish against your [pc.thighs] when she buries her face in your pucker like she’s trying to squeeze inside. {(loose ass)She almost does it, so stretched-out is your backdoor - you can feel the girl’s face contort on the edge of your ring as her tongue slides up your rectum. /(else)Picturing it gives you a giddy thrill - you fantasize about loosening your asshole enough to smuggle her off-planet and keep her as a lover. }

The foreplay did its job too well; you’re almost ready to cum, and she just started licking. Her tongue spirals inside you, abandoning its shape to scrape and stick to your nerves as she collects the genetic material she wants from your well-lubed hole.

With {buckling knees/a quivering collapse}, you orgasm, shoving your ass into the girl’s face and wringing her tongue. She waits patiently, rippling and rolling her plasm while your body unkinks, until your climax fades. Panting, you slump over, dragging her stretchy extension with you. She yanks it back into her mouth like a chameleon.

“You’re a fun {nyrea/myr/(goo PC)droplet/stranger},” says the ganrael, leaning down and finally kissing you back. “Bye now.”
//end, lust, time, rewards
}