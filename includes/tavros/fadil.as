public function showFadil(nude:Boolean = false):void
{
	showBust("FADIL" + (nude ? "_NUDE":""));
	showName("\nFADIL");
}

public function matchesFadilsPreference():Boolean
{
	return pc.isFemale() && pc.isFeminine();
}

public function fadilDaddy(your:Boolean = false):String
{
	var fadilName:String = "Fadil";
	if (flags["FADIL_TALKED_DADDY"] != undefined)
	{
		fadilName = "Daddy";
		if (your) fadilName = "your " + fadilName;
	}
	return fadilName;
}

public function tempFadil():Creature
{
	var fadil:Creature = new PregnancyPlaceholder();
	fadil.createCock();
	fadil.shiftCock(0, GLOBAL.TYPE_CANINE);
	fadil.cocks[0].cLength(11, true);
	return fadil;
}

public function fadilBonus(btnSlot:int):int
{
	output("\n\nThere’s a middle-aged looking ausar sitting in a corner of the bar. His attention seems to be wholly occupied by a codex and a couple of holopads. Suddenly, he looks up and rubs his eyes. He sighs, stretches his arms, and takes a swig from his glass before turning his attention back to his work.");
	if (flags["MET_FADIL"] == undefined) addButton(btnSlot, "Ausar", approachFadil, undefined, "Working Ausar", "Go see if you can get the Ausar’s attention.");
	else addButton(btnSlot, "Fadil", approachFadil, undefined, "Fadil", "Have a chat with the older ausar male.");
	return btnSlot + 1;
}

public function approachFadil():void
{
	clearMenu();
	clearOutput();
	showFadil();
	author("Doots");
	processTime(2);

	if (flags["MET_FADIL"] == undefined)
	{
		output("The Ausar looks up from the datapads when you greet him.");
		output("\n\n<i>“Oh, sorry. I didn’t notice you.”</i> He stands up and extends his hand. <i>“Fadil, pleased to meet you.”</i>");
		output("\n\n<i>“[pc.name] Steele,”</i> you introduce yourself while shaking his outstretched hand.");
		output("\n\nFadil sits back down and gestures at an empty seat next to him. <i>“So, [pc.name], any particular reason why you came over here?”</i>");
		output("\n\nYou sit down on the offered seat and admit that you don’t have any particular reason for doing so. He just happened to catch your eye and you wanted to talk to him.");
		output("\n\n<i>“Well, I suppose I’ve been working for quite a while. I could take a break,”</i> Fadil says with a smile after checking the time.");

		flags["MET_FADIL"] = 1;
	}
	else if (pc.inHeat() && matchesFadilsPreference() && flags["FADIL_SEXED"] != undefined && flags["FADIL_HEATPPROACHED"] == undefined && rand(10) == 0)
	{
		output("As you get closer to Fadil, he raises his head a bit sniffs at the air. He’s clearly distracted when you sit down next to him. ");
		output("\n\n<i>“Steele, are you in heat?”</i> he asks");
		output("\n\nYou blush furiously. Your pussy soaks itself as you find yourself imagining his big canine cock thrusting into your [pc.pussyNounComplex], his knot tying the two of you together, his hand-filling balls emptying their cargo of swimmers into you.");
		output("\n\nYou’re pulled back to reality by Fadil repeatedly snapping his fingers in front of your face. <i>“[pc.name], you all there?”</i>");
		output("\n\nYou fidget in place and admit that you spaced out thinking about his dick.");
		output("\n\n<i>“Steele, I consider myself a patient man, but I need you right now,”</i> he grunts. The lust in his voice is palpable. You see his rock hard cock straining against the inflexible material of his pants. A dark spot forms at the tip of his tent as his body reacts to your pheromones.");
		output("\n\nYour lust hazed mind still manages to realize that you need to answer him before he loses control and bends you over in front of the bar, although you’re not entirely against that.");

		flags["FADIL_HEATPPROACHED"] = 1;
		addButton(0, "Tease", heatSexForCharityBegins, false);
		addButton(1, "Beg", heatSexForCharityBegins, true);
		addButton(14, "Leave", fadilGetsNoBitchesInHeatToday);
		return;
	}
	else
	{
		output("Fadil notes you approaching and pockets his codex. <i>“Hi, [pc.name], take a seat,”</i> he says, indicating the empty seat next to him. <i>“I’m happy to see you again,”</i> He smiles pleasantly at you.");
		output("\n\nYou admit that you enjoyed yourself last time so you decided to come around for a second round.");
		output("\n\n<i>“So what’ll it be this time, you here to just talk " + (flags["FADIL_TALKED_DADDY"] != undefined ? "or does my girl want a taste of Daddy’s dick" : "or do you have something more private in mind") + "?”</i>");
	}

	if (!pc.inHeat()) flags["FADIL_HEATPPROACHED"] = undefined;

	fadilMenu();
}

public function fadilMenu():void
{
	clearMenu();
	addButton(0, "Appearance", lookAtTheWorkingCharityDoggo);
	addButton(1, "Talk", talkingWithAFadilfDoggo);
	//requires high femininity, a pussy and to have talked about [sex].
	if (flags["FADIL_TALKED_SEX"] == undefined) addDisabledButton(2, "Sex", "Sex", "You should probably get to know more about his preferences before making the move.");
	else if (!matchesFadilsPreference()) addDisabledButton(2, "Sex", "Sex", "He told you his preferences, and unfortunately you don’t match them.");
	else addButton(2, "Sex", sexifyTheWorkyFadilf, undefined, "Sex", "Let the older ausar take you to the bedroom.");
	if (flags["FADIL_TALKED_CHARITY"] != undefined)
	{
		if(flags["FADIL_DONATION_DAY"] >= days) addDisabledButton(3, "Donate", "Donate", "You have already donated for today. Try again tomorrow!");
		else addButton(3, "Donate", giveThatFadilfSomeDosh);
	}
	addButton(14, "Leave", itsBestToLetWorkingDogDILFsWork);
}

public function lookAtTheWorkingCharityDoggo():void
{
	clearOutput();
	showFadil(flags["FADIL_SEXED"] != undefined);
	author("Doots");

	output("Fadil is a male ausar, standing at six foot one by imperial measurements. He has flawless, bronze skin. His black hair is kept back by a ponytail. A few gray hairs show the stress of his job. Two large wolf-like ears rest atop his head, twitching constantly at the ambience of the station.");
	output("\n\nOverall his facial features are quite masculine with thin lips and a strong jawline. Two warm amber eyes adorn his face like a pair of jewels. You can’t help but relax under his warm gaze and gentle smile. His forearms and legs are covered in dark scruffy fur that hasn’t suffered from his constant stress.");
	output("\n\nHe’s wearing a dark two-piece suit that clearly has seen a lot of use.");
	if (flags["FADIL_SEXED"] == undefined)
	{
		output(" With a suit covering his body it’s hard to tell, but by looking closely, you can see that he’s in good physical condition.");
		output("\n\nThere’s a decent sized bulge in his pants; it’s nothing mind-blowing but it’s definitely a hefty thing. Then again, he could be a grower instead of a shower.");
	}
	else
	{
		output(" Having seen it first hand, you know that under his suit he’s hiding well-defined muscles that must have taken quite a bit of work to sculpt.");
		output("\n\nHaving been in Fadil’s pants");
		if (flags["FADIL_SEXED"] > 1) output(" more than");
		output(" once, you know that his doggy cock is roughly eleven inches of red canine meat with a heady knot at the bottom. Under his prick, two tennis ball sized balls hang low.");
	}

	addDisabledButton(0, "Appearance");
}

public function talkingWithAFadilfDoggo():void
{
	clearMenu();
	clearOutput();
	showFadil();
	author("Doots");
	processTime(1);

	output("You ask Fadil if he minds talking for a moment.");
	output("\n\n<i>“Not at all, it’s a nice break from everything to just relax and talk,”</i> he says while putting the holo tablets away. <i>“Now, what do you want to talk about?”</i>");

	fadilTalkMenu();
}

