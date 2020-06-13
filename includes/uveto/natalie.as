public function showNatalie(nude:Boolean = false):void
{
	if(flags["NATALIE_MET"] != undefined) showName("\nSTEPH...?");
	else if(flags["NATALIE_MET"] == -2) showName("MISS\nNOBODY");
	else showName("\nNATALIE");
	showBust(natalieBustDisplay(nude));
}
public function natalieBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "NATALIE";
	if(nude) sBust += "_NUDE";
	return sBust;
}

// Add to the Freezer after watching Uveto’s Steph Irson:
public function natalieAvailableAtBar():Boolean
{
	if(flags["STEPH_DARGONED"] == undefined) return false;
	return (rand(4) != 0);
}
public function natalieFreezerAddendum(btnSlot:int = 0):void
{
	if(flags["NATALIE_MET"] == undefined)
	{
		output("\n\nYou notice a blonde woman sitting in one of the booths near the back of the bar, cradling a mug of something frothy and steaming. Unlike most of the natives’ cold color palettes, she’s wearing a khaki button-up shirt and trousers underneath a wool-padded jacket and pulled-up hood. She’s sitting quietly and alone, looking very much like she doesn’t want to be disturbed. Your attention almost wanders right by her, until you realize... she looks an awful lot like Steph Irson. Could it be...?");
		
		// [Steph...?]
		addButton(btnSlot, "Steph...?", approachNatalie, undefined, "Steph...?", "You’ve got to sate your curiosity. Is that who you think it is?");
	}
	else if(flags["NATALIE_MET"] == -2)
	{
		output("\n\nYou notice the blonde woman, who considers herself as “some nobody”, sitting quietly and alone in one of the booths near the back of the bar, cradling a frothy, hot drink.");
		
		addButton(btnSlot, "Ms.Nobody", approachNatalie, undefined, "Miss Nobody", "Do you sate your curiosity by giving her another visit?");
	}
	else
	{
		output("\n\nYou notice Steph Irson’s twin sister, Natalie, sitting quietly and alone in one of the booths near the back of the bar, cradling a frothy, hot drink.");
		
		addButton(btnSlot, "Natalie", approachNatalie, undefined, "Natalie Irson", "Have a chat with Steph’s twin sister.");
	}
}
public function approachNatalie():void
{
	clearOutput();
	author("Savin");
	showNatalie();
	clearMenu();
	
	// Intro
	if(flags["NATALIE_MET"] == undefined)
	{
		output("You [pc.walk] over to the blonde’s booth and rap a hand on her table, drawing her gaze out of her mug with a start. <i>“Y-yes?”</i> she stammers, in what is most certainly the famous Galactic Huntress’s voice. <i>“Can, uh... c-can I help you?”</i>");
		output("\n\nShe stares up at you with big, doe-like blue eyes while you introduce yourself. A messy lock of flaxen hair falls from under her hood, long enough to brush her unadorned lips before she tucks it back behind an ear -- a human ear, you notice. Your question dies in your throat before you have a chance to speak it. The last time you saw Steph, she was mutated with cat-parts and silver eyes and more... though now that you’re next to her, this woman still definitely strikes an uncanny resemblance.");
		output("\n\nYou have to ask: <i>“You look " + (pc.isBimbo() ? ", like, suuuuper" : " really") + " familiar...”</i>");
		output("\n\n<i>“Oh God,”</i> the blonde groans, putting her face in her hands. <i>“No, no, no -- no! You’ve never seen me before, sorry! I just have one of those faces. Haha! Just s-some nobody. That’s me.”</i>");
		
		processTime(3);
		
		// [Sorry] [Whatever] [No Way]
		addButton(0, "Sorry", greetNatalie, "sorry", "Sorry", "Apologize and leave.");
		addButton(1, "Whatever", greetNatalie, "whatever", "Whatever", "You don’t know about that... but you’re not gonna push it. For now.");
		addButton(2, "No Way", greetNatalie, "no way", "No Way", "This is the most obvious ruse in the world...");
		
		return;
	}
	// Repeat from no intro
	if(flags["NATALIE_MET"] == -2)
	{
		output("You [pc.walk] over to the blonde’s booth and rap a hand on her table, drawing her gaze out of her mug with a start. <i>“H-hi again.”</i> she stammers, curious by your return. <i>“Come back to join me?”</i>");
		output("\n\nOn second glance, she does look very familiar... Do you stay and try to guess who she is?");
		
		processTime(1);
		
		addButton(0, "Hm...", greetNatalie, "no way", "Hm...", "You can definitely tell who she is!");
		addButton(14, "Leave", greetNatalie, "leave", "Leave", "Apologize and leave.");
		
		return;
	}
	// Repeat from Mischievous
	if(flags["NATALIE_MET"] < 0)
	{
		output("You [pc.walk] over to the blonde’s booth and rap a hand on her table, drawing her gaze out of her mug with a start. <i>“Y-you again?!”</i> she stammers, surprised by your return. <i>“W-what do you want this time?”</i>");
		output("\n\nDo you take this opportunity to make amends with the Irson twin?");
		
		processTime(1);
		
		if(pc.credits >= 5) addButton(0, "Buy Drink", greetNatalie, "buy drink", "Buy Drink", "Buy Natalie a drink. Least you could do after causing a fuss.\n\nCosts 5 credits.");
		else addDisabledButton(0, "Buy Drink", "Buy Drink", "You don’t have enough credits for that!\n\nCosts 5 credits.");
		addButton(1, "Nah", greetNatalie, "meh", "Nah", "Nah, you just wanted to get her attention. Later!");
		
		return;
	}
	// Repeat Greets
	output("<i>“Hey, Nat,”</i> you say, sliding into the booth across from the shy scientist.");
	output("\n\nShe looks up with a start, almost spilling her drink in surprise. <i>“O-oh! Hi, [pc.name]. How, uh, how are you?”</i>");
	output("\n\n" + (pc.HP() >= 33 ? "<i>“Fine,”</i> you answer." : "<i>“Could be butter,”</i> you grunt, favoring your recent hurts.") + " You call over to " + (flags["MET_HANA"] != undefined ? "Hana" : "the barmaid") + ", though this time Nat insists on paying for drinks.");
	output("\n\n<i>“So, what’s up?”</i>");
	
	processTime(1);
	
	natalieMenu();
}
// Menu
public function natalieMenu():void
{
	// [Talk] [Leave]
	addButton(0, "Talk", talkNatalie, "talk", "Talk", "Ask Natalie about herself -- and not her work, this time.");
	if(flags["NATALIE_TAMES_VARMINT"] == undefined)
	{
		if(flags["NATALIE_NEED_SILICONE"] != undefined && !pc.hasItemByClass(Silicone))
		{
			if(!varmintIsWild()) flags["NATALIE_NEED_SILICONE"] = undefined;
			else addDisabledButton(1, "Varmint", "Varmint", "Natalie can only help you if you’re carrying some silicone first!");
		}
		else if(flags["NATALIE_TALK_MONSTERS"] != undefined && varmintIsWild()) addButton(1, "Varmint", talkNatalie, "varmint", "Varmint", "Ask Nat to take a look at your varmint problem.");
	}
	addButton(14, "Leave", talkNatalie, "leave", "Leave", "Take your leave of the scientist.");
}
public function greetNatalie(response:String = "none"):void
{
	clearOutput();
	author("Savin");
	showNatalie();
	clearMenu();
	
	switch(response)
	{
		case "sorry":
			output("Guess you have the wrong person after all. You apologize for intruding and turn back to the bar floor. The woman mumbles a stuttering <i>“No problem...”</i> and huddles up around her drink.");
			
			processTime(1);
			// +2 Kind
			pc.addNice(2);
			flags["NATALIE_MET"] = -2;
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "whatever":
			output("You shrug. <i>“Guess I got the wrong person, miss nobody. See you around,”</i> you say, eying her as you turn back to the bar.");
			output("\n\n<i>“Uh, yeah... see ya...”</i> the woman mumbles into her drink, huddling up over the steaming mug.");
			
			processTime(1);
			flags["NATALIE_MET"] = -2;
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "leave":
			output("You give a shrug and explain that you must have been mistaken, then turn back to the bar floor. The woman mumbles a stuttering <i>“O-oh, okay... see ya then...”</i> and huddles up around her drink.");
			
			processTime(1);
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "no way":
			output("<i>“No way,”</i> you say. <i>“You’re-”</i>");
			output("\n\n<i>“Steph!? No, I’m not! I’m really, super duper, ultra <b>not</b>,”</i> the woman snaps, almost a shout. A moment of silence passes through the bar after her outburst, which only makes the erstwhile shy girl retreat into a huddle around her mug, pulling her knees up to her chest. A few people stare at you, until " + (flags["MET_HANA"] != undefined ? "Hana" : "the barkeep") + " clanks a mug heavily on the counter. That breaks the tension, and the slow murmur of conversation starts building up again.");
			output("\n\nWhen the pressure of a dozen sets of eyes on her eases off, the girl groans and looks apologetically up at you. <i>“I... um, I’m sorry, I didn’t, uh, didn’t mean to... I’m Natalie. Uh, Irson. Steph’s my...”</i>");
			output("\n\n<i>“Sister,”</i> you finish for her. Identical twins, more like. She nods, sighs, and motions to the bench across from her. <i>“Since you’re so interested, how, uh, how about you...”</i>");
			
			processTime(2);
			flags["NATALIE_MET"] = 0;
			
			// [Buy Drink] [Nah]
			if(pc.credits >= 5) addButton(0, "Buy Drink", greetNatalie, "buy drink", "Buy Drink", "Buy Natalie a drink. Least you could do after causing a fuss.\n\nCosts 5 credits.");
			else addDisabledButton(0, "Buy Drink", "Buy Drink", "You don’t have enough credits for that!\n\nCosts 5 credits.");
			addButton(1, "Nah", greetNatalie, "nah", "Nah", "Nah, you were just curious who she was. Later!");
			break;
		case "nah":
		case "meh":
			output("<i>“W-wha? Asshole!”</i> Natalie huffs as you turn away" + (response == "nah" ? ", telling her you were just curious, is all" : ". <i>“Y-you’re just messing with me now!”</i>") + ". You wave over your shoulder, leaving her to huff and pout in her booth.");
			
			processTime(1);
			flags["NATALIE_MET"] = -1;
			// +2 towards Mischievous.
			pc.addMischievous(2);
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "buy drink":
			output("<i>“How about I buy you a drink?”</i> you offer, gesturing at " + (flags["MET_HANA"] != undefined ? "Hana" : "the bartender") + ". The eyepatched matron swaggers over with a pair of mugs of whatever it is Natalie’s drinking and slides them onto the table while you get comfortable. <i>“I’m [pc.name],”</i> you add.");
			if(pc.isNice()) output(" <i>“Sorry about all that.”</i>");
			output("\n\n<i>“Nat,”</i> the famous hostess’s sister murmurs, bringing the fresh mug up to her little pink lips and blowing on it. <i>“Look, sorry for freaking you. You just... you’ve gotta understand </i>how much<i> I get asked that. Everybody and their mother in the core thinks I’m my sister! Can’t go anywhere back home without getting harassed. N-not that you’re harassing me! At least on purpose, anyway.”</i> ");
			output("\n\nYou apologize");
			if(pc.isNice()) output(" again");
			output(" for the intrusion. Honestly, considering what you saw on the most recent episode of her sister’s show, you’re not sure how you could have made the mistake. She might look just like her sister <i>did</i> last season, but now, after all those mutations...");
			output("\n\nNat blushes all of a sudden, blood red. <i>“Y-you’ve seen those awful new episodes? Oh-oh no!”</i>");
			output("\n\n<i>“What’s wrong?”</i> you ask, taking a sip of your drink.");
			output("\n\nThe woman across from you squirms, hiding most of her face under her hood and in her drink. <i>“Those new episodes, the stuff she gets into; lets people see... God, half the galaxy’s seen me naked!”</i>");
			output("\n\nNaked? What... oh, right. Twins. " + (pc.exhibitionism() >= 66 ? "The thought of billions of people seeing you naked, live, all at once sends shivers of excitement up your spine. How could she be embarrassed about that -- it’s totally hot!" : "Yeah, you guess you can see her point."));
			if(pc.exhibitionism() >= 66 || pc.isBro())
			{
				output(" Now that she mentions it, though, it’s suddenly real easy to mentally undress the sexy blonde. You’ve already seen all those supple curves, seen her body jiggling in all the right places, just on another person. Your mind automatically fills in the blanks left by Nat’s heavy coat and tight shirt.");
				if(pc.biggestCockLength() >= 18) output(" There’s an audible <i>thunk</i> as your [pc.cockBiggest] throbs with interest, bouncing off the table’s underside.");
			}
			output("\n\nNat squirms under your continued gaze. <i>“That’s why I took this posting. Get away from people for a bit, till Steph’s season is over.”</i>");
			output("\n\nFiguring you ought to change the subject before poor Nat goes permanently red in the face, you ask what posting that is: who’s she working for?");
			output("\n\n<i>“The Confederate Scout Authority,”</i> she answers quickly. <i>“I just finished my master’s in xeno-zoology, and the last scientist they had here just got married, so when I heard the station was open, I jumped at it! It’s not glorious frontier work, but there’s so many species here on Uveto that we still know next to nothing about! The inner ocean is just teeming with life, at least some of which is sapient... and completely out of communication even after centuries of colonization.”</i>");
			output("\n\nGet her talking, and that nasty stutter just vanishes! You grin and nod");
			if(pc.isBro() || pc.libido() >= 66 || pc.exhibitionism() >= 66) output(", trying not to stare into her cleavage");
			output(", glad to have her talking. She keeps going for a good long while once you get her wound up, delving into technicalities of undersea life that you have a damn hard time following -- all about evolving sapience in the harsh conditions of the moon’s inner sea. The terminology she’s using alone leaves you swimming, completely lost. You can barely get a word in edgewise, practically drowning in the verbal deluge until her drink’s vanished, and you can practically hear her talking her throat dry.");
			output("\n\nWhen she finally had to pause to order another drink, you take the opportunity to butt in and try and change the subject while you have the chance...");
			
			processTime(4);
			flags["NATALIE_MET"] = 1;
			// +1 Kind; -5 Credits.
			pc.addNice(1);
			pc.credits -= 5;
			// Add menu
			natalieMenu();
			break;
		default:
			output("Nothing happened!");
			addButton(0, "Next", mainGameMenu);
			break;
	}
	output("\n\n");
}
public function talkNatalie(response:String = "none"):void
{
	clearOutput();
	author("Savin");
	clearMenu();
	
	switch(response)
	{
		case "leave":
			showNatalie();
			
			output("You shift out of the booth, telling Nat that you’ve gotta go.");
			output("\n\n<i>“O-oh! Okay,”</i> she sighs. <i>“See you around, [pc.name].”</i>");
			
			processTime(1);
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "talk":
			showNatalie();
			
			output("<i>“So, tell me a little about </i>you<i>, Nat,”</i> you prompt.");
			output("\n\n<i>“M-me?”</i> she stammers, blinking in surprise. <i>“What do you wanna know?”</i>");
			output("\n\nYou think for a moment before saying,");
			// Choose one at random! Append, same line: 
			var talks:Array = [];
			var topic:int = 0;
			var msg:String = "";
			
			// Her Accent
			msg = " <i>“So, I notice you don’t have much of an accent.”</i>";
			msg += "\n\nNatalie laughs shyly <i>“Oh, that. Uh, well, that’s just cuz I kinda suppress it. Back when I first went to university, a lot of the girls made fun of me and Steph for sounding like space bumpkins. Which, I mean, I guess we are. Were. But we didn’t have to give it away. Ended up just not talkin’ for a while. A long while. Almost all the way through Junior year, really. After I stopped flapping my dumb mouth, nobody paid much attention to me. Gave me plenty of time to learn how everyone else talked.”</i>";
			msg += "\n\n";
			if(pc.isNice()) msg += "<i>“That’s awful!”</i>";
			else if(pc.isMischievous()) msg += "<i>“Haha, wow, that’s pretty rough,”</i>";
			else if(pc.isAss()) msg += "<i>“That sucks,”</i>";
			msg += "\n\nNat shrugs and sips on her drink. <i>“Hey, if you haven’t noticed, I’m, um, not much for talking anyway. I swear I-I didn’t stutter so much before, though. I always did a little, but not so bad. Guess I forgot how to talk a little!”</i>";
			msg += "\n\nShe chuckles wryly and continues: <i>“Going to school on Vesperia meant I picked up a Gal-standard accent after a while, though. Started to fit in a lot better after that. Pretty good, eh?”</i>";
			talks.push(["accent", msg, 3]);
			
			// Her Work
			msg = " <i>“Wanna tell me a little more about what you’re doing here on Uveto? Without getting too technical, maybe.”</i>";
			msg += "\n\nThe blonde bombshell perks up immediately when you mention her work.";
			msg += "\n\n<i>“Sure! Uh, l-let’s see, me specifically? Well, mostly I go out and catalogue different species. Not sapient ones, usually, but actual animals like the local ghen’sterra -- they’re those cute little floofy fuzzballs with six eyes you mighta seen around the walls? -- or the huge macro predators out on the Rift. I collect specimens, study behaviors, create data entries and analysis. If you’ve ever read a CODEX entry on a local species, it’s probably got at least some of my data written into it,”</i> she beams proudly.";
			msg += "\n\n<i>“Of course, that’s just, like, the most mundane part of the job! The real exciting stuff is getting to look at never-before-seen species, or try and figure out the real mysterious ones. What I’m most interested of anything here on the planet is what the locals call the ‘frostwyrms,’ these huge dragon-like beasties that’re supposed to be bigger than Terran blue whales, and whose roars can shatter the ice for miles!”</i>";
			msg += "\n\n";
			// Has seen frostwyrm, not killed:
			if(flags["MET_FROSTWYRM"] != undefined && flags["FROSTWYRMSLAIN"] == undefined) msg += "Yeah, you’ve seen one of those. Huge and terrifying is right.";
			// Has killed wyrm:
			else if(flags["MET_FROSTWYRM"] != undefined && flags["FROSTWYRMSLAIN"] != undefined) msg += "<i>“Yeah, about that...”</i> you chuckle awkwardly. Whoops. There’s probably more than that one wyrm, though, right?";
			// not seen:
			else msg += "Wow, that sounds like something out of " + (MailManager.isEntryUnlocked("syribooks") ? "one of Syri’s" : "some") + " fantasy books.";
			msg += "\n\nNat chuckles, brushing a loose lock of hair behind an ear. <i>“Yeah, so, I’ve been trying to track a live one down every chance I get, but no luck. I coulda sworn I’ve caught glimpses of one out on the Rift, but...";
			// killed:
			if(flags["FROSTWYRMSLAIN"] != undefined) msg += " I guess you took care of that one, huh? Damn, what a shame. B-b-but I know you probably didn’t have a ch-choice, right?";
			// else:
			else msg += " I can never get c-close enough to be sure. Always flies off.";
			msg += "”</i>";
			msg += "\n\nOut of curiosity, you have to ask: she saw the latest episode of her sister’s show, right?";
			msg += "\n\n<i>“Steph’s? Oh God no, I don’t watch that! I saw the Mhen’ga episode live and... never again. If Steffy wants to go sticking her hands in poor natives’ cooters, that’s, uh, that’s her business I guess. But I don’t have to watch it!”</i>";
			msg += "\n\nYou suppose you’ll spare her the knowledge that her sister might have found the wyrm first...";
			talks.push(["work", msg, 4]);
			
			// Her Interests
			msg = " <i>“What do you do for fun, Nat? Surely you do something other than work.”</i>";
			msg += "\n\nShe giggles pleasantly, sipping on her drink. <i>“Um, not much, I guess. I kinda live my work. If I’m not clocked in with the Authority, I’m reading scientific journals or working on my own articles for publication. I don’t even really watch TV or anything these days...”</i>";
			msg += "\n\nOh, come on, she’s gotta have fun sometime!";
			msg += "\n\n<i>“Work </i>is<i> fun!”</i> she pouts. You give her a look. <i>“I... I guess I’m starting to like ice skating? I picked it up just to get around a little easier outside of town, but sometimes now I go out just to skate around in the evenings. Helps me clear my mind, you know? Just getting away from everything for a couple hours, in the fresh air, all by myself. It’s nice.”</i>";
			msg += "\n\nSounds nice, sure... except for the sub-zero weather and constant threat of attack outside the city walls. How does she deal with that?";
			msg += "\n\n<i>“Oh! Well, a heat belt mostly solves the first problem. Plus my big ol’ coat here, and a thermos of soup or three, and the cold doesn’t bother me too much anymore. Getting attacked out there, though, t-that’s a big deal! When I’m working I usually have some Authority drones with me, or I’m working in the shadow of the city’s defense guns, so I’m safe enough. But when I’m all on my own, yeah, it’s, um, scary sometimes I guess.”</i>";
			msg += "\n\nNatalie idly plays with a stray lock of hair, avoiding your gaze for a moment. <i>“It’s fine though. Most of the local korgonne and milodan just ignore me, or at worst, just come over and try flirting. There’s a few that make a little game of it, I think, or else they’re just <b>way</b> more persistent than any boy back in the core. It would almost be flattering -- almost -- if the whole point wasn’t to just get away from everything. Everyone. Just for a little bit.”</i>";
			talks.push(["interests", msg, 3]);
			
			// Interesting Monsters
			msg = " <i>“Tell me about some of the creatures you’ve worked with.”</i>";
			msg += "\n\n<i>“But there’s so many!”</i> Nat laughs. <i>“I’m really lucky: I’ve gotten to handle thousands of different species from across the galaxy. The Vesperian Royal Zoo had the most amazing collection, and they’d let us students come over pretty much whenever to handle them. I think the staff appreciated the help, and we loved getting to handle the exotic species.”</i>";
			msg += "\n\nShe hums happily to herself, thinking back with a growing smile. <i>“Let’s see... probably the most interesting critter I ever got to work with was this huge, blue silicon-based life form. It was kind of like a dog, but with spikes all over, teeny little vestigial eyes, and a tail longer than it’s body and covered with razor spines. Looked like something out of a horror movie... but oh, she was just the sweetest little thing! Give her some android-grade silicone to munch on, and she’d just be putty in your arms. Those beauties really make friends for life, too: they imprint like ducks, see, and their memory lasts for decades! Every time I go back to Vesperia I swing by the zoo, and they all recognize me like we saw each other yesterday!”</i>";
			msg += "\n\nThese creatures she’s talking about... <i>“They’re not from New Texas, are they?”</i>";
			msg += "\n\n<i>“They are!”</i> Nat nods, eagerly. <i>“Varmints, the New Texans call ‘em. Apparently they’re descended from a species of macro predators that fought against the colonists for decades. Really changed the way the whole planet’s ecology and terraforming process went, since the ‘varmints’ were almost impossible to kill. The col-”</i>";
			msg += "\n\nBefore she can launch off into the story in full, you put a hand up to indicate you’d like to speak. Natalie trails off, muttering <i>“-lo. nists....”</i> into her mug before falling silent. You take the opportunity to mention a little blue problem you’ve left aboard your ship. While the varmint hasn’t caused too much trouble, it certainly isn’t comforting having a snarling, razor-toothed beast stalking around the corridors.";
			msg += "\n\n<i>“Crikey, how’d you get it off New Texas?”</i> Nat gawks. <i>“You’ve gotta have a permit, and special dispensation, and-”</i>";
			msg += "\n\nYou shrug, saying that you sort of just walked off the planet with it. Customs didn’t exactly stop you... then again, you vaguely recall Amma was busy snowballing one of her bull-man’s loads with some ginger spacer sprawled over her desk when you wandered past. Ogram might have been a little distracted.";
			msg += "\n\nNat blushes, covering her mouth with a hand to suppress a laugh. <i>“O-oh wow. Um, that’s New Texas alright. So you’ve just got a varmint running wild on your ship, [pc.name]?”</i>";
			msg += "\n\nYou nod, and Nat grimaces. <i>“You, uh, you should probably do something about that. Varmints can eat through machinery if they get too hungry. Or scared. Making a warp jump probably traumatized the poor thing, too! Go find a tub of silicone or something -- I can help you if you want.”</i>";
			// Only if the PC has a Varmint untamed on the ship
			if(varmintIsWild()) talks.push(["monsters", msg, 5]);
			
			// Her Home
			msg = " <i>“You’re from New Brisbane, right?”</i>";
			msg += "\n\nNatalie nods, <i>“Sure am, born and raised! You ever been?”</i>";
			msg += "\n\nYou shake your head. N.B. is deep core-ward, and Steele Tech never had a real presence there.";
			msg += "\n\n<i>“Shame. It’s a real beauty, the old homeworld,”</i> Nat muses, looking far away. You catch a hint of accent creeping into her voice, though it vanishes quickly: <i>“Well, it’s got its own kinda beauty, I guess. See, New Brisbane was a real early colony, the kind they had to slow-boat to with a generation ship. But when our ancestors got there, they found the planet was this huge jungle world, completely overrun with enormous toxic plants and flesh-eating creatures. One of the deadliest worlds Mankind had ever encountered... and it was the only habitable world in the system, or anywhere nearby. It came down to a single-digits break in the vote to actually try and settle there rather than just keep going.”</i>";
			msg += "\n\nYikes. It was really that bad?";
			msg += "\n\n<i>“Still is!”</i> Nat admits, taking a long draught from her mug. <i>“The planet’s only got a few cities on it today, big walled mega-cities so packed full of people you can’t stretch without rubbing up on a dozen strangers. And polluted, too, no matter how hard they work the atmospheric processors. But take one step outside the city walls, and it’s like this sudden rush of freedom -- it’s amazing. And then you get eaten by earth-eating worms the size of your space ship. Everything outside the walls wants to kill you: plants, animals, bacteria... I’m an expert in the subject, a-and I don’t know how my ancestors settled the place! Nowadays we don’t go outside the walls without armored suits, packed like sardines into ground-crawlers.”</i>";
			msg += "\n\nAnything else she can tell you about the planet? Maybe something less depressing?";
			msg += "\n\n<i>“Oh, it’s not that bad,”</i> Nat groans. <i>“I mean, it <b>sounds</b> bad I admit. B-but it was an okay place to grow up, at least as long as you lived above ground. The ground-siders had it pretty rough, but I was born mid-tier. Uh, middle class, I guess you’d say anywhere else. It wasn’t so bad. We have the best technology in the galaxy, and you grow up with so many friends... when I went to Vesperia later, it seemed so barren with only a few thousand people on campus. I still keep in touch with, gosh, a couple hundred people from my home block.”</i> ";
			msg += "\n\nShe smiles and flicks her fingers across a small wrist device, bringing up a scrolling holographic display of face after face. <i>“Well, anyway, what about you? What was your homeworld like?”</i>";
			msg += "\n\nNot much to tell, there. Every human ought to know what good old Terra’s like, after all. Still, you don’t mind spending a few minutes talking about where you and Dad spent your early life, the places you went, the people there... though compared to the adventures you and the Irsons go on now, well, it seems so mundane in comparison!";
			talks.push(["home", msg, 5]);
			
			// Uveto
			msg = " <i>“So, how are you liking Uveto?”</i> As you speak, you glance around the Freezer’s nordic-themed walls. This is certainly the warmest place in the city, despite the name -- anywhere outside is a frozen wasteland, as far as you can tell.";
			msg += "\n\n<i>“It’s wonderful!”</i> Nat answers immediately. <i>“I-I mean, I know it doesn’t look like much. Actually less than that, if you don’t like the constant cold and dark and rowdy furries. But I don’t mind! The snow and ice are beautiful in the light of the gas giant, I think, and the people here have been nothing but friendly. I expected a place this harsh to be full of gruff assholes, the kind of wouldn’t give an outsider the time of day. But really, I guess ausar are ausar wherever you go: they’re sweeties. Even that weirdo human cult here, the Stormwhatevers, are pretty friendly as long as you don’t try and act all tough. Otherwise they just wanna fight you!”</i>";
			msg += "\n\nShe chuckles. <i>“I dunno. I like it here. Though I miss the suns from back home...”</i>";
			msg += "\n\nYou nod understandingly. The atmosphere around the planet is certainly... different.";
			talks.push(["uveto", msg, 3]);
			
			topic = rand(talks.length);
			
			// Add [Varmint] to menu options
			if(talks[topic][0] == "monsters" && flags["NATALIE_TALK_MONSTERS"] == undefined) flags["NATALIE_TALK_MONSTERS"] = 1;
			
			output(talks[topic][1]);
			processTime(talks[topic][2] + rand(3));
			
			natalieMenu();
			break;
		case "varmint":
			showNatalie();
			
			output("<i>“Hey, think you could help me with that varmint problem?”</i>");
			output("\n\nNat blinks. <i>“O-oh, you were serious? Wow, uh, yeah I guess, sure. Do you have any silicone? A lot of it -- like, an entire bag. Varmints think with their stomachs first, brains second. Feeding ‘em will make them love you faster than anything, but if the poor darling’s already traumatized...”</i>");
			
			processTime(2);
			
			// If doesn’t have silicone:
			if(!pc.hasItemByClass(Silicone))
			{
				output("\n\nYou shake your head. You don’t have enough silicone on hand to feed the big blue beast.");
				output("\n\n<i>“Okay,”</i> Nat says. <i>“No problem. Go find some, and bring ‘er back here. I’ll help you sort the little guy out, but we’re gonna need the r-r-raw materials, first.”</i>");
				
				// Back to Nat’s menu, ghost [Varmint] until you have a Silicone Bag.
				flags["NATALIE_NEED_SILICONE"] = 1;
				
				natalieMenu();
			}
			// Has Silicone:
			else
			{
				output("\n\n<i>“Sure do,”</i> you answer, tapping the bag sticking out of your pack. <i>“Let’s go.”</i>");
				output("\n\nNat nods, pounds back the rest of her drink, and waves towards the door. <i>“After you, [pc.name].”</i>");
				output("\n\nYou slip out of the booth and turn towards the door. Back into orbit you go...");
				
				// [Next]
				addButton(0, "Next", talkNatalie, "varmint tame");
			}
			break;
		case "varmint tame":
			// Take PC to ship. Pass 30 minutes. Remove Silicone Bag.
			moveTo("SHIP INTERIOR");
			processTime(25 + rand(10));
			pc.destroyItemByClass(Silicone, 1);
			flags["NATALIE_NEED_SILICONE"] = undefined;
			
			showBust(natalieBustDisplay(), "VARMINT");
			showName("TAMING THE\nVARMINT");
			
			output("After a quick stop by Nat’s apartment to gather some things she claims she’ll need, the two of you make your way up the space elevator and through the docking arm back to your vessel. You lead Natalie aboard, and over towards the small recess in your ship’s supply stash where the blue-plated varmint’s made its nest. Natalie gasps when she sees the creature, but it’s one of giddy joy rather than fear.");
			output("\n\nYou hand over the silicone bag and let your partner get to work.");
			output("\n\n<i>“Hey there, darlin’,”</i> Natalie coos, putting a friendly hand out towards the varmint. It snarls and hoots softly, recoiling towards the bulkhead until it’s pressed flat against the cold metal, bearing its teeth. <i>“Don’t be scared, sweetie. I’m not gonna hurt you.”</i>");
			output("\n\nShe takes a step forward, then immediately yanks herself back when the varmint snaps. Nat doesn’t skip a beat, though, but rather lunges forward and grabs two of its head-spikes, holding its head so that its snapping fangs can’t get near her.");
			output("\n\n<i>“There we go! Good girl,”</i> Nat murmurs, so softly you can barely hear her over the creature’s owl-like cries. <i>“Shhh now. Shh. Here...”</i>");
			output("\n\nUsing her foot, Nat rolls the silicone bag over, sliding it right under the varmint’s forelegs. It stops snarling almost immediately, sniffs at the air, and then hoots softly. Nat pushes it back by the horns, angling its snout down towards the metallic casing, and then releases it. Rather than attacking her, the varmint grabs the bag in its fangs and scrambles back. One good bite punches through the casing, and liquid silicone pours out into its mouth. Just like a dog, it starts lapping the stuff up off the deck, seemingly contented and completely ignoring you and Nat.");
			output("\n\n<i>“Good girl,”</i> Natalie chuckles, taking a leash and collar out of her pack. <i>“Now just remember our faces. Remember who feeds you... there’s a girl.”</i>");
			output("\n\n<i>“Are you sure it’s a girl?”</i> you ask, watching Nat slowly work the collar around the varmint’s tree-trunk neck. The varmint makes a sound somewhere between a husky moan and a bovine braying, but doesn’t object to Natalie’s collaring it.");
			output("\n\nShe turns and gives you a wink. <i>“Call it... feminine instinct. Also females have these little tail-ridges here, see?”</i>");
			output("\n\nShe laughs at your reaction, and hands the leash over to you. <i>“Just let her eat for a bit and try and stay with her. She should have imprinted on both of us -- it’s this weird feeding instincts they keep from when they’re little. Anybody that feeds ‘em is basically mommy and daddy now. Let ‘er eat up, and she should come and snuggle like a puppy. Just, uh, ignore the smell -- they excrete gasses through those pores around the... never mind. Here ya go.”</i>");
			output("\n\nYou take the leash, leaning tentatively down to pet the varmint on its big, plated brow. It murmurs at you, making hooting sounds and wagging its spiked tail across the deck.");
			output("\n\n<b>Looks like you have a new friend</b>.");
			output("\n\n<i>“Well, there you go,”</i> Nat grins, watching the two of you bond over a breached silicone bag. <i>“That was fun, [pc.name]! Lemme know if you ever get another spooked critter aboard -- I’m always happy to help.”</i>");
			output("\n\nShe certainly seems so. Nat was more in her element the last few minutes than you’ve ever seen her before. Adjusting the hem of her jacket, Natalie turns towards the airlock. <i>“I, uh, I’ll leave you two to it. See you around, [pc.name].”</i>");
			output("\n\nNat starts walking, but stops beside you, hesitating just long enough to decide to give you a quick, air-light hug before hustling towards the airlock.");
			
			flags["NATALIE_TAMES_VARMINT"] = 1;
			flags["VARMINT_IS_CREW"] = 2;
			
			varmintDisappearsCancel();
			
			if(!hasVarmintLeash())
			{
				output("\n\n");
				quickLoot(new VarmintLeash());
			}
			else
			{
				// [Next]
				addButton(0, "Next", mainGameMenu);
			}
			if(hasVarmintLeash())
			{
				pc.createStatusEffect("Varmint Leashed");
				pc.removeStatusEffect("Varmint Unleashed Cooldown");
			}
			break;
		default:
			output("Nothing happened!");
			addButton(0, "Next", mainGameMenu);
			break;
	}
	output("\n\n");
}

