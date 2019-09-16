/* flags:
 * MET_ZEA
 * ZEA_DISCOUNT: got a discount
 */

public function showZea(nekkid:Boolean = false, au:Boolean = true):void
{
	showBust((nekkid ? "ZEA_NUDE" : "ZEA"));
	showName("\nZEA");
	if (au) author("GothPastel");
}

//returns true if Zea is present
public function seatingZea(btnSlot:int):Boolean
{
	if (hours < 12 || hours > 13) return false;
	if (flags["MET_ZEA"] == undefined)
	{
		output("\n\nThere’s a " + (CodexManager.entryUnlocked("Xhelarfog") ? "Xhelarfog" : "strange looking alien with opalescent skin and golden scales") + " tapping away at some sort of codex in the far corner, barely paying attention to the meal they’ve been served. They’re wearing some sort of armband, and when you look closer, you recognize the Steele Tech logo.");
		addButton(btnSlot, "Alien", zeaIsGreeted);
	}
	else
	{
		output("\n\nZea’s sitting in the far corner as always, seemingly lost in her work.");
		addButton(btnSlot, "Zea", zeaApproach, true);
	}
	
	return true;
}

public function zeaIsGreeted():void
{
	clearMenu();
	clearOutput();
	showZea();
	showName("\nALIEN?");
	processTime(3);
	
	if (CodexManager.entryUnlocked("Xhelarfog"))
	{
		output("The Xhelarfog jolts as you pull up a chair next to them, but soon settles. They don’t speak, simply looking for you to make the first move, all three golden eyes unblinking.");
	}
	else
	{
		output("As you approach the alien, your codex bleeps at you.");
		output("\n\n<b>Codex entry unlocked: Xhelarfog.</b>");
		output("\n\nYou flush in embarrassment as the ali- the Xhelarfog snaps to attention, looking up at you curiously.");
		output("\n\nYou hadn’t really noticed before, thanks to their slouched posture and the fact they weren’t facing in your direction, but they have three, golden eyes staring up at you, unblinking.");
		CodexManager.unlockEntry("Xhelarfog");
	}
	output("\n\nThere’s a few tense moments of awkward silence before you manage to get your act together, introducing yourself, and they speak up, tucking away their codex so their work doesn’t distract them.");
	output("\n\n<i>“Ah! A Steele. [pc.name] Steele, at that! The boss-to-be - or, well ...Potential boss-to-be. It’s a pleasure to make your acquaintance. I am known as Zea.”</i>");
	output("\n\nZea’s speech has some... Odd affectations when it comes to titles, but they’re perfectly understandable.");
	output("\n\nYou pull up a seat across from them, asking what exactly they meant by <i>potential</i>.");
	output("\n\n<i>“I don’t know what boss-that-was - Victor - planned to make you go through before taking the company, but I’m sure it was a bad idea. You, your cousin-twins, your uncle, any half-siblings we don’t even know about? All of them are potential bosses-to-be - and that’s just relatives that have a realistic stake in the Steele collective-name.”</i>");
	output("\n\nThey don’t look particularly concerned at that.");
	output("\n\n<i>“I’ll still get paid,”</i> is the response, <i>“I don’t particularly care whose name will be on the check.”</i>");
	output("\n\nYou suppose that’s fair, but it’s still");
	if (pc.isNice()) output(" upsetting");
	else if (pc.isMisch()) output(" disappointing");
	else output(" infuriating");
	output(" to know that not everyone in the company respects your father’s desire to put you in control.");
	output("\n\nOut of nowhere, Zea speaks up again. <i>“Ah, one moment - your species has issue telling our sexes apart. I am a female. You?”</i>");

	if (pc.hasStatusEffect("Force Fem Gender")) output("\n\nYou tell her that, regardless of appearance, you currently prefer to be treated as a female too.");
	else if (pc.hasStatusEffect("Force Male Gender")) output("\n\nYou tell her that, regardless of appearance, you currently prefer to be treated as a male.");
	else output("\n\nYou tell her you’re generally fine with people addressing you as whatever you look like, and that’s " + pc.mfn("male", "female", "neither male nor female") + " right now.");
	output("\n\nShe nods in understanding, and the lull in conversation begins once more.");
	
	flags["MET_ZEA"] = 1;
	
	addButton(0, "Next", zeaApproach, false);
}