public function fadilTalkMenu(lastTopic:String = ""):void
{
	clearMenu();
	var btnSlot:int = 0;
	var topics:Array = new Array();
	topics.push("Him");
	if (flags["FADIL_TALKED_HIM"] != undefined) topics.push("Charity");
	topics.push("Free Time", "Sex");
	while (btnSlot < topics.length)
	{
		if (topics[btnSlot] != lastTopic) addButton(btnSlot, topics[btnSlot], fadilTalk, topics[btnSlot++]);
		else addDisabledButton(btnSlot++, lastTopic);
	}
	if (flags["FADIL_SEXED"] > 2 && flags["FADIL_TALKED_DADDY"] == undefined)
	{
		if (lastTopic == "Daddy") addDisabledButton(btnSlot++, "Daddy");
		else if (matchesFadilsPreference()) addButton(btnSlot++, "Daddy", fadilTalk, "Daddy", "Daddy", "Ask the older ausar male if he’d mind you calling him daddy while he makes you moan.");
		else addDisabledButton(btnSlot++, "Daddy", "Daddy", "If you want to call Fadil your daddy you should make sure he’s actually going to sleep with you.");
	}
	addButton(14, "Back", fadilMenu);
}

public function fadilTalk(topic:String):void
{
	clearMenu();
	clearOutput();
	showFadil();
	author("Doots");
	processTime(2+rand(3));

	switch (topic)
	{
		case "Him":
			output("<i>“You want to know more about me?”</i> he asks with slight surprise in his voice. <i>“Fair enough, I suppose.”</i> ");
			output("\n\nFadil rubs his clean-shaven chin while thinking of what to say. <i>“I was born on Ausaril some fifty-odd years ago in a litter of five: three sisters, my brother, and me. Mom and dad weren’t together anymore when I was born, so I never met my dad, but mom always told me that he was a stand-up guy. She told me that they grew apart and they both agreed that it would be better for them to go their separate ways. Mom had a hard time taking care of us all. There’s only so much time in a day, but she tried her best to give us all the attention we needed.”</i>");
			output("\n\n<i>“So, the first thing I did when I graduated from high school was to leave home and register in the JAF. I was assigned to the armored branch and had the time of my life, but ultimately I decided that a career in the military wasn’t what I wanted. I left after my enlistment term was up. My mom offered to take me back in, but I didn’t want to put more stress on her.”</i>");
			output("\n\n<i>“What did you end up doing?”</i> You ask.");
			output("\n\n<i>“Well, when I was in the army, I worked in the mess for a while. While I was there, I found myself enjoying food preparation about as much as I enjoyed being a tanker. So after I left the service, I got a job at a restaurant. I had hoped to work my way up, maybe become a line cook one day, but unfortunately,”</i> Fadil heaves a sigh, <i>“That didn’t last very long. A couple of months later I got a message from my sister telling me that mom had gotten sick. Apparently, in the early stages the illness was rather harmless, but left untreated it could result in life-threatening health complications. Not only that but the treatment was inordinately expensive because the illness was so rare. We realized that even if everyone pitched in, it wouldn’t be enough to pay, and taking out a loan would have put the family deep into debt.”</i>");
			output("\n\nFadil pauses his story to drink from his glass. His ears twitch towards elsewhere in the bar, and for a moment you become aware of silverware clinking against dishes and muted conversation.");
			output("\n\n<i>“I’m sorry to hear that,”</i> you say. <i>“Did you find a way to help your mother?”</i>");
			output("\n\n<i>“I did. I realized that it was my turn to take care of the family. I applied to a mining company under an indentured laborer contract. I didn’t tell mom or my siblings until after I signed the indenture. They would have tried to dissuade me from it, but I couldn’t stand by and let my mother’s health decline, or allow loans to hamstring my siblings. Not when I could do something about it.”</i>");
			output("\n\n<i>“Anyway, I came home to find my sisters in the living room having a meeting about mom’s condition, trying to figure out what they were going to do. There were holopads and all sorts of papers, documents and just junk everywhere, so I figured they had been at it for a while.”</i> A slight smirk begins to tug at the corner of his mouth. <i>“My sisters were a little shell-shocked when I told them what I’d done. They’d spent a few days wringing their brains for ways to cover treatment costs, and I’d rendered it moot all at once.”</i>");
			output("\n\n<i>“Now my brother, on the other hand, when I told <i>him</i> he just went along with it.”</i> Fadil snorted. Fadil seems to have a rather lively family, you surmise.");
			output("\n\nNow that you think about it, dad brought you to various company workplaces as a wide-eyed young child. Your interest piqued by your own internal musing, you gaze thoughtfully at Fadil and ask, <i>“So, you mentioned serving out an indenture for a mining company. Do you mind if I ask what your specific occupation was?”</i>");
			output("\n\n<i>“Oh sure,”</i> replies Fadil. <i>“You remember, how I used to be a tanker? Well, my unit underwent some cross-training to ensure we could support our engineers during sustained operations. So, for me, getting company certification to operate heavy equipment was mostly just a matter of applying what I already knew to a different work environment. I mostly used the initial training period to get acquainted with the people I was going to be working with. After that I spent the next several years going wherever operations deployed us until I paid off my debt and fulfilled my indenture.”</i>");
			output("\n\nWell, that doesn’t sound too bad. But from what you understand, it isn’t uncommon for rarer, specialized medical treatments to cost in the hundreds of thousands of credits. How did he pay off his debt so quickly?");
			output("\n\n<i>“That’s a good question,”</i> Fadil says with a nod of his head. <i>“During my third yearly performance review, my boss made me a job offer, saying that he’d recommended me to sapient resources for a promotion and that management had opened a leadership track slot for me. I had begun to half-expect something early in the review but being offered a promotion caught me off guard. I wanted to refuse at first because I wasn’t sure I was right choice for the job, but then I thought about it and realized that the increased pay would help me pay off my mother’s medical bills faster.”</i>");
			output("\n\n<i>“In any case, getting that promotion turned out to be a good thing in more ways than one,”</i> Fadil says with a shrug. <i>“Although, I did end up working my ass off in order to keep up with the new responsibilities. I was still wore a hard hat but now I had to help direct separate teams in the field, assist with planning and briefings, coordinate between our different departments, train new personnel - it was all very hands-on work. There were a lot of times where we all pitched in to turn an empty patch of ground into a command post or a workable area. My back hurts just thinking about it. If I hadn’t gone through boot camp as a kid, I don’t know if I would have been focused enough to do as well as I did. I spent a lot of extra hours making sure I did everything right.”</i>");
			output("\n\nFadil pauses. <i>“I won’t deny I was lucky, though. I’d like to say that the thought of seeing my mother, healthy and happy, was all that was needed to keep me motivated, but that isn’t true. There were many days where I couldn’t think of anything other than my bed. Heck, there were days where I could barely think at all. The fact of the matter is, there are many people that I owe thanks to for bringing me to where I am today.”</i>");
			output("\n\n<i>“Anyone specific?”</i> you ask.");
			output("\n\nFadil breaks into a small smile. <i>“The boss’s wife comes to mind. She took a liking to me and helped me out, mostly giving me advice or excuses to rest. In exchange, I occasionally kept her company.”</i>");
			output("\n\nThat’s quite the story. You certainly can’t deny that he’s been lucky.");
			output("\n\n<i>“Yeah, and that’s why I started running my charity. A lot of people aren’t as lucky,”</i> he says, nodding. <i>“But I’ve rambled about myself long enough.”</i>");

			processTime(1);
			flags["FADIL_TALKED_HIM"] = 1;
		break;

		case "Charity":
			output("<i>“So what’s this charity you mentioned?”</i> You ask.");
			output("\n\n<i>“Well, when I was working as an indentured servant I learned how a lot of companies handle their servants. Companies that operate on the fringes of the known galaxy tend to not follow regulations quite to the letter. So people who end up in debt in the fringes often never get out of it, and the worst part, almost no one in the universe cares. So, when I got free, I decided to do my best to help people in that situation. We look for people in debt-slavery, buy their debt, and help them to look for a fair job.”</i> He frowns and lets out a long sigh. <i>“Unfortunately, while we would like to help everyone, we still have to look for people who are likely to find honest work; there is no point in freeing someone only to have them in debt a week later.”</i> ");
			output("\n\nFadil reaches for his glass, only to find it empty. <i>“One moment,”</i> he says, giving you an apologetic grin as he flags down a passing waitress..");
			output("\n\nAs the waitress departs to get his refill you ask, <i>“How exactly do you do it? I mean, that sounds like quite the complex operation.”</i>");
			output("\n\n<i>“We primarily look for slaves on the open market since it’s not uncommon for slave contracts to be put up for sale when their owner judges that selling them would be more profitable than keeping them around. To begin with one of my employees will run background checks and look for a suitable workplace for them. If they have no glaring issues and we can find a job for them we’ll try to schedule a face-to-face chat with them. And if everything works out we’ll buy their contract, and help them with getting employed before finally nullifying their contract.”</i>");
			output("\n\nReclining in his seat, Fadil clears his throat before continuing. <i>“Then we have the outlier cases, people who are deep in debt but aren’t actively sold as slaves. In those cases we’ll look into possible family connections or friends, let them know what we’ve found and let our intentions be made clear. If no family connections can be found we’ll handle it as a normal case; whereas if a family contact can be made we try to reconnect these people. The trouble is, there’s usually a reason why they aren’t being sold, so the prices can get real steep. We often have to offer such a high amount that it’d be foolish to refuse.”</i> He looks down at the table and straightens his sleeves. <i>“Unfortunately, sometimes there’s no price on these people.”</i>");
			output("\n\n<i>“That doesn’t sound cheap,”</i> you note. <i>“Where do you get money for that sort of thing?”</i>");
			output("\n\n<i>“Mostly private donors,”</i> he grunts. He thanks the waitress as she hands him the drink. <i>“Believe it or not, giant mega-corporations don’t really want to free slaves,”</i> he says, disgust dripping from his voice. <i>“Still, we make do. We have a couple of big monthly donors so we can run our business smoothly. Someone called NoPainNoGain is one of our biggest monthly donors, alongside CyberCackler. Aside from the anonymous monthly donors, some of the individuals who we’ve helped in the past have repaid us the amount we spent on their debt or made small donations as a ‘thank you’ for our help. But that’s enough of that, I don’t want to bore you with the details of my work.”</i>");

			flags["FADIL_TALKED_CHARITY"] = 1;
		break;

		case "Free Time":
			output("Surely he’s not working around the clock? You ask Fadil what he likes to do in his free time.");
			output("\n\n<i>“I’m a workaholic, so I work <b>a lot</b>, but in those few hours when I’m taking a break from work—for my mental health—I like to cook or read. And let me tell you, having spent many years eating nutritional paste you get an appreciation for a simple home-cooked meal. But working rarely leaves me with enough time to cook something nice.”</i>");
			output("\n\nYou wonder if he has a favorite food.");
			output("\n\n<i>“Hmm, that’s a tough one...”</i> He raps his fingers against the table while thinking. <i>“I don’t really care for fancy dishes, and there are too many great foods to say one is above the rest in my mind.”</i>");
			output("\n\n<i>“Fair enough,”</i> you admit. <i>“If you’d asked me that same question I’m not sure if I could answer it either.”</i> You remember that he also told you that he likes reading.");
			output("\n\n<i>“Sitting down with a nice book is definitely my favorite way to unwind after work. I’m a particular sucker for mysteries, not necessarily mystery novels, but a book with an underlying mystery will suck me right in. Aside from mystery themed books, I read pretty much anything as long as it’s not some cheap trash. Aside from that, I don’t really care about horror or war books. Also while some people consider physical books to be inferior to a digital version on a codex—and they’d be right—I still prefer the physical copies. There’s just something different to having it in your hands, and not to mention I won’t have to stare at a screen for another four hours when I want to read.”</i>");
			output("\n\nHe rubs his chin, clearly thinking what to say next. <i>“Besides cooking and reading, I work out to keep in shape, but I really wouldn’t call that a hobby.”</i>");
			output("\n\nDoesn’t he really do anything else than reading books and cooking?");
			output("\n\n<i>“I’m a simple man, Steele,”</i> he curtly tells you. <i>“A good book and peace of mind are all I need.”</i>");
		break;

		case "Daddy":
			output("You get a kinky idea. Fadil is definitely older than you and he has made you moan out loud quite a few times, but there’s a way you could certainly make it a lot hotter.");
			output("\n\n<i>“Got a moment to entertain a little request from me?”</i> you ask, leaning in close and stroking the inner side of his thigh.");
			output("\n\nHis tail stiffens as your hand slides closer to his crotch. Still, he remains composed. <i>“Anything for a beautiful woman like you,”</i> he says smilingly. ");
			output("\n\nSliding your hand even closer to his crotch you lean even closer. <i>“Would you mind if I called you daddy?”</i> you ask with the huskiest voice you can manage.");
			output("\n\nThis manages to break his composure. His ears draw against his head and he somehow manages to choke on his own breath. It takes a few minutes for him to get his self-control back. <i>“Um, care to elaborate?”</i>");
			output("\n\nYou grin while sneaking your hand into his pants. <i>“I just want to call you daddy while you’re making me moan out loud.”</i>");
			output("\n\n<i>“Well, I guess that’s ok,”</i> he says, scratching the back of his neck.");
			output("\n\nHappy that he’s now your daddy you kiss his cheek and whisper <i>“Thank you, daddy,”</i> into his ear. His dick throbs in your hands. You can’t help but smile at his reaction. With a final nibble on his ear, you pull away from him as if nothing happened.");
			output("\n\n<i>“I think I’m going to like this,”</i> he says with a lustful smile.");

			flags["FADIL_TALKED_DADDY"] = 1;
		break;

		case "Sex":
			output("<i>“Asking such a perverse question from an older man?”</i> he asks in mock surprise. <i>“Perhaps you’re interested in seeing if this old dog knows any tricks,”</i> he says while leaning forward with a grin on his face.");
			output("\n\nMaybe, maybe not. You wouldn’t want to spoil the surprise.");
			output("\n\n<i>“Well, I’m not going to reveal my whole hand, but I can tell you a few things.”</i> He takes a more relaxed pose before continuing. <i>“I’ve tried a lot of things with a lot of different people so I know what I like and what I don’t like, and there’s no way around that I like women. No extra bits in the bedroom either, I’m a traditional sort of guy if you catch my meaning. I can’t explain it, but being with a man just isn’t the same, no matter how feminine they look.”</i>");
			output("\n\n<i>“So you’re attracted to just women? No hermaphrodites or androgynous women either?”</i>");
			output("\n\n<i>“It might sound outlandish to you, it’s just not the same. I can’t explain it but that’s the way I am, no way around it. ”</i> he admits, his eyes lingering on a passing vixen.");
			output("\n\n<i>“What about your role in the bed? Top, bottom, or do you prefer mutual roles?”</i>");
			output("\n\n<i>“I’m definitely a top. Nothing makes me harder than having a pretty girl bouncing on my cock because I told her. But don’t think I’m a careless lover, none of my partners have complained,”</i> he says, shooting you a winning smile.");
			if (matchesFadilsPreference()) output("\n\n<i>“Now, do you want a first-hand experience? I’d be happy to do so, just say the word and we’ll go back to my room.”</i> You can’t help but get a bit hot under the collar under the lustful gaze of the older ausar male.");

			flags["FADIL_TALKED_SEX"] = 1;
		break;
	}

	fadilTalkMenu(topic);
}

