/* Ciaran the DILF Doggo - https://docs.google.com/document/d/1v79PMoGJfDqK8HehUOeQwWkmrz9TouXOKG545IOUtlY/edit#
 *
 * #FLAGS:
 * CIARAN_MET			- 1 if met him
 * CIARAN_TALKED		- 1 if done one of his talk options
 * CIARAN_ANNE_MET		- 1 if met Annebelle through some of Ciaran's interactions
 * CIARAN_KITHRAN_MET	- 1 if met Kithran through some of Ciaran's interactions
 * CIARAN_HOUSE			- 1 if been to Ciaran's House
 * CIARAN_DENIED		- 1 if been shot down on sexual advances by Ciaran
 * CIARAN_JOKE			- number of last joke he told you
 * CIARAN_SCARS			- 1 if talked to Ciaran about his scars
 * CIARAN_PAST			- 1 if talked to Ciaran about his past
 * CIARAN_OUTFIT		- 1 if talked to Ciaran about his outfit
 * CIARAN_SCRITCH		- 1 if he scritched you back, 2 if he hasn't scritched you back, undefined if never scritched him
 * 
 * CIARAN_FINGER		- how many times you got fingered
 * CIARAN_SPANK			- how many times he gave you a red bum
 * CIARAN_VANILLA		- how many times normal sex
 * CIARAN_LAP			- how many times lap sex
 * CIARAN_HEAT			- how many times heat sex
 * 
 */

public function ciaranAvailable():Boolean
{
    return !pc.hasStatusEffect("Ciaran Disabled");
}

public function showCiaran(nude:Boolean = false):void
{
	if (flags["CIARAN_MET"] != undefined) showName("\nCIARAN");
	else if (silly) showName("DILF\nDOGGO");
	else showName("AUSAR\nCOWBOY");
	showBust(ciaranBustDisplay(nude));
}

public function ciaranBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "CIARAN";
	if (nude) sBust += "_NUDE";
	return sBust;
}

public function ciaranBroncoAddendum(btnSlot:int = 0):void
{
	output("\n\n");
	
	if (flags["CIARAN_MET"] == undefined) output("There's an extremely tall horned ausar man propping his feet on a table in a corner of the saloon. He's dressed like a cowboy from a Terran Western, and a cowgirl prostitute is chatting at him. He looks just a little bored.");
	else output("Ciaran's sitting at his usual table, leaning back in his chair with his hat angled partly over his face as he lazily checks a dataslate. When he glances up and notices you he grins and gives you a small wave hello.");
	
	addButton(btnSlot, (flags["CIARAN_MET"] != undefined ? "Ciaran" : (silly ? "DILFdoggo" : "AusarCowboy")), approachCiaran);
}

public function approachCiaran():void
{
	clearOutput();
	author("Night Trap");
	showCiaran();
	clearMenu();
	
	if (flags["CIARAN_MET"] == undefined)
	{
		output("You make your way over to the extraordinarily tall ausar's table. Serendipitously, the prostitute at his table finishes chattering at him and departs, her farewell earning a lazy wave and a smile from the horned ausar. He shifts his gaze over to you as you approach, his smile turning into a wolfish grin.");
		output("\n\n<i>“Well, what do we have here? A " + (pc.femininity >= 65 ? "pretty" : "handsome") + " young [pc.race] looking to sit at my table?");
		if (pc.race() == "kaithrit" || pc.race() == "half-kaithrit") output(" I do so enjoy the company of " + (pc.race() == "half-kaithrit" ? "half-" : "") + "kaithrit");
		output(".”</i> His voice is deep, rich, and utterly masculine, though you're surprised to hear that he lacks a New Texas accent. ");
		output("\n\nBeing this close to him, you can ");
		if (pc.hasPheromones()) output("make out every note of his personal scent. It's a powerful and manly musk composed of countless individual notes: at times a rich and pleasant woodsmoke, at others the scent of warm petrichor, often an almost spicy scent as of peppers being cooked, but always a sense of warmth and the natural world. ");
		else output("detect a powerful and pleasant smell wafting off of him. It's something in between a primitive cologne and the scent of a warm, active body. ");
		output("Was the room always this hot, or is that just you? When he speaks again, you realize you've just been staring blankly at him for several seconds and taking in his scent.");
		output("\n\n<i>“I know I smell good kid, but surely there's something you'd like to ask me?”</i> You can actually hear his tail thumping powerfully against his chair at this point, his amusement at your reaction obvious.");
		output("\n\nYour cheeks flush with embarrassment, but his body language " + (pc.isTreated() ? "and scent put" : "puts") + " you at ease, giving you the sense that he's laughing with you rather than at you. Sheepishly, you ask him if you can sit down with him.");
		output("\n\n<i>“Please, do,”</i> he responds warmly. <i>“My name's Ciaran Eildean. What do you want to be called, kid?”</i>");
		output("\n\n<i>“Steele. [pc.name] Steele.”</i> ");
		output("\n\nCiaran cocks an eyebrow and grins at your introduction. <i>“Well then, 'Steele, [pc.name] Steele,' it's a pleasure to meet you.”</i> He smiles playfully, amused by his own lame joke. <i>“What can I do for you, kid?”</i>");
		flags["CIARAN_MET"] = 1;
	}
	else if (flags["CIARAN_SCRITCH"] == 2 
			&& !InCollection(pc.earType, GLOBAL.TYPE_AVIAN, GLOBAL.TYPE_FROG, 
				GLOBAL.TYPE_SHARK, GLOBAL.TYPE_SIREN, GLOBAL.TYPE_OVIR, 
				GLOBAL.TYPE_SUULA, GLOBAL.TYPE_LIZAN, GLOBAL.TYPE_DAYNAR, 
				GLOBAL.TYPE_VANAE, GLOBAL.TYPE_DRIDER) 
			&& pc.femininity >= 60)
	{
		ciaranGetScritched();
		flags["CIARAN_SCRITCH"] = 1;
		processTime(15);
		addButton(0, "Next", mainGameMenu, undefined, "", "");
		return;
	}
	else
	{
		output("Figuring he could use some entertainment, you mosey over to Ciaran's table. The massive hellhound tips his hat back as you approach and grins at you. <i>“Just had to come back for seconds, huh? I guess every man since me has paled in comparison.”</i>");
		output("\n\nYou roll your eyes at his self-aggrandizement, telling him not to flatter himself too much.");
		output("\n\n<i>“Ah, don't flatter myself '</i>too much<i>' you say. So you admit that I'm deserving of some flattery?”</i>");
		output("\n\nYou chuckle a bit, but you don't otherwise dignify his braggadocious banter. ");
		output("\n\nHe throws his clawed hands in the air good-naturedly, grumbling out in his deep voice, <i>“Well what did you come over here for if not to inflate my ego? Did you want to help inflate my knot instead?”</i> He asks the last question in a seductive tone, a lusty grin on his face.");
	}
	
	processTime(3);
	ciaranMainMenu();
}

public function ciaranMainMenu():void
{
	clearMenu();
	
	addButton(0, "Appearance", ciaranAppearance, undefined, "", "");
	addButton(1, "Talk", ciaranTalk, undefined, "", "");

	if (pc.femininity >= 60)
	{ 
		if (pc.lust() >= 33) addButton(2, "Sex", ciaranSex, undefined, "Sex", "Seduce the studly older man. Or more likely get dominated and pounded bareback in front of the whole saloon. Either one.");
		else addDisabledButton(2, "Sex", "Sex", "You aren't turned on enough for sex.")
	}
	else if (flags["CIARAN_DENIED"] == undefined) addButton(2, "Sex", ciaranNoSex, undefined, "Sex", "Seduce the studly older man. Or more likely get dominated and pounded bareback in front of the whole saloon. Either one.");
	else if (pc.hasStatusEffect("Heat") && !pc.isNaga() && pc.hasVagina()) addButton(2, "Sex", ciaranSexHeat, undefined, "Sex", "Ciaran looks restless. Maybe he'd be willing to make an exception for you as long as you're in heat?");
	else addDisabledButton(2, "Sex", "Sex", "Ciaran already turned you down once, and judging from how he looks at you, you're still not girly enough for his tastes. Don't make it awkward for both of you.");
	
	addButton(14, "Leave", mainGameMenu, undefined, "", "");
}

public function ciaranAppearance():void
{
	clearOutput();
	author("Night Trap");
	showCiaran();
	
	output("Ciaran Eildean is a Treated ausar, colloquially known as a hellhound. He stands seven feet, eight inches tall without counting his unusual horns, which are far more vertical than those of most Treated humans. He has tanned skin and thick, grey-streaked " + (silly ? "Cimmerian" : "onyx") + " hair that he keeps relatively short but unstyled, his mop parted by furry jackal-like ears the same color as his hair.");
	output("\n\nHis left ear has a notch missing from it, seemingly damaged at some point. A black cowboy hat with holes for his ears and horns rests on his head. His eyes are a striking, fiery shade of orange, and in darker conditions they shine " + (flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_BOOKWORM ? "thanks to bright tapetum lucidum " : "") + "like those of a nocturnal predator. ");
	output("\n\nWhenever he speaks you can see his white teeth, seemingly sharper than most ausars'. While his neck is clean-shaven with a faded blue bandana tied around it, his face is covered in a dark five o'clock shadow, though there is a quartet of parallel scars on his right cheek where the hair will no longer grow. His ruggedly handsome features are sharply defined and a bit weathered from years spent outdoors, making him look distinctly middle-aged. ");
	if (flags["CIARAN_VANILLA"] != undefined || flags["CIARAN_LAP"] != undefined || flags["CIARAN_HEAT"] != undefined) output("\n\nHaving seen Ciaran naked, you know he has many scars on his body that speak of a life of violence. The left side of his muscular neck has a scarred-over bite wound, presumably from an animal attack of some sort. His torso, both front and back, is marred by over a dozen scars of various sorts: stabbings, clawings, gunshot wounds, even flashburns from laser or plasma weaponry. There's no doubt his arms and legs are scarred as well, but his thick fur totally conceals any imperfections.");
	output("\n\nHis incredible physique speaks of many hours spent honing his body in the gym, with big pectorals and a set of perfectly-sculpted abdominals. The muscles of his arms and legs are well-defined even through the dense onyx fur covering his limbs. The claws of his fingers and toes are far more wicked-looking than a normal ausar's, though you notice that those on his right hand have been partially filed down.");
	output("\n\nCurrently Ciaran is wearing an outfit straight out of a 20th century Terran Wild West film: long-sleeved crimson denim shirt, short and darkly-colored poncho, black denim pants, and trail-worn cowboy boots that appear to be made of tanned varmint hide. You see a very large bulge in the crotch of his pants");
	if (flags["CIARAN_VANILLA"] != undefined || flags["CIARAN_LAP"] != undefined || flags["CIARAN_HEAT"] != undefined) output(" which you know to be concealing a thick canine cock a few inches over a foot in length, with a knot twice as thick as one proportionate to his already-large penis would be. Hanging beneath his member is a sack almost triple the size of the human norm, filled with four testes");
	output(". A tail with heavy black fur pokes out of his pants just under his belt. There's a gold ring at the base of his tail, nearly lost among the thick fur. Perhaps the only part of Ciaran that could be described as “cute”, his tail wags mischievously as you finish your appraisal of the hellhound, its owner having apparently noticed your stare");

	addDisabledButton(0, "Appearance", "Appearance", "You're looking at him right now!");
}

