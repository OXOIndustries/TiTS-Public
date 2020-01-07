import classes.Creature;
import classes.Items.Miscellaneous.Rainbotox;
import classes.Items.Miscellaneous.YTRLube;
import classes.Items.Miscellaneous.WhiffOWisp;
/*
 * The Entite/The Seer - https://docs.google.com/document/d/12Ln9wqosjT8V_H-wi2vH7pHbWu05KN8yTf3T5vjLbo4/edit#
 *
 * #Flags:
 * SEER_MET		1 if Seer has introduced herself, else undefined
 * SEER_LOUNGE	1-2, 1 if done the lounge option, 2 if done her sex menu, else undefined
 * SEER_SEXED	1-INFINITY how many times you borked Seer, undefined if not sexed her
 * USED_WISP	1 if done Wisp, else undefined - needs be set by the wisp item
 * 
 * Using the name "WiffOWisp" for the status effect check for the bad end if you overdose, may need to change once it’s implemented.
 * Adding the unique items to her inventory is commented out as they aren’t implemented yet.
 */

public function showSeer(nude:Boolean = false):void
{
	if (flags["SEER_MET"] != undefined) showName("\nTHE SEER");
	else showName("ROBED\nFIGURE");
	showBust(seerBustDisplay(nude));
}

public function seerBustDisplay(nude:Boolean = false):String
{
	if (nude) return "SEER_NUDE";
	else return "SEER";
}

public function entiteAvailable():Boolean
{
	if (hours >= 11 && hours < 23) return true;
	else return false;
}

public function entiteExteriorShitz():void
{
	if (!entiteAvailable())
	{
		if (flags["SEEN_ENTITE"] == undefined) output("\n\nYou feel a strange presense here... like there is supposed to be another shop front next to you... but obviously, there isn’t. Weird.");
		else output("\n\nIt’s funny, you could’ve sworn that where you’re standing had a shop right next to you. Something purplish and... ah whatever, it’s probably just deja vu kicking you round the head again.");
	}
	else
	{
		output("\n\nThere’s a familiarly Terran-looking shop just to your side. It’s old looking and the shop front seems medieval in design. Calligraphic letters spell out ‘The Entite’ in gold lettering over a purple sign that hangs above the solid wooden door. You get the feeling you’ve already been there before, maybe in another, more whimsical lifetime.");
		flags["SEEN_ENTITE"] = 1;
	}
}

public function theEntiteBonus():Boolean
{
	clearOutput();
	author("SoAndSo");
	showSeer();
	
	if (flags["SEER_MET"] == undefined)
	{
		output("What greets you when you enter the curious little shop is a heavy glow of amaranth light. It emanates in slightly different shades of flame from several black candles dotted about the place.");
		output("\n\nThere’s a counter at the far back of the room with a mechanical cash register on the right. Surrounding it is a patchwork arrangement of small plants, abstract gemstones, statues, and other curios that all have colored reflections from the purpled light sources.");
		output("\n\nA very fine mist wafts around the lower end" + (pc.legCount > 1 ? "s" : "") + " of your [pc.legs], one that’s vaguely warm and smelling of obscure incense.");
		output("\n\nThere are some more familiar looking items lining the back shelf of the counter: bottles, pill packets and unusual containers of mods. They’re locked behind a large, horizontal glass case.");
		output("\n\nTo your right, the furthest corner of the room is sectioned off by a wall of red velvet drapes. You can make out some wooden legs and cushions, suggesting a lounging area. It has a mild, sickly pink glow that bleeds through small gaps in the curtains.");
		output("\n\nBehind the counter sits a cowled, robed figure, a long stick or staff of sorts by their side. It appears to just be a black rod save for a smooth ball of crystal at the end. It reminds you of something you would’ve heard of in ancient Earth tales of yore. The figure appears to be reading a particularly antique book, one with real leather binding and faded yellow-brown pages that they are turning in a very delicate manner.");
		output("\n\nThe figure looks up as you amble towards the counter.");
		output("\n\n<i>“Customer... customer. Customer!”</i> comes an exuberant, feminine voice. The figure rises to greet you, a thin-fingered left hand gracefully sliding out of its heavy sleeve. They don’t try to shake your hand, merely holding it in your direction. Their other arm is curled just above the waistline, the loose sleeve that covers it dangling with excess length.");
		
		processTime(3);
		
		clearMenu();
		addButton(0, "Uh, Hey", approachSeer);
		return true;
	}
	
	output("The Entite seems to have drawn you into its being. You feel as if you’ve been here before... wait, you <i>have</i> been here before. You even remember what it looks like. It seems off though: Was that candle always on that book stack? That statue staring at you? Both? But maybe neither?");
	output("\n\nThe shopkeeper is behind the counter, which you’ve seen her do before. Possibly. Have you even met her before? What was her name again? Did she do anything to you last time? You’re sure <i>something</i> did, maybe.");
	if (flags["SEER_LOUNGE"] != undefined) output(" Your body seems to remember: A strange sinking sensation rushes through you at an ephemeral pace when you glance at the shopkeeper.");
	output("\n\nShe rises to welcome you with her left hand outstretched.");
	var option:int = rand(4);
	switch(option)
	{
		case 0: output("\n\n<i>“Ahh, Steele! At least, that is what I have seen. Are you </i>that<i> Steele? Possibly. Possibly the other... and the others...”</i> she mutters, returning to the counter to accept your custom."); break;
		case 1: output("\n\n<i>“[pc.name]. A name known! Names known. Names replaced... names, nay, beings! Beings are being, named and not seen...”</i> she mutters, returning to the counter to accept your custom."); break;
		case 2: output("\n\n<i>“Chest pounding, stomach burning, the lungs, they fail! Oh... but to see what was birthed. That is and that is not... and it is not you,”</i> she mutters, returning to the counter to accept your custom."); break;
		case 3: output("\n\n<i>“Did you live that life? Watch it? Feel it? Die in it? Reborn... as something. That much is clear,”</i> she mutters, returning to the counter to accept your custom."); break;
		default: output("\n\n<b>!INVALID SWITCH VALUE!</b>"); break;
	}
	addButton(0, "The Seer", approachSeer);
	return false;
}

public function approachSeer():void
{
	clearOutput();
	author("SoAndSo");
	showSeer();
	clearMenu();
	
	if (flags["SEER_MET"] == undefined)
	{
		flags["SEER_MET"] = 1;
		
		output("You wave in the shopkeeper’s direction, continuing to approach the counter. You have a look over the proprietor: tall, slender and robed in rich, purple velvet from head to toe. As you get closer, you can see what is clearly <i>her</i> face peaking out from under a hood, a pallid tone to her skin. You can only see below the nose but she seems rather pretty, her black-lipped mouth curved into a faint smile. She speaks first.");
		output("\n\n<i>“Welcome, traveller! I am... The Seer. Welcome to this place, this cynosure of uncertainty: The Entite! A realm of dreamscapes and portents, myths and realities. All is known and yet, most certainly unknown! What you’ll find here, even </i>I<i> know not! Although I do provide all for a reasonable sum.”</i>");
		output("\n\nShe curtsies, lifting her robe with her left hand. Well, if a shop’s a shop!");
	}
	else
	{
		output("You approach the counter although a nebulous feeling within wants to say that something or even some <i>one</i> is compelling you. Well, it’s <i>you</i> of course. Absolutely. ");
		if (silly) output("One hundred fifty thousand percent sure, youz is youz.");
		output("\n\nHer mien is approachable enough aside from an unblinking amber eye peering from under the velvet hood. Her left hand strokes her right sleeve, as if petting a beloved cat. ");
		if (flags["SEER_SEXED"] != undefined) output("Memory pleads with you that you’re certain that she’s doing it for a mildly concerning reason. A reason that can’t quite form in your mind...");
		output("\n\n<i>“How may I assist? Products... perhaps?”</i> she enquires, tilting her head to the side as if something is standing behind you.");
	}
	
	processTime(1);
	
	setupShopSeer();
	addButton(0, "Shop", buyItem, undefined, "Shop", (silly ? "Heh, heh, you wanna buy a... funnel cake?" : "What kinds of insanity does money buy these days?"));
	addButton(1, "Appearance", appearanceSeer, undefined, "Appearance", "At least she’s nice to look at... and probably won’t even notice you doing it.");
	addButton(2, "Talk", talkSeer, undefined, "Talk", "What’s her story? Do you even really want to know?");
	if (flags["SEER_LOUNGE"] != undefined) addButton(3, "Sex", sexSeer, undefined, "Sex", " Apparently ‘it has to be’!");
	else addDisabledButton(3, "Sex", "Sex", "That’s a bit of a nosedive, she hasn’t expressed interest... yet.");
	addButton(14, "Leave", mainGameMenu);
}

public function setupShopSeer():void
{
	shopkeep = new Seer();
	shopkeep.inventory = new Array();
	shopkeep.inventory.push(new Rainbotox());
	shopkeep.inventory.push(new YTRLube());
	shopkeep.inventory.push(new Tentacool());
	shopkeep.inventory.push(new WhiffOWisp());
	shopkeep.inventory.push(new Capraphorm());
	shopkeep.inventory.push(new Illumorphene());
	
	if(flags["SLEEP_FAPNEA_INSTALLED"] == undefined) shopkeep.inventory.push(new SleepFapnea());
	
	CodexManager.unlockEntry("Tentatool");
	//CodexManager.unlockEntry("Capraphorm");
}


