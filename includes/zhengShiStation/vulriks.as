public function showVulriks(nude:Boolean = false):void
{
	showName("\nVULRIKS");
	author("Fr0sty");
}

public function vulriksBust(nude:Boolean):String // Placeholder
{
	return "";
}

public function getVulriks():Creature
{
	return new Vulriks();
}

public function vulriksShopBonus():Boolean
{
	showVulriks();

	if (flags["MET_VULRIKS"] == undefined)
	{
		showName("\nSHADY SHOP");

		output("You step into the shady looking shop and take a look around.");
		output("\n\nIt’s far more private than you expected, more of a single connected room than a storefront, with less than a hundred feet worth of free floor space. Most of the room is filled with stacked metal containers, the vast majority of them sealed tightly shut. The few that are open seem piled full of various forms of contraband and other curious odds and ends.");
		output("\n\nOn the far side of the room, behind a makeshift counter, you see a tall figure, it's face obscured by a hood and a helmet.");
		output("\n\nNo… not a helmet. A mask, and a natural one at that.");
		output("\n\n");
		if (!CodexManager.entryViewed("Anatae")) output("<b>Your Codex beeps to tell you:</b> ");
		output("He’s an Anatae. Seeing one outside of their empire is rare, so why one is standing across from you in a place like this is anyone's guess. Through his mask you can make out he's watching you with two piercing blue eyes.");

		addButton(0, "Approach", approachVulriks, undefined, "Approach", "Speak to the tall stranger.");
	}
	else
	{
		showName("\nVULRIKS'S SHOP");

		output("You enter Vulriks’ chamber, many of the containers in the room have been shuffled around since the last time you were here.");
		output("\n\nThe tall Anat notices you enter and turns his attention away from a datapad to watch you closely.");

		//Plays “Vulriks’ main.”
		addButton(0, "Vulriks", approachVulriks);
	}

	return false;
}

public function approachVulriks():void
{
	clearMenu();
	clearOutput();
	showVulriks();
	processTime(1+rand(2));

	if (flags["MET_VULRIKS"] != undefined) output("Vulriks straightens up as you approach, blue eyes gleaming behind his ivory mask. <i>“Welcome back. Have you anything to sell today?”</i>");
	else
	{
		output("As you move towards the counter, the Anat squares himself up towards you. He’s tall, very tall,");
		if (pc.tallness < 80) output(" towering over you, despite having a slight hunch.");
		else if (pc.tallness < 90) output(" around your height, but his hunch makes it hard to truly tell.");
		else output(" but fails to match your stature, even factoring in his hunch.");
		output(" Both of his clawed hands are flat on the counter in front of him, remaining clearly in view as you approach. Smart, considering where he’s set up shop.");
		output("\n\nReaching the counter, you come face-to-" + (pc.tallness < 80 ? "chest" : "face") + " with him, noticing now the mask covering his whole face is covered in intricate etchings carved into it. Before you can examine them further, the stranger speaks.");
		output("\n\n<i>“You’re new here.”</i>");
		output("\n\nYou eyeball the Anat for a moment, trying to get a read on him. In no small part due to his mask, it’s easier said than done. After a pause you respond <i>\"I am.\"</i>");
		output("\n\n<i>“Hm.”</i> The Anat taps a clawed finger against the counter, his bright eyes narrowing. He seems to be examining you, or rather your gear, quite closely. <i>“I see... Do you have a name?”</i>");
		if (pc.isNice()) output("\n\nDespite the locale, you get the impression the stranger means you no ill will. <i>“[pc.name] Steele. And you are?”</i>.");
		else if (pc.isMisch()) output("\n\n<i>“Depends who’s asking.”</i> You look around the room, not completely at ease, but see no reason to be difficult. <i>“Name’s Steele. [pc.name] Steele.”</i>");
		else output("\n\nYou stay silent for a moment, trying to size up the Anat. He’s armed, but isn't making any threatening moves. <i>“[pc.name] Steele. You?”</i>");
		output("\n\nThe Anat’s eyes give a slight twitch, a sign of recognition. <i>“Steele… interesting. I am Vulriks, and I am at your service.”</i> He bows his head slightly, but keeps his piercing eyes on you. <i>“If you, the great [pc.name] Steele, have anything you would like to sell, I would be most honored.”</i>");
		output("\n\nYou look around the room once more at the containers littering the room. <i>“You’re a merchant?”</i> A few of the open containers are loaded full with various, mostly dubiously legal, odds and ends. You turn back to face Vulriks. <i>“What do you sell?”</i>");
		output("\n\nThe Anat scoffs and waves a single clawed hand in the air, as if shooing away the question. <i>“I do not sell my stock. Not here at least. What is it the Rat said… something about how I do not ‘shit where I eat.’ The expression is lost on me, but I think I understand her meaning. I keep my business here focused.”</i>");
		output("\n\n<i>“If you wish to sell, I will buy. And believe me, I will buy whatever it is you would wish to sell.”</i> Vulriks shifts in place, his bright eyes suddenly round and kind. <i>“So, shall we do business, Per?”</i>");

		flags["MET_VULRIKS"] = 1;
	}

	vulriksMenu();
}

public function vulriksMenu(clearButtons:Boolean = true):void
{
	if (clearButtons) clearMenu();

	if (flags["VULRIKS_BOUGHT"] != undefined) addDisabledButton(0, "Buy");
	else addButton(0, "Buy", buyFromVulriks);

	addButton(1, "Sell", function():void
	{
		shopkeep = new Vulriks();
		sellItem();
	});

	if (flags["VULRIKS_SOLD"] != undefined && flags["VULRIKS_SOLD"] >= 5000) addButton(2, "Talk", vulriksTalk);
	else if (flags["VULRIKS_NOTALK"] != undefined) addDisabledButton(2, "Talk");
	else addButton(2, "Talk", vulriksTalk);

	addButton(3, "Flirt", goSexABlackMarketeer);
	addButton(4, "Appearance", vulriksAppearance);
	addButton(14, "Leave", byeByeShadyDealsMan);
}

public function vulriksAppearance():void
{
	clearOutput();
	showVulriks();

	output("Stepping back, you properly take in the sight of the Anat before you.");
	output("\n\nVulriks is tall, even by the standards of his species. You suspect if he was standing straight he’d be well over 7 feet tall, however he is perpetually hunched over, likely a combination of his alien biology and a lifetime of poor posture.. Like the rest of his kind, his face is covered by a natural mask, a plate of bone-white material, covered with intricate etchings. Hidden just behind his face covering, visible through two natural slits, you see he has two bright and expressive blue eyes, which seem to always be watching you closely.");
	output("\n\nHe keeps his hands on the counter, his flesh rough and dark red, both capped with four white, predatory claws, similar to his mask in composition. The rest of his arms are otherwise covered, long loose sleeves coming down to his wrists. A long black, hooded  cloak hides the rest of his hereditary traits, keeping his head plumage well concealed. Just under the shroud, you can tell Vulriks is wearing some sort of armor, which given his line of work and current residence, seems like a smart idea. Despite being mostly covered up, you can tell he has a lithe and muscular body, although you get the impression he may be out of shape by Anatae standards.");
	output("\n\nHis lower half is harder to judge. You can tell he has two digitigrade legs concealed by his cloak, and when he shifts his weight you hear a pair of heavy boots scuff the floor. On his hip you notice a rather odd blaster, unusually modded, and definitely illegal. Just under his pants you spot a noticeable bulge, telling you the Anat is packing some other serious heat.");

	addDisabledButton(4, "Appearance");
}

public function buyFromVulriks():void
{
	clearOutput();
	showVulriks();
	processTime(1);

	output("Vulriks rolls his eyes. <i>“I do not sell things here, Steele.”</i>");
	output("\n\nYou look around the room at the various containers, all filled with miscellaneous stuff. <i>“Well what about all this then? Isn't it for sale?”</i> ");
	output("\n\nThe Anat taps a clawed digit against the counter, sighing from behind his mask. <i>“Most of this is already spoken for. I merely prepare it here before I move it elsewhere to be transfered.”</i>");
	output("\n\nYou eyeball a particularly interesting-looking shoulder mounted rocket launcher sticking out from an open container. Now you can’t help but ask. <i>“So where exactly do I have to go to buy this stuff then?”</i>");
	output("\n\nVulriks lifts a single finger and waves it in the air. <i>“Tsk, tsk. That I cannot tell you. My clients would be very cross with me if I gave away those particular locations. But I will tell you what…”</i> his blue eyes narrow, and you suspect behind his mask he’s smiling. <i>“If I ever come across something that I think you simply must own, I will hold it for you. Deal?”</i>");
	output("\n\nYou suppose that’s the best you’re going to get...");

	flags["VULRIKS_BOUGHT"] = 1;

	addDisabledButton(0, "Buy");
}