public function ciaranTalk():void
{
	clearOutput();
	author("Night Trap");
	showCiaran();
	clearMenu();
	
	output("He leans his chair onto its back legs again, flicking his hat back to show more of his face. <i>“I'd love a conversation, provided you're the one doing the talking. I hear myself jaw plenty; it's a whole lot more fun to listen to others");
	if (pc.femininity >=65) output(", especially pretty little things like yourself. They don't have a whole lot of those out on the plains");
	output(".”</i>");
	output("\n\nYou frown slightly, asserting that he seems far more interesting than yourself.");
	output("\n\nHe sighs at this, letting his chair return to its appropriate incline before gruffly muttering, <i>“This is why I hate wearing this ridiculous getup. Everybody who walks in thinks I've got something interesting to tell. You know I've had tourists ask me if I'm an outlaw before?”</i>");
	output("\n\nYou chuckle at that, insisting that that is exactly the sort of story you expect he has in spades.");
	output("\n\nHe waves a massive, clawed hand at you in good-natured exasperation. <i>“Alright, I'll humor you for now. What did you want to ask me about?”</i>");
	
	processTime(3);
	ciaranTalkMenu();
}

public function ciaranTalkMenu():void
{
	addButton(0, "Himself", ciaranTalkHimself, undefined, "Himself", "Ask the ausar about himself in general. What does he do around here?");
	addButton(1, "Hobbies", ciaranTalkHobbies, undefined, "Hobbies", "Ask him about his hobbies and interests. Maybe he likes pina coladas?");
	addButton(2, "His Outfit", ciaranTalkOutfit, undefined, "His Outfit", "That's certainly not an outfit you're used to seeing. Ask him why he's wearing it.");
	addButton(3, "Dad Jokes", ciaranTalkJokes, undefined, "Dad Jokes", "You might not think it to look at him, but Ciaran likes lame humor. Sometimes he even tells jokes unsolicited...");
	
	if (flags["CIARAN_VANILLA"] != undefined || flags["CIARAN_LAP"] != undefined || flags["CIARAN_HEAT"] != undefined) addButton(4, "His Scars", ciaranTalkScars, undefined, "His Scars", "You noticed some pretty wicked scars on Ciaran earlier. See if he's got any stories about how he got them.");
	else addDisabledButton(4, "Locked", "Locked", "You don't even know to ask him about this. Try getting to know him more first.")
	
	if (flags["CIARAN_TALKED"] != undefined) addButton(5, "Head Scritches", ciaranTalkScritches, undefined, "Head Scritches", "You're sure that under that rugged, ferocious exterior lies a sweet pooch that likes getting his ears scratched.");
	else addDisabledButton(5, "Locked", "Locked", "You shouldn't do this to strangers.");
	
	//99999 TODO: add more flags for this check for if you ask Kithran or Annebelle about his past once/if they're implemented
	if (flags["CIARAN_HOUSE"] != undefined) addButton(6, "His Past", ciaranTalkPast, undefined, "His Past", "He doesn't really have a New Texas accent. See if he'll tell you where he's from.");
	else addDisabledButton(6, "Locked", "Locked", "You definitely don't know him well enough yet to ask him about that.");

	if (pc.femininity >= 60)
	{ 
		if (pc.lust() >= 33) addButton(7, "Sex", ciaranSex, undefined, "Sex", "Seduce the studly older man. Or more likely get dominated and pounded bareback in front of the whole saloon. Either one.");
		else addDisabledButton(7, "Sex", "Sex", "You aren't turned on enough for sex.")
	}
	else if (flags["CIARAN_DENIED"] == undefined) addButton(7, "Sex", ciaranNoSex, undefined, "Sex", "Seduce the studly older man. Or more likely get dominated and pounded bareback in front of the whole saloon. Either one.");
	else if (pc.hasStatusEffect("Heat")) addButton(7, "Sex", ciaranSexHeat, undefined, "", "Ciaran looks restless. Maybe he'd be willing to make an exception for you as long as you're in heat?");
	else addDisabledButton(7, "Sex", "Sex", "Ciaran already turned you down once, and judging from how he looks at you, you're still not girly enough for his tastes. Don't make it awkward for both of you.");

	/* 99999 assuming Annebelle's meet flag will be ANNEBELLE_MET - Implement if/when Annebelle is
	if (flags["ANNEBELLE_MET"] != undefined || flags["CIARAN_ANNE_MET"]) addButton(8, "Annebelle", ciaranTalkAnnebelle, undefined, "Annebelle", "That silver-haired waitress is adorable, and Ciaran seems to know her pretty well, and regularly. Ask the DILF what he knows about Annebelle.");
	else addDisabledButton(8, "Locked", "Locked", "You can't ask about someone you haven't met!");
	*/

	addButton(14, "Back", ciaranMainMenu, undefined, "", "");
}

public function ciaranTalkHimself():void
{
	clearOutput();
	author("Night Trap");
	showCiaran();

	output("You ask him to tell you about himself.");
	output("\n\nHe places a hand on his rugged chin as he takes a moment to consider his words before answering. <i>“I'm a game warden: I keep the ecosystem in balance around these parts. Now what that mostly means is 'I hunt varmints', but there are other things too. For example, I stop poachers and wildlife smugglers, and I make sure no invasive species can get comfortable here. Cuntsnakes and similar organisms are probably the biggest threats, what with us Treated folks not having the best handle on our libidos.”</i> " + (pc.hasParasiteTail() ? "He gestures to your own parasite. <i>“I hope for your sake you won't be causing any trouble with your, let's say, attachment?”</i> You assure him you wouldn't dream of it, and he continues speaking. " : "") + "<i>“New Texas is also fertile ground for silicon-based organisms, many of which are even worse pests than the varmints.”</i> ");
	if (flags["MET_VARMINT"] != undefined) output("\n\nYou know firsthand how obnoxious and dangerous varmints can be; you don't even want to think about how much worse they could potentially be.");
	else output("\n\nYou're not entirely sure how bad varmints really are, but from the tone of Ciaran's voice you gather that something worse than a varmint would be a terrible pest indeed. ");
	output("\n\nYou nod your head, telling him that sounds like a tough job.");
	output("\n\nCiaran shrugs his shoulders. <i>“It sure beats the hell out of my old job.”</i>");
	output("\n\nWith a grin, you ask him how he thinks can get away with saying something like that and not expect to have to go into detail.");
	output("\n\nThere's a subtle hardening of Ciaran's features when you say that; his frame seems to tense, and his cocksure smile almost slips away entirely as his fiery eyes stare fiercely into your own. Before the situation can get awkward though, he forces a soft chuckle. <i>“That's a story for another time. How about you ask me something else and I act all evasive again?”</i>");
	output("\n\nSeems you've found a sensitive topic. Maybe you should get to know him better before asking again. Or perhaps someone who knew him well would be able to tell you more?");
	
	processTime(3);
	flags["CIARAN_TALKED"] = 1;
	ciaranTalkMenu();
	addDisabledButton(0, "Himself", "Himself", "You just talked about this.");
}

public function ciaranTalkHobbies():void
{
	clearOutput();
	author("Night Trap");
	showCiaran();
	
	output("You ask him what he likes to do for fun.");
	output("\n\nHe shrugs lazily, but his grin widens a bit. <i>“I love hunting, camping, and sometimes fishing. I only like to fish in wild waters though, and there aren't many lakes on New Texas that are safe enough for it anyway. Other than that, same things as most guys on New Texas: working out, having sex, and doing both at the same time. You think these come naturally?”</i> He flexes his arm to show off his muscled biceps, nearly ripping his sleeves in the process. <i>“No, this is the fruit of hours in the gym. Plus, thanks to my job, my cardio's a hell of a lot better than most bulls'. Spending the bulk of your day walking and running through the wilderness will do that for you. 'Cardio kills gains' my ass...”</i> he mutters.");
	output("\n\nYou give him a bemused look, commenting that he seems proud of himself before asking why then it is that you only ever see him in the saloon talking to whores.");
	output("\n\nHe laughs wickedly at your question. <i>“Is that jealousy I hear? There's plenty of Ciaran to go around you know!”</i> The hellhound parts his legs and pats his crotch as he speaks, his enormous shaft already half-hard and straining against its cloth prison.");
	output("\n\nYou blush in " + (pc.exhibitionism() >= 30 ? "arousal" : "embarrassment") + " at his crude display. You respond as soon as you can gather yourself, telling him that no, you're simply curious why he would spend so much time talking to cows when most bulls simply want to fuck them. ");
	if (pc.isTreated()) output(" You can speak from experience there.");
	output("\n\nCiaran feigns a wounded expression, <i>“What, can't a man just talk to beautiful women without trying to get them to spread their legs?”</i> At the dubious look you shoot him he continues, <i>“Look, I enjoy hearing women talk to me. I also enjoy intelligent conversation with them. The only time you can get a decent chat with a cow is in between fucks.”</i> He adopts a slightly wistful expression. <i>“Lots of people write off Treated girls as airheaded and ditzy, so most cows don't get to have too many chats with bulls they don't live with. The thing is, plenty of those cows enjoy hearing a male perspective on their ideas. It also doesn't hurt that lots of those same girls love to repay their suave, rugged, and handsome conversation partners with a good blowjob once they start getting horny again. And hell, even if they're prostitutes they usually won't even charge for it. It's always 'Oh Ciaran, let me show you my thanks for listening to my silly little problems' before they crawl under the table or into my lap. I don't know that there's a better way to finish a pleasant little chat than a good suck or a hard fuck.”</i> ");
	
	if (pc.femininity >=60)
	{
		output("He gives you a meaningful stare after that last sentence, his arms spread in a welcoming gesture as his pheromones practically pour off of him.");
		output("\n\n" + (pc.hasPheromones() ? "Smells" : "Looks") + " like the ausar is propositioning you. Do you want to have sex with him now?");
		
		pc.lust(33);
		clearMenu();
		addButton(0, "Yes", ciaranSex, undefined, "", "");
		addButton(1, "No", ciaranTalkHobbiesNo, undefined, "", "");
	}
	else
	{
		output("\n\nHe eyes you for a very brief moment before shaking his head and smiling ruefully. <i>“I think I'd rather we continue our pleasant little chat for now though.”</i> He winks and smiles at you somewhat apologetically.");
		output("\n\nWell, at least he let you down easy.");
		
		pc.lust(15);
		ciaranTalkMenu();
		addDisabledButton(1, "Hobbies", "Hobbies", "You just talked about this.");
	}
	
	processTime(3);
}

public function ciaranTalkHobbiesNo():void
{
	clearOutput();
	author("Night Trap");
	showCiaran();
	clearMenu();
	
	output("You shake your head, insisting that while that may be the case, your own <i>“pleasant little chat”</i> isn't finished yet.");
	output("\n\nHe rolls his eyes, but he's still smiling. <i>“Well, what else did you want to ask before I bend you over the table?”</i>");
	
	ciaranTalkMenu();
	addDisabledButton(1, "Hobbies", "Hobbies", "You just talked about this.");
}

