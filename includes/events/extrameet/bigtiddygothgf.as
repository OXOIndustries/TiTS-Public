// EXTRAMEET_BIGTIDDYGOTHGF

public function bigTiddyGothGFBust(nude:Boolean = false):void
{
	showName("THE\nSERVANT");
	showBust("SERVANT" + (nude ? "_NUDE":""));
	author("Fr0sty");
}

public function bigTiddyGFDoor(btnSlot:int = 1):void
{
	if (flags["EXTRAMEET_BIGTIDDYGOTHGF"] != undefined && flags["EXTRAMEET_BIGTIDDYGOTHGF"] >= 1)
	{
		if (flags["BIGTIDDYGOTHGF_LOCKOUT"] != undefined && flags["BIGTIDDYGOTHGF_LOCKOUT"] > GetGameTimestamp())
		{
			output("\n\nYou are standing next to The Servant’s apartment. She’s surely home, and almost certainly awake but something is stilling your hand from knocking on her door... maybe tomorrow.");
			addDisabledButton(btnSlot, "S. Knock", "South Door Knock", "Something is stilling your hand from knocking on her door... maybe tomorrow.");
		}
		else
		{
			if (flags["BIGTIDDYGOTHGF_FIRSTVISIT"] == undefined)
			{
				output("\n\nYou notice a familiar door, although you know you’ve never been on the other side. Still... The door seems to call to you...");
			}
			else
			{
				output("\n\nYou are standing next to The Servant’s apartment. She’s surely home, and almost certainly awake.");
			}

			addButton(btnSlot, "S. Knock", knockOnBigTiddyGFDoor, undefined, "South Door Knock", "Something keeps drawing you to knock on the door...");
		}
	}
	
	setNavDisabled(NAV_SOUTH_DISABLE);
}

public function knockOnBigTiddyGFDoor():void
{
	clearOutput();
	bigTiddyGothGFBust();

	if (flags["BIGTIDDYGOTHGF_FIRSTVISIT"] == undefined)
	{
		flags["BIGTIDDYGOTHGF_FIRSTVISIT"] = 1;
		
		output("You knock on the mysterious door, not exactly sure what to expect. The faint sound of footsteps on the other side tells you the occupant is both home and coming to the door. When it slides open, you’re met with a familiar face.");
		output("\n\nThe crazy woman from ExtraMeet.");
		output("\n\nMiranda you think her name was, is standing in the doorway. No that’s not right, you remember while fighting off the urge to frown. She wanted you to call her ‘The Servant.’");
		output("\n\nA look of recognition, and a smile on her face, tells you she remembers you too.");
		output("\n\n<i>“Hey! I was hoping you’d stop by,”</i> she says as she takes a slow step back, motioning for you to enter. <i>“Please, come in.”</i> She sounds happy to see you, her voice oddly cheerful despite her dark appearance.");
		output("\n\nWell you did knock, so with a moment of hesitation, you step across the threshold into the pale woman’s apartment. The main room is dark and gloomy, with a small dim lamp and a few candles on a table as the sources of light. A door or hallway is barely distinguishable on the far side of the room, shrouded in shadow so deep you’re not sure where it leads. The air in the room is filled with a fragrance you can’t quite place, an earthy smell that reminds you of wet dirt.");
		output("\n\nAside from a few chairs and a table, the only other furniture you notice is a tall bookshelf, lined with dozens of thick tomes and textbooks. Taking a glance at the collection, you note many of them are alien in origin, spotting only two out of the whole bunch that are Terran. The woman brushes past you, running her fingers over your shoulder as she does, then walks over to the dimly lit table, motioning for you to take a seat. You follow her cautiously and slowly sit down, keeping your eyes on the pale woman.");
		output("\n\n<i>“Had I known you were coming, I’d have prepared tea,”</i> she slowly moves around to the far side of the table, pulling out a second chair for herself. <i>“I don’t even think I have any left... it’s been awhile since I’ve had company.”</i>");
		output("\n\nShe sits down and grins, her blue eyes gleaming in the low light. Something about her stare makes your [pc.skinFurScales] crawl. Despite that, your instincts tell you you’re safe here and so you allow yourself to relax, but still opt to keep a close eye on the odd woman.");
		output("\n\n<i>“I’m sorry about the thing in the bar,”</i> she grimaces slightly. <i>“I didn’t mean for things to play out that way... so. Sex?”</i> She smiles at you, offering it as easily as she would the tea.");
		output("\n\n<i>“Uh...”</i> You stare at her for a heartbeat, processing her question. <i>“I think there’s a few things I’d like to clear up before I consider... that.”</i> Recalling the woman’s outburst at the bar, you think you might need some good answers as well.");
		output("\n\nThe Servant gives you a confused stare, her smile fading away. <i>“Oh... such as?”</i>");
		output("\n\n<i>“Well, since you brought it up...”</i> you lean back in your seat, crossing your arms over your [pc.chest]. <i>“What <i>was</i> all that at the bar about?”</i>");
		output("\n\n<i>“Oh...”</i> she seems to shrink away at the question, and you notice her fidgeting with some of the rings on her fingers absentmindedly. <i>“I was... having a disagreement with my master...”</i>");
		output("\n\nYou raise your brow, your fast twisting up in confusion. <i>“Your master?”</i> you ask aloud.");
		if (pc.isNice()) output(" <i>“We were alone.”</i>");
		else if (pc.isMisc()) output(" <i>“Honey, that’s not the kind of crazy I like.”</i>");
		else output(" <i>“What the fuck are you talking about?”</i>");
		output("\n\n<i>“I’m sorry, I...”</i> she winces, as if somebody yelled directly into her ear, staying silent after for a long moment. Watching her closely, it almost looks like she’s listening to someone speak. <i>“I was... high...”</i> she shifts in her seat.");
		output("\n\nShe’s lying. Badly.");
		output("\n\n<i>“Right....”</i> Well this went south fast. Again.");
		output("\n\nYou turn your head and eyeball the door, ready to ditch this crazy chick.");
		if (pc.isNice()) output(" The door isn’t far, and silently you plan to excuse yourself without harming the addled woman.");
		else if (pc.isMisc()) output(" Shame she’s nuts, since she’s so damn hot. You eyeball the door, planning a quick escape.");
		else output(" The door isn’t far, but you ready yourself all the same, not knowing what the crazy woman will do.");
		output(" A loud gasp turns your attention back to The Servant.");
		output("\n\nHer face is flushed, sweat forming on her pale brow. She lets out another gasp, gripping onto the edge of the table for support, her fingers shaking. Shuddering, her gasping becomes a depraved moan.");
		output("\n\nIs she... having an orgasm?");
		output("\n\nYou watch in disbelief as the small woman shakes in her seat, her blue eyes rolling back into her skull. <i>“Oh fuck... Master not now... please... ”</i> her words turn into a near shriek, her jaw turning slack and a metal pierced tongue falling out from between her thick painted lips.");
		output("\n\nAt her chest, you notice her necklace seems to be glimmering in the shadows.");
		output("\n\nDespite yourself, you can’t seem to look away from the convulsing woman, her orgasm becoming more intense by the second. For some reason, you feel your [pc.skinFurScales] start to burn, itching with... lust? You’re left quivering");
		if (pc.hasCock()) output(", your cock beginning to harden down below,");
		else if (pc.hasVagina()) output(", [pc.oneVagina] beginning to slicken down below,");
		output(" watching the poor woman before you. Somehow, you’re taking depraved pleasure in watching her writhe and squirm, drowning in ecstasy before your very eyes.");

		output("\n\nNot able to control yourself, you drop your hand below the table, giving in to your sudden arousal.");

		if (pc.hasCock())
		{
			if (pc.isCrotchGarbed()) output(" You pull your [pc.cock] free");
			else output(" You stroke your [pc.cock]");
			output(", wrapping your fingers around your already rock-hard mast. With just that simple touch, a lusty moan escapes your [pc.lips]; your senstive cockflesh throbs in your grasp, every wrist driven pump egged on by the display the pale woman is putting on. Your burning hot [pc.cockShape] member already slick with your [pc.cumColor] pre.");
		}
		else if (pc.hasVagina()) output(" You move your fingers down, pushing them between your legs, and running them over your already wet cunt. With just that simple touch, a lusty moan escapes your [pc.lips], your senstive cuntflesh quivering at the faintest stimulation. Your eyes stay fixed on the pale woman before you as you slip your fingers inside, your burning hot snatch already yearning to be <b>fucked</b>.");
		else output(" You rub your bare groin feebly. Despite your lack of sex organs, you feel your crotch burn, itching to be touched. Somehow, the simple act of rubbing yourself feels like heaven, almost like having your lost sex back once more.");

		output("\n\nThe Servant gasps for air, her pale chest heaving up and down with each hard fought lungful of air. You can’t take your eyes off of her bosom, your gaze following every jiggle of her delicious looking tits. No... not her tits... something else...");
		output("\n\nThe thought is lost, a shamefully fast orgasm overtaking you.");

		output("\n\nYou let out a cry of pleasure");
		if (pc.hasCock() || pc.hasVagina()) output(" sex erupts, [pc.cumColor] spurting all over your hand");
		output(". Your eyes flutter as waves of bliss radiate through your body, every nerve alive and firing while you shiver in your seat. Colors dance before you eyes as your vision blurs, all of your senses seemingly dulled by the orgasm blasting through you. How can just touching yourself feel this good?");

		output("\n\nJust as quick as you came, the lust vanishes into the ether.");

		output("\n\nYou blink, seeing the room clearly for the first time in minutes. The Servant is still seated across from you, but her top half is laying flat on the table, the poor woman gasping for air. Lifting your hand above the table, you examine it for a moment");
		if (pc.hasCock() || pc.hasVagina()) output(", [pc.cumColor] coated all over your fingers");
		output(".");
		
		output("\n\n<i>“What... was that?”</i> you speak the words aloud, more rhetorically, than anything.");
		output("\n\n<i>“That... was... my master....”</i> The Servant answers, breathing heavy from the table.");
		output("\n\nYou glance down at her, for some reason believing her words.");
		output("\n\nSomething did that to you. To both of you.");

		output("\n\nAnd you liked it.");
		output("\n\nYou don’t linger long, collecting yourself and heading towards the door. You don’t know what that was, but you don’t want to stay and find out... completely at least. Despite yourself, you are curious as to what did that, and if that is the only thing it can do.");
		output("\n\nAs you open the door, you hear The Servant call out to you. Turning to face her, the woman speaks from the shadows.");
		output("\n\n<i>“If you want to experience pleasures like that again, my door is always open.”</i> You can practically hear the lascivious smile in her voice.");
		output("\n\nYou swallow hard, considering her offer as you step beyond the threshold and close the door.");

		processTime(30+rand(15));
		pc.orgasm();

		flags["BIGTIDDYGOTHGF_LOCKOUT"] = GetGameTimestamp() + 1440;
		IncrementFlag("EXTRAMEET_FAP_RCVD");

		currentLocation = "RESIDENTIAL DECK 11";

		//When Selected, Steele is placed just outside of The Servant’s apartment, and cannot Knock on the door for 24 hours.
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		output("You knock on The Servant’s door. Faintly, you hear her walking over, her heels clicking against the floor. The door slides open, and you come face to face with the dark woman.");
		output("\n\nShe gives you a wide smile, seemingly overjoyed to see you. After a moment, she steps back and motions for you to enter. <i>“I’ve been looking forward to seeing you again, [pc.name]. Come in, please.”</i>");
		output("\n\nSlowly, you move past the small woman and into the dimly lit room.");
		output("\n\nThe Servant moves to the far side of the table, sitting down across from you in her usual spot. Her blue eyes shine in the candlelight as she gives you a knowing grin. She seems to bask in your presence, her body quivering as if just sitting before you is a great pleasure. When she speaks her voice is soft and humble.");
		output("\n\n<i>“So. What’s on your mind, [pc.name]?”</i>");

		processTime(2+rand(2));
		bigTiddyGothGFMenu();
	}
}

public function bigTiddyGothGFMenu():void
{
	clearMenu();
	addButton(0, "Appearance", bigTiddyGothGFAppearance, undefined, "Appearance", "Size her up.");
	addButton(1, "Herself", bigTiddyGothGFHerself, undefined, "Herself", "Ask her about herself.");
	if (flags["BIGTIDDYGOTHGF_SEX"] != undefined) addButton(2, "Necklace", bigTiddyGothGFNecklace, undefined, "The Necklace", "Ask her about the necklace.");
	else addDisabledButton(2, "Necklace", "The Necklace", "You should probably get to know her a little more intimately before you go prying about that...");

	addButton(3, "Flirt", bigTiddyGothGFFlirt, undefined, "Flirt", "Because that’s really why you’re here.");

	addButton(14, "Leave", bigTiddyGothGFSexLeave);	
}

public function bigTiddyGothGFAppearance():void
{
	clearOutput();
	bigTiddyGothGFBust();

	output("Now that you have a moment, you decide to give The Servant a decent look over. You estimate she stands at around 5\' 4\", but her tall, platformed boots put her closer to 5\' 8\". Her skin is pale and fair, and you suspect she hasn’t been in natural light for quite some time. Long and straight pitch black hair reaches down to her lower back, with two long locks of it resting on both of her shoulders and running down her front. Around her eyes she wears heavy eye shadow, a stark contrast against her large and piercing blue orbs.");
	
	output("\n\nHer lips are large and puffy, painted dark, but with slight red tinting. In her ears you count a number of piercings, two holes in each lobe, and another few studs and rings along the sides. Despite her ears being so decorated, her face remains unpierced, save for a tongue ring you sometimes catch sight of when she speaks. On her fingers she wears a number of interesting rings, with each of her long fingernails painted black. ");
	
	output("\n\nYour eyes trail downward, examining her attire. The first thing you note is that she’s wearing a very tight black overbust corset, trimmed with dark red accents. Around her neck, and hanging down between her breasts, is a curious uncut red stone on a simple string. Your eyes linger on it for a long moment, almost unable to look away...");
	
	output("\n\nHer shoulders and arms are covered by a thin black cardigan which reaches half way down her back. Covering her lower half is a black skirt, coming down to mid-thigh, with sheer stockings being held up by garter belts reaching underneath her skirt. She is wearing tall knee high boots, covered in buckles and platformed up at least four inches.");
	
	output("\n\nAlthough the corset makes it hard to judge fairly, her chest is quite large, at least a DD cup.");
	if (flags["BIGTIDDYGOTHGF_NAKED"] != undefined) output(" You know that underneath both of her tits are capped by a bright pink nipple, each pierced with a metal ring.");
	output(" Her body is impressive, and she boasts a considerable hourglass figure, her hips wide and womanly despite her slim waist. Her ass is round and large, and seems to wiggle slightly with each step she takes. Between her legs");
	if (flags["BIGTIDDYGOTHGF_NAKED"] == undefined) output(" presumably");
	output(" rests her terran twat.");
	
	output("\n\n");
	if (flags["BIGTIDDYGOTHGF_NAKED"] != undefined)
	{
		bigTiddyGothGFBust(true);
		output("You also know that under her clothes, The Servant has a few tattoos decorating her body, the most prominent of which is a mural that takes up the whole of her back. The tattoo is difficult to understand, and uncomfortable to look at,");
		if (flags["BIGTIDDYGOTHGF_TATEXPLAIN"] != undefined) output(" and is a depiction of something she calls a god");
		else output(" and you’ve no idea what it’s a representation of");
		output(". It vaguely looks like a massive vortex, filled with teeth and lightning, with black tendrils trailing off into different but symmetrical directions. Several of the tendrils extend around her body, two trailing over her hips and curving back around her ass, while two others extend over shoulders and snake down to her ribcage, bending around her ample chest. They give the uncomfortable impression that the image on her back is trying to wrap her up and take hold of her.");
	
		output("\n\nHer other tattoos include the symbol for infinity on the back of her neck, an intricate circular design surrounding her pierced belly button, and two ribbons on the back of each of her thighs.");
	}

	bigTiddyGothGFMenu();
	addDisabledButton(0, "Appearance");
}

