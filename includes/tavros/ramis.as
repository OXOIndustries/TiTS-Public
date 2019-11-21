/*

Ramis
Don’t fret boyo, I’ll be gentle

Plans/Ideas
•	Can be found in the evenings tying one on in some bar or other
7' tall and ripped as hell. Also loud. And booby. A merc who works for dubious concerns and spends it all on benders when off shift. Possibly run into her in some mission or other?
•	What she actually wants is a REAL MAN to top her in bed. Being a kaithrit she’s sick and tired of girly wimps. Has no interest in female, shemale or futa PCs (possibly you can party with her instead?) But obviously she’s not going to come right out and say it to guy PCs - you’re going to have to beat her at drinking and arm-wrestling first. 
•	Note to self: Night out variants for the highly alcohol resistant.
•	Jaguar colouration because damn, look at these guys: https://www.google.co.uk/search?hl=en&authuser=0&site=imghp&tbm=isch&source=hp&biw=1920&bih=969&q=jaguar+animal&oq=jaguar&gs_l=img.1.7.0l10.681.2004.0.6857.6.5.0.1.1.0.83.360.5.5.0....0...1ac.1.64.img..0.6.366.eUMl605fr0Q
•	Traps: She’ll laugh you off, but if you come back when she’s good and wasted she’ll make use of you, with extreme prejudice.
•	Sleeps whole night with you, for hung over snu snu good times.
•	Do some recruitment stuff for her, in case you want a violent alcoholic Welsh woman looking after your armaments. Takes shore leave in each planet’s bar once recruited.

*/

public function showRamis(nude:Boolean = false):void
{
	if (flags["RAMIS_MET"] != undefined) showName("\nRAMIS");
	else showName("KAITHRIT\nWOMAN");
	showBust(ramisBustDisplay(nude));
}
public function ramisBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "RAMIS";
	if(nude) sBust += "_NUDE";
	return sBust;
}

// Intros
// Appears every other day in Anon’s Bar between 21:00 - 01:30
// Edit, new time: 20:15 - 02:30
public function ramisAtAnons():Boolean
{
	if(pc.hasStatusEffect("Ramis Away Time")) return false;
	if(ramisIsCrew()) return false;
	
	if(flags["RAMIS_MET"] != undefined && pc.isFemboy() && looksFamiliarToRamis() && ramisFemboyHours()) return true;
	// Regular hours
	if((hours == 20 && minutes >= 15) || (hours > 20 || hours < 02) || (hours == 02 && minutes <= 30)) return true;
	
	return false;
}
// Feminine male re-approaches Ramis between 00:15 - 01:30
// Edit, new time: 00:15 - 02:30
public function ramisFemboyHours():Boolean
{
	if((hours == 00 && minutes >= 15) || (hours > 00 && hours < 02) || (hours == 02 && minutes <= 30)) return true;
	return false;
}
public function ramisAtAnonsAddendum(btnSlot:int = 0):void
{
	output("\n\n");
	if(flags["RAMIS_MET"] == undefined)
	{
		output("A party of spacers, mercs by the look of their muscles and tags, are getting rowdily drunk near the bar. A tall, muscular female kaithrit stands out - both visually and aurally. She slaps down another shot glass and crows with triumph, her friends whooping and roaring with laughter.");
		addButton(btnSlot, "Kaithrit", approachRamis, undefined, "Big Kaithrit", "Do you approach the rowdy drinker?");
	}
	else
	{
		// Only feminine males see this for simplicity’s sake
		if(pc.isFemboy() && looksFamiliarToRamis() && ramisFemboyHours())
		{
			// New blurb: 
			output("Ramis the kaithrit is all on her own by the bar now, her friends having long since left her to it. It’s not obvious if the bar is propping up the feline amazon or vice versa.");
			
			// [Ramis]
			addButton(btnSlot, "Ramis", approachRamis, "femboy", "Ramis", "She is all by her lonesome. Do you keep her company?");
			return;
		}
		output("Ramis and her mates are near the bar, loudly tying one on as usual.");
		addButton(btnSlot, "Ramis", approachRamis, undefined, "Ramis", "Greet the boisterous babe.");
	}
}

// Set away time
public function setRamisAway():void
{
	pc.createStatusEffect("Ramis Away Time", 0, 0, 0, 0, true, "", "", false, ((((24 - hours) + 1) * 60) + (60 - minutes)));
}
// Sex Counter
public function ramisSexed(sexType:String = "normal"):void
{
	switch (sexType)
	{
		case "man": IncrementFlag("RAMIS_SEXED_MAN"); break;
		case "trap": IncrementFlag("RAMIS_SEXED_TRAP"); break;
	}
	IncrementFlag("RAMIS_SEXED");
}
// Check if appearance looks the same for repeat encounters.
public function looksFamiliarToRamis():Boolean
{
	var isSame:Boolean = false;
	
	switch(flags["RAMIS_FIRST_IMPRESSION"])
	{
		case "girlee":
			if(pc.isWoman() || pc.isFemHerm() || pc.isSexless() || pc.isShemale()) isSame = true;
			break;
		case "boyo":
			if(pc.isFemboy()) isSame = true;
			break;
		case "lad":
			if(pc.isMan() || pc.isManHerm()) isSame = true;
			break;
	}
	
	return isSame;
}
// Create Ramis
public function getRamisPregContainer():PregnancyPlaceholder
{
	var ppRamis:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppRamis.breastRows[0].breasts = 2;
	ppRamis.breastRows[0].breastRatingRaw = 6;
	if(!ppRamis.hasVagina()) ppRamis.createVagina();
	ppRamis.shiftVagina(0, GLOBAL.TYPE_FELINE);
	//ppRamis.vaginas[0].wetnessRaw = 3;
	ppRamis.vaginas[0].loosenessRaw = 1;
	ppRamis.vaginas[0].bonusCapacity += 125;
	if (flags["RAMIS_STRETCHED"] != undefined) ppRamis.vaginas[0].bonusCapacity += flags["RAMIS_STRETCHED"];
	return ppRamis;
}
public function ramisTimesSexed():Number
{
	var sexed:int = 0;
	if(flags["RAMIS_SEXED"] != undefined) sexed += flags["RAMIS_SEXED"];
	if(flags["RAMIS_SEXED_SHIP"] != undefined) sexed += flags["RAMIS_SEXED_SHIP"];
	return sexed;
}
public function ramisTimesOrallySexedHer():Number
{
	var sexed:int = 0;
	if(flags["RAMIS_SEXED_FACESIT"] != undefined) sexed += flags["RAMIS_SEXED_FACESIT"];
	return sexed;
}

