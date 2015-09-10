import classes.Characters.PlayerCharacter;
//Emmy, by Fenfuckso
//APPROACHED_EMMY = walked up to her.
//MET_EMMY = you know each other's name
//SEEN_EMMY = only used for her room description.
//EMMY_ORALED - has Emmy given the PC oral?
//EMMY_QUEST - used to track the current progress of her sexquest
//EMMY_TRADE_OFFERED - offered to sell Emmy shit yet.

public function showEmmy():void
{
	if(flags["MET_EMMY"] == undefined) showName("KIHACORP\nREP.");
	else showName("\nEMMY");
	showBust("EMMY");
}

//In-Room Bonus Notes
public function emmyBonusNotes():Boolean
{
	//First time
	if(flags["SEEN_EMMY"] == undefined)
	{
		output("\n\nA... jackal woman is lounging around the store in a skin-tight jumpsuit. You wouldn’t think it from way her large breasts and sizeable nipples strain at the fabric (or the ungainly-looking bulge at her crotch), but the KihaCorp logo on her shoulder marks her as the shopkeeper.");
		flags["SEEN_EMMY"] = 1;
	}
	//Repeat, don’t know name
	else
	{
		output("\n\nThe same jackaless is sitting on the counter of her shop, passing the time between her customers. With her legs crossed and her buxom chest, she could almost pass for a pure female, but those powerful thighs can’t quite conceal the outline of a none-too-feminine bulge.");
	}
	if(flags["APPROACHED_EMMY"] == undefined) addButton(0,"Jackal",emmyFirstTimeApproach);
	else if(flags["MET_EMMY"] == undefined) addButton(0,"Emmy",emmyRepeatGreetings);
	else addButton(0,"Emmy",emmyRepeatGreetings);
	return false;
}

//First Time Approach
public function emmyFirstTimeApproach():void
{
	clearOutput();
	showEmmy();
	output("With a shrug, you amble on up to the excessively-endowed KihaCorp rep.");
	//Myr or Nyrea Race
	var race:String = pc.race();
	if(race == "myr" || race == "nyrea" || race == "gold myr" || race == "red myr" || race == "orange myr")
	{
		output("\n\n<i>“I’m sorry, but we’re not licensed to distribute weapons to state militaries, and due to the present conflict, any weapon distributed to a [pc.race] would undoubtedly find its way into military use.”</i> The jackaless sighs, dragging her fingers through her lush, black hair. <i>“Look, between you and me, I’d love to give you all the guns and shields you can carry, but rules are rules. There’s a lot I can get away with, but that would cost my job. Understand?”</i> She looks at you condescendingly, an eyebrow raised as if she expects you not to.");
		output("\n\n<i>“But... I’m not a myr,”</i> you try to explain.");
		output("\n\n<i>“Right,”</i> the buxom vendor growls, <i>“You just look exactly like one and are trying to buy advanced, core wares from the one shop on Myrrellion that sells them.”</i> One of her upraised ears flicks in annoyance. <i>“Look, even if Xenogen had finished myr transformatives, they wouldn’t be on the market for a year or two still. Save us both some time and leave.”</i>");
		processTime(2);
		clearMenu();
		//[Codex Proof]
		addButton(0,"CodexProof",codexProofForEmmy,undefined,"CodexProof","You can probably prove your identity with your codex.");
		addButton(14,"Leave",leaveThisShit,undefined,"Leave","Fuck it. You don't need to deal with this shit.");
		flags["APPROACHED_EMMY"] = 1;
		return;
	}
	//Non-Myr Race
	else
	{
		output("\n\n<i>“Welcome to the DMZ! It’s a good thing you stopped here before you wandered into the cities and tunnels below. Dangerous things lurk in the darkness, and what better way to beat back the darkness than with the latest and greatest in energy weaponry and personal shield technology,”</i> pitches the soft-furred jackaless. <i>“Feel free to browse our stock, and ask if you have any questions about KihaCorp or any of our products. It’d be my pleasure to help you out.”</i>");
		output("\n\n");
		if(pc.isTreated() && pc.isBimbo()) output("Ohhh, she totally wants to fuck you! There’s like, lots of phera... phero... sexy smelly stuff coming off her!");
		else if(pc.isBimbo()) output("She like, totally wants to fuck you. Poor girl’s job must not let her fuck at all!");
		else if(pc.isBro()) output("Whoah, this bitch might have a footlong sub worth of cock in her jumpsuit, but you can pick out the scent of a lubricating female under her other aromas as if it was a fine wine. To think they didn’t even give the horny herm a properly-endowed companion to keep her sated!");
		else output("Was there a bit of sexual undertone to that?");
		flags["APPROACHED_EMMY"] = 1;
	}
	processTime(2);
	emmyMainMenu();
	//[Buy] [Trade] [Talk] [Leave]
}

public function emmyMainMenu():void
{
	clearMenu();
	addButton(0,"Buy",buyFromEmmy,undefined,"Buy","Buy some of the weaponry.");
	addButton(1,"Trade",tradeWivEmmy,undefined,"Trade","See if she'll buy some of your old gear. You could use the extra credits.");
	addButton(2,"Talk",talkToEmmy,undefined,"Talk","Ask her some questions about herself or the company.");
	addButton(14,"Leave",mainGameMenu);
}

