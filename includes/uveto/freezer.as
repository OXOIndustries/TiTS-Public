public function showHana(asNude:Boolean = false):void
{
	author("Magic Ted");
	showName("\nHANA");
	showBust(!asNude ? "HANA" : "HANA_NUDE");
}

public function approachHana():void
{
	if (flags["MET_HANA"] == undefined)
	{
		approachHanaNotMet();
	}
	else
	{
		approachHanaMet();
	}
}

public function approachHanaNotMet():void
{
	flags["MET_HANA"] = 1;

	clearOutput();
	showHana(false);

	output("You’re in a tavern; what’s there to do but bum up the barkeep for a drink and a chat? Making your way over, you sidle up");
	if (pc.isTaur()) output(" beside");
	else output(" onto");
	output(" a stool and give the working barkeeper a cordial nod while looking her over. The fluffy fur on her tastefully curvy body gives her away as one of the local color immediately, not that you expect otherwise, while the few strands of gray besmirching her hairdo is an obvious outlier of her age.");
	
	output("\n\nThe raven haired woman is drying a mug with a thick looking cloth, an expression of thinly veiled dour apathy hanging on her face as you approach. Ouch. It takes her a moment to realize she doesn’t quite recognize you, leading to the two of you giving each other a once over - and allowing you to realize she has an eyepatch, mostly covered up by a dangling bang. Huh. Finally, the cold-acting woman grunts.");
	
	output("\n\n<i>“Welcome to the Meadhall, traveler. We’ve got drinks and a fire, but I’m sure you’ve got that figured out for yourself. If there’s something you need, feel free to ask.”</i> Her tone is impressively terse and quick spoken; she isn’t the bubbly, gregarious sort you’ve come to expect from your barkeeps.");
	
	output("\n\nThough you didn’t catch her name.");
	
	output("\n\n<i>“It’s Hana. Do you need something?”</i> Hana repeats, sounding mildly irritated. Definitely not the gregarious sort.");

	clearMenu();
	addButton(0, "Next", approachHanaMet);
}

public function approachHanaMet():void
{
	clearOutput();
	showHana(false);

	output("You’re standing before Hana, whom is working the bar. A huskar like most of the locals, she’s surprisingly tall and willowy in stature despite her older, maternal appearance, making her curvy waist line and immodest bosom subtle in her silhouette. Beyond her mere figure the woman is raven haired, the black strands framing her head in a bob cut with a bang hanging across the side of her face, concealing the black, simplistic eyepatch over her right eye in the process. The usual ausar fur lines her arms and, you presume, her legs - though you can’t see the latter through the bar.");
	
	output("\n\nUnlike typical ausar, though, she also has furr puffing up around her neckline as if she is wearing a particularly fluffy scarf or shawl, given her huskar nature. All of the fur is black, but you can see a few aging gray strands stand out both in her hair and fuzzier fur. To accentuate this, or simply to avoid being <i>too</i> warm, the beige, cozy and body hugging wool sweater she wears opens in the chest, though where there’d be cleavage on any other woman lies a massive puff of fur overshadowing it");
	if (pc.isBimbo() || pc.isBro() || pc.LQ() >= 75 || (pc.lust() > pc.lustMax() * 0.75)) output(", disappointingly");
	output(".");
	
	output("\n\nHana is certainly the older sort, giving off a maternal sort of vibe from her appearance. However, her terse acting, unsmiling demeanor goes against the body image. As you’re eyeballing her she’s quietly watching you in the corner of her single eye as she otherwise works, cleaning mugs out with a thick looking cloth that hums with some technological purpose. While the barkeep is certainly waiting to serve you, it doesn’t look like she’s about to say something first.");

	hanaMenu();
}

public function hanaMenu(disableFlirt:Boolean = false):void
{
	clearMenu();
	addButton(0, "Get Drink", hanaDrinkMenu);
	addButton(1, "Talk", hanaTalkMenu);

	if (disableFlirt) addDisabledButton(2, "Flirt", "Flirt", "Better not push your luck....");
	else
	{
		if(pc.lust() >= 33) addButton(2, "Flirt", hanaFlirt);
		else addDisabledButton(2, "Flirt", "Flirt", "You’re not aroused enough for that!");
	}

	addButton(14, "Back", mainGameMenu);
}

private var HANA_DRINKS:Array;

public function hanaDrinkMenu():void
{
	clearOutput();
	showHana(false);

	output("<i>“Well, I wouldn’t mind a drink.”</i> You quip, leaning against the wood stained bartop expectantly.");
	
	output("\n\nHana merely nods her head and lifts a hand away from her rag to tap at some interface hidden away beneath the bar, silently. Your codex chirps soon after with the menu - after a brief permission prompt, anyway. It’s surprisingly robust, so much so that you spend a good minute or so just flicking through the multitude of menus. Some of it also gets prohibitively expensive, too, but you’ve come to expect that with some esoteric vintages. Quietly you narrow down the listings in your head, ready to make an easy order.");

	clearMenu();
	
	if (HANA_DRINKS == null)
	{
		HANA_DRINKS = [
			{ id: "mead",   btn: "Mead", th: "Mead", tt: "Why wouldn’t you have mead in a meadhall?", cost: 5, f: hanaDrinkMead, imbibe: 10 + rand(5) },
			{ id: "pblast", btn: "P. Blast", th: "Psionic Blaster", tt: "The local tourist flavor!", cost: 15, f: hanaDrinkPBlaster, imbibe: 20 + rand(5) },
			{ id: "dingo",  btn: "F. Dingo", th: "Frisky Dingo", tt: "It’s a pretty popular brand drink in ausar affiliated areas.", cost: 7, f: hanaDrinkDingo, imbibe: 5 + rand(3) },
			{ id: "pgame",  btn:" P. Game", th: "The Party Game", tt: "There’s a special ‘challenge’ at the bottom, some sort of party favor.", cost: 30, f: hanaDrinkPartyGame, imbibe: 30 + rand(5) }
		];
	}
	
	for (var i:int = 0; i < HANA_DRINKS.length; i++)
	{
		var o:Object = HANA_DRINKS[i];

		if (o.cost > pc.credits)
		{
			addDisabledButton(i, o.btn, o.btn, "You don’t have enough credits for this drink.");
		}
		else
		{
			addButton(i, o.btn, hanaRequestDrink, o, o.th, o.tt + "\n\nCost: " + o.cost + " Credits");
		}
	}

	addButton(14, "Back", hanaMenu);
}

