// Cynthia at the Freezer
// Overview
// Solo content for Cynthia, one of the participants in the Biomedical gangbang and Dr. Lessau’s chief project manager.

// Added to The Freezer off business hours
public function cynthiaAvailableAtBar():Boolean
{
	return (!steeleBiomedBusinessHours() && !pc.hasStatusEffect("Cynthia Away"));
}
public function cynthiaAtTheFreezer(btnSlot:int = 0):void
{
	output("\n\n");
	if(!metCynthia())
	{
		output("You spot a massive furry cowgirl sitting at the bar, sipping at some fresh cocoa.");
		// [Cowgirl] Go to Introduction, remove and replace with Cynthia
		addButton(btnSlot, "Cowgirl", approachCynthia, true);
	}
	else
	{
		output("You see Cynthia the minotauress sitting at the bar, sipping idly at a warm mug of cocoa. She waves as she notices you.");
		// [Cynthia] Go to Cynthia Talk Menu
		addButton(btnSlot, "Cynthia", approachCynthia);
	}
}

public function approachCynthia(intro:Boolean = false):void
{
	clearOutput();
	showBust("CYNTHIA");
	author("Couch");
	
	// Introduction
	if(intro)
	{
		showName("\nCOWGIRL");
		
		output("You take a seat next to the cowgirl, who takes a glance over at you. She’s definitely huge, about eight feet tall and stacked with muscles piled on muscles, not to mention a bust and ass that look to be making up for her lack of fat elsewhere and then some. Her fur is brown and just thick enough to be soft, while her face is fully bovine.");
		output("\n\n<i>“Nice to meet you, miss...?”</i> you ask as you look the cowgirl over.");
		output("\n\n<i>“Hm? Oh, it’s Cynthia.”</i> The girl has a light midwestern accent, almost reminding you of a New Texan. <i>“You are?”</i>");
		output("\n\n<i>“Steele, [pc.name] Steele,”</i> you say");
		if(pc.isNice()) output(" with a hint of embarrassment at Cynthia’s surprise.");
		else if(pc.isMischievous()) output(" with a cheeky grin, enjoying the way Cynthia’s eyes widen as recognition dawns.");
		else output(" with a cocky smirk. <i>“You might have heard of me.”</i>");
		output("\n\n<i>“Ahaha... should’ve known, shouldn’t I? I work for Dr. Lessau over at Biomedical, he was just telling us to be on the lookout for " + indefiniteArticle(pc.raceShort()) + ". Nice to meet you, [pc.name].”</i>");
		output("\n\nYou assure Cynthia the pleasure is yours.");
		output("\n\n<i>“Well, if you’ve got something you want to chat about, just let me know.”</i>");
	}
	else
	{
		showName("\nCYNTHIA");
		
		output("<i>“Hey there, [pc.name],”</i> Cynthia says as you approach. Off duty she’s forgone her lab coat in favor of a short jacket and a pair of jeans, which you’re guessing are smart clothes given the climate. The jacket is worn open, letting you see the black tube top underneath. <i>“Just here for a warm drink, or looking for someone?”</i>");
	}
	
	processTime(1);
	
	if(flags["MET_CYNTHIA"] == undefined) flags["MET_CYNTHIA"] = 1;
	
	cynthiaBarMenu();
}

