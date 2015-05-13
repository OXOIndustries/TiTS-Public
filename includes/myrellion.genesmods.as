public function geneHeader():void
{
	showName("GENE'S\nMODS");
	showBust("GENE");
	author("Nonesuch");
}

public function isGeneSubmissionDisabled():Boolean
{
	return flags["GENE_SUBMISSION_LEVEL"] == -1;
}

public function isGeneSubmissionLevelMaxed():Boolean
{
	return flags["GENE_SUBMISSION_LEVEL"] == 10;
}

public function pcIsMyrOrNyrea():Boolean
{
	if (pc.race().toLowerCase().indexOf("myr") != -1) return true;
	if (pc.race().toLowerCase().indexOf("nyrea") != -1) return true;
	return false;
}

public function geneSubmissionLevel(addVal:int = 0):int
{
	if (flags["GENE_SUBMISSION_LEVEL"] == undefined) flags["GENE_SUBMISSION_LEVEL"] = 0;

	if (isGeneSubmissionDisabled()) return -1;

	flags["GENE_SUBMISSION_LEVEL"] += addVal;

	if (flags["GENE_SUBMISSION_LEVEL"] < 0) flags["GENE_SUBMISSION_LEVEL"] = 0;
	if (flags["GENE_SUBMISSION_LEVEL"] > 10) flags["GENE_SUBMISSION_LEVEL"] = 10;

	return flags["GENE_SUBMISSION_LEVEL"];
}

public function geneLustIncrease():void
{
	if (geneSubmissionLevel() < 3) return;
	if (geneSubmissionLevel() < 7) pc.lust(2);
	if (geneSubmissionLevel() >= 7) pc.lust(5);
}

public function genesModsExteriorRoomDecorator():Boolean
{
	if (flags["GENES MODS ENTERED"] == undefined)
	{
		// 9999
		output("\n\nTo the [direction] is, unless you’re very much mistaken, the back end of a white, modern-day spaceship, its cargo doors open and loading ramp extended. It looks ludicrously incongruous nestled amongst the pseudo-classical architecture of Gildenmere. Above the cavernous semicircular entrance are lit the words <i>“Gene’s Mods”</i>.");
	}
	else
	{
		// 9999
		output("\n\nTo the [direction] are the jarringly modern white curves of Gene’s Mods. The entrance to the shop, as ever, yawns open a welcome to you.");
	}

	return false;
}

