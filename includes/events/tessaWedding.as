// Tessa x-pack
// It's a nice day for a white wedding

/*
 * The Wedding event is determined by choices and a 5 category point system.
 * Choices you make will earn or remove points from each category,
 * and the ending result of the event will be determined by a mixture
 * of which route you take and how many points you have in some measure.
 * The point categories are: Tessa Approval. Tessa Alcohol lvl. Your Alcohol lvl.
 * Bride Side Approval. Groom Side Approval. 
*/

/*
 * Flags:
 * TESSA_WED_ENDING:	stores the ending. obviously.
 * TESSA_WED_TIMESTAMP: when wedding ended
 * TESSA_WED_REVIEW: 	0 if review scene should happen, one after it does or if it doesn't need to be seen
 * 						unlocks bedroom scene
*/

//no nude 'cause you could just call showTessa(true) anyways
public function showWeddingTessa():void
{
	showTessa();
	//showBust(WEDDING TESSA)
	showName("\nWEDDING");
	author("Fr0sty");
}

public function showTessaTeacher(tessaThere:Boolean = false):void
{
	if (tessaThere) showWeddingTessa(); // add wedding tessa and teachy man later on
	if (tessaThere) showName("BARNEY\n& TESSA");
	else showName("\nBARNEY");
	author("Fr0sty");
}

public function showTessaClark(nude:Boolean = false):void
{
	showName("\nCLARK");
	author("Fr0sty");
}

public function showTessaAdra(tessaThere:Boolean = false, nude:Boolean = false):void
{
	if (tessaThere)
	{
		showTessa(nude);
		showName("ADRA\n& TESSA");
	}
	else
	{
		showName("\nADRA");
		// Bust goes here
	}
	author("Fr0sty");
}

public function showTessaKaren():void
{
	showWeddingTessa();
	showName("TESSA\n& KAREN");
}

public function showTessaWedCouple(nude:Boolean = false):void
{
	if (!nude) showWeddingTessa();
	else showTessa(true);
}

// Making a little object to handle this
// It's dirty but it works
// Most flags don't get used again so no reason to store them
// And I don't wanna do bitmask bullshit
public var tessaHandler:Object;

public function heyLittleTessaWhatIsItYouWant():void
{
	clearOutput();
	clearMenu();
	showTessa();

	output("You ask Tessa about that favor she mentioned.");
	output("\n\nThe white woman stares at you a moment, her expression suddenly becoming serious. <i>“Ah, yeah... That.”</i> She sighs and sips her drink. Her body language is screaming discomfort as she shifts in her chair. <i>“Okay, well I was wondering if you would...Um... Go to a wedding with me.”</i>");
	output("\n\nYou stare blankly at the white ovir a moment, contemplating her request. <i>“Like, as a date?”</i>");
	output("\n\nTessa presses her lips tightly together, seemingly fighting off a scowl. <i>“No. Not like a date, asshat.”</i> The pale woman rubs her brow and takes a deep breath, collecting herself. <i>“More like... I don’t know. For show.”</i>");
	output("\n\nYou tell your ovir friend she is going to need to explain her request better than that.");
	output("\n\nThe pale woman groans, rolling her eyes so hard you suspect she caught a glance at her brain. <i>“Fuck. Fine. I want you to come with me to this wedding, pretend we’re a happy couple and make me seem like I’m successful and well adjusted. Happy?”</i>");
	output("\n\nAs the two of you stare at each other a moment, you let the request hang in the air. You break the silence after a few heartbeats. <i>“Why are you asking me?”</i>");
	output("\n\nTessa’s red orbs roll once more, although not quite as strongly as before. <i>“Because you’re [pc.Name] Steele. Does that answer your question?”</i> The ovir stares at you a moment, then sips her drink again before continuing. <i>“Look. You’re the heir to the biggest fortune ever or something like that. If I show up on your arm I’ll look like hot shit and make it look like I’ve done well for myself.”</i>");
	output("\n\n<i>“And you want to do this... why?”</i> You suspect you know the answer, but ask regardless.");
	output("\n\nThe pale woman doesn’t answer right away, instead thinking on the question a moment. <i>“Well... The wedding is for two... Uh... Friends I grew up with. Preschool up until the end of graduation so we all go way back. Half the people at the wedding are going to be from... Back home...”</i> Tessa clears her throat a bit, then takes a large pull off her drink. <i>“Look. I just want to make a good impression, okay? Will you come with me or not?”</i> Her red eyes stare at you, expectantly.");

	processTime(2);
	flags["TESSA_TALKED_MAIL"] = 1;

	//Plays Agree to Help. 
	addButton(0, "Roll With It", whenYoureRightThereWithHerMailDontCallTessaToTellHerShesAlone, undefined, "Roll With It", "Okay then?");
	//If Pass for now is selected, Agree to Help replaces Email on Tessa’s main talk menu until selected.
	addButton(1, "Pass For Now", function ():void
	{
		clearOutput();
		clearMenu();
		showTessa();
		output("You tell Tessa you’ll think about it and get back to her.");
		output("\n\nTessa frowns at you and sighs, clearly disappointed. <i>“Right. Well, offer stands if you change your mind. Just don’t take too long. The wedding is coming up.”</i>");
		addButton(0,"Next",talkWifDatLizTessa);
	}, undefined, "Pass For Now", "You need to think about this.");
}

public function whenYoureRightThereWithHerMailDontCallTessaToTellHerShesAlone():void
{
	clearOutput();
	clearMenu();
	showTessa();

	output("You tell Tessa that you will help and go to the wedding with her.");
	output("\n\nThe pale woman’s face lights up, and you can’t help but notice her tail start to wiggle behind her. <i>“Really? Oh, thank fuck. If I had to go solo to this thing I’d have died.”</i> Tessa chuckles to herself and sips her drink. <i>“I don’t exactly know a lot of people, so the list of candidates I trust and who would be worth bringing was pretty... Well, it was pretty much just you.”</i>");
	output("\n\nYou inquire exactly when and where this wedding is and the two of you chat back and forth a few minutes, working out some of the details.");
	output("\n\n<i>“So just meet me at my ship when you’re ready to head out. Make sure you’ve got your shit together before you do, we’ll be gone for over a day I expect.”</i> Tessa sighs and smiles at you. <i>“Thank you for this. Seriously. We’ll show those fuckers just how well adjusted and awesome my life is!”</i> She takes a hearty swig of her drink, her tail swaying behind her.");
	output("\n\nYou press your lips together, knowing better than to comment on that.");

	processTime(1);
	flags["TESSA_TALKED_MAIL"] = 2;

	addButton(0, "Next", mainGameMenu);
}

public function tessaHangarBonus(btnSlot:int = 1):void
{
	output("\n\nYou spot Tessa’s sleek black ship, called Ebony, nearby. She told you to meet her there when you’re ready to head to the wedding.");
	addButton(btnSlot,"Tessa’s Ship", function ():void
	{
		clearOutput();
		clearMenu();
		output("You approach the Ebony. Are you sure you’re ready to head to the wedding?");
		output("\n\n<b>This may take awhile...</b>");
		//Starts the Wedding Event.
		//Removes “Tessa’s Ship” option from tile.
		//Player must be a biped
		if (!pc.isBiped()) addDisabledButton(0, "Enter", "Enter", "The wedding’s dress code is clear: Two legs only.");
		else addButton(0, "Enter", itsTimeForAWhiteTessaWedding);
		addButton(1, "Wait A Bit", function ():void
		{
			clearOutput();
			clearMenu();
			output("You decide to wait a bit before heading out.");
			addButton(0, "Next", mainGameMenu);
		});
	});
}

// Phase 1: Getting ready
// Part 1:
public function itsTimeForAWhiteTessaWedding():void
{
	clearMenu();
	clearOutput();
	showTessa();
	processTime(5);

	output("You enter Tessa’s ship and take a quick look around. While Tessa is nowhere to be seen, you hear her making some noises from her bedroom. She calls out to you, telling you she’ll be right out. You move around the main hold of the small ship and spot two outfits laid out on the couch. A sleek black suit and a gorgeous silver dress. Curiously, both seem to be your size...");
	output("\n\nTessa exits her room, wearing her fuzzy pink robe and nothing else, her hair messy and looking like she just woken up. <i>“Ah, Steele. You’re earlier than I expected. I still need to take a quick shower.”</i> She spots you looking at the two outfits. <i>“Right, yeah. I rented those for you. Sized you up pretty well during all our play time. Figured I’d rent ya one of each. Way the galaxy is these days you never know what people are into wearing. Well, pick one and put it on.”</i>");
	output("\n\nYou pause a moment, thinking about what you’re going to do.");

	tessaHandler = {
		weddingStart: function():void
		{
			this.tessaApproval = 0;
			this.groomApproval = 0;
			this.brideApproval = 0;
			this.tessaBooze = 0;
			this.steeleBooze = 0;
			this.flaskCount = 7;
			this.lewdness = false;
			this.adraValOne = false;
			this.adraValTwo = false;
			this.insight = false;
			this.clothes = false;
			this.caughtBouquet = false;
		},
		tessaDrinks: function(drinks:int = 1, fromFlask:Boolean = true):void
		{
			this.tessaBooze += drinks;
			if (fromFlask) this.flaskCount -= drinks;
		},
		youDrink: function(drinks:int = 1, fromFlask:Boolean = true):void
		{
			this.steeleBooze += drinks;
			if (fromFlask) this.flaskCount -= drinks;
			while (drinks-->0) kGAMECLASS.pc.imbibeAlcohol(25);
		},
		brideApproves: function(approval:int = 1):void
		{
			this.brideApproval += approval;
		},
		groomApproves: function(approval:int = 1):void
		{
			this.groomApproval += approval;
		},
		tessaApproves: function(approval:int = 1):void
		{
			this.tessaApproval += approval;
		}
	};
	tessaHandler.weddingStart();
	generateMapForLocation("SPACE");

	//+1 to Tessa Approval
	//Adds Suit Value
	addButton(0, "Pick Suit", withTessasMirrorReflectionImDressingUpMyself, "suit");
	//+1 to Tessa Approval
	//Adds Dress Value
	addButton(1, "Pick Dress", withTessasMirrorReflectionImDressingUpMyself, "dress");
	addButton(2, "As You Are", withTessasMirrorReflectionImDressingUpMyself, false);
}

// Part 2:
public function withTessasMirrorReflectionImDressingUpMyself(clothes:*):void
{
	clearMenu();
	clearOutput();
	showTessa();
	processTime(5);

	if (clothes)
	{
		output("Tessa nods her head and smiles. <i>“Alright then. Hey, you do you. I don’t think people will care what you wear there to be honest. I wouldn’t bat an eye if half the men there were in a dress the way things are these days.”</i> You reach for the " + clothes + " and start to get changed. Tessa moves over to you and helps adjusts your outfit, fretting over you a moment. <i>“I think you got fat or something... No, nevermind it’s fine.”</i> She takes a step back and smiles at you, pleased with your appearance. <i>“You look " + (clothes == "suit" ? "dashing" : "exquisite") + ".”</i>");
		tessaHandler.clothes = clothes;
		tessaHandler.tessaApproves();
	}
	else output("Tessa frowns at that. <i>“Alright... Well, I guess you do you... Those rentals weren’t cheap, but oh well. I don’t think people will care what you wear there to be honest. I wouldn’t bat an eye if half the men were in a dress the way things are these days... But I wish you would have worn one of the two I brought...”</i> You can tell Tessa is disappointed in your choice.");
	output("\n\nTessa turns and sighs. <i>“I’m heading into the shower. I should only be 20 minutes at most. Just take a seat and relax or something while I’m in there. And stay the fuck out of my room!”</i> Tessa pads off to the bathroom, followed a by the sound of her shower turning on a moment later.");
	output("\n\nWhat to do, what to do.");

	addButton(0, "Her Room", lookForSomethingLeftInTessasRoom);
	//-1 Tessa Approval.
	addButton(1, "Try To Peek", gotNoPeekingGraceYourEyesWithoutAFace);
	addButton(2, "Sit And Wait", itsTessasDiaryThatWillLastLikeAPostcardFromThePast);
}

public function lookForSomethingLeftInTessasRoom():void
{
	clearMenu();
	clearOutput();
	processTime(5);

	output("You wait a moment then head over to Tessa’s bedroom door. You press a button on the door’s control panel, but are denied access. Locked. You can’t help but frown at that. Why tell you not to go into her room if she locked the door? What a bitch. You try the panel again for a few minutes, attempting to guess her code, but are still unable to open it. Defeated, you head over to the couch and take a seat.");

	addButton(0, "Next", easyToDeceiveEasyToTeaseButHardToTellTessaWhatYouThink);
}

public function gotNoPeekingGraceYourEyesWithoutAFace():void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(5);

	output("You wait a moment then head over to Tessa’s bathroom door. You press a button on the doors control panel and it slides open with no issue. A wave of hot air blasts you in the face, and a large amount of steam escapes from the tiny bathroom. <i>“What the fuck, <b>Steele?</b>”</i> You hear Tessa yell from the shower, clearly alerted by your presence. She pokes her head out from the side of the curtain, water dripping from her face, her red eyes narrow and angry. <i>“Are you fucking serious?”</i>");
	output("\n\nTessa rips the curtain aside and stomps out of the shower, water falling from every curve of her finely shaped white body, her magnificent chest jiggling with each angry step. She marches right up to you, growling like an animal, and gives you a strong kick to the midsection, knocking you backward. <i>“I’m trying to fucking shower, asshole! Go sit on the fucking couch!”</i> With that she closes the door from her side, with the audible sound of the lock switching on.");
	output("\n\nYou rub your stomach, a small wet patch now spreading where she kicked you. You spend a few minutes finding a cloth then head over to the couch to dry off the best you can. Well at least you got to see her naked.");

	tessaHandler.tessaApproves(-1);

	addButton(0, "Next", easyToDeceiveEasyToTeaseButHardToTellTessaWhatYouThink);
}

public function itsTessasDiaryThatWillLastLikeAPostcardFromThePast():void
{
	clearMenu();
	clearOutput();
	processTime(1);

	output("You sit on the couch and wait. A minute or two passes and boredom slowly starts to set in. You search around for something to do while you wait. You find a small stack of paper books under the couch and start to look through them. The first two on the pile are typical trashy romance novels you’ve never heard of. Something about vampires based on the covers. The third book in the pile catches your eye however.");
	output("\n\nIt’s a relatively thick faux leather book with a blank cover. You flip to the first page and note the first line is a date entry for the first day of the year, written in pen from a several years ago. You quickly flip to the end and see another date entry for the last day, in the same handwriting as the first page.");
	output("\n\nYou realize you are holding Tessa’s diary, one from several years ago at least. You run your finger along the spine of the book a moment. Thinking about what to do.");

	addButton(0, "Read It!", readingMurderDiariesTrynaStayHip, 0);
	addButton(1, "Put It Back", function ():void
	{
		clearMenu();
		clearOutput();
		processTime(4);
		output("You put the diary back under the couch along with the other books. Hopefully leaving no trace you even pulled them out. You sigh and sit in silence, browsing your codex to kill time, while waiting for Tessa.");
		addButton(0, "Next", easyToDeceiveEasyToTeaseButHardToTellTessaWhatYouThink);
	});
}

// Diary Scene Main
public function readingMurderDiariesTrynaStayHip(page:int):void
{
	clearMenu();
	clearOutput();
	showName("TESSA’S\nDIARY");
	author("Fr0sty");
	processTime(1);

	switch (page)
	{
		default:
		case 0:
			output("You crack open the diary and start flipping through pages, trying to find a good entry to browse in what little time you have. You settle on an early date and start to read.");
			output("\n\n<i>“Dear Diary:");
			output("\n\nFuck I miss home. If I heard a year ago I’d be writing that down with my own hand I’d have laughed. Work was miserable today, like usual. I need to find something else. Serving drinks is shit and the people here are even worse. That strange creeper was back again, and I’m pretty sure he’s a criminal or something. Maybe I should report him. Who knows if it would matter.");
			output("\n\nDax hasn’t called me back yet. I think we’re done. I don’t even know if we were really even dating or not. I don’t suppose it matters. I always thought it would be easier to date once I left home, but now it’s just new kinds of bullshit. At least back home I knew who was worth a damn. Even if it took forever to figure it out. And even if I fucked things up. I think I might go back, maybe it’s not too late. She’d take me back right?”</i>");
			output("\n\nYou flip a few months ahead, finding another interesting entry.");
			break;

		case 1:
			output("<i>“Dear Diary:");
			output("\n\nBounty Hunting is the best! I can’t believe how easy it is. All you do is find people and get paid. I’ve officially made more money this month than I did in the last year. I’ve got my eye on this small ship Barnes is trying to sell. I think it’s stolen, but whatever. A few more catches and I can totally afford it. I guess that’s one pro to living in a shit part of the galaxy: All the scumbags are there with you, and somebody will pay you to find them.");
			output("\n\nTalked to Mom today. Things are good back home. I don’t know when I’ll visit next, but it might not be for a while. Told mom that and it made her sad, I think. Still haven’t told her what I’ve been up to. Gonna have to come up with something to tell her soon. Maybe I’ll tell her I’m volunteering or something nice. She’d like that.”</i>");
			output("\n\nYou flip to the near the end of the diary, another entry standing out.");
			break;

		case 2:
			output("<i>“Fucking shit fucker assholes. I hate fucking asshole cunt bitches with their fucking fuck fuckers. Big-cocked asshole alpha male horse shi-”</i> The rest of the page is covered in more expletives, and a drawing of what seems to be a man hanging from a noose with his dick cut off. Clearly, she had a bad day.");
			output("\n\nYou flip to the final entry, the last day of the year. Dried tear stains cover the page.");
			break;

		case 3:
			output("<i>“Dear Diary:");
			output("\n\nBack out in the great expanse today. Dunno when I’ll head back home again. Mom and Dad were happy to see me for the holidays. God it was nice to see them. I needed it. They don’t know what I’ve been up to. It’s been almost a month and I still feel dirty.");
			output("\n\nIf they knew where I got the money for their gifts would they have still taken them? Would they still love me? I tell myself they would, but I don’t know.");
			output("\n\nI dreamt about him again. The way he begged. His eyes. I almost threw up when I woke up today. I tell myself it could have been different. That it didn’t need to happen that way. Then I remember those little girls and what he did. What he stole. That helps. I wanted to tell Mom everything. She would have known what to do. Maybe. I’m afraid of what else she might say.");
			output("\n\nIt’s almost midnight. I wonder who I’ll be this time next year.”</i>");
			output("\n\nYou close the diary and think about that.");
			break;
	}

	// Yeah it gets set to true four times but whatever.
	tessaHandler.insight = true;

	if (page < 3) addButton(0, "Next", readingMurderDiariesTrynaStayHip, ++page);
	else addButton(0, "Next", easyToDeceiveEasyToTeaseButHardToTellTessaWhatYouThink);
}

// Part 4:
public function easyToDeceiveEasyToTeaseButHardToTellTessaWhatYouThink():void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(2);

	output("You hear the water turn off. Tessa exits the bathroom and heads straight for her room, her pink robe on but open, leaving her white midsection revealed in the fleeting glance you get of her. A minute passes and she exits her room, wearing a fancy black matching bra and panty set. The bra is doing unbelievable work, making her already impressive chest look even bigger and more pronounced. After a moment you realize you’ve never seen her wear a bra before. Or panties for that matter.");
	output("\n\nTessa smirks, catching your gaze on her erotic attire. The female ovir does a small spin, showing off her round alabaster ass, and revealing her panties to be a blank thong. The way the straps sit under her curve of her tail suggest to you the underwear was made for ovir. <i>“Can you believe they had this in the men’s section?”</i> Tessa shakes her head and chuckles to herself.");
	output("\n\nOnce you get over the sight of her underwear, you notice Tessa holding a small black dress in her hand. She pulls it over her head and you can’t help but blush at how short and tight it is as she maneuvers into it. <i>“Um... You’re wearing that to a wedding?”</i>");
	output("\n\nTessa smirks as she slides her tail through a head sized hole in the back of the dress, suggesting the dress was also made for ovir. She adjusts the hem a bit and poses for you. <i>“Of course. I want to turn heads.”</i> The dress is more a cocktail dress than anything, showing off all of Tessa’s bra enhanced cleavage, and hugging close along her womanly hourglass hips. Her tail sticks out of the tight hole in the back, the fabric underneath tightly pulled against her round rear.");
	output("\n\n<i>“Well? How do I look?”</i>");

	//+1 Tessa Approval
	addButton(0, "Good", heyLittleTessaWhatDoWeSayWeHaveWeDone, 1);
	//+1 Tessa Approval
	addButton(1, "Sexy", heyLittleTessaWhatDoWeSayWeHaveWeDone, 1);
	//+1 Tessa Approval
	addButton(2, "Like A Hooker", heyLittleTessaWhatDoWeSayWeHaveWeDone, 1);
	addButton(3, "Stay Silent", heyLittleTessaWhatDoWeSayWeHaveWeDone, 0);
}

// Part 5:
public function heyLittleTessaWhatDoWeSayWeHaveWeDone(approval:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(3);
	
	output("Tessa laughs. <i>“Well that’s a reaction I guess. I still have to do my hair, but we can do that on route. First we have to make sure we are on the same page.”</i> Tessa’s red eyes go serious and narrow. <i>“We need to get our story straight, in case we are asked.”</i>");
	output("\n\nYou nod, listening to her plan.");
	output("\n\n<i>“Okay. So I’m your girlfriend. Let’s say we met at some... Steele sponsored charity or something. Oh! Right, they think I do charity work. Um... let’s say I’m not working at the moment. Like we’re some old fashioned couple or something dumb. You... Well, we can tell people the truth. A brave adventurer exploring the galaxy. Maybe leave out the X-rated bits?”</i> Tessa’s eyes narrow further, her red orbs intense. <i>“And do not under any circumstances talk about our sex life. Fictional or otherwise.”</i>");
	output("\n\nYou laugh at that, but Tessa’s intense gaze forces you to stop and you agree to the rule.");
	output("\n\nTessa relaxes. <i>“Good. Also if possible, try not to talk about me when I’m not around to lead the conversation. These people... talk. If you say something to somebody the whole room will know. <b>Remember that</b> nothing you say will be private!”</i>");
	output("\n\nYou nod at that, taking careful note that your words will travel.");
	output("\n\nThe ovir smiles. <i>“Alright. So guess I should mention the bride and groom, huh? They’re names are Karen and Monty. Wait, he might go by Montgomery now? Um... Fuck it’s been awhile. Anyways, Karen is an angel. Invited me to all her birthdays from age four until... well now. I seriously still get invites.”</i> Tessa shakes her head slightly. <i>“Monty is... Okay. I mean he was a total nerd growing up. Didn’t talk to him much, but he was never mean to me or anything.”</i> Tessa points a sharp finger at you. <i>“<b>Be. Nice.</b> I like them. Don’t ruin their wedding or I swear to fucking god I will lose my shit.”</i>");
	output("\n\nYou stare at Tessa a moment, agreeing to be nice as best you can. She eyeballs you hard for a moment. You get the impression she doesn’t believe you.");
	output("\n\n<i>“Right. Well. For other people try to be nice to as well. I want you to seem like a real catch after all. Not a fucking asshole.”</i> She sighs and heads into her room, coming back a second later holding a pair of black heels and a small clutch purse. <i>“I’m going to set the ship to start heading there, do my hair and brush my teeth.”</i> Tessa opens the purse and pulls out a flask. <i>“In a shocking twist, this isn’t beer. I figured I’d need something stronger. One for the road?”</i> She offers you the flask.");

	tessaHandler.tessaApproves(approval);

	//+1 Tessa Alcohol lvl, +1 Your Alcohol lvl. -2 Flask Charge out of 7.
	addButton(0, "Go For It", tessaKnowsYoureGonnaFlyOnASpaceHighway, 2);
	//+1 Tessa Alcohol lvl. -1 Flask Charge out of 7.
	addButton(1, "Pass", tessaKnowsYoureGonnaFlyOnASpaceHighway, 1);
	addButton(2, "Suggest Sober", tessaKnowsYoureGonnaFlyOnASpaceHighway, 0, "Suggest Sober", "Suggest going sober for now.");
}

// Part 6:
public function tessaKnowsYoureGonnaFlyOnASpaceHighway(drinkation:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	
	if (drinkation == 2) output("You take the flask and knock back a mouthful of the powerful drink, then pass it back. Tessa does the same and then returns the flask to her purse.");
	else if (drinkation == 1) output("You wave Tessa off and she shrugs, then she tosses back a heavy swig of the flask’s contents before returning it to her purse.");
	else output("Tessa frowns at you. <i>“Lame, but you might be right. For now then nothing.”</i> She returns the untouched flask to her purse.");
	output("\n\n<i>“Alright, Steele.”</i> Tessa heads off towards the cockpit of the ship. <i>“Should take us half an hour to get there. So sit tight.”</i> Tessa exits the room and you feel the ship rock a bit as it takes off. You sit back on the couch and feel the ship vibrate as it pushes through the atmosphere, and you jerk a bit as autopilot kicks in, straightening out the ship’s path. Tessa leaves the cockpit a minute later and sighs at you. <i>“Alright. Hair time.”</i>");
	output("\n\nYou follow Tessa with your eyes, watching her walk back to the bathroom, shoes and purse in hand. You sit a few minutes in silence, listening to her hum to herself over in the other room. You call out to her, trying to make conversation. <i>“So, Tessa. How many people are going to be there?”</i>");
	output("\n\nYou hear the ovir call back an answer, yelling louder than you. <i>“No idea.”</i> You hear a hair dryer turn on, ending the conversation. A few minutes pass and the dryer stops. Tessa returns to the main room, her long white hair bone dry. If you didn’t see her as often as you did, you doubt you would have been able to tell she even styled it at all. Her hair seems to have an extra shine as it sits on her shoulders, and you can faintly tell it has more volume than normal. Her shoes are also on her feet now, and she looks ready to go clubbing more than go to a wedding. <i>“Ready?”</i>");

	switch (drinkation)
	{
		case 2: tessaHandler.youDrink();
		case 1: tessaHandler.tessaDrinks();
	}

	processTime(27+rand(7));

	addButton(0, "Yes", tessaIsReadySteadyAndSetToGo);
	addButton(1, "No", tessaIsReadySteadyAndSetToGo);
	tessaWedCheckBlackout();
}

// Phase 1 End:
public function tessaIsReadySteadyAndSetToGo():void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(3);

	output("<i>“Too bad! Here we go, shitstain!”</i> Tessa clearly didn’t even listen for your answer, her yell a battlecry to pump herself up. The two of you wait a little while longer, making small talk to fight off the awkward silence that threatened to follow after Tessa’s outburst. Suddenly, the ship drops from warp with a small lurch, causing Tessa to take a deep breath and slap her cheeks. <i>“Alright. I’m gonna pilot us into the station. It’s just some private hall in the space boonies, guess it has a great view of some nebula or something. I don’t know. I looked it up for like twenty seconds just to check the directions.”</i> Tessa heads over to the cockpit, and you feel the ship’s short range engines kick in.");
	output("\n\nThe cruise to the small station only takes a minute, Tessa expertly pulling into a large hangar filled with a wide variety of ships. She sets it down in the first empty place she spots and powers down the engines. You get up off the couch and brush yourself off, making yourself presentable before you head out, face the people, and start your mission proper. Tessa exits the cockpit and moves towards you, grabbing your arm gently and pulling herself close to you. <i>“Remember, babe. We’re in love.”</i> She smirks at you, her tone exaggeratedly lusty and her red eyes giving you a sinful stare.");
	output("\n\nThe two of you exit the ship together, Tessa holding on to your arm tightly like a trophy wife. You take a look around the hangar and see several other couples moving towards a wide opening with a banner overhead reading ‘Hubbard Wedding’. Tessa elbows your side lightly, then motions towards the entry with her chin. You make your way over, Tessa still holding on, her tail wagging behind her lightly and a wide smile on her face. You notice the pale ovir’s eyes dart around, examining every face she sees carefully. Despite her carefree and happy look, she is clearly on alert.");
	output("\n\nThe two of you reach the entryway and pass through it, then see another sign pointing off to the left labeled ‘Ceremony’. <i>“Alright, Steele.”</i> Tessa’s voice it barely a whisper. <i>“Let’s do this shit.”</i>");

	addButton(0, "Do This Shit", itsANiceDayForATessaWedding);
}