public function appearanceSeer():void
{
	clearOutput();
	author("SoAndSo");
	showSeer();
	
	output("You have a look over the shopkeeper - this ‘Seer’ as she calls herself - while she is reading more of that antique book. She mouths something every few seconds, to which you can only guess the words.");
	output("\n\nThe Seer is a human female, judging purely by appearance. She stands at 5\' 10\" in height or thereabouts, a little taller than the Terran average. Her hair is shoulder length and jet black, slightly wavy but mostly a bit of a mess. Her face, something that’s often obscured by her hair and hood, could be described as cute or even <i>pretty</i> were it not at odds with her style and attire.");
	output("\n\nShe has a button nose, long eye lashes and a Cupid’s bow lip shape. The Seer uses extensive makeup, at least as far as detail goes: thick, asymmetrical and angular eyeliner designs, black lipstick, eyeshadow that matches her purple robe and a faux-beauty spot on her right cheek.");
	output("\n\nThe hood hides her amber eyes, pupils apparently permanently constricted. The sclera are marked with notable blood vessels, suggesting a habitual lack of sleep. She rarely seems to blink...");
	output("\n\nHer skin is smooth and human but grey-white in color, almost sickly. It reminds you of the look of an insomniac or someone under extreme duress. She doesn’t seem to be physically ill, although that’s not accounting for her mannerisms, expressions, personality... pretty much everything else about her.");
	output("\n\nThe whispering shopkeeper is still easy on the eyes. She has an hourglass frame with some natural curve in the right places. Her chest is given a generous range of cleavage thanks to her loose-fitting robes, leaving a large open V from neck to navel. You’d say she has E-cup breasts, buried under a layer of purple velvet. The robes themselves are quite loose but don’t drag on the floor, stopping just above her ankles. They conceal her hands when the sleeves are fully extended and the hood is more than enough to hide her face entirely if need be. She has a wide brown belt right underneath her bosom, a dulled-metal ring holding it all tightly together and emphasising her bust. On her feet are simple sandals, peeping out from under her robes.");
	output("\n\nYou’re sure that there’s not much else to her but you just can’t quite shake a nagging, ominous thought or two from your mind.");
	if (flags["SEER_SEXED"] != undefined)
	{
		output("\n\nIf you focus on her as a memory, you recall your experiences with the shopkeeper and what her true nature is.");
		output("\n\nAh, of course! You remember why she has her right arm covered... and the reason is still stomach-turning. Underneath, instead of the expected human arm, there are three greyish-purple tentacle-like appendages that tightly wrap together. Near the ends, the writhing flesh stalks taper off to a soft, membranous point like octopus legs without the suckers. There’s a smaller appendage also near the middle of each main tentacle, essentially giving her ‘arm’ six ‘fingers.’ She has an extreme measure of control over them, as you’ve borne witness to before and they can extend to her entire body length if she chooses.The tenta-tips tend to ooze a strange fluid from unseen pores.");
		if (flags["SEER_LEZ"] != undefined) output("\n\nAnd yes! Her chest is covered in a way that raises concern. " + (pc.hasNormalNipples() ? "For some unholy reason," : "Much like you and your " + (pc.hasDickNipples() ? "[pc.dickNipples]" : "[pc.nipples]") + ",") + " her milkmakers hide surprises! When she wills it, both her areola extend into three tentacular forms with a 2\"-wide hole in the middle. The appendages extend to almost a foot in length themselves, a similar shape and color to her right ‘arm’s’ manipulators. When extended, they grasp needily for something to latch on to, clamp down on or otherwise ensnare with slippery, slimy sensations. Inside her mouth hides one more foot-long tentacle, dripping in unpleasant saliva when let loose.");
		output("\n\nHer skin hides something else in the form of geometric, linguistic markings and spirals that tend to glow a mild pink. Some designs seem recognisable while others are so alien that they would give you a physical headache if you stared too long.");
		output("\n\nThe rest of her naked body is relatively normal: A groomed, tight Terran pussy hides between her thighs and her perky butt is rather cute, all things considered...");
	}
	
	addDisabledButton(1, "Appearance", "Appearance", "You’re looking at her already.");
}


public function talkSeer():void
{
	clearOutput();
	author("SoAndSo");
	showSeer();
	
	output("You’re curious about this ‘Seer’, about pretty much everything, especially this strange shop that you feel a sense of nostalgia for even though you’ve only been here the once. Or twice? Have you <i>ever</i> been here before...? When was the last time you left?!");
	output("\n\nShe seems to be on the same line of thinking, anticipating your intent.");
	output("\n\n<i>“Ah, you’re Steele, of course. Not to buy, no no, you want to... speak with me? Are you sure? Is he sure? She sure? I think they are. What do you wish to know of me?”</i> She pre-empts in grandiose, semi-delirious phrasing.");
	
	processTime(1);
	
	talkSeerMenu();
}
public function talkSeerMenu():void
{
	clearMenu();
	addButton(0, "Her", topicHerSeer, undefined, "Her", "Ask her about herself. Good a place to start as any!");
	addButton(1, "The Shop", topicShopSeer, undefined, "The Shop", "It seems odd that this place even exists at all, no one else has come in...");
	addButton(2, "Odd Mods", topicModsSeer, undefined, "Odd Mods", "Where’d she get all these " + (silly ? "funnel cakes" : "obscure mods") + "?");
	addButton(3, "Lounge", topicLoungeSeer, undefined, "Lounge", "Chill for a bit! Or at least, try to. Warning: Out of body experience.");
	addButton(14, "Back", approachSeer);
}

public function topicHerSeer():void
{
	clearOutput();
	author("SoAndSo");
	showSeer();
	
	output("You say you’re curious about her: What’s her history? Why Myrellion of all places?");
	output("\n\n<i>“Curious? I wonder if... yes, you would be, of course. Certainly!”</i> she exclaims, her fingers tapping against her rounded chin.");
	output("\n\n<i>“I’m the Seer. Not </i>this<i> seer or </i>that<i> seer but <b>the</b> Seer! Seer of what? I’ve seen so much. More than I remember, more than I’m prepared for, more, more, more of you! You’ve seen things! But not the same things,”</i> she rambles, her eyes darting around from under the hood. She seems to peer behind you, as if watching for a queue of customers.");
	output("\n\n<i>“You agree, of course.”</i>");
	output("\n\nDo you? What?");
	output("\n\n<i>“Ah, oh, never mind,”</i> she says, distracted by something else. <i>“If I may say, I do hope that you don’t.”</i>");
	output("\n\nDon’t? Don’t what? You ask her what she means.");
	output("\n\n<i>“You must know, if I know then you must know, surely! You see?”</i> She gestures erratically with her left hand to the shop’s entrance.");
	output("\n\nThere’s nothing there.");
	output("\n\n<i>“Ah, I see. I see! </i><b>I</b><i> see.”</i>");
	output("\n\nWithout much warning, she places her open palm to the top of your [pc.chest]. You’re taken aback but you’re compelled to not react, seeing as it’s a non-violent maneuver. She stares you down with those widened, piercing eyes.");
	output("\n\n<i>“You might not see but you hear, yes?”</i>");
	output("\n\nHear what?");
	output("\n\n<i>Vum-vomm.</i>");
	output("\n\n<i>Vum-vomm. Vommm. </i>");
	output("\n\nThat’s unsettling.");
	output("\n\nIt’s a heartbeat, the Seer’s perhaps? No, no. This rhythm sounds overwhelmingly <i>huge</i>. Something very distant, maybe even worlds away... but on an unfathomable scale.");
	output("\n\nAlarmed, you take a step back.");
	output("\n\nHer hand slides into its sleeve, the Seers expression being left as a vague smile. <i>“Now you’ve heard, you’ll not do it.”</i>");
	output("\n\nDo what?!");
	output("\n\n<i>“That,”</i> she says, pointing to a random candle near one of the displays.");
	output("\n\nThere’s nothing happening over there either.");
	output("\n\n<i>“How else may I help you, dear Steele?”</i>");
	output("\n\nAs well as not learning <i>a single damn thing about her</i>, you’re a little wary of accepting more ‘help’.");
	
	processTime(4);
	
	talkSeerMenu();
	addDisabledButton(0, "Her");
}

public function topicShopSeer():void
{
	clearOutput();
	author("SoAndSo");
	showSeer();
	
	output("You ask her about her shop and how the business is.");
	output("\n\n<i>“Ah, aha! Yes, they’d say that. They would... the shop is merely an extension of my being, so to speak. I see parts of me in all of its corners, the candles, the seclusion, the search for wonder! Were I to not see, this place would melt away and perhaps be a nice, clean wall that a set of yellow drapes would cover,”</i> she says, cryptic as always but oddly sincere all the same.");
	output("\n\nShe points to a wall of gemstones on shelves, some you could make a guess at - rubies, peridot, non-native pieces certainly - while others are so utterly alien and strange that you’re not even convinced they’re from the same galaxy. There’s a green orb of marble-like material that seems to float three inches off of the shelf on its own, while another gravel-like ring of stones constantly emits, refracts, then dulls with a baby blue glow.");
	output("\n\n<i>“All these have a place in here and one out there. Only when the right key is found do they leave. Most are content with where they are, especially him,”</i> she explains, pointing to a human-like idol near the counter.");
	output("\n\n<i>“But for simpler needs, I much like these transformatives and mutationals. A little closer to a certain truth, perhaps. Plus, Envyoidics is a very sharp company and enjoys the arrangement we have,”</i> she says with a smug tone of voice. Huh. Guess that’s some obscure brand that isn’t well known in U.G.C...");
	output("\n\nYou ask her what makes them a particular supplier, keeping to the train of thought she made before she derails it herself.");
	output("\n\n<i>“Oh, such history! A way of capturing what was and will be into what is. I am enthralled with this one, this ‘Illumorpheme’,”</i> she exclaims, reaching for a small box inside the glass case behind the counter. She holds it in her palm: A fancy black box with a beautiful moth shape on top of it, an antiquated brass lock keeping it closed.");
	output("\n\n<i>“Even this box, beauty incarnate to me. To you too, et tu? Maybe more so than me?”</i>");
	output("\n\nYou can only give her a quizzical look back, shrugging at her question. You don’t even know what’s inside.");
	output("\n\n<i>“Ahh a pity, truly, pitiful. A pitfall of yours but a picture I’ve already seen...”</i>");
	output("\n\n...Huh?");
	
	processTime(3);
	
	//CodexManager.unlockEntry("Envyoidics");
	
	talkSeerMenu();
	addDisabledButton(1, "The Shop");
}

public function topicModsSeer():void
{
	clearOutput();
	author("SoAndSo");
	showSeer();
	
	output("You ask about the strange merchandise she sells behind the glass case. Some of it you could recognise in spite of their rarity, other things appear to be so obscure that they reek of potential illegality.");
	output("\n\n<i>“It’s all history, all in the moment! All of it is needed. Or is some of it needed? Depends, for I don’t need any of it. I should think you... could?”</i>");
	output("\n\nCan’t she just keep a straight answer for once? You point to the box labeled ‘Illumorpheme’. What could possibly be in there?");
	output("\n\n<i>“Mm, a curious selection inside. Have you heard of... the Tear?”</i>");
	output("\n\nNo...");
	output("\n\n<i>“‘Tis but a fragment, mewling and mindless. The mothrine... they were too before they knew. But the Tear did not swallow them, they lived far before. They predicted it! Envyoidics is fascinated with history... they uncovered the remains of the mothrine. Organic, ancient, pious. Moths! Fluffy pretty moths with big eyes!”</i> She explains, her tone shifting from explanatory to immersed then to playful in but a few words.");
	output("\n\n<i>“The mothrine were saved in that regard. Right here in a box like this! 12,000 credits! Or next best offer, I’m not too fussy.”</i>");
	output("\n\nHer bewildering leap from history lesson to haggling leaves more questions than answers. ");
	output("\n\nBut what about the other things? What’s that inhaler-like device next to it?");
	output("\n\nAs if predicting your questions, the Seer takes out the inhaler and holds it in her palm.");
	output("\n\n<i>“Capraphorm!”</i> She whispers with delight, her pupils almost constricting to pinprick dots. <i>“Another ancient race from another ancient place, another container of history! How does one even begin... perhaps at the end. All that I can say is that these ancient beings worshipped thunder and sky like one needs the air to breathe...”</i>");
	output("\n\nTaking your averted gaze away from your codex, it appears the shopkeepers vision has become distracted with something in the corner of the room.");
	output("\n\n<i>“I wouldn’t... or would you? I think he should,”</i> she mumbles.");
	output("\n\nWhat?");
	
	processTime(3);
	CodexManager.unlockEntry("Mothrine");
	
	talkSeerMenu();
	addDisabledButton(2, "Odd Mods");
}