public function zeaApproach(greet:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showZea();
	
	if (greet) output("You pull up a chair across from Zea, stifling a grin as she jolts to attention, distracted once again by her work.\n\n<i>“[pc.name] Steele! To what do I owe this meeting?”</i>");
	else output("Zea looks across the table at you, occasionally taking a bite of her meal as she waits for you to speak up.");
	
	zeaButtons();
}

public function zeaButtons(dis:int = -1):void
{
	if (dis == 0) addDisabledButton(0, "Appearance");
	else addButton(0, "Appearance", zeappearance);
	if (dis == 1) addDisabledButton(1, "Talk");
	else addButton(1, "Talk", zeaChat);
	if (flags["ZEA_JOBBED"] != undefined)
	{
		addButton(2, "Shop", function():void
		{
			flags["ZEA_SHOPPED"] = 1;
			itemScreen = mainGameMenu;
			lootScreen = mainGameMenu;
			useItemFunction = mainGameMenu;
			shopkeep = zea;
			shopkeepBackFunctor = zeaApproach;

			buyItem();
		});
		if (flags["ZEA_SHOPPED"] == undefined) addDisabledButton(3, "Discount", "Discount", "You don’t even know what she’s selling.");
		else if (dis == 3) addDisabledButton(3, "Discount");
		else addButton(3, "Discount", zeaGimmeDiscounts);
	}
	addButton(14, "Bye", function():void
	{
		clearMenu();
		clearOutput();
		output("You tell Zea that you have to leave and she waves you off, barely waiting until you’re out of her sight before pulling her codex out, getting back to work.");
		addButton(0, "Next", mainGameMenu);
	});
}

public function zeappearance():void
{
	clearOutput();
	showZea(flags["ZEA_DISCOUNT"] != undefined);
	
	output("Zea is a Xhelarfog, and as such she has three golden eyes: one large, central one, with two smaller ones below it.");
	output("\n\nShe’s about 4\' 8\" by your best guess, quite short by galactic standards.");
	output("\n\nHer face has a curious lack of a nose, presumably meaning she can’t smell, and when she speaks you catch a glimpse of sharp, predatory teeth. Her horns, erupting from the center of her forehead, are the same opalescent white as the rest of her slightly sticky skin, but fade into a golden shade at their tips.");
	output("\n\nShe has the typical scale pattern of an adult of her species - corset-like over her abdomen, with the top half of her tail likewise protected by scales of gold. The only tell of her age is that she’s begun to develop yet more rough scales on her legs, but as you’re not sure of how fast these grow in, or even what the average Xhelarfog lifespan is; you can only surmise the basic fact that she’s clearly above the legal age.");
	output("\n\nSeeing as she wears no clothes aside from a cloth band around one arm bearing the Steele Tech logo, you can clearly see that she has gone without modification to her chest - having no breasts or even nipples to speak of - and her groin is as bare as is true of all unmodded individuals of her species.");
	if (CodexManager.entryViewed("Xhelarfog") || flags["ZEA_DISCOUNT"] != undefined)
	{
		output("\n\nHer genitals, as you’ve discovered, are instead located on the underside of her thick, stubby tail");
		if (flags["ZEA_DISCOUNT"] != undefined) output(" - she’s got a cute pussy, currently with its lips pressed tight together, but you know that when she’s sufficiently aroused it has a clit at either end and is the same golden color as her eyes and scales");
		output(".");
	}

	zeaButtons(0);
}