// Phase 2: Ceremony
// Part 1: 
public function itsANiceDayForATessaWedding():void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(3);

	output("Together, you and Tessa make your way down the corridor, trailing behind a few other couples. You spot an usher standing at the end of the hall next to a wide set of open double doors, directing people as they reach him. You glance over at Tessa and notice her staring intently at the usher, contemplating something. Her thought is cut off by the unexpected sound of a woman’s voice behind you. <i>“Tessy?”</i> Tessa freezes and stops you both in your tracks, her face turning even more pale and her lips pressing tightly together. <i>“Tessy! Oh my god!”</i>");
	output("\n\nYou watch Tessa’s eyelids flutter and she sighs deeply, seemingly bracing herself. She releases your arm and turns on her heel, facing the woman behind you. Her face lights up instantly with what you know to be fake enthusiasm. <i>“Jan? Is that you?”</i> Tessa shrieks loudly, causing you to jump at the unexpected, and uncharacteristic, cry. She runs forward and embraces the woman called Jan, who starts shrieking as well along with Tessa. <i>“It’s been years! Oh my god, you look amazing!”</i> Tessa releases Jan from her hug, allowing you a clear look at the woman.");
	output("\n\nJan is very distinctly human, with light skin and a rich brown hair done up in a beehive hairstyle. She’s tall and rail thin, giving her a willowy appearance, and is wearing a long red dress that seems to hang off her slender shoulders, accentuating her slender form. She’s certainly pretty, but standing next to Tessa’s impressive curves she seems quite the plain jane by comparison. <i>“Oh please. Now you’re just flattering me. Look at you! You look...”</i> Jan looks Tessa up and down, an odd smirk on her lips. <i>“Womanly.”</i> You notice Tessa wince slightly at that. The thin woman turns her gaze to you, her smirk growing wider. <i>“And who is this fine young specimen?”</i>");
	output("\n\nTessa turns as well, giving a soft chuckle. <i>“This is... Um... This is...”</i> The white woman stutters on her words trying to introduce you, clearly knocked off her center.");

	//+1 to Bride Side Approval. +1 to Groom Side Approval.
	addButton(0, "[pc.name]", heyLittleTessaWhoIsItYoureWith, 0, "[pc.name]", "Just give your name");
	//-1 Tessa Approval. +1 to Bride Side Approval. +1 to Groom Side Approval.
	addButton(1, "Just Friends", heyLittleTessaWhoIsItYoureWith, 1);
	//+1 Tessa Approval. +1 to Bride Side Approval. +1 to Groom Side Approval.
	addButton(2, "Dating", heyLittleTessaWhoIsItYoureWith, 2);
	//-2 Tessa Approval. +2 to Bride Side Approval. +2 to Groom Side Approval.
	addButton(3, "Lover", heyLittleTessaWhoIsItYoureWith, 3);
}

public function heyLittleTessaWhoIsItYoureWith(answer:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(2);

	output("Without missing a beat, you step towards Jan and introduce yourself. <i>“Steele. [pc.name] Steele.”</i> You turn to Tessa and smile.");
	if (answer == 0) output(" The two women stare at you a moment, waiting for more. They exchange quick glances, seemingly a bit bewildered at your plain answer.");
	else if (answer == 1)
	{
		output(" <i>“I’m Tessa’s friend.”</i> You can’t help but notice Tessa’s eye twitch. She didn’t like that.");
		tessaHandler.tessaApproves(-1);
	}
	else if (answer == 2)
	{
		output(" <i>“Tessa is my girlfriend.”</i> Jan and Tessa exchange a quick glance, Tessa smiling widely.");
		tessaHandler.tessaApproves();
	}
	else
	{
		output(" <i>“We’re just sleeping together.”</i> Tessa blushes beet red at your declaration. You think for a moment her head might explode. Jan seems oddly unfazed.");
		tessaHandler.brideApproves();
		tessaHandler.groomApproves();
		tessaHandler.tessaApproves(-2);
	}	
	output("\n\nJan silently stares at you a moment while smirking, her face difficult to read. You can’t help but feel a bit uncomfortable at her gaze, her brown eyes almost as intrusive as Tessa’s. <i>“Interesting... Well it’s a pleasure to meet you, [pc.name]. That’s a very nice");
	if (tessaHandler.clothes) output(tessaHandler.clothes);
	else output("outfit");
	output(" by the way.”</i> Her eyes shift back to Tessa, the ovir seemingly regaining her composure. <i>“You know Tessy, this is the first time all us girls have been together since graduation! Isn’t that weird?”</i>");
	output("\n\nThe white ovir chuckles a bit. <i>“Well. I don’t know who’s all here so I can’t really say... I mean is Adra here? I haven’t seen her.”</i>");
	output("\n\nJan giggles, then gives Tessa a small pat on her shoulder. <i>“Adra is the Maid of Honor silly! You really have been out of the loop awhile.”</i> You notice Tessa’s jaw go tight, which Jan doesn’t seem to notice. Openly at least. <i>“Well. I’d love to stay and chat, but I’ve got to mingle before the ceremony starts. We can talk at the reception.”</i> Jan turns to you and smiles, but doesn’t offer you any further words. With that the willowy woman slips away, heading back down the hall from where she came.");
	output("\n\nTessa grabs your arm roughly and pulls you close, quickly whispering in your ear. <i>“Steele. You can not be alone with that woman.”</i> The ovir turns the both of you around, facing back towards the usher at the end of the hall. The two of you resume making your way towards the ceremony room. You start to question her on what she means by that, but Tessa cuts you off. <i>“No. I’m serious. I need you to-”</i>");
	output("\n\nTessa’s whisper is cut off by the usher. Without noticing it, you made it to the end of the hallway. <i>“Groom side or Bride side?”</i> The ovir clamps her mouth shut and quickly turns to face the usher, clearly not expecting the question. She stares at the usher blankly a moment, not having heard the question. <i>“Groom side or Bride side?”</i> The usher politely repeats himself.");
	output("\n\nTessa’s red eyes blink while she thinks about the question. <i>“Both?”</i>");
	output("\n\nThe usher sighs and rolls his eyes, turning to you instead. <i>“Groom side or Bride side?”</i>");

	tessaHandler.brideApproves();
	tessaHandler.groomApproves();

	//+5 Groom Side Approval
	//Adds Groom Value
	addButton(0, "Groom", tessaRoamingThroughSeatsThatAreEmpty, 1);
	//+5 Bride Side Approval
	//Adds Bride Value
	addButton(1, "Bride", tessaRoamingThroughSeatsThatAreEmpty, -1);
}

public function tessaRoamingThroughSeatsThatAreEmpty(sidePicked:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(3);

	output("The usher nods at you and gestures towards the room with an outstretched arm. <i>“" + (sidePicked < 0 ? "Left" : "Right") + " side please. First two rows are for family, any other seat is open.”</i> You and Tessa move past the usher, entering the room.");
	output("\n\nThe layout of the room is pretty much what you expected for a traditional terran style wedding ceremony. Two clusters of chairs, separated by a long carpeted aisle with a small stage on the end. What you didn’t expect was just how many humans were in the room. At a rough count you estimate there to be around eighty people so far, and out of the pack you only see a handful of other races. You feel Tessa grip your arm tighter. <i>“Feels like home alright...”</i>");
	output("\n\nThe two of you take a pair of open seats on the " + (sidePicked < 0 ? "Bride" : "Groom") + "’s side of the room in the back row. The chairs are small with half backs, allowing Tessa to slide her tail into the open space and sit comfortably. Tessa leans in close and starts to whisper. <i>“As I was saying before. Stay away from Jan. Don’t be alone with her whatever you do.”</i>");
	output("\n\n<i>“Why are you so worried? I thought she was one of your friends.”</i>");
	output("\n\nTessa goes silent a moment, considering how to answer. <i>“Friend? Me and Jan hung out together, sure. By the time we got to High School, Jan... Well she might have had less friends than I did. She’s a snake. And this is coming from someone with fucking scales!”</i> The pale woman scans the room, seemingly examining each person in the room one at a time. <i>“When people figured out she was a cutthroat bitch, most learned to keep their distance. Few of us didn’t. It was the four of us for a couple years. Karen, Jan, Adra and... Oh you’ve got to be fucking joking.”</i> Tessa’s gaze stops on the stage towards the end of the room, fixated on a statuesque tall blonde man.");
	output("\n\nYou examine the man a moment from a far, his position on the stage offering you a decent view of him. While you had certainly seen bigger people during your time adventuring, this man is certainly still impressive. He is at least 6’6 from what you can tell, and his suit seems filled out and almost stretched by more than a little muscle. The man oozes swagger, seemingly at perfect ease in the moment and more than a few lusty looks are aimed his way. Between his blonde locks and his impressive build, the man seems almost a male model. You turn back to Tessa. <i>“Who’s that?”</i>");
	output("\n\nTessa’s eyes stay fixed on the man a moment longer, then slowly her gaze turns over to you. <i>“The Best Man by the looks of it.”</i> You frown at Tessa, causing the white woman to roll her eyes. <i>“Right. Fine. That’s Clark. Monty’s cousin.”</i> Tessa’s gaze returns to the tall man. <i>“I knew he would be here, I’m just surprised he’s the Best Man.”</i>");
	output("\n\nYou ask Tessa how she knows him.");
	output("\n\nShe leans in close to your ear. <i>“From back home, dumbshit. It’s a small colony.”</i> You frown again at the pale woman, but she offers no further explanation. Instead she reaches for her purse and pulls out her flask. <i>“I need a drink if I’m going to sit through this.”</i>");

	if (sidePicked < 0) tessaHandler.brideApproves(5);
	else tessaHandler.groomApproves(5);

	//+1 Tessa Alcohol lvl, +1 Your Alcohol lvl. +1 Tessa Approval. -2 Flask Charge out of 7.
	addButton(0, "Ask For Some", tessaShowsHerDearFriends, 0);
	//+2 Tessa Alcohol lvl. -2 Flask Charge out of 7.
	addButton(1, "Just Her", tessaShowsHerDearFriends, 1);
	//+1 Tessa Alcohol lvl, +1 Tessa Approval. -1 Flask Charge out of 7.
	addButton(2, "Bad Idea?", tessaShowsHerDearFriends, 2);
}

// Part 4:
public function tessaShowsHerDearFriends(drink:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(5);

	switch (drink)
	{
		case 0: output("You ask if you can take a hit. Tessa hands you the flask and you knock back a mouthful, then pass it back to her. Tessa does the same and then returns the flask to her purse."); break;
		case 1: output("You watch Tessa take a mouthful of the flasks contents, then take a second quick hit right after before returning the flask to her purse."); break;
		case 2: output("You say it might be a bad idea to do that now. <i>“You know what? I know you’re right, but fuck it.”</i> She tosses back a quick mouthful from the flask then returns it to her purse."); break;
	}
	output("\n\nTessa motions up towards the stage again. <i>“There’s the Groom now.”</i> You turn and spot a second man on the stage, talking to Clark. The man named Monty stands a few inches shorter than his cousin, with a slimmer build while still seeming to be in very good shape. Aside from that you would have suspected the two to be brothers not cousins they resembled each other so closely. Both are basically blonde heartthrobs. Two or three more of them and they could start a boy band. <i>“Shit, he really filled out. Gotta say Karen bagged herself a good one. Clark may have the guns, but Monty’s far less... Douchey.”</i>");
	output("\n\nA few minutes pass by and the rest of the room fills up. You notice Jan slip into the room and take a seat on the Bride’s side near the front. Tessa notices this as well, and keeps a close eye on her. Shortly after, soft music fills the room, signalling the start of the procession. The Groom and his Best Man stay up on the stage, while one-by-one a few bridesmaids and ushers make their was up the aisle. Tessa leans in and tells you who they are as they pass by. They were almost exclusively siblings and cousins, and with the growing amount of tall blondes on stage now you think to yourself you might get your boy band after all. While you watch the last pair take their place the strong pull of Tessa gripping your arm shifts your attention to the back of the room.");
	output("\n\nA woman who you can only assume to be the Maid of Honor starts to make her way down the aisle. You stare at her a moment as she draws closer, your attention zooming in on the two pierced dog ears placed on the top of her head: She’s an ausar. The hair on her head is rich golden-blonde along with the fur on her arms, contrasted by a long dark purple dress that reaches down to the floor. While she seems quite tall, you suspect her perky ears and possibly some heels under the dress are the cause of her seeming to be so tall. As she moves past you, you notice her bright gold tail sticking out the back of the dress, wagging excitedly.");
	output("\n\nTessa leans in close and whispers. <i>“That’s Adra.”</i> You watch the ausar take her place on the stage, smiling out at everybody. <i>“Pretty fucking beautiful bunch up there, don’t you think?”</i>");

	tessaHandler.tessaDrinks();
	tessaHandler.tessaApproves();
	if (drink == 0) tessaHandler.youDrink();
	else if (drink == 1)
	{
		tessaHandler.tessaDrinks();
		tessaHandler.tessaApproves(-1);
	}

	//+3 Bride Side Approval, -1 Groom Side Approval.
	addButton(0, "Prefer Adra", tessaAsksIsThereSomeoneElseYouHoldDear, 0);
	//+3 Groom Side Approval, -1 Bride Side Approval.
	addButton(1, "Prefer Clark", tessaAsksIsThereSomeoneElseYouHoldDear, 1);
	//+1 Groom Side Approval, +1 Bride Side Approval, +1 Tessa Approval
	addButton(2, "Prefer Monty", tessaAsksIsThereSomeoneElseYouHoldDear, 2);
	//+2 Tessa Approval, +2 Bride Side Approval.
	addButton(3, "Prefer Tessa", tessaAsksIsThereSomeoneElseYouHoldDear, 3);
	tessaWedCheckBlackout();
}

// Part 5:
public function tessaAsksIsThereSomeoneElseYouHoldDear(choice:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(4);

	output("You remark to Tessa that you like " + ["Adra", "Clark", "Monty", "her"][choice] + " best. Tessa rolls her eyes and smiles, but doesn’t react further. You take one last look back up to the stage and notice Adra looking directly at you. You stare at her a moment then she gives her decorated ears a small wiggle and shoots you a smile. Oh shit. She heard you.");
	output("\n\nYou look away and turn to the back of the hall, just as the bride and her father start to enter. The whole room stands at the sight of her, and given your placement at the back of the room you suspect you currently have one of the best views. While you pay little attention to her father, you can’t help but give the bride a good look over. She is a small woman, with olive skin, long jet black hair pulled back tight, and a stunning smile. Her wedding dress was strapless, flowing behind her with a long trail, dragging along the floor neatly. Her chest, while as close to perfectly shaped as you’ve ever seen, does not seem particularly large despite being able to hold up her dress.");
	output("\n\nOnce she’s made her way onto the stage you can tell just how short she is standing next to both Monty and Adra, her head only reaching either of their chests. You glance at Tessa next to you who is smiling softly, seeming genuinely happy at the sight of her friend. Everybody takes their seats and the ceremony begins.");
	output("\n\nA few minutes in you find most of the the crowd fully engaged in the words of the Officiant. You glance around the room a bit, noting not a single person looking your way, aided by your choice to sit in the very back. Despite that, you can’t shake the feeling that you’re being watched...");

	switch (choice)
	{
		case 0:
			tessaHandler.brideApproves(3);
			tessaHandler.groomApproves(-1);
			break;
		case 1:
			tessaHandler.groomApproves(3);
			tessaHandler.brideApproves(-1);
			break;
		case 2:
			tessaHandler.brideApproves();
			tessaHandler.groomApproves();
			tessaHandler.tessaApproves();
			break;
		case 3:
			tessaHandler.brideApproves(2);
			tessaHandler.tessaApproves(2);
			break;
	}

	//+1 Groom Side Approval, +1 Bride Side Approval, +1 Tessa Approval.
	//Plays Part 6
	addButton(0, "Take Hand", theresOnlyBridesInSightInThisCrowdedTessaNight, 0);
	//+1 Tessa Approval.
	//Plays Part 6
	addButton(1, "Don’t Act", theresOnlyBridesInSightInThisCrowdedTessaNight, 1);
	//+2 Tessa Approval.
	//Plays Tessa’s Tail.
	//Adds Lewdness Value
	addButton(2, "Tell Tessa", function():void
	{
		clearMenu();
		clearOutput();
		showWeddingTessa();
		processTime(7);
	
		output("You lean in towards Tessa, your lips brushing against her snowy hair while you speak as quietly as you can to her. “I think we’re being watched.”");
		output("\n\nYou slowly ease back into your normal position, keeping your eyes frontward on the ceremony. To your side you hear Tessa gently shuffle, and the faint noise of her tail moving slowly on the ground. To most people, the sound of it would have been an innocent shifting, but Tessa isn’t one to make a sound she doesn’t want to.");
		output("\n\nGently and without warning, you feel the tip of her tail press you against the back of your leg. You almost jump out of your seat, the touch surprising you at first, but you steel your resolve and stay stoic. Her tail starts to run up and down your leg, stroking against you absently. Your eyes fall down to the long white tail, coiled around her chair, its tip brushing against you. You can’t help but ponder Tessa’s intentions. Is she trying to make a scene? Get you horny? You think a moment and come up with another answer: She’s putting on a show for whoevers watching with a public display of affection. You can’t help but smirk. She’s a clever girl.");
		output("\n\nYou sit and stay still, trying not to react to Tessa’s touch and draw more attention than your reaction already may have. Slowly, Tessa caresses along your leg upward, moving past your knee and reaching your thigh. After a few tense minutes of teasing, her tail seems to finish its journey and rests in your lap, the strong white appendage gently tapping against you. She wants you to touch it. With your right hand you run your fingers gently along her tail, the scaley mass of muscle smooth to the touch. You glance over at Tessa and notice her eyes are fixed straight ahead at the Bride and Groom. She isn’t even concerned with finding out who might have been watching. She shifts her tail again, daringly running the tip against your crotch. Your eyes open wide and you fight a gasp. What the fuck is she doing?");
		output("\n\nYou feel her tip trail gently around your [pc.groin] carefully and slowly teasing you. You fight to stay still, trying not to draw attention to yourself as the ovir woman makes your sex grow hot with her touch. The boldness of it was almost too much to believe. Tessa’s eyes stay locked forward on the stage, not regarding you in the slightest. Did she lose her mind? As subtle as you can, you grab Tessa’s tail with your hands and pull it off your crotch, trying to fight off the pale woman’s dangerous and lewd caress. Her powerful tail wiggles in your grasp, causing you to struggle to keep a hold of it.");
		output("\n\nAfter a minute of struggling her tail goes limp in your hands. Only then while holding her limp appendage do you realize Tessa’s plan. You feel the colour drain from your face and you drop her tail completely. To anybody watching from a distance, the sight of you struggling with her tail would have looked like you were boldly and quite openly playing with yourself. To the side, you think you hear the white woman giggle. You glance over at Tessa whose gaze is still fixed straight ahead.");
		output("\n\nTessa slowly, teasingly, drags her tail off of your lap and slides it behind the small of your back. It moves along silently until the tip pokes out on your other side and folds back around your waist. Is she... hugging you with her tail? Her strong appendage squeezes you a moment later, confirming your guess. Maybe a silent apology? Or maybe a reward for not making to much of a scene. Whatever the case, a faint smile forms on the corner of her mouth, and you follow her gaze back over to the stage. Did somebody really see that?");

		// the second approval point always happens on part 6
		tessaHandler.tessaApproves();
		tessaHandler.lewdness = true;

		addButton(0, "Next", theresOnlyBridesInSightInThisCrowdedTessaNight, 2);
	});
}

// Part 6: 
public function theresOnlyBridesInSightInThisCrowdedTessaNight(action:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(12);
	
	if (action == 0)
	{
		output("Deciding to try and keep up appearances, you reach over and take Tessa’s hand gently. The pale ovir doesn’t fight your attempt, and instead gives your hand a small knowing grip.\n\n");
		tessaHandler.brideApproves();
		tessaHandler.groomApproves();
	}
	else if (action == 1) output("You decide to try and play it safe and just watch the rest of the ceremony. You are careful to keep your eyes forward on the Bride and Groom, stopping them from wandering.\n\n");

	output("The ceremony continues on. Many minutes later you hear the officiant finally reach the end. <i>“Then by the power vested in me by the Church of the One God. I now pronounce you husband and wife. You may kiss the bride.”</i> Monty does just that, taking Karen up in his arms and planting an almost picture perfect kiss on his blushing bride. The kiss causes the whole crowd to stand and start clapping, including you and Tessa. You glance over at your white friend and notice tears welling up in her eyes as she claps. You always suspected she was a closet romantic.");
	output("\n\nThe Bride and Groom make their way together down the aisle excitedly waving to everybody with smiles beaming as they make their way through the crowd. Directly behind them Clark and Adra follow side by side, smiles almost as large while waving to the crowd as well. You can’t help but feel like they both toss lingering glances at you and Tessa specifically as they make their way past.");
	output("\n\nAs the rest of the party makes their way down the aisle and leaves the room Tessa turns to you and whispers. <i>“Well, that was the easy part. Dinner is next.”</i> The white ovir takes your arm again and grips it tight. The two of you notice Jan start to follow the party out and she looks over at the two of you, smirking. You feel Tessa’s fingers grip your arm tighter. Jan waves over cheerfully as she walks by, causing Tessa to wave back and smile. Muttering under her breath to you Tessa whispers. <i>“That fucking bitch; she’s fucking up to something.”</i>");
	output("\n\nAs several more people start to exit out, Tessa drags you off to a isolated corner of the room, still speaking in a hushed tone. <i>“Alright, I realize you might be a tad ill equipped for dinner conversation. I might have fucked up not talking about... Well, pretty much everything. So do you have anything you think you need to know?”</i>");

	tessaHandler.tessaApproves();

	addButton(0, "Your Home", withTheLightsSoLowAnInvitationToWhatTessaWantsYouToKnow, 0);
	addButton(1, "Monty", withTheLightsSoLowAnInvitationToWhatTessaWantsYouToKnow, 1);
	addButton(2, "Karen", withTheLightsSoLowAnInvitationToWhatTessaWantsYouToKnow, 2);
	addButton(3, "Adra", withTheLightsSoLowAnInvitationToWhatTessaWantsYouToKnow, 3);
	addButton(4, "Clark", withTheLightsSoLowAnInvitationToWhatTessaWantsYouToKnow, 4);
	addButton(5, "Jan", withTheLightsSoLowAnInvitationToWhatTessaWantsYouToKnow, 5);
	addButton(6, "Us", withTheLightsSoLowAnInvitationToWhatTessaWantsYouToKnow, 6);
}

// Phase 2 End:
public function withTheLightsSoLowAnInvitationToWhatTessaWantsYouToKnow(topic:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(6);

	output("You consider your options for a moment.");
	switch (topic)
	{
		case 0:	output(" <i>“Well, you could tell me more about where you guys are all from. I mean, I don’t even know the planet.”</i>"); break;
		case 1: output(" <i>“Tell me more about the Groom. Monty, right? What’s his story.”</i>"); break;
		case 2: output(" <i>“Let’s go over Karen first. She’s your friend, right? Sounds like a good place to start.”</i>"); break;
		case 3: output(" <i>“Adra. You two have some... history. Let’s start with that.”</i>"); break;
		case 4: output(" <i>“That Clark guy. What’s his deal?”</i>"); break;
		case 5: output(" <i>“Okay, I’ve got to know about Jan. What’s her problem?"); break;
		case 6: output(" <i>“Why don’t we start with us? I mean, we are pretending to be together. We should tighten our story up.”</i>"); break;
	}
	output("\n\nTessa sighs. <i>“Ah, okay well-”</i> Looking over your shoulder, Tessa cuts herself off, quickly changing the subject and ignoring the question. <i>“Yeah, she did look beautiful, didn’t she? When I get married I hope- Oh hey!”</i> You turn and notice Jan stalking up to you, a big toothy smile on her face. <i>“Jan! Wasn’t that a beautiful ceremony?”</i>");
	output("\n\n<i>“It was perfect wasn’t it? Well. Close to at least.”</i> Jan giggles softly, then lowers her voice. <i>“Maybe, it could have been a shade bit better with a few minor tweaks.”</i> Jan’s smile fades, her face on the verge of being serious, but still marked by her trademark smirk. <i>“I mean. Neither you nor I were even in the wedding party, after all. Curious isn’t it?”</i> Jan’s eyes flick over to you a moment, then back to Tessa. <i>“I mean, it just strikes me as funny is all.”</i>");
	output("\n\nThe white woman clicks her tongue and shrugs. <i>“Well, I’ve been out of the loop for years now. I understand why I would be excluded, but...”</i> Tessa’s eyes narrow. The two women stare at each other a moment, some unspoken ideas being exchanged. You feel the mood grow oddly tense, causing you to shift your weight back and forth. Tessa breaks the tension with a smile. <i>“Oh, I wouldn’t even know I suppose.”</i>");
	output("\n\nJan’s smirk turns into a proper smile again at that. <i>“Of course. Anyways, I’m here on business. Bride business if you can believe.”</i> Tessa’s smile shifts a bit, curiosity breaking through her smile. <i>“Our presence has been requested. Both of us.”</i> Jan’s eyes flick back over to you. <i>“Should only be a few minutes. Private stuff.”</i>");
	output("\n\nTessa turns to look at you, giving you a concerned stare for a moment. She turns back to Jan, her smile gone from her face. <i>“Of course.”</i> Tessa moves over to you and thrusts her purse into your hands. <i>“Wait here for me, okay?”</i>");
	output("\n\n<i>“Oh don’t be silly, Tessy! [pc.name] should head into the dining hall and get a drink. Open bar you know.”</i> Jan’s eyes shift back to you, her expression devious. <i>“[pc.HeShe]’ll be fine for a few minutes unattended. Right? What’s the worst that could happen?”</i>");
	output("\n\nTessa looks at you and presses her lips tightly together. She doesn’t seem to like that idea at all, but can’t offer a counterpoint. <i>“You’re right... Go ahead and find our seats while you’re at it okay, honey?”</i> The white ovir practically stalks in close and plants a quick smooch on your cheek. <i>“Be good.”</i>");

	tessaHandler.tessaApproves();

	//Plays Phase 3: Dinner
	addButton(0, "Uh. Sure.", soTessaLeavesHerDrinkAndGivesYouTimeToThink);
}

// Phase 3: Dinner
// Part 1:
public function soTessaLeavesHerDrinkAndGivesYouTimeToThink():void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(7);
	
	output("You watch Tessa and Jan depart, and you’re now standing alone holding the ovir’s small black purse. After a moment you shrug and follow the crowd out of the ceremony room, making your way down the hall to the reception. At the end of the hall you enter a larger room, filled with a veritable sea of tables and chairs. People, almost exclusively humans, move about the room, trying to find their seats and conversing amongst themselves. You take a deep breath and make your way inside.");
	output("\n\nYou scan the room, trying to spot anyone you’re vaguely familiar with. You note Clark off near the bar, talking to a few cute terran women. They seem to be enamored with him, talking enthusiastically to the dashing blonde man while he leans casually against the bar. You look around some more and spot a seating chart off to the side.");
	output("\n\nYou make your way over to the chart and browse it, searching for Tessa and your own names. You find Tessa’s, but are surprised to see her last name is ‘Hardy’. It occurs to you that Tessa never even bothered to mention it. Fuck, you’re really unprepared for this shit. You probably should have spent more than a few passing words on your backstory. Either way, her name is listed under table 8, as well as <i>Tessa’s +1</i>. You can’t help but frown at being reduced to a nameless “+1”. With a great sigh you shake it off and make your way over to the table. You take a seat at the so-far vacant table and set Tessa’s purse on the chair next to you. You stare at the small bag a moment, remembering the flask inside.");

	//+1 Your Alcohol lvl. -1 Flask Charge out of 7.
	addButton(0, "Quick Hit", tessasEyesSeemToPassYouByAndLeaveYouDrinkingWithYourself, 1);
	//+X Your Alcohol lvl, where X is remaining Flask Charge Value. Reduces Flask Charge to 0.
	addButton(1, "Finish Flask", tessasEyesSeemToPassYouByAndLeaveYouDrinkingWithYourself, 2);
	addButton(2, "Leave It", tessasEyesSeemToPassYouByAndLeaveYouDrinkingWithYourself, 0);
}

// Part 2:
public function tessasEyesSeemToPassYouByAndLeaveYouDrinkingWithYourself(drinks:int):void
{
	clearMenu();
	clearOutput();
	showTessaTeacher();
	processTime(5);

	switch (drinks)
	{
		case 0: output("You leave the purse and flask as is. Tessa would likely be pissed if you drank from it without permission."); break;
		case 1:
			output("A drink would be fantastic right about now. You rummage through Tessa’s purse and retrieve the flask. You pop it open quickly, toss back a mouthful, then return the flask to her purse before anybody notices.");
			tessaHandler.youDrink();
			break;
		case 2:
			output("You rummage through Tessa’s purse and retrieve the flask. You pop it open quickly, chug it down, then return the flask to her purse before anybody notices. Wow. That had some bite to it.");
			tessaHandler.youDrink(tessaHandler.flaskCount);
			break;
	}

	output("\n\nA couple minutes pass and more people enter the hall and take their seats. A few find their way to your table and sit down along with you, introducing themselves as they sit. One squat balding man sits next to you and introduces himself as Barney Willard. <i>“Pleased to meet you. Wonderful wedding, eh? Hope the spread is up to par, I’m starving!”</i>");
	output("\n\nMaking conversation, you ask Barney how he knows the Bride and Groom.");
	output("\n\nThe older man laughs, then gives you a firm pat to the shoulder. <i>“Old school teacher. I’ve known both of them for years.”</i> The small man looks around the room proudly. <i>“I’ve taught over half the guests here at some point or another. Pretty much every youngster back home spends a few years in my classroom at least.”</i> The older man leans in close, attempting to engage with you further. <i>“Oh yes. I’ve seen many faces over the years. I try to remember them all, and some make it easy for this old man, but it’s a challenge to remember so many.”</i> Barney sighs and stares off at the ceiling, rubbing his chin stoically. His gaze returns to you after a wistful moment. <i>“So, what brings you here? Memory is a bit hazy sometimes, but I definitely don’t remember you.”</i>");
	output("\n\nYou tell the aging teacher you’re here with Tessa.");
	output("\n\nThe old man’s face lights up in recognition. <i>“Tessa? Tessa! Oh, I remember Ms. Hardy quite well. Yes, one does not forget such a unique student like that no matter how many faces pass over the years.”</i>");

	//+1 Bride Side Approval. +1 Groom Side Approval.
	addButton(0, "Tessa", teachingTessaIsAMemoryThatWillLast);
	//+2 Bride Side Approval. +2 Groom Side Approval.
	addButton(1, "Other Students", tessasClassmatesAreHistoryThereForSteeleToSee);
	//+2 Tessa Approval. +2 Bride Side Approval. +2 Groom Side Approval.
	addButton(2, "Smile And Nod", function ():void
	{
		clearMenu();
		clearOutput();
		showTessaTeacher();
		processTime(9);
		output("You decide to just smile and nod along, barely listening to to man. You feel your eyes start to glaze over after a few minutes of tuning the old teacher out. You don’t even thinks he notices you barely listening.");
		tessaHandler.brideApproves(2);
		tessaHandler.groomApproves(2);
		tessaHandler.tessaApproves(2);
		addButton(0, "Next", tonightALittleTessaCameWalkingToMyTable, -1);
	});
}

