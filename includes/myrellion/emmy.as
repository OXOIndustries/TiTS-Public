import classes.Items.Miscellaneous.VenusBloom;
import classes.Characters.PlayerCharacter;
//Emmy, by Fenfuckso
//APPROACHED_EMMY = walked up to her.
//MET_EMMY = you know each other's name
//SEEN_EMMY = only used for her room description.
//EMMY_ORALED - has Emmy given the PC oral?
//EMMY_QUEST - used to track the current progress of her sexquest
/*                   Undefined - Nuttin' yet!
					 0 - she has requested a flower, and you have not brought her one
					 1 - You brought her a flower or charmed her into oral times.
					 2 - Emmy has pointed you at part two of the quest.
*/
//EMMY_FLOWER_GIFTED - Have you given her a flower? If undefined and you passed it on the quest, you did it via email.
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
	if(flags["EMMY_BANNED"] == 1)
	{
		output("\n\nThe shopkeeper shoos you toward the door. She won't even look you in the eye, and one of her fingers is poised above a call button should you make trouble. It'd be best to leave.");
		return false;
	}
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
	else if(flags["MET_EMMY"] == undefined) addButton(0,"Jackal",emmyRepeatGreetings);
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
	if(flags["MET_EMMY"] == undefined) addDisabledButton(3,"SexRequest","SexRequest","You should probably figure out her name before trying to get into her pants.");
	else if(!pc.hasGenitals()) addDisabledButton(3,"SexRequest","SexRequest","You don't even have genitalia.");
	else if(flags["EMMY_EMAIL_TIMER"] != undefined && !MailManager.isEntryViewed("emmy_apology")) addDisabledButton(3,"SexRequest","SexRequest","You tried that, and she pushed you away. For a huge flirt, she sure is an ice queen.");
	else if(flags["EMMY_QUEST"] != undefined && flags["EMMY_QUEST"] >= 1) 
	{
		if(pc.lust() >= 33) addButton(3,"SexRequest",sexAttemptStart,undefined,"Sex Request","See if Emmy is up for some sex.");
		else addDisabledButton(3,"SexRequest","Sex Request","You aren't aroused enough for this.");
	}
	else if(pc.lust() >= 33) addButton(3,"SexRequest",sexAttemptStart);
	else addDisabledButton(3,"SexRequest","SexRequest","You aren't turned on enough for that.");
	//Flower overwrites
	if(flags["EMMY_QUEST"] == 0 && pc.hasItem(new VenusBloom())) 
	{
		if(pc.hasGenitals()) addButton(3,"GiveFlower",bringEmmyVenusBloom,undefined,"Give Flower","Give Emmy the flower you brought her.");
		else addDisabledButton(3,"GiveFlower","Give Flower","You should probably get some genitals before doing that...");
	}
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
		if(flags["EMMY_QUEST"] == 0) output("Did you find that flower? I haven’t been able to stop thinking about your reward...”</i>");
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
	if(MailManager.isEntryViewed("emmy_apology") && flags["EMMY_APOLOGIZED"] == undefined)
	{
		clearOutput();
		showEmmy();
		output("You walk up to Emmy, openly ogling her this time - she did send you an email inviting you back for an 'oral apology.'");
		output("\n\nShe blushes, but her cock snakes a bit higher up her jumpsuit. It gleams like latex but hugs her body tighter than spandex. The poor herm’s legs quiver as she greets you. <i>“[pc.name]! You came back.”</i> She pauses, thinking over her next words very carefully. One of her hands comes very close to idly caressing a nipple. <i>“Did you come back to buy something... or did you want that apology?”</i> Her tongue sensuously strokes the curved angel bow of her upper lip, then circles over the plump, ebony surface of her lower one.");
		if(flags["EMMY_QUEST"] == undefined) flags["EMMY_QUEST"] = 1;
		//replace flirt button with [Apology] -> Goes to oral
		if(pc.hasGenitals()) addButton(3,"Apology",emmyApologyStuff,undefined,"Apology","Accept her oral apology for getting you worked up and then turning you down.");
		else
		{
			output("\n\nYou should get some genitals so you can take her up on that.");
			addDisabledButton(3,"Apology","Apology","You need genitals for this.");
		}
	}
}

public function emmyApologyStuff():void
{
	//Route to appropriate scene, logic copied from emmyPicksOral()
	//Emmy likes sucking non-tiny dicks.
	if(pc.hasCock() && pc.biggestCockLength() >= 7) getBlownByEmmy();
	else if(pc.hasVagina()) muzzlefuckingCunnilingus();
	else if(pc.hasCock()) getBlownByEmmy();
	else
	{
		output("\n\n<b>Error, you got no junk.</b>");
	}
}

public function backToEmmyMain():void
{
	clearOutput();
	showEmmy();
	if(flags["MET_EMMY"] != undefined) output("Emmy");
	else output("The jackal-woman");
    output(" smiles coyly and paces between holograms of a huge-barreled laser weapon and a hammer that crackles with phantom electricity. <i>\"Well, what now?\"</i>");
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
	if(flags["EMMY_EMAIL_TIMER"] != undefined && flags["EMMY_APOLOGIZED"] == undefined) addDisabledButton(2,"You","You know all too well that this won't go anywhere.");
	else addButton(2,"You",sexAttemptStart,undefined,"You","Try to get into her pants.");
	//[You] -> Go to first time flirt menu
	//make sure to route appropriately if sex happened already

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
	if(flags["EMMY_EMAIL_TIMER"] != undefined && flags["EMMY_APOLOGIZED"] == undefined) addDisabledButton(2,"Demonstration","You know all too well that this won't go anywhere.");
	else addButton(2,"Demonstration",sexAttemptStart,false,"Demonstration","If she's offering some hands-on sex... sure.");

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
	if(flags["PURCHASED_FROM_EMS"] == undefined)
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
	output("\n\nSmiling a little more broadly, Emmy puts her hand on a waist that looks a little too broad to be attached to a waist that narrow. <i>“So now that I’ve showed you my baggage and told you things that would get a lesser woman fired, why don’t we move to a lighter topic. Like what you think the prettiest piece of hardware in the whole store is");
	if(flags["EMMY_QUEST"] != undefined || flags["EMMY_EMAIL_TIMER"] != undefined) output(" - besides me");
	output(".”</i>");
	flags["MET_EMMY"] = 1;
	processTime(6);
	clearMenu();
	if(flags["EMMY_QUEST"] != undefined || flags["EMMY_EMAIL_TIMER"] != undefined) 
	{
		addDisabledButton(0,"You","You","Looks like she's not fishing for compliments right now.");
		addDisabledButton(1,"Your Dick","Your Dick","Looks like she's not fishing for compliments right now.");
		addDisabledButton(2,"Your Tits","Your Tits","Looks like she's not fishing for compliments right now.");
	}
	else
	{
		addButton(0,"You",tellEmmyShesTheBelleOfTheBalls,undefined,"You","Tell her that she's the prettiest by far.")
		addButton(1,"Your Dick",sexAttemptStart,true,"Your Dick","Screw subtlety.");
		addButton(2,"Your Tits",sexAttemptStart,true,"Your Tits","Screw subtlety.");
	}
	addButton(3,"That Gun",buyFromEmmy,undefined,"That Gun","Point at one of the guns on the wall. Maybe you can buy it.");
	addButton(4,"That Sword",buyFromEmmy,undefined,"That Sword","Point at one of the swords on the wall. Maybe you can buy it.");
	//[You] [Your Dick] [Shop]
	//[You] -> New subscene
	//[Your Dick] -> Sex Attempt
	//[Shop] -> Buy menu
	addButton(14,"Back",backToEmmyMain);
}

