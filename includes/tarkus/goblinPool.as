import classes.Items.Transformatives.Goblinola;

/* Arbetz Travel Agency */

// Ideas/Plans
//	*Two squares to the north west of Novahome. Cultural separation from the raskvel.
//	*Got a beam of good weather transmitted by a terraforming satellite following it around.
//	*Baroness Una is your exposition monkey. She's not a nice person.
//	*Space left for possible expansioneering later.

// Tarkus descriptions
public function tarkusBeachAddendum():Boolean
{
	clearOutput();
	
	output("Gurgling faintly to the west, a sea of sludge, filth, and corruption laps against a oily beach. Here, the pollution is not quite so bad, but it’s still thick enough to make the flaky “sand” clump together around your [pc.feet]. You can go west or south if you want to experience the pollution firsthand. Otherwise, the Nova’s fore is visible a few minutes to the east, dangling reddish stalactites off its chin.");
	
	if (flags["ARBETZ_ENTERED"] == undefined)
	{
		output("\n\nTo the north, up a rise and looking across the oil sea is a large, white stone building, surrounded by lush, green, well-manicured plants and a high wall. There is script above its bronze gate, but it’s in an alien tongue and you have no idea what it says.");
		
		// Lock the place out if you dunno what a gabilani is...
		if (!CodexManager.entryViewed("Gabilani"))
		{
			flags["NAV_DISABLED"] = NAV_NORTH_DISABLE;
			output("\n\nCould it be a warning sign? <b>Your Codex identifies it as gabilani script. Perhaps you ought to read their Codex entry before blundering ahead?</b>");
			CodexManager.unlockEntry("Gabilani");
		}
		else
		{
			// Intelligence 30%:
			if (pc.IQ() >= 30) output(" You open your codex and point it at the gate. <i>“Arbetz Travel Agency,”</i> it pronounces smoothly. <i>“Written in gabilani.”</i>");
			output(" The air here feels pleasantly damp and temperate in comparison to the harsh winds that sandpapers your [pc.skin] elsewhere. All in all, it’s a remarkable sight in this dead, dry wasteland.");
		}
	}
	else
	{
		output("\n\nTo the north you can see the metal archway leading to the white stone of Arbetz Travel Agency, surrounded by its small, manicured oasis.");
	}
	
	return rustCoastEncounters();
}

public function isSwimsuit(outfit:ItemSlotClass):Boolean
{
	// Special items that have this flag will double as swimwear/swimsuits.
	if (outfit.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR)) return true;
	
	return false;
}

public function showUna(nude:Boolean = false):void
{
	if (flags["UNA_MET"] != undefined) showName("\nUNA");
	else showName("GABILANI\nWOMAN");
	if (!nude) showBust("UNA");
	else showBust("UNA_NUDE");
}
public function arbetzTotalFucks():Number
{
	var count:Number = 0;
	
	if (flags["ARBETZ_SEX_ORAL"] != undefined) count += flags["ARBETZ_SEX_ORAL"];
	if (flags["ARBETZ_SEX_ONE_BOY"] != undefined) count += flags["ARBETZ_SEX_ONE_BOY"];
	if (flags["ARBETZ_SEX_TWO_BOYS"] != undefined) count += flags["ARBETZ_SEX_TWO_BOYS"];
	if (flags["ARBETZ_SEX_HATE_FUCK"] != undefined) count += flags["ARBETZ_SEX_HATE_FUCK"];
	
	return count;
}
public function arbetzActiveHours():Boolean
{
	// Business hours: 9AM - 9PM
	if (hours >= 9 && hours < 21) return true;
	return false;
}

public function arbetzMainApproach():Boolean
{
	clearOutput();
	author("Nonesuch");
	
	// Key item typo hotfix:
	if (pc.hasKeyItem("Arbetz Travel Agency Memebership"))
	{
		pc.removeKeyItem("Arbetz Travel Agency Memebership");
		pc.createKeyItem("Arbetz Travel Agency Membership", 0, 0, 0, 0, "");
		output("<b>Your codex beeps, proclaiming that your Arbetz Travel Agency Premium Klub membership card has been renewed.</b>");
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return true;
	}
	
	// Pool locks
	if (!pc.hasKeyItem("Arbetz Travel Agency Membership") || !arbetzActiveHours()) flags["NAV_DISABLED"] = NAV_NORTH_DISABLE;
	
	// Intros
	if (arbetzActiveHours())
	{
		// First
		if (flags["ARBETZ_ENTERED"] == undefined)
		{
			showBust("UNA", "PETR");
			
			flags["ARBETZ_ENTERED"] = 1;
			
			output("You approach the bronze gate and find them unlocked. You notice several gun-metal spherical security cameras barnacled to the walls keeping a close eye on you, but nothing stops you opening the gate, traveling up the pebble path and stepping inside the building proper.");
			output("\n\nThe airy, summery, lounge-like room you find yourself in is largely unoccupied. Behind a desk in front of you, a curvy, turquoise-skinned female gabilani is talking into a clunky-looking interface device whilst stabbing her fingers irritably into an antique keyboard.");
			output("\n\n<i>“ - telling you that no such clause exists! If your son was stupid enough to ride an open-air bi-walker into a sydian enclave - yes, I will take that tone with you - ”</i>");
			output("\n\nThere’s a human lad operating a similar computer next to her in a distinctly more laid-back fashion. Beyond the desk you can see out into the back of the estate, which is as green as the front and has a swimming pool, alongside of which a male kaithrit is lounging. The two boys are lithe, bronzed and unashamedly dressed only in tight shorts. They, along with the warm, fresh air, give the place the atmosphere of an out-of-season holiday resort.");
			output("\n\n<i>“Fine! Absolutely! Take it to High Command! They’ll tell you exactly the same thing! Have a good day! You stupid cow,”</i> adds the gabilani, after she’s flung the headset down. Her over-stuffed bust quivers slightly. She snaps a finger at you. <i>“You! Welcome to Arbetz Travel Agency! What do you want?”</i>");
			
			processTime(5);
			
			// [Where?] [Aid]
			clearMenu();
			addButton(0, "Where?", arbetzMainInitialOptions, 0, "Where are you?", "Ask about this place.");
			addButton(1, "Aid", arbetzMainInitialOptions, 1, "First Aid", "Ask for some help.");
			return true;
		}
		// Repeat
		else
		{
			if (!pc.hasKeyItem("Arbetz Travel Agency Membership")) output("You approach the bronze gate and, finding it unlocked, slip inside.");
			else output("You approach the main building and step inside.");
			
			// Happens once per day for an hour at random:
			if (flags["UNA_MET"] != undefined && !pc.hasStatusEffect("Arbetz Busy Hour") && !pc.hasStatusEffect("Arbetz Busy Cooldown") && rand(50) == 0)
			{
				pc.createStatusEffect("Arbetz Busy Hour", 0, 0, 0, 0, true, "", "", false, 60);
				pc.createStatusEffect("Arbetz Busy Cooldown", 0, 0, 0, 0, true, "", "", false, 1440);
			}
			if (pc.hasStatusEffect("Arbetz Busy Hour") && pc.hasStatusEffect("Arbetz Busy Cooldown"))
			{
				showBust("UNA", "GABILANI_MALE", "GABILANI_FEMALE");
				showName("\nRUSH HOUR");
				
				output("\n\nThe agency’s foyer is absolutely thronged with gabilani and their luggage. A high, unpleasant petro-chemical scent is in the air, and through the patio doors you can see a clunky, metal module looming beyond the swimming pool, undoubtedly used to transport these green-skinned tourists down to Tarkus’s surface. They are talking excitedly amongst themselves, showing off their cybernetic enhancements and traveling gear to one another; a couple take the opportunity of your entrance to take a picture of you. Una is stood on top of the front desk gesticulating angrily, her querulous tones piercing the hubbub as she attempts to organize her kindred into different parties, with little obvious success.");
				output("\n\nYou should probably come back later.");
				
				processTime(5);
				
				clearMenu();
				addButton(0, "Next", arbetzMainInitialOptions, -1);
				return true;
			}
			
			// Standard:
			else
			{
				showBust("UNA", "PETR");
				
				// 20% chance of proccing when PC approaches front desk
				if (flags["UNA_MET"] != undefined && (flags["ARBETZ_SEX_ONE_BOY"] != undefined || flags["ARBETZ_SEX_TWO_BOYS"] != undefined) && rand (5) == 0)
				{
					output("\n\nThe agency’s foyer is");
					if (pc.hasStatusEffect("Arbetz Busy Cooldown")) output(" a bit active, though not as busy as it was earlier. Everyone seems to have found their place and the staff looks quite relaxed, namely Una.");
					else output(" its usual quiet self. Even Una looks more laid-back than usual.");
					output(" She’s leant back in her chair and gazing with a big smirk at her screen, not doing anything.");
					output("\n\n<i>“Hmm?”</i> she drones languidly when you approach her desk. <i>“Oh, hello you. How nice to see you again.”</i> The gabilani’s eyes return to the screen, leer widening. <i>“Very nice.");
					
					var boysBlurb:Array = [];
					// having had sex with 1 boy:
					if (flags["ARBETZ_SEX_ONE_BOY"] != undefined) boysBlurb.push(" You’ve such a vigorous personality, haven’t you, [pc.name]? Ooh, goodness me. I’m going to have to try that myself some time.");
					// had sex with 2 boys:
					if (flags["ARBETZ_SEX_TWO_BOYS"] != undefined) boysBlurb.push(" Everyone appreciates having such an, um... generous, accommodating person like you around. Ooh, goodness me. We aren’t daddy’s special angel anymore, are we?");
					
					if (boysBlurb.length > 0) output(boysBlurb[rand(boysBlurb.length)]);
					
					output("...”</i>");
				}
				// PC had sex with her/the boys:
				else if (flags["UNA_MET"] != undefined && arbetzTotalFucks() > 0)
				{
					if (pc.hasStatusEffect("Arbetz Busy Cooldown")) output("\n\nThe agency’s lobby is still a little active, though not as busy as it was earlier. Everyone has found their place and the staff doesn’t appear to have their hands full.");
					output("\n\n<i>“What is it? Oh it’s you again.”</i> Una slaps down her pen, but she’s smirking, and there’s a fair bit of sly affection in her showily exasperated tone. <i>“Here to waste even more of our valuable time, are we?”</i>");
				}
				else
				{
					showBust("UNA", "PETR");
					
					if (pc.hasStatusEffect("Arbetz Busy Cooldown")) output("\n\nThe agency’s lobby is still a little active, though not as busy as it was earlier. Everyone has found their place and the staff members don’t appear to have their hands full.");
					output("\n\n<i>“What is it? Oh, it’s you again.”</i>");
					if (flags["UNA_MET"] != undefined) output(" Una");
					else output(" the turquoise-skinned shortstack");
					output(" slaps down a pen and gazes at you witheringly. The bare-chested young man back there with her snickers. <i>“What do you want this time?”</i>");
				}
				
				processTime(2);
				
				// If left the first time
				if (flags["ARBETZ_ENTERED"] == 1)
				{
					clearMenu();
					addButton(0, "Where?", arbetzMainInitialOptions, 0, "Where are you?", "Ask about this place.");
					addButton(1, "Aid", arbetzMainInitialOptions, 1, "First Aid", "Ask for some help.");
					addButton(14, "Leave", arbetzMainInitialOptions, -1);
					return true;
				}
				
				arbetzMainMenu(true);
			}
		}
	}
	// Approach outside business hours:
	else
	{
		output("You approach the bars of the bronze gate and give them a prospective rattle. Locked. Presumably ");
		if (flags["UNA_MET"] == undefined) output(" whoever is inside");
		else output(" Una and her staff");
		output(" are done for the day.");
		
		processTime(2);
	}
	
	return false;
}

// Initial Options
public function arbetzMainInitialOptions(response:int = 0):void
{
	clearOutput();
	author("Nonesuch");
	
	// Aid
	if (response == 1)
	{
		showUna();
		
		// HP less than 90%:
		if (pc.HP() < 90)
		{
			output("Gesturing");
			if (pc.HP() < 20) output(" pathetically at your grievous");
			else output(" at your");
			output(" wounds, you say you were hoping you to get some first aid here.");
		}
		// Otherwise:
		else
		{
			output("You say you saw the place, and were hoping you might be able to pick up a few supplies here.");
		}
		
		output("\n\n<i>“Does this look like a pharmacy to you?”</i> snaps the gabilani. <i>“We don’t give medical attention to our clients in 90% of non-lethal circs, so why do you think we’d give it to just any scruff-bag traveler who decided to stroll in? If you’re looking for a hand-out you’re talking to the wrong bloody people, so kindly push off.”</i>");
		
		processTime(2);
		
		clearMenu();
		addButton(0, "Where?", arbetzMainInitialOptions, 0, "Where are you?", "Ask about this place.");
		addDisabledButton(1, "Aid");
		addButton(14, "Leave", arbetzMainInitialOptions, -1);
	}
	// Where?
	else if (response == 0)
	{
		showBust("UNA", "PETR", "GODI");
		
		output("<i>“What is this place, exactly?”</i> you ask.");
		output("\n\n<i>“Arbetz. Travel. Agency,”</i> says the short, turquoise-skinned woman slowly, as if talking to an infant. <i>“What do you think it - ”</i> she stops, and massages her temples with closed eyes for a couple of moments. <i>“Sorry. It’s not your fault I’m the one stuck down here, explaining this over and over. I’ll give you the spiel, shall I?”</i> She pats her bunned-up black hair and straightens her back before going on.");
		output("\n\n<i>“I am A.T.A.’s shore-side rep, Baroness Doridia Aachen’Dedz Una Condinted. You may call me Una. We handle the logistics of gabilani mandated by the Hale and Heart Decree to travel to Tarkus, and those who simply wish to spend time drinking in the rugged beauty of our homeland.”</i> Her tone fairly cascades sarcasm.");
		output("\n\n<i>“We offer sightseeing tours, leisure cruises, safaris and hunting expeditions for the more adventurous in the Arbetz region, all carefully catered to meet each customer’s needs and budget. Clear now? Good!”</i> She returns to her computer without waiting for your response. <i>“So unless you’ve got official business with us, or want to go on an oil-boat cruise with a gaggle of elderly gabilani rubberneckers, go away.”</i>");
		output("\n\nThe young man behind the desk has blanked you this entire time, but going off his smirk he’s clearly enjoying listening in to this exchange.");
		
		processTime(5);
		
		flags["UNA_MET"] = 1;
		flags["ARBETZ_ENTERED"] = 2;
		
		//standard options bar unlocked
		arbetzMainMenu();
	}
	// Leave
	else
	{
		flags["NAV_DISABLED"] = undefined;
		move("225");
	}
}