public function vulriksTalk():void
{
	clearOutput();
	showVulriks();
	processTime(1);

	//Will play when “Talk” is selected, and the PC has sold less than 5,000 Credits worth of stuff to Vulriks.
	if (flags["VULRIKS_SOLD"] == undefined || flags["VULRIKS_SOLD"] < 5000)
	{
		output("The tall Anat lifts one of his dark red hands and shakes it. <i>“I’m going to have to stop you there.”</i> Vulriks lowers his hand, his claws tapping on the counter when it lands. <i>“I apologize for not wanting to get, ehh, familiar with you. Trust should not be cheap around these parts. Let’s keep this strictly business for now.”</i> ");
		output("\n\n<i>“Oh.”</i> Despite understanding his position, you still feel the urge to inquire if he thinks that will change. ");
		output("\n\nVulriks laughs, the sound only slightly muffled by his mask. <i>“Tell you what, Per. Deal with me, and we can talk about whatever you want. Let’s think of it as ‘The price to do business’. Deal?”</i>  ");
		output("\n\nSounds reasonable enough.");

		flags["VULRIKS_NOTALK"] = 1;

		addDisabledButton(2, "Talk");
	}
	else
	{
		clearMenu();

		output("<i>“Hm.”</i> Vulriks squints his bright blue eyes for a moment while he thinks. <i>“I guess there is no harm in talking now that we have dealt with each other. Mutual incrimination, and all that,”</i> he chuckles under his breath. <i>“What do you wish to talk about?”</i>");

		flags["VULRIKS_NOTALK"] = undefined;

		vulriksTalkMenu();
	}
}

public function vulriksTalkMenu(prevTopic:int = -1):void
{
	switch (flags["VULRIKS_TALKS_STAGE"])
	{
		default:
		case 5: // Did all talks.
		case 4: //PC must have seen “Posturing” to select
			addButton(4, "His Crime", spillYourMysteriousPastMrWeaponsMan);
		case 3: //PC must have seen “Why here?” and have sex with Vulriks at least once to select
			if (flags["VULRIKS_SEXED"] == undefined) addDisabledButton(3, "Posturing", "Posturing", "You don't know him well enough to ask this question.");
			else addButton(3, "Posturing", vulriksWaxesPoeticAboutDicks);
		case 2: //PC must have seen “Himself” to select
			addButton(2, "Why here?", whatsSoSpecialAboutZSAnatMan);
		case 1: //PC must have seen “Buying Only 1” to elect
			addButton(1, "Himself", isVulriksEvenARealAnat);
		case undefined: case 0:
			addButton(0, "Buying Only", explainToVulriksHowProfitsWork);
	}

	switch (prevTopic)
	{
		case 0: addDisabledButton(0, "Buying Only"); break;
		case 1: addDisabledButton(1, "Himself"); break;
		case 2: addDisabledButton(2, "Why here?"); break;
		case 3: addDisabledButton(3, "Posturing"); break;
		case 4: addDisabledButton(4, "His Crime"); break;
	}

	//Options changes to “Vulriks Main” Options.
	addButton(14, "Back", vulriksMenu);
}

public function explainToVulriksHowProfitsWork():void
{
	clearMenu();
	clearOutput();
	showVulriks();
	processTime(1+rand(2));

	output("<i>“So how is it you can get by only buying things?”</i>");
	output("\n\nVulriks chuckles, seemingly amused by your question. <i>“I promise you, my friend. I sell everything I buy. Just not under the same roof.”</i>");
	output("\n\n<i>“Everything?”</i> You turn to regard one of the open containers, regarding a pile of worn out junk, mostly old ship parts, sticking out from the top. <i>“How exactly do you manage that?”</i>");
	output("\n\nFrom behind his mask you hear something like lips smacking, but you’re not sure what’s exactly going on behind the damned thing. <i>“I will admit, some things stick around much longer than others. But if I’ve learned one thing in this line of work it’s this: trash and treasure are subjective”</i>");
	output("\n\n<i>“I think the expression is ‘One man’s trash is another man’s treasure’.”</i> ");
	output("\n\nVulriks laughs, smacking the counter in a sign of approval. <i>“I like that! Yes! That’s good. Very true. Now, I will admit sometimes, ehh…”</i> Vulriks positions his hand sideways in the air, wiggling it. <i>“I take a loss on something. But I am not worried about profits.”</i>");

	addButton(0, "No Profit?", turnsOutVulriksDoesntWannaMakeDosh, true, "No Profit?", "He doesn't care about profit?");
	addButton(1, "Good For You", turnsOutVulriksDoesntWannaMakeDosh, false, "Good For You", "Encourage the man.");
}

public function turnsOutVulriksDoesntWannaMakeDosh(noProfit:Boolean):void
{
	clearMenu();
	clearOutput();
	showVulriks();
	processTime(1);

	if (noProfit)
	{
		output("<i>“Wait, you don’t care about profits?”</i> You can’t even pretend to hide your confusion. <i>“How the hell do you even stay in business?”</i>");
		output("\n\nVulriks sighs, his blue eyes rolling behind his mask. <i>“I have heard that before.”</i>");
	} 
	else
	{
		output("<i>“It’s nice to meet somebody who isn't all about the bottom line.”</i> Although how he keeps his doors open is a mystery to you.");
		output("\n\nVulriks taps his finger, nodding slightly. <i>“Not many understand my position.”</i>");
	}
	output("\n\nHe continues. <i>“In the Empire, everything we do is for the greater good. Even still, I adhere to that principle; despite my current, situation.”</i> With an outstretched arm, he motions around the room. <i>“Everything I do, all of my dealings, I do for <i>my</i> greater good. For <i>my</i> people, and <i>my</i> Empire.”</i>");
	output("\n\nYou chew on his words for a moment. <i>“How does trading with pirates and selling contraband help your people?”</i>");
	output("\n\nVulriks drops his arm, remaining silent for a moment. <i>“We can discuss that later. It’s, ehh... not an easy topic without context. So, did you have something else you wished to discuss?”</i>");

	if (flags["VULRIKS_TALKS_STAGE"] == undefined) flags["VULRIKS_TALKS_STAGE"] = 1;

	vulriksTalkMenu(0);
}

public function isVulriksEvenARealAnat():void
{
	clearMenu();
	clearOutput();
	showVulriks();
	processTime(2+rand(3));

	output("<i>“Why don’t you tell me a bit more about yourself.”</i>");
	output("\n\nVulriks makes an odd noise, something between clearing his throat and gagging. <i>“Big question. You might want to narrow it down.”</i>");
	output("\n\nYou think for a moment. <i>“Well, it’s rare to see Anatae outside of the Empire, isn't it? Why don’t you start with that?”</i>");
	output("\n\nVulriks stares at you, his blue eyes betraying none of his thoughts. <i>“I suppose that is true…”</i> he sighs, then lifts one of his clawed hands to his throat, scratching it absentmindedly. <i>“Well, I am how do you say… unofficially excommunicated.”</i> ");
	output("\n\nYou’ve never heard of the Anatae kicking out their own. Although you do admit your knowledge on their culture is, at best, limited due to their insular nature. You decide to keep the line of questioning simple. <i>“So they kicked you out? What for?”</i>");
	output("\n\nVulriks groans slightly, his claws tapping on the counter. <i>“No. That’s not quite right. As far as they know I am still very much present, albeit preoccupied.”</i> The Anat stops his digits from tapping, sighing from behind his mask. <i>“I was to die, you see. Sentenced to a lifetime breaking rocks as punishment for my crimes.”</i>");
	output("\n\n<i>“Crimes?”</i> You look the tall man up and down.");
	if (pc.isNice()) output(" <i>“You were a prisoner? That’s horrible…”</i>");
	else if (pc.isMisch()) output(" <i>“Get caught with your hand in the cookie jar or something?”</i>");
	else output(" <i>“You did time? That’s surprising.”</i>");
	output("\n\n<i>“Ehh. It was what it was. I managed to escape, clearly, and chose to leave the Empire,”</i> his tone is somber, almost sad. <i>“I keep in contact with some friends I met during my time imprisoned. They chose to stay, despite the possible consequences. They are still to this day my most lucrative customers.”</i> ");
	output("\n\n<i>“Wait...”</i> You look at the containers around you, thinking on some of the contents you’ve seen sticking out. <i>“You move contraband into the Empire?”</i>");
	if (pc.characterClass == GLOBAL.CLASS_SMUGGLER) output(" You know first hand that isn't just impressive, it’s nearly impossible.");
	output("\n\nVulriks laughs. <i>“Oh yes. My people have a voracious appetite for many things that are typically, ehh, not available.”</i> ");
	output("\n\nYou can’t hide your surprise at the brazen declaration. Vulriks’ operation is far more impressive than you thought. Smuggling and selling goods in the Anatae Empire is no joke, and one of the most serious crimes you can think of. At least as far as the Empire is concerned...");
	output("\n\nFrom behind his mask, Vulriks chuckles softly, clearly sensing your shock. <i>“Surprised? My business started by indulging my people’s vices. I cannot put a price on that, Per. It is the greatest service I can provide for them, despite my current situation.”</i> Vulriks seems content, and if you had to guess you’d say behind his mask he must be smiling. ");
	output("\n\nDespite being bad business, you understand his motivations. About to let the topic drop, you remember something you didn't get an answer about. <i>“You never told me, why were you imprisoned in the first place?”</i> ");
	output("\n\nVulriks doesn't answer at first, his blue eyes narrowing behind his mask. <i>“Ehh, a topic for another time. Another tale that needs, the proper… context. Did you have something else you wanted to discuss?”</i>");

	if (flags["VULRIKS_TALKS_STAGE"] < 2) flags["VULRIKS_TALKS_STAGE"] = 2;

	vulriksTalkMenu(1);
}