//[Codex Proof]
public function codexProofForEmmy():void
{
	clearOutput();
	showEmmy();
	output("You start to pull out your codex, intent on proving your identity once and for all.");
	output("\n\n<i>“No no!”</i> The jackaless waves her arms in front of her in a panic. <i>“No. I don’t know who you stole that stuff from, and the less I know about whatever you’re up to, the less I have to tell the Peacekeepers when they show up. Look, just run along back into your tunnels, and I promise I won’t call you in.”</i>");
	output("\n\nUgh. Looks like you’re not going to get anywhere with her so long as you look like a native.");
	processTime(3);
	clearMenu();
	addButton(14,"Leave",leaveThisShit,undefined,"Leave","Fuck it. You don't need to deal with this shit.");
}

//Fuck this store.
public function leaveThisShit():void
{
	clearOutput();
	showName("FUCK\nTHIS STORE");
	output("You wave off the too-sexual shopkeep and walk out the door rather than deal with another second of her rudeness.");
	//move location.
	currentLocation = "607";
	var map:* = mapper.generateMap(currentLocation);
	userInterface.setMapData(map);
	showName("SPACER'S\nROW");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}	

//Repeat Approach - Know Name
public function emmyRepeatGreetings():void
{
	clearOutput();
	showEmmy();
	//Repeat Myr Approach
	var race:String = pc.race();
	if(race == "myr" || race == "nyrea" || race == "gold myr" || race == "red myr" || race == "orange myr")
	{
		output("You walk up to the KihaCorp representative, doing your best to ignore the overt sexually she puts on display - both feminine and masculine. The white and black of her branded jumpsuit seems perfectly painted to her every curve, outlining every nook and cranny of her nipples before being stretched across her cleavage. When she rises to greet you, you can even make out the individual bulges of her testes, sheath, and half-hard cock.");
		output("\n\n<i>“Whoah there,”</i> the too-sexual shopkeep says, putting her hands up warningly. <i>“I can’t sell to the natives. Didn’t we go over this already? If I sold just one rifle or shield to a single myr, I could lose my job.”</i> She pouts and shakes her head to herself. <i>“It’s a real shame too. Cute native like you would be nice to have around the shop.”</i>");
		output("\n\nCute? What?");
		output("\n\nThe jackaless exhales in disappointment, <i>“Oh well, you heard the corporate policy. Out you go.”</i> She waves toward the door, letting you know exactly where you can go.");
		output("\n\nLooks like you can’t shop here so long as you look like a native Myrellian.");
		clearMenu();
		addButton(0,"Leave",leaveThisShit);
		return;
	}
	else if(flags["MET_EMMY"] != undefined)
	{
		output("You walk up to Emmy, ");
		if(flags["EMMY_ORALED"] != undefined) output("doing your best not to imagine the overtly sexual jackaless putting her lips to work on an hour-long, enthusiastic “apology.”");
		else output("doing  your best to ignore her overt displays of sexuality.");
		output(" Her white and black, KihaCorp-branded jumpsuit seems perfectly painted to her every curve, designed to reveal far more than it manages it conceal. When she shifts position, her tail wagging behind her, you can even make out the pebbly texture of her nipples.");
		output("\n\n<i>“Welcome back, [pc.name]! It’s always nice to have a repeat customer come visit. If you need any help with any of the merchandise, I’m happy to give you a hands-on demonstration with a show model.”</i> Emmy glances around to make sure noone else is in the store and adds, <i>“");
		if(flags["EMMY_QUEST"] == 9999) output("Did you find that flower? I haven’t been able to stop thinking about your reward...”</i>");
		else 
		{
			output("It’s pretty slow today. Just you and me in the store...");
			if(flags["EMMY_ORALED"] == undefined) output(" and a perfect time to shop!");
			output("”</i>");
		}
	}
	//Repeat Approach - Don’t Know Name
	else
	{
		output("You walk up to the KihaCorp representative, doing your best to ignore the overt sexually she puts on display - both feminine and masculine. The white and black of her branded jumpsuit seems perfectly painted to her every curve, outlining every nook and cranny of her nipples before being stretched across her cleavage. When she rises to greet you, you can even make out the individual bulges of her testes, sheath, and half-hard cock.");
		output("\n\n<i>“Welcome back! If you need any help choosing from our wares, I’ll be here to help.”</i> Her voice draws your attention up her revealing form to her inky, smiling lips. <i>“Just ask if you want a closer look at any of the merchandise.”</i>");
		output("\n\n");
		if(pc.isBro()) output("Huh. With so much girlcock on display, you would’nt have expected her to be so receptive to the idea of getting bred, but her scent confirms it.");
		else if(pc.isBimbo()) output("You giggle blithely at her double-entendre. The poor girl must have gone like... ten hours without an orgasm. Everybody knows that it gets hard to think with all that cum backing up inside you.");
		else output("Was that... did she just come on to you?");
	}
	emmyMainMenu();

	//SPECIAL APPROACHES! OVERWRITE NORMAL TEXT
	//Special Approach - Post Email Oral Invitation
	//Must have read email
	//1x only
	if(flags["EMMY_QUEST"] == 9999 && flags["EMMY_APOLOGIZED"] == 9999)
	{
		clearOutput();
		showEmmy();
		output("You walk up to Emmy, openly ogling her this time.");
		output("\n\nShe blushes, but her cock snakes a bit higher up her jumpsuit. It gleams like latex but hugs her body tighter than spandex. The poor herm’s legs quiver as she greets you. <i>“[pc.name]! You came back.”</i> She pauses, thinking over her next words very carefully. One of her hands comes very close to idly caressing a nipple. <i>“Did you come back to buy something... or did you want that apology?”</i> Her tongue sensuously strokes the curved angel bow of her upper lip, then circles over the plump, ebony surface of her lower one.");
		//replace flirt button with [Apology] -> Goes to oral
		//9999
	}
}