//You -> You
public function tellEmmyShesTheBelleOfTheBalls():void
{
	clearOutput();
	showEmmy();
	output("<i>“You,”</i> you tell her, charmer that you are.");
	if(flags["EMMY_QUEST"] != undefined)
	{
		output("\n\n<i>“Flatterer,”</i> Emmy answers, <i>“but if you wanted to get into my pants, you should just ask.”</i>");
		emmyMainMenu();
		return;
	}
	output("\n\nEmmy’s ebony lips purse in a gasp. <i>“Really?”</i>");
	output("\n\nGrinning, you nod back.");
	output("\n\n<i>“Oooh, you are just the cutest!”</i> the jackaless cries, throwing her arms around your neck and pulling you into the squishy embrace of her pillowy bosom.");
	if(pc.biggestTitSize() >= 1) output(" Your own [pc.chest] declare war on their opposite number, pressing your [pc.nipples] against her hardened tips until you very nearly moan in delight.");
	output(" She slathers you cheek with with an unashamedly enthusiastic lick and roughly gropes at your [pc.butt]");
	if(pc.tailCount > 0) output(", gently stroking the base of your tail with a rogue index finger");
	else if(pc.buttRating() >= 6) output(", digging her fingers into your cheeks with such gusto that you momentarily worry she’ll slip a finger in between");
	else output(", squeezing the pert flesh on offer");
	output(", pulling you so tight that her enormous prick");
	if(pc.armor is EmptySlot) 
	{
		if(pc.hasCock()) 
		{
			output(" is rubbing against your [pc.cocks] through a jumpsuit that feels so thin it might as well be nonexistent, ");
			if(pc.biggestCockVolume() < chars["EMMY"].cockVolume(0) * 1.25) 
			{
				output("smothering your rapidly engorging maleness");
				if(pc.cockTotal() > 1) output("es");
				output(" in the fitful trembles of her need.");
			}
			else output("twisting and jerking futilely against an endowment so gigantic that it’s Goliath to her David.");
		}
		else output(" is rubbing against your [pc.belly] through her jumpsuit, so hard and tight that you can feel it swelling with the hammerblows of her heartbeat.");
	}
	else output(" is audibly grinding against your [pc.armor], so powerfully erect that the hammerblows of her heartbeat nearly tug it out your gear out of place.");
	output(" When she breaks away, she’s panting hotly and struggling to adjust her straining suit. You can only imagine how thoroughly coated with pre-cum the crotch must be.");
	output("\n\nEmmy holds up her hand when you start to talk, begging you to wait a moment. <i>“H-hang on a second. I... we can’t. Not yet anyway. I’ve got some things going on, and I promised myself I wouldn’t cave into them - wouldn’t let myself turn into some kind of slut.”</i> She backs away, putting the counter between your overheated crotches and begs, <i>“I can’t help being so flirty, but give me some time... please?”</i> She sounds almost plaintive.");
	output("\n\nWhat can you do, but agree? Still, there’s got to be a way to win her heart. So long as it doesn’t involve waiting for the heat death of the universe, you can probably manage it.");
	output("\n\n<i>“Thanks. Why don’t we get bus- I mean do some business. What do you say?”</i>");
	processTime(12);
	pc.lust(22);
	//Get email a day later starting you on part 2 of the quest.
	flags["EMMY_EMAIL_TIMER"] = GetGameTimestamp();
	emmyMainMenu();
}

public function emmyMailGet():void
{
	eventBuffer += "\n\n<b>New Email From Emmy Astarte (emmy_astarte@cmail.com)!";

	MailManager.unlockEntry("emmy_apology", GetGameTimestamp());
}