public function zeaChat():void
{
	clearOutput();
	showZea();
	processTime(5);
	
	output("You ask her about her job, and why she’s here rather than across the street at the Steele Tech branch.");
	output("\n\n<i>“I’m what you’d call a delivery woman. Mostly runs to various Steele Tech shops like the one across the road, delivering merchandise for people like Anno to stock - though why <i>she’s</i> been relegated to the nowhere place this is I don’t know... Of course, I am having something of a... What’s your word? The break-from-work one?”</i> She trails off.");
	output("\n\nShe’s on vacation... On Tarkus of all places?");
	output("\n\n<i>“Mhmm. Scrap heap this big, this full of metal? It kind of reminds me of home. Less gold, of course.”</i>");
	output("\n\nStrange, but you suppose you can’t judge. But is that really all she’s doing here?");
	output("\n\n<i>“I get surplus now and then on my runs. Stuff vendors aren’t interested in selling, or don’t have enough space on their shelves for.”</i>");
	output("\n\nOh? Does she have anything now?");
	output("\n\nYou hear a clang under the table as Zea kicks at something you can’t see.");
	output("\n\n<i>“Big box of some new transformatives. Makes you look like a Xhelarfog. Anno thought it’d be easier for me to shift them, seeing as I <i>am</i> one, but the locals aren’t interested, and Rushers don’t make the best repeat customers. ...And they’re still <i>slightly</i> experimental.”</i>");
	output("\n\nMaybe you’ll buy a few.");
	output("\n\n<i>“Of course - cut prices for you - got a memo from the boss-that-was, a little before he shuffled off this mortal coil.”</i>");
	output("\n\n...Lovely.");
	
	flags["ZEA_JOBBED"] = 1;
	
	zeaButtons(1);
}

public function zeaGimmeDiscounts():void
{
	clearMenu();
	clearOutput();
	showZea();
	processTime(1);
	
	if (zea.sellMarkup < 1)
	{
		output("You open your mouth to speak, and are immediately interrupted with a finger over your mouth.");
		output("\n\n<i>“[pc.name] Steele! You’ve not even spent the last one!”</i>");
		output("\n\nYou flush, apologizing as soon as the finger’s removed. You guess you can’t slip the wool over her eyes that easily.");
		return zeaButtons(3);
	}

	output("You know you’re already getting below average rates as the future CEO of Steele Tech, but you can’t help but ask if there’s any way for you to earn a future discount.");
	output("\n\nZea laughs, clearly noticing the slight edge of the Steele family charm in your voice, but relents as you don’t budge on it.");
	output("\n\n<i>“I do suppose that there’s... Something you can help me with. Get down on the floor behind me and eat me out. 25% off the next purchase.”</i>");
	output("\n\nSo, do you want to?");

	addButton(0, "Hell Yeah", zeaRecievesServicesForGoods);
	addButton(1, "Actually...", function():void
	{
		clearMenu();
		clearOutput();
		showZea();
		output("You’re not really into eating pussy, or at least don’t fancy it right now.");
		if (pc.isTaur() || !pc.hasCock() || pc.shortestCockLength() > 12)
		{
			output("\n\nShe shrugs, waving you off.");
			output("\n\n<i>“Your loss.”</i>");
			zeaButtons(3);
		}
		else
		{
			output("\n\nShe looks ready to wave you off, but pauses.");
			output("\n\n<i>“Perhaps you’d be more interested in penetrating it?”</i>");
			output("\n\nWould you?");
			addButton(0, "No", function():void
			{
				clearOutput();
				showZea();
				output("She shrugs and waves you off.");
				output("\n\n<i>“Your loss.”</i>");
				zeaButtons(3);
			});
			addButton(1, "Yes!", zeaPenetrated);
		}
	});
}