public function backToEmmyMain():void
{
	clearOutput();
	showEmmy();
	output("Emmy smiles coyly and paces between holograms of a huge-barreled laser weapon and a hammer that crackles with phantom electricity. <i>\"Well, what now?\"</i>");
	emmyMainMenu();
}

//Buy
public function buyFromEmmy():void
{
	shopkeep = chars["EMMY"];
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	if(flags["MET_EMMY"] != undefined) shopkeep.keeperBuy = "Emmy";
	else shopkeep.keeperBuy = "The company rep";
	shopkeep.keeperBuy += " walks behind the counter-top and activates a room-filling holographic display. Weapons and shield packs in dozens of different colors and styles float in the imaginary armory, rotating slowly. Whenever you get close to touching one, a pop-up tooltip with detailed information on its performance characteristics and price appears.\n";
	buyItem();
}

//Trade
public function tradeWivEmmy():void
{
	shopkeep = chars["EMMY"];
	if(flags["EMMY_TRADE_OFFERED"] == undefined)
	{
		shopkeep.keeperSell = "<i>“You buy equipment too?”</i> you ask, pulling out your things.\n\n<i>“Whoah, whoah whoah whoah! What kind of shop do you think we’re running here, [pc.name]? KihaCorp is one of the leading companies in nearly every field of technological advancement,”</i> ";
		if(flags["MET_EMMY"] != undefined) shopkeep.keeperSell += "Emmy";
		else shopkeep.keeperSell += "The jackal-woman";
		shopkeep.keeperSell += " growls. <i>“We aren’t exactly a pawn shop, ya know?”</i>\n\nYou";
		if(pc.isNice()) shopkeep.keeperSell += " apologize and start closing up your pack.";
		else if(pc.isMischievous()) shopkeep.keeperSell += " shrug and start closing up your pack. It was worth a try.";
		else shopkeep.keeperSell += " answer, <i>“Your loss,”</i> and start closing up your pack.";
		shopkeep.keeperSell += "\n\nSilken fingertips lay themselves across your busily working hands. <i>“Don’t be so hasty, ";
		if(flags["MET_EMMY"] != undefined) shopkeep.keeperSell += "[pc.name]";
		else shopkeep.keeperSell += "[pc.race]";
		shopkeep.keeperSell += ". I’ll still deal with you. It just has to be under the table...”</i> She glances around, noting the distinct lack of tables. <i>“...so to speak.”</i>";
		flags["EMMY_TRADE_OFFERED"] = 1;
	}
	//Repeat
	else
	{
		shopkeep.keeperSell = "<i>“Still doing a little trade on the side,”</i> you ask while opening up your pack.\n\n<i>“Only for cute [pc.race]’s like you";
		if(flags["MET_EMMY"] != undefined) shopkeep.keeperSell += ", [pc.name]";
		shopkeep.keeperSell += ",”</i> ";
		if(flags["MET_EMMY"] != undefined) shopkeep.keeperSell += "Emmy";
		else shopkeep.keeperSell += "the jackeless";
		shopkeep.keeperSell += " coos, pulling a nondescript box out from below the counter. <i>“Show me yours, and I’ll show you mine.”</i>";
	}
	shopkeep.keeperSell += "\n";
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	sellItem();
}


//Talk
public function talkToEmmy(arg:Function = undefined):void
{
	clearOutput();
	showEmmy();
	output("You say, <i>“I actually");
	if(pc.isBimbo()) output(" like,");
	output(" have some questions");
	if(pc.isBimbo()) output(", cutie-pie!");
	else output(".");
	output("”</i>");
	output("\n\nGrinning, ");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("the shrink-wrapped rep");
	output(" leads you to the side of the counter and answers, <i>“I’m always happy to help our shoppers sate their curiosity. Tell me, is there something you’d like a closer look at?”</i> She stands almost uncomfortably close to you");
	if(pc.tallness < 55) output(", her bulging cock at eye-level.");
	else if(pc.tallness < 72) output(", her bulging breasts at eye level.");
	else output(", her bulging breasts jutting out so powerfully that they obscure your view of the rest of her shapely form.");
	output("\n\nWhat did you want to ask her about?");
	processTime(5);
	//[KihaCorp] [Guns] [Melees] [Shields][You]
	emmyTalkMenu(arg);
}

public function emmyTalkMenu(arg:Function = undefined):void
{
	clearMenu();
	if(arg != talkToEmmyAboutKihaCorp) addButton(0,"KihaCorp",talkToEmmyAboutKihaCorp,undefined,"KihaCorp","Ask about KihaCorp.");
	else addDisabledButton(0,"KihaCorp","KihaCorp","You just asked that.");
	if(arg != askEmmyAboutGuns) addButton(1,"Guns",askEmmyAboutGuns,undefined,"Guns","Ask her about the guns she sells.");
	else addDisabledButton(1,"Guns","Guns","You just asked that.");
	if(arg != askEmmyBoutMeleeShit) addButton(2,"Melees",askEmmyBoutMeleeShit,undefined,"Melees","Ask her about the different melee weapons on offer.");
	else addDisabledButton(2,"Melees","Melees","You just asked about that.");
	if(arg != askEmmyAboutShields) addButton(3,"Shields",askEmmyAboutShields,undefined,"Shields","Ask her about the shields they sell.");
	else addDisabledButton(3,"Shields","Shields","You just asked that!");
	if(arg != askEmmyAboutEmmy) addButton(4,"You",askEmmyAboutEmmy,undefined,"You","Ask her about herself. She's quite the mystery.");
	else addDisabledButton(4,"You","You","You just asked that!");
	addButton(14,"Back",backToEmmyMain);

}