//Sex Quest - Sex Attempt Start
//PC comes on, she actually gets a little offended - skipped with the <i>“You - You”</i> option.
//She suggests the PC bring her a pretty flower - something she hasn’t seen here. - auto venus hint if PC has their codex unlocked.
public function sexAttemptStart(mainMenu:Boolean = true):void
{
	clearOutput();
	showEmmy();
	if(flags["EMMY_QUEST"] == undefined)
	{
		//Came from somewhere other than main menu.
		if(!mainMenu) 
		{
			output("Taking the invitation for what it is, you close the distance with her, placing your hands on her plump bottom and pulling her against you. ");
			if(flags["MET_EMMY"] != undefined) output("Emmy’s");
			else output("The shopkeeper’s");
			output(" overheated, oversexed form squishes tightly into your hug, her cock throbbing hungrily against your [pc.belly]. You could fuck her right here. Noone would notice. Heck, she probably has a remote to lock the door within arm’s reach.");
		}
		//Bimbo
		else if(pc.isBimbo()) output("You prance up to curvacious hermaphrodite, trying to keep your eyes from getting glued to that absolutely yummy looking length between her legs. Gosh, she’s such a super cutie, and she looks like she needs to cum so bad. You pull her into a chest-compressing hug and delight at the sparks of pleasure that the [pc.nippleNoun] to nipple contact sends racing through your bimbofied cerebrum. <i>“I wanna like, buy stuff, but you’re super distracting! I mean, your dick is all big and hard and looks like it needs a sucking pronto, and even if you were totally a girl, I’d still wanna bang you. Ya know?”</i> You bat your eyelashes and unceremoniously kiss her.");
		//Hard/Bro
		else if(pc.isAss() || pc.isBro()) 
		{
			output("You confidently stride up to her and put your hand around her waist. <i>“Why don’t we dispense with the flirting and have a little quickie. You look like you could use ");
			if(pc.hasCock()) output("a good, hard dicking");
			else output("a nice, wet and willing hole to drain those nuts into");
			output(".”</i>");
		}
		//Nice
		else if(pc.isNice()) output("<i>“I’d definitely like a closer look at your stock,”</i> you " + pc.mf("purr","growl") + ", brazenly sweeping your eyes across her exposed body.");
		//Mischievous
		else output("You sidle up alongside the curvaceous furry tart and whisper, <i>“If all the merchandise is as nice as what you have on display, I’m going to go broke. Any chance I could take the fine looking model in front of me for a spin before I spend myself into the poorhouse?”</i>");
		//Merge
		if(flags["MET_EMMY"] != undefined) output("\n\nEmmy’s");
		else output("\n\nThe jackaless’s");
		output(" eyelids flutter, her face dreamy. Her back arches, thrusting her tits closer to you, begging you with her body to grope them, to squeeze and use them as vessels for your perverse ardor, but the moment you grab hold of one, it all changes. Her eyes go wide with alarm, and she violently twists from your lecherous grip. Her cock is so hard that you can see it pulsating through the painted-on veneer of her too-tight space-suit. With the artificial gleam its coating of clothing grants it, it looks more like a high-dollar sex-toy than a living being’s boner.");
		output("\n\n<i>“What’s wrong?”</i> you ask, watching her squirm her way to the back of the counter. The panting canid acts like the polished surface is her fortress, the only thing protecting her from being ravaged by horny, space-faring barbarians.");
		output("\n\nThe shrink-wrapped sexpot tries to dig her clawtips into her makeshift parapet, but all her blunted, fabric-wrapped digits manage to do is click and scrabble as uselessly as a puppy on a freshly polished hardwood floor. <i>“N-nothing.”</i> ");
		if(flags["MET_EMMY"] != undefined) output("Emmy");
		else output("The shopkeeper");
		output(" stammers. Her ears are low and pointed back, but her nipples look like they might as well be fifty caliber bullets.");
		output("\n\nCocking an eyebrow, you give her the kind of deadpan look that tells her exactly how much you believe her. <i>“Look, I just thought that you wanted to. If you don’t, it’s no big deal.”</i>");
		if(pc.isAss() || pc.isBro())
		{
			output(" Bullshit. This bitch is ");
			if(pc.balls > 1) output("gonna give you blue balls");
			else output("leave you just as hot and bothered as she is");
			output(". The crap you put up with for a shot at some xeno cunt never ceases to amaze you.");
		}
		output("\n\nFor once, the shop-jackal is quiet. She’s staring down into her own cleavage as if she could hide her shame somewhere in the pillowy crevasse. When that fails to work, she sighs like a deflating balloon, slumping down onto the counter. If it wasn’t for her tits and elbows being hooked on the edge, she’d probably slither into a puddle of self-loathing on the floor. <i>“Fuck I want it so bad. You don’t even understand how much I want it. How much I want to bend you over this counter and drill you until you can’t walk.");
		if(pc.hasCock()) output(" How good it would feel to let you have a go at my pussy. How I’d let you creampie it until your balls ran dry and then seal it inside myself with this suit.");
		if(pc.hasVagina()) output(" Fuck, I even want to stuff my nose in your twat and see just how deeply I can lick you.");
		output("”</i>");
		output("\n\n<i>“I don’t see a problem here.”</i>");
		output("\n\nThe jackaless shakes her head and looks up at you with red-rimmed eyes. <i>“I’m not a slut");
		if(flags["MET_EMMY"] != undefined) output(", [pc.name].");
		output("”</i> ");
		if(flags["MET_EMMY"] != undefined) output("Emmy");
		else output("She");
		output(" straightens. <i>“I’m not going to fuck someone just because I happen to be horny and hot enough to turn on my clients, no matter how fuckably cute they are.”</i> She thumps her fist into the table and swivels her ears to face you, proud and erect. <i>“Just because I feel like I have a week of backed-up cum in my balls doesn’t mean you’ll get a free pass to have your way with me. You’ve got to earn it.”</i>");
		output("\n\nYou grin at that. It’s been a while since you’ve had such a challenge. <i>“Then how can I earn it?”</i>");
		output("\n\nWith her brash exterior back in place, ");
		if(flags["MET_EMMY"] != undefined) output("Emmy");
		else output("flirty company representative");
		output(" leans low over the counter and bats her eyelashes at you. <i>“So you’re actually going to court me");
		if(pc.balls > 0) output(", after I gave you blue balls and everything?");
		else output(", after I got you all worked up for nothing?");
		output("”</i> Her inky lips break into a giddy smile. <i>“Then bring me an exotic flower. Maybe one from a jungle world. There’s nothing to look at here but rocks and holograms, and I can’t smell a hologram.”</i>");
		output("\n\nThat shouldn’t be too hard. <i>“Alright.”</i>");
		output("\n\nShe crooks a finger, beckoning you closer. When you’re within a few inches of her face, she whispers, <i>“");
		if(pc.hasCock()) output("It wouldn’t be too slutty to suck a [pc.boy]friend’s cock, especially after [pc.heShe] brought me flowers.");
		else output("It wouldn’t be too slutty to take care of a [pc.boy]friend’s needs, even if it means showing [pc.himHer] just far my tongue can go inside of [pc.himHer]. [pc.HeShe]’s be bringing me exotic flowers, after all.");
		output(" That’d be fair recompense for your efforts.”</i>");
		output("\n\nHot damn... you better go find some flowers.");
		if(pc.hasCock()) output(" You shift your still-hard bulge and agree to find her a flower.");
		else if(pc.hasVagina())
		{
			output(" You shift nervously, your engorged lips rubbing sinfully against one another, and try not leak any moisture down you [pc.thighs].");
			if(pc.wettestVaginalWetness() >= 4) output(" It’s a futile effort, wet as you are. Anyone with half a nose could smell how fuckable you are.");
			output(" You barely remember to agree to her terms.");
		}
		else output(" You guess you should find a way to acquire some genitals and absentmindedly agree.");
		output("\n\n<i>“Great. Now, did you want to buy anything to keep you safe while you’re hunting my flower, or will you be heading out now?”</i>");
		//[Buy] [Leave]
		processTime(13);
		flags["EMMY_QUEST"] = 0;
		clearMenu();
		addButton(0,"Buy",buyFromEmmy);
		addButton(14,"Leave",mainGameMenu);
	}
	else if(flags["EMMY_QUEST"] == 0)
	{
		repeatPreFlowerSexAttempt();
		return;
	}
	else 
	{
		output("Emmy's eyes flutter low once she realizes your intent. <i>\"Does someone need a little relief?\"</i>\n\nThe ");
		if(rand(2) == 0) output("bulge in her jumpsuits authoritatively declares her to be the one in need of relief.");
		else output("way her nipples jut through the thin fabric of her jumpsuit, you wager she's referring to herself.");
		emmySexMenu();
	}
}