public function zeaRecievesServicesForGoods():void
{
	clearMenu();
	clearOutput();
	showZea(true);
	processTime(15+rand(16));
	
	var exhibLow:Boolean = pc.exhibitionism() < 33;
	var exhibHi:Boolean = pc.exhibitionism() >= 66;

	output("Zea chuckles, shifting so her tail hangs off her seat better for easier access, and you");
	if (exhibLow) output(" surreptitiously");
	output(" stand, crossing to the other side of the table and");
	if (exhibLow) output(" tentatively");
	output(" dropping to your knees behind her.");
	output("\n\nYour Xhelarfog lover has no qualms about showing off what she’s doing, much to your " + (exhibLow ? "embarrassment" : (exhibHi ? "absolute delight" : "arousal")) + ", flashing a grin that is both sweet and absolutely filthy across the room at " + (flags["EDAN_MET"] != undefined ? "Edan" : "a leithan man") + ", before pushing her plate aside and twitching her tail towards you, her pussy starting to spread open a little from the arousal of anticipation and exhibitionism, revealing it’s gleaming, gold-toned interior.");
	output("\n\nYou don’t waste time. Your mouth quickly finds Zea’s pussy, pressing against it with something akin to greed. A hungry tongue easily finds her lower clit, circling it, before making a figure eight back up to her upper one, a performance she clearly enjoys, her cunt juicing itself as her tail jerks itself to press harder against your face as she moans throatily.");
	output("\n\nThe both of you soon lose yourselves in the rhythm of cunnilingus, " + (exhibLow ? "your feelings of apprehension at such a public act fading into arousal" : (exhibHi ? "and you feel the familiar sensation of hot arousal at your public act brimming up" : "any feelings of nervousness easily buried into sheer arousal")) + ", your ");
	if (pc.isHerm()) output("[pc.cocks] stiffening and your [pc.vaginas] threatening to leave a pool of [pc.girlcum] beneath you.\n\nYou can’t help it, reaching down to stroke your [pc.cockBiggest] briefly, before your fingers plunge into your [pc.oneVagina]");
	else if (pc.hasCock()) output("[pc.cocks] stiffening.\n\nYou can’t help it, reaching down to stroke your [pc.cockBiggest]");
	else if (pc.hasVagina()) output("[pc.vaginas] threatening to leave a pool of [pc.girlcum] beneath you.\n\nYou can’t help it, reaching down to plunge your fingers into your [pc.oneVagina]");
	else output("groin burning with unanswerable lust.\n\nYou can’t help it, reaching down to push into your asshole");
	output(", desperate for sympathetic pleasure as every motion of your tongue seems to reward you with more and more tangy girlcum.");
	output("\n\nNobody seeks to interrupt you, even as Zea lets out a loud string of expletives as you plunge your tongue as far as you can into her wet entrance");
	if (pc.hasLongTongue()) output(", far enough in that you can caress the cervix-like barrier at the end of her passage");
	output(".");
	output("\n\nIt won’t take long, you note, before she cums - and your frenetic masturbation doubles its pace, determined to orgasm alongside her.");
	output("\n\nYou’re right - it doesn’t take much longer at all. One well timed drag of your tongue from clit to clit finishes her off in a wet explosion that coats your face in her fluids. You lean back, panting, and it only takes a few more " + (pc.hasVagina() || !pc.hasCock() ? "thrusts" : "strokes") + " of your fingers to finish yourself off");
	if (pc.hasCock() || pc.isSquirter()) output(", coating " + (pc.isCrotchExposed() ? "the floor beneath you" : (pc.isCrotchExposedByLowerUndergarment() ? "your armor" : "your lower garments")) + " in your own");
	output(".");
	output("\n\nZea slumps in her seat, and you clamber back up to shaky legs, taking your seat again as you clean yourself off.");
	output("\n\nHer voice is shaky when she finally speaks. <i>“Ah... That’ll do nicely, [pc.name] Steele. Feel free to make good on that discount whenever you’d like.”</i>");
	output("\n\nHonestly, you’d almost forgotten about it.");

	flags["ZEA_DISCOUNT"] = 1;
	zea.sellMarkup = 0.75;
	pc.exhibitionism(2);
	pc.orgasm();

	addButton(0, "Next", zeaApproach, false);
}