public function sexifyTheWorkyFadilf():void
{
	clearMenu();
	clearOutput();
	showFadil();
	author("Doots");
	processTime(1);

	output("<i>“Maybe we should take this somewhere more private, and have some fun,”</i> you whisper seductively, leaning forward.");
	output("\n\n<i>“How could I say no to that?”</i> he says grinning widely. Picking up the tablets and codex from the table, he pockets them and offers his hand to you. <i>“I have a room upstairs. It’s not much, but it’s private.”</i>");
	output("\n\nYou take his hand and follow him upstairs. The noise and the smells of the bar are considerably quieter here but you can still faintly hear some of the louder patrons. The sound of the door unlocking draws your attention back to the topic in hand.");
	output("\n\nYou step inside " + fadilDaddy() + "’s room and take stock of your surroundings. A pile of books lays on the desk and another one rests on the night table. Without warning Fadil presses his lips against yours. You can’t help but to melt into the older ausar male’s arms and kiss him back. ");
	output("\n\nYou pant softly once you break the kiss. You can feel your pussy moistening as he takes off his jacket and unbuttons his shirt. A little curl of his finger is all it takes for you to");
	if (pc.isNude()) output((pc.statusEffectv1("Wing Position") == 1 ? " unfurl your wings and fold them behind you " : " strip yourself nude") + " and");
	output(" sit in his lap.");
	output("\n\nYou can’t help but shiver as you feel his member hardening inside his trousers. It’s not fair for him to hide his dick when you’re butt naked. You unbuckle his belt and fish out his cock. Licking your lips, you set your eyes to his eleven inches of red, canine meat.");
	output("\n\nYou climb off of his lap and pull his pants down. You don’t resist the temptation and kiss the tip of his cock and wrap your [pc.lips] around its tapered tip. ");
	output("\n\n<i>“Void, you’re gorgeous,”</i> he pants as you bob your head up and down his length. But before you can get into the rhythm of it he places his hand on your shoulder. <i>“Did you already forget who’s in charge here?”</i> he growls softly.");

	addButton(0, "Oral", fadilIsGonnaThrowYouABone);
	addButton(1, "Ride", vaginaRouter, [rideYourWayOntoFadilsRedRocketMountain, tempFadil().cockVolume(0), 0, 0], "Ride", "Climb onto his lap and ride his red-rocket till he pops.");
	addButton(2, "Doggy Style", showFadilItsADogFuckDogWorld, undefined, "Doggy Style", "Let the doggo take you from behind.");
	addButton(3, "69", dogDilfAdventuresInQuidProQuo, undefined, "Sixty-Nine", "Suck the doggy dick while he dives nose deep in your [pc.pussyNounComplex].")
}

