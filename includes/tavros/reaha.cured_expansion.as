import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;

//Author: Savin
//Coder: Mostlynoxo

//Content Overview / Major Changes / Plans

/*So, Reaha's gotten rid of her addiction. She's feeling a lot better -- about herself, about life, and about you the PC. Here's what's up:

Reaha can wear clothes. She can equip the same items and item types the PC can. You can give her outfits, and each day she'll randomly pick several items she's been given to wear. You can ask her to wear specific items all the time (like a cute cow outfit). 
She sells her milk to pay off her debt. Over time, the PC will get credits from Reaha up to 5,000 Credits. Once 5k is hit, Reaha stops giving you money and buys her contract back out. She will, however, stay with the PC (see: "Freeing Reaha") below.
Reaha gets ALL NEW sex scenes, plus sleep with and talk scenes. 

The new Reaha content, below, REPLACES all previous Reaha content. The only things that stay the same, and can be carried forward, are:
>Give Reaha milk mods

Replace all previous Reaha modes as follows:

//FEN NOTE: FUCK THESE. MAKIN MY OWN
>SlaveReaha: Reaha hasn't paid off her contract yet. Default. 
>FreedReaha: Replaces previous FreeReaha version. Reaha is no longer the PC's slave, but is instead a willing crewmember. 

Planned Sex Scenes:
w/ Dick:
	Anal
	Vaginal
	Titfuck
No Dick
	Strapon
	Cowtongue Oral

I'd love to do more BDSM and Dom/Sub stuff with her, too. Maybe get Third to throw some ideas my way? 
*/


/* FLAGS SHIT:
	REAHA_BOOTED
		1 = kicked off.
	REAHA_DEBT_FREED
		1 = paid off her debt and freeloading.
		-1 = forever paying off an infinite debt, you jackass.
	REAHA_FAMILY_RESULT
		1 = Encouraged to contact her little sister.
		-1 = Discouraged from contacting little sister.
	CURED_REAHA_NT_TALK
		1 - "Ew"
		2 - "Natural"
		3 - "Man Up"
*/

public var REAHA_INV_SLOT_MAX:int = 55;

public function reahaBooted():Boolean
{
	return (flags["REAHA_BOOTED"] == 1);
}
public function curedReahaInDebt():Boolean 
{
	return (flags["REAHA_DEBT_FREED"] != 1);
}

//Addiction Cure Capstone: No More Patches (Content Transition!)
//reahaConfidence at 75 or better. Reaha Addiction at 0%. Happens the next time the PC sleeps aboard ship after Addiction 0.
public function reahaIsAStrongIndependantMilkSlootWhoDontNeedNoPatches():void
{
	clearOutput();
	reahaHeader();

	output("As you’re kitting up and stepping out of your quarters, you hear a loud and obvious flushing sound coming from down the corridor, towards the crew quarters. Rubbing the sleep out of your eyes, you start walking that way, ");
	if(crew(true) > 1) output("interested in finding out which of your crew decided to keep the door open while using the restroom");
	else output("intent on dressing Reaha down for leaving the door open");
	output(". Who does that?");

	output("\n\nYou stop at the door to Reaha’s cabin, and find it stuck open on an empty, half-crushed box of her pleasure patches. You shove the door open and pick up the empty box, looking it over with a cocked eyebrow. You don’t know if you’ve ever seen one of these boxes empty, much less discarded so lightly. Reaha always sends them back in for a refill the moment she runs out. Come to think of it, as you walk into her spartan quarters, you can’t see any of her spare boxes lying around.");

	output("\n\nThe sound of the toilet flushing again brings your attention back to the matter at hand. You walk through Reaha’s quarters, over to the half-cracked bathroom door, and rap your knuckles against it.");
	output("\n\n<i>“Reaha, you okay in there?”</i>");
	output("\n\nYou hear a rustling inside, and after a moment, your bovine companion pokes her head out and gives you a huge smile. <i>“Great, [pc.name]! Everything’s great!”</i>");
	output("\n\nYou cock an eyebrow at her, and after a moment of fidgeting, Reaha relents and opens the door a little wider. Inside, you can see several boxes of pleasure patches - every one you’ve seen and then some - lying open and empty on the deck. When you ask what she’s doing, Reaha answers proudly: <i>“I’m flushing ‘em. All of ‘em!”</i>");
	output("\n\nYou blink away your surprise. <i>“That’s... that is great, Reaha. I’m proud of you,”</i> you say, watching as the busty cow dumps the last of her patches into the toilet and flushes them away. <i>“What brought this on?”</i>");
	output("\n\n<i>“Well,”</i> she says, chewing on a lip. It takes her a moment to put her thoughts to words, during which she tosses the empty box contemptuously into the disposal chute. <i>“I woke up this morning, and I was gonna slap one on, but then I thought, ‘What do I need this for? I can feel just as good with [pc.name]... [pc.heShe] makes me feel more alive than these ever could!’ I think I’ve had enough lust-drug for one lifetime!”</i>");
	output("\n\nYou reach ");
	if(pc.tallness > reaha.tallness + 4) output("up");
	else if(pc.tallness > reaha.tallness - 4) output("down");
	else output("over");
	output(" and put an encouraging hand on Reaha’s shoulder, saying again how that’s great and that you’re proud of her - she’s really kicking that addiction! She smiles and squeezes your hand between her cheek and shoulder, her tail flicking around behind her like a well-pet ausar’s.");

	if(pc.isNice()) output("\n\n<i>“So, what’s the plan now?”</i> you ask her.");
	else if(pc.isMischievous()) output("\n\n<i>“Now that you’ve kicked the habit, what now?”</i> you ask.");
	else output("She might be at your whim, but it doesn’t hurt to find out what she wants after you’ve spent so much time freeing her of her addiction.");

	output("\n\nReaha looks dumbly at you for a long moment, as if the thought hadn’t crossed her mind - as if she’d just met her end goal. <i>“Umm... I don’t know. My skin’s not so sensitive now that I cum just from rubbing on things, so I’ve been looking at some extranet catalogues for clothes. If that’s okay with you, [pc.Master], that is. If you still want me to go around naked while you’re around, I don’t really mind. It’s kind of sexy, honestly.”</i>");
	output("\n\n<i>“But I’d literally kill for a bra. And it gets kind of cold at night, too... maybe a nightgown or some cute cow-print stockings!”</i>");
	output("\n\nNot quite what you were thinking, but that’s a start.");
	output("\n\n<i>“Anyway, if we’re by a clothes shop... or a lingerie shop... sometime, I’d love you forever if you could pick some cute clothes out for me. I’ll send my measurements to your Codex. I’d buy some myself, but I still don’t really have any money.”</i>");
	output("\n\nReaha squeezes past you and out of the bathroom, doing a cute little pirouette to face you again. <i>“Speaking of money! I’ve been thinking, ever since we made that trip back to New Texas. You know, cow-girl milk’s a real delicacy all over Terran space - people pay a lot to drink titty milk, so long as it’s nice and thick like mine. They’ve got these big, elaborate milker barns on New Texas, and I’ve only got my shitty little magic milker, but I still end up drinking or just throwing away most of it anyway, so...”</i>");
	output("\n\n<i>“So?”</i> you prompt, taking a seat on the edge of Reaha’s bed.");
	output("\n\n<i>“So... I was thinking maybe I could sell some of the excess! I only have a few thousand credits on my debt contract - it wouldn’t take very long to finish paying it off, now that I’m not constantly buying pleasure patches. And I’d still have plenty left over for you, of course!”</i> she assures you, slipping down into your lap.");
	processTime(20);
	flags["REAHA_ADDICTION_CURED"] = 1;
	//[No way!] [Sounds good!] [Free Her]
	clearMenu();
	addButton(2,"Free Her",freeTheMoo,undefined,"Free Her","She doesn’t need to work off her contract to you. Now that Reaha’s in such a better place, you’ll just free her of it.");
	addButton(1,"Sounds Good!",approveOfMooPayBack,undefined,"Sounds good!","Tell Reaha that sounds like a good plan. You’ll be happy to let her pay off her debt to you.");
	addButton(0,"No Way!",noWayContractMoo,undefined,"No Way!","No way are you letting the cow get out of her debt. She’s yours for life!");
}

//Free Her
//+5 Kindness, +15 Reaha Confidence
//Tooltip: She doesn’t need to work off her contract to you. Now that Reaha’s in such a better place, you’ll just free her of it.
public function freeTheMoo():void
{
	clearOutput();
	reahaHeader();
	output("<i>“You don’t have to do all that,”</i> you say, stroking the cow-girl’s mane of strawberry hair. <i>“I could just cancel your contract outright...”</i>");
	output("\n\nTo your surprise, Reaha shakes her head emphatically. <i>“No way! I’m so tired of having debts hanging over my head... I don’t need any more, [pc.name]. Even favors. I already owe you so much, and I don’t mean credits. Let me pay you back. Please?”</i>");
	output("\n\nYou suppose you can’t argue with that.");
	processTime(1);
	pc.addNice(5);
	reahaConfidence(15);
	combineReahaDebtPaybackOptions();
}

//Sounds Good!
//+10 Reaha Confidence
//Tooltip: Tell Reaha that sounds like a good plan. You’ll be happy to let her pay off her debt to you.
public function approveOfMooPayBack():void
{
	clearOutput();
	reahaHeader();
	output("<i>“Sounds like a plan,”</i> you say, stroking the cow-girl’s mane of strawberry hair. <i>“It’ll be good for you to have all your debts squared, hmm?”</i>");
	output("\n\nReaha laughs, nuzzling against you. <i>“I don’t think I can ever pay you back. For everything you’ve done. But I can at least square this, right?”</i>");
	processTime(1);
	reahaConfidence(10);
	combineReahaDebtPaybackOptions();
}

//No Way!
//+5 Hardness; -5 Reaha Confidence
//Tooltip: No way are you letting the cow get out of her debt. She’s yours for life!
public function noWayContractMoo():void
{
	clearOutput();
	reahaHeader();
	output("<i>“No way!”</i> you snap, scowling at her. <i>“I’m not gonna let you just walk away like that. You’re </i>my<i> cow.");
	if(pc.isMischievous()) output(" Where else am I going to get my morning milk?");
	output("”</i>");
	output("\n\nReaha huffs, scowling right back at you. <i>“You can’t just keep me forever, dummy! Read the contract - you have to give me a fair way to pay my debt back. And now that I’m not wasting everything I scrape together on patches, I can actually work on paying my contract off. Unless you wanna boot me off the ship to get a real job, you’ve got to let me do </i>something<i> to make money.”</i>");
	output("\n\n");
	if(pc.isAss()) output("Dammit! ");
	output("You suppose you’d better. The last thing you need is to have lawyers crawling up your ass over a sex slave. Something tells you [rival.name]’s family would pro-bono her their entire legal team to waste your time and money.");
	processTime(1);
	reahaConfidence(-5);
	combineReahaDebtPaybackOptions(true);
}

//Combine
public function combineReahaDebtPaybackOptions(restricted:Boolean = false):void
{
	output("\n\nReaha hops out of your lap and grabs her magic milker off her desk. <i>“Speaking of which, I should probably get started: the girls are getting pretty full. Listen, though... thanks again for helping me with those stupid patches. I’d never have gotten anywhere all on my own. Hopefully I can at least make it worth the while for you, [pc.name]. You’ll start seeing some credits from me in no time, I promise!”</i>");
	output("\n\nYou nod your understanding and let the cow-girl get on with her milking, glad to see your efforts having paid off");
	output("... even if that means your pet cow might just slip through your fingers soon");
	output(".");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	//[Next] back to ship menu.
}

//New Appearance Screen
//Replaces Reaha’s previous appearance screen in Cured mode.
public function reahaAppearanceCured():void
{
	clearOutput();
	reahaHeader();
	output("Reaha Hayes is a New Texan human, distinctly bovine in appearance thanks to several costly gene-mods rather than the infamous Treatment. She’s just barely five feet tall, with tremendously wide hips and an ass you could lose yourself in, easily thick enough to sink a hand into. On the right cheek of her butt, she’s got a large tattoo of the Coalition Expeditionary Force’s anchor logo: the only remaining hint on her fleshy, cow-like body that she was once a warrior. Sprouting from her backside, just above her butt, is a slender tail that");
	//if armor or lowerUndergarment:
	if(reaha.isCrotchGarbed()) output(" sticks out of her clothes and");
	output(" swishes absently as you look at her: nearly a yard from tip to base, with a plume of red fur at the end.");

	output("\n\nHer face is still fully human, save for a pair of cute little bovine horns poking out from her flowing, ass-length strawberry hair. ");
	if(reaha.isNude()) output("She’s standing stark naked, despite now being physically able to wear clothes again. Her nudeness doesn’t seem to bether her - indeed, the longer you look at her naked frame, the stiffer her big nipples get, and the more swish she puts into her hips as she walks about. She’s clearly enjoying the attention!");
	// if underwear, no armor:
	else if(reaha.armor is EmptySlot) 
	{
		output("Reaha’s wearing nothing but her [reaha.gear], leaving much of her body on display for you. Her tits ");
		if(!(reaha.upperUndergarment is EmptySlot)) output("jiggle in their confines");
		else output("bounce enticingly");
		output(" with every step, and her ");
		if(!(reaha.lowerUndergarment is EmptySlot)) output("underpants cling tightly to her sex, leaving relatively little to the imagination");
		else output("sex, bare as it is, grows visibly aroused the longer you look at her in her skimpy outfit");
	}
	// if armor:
	else 
	{
		output("Reaha’s wearing " + indefiniteArticle(reaha.armor.longName) + ", finally having trained her body’s sensitivity down enough to wear clothes again. She looks infinitely happier than when you first met her. The longer you look at her, though, the more sway she puts into her step as she walks about.");
		if(reaha.hasLowerGarment() || reaha.hasUpperGarment())
		{
			output(" Under her clothes, you catch hints of her ");
			if(reaha.hasUpperGarment()) output("[reaha.upperUndergarment]");
			if(reaha.hasLowerGarment() && reaha.hasUpperGarment()) output(" and ");
			if(reaha.hasLowerGarment()) output("[reaha.lowerUndergarment]");
			output(".");
		}
	}
	output("\n\nNo longer bound and chained in Beth’s dungeon, Reaha’s able to keep herself milked down enough to stay nice and mobile, though she’s still extraordinarily busty by any human standard. Her breasts are nice and full of [reaha.milk], and Reaha’s more than happy to show her bountiful rack off to you at the slightest provocation, milking herself in the ship’s common areas or pressing them up against you");
	if(!reaha.isNude()) output(" through her clothes");
	output(" whenever you get near enough. You’d estimate your bovine companion’s packing a pair of hefty " + chars["REAHA"].breastCup(0) + "s, each tipped with a big, pink nipple that’ll leak a trickle of [reaha.milk] at the slightest touch.");
	output("\n\nShe has a loose, wet pussy tucked between her legs and ");
	output(indefiniteArticle(ParseText("[reaha.asshole]")));
	output(" between the cheeks of her [reaha.ass], right where it belongs.");
	curedReahaMenu();
	addDisabledButton(1,"Appearance","Appearance","You’re looking at her right now.");
}