public function hanaRequestDrink(o:Object):void
{
	pc.credits -= o.cost;
	processTime(15);
	pc.imbibeAlcohol(o.imbibe);
	o.f();
}

public function hanaDrinkMead():void
{
	clearOutput();
	showHana(false);

	output("There are a dizzying amount of options just for mead alone, but you end up just going with one of the simple, cheap varieties. Can’t get too special with mead - but you can’t go wrong, either. As you tap the screen to make your order, you jealously note that there’s quite a discount for local residents - it might as well be free!");
	
	output("\n\nBy the time you look up from your codex again the “busy” barkeep has already placed the pale-golden drink in front of you in a tall glass, complete with a little glass coaster. No sooner are you served, she’s back busily cleaning glasses and paying you little mind again, leaving you with nothing to do but relax and enjoy the smooth, easy going, honey sweet booze. There really is nothing wrong with going for mead.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function hanaDrinkPBlaster():void
{
	clearOutput();
	showHana();

	output("Flicking through the choices, you come across something particularly eye catching; one of the local flavors, ostentatiously some sort of tourist drink. You’re a tourist here, so why not? Tapping your codex, you immediately hear a dismissive huff from Hana across the bar as she gets to work on it. Must get a lot of tourists, then.");
	
	output("\n\n<i>“It’s nothing special. People hear about all the savicite around and how it has changed some of the creatures living out here, so they want to get in on it. Of course, not many people can actually survive the trip outside.”</i> Hana begins demurely, her tone sounding wooden and rehearsed. <i>“So it’s the ‘psi’ retreatment; it’ll mess with your head for a bit and then you’re perfectly fine. In reality it’s just a mild sedative mixed into the drink.”</i>");
	
	output("\n\nDrink might be a bit of an exaggeration; when she sets the glass down it’s little more than a shot, the novelty coaster it rests on feeling entirely unnecessary. Ah well, you’ve already bought it. Down the hatch!");

	clearMenu();
	addButton(0, "Next", hanaDrinkPBlasterII);
}

public function hanaDrinkPBlasterII():void
{
	clearOutput();
	showHana();

	if (!pc.isBimbo() && !pc.isBro())
	{
		output("For a brief moment you become woozy, your [pc.skin] feeling flush, particularly on your arms.");
		
		output("\n\nYour vision grows hazy, the warm lights of the bar and central fireplace superimposing over one another into a blurry, blinding mess. Shapes swirl in your eyes - no, in your head? You can barely parse it and soon you don’t have to, the swirling mess shifting away into a white, empty void.");
		
		output("\n\nDid you pass out?");
		
		output("\n\nNo, you can still feel the bar beside you and hear the banter of the bar patrons, though both seem somewhat distant. The odd aches of your body gradually disappear until everything is just... muted. It’s there, sure, but you can barely recognize any of the stimuli your senses register.");
		
		output("\n\nYour mind feels blissfully clear and empty. There’s no concern about the race against your cousin, about the consequences of your adventures, even drive to continue on.");
		
		output("\n\nNot right now.");
		
		output("\n\nIt’s just...");
		
		output("\n\nNothing. It’s nice. It’s also rather terrifying, though you don’t come to that conclusion until the effect starts to wear off.");
		
		output("\n\nA mixed feeling of both euphoria and nausea starts to overwhelm you, properly pulling you out of that drug assisted reprieve.");
		
		output("\n\nYou swallow the urge to retch, at least, and the world comes back into focus. <i>Whoa</i>.");

		// todo: debuff? -int & -ref
	}
	else
	{
		output("You feel fuzzy for a moment. A kinda weird itch in the back of your head, like you’re forgetting something. The feeling passes, though, and you’re left just sitting there.");

		output("\n\nWasn’t something supposed to happen? You don’t really feel any different.");
		
		output("\n\nLooking up to Hana with a quizzical expression you’re answered with a quiet, indifferent shrug.");
		
		output("\n\nUgh, what a rip off.");
	}

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function hanaDrinkDingo():void
{
	clearOutput();
	showHana();

	output("Frisky Dingo, huh? You’ve seen some of the ads around - it’s some mainstream brand coming from the ausar homeworlds. It’s popular, so why not?");
	
	output("\n\nTapping it in earns you a faint scoff from Hana just before she spins around on her heels, reaching at something in one of the lower cabinets. It gives you a brief glimpse at her skirt-clad rear. The");
	if (pc.isBimbo() || pc.isBro() || (pc.lust() >= pc.lustMax() * 0.75) || pc.hasCock() || pc.LQ() >= 75) output(" pleasing");
	output(" view lasts mere seconds before Hana hoists herself back upright, planting the chilled, bottle-sweat glistening order down in front of you with a prominent clink of glass-on-glass.");
	
	output("\n\nThe colorful caricature of a dog greets you on the labeling. Hana is gracious enough to pop off the archaic tin cap with a bottle opener for you before getting back to her barkeeping tasks, leaving you with your drink.");
	
	output("\n\nA swig later and the verdict is in. Shitty, painfully mediocre commercial beer. Not that you really expected anything else.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function hanaDrinkPartyGame():void
{
	clearOutput();
	showHana();

	output("One of the menu options is simply a picture of an empty mug and the listing of ‘the party game,’ with no additional information to speak of. Curious, you give it a tap and look up to Hana, expectantly, taking note of her brief surprise as she gets to work on the order.");
	
	output("\n\n<i>“Oh, you don’t know? Heh... it’s a local game, each day it’s a different mug filled with four or five different drinks on the menu. If you guess them all correctly and finish your drink you get a little prize. Just some money and fanfare, really. It’s a challenge made for alcoholics.”</i> The woman finishes with a wry smirk, planting a whole, frothing stein down in front of you. It’s... rather alarming. Even merely sitting it down rings out a challenging clunk of glass onto the coaster. The color of the drink is suspect, an off-amber from mixed pale and dark drinks. This might have been a mistake.");
	
	output("\n\nTentatively, you take a sip. Muted, mixed flavors all challenge one another for dominance across your taste buds, causing you to wince - and Hana to laugh. Yeah, this is definitely a mistake. It’s made for locals, people who have actually slurped their way through the menu over time. You realize about half way through the stein that some of these flavors are actually <i>pretty strong</i> and it’s hitting you hard. Some form of intrepid spirit keeps you sipping it down, though, and eventually you’re greeted with the bemused expression of Hana, albeit hazy through the bottom of the glass.");
	
	output("\n\n<i>“I’m not going to bother quizzing you on what was specifically in there, but can you guess how many drinks there were?”</i> She is looking pretty haughty, though you can’t really say how much what with your head screaming at you already.");
	
	output("\n\n... Maybe eight?");
	
	output("\n\n<i>“Just four, heh. Here, have some water. Pace yourself in the future, tourists stumbling around on the ice outside is bad for publicity.”</i>");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function hanaTalkMenu(lastF:Function = null):void
{
	clearMenu();

	if (lastF == hanaTalkIrestead) addDisabledButton(0, "Irestead", "Irestead", "You just talked about this.");
	else addButton(0, "Irestead", hanaTalkIrestead);
	
	if (lastF == hanaTalkRumors)
	{
		addDisabledButton(1, "Rumors", "Rumors", "You just talked about this.");
	}
	else
	{
		if (flags["HANA_TALKED_IRESTEAD"] != undefined && 9999 == 0) addButton(1, "Rumors", hanaTalkRumors, undefined, "Rumors", "The stories always have the intrepid hero go to the tavern for odd jobs and the lay of the land. You’re heroic enough.");
		else addDisabledButton(1, "Rumors");
	}

	addButton(2, "Eyepatch", hanaTalkEyepatch);

	if (lastF == hanaTalkRescue)
	{
		addDisabledButton(3, "Rescue", "Rescue", "You just talked about this.");
	}
	else
	{
		if (flags["UVETO_FROZEN_RESCUE_TO_BAR"] != undefined) addButton(3, "Rescue", hanaTalkRescue, undefined, "Rescuers", "Clear up just how you got back to the freezer.");
		else addDisabledButton(3, "Rescue");
	}


	addButton(14, "Back", hanaMenu);
}

public function hanaTalkRumors():void
{
	output("9999 STUB");
}

public function hanaTalkIrestead():void
{
	clearOutput();
	showHana();

	output("<i>“You want to know about the colony?”</i> Hana sounds a bit surprised, arching a brow over her one good eye. When you asked the first time she merely brushed you off, but it only took a bit of pressuring - you are genuinely interested, not just making small talk. Your honest enthusiasm earns you a response in kind from the barkeep, who purses her lips as she collects her thoughts.");
	
	output("\n\n<i>“Honestly, there isn’t too much to say. That’s... not </i>quite<i> true, clearly, but Irestead’s story is the same of a lot of backwater colonies, especially ones just hanging around for research and mining. It’s just cold. This place could be called the ‘capital’ of all of Uveto, but functionally that’s more the station. Still, it’s the heart of the colonial network. But... you could get any of that from a news article, couldn’t you?”</i> The barkeep pauses, looking thoughtful again. Doesn’t look like she plays tourist guide often.");
	
	output("\n\n<i>“Before Rhenworld got involved this was all just a lackluster research station, really. Once someone found out there was money under the ice, well. Things changed. Suddenly there’s a reason to make sure we’re all cozy, happy and wanting to invite friends. Living conditions got better, the streets got heaters so it wasn’t just ice slabs all the time. It got... well, comfortable isn’t really </i>right<i>, but certainly hospitable. You can actually go outside. Heh, most colonies are just a big, parked freighter loaded with crap and a prayer that it can take off ten years later.”</i>");
	
	output("\n\n<i>“Despite that, it’s... listen, I’m pretty cushy with this bar. I could sell it - or get someone else to run it, anyway - and live in a resort in the core worlds if I really wanted to. Most of the people here are just manual labourers, roped into a job out of some trade school or other. Laborers working beside the machines - or technicians, if they actually came from higher education - trying to make a decent pay cheque. It could be better, sure, this is a </i>rush<i> after all. But it could be a lot worse, too.”</i>");
	
	output("\n\n<i>“Although I could </i>really<i> do without the Stormguards.”</i> Hana grunts, finally finishing and, unceremoniously, going back to her mug cleaning. It doesn’t look like she intends to embellish anymore, particularly about anyone specific.");

	flags["HANA_TALKED_IRESTEAD"] = 1;
	processTime(15);

	hanaTalkMenu();
}

public function hanaTalkEyepatch():void
{
	clearOutput();
	showHana();

	output("Hana is a pretty big woman nestled deep in a bar of local regulars who would all gladly come to the aid of a friend, no matter the situation. It’s a dangerous prospect, but your curiosity knows no limits; you measure up some volume of tact and, gently, inquire about her eyepatch.");
	
	output("\n\nThe immediate response puts you on edge; Hana tenses up, the hand wrist-deep in the mug freezing up. Her one eye narrows, the hazel hue becoming a dagger-like squint. It might be your imagination, but you swear some of the rowdy banter between the patrons quiets down, too. But that had to be coincidence, no way they could hear you, could they?");
	
	output("\n\n<i>“My eyepatch.”</i> Hana repeated, the tension growing as the woman gently places the mug down on the counter top with a heavy thunk. Maybe this was a bad idea, though with the barkeep leaning forward, both hands firmly on the bar, it is far too late for second thoughts.");
	
	output("\n\n<i>“This... this was </i>my<i> reward for somebody else’s mistake. From someone playing hero - and</i> failing<i>. It came when my dear husband got himself killed trying to save someone else.... I don’t want to </i>talk<i> about it, traveler.”</i> Her tone is gravelly, stern with the unmistakable harsh edge of somebody speaking through gritted teeth. A sore subject, obviously. <i>“I am haleogentic. I can’t ‘fix’ it. I don’t </i>want<i> to fix it. Don’t ask about it again.”</i>");
	
	output("\n\nSurprisingly, the ausar woman softens pretty quickly afterwards. Her glowering stare shifts into something that looks more... sad. Somber? It sounds like you dredged up a pretty sordid memory, unfortunately, so that isn’t much of a shock. Glumly, Hana snatches the mug back up and you take the cue to leave her in peace for a while, citing an apology as you backpedal right out of the mess you’ve just caused.");

	flags["HANA_TALKED_EYEPATCH"] = 1;

	processTime(10);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function hanaTalkRescue():void
{
	clearOutput();
	showHana();

	output("Come to think of it, who - or what - brought you back to the meadhall in the first place? You’re rather thankful to avoid the whole, you know, freezing to death on some random snowball of a world schtick. And the recuperation, but never mind that.");
	
	output("\n\nHana’s prickly demeanor shatters with your follow up quip as she barks a laugh, lips turning upwards in a wry smile that just <i>screams</i> “you cheeky git.” Still, she doesn’t respond immediately, leaning back to glance around the rather voluminous bar, ostentatiously to point someone out to you - and coming up empty, it seems. Oh well.");
	
	output("\n\n<i>“One of the rangers. They’re a group employed by the local authority and, really, make up the core of it. Bunch of lone ‘wolves’ that patrol the colony outskirts to make sure none of the natives wander into town. They also quietly keep track of people wandering out, especially random tourists. It would be pretty bad publicity for our ‘corporate overlords’ if one of our visitors were to freeze to death, after all.”</i>");
	
	output("\n\n<i>“If you want to give them your well wishes you could try hanging around here for a while- most of them usually like to spend a few hours in here once they get back to town.”</i>");

	processTime(10);
	hanaTalkMenu(hanaTalkRescue);
}

public function hanaFlirt():void
{
	clearOutput();
	showHana();

	if (flags["UVETO_FROZEN_RESCUE_TO_BAR"] == undefined)
	{
		output("Time to give her the Steele treatment. No one");
		if (silly) output(" over the legal age and of sentience");
		output(" can resist the Steele treatment! Leaning against the bar, you’re all smoldering smiles as you push the suave up to eleven, giving the terse, older woman a smooth <i>“Hey.”</i> Really, you don’t need to put a lot of effort into it, everyone is pretty sexually frivolous these days.");
		
		output("\n\n<i>“No.”</i> Hana responds, flatly.");
		
		output("\n\nWait, hey! You haven’t even <i>started</i> yet, not properly! Despite your brief whining the barkeep doesn’t pay you any mind, continuing her work as if you hadn’t said a word.");

		hanaMenu(true);
	}
	else
	{
		output("<i>“Hey.”</i> You begin, lamely, leaning against the bar. <i>“I can’t help but notice it looked like you enjoyed yourself before, when I was out of it...”</i>");

		output("\n\nYou catch Hana by surprise, her mug-cleaning hand going still as an eyebrow perks upwards, questionably.");

		output("\n\n<i>“It’s just, you know. Neither of us got off... and that doesn’t seem like much of a returned favor to me, you know?”</i> Rapping your fingers along the bartop, you trail off and simply smile. A smile that, quite quickly, gets mirrored by the prickly barkeep.");

		if (!pc.isBiped())
		{
			output("\n\n<i>“Nope.”</i> She chuckles, despite that lively expression. <i>“I’m afraid I like my partners with");
			if (pc.legCount > 2) output(" just the");
			output(" two legs, thanks.”</i>");

			output("\n\nOh...");

			hanaMenu(true);
		}
		else
		{
			output("\n\n<i>“All right.”</i> Hana didn’t have to think it over very long, setting her glass and rag down to, instead, lean forward much like you are. Rather close, now!");

			output("\n\n<i>“And just what do you have in mind, traveler? I’ll be rather cross if it doesn’t involve </i>returning<i> the favor.”</i>");
			if (silly) output(" Awh yeah, looks like this is happening.");

			clearMenu();
			if (pc.hasCock() || pc.totalVaginas() > pc.blockedVaginas()) addButton(0, "Backroom", hanaSexBackroom, undefined, "Backroom", "You could ask Hana to invite you into the private backroom of the bar for some perfectly vanilla frisky business.");
			else addDisabledButton(0, "Backroom", "Backroom", "You need genitalia to bang the huskar MILF!");

			addButton(14, "Back", hanaMenu);
		}
	}
}

public function hanaSexBackroom():void
{
	clearOutput();
	showHana(true);

	output("<i>“The backroom, huh?”</i> Hana starts, turning her head to glance to that auspicious doorway breaking up the menagerie of bottles on display. <i>“Yeah, alright. That’ll work, just don’t lean too hard on any of the boxes in there.”</i>");
	
	output("\n\nWhy would you when you’ve got her! There’s smirks all around as you");
	if (pc.RQ() <= 66) output(" heft yourself");
	else output(" effortlessly sail");
	output(" over the bar and behind the motherly ausar woman, bouncing your waist into her skirt-bound backside playfully - and to prompt her to hurry up!");
	
	output("\n\n<i>“Okay, okay!”</i>");
	
	output("\n\nWhile it’s hard to look away from the beautiful - if scarred - woman you’ve been promised now you still take a curious moment to glance around the dimly lit back area. As you might expect, it’s mostly crates and kegs stacked in neat, shallow piles here and there, with an entire corner of the room invested to the cargo lift that presumably leads upwards into the ‘attic’, which Hana uses as a warehouse of sorts. A booze warehouse. That’s a mighty fine warehouse, as far as theoretical warehouses go. All in all it looks pretty clean, so it’s perfect for an illicit rendezvous!");
	
	output("\n\nLooking back to Hana she has her back to you, still, and has pulled her cozy, snug sweater off of herself, huddling the garment in her arms in some brief allusion to cuffs, revealing her smooth backside to you, uncovered except in the natural tufts of collar-fur and the rear hook of her black, simplistic looking bra. What is more eye-catching than any amount of physical beauty, however, is her hesitance; Hana is frozen in place, clutching her sweater in tight fistfuls with her head half-turned toward you, yet her expression looking downcast. It doesn’t seem like her heart is in this, that much is obvious.");
	
	output("\n\nBefore you can say anything, though, Hana speaks with a low, somber tone. <i>“Hey. I don’t... I don’t mind any of this. But... don’t kiss me, alright? Never even try.”</i> There is a melancholic weight to her words, some obvious leftover baggage in her life.");
	
	output("\n\nWell, that’s fine. You can understand that; no kissing, nothing overly affectionate or romantic. Just sex. Despite that resolve, you still find yourself moving up behind her and cradling her waist with a comforting squeeze. Watching her apprehension wash away into a thin, thankful little smile is enough of a reward.");
	
	output("\n\nBut sex is pretty good, too.");

	clearMenu();
	addButton(0, "Next", hanaSexBackroomII);
}

public function hanaSexBackroomII():void
{
	clearOutput();
	showHana(true);

	output("<i>“Whoa now! I haven’t done this in a little while now, let’s slow down!”</i> Hana scolds, yet her tone and grin betray her indifference, let alone the hands squeezing your sides.");
	
	output("\n\nTwo bare naked individuals sprawled out on a cushioned mat, the plastic-like plush an easy comfort as opposed to the hard floor or a crate. You’re overtop her, your [pc.thigh] wedged against her moistening muff firmly as you take in her body and she your own.");
	
	output("\n\nThe woman holds up just fine with her middle-age, though she doesn’t hold any surprises beneath her unfortunately <i>mundane</i>, conservative outfit. Unbound, her busty chest pools naturally across her chest, while the fur sleeves of her legs tickle along your exposed self. Her body is fairly fit, still, befitting of someone who hauled around boxes of booze, kegs and most likely people, too, as a profession.");

	if (pc.hasCock() || pc.hasHardLightEquipped())
	{
		var isHardlight:Boolean = false;

		if (pc.hasCock() && pc.isMasculine())
		{
			output("\n\nHana practically chirps when you got down to business and even now, with you grinding your [pc.thigh] against her she has her palm squeezing into the [pc.cockhead], teasing it with her fuzz-gloved fingers and getting a curious feel for it all");
			if (pc.cocks.length > 1) output(" while dutifully ignoring the rest of your [pc.multiCocks]");
			output(".");
		}
		else if (pc.hasCock() && pc.isFeminine())
		{
			output("\n\nHana sighs in relief when you reveal that, despite appearances, you’re still packing heat. Despite that, though, while grinding into her muff she is still rather apprehensive about squeezing your simulated cockhead, kneading her fuzz-gloved fingers into it experimentally. Turns out she’s pretty heterosexual, but - as she reminds you - this isn’t about romance.");
		}
		else
		{
			isHardlight = true;
			output("\n\nWhen you shimmy out of your clothing it’s pretty clear to see Hana’s disappointment, though she gets pretty sheepish when you ask her about it. The woman identifies pretty strongly on the heterosexual front, she was hoping for something phallic.");

			output("\n\nHey, you could oblige! Delighting in her brief confusion, you lean to the side and snatch up your [pc.lowerUndergarment] again, slipping it back on. You probably look like a mad[pc.manWoman] as you tap at your groin, but it’s well worth the surprised squeak from the huskar once that hardlight appendage bursts forth from your groan with a brief <i><b>bweem</b></i>. It takes a moment for the nerves in the strap-on to sync up with your body, leaving you shuddering as the idle drafts of the room wash over your new found sex-stick. Of course, Hana herself has no idea, so the woman just brazenly grabs at the rounded tip, squeezing it in her palm as her fingers splay down the firm length, taking you completely by surprise. A pleasant, squeaky surprise! It looks like this’ll do <i>just</i> fine.");
		}

		output("\n\nShifting leisurely, you drive your length along her smooth, just-cushy abdomen,");
		if (!isHardlight && pc.smallestCockLength() > 9)
		{
			output(" easily prodding into her plush bosom with lazy, idle humps.");
		}
		else
		{
			output(" swaying along her belly as you shake your hips with each thigh-hump.");
		}
		output(" All the while she squeezes along the shaft, kneading into it with her palm and just <i>enjoying</i> the petty sensation beneath her fingertips");
		if (isHardlight) output(", despite lacking the warmth and liveliness of a proper flesh-and-blood prick");
		output(". Letting Hana have her fun, you wait until she finally starts to shove at your waist with an impatient huff, giving you one last squeeze before the main event. Naturally, you’re quick to oblige.");

		output("\n\nYour middling foreplay brings you both to readiness is short order, so all there is to do now is tease the woman’s entrance with shallow little humps, driving your");
		if (isHardlight) output(" faux-cock");
		else output(" [pc.cockHead]");
		output(" along her yielding labia until gradually the end is dampened with her arousal and an irritated, pent-up ausar is kicking you with her thigh. Penetration follows the same sort of motions, save when you’re pushing forward with your waist in constant gyrations, you don’t immediately pull back this time. Her cunny spreads with modest resistance, a high pitched, surprisingly vulnerable noise escaping the no-nonsense woman’s throat, her body shuddering along the mat and legs squeezing onto you as you sink in more and more.");

		output("\n\nYour pace is gradual, focused more on driving yourself further and further into her hungering gash");
		if (!isHardlight && pc.smallestCockLength() > 9) output(" until you encounter that natural barrier, causing the woman below you to tense up in discomfort from the mere touch. Looks like you won’t be stuffing it all in this time.");
		else output(" until your waist collides firmly with her own, mashing until both are flush together.");
		output(" It doesn’t take very long for her to get used to the feel, but you still proactively take the time to start squeezing and playing with her exposed bosom, digging your fingers into the plush, malleable tit-flesh to further hitched gasps and weak, restrained moans.");

		output("\n\nNow that you feel that sloppy cunt squeezing around your length you start humping, leisurely drawing your waist back and forth in slow, albeit powerful and thorough thrusts. Based on her reaction, that melting expression and her thighs squeezing around you it’s the correct choice! You’re not sure how effective it is, but Hana even goes as far to press her hand on her belly, squeezing down as if to rub your");
		if (isHardlight) output(" toy");
		else output(" prick");
		output(" through her body. Still, even if it’s not doing anything the rest of her has got you snuggly wrapped in a vice-like grip, sending little trickles of her cunny-honey down onto the mat each time you pull back.");

		output("\n\nA mounting orgasm urges you into picking up the pace in a feral, instinctive manner, though with Hana as wound around you as she is it’s honestly quite hard! As composure slips away from you there isn’t much else you can do but cling to the woman tightly, groaning as your brain goes fuzzy in that perfectly blissful, familiar way.");
		if (isHardlight)
		{
			output(" You might not have the proper equipment to orgasm as her body expects, but you still cling to her as [pc.girlcum] flows into your [pc.lowerGarment] liberally.");
		}
		else
		{
			output(" Your prick twitches with each wad of [pc.cum] shooting into her,");
			if (pc.cumQ() <= 500) output(" staining her walls with the spunk callously.");
			else if (pc.cumQ() <= 1000) output(" pumping into her before the amount gradually recoils down your [pc.cock], squirting out around her squeezing labia and pooling along the matt.");
			else
			{
				output(" blowing a geyser of [pc.cum] within her, enough that quite soon the barkeep, despite her orgasmic high, gently starts to swat at you with weak fists, her belly expanding as the utter surge begins to pool in her very depths, while most of it surges out around you both and pools along the matt in a quantity that’ll need a goddamn mop.");
				if (silly) output(" As usual, you’ll, uh, probably cut out before that responsibly rears its head.");
			}
		}
	}
	else
	{
		var p:int = pc.pickUnblocked();
		output("\n\nWhile Hana is a little disappointed when you reveal your [pc.vaginas] in full, admitting she’s a lot more heterosexual than not, you’re making up the difference. You liberally grind your thigh into her, twisting your leg side to side as you bounce and grind on her own, leaving a little sheen of [pc.girlCumNoun] along it, just shy of her natural, fuzzy stocking. Tentatively, not wanting to rush something she wasn’t entirely comfortable with, you plant your hands along her plush bosom, teasing your fingers along the sensitive titflesh and drawing your palm into those teats - nipples that were probably used for their proper purpose once before. Her one good eye widens at the touch, mouth fluttering open in fish-like little gasps before she merely breaks down into a trembling mess beneath you, buttons well pressed. Such a serious face got all mushy in short order... you can’t help but titter at her expense. Still, as nice as her thigh flesh grinding along your [pc.clit] in particular feels lovely, it’s barely the main course.");
		
		output("\n\nGrunting, you shift, dismounting that thigh and instead scooting beneath one of her legs, interlocking together. Hana looks a little out of it, her brows furrowing together in confusion as you start working - only to go right back to melting pleasantly as you mash your [pc.pussy " + p + "] into her own. While she might not be experienced in the fine art of tribbing, she still curls her thighs around your legs and pulls you closer, rolling her waist to grind and rub against your own, similar movements, filling the room with sloppy wet mashing as two pussies come together time and time again. On occasion you flick your hips to the side just so, banging your [pc.clit] into her modest bean and drawing a squeal of pleasure from both of you. When your thighs bang together it comes out as a girl-honey mess, though you can feel a little pool form on that mat just below your bottom.");
		
		output("\n\nBreaking the monotony, you yank on both of the other woman’s legs under your arms and squeeze them into you, sharply, dragging the curvy ausar into you firmly. Her counter attack is arguably more effective, though, as she swings a hand haphazardly in front of her just to land between those pressed-flush pelvi, fingers immediately clamping down on your clit. With treatment like <i>that</i> it doesn’t take you very long at all to reach your peak, while Hana is pent enough that the different doesn’t really matter. The backroom echoes the cacophony of your combined cries as you both pop, you leaving Hana’s waist and mat a mess of [pc.girlCum].");
	}

	output("\n\nIt takes you a solid minute to recover, though in that time Hana gathers you up in her arms, resting your face along her bust in a mixture of maternal nature and less platonic affection, despite what she said going in. Responding in kind you squeeze her waist and shake your hips into the ");
	if (pc.hasCock() && pc.cumQ() > 1000) output("im");
	output("modest mess you’ve made together. After a moment, though it’s hard to hear between mutual panting, Hana murmurs a soft, delicate <i>“Thank you.”</i>");
	
	output("\n\nThe moment doesn’t last. She recovers composure and gently");
	if (pc.hasCock() && pc.hasKnot()) output(", after your [pc.knot] deflates,");
	output(" pushes you off herself and back up right, still suffering under her baggage. Still, she certainly enjoyed herself and you’re proud to have helped someone, especially after she ‘revived’ you. There’s no lingering regret as you gather your things again and Hana exchanges you a warm smile as you slip out, leaving her to come to terms with your quickie");
	if (silly) output(" - and, more importantly, clean up!");
	else output(".");

	if (flags["FUCKED_HANA"] == undefined) flags["FUCKED_HANA"] = 1;
	else flags["FUCKED_HANA"]++;

	processTime(20+rand(5));
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function hanaFiresideRecovery():void
{
	clearOutput();
	showHana(false);

	if (flags["UVETO_FROZEN_RESCUE_TO_BAR"] != undefined)
	{
		output("This sort of feeling is becoming unfortunately familiar, though it’s better than the alternative. You groan weakly, a sense of paradoxically blissful yet uncomfortable heat washing over your body, enough that you can feel the clammy sensation of sweat dotting around your features here and there. Gradually you fight off that looming sense of delirium as you come to, shifting with aching creaks of tensed up muscle. Above all else that’s what you feel; achy, all over. Still, it doesn’t take long for you to recall what had happened, nor where you were yet again. Really, it’s a repeat entirely!");
	}
	else
	{
		output("Some religions say that the afterlife is a comfortable place, something conceptually different from life itself where you might recline in blissful nothingness, awaiting your next go at things.");
		
		output("\n\nDimly, you think that must all be hogwash because right now you’re feeling altogether uncomfortable; the first thing you’re consciously aware of is the heat sweltering down on your body, something your instincts start to gradually realize ought to be <i>dangerous</i>, as though you were right next to something burning!");
		
		output("\n\nAs your brain reconnoiters with the rest of your senses one by one, you hear the roaring and crackling of flame beside you - yet despite your sense of danger kicking into overdrive, you can barely work the effort to tug your eyelids apart. A heavy fatigue is overwhelming you, every minute portion of your body <i>aching</i>, yet not overtly in pain. The sort of ache that you just wanted to sprawl out and groan over like a useless lump, not the kind that would have you clutching your side and mewling pathetically for help. The afterlife fucking sucks.");
		
		output("\n\nDespite feeling like an unmoving lump, you must’ve been stirring somewhat as you gradually came to as you hear a husky giggle beside your ear. Someone is beside you... while you were next to a fire?! Some assailant?!");
	}

	output("\n\nWith a resolute grunt, you pry your eyes open - and immediately regret it. It is bright! Can we go back to that murky, unconscious blackness now? The sudden stimuli bangs in the back of your mind, making your head start to throb.");
	if (flags["UVETO_FROZEN_RESCUE_TO_BAR"] != undefined) output(" Once again y");
	else output(" Y");
	output("ou see a smiling silhouette of a woman laying beside you - you were laid out? - leaning against your side, pressing into you.");

	if (flags["MET_HANA"] == undefined)
	{
		output(" It is one of the Uvetan locals, an attractive, if mature looking woman with a severe expression brought on mostly in part from her hair-concealed eyepatch. When your eyes catch her own her thin smile grows, feeling just as warm as the roaring fire pit lingering beside you both. Black hair, a plump chest - which is currently pressing into your arm - made for an attractive, if matronly, woman.");

		output("\n\nWhere are you, anyway?");
		
		output("\n\n<i>“Welcome to the Meadhall, traveler. Looks like you’re just another idiot tourist running outside, huh?”</i>");
		
		output("\n\nThat’s pretty harsh for someone who’s smiling, still! Ouch!");
		
		output("\n\n<i>“I’m Hana. Let’s not make this a thing, alright?”</i>");
	}
	else
	{
		output("\n\nIt’s Hana! You must be in the Meadhall, then - and this must be the primary use of that big firepit in the middle of it, too.");
		
		output("\n\nGroaning again, you try to shift and squirm in place, not yet feel up to the task of doing... well, much of anything. So, instead, you look to the matronly Hana, who’s thin smile has started to bloom outwards as you come fully back to consciousness. Ugh. At least your arm is feeling pretty nice, mashed against her plump bosom as it is.");

		if (flags["UVETO_FROZEN_RESCUE_TO_BAR"] == undefined)
		{
			output("\n\n<i>“Why hello there, traveler. I don’t mind customers coming in, but make sure you get a drink at some point, too.”</i>");

			output("\n\nFrom what little you know of her already, even this simplistic teasing is pretty out of character for her! Where is the prickly growling and negative attitude? It is a little scary, especially considering you found yourself helpless in her care. She isn’t a masochist, is she?");
		}
		else
		{
			output("\n\n<i>“Welcome back, traveler. This is supposed to be a one time thing, you know. Before you learn some actual pattern recognition.”</i> Hana’s tone is a bit gravelly, her mild irritation obvious. Sorry, Hana!");
		}
	}

	if (flags["UVETO_FROZEN_RESCUE_TO_BAR"] == undefined)
	{
		output("\n\n<i>“Now... I’ve developed a bit of a technique to revive people who have been found out there in the snow and ice, chilly and frostbitten. After you go to the hospice, anyway. You just have to get the blood pumping,”</i> Hana murmurs, narrowing her eyes in a manner both seductive and mischievous - more so the latter.");

		output("\n\nGradually coming to, you start to realize you feel something strange down below, where the barkeep’s arm just so happens to be disappearing from the edge of your vision toward. Ah.");
	}
	else
	{
		output("\n\n<i>“Now... I wonder if this’ll work again? Of course it well, of course...”</i> She murmurs teasingly, yet with an underlying hint of judging malice, just to be playful. Once again the barkeeper’s arm is resting along your abdomen, ‘exploring’ down below.");
	}
	
	if (pc.hasCock())
	{
		output(" Her hand nonchalantly squeezes at your [pc.biggestCock], grinding her palm into the side of that fully erect, twitching appendage.");
	}
	else if (pc.totalVaginas() > pc.blockedVaginas())
	{
		output(" The fuzzy digits of her fur-gloved hand dip into your awaiting [pc.cunt " + pc.pickUnblocked() + "] lazily, drawing up your already liberal juices.");
	}
	else
	{
		output(" Really reaching down, a finger probes and pumps into your [pc.asshole], occasionally wiggling around for that extra bit of sensation.");
	}
	output(" Dimly, you come to the realization she’s been at this for a while!");

	output("\n\n<i>“Starting to wake up? Come on... don’t you want to do something else?”</i> Hana leans in, her face swallowing up the whole of your vision. The bright glow of the churning bonfire beside you makes her features dance in constantly shifting light, while the hand at your genitals presses in all the more, just adding more to the pile. If her angle is to overstimulate you until you bolt upright, well, it might just work! You <i>see</i> your arms begin to shift beside her, though they’re still pretty numb and unfeeling, while the world canters back and forth as your back writhes along the uncomfortably firm bench. You’re definitely getting there!");

	output("\n\nAll the while, Hana keeps up her work.");
	if (pc.hasCock())
	{
		output("\n\nHer fingers squeeze along your girth as her palm grinds along the length of it, making milking motions as if it is a cow’s udder. Each motion stops just shy of your [pc.biggestSheath] yet also perilously close to your sensitive [pc.biggestCockHead], though in either case the husky ausar isn’t a perfect automaton, going beyond both - or, more often, further away. Wet, squelching sounds are hard to hear over the roaring din of the roasting pillar of fire, yet ever so often you can make them out through the crackles of flame, particularly whenever her fingers go across some blemish of feature of your prick. She must’ve lubricated herself before hand, but with those fuzzy hands you’re not sure she had to!");

		output("\n\nYour caretaker isn’t taking a particularly lively pace but, instead, a slow, methodical one, not entirely concerned with actually getting you off. It’s a lazy Sunday sort of handjob, one that you grow to enjoy more and more as time goes on.");
	}
	else if (pc.totalVaginas() > pc.blockedVaginas())
	{
		output("\n\nThe two fingers burrowing into your snatch flex and bow along your [pc.girlCum] lined walls, the slick muscles of your cunt constantly contracting and squeezing around those invaders naturally. Hana’s motions ultimately never really seem to stimulate you much more than this, not actually trying to get you off - yet on occasion her fingers spread, making a scissor motion deep within you, or her unused thumb lazily teases along your [pc.clit] for that extra jolt of pleasure.");

		output("\n\nYou can feel little rivlets of [pc.girlCumNoun] ooze down between your legs more and more, while your waist occasionally flexes up into her hand, weakly and needily.");
	}
	else
	{
		output("\n\nThat one finger lodged into your bottom continues to pump liberally, occasionally curling inward to press sharply into the lining before getting right back to it. She isn’t trying to coax an orgasm out of you, though, but you can feel the wandering touch of her finger more and more as arousal starts to burn.");
	}
	output(" Your ascent back into consciousness is a subtle climb, the familiar tidings of sex-coaxed groans and squirms. Fingers squeeze into Hana’s back, yet you’re not sure when they got there. Awkwardly your legs stretch outwards and your back bows, rather cattily, before your thighs clench the invading hand with new found mobility.");

	output("\n\nAnd then, abruptly, Hana stops. H-hey!");
	
	output("\n\n<i>“You’re feeling better!”</i> she titters, suddenly sitting upright along the side of the bench. The “molesting” hand is quickly plucked away, instead unceremoniously wiping itself along the fuzzy lining of the blanket over you.");
	
	output("\n\nHuh? Blanket? Oh... you’re naked in the middle of the bar, a blanket is probably good. Though all this heat is getting pretty uncomfortable. Tempering your worked up arousal, you shift to make yourself passingly decent while looking up to Hana in a mixture of thanks and desire.");

	output("\n\n<i>“Get dressed.");
	if (syriAtFreeezer()) output(" Your friend was rather concerned about you, you know.");
	output(" Don’t let this happen again.");
	if (flags["UVETO_FROZEN_RESCUE_TO_BAR"] != undefined) output(" <b>Again.</b>");
	output("”</i> With that Hana wanders away, presumably to go back to her bar duties. As if she hadn’t just done anything at all - although the smile on her lips and whisk of her hips say otherwise. Ugh...");

	flags["UVETO_FROZEN_RESCUE_TO_BAR"] = 1;
	removeUvetoCold();
	pc.changeHP(pc.HPMax());
	pc.changeLust(33);
	pc.changeEnergy(pc.energyMax());
	processTime((4 * 60) + rand(30));

	moveTo("UVI R32");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}