public function fadilIsGonnaThrowYouABone():void
{
	clearMenu();
	clearOutput();
	showFadil(true);
	author("Doots");
	processTime(15+rand(11));

	output("<i>“I think I like you just where you are,”</i> he growls, guiding you back to his cock. Hungry for more of him you open your mouth and swallow his doggy dick. He lays his hand atop of your head but doesn’t pull you into his prick. ");
	output("\n\nEven though he could easily thrust himself into your throat, he doesn’t do so, instead letting you dutifully lick every inch of his member, which you do with gusto. You have to admit that the flavor of his cock makes you drool a bit. It’s salty with a definitive masculine taste.");
	output("\n\nYou barely notice when your [pc.lips] bump against his knot, but instinctively you squeeze it, coaxing it to start to slowly swell with blood. With one hand on his breeder’s bulb, your other hand seeks out his hand filling balls and starts to massage them.");
	output("\n\nHis balls pulse in your hands, preparing for a hot load to dump down your throat. The thought of getting to taste his cum drives you forward into taking more of him into your throat. You even swallow his uninflated knot.");
	output("\n\nYou can feel his heartbeat through his bitch breaker. You’ll have to be careful or you’ll be stuck to it. Not that you’d mind that, but if he’s tied to your face you wouldn’t get to taste his cum.");
	output("\n\nA groan of pleasure from him makes your [pc.pussy] clench around nothing. Only now do you notice how soaked your cunt is, despite the fact that you haven’t even touched yourself.");
	output("\n\nA part of you wants to pleasure yourself, but another, stronger part of you tells you to be a good girl and ignore your own need. You want to cum from sucking " + (flags["FADIL_TALKED_DADDY"] != undefined ? "daddy’s" : "his") + " canine member.");
	output("\n\nYou’ve forgotten about his strong hand laying on your head, but you shudder pleasantly as he scratches your head. Having him keep his strong hand atop of your head and giving you encouraging scratches from time to time makes you incredibly relaxed. Safely tucked between his legs, attending to his member, it just feels right. Nothing in the world could bother you right now.");
	output("\n\nYou’re momentarily confused when he presses his palm against your forehead, pushing you off of his cock. Did you do something wrong? Did you scratch him with your teeth? Looking up to him uncertainty you’re faced with a gentle smile. He positions himself so that his balls press against your [pc.lips]. ");
	output("\n\nYou kiss his large orbs before parting your lips and swallowing them. The masculine taste of his cock is nothing compared to how strong the flavor is on his testicles. After a few minutes of suckling and licking them, you’re intoxicated with the masculine taste; you are properly cock drunk.");
	output("\n\nHe pulls his nuts out of your mouth and lowers his member back to your face. Nuzzling against his prick, you rub it against your face, smearing a mixture of pre and spit over yourself. After rubbing against him you slip his prick back into your throat. Your [pc.pussy] clenches and quivers as you swallow a bead of his pre-cum. In your cock haze, the drop of precum is more than his natural lubrication, it’s a confirmation of a job well done.");
	output("\n\nBut it’s not enough. Anyone could get his pre flowing, but good girls get a cumshot for their troubles, and you’re a good girl. Pushing your head forward, your chin ends up pressed against his balls. Looking up to him, you hope that you’re able to convey what you want with nothing but eyes alone. It doesn’t take long for him to realize what you want.");
	output("\n\nHe grabs onto your head with both hands and pushes you back. He starts to work up a rhythm of thrusting his length into and out of your gullet. His spit covered balls slap wetly against your chin repeatedly as he remodels your throat into a fleshlight.");
	output("\n\nYou didn’t want to cum before " + (flags["FADIL_TALKED_DADDY"] == undefined ? "him" : "Daddy") + ", but having his tip invading your throat over and over again is filling you with euphoric bliss and sending you over the edge of your orgasm.");
	output("\n\nYou moan into the doggy-dong filling your mouth as your [pc.pussy] spasms and clenches around nothing. Juices flow down your [pc.thighs] as you climax from nothing but sucking cock.");
	output("\n\nChasing his own orgasm, he doesn’t slow down one bit while your body spasms in pleasure. You can feel his knot steadily swelling, preparing to tie with any orifice. Swirling your [pc.tongue] around the bulb and massaging his balls with one hand you encourage him to cum inside your throat.");
	output("\n\nJust in time, he withdraws his bulbous flesh from your throat so that it doesn’t get stuck behind your teeth. You almost gag as the first rope of cum splatters against your uvula. The thick jizz slides down your throat as you swallow to the best of your abilities. Despite your best efforts some of his cum escapes the tight seal of your lips around his cock, flowing down your face and dripping onto your [pc.thighs]. You almost suffer another minor orgasm as you drink down his cum.");
	output("\n\nWhen the flow starts to die down you pull back just enough to catch the last few spurts into your mouth. Rolling your [pc.tongue] around in your mouth you savor the taste. Just like his cock and balls, his cum has the same masculine taste. Opening your mouth, you show your mouth full of cum to him " + (flags["FADIL_TALKED_DADDY"] != undefined ? "and gurgle <i>“‘hank you haddy,”</i> through the mouthful of cum before" : "before shutting your mouth and") + " swallowing.");
	output("\n\nHe grabs your from under your arms and lifts you onto the bed with him.");

	pc.loadInMouth(tempFadil());
	pc.orgasm();

	afterglowWithFadil();
}