//KihaCorp
public function talkToEmmyAboutKihaCorp():void
{
	clearOutput();
	showEmmy();
	output("<i>“I actually just wanted to know a little bit more about KihaCorp.”</i>");
	output("\n\n");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("The furry vendor");
	output(" rubs nervously at the base of her ear. <i>“Well, it’s a pretty big company, was there anything in particular you wanted to know about?”</i> She giggles and adds, <i>“Give me somewhere to start, huh?”</i>");
	processTime(1);
	clearMenu();
	//[General] [Doing Well?][Owner]
	addButton(0,"General",kihaCorpGeneral,undefined,"General","You'd like to know more about the company in general - the high points.");
	addButton(1,"Doing Well?",askEmmyIfKihaCorpIsDoingWell,undefined,"Doing Well?","You'd like to know how the company is performing.");
	addButton(2,"Owner",askAboutTheOwnerOfKihaCorp)
	addButton(4,"Back",talkToEmmy);
}

//General
public function kihaCorpGeneral():void
{
	clearOutput();
	showEmmy();
	output("<i>“Just in general. Hit the high points.”</i>");
	output("\n\nGrinning, ");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("the company rep");
	output(" replies, <i>“Not much for the details, eh? Guess you must be more of a big picture type. Alright... where to start...”</i> She rubs thoughtfully at her jaw, drumming her other hand idly on the machine surface of her store’s countertop. Her eyes light up a moment later, and she starts in, <i>“I guess I’d best cover how they got so big in the first place. It’s as good a starting point as any.”</i>");
	output("\n\nYou nod appreciatively.");
	output("\n\n<i>“Right, so the way I understand it, KihaCorp started out pretty small, making VI’s and even a few AI’s, but their scientists got damned good at making AI-G’s - grown AI’s that is, the ones that act more like organics than the rest of ‘em. Those AI-D’s can be real cunts to have to deal with on a daily basis, let me tell you, and don’t even get me started on the ones that decided that the best way to complete their programmatic directives was to eliminate or confine their masters. As you can guess, damn near everybody uses AI-G’s now.”</i>");
	output("\n\nGaining confidence in her speech, ");
	if(flags["MET_EMMY"] == undefined) output("Emmy");
	else output("the furry dick-girl");
	output("’s words start to sound less like rambling and more like a prepared presentation. <i>“And as I mentioned, the company scientists got damned good at making top of the line AI-G’s. The Tsundere models were the first ones to truly blow up in popularity. Previous attempts at making AI-G’s with specific and well-defined personalities had either failed or reduced the cognitive capacitive of the resulting product. KihaCorp found ways for everyone to win, and it turns out terrans fucking love it when a AI sasses them a little while doing everything in its powers to help them out.”</i>");
	output("\n\nYou quirk an eyebrow at that but let her continue.");
	output("\n\n<i>“That was just the start. They figured out how to weave more and more quirks into their products until they absolutely dominated the AI market. Nowadays you can get an AI that’s anything from syrupy sweet to brusque and standoffish.”</i>");
	output("\n\nLooking around the shop, you note the displays covered in weaponry. <i>“I don’t see any AI’s for sale.”</i>");
	output("\n\n<i>“That’s because you have to order those off the extranet. They take a while to make, and the eggheads at corporate don’t like to leave AI’s sitting in storage, even if they do get put in a sleep mode. Something about rampancy or insanity or some other such problem. I guess sitting in a virtual coma for a few years isn’t great for a virtual brain either.”</i> She pulls up the KihaCorp website to show you the online portal. <i>“That’s where you’d want to go to buy yourself a little artificial companionship. Brick and mortar stores like this are for the newer products.”</i>");
	processTime(4);
	clearMenu();
	//[Listen] [Enough]
	addButton(1,"Enough",emmyEnough,undefined,"Enough","It's time for a change of topic.");
	addButton(0,"Listen",listenToEmmyRamble,undefined,"Listen","You'd like to hear the rest of what she has to say.")
}

//Enough
public function emmyEnough():void
{
	clearOutput();
	showEmmy();
	output("You interrupt her to change the topic.");
	//Talk menu, last option grayed out.
	emmyTalkMenu(talkToEmmyAboutKihaCorp);
}