public function bigTiddyGothGFHerself():void
{
	clearOutput();
	bigTiddyGothGFBust();

	output("You ask The Servant to tell you more about herself.");

	output("\n\nShe raises one of her dark eyebrows, slightly confused by your request. <i>“You want to talk? Um.. okay, very well. What exactly do you want to know?");

	bigTiddyGothGFHerselfMenu();
}

public function bigTiddyGothGFHerselfMenu():void
{
	clearMenu();
	addButton(0, "Her Deal", bigTiddyGothGFHerselfHerDeal, undefined, "What’s Her Deal", "Figure out why she’s so weird");
	addButton(1, "History", bigTiddyGothGFHerselfHistory, undefined, "Her History", "Ask about her roots.");
	addButton(2, "Family?", bigTiddyGothGFHerselfFamily, undefined, "Family?", "Ask if she has any family.");
	addButton(3, "Real Name", bigTiddyGothGFHerselfRealName, undefined, "Real Name", "Why ‘The Servant’?");
	if (flags["BIGTIDDYGOTHGF_NAKED"] != undefined) addButton(4, "Tattoos", bigTiddyGothGFHerselfTats, undefined, "Tattoos", "She’s got some serious ink...");
	else addDisabledButton(4, "Tattoos", "Tattos", "You’d need to have seen most of her tats before you’d know to ask about them!");

	addButton(14, "Back", bigTiddyGothGFMenu);
}

public function bigTiddyGothGFHerselfHerDeal():void
{
	clearOutput();
	bigTiddyGothGFBust();

	output("You decide to ask her what’s up with all her dark quirks and weirdness.");
	
	output("\n\nShe stares at you a moment, her expression rather difficult to read. You can’t be sure if she’s thinking about the question, or giving you an exasperated frown. She breaks her stare with a sigh. <i>“Are you referring to my stylistic choices, or the <i>other thing</i>?”</i>");
	
	output("\n\nIt’s your turn to think now. Somehow you suspect the two are closely related, based on the vibe of her apartment. <i>“How about both?”</i>");
	
	output("\n\n<i>“Well, for the latter...”</i> Her eyes fall to the necklace hanging from her neck. <i>“I’m not sure I can properly explain that one. It’s a lot to unpack.”</i> She sighs and returns her gaze to your face.");
	
	output("\n\nYou can’t help but roll your eyes. <i>“That’s a pretty evasive answer.");
	if (pc.isNice()) output(" Come on, be honest with me.");
	else if (pc.isMisc()) output(" You can do better than that, babe.");
	else output(" Stop fucking around.");
	output("”</i>");
	
	output("\n\nThe dark woman presses her lips together, clearly not impressed. <i>“What do you want me to say? I talk to myself. I’m clearly just nuts, right? Pretty cut and dry to me.”</i> The Servant crosses her arms over her chest, her face telling you she very much wishes to move on.");
	
	output("\n\nYou know she isn’t being honest with you, but her body language is screaming discomfort. Sparing her, you let the topic lie, but you fully intend to explore the topic later when she’s willing to be more forthcoming.");
	
	output("\n\nThe dark woman gives you an oddly warm smile, seemingly appreciative of you letting her move the conversation off the topic. <i>“Thank you, [pc.name]. Now, as for your other question, about my style, well the truth is simply that I like it. I could give you a pretentious answer about how I’ve always felt ‘strange and unusual’, but that would be partially disingenuous of me. I’ve just always found it pleasing. Dark colors, fishnets, corsets, tea by candlelight. It’s just so... me.”</i>");
	
	output("\n\nShe leans back in her chair, tapping a painted black fingernail against her chin. <i>“It’s a rabbit hole, you see.. It just gets deeper and deeper. I started off just wanting to wear black. Then the hair dye became a must. Then the make-up started. Before I knew it I was drowning in it.”</i> She closes her eyes and smiles. <i>“Deeper than I ever thought possible...”</i>");
	
	output("\n\nWhen she opens her eyes you notice she is oddly composed, and almost you’d dare say normal. When she’s not talking to herself, or having a fit, her company isn’t half bad. The two of you sit in silence for a moment, enjoying the brief pause.");
	
	output("\n\n<i>“So,”</i> she she leans back in, her blue eyes shining in the candlelight once more. <i>“Does that answer your questions?”</i> ");
	
	output("\n\nYou consider her question for a moment before you answer. <i>“Mostly.”</i> As much as you’d like to crack deeper into why she is the way she is, you can’t help but feel that quitting while you’re ahead is a smart idea.");

	processTime(5+rand(5));

	bigTiddyGothGFHerselfMenu();
	addDisabledButton(0, "Her Deal");
}

public function bigTiddyGothGFHerselfHistory():void
{
	clearOutput();
	bigTiddyGothGFBust();

	output("You ask The Servant about her past.");
	
	output("\n\nShe seems to shudder at the question, almost like a child forced to eat some disgusting veggie. <i>“Oh. I promise you, that is an objectively banal topic. I’m sure we could talk about something far more... stimulating.”</i> Below the table, you feel her foot reach out, brushing against your leg slightly. She gives you a coy smile, with suggestive bedroom eyes.");
	
	output("\n\nNow you’re curious. The dark woman has skirted topics before, but not like this. You don’t feel like she’s hiding something, just that she doesn’t seem to want to talk about it. With a small smile, you shake off the woman’s foot and press the issue.");
	
	output("\n\nThe Servant lets out a small huff, seemingly of defeat, and pulls her foot away. <i>“You’re no fun. Very well then. Where to start...”</i> she leans back in her chair, playing with a dark lock of hair absentmindedly. <i>“Well I’m from Terra... we call it ‘Earth’, but that’s not the point.”</i> She lets go of her hair and starts scratching at her temple. You notice a small bit of color tint her pale cheeks. Is she blushing? <i>“I lived there until I was eighteen, then I left for school and... well here I am. That’s my story.”</i> Shifting in her seat, her gaze continues to wander, not meeting yours directly.");
	
	output("\n\n<i>“That’s it?”</i> Her answer leaves much to be desired, and you can clearly tell she’s holding back. You decide to press again, if only because her behavior has you still curious.");
	if (pc.isNice()) output(" <i>“That can’t be all. What about after you left home?”</i>");
	else if (pc.isMisc()) output(" <i>“You’re a terrible liar. Come on, tell me everything.”</i>");
	else output(" <i>“We both know you’re going to tell me what I want to know, so quit jerking my chain.”</i>");
	
	output("\n\nThe Servant fiddles with the rings on her fingers, her gaze still not meeting yours. After a few long heartbeats, she lets out a deep sigh and rolls her eyes, continuing on with a tone you’ve never heard from her before: Bratty. <i>“Look. I was just a typical Earth girl who did typical Earth girl things, okay? My life didn’t get even <i>remotely</i> interesting until a year ago.”</i> She pauses for a moment, seemingly catching herself on some minor slip up. <i>“My Mommy never beat me, my Daddy didn’t diddle me, and I didn’t cry myself to sleep every night until I learned to spread my wings, be myself, and morph into a camel, or whatever it is people do.”</i>");
	
	output("\n\nShe leans back in her chair, crossing her arms over her chest defensively. <i>“I have no sad and tragic backstory, Steele. So I’m really not sure what the fuck you’re looking for. What you see is what you get, and that’s fucking it. I’m not some deep book. Fuck, I’m barely a pamphlet at best. Ya got it?”</i> The Servant turns her head away from you, pouting. ");
	
	output("\n\nSomething you said upset her, but her reaction was far less mature than you would have expected. Does she really not want to talk about herself that much? In an attempt to change the topic, you ask the pouting woman what she went to school for.");
	
	output("\n\nAs you ask the question The Servant’s demeanor seems to change, her arm loosening up over her chest, and her eyes shifting back to you. <i>“I... have a degree in anthropology. It’s from the First University of Europa.”</i> She lowers her arms, the last traces of her brattiness fading away. <i>“My focus was on shared myths and legends between different worlds,”</i> she seems to come alive as she speaks, her painted lips turning into something resembling a smile. <i>“I had recently started a graduate program abroad. My thesis was... well, I wanted to prove that there were common threads between civilizations. Cultures light years apart, mind you. Things that didn’t just resemble each other by coincidence.”</i>");
	
	output("\n\n<i>“Now I’m not just talking some similar iconography,”</i> she leans in close, her face lighting up. <i>“I’m talking the same stuff at a structural level. Some academics take it as possible proof of seeder races... um, yanno, advanced civilizations that start up life on other planets. But this can’t be that.”</i> She chews her lip, barely containing her enthusiasm. <i>“This stuff doesn’t pop up when civilizations just start, it dates much later on, well after their cultures are already established. Thousands of years after in some cases.”</i>");
	
	output("\n\n<i>“Huh.”</i>");
	if (pc.IQ() < 30) output(" You’ve never really looked into this before. Could there be something to it? And if so what does this mean?");
	else output(" You’ve actually heard about this before, but nothing concrete. If true, it’s certainly something worth studying, although the implications are difficult to predict.");
	output(" Just from watching her, you can tell she’s truly passionate about the subject. Keeping the conversation going, you ask her how her research is going at her school.");
	
	output("\n\nThe Servant’s smile melts away, the woman suddenly becoming crestfallen. <i>“I... dropped out around a year ago.”</i> She turns away from you, starting to play with her hair again, closing herself off.");
	
	output("\n\n<i>“What?”</i> Based on the way she was just talking about it, you can hardly believe your ears. <i>“Was the workload too much or...”</i> you pause, keying in on what she just said. This is the second time now she’s mentioned something happening a year ago. <i>“What happened a year ago?”</i>");
	
	output("\n\nShe glances over at you, her bright blue eyes wide as saucers. Remaining silent for a moment, you hear her mutter something under her breath. <i>“No. I’m not going to say anything. Shut up.”</i>");
	
	output("\n\nYou frown. <i>“Excuse me?”</i>");
	
	output("\n\nThe dark woman flinches. <i>“Oh. No. Not you... I was talking to...”</i>");
	
	output("\n\n<i>“Your master...”</i> You feel your frown tighten.");
	
	output("\n\n<i>“Yeah...”</i> she presses her thick lips together, her gaze falling away from you. After a moment of awkward silence, she turns back to you. <i>“Can... can we just move on? Like to sex or something? Sorry, I’m just really... bummed out right now.”</i>");
	
	output("\n\nReading the sudden shift in the mood, you let the topic die.");

	processTime(10+rand(5));
	bigTiddyGothGFHerselfMenu();

	addDisabledButton(1, "History");
}

public function bigTiddyGothGFHerselfFamily():void
{
	clearOutput();
	bigTiddyGothGFBust();

	output("You ask The Servant about her family, if she has one.");
	
	output("\n\nThe Servant blinks. <i>“Ah. Yeah, of course I do.”</i>");
	
	output("\n\nShe smiles at you faintly, and it’s only after a few moments you realize that was her whole answer. <i>“Wow... could you... tell me about them?”</i>");
	
	output("\n\n<i>“Oh!”</i> She sits up a little straighter in her seat, like a student addressing a teacher. <i>“Well, I have two parents. A mother and father, standard human affair, you know? Uh, they both live on Terra, and...”</i> She presses her lips together, her eyes wandering as she thinks for a moment. <i>“Well... I haven’t spoken to them in around a year, but last I heard all was well.”</i> She shrugs, seemingly finished once more.");
	
	output("\n\n<i>“Wait. Hold on a second.”</i> You’ve seen the pale woman be evasive before, but this is something else. Is that really all she has to say?");
	if (pc.isNice()) output(" <i>“Why haven’t you spoken to your parents in so long?”</i>");
	else if (pc.isMisc()) output(" <i>“Geez, and I thought things were rough with my Dad. What’s the deal with that?”</i>");
	else output(" <i>“Really? Shit, I thought I was cold.”</i>");
	
	output("\n\nThe Servant frowns, then mutters something to herself. <i>“Yes, it’s a legitimate question.”</i> She seems to fight off the urge to roll her eyes, then looks you dead in the eye. <i>“I’ve been busy. Maybe not with what they think I’ve been busy with mind you... but still busy. They think I’m still in school, and I simply feel no need to correct that.”</i> She shrugs, seemingly unable to offer anything else. <i>“That’s really just about it, [pc.name]. But if it’ll make you feel better, I’ll call them over the holidays.”</i>");
	
	output("\n\nNow it’s your turn to frown. <i>“It doesn’t.”</i> You get the feeling this topic was more or less dead the moment you opened your mouth.");

	processTime(10+rand(3));
	bigTiddyGothGFHerselfMenu();
	addDisabledButton(2, "Family?");
}

public function bigTiddyGothGFHerselfRealName():void
{
	clearOutput();
	bigTiddyGothGFBust();

	output("You ask The Servant why she doesn’t want you using her real name.");
	
	output("\n\n<i>“Ah...”</i> She shifts in her seat and fiddles with her rings, clearly uncomfortable with your question. <i>“Well... it’s not exactly my choice mind you... but my master insists that names are merely labels that limit us.”</i>");
	
	output("\n\nYou sigh and roll your eyes. <i>“What the hell does that mean?”</i>");
	
	output("\n\nThe Servant rubs her forehead, seemingly wincing. <i>“I’ll explain it, god... give me a second.”</i> Something about the way she answers tells you she isn’t talking to you.");
	
	output("\n\nShe takes a deep breath and lowers her hand, steeling herself before you. <i>“Think of it this way... You’re last name is Steele, correct? Think about all that means and entails. Now, in your case, that means a lot right? People <i>know</i> something because of it. You’ve been defined. But you’re not just Steele. You’re something else. Nonconstant. You can change, and grow. So how can a label you got at birth possibly define you for the rest of your life?”</i>");
	
	output("\n\nDespite yourself, you follow her reasoning. That’s not to say you agree with it, but you at least understand where she’s coming from. <i>“So why ‘The Servant’ then? Why call you that in particular?”</i>");
	
	output("\n\nThe dark woman doesn’t answer right away, and just rocks back in her chair. Watching her, you notice one of her eyes twitch slightly. <i>“Because... right now, it is what I am. Look... Miranda... I’m not her anymore. Not really. Haven’t been for awhile. If you’d rather call me that, then that’s fine, but I’d rather you respect...”</i> she pauses searching for the right word. <i>“My wish and call me The Servant.”</i> The pale woman takes a deep breath and shrugs. <i>“And yes, I realize how awkward that is to use in a sentence.”</i>");
	
	output("\n\nYou chew on that in silence. While her answer isn’t particularly <i>good</i>, you don’t see the harm in indulging her for now.");

	processTime(10+rand(3));
	bigTiddyGothGFHerselfMenu();
}