public function rideYourWayOntoFadilsRedRocketMountain(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showFadil(true);
	author("Doots");
	processTime(15+rand(11));

	output("Grabbing you by your [pc.hips] he hoists you up to the bed so that you’re face to face in his lap. A soft, high pitched gasp escapes from between your lips as he starts to slowly massage the outer lips of your pussy. Running his free hand up your side, he softly pinches one of your [pc.nipples] between his fingers, gently massaging it.");
	output("\n\nHe pushes his fingers gently inside you, stroking around the insides of your [pc.pussy " + vagIdx + "], looking for your sweet spots. You clench up slightly and suppress your moaning as they brush against one of your sensitive spots.");
	output("\n\nHaving found it he starts fingering it without mercy. Pressing, stroking, rubbing, and massaging it until you’re gasping and moaning out loud. He seems intent on making you cum from nothing but his fingers as they’re not giving any time to collect yourself. ");
	output("\n\nYou bury your face in his neck in an attempt to quiet down your moans as he keeps massaging you towards your orgasm.");
	output("\n\nSuddenly he pulls his fingers out of your cunny, leaving you completely empty, and desperate for more. He gives you a meaningful look, telling you that it’s your turn. Obeying the nonverbal command you wrap your fingers around his warm member. You start by only gently working over his tapered tip and smearing his pre over the rest of his length. He sighs softly as more pre-cum coats your fingers. You collect every drop and work it over his cock, making sure that not even a square inch of his dick isn’t covered in his slick pre.");
	output("\n\nYou let out a surprised yelp as you’re suddenly lifted into the air and positioned above his tapered tip. A blink of an eye later you fall down on his cock, eleven inches of canine meat making their home inside your welcoming pussy.");
	pc.cuntChange(vagIdx, tempFadil().cockVolume(0));
	output("\n\nYou shudder pleasantly as you feel his pointed prick throbbing inside you. When " + fadilDaddy(true) + " judges you to be ready he slowly starts bouncing you on his prick. He’s slow and gentle at first, all the while running his strong hands over your [pc.breasts], [pc.hips], and [pc.ass].");
	output("\n\nYou gently tilt his head back and press your [pc.lips] against his. Preferring to be the one kissing, he grabs the back of your head and kisses you back even harder. His tongue works its way into your mouth and starts to fight with yours for dominance.");
	output("\n\nYou have to break the kiss when you’re moaning rapidly and bouncing on his cock on your own. He smirks and softly slaps your ass as you ride his dick like a slut that you are.");
	output("\n\n<i>“Do you like the view");
	if (flags["FADIL_TALKED_DADDY"] != undefined) output(", Daddy");
	output("?”</i> you moan whorishly as his cock rubs against the sensitive insides of your cunny. ");
	output("\n\n<i>“Do you need to ask?”</i> he grunts as his cock shoots more precum inside your tunnel. He presses his furred thumb against your lower lip. Like a good girl, you wrap your lips around it. You kiss and suck his thumb while putting on a show for him. Looking him in the eye with a smoldering look, you rub your [pc.chest] in a seductive manner.");
	output("\n\n<i>“Oh, you dirty slut,”</i> he growls softly and grabs your hips and starts to roughly pull you down on his cock. He’s fucking you deeply enough that every time he pulls you down his tapered tip presses against your cervix and his balls slap against his ass.");
	output("\n\nYou can’t keep yourself up anymore so you collapse against the broad-chested male. Damn, you never realized how good it feels to rest against a strong man, breathing in his masculine aroma.");
	output("\n\n<i>“Hnngh");
	if (flags["FADIL_TALKED_DADDY"] != undefined) output(", Daddy");
	output(", fuck me. I need your cum, please,”</i> you moan, sounding like a whore on a holofilm while he fucks your pussy from below. You’re worried that you’ll get addicted to this at this rate, but then again, you wouldn’t mind getting fucked like this every hour of every day.");
	output("\n\nYou realize that he’s about to cum when his knot starts swelling. Just the thought of his spunk filling your womb sends you careening over the edge. Your cunt spasms and [pc.girlCumNoun] squirts from between his cock and your folds, soaking his thighs and balls. Already being close to busting a nut, your cunt’s spasms pull him into the throes of orgasm.");
	output("\n\nHe grips your hips even tighter and pulls you down onto his knot. You have to grit your teeth and try your best to relax as the massive bulb of flesh spreads your lower lips wide. After some effort, it locks the two of you together and swells even larger. At the same time, his hot cum splashes into your womb. With his knot stuck inside you and his tip pressing right against your cervix, his cum has nowhere to go but inside your womb.");
	output("\n\nYou realize that you have no idea if he’s on sterilex");
	if (pc.fertility() == 0) output(", but thankfully you don’t have to worry about that.");
	else output(" but having his puppies doesn’t sound that bad at the moment.");
	output("\n\nThe two of you relish in your shared afterglow while more of his spunk fills your already full womb. Wrapping your arms around him, you wait for your afterglow to pass, and for his knot to go down. Being an ausar, his knot stays inflated for quite some time, giving the two of you a perfect opportunity to grope, touch, and feel each other’s bodies.");
	output("\n\nEventually, his knot goes down, allowing him to pull his dick out of your cunny with a soft ‘pop’. You let out a sigh as warm cum rushes out of your pussy, and down your thighs.");

	pc.loadInCunt(tempFadil(), vagIdx);
	pc.orgasm();

	afterglowWithFadil();
}

public function showFadilItsADogFuckDogWorld():void
{
	clearMenu();
	clearOutput();
	showFadil(true);
	author("Doots");
	processTime(15+rand(16));

	output("You’re momentarily confused when he stands up and lifts you onto the bed so that you’re on your hands and knees, but when he climbs behind you realize what position you two are in. He bends over you, gently hotdogging your [pc.ass] while presenting his furred fingers to you. Not needing to be told what to do, you let him push his fingers into your mouth. You swirl your tongue around them, soaking them in saliva.");
	output("\n\nOnce they’re wet with spit he pushes them into your asshole. Loosening and lubing you beforehand. You let out a small whine as he pulls his fingers out of you, but those fingers are quickly replaced by eleven inches of hot cock meat. You bite your lip in anticipation, but seconds tick away without him penetrating you.");
	output("\n\nYou look back at him, and you’re about to complain, only to have him thrust his balls-deep the moment you open your mouth, turning the complaint into a slutty moan. You bury your face in the pillow as he starts working his cock into you. You shiver sluttily as his strong hands grab your [pc.hips], holding onto you while he fucks you from behind.");
	output("\n\nYour cunny cries out for attention, but you ignore it and instead focus on the feeling of his doggy dong thrusting into your asshole. You’re letting " + fadilDaddy() + " call the shots, and you’re sure that he’s going to make you cum in due time.");
	output("\n\nYou almost sink into a haze of pleasure and fantasy as he keeps thrusting his cock into you in a slow and meticulous way, and he’s just warming up. But a quick slap across your behind pulls you back to reality.");
	output("\n\n<i>“I asked you a question, sweety,”</i> he chuckles. <i>“But I guess you already answered it.”</i>");
	output("\n\nHilting himself he bends to whisper in your ear. <i>“One more question remains...”</i> he pauses just for a moment, allowing your heart to flutter nervously. <i>“Are you ready for it?”</i>");
	output("\n\n<i>“Yes,”</i> you moan breathlessly.");
	output("\n\nThe moment the words escape your lips, he grabs your arms and pulls them back. You’re thankful for the pillow as you land face first into the bed.");
	output("\n\nYou whine needily as " + (flags["FADIL_TALKED_DADDY"] == undefined ? "he" : "Daddy") + " suddenly pulls out so that only his tapered tip rests inside you. But before you can get too needy he rams it back in with enough force to push you forward. Pulling back once more, Fadil starts plowing your [pc.asshole] with all his might. You moan into the pillow as you’re taken for a ride that’s bound to leave you walking bowlegged.");
	pc.buttChange(tempFadil().cockVolume(0));
	output("\n\nEven if " + (flags["FADIL_TALKED_DADDY"] == undefined ? "he" : "your daddy") + " wasn’t pulling your arms back you’d probably still be face down on the pillow since you barely have the strength to moan, not to speak of actually controlling your body.");
	output("\n\nYou bite your bottom lip as a familiar heat rises in you. Just a little bit more and you’ll cum. As if hearing your needy thoughts, he harshly slaps your ass, commanding you to do just that.");
	output("\n\nYour pussy spasms uncontrollably as your [pc.girlCumNoun] drools heartily down your thighs. Even as you soak the bed in your feminine fragrance, he keeps fucking you without mercy. If you could think you’d be worried about being fucked stupid by " + (flags["FADIL_TALKED_DADDY"] == undefined ? "him" : "Daddy") + ".");
	output("\n\nYou moan and cum again as you feel his knot throb inside you. Looking over your shoulder you give him your best lustful look as he rams the inflated bitch-breaking muscle inside you.");
	output("\n\nYou see stars when the first rope of alabaster cream splashes against your insides, but it’s certainly not the last. The warmth of his jizz spreads out through your insides. The pressure inside you builds and builds, but thanks to his deliciously thick knot it has nowhere to go but deeper.");
	output("\n\nOnce his cum flow starts to die down, he collapses atop you, bringing the two of you down flat on the bed. <i>“Are you ok?”</i> he asks. He’s breathing heavily in your ear, and his arms are aimlessly stroking your sides. Words are beyond you at the moment, so you nod dreamily.");
	output("\n\n" + (flags["FADIL_TALKED_DADDY"] == undefined ? "He" : "Daddy") + " takes the moment to explore your body thoroughly while you wait for his knot to deflate. He makes sure to be gentle with your hypersensitive body as his fingers roam over your curves. Finally, his knot goes down enough for him to pull out. It exits your [pc.asshole] with a cork-like pop, letting his cum flow out of your behind. Now that you’re no longer tied to him, he climbs off of your back and lies down in front of you.");

	pc.loadInAss(tempFadil());
	pc.orgasm();

	afterglowWithFadil();
}