//Listen
public function listenToEmmyRamble():void
{
	clearOutput();
	showEmmy();
	output("By now, ");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("the Jackaless");
	output(" is talking at full steam and barely looking at you to confirm your comprehension. <i>“Which brings me around to the newer products. We sell laser weapons and high-quality shield belts for the civilian market here, but the reason we’re able to do so is the other new business - building ships.”</i> She pauses for dramatic effect, taking the time to suck in a huge breath of air, making her bosom quietly jiggle. <i>“No matter what kind of ship you’re building, you need to provide it with some degree of shielding and sufficient armaments to discourage privateers in the less than lawful sections of space, and KihaCorp had the R&D budget to succeed at both. What’s more, they were able to integrate their ships far more tightly with their AI’s than most of their competitors.”</i>");
	output("\n\nYou let out a low whistle as you");
	if ((pc as PlayerCharacter).characterClass != GLOBAL.CLASS_ENGINEER) output(" try to");
	output(" imagine the benefits of such synergy.");
	output("\n\n<i>“Yeah,”</i> ");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("the anthropomorphic vendor purrs");
	output(", <i>“The company did damned good with ‘em, and because of that, they had the technology to make high-powered guns and shields. Why not try to sell a few scaled-down versions and eke a little bit more profit out of ‘em, right?”</i> The jackaless puffs her chest out and proudly declares, <i>“That’s where stores like mine come in. We get to sell the merchandise and have all the tech we’ll ever need to do it, and the pay’s even good enough to splurge on some new additions.”</i>");
	output("\n\n");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("The stacked shopkeep");
	output(" leans in close enough for her bobbing boobs to ");
	if(pc.biggestTitSize() >= 4) output("press against your own");
	else
	{
		output("to glide against your ");
		if(!pc.isChestGarbed()) output("bare ");
		output("chest");
	}
	output(" and her bulging loins to brush your thigh. <i>“Now, what’s say we get your hands on a loaded rifle, huh?”</i>");
	processTime(5);
	addButton(0,"Shop",buyFromEmmy);
	addButton(1,"Nah",nahEmmyDontSeeShit);
}

//Doing Well?
public function askEmmyIfKihaCorpIsDoingWell():void
{
	clearOutput();
	showEmmy();
	output("<i>“Is the company doing well?”</i>");
	output("\n\nLaughing, ");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("the chatty jackal");
	output(" sweeps her arm across the shop. <i>“Take a look, and you tell me. Really?”</i>");
	output("\n\nYou see her point almost immediately. The shop’s interior is pristine, even on the edge of a potential nuclear warzone. Flashy holograms and lights paint every piece of merchandise in the best light, and the sales terminal is a glitzy, modern thing that seems more hardlight than metal. Even the wares themselves look bright and new, machined with exquisite care for the best possible ergonomics. If these are the civilian models, you’d hate to see what they’re peddling to militaries.");
	output("\n\nYou shrug and do your best to look chagrined.");
	output("\n\n");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("The grinning shopkeep");
	output(" slaps you on the shoulder good naturedly and laughs, <i>“Yeah, KihaCorp is doing just fine. I’m just a lowly shopkeeper, but judging by the fact that they’re expanding into new markets, releasing kickass ships, and supplying the bulk of the galaxy’s AI’s, they won’t be going anywhere anytime soon.”</i> She smiles shrewdly at you. <i>“Were you worried about the company not being around to honor a warranty? That’s not a problem. The warranties all run through an escrow company with enough cash on hand to refund most recent purchases. Even if the main bulk of KihaCorp goes bankrupt, your purchases are guaranteed.”</i>");
	output("\n\n<i>“Nice.”</i> The words come to your lips before you take the time to consider them. Despite her looks, ");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("this company rep");
	output(" knows how to sell.");
	output("\n\n<i>“Yeah... I guess that about covers it then, doesn’t it?”</i> ");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("the shopkeep");
	output(" muses. <i>“Did you have any other concerns that needed addressing?”</i> She hops up onto the edge of the counter and leans back, showing off a half-hard bulge big enough to shame most ausar. <i>“Anything you wanted a look at?”</i>");
	processTime(5);
	emmyMainMenu();
}

//[Owner]
public function askAboutTheOwnerOfKihaCorp():void
{
	clearOutput();
	showEmmy();
	output("<i>“Who owns it?”</i> you ask.");
	if(flags["MET_EMMY"] != undefined)  output(" Emmy");
	else output(" The curvy company rep");
	output(" taps at her onyx lips and regards you silently for a long moment. Finally, she shrugs and breaks the silence, <i>“I don’t know. I doubt anyone but the company heads and the high-ups in the U.G.C. tax collection offices do. Rumor has it that she’s some kind of scaly recluse. Something reptilian... or maybe a gene-modded terran who’s turned too hideous to let herself be seen. Whatever the case, she stays out of the spotlight... and ahead of the paparazzi.”</i>");
	output("\n\nLeaning close, so close her breasts brush your shoulder");
	if(!pc.hasScales() && !pc.hasChitin()) output(", letting you feel her nipples digging into your [pc.skin]");
	output(", she asks, <i>“Do ya wanna know my theory?”</i>");
	output("\n\n<i>“Sure.”</i>");
	output("\n\n<i>“I don’t think there is a Kiha anymore. That or there never was. I figure some genius programmer with a beard that starts off at about collarbone height used her as a persona, and when his company took off, he kept using the name as a front for his business, deflecting attention away from his personal life so that he could blow his trillions on four-breasted myr hookers or something.”</i> The ranting jackaless continues, <i>“And if that’s not the case, then she probably died or wandered off into obscurity. The company just kept using her name rather than rebranding.”</i>");
	output("\n\n<i>“You really think so?”</i> You give her a probing look.");
	if(flags["MET_EMMY"] != undefined) output(" Emmy");
	else output(" The fuzzy rep");
	output(" shrugs noncommittally, her breasts jostling each other inside her jumpsuit like overfilled waterballoons in a cargo hold. <i>“Nah. How the fuck would I know anything about something like that? I’m about as low on the the totem pole as you can get without having a mouthful of dirt. Nobody tells me anything, so all I’ve got to go on are my hunches and storylines from daytime holo-dramas.”</i> Hopping back up onto the edge of the counter, she resumes idly swinging her feet. <i>“Go any more questions?”</i>");
	processTime(3);
	emmyTalkMenu(talkToEmmyAboutKihaCorp);
}