public function bigTiddyGothGFHerselfTats():void
{
	clearOutput();
	bigTiddyGothGFBust();

	output("You ask The Servant about her tattoos.");
	
	output("\n\n<i>“Ah.”</i> An excited smile creeps across her face. <i>“Well. I assume you’re asking about one in particular, but since you asked...”</i> She turns her head slightly, lifting a thin finger to point at the back of her neck. <i>“You saw this one right?”</i>");
	
	output("\n\nYou nod, faintly remembering the infinity symbol on the back of her neck when she stripped for you before.");
	
	output("\n\n<i>“This was number one. I got it when I was fourteen and really shouldn’t have been getting tattoos at all. But, I really just wanted to get one, so I forged my mother’s signature and that was that. Small and in a place they wouldn’t see. Or so I thought. They found out a few weeks later.”</i> She drops her hand and turns her neck back. <i>“Grounded for a week, but they let me keep it, so it all worked out.”</i> Scooting her chair back slightly, she pats her stocking covered thighs. <i>“Now, these two were a different story.”</i>");
	
	output("\n\n<i>“The ribbons.”</i> you say aloud. You clearly remember those ones, one the back of each of her pale thighs.");
	
	output("\n\n<i>“With these two I wanted something sexy, but classy. Me and my mother came to an agreement and she let me get them.”</i> She shifts her chair forward, chuckling slightly. <i>“Only after she rejected a few more risque choices of mine. I was sixteen, so still on a short leash with her.”</i> Leaning back in her chair, she pats her corset covered abdomen. <i>“Now with this one I waited until I was eighteen, so no note required this time.”</i>");
	
	output("\n\nThe odd design around her belly button. You remember it, but couldn’t make heads or tail of what exactly it was supposed to be. Not that you were really inspecting it. ");
	
	output("\n\n<i>“It’s an alchemical symbol, however I had the artist spice it up slightly. Actual alchemy symbols are rather... bland, so it’s more based on fiction rather than history.”</i> She smiles, sitting up in her chair, her excitement starting to rise. She seems to take great pride is talking about her tattoos, a passion she doesn’t seem to have for anything other than the necklace at her throat and a few other small subjects. <i>“Now you likely want to know more about my most recent acquisition don’t you?”</i>");
	
	output("\n\nAs you picture the tattoo in your mind, you feel a small ache in your temple. You start to wince at the ache, but when the image leaves your mind’s eye, the pain subsides instantly.");
	
	output("\n\nThe Servant’s blue eyes are fixed on you, watching you closely. <i>“Do you... recognize it?”</i>");
	
	output("\n\nYou picture it again, the pain returning for a moment. As the image forms, you feel like you have seen it somewhere else before, like something from a dream...");
	
	output("\n\nThe Servant seems to read your mind. <i>“I thought so.”</i> She bites her lip, her cheeks flushing red. <i>“It took months to complete, and more than a few artists worked on it. When I first drew the design... well, I had to break it up into separate chunks, but as it drew closer to completion, the last artist had to drop out. I finished the final touches myself.”</i> She gives you a wide smile, clearly more than a little proud of herself.");
	
	output("\n\nSomething about the image is nagging at you. Like an itch you can’t quite reach. In a moment of clarity, you ask her a simple question. <i>“But what is it?”</i>");
	
	output("\n\nThe dark woman’s smile fades, replaced by a look of mild disappointment. <i>“You... don’t know?”</i> When you shake your head no, she seems to deflate even more. <i>“I see... well...”</i> she thinks for a moment, seemingly searching for the right thing to say. <i>“It’s... of a god.”</i>");
	
	output("\n\nThinking back, you don’t recall any god that looks quite like the image on her back, although a few do come somewhat close. Either way, it’s an impressive piece, even if you don’t fully understand it.");

	flags["BIGTIDDYGOTHGF_TATEXPLAIN"] = 1;
	processTime(10+rand(5));
	bigTiddyGothGFHerselfMenu();
	addDisabledButton(4, "Tattoos");
}

public function bigTiddyGothGFNecklace():void
{
	clearOutput();
	bigTiddyGothGFBust();

	output("You ask The Servant to tell you more about her necklace.");
	
	if (flags["BIGTIDDYGOTHGF_NECKLACE"] == undefined)
	{
		output("\n\nHer eyes go wide, and the small woman almost falls from her chair. <i>“What... what do... you mean?”</i>");
		
		output("\n\n<i>“I’m not an idiot.”</i> You point across the table, finger directed at the simple stone laying against her chest. <i>“I know when I’m being fucked with. That things got some mojo to it.”</i>");
		
		output("\n\nThe Servant opens her mouth to speak, but only stammers a few disjointed syllables.");
		
		output("\n\nWhile waiting for the woman’s explanation, you notice the stone around her neck start to shine.");
		if (pc.WQ() < 35) output(" Despite seeing it coming, you’re helpless against it. A shiver runs up your spine. You feel your heart start to beat faster and faster, your blood burning hot. You release a shuddering gasp, the cool air rushing into your lungs a mercy against the heat of your rising lust.");
		else output(" You see it coming, and steel yourself against it. Something hits your brain, blurring your vision and making you wince. Whatever it was, it seems to have bounced off of your... mind?");
		output(" You understand what this is: A psionic attack.");
		
		output("\n\nThe Servant grabs ahold of the stone around her neck, her fingers blocking out its light. <i>“Master, please,”</i> her tone is ragged, and you realize she, too, is being subjected to an attack. <i>“[pc.HeShe] already knows.”</i>");
		
		output("\n\n");
		if (pc.WQ() < 35) output("You take a moment, catching your breath while the heat subsides.");
		else output("You ready yourself, preparing for another mental attack.");
		output(" <i>“What are you talking about?”</i>");
		
		output("\n\nThe Servant tightens her grasp around the stone. <i>“It’s... my master...”</i>");
		
		output("\n\n<i>“What...”</i> From you time spent with her, you know her to be a terrible liar. As far as you can see: She’s telling the truth.");
		
		output("\n\n<i>“If you have questions...”</i> she winces, then tightens her grasp once more. <i>“Master, please...”</i> her jaw tightens and eyes flutter, the woman clearly still fighting off a sinfully lascivious attack.");
		
		output("\n\nThis is getting out of hand. You need to do something.");
		
		output("\n\nBefore you can act, she lets out a deep gasp, deflating in her chair and dropping her hand from her chest, the red stone dimming once more. <i>“It... it’s fine. If you have questions... ask. I will answer...”</i>");
	}
	else
	{
		output("\n\nThe Servant presses her lips together and frowns. <i>“This again?”</i> At her chest, you notice the stone glimmer slightly. <i>“Fine. Ask away. We’re willing to indulge your curiosity.”</i>");
	}

	flags["BIGTIDDYGOTHGF_NECKLACE"] = 1;
	processTime(5+rand(5));

	bigTiddyGothGFNecklaceMenu();
}

public function bigTiddyGothGFNecklaceMenu():void
{
	clearMenu();
	addButton(0, "Red Stone", bigTiddyGothGFNecklaceRedStone, undefined, "The Red Stone","What’s in the necklace?");

	if (flags["BIGTIDDYGOTHGF_REDSTONE"] != undefined) addButton(1, "Origins", bigTiddyGothGFNecklaceOrigins, undefined, "Origins", "Ask where it came from.");
	else addDisabledButton(1, "Origins", "Origins", "You need a little more foundation before you push for more details...");

	if (flags["BIGTIDDYGOTHGF_ORIGINS"] != undefined) addButton(2, "Her", bigTiddyGothGFNecklaceHer, undefined, "Her", "What’s her role in all this?");
	else addDisabledButton(2, "Her", "Her", "You need a little more foundation before you push for more details...");

	addButton(14, "Back", bigTiddyGothGFMenu);
}

public function bigTiddyGothGFNecklaceRedStone():void
{
	clearOutput();
	bigTiddyGothGFBust();

	output("You ask her to tell you the secret behind the Red Stone Necklace.");
	
	output("\n\nThe Servant frowns. <i>“I think I’ve made that fairly clear already.”</i> She lifts her hand and points towards her throat. <i>“It’s my master.”</i>");
	
	output("\n\nYou roll your eyes. <i>“You’ve said that, but havent really explained it.”</i> For your own part, you know it’s clearly psionic, but whether it’s some sort of focus or if it really has a mind of its own... you can’t be sure.");
	
	output("\n\nShe lowers her hand and sighs, tapping the table with her painted nail. <i>“It’s the simple answer. The hard answer...”</i> she frowns and continues. <i>“The necklace I’m wearing is a...”</i> she hesitates a moment, searching for the right word. <i>“Well, it’s a vessel. An anchor of sorts that my master needs to be able to exist on this plane.”</i>");
	
	output("\n\nYou eyeball the necklace for a moment. It seems to shine slightly with a light of its own, an other worldly gleam that makes you feel slightly... hot. Shaking away the feeling, you press the dark woman for more answers. <i>“This plane? What does that even mean?”</i>");
	
	output("\n\nThe Servant cracks a smile, then offers a casual shrug. <i>“I’m not sure myself, if I’m being perfectly honest. All I know is it’s not from here.”</i> Sighing, she leans back in her chair, fiddling with a loose strand of her hair. <i>“It came to me from beyond the veil, and it helped me put itself inside of this necklace. It was so small when it came to me... so... weak.”</i> She sighs, her blue eyes dropping down to look at her chest.");
	
	output("\n\nWatching her, she suddenly seems depressed, as if all the moxy was sucked from her. <i>“Weak? What do you mean it was weak?”</i>");
	
	output("\n\n<i>“Weak. Yes.”</i> she looks up from her chest and faces you, her eyes wet and on the verge of tears. <i>“It needed to be nursed back to health. It feeds on... well lots of things really, but lust seems to be what works best. It craves it, grows fat from it. The more lust I feel, the more sinful the pleasure, the greater it feeds and grows.”</i> The Servant chuckles to herself, reaching for the stone and stroking it tenderly. <i>“I called out to a god, and what came was a sliver of a shadow. It was hurt. It needed me. So I nurtured it, holding it in the womb of mind and feeding it the sweet milk of sinful depravity,”</i> she cracks a weak smile. <i>“I cared for it like it was my own child, and in many ways I still do.”</i>");
	
	output("\n\n<i>“So let me get this straight...”</i> you take a breath, collecting your thoughts. <i>“You’re telling me... that an interdimensional being, using your words a ‘god’, is living in a piece of jewelry around your neck... and it eats orgasms...”</i>");
	
	output("\n\nThe Servant chuckles, clearly seeing the ridiculousness of it all. <i>“Yeah, that’s pretty much the crux of it.”</i>");
	
	output("\n\nYour eyes fall back down to the necklace at her chest. You believe the woman is telling the truth, or at least think she is.");
	
	output("\n\nYou’re not sure how to feel about that...");

	processTime(10+rand(3));
	flags["BIGTIDDYGOTHGF_REDSTONE"] = 1;

	bigTiddyGothGFNecklaceMenu();
	addDisabledButton(0, "Red Stone");
}

public function bigTiddyGothGFNecklaceOrigins():void
{
	clearOutput();
	bigTiddyGothGFBust();

	output("You ask The Servant where exactly the necklace came from.");
	
	output("\n\n<i>“Oh, well that one’s easy. I made it.”</i> She gives you a wide smile, sitting up to her full height, brimming with pride.");
	
	output("\n\nYou get the distinct impression she’s telling the truth, but you surmise that she isn’t exactly telling the <i>whole</i> truth. The psionic power inside of bauble tells you that much at least. <i>“How, exactly, did you make it?”</i>");
	
	output("\n\nThe Servant’s smile cracks, and you can’t help but notice her ringed fingers clench shut. Something about the question seems to have thrown her off, clearly taking her by surprise that you asked. <i>“Ah, yes well...”</i> she shifts in her chair, seemingly trying to conjure an answer from thin air. <i>“Well, around a year ago I made a breakthrough in my research and attempted to... well, it’s complicated.”</i>");
	
	output("\n\nYou lean back in your chair, crossing your arms over your [pc.chest]. <i>“Humor me and explain it anyways.");
	if(pc.IQ() < 25 || pc.isBimbo() || pc.isBro()) output(" Just don’t use to many big words and try to lose me.");
	else output(" I’m sure I’ll be able to follow along just fine.");
	output("”</i>");
	
	output("\n\nThe Servant snorts, seemingly not liking your response. <i>“Fine. I fashioned the necklace out of a ceremonial stone that was part of a ritual I was trying to recreate. Academically of course...”</i> she lifts her hand to her temple, scratching just above her studded ear. <i>“The ritual’s origins are... well, difficult to grasp. Many species throughout the galaxy, independent of each other mind you, have some version of it. I was attempting to fuse them together, focusing on the shared aspects while trimming the fat,”</i> she taps the necklace around her throat. <i>“This was unintended, but not an unwelcome result.”</i>");
	
	output("\n\nYou examine the Red Stone Necklace for a moment, seeing it gleam once more. Something about her explanation doesn’t sit right with you. If it was an unintended result, then what was she trying to do? <i>“What was the goal of the ritual then?”</i>");
	
	output("\n\nThe Servant seems almost amused by the question. <i>“Well, there were a few different possible outcomes, if the source material could be believed. One iteration of it was believed to cause fertility, while another thought it was a way to commune with the dead.”</i>");
	
	output("\n\nYou can tell she’s being evasive, not wanting to properly share. Cutting through her smokescreen, you ask her flat out what she thought was going to happen.");
	
	output("\n\nShe hesitates, then smacks her painted lips together. <i>“Honestly?”</i>");
	
	output("\n\n<i>“Yes. Honestly.”</i>");
	
	output("\n\n<i>“I...”</i> she trials off, looking down at her chest. You can tell it’s speaking to her, as she seems to be focused on it rather intently. When she speaks, her voice is softer than normal and noticeably subdued. <i>“I didn’t think anything would happen. Not really. I just... wanted to do it. It seemed like it would have been... fun. To try and call out to the void and maybe hear a call back.”</i> She looks up from her chest and sighs. <i>“Imagine my surprise when it not only works, but I get a visitor as well.”</i>");
	
	output("\n\nYou can’t help but frown at the absurd explanation. Is she trying to tell you that she just did it for fun? Trying to be serious, you ask her what is fun about talking to a transdimensional being.");
	
	output("\n\n<i>“An interest in the dark and macabre, maybe?”</i> she scoffs, rolling her eyes, a hint of her bratty attitude just under the surface. <i>“I was trying to prove something, and I guess I did. How could so many cultures spread out over so many worlds believe things so similar? That was the academic in me, but to say there wasn’t a part of me that wanted to meet something... ‘Dark and Otherworldly’? Well, sue me I’m guilty.”</i> She leans back in her chair, a smug expression on her pale face. <i>“So. Does that answer your question?”</i>");
	
	output("\n\nIt doesn’t really, but you get the feeling she doesn’t know much more. Whatever exactly happened might only be really known by whatever is inside the necklace itself, and you’re not about to speak to it directly.");

	processTime(10+rand(3));
	flags["BIGTIDDYGOTHGF_ORIGINS"] = 1;

	bigTiddyGothGFNecklaceMenu();
	addDisabledButton(1, "Origins");
}

public function bigTiddyGothGFNecklaceHer():void
{
	clearOutput();
	bigTiddyGothGFBust();

	output("You ask The Servant why exactly she’s serving an interdimensional being.");
	
	output("\n\n<i>“Well,”</i> she rubs her chin, not breaking eye contact with you. <i>“I’m not vain enough to think it crossed dimensions just because I asked it to, but it came to me and me alone. It guided my hand, using me to form its vessel,”</i> she drops her hand and hesitates a moment, her gaze focused on you intently. <i>“It needed help, and I just so happened to be signaling it.”</i>");
	
	output("\n\nDespite her tone, you understand her curiosity. But you notice she didn’t really answer your question. <i>“That doesn’t explain why you decided to be it’s caretaker.”</i>");
	
	output("\n\nThe Servant flinches at the final word, and you notice her blue eyes seem to narrow in anger. <i>“History often thrusts great responsibility on the unlikely, Steele.”</i> She presses her dark lips together tightly, turning her head away from you.");
	
	output("\n\nThat bratty attitude again. Something about what you said must have gotten under her skin. Why exactly you’re not sure, but it seemed to be the word ‘caretaker’.");
	
	output("\n\nYour thoughts are cut off by a blinding red light.");
	if (pc.WQ() < 35) output(" Powerless to resist, the light invades your mindscape, sending your consciousness flying.");
	else output(" Before you can ready yourself to resist, the light invades your mindscape, sending your consciousness flying with the sneak attack.");
	
	output("\n\nYour sight blurs and images flood your mindscape. Psionic and vivid, but with none of the burning heat of lust it is normally associated with. You see a vision of The Servant, naked on the floor in a heap. Her pale back is bare, the intricate tattoo to her god nowhere to be seen. She’s covered in sweat, and her pale thighs are soaked with dozens of orgasms worth of juices. Around her neck she’s wearing The Red Stone Necklace.");
	
	output("\n\nYou understand this to be a vision of the past, although how the necklace is able to show you this is a mystery to you.");
	
	output("\n\nThe Servant twitches feebly on the floor, her eyes glazed over. The stone is feeding, seemingly draining the life from her. Before your eyes you watch as what little color is left in her face fades, and her breathing slows to a near halt. She’s dying. In the quiet of the room, you barely make out the woman croak something, almost sounding vaguely like words.");
	
	output("\n\nSilence fills the air for a moment.");
	
	output("\n\nWith a loud gasp, The Servant launches up to a sitting position, her ample chest heaving up and down from her intense breathing. Compared to just an instant before, she looks infinitely better, color returning to her face already. At her throat you see the small red stone twinkle.");
	
	output("\n\nThe world spins and twists, and your vision returns to the now and the table. The Servant is looking at you once more, her expression now somber. <i>“What did my master show you, Steele?”</i>");
	
	output("\n\nYou hesitate for a moment, but decide to tell her what you saw. As you speak, you notice her twitch slightly, clearly not pleased with what you saw. She manages to keep it together, and you notice tears starting to build in the corners of her smoky eyes. As you finish recounting your vision, you ask The Servant what exactly was it that you were shown.");
	
	output("\n\nShe twitches again, staying silent for a moment, leaving question hanging in the air between you. <i>“My master spared me that night. I was drowning in it. That lust... that bliss. Flesh is weak, [pc.name]. No one is meant to taste that kind of pleasure, because no one can survive it.”</i> Turning her head away from you, she crossed her arms over her chest and sighs, seemingly not wanting to speak anymore about the memory.");
	
	output("\n\nYou get the feeling she isn’t going to elaborate any further, even if you order her. You look down at the necklace hanging from her throat, considering the dangers of too much pleasure.");

	processTime(10+rand(3));
	flags["BIGTIDDYGOTHGF_NECKHER"] = 1;

	bigTiddyGothGFNecklaceMenu();
	addDisabledButton(2, "Her");
}