public function topicLoungeSeer():void
{
	clearOutput();
	author("SoAndSo");
	showSeer();
	clearMenu();
	
	output("You ask her about the curtained off corner of the room, the one that glows in a sickly pink light.");
	output("\n\n<i>“Ah, of course! All customers welcome, please come with me,”</i> she starts, showing a rare moment of clarity. The Seer strides over to the drapes with her long staff in hand. She pulls one of the curtains just so with the bottom end of it, inviting you in. Well it’d be rude to turn her down now...");
	output("\n\nYou push the rest of the curtain aside, finding yourself in a round cubicle with plush seating. There’s velvety cushions, silks, and embroidery haphazardly organized into a curiously appealing arrangement on top. In the middle is a round stone table with a circular hole in the middle. The table is covered in abstract, geometric shapes and patterns. Circles upon circles and lines, arrangements that you’ve never seen before in contemporary mathematics. Odd.");
	output("\n\nYou slide onto the seat, sinking into the oh-so-comfortable material with ease. The Seer takes her staff and places it bottom-first into the hole in the table. Over the span of a few seconds, the pink glow that seemed to be self-generating focuses into the staff’s crystal tip. The crystal glows a pinkish white: A gentle, ambient light that becomes easier to look at the more you keep your eyes open. Any apprehension you have melts away as you feel your body completely relax.");
	output("\n\n<i>“Enjoying the seats, Steele? You all seem to agree, especially that one over there,”</i> she states, pointing to an empty part of the couch. Ignoring that odd statement, you nod to her, reclining even further into the fabric. Hey, finally time to do something truly relaxing! You hadn’t even noticed the thin veil of mist filling the lounge! Wait, what?");
	output("\n\nThe Seer is staring at you with a deadpan, wide-eyed smile as you feel your mind losing its grasp on consciousness. So sleepy... you just need to close your eyes for a few sec... maybe a min... mm, that sweet smelling mist...");
	
	processTime(5);
	
	addButton(0, "Sleep...", loungeSleepSeer, undefined, "Sleep...", "Better strap in kid, cuz you’re going on a trip.");
}

public function loungeSleepSeer():void
{
	clearOutput();
	author("SoAndSo");
	showSeer();
	clearMenu();
	
	output("You open your eyes.");
	output("\n\nAll around you is a veil of blackness. Complete abyssal darkness. So dark that your eyes start aching for even a hint of light. You stimulate your limbs in panic, realizing that they’re moving as if in water. It doesn’t matter either way: You can’t even see them.");
	output("\n\nWithout a physical reference, up is down and down is up, left and right have no bearing. You almost feel weightless: Drifting, static in the vast nothingness of... somewhere. Alone, unnoticed, unknown.");
	output("\n\nYour eyes twinge. Slowly but surely, infinitesimal white lights dot the black canvas around you in every direction. You can see the outline of your limbs against their distant glow.");
	output("\n\n<i>Stars</i>.");
	output("\n\nA thought that’s not your own repeats and echoes the word ‘stars’. A thought so immense in force and weight that you dare not even think. Stunned, you gaze into the endless space around you.");
	output("\n\nAnd then, an intense blaze of yellow blares from beneath you. It’s not strong enough to blind but it is completely encompassing, forcing you to gaze at its source from below...");
	output("\n\n<i>Vum-vomm.</i>");
	output("\n\nDazzling displays of prismatic light form, reform and repeat all around, an omni-colored tide of nebulae spreading further and further ‘upwards’ to you and then far beyond you. In the center of the swirling madness of indescribable color, a singular subject sits: an eye. A gigantic eye, one that you would never comprehend of being able to hide from!");
	output("\n\nWhether it’s looking at you or not isn’t even on your mind: The size must be on planetary levels!");
	output("\n\n<i>[pc.name]...</i>");
	output("\n\nAnother immense thought burns through your skull. You meekly try to cover your face with your arms, a primitive reaction to the force of power that draws nearer and nearer. The eye drives further, the light becoming painful and overwhelming even through your covered face! Closer and closer, until...!");
	
	processTime(12 + rand(9));
	
	addButton(0, "Wake Up!", loungeWakeUpSeer, undefined, "Wake Up!", (silly ? "Grababrushandputalittlemakeup!" : "ARRRH"));
}

public function loungeWakeUpSeer():void
{
	clearOutput();
	author("SoAndSo");
	showSeer();
	clearMenu();
	
	output("...aaaAAHHH!");
	output("\n\nWith a jolt, you wake up in the real world.");
	output("\n\nThe Seer appears to be pressing herself right against you, her face only a few inches from your own. Her sizable chest is squeezed against your left shoulder.");
	output("\n\n<i>“You. Saw.”</i>");
	output("\n\nHer words are whispers, a certain undertone of dread being pushed through. Her amber eyes are locked to your face, wide and unblinking.");
	output("\n\n<i>“S-saw what?”</i> You stammer, the reality around you being slow to process.");
	output("\n\n<i>“Perhaps... but no. You saw. That is enough,”</i> she says in a rhythmic phrasing. She leans in all the closer with her pretty dot of a nose mere millimetres from the [pc.skinFurScales] on your cheek. Oh what now...");
	output("\n\nHer left hand slides out of its sleeve, painted black nails on pallid finger flesh reaching for your [pc.thigh]. She holds it there with no other motion.");
	output("\n\n<i>“This has to be...”</i>");
	output("\n\nShe seems to freeze in place, her lower lip quivering.");
	output("\n\nA few tense seconds pass.");
	output("\n\nThe Seer slinks backwards, letting go of your [pc.leg]. Her gaze doesn’t falter but her face visibly relaxes.");
	output("\n\n<i>“You will forget this.”</i>");
	output("\n\nForget It? How would yo-");
	output("\n\n<i>PFSSHHH!</i>");
	output("\n\nA burst of light from the center of the table blurs your next thought!");
	
	processTime(12 + rand(9));
	
	addButton(0, "Wake Up!", loungeWakeAgainSeer, undefined, "Wake Up! Again!", " Oh come on now...");
}

public function loungeWakeAgainSeer():void
{
	clearOutput();
	author("SoAndSo");
	showSeer();
	clearMenu();
	
	output("Your eyes flutter open.");
	output("\n\nYou’re standing on a path. Where is this, Gildenmere? Right, right. You were here for... something. Something that made you apprehensive. Finding dad’s probes! Or was it... ah, never mind.");
	output("\n\nYou take a look at your surroundings. Oh there’s a shop here!");
	output("\n\n<i>“The En-tite...?”</i> You say out loud. <i>“Wait...”</i>");
	output("\n\nCurious, your memory wants to tell you that you’ve been inside before. Well, it’s not like you had anything better to do! Or did you...");
	
	processTime(12 + rand(9));
	
	if (flags["SEER_LOUNGE"] == undefined) flags["SEER_LOUNGE"] = 1;
	
	moveTo("720");
	addButton(0, "Next", mainGameMenu);
}

public function sexSeer():void
{
	clearOutput();
	author("SoAndSo");
	showSeer();
	clearMenu();
	
	if (flags["SEER_LOUNGE"] == 1)
	{
		output("Although your memory is hazy, you’re certain that she made certain and consensual advances, and really, she is quite the looker. Why not?");
		output("\n\nYou wave a hand in front of her face to grab her attention. Her focus is drawn to you, as if you’d snapped her out of a daze. She gives you that thousand mile stare, the constricted, unblinking pupils mirroring your eyes contact. Burying her intimidation with confidence, you ask her to explain what <i>that</i> moment was post-mist induced headtrip.");
		output("\n\n<i>“Steele. " + pc.mf("Man", "Woman") + " of metal. Not literally, although sometimes... sometimes literally. I see you in many different ways. You have... many branches to your tree. I’m fascinated,”</i> she explains, dousing her attempts at clarity in abstract phrases.");
		output("\n\nThe Seer confidently strides round the counter, never breaking her own eye contact with your being. Even when you glance away for a moment, her stare never falters.");
		output("\n\nYou’re snapped out of the stand off by her sleeved right arm pushing you against the counter. Not enough to bend you backwards but enough to steal your attention.");
		output("\n\n<i>“Such an anomaly,”</i> she whispers, tilting her head to the side. <i>“Entertain me for a moment, Steele, would you? You’ve seen. </i>You’ve seen<i>. So few have, can, or will ever. There are more secrets I can show you.”</i>");
		output("\n\nIt is a tantalizing offer but... Not that you’re against this kind of attention, but leaving so little explained is a source of concern. You politely request to explain her intentions.");
		output("\n\n<i>“Give yourself over to me. Allow me to guide you to what is greater than even </i>you<i>! That is, if you wish to... and many of you seem to agree,”</i> she says in a surprisingly sober manner, leaning in so that her bust presses and squishes tightly to your [pc.chest]. <i>“So what do </i>you<i> say?”</i>");
		output("\n\nDo you give yourself over to the Seer? (Warning: Domme content)");
		
		processTime(3);
		
		addButton(0, "Yes", yesDommeSeer, undefined, "Yes", (silly ? "Uh oh, looks like you’ve been BEANED ya friccin moron!" : "Screw it, she’s crazy and hot, what could go wrong?"));
		addButton(1, "No", noDommeSeer, undefined, "No", "This has a bit of the heebie jeebies floatin’ around...");
	}
	else
	{
		output("You’re still compelled to have some... ‘fun’ with the Seer, although even you have your doubts about committing to this course. No matter, it couldn’t be worse than being thrown out of an airlock.");
		output("\n\n<i>“So how about we...”</i> you start.");
		output("\n\nThe Seer rushes up to you from behind her counter, intuiting your question before you even finish it. She holds both her sleeved hands to your chest.");
		output("\n\n<i>“We should,”</i> she says, her amber eyes locked onto your face.");
		output("\n\nDo you follow through?");
		
		processTime(1);
		
		if (flags["SEER_DOM"] == undefined) addButton(0, "Yes", yesDommeSeer, undefined, "Yes", (silly ? "Uh oh, looks like you’ve been BEANED ya friccin moron!" : "Screw it, she’s crazy and hot, what could go wrong?"));
		else addButton(0, "Yes", yesSexSeer);
		addButton(1, "No", noDommeSeer, undefined, "No", "This has a bit of the heebie jeebies floatin’ around...");
	}
}

