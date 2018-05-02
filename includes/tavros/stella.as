//Stella, by Wsan. Original character owned/created by TigerBlack :3
//In order to see this you have to not be a taur and if you have a cock, have balls.

public function stellaCapacity():Number
{
	return 550;
}
public function showStella(nude:Boolean = false):void
{
	showName("\nSTELLA");
	showBust("STELLA" + (nude ? "_NUDE" : ""));
}

public function showAlex(nude:Boolean = false):void
{
	showName("\n" + flags["MET_ALEX_SURF"] != undefined ? "ALEX" : "STORE GIRL");
	showBust("STORE_ALEX" + (nude ? "_NUDE" : ""));
}

//Setup
public function beachNSurfOutsideBonus():void
{
	if(flags["SEEN_BEACHNSURF"] == undefined) output("\n\nLooking across the floor, you spot some kind of complex you’ve never seen before. Upon closer inspection of the flashing neon sign and display holograms, you deem it to be some kind of simulated beachworld, complete with tanning services and an attached nightclub. Looks like it might be cool.");
	else output("\n\nLooking across the floor, you see the Tavros Beach ‘n Surf, a simulated beachworld. Having visited it, you know for a fact it’s as good as it claims to be. Stella’s probably hanging out there too, if you want to see her.");
}

//[Check it out]
public function approachBeachSurfNSurf():Boolean
{
	clearOutput();
	author("Wsan");
	if(flags["SEEN_BEACHNSURF"] == undefined)
	{
		output("Stepping inside, you can immediately see some serious work was put into the decoration of this place. It really does look like you’ve entered a beach resort, right down to the friendly human girl at the counter dressed in a tantalizing sling bikini. You give her a wave and lean down on the counter.");
		output("\n\n<i>“Hey there!”</i> she chirps happily, handing you a brochure filled with information. <i>“Welcome to the Tavros Beach ‘n Surf. It’s 45 credits to check out all the facilities for a day, or 1500 for lifetime membership. We’ve got a surf beach, spa pools, tanning beds, and plenty of sexy beachgoers if that’s your thing. There are rooms by the beach and the nightclub next door is alive at all hours of the day, too!”</i>");
		flags["SEEN_BEACHNSURF"] = 1;
		processTime(6);
	}
	else
	{
		output("Stepping inside, you find yourself still admiring the decoration. It’s clear serious effort went into making this place look like a beach resort. You step up to the girl at the counter, whose name you now know to be Alex, based on your chatting with other visitors.");
		
		flags["MET_ALEX_SURF"] = 1;
		
		output("\n\n<i>“Hi [pc.name], here to check out the facilities?”</i> Alex asks, smiling. <i>“");
		if(pc.hasKeyItem("Beach ‘n Surf Lifetime Pass")) output("Since you’ve got a lifetime membership, you can just walk on in");
		else if(pc.hasStatusEffect("SURFPASS")) output("Your time’s still ticking from the last payment, so you can just walk on in");
		else output("It’s still 45 credits for another round, or 1500 for the lifetime");
		output(".”</i>");
	}
	if(pc.hasKeyItem("Beach ‘n Surf Lifetime Pass")) addDisabledButton(0,"Buy Pass","Buy Pass", "You already own a lifetime pass!");
	else if(pc.hasStatusEffect("SURFPASS")) addDisabledButton(0,"Buy Pass","Buy Pass", "Your current pass has not yet expired!");
	else addButton(0,"Buy Pass",buyAPass);
	if(flags["MET_ALEX_SURF"] != undefined) addButton(1,"You",tryToSeduceAlexSlooot);
	addButton(2,"Swimwear",buySwimwear);
	if(pc.hasKeyItem("Beach ‘n Surf Lifetime Pass") || pc.hasStatusEffect("SURFPASS")) addButton(11,"To The Beach!",stepIntoChangingArea);
	else addDisabledButton(11,"To The Beach!","To The Beach","You’ll need a pass to do this.");
	
	return false;
}

public function tryToSeduceAlexSlooot():void
{
	clearOutput();
	showAlex();
	author("Wsan");
	output("<i>“How about you");
	if(flags["MET_ALEX_SURF"] != undefined) output(", Alex");
	output("?”</i> you ask, turning up the charm with a smile. <i>“Up for some fun in the sand?”</i>");

	if(flags["MET_STELLA"] != undefined) output("\n\n<i>“Aaah, psshh, you don’t wanna hang out with me,”</i> she jokes, smiling. <i>“I heard you were up there with Stella. You two having a good time, huh? Seriously though,”</i> she continues, shrugging, <i>“I’m still at work, and still can’t bang. That’s life, huh?”</i>");
	else 
	{
		output("\n\n<i>“Sorry babe,”</i> she says, shaking her head with a wry smile. <i>“I’m flattered, but I’m at work and there’s no way I’m getting fired because I wanted to wrap my thighs around some [pc.guyGirl]’s head. Trust me though, there’s plenty of hotter girls - and guys - on the beach. We tend to be frequented by, ah... higher-class clientele, with all that entails.”</i>");
		output("\n\nSo, people like you, then.");
	}
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Buy]
public function buyAPass():void
{
	clearOutput();
	showAlex();
	author("Wsan");
	output("<i>“Sure, I’ll take " + (flags["MET_ALEX_SURF"] != undefined ? "another" : "a" ) + " look,”</i> you nod.");
	output("\n\n<i>“Will that be just for the day or a lifetime pass?”</i> " + (flags["MET_ALEX_SURF"] != undefined ? "Alex" : "the girl" ) + " asks, looking at you expectantly.\n\nYou recall that a day pass costs 45 credits and a lifetime pass will set you back a cool 1,500.");

	processTime(2);
	clearMenu();
	if(pc.credits >= 45) addButton(0,"Day",buyADayPass);
	else addDisabledButton(0,"Day","Day","You can’t afford it.");
	if(pc.credits >= 1500) addButton(1,"Lifetime",lifeTimePassBuy);
	else addDisabledButton(1,"Lifetime","Lifetime","You don’t have the credits for that.");
	addButton(14,"Back",mainGameMenu);
}

public function buySwimwear():void
{
	shopkeep = chars["ALEX_SURF"];
	chars["ALEX_SURF"].keeperBuy = "<i>“Looking to get yourself some new swimwear? We have a few nice pieces if you’d like.”</i>\n";
	//List prices and whatnot. Back should go back to ALEX_SURF's main menu.
	//Sell Menu
	chars["ALEX_SURF"].keeperGreeting = "RUH ROH! SOMETHING WENT WRONG.";
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	buyItem();
}


//[Day]
public function buyADayPass():void
{
	clearOutput();
	showAlex();
	author("Wsan");
	output("<i>“Just the day, thanks.”</i>");
	//-45 credits
	pc.credits -= 45;
	pc.createStatusEffect("SURFPASS",0,0,0,0);
	pc.setStatusMinutes("SURFPASS",24*60);
	output("\n\n<i>“Right!”</i> she says, pointing at a small machine on the desk. <i>“Just stick your wrist out there.”</i>");
	buyAPassEpilogue();
}

//[Lifetime]
public function lifeTimePassBuy():void
{
	clearOutput();
	showAlex();
	author("Wsan");
	output("<i>“I’ll take a lifetime pass,”</i> you say, shrugging.");
	pc.credits -= 1500;
	output("\n\n<i>“Great! I promise you won’t regret it,”</i> she says, indicating a small machine on the desk. <i>“Stick your wrist out there.”</i>");
	pc.createKeyItem("Beach ‘n Surf Lifetime Pass");
	buyAPassEpilogue();
}