public function zeaPenetrated():void
{
	clearMenu();
	clearOutput();
	showZea(true);
	processTime(15+rand(16));
	
	var exhibLow:Boolean = pc.exhibitionism() < 33;
	var exhibHi:Boolean = pc.exhibitionism() >= 66;
	
	output("A predatory grin stretches across Zea’s face and she stands, leaning across the table and raising her tail, before beckoning you to stand. And stand you do, taking the initiative to circle back around the table to stand behind her,");
	if (!pc.isCrotchExposed()) output(" shrugging off your " + (pc.isCrotchExposedByArmor() ? "lower garments" : "armor") + " and");
	output(" taking her tail in one hand to better angle it for penetration. " + (exhibLow ? "You’re a little nervous at being in such a public location, but shrug it off" : (exhibHi ? "You’re already rock hard at the prospect of doing this in such a public space," : "Really, the public location is turning you on a little,")) + " and you waste no more time, pressing the head of your [pc.cock] against her spreading, golden pussy.");
	output("\n\nShe nods, and you push yourself in, groaning in delight as you discover the ribbed interior of her passage, perfectly designed to squeeze and stimulate any phallus within it.");
	output("\n\nUnlike the rest of her, there’s no residual stickiness in her tunnel, the Xhelarfog’s natural adhesion presumably counteracted by the steady flow of girlcum washing over your cock. Zea looks back over her shoulder, as if to ask why you’re not moving, so you pull almost all the way out, before thrusting back in again, harder this time. It’s her time to let out a pleasured moan, her head falling down to the table, horns clicking against its hard surface, as you continue the rhythm. Long, masterful strokes in and out and in again drawing both noises of pleasure from the two of you and a small audience, as some of the Raskvel at other tables cease their chattering, watching you. A few of them have at least one hand under the table, probably masturbating.");
	if (exhibHi) output(" Hot!");
	output("\n\nYour pace is slow at first, not wanting to rush either of you to a premature orgasm, but watching Zea squirm under you makes you <i>need</i> more, speeding up your pace until you’re pounding her hard enough to rock the table beneath you. Her tail jerks and spasms, pressing against your pelvis for more contact, and you seize hold of it with both hands to keep it steady, playing with her clits with each thumb.");
	output("\n\nThe both of you are panting hard, Zea with barely enough breath to let out her pleasured screams, but manage she does - your audience letting out cheers and whoops of delight.");
	output("\n\nIt’s not much longer until her ribbed passage contracts around you as she cums, you not following far behind as you thrust in deep, coating her insides in your [pc.cum].");
	output("\n\nYou stay like that for a while, both of you taking your time to recover. But recover you do, pulling out of Zea’s cute tail-pussy, your mixed fluids pooling on the floor beneath you. She passes you a handful of napkins, and you dutifully get to work, wiping up");
	if (pc.cumQ() >= 2000) output(" as much of the mess as possible");
	else output(" the mess");
	output(", before");
	if (!pc.isCrotchExposed()) output(" pulling your " + (pc.isCrotchExposedByArmor() ? "lower garments" : "armor") + " back on and");
	output(" returning to your seat.");
	output("\n\nYour lover reaches beneath the table, pulling up a few pills that she swallows down with help from a bite of her almost forgotten meal.");
	output("\n\n<i>“I’m on vacation - not interested in dealing with eggs.”</i> She says, answering any question of the function of what she’s taken.");
	output("\n\nYou nod in understanding before she starts speaking again. <i>“Feel free to make good on that discount whenever you’d like.”</i>");
	output("\n\nHonestly, you’d almost forgotten about it.");

	flags["ZEA_DISCOUNT"] = 1;
	zea.sellMarkup = 0.75;
	pc.exhibitionism(2);
	pc.orgasm();

	addButton(0, "Next", zeaApproach, false);
}