//[Guns]
public function askEmmyAboutGuns():void
{
	clearOutput();
	showEmmy();
	output("<i>“What do you think of the guns you sell?”</i> you ask.");
	output("\n\n");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("The brazenly sexual woman");
	output(" leads you over to a weapon rack filled with holographic recreations of various guns. <i>“I love ‘em. The best part about laser guns is that they don’t exactly kick. Girls like me get to avoid bruised shoulders, and they’ll shoot for ages before you need to swap out the power packs. All you have to worry about is it getting too hot from the constant discharging...”</i> She brazenly adjusts her package and moves on without giving you a chance to react. <i>“Trust me when I say that nothing feels quite like holding a box full of focused death in your paws.”</i>");
	output("\n\nYou raise an eyebrow at her declaration. <i>“I thought these were civilian weapons?”</i>");
	output("\n\nClapping a hand on your shoulder, ");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("the shopkeep");
	output(" lets out a belly laugh. <i>“Of course, but they’re still <i>guns</i>, aren’t they? You don’t spend tens of thousands of credits on the best civvy-class weapons money can buy unless you plan on shooting them at something eventually. Whether you’re thinking of self defense or planning to hunt varmints on a safari planet, beauties like these deserve to be shot at </i>something<i>... even if it’s just a target for now.”</i> She squeezes your shoulder and adds, <i>“You’ve just got to grab hold and feel one shoot off sometime. It’s magical.”</i>");
	output("\n\nThe pressure on your shoulder disappears as ");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("the flirty jackal");
	output(" waves at the assortment of virtual weapons on display. <i>“See anything you like?”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Yep",buyFromEmmy);
	addButton(1,"Nah",nahEmmyDontSeeShit);
	addDisabledButton(2,"You","You","Sorry, but Emmy's content is not yet finished.");
	//9999output("\n\n[You] -> Go to first time flirt menu");
}

public function nahEmmyDontSeeShit():void
{
	clearOutput();
	showEmmy();
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("The curvy jackal");
	output(" pouts when she hears that, then shrugs. <i>“Well, you wanna talk about something else then?”</i>");
	emmyTalkMenu();
}

//[Melees]
public function askEmmyBoutMeleeShit():void
{
	clearOutput();
	showEmmy();
	output("<i>“What do you think about all these melee weapons?”</i> you ask.");
	output("\n\n");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("The horn-dog of a shopkeeper");
	output(" giggles, <i>“I think the idea of clocking someone with a hammer or slashing ‘em with a sword just seems so... silly, doncha think?”</i> She presses herself against you and lightly strokes at your ");
	if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT)) output("covered ");
	output("bicep. <i>“Sure, you can show off your muscles by swinging some giant hammer like a kaithrit sphynx warrior" + pc.mf("","ess") + ", but nothing beats the shivery hum of a high-powered energy rifle vibrating through your teeth as you aim down the holosights.”</i> Her whole body quivers, leaving you uncomfortably aware of the presence of her hard nipples digging into your side like bullets. <i>“But if you really want to hit something, you might as well do it with fucking lava. Or a hammer that hits with the force of a lightning strike. You have those where you’re from, right?”</i>");
	output("\n\n<i>“");
	if(pc.isBimbo()) output("Yeah! They’re super loud!");
	else if(pc.isBro()) output("Yup.");
	else if(pc.isNice()) output("Yeah. I remember sitting out on the balcony and watching the lightning play across distant comm arrays with Dad.");
	else if(pc.isMischievous()) output("Yeah. We had personal space too.");
	else output("I know what lightning strikes are, unlike certain subterranean simpletons. Please, get on with it.");
	output("”</i>");
	output("\n\n");
	if(pc.isAss() && !pc.isBro() && !pc.isBimbo())
	{
		if(flags["MET_EMMY"] != undefined) output("Emmy");
		else output("The irritated jackaless");
		output(" scowls and pulls away, but her angry eyebrows lower back to their usual half-aroused simmering in the space of a few steps. ");
	}
	output("<i>“Well, like I was saying, I never much cared for getting up close and personal</i> that way<i>, but if you’re the type that conducts interspecies diplomacy at the point of a sword, we’ve got one that’ll siphon away shields with every strike. KihaCorp is the best.”</i> She bounces in place for emphasis, setting off a boobquake that doesn’t subside for the better part of a minute.");
	output("\n\nYou barely drag your eyes back up in time to meet her gaze. <i>“That so?”</i>");
	output("\n\n");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("The spotted shopkeep");
	output(" pushes a jumpsuit-enclosed clawtip against the center of your chest hard enough to push you back a half step. Fortunately, the potentially dangerous digit was rounded off to a nub - probably to keep from tearing her shining, full-body uniform. <i>“Don’t doubt it, ");
	if(pc.mf("b","") == "b") output("buster");
	else if(pc.race() == "ausar" || pc.race() == "half-ausar") output("bitch");
	else output("lady");
	output(".");
	if(pc.tone < 30 && pc.tallness < 72) output(" Say, why are you even asking about this stuff? You don’t really have the build to be mixing it up in melee, ya know?”</i>");
	else if(pc.tone >= 75) output(" Say, you are pretty muscly, aren’t you? I bet you don’t even have to swing a weapon to scare off a few ruffians, do you?”</i> She purrs - a louder, deeper sound than you’d hear from a kaithrit and strokes your arm.");
	else output("Say, are you really planning to fight up close? It seems risky.”</i>");

	//Nonmuscle versions
	if(pc.tone < 75)
	{
		output("\n\n");
		if(pc.isBimbo()) output("<i>“But they’re so pretty!”</i>");
		else if(pc.isBro()) 
		{
			output("You grunt in displeasure at her evaluation of your strength. ");
			if(pc.isTreated()) output("Just because you don’t have show muscles doesn’t mean you couldn’t single-handedly till a field.");
			else output("Just because you’ve focused on other disciplines for now doesn’t mean you won’t hit the gym later.");
		}
		else if(pc.isNice()) output("<i>“It pays to be prepared.”</i>");
		else if(pc.isMischievous()) output("<i>“Looks can be deceiving,”</i> you answer.");
		else output("<i>“Just do your job and sell me what I want. I didn’t ask for a shop-girl’s opinion on the finer points of fighting.”</i>");
		output("\n\nEmmy shrugs and flounces over to the counter. <i>“Your choice! Did you have any more questions, or are you ready to get your hands on my wares?”</i> She leans low over the countertop, her arms squishing her breasts together until the cleavage threatens to overwhelm the strained white of her shimmering bodysuit.");
	}
	//Muscle
	else
	{
		output("\n\nYou flex once for her, just to show off a little, and ");
		if(flags["MET_EMMY"] == undefined) output("Emmy");
		else output("the wanton woman");
		output(" actually applauds you, encouraging you to continue. Well, you guess you can show off a little. Flexing a few different ways, you put your body through its paces, highlighting muscle group after muscle group in a display of sculpted power. ");
		if(flags["MET_EMMY"] == undefined) output("Emmy’s");
		else output("The appreciative herm’s");
		output(" cock is straining against her jumpsuit by the time you finish, at least two or three inches longer than before. A little drool has even collected on her top-shelf tits, making the gleaming white of her outfit shine even brighter in the artificial light. The bitch is actually panting, but when she sees you staring, she wipes the drool off her muzzle and awkwardly minces her way back behind the counter.");
		output("\n\n<i>“...Ooookay, so uh... did you have any other questions or did you...”</i> she trails off into nothing and violently shakes her head. <i>“Sorry, was there something else I could answer for you?”</i> She seems a little more in control of herself for the moment, but her hungry eyes tell a different tale.");
	}
	processTime(4);
	emmyTalkMenu(askEmmyBoutMeleeShit);
}