public function dogDilfAdventuresInQuidProQuo():void
{
	clearMenu();
	clearOutput();
	showFadil(true);
	author("Doots");
	processTime(15+rand(11));

	var vagIdx:int = rand(pc.vaginas.length);

	output("Hooking his arms under yours he pulls you up to the bed. Landing on the burly ausar, you can’t help but to pepper his jawline with kisses, working your way up to kiss him straight on the lips. A bit of fresh girly-lube coats your thighs as he grabs your head and pushes his tongue into your mouth. ");
	output("\n\nAfter a quick dance for oral domination, he breaks the kiss. Both of you are panting heavily and raring to go.");
	output("\n\nHe draws a little circle in the air, indicating for you to turn around. Following orders, you position yourself so that his head is between your legs and you’re staring down at his cock. You jump in surprise as " + fadilDaddy(true) + " drags his tongue lavishly over your pussy. He spreads the outer lips of your cunny before sticking his tongue inside. You stifle a soft moan as his tongue presses against your G-spot.");
	output("\n\nWanting to prove that you’re a good girl, you wrap your hand around his shaft and start gently pumping. Pre spills from his tip, coating your fingers in the natural lubricant. Wanting a taste, you pop your pre-coated fingers into your mouth. Shuddering at the flavor, you decide to get more straight from the tap.");
	output("\n\nYour pussy gushes a bit as you wrap your lips around the tip of the doggy dong - and of course, the fact that Fadil is nose deep in your cunt isn’t hurting either. Tracing the veins on his cock with your fingers, you start taking his cock deeper in your throat.");
	output("\n\nYour slutty moans are muffled by his cock as you bob your head up and down on his length, tracing his bumps and veins with your tongue while massaging his balls with your hands.");
	output("\n\nNot to be outdone, Fadil pushes two fingers into your folds, pressing hard against your G-spot. While fingering and licking you, he uses his thumb to massage your [pc.clit " + vagIdx + "]. Your juices drool over his hand and face liberally as he works over your [pc.pussy " + vagIdx + "].");
	output("\n\nPulling his phallus out of your mouth, you pepper the side of it with little kisses before sucking on his knot. Fuck, his musk is making you light headed. Pressing your face even closer to his balls, you breathe deeply of the strong scent of masculinity. You can’t lie, you’re absolutely loving his canine member right now. Nothing could make you happier than licking, kissing, sucking it sloppily. Rubbing it against your face, you coat your face in his clear pre.");
	output("\n\nWhile you sluttily rub against his cock, he’s not laying down idly. Four fingers are knuckle deep in your [pc.pussy " + vagIdx + "], and his tongue is encircling [pc.oneClit " + vagIdx + "]. When his fingers press against your g-spot, you lose all concentration. The well-known sensation of an incoming orgasm starts welling up inside you again.");
	output("\n\nBut just before your pleasure boils over Fadil withdraws his fingers and tongue, leaving you teetering on the edge of blissful release. Even without stimuli, your lust hazed mind finds enough pleasure in " + fadilDaddy(true) + "’s masculine aroma to push yourself over the edge.");
	output("\n\nMoaning hoarsely, you squeeze your thighs together. " + (pc.hasToes() ? "Your toes curl and y" : "Y") + "our pussy flexes around nothing and [pc.girlCum] flows liberally from between your folds, soaking his face.");
	output("\n\nOnce your thighs relax");
	if (pc.hasToes()) output(" and your toes calm down");
	output(", you release Fadil’s head from between your legs. His face is glistening with your cum.");
	output("\n\n<i>“Tasty,”</i> he notes as he licks his lips clean. <i>“But I think you’ve forgotten something.”</i> And indeed you have. His prick is still throbbing, eager, and most importantly: unsatisfied.");
	output("\n\nGetting back to it, you take the tip of it into your mouth again. He’s pretty close to the edge as well since his knot is halfway to inflated, and his you can feel his heart hammering away through his cock. Taking it deeper you get back to where you left off, sucking on " + fadilDaddy() + "’s wonderful member.");
	output("\n\nStroking the bottom half of his prick and fellating the rest,you listen to the groans and gasps of pleasure escaping his lips. Unfortunately, all good things must come to an end, and that includes blowing him. His knot balloons to its full size, and warm jizz splatters against the back of your throat. Gagging a little as the first wave of cum hits your throat, but you do your best to make sure that none of it is wasted.");
	output("\n\nYou’re starting to get horny again as his alabaster cock-cream flows down your throat. All the while you massage his balls and knot to make sure he’s well-milked. Despite your best efforts, some of his cum escapes your mouth and drips down to your [pc.breasts].");
	output("\n\nWhen the flow finally dies down, you let the tip escape from your mouth. You make sure to wipe up any cum that landed on your chest and to lick it up. Once you’re sure that no cum has been wasted, you let out a content sigh and sink to the bed next to Fadil.");

	pc.loadInMouth(tempFadil());
	pc.orgasm();

	afterglowWithFadil();
}

public function afterglowWithFadil():void
{
	generateMapForLocation("ANON'S BOARD HALL");
	output("\n\n<i>“That was amazing,”</i> he sighs while kissing your cheek. You smile to yourself and cuddle against him while you both catch your breath. Instinctively you press yourself against him as he pulls the covers up. You press your head against his chest, listening to the soft beating of his heart. At the same time, he wraps his arm around your midsection.");
	output("\n\nYou tilt your head back and look him into his eyes and can’t help but to shiver under his smoldering gaze. Grabbing his head, you pull yourself closer to him and gently press your lips against his. Running his hand up the small of your back, he kisses you back just as gently. Eventually, you break off the kiss. You briefly consider getting up, but in the end, the warmth of his body wins out. You find yourself drifting off to sleep.");
	addButton(0, "Next", fadilfIsFadone);
}