public function ciaranTalkOutfit():void
{
	clearOutput();
	author("Night Trap");
	showCiaran();
	
	output("You ask him about his outfit. Why would he wear it if he doesn't like tourists asking him about it?");
	output("\n\nCiaran sighs and lets his ears droop a bit before he answers you. <i>“Well, I spend so much time in the saloon that the owner offered me a deal a few years back. She figured that since I was pretty much a fixture of the place, I might as well look the part. As long as I wear this ridiculous getup while I'm in here, I get free drinks. It was pretty great at first, but at this point some of the locals have made a game out of trying to get gullible tourists to believe I'm actually some sort of bandit. I enjoyed it the first year or two, because I'd garner more off-world girls paying attention to me, and I'd get to talk to them or even, hah, give them a little something to remember me by.”</i> He pantomimes placing his hands on a set of hips and makes a few vulgar thrusts with his pelvis before laughing loudly. <i>“The last year or so though I've practically become a tourist attraction, and I can hardly stand it.”</i> His expression turns sour. <i>“You would not believe how hard it is to get some rich asshole from the core to stop asking you questions without resorting to putting your fist through his face. Thankfully Kithran and her girls are always there before I can lose my temper.”</i>");
	//99999 Assuming the flag for meetig Kithran will be KITHRAN_MET
	if (flags["KITHRAN_MET"] != undefined || flags["CIARAN_KITHRAN_MET"] != undefined)
	{
		output("\n\nYou aren't too surprised to hear that. From what you've gathered in your time spent with her, Ms. Kittie seems like she'd be quite skilled at making peace. Between her physique, her Treated instinct to ensure cooperation, and her skill at controlling others, you imagine the Bucking Bronco doesn't see too many fights. When you look back at Ciaran after considering this however, you notice that he's gazing out the window at Ms. Kittie with a blush and an almost bashful look on his face!");
		output("\n\nThe hellhound must have quite a history with the imposing kaithrit madam if she can turn a predator like him bashful!");
	}
	else if (flags["CIARAN_OUTFIT"] == undefined)
	{
		output("\n\nYou raise an eyebrow at him, not sure of who he means.");
		output("\n\nYour hellhound companion's smile returns. <i>“You didn't meet her on the way in? Kithran, or as she calls herself on the clock 'Ms. Kittie.' She's the madam of the Broodmare Bordello, the brothel upstairs.”</i> He jabs his thick, furred thumb upwards twice. <i>“The locals just call it the Cathouse though since almost half the girls who work for her are her daughters. That woman's been in this business since before the Bucking Bronco opened. I'm probably her best john. Kithran, well...”</i> Ciaran pauses, seemingly at a loss for words. You're shocked to see he's actually blushing! When he finds the right words, they all seem to spill out at once. <i>“She reminds me of old times, in the best way. I'll leave it at that.”</i> The normally cocksure ausar suddenly pulls his hat brim down to cover his cheeks, hiding his blush from you!");
		output("\n\nThis Ms. Kittie must be something else if she can turn a predator like Ciaran bashful!");
	}
	
	processTime(3);
	flags["CIARAN_OUTFIT"] = 1;
	flags["CIARAN_TALKED"] = 1;
	ciaranTalkMenu();
	addDisabledButton(2, "His Outfit", "His Outfit", "You just talked about this.");
}

public function ciaranTalkJokes():void
{
	clearOutput();
	author("Night Trap");
	showCiaran();
	
	if (flags["CIARAN_JOKE"] != undefined)
	{
		var variation:int;
		do
		{
			variation = rand(50) + 1;
		}
		while (flags["CIARAN_JOKE"] == variation)
		flags["CIARAN_JOKE"] = variation;
	}
	else 
	{
		flags["CIARAN_JOKE"] = rand(50) + 1;
	}
	
	output("During a lull in your conversation with Ciaran, he cracks a goofy smile and gives you a sidelong stare before breaking the silence. <i>“Do you like jokes, kid?”</i>");
	if (pc.isMischievous() || pc.isBimbo()) output("\n\nYou nod your head enthusiastically and ask Ciaran if he knows any good ones. ");
	else output("\n\nYou shrug your shoulders and tell Ciaran it depends on if the joke is any good or not.");
	output("\n\nHis smile grows even wider at your answer. Oh, you're gonna love this one then.");
	output("\n\n<i>“");
	
	switch(flags["CIARAN_JOKE"])
	{
		case 1: output("Did you hear about the restaurant on the asteroid? Great food, no atmosphere."); break;
		case 2: output("What do you call a fake noodle? An impasta."); break;
		case 3: output("How many apples grow on a tree? All of them."); break;
		case 4: output("Want to hear a joke about paper? Nevermind, it's tearable."); break;
		case 5: output("I just watched a program about beavers. It was the best dam program I've ever seen."); break;
		case 6: output("Why did the coffee file a police report? It got mugged."); break;
		case 7: output("How does a penguin build it's house? Igloos it together."); break;
		case 8: output("I once worked as a can crusher, but I had to quit. It was soda-pressing."); break;
		case 9: output("What do you call somebody with no body and no nose? Nobody knows!"); break;
		case 10: output("I'm not addicted to brake fluid. I can stop anytime!"); break;
		case 11: output("Why did the scarecrow win an award? Because he was outstanding in his field."); break;
		case 12: output("Why don't skeletons ever go trick or treating? Because they have no body to go with."); break;
		case 13: output("What did the buffalo say to his son when he left for college? Bison!"); break;
		case 14: output("What do you call an elephant that doesn't matter? An irrelephant."); break;
		case 15: output("Want to hear a joke about construction? Nevermind, I'm still working on it."); break;
		case 16: output("I bought a pair of shoes from a drug dealer once. I don't know what she laced them with, but I was tripping all day."); break;
		case 17: output("Why couldn't the bicycle stand up by itself? It was two tired."); break;
		case 18: output("What did the grape do when he got stepped on? He let out a little wine."); break;
		case 19: output("I wouldn't buy anything with velcro. It's a total rip-off."); break;
		case 20: output("The shovel was a ground-breaking invention."); break;
		case 21: output("Did you hear about the Terran who invented the knock knock joke? He won the no-bell prize."); break;
		case 22: output("What did the police molecule say to the suspect molecule? I've got my ion you!"); break;
		case 23: output("Never trust atoms. They make up everything."); break;
		case 24: output("A recent survey found that 5/4 of people admit that they’re bad with fractions."); break;
		case 25: output("Two goldfish are in a tank. One says to the other, <i>“do you know how to drive this thing?”</i>"); break;
		case 26: output("I once went to a wedding between two sattelite dishes. The ceremony was nothing special, but the reception was incredible!"); break;
		case 27: output("What do you call a fat psychic? A four-chin teller."); break;
		case 28: output("I would avoid the sushi they serve around here. It’s a little fishy."); break;
		case 29: output("What do you call a pony with a sore throat? A little horse."); break;
		case 30: output("The rotation of New Texas really makes my day."); break;
		case 31: output("I thought about going on an all-almond diet. But that's just nuts."); break;
		case 32: output("What's brown and sticky? A stick."); break;
		case 33: output("I’ve decided I hate elevators. I'm going to start taking steps to avoid them."); break;
		case 34: output("Why do you never see elephants hiding in trees? Because they're so good at it."); break;
		case 35: output("Did you hear about the kidnapping at school? It's fine, he woke up."); break;
		case 36: output("A furniture store keeps calling me. All I wanted was one night stand."); break;
		case 37: output("I used to work in a shoe recycling center. It was sole destroying."); break;
		case 38: output("What's the loneliest kind of cheese? Provolone."); break;
		case 39: output("I don’t play soccer because I enjoy the sport. I’m just doing it for kicks."); break;
		case 40: output("People don’t like having to bend over to get their drinks. We really need to raise the bar."); break;
		case 41: output("I once tried this tropical fruit diet, but I didn't last long on it. It was enough to make a mango crazy!"); break;
		case 42: output("I knew I shouldn't have eaten the seafood platter. Now I'm feeling a little eel."); break;
		case 43: output("I'd like to thank all the sidewalks out there for keeping me off the streets."); break;
		case 44: output("I used to really hate facial hair, but then it really grew on me."); break;
		case 45: output("I really hate jokes about sausage. They're the wurst!"); break;
		case 46: output("This wedding I went to a few years ago was so beautiful. Even the cake was in tiers!"); break;
		case 47: output("What lies at the bottom of the ocean and twitches? A nervous wreck."); break;
		case 48: output("Have you heard of that new band 1023 MB? Yeah, I'm not surprised. They haven't quite got a gig yet."); break;
		case 49: output("Do you know why crabs never donate to charity? They're just shellfish."); break;
		case 50: output("Why can't you have a hand that's more than 11 inches long? Because then it would be a foot."); break;
		default: output("<b>!ERROR WITH RANDOM VALUE :(!</b>");
	}
	
	output("”</i>");
	output("\n\nYou put your face in your hands and groan at the DILF's truly corny joke. He laughs uproariously as much at your reaction as at his own joke. You quickly change the subject before Ciaran can inflict more of his terrible humor on you.");
	
	processTime(2);
	ciaranTalkMenu();
	addDisabledButton(3, "Dad Jokes", "Dad Jokes", "You just talked about this.");
}