public function bigTiddyGothGFFlirt():void
{
	clearOutput();
	bigTiddyGothGFBust();

	if (flags["BIGTIDDYGOTHGF_FLIRT"] == undefined)
	{
		output("You decide it’s time to turn on the old Steele charm and see how willing to serve the dark woman is. Trying your smoothest, most salacious line, you proposition her.");
		
		output("\n\nThe Servant stares at you in silence, seemingly taken aback by your line. After a short pause she rolls her eyes and sighs. <i>“You don’t need to game me. I’ve been down to fuck the moment we met.”</i>");
		
		output("\n\n<i>“Oh.”</i> You’d forgotten that. Well that makes things simple.");
	}
	else
	{
		output("You tell The Servant you wish for some physical attention.");
		
		output("\n\nThe dark woman smiles and sits up a bit straighter, her blue eyes focusing in on you intently. She’s excited, and maybe even wants this more than you do.");

	}

	clearMenu();

	if ((pc.hasCock() || pc.hasVagina()) && pc.isBiped()) addButton(0, "Her Hands", bigTiddyGFUnderTable, false, "Use Her Hands", "Put her fingers to work.");
	else addDisabledButton(0, "Her Hands", "Use Her Hands", "You need to be bipedal and have genitals for her to put her fingers to work on them!");

	if ((pc.hasVagina() || (pc.hasCock() && pc.smallestCockLength() <= 14)) && pc.isBiped()) addButton(1, "Her Mouth", bigTiddyGFUnderTable, true, "Use Her Mouth", "Make her workship you on her knees.");
	else addDisabledButton(1, "Her Mouth", "Use Her Mouth", "You need a vagina or a cock shorter than 14 inches, and be bipedal for this!");

	if (flags["BIGTIDDYGOTHGF_USEDHER"] != undefined) addButton(2, "Strip Her", bigTiddyGothGFStripHer, undefined, "Make Her Strip", "Make her bare her flesh to you.");
	else addDisabledButton(2, "Strip Her", "Make Her Strip", "You gotta let her get her hands or her mouth onto you first!");

	addButton(14, "Back", bigTiddyGothGFMenu);
}

public function bigTiddyGFUnderTable(isMouth:Boolean):void
{
	clearOutput();
	bigTiddyGothGFBust();

	IncrementFlag("BIGTIDDYGOTHGF_USEDHER");

	output("<i>“Hm, simple. But I can do that.”</i>");
	
	output("\n\nThe Servant scoots back her chair and stands, running her hands over her skirt to flatten it out. You begin to rise yourself, but the dark woman stops you. <i>“No, no. No need for that, I can service you well enough here.”</i>");
	
	output("\n\nWith surprising grace, The Servant lowers herself down onto her hands and knees, crawling under the table, disappearing from view. A moment later you feel her hand against your [pc.leg], her lithe fingers tracing along your inner thigh. From under the table you hear her purr, <i>“Oh, [pc.name]. I’ve been looking forward to this.”</i>");
	
	output("\n\n");
	if (pc.isNude()) output("You hear her muse to herself. <i>“Normally, I like to unwrap my presents. Oh well, I’m not picky.”</i>");
	else output("<i>“Pardon me.”</i> Her hands run over your [pc.crotchCover], and you feel her fingers start to free you from your restrictive gear. <i>“That’s much better.”</i>");
	
	output("\n\nYou feel her scoot in closer, the small woman positioned directly between your [pc.legs]. <i>“Just sit back and relax. I’ll take very good care of you. Promise.”</i>");
	
	output("\n\n");
	if (pc.hasCock()) 
	{
		output("The Servant’s fingers trail along, gliding slowly against your [pc.skinFurScales]. Her hand is cold against your [pc.skinFurScales], the dark woman feeling as if she’s barely giving off any heat at all. You quiver at her touch, the chill of her fingers distracting you as she moves closer to your [pc.cock].");
	
		output("\n\n<i>“Oh, [pc.name].”</i> You feel her delicate, ring covered fingers wrap around you, your meaty manhood already mostly erect and waiting. Her cold digits make you twitch, your cockflesh sensitive to her cool touch. With a gentle grip, you feel her fingers start to move up and down your [pc.cockShape] length slowly. <i>“This is going to be fun.”</i>");
	}
	else
	{
		output("The Servants fingers trail along your thigh, gliding slowly against your [pc.skinFurScales]. Her hand is cold against your [pc.skinFurScales], the dark woman feeling as if she’s barely giving on any heat at all.You can’t help but quiver at her touch, the chill of her fingers distracting you as she moves closer to your [pc.vagina].");
	
		output("\n\n<i>“Oh, [pc.name].”</i> You feel her fingers glide over to your crotch, your snatch already moist from the anticipation. Her cold digits make you twitch, your cuntflesh sensitive to her cool touch. <i>“This is going to be fun.”</i>");
	}

	processTime(5+rand(7));
	pc.changeLust(10+rand(6));

	clearMenu();
	addButton(0, "Next", (isMouth ? bigTiddyGFUnderTableMouth : bigTiddyGFUnderTableHands));
}

public function bigTiddyGFUnderTableHands():void
{
	clearOutput();
	bigTiddyGothGFBust();

	if (pc.hasCock())
	{
		output("Her cool fingers seem to warm to the touch as they slide up and down your [pc.cockShape] meat, in no small part due to the heat from your loins. You feel yourself rise to full mast, The Servant’s hand starting to move along the rest of your engorged [pc.cockNounSimple]. Her hand tightens against you, her grip firm on your [pc.cockShape] shaft, causing her rings to press in slightly, a depraved and lusty form of light torture. Your cock throbs against her delicate fingers, fighting the tightness of her grasp. The Servant’s hand starts to move with more drive, her light caress beginning to turn into proper stroking. A small gasp escapes your [pc.lipsChaste] as your cock throbs once more in approval.");
		
		output("\n\n<i>“Does this feel good?”</i> The Servant’s voice is low and sultry, teasing you from down below. Before you can answer, she gives you a playful squeeze, drawing out another lewd gasp. <i>“I’ll take that as a yes,”</i> she giggles.");
		
		output("\n\nSomething cold presses against your [pc.cockHead], causing you to jerk at the sudden discomfort. From what you can tell, it’s the palm of her left hand, still quite cold compared to her right. Slowly, she begins to rub your cockhead, twisting her hand around your engorged and sensitive tip. The discomfort fades away quickly with the effort of both of The Servant’s hands working away at your [pc.cockNounComplex]. The hand on your cockhead starts to warm up quickly, due to the burning heat from your throbbing mast rising.");
		
		output("\n\nYou lean back in your seat and let out a gasp, the woman below you working away at your pulsing manhood. Closing your eyes, you slip away into a world of bliss, losing yourself to the addictive pleasure. Down below your cock twitches, the burning meat between your legs growing hotter with each passing second. At this rate, you don’t think it’ll be long before you pop.");
		
		output("\n\nThe Servant switches her grip, both of her dainty hands now grabbing hold of your veiny shaft. Her metal laced fingers flex against your cockflesh, squeezing you tight as she starts to stroke you with both of her hands at once. You feel your cock throb at the change, and a depraved moan vocalizes your approval. After a moment, The Servant starts to ramp up her pace, her hands working up and down your pulsating [pc.cockNounSimple] at breakneck speed. You gasp and moan at the small woman’s touch, your cock burning in lusty approval. Below the table, you hear the small woman’s breathing start to rise. She’s exerting herself, trying to push you over the edge as quickly as possible. A familiar ache in your [pc.balls] tells you she isn’t going to have to wait long.");
		
		output("\n\n<i>“Please, [pc.name]”</i>. You hear her pant under the table, begging you. <i>“Cum for me. Please.”</i>");
		
		output("\n\nThe sound of her sultry voice sends a shiver up your spine, and you feel yourself oblige.");
		
		output("\n\nThe ache expands, and you feel your [pc.balls] churn. A second sensation runs up your spine, this one a rush of pleasure as your cockhead explodes. Thick, hot spunk fires out of your [pc.cockHead] as a throaty moan escapes your lips. Your whole body shudders as you shoot off your burning load, and below the table you hear The Servant let out a surprised cry. Her hands don’t stop however, and the small woman continues to work your overstimulated meat, milking you for every drop of your steaming cum.");
		
		output("\n\nAfter a few long heartbeats, The Servant’s hands slow down, and a moment later you feel her release you completely. Slowly, you see the small woman crawl out from under the table, half of her pale face covered in your [pc.cumColor] hot seed. Seemingly from out of nowhere, The Servant produces a white handkerchief and starts to wipe at the cumshot.");
		
		output("\n\n<i>“Fuck, I managed to avoid most of it. I don’t mind being cum onto, [pc.name]. But I’m not particularly a fan of taking it in the eye.”</i> Still wiping her face, she sits back down in her chair. <i>“So, did I perform to your satisfaction?”</i>");
		
		output("\n\nYou feel your now mostly deflated cock twitch below the table. You reply to the woman with a content smirk on your face. <i>“Oh yeah.”</i>");
		
		output("\n\nFinishing up, The Servant stuffs the cum soaked rag away and smiles at you, her pale face <i>seemingly</i> clean. At her chest, you notice her necklace is shining a bit brighter than it was the last time you saw it. <i>“Happy to serve. So, now what, [pc.name]?”</i>");
	}
	else
	{
		output("\n\nSlowly, you feel her fingers start to rub against your soft folds. Her digits seem to warm as they slide up and down, in no small part due to the heat from your burning loins. You feel yourself start to relax now, as The Servant’s hand presses against your twat a bit more firmly. Her thin fingers slip between your lips, exploring your warm and wet inner cunt more intimately. Your pussy quivers at her touch, her fingers caressing your excited womanhood, teasing to enter deeper. You can’t help but squirm in your chair, your twat growing increasingly eager to be touched and explored. The Servant’s metal covered fingers press into you, sliding slowly inside, and making you gasp slightly.");
		
		output("\n\n<i>“Does this feel good?”</i> The Servant’s voice is low and sultry, teasing you. Before you can answer, her fingers push in deeper, drawing out another gasp. <i>“I’ll take that as a yes,”</i> she giggles.");
		
		output("\n\nA different digit comes to rest against your clit. Based on the size of it, you can tell that it’s her thumb, and without missing a beat she starts to rub your love button. A spike of pleasure hits you as she works your clit, and you can’t help but grip the table in front of you tightly for support. Two of The Servant’s other fingers slip further inside of your quivering pussy, sliding in easily due to the slick wetness of your engorged sex. You feel yourself tighten against her slender digits as she moves in deeper, her fingers warming up as she probes you. ");
		
		output("\n\nYou lean back in your seat and let out a depraved gasp, the woman below you working away at your hungry snatch. Closing your eyes, you slip into a world of bliss, losing yourself to the sinful pleasure. Down below your cunt quivers, your warm womanhood growing hotter with each passing second.");
		
		output("\n\nThe Servant’s thumb presses harder against you, and you feel her start to rotate it faster and faster on your sensitive clit. You let out a throaty groan as strong waves of pleasure fire through your body, making your muscles start to twitch and seize. Her ringed fingers in your cunt start to curl and move, rubbing up against your hidden G-spot with practiced precision and speed. The burning heat in your pussy starts to become too much as you struggle to stay upright, leaning hard against the table, threatening to upturn it completely. Your breathing becomes ragged, each lungful of air seemingly not enough as you gasp and moan like a well used whore. Wetness oozes from your cunt, drenching The Servant’s hand as her fingers continue to work away inside of you.");
		
		output("\n\n<i>“Please, [pc.name]”</i>. You hear her coo under the table, begging you. <i>“Cum for me.”</i>");
		
		output("\n\nThe sound of her sultry voice sends a shiver up your spine, and you feel yourself oblige.");
		
		output("\n\nYour head falls back and you try to scream, only for staggered silence to escape your lips. The whole of your body tenses and quivers, every muscle and nerve ending afire. Your pussy explodes, sending waves of burning hot bliss throughout every fiber of your being, flooding your brain with a euphoric haze. Finally, a lewd sound escapes your lips, a shuddering high pitched cry that doesn’t seem to end. Down below, The Servant’s hands don’t stop, the small woman continuing to work your overstimulated cunt, prolonging your climax to a near torturous degree.");
		
		output("\n\nAfter a few long heartbeats, The Servant’s hands stop, and you feel her fingers pull out of your spent cunt. Slowly, you see the dark woman crawl out from under the table, her right hand and rings covered in your [pc.cumColor] girlcum. Seemingly from out of nowhere, The Servant produces a white handkerchief and starts to wipe off her hand.");
		
		output("\n\n<i>“I might have to redo my nails after that one, [pc.name].”</i> Still wiping her fingers, she sits back down in her chair. <i>“So, did I perform to your satisfaction?”</i>");
		
		output("\n\nYou feel your spent pussy quiver below the table. You reply to the woman with a content smirk on your face. <i>“Oh, yes.”</i>");
		
		output("\n\nFinishing up, The Servant stuffs the cum soaked rag away and smiles at you, her pale hands <i>seemingly</i> clean. At her chest, you notice her necklace is shining a bit brighter than it was the last time you saw it. <i>“Happy to serve. So, now what, [pc.name]?”</i>");
	}

	processTime(15+rand(5));
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", bigTiddyGothGFHerself);
}