public function fadilfIsFadone():void
{
	clearMenu();
	clearOutput();
	showFadil(true);
	author("Doots");
	processTime(110+rand(21));

	output("You don’t know how long you’ve been asleep, so you reach for your codex to check the time. It’s been two hours. While tempted to lay in bed all day with the older man, you don’t have the time to sleep around all day.");
	output("\n\nFadil seems to wake up when you stand up. <i>“Seeing a beauty like you naked almost makes me want to go for a second round.”</i> He laughs softly while standing up and grabbing his discarded clothing.");
	if (!pc.isNude()) output(" You do the same, and after a few minutes you’re in presentable shape again.");
	else if (pc.statusEffectv1("Wing Position") == 1) output(" You simply flex your wing muscles and wrap your body in your [pc.wings] around yourself.");
	output("\n\nThe two of you descend the stairs back into the bar. You turn around and kiss him straight on his lips. Surprised at first he quickly takes control. Grabbing you by your ass and kissing you deep. When your lips part, you’re out of breath and your [pc.pussy] is freely drooling down your thighs. He smiles seductively before sitting down in the empty corner table.");

	//Add some lust
	pc.lust(15+pc.libido()/10);
	IncrementFlag("FADIL_SEXED");

	addButton(0, "Next", move, "ANON'S BAR AND BOARD");
}

//donating reduces personality score. Amount dependant on level and the amount donated.
public function giveThatFadilfSomeDosh():void
{
	clearMenu();
	clearOutput();
	showFadil();
	author("Doots");
	processTime(1);

	output("You recall him mentioning private donations to his charity and ask him if you could donate.");
	output("\n\n<i>“Well, of course. I don’t turn away any donations. Also before you donate, you should know that a miniscule part of your donation will be used to pay staff. Also, remember that you don’t have to donate anything and that every credit makes a difference.”</i>");
	kGAMECLASS.displayInput();
	kGAMECLASS.userInterface.textInput.text = "";

	addButton(0, "Donate", giveThatFadilfSomeDoshGo);
	addButton(14, "Leave", itsBestToLetWorkingDogDILFsWork);
}

public function giveThatFadilfSomeDoshGo():void
{
	clearMenu();
	clearOutput();
	showFadil();
	author("Doots");
	processTime(1);

	var donation:int = int(kGAMECLASS.userInterface.textInput.text);
	kGAMECLASS.removeInput();

	if (donation < 1)
	{
		giveThatFadilfSomeDosh();
		output("\n\n<b>Please input a valid amount.</b>");
		return;
	}
	else if (donation > pc.credits)
	{
		giveThatFadilfSomeDosh();
		output("\n\n<b>Please input an amount you can afford.</b>");
		return;
	}

	if (donation < 100)
	{
		output("<i>“Thank you, Steele. Every little bit helps. You might not think a small amount matters, but it does.”</i>");
		pc.addNice(1);
	}
	else if (donation < 1500)
	{
		output("<i>“Thank you, Steele. This will be of great help to someone less fortunate than you or I.”</i>");
		pc.addNice(2);
	}
	else if (donation < 20000)
	{
		output("<i>“Steele, I’m having trouble finding how to express the gratitude for this. Thank you.”</i>");
		pc.addNice(3);
	}
	else if (donation < 100000)
	{
		output("<i>“Steele, I’m genuinely at a loss for words. Thank you so much, this such a great help. I already know of a few people who will benefit from this.”</i>");
		pc.addNice(4);
	}
	else
	{
		output("He looks at the credits with his mouth agape. <i>“Steele... thank you. This is so much money that it’ll be months before we can even spend all of this.”</i> He slightly shakes his head in disbelief. <i>“Again, thank you so much.”</i>");
		pc.addNice(5);
	}

	output("\n\nYou can’t help but feel a little bit better about yourself after donating to charity.");

	pc.credits -= donation;
	if (flags["FADIL_MONEY_GIVEN"] == undefined) flags["FADIL_MONEY_GIVEN"] = donation;
	else flags["FADIL_MONEY_GIVEN"] += donation;
	
	flags["FADIL_DONATION_DAY"] = days;

	fadilMenu();
}

public function itsBestToLetWorkingDogDILFsWork():void
{
	clearMenu();
	clearOutput();
	showFadil();
	author("Doots");
	processTime(1);

	kGAMECLASS.removeInput();
	output("You nod your goodbyes to the older ausar and stand up. He returns your nod before returning back to his work. Wanting to avoid standing there like a weirdo you move on, fading into the crowd of people.");

	addButton(0, "Next", mainGameMenu);
}

public function heatSexForCharityBegins(begged:Boolean):void
{
	clearMenu();
	clearOutput();
	showFadil(true);
	author("Doots");
	processTime(5+rand(11));

	var vagIdx:int = rand(pc.vaginas.length);

	if (begged)
	{
		output("You lean forward, whispering into his ear. <i>“I need your hot cock in my needy little pussy,”</i> you beg. <i>“I want you to pump all of that cum into my fertile cunt and knock me up with your puppies.”</i>");
		output("\n\nHe groans as his already strained erection throbs. Your teasing is having quite an effect on him. His eyes are glazed over, tail wagging behind him, and he’s panting heavily.");
		output("\n\nYou let out a tiny little whine and shift a bit closer to him. Running your hand up his thigh, you rub his bulge, feeling the cock that you want to impregnate you. Your [pc.pussy " + rand(pc.vaginas.length) + "] moistens noticeably as you stroke him through the fabric.");
		output("\n\n<i>“Please,”</i> is all you manage to husk as need starts to fog your mind.");
	}
	else
	{
		output("You lean forward and give him your best bedroom eyes. <i>“I have no idea what you’re talking about,”</i> you murmur playfully. You spread your thighs just enough to make your fertile pheromones flood the air.");
		output("\n\nHe groans as his already strained erection throbs. Your teasing is having quite an effect on him. His eyes are glazed over, tail wagging behind him, and he’s panting heavily.");
		output("\n\nSetting up for the figurative kill, you start stealthily fingering yourself, coating your fingers in your juices and making the smell of your fertile womb even stronger. You wipe your fingers clean right under his nose, making sure that he’s ready to rut you like an animal, if somehow he wasn’t ready before.");
	}
	output("\n\nLetting out a restrained groan he abruptly stands up. His dick looks like it’s ready to rip through his pants and fuck you here and now.");
	if (pc.tallness > 72) output(" <i>“My room, now,”</i> he grunts, grabbing your arm and pulling you upstairs.");
	else output(" Without too much effort he swipes you from your feet and carries you upstairs.");
	output("\n\nHe struggles with his keycard for a moment before pulling the two of you into the room. Any form of foreplay completely discarded. The moment your butt touches the bed you’re both as naked as the day you were born. He spreads your legs and dives face first into your pheromone-laced pussy. You can’t quite manage to stifle your moan as his tongue pierces your folds and starts loosening you up.");
	output("\n\nGrabbing the back of his head, you push him deeper, nonverbally begging him to lick you more. He provides in spades, licking you deeply as his tongue allows. His tongue digs against your G-spot, making you moan in lust.");
	output("\n\nYou whine needily as he withdraws his tongue from your [pc.pussy " + vagIdx + "]. He starts prodding your pussy lips with his tapered tip. You whine and beg him to stick it in, but for now, he seems content rubbing his tip against your folds.");
	output("\n\nWrapping your legs around his hips you try to pull him into you. While you don’t find the strength in your legs to pull him in, he still thrusts his dick balls deep into you. A rapturous moan escapes your lips as his length spreads your folds wide.");
	pc.cuntChange(vagIdx, tempFadil().cockVolume(0));
	output("\n\nIn an act to keep him from withdrawing from your pussy, you wrap your [pc.legs] even tighter around him. <i>“If you want me to fuck you, you’re going to have to let me move,”</i> he reminds you.");
	output("\n\nSheepish of your own actions, you let your legs fall down on the bed. Being able to actually move his hips he starts to steadily pump his prick into your [pc.pussy " + vagIdx + "].");
	output("\n\nOne hand on your hip and other on your shoulder his thrusts turn from shallow to deep enough to repeatedly press against your cervix. You moan whorishly as his tapered tip nudges the entrance of your womb repeatedly.");
	output("\n\nDespite your slutty moans of pleasure, he asks if you like it, and you can’t help but to scream out in affirmation. If anyone was going to walk past his room right now they could definitely hear the sounds of a slut in heat getting bred.");
	output("\n\nHe lets go of your hip and shoulder, instead pinning you down with his body, drilling your cunt hard enough to make you feel like he’s fucking you through the bed. Mind swimming with pleasure, you hold onto him like a rock in a storm.");
	output("\n\nAs he mercilessly breeds your sperm-hungry cunt he manages to rut against your sweet spots, steadily pushing you towards your orgasm. You scream out in bliss as your [pc.pussy " + vagIdx + "] spasms around his cock milking it for all it’s worth");
	output("\n\nYour legs twitch");
	if (pc.hasToes()) output(" and toes curl");
	output(" all the while your mind goes white with pleasure. You accidentally end up clawing red lines in his back as your body loses itself in bliss, but if he minds he doesn’t show it, just continuing to pump his hips.");
	output("\n\nWith every thrust, his hand-filling balls slap against your [pc.butt]. You can swear that you hear his nuts sloshing with the precious cargo you want so desperately. You sink into your heat-centered fantasies once again. In your mind’s eye, you envision his cum surging into your unprotected womb, your eggs being swarmed by his swimmers until one of them pierces its protective wall.");
	output("\n\nThe fantasy of being impregnated by " + (flags["FADIL_TALKED_DADDY"] == undefined ? "Fadil" : "your Daddy") + " is enough to send you into another leg spasming,");
	if (pc.hasToes()) output(" toe-curling,");
	output(" back scratching, mind blanking orgasm.");

	addButton(0, "Next", fastForwardToFadilStuckInYou, vagIdx);
}
	