// Part 3:
public function teachingTessaIsAMemoryThatWillLast():void
{
	clearMenu();
	clearOutput();
	showTessaTeacher();
	processTime(3);

	output("You decide to ask the wizen teacher about Tessa as a student.");
	output("\n\n<i>“Ah yes, Ms. Hardy was a very bright young woman, and very quiet and reserved as well. If she had not stood out so much due to her... Um...”</i> You notice the older man shift in uncomfortably his seat, searching for the right word. <i>“Species... She may have gone completely unnoticed.”</i> Barney sighs, absently scratching his chin. <i>“She was very quiet, stealthy even. I’d hazard a guess it’s an evolutionary trait the ovir developed long ago, but that girl could sneak up on anybody during even the deepest silence.”</i>");
	output("\n\nYou can’t help but recall a few instances of your pale friend showing off that same talent. You ask the teacher how he became acquainted with that skill set of hers.");
	output("\n\n<i>“She snuck up on me a few times over the years, whenever I’d not been fully paying attention. I don’t think she really understood just how stealthy she could be for quite some time.”</i> Barney softly laughs to himself then looks around the room. <i>“So where is our elusive friend? I hope she didn’t leave you to the wolves.”</i>");

	tessaHandler.brideApproves();
	tessaHandler.groomApproves();

	//+2 Tessa Approval. +1 Bride Side Approval. +1 Groom Side Approval.
	//Plays Part 4
	addButton(0, "Hope Not", tonightALittleTessaCameWalkingToMyTable, 0, "Hope Not", "You hope not.");
	//+1 Tessa Approval +2 Bride Side Approval.
	//Plays Part 4
	addButton(1, "Smth For Bride", tonightALittleTessaCameWalkingToMyTable, 1, "Smth For Bride", "She’s doing something for the Bride.");
	//-2 Tessa Approval. -2 Bride Side Approval. -1 Groom Side Approval.
	//Plays Part 4
	addButton(2, "Taking Dump", tonightALittleTessaCameWalkingToMyTable, 2, "Taking Dump", "She’s taking a dump.");
	//Plays Gossip Scene.
	//Adds Adra Value.
	addButton(3, "With Jan", soYouKnowTessasStoryWellHeWillTellYouASecret, undefined, "With Jan", "She’s with Jan.");
}

public function tessasClassmatesAreHistoryThereForSteeleToSee():void
{
	clearMenu();
	clearOutput();
	showTessaTeacher();
	processTime(3);

	output("You ask the old teacher about some of his other students.");
	output("\n\n<i>“Oh my. Well that’s a rather large topic. Well pretty much the whole wedding party for starters.”</i> The old man chuckles to himself. <i>“Keeping it a bit more applicable, I taught the Bride and Groom both. Young Montgomery was a bookish sort, very much the kind of child to sit alone and read instead of play with the other children. Karen was far more the social butterfly, and as far as I could gather she was for a time, the most popular girl her age.”</i>");
	output("\n\nYou cock an eyebrow at that. <i>“For a time?”</i>");
	output("\n\nBarney clears his throat then leans in close, speaking just above a whisper. <i>“Ah well. Just as far as I could observe at least. As an outsider looking inward.”</i> The older man’s eyes shift to the other people at the table. You look over at them yourself and note they all seem engaged in their own conversations, although a few of them toss glances towards you. <i>“I’m not one to gossip.”</i>");
	output("\n\nYou nod at the older man, tossing him a disarming smile. <i>“Of course. I understand completely.”</i>");
	output("\n\nThe old teacher’s lips curl into a small smile. <i>“I will say this, however.”</i> His tone was softer than before. <i>“Any sort of decline our dear Bride may have had in popularity may have been around when she started to spend more time with a select few other young ladies.”</i>");

	tessaHandler.brideApproves(2);
	tessaHandler.groomApproves(2);

	//+1 Bride Side Approval. +1 Groom Side Approval.
	//Plays Part 4
	addButton(0, "Ladies?", tonightALittleTessaCameWalkingToMyTable, 3);
	//+2 Tessa Approval. +1 Bride Side Approval. +1 Groom Side Approval.
	//Plays Part 4
	addButton(1, "Give A Nod", tonightALittleTessaCameWalkingToMyTable, 4);
	//-1 Tessa Approval. -1 Bride Side Approval.
	//Plays Part 4
	addButton(2, "Tessa’s Fault?", tonightALittleTessaCameWalkingToMyTable, 5);
	//Plays Gossip Scene.
	//Adds Adra Value 1
	addButton(3, "Jan And Adra", soYouKnowTessasStoryWellHeWillTellYouASecret);
}

public function soYouKnowTessasStoryWellHeWillTellYouASecret():void
{
	clearMenu();
	clearOutput();
	showTessaTeacher();
	processTime(6);

	output("The older man looks at you a moment, pressing his lips together tight. <i>“By Jan I assume you mean Janet Braun.”</i> The older man turns to the rest of the table, frowning at the others. While they pretend to not be listening, they hear the name spoken and seem to tense a bit. <i>“Maybe a bit of gossip is in order then. Or rather a warning.”</i> The rest of the table starts speaking louder to each other, drowning out any chance they could overhear you and the older man.");
	output("\n\nYou shift a bit in your seat. You can’t help but find the sudden change of tone more than a little weird and disturbing.");
	output("\n\nThe older man frowns. <i>“Don’t worry. Karen was quite sure when she made the seating plan that she put Tessa and you at a table where Janet’s presence would not be felt.”</i> Barney chuckles, breaking his frown. <i>“Managing both her and Adra all those years ago has made her quite the diplomat.”</i>");
	output("\n\nYou can’t help but be curious at that. <i>“What do you mean?”</i>");
	output("\n\n<i>“A teacher should never speak ill of his students, old or current, but Janet was a....”</i> he pauses, seemingly looking for a diplomatic term,<i>“...cunt.”</i> The older man sighs and rubs his chin. <i>“She had a nasty streak, and burned more bridges than any child should ever be able to. Karen, bless her soul, decided to befriend her, to try and stop her from being alone. Truthfully, that friendship likely stopped Janet from turning out worse. They were inseparable those two, which had the unfortunate side effect of pushing other children away. Well most of them.”</i>");
	output("\n\nYou nod, connecting the dots. <i>“Except for Adra and Tessa.”</i>");
	output("\n\nThe older man nods stoically. <i>“Correct. Their more obvious differences from the other children always had them a bit on the outs, as it were. They were all drawn together by being in similar positions.”</i> Barney rubs at his chin. <i>“Things went well for quite some time until... Well, I don’t think anyone, outside of those four, are quite sure what happened, but a rift formed. Some small innocent transgression, nothing friends shouldn’t have been able to work out... But Janet’s only friend was Karen.”</i>");
	output("\n\n<i>“Meaning?”</i> You lean in, invested in the story now.");
	output("\n\n<i>“Janet burned it down. Years of goodwill and, if I may be so bold, sisterhood thrown away over nothing. She turned them against each other, spreading rumors and toxic words to destroy the others. By the time people realized... the damage was done.”</i> The older man turns to face the rest of the table, chin in hand. <i>“Adra and Tessa got the worst of it. Tessa left the colony soon after, and Adra had a bit of a dark period of her own. Karen manages to still be friends with the both of them, and Adra and Janet play nice enough these days.”</i> The older man smiles and turns to you. <i>“Adra getting Maid of Honor over Janet is likely a result of that old transgression. Punishment even after all these years.”</i>");
	output("\n\nYou cock your head and stare at Barney a moment. <i>“So Adra and Tessa are on bad terms still?”</i>");
	output("\n\n<i>“I’m sure things have cooled, but... Well, if there was ever a time to mend old wounds, it would be today. Right?”</i> The old man smiles wistfully, then claps his hands together . <i>“Enough of that now. How about a brighter topic, eh?”</i>");

	tessaHandler.adraValOne = true;

	addButton(0, "Next", tonightALittleTessaCameWalkingToMyTable, -1);
}

// Part 4:
public function tonightALittleTessaCameWalkingToMyTable(reply:int):void
{
	clearMenu();
	clearOutput();
	showTessaTeacher(true);
	processTime(4);

	switch (reply)
	{
		case 1: case 4: output("Barney gives you a curious smile. He seems to know something more.\n\n"); break;
		case 0: case 2: output("Barney chuckles a bit at that, but you find the laugh oddly hollow. <i>“Well, let’s hope she hurries along.”</i>\n\n"); break;
		case 3: case 5: output("Barney looks over at the other people at the table and then back to you. Seems he doesn’t want to elaborate at the moment.\n\n"); break;
	}
	output("Barney continues talking for a few minutes longer, cutting himself off when he sees something over your shoulder. <i>“Ah, Tessa my girl!”</i>");
	output("\n\nYou turn and she Tessa coming up beside you, the white woman placing her clawed hand on your shoulder. <i>“Mr. Willard. Chatting up my date I see.”</i> Tessa moves her purse off of her chair and takes a seat. <i>“Hope you haven’t said anything too embarrassing.”</i> The pale ovir’s red eyes turn to you. She seems to be in a better mood than when you last saw her. <i>“Well, [pc.name]? Has he?”</i> She gives you a smile with her sharp teeth.");
	output("\n\nTessa’s addition to the table stirs up some more conversation, mostly between her and her old teacher. A few moments later the first course, a salad, starts to arrive, slowing down the conversation. After a few minutes enjoying your appetizer, a waiter arrives at the table asking for drink orders. He makes his way asking around the table, reaching you second to last, with only Tessa remaining after you.");

	switch (reply)
	{
		case 0: case 4: tessaHandler.tessaApproves(2); tessaHandler.brideApproves(); tessaHandler.groomApproves(); break;
		case 1: tessaHandler.tessaApproves(); tessaHandler.brideApproves(2); break;
		case 2: tessaHandler.tessaApproves(-2); tessaHandler.brideApproves(-2); tessaHandler.groomApproves(-1); break;
		case 3: tessaHandler.brideApproves(); tessaHandler.groomApproves(); break;
		case 5: tessaHandler.tessaApproves(-1); tessaHandler.brideApproves(-1); break;
	}

	//+3 Tessa Approval. +1 Bride Side Approval. +1 Groom Side Approval.
	addButton(0, "Water", orderingHolyWaterAndWineDrinkingItDownOh, 0);
	//+2 Tessa Approval. +2 Bride Side Approval. +2 Groom Side Approval.
	//+1 Your Alcohol lvl. +1 Tessa Alcohol lvl.
	addButton(1, "Beer", orderingHolyWaterAndWineDrinkingItDownOh, 1);
	//-1 Tessa Approval. +4 Bride Side Approval. +4 Groom Side Approval.
	//+2 Your Alcohol lvl. +2 Tessa Alcohol lvl.
	addButton(2, "Wine", orderingHolyWaterAndWineDrinkingItDownOh, 2);
	//-2 Tessa Approval. +4 Bride Side Approval. +4 Groom Side Approval.
	//+4 Your Alcohol lvl. +1 Tessa Alcohol lvl.
	addButton(3, "More Kick", orderingHolyWaterAndWineDrinkingItDownOh, 3, "More Kick", "Something with more kick.");
}

// Part 5:
public function orderingHolyWaterAndWineDrinkingItDownOh(drink:int):void
{
	clearMenu();
	clearOutput();
	showTessaTeacher(true);
	processTime(23);

	output("The waiter nods, then turns to Tessa. <i>“And for the lady?”</i>");
	if (drink < 3) output("\n\nTessa gives a lazy shrug. <i>“I’ll take the same.”</i> She turns to you and smirks.");
	else output("\n\nTessa turns to you, her eyes narrow and lips pressed tight together. She wasn’t too impressed. <i>“Beer me. Whatever you got in a bottle.”</i>");
	output("\n\nThe waiter nods and departs, leaving you with your salad. You chip away at it for a few minutes until the waiter returns, dropping off your table’s drinks. Shortly after a second waiter arrives with bowls of soup for the whole table. You sip at it gingerly, never having tasted anything like it before. Tessa explains it’s a recipe from her colony, using native herbs. You find it surprisingly tasty, and before long you’re staring at the bottom of an empty bowl.");
	if (yammiIsCrew()) output(" You might have to ask Yammi to figure out the recipe.");
	output("\n\nSoon after, the main course arrives. A rather impressive cut of meat you don’t quite recognize is placed in front of you. You assume it’s something else from Tessa’s home colony, much like the soup. You give it a small sniff and find it smells intoxicatingly delicious, so much so your mouth starts to water. You turn to Tessa and see the ovir woman already cutting into her meat, a hungry look in her eyes. With a shrug you do the same, cutting in and taking your first bite. An explosion of flavor fills your mouth as the meat hits your tongue, and you can’t help but quiver at the powerful taste. The meat wasn’t just good, it was extraordinary, the foreign flavor so addictively scrumptious you start to wolf it down, trying to remember your table manners.");
	if (yammiIsCrew()) output(" Seems you’re going to be keeping Yammi busy for the next few days...");
	output("\n\nAs you finish the last of you dinner you feel Tessa’s shoulder against your own, the ovir leaning into you lightly. <i>“So [pc.name]. What cha think?”</i> You look over and see her own plate bare. She clearly liked it. <i>“Well?”</i>");

	switch (drink)
	{
		case 3:
			tessaHandler.youDrink(4, false);
			tessaHandler.tessaDrinks(1, false);
			tessaHandler.flaskCount += 5;
			tessaHandler.brideApproves(4);
			tessaHandler.groomApproves(4);
			tessaHandler.tessaApproves(-2);
			break;
			
		// There's no reason to code it like this but it feels so sexy
		case 2:
			tessaHandler.youDrink(1, false);
			tessaHandler.tessaDrinks(1, false);
			tessaHandler.brideApproves(2);
			tessaHandler.groomApproves(2);
			tessaHandler.tessaApproves(-3);
		case 1:
			tessaHandler.youDrink(1, false);
			tessaHandler.tessaDrinks(1, false);
			tessaHandler.brideApproves(2);
			tessaHandler.groomApproves(2);
			tessaHandler.tessaApproves(2);
			break;

		case 0:
			tessaHandler.brideApproves();
			tessaHandler.groomApproves();
			tessaHandler.tessaApproves(3);
			break;
	}

	//+1 Tessa Approval. +1 Bride Side Approval. +1 Groom Side Approval.
	addButton(0, "Liked It", withADrunkYellTessaCriedMoreMoreMore, 0);
	//+2 Tessa Approval. +1 Bride Side Approval. +1 Groom Side Approval.
	addButton(1, "Loved It", withADrunkYellTessaCriedMoreMoreMore, 1);
	//+1 Tessa Approval. +1 Bride Side Approval. +2 Groom Side Approval.
	addButton(2, "Seconds?", withADrunkYellTessaCriedMoreMoreMore, 2);
	//-1 Tessa Approval. -1 Bride Side Approval. -1 Groom Side Approval.
	addButton(3, "Not Great", withADrunkYellTessaCriedMoreMoreMore, 3);
	tessaWedCheckBlackout();
}

// Part 6:
public function withADrunkYellTessaCriedMoreMoreMore(opinion:int):void
{
	clearMenu();
	clearOutput();
	showTessaTeacher(true);
	processTime(5);

	output("Tessa starts to speak, but is interrupted by the sound of a glass being tapped. Your attention, along with Tessa’s and the rest of the room’s, is drawn over to a small podium near the head table. Clark is standing at the podium, looking out at the room with a relaxed smile and a glass in his hand. <i>“Everyone, if I can have your attention please.”</i> His tone is mellow and completely at ease. <i>“I would like to say a few words.”</i>");
	output("\n\nClark gives a short and simple speech, with most of the room still seeming quite enthralled by his words. A notable exception being Tessa, who seems to grow bored and aloof as the man talks. Clark ends with a toast to the Bride and Groom, which you and Tessa join in on, then the blonde man steps down off the podium. In his place Adra steps up, the tall ausar smiling out at the crowd. <i>“Hey everybody, I guess I’m up.”</i> Tessa’s attention focuses in on the tall woman, her red eyes stuck on her. <i>“I’ll try to keep this short...”</i>");
	output("\n\nAdra’s speech is longer than Clark’s, but definitely spoken from the heart. You notice more than one person get a bit weepy as the ausar talks about Karen and how lucky Monty is to have her love. Tessa’s eyes start to grow misty as well, the ovir more than a little moved by the speech. Adra ends the speech with another toast. <i>“To family; To friends; And most importantly, to love.”</i> The room claps and Adra steps off the podium, moving over to the Bride and giving her a tight hug. To the side of you Tessa fiddles with her purse, retrieving her flask.");
	output("\n\nTessa pops it open and goes for a drink. " + (tessaHandler.flaskCount > 0 ? "She tosses back the remaining contents of her flask emptying it, then shoves it back into her purse." : "She moves to drink from the flask, but when she tosses it back she finds it empty. The white ovir turns to you and frowns. <i>“Really?”</i> She shoves the empty flash back into her purse.") + " The pale ovir sighs, rubbing her brow. <i>“Go get me a fresh drink from the bar. Beer please.”</i> Her tone tells you she isn’t really asking.");

	tessaHandler.tessaDrinks(tessaHandler.flaskCount);

	tessaHandler.brideApproves();
	tessaHandler.groomApproves();
	tessaHandler.tessaApproves();
	switch (opinion)
	{
		case 1: tessaHandler.tessaApproves(); break;
		case 2: tessaHandler.groomApproves(); break;
		case 3: tessaHandler.brideApproves(-2); tessaHandler.groomApproves(-2); tessaHandler.tessaApproves(-2); break;
	}

	//+2 Tessa Approval. +1 Bride Side Approval. +1 Groom Side Approval.
	addButton(0, "Of Course", jansTalkingStraightAboutTessaButHerColorsAreShowing, 0);
	//+1 Tessa Approval. +1 Bride Side Approval. +1 Groom Side Approval.
	addButton(1, "No Problem", jansTalkingStraightAboutTessaButHerColorsAreShowing, 1);
	//+1 Bride Side Approval. +1 Groom Side Approval.
	addButton(2, "Yeah, Yeah", jansTalkingStraightAboutTessaButHerColorsAreShowing, 2);
	//-1 Tessa Approval. +1 Bride Side Approval. +1 Groom Side Approval.
	addButton(3, "Fuck. Fine.", jansTalkingStraightAboutTessaButHerColorsAreShowing, 3);
	tessaWedCheckBlackout();
}

// Phase 3 End:
public function jansTalkingStraightAboutTessaButHerColorsAreShowing(reply:int):void
{
	clearMenu();
	clearOutput();
	showTessaTeacher(true);
	processTime(6);

	output("You head over to the bar, deciding not to keep your date waiting. Since the speeches are still going on the bar area is entirely vacant, save for the bartender, whom you note is carrying a large bin of watery ice. You step up to the bar and ask him for a beer.");
	output("\n\n<i>“Eh, It’ll just be a minute.”</i> The bartender shakes the heavy bin, causing the half-melted ice to rattle. <i>“Gotta get some fresh ice from the back.”</i> The bartender heads to a door behind the bar and passes through it, leaving you alone. You stand in silence for a minute, until you hear the tapping of heels behind you. Turning around, you note Jan moving in on you.");
	output("\n\n<i>“Ah, [pc.name], fancy meeting you here.”</i> The willowy woman comes to a halt next to you, leaning against the bar. You think back to Tessa’s warnings about being alone with her");
	if (tessaHandler.adraValOne) output(", and also the one Barney gave you before dinner");
	output(". <i>“Speeches too much for you as well, huh?”</i>");
	output("\n\nYou explain that you are getting Tessa a drink, and the bartender just went into the back.");
	output("\n\nJan smirks and leans in close. <i>“That so? Well, shall we wait for him together?”</i> The terran woman looks around, scanning the area. You do the same quickly and find the two of you to be very alone. <i>“So. You and Tessa, hm? How did that happen?”</i> You stay silent a moment, not really wanting to answer. <i>“Oh come now, you can tell me. Tessa and I are old friends.”</i> The woman’s smirk fades, her brown eyes fixate on you.");
	output("\n\nBefore you can think of an answer the door behind the bar swings open and the bartender returns. <i>“Alright. One beer coming up.”</i> He spots Jan standing next to you and moves towards her. <i>“What can I get ya miss?”</i>");
	output("\n\nJan’s face twists into a frown, clearly unhappy with the interruption. <i>“I’ll take a glass of the red.”</i> The bartender nods then reaches under the bar, pulling out a bottle and handing it to you. He then begins to work on Jan’s drink, still within earshot. <i>“Another time then, Steele.”</i> Jan takes a draft from her glass, then turns away from you, clearly not wanting an audience for her questions.");
	output("\n\nYou give Jan a half-hearted goodbye and head back.");

	tessaHandler.brideApproves();
	tessaHandler.groomApproves();
	switch (reply)
	{
		case 0: tessaHandler.tessaApproves();
		case 1: tessaHandler.tessaApproves(); break;
		case 3: tessaHandler.tessaApproves(-1); break;
	}

	addButton(0, "Next", janGotALicenseForLoveAndIfItExpiresPrayHelpFromTessa);
}

// Phase 4: The Reception
// Part 1:
public function janGotALicenseForLoveAndIfItExpiresPrayHelpFromTessa():void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(8);

	output("You begin making your way back to the table, holding Tessa’s beer in your hand. The room is mingling freely now, the rest of the speeches seemingly finishing while you were busy. You spot your table and slow your pace at the sight of the Bride and Groom both standing next to it talking to the seated guests, including Tessa. Your fake-date sees you and flags you over, a wide smile on her face. You reach Tessa, who quickly seizes your arm and pulls you tight against her. <i>“There you are! I thought I’d lost you!”</i> Tessa’s tone is so sweet you suspect her teeth might begin to rot.");
	output("\n\nMonty moves forward and offers his right hand. <i>“Montgomery Hubbard, pleasure to meet you, and a pleasure to have you.”</i> He notices the beer in your right hand and laughs. <i>“Ah, sorry.”</i> He offers his left instead, which you take and give a quick shake, introducing yourself as you do. <i>“Ah, yes. Tessa’s already told us all about you.”</i> Monty’s eyes turn to the pale ovir. <i>“Well, anyway, we have to keep mingling. Hopefully we can be properly introduced later.”</i>");
	output("\n\nMonty moves on and starts to talk to Barney next, but the Bride lingers behind looking at you with a curious gaze. Karen’s eyes seem to glide over your form, and she gives you a curious smile. Is she... checking you out? She turns to Tessa and gives her a suggestive wink before moving on after her husband.");
	output("\n\nThe pale ovir’s face turns an odd shade of pink, and you feel her claw-like nails dig into your arm slightly. <i>“What was that about?”</i> You ask while trying to loosen Tessa’s vice-like grip.");
	output("\n\nTessa drags you away from the table, releasing you only once the two of you are away from most of the crowd. She grabs the beer from your hand and cracks it open. <i>“Holy fuck. You see that shit? She thinks we fuck.”</i> Sensing what you’re about to say next, the white woman rolls her eyes and continues. <i>“You know what I mean, dumbass. Who the fuck thinks something like that?”</i> She lifts her beer to her lips and starts to chug it.");

	//+2 Tessa Approval. +1 Tessa Alcohol lvl. 
	addButton(0, "Shrug", nowTessaIsHidingInCratesThatAreFrightening, 0);
	//+1 Tessa Approval. +1 Bride Side Approval. +1 Groom Side Approval. +1 Tessa Alcohol lvl. 
	addButton(1, "A Fun Lady", nowTessaIsHidingInCratesThatAreFrightening, 1);
	//+1 Bride Side Approval. +1 Groom Side Approval. +1 Tessa Alcohol lvl. 
	addButton(2, "Seen Me?", nowTessaIsHidingInCratesThatAreFrightening, 2, "Seen Me?", "\"Have you seen me?\"");
}

// Part 2:
public function nowTessaIsHidingInCratesThatAreFrightening(reply:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(11);

	output("Tessa downs her drink and sets the bottle roughly on a nearby table. <i>“Okay. I think I’ve officially had enough for tonight. No more-”</i> As if on cue, Tessa is cut off by the sound of a music starting to play over a speaker system. <i>“Ah shit. First dance time... Quick let’s hide!”</i>");
	output("\n\nTessa grabs your arm and drags you away again. You try to ask the ovir why exactly she wants to hide, but she doesn’t seem to pay you any mind. She pulls you off into a side hallway, and slips you both into a storage room. She lets go of you and you take a look around, noting the whole room to be filled with crates of alcohol.");
	output("\n\n<i>“Well hot damn.”</i> Tessa moves to a nearby crate and examines it. <i>“Well. I might have to reconsider that beer being my last drink.”</i>");
	output("\n\n<i>“So, why exactly are we hiding?”</i> You move towards Tessa, taking a look at the crate she’s rummaging through.");
	output("\n\nThe white woman sighs and turns to face you. <i>“Looks I’ve... Okay. That thing Jan dragged me off to do? Well, I didn’t leave home on the best of terms with everybody. Karen had us sit in a room and... talk. First time in years... I’d like to say there are not hard feelings but...”</i> Tessa turns back to the crate, reaching in and pulling out a bottle. <i>“Forgiving is hard.”</i>");
	if (tessaHandler.adraValOne)
	{
		output("\n\n<i>“You meant Adra right?”</i> Tessa turns to face you, still holding the bottle in her hand. <i>“That’s who she wanted you to make up with, right?”</i>");
		output("\n\nTessa stares at you a moment, her red orbs narrowing in suspicion. After a long moment her gaze softens. <i>“Yeah. That’s right.”</i> She sighs and rubs her face. <i>“We had a rough falling out. Haven’t spoken since.”</i>");
		output("\n\nYou ask what happened between the two of them. The white ovir stays silent, rubbing the bottle in her hand with her thumb. <i>“Jan had something to do with it right?”</i>");
		output("\n\nThe ovir scoffs. <i>“Yeah, that’s one way to look at it.”</i> The pale woman goes silent again, thinking to herself. <i>“Jan... she got the ball rolling, but Adra and I were to blame for what happened. Things were... Complicated.”</i>");
	}

	switch (reply)
	{
		case 0: tessaHandler.tessaApproves(2); break;
		case 1: tessaHandler.tessaApproves(); tessaHandler.brideApproves(); tessaHandler.groomApproves(); break;
		case 2: tessaHandler.brideApproves(); tessaHandler.groomApproves(); break;
	}
	tessaHandler.tessaDrinks(1, false);

	//+1 Tessa approval. 
	addButton(0, "Let’s Go Back", tonightALittleTessaCameDancingOnTheFloor, 0);
	//+2 Tessa approval. +1 Tessa Alcohol lvl, +1 Your Alcohol lvl.
	addButton(1, "Drink With", tonightALittleTessaCameDancingOnTheFloor, 1);
	//+2 Tessa alcohol lvl.
	addButton(2, "Watch Her", tonightALittleTessaCameDancingOnTheFloor, 2);
	tessaWedCheckBlackout();
}

