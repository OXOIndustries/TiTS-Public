public function geneHeader(nude:Boolean = false):void
{
	//showName("GENE’S\nMODS");
	showName("\nGENE");
	if(!nude) showBust("GENE");
	else showBust("GENE_NUDE");
	author("Nonesuch");
}

public function isGeneSubmissionDisabled():Boolean
{
	return flags["GENE_SUBMISSION_LEVEL"] == -1;
}

public function isGeneSubmissionLevelMaxed():Boolean
{
	return flags["GENE_SUBMISSION_LEVEL"] >= 10;
}

public function pcIsMyrOrNyrea():Boolean
{
	if (pc.race().toLowerCase().indexOf("myr") != -1) return true;
	if (pc.race().toLowerCase().indexOf("nyrea") != -1) return true;
	return false;
}

public function geneSubmissionLevel(addVal:Number = 0):int
{
	if (flags["GENE_SUBMISSION_LEVEL"] == undefined) flags["GENE_SUBMISSION_LEVEL"] = 0;

	if (isGeneSubmissionDisabled()) return -1;
	
	if (addVal > 0) flags["GENE_SUBMISSION_DATE"] = days;
	
	flags["GENE_SUBMISSION_LEVEL"] += addVal;

	if (flags["GENE_SUBMISSION_LEVEL"] < 0) flags["GENE_SUBMISSION_LEVEL"] = 0;
	if (flags["GENE_SUBMISSION_LEVEL"] > 10) flags["GENE_SUBMISSION_LEVEL"] = 10;

	return Math.floor(flags["GENE_SUBMISSION_LEVEL"]);
}
// I also think it would be a good idea for his dominance to decay passively if the PC spends enough time away from him. Thinking:
// 0-9 Dominance: 1 point down every 30 hours
// 10 Dominance: 1 point down after 60 hours
public function geneSubmissionLevelDecay(totalDays:uint):void
{
	if(isGeneSubmissionDisabled() || pc.isSubby()) return;
	
	var decayDelay:int = (!isGeneSubmissionLevelMaxed() ? 1 : 3);
	if(flags["GENE_SUBMISSION_DATE"] != undefined && ((days - flags["GENE_SUBMISSION_DATE"]) < decayDelay)) return;
	
	geneSubmissionLevel(-(totalDays));
}

public function geneLustIncrease():void
{
	if (geneSubmissionLevel() < 3) return;
	if (geneSubmissionLevel() < 7) pc.lust(2);
	if (geneSubmissionLevel() >= 7) pc.lust(5);
}

public function genesModsExteriorRoomDecorator():void
{
	if (flags["GENES_MODS_ENTERED"] == undefined)
	{
		output("\n\nTo the west is a square, white plasti-flex autossembler, a type of self-constructing building that are common on recently colonized worlds. Its severe, glossy walls look ludicrously incongruous nestled amongst the pseudo-classical architecture of Gildenmere. Above the cavernous semicircular entrance are lit the words “Gene’s Mods”.");
	}
	else
	{
		output("\n\nTo the west are the jarringly modern white curves of Gene’s Mods. The entrance to the shop, as ever, yawns open a welcome to you.");
	}
}

public function genesModsInteriorBonus():Boolean
{
	if(flags["GENES_MODS_ENTERED"] != undefined) output("You find yourself back in Gene’s airy, sandy-colored room, decorated with stands showing off various types of gene-mods, both modern and antique. The walls are covered with old poster and shifting-image advertisements for mods; to your eyes they look quaint, but you’d guess to myr eyes they would be the exact opposite. Other, more esoteric trinkets and objects hang from the ceiling and crowd the corners. Despite the clutter the place is hangar-sized, and everything is very widely spaced.");
	genesModsInterior();
	return true;
}

public function geneCockVolume():Number
{
	return 82;
}

public function genesModsInterior():void
{
	showBust("GENE");
	author("Nonesuch");

	if (flags["GENES_MODS_ENTERED"] == undefined)
	{
		flags["GENES_MODS_ENTERED"] = 1;
		output("Stepping up the ramp into the shop, you find yourself in an airy, sandy-colored room, decorated with stands showing off various types of gene-mods, both modern and antique.");
		output("\n\nThe walls are covered with old poster and shifting-image advertisements for mods; to your eyes they look quaint, but you’d guess to myr eyes they would be the exact opposite. Other, more esoteric trinkets and objects hang from the ceiling and crowd the corners. Despite the clutter the place is hangar-sized, and everything is very widely spaced.");
		if(flags["LANDED_ON_TEXAS"] != undefined) output(" You are reminded immediately of the size of things on New Texas.");
		output(" That, combined with the color, gives the place the feeling of a town hall, or museum.");

		output("\n\n<i>“And what do we have here?”</i> inquires a rumbling, liquid voice from the back of the room. <i>“A new customer, I warrant.”</i> It takes a moment for your eyes to adjust to what you’re looking at, and it is with a slight fright you realize that what you assumed from your peripheral vision was the whole back wall of the shop is, in fact, the shopkeeper.");

		output("\n\nThe burgundy colored creature regards you with a relaxed, knowing grin on his broad, straight-nosed face, the claws to his vast, bat-like wings balanced on each end of his counter. And the counter must be, what, nine yards long? The rolling mass of his upper body combined with his slighter torso and legs makes him loom like nothing else; it’s like being in the same room as a gigantic hawk whose attention is solely on you. In the middle of the counter another pair of arms, gleaming metal and white synthetics attached to his midriff by a harness, are folded, incongruously neat and business-like in a vast hollow of bulging, red flesh. They brace themselves on the glass and his wing claws clack down onto the metal floor as he turns, his yellow, raptor eyes still on you as he allows you to see his whole curving profile, his two serpentine tails flicking into view. You take a small step back; it’s difficult not to be awed at seeing a beast of this size in motion, particularly after spending time around so many petite ant girls. From tip to tail he must be at least forty feet long. No wonder everything in here is widely spaced.");

		if (pc.race().toLowerCase().indexOf("myr") != -1 || pc.race().toLowerCase().indexOf("nyrea") != -1)
		{
			output("\n\n<i>“Don’t be afraid, petal of Myrellion,”</i> he purrs, his heavy, full voice reverberating through you as he sinuously stalks out on all fours from behind his counter. Despite his approach, you do suddenly feel rather more relaxed. Even when he props his claws up on two glass cabinets to tower over you. His synthetic arms gesticulate with his words gracefully. <i>“Everyone’s first encounter with an alien is always an overwhelming experience, is it not? Everything is so different, nothing in your nature or nurture prepares you for such a thing. But you came in here because you have a need, or a curiosity, to be different. To step outside the strictures of body your culture say you must accept. So ask, of Gene the very different, what it is you need.”</i> He touches his upper lip with a long, purple tongue as he considers you. <i>“Because it may be I have exactly that.”</i>");
		}
		else
		{
			output("\n\n<i>“Hmm,”</i> he purrs ruminatively, his heavy, full voice reverberating through you as he sinuously stalks out on all fours from behind his counter. He props his claws up on two glass cabinets to");
			if (pc.tallness < 120) output(" tower over");
			else output(" look you in the eye");
			output(" and consider you more closely. His synthetic arms gesticulate with his words gracefully. <i>“An offworlder, curious enough to explore a frontier threatened with annihilation, curious enough to wander into another offworlder’s shop,");
			if (CodexManager.entryUnlocked("Fanfir")) output(" yet is spooked by a fanfir?");
			else output(" yet has never encountered a fanfir before?");
			output(" Curious.”</i> He laughs at his own joke, making the surrounding cabinets shake. <i>“Don’t worry, I do not bite. Not customers, as a rule. I sell gene mods, many different types, many of which are not available elsewhere. Ask, fellow stranger in a strange land, and you may receive. And relax.”</i> This last word is drawn out as a low, whispery susurration. You do suddenly feel rather more relaxed.");
		}
		
		CodexManager.unlockEntry("Fanfir");
		
		processTime(3);
	}
	else
	{
		CodexManager.unlockEntry("Fanfir");
		
		if (geneSubmissionLevel() >= 0 && geneSubmissionLevel() <= 2)
		{
			if(flags["GENE_TALKED_TO"] != undefined) output("\n\n<i>“Captain Steele!”</i> Gene grins hugely when you step back into his airy shop. <i>“To what do I owe this rare pleasure?”</i>");
			else output("\n\n<i>“Welcome back!”</i> the fanfir man grins hugely when you step back into his airy shop. <i>“What can I do for you?”</i>");
		}
		else if (geneSubmissionLevel() >= 3 && geneSubmissionLevel() <= 6)
		{
			geneLustIncrease();

			output("\n\n<i>“Captain Steele.”</i> Gene draws the syllables out in a low, pleased tone, making them vibrate in your bones. <i>“To what do I owe this rare pleasure?”</i>");
			if (pc.lust() <= 33 || (pc.vaginas.length == 0 && pc.cocks.length == 0)) output(" The day suddenly feels a lot warmer, your thoughts turning inward to your body’s pulsing needs as you step inwards.");
			else
			{
				output(" The frustrations and need you’ve been feeling steadily building over the last few hours step suddenly forward, your pulse quickening as");
				if (pc.cocks.length > 0)
				{
					output(" [pc.eachCock] thicken");
					if (pc.cocks.length == 1) output("s");
					output(" up");
				}
				if (pc.cocks.length > 0 && pc.vaginas.length > 0) output(" and");
				if (pc.vaginas.length > 0)
				{
					output(" [pc.eachVagina] moisten");
					if (pc.vaginas.length == 1) output("s itself");
					else output(" themselves");
				}
				output(", pleading with you to find release.");
			}
			if (pc.lust() == pc.lustMax()) output(" You shake your head and try and concentrate.");
		}
		else if (geneSubmissionLevel() >= 7 && geneSubmissionLevel() <= 10)
		{
			geneLustIncrease();

			output("\n\n<i>“Captain Steele.”</i> Gene eyes you knowingly as he draws the low, pleased syllables out, making them send shivers down your spine. <i>“To what do I owe this rare pleasure?”</i>");
			if (pc.lust() < 33 || (pc.vaginas.length == 0 && pc.cocks.length == 0))
			{
				output(" The day immediately feels a lot warmer, and you welcome it, basking in the heat sinking down to your [pc.groin]. One minute you’re any old person going about their business in Gildenmere; the next you’re a sensuous being, relaxed and ready to immerse yourself in pleasure.");
			}
			else
			{
				output(" You bite your lip and gasp slightly as lust overtakes you, the background of your needs becoming the blaring foreground as");
				if (pc.cocks.length > 0)
				{
					output(" [pc.eachCock] throb");
					if (pc.cocks.length == 1) output("s");
					output(" into tetchy erection");
				}
				if (pc.cocks.length > 0 && pc.vaginas.length > 0) output(" and");
				if (pc.vaginas.length > 0)
				{
					output(" [pc.eachVagina] become");
					if (pc.vaginas.length == 1) output("s");
					output(" tender and wet");
				}
				output(", begging for release.");
			}
			if (pc.lust() == pc.lustMax()) output(" You smirk lazily back at the fanfir and think about what it is you want.");
		}

		if (pc.lust() == pc.lustMax() && !pc.hasStatusEffect("Just Sexed Gene"))
		{
			output("\n\n<i>“But trifling talk and business can wait, can’t they.”</i> The massive creature strides out from behind his counter, and you do not resist him as, smile widening, he envelopes you in his cool, granite smell and powerful, looming frame.");
			// Goto sex
			clearMenu();
			addButton(0,"Next",genesModsGoSex,true);
			return;
		}
	}
	genesModsMenu();
}

public function genesModsMenu(cFunc:Function = null):void
{
	clearMenu();
	
	if (cFunc != genesModsBuyStuff) addButton(0, "Buy", genesModsBuyStuff);
	else addDisabledButton(0, "Buy");

	if (cFunc != geneTalk) addButton(1, "Talk", geneTalk);
	else addDisabledButton(1, "Talk");

	if (flags["GENE_TALKED_TO"] != undefined && (pc.hasVagina() || pc.hasCock()))
	{
		addButton(2, "Sex", genesModsGoSex, false);
	}
	else
	{
		if (!pc.hasVagina() && !pc.hasCock()) addDisabledButton(2, "Sex", "Sex", "You think you’re going to need something for Gene to be interested in you. Something cock or pussy shaped, for instance.");
	}

	if (flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_STARTED && flags["FAZIAN_QUEST_GENE"] == undefined)
	{
		addButton(3, "Fazian", fazianQuestGene, undefined, "Fazian", "Perhaps the fanfir knows something about the missing anat.");
	}

	if (cFunc != geneAppearance) addButton(10, "Appearance", geneAppearance);
	else addDisabledButton(10, "Appearance");

	addButton(14, "Leave", leaveGenesMods);
}
public function leaveGenesMods():void
{
	pc.removeStatusEffect("Just Sexed Gene");
	move(rooms[currentLocation].eastExit);
}

public function genesModsGenericScene(cFunc:Function = null):void
{
	clearOutput();
	geneHeader();

	output("You’re standing in the airy, quaintly decorated shop floor of Gene’s Mods. The proprietor is propped up on the counter, gazing at you with his hawkish yellow eyes, waiting languidly.");

	genesModsMenu(cFunc);
}

public function genesModsBuyStuff():void
{
	clearOutput();
	geneHeader();

	if (flags["GENE_SEEN_BUYMENU"] == undefined)
	{
		flags["GENE_SEEN_BUYMENU"] = 1;

		gene.keeperBuy = "You say you’d like to see what he’s got to sell.\n\n<i>“Right this way!”</i> he grandly sweeps back to his counter and directs you to a touch screen fastened to it. To your sensitivities it again looks rather antique and blocky.";
		if (pcIsMyrOrNyrea() && flags["GENE_TALKED_TO"] == undefined) gene.keeperBuy += " <i>“Do not be over-awed by such technology, small one,”</i> the shopkeeper suggests. <i>“Once you’ve gotten over your initial fright of it, it becomes a gateway to everything you could ever dream of.”</i>";
	}
	else
	{
		gene.keeperBuy = "Gene lazily spins a talon in the direction of the touch-screen.";
	}
	gene.keeperBuy += "\n";
	gene.keeperGreeting = "RUH ROH! SOMETHING WENT WRONG.";
	if(flags["ZODEE_GALOQUEST"] != undefined)
	{
		if(flags["PURCHASED_GENES_GALO"] == undefined)
		{
			if(!chars["GENE"].hasItemByClass(GaloMax)) chars["GENE"].inventory.push(new GaloMax());
		}
		else chars["GENE"].destroyItemByClass(GaloMax, -1);
	}
	if(flags["GENE_UNLOCK_CERESPIRIN"] != undefined)
	{
		if(!chars["GENE"].hasItemByClass(Cerespirin)) chars["GENE"].inventory.push(new Cerespirin());
	}
	else chars["GENE"].destroyItemByClass(Cerespirin, -1);
	if(CodexManager.entryUnlocked("Muffstick"))
	{
		if(!chars["GENE"].hasItemByClass(Muffstick)) chars["GENE"].inventory.push(new Muffstick());
	}
	else chars["GENE"].destroyItemByClass(Muffstick, -1);
	shopkeep = chars["GENE"];
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	buyItem();
	//[Show inventory]
}