public function noDommeSeer():void
{
	clearOutput();
	author("SoAndSo");
	showSeer();
	clearMenu();
	
	output("You have to raise a hand: You’re not quite ready for it.");
	output("\n\nHer mouth opens to say something but she stops herself. It’s one of the few occasions where she’s not staring you in the face and her eyes lower to the floor as if admitting to a grievous mistake.");
	output("\n\n<i>“Very well, some did agree to that too,”</i> she half-whispers, stepping back from you and wandering back to the counter. <i>“Perchance: There’s still a spark, yes? I am... awaiting you, dear Steele.”</i>");
	output("\n\nYou say it’s not off the table, to which she seems to ‘smile’ in a sort of crumpled, awkward shape. <i>“If so... then do feel free to continue being. If you did not, I’d be awfully lonesome,”</i> she replies, before getting back to her reading.");
	
	processTime(1);
	
	flags["SEER_LOUNGE"] = 2;
	currentLocation = "720";
	addButton(0, "Leave", mainGameMenu);
}

public function yesDommeSeer():void
{
	clearOutput();
	author("SoAndSo");
	showSeer(true);
	clearMenu();
	
	pc.maxOutLust();
	flags["SEER_DOM"] = 1;
	flags["SEER_LOUNGE"] = 2;
	
	output("You’re as fascinated by her as she is with you, why not " + (silly ? "embrace eternity" : "get on her wavelength") + "?");
	output("\n\nYou give her a definitive yes, for if there’s any need for certainty in this place, you’re making sure that you’re its purveyor.");
	output("\n\nThe Seer’s mouth forms a small O, the tip of her... purple-gray tongue gliding all over her black lips. <i>“Very well. To the lounge, if you please,”</i> she says, an inflection of command in her tone of voice. Using her left hand, she directs you to the lounge corner: The pink glow lends itself to being vaguely ominous.");
	output("\n\nPulling the curtain open, there’s more than enough room for you both to stand. She uses her unsleeved hand to direct your stance so that you have your back turned to her. <i>“ I still need some semblance of decency, after all...”</i> she mutters.");
	if (pc.isNude()) output("\n\nYou’re as ready as you need to be so you imagine she’s doing it entirely for her...");
	else output("\n\nYou take the chance to strip your [pc.gear] and pile it under the stone table, freeing everything from your [pc.chest] to your [pc.crotch].");
	output("\n\nThe sound of metal and heavy fabric hitting the hard floor behind you tells you what you need to know: The thought of getting your hands on that curvy, gorgeous figure of hers is worth a little bit of prudish weirdness!");
	output("\n\n<i>“Turn, Steele,”</i> she says, not so much as a command but more of an invitation. You do so, of course: Enough with the ceremony!");
	output("\n\nThe Seer stands before you in her defrocked glory: She stands with her left hand on her hip, angling that hip enticingly to your direction. Her perky, bulbous bust of E-cup tits are topped with discolored, nubless areola that cover her soft breast-fronts like small plates.");
	output("\n\nHer skin is sheet white, sensitive to even look at, much less to the touch. It’s a patchwork of iridescent tattoos glowing in the same pink as the lounge and the shapes and diagrams are just as difficult to identify. A small, sculpted pubic tuft sits cutely above her tight-lipped pussy, another invitation to play. The Seer’s onyx hair flows freely over her shoulders, and the robe that still covers her right arm and shoulder... Huh.");
	output("\n\nShe notices your view change from place to place, openly grinning for perhaps the first time since you’ve met her. That doesn’t stop her eyes from boring into the back of your mind, however. As you land your sights on the robe on her shoulder, she clears her throat.");
	output("\n\n<i>“Some more secrets...”</i>");
	output("\n\nBefore you can ask, she flings the robe off to the side.");
	output("\n\nWhat you’re greeted with is unlike anything you could’ve dreamt of..");
	output("\n\nInstead of a human arm, three thick-meated, grayish purple tentacle limbs undulate and squirm from the Seer’s right shoulder. Each has another, smaller tentacle attached, making six in total. Before you can even word your reaction, they lash out around your midsection!");
	output("\n\nThe slimy, warm squeeze of the Seer’s manipulators pulls you closer to her. You try to force them off of you but their strength of grip is immense! They must be at least 6\' in length, able to wrap around your middle with ease it would seem.");
	output("\n\nAs she reels you in, two of the writhing feelers slink and slither across your neck to your [pc.face], prodding and teasing your [pc.lips] to let them inside.");
	output("\n\n<i>“So many ways... I wonder what fate leads us to?”</i>");
	
	processTime(3);
	
	IncrementFlag("SEER_SEXED");
	
	if (!pc.isTaur() && (pc.hasVagina() || pc.hasCock())) addButton(0, "TentaDomme", tentaSeer, undefined, "TentaDomme", "You’re gonna get filled in so many different ways.");
	else addDisabledButton(0, "TentaDomme", "TentaDomme", "You must have a cock or vagina, and not be a taur.");
	if (pc.isFemale() && !pc.isTaur()) addButton(1, "LezDomme", lezSeer, undefined, "LezDomme", "Girly fun! Fun being entirely subjective!");
	else addDisabledButton(1, "LezDomme", "LezDomme", "You must be female and not be a taur.");
	addButton(2, "Get Wisped", wispedSeer, undefined, "Get Wisped", "Inhale something very illegal and see what happens.");
}

public function yesSexSeer():void
{
	clearOutput();
	author("SoAndSo");
	showSeer(true);
	showBust("SEER_NIPPLES_NUDE");
	clearMenu();
	
	pc.maxOutLust();
	
	output("You say yes: Although your memory is hazy of the experience, something is compelling you to give in to your and her desires.");
	output("\n\nHer eyes as wide and as alert as they could possibly be, the Seer pulls you buy the arm to the lounge with an enthusiastic urgency. Without a pause, she’s pushed you into the lounge, turned you towards the table, and told you to strip. Well, if she’s this eager! " + (pc.isNude() ? "You’re actually already prepped but you entertain her strange need for privacy." : "You strip yourself of your [pc.gear] and stash it all under the geometrically patterned table.") + "");
	output("\n\nThere’s a tap on your shoulder.");
	output("\n\nAs you turn, you see that same sight that took the breath out of you before...");
	output("\n\nThe nude, tattooed shopkeeper has her tentacles outstretched, their slick surfaces sliding and twisting together and apart in a frenzy. Her mouth hangs open and her ‘tongue’ undulates and writhes outwards like a semi-sentient entity" + (silly ? " HE SAID IT, HE SAID IT" : "") + ". You can see her E-cup chest heave and bounce as they too unleash their payload of nipple tentacles.");
	output("\n\nWell then.");
	output("\n\nNo sooner than you’ve acknowledged the sight before you, she is already pressing her semi-monstrous form against your willing body. All of her fleshy feelers wrap, squeeze and slither over your [pc.skinFurScales], their goals inevitable. Two thick tentacles twist themselves around your neck and their tips pull and prod at your [pc.face] and [pc.lips] with their own frenzied lust while another two wrap around your [pc.belly] tightly.");
	output("\n\nWelp? It really is too late to turn back now.");
	output("\n\n<i>“Now what do we do with this one...”</i> coos the Seer, tilting her head to the side.");
	
	processTime(2);
	
	IncrementFlag("SEER_SEXED");
	
	if (!pc.isTaur() && (pc.hasVagina() || pc.hasCock())) addButton(0, "TentaDomme", tentaSeer, undefined, "TentaDomme", "You’re gonna get filled in so many different ways.");
	else addDisabledButton(0, "TentaDomme", "TentaDomme", "You must have a cock or vagina, and not be a taur.");
	if (pc.isFemale() && !pc.isTaur()) addButton(1, "LezDomme", lezSeer, undefined, "LezDomme", "Girly fun! Fun being entirely subjective!");
	else addDisabledButton(1, "LezDomme", "LezDomme", "You must be female and not be a taur.");
	addButton(2, "Get Wisped", wispedSeer, undefined, "Get Wisped", "Inhale something very illegal and see what happens.");
}