// Part 3:
public function tonightALittleTessaCameDancingOnTheFloor(drinks:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(3);

	switch (drinks)
	{
		case 0:
			output("You tell Tessa you two should head back to the party. The white woman regards the bottle another moment, then sets it back into the crate without opening it."); 
			tessaHandler.tessaApproves();
			break;
		case 1:
			output("You move up beside Tessa and take the bottle from her. You crack it open and take a hearty swig of it, then offer it back to her. The white woman smiles and takes the bottle from you, knocking back a healthy amount herself.");
			tessaHandler.tessaApproves(2);
			tessaHandler.tessaDrinks(1, false);
			tessaHandler.youDrink(1, false);
			break;
		case 2:
			output("You stand there in silence. After a moment, Tessa opens the bottle and starts to down it, chugging away at the contents. She gasps in satisfaction when she finishes, then sighs to herself solemnly.");
			tessaHandler.tessaDrinks(2, false);
			break;
	}
	output("\n\nThe two of you make your way out of the storage room and back to the reception hall. Upon entering you see the reception is now in full swing, with many of the guests out on the dance floor. A rather upbeat party song is playing, and all the dancers seem to be enjoying themselves. Tessa sighs to herself. <i>“So... I think this is the part where we’re supposed to dance.”</i> Without giving you a chance to speak, the white ovir roughly grabs your arm and pulls you onto the dance floor.");
	output("\n\nTessa rhythmic patterns dance more <i>at you</i> than <i>with you</i> at you, the ovir woman swaying her sultry hips back and forth hypnotically, moving her curvaceous body to the music. All things considered, the woman knows how to dance. You note a few other guests turn to watch your date, more than one lewd smile being tossed her way. Clark, who is currently dancing with two girls at the same time, is one. Adra, off standing to the side of the dance floor, is another.");
	output("\n\nThe song ends and a new one starts to play. This time it’s a very slow romantic song you vaguely remember hearing before. Tessa stops her dancing and stares at you, her expression very conflicted. <i>“Uhm... Right.... So...”</i>");

	//+3 Tessa Approval. +2 Bride Side Approval. +2 Groom Side Approval.
	addButton(0, "Dance", ifIHadTheChanceIdAskTessaToDance, true);
	//-1 Tessa Approval.
	addButton(1, "Sit It Out", ifIHadTheChanceIdAskTessaToDance, false);
	//Requires Adra Value 1 to be selectable. 
	//-2 Tessa Approval. +2 Bride Side Approval. +2 Groom Side Approval.
	if (tessaHandler.adraValOne) addButton(2, "Her & Adra", wellTheresTessasExInSightInTheCrowdedLonelyDance);
	tessaWedCheckBlackout();
}

// Part 4:
public function ifIHadTheChanceIdAskTessaToDance(dance:Boolean):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(23);

	if (dance)
	{
		output("You stride forward, placing one hand on the small of Tessa’s back while the other laces her slender white fingers in between your own. Tessa’s red eyes go wide, and you notice her face flush with colour. You softly chuckle. <i>“May I have this dance?”</i> Tessa nods slowly, almost in disbelief.");
		output("\n\nThe two of you sway back and forth, Tessa seemingly tense. Slowly, she loosens up and moves in closer to you, her chest lightly pressing against you. <i>“You’re pretty good at this.”</i> She smiles and leans her head against you lightly. <i>“Don’t you go thinking you’re charming me here Steele. I’m just doing this for show.”</i> You watch her tail swish contently behind her, making you question her claim.");
		tessaHandler.brideApproves(2);
		tessaHandler.groomApproves(2);
		tessaHandler.tessaApproves(3);
	}
	else
	{
		output("You tell Tessa you want to sit this one out.");
		output("\n\n<i>“Oh.”</i> Tessa blinks at you, clearly not expecting that. <i>“Alright...”</i> You move off of the dance floor, Tessa beside you. Oddly, she looks both relieved and disappointed...");
		tessaHandler.tessaApproves(-1);
	}

	//Plays Part 5
	addButton(0, "Next", collectFlowersToGoFromTessasEleven);
}

public function wellTheresTessasExInSightInTheCrowdedLonelyDance():void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(2);

	output("You tell Tessa she should dance with Adra.");
	output("\n\nTessa’s face goes red and she scoffs. <i>“Fuck that! Maybe <b>you</b> should dance with her if you think that’s such a great idea.”</i> You shrug and start walking towards Adra, deciding to take Tessa’s suggestion. You hear her sputter some quiet objections as you make your way over to the tall ausar.");
	output("\n\nAdra turns to face you as you reach her, her expression curious. Up close you can tell just how tall she is, at least 6 feet tall before her heels, and even before counting her ears. You introduce yourself and ask the Maid of Honor if she would like to dance.");
	output("\n\nThe ausar raises an eyebrow. <i>“Oh?”</i> She looks over your shoulder at Tessa, who you can only imagine is staring daggers into the back of your head. She gives you a thin smile. <i>“Sure, I’d like that.”</i> She takes your hand and the two of you step onto the dance floor. Adra loops her furry arms around your shoulders while you take ahold of her slender waist.");

	tessaHandler.brideApproves(2);
	tessaHandler.groomApproves(2);
	tessaHandler.tessaApproves(-2);

	//Plays Dance with Adra.
	addButton(0, "Next", wellTheresNothingToProveIllBeDancingWithTessasEx);
}

// Dance with Adra:
public function wellTheresNothingToProveIllBeDancingWithTessasEx():void
{
	clearMenu();
	clearOutput();
	showTessaAdra();
	processTime(21);

	output("While you dance with the tall ausar you keep her at arms length at first, taking note of Tessa glaring from the sidelines. Adra chuckles, moving in closer and whispers softly to you. <i>“Lovers’ quarrel?”</i> You raise your brow at the blonde woman, not quite following. <i>“Tess,”</i> she explains. <i>“Dancing with me is a sure way to knot up her panties.”</i> The ausar moves in closer again, allowing you to feel the warmth of her body. <i>“Oh, I don’t mind. I’m always game for a good knotting.”</i>");
	if (tessaHandler.lewdness) output(" The ausar gives you a suggestive wink.");
	output("\n\nYou can’t help but chuckle at the ausar’s pun. <i>“She prefers Tessa now.”</i>");
	output("\n\nAdra shrugs. <i>“Tess, Tessa, Tessy. I’ve called her all of that and more over the years.");
	if (tessaHandler.lewdness) output(" I’m sure you know a thing or two about that.");
	output("”</i> The tall woman goes silent a moment, swaying along with you to the song. <i>“God, I love this song, how did you know I wanted to dance?”</i>");
	output("\n\nYou shrug yourself. <i>“You just looked lonely on the sidelines. Told Tessa she should dance with you, and she told me to do it myself.”</i>");
	output("\n\nThe ausar giggles. <i>“I suspect she was being a sarcastic ass, sounds like her at least. I doubt she would encourage her current [pc.boyGirl]friend into mingling with her ex." + (tessaHandler.lewdness ? " Especially such a cute looking one.”</i>" : "”</i>"));
	output("\n\nYou give Adra a confused look. <i>“You two dated?”</i>");
	output("\n\nThe tall woman raises her eyebrow at you. <i>“She didn’t tell you? Hm, well keeping secrets sounds like her too.”</i> The song ends and Adra lifts her arms off your shoulders and steps away from you. <i>“Thanks for the dance, sweetie. You move pretty well.");
	if (tessaHandler.lewdness) output(" Maybe later I can see more.");
	output("”</i> Adra gives you a smirk.");
	output("\n\nYou thank the ausar for the dance and head back over to Tessa.");
	if (tessaHandler.lewdness) output(" You can’t help but feel like Adra was flirting with you... Like a lot.");
	output(" When you reach Tessa the ovir glares daggers at you. You shrug and stand next to her, whispering. <i>“So, you and Adra dated huh?”</i>");
	output("\n\n<i>“Shut it, asshat.”</i>");
	output("\n\nWell okay then.");

	//Gives Adra Value 2
	tessaHandler.adraValTwo = true;

	//Play Part 5.
	addButton(0, "Next", collectFlowersToGoFromTessasEleven);
}

// Part 5:
public function collectFlowersToGoFromTessasEleven():void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(3);

	output("A few songs later, an announcement plays over the speakers. <i>“Gather around ladies, it’s time for the bouquet toss!”</i> Half of the room howls in excitement, and a horde of single ladies storm past you to the floor, pushing and shoving each other like a pack of wolves.");
	
	if (tessaHandler.clothes == "dress" || pc.isFeminine() || pc.femininity >= 40)
	{
		output("\n\nYou get grabbed by a older looking woman and pushed along with the rest, despite your protests. You notice Tessa also getting dragged onto the floor, the ovir’s silent expression calling out to you for help. You end up in the middle of the horde, Tessa lost somewhere in front of you, hidden behind a sea of women. How many single ladies are at this damn wedding? Just in front of you, you notice a familiar brown beehive: Jan.");
		output("\n\nFrom somewhere in the front you hear Karen call out. <i>“Alright, ready ladies?”</i> The crowd screams and shouts their response, nearly deafening you. <i>“Alright. Here.We.Go!”</i> You look upward and see the pale bouquet arc up in the air. Time slows.");
		output("\n\nYou look around. You know only milliseconds are passing but you feel like you have all the time in the world to act. Despite this, you know you only have time for one action...");

		//+1 Tessa Approval. +3 Bride Side Approval. +3 Groom Side Approval.
		//Grants Bouquet Value 2
		addButton(0, "Jump!", youDontRealizeThatIWontNotCatchFlowersForTessa, 0);
		//+5 Tessa Approval. +1 Bride Side Approval. +1 Groom Side Approval.
		//Grants Bouquet Value 1
		addButton(1, "Push Bitch", youDontRealizeThatIWontNotCatchFlowersForTessa, 1, "Push Bitch", "Push that crazy bitch!");
		//+3 Bride Side Approval. +3 Groom Side Approval.
		//Grants Bouquet Value 2
		addButton(2, "Touch Butts", youDontRealizeThatIWontNotCatchFlowersForTessa, 2);
		//Grants Bouquet Value 1
		addButton(3, "This Is Stupid", youDontRealizeThatIWontNotCatchFlowersForTessa, 3);
	}
	else
	{
		output("\n\nYou notice Tessa getting dragged onto the floor, the ovir’s silent expression calling out to you for help. She gets lost somewhere in the horde, hidden in a sea of women. How many single ladies are at this damn wedding?");
		output("\n\nFrom your spot on the sidelines you see Karen step into position and call out . Alright, ready ladies?” The crowd screams and shouts their response. “Alright. Here.We.Go!” You look upward and see the pale bouquet arc through the air. Time slows.");
		output("\n\nYou look around. At this point you can do nothing. But still, sometimes it’s the thought that counts...");

		//+3 Tessa Approval. +3 Bride Side Approval. +3 Groom Side Approval.
		//Grants Bouquet Value 1
		addButton(0, "Encourage", youDontRealizeThatIWontNotCatchFlowersForTessa, 4);
		//Grants Bouquet Value 1
		addButton(1, "This Is Stupid", youDontRealizeThatIWontNotCatchFlowersForTessa, 3);
	}
}

// Part 6:
public function youDontRealizeThatIWontNotCatchFlowersForTessa(action:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(3);

	switch (action)
	{
		case 0:
			output("You decide to go for it, jumping as high as your [pc.legs] allow. You feel yourself bump into somebody, but can’t be sure who as your eyes are fixed upon the twirling bouquet in the air. You stretch out, your fingers extending as far as the can. As you strain your arms out, reaching over Jan’s head, you feel the flowers land perfectly into your outstretched hands. Holy fuck you caught it.");
			tessaHandler.brideApproves(3);
			tessaHandler.groomApproves(3);
			tessaHandler.tessaApproves();
			tessaHandler.caughtBouquet = true;
			break;
		case 1:
			output("You decide the best offence, is a <i>really</i> strong offence. Using all of your strength, you barrel forward, slamming yourself into Jan, sending her and yourself flying forward. The willowy woman lets out a hard gasp you hit her, falling and knocking over a few unlucky ladies in front of her. You look up from the ground and see a curious sight; Tessa holding the bouquet with her tail, looking down at you.");
			tessaHandler.brideApproves();
			tessaHandler.groomApproves();
			tessaHandler.tessaApproves(5);
			break;
		case 2:
			output("You shrug, deciding to take the chance to be lewd. You reach out and grab a handful of the first available butt you can... which just so happens to belong to Jan. The willowy woman lets out a howl, throwing her arms out and smacking a woman next to her clean in the face. The two women, distracted for a moment, don’t even move as the bouquet flies right over their heads, landing right into your unexpecting hands. Holy fuck you caught it.");
			tessaHandler.brideApproves(3);
			tessaHandler.groomApproves(3);
			tessaHandler.caughtBouquet = true;
			break;
		case 3:
			output("You don’t even pay attention, deciding it’s not worth the effort. Out of the corner of your eye you notice a flash of white snap out in the air, causing you to return your focus to the flowers. You look over and see a curious sight; Tessa holding the bouquet with her tail, looking back at you.");
			break;
		case 4:
			output("You shout out as loud as you can over the crowd. <i>“TESSA! YOU CAN DO IT!”</i>. You watch the flowers fly through the air, sailing right towards the middle of the sea of rabid single ladies. In a blink and you miss it instant, you notice a white and black flash jump almost five feet into the air, and a long tail whip out over the top of everyone’s heads, snatching the bouquet clean out of the air. Tessa lands and pulls her tail in tight, the bouquet firmly in her possession, and a big smile on her lips.");
			tessaHandler.brideApproves(3);
			tessaHandler.groomApproves(3);
			tessaHandler.tessaApproves(3);
			break;
	}

	if (tessaHandler.caughtBouquet) output("\n\nMany women in the crowd groan at their loss, but many more rush over to congratulate you, including Karen who runs in and hugs you. <i>“Wow! That was amazing, it went right to you!”</i> The short woman hugs you tighter, speaking in your ear just above a whisper. <i>“I had a good feeling about you. You really are something else.”</i> The Bride releases you and gives you a curious smile while she walks away. Tessa moves over to you, smiling wider than you’ve ever seen and shaking her head slightly. You offer her the bouquet and she takes it from you, looking it over and giving it a sniff. <i>“Awesome job. Well, that made a scene. Mind if we go somewhere a bit more private? I need another break from this.”</i>");
	else output("\n\nMany women in the crowd groan at their loss, but many more rush over to congratulate Tessa, including Karen who runs in and hugs her pale friend. You see them talk to each other a moment, but can’t hear what they are saying over the sounds of the crowd. Tessa, holding the flowers, looks around and spots you, walking over and taking you by the hand. <i>“Well, shit. That made a scene. Mind if we go somewhere a bit more private? I need another break from this.”</i>");

	//+2 Tessa Approval. -1 Bride Side Approval. -1 Groom Side Approval.
	addButton(0, "Sounds Good", andNowImHoldingTheKeyToTessasFlowersInMyHand, 0);
	//+1 Tessa Approval. -1 Bride Side Approval. -1 Groom Side Approval.
	addButton(1, "Uh, Sure", andNowImHoldingTheKeyToTessasFlowersInMyHand, 1);
	//-1 Bride Side Approval. -1 Groom Side Approval.
	addButton(2, "Don’t Want To", andNowImHoldingTheKeyToTessasFlowersInMyHand, 2);
	//-2 Tessa Approval. -1 Bride Side Approval. -1 Groom Side Approval.
	addButton(3, "Fuck That", andNowImHoldingTheKeyToTessasFlowersInMyHand, 3);
}

// Phase 4 End:
public function andNowImHoldingTheKeyToTessasFlowersInMyHand(reply:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(3);

	output("Tessa doesn’t even seem to listen to your reply and just drags you along with her anyways. The two of you make your way out of the party room and off down a side hall, the ovir leading the way. <i>“Holy fuck that crowd was nuts. All of that screaming and fighting over some stupid flowers.”</i>");
	if (tessaHandler.caughtBouquet) output("\n\nYou can’t help but raise your brow. <i>“Then why did you seem so happy I caught it?");
	else output("\n\nYou can’t help but roll your eyes. <i>“Then why did you try so hard to catch it?”</i>");
	output("\n\nTessa scoffs. <i>“Please. The amount of credibility we have now because of this? " + (tessaHandler.caughtBouquet ? "You’re" : "I’m") + " the belle of the ball now.”</i> She spots a sign for the washrooms and starts heading towards it. <i>“Oh thank god.”</i>");
	output("\n\nThe ovir stops in front of a set of doors, and turns to you, handing you her purse and the bouquet. <i>“Wait here. I’ll only be a minute.”</i> She turns and enters the washroom, but a moment later reopens the door and points at you, her red orbs narrow. <i>“Don’t follow me in, shithead!”</i> She pulls her head back into the washroom and disappears.");

	switch (reply)
	{
		case 0: tessaHandler.tessaApproves(2); break;
		case 1: tessaHandler.tessaApproves(1); break;
		case 3: tessaHandler.tessaApproves(-2); break;
	}
	tessaHandler.brideApproves(-1);
	tessaHandler.groomApproves(-1);

	addButton(0, "Next", tessaDontCallMeFromTheBathroomToTellMeImWithClark);
}

// Phase 5: Final Stretch
// Part 1:
public function tessaDontCallMeFromTheBathroomToTellMeImWithClark():void
{
	clearMenu();
	clearOutput();
	showTessaClark();
	processTime(3);

	output("You lean against the wall outside of the washrooms, purse in one hand and flowers in the other. A minute or so passes by and you hear footsteps coming down the hall. You turn and notice Clark making his way towards you and the restrooms.");

	if (tessaHandler.caughtBouquet)
	{
		output("\n\nClark gives you a sideways look as he reaches the mens room, his gaze lingering on the purse and the bouquet in your hands. <i>“You’re the one who caught the bouquet right?”</i> He steps away from the door, moving closer to you. <i>“I don’t think we’ve met. Name’s Clark. Those were some impressive moves.”</i>");
		output("\n\nYou give him a shrug, telling him it was nothing really.");
		output("\n\n<i>“Nah. It was something.”</i> He gives you a curious smile, his blue eyes almost on the verge of shining. He gives you a look up and down, his smirk widening. <i>“If you’ll pardon me, I’m just going to slip into the restroom quickly. But...”</i> He gives you a suggestive grin. <i>“I might need a bit of help. If you can spare a minute.”</i> He gives you another look over. <i>“...or twenty.”</i>");

		//Plays Part 2
		addButton(0, "Stay And Wait", nowAllICanHangOutWithIsTessasLoveThatWasOnce, true);
		//Triggers Ending 3
		addButton(1, "\"Help\" Clark", whenYouHearClarkOfferYouTakeADip, undefined, "\"Help\" Clark", "Help Clark with his ‘happy ending.’");
	}
	else
	{
		output("\n\nClark gives you a sideways look as he reaches the men’s room, his gaze lingering on the purse and the bouquet in your hands. He gives you a smirk and a thumbs up then heads into the men’s room without a word.");
		//Plays Part 2
		addButton(0, "Next", nowAllICanHangOutWithIsTessasLoveThatWasOnce, false);
	}
}

// Part 2:
public function nowAllICanHangOutWithIsTessasLoveThatWasOnce(fromClark:Boolean):void
{
	clearMenu();
	clearOutput();
	showTessaAdra();
	processTime(3);

	if (fromClark) output("You turn Clark down and the big blonde man shrugs. <i>“Alright. Suit yourself. If you change your mind I’ll be close by.”</i> He gives you a lewd wink then enters the men’s room, leaving you alone in the hall.\n\n");
	output("Another minute passes and you hear a second set of footsteps coming your way. You turn and spot Adra coming down the hall. <i>“Hey, Um... [pc.name] right? Did you see Clark come this way?”</i>");
	output("\n\nYou tell her he just stepped into the men’s room.");
	output("\n\n<i>“Ah.”</i> She turns to regard the men’s room door, then shifts her gaze back to you and the contents of your hands. <i>“Nice bouquet. " + (tessaHandler.caughtBouquet ? "You" : "Tess") + " really worked for that thing. Things must be serious between you two.”</i>");
	if (tessaHandler.lewdness) output(" She looks you up and down, exploring you with her eyes.");
	output("\n\nBefore you can answer, you hear the faint sound of a toilet flushing coming from the ladies’ room. Adra’s ears twitch, signalling she heard it as well. <i>“Speak of the devil.”</i> You and Adra stare at each other for a moment, the blonde ausar’s ears twitching. <i>“She’s washing her hands now.”</i>");
	if (tessaHandler.adraValTwo)
	{
		output("\n\nShe gives you a serious look. <i>“So she really didn’t say anything to you about me and her?”</i> When you shake your head no the tall woman rolls her eyes. <i>“That’s almost insulting.”</i>");
		if (tessaHandler.lewdness) output(" Adra sighs and rubs her neck. <i>“Well, as far as I can tell you two are doing good, so why bother with the past I guess.”</i>");
		if (tessaHandler.insight)
		{
			output("\n\nYou think back on Tessa’s diary a moment. <i>“Tessa never mentioned you by name... But she did say that she fucked things up with somebody back home. She regretted it, and even thought about going back to make things right. I assume it was you she was talking about.”</i>");
			output("\n\nAdra starts to speak, but hold back her thought. After a pause, she speaks. <i>“She... Said that?”</i>");
		}
	}
	output("\n\nThe sound of a door opening pulls your and Adra’s attention over. Tessa enters the hall and looks at you two, her eyes going wide. <i>“...Fuck.”</i>");

	//-3 to Tessa Approval
	addButton(0, "Say Nothing", butTheyreGoneFromTessasEyesSoWedBetterRealize, 0);
	//+1 to Tessa Approval
	addButton(1, "Explain", butTheyreGoneFromTessasEyesSoWedBetterRealize, 1);
	//Requires Adra Value 1 or 2 to be available.
	addButton(2, "Let Adra", butTheyreGoneFromTessasEyesSoWedBetterRealize, 2);
}

// Part 3:
public function butTheyreGoneFromTessasEyesSoWedBetterRealize(whoSpeaks:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(3);

	switch (whoSpeaks)
	{
		case 0:
			output("You stare blankly at Tessa, not saying anything. The white woman’s eyes dart between you and the tall ausar. She is clearly assuming the worst.");
			tessaHandler.tessaApproves(-3);
			break;
		case 1:
			output("You explain to Tessa that Adra just came looking for Clark who’s in the men’s room.");
			output("\n\n<i>“Oh...”</i> Tessa looks over at Adra suspiciously. <i>“I see.”</i> The three of you stand in silence for a long few heartbeats.");
			output("\n\nAdra breaks the silence with a chuckle. <i>“Don’t worry Tess. We’ve both been behaving out here. No scandalous talk at all. Promise.”</i> The tall woman smiles at Tessa, who seems to ease up.");
			tessaHandler.tessaApproves();
			break;
		case 2:
			output("You turn to Adra, silently asking for her to explain.");
			output("\n\nThe tall ausar seems to understand and chimes in. <i>“It’s okay, Tess. I’m just waiting around for Clark. He’s in the men’s room. [pc.name] and I have been both been behaving out here. No scandalous talk at all. Promise.”</i> The tall woman smiles at Tessa, who seems to ease up.");
			if (tessaHandler.insight) output(" Adra turns and looks at you, smiling faintly.");
			break;
	}
	output("\n\nThe sound of a flushing toilet causes the three of you to turn and glance over at the men’s room door. Adra smiles gives an audible sigh. <i>“Well. Saved by the bell, am I right?”</i> Adra’s ears twitch and the bathroom door opens.");
	output("\n\nClark steps out and stops on a dime, regarding the three of you with a curious expression. <i>“Um...”</i> He looks over at Adra, his face painted with confusion. <i>“Did I just walk in on something awkward?”</i>");
	output("\n\nAdra frowns. <i>“Did you really just not wash your hands?”</i> Adra gives her tall ears a wiggle. <i>“That’s fucking gross.”</i> Clark stares at the ausar a moment, then starts to turn to head back into the washroom. <i>“Wait. Never mind. We got shit to do. Just don’t touch... anything.”</i> Adra turns back to you. <i>“Pleasure talking to you.”</i> Her gaze shifts to Tessa. <i>“Talk to you later, Tess.”</i>");
	output("\n\nThe two make their way down the hall, and you can hear Adra chew Clark out more about his hygiene as they walk away. You turn back to Tessa, noticing her glaring at you.");

	addButton(0, "What?", nowTessasRollingThroughAWeddingThatIsEmptyToFindYourDestination, 0);
	//+1 to Tessa Approval
	addButton(1, "Um... Sorry?", nowTessasRollingThroughAWeddingThatIsEmptyToFindYourDestination, 1);
	//-3 to Tessa Approval
	addButton(2, "You’re A Bitch", nowTessasRollingThroughAWeddingThatIsEmptyToFindYourDestination, 2, "You’re A Bitch", "Call her a bitch.");
}

// Part 4:
public function nowTessasRollingThroughAWeddingThatIsEmptyToFindYourDestination(reply:int):void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(3);

	switch (reply)
	{
		case 0: output("You ask Tessa what’s wrong. She doesn’t answer you, and just keeps her gaze fixed."); break;
		case 1:
			output("You apologize to Tessa, although you’re not sure why. She doesn’t reply to you, and just keeps her gaze fixed.");
			tessaHandler.tessaApproves();
			break;
		case 2:
			output("You tell Tessa she is being a real bitch right now. Her glare gets more intense, and you get the feeling if she had a weapon she’d be drawing it.");
			tessaHandler.tessaApproves(-3);
			break;
	}
	output("\n\nTessa glares a moment longer then looks away with a sigh, dropping her intense look. <i>“Eh, nevermind. That was a tense moment for me. I shouldn’t try to melt your face over shit like that.”</i> Tessa moves over and grabs your arm. <i>“Alright. I think I’ve had enough. Let’s get out of here.”</i>");
	output("\n\nYou raise your brow. <i>“You mean leave?”</i>");
	output("\n\nThe white woman shrugs. <i>“I think we’ve made an ample impression already. I’m not eager to stay and see how much more anxiety you can force me to suffer.”</i> She shoots you a dry smile. <i>“We’ll go say goodbye and then fuck right off.”</i> Tessa starts leading the two of you back down the hall to the reception.");

	//+1 to Tessa Approval
	addButton(0, "Say Goodbye?", wellTessasOutAllNightToCollectAFarewell, 0, "Say Goodbye?", "Should I say goodbye as well?");
	//-1 to Tessa Approval
	addButton(1, "Back To Ship?", wellTessasOutAllNightToCollectAFarewell, 1, "Back To Ship?", "Can I head back to the ship?");
	addButton(2, "So... Sex?", wellTessasOutAllNightToCollectAFarewell, 2);
}

// Part 5:
public function wellTessasOutAllNightToCollectAFarewell(reply:int):void
{
	clearMenu();
	clearOutput();
	showTessaKaren();
	processTime(3);

	switch (reply)
	{
		case 0:
			output("Tessa thinks a moment. <i>“Yeah. You should. Just follow my lead.”</i>");
			tessaHandler.tessaApproves();
			break;
		case 1:
			output("Tessa rolls her eyes. <i>“No, dumbass. I’m not letting you out of my sight again. Just follow my lead.”</i>");
			tessaHandler.tessaApproves(-1);
			break;
		case 2:
			if (tessaHandler.tessaApproval < 8) output("<i>“I hope you’re fucking joking.”</i> Tessa doesn’t seem too impressed with that question.");
			else if (tessaHandler.tessaApproval < 15) output("Tessa thinks a moment. <i>“Unless you royally fuck this up? Sure.”</i>");
			else output("Tessa smiles and you feel her tail start to swish behind you. <i>“Oh honey, you have no idea.”</i>");
			break;
	}
	output("\n\nThe two of you enter the reception room, and Tessa’s eyes start to scan the crowd. She spots something off on the other end of the room and starts to drag you over. You follow her gaze and see Karen and Monty on the dance floor. As you two approach they turn to greet you, and from what you can tell they have both drank quite a bit since you saw them last.");
	output("\n\nTessa releases you and moves towards them <i>“Hey! Wow, it’s been a great wedding.”</i> Her tone is sweet, but not as insincere as you would have thought. She must actually mean it. <i>“Me and [pc.name] need to get going though. You know how it is. Busy, busy, busy.”</i>");
	output("\n\n<i>“Oh, Tessy!”</i> Karen hugs Tessa, and quite tightly you assume, as the white ovir seems to crunch and squeak in the Bride’s embrace. <i>“Do you have to go? Can’t you stay just a little bit longer?”</i>");
	output("\n\nTessa turns her head to you, her red orbs asking for you to bail her out.");

	//+2 Tessa Approval. -1 Bride Side Approval. +1 Groom Side Approval.
	addButton(0, "Try To Help", heyLittleTessaLetsFuckThatViceAndWish, 0);
	//-1 Tessa Approval. +1 Bride Side Approval. +1 Groom Side Approval.
	addButton(1, "Laugh", heyLittleTessaLetsFuckThatViceAndWish, 1);
	//-2 Tessa Approval. +2 Bride Side Approval. +2 Groom Side Approval.
	addButton(2, "Silent", heyLittleTessaLetsFuckThatViceAndWish, 2);
}