// Main Options
public function arbetzMainMenu(light:Boolean = false):void
{
	// [Talk] [Appearance] [Pool Area] [Sex] [Leave]
	if(!light) clearMenu();
	addButton(0, "Talk", arbetzMainOptions, 0);
	if (flags["PETR_UNLOCKED"] != undefined) addButton(1, "Petr", arbetzPetrShop, undefined, "Petr", "Ask the human boy about buying some swimwear.");
	if (!pc.hasKeyItem("Arbetz Travel Agency Membership")) addButton(2, "Pool Area", arbetzMainOptions, 2, "Pool Area", "Ask if you can use the pool area at the back of the agency.");
	if (flags["ARBETZ_SEX_UNLOCKED"] != undefined)
	{
		if (pc.lust() >= 33) addButton(3, "Sex", arbetzMainOptions, 3);
		else addDisabledButton(3, "Sex", "Sex", "You are currently not aroused enough for that!");
	}
	addButton(5, "Appearance", arbetzMainOptions, 1);
	if(!light) addButton(14, "Leave", mainGameMenu);
}
public function arbetzMainOptions(response:int = 0):void
{
	clearOutput();
	author("Nonesuch");
	
	// Appearance
	if (response == 1)
	{
		showBust("UNA", "PETR", "GODI");
		showName("ARBETZ\nTRAVEL AGENCY");
		
		output("Baroness Doridia Aachen’Dedz Una Condinted is a three foot four inch tall gabilani, with clear turquoise skin and black hair, done up in a prim top bun. She has thick, expressive lips and arching eyebrows painted and styled to match her hair, proud features whose default setting seems to be “disbelieving sneer”. Her round face is framed by just the faintest touch of pudge, yet despite this and being beyond the bloom of youth, if there is the slightest line or sag about her it has been scrupulously tucked away.");
		output("\n\nUna’s physique embodies the female gabilani stereotype and then some: thick, round hips carrying a pear shaped rump and ample, pendulous boobs. In keeping with the rest of her, this is all very carefully marshaled within a gray skirted business suit, stretched tightly over the succulent swells of her curves. She creaks slightly when she walks. Everything about her speaks of a repressively controlled, ravenous carnality.");
		output("\n\nAs for her two male staff, they seem so alike it’s difficult to believe they are different species - brown, sleek, otter-like bodies, unruly curly hair, each about five foot eleven. You guess the kaithrit, recognizable by his dusty orange ears and tails, is a very masculine example of his race to match up so well to the human, with his flat, Germanic cheekbones. They are both dressed only in tight-fitting swim shorts, their slim, supple butts and seemly bulges clear to see, and they both carry the clumsy, defiantly prideful demeanor of young men who know they are being ruthlessly objectified.");
		
		processTime(2);
		arbetzMainMenu();
		addDisabledButton(5, "Appearance");
		addButton(14, "Back", mainGameMenu);
	}
	// Pool Area
	else if (response == 2)
	{
		showUna();
		
		output("<i>“Can I go check out the pool?”</i> you ask.");
		output("\n\n<i>“Certainly,”</i> Una replies crisply. <i>“That’ll be 5000 credits.”</i>");
		output("\n\nYou stare at her blankly.");
		output("\n\n<i>“To cover your membership to Arbetz Travel Agency Premium Klub. Do you honestly expect me to let just any scruffbag gap-yearer cannonball in there? The place’d be overrun in a matter of hours. So either cough up and...”</i> the gabilani searches through her papers and squints at one. <i>“...Experience the Superior Magic of the Premium Klub and Receive Special Offers On Mutirat Treks When You Register Online... or push off.”</i>");
		
		processTime(1);
		// [Pay] [Other Way?] [No]
		clearMenu();
		if (pc.credits < 5000) addDisabledButton(0, "Pay", "Pay", "The price is just too damn high!");
		else addButton(0, "Pay", arbetzPoolOptions, 1, "Pay", "Price: 5000 Credits");
		addButton(1, "Other Way?", arbetzPoolOptions, 2);
		addButton(2, "No", arbetzPoolOptions, 0);
	}
	// Sex
	else if (response == 3)
	{
		showUna();
		
		// First
		if (arbetzTotalFucks() < 1)
		{
			// Bimbo
			if (pc.isBimbo())
			{
				output("What is most apparent to you about Una is that she could really do with chilling out a bit, and your naturally obliging personality implores you to help her with that, the best way you know how.");
				output("\n\n<i>“Hey, um,”</i> you say");
				if (pc.biggestTitSize() >= 4) output(", deliberately squeezing your [pc.chest] together,");
				output(" <i>“Talking is cool and all, but maybe we can do something a bit sexier now?”</i>");
			}
			// Brute/High libido dick-havers: 
			else if (pc.hasCock() && (pc.isBro() || pc.libido() > 50))
			{
				output("There has been only one thing on your mind the entire time you’ve listened to this squat, squishy slut go on and on, and that is how her generous curves pull her stern clothing incredibly taut with every small move, and how much fun it would be to release and mercilessly ravish them.");
				output("\n\n<i>“So,”</i> you say, casually opening your [pc.hips] to give your thickening [pc.cock] more room. <i>“We’re going to fuck now, right?”</i>");
			}
			else output("<i>“You’ve got time for talk,”</i> you grin, leaning on the desk. <i>“So you’ve definitely got time for more fun activities, right?”</i>”");
			
			output("\n\n<i>“Gotten all frisky in the warm weather, have we?”</i> smirks Una. She leans back and runs her eyes up and down your body deliberately, playing with a stray coil of black hair as she does.");
			output("\n\n<i>“Tempting for someone or other, I’m sure,”</i> she pronounces with deliberate carelessness, opening her arms in a stretch that eventually becomes a gesture at the agency itself. Her overstuffed bodice groans softly. <i>“But I’m perfectly content with what I’ve got, two energetic boys to keep me busy. Go find a raskvel or something to play with outside, and try not to make a mess. I’m not interested.”</i>");
			
			processTime(5);
			// [Insist] [Go Back]
			clearMenu();
			addButton(0, "Insist", arbetzTalkOptions, 7, "Insist", "Insist on sex.");
			addButton(1, "Go Back", arbetzMainMenu, false, "Nevermind", "Choose to do something else.");
		}
		// Repeat
		else
		{
			output("<i>“I’m feeling... what was the word you used?”</i>");
			output("\n\n<i>“Frisky.”</i>");
			output("\n\n<i>“Yeah. That.”</i>");
			output("\n\n<i>“Hmm,”</i> leers Una, shifting in her seat, making long-suffering fabric sound. <i>“And I suppose you want us to do something about it? What, exactly, did you have in mind, may I ask?”</i>");
			
			processTime(2);
			arbetzSexMenu();
		}
	}
	// Talk
	else
	{
		showUna();
		
		// First
		if (flags["UNA_TALKED"] == undefined)
		{
			showBust("UNA", "GODI");
			
			output("<i>“That... really didn’t explain anything,”</i> you say. Una sighs theatrically.");
			output("\n\n<i>“Let me guess. You aren’t going to leave until you’ve been spoon-fed everything there is to be known about gabilani history, culture and physiology, are you? I </i>told<i> them this would happen if they didn’t set up a shore-side embassy, but noooooo...”</i> she swings herself onto the counter with one wide arm and whistles piercingly. <i>“Godi! Here.”</i>");
			output("\n\nThe kaithrit lounging by the pool outside gets up and trots over to the desk obediently as the business-suited shortstack thumps to the floor before leading you into a deserted, low-set dining area, where she settles into an armchair.");
			if (pc.tallness <= 54) output(" You are easily able to find one yourself; it’s quite pleasing to find furniture designed for people of your stature for a change.");
			else output(" With all the furniture clearly designed for people of a smaller stature than you, you are left to awkwardly sit on a table opposite her.");
			output("\n\n<i>“Let’s have your name and what you’re doing here, first off,”</i> she sighs. <i>“So I know who to report once office supplies start to go missing.”</i> Una listens with a lazy grin on her full lips as you give her a few details about yourself. Despite her histrionics you get the impression she’s rather pleased you’ve gotten her away from her duties.");
			output("\n\n<i>“Fine. Steele, space adventurer on noble quest to make a fat load of dosh, yadeeyadah,”</i> she says. <i>“What do you want to know?”</i>");
			
			processTime(3);
			flags["UNA_TALKED"] = 1;
		}
		// Repeat
		else
		{
			output("<i>“Got time to talk?”</i> you ask.");
			output("\n\n<i>“No,”</i> Una replies bluntly. You wait patiently as she goes through the pantomime of returning to her work, realizing you haven’t moved, throwing her arms up in silent exasperation and finally clambering out from behind the desk to lead you into the dining area. She flings herself into her armchair moodily.");
			output("\n\n<i>“Fine. You’ve got me here. What’s so bloody important you needed to know?”</i>");
			
			processTime(2);
		}
		
		arbetzTalkMenu();
	}
}