//Repeat Pre-Flower Sex Attempt
//More grumbling, bring me a flower!
public function repeatPreFlowerSexAttempt():void
{
	clearOutput();
	showEmmy();
	output("The moment you try to turn her lighthearted flirting into a serious, sexual encounter, Emmy puts a stop to it, pushing you back with a stiff arm to your chest. <i>“Whoah there, [pc.name]. Cool your jets.”</i>");
	if(pc.biggestTitSize() >= 1) output(" She can’t help but let her fingers spread wider, pressing into the soft mounds of your breasts.");
	else output(" She can’t help but let her fingers creep across your torso, feeling the shape of it.");
	output(" <i>“I told you that I’m not going to be a slut, not even for someone as hot as you. Bring me a token of your affection - not just your lusts - and I’ll let you use my mouth.”</i> She licks her lips meaningfully, barely suppressing a shudder. <i>“A flower from a jungle planet would be a good place to start. I’d like to see something pretty again.”</i>");
	output("\n\nOh yeah. You tried this before, and it didn’t work then either. You’ll need to head to a jungle planet like Mhen’ga if you’re going to get this saucy jackaless to stop being such a cocktease.");
	emmyMainMenu();
}

//Venus Pitcher Post Sex or Avoidance
public function venusPitcherBonusFlower():void
{
	clearOutput();
	showEmmy();
	output("Ever since Emmy asked you for an exotic flower, you’ve kept your eyes open for a good one, and now there’s one laying on the ground right in front of you! The venus pitcher must have shed this one in her hurry to escape underground, leaving a pink and purple bloom that’s sure the dazzle the eye and delight the nostrils. You even sniff it a few times to make sure it doesn’t have any of that sneezy pollen that clouds the air around the plant-women.");
	if(venusSubmission() >= 40) output(" Sadly, it doesn’t.");
	//Acquire bloom
	output("\n\n");
	quickLoot(new VenusBloom());
}

//Bring Her Venus Bloom
//Happies! Will now go down on you, but not give up any actual sex.
//Still wants proof that you see her as more than a piece of easily-fuckable meat. Tells you that she’d be yours if you prove your affection somehow, like say bringing her a precious material from the heart of a planet (Picardine/Plat190)
//Cue auto-oral after - will oral from then on.
public function bringEmmyVenusBloom():void
{
	clearOutput();
	showEmmy();
	output("<i>“");
	pc.destroyItem(new VenusBloom());
	if(pc.isBimbo()) output("I like, got you a present!");
	else if(pc.isBro()) output("Gotcha somethin’.");
	else if(pc.isNice() || pc.isMischievous()) output("Here - a pretty girl told me she could use one of these.");
	else output("Don’t ever say I didn’t do anything nice for you.");
	output("”</i> You reach into your pack for the promised present.");

	output("\n\nEmmy is all ears - literally. Her ears are standing up straighter than a New Texan around a fertile cow-girl. She leans so far over the edge of the countertop that the only thing keeping her from toppling over are the half-squished mounds pushing back against the surface. <i>“Really? You did it?”</i> Her tail wags with nervous energy. <i>“You went all the way out into space just to win my heart?”</i>");
	output("\n\nYou pull the venus blossom from your pack and hand it to her. Already, the little flower has sprouted roots from where it was separated from the rest of the plant-woman - a possible explanation for Mhen’ga’s preponderance of blooming foliage. The floral fragrance immediately floods the shop’s neutral, filtered air, lacing it with an aroma somewhere between lilac and tulip.");
	output("\n\nMarveling at the bloom, Emmy blushes. <i>“So I guess... this makes you my [pc.boy]friend, doesn’t it?”</i> She buries her nose in the flower, hiding most of her face in the petals. Emotive, luminous eyes peek out above, watching for your reaction.");
	output("\n\nHow do you respond?");
	//[Pleased] [Polyamorous] [Negative]
	processTime(5);
	flags["EMMY_QUEST"] = 1;
	clearMenu();
	addButton(2,"Negative",negativeEmmy,undefined,"Negative","You just did this for a little oral - you didn't want any strings attached. You'll sound a bit like a dick...");
	addButton(1,"Polyamorous",polyamorousEmmy,undefined,"Polyamorous","Let her know that you tend to have more than one lover - you hope she can handle it.");
	addButton(0,"Pleased",emmyPleased,undefined,"Pleased","Let her know that you're pleased to be her boyfriend.");
}

//Negative
//+ Mean points
public function negativeEmmy():void
{
	clearOutput();
	showEmmy();
	flags["EMMY_BANNED"] = 1;
	output("You shake your head. <i>“It doesn’t make us anything.”</i>");
	output("\n\nYou can hear the sound of Emmy’s heart breaking in the quiet hitching of her throat. <i>“B-b-but... you... you brought me this...”</i> She wrings the stem in her hands, nearly breaking it.");
	output("\n\n<i>“Yeah, I was told if I brought you a flower, I’d get ");
	if(pc.hasCock()) output("blowjobbed");
	else output("eaten out");
	output(" by a big-tittied tart, not that I’d have to put up with a bunch of relationship bullshit.”</i> You eyeball her tits brazenly, then look back at the entrance. <i>“So, you gonna seal the door so we can get this done?”</i>");
	output("\n\nA tear rolls down one side of the jackaless’s trembling muzzle, and she whispers something you can’t quite hear.");
	output("\n\n<i>“Huh?”</i> You cock your head and lean in closer.");
	output("\n\n<i>“No,”</i> Emmy whispers, straightening her back and solidifying her leaking gaze into an iron-hard stare, <i>“I’m not giving you anything. If you think I’m some kind of whore to be bought and used, then you aren’t worth knowing. You can keep your crummy flower next to your ban from my shop. Get out.”</i>");
	output("\n\nThat... could have gone better. You leave before her meltdown gets any worse.");
	pc.addHard(5);
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].eastExit);
}
//[Polyamorous]
public function polyamorousEmmy():void
{
	clearOutput();
	showEmmy();
	flags["EMMY_POLY"] = 1;
	output("You grin and answer, <i>“Sounds good, so long as you don’t mind me spreading my love around.”</i>");
	output("\n\nEmmy is literally taken aback by the statement. She pauses to consider you for a moment, then speaks hesitantly, choosing her words carefully, <i>“So you’re saying that you have other boyfriends or girlfriends?”</i>");
	output("\n\n<i>“More or less. I ");
	if(pc.isBimbo()) output("like, ");
	output("really like you, Emmy, but it’s a big, big universe out there, and I’ve met lots of special people in my adventures, just like you. I can’t promise that I won’t pursue them, but I can promise that I’ll continue to pursue you");
	if(pc.isBimbo()) output(" and that yummy bulge you’ve been hiding from me!");
	else output(".");
	output("”</i> You meet her gaze and take her hands in your own. <i>“");
	if(pc.isNice()) output("I wanted to be straight with you about this.");
	else if(pc.isMischievous()) output("I figure you’ve got a right to know, ya know?");
	else output("That’s me, take it or leave it.");
	output("”</i>");

	output("\n\nEmmy spins the flower around and peers down into it, quietly sniffing as she considers. <i>“It’s okay, I guess. It’d be foolish to think that everyone is as caught up on finding the one as me.”</i> She squeezes your arm with her free hand. <i>“And who knows, maybe the one for me is a [pc.guyGirl] with a half-dozen other hot lovers.”</i> Her ears pick up at the thought. <i>“Does this mean you’ll share if I ever meet them?”</i>");
	output("\n\nIt’s your turn to grin now. <i>“If they’re into you too, I don’t see why not.”</i>");
	output("\n\nStraining her at the front of her jumpsuit, the jackaless’s swelling boner threatens to rip its way to freedom. Her tongue lolls out in a lusty pant, and Emmy coos, <i>“You... you are special. No wonder you’ve got so many lovers.”</i> She wiggles closer, barely keeping her hands away from her tenting nipples and rigid, canine phallus. <i>“Let me thank you for the flower... and your honesty.”</i>");
	output("\n\nThe words are music to your ears.");
	pc.lust(5);
	clearMenu();
	emmyPicksOral();
}