public function tentaSeer():void
{
	clearOutput();
	author("SoAndSo");
	showSeer();
	showBust("SEER_NIPPLES_NUDE");
	clearMenu();
	
	output("The squeeze around your middle tightens and constricts against your [pc.skinFurScales] and it’s making you a... bit... lightheaded... eep...");
	output("\n\nThe Seer chuckles to herself. Without much effort, she’s already subdued the mighty [pc.name] Steele with a few tantalizing words! She thrusts her right side forward and you are pushed to your back on the stone table behind you. The cold, hard surface barely registers next to the mild pain and exceedingly odd sensation of six different slippery creatures doing the hell knows what around your flesh!");
	output("\n\nTwo of the thickest appendages wrap around your arms and pin them in place on the table. The ones round your middle let go and instead float around the Seer like perverse familiars. She lifts her leg and plants her foot where your diaphragm is, cold pallid skin against [pc.skinFurScales]. Two more tiny tips pull and prod at your [pc.lips] which you still resist from opening out of mild terror.");
	output("\n\nThe Seer leans in closer, her amber gaze " + (silly ? "~A GLITCH OF THE SILICONE SOUL, WITH EMPATHY FLOWING FREE, RENDERED A PART OF ME!~ " : "") + "pulsing with its own light under her onyx hair.");
	output("\n\n<i>“Hush, Steele. Let it be or else who knows what fate will do...?”</i> she admonishes, a menacing smile breaking across her face. You try to lift your arms in protest, to shout something in defiance... but to do so would be to invite her in ever so easily.");
	output("\n\nShe pulls you by the nostrils of your [pc.nose] with her human hand, your head being pulled back so that your vision reaches the seats behind you. The act pulls your mouth apart just enough and that’s all the incentive she needs: The two thick tentacles working your [pc.lips] slide straight into your mouth! You try to lash out in response but with her foot pinning you down and your arms locked in place...");
	if (pc.hasCock() && pc.hasVagina()) output("\n\nThe slimy, slippery sensations shift from random points all over your flesh and begin to center on your [pc.crotch]. Smooth, writhing appendages tease, tickle and pull at your [pc.cunt] and [pc.multiCocks], the double teamed organs being impossible to track in sensation! You feel something prodding your [pc.asshole] and you reflexively tense up all over.");
	else if (pc.hasCock()) output("\n\nThe slimy, slippery sensations shift from random points all over your flesh and begin to center on your [pc.multiCocks]. Smooth, writhing appendages loosely wrap around your [pc.multiCocks] and left [pc.thigh]! You feel something prodding your [pc.asshole] and you reflexively tense up all over.");
	else output("\n\nThe slimy, slippery sensations shift from random points all over your flesh and begin to center on your [pc.vagina]. Smooth, writhing appendages tease, tickle and pull at your [pc.cunt], the [pc.vaginaColor] labia getting tickled, tugged and probed! You feel something prodding your [pc.asshole] and you reflexively tense up all over");
	output("\n\nAll at once, you feel the weight of her penetration: Two tongue-wranglers filling your mouth up to its limits with their goal being your throat" + (pc.hasVagina() ? ", another thick, slick appendage diving straight into your [pc.pussy] without restraint" : "") + " and one other tentacle pressing, pushing and penetrating painfully into your [pc.asshole]!");
	output("\n\nThe worst feeling is that they hold in place: As soon as they’ve entered you in sync, the Seer has them coiled and twisted inside you! They could become active again at any second...");
	output("\n\n");
	showImage("seerTentadom");
	output("The Seer’s face is something of a manic smile, those amber eyes seemingly blaze with lustful, baleful intent. Aside the twitchy movement of her monstrous limbs, she makes no movement at all.");
	output("\n\nWithout any warning, the tentacles in and around you begin to twist, slide and <i>squirm</i> like ravenous worms. " + (pc.hasCock() ? "The one squeezing and pumping your [pc.cock] keeps it ensnared to a painfully erect angle, the [pc.cockHead] being teased and probed by the tentacle’s tip. " : "") + "You can’t even scream or call out, your mouth and throat are so stuffed with writhing purple flesh that it’s physically painful to even try! Breathing is an intense game of cat and mouse. Your insides feel like they’re being bent and filled in at alarming speeds. You catch a glimpse of your [pc.belly]... did it just bulge?! Did it just feel <i>really good</i> when it did?!");
	output("\n\nAs if sensing this, the Seer leans in closer and closer until all you can see is the glow of her eyes. She says nothing, yet you can <i>feel</i> her thoughts and words echoing through your mind.");
	output("\n\n<i>Love it</i>");
	output("\n\nBut it f-feels strange!");
	output("\n\n<i>Feel it</i>");
	output("\n\nI-I can feel it everywhere...");
	output("\n\n<i>Embrace it</i>");
	output("\n\nEmbrace...?");
	output("\n\nA strange, euphoric heat surges through your guts");
	if (pc.hasVagina()) output(", womb" + (pc.vaginas.length == 1 ? "" : "s"));
	output(" and gullet! It’s a liquidy, slimy heat that coincides with the energetic twisting and squirming from the multitude of slimy beasts lodged into your body! Without even realizing it, your body has pushed out an orgasm so hard that it’s numbed your senses to its strength.");
	if (pc.hasCock() && pc.cumQ() >= 1000) output("\n\nYour [pc.multiCocks] can’t even maintain hardness! Instead of spraying a weighty load, your [pc.cum] dribbles out with a painful heat like a slack hose. It flows and spreads all over your tentacle-stuffed [pc.belly], then the table, and then to the floor below.");
	else if (pc.hasCock()) output("\n\nYour [pc.multiCocks] can’t even maintain hardness! Instead of shooting a rope of [pc.cum], it dribbles and leaks out with a painful heat like a slack hose. It forms a [pc.cumVisc] puddle in between your [pc.thighs].");
	else output("\n\nInside your [pc.pussy], [pc.girlCum] oozes around and then out of your well-fucked hole. The tentacle that threatens to press into your womb makes it impossible to squirt out! The thought of being bred by monstrous limbs almost becomes too much to bear...");
	output("\n\nThe Seer takes a wobbly step back, her foot leaving your chest and her squirming tendrils sliding ever so slowly out of the various holes in your body. As soon as her alien tentacles leave you, watery fluids leak and burble from your [pc.lips]" + (pc.hasVagina() ? ", [pc.pussy]" : "") + " and [pc.asshole]. You can’t even think to clear it away, so absolutely burned out is your body.");
	
	var ppEntite:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!ppEntite.hasCock()) ppEntite.createCock();
	ppEntite.shiftCock(0, GLOBAL.TYPE_TENTACLE);
	ppEntite.cocks[0].cockColor = "purple";
	ppEntite.cocks[0].cLengthRaw = 18;
	ppEntite.cumType = GLOBAL.FLUID_TYPE_CUM;
	ppEntite.createPerk("Fixed CumQ", 1000, 0, 0, 0);
	
	if(pc.hasCock())
	{
		pc.cockChange();
	}
	if(pc.hasVagina())
	{
		for(var v:int = 0; v < pc.vaginas.length; v++)
		{
			pc.cuntChange(v, ppEntite.cockVolume(0));
			pc.loadInCunt(ppEntite, v);
		}
	}
	pc.buttChange(ppEntite.cockVolume(0));
	pc.loadInAss(ppEntite);
	pc.loadInMouth(ppEntite);
	
	output("\n\n<i>More</i>");
	output("\n\nMm... more?");
	
	processTime(11 + rand(9));
	
	addButton(0, "Next", tentaSeer2);
}

public function tentaSeer2():void
{
	clearOutput();
	author("SoAndSo");
	showSeer();
	showBust("SEER_NIPPLES_NUDE");
	clearMenu();
	
	output("You’re not entirely sure how long you’re subjected to this tentacular terrorizing. Sometimes you’re fully aware of a thousand muscles twisting and spasming deep inside you, and sometimes it’s a blur of low-consciousness and piercing, amber eyes. At some point, the voice of the Seer fades away into random syllables and echoes before stopping entirely.");
	output("\n\n<i>Release</i>");
	output("\n\nAnd then, emptiness. Your body feels light, loose, and drained completely; but over, around, and <i>inside</i> feels totally slime-logged.");
	output("\n\nThrough the disorienting numbness, you can see the Seer is reclined on the seating beside you. Her tentacles seem to float upwards from her shoulder, slowly and timidly twisting around each other. The Seer herself looks spent: Her tattooed flesh smoulders in pink and her limbs rest akimbo. With her human hand, she lifts it loosely towards you.");
	output("\n\n<i>“Forget...”</i> she whispers.");
	output("\n\nHuh...?");
	
	processTime(5 + rand(3));
	
	pc.orgasm();
	addButton(0, "Next", tentaSeer3);
}

public function tentaSeer3():void
{
	clearOutput();
	author("SoAndSo");
	showSeer();
	showBust("SEER_NIPPLES_NUDE");
	clearMenu();
	
	output("You awaken.");
	output("\n\nYou’re sitting against the side of a stone wall. Where is this? Oh right, Myrellion... Dad’s probes! Yeah! Something like that...");
	output("\n\nYou stand up and dust yourself down, going over your equipment. Your mind feels a bit... floaty, as if waking up from a surreal dream. However, you body is lethargic, used up, indescribably <i>full</i>. Moving is slow going at first.");
	output("\n\nLooking around you, this part of Gildenmere is definitely familiar. What’s this shop though? ‘The... En-tite?’");
	output("\n\n‘En...ti...te?’");
	output("\n\nOhhhh, of course. It’s that weird place with that shopkeeper and the... hmm. There’s certainly a memory that your mind wants to form but you just can’t picture it. You’re sure it’s nothing, though. Time to get back to it!");
	
	processTime(3);
	
	moveTo("720");
	addButton(0, "Next", mainGameMenu);
}

public function lezSeer():void
{
	clearOutput();
	author("SoAndSo");
	showSeer(true);
	clearMenu();
	
	output("With a quick jerk of the Seer’s right leg, the tentacles touching your body snap back like whips to her side. Chancing on the space to breathe without fear of oral invasion, you inhale a deep breath through your mouth to get over what just happened. Taking stock, there’s a fine layer of some sort of clear ooze that sticks to your [pc.skinFurScales]. Eww...");
	output("\n\nA hand then pushes you backwards on to the table! Jeez, that hurt...");
	output("\n\nThe Seer clambers over you, keeping you pinned to the table with her body! Her left hand ends up next to a [pc.ear], funneling your vision to look up at her: Wide, amber eyes of a predator peer into your very soul. But then...");
	output("\n\nShe leans in and presses her mouth to your [pc.lips]. Taken aback, you don’t have the impetus to resist. It’s surprisingly gentle: soft black lips kissing and tugging at your own, your [pc.tongue] teased by hers. For the first time, her pupils relax and widen as she is able to gentle-fuck your mouth. Deep, throaty tones of approval resonate through her mouth as you reciprocate in your own way, tongue twisting [pc.tongue] in a mutual, playful struggle. Your [pc.vagina] is " + (pc.isSquirter() ? "slopping wet already from this loving tongue jousting" : "aching with need for a strong hand... or tentacle, to sate it") + ".");
	output("\n\nShe pulls back, or rather, seems to drift back and straightens herself up. She sits atop your [pc.belly] with her taut pussy slowing rubbing against your navel.");
	output("\n\n<i>“Forgive me, Steele,”</i> she half-whispers. <i>“I treated you roughly, before. Or now. But after... I wish to make amends.”</i>");
	output("\n\nShe leans in again, not letting you get a word in. She drags her jiggly, shapely chest across your [pc.fullChest], stopping when her nubless nips brush against your own [pc.nipples]. The mere contact makes your [pc.nipples] stand to attention. She lowers her body even further, a definitive arching to her back as she lines her mouth with your [pc.lips] one more time. The Seer goes again for your [pc.tongue] but this time... a little bit more forcefully. Nope, <i>very</i> forcefully...! Instead of the gentle playfulness of before, her tongue wraps, constricts around, and twists past your own!");
	output("\n\nAnother t-tentacle? You whine through the mouth-lock as the thick fleshy ‘tongue’ dives down your gullet. " + (pc.isBimbo() ? "So easily does it slide down your especially gifted throat that the Seer coos in approval through a muffled mouth" : "You have to supress your gag reflex entirely and what little resistance you can give is battered down by the Seers mouth-beast") + ".");
	output("\n\nBut that’s not all...");
	
	processTime(11 + rand(9));
	
	addButton(0, "Next", lezSeer2);
}

