function reahaBonusFunction():void
{
	author("Savin")
	if(flags["TALK_TO_LADY_1ST"] == undefined) addButton(0,"Woman",talkToBrothelLady);
	else if (flags["REAHA_BOUGHT"] == undefined && flags["TALK_TO_LADY_1ST"] == 1) addButton(0,"Woman",talkToBrothelLadyRepeat);
}

function talkToBrothelLady():void
{
	clearOutput();
	author("Savin");
	output("You approach the mistress, clearing your throat to get her attention. With marked boredom, she intones, \"<i>Welcome to Beth's Busty Broads. If you're here for our going out of business sale, you're out of luck. The selection's… pretty limited. And by that I mean we've got one slut left, and she's a handful.</i>\"");
	output("\n\n\"<i>What happened to all the others?</i>\"");
	output("\n\nShe cocks an eyebrow at you, finally bothering to look up from her slate. \"<i>Boss was using indentured labor, but she had some kinda crisis, whatever. Had to sell most of the contracts out. A lot of the regulars bought up their favorite sluts to keep 'em forever. Or close enough to forever as money can buy.</i>\"");
	if (pc.isNice())
	{
		output("\n\n\"<i>Indentured labor... you mean slaves?</i>\"");
		output("\n\nShe shrugs. \"<i>People go into debt they can't work off, so they sell themselves. They volunteer, and we've got contracts of debt for it. Half of these dumb bimbos bought ultra-grade mods to please their beaus, but what do you know, nobody put a ring on them. Saddest story in the galaxy.</i>\"");
	}
	if (pc.isMischievous())
	{
		output("\n\n\"<i>Indentured labor... you mean slaves?</i>\"");
		output("\n\nShe shrugs. \"<i>People go into debt they can't work off, so they sell themselves. They volunteer, and we've got contracts of debt for it. Half of these dumb bimbos bought ultra-grade mods to please their beaus, but what do you know, nobody put a ring on them. Saddest story in the galaxy.</i>\"");
	}
	output("\n\nShe sets her slate down, steepling her fingers. \"<i>We've got one girl left for sale right now. She's an ornery slut, made herself up to be some kinda cow. Have to keep her patched up on aphrodisiacs or she gets wonky. If that's your thing, it's 100 credits a fling. Unless you're generous or horny enough to want some dumb cow's contract, anyway. I wouldn't if I were you, though; had to drag her off more than one burly sailor she didn't take to.</i>\"");

	if (pc.physique() <= 20)
	{
		output("  Looking you up and down, she adds, \"<i>Hate to see what she'd do to you, given half the chance.</i>\"")
	}
	processTime(3);
	flags["TALK_TO_LADY_1ST"] = 1;
	brothelMainMenu();
}

function brothelMainMenu():void {
	clearMenu();
	addButton(0,"Cow-slut Sex",ReahaBrothelSexMenu);
	addButton(1,"Contract",buyYourselfACowslut);
	if(flags["HOWS_BUSINESS_BITCH"] == undefined) addButton(2, "How's Business", askAboutBusinessLikeASir);
	addButton(14,"Leave",mainGameMenu);
}

function talkToBrothelLadyRepeat():void
{
	clearOutput();
	author("Savin");
	output("You approach the mistress, clearing your throat to get her attention. With marked boredom, she intones, \"<i>Welcome to Beth's Busty Broads. If you're here for our going out of business sale, you're out of luck. The selection's… pretty limited. And by that I mean we've still got just the one cow-slut left, and she's a handful.</i>\"");

	brothelMainMenu();
}



function ReahaBrothelSexMenu():void
{
	clearOutput();
	author("Savin");

	output("You tell the mistress that you'd like to spend some time with this cow of hers. She shrugs and tucks her data slate under her arm, leading you past a drawn velvet curtain into a long, dark hall. You follow her down a winding stair to a dimly-lit hall flanked by perhaps a dozen sealed doors, each with a small slit in the center, revealing the sparse accommodations: most have been emptied out, left as nothing but bare steel chambers. The last door, though, still has a light on inside.");
	output("\n\nThe mistress stops at the last door on the right, indicating the view slit beneath the nameplate \"Reaha.\" Looking through, you see an overly-busty woman, clearly human once, with her wrists chained to a steel bar, several tubes poking into her back from a vent in the ceiling, pumping her full of some misty pink liquid. Aphrodisiacs, you'd guess. From your vantage point, you can see her over-sized ass pointed toward the door, giving you a perfect view of her sodden cunt and a long, swishing tail tipped with a cute tuft of fur. Her tiny microskirt does nothing to hide her sundered modesty. With a pair of tiny ivory horns growing from her head, a pair of floppy bovine ears, and a pair of absolutely massive tits, it isn't hard to see why the brothel mistress calls her a cow.");
	output("\n\nAs if reading your mind, the mistress says, \"<i>Gene mods. Crazy, right? Why someone'd want to turn herself into a stupid cow, I'll never guess. Anyway, you want a go at her, there's the credit scan,</i>\"  she nods to a box on the wall. \"<i>I'll leave you to it.</i>\"");
	output("\n\nWith that, you're left alone in the long hall.");
	processTime(1);
	clearMenu();
	pc.lust(33);
	if(pc.credits >= 100)
	{
		if(pc.hasCock()) addButton(0,"Vaginal",fuckReahasPussyintheBrothel);
		else addDisabledButton(0,"Vaginal");
		addButton(1,"Ride Strapon",RideReahasStraponAtTheBrothel);
		addButton(14,"Leave",mainGameMenu);
	}
	else
	{
		addDisabledButton(0,"Vaginal");
		addDisabledButton(1,"Ride Strapon");
	}
}