public function whatsSoSpecialAboutZSAnatMan():void
{
	clearMenu();
	clearOutput();
	showVulriks();
	processTime(1+rand(2));

	output("<i>“So why set up shop in a place like this?”</i>");
	output("\n\nVulriks rolls his eyes. <i>“Where else could I conduct my business? When dealing with pirates, one must be where the pirates are.”</i>");
	output("\n\n<i>“Fair enough…”</i> you cede the point, but remain unsatisfied with this answer.");
	output("\n\nAs if reading your mind, Vulriks offers some clarification. <i>“I realize this place is rather… ehh…”</i> he searches for the correct word a moment, his blue eyes wandering. <i>“Unstable. But it’s the best for my needs. Sure, I live under the constant threat of being stabbed and robbed, but I fear for the fate of the poor soul who does this to me.”</i>");
	output("\n\nYou eyeball the blaster on his hip. <i>“You must think pretty highly of yourself.”</i>");
	output("\n\nFollowing your gaze, Vulriks chuckles. <i>“You misunderstand, Steele. I am not the danger, the gangs are.”</i>");
	output("\n\nVulriks leans in close, elbows on the table. <i>“I am a major source of income for the pirates, you see. Sure, much of their stolen wares they can pawn off anywhere. But whom else would buy a stolen box of pornography or a stretched out well worn pair of panties?”</i> Vulriks raises a hand, waving a single long digit in the air. <i>“Only me. So, the gangs leave me alone. And if any try to bother me, well, let’s just say a few teeth get knocked loose.”</i>");
	output("\n\nYou nod, understanding the situation. <i>“So… what kind of price do you get for stretched out panties in the Empire?”</i>");
	output("\n\nVulriks chuckles and pulls himself off the counter. <i>“Depends on the musk.”</i>");

	if (flags["VULRIKS_TALKS_STAGE"] < 3) flags["VULRIKS_TALKS_STAGE"] = 3;

	vulriksTalkMenu(2);
}

public function vulriksWaxesPoeticAboutDicks():void
{
	clearMenu();
	clearOutput();
	showVulriks();
	processTime(2+rand(2));

	output("<i>“So what was with all the posturing before?”</i>");
	output("\n\nVulriks cocks his head. <i>“What do you-”</i> suddenly his blue eyes go wide. <i>“Oh! You mean… ah, yes, well it is a force of habit you see.”</i>");
	output("\n\n<i>“Something from your prison days?”</i> You let out a coy smile, hoping the jest will land.");
	output("\n\nAn eye roll tells you the Anat gets the joke, but doesn’t particularly find it funny. <i>“From my freedom days. Back home, females are in short supply, so males must take what we can get. Not to mention we Anatae are always… passionate lovers.”</i>");
	output("\n\nVulriks lifts himself up to his full height, reminding you just how much he slouches. <i>“So, a bit of ritual decides the order of things. Since I am so, ehh, gifted, I rarely found occasion to dine on pillow.”</i>");
	output("\n\n<i>“Dine on what?”</i> You’re almost tempted to check to see if your translator got that right.");
	output("\n\nVulriks blinks. <i>“Is that not the phrase?”</i>");
	output("\n\nYou can’t help but chuckle, understanding what he was trying to say. <i>“It’s close… who taught you that one?”</i>");
	output("\n\n<i>“A member of a local gang. She was an enthusiastic pillow eater, despite being quite endowed herself.”</i> Vulriks chuckles and shakes his head. <i>“Truth be told. I think I spend more intimate time with those with pricks than without.”</i>");
	output("\n\nYou ask the Anat why he thinks that is.");
	output("\n\nVulriks shrugs. <i>“We have an expression back home. ‘Pussy is costly, but cock is free’. Since I’m not too picky, I think it just so happens that more cock comes to my door than pussy.”</i>");
	output("\n\nYou roll your eyes, but do see some wisdom in the proverb.");

	if (flags["VULRIKS_TALKS_STAGE"] < 4) flags["VULRIKS_TALKS_STAGE"] = 4;

	vulriksTalkMenu(3);
}

public function spillYourMysteriousPastMrWeaponsMan():void
{
	clearMenu();
	clearOutput();
	showVulriks();
	processTime(1);

	output("<i>“So, you ever gonna tell me what you did to get locked up?”</i>");
	output("\n\nVulriks considers your question, his clawed digits tapping the counter. <i>“I was left to hard labor, not so much locked up.”</i> ");
	output("\n\nYou wave you air in the air dismissively. <i>“Right, right. I remember. But you didn't answer my question.”</i> ");
	output("\n\nSilence hangs in the air for a moment.");
	output("\n\n<i>“Fine. I will tell you, so long as you promise to, ehh, keep an open mind. Can you do this?”</i>");

	addButton(0, "Promise", andTheShadyAnatPastIiiiiisss, true);
	addButton(1, "Can't Promise", andTheShadyAnatPastIiiiiisss, false);
}

public function andTheShadyAnatPastIiiiiisss(promised:Boolean):void
{
	clearMenu();
	clearOutput();
	showVulriks();
	processTime(1);

	if (promised)
	{
		processTime(2);

		output("<i>“Ah, thank you…”</i> Vulriks shifts his weight from one foot to the other. <i>“Well, how do I explain…”</i>");
		output("\n\nWatching his body language closely, you can tell your tall friend is uncomfortable as he searches for an explanation. He fidgets uncontrollably, scratching the side of his neck absentmindedly with his clawed digits. ");
		output("\n\n<i>“Back home, in the Empire, there is, ehh, pressure for young…”</i> Vulriks’ blue eyes lock onto yours, forcing him to pause. ");
		output("\n\nA few long heartbeats pass.");
		output("\n\nSuddenly, Vulriks groans and rolls his eyes. <i>“Okay, okay. Plainly then. I was charged with a few things, but the main crime was kidnapping, but!”</i> Vulriks waves his clawed hands in the air. <i>“But! I assure you this was not the case! It was not really kidnapping you see...”</i>");
		output("\n\n<i>“Hm.”</i> As far as you can tell he’s telling the truth, and since you promised not to judge, you let him explain himself.");
		output("\n\nVulriks clears his throat, and behind his mask you hear an odd smacking sound. <i>“It was my daughter, you see.”</i>");
		output("\n\nYou can’t hide your surprise. <i>“You have a kid? How come you never mentioned it before?”</i>");
		output("\n\nThe tall Anat chuckles half heartedly. <i>“I have many children. A stud like me? Families lined their daughters up for even a chance at my genes.”</i> Vulriks shakes his head and continues. <i>“Falia was… different from my other children. She was bright, wise in ways adults nary are. While the rest of the clutch she was born with were still wetting themselves, she was already learning to read. She was... not meant for the life she was to live.”</i>");
		output("\n\nVulriks lets a moment of silence pass before continuing.");
		output("\n\n<i>“My other daughters, dutiful as they were, would do whatever the Empire would ask of them. Falia wanted… more. Deserved more, really. She was not content to be a broodmare like her half sisters, or her mother, or her mother’s mother. So when she asked me for help…”</i>");
		output("\n\nYou finish the thought for him. <i>“You tried to help her escape the Empire.”</i> ");
		output("\n\nBehind his mask, you see Vulriks' bright blue eyes wander. <i>“I failed. We were found out and captured. I am likely a grandfather many times by her now...”</i> Vulriks lets out a heavy sigh, rolling his broad shoulders a few times. <i>“This was my crime, Steele. I hoped to make my child’s dream come true. For her to be free and live her life as she wanted.”</i>");
		output("\n\nVulriks seems to deflate before your eyes, slouching more than he normally does. <i>“This is all I wish to say on the topic, so hopefully your curiosity is sated.”</i>");
		output("\n\nRespecting his wishes, you decide to move on.");

		if (flags["VULRIKS_TALKS_STAGE"] < 5) flags["VULRIKS_TALKS_STAGE"] = 5;
	}
	else
	{
		output("<i>“Then I cannot tell you.”</i> Vulriks tilts his head, his eyes narrowing behind his mask. <i>“I would rather have you suspect the worst of me than for me to share and be judged.”</i>");
		output("\n\nYou understand his position. <i>“Fair enough.”</i>");
		output("\n\nVulriks’ eyes soften. <i>“Now then, was there something else, Steele?”</i>");
	}

	vulriksTalkMenu(4);
}