// Appearance
public function ramisAppearance(btnSlot:int = 0):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	
	output("The seven foot, two-inch tall, brown-skinned, honey-haired obelisk of taut muscle and generous feminine curves that calls itself Ramis is a kaithrit, and is definitely one of the more generously sized examples of her race. Beneath her tight jeans, each of her big, brawny buttocks is the size of a basketball, and her dark tank top and sports bra do not disguise her wide, round D-cups. Ropy muscle trembles restlessly in her bare, washboard midriff and arms. Bursting out of the seat of her jeans are her twin tails, the same color as her pointed ears: tawny, with a paintbrush-like dappling of black.");
	output("\n\nIn keeping with the rest of her, her eyes are a deep yellow. Her hair is pulled back into a ponytail, which combines with her high, proud cheekbones to give her a rather daunting profile at first glance; however, a full, expressive mouth that provides her with a huge, winning smile softens things considerably. Behind that, she has a voice and set of lungs that could be used to deafen people two planets away. She overall gives the impression of a boisterous late summer party looming ponderously into view.");
	if(ramisTimesSexed() > 0) output("\n\nBetween her legs you know that, just like the rest of her, she’s pure female kaithrit - a single, fluffed, large but vice-like pussy is to be found there, and she has a single pink anus between her tight buttcheeks right where it belongs.");
	
	addDisabledButton(btnSlot, "Appearance");
}
public function approachRamis(special:String = "none"):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	
	addButton(10, "Appearance", ramisAppearance, 10);
	if(flags["RAMIS_MET"] != undefined)
	{
		if(ramisRecruited()) addButton(4, "Join Crew", ramisRejoinCrew, undefined, "Join Crew", "Ask the mercenary to rejoin your crew and move back into your ship.");
		else addButton(4, "Recruit", ramisRecruit, undefined, "Recruit", "She’s a mercenary, right? See what it would cost to get her on board your ship.");
	}
	
	// Special femboy approach
	if(special == "femboy")
	{
		output("Ramis squints at you as you sidle up to her at the bar. It takes her a few moments to recognize you, but when she does, a grin appears on her brown face and she shakes her head fondly.");
		output("\n\n<i>“Alright then, yeah,”</i> she sighs. <i>“I need a fuck and you’re looking pretty fuckable right now, sissy boy. Let’s go.”</i>");
		
		processTime(2);
		
		// [Appearance] [Yes] [No]
		addButton(0, "Yes", ramisFuck, "trap"); // Go to trap fuck
		addButton(1, "No", ramisLeave, "boy");
		return;
	}
	
	var isFem:Boolean = (pc.isWoman() || pc.isFemHerm() || pc.isSexless() || pc.isShemale());
	var isFemboy:Boolean = pc.isFemboy();
	
	// Repeat Approaches
	if(flags["RAMIS_MET"] != undefined && looksFamiliarToRamis())
	{
		// Ordered by priority for PCs that meet multiple requirements
		// 1.	PC has done man fuck:
		if(!isFem && pc.hasCock() && flags["RAMIS_SEXED_MAN"] != undefined)
		{
			output("<i>“Oh, hey you.”</i> Ramis’s eyes focus and take on a pleased, predatory slant when they land on you. <i>“I was beginnin’ to think you wouldn’t show.");
			if(StatTracking.getStat("contests/ramis arm wrestle wins") > 0) output(" Fancy a drink? Or maybe you’re lookin’ for a rematch?”</i> her voice drops to a provocative growl. <i>“I might even let you win again...");
			output("”</i>");
			
			// [Arm Wrestle] [Drink] [Back Off]
			if(pc.credits >= 100) addButton(0, "Drink", ramisDrink, "drink", "Drink", "Make merry with Ramis.\n\nCosts 100 credits.");
			else addDisabledButton(0, "Drink", "Drink", "You don’t have enough credits to do this!\n\nCosts 100 credits.");
			addButton(1, "Arm Wrestle", ramisFlirt, "arm wrestle");
			addButton(2, "Back Off", ramisLeave, pc.mf("man", "fem"));
			return;
		}
		// 2.	PC has been on a bender with her:
		else if(isFem && flags["RAMIS_TIMES_BENDER"] != undefined)
		{
			output("<i>“Tavros bezzie!”</i> Ramis grins hugely when she sees you, slapping your hand and gripping it excruciatingly tight. <i>“This " + pc.mf("lad", "lass") + ",”</i> she announces to her crew and the room in general, <i>“This fuckin’ " + pc.mf("lad", "lass") + ". Come and sit down - don’t be afraid of these idjets crampin’ your style.”</i>");
			
			// [Drink] [Back Off]
			if(pc.credits >= 100) addButton(0, "Drink", ramisDrink, "drink", "Drink", "Make merry with Ramis.\n\nCosts 100 credits.");
			else addDisabledButton(0, "Drink", "Drink", "You don’t have enough credits to do this!\n\nCosts 100 credits.");
			if(pc.isMan() || pc.isManHerm())
			{
				if(pc.lust() >= 33) addButton(1, "Flirt", ramisFlirt);
				else addDisabledButton(1, "Flirt", "Flirt", "You are not aroused enough for this!");
			}
			else addDisabledButton(1, "Flirt", "Flirt", "You are not physically man enough to try this!");
			addButton(2, "Back Off", ramisLeave, pc.mf("man", "fem"));
			return;
		}
		// 3.	PC feminine male, has done trap fuck: 
		else if(isFemboy && flags["RAMIS_SEXED_TRAP"] != undefined)
		{
			output("<i>“Oh, hello you. Don’t tell me you’re back for more?”</i> Ramis grins as she considers you with half-lidded predatory eyes, downing a shot as she does. <i>“Well, you know how it goes, knickers: Come back when I’ve had my fun for the evenen’. I might want to do bad things to you then, who knows...”</i>");
			
			// [Leave]
			addButton(14, "Leave", mainGameMenu);
			return;
		}
		// 4.	PC has done arm wrestle but never won:
		else if(!isFem && pc.hasCock() && (StatTracking.getStat("contests/ramis arm wrestle wins") + StatTracking.getStat("contests/ramis arm wrestle losses") > 0) && StatTracking.getStat("contests/ramis arm wrestle wins") <= 0)
		{
			output("<i>“Oh, hey " + pc.mf("boyo", "girlee") + ", how’s it goin’?”</i> Ramis grins at you amiably.");
			output("<i>“[pc.HeShe] came back?”</i> says one of the mercs at the table nearby, incredulous.");
			output("<i>“Cos [pc.heShe]’s ent a bad loser! I could tell that,”</i> the big kaithrit announces, slapping you on the shoulder. You try not to wince. <i>“Nothin’ wrong with a tryer. Come and have a drink with us, mate. Or maybe you’re lookin’ for a rematch?”</i> she gives you the eye and smirks provocatively. <i>“I might even let you win, this time...”</i>");
			
			// [Arm Wrestle] [Drink] [Back Off]
			if(pc.credits >= 100) addButton(0, "Drink", ramisDrink, "drink", "Drink", "Make merry with Ramis.\n\nCosts 100 credits.");
			else addDisabledButton(0, "Drink", "Drink", "You don’t have enough credits to do this!\n\nCosts 100 credits.");
			addButton(1, "Arm Wrestle", ramisFlirt, "arm wrestle");
			addButton(2, "Back Off", ramisLeave, pc.mf("man", "fem"));
			return;
		}
		// 5.	Otherwise: Default to initial scenes.
	}
	
	// First approach
	output("<i>“...dangling backwards it was! Silly willy didn’t check the airlocks.”</i> As her friends guffaw, the seven foot tall kaithrit swings around on her stool to regard you with unfocused, golden eyes. She narrowly avoids whacking you with her large, tank-top clad boobs. <i>“Oh aye, what d’we have here then?”</i> Her accent lilts and lollops around the words, drawing out “l”s and making every finishing sentence a musical declamation.");
	// PC is female or futa
	if(isFem)
	{
		output("\n\n<i>“Come to join the party have we,");
		if(pc.mfn("m", "f", "n") != "f") output(" uh...");
		output(" girlee?”</i> A garrulous sneer appears on the kaithrit’s brown face and she slaps the bar. The tender hurries over with a bottle of amber fluid and several fresh glasses. <i>“Anyone’s welcome - if you think you can keep up.”</i>");
		output("\n\n<i>“Be careful,”</i> laughs one of her human companions. <i>“Drinking with Ramis will put your health at serious risk.”</i>");
		output("\n\n<i>“Aw, you’re full of piss!”</i> snorts Ramis. She downs another shot and squints with thought. <i>“Or not enough piss. One of the two.”</i>");
		
		processTime(2);
		flags["RAMIS_FIRST_IMPRESSION"] = "girlee";
		
		// [Appearance] [Drink] [Back Off]
		if(pc.credits >= 100) addButton(0, "Drink", ramisDrink, "drink", "Drink", "Make merry with Ramis.\n\nCosts 100 credits.");
		else addDisabledButton(0, "Drink", "Drink", "You don’t have enough credits to do this!\n\nCosts 100 credits.");
		addButton(2, "Back Off", ramisLeave, "fem");
	}
	// PC is andro/feminine male, 
	else if(isFemboy)
	{
		// kaithrit score < 5
		if(pc.kaithritScore() <= 4)
		{
			output("\n\n<i>“You’re a boyo, aren’t ya?”</i> The brown-skinned kaithrit leers and winks at you lasciviously. <i>“Can’t keep that from a kaithrit, I’m afraid! All our lads look like you. Hoping for some action?”</i>");
			if(pc.isNude() || (pc.isChestExposed() && pc.isCrotchExposed() && pc.isAssExposed())) output("\n\n<i>“Wasn’t exactly hard to work it out, was it?”</i> snorts one of her human companions. <i>“He’s standing there in the nip!”</i>");
			output("\n\nCarelessly, the big, tawny cat-woman reaches " + (pc.tallness >= 80 ? "down" : "across") + " and gives your [pc.ass] a hard squeeze.");
			output("\n\n<i>“Nice,”</i> she pronounces. <i>“But Ramis is not in the mood for sissy boys right now. You run along, do your lipstick, and give her some space. <b>Maybe later</b>.”</i>");
			output("\n\n<i>“Yeah,”</i> sniggers a merc. <i>“When Ramis is so blasted she doesn’t care what she takes for a ride.”</i> He adeptly ducks the shot glass that is thrown at him.");
		}
		// kaithrit score > 4
		else
		{
			output("\n\n<i>“What’s happenin’, boyo?”</i> Without a by-your-leave, the big, tawny cat-woman reaches her ropy arm around you and gives your [pc.ass] a hard squeeze. You are engulfed in sporty perfume. <i>“Precious like you shouldn’t be on your own in a dive like this.”</i>");
			output("\n\n<i>“Where you might get woman-handled by someone like Ramis,”</i> snorts one of her human companions. Ramis pats you on the head fondly.");
			output("\n\n<i>“I’m not in the mood for home boys right now,”</i> she pronounces. <i>“You run along, do your lipstick, and give me some space. <b>Maybe later</b>.”</i>");
			output("\n\n<i>“Yeah,”</i> sniggers another merc. <i>“When she’s so blasted she doesn’t care what she takes for a ride.”</i> He adeptly ducks the shot glass that is thrown at him.");
		}
		
		processTime(2);
		flags["RAMIS_FIRST_IMPRESSION"] = "boyo";
		
		// [Appearance] [Leave]
		addButton(14, "Leave", mainGameMenu);
	}
	// PC is Masculine, has dick
	else if(pc.hasCock() || pc.isCuntboy())
	{
		output("\n\n<i>“Ooh. You’re a right lookin’ boyo, aren’t you?”</i> the brown-skinned kaithrit leans back on her stool and openly eyeballs you with a lascivious sneer. <i>“Fancy yourself, do we? Fit lookin’ lad like you’s always welcome to join in - if you think you can keep up.”</i> She slaps the counter, and the barkeep hurries over with a bottle of amber fluid and several fresh glasses.");
		output("\n\n<i>“Be careful,”</i> laughs one of her human companions. <i>“Drinking with Ramis will put your health at serious risk.”</i>");
		output("\n\n<i>“Aw, you’re full of piss!”</i> snorts Ramis. She downs another shot and squints with thought. <i>“Or not enough piss. One of the two.”</i>");
		
		processTime(2);
		flags["RAMIS_FIRST_IMPRESSION"] = "lad";
		
		// [Appearance] [Flirt] [Drink] [Back Off]
		if(pc.credits >= 100) addButton(0, "Drink", ramisDrink, "drink", "Drink", "Make merry with Ramis.\n\nCosts 100 credits.");
		else addDisabledButton(0, "Drink", "Drink", "You don’t have enough credits to do this!\n\nCosts 100 credits.");
		if(pc.lust() >= 33) addButton(1, "Flirt", ramisFlirt);
		else addDisabledButton(1, "Flirt", "Flirt", "You are not aroused enough for this!");
		addButton(2, "Back Off", ramisLeave, "man");
	}
	// Failsafe
	else
	{
		output("\n\nBut nothing happens!");
		
		addButton(14, "Leave", mainGameMenu);
	}
	
	if(flags["RAMIS_MET"] == undefined) flags["RAMIS_MET"] = 1;
}
public function ramisLeave(response:String = "none"):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	
	switch(response)
	{
		case "fem":
			output("<i>“Maybe some other time,”</i> you say. The mercs boo and jeer you with gusto.");
			output("\n\n<i>“Aw, leave off " + pc.mf("‘im", "her") + "!”</i> Ramis is saying as you leave. <i>“How many " + pc.mf("lads", "girlees") + " are gonna want to get blasted with you dickheads anyway...?”</i>");
			break;
		case "boy":
			output("<i>“You cunt-tease!”</i> howls Ramis, rolling her head back in laughing exasperation. You suspect she’d be angrier if she wasn’t currently so uncoordinated. <i>“G’won, get out of my sight before I decide to start taking pot-shots at your lily arse. Barlad! Leave the bottle.”</i>");
			break;
		case "man":
			output("<i>“Maybe some other time,”</i> you say. The mercs boo and jeer you with gusto.");
			output("\n\n<i>“Yeah. Maybe next time, you’ll remember your bollocks!”</i> scoffs Ramis, loud enough for most of the room to hear.");
			break;
		default:
			output("Nothing happened!");
			break;
	}
	
	processTime(1);
	
	// Back to bar menu
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function ramisDrink(response:String = "drink"):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	
	var i:int = 0;
	
	switch(response)
	{
		case "drink":
			output("Matching her challenging grin, you pick up one of the filled shot glasses and slot it home, smacking your [pc.lips] as the liquid burns down your throat. The mercs cheer and Ramis claps approvingly.");
			output("\n\n<i>“Nice one" + ((!pc.isMasculine(true) && pc.hasVagina()) ? ". Show the boyos how it’s done" : "") + "!”</i> the big kaithrit gestures impatiently at the " + (rand(2) == 0 ? "bartender" : "barkeep") + ", who keeps pouring. <i>“So which part of the galaxy have you blown in from, then...?”</i>");
			output("\n\nYou spend the next hour or so knocking it back with Ramis and her crew. As you’d guessed, they’re mercs: unaffiliateds that drift from one organization or job to the next.");
			output("\n\n<i>“No Black Void dipshit’s a better gunner than me, though!”</i> Ramis howls, standing on top of a table and beating her bosom, ignoring the guffawing <i>“siddowns”</i>. <i>“Nobody is!”</i>");
			output("\n\nThey’re full of uproarious tales of high speed getaways and day-long benders on distant moons, details of which are very vague in particular parts. Your own story of");
			if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output(" being an up-and-coming mercenary yourself");
			else if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output(" doing a bit of space wheeling and dealing");
			else if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" being a bright-eyed bushy-tailed techie");
			else output(" a glorified bum");
			output(" before being suddenly hurled into a bizarre race across the frontier to claim a massive inheritance sounds positively plausible next to some of the bullshit these guys come up with, so you’re happy to retell it.");
			
			// Forward two hours, PC +50% drunk, - 100 credits
			for(i = 0; i < 5; i++)
			{
				processTime(18 + rand(12));
				pc.imbibeAlcohol(10);
			}
			pc.credits -= 100;
			
			addButton(0, "Next", ramisDrink, "next");
			break;
		case "next":
			output("<i>“Alright, we gotta move,”</i> says the human guy, standing up as a game of never-ever comes to a lively conclusion. <i>“Nice meeting you, Steele.”</i>");
			output("\n\n<i>“We’re just getting started though!”</i> cries Ramis. He " + ((!pc.isMasculine(true) && pc.hasVagina()) ? "flaps" : "waves") + " his hand at her exasperatedly and the others do nothing but chuckle as they file out. <i>“Lightweights!”</i> the kaithrit hurls at their backs. She clambers back to her feet and grins at you. <i>“You aren’t gonna bail on me like those dickheads, are you? Night’s still young. We could hit a club after this...”</i>");
			
			processTime(2);
			IncrementFlag("RAMIS_TIMES_DRINK");
			
			// [Keep going] [Nah]
			if(pc.credits >= 300) addButton(0, "Keep Going", ramisDrink, "keep going", "Keep Going", "She’s right! This party is just getting started!\n\nCosts 300 credits.");
			else addDisabledButton(0, "Keep Going", "Keep Going", "You don’t have enough credits to do this!\n\nCosts 300 credits.\n\nCosts 300 credits.");
			addButton(1, "Nah", ramisDrink, "nah", "Nah", "Maybe you should stop.");
			break;
		// Nah
		case "nah":
			output("<i>“That’s it for me too, I’m afraid,”</i> you smile apologetically.");
			output("\n\nRamis’s tails droop and she exhales in exasperation.");
			output("\n\n<i>“Just me carryin’ the flame, then,”</i> she sighs. <i>“Ah well, you made a go of it. Hope to see you around again, [pc.name].”</i> She heads for the bar.");
			
			processTime(1);
			
			addButton(0, "Next", mainGameMenu);
			break;
		// Keep going
		case "keep going":
			// Requires over 70 to succeed. Sliding scale of 25% succeed at 70 to 100% at 100
			var tolernce:Number = pc.tolerance();
			var winRatio:int = 5;
			if(tolernce >= 70)	winRatio--; // 1/4
			if(tolernce >= 80)	winRatio--; // 1/3
			if(tolernce >= 90)	winRatio--; // 1/2
			if(tolernce >= 100)	winRatio--; // 1/1
			
			// If alcohol tol. test succeed
			if(winRatio < 5 && rand(winRatio) == 0)
			{
				output("<i>“You really think you’re going to shake me off that easily?”</i> you grin. <i>“This place does cocktails, doesn’t it?”</i> Ramis laughs delightedly, her tails curling right up.");
				output("\n\n<i>“Oh, you’re gonna regret sayin’ that! C’mon [pc.name], let’s show this station it’s never been born!”</i> She almost breaks her neck stumbling over a chair on the way to the bar, but she does make it.");
				output("\n\nRamis is capable of draining brightly-colored and evil-looking fishbowls to the bottom without it apparently having any effect on her - however you’re practiced enough, and have beaten your liver into being rubbery enough, to pace yourself alongside her. After knocking back a few more at Anon’s, she whisks you out into the messy, blaring neon of Tavros’s nightlife. In between hurling yourself around the sweaty ruck of a heaving dance floor, she orders a steady stream of liquor “for the dehydration”. She watches with rapt, intoxicated attention, blue light flaring over her long, sculpted face as you finish another shot and bang the glass down next to hers");
				if(pc.PQ() > 50) output(" hard enough to almost crack it");
				output(".");
				output("\n\n<i>“Everyone has either wetted out or fallen over by now,”</i> she slurs. Excitement tightens her face, teeth gleaming in the gloom. <i>“I like you, Steele.”</i>");
				output("\n\nSomehow you find yourself in another club - this one even wilder, with writhing foam, anti-gravitational fields and all-conquering bass that gets inside your spine and brain - through which you and Ramis spill, careen and thrash. The kaithrit dances and starts conversations at the top of her voice with other clubbers seemingly at random, a trait which either endears or infuriates.");
				if(pc.isTaur()) output(" It’s difficult for you to do much on a dancefloor without seriously injuring people, however that doesn’t deter Ramis from finding a cowboy hat from somewhere, leaping onto your back and slapping your hind, laughing raucously as you rear instinctively. The other clubbers cheer you on, and giddy with alcohol you buck and leap without restraint, attempting to dislodge the guffawing, hiccupping weight on your [pc.legOrLegs].");
				else if(pc.race().indexOf("kaithrit") != -1) output(" When she dances with you, her tails send very clear and inviting signals, writhing and twisting around her body, drawing attention to her sumptuous curves and rippling muscles. The moment you think about pressing your lips to hers however she’s off again, either to the bar or butting into somebody else’s fledgling one night stand.");
				else output(" Dancing with her is like being caught in a tumble dryer - a very sweaty and booby tumble dryer. Rough, clawed hands grip at your shoulders and hurl you around, and it’s all you can do to throw shapes that will stop you being thrown headfirst into other dancers.");
				output("\n\nRamis gets wilder and wilder, however despite the world swimming with alcohol and endorphins you keep your wits about you, and manage to tear her away from the place before she’s thrown out. You can’t stop her from setting off into the vast space station almost at random, and high on the buzz you kind of want to see where her anarchy and fathomless energy will take you next. She knocks over shop stands... you run away from security... she shimmies up the giant mushroom trees on the res deck... you try to activate escape pods... she finds a pod of vodka somewhere... you run away from more security...");
				output("\n\n<i>“Iz my bezzie,”</i> the kaithrit mumbles in your ear, as you slowly escort her towards your ship. <i>“Feel I’ve known you my whole life, y’know? Tonight we’re- we’re " + ((!pc.isMasculine(true) && pc.hasVagina()) ? "zisters" : "ziblings") + ".”</i>");
				output("\n\n<i>“Uh huh.”</i> You stagger slightly under her considerable weight.");
				
				// [pb]
				addButton(0, "Next", ramisDrink, "wake up")
			}
			// If alcohol tol. test fail
			else
			{
				output("<i>“You really think you’re going to shake me off that easily?”</i> you grin. <i>“This place does cocktails, doesn’t it?”</i> Ramis laughs delightedly, her tails curling right up.");
				output("\n\n<i>“Oh, you’re gonna regret sayin’ that! C’mon [pc.name], let’s show this station it’s never been born!”</i> She almost breaks her neck stumbling over a chair on the way to the bar, but she does make it.");
				output("\n\nThe rest of the night is something of a blur. You definitely stay in Anon’s for a bit longer, then... fragmented memories of " + (pc.hasLegs() ? "stumbling" : "roiling") + " down Tavros’s corridors... and thumping bass and flickering lights. Where did you share the nightmarishly blue-colored drink? Even before it started sending streams of bubbles through your brain you knew that was a bad idea...");
				output("\n\n<i>“Iz not blue!”</i> Ramis argued with someone. <i>“Iz NOT blue! This, THIS iz blue.”</i> She started unbuttoning her jeans and you were trying to stop her... did she punch someone? Oh god, not the bouncer...");
				output("\n\n<i>“Iz my bezzie,”</i> you remember the kaithrit mumbling in your ear later, whilst the two of you searched for an escape pod you could easily take for a joy ride. Or escape station security with. Or vomit into. One of those. <i>“Feel I’ve known you my whole life, y’know? Tonight we’re- we’re " + ((!pc.isMasculine(true) && pc.hasVagina()) ? "zisters" : "ziblings") + ".”</i> The whole time you were thinking she didn’t need to say anything, because it was all so obvious...");
				
				// [pb]
				addButton(0, "Next", ramisDrink, "hangover");
			}
			
			// Forward ten hours, PC +100% drunk, - 300 credits, move PC to ship
			for(i = 0; i < 10; i++)
			{
				processTime(50 + rand(20));
				pc.imbibeAlcohol(10);
			}
			pc.credits -= 300;
			IncrementFlag("RAMIS_TIMES_BENDER");
			
			currentLocation = "SHIP INTERIOR";
			break;
		case "hangover":
			generateMap();
			showLocationName();
			
			output("You moan as you slowly regain consciousness. Oh Void... today is going to be hard. Very hard indeed. You feel like you’ve got a simultaneous case of flu and food poisoning, as well as if someone hit you around the [pc.legOrLegs] with a baseball bat a few times. The one good piece of news is, as you woozily cast your gaze around you, is that you did somehow manage to get back into your bed aboard your ship last night. You took something with you, though - there’s a large, hard object lying next to you. You moan again when you pull down the duvet and see what it is. A breadbin-sized conical construction bot in standby mode. Of course.");
			output("\n\n<i>“Wakey wakey,”</i> trills Ramis, striding into the room from the bathroom in her underwear, toweling her hair. <i>“Nice shower unit you have. Way better than the communal ones you get on merc cruisers, lemme tell you.”</i> Aside from dilated pupils and a continued lack of coordination - a muscular hip knocks your bedside cabinet askew as she advances on a pile of clothes on the floor - she looks disgustingly unaffected by last night.");
			output("\n\n<i>“We didn’t, uh...”</i> you trail off.");
			if(pc.isWoman() || pc.isFemHerm() || pc.isSexless() || pc.isShemale())
			{
				output("\n\n<i>“Uh? Oh, no. Don’t think so anyway,”</i> Ramis replies, unsteadily pulling on her jeans. <i>“I’m not into other");
				if(pc.mf("m", "f") == "m") output("... eh,");
				output(" girlees.");
				if(pc.hasCock()) output(" Not even if they got a nice willy like yours.");
				output("”</i> She grins at you. <i>“Much more fun to hit the town with, eh? You’re a rock star, [pc.name]! Whenever you’re back on Tavros, you must come‘n see if I’m in Anon’s. We gotta do it again!”</i> She wrenches on her tank top. <i>“Right, I’m gonna go find some breakfast. I’ll let myself out [pc.name], don’t you worry - you look like you could with a bit of a lie-in.”</i>");
			}
			else
			{
				output("\n\n<i>“Uh? Oh, no. Don’t think so anyway,”</i> Ramis replies, unsteadily pulling on her jeans. <i>“Fuckin’ someone when they’re really blotto ent right. Not as if there would be any coaxin’ life out of your downstairs in that state anyway.”</i> She grins at you. <i>“You’re far more fun to hit the town with. You’re a rock star, [pc.name]! Whenever you’re back on Tavros, you must come‘n see if I’m in Anon’s. We gotta do it again!”</i> She wrenches on her tank top. <i>“Right, I’m gonna go find some breakfast. I’ll let myself out [pc.name], don’t you worry - you look like you could with a bit of a lie-in.”</i>");
			}
			output("\n\nHer loud, cheerful laughter echoes down the corridor as you close your eyes, wrap a pillow around your head and wait for everything to stop hurting quite so much.");
			
			processTime(15);
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "wake up":
			generateMap();
			showLocationName();
			
			output("You come to in your own bed. You’re carrying a couple more mysterious bruises and definitely hanging, but your body is used to coping with the amount you tied on last night, and you know a solid, stodge-heavy breakfast will cure it.");
			output("\n\n<i>“Up already?”</i> trills Ramis, striding into the room from the bathroom in her underwear, toweling her hair. <i>“Nice shower unit you have. Way better than the communal ones you get on merc cruisers, lemme tell you.”</i> She knocks a bedside cabinet askew as she advances on the pile of clothes in the middle of the floor. <i>“I feel- oof! I have never run into someone who can keep it up like you can, Steele. You usually around on Tavros? You come‘n find me in Anon’s whenever you can. You’re a rock star!”</i> She wrenches on her tank top. <i>“Right, I’m gonna go find some breakfast. I’ll let myself out [pc.name] - you have a nap, ‘n then find me when you’re ready for more.”</i>");
			output("\n\nHer loud, cheerful laughter echoes down the corridor.");
			
			processTime(15);
			
			addButton(0, "Next", mainGameMenu);
			break;
		// Failsafe
		default:
			output("Nothing happened!");
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