function askAboutBusinessLikeASir():void
{
	author("Savin");
	clearOutput();
	output("You ask the mistress how business is doing, exactly. There's enough people sitting around enjoying the girls on the floor alone to suggest Beth's is doing well.");
	output("\n\nShe shrugs. \"<i>New madame's whipped up a lot of new customers. Old one didn't do much, let the place fall to shit. I was about to put in my two-weeks' when she up and left. Dunno why. But things are picking up again. New girls coming in, old ones going out. Even fixed the surround sound.</i>\"")
	//GET RID OF ZIS BUTTON U CUNT
	flags["HOWS_BUSINESS_BITCH"] = 1;
	removeButton(2);
}


//EXPANSION TIME BITCHES.
//Gettin' you a find slab of MARBLED BEEF
//*sunglasses* YEEEEEEEEEAHHHHHHHHH
function buyYourselfACowslut():void
{
	author("Savin");
	clearOutput();
	
	output("Curious, you ask what the price on the cow-girl's contract is.");
	output("\n\nThe mistress cocks an eyebrow at you, but dutifully flips through a few screens on her slate before making a tsking sound, nibbling on one of her big crimson lips. \"<i>Poor little Reaha here was in pretty deep, but she's been working here for a while, so she's cleared a good chunk of her debt. Let's see… hmm, the boss's got a note here, looks like she'll take five grand for the cow. Pretty good deal for what we paid for her. So what do you say, hun? She in your price range?</i>\"");
	output("\n\n<b>Buying the contract is currently disabled due to unfinished content.</b>");
	
	clearMenu();
	addButton(1,"Nope",noCowslutsForYou);
	if (pc.credits == -5000) addButton(0,"Sure",buyCowslutsForYou);
	else addDisabledButton(0,"Sure");
}


function noCowslutsForYou():void
{
	author("Savin");
	clearOutput();
	clearMenu();
	output("You shake your head, saying that you can't make that deal just now. The mistress shrugs and flicks her datapad idly. \"So, what'll it be, then? Just a go at her, or can I show you the door?\"");

	brothelMainMenu();
}


function buyCowslutsForYou():void
{
	author("Savin");
	clearOutput();

	flags["REAHA_BOUGHT"] = 1;
	flags["REAHA_IS_CREW"] = 1;

	output("Five thousand is… actually ridiculously cheap for a servant, especially one with a lot of gene mods. Reaha must have been working awfully hard to work her debt down that low. You pull out your codex and tap open your banking application. \"<i>Done deal,</i>\" you say, wiring over the five grand. The mistress gives you a look of surprise, eyes wide for a moment before she composes herself.")
	output("\n\n\"<i>Well, that's… great,</i>\" she mumbles, looking down at her slate. \"<i>Huh, what do you know, it actually went through. Well, I guess I'll go get Reaha for you. Here, just sign this, and initial here,</i>\" she says, handing you her data slate and a stylus before trudging off into the lower levels. You shrug and start reading over the debt contract. Standard stuff, mostly: you agree to feed and water your indentured servant, set reasonable means of her earning her keep and paying off her debt, and not expose her to unreasonable harm. In a footnote you see that Reaha herself has agreed to be used sexually, which probably is what landed her here in a brothel to begin with. As you scan through the document, you find a picture attached: the slut herself, massively endowed with breasts that seem to pin her to the floor under their sheer weight, hooked up to milkers as she's being pumped from behind with some kind of pink aphrodisiac. They certainly got their money's worth out of her: the milk those udders must make alone would probably be worth the cost of her contract.");
	output("\n\nYou finish signing the contract just as the mistress returns, guiding the exceptionally busty \"servant\" in front of her. Bare-naked, Reaha's human at first glance, save for the pair of cute little cow-horns just poking through her long, strawberry hair. Her curves, though, are certainly the product of gene-mods: an ass and hips to die for, butt jiggling lewdly with every step, hips sashaying seductively as she approaches. Her breasts, though, were clearly her goal in modification: her arms are hooked under the obscenely large, perfectly shaped orbs for support, though nothing can stop them from bouncing with even the slightest motion. They're not nearly as big as your first look suggested, though; perhaps they change size if she's milked or not? Interesting.");
	output("\n\nReaha stops about a foot in front of you, looking sharply away from you as the mistress takes back her data slate and reviews the signed contract. \"<i>Hmm, alright. Everything looks good, " + pc.mf("Mister","Miss") + " Steele. Alright, then, she's yours. And now I can finally start moving the new girls in downstairs,</i>\" she adds with a note of satisfaction, starting to gather up her belongings from the desk.");
	output("\n\nAs the mistress works, you turn your attention to your new servant, looking her over. She continues to meekly avoid meeting your gaze, though the bare slit of her womanhood is clearly dripping with excitement. Finally, after a long moment passes, you introduce yourself. \"<i>I'm [pc.name],\" you say, \"<i>You're with me now. Understood?</i>\"");
	output("\n\n\"<i>Yes, " + pc.mf("master","mistress") +",</i>\" Reaha says, staring pointedly at her feet. She takes a long breath, barely holding back a shudder as the mistress accidentally brushes her bare skin.");
	output("\n\nTurning back to you, the mistress takes out a long metal box and hands it to you. On the top is a cartoonish label of a massively endowed brevan male surrounded by fawning women of a variety of races. \"<i>Aphrodisiac patches. Less invasive, though perhaps less effective, than the direct injections we've been using to keep her quiet. Make sure to keep up with changing them or she'll likely become... agitated. The same goes for milking her, unless you like your cow-sluts nice and immobilized by their giant tits. The patches help with that, too. She gives her best milk when orgasming, we've found. Isn't that right, cow?</i>\" she asks, pinching one of Reaha's big nipples hard enough to make her whimper and wince -- and draw forth a big drop of milk, which the mistress wipes off on her tit.");
	output("\n\nSuddenly, Reaha looks up from the floor, finally meeting your gaze. \"<i>" + pc.mf("master","mistress") +", may I speak freely?</i>\"");
	output("\n\nWith the fiery look in this cow-girl's eyes, you reckon she's about to explode. You could tell her to get it off her chest this once, and then it's back to being a meek little milk-whore for you; or, you could give her blanket permission to speak her mind from now on. No sense in her keeping thoughts to herself while she plays the slave, right? Right?");

	pc.credits -= 5000;

	clearMenu();
	addButton(0, "This Once", oneTimeReahaBlammy);
	addButton(1, "Always", reahaISFREEEEEEE);
	addButton(2, "No", shutUpYouBovineSlutIDidntJustPayFiveGrandForABacktalkingBitch);
}


