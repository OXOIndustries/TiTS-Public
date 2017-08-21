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
 *
 * 
 */

public function ciaranAvailable():void
{
    
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
	else
	{
		output("Figuring he could use some entertainment, you mosey over to Ciaran's table. The massive hellhound tips his hat back as you approach and grins at you. <i>“Just had to come back for seconds, huh? I guess every man since me has paled in comparison.”</i>");
		output("\n\nYou roll your eyes at his self-aggrandizement, telling him not to flatter himself too much.");
		output("\n\n<i>“Ah, don't flatter myself '</i>too much<i>' you say. So you admit that I'm deserving of some flattery?”</i>");
		output("\n\nYou chuckle a bit, but you don't otherwise dignify his braggadocious banter. ");
		output("\n\nHe throws his clawed hands in the air good-naturedly, grumbling out in his deep voice, <i>“Well what did you come over here for if not to inflate my ego? Did you want to help inflate my knot instead?”</i> He asks the last question in a seductive tone, a lusty grin on his face.");
	}
	
	ciaranMainMenu();
}

public function ciaranMainMenu():void
{
	clearMenu();
	
	addButton(0, "Appearance", ciaranAppearance, undefined, "", "");
	addButton(1, "Talk", ciaranTalk, undefined, "", "");

	if (pc.femininity >= 60)
	{ 
		if (pc.lust() >= 33) addButton(7, "Sex", ciaranSex, undefined, "Sex", "Seduce the studly older man. Or more likely get dominated and pounded bareback in front of the whole saloon. Either one.");
		else addDisabledButton(7, "Sex", "Sex", "You aren't turned on enough for sex.")
	}
	else if (flags["CIARAN_DENIED"] == undefined) addButton(2, "Sex", ciaranNoSex, undefined, "Sex", "Seduce the studly older man. Or more likely get dominated and pounded bareback in front of the whole saloon. Either one.");
	else if (pc.hasStatusEffect("Heat")) addButton(2, "Sex", ciaranSexHeat, undefined, "", "Ciaran looks restless. Maybe he'd be willing to make an exception for you as long as you're in heat?");
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
		else if (pc.tallness >= 7*12) output("It's an almost perfect fit for you" + (InCollection(pc.earType, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_DOGGIE) ? "and it even has holes for your ears to fit through," : "") + " but that's not what matters. ");
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
	output("\n\nYour DILFy puppy growls a complaint at you the third time this happens. <i>“Hey, those are more sensitive than they look. You're really just itching me when you do that. " + (InCollection(["ausar", "half-ausar", "huskar", "half-huskar"], pc.race()) ? "How do you not know this when your ears are the same?" : "") + "”</i> ");
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