public function ramisArmWrestleWinRatio(physique:Number = 0):int
{
	var winRatio:int = 4;
	if(physique <= 40)	winRatio++; // PC Physique < 41%: 0 chance PC wins
	if(physique > 40)	winRatio--; // 79% > PC Physique > 40%: ¼ chance PC wins
	if(physique > 80)	winRatio--; // 89% > PC Physique > 80%: ½ PC wins
	if(physique > 90)	winRatio--; // PC Physique > 90% : ¾ chance PC wins
	
	return winRatio;
}
public function ramisFlirt(response:String = "flirt"):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
	
	var i:int = 0;
	
	switch(response)
	{
		// Flirt
		case "flirt":
			output("<i>“I don’t fancy myself,”</i> you grin, holding her gaze. <i>“I fancy you.”</i> Ramis’s eyes widen and she laughs hugely; her crew whoop and finger-drum their table with delight.");
			if(pc.isCuntboy())
			{
				output("\n\n<i>“Well, aren’t we the bold one?”</i> she says, shifting around on her stool and considering you with something between admiration and malevolence. Her hand lands on your [pc.knee]; a slight thrill leaps in your chest as her claws prick you, before her grip slides upwards. <i>“But... you’re also given me the vibes... yeeaahh.”</i>");
				output("\n\nShe sighs, a gust of disappointed alcohol over your face as her teasing fingers reach your [pc.groin].");
				output("\n\n<i>“You’re not my type. Sorry,”</i> she says. <i>“Ramis needs a bit’ve meat with her dinner. Shame: I love a bonny looken lad who’s got ba- who’s big’n brave.”</i> She grins at you. <i>“Aw. I feel bad now. Why don’t you stay and have a few bevvies? We’ll find someone who’s into you, soon enough.”</i>");
			}
			else
			{
				output("\n\n<i>“Well, aren’t we the bold one?”</i> she says, shifting around on her stool and considering you with something between admiration and malevolence. It gives you plenty of time to get an eyeful of her in turn - foot after foot of undulating leonine tautness, barely contained by her sporty tank top and jeans combo.");
				if(pc.tallness > 86) output(" The fact that you tower over even her doesn’t seem to affect her attitude at all.");
				output(" <i>“I like that, boyo. No bollocks, just comin’ right over and saying what you want. Somethin’ a real man does.”</i>");
				output("\n\n<i>“What are we then, Ramis?”</i> says one of her mates with exaggerated hurt. <i>“Chopped liver?”</i>");
				output("\n\n<i>“Little boys,”</i> replies the big kaithrit with crushing serenity. She’s still got her laughing, tawny eyes on you. <i>“Why, none of you can beat me at arm wrestlin’, even. Seems like if a </i>real<i> man wanted to do what he wishes with me...”</i>");
			}
			
			processTime(3);
			
			// [Arm wrestle] [Back Off]
			if(pc.hasCock())
			{
				addDisabledButton(0, "Drink");
				addButton(1, "Arm Wrestle", ramisFlirt, "arm wrestle");
			}
			else
			{
				if(pc.credits >= 100) addButton(0, "Drink", ramisDrink, "drink", "Drink", "Make merry with Ramis.\n\nCosts 100 credits.");
				else addDisabledButton(0, "Drink", "Drink", "You don’t have enough credits to do this!\n\nCosts 100 credits.");
				addDisabledButton(1, "Arm Wrestle", "Arm Wrestle", "You’ll need a penis for this!");
			}
			addButton(2, "Back Off", ramisLeave, "man");
			break;
		// Arm Wrestle
		case "arm wrestle":
			output("A space is cleared for you on their table, and you sit down opposite Ramis, placing your elbow down on the metal surface. The other mercs drunkenly crowd round, exchange bets and josh the two of you as you clasp the tawny amazon’s warm, rough hand. She tweaks the [pc.skin] on your hand with her sharp claws teasingly.");
			output("\n\n<i>“Ready for this, boyo?”</i> she purrs, tails flicking back and forth in anticipation.");
			
			var physique:Number = pc.PQ();
			var winRatio:int = ramisArmWrestleWinRatio(physique);
			
			// PC wins
			if(winRatio < 4 && rand(winRatio) == 0)
			{
				output("\n\nThe muscles in her ropey arm bunch up, and suddenly your hand is being forced inexorably towards the tabletop. Holy fuck is she strong - and her claws are biting into your flesh - but you’ve got this, you’ve got this... the crowd around you roar and cheer, but your focus is entirely on your conjoined hands. You heave against Ramis’s steady force, forcing her back the other way with all your strength... then she grits her teeth, and the leverage in that warm, rough, needled grip feels like it’s been doubled. But two can play at that game!");
				output("\n\nYou allow yourself to be fought back, your hand being steadily jerked towards your end, keeping a small reserve at bay; and then, when you sense by her gritted teeth she’s put everything she’s got into it, you flex your muscles and heave. After a titanic, vein-popping impasse, all resistance suddenly departs in front of your grip, and you slap Ramis’s hand to the table.");
				output("\n\nThe mercs roar and cheer; credit chits change hands, and an avalanche of slaps lands upon your back. You keep your grip and eyes on Ramis, though. Her mouth has formed a neat “oh” which takes a while to depart. When it does though, it is to bite her lip and smile at you lustily.");
				output("\n\n<i>“Well then,”</i> she says lowly. <i>“Guess you’re goin’ to have to claim your prize now, aren’t you? My big, strong man.”</i>");
				output("\n\nYou stay a little while longer to enjoy some free drinks and the plaudits of your victory - some of the other guys are desperate to learn your technique - but you’ve only got eyes for one thing. And, by her smoldering gaze and increasingly adventurous fondles under the table, so does Ramis. The brute, animal nature of your conquest has got your blood pumping,");
				if(pc.hasCock()) output(" [pc.eachCock] thickening rapidly,");
				output(" and as soon as attention shifts away from you, you wrap your gently aching arm around Ramis’s hard waist and head for the door.");
				
				processTime(3);
				StatTracking.track("contests/ramis arm wrestle wins");
				
				// Go to man fucks
				addButton(0, "Next", ramisFuck, (pc.isFemboy() ? "trap" : "man"));
			}
			// PC fails normally
			else if(physique > 40)
			{
				output("\n\nThe muscles in her ropey arm bunch up, and suddenly your hand is being forced inexorably towards the tabletop. Holy fuck is she strong - and her claws are biting into your flesh - but you’ve got this, you’ve got this... the crowd around you roar and cheer, but your focus is entirely on your conjoined hands. You heave against Ramis’s steady force, forcing her back the other way with all your strength... then she grits her teeth, and the leverage in that warm, rough, needled grip feels like it’s been doubled. She was playing the long game! You struggle valiantly, but you have no answer to it. A few seconds later the muscles in your arm give in, and your hand makes a “plap” sound as it hits the table.");
				output("\n\nThe mercs roar and cheer; credit chits change hands. Ramis grins at you hugely, breast heaving.");
				output("\n\n<i>“Nice try, mate,”</i> she says. <i>“I like your balls for havin’ a go, like. Not just saying that. Buuuut...”</i> she exchanges glances with her friends, and they share a gloating laugh. You hear liquid being poured. <i>“It ent a challenge if there’s no forfeit, am I right?”</i> A pint glass is pushed towards you. It is full to the brim with a mixed sample of what each person here is drinking. It is a revolting, opaque brown color, and has a fair head of scum on top.");
				output("\n\nOh well... it’s only one drink, right? You pick up the glass, screw up your nose and lift the brim to your [pc.lips]. <i>“CHUG! CHUG! CHUG!”</i> rings in your ears...");
				
				processTime(3);
				StatTracking.track("contests/ramis arm wrestle losses");
				
				// [pb]
				addButton(0, "Next", ramisFlirt, "lose normal");
			}
			// PC Physique below 41%
			else
			{
				output("\n\nThe muscles in her ropey arm bunch up, and suddenly your hand is being forced inexorably towards the tabletop. Holy fuck is she strong! And... oh Void... this isn’t even a contest. It takes all your effort to fight back against her for just a few seconds, and then the back of your hand is smacked firmly onto the metal. A burn of humiliation climbs onto your cheeks as the crowd around you roar, cheer and slap the triumphant kaithrit on the back.");
				output("\n\n<i>“Couldn’t you have drawn it out a bit, Ramis?”</i> chaffs one. <i>“That was boring.”</i>");
				output("\n\n<i>“Time to get the dirty pint ready,”</i> sneers another.");
				output("\n\n<i>“Aw no, leave the young lad alone,”</i> says Ramis, making them move away with an irritated wave of her hand. She looks across at you with a strange sort of fondness. <i>“It was sweet of you to have a go, but this isn’t really your thing, is it boyo? You should look into dollin’ yourself up a bit, stop pretendin’ to be something you’re not. You’d make a fine pretty boy. ‘nd you’d be much better at getting girls like me that way, promise.”</i>");
				output("\n\nIs she serious, or taking the piss? Either way you beat a retreat before her friends can bring up the subject of dirty pints again, nursing your arm.");
				
				processTime(2);
				StatTracking.track("contests/ramis arm wrestle losses");
				
				// - 50 energy, [Ramis] option removed from menu for evening
				pc.energy(-50);
				setRamisAway();
				
				addButton(0, "Next", mainGameMenu);
			}
			break;
		case "lose normal":
			output("You come to your senses a little while later in one of Anon’s toilet cubicles. You groan woozily, clutch the seat and consider the toilet bowl. You haven’t thrown up, which might not be a good thing. At least the mercs didn’t take anything off of you before leaving. What a generous group of guys.");
			
			// + 2 hours, + 100% alcohol, - 50 energy, [Ramis] option removed from menu for evening
			for(i = 0; i < 5; i++)
			{
				processTime(18 + rand(12));
				pc.imbibeAlcohol(20);
			}
			pc.energy(-50);
			setRamisAway();
			
			addButton(0, "Next", mainGameMenu);
			break;
		// Failsafe
		default:
			output("Nothing happened!");
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

// Sex Scenes
public function ramisFuck(response:String = "none"):void
{
	clearOutput();
	author("Nonesuch");
	showRamis(true);
	clearMenu();
	
	var ppRamis:PregnancyPlaceholder = getRamisPregContainer();
	var x:int = -1;
	x = pc.cockThatFits(ppRamis.vaginalCapacity(0));
	//x = pc.cockThatFits(11, "length");
	var purrfectFit:Boolean = false;
	var hasUndies:Boolean = (!(pc.lowerUndergarment is EmptySlot) && !pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN));
	
	switch(response)
	{
		// Trap Fuck
		case "trap":
			output("<i>“We could go back to my ship - ”</i> you offer haltingly.");
			output("\n\n<i>“No,”</i> Ramis replies thickly. She stands and wraps a warm, rough hand around your [pc.hip]. <i>“Too far. Lemme handle this, okay knickers?”</i> She gives your [pc.ass] a comforting squeeze.");
			output("\n\nShe grips you tightly as she whisks you out of Anon’s - possibly so you don’t get away.");
			// PC < 5'11" :
			if(pc.tallness < 71) output(" It’s all you can do to keep up with her - the kaithrit’s legs are long, powerful and extremely purposeful. Her big, hard, denim-clad thigh bumps into your [pc.chest] as you go.");
			output(" Her sporty perfume is high in your nose and you feel more giddy and aroused the more you let this huge, utterly self-assured alpha bitch take control of you, [pc.eachCock] " + (hasUndies ? "pressing eagerly against your [pc.lowerUndergarment]" : "becoming eagerly erect") + ". The love hotel she takes you to is not two hundred yards away, decorated in deep purples and reds, fully automated for discretion’s sake. You are just one of many whispering and giggling one night stands being walked into it; the Milky Way is an unremittingly horny place.");
			output("\n\nShe pays the desk robot, hurries you into the lift and molests you impatiently as you are carried upwards; pressing you against the wall, hot tongue twining around yours, rubbing her supple boobs and rigid tummy and thighs up and down your body, groping your [pc.ass] and [pc.groin] with both hands. It’s all she can do to step away when the doors open, and practically frogmarch you to your room. The small scanner flicks over her eye and silently opens the door to your small, dimly lit suite.");
			output("\n\nRamis tumbles you onto the double bed and without preamble rips off her top and undoes her jeans, baring more and more of her ripped, feminine form, her small, chocolate nipples protuberant with lust. The bed must be designed to support all sorts, but it still groans in protest when she clambers onto it. You can see her teeth gleaming in the dark as " + (hasUndies ? "you fumble off your [pc.lowerUndergarment] and let" : "open your thigh and allow") + " your [pc.cocks] spring upwards, unable to take your eyes off the gently swaying tits and bulging thighs looming over you.");
			// No cock that fits
			if(x == -1)
			{
				x = pc.biggestCockIndex();
				
				output("\n\n<i>“Fuckin’ hell, boyo. What do you call that when it’s home?”</i> The big kaithrit shakes her head in disbelief as your [pc.cock " + x + "] points itself fiercely at the ceiling.");
				output("\n\n<i>“My dick?”</i> you clarify, a blush climbing onto your cheeks.");
				output("\n\n<i>“I can see that! Problem is, I might actually want to sit down tomorrow,”</i> she laughs lowly. <i>“Honestly, a cute sissy boy draggin’ around a willy like that? What’s that about?”</i> You cast your eyes down in embarrassment, not really knowing how to respond.");
				output("\n\n<i>“It’s too bloody bad, is what it is.”</i> Ramis throws a knee over your waist and works her way up astride you until her powerful thighs are rubbing against your neck. You find yourself face-to-face with her slit, wet with fresh arousal beneath a curl of honey-colored down. She grips the headboard, leering down at you above her boobs and rippling abdomen, frustration tightening her features.");
				output("\n\n<i>“You’re here to do what sissy boys are for - takin’ care of my needs - ‘n the fact your day job is apparently sirin’ horsis doesn’t change that. So you just better turn out to be an outstanden’ cunt munch. If you are... and I mean outstanden’... maybe I’ll give that ridiculass piece of meat of yours a Ramis special in the morning. Clear?”</i>");
				output("\n\nWhether you are or not, the next moment she sits herself down on your [pc.face]. Her labia meets your [pc.lips] as your whole head is pressed alarmingly far down into the mattress by her hot, brawny weight. Panic of suffocation makes you open your mouth more than anything - clutching her big, hard thighs you run your [pc.tongue] along her outer lips, tasting her tang with desperate flicks of the tip. All you can see is Ramis towering above you, her boobs gently palpitating and eyes dreamily half-lidded. Your senses weighed down powerfully by the smell, taste and mass of giant female, your [pc.cock " + x + "] remains hotly, earnestly erect, only seeming to become harder the more it is flagrantly ignored.");
				output("\n\n<i>“‘S it...”</i> Ramis husks. You moan as her thighs tighten around your head; breath whistles through your nose. You feel rather than hear her as muscle presses over your ears. <i>“Up and up and then... ungh!”</i> She pumps her hips instinctively as you reach deep inside her tight, wet pocket, soft pubic fluff tickling your nose. Clawed hands clutch the headboard and you find your face being ridden for all it is worth, the kaithrit’s hard-trained vaginal muscles clutching up around your [pc.tongue]. Thump, thump, thump goes the top of your head against the synth-wood behind it, and stars swim across your vision. The only clear thought you are capable of is to try and please your huge top, because then she might let you breath properly again...");
				if(pc.hasTongueFlag(GLOBAL.FLAG_LONG) && pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" with the aid of your incredibly long, dexterous tongue, you are able to fill her pussy with shifting sensation, pushing right up to delicately touch her cervix. The loud, husky exhalations and increasingly rough thrusts of her hips this draws out of her suggests she’s a fan of this.");
				output("\n\nYou find a rough point in her wet, limber walls which sends a quiver through the hard, ropey thighs clenched around your [pc.ears] when your tongue touches it. Your [pc.lips] mashed against her pulpy labia and clit and, hands wrapped around her hips, you attack that area frenetically with the tip, [pc.eachCock] submissively hard at the thought of the pleasure you’re giving your top. Ramis squeals with delight, throwing her ponytail back and bouncing athletically on your face. She squeezes those thunder-thighs of hers tightly around your head as you attack her g-spot with frenetic flicks of your tongue... you think you hear your skull creak... and then, with a final gleeful cry, musky kaithrit femcum is dribbled into your mouth and smeared all across your face.");
				output("\n\n<i>“Whew!”</i> sighs Ramis, once she’s finished riding her orgasm to her satisfaction, a dozen bouncy, suffocating seconds later. She slides off you to one side, keeping one of her thick muscle-bound thighs weighing heavily on your heaving [pc.chest], and looks down proudly at her handiwork. You gaze back blearily, the lower part of your face glazed liberally in cunt juice.");
				output("\n\n<i>“You’re pretty good at that, to be fair,”</i> she slurs, sliding a hand through your [pc.hair] fondly. She sighs with pique as her attention drifts further down the bed. You close your eyes as you feel her grip tighten momentarily around your [pc.cock " + x + "]. <i>“Shame about your silly willy. I’d love a ride now...”</i> She shifts around on top of you, hand sliding off your shaft, teasingly gliding over your [pc.belly] and [pc.chest]. Mistily content with the submissive pleasure of giving good oral, you don’t realize what she’s up to until her big, brawny buttocks land on your forehead, weighing you down powerfully again.");
				output("\n\n<i>“Night’s still young and I’m still horny,”</i> The kaithrit husks, looking over her shoulder into your widened eyes with a crooked grin. <i>“So keep at it, sweet lips.”</i> Your whine is muffled by the oozing, silky folds of her sex, which is already being bucked impatiently against your [pc.lips] again...");
				
				pc.girlCumInMouth(ppRamis);
				
				addButton(0, "Next", ramisCockFuck, [x, purrfectFit, "trap morning afters"]);
			}
			// Small Cock
			else if(pc.cLength(x) < 5)
			{
				output("\n\n<i>“Awhawhawwww,”</i> the big kaithrit half-laughs, half-croons when her eyes land on your [pc.cock " + x + "]. You kind of saw this coming, but it doesn’t stop an all-consuming burn blooming in your cheeks when more than seven feet of ripped, leering amazon looms over your small, sensitive erection.");
				output("\n\n<i>“You sissy boys and your thing for tiny willies,”</i> she sighs in mocking exasperation. With a toothy grin, she places her fist next to your cock and then unfurls her fingers slowly. Looking down, for a moment you think you might just have her beat, but nope - her little finger <i>is</i> bigger. The burn intensifies, your [pc.nipples] [pc.nipplesHardening] up, your whole body feeling sensitized under her teasing gaze. You don’t resist her when she lies down and molds your body against the dense, rolling curves of her form, squeezing your head between her warm, pliant breasts. You close your eyes as she wraps her hand around the hard, eager nub of your dick.");
				output("\n\n<i>“It’s not as if cock boosters are hard to come by these days, so why do you keep it so small?”</i> she purrs in your ear, sending the scent of whiskey curling over your face. Her palm moves gently but firmly, up and down. <i>“Do you enjoy not satisfying women? Do you like bein’ teased? Do you like bein’ humiliated by other men and dick girlies? You must do. You must like bein’ treated mean. There’s no other explanation, not en this place ‘n time, is there?”</i> Encapsulated in her overwhelming female warmth and smell, your [pc.cockNoun " + x + "] being stroked and tantalized, you can do nothing but hold her supple boobs and arch your back to the submissive, shameful pleasure.");
				if(pc.buttRating() <= 1) output(" <i>“Aww, and bound little boi bollocks, too!”</i>");
				if(pc.balls > 0 && pc.hasStatusEffect("Uniball")) output(" Her grip shifts around and all the air leaves your lungs as it tightens momentarily around your [pc.balls]. <i>“A sweet, tightly-wrapped present, like.”</i>");
				output("\n\n<i>“Thing is though,”</i> she whispers. You moan as she unfurls her hand and slows her ministrations all the way down... nothing but her little finger, sliding up and down your tender, bulging underside. <i>“I love a polite, frisky little pretty boy at the end of the day. So I’m pretty used to this. I know lads like you enjoy it. I know you’re going to cum just from this... even though it’s embarrassing. Because it </i>is<i> embarrassing.”</i> Are you? You could pull away... but that one finger, curling along and then down your stubby girl dick, over and over... it’s entrancing... <i>“You are, aren’t you?”</i> giggles Ramis wickedly, pressing you deeper into her bosom. <i>“G’won. Do it for me. Cum from my little finger, bigger ‘n more use than that sissy twig of yours...”</i>");
				output("\n\nYour");
				if(pc.balls > 0) output(" [pc.balls] tighten" + (pc.balls == 1 ? "s" : ""));
				else output(" [pc.cock " + x + "] tighten" + (pc.cocks.length == 1 ? "s" : ""));
				output(" up, and there’s no escaping it - you exhale hoarsely again and again as you orgasm,");
				if(pc.cumQ() < 500) output(" squirting your [pc.cum] into the air and onto your [pc.belly] with delicious full body clenches");
				else output(" spewing huge flumes of [pc.cum] into the air and onto your [pc.belly] and bed with delicious full body clenches");
				output(", spurred on by the gentle stroke of Ramis’s finger.");
				output("\n\n<i>“What an obedient little boy,”</i> she coos, smirking as she holds your heaving [pc.chest] to her rippled abdomen. <i>“Must be pretty fun, bein’ so sensitive.”</i> The bed creaks as she shifts herself upwards, her smooth, leonine flank running up your [pc.hip]. Even if you wanted to, you wouldn’t be able to stop her clutching the headboard and swinging her naked leg over your shoulders. You find yourself face-to-face with her slit, wet with fresh arousal beneath a curl of honey-colored down. She grips the headboard, leering down at you above her boobs and rippling abdomen, frustration tightening her features. You realize with a slight thrill that toying with you in the manner she did has only increased her own lust.");
				output("\n\n<i>“But that ent why you’re here, sissy,”</i> the massive kaithrit husks. <i>“You’re here to take care of my needs. If you turn out to be decent, we might just see about a Ramis special in the mornin’. Won’t that be nice?”</i>");
				output("\n\nWithout any further ado, she sits herself down on your [pc.face]. Her labia meets your [pc.lips] as your whole head is pressed alarmingly far down into the mattress by her hot, brawny weight. Panic of suffocation makes you open your mouth more than anything - clutching her big, hard thighs you run your [pc.tongue] along her outer lips, tasting her tang with desperate flicks of the tip. All you can see is Ramis towering above you, her boobs gently palpitating and eyes dreamily half-lidded. Your senses weighed down powerfully by the smell, taste and mass of giant female, your [pc.cockNoun " + x + "] remains hotly, earnestly erect, only seeming to become harder the more it is flagrantly ignored.");
				output("\n\n<i>“‘S it...”</i> Ramis husks. You moan as her thighs tighten around your head; breath whistles through your nose. You feel rather than hear her as muscle presses over your ears. <i>“Up and up and then... ungh!”</i> She pumps her hips instinctively as you reach deep inside her tight, wet pocket, soft pubic fluff tickling your nose. Clawed hands clutch the headboard and you find your face being ridden for all it is worth, the kaithrit’s hard-trained vaginal muscles clutching up around your [pc.tongue]. Thump, thump, thump goes the top of your head against the synth-wood behind it, and stars swim across your vision. The only clear thought you are capable of is to try and please your huge top, because then she might let you breath properly again...");
				if(pc.hasTongueFlag(GLOBAL.FLAG_LONG) && pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" with the aid of your incredibly long, dexterous tongue, you are able to fill her pussy with shifting sensation, pushing right up to delicately touch her cervix. The loud, husky exhalations and increasingly rough thrusts of her hips this draws out of her suggests she’s a fan of this.");
				output("\n\nYou find a rough point in her wet, limber walls which sends a quiver through the hard, ropey thighs clenched around your [pc.ears] when your tongue touches it. Your [pc.lips] mashed against her pulpy labia and clit and, hands wrapped around her hips, you attack that area frenetically with the tip, [pc.eachCock] submissively hard at the thought of the pleasure you’re giving your top. Ramis squeals with delight, throwing her ponytail back and bouncing athletically on your face. She squeezes those thunder-thighs of hers tightly around your head as you attack her g-spot with frenetic flicks of your tongue... you think you hear your skull creak... and then, with a final gleeful cry, musky kaithrit femcum is dribbled into your mouth and smeared all across your face.");
				output("\n\n<i>“Whew!”</i> sighs Ramis, once she’s finished riding her orgasm to her satisfaction, a dozen bouncy, suffocating seconds later. She slides off you to one side, keeping one of her thick muscle-bound thighs weighing heavily on your heaving [pc.chest], and looks down proudly at her handiwork. You gaze back blearily, the lower part of your face glazed liberally in cunt juice.");
				output("\n\n<i>“You’re pretty good at that, to be fair,”</i> she slurs, sliding a hand through your [pc.hair] fondly. She sighs with pique as her attention drifts further down the bed. You close your eyes as you feel her grip tighten momentarily around your [pc.cockNoun " + x + "]. <i>“Shame about your silly willy. I’d love a ride now...”</i> She shifts around on top of you, hand sliding off your shaft, teasingly gliding over your [pc.belly] and [pc.chest]. Mistily content with the submissive pleasure of giving good oral, you don’t realize what she’s up to until her big, brawny buttocks land on your forehead, weighing you down powerfully again.");
				output("\n\n<i>“Night’s still young and I’m still horny,”</i> The kaithrit husks, looking over her shoulder into your widened eyes with a crooked grin. <i>“So keep at it, sweet lips.”</i> Your whine is muffled by the oozing, silky folds of her sex, which is already being bucked impatiently against your [pc.lips] again...");
				
				pc.orgasm();
				pc.girlCumInMouth(ppRamis);
				
				addButton(0, "Next", ramisCockFuck, [x, purrfectFit, "trap morning afters"]);
			}
			// Reasonable Sized Dick (5 inch - 11 inch?)
			else
			{
				purrfectFit = true;
				
				output("\n\n<i>“Woah,”</i> she says, pausing a moment as she takes your erection in. <i>“A nice-sized willy on a sissy boy? Now there’s a turn up for the books.”</i>");
				output("\n\nYou are incredibly erect and eager from the mauling she calls foreplay, and a blush flourishes across your body to her words. You share a lascivious grin in the darkness as her legs brush up the sides of your [pc.hips] and hot, dripping wetness spreads itself your [pc.cockHead].");
				output("\n\n<i>“Yessssss,”</i> the big kaithrit hisses, tails flicking, slowly sitting herself down. You groan lowly as the slickness sinks onto your packed, bulging heat. <i>“That’s the stuff! Oh boyo, you have no idea how tired I get pullin’ down the pants of girlee boys en findin’ they pack like mice. Isslike, I know you like takin’ it up the arse ‘n all but have sumthen for the rest of us, you know?”</i> Her big, brawny butt-cheeks touch your [pc.thighs], your [pc.cock " + x + "] firmly embedded in her long, silken tunnel; rough palms clap onto your wrists, pinning you down with inexorable weight. Ramis’s teeth and eyes gleam above you.");
				
				pc.cockChange();
				
				output("\n\n<i>“I’m goin’ to ride the fuck out of you, mate,”</i> she growls. <i>“Hope you don’t mind.”</i>");
				output("\n\nHer hips tighten around your midriff and she leans forward, bending your cock within her, testing it against the give and go of her soaked walls. A few firm but slow jerks and a satisfied grunt later and she clamps her muscles down around you and begins to energetically ride your [pc.cock " + x + "], claws biting into your wrists. Void... she’s like a massive vice, clamped around your [pc.hips] and keeping a vacuum-sealed packet of oiled velvet fixed tightly around your prick. And the way it kneads at you more and more intently, the more fervently she writhes on top of you....");
				output("\n\nYou find yourself taking deep gulping breaths, barely audible over the complaining of the bed and Ramis’s own vocal, groaning enjoyment. The woman is like a malfunctioning toy rabbit - the moment you think it’s not possible for her to thrust her hips any faster for any length of time, she finds another gear to step up to. Her small-nippled breasts bounce frenetically in front of your salt-stinging eyes.");
				output("\n\n<i>“If you can hold on a bit...”</i> she gasps, leonine eyes half-lidded, <i>“if you can hold on you’d be the fucken best toy boy I ever...”</i>");
				output("\n\nIt’s asking a lot. Your bulging cock feels like it’s filled with a hot magnetic charge, locked in a chamber of opposite charge. Pleasure whiplashes down your spine with every urgent jerk of her muscular frame, making you arch your [pc.belly] and thrash your [pc.legOrLegs], the only parts of you not pinned heavily down. Still - you bite down on the intense urge to cum, to give in to that tight suction and cream that fit, brilliantly punishing cunt.");
				output("\n\nRamis ratchets up her energetic thrusting to the point where the buffeting, squelching pleasure is almost unbearable - but as her orgasm rolls over her, and she growls and hisses with it insensate, she blessedly slows down, instead choosing to deliberately clutch herself up around your sturdy, pleasing fuck-stick, one crashing wave at a time.");
				output("\n\n<i>“That’s- it!”</i> she repeats, mouth hanging open, forehead glossy with sweat. <i>“That’s- it! Right- fucken- there!”</i> Fragrant fluid dripping down your " + (pc.balls > 0 ? "[pc.balls]" : "[pc.thighs]") + ", and the intense suck of her pussy tempts you to release yourself one last time. You moan woozily.");
				output("\n\n<i>“Whew!”</i> she sighs, grinning down at you lopsidedly. <i>“Needed that. You got a number, knickers? I could do with knowen where I can always find some reliable sissy dick on thisseeyear station.”</i> Still deeply embedded on you, she looks down, realization worming through the loam of her drunkenness. <i>“You didn’t spunk?");
				if(pc.race().indexOf("kaithrit") != -1 || pc.felineScore() >= 5) output(" Wow, you really are a homeboy!");
				else output(" Wow, you kaithrit trained ‘n all?");
				output("”</i> She gathers you into her ropey arms, pushing you into the warm give of her boobs as she props you up on the headboard, the hard smoothness of her stomach pressing against your [pc.belly]. <i>“You’re definitely getten a Ramis special in the mornen,”</i> she says, her musical slur vibrating through her warm softness. <i>“But I could definitely go for another ride now, ‘n you can spunk it up me if you want.”</i>");
				
				// [Another] [Sleep]
				addButton(0, "Another", ramisCockFuck, [x, purrfectFit, "trap another"], "Another", "More snu snu. MORE.");
				addButton(1, "Sleep", ramisCockFuck, [x, purrfectFit, "trap sleep"], "Sleep", "You’ve got enough bruises around the waist for now.");
			}
			
			processTime(20 + rand(15));
			// Lust maxed out
			pc.maxOutLust();
			
			break;
		// Man Fuck
		case "man":
			output("<i>“I know a place,”</i> Ramis mumbles into your ear outside Anon’s, the scent of whiskey and sporty perfume brushing down your face. <i>“Just over the way...”</i>");
			output("\n\nThe vast expanses of brawny fawn goodness you’ve got your arm wrapped around have got you champing at the bit, and you’re happy to not go very far to get your teeth into it. The love hotel she takes you to is not two hundred yards away, decorated in deep purples and reds, fully automated for discretion’s sake. You are just one of many whispering and giggling one night stands walking into it; the Milky Way is an unremittingly horny place.");
			output("\n\nYour hands wander as ");
			// If the PC has 100 credits:
			if(pc.credits >= 100)
			{
				output("you pay");
				pc.credits -= 100;
			}
			// PC is a fucking bum:
			else
			{
				output("she pays");
			}
			output(" the desk robot, and finding the flesh warm and willing you grow increasingly bold, dipping your hand below her belt and lycra underwear to grope her big, muscular buttcheek. Inside the lift she grips you by " + (pc.isChestCovered() ? "your [pc.upperGarment]" : "the shoulders") + " and pushes her lips against yours, her tongue beckoning your own into her hot, alcohol-soaked mouth. You push her back against the wall, [pc.chest] dipping into her pliant tits, tangling your [pc.tongue] with hers as you rub your [pc.groin] against her denim-clad crotch demandingly.");
			output("\n\n<i>“It’s been so fucken long since I had a real man,”</i> she grits into your face as you paw at her breast, finding her bullet-like nipple and rubbing it intently between thumb and finger. <i>“Issall... girlees and lads who don’t like girlees who can outfight and drink ‘em...”</i>");
			output("\n\nIt’s all you can do to suppress the urge to pull down the kaithrit’s jeans, lift her up and take her right there and then... but somehow you pull away when the lift doors open, and you " + (!pc.isNaga() ? "stumble" : "slither") + " to your room. The small scanner flicks over her eye and silently opens the door to your small, dimly lit suite. Equipped now with a good idea of what gets her going, you grip Ramis behind the knees and neck, grit your teeth and lift all seven feet of her off the ground, drawing a delighted squeal as you " + (pc.hasLegs() ? "stagger" : "inch") + " forward and tumble her onto the bed (which groans in protest). Her teeth and eyes flash in the dark as she rips her own clothes off, her gaze slowly moving down your [pc.chest] as you stand over her");
			if(pc.isCrotchGarbed()) output(", divesting yourself of your [pc.lowerGarments]");
			output(".");
			// PC has no cock that fits
			if(x == -1)
			{
				x = pc.biggestCockIndex();
				
				output("\n\n<i>“Ummm,”</i> mumbles Ramis, eyes wide as she stares at your [pc.cock " + x + "].");
				// Silly mode only:
				if(silly) output(" Of course, it is only natural for you to see FEAR in women’s’ eyes when you unzip your pants.");
				output(" <i>“So, I can see where your confidence comes from.”</i> She shifts on the bed, the expression you can see in the dim light somewhere between uneasiness and awe. <i>“I’m not sure I can do anything with that to be honest, boyo...”</i>");
				output("\n\nShe wants you to take the lead here, and that’s exactly what you do. That flare of animalistic lust that has gotten you this far driving you on, you clamber onto the bed, looming over the rippled lakes and rolling hills of Ramis’s body, slowly lowering yourself between her spread thighs and pressing the shaft of your massive, erect cock against the soft down of her pubis. Holding her gaze, you press your hard meat downwards, feeling the lips of her pussy part around you, bathing the base of your [pc.cockNoun " + x + "] in silky wetness. You begin to rotate your [pc.hips], sliding the girth of your cock over her entrance, the [pc.cockHead] pointing up towards her boobs.");
				output("\n\n<i>“Ooh,”</i> she purrs, yellow eyes half-lidded as you rub yourself against her, working more and more tight lust into your massive dick.");
				if(pc.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY)) output(" The swollen nodules on your length are certainly a bonus; they bump and flick over the kaithrit’s tender entrance and clit, making her coo and hum with pleasure.");
				output(" <i>“That’s quite nice.”</i> Her mouth remains open, her hands drifting down your back as your [pc.lips] descend onto her small, hard nipples, biting and flicking at them with the tip of your tongue, all the while you slide your bulging length up and down her channel. <i>“But I don’t think you should - I don’t think I can take - ”</i>");
				output("\n\nShe’s still not getting it. Heady lust pulsing through you, you grip her full, brawny thighs and heave her legs upward. Her gasp of surprise dissolves into an exhalation of pleasure as you use the extra leeway to drive your [pc.cockNoun " + x + "] with increased force across her wet sex.");
				output("\n\n<i>“You can’t use me like - what are you like?!”</i> she cries out, wicked delight coloring her tone. The seep of her excitement oils your thrusting rod, making your passage increasingly smoother, increasing how hard and far you can thrust yourself against her.");
				if(pc.cumQ() > 500) output(" Your plentiful pre-cum too, oozing deliciously from your [pc.cockHead] allows you to pump between her puffy pussy lips with gleeful ease.");
				output(" You grunt with pleasure as your huge dick slicks across her hard, dappled abdomen, the slick of sexual juices spread further and further up her front. Her washboard tummy is perfect for this - brilliantly firm and bumpy across the hot woodenness of your cock.");
				output("\n\nRamis watches you masturbate against her with color in her cheeks and her mouth open wide, somewhere between wonder, arousal and amusement. Her muscles shift against your arms, and you groan with delight as she slowly closes her legs around your [pc.cock " + x + "], sandwiching it in thick, unyielding, tawny amazon flesh.");
				output("\n\n<i>“Do you like that?”</i> she growls. <i>“Does that feel good around your dick, you massive beast?”</i> You answer her by grabbing at her erect nipples with your teeth again, pulling at the sweet little nubs hungrily, all the while you saw against her pussy and through her legs with demanding thrusts of your [pc.hips], molten lust coursing through your body. For such a big girl her clit seems very small, but going off the little gasps and quakes you’re drawing out of her, " + (pc.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY) ? "your nodules" : "your cock") + " is rubbing directly over it...");
				// Mega cock:
				if(pc.cLength(x) > 36) output("\n\nYou knew your cock was big enough, and now you’re here there’s no way you are going to ignore the temptation of her pliant, generous breasts. You draw your mouth away from her nipples just so you can pump your cock between those trembling hills, sighing with pleasure as your leaking tip glides over the only soft part of Ramis’s anatomy. Drunk with lust now, the kaithrit grins toothily as she grips her own breasts for you, enabling your cock to spear into the pliant nook between them. The ecstasy of using not one but two cock sleeves of amazon flesh makes you crane your neck back and grunt like a lowing bull, stars bursting over your eyes.");
				output("\n\nThe heavy clouds of orgasm gather behind your brow, and they build as you thrust yourself across the various delicious flavors of Ramis with escalating fervor until, with a groan of delight, you let them break. Your [pc.cum] seems to light up every inch of your massive cock with pleasure as it surges up it, spurting generously " + (pc.cLength(x) <= 36 ? "over the kaithrit’s plush boobs" : "across the kaithrit’s face") + ". She cringes slightly, laughing with her eyes closed, again caught somewhere between palpable disbelief that you’d do this with her and the pure delight of submitting to it. In the crashing, feral storm of your high you tell yourself it’s imperative you do this a few more times, conquer her and do it this way and that with her, and completely move her from the former to the latter.");
				if(pc.cumQ() > 5000) output(" Your [pc.cumVisc] seed splatters on the wall behind the bed, deluging Ramis’s considerable frame up and down as your generous orgasm goes on and on, one juicy, ecstatic splurge after another until she and much of the immediate vicinity looks like it was caught in by a [pc.cumColor] paint bomb.");
				output("\n\nEventually you sag back on your [pc.feet], dripping trouser monster sagging, thoroughly spent.");
				output("\n\n<i>“That was... different,”</i> murmurs Ramis in a tickled tone, knocking a lamp over as she flaps around for the courtesy towels. Her smooth calves slide teasingly down your throbbing length. <i>“You certainly know how to get what you want, don’t you, big boyo? Shame it didn’t quite...”</i> She trails off as you climb further up the bed, reaching your hand into her opened, steamy muff as you do. You know where to look, and whilst her heat is still high, you could do with finding... the kaithrit inhales with delight, her chest swelling as you find it, a tiny little nub of tougher flesh near the top of her slit. Easy to miss in the great mass of toned female bulk that surrounds it, but given the way her mouth opens when you flick at that spot insistently, femcum oiling your fingertips, this is exactly where she is at her most sensitive.");
				output("\n\nYou keep at it, beckoning away at her undersized clit, letting your other fingers trace her soaked slit and down her inner thighs, until the dirty blonde clutches up the sheets in her hands, muscles tensing up ponderously as she arches her back and lets out a full blooded yowl at the ceiling, orgasm seeming to ripple up her in waves. You grin in triumph as you watch her squirm in pure delight to the touch of your fingers; every female experiencing pure sensual delight whilst plastered in your cum is a job well done.");
				output("\n\n<i>“Can you fix spaceships as well?”</i> she whispers, looking at you with deep, heavy-lidded satisfaction. <i>“Seems as if you can do anything with them hands...”</i> She shifts a long, smooth leg along your [pc.legOrLegs]. <i>“I know we don’t know each other very well,”</i> she murmurs, with uncharacteristic hesitancy. <i>“But - d’you mind holden me a bit?”</i> You silently wrap your arms around Ramis’s hot, smooth back, shifting her towards you across the sheets. The kaithrit hums with pleasure, sliding her arms underneath yours and snuggling her face into your [pc.chest]. <i>“That’s the way. I do like a man with nice, strong arms...”</i>");
				
				pc.orgasm();
			}
			// Naga Scene GET
			// Requires Naga AND cock that fits
			else if(pc.isNaga())
			{
				output("\n\nShe frowns slightly, still grinning, as you lead your undulating lower body onto the sheets, as if trying to make sense of what she’s looking at.");
				output("\n\n<i>“Don’t see boyos who are... umm... wiggly very often,”</i> she slurs. <i>“Told there were aliens discovered this rush which are sortuv kaithrit with bottom halves like that.”</i> She gazes up at you. <i>“You one of ‘em?”</i>");
				output("\n\nYou do nothing but smile, undulating more and more of your [pc.legOrLegs] onto the bed, allowing you the leverage to sinuously rise, slowly and sensuously writhing your naga form, [pc.skinFurScalesColor] scales flowing slowly up the river of your body. Ramis’s grin widens - but her dilated pupils are transfixed, the thick tips of her two tails gently twitching. You move the tip of your own snake tail onto the sheets, flicking it from side to side; you can’t help but laugh when she rears, breasts bouncing, raising her hands to bat at it reflexively.");
				output("\n\n<i>“Alright, okay,”</i> she snorts, breaking the spell with a shake of her ponytail. <i>“So what can you do for me, string?”</i>");
				if(pc.hasStatusEffect("Genital Slit") || pc.hasSheath(x)) output("\n\nAs way of answer, you extend your fiercely erect cock out of your " + (pc.hasStatusEffect("Genital Slit") ? "genital slit" : "sheath") + ".");
				if(pc.cLength(x) > 5)
				{
					output("\n\n<i>“Ooh,”</i> leers Ramis, grin widening as she takes in your [pc.cock " + x + "]. <i>“That looks more like my cup of tea.”</i> She pulls her yellow eyes upwards to fix yours with a laughing, provoking gaze. <i>“Do you know how to use it?”</i>");
				}
				else
				{
					output("\n\nRamis honks a laugh at the ceiling when she sees your [pc.cock " + x + "].");
					output("\n\n<i>“Been usen cheap steroids, have we?”</i> she says with a condescending smirk. <i>“I was hopen you’d be a littell bit biggeren that, if you don’t mind me sayen. Or izzat massive amongst snakey types?”</i>");
					output("\n\nIf anything her teasing only inflames you even further. You got her here by appearing more than you seem. Time to demonstrate that even more acutely.");
				}
				output("\n\nYou take her into your arms, " + (pc.tallness >= 71 ? "molding your [pc.chest] against the plush warmth of her boobs" : "pressing your mouth into the plush warmth of her boobs, finding a small, hard nipple and rolling it between your teeth") + ", gruffly rubbing your [pc.cock " + x + "] between the lips of her fluffy pussy. The kaithrit responds eagerly, rolling her big, muscular hips into you until your length is slick with femcum. As the writhing mutual masturbation gets more heated, you squeeze the tip of your snake tail between her hard calves, undulating your lower body through the gap and then working it back around, gripping her legs tightly in the loop. Ramis murmurs slightly in alcohol-slowed confusion, slabs of muscle shifting beneath your serpentine grip - but she lets you continue to coil yourself around her, and seems to become more and more eager the more of her long, thick limbs you wrap yourself around.");
				output("\n\nYou angle your [pc.cockHead] head against her sopping wet hole as you shift your tail over her collarbone, penetrating her deeply as you curl yourself around her rounded shoulders. Your groan melds with hers as you sink into supple, hot silkiness, long enough that you");
				if(pc.cLength(x) <= 5) output(" are all the way in");
				else output(" almost up to " + (pc.balls <= 0 ? "the base" : "your [pc.balls]"));
				output(" with a single delicious push. Reflexively your body tenses up, constricting the coils you have succeeded in tying Ramis up in from top to bottom.");
				
				pc.cockChange();
				
				output("\n\n<i>“Do you do this a lot?”</i> she whispers, face livid with lust and giggly disbelief as she looks down at the heavy reptilian coils swaddling her body. <i>“Tie up every girlie you meet in yourself? Or is that just the way they diddle on planet kit-snake?”</i> She squirms, her smooth, fawn skin shifting against your leathery scales; her pussy ripples and writhes around your [pc.cock " + x + "]. <i>“Do you mind if I try...?”</i>");
				output("\n\n<i>“Go for it,”</i> you husk. She flexes her muscles and heaves against you, using all of the loaded power in her arms and lengths to break free of you. Your snake instincts kick in, and without even having to think about it you tighten your hold, clenching up your coils until they are like wire rope. Ramis gives up the struggle after a few seconds, chest heaving beneath your long, lithe lower body.");
				output("\n\n<i>“Wow,”</i> she grunts. Her face is wild with exhilaration, her wide yellow eyes fixed on your face. <i>“You’ve got me good. Guess you can do whatever you want now...”</i>");
				output("\n\nYou can, but you’re going to take your good time doing it. The sensation of having this big, muscular alpha bitch entirely under your organic control is too wonderful not to luxuriate in. You spend a long time dipping your [pc.cock " + x + "] slowly in and out of her, almost teasing her with the reptilian pace of it whilst you slide your leathery scales back and forth over her full, fit body, allowing the sensation of her dense, bulging warmth shifting over so much of your coiling tail to drown out all other thoughts. The fact your calmness frustrates the kaithrit, making her ineffectually jerk her hips beneath you to get more out of the slow sink and retreat of your cock, only increases your tactile enjoyment of it. Occasionally you stir her, using your natural litheness to bend your [pc.hips] this way and that, just enough to push into her tender walls and keep her arousal on edge.");
				output("\n\n<i>“This is crueller than if you slapped me around instead!”</i> she wails, cheeks a fetching maroon color. <i>“No, that’s not an excuse to start doing that!”</i> she continues, as you extend the tip of your tail up to her face and playfully bat her across the face with it. Grinning, you lower the blunt tip to flick over a small, protuberant nipple, ever so slightly increasing the pace of your push into her sleek, muscle-marbled sex as you do. A series of husky, escalating moans escape Ramis’s wide, open mouth, her torso swelling up and trembling like a minor earthquake beneath the close touch of your coils; her pussy clenches up around the bulging, avid flesh of your [pc.cock " + x + "]. A few stars dancing before your [pc.eyes], you pump into that clenching, sucking pocket harder, instinctively tightening up your prehensile body as you do.");
				output("\n\nWhen Ramis cums, you are holding her so tightly she can barely move; it’s like being wrapped around a jackhammer. She shoves herself down your pole, oiling it");
				if(pc.balls > 0)output(" and your [pc.balls]");
				output(" in her juices with the tiny, constricted movements available to her with husky, orgasmic barks, all of her thrashing absorbed into your suffocating leather. The trembling shaking through your core, translating through your [pc.groin] is dizzyingly gratifying - but as heavy as your arousal is, your [pc.cock " + x + "] primed and raring to release into the shaking, pulsing suck it’s mired in, you hold on, continuing to give her the dick with the measured ebb and flow of your hips until the thick, unyielding muscles underneath you cease their out-of-control spasms.");
				output("\n\n<i>“Uff... I never got the whole tying up for shagging thing,”</i> she groans, delirium sloshing up and down her musical tones. <i>“But this... it’s like it’s all locked up inside you, and it’s so... uff!”</i> You hilt yourself in her, tracing her hot lips with your lithe tail tip as you do, teasingly shooting it between them, rasping it against her thin, rough tongue.");
				output("\n\nYou force the big kaithrit to another tremendous, shaking orgasm - so much energy in those long, ropy limbs, but you have the strength to remain swaddled upon them, a giant leathery truss that pumps into her convulsing, dribbling cunt heedless of her rapturous struggles - before finally allowing yourself over the edge. You exhale long, throaty groans at the ceiling as you close up around her so tight you think you hear her ribs creak before a detonation of [pc.cum] shoots up your [pc.cock " + x + "] and geysers into her long, narrow pathway. Totally lost in the pleasurable pulses, you clap your hips against her hard thighs, intent on giving her as much of your pent-up fruit into her as possible.");
				var cumQ:Number = pc.cumQ();
				// High Cum:
				if(cumQ >= 5000) output(" You quickly pack her out, [pc.cumColor] gunk spurting out around your flexing girth; you draw out, and with a series of stupendous clenches paint her sweat-dappled torso, breasts and face with generous amounts of it. Tied and weighed down as she is, Ramis can only flinch and coo, in the end angling her well-defined face to take your last heavy spurts full-on, so dazed with the pushing that she gladly accepts something from you that she probably never would from anyone else. It’s a thought that fires you on to cannon every last drop of your load onto her A-grade gym bunny form.");
				output("\n\nYour cock droops at last, " + (pc.balls <= 0 ? "spent" : "your [pc.balls] spent") + " and drooling after a dozen succulent clenches.");
				if(cumQ >= 5000) output(" You withdraw slowly from Ramis’s thoroughly creamed pussy, the slick motion over your gently aching member.");
				output(" At the pace of an anaconda that has just swallowed a leopard whole, you relax yourself, your patterned scales gently peeling off the kaithrit’s brown skin. She shifts her hands over your [pc.legOrLegs], claws gently trailing down your leather as you slither it slowly over her, a big, dozy grin on her");
				if(cumQ >= 5000) output(" [pc.cum]-covered");
				output(" face.");
				if(cumQ >= 5000) output(" You get completely smeared in the results of your own over-excitement, but you suppose that’s a price worth paying.");
				output("\n\n<i>“That was pretty good, string,”</i> she murmurs, her voice shivering through you. <i>“Think you broke a rib, but then I think I’ve done that to a few myself.”</i> She pauses, and goes on in an unusually hesitant tone. <i>“D’you think you could hold me a bit? Not as tight as before, but...”</i> Silently you twine yourself around her legs and midriff, drawing her back into your coils. The kaithrit hums with pleasure, sliding her arms underneath yours and snuggling her face into your [pc.chest]. <i>“That’s the way. I do like a man with nice, strong arm- leg- thingies...”</i>");
				
				pc.orgasm();
			}
			// Reasonable Sized Dick (5 inch - 11 inch?)
			else
			{
				purrfectFit = true;
				
				if(pc.cLength(x) > 5)
				{
					output("\n\n<i>“Ooh,”</i> leers Ramis, grin widening as she takes in your [pc.cock " + x + "]. <i>“Got a nice size willy on you en all.”</i> She pulls her yellow eyes upwards to fix yours with a laughing, provoking gaze. <i>“Do you know how to use it?”</i>");
					output("\n\nYou answer that by seizing");
				}
				else
				{
					output("\n\nRamis honks a laugh at the ceiling when she sees your [pc.cock " + x + "].");
					output("\n\n<i>“Been usen cheap steroids, have we?”</i> she says with a condescending smirk. <i>“I was hopen you’d be a littell bit biggeren that, if you don’t mind me sayen.”</i>");
					output("\n\nIf anything her teasing only inflames you even further. You got her here by appearing more than you seem. Time to demonstrate that even more acutely.");
					output("\n\nWithout another word you seize");
				}
				output(" her by the hard, full thighs and dipping your head between them, rasping your [pc.tongue] along her moist slit with aggressive, predatory laps, making her tense up and twitch in your hands, cooing and giggling with husky glee. The firm lakes and rolling hills of the muscular cat-bitch go on and on in every direction, and now you’ve won your right to them fair and square, you are determined to enjoy as much of it as you can. You trail little bites and licks down her inner thighs, the taste of salt and feminine excitement tingling on your taste-buds, as your hand finds her tails beneath you, coiling your touch down the delightfully long, thick and fluffy appendages.");
				if(pc.hasTailCock()) output(" You twist your [pc.cockTail] around and slide its bulbous girth along the sole of her clawed feet and then up her calf, using your extra dexterity to inundate her senses whilst you continue to assault her pussy and inner thighs with your nipping, probing mouth. Throbbing, expectant pleasure courses up your prehensile dick in response to the touch of her smooth, fawn skin.");
				output("\n\nYou’re sure you actually hear purrs reverberating through her - but they turn into glorious yowls when you bury your tongue into her tight, long cunt as far as you can, nose deep in her fluffy pubis as you curl at her sensitive innards demandingly. Flailing heels and hard thighs buffet your back and [pc.ears] as Ramis writhes around you, tangy femcum freely oiling your [pc.lips].");
				
				pc.girlCumInMouth(ppRamis);
				
				output("\n\n<i>“Fuck! Yes!”</i> the kaithrit cries out loud enough to make your ears ring, arching her back and clutching up big handfuls of the sheets. <i>“Get right up there! Yes!”</i>");
				output("\n\nYou intend to, but not with your tongue. With a bestial, hungry growl, you clamber up her, exulting in the shifting textures of her washboard midriff and her soft, pliant boobs over your [pc.chest] as you grip her underneath the knees and sink your [pc.cockNoun " + x + "] into her dripping hot hole with a single, determined push of your [pc.thighs]. Her spread lips part before your [pc.cockHead] gloriously, enabling you to surge deep into her wetness, spreading her tunnel with bulging, tender dick.");
				
				pc.cockChange();
				
				output("\n\nRamis hisses and bites her lower lip as you penetrate her, as if she were stepping into a deep, hot bath. Elbows mired in the sheets, she simply watches you as you slowly draw yourself back from her slick twat, apparently just enjoying watching you do as you please with her.");
				if(pc.tallness < 71) output(" It’s difficult to entirely catch her expression though, given that even " + (pc.balls > 0 ? "balls deep" : "all the way") + " in her your head only reaches her breasts. Which is not the worst thing in the world. Her soft flesh quivers, her hard flesh clenches as you encompass a small, hard nipple in your mouth, licking and chewing at it as you continue to push into her wonderfully long, narrow pussy.");
				else output(" You can bask in her expression because you are easily a match for her size; [pc.chest] rubbing against her small, hard nipples, you feel whiskey puff over your face as you make her gasp, two giants going at it furiously enough to make the bed make alarming cracking sounds.");
				output("\n\nYou can easily slot your entire length into her, and still with your hands wrapped around her heavy hips, you rock into her, for a while luxuriating in the wonderful give and take of pussy down every inch of your [pc.cock " + x + "], Ramis’s heavy breathes and tiny sighs the heady soundtrack. A hoarse grunt is forced passed your lips as it suddenly clenches up around you, formidable amounts of muscle tightening up acutely around your rock-hard prick.");
				output("\n\n<i>“Harder,”</i> husks Ramis, between gritted teeth, staring at you with that teasing, dilated gaze of hers. Pulse thudding in your head, you winch her thighs up so they are practically pressed against her stomach and then open up your hips, forcing raging lust into disciplined athleticism to drive into her with maintained enthusiasm. She squeals with glee, breasts shaking, writhing and clenching up around the unyielding piston of your cock, urging pleasure through you and making " + (pc.balls <= 0 ? "you" : "your [pc.balls]") + " swell with an unstoppable desire to pack her full of [pc.cum]. Not yet though, not yet... claiming a girl so big, tough and drunk that you can thrust into her soaked heat with all your might, bang out a rhythm on the backboard with her head, and it simply makes her cry out for more, is all you could hope for.");
				output("\n\n");
				if(pc.tallness >= 71) output("She reaches up and wraps her sinewy arms around your shoulders as orgasm clenches her up, claws biting sharply into your [pc.skinFurScales]. For long moments you are supporting almost her entire weight - all of 120 kg on your arms and back - and the fact you can do it only seems to excite her even more, thrusting the soaked, rippling sleeve of her cunt into your [pc.cock " + x + "] with ecstatic, groaning intent.");
				else output("She pushes your head deep between her breasts as orgasm clenches her up, claws biting sharply into your [pc.skinFurScales]. You find yourself utterly mired in amazon.");
				output(" Slabs of brown muscle slap and tense themselves against you as Ramis tenses up around your rock-hard girth again and again, roaring her delight at the ceiling, claws pricking your skin. Mildly deafened, it’s all you can do to keep stoutly pumping into her hot, dripping suck.");
				output("\n\nYou wait until she’s come down, grinning hugely at the ceiling, yellow eyes turned upwards to the continued joy of your cock pressing into her drooling, tenderized sex, before you make your own move. Heart thudding, you wind up your aching muscles one last time and heave her over, repositioning her on her knees, big brawny butt up and exposed. Ramis’s gasp turns into a delighted cry when you clap your [pc.thighs] into her anew, digging your [pc.cock " + x + "] into her tender walls from a fresh angle with determined, juicy pushes. She raises her twin tails, looks over her shoulder and watches you go with sensuous relish.");
				output("\n\n<i>“S’it,”</i> she husks. <i>“Fuck me! Take me like a real man! Do it to me like you want to, you beast!”</i> Breath coming hard and heavy, you slam your palm into her buttock (it barely moves), drawing a delighted moan out of her. You keep a firm grip on one tail, fur fluffing out between your fingers as you spank her again and again, pumping every inch of your furiously erect prick into her muscle-rippled pussy with everything you’ve got.");
				output("\n\nYou think you feel her tense up in quivering orgasm around you again, and this time you don’t deny yourself.");
				if(pc.hasKnot(x)) output(" With a growl, you shove your hotly inflated knot into her, spreading her lips wide, fiercely locking yourself into her.");
				output(" Sweat soaking your frame, you allow all that backed up arousal to boil over, your [pc.cock " + x + "] tensing up before, with a delighted groan, you flume delicious pulses of [pc.cum] right up her. The sensation of your seed packing her tunnel draws a wonderful, cooing mewl out of the kaithrit; you reach forward and grip her ponytail, making her arch her back like a bitch in heat for you.");
				output(" Your cock keeps pumping out more and more seed, every thrust of your hips marked by another packet of hot [pc.cumColor] fired wonderfully home. Even for a girl of Ramis’s formidable size it’s soon squirting heavily out around your " + (!pc.hasKnot(x) ? "girth" : "[pc.knot]") + ". Intoxicated and overburdened with pleasure, you pull out of her stuffed, dripping hole and stripe the long curve of her back with the last of it.");
				output("\n\nYou fall onto the sheets next to her when you are finally spent, intense gratification throbbing all the way through you, feeling the sheen of sweat slowly dry on your [pc.skinFurScales], your pants subsiding. <i>That’s</i> how to claim a prize. A long, smooth leg runs up your [pc.leg]; claws gently prick your arm.");
				output("\n\n<i>“I know we don’t know each other very well,”</i> murmurs a woozy voice in your ear. <i>“But - d’you mind holden me a bit?”</i> You silently wrap your arms around Ramis’s hot, smooth back, shifting her towards you across the sheets. The kaithrit hums with pleasure, sliding her arms underneath yours and snuggling her face into your [pc.chest]. <i>“That’s the way. I do like a man with nice, strong arms...”</i>");
				
				pc.orgasm();
			}
			output("\n\nHeavy, purring snores are soon being sucked and blown into your solar plexus.");
			
			processTime(20 + rand(15));
			
			addButton(0, "Next", ramisCockFuck, [x, purrfectFit, "man morning afters"]);
			break;
		// Failsafe
		default:
			output("Nothing happened!");
			addButton(0, "Next", mainGameMenu);
			break;
	}
	
	ramisSexed(response);
}
public function ramisCockFuck(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	showRamis(true);
	clearMenu();
	
	var ppRamis:PregnancyPlaceholder = getRamisPregContainer();
	var x:int = arg[0];
	var purrfectFit:Boolean = arg[1];
	var response:String = arg[2];
	
	switch(response)
	{
		// Sleep
		case "trap sleep":
			output("Ramis " + (pc.hasHair() ? "ruffles your hair" : "strokes your head") + " fondly.");
			output("\n\n<i>“Alright, I don’t mind,”</i> she says, laboriously climbing off your erect, needy cock, hiccupping as she settles herself down besides you. <i>“I know how fragial boyos are...”</i>");
			output("\n\nShe’s rumbling the bed with her snores in moments.");
			
			processTime(15);
			
			// [pb]
			addButton(0, "Next", ramisCockFuck, [x, purrfectFit, "trap morning afters"]);
			break;
		// Another
		case "trap another":
			output("You answer her by circling one of her small, hard nipples with your [pc.tongue], nibbling it gently. Ramis hums, a big pleased grin on her face, and slowly begins to work her thick, muscle-bound hips again, kneading your [pc.cock " + x + "] in her depths.");
			output("\n\nSoon enough you are pressed hard against the headboard, face wedged between a pair of palpitating kaithrit tits, being battered into the wall as Ramis rides your dick with urgent, ruthless thrusts of her body. Every tightening of her cunt around you is so intense - an explosion of tingles goes off in your bulging length every time she pumps you, and once she’s in her rhythm she’s pumping more than once per second. All you can do is clutch her long back and give yourself up to the intense, slutty joy of being roughly used like this.");
			output("\n\nShe works out another furious orgasm from you - gasping and gloating with it, tightly plastering her fawn skin to yours as her femcum and sweat drips down you - and then looks down, still stirring you within her, drinking in your expression as she boils you over.");
			output("\n\n<i>“Cum, sissy boy of mine,”</i> she growls. <i>“I said you could, now you will. Go on.”</i> You give in to her command and the wonderful, shivering tightness of her pussy, pumping your [pc.hips] delightedly but ineffectually under her slabs of muscle as your [pc.cock " + x + "] bulges up and releases ecstatically within her, surging [pc.cum] into her tunnel with wonderful, surging pulses. More than anything, getting to pack the foof of an amazon like this with your thick cream is profoundly satisfying.");
			output("\n\nYou spend a few moments more still joined together, enjoying the sticky, throbbing afterglow together, before Ramis clambers off you. You are left feeling sore but incredibly satisfied.");
			output("\n\n<i>“Don’t get bumps as good as that from randomos usually,”</i> mumbles the kaithrit, settling herself down beside you. <i>“Hope you’re up for more ‘n the mornen...”</i>");
			output("\n\nShe’s rumbling the bed with her snores in moments.");
			
			processTime(30);
			
			// [pb]
			addButton(0, "Next", ramisCockFuck, [x, purrfectFit, "trap morning afters"]);
			break;
		// Morning Afters
		// All scenes merge here
		case "trap morning afters":
		case "man morning afters":
			// Time forward 10 hours
			processTime((10 * 50) + rand(20));
			
			output("You come to in the early hours of the morning. The hotel room has no windows - and if they did they’d look out onto the artificial lights of Tavros’s commercial district - but one side of the room mimics the pale, keen light of a rising sun, a placid reminder to vacate the premises in the next few hours.");
			output("\n\nYour sheet-covered [pc.chest] has a thick weight thrown over it, and it takes you a moment to work out what it is. Ramis the kaithrit has her arm slung over you, holding you close to her bare breasts and warm smell of musk, aerosol and whiskey. She’s fast asleep, the sound emerging from her open mouth somewhere between a throaty snore and a contented purr.");
			if(x == -1)
			{
				output("\n\nCarefully, you slide out from underneath Ramis’s arm, tuck her back in, retrieve your clothes and slip out. She shifts slightly but doesn’t wake up. You suspect trying to accomplish something with your over-sized dick might not go down quite as well when she’s hung over.");
				
				addButton(0, "Next", mainGameMenu);
			}
			else
			{
				output("\n\nYou would guess from the way she’s clasping you that she went to sleep with the firm intention that you weren’t going anywhere in the morning - however she’s still deep enough in an alcohol-induced coma that you could probably sneak out now, if you wished...");
				// [Sneak Out] [Wake Her Up]
				if(response == "trap morning afters")
				{
					addButton(0, "Sneak Out", ramisCockFuck, [x, purrfectFit, "trap sneak out"]);
					addButton(1, "Wake Her Up", ramisCockFuck, [x, purrfectFit, "trap wake her up"]);
				}
				if(response == "man morning afters")
				{
					addButton(0, "Sneak Out", ramisCockFuck, [x, purrfectFit, "man sneak out"]);
					addButton(1, "Wake Her Up", ramisCockFuck, [x, purrfectFit, "man wake her up"]);
				}
			}
			break;
		// Sneak Out (Trap)
		case "trap sneak out":
			output("Carefully, oh-so-carefully, you slide out from underneath Ramis’s arm, tuck her back in, retrieve your clothes and slip out. She shifts slightly but doesn’t wake up. She’ll be disappointed when she wakes up - on the other hand, given how she treats her bed-mates, she shouldn’t be surprised either.");
			
			processTime(3);
			
			addButton(0, "Next", mainGameMenu);
			break;
		// Sneak Out (Man)
		case "man sneak out":
			output("Leaving her with a generous, sloshed memory of her one night stand, rather than what you look like in the cold light of day, is the thing to do - your body is aching enough already anyway. Carefully, you slide out from underneath Ramis’s arm, tuck her back in, retrieve your clothes and slip out. She shifts slightly but doesn’t wake up.");
			
			processTime(3);
			
			addButton(0, "Next", mainGameMenu);
			break;
		// Wake Her Up (Trap)
		case "trap wake her up":
			output("You set to work on the most obvious and enticing targets in front of you. Ramis stirs, her pointed ears flattening when you slide one of her small nipples between your [pc.lips], gently sucking and nibbling on it; her snoring turns into a pleased, murmuring groan when your fingers find her other breast, kneading and rubbing its nub. Her grip on you tightens, and a hot, heavy hip wraps itself around your [pc.legOrLegs].");
			output("\n\n<i>“Well now,”</i> she says, opening foggy eyes at last and looking down at you. <i>“What d’we have here?”</i>");
			output("\n\n<i>“Morning room service,”</i> you smile back, drifting your hand down her rippled abdomen towards her delta.");
			output("\n\n<i>“How nice. If only I could get frisky, obedient sissy boys on tap in every place I stayed... hhh, right there. Right there.”</i> Her eyes close and her mouth opens again as you curl your fingers into her increasingly wet snatch. Her hips flex reactively. <i>“Shower,”</i> she grunts, shifting her bare, considerable frame out of bed with a creak. <i>“Now.”</i>");
			output("\n\nThe shower cubicle is not really designed to accommodate both a creature of her size and a partner. Fortunately, Ramis has you to reach the places she can’t. Under the hot beads of water, you slide your soapy hands up her calves, the insides of her hard, muscle-bound thighs and between the crack of her ass, lovingly paying attention to the spots that matter whilst she shampoos her hair");
			if(pc.hasHair()) output(" and your [pc.hair] at the same time, rather roughly");
			output(". Your ministrations draw choruses of pleased hums and sighs over the batter and hiss of the water.");
			output("\n\n<i>“You’ve been such a good boy,”</i> she says huskily, looking down through curtains of soaked blonde hair at you. <i>“And I did promise, didn’t I? Alright. Turn around and put your hands on the wall.”</i> You do as she says. You heart lurches slightly as soft boob flesh " + (pc.tallness > 86 ? "presses into your back" : "rests on your shoulders") + ", a hand slithers around to grasp your [pc.cock " + x + "], and a single digit nestles its way between your butt cheeks.");
			output("\n\n<i>“I know how sissies like it,”</i> the kaithrit murmurs. She hushes you soothingly as you gasp, tensing up slightly as she penetrates your [pc.anus] with her middle finger, sinking in to your sensitive back passage. Your prick is rubbed up and down with brisk jerks of her wrist as she curls her finger, pushing it into your walls round and round, turning it around, searching for something... <i>“You’ve just got to find - ah.”</i> A frisson of pure, electric sensation shoots up your spine as she touches something deep. You spasm in her firm grip like a landed salmon, making her giggle. <i>“There.");
			if(pc.cLength(x) < 5) output(" Perhaps you cud look into getten a willy bigger’n then a girl’s finger, so you ken do this for someone else sometime, hmm?");
			output(" Keep your hands still now...”</i>");
			output("\n\nGasp after moan after gasp is pushing out of your lungs into the humid air as Ramis milks your prostate with an insistent beckoning motion of her finger, driving over that tender bulb within your [pc.ass], all the while her tight grip flicks up and down your [pc.cockNoun " + x + "]. No bitch boi in the galaxy could last long against such treatment, and you are swiftly driven to a coruscating orgasm, swelling up in the kaithrit’s hand and " + (pc.cumQ() < 100 ? "squirting" : "pasting") + " [pc.cum] across the shower wall between your quivering hands. She ruthlessly works you, pressuring your clenching boy buzzer and kneading your jolting cock until you are flexing dryly");
			if(pc.balls > 0) output(", your [pc.balls] achingly empty");
			output(". Only then does she withdraw her finger, asshole shrinking up tightly behind her, and let you go with a satisfied purr.");
			// Reasonable cock:
			if(purrfectFit)
			{
				output("\n\n<i>“A girlee boy who’s a decent fuck and sticks around for their medicine afterwards,”</i> she ponders to herself as she dries her hair. She flashes you a smile over her shoulder. <i>“Where have you been all my life? You run along for now, but be somewhere I ken easily getahtchew when I’m on shore leave, alright knickers?”</i>");
				output("\n\nShe gives you a firm pat on the [pc.ass] as she heads for the door.");
			}
			// Otherwise:
			else
			{
				output("\n\n<i>“Hope you enjoyed that ‘n all, mate,”</i> she says as she dries her hair. <i>“Be somewhere I ken easily getahtchew when I’m on shore leave, but see if you can’t come with something a bit more fun " + (pc.hasLegs() ? "between your pretty little legs" : "down there") + " next time, alright?”</i>");
				output("\n\nShe gives you a firm pat on the [pc.ass] as she heads for the door.");
			}
			
			//Reset lust
			//Time forward 2 hours, put PC in front of Anon’s Bar
			processTime(90 + rand(60));
			pc.orgasm();
			pc.shower();
			currentLocation = rooms["ANON'S BAR AND BOARD"].westExit;
			
			addButton(0, "Next", mainGameMenu);
			break;
		// Wake Her Up (Man)
		case "man wake her up":
			output("You set to work on the most obvious and enticing targets in front of you. Ramis stirs, her pointed ears flattening when you slide one of her small nipples between your [pc.lips], gently sucking and nibbling on it; her snoring turns into a pleased, murmuring groan when your fingers find her other breast, kneading and rubbing its nub. Her grip on you tightens, and a hot, heavy hip wraps itself around your [pc.legOrLegs].");
			output("\n\n<i>“Well now,”</i> she says, opening foggy eyes at last and looking down at you. <i>“What d’we have here?”</i>");
			output("\n\n<i>“Morning room service,”</i> you smile back, drifting your hand down her rippled abdomen towards her delta.");
			output("\n\n<i>“How nice. If only I could get boy toys on tap in every place I stayed... there. Right there...”</i> She closes her eyes and cranes her neck as you curl your fingers into her sticky twat, her juices running more and more freely to the movements of their probing tips.");
			output("\n\nA few seconds later you’re on your back, hands clutched around two full, tawny buttocks, watching 120 kilograms of blonde bombshell ride your [pc.cock " + x + "] with stern, athletic shoves of her hips. The fact you are mired in the produce of last night doesn’t matter even slightly when the fucking is this supple, this tight, this spry... your throaty groan twines with her exhilarated gasps as she clamps her thighs around your waist even more intently, clutching your straining cock up in sleek pressure and begins to pump you hard, her large breasts jouncing in front of your eyes.");
			
			pc.cockChange();
			
			output("\n\nHer claws biting into your shoulders, you grasp her brawny shoulders and cum, ecstasy grabbing at your muscles and nerves and yanking at them again and again as the [pc.cumColor] seed is practically vacuumed out of you by the formidable clamp of bulging kaithrit muscle locked around your [pc.hips]. Ramis moans and meows wordless elation at the ceiling, her pussy rippling around you as she continues to ride you as if you were a frothing stallion.");
			output("\n\nYou lie and enjoy the afterburn together again for a little while, you giving her the old manly cuddle that you’ve learnt makes her purr. Stepping back into the room after taking a long shower, you notice that the bed has a large depression in the middle. Sinking to the floor confirms that you have, in fact, broken three or four of the reinforced splints. Ramis guffaws when she comes in from her own shower and takes in your shared handiwork.");
			output("\n\n<i>“Better bounce before they decide to charge us,”</i> she says. She gives you a fond, lusty squeeze on the [pc.butt]. <i>“Be around, alright mate? I can use a fuck like you on this y’ear station. Nothin’ but girlies and girly boys for decks ‘n decks...”</i> You watch her two, dappled tails snake out of the door.");
			
			//Reset lust
			//Time forward 2 hours, put PC in front of Anon’s Bar
			processTime(90 + rand(60));
			pc.orgasm();
			pc.shower();
			currentLocation = rooms["ANON'S BAR AND BOARD"].westExit;
			
			addButton(0, "Next", mainGameMenu);
			break;
		// Failsafe
		default:
			output("Nothing happened!");
			addButton(0, "Next", mainGameMenu);
			break;
	}
}