// Part 6:
public function heyLittleTessaLetsFuckThatViceAndWish(reply:int):void
{
	clearMenu();
	clearOutput();
	showTessaWedCouple();
	processTime(3);

	switch (reply)
	{
		case 0:
			output("You move closer to Tessa, trying to find a way to help the poor woman. Although you can’t think of a great way to free her from the tiny Bride’s grasp, Tessa seems to notice you’re at least trying.");
			tessaHandler.brideApproves(-1);
			tessaHandler.groomApproves();
			tessaHandler.tessaApproves(2);
			break;
		case 1:
			output("You can’t help but chuckle at the display of affection. Tessa doesn’t seem impressed by your laughing, and you’re unwillingness to help.");
			tessaHandler.brideApproves();
			tessaHandler.groomApproves();
			tessaHandler.tessaApproves(-1);
			break;
		case 2:
			output("You stand there, keeping quiet and distant while letting this play out. Tessa’s eyes narrow in your direction. She isn’t happy.");
			tessaHandler.brideApproves(2);
			tessaHandler.groomApproves(2);
			tessaHandler.tessaApproves(-2);
			break;
	}
	output("\n\nMonty interjects, saving Tessa himself. <i>“Alright, honey. Let her go.”</i> He pulls his tiny wife off the almost equally short ovir, chuckling to himself. <i>“If they need to go, they need to go.”</i>");
	output("\n\nKaren looks at her husband and pouts a moment. <i>“Fine.”</i> She turns back to Tessa. <i>“Well you need to visit more!”</i> Karen shifts her gaze to you. <i>“And you... " + (tessaHandler.brideApproval < 17 ? "Treat Tessa good yeah? She’s worth it.”</i>" : "I’d like to see more of you around.”</i> The small tipsy woman gives you a wink."));
	output("\n\nMonty moves forward and gives you a pat on the shoulder. <i>“It was a pleasure meeting you. Glad you could make it all this way.”</i>");
	addButton(0, "Next", tessaHasTwiceTheHookupsSheUsedToHave, false);
	if (tessaHandler.brideApproval >= 17)
	{
		output(" Karen tugs on Monty’s jacket, causing the tall blond man to lean down and listen while his wife whispers in his ear.");
		if (tessaHandler.groomApproval < 17) output(" <i>“Hm. I don’t know honey. They do have to go.”</i>");
		else
		{
			output(" Monty smiles, <i>“Oh, interesting idea...”</i>");
			output("\n\nKaren moves towards Tessa again and starts whispering to her. The pale ovir turns a bright shade of pink, and her red eyes go wide as saucers.");
			if (tessaHandler.tessaApproval >= 15 && tessaHandler.tessaBooze >= 7 && ((pc.hasCock() && pc.shortestCockLength() < 18) || pc.hasVagina))
			{
				output(" <i>“Wow... Um... let me ask [pc.name]”</i>. Tessa moves towards you, her face still very flushed. <i>“Um... So... they... want to know if we want to... er... join them... for uh, stuff...”</i> Tessa presses her lips together tight, and you can’t help but notice her tail flick wantonly behind her.");
				//Plays Ending 8.
				addButton(0, "Sure", tessaCongratulatesTheNewlyweds);
				//Plays Phase 5 End
				addButton(1, "Um... Pass", tessaHasTwiceTheHookupsSheUsedToHave, true);
			}
			else
			{
				output(" <i>“Um.. While that is certainly an... Interesting offer, I think we’ll pass...”</i> Tessa turns to you blushing fiercely, and presses her lips tight together, clearly more than a little uncomfortable.");
				//Plays Phase 5 End.
				addButton(0, "Next", tessaHasTwiceTheHookupsSheUsedToHave, true);
			}
		}
	}
}

// Phase 5 End:
public function tessaHasTwiceTheHookupsSheUsedToHave(gotOffer:Boolean):void
{
	clearMenu();
	clearOutput();
	processTime(3);
	showWeddingTessa();

	if (gotOffer) output("Tessa turns back to the Bride and Groom, giving them a headshake. Karen and Monty seem to shrug it off, not being phased by their offer being turned down.\n\n");

	output("You finish up saying your goodbyes and make your way out of the reception room, heading towards the hangar with Tessa at your side. She stays quiet, so you decide to make some conversation. <i>“Well. That was fun wasn’t it?”</i>");
	output("\n\nTessa gives you an annoyed look. <i>“We’ll review your performance in a minute once we get on the ship.”</i>");
	output("\n\nYou roll your eyes. <i>“I didn’t ask how I did. I asked if you had fun.”</i>");
	output("\n\nThe ovir sighs, but doesn’t answer at first, thinking about the question. <i>“I... Did, yes.”</i>");
	if (tessaHandler.adraValTwo)
	{
		showTessaAdra(true);
		output("\n\nUp ahead standing near the ship you spot Adra, seemingly waiting for you and Tessa. The ovir tenses up beside you, her white face going slightly more pale. <i>“Well. I was having fun.”</i> She reaches out and grabs your shoulder, stopping you. <i>“Wait here a minute. Let me talk to her alone...”</i> Tessa brushes past you, moving over to the tall ausar.");
		output("\n\nYou observe them talking to each other from a distance, their voices too low to make out. After a few minutes of talking they hug, seemingly a sign everything is going alright between the two of them. Tessa turns and flags you over with a wave, and slowly you start to trot over.");
		output("\n\n<i>“Hey [pc.name]. Thanks for fucking snooping in my business.”</i> Tessa lightly punches you in the arm. <i>“Adra and I... Well we talked some shit out a bit better. I guess that’s thanks to you.”</i>");
		output("\n\nYou shrug, not really sure what you did.");
		
		//PC finished with 15 or more points in Tessa Approval.
		//PC finished with 15 or more points in Bride Side Approval.
		//PC must have Adra Value 2.
		//PC must have Lewdness Value OR Insight Value.
		//Tessa Alcohol lvl must be 7 or higher.
		if (tessaHandler.tessaApproval >= 15 && tessaHandler.tessaBooze >= 7 && (tessaHandler.insight || tessaHandler.lewdness) && tessaHandler.brideApproval >= 15)
		{
			output("\n\nAdra chuckles and leans in closer to Tessa, laying her furry arm over the ovir’s white shoulders. <i>“Real modest one you’ve got here, Tess.”</i> The ausar gives you a curious wink. <i>“But I wonder if there is more to your little lover here than meets the eye?”</i>");
			output("\n\nTessa smirks at Adra, her long white tail wrapping around the ausar’s waist. <i>“Oh you have no idea.”</i> The white woman turns her gaze towards you, her red orbs narrowed in thought. <i>“What do you think? Should we see what [pc.name] can do?”</i>");
			output("\n\nAdra smiles at you, and licks her lips. <i>“I think we should.”</i>");
			output("\n\nYou stare at the two women. What the fuck did they talk about?");
			output("\n\nTessa and Adra move in on you, each taking hold of one of your arms, pulling you toward the ship. Tessa speaks in a low and sulty tone. <i>“Don’t be shy, Steele. You’ve earned it.”</i>");
			
			//Plays Ending 7
			addButton(0, "Next", itsANiceDayForTessaAndAdraToStaaartAgaaaaaaain);
		}
		else
		{
			output("\n\nAdra chuckles and moves towards you, leaning in and giving you a quick peck on the cheek. <i>“See you around, [pc.name]. And don’t forget to call me, Tess!”</i> Adra smirks at the shorter woman then turns to leave, almost skipping as she makes her way out of the hangar.");
			output("\n\nYou turn to Tessa and raise your brow.");
			output("\n\nThe ashen woman frowns at you. <i>“Just get in the damn ship”</i>");

			//End of event
			addButton(0, "Next", tessaTakeMeBackHome);
		}
	}
	else
	{
		output("\n\nYou reach Tessa’s ship in short order and make your way up the ramp. The pale woman is right behind you as you enter, closing the the ship’s door behind her. <i>“Right Steele. Let’s review.”</i>");
		//End of event.
		addButton(0, "Next", tessaTakeMeBackHome);
	}
}

// Endings:

public function tessaWedCheckBlackout():Boolean
{
	if (tessaHandler.steeleBooze >= 10) tessaWedSteeleBlacksOut();
	else if (tessaHandler.tessaBooze >= 10) tessaWedTessaBlacksOut();
	else return false;
	return true;
}
// Ending 1: You black out
public function tessaWedSteeleBlacksOut():void
{
	clearMenu();
	clearOutput();
	showTessa();
	processTime(14*60+rand(2*60));

	output("<b>You black out</b>");
	output("\n\nYou wake up with a jolt, completely naked and with your head pounding in pain. You look around and find you are laying down on Tessa’s couch, all of your equipment neatly piled on the floor next to you. You hear a door slide open and turn to see Tessa saunter into the room, wrapped in her tiny pink robe. She gives you a smirk. <i>“Well, look who’s not dead.”</i>");
	output("\n\nYou sit upright, rubbing your throbbing head. <i>“What happened?”</i>");
	output("\n\nTessa sighs and moves towards you, crossing her arms over she chest. <i>“You got wasted. Like a 14 year old breaking into daddy’s liquor cabinet kind of wasted.”</i> She comes to a stop next to you. <i>“Dragged your drunk ass here and let you sleep it off.”</i>");
	output("\n\nYou lift yourself to your feet, wobbling before you manage to find your balance. <i>“So how did the wedding go?”</i>");
	output("\n\nTessa shrugs. <i>“Eh. It was fine. Honestly, you getting plastered worked out for me.”</i> Tessa turns and starts heading back to her bedroom, stretching as she walks. <i>“I went back for a bit after I made sure you weren’t going to choke on your on vomit, and had an okay time by myself.”</i> Tessa stops and turns back to look at you. <i>“We’re already back on Tarkus by the way, you can show yourself out when you’re ready.”</i>");
	output("\n\nA sense of confusion rushes through you. <i>“What? How long was I out for?”</i>");
	output("\n\nThe white woman thinks for a moment. <i>“God, 14 hours? I don’t know. You were really fucked up. Whatever. Thanks for your help I guess.”</i> Tessa shrugs and turns back around, waving over her shoulder as she heads into her room.");
	output("\n\nYou stand there a moment, a little dumbstruck. How much did you drink exactly? You gather up your things and head out, disembarking from the Ebony.");

	addButton(0, "Next", tessaWeddingEnd, 1);
}
// Ending 2: Tessa Blacks out
public function tessaWedTessaBlacksOut():void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(8*60+rand(2*60));
		
	output("While you for sure have seen Tessa drunk before, this is just overboard. The trashed woman starts to hang off you, her breath reeking of booze. <i>“Heey, Steeeele.”</i> She leans in closer, pressing her face against your. <i>“I don’t feel so good.”</i> You hear a gagging sound and Tessa pulls herself away, clapping a hand over her mouth. A moment later she swallows hard. <i>“Oopsy, close one.”</i>");
	output("\n\nYou end up escorting Tessa back to her ship, the drunken woman laughing the whole way. She stops as you reach the loading ramp of the Ebony. <i>“I’m starting to think the flask was a bad idea. My baaaaad.”</i> She hiccups.");
	output("\n\nOnce you enter the ship, you toss Tessa on the couch, taking a moment to remove her shoes. Exhausted from dragging the surprisingly heavy ovir, you flop down next to her, needing a break. You glance over and see Tessa’s eyes are closed, and already snoring softly. Well that was fast. You decided to close your own eyes for a moment.");
	output("\n\nYou open your eyes, slowly rousing from sleep. You look around and notice you are alone, and naked. Why are you naked? You perk up and start looking around urgently for your clothes. You note your gear laid out next to you, alongside Tessa’s discarded dress. You look around some more, expecting to see a naked ovir somewhere. Instead you faintly hear the sound of running water. You spring up off the couch and move to the washroom, opening the door and entering. You see Tessa sitting in the shower, water falling on her naked form.");
	output("\n\n<i>“Hey, Steele.”</i> Tessa’s voice is hoarse and tired. <i>“I guess I overdid it huh?”</i>");
	output("\n\nYou confirm that indeed she did, and ask why she stripped you.");
	output("\n\nTessa shrugs. <i>“I’m not sure. I don’t really remember what I was thinking.”</i> The short woman stands up, watering falling off her curves. <i>“I don’t even remember why I’m in the shower either. I think I need to lay down. Thanks for your help I guess.”</i> Tessa shrugs and brushes past you, waving over her shoulder as she heads into her room.");
	output("\n\nYou stand there a moment, a little concerned. You gather up your things and head out, disembarking from the Ebony.");

	addButton(0, "Next", tessaWeddingEnd, 2);
}

// Ending 3: Clark
// Part 1:
//Ending triggers automatically if you pursue Clark during Phase 5.
public function whenYouHearClarkOfferYouTakeADip():void
{
	clearMenu();
	clearOutput();
	showTessaClark(true);
	processTime(45);

	output("You tell Clark that you would be more than willing to lend him a hand. The tall man’s smile becomes very wide, and he pushes open the washroom door, holding it wide open for you. You step into the washroom, Clark following very closely behind you. He places one of his large hands on your shoulder, guiding you towards the stalls. The two of you enter the closest one, with Clark sliding the lock closed behind him.");
	output("\n\n<i>“Let me just slip past you here.”</i> Clark moves his hand off your shoulder and down to your [pc.hip], gently positioning you to the side as he moves past you. He sits down on the toilet seat, spreading his muscled legs wide apart. <i>“My fly seems to be stuck. Do you mind?”</i> He gives his crotch a suggestive pat, and you can’t help but notice his pants start to slowly tent.");
	output("\n\nWith only a moment’s pause, you get down low onto your knees, your fingers running up Clark’s strong legs toward his crotch. Along the way your fingers brush up against his rapidly growing bulge. He’s packing some serious meat, and you can’t help but feel your face grow warm as you feel it grow larger under your fingertips. Slowly, you take hold of his zipper and pull it down, then reach inside and wrap your fingers around Clark’s still growing rod.");
	output("\n\nHis cock is massive and incredibly thick, growing even bigger in your grasp before your eyes. It takes only seconds before you see it grow fully erect, nearly a foot long shaft of throbbing pink human meat. The sight of it almost catches you in a trance. Something about it calls to you, and you feel your mouth start to water as you stare at it. You can’t help but inch forward, moving your lips closer towards his glorious manhood.");
	output("\n\nClark laughs above you, then reaches down and presses his engorged cockhead against your lips roughly. <i>“Don’t be shy. Show me what you can do.”</i> You shiver with delight as his hard cock brushes your lips. Clark’s forcefulness is unexpected, but you can’t say it’s unwelcome. You quiver in anticipation, eager to take him in your mouth and taste. For some reason, you feel he is doing you a favor letting you near it. How can a cock drive you this wild just by its appearance?");
	output("\n\nYou reach out and gently grip him at the base of his powerful shaft, and part your lips wide. You start by giving him a long lick, running your tongue along his glands, then the underside of his thick mast. He tastes different than what you expected. His cock is clean and surprisingly lacks any hint of the typical musk or sweat. Instead you find it tastes sweet, almost like candy. Clearly he washed himself, and very recently, but with what you cannot say. Was the smell getting to you? You had barely noticed before, but he smelled like candy as well. What was on him?");
	output("\n\nLust fills your mind and any questions you have disappear. Instead, you decide to go for it, and take the head of his throbbing manhood into your mouth. He feels much larger than he looks as you slide your lips down his length, taking in inch after meaty inch. You hear Clark groan in pleasure, his strong hands moving to the back of your neck, guiding you further downward. He doesn’t hold you down however, and soon you start bobbing up and down, sucking away at his juicy cock, the candy-like taste as addictive as his thick member.");
	output("\n\nAs you work at Clark eagerly, the reality of the situation hits you. You are on your hands and knees, sucking off the Best Man at a wedding, with your date in the next room none the wiser. You tremble at the sheer depravity of it. Anybody could catch you, and the thought of that makes your");
	if (pc.hasCock()) output(" [pc.cockNounSimple] grow rock hard.");
	else if (pc.hasVagina()) output(" [pc.vagina] quiver between your thighs.");
	else output(" crotch burn with excitement.");
	output(" You give a throaty moan, feeling yourself turning into a bigger cock slut with each passing minute.");
	output("\n\nYou just can’t help yourself. You plunge your face downward, taking in as much of his footlong dong you can manage. His pulsating, girthy shaft is buried deep in the back of your throat, and you feel yourself drool in pleasure as you nearly choke on it. Your lust fueled efforts seem to be making quick work of the large man, as you hear him release a deep groan, his strong hands gripping the base of your skull tightly. You feel his rock solid cock throb in your throat, and before you can react you are assaulted with a massive blast of thick, salty spunk.");
	output("\n\nClark holds you in place as he fills your throat with his burning hot seed, but you don’t care, still lost in a lusty, candy-flavored haze. Many long spurts from his cock run down your throat, filling your stomach with sinful warmth. When his orgasm stops after many long heartbeats, he releases you and you pull yourself off of him, gasping for air you didn’t even realize you missed. You fall backward, coughing as you collect yourself. You notice Clark rise to his feet, reaching out and unlocking the door, then stepping over you and moving towards the sink. He turns the water on and starting washing his cock, right there with no shame as you lay on the floor.");
	output("\n\n<i>“Damn. That was pretty good. I’d even say you’re a natural.”</i> He turns off the sink, and turns back to you, stuffing his deflated package back into his pants. <i>“Welp. Thanks for that. Gotta get back to the party. See ya.”</i> Without another word, he heads to the door and exits the bathroom, leaving you heaving for breath on the floor. You sit on the ground a minute, contemplating what just transpired. He just left you alone on the floor, gagging on his cum. What a douche.");

	var clark:Creature = new Creature();
	clark.createPerk("Fixed CumQ", 1500);
	pc.loadInMouth(clark);
	clark = null;

	addButton(0, "Next", tessaItsMoreThanAFeelingItsThereInsideMyMouth);
}
// Part 2:
public function tessaItsMoreThanAFeelingItsThereInsideMyMouth():void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(75);

	output("You pull yourself up to your feet and head over to the sink, rinsing out your mouth and washing your face. Once you have cleaned up, you exit the bathroom and find the hallway is empty with no sign of Tessa. You wait around a few minutes, starting to feel like the ovir might be long gone already. Not wanting to wait any longer, you go looking for her. Asking around, you find that Tessa was in the reception room, but didn’t stay long and headed off to the hangar after talking to the Bride and Groom. A flash of fear hits you. Did she leave without you?");
	output("\n\nYou sprint to the hangar hoping Tessa didn’t ditch you, or at the very least didn’t ditch you yet. As you enter the hangar, you spot the Ebony, and rush towards it, storming up the ramp and entering the sleek black ship as fast as your legs can carry you. Nearly out of breath from running, you stumble into the ship’s main hold, your gaze darting around for the white woman. You spot her sitting on her couch, a beer in hand and a smile on her lips.");
	output("\n\n<i>“Walk of shame huh?”</i> She looks you up and down and chuckles. <i>“Or should I say run of shame?”</i> You open your mouth to attempt to explain yourself, but Tessa waves you off. <i>“Don’t bother. I get it. Clark and his cock. Who can say no to that?”</i> She pulls herself to her feet and walks over to the cockpit, disappearing from sight. You feel the ship shake and lift up. Apparently you two are leaving. A few minutes later Tessa returns to the main room. <i>“We’re on course for Tarkus. Should only be a few minutes, you should get your stuff together so you can head out once we land. You did... well, you did okay I guess.”</i> The ovir frowns at you, clearly not impressed.");
	output("\n\nYou apologize to the white woman and ask if she’s mad at you for running off with Clark.");
	output("\n\nTessa laughs, then takes a big swig of her drink. <i>“It’s fine, Steele. Clark has a way about him. If people thought poorly of all the marks he’s been with half the colony back home would be shamed. Truthfully, you getting dicked by the Best Man is almost a badge of honor. Sure it’s not a great outcome... but meh, could have been worse.”</i> Her eyes go narrow on you. <i>“But next time you ditch me, I’ll stick my foot so far up your ass you’ll taste it.”</i>");
	output("\n\nSomehow, you don’t doubt the ovir’s threat. You collect your things and get ready to depart. Not long after you’re ready, you reach Tarkus and Tessa sets the ship down in her normal spot. You bid farewell to the ovir, apologizing again for your actions and disembark off the ship.");

	addButton(0, "Next", tessaWeddingEnd, 3);
}

// Endings 4, 5, 6
public function tessaTakeMeBackHome():void
{
	clearMenu();
	clearOutput();
	showWeddingTessa();
	processTime(75);

	// Ending 4: Bad night
	//PC finished with less than 8 points in Tessa Approval.
	//Ending triggers at the end of Phase 5 End
	if (tessaHandler.tessaApproval < 8)
	{
		output("<i>“Alright Steele, that was a pretty fucking pathetic showing.”</i> Tessa crosses her arms over her chest, her lips pressing together in a tight frown. <i>“Honestly? The fact you didn’t completely ruin the whole night is a miracle.”</i>");
		output("\n\nYou start to object, but stop yourself and reflect on some of your choices over the course of the evening. <i>“Right... Sorry... Are you mad?”</i>");
		output("\n\nTessa sighs deeply and rubs her face. <i>“No. Shockingly I’m not. As much of an ass as you were, it was still a salvageable evening for me.”</i> She drops her hands and glares at you. <i>“No thanks to you.”</i> She drops her glare and walks over to the cockpit, disappearing from sight. You feel the ship shake and lift up. Apparently you two are leaving. A few minutes later Tessa returns to the main room. <i>“We’re on course for Tarkus. Should only be a few minutes, you should get your stuff together so you can head out once we land.”</i>");
		output("\n\nYou apologize to her. You can’t help feel like like you let her down.");
		output("\n\nTessa roll her eyes. <i>“It’s fine, Steele. You were sufficient arm candy, and you still did a few key things right. People back home think I’m dating some rich asshat, so that works in my favor still.”</i>");
		output("\n\nYou decide to risk it and ask Tessa is there is any chance for a bit of play. The ovir’s cold stare tells you that ship sailed long ago.");
		output("\n\nYou collect your things and get ready to depart. Not long after you’re ready you reach Tarkus, Tessa setting the ship down in her normal spot. You bid farewell to the ovir, apologizing again for your actions and disembark off the ship.");

		addButton(0, "Next", tessaWeddingEnd, 4);
	}
	// Ending 5: Good night
	//PC finished with 8 or more points in Tessa Approval.
	//Ending triggers at the end of Phase 5 End.
	else if (tessaHandler.tessaApproval < 15 || tessaHandler.brideApproval + tessaHandler.groomApproval < 20)
	{
		output("<i>“Well, that went pretty fucking well I thought.”</i> Tessa crosses her arms over her chest, her lips curving into a smirk. <i>“Honestly? You did better than I expected. A few stumbles here and there, sure. But damn, you were pretty smooth.”</i>");
		output("\n\nYou smile at the fair scaled woman. It’s not too often Tessa gives you praise. <i>“Well, that sort of thing comes easy to me I guess.”</i>");
		output("\n\nTessa rolls her eyes and chuckles. <i>“Real modest, Steele. Well, either way you did great.”</i> She shoots you a thumbs up and then walks over to the cockpit, disappearing from sight. You feel the ship shake and lift up. Apparently you two are leaving. A few minutes later Tessa returns to the main room. <i>“We’re on course for Tarkus. Should only be a few minutes.”</i>");
		output("\n\nYou ask Tessa if you should get your stuff together.");
		if (pc.hasGenitals())
		{
			output("\n\nTessa’s smirks at you, her tail wagging behind her. <i>“Oh no, Steele. You don’t get to go until I’ve thanked you.”</i> Tessa slips back into the cockpit, leaving you alone in the main hold. A few minutes later you reach Tarkus, and Tessa sets the ship down in her normal spot. The pale ovir emerges from the cockpit and moves toward her bedroom door, looking over her shoulder and smiling at you. <i>“Coming?”</i>");
			//Plays Bedroom scene.
			flags["TESSA_WED_ENDING"] = 5;
			flags["TESSA_WED_TIMESTAMP"] = GetGameTimestamp();
			flags["TESSA_WED_REVIEW"] = 1;
			addButton(0, "Next", tessaBedroomIntro);
		}
		else
		{
			output("\n\nTessa thinks about the question a moment, then sighs. <i>“For now. Sadly, I don’t think you’ve got the right... er... equipment for me to properly thank you.”</i> Her red orbs trail down towards your crotch, her face twisting into a frown. <i>“Another time. Promise.”</i>");
			output("\n\nUnderstanding, but feeling a little rejected, you nod.");
			output("\n\nA few minutes later, you reach Tarkus, and Tessa sets the ship down in her normal spot. You say your goodbyes to Tessa and head out.");
			//PC is left in the Tarkus Hangar
			addButton(0, "Next", tessaWeddingEnd, 5);
		}
	}
	// Ending 6: Great night
	//PC finished with 15 or more points in Tessa Approval.
	//PC finished with a total of 20 points between Bride Side Approval and Groom Side Approval.
	//Ending triggers at the end of Phase 5 End.
	else
	{
		output("Tessa moves towards you, pulling you into a tight hug. <i>“Holy fuck, Steele. You. Were. Amazing!”</i> She releases you and backs up to arm’s length, giving you a very wide smile. <i>“I mean, I knew you were smooth, but god damn! You had them eating out of your hand!”</i>");
		output("\n\nYou smile at the snow-scaled woman. It’s not too often Tessa gives you praise, and never anything close to the amount you’re getting now. <i>“Well, I just did what you told me to do.”</i>");
		output("\n\nTessa reaches out and give you a light smack on the shoulder. <i>“[pc.name] you were charming the pants off of everybody. That was some beautiful shit. Man, now I’m gonna have to bend over backwards to thank you.”</i> She shoots you a suggestive wink and then turns and walks over to the cockpit, disappearing from sight. You feel the ship shake and lift up. Apparently you two are leaving. A few minutes later Tessa returns to the main room. <i>“We’re on course for Tarkus. Should only be a few minutes.”</i>");
		output("\n\nYou ask Tessa if you should get your stuff together.");
		if (pc.hasGenitals())
		{
			output("\n\nTessa’s chuckles at you, her tail wagging behind her as she stalks closer. <i>“Oh no, Steele. You don’t get to go until I’ve thanked you.”</i> The ovir gets close to you, then reaches out and traces your jawline with a sharp claw. <i>“Very thoroughly as well.”</i> Tessa give you another wink then slips back into the cockpit, leaving you alone in the main hold.");
			output("\n\nA few minutes later you reach Tarkus, and Tessa sets the ship down in her normal spot. The pale ovir emerges from the cockpit and moves towards her bedroom door, turning over her shoulder and smiling at you. <i>“Hurry along, Steele. I’m going to show you just how rewarding a favor for me can be.”</i>");
			//Plays Bedroom scene.
			flags["TESSA_WED_ENDING"] = 6;
			flags["TESSA_WED_TIMESTAMP"] = GetGameTimestamp();
			flags["TESSA_WED_REVIEW"] = 1;
			addButton(0, "Next", tessaBedroomIntro);
		}
		else
		{
			output("\n\nTessa thinks about the question a moment, then sighs. <i>“For now. Sadly, I don’t think you’ve got the right... er... equipment for me to properly thank you.”</i> Her red orbs trail down towards your crotch, her face twisting into a frown. <i>“Another time. Promise.”</i>");
			output("\n\nUnderstanding, but feeling a little rejected, you nod.");
			output("\n\nA few minutes later, you reach Tarkus, and Tessa sets the ship down in her normal spot. You say your goodbyes to Tessa and head out.");

			//PC is left in the Tarkus Hangar
			addButton(0, "Next", tessaWeddingEnd, 6);
		}
	}
}