public function geneAppearance():void
{
	clearOutput();
	geneHeader();

	output("Gene is big. Like, really big. From the top of his head to the tip of one of his thin, bulbous-tipped twin tails, the maroon colored wyvern-shaped sentient reaches at least forty feet long. Most of that you can’t see when he is behind his counter, ivory wing-claws clutching the surface and looming over it; however the fans of those bat-like wings, folded away though they might be, are always evident. Fully unfurled his wing span must be more than ten yards. His skin is fairly smooth, closer to hairless mammalian than scaly reptilian, however he does not have nipples. He dresses in the remnants of an old space suit, carapace and tough, tight-fitting fabrics around the joints, bare on the arms. At a guess it’s from the 24th century. Quaint to your eyes, but you’d imagine breathtakingly futuristic to any native.");
	
	output("\n\nFacially Gene looks human enough - albeit a very large human, with horn plating his lips and chin. He has full, broad, straight nosed, shaven features that would not look out of place in some classical Persian epic. It would have to be one with a lot of jokes in it, because he never seems far from breaking out into a big, toothy grin, behind which a long, purple tongue is always waiting to wag. He has a mane of brown hair and yellow, hawkish eyes. Adder-like black squares pattern his heavily corded neck and shoulders.");
	
	output("\n\nIncongruous to his bestial, fleshy frame are his gray, synthetic, four fingered arms, connected to him via a harness around his lower torso. These are usually folded primly on the counter, and obviously allow the fanfir to do manual tasks he’d otherwise struggle with. He moves and gestures with them as easily as if they were his own.");
	
	output("\n\nHis carapace bottoms have a suggestively large codpiece.");
	if (flags["GENE_FUCKED"] == undefined) output(" You’d guess, from the size of the rest of him, he packs pretty heavily.");
	else output(" You know by now he has one sixteen inch fanfir cock, hot, ribbed and incredibly girthy, one six inch human cock, as simple and unassuming as you could imagine save for the burgundy color, and four dense, melon-sized balls.");
	output(" Behind his firm, muscular backside his two lizard-like tails swish restlessly, the two bulbous tips occasionally making a <i>“blat”</i> sound as they hit a surface.");
	processTime(3);
	genesModsMenu(geneAppearance);
}

public function geneTalk(cFunc:Function = null):void
{
	if (flags["GENE_TALKED_TO"] == undefined)
	{
		clearOutput();
		geneHeader();

		flags["GENE_TALKED_TO"] = 1;

		output("<i>“So your name is Gene?”</i>");
		
		output("\n\n<i>“That name will suffice, yes.”</i> His hawkish eyes narrow as he considers you closer.");
		if (pcIsMyrOrNyrea()) output(" <i>“But you aren’t a native at all, are you? The way you speak, the way you hold yourself... yeeesss, I see it now. An offworlder so entranced by the insect people [pc.heShe] used Xenogen’s magic to become one, and now is impatient to see how else [pc.heShe] might splice [pc.himHer]self here!”</i> he bellows an exasperated laugh at the ceiling. A slight amount of dust comes down and you take a nervous step back. <i>“Oh, what a crashing fool I have made of myself! And I call myself a modder! You must forgive me...?”</i> You tell him. <i>“Forgive this fanfir’s arrogant presumption then, [pc.name] Steele.”</i> He lowers his head with theatrical humbleness. <i>“I only hope I can be of some small use to you, as Gildenmere’s premier supplier of finest transformatives, to make up for it.”</i>");
		else output(" <i>“And if I may inquire...?”</i> You tell him. <i>“[pc.name] Steele.”</i> He draws the <i>“s”</i> and <i>“e”</i> out with obvious enjoyment. You are put in mind of a sword being drawn. <i>“Very space adventure-y. I shall remember it.”</i>");
		output(" He carefully extends the vast canopy of his wings to indicate the store.");

		output("\n\n<i>“I travel the frontier in my self-assembled market, my damnable joy, offering specialist gene mods to the agog masses of the freshly discovered, before the mega-corporations get their talons into them. The transitive life suits, for every life-bearing planet that is visited, opportunities to collect new DNA arise, for new mutations to be teased into existence, to be compounded and distributed to a public ever hungry for change.”</i>");
		
		output("\n\n<i>“You make gene mods yourself?”</i>");
		
		output("\n\n<i>“Oh goodness me no,”</i> Gene chuckles. <i>“I am an itinerant dilettante, not a chemist! But you would not believe just how richly some companies will reward you for providing them with freshly discovered alien DNA. Particularly if, say, those aliens may not exist in a week’s time. Or if they are living in the shadow of a much larger company.”</i> He stretches his shoulders, glancing idly around his hangar bay-sized shop. <i>“I will admit I have grown fond of Myrellion, though. I have lingered here longer than I usually do. The place has... how shall I put this.");
		if (pc.isMasculine())
		{
			output("”</i> He grins");
			if (pc.tallness < 120) output(" down");
			output(" at you toothily. <i>“I’m sure I don’t have to spell it out to you, do I? If someone as thrusting and dashing as you has not gone to sleep every night he’s been here on a bed of content, beautiful ant women, why, I don’t know what to think.”</i>");
		}
		else
		{
			output(" Certain enjoyable elements for one such as I?”</i> He grins");
			if (pc.tallness < 120) output(" down");
			output(" at you toothily. <i>“But however many ant women you feast upon, you never lose the passion for more. Not when so many interesting people keep walking through your front door.”</i>");
			
			geneSubmissionLevel(1);
		}
		processTime(3);

		genesModsTalkMenu();
		return;
	}
	else
	{
		genesModsTalkMenu();
	}
}

public function genesModsTalkMenu(cFunc:Function = null):void
{
	clearMenu();
	
	if (cFunc != genesModsTalkShop) addButton(0, "Shop", genesModsTalkShop);
	else addDisabledButton(0, "Shop");

	if (cFunc != genesModsTalkOtherAliens) addButton(1, "Other Aliens", genesModsTalkOtherAliens);
	else addDisabledButton(1, "Other Aliens");

	if (cFunc != genesModsTalkMods) addButton(2, "Mods", genesModsTalkMods);
	else addDisabledButton(2, "Mods");

	if (cFunc != genesModsTalkYou) addButton(3, "You", genesModsTalkYou);
	else addDisabledButton(3, "You");

	if (cFunc != genesModsTalkMyr) addButton(4, "Myr", genesModsTalkMyr);
	else addDisabledButton(4, "Myr");
	
	// Gene Chat
	// Appears after PC has used "Me" and "Myr" talk options
	if(flags["GENES_MODS_TALK_YOU"] != undefined && flags["GENES_MODS_TALK_MYR"] != undefined)
	{
		if (cFunc != genesModsChat) addButton(5, "Chat", genesModsChat, 0, "Chat", "Ask if there’s anything below the counter the unprincipled fanfir might be willing to sell.");
		else addDisabledButton(5, "Chat");
	}

	addButton(14, "Back", genesModsMenu);
}

public function genesModsTalkShop():void
{
	clearOutput();
	geneHeader();

	flags["GENES_MODS_TALK_SHOP"] = 1;
	output("<i>“This place, then.</i>”</i> You wave your hand at the curved roof of the shop. <i>“Did you just ride in and set it up one day or what?”</i>");

	output("\n\n<i>“Well, I sought permission first.”</i> Gene harrumphs as he turns and click-thud-clack-thumps his way around the oak-coloured space, tails flicking, continuing to talk as he slides fastidious cybernetic fingers over cases and posters. <i>“Discretely. After the kui-tan gave me permission to land and trade here, I approached a couple of gold myr civil servants about room in Gildenmere where I might safely build. It turned out there was quite a lot of that - vacant lots do have a tendency to spring up during the prosecution of lost wars. And they were quite happy, desperate even, to get fresh commerce in, particularly from the stars. Of course, I did not tell them about the nature of autossemblers. Nor that I was going to activate it during rush hour.”</i>");
	output("\n\nHe suddenly whips around to you, balancing himself on two creaking cabinets again, beaming down like a giant red lighthouse.");
	output("\n\n<i>“Imagine it,”</i> he insists. <i>“Put yourself in the shoes of your average gold myr. Worn and fraught by conflict, you and your people have been given a stay of execution by the arrival of extraterrestrial beings. Who are they, these mysterious, benevolent beings, what do they want, where, how...? And then, one morning.”</i> He lowers his voice to a ominous hush, his cyber arms opening to the sky. <i>“You are walking down the street to your place of work when a piece of technology of unknowable, wondrous design unfurls itself like a ceramic flower where a part of your shattered city once stood. In mere minutes, with impossible grace and speed, it unfolds piece by piece into a shining white building the likes of which you have never seen. Then - after the clouds have dissipated, and one or two more minutes have dragged by - ”</i> One metal arm points to a corner. If you’re not very much mistaken, a dry ice machine is standing over there. <i>“I emerge on the roof.”</i> He unfolds his massive bat wings to their full extent, eyes fixed on the middle distance.");

	output("\n\n<i>“People of Gildenmere!”</i> he roars, full-throated, making the room shake. You suddenly feel thrilled in a diffuse, indefinable way and perhaps, just for a moment, you are that gold myr, standing frozen in the street in awe. <i>“For too long you have struggled under the yoke of war that is not your path. I come in peace, and to you I bring the fruits of a peace beyond your world that has lasted centuries beyond reckoning. Those brave enough to taste of them can become anything they wish - may break away from the cruel bonds of nature. The only limit is your imagination, o young people of art, thought and liberty. Become what you wish to be. Become the future!”</i> He trumpets the last word like a cavalry charge, and then settles himself down to gaze at you smugly.");
	output("\n\n<i>“I have not wanted for customers. I also understand every other off-worlder has been something of a disappointment, at least to those who were there that morning.”</i>");
	processTime(5);
	/* OLD:
	output("<i>“This place, then.”</i> You wave your hand at the curved roof of the shop. <i>“Did you just land it here one day or what?”</i>");
	
	output("\n\n<i>“Well, I sought permission first.”</i> Gene harrumphs as he turns and click-thud-clack-thumps his way around the oak-colored space, tails flicking, continuing to talk as he slides fastidious cybernetic fingers over cases and posters. <i>“Discretely. After the kui-tan gave me permission to land and trade here, I approached a couple of gold myr civil servants about room in Gildenmere where I might safely set myself up. It turned out there was quite a lot of that - vacant lots do have a tendency to spring up during the prosecution of lost wars. And they were quite happy, desperate even, to get fresh commerce in, particularly from the stars. Of course, I did not tell them I was actually going to land here. That I had researched the tunnels, found one big yet secluded enough for me to glide down here on low power during the night cycle, perch up high in the caverns.”</i>”</i> He suddenly whips around to you, balancing himself on two creaking cabinets again, beaming down like a giant red lighthouse.");
	
	output("\n\n<i>“Imagine it,”</i> he insists. <i>“Put yourself in the shoes of your average gold myr. Worn and fraught by conflict, you and your people have been given a stay of execution by the arrival of extraterrestrial beings. Who are they, these mysterious, benevolent beings, what do they want, where, how...? And then, one morning.”</i> He lowers his voice to a ominous hush, his cyber arms opening to the sky. <i>“You are walking down the street to your place of work when a spaceship appears above you, a piece of technology of unknowable, wondrous design, and with impossible grace and speed, it sits itself down where once a part of your shattered city stood. You are transfixed, unaware of the crowd you are part of - your people, the precious free few, are reduced to objects in the way of the sight. Then - after the clouds have dissipated, and minutes have dragged by - <i>“ One metal arm points to a corner. If you’re not very much mistaken, a dry ice machine is standing over there. <i>“The doors slide open, and I emerge.”</i> He unfolds his massive bat wings to their full extent, eyes fixed on the middle distance.");
	
	output("\n\n<i>“People of Gildenmere!”</i> he roars, full-throated, making the room shake. You suddenly feel thrilled in a diffuse, indefinable way and perhaps, just for a moment, you are that gold myr, standing frozen in the street in awe. <i>“For too long you have struggled under the yoke of war that is not your path. I come in peace, and to you I bring the fruits of a peace beyond your world that has lasted centuries beyond reckoning. Those brave enough to taste of them can become anything they wish - may break away from the cruel bonds of nature. The only limit is your imagination, o young people of art, thought and liberty. Become what you wish to be. Become the future!”</i> He trumpets the last word like a cavalry charge, and then settles himself down to gaze at you smugly. <i>“I have not wanted for customers. I also understand every other off-worlder has been something of a disappointment, at least to those who were there that morning.”</i>");
	*/
	geneSubmissionLevel(1);
	geneLustIncrease();

	genesModsTalkMenu(genesModsTalkShop);
}

public function genesModsTalkMods():void
{
	clearOutput();
	geneHeader();

	flags["GENES_MODS_TALK_MODS"] = 1;

	output("<i>“Have you used any gene modifications on yourself, then?”</i> you ask.");
	
	output("\n\n<i>“One or two things,”</i> replies Gene. He thumps down from the counter and prowls around his shop like a looming shadow, allowing you to see the entirety of his curving frame as he talks. <i>“I am not one of those specimens who got into modding because the form they were born with disgusts or frightens them, poor dears. But little flourishes and curlicues of biology, designed and carefully administered to amplify the joys of life and love... yes, those I do enjoy.”</i>");
	
	output("\n\nHe whips his two thin, serpentine tails around, narrowly avoiding knocking over a stand, considering them proudly. You notice that each has got a fleshy bulb at the end. <i>“Naturally fanfir tails are wiry, unwieldy and finely haired. To aid with the business of flying, you know. With these I have much more control, sensitivity and can do, oh, all sorts of things. Plus they are simply a lot more fun to swing around.”</i>");
	
	output("\n\nHe holds your eye and allows his great, long, purple tongue to droop out, wriggling it sensually. <i>“A cutting edge transformative,”</i> the fanfir says, after he’s retracted it. <i>“Isolated from pygmy natives of a wretched-sounding planet discovered in this very rush. Deeply enjoyable and - right feeling. I must say it feels like my people should have been equipped with such tongues all along. And then, of course...”</i>");
	
	output("\n\nHe leans backwards and waves a robotic hand at the generously sized cod-piece of his outfit. <i>“Many are the native girls who like the look of a male fanfir’s genitalia, but few and far between are they that are willing to put them anywhere near their own. Quite understandable. So I invested in another, more modestly sized one.”</i> He rocks back onto the balls of his feet. <i>“I have always enjoyed the look of human sexual organs. No unnecessary adornments, no silly little bells and whistles - elegantly and concisely designed. A phallus, bold, blunt and ready. Next to my natural endowment, outrageous to most sensitivities, it is an excellent juxtaposition. Exactly how gene-mods should be used.”</i>");
	processTime(4);
	clearMenu();
	addButton(0, "Next", genesModsTalkModsII);
}