public function goSexABlackMarketeer():void
{
	clearMenu();
	clearOutput();
	showVulriks();
	processTime(1);

	if (flags["VULRIKS_SEXED"] == undefined)
	{
		output("Turning on the ol’ Steele charm, you feed the Anatae your best line, seeing if he’s interested.");
		output("\n\nVulriks eyes narrow. <i>“Pardon me. I am still getting familiar with courtship outside of the Empire. Are you hitting on me?”</i>");
		output("\n\nBeaming, you move in closer, leaning against the counter. <i>“Yeah. I kinda am.”</i>");
		output("\n\n<i>“Ah.”</i> Vulriks straightens up slightly, rising up a few inches taller. <i>“Very well. I will accept your proposed courtship on the conditions we decide on things how I am accustomed. Do you accept?”</i> ");
		output("\n\nYou raise your brow, intrigued but lost. <i>“And that is?”</i>");
		output("\n\nVulriks chuckles, his blue eyes narrowing. <i>“The bigger of us takes the smaller.”</i>");
		output("\n\n<i>“Oh.”</i>");
	}
	else
	{
		output("Vulriks tilts his head and chuckles. <i>“You want more, Per? Ah, you remind me of my youth in the Empire. Very well. Same terms as last time, do you accept?”</i>");
		output("\n\nBefore your eyes Vulriks starts to lift up, reminding you how large he truly is.");
	}
	output("\n\nDo you accept his terms?");

	addButton(0, "Accept", swordfightingWithVulriks);
	addButton(1, "Refuse", onSecondThoughtVulriks);
}

public function onSecondThoughtVulriks():void
{
	clearMenu();
	clearOutput();
	showVulriks();
	processTime(1);

	output("<i>“A pity.”</i> Vulriks seems to noticeably deflate back to his normal, slouched height.");
	output("\n\n<i>“Do you have other business with me?”</i>");

	vulriksMenu();
	addDisabledButton(3, "Flirt");
}

public function swordfightingWithVulriks():void
{
	clearMenu();
	clearOutput();
	showVulriks(true);
	processTime(1+rand(2));

	addButton(0, "ERROR", getOutOfVulriksShittyShop);

	output("Vulriks lets out a low chuckle. <i>“Excellent.”</i> Slowly, the tall man reaches for his hood, taking ahold of it with his clawed hands and pulling it back.");
	output("\n\nFreed from his hood, thick gray plumage unfurls, an impressive crown that adds nearly another foot to his already impressive height. <i>“Forgive the, ehh, poor color. Age and hard living have taken it from me. But I assure you,”</i> the tall Anat seems to grow before you, pulling himself up to his full height, the crown on his head nearly threatening to hit the ceiling. <i>“I am still more man than most.”</i>");
	output("\n\nSomething about the Anat’s body language changes. He seems to flex his muscles, trying to show off. No, not show off… he’s trying to intimidate you. Not willing to back down, you stand as straight as you can, flexing in turn.");

	if (pc.tallness < 90)
	{
		output("\n\n<i>“Impressive Steele, but not impressive enough. It looks like I am the Alpha between us.”</i>");
		output("\n\n" + (pc.tallness < 80 ? "You saw this coming before you even squared up." : "You can’t help but frown. It was close, but you can’t deny the Anatae does have some height on you still.") + " Relaxing your muscles, you shrink down before the larger man.");
		output("\n\n<i>“I win.”</i>");

		addButton(0, "Next", notBigEnoughToFuckTheSpaceBlackMarketeer);
	}
	else if (pc.isTaur() || !pc.hasCock() || pc.shortestCockLength() > 30)
	{
	
		output("\n\n<i>“Hm…”</i> Vulriks looks you up and down closely. <i>“This is unusual for me… I am not normally beaten like this. However…”</i> Vulriks chuckles, his eye narrowing. <i>“Physiology as it is, I think may have to veto your win.”</i>");
		if (pc.isTaur()) output("\n\nGlancing back at your hindquarters, you understand why that might be necessary, and cede control to the Anatae.");
		else if (!pc.hasCock()) output("\n\nRolling your eyes, you understand Vulriks concern. Although you might need to educate the man about the pros in favor of hardlight cocks.");
		else output("\n\nYou should have seen this coming. A dysfunctionally large dick isn't much good for something like this after all.");
		output(" Relaxing your muscles, you shrink down before him.");
		output("\n\n<i>“I win.”</i>");

		addButton(0, "Next", notBigEnoughToFuckTheSpaceBlackMarketeer);
	}
	else
	{
		output("\n\n<i>“Hm.”</i> Vulriks looks you up and down closely, something of a growl escaping from behind his mask. <i>“Bah! Do you think I will accept this so easily?”</i> Vulriks drops his hands to his belt, starting to unfasten it hastily with his clawed digits. <i>“I do not bow to just anybody, Steele. If you want to taste victory, you must put it all out on the table.”</i>");
		output("\n\nBefore you can question him, Vulriks pulls his pants wide open and drops his freed cock down on the counter between you two. <i>“There. All on the table.”</i>");
		output("\n\nHe’s hung. <i>Really hung</i>. His alien cock is erect already, the ritual of intimidation seemingly enough to excite the Anatae to his peak. Just eyeballing it you can tell it’s near two feet long. Despite its impressive length, it’s oddly thin, seemingly more in line with what you would expect for a cock half its length. Despite that, it’s still butt achingly girthy, and capped with a particularlly fat and nubbed cockhead. ");
		output("\n\n<i>“Well? On the table, Steele.”</i>");
		output("\n\nWith a sigh, you pull free your [pc.cockShape " + pc.longestCockIndex() + "] cock and lay it down beside Vulriks’.");
		if (pc.longestCockLength() < 21)
		{
			if (pc.longestCockLength() < 10) output("\n\nVulriks chuckles, his blue eyes narrowing. <i>“Ah, why even try, Steele? Surely you knew you were not virile enough to compete?”</i>");
			else output("\n\nVulriks looks down and shakes his head. <i>“Seems I win this round Steele. You’re impressive, but you cannot match me.");
			output(" Vulriks pulls his cock off the counter and takes a step back.");
			output("\n\n<i>“I win.”</i>");

			addButton(0, "Next", notBigEnoughToFuckTheSpaceBlackMarketeer);
		}
		else
		{
			if (pc.longestCockLength() == 21) output("\n\n<i>“A tie?! Impossible.”</i> Vulriks snaps his head up, his eyes wide.");
			else output("\n\n<i>“This… this cannot be…”</i> Vulriks seems to deflate slightly.");
			output(" <i>“Between this and your height…”</i> he pulls himself off the counter, growling.");
			output("\n\n<i>“You win...”</i>");

			addButton(0, "Next", youWinTheAnatDickMeasuringContest);
		}
	}
}