public function bigTiddyGFUnderTableMouth():void
{
	clearOutput();
	bigTiddyGothGFBust();

	if (pc.hasCock() && pc.shortestCockLength() <= 14)
	{
		var cockIdx:int = pc.cockThatFits(14, "length");
		if(cockIdx < 0) cockIdx = pc.smallestCockIndex();

		output("A pair of soft, pillowy lips press gently against your [pc.cockHead "+cockIdx+"]. The Servant plants a tender kiss right on the tip of your still rising cock while her hand coaxes you up to your full mast. Slowly, you feel her lips part, and from between them her tongue gently gives you a small, teasing lick. Unlike her delicate fingers, her tongue is quite warm, the difference in temperature such a stark contrast that the small lick affects you far more than it should.");
		
		output("\n\nA soft moan escapes your quivering lips, your now fully erect cock throbbing contently, brought on by The Servant’s teasing lick. She delivers a second, slightly more powerful lick, her mouth opening wider as her supple lips move down over your pulsing cockhead. A quiver runs up your spine as she starts to take you into her heavenly mouth, locking your jaw for a moment as the rush hits your face. Licking the whole time, she continues to work her way downward, lowering her hand on your shaft to the very base of your [pc.cockShape "+cockIdx+"] meat.");
		
		output("\n\nHer lips, seemingly built for blowjobs, tighten around your veiny girth, sealing your cock away in her perfectly shaped mouth. Before you can further enjoy her oral skills, something hard presses against your sensitive [pc.cockHead "+cockIdx+"]. Her tongue stud glides around the crown of your flared tip, pressing into you with surprising pressure. The sensation makes you twitch and gasp aloud, a subtle mix of discomfort and pleasure. Trailing further down your length, you feel her working her tongue along the rest of your meaty shaft, the warm feeling and hard metal teasing you the whole way.");
		
		output("\n\nYour thick meat throbs in approval. Between her soft lips, you feel yourself start to ache for more, the teasing of her tongue no longer enough to satisfy your now boiling lust. Seemingly sensing your needs, The Servant starts to bob her head slowly, no longer just teasing you with licks. Your eyes flutter for a moment as she starts to suck you off good and proper, the perfect cock sucking lips of the woman now being fully utilized. You let your head fall back as blissfully sinful sensations start to roll through your body. The Servant starts to bob faster and deeper, increasing her pace slowly but surely. Wet sucking sounds start to fill the air, warm wetness from her mouth starting to ooze down the length of your pulsating member.");
		
		output("\n\nAt the base of your shaft her hand starts to move, a very tight and concise jerking that only works a small area of your sensitive cock. At the same time you feel her tongue start to swirl around your head, the metal of her tongue stud running around the edge of your flared crown. A moan of depravity escapes your lips, the dark woman’s efforts pushing you closer to the edge with each blissful second. You feel your [pc.balls] aching already, and you know the seemingly master cocksucker in your lap isn’t going to take much longer to finish you off. Enjoying her while you can, you close your eyes and sigh, basking in the pleasure as the woman works to finish you.");
		
		output("\n\nIt doesn’t take long. Your [pc.balls] tighten, and a powerful sensation rocks you as your virile cock erupts. A loud and depraved groan escapes your [pc.lipsChaste], and you grab the table in front of you for support as you unleash a massive load of [pc.cumColor] cum, directly into The Servant’s waiting mouth. Below the table you hear her moan in the back of her throat, while you pump her full of your hot seed. She doesn’t stop sucking, eagerly swallowing down every last sinfully delicious drop.");
		
		output("\n\nAfter a long moment, you feel your cock pop out of her mouth. Slowly, you see the small woman crawl out from under the table, a wide and knowing grin on her face, her dark lipstick smeared over her face, chin wet with mingling saliva and [pc.cumNoun]. Pulling a small compact from seemingly out of nowhere, she starts to clean up her ruined makeup. <i>“Oh, [pc.name]. That was delectable. I might be able to skip dinner now. So. Did I perform to your satisfaction?”</i>");
		
		output("\n\nYou feel your now mostly deflated cock twitch below the table. You reply to the woman with a contented smirk on your face. <i>“You were great.”</i>");
		
		output("\n\nSmiling, she finishes adjusting her lipstick and stuffs the small mirror away. <i>“Happy to serve.”</i> At her chest, you notice her necklace is shining a bit brighter than it was the last time you saw it. <i>“So, now what, [pc.name]?”</i>");
	}
	else
	{
		output("Soft, pillowy lips press against your womanly folds, planting a tender kiss before you feel them part and her hidden tongue comes out to play. It teasingly wiggles against your skin, slipping between your juicy lower lips. The slick, probing muscle feels its way around your already wet flesh until it finds its intended target. The Servant flicks the tip of her tongue against your clit, electrifying your nerves with sudden pleasure, forcing a lascivious gasp from your throat. The abrupt stimulation catches you off guard and affects you more than it should, you can tell The Servant is skilled in giving pleasure, perhaps also assisted by her sinfully suggestive tongue piercing.");
		
		output("\n\nYour tissues engorge with blood and begin to pulse, eager and hungry for more attention. Reacting to the growing heat in your loins, you feel the Servant’s tongue drag between your folds, twisting as it goes, eliciting ripples of pleasure through your body.");
		
		output("\n\n<i>“Faster,”</i> you manage to groan, your heavy head falling back. The Servant complies quickly, increasing the pace of her attentions on your ever-slickening twat. You press your thighs to her ears, trapping her face against your quivering cunt, but she doesn’t protest. Absently, you wonder how, or if, she can even breathe with how enthusiastic her affections are, but those thoughts are quickly drowned out in a sea of pleasure.");
		
		output("\n\nHer lips and jaw work against your flesh, mouthing almost hungrily at your dripping womanhood, drinking in your juices. The Servant’s tongue slides and pushes its way into your hole, surprising you with its length and girth as it fills you deliciously. The way she uses it surprises and delights you, she seems to know exactly how best to please you, almost like she’s in your head.");
		
		output("\n\nYou begin moaning and panting like a bitch in heat, squirming in the chair from the lascivious assault. The Servant is expertly tongue-punching your fuck-hole and it’s driving you mad. Your whole body begins to shake, and that seems to alert The Servant that you’re so, so close. Sliding her tongue out of your dripping cunt, she presses the ball of her tongue piercing to your clit and begins to fervently attack it, drawing a high, keening moan from you as your pleasure mounts.");
		
		output("\n\nYour body begins to quake uncontrollably as The Servant’s skillful and voracious mouth pushes you closer and closer to climax. A final, tortured wail escapes you as ecstasy crashes through your body, drowning you in bliss, and you release your thighs from around the servant’s head, panting with exhaustion.");
		
		output("\n\nAfter a long moment, you feel her tongue leave your spent snatch. Slowly, you see the small woman crawl out from under the table, a wide and knowing grin on her face. Saliva and cunt juices are dripping from her chin and cheeks, her lipstick smeared to ruin. Pulling a small compact from seemingly out of nowhere, she starts to clean up her ruined makeup. <i>“Oh, [pc.name]. That was delectable. Did I perform to your satisfaction?”</i>");
		
		output("\n\nYou feel your cunt twitch below the table. You reply to the woman with a contented smirk on your face. <i>“You did amazing.”</i>");
		
		output("\n\nSmiling, she finishes adjusting her lipstick and stuffs the small mirror away. <i>“Happy to serve.”</i> At her chest, you notice her necklace is shining a bit brighter than it was the last time you saw it. <i>“So, now what, [pc.name]?”</i>");
	}

	processTime(15+rand(5));
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", bigTiddyGothGFHerself); // Its what the doc says to do...
}

public function bigTiddyGothGFStripHer():void
{
	clearOutput();
	bigTiddyGothGFBust(true);

	output("<i>“As you wish, [pc.name].”</i>");
	
	output("\n\nThe Servant scoots back her chair and stands, running her hands over her skirt to flatten it down. Stepping to the side of her chair, she stands before you in the candlelight, her full figure on display. With a shrug of her slender shoulders, her thin cardigan slips off and falls to the ground, exposing the woman’s arms and shoulders.");
	if (flags["BIGTIDDYGOTHGF_NAKED"] == undefined) output(" Along her now exposed skin you notice something curious: Tattoos running over her shoulders, leading down her front and under her corset.");
	output(" Slowly, she lifts up one of her boot covered legs and sets it down on her now vacant chair. In better lighting, you’d for sure have a prime view of her panties, but the dim atmosphere only offers shadow. ");
	
	output("\n\nThe Servant reaches down to her raised boot and starts to undo several buckles, then tugs it off completely and tosses it aside unceremoniously. She repeats the process with her other boot, removing it then discarding it to the floor just as haphazardly. Without her boots on, she stands a fair portion shorter than you’re used to, and you notice her wiggle her now freed toes through her sheer stockings. <i>“Hmm. So nice to let my feet breathe, leather really seals in the flavour.”</i> She takes a few slow paces away from the table, each step slow and suggestive, then gives you a mischievous look. Stretching, she ruffles her hair and groans");
	if (flags["BIGTIDDYGOTHGF_NAKED"] == undefined) output(", and you catch a sight of a mark on the back of her neck");
	output(". <i>“Hope you’re ready for the rest, because it’s time for the main event.”</i>");
	
	output("\n\nHer decorated hands move to her sides, running up and down the seductive curves of her hourglass figure, accentuated by the tightness of her dark corset. After a few teasing runs up and down her body, her hands settle on the hem of her skirt, unfastening a hidden button and letting the piece of fabric fall free to the floor. Now exposed, you take in the sight of her panty and garter belt set. Her garter belt is little more than simple black straps around her hips, while her panties are sheer and thin. You feel your face flush, seeing through the transparent material.");
	
	output("\n\nTurning on her heel, The Servant spins around, bending over and offering you a perfect view of her very round and pale rump. Turns out her panties are a thong, and something about her exposed ass reminds you of a full moon.");
	if (flags["BIGTIDDYGOTHGF_NAKED"] == undefined) output(" You can’t help but notice two more tattoos, like the ones on her shoulders, running around her hips and under her ass. They almost look like tentacles to you...");
	output(" She wiggles her rear end for you, giggling and looking over her shoulder with a smile as her juicy ass wobbles deliciously. <i>“Still a bit more to go, [pc.name].”</i>");
	
	output("\n\nShe reaches around to the small of her back and begins to undo the knot in her corset strings. Fingers working deftly, she pulls the knot out quickly and loosens the strings, then stands back up to her full height and turns around to face you. With her corset now half undone, her massive tits start to spill out the top. You watch them jiggle as she starts to unclasp the now unsupportive piece of attire, catching the sight of pink as they move. When the final clasp comes free, she peels open her top, baring her chest fully to you.");
	
	output("\n\nHer tits are indeed large, larger than you thought without the corset compressing them. The two huge orbs are as pale as the rest of her, each capped with a bright pink nipple pierced through with simple metal rings.");
	if (flags["BIGTIDDYGOTHGF_NAKED"] == undefined) output(" You also notice more tattoos, the two from her shoulders, trailing around and under each of her tits, and a third around her metal-stuck belly button.");
	output(" The Servant reaches up and grabs at herself, squishing and playing with her sinfully fat chest.");
	
	output("\n\nThe show doesn’t last long, and soon the Servant drops her hands from her chest to her thighs, unclipping her garter straps from her stockings, then pulling the whole belt off and tossing it aside. Slowly, she rolls down her stockings one leg at a time, then throws them in her growing pile of discarded clothing.");
	if (flags["BIGTIDDYGOTHGF_NAKED"] == undefined) output(" You also notice two tattoos on the back of her legs, a matching set of ribbons about half way up her thighs.");
	output(" Now, just in her panties, she reaches for their sides, chewing her lip seductively. Slowly, she bends over, letting her massive chest hang in low while she slides down her sheer thong. Pulling it free from her pale legs, she stands up straight before you, now fully nude and on display. Her twat is bald and plainly terran, a bit of moisture already starting to form between those lips. She’s excited, and ready for you.");
	
	if (flags["BIGTIDDYGOTHGF_NAKED"] == undefined) output("\n\n<i>“One more thing.”</i> Slowly, the dark woman turns around, exposing her bare back to you for the first time. Immediately, your eyes strain and you feel your mind go numb. The tentacle tattoos on her chest and hips both lead back into... something. Something that takes up almost the whole of her back. At first you think it’s a storm cloud, as it vaguely looks like a black mass and you spot what clearly is lightning. Straining your eyes, you clearly see in the center of the storm a gaping maw, lined with razor sharp teeth. Before you can process it further, The Servant turns back around, a smile on her face. Immediately having it taken out of sight, you feel your mind clear, and your vision returns to normal.");
	
	output("\n\nWith one hand between her legs, playing with herself shamelessly, The Servant smiles at you. <i>“Now. How will you take me?”</i>");


	flags["BIGTIDDYGOTHGF_NAKED"] = 1;

	processTime(5+rand(3));
	pc.changeLust(10);

	clearMenu();
	if (pc.hasCock() && pc.shortestCockLength() <= 16) addButton(0, "Fuck Her", bigTiddyGothGFFuckHer, undefined, "Fuck Her", "Lay her down and plow her.");
	else addDisabledButton(0, "Fuck Her", "Fuck Her", "You need a cock shorter than 16 inches!");

	if (pc.hasVagina() || (pc.hasCock() && pc.shortestCockLength() <= 16)) addButton(1, "Eat Her Out", bigTiddyGothGFEatHerOut, undefined, "Eat Her Out", "Why not make a meal out of her?");
	else addDisabledButton(1, "Eat Her Out", "Eat Her Out", "You need a vagina, or a cock shorter than 16 inches!");

	if (pc.hasCock() && pc.shortestCockLength() <= 16)
	{
		if (flags["BIGTIDDYGOTHGF_CUNTFUCKED"] != undefined) addButton(2, "Ass Fuck", bigTiddyGothGFAssFuck, undefined, "Fuck Her Ass", "Bend her over and take her hard.");
		else addDisabledButton(2, "Ass Fuck", "Fuck Her Ass", "You must have fucked her cunt first!");
	}
	else addDisabledButton(2, "Ass Fuck", "Fuck Her Ass", "You need a cock shorter than 16 inches!");

	if (flags["BIGTIDDYGOTHGF_NECKHER"] != undefined) addButton(3, "Necklace", bigTiddyGothGFFuckNecklace, undefined, "The Necklace", "Let the Necklace have a turn... this could get weird!");
	else addDisabledButton( 3, "Necklace", "The Necklace", "You should probably talk to her about it first!")

	addButton(14, "Leave", bigTiddyGothGFSexLeave);
}