function shutUpYouBovineSlutIDidntJustPayFiveGrandForABacktalkingBitch():void
{
	author("Savin");
	clearOutput();
	clearMenu();

	output("\"<i>No,</i>\" you answer, \"<i>Now come on, let's get you to the ship.</i>\"");
	output("\n\n\"<i>I… yes, "+ pc.mf("master","mistress") +",</i>\" she sighs, looking back down again  as you lead the way to the door.");
	output("\n\n\"<i>Good riddance,</i>\" you hear the mistress mutter behind you as you make your way out, and back toward the [pc.ship].");
	addButton(0, "Next", reahaWantsToKnowWhatsUp)
}



function oneTimeReahaBlammy():void
{
	author("Savin");
	clearOutput();
	clearMenu();

	output("Seeing Reaha clearly has something to say to the brothel mistress, you give her a nod, \"<i>Fine. This once. But don't think you're gonna mouth off on me.</i>\"");
	output("\n\n\"<i>You got it,\" the cow-girl says, just a moment before practically hoisting her erstwhile mistress over the desk by the collar of her blouse. \"<i>Listen up you bimbo piece of shit, I am sick and </i>fucking<i> tired of being called a dumb cow or a big-titted whore. I did NOT sign up for this to be hooked up to a bunch of machines and pumped full of drugs until I could barely think, and then left to rot for days between some horny john coming in and using me. My contract said I was down to fuck, not to be whored out. And I am </i>really<i> sick of your shit-eating superior attitude, slut. You are NOT fucking better than me, and no amount of latex fetish-wear is ever gonna change that. Oh, no... you are the lowest form of life in this fucking universe; and even with all these gene mods, you're a hell of a lot less human than I am. You had better thank your dear and fluffy lord I am getting the fuck OUT of here, because the next time I got my hands free, I was coming for your smug little bitch ass. And if you call me a cow again, so help me I will come down on you like the hand of God. Do. You. Get. Me?\"");
	output("\n\nWith a face etched with clear and present terror, the mistress slowly nods. Scowling with contempt, Reaha lets the woman go, and she flops to the ground as the naked cow-girl turns to you and says, \"<i>Sorry about that. Can we go?</i>\"");

	addButton(0, "Next", reahaWantsToKnowWhatsUp)
}