//Combine here
public function buyAPassEpilogue():void
{
	output("\n\nDoing so, the machine sprays a tiny marker across it in the design of the logo.");
	output("\n\n<i>“Nanobots,”</i> " + (flags["MET_ALEX_SURF"] != undefined ? "Alex" : "the girl" ) + " explains. <i>“They’ll fall off automatically after twenty four hours");
	if(pc.hasKeyItem("Beach ‘n Surf Lifetime Pass")) output(" but you stay in the system with a lifetime pass");
	output(". ");
	if(!pc.hasKeyItem("Beach ‘n Surf Lifetime Pass")) output("Until then, you’ve got free reign of the facility! ");
	output("Head on in, you’ll probably want to get changed in the rooms on the right. Enjoy!”</i>");

	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*[Leave]
//FEN NOTE: Cut this.
public function leaveAlex():void
{
	clearOutput();
	showAlex();
	output("<i>“Maybe some other time,”</i> you say, leaning back off the counter. <i>“See you around.”</i>");
	output("\n\n<i>“Sure,”</i> " + (flags["MET_ALEX_SURF"] != undefined ? "Alex" : "the girl" ) + " says, flashing you a smile.");
}*/

public function stepIntoChangingArea():void
{
	clearOutput();
	showName("CHANGING\nROOM");
	author("Wsan");
	output("Stepping through the double doors, you’re met with the sight of a long hallway with another set of identical double doors at the end.");

	if(!pc.inSwimwear(true))
	{
		output(" Heading into the rooms on the right, you ");
		if(!pc.isNude()) output("strip out of everything and ");
		output("take a look at the options on offer.");

		if(pc.isShemale()) 
		{
			output("\n\nYou end up going with the nice ");
			if(pc.isBimbo()) output("pink");
			else output("blue");
			output(" swim bikini with tactfully frilly bottoms. As nice as going with just the regular bottoms would be, the extra you’ve got down there might cause issues. Now you’re set for the beach!");
		}
		else if(pc.mf("","f") == "f") 
		{
			output("\n\nYou end up going with a nice ");
			if(pc.isBimbo()) output("pink");
			else output("blue");
			output(" swim bikini set that’s in your size. You look fantastic, and now you’re set for the beach!");
		}
		else if(pc.biggestTitSize() < 1) output("\n\nKeeping it simple is best. You grab a pair of boardshorts in your size and head off for the beach, shirtless.");
		else output("\n\nGrabbing a pair of boardshorts in your size and a handy wrapping for your [pc.breasts], you inspect yourself in the mirror. You’re beach-ready!");
	}
	else
	{
		output(" You consider heading into the rooms on the right, but you’ve brought your own beach-wear. There’s no need to change when you’re always ready for a dip!");
	}
	output("\n\nAs you approach the doors, you can see sand has slipped under it to coat the corridor in a light dusting of golden-brown. Pushing them open, you’re immediately blinded by the intensity of the light and raise your arm to get better used to it, stepping through the doorway as you do.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",meetingStella);
}

//Meeting Stella
public function meetingStella():void
{
	clearOutput();
	showStella();
	author("Wsan");
	if(flags["MET_STELLA"] == undefined) 
	{
		//Wsan says you pick up her name from hanging out at the beach.
		flags["MET_ALEX_SURF"] = 1;
		output("Your mouth drops open momentarily. It’s like you’ve really set your foot on another world entirely, transported in an instant across the universe to a serene beach. A clear blue sky with wisps of white clouds floating through it stretches endlessly before you, and as you descend the stairs onto the beach proper you find your [pc.feet] met with the soft, warm crunch of golden sand shifting beneath you. Seagulls cry out in the distance, the sounds of waves crashing and people playing on the shore ring in your ears. For just a moment... it’s like you’re back on Earth.");
		output("\n\nForgetting why you even really came in here in the first place, you just walk along the beach for a little while until a group of guys and girls your age calls you over to play some volleyball. By the time you’re finished, you’ve got a new group of friends and a bunch of sand inside your clothes, but at least you made a couple of game-winning saves. Figuring you’ll get some rest and tanning in, you wander around before you find a spot that’s relatively secluded, up on a deck and away from the crowds. You’re just sitting down when...");
		output("\n\n<i>“Oooh, hey hot stuff!”</i> a sultry female voice calls out from nearby. <i>“I saw you down there before!”</i>");
		output("\n\nLooking up, your jaw almost drops again before you catch yourself. Standing above you is an absolute bombshell of an ausar girl, a true beach babe that you’ve probably seen on a magazine cover somewhere. Clad in a leopard print bikini that leave just a hint of pink areolae peeking out, her luscious curves and silken smooth fur draw your eyes to all the right places. Her voluptuous breasts threaten to fall out of her bikini at any moment,");
		output("\n\n<i>“Hi cutie!”</i> she exclaims, bending over and exposing a truly outrageous amount of cleavage with a friendly smile. <i>“Did you, like, come up here to play with me?”</i>");
		output("\n\nThis must be what that girl at the counter was talking about when she mentioned higher class clientele. The way this girl talks, moves, acts, everything about her tells you she’s from a family that’s, well, like yours... though it seems like she has different priorities.");
		output("\n\n<i>“Sorry, where are my manners? I’m [pc.name],”</i> you say, stealing her hand and kissing her fingers. <i>“At your service.”</i>");
		output("\n\n<i>“Ooh, fancy,”</i> she murmurs in surprise, crystal blue eyes twinkling. <i>“I’m Stella! Stella D’Amore, and you’re totally sitting in like, </i>my<i> chair.”</i>");
		output("\n\n<i>“Oh, this is your-?”</i> you say, beginning to get out of it before she pushes you back down and then, to your utmost surprise, sits right in your lap facing you.");
		output("\n\n<i>“So, " + pc.mf("big boy","hottie") + ",”</i> she whispers, wrapping her arms around your neck. <i>“Got some time to play with your little doggie?”</i>");
		output("\n\nStella’s clearly used to getting what she wants, but are you gonna give it to her?");
		processTime(35);
		pc.lust(5);
	}
	else
	{
		output("<i>“Yoohoo! Over here, baby!”</i> A familiar voice calls out the moment you step foot inside, drawing your attention upwards. Craning your neck and covering your eyes with a hand, you see Stella up on her balcony waving fervently at you. As you watch, her vigorous shaking sets her enormous breasts free of her bikini, which springs back and whaps her softly in the face. She promptly removes it and keeps waving, tits out and jiggling up and down. <i>“Come play!”</i>");
		processTime(3);
	}
	clearMenu();
	if(pc.hasCock() || pc.hasVagina()) addButton(0,"Yes",letsFuckeySuckeyStella);
	else addDisabledButton(0,"Yes","Yes", "You need genitals for this!");
	addButton(1,"No",fuckOffBeachSlutbag);
}

//[No]
public function fuckOffBeachSlutbag():void
{
	clearOutput();
	showStella();
	author("Wsan");
	if(flags["STELLA_ABORTED"] == undefined) 
	{
		output("<i>“Actually, I’m really just here for the beach,”</i> you confess, diplomatically putting her in the chair and sliding out from under her. <i>“I’ll see you around, okay Stella?”</i>");
		output("\n\n<i>“Awwww, but I wanted to plaaay,”</i> she whines, her fluffy tail drooping very sadly. She’s nothing if not emotive. <i>“Fine! Maybe we can play some other time.”</i>");
		output("\n\nHaving narrowly avoided being used to satiate a particularly voracious ausar’s sexual appetite, you decide you’ll just stick to simpler things like volleyball and tanning. You spend the next couple of hours just relaxing in the sun, though you can’t help but feel someone’s watching you from a distance. After you’re done, you ");
		//clothed: swap
		if(!pc.inSwimwear(true)) output("swap your swimsuit for your regular gear and ");
		output("head out, bidding the countergirl goodbye. Looks like you spent a fair amount of time in there based on what you’re seeing when you reemerge into Tavros proper. Time flies when you’re having fun, huh?");
	}
	else
	{
		output("<i>“Sorry Stella, not today,”</i> you tell her, waving her off.");
		output("\n\n<i>“Aaaawwwwwww...”</i> she whines, tail drooping pathetically as she slumps. <i>“Okay...”</i>");
		output("\n\nDefeated, she turns and heads back into her suite. You feel a little like you’ve just kicked a puppy, but sometimes you just wanna relax. You head over to join the usual ever-present crew of guys and girls playing volleyball on the beach, keen to get in on the game.");
		output("\n\n<i>“Damn, I’ve never seen </i>anyone<i> turn Stella down before,”</i> one of them mentions to you offhandedly in between rounds. <i>“You must have nerves of steel.”</i>");
		output("\n\n<i>“It’s in the name, after all,”</i> you mutter, taking a swig of orange juice. <i>“Up to play again?”</i>");
		output("\n\nBy the time you’re done, everyone’s sweaty, tired, and covered in sand. Nobody was keeping score, but you’re pretty sure you won anyway. You bid everyone goodbye and head back to changing rooms, ");
		if(!pc.inSwimwear(true)) output("swapping your swimsuit for your regular gear and ");
		output("leaving, bidding Alex goodbye. Looks like you spent a fair amount of time in there based on what you’re seeing when you reemerge into Tavros proper. Time flies when you’re having fun, huh?");
	}
	processTime(60*2);
	IncrementFlag("STELLA_ABORTED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Yes]
public function letsFuckeySuckeyStella():void
{
	clearOutput();
	showStella(true);
	author("Wsan");
	if(flags["MET_STELLA"] == undefined)
	{
		flags["MET_STELLA"] = 1;
		output("<i>“Yeah?”</i> you ask, reaching up to scratch behind her ears, which immediately sets them happily twitching. <i>“You gonna be a good dog for me?”</i>");
		output("\n\n<i>“Oooohhoohh god,”</i> she moans lustfully, her furry tail swishing from side to side as she starts grinding against you hard. <i>“Yeahyeahyeah, I’m your good dog! Stella’s your beach puppy...”</i>");
		output("\n\n<i>“Damn, girl,”</i> you say, not having expected such a strong reaction. <i>“Stella, how about you put that doggy tongue of yours to work?”</i>");
		output("\n\nDucking down, she practically tears your bottoms off with her teeth to get at what’s inside, ");
		if(!pc.hasCock()) 
		{
			output("immediately lapping at your [pc.pussy] and applying those beautiful pouty lips to your [pc.clits].");
			output("\n\n<i>“Oh, shit,”</i> you groan, holding her head in your hands while she goes to town on you. <i>“Fuuuck...”</i>");
			output("\n\nGrinding yourself against the willing ausar’s nose, you cum so quickly under her ministrations you’re left gasping in her chair, bucking your hips even as she tries to hold you steady to keep tonguefucking your cunt.");
			output("\n\n<i>“Rrrrnnngh!”</i> you grunt, gritting your teeth in agonizing pleasure, all pretense of class forgotten as you hold Stella against your pussy and violently grind your lips against hers. <i>“Fuckfuckfuckfuuuck good dog, good dog,”</i> you pant breathlessly, femcum sluicing all over Stella’s face and down her chin while she greedily laps at you. <i>“Ohmyfuckinnnggg-!”</i>");
			output("\n\nWith a deep, guttural groan you stand up out of your chair and press down on Stella, tilting her face upwards into your pussy as you squirt all over her beautiful features. You tense so hard that when you finally relax, all you can do is collapse back into the chair while Stella sits in front of you, dazed but happy.");
			output("\n\n<i>“Holy </i>shit<i>,”</i> you moan, reaching out to tickle one of her ears. <i>“You </i>are<i> a good bitch.”</i>");
		}
		else
		{
			output("but suddenly recoils and gasps in utter delight when she sees what you’re packing.");
			output("\n\n<i>“Oh </i>wow<i>,”</i> she breathes, then she’s instantly sucking your balls, ");
			if(pc.ballDiameter() > 6) output("desperately trying to take them inside her mouth to no avail, planting horny kisses all over their smooth surface");
			else output("taking them inside her warm, wet mouth and suckling while her eyes roll back in pleasure");
			output(".");
			output("\n\n<i>“Unf, fuck,”</i> you grunt, holding her down there. She’s all <i>over</i> you, pawing at your [pc.stomach] as she tries to get a better grip to suck your balls. Midway through the process she begins moaning loudly and you realize she’s cumming through her bikini bottoms even as she licks you. You’re treated to the first-class sight of an upper socialite submissively bucking her hips, panting and moaning with her hands around your waist and her lips around your balls, femcum drooling from her empty pussy.");
			output("\n\n<i>“What a needy puppy,”</i> you murmur, scratching her behind the ear just to reinforce that she’s doing a good job. <i>“Keep it up and maybe you’ll get a bone between your legs.”</i>");
			output("\n\n<i>“I whanna bhone,”</i> she mumbles from between your legs, still intent on sucking your balls for all she’s worth. <i>“Whanna bhoooone...”</i>");
			output("\n\n<i>“Here,”</i> you say, pointing to the tip of your [pc.cock]. <i>“Suck this for a while instead, then you can get your bonefffuck!”</i>");
			output("\n\nNo sooner than have you indicated it, Stella’s on the job. Fuck, she’s good at following orders... you’ll have to give her a special reward when she’s done, which is going to be pretty fucking soon what with the way she’s using that amazing tongue of hers. You let her have free reign over the movement of her head and she takes full advantage, alternating between bobbing on your [pc.cockHead] and swallowing it to the hilt until finally, you can’t take it any more. You <i>have</i> to blow this load down her throat.");
			output("\n\n<i>“To the hilt, Stella,”</i> you pant, pulling her down your cock mere moments before you cum. <i>“Swallow it!”</i>");
			output("\n\nA second later you groan in ecstatic release, Stella’s throat tightening around the head of your shaft as she frantically gulps down your jizz, pouty lips securely planted around the base of your penis. You can feel her fingers lightly pressing at your balls, urging, <i>begging</i> you to give her more of your cum, and you’re only too happy to oblige. She makes several loud, gulping swallows as she slowly slides back up your dick.");
			output("\n\n<i>“Haaa, fuck,”</i> you sigh, leaning back in your chair as Stella pulls back off your cock and daintily swallows the cum left in her mouth. <i>“Nice work.”</i>");
			output("\n\n<i>“Did I do good, master [pc.name]?”</i> Stella asks, dazed and a little confused. She seems uncertain.");
			output("\n\n<i>“Fuck yeah, you did great!”</i> you reassure her, giving her a hard scritch behind the ears. <i>“I think we should take this somewhere else, though... you’re kinda loud.”</i>");
		}
		output("\n\n<i>“Uh huh,”</i> she giggles, still eye-level with your groin and plainly staring. <i>“Ummm... we can go like, inside my suite. It’s got a bed and everything.”</i>");
		output("\n\n<i>“Great,”</i> you say, grunting as you bend down. You scoop the incredibly busty beach bimbo right off the floor and put her over your shoulder, Stella giggling dizzily the whole time. <i>“Where’d you say it was?”</i>");
		output("\n\n<i>“Right behind you, silly,”</i> she says, trying to point with a leg. All the motion really does is remind you how wet she is between those plump thighs and how much you just wanna bury yourself in her muff, but at the very least you can see it now. Looks like the place you’d chosen to relax was actually the balcony of Stella’s suite - go figure.");
		output("\n\nOnce inside you put the bouncy ausar down on her bed, her body jiggling in all the right places. First things first: you’re going to have to take that bikini off her before you go mad at being tantalized without the payoff. It comes off without any effort at all, the fabric seemingly relieved to no longer be taxed to such obscene limits. Lying on her back, the ausar girl puts her arms above her head and smiles warmly as you unabashedly check out her amazing body.");
		output("\n\nHer breasts are perfectly shaped despite their massive size; each one is easily bigger than her head, matching the bimbo aesthetique of her inflated lips and pretty face. This girl is <i>built</i> for sex, and not the gentle kind. She’s a seductive temptress, and she knows it. Your eyes raking hungrily over her body, you suddenly notice she has inverted nipples capping those amazing tits, and decide to get them showing for yourself.");
		output("\n\n<i>“Aaaahh,”</i> she sighs in pleasure, back arching towards you slightly as your hands rub and squeeze at her nipples. <i>“Play with my boobs, master...”</i>");
		output("\n\nYou’re only too happy to oblige. Watching her squirm on the bed, crossing her legs and rubbing her curvy thighs together as you tease her nipples out, is more than enough to get you ready for the main event. When you finally let her go, beautiful pink puffy nips stand out like studs on her voluptuous chest, Stella herself panting and moaning lightly after the fun. Whether by happenstance or conscious action on her part, Stella’s tanned legs are spread and you can see fresh dampness showing on her bottoms.");
		output("\n\nYou give them a deft tug and they come free immediately, the string untying so fast you can’t help but wonder if that’s why she wears them. Her sex exposed and glistening, you can immediately see it’s as model-perfect as the rest of her. Placing one hand on her thigh and another on her mons pubis, you lean in and let your [pc.tongue] snake from between your [pc.lips] as you plant a kiss right on her pretty little clit.");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) 
		{
			output("\n\nTaking advantage of your alien physiology, you immediately slide your tongue right up Stella’s wet, warm pussy and take a long, rough lick of her soft, sensitive walls.");
			output("\n\n<i>“Oh, my gosh!”</i> Stella squeals, squeezing your head with shaky thighs. <i>“Oh, oh! I’m cumming! Nnnmmh!”</i>");
			output("\n\nTrue to her word, her pussy grips your tongue like a vice and shudders hard in pleasure, her voice coming out in soft, breathy exhalations as she grips her sheets white-knuckled. You can taste her pleasure, the sweetness of her cum running down your tongue and dripping from your lips.");
			output("\n\n<i>“Ooohhh, wow,”</i> Stella pants, looking down at you with a new admiration. <i>“I’ve never been with anyone who could do </i>that<i> before...”</i>");
		}
		else
		{
			output("\n\n<i>“Nnnn,”</i> Stella moans happily, gently grinding against your face while she runs a hand through your hair. <i>“Reward me for being a good girl...”</i>");
			output("\n\n<i>“I’m the one who decides that,”</i> you remind her, lifting your lips off her clit and kissing her stomach. Instead, you slide two fingers into her dripping pussy and begin stroking upwards, almost like you’re beckoning her towards you while you gently rub her clit with your thumb.");
			output("\n\n<i>“Ooh,”</i> she gasps, suddenly growing a lot more involved in the process. <i>“Oh, gosh! I-I think! Nnnn I think I’m cumming!”</i>");
			output("\n\nWith a restrained jerk of her hips, Stella cums hard on your fingers, femcum squirting down your hand while she moans. She’s nice and easy to please, and the way she shudders instinctively and squeezes down on your fingers, seems like she’d be an amazing fuck. You can’t wait to find out.");
			output("\n\n<i>“Wooowww,”</i> she sighs at length, looking down at you. <i>“You’re like, really... really good at that.”</i>");
		}
		processTime(20);
		pc.orgasm();
	}
	else
	{
		output("<i>“So I’m gonna take a pass on the volleyball,”</i> you call out to the usual crew of guys and girls on the beach.");
		output("\n\n<i>“Hey, it’s all good,”</i> one of them says, shrugging and laughing. <i>“The way Stella’s been pining, I think she’s been waiting for you to show up again to play. Have some fun up there, play[pc.boyGirl].”</i>");
		output("\n\nClimbing the stairs up to Stella’s suite, you find yourself really looking forward to seeing Stella again. It’s a lot of fun to be around such a naturally happy beach girl like her, and it doesn’t hurt that she has an absolutely banging body. Any deeper thoughts than that are immediately interrupted by your reception at the top of the stairs, as Stella immediately throws herself against you with a squeal of joy.");
		output("\n\n<i>“OhmygoshhiImissedyou!”</i> she exclaims, eyes wide and sparkling. You notice she’s still very much topless, either having forgotten she needs to wear something or having consciously chosen to forgo it. You give it 50/50 odds either way.");
		output("\n\n<i>“Hey, Stella,”</i> you say, smiling at her. <i>“How’s my girl?”</i>");
		output("\n\nListening to her tell you about her idyllic day, you half-walk and half-carry the bubbly bimbo into her room, away from prying eyes. It’s actually kind of comforting having this beautiful girl tell you about the little things, living her regular, if admittedly more than a little charmed, life here in a resort on Tavros. You appreciate the normalcy of it all. By the time you put her down on the bed, she remembers what you’re here for and lights up like a firework.");
		processTime(10);
		pc.lust(10);
	}
	output("\n\nIt’s up to you what you want to do with her.");
	//[Appearance] [Talk] [Pussy] [Assfuck] [Oral]
	stellaMenu();
}

public function stellaMenu():void
{
	addButton(0,"Appearance",stellaAppearance);
	if(pc.hasStatusEffect("StellaSickOfTalk")) addDisabledButton(1,"Talk","Talk","Stella’s way past the point of talking.");
	else addButton(1,"Talk",stellaTalk);
	if(pc.cockThatFits(stellaCapacity()) >= 0) 
	{
		addButton(5,"Pussy",stellaPussyFuck);
		addButton(6,"Assfuck",assFuckStella);
	}
	else
	{
		addDisabledButton(5,"Pussy","Pussy","You’re too big to fit into the puppy-bimbo!");
		addDisabledButton(6,"Assfuck","Assfuck","You’re too big to fit into the puppy-bimbo!");
	}
	if(pc.hasCock()) addButton(7,"Blowjob",stellaOralStuff);
	else addDisabledButton(7,"Blowjob","Blowjob","She can’t suck your dick if you don’t have one!");
	if(pc.hasVagina()) addButton(8,"Get Licked",stellaOralStuff,true);
	else addDisabledButton(8,"Get Licked","Get Licked","She can’t munch your rug if you’ve got hardwood flooring.");
}

//[Appearance]
public function stellaAppearance():void
{
	clearOutput();
	showStella();
	author("Wsan");
	output("Stella is a full-fledged ausar beach babe, with aqua eyes and platinum blonde hair that sports rose gold highlights and is adorned with a beautiful pink flower. Her perky ears and long tail are both nice and fluffy, the brown silken-smooth fur just begging to have your hands run through it. Her skin is not only picture-perfect without a blemish to be seen, but browned enough that you can tell at a glance this is a girl who belongs outdoors on the beach. Usually clad in a leopard-print bikini, she sits on her bed right now smiling at you with no hint of a top in sight. Her sunglasses lie on the bedside drawers");
	output("\n\nAt 5\' 8\" and 140 lbs, Stella’s voluptuous body leaves no doubts at all as to where all her weight is. She’s bubbly <i>everywhere</i>, from personality to tits and ass. The latter is both huge and has a very appealing jiggle to it whenever you squeeze or spank, and the former are truly massive. Each breast is bigger than her head and capped by pink, puffy inverted nipples that pop out when you tease her enough, giving you a nice visual indicator of how turned on she is. Her overall look is that of a bimbo sex object, the kind that looks like she just stepped off a modelling magazine for an upscale agency. Her cute, pouty lips only add to the aesthetic, distracting you with thoughts about what she can - and will - do with them.");
	if(flags["STELLA_FUCKED"] != undefined || flags["STELLA_BUTTFUCKED"] != undefined) output("\n\nBelow her puppy-bearing hips and trim waist lies her perfect, well-maintained pussy. You know from experience that being inside her is fucking amazing, from the way she cums almost constantly to the feeling of her desperately squeezing down on you for cum. Between her huge, bubble-butt asscheeks lies her asshole, tight as can be while somehow able to handle a cock of any size.");
	output("\n\nOverall, Stella looks like a top of the line sex doll came to life and started talking about colorful alcoholic drinks.");

	clearMenu();
	addButton(0,"Next",stellaPostAppearance);
}

public function stellaPostAppearance():void
{
	clearOutput();
	//showStella();
	author("Wsan");
	output("Now that you’re done checking out the babe, what would you like to do?");
	stellaMenu();
}

public function stellaTalk():void
{
	clearOutput();
	//showStella();
	author("Wsan");
	output("<i>“Hold on a second,”</i> you say, displaying incredible restraint ");
	if(pc.hasCock()) output("between your [pc.cockBiggest] being painfully erect and");
	else output("with");
	output(" a wet, willing beach puppygirl in front of you. <i>“Let’s talk for a bit.”</i>");

	output("\n\n<i>“Aww! Are you gonna tease me </i>now<i>, when I’m all wet and on my bed?!”</i> Stella pouts, puffing her cheeks out before giving in. <i>“Whatevs,”</i> she sighs, flipping her hair. <i>“Talk about what?”</i>");
	output("\n\n<i>“Why’d you pick me out, and what’s up with the place? Do you live here or something?”</i> you ask, noting that as you speak, Stella’s eyes never once shift from your ");
	if(pc.hasCock())
	{
		output("cock");
		if(pc.balls > 0) output(" except to look at your [pc.balls]");
	}
	else output("[pc.vaginas]");
	output(".");

	output("\n\n<i>“Uhhh... I just saw you from up here and thought you looked nice. Then you came up here and wanted to bang, yay!”</i> she recalls, the details of your meeting obviously a little fuzzy. <i>“But now you wanna talk instead of bang. Oh, and yeah. I live here! My parents own the place.”</i>");

	output("\n\n<i>“Cool,”</i> you say, before double-taking. <i>“Wai- your </i>parents<i> own this place?”</i> you ask, incredulous. You know first-hand that having real estate on Tavros is... not cheap.");

	output("\n\n<i>“Uh huh! They’ve got a whole bunch of resorts,”</i> Stella says, stretching on the bed and spreading her legs unconsciously. It’s a hell of a view. <i>“I’m tired of moving around so I decided to stay here.”</i>");

	if(pc.isShemale() && !pc.inSwimwear(true)) 
	{
		output("\n\n<i>“Oh, and,”</i> she adds, grinning devilishly, <i>“I kinda picked you out ‘cause of those,”</i> she says, pointing at the frilly bottoms you wore in here. <i>“Only the girls with big, fat cocks pick that to wear.”</i>");
		output("\n\nStella’s pretty clever sometimes...");
	}
	output("\n\nWell, that’s enough talk and frankly it’s probably all you’re going to get out of the antsy ausar anyway, if the way she’s eyeing you is any indication. Still, though, you know now that Stella is actually a genuine article of upper-classness, as if her mods and cute manner of speech weren’t indication enough.");
	//gray out talk
	processTime(20);
	pc.createStatusEffect("StellaSickOfTalk");
	pc.setStatusMinutes("StellaSickOfTalk",100);
	stellaMenu();
}

//[Pussy]
//Requires dik
public function stellaPussyFuck():void
{
	clearOutput();
	showStella(true);
	author("Wsan");
	var x:int = pc.cockThatFits(stellaCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("<i>“Ohmigod ohmigod yes,”</i> Stella mumbles breathlessly, staring wide-eyed at your erect cock as you approach her. <i>“Do me do me do me duUuuhhhh! Yeeeesssss!”</i>");
	output("\n\nThe moment you penetrate her she cries out in ecstasy, her pussy instantly clamping down on your [pc.cockHead " + x + "]. She was so excited to have you inside her she came the instant you put it in, and now she’s panting and gasping in your hands before you’ve even done anything.");
	pc.cockChange();
	output("\n\n<i>“Oohhhhh god,”</i> she moans quietly, staring right into your eyes as she wraps her legs tightly around your lower back. <i>“Deeper... please.”</i>");
	if(pc.cocks[x].cLength() > 12) 
	{
		output("\n\n<i>“You sure?”</i> you murmur, looking down and appreciating the way her lips are wrapped around your tip. <i>“I’ve got a lot of inches to give.”</i>");
		output("\n\n<i>“I want all of them,”</i> she pants hungrily, eyeing you with eagerness. <i>“I wanna feel them all the way up to my wOoohhhh my god! Oh my god!”</i>");
		output("\n\n<i>“Done,”</i> you say, grinning. <i>“Now lie back and take it, silly girl.”</i>");
	}
	output("\n\n<i>“Oh </i>god<i>,”</i> she says loudly as you begin, her arms finding their way above her head to brace herself against the bed. <i>“Oh god, my pussy feels so goooood! Mmmmm!”</i>");
	output("\n\n<i>“Good bitch,”</i> you grunt, wrapping an arm around her waist and hefting her into your lap.");
	output("\n\nBraced and flexed, you begin laying into her roughly, fucking lusty moans from the back of her throat every time you go balls-deep inside her. Stella’s crazy with need, pushing her hips up to meet your thrusts with desperate movements and biting her fat bottom lip. Her callipygian ass starts to lift off the bed entirely as you rock it, the headboard slamming noisily against the wall while Stella’s moans reach a fever pitch of pleasure.");
	output("\n\n<i>“I’m cumming! OhmigoshI’mcummingsohardnnnnngh!”</i> she manages to gasp in a single breath before hugging you tightly, vigorously grinding her hips into the base of your crotch even as she cums. <i>“Ah! Ah! Aaah! Oh, gooood!”</i> Stella cries out, looking into your face with the most beautiful expression even as her body instinctively seeks further pleasure. Her tail is stuck straight up in the air and shaking just like the rest of her, incapable of dishonesty and betraying just how much she loves having you deep inside her spasming snatch.");
	output("\n\nHaving the panting, big-titted ausar needily drive her hips down onto your [pc.cock " + x + "], her beachball-sized breasts jiggling in your face, is enough to drive you wild with desire. Retaking the initiative, you grab her breasts and push her back down onto the bed, sliding your cock almost completely out of her before ramming it home. She reacts immediately, sagging submissively in your grip as she lays back on the bed and slides her hands up your biceps.");
	output("\n\n<i>“Oh, god,”</i> she whispers with every long, deep thrust, tightening her grip around your arms until finally she can bear it no longer and cums again, squeezing her eyes shut and groaning through grit teeth while you keep sliding in and out of her ridiculously-tight cunt. The way it grips and sucks at you you’d almost swear she had control over it, but you know she’s just trying as best she can to keep you inside her, anything to get you to keep fucking her bimbo pussy.");
	output("\n\nNow that you’ve got her pinned and cumming, now seems like as good a time as any to fuck her as hard as you can and bust a nut in Stella’s flawless pussy. She instinctively spreads her legs as wide as possible and plants her heels behind your waist when you begin, one hand touching your [pc.chest] and the other on her lower stomach, tracing the obscene bulge of your cock through her taut, tanned skin.");
	output("\n\n<i>“Hoohhhh god,”</i> Stella breathes, arching her back enough to make her massive tits splay to either side of her chest, <i>“Oohhh god, master...”</i>");
	output("\n\nEncouraged, you begin to fuck her faster, lewd, wet noises issuing from where the two of you are joined as your groin meets hers and your [pc.balls] slap between her cheeks. The sound of sex is all you can hear, Stella’s moans and the lurid smacking noises from between her thighs only spurring you onwards. Soon you’re pounding her so hard she’s practically screaming in orgasmic joy with every thrust, and your own peak is fast approaching.");
	output("\n\nSeizing the bimbo beach girl around her waspish waist, you give a primal, bestial roar as you hilt her on your cock, your [pc.sack] tightening in advance of dumping its payload inside Stella. With your [pc.cockHead " + x + "] pressed right against her cervix, she screams in ecstasy when she feels the first load spurt inside her, warmth radiating outwards from her core.");
	output("\n\n<i>“[pc.name]! [pc.name]!”</i> she cries, grabbing at you, feeling you up even as you cum inside her. <i>“Oh my god, yes!”</i>");
	
	var cumQ:Number = pc.cumQ();
	if(cumQ < 500) output("\n\nYou tense hard as you pump her slippery, dripping cunt full of your seed, withdrawing from her tight, gripping walls with a lewd slurp. A trail of your jizz slowly rolls down her beach-browned thigh, disappearing down between her asscheeks.");
	else if(cumQ < 1000) output("\n\nYou tense hard as you pump her slippery, dripping cunt full of your seed, withdrawing from her tight, gripping walls with a lewd slurp. A thick trail of your jizz slowly rolls down her beach-browned thigh, sliding down between her asscheeks.");
	else if(cumQ < 5000) output("\n\nYou tense and strain as you struggle to get all of your cum inside her slippery, dripping cunt, pumping her full of warm seed before withdrawing from her tight, gripping walls with a lewd slurp. A runnel of [pc.cumColor] cum slowly issues from Stella’s pink pussy, rolling down her beach-browned thigh and sliding between her asscheeks. The rest is still safely stuffed in her womb.");
	else if(cumQ < 1000) output("\n\nYou tense, strain and squeeze as you struggle to pump all of your cum inside her slippery, dripping cunt, filling her with warm seed before withdrawing from her tight, gripping walls with a lewd slurp. [pc.cumColor] cum begins to slowly, rhythmically pump back out of her used pussy, splashing down her beach-browned thighs and sliding between her asscheeks. The rest is still crammed in her womb, stuffing her absolutely full of your jizz. You can see a slight bulge in her stomach where she’s swollen to capacity and then some.");
	else if(cumQ < 25000) output("\n\nYou tense, strain and squeeze as you struggle to pump all of your cum inside her slippery, dripping cunt, filling her with warm seed before withdrawing from her tight, gripping walls with a lewd slurp. [pc.cumColor] cum begins to squirt from her pussy in time with her heartbeat, Stella moaning quietly as what must be a gallon or more flows from her well-used slit. The rest is still crammed in her womb, stuffing her absolutely full of your jizz. There’s a massive bulge in her stomach where she’s swollen to capacity and then some.");
	else 
	{
		output("\n\nGripping her waist white-knuckled, you groan in blessed release as you begin to pump Stella full, filling her womb to the brim with just one voluminous jet of seed. Moaning, she begins to rub her clit while your [pc.cock " + x + "] throbs in her cunt, cumvein bulging with the sheer liquid payload passing through it. [pc.cumColor] jizz begins to spurt back down her beach-browned thighs even as more of it flows into her womb, swelling her stomach obscenely by the second. Stella throws her head back and cums <i>hard</i>, a deep groan rising from the back of her throat as her walls clamp down on your dick and milk it for all you’re worth.");
		output("\n\nBy the time you’ve finished cumming, Stella’s womb is stuffed so full of your virile seed that her stomach is bigger than her heaving tits. It’s lucky she already made herself cum with her hands, because she won’t even be able to reach her own clit for a few hours, leaving her completely at your mercy. A massive puddle of jizz lies beneath her giant, shapely ass, thoroughly soaking her bed and her skin. You pull out with a loud, wet slurp of fluid as close to a gallon of cum begins to slowly, inexorably pump back out of the fucked-full girl.");
		output("\n\n<i>“Hoooly wow, you’re like, a " + pc.mf("god","goddess") + " or something,”</i> Stella mumbles deliriously, rubbing her own bloated tummy. <i>“That’s like, really amazing...”</i>");
	}
	output("\n\n<i>“Nnnnhh,”</i> you grunt, stretching out in front of the prostrate girl. <i>“Wanna clean me up?”</i>");
	if(cumQ >= 5000) output("\n\nDespite her condition, s");
	else output("S");
	output("he’s only too eager to get on her hands and knees and suck your cock completely clean. Stella licks you up and down, clearly savoring the experience, not all that dissimilar from how she might treat a lollipop. By the time she’s done your cock glistens with her saliva, a strand almost dripping from the end before she catches it with her tongue.");
	output("\n\n<i>“Oops,”</i> she says, fluttering her eyelashes. <i>“Can’t have you walking out all </i>drippy<i>.”</i>");
	output("\n\nAt this rate you’re likely to keep her between your legs for a few hours if you don’t get out now. In fact...");
	processTime(30);
	pc.orgasm();
	IncrementFlag("STELLA_FUCKED");
	clearMenu();
	//[Nah] [Keep going]
	stellaSexFatigue(1);
	if(moreStellaSexAvailable()) addButton(1,"Keep Going",keepFuckingStella);
	else addDisabledButton(1,"Keep Going","Keep Going","The spirit is willing, but the body is worn out.");
	addButton(0,"Nah",nahNoMoreDickingStella);
}

public function nahNoMoreDickingStella():void
{
	clearOutput();
	showStella(true);
	author("Wsan");
	output("You’ve got things to do. Telling Stella as much and giving her a scratch behind the ears for being such a good girl, she leaps up to press herself against you and nuzzle her head ");
	if(pc.biggestTitSize() < 3) output("against your chest.");
	else output("in your bosom.");
	output("\n\n<i>“Will you be back soon?”</i> she whines, bushy tail drooping a bit.");
	output("\n\n<i>“Yeah, ‘course,”</i> you tell her, petting her head. <i>“Couldn’t leave my favorite beach puppy alone, right?”</i>");
	output("\n\n<i>“Yeah!”</i> she giggles, then prances into the bathroom to tidy up with a wave. <i>“Bye [pc.name]!”</i>");
	output("\n\n<i>“See ya,”</i> you call out, stepping outside.");
	output("\n\nYou head back to changing rooms ");
	if(!pc.inSwimwear(true)) output(", swapping your swimsuit for your regular gear, and ");
	else output("on your way to ");
	output("leave, bidding Alex goodbye. Looks like you spent a fair amount of time in there based on what you’re seeing when you reemerge into Tavros proper. Time flies when you’re having fun, huh?");
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Keep going]
public function keepFuckingStella():void
{
	clearOutput();
	showStella(true);
	author("Wsan");
	pc.slowStatGain("libido",1);
	output("You’d rather keep fucking this bodacious ausar babe than be anywhere else in the universe right now, and you’re pretty sure she thinks the same. The only question left is how you want to take her this time.");
	processTime(1);
	//loops back to her sex menu, but doesn’t have the talk option.
	clearMenu();
	//[Pussy] [Assfuck] [Oral]
	if(pc.cockThatFits(stellaCapacity()) >= 0) 
	{
		addButton(0,"Pussy",stellaPussyFuck);
		addButton(1,"Assfuck",assFuckStella);
	}
	else
	{
		addDisabledButton(0,"Pussy","Pussy","You’re too big to fit into the puppy-bimbo!");
		addDisabledButton(1,"Assfuck","Assfuck","You’re too big to fit into the puppy-bimbo!");
	}
	if(pc.hasCock()) addButton(2,"Blowjob",stellaOralStuff);
	else addDisabledButton(2,"Blowjob","Blowjob","She can’t suck your dick if you don’t have one!");
	if(pc.hasVagina()) addButton(3,"Get Licked",stellaOralStuff,true);
	else addDisabledButton(3,"Get Licked","Get Licked","She can’t munch your rug if you’ve got hardwood flooring.");
}

//[Assfuck]
//requires dik
public function assFuckStella():void
{
	clearOutput();
	showStella(true);
	author("Wsan");
	var x:int = pc.cockThatFits(stellaCapacity());
	if(x < 0) x = pc.smallestCockIndex();

	output("<i>“Alright Stella, how do you feel about anal?”</i> you ask, eyeing her thighs. Her ass is so big you can practically see it from the front, and damn if it isn’t a tempting view.");
	output("\n\n<i>“Um, which one is anal again? Is that where you put it in my butt?”</i> she asks, trying hard to remember which act is which while she absentmindedly taps her head. After a couple of seconds of deliberation, she comes to a decision with a smile. <i>“Sure! Oh, wait, you need lube.”</i>");
	output("\n\nSlightly proud of the bimbo for figuring out that she needs lube all on her own, you watch her with the expectation she’s about to grab some from her drawers. Instead, she leans forward in front of you and takes your [pc.cock " + x + "] in hand.");
	output("\n\n<i>“Uh, Stella, where’s the l-”</i> you begin, intending to gently remind her of the thing she mentioned not even two seconds ago, then stop when she dives forward and swallows your cock. <i>“Gah!”</i>");
	output("\n\nIt’s only fifteen seconds, but they’re some of the most intense seconds of your life. You’re reeling by the time she pulls herself off your dick, now coated in spit and strands of saliva.");
	output("\n\n<i>“There!”</i> she says proudly, not skipping a beat. She didn’t gag or choke at all either, despite practically facefucking herself with your dick. <i>“Now you’re ready.”</i>");
	output("\n\n<i>“Yeah, thanks, Stella,”</i> you tell her, tapping her thick thigh. <i>“Why don’t you get up on all fours to make this a bit easier?”</i>");
	output("\n\n<i>“Ooh, like a dog? Yay!”</i> she cheers, flipping onto her stomach and pushing herself up. <i>“Are you gonna punish your naughty puppy, master?”</i>");
	output("\n\n<i>“Damn straight,”</i> you murmur, giving her expansive ass a nice smack that sets her lower half jiggling. <i>“Stretch yourself out for your master, Stella.”</i>");
	output("\n\nPutting her face in the sheets and reaching back, she does a good job of grabbing her buttcheeks and spreading them, exposing both her pussy and her asshole. You can see she already has wet arousal trickling down her thighs from her slightly-open puss, but you’re not interested in that right now. What you’re focused on is her tight pink little ring, barely open at all thanks to how grippy her skin is.");
	output("\n\nShe’s going to be really, really tight, though not for long. Getting up on the bed, you sit behind her and align yourself, rubbing your dick between her massive buttcheeks. Stella wiggles happily from side to side at the contact until you place your tip right at her entrance, halting her movement.");
	output("\n\n<i>“Sit back on it,”</i> you order her, motivated in part by not wanting to hurt her but mostly because you want to see her follow your instructions. <i>“Be a good girl.”</i>");
	output("\n\n<i>“Yes, master...”</i> she murmurs, hypnotized by your command. <i>“Ooooh...”</i>");
	output("\n\nYou’d moan almost as loudly as she is were you not biting your lip to stifle it. The feeling of her slowly stretching, spreading around your [pc.cockHead " + x + "], makes you want to just seize her ass and drive yourself forward, but you manage to resist. Instead you let the sensation of having your engorged cock slowly taken in by Stella’s ass, squeezing you like a vise all the while. She barely makes it a few inches down before she’s panting, moaning needily like a bitch in heat.");
	pc.cockChange();
	output("\n\n<i>“Need some help there, Stella?”</i> you ask her, pulling her up off the bed and into your lap. <i>“Here, try sliding down on it...”</i>");
	output("\n\nWith a desperate moan she indulges your demand, squealing in surprise when you offer assistance by way of jolting your hips upward just a bit to get yourself deeper.");
	output("\n\n<i>“Oh, [pc.name]! Jeez, go a little slower!”</i> she cries, her tail wrapping itself around your back.");

	output("\n\n<i>“Can’t help it,”</i> you grunt, putting your hands around her wasp-thin waist. <i>“Having this fat fucking ass of yours in my lap makes me wanna just grab you and fuck until you’re screaming for more.”</i>");

	output("\n\n<i>“Uhhhh- wow,”</i> Stella mumbles, momentarily lost in thought. <i>“Can we skip to that part?”</i>");

	output("\n\nA few seconds later and you’re pulling Stella down your cock with a forceful grunt, the beach-brown ausar moaning in equal parts pain and ecstasy until she’s sitting safely in your lap, her padded ass spread wide around your dick.");

	output("\n\n<i>“Homigooood,”</i> Stella moans, finally able to relax against you, not that it stops her from gripping you so hard it’s almost impossible to thrust. <i>“Wait just a sec...”</i>");

	output("\n\n<i>“Relax, Stella,”</i> you tell her, intending both meanings. <i>“I’ll give you some time to get used to it.”</i>");

	output("\n\nReaching around to to her front, you drape an arm across her inner thigh and slide a finger across the hard little nub just above her tight slit. She jumps a little at the sensation and gasps, instinctively clamping down on your dick.");

	output("\n\n<i>“Oh, gosh!”</i> she cries, desperation seeping into her voice. <i>“I didn’t even realize how close I was... nnnnggh!”</i>");

	output("\n\nYou give her a few seconds of gentle rubbing and suddenly the wanton doggirl is grinding into your lap and making high-pitched moans of ecstasy, bucking in your grip as she squirts all over herself. Lost in the ecstasy, she doesn’t notice you shifting beneath her until you gently hump her from below.");

	output("\n\n<i>“Oh!”</i> she gasps in surprise, coming back down to the planet with a light slap of flesh. <i>“Oh, wow, that feels like, really good now!”</i>");
	output("\n\nA couple more slow thrusts and she’s begging you not to stop, then suddenly she’s on all fours with her head bowed as you pound her tight little asshole, sweat flying from both of your bodies. You get a good grip on the bimbo babe’s hair to keep her in place while her empty pussy squirts down her thighs at the treatment, her voice coming out in halting gasps and moans of decadent pleasure.");
	output("\n\n<i>“Harder,”</i> Stella breathes, her voice barely audible. Grinning, you pull her back a little, never stopping the rhythm.");
	output("\n\n<i>“What was that, puppy? You’ll have to speak up if you want a treat.”</i>");
	output("\n\n<i>“Please!”</i> Stella moans, somehow finding it in herself to take a proper breath she can scream with. <i>“Fuck me harder, master!”</i>");
	output("\n\n<i>“Good girl,”</i> you grunt, letting go of her hair and sending her tumbling back onto the bed.");
	output("\n\nThe sound of rough, animalistic sex fills Stella’s room, her massive ass slapping against your thighs with every thrust, punctuated every so often by a firm slap on her butt and an accompanying scream of pleasure. She’s so goddamn tight that it’s hard to fight the instinct to just instantly cum, something Stella’s clearly not concerned with as she delightedly squeals her way to her fourth or fifth.");
	output("\n\nEventually, it’s too much to bear. The sound of her lurid moans, the way her voluptuous body feels in your hands, the sensation of her sliding up and down your swelling dick; even tiny details like the way her tail stays needily wrapped around you like she never wants you outside of her are driving you insane with the need to blow a massive load inside her. Grabbing her hips, you pull her back upright into your lap, desperately hammering her ass from below until you finally cum.");
	output("\n\n<i>“Yeeeesssss,”</i> Stella moans loudly, drowning out your grunts of release. <i>“Oh my goood, yes, cum inside me... empty those balls...”</i>");
	output("\n\nShe continues with the lewd encouragement throughout your entire orgasm, working her ass both involuntarily and voluntarily as she suffers a mild orgasm herself just feeling your [pc.cum] flood her insides.");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 500) { }
	else if(cumQ < 1000) output(" By the time you’ve slowly extricated yourself from her clingy asshole, you’ve emptied your entire load into the depths of her ass. Not even a drip remains, and she’s loving it.");
	else if(cumQ < 5000) output(" By the time you’ve slowly extricated yourself from her clingy asshole, you’ve emptied your entire load into the depths of her ass and left her dripping. She lets out a quiet moan just feeling it run between her legs.");
	else if(cumQ < 10000) output(" By the time you’ve slowly extricated yourself from her clingy asshole, you’ve emptied your entire load into the depths of her ass and left a small river of spunk running between her legs. She lets out a loud moan at the feeling, lightly pushing her thighs together.");
	else if(cumQ < 25000) output(" By the time you’ve slowly extricated yourself from her clingy asshole, you’ve left her with several added pounds worth of liquid weight and a swollen tummy. She looks at least a few months pregnant, and there’s a river of spunk flowing between her legs. She lets out a loud moan at the feeling, lightly pushing her thighs together.");
	else output(" By the time you’ve slowly extricated yourself from her clingy asshole, you’ve left her looking like she’s several months pregnant. She’s carrying enough liquid weight around for it to be a major inconvenience, and you can’t help but be a little proud of your performance. She lets out a loud groan at the feeling of a river of spunk flowing between her legs, lightly pushing her thighs together.");
	output("\n\n<i>“Damn,”</i> you groan, standing up and letting her lazily stretch out on the bed. <i>“That was every bit as good as I thought it would be.”</i>");
	output("\n\n<i>“Uh huuuuuh,”</i> Stella emphatically agrees, eyes still a little glassy. The way she’s lying on the bed, freshly fucked and still panting in the afterglow, has you kinda wanting to go again...");
	processTime(30);
	pc.orgasm();
	IncrementFlag("STELLA_BUTTFUCKED");
	clearMenu();
	addButton(0,"Nah",nahNoMoreButtfuckStella);
	stellaSexFatigue(1);
	if(moreStellaSexAvailable()) addButton(1,"Keep Going",keepFuckingStella);
	else addDisabledButton(1,"Keep Going","Keep Going","The spirit is willing, but the body is worn out.");
}

//[Nah]
public function nahNoMoreButtfuckStella():void
{
	clearOutput();
	showStella();
	author("Wsan");
	output("You’ve got things to do. Leaning over to kiss Stella goodbye, she pulls you into a friendly hug and licks your cheek until you catch her tongue and entwine it with your own. Pulling back after a little while, you tell her you’re gonna head out.");
	output("\n\n<i>“Will you come back to me soon?”</i> she whines, bushy tail drooping a bit.");
	output("\n\n<i>“Yeah, ‘course,”</i> you tell her, petting her head. <i>“Couldn’t leave my favorite buttslut beach puppy alone, right?”</i>");
	output("\n\n<i>“Yeah!”</i> she giggles, giving you a cheery wave from the bed. <i>“Bye [pc.name]!”</i>");
	output("\n\n<i>“See ya,”</i> you call out, stepping outside.");
	output("\n\nYou head back to changing rooms");
	if(!pc.inSwimwear(true)) output(", swapping your swimsuit for your regular gear, and");
	else output(" to");
	output(" leave, bidding Alex goodbye. Looks like you spent a fair amount of time in there based on what you’re seeing when you reemerge into Tavros proper. Time flies when you’re having fun, huh?");
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Oral]
public function stellaOralStuff(forceVaginal:Boolean = false):void
{
	clearOutput();
	showStella(true);
	author("Wsan");
	if(pc.hasCock() && !forceVaginal)
	{
		var x:int = pc.biggestCockIndex();
		var whoreshipped:Boolean = false;
		
		output("<i>“How do you feel about fetching a bone, Stella?”</i> you ask with a grin, pushing your hips forward just a little to present it to her. <i>“Remember not to use teeth, though.”</i>");
		output("\n\n<i>“Ooh, yay! I love bones!”</i> Stella cheers eagerly, leaning forward on the bed. <i>“Remember to call me a good dog, master...”</i>");
		output("\n\n<i>“When you’re done, Stella,”</i> you promise, touching the [pc.cockHead " + x + "] to her perfect, pouty lips. <i>“Go on.”</i>");
		output("\n\nNeeding no further urging, she plants those bimbo lips of hers on the head of your cock and sucks, licking the sensitive underside of your engorged dick before suddenly sliding");
		if(pc.cocks[x].cLength() < 12) 
		{
			output(" all the way to the base, her tongue stretching out to lick and play ");
			if(pc.balls > 0) output("with your [pc.balls]");
			else if(pc.hasVagina()) output("with your [pc.vaginas]");
			else output("across your taint");
			output(" even as she holds your entire [pc.cock " + x + "] in her throat.");
		}
		else if(pc.cocks[x].cLength() < 19) 
		{
			output(" almost all the way down the length of your [pc.cock " + x + "], pausing for a moment to gather herself before swallowing the rest. Her tongue lolls from her mouth to ");
			if(pc.balls > 1) output("lick your [pc.balls], swishing from side to side as she curls it around them.");
			else if(pc.balls == 1) output("lick your [pc.balls], swishing from side to side as she curls it around it.");
			else if(pc.hasVagina()) output("lick your [pc.vaginas], swishing from side to side in a search for your [pc.clits].");
			else output("slurp across your exposed taint, swishing from side to side on the tender skin.");
		}
		else if(pc.cocks[x].cLength() < 25) 
		{
			output(" halfway down your [pc.cock " + x + "], having to pause and grab you with a hand to reorient herself thanks to your size. Having taken a moment, she eagerly swallows the rest into her throat, her tongue stretching desperately from her mouth to ");
			if(pc.balls > 0) output("lick at your [pc.balls].");
			else if(pc.hasVagina()) output("lick at your [pc.vaginas].");
			else if(pc.hasSheath(x)) output("slip into your sheath.");
			else output("slurp at your taint.");
		}
		else 
		{
			output(" as far down your [pc.cock " + x + "] as she possibly can, getting stuck around two feet down. Her tongue stretches desperately from her mouth, lapping at your cumvein as if begging for your load");
			if(pc.balls > 0) output(", unable to reach your [pc.balls] with her lips.");
			else if(pc.hasVagina()) output(", unable to reach your [pc.vaginas] with her lips.");
		}
		output("\n\n<i>“Mmmmn, god,”</i> you groan, running a hand through her luxurious hair. <i>“That’s a good start...”</i>");

		output("\n\nEncouraged by your praise, Stella begins to eagerly bob up and down on your cock, withdrawing all the way to the tip to wash her tongue over your slit before opening her throat to your use. The way she slowly wraps your swollen dick in her warm throat’s embrace is an artform, the beautiful bimbo’s lips");

		if(pc.cocks[x].cLength() < 25) output(" paying each vein and ridge their due respect on the way to your groin, where she plants a wet, sloppy kiss with her pink lipstick");
		else output(" sliding over each vein and bump with a measured, intimate pace until she bottoms out, sucking hard enough to leave a depth indicator made out of lipstick on your dick");
		output(".");

		output("\n\nShifting around a little, you sit on Stella’s bed and get her on the floor on her knees, content to enjoy her worshipping you without having to intervene. Her eyes lidded, she handles your cock with reverence, gently stroking and touching while her mouth is at the tip");
		if(pc.balls > 0) output(" and fondling your balls when she has it deep in her throat");
		output(". She’s extremely skilled, titillating you with her soft, pretty lips and the wet warmth of her mouth but never pushing you over the edge, leaving you the choice of when you want to cum.");

		output("\n\nWith a wet, lurid popping noise, she lets the head of your cock free from her lips’ embrace and takes your entire length in her hands, gently kissing you all over on the way down to your ");
		if(pc.balls > 1) 
		{
			output("balls.");
			if(pc.ballDiameter() < 4) output(" You can feel the heat of her breath washing over your nuts from her nose as she needily licks, sucks, and fondles them, putting her face right into your crotch to get a better feel. She takes long, deep inhales of your scent while she pays you worship, slowly stroking your cock even as she takes your balls in her mouth to suck");
			else if(pc.ballDiameter() <= 6) output(" You can hear her quietly groan in need from below you as she gently takes your balls in both hands, licking up and down their entire surface and suckling them when she can’t get them entirely in her mouth. You can feel the short, hot exhalations from her cute little nose as she shoves it right into your crotch to inhale your scent, one hand slowly snaking upwards to rub your cock while she worships your balls with her tongue. She’s definitely got a thing for size...");
			else if(pc.ballDiameter() <= 9) 
			{
				output(" Stella makes an orgasmic moan as she eyes your oversized balls, pressing her face between them and taking a long, deep breath of your scent as her tongue frantically licks up and down their entire surface. Far too large to take into her mouth, she instead takes them reverently in both hands and licks them with a fierce desperation, kissing and suckling all over.");
				output("\n\nAfter a minute of her not coming up from servicing your balls, you hear her beginning to moan at a high pitch, albeit muffled with the way her lips are pressed flush against your nuts. With each anxious, needy lick she moans longer, until finally, her hips begin to jerk and her thick thighs begin to squeeze together. Groaning into your sack, she squirts all over the floor and herself, unable to handle being presented with such fat, massive balls all for her. She’s clearly got a big thing for size...");
			}
			else
			{
				output(" The way Stella moans when she finally has full access to your massive balls makes it sound like she’s cumming already, and upon burying her face in your sack and taking a long, deep inhale, her hips begin to almost imperceptibly wobble. Her tongue snakes from her mouth and licks you with a desperation you");
				//first time oral: 
				if(flags["STELLA_BALLWORSHIPPED"] == undefined) output(" haven’t seen from her before");
				else output(" only ever see when she’s worshipping your balls");
				output(", passionately washing your entire surface. With each lick you can tell she’s getting closer, her wide, puppy-bearing hips jerking and bucking until, finally, she cums all on her own. Femcum squirts down her plump thighs and buttocks, drizzling on the floor as she moans like a whore into your fat nuts, overcome by your evident fertility.");
				output("\n\nIt doesn’t stop there, either. Endeavoring to cover your entire sack in cute, feminine kisses and licks of her tongue, Stella pays attention to every single aspect of worshipping your balls, fondling and sucking where she can, bringing herself to another mind-shattering orgasm before too long. The way she groans so loud, you suspect this is a fantasy she’s wanted to fulfill for quite some time - it’s pretty clear she has a big thing for size...");
				whoreshipped = true;
			}
		}
		else if(pc.balls == 1) 
		{
			output("ball.");
			if(pc.ballDiameter() < 4) output(" You can feel the heat of her breath washing over your nut from her nose as she needily licks, sucks, and fondles it, putting her face right into your crotch to get a better feel. She takes long, deep inhales of your scent while she pays you worship, slowly stroking your cock even as she takes your ball in her mouth to suck");
			else if(pc.ballDiameter() <= 6) output(" You can hear her quietly groan in need from below you as she gently takes your ball in both hands, licking up and down its entire surface and suckling it when she can’t get it entirely in her mouth. You can feel the short, hot exhalations from her cute little nose as she shoves it right into your crotch to inhale your scent, one hand slowly snaking upwards to rub your cock while she worships your ball with her tongue. She’s definitely got a thing for size...");
			else if(pc.ballDiameter() <= 9) 
			{
				output(" Stella makes an orgasmic moan as she eyes your oversized ball, pressing her face into it and taking a long, deep breath of your scent as her tongue frantically licks up and down its entire surface. Far too large to take into her mouth, she instead takes it reverently in both hands and licks it with a fierce desperation, kissing and suckling all over.");
				output("\n\nAfter a minute of her not coming up from servicing your balls, you hear her beginning to moan at a high pitch, albeit muffled with the way her lips are pressed flush against your nut. With each anxious, needy lick she moans longer, until finally, her hips begin to jerk and her thick thighs begin to squeeze together. Groaning into your sack, she squirts all over the floor and herself, unable to handle being presented with such fat, massive ball all for her. She’s clearly got a big thing for size...");
			}
			else
			{
				output(" The way Stella moans when she finally has full access to your massive ball makes it sound like she’s cumming already, and upon burying her face in your sack and taking a long, deep inhale, her hips begin to almost imperceptibly wobble. Her tongue snakes from her mouth and licks you with a desperation you");
				//first time oral: 
				if(flags["STELLA_BALLWORSHIPPED"] == undefined) output(" haven’t seen from her before");
				else output(" only ever see when she’s worshipping your ball");
				output(", passionately washing your entire surface. With each lick you can tell she’s getting closer, her wide, puppy-bearing hips jerking and bucking until, finally, she cums all on her own. Femcum squirts down her plump thighs and buttocks, drizzling on the floor as she moans like a whore into your fat nut, overcome by your evident fertility.");
				output("\n\nIt doesn’t stop there, either. Endeavoring to cover your entire sack in cute, feminine kisses and licks of her tongue, Stella pays attention to every single aspect of worshipping your ball, fondling and sucking where she can, bringing herself to another mind-shattering orgasm before too long. The way she groans so loud, you suspect this is a fantasy she’s wanted to fulfill for quite some time - it’s pretty clear she has a big thing for size...");
				whoreshipped = true;
			}
		}
		else output("loins");

		output("\n\nBy the time she’s done");
		if(pc.balls > 1) output(" with your nuts");
		else output(" face-fucking your lap");
		output(", you’re pretty close to cumming. Gently directing her affections north, you gradually get her up");
		if(pc.balls > 1) output(" from your balls");
		output(" and focused back on your shaft, re-planting all of the kisses she put there before, climbing back to your tip. You push her down your cock and she’s only too happy to acquiesce, placing herself in your hands as you begin to rock your hips on her bed, fucking her immaculate face while she looks up at you with those stunning aqua blue eyes.");

		output("\n\nThe sight of a bimbo beach doll in complete submissiveness to your whims is too much to handle, and you find yourself fucking her throat even faster as you approach the peak, wet slaps echoing throughout Stella’s luxury suite as you defile it with her saliva and your juices. With a loud, bestial roar of release, you grab her and hold her down on your cock while you begin pumping her full of your spunk, your cumvein swelling in her throat. ");
		var cumQ:Number = pc.cumQ();
		if(cumQ < 1000) 
		{
			output("You blow your entire load into her tummy, shooting rope after rope down her throat after the puppygirl’s ");
			if(pc.balls > 1) output("ballplay ");
			else output("attentions ");
			output("earned her so much jizz. She looks thrilled about it, too, her eyes rolling back as your warmth slides down the back of her throat.");
		}
		else if(cumQ < 5000) 
		{
			output("You clench your teeth in pleasure while you");
			if(pc.balls > 1) output("r churning balls empty themselves");
			else output("empty yourself");
			output(" into her tummy, painting the back of her throat [pc.cumColor] with your seed. Stella seems perfectly content to swallow it all down, her eyes having rolled back in her head the moment you started cumming.");
		}
		else if(cumQ < 25000)
		{
			output("\n\nGrunting, you grab her hair and tilt her head upwards so you can watch her reaction as you start cumming down her throat. At first her eyes roll in delight and you can feel her almost smiling around your cock, but you grin when you see them widen slightly as she realizes how uniquely productive you are. Soon she’s desperately hollowing her cheeks in a vain attempt to swallow all of your [pc.cum], but after some time realizes she would be better off submissively opening her throat up and just letting you cum straight in her stomach.");
			output("\n\nStella might be a bimbo, but she’s a good bitch. You give her a scratch behind the ears just to reinforce her submissiveness, letting her know she’s doing a good job just letting you be in charge. There’s no need for her to exert herself when she can just sit back and let you make her tummy swell with warm, churning seed. She’s loving it, too, her eyes rolling back in her head with the pleasure of being filled with your cum.");
		}
		else
		{
			output("\n\nGrunting, you grab Stella’s hair and tilt her head upwards so you can watch her reaction as you start cumming down her throat. She looks up at you with an expression of shocked amazement as your surging cock begins to fill her with warm, churning seed. Presented with no other choice than to submissively hold her throat open and just letting you cum straight into her stomach, Stella’s tummy rapidly begins to inflate, swelling with jizz.");
			output("\n\nThe waterfall of spunk right into her belly doesn’t let up, either, Stella’s eyes rolling back in her head while her hips begin to buck in sympathetic orgasm. Overcome by your incredible virility, she squirts on the floor");
			if(pc.balls > 1 && pc.ballDiameter() > 6)
			{
				if(flags["STELLA_BALLWORSHIPPED"] != undefined) output(" just like when she was licking your balls");
				output(", her incredibly submissive tendencies in the face of an extremely well-endowed partner on display");
			}
			output(". You just grin and keep her there with your cock in her throat, letting her take on your burden by the gallon.");
			output("\n\n<i>“Good little bitch, Stella.”</i>");
		}
		output("\n\nWhen you’re done, you coolly withdraw your [pc.cock " + x + "] from her face and let her sag backwards, slowing her descent to the floor with a [pc.foot] behind her back. You take some time to clean her up a little and put her back on the bed");
		if(cumQ >= 10000) output(", albeit with some difficulty with all the weight in cum she’s put on");
		output(". Roused back to consciousness, she begins giggling shyly.");
		output("\n\n<i>“Ummm, that was like, so much fun?”</i> she says, breaking into a smile that spans from ear to ear. <i>“Like, wow, [pc.name]. I’m totes down to suck your cock any time you want.");
		if(cumQ >= 10000) output(".. Especially if you leave me looking like this...”</i> she says, stroking her swollen tummy. Her massive tits lie atop it, giving her the image of a fertility goddess. It looks good on her. <i>“I think it looks good on me!");
		output("”</i>");
		output("\n\nYou’re pretty sure she really means it, too. In fact, you could take her up on the offer right now...");
		
		if(whoreshipped) IncrementFlag("STELLA_BALLWORSHIPPED");
		
		processTime(30);
		pc.orgasm();
		//[Nah] [Keep going]
		clearMenu();
		stellaSexFatigue(1);
		if(moreStellaSexAvailable()) addButton(1,"Keep Going",keepFuckingStella);
		else addDisabledButton(1,"Keep Going","Keep Going","The spirit is willing, but the body is worn out.");
		addButton(0,"Nah",nahDickSuckPup);
	}
	else
	{
		output("<i>“I wanna feel that tongue of yours in my pussy, Stella,”</i> you tell her directly, watching her follow the path of your fingers as they slide down your [pc.stomach] to your [pc.clits]. <i>“You think you can be a good dog long enough to get me off a few times?”</i>");
		output("\n\n<i>“Oooh, yes,”</i> she moans, eagerly leaning forward on the bed. <i>“I love being a good dog for my master...”</i>");
		output("\n\n<i>“That’s right, you do,”</i> you murmur, taking a small step forward, just enough for your snatch to be in reach of her tongue. <i>“Go on...”</i>");
		output("\n\nPlanting her hands on the supple flesh of your [pc.ass], she pulls you into her right as she begins passionately making out with your pussy, a groan of pleasure issuing unbidden from your mouth. Closing your eyes and running your hands through Stella’s luxurious hair, you let her have free reign as she eagerly explores her options, pressing a dainty finger against your entrance even as she leisurely rubs your clit");
		if(pc.totalClits() > 1) output("s");
		output(".");
		output("\n\nShowing an impressive amount of focus, Stella concentrates entirely on your [pc.clits], alternating between rubbing and licking with her face pressed into your snatch until she has you curling your toes with your eyes squeezed shut, teetering right on the edge. With expert timing, that’s exactly when she chooses to slide her ");
		if(pc.vaginas[0].looseness() <= 1) output("finger all the way inside you");
		else if(pc.vaginas[0].looseness <= 4) output("fingers all the way inside you");
		else output("balled-up fist inside your wet, loose pussy");
		output(". You scream in wanton pleasure and cum on the spot, clenching your teeth so hard it hurts while she artfully sucks on your [pc.clit].");

		output("\n\nStella doesn’t let up with her tongue, lapping greedily at your oversensitive buzzer even as you double over groaning in ecstasy, squeezing her face between your [pc.thighs] while your legs shake. Eventually, it’s too much to take and you push her down on the bed, setting her giggling even as she licks her big, wet lips while you collapse on top of her.");

		if(pc.girlCumType == GLOBAL.FLUID_TYPE_HONEY) output("\n\n<i>“Oh my gaaawd, you’re so tasty,”</i> Stella trills, looking downwards eagerly. <i>“Can you cum more? You’re so good! You taste like honey!”</i>");
		else if(pc.girlCumType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK) output("\n\n<i>“Oh my gosh, you taste like chocolate!”</i> Stella squeals in delight, wriggling with unrestrained happiness. <i>“Can you cum even more?! Lemme back between your legs!”</i>");
		else output("\n\n<i>“Mmmm, you taste gooood,”</i> Stella murmurs happily, rubbing your back. <i>“Puppy wants some more...”</i>");

		output("\n\n<i>“You can have more if you’re a good girl,”</i> you tell her, climbing off her and pointing a bit further up the bed. <i>“And good girls lie on their backs and wait for master to sit on their face.”</i>");

		output("\n\n<i>“Ooh, yay!”</i> Stella exclaims, happily bounding up the bed on all fours to get in position. It’s a fantastic sight, her massive tits swaying tantalizingly from side to side before she flops down on her face and rolls over. <i>“I get to tell </i>you<i> to sit now!”</i>");

		output("\n\nSmiling, you shuffle up her curvaceous body, getting a good grope of her impressive assets on your way, and lift yourself over her beachball-sized breasts to rest atop them. Looking up at you, Stella is entranced.");
		output("\n\n<i>“Wow, you’re like, totally hot, master...”</i> she whispers, biting her lip in anticipation. <i>“Stella reeaaally wants you to sit on her face now...”</i>");
		output("\n\nYou can feel her legs squeezing together behind you, the pliable flesh of her thighs rubbing each other as evidence of her eagerness. Yeah, you think with a grin. She’s definitely gonna cum when you sit on her face.");
		output("\n\n<i>“Here,”</i> you say, raising your [pc.hips] and positioning yourself right above her pretty little face. <i>“Eat up, doggy.”</i>");
		output("\n\nYou drop your [pc.pussy] right on her lips, grabbing her ever-so-classy platinum blonde hair for grip and gyrating on her mouth, moaning as she opens up and lets you slide up and down her tongue. Grinding to a halt, you switch from moving on your own to just pressing her face into your wet, needy cunt and letting her tonguefuck you at her own desperate, frenzied pace.");
		output("\n\n<i>“Uh, god,”</i> you pant, looking down to see Stella focused wholly on your pussy. <i>“Good girl, there’s a good girl...”</i>");
		output("\n\nHonestly you can’t tell if she’s hearing you at all she’s so absorbed in eating you out, but what she’s doing feels so good you don’t really care either way. The way she switches between lapping at your lower lips, swirling her tongue around your clit and sucking it when she moan loud enough, and sticking her tongue inside you, you’re content to let her do whatever the fuck she wants down there.");
		output("\n\nYou while away the time atop Stella’s face, your [pc.butt] clenching hard with every orgasm she gifts you, moaning louder with every one until you’re practically screaming her name and bouncing up and down on her bed. You can feel Stella’s grip on your [pc.thighs] tightening as her own hips begin to rise off the sheets, her tongue lashing at your pussy with sheer need, bringing you to a massive climax right as she reaches her own.");
		output("\n\n<i>“Oh, Stella! Stella!”</i> you cry out, the muscle contractions hitting you so hard you practically double over on top of her, her massive butt rising completely off the bed as she cums her brains out. <i>“Nnnnngh! Nnnnnn, god!”</i>");
		output("\n\nMadly humping the air while she squirts and squirts all over her sheets, the overexcited puppygirl sucks on your [pc.clit] so hard you let out a shrill scream of lust and ");
		if(pc.isSquirter()) output("squirt in her mouth, Stella swallowing it down immediately so she can keep licking.");
		else output("forget yourself momentarily, squeezing her head between your [pc.thighs] so hard her cheeks bunch up.");

		output("\n\nGasping, you collapse on top of her and roll to the side, fighting the instinct to curl into a ball after such intense stimulation. Your muscles ache all over. You take a look at Stella and she’s just lying there, seemingly unbreathing. Did you-? Concerned, you get closer and look her in the face, whereupon her eyes spring open and she kisses you on the lips. You get a nice taste of yourself, but mostly of Stella. She pulls away after a second with a grin.");
		output("\n\n<i>“Oh my god, you came like, SO hard!”</i> Stella laughs, her bushy tail wagging furiously. <i>“You should have seen the look on your face, it was totally hot.”</i>");
		output("\n\nI would’ve thought you’d be too distracted to look at my O-face what with the way you were squirting all over your sheets,”</i> you joke, nudging her lightly in the ribs and setting her giggling besides you.");
		output("\n\n<i>“Aww, you just taste so good I can’t help it!”</i> Stella protests, her ears flitting about. <i>“Jeez, my tongue is tired.”</i>");
		output("\n\nYou can’t say you’re surprised. Propped up on your elbow and looking down at the divine doggirl, you start feeling that familiar sensation of lust from between your somewhat shaky thighs. You could go for another round if you really wanted...");
		processTime(30);
		pc.orgasm();
		//[Nah] [Keep going]
		stellaSexFatigue(1);
		clearMenu();
		if(moreStellaSexAvailable()) addButton(1,"Keep Going",keepFuckingStella);
		else addDisabledButton(1,"Keep Going","Keep Going","The spirit is willing, but the body is worn out.");
		addButton(0,"Nah",nahCuntSlurpPup);
	}
	IncrementFlag("STELLA_GAVE_ORAL");
}	
//[Nah]
public function nahDickSuckPup():void
{
	clearOutput();
	showStella(true);
	author("Wsan");
	output("You’ve got things to do. You give Stella a kiss on her head, her fluffy ears fluttering at your touch, and she looks up at you with eyes wide.");
	output("\n\n<i>“Will you come back to me soon?”</i> she whines, bushy tail drooping a bit.");
	output("\n\n<i>“Yeah, ‘course,”</i> you tell her, petting her head. <i>“Couldn’t leave my favorite dicksucking beach puppy alone, right?”</i>");
	output("\n\n<i>“Yeah!”</i> she giggles, giving you a cheery wave from the bed. <i>“Bye [pc.name]!”</i>");
	output("\n\n<i>“See ya,”</i> you call out, stepping outside.");
	output("\n\nYou head back to changing rooms,");
	if(!pc.inSwimwear(true)) output(" swapping your swimsuit for your regular gear and");
	output(" leaving, bidding Alex goodbye. Looks like you spent a fair amount of time in there based on what you’re seeing when you reemerge into Tavros proper. Time flies when you’re having fun, huh?");

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Nah]
public function nahCuntSlurpPup():void
{
	clearOutput();
	showStella(true);
	output("You’ve got things to do. You give Stella a kiss on her head, her fluffy ears fluttering at your touch, and she looks up at you with eyes wide.");
	output("\n\n<i>“Will you come back to me soon?”</i> she whines, bushy tail drooping a bit.");
	output("\n\n<i>“Yeah, ‘course,”</i> you tell her, petting her head. <i>“Couldn’t leave my favorite pussy-eating beach puppy alone, right?”</i>");
	output("\n\n<i>“Yeah!”</i> she giggles, giving you a cheery wave from the bed. <i>“Bye [pc.name]!”</i>");
	output("\n\n<i>“See ya,”</i> you call out, stepping outside.");
	output("\n\nYou head back to changing rooms,");
	if(!pc.inSwimwear(true)) output(" swapping your swimsuit for your regular gear and");
	output(" leaving, bidding Alex goodbye. Looks like you spent a fair amount of time in there based on what you’re seeing when you reemerge into Tavros proper. Time flies when you’re having fun, huh?");

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function stellaSexFatigue(arg:Number = 0):Number
{
	//Create the status if it aint up.
	if(!pc.hasStatusEffect("STELLA_SEX_FATIGUE")) pc.createStatusEffect("STELLA_SEX_FATIGUE",0,0,0,0);
	if(arg != 0) 
	{
		pc.addStatusValue("STELLA_SEX_FATIGUE",1,arg);
		pc.setStatusMinutes("STELLA_SEX_FATIGUE",120);
	}
	return pc.statusEffectv1("STELLA_SEX_FATIGUE");
}

public function moreStellaSexAvailable():Boolean
{
	var sexPoints:Number = Math.floor(pc.libido() / 40);
	if(pc.isBimbo() || pc.isBro()) sexPoints++;
	else if(pc.hasPriapism()) sexPoints += 2;
	if(pc.lustMin() >= 33) sexPoints++;
	if(pc.inHeat()) sexPoints++;
	if(pc.inRut()) sexPoints++;

	return (sexPoints >= stellaSexFatigue());
}