public function notBigEnoughToFuckTheSpaceBlackMarketeer():void
{
	clearMenu();
	clearOutput();
	showVulriks(true);
	processTime(1+rand(2));

	output("Vulriks moves away from the counter, still standing proud and tall. <i>“Hands on the counter. Now.”</i>");
	output("\n\nYou hesitate a moment, considering his words.");
	output("\n\nVulriks growls. <i>“Now!”</i>");
	output("\n\nHis tone is powerful and commanding, and before you know it your palms are flat against the cool surface of the counter. A shiver runs down your spine, the sudden forcefulness of the Anatae both surprising and titillating you.");
	output("\n\nThe large Anat starts to move, each heavy step landing powerfully against the floor. He stalks out from behind the counter, moving past you towards the entrance. You try to keep an eye on him as he walks, but find it near impossible to keep a line of sight with your hands on the table and the containers in the room obstructing your view. ");
	output("\n\nAfter a moment the sounds of the boots stop, followed by the sound of the door locking. ");
	output("\n\n<i>“I do not wish to be disturbed.”</i> The footfalls resume, heavy against the floor and drawing nearer. Each near stomp echos through the air as he gets closer to you, seemingly shaking the whole room with each thunderous step. ");
	output("\n\nNo. Not the whole room. Just you. You’re the one shaking, the anticipation now palpable.");
	output("\n\nWhen the sounds stop, you know he’s close. You <i>feel</i> he’s close. He stays silent behind you. Why hasn't he said anything? You turn your head to regard him.");
	output("\n\nA sudden touch makes you nearly just out of your [pc.skinFurScales], and you let out an involuntary cry. Vuriks’ hands, powerful and clawed, are wrapped around your [pc.hips] tightly, holding with an intimidating amount of power. ");
	output("\n\n<i>“Jumpy?”</i> Vulriks tone is cool and composed. <i>“Do not fear. I will take very good care of you, small one.”</i> Slowly, the Anatae eases his grip and moves his hands with focus and precision, pulling aside your gear and better exposing your vulnerable rear end to him.");
	output("\n\nSomething rustles behind you. Before you can glance back, something hard and spiky prods against your ass.");
	output("\n\nYou let out a small cry, trying to turn around to see what’s happening.");
	output("\n\nVulriks barks an order. <i>“Face forward!”</i>");

	if (pc.hasVagina())
	{
		output("\n\n<i>“Hm…”</i> Vulriks lifts a hand from your hip, followed by the sound of claw tapping against mask. <i>“Choices… been awhile since I have had one… I will allow you to choose. One last ounce of freedom... before I take you. Ass or Pussy?”</i>");
		addButton(0, "Ass", vulriksDoingYourButt);
		addButton(1, "Pussy", vaginaRouter, [vulriksDoingYourVag, getVulriks().cockVolume(0), 0, 0]);
	}
	else
	{
		output("\n\n<i>“Ah yes. There we are.”</i> You hear him chuckle behind you. <i>“I am going to take you now. Your ass, as they say, is mine.”</i>");
		addButton(0, "Next", vulriksDoingYourButt);
	}
}

public function vulriksDoingYourButt():void
{
	clearMenu();
	clearOutput();
	showVulriks(true);
	processTime(15+rand(11));

	var vulriks:Creature = getVulriks();

	output("Vulriks seems to purr behind you. <i>“Prepare yourself.”</i> ");
	output("\n\nThe unseen cock against your ass seems to press harder, nubbed with torturously sinful spikes. The thought of it in your ass scares you, but that fear is outweighed by lascivious curiosity.");
	output("\n\nThe Anats hands move along your [pc.hips] towards your backside, roughly pulling apart your cheeks.");
	if (pc.analVirgin) output(" <i>“Ahhh… interesting. I am to be your first, no?”</i>");
	output(" One of Vulriks’ clawed hands leaves your hips. <i>“You are small. Meat like mine is not meant for the likes of you. If I am to not break you…”</i> you hear something pop open, <i>“...steps must be taken.”</i>");
	output("\n\nLiquid pours down onto your hole, cold against your sensitive pucker. You jerk and shiver, but Vulriks holds you tight in place with one powerful clawed hand. <i>“Tsk. Easy now, little one. Do not fight my gift. Unless you want me to break you.”</i>");
	output("\n\nA moment later the liquid stops, and you hear Vulriks throw something aside. You feel him inch closer, the heat of his cockhead against your anxious hole. <i>“Ready?”</i> he asks. You nod and quiver, hungry to feel his alien manhood inside of you. <i>“Eager little beta, aren't you? Don’t worry, I will treat you right.”</i>");
	output("\n\nVulriks moves forward, his cockhead pressing firmly against your tightness. With a grunt, Vulriks spears himself in, his fat alien cockhead penetrating you in one powerful motion. A gasping moans escapes your [pc.lipsChaste] as your fuckhole widens to accept his monster cock. His cockhead is massive, stretching your hole out, while his spiked nubs sinfully torture your inner walls.");
	pc.buttChange(vulriks.cockVolume(0));
	output("\n\n<i>“Hm, that’s it,”</i> Vulriks purrs. <i>“My cock feels right at home inside. You are quite the buttslut, aren't you?”</i> Before you can respond, Vulriks thrusts forward, roughly shoving more of his prodigious length inside of your quivering ass. Any words you had evaporate, replaced by a deep guttural moaning. You understand now why he insisted on the lube, the threat of his fat cockhead asolutely buttbreaking.");
	output("\n\nHis hard, massive cock pounds away, sending shivers of bliss rippling throughout your body. Inch after agonizing inch slides in deeper and deeper with each of his thrusts, pushing the limits of your now well stretched out hole. Despite his cockhead being so deliciously fat, the rest of his cock is mercifully thinner. You let out another lusty moan, the feeling of the alpha’s cock making your body burn with depraved pleasure. You feel nearly a foot of hard dick deep in your ass, and the thought of even more hot cockflesh still to come makes your knees weak.");
	output("\n\nLooking back at your well endowed lover, you see his blue eyes are intense and focused. Noticing your gaze, he tilts his head and chuckles. <i>“I bet it is not everyday you get fucked by a stud such as myself. You love this do you not? Being fucked by a real man.”</i> ");
	if (pc.hasGenitals())
	{
		output("\n\nVulriks releases one of your hips, slipping his hand around to your front.");
		if (pc.hasCock()) output(" Roughly, Vulriks grabs ahold of your [pc.cockNounSimple]. <i>“You love it so much don’t you? Why do you even need something like this?”</i> His hand starts to move, stroking your shaft with his powerful digits. <i>“Stay with me. Stay with me and I will fuck you like this every night. You will never need to use this tiny prick again. And you’ll never want to.”</i>");
		else output(" Roughly, Vulriks claps his hand down on your soaking cunt. <i>“Do you prefer it in the ass? Or did you just not want me to breed you?”</i> With practiced precision, Vulriks starts to rub your cuntflesh, pressing hard against your sensitive and engorged clit. <i>“Stay with me. Stay with me and I will fuck your ass and your pussy both to your heart’s content. I will breed you like only a true stud can. And you will gratefully take my seed.”</i>");
	}
	output("\n\nWith more than a little aggression, Vulriks bucks his hips, forcing more of his near impossible length into your already nearly filled anus. You let out a powerful cry as he invades you, owning your ass in a way it’s never been owned. You bite your lip as the sheer euphoria makes your fingers and toes curl. You’re close now, moments away from orgasmic bliss with most of Vulriks’ cock deep in your hole" + (pc.hasGenitals() ? ", and his hand " + (pc.hasCock() ? "pounding away on your prick." : "fingering away at your clit.") : "."));
	output("\n\nBehind you, Vulriks’ breathing starts to quicken. You feel his cockhead start to pulse inside of you, threatening to pop at any moment. The idea of him cumming so deep inside sends a sinful shiver down your spine. Your excitement boiling over, you feel the heat in your ass explode, sending a shockwave of orgasmic pleasure throughout your body. Moaning like a holovid whore, every nerve in your body ignites off at once, alive with sensation as Vulriks continues to rail your overstuffed ass.");
	if (pc.hasCock()) output("Down below you feel your " + (pc.hasCock() ? "cock melt, exploding in Vulriks’ hand, painting the side of his counter with your sticky [pc.cumColor] cum." : "cunt burn, quivering in Vulriks’ hand, wetness oozing uncontrollably between his fingers."));
	output("\n\nBehind you, Vulriks lets out a primal groan, his massive monster cock finally exploding. His firehose of of a shaft pumps you full of thick, hot cum, his cockhead throbing inside of you as he fills you up to the brim. Seed oozes out of your spent hole, although a warmth in your belly tells you much of it is still deep inside of you. You twitch and moan, lost in the depraved bliss of being topped by such a virile and hung stud. As Vulriks starts to pull himself from your now stretched asshole, you gasp and twitch like a cock hungry butt slut, his cock nubs dragging along your overstimulated insides.");
	output("\n\n<i>“So. How was it?”</i> Vulriks takes a step away from you, stuffing his deflating monster cock away in his pants. ");
	output("\n\nYou pull yourself upright, struggling to stand as your knees quiver and shake. ");
	output("\n\nVulriks laughs, moving towards the door and unlocking it. <i>“Go home, Steele. Get some sleep and clean yourself up.”</i> He opens the door for you, motioning for you to leave. <i>“Trust me. You need it.”</i>");
	output("\n\nWith a few shaky steps, you collect yourself and move to the exit, thanking the tall Anat for the fun as you leave.");

	pc.orgasm();
	pc.loadInAss(vulriks);
	IncrementFlag("VULRIKS_SEXED");

	addButton(0, "Next", getOutOfVulriksShittyShop);
}