//Pleased
public function emmyPleased():void
{
	clearOutput();
	showEmmy();
	flags["EMMY_BF"] = 1;
	output("\n\n<i>“It does,”</i> you answer with a smile and squeeze against Emmy’s padded fingers. <i>“As long as you can keep yourself from jumping me");
	if(pc.isBimbo()) output(" and fucking me with that yummy cock. Gawd, it looks like it needs relief soooo bad!");
	else output(".");
	output("”</i>");
	output("\n\nEmmy giggles and replies, <i>“You’re lucky the counter is in my way or I’d pin you to the floor and stuff my face into your crotch right now.”</i>");
	output("\n\nYou quirk an eyebrow at her, and after a moment the sheer sluttiness of her joke sinks home.");
	output("\n\nThe jackal gasps and claps her hands over her snout. If you could see through her fur, you’re sure her skin would be blushed crimson. <i>“I didn’t... I was joking! I promise I’m in control of myself. I turned you down at first, didn’t I? And even though you’re my [pc.boy]friend, that doesn’t mean I’m going to start whipping my dick out around your or anything. We need to know each other a little bit better before something like that happens - I’m not going to be a huge slut just because we’ve started something.”</i> She puts her hands down on the countertop and stares at her nervously tapping fingertips. <i>“I’m rambling aren’t I?”</i>");
	output("\n\n<i>“A little.”</i> You smile. <i>“It’s cute.”</i>");
	output("\n\nEmmy leans forward, squeezing her breasts between her forearms to press her cleavage directly into your view. <i>“Sometime, I’m going to have to get you to tell me what else you think about me is cute... but for right now, I believe I promised my interstellar hero{ine} a certain reward for [pc.hisHer] efforts.”</i> She bats her eyelashes and licks her lips, staring at your crotch. <i>“We can cross that off the list right now...”</i>");
	//Sex!
	processTime(7);
	pc.lust(10);
	clearMenu();
	emmyPicksOral();
}


public function emmySexMenu():void

{
	clearMenu();
	if(pc.hasCock()) addButton(0,"Get BJ",getBlownByEmmy);
	else addDisabledButton(0,"Get BJ","Get BJ","You don't have a dick to get blown.");
	if(pc.hasVagina()) addButton(1,"Get Licked",muzzlefuckingCunnilingus);
	else addDisabledButton(1,"Get Licked","Get Licked","You don't have a vagina to lick.");
	addButton(14,"Back",backToEmmyMain);
}

public function emmyPicksOral():void
{
	//Emmy likes sucking non-tiny dicks.
	if(pc.hasCock() && pc.biggestCockLength() >= 7) addButton(0,"Next",getBlownByEmmy)
	else if(pc.hasVagina()) addButton(0,"Next",muzzlefuckingCunnilingus);
	else if(pc.hasCock()) addButton(0,"Next",getBlownByEmmy);
	else
	{
		output("\n\n<b>Error, you got no junk.</b>");
	}
}