public function fastForwardToFadilStuckInYou(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showFadil(true);
	author("Doots");
	processTime(15+rand(76));

	output("You’re not quite sure how long he’s been fucking you, nor do you know how many times you’ve come, but with how good it feels, you don’t care. Fadil’s knot is finally swelling, so it won’t be long until you get what you want.");
	output("\n\nWith a final bed-shaking thrust he hilts himself inside you just before his knot swells to its full, cunt stretching size. The first rope of cum splatters against the entrance of your womb before he nudges his cock a bit so that it all goes straight into your womb. The knot lodged inside your pussy makes sure that none of his spunk goes anywhere else than where it belongs.");
	output("\n\nYour womb slowly starts to swell, shot after shot of cum forcing it to make space for more. As your [pc.pussy " + vagIdx + "] is flooded with virile seed, you can’t help but to moan loudly as another mind-numbing orgasm crashes through your body.");
	output("\n\nEverything must come to an end, including his orgasm, which tapers off to a slow drip. Since his knot is securely tied with you, there’s no way he can pull out of you. Thankfully the big muscular ausar is just the perfect thing to cuddle while waiting for his engorged breeder’s bulb to go down.");
	pc.cuntChange(vagIdx, tempFadil().cockVolume(0), false);

	pc.loadInCunt(tempFadil(), vagIdx);
	pc.orgasm();

	addButton(0, "Next", thankFadilForHisDepositToTheGetSteelePregnantFoundation, vagIdx);
}

public function thankFadilForHisDepositToTheGetSteelePregnantFoundation(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showFadil(true);
	author("Doots");
	processTime(10+rand(11));

	output("Eventually, his knot goes down, allowing him to pull out of your cunt. His precious cum escapes from your [pc.pussy " + vagIdx + "] once his cock isn’t plugging you up anymore. Not wanting to waste it on the bedding, you place your hand on the outer lips of your creampied pussy.");
	output("\n\nDespite him having fucked you thoroughly not that long ago, you’re still not satisfied. When he straightens up you roll around so that your ass is high in the air and your face down in the pillows.");
	output("\n\n<i>“Please, gimme more,”</i> you whisper huskily. He looks at you surprisedly, but his cock springs back to life as you present your cum filled, needy pussy for more breeding. Cum squirts from between your folds as he sheaths himself inside you again.");
	output("\n\nWith your [pc.pussy " + vagIdx + "] already lubed up and loosened, he can start thrusting against your hips roughly. You bite the pillow and reach to massage your [pc.breast] and [pc.clit " + vagIdx + "] while your pussy is getting stuffed for the second time.");
	output("\n\nBy now you’re sure that the neighbors can hear you, but you don’t care, in fact, you want them to know that you’re getting bred by your stud. But unfortunately, having just fucked you silly, he seems to be close to the edge.");
	output("\n\nHis knot is already starting to swell, his breathing is ragged, and he’s grabbing your hips tightly. Screaming out in orgasmic bliss you clench your cunt around his knot as he pushes it inside before it can swell to its full size. Seconds after it’s fully sheathed in your tunnel it bloats to its full size, locking the two of you together again.");
	output("\n\nOwing to having filled you with cum just a while ago, his load isn’t as plentiful it was then, but it’s still more than enough. Your already stuffed womb somehow manages to find more space for all of his cum. You rub your extended belly and moan contently as you imagine it round with his pups.");
	output("\n\nHaving spent the last of his load safely inside you, he pulls you along with himself as he lies down on the bed. Even if you weren’t tied by the genitals you wouldn’t complain about being the little spoon of " + (flags["FADIL_TALKED_DADDY"] == undefined ? "the hunky ausar" : "your Daddy") + ". With the load of warm cum satiating your heat for the time being you find yourself falling asleep in a matter of moments.");
	output("\n\nSleep finds you quickly due to having been so thoroughly fucked and listening to the steady quiet breathing has set your mind at a relaxed state.");

	addButton(0, "Next", timeForPostFadilHeatNaps, vagIdx);
}

public function timeForPostFadilHeatNaps(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showFadil(true);
	author("Doots");
	processTime(45+rand(101)+rand(96));

	output("The first thing that comes to mind is how sore your [pc.pussyNounComplex " + vagIdx + "] is. It feels like it’s been pounded to hell and back. You gingerly stand up, trying not to wake " + fadilDaddy() + ", but since his assumedly equally sore cock is still balls deep in you that’s an impossibility.");
	output("\n\n<i>“That was certainly something. It’s been ages since I’ve been with a girl in heat,”</i> he notes. Looking at the sorry state of the bedclothes, he sighs and assures you that he can handle it on his own and that you should head out ahead of him, as it could take a while.");
	output("\n\nAs you walk bowlegged into the bar you’re met with a mixture of lust, awe, and disapproval from the gaze of the patrons, but you ignore them all since you still have " + fadilDaddy() + " on your mind, and no one in here could measure up to him. Just thinking about him has your pussy drooling again. You shake your head in an attempt to clear your thoughts about the older ausar gentleman but only succeed in making yourself hornier. Before you end up masturbating in front of the bar you meld into the crowd of people and get ready to move on.");

	//raise current lust by 20%
	pc.lust(15+pc.libido()/10);
	IncrementFlag("FADIL_SEXED");

	addButton(0, "Next", mainGameMenu);
}

public function fadilGetsNoBitchesInHeatToday():void
{
	clearMenu();
	clearOutput();
	showFadil();
	author("Doots");
	processTime(1);

	output("You apologize for not thinking about coming to him in a such a state. Not wanting to torment him with your pheromone-laced scent, you decide to make a tactful retreat.");
	output("\n\nDespite you leaving hastily, he’s still flustered by a quick whiff of your scent. He seems to have trouble concentrating, and he’s clearly pitching a tent. You feel bad about getting him to this state, but you have something else in mind. You mix into the crowd.");

	addButton(0, "Next", mainGameMenu);
}