function reahaISFREEEEEEE():void
{
	//BRINGS YOU BACK TO THE SHIP. TAKE NOTE, FUCKNOXO
	author("Savin");
	clearOutput();
	clearMenu();
	currentLocation = "SHIP INTERIOR";
	flags["REAHA_FREE"] = 1
	pc.personality = pc.personality - 5;
	if (pc.personality <= 0) pc.personality = 0;

	output("\"<i>Sure,</i>\"  you say, \"<i>I'd rather you speak your mind from now on.</i>\"");
	output("\n\n\"<i>You're going to regret that,</i>\"  the mistress snickers.");
	output("\n\n\"<i>You got it,\"  the cow-girl says, just a moment before practically hoisting her erstwhile mistress over the desk by the collar of her blouse. \"<i>Listen up you bimbo piece of shit, I am sick and </i>fucking<i> tired of being called a dumb cow or a big-titted whore. I did NOT sign up for this to be hooked up to a bunch of machines and pumped full of drugs until I could barely think, and then left to rot for days between some horny john coming in and using me. My contract said I was down to fuck, not to be whored out. And I am </i>really<i> sick of your shit-eating superior attitude, slut. You are NOT fucking better than me, and no amount of latex fetish-wear is ever gonna change that. Oh, no... you are the lowest form of life in this fucking universe; and even with all these gene mods, you're a hell of a lot less human than I am. You had better thank your dear and fluffy lord I am getting the fuck OUT of here, because the next time I got my hands free, I was coming for your smug little bitch ass. And if you call me a cow again, so help me I will come down on you like the hand of God. Do. You. Get. Me?\"");
	output("\n\nWith a face etched with clear and present terror, the mistress slowly nods. Scowling with contempt, Reaha lets the woman go, and she flops to the ground as the naked cow-girl turns to you and says, \"<i>Sorry about that. Can we go?</i>\"");
	output("\n\nWith her clearly heart-felt farewells out of the way, you take your busty cow-girl out of the brothel and back to the ship. It's a long walk, and she gets no shortage of looks and cat-calls as she walks naked down the corridors, but she refuses the offer of a jacket or robe even from passing strangers, and after a while you can clearly see the excitement dribbling down her thighs. Looks like she gets off on it. Kinky.");
	output("\n\nAs you get back to the docks, Reaha finally breathes a short sigh and says, \"<i>So… sorry about the outburst. When I went into debt, I didn't think the 'yes, I'm okay with sex' check box meant 'please whore me out and pump me full of sex drugs till I'm a mindless fuck toy begging for the D from strangers.' Fuckin' assholes. I'm probably going to be addicted to that shit forever, now. That's great,</i>\"  she grumbles, tearing open one of the aphrodisiac pads and slapping it on her shoulder. She shudders and sighs as she walks, clearly becoming more aroused and relaxed by the second, breath ragged by the time you get to the dock.");
	output("\n\nYou're near the airlock now, and you punch in your access code as Reaha sighs, planting her hands on her hips. \"<i>Aaaaanyway, you seem like an alright "+ pc.mf("guy","girl") +". Thanks for letting me at least speak my mind. Playing the horny slut for a couple years was pretty brutal. I guess some guys are into it, though. So yeah, umm... thanks for that,</i>\"  she says, awkwardly offering you a hand. You shake it as the airlock finishes cycling, and guide your new crew member aboard. You find an empty cabin and guide her in. Sparsely furnished as it is, the smile on Reaha's lips tells you it's a big improvement over being shackled up in a dungeon.");
	output("\n\n\"<i>Nice. So, uh, you're not gonna tie me up or anything, right? Not that I mind a little rope play, I mean, but... let's not do the whole handcuff me to the wall for hours at a time, okay? With all these fucking patches, I gotta wank it like, all the time or I'll go crazy.</i>\"  You nod your agreement, and Reaha positively beams, \"<i>Oh man, I can FINALLY fap and milk myself! Thank god!</i>\"  she cries, practically jumping with joy.");
	output("\n\n\"<i>Oh, speaking of milk,</i>\"  she says, cupping her big, squishy breasts, \"<i>Just shout if you want a little cream in your morning joe, or even by the glass. It tastes like normal cow milk, I promise; the human stuff's icky. Although... I spent like, a bajillion creds on these things, but... if you happen to run into something that, say, changes what milk I'd make, I'm </i>totally<i> into that. You want me squirting honey or chocolate milk or whatever, just gimme the mod. Otherwise... I'm all yours... "+ pc.mf("master","mistress") +"\"</i>, she says playfully as she stretches out on the bed.");
	output("\n\nYou nod, and tell her to get settled in.");

	
	processTime(60+rand(4));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


function reahaWantsToKnowWhatsUp():void
{
	currentLocation = "SHIP INTERIOR";
	author("Savin");
	clearOutput();
	clearMenu();

	flags["REAHA_FREE"] = 2;

	output("You step out of the brothel and into the crowded streets of the station, leading your nude cowgirl back toward the docks. It's a long walk, and she gets no shortage of looks and cat-calls as she walks naked down the corridors, but she refuses the offer of a jacket or robe even from passing strangers, and after a while you can clearly see the excitement dribbling down her thighs. Looks like she gets off on it. Kinky.");
	output("\n\nAs you get back to the docks, Reaha finally breathes a short sigh and, looking over your shoulder, you can see her tearing off a swatch of pink patches from her back, scratching at the reddened skin where the aphrodisiacs were pumping into her. \"<i>Hey, toss a couple more of those my way, would ya? I'm getting antsy, here… fucking whores probably got me hooked on that shit for life, at this rate.</i>\" You hesitate a moment, eyeing your newly purchased sexual servant, and that's all the time she needs for that rage you saw in her eyes to fizzle right back up.");
	output("\n\n\"<i>What!?</i>\" she huffs, arms crossing under her massive bust, \"<i>Look, I've been playing the lust-addled cow-girl for fucking years now, and I'm goddamned sick of it, okay? Look, I'll keep my smart-ass-ness to myself, but don't look at me like I'm some dumb bimbo slut, alright? Now gimme those stupid patches before I start hearing colors or something, and we can all go back to me pretending I'm a good little sex slave while you fuck me six ways to sunday.</i>\"");
	output("\n\nYou shrug and toss the patch box to her, and Reaha quickly covers herself in bright pink drug-stickers. A moment later, her face flushes and she gets a big, dopey smile as her cunt starts to drool obscenely. She shivers when you touch her shoulder, guiding her into the airlock to your ship. \"<i>Sorry, "+ pc.mf("master","mistress") +". I get angry without enough of, uh, this,</i>\" she mumbles, itching her shoulders. You ruffle her strawberry hair, leading her down toward an empty cabin. She flops down on the bed, tits jiggling obscenely, the flesh bouncing so rhythmically that you can't help but stare. With a lazy yawn, Reaha says, \"<i>Oh, by the way… I paid, like, a bajillion credits for this sexy body -- which you should totally come over here and use, cuz I need a good fucking -- but if you want me to lactate something other than delicious cow milk, just toss me the gene mods and I'll use 'em. I did chocolate milk for about a year, and that was pretty hot. Kinda sticky, though… anyway, just thought you should know.</i>\"");
	output("\n\n\"<i>Riiight,</i>\" you say as the cow-girl closes her eyes, drifting off. You figure you ought to let her get adjusted to her new arrangement.");	

	processTime(60+rand(4));
	clearMenu();
	addButton(0,"Next",mainGameMenu);

}
	




function fuckReahasPussyintheBrothel():void
//Fuck Reaha's Pussy in the Brothel
{
	clearOutput();
	author("Savin");
	output("You drop a hundred-cred chit into the little slot on the wall, and with a pneumatic hiss, the door  deepest inside Beth's Big-Breasted Brothel slides open. A tiny timer starts ticking down from 10 minutes, and with a nod from the guard in the hall, you step into the room. The door slides closed behind you, and the lights of the room flicker brightly, letting you get a good look at your companion. Suspended a few feet away, with wrists bound to a wrought-iron bar and back stuck with dozens of pink needles, all connected to tanks on the ceiling, is a woman. A small screen above her displays the name Reaha just above your timer.");
	output("\n\nReaha is just a touch over five feet tall, with exceptional curves in all the right places... mostly her tits. Looking at your sultry companion, your eyes are instantly drawn to the massive, milky melons on her chest, each so heavy that she's permanently affixed to the ground, held immobile by the sheer weight of her tremendous titflesh. She smiles faintly over her shoulder as you approach, hips swaying seductively as she asks, \"<i>Oh </i>finally<i> someone's here! Please tell me you want some of my milk... I've got soooo much saved up for you!</i>\"");
	output("\n\nYou slip behind the girl, lowering yourself down onto your [pc.knees] to get on her level. She shivers with excitement, grinding her plump derriere against your crotch as you pull off the tiny micro-skirt she's got on, revealing the military tattoos stenciled on her big butt cheeks, marking the ex-army bitch for the indebted slave slut that she is. Seeing her cunt already drooling on your britches, you toss your [pc.lowerGarments] aside, revealing your [pc.cock].");
	output("\n\nLetting it flop in between her big ass cheeks, you thrust into her crack, making the milky slut moo in pleasure, her cheeks tightly squeezing your prick. Hot-dogging away, you reach around her busty frame to grab her over-sized teats, fingers locking around the puffy nipples atop each. With the slightest squeeze, a flow of the purest white gushes out around your grasp, wetting the floor with her lactic lust. Reaha moans huskily, hips humping back with abandon as you start to milk her, slathering your hands with creamy streams. And it's only going to get messier...");
	output("\n\nDelivering an encouraging slap to the slave slut's jiggly ass, you rear back and line your [pc.cock] up with her sodden box, pressing your head in so close that you can feel her slick need on your shaft, so eager and needy, her sex demanding your cock. After all, how can a whorish cow give her milk without a big, fat cock buried inside her?");
	output("\n\nYou push in gently at first, letting the wanton wench moan lustily as your cock slides home, spreading the cum-soaked walls of her quivering quim wide around your thrusting manhood. She whimpers with ecstasy, biting her lip as your hips push in against her. With every inch, the unstoppable flood of milk pouring from Reaha's tits increases, more like a pair of hoses in your hands than a woman's tits. These gene mods are insane... but you're not complaining! You ram home inside her, feeling the lips of her womb kiss the tip of your [pc.cock] as your hips settle against her tattooed ass cheeks.");
	output("\n\nYour fingers sink into her soft, pliant kiester, squeezing Raeha's bubble butt as her tits go onto auto-pilot, squirting away without need of your hands. Like a burst dam, once this slut gets going, there's no stopping it! But hey, that leaves you free to get your pleasure from the slave girl. You didn't pay a hundred creds just to milk a cow, after all!");
	output("\n\n<i>\"Mmm, milk me harder!\"</i>  the cow-slut moans, clutching futilely at the bars shackling her hands, trying to hold herself steady as you start to pound her whorish cunt, your [pc.cock] thrusting harder and faster until you can feel her lubricant pouring out around your pounding prick, urged on by the sweet release of her cream and the constant stream of aphrodisiacs pumping into her veins from the tubes on the walls. You've barely gone for a minute by the time she cums for the first time, screaming -- or rather, bellowing -- a loud moo as her pussy clamps around your dick, trying to milk you as much as you're milking her.");
	output("\n\n<i>\"You like that, milk-slut?\"</i>  you jeer, spanking her again. She moos and groans in response, thrusting her hips back against you, trying to get at even more of your shaft. Well, she clearly wants it. You fuck her harder, grabbing her hips to hold her fast and hammering in, humping that milky slave-girl like you've never done before. She cries and bellows, milk spurting from her tits in greater gouts, so powerful they seem to be lifting her up; you could swear you can SEE them deflating, milked for everything they've got.");
	output("\n\nThe cow-slut practically collapses when she cums again, cunt spasming as you sink yourself in deep. Left hanging limply from her bar, she can only moo pitifully as you continue to fuck her. You're damn well getting your money's worth, and you've still got several minutes left before your time's up. Reaha's tits continue to unleash their milky load, pouring so much that the little drains on the floor can't even begin to keep up. They clearly weren't expecting YOU when they built this place!");
	output("\n\nReaha's chest heaves as she cums again, body too exhausted to even react more than a shudder and a squirt of fem-cum that plasters your groin. Her tits are almost emptied by now, and your time is starting to run out. The arc of white delight pouring from her massive teats is winding down, now more a trickle than a flood, but as you sink yourself ");
	if (pc.cockVolume(0) > 180)
	{
		output("as deep as you can ");
	}
	else if(pc.balls == 0)
	{
		output("all the way ");
	}
	else
	{
		output("balls deep ");
	}
	output("into her, she finally arches her back again and, casting a gaze over her shoulder, groans, <i>\"M-make me cum again. Pleeeeeaaasseee,\"</i>  she says, wiggling her ass about as seductively as she can while she's dripping white with milk, her cum and your pre leaking liberally from her well-abused twat.");
	output("\n\nWell, that's a request you're happy to grant. Giving her delectable rump another rough squeeze, you give yourself over to your most primal instincts, kicking it into overdrive as you pound her pussy with wild abandon. Reaha cries and groans, milky teats exploding with one last mighty gush as you hammer in, cockhead kissing the suckling maw of her womb before with a mighty roar you bust your nut, screaming your pleasure as you cum, and cum, and cum, painting the cow-slut's walls [pc.cumColor] with your pent-up seed.");
	output("\n\nReaha squeals and cries, eyes practically crossing as you thrust your seed deep into her dripping cunt, splatting her with your cum. With a grunt of effort, you pull out after what you think is the last burst, only to shudder and groan as another hot spurt of [pc.cumColor] blows from your slit, smearing onto Reaha's big booty, practically marking her as your slut in the most feral way possible, leaving her well and truly fucked, dripping your seed onto the milk-spattered floor.");
	output("\n\nNearly collapsing from sexual exhaustion, you stumble back from the panting cow-slut, watching with pride as her body convulses, cunt drooling a thick web of feminine slime as you try and get to your [pc.feet]. With a final sigh, you give the milky whore a decisive swat on the bum, leaving that tattooed ass bouncing as you leave. Behind you, Reaha moans, <i>\"T-thank you... maybe I'll see you again? I mean, come back soon...\"</i>");
	pc.credits -= 100;
	processTime(10+rand(4));
	pc.orgasm();
	//Clears menu data
	clearMenu();
	//Set up a button: first argument is the button index 0 to 14 for the first page.
	//Second is button name
	//Third is destination function - don't include ()'s
	//addButton(0,"Repeat",exampleGrinding);
	addButton(0,"Next",mainGameMenu);
}


function RideReahasStraponAtTheBrothel():void
//Ride Reaha's strapon at the brothel!
{
	clearOutput();
	author("Savin");
	output("You drop a hundred-cred chit into the little slot on the wall, and with a pneumatic hiss, the door  deepest inside Beth's Big-Breasted Brothel slides open. A tiny timer starts ticking down from 10 minutes, and with a nod from the guard in the hall, you step into the room. The door slides closed behind you, and the lights of the room flicker brightly, letting you get a good look at your companion. Suspended a few feet away, with wrists bound to a wrought-iron bar and back stuck with dozens of pink needles, all connected to tanks on the ceiling, is a woman. A small screen above her displays the name Reaha just above your timer.");
	output("\n\nThe slut looks over her shoulder at you, barely able to see over her own huge ass and flowing strawberry hair. She's utterly immobile, unable to do much more than stare as you approach: her wrists are chained to an iron bar, and her tits... they're huge: big enough to pin her to the floor, a pair of perfectly rounded orbs straining under their milky weight. Reaha smiles faintly over her shoulder as you approach, hips swaying seductively as she asks, <i>\"Oh </i>finally<i> someone's here! Please tell me you want some of my milk... I've got soooo much saved up for you!\"</i> Well, with tits like that, she's probably got enough saved up for half the station. You approach her, sliding a hand appreciatively across her expansive backside, thumb brushing across a big marine tattoo chiseled into her right cheek, hinting at the whore's former occupation. ");
	output("\n\nYou dig your fingers into her rump, rolling the cow-girl over onto her back. She gives a startled yelp, groaning as her arms twist around in their restraints; the misty-pink-filled tubes flop around her as Reaha comes to rest with her back as much against the wall as it can be. She looks up at you with hazy blue eyes, thrusting her chest out, making her huge tits jiggle obscenely in her lap. You straddle the cow-girl and grab one of her massive orbs, pinching the wide areola just enough to make her leak a thin trail of milk which arcs between your [pc.legs], spattering onto the floor. Reaha gives a soft moan, back arching as you keep the pressure up, slowly lowering yourself down to her level and taking the gushing teat into your mouth. The flow of her milk is ceaseless, making your cheeks bulge before you can swallow her sweet cream: it tastes just like a cow's, too!");
	output("\n\n\"<i>You went all out on these mods, didn't you?</i>\"  you tease, pulling your lips off her nipple just long enough for the stream of cream to utterly soak your [pc.chest]. You give a mock <i>tsk</i> as she soaks your gear with her breastmilk, giving Reaha a playful slap on the thigh before standing again, divesting yourself of your [pc.gear]. She stares up at you, tits still dribbling milk as you shed your gear and, with a seductive smile, step over to a table nearby, covered with sex toys just for someone like yourself. You run your fingers slowly over the collection of dildos on display, imagining each of them crammed into the bustyslut's every hole -- and yours. Casting a look Reaha's way, you see her visibly gulp as your fingers brush across one particularly large specimen, a double-sider about as thick as your arm, with a thick leather strap to hold it in place like a big, floppy plastic cock. Perfect.");
	output("\n\nGrabbing the over-sized toy, you step over to the bound cow-slut, looming over her. Reaha lets out a quiet little whimper as you turn the big ol' dildo over in your hands appreciatively. When you lean down, she tries to inch away, but her bindings stop her... and the spreading pool of moisture on the floor, seeping from her sodden box tells you she's practically dying to feel this bad boy's girth inside her. You slip into Reaha's lap, moving her oversized tits out of the way to expose the soaked slit of her snatch. Her entire body quakes as you brush your fingers along her slit, and she practically cums on the spot when your thumb touches her prominent bud: her whole cunt clenches down, smearing your hand with fem-slime. Good god, what are they pumping her with?");
	if (pc.libido() > 40)
	{
		output(" And where can you get some?");
	}
	output("\n\nNow that she's... suitably aroused, Reaha only pants and moans as your fingers slip into her slick slit, gently probing her, stretching her ever so slightly as you bring the crown of the plastic toy to her milky breast, giving it a nice white coating to ease the insertion. She still tries to back away from the big, purple cock when you bring it down towards her sex, but her hips inch forward, humping against your fingers, desperate for release. Well, you're sure this'll give it to her.");
	output("\n\nYou line the milk-soaked crown up with Reaha's soaked box and ram it in. She throws her head back and screams, tits bouncing and spurting as she cums, fem-spunk gushing out around the massive dildo as you push it deep into her, stretching her out wide. Her breasts jiggle and bounce, pouring their liquid load all over you as you push the dildo deeper and deeper into the screaming slut until she can't physically take any more. You're pretty sure she cums a second time, still on the heels of the first, as you get the plastic cock settled in her well-stretched vag. Finally, her screams die down, leaving her hanging heavily from her chains, breathing hard. You pat her soft teat, shifting between her splayed legs as you tie the leather belt around her hips, tying the cock into her, leaving it pointed up like a flagpole, just ripe for you. Rubbing a bit of milk between your fingers, you slip them down to your own [pc.asshole], smearing your puckered hole with Reaha's natural lube. You shudder as a finger pushes it into you, gently glazing your inner hole with a thin creamy layer before you grab Reaha's shiny new cock and lining it up with yourself. ");
	output("\n\nThe cow-slut whimpers with anticipation as your [pc.hips] slide down toward the shimmering crown of her plastic cock. You give her a reassuring pat on the head, wrapping your fingers around one of her tiny bovine horns as you feel the first hint of pressure on your [pc.asshole].");
	if (pc.ass.looseness <= 2)
	{
		output(" No matter how much you relax, though, you know taking this massive ogre cock isn't going to be easy, no matter how much milk you smear on it. You grit your teeth and do what you can, pushing down on the gigantic rod until you can feel the very tip of it pushing up into you.");
	}
	else
	{
		output(" You groan as the tip of the tremendous tool pushes against your clenched behind, slowly forcing your well-stretched anus to open wide and accept its gigantic girth.")
	}
	output("\n\nReaha cries out as you downward thrust pushes the dildo deeper into her, hammering its other head into her cervix. Your grip tightens on her horns, pulling her down into your [pc.chest] as you start to slide down the girthy dildo rammed up your [pc.asshole].");
	output("\n\nIt's a long, slow ride down the strapon's length. You groan and sigh, back arching as you take inch after inch, anal muscles spasming and clenching wildly, trying oh so desperately to push the invading shaft back out: which just makes it feel so much better.");
	if (pc.hasCock() == true)
	{
		output(" Your [pc.cock] jumps to half-erection as the tower of plastic rolls past your prostate, milking you with every inch until until the first dribbles of [pc.cumColor] seed bubble up from your [pc.cockHead], smearing across Reaha's milk-slick skin to mix with her pearlescent cream.")
	}
	buttChange(50,true,true,false);
	output("\n\nIt feels like minutes pass before your [pc.butt] comes to rest in Reaha's lap, her strapon cock firmly embedded all the way up your ass, just huge enough that you can feel your stomach bulging as the crown stretches your [pc.skin] taut. You let out a low, feral growel as you come to rest, finally letting go of the poor cow's horns to stroke the great swells of her milk-full breasts, bringing one of them to your lips. She gives a soft little moan as you lock your lips around her wet teat, suckling just hard enough to get her going -- and it doesn't take much until the sheer pressure in her tits keeps her flowing and flowing, bulging your cheeks faster than you can swallow.");
	output("\n\n\"<i>So full,</i>\" she groans, arching her back as you drink of her. \"<i>Never... never milk me enough. Ahhhh, so good....</i>\"");
	output("\n\nIs she going to...? You wince as the strapon moves inside you, spurred on by Reaha's convulsing cow-cunt. You grin and suckle harder, gently biting her big teat as your hand moves to molest her other breast, squeezing it until the white cream flows over your fingers. Reaha cries out, her voice breaking into an animalistic scream of unchecked pleasure as she cums, her boobgasm spreading visibly from her massive tits down to her wide-spread pussy; you can see her muscles squeeze and grind on the plastic shaft, desperately wringing it as the cow convulses in orgasmic ecstasy. Her cries die down into a long, throaty \"<i>Mooooooooo</i>\" as she comes down from her second climax, head rolling back against the wall as she desperately pants, chest heaving in your grasp.");
	output("\n\nYou take that as a sign to get moving yourself. You wrap your arms around the exhausted cow, bracing yourself against her massive bust as you slowly lift yourself a few inches off her lap, your breath catching as your stomach seems to deflate, left with a hollow emptiness as the ogre cock slides out of your gloriously stretched asshole, all the way to the flared head, leaving you feeling so... so hungry for it. It's almost an unconscious decision when you ram yourself back down on the cow's plastic prick. Reaha groans as the toy shifts inside her, her voice building to an echoing cry as you grab her great big nipples, squeezing them hard as you bounce on that huge, gut-stretching rod, humping against Reaha harder and harder as her strapon pounds your ass.");
	output("\n\nYour breath comes ragged as you ride the massive plastic cock, bouncing until even Reaha's whining with lust, desperately straining against her manacles as the aphrodisiacs flood her veins and the cock inside her shifts and slides against her slick channel. \"<i>G-gaaahhh, no mooooooooo</i>\" she groans, moaning oh so sweetly as you drive her dildo into her with every thrust, \"<i>D-don't make me cum agaaaain!</i>\"");
	output("\n\nOh, you wouldn't miss that for the world. You twist her teats hard, making her yelp in pleasure and pain as you pick up the pace, fucking yourself on that glorious plastic shaft as hard as you can. Reaha's powerless to do anything but buck her wide hips back against you, suddenly thrusting her strapon right up your ass. You scream as your stomach visibly bulges, distorted by the sheer size and depth of the false cock pounding your [pc.asshole]. You try to push her down before she can jackhammer you over the edge, but her great big milky tits get in the way; you just end up with two handfuls of breast squeezed between your fingers, spraying your [pc.chest] with milk as the moaning cow slams her hips as far into you as she can.");
	output("\n\nYou cum hard. Screaming at the top of your lungs, you feel the dildo slam into you, finally driving you over the edge, taking Reaha with you as you savage her teats. Both your backs arch as your [pc.chest] mashes into hers, slathering you with breastmilk as your [pc.asshole] squeezes the strapon with all its might, pleasure shooting through you like an electric current");
	if (pc.hasCock() == true)
	{
		output(" straight to your [pc.cock], as the limp member suddenly flushes with cum, exploding a hot load of [pc.cumColor] all across the cow's milky chest");
	}
	output(". The cowgirl gasps and cries as your [pc.hips] slam down on her plastic cock, slapping her back down to the floor and shoving her end right back up her soaked slit until she's positively crying, stomach distending as she takes the whole of her half in one stroke.");
	output("\n\nYou hump furiously, desperately wringing every last ounce of pleasure you can from your anal orgasm, pounding Reaha's squirting cunt with every thrust until with a shrill cry she cums <i>again</i>, spurting fem-spunk in thick webs around the massive dildo cramming in her. Nearly collapsing from sexual exhaustion, you pull yourself off the milk-slick dildo, stumbling away from the panting cow-slut and watching with pride as her body convulses, cunt drooling a thick lake of feminine slime as you try and get to your [pc.feet]. With a final sigh, you give the milky whore a decisive swat on the hip, leaving her with a nice, thick cock buried up her twat: she seems almost picturesque with the big floppy purple prick wagging in her crotch, like it was meant to be there.");
	output("\n\nBehind you, Reaha moans, \"<i>T-thank you... maybe I'll see you again? I mean, come back soon...</i>\"");
	output("\n\nYou knew she'd enjoy that. Dirty girl.");

	pc.credits -= 100;

	processTime(20+rand(4));
	pc.orgasm();
	//Clears menu data
	clearMenu();
	//Set up a button: first argument is the button index 0 to 14 for the first page.
	//Second is button name
	//Third is destination function - don't include ()'s
	//addButton(0,"Repeat",exampleGrinding);
	addButton(0,"Next",mainGameMenu);

}