//Actual Sex
//Get Cunnilingus
//She gives the PC some sweet sweet muzzlefucking
public function muzzlefuckingCunnilingus():void
{
	clearOutput();
	showEmmy();
	output("You barely have time to climb up into position atop her counter before she’s on you. Emmy is more hands than woman, more hungry eyes and roving fingertips than hesitant sapient. It’s obvious from the way that she ");
	if(!pc.isNude()) output(" undresses you, peeling your garments from you like the fuzz from a ripened peach");
	else output(" caresses your exposed [pc.skinFurScalesNoun], making love by touch alone");
	output(", that she’s more pent up than an overloaded fusion core. You don’t know how she’s managed to hold back thus far, but she has - and will. Neither hand strays to the seam of her suit or her perky, jutting nipples. Every ounce of her erotic intensity is focused on one thing - the junction between your thighs.");
	output("\n\nHer hot breath flutters across your juicing folds like the beats of a butterfly’s wings: gentle but fast, excited. Emmy’s blunted claw-tips dig into your [pc.thighs] as she leans in close, inhaling your scent, flaring her black-lined nostrils to drink it up all the faster. When the jackaless’s tongue emerges, it does so under the cover of her sable locks, stealthily catching your leaking droplets one second and lapping at your labia the next. Her unseen undulations delicately yet passionately stir your lust.");
	output("\n\nYou slump back on the counter from the sensation. Emmy’s tongue is as long as it is slick, the texture of her tastebuds an ecstatic salve for your lust-achened nerves. You didn’t even realize it a moment ago, when you were shivery from anticipation, but you needed this. You needed Emmy’s tongue against your most sensitive places, rubbing against your clitoral hood");
	if(pc.totalClits() > 1) output("s");
	output(" until your polished pleasure bead");
	if(pc.totalClits() > 1) output("s");
	output(" emerge");
	if(pc.totalClits() == 1) output("s");
	output(" to be caressed by her waiting lips. The pussy-pleasers seal around ");
	if(pc.totalClits() > 1) output("one");
	else output("your [pc.clit]");
	output(", subjecting it to enough suction to wrack your ");
	if(pc.tone >= 70) output("ripped");
	else if(pc.tone >= 30) output("quivering");
	else output("nubile");
	output(" form with bliss, to steal your breath and fill your lungs with nothing but eager, lurid moans.");
	output("\n\nYour concentration and focus are drawn into Emmy’s greedy maw, drop by steaming drop, offered to her mouth as payment for the pleasure she now brings you. You grind your hips against her face without meaning to. The idea of stopping your wanton motions, of controlling your rebellious gyrations, never enters your mind. Your cunt");
	if(pc.totalVaginas() > 1) output("s are");
	else output(" is");
	output(" wholly charmed by the frustrated jackal’s thirsty tongue, and you wouldn’t have it any other way. She has you in the palm of her hand until she decides to drive you past the point of no return.");
	output("\n\nAnd it gets better.");
	output("\n\nYou didn’t think it could, not with how magnificently her mouth’s muscle tended to your feminine needs, but it does. Emmy’s tongue plunges deep, so deep you wonder if she’ll ever run out, if there’s anything behind her feminine muzzle but acres and acres of additional tongue. Then her nose, moist with your drippings, kisses [pc.oneClit] a moment before spreading your folds. Strong fingers dig into your [pc.butt], but only so that Emmy’s snout can plunge inside you. She’s literally fucking you with her face, all while her tongue does the tango in your deepest passage.");
	if(pc.wettestVaginalWetness() >= 4) output(" Her throat has to work double time to keep up with all the [pc.girlCum] you’re feeding her.");
	output("\n\nEmmy pulls back, leaving you momentarily vacant. The hollowness inside you aches with palpable need. It’s not fair that she stoked your passion into such a bonfire then stole away with the fuel you craved, leaving you a guttered husk of unfulfilled want. You groan whorishly, begging for her to return to the worship of your womanhood, to the endless strumming of your nerves. You’ll accept nothing less. <i>“Please!”</i> The word is etched into your expression and your tone.");
	output("\n\nGrinning up at you");
	if(pc.balls > 0 || pc.hasCock())
	{
		output(" from under your ");
		if(pc.hasCock()) output("[pc.cocks]");
		else output("[pc.balls]");
	}
	output(", the slick-faced jackaless laps the proof of your need from her muzzle. <i>“Since you asked nicely...”</i> She dives right back in. Her passage is far quicker this time, but then again, you’re far wetter than you were moments ago.");

	output("\n\nYou orgasm. You can’t help it. One moment you’re whining and begging, the next an atomic bomb of bliss is reverberating off the inside of your skull, consuming your concerns in the white-hot heat of release. Hands that you barely recognize as your own clutch feebly at Emmy’s hair, pulling her deeper, stretching your [pc.vagina] wide with how much of her [pc.girlCumNoun]-slickened face you’ve pushed inside. Uncoordinated spasms ripple through you, clenching down around your vaginally-embedded lover, rubbing pleasure-raw nerves against her hungry maw.");

	//Dick!
	if(pc.hasCock())
	{
		//Nocum
		if(pc.cumQ() < 5) output("\n\nA few wasted spurts of [pc.cumNoun] fall upon her hair, carelessly discarded by your futilely twitching [pc.cockNounSimple].");
		//Some
		else if(pc.cumQ() < 100) output("\n\n[pc.CumNoun] spurts across Emmy’s hair in a tangle of [pc.cumColor]. Thin strands of it slowly slide down her sable locks before finally coming to rest on your knuckles.");
		//Lots
		else output("\n\n[pc.CumNoun] cascades across Emmy’s hair in a wave of [pc.cumColor]. Her black locks are almost completely enveloped by it, and ribbons of it pour across the knuckles you’ve wrapped into her hair so thickly that you look like you’re wearing gloves.");
		if(pc.cumQ() >= 1000)
		{
			output(" And that’s just the beginning. Eruption after eruption of [pc.cum] boils up out of your ");
			if(pc.balls > 0) output("[pc.balls]");
			else output("body");
			output(" like water from a geyser, flooding down the distracted vixen’s back to pool at her feet.");
		}
		//All dix
		output(" You barely notice; you barely care.");
	}
	//Multicunt
	if(pc.totalVaginas())
	{
		output("\n\nAll of this... you could endure if that were it, if that were the only deluge of sensation you had to stomach, but it isn’t. Emmy’s fingertips have buried themselves into your extra folds, discovering yet untouched channels to nestle into. Knuckles press at the underside of your [pc.clits], strumming you until you’re thrashing bonelessly to Emmy’s will.");
	}
	//Merge
	output("\n\nSometime between paroxysms of pleasure and the slippery cascade between your thighs, the ");
	if(pc.totalVaginas() > 1) output("intruders");
	else output("intruder");
	output(" that savaged you so relentlessly with pleasure withdraw");
	if(pc.totalVaginas() == 1) output("s");
	if(pc.isSquirter()) output(", allowing you to gush unimpeded");
	output(". You slump flat on the countertop and tremble weakly. The aftershocks wrack your body, but your face is draped behind a manic smile, fed by a river of satisfaction that feels like it will never end.");
	processTime(22);
	IncrementFlag("EMMY_ORALED");
	pc.orgasm();
	//[Next]
	clearMenu();
	addButton(0,"Next",emmyCunnilingusFinale);
}