// Ending 7: Adra
// Main Scene:
public function itsANiceDayForTessaAndAdraToStaaartAgaaaaaaain():void
{
	clearMenu();
	clearOutput();
	showTessaAdra(true, true);
	processTime(15);

	output("Once you enter the ship you feel Tessa’s tail slide around your waist, the powerful appendage gripping you tightly. She yanks you roughly out of Adra’s grasp, pulling you into a tight hug. The fair scaled woman’s massive chest presses against you, the strong smell of booze coming from the ovir’s smiling lips. <i>“Maybe it’s just because I’m sauced, but did you get cuter?”</i>");
	output("\n\nStrong hands clasp your shoulders, and a second pair of tits press against your back. Adra leans in close, her lips at your ear. <i>“I think it’s the booze.”</i> She giggles in your ear, her chest moving against you as she chuckles.");
	output("\n\nSandwiched between the two busty women certainly is a highlight of the evening so far, but you can’t help but start to feel winded by Tessa’s strong tail. " + (pc.physique() < 40 ? "You let out a small gasp and feel her give you a tighter squeeze, forcing out what little air was left in your lungs. Gasping for air now, you hear Adra whine over your shoulder." : "You flex your muscles, fighting against the powerful appendage. As strong as Tessa’s tail is, you’re stronger still, and you refuse to let the devious woman get the better of you. Straining, you hear Adra whine over your shoulder.") + " <i>“Tessy, play nice. We’re supposed to be treating [pc.name], not cracking ribs.”</i>");
	output("\n\n" + (pc.physique() < 40 ? "A rush of air reaches your lungs as Tessa’s tail goes limp. The sudden burst makes your knees go weak and you fall to the floor on your [pc.ass] between the two women, slipping out of their grasp." : "Tessa’s tail goes limp around you, and suddenly you find yourself off balance. You stagger a moment, then fall to the floor on your [pc.ass] between two two women, slipping out of their grasp.") + " Collecting yourself, you attempt to rise but are met with a sharp poke as Tessa presses her heel into your shoulder, forcing you to stay seated.");
	output("\n\n<i>“Not so fast, lover.”</i> Tessa smirks, her leg lifted up and her heel pressing you down. From the angle you have with her leg up, you can see directly up her dress, her black panties on full display. You can’t help but feel your face warm at the sight, noticing her panties are already soaked through. <i>“Stay down for us. We wouldn’t want you to work too hard.”</i>");
	output("\n\nYou hear Adra giggle above you and move to Tessa’s side. The ausar licks her lips, towering high above you. <i>“The show hasn’t even started yet.”</i> She leans in closer to Tessa, hugging the much smaller woman. <i>“So sit tight. You won’t regret it.”</i>");
	output("\n\nTessa lifts her foot off you and sets it back down on the floor, the view of her underwear vanishing. Before you even get a chance to miss it, Tessa turns to Adra and reaches out, running her clawed fingers over the ausar. The taller woman doesn’t miss a beat, and returns the gentle caress, running her furry fingers along Tessa’s impressive hourglass figure. Leaning in, the busty doggy girl plants a firm lip lock on Tessa, which the white ovir returns with enthusiasm.");
	output("\n\nYou tense your jaw a moment. You haven’t even kissed Tessa yet! While your eyes linger on their make out session, you don’t fail to notice that their hands keep wandering. Slowly, and without fumbling, the two women unzip each other’s dresses, then help each other shimmy out of them without once surfacing for air. Your face becomes more than a little flushed at the sight of the two bombshell women, and your");
	if (pc.hasCock()) output(" [pc.cockNounSimple] grows rock hard in response.");
	else if (pc.hasVagina()) output(" [pc.vagina] quivers between your thighs in response.");
	else output(" crotch burns with excitement in response.");
	output("\n\nThe two withdraw from each other, both their faces flushed red. Adra pants like the doggy bitch she is, while Tessa uses her long studded tongue to lick her lips. Without missing a beat they both reach behind their backs and unfasten their bras, letting them both fall to the floor at your feet. You watch them hit the ground and before you can even look back up at them, both women are already bending over and sliding their panties down to the floor. From your position on the floor you gulp audibly, taking in the full sight of the two naked women standing before you.");
	output("\n\nTessa you’d already seen naked, but the sight of her perfectly crafted white body still gives you pause. Her snowy scales shine, and her impossibly curvy frame makes her look like she was sculpted from pure marble by the old masters of Terra. She seductively moves her hips side to side, showing off her impressive figure, her strong white tail swishing on the ground beside her. Staring up at her, the ovir’s tits seem larger than you remember, with both massive alabaster orbs being perfectly smooth, having no trace at all of a nipple. Between her legs you notice wetness oozing, her cloaca already soaking wet. Her red eyes look down at you with lascivious hunger, and she licks her lips once more with her metal-pierced tongue.");
	output("\n\nAdra’s body is no less impressive. Towering over Tessa, the ausar’s skin is smooth and fair, not that different from Tessa’s unblemished scales. The ausar woman is a tad slim, but with a hint of deceptively powerful muscles despite her lithe frame. While not as curvy as Tessa, Adra is just as busty as the smaller woman. In fact, you think she’s even more chesty than her ovir friend. Their heights and different body types make it hard to be sure, but one thing Adra does have over Tessa is both of her tits are capped with a bright pink stiff nipple rising stiffly from each breast. Trailing downward, you notice a blonde tuft of trimmed hair on her crotch, presumably hiding her ausar twat. She stares down at you with shining blue eyes, her gaze just as hungry as Tessa’s.");
	output("\n\n<i>“So.”</i> Tessa’s tone is low and husky. <i>“Which one of us gets the main course, and which is your dessert?”</i>");

	addButton(0, "Tessa", tessaLeadsTheThreesome);
	addButton(1, "Adra", tessaFollowsAdrasLead);
}

public function tessaLeadsTheThreesome():void
{
	clearMenu();
	clearOutput();
	showTessaAdra(true, true);
	processTime(75);

	output("You say you want Tessa to take the lead.");
	output("\n\n<i>“Well shit. You hear that?”</i> Tessa turns to Adra and gives her a smug smile. <i>“Guess [pc.name] knows who’s in charge around here.”</i> Behind her you notice her tail swishing on the ground.");
	output("\n\nAdra shrugs, seemingly unoffended by your choice. And why would she be? As far as she knows you and Tessa are together. Tessa moves in, bending down to meet your face. <i>“Alright Steele. " + (pc.isNude() && !tessaHandler.clothes ? "Get ready" : "Strip") + ".”</i>");
	if (!pc.isNude() || tessaHandler.clothes) output("\n\nYou remove your " + (tessaHandler.clothes ? tessaHandler.clothes : "[pc.gear]") + ", wiggling out of it the best you can while still seated on the floor. Tessa smirks down at you, she seems to enjoy watching you struggle to disrobe. To the side Adra gives you a soft smile, seemingly amused by Tessa’s demand. You finish stripping down, now sitting stark naked on your [pc.ass].");
	output("\n\nIn an instant, Tessa plants her hands on your shoulders and pushes you flat on your back. Before you can protest, the ivory seductress drops down on top of you, straddling your waist with her thick thighs. <i>“Hm, I think I like it up here.”</i> She runs her clawed fingers along your [pc.chest], trailing downward towards your midsection. <i>“But I have something else in mind first.”</i>");
	output("\n\nSlowly, she moves her hands to either side of your head and bends over, her massive white orbs threatening to smother you. Before they can, the well endowed woman starts to crawl backward, her chest brushing against yours as she slowly moves down your body. A shiver runs up your spine as her soft tits graze against your [pc.skinFurScales], a teasing sensation that rises as she runs it over your lower half.");
	output("\n\nAs quickly as the sensation starts it ends as Tessa reaches her target destination, her face now level with your");
	if (pc.hasCock()) output(" [pc.cockNounComplex]");
	else if (pc.hasVagina()) output(" [pc.vagina]");
	else output(" crotch");
	output(". The ovir looks up at you with her bright red eyes. <i>“I’ll start down here and see where this goes.”</i> Her eyes shift over to Adra. <i>“Feel free to jump in whenever.”</i>");
	output("\n\nAdra chuckles, and moves her hand to her crotch, her fingers slipping between her thighs. <i>“I’ll be sure to get nice and warmed up for [pc.himHer]. You just make sure [pc.name] doesn’t regret picking you over me.”</i> She gives her lip a playful chew as her fingers get to work at her fuzzy twat.");
	output("\n\nTessa’s eyes turn back to you, primal hunger gleaming. You can’t help give an audible gulp. This woman is going to eat you alive.");
	if (pc.hasCock()) output("\n\nIn a blink and you’ll miss it moment, Tessa roughly grabs your mast of cock flesh, her hand a white flash before you. Her grip on you is strong, the ovir seemingly trying to squeeze your manhood until it pops. You wince and struggle slightly, but don’t openly object. Tessa’s a rough lover, and you are more than used to this. The devious woman chuckles, seemingly enjoying watching you squirm.");
	else if (pc.hasVagina()) output("\n\nIn a blink and you’ll miss it moment, Tessa claps her hand down on your wet womanhood, the slap making you gasp out in shock. She pulls back, leaving just the tips of her claw light nails grazing against you sensitive folds. You gasp and struggle to stay still against her sharp digits, knowing Tessa isn’t going to hurt you if you stay still. Tessa was a rough lover, but she never caused you any real harm. The devious woman chuckles, seemingly enjoying watching you squirm.");
	else output("\n\nIn a blink and you miss in moment, Tessa’s hand flashes between your legs, one of her finger tips pressing against your hidden pucker. She pushes against you with the flat of her finger, her clawed nail also pressing against you slightly. The pressure against your backdoor makes you squirm, the ovir seemingly threatening to invade you. Tessa was a rough lover, but she never made a move against your ass like this. The devious woman chuckles, seemingly enjoying watching you squirm.");
	output("\n\n<i>“Stop teasing, Tess.”</i> You hear Adra speak from the side, the sound of her footsteps drawing closer. <i>“Playing with your food always was a bad habit of yours.”</i> The footsteps stop, with each of the ausar’s strong legs coming to a halt on either side of your head. You face fills with more than a little color, as you’re given a perfect view of her dripping wet cunt. Adra shifts her weight from one foot to the other with her hands on her hips, letting out an audible sigh. <i>“Guess I have to be the nice one.”</i> With the balance and grace of a dancer, Adra squats down, lowering her soaked pussy down on your face.");
	output("\n\nA powerfully delicious smell fills your nose as she lowers herself down. Much to your surprise, she doesn’t outright sit on your face, but rather remains hovering just above it. A lesser woman would never be able to hold the position for long, but somehow you know Adra can and will. You don’t dwell on that for long, the smell of her eager cunt stealing your attention. Her womanhood brushes against your lips, her fuzzy twat tickling you as you catch a faint taste of her. You shudder in lascivious pleasure, the ausar tasting like the sweetest of fruits. You arch your neck forward, giving her lower lips a kiss, and giving yourself another taste.");
	output("\n\nAdra moans softly above you, her womanhood quivering against your lips. More of her sweet juices ooze from her, treating you to more of that addicting taste. You part your lips, your [pc.tongue] slipping out of your mouth slowly and lapping away at Adra’s wet folds. You hear a louder moan above you as your tongue starts to work at her, and on either side of your head you feel Adra shake. Either she is very sensitive, or you’re better at this than you thought. Either way, you tilt your chin up and press in harder with your tongue, sending the doggy girl into a small fit while her cunt continues to slicken with her sweetness. You can’t help but elicit a throaty moan, losing yourself in the bitch’s twat. Below you, a growl reminds you that you two are not alone.");
	if (pc.hasCock()) output("\n\nSomething other than Tessa’s hand clamps down on your [pc.cockNounSimple]. Based on the slight grazing against your sensitive cockflesh, you can tell Tessa has buried her face in your lap. The ovir wastes no time, immediately starting to work you over and sucking your cock roughly. Powerful bolts of pleasure fire up your spine, causing you to seize up and forget about Adra’s cunt on your lips. Tessa’s tongue, with that wicked metal stud, seems to wrap around your now burning hot rod, the metal digging into your engorged shaft as she slides up and down your length. You gasp out, Tessa’s attack a fine and effective mix of pain and pleasure against you.");
	else if (pc.hasVagina()) output("\n\nSomething long and wet presses hard against your cunt. A hard piece of metal reveals it to be Tessa’s tongue, and the ovir has clearly buried her face in your snatch. The white woman wastes no time and starts to work away at you with strong, powerful licks with her long reptilian tongue. Waves of pleasure radiate from your overstimulated pussy, the shock of her attack causing you to forget all about Adra’s cunt on your lips. Tessa shifts her tongue around, changing to a focused attack, dragging her metal stud over your sensitive [pc.clit] in repeated and precise licks.");
	else output("\n\nTessa’s finger pulls away from your asshole and in its place something much thicker presses up against you. Whatever it is, it pushes against your pucker with such force it pops right in. A howl catches in your throat as your ass is invaded, the offender wiggling its way in and growing thicker as it does. Your eyes open wide in a horrid realization: Tessa is using her tail on you. The feeling of the long white appendage forcing its way up inside your ass makes you forget all about Adra’s cunt on your lips. Tessa’s tail starts to stretch you, the thin tip starting to thicken into something you don’t feel like you can handle.");
	output("\n\nAbove you, you hear Adra whine like a needy puppy. <i>“Tessy...”</i> Her voice is a higher octave than normal and very shaky. <i>“Stop it. Don’t be mean.”</i> Tessa seems to listen, and you feel her attack on you stop, the white woman seeming to pull back from you. You gasp for air, burning hot with sweat from the ovir’s attack, fueled by the scent of Adra above. Tessa’s pause allows you to collect yourself, reminding you of Adra’s cunt on your lips. You decide in an instant to give the pleading bitch another go, cranking back your neck to give her your best. A wolfish howl above you lets you know she appreciates your attention, and you bury yourself in her soaking wet twat. You quiver at her taste, feeling her warm juices fill your nose and mouth, drowning you in their aroma.");
	output("\n\nYou feel Tessa below you start to crawl, scaling back up you into a straddling position once more. Her thick egg-bearing hips are on either side of yours now, and your feel her give you a squish with her powerful thighs. <i>“Come here, you bitch.”</i> You hear Adra’s howls stifle, the noises silenced and replaced with throaty moans. On top of you, the two women embrace, clearly making out with each other while moaning lustfully. On your crotch, hot wetness starts to soak you, Tessa’s reptilian cunt starting to pour all over.");
	if (pc.hasCock())
	{
		output("\n\nTessa grinds herself against you, rubbing her soaking wet pussy on your rigid cock. Her cunt seems to wrap over you, seemingly gripping you while the ovir bucks her hips. Both your sexes burn hotly, brushing against each other, teasing your cockflesh and driving you crazy with pleasure. Tessa shifts her hips, and much to your surprise, she slides your cock properly inside of her eager quim. Even with your face buried in muff, you can’t help but pause for a moment and take it in: Tessa is letting you fuck her. Not willing to let this chance go, you start to buck your hips, thrusting your hard cock up into the ovir riding you. Tessa’s cloaca is clearly not like a normal cunt. It seems to mold to the shape of your [pc.cockShape] schlong, with her hole tighter than you expected, but somehow more spacious than you imagined. The shapely woman starts grinding her hips again, seemingly not content with just your upward thrusts alone. You’ve gotta say, this woman can ride a cock.");
		pc.cockChange();
	}
	else if (pc.hasVagina()) output("\n\nSomething thick presses up against your now abandoned cunt. At first you think it’s a cock, but you know that’s impossible based on the angle and present company. Whatever it is, it pushes inside of your quivering womanhood with surprising power. You let out a throaty moan as it forces its way inside of you, growing thicker as it plunges deeper. Your eyes open wide in a horrid realization: Tessa is using her tail on you. Tessa’s tail wiggles inside of you, the tip of it buried several inches deep. Her effort sends you into a fit of moaning pleasure, the movement of the ovir’s tail fucking you in a way a cock never could. You can’t help but wonder how long Tessa’s had this particular trick up her sleeve. If you knew your ovir lover could do this do you, you’d have been begging to be fucked this way every day.");
	else output("\n\nTessa’s tail is still buried in your ass, and the cruel woman doesn’t let you forget it. She sends it into a wiggle, the powerful appendage testing the limits of your ass. You can’t help but moan and pant, feeling like the pale ovir might break you with her attack. The power and freedom of movement of her tail in your ass is unlike anything you’ve ever imagined. While Tessa seems to be taking it easy on you, not forcing more of herself in, she does seem to be trying to see just how much you can take. Your lustful moans seem to be all the approval she needs. You can’t help but wonder how long Tessa’s had this trick up her sleeve. If you knew your ovir lover could do this do you you’d have been begging to be fucked this way every day.");
	output("\n\nAdra’s cunt twitches as you continue to eat her, the ausar having a hard time keeping her balance. You keep yourself buried in her fuzzy twat, lost in a haze of euphoria. You feel her warmth all over your face, running down your chin slightly as you lick her. Down below you feel Tessa ooze all over your lap, the white woman’s cunt juices noticeably far more abundant that Adra’s. If the ovir was the one sitting on your face, your can only imagine how much you’d be choking.");
	output("\n\nA stirring in your loins signals you’re drawing close. Tessa continues to mercilessly fuck away with her " + (pc.hasCock() ? "pussy" : "tail") + ", while you feel Adra’s trembling start to become more pronounced. Your");
	if (pc.hasCock()) output(" [pc.cockNounSimple]");
	else if (pc.hasVagina()) output(" [pc.vagina]");
	else output(" [pc.ass]");
	output(" burns, and your climax teeters on the brink of exploding. On top of you the two women moan and shiver, both of them drowning in oceans of depraved pleasure. A surge of heat runs up your spine, arching your back, and you feel yourself boil over.");
	output("\n\nYour");
	if (pc.hasCock()) output(" cock pulses then explodes, pumping thick [pc.cumColor] spunk deep inside of Tessa’s cunt. The ovir seems to clamp down on you, squeezing your manhood and almost seeming to milk you for every last drop.");
	else if (pc.hasVagina()) output(" cunt ignites into a fire, sending powerful waves throughout your body. You feel your body tense, and before you know it you’re left a trembling mess, unable to do anything but moan. Tessa’s tail doesn’t stop, and it continues to squirm inside you, prolonging your orgasm into near tortuous levels of pleasure.");
	else output(" ass burns, the sensitive hole pushed to its limit. You feel your whole body shake as you are helplessly drowned in sinful bliss. Tessa’s tail doesn’t stop, and it continues to squirm inside you, fueling your lustful fit in a nearly torturous way.");
	output(" Many long seconds later, you feel a dizzying sensation in your head, and your vision starts to blur. The women on top of you continue to moan and writhe, oblivious to your state. Time starts to become hazy, and you don’t know many more minutes pass, Tessa and Adra still on top enjoying you and each other. Darkness takes you, and you pass out.");

	addButton(0, "Next", tessaThreesomeOver);
}

public function tessaFollowsAdrasLead():void
{
	clearMenu();
	clearOutput();
	showTessaAdra(true, true);
	processTime(75);

	output("You say you want Adra to take the lead.");
	output("\n\nTessa scoffs. She turns to Adra and gives her a shrug. <i>“Guess you’re up.”</i> She turns back to you, her red eyes staring at you intensely.");
	output("\n\nAdra smiles, and behind her you notice her tail wagging in excitement. She gives Tessa a quick peck on the cheek before moving in towards you. She bends over, meeting your face. <i>“I’ll be sure to treat you right.");
	if (!pc.isNude() || tessaHandler.clothes)
	{
		output(" Mind losing the clothes?.”</i>");
		output("\n\nYou remove your " + (tessaHandler.clothes ? tessaHandler.clothes : "[pc.gear]") + ", wiggling out of it the best you can while still seated on the floor. Adra smiles down at you, patiently waiting for you to fully disrobe. To the side you notice Tessa tapping her foot, more than a little impatient with your pace. You finish stripping down, now sitting naked on your [pc.ass].");
	}
	output("\n\nSlowly, Adra places her hands on your shoulders and guides you down until you’re flat on your back. The ausar swings her leg over you, now straddling your waist with her strong thighs. <i>“Wish I could stay up here, but...”</i> She runs her furry fingers along your [pc.chest], trailing downward towards your midsection. <i>“First I got to to warm you up.”</i>");
	output("\n\nSlowly, she moves her hands to either side of your head and bends over, her impressive chest threatening to smother you. Before it can, the well endowed woman starts to crawl backward, her chest brushing against yours as she slowly moves down your body. A shiver runs up your spine as her soft tits graze against your [pc.skinFurScales], giving you a teasing sensation that rises as she runs them over your lower half.");
	output("\n\nAs quickly as the sensation starts it stops as Adra reaches her target destination, her face now level with your");
	if (pc.hasCock()) output(" [pc.cockNounComplex]");
	else if (pc.hasVagina()) output(" [pc.vagina]");
	else output(" crotch");
	output(". The ausar looks up at you, blue eyes full of desire. <i>“Hope you don’t object to me treating myself.”</i> Her gaze shift over to Tessa. <i>“Try not to get to jealous.”</i>");
	output("\n\nTessa scoffs, and moves a hand to her crotch, her fingers disappearing between her thighs. <i>“I’ll make do on my own for now. You just try not to make a fool of yourself down there.”</i> She gives a devious smirk as her fingers get to work at herself.");
	output("\n\nAdra’s eyes turn back to you, a lascivious gleam in them. You can’t help but feel excited now. This woman is going to give you a treat.");
	if (pc.hasCock()) output("\n\nSlowly, Adra’s takes hold of your pillar of cockflesh, her furry hand wrapping around it. Her grip on your member is delicate, but you feel her fingers have some untapped strength. She starts to glide her hand up and down slowly, teasing you with some simple stroking. Adra’s fingers tickle your sensitive flesh, her furry digits making you gasp softly. The doggy girl smiles up at you, watching you enjoy her work.");
	else if (pc.hasVagina()) output("\n\nSlowly, Adra slides a hand down to your dewy womanhood, her fingers giving you a soft rub. The furry digits tickle your sensitive folds as the ausar starts to run them up and down slowly. You gasp softly, feeling her start to explore your cunt with her fingers as she strokes you. Adra’s fingers are long and strong, and move with precision and grace. The doggy girl smiles up at you, watching you enjoy her work.");
	else output("\n\nSlowly, Adra’s hand moves between your legs, one of her finger tips pressing against your clenched pucker. She pushes against you with the flat of her finger, giving you a small massage with the digit. Her furry finger tickles you, and you can’t help but gasp softly at her touch. Adra’s finger slowly starts to prod its way inside, causing your gasps to become a bit louder. The doggy girl smiles up at you, watching you enjoy her work.");
	output("\n\n<i>“God, are you serious?”</i> You hear Tessa speak from the side, the sound of her footsteps drawing closer. <i>“If you’re gonna be a tease at least do it right.”</i> The footsteps stop, with each of the ovir’s smooth legs coming to a halt on either side of your head. You face fills with more than a little colour, as you’re given a perfect view of her dripping wet cunt. Tessa shifts her weight from foot to the other with her hands on her hips, letting out an audible sigh. <i>“Here, like this.”</i> Before you can mount a protest, Tessa crouches, bringing her soaking pussy down hard on your face.");
	output("\n\nA powerful smell fills your nose as she lowers onto you. Unsurprisingly, she outright sits on your face. She squats in a way so not all of her weight is on you, but you still feel half smothered. You don’t dwell on that for long, the smell of her eager cunt stealing your attention. Her womanhood presses against your lips, her slick twat tickling you as you catch a taste of her. You shudder in lascivious pleasure, the ovir tasting better than normal. You arch back your neck, burying your face, and giving yourself another taste.");
	output("\n\nTessa moans softly above you, her womanhood quivering against your lips. More of her sweet juices ooze out, treating you to more of its familiar taste. Your lips part, and your [pc.tongue] slips out of your mouth slowly and begin lapping away at Tessa. You hear a louder moan above you as your tongue starts to work at her, and on either side of your head you feel Tessa begins to shake. It might be the booze, but she seems to be more sensitive than normal. Either way, you tilt your chin up and press in further with your tongue, sending the lust stricken woman into a small fit while her cunt continues to slickly convulse. You can’t help but elicit a throaty moan, losing yourself in her. Below you, a soft whining reminds you that you two are not alone.");
	if (pc.hasCock()) output("\n\nSomething other than Adra’s hand clamps down on your [pc.cockNounSimple]. Based on a slight grazing against your sensitive cockflesh, you can tell Adra has buried her face in your lap. The ausar wastes no time, immediately starting to work you over and sucking your cock eagerly. Powerful bolts of pleasure fire up your spine, causing you to seize up and almost forget Tessa is sitting on your face. Adra’s tongue, inhumanly long and thick, seems to wrap around your now burning rod, the added sensation making your shaft throb in appreciation. You gasp out, Adra’s warm and inviting mouth making your cock writhe pleasurably.");
	else if (pc.hasVagina()) output("\n\nSomething long and wet presses against your cunt. You guess it must be Adra’s tongue; the ausar has clearly buried her face in your snatch. The doggy girl wastes no time and starts to work away at you with strong, powerful licks with her ample tongue. Waves of pleasure radiate from your overstimulated pussy, the power of her ministrations causing you to almost forget about Tessa sitting on your face. Adra shifts her tongue around, focusing in and dragging her thick tongue over your sensitive [pc.clit] in repeated and precise flicks.");
	else output("\n\nAdra’s finger pulls away from your asshole and in its place something much thicker presses up against you. Whatever it is, it’s powerful and wet, and thrashes its way right inside of you. A howl catches in your throat as your ass is invaded, whatever it is wiggling its way inside. Your eyes open wide in realization: Adra is eating your ass. The feeling of her long, dexterous appendage forcing its way up inside you makes you almost forget Tessa is sitting on your face. Adra’s tongue starts to stretch you, but it’s nothing you know you can’t handle.");
	output("\n\nAbove you, you hear Tessa give a seductive growl. <i>“Hey bitch...”</i> Her voice is almost a purr, an octave deeper than normal. <i>“Don’t hold back.”</i> Adra seems to have heard, and you feel her attack on your nethers intensify; the doggy girl seeming to go all in. You gasp for air, burning hot and sweating from the ausar’s attack, fueled by the scent of your pale lover above. Tessa grinds her hips on your face, reminding you that your job isn’t over either. Fighting past Adra’s distraction, you tilt your neck back once more and let your tongue go to work, struggling to not choke on the ovir’s juices. You hear her give a throaty moan, seemingly enjoying your attention.");
	output("\n\nDown below, you feel Adra’s mouth pull away from you. She starts to crawl, scaling back up you into a straddling position once more. Her wide hips are on either side of yours now, and she gives you a squish with her powerful thighs. <i>“Here, have a taste.”</i> You hear Tessa’s gasp stifle, the noises silenced and replaced with throaty moans. Out of your sight, the two women embrace, clearly making out with each other while moaning lustfully. On your crotch, a slick, hot wetness starts to soak you, Adra’s fuzzy cunt starting to ooze on you.");
	if (pc.hasCock())
	{
		output("\n\nAdra grinds herself against you, rubbing her soaking wet pussy on your ridgid cock. Her cunt is hot, far more than you would have expected. Your two sexes burn against each other, teasing your cockflesh and driving you crazy with pleasure. After a bit more grinding, Adra shifts her hips and slides your cock properly inside of her eager cunt. Even with your face buried in ovir muff, you can’t help but let out a deep groan. Without missing a beat, you start to buck your hips, thrusting your hard cock into ausar now riding you. Adra’s snatch is even warmer on the inside. Your member nearly melts from the intense heat, and her fluids ooze out like molten lava. She starts moving her hips again, seemingly discontent with just your upward thrusts alone. You’ve gotta say, this woman can ride a cock.");
		pc.cockChange();
	}
	else if (pc.hasVagina()) output("\n\nAdra reaches between her legs, pressing her fingers against your abandoned cunt. Her furry fingers tickle, causing you to twitch and nearly shy away from her touch. After a few quick rubs, she pushes inside of your quivering womanhood with two fingers. You let out a throaty moan as she slides into you, curling her fingers dexterously finding g-spot. Soon a furry thumb joins as well, focusing in on your [pc.clit], rubbing away with enthusiasm. Adra’s three fingers all work at you in rhythm, working away both inside and out. Her effort sends you into a fit of writhing pleasure, the movement of the ausar’s fingers pleasing you in a way a cock never could. Her digits are strong but delicate, and you can’t help but suspect Adra is well practiced with this particular attack.");
	else output("\n\nAdra reaches between her legs, pressing her fingers against your pucker once more. Her furry fingers tickle, causing you to twitch and nearly shy away from her touch. After a few quick pokes, she pushes inside of your eager ass with two of her fingers. You let out a throaty moan as she slides into you, feeling her digits dig in deeper as they wiggle in. You feel her stretch you as she enters, not over stressing your hole, but rather testing it. Her effort sends you into a fit of moaning pleasure, the movement of the ausar’s fingers pleasing you in a way a cock never could. You lustful moans seem to be all the approval she needs to push them in a bit further. Her digits are strong but delicate, and you can’t help but suspect Adra has done this before.");
	output("\n\nTessa’s cunt trembles as you continue to eat her, the ovir putting slightly more of her weight on you. You keep yourself buried in her, lost in a haze of euphoria. You feel her juices flow over your face, lightly running down your chin as you eat her. Down below you feel Adra burn on your lap, the bitch’s cunt juices noticeably far warmer than Tessa’s. If the ausar was the one sitting on your face, your can only imagine how much your face would be on fire.");
	output("\n\nA stirring in your loins signals you’re drawing close. Adra continues to mercilessly fuck you with her " + (pc.hasCock() ? "pussy" : "fingers") + ", while you feel Tessa’s trembling start to become more pronounced. Your");
	if (pc.hasCock()) output(" [pc.cockNounSimple]");
	else if (pc.hasVagina()) output(" [pc.vagina]");
	else output(" [pc.ass]");
	output(" burns, and your climax teeters on the brink of exploding. On top of you the two women moan and shiver, both of them drowning in oceans of depraved pleasure. A surge of heat runs up your spine, arching your back, you feel yourself boil over.");
	output("\n\nYour");
	if (pc.hasCock()) output(" cock pulse then explodes, pumping ropes of thick [pc.cumColor] spunk deep inside of Adra’s cunt. You feel it fill her up to the brim and then some, with the excess oozing out down your shaft.");
	else if (pc.hasVagina()) output(" cunt ignites into a fire, sending powerful waves throughout your body. You feel your body tense, and before you know it you’re left a trembling mess, unable to do anything but moan. Adra’s fingers don’t stop, and continue to move inside you, prolonging your orgasm into near tortuous levels of pleasure.");
	else output(" ass burns, the sensitive hole pushed to its limit. You feel your whole body shake as you are helplessly drowned in sinful bliss. Adra’s fingers don’t stop, and they continue to move inside you, fueling your lustful fit in a near torturous way.");
	output(" Many long seconds later, you feel a dizzying sensation in your head, and your vision starts to blur. The women on top of you continue to moan and move, oblivious to your state. Time starts to become hazy, and you don’t know many more minutes pass, Tessa and Adra continue enjoying both you and each other. Darkness takes you, and you pass out.");

	addButton(0, "Next", tessaThreesomeOver);
}
	