public function ciaranTalkScars():void
{
	clearOutput();
	author("Night Trap");
	showCiaran();
	
	if (flags["CIARAN_SCARS"] != undefined) output("Knowing that Ciaran takes some measure of pride in his myriad scars, you ask him to tell you again about how he acquired them.");
	else output("You're not sure if it's a sensitive topic for Ciaran, so you broach the subject of how he acquired his myriad scars as tactfully as you can.");
	output("\n\nInitially you're worried you've offended the older man, as he fixes you with a stern gaze. ");
	if (silly) output("<i>“You wanna know how I got these scars? My father, was... a drinker... and a </i>fiend<i>.”</i> ");
	output("Just when you start to feel uncomfortable though, he breaks out laughing. <i>“I'm just fucking with you, kid. Really gets your imagination running when I act all dodgy about my scars, right?”</i> ");
	output("\n\nYou breathe a sigh of relief before conceding that yes, you were worried after asking him.");
	output("\n\nCiaran chuckles mirthfully at your response, obviously pleased with himself. He stifles his laughter when he notices you aren't laughing though, giving you a more serious answer this time. <i>“Alright, alright, I'm sorry. I'm actually a bit proud of my scars, but they still weren't fun to earn. Cut me a bit of slack if I try to get some enjoyment out of them after the fact.”</i> He shrugs contritely and grins.");
	output("\n\nSatisfied with his apology, you ask Ciaran how he received so many scars when modern medicine often prevents them in the first place.");
	output("\n\nHe wags a furred finger at you while smiling roguishly. <i>“See, you've sort of answered your own question there. </i>Modern<i> medicine might prevent most scarring, but when I received most of these injuries all I had access to was what could be provided in the field. Basically, just first aid stuff.”</i> As he speaks, Ciaran begins undressing from the waist up, quickly exposing his sculpted musculature and the many exotic scars covering his bare flesh. <i>“I served more than a decade in the reconnaissance marines, and I volunteered for all the most dangerous postings and assignments. That usually meant that I was either deep in the wilderness or behind enemy lines, two places where you can't exactly set up a field hospital. Then there were instances where I either wouldn't or couldn't be extracted for what would be considered proper treatment. I always figured that if I could march and hold a gun, I was ready for duty. It didn't matter to me if I had been shot, burned, or bitten.”</i> Ciaran punctuates his last three words by first gesturing to an old bullet wound on his stomach, then turning around to show a plasma burn on his left scapula, and finally a very faded bite mark on his right side. The poses that the hellhound adopts to show off his old wounds have the very enjoyable side effect of displaying his chiseled physique in different states of flexion. ");
	if (pc.isBimbo()) output("You have a hard time focusing on a bunch of old scar tissue when there's so much hunky muscle on display. Is he just doing this as an excuse to flex? Not that you care either way. You fan your flushed face with your hand, trying to pay attention to the ausar DILF's story. ");
	output("He begins dressing himself once more" + (pc.isBimbo() ? ", much to your chagrin," : "") + " before taking a seat again.");
	output("\n\nWell that at least explains why Ciaran's injuries scarred over. Your next question is how he received so many wounds in the first place. Even given the dangerous places he says he served, he should have had personal shields that would at least mitigate serious injury");
	if (pc.race() == "half-ausar" 
		|| pc.race() == "ausar" 
		|| pc.intelligence() >= 15 
		|| flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_BOOKWORM 
		|| pc.characterClass == GLOBAL.CLASS_ENGINEER) output(", especially given that ausar shields are the best available");
	output(".");
	output("\n\nThe expression Ciaran makes when he hears your question is something in between boastful and abashed. He takes a moment to chew over his answer, searching for just the right way to express himself. Finally though, Ciaran responds, <i>“Well it's true that ausar shields are top of the line. That's sort of how I got into so much trouble though. See, I was really, and I mean </i>really<i> reckless when I was younger. I would do the craziest things and take the dumbest risks you can imagine, always relying on my shields to keep me alive. In hindsight it was damn foolish of me, but it's how I clawed my way up from enlisted to officer. Reckless and stupid are highly desired traits in a soldier, and volunteering for things nobody else wanted got me noticed by the brass. Even when I was a first lieutenant, I still went into the field as often as possible. Sending other people into danger when I was sitting in a bunker somewhere just never sat right with me. I always preferred leading from the front. But that's how I ended up with the injury that finally made me accept a medical discharge.”</i>");
	output("\n\nCiaran taps the grievous scar on his neck that he normally conceals with his bandana. <i>“This is the closest I ever came to dying. I was leading a squad on this little asshole of a planet, Noxia VI. It's a death world, barely charted thanks to the acid storms that destroy most probes. We were there to assault a slaver base");
	if (flags["CIARAN_PAST"] != undefined) output(", something you know is a very personal issue to me,");
	output(" and rescue any of the captives we could. We moved on foot to try to take the slavers by surprise, and during the march, I got pounced by a Noxian acid beast. Horrible creature. All of their bodily fluids are acidic, and their drool is the most corrosive of all. It tore through my shields in seconds and took a bite out of my neck. The acid burn it left is all that kept me from bleeding out. The rest of the squad lit that fucker up as soon as they saw it, but they still barely got to me in time. I had to be extracted, and I left service shortly thereafter.”</i> Ciaran ties his bandana around his neck as he finishes his story.");
	output("\n\nYou give Ciaran a sympathetic look, patting his huge, furred hand comfortingly. Although he didn't seem particularly bothered by telling you his story, he still appreciates the gesture, as his tail wags slightly at your touch. You ask him if he has ever considered having his scars removed.");
	output("\n\nThe ausar shakes his head before gesturing to his limbs. <i>“No, I feel like it would be a waste of money that I'd rather just save. You can't see them under all the fur, but I've got some scars on my arms and legs too. The fur was actually white in those places, but I got a nice color restoration mod several years ago as a gift");
	if (flags["CIARAN_PAST"] != undefined) output(" from my daughter. Little Celina said she hated the way it made me look like an old man");
	output(". I've already started to grey again, but that color mod, the Treatment, and a mod for my eyes are the only mods I've ever indulged myself with. I just couldn't pass up something that let me see in the dark now that I'm a game warden. It was something I always wanted, but my new job let me get a tax write off for it. ");
	if (pc.race() == "kaithrit" || pc.race() == "half-kaithrit") output("I was always jealous of you kaithrit and your better night vision, so I just had to jump on the chance to share in that. ");
	output("Even before that though, the Treatment changed my eye color from gold to what you see now.”</i>");
	output("\n\nYou thank Ciaran for explaining his scars to you.");
	output("\n\nHe flashes his usual cocky grin as he responds, <i>“Anytime kid, anytime. Not every day you see scars like these anymore, so I'm always happy to show them off.”</i>");
	
	processTime(8);
	flags["CIARAN_SCARS"] = 1;
	flags["CIARAN_TALKED"] = 1;
	ciaranTalkMenu();
	addDisabledButton(4, "His Scars", "His Scars", "You just talked about this.");
}