public function emmyCunnilingusFinale():void
{
	clearOutput();
	showEmmy();
	output("<i>“How’s that?”</i> Emmy purrs between attempts to clean your [pc.girlCum] from her mouth. So much of her face is stained with the evidence of your love that she’ll be grooming for a good while yet.");
	output("\n\nThe best answer you can manage are a few breathy pants and a nod as you climb back up onto your elbows.");
	output("\n\nEmmy giggles and helps you up, though not without a few slips. The suit shrouding her fingertips is slick with your spent passion. Pussy-scent clings to her like perfume, twice as strong and far more enjoyable. It summons up pangs of remembered pleasure to flutter across your belly.");
	output("\n\n<i>“Damn,”</i> you exhale, <i>“...that was good.”</i>");
	output("\n\nEmmy smiles, though her tongue still slips out in a feeble attempt to groom her cunt-soiled face. <i>“Great. Now while you cool down, I’ve got to freshen up. Some of us still have a store to run.”</i> The jackaless makes for the ‘Employees Only’ door, her knees pressed together. Every step is accompanied by the sound of liquid sloshing inside her one-piece suit. Her hips sway pendulously from side to side, the byproduct of her body’s desire for every ounce of friction upon her own unsated folds.");
	output("\n\nYou gather your things, and by the time you’re ready to go, the jackaless has returned, wearing a fresh white jumpsuit and a smile. Damn, she’s fast.");
	processTime(4);
	if(MailManager.isEntryViewed("emmy_apology")) flags["EMMY_APOLOGIZED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Get Blown
public function getBlownByEmmy():void
{
	clearOutput();
	showEmmy();
	//Not first time:
	if(flags["EMMY_ORALED"] != undefined) output("<i>“I think I can manage that,”</i> ");
	output("Emmy ");
	if(flags["EMMY_ORALED"] == undefined) output("gives you ");
	else output("answers with ");
	output("a saucy smile. <i>“Just me, you, your cock, and a little satisfaction for someone who has been so nice to me.”</i> She prowls closer and lays her arm on your chest, delicately walking her blunted claw-tips down your sternum. <i>“Just keep... your hands... to yourself.”</i> She nips just below your ear, dozens of sharp teeth clacking noisily together, then nuzzles against the nape of your neck. Her other hand strokes your [pc.hair]. <i>“This is about you.”</i> Emmy forcibly pulls herself away, moments before abandoning herself to grind against your [pc.leg]. <i>“I- I can wait.”</i>");
	output("\n\n<i>“You sure?”</i> You probe her with a look while you try to ignore the heat building in your loins.");
	output("\n\nEmmy presses a button, sealing the door behind her, but her eyes are shining feverishly. <i>“I’m sure... [pc.name], I’ll just help you out a little bit. It’s just my mouth - it’s not like I’ll be giving in to my overactive libido.”</i> She favors you with a wry smile. <i>“Get ");
	if(!pc.isNude()) output("naked and hop ");
	output("up on the countertop. Let me get a good look at it.”</i>");
	output("\n\nWhy not? You go ahead and climb up on. It’s cold under your [pc.butt], but the anticipation of what’s to come more than makes up for any momentary discomfort. Your [pc.cocks] flop");
	if(pc.cockTotal() == 1) output("s");
	output(" free, snaking out and up into the air, ");
	if(pc.cockTotal() == 1) output("a turgid pillar");
	else output("turgid pillars");
	output(" rising up to meet the sable pucker of Emmy’s lips. Her tongue glides around her puckered pillows, wet with salivation, polishing them until they gleam with the dark promise of pleasure to come.");

	output("\n\nThe herm saunters up to you, her claws clicking against the counter to either side of your [pc.hips]. She leans over your offered length");
	if(pc.cockTotal() > 1) output("s");
	output(", lips pursed. Her eyes flick up to bore into your own, then back down to your [pc.cockBiggest], crossing slightly as she takes it all in. Her nose flares, drinking deeply of your cock-scent. Her tongue lolls to lap at the underside of your [pc.cockHeadBiggest]. Emmy shivers at the contact, and her eyes drift half-closed and half unfocused.");
	output("\n\n<i>“Mmmm,”</i> the eager dick-girl hums. Her lips slobber drool across the [pc.cockHeadBiggest], too enthusiastic for any concerns of technique. Trickles of her salivary deluge wind their way ");
	if(pc.balls > 0) output("across the curvature of your [pc.sack]");
	else if(pc.hasVagina()) output("down to your feminine folds");
	else output("across your taint");
	output(" just in time to meet the eager caresses of Emmy’s fingertips. <i>“Ooh,”</i> she gasps, popping off your [pc.cockBiggest] with a lurid slurp. <i>“I didn’t expect it to be so... yummy.”</i> One of her hands ");
	if(pc.biggestCockVolume() < 700)
	{
		output("wraps around the gleaming length");
		if(pc.hasSheath(pc.biggestCockIndex())) output(", just above the sheath");
	}
	else output("cradles the mammoth tool, too small to properly wrap around such a tremendous member");
	output(". She pumps you slowly at first, lovingly caressing your ");
	if(pc.hasCockFlag(GLOBAL.FLAG_SMOOTH,pc.biggestCockIndex())) output("smooth");
	else output("veiny");
	output(" flesh, massaging you with a palm that feels slick enough to be sold as a sex-toy.");
	output("\n\n<i>“Ahhh,”</i> you groan in satisfaction, your head lolling back. You can feel yourself swelling bigger in response to her wanton cocklust, your [pc.cockBiggest] engorging until the whole thing thumps angrily against her spit-greased hands with every wanton heartbeat. Emmy’s thumb brushes just below your [pc.cockHeadBiggest], the hard tip of her blunted nail barely grazing the underside. You shudder and gasp; your entire length flexes powerfully in her grip");
	if(pc.cumQ() < 50) output(", and the first bead of pre-cum appears from your cockslit");
	else if(pc.cumQ() < 3000) output(", and the pre-cum that dribbles from you so frequently doubles in quantity");
	else output(", and the pre-cum that always seems to pour from your cockslit becomes thick enough to wash away the bulk of her spit");
	output(".");
	output("\n\nNuzzling back against it, the jackaless allows your liquid ardor to soak into the fur of her muzzle. She giggles, <i>“I’m going to smell like your cock for the rest of today, you know that, right?”</i> She swaps sides, inadvertently collecting a droplet of spunky enthusiasm just above her nose. Joining both her hands to your [pc.cockBiggest], Emmy picks up the pace of her stroking, working you to a fever pitch with powerful strokes. Her eyes stare up at you from under her obsidian locks, watching your reaction as she milks your ambrosia onto herself. Her tongue slithers, snake-like, around the circumference of your [pc.cockHeadBiggest], and you nearly ");
	if(pc.balls > 0) output("nut");
	else output("cum");
	output(" from the sight alone.");
	output("\n\nEmmy knows, somehow. The corners of her cock-shining lips quirk upward in a knowing smile. She’s still smiling when she opens her inky angel bows to wrap around you once more.");
	if(pc.biggestCockVolume() >= 500) output(" Of course, there’s no way she could take much of you into her mouth, but she does an admirable job of trying.");
	output(" Using her elongated snout to her best advantage, the cock-sucking jackaless devours your dick, accepting far more dong into her maw than any human ever could - at least not without a completely suppressed gag reflex, and even then, there’s still the awkward bend at the back of the mouth to contend with.");
	output("\n\nYou thank the heavens for furry sluts and alternate between stroking her hair and murmuring encouragements. Sometimes you can’t even manage that much. The pleasant tingles offered by her hot, wet mouth have your head swimming. It’s tough to keep your eyes open and your body upright, let alone give voice to a single cogent thought.");
	output("\n\nWith so much of your [pc.cockBiggest] behind her lips’ lascivious embrace, Emmy’s hands are free to roam, to ");
	if(pc.cockTotal() == 2) output("gleefully attend to your other penis and its needs, alternating the motions of her side-order of squeeze-job with the back-and-forth suckles of her mouth");
	else if(pc.cockTotal() > 2) output("gleefully attend to the rest of your menagerie of members, giving two of them the kind of powerful stroking that demands they unleash their loads - and soon");
	else if(pc.balls > 0) 
	{
		output("happily fondle and squeeze at your [pc.balls], rolling the [pc.cumNoun]-filled orb");
		if(pc.balls > 1) output("s");
		output(" in her hand until you swear you can hear ");
		if(pc.balls == 1) output("it");
		else output("them");
		output(" sloshing");
	}
	else if(pc.hasVagina())
	{
		output("gleefully attend to your more womanly needs, stirring ");
		if(pc.totalVaginas() == 1) output("your");
		else output("a");
		output(" honeypot until your abdominal muscles are near to convulsing with red-hot blasts of pleasure");
	}
	else if(pc.hasSheath(pc.biggestCockIndex())) output("gleefully fondle your sheath, even slipping a few fingers inside to caress you where the nerves won’t be on guard for the pleasure she offers");
	else output("happily rove across your [pc.belly] and taint, spreading the good vibes around the whole of your lower body");
	output(". She sucks particularly deeply, feathering her tongue along your underside, her cheeks hollowed from the effort, then pulls off, panting. <i>“Don’t hold back for a second, [pc.name]. If you need to cum, just do it, okay?”</i> Smiling and licking her lips, the inflamed vixen adds, <i>“I know what a cock feels like when it’s about to blow. You don’t need to warn me.”</i> She tugs your [pc.cockBiggest] up and plants wet smooches all over the sensitive spot below your [pc.cockHeadBiggest]. <i>“I don’t mind the mess.”</i>");
	output("\n\nEmmy gobbles you right back up again as soon as she finishes talking, swallowing inch after inch in one smooth traversal of your length. Her eyes as she focuses her attention. She pumps back and forth fast enough that foaming spittle drips from her lower lip, and the fluid gulping of her self-induced face-fucking momentarily overwhelm the audio from the automated displays. Your [pc.cockBiggest] is buffeted by a vortex of ecstasy, held captive by sensuous warmth, yoked to elemental pleasure incapable of yielding until you’re dragged to the very peak.");
	output("\n\nYou do the only thing you can; you cum. Emmy’s ready for it, of course. She pulls back just far enough to let you spill onto her waiting tongue, all before you fired the first drop, and her hands... her hands never stop moving, never stop entreating you to have the hardest climax of your life.");

	//Smallcum, no new PG
	if(pc.cumQ() < 5) output(" For all your fitful clenching, you only offer her a few, meager droplets of [pc.cum], but she doesn’t seem to mind. Emmy smiles and shows you the collection on her tongue before swallowing.");
	//Normalcum, no new PG
	else if(pc.cumQ() < 150) output(" You spray every drop of [pc.cum] into her mouth, but she doesn’t gag or swallow. No, she lets it build up into a [pc.cumColor] pool deep enough to conceal her tongue, then shows it to you. Emmy strokes your spent dick while she swallows, then favors you with a knowing smile when it twitches.");
	//Bigcum - soda can
	else if(pc.cumQ() < 750) output("\n\nYou spray thick ropes of [pc.cum] into her mouth, so voluminous that you must be thoroughly flooding her palate with each ejaculation. The jackaless barely reacts. You hear her throat working to swallow now and then, but she seems content to let you flood her cheeks with your reproductive deluge. It’s only once you’ve finished and she’s pulled off that she shows you the product of your orgasmic excesses.");
	//Hugecum - Liter cola - HEY FARVA, LITER COLA
	else if(pc.cumQ() < 4000) 
	{
		output("\n\nYou unload [pc.cum] like a bottle of soda shaken for far too long, bathing her from tongue to tonsils in a veneer of reproductive release with the first squirt alone. The jackaless has the good graces to look surprised by this turn events. Her cheeks bulge, and messy streams of your excessive load drip from the corners of her mouth. She does her best to keep up with noisy swallows, but nothing could have prepared Emmy for the size of your load. It’s only after you’ve finished that she shows you what you’ve accomplished, opening her mouth to display the flood you’ve so heedlessly released into her mouth. Even after all her swallows, there’s a lot there.");
		output("\n\nGrinning, she gulps the last of it down.");
	}
	//Kirocum
	else 
	{
		output("\n\nNo force in this universe could prepare the jackaless for the size of your load. You erupt like a long-dormant volcano, launching a wave of relief so thick that it bulges her cheeks and squirts from the corners of her mouth. Emmy backpedals before you can choke her with it, freeing her lips just enough for the next explosion of [pc.cum] to crest across her face, painting her [pc.cumColor] from head to tits. Her hands grab hold of your still-spasming prong and jack it off for all she’s worth, spraying the streams of jism across her body.");
		output("\n\nWhen you’re finally done, she makes a show of gathering the dripping gunk from her face and sucking it from her fingertips. <i>“Ahhh...”</i>");
	}
	//Not kiro cum and extra dix - no new PG
	if(pc.cumQ() < 4000 && pc.cockTotal() > 1)
	{
		output("\n\nWhether she notices the extra [pc.cumNoun] in her hair or not, she gives no sign of it. Judging by the grin on her face, she might have liked getting hosed down by your extra erection");
		if(pc.cockTotal() > 1) output("s");
		output(".");
	}
	var jizzbomb:Boolean = false;
	if (pc.cumQ() >= 4000) jizzbomb = true;
	IncrementFlag("EMMY_ORALED");
	//Next
	processTime(34);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",emmyBJFinale,jizzbomb);
}

public function emmyBJFinale(jizzbomb:Boolean = false):void
{
	clearOutput();
	showEmmy();
	output("Emmy straightens with a knowing smile{, your [pc.cum] cascading down her form}. Her dick looks so hard that you swear it’ll tear its way out of her straining jumpsuit at any second. <i>“Sit tight, tiger. I’m gonna freshen up.”</i> She pats you on the [pc.leg] and ducks into a back door, audibly squishing with every step.");
	output("\n\nYou have ample time to");
	if(pc.isNude()) output(" stretch");
	else 
	{
		output(" pack away your spit-glossed shaft");
		if(pc.cockTotal() > 1) output("s");
	}
	output(" before she comes back");
	if(jizzbomb) output(", and grates in the floor open up to allow your libidinous excesses to drain away");
	output(".");
	output("\n\nA moment later, Emmy returns - wrapped in a fresh suit. Her face looks to have been washed clean, but she still smells vaguely of your essence. She claps her hands nonchalantly. <i>“So, now that you’ve got that taken care of, how about we get your hands on a big gun?”</i> Despite her wolfish grin, it’s clear she doesn’t want you to grab hold of her dick - at least not yet.");
	processTime(4);
	if(MailManager.isEntryViewed("emmy_apology")) flags["EMMY_APOLOGIZED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