public function tessaThreesomeOver():void
{
	clearMenu();
	clearOutput();
	showTessa();
	processTime(412);

	output("Your eyes stay closed when you wake, consciousness coming back to you slowly. As your senses start to sharpen, you realize you are still on the floor of Tessa’s ship. You open your eyes carefully, the light in the hold feeling nearly blinding. As you start to shift, you notice something is off, you’re naked. On top of that your completely spent and pleasurably sore.. Examining yourself you see your covered in a mix of dried fluids; cum, sweat, and you suspect something else you can’t quite place. It coats your [pc.skinFurScales] like a film, reaching from your head to your thighs. As you sit up, you feel it cracking and breaking on your body. Something about this is wrong, and the sex juices should not be covering you nearly this much.");
	output("\n\n<i>“Oh you’re up.”</i> You hear the sound of Tessa’s voice and turn your head, regarding the white woman. She’s sitting on her couch, wrapped in her fuzzy pink robe, with a book in her hand. <i>“I was wondering when you’d come to. It was starting to get ridiculous.”</i>");
	output("\n\nYou rubs your eyes, finding the dried fluids even there. <i>“What happened?”</i>");
	output("\n\nTessa closes her book and frowns. <i>“We fucked. Well you, me, and Adra fucked.”</i> She sets her book down next to herself and crosses her arms. <i>“It was nice, but don’t think it’s gonna happen again. That was a one time deal.”</i>");
	output("\n\nThinking about her words, a question forms in your mind. <i>“Where is Adra?”</i>");
	output("\n\nTessa shrugs. <i>“Back on the resort? I don’t know, she left hours ago.”</i>");
	output("\n\nYou feel your face twist in concern, the small woman saying a few things that scare you. <i>“Back at the resort? Hours ago?”</i>");
	output("\n\nThe ovir frowns. <i>“Yeah, we’re back on Tarkus. After we finished up we said our goodbyes and she left. You were... sleeping... and we decided not to bother you.”</i> She ruffles her hair and yawns. <i>“I figured I’d take us back, and let you sleep. Don’t worry, I made sure you were breathing before I took a nap.”</i>");

	addButton(0, "Get Mad", tessaThreesomeOverForRealsies, 0);
	addButton(1, "Unfazed", tessaThreesomeOverForRealsies, 1);
	addButton(2, "That’s Hot", tessaThreesomeOverForRealsies, 2);
}

public function tessaThreesomeOverForRealsies(reaction:int):void
{
	clearMenu();
	clearOutput();
	showTessa();
	processTime(7);

	switch (reaction)
	{
		case 0:
			output("You can’t even try to hide your outrage. She took a nap?");
			output("\n\nTessa shrugs once more. <i>“I was tired, not to mention I had half drunk sex with you and Adra. That was exhausting.”</i>");
			output("\n\n<i>“You took a nap while I was passed out on your floor from having had my face sat on?”</i>");
			output("\n\nTessa gives you a blank stare. <i>“Yes...”</i> The ovir clears her throat and uncrosses her arms. <i>“Okay... When you put it like that... Yeah, it sounds bad.”</i>");
			output("\n\nYou pull yourself up to your feet, the dried fluids cracking and flaking off of from your body. You ask Tessa why the hell you’re covered in so much of this stuff.");
			output("\n\nTessa starts to speak, but cuts herself off, thinking to herself a moment <i>“Do you really want to know?”</i>");
			output("\n\nAfter taking another deep breath, you decide you don’t. You gather up your gear and start to make your way to the ships exit, more cum flakes falling off you as you move around. As you’re leaving you hear Tessa stand and follow after you. <i>“Wait.”</i>");
			output("\n\nYou turn and face her, noticing her tail swishing on the ground behind her. Tessa’s face is filled with concern, and maybe more than a little regret.");
			output("\n\n<i>“I’m sorry. I was... That was super shitty of me. I just...”</i> she thinks about her words a moment. <i>“I’m sorry, I left you passed out on the floor. It won’t happen again. Promise.”</i>");
			output("\n\nSomehow you believe her. You say your goodbyes to Tessa and head out, still covered in whatever the hell it is on you.");
		break;
		case 1:
			output("You’re not really sure how to process that news, so you choose not to.");
			output("\n\nYou pull yourself up to your feet, the dried fluids cracking and flaking off of from your body. You ask Tessa why you are covered in so much of this stuff.");
			output("\n\nTessa chuckles, slightly amused. <i>“Do you really want to know?”</i>");
			output("\n\nIn keeping with your current attitude, you decide you don’t. You gather up your gear and start to make your way to the ships exit, more cum flakes falling off you as you move around. As you’re leaving you hear Tessa stand and follow after you. <i>“Wait.”</i>");
			output("\n\nYou turn and face her, notice her tail swishing on the ground behind her. Tessa’s face is filled with more than a little regret.");
			output("\n\n<i>“Hey, I know you don’t seem... Look. That was shitty of me. It’s just that...”</i> she thinks about her words a moment. <i>“Sorry, I left you passed out on the floor. It won’t happen again. Promise.”</i>");
			output("\n\nSomehow you believe her. You say your goodbyes to Tessa and head out, still covered in whatever the hell is on you.");
		break;
		case 2:
			output("A depraved smile creeps across your face. <i>“That’s Hot.”</i>");
			output("\n\nTessa smirks at you, her red eyes narrowing. <i>“Really now? Well that’s certaining interesting...”</i>");
			output("\n\nYou pull yourself up to your feet, the dried fluids cracking and flaking off of from your body. You ask Tessa why you are covered in so much of this stuff.");
			output("\n\nTessa chuckles, biting her lower lip. <i>“You didn’t think the fun stopped when you passed out did you?”</i>");
			output("\n\nA shiver runs down your spine, and you can’t help but picture the sorts of things they must have done on your unconscious body. You gather up your gear and sart to make your way to the ships exit, more cum flakes falling off you as you move around. As you’re leaving you hear Tessa stand and follow after you. <i>“Wait.”</i>");
			output("\n\nYou turn and face her, notice her tail swishing on the ground behind her. Tessa’s face is filled with slight concern.");
			output("\n\n<i>“Hey... I know you said you liked it, but I was just thinking... Look, I really shouldn’t have just left you there. It wasn’t right...”</i> she thinks about her words a moment. <i>“Sorry, I left you passed out on the floor. But... Now that I know you like that sort of thing...”</i> the pale woman gives you a sultry wink as her face shifts into a devious grin.");
			output("\n\nYou return the gesture at the seductive woman, liking the sound of that. You say your goodbyes to Tessa and head out, still covered in dried girl cum.");
		break;
	}

	//End of Event.
	//PC is left on the Tarkus Hangar.
	//PC is given Sweaty and Cumsoaked Debuffs.
	pc.applyCumSoaked();
	pc.createStatusEffect("Sweaty", 0, 0, 0, 0, false, "Icon_Smelly", "You are covered with sweat from a hard climb, reducing your potential sexiness to many foes. Some, however, may like it.", false, 0);

	addButton(0, "Next", tessaWeddingEnd, 7);
}

// Ending 8: Invitation
// Main Scene:
public function tessaCongratulatesTheNewlyweds():void
{
	clearMenu();
	clearOutput();
	showTessaWedCouple(true);
	processTime(12);

	output("Never one to turn down ‘Stuff’, you tell Tessa you’re quite interested.");
	output("\n\nThe white woman turns back to face the bride and groom, giving them a small thumbs up. You can tell from her body language Tessa is feeling more than just a little awkward. You can’t help but empathize, especially if this is going where you think it’s going.");
	output("\n\nAfter exchanging a few words with Karen, Tessa moves over to you and takes your arm. <i>“Okay, they’re going to meet us there in a few minutes.”</i> She starts to walk, leading you along with her.");
	output("\n\nAfter exiting the main hall, you question where exactly she’s taking you.");
	output("\n\nTessa sighs, seemingly not happy having to answer your question. <i>“Well we’re not using their suite, if that’s what you wanted to know.”</i> She glances over you, her red eyes looking right into your soul. <i>“We’re going to the storage room. The one with all the booze.”</i>");
	output("\n\nThat strikes you as more than a little odd. <i>“Why there?”</i>");
	output("\n\nThe white woman rolls her eyes. <i>“Hey, do you want a foursome or not? Just roll with it. Fuck.”</i> Tessa’s tone is sharp, but you can’t help but notice that despite her previous apprehension, she sounds excited herself.");
	output("\n\nOnce you reach the room, the two of you slip inside and wait. The storage room is more or less how you remember it, with maybe a little less alcohol laying around. Tessa takes a seat on a case of beer and sighs, tapping her sharp nails against her knee. Killing time, you take a look around the room, seeing what sort of booze they have on hand. After a few minutes the door swings open, Karen and Monty nearly tumbling onto the floor. The two of them are in a semi drunken embrace, laughing at some unspoken joke as they lay on the floor.");
	output("\n\nMonty is on his back, his shirt half open revealing more than a little lean muscle. At his belt, you spot a noticeable tent, suggesting Monty is packing some mean meat. On top of him sits his newly minted wife, her black hair free from its bun and falling down over her shoulders. Her chest is heaving, the small woman seems out of breath and flushed.");
	output("\n\n<i>“Hey Tessy...”</i> Karen looks over at her friend, wiggling her fingers towards the pale ovir enticingly. <i>“Come and play with us.”</i>");
	output("\n\nTessa presses her lips together, her expression seemingly unimpressed. Her tail tells a different story, wiggling behind her slightly. <i>“Let [pc.name] join in first. I’ll join in when I think it suits me.”</i>");
	output("\n\nKaren pouts, then shifts her attention over towards you. <i>“Fine then, you’ll play with us right? So, are you on the Bride’s side? Or the Groom’s?”</i>");

	//Plays Start 1
	addButton(0, "Bride", tessaYouMayNowDoTheBride, undefined, "Bride", "Ladies first?");
	//Plays Start 2
	addButton(1, "Groom", tessaYouMayAlsoFuckTheGroom, undefined, "Groom", "Last night as a free man, right?");
}

// Start 1:
public function tessaYouMayNowDoTheBride():void
{
	clearMenu();
	clearOutput();
	showTessaWedCouple(true);
	processTime(27);

	output("You give Karen a smirk, letting the young bride know you’re gunning for her. She returns a smile and pulls herself up off Monty, moving towards you slowly.");
	output("\n\n<i>“Hm, I like that.”</i> She reaches down and hikes up the front of her long white dress, revealing she isn’t wearing anything underneath. Her womanhood, from what you can tell, is moist and ready, and a tickle in the back of your throat urges you to have a taste. Karen seems to notice, and giggles to herself. <i>“Come on, kiss the bride.”</i>");
	output("\n\nNot having to be told twice, you drop down to your knees and move in. You press your [pc.tongue] against the blushing bride’s twat, eager to get a taste. As soon as your tongue touches her, a wave of depraved pleasure runs down your spine like a shivering chill. While she doesn’t taste particularly special, the idea of being on your knees eating out somebody else’s wife adds enough of a kick to get your blood boiling. Without giving it any further thought, you bury yourself into the Bride’s cunt, your tongue active and eager.");
	output("\n\nKaren gasp and moans at your down-below kiss, her knees starting to shake after less than a minute. She reaches down and plants her hands against your shoulders, propping herself up against falling over. Her twat oozes against your face and tongue, her sweetness becoming addictive. The sounds of her moans spur you on, inspiring you to dig faster and deeper. Her terran pussy is simple to please, and sensitive in all the right spots. The fact she’s liquored up also helps, but the idea her strong reactions are solely a result of your actions is far more arousing.");
	output("\n\nOff to the side you here a low growl, and the sound of footsteps. Your tongue pauses for a moment: Tessa’s on the move. The footsteps are drawing close, the clicks of her heels making far more noise than the ovir normally allows, sounding almost angry. You can’t help but tense up, fully believing the ovir is about to do something violent. To your surprise, they pass right by you, heading in the direction of Monty. A moment later you hear the man yelp along with a something that sounds like a struggle. Believing for a moment Tessa might be throttling the man, a deep lusty moan from Monty tells you he’s far from being in distress. As far as you can tell based on other suggestive noises, Tessa decided to give Monty the blowjob of a lifetime.");
	output("\n\nNot wanting to be shown up, you double down and give it your all, burying yourself so deep into Karen’s cunt you almost lift the small woman off her feet. She really doesn’t seem to mind however, the sounds of her moaning starting to become louder and with more weight. Hot girl cum fills your mouth, tickling your lips as you lick away at her cunny. You feel your neck start to cramp as time begins to blur. You can’t be sure if you’ve been eating her out for a minute or an hour. A popping sound and Tessa’s voice stirs your attention.");
	output("\n\n<i>“Would one of you two get over here. This cock needs a rider, and it ain’t gonna be me.”</i>");

	//Plays Ride Him 1
	addButton(0, "Ride Him", tessaTheGroomCameToTheWedding);// idek what I'm doing with functions anymore
	//Plays Karen Rides
	addButton(1, "Karen Rides", tessaKarenRidesStuffFunctionThingKillMe);
	//Plays Fuck Karen 1
	//PC must have a Cock
	if (pc.hasCock()) addButton(2, "Fuck Karen", tessaBridefuckFuckFuctionNameThingAH);
}

// Start 2:
public function tessaYouMayAlsoFuckTheGroom():void
{
	clearMenu();
	clearOutput();
	showTessaWedCouple(true);
	processTime(12);

	output("Your eyes shift from Karen down to Monty, letting the young bride know you’re gunning for her man. She rolls her eyes and lifts herself of her husband, leaving him on the floor with his pants still tented.");
	output("\n\n<i>“Wait, really?”</i> Monty lifts his head up, watching as you move towards him. His hidden manhood seems to sniffen up, his pants growing even tighter. As you reach him, you drop down and reach for his fly, popping off his button and pulling down the zipper. Biting your lip, you reach into his pants and pull little Monty free.");
	output("\n\nLittle Monty might be a poor description, as the cock in your hand masts out at least eight inches. Just staring at it makes your mouth water, the thought of sucking on such a thick hunk of meat making you quiver. Not being able to help yourself, you move in, taking Monty’s cockhead into your mouth. As soon as you close your mouth, a wave of depraved pleasure runs down your spine like a shivering chill. While he isn’t particularly large or thick, somehow the idea of being on your knees sucking off somebody’s husband adds enough of a kick to really get your blood boiling. Without giving it any further thought, you bury yourself into the Groom’s lap, sucking away eagerly.");
	output("\n\nMonty gasp and moans as you work his pole, his body starting to shake after less than a minute. His manhood throbs in your mouth, seemingly growing slightly larger with each pulse. The faint taste of precum tickles your tongue, tasting sweet as it oozes out. You start to suck harder and deeper, picking up your pace with vigor and hunger as the man moans below you. His terran cock is simple to please, and you’re able to take it all into your throat with little effort. The fact he’s liquored up also helps, but the idea his strong reactions are completely a result of your work is far more arousing.");
	output("\n\nOff to the side you here a low growl, and the sound of footsteps. You pause for a moment: Tessa’s on the move. The footsteps are drawing close, the clicks of her heels making far more noise than the ovir normally allows, sounding almost angry. You can’t help but tense up, fully believing the ovir is about to do something violent. To your surprise, they pass right by you, heading in the direction of Karen. A moment later you hear the woman gasp along with the sound of somebody hitting the floor. Believing for a moment Tessa must have pounced on her, a deep lusty moan from Karen tells you she’s far from being in distress. As far as you can tell based on other suggestive noises, Tessa is giving Karen the tonguing of a lifetime.");
	output("\n\nNot wanting to be shown up, you double down and give it your all, burying yourself so deep onto Monty’s cock, your teeth almost touch his pelvis. He really doesn’t seem to mind however, the sounds of his moaning starting to become louder and with packed with more sensual weight. The thick meat in your mouth burns, twitching and throbbing in approval. You feel your neck start to cramp as time begins to blur. You can’t be sure if you’ve been sucking him off for a minute or an hour. The sound of lips smacking and Tessa’s voice stir your attention.");
	output("\n\n<i>“For fucks sake, Steele. Mount up already. Unless you’re a little bitch.”</i>");

	//Plays Ride Him 1
	addButton(0, "Ride Him", tessaTheGroomCameToTheWedding); 
	//Plays Karen Rides
	addButton(1, "Karen Rides", tessaKarenRidesStuffFunctionThingKillMe);
	//Plays Fuck Monty 1
	//Requires Cock
	if (pc.hasCock()) addButton(2, "Take His Ass", tessaIWouldMakeAnAlimonyJokeButThatsWrong);
}

// Ride Him 1:
public function tessaTheGroomCameToTheWedding():void
{
	clearMenu();
	clearOutput();
	showTessaWedCouple(true);
	processTime(27);

	output("After thinking a moment, you decide you hop up on the Groom’s cock yourself.");
	output("\n\nIt doesn’t take you long to get into position,");
	if (!pc.isNude() || tessaHandler.clothes) output(" shedding off your " + (tessaHandler.clothes ? tessaHandler.clothes : "[pc.gear]") + " and");
	output("taking your place on top of the man. Below you Monty takes a deep breath as you lower yourself down, the crown of his cock pressing against your " + (pc.hasVagina() ? "[pc.vagina]" : "[pc.ass]") + ". You rotate your [pc.hips], teasing the poor man below you while you prepare your eager hole. With a deep breath you bite the bullet and lower yourself down.");
	if (pc.hasVagina())
	{
		output("\n\nAs Monty slides inside of you, your cunt quivers and tightens around his slickened manhood. Your head falls back as you gasp, inch by meaty inch sheathing into your soaked cunt. Without thinking, you start to rotate your hips again, twisting your body to properly enjoy the thickness inside you. Your cunt burns, waves of fiery pleasure radiating up into your stomach. Below Monty softly moans, enjoying your motion, despite the fact it’s more aimed at your own pleasure. After tormenting him for a few moments, you start to buck your hips, properly working his cock. With a throaty moan, you close your eyes and enjoy your ride.");
		pc.cuntChange(0, 150);
	}
	else
	{
		output("\n\nMonty pops inside your ass as you lower yourself, forcing his meat inside of your hole. You gasp and moan as he goes in deeper and deeper, until your cheeks come to rest against his thighs. Without thinking, you start to rotate your hips again, twisting your body to properly enjoy the thickness inside you. You feel your ass tighten as you move, reacting to the invading meat. The added tightness only makes you wince in a mix of pain and pleasure, and spurs you on into further action as you start to buck your hips. With a throaty moan, you close your eyes and enjoy your ride.");
		pc.buttChange(150);
	}
	output("\n\nAs you move up and down his length you can’t help but gasp and moan like a slut. His cock throbs inside of you, seemingly threatening to explode already. Monty’s voice start to rise, the man moving his own hips now with lustful enthusiasm. You decide to try and slow down, hoping to draw this out a bit longer. At least until the others jump in. The sound of Monty’s moan being stifled by something forces you to open your eyes once more.");
	output("\n\nKaren is now in front of you, the Bride naked and seated on her husband’s face. Perky round tits are on full display in front of you, perfectly shaped C-cups each capped by a stiff dark nipple. Her face is flushed as she rocks her hips slightly, grinding herself on Monty’s face in a selfish pursuit of pleasure. Behind you you hear movement, Tessa on the prowl. You pay her little attention, your eyes focused in on Karen’s bouncing chest. Leaning in, you take one of her dark nipples into your mouth, giving it a teasing suck and nibble. The small woman gasps and quivers, her tit seeming to stiffen more between your lips. Below you Monty shudders, his orgasm seemingly becoming hard to hold back once more.");

	//Plays Ride Him 2
	addButton(0, "Next", tessaTheGroomCameInTheWedding);
}

// Ride Him 2:
public function tessaTheGroomCameInTheWedding():void
{
	clearMenu();
	clearOutput();
	showTessaWedCouple(true);
	processTime(21);

	output("Over Karen’s shoulder you notice a white flash, followed by the Bride letting out a sinful cry of pleasure, with her back arching so far she almost bends over backwards. Releasing her nipple from your mouth, you cock your head and see Tessa has pressed herself against Karen’s back, her large bust tight against the small woman. Your eyes trail downward, and much to your surprise, you see your ashen companion has shoved the tip of her tail deep into Karen’s tight little ass. Tessa realizes you’ve noticed what she’s done and gives you a shrug, and then wraps her scaly arms around the Bride, her clawed fingers run up Karen’s body, trailing up her sides towards her perky chest. Roughly, but without using her claws, she takes a firm hold on Karen’s tits, kneading them and giving her dark nipples a powerful pinch.");
	output("\n\nThe depraved sight before makes your core quiver, Tessa’s darkly sensual actions impossibly lewd. You focus in on the two women, deep down believing Tessa is putting on this show for you. Monty’s cock continues to thrust exploring deeper into your " + (pc.hasVagina() ? "twat" : "hole") + ", pushing you closer to your limit. In front of you, Karen moans and writhes, caught up by Tessa while having her ass stuffed and cunt eaten. You feel yourself start to rise to your breaking point, the Groom thrusting into your " + (pc.hasVagina() ? "[pc.vagina]" : "[pc.ass]") + " increasing with fervor with each passing second. A fire in your belly soon starts to pulse and threatening to explode. With each thrust of Monty’s cock you are brought closer to your ultimate release. Gasping for each breath, you throw your head back and let out a shuddering moan, with Karen in not far behind eliciting her own a scream of pleasure.");
	output("\n\nThe fire quickly becomes an explosion, and your whole body tenses leaving you a shuddering mess as ecstasy overcomes you. Below it feels like your " + (pc.hasVagina() ? "cunt" : "ass") + " is turned inside out, Monty’s cock plunging its depths as he hilts himself inside you. Below you feel the Groom tense and shake, his pulsing cock buried deep as he unloads a thick blast of spunk into your well-spent sex. His cum fills you up to the brim, throbbing inside your hole as you feel his seed oozing. Karen soon starts to convulse in front of you, the tail up her ass and the tongue in her cunt seemingly more than the smaller woman could handle. Suddenly she arches backwards against Tessa, the pale woman gripping the Bride tightly against herself. Looking back at Karen, you notice her eyes have rolled back, while her tongue hangs out like a bitch in heat. Eventually, Tessa’s arms disappear off of the small woman, the pale ovir seeming to vanish from sight altogether. Karen tumbles forward, falling against you, her face pressing against your [pc.chest].");
	output("\n\nExhaustion hits you like a truck and you fall backwards, Monty’s cock popping out of you trailing a rope of his cum, as you and the Bride tumble onto the ground.");

	var monty:Creature = new Creature();
	monty.createPerk("Fixed CumQ", 1500);
	if (pc.hasVagina()) pc.loadInCunt(monty);
	else pc.loadInAss(monty);
	monty = null;
	pc.orgasm();

	//Plays Outro
	addButton(0, "Next", tessaWeddingDebaucheryIsOver);
}

// Karen Rides:
public function tessaKarenRidesStuffFunctionThingKillMe():void
{
	clearMenu();
	clearOutput();
	showTessaWedCouple(true);
	processTime(3);

	output("After thinking a moment, you decide that Karen should ride her new husband.");
	output("\n\nWhile she gets into place");
	if (!pc.isNude() || tessaHandler.clothes) output(", you pull off your " + (tessaHandler.clothes ? tessaHandler.clothes : "[pc.gear]"));
	output(", watching Karen start to disrobe herself. She slips out of her dress, revealing her perky round tits and a surprisingly cute bubble butt. You watch her mount up onto Monty, and start to ride him without much hesitation.");
	output("\n\nAfter watching a minute, you feel a scaly hand crawl up your shoulder and a large set of breasts press against your back. Tessa’s voice is a purr in your ear. <i>“Now, I know you’re into some freaky ass shit, but standing in a corner watching a couple have half drunk sex on their wedding night? How depraved.”</i>");
	output("\n\nYou feel the ovir press against you harder, her soft chest cushions tight against you.");
	output("\n\n<i>“Time to act, Steele. What’ll it be?”</i>");

	//Plays With Tessa 1
	addButton(0, "With Tessa", tessaWithTessaWithTessa);
	var btnSlot:int = 1;
	//PC must have a vagina
	//Plays Monty’s Face
	if (pc.hasVagina()) addButton(btnSlot++, "Monty’s Face", tessaTimeToFaceTheGroomNoThatsNotWhatIMeant);
	//PC must have a cock
	//Plays Karen’s Ass
	if (pc.hasCock()) addButton(btnSlot++, "Karen’s Ass", tessasFriendDoneInTheButtButt);
}

// With Tessa 1:
public function tessaWithTessaWithTessa():void
{
	clearMenu();
	clearOutput();
	showTessaWedCouple(true);
	processTime(12);

	output("You turn your head, locking eyes with the white woman and giving her a mischievous smirk. Her red orbs stare back at you, the pale woman letting out a soft sigh. <i>“Fine, if that’s how you want it. Get on your back.”</i>");
	output("\n\nLaying down on the floor, you quickly discover it’s freezing cold, and on contact your spine arches away from the cold cement. Above you Tessa lets out a small laugh, then lowers herself down, her thick scaly thighs falling on either side of your [pc.waist]. <i>“Aww, sorry about that.”</i> She runs her fingers along your collarbone, her sharp claws gliding over you. <i>“Don’t worry, I’ll make it up to you. Just lay back and let me take very, very good care of you.”</i> She gives you a wide and wicked grin.");
	if (pc.hasCock()) output("\n\nWith her free hand, Tessa reaches down between her legs, her fingers brushing against your [pc.cock]. The touch of her scaly hand sends a shiver up your spine, as her smooth fingers run up and down your sensitive member. Your shaft hardens at her touch, engorged with blood, growing girthier where it rests; nestled in between her thick thighs. You feel her slender digits wrap around you, taking hold of your mast with an iron grip. Slowly, she runs her hand up and down, your thick meat throbbing in her hand as she strokes you. You release a soft sigh, enjoying Tessa’s uncharacteristically soft touch as the pale woman continues to jerk you off.");
	else if (pc.hasVagina()) output("\n\nWith her free hand, Tessa reaches down between her legs, her fingers brushing against your [pc.vagina]. The feel of her scaly hand sends a shiver up your spine, as her smooth fingers run up and down the sensitive folds of your womanhood. Her touch makes your cunt flesh tingle and warm, and you feel yourself growing wetter by the second. As if invited in, two of her fingers slip inside of you, curling and dexterously locating your G-spot. Her thumb teases against your [pc.clit], applying some pressure against it while her fingers massage the inside of your cunt. You gasp out softly, enjoying Tessa’s uncharacteristically soft touch as the pale woman continues to work your pussy.");
	output("\n\nYour ivory companion bends over, keeping her hand her firmly on your sex. Her smooth tits press against your [pc.chest] tightly, as she brings her face down next to your ear. Softly she whispers. <i>“I’m really glad you picked me.”</i> Something in her voice tells you she’s more than just glad. In fact, Tessa sounds almost grateful. She takes a deep sigh and you faintly smell the booze staining her breath. Perhaps it’s just the liquor talking? Before you can give it more thought Tessa pulls herself off of you and retreats into an upright position.");
	if (pc.hasCock())
	{
		output("\n\nTessa lifts up her hips while her hand slides its way down to the base of your cock, standing it upright. Heat from her burning ovir snatch radiates down on your [pc.cockHead], making your manhood throb in anticipation. Slowly, Tessa lowers her hips, sliding your thick shaft into her waiting cunt. A surge of pleasure rockets up your spine as the curvy ovir lowers herself onto your lap, burying your cock deep inside her tender pussy. Despite sudden the assault to your senses, a thought sticks sharply in your mind: Tessa is letting you fuck her. After some testing thrusts, you also note Tessa’s cloaca is clearly not like a normal cunt. It seems to mold to the shape of your [pc.cockShape] schlong, with her hole feeling tighter than you expected, but somehow more spacious than you imagined. Above, you hear her gasp slightly, her twat tightening around you, causing another wave of burning pleasure to surge through your body.");
		pc.cockChange();
	}
	else if (pc.hasVagina()) output("\n\nTessa drags her slickened fingers from your cunt, lifting them up to her face. Her long tongue pokes out slightly and she runs her fingers over it, using her dexterous muscle to lick away your juices. She lets out a soft moan, her tongue pulling her fingers into her waiting mouth, and giving them a small suck. Her red eyes look down at you, a small grin forming on the corners of her mouth. Full distracted by Tessa’s tasting, you nearly scream as something thick presses up against your now abandoned cunny. At first you think it’s a cock, but you know that’s impossible based on the angle and present company. Whatever it is, it pushes its way into your wet tunnel with ease, growing thicker as it dives deeper. Your eyes open wide in a horrid realization; Tessa is using her tail on you. She moves it slowly, wiggling it’s prehensile length slightly while testing the limits of your snatch. The powerful appendage forces a gasping moan from your lips as the ovir’s tail starts to slide in and out, fucking your eager pussy.");

	//With Tessa 2
	addButton(0, "Next", tessaWithTessaWithTessaNowWithMoreTessa);
}