public function bigTiddyGothGFFuckHer():void
{
	clearOutput();
	bigTiddyGothGFBust(true);

	var cockIdx:int = pc.cockThatFits(16, "length");
	if(cockIdx < 0) cockIdx = pc.smallestCockIndex();

	output("The Servant bites her lip, clearly liking your choice. <i>“If that is what you wish...”</i> she turns to the table, reaching out and taking hold of the candles on top. <i>“Then so it shall be.”</i> She collects the candles and moves them away, placing them around the room in different locations, keeping the illumination of the room consistent.");
	
	output("\n\nSeeing where this is going, you pull yourself to your feet and begin to strip off your gear, setting your equipment and clothing aside in a neat pile. As you finish, you turn to see The Servant leaning against the edge of the table, giving you a devious smile. With a small grunt of effort, she hoists herself up onto the table into a seated position, crossing her legs in front of her and leaning back. <i>“Ready for me, lover?”</i>");
	
	output("\n\nYour twitching cock is all the answer she needs. The Servant giggles and uncrosses her legs slowly, exposing her terran twat to you briefly, before crossing her legs the other way. She bobs her foot in the air towards you, black polish on her tiny toes. <i>“Well then. Come claim what’s yours.”</i>");
	
	output("\n\nNot needing to be told twice, you move towards the pale woman, standing now within arm’s reach of her. Slowly, you place a hand on her pale knee. She’s cold to the touch, but you expect you’ll be able to warm her up well enough. Running your fingers along her leg, you cause the woman to let out a content sigh and bite her bottom lip once more. Carefully, you slide your hand between her crossed legs and coax them apart, The Servant not offering any resistance. Exposed again, you get a very close look at her delicious looking cunt. She’s already soaking wet, and being so close you catch a smell of her that makes your cock throb.");
	
	output("\n\nWordlessly, The Servant leans back on the table, laying down flat and spreading her pale legs wide. Her blue eyes twinkle in the candlelight, mesmerizing and drawing you in. You barely even realize you’re walking forward between her spread legs, moving more on instinct than thought. You only stop moving when the tip of your cock presses against something hot and fleshy, causing The Servant to let out a soft gasp. Snapping to attention, you realize your cockhead is touching the pale woman’s cunt, your crown pressing against her clit. You return your gaze back up to the woman’s face, her blue eyes now begging.");
	
	output("\n\nWith a small thrust of your hips, you oblige her.");
	
	output("\n\nYou let out a shuddering moan as you plunge into the woman’s cunt, the heat of her womanhood a stark contrast to her normal coldness.");
	if (flags["BIGTIDDYGOTHGF_CUNTFUCKED"] == undefined) output(" She’s tighter than you expected her to be, but you still seem to slide in fairly easy.");
	else output(" She’s almost as tight as you remember, but you do note her to be slightly more accommodating.");
	output(" Warm cuntflesh, slick and wet already, burns at your sensitive shaft as you slide in. The Servant moans as you bury your [pc.cockShape "+cockIdx+"] shaft deep inside of her, arching her back up off of the table. <i>“Fuuck...”</i> her normally sultry voice is higher than you’re used to, bordering on a shriek.");
	pc.cockChange();
	
	output("\n\nUnable to contain yourself any longer, you seize the woman’s legs and wrap your arms around her thick thighs, holding onto the small woman tightly. Not missing a beat, you start to buck your hips, thrusting your manhood deeper into the woman’s eager cunt with lustful enthusiasm. Grunting with effort, you give your all out of the gate, driving your [pc.cockNounSimple "+cockIdx+"] as deep and hard as you can with every buck of your [pc.hips]. The pressure on your rigid member is heavenly, and you feel her already wet pussy start to become a soaking mess. The heat in your loins starts to build and boil, your manhood starting to pulse wildly with depraved pleasure. Below you, The Servant cries out with a lusty moan with each primal thrust. Every time you plunge in, your hips connect with her soft, round ass, cushioning every forceful blow.");
	
	output("\n\n<i>“Please!”</i> The Servant cries out between her ear bursting moans. <i>“Please don’t stop! Just like that... don’t stop!”</i>");
	
	output("\n\nTry as you might, you don’t think you can. Your muscles are sore already, despite just starting to fuck her brains out. Whatever bright idea you had to start out full blast seems like it was a bad one. Each breath burns your lungs, and sweat starts to trail down your [pc.skinFurScales] freely. Deep in The Servant’s burning hot cunt your cock throbs and pulses, your manhood on the verge of melting. Straining, you dig deep to keep up your pace, gritting your teeth and clenching The Servant’s thighs so hard you suspect you’ll bruise the poor woman. Unexpectedly, The Servant presses her small feet against your shoulders, the dainty things almost as cold as she normally is. The sensation offers you some relief, but you still feel yourself starting to overheat.");
	
	output("\n\nEach thrust shakes the table, and if you weren’t holding her in place you suspect The Servant would have be pushed right over the far edge by the hard fucking. Panting, you look down at the her, watching the moaning woman as you hilt yourself over and over inside of her quivering cunt. Her back is arched again, half lifted up off the table, each slam making her fat tits bounce in unison. Up and down, up and down. You focus on them, watching her chest sinfully dance for you, her strange necklace bouncing with them. It almost takes your mind off how tired you’re feeling. Somehow, you feel yourself still keeping pace.");
	
	output("\n\nYou’re close. You feel your [pc.balls] ache");
	if (pc.balls == 1) output("s");
	output(", yearning for sweet release. Throwing your head back, you groan and use every last bit of your stamina to push yourself over the edge. Your [pc.cockNounSimple "+cockIdx+"] is on fire, pulsating and threatening to burst. The Servant’s eyes roll back, and you feel the pale woman clench every muscle in her tiny body. Shaking, the woman lets out a ragged gasp, her pussy quivering around your thick mast of cockflesh. With a cry of your own, you feel yourself tip over the edge.");
	
	output("\n\nA surge of bliss runs throughout your whole body and you plunge yourself deep into The Servant’s cunt as your cock explodes. Groaning and barely able to stand, your heavy [pc.balls] pump thick, hot spunk out, filling and spilling out of The Servant quivering hole. You double over, falling down on the small woman, your head coming to rest against");
	if (pc.tallness < 65) output(" her sweat covered belly");
	else if (pc.tallness < 80) output(" one of her soft breasts");
	else output(" her sweat stained shoulder");
	output(". Her chest heaving, the normally cold woman is burning now, breathing just as hard as you are. Down below, you feel yourself slip out from her filled and spent pussy, cum oozing out onto the table and down your legs. After the two of you catch your breath, The Servant whispers in your ear. <i>“Oh to be bred by you. Oh what a treat that would be.”</i>");
	
	output("\n\nA few minutes later, you’re back on your feet and collecting your gear. The Servant, still naked, is seated on the table with her legs crossed, watching you closely. <i>“Sorry to see you go. I’ll shower up and be presentable for your next visit. Promise.”</i> She gives you a mischievous smirk and bobs her foot at you. At her chest, you notice her necklace is shining a bit brighter than it was the last time you saw it.");
	
	output("\n\nChuckling to yourself, you make your way over to the door, bidding farewell to the playful woman.");

	processTime(20+rand(5));
	pc.orgasm();

	currentLocation = "RESIDENTIAL DECK 11";
	flags["BIGTIDDYGOTHGF_LOCKOUT"] = GetGameTimestamp() + 480;
	IncrementFlag("BIGTIDDYGOTHGF_SEX");
	IncrementFlag("BIGTIDDYGOTHGF_CUNTFUCKED");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bigTiddyGothGFEatHerOut():void
{
	clearOutput();
	bigTiddyGothGFBust(true);

	output("The Servant stares at you, her mouth agape. <i>“Oh...”</i> The Servant closes her mouth, pressing her lips together and slightly taken aback by your request. <i>“I didn’t expect that... well, whatever you want.”</i> The dark woman turns back towards the table and reaches out, taking hold of the candles on top. She collects and moves them away, placing them around the room in different locations, keeping the illumination of the room consistent. As she does so, she turns over her shoulder and looks at you. <i>“Even so. You should remove your equipment. Just in case.”</i>");
	
	output("\n\nUnable to disagree with her, you pull yourself to your feet and begin to strip off your gear, setting your equipment and clothing aside in a neat pile. As you finish, you turn to see The Servant leaning against the edge of the table, giving you a coy smile. With a small grunt of effort, she hoists herself up into a seated position, her pale legs wide open. <i>“Alright, lover. Dinner’s on the table,”</i> she giggles to herself, clearly amused by her own little joke.");
	
	output("\n\nEven from this distance you can tell she’s excited, her cunt already slick with juices. Moving in, you kneel down next to the table, coming face to face with her terran twat. The pale woman’s sex is giving off a heavenly aroma, one that makes the blood start to rush to your face. Leaning in close, you give her womanhood a small lick with your [pc.tongue].");
	
	output("\n\nFuck. She tastes as good as she smells, her cunt as sweet as any fruit you’ve ever sampled. You start by giving her folds some gentle licks, teasing her more than trying to accomplish anything. Above you, you hear the woman gasp at your tongue’s touch, and you feel her cold body seem to warm up in response. Taking things a step further, you shift your attention to her clit, giving it a few quick, teasing licks. The woman’s gasps turn into moans, and you feel her thighs shudder around your [pc.ears].");
	
	output("\n\nA rush of sweetness hits your tongue as her pussy starts to ooze more of its delicious nectar. The addictive taste makes your cheeks flush, you feel your own sex start to twitch down below as well. Before you can drop your hand to play with yourself, The Servant throws her still chilly legs around your shoulders, hooking one of them around your neck and locking you in place. Her deceptively powerful legs pull you tight against her now soaking wet womanhood, forcing your tongue to press harder against her twitching clit. <i>“Lick me. Lick my fucking naughty cunt.”</i>");
	
	output("\n\nYou don’t need to be told twice.");

	output("\n\nEagerly, you put your tongue into a spin, ravenously attacking her pussy and clit. The Servant moans like a bitch in heat, and around your shoulders you feel her legs clench, her muscles tight and twitching. More of her sweet juices soak your face, dripping down your chin from flowing so freely. Your blood is starting to boil now, and down below your [pc.crotch] yearns to be touched and played with. The Servant lets out a shuddering gasp, letting you know you’ve got her right where you want her. With her well in hand, you slowly slip your hand down to tend to yourself.");

	var cockIdx:int = (pc.hasCock() ? pc.cockThatFits(16, "length") : -1);

	if (cockIdx >= 0)
	{
		output("\n\nYou take a hold of yourself, your fingers wrapping around your engorged [pc.cockShape "+cockIdx+"] shaft. The taste of sweetness and your boiling blood has already made you rock hard, and you waste little time starting to rub your sensitive cockflesh with lust fueled enthusiam. Your meat is already red hot, and as you pump your wrist you feel it burn hotter. You’d moan in pleasure, if you weren’t being smothered by The Servant’s cunt, her heavenly girlcum oozing into your mouth. A few stray drops fall down onto your throbbing shaft, causing a warm sensation that makes your spine tingle. You speed up your pumping, and send your tongue into a whirl.");
	}
	else
	{
		output("\n\nYour fingers find themselves between your legs, parting aside the lips of your wet and ready snatch. The taste of sweetness and your boiling blood has already made yourself more than a little excited, and you waste little time starting to rub your engorged cuntflesh. Your pussy is already on fire, and as your fingers work away the heat only becomes more intense. You’d moan in pleasure, if you weren’t being smothered by The Servant’s cunt, her heavenly girlcum oozing into your mouth. You press your fingers harder against your clit, focusing your attention on your twitching pleasure button. Not being selfish, you also focus on hers as well and send your tongue into a whirl.");
	}

	output("\n\nThe Servant moans like a practiced whore, her legs so tight around your neck she might snap it. Despite this, you keep your tongue moving, working her cunt and clit over with porn star precision. A few long seconds later, The Servant’s moans stop, and in their place you hear a shuddering gasp, as a near silent scream escapes her mouth. On your tongue you feel her cunt convulse, The Servant’s orgasm rippling through her womanhood violently. More than slightly encouraged by her, you feel yourself start to tip over the edge, and you start moving your hand faster and faster. With a moaning gasp you feel yourself start to explode.");

	output("\n\n");
	if (cockIdx >= 0)
	{
		output("Thick, viscous cum surges from the crown of your [pc.cockShape] rod, shooting off freely and unseen.");
	}
	else
	{
		output("Slick and hot girlcum flows as your cunt quivers, firing off waves of pleasure that rock your every muscle.");
	}
	output(" As your orgasm rolls throughout your body, you feel The Servant’s legs loosen around your shoulders, causing you to suddenly lose your balance and fall backward.");

	output("\n\nFlat on the ground, you close your eyes and pant at heavy air, your burning sex pulsing at your crotch as the last traces of your orgasm fading away. Something warm and unexpected assaults you, attacking your spent");
	if (cockIdx >= 0) output(" cock");
	else output(" cunt");
	output(". Opening your eyes, you see The Servant on all fours, licking your twitching sex clean. The corners of her mouth curl into a devious smile, as her studded tongue laps away at your cum soaked crotch. Pulling away for a moment, she purrs to you in her rare bratty tone. <i>“Oh, honey. Did to expect me to go hungry?”</i> Her tongue slips back out of her mouth, returning to work.");

	output("\n\nHer mouth is agony. Your");
	if (cockIdx >= 0) output(" semi hard cock");
	else output(" over stimulated pussy");
	output(" can’t take this kind of attention, especially so soon after cumming. You feel your sex engorge once more, as her licking becomes more attentive and focused. Her appetite is ravenous, and you feel her push her face in further, taking you into her mouth.");
	if (cockIdx == -1) output(" The Servant eats your still recovering cunt, her metal studded tongue lapping over your engorged clit. Unsurprisingly, you feel your body start to tense and quiver once more.");
	else output(" The Servant sucks at your still recovering cock, drawing out every last drop of unspent cum left in it. Much to your surprise, you feel your [pc.balls] start to tighten once more.");
	output(" A second orgasm starts to rock you, your still sensitive");
	if (cockIdx >= 0) output(" cock");
	else output(" cunt");
	output(" exploding in The Servant’s waiting mouth. Gasping for air, you shudder and convulse on the ground, your orgasm feeding the ravenous woman.");

	output("\n\nQuivering on the ground, you feel The Servant licking you clean once more, albeit she isn’t trying to get number three out of you. Struggling to catch your breath after two powerful orgasms, you look down at the pale woman once more, noticing she hasn’t taken her blue eyes off you. While still licking your sex, shoots you a wink, curving the edges of her lips once into another smile. Purring to you between her licks, she speaks in the bratty tone again. <i>“Oh. Did I overdo it? Sorry, I’m just so selfish.”</i>");

	output("\n\nA few minutes later, you’re back on your [pc.footOrFeet] and collecting your gear. The Servant, still naked, is seated on the table legs crossed, watching you closely. <i>“Hm, that was something else. Maybe I’ll try taking something to make your next meal more... interesting.”</i> She gives you a mischievous smirk and bobs her foot at you. At her chest, you notice her necklace is shining a bit brighter than it was the last time you saw it.");

	output("\n\nChuckling to yourself, you make your way over to the door, bidding farewell to the playful woman.");

	processTime(20+rand(5));
	pc.orgasm();

	currentLocation = "RESIDENTIAL DECK 11";
	flags["BIGTIDDYGOTHGF_LOCKOUT"] = GetGameTimestamp() + 480;
	IncrementFlag("BIGTIDDYGOTHGF_ATECUNT");
	IncrementFlag("BIGTIDDYGOTHGF_SEX");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bigTiddyGothGFAssFuck():void
{
	clearOutput();
	bigTiddyGothGFBust(true);


	var cockIdx:int = pc.cockThatFits(16, "length");
	if(cockIdx < 0) cockIdx = pc.smallestCockIndex();

	output("The Servant’s eyes go wide in disbelief, the pale woman almost seeming to lose her balance and fall over. <i>“Oh wow... um, of course... anything you want.”</i> The dark woman turns back towards the table and reaches out, taking hold of the candles on top, her hands shaking. She collects and moves them away, placing them around the room in different locations, keeping the illumination of the room consistent. As she does, she glances over her shoulder, tossing you nervous glances.");
	
	output("\n\nPulling yourself to your feet, you begin to strip off your gear, setting your equipment and clothing aside. Eyeballing The Servant, you notice her rummaging around, searching for something on her cluttered bookshelf. Finishing up, you turn and face the small woman properly, see her now leaning against the table with a small bottle in her hand. Waving it in the air, you vaguely can see it’s a bottle of lube she’s holding. <i>“I insist.”</i>");
	
	output("\n\nShe tosses you the bottle, which you snatch from the air with little effort and examine. While you read it over, she speaks candidly to you. <i>“I’m not in the habit of sticking things in my ass. So without it I may break, and that wouldn’t be fun for any of us.”</i> Fair enough request, you guess.");

	output("\n\nLooking up from the bottle, you’re met with the sight of The Servant’s round white ass, her feet planted on the floor, and the rest of her stretched out on the table. You note her fat tits are pressing hard against the surface, squashed flat under her weight, while her round rump is lifted high in the air. The dark woman gives her rear end a wiggle, her cheeks jiggling enticingly. <i>“Come on now, lover. Don’t leave a girl waiting.”</i> Her tone, you note, is more sassy than nervous now. Whatever apprehensions she had seems to have melted away.");
	
	output("\n\nWith a smile, you pop open the bottle, squirting a generous portion into your hand, then start to rub the viscous fluid onto your already rising manhood. It tingles against your senstive cockflesh, encouraging your cock to harden even faster. You might have to buy more of this stuff later...");
	
	output("\n\nLining yourself up with the pale young lady’s rear, your gaze is drawn in once more to the enthralling tattoo on her back. The black mass, teeth and lightning, maw and tentacles. Your mind starts to wander, and your eyes begin to sting. The mass seems to move before you, like the center spiral of a storm. You barely feel the bottle of lube fall from your hand, and the sound of it hitting the ground echos and rings in your ears as if it happened in slow motion.");
	
	output("\n\nThe storm is drawing you in. In the distance you hear The Servant say something, but her words are miles away. All there is now is the storm.");
	
	output("\n\nWith a start, you come to, your mind returning to the confines of your brain. How long were you out of it? The annoyed voice of The Servant halts the thought. <i>“Are you gonna just press it against my ass all day, or are you gonna fuck me?”</i> Looking down, you realize that the crown of your cockhead is indeed pressing firmly against The Servant’s pucker, on the verge of pushing in, but not quite. The Servant lets out a deep sigh, raising her voice. <i>“Well?”</i>");
	
	output("\n\nYou feel your manhood pulse. As far as you can tell, during your daydream your [pc.cockShape "+cockIdx+"] member only grew harder and more eager to invade the young woman. Slick with lube, it pulses again, the crown of your cock flared and ready to be buried deep into The Servant’s waiting ass. You lift your hands, grabbing ahold of The Servant’s wide and pale hips, your fingers feeling at home against her flesh. Unsurprisingly, her skin is as cold as usual, but you feel her quiver as you grip her tight, enjoying your touch. She glances over her shoulder and looks at you, her bright blue eyes silently begging you.");
	
	output("\n\nShe wants you to fuck her. Slowly, you move your hips forward, pushing your flared crown against the pale woman’s tight pucker.");
	
	output("\n\nAs you start to breach her behind, The Servant lets out a pained gasp, the woman grabbing the table for support, her knuckles quickly turning white. A gasp of your own escapes your lips also when your cockhead pushes inside of her. The Servant’s ass is tight, maybe even <i>too</i> tight. If it wasn’t for the lube coating your cock, you don’t think you’d have fit in at all. Not disheartened, you keep sliding your thick meat in, finding it easier now that she’s been breached. The Servant’s gasps don’t stop, and you feel her wiggle and shift below, struggling against you. Holding fast to her womanly hips, you try to keep her from accidentally popping your cock right out of her pucker.");

	output("\n\n<i>“I’m sorry.”</i> She turns her head and looks back at you.");
	if (flags["BIGTIDDYGOTHGF_ASSFUCKED"] == undefined) output(" <i>“It’s been a very long time since I’ve... I just need a moment to adjust.”</i>");
	else output(" <i>“I just need a moment. I don’t think I’ll ever get used to this.”</i>");

	output("\n\nYou stop sliding in, keeping the tip of your cock planted in the young woman’s ass. You feel her pucker tighten around your girthy [pc.cockShape "+cockIdx+"] shaft, drawing out a low and throaty moan from your chest. The Servant starts to move her hips slowly, wiggling her ass and seemingly accepting the presence of your thick meat in her bum. After a minute or two, you feel her loosen up, and the pale woman glances back over to you. <i>“I’m ready. Please continue.”</i>");

	output("\n\nFighting the urge to smile, you adjust your stance and move your hips forward. Her ass is still tight, but you can definitely feel the difference.");

	output("\n\nInch by inch you slide in, your lube slick cock easing into her now welcoming anus. You shudder with pleasure, the heavenly tightness of her deep ass compressing your cock with blissful force. For her part, The Servant is still gasping, but she seems far more relaxed now, and her cries seem to be from a place of pleasure rather than pain. Feeling you’ve probed deep enough, you pull back on your hips, drawing yourself out slightly, then push back in with a bit more force and speed. Repeating the process a few times, you settle into a slow and steady rhythm, starting out with an easy pace for the ass shy girl. Everytime you push in, you feel The Servant clench down, embracing your invading meat in a tight squeeze. Groaning, you feel your cock pulse, hungry for more.");

	output("\n\nNot wanting to wait, you start to increase your pace, the sounds of your hips smacking against The Servant’s ass now audible in the room. With every thrust, your cock ends up deeper into the woman’s ass, pushing the limits of how far you can go. The dark woman moans and shudders, her hole clenching against your thick, invading meat. Each breath you take starts to become labored, with the first signs of sweat starting to form on your brow. Adjusting your grip on The Servant’s hips, you begin to hammer yourself inside of her, pounding her pale ass with considerable force. With every thrust The Servant moans, a high pitched cry of pleasure ringing out in the air. Despite her earlier reservations, she’s a total ass slut after all.");

	output("\n\nGasping for air, you keep slamming away, burying your meat deep into the woman’s sinful pucker. Despite loosening up enough to allow for your primal pace, The Servant’s hole is still exquisitely tight, and you feel yourself burning a fair amount of energy keeping up your pace. Sweat is now trailing down your [pc.skinFurScales], every inch of your body on fire. Deep inside the woman’s ass, you feel your cock on the verge of melting, your manhood pulsing wildly. The Servant’s legs buckle below you, and if it wasn’t for the table and your grasp, she’d long been on floor in a heap. Moaning like a banshee you see her looking back at you, her eyes half rolled back into her skull and her metal pierced tongue half falling from her mouth. She’s drowning in ecstasy now, lost to the world.");

	output("\n\nYour own legs start to strain, and you feel your back begin to grow tight. Physically, you can’t keep this up. Your pace has become vicious, every thrust of your virile cock pounding hard against the lost-to-lust woman’s ass. You’re close, seconds away, but each thrust is taking more and more out of you, and you’re not sure you’re going to make it.");

	output("\n\nA sudden tightness takes you by surprise, a vice like clamp on your cockflesh that all but halts your pace and forces a powerful moan from you. The Servant, consciously or not, tightened her whole body, catching and compressing your throbbing meat deep inside of her hole, hugging it with all the force she can muster. You can’t help but shudder as your vision blurs.");

	output("\n\nYour orgasm is intense, the first spurt of your seed feeling like the full contents of your [pc.balls] is being expelled. As more and more thick spunk erupts from your [pc.cockHead "+cockIdx+"], you feel your legs buckle and you double over onto the small woman below. Your sweaty chest presses against her inked back, her chilled flesh feeling refreshing against your burning [pc.skinFurScales]. You pump her with your seed, your cum filling her up to the brim, and you feel it against your still deeply buried manhood. By the time your cock stops spurting, a wave of exhaustion rolls through you. At the same time, the vice like tightness of The Servant’s ass breaks, and you feel your spent manhood slide out, along with a fair amount of your [pc.cumColor] jizz, which spills onto the floor.");

	output("\n\nA few minutes later, you’re back on your feet and collecting your gear. The Servant, still naked, is standing next to the table, leaning against it for support. You’d expect her to be sitting like normal, but you get the impression she isn’t going to be sitting for the rest of the evening at least. <i>“Damn, half your load is on the floor, and the other half is saying hello to my breakfast.”</i> She rubs her lower tummy, frowning slightly. <i>“It’s still warm...”</i> she frets aloud. At her chest, you notice her necklace is shining a bit brighter than it was the last time you saw it.");

	output("\n\nChuckling to yourself, you make your way over to the door, bidding farewell to the playful woman.");

	processTime(20+rand(5));
	pc.orgasm();

	currentLocation = "RESIDENTIAL DECK 11";
	flags["BIGTIDDYGOTHGF_LOCKOUT"] = GetGameTimestamp() + 480;
	IncrementFlag("BIGTIDDYGOTHGF_SEX");
	IncrementFlag("BIGTIDDYGOTHGF_ASSFUCKED");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bigTiddyGothGFFuckNecklace():void
{
	clearOutput();
	bigTiddyGothGFBust(true);

	output("The Servant’s stares at you a moment, her expression deadpan. <i>“I beg your pardon... but do you know what you’re asking?”</i> Her blue eyes seem to twitch, and you notice her quivering.");
	
	output("\n\nYou look at the necklace hanging from her throat. It’s psionic, and you’ve felt first hand what it can do. You can’t help shake the feeling if you were to let it loose, something very interesting might happen.");
	
	output("\n\nThe Servant face cracks into a chaotic smile. <i>“Very well then. So, which of us should wear it?”</i> She giggles under her breath. <i>“I promise you, both options are very enlightening.”</i>");
	
	output("\n\nYou look at the necklace once more, thinking it over...");

	processTime(3);

	clearMenu();
	if (pc.hasCock() || pc.hasVagina()) addButton(0, "You Wear", bigTiddyGothGFSexNecklaceYou, undefined, "You Wear It", "Use the power on yourself.");
	else addDisabledButton(0, "You Wear", "You Wear It", "You need a vagina, or a cock shorter than 16 inches!");

	if ((pc.hasCock() && pc.shortestCockLength() <= 16) || pc.hasVagina()) addButton(1, "She Wears", bigTiddyGothGFSexNecklaceHer, undefined, "She Wears It", "Let her use the power.");
	else addDisabledButton(0, "She Wears", "She Wears It", "You need a vagina, or a cock shorter than 16 inches!");

	addButton(14, "Leave", bigTiddyGothGFSexLeave);
}

public function bigTiddyGothGFSexNecklaceYou():void
{
	clearOutput();
	bigTiddyGothGFBust();
	showBust("SERVANT_NOCRYSTAL_NUDE");

	var cockIdx:int = (pc.hasCock() ? pc.cockThatFits(16, "length") : -1);

	output("You tell The Servant you want to wear it.");
	
	output("\n\nShe seems to shudder at your words, her thighs clenching together. <i>“Very well.”</i>");
	
	output("\n\nThe dark woman stalks towards you, closing the distance slowly. Reaching to the back of her neck, she takes ahold of the simple string and lifts it over her head. Coming to a stop before you, she reaches out, offering the bauble to you. You can’t help but notice her hand is shaking.");
	
	output("\n\nSlowly, you reach out, and take hold of the simple necklace.");
	
	output("\n\nInstantly, you feel a wave of heat the moment you touch it, sending a powerful shiver running up your spine that almost makes you cross your eyes. Gasping, you nearly drop the necklace while trying to compose yourself. Is this what The Servant feels all the time? Your hands moving on their own, they pull it on over your head, the curious trinket coming to rest against your [pc.chest].");
	
	output("\n\nThe room seems louder all of a sudden, a nagging whisper in your ear. You can’t make out its words, but the sound of it makes your brain feel soft. Is this the voice she hears?");
	
	output("\n\nThe Servant chuckles, seeming to enjoy watching you squirm. <i>“Ready?”</i>");
	
	output("\n\nYou nod.");
	
	output("\n\nThe small woman raises her hand, pressing her ringed fingers against the red stone. She lets out a shuddering moan, as if the simple act of touching it was enough to make her cum. Quivering, her eyes closing tight, she savors the pleasure of the moment. You start to move to grab her, to stop her from falling over, but a pulse of warmth at your throat stops you. The Servant speaks.");
	
	output("\n\n<i>“Nafl’fhtagn ya uh’eog. Nafl’fhtagn ng mggoka ya.”</i>");

	output("\n\nSomething breaks.");

	output("\n\nThe necklace sears into you, not physically, but mentally. Your mind rushes away, as if sucked into the very back of your skull, being compressed and contorted by psionic energies rushing into your head. A thousand emotions and sensations fire through your body, every nerve going berserk and dancing. You try to scream but nothing escapes your lips. You feel your crotch burn,");
	if (cockIdx == -1) output(" your cunt oozing girlcum down your legs");
	else output(" cum spurting out of your cockhead");
	output(". You didn’t even realize you orgasmed, so mixed up are your senses. Every one of your muscles twists and tightens, threatening to break. Then, your back explodes. No, not explodes. Opens. Something has erupted from your back. Many somethings. Your body jerks and twists, and your vision goes black.");

	output("\n\nFor what feels like an eternity, you see nothing, you sense nothing.");
	
	output("\n\nThen suddenly your vision returns. You feel calm.");
	
	output("\n\nYou are not yourself anymore. Not really. You stare down at your hand. It’s your hand, but different.");
	
	output("\n\n<b>Let us take her.</b>");

	output("\n\nYou lift your eyes up to regard the woman across from you. Her eyes are wide, stricken with shock. She looks half mad, quivering and shaking before you, unable to move. Fear makes her legs give out, and she falls to her knees. Her blue eyes look up at you, wide in terror and awe. <i>“M-Master?”</i>");

	output("\n\nStepping towards her, your footfalls feel heavier than you remember. You reach out for her, but not with your hands. Four powerful appendages, tendrils as thick as your arm, lash out towards the small woman. She lets out a cry as they seize her, wrapping around her arms and legs and lifting her up violently. You feel her quiver in your grasp. She’s scared. You taste it on the air. But you also taste... desire. <i>“Master! Please!”</i>");

	output("\n\nShe wants this.");

	output("\n\n<b>We want this.</b>");
	
	output("\n\nYou pull her close, inches from your face. Her eyes are wide, unblinking, staring back into yours. Whatever she’s looking into, she can’t seem to look away. You lift your hand and cup her chin, running your thumb over her painted lips. Understanding, she opens her mouth for you, releasing a soft sigh. Her eyes flutter, her fear being contested by her insatiable lust. You open your maw, and let out the thing that was your tongue.");
	
	output("\n\nIt moves on its own, snaking through the air and into the small woman’s open mouth. She cries out as it enters her and plunges down into her warm throat. The muscle has become long and thick, similar to the tendrils on your back, but thinner and fair more sensitive. To an on looker, it would almost resemble a cock, but longer and far more flexible. You fuck her mouth with your tongue-cock, thrusting it in and out of her wide open throat. She gags on it, but doesn’t fight, accepting it and taking it like the obedient slut she is. Her legs quiver in your grasp, warm juices oozing down her leg.");
	
	output("\n\n<b>Such lust.</b>");

	output("\n\nTwo more tendrils seize the woman, attacking her chest and wrapping around her delicious looking tits. They squeeze her tight, causing the small woman to writhe and kick the air. Despite her protest, her metal-studded nipples stiffen, and with the tips of your tendrils you poke and tease them mercilessly. Her face flushes before you, and down below you feel her cunt ooze more of her womanly juices. Through her nose, she breathes rapidly, hot air blowing in your face everytime she exhales. Down below at your crotch you feel something stir. You lower your gaze to regard yourself.");
	
	output("\n\nYou’ve changed down there as well.");
	if (pc.cocks.length == 1 && !pc.hasACockFlag(GLOBAL.FLAG_PREHENSILE))
	{
		output(" Your dick has morphed. Changed. While still clearly a cock, but it’s long and flexible, prehensile now, like the tendrils on your back.");
	}
	else if (pc.cocks.length == 1 && pc.hasACockFlag(GLOBAL.FLAG_PREHENSILE))
	{
		output(" Your dick has morphed. Changed. While still long and flexible, it has become different now. Other. Not unlike the tendrils on your back.");
	}
	else if (pc.cocks.length > 1)
	{
		output(" Your dicks have morphed. Changed. Your cocks have fused together, becoming something other. Together they are not long and flexible, prehensile, like the tendrils on your back");
	}
	else
	{
		if (pc.totalClits() > 1) output(" One of your clits");
		else output(" Your clit");
		output(" has morphed. Changed. It’s more akin to a cock now, but it’s long and flexible, prehensile now, like the tendrils on your back.");
	}
	output(" It reaches down to the ground, the head of your tentacle cock crowned with barbs. Like controlling an arm, you tense and lift it up, feeling it pulsate with raw sexual power. The woman seems to notice it now, and you feel her twist and jerk in your grasp. The way she’s moving, you realize, isn’t in an attempt to fight you. She’s trying to spread her legs for you more, begging you to breed her.");

	output("\n\nYou pull her legs open wide, exposing her dripping wet cunt for you. Your cock moves on its own striking right for her womanhood and plunging in. She cries out, even while being choked by your tongue-cock. As you snake inside of her, she moans like a bitch in heat, her whole body convulsing in your grasp. You’re more than certain you made her cum just from that, but this isn’t about her. Your thick monster cock starts to move around, thrusting in and out of her burning cunt on its own. Its barbed head never leaves her pussy, causing the poor woman a torturous amount of depraved bliss that makes her eyes rolls back. For your own part, it feels amazing.");

	output("\n\nYour flesh is weak. It tingles and burns with excitement as you fuck her mouth and cunt. You tongue shudders in her throat, and you realize it may be further along than you hoped. You ease up, not allowing yourself too much pleasure too soon. The woman coughs as you pull back slightly. Your tendrils around her chest feel her breathing easier, while still teasing and squeezing her prodigious chest. Down below you feel your monster dick bury itself deeper into the woman, stretching her mortal cunt to its limits. It too shall finish soon if you don’t let up, but you’ve still one more move.");

	output("\n\n<b>Give her want she wants</b>");
	
	output("\n\nYou force yourself to change more, drawing deep from your well of power. A second snake cock starts to grow from the base of the first, falling to the floor with a loud thud. It’s already slick and wet, coated in sex fluids, seemingly having burst forth from wherever you keep your seed. It fattens up to the size of the first, lifting off the ground and taking aim. It strikes as quickly as the first, but at a different target.");
	
	output("\n\nThe woman jerks in your grasp as the tendril-cock penetrates her, its barbed head invading her expecting ass. You hear her groan and feel her shudder as your second dick works its way inside of her, slick and lubed already with your dark juices. You feel the woman cum a second time, the whole of her body tensing up, her eyes rolling back to the whites. She goes limp in your grasp a moment later. Conscious, but barely, her eyes shifting back into focus. You need to finish quick if you don’t want to break her. Mortal minds are not built for the pleasure <i>we</i> offer.");

	output("\n\nYou push for it, fucking all three of her holes with all you have. The woman tenses up once more, gagging on your tongue cock trying to scream out in ecstasy. Her cunt is tight and quivers around your first mighty cock, her stuffed ass compressing against the other. The pleasure of it is overwhelming now. If you were what you were, you’d have long since cum a dozen times over. But your will is different now. Still, your flesh is weak, and you feel all three of your tendrils start to quiver. The tendrils holding her aloft tighten, jealous of their brothers who get to feast on the pleasures of the woman. The two at her chest continue to play with and tease the poor young woman’s nipples, the very tips of them leaking some fluids onto her pale skin.");
	
	output("\n\nIt’s time. You bury deep into all three of the slut’s holes, pushing the poor woman over into a third orgasm. All three of your cocks erupt simultaneously.");
	
	output("\n\nBliss, the gift of the flesh, overtakes you. Powerful pleasure, beyond any you’ve known drowns you, igniting every nerve at once and making your whole body lock up and shudder. Your mind expands, slipping out into the mortal plane and letting that bliss escape. For a half mile around, every mortal mind gets a brief chill up their spines, sharing in but a fraction of your boundless bliss. Here, in the room, all three of your monster pricks explode, filling the mortal woman before you with your seed. You pump her stomach, womb, and ass full of your burning cum, watching the woman twitch in your grasp as she gratefully accepts your gift. Your other tendrils also cum, but far less. Sticky [pc.cumColor] fluid coats her tits, oozing down her body, marking her as yours. At the corners of your mouth, you feel yourself start to grin. You’re going to have so much fu-");
	
	output("\n\nSomething broken, is broken no more.");
	
	output("\n\nYou twist and jerk, all of your tendrils going limp, dropping your cum dumpster onto the floor in a heap. You look at your hand and see it’s changing. All of your tendrils melt away, turning into a dark cum like liquid. Your mind twists and condenses, flooding back to the place it was. You crotch retracts and returns to normal, as does your tongue. You feel your back snap, your spine locking into place. Your eyes flutter, your mind half ruined. You fall.");
	
	output("\n\nAll is black.");

	processTime(1440);
	pc.orgasm();
	pc.applyCumSoaked();
	IncrementFlag("BIGTIDDYGOTHGF_SEX");

	pc.taint(5);
	pc.libido(2);

	clearMenu();
	addButton(0, "Next", bigTiddyGothGFSexNecklaceOutro);
}

public function bigTiddyGothGFSexNecklaceHer():void
{
	clearOutput();
	bigTiddyGothGFBust();
	showBust("SERVANT_MASTER");

	output("You tell The Servant you want her to wear it.");
	
	output("\n\nShe smiles, biting her lip slightly. <i>“Very well.”</i> The shadowed woman stalks towards you, closing the distance slowly. Reaching out her hand, her fingers stop inches from your chest. She’s breathing hard, her chest heaving up and down, the necklace gleaming.");
	
	output("\n\n<i>“I promise we’ll be gentle.”</i>");
	
	output("\n\nShe takes a step away from you, blue eyes still locked on you. Slowly, she lifts her hand to her throat, her eyes rolling back in her head. She speaks.");
	
	output("\n\n<i>“Nafl’fhtagn ya uh’eog. Nafl’fhtagn ng ahuaaah ya.”</i>");
	
	output("\n\nThe necklace shines, a red light overtaking the room. It burns your eyes to look at, forcing you to shield them and turn away. You feel the light against your face, and something in the back of your mind shifts, like a gear falling into place.");
	
	output("\n\nYou realize you may have made a bad choice.");
	
	output("\n\nThe intense heat of the light subsides, and slowly, you open your eyes. You see The Servant standing in front of your, her head tilted towards the ceiling and her expression blank. Looking around, you see all the candles in the room are now extinguished. In the shadows behind the pale woman, you see something moving...");

	output("\n\nHer gaze lowers and fixes on you. Her eyes shining red.");
	
	output("\n\nSomething snaps in the back of your mind. You’re afraid, and also... hot. For some reason you can’t quite understand, you feel your body temperature rise, a depraved moan escaping your lips. The red eyes looking at your from the shadows burn with psionic energy. It’s affecting you, driving your lidibo wild. Too wild. You feel your mind start to break as you slowly lose yourself to the euphoric lust. You can’t be sure, but you think you just came, your sex twitching and pulsing uncontrollably. Quivering, you prepare yourself for something. Anything.");

	output("\n\nShe steps out of the shadows.");
	
	output("\n\nThe Servant stands before you, changing. Twisting. Whatever she is now, she isn’t herself. You try to scream, backing away from the monstrous woman, but only an orgasmic cry escapes your lips. Four tendrils fire at you, too close to dodge, and your mind too far gone to care. They hoist you up, wrapping around your arms and legs with more power than their width would suggest. As you fight and struggle against her grasp, she pulls you closer. Another lusty moan escapes your lips, another failed attempt to scream. All of your senses are backwards. The more afraid you are, the deeper you drown in the sea of bliss. Her face is not her own anymore, twisting into something... else. Her eyes shining red. She reaches out.");

	output("\n\nMadness consumes you.");
	
	output("\n\nA finger touches your forehead, and the sea evaporates. All of your fear, all of your terror, destroyed and consumed. It’s just... gone. All that’s left is the bliss.");
	
	output("\n\nYou look at the woman-shaped thing before you. Her face is her own once more. Beautiful, kind, smiling. You feel the black tendrils holding you aloft, cradling you and lovingly supporting your weight. The otherworldly woman tilts her head, her eyes still gleaming red. She runs her hand along your cheek, her touch making you quiver. But not from fear. Her touch is delicate and soft, and you let out a shuddering moan as she strokes you lovingly. Her pale skin seems gray now, all the color gone but for the red of her eyes. She leans forward, her thick painted lips moving towards your own.");
	
	output("\n\nHer kiss destroys you. You feel everything you are fade away, consumed by her pillowy soft lips. Your mind turns to butter and melts from the warmth of her love. She parts her lips and lets her tongue slip into your mouth, slowly dancing and teasing your own. You feel her metal stud rolling around against your tongue, a playful feeling that makes you moan with pleasure. Her hands run over your body, her delicate fingers tracing their way up and down your front. Something else moves in and starts to caress you as well, tracing around the small of your back. The last two of her tendrils, you vaguely realize. Their teasing touch makes you quiver, every nerve in your body on edge. Down below you hear something moving.");
	
	output("\n\nYour gaze falls to her crotch, where her cunt seems to twitch. Slowly, a black mass slides out from her womanhood, a tendril not that unlike the ones from her back. You should be scared, but the kiss of the woman-shaped thing drowns and eats your fears before they form, leaving only incredible excitement. You lose yourself in those soft lips, falling into a world of euphoria.");
	
	output("\n\nAbsently, you watch the new tendril stir and move, lifting up and moving towards your groin. The head of the tendril is different from the others, capped by a head that resembles the tip of a cock, crowned with soft looking barbs. The cock-like tendril snakes up to meet you, dripping wet with what looks like cum.");

	var cockIdx:int = (pc.hasCock() ? pc.cockThatFits(16, "volume") : -1);

	if (cockIdx >= 0 && !pc.hasVagina())
	{
		output("\n\nThe head of the tendril quivers and shakes, fattening up before your eyes. A small slit opens, widening to near the length of the spiked head. Slowly, the head presses against the tip of your cock, pushing your member into the newly formed slit. You gasp, your cock being engulfed by a world of strange pleasure. Inside of the tendril is warm and gooey, soothing your sensitive cockflesh and making it tingle. A few seconds later you feel a sucking sensation, almost as if the tendril is fellating you. You can’t decide if it feel more like a cunt or a mouth, somehow a strange and alien mix of both.");
	}
	else if (cockIdx >= 0 && pc.hasVagina())
	{
		output("\n\nThe head of the tendril quivers and shakes, fattening up before your eyes. Suddenly, the tendril splits into two, one heading towards your cock, and the other towards your cunt. One of the tendrils continues to fatten, a small slit opening along its crown, widening to near the length of the head. Slowly, the head presses against the tip of your cock, pushing your member into the newly formed slit. You gasp, your cock being engulfed by a world of strange pleasure. Inside of the tendril is warm and gooey, soothing your sensitive cockflesh and making it tingle. A few seconds later you feel a sucking sensation, almost as if the tendril is fellating you. You can’t decide if it feel more like a cunt or a mouth, somehow a strange and alien mix of both.");

		output("\n\nThe other tendril comes to meet your waiting pussy, its barbed head pressing against you. You gasp as it wiggles its way inside of you, working its way deep into your quivering twat. You writhe in the thing’s grasp, but her lips, those sinful lips, melt away your will to fight. The barbs poke and tease your insides, and the head of the tendril-cock seems to pulsate and throb. Slowly, it starts to wiggle and move, a slow and deliberate motion meant to tease and please your eager cunt.");

		pc.cuntChange(0, 24);
	}
	else if (cockIdx == -1 && pc.hasVagina())
	{
		output("\n\nThe tendril comes to meet your pussy, its barbed head pressing against you. You gasp as it wiggles its way inside of you, working its way deep into your quivering twat. You writhe in the things’s grasp, but her lips, those sinful lips, melt away your will to fight. The barbs poke and tease your insides, and the head of the tendril-cock seems to pulsate and throb. Slowly, it starts to wiggle and move, a slow and deliberate motion meant to tease and please your eager cunt.");

		pc.cuntChange(0, 24);
	}

	output("\n\nYour eyes flutter, your vision blurring. The pleasure is overwhelming, and you feel yourself already close to cumming again. The two tendrils on your back trail down to your [pc.ass], each rubbing a cheek delicately and deliberately. You barely notice them part your cheeks, so lost in the euphoria of it you are. What you do notice is an as-of-yet unseen tendril prod against your backdoor. You eyes open wide with shock, and you try to turn to see what’s going on. The dark creature cups your chin, caressing your face while deepening her kiss, her tongue moving further into your mouth. Those soft lips... you feel yourself turn to jelly once more, your mind blurring, leaving only impossible pleasure. You feel the tendril push in, and you almost cum instantly.");
	pc.buttChange(24);

	output("\n\nIt snakes into your ass quickly, your loose and relaxed body offering no resistance. It slides in deep, and you release a shuddering moan into the throat of your dark lover. The barbed cockhead pulses in your ass, stretching you out before it starts to wiggle and move, fucking you like no other cock can.");
	if (cockIdx >= 0) output(" Your cock twitches, the sucking sensation becoming too much to bear. You feel the tendril tighten around your manhood, squeezing and compressing it torturously.");
	if (pc.hasVagina()) output(" You pussy burns, alive with sensation as it’s fucked by the cock-like appendage. It’s powerful. Too powerful. You feel more like you’re being fisted rather than fucked by a dick. Not that you’re complaining.");
	output(" Quivering and shaking, you feel your lover’s tongue slip down your throat, gagging you.");

	output("\n\nYou don’t care. You want it.");

	output("\n\nEvery muscle in your body is alive, tingling with sinful ecstasy. The embrace of the pale shape is beyond any pleasure this world has to offer, and you willingly let yourself drown in it. You feel all tendrils, slick and powerful, fucking and loving you. Caring for you. Warm fluids start to leak from them, something akin to precum you imagine.");
	if (cockIdx >= 0) output(" Your cock throbs wildly, on the brink of exploding.");
	if (pc.hasVagina()) output(" The monster cock between your legs continues to fuck you, bringing you right to the edge.");
	output(" Deep in your ass, you feel the pulsating monster start to throb uncontrollably, getting ready to burst. A shiver runs up your spine, and your eyes rolls back as you finally succumb.");

	output("\n\nYou feel them explode inside of you, in your ass");
	if (pc.hasVagina()) output(", cunt,");
	output(" and throat. Hot cum, thicker than any you’ve ever felt, fills your waiting holes, pumping you full of precious seed.");
	if (cockIdx >= 0) output(" Your cock explodes as well, firing off a load of your own as your [pc.balls] churn. The hungry tendril at your crotch sucks every last drop up and away, draining you dry.");
	if (pc.hasVagina()) output(" Your cunt quivers a convulses, oozing out wetness of its own. The appendage in your cunt wiggles around still, prolonging your orgasm, and making you squirm from unbridled pleasure.");
	output(" Deep in your ass the tendril keeps pulsating, more and more of its cum filling you, oozing into every crevice of your anus.");

	output("\n\nYou feel the woman pull her tongue from your mouth, the appendage longer than you remember and dripping with cum. You cough and gag, not having realized how deprived of air you really were. You vision starts to focus for the first time in many minutes, and you look back at the smiling face before you. Impossibly beautiful, her red eyes shine brightly and she tilts her head once more. Is this truly her face?");
	
	output("\n\nHow can one person be so... Perfect. Cum oozes out from your stretched out asshole, and much more of it still fills your stomach");
	if (pc.hasVagina()) output(" and cunt");
	output(".");
	if (cockIdx >= 0) output(" She even drained you dry of very last drop of cum you have. You’ve never felt so drained. So empty.");
	output(" What did she do to you? The woman lifts her hand to your lips and places a single finger over them, shushing you. She smiles. And speaks.");

	output("\n\n<b>Sleep</b>");

	output("\n\nExhaustion. Impossible exhaustion. How can one person be this tired and not asleep? You feel her tendrils leave you, easing out from inside of you while the dark creature lowers you down to the ground, like a mother putting a babe to bed. You look up at your lover one last time as your eyes close, her cumsoaked tentacles wirthing in the air. Her face, her impossible face, is smiling down at you.");

	processTime(1440);
	pc.orgasm();
	pc.applyCumSoaked();
	IncrementFlag("BIGTIDDYGOTHGF_SEX");

	pc.taint(5);
	pc.libido(2);

	clearMenu();
	addButton(0, "Next", bigTiddyGothGFSexNecklaceOutro);
}

public function bigTiddyGothGFSexNecklaceOutro():void
{
	clearOutput();
	bigTiddyGothGFBust(true);

	output("You awaken.");
	
	output("\n\nYour eyes are heavy, and your skull throbs. You’re laying flat on your back in a dimly lit room. The Servant’s room, you realize.");
	
	output("\n\nOnly lamplight illuminates the grim chamber, the candles around the room long since extinguished. You start to move, but feel something heavy on your chest. Turning your head, you see The Servant nestled up in the crook of your arm, sleeping contently with her arms around you, her leg up on your hip. She’s smiling, her makeup mostly intact, but smeared around her lips.");
	
	output("\n\nA smell catches your attention: the whole room reeks of cum. You realized the majority of it is coated all over the two of you. It’s long since dried, and cracks as you slowly start to move. Looking around the room, you spot something next to your head. The red stone necklace.");
	
	output("\n\n<i>“Morning.”</i> You turn to see The Servant next to you, her blue eyes open. <i>“Or is it evening? I’m not sure.”</i>");

	output("\n\n<i>“What...”</i> You pull yourself to a seated position, The Servant holding onto your arm still, burying it between her breasts. <i>“What happened?”</i>");
	
	output("\n\nThe Servant giggles and sighs. <i>“We had sex.”</i> She looks around and chuckles. <i>“A lot of sex. Don’t you remember?”</i>");
	
	output("\n\nYou really don’t. Your head is pounding. How long have you been out?");
	
	output("\n\nThe Servant chuckles and reaches past you, picking up the necklace from where it lay on the ground. <i>“Don’t worry about it. We had a lot of fun.”</i> She releases your arm, and places the necklace around her throat, securing it in place. <i>“It’s best not to dwell on it, I’m sure.”</i>");
	
	output("\n\nLooking at the shining red jewel, you can’t help but agree.");
	
	output("\n\nA few minutes later, you’re back on your feet and collecting your gear. The Servant is standing now as well, relighting the candles around the room. <i>“Oh man, it’s everywhere. I think there’s some cum on the damn ceiling. It’ll take forever to clean this...”</i> She frowns, planting her hands on her hips with a huff.");

	output("\n\nChuckling to yourself, you make your way over to the door, bidding farewell to the cumsoaked woman.");

	processTime(10+rand(5));

	currentLocation = "RESIDENTIAL DECK 11";
	flags["BIGTIDDYGOTHGF_LOCKOUT"] = GetGameTimestamp() + 1440;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bigTiddyGothGFSexLeave():void
{
	clearOutput();
	bigTiddyGothGFBust();
	
	output("Deciding you’ve had enough, you pull yourself to your feet and head to the door, biding the dark woman farewell.");

	output("\n\nThe Servant follows you with her eyes as you make your way across the room. <i>“See you soon, lover.”</i>");
	
	output("\n\nAs you leave the apartment, you hear the woman sigh softly, then whisper something in the dark.");

	processTime(3+rand(1));
	currentLocation = "RESIDENTIAL DECK 11";

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}