// Cynthia Talk Menu
public function cynthiaBarMenu():void
{
	clearMenu();
	addButton(0, "Lessau", cynthiaTalk, "lessau", "Lessau", "Ask Cynthia about her boss.");
	addButton(1, "Herself", cynthiaTalk, "herself", "Herself", "Ask Cynthia about herself and her coworkers.");
	if(flags["BIOMED_GANGBANGED"] == undefined) addDisabledButton(2, "Libido", "Libido", "You’d need to have seen the extent of Cynthia’s libido to ask her about it.");
	else addButton(2, "Libido", cynthiaTalk, "libido", "Libido", "The staff seems pretty comfortable with fucking during work hours, don’t they?");
	if(pc.hasGenitals())
	{
		if(pc.lust() >= 33) addButton(3, "Sex", cynthiaSex);
		else addDisabledButton(3, "Sex", "Sex", "You are not aroused enough for this!");
	}
	else addDisabledButton(3, "Sex", "Sex", "You need genitals to do this!");
	addButton(14, "Back", mainGameMenu);
}
public function cynthiaTalk(topic:String = "none"):void
{
	clearOutput();
	showBust("CYNTHIA");
	showName("\nCYNTHIA");
	author("Couch");
	
	cynthiaBarMenu();
	
	switch(topic)
	{
		// Lessau
		case "lessau":
			output("You ask Cynthia if she wouldn’t mind telling you more about Dr. Lessau.");
			if(flags["BIOMED_GANGBANGED"] != undefined) output(" He seems to let his staff have a lot of free reign if having a spontaneous orgy in the office is no big deal. Bringing it up causes Cynthia’s cheeks to darken under her fur.");
			output("\n\n<i>“Yeah, the doc is... he’s been good to us. All of us. Steele Tech didn’t have anyone else in biomedical when he was hired, so he handpicked his whole staff. I’d heard of him before that, read some of his papers when I was a student, but I’d never, you know, </i>met<i> him. If I did, like at my thesis or something, he must have looked like something completely different then. Wouldn’t be a surprise.”</i>");
			output("\n\n<i>“After graduating I wound up at Je’june Pharma for a few years. It was boring, but it was a job. The doc wrote me a mail one day, I guess right after he was hired, and asked me if I wanted to do something more exciting than make sterilizing agents and breath mints. I agreed, and two weeks later he had me working on Terran Treats. It was a huge project compared to anything I’d done before: the human genome’s been mapped for centuries, but nobody had ever really looked into making a real transformative out of it. Humans have a pretty surprising range of body types and colors compared to a lot of other races that tend to come in just one or two palettes, so there’s a lot that has to be taken into account.”</i>");
			output("\n\n<i>“It was just the two of us at first, but by the time we were done we’d grown to a team of over a dozen, and I’d been promoted to manager. I don’t even know how </i>that<i> happened, it’s not something I would have ever even considered.”</i>");
			if(flags["BIOMED_GANGBANGED"] != undefined)
			{
				output("\n\nYou point out that she was pretty comfortable with leadership during the orgy. She took command of that like it had been her idea to start with.");
				output("\n\n<i>“That’s what I mean. I wasn’t like that before. When I was human it was hard to make myself heard. Something about having this body, about being so </i>big<i>, brought this out in me. I’ll never be able to repay the doc for that.”</i>");
			}
			
			processTime(2);
			
			addDisabledButton(0, "Lessau");
			break;
		// Herself
		case "herself":
			output("You note that Lessau’s certainly recruited a colorful bunch to work for him: almost everyone seems to be modded to at least some degree, most like her are heavily so.");
			output("\n\n<i>“That’s the one thing we seem to all have in common: we weren’t satisfied with what we were before. Our first project in training is to design a mod specially for ourselves.”</i>");
			output("\n\nCynthia runs a hand down her body, showcasing the muscles that would leave a bodybuilder salivating paired with curves like a breeding cow. <i>“From five-foot-one to eight-foot-six, from the low end of A-cup to the high end of H. You can get some of this with commercial mods, but it’s very hard and </i>very<i> expensive, especially if you want to be all the way cowgirl. I tried Bovinium at first, but that won’t get you muscles or fur. It just takes you far enough that folks start mistaking you for a New Texan, and honestly, that sucks worse than being flat. Getting treated like a dumbass who’ll suck any dick she sees just because you want to have horns and milk is really shitty. I get that a whole lot less now, thankfully.”</i>");
			if(pc.isTreated() && pc.isBimbo()) output(" Maybe you should be offended, but you were distracted by the mention of sucking dick. Stars you could go for a dick. What was she talking about again?");
			if(flags["BIOMED_GANGBANGED"] != undefined)
			{
				output("\n\n<i>“What about Walt?”</i> you ask, the only other name you recall from the party. After that it kind of got to be a blur.");
				output("\n\n<i>“Walt was an ausar, and they’re not exactly keen on mods that aren’t just changing genders. Even here, the colonists really only made the modifications because they’d have frozen to death if they hadn’t. It’s a major stigma if you’re an ausar and you want to get in touch with your animal side. Hell, Walt’s not even his real name, he changed it as soon as he went full wolf. I don’t know if his family disowned him, but I know they don’t talk much anymore.”</i>");
				if(flags["MET_EMMY"] != undefined) output(" You’re pretty sure you’ve heard of this sort of thing happening before.");
			}
			output("\n\nCynthia shakes her head. <i>“The rest of us are the same way; everyone has their own reasons, but we all wanted to change. Here we got the opportunity to do that.”</i>");
			
			processTime(2);
			
			// [Next] Unlock Holstaria at Lessau’s office
			if(flags["MET_CYNTHIA"] == undefined || flags["MET_CYNTHIA"] < 2) flags["MET_CYNTHIA"] = 2;
			
			addDisabledButton(1, "Herself");
			break;
		// Libido
		case "libido":
			output("You point out that Cynthia and all of her coworkers seem to be incredibly horny. The cowgirl just smirks and points to her horns.");
			if(pc.isNice()) output("<i>“Um, no, I didn’t mean like that.”</i>");
			else if(pc.isMischievous()) output("<i>“Hah! C’mon, though, I’m serious.”</i>");
			else output("<i>“Not like that, asshole.”</i>");
			output("\n\nCynthia laughs. <i>“Alright, alright. Yeah, we’re kind of a bunch of horndogs. Can you blame us, though? We’ve all gotten our dream bodies, we want to use them. The doc doesn’t mind as long as we get our work done and don’t leave any mess. Mind you, he gets pissed off something fierce if we do either of those, but I’m pretty good at keeping everyone on top of things. It helps that nobody wants to lose this. Office sex is great, but we’ll always put our work first. Promise.”</i>");
			
			processTime(1);
			
			addDisabledButton(2, "Libido");
			break;
	}
}
public function cynthiaSex(response:String = "intro"):void
{
	clearOutput();
	showName("\nCYNTHIA");
	author("Couch");
	clearMenu();
	
	switch(response)
	{
		// Sex Intro
		case "intro":
			showBust("CYNTHIA");
			
			if(flags["BIOMED_GANGBANGED"] != undefined) output("<i>“So, we got to get fucked by all sorts of your coworkers at the office,”</i> you say as you eye Cynthia’s magnificent rack, <i>“but I don’t think I got nearly enough time with just you.”</i>");
			else output("<i>“It’s a little crowded in here, don’t you think?”</i> you ask as you eye Cynthia’s lavish chest straining under her top. <i>“I wouldn’t mind going somewhere more private.”</i>");
			output("\n\n<i>“Oh?”</i> The cowgirl takes a deep drink of her cocoa before putting the mug down. She looks you over, then after a moment licks her lips. <i>“Well, [pc.name], if you want to head on back to my place, I wouldn’t mind having someone to cuddle with tonight.”</i>");
			
			processTime(1);
			
			addButton(0, "Next", cynthiaSex, "next");
			break;
		case "next":
			showBust("CYNTHIA");
			
			output("You find yourself escorted to the residential district in short order, to what looks like a motel on the surface. Upon being taken inside you find it’s instead a full-fledged apartment complex, built down into the protective ice rather than the harsh surface.");
			output("\n\n<i>“Most of us live here,”</i> Cynthia explains as you walk. <i>“A few shacked up together in a house closer to the office, but personally...”</i>");
			output("\n\nThe door to Cynthia’s apartment swings open, and you’re hit with a warm, smoky scent as you look into a room decorated to resemble a log cabin.");
			output("\n\n<i>“...I prefer privacy. Welcome to my home, [pc.name].”</i>");
			output("\n\nCynthia takes you inside, depositing her jacket before showing you around. The apartment is modest, particularly for someone of her extreme size, but manages to feel cozy rather than cramped thanks to careful use of furniture. There’s a simple bar kitchen along one wall, opposite a pair of tall bookcases flanking a holoprojector, with a couch in the middle rounding out the space. You notice a picture frame nestled among the books, depicting a shy-looking human girl. She’s short and slender to the point of boyish, and clearly embarrassed at having the picture taken.");
			output("\n\n<i>“Who I was,”</i> Cynthia says in a quiet voice as she notices your gaze. <i>“So I don’t go forgetting what it was like.”</i> She shakes her head after a moment. <i>“Want something to eat, [pc.name]? I cook a mean omelette.”</i>");
			output("\n\nYou admit that you’re feeling a bit hungry, and the minotauress soon sets to cooking, her ropey cow tail swinging idly as the hickory scent of the apartment is overtaken by the smell of frying grease. You let yourself get comfortable, sitting down at the counter to admire that thick furry flank. She’s stacked with muscle in back, with just enough fat layered on top to round it out into a perfect bubble butt.");
			output("\n\n<i>“Here you go, [pc.name].”</i> Cynthia says after a few minutes, sliding you a plate followed by one for herself. <i>“Dinner is served.”</i>");
			output("\n\nYou both dig in, enjoying the heat of the freshly cooked eggs filling your belly. On an ice world like this, a hot meal is just what you need.");
			output("\n\n<i>“Afraid I don’t have much to drink,”</i> Cynthia says as you finish, <i>“unless you want some milk straight from the tap?”</i> She leans forward a bit at this, emphasizing that bountiful cleavage.");
			
			processTime(43);
			
			moveTo("CYNTHIA APARTMENT");
			showLocationName();
			
			eatHomeCooking(25);
			
			addButton(0, "Her Milk", cynthiaSex, "her milk", "Her Milk", "Get a taste of Cynthia’s milk.");
			if(!pc.isLactating()) addDisabledButton(1, "Your Milk", "Your Milk", "You’d need to be lactating for this.");
			else addButton(1, "Your Milk", cynthiaSex, "your milk", "Your Milk", "Give Cynthia a taste of your milk instead.");
			break;
		// Her Milk
		case "her milk":
			showBust("CYNTHIA_NUDE");
			
			output("You’re not about to say no to an offer like that, of course. Cynthia pulls her top up and off with a grunt of relief, her massive breasts spilling free. Those ebony teats are already forming little beads of white at their tips; this cow’s definitely ready for a milking.");
			output("\n\nShe opts to show off just a bit, leaning forward enough that the sheer size of her udders puts her in easy licking distance even over the counter. You dive in, clamping your lips around one of those thick, soft teats and starting to suck. Cynthia lets out a trembling moo as the lingering heat in your mouth is washed away by the warm, creamy taste of fresh milk. You keep sucking, swirling your tongue around that fat black nipple.");
			output("\n\n<i>“Aaah... m-mooooo! [pc.name]...!”</i> Cynthia shudders as your oral attentions continue. One of those thickly muscled arms comes around to your back almost on reflex");
			if(pc.hasWings()) output(", fingers digging into your wingpoints in a way that encourages you to suck even harder");
			output(". A thought comes to mind, and you slip one of your hands under Cynthia’s other breast. It’s tricky to lift with just how big and soft it is, but Cynthia soon takes notice and assists with her own free hand, lifting that tit until she can wrap her lips around her own nipple and start drinking together with you. The sight of it soon prompts you to let go, both because you’re feeling full for the moment and so you can watch as the minotauress gulps down her own milk.");
			output("\n\n<i>“Mmm...?”</i> Cynthia starts to relax now, gradually going from shivering to smirking as she notices your enthralled gaze. <i>“Oh, you like this, [pc.name]? You like seeing a muscled-up cow sucking on her big, fat udders?”</i>");
			output("\n\nYou nod enthusiastically, prompting Cynthia to get a little showier, licking her nipple with her lips parted so that a jet of milk squirts into her waiting mouth. Her other arm lets go of your back so that she can flex, showing off the impossibly thick biceps, their contours visible even through her fur. Cynthia keeps drinking her own milk as she shows off the contrast between her broad, muscular body and her fat, soft tits. <i>“Mmmyeah, over four hundred pounds of solid beef. Think you can handle it all, [pc.name]?”</i>");
			output("\n\n<i>“Willing to give it a shot,”</i> you reply with an eager grin, resisting the urge to");
			if(pc.isMale()) output(" stroke yourself");
			if(pc.isFemale()) output(" slip your hand between your thighs and finger yourself");
			if(pc.isHerm()) output(" stroke or finger yourself");
			output(". You get the feeling you’ll need all the stamina you can muster. Cynthia lets go of her breast in short order, stepping around the counter.");
			output("\n\n<i>“Well then, shall we?”</i>");
			
			processTime(12);
			
			pc.milkInMouth(chars["CYNTHIA"]);
			
			addButton(0, "Next", cynthiaSex, "sex menu");
			break;
		// Your Milk
		case "your milk":
			showBust("CYNTHIA_NUDE");
			
			output("You shake your head, instead slipping off your gear so that there’s nothing to cover your [pc.chest]. With a sly smirk, you bring your hands to your nipples, giving them a little rubbing so that [pc.milkColor] liquid starts to leak from between your fingers.");
			output("\n\n<i>“I was thinking we could go for </i>my<i> [pc.milkNoun] instead?”</i> you say as you pull your hands away, letting Cynthia see the trickles now running down your chest. Cynthia for her part looks as utterly aroused as you’ve ever seen.");
			if(pc.biggestTitSize() >= 4) output(" You stir her up further when you lift one of your jugs to take a deep gulp, relishing the decadence of your own [pc.milkFlavor] flavor pouring down your throat.");
			output("\n\n<i>“Oh... oh, I </i>like<i>.”</i> Cynthia comes around the counter as you turn to face her, drawing you into those thick furry arms. She lifts you to get at your tit, letting her long, flat bovine tongue slip out and run itself over your [pc.nippleColor] nipple. You let out a moan as fresh [pc.milkNoun] spills from your breast, lapped up immediately by Cynthia’s waiting tongue even as the lick stimulates you enough for another spurt to follow. The cowgirl soon transitions into full-on suckling, her lips clamped firmly over your teat while that tongue starts coaxing spray after spray of [pc.milkNoun] into her waiting mouth.");
			output("\n\n<i>“Oh,”</i> you hear yourself moan, <i>“oh yeah, that’s it, you horny cow! Suck my [pc.milkNoun] tanks!”</i>");
			output("\n\nCynthia gladly obeys, holding you in place as she gulps down your [pc.milkNoun] with abandon. The suction of her lips is incredible, filling your whole breast with the delicious ache of having its bounty spill forth into the cowgirl’s waiting mouth. You reach up to scratch her behind the ears, to Cynthia’s muffled delight.");
			if(pc.biggestTitSize() >= 4) output(" Your free hand lifts your other tit back to your lips so you can join in, relishing the dual sensations of sucking and being sucked.");
			output("\n\nIt’s a good long while before Cynthia lets go, licking her lips. <i>“Nothing like a drink to put a girl in the mood... ready, [pc.name]?”</i>");
			output("\n\n<i>“Couldn’t be more ready if I tried,”</i> you reply, your voice torrid and your nipples leaking steady [pc.milkColor] streams down your chest.");
			
			processTime(15);
			
			if(pc.biggestTitSize() >= 4) pc.milkInMouth(chars["PC"]);
			pc.milked();
			
			addButton(0, "Next", cynthiaSex, "sex menu");
			break;
		// Sex Menu
		case "sex menu":
			showBust("CYNTHIA_NUDE");
			
			output("Soon the two of you find yourselves in Cynthia’s large, sturdy bed, stripping off everything you have on before you even enter the room. Cynthia pulls you down for a makeout session, those massive arms wrapped lovingly around your back. Your tongues war for a bit,");
			if(pc.hasLongTongue()) output(" giving you an opportunity to show off the sheer length of yours,");
			output(" leading into Cynthia looking at you with a lusty grin when your lips part.");
			output("\n\n<i>“So how are we doing this, [pc.name]? You’re the boss.”</i>");
			
			processTime(2);
			
			if(!pc.hasCock()) addDisabledButton(0, "Fuck Her", "Fuck Her", "You’d need a cock for this.");
			else addButton(0, "Fuck Her", cynthiaSex, "fuck her", "Fuck Her", "Mount up and get some pussy.");
			if(!pc.hasVagina()) addDisabledButton(1, "Eat Out", "Eat Out", "You’d need a vagina for this.");
			else addButton(1, "Eat Out", cynthiaSex, "eat out", "Eat Out", "Have Cynthia eat you out.");
			break;
		// Fuck Her
		case "fuck her":
			showBust("CYNTHIA_NUDE");
			
			output("<i>“Spread those legs,”</i> you say as [pc.oneCock] grinds against Cynthia’s abs, staining her fur with a bit of precum. She readily obliges, lying back and parting her thighs. You slide down her body,");
			if(pc.hasBreasts()) output(" relishing the feeling of your soft tits grinding against her iron-hard abs. Soon enough you find yourself");
			output(" kneeling down to get a look at the puffy black pussy that’s one of the few furless spots on her body. She’s not quite animalistic down here, but nor is she normal for a human: the outer lips are extremely plump, coming together in a deep crease as though she were displaying cameltoe through a very tight swimsuit. You spread those lips with your fingers to find a glistening ebony cunt nestled within, practically dripping with feminine juices.");
			output("\n\n<i>“Like what you see?”</i> Cynthia asks as she lifts one of her breasts to suck on, her other hand resting comfortably behind her head. <i>“Mmm... go on and take a taste.”</i>");
			output("\n\nYou gladly obey, slipping your tongue into Cynthia’s eager ebony twat. Compared to the lightly sweet flavor of her milk, her juices are more fruity, almost reminding you of blackberries. You drink deep, sweeping your tongue around inside her folds as your [pc.lips] press against the thick nub of her clit.");
			if(pc.hasLongTongue()) output(" Cynthia lets out a shocked moo as you briefly flaunt your tongue’s true length, slipping it all the way down to her cervix and back again in a lick that coaxes a veritable flood of nectar from her depths.");
			output(" Soon you’ve got the cowgirl far too distracted by your oral attentions to even play with her breasts, clutching the sheets as you eat her out.");
			output("\n\n<i>“Oooh! Ooh, [pc.name]!”</i>");
			output("\n\n<i>“Moo for me, cowgirl,”</i> you say with a grin, stepping up your licking to pay more attention to her clit. Cynthia clenches as your tonguetip drills her nub, throwing her head back and bellowing so loudly you’re sure the neighbors must hear. By the time you pull away she’s left breathing heavily, her pussy drenched and her legs quivering with need.");
			output("\n\nYou don’t make her wait a moment longer. [pc.OneCock] slides across her fur as you bring it to her womanhood, pushing in with a groan echoed by a crooning moo from the minotauress underneath you.");
			
			var cIdx:int = rand(pc.cocks.length);
			
			if(pc.cLength(cIdx) < 5) output(" <i>“Mmm... so cute, [pc.name].”</i> Cynthia gives you a teasing wink. <i>“Kind of seems like I should be using an accent, doesn’t it?”</i>");
			else if(pc.cLength(cIdx) < 11) output(" <i>“Oh </i>yeah<i>, that’s it, [pc.name]. You like my fat, soft cow-pussy?”</i>");
			else output(" <i>“Mmmooooo yeah, so </i>big<i>! Come on, [pc.name], I can take it all!”</i>");
			output("\n\nYou give a grunt as you bottom out");
			if(pc.balls > 1) output(", your balls slapping heavily against her ass");
			output(". She’s deliciously soft, but a squeeze shows off that the muscles in her pussy are just as strong as the rest of her, turning that warm, squishy snatch into a deliciously massaging dick-milker. Cynthia gives a delighted moo as she finds the right amount of pressure to apply for your pleasure and hers, ensuring every vein");
			if(pc.cocks[cIdx].cType == GLOBAL.TYPE_FELINE) output(" and barb");
			output(" of your cock drags along every fold of her cunt.");
			if(pc.cocks[cIdx].hasFlag(GLOBAL.FLAG_FLARED)) output(" Your flare is treated to the tightest grip of all, feeling as though you’re practically scooping her out every time you pull out.");
			if(pc.cLength(cIdx) >= 11) output(" You can’t help but grin at the sensation of your [pc.cockHead " + cIdx + "] pressing against her cervix every time you bury yourself to the hilt, those innermost lips feeling as though they’re sucking at your cumslit with how they quiver.");
			
			pc.cockChange();
			
			output("\n\n<i>“That’s it, you horny cow,”</i> you purr, <i>“grip it just like that.”</i>");
			output("\n\n<i>“Mmm, then get moving, you horny [pc.raceBoyGirlShort].”</i> Cynthia takes a showy gulp of her milk, fondling her other breast for your viewing pleasure. <i>“I can take everything you’ve got.”</i>");
			output("\n\nYou start off slow, relishing Cynthia’s puffy cunt and the gorgeous amazonian beauty laid out before you. She rewards you with even showier milk play, giving herself a squeeze to send a jet of creamy white squirting into her waiting mouth. You step it up slowly, enjoying the show as she starts to lose control, accidentally giving herself a milk facial. Soon she’s forced into giving up the milk play entirely in favor of mooing as you gear up into giving her the wild plowing she deserves.");
			output("\n\n<i>“Ah! Oh! Oh yeah, moooo! Moo-ooooo!”</i>");
			output("\n\nYou cum with a feral growl, driving yourself to the hilt");
			if(pc.cLength(cIdx) >= 11) output(" so your [pc.cockHead " + cIdx + "] fits snug against her eager womb");
			output(".");
			if(pc.cumQ() < 5000)
			{
				output(" Her muscles get to work as the first drop touches her pussy, milking your dick for all the [pc.cumNoun] you have to give.");
				if(pc.hasKnot(cIdx)) output(" Your knot locks you good and tight, forming a seal that ensures not a single drop of [pc.cumNoun] escapes.");
				output(" Cynthia lets out an ecstatic moo, followed by a husky croon as she looks down past her chest at you.");
				output("\n\n<i>“Oh, [pc.name], so </i>warm<i>...”</i>");
				if(pc.hasKnot(cIdx)) output(" The minotauress gives you a heady grin as her pussy gives your knot a tender squeeze. <i>“Mmm, just keeps coming...”</i>");
			}
			else
			{
				output("\n\nCynthia moos in contentment as your [pc.cumNoun] fills her womb, only to gasp when she realizes your dick isn’t finished by a longshot. The next spurt forces its way inside with a groan from the cowgirl, then a yelp, then a shuddering moo as you overcome the pressure of her abs.");
				if(pc.hasKnot(cIdx)) output(" Your [pc.cumNoun] floods her cunt in an effort to escape, but your knot keeps her sealed tight, leaving it with nowhere to go but into her rapidly flooding womb.");
				output(" Each pulse of your cock sees Cynthia’s stomach swell, rounding out into a pregnant bulge. By the time you can’t fit any more in, she’s been stretched so much that you can almost see the ebony skin beneath her otherwise thick fur. Thick spurts of [pc.cumNoun] gush out around the sides of your dick");
				if(pc.hasKnot(cIdx)) output(", your knot no longer able to hold it all back");
				output(".");
				output("\n\n<i>“S-so </i>much<i>...”</i> Cynthia groans as she rubs herself. <i>“You and the doc are both such firehoses, [pc.name].”</i>");
				output("\n\n<i>“You said you could take it all,”</i> you tease, patting her belly with one hand. Cynthia groans louder at this.");
				output("\n\n<i>“Mmmoooo... alright, got me there.”</i> Cynthia reaches out in response to your leaning in, wrapping an arm around your back. <i>“C’mere, you.”</i>");
			}
			output("\n\nCynthia pulls you down before you can even finish coming down from the afterglow, resting your head on her lush furry udders. You decide you don’t mind this in the least, letting Cynthia handle dragging the both of you into a proper cuddling position under the sheets.");
			
			processTime(32);
			pc.orgasm();
			
			// [Next] Advance time to 8:00 and go to Morning
			addButton(0, "Next", cynthiaSex, "morning");
			break;
		// Eat Out
		case "eat out":
			showBust("CYNTHIA_NUDE");
			
			output("Rather than answer aloud, you pull away and up, turn yourself around, and plant your ass firmly over Cynthia’s face so that muzzle sticks");
			if(pc.balls > 1) output(" into the space under your balls,");
			output(" right into your groin, her lips pressing against [pc.oneVagina]. She gets the message immediately, prompting you to croon as her tongue delves into your honeypot.");
			
			var vIdx:int = rand(pc.vaginas.length);
			
			output("\n\n<i>“Oh yes,”</i> you purr, <i>“gooood cow. Get your tongue in there just like that.”</i>");
			output("\n\nCynthia gladly obeys, her breath hot and wet as she eats you out. You feel a delicious pressure against your " + (pc.vaginas[vIdx].clits == 1 ? "clit" : "clits") + " each time that long, strong tongue flexes and twists inside you, coaxing forth a steady supply of [pc.girlCum] for her to enjoy.");
			if(!pc.hasBreasts()) output(" You relax and croon, letting yourself focus on the pleasure in your pussy.");
			else
			{
				output(" You bring your hands up to play with your breasts, making a game of timing your rubbing to mirror Cynthia’s oral attentions.");
				if(pc.canMilkSquirt()) output(" Each tweak of your nipples sends jets of [pc.milkNoun] squirting out from between your fingers to splatter on Cynthia’s abs and thighs, one particularly lucky shot even landing square on her puffy black pubic mound.");
			}
			output("\n\nSoon you give a shuddering groan as you cum, soaking Cynthia’s tongue in even more [pc.girlCumNoun] as your cunt convulses, trying to milk the invader like a cock. Cynthia takes advantage of your distraction, pulling you down so your chest presses against her abs. By the time you recover from the orgasmic haze, you’ve got an up-close look at Cynthia’s pouty black pussy. The cowgirl’s packing an exotic cunt that smells of blackberries, with a deep cameltoe crease and a pubic mound so fat that it jiggles when you slap it. You tease those massive outer lips open with two fingers, revealing a pussy that’s black as pitch and shiny with fruity nectar.");
			output("\n\nYou lean in and set to licking as Cynthia starts in on her second round of eating you out. Your tongue sweeps back and forth across her crease so that you can enjoy the way her puffy lips jiggle in time with your motions. Her juices taste like they smell, a wonderful berry flavor that’s a perfect complement to her milk. When you delve in properly, that taste turns into an overpowering flavor, one that fills your whole mouth as you begin to drink deep of Cynthia’s nectar. The cowgirl gives a muffled, shuddering moo that sends vibrations racing through your own pussy, your [pc.vagina " + vIdx + "] quivering from the attention. You nibble at her clit in response, prompting another moo and another thrill of pleasure.");
			output("\n\nSoon the two of you are lost in the pleasure of each other’s oral attentions, eyes closed in bliss. Every moan and moo from either of you just spurs the other onward, driving you both to lick and suck with abandon, each trying to get the other to cum before you do. Finally");
			if(pc.hasCock()) output(" [pc.eachCock] lets loose with sprays of [pc.cumNoun] straight into Cynthia’s waiting cleavage as");
			output(" you cry out together, bringing each other to a bellowing climax you’re sure the neighbors hear.");
			output("\n\n<i>“Oooh... pretty good, [pc.name].”</i> Cynthia lets out a satisfied purr as she turns you around to cuddle, pressing your head against her furry");
			if(pc.hasCock()) output(" and cum-glazed");
			output(" cleavage.");
			if(pc.hasCock())
			{
				output(" <i>“You might want to clean that up.”</i>");
				output("\n\nYou groan as you obey, setting to cleaning up your pillows for the night before you rest on them, Cynthia humming in pleasure to herself as she relishes the attention in the afterglow.");
			}
			
			processTime(32);
			pc.orgasm();
			pc.girlCumInMouth(chars["CYNTHIA"]);
			
			// [Next] Advance time to 8:00 and go to Morning
			addButton(0, "Next", cynthiaSex, "morning");
			break;
		// Morning
		case "morning":
			showBust("CYNTHIA_NUDE");
			
			output("The next morning you wake to find yourself nestled in a warm and toasty embrace that it’s extremely hard to convince yourself to get up from, though the promise of a warm breakfast with some more fresh milk from Cynthia certainly helps when you can’t stay any longer.");
			output("\n\n<i>“Sure you’re not up for another round?”</i> you ask as you eat. Cynthia shakes her head.");
			output("\n\n<i>“Sorry, time to get to work. Can’t be late because I was at home getting a morning quickie, no matter what their name is or how sexy " + indefiniteArticle(pc.raceShort()) + " they are.”</i>");
			output("\n\n<i>“Aww, but I’m your boss. Can’t I excuse you?”</i> you reply with a half-joking smile that prompts a smirk back from the cowgirl.");
			output("\n\n<i>“");
			if(9999 == 9999) output("</i>Future<i> boss. ");
			output("You want to be able to take me for a morning ride, get out there and earn that company. Trust me, if you fight as good as you fuck, you’ll be calling the shots in no time. Then you can set whatever work hours you want.”</i>");
			output("\n\nIt’s certainly an inspiring reward to think of as you make use of Cynthia’s shower for one last bit of warmth, heading out to face the chill outside with renewed vigor.");
			
			var currHour:Number = hours;
			var minPass:Number = 0;
			
			while(currHour != 8)
			{
				minPass += (50 + rand(21));
				currHour++;
				if(currHour >= 24) currHour = 0;
			}
			
			pc.createStatusEffect("Cum Paused");
			pc.createStatusEffect("Milk Paused");
			processTime(minPass);
			pc.removeStatusEffect("Cum Paused");
			pc.removeStatusEffect("Milk Paused");
			
			eatHomeCooking(25);
			pc.milkInMouth(chars["CYNTHIA"]);
			pc.shower();
			pc.createStatusEffect("Cynthia Away", 0, 0, 0, 0, true, "", "", false, 120);
			
			// [Next] Exit scene and deposit player outside at K37: Southern Residential
			addButton(0, "Next", cynthiaSexFinish);
			break;
	}
}
public function cynthiaSexFinish():void
{
	IncrementFlag("CYNTHIA_SEXED");
	moveTo("UVI N40");
	addUvetoCold();
	mainGameMenu();
}