public function genesModsTalkModsII():void
{
	clearOutput();
	geneHeader();

	output("<i>“Your arms, though.”</i> you point at Gene’s two gray, synthetic arms, shadowed under his bulk. <i>“Why haven’t you simply grown a pair?”</i>");
	
	output("\n\n<i>“An incisive enquiry,”</i> rejoins the fanfir, stepping closer to let the hot liquid of his voice fill your ears. <i>“Why indeed would a mutationist, who relies upon being able to palpably demonstrate his prowess, rely upon robotics? There are two reasons, [pc.short] Steele. The first, and this concern most fanfir share, is that a second pair of limbs rather impinges one’s ability to fly. In order for us to fly outside of our own world, you see, we need a second, anti-gravity harness. Whilst this synthetic aid may be easily shucked off and replaced with the other, a permanent set of arms places undue strain on it, and simply makes the business of flying clumsier besides. So the question is: do you sacrifice the occasional fleeting wonder that can be found in the air of alien worlds, the inexpressible delight of flight, for eternal manual dexterity?”</i> He spreads his wings like a giant fan and bellows the answer at you. <i>“No, no and NO!”</i>");
	
	output("\n\n<i>“What’s the other reason?”</i> you inquire as levelly as you can.");
	
	output("\n\n<i>“Well, that one is much more simple,”</i> Gene says, closing his wings and again stepping closer to you. There’s a clean metal sound and suddenly the synthetic harness unclasps, his arms falling to the ground. <i>“I am a vain creature, it cannot be denied. And I have never encountered a second pair of arms that I felt would genuinely improve how I look. I mean, look.”</i> The top half of his bulky outfit falls to the ground as well, and the fanfir swells his immense, red chest in front of you. <i>“Really consider,”</i> he insists, a grin of total confidence somewhere far above. <i>“Would you really have a pair of spindly little arms sprouting out of this the entire time? Would you really ruin such a vista?”</i>");
	processTime(3);
	if (geneSubmissionLevel() < 10)
	{
		clearMenu();
		addButton(0, "Look Closely", genesModsTalkModsLookClosely);
		addButton(1, "Step Back", genesModsTalkModsStepBack);
	}
	else
	{
		output("\n\nHe made a demand of you, and this close to the fanfir there’s no denying him. You stare gladly up at his vast, tight bulk, simmering in the power and raw sexuality you can almost feel radiating off of him, stoking the heat in your [pc.groin].");

		genesModsTalkModsCombine();

		geneLustIncrease();
	}
}

public function genesModsTalkModsLookClosely():void
{
	clearOutput();
	geneHeader();

	output("You do as he says and admire the huge wine glass shape that is the fanfir’s nipple-less chest, all suggestions and understated plateaus of tectonic muscle under vast amounts of bulk.");
	if (pc.IQ() >= 60) output(" You do notice a strange fleck of lighter red, almost pink, on his lower left belly, just below the rib cage. You wonder, given how top heavy he is, if Gene’s even aware of it.");
	else output(" It’s difficult to deny how impressive he is in a bestial, masculine way.");
	processTime(1);
	genesModsTalkModsCombine();
}

public function genesModsTalkModsStepBack():void
{
	clearOutput();
	geneHeader();

	output("You smirk and avert your eyes.");
	
	output("\n\n<i>“Very impressive, I’m sure,”</i> you murmur.");

	genesModsTalkModsCombine();
}

public function genesModsTalkModsCombine():void
{
	if (isGeneSubmissionDisabled())
	{
		clearMenu();
		addButton(0, "Next", genesModsTalkMenu, genesModsTalkMods);
		return;
	}

	if (pc.isFeminine() && pc.lust() >= 33)
	{
		output("\n\nAn ivory claw lands upon your shoulder");
		if (pc.isChestGarbed()) output(", sliding beneath your [pc.upperGarment]");
		output(". Gene’s eyes glare down at you, hawkish and lit with lust.");
		
		output("\n\n<i>“After putting on such a display,”</i> he husks, <i>“I think perhaps it’s time you showed me what you are made of, hmm?”</i>");

		//[Yes] [No] [Back Off!]
		clearMenu();
		addButton(0, "Yes", genesModsTalkModsYes);

		if (pc.lust() < pc.lustMax()) addButton(1, "No", genesModsTalkModsNo, genesModsTalkMods);
		else addDisabledButton(1, "No");

		if (flags["GENE_TALK_MODS_NO"] != undefined) addButton(2, "Back Off!", genesModsTalkBackOff, genesModsTalkMods);
		else addDisabledButton(2, "Back Off!");
	}
	else
	{
		clearMenu();
		addButton(0, "Next", genesModsTalkMenu, genesModsTalkMods);
		return;
	}
}

public function genesModsTalkModsYes():void
{
	geneSubmissionLevel(1);
	// - goto sex
	genesModsGoSex(true);
}

public function genesModsTalkModsNo(nFunc:Function = null):void
{
	flags["GENE_TALK_MODS_NO"] = 1;
	
	clearOutput();
	geneHeader();

	output("You shrug the fanfir’s claw off and politely tell him not right now.");
	
	output("\n\n<i>“As you wish, Steele,”</i> replies Gene, giving you one last hungry, convivial look before turning back to his voluminous armor. <i>“For now.”</i>");
	processTime(1);
	geneSubmissionLevel(1);

	genesModsTalkMenu(nFunc);
}

public function genesModsTalkBackOff(nFunc:Function = null):void
{
	clearOutput();
	geneHeader();

	output("You shrug the fanfir’s claw off irritably.");
	
	output("\n\n<i>“It’s strange, I’m pretty certain I told you not to do that once,”</i> you say. <i>“And here I am telling you again. Next time you aren’t getting that paw of yours back.");
	if (pc.IQ() >= 50 && CodexManager.entryViewed("Fanfir")) output(" And don’t think I don’t know what you’re trying to pull with that treacly voice of yours either.");
	output(" So knock it off, alright?”</i>");
	
	output("\n\nGene looks stunned by this - and then, momentarily, thunderously angry. Finally though, he takes several steps back and groans theatrical despair at the ceiling.");
	
	output("\n\n<i>“Thrown back by the enchantress herself!”</i> he cries. <i>“I have overplayed and over-reached, and paid the most terrible of prices for it!”</i> He bows his head humbly to you, mournful pebbles raining out of his throat. <i>“Your wish is my command, o aptly named Steele. No longer shall I pursue you, for no longer can I claim the right. Forever more I will gaze lovelorn at you from a distance, and pour my sorrow into composing paeans to your wondrous, wintry beauty.”</i> He trudges back behind his counter in the manner of some great, crestfallen hound.");

	//Submission set to 0, no longer rises
	flags["GENE_SUBMISSION_LEVEL"] = -1;
	processTime(2);
	genesModsTalkMenu(nFunc);
}

public function genesModsTalkOtherAliens():void
{
	clearOutput();
	geneHeader();

	flags["GENES_MODS_TALK_ALIENS"] = 1;

	output("<i>“What do you make of the other off-worlders who have fetched up here?”</i> you ask. Gene considers you with eyes of yellow stone for a long moment.");
	
	output("\n\n<i>“You are talking about her, aren’t you,”</i> he growls. His voice is a bitter, lovelorn, simmering broth. <i>“Not enough that that towering temptress, that unapproachable siren, that spark-eyed jade must remain forever out of my reach, others must come here and taunt me with the knowledge of her existence and closeness. Oh!”</i> He rears up and groans a dirge which sounds like the death of a people, made comical by the still, prissy fold of his arms. <i>“She has eyes like exploding stars, and it is fitting because she is the destruction of light in my life. To be on a planet of eager, willing women and to have");
	if (isGeneSubmissionDisabled()) output(" you and");
	output(" her amongst their midst: it is to be presented with a banquet, with the most delectable, beautiful confection");
	if (isGeneSubmissionDisabled()) output("s");
	output(" there locked in a cage.”</i>");

	if (flags["MET_XANTHE"] != undefined)
	{
		output("\n\n<i>“If you want to get with Xanthe that badly, you could just submit to her,”</i> you suggest.");
		
		output("\n\n<i>“Exactly,”</i> replies Gene mournfully. <i>“Completely unattainable. I have suggested, and... presented gifts, and... debated with her, and... no. Unmovable, a mountain catching the sun in the distance. But I will have her eventually,”</i> he insists with sudden steel, turning his face to yours as if you’d suggested otherwise. <i>“It is simply a case of gaining enough experience, enough perspective upon aliens and their ways, observe her finesse with her own toys enough, to woo her into appreciating the fullness of the existence she would lead as the possessed, rather than possessor. I have learnt patience, as painful as it is. Some day, that mountain shall be climbed.”</i>");
	}
	else
	{
		output("\n\n<i>“I have no idea who you’re talking about,”</i> you say. Gene stares at you as if you’d just denied existence of the sun.");
		
		output("\n\n<i>“Xanthe,”</i> he says, drawing out the syllables. <i>“That is her name - although undoubtedly an alias in reference to something as surely as mine is, she of all people will know the power of names. She is a siel, a wondrous and utterly infuriating folk I was happily unaware of until she arrived here not a month ago.”</i> He shakes his head mournfully at your ignorance, reveling in his own misery. <i>“Go find her shop, here in this very city. Approach and talk to her, bask in her presence. Then, perhaps, you shall understand a small part of my pain.”</i>");
	}
	processTime(5);
	geneSubmissionLevel(1);

	genesModsTalkMenu(genesModsTalkOtherAliens);
}

public function genesModsTalkYou():void
{
	clearOutput();
	geneHeader();

	flags["GENES_MODS_TALK_YOU"] = 1;
	CodexManager.unlockEntry("Anatae");

	output("<i>“Do you know who I am?”</i> you ask.");

	if (isGeneSubmissionDisabled())
	{
		output("\n\nGene looks at you with an air of deep suffering.");
		
		output("\n\n<i>“Certainly,”</i> he replies, stoic dignity stiffening his words. <i>“You are the "+pc.mf("king", "queen")+" of distant, frozen, unimpeachable beauty, who demonstrates [pc.hisHer] cruelty by regularly taunting me with [pc.hisHer] presence. Why?”</i>");
		
		output("\n\n<i>“I mean,”</i> you say, trying not to grin, <i>“Does the name ‘Steele’ mean anything to you?”</i>");
	}
	else if (isGeneSubmissionLevelMaxed())
	{
		output("\n\n<i>“Certainly,”</i> replies Gene in a low purr, considering you fondly. <i>“You’re the prize of my collection of fuck-toys, a beautifully crafted cock-scabbard, a many-faceted jewel of a thirsty cum slut. Why?”</i> Your [pc.nipples]");
		if (pc.hasFuckableNipples()) output(" puff");
		else output(" harden");
		output(" up almost painfully to his words.");
	
		output("\n\n<i>“I mean,”</i> after you’ve taken a deep breath, <i>“Does the name ‘Steele’ mean anything to you?”</i>");
	}
	else
	{
		output("\n\nGene frowns.");
		
		output("\n\n<i>“" + StringUtil.capitalize(indefiniteArticle(pc.race())) + ", if I’m not mistaken. I’ve got some things that could help with that.”</i> He gestures politely at his computerized list of mods.");
		
		output("\n\n<i>“I mean,”</i> you say, trying not to grin, <i>“Does the name ‘Steele’ mean anything to you?”</i>");
	}

	output("\n\nThe fanfir shrugs mountainously.");
	
	output("\n\n<i>“No. Should it? It sounds almost certainly of human origin. Going by that and the tone of your query, I assume you or a close relation are a human celebrity of some sort? Then I am afraid that even if I had heard of you, it would probably not have been in a favourable light. I, along with most fanfir, hail from the Anatae Empire, part of the U.G.C. only in name. The feathered folk take a rather dim view of human culture’s embodiments of avarice and self-worship, I’m afraid. So even if I were the sort of person to pay attention to alien celebrities - as likely, perhaps, as you knowing any fanfirs of note - the media I’d have absorbed would probably have painted you or whoever you’re related to as some sneering arch-cutthroat of cataclysmic inequity. But do go on,”</i> he leers at you. <i>“Your tone of disbelief has piqued my interest. Who are you then, dear Steele?”</i>");

	output("\n\nFeeling galvanized to defend your name, you describe the accomplishments of your father, and the quest he gave you.");

	if (isGeneSubmissionLevelMaxed())
	{
		output("\n\n<i>“So let me see if I understand this,”</i> Gene says once you’re done. <i>“You, my toy, a person who has spent entirely too long giving their ears");
		if (flags["GENE_FUCKED"] >= 3) output(" and body");
		output(" to a fanfir, are the heir to a spectacular fortune. What happens,”</i> he goes on contemplatively, tapping the horn of his lips with clasped, synthetic hands, deep words coiling and vibrating through your skull, <i>“if I command you to sign it over to me?”</i> The danger of the situation occurs to you as if you’d careened over a hill and been confronted with a rapidly approaching ravine. For a moment your heart is in your mouth; you honestly don’t know if you could deny those hot, honeyed words if they formed that demand. Gene shakes his head with a smile.");
		
		output("\n\n<i>“Relax.”</i> You sag. <i>“Do you think your master is that much of a sociopath? Honestly. Also, I rather suspect your father employed a lawyer or two who might raise their eyebrows somewhat if a fanfir swans up to Steele HQ, contract in hand. It’s enough,”</i> he growls, sending heat shooting through your [pc.groin], <i>“to know one of my treasures is of spectacular import, one that a whole people may know of, tantalizing not just in physical form but in cultural weight.”</i> He grins at you lazily. <i>“You run around the frontier, little one: increase your value, let many others see you, and forever burn with the knowledge of who truly owns you. I do so enjoy the way a prominently displayed case increases the value of the jewel within.”</i>");
	}
	else
	{
		output("\n\nGene looks mildly impressed by the time you’re done.");
		
		output("\n\n<i>“A man of the self for sure, but he forced his chosen heir to chase after their inheritance as a callow encore to his own exploits? Denying them the chance to find and follow their own journey so that they might suffer as he did, ensuring his legacy by molding you via experience into the self-same person? Brutal. Theatrical. Cunning. Rather fanfir-ish, in fact. Yes, I believe I would have liked your father.”</i>");

		geneSubmissionLevel(1);
	}
	processTime(4);

	genesModsTalkMenu(genesModsTalkYou);
}

public function genesModsTalkMyr():void
{
	clearOutput();
	geneHeader();

	flags["GENES_MODS_TALK_MYR"] = 1;

	output("<i>“What do you think of the myr?”</i>");
	
	output("\n\n<i>“The variety I have chosen to house myself amongst, you mean?”</i> Claws slide and clatter as Gene dismounts from the counter and pads from behind it, gazing at his display cases ruminatively. <i>“Intelligent. Sensitive. Desperate. Made exquisitely beautiful by the precipice their culture is teetered upon. Had your Xenogen friends not intervened when they did, this city and the ideals it embodies would not exist, you know. They would have been subsumed by the Reds, lucky perhaps to survive as a despised slave caste. As is, they are akin to an enclosure of pandas, staring dolefully out at the red sea of venomous, vengeful, highly-evolved snakes surrounding them. It’s wonderfully perverse, don’t you think, that corporate greed has been bent to protect something precious and fragile?”</i>");
	
	output("\n\n<i>“Bit hypocritical, given you’re here trying to sell them mods,”</i> you suggest. Gene harrumphs in affected indignation.");
	
	output("\n\n<i>“Is it such a bad thing to sell dreams to a people that may not even be here next week? Gold myr culture emphasizes individuality, whilst their physicality mandates that only a tiny handful truly can be individuals. How is that for high tragedy?”</i> He circles the shop floor, fingers and tails sliding lovingly over his cases and posters. <i>“This shop is designed with them in mind, you know - as is this ridiculous outfit I’m wearing.”</i> A synthetic hand plucks at the blocky space suit carapace. <i>“To their eyes, these displays are breathtakingly futuristic - more right-looking, perversely, than up-to-date styles. To your eyes though, they are charmingly quaint. It works both ways, you see.”</i> It’s all an act, you can see that - an extension of the fanfir himself, prowling and gesturing theatrically the way he does. Because he’s so invested in it though, and the way raw power occasionally seizes his words and form, it is kind of captivating.");

	output("\n\n<i>“Even if the mods I sell them don’t work, the experience I provide, the belief of a better world and the sense of belonging and specialness if they give themselves entirely to me, THAT is priceless.”</i>");
	
	clearMenu();
	addButton(0, "Next", genesModsTalkMyrII);
}
	