//Reaha Selling Milk
//Small chance to play when entering or leaving your ship on a planet.
public function reahaMilkStand():void
{
	clearOutput();
	reahaHeader();
	if(flags["REAHA_WHORING_UNLOCKED"] != 2)
	{
		//Var 1.
		if(rand(3) == 0)
		{
			output("As you’re cycling the airlock, you bump into your busty bovine companion Reaha with a small crate full of milk bottles tucked under her arm.");
			output("\n\n<i>“Hey, babe!”</i> she says, beaming at you. <i>“Just gonna see if I can offload some of this extra milk. I’ll be back before you can blink!”</i>");
		}
		//Var 2.
		else if(rand(2) == 0)
		{
			output("As you’re heading through the airlock, you find Reaha just coming back aboard the ship. She’s got a spring to her step, and a pack of " + (isAprilFools() ? "dogecoins" : "credit chits") + " held tight in her hand. She gives you a wink as she walks by, hefting the sack to show off just how much her delicious bovine milk has managed to earn her.");
		}
		//Var 3.
		else
		{
			output("You notice Reaha sitting next to the airlock");
			if(!reaha.isChestExposed()) output(" with her top pulled off");
			output(", rubbing her rose-colored nipples. You give her a look, and your companion makes a sheepish moan. <i>“I think I’ve been over-using my milker,”</i> she laughs, gently massaging her breasts. <i>“Maybe I could convince you to give me a nice, gentle hand-milking soon?”</i>");
		}
	}
	else
	{
		//Var 1.
		if(rand(3) == 0)
		{
			output("As you’re cycling through the airlock, you’re forced to step aside as a strapping young native man passes by, leaving Reaha’s quarters with an altogether satisfied look on his face. The cow-girl courtesan leans against her doorframe, naked with thighs stained and nipples diamond hard, waving as he leaves.");
			output("\n\n<i>“See you next time,”</i> she calls after him. <i>“Oh hey, [pc.name]. Business is good today!”</i>");
			output("\n\nYou can see that. Good job, Reaha, keep ‘em cumming.");
		}
		//Var 2.
		else if(rand(2) == 0)
		{
			output("As you’re stepping back aboard, you’re greeting with a muffled series of moans and a rhythmic <i>thump-thump</i> of something hitting one of the bulkheads. You’d be alarmed, except you quickly realize that the noise is coming from Reaha’s quarters. Sounds like the cow-girl’s “entertaining” a customer right now.");
		}
		//Var 3.
		else
		{
			output("As you step aboard, you bump into Reaha passing by the airlock. She gives you a hint of a smile, but is busily rubbing her shoulders as she walks.");
			output("\n\n<i>“Sore?”</i> you ask, running a hand along a tense muscle.");
			output("\n\n<i>“Haha, yeah,”</i> she sighs. <i>“Had to handle a group of, uh, real passionate customers. Oof.”</i>");
			output("\n\nYou give her a pat and tell her to hang in there.");
		}
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function reahaPaybackEvent():void
{
	var credits:Number = 250+rand(501);
	if(flags["REAHA_WHORING_UNLOCKED"] == 2) credits = 400 + rand(601);
	if(flags["REAHA_PC_PAY"] == undefined) flags["REAHA_PC_PAY"] = 0;
	if(flags["REAHA_PC_PAY"] + credits < 5000) getCashFromTheCow(credits);
	else reahaFinishesPayingPC(credits);
}

//Get Cash from Cow
//SlaveReaha gives you money once per week, up to C5,000.
public function getCashFromTheCow(credits:Number):void
{
	clearOutput();
	reahaHeader();
	if(flags["REAHA_WHORING_UNLOCKED"] != 2)
	{
		output("<i>“Hey, [pc.name],”</i> Reaha says, giving you a tug on the arm as you’re passing her quarters. You stop and turn your attention to your bovine companion. She gives you a smile and pulls a small " + (isAprilFools() ? "dogecoin" : "credit chit") + " out ");
		if(!(reaha.armor is EmptySlot)) output("of her pocket");
		else output("of her desk drawer");
		output(", handing it off to you.");

		output("\n\n<i>“Here you go: your cut of my milk sales! Spend it in good health and all that.”</i>");
		output("\n\nYou nod and swipe the chit through your Codex. After a moment of digital beeping, the device chirps out that you’ve just had ");
		output(credits + " credits transferred to your account. Not bad!");
		
		pc.credits += credits;
		flags["REAHA_PC_PAY"] += credits;
		if(flags["REAHA_PC_PAY"] > 5000) flags["REAHA_PC_PAY"] = 5000;
		
		if(flags["REAHA_PC_PAY"] < 5000) output("\n\nBy your reckoning, Reaha’s got " + (5000 - flags["REAHA_PC_PAY"]) + " credits left of debt to you. Not all that much, in the grand scheme of things. You suppose your cow-girl concubine will be a free woman before too long at this rate.");
	}
	else
	{
		output("<i>“Hey, [pc.name],”</i> Reaha says, giving you a tug on the arm as you’re passing her quarters. You stop and turn your attention to your bovine companion. She gives you a smile and pulls a small " + (isAprilFools() ? "dogecoin" : "credit chit") + " out of her desk drawer, handing it off to you.");
		output("\n\n<i>“Here you go: your pound of flesh, from me selling mine. Keep on pimpin’, [pc.name]!”</i>");
		output("\n\nYou nod and swipe the chit through your Codex. After a moment of digital beeping, the device chirps out that you’ve just had " + credits + " credits transferred to your account. Not bad!");
		
		pc.credits += credits;
		flags["REAHA_PC_PAY"] += credits;
		if(flags["REAHA_PC_PAY"] > 5000) flags["REAHA_PC_PAY"] = 5000;
		
		if(flags["REAHA_PC_PAY"] < 5000) output("\n\nBy your reckoning, Reaha’s got " + (5000 - flags["REAHA_PC_PAY"]) + " credits left of debt to you. Not all that much, in the grand scheme of things. You suppose your cow-girl concubine will fuck her way to freedom before too long at this rate.");
	}
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Reaha Earns her Freedom
//Play when Reaha’s payments to the PC = C5000.
public function reahaFinishesPayingPC(credits:int = 0):void
{
	clearOutput();
	reahaHeader();
	
	if(flags["REAHA_PC_PAY"] + credits > 5000) credits = (5000 - flags["REAHA_PC_PAY"]);
	flags["REAHA_PC_PAY"] += credits;
	pc.credits += credits;
	
	output("<i>“Hey, [pc.name],”</i> Reaha says, slinking up from behind you with an amount of sashay in her hips beyond even the sultry cow’s norm.");
	output("\n\n<i>“I’ve got a present for you,”</i> she says with a smile, holding up a " + (isAprilFools() ? "dogecoin" : "credit chit") + ". <i>“Guess what this is?”</i>");
	if(pc.isMischievous()) output("\n\n<i>“A " + (isAprilFools() ? "dogecoin" : "credit chit") + "?”</i> you say, returning her smile.");
	else output("\n\n<i>“What?”</i>");
	output("\n\nShe giggles and presses it into your hand, locking her fingers firmly around yours. <i>“That’s the last of it. Should be enough in there to totally clear out my debt... right?”</i>");
	output("\n\nYou pull out your Codex and swipe the chit, letting your bank account soak up all those delicious credits. A digital beep tells you that " + credits + " credits have just been transferred to your account and, at Reaha’s urging, you double check through your list of transactions and tally up. Reaha’s given you exactly 5,000 credits over the last several weeks: enough to pay off her debt in full.");
	output("\n\n<i>“So... that’s it,”</i> she says, her big blue eyes drilling into you. <i>“Right? Am I free to go?”</i>");
	output("\n\nYou suppose that, legally, she is. Your indentured servant is no longer in debt to you. With a heavy heart, you give Reaha an affirming nod: she’s a ");
	if(!silly && !pc.isMischievous()) output("free woman now");
	else output("free range cow now");
	output(".");
	output("\n\nThe reaction you get is hardly what you were expecting: Reaha’s eyes furtively avoid yours as you give her the good news, and she nervously runs her hand along her freckled arm.");
	output("\n\nAfter a long moment of silence, she asks, <i>“So... what happens now? I mean, for me. I don’t exactly have a lot going for me right now. Other than hanging around with you, anyway...”</i>");
	processTime(3);
	//[Go Away] [Stay With Me]
	//[Reaha’s Wants?] [Her Talents]
	clearMenu();
	addButton(0,"Go Away",goAwayYouMilkyMilkSlut,undefined,"Go Away","It’ll be better for you and for Reaha if she takes her newfound freedom and leaves. Who knows if you’ll see her again...");
	addButton(1,"Stay With Me",stayWithMeCureCow,undefined,"Stay With Me","Offer to let Reaha stick around the ship. As long as she can pay for room and board, you’re happy to have your bovine companion along for the ride.");
	addButton(5,"Her Wants?",reahasCuredWants,undefined,"Reaha’s Wants?","Ask Reaha what it is that SHE wants to do.");
	addButton(6,"Her Talents",herTalentsReaha,undefined,"Her Talents","If you want to figure out what Reaha should do next, maybe she needs to think about what it is she’s capable of.");
}

//Her Talents
//If you want to figure out what Reaha should do next, maybe she needs to think about what it is she’s capable of.
public function herTalentsReaha():void
{
	clearOutput();
	reahaHeader();
	output("<i>“What I’m capable of?”</i> she asks, taken aback by the question.");
	output("\n\nYou nod encouragingly, and Reaha’s forced to think for a moment. <i>“I guess... I mean, I guess I’ve got a lot of experience as a whore. Without the bitches at Beth’s tormenting me all day every day, there could be worse jobs. The money’s good - she made a fucking fortune off of me, that’s for sure.”</i> You’re a bit surprised she’d actually think of that as a talent. Would she actually consider whoring again, you wonder to yourself.");
	output("\n\n<i>“Other than that? Well, I don’t know if I could really make a living just selling milk. I’ve loved what I’ve been doing, but it’s hard on my poor tits. And I’d probably need some more mods to produce enough to really support myself like that...”</i>");
	output("\n\nYou give Reaha a look when she mentions modding herself even further, and she visibly winces. <i>“N-never mind. The only other thing I’d be really good for is, like, being a mercenary or something. I’ve got army experience, after all, though I’m not some super-hardcore badass or anything. And I’d like to see them try and crowbar me into combat armor with a body like this...”</i>");
	output("\n\n<i>“Is that all? Come on, you’ve gotta have some hidden talents somewhere,”</i> you urge.");
	output("\n\nReaha shrugs. <i>“I grew up on New Texas, [pc.name]. All I ever really learned was sex-ed and how to work an industrial milker. I just... don’t know. I’m ");
	if(silly) output("just a dumb cow");
	else output("dumb");
	output(", [pc.name]. Can’t really do anything special. I guess I can suck dick pretty well now, I know some about heavy weapons, and I squirt gallons of milk out of my tits. I don’t think that adds up to a really killer resume...”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Go Away",goAwayYouMilkyMilkSlut,undefined,"Go Away","It’ll be better for you and for Reaha if she takes her newfound freedom and leaves. Who knows if you’ll see her again...");
	addButton(1,"Stay With Me",stayWithMeCureCow,undefined,"Stay With Me","Offer to let Reaha stick around the ship. As long as she can pay for room and board, you’re happy to have your bovine companion along for the ride.");
	addButton(5,"Her Wants?",reahasCuredWants,undefined,"Reaha’s Wants?","Ask Reaha what it is that SHE wants to do.");
	//addButton(6,"Her Talents",herTalentsReaha,undefined,"Her Talents","If you want to figure out what Reaha should do next, maybe she needs to think about what it is she’s capable of.");
	addDisabledButton(6,"Her Talents","Her Talents","You just wrapped that discussion up.");
}

//Reaha’s Wants
//Ask Reaha what it is that SHE wants to do.
public function reahasCuredWants():void
{
	clearOutput();
	reahaHeader();
	output("<i>“What do you </i>want<i> to come next?”</i> you ask, eyeing the buxom cow from horn to toe.");
	output("\n\nReaha actually meets your gaze for a moment, smiling weakly. <i>“To be honest... I kind of want to stay here. You’ve been my friend through this whole dumb thing, and I really like being with you. You make me feel ");
	if(reahaConfidence() >= 80) output("like a real person. Like I’m worth something.");
	else output("special. Like I actually have a friend. Someone who’ll look out for me.");
	output("”</i>");
	//Awww, she thinks she's people!
	if(pc.isBimbo()) output("\n\nDoes that mean she like, wants to be a milk slut forever?");
	else if(pc.isAss()) output("\n\nYou have to admit, you’re a little surprised she’d want to stay with her erstwhile [pc.master]. In her shoes, you couldn’t wait to be gone.");
	else output("\n\nDoes that mean...");
	output("\n\nReaha blushes, rubbing at one of her arms. <i>“If you don’t want me to stay, I’d understand. But if you don’t mind me sticking around... I can pull my own weight. Or try, anyway. Keep selling milk to pay for my room and board, maybe? I know I can find some way to not be a burden, [pc.name]. I promise.”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Go Away",goAwayYouMilkyMilkSlut,undefined,"Go Away","It’ll be better for you and for Reaha if she takes her newfound freedom and leaves. Who knows if you’ll see her again...");
	addButton(1,"Stay With Me",stayWithMeCureCow,undefined,"Stay With Me","Offer to let Reaha stick around the ship. As long as she can pay for room and board, you’re happy to have your bovine companion along for the ride.");
	//addButton(5,"Her Wants?",reahasCuredWants,undefined,"Reaha’s Wants?","Ask Reaha what it is that SHE wants to do.");
	addButton(6,"Her Talents",herTalentsReaha,undefined,"Her Talents","If you want to figure out what Reaha should do next, maybe she needs to think about what it is she’s capable of.");
	addDisabledButton(5,"Her Wants?","Reaha’s Wants?","You just wrapped that discussion up.");

}

//Go Away
//It’ll be better for you and for Reaha if she takes her newfound freedom and leaves. Who knows if you’ll see her again...
public function goAwayYouMilkyMilkSlut():void
{
	clearOutput();
	reahaHeader();
	output("With a heavier heart than you might have expected, you tell Reaha that, now that the two of you are financially even, and Reaha’s clearly found at least something to support herself with, she should leave. You can’t take care of her forever - she need to go out there and find her own place in the galaxy.");
	output("\n\nShe listens with wide, placid blue eyes locked on you all the while. When you’re done, there’s a long moment of silence before Reaha sniffles and twists her lips up like she just sucked on something bitter. <i>“Okay,”</i> she says simply. <i>“Yeah, okay. I’ll, uh, I’ll go get packed. That’s fine.”</i>");
	output("\n\nReaha turns on a heel and stomps off. All the usual jiggle and bounce in her step is gone.");
	
	//Confidence < 60 Path:
	if(reahaConfidence() < 60)
	{
		output("\n\nShe vanishes into her cabin, and for a few minutes, you think that’s all settled. Might as well grab your Codex and look up a taxi company to come pick her up. Just when you’re about to hit the message button, though, you hear a loud <i>CRACK!</i> sound coming from Reaha’s quarters. Instinct kicks in, and you toss your Codex away and take off running down the corridor. You almost slide right past her, trying to stop on the too-smooth chrome.");
		output("\n\nReaha’s standing in the middle of her quarters, surrounded by the shattered pieces of one of your ship’s holoscreen projectors. Torn right out of the wall and busted underfoot.");
		output("\n\n<i>“Uh,”</i> Reaha stammers, looking between you and the device. <i>“I-it was an accident. My bag got hooked and... and I know that was <b>really</b> expensive! I’m sorry!”</i>");
		output("\n\nYou squint at her. Is she really...");
		output("\n\nAfter a few minutes of blabbering and fussing, Reaha finally says <i>“I can’t believe I did that! I-I’ve got to owe you, like, at least another five grand for that! I’m so sorry, I’ll-”</i>");
		output("\n\nYou cut her off, saying...");

		processTime(5);
		//[Stay in Debt] [Stay Free] [Leave Now]
		clearMenu();
		addButton(0,"Stay in Debt",stayInDebtCowslut,undefined,"Stay in Debt","She clearly doesn’t know how to live as anything other than a slave at this point. You might as well just take care of her. Let her keep feeding money into your accounts, and keep her around.");
		addButton(1,"Stay Free",stayFreeReaha,undefined,"Stay Free","You had no idea she’d actually be so desperate to stay with you that she’d pull something like this. Reaha’s made her point: let her stick around - how much trouble can she be?");
		addButton(2,"Leave Now",leaveNowYouLowConfidenceCuredCowSlut,undefined,"Leave Now","You’re not falling for her very, very obvious attempts to get you to keep her around. Is she really that dependent on you?");
	}
	//Confidence >60 path
	else
	{
		output("She vanishes into her cabin, and for a few minutes, you think that’s all settled. Might as well grab your Codex and look up a taxi company to come pick her up. You order the taxi, and a few minutes later, Reaha returns to you with her gear all packed up in a duffel bag you’re not sure you’ve seen before. She sits down beside you with a heavy sigh, wrapping her arms around her bag.");
		output("\n\n<i>“I don’t know what I’m going to do,”</i> she admits after a while. <i>“I haven’t been a free woman... I mean, really <b>free</b>... since I was eighteen. For all of a week, maybe. I pretty much bounced right from the military into Beth’s. I’ve always had someone telling me what to do. How to live. What to think. Who to fuck, or fight, or care about.”</i>");
		output("\n\nYou reach over and put a comforting hand on her shoulder. She leans into it, but doesn’t look at you.");
		output("\n\n<i>“Guess I’ll need to find a job, then. How do I even do that? I’ve never... no, don’t tell me. I’ll figure it out. Maybe I’ll go back to Tavros, hook up with some of the girls that used to work at Beth’s. I remember a few of them said they’d stay on station. Probably turning tricks in the red light, still. Just new management: less cunt-y management, I hope.”</i>");
		output("\n\nThe idea of Reaha just going back to prostitution doesn’t exactly leave a good taste in your mouth after all you’ve done for her so far, but... well, what else can she do? You suggest she look into waitressing, or maybe cooking somewhere. Or leverage her service with the Coalition to get a job in security somewhere. Though a five-foot nothing, fleshy little buxom babe like her isn’t exactly intimidating. Maybe she could smother ne’er-do-wells in her tits.");
		output("\n\nShe snickers at the idea, finally turning her gaze to you. <i>“I’ll manage. Somehow. Look... thanks for everything, [pc.name]. I mean it. If it weren’t for you, I wouldn’t have to ask myself these questions - I’d be tied up in a sex dungeon somewhere, or mounted on some gross fat alien’s dick forever. Never really thought I’d be free again after I was stuck in Beth’s. Especially not after the patches started. But here we are! I’ve got a whole life to look forward to now, thanks to you.");
		output("\n\nYou ruffle her strawberry hair, possibly for the last time, and tell her to keep in touch. She nods, just as you get an alert that the taxi is arriving. You grab her bag from her and escort her to the airlock.");
		output("\n\n<i>“Bye, [pc.name],”</i> she says, reaching ");
		if(pc.tallness > reaha.tallness + 4) output("up");
		else if(pc.tallness > reaha.tallness - 4) output("down");
		else output("over");
		output(" to give you a farewell hug. <i>“I l- I’ll see you around, I hope.”</i>");
		output("\n\nYou smile as she departs, slipping through the airlock and sealing it behind herself. When she’s gone, you let out a heavy, weary sigh. Hopefully, she’s able to take care of herself out there. You gave her every chance in the world.");
		//Set Reaha to Booted status.
		processTime(10);
		flags["REAHA_BOOTED"] = 1;
		if (flags["CREWMEMBER_SLEEP_WITH"] == "REAHA") flags["CREWMEMBER_SLEEP_WITH"] = undefined;
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//[Leave Now]
//You’re not falling for her very, very obvious attempts to get you to keep her around. Is she really that dependent on you?
public function leaveNowYouLowConfidenceCuredCowSlut():void
{
	clearOutput();
	reahaHeader();
	output("Reaha looks positively crestfallen, standing in the middle of a bunch of busted circuitry as she is, pouting about being thrown off your ship. But it’s the best thing for both of you, you’re sure - even surer now that she’s pulled this.");
	output("\n\nYou tell her as much, then finish packing her things for her. The taxi arrives a few awkward hours later, and you make sure the cow-girl and all her belongings are safely aboard before shutting the door. You don’t even get so much as a good-bye at this point: she just looks shame-facedly between her feet as the airlock cycles closed.");
	output("\n\nYou let out a long, heavy breath as the taxi departs. That <i>sucked</i>.");
	processTime(4);
	//Reaha leaves crew. Flag as <i>“Booted.”</i>
	flags["REAHA_BOOTED"] = 1;
	if (flags["CREWMEMBER_SLEEP_WITH"] == "REAHA") flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Stay Free]
//You had no idea she’d actually be so desperate to stay with you that she’d pull something like this. Reaha’s made her point: let her stick around - how much trouble can she be?
public function stayFreeReaha():void
{
	clearOutput();
	reahaHeader();
	output("<i>“Okay, okay. You can stay, Reaha,”</i> you assure her, putting a hand on her shoulder.");
	output("\n\nIn the blink of an eye, the almost-tearful cowgirl bounces into your arms, squeezing you like a miniature wrestler. <i>“Thankyouthankyouthankyou!”</i> she blubbers, hugging and kissing you as hard as she can. <i>“I’m so sorry. I just... I couldn’t bear to leave! I love you way too much!”</i>");
	output("\n\nShe...");
	output("\n\nReaha blushes beet-red, only letting you see for a second before burying her face in your [pc.chest]. You sigh, putting your arms around the little cow-girl and letting her get it all out. Looks like you’re going to be watching over her for a while yet.");
	processTime(2);
	//Reaha enters Freed mode. No more weekly payments, the freeloader!
	flags["REAHA_DEBT_FREED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Stay in Debt]
//She clearly doesn’t know how to live as anything other than a slave at this point. You might as well just take care of her. Let her keep feeding money into your accounts, and keep her around.
//+5 Hardness
public function stayInDebtCowslut():void
{
	clearOutput();
	reahaHeader();
	output("<i>“At least that much,”</i> you growl, playing along. Maybe more!”</i>");
	output("\n\nReaha blanches, <i>“M-more?”</i>");
	output("\n\nYou nod. <i>“That was an expensive holo-player. I think you’re going to be working that debt off for a long, long time. And maybe I’ll just start charging you room and board while I’m at it, since you’re such a klutzy cow!”</i>");
	output("\n\nShe nods slowly, but you can’t help but notice the way her tail is swishing behind her like an ausar’s. She really <b>is</b> helpless, isn’t she? Guess you’ll have to keep on taking care of her for now.");
	processTime(2);
	//Return Reaha to Slave mode. Continues weekly payments.
	flags["REAHA_DEBT_FREED"] = -1;
	clearMenu();
	addButton(0,"Next",curedReahaApproach);
}

//Stay With Me
//Offer to let Reaha stick around the ship. As long as she can pay for room and board, you’re happy to have your bovine companion along for the ride.
public function stayWithMeCureCow():void
{
	clearOutput();
	reahaHeader();
	output("<i>“Well,”</i> you offer, putting a hand on Reaha’s shoulder. <i>“You’re free to stay aboard with me.");
	if(pc.isAss()) output(" At least until you figure things out.");
	else if(pc.isMischievous()) output(" Can’t have my favorite cow wandering out of the barn!");
	else output(" Stick around as long as you want. I’m glad to have you.");
	output("”</i>");

	output("\n\nHer eyes light up at the - clearly unexpected - offer. She gives you a big, toothy smile and nuzzles your hand. <i>“Thank you, [pc.name]. I know I should want to leave, to get out and be my own woman, but... I just like being here with you. More than I ever liked being alone.”</i>");
	output("\n\nYou give her a smile in turn as she adds, <i>“I promise I’ll pull my weight around here! I’ll start cooking");
	if(yammiIsCrew()) output(" with Yammi");
	output(" and cleaning, and I can put some of that ol’ tanker training to use on the ship’s weapons. Plus milk! Lots and lots of milk for you");
	if(crew(true) > 1) output(" and the rest of the crew");
	output("! I’ll keep selling the excess to earn my keep, of course.”</i>");

	output("\n\nGlancing around, Reaha snuggles up a little closer and whispers, <i>“Plus my bunk door’s always open for you.");
	if(silly) output(" My back door, too!");
	output(" I definitely don’t want that to change.”</i>");

	output("\n\nYou give her a grin and a slap on that lush little bubble butt of hers, telling her that you’ll be sure to take advantage of her whenever you want. The submissive bovine moos happily, giving you a kiss on the cheek before bouncing off to her cabin, wiggling her hips all the while.");

	output("\n\nMaybe you ought to take her up on that right away...");
	//+30 Lust. Set Reaha to <i>“Free.”</i>
	processTime(4)
	pc.changeLust(30);
	flags["REAHA_DEBT_FREED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


public function curedReahaApproach():void
{
	clearOutput();
	reahaHeader();
	output("You make your way down to Reaha’s quarters, and find her door open with Reaha sitting ");
	if(reaha.isChestGarbed()) output("topless");
	else output("as naked as ever");
	output(" on her bed. The huge-breasted cow-girl glances up when you enter and flips her magic milker off. ");
	if(reaha.isChestGarbed()) output("Taking a moment to get decent again");
	else output("Unhooking herself");
	output(", Reaha turns to you with a ");
	if(reahaConfidence() < 60) output("demure");
	else output("bright");
	output(" smile, tail swishing. <i>“Hey, [pc.name]. What’s up?”</i>");
	curedReahaMenu();
}

//New Reaha Menu Shizzle
//moo.
public function curedReahaMenu():void
{
	//These replace Reaha’s old menu options when she’s been cured of her addiction. Both Free and Slave Reaha use these new options; some may be exclusive to one mode or the other.

	//[Milk Reaha] [Talk] [Sex] [Give Clothes] [Give Items]
	//[Sleepwith] [Hug Reaha] [Boot Reaha]
	clearMenu();
	addButton(0,"Milk Reaha",milkCuredReaha,undefined,"Milk Reaha","Time to milk your resident cow.");
	addButton(1,"Appearance",reahaAppearanceCured,undefined,"Appearance","Take a look at your favorite cow.");
	if(pc.lust() >= 33) addButton(2,"Sex",curedReahaSexApproach,undefined,"Have some bedroom fun with the bovine member of your crew.");
	else addDisabledButton(2,"Sex","Sex","You aren’t aroused enough for this.");
	addButton(3,"Talk",curedReahaTalkShit,undefined,"Talk","Sit and chat with your busty bovine.");
	//Hug Reaha
	addButton(4,"Hug",giveYourCuredCowAHug,undefined,"Hug","Give your cow a hug.");
	
	if(flags["CREWMEMBER_SLEEP_WITH"] != "REAHA") addButton(5,"Sleep With",inviteReahaSleepWith,undefined,"Sleep With","Sleep with your cow-girl at night.");
	//[No Sleep With]
	else addButton(5,"No Sleep With",turnOffReahaNightSleepies,undefined,"No Sleep With","Tell Reaha to sleep in her own quarters.");
	addButton(6,"Give Clothes",giveReahaClothes,undefined,"Give Clothes","Give Reaha some clothes to wear.");
	//WearOutfit
	addButton(7,"Wear Outfit",whatOutfitWillCuredReahaWear,undefined,"Wear Outfit","Choose an outfit for Reaha to wear.");
	addButton(8,"Give Item",giveReahaTFItemPresents,undefined,"Give Item","Give Reaha a little present.");
	if (shipLocation == "500") addButton(9, "Boot Reaha", reahaBootOffShip, undefined, "Boot Reaha", "Kick Reaha off the ship. Dropping her off on the homeworld might not be in her best interest, but hey. She’s your property, anyway.");
	else addButton(9, "Boot Reaha", reahaBootOffShip, undefined, "Boot Reaha", "Kick Reaha off the ship. You can send her to hang out on Tavros Station.");
	
	addButton(11, "Take Clothes", whatOutfitWillCuredReahaReturn, undefined, "Take Clothes", "Take back some clothes from Reaha.");
	addButton(12,"DestroyOutfit", whatOutfitWillCuredReahaDestroy, undefined, "Destroy Outfit", "Choose an outfit for Reaha to throw away.");
	
	addButton(14,"Back",crew);
}

//Milk Reaha
//Time to milk your resident cow.
//Coder-senpai should probs read the Give Items stuff first.
public function milkCuredReaha():void
{
	clearOutput();
	reahaHeader();
	var x:int = -1;
	if(pc.hasCock())
	{
		x = pc.cockThatFits(reaha.vaginalCapacity(0));
	}
	output("Sidling up to Reaha, you brush a hand along the curve of one of her over-ample breasts and ");
	if(!pc.isAss()) output("tell her");
	else output("suggest that");
	output(" it’s about time for her to enjoy a nice milking. Reaha perks up the moment you mention milk, and when your thumb flicks ");
	if(reaha.isChestExposed()) output("across one of her bare teats");
	else output("across a stiffening nipple under her [reaha.upperGarment]");
	output(", she lets loose a sensual little moo and swishes her tail excitedly.");

	output("\n\n<i>“Well, if you insist,”</i> she smiles, pressing herself up against you. <i>“I’m never one to turn down a little hands-on attention from my [pc.master].”</i>");

	output("\n\nReaha leans in, pressing her breast into your groping hand. ");
	//ClothedCow:
	if(!reaha.isChestExposed() && !reaha.isCrotchExposed()) output("While you give her a few squeezes to get things started, your other hand reaches around behind her and starts fiddling with her [reaha.gear], starting to peel her clothes off. ");
	output("You feel her teat stiffening under your ministrations, rising to a pebbly, broad plate of tender flesh that beads with [reaha.milkColor] at even the slightest provocation. She’s nice and ready, alright, and one little push sends Reaha sprawling out onto her bed with a startled <i>“moo!”</i> and enough jiggling to make your mouth water. You follow her in");
	if(!pc.isCrotchExposed()) output(", shedding your own clothes as you go");
	output(", crawling up her bare body until your [pc.lips] find a nipple.");

	output("\n\nYou run your [pc.tongue] across her pebbly peak, lapping up the sweet, warm [reaha.milkNoun] droplets you’ve already massaged out. The cow-girl’s back arches, pushing more boobage into your [pc.face] and letting loose a whining little moo. Her thick legs wrap around your [pc.hips], pulling you deeper into her embrace");
	if(pc.hasCock()) 
	{
		output(" until your rapidly-hardening ");
		if(x < 0) output("[pc.cockNoun]");
		else output("[pc.cockNoun " + x + "]");
		output(" is rubbing against Reaha’s bare, slick womanhood");
	}
	output(".");

	output("\n\n<i>“Drink up, lover,”</i> Reaha purrs. You hardly need to feel the wet heat emanating from between her legs, rubbing luridly against your [pc.leg], to know how much your busty cow enjoys your suckling... but it sure doesn’t hurt. There’s something innately satisfying seeing that you’re able to get her just as wet now as those damned patches of hers ever did.");

	output("\n\nWith your mouth latched onto one nipple and a hand roughly squeezing the other breast, your remaining hand’s free to trace down Reaha’s [reaha.belly] and thighs, dipping into her silken honeypot. She gasps and squirms underneath you, clenching her pussylips around your delving digits. Two fingers slip easily into her well-worn slit, leaving your thumb to rub the prominent red mound atop it, and the rest of your fingers to reach a little lower, just enough to brush around her ass and make her squeeze down even tighter.");
	output("\n\nPleasure always makes Reaha’s milk come a little faster, leaving you free to suck lightly on the wide, rosy teat at your lips. It barely takes any effort at all to coax forth a steady stream of [reaha.milk], filling your mouth quick enough that you have to swallow fast to keep your cheeks from bulging. Her other breast squirts and drools sweet cream with just the little pinches and tugs your fingers dish out to her teat. The warm liquid rolls slowly down around your digits, making little [reaha.milkColor] rivers down her jiggling breast and pooling in the valley of her cleavage.");

	//PC Has Cock:
	if(x >= 0)
	{
		output("\n\nWhile you’re busy milking your cow-girl, she’s far from passive. Reaha’s hands at first grip at your ");
		if(!pc.hasWings()) output("back");
		else output("wings");
		output(", trying to find something to hold onto while you lavish her nipples with love. Eventually, though, the constant throbbing of your [pc.cock " + x + "] against her thigh draws her attention. She grins down at you, murmuring something about needing a nice, warm sheath for that slab of meat, before a hand reaches down and wraps around your shaft. Doesn’t take much imagination to figure out what she wants, so you just shift your [pc.hips] back for her and let the cow-girl guide your [pc.cockHead " + x + "] up to kiss her pussylips.");
		output("\n\nYou drive your hips forward, following through on Reaha’s movements to plunge your prick into her waiting quim. Your lover gasps and moans, squirming under you as you slide into her waiting depths. She still knows how to make herself nice and tight for you, massaging every inch of cockflesh you can feed her until you’re nestled all the way inside the slutty little cow’s sex. She moos lewdly, hugging you tight inside and out, murmuring in your [pc.ear] to fuck her good.");
		pc.cockChange();
		output("\n\nLike she needs to ask!");
	}
	output("\n\nYou switch tits, releasing the left with an echoing wet pop and latching on to the right, swirling your tongue around the sodden flesh on her tit to clean it off of the messy excess before you start to suckle anew. The sweet, thick [reaha.milkNoun] floods your mouth, a treat as delicious as it is kinky, drinking it straight from your partner’s tap. Reaha’s breath catches when the first deep draught comes out, running a hand over your [pc.hair] and pushing you deeper into her tit.");
	output("\n\n<i>“That’s the stuff,”</i> Reaha moos softly, holding you tight. Her pussy drools against your crotch, squirting around your thrusting ");
	if(!pc.hasCock()) output("fingers");
	else output("prick");
	output(". It doesn’t take much more to set her off, sensitive as the little cow is: before long, she’s squirming and bucking and squirting under you, moaning your name to the high heavens while she cums.");

	output("\n\nYou push her through the climax, thrusting harder and faster, drinking deeper. When it passes, Reaha flops bonelessly on her back, gasping for breath. But she wouldn’t dream of asking you to stop");
	if(pc.hasCock()) output("; if anything, her quim clenches that much harder afterwards, drawing you in with desperate, milking tightness");
	output(". You’ve got every intention of keeping on until she’s nice and drained.");

	//PC Cock:
	if(x >= 0)
	{
		output(" But Reaha’s intent on making sure you’re milked dry, too. She bucks her hips back against your own piston-thrusts, helping you sink your [pc.cock " + x + "] to the hilt into her welcoming hole, again and again until you feel that familiar tightness welling in your [pc.balls]. The cow-girl is more than experienced enough to sense it as soon as you do, and murmurs sweet nothings in your [pc.ear]: <i>“Cum for me,”</i> she moans, digging her fingers into your back. <i>“Give it to me, baby!”</i>");
		output("\n\nYou do so. With a grunt of beastly effort, you ram yourself womb-deep into the cow-girl’s cunt and let your self-restraint be washed away in a torrent of [pc.cumNoun]. Reaha gasps, then settles into a lusty moo, happily taking every drop you deign to baste her inner walls with. Nothing tops off a good milking than a belly full of cum, you guess.");
	}
	output("\n\nWhen you’re finally satisfied the cow’s been thoroughly milked, you detach yourself from her nipple and lean up to give her a kiss. You feel like you’ve just drank down several gallons, sloshing heavily around in your [pc.belly]. You’re gonna be full for a good long while after that!");
	output("\n\n<i>“So much nicer than the machine,”</i> Reaha yawns, reaching for a towel. <i>“You’re the best, [pc.name].”</i>");
	output("\n\nYou chuckle and give her a pat on the thigh. You had your fun too, after all...");
	processTime(25);
	pc.orgasm();
	pc.milkInMouth(reaha);
	reaha.orgasm();
	IncrementFlag("SEXED_REAHA");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Talk
//Sit and chat with your busty bovine.
public function curedReahaTalkShit():void
{
	clearOutput();
	reahaHeader();
	output("You help yourself to a seat on the edge of Reaha’s bed, patting the mattress next to you. <i>“Have a few minutes to talk, Reaha?”</i>");
	output("\n\nShe gives you a playful grin and plops herself right down in your lap, hooking an arm around your neck and pressing one of her big, milky breasts ");
	if(pc.tallness < 60) output("practically into your face!");
	else output("into your chest.");
	output(" <i>“For you, I’ve got the whole day! What’s up, [pc.name]?”</i>");

	processTime(4);
	clearMenu();
	reahaTalkMenu(curedReahaTalkShit);
}

public function reahaTalkMenu(arg:Function):void
{
	clearMenu();
	//[Family]
	if(arg != talkToReahaFamily) addButton(0,"Family",talkToReahaFamily,undefined,"Family","Ask Reaha about her family.");
	else addDisabledButton(0,"Family","Family","You just did that!");
	//[New Texas]
	if(arg != reahasNewTexasOpinion) addButton(1,"New Texas",reahasNewTexasOpinion,undefined,"New Texas","What’s Reaha’s opinion on New Texas.");
	else addDisabledButton(1,"New Texas","New Texas","You just did that!");
	//[Her Mods]
	if(flags["C_REAHA_MODS_TALK_DISABLE"] != undefined) addDisabledButton(2,"Her Mods","Her Mods","She doesn’t want to talk about that any more.");
	else if(arg != askReahaAboutHerMods) addButton(2,"Her Mods",askReahaAboutHerMods,undefined,"Her Mods","Ask Reaha to explain here modification work in a little more detail.");
	else addDisabledButton(2,"Her Mods","Her Mods","You just did that!");
	//[Her Past]
	if(arg != askReahaAboutHerPast) addButton(3,"Her Past",askReahaAboutHerPast,undefined,"Her Past","Have Reaha regale you with her life’s story.");
	else addDisabledButton(3,"Her Past","Her Past","You just did that!");
	//[Prostitution]
	if(flags["REAHA_WHORING_UNLOCKED"] == 2) addDisabledButton(4,"Whoring","Whoring","She’s a little too busy being a whore to get all cerebral about her time as one.");
	else if(arg != curedReahaProstitution) addButton(4,"Whoring",curedReahaProstitution,undefined,"Whoring","Talk to Reaha about her views on whoring.");
	else addDisabledButton(4,"Whoring","Whoring","You just did that!"); //[Her Job]
	if(arg != talkToReahaAboutHerJob) addButton(5,"Her Job",talkToReahaAboutHerJob,undefined,"Her Job","Job selection go here. Defaults to selling milk; unlock other jobs through talking.");
	else addDisabledButton(5,"Her Job","Her Job","You just did that!");
	addButton(14,"Back",curedReahaApproach);
}


//[Family]
//Ask Reaha about her family.
public function talkToReahaFamily():void
{
	clearOutput();
	reahaHeader();
	//First Time
	if(flags["REAHA_FAMILY_RESULT"] != 1)
	{
		output("<i>“My family?”</i> she echoes curiously when you pose the question. <i>“What do you want to know?”</i>");
		output("\n\nFor starters, how big of a family does she have. Any siblings?");
		output("\n\n<i>“For a New Texan family, mine’s about average I guess. Even with all the birth control medicine the government puts in the water - what? You do </i>not<i> want them to stop that, trust me! Everyone would be pregnant all of the time. Even the men, probably. The Treatment makes sure people are rutting pretty much constantly, so to avoid over-population....”</i>");
		output("\n\n<i>“Anyway! Even with all that, New Texans still tend to have lots of kids. Put your mind to something and nothing stops you, I guess. Certainly didn’t stop my mother. I swear the Treatment must have given her a breeding fetish, the rate she popped me and my sisters out. There’s six of us; no brothers. She was always pretty proud of that. Even prouder that every one of us had a different father. ‘Diversity,’ she called it. Ha! Even then, most of us all look pretty much the same: short, soft, a little on the big-boned side. Every one but me was totally stacked, too!”</i>");
		output("\n\nReaha, not stacked? You cock an inquisitive eyebrow and grope one of her meaty " + chars["REAHA"].breastCup(0) + "s, just hard enough that a little [reaha.milkNoun] ");
		if(reaha.isChestExposed()) output("trickles onto your fingers");
		else output("stains the front of her [reaha.upperGarment]");
		output(". She squeals with pleasure, kicking her legs around in your lap.");

		output("\n\n<i>“Heeeeey. You’re gonna have to clean that up if you keep squeezing!”</i> she pouts, though the way her ");
		if(reaha.isCrotchExposed()) output("bare pussy starts rubbing at you");
		else output("crotch seems to burn with heat, even through her clothes");
		output(", you’re confident she doesn’t want you to stop. So you don’t, continuing to squeeze and knead her over-sensitive tit-flesh. The lusty cow-girl moans, but forces herself to keep talking. <i>“Y-yeah. I was practically - ah! - practically flat by New Texan standards. Only lil’ C-cups naturally. My big sister Serah had, like, G-cups even before the Treatment. They got way bigger after, so big she can’t even wear a top anymore. Just struts around with her tits out, practically screaming ‘Hey bulls, come get a drink... and get your dick wet while you’re at it!’ Not that that’s really unusual on - a-ah! Gentle, [pc.name]! - on New Texas. All my older sisters are prize-winning dairy cow-girls, so busty and milky they practically could feed a planet themselves. Or at least, provide all the milk.”</i>");
		output("\n\nWhile she’s talking, Reaha swings one of her legs around your lower half, bringing herself to face you. With a little wiggle of her shoulders, she entices you all the way into trading your rough hand for gentle, soft lips. She gives out a little moan, rubbing her hefty breast against your face as you start to suckle the sweet, sweet [reaha.milkNoun] from her teat.");
		output("\n\n<i>“I didn’t really have a good relationship with my family. If running away like I did didn’t tip you off. I guess I resented how oversexed my mom and older sisters were. Practically ignored me in favor of getting as much dick as possible, even right in front of me. I saw my mom bent over the kitchen table more often than doing anything around the house. Of course, even that was rare compared to the time they all spent in the milking stalls. With tits like theirs, they had to get drained pretty much all day, every day, or they’d just start spontaneously squirting and cumming themselves just from jiggling around! S-speaking of which, could you, uh, switch to the other one? Gettin’ a little tender there.”</i>");
		output("\n\nYou chuckle and comply, trading one leaky nipple for the other. Reaha moos contentedly and starts to rock her hips a little in your lap, like she’s riding an imaginary cock.");
		output("\n\n<i>“But, uh, yeah. The only one I got along with was my little sister, Mia. She’s a couple of years younger than me, almost eighteen now. I think her dad mighta been that big, burly bull with the soul patch at customs? Anyway, I tried to keep her from getting all sucked up into mom’s milk-and-fuck routine like my sisters did, all so eager to take the Treatment they practically begged for it early. Don’t know if it worked, but I tried. She’s a-a-a sweet little thing. You’d like her. Totally cuter than I am, too.”</i>");
		output("\n\nPopping Reaha’s tit out of your mouth for a moment, you ask how she thinks about her family now that... well, she’s who she is today. After all she’s been through.");
		output("\n\nReaha grimaces, but nevertheless reaches a hand ");
		if(reaha.isCrotchExposed()) output("between her legs");
		else output("under her [reaha.underGarment]");
		output(" when you go back to drinking. <i>“I... I dunno, [pc.name]. Mmmm.... maybe I was kind of shitty to them? No, not the way mom treated me like you’d treat a used rubber after sex. I was just kinda... there... to her. The fun part of me being around had come and gone, now she just had to deal with me living with her. Especially when she realized I didn’t want to grow up to be another milky cock-slut like her and Serah. T-then again, look at me now!”</i> she groans, rolling her head back as you take a particularly deep drink. <i>“I’m talking shit about her while I let my ");
		if(!curedReahaInDebt()) output("former ");
		output("[pc.master] drink right from the tap while I fap");
		if(pc.hasCock()) output(", daydreaming about [pc.hisHer] cock inside me");
		output(". Fuck, what happened to me...”</i>");
		output("\n\nSlavery. Gene mods. Whoring. Definitely not the life path Reaha wanted for herself, you imagine.");
		output("\n\nShe laughs, <i>“No! No, if I wanted to be like I am now, I shoulda just taken the Treatment like a good little mindless whore. Instead I got bought like cattle and turned into one by a slaver. Whoops. At least I met you out of the whole deal.”</i>");
		output("\n\nReaha cups your cheek with the hand not busy playing with herself, breaking your grasp on her tit so she can lean in and kiss you. Her soft lips play gently around your own, tongue flicking out to taste her [reaha.milk] on you. <i>“You really know how to make a girl think, don’t you? Stop it, you’ll make my head hurt!”</i> she teases, giving you a gentle push. You let yourself be put on your back, looking up as the little cow crawls up you and plants her milky chest on yours, gazing down like from atop a mountain.");
		output("\n\n<i>“You know what the important thing is, though?”</i> she asks, brushing your cheek. <i>“I want to be here. And now it’s not the drugs telling me to fuck-jump you");
		if(!curedReahaInDebt()) output(", not even a debt contract");
		output(". The Treatment makes you want things, makes everything seem right and good with the world no matter how fucked up it all is. My older sisters... they didn’t <b>want</b> to see what was wrong with that place, and the second they could just turn their brains off forever and start sucking dick like it was their job, they did. But thanks to you, I get to choose. I suck dick if I want to, and I can stop if I want to!”</i>");
		output("\n\n<i>“T-that actually sounds a lot more New Texan than it did in my head.”</i>");
		output("\n\nYou laugh, grabbing two handfuls of Reaha’s butt and pulling her tight against yourself. She giggles and moos with pleasure, rolling her hips against your firm hands.");
		output("\n\n<i>“I don’t know... maybe I ought to write them. Or at least Mia. I’ve barely said a word to any of them since I left. Could have at least answered their mail...”</i>");

		processTime(8);
		pc.changeLust(4);
		pc.milkInMouth(reaha);
		//[Encourage] [Discourage]
		clearMenu();
		addButton(0,"Encourage",encourageReahaToLearnToWrite,undefined,"Encourage","Reaha should try and get back in touch with her family.");
		addButton(1,"Discourage",discourageReahaFromWritingFamiry,undefined,"Discourage","Don’t tell Reaha to talk to her family. That’ll only bring bad blood back up.");
	}
	//Repeat (If Encouraged)
	//Else repeat normal scene. Confidence +5.
	else
	{
		output("<i>“So Reaha,”</i> you start, brushing your hand along the cow-girl’s strawberry hair. <i>“Did you ever get in touch with your family?”</i>");
		output("\n\n<i>“I did!”</i> she smiles, nuzzling against your hand. <i>“Well, I tried to send my mom an email, but I’m not sure she even knows the extranet exists. Took me a while, but I eventually got my youngest sister, Mia, on a holovid call. Wow, she’s grown! Last time I saw her, she was barely a teenager. Now... just wow! She’s come out <b>so</b> gorgeous!”</i>");
		output("\n\nYou chuckle, saying if Reaha’s any indication, her whole family’s probably gorgeous. The little cow blushes. <i>“Charmer! You’re not wrong, though. Mia was really happy to hear from me, actually. I was honestly expecting her - all of my sisters - to be seriously pissed about me vanishing for years, but she just seemed relieved. Even said that she’d missed me.”</i>");
		output("\n\nReaha sighs. <i>“I cried like a bitch, honestly. Wanted to just sweep her up and give her the biggest hug. She didn’t even say anything about, y’know...”</i> Reaha waves a hand around her little nub horns and more than ample bust. <i>“She totally noticed, though. Probably why she didn’t say anything about the Treatment. Figured I’d gotten it somehow, you know. She hasn’t yet - but it’s almost her eighteenth. So... soon.”</i>");
		output("\n\n<i>“");
		if(pc.isBro() && pc.isTreated()) output("Good. Never have enough cow-girls,”</i> you grin.");
		else if(pc.isBimbo()) output("Ooh, I bet she’ll be just as cute as you, Reaha!”</i>");
		else output("She okay with that?”</i>");

		output("\n\nReaha answers you with an uncomfortable fidget, chewing on her lower lip. <i>“I dunno, [pc.name]. She didn’t say anything about it, but Mia... she’s too innocent for that sort of thing! Even after all this time, she’s still a sweet little girl. Not vapid cow material like my other sisters. O-or me, I guess. I can’t imagine she wants the Treatment, either.”</i>");
		output("\n\nShe sighs and rests her chin on your shoulder. <i>“I’m just glad I got to talk to her, at least. I missed her so much...”</i>");
		output("\n\nYou give Reaha a reassuring pat on the head, telling her it’s all going to be alright.");
		output("\n\n<i>“I hope so,”</i> she whines.");
		processTime(5);
		reahaTalkMenu(talkToReahaFamily);
	}
}

//[Encourage]
//Reaha should try and get back in touch with her family.
//Reaha Confidence +5.
public function encourageReahaToLearnToWrite():void
{
	clearOutput();
	reahaHeader();
	output("You nod encouragingly, telling Reaha that’s the right thing to do. Her mother, for all the things she’s been saying, is probably worried sick for her daughter after all these years.");
	output("\n\n<i>“Yeah, I guess. If nothing else, I’d like to see Mia again. At least one last time before she gets Treated.”</i>");
	output("\n\nThat’s a start, you suppose. Reaha sighs and rises to her knees over you, hooking an arm under her prodigious bust for support. <i>“Thanks for the talk, lover. I think I’m gonna go write an email or two... maybe while I sit on a vibrator, because now you’ve got me <b>soaked</b>!”</i>");
	output("\n\nYou laugh and suggest that you could help her with that...");
	output("\n\n<i>“Maybe in a few minutes. I’ve got to write that email now, or I’ll probably talk myself out of it. Or cum so hard I forget!”</i> She giggles and gives you a peck on the cheek as you get up. Before you go, you at least give her a parting slap on the ass and tell her to be nice.");
	output("\n\n<i>“I’m always nice!”</i> she pouts, sticking her broad tongue out at you.");
	reahaConfidence(5);
	flags["REAHA_FAMILY_RESULT"] = 1;
	reahaTalkMenu(talkToReahaFamily);
}

//[Discourage]
//Don’t tell Reaha to talk to her family. That’ll only bring bad blood back up.
public function discourageReahaFromWritingFamiry():void
{
	clearOutput();
	reahaHeader();
	output("<i>“Nah,”</i> you say, giving one of her tits an affectionate pat. <i>“I think you’re better off without them.”</i>");
	output("\n\n<i>“No doubt!”</i> she smiles, leaning in to give you another kiss. <i>“They might have free reign of all the cock on a planet, but I’ve got a special someone I can depend on. Someone who actually cares about me. I’d take that over a hot dicking any day.”</i>");
	if(pc.hasCock()) 
	{
		output("\n\n<i>“How about </i>with<i> a hot dicking?”</i> you smirk, giving her a swat on the behind that makes her whole, fleshy body jiggle.");
		output("\n\n<i>“Even better,”</i> she purrs, letting you roll her over onto her back, curling her legs up around your [pc.hips]. <i>“Nothing I like better...”</i>");
	}
	//elseif no cock:
	else
	{
		output("\n\nYou might not be able to give out hot dickings, but you can certainly make up for that in other ways. Grinning at Reaha, you grab her by the hips and flip her, putting her on her back and leaning in between her legs, brushing a hand along her plump pussy-lips.");
		output("\n\n<i>“O-oh! Someone who <b>really</b> cares, no less!”</i> she giggles, arching her back as you tease her sex. <i>“Mmm. I’m all yours, [pc.name].”</i>");
	}
	flags["REAHA_FAMILY_RESULT"] = -1;
	curedReahaSexMenu();
}

//[New Texas]
//What’s Reaha’s opinion on New Texas.
public function reahasNewTexasOpinion():void
{
	clearOutput();
	reahaHeader();
	output("<i>“You can guess,”</i> Reaha laughs when you pose the question. <i>“Aside from the Treatment and all the bullshit that goes along with it, I guess it’s not that bad. New Texas is pretty, at least, and peaceful. Way different than cramped, noisy Tavros... there’s fields everywhere, wide open for you to run and play in whenever you want, as far as the eye can see. It’s an agrarian world, mostly farms and stuff except for a few bigger cities near the equator. I grew up around ");
	if(getPlanetName().toLowerCase() == "new texas") output("here");
	else output("Tee’s ranch");
	output(", so that’s mostly what I know. Mom never took us far from the ranch, seeing as she was one of the big dairy girls. Couldn’t go long without a session in the industrial milker, or her tits would swell up like this,”</i> Reaha says, giggling and making a ballooning motion with her arms over her already-impressive chest.");
	output("\n\nShe laughs and shakes her head. <i>“That really was a sight to see. Sometimes a bull she fancied would get her to hold it in for a few <b>days</b>, and mom would get so busty she couldn’t get through the door. She’d just jiggle around everywhere, and the girls and I would try and leave things on the floor, make her have to bend over and just about fall out of her dress. ‘Course, then that bull would come over and pound her so hard her tits would erupt like geysers all over the place! When she didn’t have a bull, or one of my sisters, latched on to ‘em at any rate.”</i>");
	output("\n\nReaha absently rubs at one of her own milky breasts, massaging out a droplet of [reaha.milkNoun]. <i>“New Texas really is... definitely different than the rest of the galaxy. The Treatment made people happy, even if they maybe shouldn’t have been. But it was also so peaceful. Not like Tavros at all. The people there were all so nice to me - that is, when they weren’t bending Mom or one of my big sisters over something right in front of me,”</i> she says with a visible shudder that leaves her tits quaking.");
	//One time choice, or import from old talk scenes:
	processTime(4);
	if(flags["CURED_REAHA_NT_TALK"] == undefined)
	{
		clearMenu();
		addButton(0,"Ew",ewReahaTreatmentIsLikeSuperGrossAndShit,undefined,"Ew","Sympathize with the mentally-scarred cow.");
		addButton(1,"It’s Natural",treatmentShitBeNaturalOnNewTexasSloot,undefined,"It’s Natural","Remind Reaha that that’s just how Treated folk do.");
		addButton(2,"Man Up",manUpReahaYouDumbCumsuckingSlut,undefined,"Man Up","Tell Reaha off - and to suck it up.");
	}
	else reahaTalkMenu(reahasNewTexasOpinion);
}

//Ew
//Sympathize with the mentally-scarred cow.
//+Kindness, +10 reahaConfidence
public function ewReahaTreatmentIsLikeSuperGrossAndShit():void
{
	clearOutput();
	reahaHeader();
	output("<i>“That’s awful,”</i> you say after a moment. <i>“I’m sorry you had to see that.”</i>");
	output("\n\n<i>“Me too,”</i> Reaha says, flashing you a tiny grin and a wry little chuckle. <i>“I basically felt like I was growing up in a whorehouse sometimes... you know, that’s not far from true, really. Especially since they were just planning to turn me into a cum-sucking whore like them. I guess you could just call New Texas the biggest, cheapest whorehouse in the galaxy! No wonder so many men want to move ");
	if(getPlanetName().toLowerCase() == "new texas") output("here");
	else output("there");
	output("....”</i>");
	flags["CURED_REAHA_NT_TALK"] = 1;
	pc.addNice(5);
	reahaConfidence(10);
	combinePostCuredReahaTexasTalk();
}

//That’s Natural
//Remind Reaha that that’s just how Treated folk do.
//+Mischevious, +0 reahaConfidence
public function treatmentShitBeNaturalOnNewTexasSloot():void
{
	clearOutput();
	reahaHeader();
	output("<i>“I guess that’s just natural ");
	if(getPlanetName().toLowerCase() == "new texas") output("here");
	output("there");
	output(",”</i> you say with a shrug. <i>“");
	//if Codex unlocked: 
	if(pc.isBimbo() && pc.isTreated()) output("I don’t care who sees me getting drilled either, after all!");
	else if(CodexManager.entryUnlocked("The Treatment")) output("The Treatment makes sex amazing for the cows, after all, and there’s not a lot of compunction about spreading your legs on New Texas, is there?");
	else output("They say the Treatment makes girls pretty slutty, you know. I didn’t think they meant THAT slutty, but still...");
	output("”</i>");

	output("\n\n<i>“Ugh,”</i> Reaha groans, hugging her arms around herself. <i>“Don’t remind me. I’ll never forget the first time I saw two of my sisters going down on a bull... they didn’t even bother to close the door, and Mom was right there, just making dinner, listening to the... to the </i>sounds<i>. I might as well have grown up in a whorehouse after that... you know, that’s not far from true, really. Especially since they were just planning to turn me into a cum-sucking whore like them. I guess you could just call New Texas the biggest, cheapest whorehouse in the galaxy! No wonder so many men want to move ");
	if(getPlanetName().toLowerCase() == "new texas") output("here");
	else output("there");
	output("....”</i>");
	flags["CURED_REAHA_NT_TALK"] = 2;
	pc.addMischievous(5);
	combinePostCuredReahaTexasTalk();
}

//Man Up
//Tell Reaha off - and to suck it up.
//+Hardness, -10 reahaConfidence
public function manUpReahaYouDumbCumsuckingSlut():void
{
	clearOutput();
	reahaHeader();
	output("<i>“So you saw some unpleasant shit,”</i> you say, scowling at the whiny cow. <i>“Deal with it. The girl I bought out of a cheapo whorehouse doesn’t have a lot of room to judge.”</i>");
	output("\n\nReaha winces. <i>“I guess. I might as well have grown up in the whorehouse, the way Mom treated us. Sometimes I just... I felt like she was </i>training<i> us to be cum-sucking whores, you know?”</i>");
	output("\n\n<i>“I guess she did a good job,”</i> you say, reaching down and swatting the soft little cow on the ass - just hard enough to make her butt jiggle. She pouts and sticks her tongue out.");
	output("\n\n<i>“At least I got paid for it. They just gave it away!”</i> she huffs.");
	flags["CURED_REAHA_NT_TALK"] = 3;
	pc.addHard(5);
	reahaConfidence(-10);
	combinePostCuredReahaTexasTalk();
}

//Combine All:
public function combinePostCuredReahaTexasTalk():void
{
	output("\n\nReaha hesitates a moment before adding, <i>“I don’t want to sound like I hate them or anything. I love my sisters. But they’re not who I wanted to be, you know? Even if that’s where I ended up anyway...”</i>");
	output("\n\n<i>“Y’know, most Treated girls get a bit of a breeding fetish. Or at least, I’ve never met one that </i>didn’t<i> want to be knocked up all the time. It got so bad, the government had to start putting birth control in the water. Even by that standard, my mom was kind of a brood mare,”</i> Reaha says by way of explanation. <i>“And most bulls, well... you’re not really a man on New Texas until you’ve got at least one bastard running around. The governor probably has a hundred!”</i>");
	output("\n\nConsidering where they lived, and her mother’s apparent popularity, you have to ask, <i>“Did Governor Tee and your mother...”</i>");
	output("\n\n<i>“Probably!”</i> Reaha sighs, rolling her eyes. <i>“He used to be real active in the milk industry before he got elected, I think, and considering my mom’s kind of a star there... they at least know each other, for sure. Hell, he could probably be any of my sisters’ dads. It’s not like any of us know who our fathers are. Practically nobody on New Texas does, unless you get a DNA test or something. And to be honest, who cares anyway? Bulls are sweet as candy to any kid, not just their own. I didn’t feel like I was missing out, anyway.”</i>");
	processTime(6);
	reahaTalkMenu(reahasNewTexasOpinion);
}

//[Her Mods]
//Disabled if flags["C_REAHA_MODS_TALK_DISABLE"] != undefined
//Ask Reaha to explain here modification work in a little more detail.
public function askReahaAboutHerMods():void
{
	clearOutput();
	reahaHeader();
	//First Time
	if(flags["REAHA_MODS_TALK"] == undefined)
	{
		//if milkmodded:
		if(flags["REAHA_MILK_CHANGED"] != undefined) output("<i>“You mean aside from the stuff you’ve given me, right?”</i> she teases, hefting up her tits in both hands.\n\n");
		output("<i>“First off, I was born with these,”</i> she says, running a couple fingers along her nubby white horns. <i>“Yeah, I’m a full-blood human, but after so many generations of the Treatment... I guess it’s started to change us New Texans on a genetic level. Or something, I dunno. I’m a cow, not a scientist!”</i> Reaha giggles.");
		output("\n\nAnd aside from that?");
		output("\n\n<i>“Aside from that, everything I had done was designer work. See, the cow transformatives on the market weren’t quite what I was looking for, so... I ended up spending every " + (isAprilFools() ? "dogecoin" : "credit") + " I made in the army, and taking out a bunch of loans... all so I could convince a specialist to make me what I wanted. It’s dumb, I know, but I never felt </i>right<i> in my body until I started modding. Like I was this big, curvy cow trapped in a little beanstalk of a girl. I was actually really fit back then, too - more amazon than squishy lil’ cow. If amazons can be like, five foot nothing. Mini-zon? I dunno!”</i> She giggles, wrapping her arms around you a little tighter. She’s still fairly strong, about squeezing the life out of you until you gasp. <i>“But I’m a lot happier being all soft and curvy. Way more than I ever was as soldier material.”</i>");
		output("\n\nCurious, you ask how Reaha got in touch with a gene-mod designer. That seems a little out of her social league.");
		output("\n\nShe gives you a light-hearted shrug. <i>“I actually found her on an extranet forum. A support group for New Texan girls that go out early, un-Treated. She was this absolutely amazing blonde bombshell, looked more like a cow-girl than most New Texans with all those majestic curves and tits that make mine look small even now. All natural, all kaithrit. I didn’t even know kaithrit lived on New Texas! She said after she got out, she went to some big Terran school on a scholarship, specialized in gene therapy. You’d never know it, the way she purred and jiggled like she was constantly in heat.”</i>");
		output("\n\n<i>“So I got in touch with her, asked her to do the mod work for me. She agreed, but didn’t really understand why I wanted to. Said she wished she had my physique - but then, I wanted hers! I think we would have traded in a heartbeat.”</i>");
		output("\n\n<i>“Sounds like you had a little crush on your friend, there,”</i> you tease, letting a hand run across one of Reaha’s breasts.");
		output("\n\nShe presses in against your hand happily, filling your hand with soft flesh. <i>“Oh, definitely. Didn’t hurt that she’d said elsewhere that her first gene-mod was giving herself a big, fat cock and balls. Or that her GalNet profile was filled with public galleries of her naked. Or of her taking boys and girls over her desk and pounding them for the camera.”</i>");
		output("\n\nReaha flashes you a little smile. <i>“But back then, I was just a big bundle of awkward virgin. Didn’t have the balls to make a move on someone! Nothing like now, where you can just tease my nips a little to turn me into putty in your hand!”</i>");
		output("\n\nYou ");
		if(!reaha.isChestExposed()) output("reach under her [reaha.upperGarment] and ");
		output("pinch her nipples. The cow-girl gives a high-pitched cry, squirts a little [reaha.milkNoun] into your hands, and crosses her eyes in an expression of wanton pleasure. Clearly she’s not <i>entirely</i> back down to human sensitivity!");
		output("\n\n<i>“D-don’t stop,”</i> she murmurs, voice all husky and full of desire. She leans in hard against you, moaning happily as you squeeze and pull on her big teats. Looks like you’re not going to be getting much more out of her like this...");
		flags["REAHA_MODS_TALK"] = 1;
		processTime(5);
		curedReahaSexMenu();
	}
	//Repeat
	else
	{
		output("<i>“Think you could tell me a little bit more about your mods, Reaha?”</i>");
		output("\n\nThe cowgirl gives you a bright smile and presses herself close, enough that her breasts spread out against your [pc.chest]. <i>“Depends! Think you can get through a whole conversation without playing with my tits?”</i>");
		output("\n\nYou give her a look, and Reaha laughs. She leans in and gives you a kiss on the lips, letting it hold for a moment before breaking off. <i>“Not that I mind. I’ll take any excuse to have your hands on me.”</i>");
		output("\n\nShe wiggles in your lap, right up until your grab two handfuls of plushy cow-girl butt and sink your fingers in. <i>“Okay! Okay! Where’d I leave off?”</i>");
		output("\n\n<i>“Wanting to bang a kaithrit scientist,”</i> you suggest.");
		output("\n\nShe grins and sits back in your hands. <i>“Right! So like I said, a lot of my mod work was custom. It had to be. The biggest things for me were getting to be really... soft. Curvy. Maybe even a little pudgy. I had okay tits to start with, but I was real skinny. Muscular. When I got out of the army, I was way too hard looking... I wanted to be a soft little cow, not a big-titted amazon, you know?”</i>");
		output("\n\nConsidering how short Reaha is, you’re not sure she would have ever struck anyone as an amazon. But you get the picture.");
		output("\n\n<i>“The girl I was with - the scientist - she did this computer workup of me. Made some kinda digital drawing of what I might look like after. Pretty much how I look now. But mods are kinda random, you know. Take a few tries to get exactly what you want. And that meant more lab time... more work she was taking off from her company... pretty soon I was penniless, and still didn’t feel <b>right</b>. I talked myself into needing to look like a dairy cow, like mom or my sisters. That I needed to have huge, perfect tits that were sculpted juuuust right. I had to be <b>perfect</b>. Understand?”</i>");
		output("\n\nYou nod. Reaha leans forward again, resting a little more of her ample chest’s weight against you.");
		output("\n\n<i>“Her assistant, a tiny little ausar guy, finally figured out what it was I was missing. It was milk! Of course I couldn’t have boobs like mom’s if they were bone dry. They could get as big as I wanted, but I’d never have the... the fullness of a cow-girl’s. The same kind of bounce and jiggle. Nothing in the world was more beautiful to me, so I started trying to induce. Read all sorts of extranet articles about it. But I could never get more than a trickle going until I finally broke down and sold everything I had for a pile of Milk Gushers and other over-the-counters. I just crammed ‘em all in my mouth like the big, dumb cow I am - got so high I couldn’t see straight afterwards! But my tits plumped out just the way I wanted, started bouncing with every step like a proper cow’s. Like mom’s. I was so happy, I... I ran to go tell my doctor friend.”</i>");
		output("\n\nShe giggles, shaking her head lightly. <i>“I was soooo high, though. I ended up streaking stark-naked through the station, running from security until one of them shock-pistol’d me. Shocked me so good, they said afterwards that milk geysered out like Old Faithful, all over the deck. Apparently all over a couple of leithan businessmen, too. Oh my God, I’d never been so embarrassed when I woke up. Or so horny! My whole body was shivering with how good it felt, how </i>full<i> it was!”</i>");
		//[Next]
		processTime(4);
		clearMenu();
		addButton(0,"Next",reahaModsRepeatPartTwo);
	}

}

public function reahaModsRepeatPartTwo():void
{
	clearOutput();
	reahaHeader();
	output("<i>“Of course,”</i> Reaha sighs, <i>“I woke up in my friend’s bedroom. She’d found out what I did and paid my bail. I gave her the biggest, wettest hug ever... but she was less than happy. I guess she’d realized I’d been paying her with loans when the cops had found I didn’t have a " + (isAprilFools() ? "dogecoin" : "credit") + " to my name left to pay my own way out. Or that my apartment was empty now. I-I’d even pawned the appliances that came with it. My friend was furious. How stupid could I be, chasing rich-chick mods until I was worse than broke? She gave me the worst dressing-down of my life, worse than anything a drill sergeant had ever said cuz she was my friend... and she was <b>right</b>.”</i>");
	output("\n\nThe flirtatiously playful cow-girl’s gone now, you realize. Reaha’s not meeting your gaze anymore, and she’s hugging you tight. You run a hand through her hair and tell her");
	if(!pc.isAss()) output(" that it’s all alright");
	else output(" to pull herself together");
	output(". She sniffles and rests her cheek against you, so you can’t see her face anymore.");

	output("\n\nReaha keeps talking, though. <i>“She asked me how I was going to pay her back for the bail money. How I was going to pay my bank debts. I didn’t know. I’d never even thought... I just assumed everything would be fine and happy when I was just the way I wanted to be. That’s when, I think, she realized I was nothing but a dumb backwater hick who never grew up. That’s what she said, anyway. I cried, but that didn’t make it better.”</i>");
	output("\n\nYour cow-girl takes a deep, steadying breath. <i>“I’m sorry, [pc.name]. This must be awful to listen to. You don’t need a reminder of what a dummy I am. I didn’t mean-”</i>");
	processTime(5);
	//[Continue] [Enough]
	clearMenu();
	addButton(1,"Enough",enoughOfYourShittyStoriesReaha,undefined,"Enough","You’ve heard enough.");
	addButton(0,"Continue",continueToMakeMeSadReaha,undefined,"Continue","Keep going...");
}

//[Enough]
//You’ve heard enough.
public function enoughOfYourShittyStoriesReaha():void
{
	clearOutput();
	reahaHeader();
	output("You shush her, saying that she doesn’t need to keep going. Reaha sighs and nuzzles her cheek against your chest.");
	output("\n\n<i>“I’m sorry. I... I think I need to turn my brain off for a little bit. All I want right now is to be your happy little cow, [pc.name]. Nothing more, nothing less.”</i>");
	output("\n\nA few gentle pets elicits a soft <i>“Moo,”</i> from the cow-girl. You hold her for a while, letting her compose herself until, with a deep breath, Reaha sits back up and flashes you a smile. <i>“Okay! I’m okay. Let’s talk about something happy now, alright? Or you could throw me on the bed for a nice, rough milking... That’s what a good, happy cow’s good for!”</i>");

	processTime(2);
	reahaTalkMenu(askReahaAboutHerMods);
}

//[Continue]
//Reaha Confidence -5
public function continueToMakeMeSadReaha():void
{
	clearOutput();
	reahaHeader();
	output("You pat Reaha’s head and ask her to finish her story. What happened after that?");
	output("\n\nShe groans in your shoulder. <i>“What happened... she said I could pay <b>her</b> back for bail, at the very least. I was still naked, felt tingly and hot all over. I didn’t do anything but moan like a whore when she pushed me back on the bed and pulled out that big slab of dick I’d been drooling over on GalNet. She emptied her balls in me like an animal, again and again until I was a soaked mess. Didn’t even notice she’d taken my virginity, I don’t think.”</i>");
	output("\n\nReaha shudders, but you can feel her nipples getting a little stiffer against your chest. <i>“It was the most amazing thing I’d ever felt... until they put me on patches later, anyway. When she was done... totally drained of every last drop... she got out of bed, threw on a bathrobe, and dropped a " + (isAprilFools() ? "dogecoin" : "credit chit") + " on my cum-stained chest. Told me I’d earned it, the only way a girl like me could. Said I should buy some new clothes and a ticket back to New Texas. Or anywhere.”</i>");
	output("\n\nYou have to ask, <i>“Did you?”</i>");
	output("\n\n<i>“Of course not!”</i> Reaha laughs. <i>“You forgot the part where I’m an idiot. I followed her out, begging her to take care of me... just to be with me. I didn’t know what else to do, so I said I’d do anything to pay her back. To make everything okay.”</i>");
	output("\n\n<i>“I didn’t realize she’d given me a way out. A ‘get out of jail free’ card, covered in cum. I could have taken that money and disappeared. Gone to the fringe across the galaxy. Maybe even started paying off my debt. But I kept badgering her, until she finally said ‘Okay, if you’ll do ANYTHING...’ and then she called the bank. She bought my debt contract that night, made me confirm my details over the comms while she was balls-deep in my asshole. Had to deflower that, too, she said. Break me in. I was... I could barely talk, the feeling was so intense. The guy on the phone could hardly understand me, until my friend spanked me hard enough to make me scream my name.”</i>");
	output("\n\nReaha pulls herself up off your chest and looks you square in the eye. <i>“It turns out she was a personal friend of Beth Carver’s. Did most of the cunt’s mod-work on her slaves. She turned around and sold my contract not ten minutes later - on a holovid call, so Carver could see me bent over the bitch’s desk, leaking kitty-spunk from both holes and... and loving it. I was taking my first john for Beth the next night.”</i>");
	output("\n\n<i>“Why didn’t you tell me this before?”</i> you ask.");
	if(pc.isNice()) output(" <i>“It’s awful!”</i>");

	output("\n\n<i>“I don’t know,”</i> Reaha shrugs. <i>“Because it’s embarrassing? Cuz I don’t like remembering how my best friend took advantage of me, sold me like cattle. Heh, half of me thinks she did it all on purpose. Made the mods take so many tries and cost so much money; played me like a fiddle just so she could sell me off in the end. Wouldn’t put it past someone who works for Beth Carver now that I think about it.”</i>");
	output("\n\nOut of nowhere, Reaha’s eyes light up, and she grabs your cheeks and pulls you into a fierce kiss. She holds on tight to you, moaning softly when you finally break away. <i>“What was that for?”</i>");
	output("\n\n<i>“Cuz I love you, that’s what,”</i> Reaha smiles. <i>“Because you saved me from that, and I know in my heart you’d never hurt me. You’re the most wonderful person I’ve ever met... and I owe you something more valuable than my freedom or my body. You make me happy. Really, genuinely happy like I’ve never been before. So that’s what it’s for: because I love you with all my heart.”</i>");
	output("\n\nYou pull Reaha close and hold her tight.");
	reahaConfidence(-5);
	processTime(5);
	//[Next]
	//Ship menu
	//Lock conversation. Cannot be repeated now.
	flags["C_REAHA_MODS_TALK_DISABLE"] = 1;
	reahaTalkMenu(askReahaAboutHerMods)
}

//[Her Past]
//Have Reaha regale you with her life’s story.
public function askReahaAboutHerPast():void
{
	clearOutput();
	reahaHeader();
	//First Time
	if(flags["C_REAHA_PAST_TALK"] == undefined || flags["C_REAHA_PAST_TALK"] == 2)
	{
		output("When you ask her to tell you her story, Reaha gives you an odd look for a moment before grinning and sing-songing, <i>“Moo! My life is moo. I am moo and you are moo and we are moo together.”</i>");
		output("\n\nYou give her a look, and Reaha rolls her eyes. She swings out of your lap and onto the bed beside you. <i>“Yes, [pc.master]. What do you want to know?”</i>");
		output("\n\n<i>“Let’s start off easy. What did you do between leaving New Texas and");
		//if Misch/Bimbo:
		if(pc.isBimbo() || pc.isMischievous()) output(" turning into a cute little cow");
		else if(pc.isNice()) output("... well, you know");
		else output(" getting sold into slavery");
		output("?”</i>");

		output("\n\n<i>“This!”</i> Reaha answers, rolling onto her belly");
		if(!reaha.isCrotchExposed()) output(", pulling down her [reaha.lowerGarment],");
		output(" and spanking her great big jiggly butt, right on the anchor tattoo on her cheek. The inked cheek quivers in response to the gentle smack, and its owner moans lightly when you reach down to caress the thick slab of rump. <i>“I’m only twenty-one, you know. I haven’t really done a whole lot besides the army and then the whole whoring thing.”</i>");
		output("\n\n<i>“Well, tell me about it.”</i>");
		output("\n\nReaha grins over her shoulder at you, wiggling her butt into your hand. <i>“Right before I turned eighteen, I hopped ship off of New Texas. Well, stowed away might be a better term for it. I sort of put myself in a box and hoped for the best. Lucky me, when the captain found me, he wasn’t too upset. I guess he understood why I’d want to get out of there. He took me all the way to Earth, no charge. Not like I could have paid him anyway - I didn’t really have any money. Which was... sort of a problem when I got to Earth. I didn’t have any skills, and I didn’t know anything about anything other than milk and boobies, so I didn’t really know what I was going to do, until the captain said I ought to think about joining the army. He’d been in the navy, he said, and learned to pilot a ship there.”</i>");
		output("\n\n<i>“Plus they’d feed, house, and pay me for a couple of years, too. That wasn’t a bad deal, either,”</i> Reaha says with a wry little chuckle. <i>“So yeah, I signed up not long after I hit Terra on a two-year contract. Seeing as I didn’t have any particular aptitudes or skills, just New Texan toughness, I got assigned to the Coalition Expeditionary Force when I finished training. Part of a mechanized infantry regiment - that’s not <b>armored</b> infantry, mind you. They didn’t squeeze me into power armor or anything fun like that!”</i>");
		output("\n\n<i>“What did you do, then?”</i>");
		output("\n\nReaha shrugs noncommittally and suggests you squeeze her ass a little more. When you do, she gives you a smile and a moan for your trouble, making a very obvious stain on ");
		if(!reaha.isCrotchExposed()) output("her underwear");
		else output("her sheets");
		output(" from enjoyment.");

		output("\n\n<i>“I didn’t really do anything special while I was in. Just another grunt, you know? I was berthed on the </i>Odyssey<i> while she did a tour of the core, brand new flagship straight out of the Jovian docks. Made it up to lance corporal after a litte more more than a year. Eventually got transferred to an armored support group - a hover-tank with a bombardment cannon. That was a hell of a ride! Never saw combat, though. Mostly just paraded around or did security aboard the mothership. But all in all... honestly, I liked being in the army. I don’t know that I’d call it fun, but it was... it was good,”</i> Reaha says, raising her hips a little. You smirk at her and dig a pair of fingers into the cleft of her sex, making her gasp as you massage your way around the sodden hole.");
		output("\n\n<i>“Why’d you leave, then?”</i>");
		output("\n\nShe grimaces, still rocking her hips against your hand. <i>“They told me I wasn’t allowed to use certain kinds of modifications that I wanted. I had the money for them, at least the first set I wanted to get, but the doctors told me I couldn’t. Things like chest enhancers, some of the ones that got rid of my muscle, made me nice and soft. I understand why, but that doesn’t mean I have to like it. So I didn’t sign back on after my two years were up.”</i>");
		output("\n\n<i>“It wasn’t long after that that I ended up getting pinched over my debt issues. After having to wait so long, I guess I got kind of wild with my mods. I got addicted to taking them, just kept spending more and more until I was just PERFECT... and several thousand in debt. I guess I spent just under a year working for Beth Carver before you ");
		if(reahaConfidence() < 33) output("bought me");
		else if(reahaConfidence() < 66) output("got me out of there");
		else output("rescued me");
		output(".”</i>");

		if(reahaConfidence() >= 33)
		{
			output("\n\nReaha grins and rolls around until she can flop her head into your lap. <i>“Thanks for that, by the way. Being with you is a hell of a lot better than sitting in Carver’s rape dungeon with my legs spread all day. I’m a lot happier here, [pc.name]. Can’t say ‘thank you’ enough.”</i>");
		}
		output("\n\nShe grins up at you, brushing her hand along your crotch. <i>“Now that that’s done, wanna do something more fun than talking?”</i>");
		flags["C_REAHA_PAST_TALK"] = 1;
		//Reaha’s sex menu
		processTime(8);
		curedReahaSexMenu();
	}
	//Second Time
	else
	{
		output("<i>“So...”</i> you say, planting your hands firmly on the cow-girl’s hips. She makes a happy little moo and wiggles them for you, which just makes her chest jiggle enticingly. You draw your gaze away from the tantalizing display of flesh and finish: <i>“Anything else you want to tell me? Maybe from before you left New Texas?”</i>");
		output("\n\nReaha’s lusty grin turns into a pout. <i>“No. I told you, I’m not that interesting. Might as well ask a real cow how it’s upbringing was! All I did on New Texas was try not to spend <b>all</b> of my time watching my mom and sisters get drilled... which was kind of a full time occupation, considering how popular with the bulls they were!”</i>");
		output("\n\n<i>“Come on,”</i> you urge her, massaging her broad hips. <i>“It can’t be that bad.”</i>");
		output("\n\n<i>“It’s not <b>bad</b>,”</i> Reaha sighs. <i>“Just boring. Like I said, my mother was a big-deal dairy cow-girl. Not famous per-se, but important and productive enough that we lived pretty well. Right around Governor Tee’s ranch, so you know how nice the place was. Beautiful, really. Contrary to popular belief, you can have a... more or less normal childhood on New Texas. I went to school like anyone else; wasn’t very popular, unlike my sisters, but I didn’t get bullied or anything really.”</i>");
		output("\n\nYou’re sure Reaha must have been more than completely ordinary. Didn’t she at least aspire to something back then?");
		output("\n\nShe chuckles. <i>“Yeah, of course. I wanted to be a singer more than anything else. I practically worshipped this ausar rock-pop star, Stellara Starr. Collected all her albums, bought into pay-per-view holoconcerts... had my room plastered with her posters. It was kinda dumb, but you know... I thought she was the greatest.”</i>");
		output("\n\nReaha gives a wistful little sigh. <i>“But I have a shitty singing voice. Basically tone-deaf. So that didn’t go anywhere. But it was fun to imagine, for a while. I even started my own little band in high school with a couple friends.”</i>");
		output("\n\nOh, you’d <i>love</i> to hear some of their tracks.");
		output("\n\n<i>“No way!”</i> Reaha blushes. <i>“Let’s, uh, let’s talk about my mommy issues some more or something. That’s nice, right?”</i>");
		output("\n\nRight, right...");
		flags["C_REAHA_PAST_TALK"] = 2;
		processTime(7);
		//Replay Scene 1 next time. Trade off 5ever.
		reahaTalkMenu(askReahaAboutHerPast);
	}
}

//[Prostitution]
//Talk to Reaha about her views on whoring.
//flags["REAHA_WHORING_UNLOCKED"] == 2 == WHORING
//Only available if Reaha’s not currently whoring.
public function curedReahaProstitution():void
{
	clearOutput();
	reahaHeader();
	output("<i>“After working at Beth’s... what’s your take on prostitution now?”</i>");
	output("\n\n<i>“You mean in general, or just for me personally? I guess there are worse ways to make a living than turning tricks on a street corner... so long as there’s nobody keeping you chained up and drugged in a sex dungeon. That was the worst experience of my life. But honestly, the actual sex wasn’t that bad. I certainly have the body... and the libido... for it.”</i>");
	output("\n\nYou cock an eyebrow. <i>“So you wouldn’t mind doing it again?”</i>");
	output("\n\n<i>“Well... I’m <b>good</b> at it. Fucking’s about the only useful skill I’ve got. And if I’m not drugged up and forced into it, it might even be pretty enjoyable. And it’d bring in way more money than just selling my milk. As long as somebody I trusted - like you! - was my, uh, ‘manager,’ I think I’d be alright with it.”</i>");
	output("\n\nHearing Reaha’d be alright with whoring again after all she’s been through makes you pause for a moment, thinking. After a while, Reaha giggles and leans in, wrapping her arms around your neck. <i>“Don’t worry about me, [pc.name]. I’m not about to start taking johns aboard your ship! My little milk business makes me just enough money to get by, as long as you’re nice enough to give me a place to stay. Preferably with a warm, occupied bed. That’s all I need, really.”</i>");
	output("\n\n<i>“But is that");
	if(pc.isBimbo()) output(", like, really");
	output(" all you want?”</i>");

	output("\n\nReaha chews her lower lip for a moment, thinking. <i>“Well... I wouldn’t say ‘no’ to more money, necessarily. I’d love to buy a big ol’ industrial milker. Maybe some cute clothes and new toys. I could find some uses for an extra source of income, sure. But I don’t <b>need</b> it.”</i>");

	output("\n\nShe locks eyes with you, leaning just a little closer. <i>“Look... [pc.name]. If you want to turn your ship into an interstellar whorehouse, I’d be totally okay with that. In fact, just say so and I’ll be your first girl in a heartbeat. But I don’t want to do anything that’d make you uncomfortable with being with me - I’d rather only ever fuck you again than do it with a thousand strangers, if that means losing out on you. I guess after all this, you probably don’t mind used goods like me, but I’m insecure like that.”</i>");
	output("\n\nYou tell Reaha that you’ll think about it. She gives you a quick kiss and murmurs into your ear, <i>“I’m yours to command, [pc.name]. Don’t be afraid to keep me all for yourself, though.”</i>");
	
	//Unlock [Whoring] under her Job talk.
	if(flags["REAHA_WHORING_UNLOCKED"] == undefined)
	{
		flags["REAHA_WHORING_UNLOCKED"] = 1;
		//1st time: 
		output("\n\n<b>Reaha can now be ordered to whore herself out. Talk to her about her job.</b>");
	}
	processTime(5);
	reahaTalkMenu(curedReahaProstitution);
}

//[Her Job]
//Talk to Reaha about her current job.
//Job selection go here. Defaults to selling milk; unlock other jobs through talking.
public function talkToReahaAboutHerJob():void
{
	clearOutput();
	reahaHeader();
	output("<i>“Let’s talk about your work, Reaha.”</i>");
	output("\n\nThe cow-girl huffs at you. <i>“Can’t you think of something more fun to talk about? No? Alright, what’s on your mind, [pc.name]? Right now I’m ");
	if(flags["REAHA_WHORING_UNLOCKED"] != 2) output("selling my milk full-time. It’s not super profitable cuz I’m all on my own, but I make enough to get by since you support me.”</i>");
	else output("your resident on-board call-girl. It’s hard, exhausting work being on my back all day, but I make a lot more money now than I ever have. And to be honest... I enjoy it!”</i>");
	output("\n\n<i>“That said,”</i> she purrs, <i>“you’ll always be my [pc.master]");
	if(!curedReahaInDebt()) output(" in my heart");
	else output(" at least until I’m a free woman");
	output(". Not to mention this is your ship. If you’ve got something else in mind for me to do, I’m all yours.”</i>");
	processTime(4);
	//Set job here
	//[Milk Sale] [Whoring]
	clearMenu();
	if(flags["REAHA_WHORING_UNLOCKED"] == 2) addButton(0,"Milk Sale",setReahaBackToMilk,undefined,"Milk Sale","Tell Reaha you’d like her to focus on her milk business.");
	else addDisabledButton(0,"Milk Sale","Milk Sale","This is her current career.");
	if(flags["REAHA_WHORING_UNLOCKED"] == undefined) addDisabledButton(1,"Whoring","Whoring","You should probably ask her about it first.");
	else 
	{
		if(flags["REAHA_WHORING_UNLOCKED"] == 2) addDisabledButton(1,"Whoring","Whoring","Reaha is already whoring.");
		else addButton(1,"Whoring",reahaWhoringStuff,undefined,"Whoring","Tell Reaha you’d like to have her start selling her sexual services whenever you’re planetside.");
	}
	addButton(14,"Back",reahaTalkMenu,talkToReahaAboutHerJob);
}

//[Milk Sale]
//Tell Reaha you’d like her to focus on her milk business.
public function setReahaBackToMilk():void
{
	clearOutput();
	reahaHeader();
	output("<i>“How about you reign it in a little Reaha. Just focus on selling that [reaha.milk] of yours, okay?”</i>");
	output("\n\n<i>“");
	//if Prostitute:
	if(flags["REAHA_WHORING_UNLOCKED"] == 2) output("Aww, finally get jealous of all those johns having their way with me? ");
	output("All right, [pc.name], for you... anything! I’ll go back to being a wholesome little dairy cow. That’s a lot easier, anyway.”</i>");
	output("\n\nYou thank Reaha for obeying you... not that there was much chance of her not.");

	processTime(2);
	flags["REAHA_WHORING_UNLOCKED"] = 1;
	//[Next]
	reahaTalkMenu(mainGameMenu);
}

//[Whoring]
//Tell Reaha you’d like to have her start selling her sexual services whenever you’re planetside.
public function reahaWhoringStuff():void
{
	clearOutput();
	reahaHeader();
	output("<i>“How about you start taking johns again, Reaha,”</i> you suggest, running a hand along her curvaceous chest.");
	output("\n\n<i>“I did say I’d be alright with doing that again, didn’t I?”</i> the cow-girl muses, leaning into your groping hand. <i>“Well... alright, [pc.name]. Promise me you won’t think any less of me for being, well, even more used goods than I already am - that you’ll still be with me - and I’m honestly on board with turning tricks to make us a little extra cash.”</i>");
	if(pc.isNice()) output("\n\n<i>“If you’re sure, Reaha.”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“Time to put my cow out to pasture,”</i> you laugh.");
	else output("\n\n<i>“You better.”</i>");

	output("\n\n<i>“I just hope you don’t mind the extra through-traffic aboard,”</i> she teases. <i>“Or the noise. But I’ll try not to be tooooo disruptive. That is, if you don’t end up joining in!");
	//PC is femme:
	if(pc.mf("","f") == "f") output(" You and I could make a </i>killing<i> selling double teams...");
	output("”</i>");

	processTime(2);
	flags["REAHA_WHORING_UNLOCKED"] = 2;
	reahaTalkMenu(mainGameMenu);
}


//=======================================================================
//									Sex
//=======================================================================
public function curedReahaSexMenu():void
{
	clearMenu();
	if(pcCanButtfuckReaha()) addButton(0,"Buttfuck",buttFuckReahaSlooot,undefined,"Buttfuck","Buttfuck your cow.");
	else if(pc.hasCock()) addDisabledButton(0,"Buttfuck","Buttfuck","Your dick definitely won’t fit inside her ass, no matter how spacious it looks on the outside.");
	else addDisabledButton(0,"Buttfuck","Buttfuck","You need a penis or hardlight strapon that’ll fit in her ass for this.");
	//Titjob
	if(pc.hasCock() || pc.hasHardLightEquipped()) addButton(1,"Titjob",getATitjobFromCuredReaha,undefined,"Titjob","Have Reaha use those huge, full breasts of her to get you off.");
	else addDisabledButton(1,"Titjob","Titjob","You need a hardlight strapon or a penis in order to do this.");

	addButton(2,"Ride Strapon",rideCuredReahasStrapon,undefined,"Ride Strapon","Have Reaha don a fake donger and fuck your [pc.vagOrAss] with it!");

	addButton(14,"Back",curedReahaApproach);
}
public function pcCanButtfuckReaha():Boolean
{
	return (pc.hasHardLightEquipped() || pc.cockThatFits(reaha.analCapacity()) >= 0);
}

public function curedReahaSexApproach():void
{
	clearOutput();
	reahaHeader();
	output("You take a step closer to Reaha, pushing the curvaceous cow up against the nearest bulkhead and grabbing her hips possessively. She gives a low, husky moan, pressing her hefty breasts against your [pc.chest]");
	if(!reaha.isChestExposed()) output(" through her [reaha.upperGarment]");
	output(".");

	output("\n\n<i>“Feel something you like, babe?”</i> she murmurs into your [pc.ear], wiggling her broad flanks in your grasp and making those epic milkers shake for you. ");
	if(!curedReahaInDebt()) output("<i>“Free woman or not, I’m all yours... always.");
	else output("<i>“I’m all yours, [pc.master]!");
	output("”</i>");
	curedReahaSexMenu();
}

//Buttfuck
//Cock or Hardlight.
public function buttFuckReahaSlooot():void
{
	clearOutput();
	if(reaha.ass.hasFlag(GLOBAL.FLAG_PUMPED) || reaha.ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) showBust("REAHA_ANUSOFT");
	else showBust(reahaBustDisplay());
	showName("\nREAHA");
	author("Savin");
	var x:int = -1;
	if(pc.hasCock())
	{
		x = pc.cockThatFits(reaha.analCapacity());
	}
	output("You let your hands play down Reaha’s big ol’ hips and down to the plush, jiggly curves of her tattooed cheeks. The cow-girl gives a sultry little moo and pushes her [reaha.ass] back against your firm grasp. <i>“Always took you for an ass-" + pc.mf("man","girl") + ",”</i> she teases, brushing your fingers with the auburn tuft on the tip of her tail. The slender little appendage curls around your wrist a moment, then hooks itself into the handle of a drawer near her bunk. You take the hint and reach inside, finding a bottle of lube sitting at the top of the pile of colorful latex toys inside.");
	//Reaha took anusoft:
	if(reaha.ass.hasFlag(GLOBAL.FLAG_PUMPED) || reaha.ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) output(" Not that Reaha really <i>needs</i> lube, the way you’ve turned her asshole into the perfect, succulent fuckhole... but it does make the act that much more pleasurable for the both of you.");
	output("\n\nReah gives you a wink");
	if(reaha.isAssExposed()) output(" and gives her bare butt an inviting swat, making the thick flesh of her ass quake with the impact.");
	else output(", pulling her [reaha.gear] down to reveal her inked ass");
	output(". <i>“Come and get it, captain,”</i> she giggles, slipping from your arms into the bed and presenting her backside for your inspection.");

	output("\n\nYou can’t help but lick your lips as you take in the gratuitous curves of Reaha’s body: the huge, unbound breasts practically sloshing with [reaha.milk]; her overly wide, child-bearing hips; and the jiggling expanse of her [reaha.butt]. The sexy cow-slut grins and reaches back, spreading her cheeks and winking her [reaha.asshole] at you with the kind of control only a veteran butt-slut can hope to manage.");

	output("\n\n<i>“Gonna get me ready, [pc.master]?”</i> she says with marked cock-suredness, rocking back on her knees and rubbing her tail-tip through her inviting crack.");
	output("\n\nOh yeah. Yeah you are. You stalk forward onto the bed behind her, cup one of Reaha’s massive tits, and give it a rough squeeze as you push her forward, forcing her up against the cabin walls. She gives a sharp gasp, twisting to look away as your hand savagely kneads the thick, soft breast, causing the puffy teat at its tip to bead with [reaha.milk]. Her breath catches as she starts to lactate, [reaha.milkColor] rivulets running between your fingers. You press in closer, giving her defenseless neck a hard kiss that ends in a gentle little bite, just enough to leave her pale flesh reddened.");
	output("\n\nReaha surrenders utterly in your hands, her natural submission leaving her as sexual clay to be shaped, molded, and directed by your desires. There’s no opposition, no restraint, in the way she lets your hands and lips wander over her body, answering your caresses and kisses with lusty moans. You lean over her back, letting your [pc.chest] rest against her as your hands go to work: you pour lube into your palm and squirt another shot right into the crack of her ass, letting the cool fluids smear between your bodies and her expansive flesh. Reaha’s breath catches, and then her fingers disappear into her sodden muff, bringing herself a little more pleasure on top of what you’re already doing.");

	output("\n\nThat sounds like an invitation to you. With your fingers coated with a glistening layer of clear, cold lube, you press two of them against the ");
	if(!reaha.ass.hasFlag(GLOBAL.FLAG_PUMPED) && !reaha.ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) output("tight, dark ring");
	else if(!reaha.ass.hasFlag(GLOBAL.FLAG_PUMPED)) output("puffy, dark mound");
	else output("thick, slutty black donut");
	output(" of Reaha’s ass and apply a gentle pressure. With a moaning cry, Reaha’s back arches, tits bouncing in your grasp as she nearly climaxes on the spot, her natural lube flowing freely down her thighs and mixing with the rivers of [reaha.milk] pouring onto the bed.");
	output("\n\n<i>“Aaahhhh, yeessss, harder!”</i> she moans, hips bucking against your probing fingers, working to take your hand deeper and deeper. You’re all too happy to grant that wish, pushing into her clenching ring and moving your fingers to tease and caress her spasming walls, thumb running in circles around her engorged clit. With every thrust you make, her efforts to breathe become harder, chest heaving as you assault her every weak point. You can feel her orgasm coming a mile away.");
	output("\n\nYou manage to shift aside at just the right moment, getting clear as Reaha screams, throwing her head back as her tits bounce and spurt, spraying streaks of [reaha.milkColor] across the bed and bulkhead. Her ass clenches powerfully around your fingers, trying to milk them like a big, fat cock. You answer in kind, pushing yourself deeper until you’re practically fisting the horny slut, pushing in as far as you can through her quivering hole’s well-lubed channel. <i>“Yeah, yeah! Just like that! Just... like... oh, god!”</i> she cries, and suddenly her body seems to convulse against itself, another, more potent orgasm overtaking the first. Her teats rocket to a steady stream, arcing her [reaha.milk] across the cabin to smear wetly on the bulkhead opposite her.");
	output("\n\n<i>“You know you’re gonna have to clean that up,”</i> you tease, still wrist-deep in Reaha’s ass as she slumps back against the wall, breathing hard. She makes a weak moan in answer, knees buckling under the strain of her massive orgasm. You pull her back against your [pc.chest], letting the [reaha.milk]-laden slut lean against you for a moment, her whole body twitching in the aftershock. But you only hold her for a minute - just enough to stroke her long strawberry hair with a gently soothing word while you decide how to get your fun, now that she’s all lubed up and ready for you...");
	processTime(10);
	pc.changeLust(50);
	clearMenu();
	//[Go Rough] [Go Gentle]
	addButton(0,"Go Rough",goddamnSavinsAsslust,x,"Go Rough","Tie Reaha up and pound her asshole.");
	//[Go Gentle]
	addButton(1,"Go Gentle",goGentleIntoThatDarkNightReaha,x,"Go Gentle","Take it easy while you make love to Reaha’s bum.");
}

//[Go Rough]
//Tie Reaha up and pound her asshole.
public function goddamnSavinsAsslust(x:int):void
{
	clearOutput();
	if(reaha.ass.hasFlag(GLOBAL.FLAG_PUMPED) || reaha.ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) showBust("REAHA_ANUSOFT");
	else showBust(reahaBustDisplay());
	showName("\nREAHA");
	author("Savin");
	output("While Reaha’s gasping for breath, nuzzling against your shoulder, you reach into the nightstand and pull out a pair of fuzzy handcuffs halfway into the mound of toys. She looks back at you with eyes blanked with lust, utterly limp in your grasp as you push her forward, planting her face a bare inch from the stained wall she’s left dripping with her breasts’ bounty, and pull her arms behind her back. Realizing what’s about to happen, she resists for the first time, trying to pull her hands free - but her knees just buckle, leaving her defenseless as you tie your milk whore’s hands and secure the link between the cuffs in your grasp.");
	output("\n\n<i>“Now, let’s see that big cow tongue of yours at work,”</i> you say, running an appreciative hand across the great big curves of her tremendous rump, patting the tattooed flanks - and giving your milky servant just enough push toward the wall to put her nose in it. Reaha groans, looking over her shoulder to stare at you with her big blue eyes, her tiny little cow horns just catching the light. You smirk, <i>“Clean it up, and I’ll fuck you again.”</i>");
	output("\n\nThat’s all the encouragement she needs. Reaha’s long, wide tongue slips from between her lips, dragging across the nearest [reaha.milk]-smeared bulkhead, licking up her own orgasm. As a reward, you gently dig your fingers into her big, soft ass, kneading her supple flesh until you can hear her moaning, wiggling her hips as if to entice you further. Such a wanton girl... you give Reaha a quick, affectionate spank, sending her swaying as you ");
	if(x >= 0) output("grind your [pc.cock " + x + "]");
	else output("activate your hardlight strapon");
	output(" into the tight little crevice between her [reaha.butt].");
	//Reaha’s got a huge ass: 
	//pg break; 
	if(reaha.buttRatingRaw >= 15) 
	{
		output("You’ve gotten Reaha’s ass so huge and jiggly now that it positively soaks up your [pc.cockOrStrapon " + x + "], completely enveloping your shaft in quivering butt-flesh");
		if(reaha.buttRatingRaw >= 17) output(" and rubbing her plump ass against you with every motion");
		output(". You could easily just grab the slutty cow’s flanks and fuck her tush, letting her [reaha.butt] get you off all on its own. Hell, she’d probably enjoy it! But you’ve got better things to do for now...");
	}
	output(" She gives a cute little gasp, her well-stretched ass visibly clenching as you run your length through her crack; her pussy is already starting to bead with lube all anew. Silly cow, you’re not interested in that hole...");

	output("\n\nYou give her another sharp spank as your prick drags back through her crack, humping her soft cheeks a few times to rub the excess lube in before pulling back and lining up with the winking black hole of her bum. She gives another grunt of needy desire, but the cow-slut subtly wiggles her big hips, even pushing against your ");
	if(x >= 0) output("[pc.cockHead " + x + "]");
	else output("shimmering hardlight crown");
	output(" ever so slightly. Oh, she wants it bad. You dig your fingers in, holding her swaying ass steady for the final push.");

	output("\n\nYou grit your teeth and thrust in, ");
	if(!reaha.ass.hasFlag(GLOBAL.FLAG_PUMPED) && !reaha.ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) output("fighting against the tightness of the cow’s squeezing ass");
	else output("easily sinking into the spongy, soft grip of her plumped-up pucker");
	output("; she lets out a bellowing moo, back arching as your crown pierces her behind. <i>“Aaaaahhhhh. S-slow down! Lemme get used to iiitttt,”</i> she cries, but you keep a steady pace as your [pc.cockOrStrapon " + x + "] slides into her rump, fingers kneading her fleshy cheeks, keeping her spread wide to ease your entrance. You spend nearly a minute sliding into your cow’s hole, pushing into her clenching, spasming anus until ");
	if(pc.balls > 1) output("your balls slap wetly into her soaked cunt");
	else output("your hips press into her jiggling bum, cock fully buried");
	output(". Reaha groans lewdly, chest heaving as she weakly laps at the [reaha.milk] smeared against the wall. Your rectal ravaging is already making her tits go back into production, dibbling their sweet cargo onto the bed to mix with the feminine slime pooling between her feet. Thank God her sheets are waterproofed!");
	if(x >= 0) pc.cockChange();

	output("\n\nWith your cock sheathed, you give the cow a rough spank, making her clench oh-so-tightly as your hands shift up across her curvy body, reaching around to grasp her hefty teats. Reaha’s sexy groans turn into deep moos as your fingers pinch and squeeze her puffy nipples, urging the trickle into a tiny stream of [reaha.milk] around your fingers. Urged on by her lusty vocalizations, you start to move your [pc.hips], slapping them into her keister as you start to pound her ass. She cries out, back arching and tits bouncing as she buries her face against the wall, biting her lip hard as she tries not to cum too quickly.");

	output("\n\nIf ever she wanted proof positive she doesn’t need those damn patches, this is it: watching her cream herself, tits squirting and body clamping down around you with wild, mindless pleasure. Your hips move faster, cock spearing her [reaha.asshole] again and again until her voice is a cracking cacophony of screams and moans of pleasure.");

	var cumQ:Number = pc.cumQ();
	output("\n\nYou give her another swat on the ass, sending her big cheeks jiggling - and that’s enough to send her over. Reaha’s voice breaks into an unintelligible moo as she cums again, cunt spasming");
	//output(" around her fingers");
	output(" and ass squeezing so tight you’re afraid your cock’ll burst. Her tits stream out even more than before, visibly diminishing as she orgasms hard enough to nearly drain herself, coating your hands and the bed beneath you with what seems like gallons of [reaha.milk]. Her anal squeezing nearly pushes you over the edge, her muscles writhing and spasming wildly as the cow-slut cums and cums; you grit your teeth, trying to hold back, but to no avail. With a primal roar you join her in orgasm, [pc.cockOrStrapon " + x + "] ");
	if(x < 0) output("throbbing with an overload of sensation");
	else output("unleashing a torrent of seed deep into Reaha’s bowels");
	if(x >= 0 && cumQ >= 10000) output(", making her belly bulge with each spurt until she looks massively pregnant");
	output("!");

	output("\n\nWith a sated sigh, you withdraw from the cum-drooling cow");
	if(x >= 0 && cumQ > 10) output(", leaving her with a nice trickle of seed pouring from her behind");
	output(" as she sways listlessly in her bonds, chest heaving as the last of her [reaha.milk] dribbles from her teats. <i>“Aww,”</i> you laugh, letting her down to flop into the sea of her own lactation. She groans weakly as you remind her to clean up after herself, leaving her with a nice pat on her well-abused rump. Her tattoo jiggles obscenely as you grab your kit and leave.");
	processTime(20);
	pc.orgasm();
	IncrementFlag("SEXED_REAHA");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Go Gentle]
//Take it easy while you make love to Reaha’s bum.
public function goGentleIntoThatDarkNightReaha(x:int):void
{
	clearOutput();
	if(reaha.ass.hasFlag(GLOBAL.FLAG_PUMPED) || reaha.ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) showBust("REAHA_ANUSOFT");
	else showBust(reahaBustDisplay());
	showName("\nREAHA");
	author("Savin");
	output("You heft Reaha up, one arm wrapped under her heaving chest, and the other cupping her cheek. She moans weakly, twisting to accept a long, tongue-filled kiss. Her broad hips press back against your groin, rubbing the cum-and-lube-slathered mound of her sex into your crotch. Even in her half-delirious post-climactic haze, she manages to reach back and ");
	if(x < 0) output("flick on your hardlight panties");
	else output("grab your half-hard prick");
	output(", wrapping her fingers around your [pc.cockOrStrapon " + x + "].");
	output("\n\n<i>“Give it to me,”</i> she moans, shifting on her knees to align her lube-leaking hole with your crown. <i>“Fuck my ass, [pc.name].”</i>");

	output("\n\nShe’s wet and ready for you, all but begging. For your part, you lavish her neck and shoulders with kisses, just like the ");
	if(!reaha.ass.hasFlag(GLOBAL.FLAG_PUMPED) && !reaha.ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) output("dark ring");
	else output("plump, whorish donut");
	output(" of her ass is kissing your ");
	if(x >= 0) output("[pc.cockHead " + x + "]");
	else output("shimmering hardlight crown");
	output(". With your hands locked around her, holding the cow’s soft body tight against your [pc.chest], one slow push forward is all it takes.");

	if(x >= 0) pc.cockChange();

	output("\n\nThe cow-girl’s breath catches as you slide inside her, leaving her mouth locked open in a silent gasp of pleasure. Your [pc.hips] inexorably press forward, driving inch after inch of [pc.cockOrStrapon " + x + "] into her hungry hole. In answer, Reaha’s [reaha.ass] pushes back on your turgid shaft and her breasts bounce and quake in your arms, beading with more and more of her lactic bounty. [reaha.Milk] dribbles down the plump curves of her breasts and across your fingers, enticing you to lift a hand up and start massaging her teats, drawing more and more out to spill across the bed.");
	output("\n\n<i>“At least it’s waterproofed,”</i> you chuckle into one of Reaha’s fluffy bovine ears, making her giggle - which turns into a sharp gasp when your cockhead brushes some particularly sensitive spot deep in her ass. Oh, she’s sensitive back here! Your hips start to move a little faster, drawing back through the slutty, sodden grip of her [reaha.asshole] and thrusting deep in again. Every stroke brings another lewd moan to the cow-girl’s lips, punctuated by the echoing slaps of flesh on flesh, growing more intense with every passing moment. Grinning between kisses, you ask how Reaha likes ");
	if(pc.isAss())
	{
		output("taking it up the ass from ");
		if(!curedReahaInDebt()) output("someone who used to own her");
		else output("her owner");
	}
	else output("getting ass-fucked by you");
	output("?");

	output("\n\nShe moos softly, all pretense of restraint evaporating at your question. <i>“I love it!”</i> she breathes, reaching down and grabbing her own breasts, hard enough to make an arch of [reaha.milk] squirt across the bed. <i>“Oh fuck, I love it so much! Give me more, please, [pc.name]! I need it! I need you deeper");
	if(pc.hasCock()) output(" - I need your <b>cum</b> deep");
	output("!”</i>");

	output("\n\nAs if to give credence to her begging, Reaha’s ass starts clenching hard around your [pc.cockOrStrapon " + x + "], trying to milk you to completion. She’s close herself, you know; leaking juices from her pussy and [reaha.milk] from her puffy pink teats. All it would take to set her off again would be your touch in her deepest depths, a sultry word whispered in her ear... you nip at her fuzzy ear-tip, murmuring what a good cow-slut she is, how good her ass feels around your [pc.cockOrStrapon " + x + "].");

	output("\n\n<i>“[pc.name]!”</i> she gasps, voice breaking into a high-pitched whine of pleasure. You thrust forward, making her scream as you hilt yourself in her ass... and join her in orgasm. Your [pc.cockOrStrapon " + x + "] throbs in the wet vice of Reaha’s rump");
	//strapon:
	if(x < 0) output(", electric shocks of pleasure rising through your body as your strapon feeds back the same pleasure a real cock ought to into your nerves and brain.");
	else output(". The first thick ropes of [pc.cum] shoot deep into Reaha’s bowels, splattering the lubed-up walls with streaks of [pc.cumColor]. The cow cries out again when she feels your seed spilling into her, using every muscle in her ass at once to squeeze and milk your member to get more of the thick cream.");
	if(x >= 0 && pc.cumQ() >= 6000) output(" Of course, that just keeps you cumming... and cumming... and cumming, pumping the bovine beauty with such a thick filling of your jizz that her belly has no choice but to bloat in response, swelling like a pregnant cow with your superhuman load.");
	if(x >= 0 && pc.hasKnot(x)) output(" And of course, your [pc.knot " + x + "] serves to trap every drop inside, keeping her cum-stuffed ass nice and pent up. Were you fucking a different hole, your seed would have ample opportunity to find Reaha’s waiting womb; instead, your bitch-breaker only serves to bind you together, keeping your cock swimming in a little sea of sexual fluids trapped in her asshole.");
	else if(x >= 0) output(" Your [pc.cock " + x + "] slowly softens in her sphincter’s grip, letting loose a tidalwave of pent-up juices - lube and jizz mixed together spills down Reaha’s thighs, splattering into a puddle between her knees.");

	output("\n\nWhen you finally slide out of Reaha, she moans weakly and slumps forward, resting her head and arms against the [reaha.milk]-smeared bulkhead. <i>“Wow...”</i> is all she manages to say for a long while, struggling to catch her breath. When she does, Reaha gives you a look over her shoulder and grins, <i>“You’re going to turn me into a regular butt-slut if you keep that kind of love-making up, [pc.name]. Even something that dirty feels amazing when I’ve got you.”</i>");

	output("\n\nYou lean forward and wrap the cow up in another long kiss, squeezing ass and breasts until she’s moaning again, relaxing utterly in your arms. You’ve been with Reaha long enough by now to know what she needs after that: a little love, and a lot of cuddling.");
	processTime(20);
	pc.orgasm();
	IncrementFlag("SEXED_REAHA");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Titjob
//Have Reaha use those huge, full breasts of her to get you off.
public function getATitjobFromCuredReaha():void
{
	clearOutput();
	reahaHeader();
	var x:int = -1;
	if(pc.hasCock()) x = pc.biggestCockIndex();
	output("Your wandering hand snakes up Reaha’s supple skin, caressing the side of one of her big, leaky breasts, stopping just long enough to pinch the prominent teat, drawing forth a clear bead of [reaha.milk] and a hiss of pleasure from the cow-slut. <i>“What do you say we put these to work?”</i> you grin, teasing her huge nipples as the [reaha.milkVisc] fluid trickles out and onto your deft digits. You give the cow a gentle push, pressing her back against the wall to keep her steady as you start to milk her harder, wrapping your fingers around her prominent teats to coax out her lactic bounty. It isn’t long before [reaha.milk] is flowing down Reaha’s huge bust, clear streams rolling across her smooth skin before waterfalling down, pooling between her feet. The cow visibly shudders with pleasure as you work her tits, biting her lip and moaning cutely, trying and failing to keep her sensual cries from spurring you on.");
	output("\n\nAs you milk your lusty cow-slut, you make sure to spread her [reaha.milk] around, cupping up handfuls of her sweet cream and smearing it back up into the sides of her full breasts, pressing the twin peaks together to form a pool and filling it to the brim with [reaha.milk]. With a little urging from you, Reaha presses her shoulders together, keeping her breasts nice and tight as you go back to milking, pinching one of her teats just hard enough to send a shiver through her that has waves wracking the shores of her titty-pool. Now that looks inviting... but you have other designs for the cow’s buxom bust; you reach up and guide Reaha’s head down, bending her neck until her little nose is almost cresting the surface of her [reaha.milk] pool. <i>“Time for a drink,”</i> you command, probing a finger into the lake of her lactation and presenting the wetted finger to Reaha.");
	if(reahaConfidence() < 50) output(" She gives you a questioning look, but meekly obeys,");
	else output(" She chews her lip for a second, glancing up at you before doing as you say,");
	output(" her large cow-tongue lolling out to lap up the few drops on your long digit and practically wrapping your finger up as she suckles on it, cleaning off every last trace of her [reaha.milk] from you.");
	output("\n\nWithdrawing your finger, you push her tits up, inviting her to finish off what you’ve started. Reaha’s tongue laps it up, drinking deep of her own [reaha.milk] even as you drain more and more from her teats, letting the warm, sweet lactation pour down her breasts and belly, long streams snaking down to her cunt and shivering legs. You let a hand follow the running rivulets of [reaha.milk] to her sodden box, a pair of fingers easily slipping in with the extra lubrication. Sensitive as ever, Reaha gives a loud cry of pleasure, forgetting her fluid-drenched tits as her back arches sharply, [reaha.milk] flooding from the pool down her belly and over your own head, soaking your ");
	if(!pc.isBald()) output("[pc.hair]");
	else output("bald pate");
	output(".");

	output("\n\n");
	if(curedReahaInDebt()) output("<i>“Bad cow!”</i>");
	else output("<i>“Aww, you made a mess, Reaha!”</i>");
	output(" you laugh, pushing your hand deeper into the cow’s cavernous cunt. She shrieks with ecstasy, tits bouncing as you fingers her quivering quim. Reaha babbles an apology as your finger-fucking intensifies, deft digits delving deeper into her darkest depths, slipping your whole hand in past her well-stretched lips. A few good thrusts has the submissive little cow screaming in pleasure, head thrown back as she bounces on your fist, working with you to ram it deeper and deeper into her spasming cunt. The slick walls of Reaha’s pussy squeeze and ripple along your pounding hand, muscles contracting wildly in a vain attempt to delay the massive penetration from ramming home into her again and again; her pleasured cries, though, let you know she’s enjoying every second of fist-fucking goodness she can get as her screams reach their crescendo.");
	output("\n\nReaha’s orgasm comes crashing down like a wave. Her cunt contracts and spasms, lips quaking around your wrist. Her pussy squirts, joining her leaking tits in a hurricane of fluids that spatters across your body as she cums, soaking your arms and [pc.chest] in girl-spunk and [reaha.milk]. You chuckle as the cow’s chest heaves, still drooling [reaha.milk] at a steady rate as her orgasm passes; breathing hard, she slumps back against the bulkhead, with nothing but your fist buried deep up her cunt to prop her up. When you finally pull your hand free, the exhausted slut slumps to her knees, tits bouncing enticingly as her big booty plops onto the wet floor. You lick your lips at the sight of her jiggly flesh wobbling, still coated with a moist sheen, already nice and lubricated by her own lactation. Finally, time for the main course.");
	output("\n\nYou grab your [pc.cockOrStrapon " + x + "], presenting it to the collapsed cow-slut, and her whorish instincts have her sucking it in a heartbeat. She swallows it up, wide-set tongue caressing your sensitive underside as your hips push inch after inch past her spit-slick lips ");
	var length:Number = 9;
	if(x >= 0) length = pc.cocks[x].cLength();
	if(length < 10) output("until the lusty bovine’s swallowed up every inch of cockmeat you’re packing, her nose poking into your groin expectantly");
	else output("until her throat’s bulging with cockmeat, cheeks puffing out as she tries desperately to breathe around your inhuman package");
	output(". You let your cow-slut suckle from your [pc.cockOrStrapon " + x + "] for a few good moments, reveling in the feeling of her huge tongue wrapping and caressing your prick. Exhausted as she is from her cunt-pounding orgasm, the taste of cock seems to revive her, and soon Reaha’s sucking like a champ, head bobbing up and down your shaft with rhythmic motion");
	if(length >= 10) output(", throat bulging and deflating as your massive dick rams down her throat time after time");
	output(". In fact, she might be getting a bit <i>too</i> enthusiastic, deep-throating you with such skill and speed that you don’t know if you’ll hold out long enough to get what you were after - but would that be so bad? You sigh, cock throbbing with unanswered need as you push Reaha back, the head of your prick breaching from between her lips with a wet pop, bridges of spittle still connecting you and your slutty little slave.");

	output("\n\nReaha looks up at you expectantly, wiping her mouth off with the back of her hand. You point a single commanding finger to the slick surface of her [reaha.milk]-stuffed tits. Realization dawns on the husky cow. She quickly cups her hands under her hefty tits and, rising onto her knees, presents the two creamy orbs to you. You nod approvingly as Reaha slips your cock between the soft, warm, oh-so-wet mounds of her overflowing mammaries; your [pc.cockOrStrapon " + x + "] slides right into her cleavage, sliding across her smooth skin on a sheen of [reaha.milk]. You let loose a full-body shudder as your prick is enveloped in a tight squeeze of Reaha’s wet, hot boobflesh, loving every second of feeling gliding across her pearly flesh. Judging by the way Reaha’s breath quickens after a few thrusts, you aren’t the only one: her cheeks redden with lust as your [pc.cockOrStrapon " + x + "] humps into the tight-pressed vice of her cleavage, tits jiggling obscenely with your every thrusting motion.");
	output("\n\nYou grasp Reaha’s shoulders and start hammering, thrusting your [pc.hips] hard into her eager tits until the sound of [pc.skin] smacking sodden skin echoes throughout the room, mixing with her moans and yours as you vigorously titfuck the busty cow-girl. Her fingers dig into her squishy flesh, practically disappearing into her tits and urging out an all-new stream of [reaha.milk] that squirts onto your thighs and crotch, giving you just that little bit more lube to start ramping up the speed. Reaha gives a muffled cry as you push her head down on your ");
	if(x >= 0) output("[pc.cockHead " + x + "]");
	else output("hardlight crown");
	output(", pistoning through her tits and into her welcoming mouth, through a valley of wet warmth into a steamy, tongue-filled sheathe. She moans and groans around a mouthful of [pc.cockOrStrapon], squeezing her tits as tightly together as she can to milk <i>you</i> right back. You grit your teeth, trying to hold yourself back as the lusty cow starts to shake her shoulders, making her tits jiggle obscenely around your turgid shaft as she sucks up every spare inch of cockflesh she can get her lips around.");
	output("\n\nMouth, tits, and tongue together are just too much for you. Roaring with ecstatic pleasure, you slam your hips forward, pumping as hard and as fast as you possibly can into the tight embrace of Reaha’s titties, reaching down to pinch and squeeze her gushing teats until she’s joining you full on with screams of pleasure, shooting arcs of [reaha.milk] high into the air. Her boobgasm neatly presages your own orgasm, the cow’s body quaking to its core as she cums, girl-spunk gushing out of her spasming, fist-gaped vag as your ");
	if(x < 0) output("synthetic cock overloads with pleasure, sending shockwaves of ecstasy up your spine.");
	else output("[pc.cock " + x + "] erupts into her mouth, shooting a thick stream of [pc.cum] to splatter on that big, wide tongue of hers. She gasps, choking on throbbing cock and steaming-hot spooge until she coughs it up down her chin, spunk drooling out her mouth and onto the shiny-wet tops of her breasts.");

	output("\n\nWith a heavy, contented sigh, you let your head rest against the bulkhead, panting hard after the sexual exertion. Below you, your dutiful cow-slut ");
	if(x >= 0) output("swallows a mouthful of your seed");
	else output("licks your hardlight clean");
	output(" before letting your spent [pc.cockOrStrapon " + x + "] flop out of her mouth, still drooling a trickle of [reaha.milk] out from her tits. You reach down to caress one of the heavy orbs, running your fingers through the heady mixture of [reaha.milk]");
	if(x >= 0) output(", [pc.cum],");
	output(" and girly-cum. Reaha smiles up at you. ");
	if(reahaConfidence() < 50) output("<i>“Was that okay? I... I still feel kind of guilty getting off just from giving you a blowjob.”</i>");
	else output("<i>“You really do love my tits, don’t you, [pc.name]?”</i> she teases, pinching a nipple. <i>“I’m glad! Makes me think all this wasn’t for nothing...”</i>");
	processTime(25);
	pc.orgasm();
	IncrementFlag("SEXED_REAHA");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Ride Strapon
//Have Reaha don a fake donger and fuck your [pc.vagOrAss] with it!
public function rideCuredReahasStrapon():void
{
	clearOutput();
	reahaHeader();
	output("You let a hand slip around Reaha’s wide hips, squeezing one of her big, soft ass cheeks and whispering into one of her floppy cow-ears, <i>“Why don’t you find us something to play with?”</i>");
	output("\n\nReaha ");
	if(reahaConfidence() >= 50) output("grins");
	else output("nods obediently");
	output(", slipping out of your arms to dig into her nightstand, bending over as she does so and giving you a long look at her huge, luscious ass; seeing that heart-shaped slab of cow-meat waving so invitingly in front of you is just too much to resist. You step up behind the bovine beauty, giving her a playful swat on the rear that leaves a hand-shaped red patch over her sailor’s tattoo. Reaha gives a little yelp of surprise, but your familiar touch is always welcome: she gives you a wink over her shoulder and wiggles her ass for you, grinding it back against your crotch and teasing your nose with the fluffy poof at the end of her slender tail.");
	output("\n\nGrinning, you give the lusty cow another spank, sending her flesh jiggling");
	if(pc.hasCock()) 
	{
		output(" around [pc.oneCock], teasing the flaccid length until");
		if(!pc.isCrotchExposed()) output(" your rising lust has it bulging against the seams of your [pc.lowerGarment]");
		output(", desperate to plunge into the wet, inviting warmth of Reaha’s pussy, so close to your [pc.skinFurScales] that you can feel the heat billowing off her slick lower lips");
	}
	output(". She gives you a teasing look over her shoulder, moving her hips rhythmically as you slap her tattooed ass again, grinding her slick slit against your [pc.leg] until she’s trembling with pleasure.");
	output("\n\nWith shaking hands, Reaha finally manages to find what she was looking for: a set of crotchless black leather underwear with a harness holding a two-foot long double-ended dildo in place. <i>“H-how about this?”</i> she asks, never missing a beat with those inhuman hips of hers, pressing even harder against your ");
	if(pc.hasCock()) output("[pc.cock]");
	else output("[pc.leg]");
	output(", leaving trails of fem-slime on your ");
	if(pc.hasArmor()) output("[pc.armor]");
	else output("[pc.skin]");
	output(".");

	output("\n\n<i>“");
	if(pc.isNice()) output("Perfect!”</i>");
	else if(pc.isMischievous()) output("That’ll do,”</i>");
	else output("I guess,”</i>");
	output(" you say. Now, what to do with it...");
	processTime(6);
	pc.changeLust(10);
	clearMenu();
	//[Be Submissive] [Be Dominant]
	addButton(0,"Be Submissive",curedReahaFucksASubbyPCsButt,undefined,"Be Submissive","Take the passive role, and let Reaha fuck you as she pleases.");
	addButton(1,"Be Dominant",dominantlyTakeItInThebUttFromReahaLel,undefined,"Be Dominant","Shove Reaha down and ride her strapon.");
}

//Submissive
//Take the passive role, and let Reaha fuck you as she pleases.
public function curedReahaFucksASubbyPCsButt():void
{
	clearOutput();
	reahaHeader();
	output("The thought of that big, hard rod of latex thrusting deep into your bowels is enough to get your ");
	if(pc.hasVagina()) output("[pc.cunt] drooling with excitement");
	if(pc.isHerm()) output(" and your ");
	if(pc.hasCock()) output("[pc.cocks] rock-hard");
	if(!pc.hasGenitals()) output("mind racing with lewd thoughts");
	output(". You ask Reaha to put it on and give you the rough fucking you deserve.");
	if(reahaConfidence() < 50) 
	{
		output(" She hesitates for a moment at your request: <i>“A-are you sure?”</i>");
		output("\n\n<i>“Definitely,”</i> you answer, crawling onto the bed and presenting your [pc.butt] to the cow’s startled face. Clearly, she’s still not entirely used to being given control. Time to see if you can bring out Reaha’s dominant side...");
	}
	//else high confidence:
	else output(" Reaha gives you a lascivious grin and plants a hand on your ass, pushing you onto the bed. Her hand comes down on your [pc.butt], hard enough to make you yelp. Oh, yeah, that’s the stuff! You knew there was a dominant side somewhere under all that sexy cow-meat!");

	output("\n\nYou shake your booty at her, beckoning her on");
	if(pc.hasTail()) output(" with a flick of your [pc.tail]");
	output(". Reaha stands up straight behind you, pulling the strapon on. You can hear the cow’s breath hiss as the long rod sinks into her, pushing deep into her animalistic fuckhole until she’s finally able to tighten the straps, purple latex bobbing around her crotch just like a real, and painfully erect, cock.");
	if(reahaConfidence() < 50) 
	{
		output("\n\n<i>“Let’s... uh, I guess I should lube you up, now?”</i> You nod. <i>“Um, alright... let’s try this...”</i> she mumbles, reaching up to her udders and grabbing one of her over-sized teats in either hand. She bends down, dragging her big, soft tits across your back; you shudder as her hot flesh grazes yours, tempered by beads of cool [reaha.milk] trickling from her swollen nipples as the cow-girl lines her boobs up with your behind");
		if(!pc.isCrotchExposed() && !pc.isAssExposed()) output(" pulling off the last of your [pc.lowerGarments] to reveal your [pc.vagOrAss]");
		output(". Your breath catches as a sudden squirt of [reaha.milk] splatters across your [pc.butt], wetness rolling down your round cheeks in creamy rivulets as the cow-slut aims her tit’s stream right for your [pc.vagOrAss]. Your hole clenches reflexively as her [reaha.milk]-lube smears across it; you grit your teeth and try to relax, letting a tiny trickle of the rich fluid right into your hungry fuckhole. With a delightful shiver, you get used to the feeling of Reaha’s personal lube flowing into your [pc.vagOrAss], and she really opens the floodgates, practically pushing her teat into your ");
		if(!pc.hasVagina()) output("butt");
		else output("pussy");
		output(" and squirting, showering your backside in [reaha.milk].");
	}
	else
	{
		output("\n\n<i>“Okay! You’re gonna want to lube this up, [pc.name]! I’ve taken enough cock to know the difference it makes. Open wide.”</i>");
		output("\n\nYou blink, just in time to see Reaha grab you by the [pc.hair] and yank your head back. Your mouth opens instinctively, and is instantly filled with a slab of latex cock-meat. <i>“Good [pc.boyGirl],”</i> Reaha giggles, rocking her hips forward into your [pc.lips]. <i>“Use that tongue, now!”</i>");
		output("\n\nYou take her advice, sucking on her rigid plastic rod and coating it with as much spit as you can. Reaha nods approvingly, one hand cupping a hefty breast and the other snaking down your bare back. You suck in a sharp breath, feeling her hand caress your [pc.butt]... and again when you feel a pair of her fingers pressing against your [pc.vagOrAss]. It takes just a little pressure for her to snake her way inside you, stirring up the inner depths of your hole to get you ready, too. You can feel a little [reaha.milk] on her fingertips, wettened to ease her entry... and lube you up.");
	}
	output("\n\nSatisfied with her wetwork, Reaha gives you an appreciative slap on your [pc.butt], digging her fingers into your taut [pc.skin]. That’s more like it! You wiggle your ass happily as the cow’s hands wrap around your [pc.hips]. Her own bovine hips pushing in towards you, the head of the massive strapon teasing the clenched ");
	if(pc.hasVagina()) output("lips");
	else output("ring");
	output(" of your [pc.vagOrAss]. She keeps it pushing forward, relentlessly advancing the latex cock’s crown until you can feel its tiny tip pressing into your [reaha.milk]-coated fuckhole. You bite your lip, fingers digging into the sheets, doing everything you can to relax your [pc.vagOrAss] and taking your mind off the impending penetration. The first inch is exquisite agony: your voice breaks into a high cry as the thick rod punches mercilessly through your ");
	if(pc.hasVagina()) output("slicked labia");
	else output("sphincter’s defenses");
	output(", spreading your poor ");
	if(pc.hasVagina()) output("pussy");
	else output("ass");
	output(" apart on broad inches of synthetic dick. Your muscles go wild around the intruding plastic member, trying desperately to repel the cock ramming through them, but utterly unable to best the thick glaze of lube Reaha’s crammed up inside you.");

	output("\n\nReaha’s strong hands gripping your hips are the only things that anchor you to the moment, the only things you can think about beyond the enormity of the fuckstick pushing into you. Her fingers dig hard into you, pulling you back against her even as she fucks the strapon deeper in. Your back arches as ");
	if(!pc.hasVagina()) output("the pain finally turns to a hint of pleasure, a wet warmth radiating up from the rim of your ass as it finally learns to accept the dildo buried a finger’s length up your bowels.");
	else output("your pussy finally gives in completely, spreading wide open and accepting a deep, long thrust of her latex cock.");

	if(pc.hasVagina()) pc.cuntChange(0, 134);
	else pc.buttChange(134);

	//If PC has a cock:
	if(pc.hasCock())
	{
		output("\n\nYour [pc.cocks] throb");
		if(pc.cockTotal() == 1) output("s");
		output(" as Reaha’s toy glides ");
		if(!pc.hasVagina()) output("across your prostate");
		else output("through your pussy");
		output(", egging on your hardening [pc.cocks]. Seeing your growing excitement, Reaha gives you a classic reach-around, letting your hip go to grab your [pc.cock] and stroking it hard and fast as she pushes her hips further in, shoving inch after inch of dildo ");
		if(!pc.hasVagina()) output("across the sensitive bulb of your masculine gland.");
		else output("through your quim, so thick and so deep that you still feel that tell-tale pressure on your G-spot and prostate both!");
		output(" You give a pitiful whine as the cow-girl ");
		if(!pc.hasVagina()) output("butt");
		output("fucks you, relentlessly jacking you off until you can feel cum surging up the length of your [pc.cock]. Her hips start to piston, slapping into your [pc.butt] as she begins to really pound your [pc.vagOrAss], faster and faster until you’re being hammered almost as fast as she can stroke your [pc.cock]. Her other hand gives your [pc.butt] a rough slap, nearly barreling you over if it weren’t for the dildo rammed up your ");
		if(pc.hasVagina()) output("quim");
		else output("ass");
		output(". You cry out, and once the floodgate’s open, there’s no stopping it. To the beat of Reaha’s vicious ");
		if(!pc.hasVagina()) output("butt");
		output("fucking, you scream and moan, thrusting your hips back against the leather-clad cow to get every inch of thick cock you can as your own pulsing prick comes ever closer to eruption.");
		output("\n\nWith a final, desperate cry of pleasure, you arch your back and scream. Your [pc.cock] gives one final pitiful throb of resistance in Reaha’s hand before blowing its load, a thick wad of [pc.cumColor] spunk shooting onto the cow’s sheets just as she rams her dildo up to the hilt into your [pc.vagOrAss], making your stomach bulge obscenely. She moves her wrist to the beat of her pounding for once as she milks you, forcing another shot of cum right out of your prick, smearing across your shaking arms. Your body convulses, muscles writhing wildly around the latex fuckstick spreading you apart, tormenting your poor gland as it swells with spunk time and again, blowing a lake of spunk onto Reaha’s sheets.");
	}
	//PC has a Vagina:
	if(pc.hasVagina())
	{
		output("\n\nYour [pc.cunt] drools and clenches around the rubbery fuckstick drilling it. You reach back to finger yourself, to gain even a tiny sliver of control over the proceedings as orgasm wells up, but the cow catches your wrist, pulling your arm behind your back. <i>“I don’t think so!”</i> she giggles, pushing you down onto your [pc.belly], putting your cunt utterly out of reach. You give a whine of sexual need, but the cow takes your mind off it with a harsh slap to the ass, digging her fingers in as she pulls her legs up onto the bed with you, angling down for a proper fucking. Your free hand wraps itself in the sheets, trying to get a firm hold on something as Reaha’s powerful hips hammer into you.");
		output("\n\nHer thrusts are relentless, each pounding inch after inch of [reaha.milk]-soaked latex deep into your defenseless womb, bulging your stomach obscenely as she finally works the greater part of the shaft into you. Your [pc.clit] cries out for a touch, any measure of pleasure to ease the snaking, aching ecstasy radiating from your fuckhole as she thrusts harder and harder, but any attempt to touch it is met with stern refusal by your cow-slut; she’s getting into the domme role, at least! And maybe too much, you almost think: god DAMN you want to jill off, but you’re stuck thrusting back against Reaha’s hips, taking even more of her huge dildo-cock until with a scream of glee you feel the leather straps pressing into your [pc.cunt]. 18 inches of cock is buried inside you, stretching your spasming pussy-muscles to the very limit, pushing against the walls of your gut until you can feel it pounding into the bed right through you! Your [pc.cunt] spasms in a pool of its own excitement and need; your muscles squeeze and wring the dildo, going wild around the fake cock Reaha’s pushed so deep into you. You arch your back and cry your pleasure, squeezing down as hard as you can around Reaha’s relentlessly ramming rod, daring her to pound your puss as hard as she can as you finally peak. Your cunt gushes, squirting femspunk into Reaha’s sheets as she fucks you into a body-rocking orgasm.");
	}
	//if PC has no sex organs: fuck you, slut.
	if(!pc.hasGenitals())
	{
		output("\n\nYou give a whine of sexual need, but the cow takes your mind off it with a harsh slap to the ass, digging her fingers in as she pulls her legs up onto the bed with you, angling down for a proper fucking. Your free hand wraps itself in the sheets, trying to get a firm hold on something as Reaha’s powerful hips hammering into you. Her thrusts are relentless, each pounding inch after inch of [reaha.milk]-soaked latex deep into your defenseless bowels, bulging your stomach obscenely as she finally works the greater part of the shaft into you. Your mind races, wishing beyond hope for some sexual organ to gratify amid the buttfucking, but your decisions have rendered you sexless, totally reliant on Reaha’s tender mercies to bring your pleasure. You’re stuck thrusting back against Reaha’s hips, taking even more of her huge dildo-cock until with a scream of glee you feel the leather straps pressing into your [pc.butt]. 18 inches of cock is buried inside you, stretching your spasming anal muscles to the very limit, pushing against the walls of your gut until you can feel it pounding into the bed right through you! Anal orgasm, the elusive holy grail of buttfucking, seems imminent. your butt muscles squeeze and wring the dildo, going wild around the fake cock Reaha’s pushed so deep into you. You arch your back and cry your pleasure, squeezing down as hard as you can around Reaha’s relentlessly ramming rod, daring her to ream your clenched ass as hard as she can as you finally peak as she buttfucks you into a body-rocking orgasm. Exhausted, you collapse utterly into Reaha’s bed, panting hard as you recover from the reaming.");
		processTime(25);
		pc.orgasm();
		IncrementFlag("SEXED_REAHA");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	//If PC has sex organs, combine:
	output("\n\nPanting hard after your ");
	if(!pc.hasVagina()) output("butt-pounding-induced ");
	output("orgasm, you give a hapless cry as Reaha straddles your [pc.hips], pushing the latex cock as deep into you as it can possibly go. <i>“You made a mess in my bed! Bad slut!”</i> she says, trying to keep a straight face as she points to your cum staining her sheets. <i>“You better be ready to clean that up, or my cock’s gonna just grow roots in your ass, maggot. Uh, slut.”</i> Now she’s getting the hang of being on top again!");
	output("\n\n<i>“Yes ma’am,”</i> you mewl as Reaha shifts your prone body, planting your nose right in the center of the biggest cumstain, practically smearing your face in it. Your [pc.tongue] snakes out at her command, slurping up the still-wet lake of ");
	if(pc.hasCock()) output("[pc.cumFlavor] ");
	else output("[pc.girlCumFlavor] ");
	if(!pc.hasCock()) output("girl-");
	output("spunk staining her sheets. Your nose turns up at the taste of your own cum, but one look to the suddenly dominant cow-slut tells you you’re stuck here: the old marine in her’s finally come back out!");
	output("\n\nShe gives you a hard slap on the ass, demanding, <i>“Hurry up!”</i> as you pause to think: you get to it, sucking up your cum as best you can from the sheets, licking the stains and lakes as dry as you can, getting every drop, if only because every missed drop earns you a spank or a hard tip-to-stem thrust from the cock still spearing you wide.");
	output("\n\n<i>“There you go,”</i> Reaha coos as you lap up a particularly big puddle of spunk, finally clearing everything you can get your tongue on, though her bed’s no less wet for your efforts. <i>“I think that deserves a little break, don’t you?”</i>");
	output("\n\nYou nod, groaning as Reaha finally pulls the massive cock from your [pc.vagOrAss], letting the floppy latex schlong plop onto your [pc.butt]. <i>“");
	if(!curedReahaInDebt()) output("Hope I didn’t go toooo hard on you, Captain!");
	else output("Was that too much, Captain?");
	output("”</i> Reaha giggles, patting your hip. Half-aware of what she’s saying, and feeling utterly empty and wet after that oversized insertion, your head lolls forward as you pass out on Reaha’s bed.");
	processTime(45);
	pc.orgasm();
	reahaConfidence(5);
	IncrementFlag("SEXED_REAHA");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Dominant
//Shove Reaha down and ride her strapon.
public function dominantlyTakeItInThebUttFromReahaLel():void
{
	clearOutput();
	reahaHeader();
	output("You push Reaha onto the bed, looming over the horny cow as she rolls onto her back, grabbing her milky tits ");
	if(reahaConfidence() < 50) output("protectively");
	else output("enticingly, pinching a nipple until it beads");
	output(". You slip down to your [pc.knees], taking one of her feet in your hands, gently massaging the ball as you work one of the leather straps around her ankle. She blushes hard as you take her big toe into you mouth, licking the ticklish underside until she’s biting her lip, fingers snaking down to her quivering slit. Her other leg is like putty in your hands, easily slipped through the other strap; you pull the leather undergarment up her thick thighs, brushing her seeking hand aside as you caress the inner shaft of the double-dildo, angling it up toward the cow’s cavernous cunt. Her legs wrap around your shoulders as you slip closer to her, watching her chest rise and fall, tits wobbling with every panting, expectant breath.");
	output("\n\nYou pause just before the moment of penetration, the crown of the latex cock just spreading the lips of Reaha’s pussy. Your fingers take point, tips teasing across the over-sensitive flesh of the cow’s inner thighs, brushing the thick lips of her labia and sending a shock of pleasure up the cow’s body that manifests as a convulsive shudder, cunt drooling obscenely at the lightest touch. Your finger slips in easily, the lubricated passage practically sucking you into its hot embrace. Reaha gives a pitiful little gasp as you enter her, rolling your finger around in the plentiful juices flowing from her gaping pussy. Every touch to her tender walls sends a shiver of ecstasy up her spine, coating your finger in a thick deluge of feminine slime. You let another finger slide into her, and another, pushing the better part of your fist into the cow-slut’s expansive slit, which stretches as easily to accommodate your grip as well as it would a bull-stud’s massive cock.");
	output("\n\nReaha cries out, back arching off the bed as you fist her, slathering your hand in her free-flowing juices. You pull out, just enough to grasp the shaft of your strapon cock and stroke it vigorously, pumping the rod and coating it with Reaha’s lube, making sure both ends are nice and soaked before sidling the straps up to Reaha’s hips, sliding the rigid rod of the latex cock into the fist-shaped hole of the cow-slut’s sex. With the strapon snugly in place, you step back to admire your work: over a pool of fem-cum towers a monolith of latex cock, bobbing unsteadily as Reaha’s shaky breath rocks through her lust-addled body. You give the cow a reassuring pat on the tit as you climb into bed, straddling her wide hips and angling your [pc.butt] over the tower of dildo rising from her crotch, taking the time to rock your [pc.hips] back against it, reveling in the warm wetness of the lubed-up shaft pressing through the crack of you ass, smearing her cunny’s juice ");
	if(!pc.hasVagina()) output("across your winking hole");
	else output("between the lips of your own [pc.cunt]");
	output(".");

	output("\n\nYour [pc.vagOrAss] clenches rhythmically as the strapon’s rod passes across it, smearing its lube across the mouth of your tender hole. Biting your lip and digging your fingers into Reaha’s big, soft tits, you rise to your full height, ass quivering over the trembling pole of latex cockmeat beneath you, lining up your decent. Slowly, ever so slowly, you kneel down onto the strapon, reclining back until the crown kisses the ");
	if(!pc.hasVagina()) output("ring of your [pc.asshole]");
	else output("lips of your twat");
	output(", spearing you with a shock of cold hardness that sends lightning bolts of pleasure throughout your lusty body. The first inch is exquisite ");
	if(!pc.hasVagina()) output("agony; your voice breaks into a high cry as the thick rod punches mercilessly through your sphincter’s defenses, spreading your poor ass apart. Your muscles go wild around the intruding plastic member, trying desperately to repel the cock ramming through them, but utterly unable to best the thick glaze of lube spread across the tip.");
	else output("ecstasy. Your voice breaks into a high cry as the thick rod glides through your mons and spears its way into your fuckhole, spreading your lips wide open around its turgid length.");

	if(pc.hasVagina()) pc.cuntChange(0, 134);
	else pc.buttChange(134);

	output("\n\nThe dildo slides into you excruciatingly slowly, making you moan louder with every inch that pushes past your [pc.vagOrAss]. ");
	if(pc.hasCock() && !pc.hasVagina()) 
	{
		output("Your [pc.cocks] bounces to alert as the toy grinds across the knot of your prostate, pushing hard against your masculine gland until you can feel cum bubbling through your vein");
		if(pc.cockTotal() > 1) output("s");
		output(", surging toward your tip");
		if(pc.cockTotal() > 1) output("s");
		output(".");
	}
	output(" Gritting your teeth, you slide down the pole of latex, forcing yourself to take inch after inch of oversized toy until your [pc.butt] is finally nestled in Reaha’s lap, grinding against her leather-clad crotch.");
	output("\n\n<i>“You okay, Captain?”</i> Reaha asks, hands caressing your [pc.hips] as you settle into her lap. You give her a quieting look, squeezing her tits by way of answer. A clear bead of [reaha.milk] forms at the tips of her nipples which you lean down to lick off, groaning as the strapon bends inside you to accommodate the motion, dragging a fist’s length out of you. Reaha moans as you give her tit a little suckle, drawing out a thin stream of her sweet cream to fill your mouth. Drinking from the cow, you start up a rhythm: suck and thrust, rising off Reaha’s lap as you fill your cheeks with [reaha.milk], swallowing as you descend. Your stomach bulges with the great girth of the cock ");
	if(!pc.hasVagina()) output("reaming your ass");
	else output("spearing your puss");
	output(", joined in flooding your gut with a steady stream of Reaha’s lactic lust: before long the two of you are both moaning and gasping with every motion as the dildo passes between you, pushing into your [pc.vagOrAss] before falling back into Reaha’s slit.");

	output("\n\n<i>“There’s a good cow,”</i> you purr as Reaha’s fingers lock around your hips, holding on for dear life as you start to really move. Faster and faster, riding that cock like a champ; you take hold of Reaha’s shoulders, lifting her up to a sitting position so you can drink and ride more easily, bouncing in her lap as your face is buried in her bounteous bust. She holds you tight, pressing your face into a yielding mound of supple boobflesh, forcing as much of her long teat down your throat as she can and thrusting it against your writhing [pc.tongue]. You suckle from it, drinking deep from the cow-slut’s endless reserves.");

	output("\n\nYou utterly lose track of time, moments blending together as you suckle and bounce, in and out, up and down until you can feel a tell-tale pressure mounting ");
	if(!pc.hasVagina()) output("behind the gaping wall of your sphincter");
	else output("deep in the depths of your well-fucked cunt");
	output(". ");
	if(pc.hasCock()) output("[pc.EachCock] drools threateningly, dripping slimy wads of [pc.cum] onto Reaha’s belly with every movement. ");
	output(" You move faster, pounding down on the rigid rod until your ");
	if(!pc.hasVagina()) output("ass");
	else output("twat");
	output(" is practically livid with pleasure, overwhelming every other sense but the need for release: back arched and voice crying, you cum. Your [pc.vagOrAss] squeezes wildly on the dildo, wringing every second of agonizing ecstasy from it you can");
	if(pc.hasCock())
	{
		output(" as your [pc.cocks] erupt");
		if(pc.cockTotal() == 1) output("s");
		output(" onto Reaha’s belly, blasting her with a wave of sticky [pc.cum] that smears between her tight-pressed breasts");
	}
	output(". Reaha, too, screams a cry of pleasure, milk and fem-cum spurting as you pile-drive the dildo down into her sodden box, ramming all eighteen inches of latex into her cunt. Holding your cow tight, the two of you hump and thrust through the orgasm, drenching each other in your sexual juices as the dildo hammers from one hole to the other.");
	output("\n\nThe orgasm leaves you both panting heavily, rolled in each other’s arms in a tangle of cum-stained sheets. You barely feel the dildo slip from your ");
	if(!pc.hasVagina()) output("guts");
	else output("fuckhole");
	output(", only feeling the intense emptiness it leaves behind as Reaha wriggles out of the strapon; when the toy pulls out of her, a floodgate of fem-slime opens, drenching her thighs in musky slime. She gives a heavy sigh, rubbing her sore teats as you let your face fall back into the valley of her cleavage, using her heavy tits as pillows as you recover from your sexual marathon.");
	processTime(35);
	pc.orgasm();
	pc.milkInMouth(chars["REAHA"]);
	IncrementFlag("SEXED_REAHA");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Hug Reaha
//Tooltip: Give your cow a hug.
public function giveYourCuredCowAHug():void
{
	clearOutput();
	reahaHeader();
	output("Giving Reaha a smirk, you wrap your arms around her big ol’ waist and pull her in against you. She giggles and moos, pressing her massive mammaries so tight against you that they compress into jiggly jugs so thick that you could positively lose yourself in them.");
	//PC is sized to get a facefull of titties (4’6 to 5’6)
	if(pc.tallness >= 54 && pc.tallness < 66)
	{
		output("\n\nReaha sees where you gaze is going, and before you know it, one of her hands is on the back of your head and your vision is arcing downwards into darkness. Your bovine lover laughs again and wiggles her shoulders from side to side, trapping you in a marshmallow hell of quivering titflesh rubbing your cheeks.");
	}
	//Else, PC is too short for titty faceplant
	else if(pc.tallness < 54)
	{
		output("\n\nYou’re basically a stand for Reaha to rest her hefty rack on, so much shorter than the diminutive cow-girl as you are. She’s more than happy to take advantage of it, though; she puts plenty of soft, liquid weight on your brow, letting you feel just how heavy and full her boobs are. You just nuzzle your cheek into her [reaha.belly], enjoying the warmth and softness of your cow-girl lover’s embrace.");
	}
	//Else, PC is too big to get a titty faceplant
	else
	{
		output("\n\nYour bovine lover happily rubs her big, sensitive breasts against your much larger body. Her cheek nuzzles into your ");
		if(pc.hasArmor()) output("[pc.armor]");
		else output("[pc.skinFurScales]");
		output(", though, and her arms latch around you. Chuckling, you stroke her strawberry hair, and she moos softly in contentment.");
	}
	//Combine, PC has Lust 33+
	if(pc.lust() >= 33)
	{
		output("\n\nThrough the long moment of your sensual closeness, you feel a familiar warmth spreading through your loins");
		if(pc.hasCock()) output(" - and a stiffness in your [pc.cock], pressing into Reaha’s flanks");
		output(". She murmurs something under her breath, and you feel the cow’s slender digits brushing along your [pc.thigh].");
		output("\n\n<i>“Oooh, feelin’ a little antsy, babe?”</i> she smiles, ");
		if(pc.hasCock()) output("stroking your mounting hard-on");
		else output("caressing your crotch");
		output(". <i>“Just say the word and I’ll take care of that for you...”</i>");
	}
	//Combine, else; +10 Lust
	pc.changeLust(10);
	output("\n\nAfter a long moment, Reaha steps back and takes your hands in hers, smiling ");
	if(pc.tallness > reaha.tallness + 4) output("up ");
	else if(pc.tallness > reaha.tallness - 4) output("down ");
	output("at you. <i>“Man, I needed that. Anything else on your mind, babe, or did you just wanna feel up your favorite pillows for a bit?”</i>");
	output("\n\nShe gives you a wink and another jiggle of her jugs, all but offering up her chest for your pleasure. Suddenly, you’ve got a serious urge to put down for a nap...");
	processTime(6);
	if(pc.lust() >= 33) curedReahaSexMenu();
	else
	{
		clearMenu();
		addButton(0,"Next",curedReahaApproach);
	}
}

//Sleepwith
//[Sleep With]
//Invite Reaha to share your bed at night.
public function inviteReahaSleepWith():void
{
	clearOutput();
	reahaHeader();
	output("<i>“What do you say you come to my cabin this evening, Reaha?”</i> you ask, pulling the soft little cow-girl close.");
	output("\n\nHer first answer is an alarmed <i>“Moo!”</i> as she’s pulled into your arms, but she quickly relaxes and adds, <i>“Sure, ");
	if(curedReahaInDebt()) output("[pc.Master]");
	else output("[pc.name]");
	output("! Sounds like fun.”</i>");

	flags["CREWMEMBER_SLEEP_WITH"] = "REAHA";
	processTime(1);
	clearMenu();
	addButton(0,"Next",curedReahaApproach);
}

//[No Sleep With]
//Tell Reaha to sleep in her own quarters.
public function turnOffReahaNightSleepies():void
{
	clearOutput();
	reahaHeader();
	output("As flatly as possible, you tell Reaha that you’d like her to stay in her cabin tonight. She doesn’t react too harshly; just shrugs and says, <i>“Whatever makes you happy, [pc.name].”</i>");
	flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	processTime(1);
	clearMenu();
	addButton(0,"Next",curedReahaApproach);
}

//Sleepwith Scene
public function sleepWithCuredReaha():void
{
	clearOutput();
	reahaHeader();
	output("As you’re getting ready for bed, you hear the pneumatic hiss of your quarters’ door opening. Reaha steps in, buck naked, an arm wrapped under her heavy breasts for support.");
	output("\n\n<i>“Hey, [pc.name],”</i> she says, padding over with a suggestive swish in her hips. She slips in under the covers, shivering a little as the sheets caress her breasts and butt, her body still obviously over-sensitive.");
	output("\n\nNow with a soft, warm companion to join you, you eagerly hop into bed and wrap your arms around Reaha, nesting your head into that magnificent bosom of hers. You’re pretty sure Reaha’s gene mods were tailor-made to make her into the best pillows in the galaxy, and you can’t help but smile as you nestle into her ample cleavage.");
	output("\n\nWith your cow-girl pillow, it doesn’t take you long to fall asleep...");
	processTime(3);
	flags["CREWMEMBER_SLEEP_WITH"] = "REAHA";
	clearMenu();
	sleep(false);
}

public function displayReahaInventory():void
{
	output("<b><u>Reaha Is Wearing</u></b>:\n");
	output("<b>Armor:</b> [reaha.Armor]\n");
	output("<b>Upper Undergarment:</b> [reaha.UpperUndergarment]\n");
	output("<b>Lower Undergarment:</b> [reaha.LowerUndergarment]" + (reaha.hasHardLightEquipped() ? " (with hardlight strap-on)" : "") + "\n\n");
	output("<b><u>Reaha’s Available Clothing:</u></b>\n");
	for(var x:int = 0; x < reaha.inventory.length; x++)
	{
		if(x >= REAHA_INV_SLOT_MAX) output("<span class='bad'>" + StringUtil.upperCase(reaha.inventory[x].description, false) + "</span>\n");
		else output(StringUtil.upperCase(reaha.inventory[x].description, false) + "\n");
	}
	if(reaha.inventory.length == 0) output("Nothing. <i>Reaha has no" + (reaha.isNude() ? "": " extra") + " clothes!</i>\n");
}

//Give Clothes
//Tooltip: Give Reaha some clothes to wear.
public function giveReahaClothes():void
{
	reahaHeader();
	
	clearOutput();
	output("What do you intend to give her?\n\n");
	displayReahaInventory();

	clearMenu();
 	var buttons:int = 0;
	var x:int = 0;
	var state:int = 0; // 0 invalid, 1 can give, 2 already equipped by reaha, 3 in reaha's inventory
	while (true)
 	{
		if (x < pc.inventory.length)
 		{
			var cname:String = getQualifiedClassName(pc.inventory[x]);
			switch (pc.inventory[x].type)
 			{
				case GLOBAL.CLOTHING:
					state = cname == getQualifiedClassName(reaha.armor) ? 2 : 1;
					break;
				case GLOBAL.ARMOR:
					if (pc.inventory[x] is GooArmor)
					{ state = 0; }
					else
					{ state = cname == getQualifiedClassName(reaha.armor) ? 2 : 1; }
					break;
				case GLOBAL.LOWER_UNDERGARMENT:
					state = cname == getQualifiedClassName(reaha.lowerUndergarment) ? 2 : 1;
					break;
				case GLOBAL.UPPER_UNDERGARMENT:
					state = cname == getQualifiedClassName(reaha.upperUndergarment) ? 2 : 1;
					break;
				default:
					state = 0;
					break;
 			}
			if (state == 1 && reaha.hasItemByClass(getDefinitionByName(cname) as Class)) state = 3;
			if (state == 1 && pc.inventory[x].hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE)) state = -1;
		}
		
		if (buttons % 15 == 0 && (state || !buttons))
		{
			addButton(buttons+14, "Back", curedReahaApproach);
			buttons++;
		}
		
		if (x == pc.inventory.length) break;
		
		switch (state)
		{
			case 1: // can give
				addItemButton(buttons-1, pc.inventory[x], reahaClothingGiftConfirm, x);
				buttons++;
				break;
			case 2: // already equipped by reaha
				addDisabledButton(buttons-1, pc.inventory[x].shortName, StringUtil.toDisplayCase(pc.inventory[x].longName), "Reaha is already wearing one of these!");
				buttons++;
				break;
			case 3: // in reaha's inventory
				addDisabledButton(buttons-1, pc.inventory[x].shortName, StringUtil.toDisplayCase(pc.inventory[x].longName), "Reaha already has one of these.");
				buttons++;
				break;
			case -1: // cannot drop!
				addDisabledButton(buttons-1, pc.inventory[x].shortName, StringUtil.toDisplayCase(pc.inventory[x].longName), "You cannot drop this item.");
				buttons++;
				break;
 		}
		x++;
 	}
	if(buttons == 1) output("\nOh right... You don’t have anything to give her.");
	addButton(14, "Back", curedReahaApproach);
}

public function reahaClothingGiftConfirm(x:int):void
{
	clearOutput();
	reahaHeader();
	output("Are you sure you want to give Reaha " + pc.inventory[x].description + "?");
	//Inventory options here. Pick 1. Confirm:
	//Are you sure you want to give {item} to Reaha?
	//Yes // No (Back to Inventory)
	clearMenu();
	addButton(1,"No",giveReahaClothes);
	addButton(0,"Yes",giveReahaClothesProcess,x,"Yes","Give her the item!");
}
public function giveReahaClothesProcess(x:int):void
{
	clearOutput();
	reahaHeader();
	output("<i>“I’ve got a present for you!”</i>");
	var item:ItemSlotClass = pc.inventory[x];
	//Move her old armor to inventory, if she had any.
	if(InCollection(item.type, [GLOBAL.CLOTHING, GLOBAL.ARMOR])) 
	{
		if(!(reaha.armor is EmptySlot)) reaha.inventory.push(reaha.armor);
		reaha.armor = item;
	}
	else if(item.type == GLOBAL.LOWER_UNDERGARMENT)
	{
		if(!(reaha.lowerUndergarment is EmptySlot)) reaha.inventory.push(reaha.lowerUndergarment);
		reaha.lowerUndergarment = item;
	}
	else if(item.type == GLOBAL.UPPER_UNDERGARMENT)
	{
		if(!(reaha.upperUndergarment is EmptySlot)) reaha.inventory.push(reaha.upperUndergarment);
		reaha.upperUndergarment = item;
	}
	else
	{
		output("\n\nA SEVERE ERROR OCCURRED. UNKNOWN CLOTHING TYPE GIVEN TO REAHA. FENOXO DUN FUCKED UP! ITEM ERROR: " + item.description + "\n\n");
	}
	pc.inventory.splice(x,1);
	output("\n\n<i>“Ooh! What is it?”</i> she asks, looking at you expectantly.");
	//Item has high Sexiness
	if(item.sexiness >= 5) output(" <i>“Oh, cute!”</i> Reaha giggles as you hand over " + item.description + ". She puts it up against herself, showing off her cute new outfit for you. You tell her it looks good on her, earning a smile from her. <i>“Thank you so much, [pc.name]! I’ll go change!”</i>");
	//Item has high Defense
	else if(item.defense >= 3) 
	{
		output(" <i>“Armor?”</i> Reaha asks, raising an eyebrow, but taking " + item.description + " anyway. <i>“Neat. I haven’t really worn much armor since the army, but I appreciate the thought!");
		if(silly) output(" This’ll keep me nice and safe in case somebody tries to rustle me, right?");
		else output(" This’ll come in handy in case we ever get boarded, I’m sure.");
		output(" I’ll go put this on - thanks, [pc.name]. Glad to know you’re looking out for me!”</i>");
	}
	//Item has Shields
	else if(item.shields >= 5) {
		output(" <i>“Wow, a shield generator,”</i> Reaha says as you hand over " + item.description + ". <i>“Us poor grunts didn’t even get these back in the army. Then again, I mostly sat around in a tank anyway!”</i> she laughs, taking " + item.description + ".");
		output("\n\n<i>“Thanks for this, [pc.name],”</i> she adds with a smile. <i>“It’ll keep me nice and safe!”</i>");
	}
	//Item has a penalty on Sexiness
	else if(item.sexiness < 0)
	{
		output(" <i>“...Oh,”</i> she says, the excitement fading from her voice as she sees the ugly " + item.description + " on offer. <i>“Um, thanks, [pc.name].”</i>");
	}
	//Item is cow-themed
	else if(item.longName.indexOf("cow") >= 0)
	{
		output(" <i>“Moo!”</i> Reaha cheers as she takes in the pretty cow’s clothing. <i>“Hehe, thanks [pc.name], it’s adorable! I feel like I shouldn’t like cow-print, but... it’s just so cute! I love it!”</i>");
		output("\n\nShe catches you in a big hug, squeezing her tits tight against your [pc.chest]. <i>“I’ll go change. Be a shame if someone took advantage of me while I did,”</i> she adds with a lusty wink.");
	}
	//Else, catch-all
	else
	{
		output(" <i>“Aww, thank you!”</i> Reaha says, taking the proffered " + item.description + " from you. Once you’ve handed it over, Reaha ");
		if(pc.tallness > reaha.tallness + 4) output("leans up on her tip-toes and");
		else output("leans in and");
		output(" gives you a peck on the cheek. <i>“You’re too sweet, [pc.name]. I’ll go change into this right away!”</i>");
	}
	processTime(2);
	clearMenu();
	addButton(0,"Next",giveReahaClothes);
}

//WearOutfit
//Tooltip: Choose an outfit for Reaha to wear.
//Opens up a Reaha inventory, lets you play Pretty Princess Cow-girl Dressup with Reaha.
//When player finishes and changes something, add:
public function whatOutfitWillCuredReahaWear():void
{
	clearOutput();
	reahaHeader();
	output("What will you have Reaha wear?\n\n");
	displayReahaInventory();
	var buttons:Number = 0;
	var invLimit:int = reaha.inventory.length;
	if(invLimit >= REAHA_INV_SLOT_MAX) invLimit = REAHA_INV_SLOT_MAX;
	clearMenu();
	if(!reaha.isNude())
	{
		buttons = 1;
		addButton(0,"Get Naked",dressCuredReahaSelection,null,"Get Naked","Get Reaha naked so you can dress her all over again... or leave her nude.");
	}
	addButton(14,"Back",curedReahaApproach);
	for(var x:int = 0; x < invLimit; x++)
	{
		//14 is for "Back"
		if(buttons >= 14 && (buttons + 1) % 15 == 0)
		{
			addButton(buttons, "Back", curedReahaApproach);
			buttons++;
		}
		
		//Make sure Reaha doesn't wear it (failsafe)
		if(
			InCollection(reaha.inventory[x].shortName, [reaha.armor.shortName, reaha.lowerUndergarment.shortName, reaha.upperUndergarment.shortName])
		) addDisabledButton(buttons, reaha.inventory[x].shortName, StringUtil.toDisplayCase(reaha.inventory[x].longName), "Reaha is already wearing one of these!");
		else addItemButton(buttons,reaha.inventory[x],dressCuredReahaSelection,reaha.inventory[x]);
		buttons++;
		
		if(invLimit > 14 && (x + 1) == invLimit)
		{
			while((buttons + 1) % 15 != 0) { buttons++; }
			addButton(buttons, "Back", curedReahaApproach);
		}
	}
}

public function dressCuredReahaSelection(item:ItemSlotClass):void
{
	clearOutput();
	reahaHeader();

	output("<i>“You want me to ");
	if(item != null) output("wear this");
	else output("go naked for a while");
	output("?”</i> Reaha asks sweetly. <i>“For you, anything! I’ll go get changed!”</i>");

	//GIT NAKKID
	if(item == null)
 	{
		if (!(reaha.armor is EmptySlot))
		{
			reaha.inventory.push(reaha.armor);
			reaha.armor = new EmptySlot();
		}
		if (!(reaha.lowerUndergarment is EmptySlot))
		{
			reaha.inventory.push(reaha.lowerUndergarment);
			reaha.lowerUndergarment = new EmptySlot();
		}
		if (!(reaha.upperUndergarment is EmptySlot))
		{
			reaha.inventory.push(reaha.upperUndergarment);
			reaha.upperUndergarment = new EmptySlot();
		}
 	}
	//ELSE ARMOR
	else if(InCollection(item.type, [GLOBAL.CLOTHING, GLOBAL.ARMOR]))
	{
		if(!(reaha.armor is EmptySlot)) reaha.inventory.push(reaha.armor);
		reaha.armor = item;
		reaha.inventory.splice(reaha.inventory.indexOf(item), 1);
	}
	else if(item.type == GLOBAL.LOWER_UNDERGARMENT)
	{
		if(!(reaha.lowerUndergarment is EmptySlot)) reaha.inventory.push(reaha.lowerUndergarment);
		reaha.lowerUndergarment = item;
		reaha.inventory.splice(reaha.inventory.indexOf(item), 1);
	}
	else if(item.type == GLOBAL.UPPER_UNDERGARMENT)
	{
		if(!(reaha.upperUndergarment is EmptySlot)) reaha.inventory.push(reaha.upperUndergarment);
		reaha.upperUndergarment = item;
		reaha.inventory.splice(reaha.inventory.indexOf(item), 1);
	}
	else
	{
		output("\n\nA SEVERE ERROR OCCURRED. UNKNOWN CLOTHING TYPE GIVEN TO REAHA. FENOXO DUN FUCKED UP! ITEM ERROR: " + item.description + "\n\n");
	}
	
	output("\n\nReaha collects her things and skips off to her quarters. A few moments later and she’s wandering the corridors");
	if(item == null) output(" butt naked, flaunting what she’s got for you.");
	else output(" trussed up in her [reaha.gear].");
	//Whoring Reaha, item has +Sexiness or Nudist:
	if(flags["REAHA_WHORING_UNLOCKED"] == 2) output(" You bet her johns will get a kick out of that!");
	
	processTime(2);
	clearMenu();
	addButton(0,"Next",whatOutfitWillCuredReahaWear);
}

// Remove abundance of clothes stuffs!
public function whatOutfitWillCuredReahaReturn():void
{
	clearOutput();
	reahaHeader();
	author("Jacques00");
	
	output("What will you have Reaha return to you?\n\n");
	displayReahaInventory();
	
	var pcInvFull:Boolean = (pc.inventory.length >= pc.inventorySlots());
	var buttons:Number = 0;
	var invLimit:int = reaha.inventory.length;
	if(invLimit >= REAHA_INV_SLOT_MAX) invLimit = REAHA_INV_SLOT_MAX;
	
	clearMenu();
	
	for(var x:int = 0; x < invLimit; x++)
	{
		//14 is for "Back"
		if(buttons >= 14 && (buttons + 1) % 15 == 0)
		{
			addButton(buttons, "Back", curedReahaApproach);
			buttons++;
		}
		
		//Make sure Reaha doesn't wear it (failsafe)
		if(
			InCollection(reaha.inventory[x].shortName, [reaha.armor.shortName, reaha.lowerUndergarment.shortName, reaha.upperUndergarment.shortName])
		) addDisabledButton(buttons, reaha.inventory[x].shortName, StringUtil.toDisplayCase(reaha.inventory[x].longName), "Reaha is already wearing one of these!");
		//Make sure inventory isn't already full!
		else if(pcInvFull) addDisabledButton(buttons, reaha.inventory[x].shortName, StringUtil.toDisplayCase(reaha.inventory[x].longName), "Your inventory is too full for this!");
		else addItemButton(buttons, reaha.inventory[x], takeCuredReahaSelection, reaha.inventory[x]);
		buttons++;
		
		if(invLimit > 14 && (x + 1) == invLimit)
		{
			while((buttons + 1) % 15 != 0) { buttons++; }
			addButton(buttons, "Back", curedReahaApproach);
		}
	}
	
	addButton(14, "Back", curedReahaApproach);
}
public function takeCuredReahaSelection(item:ItemSlotClass):void
{
	clearOutput();
	reahaHeader();
	author("Jacques00");
	
	output("<i>“You want this back?”</i> Reaha asks curiously, holding up the " + (InCollection(item.type, [GLOBAL.CLOTHING, GLOBAL.ARMOR]) ? "outfit" : "article of clothing") + ". <i>“Hmm, I guess I can part with it...”</i>");
	output("\n\nReaha neatly " + (InCollection(item.type, [GLOBAL.CLOTHING, GLOBAL.ARMOR]) ? "hangs" : "folds") + " the item and hands it to you. <i>“Better make good use of it, okay?”</i>");
	output("\n\n");
	
	itemCollect([item]);
	reaha.inventory.splice(reaha.inventory.indexOf(item), 1);
	
	processTime(1);
	clearMenu();
	addButton(0, "Next", whatOutfitWillCuredReahaReturn);
}
public function whatOutfitWillCuredReahaDestroy():void
{
	clearOutput();
	reahaHeader();
	author("Jacques00");
	
	output("You cannot get clothing back from Reaha once you allow her to get rid of it.\n\nWhat will you have Reaha toss out?\n\n");
	displayReahaInventory();
	
	var buttons:Number = 0;
	var invLimit:int = reaha.inventory.length;
	if(invLimit >= REAHA_INV_SLOT_MAX) invLimit = REAHA_INV_SLOT_MAX;
	
	clearMenu();
	
	for(var x:int = 0; x < invLimit; x++)
	{
		//14 is for "Back"
		if(buttons >= 14 && (buttons + 1) % 15 == 0)
		{
			addButton(buttons, "Back", curedReahaApproach);
			buttons++;
		}
		
		//Make sure Reaha doesn't wear it (failsafe)
		if(
			InCollection(reaha.inventory[x].shortName, [reaha.armor.shortName, reaha.lowerUndergarment.shortName, reaha.upperUndergarment.shortName])
		) addDisabledButton(buttons, reaha.inventory[x].shortName, StringUtil.toDisplayCase(reaha.inventory[x].longName), "Reaha is already wearing one of these!");
		//OLD: else addItemButton(buttons, reaha.inventory[x], destroyCuredReahaSelection, reaha.inventory[x]);
		else addItemButton(buttons, reaha.inventory[x], reahaClothingDestroyConfirm, x);
		buttons++;
		
		if(invLimit > 14 && (x + 1) == invLimit)
		{
			while((buttons + 1) % 15 != 0) { buttons++; }
			addButton(buttons, "Back", curedReahaApproach);
		}
	}
	
	addButton(14, "Back", curedReahaApproach);
}

public function reahaClothingDestroyConfirm(x:int):void
{
	clearOutput();
	reahaHeader();
	output("Are you sure you want Reaha to throw away " + reaha.inventory[x].description + "?");
	//Inventory options here. Pick 1. Confirm:
	//Are you sure you want to give {item} to Reaha?
	//Yes // No (Back to Inventory)
	clearMenu();
	addButton(1,"No",whatOutfitWillCuredReahaDestroy);
	addButton(0,"Yes",destroyCuredReahaSelection,reaha.inventory[x],"Yes","Destroy the item!");
}

public function destroyCuredReahaSelection(item:ItemSlotClass):void
{
	clearOutput();
	reahaHeader();
	author("Jacques00");
	
	output("<i>“You want me to throw this out?”</i> Reaha asks innocently, holding up the " + (InCollection(item.type, [GLOBAL.CLOTHING, GLOBAL.ARMOR]) ? "outfit" : "article of clothing") + ". <i>“O-okay...”</i>");
	output("\n\nReaha " + (InCollection(item.type, [GLOBAL.CLOTHING, GLOBAL.ARMOR]) ? "flattens out the piece" : "softly balls up the material") + " and tosses it in the trash chute. <i>“Well, on the bright side, my wardrobe would be a little less stuffed now.”</i>");
	
	output("\n\n<b>Reaha removed " + item.description + " from her wardrobe.<\b>");
	reaha.destroyItemByReference(item);
	
	processTime(1);
	clearMenu();
	addButton(0, "Next", whatOutfitWillCuredReahaDestroy);
}

//Give Item
//Tooltip: Give Reaha a little present.
//Reaha will take anything lactation related, pretty much. The different kinds of lactation products Reaha consumes can improve the money she makes via selling her milk (see its section). She’ll take:
//Lactaid-brand products
//Milk Gushers
//Milkmaid’s Aid
//Bovinium
//Milk-flavor changes (Honey, Chocolac, etc.)
//Junk in the Trunk
public function giveReahaTFItemPresents():void
{
	clearOutput();
	reahaHeader();
	output("What will you give Reaha?");
	var buttons:Number = 0;
	clearMenu();
	for(var x:int = 0; x < pc.inventory.length; x++)
	{
		if(buttons == 14) buttons++;
		if(pc.inventory[x] is MilkCaramelGushers || pc.inventory[x] is MilkmaidsAid || pc.inventory[x] is Chocolac || pc.inventory[x] is Honeydew || pc.inventory[x] is Lactaid || (pc.inventory[x] is Anusoft && pcCanButtfuckReaha()) || pc.inventory[x] is JunkTrunk || pc.inventory[x] is Bovinium)
		{
			addItemButton(buttons,pc.inventory[x],giveReahaTFItemPresentsGO,pc.inventory[x]);
			buttons++;
		}
	}
	if(buttons == 0) output(" <b>On second thought, you don’t have anything she’d like.</b>");
	addButton(14,"Back",curedReahaApproach);
}

public function giveReahaTFItemPresentsGO(item:ItemSlotClass):void
{
	clearOutput();
	reahaHeader();
	output("You call Reaha over and tell you you’ve got a present for her.");
	output("\n\n<i>“For me?”</i> she croons, leaning in flirtatiously close. <i>“Aww, you’re too sweet. What is it?”</i>");

	//Give Lactaid-Brand Medipen
	if(item is Lactaid)
	{
		output("\n\nYou flip out the Lactaid-brand medipen and hand it over to Reaha. She takes it, sees the label, and jabs herself with it without hesitation. She’s barely finished off the pen’s contents before she’s mooing huskily, fluttering her eyelashes at you. <i>“Thanks, [pc.name]. My favorite type of present!”</i>");
		output("\n\nNow to see what happens...");
		//Change Lactation Type to Milk
		if(reaha.milkType != GLOBAL.FLUID_TYPE_MILK)
		{
			output("\n\nReaha draws in a sharp gasp and grabs her tits, moaning under her breath as something changes beneath the surface. She pinches her nipples, and rather than her normal [reaha.milkNoun], you’re greeted by a squirt of milky white cream!");
			output("\n\n<i>“Oh! Back to the same old, same old, I guess!”</i> she giggles, scooping up a boob and sucking her teat dry. <i>“Mmm, and tasty, too! Wanna try?”</i>");
			output("\n\nDon’t mind if you do...");
			output("\n\nYou nod and, at Reaha’s prompting, cup the other breast up to your [pc.lips]. One little suck and you’re treated to a steady flow of thick, creamy cow’s milk squirting from Reaha’s puffy nipple. Its owner moans and laces her hands around your shoulders, pulling you deep into that jiggly, supple boobflesh of hers. She cradles your head, cooing softly until you’ve had your fill, cheeks flush with her delicious bounty.");
			output("\n\nWhen you’ve had your fill, you slip off her nipple and give her a pat on the flank. She giggles and presses back against your hand. <i>“Lemme know when you want some milk in your morning tea... or coffee... or if you just wanna get your fill from the tap. I’m your girl. Always.”</i>");
			reaha.milkType = GLOBAL.FLUID_TYPE_MILK;
		}
		//Increase Lactation Amount/Fullness/etc.
		else if(reaha.milkStorageMultiplier < 5)
		{
			output("\n\nMurmuring under her breath, Reaha’s hands wrap around her chest, feeling herself up. <i>“Oooh, they feel full... way fuller than usual. Mmm, if I didn’t know better, I’d say the ol’ milk tanks are working overdrive now! Hehe.”</i>");
			reaha.milkStorageMultiplier++;
		}
		//Nothing Useful
		else 
		{
			output("\n\nAfter a long, long moment, Reaha shrugs. <i>“I don’t feel any different. Maybe a little horney and milky... really full, though. guess I should go plug into my milker for a bit and work that out. Thanks for refill, though, babe!”</i>");
			output("\n\nReaha hops over, gives you a kiss on the cheek, and goes searching for her magic milker.");
		}
	}
	//Give Milk Gushers / Milkmaid’s Aid
	else if(item is MilkCaramelGushers || item is MilkmaidsAid)
	{
		output("\n\nYou take out the milky candies and toss them to Reaha, telling her to enjoy a treat.");
		output("\n\n<i>“For me? You shouldn’t have!”</i> she giggles, tearing open the packaging. ");
		if(!reaha.isChestExposed()) output("She preemptively peels her top off, shamelessly showing off those succulent jugs of hers before eating the treats.");
		else output("Reaha munches down the treats and wraps her arms under her bare breasts, waiting for the inevitable.");
		output("\n\nIt doesn’t take but a few moment for Reaha’s nipples to stiffen, and you’re half-sure you can see her breasts swelling over so slightly in her hands. The cow-girl moans, crossing her legs and biting her lip as lactic pleasure overtakes her. She barely even needs to tweak her nipples to coax out a little trickle of her [reaha.milk], smearing over her fingers and forming rivers of [reaha.milkColor] cream down the curves of her breast. She cups one of them up, flicking her tongue across the broad teat before latching her lips on and sucking.");
		output("\n\n<i>“Mmm! That’s the good stuff,”</i> Reaha murmurs, giving you a lusty look. <i>“Oh, stars, I they’re so full now! I feel like my tits are ten pounds heavier!”</i>");
		output("\n\nThey look it, too. Maybe you should give Reaha a hand...");
		if(reaha.breastRows[0].breastRatingRaw < 50) reaha.breastRows[0].breastRatingRaw++;
		//[Milk Reaha]//to normal milking scene
		processTime(2);
		clearMenu();
		addButton(0,"Milk Reaha",milkCuredReaha);
		addButton(14,"Leave",mainGameMenu);
		pc.destroyItemByReference(item);
		return;
	}
	//Give Bovinium
	//Gain one of the following TFs:
	//Changes Reaha’s Milktype to Milk. Slightly increases lactation amount. Slight increase to Reaha’s thickness or butt rating.
	else if(item is Bovinium)
	{
		output("\n\nYou take the little Bovinium bottle out of your pack and shake it at her. Reaha’s eyes go wide.");
		output("\n\n<i>“");
		//First: 
		if(flags["REAHA_BOVINIUMED"] == undefined) output("Bovinium? I’ve heard of that! Man, I wish this stuff had been around when I was doing my mod work, way back. Would have saved me a lot of heartache.”</i> She takes the bottle and eyes it, glancing through the warning label with a more cautious eye than you might have expected.");
		else output("More bovinium? Am I not cow enough for you?”</i> she teases, taking it with a wink.");
		output("\n\nReaha rolls the cow-print bottle around in her hand a moment before finally popping the cap off and tipping one of the gummies into her hand. <i>“Okay. I guess I wouldn’t mind being a little thicker, milkier cow for you... but just for you!”</i>");
		output("\n\nYou roll your eyes. Something tells you Reaha might be exaggerating that part, but still, she obediently eats her cowy treat, making a happy little moo when she’s done.");
		if(!reaha.isChestExposed()) output(" Expecting a change in her tits, Reaha preemptively wiggles out of her top.");

		//Milktype to Milk
		if(reaha.milkType != GLOBAL.FLUID_TYPE_MILK)
		{
			output("\n\nReaha draws in a sharp gasp and grabs her tits, moaning under her breath as something changes beneath the surface. She pinches her nipples, and rather than her normal [reaha.milk], you’re greeted by a squirt of milky white cream!");
			output("\n\n<i>“Oh! Back to the same old, same old, I guess!”</i> she giggles, scooping up a boob and sucking her teat dry. <i>“Mmm, and tasty, too! Wanna try?”</i>");
			output("\n\nDon’t mind if you do...");
			output("\n\nYou nod and, at Reaha’s prompting, cup the other breast up to your [pc.lips]. One little suck and you’re treated to a steady flow of thick, creamy cow’s milk squirting from Reaha’s puffy nipple. Its owner moans and laces her hands around your shoulders, pulling you deep into that jiggly, supple boobflesh of hers. She cradles your head, cooing softly until you’ve had your fill, cheeks flush with her delicious bounty.");
			output("\n\nWhen you’ve had your fill, you slip off her nipple and give her a pat on the flank. She giggles and presses back against your hand. <i>“Lemme know when you want some milk in your morning tea... or coffee... or if you just wanna get your fill from the tap. I’m your girl. Always.”</i>");
			reaha.milkType = GLOBAL.FLUID_TYPE_MILK;
		}
		//Lactation Up
		//Increase Lactation Amount/Fullness/etc.
		else if(reaha.milkStorageMultiplier < 5)
		{
			output("\n\nMurmuring under her breath, Reaha’s hands wrap around her chest, feeling herself up. <i>“Oooh, they feel full... way fuller than usual. Mmm, if I didn’t know better, I’d say the ol’ milk tanks are working overdrive now! Hehe.”</i>");
			reaha.milkStorageMultiplier++;
		}
		//Thickness Up
		else if(reaha.thickness < 80)
		{
			output("\n\nReaha’s barely finished chewing when she gasps and puts a hand on her belly, moaning and half doubling over. For a second, you’re worried that she’s going to be sick, but she comes back up a second later laughing. Her hand has sunk a little into her [reaha.belly], pinching the slightly plumper-looking flesh there. A glance around tells you that her thighs and rump both look a little thicker, too.");
			output("\n\nOnce the shifting weight has settled down, Reaha bounces on a heel, making her voluptuous body jiggle obscenely... in the perfect way to make your lusts rise until you’re reaching out, grabbing two handfuls of ass pulling the busty cow tight against yourself. She squeals and nuzzles against you, quietly enjoying your groping explorations of her huskier frame. Oh, you’re going to get a lot of mileage out of this plump little cow...");
			reaha.thickness += 10;
		}
		//Butt Up
		else if(reaha.buttRatingRaw < 18)
		{
			output("\n\n<i>“O-ooh!”</i> Reaha gasps, reaching back around grabbing her own ass. Her eyes go wide and she teeters forward and back, rocking on her heels. You try and ask what’s wrong, but the cow-girl just start giggling and thrusts her hindquarters out at you. A glance immediately shows what’s up: her already-ample ass is ");
			if(!reaha.isCrotchGarbed()) output("jiggling with newfound weight");
			else output("straining her [reaha.lowerGarment] even more than usual");
			output(". She’s definitely packing a little more junk in her trunk!");
			output("\n\nOnce she’s adjusted to her new center of gravity, Reaha wiggles happily and twerks her behind for you, showing off what she’s got. <i>“Wanna touch, babe?");
			if(pc.hasCock()) output(" Maybe thrust that [pc.cock] of yours in there and break my new bubble-butt in?");
			output("”</i>");
			reaha.buttRatingRaw += 2 + rand(3);
		}
		//Nothing Useful
		else 
		{
			output("\n\nAfter a long, long moment, Reaha shrugs. <i>“I don’t feel any different. Thanks anyway, babe!”</i>");
			output("\n\nReaha hops over, and gives you a kiss on the cheek.");
		}
		IncrementFlag("REAHA_BOVINIUMED");
	}
	//Give Milk-flavor Changer
	if(item is Chocolac || item is Honeydew)
	{
		output("\n\n<i>“You want me to change what I lactate?”</i> Reaha asks, glancing the item over. <i>“Well... if that’s what you want. ");
		if(flags["REAHA_WHORING_UNLOCKED"] != 2) output("Anything that comes out of a girl’s tits sells well as far as I can tell, so it shouldn’t hurt business much. ");
		output("I just hope the flavor’s everything you want - I can only make one flavor at a time!”</i>");
		output("\n\nYou assure her that she’ll be producing exactly what you want, and with that encouragement under her belt, Reaha takes her medicine like a good girl.");
		output("\n\nA moment passes");
		if(!reaha.isChestExposed()) output(", during which she preemptively pulls her top off");
		if(item is Honeydew) reaha.milkType = GLOBAL.FLUID_TYPE_HONEY;
		else if(item is Chocolac) reaha.milkType = GLOBAL.FLUID_TYPE_CHOCOLATE_MILK;
		output(". Eventually, Reaha shivers with pleasure and cups her breasts. She thumbs her nipples, gently coaxing out a few droplets of her new lactic bounty. With a moan, she produces a few droplets of [reaha.milk], staining her fingers before drooling down her curvaceous chest. Once a steady flow has worked up, Reaha brings her boob up to her mouth and takes a long, deep drink from herself, moaning all the while.");
		output("\n\n<i>“Oooh, tasty!”</i> she giggles, licking her lips. <i>“Wanna try?”</i>");
		output("\n\nDon’t mind if you do...");
		output("\n\nYou nod and, at Reaha’s prompting, cup the other breast up to your [pc.lips]. One little suck and you’re treated to a steady flow of thick, creamy cow’s milk squirting from Reaha’s puffy nipple. Its owner moans and laces her hands around your shoulders, pulling you deep into that jiggly, supple boobflesh of hers. She cradles your head, cooing softly until you’ve had your fill, cheeks flush with her delicious bounty.");
		output("\n\nWhen you’ve had your fill, you slip off her nipple and give her a pat on the flank. She giggles and presses back against your hand. <i>“Lemme know when you want some milk in your morning tea... or coffee... or if you just wanna get your fill from the tap. I’m your girl. Always.”</i>");
		pc.changeLust(5);
	}
	//Junk in the Trunk
	if(item is JunkTrunk)
	{
		output("\n\nYou hand over the little white pill, appropriately labeled “Junk in the Trunk.”");
		//Reaha’s ass is less than max:
		if(reaha.buttRatingRaw < 18)
		{
			output("\n\n<i>“Oh, want a little more cushion for the pushin’, babe?”</i> Reaha giggles, taking the pill and rolling it between her fingers. <i>“Well, if that’s what you’re into... I wouldn’t mind making sure you’ve got the softest cow money can buy to snuggle up with. Bottoms up!”</i>");
			output("\n\nShe swallows the pill with a swig of her own titty-milk to wash it down. It only takes a moment for the microsurgeons to go to work:");
			output("\n\n<i>“O-ooh!”</i> Reaha gasps, reaching back around grabbing her own ass. She moans, groping her hefty rear as it fills out moment after moment, eventually thrusting her flanks out at you for inspection: a glance immediately shows what’s up: her already-ample ass is ");
			if(!reaha.isCrotchGarbed()) output("jiggling with newfound weight");
			else output("straining her [reaha.lowerGarment] even more than usual");
			output(". She’s definitely packing a little more junk in her trunk!");
			reaha.buttRatingRaw++;
			output("\n\nOnce she’s adjusted to her new center of gravity, Reaha wiggles happily and twerks her behind for you, showing off what she’s got. <i>“Wanna touch, babe?");
			if(pc.hasCock()) output(" Maybe thrust that [pc.cock] of yours in there and break my new bubble-butt in?");
			output("”</i>");
		}
		//Reaha’s ass is max:
		else
		{
			output("\n\n<i>“Uh, hehe, as much as I’d love to, [pc.Master], I think I’ve got more than enough junk in my trunk for one cow,”</i> she says apologetically, pressing the pill back into your hand.");
			processTime(3);
			clearMenu();
			addButton(0,"Next",curedReahaApproach);
			return;
		}
	}
	//Anusoft
	//PC must have a cock or hardlight panties.
	if(item is Anusoft)
	{
		//First Time:
		if(!reaha.ass.hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) && !reaha.ass.hasFlag(GLOBAL.FLAG_PUMPED))
		{
			output("\n\nYou toss Reaha the little vial of cream. She reads the name off slowly from the label, rolling it over her tongue: <i>“Anus-soft? What’s that do?”</i>");
			output("\n\nYou grin and tell her that it’ll make her tight little pucker into a plump, sensitive donut - more animalistic, and much more pleasurable. Take that, and she’ll enjoy getting buttfucked so much more.");
			output("\n\n<i>“Like I need more encouragement!”</i> she snickers, unscrewing the cap. <i>“Buuuuut, I guess if this means <b>you</b>’ll enjoy it more, what’s the harm?”</i>");
			output("\n\nThat’s the spirit. Rather than applying it directly, though, Reaha presses the jar back into your hands and spins around");
			if(!reaha.isCrotchGarbed()) output(", presenting her bare [reaha.butt]");
			else output(", shimmying out of her [reaha.lowerGarment] and wiggling her [reaha.butt] at you");
			output(". <i>“Wanna do the honors, babe?”</i>");
			output("\n\nSounds good to you. You smear the cream onto the fingers of a hand, using the other to spread the cow-girl’s thick cheeks apart. Her dark star winks at you, clenching and unclenching as the tip of a finger circles around her rim. Below, Reaha’s pink puss drools a thick stream of slime down her thigh, an overt sign that her acceptance of your transformative is anything but forced. You’re sure she’s going to enjoy having a big, thick asshole perfect for pleasuring cock... and for giving her the most mind-blowing ass-orgasms she’s ever had.");
			output("\n\nAlready eager to test her out, you press your cream-slathered digits against Reaha’s asshole and press in, gently at first, but nice and insistent until her muscles relax and admit you. Reaha gasps and moans, biting her lip as your fingers glide through her well-worn passage, smearing the anusoft cream all along her inner walls, then back out to slather her sphincter and outer ring. When you’ve deposited all the jar’s contents, you step back, plant your hands on Reaha’s ass to spread her open, and watch as the drugs do their work.");
			output("\n\nReaha’s tail shoots out straight a second later, and a full-body shudder rocks through the fleshy slut. <i>“O-oh! My ass!”</i> she whines, clenching her tail-hole tight... right up until it starts to puff out and grow. You watch with glee as Reaha’s once-unremarkable bum plumps up. The ring fattens and grows, almost like watching fresh bread rise in fast-forward - when it stops, there’s a thick black ring where Reaha’s asshole used to be, about as thick as your thumb and as fat as a silver dollar.");
			output("\n\n<i>“Unf, it feels like I’ve got something thick in there already... and it feels <b>good!</b>”</i> Reaha moans, biting her lip and closing her eyes. A moment later, the plump pucker before you opens up, just a hair’s breadth, as Reaha reasserts control over her modified body. <i>“Go on, stick a finger in - I wanna feel you in me, right now!”</i>");
			output("\n\nYou give her what she wants, pressing the tip of a digit into the pliant, plump ring of her newly-softened ass. It takes no effort at all to spread her donut-like ring open, making it soak up your finger to the first knuckle. Reaha gasps, moans, and greedily thrusts back against your hand until your finger’s fully buried. <i>“Oh God! Oh <b>yes!</b> Aaahhh!”</i>");
			output("\n\nSeeing what’s coming, you quickly start thrusting, pumping a second finger in along with the first and drilling them deep into Reaha’s ass. She clenches down with a soft, almost spongy grip, moistened by cream and some sort of new anal lubricant. Meanwhile, her quim sputters and drools, cumming without so much as a touch to her actual sex. Hell, not even her tits: this is all anal, beginning to end. You give the lusty bovine a slap on the rump and keep thrusting until she’s ridden her climax out and slumps weakly off your finger, collapsing into her bunk with an audible <i>“Oof!”</i> and a long, low moan.");
			output("\n\n<i>“Gimme a sec to catch my breath and we can really test this out...”</i> Reaha murmurs, reaching a hand back to circle her plump butt. <i>“If a finger can do that... unf.”</i>");
			processTime(10);
			pc.changeLust(10);
			pc.destroyItemByReference(item);
			reaha.ass.addFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
			clearMenu();
			addButton(0,"Buttfuck",buttFuckReahaSlooot);
			return;
		}
		//Second Time Anusoft
		//PC must have a cock or hardlight panties.
		else if(!reaha.ass.hasFlag(GLOBAL.FLAG_PUMPED))
		{
			output("\n\nYou pull another dose of anusoft out of your pack and flash the label at Reaha. She blinks in surprise, but a big ol’ grin soon spreads across her face as she mulls the prospect over. <i>“My new ass not good enough for you yet, captain?”</i> she teases, already bending over");
			if(reaha.isCrotchGarbed()) output(" and pulling at her garments");
			output(". <i>“Man, if I’m already a one-finger quick-shot back there, what’s a second dose gonna do to me? Am I gonna be cumming just from feeling my big, black donut getting rubbed when I walk? Or are you gonna have your face buried back in there enjoying it so much I don’t need to worry about moving?”</i>");
			output("\n\nReaha wiggles her hips invitingly, crawling up onto her bed and presenting her already plumped-up asshole for you inspection. You follow her, tracing the tip of a finger around her thick rim - just that little touch makes her moan. When your tip presses against her hole, she cries out and grabs her tits, trying to keep still despite the pleasure. That’s the stuff! You wiggle your fingertip around, pushing in just to the nail. As sure as sunfire, Reaha’s twin holes clench, and a thick trickle of lube runs down her thighs. Whimpers of pleasure murmur up from her throat no matter how much she tries to hold back.");
			output("\n\nYou’re really turning Reaha into a shameless anal addict, aren’t you?");
			output("\n\nEnough foreplay. You twist open the container and scoop out the cream onto your fingers, lathering up before smearing it through the crack of Reaha’s ass. She gasps at the shock of cold, but it turns into a lustful purr as you start to spread the stuff around, coating her plump pucker ring in glistening anusoft. The rest of the cream goes inside, smearing it around the inside of her derriere, just inside the lip-like sphincter. Gotta make sure she’s nice and stretchy-soft inside and out!");
			output("\n\nReaha loves every second of it, pushing back against your hand and showering you in a chorus of moans, groans, and sweet pleasured whimpers. Of course, that’s only partly due to your finger-fucking her: while you’re still buried knuckle-deep in Reaha’s pucker, her plump ring starts to thicken and expand, swelling up and out away from her behind. A rubbery tightness squeezes down on your digit, wrapping you up in a warm, almost spongy grip that clenches rhythmically around you.");
			output("\n\n<i>“Oh God, it feels so... so <b>fat</b>!”</i> Reaha groans, squeezing down as hard as she can... which feels just like a feather’s kiss on your [pc.skinFurScales]. Just to show her how deliciously right she is, you reach in and pinch one edge of the fat black rim - each side is as thick as a finger now, and you’re able to roll her rim between your fingers until Reaha’s trembling in your grasp.");
			output("\n\nGrinning, you release her and step back, admiring your work. Reaha’s asshole is plump, black, and utterly bestial - it looks like it would belong more on a randy leithan than a humanoid girl, and the sheer thickness of it keeps her asscheeks spread just a little, showing off her donut-like tailhole for anyone to see.");
			output("\n\nIt takes a moment for Reaha to catch her breath after that. When she does, she rights herself and turns to you with a look of wanton, unabashed desire on her blushing face. <i>“I need you. Right now. Please, [pc.name].”</i>");
			processTime(10);
			pc.changeLust(10);
			pc.destroyItemByReference(item);
			reaha.ass.addFlag(GLOBAL.FLAG_PUMPED);
			reaha.ass.delFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
			clearMenu();
			addButton(0,"Buttfuck",buttFuckReahaSlooot);
			return;
		}
		//3rd+ Time
		else
		{
			output("\n\nYou consider giving Reaha another dose of anusoft, but her asshole is already as plump and succulent as it can get from that particular drug.");
			processTime(3);
			clearMenu();
			addButton(0,"Next",curedReahaApproach);
			return;
		}
	}
	pc.destroyItemByReference(item);
	processTime(3);
	clearMenu();
	addButton(0,"Next",curedReahaApproach);
}


//OLD reahaBootOffShip
//New Boot Reaha Option
//FreedReaha Only. SlaveReaha has same reactions as before.
//Replace normal [Boot Reaha] text as follows.

public function bootReahaOffShipIfFreed():void
{
	clearOutput();
	reahaHeader();
	
	output("<i>“Hey, Reaha, you mind jumping ship for a while? I need to free up some room.”</i>");
	output("\n\nReaha chews her lip a moment before giving you a great big shrug. <i>“I guess, sure. I’ll wait for you on Tavros station - maybe hang out at that nursery your dad bought.");
	if(ChildManager.numChildrenAtNursery() >= 1) output(" I can at least make myself useful there. I’m sure the staff wouldn’t mind another wetnurse, right?");
	output(" That sound okay?”</i>");
	output("\n\nYou nod. <i>“Sounds perfectly alright.”</i>");
	output("\n\n<i>“Great! I’ll pack up and be out of here in a few minutes. Don’t forget about me, okay?”</i>");
	output("\n\nYou promise that you won’t, and find yourself spending the next few minutes helping Reaha pack up her belongings and calling a taxi for her. When it docks with you, she says goodbye by way of a bear hug, squeezing her tits between the two of you in that heavy, full way only a cow-girl can, and plants a kiss on your cheek. <i>“See you soon, [pc.name]!”</i>");
	output("\n\nYou wave as she cycles through the airlock, and is whisked away back to Tavros.");
}

// Reaha the Nursemaid
// Change when you have visited the nursery and have at least 1 kid. Now when you kick Reaha off the ship, add her to the Nursery. Change the following tooltip during her Boot Off scene:
// Go to Tavros
// Requires: 50 Credits
// Tell Reaha to go to Tavros Station. Since the Nursery’s opened up, you can probably send her there...
public function reahaCanGoToNursery():Boolean
{
	return (reahaIsCured() && visitedNursery());
}
public function reahaAtNurseryCafeteria():Boolean
{
	return (reahaAtNursery() && hours >= 09 && hours <= 17 && ChildManager.numChildrenAtNursery() >= 1);
}
public function reahaAtNurseryFoyer():Boolean
{
	if(reahaAtNurseryCafeteria()) return false;
	return (reahaAtNursery());
}

// Recover Reaha
// Add to PC’s nursery foyer:
public function reahaNurseryFoyerBonus(btnSlot:int = 0):void
{
	output("\n\nReaha’s wandering around, making herself as useful as you can.");
	if(ChildManager.numChildrenAtNursery() <= 1)
	{
		output(" She’s tidying the place up, barren as it is.");
		if(!(reaha.armor is MaidOutfit) && !(reaha.armor is MaidUniform)) output(" You’re a bit sad to see she’s lacking a full maid outfit to complete the picture");
		else output(" She’s even got her maid outfit on to completely the picture, though it’s been made a lot less risque than you remember. No doubt Briget’s doing");
		output(".");
	}
	else
	{
		output(" She’s clearly been getting used quite a bit by your offspring, and her breasts look more drained than you’ve ever seen them - they look positively tiny under her " + (!reaha.isNude() ? "[reaha.clothes]" : "clothes") + ".");
		if(reaha.isNude()) output(" You imagine Briget must have given her those to wear while she’s here.");
	}
	output(" Reaha perks up when you enter, and flashes you an inviting smile.");
	
	// [Reaha]
	addButton(btnSlot, "Reaha", reahaNurseryFoyerApproach);
}

public function reahaNurseryFoyerApproach():void
{
	clearOutput();
	reahaHeader();
	
	output("You head over to Reaha, putting a hand around her waist and pulling the little cow into a hug - one she welcomes with a smile and a giddy squeal. <i>“Hey, [pc.name]! Good to see you!”</i>");
	output("\n\n");
	
	processTime(1);
	
	// [Rejoin Crew] [Leave]
	clearMenu();
	addButton(0, "Rejoin Crew", reahaBackAtNurseryFoyerRejoin);
	addButton(14, "Leave", mainGameMenu);
}
public function reahaBackAtNurseryFoyerRejoin():void
{
	clearOutput();
	reahaHeader();
	
	output("<i>“Ready to get on outta here?”</i>");
	output("\n\n<i>“You mean, back aboard your ship?”</i> she asks, clearly hopeful. You nod, and Reaha beams. <i>“You bet I am!”</i>");
	output("\n\nWith a chuckle, you ruffle Reaha’s strawberry hair and tell her to pack her bags, sending her off towards her quarters with a slap on the rear that makes her flesh jiggle. She gives you a wink over her shoulder and says she’ll see you back aboard ship!");
	output("\n\n(<b>Reaha has rejoined your crew!</b>)");
	output("\n\n");
	
	processTime(15);
	flags["REAHA_IS_CREW"] = 1;
	
	addNextButton(mainGameMenu);
}

// Find Reaha Again, Tavros Station
// Add to Nursery cafeteria
public function reahaNurseryCafeteriaBonus(btnSlot:int = 0):void
{
	output("\n\nReaha’s made herself at home in the kitchen, cooking up a storm. Her magic milker is close at hand and clearly used quite recently -- looks like she’s using some <i>very</i> fresh ingredients. The little cow perks up when she sees you, flashing you a hopeful smile.");
	
	// [Reaha]
	addButton(btnSlot, "Reaha", reahaNurseryCafeteriaApproach);
}
public function reahaNurseryCafeteriaApproach():void
{
	clearOutput();
	reahaHeader();
	
	output("<i>“Hey, Reaha,”</i> you say, leaning against the serving counter. The moment her name leaves your lips, her bovine ears flip up and her tail starts swishing.");
	if(reaha.isNude()) output(" She’s got an apron on over a pair of jeans and a blouse that looks like it’s straight from Bridget’s closet. It’s a good look for the little cow.");
	output("\n\nShe gives you a demure smile and sets aside the mixing bowl she’s working with, giving you her full attention. <i>“Hi, [pc.name]. This nursery of yours is amazing! It’s like the daycare I used to go to on New Texas but a thousand times more high tech. Look at all the robots and stuff,”</i> she giggles. <i>“But as cute as your kid" + (ChildManager.numChildrenAtNursery() == 1 ? " is" : "s are") + ", I’d rather be with you...”</i>");
	output("\n\n");
	
	processTime(1);
	
	// [Rejoin Crew] [Leave]
	clearMenu();
	addButton(0, "Rejoin Crew", reahaBackAtNurseryCafeteriaRejoin);
	addButton(14, "Leave", mainGameMenu);
}
public function reahaBackAtNurseryCafeteriaRejoin():void
{
	clearOutput();
	reahaHeader();
	
	output("You grin and put an arm around the cow-girl’s shoulders. <i>“Ready to get on out of here?”</i>");
	output("\n\n<i>“You mean, back aboard your ship?”</i> she asks, clearly hopeful. You nod, and Reaha immediately hops into your arms, hugging you tight. <i>“Yay! I-I mean, uh, yes, absolutely. Ready whenever you want me back...”</i>");
	output("\n\nWith a chuckle, you ruffle Reaha’s strawberry hair and tell her to pack her bags. She heads off at a jog for her room to grab her bag and says she’ll meet you back aboard ship. You send her off with a playful swat on the rear, making her");
	if(reaha.isNude()) output(" tattooed");
	output(" rump jiggle obscenely as she scampers off.");
	output("\n\n(<b>Reaha has rejoined your crew!</b>)");
	output("\n\n");
	
	processTime(15);
	flags["REAHA_IS_CREW"] = 1;
	
	addNextButton(mainGameMenu);
}