public function vulriksDoingYourVag(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showVulriks(true);
	processTime(15+rand(11));

	var vulriks:Creature = getVulriks();

	output("Vulriks seems to purr behind you. <i>“Excellent choice.”</i> ");
	output("\n\nThe unseen cock against your ass moves downwards, it’s nubbed spikes sinfully dragging along your round rump. Vulriks positions his wickedly fat Anatae cockhead lower still, letting it rest against your sensitive folds. Wondering how he’s going to fit that monster in your twat scares you, but that fear is outweighed by lascivious curiosity. ");
	output("\n\nThe Anat’s hands moves along your [pc.hips] towards your backside, roughly pulling them and your lips apart.");
	if (pc.vaginalVirgin) output(" <i>“Well now, this is a surprise... I am to be your first? You are a lucky one.”</i>");
	output(" One of Vulriks’ clawed hands leaves your hips. <i>“I have bred many lucky girls before you, and will likely breed many yet still. Do you think you can handle a practiced stud such as myself?”</i>");
	output("\n\n<i>“Hmmm,”</i> you manage only a slight moan at first, feeling his burning hot cockhead against your quivering cunt. <i>“I can take it, stud. Fuck me hard.”</i>");
	output("\n\nFrom behind you Vulriks chuckles softly. You feel him inch closer, his nubbed head parting your lips, pressing inward with purpose. <i>“Ready?”</i> he asks. You nod and quiver, hungry to feel his mammoth manhood inside of you. <i>“Eager little slut, aren't you? Do not worry, I will give you what you want.”</i>");
	output("\n\nVulriks moves forward, his cockhead pressing firmly against your eagerly waiting womanhood. With practiced precision, Vulriks spears himself in, his fat alien cockhead penetrating you in one powerful motion. A gasping moans escapes your [pc.lips] as your fuckhole widens to accept his monster dick. His cockhead is massive, stretching out your little hole while his spiked nubs sinfully torture your insides.");
	pc.cuntChange(vagIdx, vulriks.cockVolume(0));
	output("\n\n<i>“Hm, that’s it,”</i> Vulriks purrs. <i>“How does it feel to be fucked by a prime piece of meat like mine?”</i> Before you can respond, Vulriks thrusts forward again, roughly shoving more of his prodigal length inside of your quivering pussy. Any words you had evaporate, replaced by a deep guttural moaning. Your cunt quivers and burns, your folds stretched against his fat cockhead and meaty shaft.");
	output("\n\nHe thrusts away with his hard, lengthy cock, sending shivers of bliss rippling throughout your body. Inch after agonizing inch slides in deeper and deeper with each of his powerful thrusts, making you quiver and scream in ecstasy. Despite his cockhead being so deliciously fat, the rest of his meat is mercifully thinner. His nubbed crown bottoms out in your shamefully shallow cunt, pressing against your womb already after each thrust. Another lusty moan escapes your lips, the feeling of the well hung man’s cock making your body burn with pleasure. You feel nearly a foot of hard dick deep inside your burning pussy, capped off with that sinfully depraved spiked head.");
	output("\n\nLooking back at your well endowed lover, you see his blue eyes are intense and focused. Noticing your gaze, he tilts his head and chuckles. <i>“I bet it’s not everyday you get fucked by a stud such as myself. You love this don’t you? Being fucked by a real man.”</i> ");
	output("\n\nWaves of pleasure radiate throughout your body, stoked by the blissful flames of passion in your loins. Vulriks’ pace is slow but forceful, each powerful thrust testing the limits of your stretched out twat. Over your shoulder, you hear him speak, his voice steady and powerful. <i>“Stay with me. Stay with me and I will fuck all of your holes to your heart’s content. I will breed you like only a true stud can. And you will gratefully take my seed.”</i>");
	output("\n\nWith more than a little aggression, Vulriks picks up his pace, fucking your overstuffed cunt with considerable passion and fervor. You let out a powerful cry as he ravishes you, every muscles in your body tensed and burning, your senses over stimulated from his new found enthusiasm. You bite your lip as the sheer euphoria makes your fingers and toes curl. You’re close now, moments away from orgasmic bliss with Vulriks’ cock deep inside of you, his wicked cockhead a tool of agonizing ecstasy. The room starts to fade, your vision beginning to blur.");
	output("\n\nBehind you, Vulriks’ breathing starts to quicken. You feel his cockhead, buried deep in your burning cunt, start to pulse, threatening to pop at any moment. The depraved idea of him cumming inside, treating you like one of the many whores he’s bred, excites you to no end. Your pleasure boiling over, you feel the warmth in your core spread, the whole of your being starting to tense and convulse. Moaning like a holovid whore, every nerve in your body ignites at once, alive with sensation as Vulriks continues to rail you mercilessly. Wetness oozes down your legs, your cunt drooling sweetness as you wail and moan. Powerless against the might of Vulriks’ colossal meat.");
	output("\n\nBehind you, Vulriks lets out a primal groan, his massive, monster cock finally exploding. His firehose of a shaft pumps you full of thick, hot cum, his cockhead throbbing inside of you as he fills you up to the brim. Seed oozes out of your spent cunt, but you still feel much of it deep inside your stretched out womanhood, coating your insides with warmth. You twitch and moan, lost in the depraved bliss of being fucked by such a virile and hung stud. As Vulriks starts to pull himself from your now stretched twat, you gasp and twitch like a cock-hungry slut, his cock nubs dragging along your overstimulated insides.");
	output("\n\n<i>“So. How was it?”</i> Vulriks takes a step away from you, stuffing his deflating monster cock away in his pants.");
	output("\n\nYou pull yourself upright, struggling to stand as your knees quiver and shake.");
	output("\n\nVulriks laughs, moving towards the door and unlocking it. <i>“Go home, Steele. Get some sleep and clean yourself up.”</i> He opens the door for you, motioning for you to leave. <i>“Trust me. You need it.”</i>");
	output("\n\nWith a few shaky steps, you collect yourself and move to the exit, thanking the tall Anat for the fun as you leave.");

	pc.orgasm();
	pc.loadInCunt(vulriks, vagIdx);
	IncrementFlag("VULRIKS_SEXED");

	addButton(0, "Next", getOutOfVulriksShittyShop);
}

public function youWinTheAnatDickMeasuringContest():void
{
	clearMenu();
	clearOutput();
	showVulriks(true);
	processTime(1+rand(2));

	output("In a huff, Vulriks moves away from the counter, his massive cock still hanging freely, all while muttering something under his breath.");
	output("\n\nHe stalks out from behind the counter, brushing past you on his way towards the entrance, dragging his feet as he moves to the door. You keep an eye on him as he walks, trying to get a read on his mood. It’s hard to tell if he’s pissed off or just being dramatic, but he’s certainly not himself.");
	output("\n\nAfter locking the door, he turns to face you. <i>“So,”</i> his blue eyes narrow. <i>“What is your plan?”</i> He stalks towards you, suddenly looking very large, his spiked cock pointed directly at you.");
	output("\n\nHe bumps his shoulder into yours, pushing you out of the way with a bit of unexpected aggression on his way to the counter. While not a violent bump, you get the impression he’s trying to accomplish... something. <i>“Do you think you can top me?”</i> Vulriks pulls off his cloak and tosses it aside, standing chest to chest with you, his mask inches from your face. You notice his crest seems to rise slightly, the feathered crown looking impressive despite his dull colors. <i>“Well? Are you going to fuck me or what?”</i>");
	output("\n\nBefore you can answer, Vulriks lets out a growing noise, then reaches and pulls his pants down around his ankles. <i>“I think you want to fuck me.”</i> Oozing machismo, Vulriks bumps his chest against yours. Again, you notice it’s not a violent action, but feels almost like… foreplay?");
	output("\n\nVulrik turns away from you, slamming his hands on the counter, and lifting his large red ass high into the air. <i>“Come on then! Fuck me!”</i>");
	output("\n\nYou pause for a moment, not sure what to make of this…");

	var wrongCocks:Array = new Array();
	for (var i:int = 0; i < pc.cocks.length; i++) if (pc.cLength(i) < 21 || pc.cLength(i) > 30) wrongCocks.push(i);

	addButton(0, "Dom Him", penisRouter, [haveSomeFunWithVulriksButt, pc.biggestCockVolume() + 1, false, 0, wrongCocks], "Dom Him", "Two can play at his game...");
	addButton(1, "Let Him Lead", penisRouter, [timeForVulriksToPowerBottom, pc.biggestCockVolume() + 1, false, 0, wrongCocks], "Let Him Lead", "See where this is going...");
}