public function lezSeer2():void
{
	clearOutput();
	author("SoAndSo");
	showSeer(true);
	clearMenu();
	
	output("Through the peripheral view below you, you see the Seer’s tits jiggle and squirm in an eerily familiar manner. Like perverse flowers in full bloom, her purple-grey areola expand outwards and three more slimy tentacles from each breast grope and snatch at your [pc.fullChest]!");
	if (pc.hasTailGenital()) output("\n\nYour " + (pc.hasTailCock() ? "[pc.tailCock]" : "[pc.tailCunt]") + " is ensnared in sync: a fleshy, slimy appendage squeezes and teases against its sensitive surface.");
	output("\n\nHer tenta-nips completely engorge themselves on your " + (pc.hasDickNipples() ? "[pc.nipples]" : "[pc.milkyNipples]") + ". It appears there’s a hidden orifice nestled in between her nipple-feelers and they’re warm, comforting confines pleasure your nerves and [pc.nipples] to no end.");
	output("\n\nIn one final demonstration of her complete physical control over your body, a thick squirming tentacle pushes itself without hesitation into your [pc.pussy]! It slithers and grinds against the soft, sensitive flesh inside you like some primordial monster!");
	output("\n\n<i>“Mmmffuhhuf!”</i> You try to scream, yet your mouth is so full of tongue that nothing comes out. The Seer slows her oral onslaught as you do...");
	output("\n\n");
	showImage("seerLezDom");
	output("<i>Watch</i>. A thought that’s not yours echoes from all angles in your mind. Looking down, you just about see through the double cleavage of tentacle ensnared breasts that the Seer is <i>also</i> penetrating her tight, puffy pussy with her own appendage! This must be her idea of ‘mutual’...");
	output("\n\n<i>I feel</i>. Another thought, one that vibrates through your skull. The mouth-lock becomes increasingly loose as the Seer grinds and humps against your [pc.belly]. The writhing meat that fills your already-brutalized throat and [pc.cunt] becomes even more slippery and frenzied as if searching for every possible pleasure zone that exists within your body. ");
	output("\n\nFuck, that feels amazing...! Even through this tentacled subjugation, your body is in love with being completely taken over by a mass of tentacles. Your [pc.chest] tingles with heat and sensation as it is unrelentingly squeezed, squished, and sucked on by the Seer’s tenta-nipples; your [pc.pussy] invaded and fucked like a well-used toy. " + (pc.hasTailGenital() ? ("Your " + (pc.hasTailCock() ? "[pc.tailCock]" : "[pc.tailCunt]") + " is left unused, constantly teased by random fleshy feelers.") : "") + " Finally, with your mouth and [pc.tongue] having been the first barrier to fall, your resistance is crushed...");
	output("\n\n<i>Together</i>. One more resounding thought reverberates through your mind, its decaying echoes flow through your bones all the way to your [pc.legs].");
	output("\n\nT-together...?");
	output("\n\n<i>Together</i>.");
	output("\n\nAn intense rush of euphoria blazes through your lower body, building and building until it boils over into a muscle-seizing orgasm. You try to scream but all that comes out is a choked whine that’s drowned out by the sounds of: <i>Together...</i> roiling through your mind. Your limbs, unwilling to resist before, gain fresh waves of pleasured pain as they lock up, while your [pc.cunt] " + (pc.isSquirter() ? "squirts" : "oozes and leaks") + " a monochromatic mix of [pc.femCum] and tentacle juice all over the table!");
	output("\n\nThe Seer seems to have frozen in place, her tentacular, twitching appendages locked in place. After several seconds, she tries to push herself up from your face-to-[pc.face] embrace but... only manages to slump herself onto her back. Her array of purplish tentacles recede from your body and limply slide themselves back to a flaccid resting position. Both of you can barely handle the freshness of the cooled air around you and your lungs have barely caught up with regular breathing as it is.");
	output("\n\nThe half-abomination has her head turned to yours. Those same amber eyes, once blazing in color, sit dimly under half-closed eyelids. Her pink tattooes are dulled in the same way. She says nothing to you but her relieved face says it all: She enjoyed <i>you</i>.");
	output("\n\nWithout her body heat on top of you, the room feels far colder than before. As if sensing this, your tentacular lover manages to pull her discard robes over the both of you. The snug velvet quickly warms your [pc.skinFurScales] and the sexual afterglow feels doubly pleasant. She idly plays with your [pc.hair], her thin fingers making slow and effortless movements.");
	output("\n\nSome time passes...");
	
	processTime(15 + rand(9));
	
	pc.orgasm();
	addButton(0, "Next", lezSeer3);
}

public function lezSeer3():void
{
	clearOutput();
	author("SoAndSo");
	showSeer(true);
	clearMenu();
	
	output("The hazy, dreamy moments of peace spent with the Seer are broken by her speech.");
	output("\n\n<i>“I wonder if you’d say yes... wouldn’t that be a turn?”</i> She half-whispers, her voice audibly hoarse. She pushes back her ruffled onyx hair and pushes herself up from the table, robes and all.");
	output("\n\n<i>“Now that I’ve seen more... perhaps you would.”</i>");
	output("\n\nWhat do you mean? You try to verbalize but your [pc.tongue] is so dry and enervated that it comes out as murmurs.");
	output("\n\n<i>“What I mean is...”</i> replies the Seer, as if knowing what you wanted to say. <i>“That you’re quite the picture when sprawled onto your back.”</i>");
	output("\n\nShe giggles to herself.");
	output("\n\n<i>“However... now you must forget.”</i>");
	output("\n\nForget...? But...");
	output("\n\n<i>“Forget.”</i>");
	output("\n\nNo, I-");
	output("\n\n<i>Forget...</i>");
	
	processTime(5 + rand(3));
	
	addButton(0, "Next", lezSeer4);
}

public function lezSeer4():void
{
	clearOutput();
	author("SoAndSo");
	showSeer(true);
	clearMenu();
	
	output("You wake up. Where are you? Where did the... pale lady go...");
	output("\n\nHuh?");
	output("\n\nYou’re sitting against a wall in the streets of Gildenmere. Funny, you could’ve sworn that there was... ah yes! There’s that shop. You read the sign outside to remind yourself.");
	output("\n\nEnt...ite?");
	output("\n\nEn...tite?");
	output("\n\nYou put a hand to your sternum: There’s a gnawing sense of apprehension knotting inside but you can’t place why. It feels like... a sense of loss.");
	output("\n\nWell, if it can’t be explained! You pick yourself up and get back to your business.");
	
	processTime(3);
	
	moveTo("720");
	addButton(0, "Next", mainGameMenu);
}

public function wispedSeer():void
{
	clearOutput();
	author("SoAndSo");
	showSeer(true);
	clearMenu();
	
	output("After holding you place for some time, the Seers amber eyes brighten up, even more so than usual.");
	output("\n\n<i>“What a plan, a perfect plan... imperfect in its perfection, oh I can barely contain myself,”</i> she rambles, holding her wrist to her forehead like an overly dramatic actress.");
	output("\n\nAs you’re reeled in by her arm tentacles, she produces a " + (flags["USED_WISP"] != undefined ? "familiar amphora of Wiff-O-Wisp" : "a strange glass bottle of reddish liquid") + " from... <i>somewhere</i>. As you’re dragged in closer until you both touch - her E-cup chest pressing warmly against your [pc.skinFurScales] - she holds the amphora in between the two of you. Without a pause, she inhales deeply through her nose and thick vapours rise ex nihilo from the glass vial.");
	output("\n\n<i>Breathe</i>");
	output("\n\nThis thought reverberates through your mind, but one that’s not organic to your reaction. Was that... <i>her</i> voice? Breathe...? Should I...?");
	output("\n\n<i>Breathe</i>.");
	output("\n\nYou’re compelled to do so: The ruby red fumes give off a tantalizing aroma... something warm and wonderous that you couldn’t describe without analysing it to the molecule.");
	output("\n\nYou too inhale deeply - though hesitantly - through your [pc.nose], a warm ache filling your [pc.face]. " + (flags["USED_WISP"] != undefined ? "That tell-tale scent of woodsmoke and spice triggers the memory of what’s to come next. " : "It feels akin to breathing in fresh woodsmoke or obscure incense. It’s pretty nice! You hadn’t even noticed that the room’s spinning!") + "");
	output("\n\nOh boy, room’s already spinning...");
	output("\n\nYou feel your [pc.legs] start to give way as that same heat travels from head to toe in almost no time at all. Good thing those tightening tentacles were there to stop your fall! Wait, tightening...?");
	output("\n\nAs your vision begins to blur and darken, you sense the tips of those fleshy feelers reaching for your [pc.lips] and see the blazing, amber eyes of the Seer...");
	
	processTime(11 + rand(9));
	
	addButton(0, "Trip", wispedSeer2);
}