// Talk Options
public function arbetzTalkMenu():void
{
	// [This Place] [Tarkus] [Gabilani] [Travel] [Her] [The Boys]
	clearMenu();
	addButton(0, "This Place", arbetzTalkOptions, 0);
	addButton(1, "Tarkus", arbetzTalkOptions, 1);
	addButton(2, "Gabilani", arbetzTalkOptions, 3);
	addButton(3, "Travel", arbetzTalkOptions, 4);
	if (flags["UNA_TALKED"] >= 2) addButton(5, "Her", arbetzTalkOptions, 5);
	if (flags["UNA_TALKED"] >= 3) addButton(6, "The Boys", arbetzTalkOptions, 6);
	
	addButton(14, "Back", arbetzMainMenu);
}
public function arbetzTalkOptions(response:int = 0):void
{
	clearOutput();
	author("Nonesuch");
	showUna();
	
	// This Place
	if (response == 0)
	{
		output("<i>“What’s the deal with this place?”</i> you say. <i>“How come it’s so warm and lush?”</i>");
		output("\n\n<i>“You, the advanced");
		if (pc.thickness <= 35) output(" beanpole of an");
		output(" alien, really pulled me away from my job to ask me that?”</i> snorts Una. She leans forward, opens her eyes wide, and adopts a mocking school-teacher tone. <i>“Well, you see [pc.name], we have these things called sa-ta-lites that fly waaaaaaay up in the sky, so high you can’t even see them. Some of these sa-ta-lites have super special equipment on them. They do big word things like “modulate air pressure” and “disperse ice nuclei”. All you need to know is: there’s one that flies over us every day and makes it always summer here, just like a holiday resort should be. Hurray!”</i>");
		output("\n\n");
		if (pc.isAss()) output("<i>“Knock it off,”</i> you say sharply. ");
		output("<i>“If the gabilani have cracked changing the weather, how come the rest of the planet is the way it is? And why is it so localized? Your agency isn’t a mile away from Novahome. Why isn’t it sunny there, too?”</i>");
		output("\n\n<i>“Because it takes up a huge amount of energy, obviously,”</i> replies Una. <i>“Maybe if the High Command negotiations with your own stuffed shirts get anywhere, we might be able to properly terraform Tarkus, stop living in space. But I don’t think it honestly would take up that much more fuel to include the raskvel heap in the sunbeam, since you ask.”</i>");
		output("\n\n<i>“So why...”</i>");
		output("\n\n<i>“Because if we did,”</i> the plump shortstack says, brushing the arm of her chair fastidiously, <i>“the raskvel would want to know why we couldn’t extend the weather spot to include the surrounding area too, so they could grow better food? Then there would be a massive ruck as all the raskvel for miles around tried to pile into that one square of land. Then they’d probably storm this place and trample it into the ground in the chaos. Then the seven foot cockroaches would get involved, and things would get </i>really<i> nasty.”</i>");
		output("\n\nUna pats down the fabric and returns her steady gaze to you. <i>“You don’t think I know how it looks to you, " + pc.mf("Mr.", "Mrs.") + " Alien Fancy Pants? Me sitting in my white sunny mansion on the hill, them scratching around in an overcrowded slum that used to be one of your own ships. Gabilani and raskvel lived together for centuries on this planet. You can cart your");
		if (pc.buttRating() <= 4) output(" tight buns");
		else output(" fat arse");
		output(" through the door behind you if you want to see what the outcome was. Trust me: this separation is the kindest thing possible for them.”</i>");
		
		processTime(10);
		
		arbetzTalkMenu();
		addDisabledButton(0, "This Place");
	}
	// Tarkus - pg 1
	else if (response == 1)
	{
		output("<i>“What happened to Tarkus, exactly?”</i> you ask. <i>“The extranet’s really not clear about it.”</i>");
		output("\n\n<i>“Let me guess,”</i> Una replies, picking at a loose thread on her armchair in irritation. <i>“Some nonsense about one planet being the gabilani homeworld, and the other the raskvel’s? They love that line. I’m told you aliens are bright,”</i> she goes on, gesturing at you imperiously. <i>“How many solar systems have you heard of which have two naturally inhabitable planets in them?”</i>");
		output("\n\n<i>“So...”</i>");
		output("\n\n<i>“It was our leaders’ great solution.”</i> Una smiles with an uncharacteristic bleakness. <i>“When things really started to turn bad, 500 years or so ago now. We’ve still got the vids, if you fancy treating yourself to a few nightmares. Even in the places that weren’t deserts or tundra we were practically living on top of each other, the oceans turned to poison from all the run-off, and then so did the land. Gabilani and raskvel fought wars, would kill each other in the tens of thousands for ownership of a single ground-well. Why not? Dozens of lives were worth so much less than one drop of clean water. They blame us for the pollution, but they just wouldn’t stop breeding...”</i>");
		output("\n\n<i>“Anyways. The solution. It appealed to us all, because it combined everything the gabilani love: a massive invention, a huge event, something we could all talk about being part of for centuries after. The world attractor! Daerinoys, the next planet out in our solar system, couldn’t sustain life but it was solid, similar size and had plenty of heavy metal and frozen water in its crust. Our scientists reckoned if we could bring it into the habitable zone, it wouldn’t require all that much terraforming. We could settle there, have our own planet, leave the raskvel to it.”</i>");
		output("\n\n<i>“You say you polluted the planet,”</i> you say. <i>“And you were going to take the fresh one?”</i>");
		output("\n\n<i>“Who came up with the world attractor?”</i> snaps Una. <i>“If you can’t be bothered looking this shit up yourself, don’t try and lay blame on the person telling you about it! And the raskvel helped to operate the damn thing, so they take just as much of the rap for what happened.”</i>");
		output("\n\n<i>“It didn’t work?”</i>");
		output("\n\n<i>“You’ve seen what this hole looks like from the sky, haven’t you? Of course it worked! Oh, it worked alright! Worked great right up until the point someone realised Daerinoys didn’t have a fucking brake on it!”</i>");
		
		processTime(8);
		
		clearMenu();
		addButton(0, "Next", arbetzTalkOptions, 2);
	}
	// Tarkus - pg 2
	else if (response == 2)
	{
		output("<i>“Uh,”</i> you say after a short pause, inadequately. <i>“What happened after that?”</i>");
		output("\n\n<i>“What did the 20% of the planet that survived do, you mean? Some gabilani managed to evacuate. Fastest space program in the history of the galaxy, I imagine. They came back awhile later and constructed the planetary tie; it was the only way to stop the two planets from slowly tearing each other apart. As for the raskvel, well, you’ve seen them, they’re still here. They’re thriving, in their own weird way; the hostility of Tarkus now actually suits their idiotic libidos. The sydians too, although who gives a stuff about them.”</i>");
		output("\n\n<i>“And your people didn’t settle Daerinoys?”</i>");
		output("\n\n<i>“A few did,”</i> Una sighs, rubbing her brows. She looks drained. <i>“But most of the equipment that we were going to use to terraform it was destroyed in the collision, and we had to use what resources remained to make the space stations liveable and build that massive chain. Also, Daerinoys came off worse in the collision. It’s even less habitable than Tarkus is now, if you can believe that. Don’t worry, the irony is not lost on us.”</i> She glares at you resentfully. <i>“You got enough? Or perhaps you’d like to browbeat me over how irresponsible my great great great great great grandparents were some more.”</i>");
		
		processTime(7);
		
		arbetzTalkMenu();
		addDisabledButton(1, "Tarkus");
	}
	// Gabilani
	else if (response == 3)
	{
		output("<i>“Tell me about your people,”</i> you say. <i>“Do you all live in those space stations I saw coming in?”</i>");
		output("\n\n<i>“Mostly,”</i> shrugs Una. <i>“Couple of weirdoes live down here still, but doing that means being disconnected from gabilani society. We’re... you need to stay in touch if you’re one of us, if you want to stay part of <b>the words</b>. Being seen when something big happens, being able to say you experienced it, that’s incredibly important for the gabilani.</i>”");
		output("\n\n“<i>Apparently the stereotype we’ve gotten is that we’re big inventors, and that’s true to a certain extent, but being able to say you were </i>there<i> when something was invented, that’s at least as important. Our leaders are always the ones who are able to talk about the most crazy shit they’ve seen, and once they can’t say that they have anymore, they get ousted. Oftentimes I think our engineers and philososploders come up with stuff not because it’s actually needed, but just to shake things up a bit. So if you’re down here, not able to talk or be included, then you’re either a bit strange... or you’re serving some form of punishment.”</i> She glares over at the desk venomously.");
		output("\n\n<i>“The words,”</i> you prompt. <i>“What does that mean, exactly?”</i>");
		output("\n\n<i>“You know, the words.”</i> She rolls her eyes and slaps her chair’s arms in exasperation when you continue to look at her nonplussed. <i>“The words! The story! I don’t get why none of you aliens understand this. Look, life is a story, right? One you know the beginning to, you’re in the middle of, and one day will end. But no matter how long or interesting your story is, it doesn’t count for anything if it isn’t well-written and nobody reads it. So you got to make sure the words are good and in the right place.”</i>");
		output("\n\n<i>“Why don’t aliens’ words for things change?”</i> she goes on heatedly, getting into the topic. <i>“Your species have been calling yourselves the same thing for how long? How can you keep using that term when clearly you aren’t what you were tens of thousands of years ago? It’s so weirdly primitive for races with such advanced tech.”</i>");
		output("\n\n<i>“So you weren’t always called gabilani?”</i>");
		output("\n\n<i>“Of course not! First we were many different names, then after the Unification Wars we became the haendra, “The Altogether”, mostly. The launch of our first airships was such an important part of our history we became the bilani, Children of the Sky, cos that’s where we were now able to go and where we took our inspiration from, see? Now we are the gabilani, Children of the Outer Sky. I’ll let you work that one out yourself. We call the raskvel the herliani, Children of the Soil. Although they don’t, ah...”</i> Una escorts a smirk off her face with a brush of the hand. <i>“I wouldn’t use that term to their faces, is what I’m saying.”</i>");
		
		processTime(10);
		if (flags["UNA_TALKED"] < 2) flags["UNA_TALKED"] = 2;
		
		arbetzTalkMenu();
		addDisabledButton(2, "Gabilani");
	}
	// Travel
	else if (response == 4)
	{
		output("<i>“So gabilani like travel, then?”</i> you say.");
		output("\n\n<i>“I guess?”</i> Una shakes her head in exasperation to your question. <i>“What kind of yardstick are you using? You guys have been traipsing all over the galaxy to find other people’s planets to trample on for thousands of years, so I’m told.”</i>");
		output("\n\n<i>“But this agency...”</i>");
		output("\n\n<i>“It’s a law, dear,”</i> the turquoise shortstack sighs. <i>“After we evacuated Tarkus, we discovered that living in orbit in low gravity doesn’t do wonders for your health. Your bone density and immune system in particular. The capacity to create better living environments in space is one of the things we’re trying to bargain with the U.G.C. to give us. In the meantime, we’ve got the Hale and Heart decree. Every gabilani has to be spend at least two weeks in a year shore-side, give their bodies time to recuperate. There’s supposed to be a cultural thingy involved too. See where we come from, reflect on our history.”</i> Una flicks a hand sneeringly. <i>“Rubbish really, for most it’s just a lark.”</i>");
		output("\n\n<i>“A lark?”</i> you say, thinking of the bleak terrain outside.");
		output("\n\n<i>“Of course. Get out from the convoluted, repetitive words up above, blow some steam off, try out some new inventions, chase the locals around a bit. Half of my duties is patching things up when it gets out of hand. You should be careful when you’re moseying around Arbetz - anything your average Fh’langi rah-rah can see from atop his new motor-biped is fair game. Why not?”</i> Una sniffs. <i>“The planet’s good for nothing but alfresco experiments and fucks anymore.”</i>");
		
		processTime(5);
		
		arbetzTalkMenu();
		addDisabledButton(3, "Travel");
	}
	// Her
	else if (response == 5)
	{
		output("<i>“");
		if (!pc.isNice()) output("So presumably that mouthful you call a name has a meaning?");
		else output("That’s a... big name you’ve got. Does it have a meaning?");
		output("”</i>");
		output("\n\n<i>“Naturally,”</i> sniffs Una. <i>“Although “Baroness” is just a very rough translation of the five words used to describe my family’s standing--keep it simple for you blunt-mouthed space-drifters. Doridia, my mother, she was a very distinguished deto-menter. Least when she wasn’t screwing. I’m the seventh of fifteen children: Oreol, my oldest sister, she’s the one you’ve probably heard of. Invented a type of rubber cement that’s completely air tight once set. Doesn’t sound like much, but it’s useful to a space-bound race that can’t go a week without blowing a hole in something. And my goodness me, does she think she’s special. Stuck up bitch. What I wouldn’t give to show her up, turn that arrogant little smirk of hers upside down...”</i>");
		output("\n\nUna is slowly turning a fetching shade of navy telling you this. You can’t help but notice you can just about see the rise of her nipples through the taut fabric of her suit as it quivers in indignation. Is it possible that getting this angry actually turns her on a bit?");
		output("\n\n<i>“Have you tried inventing anything yourself?”</i> you ask with a slight cough.");
		output("\n\n<i>“No, but I had a plan,”</i> Una replies, a wistful smile replacing her scowl. <i>“I calculated that with enough explosions detonated in the right places, I could change Daerinoys’ climate just enough to make it more liveable around its equator, as well as turn up a bunch of platinum 190 at the same time. It would have been expensive but so worth it. Even if it went wrong, I would’ve sealed my place in gabilani history forever. My name would have gone on for hours!”</i>");
		output("\n\n<i>“Did it go wrong?”</i>");
		output("\n\n<i>“I was convicted of embezzlement before I got to find out,”</i> growls Una. <i>“That absolute cow Oreol sold me out. I told the jury the scheme would’ve allowed me to pay High Command back ten times over, but would they listen? I was sent down here as punishment, and given the suffix “Condinted” to boot. “Disgraced-in-Exile”, since you ask. But I’ll tear that off one day, oh yes...”</i>");
		output("\n\nHer eyes have gone glassy, and she is compulsively grasping her skirt, color high in her cheeks. <i>“...and get Oreol back. When I’m recalled I’ll be the repentant little prodigal, tell her she did the right thing by ratting on me, get her nice and off her guard. And then pow! Really stick it to her, like rubber cement stick it to her...”</i>");
		output("\n\nShe inhales deeply and squirms in her seat, thick thighs rubbing together, before seeming to notice you’re still there. She flattens down her skirt fastidiously. <i>“...You done? Because I need to, you know, I really have to get back to my duties now.”</i>");
		
		processTime(10);
		if (flags["UNA_TALKED"] < 3) flags["UNA_TALKED"] = 3;
		flags["ARBETZ_SEX_UNLOCKED"] = 1;
		
		arbetzTalkMenu();
		addDisabledButton(5, "Her");
	}
	// The Boys
	else if (response == 6)
	{
		showBust("UNA", "GODI", "PETR");
		showName("UNA,\nGODI & PETR");
		
		output("<i>“Them, then.”</i> You gesture at the two lithe, bare-chested young men working behind the Agency’s counter. <i>“What do they do?”</i>");
		output("\n\n<i>“Do?”</i> Once again Una looks and smiles at you as if you were incredibly simple. <i>“They are my fuckboys dear, that’s what they do. Say hello, Godi.”</i>");
		output("\n\n<i>“Hey.”</i>");
		output("\n\n<i>“Say hello, Petr.”</i>");
		output("\n\n<i>“Sup.”</i> Both of them look completely unabashed.");
		output("\n\n<i>“I was forced to work down here,”</i> Una goes on. <i>“But High Command are sympathetic to those who agree to do so, as opposed to just buggering off into the wastes. Particularly if you know how to apply, hmm, certain pressures. Words in right places. So, with the U.G.C. anxious to liaise with us, I got to organize some cultural exchange. Increase understandings between our disparate races, that sort of thing. These two come in useful in all sorts of positions.”</i>");
		
		processTime(5);
		if (flags["UNA_TALKED"] < 4) flags["UNA_TALKED"] = 4;
		flags["ARBETZ_SEX_UNLOCKED"] = 1;
		
		arbetzTalkMenu();
		addDisabledButton(6, "The Boys");
	}
	// Sex - Insist
	else if (response == 7)
	{
		showUna();
		
		output("<i>“Yeah");
		if (pc.isNice()) output(" nonsense");
		else output(" bullshit");
		output(",”</i> you say. <i>“You’re just trying to play hard to get.”</i>");
		output("\n\n<i>“You’re so sure...”</i> the gabilani snickers, cruel, teasing eyes gazing at you from behind her hand. <i>“Oh, fine. If we’re that desperate, you can lick my pussy. Or maybe I can lend you one or both of my pricks? They always need wearing out a bit.”</i>");
		
		processTime(1);
		
		arbetzSexMenu();
	}
}