public function haveSomeFunWithVulriksButt(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showVulriks(true);
	processTime(15+rand(11));

	output("You move in behind the posturing Anat, and in a flash, deliver a strong smack to his dark red backside. Vulriks flinches as you slap him, and from behind his mask you hear a low growl.");
	output("\n\n<i>“You talk a big game for someone with such a small cock,”</i> you tease, breezing past the fact Vulriks would be considered well endowed by nearly every standard in the galaxy. <i>“I think you forget who’s in charge here.”</i>");
	output("\n\nVulriks mutters something under his breath, a small utterance of defiance. You contemplate giving his ass another smack, but opt for a more direct approach. Your own [pc.cockShape " + cockIdx + "] monster is already out after all, and more than ready to go. Grasping your shaft, you lift your massive cock up, pressing your [pc.cockHead " + cockIdx + "] against Vulriks' hole.");
	output("\n\nThe Anat twitches as you press yourself against his pucker, flexing his muscles tight in response. His asschecks fight against your invading cock, clenching against your [pc.cockHead " + cockIdx + "], all while Vulriks laughs softly. He’s not going to make it that easy for you.");
	output("\n\nBut then again, you’ve no intention to make it easy on him either. With a small grunt of exertion, you buck your hips forward, powering through his grasp and pressing into the Anat.");
	output("\n\nVulriks’ ass is tight, the well toned muscles of the Anat making it hard to plunge yourself in. You grab his hips, gripping them tightly, trying to find extra leverage as you muscle your way in. If this is going to be a power struggle, you’ll need every advantage you can get. Vulriks grunts as you invade him, squirming in your grasp as you force your [pc.cockShape " + cockIdx + "] meat inside of his pucker. You stop sliding in after a moment, the first few inches of your [pc.cockNounSimple " + cockIdx + "] now buried deep.");
	output("\n\n<i>“Is that all?”</i> Vulrik glances over his shoulder, his blue eyes narrowed. <i>“I barely even felt that. You sure you’re all the way in?”</i>");
	output("\n\nYour [pc.lipsChaste] curve into a smile. <i>“Just taking it easy on you. Wouldn't want to break you so quick.”</i> Before Vulriks can offer a retort, you buck your hips, thrusting your meat deeper into his waiting ass. His guard must have been down, because you end up driving half of your massive meat inside of him.");
	output("\n\n<i>“Fuck,”</i> Vulriks moans, his well toned ass still flexed and clenching around your [pc.cockShape " + cockIdx + "] shaft. His tight hole is a vice around your pulsating manhood, with a rising heat threatening to melt your meat right off. Vulriks squirms beneath you, the Anatae panting heavily behind his bone mask.");
	output("\n\n<i>“You like this don’t you?”</i> You ask him, giving his ass a powerful slap. You start to move your hips back and forth, sliding your mass of cockflesh in and out of his now loosening hole.");
	output("\n\n<i>“L-Lies..”</i> Vulriks manages to answer, his breathing becoming broken. You give his ass another slap, eliciting a sharp gasp from the proud man. His whole body, while still tensed, seems to ease below you. He doesn't seem to be able to fight you anymore.");
	output("\n\n<i>“Liar,”</i> you insist, picking up your pace. Each of your powerful thrusts spears your manhood deeper and deeper into Vulriks’ waiting ass. Your cock feels like it’s on the verge of being crushed by his tightness, and you struggle to keep yourself composed as you taunt your reluctant lover. He’s managing to handle your impressive girth, which coaxes a knowing smile across your [pc.lipsChaste]. <i>“You love this. Being topped by somebody more dominant than yourself. You’re a total butt slut.”</i>");
	output("\n\n<i>“That is...”</i> Vulriks groans, cutting off his own thought. You feel his ass flex against you, uselessly fighting your invading meat. The gesture is pointless at this juncture, but you can’t help but appreciate the last stand the Anatae is making. With a small grunt of effort, you fight past the tightness, driving your hips against the Vulriks’ pert ass and fully sheathing yourself inside him. You can’t help but let out a throaty moan, the sensation of plunging all of your [pc.cockNounSimple " + cockIdx + "] inside at once almost too much to bear. Vulriks moans as well, but in a far more depraved tone. Despite himself, he’s loving being fucked.");
	output("\n\nThe lewd sounds of your hips slapping his ass fill the air, along with your shared moans. You fuck him hot and hard against the counter, your cock on the verge of exploding. Below you Vulriks writhes, losing himself into a sea of bliss. An idea crosses your mind, one that will surely throw the proud Anatae over the edge. ");
	output("\n\nYou lift one of your hands off his hips, moving around the Anatae’s waist and reaching for his manhood. As you seize it, Vulriks gasps, his thick meat throbbing between your fingers. <i>“Wh-what are yo-,”</i> Vulriks moans, shuddering as a shiver runs up his spine. His cock is hot in your hand, slick with pre-cum leaking like an out of control faucet. Seems his dick isn't able to lie nearly as well as he is about how much he loves to be topped. Pumping your wrist, you slide your hand up and down his shaft, causing Vulriks to moan even louder. ");
	output("\n\n<i>“You gonna admit it?”</i> You tease, jerking him off while plowing his ass. Sweat starts to form on your brow, and the air in your lungs burns. You won’t be able to keep this up much longer.");
	output("\n\n<i>“Admit… what?”</i> Vulriks gasps, only able to form words between your powerful thrusts.");
	output("\n\n<i>“You know what,”</i> you tease, fighting the urge to bite your lip. Gasping for air, you try to keep yourself together, feeling a tightness in your [pc.balls].");
	output("\n\n<i>“F-fuck you,”</i> Vulriks manages to sputter. You feel his asshole tighten again around your [pc.cockNounSimple " + cockIdx + "].");
	output("\n\nThe pressure makes you moan, a shiver running up your spine. In response, you start moving your wrist faster, trying to beat Vulriks off and down into submission. <i>“Last chance,”</i> you manage to say, your [pc.balls] on the verge of bursting. <i>“Say it.”</i>");
	output("\n\n<i>“I… I...,”</i> he cuts himself off once more, his whole body starting to tremble. <i>“F-Fuuuck,”</i> he manages to groan, and around your cock you feel his hole tighten once more. <i>“I love it!”</i> he screams, <i>“I love being fucked by big cocks!”</i> No sooner than the last word comes out of his mouth, you feel the submitted Anatae tremble and shake.");
	output("\n\nYou can’t contain yourself either, and lose yourself to ecstasy. The two of you climax in unison with each other, your cock erupting deep inside of his trembling hole, while his own impressive load fires off all over the side of the counter. He trembles beneath you, his eyes rolling back slightly, and his muscles left twitching.");
	output("\n\nWhen you pull out of Vulriks’ tight bottom, you leave his back door open wide. [pc.cumColor] spunk trails out of his gaping hole, running down his rough red thighs. He glances back over his shoulder at you, his blue eyes glazed over. <i>“Well… that was something…”</i>");
	output("\n\nVulriks pulls himself to his feet, awkwardly pulling his pants up while slowly moving towards the door and unlocking it. <i>“I need to clean up. Both the store and myself.”</i> He opens the door for you, motioning for you to leave. <i>“Thank you, Steele. That was quite fun.”</i>");
	output("\n\nWith a few shakey steps, you collect yourself and move to the exit, thanking the tall Anat for the fun as you leave.");

	pc.orgasm();
	IncrementFlag("VULRIKS_SEXED");

	addButton(0, "Next", getOutOfVulriksShittyShop);
}