public function ciaranTalkScritches():void
{
	clearOutput();
	author("Night Trap");
	showCiaran();
	
	output("Figuring Ciaran can't be treated like a proper puppy too often, you decide to spoil him a bit with some petting. Mischievously, you walk over to the hellhound's seat, careful not to give away your scheme too early. ");
	if (flags["CIARAN_SCRITCH"] == undefined)
	{
		output("\n\nHe casts you a suspicious glance. <i>“What are you doing? Are you up to something?”</i> His ears flick before swiveling towards you like big, furry radar dishes. Those targets are just too tempting to resist.");	
		output("\n\nYou put on a face like butter wouldn't melt in your mouth and innocently explain to the older ausar as you step behind his chair that you'd simply like to take a closer look at his old-fashioned hat.");
		output("\n\nHe scoffs at your explanation. <i>“Yeah, you and every other tourist in this joint. Hell, if you want it so bad kid, how about you wear it for a bit? Maybe the tourists will think </i>you're<i> the outlaw for once.”</i> With that he reaches up to doff his hat before passing it to you. ");
		if (pc.tallness >= 8*12) output("It's a little snug on your head, but that's not what matters. ");
		else if (pc.tallness >= 7*12) output("It's an almost perfect fit for you" + (InCollection(pc.earType, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_DOGGIE, GLOBAL.TYPE_VULPINE) ? "and it even has holes for your ears to fit through," : "") + " but that's not what matters. ");
		else if (pc.tallness >= 6*12) output("His hat's just too big for your smaller head, slipping down over your eyes and blocking your vision, forcing you to wear it at a tilted angle. That's not what matters though. ");
		else output("His hat is comically large on you, making you look like a child wearing their father's hat and forcing you to tilt it back at an extreme angle to hang off your brow, but that's not what matters. ");
		output("What matters is that the ausar has unwittingly cooperated with your plan. ");
	}
	else
	{
		output("\n\nConfident after his previous reaction that he won't be <i>too</i> upset about a repeat performance, you gently tug his hat right off of his head.");
		output("\n\n<i>“Hey, what the hell?”</i> Ciaran tries to reach for his hat, but you simply place it on your own head as you rest a hand comfortingly on his shoulder to prevent him standing up to retrieve his headwear as you explain your actions. You tell him you just think he could use a little more tender affection in his life.");
		output("\n\nHe grumbles a bit, but he doesn't try to stop you. <i>“Geez, if you're so hung up on this I guess I won't stop you. Just give me a little warning next time, kid.”</i>");
	}
	output("\n\nYou take a moment to stare at Ciaran's head and formulate your plan of attack. You can see that he has the usual two anubis-like ears of most ausar poking up through the thick black hair of his head, though the fur of his ears is thicker than is typical of most ausar, and his left ear has been notched by a past injury. Far less typical though are the massive horns poking out of his skull and up through his hair. You're pretty sure you heard somewhere that bovines enjoy having the base of their horns scratched. You'll just have to hope that's true of hellhounds as well.");
	output("\n\nSetting your strategy in motion, you move your fingers to Ciaran's canid ears, alternating between scratching at the bases and gliding your nails up the lengths of those aural attachments. You don't seem to elicit any reaction yet, but you're confident that will change with time. The fur of his ears is ridiculously soft and far finer than the hair on his head. It's a joy just to run your fingertips over the lustrous strands, so you begin lightly pinching the edges of his ears with your fingers to feel both inside and out. Whenever you linger for too long on one spot, the respective ear flicks reflexively.");
	output("\n\nYour DILFy puppy growls a complaint at you the third time this happens. <i>“Hey, those are more sensitive than they look. You're really just itching me when you do that. " + (InCollection(pc.race(), "ausar", "half-ausar", "huskar", "half-huskar") ? "How do you not know this when your ears are the same?" : "") + "”</i> ");
	output("\n\nYou apologize to Ciaran, assuring him that you know what you're doing. To prove your words you increase the intensity of your scratching, compressing his ears and massaging them between your fingers and his skull, truly putting force behind the strokes of your digits. It's barely audible, but you think you hear a stifled groan of pleasure. The older ausar is trying his level best to hide how much he's enjoying being treated like a little puppy, but his struggles only spur you on to spoil him even more. You begin to alternate between scratching those furry aural organs and scratching at his scalp. The response is immediate: Ciaran's tail starts wagging, thumping into his chair at the apex of each swing. You place your mouth right next to his ear and whisper a very important question to him. <i>“Who's a good boy?”</i> It's barely audible, but you know he heard it.");
	output("\n\nThe ausar grunts and tries to respond evenly, <i>“Shut up, kid!”</i> but he stutters a little from the pleasure of your ministrations. Grinning, you decide it's time to enact the last masterstroke of your strategy. Adding in another stop on the circuit your hands have been following around Ciaran's head, you worm your fingertips through your puppy's hair to the base of his horns and begin scratching around their circumference. The hellhound instantly lets out a groan of pleasure, and his tail doubles the speed of its wagging. He's actually panting now, his tongue drooping slightly out of the side of his mouth. You repeat your earlier question, loud enough for those around you to hear this time. <i>“Are you a good puppy? Tell me who's a good little boy.”</i>");
	output("\n\nCiaran closes his eyes in pleasure and hoarsely mutters, <i>“Me.”</i>");
	output("\n\nYou slow down your scratching and rubbing and insist he say it louder before repeating yourself a third time.");
	output("\n\nWith a groan of equal parts frustration, embarrassment, and enjoyment, the helpless DILF responds loudly <i>“I'm a good boy! I'm such a good puppy! Please pet me more!”</i> He rubs his head into your hands, desperate for more stimulation on his animalistic anatomy.");
	output("\n\nYou laugh cheekily and tell him he's right, that surely such a good puppy deserves more petting. You redouble your earlier efforts, and the tall ausar adonis melts underneath you. He's putty in your hands at this point. You're pretty sure you could make him bark for you if you wanted. You decide to go easy on him for now though, instead spoiling the middle-aged puppy for over a quarter of an hour, occasionally telling him that he's a good boy or that he's strong or handsome. You heap him with praise and affection, appreciating the happy sounds he makes or the murmurs of agreement you sometimes receive. When your fingers grow sore from lavishing care for so long, you pat Ciaran on the head a few times with a final <i>“Good boy.”</i>");
	output("\n\nYour puppy sits there dumbly for several seconds after you stop petting him, a dopey smile on his face and his eyes still closed. When he opens them again he's still blushing, but he turns to look at you with a more serious face. <i>“I enjoyed that a lot kid, but you're really pushing your luck. Don't call me a puppy again when you aren't doing that unless you want some serious pain.”</i> The stern warning is undercut by his still rapidly wagging tail, but he does give you an idea. You know now how to make Ciaran want to punish you. Maybe you could do something with this information?");
	if (pc.femininity < 60) output("\n\nWhile you're still considering this, Ciaran takes his hat back from you and pats you on the head. He grins at you for a moment and wags his tail before donning his headwear again and moseying over to the bar, leaving you happy to have made another so happy.");
	else output("\n\nWhile you're still considering this, the DILF stands up and turns bodily to face you before taking his hat back from you and using it to cover the warm kiss he plants on your [pc.lips] from prying eyes. It only lasts a few seconds, but the kiss is tender and affectionate, almost as if Ciaran were trying to return as quickly as possible all of the pampering you've given him in the last fifteen minutes. You swoon, and he breaks the kiss with a smile in place of his usual cocky smirk before placing his cowboy hat on his head snugly over his horns again. He winks at you before moseying over to the bar, leaving you happy to have made another so happy.");
	
	flags["CIARAN_SCRITCH"] = 2;
	flags["CIARAN_TALKED"] = 1;
	processTime(15);
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function ciaranTalkPast():void
{
	clearOutput();
	author("Night Trap");
	showCiaran();
	
	output("You ask Ciaran if he's from New Texas; given his lack of an accent he must surely be from elsewhere?");
	output("\n\nIt's almost too quick to be sure, but you think you see him frown at this question. By the time you notice the change however, he's all smiles again. <i>“Where to begin? ");
	if (silly) output("Between the time when the oceans drank Atlantis and the rise of the sons of Aryas, there was an age undreamed of. And unto this, Ciaran, destined to wear the jeweled crown of Ausarilonia upon a troubled brow. ");
	output("I was one of the first children born on a newly-colonized world on the frontier. It was pretty much on the fringe of civilized space at the time, and even now I promise you've never heard of the place. It's an agricultural world very like New Texas, only a good deal hotter. We dealt with a lot of raids from pirates and slavers over the years.”</i> He pauses briefly, adopting a more serious tone. <i>“I actually lost my mother and siblings to slavers when I was fairly young.”</i>");
	output("\n\nYou're shocked to hear him tell you something so personal when you haven't even asked him directly. It must show plainly on your face, because Ciaran cuts you off when you try to speak.");
	output("\n\n<i>“Don't worry about it. I came to terms with it decades ago. Which brings me nicely to the next part of my story: joining my planet's self-defense force. See, I was damned determined to make sure nobody else went through what I did, so as soon as I came of age I joined the planetary defense force, the marines specifically. After I finished my first tour of duty two years later I had a little angel that I named after my mother, Celina. She's beautiful, just like my mother before her. Actually, I've got some pictures of my little Celina right here.”</i> He pulls a codex out of his comparatively massive pocket and moves to the seat next to your own, opening a few files on the device's screen before presenting it to you. The album in front of you is filled with thousands of pictures and videos of a beautiful girl with long, lavender hair. Her round-pupiled gold eyes, lavender-furred limbs, sharp claws, and two long and incredibly fluffy tails clearly mark her as a kaithrit-ausar hybrid.");
	output("\n\nCiaran's normally hyper-sexual attitude has completely disappeared, replaced with simple paternal pride and affection for his daughter as he shows you images, videos, and holo-clips of Celina. In just a few minutes the enthusiastic ausar takes you through his daughter's life from infancy all the way to her recent college graduation. Strangely, only a small handful of the images after the first dozen or so contain Ciaran, and most bizarrely of all is that none show Celina with anyone who could be mistaken for her mother. In most pictures or videos where you would expect to see the young girl's parents, you instead see an increasingly elderly kaithrit couple, and in some photos you even see " + (flags["MET_BEA_HUBBY"] != undefined ? "Mrs. Reasner and her husband Traven " : "an older, maternal Terran woman with brown hair and a ruggedly handsome, white-haired half-ausar man ") + "with Celina. Ciaran is also absent from many of the photos, and only in the recent graduation shot is he Treated. Eventually Ciaran pockets his codex and continues telling his story, cutting off any chance you may have had to ask further questions.");
	output("\n\n<i>“I re-enlisted when Celina was two. My father had just passed away of natural causes, and I came under even more stress shortly after that. I enlisted this time with the Royal Ausaril Reconnaissance Marines, for the better pay and family benefits. I served with enough distinction to actually work my way up to commissioned officer. You're talking to First Lieutenant Eildean right now.”</i> The older man adopts a mock military pose and a falsely serious expression for a moment before chuckling and relaxing again.");
	output("\n\n<i>“I ended up spending most of my service time in the wilderness, and I absolutely loved it. Sure, it was often a horrifying death world we got sent, but I was getting a chance to see the galaxy, break up slaver rings, and kill pirates, all while getting paid. But a few near-death experiences made me think I might be in the wrong line of work. After the third time I had my guts shoved back into me, I was given a medical discharge. I decided a slightly safer job would be more my speed, so I signed on with a ship called the </i>S.S. Inexorable<i>. ");
	if (flags["BEA_RELATIONSHIP"] != undefined) output("You're surprised to hear a ship you actually know of. You tell Ciaran that you have met the captain of the <i>S.S. Inexorable</i>. The hellhound looks incredibly wistful when he hears that. In his usual evasive manner though, he continues on without an explanation of his reaction.");
	output("\n\n<i>“Those years on the </i>Inexorable<i> were some of the best of my life. I was in a pretty bad place emotionally when I signed on. The captain and her husband really helped me get my shit together; being part of their crew is less like being an employee and more like being a member of their family. They even had me move Celina onto the ship with me, and treated her like she was their own daughter. And apparently they thought I was good at my job. Hell, if I had stayed another few years I would've been a department head.”</i>");
	output("\n\n<i>“If?”</i> you ask. If his time on the <i>Inexorable</i> was as good for him as he said, why did he leave?");
	output("\n\nCiaran sighs deeply at your question, taking a moment to consider his words. <i>“That's really a story for another time. All I'll say is that even though I was working through my old problems, I started developing some new ones, and the only solution to them was to part ways. I left amicably; hell, I played host to the captain's husband, Traven, just last year when he visited New Texas. It was just time for me to go my own way for once. By this point I had a pretty impressive resume, so I was able to use all that training and experience to become a fairly high-class bodyguard in the core worlds. I spent years moving from contract to contract, taking on the jobs nobody else was stupid enough to in hopes of finding something lucrative that would last more than a few months. Ironically, it was when I was between jobs that I ended up getting my big break.”</i>");
	output("\n\nYou crook an eyebrow at that and admit you're curious just what he means.");
	output("\n\nHis cocky grin returns as he responds more than a little smugly. <i>“Well you know the governor of this planet, Governor Tee?”</i>");
	output("\n\nIt's your turn to be smug when you answer " + (flags["MET_BIG_T"] != undefined ? "yes, you do know Big T and were invited to New Texas by him personally. " : "hat though you were invited to New Texas by Big T, you haven't managed to meet him yet.") + "");
	output("\n\nCiaran gives an impressed-sounding whistle, but his next statement makes it seem a bit sarcastic. <i>“Well, not all of us are important enough to get an invitation from the planetary governor. In my case I was just walking down a lonely street one evening when I bumped into a huge human with bull horns and a tail. Keep in mind I was still barely over six feet at the time, so I bounce off this towering human and fall on my tail. While he's still apologizing to me I see a group of people with knives and clubs stepping out of a nearby alley behind him. Firearms were off-limits to civilians on this world, but since I was a bodyguard I was licensed to carry one, and it was damn lucky that I had actually worn my gun that day, because the group starts shouting about how this giant human has been oppressing people and mind-controlling them with poison, and about how they're there to kill him to make a statement about freedom. As soon as they start rushing him, I just throw myself in between him and the assassins. I got stabbed a few times for my trouble; they were just flesh wounds, so I still managed to fend the lunatics off until peace-keepers arrived. As the saying goes, once a marine, always a marine.”</i>");
	output("\n\nYou compliment Ciaran on his heroics " + (pc.characterClass  == GAME.CLASS_MERCENARY ? " and ask how many of the assassins he defeated" : "") + ".");
	output("\n\nThe retired marine holds his hands up in false modesty. <i>“Oh, there were just a little over two dozen of them. I shot half of them. The peace-keepers got there pretty quickly or I would've gotten more; thankfully they all survived since they got medical attention immediately. The important bit though is that their would-be victim turned out to be Big T's cousin. He promised me I'd never have to risk my life again if I didn't want to, and that he'd set me up on New Texas with the Treatment and any job I wanted with enough pay to keep me and my family comfortable for life.”</i>");
	output("\n\nYou flash him a puzzled look, asking if he was at all concerned about taking the Treatment after what he heard his assailants say about it.");
	output("\n\nCiaran throws his head back and laughs at your question. <i>“I don't generally put much stock in what crazy alley assassins say. Now I did look into the Treatment before I took it, and I can't say I'm totally in love with every aspect of it. For example, I like women with something between their ears besides thoughts of cock. When I read more about it though I figured I could work with it. After all, the cows aren't actually stupid. No, they're just... distracted, and you would be amazed at what some of them will do if you promise them the right thing. In the first year I was here I promised a cow I'd arrange a gang-bang in the milking barn for her if she could solve a few calculus equations from one of my old textbooks by hand. She had to study for a few days to learn how to do it, but once she got the hang of it she solved them right away. I had to pay for the cleaning bill in the milk barn, but I think it was worth it. I don't believe the Treatment's a bad thing at all. I certainly wouldn't give it to the whole galaxy, but the only time I've ever been happier since taking the Treatment was when Celina was born.”</i>");
	output("\n\nDespite the grin as he claims this, you can't help but feel that Ciaran is leaving some key details out of this story: namely, he never mentioned anything about Celina's mother, and you didn't see her in any of the pictures or holos he showed you. Perhaps if he trusted you more and you had a bit of privacy, he might open up?");
	
	processTime(8);
	flags["CIARAN_PAST"] = 1;
	flags["CIARAN_TALKED"] = 1;
	ciaranTalkMenu();
	addDisabledButton(6, "His Past", "His Past", "You just talked about this.");
}

/** 99999 if/when Annebelle gets in actually do the function. Relies on too many flags that don't exist yet to make it worth doing now
public function ciaranTalkAnnebelle():void
{
	clearOutput();
	author("Night Trap");
	showCiaran();
	
	
	
	flags["CIARAN_TALKED"] = 1;
	ciaranTalkMenu();
	addDisabledButton(8, "Annebelle", "Annebelle", "You just talked about this.");
}
*/

public function ciaranGetScritched():void
{
	output("You're surprised when Ciaran wordlessly shifts over to the seat next to your own; you're downright stunned when he cups your cheek and kisses you tenderly. You swoon as his free hand moves to your [pc.ear], scratching the delicate skin just behind the protrusion. The DILF continues his surprisingly delicate kiss until you run out of air, continuing to pet your [pc.ear] even when you break the liplock to pant for breath. <i>“Good [pc.boyGirl],”</i> he whispers to you softly, just a hint of a grin on his rugged face.");
	output("\n\nYou blush heavily, finally realizing that he's paying you back for your previous treatment of him, in more ways than one. Ciaran strokes your cheek briefly with his furred hand before moving that same hand to your head. He uses his claws to scratch at your scalp while running his fingers through your [pc.hair] tenderly. You feel tingles run through your body from the pleasurable contact, and you eagerly nuzzle into the hellhound's warm touch. The claws of Ciaran's left hand are extremely sharp, but he strokes you with the greatest finesse, never even coming close to harming you. ");
	if (pc.race() == "kaithrit" || pc.race() == "half-kaithrit") output("You're amazed at how skilled the ausar is at petting you given that you're a [pc.race]; he must have a great deal of experience lavishing affection on kaithrit to be so adept at pampering you. The sharp touch of his claws excites your own instincts as a [pc.race]. This is exactly how another kaithrit would stroke you! The DILF gently tilts your head back with his other hand and begins stroking your chin and throat as he whispers so softly that only you can hear it. <i>“Good kitty. You're such a good little kitty.”</i> His praises make you purr happily. ");
	output("He places both hands on the top of your head and repeatedly runs his fingers through your [pc.hair], tickling your scalp with his claws " + (pc.hasHorns() ? "and massaging the base of your [pc.horns] delightfully " : "") + "as he continues to whisper quiet praises to you.");
	output("\n\nCiaran spends a few minutes massaging and scratching at your head before he starts to slow down. You press eagerly into his hands, but he completely stops his ministrations when you do. The low rumble of his voice breaks you from your reverie. <i>“I only pet good " + (InCollection(pc.race(), "kaithrit", "half-kaithrit", "naleen") ? "kitties" : "puppies") + " for longer than this. If you want me to keep it up, you'll have to tell everybody exactly what kind of " + (InCollection(pc.race(), "kaithrit", "half-kaithrit", "naleen") ? "kitty" : "puppy") + " you are.”</i>");
	output("\n\nYou blink a few times before what Ciaran is asking you to do sinks in. You hesitate momentarily; when you do, he starts to remove his hands from your head. Without thinking, you immediately and loudly declare that you are a very good "+ (InCollection(pc.race(), "kaithrit", "half-kaithrit", "naleen") ? "kitty" : "puppy") +  ", and that you want Ciaran to keep praising you like the little pet you are. Your cheeks burn and you close your eyes in embarrassment when you realize what you've said and just how many people are now staring at you and chuckling, but your words have the desired effect. The ausar redoubles his earlier efforts, scratching affectionately at ");
	if (pc.earType == GLOBAL.TYPE_HUMAN && !pc.hasHorns()) output("all of the most sensitive spots on your head and neck, including several you didn't even know you had");
	else 
	{
		output("your animal anatomy, demonstrating his mastery at massaging your ears");
		if (pc.hasHorns()) output(" and around your horns");
	}
	output(". You involuntarily " + (InCollection(pc.race(), "kaithrit", "half-kaithrit", "naleen") ? "purr" : "sigh") + " in pleasure as your whole body tingles. Ciaran spends the next quarter of an hour pampering you. He scratches and rubs around your [pc.ears] with the skill of a master, he compliments all of your features, and above all else assures you that you are indeed a very good [pc.boyGirl]. ");
	output("\n\nWhen you receive a final pat on the head and one last <i>“Good [pc.boyGirl],”</i> you open your eyes in confusion. As soon as you do Ciaran pulls you by the chin into a warm, passionate kiss, sending you swooning again. His kiss is tender, sensual, and sadly brief. You moan in disappointment as the hellhound separates from you, already feeling a bit lonely without his touch on your body.");
	output("\n\nCiaran smiles at you mirthfully. <i>“Sorry, but that's the same amount of time you gave me. Of course, I've got a lot more experience, so I'm a lot better at this whole petting thing than you are, kid. I think </i>you<i> might even owe </i>me<i> some ear-scratching now.”</i> He punctuates his teasing words with a good-natured wink. You roll your eyes and thank Ciaran for his efforts. He just grins and chuckles deeply as he stands up from his seat and moseys over to the bar. <i>“Anytime, [pc.name]. Anytime.”</i>");
	output("\n\nYou collect yourself and leave the table as well. With skills like that Ciaran could probably work as a masseuse!");
}	

public function ciaranNoSex(talk:Boolean = false):void
{
	clearOutput();
	author("Night Trap");
	showCiaran();
	clearMenu();
	
	output("You feel like a roll in the hay with the handsome hellhound, but as if he had a sixth sense for your arousal his deep voice rumbles out before you can proposition him.");
	output("\n\n<i>“I know what you're thinking there, kid. I can " + (pc.isTreated() ? "smell" : "see") + " it before you even ask. I'll go ahead and save you some trouble: I understand why you'd want to hop on my cock, but I'm just not really interested. I prefer folks who are more on the feminine side, regardless of what's in their pants.”</i> Ciaran tries to soften the blow, but you're still disappointed. ");
	output("\n\nHe notices your expression and smiles more genuinely at you. <i>“Hey, don't feel bad, kiddo. You're on a whole planet of horny bulls and cows who are much less discriminating. I just prefer more feminine types when I can get them. And like I said, there's a whole planet's worth of horny cows I can bend over and fuck any time I want. Maybe if we were the only ones around for a couple days though, then I might interested. It'd be far from the first time,”</i> he says with a wink.");
	output("\n\nAt first you think Ciaran might be joking, but his tone and expression are totally serious. You change the topic before the situation can become awkward, but you're left wondering how exactly you might end up alone with the oddly-attired ausar for a few days. ");
	flags["CIARAN_DENIED"] = 1;
	
	if (talk) ciaranTalkMenu();
	else ciaranMainMenu();
}

public function ciaranSex():void
{
	clearOutput();
	author("Night Trap");
	showCiaran();
	clearMenu();
	
	output("You feel like a roll in the hay with the handsome hellhound, but as if he had a sixth sense for your arousal his deep voice rumbles out before you can proposition him.");
	output("\n\n<i>“" + (silly ? "U wan sum fuk? ;)" : "So you want to fuck?") + "”</i> Ciaran grins at you wolfishly, the bulge in his pants visibly shifting and growing. <i>“Most girls just give me a good blowjob, but I've got a few other ideas for you.”</i> He's already standing up and moving towards you, bulge still growing. He stops when he's standing behind your chair, leaving you in his massive shadow as he places his furred hands on your shoulders. You can feel the power of his muscles through his grip and the claws of his fingers pricking at your [pc.skinFurScales]" + (pc.isNude() ? "" : " through your gear") + "; your body flushes with warmth as his scent and raw masculine presence completely subsume your personal space.");
	output("\n\nIt's clear from his aggressive posture that he will be the dominant partner in any sexual activity here. How will you have him take you?");
	
	//Fingerfuck
	if (!pc.isTaur() && pc.hasGenitals()) addButton(0, "GetFingers", ciaranFingers, undefined, "Get Fingerfucked", "Have the handsome hellhound put those big hands of his to work. He'll probably feed you your cum if you have any.");
	else if (!pc.isTaur()) addDisabledButton(0, "GetFingers", "Get Fingerfucked", "You need genitals to have your genitals fingered.")
	else addDisabledButton(0, "GetFingers", "Get Fingerfucked", "You must not be a taur for this scene.");
	
	//Spanks
	addButton(1, "GetSpanks", ciaranSpanks, undefined, "Get Spanked", "");
	
	//Vanilla
	if (!pc.isTaur()) addButton(2, "Vanilla", , undefined, "Vanilla", "Knock boots with the studly ausar in a more private and intimate setting.");
	else addDisabledButton(2, "Vanilla", "Vanilla", "You must not be a taur for this scene.")
	
	//Lap ride
	if (!pc.isTaur() && pc.vaginas.length > 0) addButton(3, "Lap Fuck", , undefined, "Lap Fuck", "Ride that red rocket and getted knotted extra hard. You <i>/may<i> be biting off more than you can chew.");
	else if (pc.isTaur()) addDisabledButton(3, "Lap Fuck", "Lap Fuck", "You must not be a taur for this scene.");
	else addDisabledButton(3, "Lap Fuck", "Lap Fuck", "You need a pussy for this scene.");
	
	//Heat sex
	if (!pc.hasVagina()) addDisabledButton(4, "Heat Sex", "Heat Sex", "Ciaran can't breed you if you don't have a vagina.");
	else if (pc.isNaga()) addDisabledButton(4, "Heat Sex", "Heat Sex", "This scene isn't compatible with naga body types.");
	else if (!pc.hasStatusEffect("Heat")) addDisabledButton(4, "Heat Sex", "Heat Sex", "You would <i>probably</i> need to be in heat for this.");
	else addButton(4, "Heat Sex", , undefined, "Heat Sex", "An ausar like Ciaran would be very easy to excite in your current needy state. Bend over and offer him the chance to mate with you.");
}

public function ciaranFingers():void
{
	clearMenu();
	if (pc.cocks.length > 0) addButton(0, "Cock", ciaranFingers2, true, "Cock", "You're going to get some fingers in your ass and some of your own cum in your mouth. And you're going to like it.");
	if (pc.vaginas.length > 0) addButton(1, "Pussy", ciaranFingers2, false, "Pussy", "Get your pussy played with!");
}

public function ciaranFingers2(cock:Boolean = true):void
{
	clearOutput();
	author("Night Trap");
	showCiaran();
	clearMenu();
	
	output("You shudder as Ciaran firmly squeezes your shoulders a few times, the smells of distant lightning and rain on hot earth intensifying as his pheromone production ratchets up, conjuring mental images of a powerful summer storm approaching you. The ausar leans down to position his face less than an inch from your head, filling your senses with yet more of his personal scent. When he speaks, it's in a rumbling whisper that you both feel and hear. ");
	if (silly) output("<i>“Do you even knot, bro?”</i> ");
	else output("<i>“I think I'll just strip you down and toy with you a bit. Would you like that young " + pc.mf("man", "lady") + "?”</i> ");
	output("His lips nip at your [pc.ears] as he asks you this, the short hairs of his beard adding a scruffy, masculine texture to the experience. Your cheeks color as you mutter your agreement to his proposal.");
	output("\n\nThe moment you do, Ciaran's powerful arms lift you out of your seat and pull you flush you with his body, his groin pressing into your ");
	if (pc.tallness < 4*12) output("shoulders");
	else if (pc.tallness < 7*12) output("back");
	else output("[pc.ass]");
	output(". He feels incredibly warm, almost feverish compared to a normal human or ausar, and his body heat only adds to the feeling of dominance he has over you right now; you aren't even in full control of your own temperature anymore, your face already flushing from the heat as much as the arousal.");
	if (!pc.isNude()) output("\n\nHe takes his time with your [pc.gear], scattering pieces everywhere as he strips you, lingering far longer than necessary on any interesting bits of anatomy he uncovers. As the DILF finishes denuding you, his ");
	else output("\n\nCiaran's ");
	output("furred hand grabs your chin and forcefully turns your head towards him. Your partner cups your cheek as he leans in to kiss your [pc.lipsChaste], his beard brushing your face. His broad, powerful tongue penetrates your mouth, dominating your [pc.tongue] in a mirror of his domination of your body. Ciaran cups one of your [pc.breasts] and roughly tweaks your [pc.milkyNipple]" + (pc.isLactating() ? ", his bulge swelling with excitement and pressing harder into you when [pc.milk] wets his fingers" : "") + ". He then slides that same hand down your [pc.belly], his sharp claws grazing you just enough for you to know he could hurt you if he wished before arriving at your [pc.groin].");
	output("\n\n");
	if (cock)
	{
		output("\n\nThe ausar's sharp claws dance over your [pc.cockSmallest] before he starts slowly but forcefully jerking your shaft, his thumb teasing your [pc.cockHeadSmallest] at the apex of each pump and slathering pre-cum on your shaft. Within just a short time, you've smeared your member and his fur with your [pc.cumFlavor] pre-seed, and you moan into his kiss when a particularly large spurt of the the stuff is pumped out of you by the forceful hellhound. ");
		output("\n\nCiaran breaks the kiss to chastise you, his low voice practically vibrating through you when he speaks. <i>“Now look what you've done. You've gotten my hand downright filthy. " + pc.mf("Boys", "Girls") + " have to clean up after themselves when they make a mess.”</i> With that he stuffs his digits into your mouth, being careful not to scratch you with his claws. Your own [pc.cumFlavor] scent cuts through the fog of pheromones that have been swamping you as you are forced to suckle your pre-cum off of the fingers you so diligently soiled. Ciaran doesn't content himself with simply filling your maw; he lewdly thrusts his digits in and out of your mouth as if he were finger-fucking your face, not stopping until well after all of his fingers are cleaned of your fluids. ");
		output("\n\nAfter all the steamy kissing and finger sucking, your breathing is ragged. You've barely had a spare moment to think about anything other than the pleasure being forced through your body since the start of this encounter, much less catch your breath. As sweat beads on your face and limbs, Ciaran whispers to you again, <i>“That was very good, kid. Now I'm clean enough for what comes next.”</i> His saliva-soaked fingers stroke your cheek possessively before moving down and around your body. You feel a fluffy texture and sudden pressure at your [pc.asshole], and your eyes go wide as you realize Ciaran is forcing his fingers into your ass. Thanks to the spit you so lovingly applied to the digits, one of those thick appendages batters right into your sphincter, ");
		if (pc.ass.looseness() < 3) output("even in spite of your tightness. The sudden penetration leaves your ass spasming in a vain attempt to keep out the probing digit, but it just ends up making the ausar wiggle his excessively warm finger around even more in an effort to force you open. ");
		else output("your trained orifice gladly accepting something warm to keep it company. The ausar wiggles his digit around in your anus, stoking your passion even higher.");
		output("\n\nYou cry out as Ciaran's warm finger slides in past the knuckle and wiggles inside you, but the real treat comes when he starts slowly thrusting the digit in and out. You rock your [pc.hips] back and forth reflexively, which your partner takes as a sign to speed up his fingering. Easing your clenching " + (silly ? "boipucci" : "sphincter") + " open with his ministrations, Ciaran adds a second thick finger to your [pc.asshole], the heat of his digits sending shivers of pleasure through you. He starts kissing and nipping at your ears and neck, leaving trails of hickeys and love bites" + (!pc.hasFur() ? " for everyone to see" : "") + ". His breath comes hot on your neck, making you sweat even more. ");
		output("\n\nBy now your arousal is almost painful, your neglected [pc.cockSmallest] hard and dripping pre-cum onto the floor. You beg Ciaran to stop teasing you as your hips buck helplessly in an effort to find any sort stimulation for your manhood you possibly can. All you manage to do is drive yourself even crazier, the sensation of the air itself tickling your shaft arousing you to madness.");
		output("\n\nThe ausar DILF lets you thrust into the breeze for a few moments while he continues molesting you, tracing his lips over your face and neck, nibbling your ears, and teasing your ass with his powerful, furred fingers. Just when you feel you simply can't stand it anymore, he growls into your [pc.ear] in a harsh, mocking whisper <i>“Are you sure you can handle the next part? I'm not entirely convinced you can, little " + pc.mf("boy", "girl") + ".”</i>");
		output("\n\nYou loudly cry out that what you can't handle is anymore teasing, and you're more than ready for him to finish you off. You don't care if everyone around can hear or see you; right now you are so horny that release is all you can think of.");
		output("\n\nThis answer seems to be what Ciaran wanted to hear, as he grins wickedly and quietly rumbles out <i>“You asked for it.”</i> You moan happily as his free hand swiftly grasps your [pc.cockSmallest] and begins jerking you off, the action producing loud, lewd sounds and causing more pre-seed to leak into the small puddle you've already created beneath you. Your eyes cross and your [pc.tongue] drops out of your mouth as you feel his fingers suddenly press into your prostate. The dominant ausar alternates the movement of his hands so that each forward thrust of your [pc.hips] has his hand sliding down your dick, and each return has your prostate battering right into those thick fingers buried in your ass. You feel your [pc.balls] tightening and a tensing sensation in your lower abdomen, and you exultantly announce to Ciaran and every other person in the room that you're cumming!");
		output("\n\nYou feel like a champagne bottle shaken until the cork bursts out as [pc.cum] erupts out of you in messy spurts. ");
		if (pc.cumQ() < 3000) output("You groan as you pump rope after rope of [pc.cumColor] seed on the floor, the puddle of pre-cum from earlier tripling in size as [pc.cum] splatters onto your [pc.feet]. Ciaran prolongs your orgasm by milking your prostate " + (pc.hasKnot(smallestCockIndex()); ? "and squeezing your knot " : "") + "throughout. ");
		else output("Your virility tends to make a mess of things, and now is no exception: you groan as you fire off rope after slimy rope of [pc.cumColor] goo, splattering jizz on the floor, your chair, and even the table in front of you as Ciaran milks every ounce you have to give from your prostate. You're left an insensate mess by the time you finally stop cumming. ");
		if (pc.isHerm()) output("[pc.EachVagina] creams itself and everything in your vicinity, leaving your [pc.legs] soaked with copious amounts of [pc.girlCum].");
		output("\n\nRather than stopping or even slowing down once you've finished cumming, the domineering hellhound actually doubles the speed and intensity of his strokes. He fits a third finger into your asshole, ramming it in even through the clenching of your sphincter. You whine from the overstimulation. Your [pc.cockSmallest] is so ridiculously sensitive after such an intense orgasm that it's almost painful. You shout out obscenities and desperately flail your arms back at Ciaran, begging the older man to stop. He simply grins down at you lustily, those sharp teeth bared in the most predatory look you've yet seen from him. Your [pc.legs] spasm for a moment before giving out entirely, but the hellhound easily supports your full weight without missing a beat in his torturous performance, leaving just one more part of your being in his full control.");
		output("\n\nThe already-furious handjob picks up in intensity as Ciaran fits a fourth finger into your spasming [pc.asshole] to join its sinfully thick brothers in raking at your prostate. Even though you just got through an orgasm such a short time ago, your body is forced to dredge up another. Your ");
		if (pc.balls < 1) output("prostate has");
		else if (pc.balls < 2) output("[pc.balls] has");
		else output("[pc.balls] have");
		output(" nothing to give, but it doesn't stop your [pc.cockSmallest] from spasming frantically, an aching feeling of emptiness emanating from your " + (pc.balls > 0 ? "[pc.balls]" : "prostate") + ".");
		output("\n\nWhen your second orgasm finishes, Ciaran finally stops masturbating you. He removes his fingers from your [pc.asshole], leaving your anus agape and feeling as empty as your " + (pc.balls > 0 ? "[pc.balls]" : "prostate") + ". He gathers up the [pc.cum] still clinging to your shaft using his other hand, bringing it to your mouth for you to taste. Your chest is still heaving from the exertion of your back-to-back orgasms, but you dutifully clean the soiled fur of his fingers, your [pc.cumFlavor] taste swamping your tastebuds. Once the ausar is satisfied with your spit-shine, he pops his digits free of your mouth and spins you around before planting a deep kiss on your lips, his tongue plundering your mouth for all the residual [pc.cumNoun] clinging to your gums and teeth. It's a far more passionate kiss than his previous lustful ones, and somehow it almost seems apologetic. It doesn't last very long, and while you're thankful to have a chance to breathe again, you're a little sad it's over.");
		output("\n\nSeeing that your [pc.legs] still won't support you, Ciaran gently sets you down in your chair. Now that you're away from his incredible body heat the room actually feels a bit cold. You cross your [pc.arms] and pull your [pc.legs] into your seat, the sweat covering your [pc.skinFurScales] exacerbating the chilled feeling rising in you. When your paramour notices your plight, he reaches into his pocket and produces an enormous handkerchief. He sets about cleaning off your sweat and sexual fluids, and you're happy to have a bit of his warmth again. You settle back and enjoy your afterglow as the DILF tends to you almost like a father would a child who had spilled something on themselves. When he's satisfied that you're clean and warm enough, he gathers up your [pc.gear] and sets it all on the table in front of you. Only when you stand up to get dressed again do you notice that most of the nearby patrons in the saloon have been watching the two of you. Most of them stop looking when they realize there isn't going to be any more action, but you still feel " + (pc.exhibitionism() >= 66 ? "proud" : "embarrassed") + " that so many people just watched you cum yourself stupid.");
		output("\n\nCiaran breaks your reverie with a genial laugh and a surprisingly gentle pat on the back. <i>“You make for a pretty fun toy, kid. Hopefully I didn't go too hard on you, because I'd love to play with you again.”</i> ");
		output("\n\nYou blush fiercely at the thought, but you tell him that you're going to need some time to recharge before he can play with you again.");
		output("\n\nHe chuckles at your response. <i>“Well while you do that, I'm gonna go find somebody to handle this hard-on you gave me. Take care, kid.”</i> He kisses you on the forehead and bids farewell before walking over to a trio of half-kaithrit whores. You watch him take all three feline girls under his arms and disappear up the stairs with them, the young women giggling the whole way. You can guess what they're about to be doing. " + (silly ? "Playing boardgames of course. " : "") + "You put on the last of your gear before you step away from the table, an employee with a high-tech wet-vacuum disguised as an old-fashioned push broom already beginning to clean up the mess you made.");
	}
	else
	{
		output("\n\nThe ausar's thick, powerful fingers press insistently at your labia, alternating between firm strokes and dextrous teases, gliding up and down the length of your womanhood. When your [pc.girlCum] starts flowing in earnest, Ciaran uses two fingers on your lower lips to spread your pussy wide open while tracing just inside your entrance with his thumb, the thick fur on the digit producing a thigh-soaking sensation as it simultaneously teases the inside and outside of your vagina. ");
		if (pc.hasStatusEffect("Heat")) output("\n\nAs the smell of your [pc.girlCum] wafts up from your crotch, Ciaran breaks from the kiss and inhales deeply. He smacks his lips and aggressively presses his crotch into you. A shudder of excitement runs up your spine as you feel his erection growing to full, throbbing hardness in response to your fertile scent. The ausar draws his hand from your pussy, taking a long whiff of your fluids before lapping them off of his fingers. When he speaks, his tone is almost bestial. <i>“I could smell it before you even walked in. There's no finer smell in the universe. You're in heat. Desperate to be bred.”</i> Ciaran returns his hand to tracing the lips of your desperate pussy as he growls into your [pc.ear], <i>“Pretty young thing like you can't have been in heat too many times. I bet you wandered in here hoping there'd be some experienced older man who knew what to do. Well I know </i>exactly<i> what to do.”</i> His erection throbs against you as he teases you before sealing his lips against your own again.");
		output("\n\nYou try to clench your [pc.thighs] in an attempt to draw him into penetrating you, but the dominant hellhound foils your efforts by wedging one of his thickly-muscled legs between your thighs, the rough fabric of his pants only adding to the already-unbearable teasing of your labia as the cloth quickly becomes completely soaked in your [pc.girlCum]. You moan into Ciaran's kiss and desperately try to buck your hips into his hand, but he denies you by keeping exact pace with your movements so that his hand is always in the same position relative to your [pc.pussy].");
		output("\n\nOnly when you accept the futility of resistance with an agonized moan and a stilling of your [pc.hips] does your older lover finally penetrate you. The fingers that were previously spreading you open suddenly spear into you, each one as thick as the average Terran penis, and far more flexible. ");
		if (pc.vaginalVirgin) output("Ciaran's questing digits stop when they brush your hymen. The ausar gasps softly into your mouth, his eyes opening wide in surprise as he breaks the kiss. <i>“You're a virgin?”</i> he asks, slightly incredulous. You blush in embarrassment and nod your head. He smiles warmly before planting a brief kiss on your heated forehead. <i>“Well, we'll keep it that way for now, but you won't be one for long if you keep letting big, strong, older men grope you in public.”</i> You shut him up with a kiss, and he allows the slight rebellion, continuing on before the situation becomes awkward. ");
		output("His furred extremities explore your tunnel like hounds scenting game, seeking out all of your most sensitive spots and scoring runnels of pleasure into your [pc.pussy] from which your [pc.girlCum] flows freely, ");
		if (pc.wetness() < 3) output("wetting your alien paramour's thigh with more and more liquid lust. ");
		else if (pc.wetness() < 5) output("soaking your thighs and your alien paramour's entire pants leg. ");
		else output("audibly dripping onto your partner's pants and absolutely drenching your legs as it pours out of your [pc.pussy] to puddle on the floor between your feet. ");
		output("Your seasoned partner seems to instinctively know the most pleasurable parts of your anatomy, and he leaves you helplessly juicing yourself as your limp tongue is ruthlessly dominated by his own far more experienced muscle. When Ciaran moves his hand from your cheek to massage your [pc.breasts], you are treated to a new chord of pleasure in the carnal symphony. The wonderful feelings he has been forcing onto you quickly become overwhelming when those clawed fingertips predatorily circle a [pc.nipple] before latching on and tugging, " + (pc.isLactating() ? "forcing your [pc.milk] to flow as freely as your cries and moans harmonize beautifully with the melody of your pleasure. " : " the faint notes of pain harmonizing beautifully with the melody of your pleasure.") + "");
		output("\n\nBetween the frequency of the moans Ciaran forces out of you and the duration of his kisses, you quickly run short of breath. The hellhound never seems to break a kiss to breathe himself; your lips only part when he notices you need air, and even then only long enough for you to gasp in a shallow lungful, every molecule of oxygen you take in polluted with his feral aphrodisiac musk and stoking your passion higher and higher. You feel light-headed as much from hypoxia as from sheer overwhelming arousal.");
		output("\n\nIn spite of all the stimulation you're receiving, you realize that your clitoris has never once been touched. Ciaran has subtly avoided so much as brushing against it with his fur; it would almost be impressive if it weren't so tantalizing! Every time your climax starts to build, you are maddeningly edged by the dominant ausar. Whenever you try to grind your horny puss on the thigh he's using to spread your legs, he pulls it out of reach. Whenever you try to buck your hips into his fingers for deeper penetration he completely removes them from your womanhood to tweak your nipples instead, only returning those devious digits when you still your pelvis again. When you can no longer stand his teasing, you pull your lips away from his and beg him to let you orgasm.");
		output("\n\nHe laughs and growls into your [pc.ear] in a harsh, mocking whisper <i>“Are you sure you can handle the next part? I'm not entirely convinced you can, little " + pc.mf("boy", "girl") + ".”</i> He stops moving his fingers.");
		output("\n\nYou desperately cry out that what you can't handle is anymore teasing, and you're more than ready for him to finish you off. You don't care if everyone around can hear or see you; right now you are so horny that release is all you can think of.");
		output("\n\nThis answer seems to be what Ciaran wanted to hear, as he grins wickedly and quietly rumbles out <i>“You asked for it.”</i>");
		output("\n\nYou mewl happily and a little deliriously as his fingers spring into action again, two of those thick digits penetrating your defenseless womanhood and moving straight for your G-spot. He grinds your clitoris insistently with the palm of his hand while his fingers rapidly plunder your love tunnel, the forceful penetration giving off an incredibly loud and lewd wet sound as your [pc.girlCum] splatters all over his hand. Your eyes roll back into your head as you moan like a whore in heat at the stimulation. After having been edged for so long, this sort of fingering takes only a few seconds to push you over the edge. Your cries of pleasure climax into one continuous howl of ecstasy as you feverishly buck your [pc.hips} into Ciaran's hand as you cream all over his digits, your body instinctively trying to place the source of your pleasure as deeply inside you as possible so that the orgasmically-contracting walls of your pussy can properly milk your partner for seed that just won't come. Ciaran doubles the speed and force of his fingering as you climax, forcing you to squirt helplessly all over his hand and your legs, your [pc.girlCum] coating your respective lower halves. ");
		if (pc.hasCock()) output("[pc.EachCock] spurts seed in spite of being completely left out of the fun. ");
		output("You thrust your hips all throughout your blissful orgasm, maximizing the pleasure of your long-awaited release. As your climax winds down however, Ciaran's forceful masturbation only increases, all five of his fingers coming into play as he fits a third digit into your canal and uses the others to mercilessly pleasure your [pc.clits], pulling back the clitoral hood" + (pc.vaginas.length > 1 ? "s" : "") + " to maximize the sensation.");
		output("\n\nYou moan desperately as you try to clench your [pc.thighs] in an effort to force the hellhound's hand away, but you only succeed in pushing him deeper into your pussy and harder into your button. You plead with the ausar in a mewling tone, your voice breaking from the overstimulation as you beg him to stop teasing you. He merely grins down deviously at you and tugs your [pc.nipples] with his other hand" + (pc.isLactating() ? ", milking you like a farm animal" : "") + " before he silences your cries for mercy with another tongue-filled kiss. ");
		output("\n\nSweat pours off of you from his body heat and the strain of your extended orgasm, and you practically scream into his mouth. Your entire body heaves and shudders from the overwhelming pleasure that courses from your pleasure buzzer" + (pc.vaginas.length > 1 ? "s" : "") + ", and your mind clouds over. When your entire world contracts to the feeling of his hands toying with your body, you finally accept your total helplessness and give in to the mind-shattering ecstasy, cumming a second time.");
		output("\n\n");
		if (pc.isLactating()) output("Your [pc.nipples] actually spray your [pc.milk] as your breasts join in on the full-body orgasm. ");
		output("Your climactic thrashes are restrained like a trout on a line by Ciaran's powerful arms. ");
		if (pc.hasCock()) output("[pc.EachCock] dribbles more seed, too drained from your previous orgasm to do much more than spasm. ");
		output("When your legs join the spasms and kick out from under you, the confident older man doesn't miss a beat, simply shifting his posture slightly to support your frame as if you weighed nothing at all. Those terrible, wonderful fingers of his stay busy inside your contracting cunny throughout, forcing you up to the heights of pleasure only to fall screaming back to earth again. The sensation of orgasm is so all-consuming you think you'll black out, when all at once your body simply goes slack, only giving an occasional twitch.");
		output("\n\nCiaran mercifully removes his hands from your erogenous zones. His fiery orange eyes stare into your own unfocused eyes as he breaks your kiss to sample your feminine essence. He lewdly licks his hand clean, sucking his digits into his mouth and obviously savoring your [pc.girlCumFlavor] taste. When he pops the last finger out of his mouth, he cups your cheek with the same hand and kisses you again, some of your [pc.girlCum] still in his mouth. This kiss is far more passionate than the previous raunchy tongue-fuck you've been smothered with. You are an equal partner in this liplock, and the ausar is far more tender, almost apologetic. It doesn't last very long, and while you're thankful to have a chance to breathe again, you're a little sad it's over.");
		output("\n\nSeeing that your [pc.legs] still won't support you, Ciaran gently sets you down in your chair. Now that you're away from his incredible body heat the room actually feels a bit cold. You cross your [pc.arms] and pull your [pc.legs] into your seat, the sweat covering your [pc.skinFurScales] exacerbating the chilled feeling rising in you. When your paramour notices your plight, he unties the bandana he's wearing around his neck. He sets about cleaning off your sweat and sexual fluids, and you're happy to have a bit of his warmth again. You settle back and enjoy your afterglow as the DILF tends to you almost like a father would a child who had spilled something on themselves. When he's satisfied that you're clean and warm enough, he gathers up your [pc.gear] and sets it all on the table in front of you. Only when you stand up to get dressed again do you notice that most of the nearby patrons in the saloon have been watching the two of you. Most of them stop looking when they realize there isn't going to be any more action, but you still feel " + (pc.exhibitionism() >= 66 ? "proud" : "embarrassed") + " that so many people just watched you cum yourself stupid.");
		output("\n\nCiaran breaks your reverie with a genial laugh and a surprisingly gentle pat on the back. <i>“You make for a pretty fun toy, kid. Hopefully I didn't go too hard on you, because I'd love to play with you again.”</i> ");
		output("\n\nYou blush fiercely at the thought, but you tell him that you're going to need some time to recharge before he can play with you again.");
		output("\n\nHe chuckles at your response. <i>“Well while you do that, I'm gonna go find somebody to handle this hard-on you gave me. Take care, kid.”</i> He kisses you on the forehead and bids farewell before walking over to a trio of half-kaithrit whores. You watch him take all three feline girls under his arms and disappear up the stairs with them, the young women giggling the whole way. You can guess what they're about to be doing. " + (silly ? "Playing boardgames of course. " : "") + "You put on the last of your gear before you step away from the table, an employee with a high-tech wet-vacuum disguised as an old-fashioned push broom already beginning to clean up the mess you made.");
	}
	
	pc.orgasm();
	processTime(30);
	pc.orgasm();
	pc.exhibitionism(1);
	
	IncrementFlag("CIARAN_FINGER");
	pc.createStatusEffect("Ciaran Disabled", 0, 0, 0, 0, true, "", "", false, 2*60);
	currentLocation = "BUCKING BRONCO";
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function ciaranSpanks():void
{
	
	
	
	
	
	
	
	
}