// With Tessa 2:
public function tessaWithTessaWithTessaNowWithMoreTessa():void
{
	clearMenu();
	clearOutput();
	showTessaWedCouple(true);
	processTime(19);

	output("Footsteps remind you that the two of you are not alone. You see Karen slide in next to Tessa, the Bride breathing heavy and covered in sweat. <i>“Tessy.”</i> She says, voice colored with a sing-song tone, <i>“It’s not really group sex if we’re just two couples next to each other.”</i>");
	output("\n\nTessa rolls her eyes and sighs. <i>“Yeah, right.”</i> She glances down at you, gaze thich with contemplation, <i>“Well, you heard her.”</i> Tessa turns to Karen, a smirk on her lips. Karen returns the expression and turns to face you. Sauntering towards you slowly, she comes to a halt, her legs on either side of your head and a mischievous glint in her eyes.");
	output("\n\nShe pauses for a moment before lowering herself, bringing her already wet and well fucked cunt down to your eager mouth. The taste of her is overwhelming. Based on her flavor, you can tell Monty didn’t creampie her, but based on how soaked her pussy is, you can tell Karen was teasing with the edge of her one climax. Your eyes rolls back a moment, losing yourself in the moment; pure bliss taking over. Without noticing, your tongue starts to move on its own, lapping away at Karen’s pussy and flicking her raised button. You hear the petite woman gasp, eliciting a shuddering moan from your tongue’s touch.Soon you hear another set of footsteps, and the sound of Tessa’s voice.");
	output("\n\n<i>“Bring that here a minute.”</i> You hear the footsteps stop, followed by a deep moan that could only belong to Monty. If you had to guess, Tessa stuck the Groom’s cock in her mouth, and is giving him a ballbusting blowjob. It’s hard to tell from your position, but the faint sounds of slurping and sucking more than confirm your belief.");
	if (pc.hasCock()) output(" Down below, Tessa starts to bounce her hips, thick ass quaking in your lap as she starts to ride your cock. Her womanhood tightens around you once more, and nearly causing you to choke as you eat Karen’s flowing cunt. You feel your cock throbs inside of your ivory lover, burning and twitching as the ovir slides up and down your length.");
	else if (pc.hasVagina()) output(" Down below, Tessa’s tail starts to move once more, writhing inside you while it slides in and out of your slick quim. The strength of her tail surprises you as it moves, its touch making you almost choke as you eat Karen’s used slit. Your own twat burns, releasing searing waves of pleasure making your knees shake.");
	output(" Faintly, you hear a popping noise and Tessa speaks once more. <i>“Stick it in her ass loverboy, she’ll love it.”</i>");
	output("\n\nYou feel Monty position himself near your head, and a moment later Karen lets out a throaty cry of pleasure. The sounds of hips pounding against ass rings in your ear, the Groom roughly pounding his wife’s backdoor just inches from your face. Karen starts another wailing moan, only to be fiercely cut-off a moment later, her cry replaced by muffled kissing noises. Tessa’s work no doubt. You double down on the Bride’s cunt, licking her ferociously, homing in on her sensitive pleasure button. You can’t be sure if her pleasurous throws are because of you, or the cock buried deep in her ass.");
	if (pc.hasCock())
	{
		output(" You feel Tessa start to move her hips faster, the ovir’s rear end rebounding against you. Desperate to keep up, you buck your hips, trying to match the woman’s pace as you thrust into her. Your cock is about to burst, your climax approaching by the second as your synced pace draws you closer.");
		output("\n\nYour [pc.balls] churn, and your bury yourself deep into Tessa’s cunt as a surge of liquid bliss mounts, demanding release from your burning hot rod. A shudder of pleasure racks your body as thick globs of [pc.cumColor] spunk erupts from your [pc.cockHead] filling the pulsating confines of Tessa’s sex. Above, you feel your pale lover tense, her powerful scaled thighs squeezing tight to your hips. Her sensual juices ooze from her cunt, soon intermixed with spools of your cum, leaving you soaked in a mix of warm fluids.");
	}
	else if (pc.hasVagina())
	{
		output(" Tessa’s tail starts to move faster, the strong appendage moving feverishly inside of you. On your lap Tessa’s cunt oozes its appreciative wetness onto you, her juices oozing down your pubis and onto your quivering snatch. You feel your spine start to arch, your whole body growing tense as you draw closer to your climax.");
		output("\n\nYou let out a muffled moan, suppressed by the cunt quivering against your lips. A powerful tremor courses through your frame, and you feel your muscles tense to their limits. Tessa’s tail doesn’t stop its assault on your battered slit; if anything her pace increases.. Another wave hits you, almost toppling Karen and Tessa off as you writhe in agonizing pleasure. Suddenly Tessa’s tail stops, the powerful limb going still inside of you.");
	}
	else output("\n\n");
	output("Nearby you feel Monty tense and shake, the Groom seemingly finishing off himself and firing his viscus load deep into dark depths of his wife’s ass. Karen manages to separate herself from Tessa’s mouth, a passion laden cry chasing after. Her husband’s climax and your tongue seemingly taking their toll and pushing her over the edge into her own resounding climax. Her back arches, and she nearly topples off of you, falling back against her husband. You hear a low and lusty moan above you, one that can only come from Tessa. She lifts herself off of you");
	if (pc.hasCock()) output(", your slickened cock sliding free from her womanhood");
	else if (pc.hasVagina()) output(", her tail sliding free from your cunt");
	output(". After a moment, Tessa seems to disappear completely, leaving your cumsoaked crotch unattended.");
	output("\n\nExhaustion hits you like a truck, and you feel the Bride and the Groom fall backwards onto the ground. The whole party spent.");

	pc.orgasm();

	//Plays Outro
	addButton(0, "Next", tessaWeddingDebaucheryIsOver);
}

// Monty’s Face:
public function tessaTimeToFaceTheGroomNoThatsNotWhatIMeant():void
{
	clearMenu();
	clearOutput();
	showTessaWedCouple(true);
	processTime(19);

	output("\n\nYou cunt quivers as you picture yourself seated firmly on Monty’s face. You think you’ve made your choice.");
	output("\n\nWalking over slowly, you position yourself overtop of Monty and crouch down until your squatting just above the Groom’s chiseled face. You feel his hot breath against your twat, the man panting so hard you almost expect him to pass out. A wave of sensation runs through your body, coaxed out by the promise of more pleasure. With a deep sigh, you lower yourself down into a kneeling position, sex resting directly against the Groom’s face.");
	output("\n\nAlmost immediately Monty’s tongue gets to work. Powerful and heavy licks, lacking any sort of precision, assault your womanhood causing your spine to arch in pleasure. Despite not having any clear focus, Monty’s tongue seems almost inhumanly wide and long, brutishly forcing its way into the confines of your eager cunt. You gasp for air, trying to fight off the urge to exhale and moan. Monty’s tongue hesitates for a moment, perhaps cramping, giving you a moment to catch your breath while you fall forward slightly against Karen’s shoulder.");
	output("\n\nThe Bride barely reacts to you leaning against her, riding her husband so feverishly she’s long gone, drowning in a sea of bliss. As you start to pull yourself up, Monty’s tongue regains its fervor, however with a bit less gusto and force behind it. You moan softly, clenching onto Karen tightly as waves of pleasure begin to radiate through your core once more. Sweat starts to bead on your [pc.skinFurScales], and you feel Karen is already slick with perspiration of her own. Your cunt feels like it’s on the verge of exploding, the heat inside of you starting to reach its peak aching for release. You feel Karen’s body start to tense up as her pace begins to falter. She’s close, but you can’t be sure if her energy will hold out. Below you Monty seems to have trouble dividing his attention between the two of you.");
	output("\n\nOver Karen’s shoulder you notice a white flash, followed by the Bride letting out a sinful cry of pleasure, with her back arching so far she almost falls over backwards. Tilting your head, you see that Tessa is pressing herself against Karen’s back, her large bust tight against the small woman. Your eyes trail downward, and much to your surprise, you see the your pale companion has shoved her tail between her own legs and right up Karen’s tight little ass. Tessa notices you see what she’s done and gives you a shrug, and then wraps her scaly arms around the Bride. Her clawed fingers run up her body, trailing up her sides towards her pert chest. Roughly, but without using her claws, she takes a firm hold on Karen’s tits, squishing them before roughly squeezing her dusky nipples...");
	output("\n\nThe depraved sight before you stokes your fire, the added heat making the warmth spread a little faster. You focus in on the two women, believing on some level Tessa is putting on this show for you. Monty’s tongue, in its impossibly large glory, invades your quivering snatch, twisting inside you in an unspeakably lewd manner. In front of you, Karen moans and writhes, caught up in Tessa’s embrace while having both her holes used and abused. Your pussy starts to burn so hot you feel like you’re on the verge of a melt down, and you know you’re about to rise to the pinnacle of pleasure. Gasping for each ragged breath, you throw your head back and let out a shuddering moan, and in front of you Karen responds with a pleasured scream of her own.");
	output("\n\nThe fire within quickly becomes an explosion, and your whole body tenses. You’re left a shuddering mess as ecstasy overcomes you. Below it feels like your cunt turns inside out, your overstimulated sex well past its breaking point. Below you feel Monty tense and shake, his tongue going still as the Groom is seemingly lost in an orgasm of his own. Not long after Karen starts to convulse as well, Tessa’s tail in her ass and the thick load dumping into her cunt seemingly more than she can handle. Her back arches against Tessa, the white ovir gripping the Bride tightly against herself. Looking back at Karen, you notice her eyes have rolled back, while her tongue hangs out like a bitch in heat. Tessa’s arms disappear from around the smaller woman, the pale ovir suddenly seeming to vanish from sight altogether. Karen tumbles forward, falling against you, her face pressing against your [pc.chest].");
	output("\n\nExhaustion hits you like a truck and you fall backwards, your abused cunt slipping off Monty’s face as you and the Bride tumble to the ground.");

	pc.orgasm();

	//Play’s Outro
	addButton(0, "Next", tessaWeddingDebaucheryIsOver);
}

// Karen’s Ass:
public function tessasFriendDoneInTheButtButt():void
{
	clearMenu();
	clearOutput();
	showTessaWedCouple(true);
	processTime(19);

	output("You cock twitches as you eyeball Karen’s round rear. You think you’ve made your choice.");
	output("\n\nWalking over slowly, you position yourself behind Karen and lower yourself to your knees, aiming your [pc.cockHead] directly at Karen’s pucker. She turns her head around slightly, a lewd smile forming on the corners of her mouth as she rides her husband’s cock. Her smile makes your stiffened mast twitch, your eagerness at a breaking point. Taking hold of her hips, you press forward, penetrating the Bride’s taught behind.");
	pc.cockChange();
	output("\n\nYou note the tightness to be far more intense than you expected. While not feeling like you’re forcing your way in, something seems to be adding extra pressure against your now deeply embedded prick. After a moment, you realize the added pressure is a result of Monty, who despite filling a completely different hole is making Karen’s insides far tighter. Not that you’re complaining. You groan as you relish in the pleasure of taking the Bride’s backdoor, a shiver traveling up your spine. Her soft cheeks press against your [pc.hips], perfect padding for you as you ready yourself. With a deep breath, you regrip her hips and start to put your [pc.cockNounComplex] to work.");
	output("\n\nThe Bride’s moans grow so loud your ears start to ring, both her ass and cunt both being fucked mercilessly. You struggle to hold her as she writhes in a fit of pleasure, trying to keep her steady so you don’t have to alter your pace. You thrust into her dark tightness over and over, each time slamming your hips into her heavenly behind. Sweat starts to form on your [pc.skinFurScales], your whole body burning with the warmth of your lust and exertion. Your cock feels like it’s on the verge of exploding, with Karen’s ass now clenched dangerously tight as a result of her overstimulated state. Below her you hear Monty panting, and you can only imagine his own cock is treated to a similar experience to your own. At this rate you don’t think either of you will last much longer.");
	output("\n\nOver Karen’s shoulder you notice a white flash, followed by Monty’s muffled cries. Tilting your head, you see that Tessa has outright sat down on Monty’s face, the poor man wiggling under the ovir’s womanly hips. The pale woman smirks and releases a contented sigh, then starts grinding herself on the Groom’s face. Tessa’s red eyes focus in on Karen, her smirk turning into something far more depraved as her long tongue slips from her mouth. A moment later she leans in, and suddenly the Bride’s moans are muffled like her husband’s, only by a different set of lips this time. Karen doesn’t seem to mind, and roughly grabs at Tessa, pulling herself closer to the snowy woman nearly causing you to mistime a thrust and pop out of her ass completely.");
	output("\n\nYou quickly reseat yourself in her behind, scooting forward against the Bride’s ass. Ignoring the two women, you focus on yourself, taking a deep breath and picking up the pace. Huffing for air, you hammer the Bride’s ass with all of the force you can muster, fighting against the tightness of her overstuffed lower end, trying to hold on the best you can. Muffled moans from the others are soon drowned out by the wet sounds of sex, as Monty also pick up the pace despite being half smothered by Tessa. Your [pc.balls] " + (pc.balls > 1 ? "start" : "starts") + " to ache, on the verge of reaching their breaking point as your cock throbs inside Karen’s hole. Gasping for each breath, you throw your head back and let out a impassioned groan, the only one of the four of you able to make a proper cry of passion.");
	output("\n\nYour [pc.balls] churn, as you bury yourself deeply into Karen, a surge of liquid bliss fires through your burning hot rod. A shudder of pure pleasure runs through your body as thick spools of [pc.cumColor] spunk erupts from your [pc.cockHead] and fill the Bride’s dark passage. Below you feel Monty tense and shake reaching his own climax as well. The Groom fires off his own load deep into the depths of his new wife’s pussy. Karen pulls herself off of Tessa and convulses, the two orgasms seemingly taking their toll on her and pushing her over the edge. Her back arches, and she nearly topples over onto you, falling heavily against your heaving [pc.chest]. Looking down at her, you notice her eyes have rolled back, and her tongue hangs out like a bitch in heat. You hear a low and lusty moan and turn your eyes upward to face Tessa. The chesty ovir’s face is flushed, and she seems is be purring with pleasure. She lifts herself off Monty’s face, the Groom taking a deep gasping breath as he takes his first draw of air without just his nose in quite some time. Tessa gives you a smirk, then rolls off Monty completely.");
	output("\n\nExhaustion hits you like a truck and you fall backwards, your cock audibly popping out of Karen’s ass as you and the Bride tumble onto the ground.");

	pc.orgasm();

	//Plays Outro
	addButton(0, "Next", tessaWeddingDebaucheryIsOver);
}

// Fuck Karen 1:
public function tessaBridefuckFuckFuctionNameThingAH():void
{
	clearMenu();
	clearOutput();
	showTessaWedCouple(true);
	processTime(12);

	output("After thinking a moment, you decide that you want a piece of the Bride.");
	output("\n\nPulling yourself to your feet, you take off your " + (tessaHandler.clothes ? tessaHandler.clothes : "[pc.gear]") + ", Karen looking up at you quizzically. A sudden realization hits her, and a wide smile crosses her lips. She jumps up to her feet and slips out of her dress, revealing her perky round tits and a surprisingly cute bubble butt. Off to the side, you think you hear Tessa swear under her breath, followed by another yelp from Monty. You almost feel sorry the man. She moves in towards you, her face red and flushed. <i>“Get on your back, the floor is too cold for me.”</i>");
	output("\n\nLaying down on the floor, you quickly discover she wasn’t lying, as your spine arches away from the cold cement. Two thick warm thighs fall on either side of your waist, immediately heating you. Karen adjusts herself, her twat hovering inches above your [pc.cockShape] member, heat from her womanhood radiating downward. Slowly, the Bride lowers herself down.");
	output("\n\nYou can’t help but moan as your meat slides into Karen’s cunt, its wet warmth tingling against your sensitive cock flesh. You find her far more accommodating than you would have suspected, a telling sign that the Bride maybe shouldn’t have been wearing white. Despite her pussy’s obvious experience, it hugs your hardened mast snugly as you slide in further and further. Karen gasps for breath as she takes you in deeper, her flushed face turning near beet red. Quivering, she stops, holding in place and seemingly enjoying just holding you inside of her. It only lasts a fleeting moment before her starts to move her hips, riding your [pc.cockNounComplex].");
	pc.cockChange();
	output("\n\nIf her cunt wasn’t proof enough of her experience, the way she rides you hammers it home. Karen moves her body with uncanny dexterity, sliding along your rigid length, while simultaneously moving herself back and forth. She works your [pc.cockNounSimple] so well in fact you’re not sure how long you can keep it together. Gasping for breath, you try to hold yourself together, keeping yourself from popping. Your cock burns with lascivious pleasure, sweat building on your [pc.skinFurScales] and making you forget all about the cold floor. Your [pc.balls] ache, begging for sweet release. All you can manage is to bite your lip and focus, hoping to will yourself into continuing.");
	output("\n\nKaren moans so loud her voice starts to crack, the Bride’s breath ragged and broken. You start to feel her pace falter, offering you a mild break from her relentless riding. Her cunt seems to tighten around you, squeezing your cock in a vice like grip. The Bride chuckles, a playful and lustful giggle from the back of her throat. <i>“Oh, I could get used to you... OHH!”</i> The Bride lets out a deep moan as something else hits her. There is a sudden pressure from inside of her. You tilt your head up to see Monty over her shoulder. Based on the look on Karen’s face, and the even tighter grip from her cunt, you know Monty just shoved his cock deep into Karen’s tight bubbly ass.");

	//Plays Fuck Karen 2
	addButton(0, "Next", tessaBridefuckFuckFuctionNameThingAHPartTwo);
}

// Fuck Karen 2:
public function tessaBridefuckFuckFuctionNameThingAHPartTwo():void
{
	clearMenu();
	clearOutput();
	showTessaWedCouple(true);
	processTime(23);

	output("Over head, you notice the lights dim, drawing your attention upwards. Tessa is straddling you, obscuring your vision, with her legs on either side of your head with her ovir twat directly above you. Through the darkness, you can faintly tell she’s grinning toothfully down at you. You suddenly feel more than a little nervous. Before you can mount a protest however, Tessa drops, bringing her pussy right down on your face.");
	output("\n\nA powerful smell fills your nose as she drops onto you. Unsurprisingly, she outright sits on your face. She squats in a way so not all of her weight is on you, but you still feel half smothered. She’s wet already, but from experience know she’s nowhere near as soaked as she can get. Accepting your fate, you arch your neck and get to work. Down below, Karen’s riding has become untempered and broken, the cock in her ass seemingly slowing her pace. Above, you hear Karen’s moans cease, quickly replaced by muffled kissing noises. On your lips you feel Tessa start to ooze, the strong aroma of her cunt becoming far more potent. You lick away at her juices, savoring her addictive secretions as much as you can.");
	output("\n\nYou soon become lost in Tessa’s snatch, hardly noticing your hips begin moving on their own, your body seemingly acting on pure instinct. The Bride’s cunt is tighter now than before, you imagine that is in no small part due to Monty filling up her backdoor. You hear the Groom moaning, and based on how much Karen is jerking around on your lap you imagine he must be absolutely railing his wife. Not willing to be outdone, you give it your all, thrusting your [pc.cockNounSimple] up into the small woman as hard and fast as you can");
	if (pc.cLength() > 12) output(", soon brushing against her cervix as you bottom out in her over-filled snatch");
	output(". The weight of the two women on you starts to feel heavy, your body beginning to ache. Your cock throbs inside of Karen, edging closer and closer to climax. On your face you feel Tessa start to quiver, the white woman’s cunt now a veritable river of sticky sweetness. A loud groan that could only come from Monty fills the air.");
	output("\n\nYour [pc.balls] churn, and your bury yourself deep into Karen’s cunt as a surge of pure liquid bliss fires up your burning hot rod. A shudder of pleasure runs through your body as thick [pc.cumColor] spunk erupts from your [pc.cockHead]");
	if (pc.cLength() > 12) output(", straight through her battered cervix");
	output(", filling the newly minted bride up. Nearby you feel Monty tense and shake, the Groom seemingly firing off his own load deep into his wife. Karen pulls herself off of Tessa and convulses, the two orgasms inside her seemingly taking their toll pushes her over the edge. Her back arches, and she nearly topples off of you, falling back against her husband. You hear a familiar low and lusty moan above you, one that can only come from Tessa. She lifts herself off of your face, allowing you to take the first deep breath that didn’t come through your nose in many minutes. Tessa seems to disappear completely, light shining down into your eyes once more.");
	output("\n\nExhaustion hits you like a truck, and you feel the Bride and the Groom fall backwards onto the ground.");

	pc.orgasm();

	//Plays Outro
	addButton(0, "Next", tessaWeddingDebaucheryIsOver);
}

// Fuck Monty 1:
public function tessaIWouldMakeAnAlimonyJokeButThatsWrong():void
{
	clearMenu();
	clearOutput();
	showTessaWedCouple(true);
	processTime(12);

	output("After thinking a moment, you decide that you want a piece of the Groom.");
	output("\n\nPulling yourself to your feet");
	if (!pc.isNude() || tessaHandler.clothes) output(", you peel off your " + (tessaHandler.clothes ? tessaHandler.clothes : "[pc.gear]"));
	output(", Monty looking up at you quizzically. A sudden realization hitting him, more than a little colour drains from his face. Slowly, he reaches down and lowers his pants, pulling them off and exposing his lower body fully. Off to the side, you hear Tessa laugh, followed by Karen giggling. You get the feeling they’re going to enjoy the show. You drop back down to the ground, positioning yourself between the Groom’s legs, scooting in close so your [pc.cockHead] is aimed directly at his backdoor.");
	output("\n\nAs you touch the tip of your member against his hole, you’re caught off guard by Monty letting out a depraved moan. Pausing for a moment, you let your cockhead sit pressed against him, feeling the Groom’s backdoor eagerly quiver. He’s oddly into this already. With a small shrug, you move your hips forward, causing another moan from Monty as your [pc.cockNounSimple] breaches the pliable entrance and slides into his tight ass.");
	pc.cockChange();
	output("\n\nAs you press deeper into the man’s passage, you can’t help but groan, the tight pressure feeling intense against your cock flesh. He’s tight, but accommodating, and you are slightly surprised he’s taking you in as well as he is. Something tells you this isn’t the first time he’s taken it in the rear. You don’t dwell on the thought, instead just easing yourself in as deep as the Groom’s ass will allow. Lust takes over quickly, and you find your hips starting to move on their own while your mind becomes flooded with pleasure. The tight muscular grip on your [pc.cockNounSimple] doesn’t ease up as you start to thrust in and out of Monty’s ass, and instead it seems to increase. Another groan escapes your lips as you force your well squeezed cock into the depths of the moaning man’s hole.");
	output("\n\nYou try to fuck him faster, but can’t seem to pick up much speed. The pressure on your cock starts to make you squirm, the vice like grip almost feeling like it could rip your dick off. You feel yourself already drawing close to a finish, but will yourself to hold back as best you can. Below you, Monty’s cock twitches and throbs expectantly. He’s close as well. You slow down slightly, hoping to ease it back for both of you, at least until the ladies decide to join in. Settling into a slower pace, you find it hard to contain yourself, your [pc.cockNounSimple] aching for proper release.");
	output("\n\nIn a twist, you feel Monty start to move below you. The Groom starts to move his hips, attempting to force you deeper into him with each of your thrusts. He lets out a insatiably lustful moan again, the man far more cock hungry than you would have given him credit for. Before the motion becomes too much for you to tolerate, you hear footsteps behind you. Tessa and Karen, both quite naked, step into view on either side of Monty. Karen’s perky round tits are on full display, each capped with a rock hard dusky nipple, while Tessa’s much larger nippleless chest sits in stark contrast. Tessa gives Monty a little kick, stopping the man’s movement.");
	output("\n\n<i>“Slow down! Fuck. We haven’t even joined in yet and you’re both about to fucking blow your loads with that shit.”</i>");

	//Plays Fuck Monty 2
	addButton(0, "Next", tessaAtAnyRateButtfuckingGroomsIsFun);
}

// Fuck Monty 2:
public function tessaAtAnyRateButtfuckingGroomsIsFun():void
{
	clearMenu();
	clearOutput();
	showTessaWedCouple(true);
	processTime(23);
	
	output("Karen moves first, positioning herself overtop of her husbands cock, and lowering herself down. She lets out a sinful gasp as he enters; sliding down along his length until she’s seated on his waist. Her round ass brushes against your belly, close enough that you’ll bump up against her with every thrust you make into Monty’s clenched passage. She turns around and gives you a wink, wiggling her ass against you crotch seductively.");
	output("\n\nOver Karen’s shoulder you glimpse a flash of white, followed by Monty’s muffled cries. Tilting your head, you can properly see Tessa has outright sat down on Monty’s face, the poor man wiggling under the ovir’s womanly hips. The white woman smirks and releases a content sigh, then starts grinding herself on the Groom’s face. Tessa’s red eyes focus in on Karen, her smirk morphing into something far more depraved as her long tongue snakes from her mouth. A moment later she leans in, and suddenly the Bride is muffled like her husband, only by a different set of lips this time. Karen doesn’t seem to mind, roughly grabbing Tessa and dragging her in. Almost absent mindedly, you feel Karen move her hips, riding her husband and bumping against you with her soft and cushy behind.");
	output("\n\nDrawing a deep breath, you adjust your position and hammer Monty’s hole once more. The Groom’s ass is tighter now, pleasantly crushing your [pc.cockNounSimple] in just the right, depraved way to make the fire in your loins roar. Muffled moans from the others are soon drowned out by the wet sounds of sex, and you feel Karen in front of you start to shake. Your [pc.balls] start to ache, approaching the edge of their breaking point as your cock throbs inside Monty’s ass. Gasping for each breath, you throw your head back and let out a deep groan, the only one of the four of you able to release a proper cry of passion.");
	output("\n\nYour [pc.balls] churn, and your bury yourself deep into Monty’s passage, a wave of liquid bliss fires up and out of your burning hot rod. A shudder of pleasure runs through your body as thick ropes of [pc.cumColor] spunk erupts from your [pc.cockHead] filling the boiling depths of the Groom up. You feel Monty begin to tense and shake, the Groom seemingly firing off his own load deep into his newly minted wife. Karen pulls herself off of Tessa and convulses, the rush of hot spunk seemingly taking their toll on her and pushing her over the edge of pleasure. Her back arches and she nearly topples over onto you, falling against your heaving [pc.chest]. Looking down at her, you notice her eyes have rolled back, while her tongue hangs out like a bitch in heat. You hear a low and lusty moan and turn your gaze upward to face Tessa; the pale woman’s face is flushed, and she seems to be purring with pleasure. She lifts herself off Monty’s face, the Groom taking a deep gasping breath his face is released from its confines for the first time in many minutes. Tessa gives you a smirk, as she rolls clear off Monty.");
	output("\n\nExhaustion hits you like a truck and you fall backwards, your cock popping audibly out of Monty’s ass as you and the Bride tumble to the ground.");

	pc.orgasm();

	addButton(0, "Next", tessaWeddingDebaucheryIsOver);
}

// Outro:
public function tessaWeddingDebaucheryIsOver():void
{
	clearMenu();
	clearOutput();
	showTessaWedCouple(true);
	processTime(52);

	output("You lay on the ground, drenched in sweat and cum, much of it not even belonging to you. As you catch your breath the sound of heels clicking focusing your attention upwards. You turn your head and see Tessa moving towards you. She’s fully dressed already, but you notice her stuff her panties in her purse rather than slip them back on. The albino ovir looks down at you and frowns. <i>“Come on, let’s get out of here.”</i>");
	output("\n\nYou turn to look at Karen and Monty, both are fairly out of it, laying on the floor in a puddle of your combined juices. Pulling yourself to your feet, you ask the ovir if she’s okay just leaving them here.");
	output("\n\nTessa shrugs. <i>“They’re fine.”</i> She raises her voice. <i>“Right guys?”</i> Karen makes a soft noise and Monty lifts his arm up in a weak thumbs up. <i>“See? Fine. Come on, get your shit and let’s get out of here.”</i>");
	output("\n\nYou gather up your " + (tessaHandler.clothes ? tessaHandler.clothes : "[pc.gear]") + " and follow Tessa back to her ship. The two of you make it up the ramp and Tessa beelines directly for the cockpit, disappearing from sight. The ship lifts off not long after. Apparently you two are really leaving. A few minutes later Tessa returns to the main room. <i>“We’re on course for Tarkus. Should only be a few minutes. Well, that went pretty fucking well I think.”</i> Tessa crosses her arms over her chest, her lips curving into a smirk. <i>“Honestly? You did better than I expected. A few stumbles here and there, sure. But damn, you were pretty smooth.”</i>");
	output("\n\nYou smile at the snowy woman. It’s not too often Tessa gives you praise. <i>“Well, that sort of thing comes easy to me.”</i>");
	output("\n\nThe white ovir stretches and cracks her back. <i>“Well, I’d offer to let you stay and we could have some fun, but I desperately need to shower. Probably pass the fuck out after as well. You should do the same. You smell like a pornstar after a long day of shooting.”</i>");
	output("\n\nYou give yourself a quick sniff, the smell of sweat and cum practically radiating from your person. You collect your things and get ready to depart. Not long after you’re ready, you reach Tarkus, Tessa setting the ship down in her normal spot. You bid farewell to the ovir and disembark.");

	//PC is left in the Tarkus Hangar
	//PC is given the Cumsoaked Debuff
	pc.applyCumSoaked();
	addButton(0, "Next", tessaWeddingEnd, 8);
}

public function tessaWeddingEnd(ending:int):void
{
	flags["TESSA_WED_ENDING"] = ending;
	flags["TESSA_WED_TIMESTAMP"] = GetGameTimestamp();
	if (ending < 5) flags["TESSA_WED_REVIEW"] = 0;
	else flags["TESSA_WED_REVIEW"] = 1;
	move(shipLocation);
}