public function timeForVulriksToPowerBottom(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showVulriks(true);
	processTime(15+rand(11));

	output("You move in behind the posturing Anatae, unsure about what to do next. Does he really want you to fuck him? You can’t tell if he’s being serious or what. Your cock twitches, eager to penetrate the tight looking rear you, yearning to fuck it raw. ");
	output("\n\n<i>“Well?”</i> Vulriks wiggles his dark red ass, taunting you with it. <i>“What’s taking so long? Are you not man enough or something?”</i>");
	output("\n\nWith a sigh, you grasp your shaft, lifting your massive cock up and pressing your [pc.cockHead " + cockIdx + "] against Vulriks’ hole. The Anat twitches as you press yourself against his pucker, flexing his muscles tight in response. His asscheeks fight against your invading cock, clenching tight against your [pc.cockHead " + cockIdx + "], all while Vulriks laughs softly. <i>“So you can get hard. Good for you, Per. Now stick it in.”</i>");
	output("\n\nYou swallow hard, hesitating, your throbbing cockhead still pressed against Vulriks flexed anus. The Anatae glances over his shoulder at you, his piercing eyes daring you, no, commanding you to fuck him. You take a deep breath, and move your hips forward.");
	output("\n\nVulriks’ ass is tight, the well toned muscles of Anatae making it hard to plunge yourself in. You grab his hips, gripping him tightly and trying to find extra leverage as you muscle your way in. Vulriks grunts as you invade him, not making it easy as you force your [pc.cockShape " + cockIdx + "] meat inside of his pucker. You stop sliding in after a moment, the first few inches of your [pc.cockNounSimple " + cockIdx + "] now buried deep.");
	pc.cockChange();
	output("\n\n<i>“Is that all?”</i> Vulrik glances over his shoulder, his blue eyes narrowed. <i>“I barely even felt that. You sure you’re all the way in?”</i> Vulriks rotates his hips, twisting his tight hole around in a circle around your sensitive cockflesh.");
	output("\n\nYour wince, letting out a soft moan. Vulriks’ muscled hole holds you fast, compressing your buried [pc.cockShape " + cockIdx + "] member and threatening to pop it. You’re not sure what kind of workout gets you ass muscles like this, but you get the feeling Vulriks must do them daily. You feel yourself throbbing, trying to fight against the pressure futilely. ");
	output("\n\n<i>“Like that don’t you?”</i> Vulriks taunts, his well toned ass still flexed and clenching around your [pc.cockShape " + cockIdx + "] shaft. <i>“All that dick and no idea how to use it. Well, guess I have to do this myself.”</i>");
	output("\n\nBefore you can question him, Vulriks’ anal grasp on your meat lets up, loosening its vice grip on you. Without missing a beat, the Anatae starts to move, roughly bucking his well toned ass up towards you, fucking himself on your [pc.cockNounSimple " + cockIdx + "].");
	output("\n\nYou shudder, letting out a gasping moan as you struggle to hold on to Vulriks’ hips. His ass, although not as tight as it was, is still absolutely cock crushing. You feel yourself pulsate deep inside of the voracious man’s hole, every muscle in your body starting to clench. The heat of it is unreal, burning with a depraved intensity that makes your [pc.skinFurScales] crawl.");
	output("\n\n<i>“Don’t you dare cum.”</i> Vulriks grows, his breathing now labored, but his voice still powerful. <i>“You are not allowed to cum before me. Understand?”</i>");
	output("\n\n<i>“Y-yes.”</i> you answer, fighting to respond. More and more of your manhood slides deeper into Vulriks, his ass seemingly hungry for more of your fat cock meat. Your manhood feels like it’s on the verge of being crushed by his tightness, and you struggle to keep yourself from cumming like your powerful lover commands. How he’s managing to handle your impressive girth is a mystery to you, but with all your blood currently in your crotch and not your head, you haven't the brainpower to try and figure it out.");
	output("\n\n<i>“Hmm,”</i> Vulriks sneers, seemingly quite pleased with himself. <i>“I can feel it inside of me. All that meat, and you cannot even use it right. Pathetic. Allow me.”</i> With a primal growl, Vulriks drives himself against you, fully sheathing your fat cock inside him. You can’t help but let out a throaty moan, the sensation of having the whole of your [pc.cockNounSimple " + cockIdx + "] inside at once almost too much to bear. Vulriks moans as well, but seems to keep control. <i>“T-this is how you use it.”</i>");
	output("\n\nThe lewd sounds of his hips slapping against your lap fill the air, along with your shared moans. Holding on tightly, all you can do his shudder and writhe, trying not to cum while Vulriks continues to fuck himself on your [pc.cockNounSimple " + cockIdx + "]. Below you Vulriks turns his head, glancing back at you over his shoulder, a cunning look in his blue eye. <i>“Touch me. You should at least get the chance to sample a real man’s cock after all.”</i> ");
	output("\n\nYou lift one of your hands off his hips, moving around the Anatae’s waist and reaching for his manhood. As you grab it, Vulriks grunts, his thick meat throbbing between your fingers. <i>“That is it,”</i> Vulriks moans, shuddering as a shiver runs up his spine. His cock is hot in your hand, slick with pre-cum leaking from its tip like an out of control faucet. <i>“Well? What are you waiting for, an invitation? Stroke me!”</i> Not needing to be told twice, you get to work, pumping your wrist and sliding your hand up and down his powerful shaft.");
	output("\n\n<i>“Like… this?”</i> You struggle to form the words, jerking him off the best you can while he continues to pound into you. Your [pc.balls] ache, and you feel yourself leaking inside of Vulriks’ sinfully skilled hole already. You won’t be able to keep this up much longer...");
	output("\n\n<i>“Shhhh, stop talking.”</i> Vulriks clenches himself between one of his thrusts, his powerful muscles compressing your buried meat and causing you to let out a depraved moan. <i>“Just keep doing that. Yes, just like that…”</i>");
	output("\n\nGasping for air, you try to pull yourself together, feeling a tightness in your [pc.balls]. That last clench was nearly too much, and you feel yourself starting to lose it. Your hand keeps moving, sliding up and down Vulriks’ throbbing shaft. He’s close, but you don’t think you’ll be able to outlast him. Desperately, you start to pump your wrist faster, trying to finish him off quickly so you can cum.");
	output("\n\nVulriks lets out a throaty moan, taken off guard by your vigorous dick pounding, but manages to let out a low chuckle afterwards. <i>“I told you... I can feel you inside of me. I can feel all that pre leaking from you... You’re at the end of the line.”</i> Vulriks lets out a passionate sigh, and you feel his asshole tighten again around your [pc.cockNounSimple " + cockIdx + "]. <i>“Lucky for you, so am I.”</i>");
	output("\n\nHis ass is blissful agony, and you can’t contain yourself another second. Your cock is melting, pulsating wildly and on the verge of exploding. Your whole body trembling, the world around your shifts out of focus, with your mind turning to mush. As you feel a massive rush of ecstasy surge through your loins, Vulriks convulses below you, his ass constricting around your cockflesh tigher than ever before. He wasn't lying.");
	output("\n\nThe two of you climax in unison with each other, your cock erupting deep inside of his trembling hole, while his own impressive load fires off all over the side of the counter. You struggle to hold on, your [pc.legOrLegs] threatening to buckle beneath you as you fill the large man up with your [pc.cumColor] hot spunk.");
	if (pc.balls > 0) output(" Your [pc.balls] are still aching, seemingly angry with you for holding back for so long.");
	output(" Slowly, after a long moment, the world starts to come back into focus, and your [pc.legOrLegsNoun] " + (pc.hasLegs() ? "feel" : "feels") + " a bit more sturdy and able.");
	output("\n\n<i>“F-fuck yes,”</i> Vulriks moans below you, stopping his movement for the first time in many minutes. He’s panting like he ran a marathon, his red skin slick with sweat. <i>“Alright… pull it out…”</i> ");
	output("\n\nDoing as you’re told, you pull yourself out of Vulriks’ tight bottom, leaving his back door open wide. [pc.cumColor] spunk trails out of his gaping hole, running down his rough red thighs. He glances back over his shoulder at you, his blue eyes heavy and tired. <i>“Well… that was something…”</i>");
	output("\n\nVulriks pulls himself to his feet, awkwardly pulling his pants up while slowly moving towards the door and unlocking it. <i>“I need to clean up. Both the store and myself.”</i> He opens the door for you, motioning for you to leave. <i>“That was quite fun, we should do it again sometime.”</i>");
	output("\n\nWith a few shaky steps, you collect yourself and move to the exit, thanking the tall Anat for the fun as you leave.");

	pc.orgasm();
	IncrementFlag("VULRIKS_SEXED");

	addButton(0, "Next", getOutOfVulriksShittyShop);
}

public function byeByeShadyDealsMan():void
{
	clearMenu();
	clearOutput();
	showVulriks();
	processTime(1);

	output("You decide you’ve had enough of the tall merchant’s company, and bid him farewell.");
	output("\n\nVulriks closes his eyes and bows his head slightly. <i>“Farewell, Steele. My door is always open in case you come across some, ehh, interesting merchandise you need moved.”</i>");
	output("\n\nYou promise him you’ll keep him in mind if something comes up, as you make your way to the door and step outside onto the Recreation Deck, leaving his hovel of a shop.");

	addButton(0, "Next", getOutOfVulriksShittyShop);
}

public function getOutOfVulriksShittyShop():void
{
	move(rooms[currentLocation].westExit);
}