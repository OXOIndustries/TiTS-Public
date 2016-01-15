import classes.Items.Miscellaneous.VenusBloom;
import classes.Items.Guns.EmmysSalamanderPistol;
import classes.Items.Guns.EmmysSalamanderRifle;
import classes.Items.Guns.EmmysSalamanderRifle2;
import classes.Items.Melee.EmmysJolthammer;
import classes.Items.Melee.EmmysLavaSaber;
import classes.Items.Melee.EmmysVampBlade;
import classes.Items.Combat.CrystalShard;

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
					 3 - You've completed the second part of the quest.
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
	else addButton(0,"Emmy",emmyRepeatWrapper);
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
	if(flags["EMMY_QUEST"] == 2) 
	{
		addButton(4,"Give Gem",giveEmmyAnItemMenu,undefined,"Give Gem","Give her a gem. She did request a gemstone, as you recall.");
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

public function emmyRepeatWrapper():void
{
	if(MailManager.isEntryViewed("emmy_gift_starter") && flags["EMMY_QUEST"] == 1)
	{
		clearOutput();
		showEmmy();
		output("You walk up to Emmy, remembering the email she sent. Do you want to bring it up or go on with business as normal?");
		clearMenu();
		addButton(0,"Email",moreSeriousEmmyTalkAboutEmail,undefined);
		addButton(1,"Normal",emmyRepeatGreetings)
	}
	else emmyRepeatGreetings();
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
		else output("doing your best to ignore her overt displays of sexuality.");
		output(" Her white and black, KihaCorp-branded jumpsuit seems perfectly painted to her every curve, designed to reveal far more than it manages it conceal. When she shifts position, her tail wagging behind her, you can even make out the pebbly texture of her nipples.");
		output("\n\n<i>“Welcome back, [pc.name]! It’s always nice to have a repeat customer come visit. If you need any help with any of the merchandise, I’m happy to give you a hands-on demonstration with a show model.”</i> Emmy glances around to make sure no one else is in the store and adds, <i>“");
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
		shopkeep.keeperSell = "<i>“You buy equipment too?”</i> you ask, pulling out your things.\n\n<i>“Whoah, whoah whoah whoah! What kind of shop do you think we’re running here, ";
		if(flags["MET_EMMY"] != undefined) shopkeep.keeperSell += "[pc.name]";
		else shopkeep.keeperSell += "stranger";
		shopkeep.keeperSell += "? KihaCorp is one of the leading companies in nearly every field of technological advancement,”</i> ";
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
	addButton(14,"Back",talkToEmmy);
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
	if(flags["MET_EMMY"] != undefined) output(" Emmy");
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
	output("\n\nSmiling a little more broadly, Emmy puts her hand on a hip that looks a little too broad to be attached to a waist that narrow. <i>“So now that I’ve showed you my baggage and told you things that would get a lesser woman fired, why don’t we move to a lighter topic. Like what you think the prettiest piece of hardware in the whole store is");
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
	output(" She slathers your cheek with with an unashamedly enthusiastic lick and roughly gropes at your [pc.butt]");
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
	eventBuffer += "\n\n<b>New Email From Emmy Astarte (emmy_astarte@cmail.com)!</b>";

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
		output(" That’d be fair recompense for [pc.hisHer]'s efforts.”</i>");
		if(flags["MET_EMMY"] == undefined)
		{
			output(" Emmy grins. <i>“But if I’m going to have a [pc.boy]friend, I should really know [pc.hisHer] name. Mine’s Emmy. What’s yours, hot stuff?”</i>");
			output("\n\n<i>“[pc.fullName],”</i> you answer.");
			output("\n\n<i>“Oooh, I like. See? I knew you were [pc.boy]friend material. Now just do me that one </i>little<i> favor, maybe we can have a celebration.”</i> Emmy's purr leaves very little the intended celebration to the imagination.");
			flags["MET_EMMY"] = 1;
		}
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
	output("\n\nEmmy leans forward, squeezing her breasts between her forearms to press her cleavage directly into your view. <i>“Sometime, I’m going to have to get you to tell me what else you think about me is cute... but for right now, I believe I promised my interstellar hero" + pc.mf("","ine") + " a certain reward for [pc.hisHer] efforts.”</i> She bats her eyelashes and licks her lips, staring at your crotch. <i>“We can cross that off the list right now...”</i>");
	//Sex!
	processTime(7);
	pc.lust(10);
	clearMenu();
	emmyPicksOral();
}

//TO STAGE 2 OF EM-QUEST
//Post-Oral Email Request
//Requires GF status - three days since first blowjob
//Email
public function emmyMailGet2():void
{
	eventBuffer += "\n\n<b>New Email From Emmy Astarte (emmy_astarte@cmail.com)!</b>";
	MailManager.unlockEntry("emmy_gift_starter", GetGameTimestamp());
}

//More Serious Talk - added to main menu
public function moreSeriousEmmyTalkAboutEmail():void
{
	clearOutput();
	showEmmy();
	output("<i>“About that email...”</i>");
	output("\n\n<i>“Yeah,”</i> Emmy answers, <i>“about that.”</i> She wraps an arm around your waist and pulls you close. <i>“A girl can’t live on giving oral alone, ya know?”</i> She gently reaches down to cup your crotch and gives it a familiar squeeze. ");
	if(pc.hasCock()) output("When you stiffen against her fingers, she briefly kisses you. ");
	output("<i>“Doesn’t matter how good it tastes, it’s still kind of a one-sided affair.”</i> Grinning and openly molesting you, the jackaless comes very close to humping your [pc.leg]. Close enough you can feel the heat of her lust ");
	if(!(pc.armor is EmptySlot)) output("through your [pc.armor].");
	else output("against your [pc.skin].");

	output("\n\nYour head is spinning, and you’d like nothing better than to bed Emmy right here and now. Still, it sounds like she wants you to tend to her for a chance. <i>“...what?”</i> you pant, confused.");

	output("\n\nThe seemingly ravenous jackaless gradually masters her ardor, separating herself from you a finger at a time. <i>“Sorry, I just get so... so sex-crazy around you. You have no idea how badly I want you here. At all hours of the day, I’m just lounging around the shop and wishing you’d suck me off, tongue my pussy until your face is all shiny and I’m painting my tits white. Or that you’d just fondle me through the suit and make me work the rest of the day, soaking in my own cum, ya know?”</i>");

	output("\n\nThat sounds... ");
	if(pc.isBro() || pc.isBimbo() || pc.libido() >= 75) output("awesome");
	else output("hard to deal with");
	output(". <i>“Wow.”</i>");
	output("\n\nThe lusty jackaless yanks her hand away from a bulging nipple. <i>“Uhm... yeah, but I want to be sure that we’re right for each other before I risk it. If a little midday relief turns me into a sex-crazed nympho slut, I need to know that I have someone who won’t get bored with me just because I’ve become an insatiable minx.”</i> She crosses her legs. <i>“I hope that makes sense.”</i>");
	output("\n\nIt does. After all that groping, you’d prefer a little relief yourself. <i>“Yeah.”</i>");
	output("\n\nNodding, Emmy replies, <i>“Great. Just... awesome. So here’s what I was thinking: we could get each other gifts. Since you’re a great adventurer, you could find me a pretty rock down there while I’m exploring. I hear they’re expensive, and I know the stuff down there is no joke. If you’d put up with all that hassle for me, I’d feel a little safer risking my job and my restraint for some not-too-slutty fun.”</i>");
	output("\n\n<i>“You said something about getting me a gift too?”</i>");
	output("\n\n<i>“Yeah. I’d hook you up with something from my private collection.”</i> Now that the topic has moved on from sex, Emmy looks to be calming somewhat. <i>“What kind of saleswoman would I be if I wasn’t a customer too? I’ve got a collection of weaponry back home that could outfit a small army - most of it modded to the point where you’d barely recognize it. Giving up one of my prize pieces wouldn’t be easy. I’d be giving you a piece of myself, but you’d like that, wouldn’t you?”</i> She bares her teeth in a feral grin and swivels her hips in your direction. <i>“Just don’t gag on it.”</i>");
	output("\n\nThat sounds fair - a gemstone is a small price to pay for a deeper relationship and a sweet new weapon. Now if only you could do something about the rampant lust making your crotch itch.");
	output("\n\nEmmy giggles at your distracted state. <i>“Come here. I wouldn’t want you going into the tunnels like that. You’d probably bend over for the first nyrea to look at you, wouldn’t you?”</i>");
	//POLY&PREG: 
	if(pc.isPregnant())
	{
		if(flags["EMMY_POLY"] == 1) output(" Eying your [pc.belly], she sighs. <i>“I guess it wouldn’t change very much.”</i>");
		else output(" Eying your pregnant belly, she sighs. <i>“I guess monogamy would be too much to expect from a rusher. I’ll just have to temper my expectations.");
	}
	output("\n\nDo you accept her offer for relief or leave?");
	flags["EMMY_QUEST"] = 2;
	//[Go Over][Leave]
	processTime(22);
	pc.lust(5);
	clearMenu();
	addButton(0,"Accept Offer",emmyQuickOralPick)
	addButton(14,"Back",backToEmmyMain);
}

//Give Gem
//Kirkite - 2000
//Satyrite - 4000
//Picardine - 7000

public function giveEmmyAnItemMenu():void
{
	clearOutput();
	showEmmy();
	output("What will you give her?");
	clearMenu();
	if(pc.hasItem(new Kirkite())) addButton(0,"Kirkite",giveEmmyAnItem,"Kirkite","Kirkite","Give Emmy a piece of Kirkite.");
	else addDisabledButton(0,"Kirkite","Kirkite","You don't have any Kirkite.");
	if(pc.hasItem(new Satyrite())) addButton(1,"Satyrite",giveEmmyAnItem,"Satyrite","Satyrite","Give Emmy a piece of Satyrite.");
	else addDisabledButton(1,"Satyrite","Satyrite","You don't have any Kirkite.");
	if(pc.hasItem(new Picardine())) addButton(2,"Picardine",giveEmmyAnItem,"Picardine","Picardine","Give Emmy a piece of Picardine.");
	else addDisabledButton(2,"Picardine","Picardine","You don't have any Picardine.");
	if(pc.hasItem(new CrystalShard()))
	{
		if(flags["EMMY_GIVEN_SHARD"] == 1)
		{
			if(!pc.hasItem(new CrystalShard(),10)) addDisabledButton(3,"C.Shard x10","Crystal Shard x10","Emmy requested you bring her ten of these. You'd better go hunting for more.");
			else addButton(3,"C.Shard x10",giveEmmyAnItem,"Crystal Shard","Crystal Shard x10","Give Emmy the ten Crystal Shards she requested.");
		}
		else addButton(3,"C.Shard",giveEmmyAnItem,"Crystal Shard","Crystal Shard","Give Emmy a Crystal Shard. It's not quite the kind of gemstone she's looking for, but it might be fun to watch...");
	}
	else addDisabledButton(3,"C.Shard","Crystal Shard","You don't have any Crystal Shards.");
	addButton(14,"Back",backToEmmyMain);
}

public function giveEmmyAnItem(item:String):void
{
	clearOutput();
	showEmmy();
	var emmyLoot:ItemSlotClass;
	output("You present her with");
	if(item == "Gem Sack")
	{
		output(" a satchel of gems.");
		output("\n\nOpening it up and taking a gem in hand");
	}
	else if(item == "Crystal Shard" && flags["EMMY_GIVEN_SHARD"] == 1)
	{
		output(" ten of those mischievous little gems.");
	}
	else
	{
		output(" a " + item.toLowerCase() + " gem.");
		if(item != "Crystal Shard") output("\n\nTaking the gem in hand");
	}
	// Determine weapon -- if AQ and PQ is equal and player affinity is physique, get melee!
	var getRanged:Boolean = (pc.AQ() >= pc.PQ());
	if(pc.AQ() == pc.PQ() && pc.affinity == "physique") getRanged = false;
	//Give Her A Crystal Shard - By Zeik
	//get a misch point
	//first tooltip: Give Emmy a Crystal Shard you obtained on Myrellion. It probably won’t make her swoon, but if it breaks it might be worth a laugh.
	if(item == "Crystal Shard")
	{
		if(flags["EMMY_GIVEN_SHARD"] == undefined)
		{
			flags["EMMY_GIVEN_SHARD"] = 1;
			output("\n\n<i>“What’s this?”</i> Emmy asks, taking the cloudy green gemstone from your hand. She holds it to the light. <i>“I haven’t seen a gem like this before... it looks like the emeralds that rich Terrans wear, but it’s so murky.”</i>");
			output("\n\nThe shard slips from her fingers, describing a perfect double spiral until it hits the countertop with a light clatter. Instinctively, you step backwards");
			if(pc.isMischievous()) output(" with a devilish grin of anticipation");
			output(".");

			output("\n\n<i>“Whoops!”</i> Emmy says, grabbing up the crystal again. Before she can raise it to her face, a faint tinkling sound goes off, like a tiny window shattering. Her eyes widen in surprise as the shard visibly cracks and the pressurized fluid inside spurts forth... all over the unwitting girl’s breasts.");

			output("\n\n<i>“Woah, what-”</i> she blurts, as the slightly-viscous slime coats her outsized boobage with a lewd splatter that slops all over her tits and oozes down her body. The viridian goo quickly begins to crystallize as it thins and travels southward, until Emmy’s jumpsuit is sparkling with thousands of tiny, tacky gems. She looks like a sequined, furry casino girl.");

			output("\n\nThe shopkeeper stares at you in narrow-eyed disbelief");
			if(pc.isNice()) output(" and you can’t entirely suppress your juvenile titters.");
			else output(" as you hoot with laughter.");
			output(" ”</i>You think this is funny, do you?”</i> she spits. She raises a hand in a scolding finger and leans in to tell you what <i>she</i> thinks... at least, she tries to lean. Her bust only wobbles a bit as her crystal-covered jumpsuit fails to bend.");

			output("\n\n<i>“How the hell...”</i> Emmy says, lecture unremembered by this new emergency. She tries to tilt back and forth, but it merely causes her head and shoulders to wiggle atop the fused-stiff suit, like a life-sized Emmy bobblehead. Unable to control yourself any longer, you double over with the spectacle of it.");

			output("\n\n<i>“Oh, you’re a riot,”</i> the angry jackaless growls. <i>“Tell me this isn’t permanent.”</i>");

			if(pc.isBimbo() || pc.isBro() || pc.isAss()) output("\n\n”</i>Nah,”</i> you say, through tears of laughter. <i>“It lasts, like, twenty hours.”</i>");
			else if(pc.isNice()) output("\n\n”</i>No, no,”</i> you say, hurriedly mastering yourself. <i>“Only lasts twenty hours, usually.”</i>");
			else output("\n\n”</i>Bad news... so try to keep a stiff upper lip,”</i> you gasp, sides aching with laughter. <i>“It takes twenty hours minimum to wear off.”</i>");

			output("\n\n<i>“TWENTY HOURS?”</i> roars Emmy. <i>“Why do you even have something like this?!”</i>");

			output("\n\nStill shaking, you explain with occasional giggles where you got it and how it makes a useful armor hardener for hostile environments. Emmy’s long jaw grinds while you talk, but you can see the anger in her eyes eventually give way to ideas as you defend your offering.");

			output("\n\n<i>“Well... that is a useful property... and I will admit that I was surprised at how fast it set up,”</i> she concedes. Emmy pauses for a moment, then folds her arms over her rock-hardened abs. <i>“I know you were yanking me around, but let’s say I can think of some real uses for these toys - could you get more?”</i>");

			//if Seifyn enabled or 2nd source added later
			if(pc.isBimbo() || pc.isBro()) output("\n\n”</i>Um, probably?”</i> you guess.");
			else output("\n\n”</i>Maybe,”</i> you shrug.");
			output("\n\n<i>“Even if armor hardening is the only thing they’re good for, that’s still a decent application with a lot of market value,”</i> the proprietress says, thoughtful. She looks like she wants to lean in conspiratorially, but of course that’s out of the question for now. <i>“But if we can reverse-engineer them to make them permanent, or change the formula slightly, we could have form-fitting spaceship hull patches or quick-printing semiconductor chips to market to the rushers.”</i>");
			output("\n\nYou nod ");
			if(pc.IQ() < 50) output("politely as she continues hypothesizing well above your depth.");
			else output("interestedly as she describes all sorts of life-improving tech breakthroughs with only the slightest grounding in reality.");
			output(" Emmy seems to take it as a sign of agreement - you can practically see the credit chits flashing in her eyes as she imagines KihaCorp performance bonuses and promotions.");

			output("\n\n<i>“Then, here’s our new deal,”</i> she concludes, eagerly. <i>“Instead of a gem, <b>you bring me ten more of those shards</b>, undamaged, so I can send them back for a lab workup. I’ll give you the reward I promised when you come back with them. Now get out. I need to change.”</i>");

			output("\n\nShe doesn’t move to eject you, but stands behind the counter, statuesque and wearing a stony expression. With no more talk forthcoming from her, you slip out the door - but before it closes completely, you sneak one last glance. Emmy has abandoned her sudden dignity and is awkwardly trying to about-face, rocking her arms side-to-side to get one unbending leg far enough off the ground that she can twist her hip forward without pitching her snout right into the floor, like a toy army man trying to walk on his fused plastic base.");
			//boot PC to map square, remove 1x Crystal Shard, remove buttons for other gems and move Emmyquest into crystal shard sub-stage or w/e
			pc.destroyItem(new CrystalShard());
			currentLocation = "607";
			var map:* = mapper.generateMap(currentLocation);
			this.userInterface.setMapData(map);
			showName("SPACER'S\nROW");
			processTime(4);
			clearMenu();
			addButton(0,"Next",mainGameMenu);
			return;
		}
		//when player selects ‘Crystal Shard’ again without 10 shards
		//second stage tooltip: Offer Emmy the shards you’ve found so far.
		//when player selects ‘Crystal Shard’ again with 10+ shards
		else
		{
			output("\n\nEmmy carefully accepts the shards from you two at a time, packing them into a container. When you’ve passed over the last, you lean in for a look inside. The shards are spaced apart and cradled by a form-fitting packing foam that neatly sets atop a familiar white-and-red jumpsuit covered with dusty green crystals and residue... as well as a long, blackened gash, like it was cut off its wearer with a laser. Ouch.");
			output("\n\nShe shoos you away kindly and snaps a lid onto the package, then sighs like a bomb has been disarmed. With the shipment prepared, the weapon seller turns to a drawer and opens it up. <i>“Crazy how no matter how much we know, there's always something else out there waiting to surprise us. If I hadn't met you, I never would've gotten tipped off to the gold mine just below Myrellion's surface, and I damn sure wouldn't be so happy about the idea of parting with this beaut. Here it is!”</i>\n\nShe slams the drawer closed with a heavy ‘thunk’ and straightens, balancing an expensive-looking weapon in front of the bullets of her nipples. <i>“");
			//{insert weapon collecting blurb here once weapons are chosen}
			//go to ‘merge’
			//reward weapon should reflect a total cost of 4950 credits (1 demo shard plus 10 shards for the mail @ 450 ea)
			if(rand(3) == 0)
			{
				if(getRanged) 
				{
					output("You’ve probably seen the Salamander Pistols we stock, but this beaut is special. I fitted it with a smart-linked scope system that’ll interface with damn near any optical interface, even one those fancy microsurgeon-based immune systems. You’ll be hard-pressed to find a more accurate pistol.");
					emmyLoot = new EmmysSalamanderPistol();
				}
				else 
				{
					output("You’ve probably seen the Lava Sabers we stock, but this beaut is special. I fitted the crossguard with miniaturized shield generators. They should supplement your shield belt’s defensives enough to give you an edge.");
					emmyLoot = new EmmysLavaSaber();
				}
				output("”</i>");
			}
			else if(rand(2) == 0)
			{
				if(getRanged) 
				{
					output("You’ve probably seen a Salamander Rifle around the shop, but you haven’t seen </i>this<i> Salamander Rifle. I fitted it with a hotshot energy supply, replaced the regulator contacts, and gave it a better muzzle, much like myself.”</i> She giggles and points to the dragon-headed design at the tip of the barrel. <i>“It should be a piece of cake to land a critical blow with this monster.”</i>");
					emmyLoot = new EmmysSalamanderRifle();
				}
				else 
				{
					output("You’ve probably seen a Jolthammer around the shop, but you haven’t seen </i>this<i> Jolthammer. I fiddled with the power source to try and boost the yield. It doesn’t always work, but when it does, the result is shocking.”</i> She giggles at her own pun. <i>“Just make sure not to touch the electric-ey end.”</i>");
					emmyLoot = new EmmysJolthammer();
				}
			}
			else
			{
				if(!getRanged) 
				{
					output("I managed to get the whole blade replaced with one that had a more robust induction lattice. It’s not quite as strong as a retail model, but it can drain shields ");
					if(pc.hasCock()) output("faster than I drain your dick");
					else output("faster than I drain my dick");
					emmyLoot = new EmmysVampBlade();
				}
				else {
					output("I really suped this one up. I swapped the barrel out for a wider one, but only because I also sprung for a better emitter and focusing crystals. I suppose I could’ve tried to tighten up the beam a little more, but I figure you’re going to want to put energy into the target, not burn a pin-sized hole through it. Just don’t waste it on any crystalline beings.");
					emmyLoot = new EmmysSalamanderRifle2();
				}
				output("”</i>");
			}
			//Merge
			output("\n\nPlacing the weapon on the table, the grinning Jackaless wiggles with unbounded excitement. <i>“All yours, hero.”</i>\n\n");
			//Loot, queue next page in eventqueue
			eventQueue.push(emmyLootPart2);
			for(var i:int = 0; i < 10; i++) { pc.destroyItem(new CrystalShard()); }
			quickLoot(emmyLoot);
		}
		return;
	}
	output(", the pleased shopkeep exhales, <i>“You actually did it.”</i> Blinking tears of happiness from her eyes, Emmy pulls you into a tight hug. <i>“I... was worried that you wouldn’t even bother. Who needs to waste time getting baubles for a girl when she’s already ");
	if(pc.hasCock()) output("sucking you like a vacuum hose");
	else output("licking you more frantically than a half-starved galotian");
	output("? But you did it.”</i> She slobbers a kiss across your cheek, dragging her tongue all the way to the bottom of your ear. <i>“You did it for me.”</i>");
	output("\n\nThe jackaless breaks away to further inspect what you’ve given her.");

	//Kirkite, no new PG
	if(item == "Kirkite")
	{
		output("\n\n<i>“Kirkite, huh?”</i> Emmy rolls sparkling gemstone between two claw-tipped fingers. <i>“This stuff is actually pretty rare around Ausaril and Terra, but with every new rush, it gets a little more common. Weird how the farther we get from the core, the more deposits we find.”</i> She smiles mischievously spins around, tail wagging beneath your nose. <i>“You’re lucky I’m not a thraggen or I probably wouldn’t have accepted it. I hear their planet is so rich in the stuff that they used to throw it away, back before they realized they could export it for a quick credit.”</i>");
		output("\n\n<i>“Really?”</i>");
		output("\n\nEmmy’s bends over to a storage compartment, her hips wiggling. <i>“Nuts isn’t it? We don’t even know how lucky we are until we can get to know someone else and gain a little perspective. Life’s funny like that. Ah! Here it is!”</i> She slams the drawer closed with a heavy ‘thunk’ and straightens, balancing an expensive-looking weapon in front of the bullets of her nipples. <i>“");
		if(getRanged) 
		{
			output("You’ve probably seen the Salamander Pistols we stock, but this beaut is special. I fitted it with a smart-linked scope system that’ll interface with damn near any optical interface, even one those fancy microsurgeon-based immune systems. You’ll be hard-pressed to find a more accurate pistol.");
			emmyLoot = new EmmysSalamanderPistol();
		}
		else 
		{
			output("You’ve probably seen the Lava Sabers we stock, but this beaut is special. I fitted the crossguard with miniaturized shield generators. They should supplement your shield belt’s defensives enough to give you an edge.");
			emmyLoot = new EmmysLavaSaber();
		}
		output("”</i>");
		pc.destroyItem(new Kirkite());
	}
	//Satyrite
	else if(item == "Satyrite")
	{
		output("\n\n<i>“Satyrite, huh?”</i> Emmy rolls the sparkling, striped gemstone between two claw-tipped fingers. <i>“Not many uses for this stuff in industry, but it’s prettier than Styx. I could probably get this put in some jewelry to wear around. Maybe a cock ring. Bet that’d feel good to rub against ");
		if(pc.totalClits() == 1) output("your clitty");
		else if(pc.totalClits() == 2) output("your clitties");
		else if(pc.hasCock()) output("your cock");
		else output("one of your girlfriend’s clitties");
		output(".”</i> She shudders. <i>“O-o-or maybe it’d be better as a necklace. Something I could show off outside of the bedroom.”</i>");
		output("\n\nYou’re still struggling with the too-vivid imagery of her earlier description.");

		output("\n\nBending over to root around in a storage compartment, Emmy seems unaware of just how interesting you found rambling. <i>“I hear some of the more superstitious cultures out there actually believe it boosts virility, like wearing a bunch of pretty rocks will somehow make you a better lover or give you a bigger family.”</i> She shakes her head and her ass, waving back and forth just below your nose. <i>“Bunch of silliness if you ask me. No studies have shown any such link. Ah! Here it is!”</i>");
		output("\n\nThe jackal-girl slams the drawer closed and straightens, balancing an expensive-looking weapon in front of the bullets of her nipples. ");
		if(getRanged) 
		{
			output("<i>“You’ve probably seen a Salamander Rifle around the shop, but you haven’t seen </i>this<i> Salamander Rifle. I fitted it with a hotshot energy supply, replaced the regulator contacts, and gave it a better muzzle, much like myself.”</i> She giggles and points to the dragon-headed design at the tip of the barrel. <i>“It should be a piece of cake to land a critical blow with this monster.”</i>");
			emmyLoot = new EmmysSalamanderRifle();
		}
		else 
		{
			output("<i>“You’ve probably seen a Jolthammer around the shop, but you haven’t seen </i>this<i> Jolthammer. I fiddled with the power source to try and boost the yield. It doesn’t always work, but when it does, the result is shocking.”</i> She giggles at her own pun. <i>“Just make sure not to touch the electric-ey end.”</i>");
			emmyLoot = new EmmysJolthammer();
		}
		pc.destroyItem(new Satyrite());
	}
	//Picardine
	else if(item == "Picardine")
	{
		output("\n\n<i>“Picardine, huh?”</i> Emmy rolls the unworked gem between her clawed fingertips. <i>“I’ve never gotten to handle this stuff before, let alone in an unprocessed state. I can’t believe you found me some! Nobody uses it for jewelry; it’s far too plain a stone for that. You’d be better off hawking quartz. The real use for it is in the thought-matrixes of A.I. and V.I. cores, along with psionic implants and some illegal drugs. I hear you can get a quick intelligence boost from some of them, provided you don’t mind muscular atrophy.”</i>");
		output("\n\nTurning away, the happy shopkeeper pulls open a storage compartment, but continues rambling, <i>“Supposedly, if you have a pure enough sample and put it inside a galotian, her body won’t absorb it. A tough membrane will build up around it, and somehow the goo-girl will wind up smarter for having a picardine core.”</i> Something loudly clanks from inside the drawer. <i>“Crazy, right? I hear there’s one out on the rush like yourself. Galoo or Galos or something. Word is she wants to find a supply big enough to bring the rest of her species up to her level. Oh! Here it is.”</i>");
		output("\n\nEmmy kicks the bin shut and spins around to reveal ");
		if(getRanged) output("a Salamander Rifle");
		else output("a Vamp Blade");
		output(". It barely manages to hide the hardness of her nipples. <i>“You may have seen one of these around the shop, but not like this one. Check this out.”</i> She holds it out to you. <i>“");
		if(!getRanged) 
		{
			output("I managed to get the whole blade replaced with one that had a more robust induction lattice. It’s not quite as strong as a retail model, but it can drain shields ");
			if(pc.hasCock()) output("faster than I drain your dick");
			else output("faster than I drain my dick");
			emmyLoot = new EmmysVampBlade();
		}
		else {
			output("I really suped this one up. I swapped the barrel out for a wider one, but only because I also sprung for a better emitter and focusing crystals. I suppose I could’ve tried to tighten up the beam a little more, but I figure you’re going to want to put energy into the target, not burn a pin-sized hole through it. Just don’t waste it on any crystalline beings.");
			emmyLoot = new EmmysSalamanderRifle2();
		}
		output("”</i>");
		pc.destroyItem(new Picardine());
	}
	//Merge
	output("\n\nPlacing the weapon on the table, the grinning Jackaless wiggles with unbounded excitement. <i>“All yours, hero.”</i>\n\n");
	//Loot, queue next page in eventqueue
	eventQueue.push(emmyLootPart2);
	quickLoot(emmyLoot);
}

//next
public function emmyLootPart2():void
{
	clearOutput();
	showEmmy();
	output("There’s little doubt that you got the better of that exchange, and judging by the look in Emmy’s eyes, this deal is about to get sweeter.");
	output("\n\n<i>“So... with that out of the way, there’s a certain girl in this shop who hasn’t had a proper orgasm since before... well, in a really long time.”</i> Emmy twirls an inky lock around a suit-enclosed fingertip. <i>“It won’t be fucking. Not really.”</i> She gives you an apologetic look. <i>“But we could sixtynine. Or do something like that. Anything more and I’d probably wind up breaking your pelvis.”</i>");
	output("\n\n<i>“That sounds nice. The first part, anyhow.”</i>");
	output("\n\nStalking around the countertop, the jackaless purrs <i>“It’ll be more than nice. Now, why don’t we get down to business...”</i>");
	flags["EMMY_QUEST"] = 3;
	//Pick new sex scene
	emmySexMenu();
}

public function emmySexMenu():void
{
	clearMenu();
	if(pc.hasCock()) addButton(0,"Get BJ",getBlownByEmmy);
	else addDisabledButton(0,"Get BJ","Get BJ","You don't have a dick to get blown.");
	if(pc.hasVagina()) addButton(1,"Get Licked",muzzlefuckingCunnilingus);
	else addDisabledButton(1,"Get Licked","Get Licked","You don't have a vagina to lick.");
	if(flags["EMMY_QUEST"] >= 3 && flags["EMMY_QUEST"] != undefined)
	{
		addButton(2,"Lick Her",eatOutEmmysVagYouPoorPussyAddictedSod,undefined,"Lick Her","Eat Emmy's pussy out. It could use some attention.");
		addButton(3,"Blow Her",emmyCockSlobber,undefined,"Blow Her","Suck Emmy's dick fairly submissively.");
		if(pc.hasGenitals()) addButton(4,"69",emmySixtyNine,undefined,"69","69 with Emmy.");
		else addDisabledButton(4,"69","69","You need genitalia to 69 with Emmy.");
	}
	else
	{
		addDisabledButton(2,"Locked","Locked","Emmy isn't willing to consent to anything lewder at the moment.");
		addDisabledButton(3,"Locked","Locked","Emmy isn't willing to consent to anything lewder at the moment.");
		addDisabledButton(4,"Locked","Locked","Emmy isn't willing to consent to anything lewder at the moment.");
	}
	addButton(14,"Back",backToEmmyMain);
}

public function emmyQuickOralPick():void
{
	if(pc.hasCock() && pc.biggestCockLength() >= 7) getBlownByEmmy();
	else if(pc.hasVagina()) muzzlefuckingCunnilingus();
	else if(pc.hasCock()) getBlownByEmmy();
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
		addButton(0,"Next",mainGameMenu);
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
	output("\n\nYou slump back on the counter from the sensation. Emmy’s tongue is as long as it is slick, the texture of her tastebuds an ecstatic salve for your lust-achened nerves. You didn’t even realize it a moment ago, when you were shivery from anticipation, but you needed this. You needed Emmy’s tongue against your most sensitive places");
	if(pc.hasClit())
	{
		output(", rubbing against your clitoral hood");
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
	}
	else output("and to be carresed by her waiting lips. The pussy-pleasers seal around your sex and fills your form with bliss, stealing your breath and filling your lungs with nothing but eager, lurid moans.");
	output("\n\nYour concentration and focus are drawn into Emmy’s greedy maw, drop by steaming drop, offered to her mouth as payment for the pleasure she now brings you. You grind your hips against her face without meaning to. The idea of stopping your wanton motions, of controlling your rebellious gyrations, never enters your mind. Your cunt");
	if(pc.totalVaginas() > 1) output("s are");
	else output(" is");
	output(" wholly charmed by the frustrated jackal’s thirsty tongue, and you wouldn’t have it any other way. She has you in the palm of her hand until she decides to drive you past the point of no return.");
	output("\n\nAnd it gets better.");
	output("\n\nYou didn’t think it could, not with how magnificently her mouth’s muscle tended to your feminine needs, but it does. Emmy’s tongue plunges deep, so deep you wonder if she’ll ever run out, if there’s anything behind her feminine muzzle but acres and acres of additional tongue.");
	if(pc.hasClit()) output(" Then her nose, moist with your drippings, kisses [pc.oneClit] a moment before spreading your folds.");
	output(" Strong fingers dig into your [pc.butt], but only so that Emmy’s snout can plunge inside you. She’s literally fucking you with her face, all while her tongue does the tango in your deepest passage.");
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
		output("\n\nAll of this... you could endure if that were it, if that were the only deluge of sensation you had to stomach, but it isn’t. Emmy’s fingertips have buried themselves into your extra folds, discovering yet untouched channels to nestle into.");
		if(pc.hasClit()) output(" Knuckles press at the underside of your [pc.clits], strumming you until you’re thrashing bonelessly to Emmy’s will.");
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
	if(flags["EMMY_ORAL_TIMER"] == undefined) flags["EMMY_ORAL_TIMER"] = GetGameTimestamp();
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
	if(flags["EMMY_ORAL_TIMER"] == undefined) flags["EMMY_ORAL_TIMER"] = GetGameTimestamp();
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
	output("Emmy straightens with a knowing smile");
	if(jizzbomb) output(", your [pc.cum] cascading down her form");
	output(". Her dick looks so hard that you swear it’ll tear its way out of her straining jumpsuit at any second. <i>“Sit tight, tiger. I’m gonna freshen up.”</i> She pats you on the [pc.leg] and ducks into a back door, audibly squishing with every step.");
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

//Omni Sixty-Nine, AKA Fenoxo Becomes JimT
//Req's genitals
public function emmySixtyNine():void
{
	clearOutput();
	showEmmy();
	output("You grin and suggest a little oral relief. Emmy looks due for a quickie, and seeing her so excited by your presence has you sympathetically ");
	if(pc.hasCock() && pc.hasVagina()) output("hard and wet, just like her");
	else if(pc.hasCock()) output("hard");
	else output("wet");
	output(".");
	output("\n\nEmmy’s tail wags, thumping against the back of the counter. <i>“Were you reading my mind? Not that it’s all that hard nowadays.”</i> She strokes the length of her cock, shuddering as her fingers trace a particularly bulgy vein. <i>“It’s pretty hard not to do all my thinking with this bad boy,”</i> Dipping lower to her cameltoe, she gasps, <i>“or this naughty girl. Fuck, I guess I better seal the door before I wind up playing with myself in the middle of the store, huh?”</i>");
	output("\n\nYou grin and nod.");
	output("\n\nThe eager jackaless closes down her store for your tryst. It doesn’t take long, but she keeps finding excuses to bend over, wiggling her ass in your direction, letting her weighty tits hang down, practically begging you to give them a squeeze. By the time she pulls a mat out of a storage closet and lays it out on the floor, you’re ready to jump her. Emmy giggles at your expression and stretches out on the cushion, indiscreetly letting her legs hang open while she fiddles with the seam of her suit. <i>“So, have you figured out what part of me you want to start with? I won’t blame you if you don’t think you can handle the big gun...”</i>");
	output("\n\nWhich part of hers will you please?");
	processTime(2);
	clearMenu();
	addButton(0,"Her Cock",suckEmmysCockDuring69);
	addButton(1,"Her Cunt",lickEmmysPussyDuring69);
}

//Suck Emmy’s cock
public function suckEmmysCockDuring69():void
{
	clearOutput();
	showEmmy();
	output("You grab hold of her suit zipper and yank it down, allowing a bloated canine cock to spring out, complete with a tapered head and bulgy knot. Emmy fidgets nervously when you grab the member, already slick with pre-cum. It firms perceptibly beneath your fingers and fills the air with the musky odor of a herm long-denied, aided the matted fur below, pasted down by her dick and its drippings.");
	output("\n\nYou tease, <i>“");
	if(pc.isBimbo()) output("I couldn’t not stick a cock like this in my mouth! It’s just too yummy looking.");
	else if(pc.isNice() || pc.isMischievous()) output("A big gun like this needs proper maintenance, dear. What kind of lover would I be if I didn’t help you empty the barrel?");
	else output("Please, this little thing isn’t going to scare me off.");
	output("”</i>");

	output("\n\n<i>“Really?”</i> Emmy nervously watches you ");
	if(!pc.isNude()) output("strip and ");
	output("climb down atop her, ");
	if(pc.legCount == 1) 
	{
		output("pivoting to place your own crotch just above her head");
		if(pc.tailCount > 1) output(", your tail curled gently around her neck");
		else if(pc.isGoo()) output(", your gooey base spreading over her hair, encapsulating every strand");
	}
	else output("your [pc.knees] on either side of her twitching ears");
	output(". <i>“I wasn’t sure that you woul-”</i>");

	output("\n\nYou angle her leaking tip up and suck it into your mouth, wrapping your [pc.lips] around it in order to offer proper suction. Unsurprisingly, Emmy’s words trail off into incoherent babbles, and her cock surges another inch upwards, humping against your tongue with the speed of its engorgement. Just how big can she get? You ease down, pulling another three inches into your maw, savoring the salty flavor of her pulsing flesh. Emmy’s whole body quivers when you sweep your tongue from side to side. She can’t help but tremble while spilling blobs of pre into your mouth.");
	output("\n\nLetting her length slip free isn’t something you particularly relish");
	if(pc.isBimbo()) output("; cocks deserved to be sucked, you know? B");
	else output(", b");
	output("ut you’ve got to make sure that she’ll return the favor before you lose yourself in the gentle back-and-forth motion of a leisurely blowjob. <i>“");
	if(pc.isBimbo()) 
	{
		if(pc.hasCock() && pc.hasVagina()) output("Are you gonna suck me or eat out my pussy? They’re both super delic-deli... uhm, tasty!");
		else if(pc.hasCock()) output("Like, hurry up and suck me too! I’ll make it feel ever betteeeer!");
		else output("Like, hurry up and lick me already so I can get back to suckin’ on your cock!");
	}
	else if(pc.isBro()) 
	{
		if(pc.hasCock() && pc.hasVagina()) output("Pick one and get to work. Doesn’t matter which.");
		else if(pc.hasCock()) output("Suck it, slut.");
		else output("Lick it, slut.");
	}
	else
	{
		if(pc.hasCock() && pc.hasVagina()) output("What’s it gonna be, Emmy? Suck on a juicy cock or mouthfuck my slit?");
		else if(pc.hasCock()) output("You’d better start sucking if you want to see what else I can do.");
		else output("You’d better start licking if you want to see what else I can do.");
	}
	output("”</i>");

	output("\n\nEmmy whimpers and stirs from beneath you. Her hands gently caress your [pc.butt], and her warm breath glides over your crotch as she pulls closer. <i>“D-d-don’t stop!”</i> A shock of moisture brushes your skin - her nose. <i>\"");
	if(pc.cockTotal() + pc.vaginaTotal() >= 3) output("Mmmm, so many choices.");
	else if(pc.cockTotal() + pc.vaginaTotal() >= 2) output("Mmmm, which one?");
	else output("Mmmm, o-kay...");
	output("”</i>");
	pc.lust(30);
	processTime(4);
	addButton(0,"Next",emmy69MiddleOfScene,1);
}

//Lick Emmy’s Pussy
public function lickEmmysPussyDuring69():void
{
	clearOutput();
	showEmmy();
	output("You grab hold of her suit zipper and yank it down, allowing a bloated canine cock to spring out. The vulgar phallus is hardly your target - just another obstacle on the quest for cunt. You edge it out of the way with your elbow and lift her sack to reveal a gleaming treasure box. Her black lips are puffy with need and so wet that the underside of her balls may as well be an extension of her cunt.");
	output("\n\nYou tease, <i>“I think this little lady needs the attention a little more.");
	if(pc.isBimbo()) output(" I bet she’s super delic-deli... uhmm, yummy!");
	else output(" You can’t keep her hidden under those big ol’ balls all the time.");
	output("”</i>");
	output("\n\n<i>“You mean it?”</i> Emmy watches you ");
	if(!pc.isNude()) output("strip and ");
	output("climb atop her with rapturous, eager eyes. <i>“Sometimes it’s easy to forget my pussy when I’ve got a crotch-mounted bazooka.”</i> She giggles.");

	output("\n\nDipping a finger inside, you gently explore the interior of her dusky folds, revelling in the slick, velvety texture of her labia against your knuckle, making soft squelches with every playful intrusion. <i>“You’re wet,”</i> you observe with a smile, adding a second digit. <i>“So wet.”</i> Hooking your finger upward as you draw it out, you squeeze a lewd-sounding moan from the herm, pressing on her most sensitive areas. She wriggles like a caught fish, babbling and groaning, streaming rivers of her slippy cunt-juice onto her mat. <i>“Not wet... drenched,”</i> you observe.");
	output("\n\nStill groaning, Emmy nods into your [pc.thighs], dragging her twitching ears along your [pc.skinFurScales]. She’s already acting like your puppet, quivering with every twist and rub, moaning when you pause your none-to-gentle undulations, and arching her hips to present her clit for examination. And what a clit it is! The bulbous little pleasure bead is wet and glistening, thick enough that its hood may as well be made of ill-fitting spandex. It pulsates demurely, begging to be touched.");
	output("\n\nWhat a cute little button. You touch it.");
	output("\n\n<i>“Ooooooh,”</i> Emmy pants, closing her eyes and groping tits, too lost in her own ecstasy to return the favor. Her hips roll back against your palm, forcing the swollen nub harder into your fingertip. Veins pulse and throb along her cock’s length, and you can hear the muffled splatter of jism on fur. Did she get off already? Did this horny, furry slut fucking paint her tits already?");
	output("\n\nHow rude.");
	output("\n\nYou pull away, shaking webs of sticky ladyjuice free from your fingers. The jackaless whines and wiggles, trying to draw you back in, but you just slap her ass. <i>“Greedy sluts who don’t share don’t get more pleasure.”</i> Part of you wants to go right back to playing with her onyx box, but you hold firm, knowing that a little patience will go a long way towards slaking your own unchaste urges. You do kiss her, lips to netherlips, and whisper, <i>“Use your mouth, Em.”</i>");
	output("\n\nEmmy whimpers and stirs from beneath you. Her hands gently caress your [pc.butt], and her warm breath glides over your crotch as she pulls closer. <i>“Unnngh! O-okay!”</i> A shock of moisture brushes your skin - her nose. <i>“");
	if(pc.cockTotal() + pc.totalVaginas() >= 3) output("Mmmm, so many choices.");
	else if(pc.cockTotal() + pc.totalVaginas() == 2) output("Mmmm, which one?");
	else output("Mmmm, you’ll like this.");
	output("”</i>");
	pc.lust(30);
	processTime(4);
	clearMenu();
	addButton(0,"Next",emmy69MiddleOfScene,2);
}

public function emmy69MiddleOfScene(youSuck:int):void
{
	clearOutput();
	showEmmy();
	var x:int = 0;
	var emmySucks:int = 0;
	//Emmy Sucks Yer Cock
	if(pc.hasCock() && (!pc.hasVagina() || rand(2) == 0)) 
	{
		emmySucks = 1;
		x = pc.biggestCockIndex();
		output("Warmth engulfs you. The heat of the jackaless’s breath blends the texture of her tongue and the warmth of her suckling cheeks into a bath of all-consuming pleasure. Sighing, you momentarily forget your own duties and moan, <i>“Yesss,”</i> in a drawn-out hiss, rocking your hips back against Emmy’s maw, forcing ");
		if(pc.cocks[x].cLength() >= 12) output("inch after inch");
		else output("every inch you have on offer");
		output(" deep into her lengthy muzzle. ");
		if(pc.cocks[x].cLength() >= 8) output("A lesser creature would never be able to withstand such an onslaught of cock, yet her snout gobbles it right up. ");
		output("She’s blessedly careful with her teeth, never so much as scraping your [pc.cock " + x + "], but her tongue and plush lips lavish you with endless twirls of affection.");
	}
	//Emmy Eats You Out
	else
	{
		emmySucks = 2;
		output("Heated slickness fills you. The jackaless’s tongue wiggles as it slides deeper, rubbing her textured tastebuds against your clenching folds, bathing them in alternating layers of bliss and spit. Sighing, you momentarily forget your oral duties and moan, <i>“Yesss,”</i> in a drawn out hiss, rocking your hips back against Emmy’s maw, pressing her moist nose into the base of [pc.oneClit]. She changes angle to plant a kiss on the aching ");
		if(pc.clitLength < 3) output("bud");
		else output("girl-boner");
		output(", briefly sucking it before popping free with an adorable, <i>“Mwah!”</i> Then her tongue is spearing back inside you, capturing your thoughts in a vortex of sapphic pleasure.");
	}
	//Omnimiddle shit. All choices here:
	output("\n\nSomehow, ");

	if(youSuck == 1) output("sucking her cock");
	else output("eating her out");
	output(" is almost as exciting as what she’s doing to you. Holding back is impossible, not with her talented maw tending to your every whim, taking you to the edge of ecstasy again and again. For a girl determined not to be a slut, she’s damned good at wringing pleasure out of you. Moans of pleasure slip from your [pc.lips], vibrating through the hermaphroditic jackal’s genitalia, spurring her to release fragrant dribbles of raw sexuality.");
	output("\n\nThe longer your tryst goes on, the more you realize that she doesn’t seem to want you to get off. She’s keeping you dazed with sparks of raw sensation that make your [pc.legOrLegs] quiver and your eyes roll halfway back. ");
	if(youSuck == 1) output("Emmy’s pre-cum is a thick glaze on your tongue");
	else output("Emmy’s slippery girlcum is a wonderful glaze for your tongue");
	output(", but she’s far too in control to be very close to cumming. You’ll have to try harder. ");
	if(youSuck == 1) output("You’ll have to swallow more of her musky, pulsing cock.");
	else output("You’ll have to dive deeper into her pussy and eat her until your cheeks gleam.");

	//Eat her out
	if(youSuck == 2)
	{
		output("\n\nWrapping your hands around Emmy’s butt, you push your face harder against her quivering cunt, thrilled to feel her balls pulse against the underside of your chin. You wrap your lips around her pudgy clit and rhythmically suck, lashing your tongue over its surface and around its hood, savagely strumming her sex-raw nerves. The jackaless cries out at that, and a small squirt of her girlish love splatters your lower lip. She’s trembling like mad and properly stimulated, and her mouth is going wild on you ");
		if(emmySucks == 1) output("dick.");
		else output("cunt.");
	}
	//Brojob!
	else
	{
		output("\n\nWrapping one hand around Emmy’s knot, you give it a firm squeeze, then slide it deeper. You do more than merely suck and squeeze, sliding your fingers all over the sensitive bulb of flesh at her base. Her sheath can’t even escape, not when you slide your pinky into the forgotten folds to rub the hyper-sensitive flesh beneath. The jackaless cries out at that, spurting huge, salt-tinted blobs of pre-cum into your mouth. It’s all you can do to swallow it, but at least her balls are bobbing and pulsating, on the edge of eruption. Her ability to edge you evaporates in the furnace of her own unspent need.");
	}
	processTime(10);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",emmy69OrgasmTime,[youSuck,emmySucks]);
}

//PC orgasms
public function emmy69OrgasmTime(args:Array):void
{
	clearOutput();
	showEmmy();
	var youSuck:int = args[0];
	var emmySucks:int = args[1];
	var x:int = args[2];
	//Ladytypes
	if(emmySucks == 2)
	{
		output("Waves of ecstasy roll through your [pc.vagina " + x + "], carried on Emmy’s wildly undulating tongue. For a girl who seems to obsess over her cock non-stop, she’s a true pro at licking pussy. Her plush, slit-slickened lips seal around [pc.oneClit] and bathe you in bliss. Her tongue’s caresses make your body shudder and your throat whine. The heavenly suckles make your [pc.hips] lift in ecstasy. You cry out");
		if(youSuck == 2) output(", muffled by her pussy");
		else output(" around her drooling cock");
		output(", and your world shatters.");
		output("\n\nYour eyes roll back, and your thoughts scatter, replaced by nonsensical fireworks of pink and purple. Your body rolls and gyrates unthinkingly. There’s nothing left for you but the wonderful feeling of exquisite, perfect pleasure.");
	}
	//Cawks!
	else
	{
		output("Waves of orgasmic ecstasy roll through your [pc.cock " + x + "], borne on Emmy’s greedily slobbering maw. It figures that a girl who masturbates by sucking herself off would be a fucking pro at giving blowjobs. Her lush, pre-slathered lips seal tight around the midpoint of your shaft and bathe you in bliss, sliding back and forth with feverish need. You can hear the lurid squelches of her fucking her mouth with your cock all the way from between her legs. It sounds almost as good as it feels, and when she bottoms out, stopping to slide her tongue");
		if(pc.balls == 0) output(" all over your captive cock");
		else output(" out to lap at your [pc.balls]");
		if(pc.cocks[x].cLength() > 12) output(", her neck bulging from how much she’s forced down her throat");
		output(".");
		output("\n\nPleasure draws every muscle in your body taut. White spots dance behind your eyes, and your world explodes. Your [pc.hips] thrust powerfully forward, and you feel the wonderful, blessed relief of ejaculation, like a white-hot bar of bliss blasting out of you and into the heavens - or Emmy’s mouth. They may as well be one at the same thing to you.");
	}
	//Emmygirlcum
	if(youSuck == 2)
	{
		output("\n\nA spray of girlcum fills your mouth, drawing you back to the real world with the tangy taste of Emmy’s cunt. You swallow noisily, letting her paint you nose and cheeks with more of her gushing goo. Her balls pull tight below your chin, and you hear the sound of her masculine spunk splattering off the bottom of her tits. Flecks of it hit your [pc.belly], warm and wet, a salty compliment to the feminine love you’re currently struggling to swallow.");
	}
	//Emmy boycum
	else output("\n\nThick, salty-tasting spunk fills your mouth, drawing you back to the real world before you choke on it. You swallow noisily, but it’s not fast enough for Emmy’s super-sized ejaculations. Spunk rolls over your bottom lip in a wave while small streams dribble from the corners of your mouth. Still, you preservere, gulping down as much of as you can. Her poor balls are being blasted from behind by girlcum too, making her whole sack gleam brighter than a brand new starfighter.");
	//Merge
	output("\n\nPure pleasure backs your ceaseless swallowing. Both you and Emmy are lost to it, ingesting as much of the other’s love as possible before your twinned orgasms completely wind down. How long you spend bound to Emmy’s crotch, you don’t know, but when you stagger up and burp, tasting her on your tongue and breath, you feel completely and totally winded.");
	//-10 energy!
	pc.energy(-10);
	output("\n\nEmmy doesn’t seem to have fare much better. She’s panting and trying to lap your ");
	if(emmySucks == 2) output("[pc.girlCum]");
	else output("[pc.cum]");
	output(" from the edges of her muzzle, but her tongue seems more intent on hanging from her mouth like a dog’s on a hot day. <i>“Wow...”</i> She looks at your face, still stained with the evidence of her orgasm, and visibly shudders, her cock abruptly swelling back to full hardness. Dazed, she mumbles, <i>“I umm... I’ll be uh... gotta go clean up.”</i> Jizz trickles from the tip of her member as she staggers into a back room.");
	processTime(15);
	if(youSuck == 1) pc.loadInMouth(chars["EMMY"]);
	else pc.girlCumInMouth(chars["EMMY"]);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",emmy69Epilogue,args);
}

public function emmy69Epilogue(args:Array):void
{
	clearOutput();
	showEmmy();
	var youSuck:int = args[0];
	var emmySucks:int = args[1];
	var x:int = args[2];
	output("The Emmy that returns after a few minutes is looking much more put together, if no less erect, but she’s back to her old, ebullient self. <i>“Hey, quit checking out the merchandise and help me clean up this mess.”</i> She gestures at the cum-soaked mat on the floor. Thankfully, recessed grates in the floor opened up to drain away the rest of the puddled evidence of your excesses, or you’d need to fetch a mop.");
	//Asshole
	if(pc.isAss()) 
	{
		output("\n\nYou make for the door, but a press of a button seals the portal before you can make good on your escape. <i>“Hey, just because you got me off doesn’t mean you can dine and dash.”</i>");
		output("\n\nFuck. Looks like you have to help the furry bitch clean up her jizz-soaked mat.");
	}
	//Merge
	output("\n\nYou help Emmy heft the fluid-weighted fabric off of the salesfloor and into the ‘Employees Only’ area, earning a kiss with a hint of your own slimy residue. You’re sure to share plenty of hers back.");
	output("\n\nShe tosses you a towel to wipe up with and laughs, <i>“Did I really cum that much? Wow.”</i>");
	output("\n\nThere’s so much that the towel is soon soaked, but at least you’re clean... sort of. You can still smell sort of like ");
	if(youSuck == 2) output("her cunt");
	else output("her spunk");
	output(". Hopefully no one will notice.");
	//Smell like pussy/dick status effect? Maybe look into dat.
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Cockslobber By Fenopus
//By Frogapus & Fenoxo
public function emmyCockSlobber():void
{
	clearOutput();
	showEmmy();
	author("Frogapus&Fenoxo");
	output("<i>“");
	if(pc.isBimbo()) output("Shut up and... just let me suck that cock,");
	else if(pc.isNice()) output("My turn to take care of you, Em,");
	else if(pc.isMischievous()) output("You need to take better care of that rifle, Emmy.”</i> You pat her bulge and watch the twin bulges of her balls throb. <i>“Those power cores look like they’re about to overload,");
	else output("Just shut up and let me do this,");
	output("”</i> you say with a knowing smile.");

	output("\n\nEmmy pants and staggers back, dick already throbbing, creating a spherical distention in the poor herm’s suit at the top of her lewdly-jutting member. <i>“O-okay, but i-it’s not sex. Just a little fun.”</i> She sounds more like she’s trying to assuage her own guilty conscience than talk to you. Either way, her dick is clearly ready for some loving.");
	output("\n\nYou sink to your knees, already shivering in anticipation, and lean forward slightly, running your hands along the straining fabric, marvelling at how effectively the mystery material contains what feels like enough pre to fill a coffee cup. Emmy rewards you with her hands on your head");
	if(pc.hasHair()) output(", running through you hair");
	else output(", stroking your [pc.skinFurScales]");
	output(". At first her touches are uncertain and shaky, but when you lay your cheek against her achingly erect jackal-cock, those hesitant caresses become firm and commanding, betraying a surprising strength. You look to her for final confirmation, her eyes meeting yours in a look of hungry approval.");

	output("\n\nEmmy’s gaze is almost a physical force, full of desire and an almost astounding amount of need half-concealed behind her pride. Her smile sends a thrill of delight down your spine, and you run your palms up her thighs, feeling her heat against your hands, the subtle buck of of hips against you. The catch of her form-fitting suit practically releases itself, but you keep it from sliding down too quickly once it reaches crotch level, freeing the soaked slab of girlmeat with deliberate slowness.");

	output("\n\nThe jackaless’s thickness throbs under your fingertips, its veins pulsing and flexing in appreciation. Her sable shaft is slick and musky from bathing in its own pre-cum for so long, the latest addition a heady frosting on an already perverse feast. Just a whiff of it leaves you briefly dizzy and aroused.");
	if(pc.hasCock() && pc.hasVagina())
	{
		output(" Your own [pc.cocks] and [pc.vaginas] respond by getting every bit as hard and wet as your horndog friend, but you can tend to them later.");
	}
	else if(pc.hasCock())
	{
		output(" Your own [pc.cocks] respond");
		if(pc.cockTotal() == 1) output("s");
		output(" by growing just as hard, but you can sate ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" later.");
	}
	else if(pc.hasVagina())
	{
		output(" Your own [pc.vaginas] respond");
		if(pc.totalVaginas() == 1) output("s");
		output(" by ");
		if(pc.wettestVaginalWetness() >= 5) output("drooling thick streams of [pc.girlCum]");
		else if(pc.wettestVaginalWetness() >= 3) output("getting even wetter");
		else output("growing wetter with every passing second");
		output(", but you can sate ");
		if(pc.totalVaginas() == 1) output("it");
		else output("them");
		output(" later.");
	}
	output(" She’s shivering under your careful ministrations, and it’s just as well; you’re trembling with the strain of resisting your own base cravings. You can’t wait to slide her meat into your hungry mouth.");

	output("\n\nAnd she’s not resisting at all - quite the opposite.");

	output("\n\nThe second your mouth comes within an inch of her freshly freed shaft, she groans and shoves you against it. You barely have time to yelp as she grips ");
	if(pc.hasHair()) output("your [pc.hairNoun] tightly");
	else output("your skull in both hands");
	output(" and mounts your face with her already-dripping dick. It’s a snug fit for your [pc.lips], one that gets tighter the deeper she plows into your throat.");
	if(!pc.isBimbo()) output(" You struggle not to choke as you feel her swell up even larger inside your mouth.");
	else output(" You struggle not to cum as you feel her swell up even larger in your mouth. It’s so hard not to lose yourself in her pleasure, but if you’re going to bring her off properly, you can’t cum your brains out yet, not even while she flattens your uvula against the roof of your mouth.");

	output("\n\nYou gulp and wriggle against her, and she squeals happily, enjoying fucking her way down your throat, leaking more into your mouth. At the first taste of her, you pause, and you gulp, your neck squeezing against the head of her tasty prong. You’re rewarded with a happy sigh from Emmy and a heavy spurt of fluid, thick enough to be the full orgasm of a lesser creature.");

	output("\n\nShe releases her hold on your hair, and you slide back, just enough to get resituated, and swirl the tip of your tongue around the head of her cock. She gives your hair a gentle tug and you respond obediently, running your lips down her length, sucking noisily on her member. Once you reach the base, you get another happy gush of pre down the back of your throat. You slide back up, moaning around her shaft in hungry delight, while she does the same, alternating between fucking your face like it’s her own personal sex-toy and watching you service her meat.");

	output("\n\nUp and down her shaft you go, encouraged by her sweet sounds of pleasure and bursts of pre that may as well be ejaculations, guided by her tugging hands. She’s in control, and you’re enjoying every minute of it, happy to give her the tender love and throat-fucking she so clearly needs. You place your hands on her spit and spunk-slicked balls and rub them softly as she draws you up, coaxing a low hum of pleasure from Emmy. She quickens her pace, tugging you down sooner each time, and you take the hint.");

	output("\n\nAfter a few more minutes, you’re pumping your head up and down like a piston, working her shaft as her fingers begin to tighten on your hair, taking complete control over your mouth and transforming it into a slobbery receptacle for her throbbing cock. She’s growling like an animal, and you can feel the rapidness of her heartbeat in the way her dick bulges against your lips and tongue. She’s ready to cum, and you want every drop of it.");

	output("\n\nAt last, she yanks you the whole way in, burying your nose into the sensitive folds of her sheath. The pain from her rough hair-pulling makes you cry out, uselessly vibrating your throat around her pulsating dick as she unloads into you, dumping what feels like a gallon of her thick, salty cum straight down your gullet. Your eyes roll back in absolute delight as she pumps you full of her seemingly-endless seed.");

	output("\n\nYou gulp reflexively, instinctively, hungry for her liquid pleasure, delighting in the clenching of her balls against your chin and the fullness of your belly. ");
	if(pc.isBimbo())
	{
		output("Any restraint you may have scraped together evaporates, and you sympathetically cum, spasming in bliss to the feeling of cum pouring into your stomach. ");
	}
	output("And when she finally lets go of you, the ache in your jaw, your throat, your hair, are all drowned in the profound pleasure of a being so utterly stuffed with her warm cum.");

	output("\n\nEmmy pulls out of your mouth, wincing when your teeth scrape past her swollen knot. Popping her thick dick out, she leaves a wet trail of her cum behind. Your aching jaw leaves you with your mouth feeling stretched and oddly slack, adding to the dazed look already on your face. She runs her hand gently over your head as a bead of cum rolls off your glazed lips and splashes down on your [pc.chest].");

	output("\n\n<i>“How am I going to live without one of those every half hour?”</i> Emmy purrs in approval, halfheartedly packing her mostly-hard member back away. She shakes her head, perhaps amazed at how much she enjoyed it, and struts back to her usual spot with a wink.");

	pc.loadInMouth(chars["EMMY"]);
	pc.lust(25);
	processTime(20+rand(10));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Vag Eatin~
//Eat her out till she blows all over her tits. Then make her suck herself off for the next one.
public function eatOutEmmysVagYouPoorPussyAddictedSod():void
{
	clearOutput();
	showEmmy();
	output("<i>“");
	if(pc.isBimbo()) output("Your poor pussy is so totally ignored! The poor thing needs some attentions, Ems! Good thing you’ve got me here to take care of you");
	else if(pc.isNice()) output("It’s my turn to take care of you, Em");
	else if(pc.isMischievous()) output("With balls like that, your poor pussy must be feeling smothered. Here, let me help");
	else output("I’m going to eat you out. Relax, you’ve earned it");
	output(",”</i> you purr, stalking forward.");

	output("\n\nEmmy looks startled but pleased, nervously stepping back until her ass bumps into the countertop, her tail swishing back and forth excitedly. <i>“S-sure. We could that.”</i> She hops up on top and spreads her legs wide, gaining confidence now that she’s accepted the idea, her too-masculine bulge on full display. <i>“You sure you can find the buried treasure under these boulders?”</i>");
	output("\n\nYou flash a predatory grin and put your hands on her thighs. <i>“I’m damn sure gonna try.”</i> The suit’s seal is surprisingly easy to locate and pop open, revealing a basic, zipper-type fastener. You give it a tug, admiring the way the jackal’s compressed curves slowly spill free of the constricting fabric, revealing lush tawny fur and inky nipples that would be hard enough to cut glass were they not so void-blasted pudgy. Rubbing your way up the inside of her thigh with your other hand, you enjoy the lewd little squeeks she makes as you reveal more and more of her body.");
	output("\n\nThe zipper accelerates the closer it gets to her waist, pried open by the force of her ramrod-stiff cock thrusting its way out of confinement. Progress briefly hitches at the outlandish curves of her hips, but a sharp tug carries you through to your goal, allowing you to roll the jumpsuit the rest of the way down to her paws and reveal the jackal-woman’s full, naked form. Unsurprisingly, you still can’t see her pussy.");
	output("\n\nTime to fix that. Her balls are almost too large to hold one-handed; you have to cradle one with your wrist just to keep it from slipping down and giving you a black eye. At last, you’re able to view the inky lips of Emmy’s pussy. It shines, even shaded by your arms. She’s dripping wet, so juicy that even the underside of her ballsack is sodden with her fluids, but your attention is firmly rooted on the source of that ambrosial liquid.");
	output("\n\nLicking your lips, you lean closer, washing your heated exhalations over her sable mons, delighting in the sight of her clitoris engorging, pushing out of her clitoral hood at the very first hint of attention, plumping up until it looks shiny and distended, easily the size of a large gumball. You hold back from it for now, extending your tongue to sample to Emmy’s warm juices. She’s a little tangy and salty, perhaps from being so pent up in her jumpsuit for so long. Her stout prick twitches indignantly, but you answer with a slow press between her lips, snaking your tongue into the jackaless’s clenching box.");
	output("\n\nEmmy moans like a porn star, full-throated and hungry. Most girls need practice to pitch their voices so lewdly, to give the perfect vocal encouragements for their partner’s arousal. She does it naturally. With every twist");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG) && pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" and coil");
	output(" of your ");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("lengthy ");
	output("tongue, her cries change in pitch, and her pussy grows wetter. You press deeper, letting your own lips press against hers, mixing spit and cunt-juice together into a ");
	if(pc.mf("","lady") == "lady") output("sapphic slurry");
	else output("slick slurry");
	output(", letting her paint your cheeks in her need.");
	output("\n\nWhen your upper lip brushes against the bottom edge of her throbbing button, Emmy’s hips lurch, smashing her pussy into your face. A tide of girlcum rushes out to fill your mouth, and something splatters more loudly than a thrown water-balloon high above, raining what must be cum down over your [pc.hair]. You swallow what you can but pull back, irritated that ");
	if(!pc.isBimbo()) output("she’s dared to sully your pussy-play with sprays of her boyish goo");
	else output("she’s wasting all the cum when she’s big enough to pipe it straight into her own mouth");
	output(".");
	output("\n\n<i>“");
	if(pc.isBimbo()) output("Hey, you shouldn’t waste cum like that, Ems. Put it in your mouth next time, okay? I promise it’ll taste super yummy.");
	else output("Emmy, if you’re going to shoot that thing off, try not to hit me with it. I’m trying to focus here.");
	output("”</i> You shove her still-spurting cock up into her cleavage. Even if she doesn’t get the idea, they ought to keep it from spraying everywhere.");
	output("\n\nNow, back to the main course. You seal your mouth around her entrance, clit and all, fluttering your tongue up one side, around her clit in a slow circle, and then down the other. She’s still cumming of course, squirming and gushing slutty juices straight into your mouth. You get to gulp down three or four mouthfuls before her climax winds its way down, but you’re not satisfied with one dick-distracted orgasm.");
	output("\n\nWhile she’s still super-sensitive from the last, you lance your tongue back inside, sucking rhythmically with your lips. The insides of her walls squeeze down around your writhing muscle");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(", particularly when it reaches unnaturally deep into her to probe at the entrance to her womb");
	output(". Sadly, she’s no longer gasping and moaning quite so cutely. Something’s muffling her screams of pleasure; she’s taken your advice, it seems.");
	output("\n\nYou intensify your cunt-eating, sucking harder, licking faster, and being sure to bathe her in feverish kisses whenever you stop to catch your breath. Emmy whines, muffled, and her balls clench in your palm. You thrust two fingers into her channel to replace your tongue, then redirect your oral organ’s caresses onto her behemoth of a clit, flicking your tongue across it, stimulating her past the breaking point.");
	output("\n\nEmmy cums again. This time there’s far less girlcum, but her pussy’s rhythmic contractions are far, far stronger. It feels like she’s going to break your fingers off with how hard her cunt is clamping down. Her juices are sweeter this time too, this mouthful of cunt-love freshly made, just for you. You keep your dual-sexed lover lost in the throws of bliss for what feels like hours. Your mouth is sore, and your tongue exhausted, but you still lick and kiss until you feel every ounce of strength drain from the jackaless’s fucked-out form.");
	output("\n\nPatting her pussy as if to say, <i>“good girl,”</i> you back away and stand, stretching on ");
	if(pc.legCount == 1) output("a ");
	output("[pc.legOrLegs] made tired from kneeling. Emmy is flat on her back, nearly sliding off the counter. A small lack of cum is draining out from between her tits, and trickles of white ooze from both sides of her slack mouth. One of her hands is idly rubbing her dick while the other cradles a very swollen belly. Just how much cum did she swallow?");
	if(pc.isBimbo()) output(" You’re totes jealous.");

	output("\n\nIvory still trickles from the tip of her still-hard cock, and her knot is swollen up to the size of a grapefruit. Emmy’s eyes are halfway rolled up behind her drooping eyelids, and she’s blabbering gibberish intermingled with words like, <i>“yes,”</i> <i>“good,”</i> and <i>“fuck.”</i> The poor thing just wasn’t ready to withstand the multiorgasmic delight of a proper pussy-licking. You wonder if she’ll ever get used to it while wandering into the back to make use of her shower facilities.");
	//35ish min pass
	processTime(35);
	//+A lotta lust
	pc.lust(33);
	pc.girlCumInMouth(chars["EMMY"]);
	pc.girlCumInMouth(chars["EMMY"]);
	//[Next]
	clearMenu();
	addButton(0,"Next",cunnyLickEmmyEpilogue);
}

public function cunnyLickEmmyEpilogue():void
{
	clearOutput();
	showEmmy();
	output("Emmy stumbles in just before you finish soaping up, mouthing, <i>“Wow.”</i>");
	output("\n\nYou grin knowingly at her, and toss her the cleansing tab.");

	output("\n\n");
	if(flags["EMMY_EATEN_OUT"] == undefined) output("<i>“Thanks for that, [pc.name]. You can lick my pussy any time you want.”</i> She scrunches up her nose, then giggles, <i>“Except when I’m with a customer I guess. I don’t know how the girls in movies can keep it together with a tongue wiggling down there.”</i>");
	else output("<i>“I can’t believe you like doing that for me so much. Thank you, [pc.name].”</i> She stretches and sighs, smiling wide. <i>“It’s going to be hard working while I daydream about you doing </i>that<i> again.”</i>");

	IncrementFlag("EMMY_EATEN_OUT");

	output("\n\nTogether, you both make yourselves decent and return to the store a short time later.");
	//Shower
	//20m pass
	pc.shower();
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