public function genesModsInterior():void
{
	clearOutput();
	geneHeader();

	if (flags["GENES_MODS_ENTERED"] == undefined)
	{
		flags["GENES_MODS_ENTERED"] = 1;

		output("\n\nStepping up the loading ramp and into the spaceship, you find yourself in a warm, sandy colored hangar bay, decorated with stands showing off various types of gene-mods, both modern and antique. The walls are covered with old poster and shifting-image advertisements for mods; to your eyes they look quaint, but you’d guess to myr eyes they would be the exact opposite. Other, more esoteric trinkets and objects hang from the ceiling and crowd the corners. Despite the clutter it seems big for a hangar bay, and everything is very widely spaced.");
		if (flags["LANDED_ON_TEXAS"] != undefined) output(" You are reminded immediately of the size of things on New Texas.");
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
			output(" and consider you more closely. His synthetic arms gesticulate with his words gracefully. <i>“An offworlder, curious enough to explore a frontier threatened with annihilation, curious enough to there wander into another offworlder’s shop,");
			if (CodexManager.hasUnlockedEntry("Fanfir")) output(" yet is spooked by a fanfir?");
			else output(" yet has never encountered a fanfir before?");
			output(" Curious.”</i> He laughs at his own joke, making the surrounding cabinets shake. <i>“Don’t worry, I do not bite. Not customers, as a rule. I sell gene mods, many different types, many of which are not available elsewhere. Ask, fellow stranger in a strange land, and you may receive. And relax.”</i> This last word is drawn out as a low, whispery susurration. You do suddenly feel rather more relaxed.");
		}
	}
	else
	{
		if (geneSubmissionLevel() >= 0 && geneSubmissionLevel() <= 2)
		{
			output("\n\n<i>“Captain Steele!”</i> Gene grins hugely when you step back into his airy shop. <i>“To what do I owe this rare pleasure?”</i>");
		}
		else if (geneSubmissionLevel() >= 3 && geneSubmissionLevel() <= 6)
		{
			geneLustIncrease();

			output("\n\n<i>“Captain Steele.”</i> Gene draws the syllables out in a low, pleased tone, making them vibrate in your bones. <i>“To what do I owe this rare pleasure?”</i>");
			if (pc.lustQ() < 50 || (pc.vaginas.length == 0 && pc.cocks.length == 0)) output(" The day suddenly feels a lot warmer, your thoughts turning inward to your body’s pulsing needs as you step inwards.");
			else if (pc.lustQ() >= 50)
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
			if (pc.lustQ() < 100) output(" You shake your head and try and concentrate.");
		}
		else if (geneSubmissionLevel() >= 7 && geneSubmissionLevel() <= 10)
		{
			geneLustIncrease();

			output("\n\n<i>“Captain Steele.”</i> Gene eyes you knowingly as he draws the low, pleased syllables out, making them send shivers down your spine. <i>“To what do I owe this rare pleasure?”</i>");
			if (pc.lustQ() < 50 || (pc.vaginas.length == 0 && pc.cocks.length == 0))
			{
				output(" The day immediately feels a lot warmer, and you welcome it, basking in the heat sinking down to your [pc.groin]. One minute you’re any old person going about their business in Gildenmere; the next you’re a sensuous being, relaxed and ready to immerse yourself in pleasure.");
			}
			else if (pc.lustQ() >= 50)
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
			if (pc.lustQ() < 100) output(" You smirk lazily back at the fanfir and think about what it is you want.");
		}

		if (pc.lust() == pc.lustMax())
		{
			output("\n\n<i>“But trifling talk and business can wait, can’t they.”</i> The massive creature strides out from behind his counter, and you do not resist him as, smile widening, he envelopes you in his cool, granite smell and powerful, looming frame.");

			// 9999 - Goto sex
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

	if (cFunc != ) addButton(1, "Talk", geneTalk);
	else addDisabledButton(1, "Talk");

	if (cFunc != geneAppearance) addButton(10, "Appearance", geneAppearance);
	else addDisabledButton(10, "Appearance");

	addButton(14, "Back", mainGameMenu);
}

public function genesModsGenericScene():void
{
	clearOutput();
	geneHeader();

	output("You’re standing in the airy, quaintly decorated shop floor of Gene’s Mods. The proprietor is propped up on the counter, gazing at you with his hawkish yellow eyes, waiting languidly.");

	genesModsMenu();
}

public function genesModsBuyStuff():void
{
	clearOutput();
	geneHeader();

	if (flags["GENE_SEEN_BUYMENU"] == undefined)
	{
		flags["GENE_SEEN_BUYMENU"] = 1;

		output("You say you’d like to see what he’s got to sell.");
		
		output("\n\n<i>“Right this way!”</i> he grandly sweeps back to his counter and directs you to a touch screen fastened to it. To your sensitivities it again looks rather antique and blocky.");
		if (pcIsMyrOrNyrea() && flags["GENE TALKED TO"] == undefined) output(" <i>“Do not be over-awed by such technology, small one,”</i> the shopkeeper suggests. <i>“Once you’ve gotten over your initial fright of it, it becomes a gateway to everything you could ever dream of.”</i>");
	}
	else
	{
		output("Gene lazily spins a talon in the direction of the touch-screen.");
	}

	// 9999
	//[Show inventory]
}

public function geneAppearance():void
{
	clearOutput();
	geneHeader();

	output("Gene is big. Like, really big. From the top of his head to the tip of one of his thin, bulbous-tipped twin tails, the maroon colored wyvern-shaped sentient reaches at least forty feet long. Most of that you can’t see when he is behind his counter, ivory wing-claws clutching the surface and looming over it; however the fans of those bat-like wings, folded away though they might be, are always evident. Fully unfurled his wing span must be more than ten yards. His skin is fairly smooth, closer to hairless mammalian than scaly reptilian, however he does not have nipples. He dresses in the remnants of an old space suit, carapace and tough, tight-fitting fabrics around the joints, bare on the arms. At a guess it’s from the 24th century. Quaint to your eyes, but you’d imagine breathtakingly futuristic to any native.");
	
	output("\n\nFacially Gene looks human enough - albeit a very large human, with horn plating his lips and chin. He has full, broad, straight nosed, shaven features that would not look out of place in some classical Persian epic. It would have to be one with a lot of jokes in it, because he never seems far from breaking out into a big, toothy grin, behind which a long, purple tongue is always waiting to wag. He has a mane of brown hair and yellow, hawkish eyes. Adder-like black squares pattern his heavily corded neck and shoulders.");
	
	output("\n\nIncongruous to his bestial, fleshy frame are his grey, synthetic, four fingered arms, connected to him via a harness around his lower torso. These are usually folded primly on the counter, and obviously allow the fanfir to do manual tasks he’d otherwise struggle with. He moves and gestures with them as easily as if they were his own.");
	
	output("\n\nHis carapace bottoms have a suggestively large codpiece.");
	if (flags["GENE FUCKED"] == undefined) output(" You’d guess, from the size of the rest of him, he packs pretty heavily.");
	else output(" You know by now he has one sixteen inch fanfir cock, hot, ribbed and incredibly girthy, one six inch human cock, as simple and unassuming as you could  imagine save for the burgundy color, and four dense, melon-sized balls.");
	output(" Behind his firm, muscular backside his two lizard-like tails swish restlessly, the two bulbous tips occasionally making a <i>“blat”</i> sound as they hit a surface.");

	genesModsMenu(geneAppearance);
}

public function geneTalk(cFunc:Function = null):void
{
	if (flags["GENE_TALKED"] == undefined)
	{
		clearOutput();
		geneHeader();

		flags["GENE_TALKED"] = 1;

		output("\<i>“So your name is Gene?”</i>");
		
		output("\n\n<i>“That name will suffice, yes.”</i> His hawkish eyes narrow as he considers you closer.");
		if (pcIsMyrOrNyrea()) output(" <i>“But you aren’t a native at all, are you? The way you speak, the way you hold yourself... yeeesss, I see it now. An offworlder so entranced by the insect people [pc.heShe] used Xenogen’s magic to become one, and now is impatient to see how else [pc.heShe] might splice [pc.himHer]self here!”</i> he bellows an exasperated laugh at the ceiling. A slight amount of dust comes down and you take a nervous step back. <i>“Oh, what a crashing fool I have made of myself! And I call myself a modder! You must forgive me...?”</i> You tell him. <i>“Forgive this fanfir’s arrogant presumption then, [pc.name] Steele.”</i> He lowers his head with theatrical humbleness. <i>“I only hope I can be of some small use to you, as Gildenmere’s premier supplier of finest transformatives, to make up for it.”</i>");
		else output(" <i>“And if I may inquire...?”</i> You tell him. <i>“[pc.name] Steele.”</i> He draws the <i>“s”</i> and <i>“e”</i> out with obvious enjoyment. You are put in mind of a sword being drawn. <i>“Very space adventure-y. I shall remember it.”</i>");
		output(" He carefully extends the vast canopy of his wings to indicate the store.");

		output("\n\n<i>“I travel the frontier in my shop, my vessel, my damnable joy, offering specialist gene mods to the agog masses of the freshly discovered, before the mega-corporations get their talons into them. The transitive life suits, for every life-bearing planet that is visited, opportunities to collect new DNA arise, for new mutations to be teased into existence, to be compounded and distributed to a public ever hungry for change.”</i>");
		
		output("\n\n<i>“You make gene mods yourself?”</i>");
		
		output("\n\n<i>“Oh goodness me no,”</i> Gene chuckles. <i>“I am an itinerant dilettante, not a chemist! But you would not believe just how richly some companies will reward you for providing them with freshly discovered alien DNA. Particularly if, say, those aliens may not exist in a week’s time. Or if they are living in the shadow of a much larger company.”</i> He stretches his shoulders, glancing idly around his shop-cum-hangar bay. <i>“I will admit I have grown fond of Myrellion, though. I have lingered here longer than I usually do. The place has... how shall I put this.");
		if (pc.isMasculine())
		{
			output(" <i>“ He grins");
			if (pc.tallness < 120) output(" down");
			output(" at you toothily.  <i>“I’m sure I don’t have to spell it out to you, do I? If someone as thrusting and dashing as you has not gone to sleep every night he’s been here on a bed of content, beautiful ant women, why, I don’t know what to think.”</i>");
		}
		else
		{
			output(" Certain enjoyable elements for one such as I?”</i> He grins");
			if (pc.tallness < 120) output(" down");
			output(" at you toothily. <i>“But however many ant women you feast upon, you never lose the passion for more. Not when so many interesting people keep walking through your front door.”</i>");
		}

		geneSubmissionLevel(1);

		genesModsMenu();
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
	
	if (cFunc != ) addButton(0, "Shop", );
	else addDisabledButton(0, "Shop");

	if (cFunc != ) addButton(1, "Other Aliens", );
	else addDisabledButton(1, "Other Aliens");

	if (cFunc != ) addButton(2, "Mods", );
	addDisabledButton(2, "Mods");

	if (cFunc != ) addButton(3, "You", );
	addDisabledButton(3, "You");

	if (cFunc != ) addButton(4, "Myr", );
	addDisabledButton(4, "Myr");

	addButton(14, "Back", genesModsMenu);
}

public function genesModsTalkShop():void
{
	clearOutput();
	geneHeader();

	flags["GENES_MODS_TALK_SHOP"] = 1;

	output("<i>“This place, then.”</i> You wave your hand at the curved roof of the shop. <i>“Did you just land it here one day or what?”</i>");
	
	output("\n\n<i>“Well, I sought permission first.”</i> Gene harrumphs as he turns and click-thud-clack-thumps his way around the oak-colored space, tails flicking, continuing to talk as he slides fastidious cybernetic fingers over cases and posters. <i>“Discretely. After the kui-tan gave me permission to land and trade here, I approached a couple of gold myr civil servants about room in Gildenmere where I might safely set myself up. It turned out there was quite a lot of that - vacant lots do have a tendency to spring up during the prosecution of lost wars. And they were quite happy, desperate even, to get fresh commerce in, particularly from the stars. Of course, I did not tell them I was actually going to land here. That I had researched the tunnels, found one big yet secluded enough for me to glide down here on low power during the night cycle, perch up high in the caverns.”</i>”</i> He suddenly whips around to you, balancing himself on two creaking cabinets again, beaming down like a giant red lighthouse.");
	
	output("\n\n<i>“Imagine it,”</i> he insists. <i>“Put yourself in the shoes of your average gold myr. Worn and fraught by conflict, you and your people have been given a stay of execution by the arrival of extraterrestrial beings. Who are they, these mysterious, benevolent beings, what do they want, where, how...? And then, one morning.”</i> He lowers his voice to a ominous hush, his cyber arms opening to the sky. <i>“You are walking down the street to your place of work when a spaceship appears above you, a piece of technology of unknowable, wondrous design, and with impossible grace and speed, it sits itself down where once a part of your shattered city stood. You are transfixed, unaware of the crowd you are part of - your people, the precious free few, are reduced to objects in the way of the sight. Then - after the clouds have dissipated, and minutes have dragged by - <i>“ One metal arm points to a corner. If you’re not very much mistaken, a dry ice machine is standing over there. <i>“The doors slide open, and I emerge.”</i> He unfolds his massive bat wings to their full extent, eyes fixed on the middle distance.");
	
	output("\n\n<i>“People of Gildenmere!”</i> he roars, full-throated, making the room shake. You suddenly feel thrilled in a diffuse, indefinable way and perhaps, just for a moment, you are that gold myr, standing frozen in the street in awe. <i>“For too long you have struggled under the yoke of war that is not your path. I come in peace, and to you I bring the fruits of a peace beyond your world that has lasted centuries beyond reckoning. Those brave enough to taste of them can become anything they wish - may break away from the cruel bonds of nature. The only limit is your imagination, o young people of art, thought and liberty. Become what you wish to be. Become the future!”</i> He trumpets the last word like a cavalry charge, and then settles himself down to gaze at you smugly. <i>“I have not wanted for customers. I also understand every other off-worlder has been something of a disappointment, at least to those who were there that morning.”</i>");

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
	
	output("\n\nHe holds your eye and allows his great, long, purple tongue to droop out, wriggling it sensually. <i>“A cutting edge transformative,”</i> the fanfir says, after he’s retracted it. <i>“Isolated from pygmy natives of a wretched-sounding planet discovered in this very rush. Deeply enjoyable and - right feeling. I must say it feels like my people should have been equipped with such tongues all along. And then, of course... <i>“ He leans backwards and waves a robotic hand at the generously sized cod-piece of his outfit. <i>“Many are the native girls who like the look of a male fanfir’s genitalia, but few and far between are they that are willing to put them anywhere near their own. Quite understandable. So I invested in another, more modestly sized one.”</i> He rocks back onto the balls of his feet. <i>“I have always enjoyed the look of human sexual organs. No unnecessary adornments, no silly little bells and whistles - elegantly and concisely designed. A phallus, bold, blunt and ready. Next to my natural endowment, outrageous to most sensitivities, it is an excellent juxtaposition. Exactly how gene-mods should be used.”</i>");

	clearMenu();
	addButton(0, "Next", genesModsTalkModsII);
}

public function genesModsTalkModsII():void
{
	clearOutput();
	geneHeader();

	output("<i>“Your arms, though.”</i> you point at Gene’s two grey, synthetic arms, shadowed under his bulk. <i>“Why haven’t you simply grown a pair?”</i>");
	
	output("\n\n<i>“An incisive enquiry,”</i> rejoins the fanfir, stepping closer to let the hot liquid of his voice fill your ears. <i>“Why indeed would a mutationist, who relies upon being able to palpably demonstrate his prowess, rely upon robotics? There are two reasons, [pc.short] Steele. The first, and this concern most fanfir share, is that a second pair of limbs rather impinges one’s ability to fly. In order for us to fly outside of our own world, you see, we need a second, anti-gravity harness. Whilst this synthetic aid may be easily shucked off and replaced with the other, a permanent set of arms places undue strain on it, and simply makes the business of flying clumsier besides. So the question is: do you sacrifice the occasional fleeting wonder that can be found in the air of alien worlds, the inexpressible delight of flight, for eternal manual dexterity?”</i> He spreads his wings like a giant fan and bellows the answer at you. <i>“No, no and NO!”</i>");
	
	output("\n\n<i>“What’s the other reason?”</i> you inquire as levelly as you can.");
	
	output("\n\n<i>“Well, that one is much more simple,”</i> Gene says, closing his wings and again stepping closer to you. There’s a clean metal sound and suddenly the synthetic harness unclasps, his arms falling to the ground. <i>“I am a vain creature, it cannot be denied. And I have never encountered a second pair of arms that I felt would genuinely improve how I look. I mean, look.”</i> The top half of his bulky outfit falls to the ground as well, and the fanfir swells his immense, red chest in front of you. <i>“Really consider,”</i> he insists, a grin of total confidence somewhere far above. <i>“Would you really have a pair of spindly little arms sprouting out of this the entire time? Would you really ruin such a vista?”</i>");

	if (geneSubmissionLevel() < 10)
	{
		clearMenu();
		addButton(0, "Look Closely", genesModsTalkModsLookClosely);
		addButton(1, "Step Back", genesModsTalkModsStepBack);
	}
	else
	{
		output("\n\nHe made a demand of you, and this close to the fanfir there's no denying him. You stare gladly up at his vast, tight bulk, simmering in the power and raw sexuality you can almost feel radiating off of him, stoking the heat in your [pc.groin].");

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
	else output(" It's difficult to deny how impressive he is in a bestial, masculine way.");

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

	if (pc.isFeminine() && pc.lustQ() >= 33)
	{
		output("\n\nAn ivory claw lands upon your shoulder{, sliding beneath your [pc.upperGarment]}. Gene’s eyes glare down at you, hawkish and lit with lust.");
		
		output("\n\n<i>“After putting on such a display,”</i> he husks, <i>“I think perhaps it’s time you showed me what you are made of, hmm?”</i>");

		//[Yes] [No] [Back Off!]
		clearMenu();
		addButton(0, "Yes", genesModsTalkModsYes);

		if (pc.lust() < pc.lustMax()) addButton(1, "No", genesModsTalkModsNo);
		else addDisabledButton(1, "No");

		if (flags["GENE_TALK_MODS_NO"] != undefined) addButton(2, "Back Off!", genesModsTalkBackOff);
		else addDisabledButton(2, "Back Off!");
	}
}

public function genesModsTalkModsYes():void
{
	geneSubmissionLevel(1);
	// 9999 - goto sex
}

public function genesModsTalkModsNo():void
{
	flags["GENE_TALK_MODS_NO"] = 1;
	
	clearOutput();
	geneHeader();

	output("You shrug the fanfir’s claw off and politely tell him not right now.");
	
	output("\n\n<i>“As you wish, Steele,”</i> replies Gene, giving you one last hungry, convivial look before turning back to his voluminous armor. <i>“For now.”</i>");

	geneSubmissionLevel(1);

	genesModsTalkMenu(genesModsTalkMods);
}

public function genesModsTalkBackOff():void
{
	clearOutput();
	geneHeader();

	output("You shrug the fanfir’s claw off irritably.");
	
	output("\n\n<i>“It’s strange, I’m pretty certain I told you not to do that once,”</i> you say. <i>“And here I am telling you again. Next time you aren’t getting that paw of yours back.");
	if (pc.IQ() >= 50 && CodexManager.hasViewedCodexEntry("Fanfir")) output(" And don’t think I don’t know what you’re trying to pull with that treacly voice of yours either.");
	output(" So knock it off, alright?”</i>");
	
	output("\n\nGene looks stunned by this - and then, momentarily, thunderously angry. Finally though, he takes several steps back and groans theatrical despair at the ceiling.");
	
	output("\n\n<i>“Thrown back by the enchantress herself!”</i> he cries. <i>“I have overplayed and over-reached, and paid the most terrible of prices for it!”</i> He bows his head humbly to you, mournful pebbles raining out of his throat. <i>“Your wish is my command, o aptly named Steele. No longer shall I pursue you, for no longer can I claim the right. Forever more I will gaze lovelorn at you from a distance, and pour my sorrow into composing paeans to your wondrous, wintry beauty.”</i> He trudges back behind his counter in the manner of some great, crestfallen hound.");

	//Submission set to 0, no longer rises
	flags["GENE_SUBMISSION_LEVEL"] = -1;

	genesModsTalkMenu(genesModsTalkMods);
}

public function genesModsTalkOtherAliens():void
{
	clearOutput();
	geneHeader();

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
		
		output("\n\n<i>“Xanthe,”</i> he says, drawing out of the syllables. <i>“That is her name - although undoubtedly an alias in reference to something as surely as mine is, she of all people will know the power of names. She is a siel, a wondrous and utterly infuriating folk I was happily unaware of until she arrived here not a month ago.”</i> He shakes his head mournfully at your ignorance, revelling in his own misery. <i>“Go find her shop, here in this very city. Approach and talk to her, bask in her presence. Then, perhaps, you shall understand a small part of my pain.”</i>");
	}

	geneSubmissionLevel(1);

	genesModsTalkMenu(genesModsTalkOtherAliens);
}