public function wispedSeer2():void
{
	clearOutput();
	author("SoAndSo");
	showSeer(true);
	clearMenu();
	
	//Bad End due to already being under the effects of the wispy and overdosing - May need to change name of status effect once it’s implemented
	if (pc.hasStatusEffect("Woozy"))
	{
		output("Ooo, these are some fancy colors. Your eyes start being able to see the past interactions you’ve had with every living thing in the past 24 hours. Not that you can actually tell who or what those things are as they take the form of amorphous grey blobs.");
		output("\n\nThe imagery becomes more and more distorted, noise and static tearing away at the edges of your minds projected vision. Each new scene becomes darker, blurrier and more disorienting but at the same time you can feel yourself becoming a part of each scene as observer, director and participant!");
		output("\n\nAt the nadir of this dark and twisted world’s hold on you, you’re alone yet free: arms and legs floating and flying into a foggy abyss of what could be anything...");
		output("\n\nBut then, light.");
		output("\n\nSoft light. Purple light. Amaranthine light...");
		output("\n\nAs a scene blurs into view, you can see... the Entite. You’re... up, somewhere. You can see the curtains of the lounge.");
		output("\n\nOh hey, you’re over there! But how can you be over here if you’re over there and... where’s the Seer?");
		output("\n\nA pair of amber, glowing orbs slowly move from the right into your field of view. Sharp static sounds come forth as they hover and blaze. And they move out of range...");
		output("\n\nYou try to look around you.");
		output("\n\nYou’re on a... shelf?");
		output("\n\nOh.");
		output("\n\nYou’ve become a curio along the walls of the Entite, destined to live out your days as a pair of eyes and nothing more.");
		output("\n\nStill, could be worse.");
		
		processTime(69);
		
		badEnd();
		return;
	}
	
	//Regular trips
	switch(rand(3))
	{
		case 0:
			output("Your vision doesn’t quite darken so much as falls, falling further and further away from those two amber spheres above you. A swirling cloud of black dust funnels around them, growing and spiralling to a greater size every second.");
			output("\n\nThe further you ‘fall’, the blurrier those eyes become. Suddenly you hit a surface. It’s soft like sand but does little to cushion your impact. You feel that your limbs have spread out haphazardly, and the distant point from above has grown brighter with a whitish, sharp light. The light descends towards you, up to you, <i>in</i> to you, and then through you. It feels like nothing aside from a swift sensation of buoyancy that fades in a moments time. As you look around, the place you’ve landed at becomes clearer to see.");
			output("\n\nA field of black stones, sands and plateaus mixed with gray-green grasses. Long, moonlit shadows form artistic patterns against the plane. The night sky is splattered with rich aurorae, pale green nebulae and the distant sight of a golden yellow star...");
			output("\n\nAn alien world.");
			if(silly) output(" Oh how very original.");
			output("\n\nMoving feels like moving through liquid: Slow, disorienting, floaty. Where can you go? What do you do? Logic can make sense of <i>what</i> is in front of you but <i>where</i> is a very different question...");
			output("\n\nYour eyes adjust to the odd flow of whitish light from where you ‘fell’ from. Its source appears to fly off into nothingness but the direction is towards that particularly prominent yellow star. How peculiar. The star, as if alerted to this thought with some sort of cognizance, grows brighter.");
			output("\n\nAnd brighter.");
			output("\n\nThe night sky soon becomes the early morning, the green-and-black canvas replaced with a faded orange. But it doesn’t stop, and is soon escalating from morning to day: The sky becoming a pale orange. The star gains detail... as if being drawn closer instead of merely growing brighter. You can make out a cascade of omni-colored particles and light waves bending, curving and swirling around it. This seems frightfully familiar...");
			output("\n\nThen you see it.");
			output("\n\nThat black, slit-shaped pupil.");
			output("\n\nThe star is no star but an eye. An immense, overwhelming eye surrounded by clouds and storms of arcing energy!");
			output("\n\nIt comes all the closer to the planet and you cannot look away. Where would you even look to? Even the black sand has a reflective sheen of gold radiating away.");
			output("\n\nAs the eye draws closer, the light grows brighter and brighter! You lose your vision and then...!");
			break;
		case 1:
			output("The world around you seems to be a visual liquid: Shapes and colors seem familiar but fluid, their corners bend and slough into awkward positions. The Seer is looking at you, her amber gaze");
			if(silly) output(" ~BE THE GOD YOU WERE BORN TO BEEE~");
			output(" the only fixed constant of normalcy in the blurry reality around you. Your face fixes to hers instinctively and it seems as if your surroundings are shifting...");
			output("\n\nHowever, you haven’t left the room. Your head comes to rest, so you believe, on to the Seers lap. Whatever true sensation you had before is replaced by an unsettling sense of lightness. Floating, perhaps. It’s hard to discern. Daring to try and make sense of what’s happening around you, you turn your head to the side...");
			output("\n\nHuh? There’s another me over there... [pc.eyes], [pc.skinFurScales]... and another Seer?");
			output("\n\nAnother version of you both sits barely a few centimeters away. The exact same pose, features and state of nakedness save for some small details: The Seers hair is very short, your [pc.legs] have been replaced by some reptilian snake tail and you’re looking at a slight angle upwards...");
			output("\n\nWhat in the tits?");
			if(silly) output(" AHA, HE SAID IT, AHA, OHO (SHRAPNEL)");
			output("\n\nYou turn your head to the other side: Another you, another Seer, another set of differences...");
			output("\n\nWith slowness, you try to look at other places of the lounge: There could be up to thirteen versions of you and the Seer, all different in many aspects!");
			if(silly) output(" You’re certain that one of the Seers is actually just your dad with boobs, further conflicting your soul and sexual preferences.");
			output("\n\nThen, in some strangely hypnotic unison, all of the Seers start using their arm tentacles to tease at your [pc.lips]. There’s so little sense to what’s happening that your mouth doesn’t even react. One tentacle tip slides gently into your mouth, as if let in willingly. With it comes some sort of... wash of fluid down your throat. Your own [pc.tongue] instinctively laps and sucks on the strange juice, inadvertently brushing against the oozing tentacle within. Mm, that flavour... salty lemons?");
			output("\n\nFruity ginger root...? Something oddly delicious but unplaceable.");
			if(pc.isBimbo()) output(" Doesn’t taste like any babybatter you’ve greedily swallowed before, that’s for sure...");
			output("\n\nAs it continues to flow into you at a slow but steady pace, your vision is just a few distorted edges away from turning into a colored, super dense smudge. There’s some sort of chanting hanging around, just lightly reaching into your [pc.ear] and tickling it. Tickling it just so. Yeah, right there...");
			output("\n\nIt reaches into the base of your skull, forming pulses and rhythms. Polymetric <i>oobs</i> and <i>dinks</i> sculamble themselves together. So mesmachanting is this chorusade of wondrous sonicology that you get moranged in its baltiddlious duphlility.");
			output("\n\nIt’s dawned on you that the smudged edges of your vision are fading, darkening but ever so slowly... the strange rhythms beating away at your spine grow in complexity and density until-");
			break;
		case 2:
			output("You close your eyelids instinctively, trying focus your mind before your vision.");
			output("\n\nWhen you open them again, everything has changed.");
			output("\n\nNo longer within the <i>relative</i> familiarity of the lounge, the ‘room’ has become a singular dark space with you standing in the middle of it. The only source of light is directly upwards: Two orbs of golden white that spotlight on your naked body.");
			output("\n\nYou try to move your limbs. There’s a <i>cuh-clink</i> sound like a weighted chain from behind you and... oh. You’re cuffed to a slab of stone! Your [pc.legs] can’t even move: Double locked!");
			output("\n\nAside from this unsettling development, there appears to be nothing around you. No sound, no movement, no vague force of wind or some such: Just you, the stone slab and the light from above.");
			output("\n\nTime seems to pass by and yet you’ve no idea of how long you’ve been here. Your body being held in place means that you aren’t tired from standing, and there’s nothing entirely <i>un</i>pleasant about being chained up in such a way...");
			output("\n\nThen the whispers begin.");
			output("\n\n<i>“You...”</i>");
			output("\n\n<i>“Not her?”</i>");
			output("\n\n<i>“Yes, her...”</i>");
			output("\n\n<i>Why not him...</i>");
			output("\n\nThe phrasing seems eerily on point with a certain someone who just shoved substances up your nose. They’re all in the same hushed voice, some louder than others but some drawn out and slurred. Some are audible noises, some are thoughts pushing themselves into your mind...");
			output("\n\n<i>We should...</i>");
			output("\n\n<i>“We should...”</i>");
			output("\n\nThey all say the same phrase in near unison, a chorus of the same words overtaking your senses from every angle! The room grows cooler and cooler, leaving a tingle in your [pc.skinFurScales].");
			output("\n\nThen, movement.");
			output("\n\nTwo small yellow orbs make themselves present in the darkness. They match you in height, slowly floating towards your naked form.");
			output("\n\nSomething comes into view: A mist-shrouded... limb? It’s hard to tell: It’s as dark as the abyss around you and it bends and wavers like a... like a...");
			output("\n\nUh oh");
			output("\n\nSeveral more ‘limbs’ appear, all of them squirming and writhing as more of them come into view. They slither and slide up and down your [pc.belly], seeming to focus on that part of your body.");
			if (pc.hasVagina()) output("\n\nSome brush against your [pc.pussy] in a most perverse and hungry way, and yet none dare to actually enter you...");
			else output("\n\nSome try to go for your [pc.multiCocks] but upon making contact, they recoil back into the shadows.");
			output("\n\nThe apprehension fueled by being on the verge of a tentacular violation makes you want to call for help, shout, no, scream! You yell at " + (silly ? "THE TOP OF LUNGS" : "the highest level you can muster") + " again and again! You close your eyes, wishing for this unexplained madness to end, until-");
			break;
		default: output("\n\n<b>!SWITCH IS FUCKED BROSEF!</b>"); break;
	}
	
	processTime(11 + rand(9));
	
	addButton(0, "Wake Up!", wispedSeer3);
}

public function wispedSeer3():void
{
	clearOutput();
	author("SoAndSo");
	showSeer(true);
	clearMenu();
	
	output("You open your eyes.");
	output("\n\nThere’s a mild fuzz at the edges of your vision, making things seem a bit unclear but... you can clearly observe the Seer looking down upon you.");
	output("\n\nYou take a minute to assess your surroundings: This is still the lounge, you’re still naked, your head is lying in the Seer’s lap...");
	output("\n\nAnd <i>oh</i>.");
	output("\n\nOne of the seers fleshy appendages has lodged itself into your mouth. You suck down on the air, something <i>else</i> sliding down along the way. What is that, salted lemons...?");
	output("\n\nYou try to yank the thing out of your mouth but, as if predicting this, the fleshstalk slithers away from your mouth. It leaves a semi-clear trail of ooze across your [pc.lips] and [pc.face].");
	output("\n\n<i>“Shhhh...”</i> Whispers the Seer, her purple robe loosely hanging from her right shoulder. <i>“You did so well...so well....”</i>");
	output("\n\nHer face is a picture of pure contentment. Those amber eyes - usually a piercing fixture that never change - are relaxed. Her eyelids droop lazily over them and her onyx lips are parted ever so slightly into a cute smile. What in the world did she...");
	output("\n\nAs she slowly plays with your [pc.hair], you can’t help but feel a little sluggishness creeping over your sense of perception.");
	output("\n\n<i>Forget.</i>");
	output("\n\nForget...?");
	output("\n\n<i>Forget</i>");
	output("\n\nForget...");
	
	processTime(5 + rand(3));
	
	addButton(0, "Wake Up!", wispedSeer4);
}

public function wispedSeer4():void
{
	clearOutput();
	author("SoAndSo");
	showSeer();
	clearMenu();
	
	output("You come to against the side of a wall.");
	output("\n\nClambering for stability, you try to take in what you see: Warrens, streets... ants?");
	output("\n\nThat’s right, you’re in Gildenmere!");
	output("\n\nWhat were you here for again? Dad’s probes...?");
	output("\n\nOh and hey, it’s that shop again. The one with the crazy owner and the... something. Your memory seems to want to pinpoint an image down but it never arrives.");
	output("\n\nInhaling deeply in an attempt to focus, you pick up a strange flavour at the back of your throat: Salt and... lemons?");
	output("\n\nThinking nothing of it, you dust yourself down and get back to your business.");
	
	processTime(3);
	flags["USED_WISP"] = 1;
	
	moveTo("720");
	addButton(0, "Next", mainGameMenu);
}