// The Sex Stuff
public function arbetzSexMenu():void
{
	// [Oral] [One Boy] [Two Boys] [Hate Sex]
	clearMenu();
	addButton(0, "Oral", arbetzSexScenes, "oral", "Oral", "Give the gabilani woman some oral attention.");
	if (flags["UNA_TALKED"] < 4)
	{
		addDisabledButton(1, "One Boy", "One Boy", "Try finding out about the boys a little more before trying this.");
		addDisabledButton(2, "Two Boys", "Two Boys", "Getting a bit ahead of yourself there. Maybe try asking about them first?");
	}
	else if (!pc.hasGenitals())
	{
		addDisabledButton(1, "One Boy", "One Boy", "You need genitals to do that!");
		addDisabledButton(2, "Two Boys", "Two Boys", "You need genitals to do that!");
	}
	else
	{
		addButton(1, "One Boy", arbetzSexScenes, "one", "One Boy", "Give the cat boy a good topping.");
		addButton(2, "Two Boys", arbetzSexScenes, "two", "Two Boys", "Get an energetic spitroasting.");
	}
	if (flags["UNA_TALKED"] < 3 || arbetzTotalFucks() < 1) addDisabledButton(3, "Hate Sex", "Hate Sex", "You don’t know Una well enough to try this.");
	else if (pc.isNice() && rand(2) == 0) addDisabledButton(3, "Hate Sex", "Hate Sex", "Why would you do that? You’re a nice [pc.guy].");
	else if (pc.isNice() || !pc.hasCock()) addDisabledButton(3, "Hate Sex", "Hate Sex", "You’ll need to be a dick <i>(both figuratively and literally)</i> to try this.");
	else addButton(3, "Hate Sex", arbetzSexScenes, "hate", "Hate Sex", "Get nasty and vigorous with Una in equal measure.");
}
public function arbetzSexScenes(response:String = ""):void
{
	clearOutput();
	author("Nonesuch");
	clearMenu();
	
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	var isTightFit:Boolean = false;
	var x:int = 0;
	var y:int = 0;
	
	// Oral
	if (response == "oral")
	{
		showUna(true);
		
		output("Una pauses to flick a tray as well as several files and folders from her desk into the crook of her elbow before dropping down from her chair, giving you sly, come-hither eyes over her shoulder. You follow the gentle bounce of her big, skirted rump further into the airy, sunny building.");
		output("\n\nThe room you eventually arrive in is evidently the gabilani’s boudoir - it’s prim and tidy, all done in corn yellow, has a distasteful amount of frilling going on and is dominated by a bed sized well out of proportion to her. There’s a quiet humming sound coming from somewhere, but it’s difficult to think about that when Una is flicking off her work shoes, deliberately letting you see her naked, generous, dimpled hams as she bends down and divests herself of her white panties, unfastening her skirt and sitting down on the duvet. The heavy, flawless flesh of her thighs ripples ponderously as she does.");
		output("\n\n<i>“Now then, eager beaver,”</i> she says huskily, leaning back and spreading all of that turquoise goodness. <i>“Perhaps we can find what we were looking for all on our own, hmm?”</i>");
		output("\n\nDifficult to miss. Below her work shirt and the slight, supple line of her paunch, the lips of her bare, plump pussy are gently parted, letting you see her soft, moist ultramarine innards. The muted smells of salt and musk greet you as you get down in front of her");
		if (pc.hasCock())
		{
			output(", [pc.eachCock] beginning to swell");
			if (pc.isCrotchGarbed()) output(" and strain against your [pc.underGarment],");
			output(" as you");
		}
		else if (pc.hasVagina())
		{
			output(", [pc.eachVagina] beginning to moisten");
			if (pc.isCrotchGarbed()) output(" and bead upon your [pc.underGarment],");
			output(" as you");
		}
		else output(" and");
		output(" wrap your arms around her parted thighs, sinking your fingers deep into her warm, pliant flesh. A hand rubs");
		if (pc.hasHair()) output(" through your [pc.hair]");
		else output(" behind your ear");
		output(" encouragingly as you dip between them and lay your [pc.tongue] in the vertical slit of her sex.");
		output("\n\nThe pleasantly fruity taste of fresh, female excitement oils your tongue as you lap at the gabilani, exploring the ins and outs of her with interest. The view from here isn’t bad either - every well-directed dart and smack of your mouth makes the mounds of Una’s white-clad breasts above you quake slightly, the thick hips beneath your hands clench.");
		output("\n\n<i>“Go in and up,”</i> she directs, able to inject teacher-like authority into her tone despite having her head thrown back. <i>“That’s it... good " + pc.mf("boy", "girl") + "...”</i> You wriggle your mouth muscle into her channel, and are slightly surprised when she suddenly squeezes down on its tip <i>hard</i>, like an eel in a trap. She clasps her thighs around your head at the same time, momentarily muffling the world with the sound of supple, turquoise warmth, and rides that bit of trapped tongue with hard squeezes. As soon as she lets go you withdraw, electing to concentrate on her bulging clit instead.");
		output("\n\n<i>“Hmm,”</i> Una breathes luxuriantly. There’s a rattle of paper; looking up, you see her placing the folders she brought with her on the tray, flicking a pen out, self-possessed diffidence on the round, pretty face above her ample bosom. <i>“In deep again, eager beaver, and this time don’t cringe,”</i> she orders. <i>“You aren’t bad, but you need plenty of practice with a gabilani pussy if you want to be tasting it again.”</i>");
		// Masculine:
		output(pc.mf(" She catches your quizzical expression as she opens a file. <i>“Yeah, I know, multitasking, total mystery to you,”</i> she sighs theatrically. <i>“I got a job, in case you hadn’t noticed.”</i>", ""));
		
		processTime(10);
		
		// Create Una
		if (!pp.hasVagina()) pp.createVagina();
		pp.shiftVagina(0, GLOBAL.TYPE_GABILANI);
		pp.girlCumType = GLOBAL.FLUID_TYPE_GABILANI_GIRLCUM;
		pp.vaginas[0].wetnessRaw = 20;
		
		// [Acquiesce] [Take Charge]
		addButton(0, "Acquiesce", arbetzSexScenes, "acquiesce", "Acquiesce", "More practice means more licking pussy. Everyone wins, right?");
		addButton(1, "Take Charge", arbetzSexScenes, "charge", "Take Charge", "Like hell. Time to give this little so-and-so the licking of a lifetime.");
	}
	// Take Charge
	else if (response == "charge")
	{
		showUna(true);
		
		output("You think it’s <i>very</i> unwise of her to put on airs like that from this position.");
		// Repeat:
		if (flags["ARBETZ_SEX_ORAL"] != undefined) output(" Or maybe she’s deliberately inciting you because she enjoys it so much? It’s difficult to tell through the layers of theatrics the plump little harridan employs.");
		output(" You cinch your arms around the back of her knees and with one firm upward movement tumble her onto her back. Paper goes flying everywhere.");
		output("\n\n<i>“What are you doing?”</i> she cries, bare feet wiggling helplessly near your");
		if (pc.tallness <= 54) output(" ears");
		else output(" elbows");
		output(". <i>“St -o- -o- -o- -p!”</i> Her order becomes a shrill squeal as you attack the ripe, split fruit of her pussy with a vengeance, lapping lengthwise over her hole with swift, hard curls, ending each lick with a little flick at her bulging blue clit.");
		output("\n\nYou are careful not to dip your [pc.tongue] <i>too</i> deep into her, keeping it out of range of those formidable vaginal muscles of hers. That doesn’t stop you sadistically teasing her with the prospect, sinking into the wet velvet suck of her tunnel just so before withdrawing, slithering back up to continue your assault on that delightfully over-sensitive button of hers. The response you get from doing this is wonderful. Una air-pedals furiously, calves flapping against your firmly anchored elbows and curses you a blue moon, her own blue moon hopelessly exposed.");
		output("\n\n<i>“You’re not doing it properly!”</i> she wails. <i>“Stop behaving like an animal and unh -a- -a- -a- ah!”</i> she dissolves into a hysterical moan, hands clutching at the sheets, as you blanket her clit in your [pc.tongue] before flicking at it furiously.");
		if (pc.tallness >= 60) output(" It’s simplicity itself for you to crane your arms forward and grasp the shortstack’s breasts, using your height advantage to find and squeeze her prominent nipples through her blouse, overload the gabilani’s senses with her own tender, over-juiced body.");
		output(" Una’s hands bunch up the fabric, and despite her writhing, you feel her little buzzer quiver distinctly on the pad of your mouth muscle.");
		output("\n\n<i>“So what am I doing wrong, exactly?”</i> you ask politely, looking up at the heaving mounds of Una’s breasts once she’s finished her helpless thrashing in your strong arm-lock. <i>“Aside from giving you mind-blowing orgasms, I mean.”</i>");
		output("\n\n<i>“You’re supposed to listen to a single word I say,”</i> she growls. You think there might be just the tiniest hint of gleeful complicity in her hectoring tone. <i>“You’ve got my spreadsheets all over the bloody place. Let go of me, and pick--”</i> you lean forward and shoot your [pc.tongue] up her wet, unfurled twat as deep as you can get it");
		if (pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" which, given the length of that wonderfully lithe, wet appendage of yours, is extremely deep indeed, tenderly dabbing the wall of her cervix");
		output(". Her muscles convulse around you reactively... and then you withdraw it, going back to ravishing her labia and clit with heavy drags and smooches of your [pc.lips] and mouth before she can grab hold.");
		output("\n\n<i>“You " + pc.mf("bast -a- -a- -a- rd", "b -i- -i- -i- itch") + "!”</i> she howls.");
		output("\n\nFace buried between Una’s short, thick legs, you spend an enjoyable few minutes mercilessly driving her to a fresh orgasm, soft flesh trembling and writhing around you as musky girl-cum drips down your chin");
		if (pc.hasGenitals())
		{
			output(", the taste and sound of her keeping your own");
			if (pc.hasCock()) output(" [pc.cocks] rock hard");
			if (pc.hasCock() && pc.hasVagina()) output(" and");
			if (pc.hasVagina()) output(" [pc.vaginas] pleasantly warm and moist");
		}
		output(". You only let her go then because your ears are beginning to ring; good grief does this juicy gabilani sow have a pair of lungs on her, and she’s not afraid to use them. You give her clit one last judicious flick of your tongue, making her twitch and groan, and then finally release her legs, letting her weakly spool and splay back onto her bed.");
		output("\n\n<i>“You are a crude and willful " + pc.mf("boy", "girl") + " who has no idea how to treat a lady professional,”</i> she says woozily, hips still spread, black top bun in a tangle. She either doesn’t have a strength to disguise her well-fucked, wicked delight in you, or she isn’t bothering. <i>“You will follow my instructions to the letter next time, or there will be repercussions.”</i>");
		output("\n\n<i>“You’re welcome,”</i>");
		if (!pc.isAss()) output(" you grin winningly");
		else output(" you say tartly");
		output(", ");
		if (pc.hasFeet()) output(" getting back onto your feet");
		else output(" rising back to an upright position");
		if (pc.isCrotchGarbed()) output(", carefully rearranging your [pc.lowerUndergarment] as you do");
		output(", and then");
		if ((pc.isNaga() || pc.isGoo()) && pc.legCount <= 1) output(" slithering");
		else output(" striding");
		output(" back through the door to the front desk without a backward glance.");
		
		// + Lust
		processTime(25);
		pc.girlCumInMouth(pp);
		pc.lust(35);
		IncrementFlag("ARBETZ_SEX_ORAL");
		
		addButton(0, "Next", mainGameMenu);
	}
	// Acquiesce
	else if (response == "acquiesce")
	{
		showUna(true);
		
		output("You lap at the indomitable little woman’s plump, spread sex, cherishing it with your saliva before doing as she asks and reaching your [pc.tongue] deep into her wet hole.");
		output("\n\n<i>“That’s it,”</i> she hums, shuffling her papers. <i>“Good " + pc.mf("boy", "girl") + "... right... there.”</i> Her thighs tighten around your ears and her muscles clench up around your tongue, soft walls suddenly turning into a brawny hold, trapping most of your tongue deep within her. She holds you there firmly, [pc.lips] pressed right into her labia, sighing with low pleasure as her sex wrings your straining mouth muscle like a wet cloth, rippling up and down it hard. Your hearing is muffled by her hips, her feet bumping gently against your shoulders; all there is for you is her outer softness and her inner, kneading ruthlessness.");
		output("\n\nAfter ten long seconds, she releases you with a long, pleased purr, your tongue allowed to slither back out of her entrance. You take a long gulping breath. Your mouth, chin and nose are slathered with her high, fruity scent, and you feel faintly dizzy with it and your hydrostatic exertions");
		if (pc.hasGenitals())
		{
			output(";");
			if (pc.hasCock()) output(" your [pc.cock] is still bulgingly erect");
			if (pc.hasCock() && pc.hasVagina()) output(" and");
			if (pc.hasVagina()) output(" your [pc.vagina] is still wet and eager");
		}
		output(" from your sexual daze. A turquoise hand impatiently patting the sheets next to you focuses your attention.");
		output("\n\n<i>“Lick my clit,”</i> Lady Una orders, scribbling away at her records. <i>“Make it shine, and then you can go back in again. This time you will waggle it. We need to get those muscles and nerves of yours nice and limber...”</i>");
		output("\n\nTime draws out in the warm, quiet room as you happily keep your head buried between the gabilani’s thick, short legs, obeying her every direction and feeling a glow of submissive satisfaction when you draw approving sighs and murmurs of pleasure out of her, small quakes trembling through the pliant, ample flesh around and above you. All the while she coolly continues her paperwork, balancing her tray on your head. There’s a puppyish joy to it all, particularly when her pussy clenches down on your [pc.tongue] and works it so tightly and rigorously for its own pleasure, inundating your mouth with her taste and texture.");
		if (pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" It’s exactly the right purpose for that obscenely long, sensuous organ of yours; Una sighs with deep pleasure as she practically sucks inch after inch of your tentacle-like tongue into her, packing herself with it before clenching down hard, rings of muscle seizing up on your overworked taste-buds.");
		output("\n\n<i>“Mmm,”</i> she purrs at last, clicking her pen shut after a particularly rigorous series of clenches has coated the insides of your mouth with her fragrant oil. <i>“</i>Very<i> good " + pc.mf("boy", "girl") + ".”</i> She places the soles of her feet above your [pc.chest] and pushes you slowly backwards, gazing down at you from her perch with a sensuous smile. A single toe reaches down and gently");
		if (pc.hasGenitals())
		{
			if (pc.hasCock()) output(" strokes the bulge of your eagerly erect [pc.cock]");
			else output(" runs along the line of your puffy, moistened [pc.vagina]");
		}
		if (pc.isCrotchGarbed())
		{
			output(" through the fabric of your [pc.lowerGarments]");
			if (pc.hasArmor()) output(". You can barely even feel the pressure of it through the tough material, but the mere knowledge of its presence makes your breath catch slightly in your throat");
		}
		else if (!pc.hasGenitals()) output(" caresses your naked [pc.skin]");
		output(". The pudgy digit drifts coyly up and down as its owner speaks. <i>“Did we enjoy ourselves down there? Of course we did. Rough and ready maybe, but come back for a few more training sessions like this and we’ll make you into a fine pussy munch.”</i> Woozy, mouth rich with her scent and distracted by the teasing movements of her foot, you feel nothing but soft-focused enthusiasm for the idea, heat eagerly rising up to greet her touch.");
		output("\n\nShe presses the toe slowly but surely into your tender, expectant flesh");
		if (pc.hasGenitals())
		{
			output("... and then withdraws, with a final, knowing flick at your");
			if (pc.hasCock()) output(" [pc.cockHead]");
			else output(" [pc.clit]");
		}
		output(". <i>“Run along now, eager beaver,”</i> says the amused voice. <i>“I need to finish up my work, and you need to go work off all that youthful enthusiasm somewhere. No doubt I’ll be seeing you soon...”</i>");
		output("\n\nYou go back to the agency’s front desk in a daze, wiping your mouth absently as you go. Yes... that heat. You do need to work that off, somehow.");
		
		// + Lust
		processTime(25);
		pc.girlCumInMouth(pp);
		pc.lust(35);
		IncrementFlag("ARBETZ_SEX_ORAL");
		
		addButton(0, "Next", mainGameMenu);
	}
	// One Boy
	else if (response == "one")
	{
		showBust("GODI");
		showName("\nGODI");
		
		output("<i>“Well, if he doesn’t mind...”</i> you grin, eyeing the lean muscle bronzing in the sun.");
		output("\n\n<i>“Of course not. Godi!”</i> Una raps out crisply. The kaithrit pads indoors, smiling and scratching his hair self-consciously. <i>“Since you have nothing better to do than lolling around outside, make yourself useful by seeing to this " + pc.mf("gentleman", "young lady") + ". Run along now.”</i>");
		output("\n\nGodi shrugs easily and leads you behind the counter and further into the airy, sunny building.");
		output("\n\n<i>“You’re not taking Lady Una’s attitude too seriously, are you?”</i> he says in a quiet, sonorous voice, opening the door to");
		if (flags["ARBETZ_SEX_ORAL"] != undefined) output(" the gabilani’s boudoir");
		else output(" what is evidently the gabilani’s boudoir. It’s primly tidy, all done in corn yellow, has a distasteful amount of frilling going on and is dominated by a bed sized well out of proportion to her. There’s a quiet humming sound coming from somewhere");
		output(". <i>“She just likes getting wound up about stuff, I think.”</i>");
		output("\n\n<i>“And you don’t mind how she treats you?”</i>");
		output("\n\n<i>“I hang around a pool all day, get laid most nights, and if it ever gets boring the Raskvel Mess is just down the hill,”</i> the dusty-orange cat boy replies, sitting down on the bed. <i>“It’s going to suck when this gig is over.”</i> He looks up at you self-consciously. <i>“So, uh, what exactly do--?”</i> You silence him by pushing him back onto the sheets. Talk time is over.");
		
		processTime(5);
		
		// Create Godi
		if (!pp.hasCock()) pp.createCock();
		pp.shiftCock(0, GLOBAL.TYPE_FELINE);
		pp.cocks[0].cLengthRaw = 6;
		pp.elasticity = 2;
		
		if (!pc.hasCock()) addButton(0, "Next", arbetzSexScenes, "one F");
		else if (pc.hasCock() && !pc.hasVagina()) addButton(0, "Next", arbetzSexScenes, "one M");
		// Herm: [Ride Him] [Buttfuck Him]
		else
		{
			addButton(0, "Ride Him", arbetzSexScenes, "one F");
			addButton(1, "Buttfuck Him", arbetzSexScenes, "one M");
		}
	}
	// One Boy - Ride Him (F)
	else if (response == "one F")
	{
		showBust("GODI_NUDE");
		showName("\nGODI");
		
		x = pc.cuntThatFits(pp.cockVolume(0));
		if (x < 0) x = pc.biggestVaginaIndex();
		if (pc.vaginalCapacity(x) <= pp.cockVolume(0)) isTightFit = true;
		
		output("You quickly rip your [pc.gear] off, standing over him and drinking in his sleek, almost-naked body as you do, prone and ready for your delectation; your [pc.vagina " + x + "] moistens and widens at the sight. You are gratified by the fact that by the time you’re done undressing, his swim-shorts are straining around a sizable hard-on. Nailing Una every night has evidently not hurt his youthful enthusiasm. You gesture imperiously for him to take them off and he does so breathlessly, not taking his eyes off your [pc.chest]. Clambering onto the bed, [pc.lowerBody] brushing his hard, lean hips, you consider his pink, five inch, nubby pussy-erection archly. You don’t think that’s going to require an ounce of stimulation - and why would you give him it anyway? He’s a toy, there for you to use.");
		output("\n\nSpurred on at the thought, you push your [pc.vagina " + x + "] against his hot meat, brushing your " + pc.clitDescript(x) + " over his bumps to send pleasure tingling through you, before sitting down on it, enjoying the quiet gasp and tense up this draws from the boy.");
		
		pc.cuntChange(x, pp.cockVolume(0));
		
		if (isTightFit) output(" You hum with approval at the way his sturdy cock spreads and fills your tight, wet hole, the perfect size for it. You show your approval by clenching down on it firmly, turning Godi’s breathy exhalation into a full-on groan.");
		else output(" His sturdy cock is lost completely in your wet, voluminous, man-eating twat, barely even touching the sides. In its own perverse way, you find that stimulating; you’re really going to have to ride this boy-bitch to get anything out of him.");
		output("\n\nGodi’s warm, smooth hands");
		if (isTightFit) output(" envelope your tight");
		else output(" press into the ample softness of your");
		output(" [pc.butt] as you flex your hips, beginning to work him deep in your tender depths. In turn, you push your hands down on his");
		if (pc.tallness <= 54) output(" flat, hard abdomen");
		else output(" ropey shoulders");
		output(", screwing him into the mattress, ensuring he goes nowhere. An expression of serene concentration is written on his narrow, handsome features as he thrusts back into you gently whilst kneading your butt with soft, wave-like movements, before sliding a strong finger from the pad of your [pc.anus] up the valley of your spine. You coo as shivers of pure pleasure quivers through your core, your [pc.nipples]");
		if (!pc.hasLipples() || !pc.hasCuntNipples() || !pc.hasInvertedNipples() || !pc.hasFlatNipples()) output(" hardening up");
		else output(" moistening");
		output(" - that is nice!");
		output("\n\nYou reward him by roughly picking up the pace, gritting your teeth as the nubs of his cat-cock dig into your walls, causing [pc.girlcum] to course readily down your inner lips. The bed creaks briskly as you lose yourself to the rhythm, focused entirely on using that thick dick to amp yourself towards a warm high, sweat oiling both you and Godi in the quiet, warm atmosphere. You keep your gaze fixed on the cat boy’s face, enjoying the way his mouth opens wider and wider as you fuck him harder and harder, the breath beginning to be torn out of him until finally he’s clutching your [pc.thighs] for all he is worth and pumping back into your sopping depths, bending his hot dick deep into you urgently.");
		output("\n\nYou groan and growl your enjoyment as this bumps you up to a [pc.skin]-tingling orgasm, your [pc.vagina " + x + "] rippling and quivering around the bulging jerk and jounce of his cock");
		if (pc.isSquirter(x)) output(", juicily smearing [pc.girlcum] all over his firm torso and thighs");
		if (pc.isLactating())
		{
			output(", [pc.milk] dripping down onto his");
			if (pc.tallness <= 54) output(" chest");
			else output(" face");
			output(" as your [pc.nipples] swell and release in response to arousal pulsing through you");
		}
		output(".");
		output("\n\nDespite the intense arousal clutching his frame and face, Godi doesn’t cum himself, despite how furiously you ride him in the clutches of your own orgasm; staving it off with deep gulps of air, gazing up at you soulfully and waiting your instruction. What a nice boy! No matter how hunky they might turn out to be, the kaithrit evidently keep their men <i>very</i> well trained.");
		output("\n\nYou reward him by slowly slithering off his bulgingly erect cock, enjoying the way it gently pulls at your walls as it goes, and then push your labia and clit against his sensitive underside, rubbing it rhythmically up and down, keeping him pressed to the sheets all the while. Well lubricated by your juices, the nubs rubbing over your " + pc.clitDescript(x) + " are deeply enjoyable - almost as much as when the kaithrit arches his back and cums with a gasp to your incessant, moist pressure. You bend your pussy into him to angle his bulging, jerking cock back, directing the delirious spouts of cum back up his flat, toned body, laughing quietly to the display of heaving, leanly muscular desperation you’ve coaxed out of him, the pleasure nibbling at your sex twining with it.");
		output("\n\nYou lie back on the bed when he’s finally squirted his last, feeling relaxed and sensuous. You watch in a semi-doze as Godi, once he’s recovered his breath, gets up, wipes himself down, and then walks over to the corner of the room.");
		// First:
		if (flags["ARBETZ_SEX_ONE_BOY"] == undefined)
		{
			output("\n\nYou frown as he reaches up and fiddles with a gun-metal spherical shape fixed to the ceiling. The quiet humming sound halts, and he pockets a small, oblong shape. Understanding sinks into you as Godi turns to grin at you sheepishly.");
			output("\n\n<i>“She, uh, likes to watch,”</i> he says. <i>“Later, I mean. Says it’s a fair price for taking us away from our duties. I make sure they don’t get out of this building though, so don’t worry about that. Unless you want them to, I guess.”</i>");
			output("\n\nGood fucking void that woman. You shake your head despairingly, pull your");
			if (!pc.isNude()) output(" clothes");
			else output(" gear");
			output(" back on, and return to the lobby.");
		}
		// Repeat:
		else
		{
			output("\n\n<i>“She must have enough of those now to make an anthology,”</i> you say dryly as he turns off the camera and retrieves the data bead.");
			output("\n\n<i>“You know what a porn habit is like,”</i> he replies. <i>“You can’t ever get enough. I’ll make sure they never leave this building though, don’t worry. Unless you want them to, I guess.”</i>");
			output("\n\nYou shake your head despairingly, pull your");
			if (!pc.isNude()) output(" clothes");
			else output(" gear");
			output(" back on, and return to the lobby.");
		}
		
		processTime(20);
		pc.loadInCunt(pp, x);
		pc.orgasm();
		IncrementFlag("ARBETZ_SEX_ONE_BOY");
		
		addButton(0, "Next", mainGameMenu);
	}
	// One Boy - Ride Him (M)
	else if (response == "one M")
	{
		showBust("GODI_NUDE");
		showName("\nGODI");
		
		y = pc.cockThatFits(pp.analCapacity());
		if (y < 0) y = pc.smallestCockIndex();
		if (pc.cockVolume(y) > pp.analCapacity()) isTightFit = true;
		
		output("You quickly rip your [pc.gear] off, standing over Godi and drinking in his sleek, almost-naked body as you do, prone and ready for your delectation; your [pc.cock " + y + "] hardens at the sight. He looks up at it with a slight amount of color in his smooth, narrow cheeks when you’re done, the bulge in his own swim shorts noticeably beginning to swell.");
		output("\n\n<i>“Into this, are you?”</i> you murmur, teasingly shaking your [pc.hips] to make your turgid dick swing. The kaithrit smirks and looks away demurely.");
		output("\n\n<i>“Top drawer on the left,”</i> he says. Instead of following his direction immediately you make him turn over on the bed, leaning over him as you pull off his shorts with an authoritative snap of the wrist. His twin tails rear up to give you intimate access. His butt is long, athletic, but still with a nice bit of springy roundness up top. You notice he’s almost as well tanned down here as he is anywhere else; evidently he sunbathes nude a fair amount of the time.");
		output("\n\nThat gets you going a bit. You reach around and grasp the shameless boy whore’s short but girthy, nubby cat cock, pulling and kneading it as you breathe in his ear and grasp his tight ass, rubbing your [pc.cock " + y + "] between his cheeks until it’s burningly erect as the one in your hand, Godi’s own breath coming hard and close. Only then do you reach over with one hand and fumble around in the dressing table’s top drawer. You find a likely-shaped object and emerge with a bottle of clear fluid, which, upon pouring liberally down Godi’s crack, over the pert, pink wrinkle of his anus and experimentally gliding your cock through it, does turn out to be warm, coating lube. Good for him.");
		output("\n\nHe tenses up and gasps slightly when you take firm hold of his ropy shoulders, press your [pc.cockHead " + y + "] against his asshole and open the way into his tight, hot depths with a slow, smooth flex of your hips.");
		
		pc.cockChange();
		
		if (!isTightFit)
		{
			output("\n\n<i>“Oh, stop making a meal out of it,”</i> you " + pc.mf("chuckle", "giggle") + ", closing your eyes to the pleasure of easily sliding in inch after inch of your");
			if ((pc.cockVolume(y) * 1.5) <= pp.analCapacity()) output(" cute");
			else output(" decently-sized");
			output(", sensitive cock past his clenching ring. <i>“Imagine if your mistress had made you go with a REAL monster.”</i>");
		}
		else
		{
			output("\n\nObviously taking your monstrous, totemic cock is not easy for a slight cat boy - but that doesn’t hurt your determination to bury as much of it inside him as you possibly can. You work your way in gently, murmuring encouragement into his ear and giving his own dick generous rolls of your wrist every time the muscles in his back knot up as yet more of your bulging " + pc.mf("man", "futa") + " girth disappears between his lean cheeks.");
		}
		output("\n\nOnce");
		if (!isTightFit)
		{
			output(" your whole [pc.cock " + y + "] is inside of him, your");
			if (pc.balls > 0) output(" [pc.balls]");
			else output(" [pc.hips]");
			output(" pressed against his sturdy, narrow hips");
		}
		else
		{
			output(" the greater part of your [pc.cock " + y + "] is past his disgracefully stretched ring");
		}
		output(" you begin to saw into him, hissing to the pleasure of your lubed length sliding almost all the way out of his tight, muscular ass and then driving home into that buttered squeeze. Godi exhales hard with each firm push, grasping handfuls of the yellow sheets at first - but they become throaty gulps and groans of enjoyment soon enough, particularly as you tighten your grip on his straining cat-cock and jerk him with authoritative flicks.");
		output("\n\n<i>“Bet you don’t get sugar like this from Una,");
		if (pc.isAss()) output(" do you, whore?");
		output("”</i> you growl, the intensity of your heat beginning to build.");
		output("\n\n<i>“Didn’t look - second drawer,”</i> he replies in gasps.");
		// PC height > 4'3":
		if (pc.tallness > 51) output(" <i>“Only difference - she doesn’t need - kneel.”</i>");
		output("\n\nOh my. Red colors your thoughts and you don’t control the urge to begin to hammer his ass fervently, the bed’s backboard clapping against the wall briskly as you pump your [pc.cock " + y + "] into his greased, clenching tunnel again and again. His athletic build makes him a fine, limber, weasel-like fuck, rippling and holding up around your bulging, pre-beading dick firmly, tails tensing up and shivering with each clap of your hips against his.");
		output("\n\nYou grasp one of those fuzzy appendages and groan as the pressure becomes unstoppable, your glans dilating and then shooting off one heavy load after the other of [pc.cum] into the kaithrit’s tight boy pussy. You piston into him ardently as your body is clutched with orgasm, determined to pack him with as much of your thick seed as possible, coiling his own dick all the while. He shudders with gasps, and looks over his shoulder at you with an odd, pleading expression in his long-lashed eyes as you do.");
		output("\n\n<i>“Cum,”</i> you say, almost without thinking. Immediately Godi’s cock swells in your hand and he groans hoarsely in ecstasy as lengths of his cum spurt copiously up towards his face. Even still caught in the throws of your own high, fucking every last drop of your payload into his guts, you’re impressed. Did Una train him to do that? Or is it the product of a male kaithrit upbringing? Either way, you feel a deep desire to get yourself a cat boy of your very own. You husk as much into his ear when you finally pulse your last into him.");
		output("\n\nYou withdraw, enjoying the sensation of sliding out of his cum-filled hole and the sight of the well-gaped ass you leave behind, and lie back on the bed, feeling relaxed and sensuous. You watch in a semi-doze as Godi, once he’s recovered his breath, get up, wipe himself down, and then walk slightly knock-kneed over to the corner of the room.");
		// First:
		if (flags["ARBETZ_SEX_ONE_BOY"] == undefined)
		{
			output("\n\nYou frown as he reaches up and fiddles with a gun-metal spherical shape fixed to the ceiling. The quiet humming sound halts, and he pockets a small, oblong shape. Understanding sinks into you as Godi turns to grin at you sheepishly.");
			output("\n\n<i>“She, uh, likes to watch,”</i> he says. <i>“Later, I mean. Says it’s a fair price for taking us away from our duties. I make sure they don’t get out of this building though, so don’t worry about that. Unless you want them to, I guess.”</i>");
			output("\n\nGood fucking void that woman. You shake your head despairingly, pull your");
			if (!pc.isNude()) output(" clothes");
			else output(" gear");
			output(" back on, and return to the lobby.");
		}
		// Repeat:
		else
		{
			output("\n\n<i>“She must have enough of those now to make an anthology,”</i> you say dryly as he turns off the camera and retrieves the data bead.");
			output("\n\n<i>“You know what a porn habit is like,”</i> he replies. He grins and rubs his cheek self-consciously. <i>“She, uh, really likes it when we do it.");
			// PC male:
			if (!pc.hasVagina()) output(" Calls it grade A... Yowee? Does that mean anything to you?");
			// Otherwise:
			else output(" You can’t ever get enough.");
			output(" I’ll make sure they never leave this building though, don’t worry. Unless you want them to, I guess.”</i>");
			output("\n\nYou shake your head despairingly, pull your");
			if (!pc.isNude()) output(" clothes");
			else output(" gear");
			output(" back on, and return to the lobby.");
		}
		
		processTime(20);
		pc.orgasm();
		IncrementFlag("ARBETZ_SEX_ONE_BOY");
		
		addButton(0, "Next", mainGameMenu);
	}
	// Two Boys - pg 1
	else if (response == "two")
	{
		showBust("GODI", "PETR");
		showName("GODI &\nPETR");
		
		output("<i>“You don’t mind if I borrow both?”</i> you say, eyeing the taut, lean muscle casually on display next to Una.");
		output("\n\n<i>“Of course not. Gets them from under my feet for a while,”</i> replies Una breezily. She turns towards the veranda. <i>“Godi! You and Petr come and see to this young " + pc.mf("man", "lady") + ", please. I don’t want to see hide or hair of you for a good hour.”</i> You follow the bob of the kaithrit’s two dusty-orange tails and the human’s tight, swim shorts-clad buns deeper into the agency.");
		output("\n\n<i>“Thanks for getting me off desk duty,”</i> says Petr, opening the door to");
		if (flags["ARBETZ_SEX_ORAL"] != undefined) output(" the gabilani’s boudoir");
		else output(" what is evidently the gabilani’s boudoir. It’s primly tidy, all done in corn yellow, has a distasteful amount of frilling going on and is dominated by a bed sized well out of proportion to her. There’s a quiet humming sound coming from somewhere");
		output(". <i>“Manually sorting spreadsheets stops being a novelty after, like, five minutes.”</i>");
		output("\n\n<i>“You don’t know,”</i> you murmur. <i>“I could be harder work.”</i> A long, warm hand slides down your back and squeezes your [pc.butt].");
		output("\n\n<i>“I think we’ll manage.”</i>");
		
		processTime(5);
		
		// Create Godi & Petr
		if (!pp.totalCocks() < 2) pp.createCock();
		if (!pp.totalCocks() < 2) pp.createCock();
		pp.shiftCock(0, GLOBAL.TYPE_FELINE);
		pp.shiftCock(1, GLOBAL.TYPE_HUMAN);
		pp.cocks[0].cLengthRaw = 6;
		pp.cocks[1].cLengthRaw = 8;
		pp.elasticity = 2;
		
		addButton(0, "Next", arbetzSexScenes, "spitroasted");
	}
	// Two Boys - pg 2
	else if (response == "spitroasted")
	{
		showBust("GODI_NUDE", "PETR_NUDE");
		showName("GODI &\nPETR");
		
		if (pc.hasVagina())
		{
			x = pc.cuntThatFits(pp.cockVolume(0));
			if (x < 0) x = pc.biggestVaginaIndex();
		}
		if (pc.hasCock())
		{
			y = rand(pc.cockTotal());
		}
		
		var inButt:Boolean = false;
		if
		(	(pc.hasCock() && !pc.hasVagina())
		||	(pc.hasCock() && pc.hasVagina() && rand(2) == 0)
		) 
		{
			inButt = true;
		}
		
		output("You find yourself wondering if the temperature of the agency - sunny, humid yet breezy enough not to be oppressive - is calibrated exactly so sex feels like the natural thing to do. Given how calculated yet impetuous Una is, it wouldn’t surprise you. Whatever the case,");
		if (pc.tallness <= 54) output(" sitting down");
		else output(" relaxing yourself");
		output(" between the two tall, lean boys on the bed and sliding a hand into each pair of shorts, finding and slowly jerking a nubby cat cock and a pendulous human length to straining hardness at the same time, basking in the heat and the increasingly ragged breath pressing into you on both sides, seems like a completely obvious action.");
		output("\n\nYou coil them, teasingly stoking their urgency until it boils over. You " + pc.mf("laugh", "giggle") + " and then gasp as Petr shoots one hand between your [pc.thighs] whilst moving you with the other on your shoulder, fingers stroking demandingly at the");
		if (!inButt) output(" crease of your [pc.vagina " + x + "]");
		else output(" underside of your own [pc.cock " + y + "]");
		output(". Meanwhile, Godi sets about fervently removing your [pc.gear], ripping his own shorts off as he does. They are strong but not rough: their hands - finding, cusping and squeezing");
		if (pc.hasBreasts()) output(" your [pc.chest],");
		output(" your [pc.butt] and [pc.nipples] - are those of confident artisans. With your");
		if (inButt) output(" [pc.cock " + y + "]");
		else output(" [pc.vagina " + x + "]");
		output(" being mercilessly stroked into");
		if (inButt) output(" bulging hardness");
		else output(" sopping wetness");
		output(" by them, it’s beyond pleasant to abandon yourself to them and let them move you however they wish.");
		output("\n\n<i>“That’s it,”</i> murmurs Petr, knelt in front of you and presenting his thick, musky, six inch dick to your [pc.lips]. They’ve got you between them");
		if (pc.hasBreasts()) output(", [pc.chest] brushing gently over the sheet");
		output(" with your ass in the air and shamelessly presenting yourself to Godi. His breath billows over your naked back as he pushes his hot cock between your butt cheeks");
		if (!inButt) output(", his tight balls pressing against your [pc.vagina " + x + "]");
		output(". You look over your shoulder at him provocatively, wiggling your [pc.butt]; his response is to take hold of your [pc.thighs] and drive his pink cat cock into your " + (inButt ? "[pc.asshole]" : ("[pc.vagina " + x + "]")) + " in a single movement, the hard, feverous meat filling you up. It pushes you forward into Petr, and you happily open your mouth to accommodate him, enveloping his hard, delicious-smelling cock and hollowing your cheeks around it.");
		
		if (inButt) pc.buttChange(pp.cockVolume(0));
		else pc.cuntChange(x, pp.cockVolume(0));
		
		output("\n\n<i>“That’s it...”</i> groans the human again, eyes closed. <i>“Bit deeper...”</i> You allow the pump of Godi’s athletic hips to drive your [pc.lips] further and further up the human boy’s length, the dimpled knobs on the kaithrit’s cock sending pleasure nibbling through you as they rub on your");
		if (!inButt) output(" wet pussy");
		output(" walls with each clap of his thighs on your [pc.butt]. Head beginning to swim with arousal, your lips are soon pressed against his groin, dick-meat filling every inch of your maw. Breath hissing out of your nostrils, you slide your [pc.tongue] along his tender underside, feeling rich pre oil the back of your throat in response.");
		output("\n\n<i>“Yes! Oh, the gabilani would never... you’ve no idea how...”</i> Petr stops trying to put in words how good your cock-sucking is, instead expressing it by grasping your head in his strong hands and beginning to fuck your mouth with energetic pumps of his sleek hips.");
		output("\n\nThe kaithrit’s hands clasp your sides");
		if (pc.hasBreasts()) output(", moving up to cusp your [pc.chest]");
		output(", massaging you up and down with as much care as the enthusiastic pummeling he’s giving your");
		if (inButt) output(" ass");
		else output(" pussy");
		output(" is rough.");
		if (inButt) output(" He bends into your tunnel, riding over your prostate again and again as his nubby girth rubs you deep until your own [pc.cock " + y + "] is arching against your stomach, bulging and twitching with uncontainable lust.");
		else
		{
			output(" He bends into your soft, tender tunnel, hitting your sweet spot again and again as his nubby girth rubs you deep until your [pc.vagina " + x + "] is");
			if (pc.isSquirter(x)) output(" dribbling");
			else output(" dripping");
			output(" arousal, flexing up around him gleefully.");
		}
		output(" To your sex-scattered thoughts it feels like the way you keep sucking closely at the hot jack-hammer of Petr’s dick, not letting it escape your mouth even for a moment, is being rewarded by the high pleasure of taking a hard, athletic fuck right where it makes you clutch at the sheets, your [pc.nipples]");
		if (!pc.isLactating()) output(" standing out");
		else output(" dribble [pc.milk]");
		output(" as you " + pc.mf("groan", "whine") + " your muffled approval.");
		output("\n\nThe pressure and heat build and build, warm, rough hands caressing your [pc.nipples]");
		if (pc.tailCount > 0) output(" and [pc.tail]");
		output(" until your eyes cross and your " + (inButt ? "[pc.asshole]" : ("[pc.vagina " + x + "]")) + " convulses around Godi’s bumpy rod,");
		if (inButt) output(" your [pc.cock " + y + "] spraying [pc.cum] deliriously in response to the incessant bumping on your boy button");
		else
		{
			output(" [pc.girlCum]");
			if (pc.isSquirter(x)) output(" spurting");
			else output(" dripping");
			output(" deliriously around it as female pleasure clenches up your whole body");
		}
		output(". Your muffled, wet moans are joined by the kaithrit’s own breathy exhalations a moment later, and he thrusts his dick into your quivering tunnel all the harder, warm cum filling out your");
		if (inButt) output(" colon");
		else output(" womb");
		output(".");
		output("\n\nPetr sits it out, watching both of you ride out your orgasms with serene, distant pleasure whilst gently feeding his girthy, veiny cock back and forth between your lips. It’s only when you’re a soft, oozing mess and you can feel the other boy lean back, his satiated dick flop out of your leaking");
		if (inButt) output(" [pc.anus]");
		else output(" twat");
		output(" that he drives to his own high. He holds your head firmly and uses the succulent friction of your [pc.tongue] and [pc.lips] frenetically, saliva running down your chin and liberally coating the steady beat of his balls, until with a hoarse bark he reaches it, his cock swelling up and then surging thick, coating cum into your mouth and down your gullet. Simmering in well-fucked pleasure you curl your hands around his tight bum and drink it down, not letting him escape your suck until the poor, blowjob-starved boy has given you every last musky drop. You give his turgid dick a teasing lick when he finally releases you and draws himself out.");
		output("\n\n<i>“ ...awesome,”</i> he sighs, leaning back against the headboard. A grinning Godi sinuously slides up on the other side and once again you find yourself sandwiched between lean, hot boy beef, lightly oiled with sweat. You lean into one and enjoy the feeling of cum leaking steadily out of your gently gaped");
		if (inButt) output(" asshole");
		else output(" pussy");
		output(". <i>“You’ll keep coming around, right [pc.name]? I could definitely get used to this kind of spreadsheet break.”</i> Godi murmurs his agreement, hand brushing down your [pc.lowerBody]. <i>“You wanna go again in five?”</i> asks Petr, enthusiasm husking his voice. <i>“It’s not been an hour yet.”</i>");
		// Medium/High libido or bimbo/brute:
		if (pc.isBimbo() || pc.isBro() || pc.libido() > 50)
		{
			output("\n\nYou can happily fuck for as long as they can keep it up, and you tell them as much. That gets them going. Strokes turn to fondles turn to squeezes on your [pc.hips], [pc.nipples] and [pc.ass], and before long you are ridden up on Petr’s lap, his sturdy club of a dick firmly wedged in your ass whilst Godi");
			// Vagina:
			if (!inButt)
			{
				output(" bucks between your spread thighs, flat chest batting against your [pc.chest] as he rams your [pc.vagina " + x + "] full of the shifting soft spines of girthy hot cat cock.");
				output("\n\nYou buck and jounce between them gleefully, shoulders and [pc.chest] rubbing against their warm, stiff chests, gasping and then crying out to how their dicks press together through your tender flesh, rubbing you incessantly towards a second orgasm. You clutch them around their shoulders, throw your head back and squeeze up around them as you reach it, the pleasure pulsing out from your cunt made all the richer for the coarseness of the cock pumping in and out of your stretched asshole.");
				output("\n\nDizzily you flop back on Petr’s chest and let the two of them satiate themselves on you for a second time, gasping and growling as they flap their swim-toughened thighs into you and then release their warm, gooey loads deep within you. You groan with profound contentment as you feel even more of it fill you up.");
			}
			// NoVagina:
			else
			{
				output(" keeps his hands curled around your thighs, thin, sugared lips and rough, wet tongue moving up and down your [pc.cock " + y + "].");
				output("\n\nYou buck and jounce between them gleefully, shoulders rubbing against Petr’s warm stiff chest as you thrust into Godi’s hot mouth, gasping and then crying out to how good both penetrating and being penetrated feels. You grip the kaithrit’s curly hair as you reach a second orgasm, the incessant rub of the cock in your back passage making you cum deliriously into the wet massage of his maw, the pleasure seizing you up made all the richer for the coarseness of the cock pumping in and out of your stretched asshole.");
				output("\n\nDizzily you flop back on Petr’s chest and let him satiate himself on you for a second time, gasping and growling as he flaps his swim-toughened thighs into your [pc.ass] and then releases his warm, gooey loads deep within you. You groan with profound contentment as you feel even more of it fill you up.");
			}
			
			processTime(10);
		}
		else
		// Low libido:
		{
			output("\n\nYou’re feeling pretty damn satiated right now so you politely turn him down, which the human accepts with an exaggerated sigh and squeeze of your shoulder.");
		}
		output("\n\nYou watch in a semi-doze as Godi, once he’s recovered his breath, get up, wipe himself down, and then walk over to the corner of the room, bare bum barely moving.");
		// First:
		if (flags["ARBETZ_SEX_TWO_BOYS"] == undefined)
		{
			output("\n\nYou frown as he reaches up and fiddles with a gun-metal spherical shape fixed to the ceiling. The quiet humming sound halts, and he pockets a small, oblong shape. Understanding sinks into you as Godi turns to grin at you sheepishly.");
			output("\n\n<i>“She, uh, likes to watch,”</i> he says. <i>“Later, I mean. Says it’s a fair price for taking us away from our duties. I make sure they don’t get out of this building though, so don’t worry about that. Unless you want them to, I guess.”</i>");
			output("\n\nGood fucking void that woman. You shake your head despairingly, pull your");
			if (!pc.isNude()) output(" clothes");
			else output(" gear");
			output(" back on, and return to the lobby.");
		}
		// Repeat:
		else
		{
			output("\n\n<i>“She must have enough of those now to make an anthology,”</i> you say dryly as Godi gets up, turns off the camera and retrieves the data bead.");
			output("\n\n<i>“You know what a porn habit is like,”</i> he replies. He grins and rubs his cheek self-consciously. <i>“She, uh, really likes it when we do it.");
			// PC male:
			if (!pc.hasVagina()) output(" Calls it grade A... Yowee? Does that mean anything to you?");
			// Otherwise:
			else output(" You can’t ever get enough.");
			output(" I’ll make sure they never leave this building though, don’t worry. Unless you want them to, I guess.”</i>");
			output("\n\nYou shake your head despairingly, pull your");
			if (!pc.isNude()) output(" clothes");
			else output(" gear");
			output(" back on, and return to the lobby.");
		}
		
		processTime(20);
		pc.loadInMouth(pp);
		if (inButt) pc.loadInAss(pp);
		else pc.loadInCunt(pp, x);
		pc.orgasm();
		pc.orgasm();
		IncrementFlag("ARBETZ_SEX_TWO_BOYS");
		
		addButton(0, "Next", mainGameMenu);
	}
	// Hate Sex
	else if (response == "hate")
	{
		showUna(true);
		
		// Create Una
		if (!pp.hasVagina()) pp.createVagina();
		pp.shiftVagina(0, GLOBAL.TYPE_GABILANI);
		pp.girlCumType = GLOBAL.FLUID_TYPE_GABILANI_GIRLCUM;
		pp.vaginas[0].wetnessRaw = 20;
		
		y = pc.cockThatFits(pp.vaginalCapacity(0));
		if (y < 0) y = pc.smallestCockIndex();
		if (pc.cockVolume(y) > pp.vaginalCapacity(0)) isTightFit = true;
		
		output("You’ve had just about enough of this gabilani’s attitude. You feel something drop away from you as, without any warning, you");
		if (pc.hasLegs()) output(" step");
		else output(" move");
		output(" behind the agency’s desk and push your hand straight between Una’s soft, turquoise thighs, finding the outline of her warm, pudgy delta under her panties and stroking it through the fabric prospectively. You’re operating on pure, base instinct, and how easily all social grace evaporated from the situation with one shove of your hand makes your heart beat faster, heat surging down to your [pc.groin]. The self-possessed smirk has disappeared from her round face, and she stares at you mouth wide open, not moving. Even the boy sat next to her looks slightly shocked.");
		output("\n\n<i>“What - who - do you think you are,”</i> Una breathes.");
		output("\n\n<i>“I’m the " + pc.mf("guy", "girl") + " who’s up to [pc.hisHer] wrist in disgraced fat-mouthed slut snatch,”</i> you reply, looking her in the eye levelly. You slip your [pc.fingers] briskly beyond her underwear and curl them into her heat, finding her wet hole and sliding inside. <i>“What are you going to do about it?”</i>");
		output("\n\n<i>“Nobody talks to me like that,”</i> Una says. Purple spots have appeared on her cheeks, but her tone is low and stunned, and still she doesn’t move. <i>“I will have you killed. You don’t think I can’t or won’t? I’ll scrap your ship. I’ll have your crew turning tricks for me, just to make the money to get off this hellhole.”</i>");
		output("\n\n<i>“Big words for a small woman,”</i> you observe. Warm lubricant coats your fingers as you curl deeper and deeper between her thighs. You reach for the right incitement. <i>“Bet that sister of yours has got a tighter cunt than you, even. What was her name, Or--?”</i>");
		output("\n\nUna surges out of her seat and mashes her thick lips into yours, at the same time as almost punching you in the [pc.nipple], grasping you there hard, launching her soft weight into you with enough force to knock you back a couple of steps. The next moment you are on the cool marble floor with her on your lap, pulling the tight layers of her clothes off to make her pliant flesh loll out");
		if (!pc.isNude())
		{
			output(" whilst she does the same to you, reaching turquoise hands up and around to rip");
			if (pc.hasArmor() && pc.hasLowerGarment()) output(" first your [pc.armor] and then your [pc.lowerUndergarment]");
			else if (pc.hasArmor()) output(" your [pc.armor]");
			if (pc.hasUpperGarment())
			{
				if (pc.hasArmor() || pc.hasLowerGarment()) output(" and");
				else output(" your");
				output(" [pc.upperUndergarment]");
			}
			output(" off with impatient violence");
		}
		output(". Once it’s done she again fiercely pushes her mouth into your [pc.lips], jiggling breasts pressing into your [pc.chest]. She catches your lower lip and bites hard. In response you grasp a big, soft buttock and sink your fingers into it deep, relentlessly frigging her sopping tunnel with two fingers all the while.");
		output("\n\n<i>“I’ll just, uh...”</i> says a hesitant male voice from somewhere. <i>“...yeah.”</i>");
		// Exhibitionist:
		if (pc.exhibitionism() >= 66) output(" You feel hard, fleeting chagrin that there isn’t a way to force the boy to watch.");
		output("\n\nYour [pc.cock " + y + "] is rock hard, pressing into Una’s thick thigh, zero stimulation needed to be turned on in this hot, fierce moment.");
		output("\n\n<i>“C’mon then, you fucker,”</i> the gabilani growls into your mouth. <i>“C’mon then, if you think you’re all that...”</i> you respond by thrusting deep into the hot swamp of her pussy, ramming");
		if (!isTightFit) output(" every bulging inch");
		else output(" a considerable amount of your massive cock");
		output(" in with a single curt movement, turning her snarl into a gasp. Her walls are slack and easy around you for a single moment - then Una flexes her hips, flesh rippling against your own [pc.hips], and her muscles lock around you hard.");
		
		pc.cockChange();
		
		// Knot cock:
		if (pc.hasKnot(x)) output(" The thick rim of hot flesh at the bottom of your dick is still outside her. With a few struggling, fitful jerks against her, you manage to squeeze it inside her puffy lips. If she’s going to lock you in, you sure as hell are going to lock into her.");
		output("\n\nThe moment your [pc.cock " + y + "] is clenched within her, Una immediately begins to ride you, one hand clenched hard on your [pc.chest] and another");
		// Over 6 ft:
		if (pc.tallness >= 72) output(" reaching far up to");
		output(" grasping at the nape of your neck and your [pc.hair], using you unyieldingly to work out the massive amount of frustration you’ve managed to tap within her pint-sized frame. You can’t help but gasp yourself - her tunnel is every bit as tight and muscular as the rest of her shortstack frame is soft and pliant, slapping and squashing into you with each fresh drive of her heavy hips. It almost <i>twists</i> your dick in the wet silkiness, as if the bitch herself has got it in her hand and is making you pay for the outrageous smack-talk you just laid down.");
		output("\n\nEnflamed, you surge up to meet its challenge, clutching the generous pear of her wobbling backside and thrusting your [pc.cock " + y + "] into her kneading cunt, digging it into her walls, making her feel it as surely as she’s making you feel her. You try and work yourself off your [pc.butt], trying to upend her so you can really rail her. Una responds with a feral snarl, raining blows and scratches");
		if (pc.tallness <= 54) output(" on your head and chest");
		else output(" as far up your [pc.belly] and [pc.chest] as she can reach");
		output(", pussy rippling around your erection in quivering arousal as she does. You slap her in the face, make the fatness of her breast bulge between your fingers as you clamp down on one distended, navy nipple and squeeze cruelly. She");
		if (pc.hasHair()) output(" takes a handful of your [pc.hair] and pulls,");
		output(" practically");
		if (pc.hasHair()) output(" headbutting");
		else output(" headbutts");
		output(" you as she mashes her mouth into your [pc.lips] again, serpentine tongue and hot, hard breath invading your mouth. It’s feral, it’s prickly, and the more vicious it gets the better the wet, wrenching struggle-fuck becomes.");
		output("\n\nYou bark hoarsely and mold as much of yourself into Una’s sweaty, heaving softness as your [pc.cock " + y + "] bulges in irresistible, juicy release, [pc.cum] practically vacuumed out of your hardness into the gabilani’s ruthless, sweltering knead. She doesn’t care; beetle-black eyes fixed entirely on her own prize, breath hard on your");
		if (pc.tallness <= 54) output(" face");
		else output(" [pc.chest]");
		output(", she rides your spurting dick in total disregard, its rocklike state trapped within the squeeze of her pussy muscles as surely as if you were fitted with a cock-ring.");
		output("\n\nYou refuse to give her an inch - or rather, you want to give her every inch. You hammer your [pc.hips] into her with every pulse of your prick even as your cum");
		if (pc.isSquirter()) output(" gushes");
		else output(" dribbles");
		output(" filthily back out of her oozing lips, trying to force her to orgasm. Two of your fingers inch around an ample turquoise butt cheek and then suddenly spear past the tight ring of her anus; her thick, black lips open wide, she");
		if (pc.hasBreasts()) output(" grabs a sore, tortured [pc.nipple] and pulls");
		else output(" sticks two of her own fingers into your cheek and pulls");
		output(", and then her pussy seizes up around your [pc.cock " + y + "], rippling around your aching, still throbbing member. A warm, filthy slurry of her juices and [pc.cum] oozes out across your waist as her belly blats roughly against your own again and again.");
		output("\n\nYou collapse back onto the smooth marble when it’s finally over, Una’s pussy finally relaxed");
		if (pc.hasKnot(x)) output(" and your knot deflated");
		output(" enough for you to part, sweat drying on your brow and heart hammering in your chest, the warm, sticky weight of the gabilani plastered to your side. Lying next to her as if you were the best of lovers feels utterly perverse - particularly as the scratches and welts she’s left on you begin to burn - but you have neither the will or energy to do anything else.");
		output("\n\n<i>“I’m still going to have you killed, you know,”</i> says a husky female voice, lazy with deep content. The warm softness slides up you until plump, black lips are near your ear. <i>“Just as soon as you stop being a really good lay. Stay motivated.”</i> Una’s hand curls around your throat before drifting over your shoulders as she picks herself up, leaving you to pick up your own scattered gear. Right now, you cannot summon a biting enough response. Save your bile for next time, perhaps.");
		
		// - 100% Lust, - 5% HP, - 10% Energy
		processTime(35);
		pc.HP(-5);
		pc.energy(-10);
		pc.orgasm();
		pc.orgasm();
		IncrementFlag("ARBETZ_SEX_HATE_FUCK");
		
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

// Pool Options
public function arbetzPoolOptions(response:int = 0):void
{
	clearOutput();
	author("Nonesuch");
	showUna();
	clearMenu();
	
	// No / Don’t
	if (response == 0)
	{
		output("<i>“I’m not paying that just to use a swimming pool!”</i> you snap.");
		output("\n\n<i>“Of course not,”</i> Una sneers. <i>“Plenty of others around here, after all. You go out there and work those pretty legs of yours");
		if (pc.hasLegs()) output(" - or whatever you call that -");
		output(" until you’re not such a space " + pc.mf("tramp", "skank") + " that a little 5000 credits is too rich for your blood.”</i>");
		
		processTime(2);
		
		addButton(0, "Next", mainGameMenu);
	}
	// Pay
	else if (response == 1)
	{
		output("You pluck a credit chit from your belt, poke in the amount, and slap it down on the desk.");
		output("\n\n<i>“There’s a good college-fund kiddie,”</i> coos Una, squirreling it away. <i>“Towels are in the lockers and Petr can sell you swim gear. Knock yourself out.”</i>");
		
		processTime(2);
		
		//Pool area unlocked, "Petr" added to front desk options, “Pool Area” removed from front desk options
		output("\n\n<b>You’ve bought an Arbetz Travel Agency Premium Klub membership card which allows you access to the pool area.</b>");
		pc.credits -= 5000;
		pc.createKeyItem("Arbetz Travel Agency Membership", 0, 0, 0, 0, "");
		flags["PETR_UNLOCKED"] = 1;
		
		addButton(0, "Next", mainGameMenu);
	}
	// Other Way?
	else if (response == 2)
	{
		output("<i>“C’mon,”</i> you coax. <i>“There’s got to be another way I can get a swim.”</i>");
		
		// PC is male, flat chest, medium to high tone, is wearing something
		if (pc.hasCock() && pc.biggestTitSize() <= 0 && pc.tone > 25 && !pc.isNude())
		{
			output("\n\nUna looks up, an acid retort all but visible on her thick lips... and then she pauses, sits back and considers you for a long moment.");
			output("\n\n<i>“Y’know, maybe there is a way,”</i> she replies. <i>“I’m charged with advertising this place, and nothing advertises better than a lot of");
			if (pc.tallness >= 60) output(" tall");
			output(" beefcake draped liberally around it. </i>Three<i> of you, just... lounging around here, all of it belonging to me...”</i> A happy, vague smile has appeared on her face. You cough to focus her attention back on you. <i>“Alright, candy buns. Strip down to your undies. Work it like I’m rubbing a handful of credits here. Then I’ll let you use the pool.”</i>");
			
			processTime(2);
			
			// [Do it] [No]
			addButton(0, "Do it", arbetzPoolJUSTDOIT, 1);
			addButton(1, "No", arbetzPoolOptions, 3);
		}
		// PC is female, D cup or above, is not pregnant, is wearing something
		else if (pc.hasVagina() && pc.biggestTitSize() >= 4 && !pc.isPregnant()&& !pc.isNude())
		{
			output("\n\nUna looks up, an acid retort all but visible on her thick lips... and then she pauses, sits back and considers you for a long moment.");
			output("\n\n<i>“Y’know, maybe there is a way,”</i> she replies. <i>“Nice pair of fun-bags you’ve got there. I’m charged with advertising this agency, and nothing advertises better than having some bouncy cheesecake around the place. I, um, there was a bit of personal bias involved when I was choosing my staff... I’m sure you understand. It would be good to have something for our male customers to look at too, I guess.”</i> She smirks at you. <i>“Alright, tits. Strip down to your undies. Work it like I’m rubbing a handful of credits here. Then I’ll let you use the pool.”</i>");
			
			processTime(2);
			
			// [Do it] [No]
			addButton(0, "Do it", arbetzPoolJUSTDOIT, 0);
			addButton(1, "No", arbetzPoolOptions, 3);
		}
		// Otherwise
		else
		{
			output("\n\n<i>“No there bloody isn’t,”</i> replies Una bluntly. <i>“If you were something I’d like to have flopped <b>half-naked</b> near a pool, I’d consider it. But you aren’t. So either pay or buzz off.”</i>");
			
			processTime(1);
			
			// [Pay] [Don't]
			if (pc.credits < 5000) addDisabledButton(0, "Pay", "Pay", "You are just too poor for this!");
			else addButton(0, "Pay", arbetzPoolOptions, 1, "Pay", "Price: 5000 Credits");
			addDisabledButton(1, "Other Way?", "Other Way?", "You should probably be half-naked and have the body type Una is looking for before trying this option again...");
			addButton(2, "Don’t", arbetzPoolOptions, 0);
		}
	}
	// Other Way? - No
	else if (response == 3)
	{
		output("You aren’t degrading yourself for this woman just to use a damn pool, and you say as much.");
		output("\n\n<i>“Shame,”</i> Una sighs. <i>“Hate to see natural beauty like that wasted by a pert attitude. You going to pay the entrance fee then or what?”</i>");
		
		processTime(1);
		
		// [Pay] [Don't]
		if (pc.credits < 5000) addDisabledButton(0, "Pay", "Pay", "You are just too poor for this!");
		else addButton(0, "Pay", arbetzPoolOptions, 1, "Pay", "Price: 5000 Credits");
		addButton(1, "Don’t", arbetzPoolOptions, 0);
	}
}

// ShiaLabeoufenning
public function arbetzPoolJUSTDOIT(sex:int = 0):void
{
	clearOutput();
	author("Nonesuch");
	showUna();
	clearMenu();
	
	var clothingCount:int = 0;
	if(pc.hasArmor()) clothingCount++;
	if(pc.hasUpperGarment()) clothingCount++;
	if(pc.hasLowerGarment()) clothingCount++;
	var inOnepiece:Boolean = (pc.hasArmor() && !pc.isChestExposedByArmor() && !pc.isCrotchExposedByArmor() && !pc.hasUpperGarment() && !pc.hasLowerGarment());
	var inTwopiece:Boolean = ((pc.hasArmor() || pc.hasUpperGarment()) && !pc.isChestExposed() && pc.hasLowerGarment());
	
	output("This is near enough a free lunch, really.");
	if (pc.exhibitionism() < 66) output(" Slightly self-consciously");
	else output(" Shivering slightly with the shameful delight of baring your naked flesh");
	output(", you begin to take off your [pc.gear]");
	if(clothingCount > 1) output(", piece by piece");
	output(".");
	
	// PC has any non-exposed, non-swimwear lower undergarment:
	if (pc.hasLowerGarment() && !pc.isCrotchExposed() && !isSwimsuit(pc.lowerUndergarment))
	{
		output("\n\n<i>“Oh for...”</i> Una’s leer is broken with a snort of hysterical laughter buried into her suited arm when you take off your [pc.lowerGarments]. <i>“You never learned that less is more, did you dear?”</i> she sighs once she’s recovered, gazing down at");
		if (pc.hasCock()) output(" [pc.eachCock]");
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina()) output(" [pc.eachVagina]");
		output(" with a mixture of pity and fondness. <i>“Talk to Petr. He’ll fix you up with some swim gear, if you don’t have any yourself. Then maybe we’ll try again.”</i>");
		
		processTime(2);
		pc.lust(5);
		
		//Unlocks Petr
		flags["PETR_UNLOCKED"] = 1;
		
		addButton(0, "Next", mainGameMenu);
		return;
	}
	else if (pc.inSwimwear(true) && !pc.isCrotchExposed())
	{
		output(" When you reach for your [pc.lowerGarment], the shortstack blurts out an audible chuckle.");
		output("\n\n<i>“--I see you came prepared to swim, didn’t you?”</i> Una grins lustfully. <i>“However, this photoshoot isn’t for that...”</i> she points at your covered crotch.");
		if (pc.exhibitionism() < 66) output("\n\nGiving her a confused look, you reply with a slight blush of embarrassment.");
		else output("\n\nYou give a confident nod. Oh, you know what this woman wants to see.");
		output("\n\n<i>“Take it off.”</i>");
		if (pc.exhibitionism() < 66) output("\n\nAfter getting this far, there’s no use turning back now. Finally");
		else output("\n\nWithout a moment’s hesitation");
		output(", you peel your swimwear off....");
	}
	//Otherwise:
	output("\n\n<i>“Aww yeah,”</i> leers Una, eating up your every move with wide, black eyes.");
	
	// Male
	if (sex == 1)
	{
		output(" <i>“Who’s Una’s good boy? Let’s see you shake that moneymaker of yours, you big dumb stallion.”</i> You turn and give your [pc.butt] a jounce");
		if(inOnepiece) output(" whilst displacing the top half of your [pc.armor] with a little flourish and keeping your bottom half dressed");
		else if(inTwopiece) output(" whilst discarding your [pc.upperGarment] with a little flourish, dressed now only in your [pc.lowerGarment]");
		output(".");
		if (pc.exhibitionism() < 66) output(" You hope the way your cheeks are burning isn’t too obvious.");
		else output(" Your [pc.cock] is hotly erect from stripping down in this manner.");
		output("\n\n<i>“Now turn,”</i> the gabilani says. <i>“Let’s see the goods.”</i> You face her again, bare-chested,");
		if (pc.exhibitionism() < 66) output(" trying not to look too exasperated.");
		else output(" not even attempting to disguise how aroused demeaning yourself like this has gotten you. You stick your thumbs beneath the elastic of your [pc.lowerGarment] and give her the eyes.");
		output(" <i>“Veeeeery nice,”</i> she coos, squeezing her thick thighs together. <i>“");
		// PC has talked to her:
		if (flags["UNA_TALKED"] != undefined) output("You need to get out of frontier hustling Steele, look into professional fuck boying. You’ll break my heart by getting all that lean beef burnt to a laser crisp, one of these days... ");
		output("Alright then; I guess you can use the pool. Towels are in the locker and Petr can sell you swim gear if you need it. Make sure to wear plenty of suntan, okay? The only reason your flesh should be red and tender is if I had something to do with it.”</i>");
	}
	// Female
	if (sex == 0)
	{
		output(" <i>“Who’s Una’s good girl? Let’s see you shake that mantrap of yours, you dumb bimbo.”</i> You turn and give your [pc.butt] a jounce");
		if(inOnepiece) output(" whilst displacing the top half of your [pc.armor] with a little flourish and keeping your bottom half dressed");
		else if(inTwopiece) output(" whilst discarding your [pc.upperGarment] with a little flourish, dressed now only in your [pc.lowerGarment]");
		output(".");
		if (pc.exhibitionism() < 66) output(" You hope the way your cheeks are burning isn’t too obvious.");
		else output(" Your [pc.vagina] is flush with [pc.girlCum] from stripping down in this manner.");
		output("\n\n<i>“Now turn,”</i> the gabilani says. <i>“Let’s see the goods.”</i> You face her again, bare-chested");
		if (pc.exhibitionism() < 66) output(", trying not to look too exasperated.");
		else output(" and don’t even disguise how aroused demeaning yourself like this has gotten you. You lean forward, squeeze your [pc.chest] and pout your [pc.lips].");
		output(" <i>“Veeeeery nice,”</i> she coos, squeezing her thick thighs together. <i>“");
		// PC has talked to her:
		if (flags["UNA_TALKED"] != undefined) output("You need to get out of frontier hustling Steele, look into professional slutting. You’ll break a great number of hearts by getting all that chicken burnt to a laser crisp, one of these days... ");
		output("Alright then; I guess you can use the pool. Towels are in the locker and Petr can sell you swim gear if you need it. Make sure to wear plenty of suntan, okay? Boobs aren’t nearly as attractive when they’re all red and flaky.”</i>");
	}
	
	output("\n\nYou feel distinctly degraded");
	if (pc.exhibitionism() >= 66) output(" and very turned on");
	else output(" if undeniably a little turned on");
	output(", but hey, free pool. That’s what matters here.");
	
	//Pool area unlocked, "Petr" added to front desk options, “Pool Area” removed from front desk options
	output("\n\n<b>You’ve earned an Arbetz Travel Agency Premium Klub membership card which allows you access to the pool area.</b>");
	pc.createKeyItem("Arbetz Travel Agency Membership", 0, 0, 0, 0, "");
	flags["PETR_UNLOCKED"] = 1;
	
	// + Lust, ++ Lust if Exhibitionist
	processTime(25);
	pc.lust(10);
	if (pc.exhibitionism() >= 25) pc.lust(10);
	if (pc.exhibitionism() >= 50) pc.lust(10);
	if (pc.exhibitionism() >= 75) pc.lust(10);
	if (pc.exhibitionism() >= 100) pc.lust(10);
	
	addButton(0, "Next", mainGameMenu);
}
// Pool Area Unlocked
public function arbetzPoolBonus():Boolean
{
	clearOutput();
	
	if (arbetzActiveHours())
	{
		showBust("GODI");
		author("Nonesuch");
		
		// Blurb
		output("You are standing beside the pool. It’s blue, decently sized, has a diving board and winks fractured beams of Tarkus’s sun back at you merrily. The area around it is paved in white and has deckchairs here and there. On one of these");
		if (flags["UNA_TALKED"] < 4) output(" the kaithrit boy");
		else output(" Godi");
		output(" is flopped, involved entirely in his media device.");
		// Fucked 1 or 2 boys:
		if (flags["ARBETZ_SEX_ONE_BOY"] != undefined || flags["ARBETZ_SEX_TWO_BOYS"] != undefined) output(" He does give you a shy smile when you step out onto the veranda, though.");
		output(" It’s otherwise deserted, save for the pleasant breeze ruffling the well-manicured vegetation that rings the compound.");
		output("\n\nDiscretely bordered off by green shrubs you can make out a heavily scorched landing pad behind the pool. Standing against the walls of the agency are several vending machines as well as a block of lockers.");
		
		// [Swim] [Vending Machine] [South]
		if (!pc.isNude())
		{
			if (pc.hasArmor() && isSwimsuit(pc.armor) && (pc.hasUpperGarment() || pc.hasLowerGarment())) addDisabledButton(0, "Swim", "Swim", "You should take off your undergarments first. You are wearing a swimsuit after all.");
			else if (!pc.inSwimwear()) addDisabledButton(0, "Swim", "Swim", "You should take off your outer layers first. No point in ruining them.");
			else addButton(0, "Swim", arbetzSwimOptions, 0, "Swim", "Go for a swim.");
		}
		else addButton(0, "Swim", arbetzSwimOptions, 0, "Swim", "Go for a swim.");
		addButton(1, "V.Machine", arbetzVendingMachine, undefined, "Vending Machine", "Buy a snack to eat.");
		gooArmorTalkButton(2);
	}
	else
	{
		showUna();
		
		output("You are standing beside the pool. It’s blue, decently sized, and has a diving board. The area around it is paved in white and lined with deckchairs. It seems to be unpopulated at the moment.");
		output("\n\nSuddenly, you feel a tap on your");
		if (pc.tallness <= 48) output(" shoulder");
		else if (pc.tallness <= 60) output(" waist");
		else if (pc.tallness <= 72) output(" [pc.thigh]");
		else output(" [pc.leg]");
		output(" and quickly turn around.");
		output("\n\n<i>“Ahem.”</i> It’s Una and she doesn’t look too pleased at your presence. <i>“I’m not sure how you treat schedules on your home planet, but I would like it if you took mine seriously. I’m running a facility here, not a 24-hour playground!”</i>");
		output("\n\nYou take a glance at your codex and note the time. Oh. It must be after hours already...");
		output("\n\n<i>“You’re bloody right it is, " + pc.mfn("beefcakes", "sweet cheeks", "honey buns") + ". I don’t want to be held liable for any of your screw ups. Now, can you kindly move that");
		if (pc.buttRating() <= 2) output(" tight");
		else if (pc.buttRating() <= 4) output(" little");
		else if (pc.buttRating() > 4)
		{
			output(" big");
			if (pc.thickness > 60) output(", fat");
		}
		output(" arse of yours out of here so I can close up properly?");
		if (arbetzTotalFucks() > 0) output(" Please.");
		output("”</i>");
		if (flags["ARBETZ_SEX_HATE_FUCK"] != undefined) output(" Well, at least she retains some form of hospitality...");
		output("\n\n");
		if (pc.isBimbo()) output("<i>“Okay, okay... Like, I just wanted to get my daily tan and stuff--a [pc.girl]’s gotta keep [pc.himHer]self pretty, ya know?”</i> ");
		if (pc.isBro()) output("<i>“Whoa, whoa... I was just out for a dip--No need to get your panties in a bunch, lady. I got it.”</i> ");
		if (pc.isNice()) output("Understandingly, you briefly apologize, collect your belongings and head out.");
		if (pc.isMischievous()) output("Not wanting to overstay your welcome, you collect your things and head out.");
		if (pc.isAss()) output("Ugh, what a bitch. You grumble, take your things and leave.");
		
		processTime(5);
		
		clearMenu();
		addButton(0, "Next", move, "ARBETZ MAIN");
		return true;
	}
	
	return false;
}
public function arbetzSwimOptions(response:int = 0):void
{
	clearOutput();
	author("Nonesuch");
	showName("SWIMMING\nPOOL");
	
	// Swim
	if (response == 0)
	{
		output("You bounce off the diving board straight into the cool embrace of the pool. <i>Ahhhh...</i> marvelous! You splash about for a time, simply enjoying the feeling of the water coruscating off your [pc.skin].");
		
		processTime(5);
		
		// [Train] [Relax]
		clearMenu();
		if (pc.energy() >= 20 && !pc.hasStatusEffect("Sore")) addButton(0, "Train", arbetzSwimOptions, 1);
		else addDisabledButton(0,"Train","Train","You’re too tired for a workout.");
		addButton(1, "Relax", arbetzSwimOptions, 2);
	}
	// Train
	else if (response == 1)
	{
		output("It would be foolish to pass up one of the more enjoyable ways to get some hard exercise done. You cut your way through the water back and forth up the pool, trying out various different strokes and pushing yourself to work every muscle in your limbs. After half an hour or so you pull yourself out and towel yourself down, reveling in a satisfying burn.");
		
		// + Tone, - Thickness, - 20 energy, + 1 Physique, + 1 Soreness, + 30 minutes
		processTime(25);
		soreDebuff(1);
		pc.modTone(1);
		pc.modThickness(-1);
		pc.energy(-20);
		pc.slowStatGain("physique",1);
		pc.shower();
		
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	// Relax
	else if (response == 2)
	{
		output("It’s so peaceful here, particularly in comparison to the dirty chaos of Novahome and the bleak trash-scapes outside. Why would you want to do anything but doze? You find an inflatable lounger, launch it into the water, lie back on it and let the sun do its thing. The only physical activity you engage in for the next half hour is to use your [pc.lowerBody] to push yourself away from the side each time you run aground");
		//PC Misc:
		if (pc.isMischievous())
		{
			output(", and to teasingly flick water at");
			if (flags["UNA_TALKED"] >= 4) output(" Godi");
			else output(" the kaithrit");
			output(", who accepts this treatment with silent, wearied resignation");
		}
		output(". You dive down to the bottom once you’re done, enjoying the feeling of the water on your sun-touched [pc.skin] before climbing out, feeling thoroughly refreshed.");
		
		// + 30% energy, + 100% Health, + 30 minutes
		processTime(25);
		pc.energy(30);
		pc.maxOutHP();
		pc.shower();
		
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

// Vending Machine!
public function arbetzVendingMachine():void
{
	clearOutput();
	author("Nonesuch");
	showName("VENDING\nMACHINE");
	showBust("GOBLINOLA_VENDING_MACHINE");
	
	output("The gently humming machine is selling some sort of health snack called “Goblinola”.");
	
	// [Buy] [Leave]
	clearMenu();
	addOverrideItemButton(0, new Goblinola(), "Buy", arbetzBuyGoblinola, new Goblinola());
	addButton(14, "Leave", mainGameMenu);
}
public function arbetzBuyGoblinola(vendedItem:ItemSlotClass):void
{
	clearOutput();
	showBust("GOBLINOLA_VENDING_MACHINE");
	
	if (pc.credits >= vendedItem.basePrice)
	{
		author("Nonesuch");
		showName("GOBLINOLA\nVENDED!");
		
		output("You stick your cash in, and a few seconds later a wrapped treat rattles its way down to the lower compartment for you to take.");
		output("\n\n");
		
		processTime(1);
		
		arbetzVendItem(vendedItem);
	}
	// Too poor
	else
	{
		showName("INSUFFICIENT\nFUNDS");
		
		output("You shuffle through your gear to find some spare credit chits--even waving your codex over the machine’s scanner a couple times--but a negative beep answers your efforts. It looks like you don’t have enough money to purchase the " + vendedItem.longName + ".");
		
		processTime(1);
		
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}
public function arbetzVendItem(vendedItem:ItemSlotClass, price:Number = 0):void
{
	var vendedItemList:Array = [];
	
	vendedItemList.push(vendedItem);
	
	if (price > 0) pc.credits -= price;
	else pc.credits -= vendedItem.basePrice;
	
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	
	itemCollect(vendedItemList);
}

// Unlock Petr
public function arbetzPetrShop():void
{
	clearOutput();
	author("Nonesuch");
	showBust("PETR");
	showName("\nPETR");
	
	output("<i>“Hey,”</i> you say, addressing the tall, bare-chested, sandy-blonde boy at the desk. <i>“Hear you sell swim stuff.”</i>");
	output("\n\n<i>“Something like that,”</i> he replies affably. <i>“Me and Godi invited a bunch of our friends here for a party a couple months back, and you wouldn’t believe how many peeps left their stuff behind. It’s second hand obvs, so I’m not charging an arm and a leg for it. Money goes towards the pool filter.”</i>");
	
	// [Buy] [Leave]
	clearMenu();
	addButton(0, "Buy", arbetzPetrBuy);
	addButton(14, "Leave", mainGameMenu);
}
public function arbetzPetrBuy():void
{
	shopkeep = chars["PETR"];
	chars["PETR"].keeperBuy = "<i>“Here, check out the stash.”</i>\n";
	
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	
	buyItem();
	
	showBust("PETR");
	showName("BUY\nSWIMWEAR");
}
public function arbetzPetrBuyGo(item:ItemSlotClass):void
{
	author("Nonesuch");
	showBust("PETR");
	showName("ITEM\nPURCHASED!");
	
	output("You give Petr the money. He leans behind the desk and retrieves your swimsuit, which is thankfully well laundered and ironed.");
	output("\n\n<i>“Thanks, and take it easy,”</i> he grins.");
	
	var price:Number = getBuyPrice(chars["PETR"],item.basePrice);
	output("\n\nYou purchase " + item.description + " for " + num2Text(price) + " credits.");
	output("\n\n");
	
	processTime(2);
	
	arbetzVendItem(item, price);
}