public function genesModsTalkMyrII():void
{
	clearOutput();
	geneHeader();
	
	output("<i>“What do you mean, if the mods don’t work?”</i> Gene turns and pads slowly towards you in a predatory stance, huge wings slicing into the air, tails lashing.");
	
	output("\n\n<i>“Why do you think there aren’t a hundred other gene-mod companies already here, merrily undercutting me?”</i> he replies in the soft, deadly rumble of slowly shifting granite. <i>“Aside from the possible inconvenience of nuclear annihilation, I mean. Nothing currently produced has been tested on myr physiology. I am all but certain, given their obvious similarities to other bipedal, warm-blooded races, that they will work; but no, not certain.”</i> He rears up to his full height in front of you, the deep brass of his voice quaking through you. <i>“This is the frontier, Steele. It is filled with danger, rogues and disrepute, and if you want to grasp the golden opportunities it offers, you must also take chances. There is no triumph if there was no possibility of terrible failure.”</i>");
	processTime(6);
	if (isGeneSubmissionDisabled())
	{
		genesModsTalkMenu(genesModsTalkMyr);
		return;
	}

	if (pc.isFeminine() && pc.lust() >= 33)
	{
		output("\n\nHe gazes");
		if (pc.tallness < 120) output(" down");
		output(" at you, wild lust filling his yellow eyes. <i>“I make no apologies for who I am - anymore than I shall make one for wanting every inch of you, right here and right now.”</i> An ivory claw lands upon your shoulder");
		if (pc.isChestGarbed()) output(", sliding beneath your [pc.upperGarment]");
		output(".");

		// [Yes] [No] [Back Off!]
		clearMenu();
		addButton(0, "Yes", genesModsTalkModsYes);

		if (pc.lust() < pc.lustMax()) addButton(1, "No", genesModsTalkModsNo, genesModsTalkMyr);
		else addDisabledButton(1, "No");

		if (flags["GENE_TALK_MODS_NO"] != undefined) addButton(2, "Back Off!", genesModsTalkBackOff, genesModsTalkMyr);
		else addDisabledButton(2, "Back Off!");

	}
	else
	{
		geneSubmissionLevel(1);
		genesModsTalkMenu(genesModsTalkMyr);
	}
}

public function genesModsChat(pageNum:int = 0):void
{
	clearOutput();
	geneHeader();
	switch(pageNum)
	{
		case 0:
			output("<i>“So what you’re doing here is not particularly legal,”</i> you muse. You look Gene straight in the yellow eye. <i>“Is there anything not particularly legal that isn’t on the main menu, strictly speaking?”</i>");

			output("\n\n<i>“Mmm. Possibly,”</i> replies the fanfir, drawing out his words in a low rumble. <i>“When you are a famously open-minded mod entrepreneur of distinction, you are sometimes approached by independent chemists who wish to amaze the galaxy and make small fortunes with their cutting edge creations, without going through the suffocating, expensive rigmarole of officially testing them first. Gene-mod giants such as Xenogen will usually quickly create their own version in response and vigorously undercut you if you go through the proper channels, after all. Most of the DNA-attacking gloop that lands on my metaphorical doorstep is worthless, dangerous or both. Occasionally something interesting arrives, though...”</i>");
			
			output("\n\n<i>“Which is?”</i> you cajole.");
			
			output("\n\n<i>“Let us say, purely for the sake of argument, that there is a small group of modders operating independently on this very planet,”</i> harrumphs Gene, gesticulating tersely with his synth arms. <i>“Aiming to take advantage of Xenogen’s current fixation with the gold myr to experiment with one of Myrellion’s, ahem, less celebrated species. Splicing plant DNA with animal is a notoriously difficult art, so to find a specimen that ACTIVELY SEEKS OUT such a union is of great interest to modders. They believe that, using the DNA of Hydrus Constuprula, they have created a plant TF of awesome strength and viability; able to facilitate all manner of floral metamorphoses in a subject. Not only that: I don’t think they’re lying.”</i>");
			
			CodexManager.unlockEntry("Cockvines");
			
			output("\n\n<i>“What’s the catch?”</i> you ask.");
			
			output("\n\n<i>“Perhaps you missed the part where I said this stuff is manufactured from cockvine?!”</i> bellows Gene, banging his wing claws on the counter in exasperation. <i>“Plant transformations are DIFFICULT Steele, difficult in a way animal-feature-to-animal-feature is not; you are forcing your flesh to become something intrinsically different, not something up or down or sideways upon your own evolutionary ladder. Pity the electric impulse that has to explain to a blood vessel the concept of chlorophyll! They are commensurately more powerful, and usually carry side effects as a result. I don’t care if the things I sell have no effect; I do care if they cause a buyer to suddenly take root, or drop dead because they didn’t get enough sunlight that day. That is the kind of thing that might necessitate one to leave a planet in an unprofitable hurry.”</i>");
			
			// [pb]
			clearMenu();
			addButton(0, "Next", genesModsChat, 1);
			break;
		case 1:
			output("<i>“Now,”</i> he goes on in a quieter tone, <i>“as you have already explained to me, you have a state-of-the-art suite of nanobots coursing through your veins, which means you are likely to be spared such excessively tragic developments and are a perfect test subject to boot. So I am willing to sell this Cerespirin creation to you, on the UNDERSTANDING that you will stay quiet about where you found it, and that it may cause florally-related side effects in you nonetheless.”</i> He grins at you hugely. <i>“Assuming you can afford it, of course. Such exclusive and precariously sourced mods carry a large mark-up, obviously.”</i>");
			
			output("\n\nObviously.");
			// Intelligence 50%:
			if(pc.IQ() >= 50) output(" <b>But maybe there’s someone else out there who’d be happy to mass-synthesize this plant TF, if you brought them a sample of it...</b>");
			
			// Cerespirin added to Gene’s purchase menu
			flags["GENE_UNLOCK_CERESPIRIN"] = 1;
			
			genesModsTalkMenu(genesModsChat);
			break;
	}
}

public function genesModsGoSex(isAuto:Boolean = false):void
{
	clearOutput();
	geneHeader();

	if (!isAuto)
	{
		if (isGeneSubmissionLevelMaxed())
		{
			output("<i>“Let’s do it,”</i> you say woozily. The words come unadulterated and unguarded from the pure fountain of lust your mind currently is. <i>“Keep doing it and never stop.”</i>");
		}
		else if (pc.isTreated() || pc.isBimbo())
		{
			output("<i>“You know, you, um, talk a whole lot,”</i> you giggle, eyes running up and down his massive, masculine frame. <i>“But all I can think about is that big, frustrated cock");
			if (flags["GENE_FUCKED"] != undefined) output(" of yours");
			else output(" you must have");
			output(".”</i> You lick your [pc.lips]. <i>“Why don’t we cut to the chase?”</i>");
		}
		else if (pc.isNice() || pc.isMischievous())
		{
			output("<i>“Got time between jawing off and doing myr to spend a bit of time with me?”</i> you inquire with a smile.");
		}
		else if (pc.isAss())
		{
			output("<i>“You talk and act big,”</i> you say. You raise an eyebrow and a corner of your mouth at him. <i>“Think you can back it up in the bedroom?”</i>");
		}

		if (pc.mfn("m", "f", "n") == "m")
		{
			output("\n\n<i>“How forthright!”</i> leers Gene. <i>“Very well, [pc.name]. It’s not often I get to sample more rugged pleasures whilst I’m here, after all.”</i> He raises himself up so you can clearly see the suggestively large bulge in his carapace outfit’s lower carriage, below the leonine mass of his upper body");
			if (!pc.isNude()) output(", and watches as you discard your [pc.gear]");
			output(". <i>“What exactly,”</i> he says in a low, predatory growl, <i>“did you have in mind?”</i>");
		}
		else
		{
			output("\n\n<i>“How forthright!”</i> leers Gene. <i>“I usually expect to work a little harder than that, you know.”</i> He raises himself up from the counter and lumbers around to you, prowling and leonine, peeling his antique carapace outfit off as he comes.");
			if (!pc.isNude()) output(" You follow suit, your [pc.gear] flopping to the floor of the shop so that when he stands over you, massive, semi-erect reptile cock and smaller human dick clear to see, you’re quite naked.");
			if (pc.tallness < 103)
			{
				if (geneSubmissionLevel() < 8) output(" You try not to gasp or become tense when he grasps you firmly around the shoulders with his wing claws and carefully raises you up, considering you in the hungry glare of his yellow eyes.");
				else output(" You are anticipating this and a thrill leaps through your belly when he grasps you firmly around the shoulders with his wing claws and carefully raises you up, considering you in the hungry glare of his yellow eyes.");
				output(" He lowers his head, enabling his long tongue to slide out and lick your bare, dangling front, starting at your [pc.groin] and undulating up to your [pc.chest], allowing you to feel the full extent of that long, warm, slightly rough organ. Your [pc.nipples]");
				if (!pc.hasFuckableNipples()) output(" erect");
				else output(" moisten themselves eagerly");
				if (pc.hasCock())
				{
					if (pc.hasVagina()) output(", ");
					else output(" and");
					output(" your [pc.cocks] thicken"); 
				}
				if (pc.hasVagina())
				{
					output(" and your [pc.vaginas] widen and slick with [pc.girlCum]");
				}
				output(" in response to the hot, wet, dragging pressure.");
			}

			output("\n\n<i>“Now,”</i> he growls, raising his eyes to yours. <i>“What exactly am I going to do with you?”</i>");
			
			output("\n\nYou were wondering that yourself.");
		}
	}
	else
	{
		if (!pc.isNude())
		{
			output("Gene watches, savouring every moment as you slowly strip, giving him the occasional sexy wiggle and smile until you are quite bare, [pc.nipples] becoming");
			if (!pc.hasFuckableNipples()) output(" harder");
			else output(" puffier");
			output(" in the cool, charged air.");
		}
		if (pc.tallness < 103)
		{
			if (geneSubmissionLevel() < 8) output(" You try not to gasp or become tense when he grasps you firmly around the shoulders with his wing claws and carefully raises you up, considering you in the hungry glare of his yellow eyes.");
			else output(" You are anticipating this and a thrill leaps through your belly when he grasps you firmly around the shoulders with his wing claws and carefully raises you up, considering you in the hungry glare of his yellow eyes.");
			output(" He lowers his head, allows his long tongue to slide out and licks your bare, dangling front, starting at your [pc.groin] and undulating up to your [pc.chest], allowing you to feel the full extent of that long, warm, slightly rough organ, making your [pc.nipples]");
			if (!pc.hasFuckableNipples()) output(" erect");
			else output(" moisten themselves eagerly");
			if (pc.hasCock())
			{
				if (pc.hasVagina()) output(", ");
				else output(" and");
				output(" your [pc.cocks] thicken"); 
			}
			if (pc.hasVagina())
			{
				output(" and your [pc.vaginas] widen and slick with [pc.girlCum]");
			}
			output(" in response to the hot, wet, dragging pressure.");
		}

		output("\n\n<i>“Now,”</i> he growls, raising his eyes to yours. <i>“What exactly am I going to do with you?”</i>");
		
		output("\n\nYou were wondering that yourself.");
	}
	processTime(1);

	clearMenu();
	if(pc.hasVagina()) addButton(0, "OverCounter", genesModsOverCounter,undefined,"OverCounter","Get bent over the counter.");
	else addDisabledButton(0,"OverCounter","OverCounter","You don’t have a vagina to get plowed.");

	if (!pc.hasCock())
	{
		addDisabledButton(1, "Frot", "Frottage", "Rubbing dicks is fun. (Requires a penis)");
	}
	else if (pc.isTaur())
	{
		addDisabledButton(1, "Frot", "Frottage", "Rubbing dicks is fun. (Requires non-centaur bodytype)");
	}
	else
	{
		addButton(1, "Frot", genesModsFrot, undefined, "Frottage", "Rubbing dicks is fun.");
	}

	addButton(2, "Blowjob", genesModsBlowjob, undefined, "Blowjob", "Get your lips around some dragon dick.");
	addButton(3, "BellyRub", genesModsBellyrub, undefined, "Belly Rub", "Perhaps it’s possible to make him putty in your hands?");
}