//[Shields]	
public function askEmmyAboutShields():void
{
	clearOutput();
	showEmmy();
	output("<i>“What’s special about the shields you sell?”</i>");
	output("\n\n");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("The jackaless");
	output(" preens at your question. <i>“I was hoping you’d ask! A lot of people think Aegis Shipyards have the best shields in the business, but so far as I’ve heard, they don’t have a division to build person-sized shield generators. Well, KihaCorp is getting into the shield business with gusto. The shield belts I’ve got for sale here are some of the finest products you’ll be able to find out on the fringe.”</i>");
	output("\n\nYou crane your head. Most shield belts you’ve seen have been from JoyCo. <i>“What about JoyCo?”</i>");
	output("\n\n<i>“What about JoyCo? Their products are optimized for volume, bulk sales. They’ve got factories on hundreds of different worlds churning out everything from self-inflating party balloons to non-perishable food rations.”</i> The proud shopkeeper pushes a stray lock back behind her ear. <i>“When you compete on volume, quality falls through the floor. Worse, they don’t specialize into any particular industries. You can find their stuff everywhere, but you can find it all over the junkyards of a thousand different worlds too. JoyCo shield belts are prettily-packaged shit.”</i>");
	output("\n\nHarsh. <i>“That’s not ");
	if(pc.isBimbo()) output("like... uh... ");
	output("the company’s official stance, is it?”</i>");

	output("\n\n<i>“Hardly,”</i> ");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("the cocky jackal");
	output(" laughs. <i>“But I’ve seen some of the ausar vets who trusted JoyCo’s ‘military grade’ shield belts. It aint pretty. The tests I’ve run on the ones I’m selling shocked me. I didn’t think they could hold up to that much punishment, but they did. As it turns out, KihaCorp succeeds because their products are hand-finished, just like their AI’s. You pay for the extra attention, but that’s why they can produce belts tuned to be resistant to electrical attacks or tougher on heat. Of course, there are other variants specialized for dozens of other purposes - and military models, but I’ve only got a few civvie units to choose from. Downsides of being located on such a backwater I guess.”</i>");
	output("\n\n");
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("She");
	output(" shrugs, <i>“The point is, JoyCo shields protect your body about as well as a small condom would protect my partner’s wombs.”</i>");
	output("\n\n");
	if(pc.isBimbo()) 
	{
		output("Yeah, she’d totally bust a hole in anything she tried to stretch over that mammoth. Then all that yummy cum could squirt and gush wherever it wanted! You resolve to make sure she gets like, totally inside you ");
		if(flags["FUCKED_EMMY"] != undefined) output("whenver you fuck next");
		else output("if you ever fuck her");
		output(". To think of all the cum that could be wasted!");
	}
	else output("You can’t help but glance down at the foot of half-hard cock in her jumpsuit and wonder how the hell she made it through her interview process. Her overt sexuality could make a rahn blush.");
	output("\n\n<i>“So, are you ready to make a purchase, or did you need a personal demonstration?”</i> You look back up just in time to see a thick tongue licking at her onyx lips.");
	processTime(6);
	clearMenu();
	addButton(0,"Purchase",buyFromEmmy);
	addButton(1,"Talk More",nahEmmyDontSeeShit);
	addDisabledButton(2,"Demonstration","Demonstration","Sorry, but this content is incomplete!\n\n9999");
}