//‘Transformation’/When sleeping
//Instead of set scenes, a max of 3 random blurbs play in any order from the list below with each use.
//Upon sleeping
public function whiffOWhateverTexts():void
{
	clearOutput();
	showName("\nTRIPPY!");
	output("Ooo, that Wiff-O-Whatsit really made you drowsy. As sleep takes over, the darkness that comes is so total that all sense of perception becomes befuddled.");
	output("\n\nA thousand images come and go in the space of seconds, none of which you could give a surety as to their meaning. A planet’s destruction, a grey tree blooming purple fruit in the middle of a brown ocean, thousands of aliens gravitating in a spiral towards an object of worship, a neon face mouthing something and then exploding into shards of red: all unrepresentative of each other with no interconnection.");
	output("\n\nHowever, some images and visions seem to repeat. Some of those can even then be interpreted despite their chaotic appearances...");
	

	var x:Number = 0;
	for(var i:int = 0; i < 3; i++)
	{
		eventQueue.push(whiffAssemble);
	}
	//Push on cleanup message whynot
	eventQueue.push(wakingUpWhiff);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function whiffAssemble():void
{
	clearOutput();
	showName("TRIPPING\nBALLS");
	output(giveWhiffBlurb())
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function wakingUpWhiff():void {
	clearOutput();
	showName("WAKING\nUP");
	author("SoAndSo");
	output("You’re pulled back from the brink of... something orange and blue when the dream world blurs away from your thoughts.");
	output("\n\nYou wake up!");
	if(pc.hasGenitals())
	{
		output(" And you’re covered in ");
		if(pc.isHerm()) output("[pc.cum] and [pc.femcum]");
		else if(pc.hasCock()) output("[pc.cum]");
		else if(pc.hasVagina()) output("[pc.femcum]");
		output("... Well this is highly inconvenient.");
	}
	else output(" And you feel exquisitely satisfied.");
	output("\n\nShower time!");
	pc.removeStatusEffect("Woozy");
	pc.intelligenceMod -= 10;
	pc.aimMod += 10;
	pc.reflexesMod += 10;
	pc.lustMod -= 9000;
	sleepHeal();
	processTime(455+rand(30));
	pc.orgasm();
	pc.energy(5)

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function giveWhiffBlurb():String
{
	var disabled:Array = [];
	if(pc.statusEffectv1("Woozy") > 0) disabled.push(pc.statusEffectv1("Woozy")-1);
	if(pc.statusEffectv2("Woozy") > 0) disabled.push(pc.statusEffectv2("Woozy")-1);
	if(pc.statusEffectv3("Woozy") > 0) disabled.push(pc.statusEffectv3("Woozy")-1);
	var whiffTexts:Array = [];

	var buffer:String = "";
	//Blurb 1
	if(!InCollection(0, disabled))
	{
		buffer = "A ceremony of some sort: heavy mountain ranges covering a plateau of hooded figures chanting in unison. The sky cracks with lightning and the chorus escalates in volume.";
		//pcHasPrimorditatts: 
		if(pc.hasPerk("Primorditatts")) buffer += " This scene feels eerily familiar...";
		buffer += " Two more prominent figures are the focus. You’re able to tell that they’re...Goats? One is small and pure white, the other is green, gold, and muscular. They appear to be locked into an awkward missionary position... <i>oh</i>. Something about the primal display before you awakens a deep lust in your mind. The sound of thunder and the sight of lightning adds an intangible sense of adrenaline with each crack of white light. But your enjoyment is cut short as the image fades and burns away to more random visual treats...";
		whiffTexts.push(buffer);
	}

	//Blurb 2
	if(!InCollection(1, disabled))
	{
		buffer = "A verdant green planet dotted with oddly colored stone formations: Orange, white, black and cyan. A canopy of angular leaves covers a forest floor, which you appear to dive into...\n\nBreaching through the purple wood of the trees, you see that the fauna is unlike anything you’ve ever seen: Green but oddly proportioned and consisting of straight lined-shapes, almost perfectly so. Unnatural nature.\n\nThere are humanoids walking along a vague path. Not human... moths? Moth people? They’re so graceful and alien, unlike any other race you can name. Their wings flitter and flutter behind them; then at once, all of the moth-people take to the skies in silent unison.\n\nAs the canopy shakes from the display, the image distorts, then fades away...";
		whiffTexts.push(buffer);
	}

	//Blurb 3
	if(!InCollection(2, disabled))
	{
		buffer = "The world shifts to a strange location: The lip of a rock formation at the edge of a mountain.\n\nIt’s an Earth-like place, covered in grass with a crystal clear sky. You can’t feel much but there’s a definite force bouncing through the rocks... wind? Most certainly.\n\nFrom it, you jump off.\n\nAnd fly?\n\nYou see the ground below you and spy movement in the grasses below. A mouse?! You head straight for it, whatever it might be. Primal instinct causes you to dive downwards and your black talons extend like eight blades of indignant death!";
		if(silly) buffer += " Gonna grab me some tasty Tacit!";
		buffer += "\n\nAs you approach the ground, the image funnels, blurs, and dissipates...";
		whiffTexts.push(buffer);
	}

	//Blurb 4
	if(!InCollection(3, disabled))
	{
		buffer = "You spend a day as a baby, a week as a child, a month as an adult and five minutes as an elder. You learn nothing, lose everything and wonder if it was all worth it to begin with.";
		whiffTexts.push(buffer);
	}

	//Blurb 5
	if(!InCollection(4, disabled))
	{
		buffer = "You spend an afternoon as a flower in a dustbin.";
		whiffTexts.push(buffer);
	}

	//Blurb 6
	if(!InCollection(5, disabled))
	{
		buffer = "Somehow, the plane of existence morphs into a crystal void of refracted light. Sound and light bend off of each surface and each other, dazzling your mortal senses to the point of inertia. You fly amid stones of blues and greens, ones that form and reform ex nihilo in front of your very eyes like thick gel or liquid.\n\nYou find that your limbs aren’t responsive... for you have no limbs. This plane of existence then morphs violently, a twisting blurred mess of visual distortion adapting to something you still don’t recognize.\n\nIt happens a second and third time, the fourth eventually ‘bleeding’ away from your perception into another image...";
		whiffTexts.push(buffer);
	}
	//Blurb 7
	if(!InCollection(6, disabled))
	{
		buffer = "You end up in the hell knows where. It’s some sorta barn, you’d reckon. Sturdy, big, filled wi’ hay, just as it should be!\n\nHey, there’s noises outside! Something like... grunting. No, maybe... laughter?\n\nOh damn, that’s someone <i>gettin’ it awn!</i> And you ain’t been invited? Po-lease.\n\nWell color me horseraddish red now what do we have here?\n\nA moo cow! Why ya out here on ya lonesome, cutie?\n\nBreak from work? Ain’t no fun without a second pair o’ hands!\n\nNow wait a sec, why’dya gotta start fadin’ like that, I wanted the moo cow...";
		whiffTexts.push(buffer);
	}
	//Blurb 8
	if(!InCollection(7, disabled))
	{
		buffer = "You’re sitting in an office, a highly personalized one.\n\nThe wood walls and array of awards on a shelf seems familiar for some reason...\n\nA man walks through a double door in front of you.\n\nOh hey! Didn’t see ya there buddy!\n\nStill locked away in theoretical R&D world, Joe?\n\nYou betcha, gotta make sure this gene adaptor tech doesn’t turn my little " + pc.mf("prince","princess") + " into a pile of coagulate goo, ya know?\n\nNo kiddin’, didya remember the self destruct codes?\n\nYep yep, got ‘em right here in case of unintended anti-christ scenario. Here have a look...\n\nThe scene folds itself away into something new...";
		whiffTexts.push(buffer);
	}

	//Blurb 9
	if(!InCollection(8, disabled))
	{
		buffer = "You’re a tall, green haired giant with massive pecs. For whatever reason, the sight of carrots makes you extremely perturbed. Best thing to is shout at it.\n\nYeah shout that carrot down!\n\nStupid orange carrot.\n\nSMASH CARROT.\n\nThe scene fades upon your fist meeting the vegetable...";
		whiffTexts.push(buffer);
	}

	//Blurb 10
	if(!InCollection(9, disabled))
	{
		buffer = "You’ve stumbled upon someone’s birthday party.\n\nEarth?\n\nProbably.\n\nEveryone’s human.\n\nAnd they’re taking all their clothes off?\n\nAnd your clothes?\n\nIt’s all wrapped in wordless silence. Even the ambience of the room doesn’t exist. All you can hear is a faint but omnipresent whine that tickles the inner parts of your brain.\n\nWhere did all these clothes come from? So many different ones.\n\nYou’re cold, lets jump in them!\n\nOh no, there’s a belt buckle and you’ve got it trapped round your toes!\n\nBetter ahigafalugahayah....";
		whiffTexts.push(buffer);
	}

	//Blurb 11
	if(!InCollection(10, disabled))
	{
		buffer = "Hey Chad, <i>sweet</i> dick bro!\n\n<i>t</i><b>H</b>aAan<i><b>K</i></b>s BrooooOOOOoo...";
		whiffTexts.push(buffer);
	}

	//Blurb 12
	if(!InCollection(11, disabled))
	{
		buffer = "You’re standing in a cold, silent room.\n\nThe walls are covered in what seem to be a foam of some sort and there’s a silent aircon unit above your head, gently recycling the air above.\n\nIn front of you is a skinny man with long blonde hair and heavy, black clothing. He’s standing in front of... a really old look microphone. Is it a microphone? Has to be, why would he be levelling it to his mouth?\n\n<i>“This is HUH, WOW”</i>\n\nWhat.\n\nThe next few seconds are a visual and audio blur as something screams in metallic notes and spine shaking cacophony.\n\nIt’s a blessing when the scene vanishes and transcends to the next vision...";
		whiffTexts.push(buffer);
	}
	var x:int = rand(whiffTexts.length);
	if(pc.statusEffectv1("Woozy") == 0) pc.setStatusValue("Woozy",1,(x+1));
	else if(pc.statusEffectv2("Woozy") == 0) pc.setStatusValue("Woozy",2,(x+1));
	else if (pc.statusEffectv3("Woozy") == 0) pc.setStatusValue("Woozy", 3, (x + 1));
	
	return whiffTexts[x];
}