public function genesModsBlowjob():void
{
	clearOutput();
	geneHeader(true);

	output("You’ve only got eyes for one thing, and by looking at it and licking your [pc.lips] suggestively, you tell Gene exactly what it is.");
	if (!pc.isTaur()) output(" Carefully he carries you back behind the counter and sits you down on the floor.");
	else output(" He backs up behind the counter and you follow him, managing to cram your own considerable frame beneath it.");

	if (!isGeneSubmissionLevelMaxed() || flags["GENE_BLOWJOB"] == undefined)
	{
		output("\n\n<i>“Sure about this?”</i> the fanfir murmurs, bracing himself on the glass surface with his wings and brandishing in your face his sixteen inch, ribbed dick, with its huge bulge two thirds of the way down. Below it his four melon-like testicles sway restlessly. Above it is his six inch human cock, almost clitoris-like in comparison to the fanfir’s natural endowment. <i>“I think it would be wiser if you... ”</i> he fades off in a rumbling sigh as you wrap as much of your hand around his big, hot knob as you can and begin to smooth your grip up and down it. You are firmly interested in the main course, not the snack.");
		
		output("\n\nYou shift your hand round and around his firm, arching meat, sampling the different textures of his ribbed undercarriage, his rough, slightly bumpy upper side and his sleek, spearhead tip, enjoying the rumbling, heavy breath you begin to draw out of his looming chest and the way it increasingly stands to attention under your ministrations. His slit beads transparent orange pre and the smell of musk, wild and overgrown, hangs densely in your nostrils. It makes you feel warm and relaxed, in contrast to the increasing tenseness you can see in Gene’s muscular thighs.");
		
		output("\n\n<i>“Go on... ”</i> he sighs, poking his burningly erect tower of a cock at your lips. You look up at him coyly, poke your [pc.tongue] out and then lick the end, tantalizing his most sensitive spot with swirls of your tongue, pausing when slightly sweet spice tingles across your taste-buds. Wow, is that natural? You don’t get a chance to savour it though, because next moment Gene, agitated by your teasing, shoves forward and opens your mouth with his girthy, pre-slicked cock-head.");
		output("\n\nAfter a moment of getting used to it you swiftly find a rhythm, moving your [pc.lips] and tongue over the hot, spicy meat, pumping the base with one hand, the other reaching further back to give his heavy quad a good fondle - and the occasional gentle squeeze, just to see him tense up again. After a few fervent, shallow thrusts he calms himself down and lets your head do the moving.");
		if (pc.isTreatedFemale())
		{
			output(" All of your instincts tell you that this is where you most belong -");
			if (pc.isBiped()) output(" on your knees");
			else output(" down");
			output(" in front of a big, dominant male polishing his cock, and that fact combined with the sensations bathing your lips, nose and tongue envelopes you in a deep, golden bliss");
			if(pc.hasVagina()) output(", your [pc.vagina] becoming wetter and wetter");
			else if(pc.hasCock()) output(", your [pc.cock] becoming harder and harder");
			output(".");
		}
		
		output("\n\n<i>“That is exceptional,”</i> he murmurs, the tremors of his rich voice traveling down his cock and then your spine. <i>“The myr aren’t anywhere near as good as you at this, Steele. Too much teeth... no practice, you see...”</i> You make him trail off into a heartfelt rumble with a well-timed squeeze of the testicle.");
		
		output("\n\nPerhaps in the end you are too good at it, because by the increasingly tetchy pumps of his hips, trying to force the massive bulge of his penis’s midsection past your lips, you can tell Gene quickly becomes frustrated with only his spear-head sampling the wet bliss of your mouth. Determinedly, you open your mouth as wide as you can and inch your [pc.lips] further and further up it with small, terse movements, intent on getting as much of that big, musky beast cock into your mouth as you can. You give a small, muffled whuff of triumph when the hulking bulge finally slides home, touching the top of your maw and trapping your [pc.tongue] firmly beneath it with hot, ribbed goodness.");
		
		output("\n\nThe fanfir hisses as you go back to sliding your lips and hand up and down him, the sound of a kettle nearing boiling point, his wing claws clutching the counter hard and his robot hands trailing through your [pc.hair]. With your mouth forced open wide it’s sloppier now, and the wet sounds of your devoted cocksucking, mixed with Gene’s pleased, rumbling groans fill the shop.");
		
		output("\n\n<i>“It’s coming,”</i> he grunts breathlessly. <i>“Would be foolish of you to try... swallow every last drop. However... know you’re a perfectionist.”</i> You look up at him coyly and begin to rub his bulge rapidly with your tongue, kneading the trunk briskly with your hand as you do. In response synthetic hands grip your head, Gene’s hackles rise, and suddenly he is fucking your mouth as hard as he can, holding your head with his synthetic hands and working his hips to use you like an ona-hole, balls swinging as the bulge slides up to your entrance and then savagely surges in deep again.");
		
		output("\n\nYou feel light-headed under this oral battering, but still manage to hollow your cheeks and suck hard one final time when he deliberately sinks into you as far as he can, his dilating cone head penetrating your throat. The first stream of cum goes directly into your stomach; it feels like someone turned a hose of hot soup on inside you. You quell your gag reflex by floating above it, enjoying the sensation of being filled with cum and the dizzying oxygen depletion, eventually becoming slightly disconcerted at just how much of it there is.");
		
		output("\n\nBecause Gene just keeps going. Still holding your head firmly, the vibrations of his contented groans traveling straight through you, he fills your gut until you feel absolutely stuffed with his seed, your [pc.belly] steadily more protuberant with it. At last he pulls out of your throat, allowing you a single ragged breath before blissfully ejaculating again, immediately filling your mouth and causing you to splutter and drool the orange goo down your chin and [pc.chest]. At least you can taste it, now... and the sweet spiciness of it, heavily interwoven with his musk, is really quite nice. You swallow three more hot, cheek-swelling loads that come out of the fanfir’s pumping cock like a champ, but that isn’t enough, when he finally pulls out, to stop him giving your face and [pc.chest] a final, heavy, vision-obscuring spraying. At least his ribbed bulge has noticeably decreased in size, meaning that though your jaw aches from your Herculean oral efforts, his drooling, bulbous dick does part from your lips with reasonable ease.");
		
		output("\n\n<i>“I don’t think I should let you go, [pc.short],”</i> growls Gene when he’s recovered his breath, sleepy eyed and practically purring with contentment. <i>“It is imperative that nobody else learns about those lips of yours but me. They could start wars.”</i> Saying this, he does stand back to let you back up. You cradle your full gut and flick cum out of your face, feeling well used but perversely pleased with yourself. A check of your reflector app tells you that you do currently look like you got hit by an explosion in an orange grove. Gene provides you with a myr-sized towel though - of which he seems to have a large number, in a compartment of his counter - and in due course you’re looking roughly normal. If carrying the heavy, round belly and the sticky spicy smell synonymous with a fanfir cocksucker.");

		geneSubmissionLevel(2);
		pc.loadInMouth(chars["GENE"]);
		// Cumflation
		if (pc.cumflationEnabled()) pc.maxOutCumflation("mouth", chars["GENE"]);
		pc.lust(33);
	}
	else
	{
		output("\n\nThe fanfir braces himself on the glass and slowly drags the blunt spearhead of his cock down your face, enveloping you in his masculine smell; humid overgrowth. You are glad he no longer offers the silly choice of which of his dicks to suck; it reduces the amount of time it takes to get here, salivating in wet anticipation, lips almost kissing the moist tip of his massive, arching bulge-cock. Still, arching well over you, your Master teases you with it first, gently brushing his massive beading dick over your cheeks and lips, enveloping your senses in his sharp, masculine smell until you are practically drunk with it,");
		if (pc.hasVagina()) output(" [pc.eachVagina] seeping with arousal");
		if (pc.hasVagina() && pc.hasCock()) output(" and");
		if (pc.hasCock()) output(" [pc.eachCock helplessly hard and pressed against your belly");
		output(".");
		
		output("\n\n<i>“Begin,”</i> orders Gene at last, and you do so immediately, as if the impulse arrived from your own will, grasping and tugging at the trunk-like base whilst dabbing at his gleaming, cone-like cockhead with your [pc.lips] and [pc.tongue] lovingly. <i>“It’s been altogether too long since I used that sweet mouth of yours. And if you do well... lick every inch... you can have every last drop.”</i>");
		
		output("\n\nThe thought sends a thrill sparking down your spine, the spicy, musky tang of his pre in your mouth and nose spurring you on to earn the proffered prize. After you’ve spent a short while suckling on the fanfir’s tip, sending your [pc.tongue] teasing across his cum-slit until he is granite hard, groaning softly in enjoyment, you travel inwards, dipping your head deep beneath the huge, winged beast so that no part of his gigantic cock goes unfavored by your wet, worshipful mouth.");
		
		output("\n\nAs before, he allows you the initiative at first, holding still whilst your head moves up and down. You savour the different textures that travel over your lapping tongue: the ribs across his massive bulge, the smoothness at the base, the sturdiness of his smaller prick as you wank it with slow rotations of your fist whilst continuing to lick his alpha cock. Whenever the faintest fatigue creeps into you Gene rumbles a sigh of deep satisfaction, quivering straight through to your [pc.groin], intensifying how");
		if (pc.hasVagina()) output(" wet");
		if (pc.hasVagina() && pc.hasCock()) output(" and");
		if (pc.hasCock()) output(" hard");
		output(" you feel. You feel an intense urge to shove a hand down there, alleviate how achingly turned on you are - but you cannot do so, because both your hands are needed, fondling and stroking your Master the very best you can.");

		output("\n\nThe very fact you are being denied by your own obedience only makes it hotter,");
		if (pc.hasVagina()) output(" the arousal so bad the [pc.girlCum] dribbles freely down your thighs");
		else output(" the arousal so bad pre seeps freely from your own needy [pc.cock]");
		output(". Whilst your hands continue to slide over the bulky, veined flesh of his cock, you channel that fierce heat into reaching in far to lick at his four, plump testicles, enveloping each within your mouth to give them the attention they deserve. It is all you can do not to moan when they clench up underneath your lips, preparing the load you so desperately wish to earn. Once they gleam with your saliva, you pull back and gaze up at the fanfir coquettishly.");
		
		output("\n\n<i>“Isn’t life pleasurable now you have found where you truly belong?”</i> he rumbles leisurely, the sugared waves of resonance flooding over and through you. <i>“");
		if (pc.hasKnees()) output("On your knees");
		else output(" Down in front of me");
		output(", sucking my balls and polishing my cock like a trained whore? Thank me for the privilege.”</i>");
		
		output("\n\n<i>“Thank you, sir,”</i> you say sincerely, gazing up at him. You lick your [pc.lips] and turn them into an <i>“o”</i> shape. <i>“Would you like to fuck my mouth now?”</i>");
		
		output("\n\n<i>“I think,”</i> he smiles down, arching his hips and positioning his rock-hard penis against your mouth, <i>“that is an excellent idea.”</i> He grunts as he penetrates you, pushing his spit-shone spearhead all the way in with a single flex of his thighs. You shudder at the bestial might overshadowing you, and then concentrate on keeping your face-cunt as tight and wet a suck as you can for the cock reaching further and further into it.");
		
		output("\n\nWith increasingly deep swivels of his hips, Gene sinks more and more of his hot, girthed dick past your lips. You have no problem taking the bulge now: indeed you thrill when it opens your mouth as wide as it can go, filling your mouth with ribbed, veined meat, a ceaseless, reminding thrust of the size of your Master and your own submission to him. Warm android hands grasp your head and hold you still as he penetrates your throat. His movements are steady and smooth, absolutely sure of your ability to swallow his cock - and you meet his confidence, easily quelling your gag reflex in order to let that cinnamon-oozing hardness spread and claim every inch of your gorge with slow, sensual pushes, each time reaching his dick all the way out so you can treasure the conical tip with your [pc.tongue].");
		
		output("\n\nIncrementally he picks up the pace, grunting as he pumps his supple thighs around your face until finally he’s thrusting in and out it with something like all his strength, holding your head still with his unremittingly powerful android arms, lost in the succulent suck you’re providing him. You close your eyes and tease your [pc.nipples] helplessly, entranced by the brutality of being used like this,");
		if (pc.hasVagina()) output(" [pc.eachVagina] trembling with more wet heat");
		if (pc.hasVagina() && pc.hasCock()) output(" and");
		if (pc.hasCock()) output(" [pc.eachCock] becoming more tightly engorged");
		output(" to each dominating thrust of Gene’s dick into your throat.");
		
		output("\n\nFinally, with a roaring groan, he pushes you as far up his sixteen inch cock as he can and unloads a fountain of hot cum straight into your stomach. The knowledge of the satisfaction you’ve given your Master is too much, and you tremble into orgasm yourself. You spasm around his pulsating cock, eyes rolling as");
		if (pc.hasVagina()) output(" [pc.eachVagina] clenches up and spurts [pc.girlCum]");
		if (pc.hasVagina() && pc.hasCock()) output(" and");
		if (pc.hasCock()) output(" [pc.eachCock] spattering [pc.cum] over the floor in slutty abandon");
		output(", fingers stroking and pinching your [pc.nipples] mercilessly all the while.");
		
		output("\n\n<i>“Did you really just... cum?”</i> gasps the winged monster currently almost balls-deep in your gullet. <i>“Honestly, how much of a...”</i> he forgets it and concentrates on jetting liters of spicy, tingling seed into your belly. Still holding your head firmly, the vibrations of his contented groans traveling straight through you, he fills your gut until you feel absolutely stuffed with it, your [pc.belly] steadily more protuberant. At last he pulls out of your throat, allowing you a single ragged breath before blissfully ejaculating again, immediately filling your mouth and causing you to splutter and drool the orange goo down your chin and [pc.chest]. At least you can taste it, now... and the sweet spiciness of it, heavily interwoven with his musk, is heavenly. You swallow three more hot, cheek-swelling loads that come out of the fanfir’s pumping cock like a champ, but that isn’t enough, when he finally pulls out, to stop him giving your face and [pc.chest] a final, heavy spraying. At least his ribbed bulge has noticeably decreased in size, meaning that though your jaw aches from your Herculean efforts, his drooling, bulbous dick does part from your lips with reasonable ease.");
		
		output("\n\nThe conical tip is reared up to your face, and you lick and suck it quite clean, happily accepting your reward. The massive load you just swallowed glows within your belly, your mouth tingles with the cinnamon-like musk of your Master, and your [pc.groin] gently throbs. You cannot imagine being more content. You practically purr when an android hand drops onto your [pc.hair] and rubs affectionately.");
		
		output("\n\n<i>“Wars were prevented when I made your mouth my own,”</i> rumbles Gene with intense satisfaction, curling a finger behind your ear. <i>“But I’m no hero. Those lips are their own reward.”</i>");

		pc.loadInMouth(chars["GENE"]);
		// Belly = moderately pregnant for next 3 hours

		// cumflate
		if (pc.cumflationEnabled()) pc.maxOutCumflation("mouth", chars["GENE"]);
		pc.lust(33);
		pc.orgasm();
	}
	processTime(29);
	IncrementFlag("GENE_BLOWJOB");
	IncrementFlag("GENE_FUCKED");
	pc.createStatusEffect("Just Sexed Gene");
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function genesModsFrot():void
{
	clearOutput();
	geneHeader(true);

	output("Holding Gene’s gaze, you apply saliva to your hand with long, slow drags of your [pc.tongue]. Once it is nice and coated, you encircle your [pc.cockBiggest] with and begin to pull and stroke, quickly drawing warmth and hardness into it. The fanfir watches, looking academically interested more than anything.");

	if (pc.biggestCockLength() > 15)
	{
		output("\n\n<i>“My goodness,”</i> he murmurs, once your erection has reached its full, totemic glory, bigger even than his. <i>“How the blazes do you cope with such an encumbrance in everyday life?”</i>");
		
		output("\n\n<i>“Intimidated?”</i> you shoot back with a cocky grin.");
		
		output("\n\n<i>“Challenged,”</i> the fanfir growls back, matching it.");
	}
	else if (pc.biggestCockLength() < 6)
	{
		output("\n\n<i>“You know,”</i> he murmurs, gazing down at your "+pc.mf("boy", "girl")+" cock, a cute button in comparison to the serpent-like monster of his you can see lolling beneath the counter, <i>“there are plenty of mods available that could enlarge you. Or am I barking up the wrong tree by suggesting that?”</i> his voice descends to a low, teasing simmer. <i>“Perhaps being hung like a winsome catamite is the whole point.”</i>");
	}
	else
	{
		output("\n\n<i>“Okay then,”</i> he says, sounding lightly amused. <i>“Are you going anywhere with that? Or is standing masturbating on my shop floor the long and short of it.”</i>");
	}

	output("\n\nIn response you grease up your other hand with saliva, boldly step behind his desk, duck underneath a wing and lay it on the red, bulging, spearheaded club that is the bigger of his two dicks. The shallow lines of muscle now surrounding you initially tense up, then relax as you briskly begin to jerk him, moving your grasp up and down the ribbed underbelly of his cock until it is arching upwards, an orange bead beginning to form on his inch-big cum-slit. Still grasping your own [pc.cockBiggest] you tug, working both wrists until the handfuls of trapped cock are hot and practically bursting with hardness underneath your touch. Hot now with exertion and tightening arousal, you press your prick into his, and wrap both hands around the bundle of hard, saliva-slicked masculine lust. Gently, you begin to rub, the ribbed underside of Gene’s massive endowment sending pulses of pleasure slivering down your own.");
	
	output("\n\n<i>“I see,”</i> the fanfir hisses, drawing the vowel sound out into a gratified exhalation. <i>“What a novel concept! Oof. Please do continue.”</i> He paws the ground as you pick up the pace slightly, bumping his protuberant chest against");
	if (pc.tallness < 112) output(" your face");
	else output(" your [pc.chest]");
	output(". Although the sensation of stuffed, slick dick sliding against each other is decent enough, the way that your big, winged partner is built makes it all rather awkward; you’re having to lean into his groin from the side to get at it. A ivory-clad claw bangs down on the counter behind you impatiently.");
	
	output("\n\n<i>“This is no good,”</i> he declares. <i>“The intent is well-placed, but we shan’t make the most of it unless - ”</i> His synthetic arms suddenly reach out and grasp you under the armpits. A small thrill of fright leaps up your belly as you are lifted bodily onto the counter, [pc.butt] pressed onto the glass. Braced by his wing claws, Gene’s huge frame rears over you, heat radiating off of it as, grinning");
	if (pc.tallness < 112) output(" down at you");
	else output(" into your face");
	output(" he begins to work his thighs, thrusting his bulge-cock into your [pc.cockBiggest] demandingly. <i>“Much better,”</i> he breathes.");
	
	output("\n\nHis bulging, rooster-like front molds into your [pc.chest] as the smooth rub of your two cocks intensifies tenfold, the fanfir pinning you down and using his strength to rut against you. You keep one hand wrapped around the thrusting cocks as best you can");
	if (pc.tallness < 64) output(" - almost impossible, given the trunk-like size of each"); // 9999 on dis shit
	output(". Gene gazes down at you with a certain goading look in his yellow eyes; evidently delighted with this new sensation, and delighted to have found a way to take it on his own terms, trapping you underneath his bulk and rubbing you silly.");

	if (geneSubmissionLevel() < 8 && flags["GENE_BELLYRUBS_ENABLED"] != undefined)
	{
		output("\n\nYou know exactly how to turn the tables, though. You stare right back up at him and, smirking, press your free hand onto a certain, pink spot on his underbelly. All the domineering confidence runs right out of Gene’s face.");

		output("\n\n<i>“Oh good grief,”</i> he gasps. <i>“Please... <i>“ whether he was going to beg you to do it or beg you not to, it disappears in a hoarse bellow when you press your fingers deep into his weak spot. He arches his back and thrusts himself into your hand and against your own bulging cock reactively, all of his brute strength now being moved and directed by the stroke of your teasing fingers on his soft belly. Your soft " + pc.mf("chuckles", "giggles") +" twine with his roaring moans as the savage, reactive thrusts of his ribbed cock against your [pc.cockBiggest] pushes tenseness deeper and deeper into you, building towards orgasm.");

		output("\n\nYou attack the pink spot with vigorous wags of your finger whilst continuing the mutual wank, and you are rewarded when Gene cums in a total delirium, clutching you with his synthetic arms, chest bumping into yours and claws clenching the surface so hard you can hear them leave grating marks, geysers of hot, orange cum exploding out of his engorged slit and pasting your [pc.chest] and face. You close your eyes and immerse yourself in the smell of spicy musk, the heartfelt groans of your partner, the bump and grind of his taut body, and reach it yourself - your [pc.thighs]");
		if (pc.balls > 0) output(" and [pc.balls]");
		output(" tensing up to surge [pc.cum] gleefully out of [pc.eachCock], mixing with Gene’s all over your upper body.");
		if (pc.cumQ() > 1000) output(" Your juicy cum spurts are every bit as voluble as his, and by the end a small waterfall of mixed musk is oozing through your [pc.hair] and forming a small lake on the shop floor below.");

		output("\n\nGene rests on top of you once you’re both done, his bulging chest heaving for breath against yours, oozing prick still tangled with yours. You wipe the slime out of your eyes and enjoy the gentle prickle of post-coitus and the heat radiating off of him.");
		
		output("\n\n<i>“You’re a demon of some sort, aren’t you?”</i> he groans, once he’s found his words again. <i>“Such a filthy mind. Such a destroying touch.”</i> You give him a well-aimed poke to get him off you, and to go fetch a towel.");
	}
	else if (geneSubmissionLevel() >= 8)
	{
		output("\n\nThe fact of his brute power and dominance over you sends shivers of delight coursing through your core, twining with the sensual delight of his big cock wanking you silly. He slows down momentarily, and you almost moan in frustration - until you feel a warm, blunt shape press against your [pc.vagOrAss]. Gene continues the frotting in the slower, sensual rhythm for a while whilst he teases your");
		if (pc.hasVagina()) output(" pussy");
		else output(" sensitive asshole");
		output(" with his tail, enjoying watching you squirm beneath him; then you gasp, clenching up hard as he ruthlessly pushes it in deep, swelling your");
		if (pc.hasVagina()) output(" wet girl tunnel");
		else output(" colon");
		output(" deep with its bulbous tip, picking up the pace of his slick, ribbed grinding against your [pc.cockBiggest] as he does.");
		
		output("\n\nYou moan and then scream your way to orgasm, bucking your [pc.hips] into his hard dick and tail, unable to control your [pc.cock] bulging up and then rocketing lines of [pc.cum] right up your body in a series of ecstatic clenches. Gene holds you down, his soft laughter reverberating in your ears as you lose your load over your [pc.chest] and face. Only when you’re finished, your cock oozing seed onto your [pc.belly] does he ratchet his own rhythm up. You groan and roll your eyes in softened, aching pleasure as his bulbous tail tip rams into your [pc.vagOrAss] whilst his trunk-like cock thrusts across your softened prick. You manage to keep your hand around both, and feel it thrum with pressure before it releases all over you, a second wave of hot, spicy orange seed pasting your [pc.chest], slathering over your face and drooling into your [pc.hair] as the monstrous avian uses the soft rub of your hand and groin to get his melon-sized rocks off.");

		output("\n\nGene rests on top of you once you’re both done, his bulging chest heaving for breath against yours, oozing prick still tangled with yours. You wipe the slime out of your eyes and enjoy the gentle prickle of post-coitus and the heat radiating off of him.");

		output("\n\n<i>“That’s one of the most enjoyable things about you,”</i> he murmurs, once he’s recovered his breath. <i>“I don’t have to come up with new ways of making you squeal. You do that for me.”</i> He laughs at the sight of you practically plastered to his counter once focus returns to his yellow eyes, and finally shifts himself off you, dick swinging, to fetch you a towel.");
	}
	else
	{
		output("\n\nYou lock eyes with the fanfir and thrust your [pc.cockBiggest] against the hot, oily piston of his cock, caught up in the lust rhythm, determined not to be outdone. He gasps and laughs slightly as you tighten your grip up ruthlessly around both your erections; after pausing for a moment, the muscles in his lithe thighs bulge and then he’s rutting into your hand and cock as hard as he can. Pinned down like this it’s hard to generate the same power as the beast looming over you but you do your best, bucking your thighs into the luscious rub, working your way up to orgasm.");
		
		output("\n\nGene cums soon after, clutching you with his synthetic arms, chest bumping into yours and claws grating the counter, geysers of hot, orange cum exploding out of his engorged slit and pasting your [pc.chest] and face. You close your eyes and immerse yourself in the smell of spicy musk, the heartfelt groans of your partner, the bump and grind of his taut body, and reach it yourself - your [pc.thighs]");
		if (pc.balls > 0) output(" and [pc.balls]");
		output(" tensing up to surge [pc.cum] gleefully out of [pc.eachCock], mixing with Gene’s all over your upper body.");
		if (pc.cumQ() > 1000) output(" Your juicy cum spurts are every bit as voluble as his, and by the end a small waterfall of mixed musk is oozing through your [pc.hair] and forming a small lake on the shop floor below.");
		
		output("\n\nGene rests on top of you once you’re both done, his bulging chest heaving for breath against yours, oozing prick still tangled with yours. You wipe the slime out of your eyes and enjoy the gentle prickle of post-coitus and the heat radiating off of him.");
		
		output("\n\n<i>“Very enjoyable,”</i> he says once his breath returns with a pleased nod, as if informing a waiter of the fineness of the meal he was just served. <i>“I do so enjoy finding a type of sex I haven’t experienced yet, don’t you?”</i> Your push in his chest indicates you’d rather he got off you and found you a towel rather than pontificate, which in fairness he duly does.");
	}
	processTime(27);
	pc.orgasm();
	IncrementFlag("GENE_FUCKED");
	pc.createStatusEffect("Just Sexed Gene");
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function genesModsBellyrub():void
{
	clearOutput();
	geneHeader();

	if (flags["GENE_BELLYRUBS_ENABLED"] == undefined)
	{
		output("<i>“Do you think I could rub your belly?”</i> you say, eyes on the blooming wine-glass shape of the fanfir’s chest. Gene stares at you.");
		
		output("\n\n<i>“I’m sorry,”</i> he grates. <i>“What?”</i>");
		
		output("\n\n<i>“It’s just something I want to try,”</i> you explain, as innocently as you can. <i>“I think there’s something I could do that you would really enjoy, if you let me give you a massage.”</i>");

		if (flags["GENE_BELLYRUBS"] == undefined)
		{
			output("\n\nAn expression of amused bafflement has spread across the proud, straight-nosed face");
			if (pc.tallness >= 112) output(" in front of");
			else output(" above");
			output(" you.");
			
			output("\n\n<i>“Some sort of alien erotic technique, I assume?”</i> he says. <i>“Our physiques are not the same, Steele, and I very much doubt you will do anything but tickle me.”</i> He laughs, then");
			if (pc.tallness < 112) output(" lowers you to the ground,");
			output(" unfastens his robot arms and rolls over onto one side, a landslide of red bulk. <i>“But do go on. I would be ashamed to say I wasn’t ready to experience something new.");
			if (pc.hasVagina() && pc.tallness < 112) output(" A word of warning, though...”</i> His eyes eat up your naked form. <i>“If whatever you think you’re going to do doesn’t work, I am going to return the favor. And I assure you: my massaging will be mercilessly effective.");
			output("”</i>");
		}
		else if (pc.hasVagina() && pc.tallness < 112 && geneSubmissionLevel() >= 8)
		{
			output("\n\nGene’s eyes glimmer.");
			
			output("\n\n<i>“I think we both know what you’re really asking for,”</i> he grins, his long, pliant tongue tracing his lower lip. <i>“So let’s just skip to that, hmm?”</i>");
			processTime(1);
			clearMenu();
			
			addButton(0, "Yes", genesModsLickedOut); // - Go to licked out
			
			if (pc.lust() < pc.lustMax()) addButton(1, "No", genesModsBellyrubNo);
			else addDisabledButton(1, "No");

			return;
		}
		else
		{
			output("\n\nGene sighs, a billow of exasperation.");
			
			output("\n\n<i>“This again? Why do we waste time with this when there are so many more amusing things I could be doing with a " + pc.mf("boyish", "pretty") + " tidbit like you?”</i> Still, he undoes his robot arms,");
			if (pc.tallness < 112) output(" lowers you to the floor and");
			output(" rolls over onto one side, a landslide of red bulk. His yellow eyes remain fixed on you.");
			if (pc.hasVagina() && pc.tallness < 112) output(" <i>“You know the penalty for tickling me though, Steele. I tickle back.”</i>");
			else output(" <i>“You’re lucky I have such a patient attitude towards alien foibles, Steele. Break a leg, you odd little "+pc.mf("fellow", "woman") + ".”</i>");
		}
		processTime(3);
		genesModsBellyrubFirst();
	}
	else
	{
		output("\n\n<i>“I think,”</i> you say with a knowing grin, <i>“somebody might want their belly rubbed again. What do you think?”</i> Gene rears back instinctively, like a massive dog who’s just heard the word ‘bath’. His expression is a taut mixture of apprehension and lust.");
		
		output("\n\n<i>“I- I’m fine in that particular department, thank you very much,”</i> he mutters. <i>“Are you - quite sure you wouldn’t like to - ?”</i>");
		
		output("\n\n<i>“You’re getting yourself all worked up again,”</i> you say smoothly, casually stepping beyond his wings and laying your hands on his warm chest. <i>“Just relax. You can’t enjoy being a good pet if you don’t relax and let me take charge, can you?”</i> Knowing exactly where it is now, you easily slip your touch down below his left ribs and finding that wonderful pink groove again. The fanfir’s proud, swelling breast heaves with a gale-like gasp as you begin to gently stroke and tease it, and the next moment there is a mighty thud as Gene lands on his back, completely abandoning himself to your fingers.");
		
		output("\n\n<i>“Damn everything to - fucking - calumny,”</i> he groans, legs stretching and kicking fitfully. <i>“Why does that have to be - so - bloody - good?”</i> The flop of his semi-erect human cock catches your attention, another sensitive secret of his hulking frame, and you begin to tease that with your other hand, quickly stroking it into a full, needy erection. The great beast groans and roars wordlessly at the ceiling, tails lashing, completely stupefied by the touch of your cunning fingers.");
		processTime(5);
		// [Release] [Deny]
		clearMenu();
		addButton(0, "Release", genesModsBellyrubRelease);
		addButton(1, "Deny", genesModsBellyrubDeny);
	}
}

public function genesModsBellyrubRelease():void
{
	clearOutput();
	geneHeader();

	output("<i>“Who’s a good boy?”</i> you say lowly. He doesn’t reply. You slow the hand around his human erection down and attack his chest spot assiduously, curling your fingers deep into the softness there. He arches his back and barks breathlessly, eyes closed.");
	
	output("\n\n<i>“Who’s a good boy?”</i> you insist.");
	
	output("\n\n<i>“Me! I’m a good boy, damn you to hell, I’m a good boy who’ll do anything... ”</i> he howls. You immediately up the pace, whipping your hand up and down his hot, trapped meat until, with a cataclysmic groan, it swells up and then spurts great flumes of orange cum several feet into the air. The fanfir gasps and flexes his hips helplessly as you milk him quite dry, forcing huge quantities of his spooge surging out of his dilated slit and onto his belly and floor, caressing his sensitive area all the while.");
	
	output("\n\nYou stand back, hot hands clasped in front of you when you’re done, and watch him slowly clamber to an upright position, his own seed dripping off him. He gazes at you cloudy-eyed and open-mouthed, still not quite believing you can do this to him.");
	
	output("\n\n<i>“That’s enough for today, I think,”</i> you say breezily. <i>“If you’re a really good boy, though... maybe we’ll do it again.”</i>");
	
	output("\n\n<i>“You,”</i> replies Gene, gathering back all his deep, declamatory delivery, <i>“are a terrible [pc.raceShort], and I rue the day you ever darkened my threshold.”</i> You think you detect a chord of complete fascination runs through his words; whatever the case, you give him a big unashamed grin in response.");
	processTime(3);
	pc.lust(10+rand(5));
	geneSubmissionLevel(-3);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function genesModsBellyrubDeny():void
{
	clearOutput();
	geneHeader();

	output("<i>“Who’s a good boy?”</i> you say lowly. He doesn’t reply. You slow the hand around his human erection down and attack his chest spot assiduously, curling your fingers deep into the softness there. He arches his back and barks breathlessly, eyes closed.");
	
	output("\n\n<i>“Who’s a good boy?”</i> you insist.");
	
	output("\n\n<i>“Me! I’m a good boy, damn you to hell, I’m a good boy who’ll do anything... <i>“ he howls. You very slowly pick up the pace, and when you judge that he’s on the very precipice - his whole, vast frame tightened with the anticipation of release - you suddenly withdraw.");
	
	output("\n\n<i>“That’s enough for today, I think,”</i> you say breezily. <i>“If you’re really good... and are extra polite... I’ll empty those big, frustrated balls of yours next time.?”</i> Gene stares at you, breast still heaving, his modest human cock hotly erect, palpably barely able to believe you.");
	
	output("\n\n<i>“You,”</i> he says eventually gathering back all his deep, declamatory delivery, <i>“are a terrible [pc.raceShort], and I rue the day you ever darkened my threshold.”</i> You think you detect a chord of complete fascination runs through his words, maybe even a thrill of submission; whatever the case, you give him a big unashamed grin in response.");

	geneSubmissionLevel(-3);
	processTime(2);
	pc.lust(10);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function genesModsBellyrubFirst():void
{
	output("\n\nYou slide beyond the webbed canvas of a wing and gaze at his torso, gently moving and rumbling with his breath like some great, idling engine. There is a lot there: you are probably only going to be able to massage one area.");

	clearMenu();
	addButton(0, "UpperLeft", genesModsBellyrubFirstNotTheSpot);
	addButton(1, "LowerLeft", genesModsBellyrubFirstThatsTheSpot);
	addButton(2, "Middle", genesModsBellyrubFirstNotTheSpot);
	addButton(3, "UpperRight", genesModsBellyrubFirstNotTheSpot);
	addButton(4, "LowerRight", genesModsBellyrubFirstNotTheSpot);
}

public function genesModsBellyrubFirstNotTheSpot():void
{
	clearOutput();
	geneHeader();

	output("You move in and lay your hands on his chest and belly where you’ve chosen and begin to slowly rub, molding the warm, heavy flesh under your hands as if it were stubborn clay, following the lines of muscle, trying to carefully work your fingers into him and loosen him up. It’s absorbing in its own way, and you’re just getting into it when Gene shifts and snorts with laughter, huge lungs vibrating under your touch.");

	output("\n\n<i>“Alright, that’s enough,”</i> he chuckles. <i>“You’re tickling me! I appreciate your attempt to introduce me to something new, dear Steele, but I’m afraid this does nothing for me.");
	processTime(1);
	if (pc.tallness < 112 || !pc.hasVagina())
	{
		output(" Desist, and we’ll do something we both know will be mutually satisfying instead.”</i> Disappointed, you step away, knowing you have no choice but to proffer a different form of fucking now.");

		clearMenu();
		addButton(0, "Blowjob", genesModsBlowjob);
		if (pc.hasCock() && !pc.isTaur()) addButton(1, "Frot", genesModsFrot);
		else addDisabledButton(1, "Frot");
		if (pc.hasVagina()) addButton(2, "OverCounter", genesModsOverCounter);
		else addDisabledButton(2, "OverCounter");
	}
	else
	{
		output("”</i> He suddenly rears up, tails swinging around to encircle you, eyes gleaming lustily down at you. <i>“Time,”</i> he husks, <i>“for you to pay the price of your presumption.”</i>");

		// - Go to licked out
		clearMenu();
		addButton(0, "Next", genesModsLickedOut);
	}
}

public function genesModsBellyrubFirstThatsTheSpot():void
{
	clearOutput();
	geneHeader();

	output("You move in and lay your hands on the lower left of his belly. There is not much to differentiate it from the rest of his vast front... except just below his ribcage, where there is a strip of lighter colored flesh, magenta to the scab red surrounding it, the size of your hand. You place your hand over and give it an experimental stroke.");
	
	output("\n\nThe effect is immediate. The complacent purr reverberating through Gene’s chest inflates into a startled, whooping gasp.");
	
	output("\n\n<i>“Oh my giddy aunt,”</i> he barks. <i>“What did you do just do? What - don’t... ”</i> Grinning, you attack the soft, pink patch ruthlessly, rubbing and scratching it bluntly as if it were a dog’s ear. A wing claw smashes down into the floor behind you, denting it, as Gene writhes uncontrollably, his massive body quaking to your simplest touch, unable to push you away without his arms. He tries to back himself up, legs pawing at the ground as he cringes away from you; you follow him, keeping your eye firmly on that streak of pink, and when you reapply your curling, teasing fingers he gives up.");
	
	output("\n\n<i>“Stars, void, fuck,”</i> he cries, craning his neck and bellowing full-throated abandon at the ceiling. All of the layers of self-possession and subliminal suggestion in his voice are gone - you’re listening to the real Gene, now. <i>“That is way too much! A drab, a weak spot, I never knew - stop, oh don’t stop, keep going, I beseech you!”</i> You grin, deeply enjoying putting this massive creature on his back, quaking and begging to the twitch of your fingers. His two mismatched dicks flop around, semi-erect and in easy reach - you could have even more fun here, if you chose to.");
	processTime(2);
	pc.lust(5);
	clearMenu();
	addButton(0, "Release", genesModsBellyrubFirstRelease);
	addButton(1, "End", genesModsBellyrubFirstEnd);
}

public function genesModsBellyrubFirstRelease():void
{
	clearOutput();
	geneHeader();

	output("You reach down and clasp his smaller human dick - surely the more sensitive of the two. It barely takes more than a few pumps of your wrist to make it burningly hard. Gene’s mouth is open, sweat forming on his broad brow, as you teasingly stroke both his weak spot and cock.");
	
	output("\n\n<i>“Who’s a good boy?”</i> you say lowly. He doesn’t reply. You slow the hand around his human erection down and attack his chest spot assiduously, curling your fingers deep into the softness there. He arches his back and barks breathlessly, eyes closed.");
	
	output("\n\n<i>“Who’s a good boy?”</i> you insist.");
	
	output("\n\n<i>“Me! I’m a good boy, damn you to hell, I’m a good boy who’ll do anything... ”</i> he howls. You immediately up the pace, whipping your hand up and down his hot, trapped meat until, with a cataclysmic groan, it swells up and then spurts great flumes of orange cum several feet into the air. The fanfir gasps and flexes his hips helplessly as you milk him quite dry, forcing huge quantities of his spooge out of his dilated slit and onto his belly and floor, caressing his sensitive area all the while.");
	
	output("\n\nYou stand back, hot hands clasped in front of you when you’re done, and watch him slowly clamber to an upright position, his own seed dripping off him. He gazes at you cloudy-eyed and open-mouthed, seeing you in an entirely different light.");
	
	output("\n\n<i>“That’s enough for today, I think,”</i> you say breezily. <i>“If you’re a really good boy, though... maybe we’ll do it again.”</i>");
	
	output("\n\n<i>“You can’t tell anyone about... that, Steele,”</i> he replies thickly. <i>“My reputation... if you don’t, then, yes, I wouldn’t mind... that.”</i> He wipes himself down and clambers back into his clothing, looking rather shamefaced.");
	processTime(4);
	geneSubmissionLevel(-3);
	pc.lust(10);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function genesModsBellyrubFirstEnd():void
{
	clearOutput();
	geneHeader();

	output("You give him a few more ruthless scrapes of your fingers, enough to make him quiver and moan throatily, and then step back.");
	
	output("\n\n<i>“That’s enough for today, I think,”</i> you say breezily. <i>“If you’re a really good boy, though... maybe we’ll do it again.”</i> Gene slowly clambers to an upright position, gazing at you cloudy-eyed and open-mouthed, seeing you in an entirely different light.");
	
	output("\n\n<i>“You can’t tell anyone about... that, Steele,”</i> he says thickly. <i>“My reputation... if you don’t, then, yes, I wouldn’t mind... that.”</i> He clambers back into his clothing, looking rather shamefaced.");

	geneSubmissionLevel(-3);
	processTime(1);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function genesModsBellyrubNo():void
{
	clearOutput();
	geneHeader();

	output("<i>“I still want to try,”</i> you manage, valiantly denying the imperative that he’s sent trembling through your [pc.eachVagina]. <i>“I want to try massaging you.”</i>");
	
	output("\n\n<i>“As you wish,”</i> the giant wyvern replies complacently. He rolls over onto one side, a landslide of red bulk, yellow eyes fixed on you. <i>“You know the penalty for tickling me though, pet. I tickle back.”</i>");
	processTime(1);
	genesModsBellyrubFirst();
}

public function genesModsLickedOut():void
{
	clearOutput();
	geneHeader(true);

	output("Once again, ivory claws clasp you firmly around the shoulders, and you find yourself being lifted off the floor. You try to keep your breathing level as Gene easily raises you above his head, dangling you naked and helpless in the air. Your fight-or-flight response rabbits that if the worst comes to worst, you could probably give him a good");
	if (pc.isGoo()) output(" goo smack");
	else if (pc.hasTail()) output(" whip of the tail");
	else if (pc.hasFeet()) output(" kick");
	else output(" smack upside the face");
	output(" from here - but that line of thought runs right out of you, your [pc.legOrLegs] going limp, the moment the fanfir opens his mouth and trails his hot, wet, rough tongue between the lips of your [pc.vagina].");
	
	output("\n\nHe gazes up at you, drinking in your expression as he sends the tip of it slathering between your folds, sending pulses of heat coursing up your tunnel and wetness");
	if (pc.wettestVaginalWetness() <= 2) output(" dripping");
	else output(" drooling");
	output(" back down, every drop of it disappearing into his mouth.");
	
	if (pc.isTreated() || pc.girlCumType == GLOBAL.FLUID_TYPE_HONEY || pc.girlCumType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK)
	{
		output("\n\n<i>“Sweet!”</i> he proclaims with a delighted clack of his horn lips. <i>“Like the golds, then? Carrying around a sticky, needy honey-pot that all but demands to be mercilessly licked out at regular intervals? Good "+pc.mf("boy", "girl") + "”</i>");
	}
	
	output("\n\nThe sensation goes from sensually pleasurable to unbearably ecstatic when he swaps his attention to your [pc.oneClit], lapping at it until he forces it to bulge out of its hood, then attacking it with brisk flicks of the tip of his tongue.");
	if (pc.totalClits() > 1) output(" He repeats the process with all your lady buds, until they are singing in sensitive, synchronized joy and you are cringing with the inhumane pleasure of it.");
	
	output("\n\nHe keeps going, still gloatingly watching you as you sway helplessly in his claws, clenching up and gasping to the stern rubbing over your clit");
	if (pc.totalClits() > 1) output("s");
	output(", pushed relentlessly to orgasm. You throw your head back and wail as your bitch button");
	if (pc.totalClits() > 1) output("s");
	output(" pulse");
	if (pc.totalClits() == 1) output("s"); 
	output(" uncontrollably, writhing your [pc.legOrLegs] and");
	if (pc.wettestVaginalWetness() <= 2) output(" dribbling");
	else output(" gushing");
	output(" [pc.girlCum] deliriously, unable to comprehend anything but that wet, rough lapping at your sensitive [pc.cuntColor]. When it’s finally over you sag in the fanfir’s claws, [pc.chest] heaving.");
	
	output("\n\n<i>“That was good for a start to our little massaging session,”</i> purrs Gene, all mocking, casual menace. He taps your throbbing [pc.clit] with his long, purple tongue, laughing softly as it makes you twitch. <i>“Time to get a bit more serious.”</i>");

	if (pc.vaginas.length > 0)
	{
		output("\n\nYou moan woozily as he trails that devilishly long, prehensile muscle of his further back, trailing over the lips of your [pc.vagina 1], pushing inside to swab at its sensitive entrance.");
		
		output("\n\n<i>“More than one?”</i> he says, pulling back momentarily. <i>“Aren’t we the glutton for punishment.”</i> The next moment ten inches of hot, thick tongue is rammed straight up your second pussy, wriggling further and further in to caress and tease at your most sensitive spots. You writhe and squeal as Gene deftly lowers you slightly in his claws and then up again, making you bounce on his obscenely long mouth tentacle.");
	}
	else
	{
		output("\n\nYou moan woozily as he trails that devilishly long, prehensile muscle over your [pc.vagina], pushing inside to swab at its entrance, obviously intent now on the pussy proper. It’s over-sensitive and flared from orgasm, intensifying the sensation of his teasing - and then the sensation of ten inches of hot, thick tongue suddenly ramming straight up your tunnel, wriggling further and further and further in to caress and tease at your most sensitive spots. You writhe and squeal as Gene deftly lowers you slightly in his claws and then up again, making you bounce on his obscenely long mouth tentacle.");
	}

	output("\n\nThe fanfir packs your pussy full of his wet tongue, the vibrations of his soft, deep laughter reverberating through you as you are quickly brought to another clenching high by its rubbing and curling roughness, deeper and inward this time, [pc.girlCum] dripping onto his lips whilst you rock and moan to the juicy, filthy rhythms of orgasm. Then he just keeps going, withdrawing only to lick and lap at your tender [pc.clit] again, with apparently unquenchable lust.");
	if (pc.vaginas.length > 2) output(" Not one of your many, moist cunts escapes his wet, ruthless touch; the lithe, purple meat strokes and then deeply penetrates each one, owning them and making them quiver together in such ridiculous ecstasy you think you might go completely mad with it.");
	
	output("\n\nWhenever you gaze down from your stocks-like perch you meet his yellow eyes, gloatingly drinking in every moment of the over-fucked delirium he’s causing you. His heavy breath resonates through you, making you feel soft and simple, and eventually you completely surrender yourself to it, bouncing, moaning and squealing gleefully to the fanfir’s masterful, sadistic touch, feeling like nothing more than a piece of ripe, dangling fruit, leaking a steady stream of your slutty juices in deference to his thirsty, powerful mouth.");
	
	output("\n\nAt long, long last, way after keeping count of the number of times you came ceases to be of any importance, the wet friction recedes from your [pc.eachVagina]. You loll, open-mouthed and gazing blearily at the ceiling as you are lowered carefully to the ground, where there is no power in your [pc.legOrLegs] to do anything but puddle onto it at Gene’s feet. The way your");
	if (pc.vaginas.length == 1) output(" pussy");
	else output(" pussies");
	output(" feel, you are vaguely surprised there isn’t steam coming from between your [pc.hips].");
	
	output("\n\n<i>“And that,”</i> says the fanfir primly, <i>“is how you massage someone, sweetly over-eager novice of mine.”</i> A bulrush-like tail tip caresses your shoulder and neck fondly. <i>“Although it’s obvious to us both, I think, that you just wanted me to do that.”</i>");
	if (geneSubmissionLevel() >= 8)
	{
		output(" It’s difficult to deny, lying at his feet, bathing in the sensation of being reduced to an over-sensitized pool of fuck. You stroke the curling tail and doze happily for a short time before getting up");
		if (!pc.isNude()) output(", stepping back into your [pc.gear]");
		output(", quietly enjoying the throbbing, pleasurable ache in your [pc.groin] as you gingerly move back around the counter.");
	}
	else
	{
		output(" You fight back an immediate, puppyish urge to agree. Certainly if this isn’t what you want - and a large part of you thinks it is - you’re going to have to choose your tactics more carefully next time. After a few more moments of rest you get up");
		if (!pc.isNude()) output(", step back into your [pc.gear]");
		output(" and shuffle back around the counter; gingerly, thanks to the throbbing, pleasurable ache in your [pc.groin].");
	}
	processTime(20);
	pc.orgasm();
	IncrementFlag("GENE_FUCKED");
	pc.createStatusEffect("Just Sexed Gene");
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function genesModsOverCounter():void
{
	clearOutput();
	geneHeader(true);
	var x:int = rand(pc.totalVaginas());
	// Requires: Vagina.
	// Tooltip: Get bent over the counter.

	if (geneSubmissionLevel() <= 7)
	{
		output("<i>“Do me over the counter,”</i> you respond, holding his eye steadily.");
		if (pc.isAss()) output(" <i>“Make it good.”</i>");
		
		output("\n\n<i>“I think,”</i> says Gene, clacking his hard lips together and returning your stare, <i>“I can maybe manage that.”</i>");
	}
	else
	{
		output("<i>“Do me,”</i> you sigh. The fanfir’s hot breath washes over you, making you feel like an ear of corn, rippling in a summer wind. Smooth, synthetic fingers find your [pc.vagina " + x + "] and trace its wet lips, circling [pc.oneClit], making you squirm and clutch at his wings, lust pulsing through you.");
		
		output("\n\n<i>“How?”</i> he murmurs, his deep voice shaking you right down to your pussy, intensifying the helpless heat there. <i>“You’re going to have to say how, or this is as far as we go.”</i>");
		
		output("\n\n<i>“Bend me over and fuck me stupid!”</i> you find yourself wailing, your [pc.vagOrAss] tensing in pure frustration to his slow, teasing fingers. <i>“Please!”</i>");
		
		output("\n\n<i>“Ah, there it is: the perfect timbre,”</i> he smiles at you proudly. <i>“Shamelessly slutty, yet earnestly polite.”</i>");
	}

	output("\n\nGene lowers you down and flips you over with strong, careful sweeps of his claws, shifting himself forward as he does, the great shadow of his form looming over you, the cool, earthy smell of him in your nostrils. You shudder as you feel the swell of his chest touch you between the shoulder-blades; the sheer weight of him could easily keep you pinned here, naked with your [pc.butt] in the air, if he so wished. You bite your lip as gray, warm digits caress and test the slick folds of your [pc.vagina " + x + "]; the hot, oak-like girth of his fanfir cock rides up between your buttocks, the ribs of its underside brushing over your [pc.asshole].");

	if (pc.biggestVaginalCapacity() <= geneCockVolume())
	{
		output("\n\n<i>“Hmm,”</i> he murmurs a moment later. <i>“A pretty and charmingly sized lady-hole you have down here. Am I the type of brute to resize it as he pleases?”</i> You inhale sharply as you feel the spear-head of his bigger dick restlessly press against your lips, stretching them wide. <i>“No, of course not.”</i> You exhale, a sigh of relief spiked with frustration as it withdraws. Gene arches his hips, bulky chest shifting down the small of your back, and the next moment you feel a more compact protrusion bump against your [pc.vagina " + x + "]. <i>“Not when I deliberately come equipped for sweet pixies like you,”</i> the fanfir growls. He thrusts forward, filling your tight tunnel with six inches of human cock.");
		pc.cuntChange(x,20);
		
		output("\n\nThe winged colossus’s hard thighs slap rhythmically against your [pc.butt] as he pumps you, pressing deep into your wet depths, making you tingle with pleasure with each returning thrust. His huge, turgid bulge-cock slides between your [pc.thighs] as he goes at you; you clench down, tightening your pussy up around his human cock at the same time as squeezing the soft flesh of your thighs around his bigger dick. Gene rumbles his enjoyment to this, and rewards you by picking up the pace, wing claws clutching the counter in order to provide the ballast to stretch the sensitive, clasping pocket you’ve provided with heavy, fervent strokes.");
		
		output("\n\nGasps escape your mouth, hands clutching at the hard glass, your whole body shaking to the force of the massive beast mounting you, his hot, bullish dick pressing against a hidden spot which makes a steady stream of sparks run up your spine. Gasps become wanton moans as his robot hands clasp your [pc.chest] and fondle your [pc.nipples],");
		if (!pc.hasFuckableNipples()) output(" stroking and pinching them until they are erect and inflamed");
		else output(" pushing into their wet depths until they are oozing [pc.girlCum] eagerly around his fingers");
		output(". You arch your back as orgasm grasps you; you thrust back into Gene’s human dick gleefully, using its hard, full girth to clench up and squeal to the irrepressible joy of it, [pc.girlCum]");
		if (pc.wettestVaginalWetness() <= 2) output(" dripping");
		else output(" spurting");
		output(" around the hot wood filling you");
		if (pc.isLactating()) output(" and [pc.milk] spurting freely from your kneaded [pc.nipples]");
		output(".");
		
		output("\n\nGene laughs his soft, deep enjoyment to watching you squirm and squirt yourself silly around him, slowing his pace down a bit in the aftermath of your orgasm - but he’s still hard as rock, and he continues to push himself into your oozing [pc.vagina " + x + "], bending it this way and that to stir and strain you, making you twitch and groan anew. He murmurs something under his breath which you don’t catch, his heavy susurrations trembling through your core, and suddenly you feel both refreshed and extra tender, your [pc.nipples] and [pc.clit] puffing up as blood rushes to them, ready and needy for extra fucking. Your [pc.tongue] hangs out of your mouth as he picks up the pace again");
		if (geneSubmissionLevel() >= 8) output(", whining your approval as he gives your [pc.butt] a hard swat for good measure.");
		
		output("\n\nGene pushes you to a second hot, heaving high, sweat rolling down your face as your whole body tenses up around the endless thick propulsion of his sex; then, when you feel reduced to a fuck-dazed puddle, he thrusts his way to his own high, claiming and stretching your pussy strenuously, android hands clutching your [pc.chest] for support, heavy balls slapping against your [pc.thighs] and semi-erect dragon dick rubbing over");
		if (pc.hasVagina()) output(" [pc.clits]");
		else output(" [pc.cock]");
		output(". Hazily you imagine a myr coming into the shop and taking in this sight, you flagrantly bent over the counter,");
		if (pc.biggestTitSize() < 2) output(" flesh");
		else output(" [pc.chest]");
		output(" jouncing, letting this monstrously sized creature have his way with you, and the thought makes you tighten up ecstatically again around his stern, hot cocks.");
		
		output("\n\nGene grunts hoarsely, tightens his grip on your [pc.nipples] and rams himself up to the hilt in your [pc.vagina " + x + "]. You groan long and low as he swells your tunnel and womb with copious, orange cum, surge after surge until you feel utterly stuffed with its thickness; can almost taste its spicy, musky tang on your limp [pc.tongue]. You can hear it hit the counter side below you, spurting unheeded from his bigger dick as well.");
		if (isGeneSubmissionLevelMaxed()) output(" The sound almost manages to sober you out of the golden dizziness you are experiencing for taking Master’s cock and getting him off so well. All of that wonderful, endorphin-tingling cum, going to waste... perhaps you could lick it up afterwards? Only if he asks.");
		
		output("\n\nIt oozes out of you when he finally withdraws from your hard-ridden pussy in a thick, steady stream, enough still inside to round your [pc.belly] with packed warmth. You loll on the counter, too fucked to do anything but quietly enjoy copious amounts of male juices slide slowly over your [pc.clit] and onto the floor.");
	}
	else
	{
		output("\n\n<i>“My word,”</i> he murmurs. You sigh blissfully as he sinks first one long digit, then two, then finally a whole smooth, android fist into the wet suck of your [pc.vagina " + x + "]. <i>“You’re... spaciously designed, aren’t you?”</i> There is an edge of excitement to his lava-like tones. A slight thrill runs through you when his caressing fingers are replaced by a big, hot conical shape, oozing pre and restlessly spreading your gaping pussy lips. <i>“I wonder. Shall I?...”</i>");
		
		output("\n\n<i>“Do it,”</i> you husk. You open your mouth in sheer bliss, tightening your grip on the counter when Gene complies, flexing his hips to penetrate you with sixteen inches of ribbed bulge-cock.");

		output("\n\nHe carefully pushes his way in with slow, patient thrusts, the massive bulge below his oozing head sliding its ribbed denseness deeper and deeper into your core, murmuring amazement and then simply pure joy at how much of your wet, sensitive breeding bay he can fit inside. For your part that ribbed goodness, filling and rubbing you from wall to wall in a way very few others can, is indecently pleasurable, making you tense up and");
		if (pc.wettestVaginalWetness() <= 2) output(" drip");
		else output(" dribble");
		output(" [pc.girlCum] around it freely. He sighs in intense satisfaction when his quad touches your [pc.hips], his soda-can sized base mired in your heat.");
		pc.cuntChange(x,geneCockVolume());
		
		if (pc.isTreated())
		{
			output("\n\nYou go slightly cross-eyed and moo softly when he pulls out, your elastic cunt clinging eagerly to every inch of his dick as it recedes, unhappy to see such a well-sized member leave even for a second.");
			output("\n\n<i>“Oh good grief,”</i> he gasps. <i>“That size, and that tightness... it’s perfect. You have the perfect pussy. How can I possibly let you go when you’ve got that between your thighs");
			if(InCollection(pc.vaginas[x].type, [GLOBAL.TYPE_GABILANI, GLOBAL.TYPE_MOUTHGINA])) output(" and you suck it down so well, too");
			output("?”</i>");
			output("\n\n<i>“No talking now,”</i> you reply. It is inexplicable and infuriating to you that, laid out and ready to get the big, hard dicking your body is constantly crying out for, he is wasting time with words. <i>“I should not be able to talk right now you’re fucking me that good, ‘kay?”</i> Gene readily responds by shoving his cock right up to its base, reaching your most sensitive spot- and everything becomes a deep, golden, mooing bliss again."); 
		}
		
		output("\n\nOnce he has spent a moment glorying in it, the fanfir pulls almost all the way out, so the ribbed bulge is distending your lips, before ramming all sixteen inches succulently home, his hard hips patting against your [pc.butt] as he quickly finds a good rhythm. The way it arches makes the tip of his massive cock drag across the roof of your sopping tunnel, sending tingles of pure pleasure running up your spine with every");
		if (pc.thickness <= 10) output(" shiver of your taut");
		else output(" jiggle of your generous");
		output(" flesh.");
		
		output("\n\n<i>“Of course,”</i> he murmurs, <i>“one of the best things about doing it like this is...”</i> You feel a hard protrusion slide between the cheeks of your [pc.butt] and press demandingly against your [pc.asshole]. In the dizziness of the moment you cannot immediately think what it is. You remember a moment later when, with a harsh groan, Gene thrusts forward, packing your [pc.vagina " + x + "] full of cock at the same time as spreading and penetrating your butthole with his human dick. It’s much smaller than his fanfir organ but, oh void, it feels anything but small as it drives into your colon...");
		
		output("\n\nGasps escape your mouth, hands clutching at the hard glass, your whole body shaking to the force of the massive beast completely stuffing you, his hot, bullish dicks pressing together through your tender walls. Gasps become wanton moans as his robot hands clasp your [pc.chest] and fondle your [pc.nipples],");
		if (!pc.hasFuckableNipples()) output(" stroking and pinching them until they are erect and inflamed");
		else output(" pushing into their wet depths until they are oozing [pc.girlCum] eagerly around his fingers");
		output(". You arch your back as orgasm grasps you; you thrust back into Gene’s double sex gleefully, the roughness of the cock taking your asshole contrasting brilliantly with the huge cock sliding and rubbing in your [pc.vagina " + x + "], clenching up and squealing to the irrepressible joy of it, [pc.girlCum]");
		if (pc.wettestVaginalWetness() <= 2) output(" dripping");
		else output(" spurting");
		output(" around the hot wood filling you");
		if (pc.isLactating()) output(" and [pc.milk] spurting freely from your kneaded [pc.nipples]");
		output(".");
		
		output("\n\nGene laughs his soft, deep enjoyment to watching you squirm and squirt yourself silly around him, slowing his pace down a bit in the aftermath of your orgasm - but he’s still hard as rock, and he continues to push himself into your oozing vagina and opened asshole, bending them this way and that to stir and strain you, making you twitch and groan anew. He murmurs something under his breath which you don’t catch, his heavy susurrations trembling through your core, and suddenly you feel both refreshed and extra tender, your [pc.nipples] and [pc.clit] puffing up as blood rushes to them, ready and needy for extra fucking. Your [pc.tongue] hangs out of your mouth as he picks up the pace again");
		if (geneSubmissionLevel() >= 8) output(", whining your approval as he gives your [pc.butt] a hard swat for good measure");
		output(".");
		
		output("\n\nGene pushes you to a second hot, heaving high, sweat rolling down your face as your whole body tenses up around the endless thick propulsion of his sex; then, when you feel reduced to a fuck-dazed puddle, he thrusts his way to his own high, claiming and stretching your pussy and ass strenuously, android hands clutching your [pc.chest] for support, heavy balls slapping against your [pc.thighs]. Hazily you imagine a myr coming into the shop and taking in this sight, you flagrantly bent over the counter,");
		if (pc.biggestTitSize() < 2) output(" flesh");
		else output(" [pc.chest]");
		output(" jouncing, letting this monstrously sized creature have his way with you, and the thought makes you tighten up ecstatically again around his stern, hot cocks, your own lubricant");
		if (pc.wettestVaginalWetness() <= 2) output(" dripping");
		else output(" streaming");
		output(" freely down your insides of your thighs.");
		
		output("\n\nGene grunts hoarsely, tightens his grip on your [pc.nipples] and rams himself up to the hilt in your [pc.vagina " + x + "] and [pc.butt]. You groan long and low as he swells your colon and womb with copious, orange cum, surge after surge until you feel utterly stuffed with its thickness; can almost taste its spicy, musky tang on your limp [pc.tongue]. It is soon spurting out of your utterly packed holes, dripping onto the faux-wooden floor below.");
		if (isGeneSubmissionLevelMaxed()) output(" The sound almost manages to sober you out of the golden dizziness you are experiencing for taking Master’s cock and getting him off so well. All of that wonderful, endorphin-tingling cum, going to waste... perhaps you could lick it up afterwards? Only if he asks.");
		
		output("\n\nIt oozes out of you when he finally withdraws from your hard-ridden pussy and ass in a thick, steady stream, enough still inside to round your [pc.belly] with packed warmth. You loll on the counter, too fucked to do anything but quietly enjoy copious amounts of male juices slide slowly over your [pc.clit] and onto the floor.");
	}

	output("\n\n<i>“I sometimes think I should invest in some mods that tone down my semen production,”</i> says Gene lowly, resting his chest carefully on your sweat-slicked back, his heat and heavy voice vibrating through your skin. <i>“It makes such a wretched mess. But it’s the style of the thing, isn’t it? Nobody would take you seriously if you were my size and came like a kaithrit.");
	if (geneSubmissionLevel() >= 8)
	{
		output(" Anyway, I have never had a treasure-slut complain about it.”</i> You hear that. After you’ve rested for a couple moments more you turn and slide down between his legs and lap his semi-erect");
		if (pc.biggestVaginalCapacity() < geneCockVolume()) output(" human cock");
		else output(" fanfir cock");
		output(" to a saliva-burnished gleam, enjoying the mixed taste of [pc.girlCum] and musky spice with wet smacks of your [pc.lips]. A");
		if (pc.hairLength == 0) output(" fond rub behind the ears");
		else output(" fond hand sliding through your [pc.hair]");
		output(" and another firm swat to the [pc.butt] when you get back up are your rewards.");
	} 
	else
	{
		output("”</i> The thought forms that his pride should come a distant second to the considerations of the person he busts his ridiculously sized nut in. However, you’re not really in a state to articulate it, and being absolutely stuffed with cum like this does feel quite satisfying.");
	}
	
	output("\n\nAfter you’ve rested a bit you get back up");
	if (!pc.isNude()) output(", pulling your [pc.gear] back on");
	output(" whilst Gene lumbers off in search of a mop.");
	if (pc.hasLowerGarment()) output(" You make a mental note to put your [pc.lowerUndergarment] on a heavy wash once you’re back to your ship.");

	pc.loadInCunt(chars["GENE"],x);
	processTime(24);
	pc.orgasm();
	IncrementFlag("GENE_FUCKED");
	pc.createStatusEffect("Just Sexed Gene");
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