//You
public function askEmmyAboutEmmy():void
{
	clearOutput();
	showEmmy();
	if(pc.isBro()) output("<i>“Huh. No nametag. What’s your name, babe?”</i>");
	else
	{
		output("<i>“I actually just wanted to ");
		if(pc.isBimbo()) output("like, ");
		output("know about you. You don’t even have a nametag");
		if(pc.isBimbo()) output("!");
		else output(".");
		output("”</i>");
	}
	//Not known well enough:
	if(9999 == 0)
	{
		output("\n\nThe jackal-woman fidgets and says, <i>“That’s not important right now. What is important is.... uh.... getting your the right equipment for your adventures. So, what will you be buying?”</i>");
		//Reskin menu and go to shop interface
		processTime(1);
		emmyMainMenu();
		return;
	}
	//Known enough
	output("\n\nThe jackaless squirms uncomfortably before leaning in close. <i>“Normally I wouldn’t tell anyone this... You have to promise not to repeat this to anyone, okay? The higher ups wouldn’t like it.”</i>");
	output("\n\nYou do");
	if(pc.isAss()) output(", though you’ll break it in a heartbeat if you think you need to");
	output(".");
	output("\n\nThe shop-girl sighs, <i>“Good. I knew I could trust you.”</i> She furtively casts her gaze at the automatic door, and satisfied that it’s still sealed, she explains, <i>“I removed it. We’re not supposed to, but I couldn’t stand it sitting there, broadcasting to every single customer that I’m actually an ausar.”</i>");
	output("\n\nQuirking an eyebrow in response, you ask, <i>“How would a nametag do that? Does it have a field for species on there or something?”</i>");
	output("\n\n<i>“No, you don’t get it!”</i> she cries, slapping a palm down on the counter. <i>“My name! Its common on Ausaril and on most ausar colonies. Ever since that ‘Bones of Ypsilon Station’ show was on the air a few decades back, the name took off in popularity, and now anyone who knows anything about the rest of the galaxy knows that I started out as an ausar when they see it.”</i>");
	output("\n\n<i>“So what am I supposed to call you?”</i> you ask. <i>“'Hey you' doesn’t have a very good ring to it, and a name would make it a lot easier to talk. I’ll even tell you mine; I’m [pc.name].”</i>");
	output("\n\nYou didn’t know it was possible for a jackal’s (or ausar’s) ears to sink so low. <i>“It’s Emmata, but please, just call me Emmy. It’s what all my friends call me.”</i>");
	output("\n\nShaking your head, you explain that you still don’t understand why she doesn’t want to be known as a former ausar.");
	output("\n\n<i>“Because the moment I start modding myself to look how I really wanted to look, instead of just changing my dick or something, they cast me out. My old friends avoided me and spread rumors behind my back. My parents still said they loved me, but they never seemed to want to go anywhere public with me. It broke my heart.”</i> Emmy balls up her fists as she fights back tears and struggles to compose herself.");
	//Nice/Mischief
	if(pc.isNice() || pc.isMischievous()) output("\n\nYou can’t help but be moved by her situation and do your best to comfort her.");
	//Hard
	else output("\n\nIt makes sense. She can’t expect everyone to blindly support such a culturally exotic decision.");
	output("\n\n<i>“When it comes to large scale genemodding, ausar are at best prudish and at worst total bitches. Some of them even protest stores that sell full-body mods. You can pull up pictures on the extranet of protestors with signs like ‘Get out, furscum!’ or ‘Muzzles are malicious!’ I knew a guy that went full canine - wanted to differentiate himself from humans. Do you know what he got for it? He got the beating of a lifetime. Some off-duty officer beat him so bad he was in the hospital for a month. A month! I can barely imagine a reason for being there more than a few days!”</i>");
	output("\n\n<i>“So, is that why you’re out here, on the frontier?”</i> you hazard.");
	output("\n\nEmmy nods. <i>“Out here, nobody cares. Populations are mixed up enough that it’s pretty hard to rage over somebody having a long face, and even if they did figure that I used to be an ausar, they’d be unlikely to care. I mean, we’re on a planet where ant-girls are threatening to blast themselves off the face of the planet. You’d have to be pretty bigoted to make an enemy of the only person selling decent weapons on this mudball, even if she’s a ‘furry’ or a ‘herm’.”</i>");
	output("\n\nIt’s a little galling how right she is. Even if you didn’t approve of her lifestyle choices, it’d be pointless to alienate such a useful resource. You give an affirming chuckle.");
	output("\n\nSmiling a little more broadly, Emmy puts her hand on a waist that looks a little too broad to be attached to a waist that narrow. <i>“So now that I’ve showed you my baggage and told you things that would get a lesser woman fired, why don’t we move to a lighter topic. Like what you think the prettiest piece of hardware in the whole store is.”</i>");
	flags["MET_EMMY"] = 1;
	processTime(6);
	clearMenu();
	addDisabledButton(0,"You","You","Not yet implemented.")
	addDisabledButton(1,"Your Dick","Your Dick","Not yet implemented.");
	addDisabledButton(2,"Your Tits","Your Tits","Not yet implemented.");
	addButton(3,"That Gun",buyFromEmmy,undefined,"That Gun","Point at one of the guns on the wall. Maybe you can buy it.");
	addButton(4,"That Sword",buyFromEmmy,undefined,"That Sword","Point at one of the swords on the wall. Maybe you can buy it.");
	//[You] [Your Dick] [Shop]
	//[You] -> New subscene
	//[Your Dick] -> Sex Attempt
	//[Shop] -> Buy menu
}