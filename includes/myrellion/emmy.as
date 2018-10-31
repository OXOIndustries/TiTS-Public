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
					 4 - You talked about her toy but haven't bought it yet.
					 5 - You bought the toy, but not yet delivered.
					 6 - Delivered
*/
//EMMY_FLOWER_GIFTED - Have you given her a flower? If undefined and you passed it on the quest, you did it via email.
//EMMY_TRADE_OFFERED - offered to sell Emmy shit yet.
//EMMY_FUCKED - if you've had "real" sex with Emmy. None of that namby pamby oral shit.
public function showEmmy(nude:Boolean = false):void
{
	if(flags["MET_EMMY"] == undefined) showName("KIHACORP\nREP.");
	else showName("\nEMMY");
	if(!nude) showBust("EMMY");
	else showBust("EMMY_NUDE");
}
public function emmyIsCrew():Boolean
{
	return false;
}
/*Moved these into the Creature block.*/
/*
public function applyCumSoaked(arg:Creature):void
{
	arg.applyCumSoaked();
}

public function applyPussyDrenched(arg:Creature):void
{
	arg.applyPussyDrenched();
}
*/

//Push it out?
public function pushOutTheCumDummy():void
{
	clearOutput();
	showEmmy();
	output("You ask her why she doesn’t just go to the bathroom and push out all that cum.");
	output("\n\n<i>“Are you kidding me?”</i> Emmy retorts, arching her back and wincing, the curve of her belly forcing the point of her cock to jut forth like an iron spike (and probably just as hard). <i>“I’m </i>so<i> full. I can feel it sloshing around when I move, bathing my ovaries, hot and sticky and... and... well, fulfilling. No pun intended. I’m going to stay like this as long as I can, then, when I can’t take it any more, I’m going to let it out, use it as lube, and watch my dick go off harder than a champagne bottle strapped to a vibrator.”</i>");
	output("\n\n<i>“Soo...”</i>");
	output("\n\n<i>“So you did this to me. Buy something or fuck off for a bit and let me enjoy it. You can find ways to get me dirty all over again after I’ve had my fun,”</i> Emmy sasses at you.");
	processTime(3);
	clearMenu();
	//Buy item or leave
	addButton(0,"Buy",buyFromEmmy,undefined,"Buy","Buy some of the weaponry.");
	addButton(1,"Trade",tradeWivEmmy,undefined,"Trade","See if she’ll buy some of your old gear. You could use the extra credits.");
	addButton(14,"Leave",mainGameMenu);
}

//Procs every four hours when Emmy has some belly bulge!
public function emmyCumClearance():void
{
	if(currentLocation == "KIHASHOP")
	{
		if (emmy.bellyRating() >= 40) AddLogEvent("Emmy excuses herself to the employee room. A few moments of pregnant silence follow, broken by the abrupt sound of gallons of fluid jetting from something... something that isn’t a faucet. Emmy’s voice can be heard moaning deliriously, and wet-sounding slaps echo out to the sales floor. You’re about to go check on her when she staggers out with a smile, her belly significantly deflated.", "passive", -1);
		else if(emmy.bellyRating() >= 5) AddLogEvent("Emmy excuses herself to the back room, promising to return in a moment. You barely hear the sound of something wet popping out and a muffled, throaty moan. A few moments later, Emmy staggers back out with a tighter belly and a twitching dick.", "passive", -1);
	}
}

public function emmyTeaseCum():void
{
	if(currentLocation == "KIHASHOP")
	{
		AddLogEvent("Emmy abruptly moans and collapses over the top of the counter, her hips furtively pumping back and forth. You don’t get a good look at it, but it seems like the constant teasing has finally gotten to her, leaving the poor thing with nothing to do but quietly stuff her own womb with hours of backed-up discharge. By the time she straightens, she’s gained a massively wobbling, cum-pregnant belly.", "passive", -1);
	}
}

public function emmyTeaseCumEffects():void
{
	//Flood dat bitch
	emmy.loadInCunt(emmy,0);
	emmy.loadInCunt(emmy,0);
	emmy.loadInCunt(emmy,0);
	emmy.loadInCunt(emmy,0);
	emmy.loadInCunt(emmy,0);
	emmy.loadInCunt(emmy,0);
	emmy.loadInCunt(emmy,0);
	emmy.loadInCunt(emmy,0);
	emmy.orgasm();
}

//StatusTick stuff shoved into own functions to keep from fucking the list during the main loop
public function emmyCumStatusPurge():void
{
	emmy.removeStatusEffect("Vaginally-Filled");
	emmy.removeStatusEffect("Orally-Filled");
	emmy.removeStatusEffect("Anally-Filled");
}

//Back to main menu
public function emmyMainMenuPostHermHarnessgasm():void
{
	userInterface.showPrimaryOutput();
	clearOutput();
	showEmmy();
	output("Emmy leans back and rubs her belly, sometimes fluttering the very tips of her fingers across the endlessly hard length of her boner. <i>“So, you need something else, or can I get back to enjoying how fucking hot this is? Fuck, even my belly button is an outtie now.”</i>");
	output("\n\nIt’s true. The once-innie is thrusting against the paper-thin lining of her suit, fully completing the look of a ");
	if(emmy.bellyRating() <= 6) output("mildly");
	else if(emmy.bellyRating() < 14) output("moderately");
	else if(emmy.bellyRating() < 25) output("nicely");
	else if(emmy.bellyRating() < 40) output("heavily");
	else output("exquisitely");
	output(" pregnant jackal.");
	emmyMainMenu();
}

//Push button while in shop with gravid emmy
public function gravidEmmyHarnessOverride():void
{
	clearOutput2();
	var txt:String = "";
	if(currentLocation == "KIHASHOP")
	{
		txt += ("Grinning");
		if(pc.isMischievous()) txt += (" mischievously");
		else if(pc.isAss()) txt += (" evilly");
		txt += (", you activate Emmy’s herm-harness, fully looking forward to watching the gallons of backed-up spunk escape around the toy’s knot.");
		txt += ParseText("\n\n<i>“Naughty [pc.boy], [pc.name].”</i> Emmy coos, waggling one finger while the other continues to play with her tummy. <i>“I disabled your remote access code as soon as I recovered from your last present. You’ll just have to wait for me to work off this load before filling the Emmy-tank up again.”</i> She giggles and bats her eyelashes. <i>“");
		if(pc.hasCock()) txt += ("Maybe you could get yourself a dick and see if you can do a better job sometime.");
		else if(pc.cumQ() >= 1000 && pc.balls > 0) txt += ("Maybe you could show me how it’s done next time.");
		else txt += ("Maybe you could find some mods and show me how it’s done next time. Trust me, you haven’t lived until you’ve had balls so packed full of spunk that they slosh with every step.");
		txt += ("”</i>");
		txt += ("\n\nWell, that failed. What now?");
	}
	else txt += ("<i>ERROR: Access code disabled.</i>\n\nIt looks like Emmy’s had as much as she can take for right now. She’ll probably re-enable your access in a little while.");
	output2(txt);
	clearGhostMenu();
	addGhostButton(0, "Next", showCodexExtra);
}

//In-Room Bonus Notes
public function emmyBonusNotes():Boolean
{
	if(flags["EMMY_BANNED"] == 1)
	{
		showBust("EMMY");
		output("\n\nThe shopkeeper shoos you toward the door. She won’t even look you in the eye, and one of her fingers is poised above a call button should you make trouble. It’d be best to leave.");
		return false;
	}
	//First time
	if(flags["SEEN_EMMY"] == undefined)
	{
		output("\n\nA... jackal woman is lounging around the store in a skin-tight jumpsuit. You wouldn’t think it from way her large breasts and sizeable nipples strain at the fabric (or the ungainly-looking bulge at her crotch), but the KihaCorp logo on her shoulder marks her as the shopkeeper.");
		flags["SEEN_EMMY"] = 1;
	}
	//Repeat, don’t know name
	else if(flags["MET_EMMY"] == undefined)
	{
		output("\n\nThe same jackaless is sitting on the counter of her shop, passing the time between her customers. With her legs crossed and her buxom chest, she could almost pass for a pure female, but those powerful thighs can’t quite conceal the outline of a none-too-feminine bulge.");
	}
	//New Bonus Texts
	//Have not met Emmy with Harness
	else if(MailManager.isEntryUnlocked("emmy_harness_here") && flags["EMMY_QUEST"] == 5)
	{
		showBust("EMMY");
		output("\n\nEmmy is here, looking surprisingly calm as she stands behind the counter, but as soon as she sees you, her gaze turns smoky and her tongue slithers out to lick her lips. Her usual bulge was down to half its usual size, yet now it’s pushing up between her tits, making the pillowy jugs gently bounce. Someone is happy to see you.");
	}
	else if(flags["EMMY_QUEST"] >= 6)
	{
		showBust("EMMY");
		//Being cock massaged appearance
		if(emmy.hasStatusEffect("Massaging") || emmy.hasStatusEffect("Slow Fucking")) output("\n\nEmmy is slouched in a chair behind the counter with a faraway look in her eyes. Her cock is visibly pulsing, thumping itself against her tits, and while one of her hands is hidden from view, the other is lazily caressing a breast. Sometimes she looks your way, staring at your Codex, wondering when you’ll push the button that’ll take her to orgasm.");
		//PC set off Emmy’s toy a bunch recently.
		else if(emmy.bellyRating() >= 40)
		{
			output("\n\nLeaning heavily on the edge of her shop’s counter, Emmy is doubled over, clutching at her absolutely gravid-looking belly, muttering softly and quietly stroking her extraneous curvature. She doesn’t look in the mode for anything more than business. Maybe you should lay off the remote app for a bit and give her a break.");
		}
		//Chance of playing when PC enters the room.
		else if(!pc.hasStatusEffect("Emmy Special Delay") && rand(2) == 0 && flags["EMMY_SPECIAL"] == undefined)
		{
			output("\n\nEmmy is here, though instead of looking like an attentive shopkeeper, she’s down on all fours behind the counter, moaning like an ausar cock-addict in heat. She tries to straighten at the sound of the door opening and closing, but collapses once more as the pleasure robs her muscles of strength, pinning her doubtlessly ejaculating member between the floor and her own stomach. Wriggling and drooling, she cums for the better part of a minute, trying (and failing) to apologize for her state a number of times before rolling over and humping the empty air above, giving you a clear view of her grapefruit-sized knot and cum-paunched belly.");
			output("\n\n<i>“S-sorry about th... [pc.name]!? Oh thank the stars it was just you.”</i> Emmy’s ears straighten, any hint of apologetic look long gone. A knowing, slutty smile has crept into its place. <i>“I hope you enjoyed the show, but next time I’m not forgetting to lock the door!”</i> She jumps up onto her wobbling feet and moves back to the counter, occasionally casting meaningful looks your way. Seems like she could go for another round already.");
			pc.lust(10);
			flags["EMMY_SPECIAL"] = 1;
		}
		//Alt chance
		else if(!pc.hasStatusEffect("Emmy Special Delay") && flags["EMMY_SPECIAL"] == undefined)
		{
			output("\n\nEmmy is at her usual counter, only instead of waiting impassively for a customer to request assistance, she’s reconfigured the holographic sales terminals to display a perfect replication of a porn star’s posterior. The hermpahrodite’s cock is sticking straight into the insubstantial pussy, straining her jumpsuit almost to the breaking point, and she’s jerkily thrusting her hips back and forth.");
			output("\n\nLewd squelches can be heard from beneath the glossy, KihaCorp-branded fabric, evidence of Emmy’s hidden sex-toy simulating the sensation of plugging away at some nameless bitch. She hasn’t reacted to your entrance in the slightest - she’s too busy pounding the perfectly proportioned ass in front of her to pay attention to her periphery. With her breasts bouncing wildly, Emmy lets out a throaty scream of bliss and arches her back.");
			output("\n\nGlobules of what can only be her creamy seed appear at the tip of her cock, seemingly inflating her suit into a pseudo condom with every pulse of her lengthy ejaculation before the herm harness can pump it into the spunk-receptacle between her legs. She collapses into the middle of her tech-conjured fap-fuel by the third blast, mouth agape, drooling onto her codex. Her ass lifts up into the air, and with some small measure of delight, you watch bulges of cum vanish into the gap between her thighs.");
			output("\n\nWhistling softly, you rouse the spent hermaphrodite.");
			output("\n\n<i>“Mmm... [pc.name]... How’d you get in. I uh...”</i> She shudders quietly. <i>“I locked the door.”</i>");
			output("\n\nYou point out that she clearly didn’t.");
			output("\n\nEmmy looks like she wants to be ashamed but is too blissed out to care. <i>“Guess I better be more careful next time, huh?”</i> Straightening, her pussy audibly squelches around the dildo inside of her, probably packed with two or three more loads than any toy could hope to contain. <i>“J-just let me know if you need anything. Anything at all.”</i> She leans over the counter and raises an ass too heart-shaped to be natural, wagging her tail in your direction. <i>“Anything.”</i>");
			pc.lust(10);
			flags["EMMY_SPECIAL"] = 1;
		}
		//Normal Chance
		else
		{
			output("\n\nLooking perky and surprisingly sated, Emmy is busy at work, calibrating the various shop displays. Her tail wags happily behind her, and when she straightens, she’s wearing a lazy smile - the kind of just-fucked grin you’d expect to see on the patrons of a high-class pleasure den.");
		}
	}
	//Repeat, don't know name
	else
	{
		showBust("EMMY");
		output("\n\nGrinning from behind the countertop is the store’s KihaCorp representative, Emmy. The jackaless’s curvy form is just as you remembered it, shrink-wrapped into a skin-hugging jumpsuit that leaves nothing to the imagination. Her mixed genders are as obvious as the forearm-sized distention running from her crotch to her chest.");
	}
	if(flags["APPROACHED_EMMY"] == undefined) addButton(0,"Jackal",emmyFirstTimeApproach);
	else if(flags["MET_EMMY"] == undefined) addButton(0,"Jackal",emmyRepeatGreetings);
	else addButton(0,"Emmy",emmyRepeatWrapper);
	return false;
}

public function isMyrellionMorph(target:Creature):Boolean
{
	if(target == null) return false;
	var race:String = target.race();
	return (InCollection(race, ["myr", "nyrea", "gold myr", "red myr", "orange myr"]));
}

//First Time Approach
public function emmyFirstTimeApproach():void
{
	clearOutput();
	showEmmy();
	output("With a shrug, you amble on up to the excessively-endowed KihaCorp rep.");
	//Myr or Nyrea Race
	if(isMyrellionMorph(pc))
	{
		output("\n\n<i>“I’m sorry, but we’re not licensed to distribute weapons to state militaries, and due to the present conflict, any weapon distributed to a [pc.race] would undoubtedly find its way into military use.”</i> The jackaless sighs, dragging her fingers through her lush, black hair. <i>“Look, between you and me, I’d love to give you all the guns and shields you can carry, but rules are rules. There’s a lot I can get away with, but that would cost my job. Understand?”</i> She looks at you condescendingly, an eyebrow raised as if she expects you not to.");
		output("\n\n<i>“But... I’m not " + indefiniteArticle(pc.race()) + ",”</i> you try to explain.");
		output("\n\n<i>“Right,”</i> the buxom vendor growls, <i>“You just look exactly like one and are trying to buy advanced, core wares from the one shop on Myrrellion that sells them.”</i> One of her upraised ears flicks in annoyance. <i>“Look, even if Xenogen had finished transformatives for the natives here, they wouldn’t be on the market for a year or two still. Save us both some time and leave.”</i>");
		processTime(2);
		clearMenu();
		//[Codex Proof]
		addButton(0,"CodexProof",codexProofForEmmy,undefined,"CodexProof","You can probably prove your identity with your codex.");
		addButton(14,"Leave",leaveThisShit,undefined,"Leave","Fuck it. You don’t need to deal with this shit.");
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
	addButton(1,"Trade",tradeWivEmmy,undefined,"Trade","See if she’ll buy some of your old gear. You could use the extra credits.");
	if(emmy.hasStatusEffect("Massaging") || emmy.hasStatusEffect("Slow Fucking")) addDisabledButton(2,"Talk","Talk","Emmy couldn’t carry on much of a conversation right now.");
	else addButton(2,"Talk",talkToEmmy,undefined,"Talk","Ask her some questions about herself or the company.");
	if(flags["MET_EMMY"] == undefined) addDisabledButton(3,"SexRequest","SexRequest","You should probably figure out her name before trying to get into her pants.");
	else if(!pc.hasGenitals()) addDisabledButton(3,"SexRequest","SexRequest","You don’t even have genitalia.");
	else if(flags["EMMY_EMAIL_TIMER"] != undefined && !MailManager.isEntryViewed("emmy_apology")) addDisabledButton(3,"SexRequest","SexRequest","You tried that, and she pushed you away. For a huge flirt, she sure is an ice queen.");
	if(emmy.bellyRating() >= 40) addDisabledButton(3,"SexRequest","SexRequest","Emmy is wayyy too full for that.");
	else if(flags["EMMY_QUEST"] != undefined && flags["EMMY_QUEST"] >= 1) 
	{
		if(pc.lust() >= 33) addButton(3,"SexRequest",sexAttemptStart,undefined,"Sex Request","See if Emmy is up for some sex.");
		else addDisabledButton(3,"SexRequest","Sex Request","You aren’t aroused enough for this.");
	}
	else if(pc.lust() >= 33) addButton(3,"SexRequest",sexAttemptStart);
	else addDisabledButton(3,"SexRequest","SexRequest","You aren’t turned on enough for that.");
	//Flower overwrites
	if(flags["EMMY_QUEST"] == 0 && pc.hasItemByClass(VenusBloom)) 
	{
		if(pc.hasGenitals()) addButton(3,"GiveFlower",bringEmmyVenusBloom,undefined,"Give Flower","Give Emmy the flower you brought her.");
		else addDisabledButton(3,"GiveFlower","Give Flower","You should probably get some genitals before doing that...");
	}
	if(flags["EMMY_QUEST"] == 2) 
	{
		addButton(4,"Give Gem",giveEmmyAnItemMenu,undefined,"Give Gem","Give her a gem. She did request a gemstone, as you recall.");
	}
	//Didn’t Buy Harness At First - EMMY_QUEST == 4
	//Add a button to her main menu [Herm Harness]
	if(flags["EMMY_QUEST"] == 4) addButton(5,"Herm Harness",hermHarnessEmmyTalkUnbought,undefined,"Herm Harness","Talk to Emmy about the Herm Harness she wants to get again.");
	if(emmy.bellyRating() >= 40) addButton(5,"Vent Cum?",pushOutTheCumDummy,undefined,"Vent Cum?","Ask Emmy why she doesn’t just go push it out in the bathroom.");
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
	addButton(14,"Leave",leaveThisShit,undefined,"Leave","Fuck it. You don’t need to deal with this shit.");
}

//Fuck this store.
public function leaveThisShit():void
{
	clearOutput();
	showName("FUCK\nTHIS STORE");
	output("You wave off the too-sexual shopkeep and walk out the door rather than deal with another second of her rudeness.");
	//move location.
	currentLocation = "607";
	generateMapForLocation(currentLocation);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}	

public function emmyRepeatWrapper():void
{
	if(MailManager.isEntryViewed("emmy_implant_explain_email") && flags["EMMY_QUEST"] == 3) 
	{
		seeEmmyAfterImplantConfessionEmail();
		return;
	}
	if(MailManager.isEntryUnlocked("emmy_harness_here") && flags["EMMY_QUEST"] == 5)
	{
		emmyGotHarnessReaction();
		return;
	}
	if(isMyrellionMorph(pc) && (flags["EMMY_QUEST"] < 3 || flags["EMMY_QUEST"] == undefined))
	{
		emmyFirstTimeApproach();
		return;
	}
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
	if(isMyrellionMorph(pc) && (flags["EMMY_QUEST"] < 3 || flags["EMMY_QUEST"] == undefined))
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
	//Emmy post-herm harness
	else if(flags["EMMY_QUEST"] == 6)
	{
		//Approach cock massaged/slow fucked Emmy
		if(emmy.hasStatusEffect("Massaging") || emmy.hasStatusEffect("Slow Fucking")) output("<i>“Heyyyy there, [pc.name],”</i> Emmy slurs, straightening somewhat. <i>“You’re not making my job any easier, you know.”</i> She arches her back, thrusting her breasts at you. <i>“See anything you want to take home?”</i>");
		//Approach gravid Emmy
		else if(emmy.bellyRating() >= 40)
		{
			output("Emmy jerks her head your way when you approach, but before you can phrase your request, she lifts a finger, shushing you. An infinity later, she lets out a uvula-rattling belch, and slumps back, groaning. <i>“I feel like a balloon, [pc.name]. If you wanna buy something, be my guest, but don’t expect anything off until I’ve had a chance to recover.”</i>");
		}
		else
		{
			output("You walk up to Emmy, noting the way her eyes light up at the sight of you. Her hand drift beneath the bottommost edge of the counter, cupping balls that seem a touch too weighty for how often their owner must be draining them. She licks her lips, polishing the obsidian pillows to a mirror sheen and asks, <i>“What can I do for my");
			if(pc.hasStatusEffect("Cum Soaked")) output(" spunk-dump of a [pc.boyGirl]friend? Want me to top you off? You’d look good with a fresh layer across that pretty face.”</i>");
			else if(pc.isBimbo() && rand(4) == 0) output(" favorite intergalactic bimbo-slut? Did you need to stock up on vitamin E before you go on your next adventure?");
			else if(pc.isBro() && pc.isTreated() && rand(4) == 0) output(" favorite [pc.boyGirl] friend? Have I ever told you how fucking good you smell?”</i> She sniffs. <i>“One whiff and my cunt practically starts creaming itself. Can I... can I sniff your crotch? If you don’t want to buy anything. Or after. Whatever.”</i>");
			else if(pc.hasVagina() && rand(5) == 0) output(" dream date?”</i> She giggles as her cock climbs toward her tits like a python hunting its prey. <i>“I’ve been trying to get the Herm Harness to be more like you, but none of the options feel right. Could you let me fuck you before you leave? If you’re not too busy?”</i> She bites a lip idly strokes her nipple. <i>“And then fuck me again? Just to be sure?”</i>");
			else if(pc.isNude() && rand(2) == 0) output(" favorite piece of eye-candy?”</i> Her cock thickens perceptibly, jutting angrily in your direction. <i>“One of these times I should get you to dance for me. Or dance with me... naked.”</i> She’s casually groping one tit as she vigorously eye-humps your nude form. <i>“So... did you come here to tease me, or did you want to buy something? You’ve got access to my buttons if you want to start pushing them, you know.”</i>");
			else if(rand(3) == 0) output(" " + pc.mf("handsome","scrumptious-looking") + " [pc.boyGirl]friend? Did you want to fuck? I’ve been practicing trying to squeeze out bigger loads for you, just in case you wanted a model with a larger magazine.”</i>");
			else if(rand(2) == 0) output(" lovely [pc.boyGirl]? I made sure everything was in stock a little bit ago, and I mean everything.”</i> She crudely cups her balls through the too-thin jumpsuit and moans.");
			else output(" amazing [pc.boyGirl]friend? I’m so glad you came back. I’ve missed you. Did you wanna snuggle or just check out my hardware? Or both? After the rush, we should see which one of us can shoot better mid-orgasm.”</i> A cocky grin spreads across her canine muzzle. <i>“Spoiler alert: me!”</i>");
		}
	}
	//Normal variant for PCs who know her.
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
		output("You walk up to Emmy, openly ogling her this time - she did send you an email inviting you back for an ‘oral apology.’");
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
	output(" smiles coyly and paces between holograms of a huge-barreled laser weapon and a hammer that crackles with phantom electricity. <i>“Well, what now?”</i>");
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
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined)
	{
		output("\n\nGrinning, Emmy leads you to the side of the counter and places your hand on her hip. It’s warm. <i>“But you already know me in the biblical sense, don’t you?”</i> She drags your hand up her side to a breast, forcing you to squeeze it. <i>“These breasts...”</i> Her forced grope transitions to the bulging jackal-meat stuffed between her tits, subjecting you hot and heavy thud of her heartbeat through her prick’s many veins. <i>“...this dick...”</i> In short order, you’re cupping her balls and pressing your fingertips into the divot behind. <i>“...and this sopping-wet cunt.”</i>");
		output("\n\n<i>“Emmy...”</i> you sigh, <i>“I really want to ask you something.”</i>");
		output("\n\nPouting, the slutty, oversexed hermaphrodite whines, <i>“Okay, okay. Anything you want, sugar-buns.”</i>");
		pc.lust(5);
	}
	else
	{
		output("\n\nGrinning, ");
		if(flags["MET_EMMY"] != undefined) output("Emmy");
		else output("the shrink-wrapped rep");
		output(" leads you to the side of the counter and answers, <i>“I’m always happy to help our shoppers sate their curiosity. Tell me, is there something you’d like a closer look at?”</i> She stands almost uncomfortably close to you");
		if(pc.tallness < 55) output(", her bulging cock at eye-level.");
		else if(pc.tallness < 72) output(", her bulging breasts at eye level.");
		else output(", her bulging breasts jutting out so powerfully that they obscure your view of the rest of her shapely form.");
		output("\n\nWhat did you want to ask her about?");
	}
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
	if(arg != askEmmyAboutEmmy) addButton(4,"You",askEmmyAboutEmmy,undefined,"You","Ask her about herself. She’s quite the mystery.");
	else addDisabledButton(4,"You","You","You just asked that!");
	if(arg != emmyImplantFurtherDiscussion)
	{
		if(flags["EMMY_QUEST"] >= 5 && flags["EMMY_QUEST"] != undefined) addButton(5,"Implant",emmyImplantFurtherDiscussion,undefined,"Implant","She mentioned a libido-enhancing implant in her email. Maybe you could get some more information on it.");
		else addDisabledGhostButton(5,"Locked","Locked","You don’t know her well enough for this topic!");
	}
	else addDisabledGhostButton(5,"Implant","Implant","You just asked her about her implant!");
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
	addButton(0,"General",kihaCorpGeneral,undefined,"General","You’d like to know more about the company in general - the high points.");
	addButton(1,"Doing Well?",askEmmyIfKihaCorpIsDoingWell,undefined,"Doing Well?","You’d like to know how the company is performing.");
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
	output(" replies, <i>“Not much for the details, eh? ");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("Can’t say I blame you. There’s far more entertaining things we could be doing with our time...”</i> She idly strokes her dick while she thinks, drumming her fingers on the turgid pole.");
	else output("Guess you must be more of a big picture type. Alright... where to start...”</i> She rubs thoughtfully at her jaw, drumming her other hand idly on the machined surface of her store’s countertop.");
	output(" Her eyes light up a moment later, and she starts in, <i>“I guess I’d best cover how they got so big in the first place. It’s as good a starting point as any.”</i>");
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
	addButton(1,"Enough",emmyEnough,undefined,"Enough","It’s time for a change of topic.");
	addButton(0,"Listen",listenToEmmyRamble,undefined,"Listen","You’d like to hear the rest of what she has to say.")
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
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("\n\n muses. <i>“Did you have any other hot and pressing concerns that need addressed? I hear that regular orgasms are good for you, you know... and good for healthy relationships too.”</i> She hops up onto the counter and lets her knees drift apart, highlighting balls big enough to be oranges. <i>“You can touch, or we can talk and then touch... or I guess just talk.”</i>");
	else output(" muses. <i>“Did you have any other concerns that needed addressing?”</i> She hops up onto the edge of the counter and leans back, showing off a half-hard bulge big enough to shame most ausar. <i>“Anything you wanted a look at?”</i>");
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
	output(" shrugs noncommittally, her breasts jostling each other inside her jumpsuit like overfilled waterballoons in a cargo hold. <i>“Nah. How the fuck would I know anything about something like that? I’m about as low on the totem pole as you can get without having a mouthful of dirt. Nobody tells me anything, so all I’ve got to go on are my hunches and storylines from daytime holo-dramas.”</i> Hopping back up onto the edge of the counter, she resumes idly swinging her feet. <i>“Got any more questions?”</i>");
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
	if(flags["EMMY_EMAIL_TIMER"] != undefined && flags["EMMY_APOLOGIZED"] == undefined) addDisabledButton(2,"You","You know all too well that this won’t go anywhere.");
	else if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) addButton(2,"You",sexAttemptStart,undefined,"You","Try to get into her pants - not that it’s all that hard any more.");
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
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("pouts and languidly rolls her shoulders. <i>“Well, I guess we can talk about something else...”</i>");
	else output(" pouts when she hears that, then shrugs. <i>“Well, you wanna talk about something else then?”</i>");
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
	output(" pushes a jumpsuit-enclosed clawtip against the center of your chest hard enough to push you back a half step. Fortunately, the potentially dangerous digit was rounded off to a nub - probably to keep from tearing her shining, full-body uniform. <i>“Don’t doubt it, " + pc.mf("buster", pc.catDog("lady", "bitch", false)) + ".");
	if(pc.tone < 30 && pc.tallness < 72) output(" Say, why are you even asking about this stuff? You don’t really have the build to be mixing it up in melee, ya know?”</i>");
	else if(pc.tone >= 75) output(" Say, you are pretty muscly, aren’t you? I bet you don’t even have to swing a weapon to scare off a few ruffians, do you?”</i> She purrs - a louder, deeper sound than you’d hear from a kaithrit and strokes your arm.");
	else output(" Say, are you really planning to fight up close? It seems risky.”</i>");

	//Nonmuscle versions
	if(pc.tone < 75)
	{
		output("\n\n");
		if(pc.isBimbo()) output("<i>“But they’re so pretty!”</i>");
		else if(pc.isBro()) 
		{
			output("You grunt in displeasure at her evaluation of your strength. ");
			if(pc.isTreated()) output("Just because you don’t have show muscles doesn’t mean you couldn’t single-handedly until a field.");
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
	output(" shrugs, <i>“The point is, JoyCo shields protect your body about as well as a small condom would protect ");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined)
	{
		if(pc.hasVagina()) output("your womb");
		else output("your asshole");
		output(".”</i>");
	}
	else output("my partner’s wombs.”</i>");
	output("\n\n");
	if(pc.isBimbo()) 
	{
		output("Yeah, she’d totally bust a hole in anything she tried to stretch over that mammoth. Then all that yummy cum could squirt and gush wherever it wanted! You resolve to make sure she gets like, totally inside you ");
		if(flags["EMMY_FUCKED"] != undefined) output("whenever you fuck next");
		else output("if you ever fuck her");
		output(". To think of all the cum that could be wasted!");
	}
	else output("You can’t help but glance down at the foot of half-hard cock in her jumpsuit and wonder how the hell she made it through her interview process. Her overt sexuality could make a rahn blush.");
	output("\n\n<i>“So, are you ready to make a purchase, or did you need a personal demonstration?”</i> You look back up just in time to see a thick tongue licking at her onyx lips.");
	processTime(6);
	clearMenu();
	addButton(0,"Purchase",buyFromEmmy);
	addButton(1,"Talk More",nahEmmyDontSeeShit);
	if(flags["EMMY_EMAIL_TIMER"] != undefined && flags["EMMY_APOLOGIZED"] == undefined) addDisabledButton(2,"Demonstration","You know all too well that this won’t go anywhere.");
	else addButton(2,"Demonstration",sexAttemptStart,false,"Demonstration","If she’s offering some hands-on sex... sure.");

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
		output("\n\nThe jackal-woman fidgets and says, <i>“That’s not important right now. What is important is... uh... getting you the right equipment for your adventures. So, what will you be buying?”</i>");
		//Reskin menu and go to shop interface
		processTime(1);
		emmyMainMenu();
		return;
	}
	//Known enough
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined)
	{
		output("\n\nThe jackaless squirms and sighs. <i>“You know how I feel about my name, but I guess I can explain it to you again, if you really want to hear it once more.”</i>");
		output("\n\nYou do.");
		output("\n\nThe shop-slut sighs and marvels at you. <i>“You really are something else. Well, you remember how I made you swear not to tell anyone about this?”</i>");
		output("\n\nYou nod.");
		output("\n\n<i>“I ditched it.”</i> Emmy casts a furtive glance in the direction of the automatic door, and satisfied that it’s still sealed, she explains. <i>“We’re not supposed to be working without a name tag, but I couldn’t stand sitting there, broadcasting my awful, awful name, letting everyone know that I’m really just some ausar.”</i>");
	}
	else
	{
		output("\n\nThe jackaless squirms uncomfortably before leaning in close. <i>“Normally I wouldn’t tell anyone this... You have to promise not to repeat this to anyone, okay? The higher ups wouldn’t like it.”</i>");
		output("\n\nYou do");
		if(pc.isAss()) output(", though you’ll break it in a heartbeat if you think you need to");
		output(".");
		output("\n\nThe shop-girl sighs, <i>“Good. I knew I could trust you.”</i> She furtively casts her gaze at the automatic door, and satisfied that it’s still sealed, she explains, <i>“I removed it. We’re not supposed to, but I couldn’t stand it sitting there, broadcasting to every single customer that I’m actually an ausar.”</i>");
	}
	output("\n\nQuirking an eyebrow in response, you ask, <i>“How would a nametag do that? Does it have a field for species on there or something?”</i>");
	output("\n\n<i>“No, you don’t get it!”</i> she cries, slapping a palm down on the counter. <i>“My name! Its common on Ausaril and on most ausar colonies. Ever since that ‘Bones of Ypsilon Station’ show was on the air a few decades back, the name took off in popularity, and now anyone who knows anything about the rest of the galaxy knows that I started out as an ausar when they see it.”</i>");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined)
	{
		output("\n\n<i>“Come on, Emmy. It’s cute!”</i> you cajole. <i>“It’s part of you, and I like you.”</i>");
		output("\n\nYou didn’t know it was possible for a jackal’s to blush through her fur. <i>“It’s Emmata, but please, just keep calling me Emmy. Or slut, even. Just not Emmata.”</i>");
	}
	else
	{
		output("\n\n<i>“So what am I supposed to call you?”</i> you ask. <i>“‘Hey you’ doesn’t have a very good ring to it, and a name would make it a lot easier to talk. I’ll even tell you mine; I’m [pc.name].”</i>");
		output("\n\nYou didn’t know it was possible for a jackal’s (or ausar’s) ears to sink so low. <i>“It’s Emmata, but please, just call me Emmy. It’s what all my friends call me.”</i>");
	}
	output("\n\nShaking your head, you explain that you still don’t understand why she doesn’t want to be known as a former ausar.");
	output("\n\n<i>“Because the moment I started modding myself to look how I really wanted to look, instead of just changing my dick or something, they cast me out. My old friends avoided me and spread rumors behind my back. My parents still said they loved me, but they never seemed to want to go anywhere public with me. It broke my heart.”</i> Emmy balls up her fists as she fights back tears and struggles to compose herself.");
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
		addDisabledButton(0,"You","You","Looks like she’s not fishing for compliments right now.");
		addDisabledButton(1,"Your Dick","Your Dick","Looks like she’s not fishing for compliments right now.");
		addDisabledButton(2,"Your Tits","Your Tits","Looks like she’s not fishing for compliments right now.");
	}
	else
	{
		addButton(0,"You",tellEmmyShesTheBelleOfTheBalls,undefined,"You","Tell her that she’s the prettiest by far.")
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
	output(" She slathers your cheek with an unashamedly enthusiastic lick and roughly gropes at your [pc.butt]");
	if(pc.tailCount > 0) output(", gently stroking the base of your tail with a rogue index finger");
	else if(pc.buttRating() >= 6) output(", digging her fingers into your cheeks with such gusto that you momentarily worry she’ll slip a finger in between");
	else output(", squeezing the pert flesh on offer");
	output(". She is pulling you so tight that her enormous prick");
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
	else output(" is audibly grinding against your [pc.armor], so powerfully erect that the hammerblows of her heartbeat nearly tug it out of place from your gear.");
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

/*
public function emmyMailGet():void
{
	AddLogEvent("<b>New Email From Emmy Astarte (emmy_astarte@cmail.com)!</b>", "passive");

	MailManager.unlockEntry("emmy_apology", GetGameTimestamp());
}
*/

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
		if(flags["MET_EMMY"] != undefined) output(", [pc.name]");
		output(".”</i> ");
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
		output(" That’d be fair recompense for [pc.hisHer]’s efforts.”</i>");
		if(flags["MET_EMMY"] == undefined)
		{
			output(" Emmy grins. <i>“But if I’m going to have a [pc.boy]friend, I should really know [pc.hisHer] name. Mine’s Emmy. What’s yours, hot stuff?”</i>");
			output("\n\n<i>“[pc.fullName],”</i> you answer.");
			output("\n\n<i>“Oooh, I like. See? I knew you were [pc.boy]friend material. Now just do me that one </i>little<i> favor, maybe we can have a celebration.”</i> Emmy’s purr leaves very little the intended celebration to the imagination.");
			flags["MET_EMMY"] = 1;
		}
		output("\n\nHot damn... you better go find some flowers.");
		if(pc.hasCock()) output(" You shift your still-hard bulge and agree to find her a flower.");
		else if(pc.hasVagina())
		{
			output(" You shift nervously, your engorged lips rubbing sinfully against one another, and try not leak any moisture down your [pc.thighs].");
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
		if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined)
		{
			if(emmy.hasStatusEffect("Massaging") || emmy.hasStatusEffect("Slow Fucking")) output("Emmy groans as the Herm Harness continues to work it’s magic, wringing big, sloppy bubbles of pre-cum out of her cock and pumping them right back around into her twat. She doesn’t even realize you want to do something sexual until you speak up, and once she does, she’s all but begging you. <i>“Yesss, fuck me, [pc.name]. Fuck me so fucking hard.”</i>");
			else if(emmy.bellyRating() >= 20) output("Emmy smiles once she discovers your intent. <i>“You do realize that I’ve got a bunch of jackal-spunk sloshing around in here, don’t you? All that jizz you made me shoot into myself with this perverted little toy.... It feels so good.”</i> She rubs her belly and moans, <i>“What do you want to do? Anything seems fun.”</i>");
			else if(rand(2) == 0) output("Emmy knowingly smiles once she divines the intent behind your look. <i>“Need to blow off a little steam, [pc.name]? I understand. Sometimes you see someone so hot... so delectable that you just can’t help it”</i> Her finger traces slow circles around a lewdly jutting nipple. <i>“What should we do?”</i>");
			else output("Emmy blushes and covers her mouth <i>“Oh, is this a booty call?”</i> She grabs hold of her tits and squeezes, thrusting her brazenly-displayed nipples in your direction. <i>“Fuck I need this. Come here, baby.”</i>");
		}
		else
		{
			output("Emmy’s eyes flutter low once she realizes your intent. <i>“Does someone need a little relief?”</i>\n\nThe ");
			if(rand(2) == 0) output("bulge in her jumpsuit authoritatively declares her to be the one in need of relief.");
			else output("way her nipples jut through the thin fabric of her jumpsuit, you wager she’s referring to herself.");
		}
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

public function venusFlowerDrops():Boolean
{
	return (flags["EMMY_QUEST"] == 0 || flags["ENABLE_LYS_FLOWER"] != undefined);
}

//Venus Pitcher Post Sex or Avoidance
public function venusPitcherBonusFlower():void
{
	clearOutput();
	showName("AN EXOTIC\nFLOWER!");
	showBust("");
	if(flags["EMMY_QUEST"] == 0)
	{
		output("Ever since Emmy asked you for an exotic flower, you’ve kept your eyes open for a good one, and now there’s one laying on the ground right in front of you! The venus pitcher must have shed this one in her hurry to escape underground, leaving a pink and purple bloom that’s sure to dazzle the eye and delight the nostrils. You even sniff it a few times to make sure it doesn’t have any of that sneezy pollen that clouds the air around the plant-women.");
		if(venusSubmission() >= 40) output(" Sadly, it doesn’t.");
	}
	else
	{
		output("Oh hey, there’s a particularly pretty bloom left on the ground, dazzlingly purple and pink. Better yet, it smells delightful. Maybe Lys will");
		if(pc.isBimbo()) output(", like,");
		output(" appreciate it.");
	}
	//Acquire bloom
	output("\n\n");
	clearMenu();
	addButton(0, "Take It", quickLoot, new VenusBloom());
	addButton(1, "Leave It", mainGameMenu);
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
	pc.destroyItemByClass(VenusBloom);
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
	addButton(2,"Negative",negativeEmmy,undefined,"Negative","You just did this for a little oral - you didn’t want any strings attached. You’ll sound a bit like a dick...");
	addButton(1,"Polyamorous",polyamorousEmmy,undefined,"Polyamorous","Let her know that you tend to have more than one lover - you hope she can handle it.");
	addButton(0,"Pleased",emmyPleased,undefined,"Pleased","Let her know that you’re pleased to be her [pc.boy]friend.");
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
	output("\n\nStraining at the front of her jumpsuit, the jackaless’s swelling boner threatens to rip its way to freedom. Her tongue lolls out in a lusty pant, and Emmy coos, <i>“You... you are special. No wonder you’ve got so many lovers.”</i> She wiggles closer, barely keeping her hands away from her tenting nipples and rigid, canine phallus. <i>“Let me thank you for the flower... and your honesty.”</i>");
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
	output("\n\nThe jackal gasps and claps her hands over her snout. If you could see through her fur, you’re sure her skin would be blushed crimson. <i>“I didn’t... I was joking! I promise I’m in control of myself. I turned you down at first, didn’t I? And even though you’re my [pc.boy]friend, that doesn’t mean I’m going to start whipping my dick out around you or anything. We need to know each other a little bit better before something like that happens - I’m not going to be a huge slut just because we’ve started something.”</i> She puts her hands down on the countertop and stares at her nervously tapping fingertips. <i>“I’m rambling aren’t I?”</i>");
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
/*
public function emmyMailGet2():void
{
	AddLogEvent("<b>New Email From Emmy Astarte (emmy_astarte@cmail.com)!</b>", "passive");
	MailManager.unlockEntry("emmy_gift_starter", GetGameTimestamp());
}
public function emmyMailGet3():void
{
	AddLogEvent("<b>New Email From Emmy Astarte (emmy_astarte@cmail.com)!</b>", "passive");
	MailManager.unlockEntry("emmy_implant_explain_email", GetGameTimestamp());
}
public function emmyMailGet4():void
{
	AddLogEvent("<b>New Email From Emmy Astarte (emmy_astarte@cmail.com)!</b>", "passive");
	MailManager.unlockEntry("emmy_harness_here", GetGameTimestamp());
}
*/

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

	output("\n\nYour head is spinning, and you’d like nothing better than to bed Emmy right here and now. Still, it sounds like she wants you to tend to her for a change. <i>“...what?”</i> you pant, confused.");

	output("\n\nThe seemingly ravenous jackaless gradually masters her ardor, separating herself from you a finger at a time. <i>“Sorry, I just get so... so sex-crazy around you. You have no idea how badly I want you here. At all hours of the day, I’m just lounging around the shop and wishing you’d suck me off, tongue my pussy until your face is all shiny and I’m painting my tits white. Or that you’d just fondle me through the suit and make me work the rest of the day, soaking in my own cum, ya know?”</i>");

	output("\n\nThat sounds... ");
	if(pc.isBro() || pc.isBimbo() || pc.libido() >= 75) output("awesome");
	else output("hard to deal with");
	output(". <i>“Wow.”</i>");
	output("\n\nThe lusty jackaless yanks her hand away from a bulging nipple. <i>“Uhm... yeah, but I want to be sure that we’re right for each other before I risk it. If a little midday relief turns me into a sex-crazed nympho slut, I need to know that I have someone who won’t get bored with me just because I’ve become an insatiable minx.”</i> She crosses her legs. <i>“I hope that makes sense.”</i>");
	output("\n\nIt does. After all that groping, you’d prefer a little relief yourself. <i>“Yeah.”</i>");
	output("\n\nNodding, Emmy replies, <i>“Great. Just... awesome. So here’s what I was thinking: we could get each other gifts. Since you’re a great adventurer, you could find me a pretty rock down there while you’re exploring. I hear they’re expensive, and I know the stuff down there is no joke. If you’d put up with all that hassle for me, I’d feel a little safer risking my job and my restraint for some not-too-slutty fun.”</i>");
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
	if(pc.hasItemByClass(Kirkite)) addButton(0,"Kirkite",giveEmmyAnItem,"Kirkite","Kirkite","Give Emmy a piece of Kirkite.");
	else addDisabledButton(0,"Kirkite","Kirkite","You don’t have any Kirkite.");
	if(pc.hasItemByClass(Satyrite)) addButton(1,"Satyrite",giveEmmyAnItem,"Satyrite","Satyrite","Give Emmy a piece of Satyrite.");
	else addDisabledButton(1,"Satyrite","Satyrite","You don’t have any Satyrite.");
	if(pc.hasItemByClass(Picardine)) addButton(2,"Picardine",giveEmmyAnItem,"Picardine","Picardine","Give Emmy a piece of Picardine.");
	else addDisabledButton(2,"Picardine","Picardine","You don’t have any Picardine.");
	if(pc.hasItemByClass(CrystalShard))
	{
		if(flags["EMMY_GIVEN_SHARD"] == 1)
		{
			if(!pc.hasItemByClass(CrystalShard,10)) addDisabledButton(3,"C.Shard x10","Crystal Shard x10","Emmy requested you bring her ten of these. You’d better go hunting for more.");
			else addButton(3,"C.Shard x10",giveEmmyAnItem,"Crystal Shard","Crystal Shard x10","Give Emmy the ten Crystal Shards she requested.");
		}
		else addButton(3,"C.Shard",giveEmmyAnItem,"Crystal Shard","Crystal Shard","Give Emmy a Crystal Shard. It’s not quite the kind of gemstone she’s looking for, but it might be fun to watch...");
	}
	else addDisabledButton(3,"C.Shard","Crystal Shard","You don’t have any Crystal Shards.");
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
			pc.destroyItemByClass(CrystalShard);
			currentLocation = "607";
			generateMapForLocation(currentLocation);
			showLocationName();
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
			output("\n\nShe shoos you away kindly and snaps a lid onto the package, then sighs like a bomb has been disarmed. With the shipment prepared, the weapon seller turns to a drawer and opens it up. <i>“Crazy how no matter how much we know, there’s always something else out there waiting to surprise us. If I hadn’t met you, I never would’ve gotten tipped off to the gold mine just below Myrellion’s surface, and I damn sure wouldn’t be so happy about the idea of parting with this beaut. Here it is!”</i>\n\nShe slams the drawer closed with a heavy ‘thunk’ and straightens, balancing an expensive-looking weapon in front of the bullets of her nipples. <i>“");
			// insert weapon collecting blurb here once weapons are chosen
			//go to ‘merge’
			//reward weapon should reflect a total cost of 4950 credits (1 demo shard plus 10 shards for the mail @ 450 ea)
			if(rand(3) == 0)
			{
				if(getRanged) 
				{
					output("You’ve probably seen the Salamander Pistols we stock, but this beaut is special. I fitted it with a smart-linked scope system that’ll interface with damn near any optical interface, even one of those fancy microsurgeon-based immune systems. You’ll be hard-pressed to find a more accurate pistol.");
					emmyLoot = new EmmysSalamanderPistol();
				}
				else 
				{
					output("You’ve probably seen the Lava Sabers we stock, but this beaut is special. I fitted the crossguard with miniaturized shield generators. They should supplement your shield belt’s defenses enough to give you an edge.");
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
					output("I managed to get the whole blade replaced with one that had a more robust induction lattice. It’s not quite as strong as a retail model, but it can drain shields faster than I drain " + (pc.hasCock() ? "your" : "my") + " dick.");
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
			pc.destroyItemByClass(CrystalShard, 10);
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
		output("\n\n<i>“Kirkite, huh?”</i> Emmy rolls sparkling gemstone between two claw-tipped fingers. <i>“This stuff is actually pretty rare around Ausaril and Terra, but with every new rush, it gets a little more common. Weird how the farther we get from the core, the more deposits we find.”</i> She smiles mischievously spins around, tail wagging beneath your nose. <i>“You’re lucky I’m not a thraggen or I probably wouldn’t have accepted it. I hear their planet is so rich in the stuff that they used to throw it away, back before they realized they could export it for a quick " + (isAprilFools() ? "coin" : "credit") + ".”</i>");
		output("\n\n<i>“Really?”</i>");
		output("\n\nEmmy’s bends over to a storage compartment, her hips wiggling. <i>“Nuts isn’t it? We don’t even know how lucky we are until we can get to know someone else and gain a little perspective. Life’s funny like that. Ah! Here it is!”</i> She slams the drawer closed with a heavy ‘thunk’ and straightens, balancing an expensive-looking weapon in front of the bullets of her nipples. <i>“");
		if(getRanged) 
		{
			output("You’ve probably seen the Salamander Pistols we stock, but this beaut is special. I fitted it with a smart-linked scope system that’ll interface with damn near any optical interface, even one of those fancy microsurgeon-based immune systems. You’ll be hard-pressed to find a more accurate pistol.");
			emmyLoot = new EmmysSalamanderPistol();
		}
		else 
		{
			output("You’ve probably seen the Lava Sabers we stock, but this beaut is special. I fitted the crossguard with miniaturized shield generators. They should supplement your shield belt’s defenses enough to give you an edge.");
			emmyLoot = new EmmysLavaSaber();
		}
		output("”</i>");
		pc.destroyItemByClass(Kirkite);
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
		pc.destroyItemByClass(Satyrite);
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
			output("I managed to get the whole blade replaced with one that had a more robust induction lattice. It’s not quite as strong as a retail model, but it can drain shields faster than I drain " + (pc.hasCock() ? "your" : "my") + " dick.");
			emmyLoot = new EmmysVampBlade();
		}
		else {
			output("I really suped this one up. I swapped the barrel out for a wider one, but only because I also sprung for a better emitter and focusing crystals. I suppose I could’ve tried to tighten up the beam a little more, but I figure you’re going to want to put energy into the target, not burn a pin-sized hole through it. Just don’t waste it on any crystalline beings.");
			emmyLoot = new EmmysSalamanderRifle2();
		}
		output("”</i>");
		pc.destroyItemByClass(Picardine);
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

//Seeing Her
//Admits she wants to fuck you like crazy and wants to be in a serious relationship but knows she can’t due to your jobs.
//Gets more and more horny throughout the conversation.
//Doesn’t think she’ll be able to avoid fucking a ton once she starts.
//Gives PC the choice of bringing her a high-powered herm harness and fucking or waiting.
//If waiting, change her greetings and add options to bring her the harness.
//Pre-req: emmy_implant_explain_email
public function seeEmmyAfterImplantConfessionEmail():void
{
	clearOutput();
	showEmmy();
	//Herms get shorted!
	if(!pc.hasGenitals())
	{
		output("Emmy looks you up and down, about to speak, but her face screws up at the last second. <i>“You know what... maybe we can have this conversation after you get ahold of some proper genitals. No point in figuring out how to fuck if you don’t got the equipment for it, huh?”</i> She sticks her tongue out then adds, <i>“Wanna buy something that’ll fuck your enemies?”</i>");
		emmyMainMenu();
		return;
	}
	flags["EMMY_QUEST"] = 4;
	output("<i>“I should’ve known that once the prospect of actual sex was on the table, you’d find your way back here.”</i> Emmy gives you a playful punch on the shoulder, then pulls you into a hug, crushing her breasts ");
	if(pc.biggestTitSize() < 1) output("against you");
	else output("against your own");
	if(pc.bRows() > 1 && pc.biggestTitSize() >= 1) output(" while her suit-stretching erection nestles between your lowest pair");
	output(". <i>“You ");
	var race:String = pc.race();
	if(pc.catDog("nyan", "bork", false) == "bork") output("horn-dog");
	else if(race == "centaur") output(pc.mf("stallion","slutty mare"));
	else if(pc.tallness < 55) output("little sex adventurer");
	else if(pc.tallness >= 75 && pc.PQ() >= 75) output("big, strong fuck machine");
	else output(pc.mf("horny bastard","horny bitch"));
	output("... I missed you.”</i> You feel her nose nuzzle your neck and the sharp inhale as she drinks in your scent. <i>“Mmm, I did have something to talk about before someone sexy walked in and distracted me, didn’t I?”</i> Her cock throbs against your [pc.belly].");

	output("\n\n<i>“You did.”</i> You pat her pulsating length and gently push her away, barely suppressing a grin when her hips lurch to rub the barely-hidden booster rocket against your palm.");

	output("\n\nAlmost reluctantly, the excessively endowed shop-jackal steps back, struggling not to pant. <i>“I... uh... uhm... I’m getting worse, I guess, [pc.name]. I don’t think fooling around with you has helped any, not that it matters when you jack off as much as I do. Either the implant is wearing down my willpower or it actually does cause libido spikes when it’s set this high.”</i> She leans back against the counter and glares at her cock, perhaps wishing that her withering gaze could make the rebellious organ cease broadcasting its torrid demands.");
	output("\n\nYou offer, <i>“Your message said something about having ideas?”</i>");
	output("\n\n<i>“Right.”</i> Emmy fidgets, digging a blunted clawtip into her collar and nervously tugging at it. <i>“I don’t want to be the slut this thing is turning me into, but you... you’re the one bearable part in this whole situation. I don’t mind acting like a depraved sex-junkie quite so much when I’m with you, because it’s not just about the sex. There’s a deeper connection at work. The sex is just one way to show how I feel about you.”</i> Her tail swishes nervously behind her, the only physical evidence of the crimson blush hiding behind her glossy fur.");
	output("\n\nNodding, you try to guide her back on topic. <i>“And?”</i>");
	output("\n\nWords spill out of the half-distracted jackaless’s mouth in a rush. <i>“And I guess what I’m saying is that I think it’d best for both of us, and my sanity, if we could start fucking.”</i> Her eyes flick down, then back up to yours, full of anxiousness. <i>“Like all the time.”</i>");
	processTime(7);
	clearMenu();
	addButton(0,"Next",emmyAfterConfessionEmail2);
}

public function emmyAfterConfessionEmail2():void
{
	clearOutput();
	showEmmy();
	output("It’s not every day a girl - or herm - asks you to fuck her into a quivering puddle of nymphomaniac. <i>“");
	if(pc.isBro()) output("You sure?");
	else if(pc.isBimbo()) output("Like, you sure about this, hun?");
	else if(pc.isNice()) output("Are you sure?");
	else if(pc.isMischievous()) output("Sure you can handle me?");
	else output("Really?");
	output("”</i>");

	output("\n\nSquirming behind the counter, Emmy struggles to keep from stroking her cock. From time to time, you see a bead-sized bubble appear at its swollen tip, then vanish as it wicks into her fur. <i>“Yeah.”</i> She smiles saucily and circles a nipple with her claw, shuddering briefly. <i>“Yeah... but... but not yet. You won’t be here all the time. You’re a rusher. Your destiny is painted all over the stars, and you’ve got to seize it. Seize it with both hands and pound it like an ausar in heat, make her get all drooly and cross-eyed... mmm...”</i>");
	output("\n\n<i>“Uhh, Terra to Emmy. Come back to us, babe.”</i>");
	output("\n\n<i>“Sorry,”</i> the openly panting jackal shakily apologizes, <i>“I meant what I was starting to say though. I’ve got to keep up with this...”</i> She pokes her dick and quietly moans, its veins visibly bulging through the painted-on, latex-like suit. <i>“...so that I don’t start trading discounts for wet pussies or big, fat, New Texan cock.”</i>");
	output("\n\nYour eyes lock onto Emmy’s fingertip, slowly stroking up and down her turgid length, defaulting to self-pleasure while its owner ponders how to respond. <i>“Uh, what?”</i> You spaced out somewhere around ‘wet pussies.’ Did she turn up the temperature in here?");
	output("\n\nEmmy self-consciously stops herself and giggles. <i>“It’s such a relief to see that you want this as much as me.”</i> She reaches back and spins a hidden hardlight display panel out into view. On it is something that looks like the bizarre love-child from a threesome of a saddle, a condom, and high-tech, self-strapping bondage gear. <i>“It’s a herm harness. TamaniCorp partnered up with Naughty Wyvern to produce them a year or two back. That cocksheath? That’s actually self-lubricating synthetic flesh lined with thousands of microactuators. It can replicate the feeling of a hard fucking and a slow blowjob with ease, and when you cum, it pumps through the big ol’ ausar cock and straight into your womb for easy disposal!”</i>");
	output("\n\nYou scratch your head and muse, <i>“What about pregnancy?”</i>");
	output("\n\nPointing to a glowing annotation, Emmy explains, <i>“There’s an optional filter that renders sperm inert. It works on cum from 90% of known species, ausars especially.”</i> Emmy leans in close. <i>“And it comes with an extranet connection. I could give you my code and let you fool with it whenever you wanted. You could make me shudder and cum at any time of day, and I could use it to take the edge off any time I get too hot and heavy.”</i> Rubbing her knees together, Emmy moans. <i>“Like now.”</i>");
	processTime(6);
	pc.lust(11);
	clearMenu();
	addButton(0,"Next",emmyAfterConfessionEmail3);
}

public function emmyAfterConfessionEmail3():void
{
	clearOutput();
	showEmmy();
	output("You’re tempted to jump her right here and now, but you have a hunch she wants to talk a little bit more before you unwrap her like a Christmas present.");
	output("\n\nEmmy bites her lip, her fangs digging deep into the plush onyx cushion. <i>“The problem is... herm harnesses are fucking pricy. They have to be fabbed to your measurements, and if I’d have known I’d be needing 30,000 credits, I might not have gotten you such a pricey gift.”</i> Emmy wiggles up to you and puts her arms around your neck. <i>“So what do you say, [pc.name]? Wanna go halfsies on this and blow your girl’s mind?”</i>");
	processTime(1);
	//[Yes] [No] [Join Crew][Get Me One]
	emmyHarnessPurchaseMenu();
}

//Join Crew
//Why buy an expensive sextoy when she could join your crew and fuck you any time she wanted?
//Emmy would want a salary - she’s a working girl!
public function inviteEmmyToJoinCrew():void
{
	clearOutput();
	showEmmy();
	output("<i>“Why not just");
	if(pc.isBimbo()) output(" like,");
	output(" join my crew?”</i> you counter, enfolding her in your arms and none-too-subtly squeezing her ass.");
	output("\n\nEmmy’s expression lightens, then drops. <i>“It’d break my contract here, and there’s no way I can afford the 40,000 " + (isAprilFools() ? "dogecoin" : "credit") + " penalty it would hit me with.”</i> She rocks her hips against you, grinding her thickening tube of cock on your [pc.belly]. <i>“Trust me, I’ve thought about just leaving, going on the run with you, but not yet. I mean, we haven’t even properly fucked yet. What if we’re really bad at the whole tab A into slot B thing?”</i>");
	output("\n\nStroking your fingertips up her spine, you make the furry woman gasp in pleasure before answering. <i>“We won’t be.”</i>");
	output("\n\n<i>“Y-you’re probably right, but one step at a time, [pc.name]. Let’s get this toy and fuck for real, and if you’re still determined to have the galaxy’s best sales-herm </i>staffing<i> your crew quarters, we can talk contract buyouts and pay scale.”</i> Emmy licks her chops and openly moans. If she thrusts her quivering bazooka any harder against you, it’s going to go off mid-hug.");
	output("\n\nYou briefly wonder whether she’ll rupture her suit, inflate part of it like a condom’s tip, or merely slosh around in her own spunk for the rest of the day, then remember that she’s still waiting for your verdict on the toy.");
	//Same menu, join crew disabled. 	
	processTime(1);
	pc.lust(2);
	flags["EMMY_CREW_REQUESTED"] = 1;
	emmyHarnessPurchaseMenu();

}

//Yes
//Yep, give her the dosh.
public function giveEmmyTheDoshForHerHermHarnessssss():void
{
	clearOutput();
	showEmmy();
	output("<i>“");
	if(pc.isBimbo()) output("Oooh, I bet you’re gonna like, love sex just as me!");
	else if(pc.isBro()) output("Fuck yes. Let’s do this,");
	else output("I’m game if you are,");
	output("”</i> you reply");
	if(pc.isBimbo())
	{
		output(", bouncing");
		if(pc.biggestTitSize() >= 2) output(" and jiggling");
		output(" excitedly");
	}
	else if(pc.isBro()) output(" with an excited grunt and a confident leer");
	else output(" cautiously, watching Emmy for any evidence of a change of heart");
	output(".");

	output("\n\nThe jackal-herm’s eyes widen. <i>“R-really? I...”</i> She pulls you into a crushing hug. <i>“Thank you! I don’t know what I would have done if you hadn’t found me. Probably wound up slumming it in Gildenmere, getting drunk on honey and packing wombs full of cum for a few gems or handful of credits.”</i> She shivers in disgust, but her prick throbs powerfully against you.");
	output("\n\nBreaking away from the hug before she starts dry-humping you, Emmy pants, <i>“Here, let me just send you the " + (isAprilFools() ? "dogecoin" : "credit") + " transfer request... done. Just approve it, and I’ll place the order.”</i>");
	output("\n\nYou pull out your Codex, glance up at the jackal, noting her dilated pupils and lewdly jutting nipples, then swipe the approval button. <b>You’re out 15,000 credits, but now Emmy’s going to get that toy.</b>");
	output("\n\nEmmy is on you the moment you put the Codex away, bowling you over in a tumble of tits, fur, and fully-loaded package. You let her pin you to the floor, grinning up at jackal-slut while her hands grope and her cock throbs, reveling in her raw animal passion. Emmy alternately growls and whines, lost somewhere between wanting to violate your every hole and raise her ass submissively into the air. Eventually, she manages to gasp, <i>“S-so... how do you want to do this?”</i>");
	pc.credits -= 15000;
	flags["EMMY_QUEST"] = 5;
	flags["EMMY_TOY_TIMER"] = GetGameTimestamp() + 1440;
	processTime(4);
	//Fuck Her or Get Fucked options.
	clearMenu();
	if(pc.hasCock() && pc.cockThatFits(emmy.vaginalCapacity(0)) >= 0) addButton(0,"Fuck Her",fuckEmmyProper);
	else if(pc.hasCock()) addDisabledButton(0,"Fuck Her","Fuck Her","You’re too big to fuck her properly.");
	else addDisabledButton(0,"Fuck Her","Fuck Her","You don’t have a cock to fuck her with.");
	if(pc.hasVagina()) addButton(1,"Get Fucked",getFuckedByEmmyEmmyEms);
	else addDisabledButton(1,"Get Fucked","Get Fucked","You don’t have a vagina for Emmy to fuck.");
	if(pc.hasCock())
	{
		if(pc.biggestCockVolume() >= emmy.vaginalCapacity(0)) addButton(7,"Hyper Fun",emmyHyperFucksIntro,undefined,"Hyper Fun","Put your outsized equipment to use, and see what Emmy can do with it.");
		else addDisabledButton(7,"Hyper Fun","Hyper Fun","You aren’t big enough for this.");
	}
	else addDisabledButton(0,"Hyper Fun","Hyper Fun","You don’t have a giant cock to fuck her with.");
}

//No
//Refuse her the dosh
//Too poor
public function refuse2buySexToy4Ems():void
{
	clearOutput();
	showEmmy();
	output("<i>“I don’t have the credits,”</i> you admit with a hint of sadness.");
	output("\n\nEmmy gives you what feels like a chaste kiss, then morphs into a sloppy side of tongue. <i>“I-I’ll try to hold onto my sanity until you do, and we can always take the edge off in other ways.”</i> Jerking her hips violently against your ");
	if(pc.tallness > 60) output("[pc.leg]");
	else output("[pc.belly]");
	output(", Emmy whorishly moans, <i>“L-let’s close the store a few minutes!”</i>");
	//Display sex menu with options that get Emmy off.
	pc.lust(3);
	processTime(1);
	emmySexMenu();
	addDisabledButton(0,"Get BJ","Get BJ","Emmy wants to get herself off, not service you.");
	addDisabledButton(1,"Get Licked","Get Licked","Emmy wants to get herself off, not service you.");
}

//Get Me One
//Not a good idea while you’re exploring new areas and potentially mutating yourself in crazy new ways.
public function getMeOneEms():void
{
	clearOutput();
	showEmmy();
	output("<i>“I think I want one of those too,”</i> you answer.");
	output("\n\nEmmy laughs and kisses you on the nose. <i>“");
	if(!pc.isHerm()) output("But you aren’t even a herm! Besides, ");
	else output("But ");
	output("your measurements won’t be static enough to make use of it. You’ll be out there, feasting on alien delicacies that could mutate you or double your waist size. Or, stars forbid, you could wind up stranded or fucked silly by a huge native until the dildo won’t even properly stimulate you.”</i> She licks your cheek, then the underside of your ear, dragging her warm tongue against the sensitive edge. <i>“Once you’re ready for a more mundane life, I’d be happy to hold the remote for yours.”</i>");
	output("\n\nShe makes a few good points. That particular model might be best left until after this adventure.");
	output("\n\n<i>“So what do you say?”</i> Emmy asks, pouting. <i>“Care to help a girl out?”</i>");
	//Gray out <i>“get me one”</i>
	flags["GET_ME_ONE"] = 1;
	processTime(2);
	emmyHarnessPurchaseMenu();
}

public function emmyHarnessPurchaseMenu():void
{
	clearMenu();
	if(pc.credits >= 15000) addButton(0,"Yes",giveEmmyTheDoshForHerHermHarnessssss,undefined,"Yes","Give her the 15,000 credits for the toy.");
	else addDisabledButton(0,"Yes","Yes","You can’t afford to say that.");
	if(pc.credits < 15000) addButton(1,"No",refuse2buySexToy4Ems,undefined,"No","Tell Emmy that you can’t afford it.");
	else addButton(1,"No",refuse2buySexToy4Ems,undefined,"No","Tell Emmy that you can’t afford it - even if you can.");

	if(flags["GET_ME_ONE"] == 1) addDisabledButton(2,"Get Me One","Get Me One","You already suggested that - but it wouldn’t be a good idea while you’re out there, potentially screwing up your measurements.");
	else addButton(2,"Get Me One",getMeOneEms,undefined,"Get Me One","That sounds awesome. You want one of these!");
	if(flags["EMMY_CREW_REQUESTED"] == undefined) addButton(3,"Crew Invite",inviteEmmyToJoinCrew,undefined,"Crew Invite","Invite Emmy to join your crew. Who needs a toy when she can have direct access to you?");
	else addDisabledButton(3,"Crew Invite","Crew Invite","You already offered that, and buying her out of her contract would be a lot more expensive than this toy.");
}


//Didn’t Buy Harness At First - EMMY_QUEST == 4
//Add a button to her main menu [Herm Harness]
public function hermHarnessEmmyTalkUnbought():void
{
	clearOutput();
	showEmmy();
	output("You ask Emmy about the herm harness she mentioned earlier.");
	output("\n\nClenching her thighs together, Emmy tries to conceal her excitement. <i>“Did you find the 15K we need?”</i> She leans on the counter, using her arms to press her breasts together into a sea of seemingly endless cleavage and pebbly nipple. <i>“I’m barely keeping it together over here, babe. I either need something like this, or I need to start fucking every other customer that walks in the door.”</i> A mischievous graces her canine muzzle. <i>“...Or chain you up under the counter.”</i>");
	output("\n\nDo you help buy the herm harness?");
	processTime(2);
	emmyHarnessPurchaseMenu();
}

//Approach Harness Emmy First Time
public function emmyGotHarnessReaction():void
{
	clearOutput();
	showEmmy();
	//Not yet read email
	if(!MailManager.isEntryViewed("emmy_harness_here"))
	{
		output("You");
		if(pc.hasLegs()) output(" step up to");
		else output(" approach");
		output(" Emmy a bit confused, but then it sinks in. <i>“You got your new toy, didn’t you?”</i>");
		output("\n\nEmmy folds her arms across her bust, unimpressed. <i>“You didn’t read my email, did you?”</i>");
		output("\n\nYou sheepishly rub the back of your neck and shake your head in the negative.");
		output("\n\n<i>“I swear, a girl goes through the trouble of letting you know just how hard she’s going to fuck you, and you don’t even notice.”</i> Circling around the counter, Emmy presses herself against you, her enormous breasts compressing down and bulging out over her forearms. <i>“Give it a read sometime. You’ll like it.”</i> She bares her teeth in an almost too-wide smile and slips a data-chip into your Codex’s access port. <i>“But not as much as I’ll like this. That’s the access key for my harness. You can use it to load up a control app and set me off from anywhere in the galaxy.”</i>");
	}
	//Have read email
	else
	{
		output("You");
		if(pc.hasLegs()) output(" step up to");
		else output(" approach");
		output(" Emmy whilst grinning like an idiot. <i>“So you like the new toy?”</i>");
		output("\n\n<i>“You betcha!”</i> The excited herm is grinning wide enough to show off her considerable number of teeth. <i>“Guess how many times I’ve cum today?”</i>");
		output("\n\n<i>“");
		if(pc.isBro()) output("You’re such a fucking slut, Ems.");
		else if(pc.isBimbo()) output("Gosh, you’re such a naughty slut, Ems!");
		else if(pc.isNice()) output("You’re really enjoying slutting it up for me, aren’t you?");
		else if(pc.isMischievous()) output("You give an ausar girl a halfway decent excuse to slut it up, and all she wants to do is play with her bone.");
		else output("You really are my eager slut. Good.");
		output("”</i> You scratch your chin, musing, <i>“I don’t know, four?”</i>");
		output("\n\nIdly stroking her cock through the veneer of her skin-hugging suit, Emmy chuckles throatily. <i>“Try ten. I had to take off the harness to let my womb vent twice already. I never seem to go dry! I guess the implant must have thrown my hormones out of wack or something, because as long as I keep myself hydrated, my fuzzy little puppy-nuts just keep filling up.”</i> She sighs and closes in on you, grabbing hold of your hand and guiding it to her balls even as her other arm slips a data chip into your Codex’s access port. <i>“That’s my access key, for my harness. You can download the remote app and play with me whenever you want, even if you’re in another system.”</i>");
	}
	//Merge
	output("\n\n<i>“");
	if(pc.isBro()) output("What if you’re working?");
	else 
	{
		output("So I can");
		if(pc.isBimbo()) output(" like,");
		output(" get you off at any time, from anywhere? What about your shop?");
	}
	output("”</i>");
	output("\n\nEmmy smiles roguishly. <i>“That’s what the counter is for! I can just lean on it and try not to moan too hard, and noone will know that you’re making me pump fist-sized blobs of cum through a tube into my cunt. Nobody will know what a dirty little slut-puppy I’m being for you. They’ll just think I had a dizzy spell is all.”</i>");
	output("\n\n<i>“");
	if(pc.isAss() || pc.isBro()) output("You, quiet? Heh.");
	else output("You really think you can be quiet during all that?");
	output("”</i>");
	output("\n\nEmmy pulls back, looking almost offended. <i>“Just because you can make me howl like a wolf in the night doesn’t mean I’m screaming like a banshee every time.”</i> She quietly adds, <i>“I can moan quietly too. Wanna push the button and find out?”</i>");
	output("\n\nDo you? It might be fun to watch her blow like a volcano, but she’d surely be down for a fuck if you wanted.");
	//Push button or sex scenes.
	output("\n\n<b>Emmy’s Herm Harness controls have been added to your Codex!</b>");
	processTime(4);
	pc.lust(5);
	pc.createStatusEffect("Emmy Special Delay", 0, 0, 0, 0, true, "", "", false, (3 * 60));
	flags["EMMY_QUEST"] = 6;
	emmySexMenu();
}

//[Libido Implant]
public function emmyImplantFurtherDiscussion():void
{
	clearOutput();
	showEmmy();
	output("<i>“");
	if(pc.isBimbo()) output("So you, like, have an implant in your head that’s making you act like such a hottie?");
	else if(pc.isBro()) output("So uh, the thing in your head...?");
	else if(pc.isNice()) output("About that libido-enhancer... could you tell me more about it?");
	else if(pc.isMischievous()) output("So were you always this awesome before the libido-enhancer, or did you just win the side-effect lottery?");
	else output("Tell me more about the libido enhancer. Does it bother you?");
	output("”</i>");

	output("\n\nEmmy pulls her hands away from their constant, idly stroking of her erogenous zones and flattens her ears, ashamed. <i>“Part of me was hoping you wouldn’t ask too much about it. I feel like such an idiot for signing up for it. I should’ve realized how massive the side-effects could be when there was payout like that attached. I figured that the worst case would be having to masturbate an extra time every other day or so, not this constant, endless desire to touch myself, and you, and anyone who walks in the door.”</i>");
	output("\n\nSighing, the tarty jackaless pauses and looks you in the eyes. After a pregnant pause, she smiles. <i>“It’s not all bad. I might not have ever gotten with you if it hadn’t made me such a shameless flirt, and for that, I have to thank the little guy. And it does feel really, really good. It’s sort of like being in heat... and rut I guess. The desires are all mixed together and warm, and sometimes you just want to throw someone over a table, but sometimes you want them to throw you over the table...”</i>");
	output("\n\nEmmy shakes her head and sighs. <i>“You know how normally when someone touches you somewhere innocent - on your shoulder or hand or elbow - you barely notice, but when you’re in bed with an attractive mate it can be the best feeling ever? It’s sort of like that all the time, with anybody, even my own hands. And I don’t get mad or sad as often any more. It’s hard to tamp down on positive feelings, like, if someone cuts me off, who cares? Sure, I have to wait an extra minute or whatever, but I can spend that minute thinking about all kinds of dirty, naughty things to say, and smiling all the while.”</i>");
	output("\n\n<i>“What about the whole becoming a slut thing?”</i> you ask, remembering how hesitant she was when you met her.");
	//No toy purchase
	if(flags["EMMY_QUEST"] < 6)
	{
		output("\n\n<i>“I guess that ship has sailed,”</i> Emmy admits, a little sadly, <i>“but I think I can live like this. Sales have actually gone up since I’ve started dating you. I guess I’ve gotten a bit friendly with the customers over time - no, not fucking them or anything, but I guess having a busty jackal act like a flirty slut while talking shop like a true gun nut is a good way to move product. A few prudes got scared off, but honestly, who hasn’t seen an alien swaggering around with huge, flopping dick before? It’s not that uncommon.”</i>");
		output("\n\nShe giggles and strokes her own, showing you exactly what she’s talking about.");
	}
	//Purchase
	else
	{
		output("\n\n<i>“That ship has sailed,”</i> Emmy admits while slowly stroking her cock, <i>“but I don’t really mind. Sales are through the roof. The customers love when I’m flirting and squirming while trying to explain the finer points of our flux containment coils or dynamic, scope-based trajectory assistance. I’ve got an amazing [pc.boyGirl]friend who bought me the best, most endlessly fuckable sex-toy on the market, and I can show [pc.himHer] just how grateful I am for [pc.himHer] at any time, on any day, anywhere.”</i>");
		output("\n\nShe moans, visibly distending the hidden Herm Harness’s tubing with a blob of what can only be pre-cum. An actual orgasm would make far larger bubbles.");
	}
	//Merge
	output("\n\n<i>“So I guess I’m a hermy, furry slut now, everything the ausar conservatives hate. But that’s not what chaffs my balls about this implant situation. No, what bothers me about the implant is how goddamned insecure it is.”</i>");
	processTime(10);
	//[Next]
	clearMenu();
	addButton(0,"Next",emmyImplantTalk2);
}

public function emmyImplantTalk2():void
{
	clearOutput();
	showEmmy();
	output("You look at her curiously. <i>“What do you mean?”</i>");
	output("\n\n<i>“I took a look at it with some of the imaging equipment I have for maintaining my collection, and it’s built from a generic neural link with off-the-shelf additions and an off-the-shelf connection frequency.”</i> She pulls her hand off her dick and brushes a sable lock out of her eyes. <i>“Anyone with medical encryption codes - or a stolen copy of the UGC-mandated backdoor software that leaked a few years back - could make adjustments to it. Turn it up, turn it down, or even send false sensory data if they really knew what they were doing.”</i>");
	output("\n\nThat sounds... bad.");
	output("\n\nEmmy nods in agreement with the look on your face. <i>“Yeah. I’m basically primed for some unscrupulous asshole to come up and skulljack me. Fortunately, it wasn’t hard to build a jammer for that frequency. The only time anyone is going to be making any adjustments to it is when I go back in for the study. I guess I could turn it down myself, but evidence of the tampering might turn up at the end of the study. I don’t have the money to even try to pay </i>that<i> penalty.”</i>");
	output("\n\n<i>“");
	if(pc.isNice()) output("You’ve thought of everything, haven’t you, Ems?");
	else if(pc.isMischievous()) output("I’m kind of surprised you have enough blood left over to power your brain with your dick hard all the time.");
	else output("You do pretty good for a slut, Ems.");
	output("”</i>");
	output("\n\nEmmy’s mouth spreads into a toothy smile. <i>“I try, when I’m not in the bathroom, humping my hands.”</i> She looks down at her dick, then starts idly stroking it, not enough to come anywhere near orgasm, but enough to fill her with pleasure. <i>“So, did you want to have some fun, or did you have more questions?”</i>");
	emmyTalkMenu(emmyImplantFurtherDiscussion);
}

public function emmySexMenu():void
{
	clearMenu();
	if(pc.hasCock()) addButton(0,"Get BJ",getBlownByEmmy);
	else addDisabledButton(0,"Get BJ","Get BJ","You don’t have a dick to get blown.");
	if(pc.hasVagina()) addButton(1,"Get Licked",muzzlefuckingCunnilingus);
	else addDisabledButton(1,"Get Licked","Get Licked","You don’t have a vagina to lick.");
	if(flags["EMMY_QUEST"] >= 3 && flags["EMMY_QUEST"] != undefined)
	{
		addButton(2,"Lick Her",eatOutEmmysVagYouPoorPussyAddictedSod,undefined,"Lick Her","Eat Emmy’s pussy out. It could use some attention.");
		addButton(3,"Blow Her",emmyCockSlobber,undefined,"Blow Her","Suck Emmy’s dick fairly submissively.");
		if(pc.hasGenitals()) addButton(4,"69",emmySixtyNine,undefined,"69","69 with Emmy.");
		else addDisabledButton(4,"69","69","You need genitalia to 69 with Emmy.");
	}
	else
	{
		addDisabledButton(2,"Locked","Locked","Emmy isn’t willing to consent to anything lewder at the moment.");
		addDisabledButton(3,"Locked","Locked","Emmy isn’t willing to consent to anything lewder at the moment.");
		addDisabledButton(4,"Locked","Locked","Emmy isn’t willing to consent to anything lewder at the moment.");
	}
	if(flags["EMMY_QUEST"] >= 5 && flags["EMMY_QUEST"] != undefined)
	{
		if(pc.hasCock()) 
		{
			if(pc.cockThatFits(emmy.vaginalCapacity(0)) >= 0) addButton(5,"Fuck Her",fuckEmmyProper,undefined,"Fuck Her","Put your dick in her vagina.");
			else addDisabledButton(5,"Fuck Her","Fuck Her","You’re too big to fit inside her!");
		}
		else addDisabledButton(5,"Fuck Her","Fuck Her","You don’t have a cock to fuck her with.");
		if(pc.hasVagina()) addButton(6,"Get Fucked",getFuckedByEmmyEmmyEms,undefined,"Get Fucked","Have her fuck your vagina.");
		else addDisabledButton(6,"Get Fucked","Get Fucked","You don’t have a vagina for Emmy to fuck.");
		if(pc.biggestCockVolume() >= emmy.vaginalCapacity(0)) addButton(7,"Hyper Fun",emmyHyperFucksIntro,undefined,"Hyper Fun","Put your outsized equipment to use, and see what Emmy can do with it.");
		else addDisabledButton(7,"Hyper Fun","Hyper Fun","You aren’t big enough for this.");
		//(requires HL dildo, that’s it) 
		if(pc.hasHardLightEquipped()) addButton(8,"HL. Anal",emmyHardLightProstateFillerUp,undefined,"Hardlight Anal",emmyHardlightProstateFillToolTip());
		else addDisabledButton(8,"HL. Anal","Hardlight Anal","You don’t have any hardlight dildo-equipped panties to stimulate Emmy’s prostate with.");
	}
	else
	{
		addDisabledButton(5,"Locked","Locked","Emmy isn’t willing to consent to anything lewder at the moment.");
		addDisabledButton(6,"Locked","Locked","Emmy isn’t willing to consent to anything lewder at the moment.");
		addDisabledButton(7,"Locked","Locked","Emmy isn’t willing to consent to anything lewder at the moment.");
		addDisabledButton(8,"Locked","Locked","Emmy isn’t willing to consent to anything lewder at the moment.");
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
	output("<i>“");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("You cum almost as quickly as me,");
	else output("How’s that?");
	output("”</i> Emmy purrs between attempts to clean your [pc.girlCum] from her mouth. So much of her face is stained with the evidence of your love that she’ll be grooming for a good while yet.");
	output("\n\nThe best answer you can manage are a few breathy pants and a nod as you climb back up onto your elbows.");
	output("\n\nEmmy giggles and helps you up, though not without a few slips. The suit shrouding her fingertips is slick with your spent passion. Pussy-scent clings to her like perfume, twice as strong and far more enjoyable. It summons up pangs of remembered pleasure to flutter across your belly.");
	output("\n\n<i>“Damn,”</i> you exhale, <i>“...that was good.”</i>");
	output("\n\nEmmy smiles, though her tongue still slips out in a feeble attempt to groom her cunt-soiled face. <i>“Great. Now while you cool down, I’ve got to freshen up.");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output(".. on the outside. I’m going to be daydreaming about your cunt the rest of my shift.");
	else output(" Some of us still have a store to run.");
	output("”</i> The jackaless makes for the ‘Employees Only’ door, her knees pressed together. Every step is accompanied by the sound of liquid sloshing inside her one-piece suit. Her hips sway pendulously from side to side, the byproduct of her body’s desire for every ounce of friction upon her own unsated folds.");
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
	output("a saucy smile. <i>“");

	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) 
	{
		output("Mmmm, I thought you’d never ask. I’ve wanted another load in my mouth so badly.”</i> She prowls closer, opening wide and letting her lengthy tongue hang low. <i>“It’s so fucking hot, feeling your cum sliding all over my teeth and down my throat, making me smell like your cock whenever I cough. F-f-fuck, how did I ever do this without jacking off?”</i> She nuzzles against your neck and presses your hand into the throbbing length between her legs. <i>“How about we both cum. I want it in both holes.”</i>");
		output("\n\n<i>“You sure you can handle that?”</i> You probe her with a look while trying to ignore how hot her prick feels against your palm.");
		output("\n\nEmmy presses a button, sealing the door behind her, but her eyes are shining feverishly. <i>“I’m sure, [pc.name]. If there’s one thing I’m comfortable with, thanks to you, it’s cumming... and your [pc.cumNoun]. In me, on me, filling me, whatever. Not cumming is the hard thing...”</i> She favors you with a wry smile. <i>“Now get ");
		if(!pc.isNude()) output("naked and hop ");
		output("up on the countertop. Let me see that dick.”</i>");
		output(" Licking her lips, the jackal-girl adds, <i>“Give me that cock.”</i>");
	}
	else
	{
		output("Just me, you, your cock, and a little satisfaction for someone who has been so nice to me.”</i> She prowls closer and lays her arm on your chest, delicately walking her blunted claw-tips down your sternum. <i>“Just keep... your hands... to yourself.”</i> She nips just below your ear, dozens of sharp teeth clacking noisily together, then nuzzles against the nape of your neck. Her other hand strokes your [pc.hair]. <i>“This is about you.”</i> Emmy forcibly pulls herself away, moments before abandoning herself to grind against your [pc.leg]. <i>“I- I can wait.”</i>");
		output("\n\n<i>“You sure?”</i> You probe her with a look while you try to ignore the heat building in your loins.");
		output("\n\nEmmy presses a button, sealing the door behind her, but her eyes are shining feverishly. <i>“I’m sure... [pc.name], I’ll just help you out a little bit. It’s just my mouth - it’s not like I’ll be giving in to my overactive libido.”</i> She favors you with a wry smile. <i>“Get ");
		if(!pc.isNude()) output("naked and hop ");
		output("up on the countertop. Let me get a good look at it.”</i>");
	}
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

	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output(" Her other hand takes yours once more and wraps it around her aching boner, urging you to help her stroke it.");
	output("\n\n<i>“Ahhh,”</i> you groan in satisfaction, your head lolling back. You can feel yourself swelling bigger in response to her wanton cocklust, your [pc.cockBiggest] engorging until the whole thing thumps angrily against her spit-greased hands with every wanton heartbeat. Emmy’s thumb brushes just below your [pc.cockHeadBiggest], the hard tip of her blunted nail barely grazing the underside. You shudder and gasp; your entire length flexes powerfully in her grip");
	if(pc.cumQ() < 50) output(", and the first bead of pre-cum appears from your cockslit");
	else if(pc.cumQ() < 3000) output(", and the pre-cum that dribbles from you so frequently doubles in quantity");
	else output(", and the pre-cum that always seems to pour from your cockslit becomes thick enough to wash away the bulk of her spit");
	output(".");
	output("\n\nNuzzling back against it, the jackaless allows your liquid ardor to soak into the fur of her muzzle. She giggles, <i>“I’m going to smell like your cock for the rest of today, you know that, right?”</i> She swaps sides, inadvertently collecting a droplet of spunky enthusiasm just above her nose. Joining both her hands to your [pc.cockBiggest], ");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("Emmy leaves you to handle her spasming meat and picks up the pace of her supplementary handjob, ");
	else output("Emmy picks up the pace of her stroking, ");
	output("working you to a fever pitch with powerful strokes. Her eyes stare up at you from under her obsidian locks, watching your reaction as she milks your ambrosia onto herself. Her tongue slithers, snake-like, around the circumference of your [pc.cockHeadBiggest], and you nearly ");
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
	output(". She sucks particularly deeply, feathering her tongue along your underside, her cheeks hollowed from the effort, then pulls off, panting. <i>“");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("Don’t you hold out on me for a second, [pc.name]. Just cum, and let me suck it down. If you need to cum twice, or three times, or whatever, just keep nutting in my mouth, okay?");
	else output("Don’t hold back for a second, [pc.name]. If you need to cum, just do it, okay?");
	output("”</i> Smiling and licking her lips, the inflamed vixen adds, <i>“");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("Sluts like me ");
	else output("I ");
	output("know what a cock feels like when it’s about to blow. You don’t need to warn me.”</i> She tugs your [pc.cockBiggest] up and plants wet smooches all over the sensitive spot below your [pc.cockHeadBiggest]. <i>“");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("You can even do it on my face if you want... or straight down my throat. Anywhere.");
	else output("I don’t mind the mess.");
	output("”</i>");
	output("\n\nEmmy gobbles you right back up again as soon as she finishes talking, swallowing inch after inch in one smooth traversal of your length. Her eyes glaze as she focuses her attention. She pumps back and forth fast enough that foaming spittle drips from her lower lip, and the fluid gulping of her self-induced face-fucking momentarily overwhelm the audio from the automated displays. Your [pc.cockBiggest] is buffeted by a vortex of ecstasy, held captive by sensuous warmth, yoked to elemental pleasure incapable of yielding until you’re dragged to the very peak.");
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
		output("\n\nYou unload [pc.cum] like a bottle of soda shaken for far too long, bathing her from tongue to tonsils in a veneer of reproductive release with the first squirt alone. The jackaless has the good graces to look surprised by this turn of events. Her cheeks bulge, and messy streams of your excessive load drip from the corners of her mouth. She does her best to keep up with noisy swallows, but nothing could have prepared Emmy for the size of your load. It’s only after you’ve finished that she shows you what you’ve accomplished, opening her mouth to display the flood you’ve so heedlessly released into her mouth. Even after all her swallows, there’s a lot there.");
		output("\n\nGrinning, she gulps the last of it down.");
	}
	//Kirocum
	else 
	{
		output("\n\nNo force in this universe could prepare the jackaless for the size of your load. You erupt like a long-dormant volcano, launching a wave of relief so thick that it bulges her cheeks and squirts from the corners of her mouth. Emmy backpedals before you can choke her with it, freeing her lips just enough for the next explosion of [pc.cum] to crest across her face, painting her [pc.cumColor] from head to tits. Her hands grab hold of your still-spasming prong and jack it off for all she’s worth, spraying the streams of jism across her body.");
		output("\n\nWhen you’re finally done, she makes a show of gathering the dripping gunk from her face and sucking it from her fingertips. <i>“Ahhh...”</i>");
	}
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined)
	{
		output("\n\nIn all the excitement, you nearly forgot that you had a hand pressed to Emmy’s own cock. You didn’t exactly give her a world-class handjob, just some inattentive up-and-down stroking, maybe a slow rub with your thumb across her frenulum, but she cums right after you, firing thick bubbles of seed through her herm harness and into her twat, all to the feeling of your [pc.cum] on her tongue.");
		emmy.loadInCunt(emmy,0);
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
	output("\n\nA moment later, Emmy returns - wrapped in a fresh suit. Her face looks to have been washed clean, but she still smells vaguely of your essence. She claps her hands nonchalantly. <i>“");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("So, now that we’re both thinking a little more clearly, maybe you want to take a look around the store, and give your amazing girlfriend a nice, fat commission to go with that thick load?”</i>\n\nNot a bad idea...");
	else output("So, now that you’ve got that taken care of, how about we get your hands on a big gun?”</i> Despite her wolfish grin, it’s clear she doesn’t want you to grab hold of her dick - at least not yet.");
	output("");
	processTime(4);
	clearHermHarnessStatii();
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
	clearHermHarnessStatii();
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
	showEmmy(true);
	output("You grab hold of her suit zipper and yank it down, allowing a bloated canine cock to spring out, complete with a tapered head and bulgy knot. Emmy fidgets nervously when you ");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("peel her out of the Herm Harness and grab her member");
	else output("grab the member");
	output(", already slick with pre-cum. It firms perceptibly beneath your fingers and fills the air with the musky odor of a herm long-denied, aided by the matted fur below, pasted down by her dick and its drippings.");
	output("\n\nYou tease, <i>“");
	if(pc.isBimbo()) output("I couldn’t not stick a cock like this in my mouth! It’s just too yummy looking.");
	else if(pc.isNice() || pc.isMischievous()) output("A big gun like this needs proper maintenance, dear. What kind of lover would I be if I didn’t help you empty the barrel?");
	else output("Please, this little thing isn’t going to scare me off.");
	output("”</i>");

	output("\n\n<i>“Really?”</i> Emmy ");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("excitedly");
	else output("nervously");
	output(" watches you ");
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

	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("\n\nEmmy groans and stirs from beneath you. Her hands gently caress your [pc.butt], and her warm breath glides over your crotch as she pulls closer. <i>“I won’t.”</i> She whimpers a little and adds, <i>“I hope you brought a crowbar, because you’re going to have to pry me off your crotch.”</i>");
	else output("\n\nEmmy whimpers and stirs from beneath you. Her hands gently caress your [pc.butt], and her warm breath glides over your crotch as she pulls closer. <i>“D-d-don’t stop!”</i>");
	output(" A shock of moisture brushes your skin - her nose. <i>“");
	if(pc.cockTotal() + pc.vaginaTotal() >= 3) output("Mmmm, so many choices.");
	else if(pc.cockTotal() + pc.vaginaTotal() >= 2) output("Mmmm, which one?");
	else output("Mmmm, o-kay...");
	output("”</i>");
	pc.lust(30);
	processTime(4);
	clearMenu();
	addButton(0,"Next",emmy69MiddleOfScene,1);
}

//Lick Emmy’s Pussy
public function lickEmmysPussyDuring69():void
{
	clearOutput();
	showEmmy(true);
	output("You grab hold of her suit zipper and yank it down, allowing a bloated canine cock to spring out. The vulgar phallus is hardly your target - just another obstacle on the quest for cunt. You edge it out of the way with your elbow and lift her sack to reveal a gleaming treasure box. Her black lips are puffy with need and so wet that the underside of her balls may as well be an extension of her cunt.");
	output("\n\nYou tease, <i>“I think this little lady needs the attention a little more.");
	if(pc.isBimbo()) output(" I bet she’s super delic-deli... uhmm, yummy!");
	else output(" You can’t keep her hidden under those big ol’ balls all the time.");
	output("”</i>");
	output("\n\n<i>“You mean it?”</i> Emmy watches you ");
	if(!pc.isNude()) output("strip and ");
	output("climb atop her with rapturous, eager eyes. <i>“Sometimes it’s easy to forget my pussy when I’ve got a crotch-mounted bazooka.”</i> She giggles.");

	output("\n\nDipping a finger inside, you gently explore the interior of her dusky folds, reveling in the slick, velvety texture of her labia against your knuckle, making soft squelches with every playful intrusion. <i>“You’re wet,”</i> you observe with a smile, adding a second digit. <i>“So wet.”</i> Hooking your finger upward as you draw it out, you squeeze a lewd-sounding moan from the herm, pressing on her most sensitive areas. She wriggles like a caught fish, babbling and groaning, streaming rivers of her slippy cunt-juice onto her mat. <i>“Not wet... drenched,”</i> you observe.");
	output("\n\nStill groaning, Emmy nods into your [pc.thighs], dragging her twitching ears along your [pc.skinFurScales]. She’s already acting like your puppet, quivering with every twist and rub, moaning when you pause your none-to-gentle undulations, and arching her hips to present her clit for examination. And what a clit it is! The bulbous little pleasure bead is wet and glistening, thick enough that its hood may as well be made of ill-fitting spandex. It pulsates demurely, begging to be touched.");
	output("\n\nWhat a cute little button. You touch it.");
	output("\n\n<i>“Ooooooh,”</i> Emmy pants, closing her eyes and groping tits, too lost in her own ecstasy to return the favor. Her hips roll back against your palm, forcing the swollen nub harder into your fingertip. Veins pulse and throb along her cock’s length, and you can hear the muffled splatter of jism on fur. Did she get off already? Did this horny, furry slut fucking paint her tits already?");
	output("\n\nHow rude.");
	output("\n\nYou pull away, shaking webs of sticky ladyjuice free from your fingers. The jackaless whines and wiggles, trying to draw you back in, but you just slap her ass. <i>“Greedy sluts who don’t share don’t get more pleasure.”</i> Part of you wants to go right back to playing with her onyx box, but you hold firm, knowing that a little patience will go a long way towards slaking your own unchaste urges. You do kiss her, lips to netherlips, and whisper, <i>“Use your mouth, Em.”</i>");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("\n\nEmmy whimpers and presses closer to you. Her hands gently caress your [pc.butt], and her warm breath glides over your crotch as she pulls closer. <i>“Yes, " + pc.mf("sir","ma’am") + "!”</i> she babbles excitedly, adding <i>“");
	else output("\n\nEmmy whimpers and stirs from beneath you. Her hands gently caress your [pc.butt], and her warm breath glides over your crotch as she pulls closer. <i>“Unnngh! O-okay!”</i> A shock of moisture brushes your skin - her nose. <i>“");
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
	showEmmy(true);
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
		output("\n\nWrapping your hands around Emmy’s butt, you push your face harder against her quivering cunt, thrilled to feel her balls pulse against the underside of your chin. You wrap your lips around her pudgy clit and rhythmically suck, lashing your tongue over its surface and around its hood, savagely strumming her sex-raw nerves. The jackaless cries out at that, and a small squirt of her girlish love splatters your lower lip. She’s trembling like mad and properly stimulated, and her mouth is going wild on your ");
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
	showEmmy(true);
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
		if(pc.cocks[x].cLength() > 12) output(", her neck bulges from how much she’s forced down her throat");
		output(".");
		output("\n\nPleasure draws every muscle in your body taut. White spots dance behind your eyes, and your world explodes. Your [pc.hips] thrust powerfully forward, and you feel the wonderful, blessed relief of ejaculation, like a white-hot bar of bliss blasting out of you and into the heavens - or Emmy’s mouth. They may as well be one at the same thing to you.");
	}
	//Emmygirlcum
	if(youSuck == 2)
	{
		output("\n\nA spray of girlcum fills your mouth, drawing you back to the real world with the tangy taste of Emmy’s cunt. You swallow noisily, letting her paint your nose and cheeks with more of her gushing goo. Her balls pull tight below your chin, and you hear the sound of her masculine spunk splattering off the bottom of her tits. Flecks of it hit your [pc.belly], warm and wet, a salty compliment to the feminine love you’re currently struggling to swallow.");
		pc.applyPussyDrenched();
	}
	//Emmy boycum
	else 
	{
		output("\n\nThick, salty-tasting spunk fills your mouth, drawing you back to the real world before you choke on it. You swallow noisily, but it’s not fast enough for Emmy’s super-sized ejaculations. Spunk rolls over your bottom lip in a wave while small streams dribble from the corners of your mouth. Still, you persevere, gulping down as much of as you can. Her poor balls are being blasted from behind by girlcum too, making her whole sack gleam brighter than a brand new starfighter.");
		pc.applyCumSoaked();
	}
	//Merge
	output("\n\nPure pleasure backs your ceaseless swallowing. Both you and Emmy are lost to it, ingesting as much of the other’s love as possible before your twinned orgasms completely wind down. How long you spend bound to Emmy’s crotch, you don’t know, but when you stagger up and burp, tasting her on your tongue and breath, you feel completely and totally winded.");
	//-10 energy!
	pc.energy(-10);
	output("\n\nEmmy doesn’t seem to have fared much better. She’s panting and trying to lap your ");
	if(emmySucks == 2) output("[pc.girlCum]");
	else output("[pc.cum]");
	output(" from the edges of her muzzle, but her tongue seems more intent on hanging from her mouth like a dog’s on a hot day. <i>“Wow...”</i> She looks at your face, still stained with the evidence of her orgasm, and visibly shudders, her cock abruptly swelling back to full hardness. Dazed, she mumbles, <i>“");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("Wow... that’s a good look for you. Be right back!");
	else output("I umm... I’ll be uh... gotta go clean up.");
	output("”</i> Jizz trickles from the tip of her member as she staggers into a back room.");
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
	output("The Emmy that returns after a few minutes is looking much more put together, if no less erect, but she’s back to her old, ebullient self. <i>“Hey, quit checking out the merchandise and help me clean up this mess");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output(", unless you want to go for another round. You would look good with another layer on your face... but the mess..");
	output(".”</i> She gestures at the cum-soaked mat on the floor. Thankfully, recessed grates in the floor opened up to drain away the rest of the puddled evidence of your excesses, or you’d need to fetch a mop.");
	//Asshole
	if(pc.isAss()) 
	{
		output("\n\nYou make for the door, but a press of a button seals the portal before you can make good on your escape. <i>“Hey, just because you got me off doesn’t mean you can dine and dash.”</i>");
		output("\n\nFuck. Looks like you have to help the furry bitch clean up her jizz-soaked mat.");
	}
	//Merge
	output("\n\nYou help Emmy heft the fluid-weighted fabric off of the salesfloor and into the ‘Employees Only’ area, earning a kiss with a hint of your own slimy residue. You’re sure to share plenty of hers back.");
	output("\n\nShe tosses you a towel to wipe up with and laughs, <i>“Did I really cum that much? Wow.”</i>");
	output("\n\nThere’s so much that the towel is soon soaked, but at least you’re clean... sort of. You still smell sort of like ");
	if(youSuck == 2) output("her cunt");
	else output("her spunk");
	output(". Hopefully no one will notice.");
	
	pc.removeStatusEffect("Cum Soaked");
	pc.removeStatusEffect("Pussy Drenched");
	processTime(10);
	if(flags["EMMY_PRESEX_FUN_TIMER"] == undefined) flags["EMMY_PRESEX_FUN_TIMER"] = GetGameTimestamp();

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Cockslobber By Fenopus
//By Frogapus & Fenoxo
public function emmyCockSlobber():void
{
	clearOutput();
	showEmmy(true);
	author("Frogapus&Fenoxo");
	output("<i>“");
	if(pc.isBimbo()) output("Shut up and... just let me suck that cock,");
	else if(pc.isNice()) output("My turn to take care of you, Em,");
	else if(pc.isMischievous()) output("You need to take better care of that rifle, Emmy.”</i> You pat her bulge and watch the twin bulges of her balls throb. <i>“Those power cores look like they’re about to overload,");
	else output("Just shut up and let me do this,");
	output("”</i> you say with a knowing smile.");

	output("\n\nEmmy pants and staggers back, dick already throbbing, creating a spherical distention in the poor herm’s suit at the top of her lewdly-jutting member.");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output(" <i>“R-really? O-okay, I didn’t expect you to be so much like... like, well, me.”</i> She sounds almost concerned about you. <i>“I mean, you don’t have an implant in your head making sure that you’re always ready for a surprise blowjob.”</i> With each word, she sounds less worried and more excited. <i>“Oh god, just suck my cock already, [pc.name]!”</i>");
	else output(" <i>“O-okay, but i-it’s not sex. Just a little fun.”</i> She sounds more like she’s trying to assuage her own guilty conscience than talk to you. Either way, her dick is clearly ready for some loving.");
	output("\n\nYou sink to your knees, already shivering in anticipation, and lean forward slightly, running your hands along the straining fabric, marvelling at how effectively the mystery material contains what feels like enough pre to fill a coffee cup. Emmy rewards you with her hands on your head");
	if(pc.hasHair()) output(", running through you hair");
	else output(", stroking your [pc.skinFurScales]");
	output(". At first her touches are uncertain and shaky, but when you lay your cheek against her achingly erect jackal-cock, those hesitant caresses become firm and commanding, betraying a surprising strength. You look to her for final confirmation, her eyes meeting yours in a look of hungry approval.");

	output("\n\nEmmy’s gaze is almost a physical force, full of desire and an almost astounding amount of need half-concealed behind her pride. Her smile sends a thrill of delight down your spine, and you run your palms up her thighs, feeling her heat against your hands, the subtle buck of hips against you. The catch of her form-fitting suit practically releases itself, but you keep it from sliding down too quickly once it reaches crotch level, freeing the soaked slab of girlmeat with deliberate slowness.");

	output("\n\nThe jackaless’s thickness throbs under your fingertips, its veins pulsing and flexing in appreciation.");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output(" Having to remove the Herm Harness spoils a bit of the fun, but then it’s gone, and you have her cock right there, in your hands.");
	output(" Her sable shaft is slick and musky from bathing in its own pre-cum for so long, the latest addition a heady frosting on an already perverse feast. Just a whiff of it leaves you briefly dizzy and aroused.");
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

	output("\n\nShe releases her hold on your " + (pc.hasHair() ? "hair" : "head") + ", and you slide back, just enough to get resituated, and swirl the tip of your tongue around the head of her cock. She gives your " + (pc.hasHair() ? "hair a gentle" : "head a tug") + " tug and you respond obediently, running your lips down her length, sucking noisily on her member. Once you reach the base, you get another happy gush of pre down the back of your throat. You slide back up, moaning around her shaft in hungry delight, while she does the same, alternating between fucking your face like it’s her own personal sex-toy and watching you service her meat.");

	output("\n\nUp and down her shaft you go, encouraged by her sweet sounds of pleasure and bursts of pre that may as well be ejaculations, guided by her tugging hands. She’s in control, and you’re enjoying every minute of it, happy to give her the tender love and throat-fucking she so clearly needs. You place your hands on her spit and spunk-slicked balls and rub them softly as she draws you up, coaxing a low hum of pleasure from Emmy. She quickens her pace, tugging you down sooner each time, and you take the hint.");

	output("\n\nAfter a few more minutes, you’re pumping your head up and down like a piston, working her shaft as her fingers begin to tighten on your hair, taking complete control over your mouth and transforming it into a slobbery receptacle for her throbbing cock. She’s growling like an animal, and you can feel the rapidness of her heartbeat in the way her dick bulges against your lips and tongue. She’s ready to cum, and you want every drop of it.");

	output("\n\nAt last, she yanks you the whole way in, burying your nose into the sensitive folds of her sheath. The pain from her rough hair-pulling makes you cry out, uselessly vibrating your throat around her pulsating dick as she unloads into you, dumping what feels like a gallon of her thick, salty cum straight down your gullet. Your eyes roll back in absolute delight as she pumps you full of her seemingly-endless seed.");

	output("\n\nYou gulp reflexively, instinctively, hungry for her liquid pleasure, delighting in the clenching of her balls against your chin and the fullness of your belly. ");
	if(pc.isBimbo())
	{
		output("Any restraint you may have scraped together evaporates, and you sympathetically cum, spasming in bliss to the feeling of cum pouring into your stomach. ");
	}
	output("And when she finally lets go of you, the ache in your jaw, your throat");
	if(pc.hasHair()) output(", your hair");
	output(", are all drowned in the profound pleasure of a being so utterly stuffed with her warm cum.");

	output("\n\nEmmy pulls out of your mouth, wincing when your teeth scrape past her swollen knot. Popping her thick dick out, she leaves a wet trail of her cum behind. Your aching jaw leaves you with your mouth feeling stretched and oddly slack, adding to the dazed look already on your face. She runs her hand gently over your head as a bead of cum rolls off your glazed lips and splashes down on your [pc.chest].");

	output("\n\n<i>“");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("Any time you get a craving for cum, I’ll be here for you. You don’t even have to knock or ask, just pin me down and fish it out.");
	else output("How am I going to live without one of those every half hour?");
	output("”</i> Emmy purrs in approval, halfheartedly packing her mostly-hard member back away. ");

	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("<i>“Maybe someday you can buy out my contract and replace your food synthesizer with me. I promise, I won’t run out.”</i>");
	else output("She shakes her head, perhaps amazed at how much she enjoyed it, and struts back to her usual spot with a wink.");

	pc.loadInMouth(chars["EMMY"]);
	if(flags["EMMY_PRESEX_FUN_TIMER"] == undefined) flags["EMMY_PRESEX_FUN_TIMER"] = GetGameTimestamp();
	clearHermHarnessStatii();
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
	showEmmy(true);
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) 
	{
		output("<i>“Your poor pussy must be so sore after having that thick, hard toy stuffed inside </i>all<i> the time. Why not pop it out and let me give it some love,”</i> you purr, stalking forward.");
	}
	else
	{
		output("<i>“");
		if(pc.isBimbo()) output("Your poor pussy is so totally ignored! The poor thing needs some attentions, Ems! Good thing you’ve got me here to take care of you");
		else if(pc.isNice()) output("It’s my turn to take care of you, Em");
		else if(pc.isMischievous()) output("With balls like that, your poor pussy must be feeling smothered. Here, let me help");
		else output("I’m going to eat you out. Relax, you’ve earned it");
		output(",”</i> you purr, stalking forward.");
	}
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) 
	{
		if(emmy.bellyRating() > 10) output("\n\nEmmy looks startled but pleased, nervously stroking her paunched middle. <i>“S-sure, but there’s a lot of cum in there, you know? Not just the girly kind...”</i> She hops up on top and spreads her legs wide, growing more enthused by the idea with every passing second. <i>“You’d get it all over your face, and it’d drip down your chin. You’d look like such a fucking slut.”</i> She shudders and rubs at her bulging balls. <i>“O-okay, do it... if you can find your way past these boulders!”</i> She giggles at her own silliness.");
		else output("\n\nEmmy looks a little started but pleased, quickly hopping up on top. <i>“S-sure. You can do whatever you want to my pussy. It’s pretty much your personal playground. Without you, I never would’ve been comfortable frigging myself through my jumpsuit when the store gets slow, or bending over the nearest hard counter to present it.”</i> Her legs spread wider and wider the more she rambles, blatantly exposing her too-masculine bulge. <i>“Someone put some boulders in the way, but I think you know how to squeeze past them...”</i>");
	}
	else
	{
		output("\n\nEmmy looks startled but pleased, nervously stepping back until her ass bumps into the countertop, her tail swishing back and forth excitedly. <i>“S-sure. We could that.”</i> She hops up on top and spreads her legs wide, gaining confidence now that she’s accepted the idea, her too-masculine bulge on full display. <i>“You sure you can find the buried treasure under these boulders?”</i>");
	}
	output("\n\nYou flash a predatory grin and put your hands on her thighs. <i>“I’m damn sure gonna try.”</i> The suit’s seal is surprisingly easy to locate and pop open, revealing a basic, zipper-type fastener. You give it a tug, admiring the way the jackal’s compressed curves slowly spill free of the constricting fabric, revealing lush tawny fur and inky nipples that would be hard enough to cut glass were they not so void-blasted pudgy. Rubbing your way up the inside of her thigh with your other hand, you enjoy the lewd little squeeks she makes as you reveal more and more of her body.");
	output("\n\nThe zipper accelerates the closer it gets to her waist, pried open by the force of her ramrod-stiff cock thrusting its way out of confinement. Progress briefly hitches at the outlandish curves of her hips, but a sharp tug carries you through to your goal, allowing you to roll the jumpsuit the rest of the way down to her paws and reveal the jackal-woman’s full, naked form. Unsurprisingly, you still can’t see her pussy.");
	output("\n\nTime to fix that. Her balls are almost too large to hold one-handed; you have to cradle one with your wrist just to keep it from slipping down and giving you a black eye. At last, you’re able to view the inky lips of Emmy’s pussy");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output(", spread wide around the Herm Harness’s intruding dildo");
	output(". It shines, even shaded by your arms. She’s dripping wet, so juicy that even the underside of her ballsack is sodden with her fluids, but your attention is firmly rooted on the source of that ambrosial liquid.");
	if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined)
	{
		output("\n\nYou grab hold and try to pull it out, but the damn knot is terribly inflated, stretching her wider and wider the closer you get it to her entrance. Emmy wriggles and moans, dripping slick goo all over your fingertips. You nearly lose your grip, but then, with a lewd pop, the knot slips free.");
		if(emmy.bellyRating() >= 10) output(" Backed up jackal jizz spurts out the moment the obstruction is freed, sliding out of her in thick waves. Ribbons of the gunk paint your arms before you can toss the dildo to the side.");
		else output(" Mixed juices slide out of her the moment the obstruction is free: a mix of pre-cum, Emmy’s jizz, and lots of vaginal secretions.");
	}
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
	output("\n\nEmmy cums again. This time there’s far less girlcum, but her pussy’s rhythmic contractions are far, far stronger. It feels like she’s going to break your fingers off with how hard her cunt is clamping down. Her juices are sweeter this time too, this mouthful of cunt-love freshly made, just for you. You keep your dual-sexed lover lost in the throes of bliss for what feels like hours. Your mouth is sore, and your tongue exhausted, but you still lick and kiss until you feel every ounce of strength drain from the jackaless’s fucked-out form.");
	output("\n\nPatting her pussy as if to say, <i>“good girl,”</i> you back away and stand, stretching on ");
	if(pc.legCount == 1) output("a ");
	output("[pc.legOrLegs] made tired from kneeling. Emmy is flat on her back, nearly sliding off the counter. A small lake of cum is draining out from between her tits, and trickles of white ooze from both sides of her slack mouth. One of her hands is idly rubbing her dick while the other cradles a very swollen belly. Just how much cum did she swallow?");
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
	if(flags["EMMY_PRESEX_FUN_TIMER"] == undefined) flags["EMMY_PRESEX_FUN_TIMER"] = GetGameTimestamp();

	output("\n\nTogether, you both make yourselves decent and return to the store a short time later.");
	clearHermHarnessStatii();
	emmyCumStatusPurge();
	//Shower
	//20m pass
	pc.shower();
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Push Her Buttons
//Add Herm Harness Button to codex
//if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined)
public function pushEmmysButtonsMenu():void
{
	clearOutput2();
	showName("REMOTE\nCUMTROL");
	showBust("");
	var txt:String = "";
	txt += ("Welcome to the Remote Cumtrol application for your herm harness!");
	txt += ("\n<i>The most exciting app on the extranet!</i>");
	txt += ("\n\nPlease make a selection.");
	output2(txt);
	emmyCumtrolMenu();
}

//Massage
public function pushEmmyMassage():void
{
	if(emmy.bellyRating() >= 40)
	{
		gravidEmmyHarnessOverride();
		return;
	}
	clearOutput2();
	showName("\nMASSAGE");
	showBust("");
	var txt:String = "";
	txt += ("Sending command...");
	txt += ("\nCommand received...");
	txt += ("\nGenital massage in progress...");

	//Not there
	if(currentLocation != "KIHASHOP")
	{
		txt += ("\n\nThat ought to give Emmy something to think about, something arousing enough to keep her desperate on edge, but slow enough to keep her from blowing her load.");
		processTime(1);
	}
	//Activate the herm harness for fun and profit!
	else
	{
		showEmmy();
		txt += ("\n\n<i>“Oooh,”</i> Emmy purrs in delight, her cock visibly throbbing through the sheer material of her outfit. <i>“That’s not bad. Mmmm...”</i> Her eyelids drift closed, and her hips slide into a slow back and forth motion, undulating to the rhythm of the device’s infinitely pleasing rhythm. After only a few seconds of this, her look of delight morphs into an expression of bewilderment. <i>“");
		if(flags["EMMY_MASSAGED"] == undefined) txt += ("I-it doesn’t go faster, does it?");
		else txt += ("T-this is the ‘massage’ setting again, isn’t it?");
		txt += ("”</i>");
		txt += ("\n\nYou cheekily shake your head ");
		if(flags["EMMY_MASSAGED"] == undefined) txt += ("back and forth");
		else txt += ("up and down");
		txt += (".");
		txt += ("\n\n<i>“");
		if(flags["EMMY_MASSAGED"] == undefined) txt += ("F-fuck, you didn’t put a time limit on the massage function?");
		else txt += ("N-no time limit? You fiend. Get me too used to this, and I’ll never let you turn it off!");
		txt += ("”</i> Emmy’s hips are still traveling on their slow bump and grind, tracing figure eights against the side of the countertop. Tiny blobs appear at the top of her cock, visible for a half second before being whisked away by the herm harness’s concealed pumping mechanisms. <i>“");
		if(flags["EMMY_MASSAGED"] == undefined) txt += ("It’s not enough to get me off... but it’ll keep me close. Close enough to... mmmm... get all desperate.");
		else txt += ("You’d like that, wouldn’t you? Me hard and aching, desperate for any kind of attention. You could walk up to me and press my mouth into your crotch, hell, even your asshole... mmm... I’d like anything right now.");
		txt += ("”</i>");
		txt += ("\n\nYou let her know that you expect her to wait for you to bring her off, should you use this at long distance.");
		txt += ("\n\n<i>“Kinky!”</i> the panting jackaless exclaims, <i>“But what about pushing another button on that for me... or peeling it off my cock and slipping me into your mouth?”</i>");
		//raise emmy lust 20 points
		//Set emmy status “Massaging” for 2 hours. (Makes it so any future slow-fucks cause quick and dirty cums)
		processTime(4);
		pc.lust(5);
	}
	output2(txt);
	IncrementFlag("EMMY_MASSAGED");
	emmy.createStatusEffect("Massaging",0,0,0,0,false,"PlaceholderIcon","Description",false,120);
	emmyCumtrolMenu();
}

//Slow Fuck
//Already slow fucking
//Emmy is already being slowly fucked by herm harness. Inputting this command twice wouldn’t do anything.
public function emmySlowFuckHermHarness():void
{
	if(emmy.bellyRating() >= 40)
	{
		gravidEmmyHarnessOverride();
		return;
	}
	clearOutput2();
	showName("SLOW\nFUCK");
	showBust("");
	var txt:String = "";
	txt += ("Sending command...");
	txt += ("\nCommand received...");
	txt += ("\nNow simulating a slow fuck...");

	var came:Boolean = false;
	//Emmy is present
	if(currentLocation == "KIHASHOP")
	{
		showEmmy();
		txt += ("\n\n<i>“Ahhh,”</i> Emmy groans in ");
		if(emmy.hasStatusEffect("Massaging")) txt += ("relief");
		else txt += ("surprise");
		txt += (". <i>“");
		if(emmy.hasStatusEffect("Massaging")) txt += ("This is so much nicer... ");
		txt += ("F-feels like there’s a bitch sitting in my lap, grinding up and down.”</i> Her tongue lolls out, and her eyes glaze over, somewhere far away. <i>“She’s wet and warm, and by the stars, she’s squeezing me.”</i> Leaning over the countertop, the smitten hermaphrodite giggles, <i>“");
		if(emmy.hasStatusEffect("Massaging")) txt += ("Mmm, s-so good. I can-ah... so much cum... so much cum in my balls for this bitch....”</i> The jackal sounds dangerously close to blowing her load.");
		else txt += ParseText("Nice and slow, but she feels better and better [pc.name].”</i> Emmy’s nipples look like a pair of smuggled daggers trying to cut their way out of her suit from the inside.");

		//Massaging
		if(emmy.hasStatusEffect("Massaging"))
		{
			txt += ("\n\nYou ask her if she’s going to cum");
			if(pc.isBimbo()) txt += (", licking your lips");
			txt += (".");
			txt += ("\n\nEmmy glances your way, then shudders. A ribbon of drool dangles from the tip of her flopping tongue down to her breasts, drawing shining lines across fabric that seems too tight against her jutting nipples, each seemingly as engorged as the thick shaft that juts between. That fat jackal-cock jerks wildly, sending ripples quaking through her burdensome breasts, and Emmy doubles over, her suit-sheathed claw-tips scrabbling wildly on the countertop, her hips quivering and jerking, yoked to the invisible passions ravaging her mismatched maleness.");
			txt += ("\n\n<i>“S-stars,”</i> the lust-lost hermaphrodite stammers, nearly choking on the word. She pushes herself up only to start aggressively humping the counter, squeezing it between her body and the only surface in the shop liable to be harder than herself. Her cock bulges, fat and happy. Surges of fluid distend the length of it on their way to her crest, bulging her suit like a condom before her herm harness pumps the glorious goo back around and into her black-lipped cunt.");
			txt += ("\n\n<i>“So much!”</i> Emmy gasps and groans, collapsing to her knees. <i>“So m-much cum!”</i> She cradles her cock and her belly, squeezing and rubbing one as eagerly as the other. The jackaless’s eyes roll back, and her bulging balls shrink ever so slightly. She shudders twice more in the throes of her artificially-induced ecstasy, then slumps back, practically boneless, against the wall.");
			txt += ("\n\nKneeling nearby, you ask her if she’s all right.");
			txt += ("\n\nHalf purring, half groaning, Emmy slurs, <i>“Totally allrrright... mmm...”</i> She blinks pleasure-bleary eyes and looks up at you. <i>“You fucking tease, you. I’m gonna have a hard time keeping it together if you do that when I’m with a customer, you know.”</i> She staggers up to her feet, planting a kiss on your lips. <i>“But I’ll manage. Now give me a second to straighten up this mess and recover, then we’ll see about getting you some other new toys, if need be.”</i>");
			txt += ("\n\nIt sounds like a plan.");
			emmy.loadInCunt(emmy,0);
			emmy.loadInCunt(emmy,0);
			came = true;
		}
		//Not massaging
		else
		{
			txt += ("\n\nLicking her lips, Emmy briefly tries to pull her tongue back into her mouth, but it rebelliously flops out once more, drooling saliva all over the cleavage. The added moisture makes her already shiny suit gleam like chromed metal, further highlighting the throbbing crown of her toy-teased dick. Pressing down on her breasts with her forearms, the pleasure-drunk herm happily transforms her slick, melon-sized tits into a second cunt for her cock to ream and slumps down against the shop’s back wall, grinning like an idiot.");
			txt += ("\n\nYou ask her if she’s going to be all right.");
			txt += ("\n\n<i>“Mo-oh-ore than all right!”</i> Emmy babbles in response while stroking her blunted claw-tips around the periphery of her nipples. It suddenly makes a lot more sense why she keeps those things trimmed so short. <i>“I’m just gonna sit here.”</i> She giggles and dreamily sighs, staring down and her own quivering cock-head. <i>“It’s so weird, I can SEE my dick right there, but her pussy... her pussy is all around it, clutching it, squeezing it... mmm... loving it.”</i>");
			txt += ("\n\n<i>“What about your shop?”</i>");
			txt += ParseText("\n\nEmmy gasps and struggles up to her feet. Her tongue keeps sliding out to alternately pant and drool, and she keeps wiggling her hips from side to side, but some alertness returns to her eyes. <i>“I, uh... I can run it just fine. See, [pc.name]? Nobody will know a thing.”</i> A bubble of pre-cum forms on her pointed tip, then drains away, accompanied by a low groan from the jackal. You nearly miss it.");
			txt += ("\n\n<i>“What was that?”</i>");
			txt += ("\n\n<i>“N-nothing,”</i> Emmy half-answers, half-purrs. <i>“I’m just having an off day. D-did you want to see my merchandise? Maybe check out this over-charged bazooka?”</i>");
			txt += ("\n\nYou step away and look back at your Codex, wondering if you can surprise her with something else.");

			emmy.createStatusEffect("Slow Fucking",0,0,0,0,false,"PlaceholderIcon","Description",false,90);
		}
		processTime(10);
		pc.lust(8);
	}
	//Not there
	else
	{
		//Not massaging:
		if(!emmy.hasStatusEffect("Massaging"))
		{
			txt += ("\n\nYou wonder how the poor herm is reacting to her sex-toy suddenly leaping to life, wrapping her cock in the slow, back-and-forth strokes of a wet and willing woman. That kind of stimulation isn’t likely to bring her off for some time. Any customers lucky enough to come into her shop are going to see quite the wanton display. You wonder if she’ll be able to keep her hips from shaking while spouting off about the virtues of KihaCorp’s products.");
			//Set <i>“Slow Fuck”</i> status for 90 minutes.
			emmy.createStatusEffect("Slow Fucking",0,0,0,0,false,"PlaceholderIcon","Description",false,90);
		}
		//Massaging
		else
		{
			txt += ("\n\nPoor girl. You instructed her toy to give her a massage with no hope of relief. She deserves a chance to cum... but only if she can do so under the velveteen caresses of a simulated pussy’s languid, back-and-forth grind. Of course, with the warm up you gave her, a hyper-sexed hermaphrodite like Emmy is sure to go off hotter and harder than a bundle of roman candles.");
			txt += ("\n\nYou briefly picture Emmy bent over her counter, panting hotly as bubbles of cum pump down the side of her cock and up into her waiting cunt, flooding it with her own backed-up, sticky slickness until her very womb bulges under the pressure.");
			txt += ("\n\nShe ought to enjoy that.");
			emmy.loadInCunt(emmy,0);
			emmy.loadInCunt(emmy,0);
			came = true;
		}
	}
	output2(txt);
	emmyCumtrolMenu();
	if(came)
	{
		clearHermHarnessStatii();
		clearGhostMenu();
		if(currentLocation == "KIHASHOP") addGhostButton(0, "Next", emmyMainMenuPostHermHarnessgasm);
		else addGhostButton(0, "Next", showCodexExtra);
	}
}

//Hard Fuck
public function emmyHermHarnessHardFuck():void
{
	if(emmy.bellyRating() >= 40)
	{
		gravidEmmyHarnessOverride();
		return;
	}
	clearOutput2();
	showName("HARD\nFUCK");
	showBust("");
	var txt:String = "";
	txt += ("Sending command...");
	txt += ("\nCommand received...");
	txt += ("\nConfirm setting: Hard Fuck, Y/N? Y");
	txt += ("\nCommand approved...");
	txt += ("\nSetting parameters to ");
	txt += RandomInCollection([
		"bubbly rahn",
		"backed-up kui-tan",
		"wanton kaithrit in heat",
		"lusty kaithrit virgin",
		"New Texan cow-girl",
		"Nivas Oxonef",
		"galotian",
		"KihaCorp class 6 companion droid",
		"a parade of ausar in heat",
		"siren comfort girl",
		"New Texan tit-fuck",
	]);
	txt += ("...");
	txt += ("\nFuck in progress...");
	//With Ems
	if(currentLocation == "KIHASHOP")
	{
		showEmmy();
		//Emmy being slow fucked or massage teased
		if(emmy.hasStatusEffect("Massaging") || emmy.hasStatusEffect("Slow Fucking"))
		{
			txt += ("\n\nEmmy inhales deeply as your command takes effect. Her head lolls back, and her eyes roll back until only the whites are visibly. Trembling spasmodically, her softly padded hips violently jerk, thrusting into the jackaless’s imaginary lover. You can only imagine what’s going through her head - besides the white-hot bolts of pleasure. She’s smiling so wide and drooling enough spit for some of it to puddle in the heaving crevice between her boobs, the very picture of big-breasted bimbo bliss.");
			txt += ("\n\n<i>“You okay, Ems?”</i> You ask, eyeballing her wobbling knees and swelling balls.");
			txt += ("\n\n<i>“Mmmm...”</i> she moans back at you, moments before sagging back into your arms. The muscles in her belly, barely visible through fur and fabric, twitch fitfully. Her nipples could cut glass; you don’t think you’ve ever seen them so prominent, nor so clearly outlined against the glossy surface of her suit. The size of Emmy’s toothy smile is only rivalled by the tumescence of her rock-hard cock. It strains against its bonds, clearly determined to strike out away from Emmy’s body and into the imaginary folds of a hard-fucking lover.");
			txt += ("\n\nSprawling out the moment you let her go, the hyper-sexed herm arches her back and cries out in ecstasy loudly enough to be heard from a street or two away. Her cock easily reaches beyond the tops of her tits in spite of the sub-par angle, revealing itself a split-second before her knot swells into some kind of monstrous gourd.");
			txt += ("\n\n<i>“So tight! Yesssss!”</i>");
			txt += ("\n\nReally? You’ve seen her toy, and the penile sheath it comes with doesn’t seem nearly thick enough to simulate the kind of sensations your canid lover seems to be experiencing.");
			txt += ("\n\nEmmy’s approving growl thoroughly disagrees with your assessment, and so do the bulges forming at the neckline of her suit. Each is easily the size of an orange when it first appears, packed full of a single squirt of her voluminous spunk. They wick away almost as fast as they appear, visible as small bumps that travel down the side of her twitching boner and around the side of her nuts, pumping the endless waves of gooey love directly into her hungry womb.");
			//Bimbo
			if(pc.isBimbo()) 
			{
				txt += ("\n\nUnwilling to be entirely left out of the act, you get down and pull her mouth to yours, exchanging a soul-searing kiss. Your tongues twist around one another, every bit as hot and wet as the action down below. You can think of no better way to guide your lover into the orgasm of her dreams - a mechanical toy down below, worshipping her yummy cock, and you up above, showing just your boundless love in the only way you know how - limitless physical affection.");
				txt += ParseText("\n\nEmmy nips your lip, but that just makes it hotter. Your tongue caresses the sharp points of her canines. Her breath started far hotter and heavier than your own, but after a few moments of making out, you’re panting just as hard. The softness of her hair in your fingers is a marvel, and the look of love in her eyes when she she opens them is second to none. One of her paws finds its way to your [pc.butt] and squeezes affectionately.");
				txt += ("\n\n<i>“Just couldn’t resist joining in, could ya?”</i>");
				txt += ("\n\n<i>“Nope.”</i> You kiss her on the nose.");
				pc.lust(45);
			}
			//Nonbimbro
			else
			{
				txt += ("\n\nUnable to keep your hands entirely to yourself, you reach down and take her breasts into your hands, at first gently groping them, then squeezing them with more and more excitement as you watch her orgasm redouble. Your fingers find their way to the perky tips of her nipples and gently pinch and pull. After dragging a few gasps from Emmy’s mouth, you entertain yourself by stroking one finger around an areola and your hand along her bulging prick.");
				txt += ("\n\nEmmy seems to cum forever under your playful touches, her belly gently rising with each passing second, filled with her own virile cream.");
				txt += ("\n\n<i>“Enjoying yourself?”</i> the blissfully smiling jackaless asks, stretching languidly.");
				txt += ("\n\nYou grin back at her and squeeze.");
				txt += ("\n\n<i>“Eep!”</i> she gasps. <i>“Just can’t keep your hands to yourself... not that I can blame you.”</i>");
				txt += ("\n\nYou kiss her on the nose.");
				pc.lust(15);
			}
			//Merge
			txt += ("\n\nEmmy struggles up to her feet, her knot still half-inflated, like her cock sprouted from a small melon. <i>“Guess I better get back to running the store, huh? Wonder how many customers will ask me about my baby.”</i> She pats her bulging belly, careful not to bump her still-turgid penis. <i>“Don’t hit me with that too many times or you’ll wind up making me pop!”</i> Emmy giggles, and kisses you on the lips. <i>“Just holler at me if you need anything else - besides a free show. You’ve got buttons that’ll do that.”</i>");
		}
		//Emmy not under any other effects.
		else
		{
			txt += ParseText("\n\n<i>“O-oooh!”</i> Emmy gasps, rocking back on her heels, then doubling over the countertop, her hips wiggling. <i>“You didn’t have to s-set it on... mmm... on high right away!”</i> Shaking her hips, the well-hung herm moans throatily, her tail flapping wildly back and forth like a flag caught in a hurricane, knocking over knicknacks and display models alike. <i>“F-f-fuck, I can’t... I can’t. [pc.name]... please!”</i> She drops to her knees behind the counter and briefly looks up at you, big puppy-dog eyes unsure if they should glare accusingly or roll back and forget their irritation. The rigid surface of her sales counter entirely eclipses her form when she slides down onto her back.");
			txt += ("\n\n<i>“You doing okay there, Ems?”</i> you ask with a grin.");
			txt += ("\n\nLicking her chops, the jackaless doesn’t bother to reply. Her whole body is writhing, her hands roaming across her taut, shrink-wrapped body, in total abandon, squeezing and stroking every millimeter of panting flesh. Her cock strains, a monument to her own inhuman lust. It strains her jumpsuit, unwilling to be contained by such a feeble enclosure, delirious with desire to strike out from Emmy’s own body and into the hard-fucking partner assailing its senses. A big, fat bubble of contained pre-cum has formed at the tip of her cock, bulging the white and red suit into sheer obscenity, waiting to be wicked away into her womb by her herm harness.");
			txt += ("\n\nYou kneel beside Emmy and teasingly run your fingertip along the jutting length, watching it rhythmically quiver and shake to a tempo you’ll never truly understand. The distended pre-bubble abruptly doubles in size, then begins to shrink as the herm harness kicks into action, wicking Emmy’s sinful deposit away into a soon-to-be creamed cunt.");
			txt += ("\n\n<i>“Yesss!”</i> Emmy finally answers, biting her lower lip hard enough to draw a trickle of blood. <i>“Yes! Yesyesyesyes!”</i>");
			txt += ("\n\nIt’s tough to say whether she’s answering your question or simply vocalizing her pleasure. Whichever it is, the slutted-up jackal-girl is clearly rising to her peak, driven from flirty shopgirl into quivering puddle of fuck in the span of a minute or two by the expensive little toy between her legs. You poke and prod at her swelling knot, marvelling at the distended veins, feeling them pulse under your fingertips. Emmy’s moans transition into feverish pants, and her hips levitate from the ground like a luxury ship about to depart from port.");
			txt += ("\n\nBy the void, this girl can cum. The first blast creates a jizz-balloon the size of a grapefruit, and before it finishes draining away, Emmy is packing a second load in on top of the first. Her fuzzy balls are twitching and jumping, wringing every drop of spooge out of their seemingly infinite interior and into the hermaphrodite’s incredible ejaculation. The herm harness can barely keep up. You wonder what it must feel like - to both feel like you’re cumming into a slutty minx’s cunt and being flooded with frothing spunk. If Emmy’s expression is anything to go by, it feels like heaven.");
			txt += ("\n\nYou refuse to be a passive observer and stroke her length, pumping up and down, watching her knot swelling beyond all reasonable measure. Her cock seems to approve, if the size of her ejaculations are anything to measure by. The herm harness’s internal pumps can barely keep up. No sooner does one spunky balloon disappear than Emmy refills it, her inexhaustible nuts showing no sign of slowing.");
			txt += ("\n\nCradling her paunched middle, Emmy gradually comes back down to earth, making smaller and smaller bubbles at the apex of her erection to chart her progress back towards normalcy.");
			txt += ("\n\nThe screen of your Codex reads, <i>“Ejaculation complete. Wind down cycle in progress.”</i>");
			txt += ("\n\nWondering just what that entails, you caress her knot and watch Emmy smile and gasp. Her tongue hangs out the side of her mouth, drooling down her cheek, but it’s her pupils that you’re watching. They climb back down from behind her eyelids and fix on your face, shining happily.");
			txt += ("\n\n<i>“You fucker,”</i> Emmy half-growls, half-moans. <i>“I’m going to have to get good at excusing myself to the not-so-little girls’ room, aren’t I?”</i> She wraps her arms around your neck and kisses you on the nose. <i>“Maybe give me a little warm-up next time, huh?”</i> Snuggling in, she kisses you on the lips. <i>“I bet you could make me cum twice as hard if you got my motor going first.”</i>");
			txt += ("\n\nYou prod her cum-flooded middle and ask, <i>“Sure you can handle that?”</i>");
			txt += ParseText("\n\n<i>“I’m a big girl, [pc.name]. I can handle myself just fine.”</i> Emmy dreamily caresses her middle and sighs before kissing you again. <i>“Now let me up. I’ve got to pick up the shop before someone walks in on us!”</i>");
			txt += ("\n\nGrinning mischievously, you help the jackaless to her feet and leave her to it.");
			pc.lust(13);
		}
		processTime(15);
	}
	//Emmy not there, massage in progress
	else
	{
		if(emmy.hasStatusEffect("Massaging") && !emmy.hasStatusEffect("Slow Fucking"))
		{
			txt += ("\n\nThat should give your infinitely fuckable, furry girlfriend the finish she’s no doubt been waiting for since you turned on the massage function. You wonder how she’s handling the present you’ve delivered her. Has the pleasure knocked her to the floor, set her legs akimbo, and left her hips to fruitlessly thrust into a phantom lover’s luridly imagined attributes?");
			if(pc.isBimbo()) txt += (" You kind of wish you could watch, or unzip her suit and let her thrust into you.");
			else if(!pc.isAss()) txt += (" Hopefully she doesn’t get in trouble.");
			else txt += (" Hopefully her boss is there to see the show.");
			txt += ("\n\nOnce the herm harness detects her orgasm, it should shut down on its own, leaving your toy-tied slut to pant and stroke the taut fur of her belly until her senses return.");
		}
		//Emmy not there, slow fuck in progress
		else if(emmy.hasStatusEffect("Slow Fucking"))
		{
			txt += ("\n\nThat ought to put the infinitely aroused ausar on the path to the release she so desperately craves. You doubt she’ll last long, not after having a slow start to brew a load in her balls. The fuzzy little guys must be positively churning with seed, perhaps even swollen an over-abundance of the pearly goo, just waiting to burst out. She’s probably climaxing right now, shuddering and shaking while her herm harness goes hog-wild on her cock, milking every drop of spunk out of it and straight down into Emmy’s womb. You briefly wonder if the sensation makes her orgasms last longer or just sets off a second at the end of the first.");
			txt += ("\n\nThat ought to keep her contented until you can visit again.");
		}
		//Emmy not there, nothing in progress
		else
		{
			txt += ("\n\nThat ought to give your toy-bound slut a little something to wake her up from her boring job. She was probably lazing about at the counter, trying not to pull up porn from the extranet, and out of nowhere her cock gets wrapped in irresistable erotic sensation, a wet-feeling press of faux flesh and fast fucking that leaves no room for self control. If Emmy wasn’t rock hard before, she must be now. You bet she’s struggling not to hump a hole in the metal walls of her counter. Her instincts must be demanding she thrust into something, anything to complete the illusory experience presently sheathing her achingly throbbing genitals.");
			txt += ("\n\nA few minutes are all it should take to reduce your jackalicious girlfriend into a puddle of self-impregnating semen and debased contentment. Who knows? Maybe she kept it together, or maybe she’s stumbling up from the floor on wobbly legs and trying to find the controls to give herself a second dose.");
		}
		processTime(1);
	}
	output2(txt);
	if(emmy.hasStatusEffect("Massaging")) emmy.loadInCunt(emmy,0);
	if(emmy.hasStatusEffect("Slow Fucking")) emmy.loadInCunt(emmy,0);
	emmy.loadInCunt(emmy,0);
	clearHermHarnessStatii();
	clearGhostMenu();
	if(currentLocation == "KIHASHOP") addGhostButton(0, "Next", emmyMainMenuPostHermHarnessgasm);
	else addGhostButton(0, "Next", showCodexExtra);
}

public function emmyCumtrolMenu():void
{
	clearGhostMenu();
	
	if(!emmy.hasStatusEffect("Massaging") && !emmy.hasStatusEffect("Slow Fucking")) addGhostButton(0,"Massage",pushEmmyMassage);
	else addDisabledGhostButton(0,"Massage","Massage","Emmy’s already being slowly teased.");
	if(!emmy.hasStatusEffect("Slow Fucking")) addGhostButton(1,"Slow Fuck",emmySlowFuckHermHarness);
	else addDisabledGhostButton(1,"Slow Fuck","Slow Fuck","She is already being slowly fucked.");
	addGhostButton(2,"Hard Fuck",emmyHermHarnessHardFuck);
	
	addGhostButton(14,"Back", showCodexExtra);
}

//Fuck Her
//PC dominant on top type. Probably need a version for lady types and dude types.
public function fuckEmmyProper():void
{
	clearOutput();
	showEmmy(true);
	//Pre-herm harness intro:
	if(flags["EMMY_QUEST"] == 5)
	{
		output("<i>“I want to fuck you");
		if(pc.isBimbo()) output(", hot stuff");
		output(",”</i> you answer, all but humping the jackeless with your eyes.");
		output("\n\nEmmy purrs, <i>“F-fuck. Okay. Just... gimme a second.”</i> Rolling off of you, the flirty company representative embraces her inner slut, unzipping her jumpsuit with deliberate slowness, transforming the simple act of undressing into a sizzling striptease. The edges of her skin-tight suit catch on her jutting nipples for a half-second before popping them into view. Her cock comes into view not long after, as eager to make an appearance as the rest of her. Rolling her hips back and forth, Emmy points her plush ass in your direction as the fabric is teased past her cheeks, revealing two supple half-moons and a fuzzy, well-stuffed sack.");
		output("\n\n<i>“Are you ready to fuck me, babe? And I mean really fuck me?”</i> Emmy looks back at you over your shoulder, any nervousness long ago burned away by the fires of her desire. <i>“It’s just me and my pussy over here.”</i> She pulls one foot out and then the other, presenting her nude body to you in its entirety. <i>“I’m all yours, [pc.name].”</i> She licks her lips and purrs, <i>“Even if it makes me a cock-addict. Even if I discover I need a bellyful of cum to function.”</i> Spreading her pussy wide, Emmy moans, dripping from both sexes onto the floor. <i>“Take me.”</i>");
	}
	//Normal
	else if(emmy.bellyRating() < 25)
	{
		output("<i>“I think you need fucked just as badly as I need to fuck,”</i> you tell the lecherous hermaphrodite with a knowing smile. <i>“I think you need my cum inside you just as badly as I need to be inside you.");
		if(pc.isBimbo()) output(" Gosh! You make me say the dirtiest things!");
		output("”</i>");
		output("\n\nThe corners of Emmy’s inhuman mouth quirk upward into a furry approximation of a grin. <i>“Oh, you think that do you?”</i> She pulls her suit down in a quick practiced motion. She’s gotten a lot better at this since the two of you started fucking, and her herm harness isn’t far behind it. <i>“You think I’m the kind of girl to just drop what I’m doing, bend over, and beg for you to stuff me full of cock?”</i> Emmy’s nipples shine brighter than the paint on a brand new ship, and her dick looks big enough to punch her square in the chin. <i>“Well I have news for you, lover.”</i> Dropping down onto her hands and knees, the jackaless wiggles her hips in your direction, presenting her ass to you and simultaneously shaking loose a drizzle of her copious cunt-juice. <i>“You’re right.”</i>");
	}
	//Cum-filled
	else
	{
		output("<i>“I think you need a little more cum in your belly,”</i> you tell the lecherous hermaphrodite with a knowing smile. <i>“Got room for a little more?”</i>");
		output("\n\nEmmy’s lips quirk upward. <i>“But someone else already filled me full of cum...”</i> She traces a finger over her gravid-looking tummy and giggles. <i>“But I guess there’s always room for more, if you don’t mind having the sloppiest seconds in the history of intergalactic erotica.”</i>");
		output("\n\nSomehow, you think you can survive using your over-endowed girlfriend’s ridiculous amounts of ejaculate as lubricant. If anything, it’ll just make it that much hotter and wetter. <i>“I don’t mind.”</i>");
		output("\n\n<i>“Good,”</i> Emmy answers, wiggling her way out of her KihaCorp-branded jumpsuit and custom-ordered sextoy. <i>“Because I was going to demand you give me a good fucking even if you said no.”</i> She blushes as a small waterfall of ivory cream pours from between her suddenly unplugged thighs, but that doesn’t stop her from crouching down above the pearlescent puddle on all fours, ass upraised and tail wagging. <i>“Come and get it.”</i>");
	}
	output("\n\nYou need no further encouragement ");
	if(!pc.isCrotchExposed()) output("to strip out of your [pc.clothes] and fish out your [pc.cocks]");
	else output("to grab hold of your [pc.cocks] and approach");
	output(". Almost as if it can sense just how wet Emmy’s plump vag has become, [pc.oneCock] ");
	if(pc.lust() >= 80) output("throbs mightily in your palm. You’re so horny, you don’t know how you waited this long.");
	else output("leaps up to full attentiveness, eager and ready to go.");
	output(" The jackal visibly drools at the sight of your firm penis, even while her own pulses feebly against the floor");

	if(emmy.bellyRating() < 25) output(", drooling pre.");
	else output(", drooling into the puddled spunk below.");

	var x:int = pc.cockThatFits(emmy.vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	output("\n\n<i>“Stick it in already!”</i> Emmy pants, her tail waving back and forth. Pussy juice beads on her clit, dripping to the floor in the kind of maddening rhythm that demands you stop and do something about it.");
	output("\n\nWhat are you to do but plug that leak? Gripping yourself by the [pc.sheath " + x + "], you line your [pc.cockHead " + x + "] up with Emmy’s more than ready snatch and gently press it against her lips.");
	output("\n\n<i>“Ooooh.”</i> Emmy’s lips are stretched out in an ‘O’ of pleasure from the meager contact, her eyes slightly crossed. <i>“M-more.”</i>");
	output("\n\n<i>“");
	if(pc.isNice()) output("Your wish is my command,");
	else if(pc.isMischievous()) output("Why didn’t you say so earlier?");
	else output("You’ll get more, all right,");
	output("”</i> you wryly retort, midway through spreading her oily cunt-lips open.");

	output("\n\nShe is drenched. No wonder she wears water-tight clothes. A pussy like hers would turn any other article of clothing into a wetsuit in the span of seconds. Rivulets of her excitement slide down the length of your [pc.cock " + x + "], polishing it in anticipation of its vaginal dive.");
	if(pc.balls > 0) output(" Your [pc.sack] is soon dripping with the excess excitement, just like Emmy’s smoothly matted orbs.");
	output(" The first inch you push inside feels like being swaddled in silk... inside a hot tub. Her muscles clutch and tug at you, demanding you feed her more of your turgid mast despite their lack of leverage.");
	pc.cockChange();
	output("\n\nReaching around to fondle her ill-conceived clit, you push the rest of the way inside.");
	if(emmy.bellyRating() >= 25) output(" Cum slops out over your [pc.legOrLegs], but you barrel on in regardless of the displayed spunk.");
	output(" Thrusting inside ");
	if(pc.cockVolume(x) >= emmy.vaginalCapacity(0) * .80) 
	{
		output("is far more difficult than you would have imagined, given her wetness, but you manage all the same. This girl is a tight fit for your tremendous boner. You’ve filled her channel to capacity and stretched her cunt to capacity");
		if(emmy.bellyRating() < 25) output(", even distended her belly in the shape of your tip.");
		else output(", even left a small bulge in her cum-swollen belly from your tip.");
		output(" If she weren’t so blessedly juicy, you’d never be seating your [pc.sheath " + x + "] against her flush labia.");
	}
	else if(pc.cockVolume(x) >= emmy.vaginalCapacity(0) * 0.5)
	{
		output("is easier than you could’ve imagined");
		if(pc.cockVolume(x) >= emmy.vaginalCapacity(0) * 0.7) output(", given your size");
		output(". It’s one long, smooth stroke over every inch and facet of your [pc.cockNoun " + x + "], only coming to a close when your [pc.sheath " + x + "] is smushing her flush cunt-lips flat between your interlocked pelvises. You almost wish you had more cock, just so that you could savor the feeling of that first, slow slide inside.");
	}
	else output("is almost too easy. Her capacious cunt devours your [pc.cockNoun " + x + "] in an instant, the only evidence of its passage the long wet slurp that filled the air. You push your hips as far forward as you can go, crushing her puffy vulva against your pelvis, desperate for even a half-inch more of that pleasure.");
	//Other dick!
	if(pc.cockTotal() > 1)
	{
		output("\n\nEmmy’s tail, still wagging, is like a feather-duster on your other penis");
		if(pc.cockTotal() > 2) output("es");
		output(", brushing back and forth, teasing the neglected length");
		if(pc.cockTotal() > 2) output("s");
		output(" relentlessly. In no time at all, bits of pre-cum stick into her fur, slicking what was once a gentle tickling into something of a slap-job. Part of you wants to do something about it, but it actually feels pretty nice. Besides, the molten reactor between her legs needs stirring.");
	}
	//merge
	output("\n\nYou give the horny bitch exactly what she wants, grabbing her hair and yanking her head back. She just moans and pushes back against you, bouncing your hips back a few inches, then slapping into your [pc.thighs] as you slide back into her. Needing no further encouragement, you start fucking her in earnest. It isn’t the sort of slow love-making you might expect. It’s a feral, bestial rut, a wet and messy bang that has droplets of sweat and sex-juice flying from your bodies in every direction.");
	output("\n\nThe lurid sounds of your coupling only encourage you both to fuck that much harder. The wet slap of hips to hips fills you with determination to make the next that much harder and more powerful. The growls coming from Emmy’s throat all but demand you nip and bite at her neck as you copulate. Her curvy ass-cheeks wiggle and flex against your hand, demanding rough slaps that make her creaming cunny squeeze all the tighter.");
	//Customer
	if(rand(3) == 0) output("\n\nNeither of you bother to respond when the door to her shop whisks open to show an incredibly surprised kaithrit. His shocked expression and whispered apology could never intrude into the sexual heat that swirls around you and Emmy. You just fuck her harder, and let the echoing fuck-sounds chase the poor guy out into the street. When the door swishes closed, Emmy moans louder, as if she had been trying to hold it in all this time. <i>“Fuuuuuuck!”</i>");
	//Cumslide
	else if(rand(2) == 0)
	{
		output("\n\nWhen Emmy slips in her own ");
		if(emmy.bellyRating() < 25) output("pre-");
		output("cum and drags you to the floor, you roll right along with it, pinning her wrists to the floor. She turns her head to look back at you, her visible eye dilated and hungry, her lips pulled back in a feral grin. Her pussy quivers, and you resume fucking it, even from the awkward angle, slapping into her cushy ass hard enough to make her slide back and forth in her own puddled slut-juice.");
	}
	//Picture time
	else output("\n\nWhen Emmy pulls out a holo-recorder from behind the counter and aims it back at you to capture her being taken, you nearly stop. Surely it’s capturing her waggling, drooling tongue, swaying tits with her nipples dragging on the floor, and oozing cock - just as surely as it captures every ass-quaking slap against her cushy derriere. You put on a grin for the camera, trying to make a show of it. Meanwhile, Emmy sets it down on the floor, positioned to capture every salacious detail.");
	//Merge
	output("\n\nClimax is an inevitability. A crew of bounty hunters could kick down the door, and you’d still do your duty before they could drag you off the lust-drunk jackal-girl. Someone could dump gallons of ice-cold water over your sweating forms, and you’d cum to the feeling of her contracting cunt squeezing down and dagger-hard nipples in your hands. With your heart hammering in your chest, your hips launch into overdrive, bouncing the hung herm around like a drunk on a mechanical bull. ");
	if(pc.ballSize() < 20 && pc.balls > 0) output("Each lurid slap of your [pc.sack] against Emmy’s juicing lips is a ringing endorsement of your own breeding urges. White hot bolts of bliss spur you with each ball-basting slap of nut to cunt, and the feeling of your cum bubbling up and out, sliding through your middle and filling your urethra, is irresistible.");
	else if(pc.balls > 0) 
	{
		output("Your tremendous sack jostles and rubs against Emmy’s own dangling, cunt-slicked nuts, feeling progressively bloated with every passing moment. That warm, wet heat slides up into you, filling your [pc.cocks] from the inside out, pressurizing them with what is surely a tremendous gift for your slutty lover’s ");
		if(emmy.bellyRating() >= 25) output("pre-filled ");
		output("womb.");
	}
	else output("Each time you bottom out, abdominal muscles clench uncontrollably, working up a nice, thick load for your paramour’s puffy pussy, loading your [pc.cocks] full of what exactly what your slutty girlfriend craves.");

	output("\n\nEmmy cums first. She doesn’t scream or moan any differently. Her eyes don’t roll back any farther than they already have. She’s even still fluttering around your length like a high-class whore - just as before, but you can <i>hear</i> her orgasm in the sudden, splattering sound of her prick firing its load. Thick cum hits the floor in waves. It sounds like someone is dumping out a dozen milkshakes between Emmy’s legs, one after the other.");

	output("\n\nWhen you feel the thick tide coating your ");
	if(pc.hasKnees()) output("[pc.knees]");
	else output("[pc.footOrFeet]");
	output(", you cross beyond the point of no return. Your [pc.cock " + x + "] seems to effortlessly seat itself inside.");
	if(pc.cockTotal() == 2) output(" Its sibling happily pulses between her clenching cheeks");
	else if(pc.cockTotal() > 2) output(" One of its siblings pulses happily between her cheeks while the others bounce on top of her furry ass, ready to paint the half-moon globes of her butt [pc.cumGem].");
	output(" Emmy’s fervent ejaculation tapers off just in time for the beginning of your own. It’s heaven - white hot, endlessly clenching and relaxing heaven.");
	output("\n\nEmmy sucks your finger into her mouth while you go off, looking at you with her hooded, infinitely pleasured bedroom eyes, watching you twist and squirm while you’re bound inside her velvet tunnel. You aren’t sure when she got ahold of your hand, nor do you really care. Her suckling is just another drop of pleasure in an ocean of ecstasy.");
	if(pc.hasKnot(x)) output(" Best of all is the way her cunt grips your [pc.knot " + x + "]. She holds onto it, her walls giving just enough to accept it while her lips cling tightly to the narrower parts behind it.");
	if(pc.cumQ() < 8) output(" Emmy’s so wet that you wonder if you’ll even be able to spot your [pc.cum] when you pull out. You are feeling a little dry. Maybe you could hold off a bit and give her a real creampie next time.");
	else if(pc.cumQ() < 2000) output(" Emmy’s so wet that you can’t really feel any difference from your spurting [pc.cumNoun], but by the time you finish, there’s a distinctive, sticky sheen on her inky lips that could only have come from your outstanding finish.");
	else if(pc.cumQ() < 7000) 
	{
		output(" Emmy’s so wet that at first, you can’t really feel much difference, but your body is too bountiful to be denied. You lose contact with her walls");
		if(!pc.hasKnot(x)) output(" briefly");
		output(", but something presses down tighter than before - her fluids and yours, intermingled.");
		if(!pc.hasKnot(x)) output(".. at least until you feel the slimy waterfall cascading out of her creamed cunt.");
	}
	else
	{
		output(" Emmy is incredibly wet, but no amount of her vaginal secretions could ever compare to the deluge of [pc.cum] you pour inside her. The first blast of spunky juice instantly pressurizes her cunt, squeezing your [pc.cock " + x + "] tighter while you pour yet more into her womb.");
		if(!pc.hasKnot(x)) output(" A waterfall of the excess spills out the back, but that doesn’t stop her belly from expanding, gaining a bit of slut-pudge for being such a talented lover.");
		else output(" Her belly has no choice but to expand with your knot blocking the only other exit. You stuff so much into her that she looks positively pudgy with your spooge - your cum-pregnant girlfriend.");
		//Massive ejacs!
		if(pc.cumQ() >= 15000) 
		{
			output("\n\n")
			if(pc.hasKnot(x)) output("There’s not a knot in the known universe that can hold back that much liquid. ");
			output("Emmy’s body can’t possibly contain everything you’re shooting, and with her furry belly stretched into a jiggling [pc.cumNoun]-balloon, there’s nowhere for your continued blasts of seed to go but out. Torrential streams spray back against your hips, dripping down to mix into the jackaless’s premade sperm-lake. Her composure falls apart with this new sensation, and she cradles her gravid tummy, raking her fingers through her fur while her expression flits between ecstasy and agony.");
		}
	}
	//Merge
	output("\n\nThe minute you stop cumming, you wrap your arms around her and collapse to the side, panting. Neither of you speaks - perhaps too winded, perhaps too disturbed by how messy collapsing into a lake of jizz has made you. Instead, you enjoy the post-coital bliss for a moment, still locked together and dreamily murmuring sounds of loving enjoyment.");
	clearHermHarnessStatii();
	processTime(27);
	pc.orgasm();
	emmy.orgasm();
	//[Next]
	clearMenu();
	addButton(0,"Next",emmyFuckEpilogue,x);
}

public function emmyFuckEpilogue(x:int):void
{
	clearOutput();
	showEmmy(true);
	if(pc.hasKnot(x)) output("Extricating yourself takes longer than you admit, but that does mean you get to enjoy feeling her squeeze down on your sensitized knot that much longer. ");
	output("Once you separate and wipe the worst of the sexual sludge off your soaked bodies, Emmy giggles and asks you if you want to take a shower with her... or if you want her to squeeze back into a jumpsuit and marinate in your juices. Of course, if you don’t take the shower, you’ll look and smell like you just stepped out of an ultra-porn orgy as well. Judging by the way Emmy is licking her lips, she might like that. ...Monsters might too.");

	clearMenu();
	addButton(0,"Shower",showerWithEmEmsPostFuck);
	addButton(1,"No Shower",noShowerWithEmemsPostFux);
}

//[No Shower]
public function noShowerWithEmemsPostFux():void
{
	clearOutput();
	showEmmy(false);
	output("Despite ");
	if(!pc.isCrotchExposed()) output("you both putting your clothes on over");
	else output(" you both putting your things on over");
	output(" a sopping layer of sexual goo, Emmy does take a moment to tidy up the shop. Slits in the floor open up at the press of a button to drain away the worst of the mess, and with a few wipes from a hyper-absorbent towel, the shop is back to normal once more.");
	output("\n\nEmmy looks relatively prim and proper as well, aside from a few careless tangles in her hair, but you can hear the cum squishing around inside her suit with every step she takes. You aren’t much better off yourself. Just the feeling of the mixed sperm clinging to your [pc.skinFurScales] is enough to make your pulse speed with naughty thrill.");
	processTime(2);
	IncrementFlag("EMMY_FUCKED");
	//cum splattered
	pc.applyCumSoaked();
	pc.applyPussyDrenched();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Shower]
public function showerWithEmEmsPostFuck():void
{
	clearOutput();
	showEmmy(false);
	output("Cleaning up goes quickly, but the things Emmy convinces you to do to her do not. Soaping up each other’s hair rapidly transforms into giggling and groping. The shower and suds inevitably lead to you and Emmy’s cocks slipping and sliding against one another, encouraging more and more blood to flood to the once spent tools. Your lips meet hers, and in no time at all, ");
	//Bimbo:
	if(pc.isBimbo()) 
	{
		output("she’s pushing you down until her shining onyx dong is bobbing just in front of your face, insistently demanding you tend to it. Emmy’s foot finds your [pc.cocks] the moment your lips seal around her tip, and seemingly no time at all, you’re both shuddering in the throes of bliss. Contentment really is a big, fat cock in your mouth.");
		pc.loadInMouth(emmy);
	}
	else if(rand(4) == 0) output("she’s kneeling in front of you, bouncing her freshly-cleaned jugs around your [pc.cockBiggest] - and her own.");
	else if(rand(3) == 0) output("she’s guiding you right back into her vagina, determined to ride you to a second orgasm before she has to return to the duller, outside world, where she has to contain her urges rather than revel in them.");
	else if(rand(2) == 0) output("she’s on her knees and sucking you like her life depends on it, all the while hosing pre and cum down the shower’s industrial strength drain.");
	else output("she has you on your back, your face buried deep in her cum-drenched pussy while her lips polish any remaining cunt residue from [pc.oneCock]. Nuzzling into her most intimate of places would be relaxing if she wasn’t slurping on you like you’re the galaxy’s last popsicle.");

	output("\n\nAfter another orgasm - ");
	//Do cum stuff now so we can check for empty balls
	processTime(24);
	pc.orgasm();
	emmy.orgasm();

	if(pc.isBimbo() || pc.isBro() || pc.libido() >= 80) output("one that leaves you thankful to find someone with as inexhaustible a libido as your own");
	else if(pc.ballFullness <= 1) 
	{
		output("one that leaves you feeling so drained that your [pc.balls] may as well be ");
		if(pc.balls <= 1) output("a ");
		output("self-contained desert");
		if(pc.balls > 1) output("s");
	}
	else output("one that leaves you panting but sated");
	output(" - and another washing off, you and Emmy are finally, blessedly clean. She openly leers at you while you dress. The smitten jackaless actually plays with her cock while watching you bend over, absolutely refusing to ever go completely soft again, and after a performance like that, you have a hard time blaming her.");
	pc.shower();
	IncrementFlag("EMMY_FUCKED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Get Fucked
//Emmy dominant. Probably need variants >.>
//Pre-herm harness intro:
public function getFuckedByEmmyEmmyEms():void
{
	clearOutput();
	showEmmy(true);
	var x:int = rand(pc.totalVaginas());
	if(flags["EMMY_QUEST"] == 5)
	{
		output("<i>“");
		if(pc.isBimbo()) output("Mmmm, I can’t believe you aren’t fucking me already!");
		else output("Just fuck me already!");
		output("”</i> you answer, begging her for a nice, hard dicking with your eyes.");

		output("\n\nEmmy growls, <i>“You asked for it... slut.”</i> The corners of her mouth curl into a wanton grin as she rolls off, fingers darting to the seams in her suit. <i>“That’s us, isn’t it? Just two sluts needing to fuck and cum and fuck again.”</i> She struggles briefly when her cock catches on the suit, then yanks it down further, causing her tip to lurch up and slap you in the face with a whip-like cord of pre-cum. <i>“Void, I want to fuck your face!”</i> She licks your cheek, cleaning you even as she wiggles the bottom of her clingy garment past the blunted claws on her toes. <i>“But I’m gonna fuck you instead. I’m finally going to fuck you!”</i>");
		output("\n\nSnarling, Emmy grunts, <i>“Bend over" + pc.mf(", bitch",", slut") + ".”</i>");
		output("\n\nShe sounds so sure of herself and yet so passionate, like she’s foretold an extremely enjoyable prophesy. You shiver at her tone and do exactly as commanded, raising your rump high in the air");
		if(pc.hasCock())
		{
			output(", your [pc.cocks]");
			if(pc.balls > 0) output(" and ");
		}
		if(pc.balls > 0 && !pc.hasCock()) output(", your ");
		if(pc.balls > 0) output("[pc.balls]");
		if(pc.hasCock() || pc.balls > 0) 
		{
			output(" dangling uselessly below your ");
			if(pc.wetness(x) <= 1) output("moistening");
			else if(pc.wetness(x) <= 3) output("dripping");
			else output("soaking-wet");
			output(" cunt");
			if(pc.totalVaginas() > 1) output("s");
		}
		else
		{
			output(", exposing your ");
			if(pc.wetness(x) <= 1) output("moistening");
			else if(pc.wetness(x) <= 3) output("dripping");
			else output("soaking-wet");
			output(" cunt");
			if(pc.totalVaginas() > 1) output("s");
		}
		output(" to air that suddenly feels about ten degrees warmer. The excessively aroused hermaphrodite’s hands are even hotter when they ");
		if(pc.tone <= 50) output("sink into");
		else output("squeeze");
		output(" your [pc.butt], and you find yourself moaning, <i>“T-take me!”</i> entirely without thinking about it.");

		output("\n\n<i>“I intend to.”</i>");
	}
	//Normal
	else
	{
		output("<i>“I think you need the touch of a real pussy, not that little, plastic sleeve you spend so much of your time obsessing over,”</i> you tease, reaching over to caress Emmy’s bulging member. <i>“I think this beast needs to remember what it’s like to bend a " + pc.mf("hot body","bitch") + " over and fuck [pc.himHer] into a cum-soaked mess.”</i>");
		output("\n\nBy the time you reach the end of your diatribe, Emmy is already starting to strip naked. <i>“I think you’re right,”</i> she agrees. The furry horndog cleanly yanks her her suit down and out of the way, then steps out of it in the same motion. She’s gotten far better at this since you’ve started fucking, but her twitching dick and slick cunt are both still all wrapped up in her herm harness. Looking back and forth between the toy and your crotch, Emmy makes up her mind, and the harness hits the ground a second later, still dripping.");
		output("\n\nYou quirk an eyebrow at the abruptly naked shopkeep and wiggle your ");
		if(!pc.isCrotchExposed()) output(" still-clothed");
		output(" hips");
		if(pc.isCrotchExposed() && pc.isCrotchGarbed()) output(", glad that your choice in outerwear comes complete with a nice entrance-hole for Emmy to use");
		output(". <i>“You sure? You don’t sound like you want it.”</i>");
		output("\n\nEmmy licks her lips and saunters forward, grabbing you with almost painful intensity. She nips at your ear even while she pushes you down and forward");
		if(pc.hasKnees()) output(" onto your hands and knees");
		else output(" with your [pc.butt] in the air");
		output(". She growls, <i>“Do you know who jackals fuck, [pc.name]?”</i>");
		if(!pc.isCrotchExposed()) output(" Her fingers yank your [pc.lowerGarments] out of the way.");
		else output(" Her fingers dance across your exposed cheeks.");
		output("\n\nYou ");
		if(pc.isBimbo() || pc.IQ() < 50) output("cluelessly shake your head, but press backwards needfully into her hand.");
		else output("shake your head, figuring she doesn’t expect you to answer.");
		output("\n\nPulling her hand back, Emmy slaps your ass and squeezes roughly. <i>“Jackals fuck bitches.”</i> Her claw-tips don’t feel nearly blunt enough. They dig deep into your [pc.skinFurScales] and refuse to let go, holding your haunches more possessively than a beggar clutching his last " + (isAprilFools() ? "dogecoin" : "credit") + ". <i>“And here you are in front of me, ass in the air and puss");
		if(pc.totalVaginas() == 1) output("y");
		else output("ies");
		output(" on display.”</i> Her thumb grazes [pc.oneVagina]");
		if(pc.clitLength < 2) output(", catching on [pc.oneClitPerVagina]’s hood.");
		else 
		{
			output(", brazenly slipping down to fondle ");
			if(pc.totalClits() == 1) output("your");
			else output("an");
			output(" over-sized clitoris.");
		}
		output(" <i>“I...”</i> Her bravado slips momentarily, but her hand doesn’t move. <i>“...I don’t think I could stop myself from fucking you if I wanted.”</i> Curling back her lip, Emmy nips at your ear and growls, <i>“And you’re going to like it. I can see it on your face everytime I talk about taking you like a common ausar bitch.”</i>");
	}
	//Merge
	output("\n\nSeveral pounds worth of turgid, throbbing cock-meat slap down into the crack of your ass. Emmy’s dick is almost uncomfortably warm after being pent up in her suit for so long, and equally as wet with pre-cum. The individual veins bulge like miniaturized pressure-hoses, and a pair of sweat-matted nuts rub on your thighs, sliding back and forth in the curtain of dribbling pre-cum.");
	if(pc.clitLength >= 1)
	{
		output(" You’re incredibly thankful to have ");
		if(pc.totalClits() == 1) output("a ");
		output("[pc.clits] that rub back against the rutting herm for some additional stimulation.");
	}
	output(" It’s delicious and slippery, feeling her body against you, knowing just how hard you’ve made her heart beat. She’s gone beyond want for you. All that’s left is pure need.");

	output("\n\nSwatting ");
	if(flags["EMMY_QUEST"] > 5) output("the other side of ");
	output("your [pc.butt]");
	if(flags["EMMY_QUEST"] > 5) output(" again");
	output(", Emmy pulls back. You can hear her panting, feel the misty curtain of pheromones pouring off her and rolling over your body.");
	if(emmy.hasStatusEffect("Cum Soaked") || emmy.hasStatusEffect("Pussy Drenched")) output(" She still stinks like sex from when you banged her not so long ago, and when you close your eyes, it fills your heads with thoughts of sloppy ruts: fucking in the mud or humping in the middle of a club, the more depraved and uncivilized the better.");
	output(" Then her cockhead is kissing [pc.oneVagina], gently spreading the lips. You expected her to thrust right in, not to take her time, gently penetrating you, but that’s exactly what she’s started to do.");

	output("\n\nThe moment the fuck-happy company rep has her cock’s tip inside you, she forgets all about taking her time. She growls loudly, and her dick plows forward. One moment, you’re achingly empty, the next, totally and completely stuffed with cock, all the way up to the edges of Emmy’s musky sheath.");
	var emmysize:Number = emmy.cockVolume(0);
	var pcsize:Number = pc.vaginalCapacity(x);
	if(emmysize > pcsize * 0.8) output(" It feels like it’s going to split you half, like Emmy replaced her cock with the trunk of an ancient tree. You don’t know how it could possibly fit inside you, but it does all the same, straining the lips of your [pc.vaginaNoun " + x + "] into a glossy o-ring.");
	else if(emmysize > pcsize * 0.5) output(" It feels perfect - both stunningly pleasurable and yet on the edge of painfully stretching. In a way, taking Emmy’s cock reminds you of working out and the pleasant soreness that inevitably follows. A bitch-breaker like hers would destroy a lesser woman, but for you, it only heightens your considerable passion.");
	else output(" Few things in the universe could match the wonderful feeling of being so perfectly impaled, spit on a big-dicked lover worthy of your [pc.vaginaNoun " + x + "]. Emmy’s prong artfully spreads your walls. The pointed tip nestles nicely at your cervix, pressing it just firmly enough to be on the edge of comfort. Best of all, her knot lingers at your sensitive lips and [pc.oneClitPerVagina], beating like a second heart against your folds.");
	//Cuntchange!
	pc.cuntChange(x,emmysize,true,true,false);
	output("\n\nYour arms nearly give out in the moment of that first, glorious thrust, shaking wildly, but the drop to your elbows just pitches your ass up higher, encouraging Emmy to use it harder. She does. Her pull back leaves you hollow... gaping. Her thrust forward is less a thrust and more like a blow from an industrial pile driver, rocking you far enough forward to press your face to the floor, still vaguely scented with Emmy’s cum from who knows how many masturbation ‘accidents.’");
	if(emmy.bellyRating() >= 30) output(" Meanwhile, her inflated belly wobbles on the small of your back while she works over your sex, sloshing noisily as if to advertise what’s going to happen to you in a few minutes.");
	output(" Pounding your pussy is an understatement for what Emmy does. The most apt comparison would be to a rutting animal or an industrial machine, and neither can truly convey how tremendously, properly, totally fucked you are.");
	output("\n\nGrowls and snarls work through the perky jackaless’s throat while she works you over, accompanied by thrusts that drag ");
	if(pc.biggestTitSize() < 1) output("you");
	else output("your [pc.nipples]");
	output(" back and forth across her shop floor, leaving streaks of glossy sweat and drool in your wake. You should probably speak up and tell her to go slower or more gently, but then she slams back in. Stars burst in front of your eyes, and entirely different sounds pour out of your throat like water from a hose. Rational thought isn’t just difficult, it’s near impossible.");
	output("\n\nYou’ll start to say something through the moans, and then her knot or sheath will bump your [pc.clits] again, ensuring that whatever you meant to say becomes some variant of ‘fuck’ or ‘yes.’ Trains of thought derail wholesale, sinking into a pit that’s overflowing with sexual pleasure. ");
	if(pc.legCount > 1) output("Your [pc.legOrLegs] spread apart, begging for more like some kind of wanton slut, but your trembling muscles refuse to do anything but open further and further.");
	else output("Your [pc.leg] shivers and shudders to Emmy’s rhythm, pushing you back into her at the apex of each of her thrusts.");
	output(" Arching your back");
	if(pc.hasToes()) output(" and curling your toes");
	if(pc.bellyRating() >= 10) output(" and pressing your [pc.belly] to the floor");
	output(", you lift your [pc.butt] to give the panting jackal an even better angle to violate you from. Instinct is driving you now, and it will accept nothing less than thorough insemination");
	if(pc.isPregnant()) output(", regardless of how pregnant you may be");
	output(".");

	output("\n\nEmmy’s slapping balls seem to have the same thought coursing through them. You can feel them tightening against you even as their hermaphroditic owner’s growls rise in pitch and volume. Her cock thickens inside of you as she bottoms out for the last time. Her knot balloons outward, gaping your netherlips and locking itself inside");
	if(pc.totalVaginas() > 1)
	{
		output(", pressing strongly enough to squish the walls of your other cunt");
		if(pc.totalVaginas() > 2) output("s");
		output(" together");
	}
	output(", providing a perfect seal for the cum you feel pumping through her distended urethra.");
	output("\n\nHot splashes hit your cervix, then pool down around the throbbing length of Emmy’s member, each bigger, warmer, and gooier than the preceding one. It feels good... better than it has any reason to. Your cum-quenched muscles tremble and flutter around the sperm-gushing prick, though their efforts are increasingly futile. With each passing moment, your channel balloons further and further with more of Emmy’s ivory ejaculate, stretching to contain what is rapidly becoming an internal spunk-lake.");
	if(!pc.isPregnant(x)) output(" Most jets into your womb, but s");
	else output("S");
	output("ome finally splatters to the floor once your inflating passage breaks the seal around Emmy’s canine obstruction.");

	output("\n\nYour vision goes white to the feeling of so much cum spurting into you, filling you, and cascading out across your inflamed lips and [pc.clits], feeling, hearing, and seeing nothing more than red-hot waves of your own climactic ecstasy.");

	//[Next]
	processTime(33);
	pc.loadInCunt(emmy,x);
	clearHermHarnessStatii();
	emmy.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",emmyGetFuckedEppie,x);
}

public function emmyGetFuckedEppie(x:int):void
{
	clearOutput();
	showEmmy();
	output("When you come to, you’re sitting in Emmy’s lap, still impaled, though her knot feels less burdensome than it did at last memory. She’s rubbing her hands over your ");
	if(!pc.isPregnant(x)) output("cum-inflated ");
	else output("pregnant ");
	output("belly. Faintly, you can feel more seed trickling into your tender canal, matched by the dribbles leaking out over Emmy’s legs. She doesn’t seem to mind, though; the expression on her face would look right at home in the dictionary next to ‘contentment.’");
	output("\n\n<i>“You’re awesome,”</i> Emmy coos in your ear when she helps you up. She even gives your gaping cunt a parting lick before you can waddle off to get dressed. You shiver, and her gleaming cock jerks in place, ready to go again. It’s a good thing she’s got that harness");
	if(flags["EMMY_QUEST"] == 5) output(" coming in the mail");
	output(" or you’d never get to walk straight again.");
	if(pc.isBimbo()) output("\n\nGiggling to yourself, you resolve to ditch the toy and make that a reality - once you claim your daddy’s money.");
	processTime(25);
	IncrementFlag("EMMY_FUCKED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Collect Emmy’s Panties
public function emmysPantiesGet():void
{
	showName("MYSTERIOUS\nPACKAGE");
	showBust("");
	output("\n\nSomeone left a package against your ship! Wrapped up in brown paper, its only visible marking is a small white tag with your name roughly scrawled across it. You briefly consider that it could be a trick or a trap, planted by your cousin to slow you down, but [rival.heShe] seems more interested in rubbing your face in the dirt while [rival.heShe]’s there to see it.");
	output("\n\nShrugging, you tear it open, anxious to get at whatever prize is inside. You smell a dash of perfume as soon as the paper comes off, partly covering an earthier, almost nutty scent. It’s familiar, but you can’t quite place it.");
	output("\n\nThen you open the box, revealing exactly what you were smelling - a pair of silky, purple panties with a sorely stretched-out gusset, still soaked from what looks like a night of fun. Off-white splotches mar and clear gloss war for control of the slippery surface, a look (and smell) you’re all too intimately familiar with. These can only belong to your horny jackal girlfriend: Emmy.");
	output("\n\nA note, printed on moisture-resistant plastic, confirms your assumption:");

	output("\n\n\t<i>Hey there sexy,");
	output("\n\n\t\tI can’t seem to stop thinking of you, especially since you’ve got your finger on the buttons to my new favorite toy, and I thought you could use something to remind you of me while you’re out in space. It sure must be lonely! So I got you one of my favorite pair of panties. Silly things, they seem so POINTLESS now. I mean who needs panties anyway? They just get in the way or get sticky or bunched up. But then I remembered all the dirty things we did together, and I thought, ‘what else would my beau want from [pc.hisHer] personal slut?’");
	output("\n\n\t\tYou can do whatever you want with ‘em. Frame them and hang them on the wall or whatever your naughty little mind can think of. I’m sure you have some ideas.");
	output("\n\n\t\t:3 Emmy</i>");
	output("\n\n<b>You’ve acquired Emmy’s panties!</b>");
	pc.createKeyItem("Panties - Emmy's - Silky, purple, and cum-stained.");
	processTime(10);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function clearHermHarnessStatii():void
{
	emmy.removeStatusEffect("Slow Fucking");
	emmy.removeStatusEffect("Massaging");
}

//Hyper Fuck
//Vag+pawjob OR Emmy prostate milks you.
//Pre harness intro
//Pinned to floor, etc
public function emmyHyperFucksIntro():void
{
	var x:int = pc.biggestCockIndex();
	clearOutput();
	showEmmy();
	if(flags["EMMY_QUEST"] == 5)
	{
		output("<i>“I want to fuck you...”</i> you admit. <i>“...but I’d split you in half.”</i>");
		output("\n\nEmmy grins, grinding her crotch against ");
		if(pc.lust() < 75) 
		{
			output("the rapidly erecting tower");
			if(pc.cockTotal() > 1) output("s");
		}
		else
		{
			output("the turgid tower");
			if(pc.cockTotal() > 1) output("s");
		}
		if(!pc.isCrotchExposed()) output(" in your [pc.lowerGarment]");
		else if(pc.legCount > 1) output(" between your [pc.legs]");
		else output(" above your [pc.leg]");
		output(". <i>“You really would, wouldn’t you?”</i> Emmy reaches between your bodies and wraps her hand around ");
		if(pc.cockTotal() > 1) output("the biggest");
		else output("it");
		output(". <i>“Such a big... fat cock deserves love too, you know. Even if I can’t get the whole thing inside, I bet I can at least work the head in.”</i>");
		output("\n\nYour [pc.cocks] throb");
		if(pc.cockTotal() == 1) output("s");
		output(" at the suggestion.");
		output("\n\n<i>“Yeah, and I could sit here and jack it off with these soft, silk-wrapped pads on my feet.”</i> Emmy curls her feet ");
		if(pc.legCount > 1) output("between your [pc.legs]");
		else output("around to the underside of your crotch");
		output(" and ");
		if(pc.balls > 0) output("caresses your [pc.balls]");
		else output("rubs your [pc.sheathBiggest]");
		output(" with toes that feel far softer than a terran’s ever could. <i>“Mmm, that’d be nice. I wonder, just how much spunk would you shoot inside me? Enough to drench my pussy or flood my womb? Or maybe it’s all size and show, with only enough seed for a quick glaze...”</i>");
		output("\n\nYou groan and arch your back, pressing your [pc.cocks] against Emmy’s, letting her fondle and tease you");
		if(pc.isCrotchGarbed()) output(", nearly unaware that she’s pulled your [pc.lowerGarments] out of the way");
		output(".");
		output("\n\n<i>“Or I could flip you over on all fours and fuck your ass. Do you think your prostate is as oversized as your cock");
		if(pc.cockTotal() > 1) output("s");
		output("? Or do you think you think it’ll be a tiny target that takes me a while to properly hit?”</i> Emmy nips at your neck and sighs. <i>“So many choices, and so little time, but I think I’ll let you choose; I’m going to cum either way.”</i> She regretfully pulls away from you and tugs at her suit’s seal. <i>“What’ll it be?”</i>");
	}
	//Post harness intro
	//Standing & talking to her
	else
	{
		output("<i>“How about this?”</i> you suggest");
		if(!pc.isCrotchExposed()) output(", whipping out your [pc.cockBiggest]");
		else output(", stroking the cock-sized distention in your [pc.lowerGarmentOuter]");
		output(".");
		output("\n\nEmmy looks spellbound by the massive cock, chewing her lip thoughtfully. <i>“It’s... it’s yummy, but [pc.name]... it’d split me in half. Void, I want to try, but I’d never fit such a big... juicy... umm... fuckable dick inside me. Not all of it anyway.”</i> She steps closer and pulls you into a one-armed hug, her free hand reaching down to cup your crotch supportively, the tiny pads on her fingers soft and slick through the fabric of her suit against your turgid flesh. <i>“I’m not saying no either. We could still do some things with this...”</i>");
		output("\n\nYou let her fondle your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("[pc.cockBiggest]");
		output(" and try to come up with a response, but all that comes out is a happy sigh. Her hands feel so good!");
		output("\n\n<i>“I bet I could wedge at least some of the tip inside me, then tend to the rest of it with my soft little footpaws. They’re bigger than my hands and feel just as good, I promise. Sliding up and down, making you brew up a sticky load to deposit in my cunt - isn’t that what you wanted? To finally cum inside my pussy, maybe give me a little glaze? Or did you just think that cumming in my cunt would somehow make me your property? Silly [pc.boyGirl], I’m already all yours.”</i> Emmy is still teasing you");
		if(pc.isCrotchGarbed()) output(", peeling off your [pc.lowerGarments] as she goes");
		output(", sometimes tickling your [pc.cockNoun " + x + "] by tracing her blunted claws over the veins.");
		output("\n\nYou nod. It does sound nice.");
		output("\n\nEmmy’s just getting started, however. Her other hand gropes your [pc.butt], squeezing your cheeks roughly. <i>“Or we could forget all about putting a load inside me, and put one in you. Wouldn’t that be hot? You with your ass in the air, that big, flopping obscenity dragging on the floor, squeezing out ropes of jizz everytime I press down on your poor, neglected prostate? I wonder if you’ve got a swollen, yummy, cummy one, or a little, hard-to-hit bundle of nerves.”</i> Her fingertip circles your rosebud. <i>“What’ll it be, babe? Do you wanna get milked into my oozy, dripping pussy, or waste it on the floor?”</i>");
	}
	processTime(3);
	pc.lust(15);
	clearMenu();
	addButton(0,"Get Pegged",emmyHyperProstateChampionIIHyperEdition,undefined,"Get Pegged","Let Emmy go hog-wild on your ass and prostate.");
	addButton(1,"Footjob",hyperFootjorbsForEms,undefined,"Footjob","Have her put her delightful little toes to work on your cock.");
}

//Hyper Footjob
//Pants should already be down or dick exposed.
//Emmy wedges your cockhead in her cunt and squeezes you off with her toes.
public function hyperFootjorbsForEms():void
{
	clearOutput();
	showEmmy();
	//bimb
	if(pc.isBimbo())
	{
		output("You blush and grin right back at her. <i>“Umm, the uh... like, first one. I wanna cum in you.”</i> Giggling, you add, <i>“It sounds so silly when I say it. Usually I want the cum in me!”</i>");
	}
	//bro
	else if(pc.isBro()) output("You grunt and grin, pointing at her feet and nut-blocked cunt. <i>“The first one.”</i>");
	//Nice
	else if(pc.isNice()) output("You groan out loud, already imagining her squishy paws polishing your heavy weapon. <i>“Your feet.”</i> The answer is automatic. <i>“I wanna fuck you, and your feet. Please.”</i>");
	//Mischievous
	else if(pc.isMischievous()) output("You push back against Emmy and wrap your palm around her balls, curling your fingertips into the steamy delta behind. <i>“You don’t strike me as the type to let size stop her from getting what she wants.”</i>");
	//Hard
	else output("You leer right back at the excited hermaphrodite. <i>“You’re the one that’s gonna walk away with a bellyful of cum today, Ems, but that’s what you want, isn’t it?”</i> You rock your hips forward, your mammoth erection wobbling against her.");
	//Merge
	output("\n\nEmmy bites her lip and nods apprehensively, drawling, <i>“Yesss,”</i> while tugging her suit open to expose her breasts. With every heaving breath the excited jackaless takes, her plush assets sway, bouncing off of each other, spreading apart and slapping back together around her cock. Her tits are doing a fine job of stimulating the exposed, twitching shaft, smearing its own dripping pre-cum over the pulsating veins and smooth, almost glossy surface. The sight is so hypnotic that by the time you blink away your titnotic trance, Emmy is completely nude and dragging a pad out of a storage compartment.");
	output("\n\n<i>“Have a seat and let it all hang out,”</i> the panting jackaless bids you, patting the fluffy fabric. <i>“I wouldn’t want such sensitive skin to rest on the floor. It’s so cold there!”</i> She playfully shivers");
	if(pc.biggestCockLength() >= 72) output(" on her way to pull out extra mats. <i>“How do you even get around with a freighter’s worth of cock between your legs? By the time I get the head nestled inside me, we’re going to be yelling at each other across the store.”</i>");
	else output(".");
	output("\n\nYou squat down");
	if(pc.isTaur()) output(", unable to stop yourself from groaning when your tauric body sandwiches your lengthy erection between itself and the pad");
	else if(pc.isNaga()) output(", unable to stop yourself from groaning when you loop your snake-like tail around it once, just for fun");
	else output(", flopping your lengthy erection onto the soft pad, groaning at the way the fabric seems to cup the lower half");
	output(". It looks so much <i>bigger</i> like this, sprawled out on the ground. When you’re out walking around or burying in some capacious alien, it seems so much smaller, but here, there’s no ignoring the pernicious pole and its licentious demands. ");
	if(pc.cockTotal() > 1) 
	{
		output("And that’s just the big");
		if(pc.cockTotal() > 2) output("gest");
		output(" one. ");
	}
	output("You affectionately stroke the top of it, realizing just how badly you need to cum - and soon.");
	output("\n\nEmmy sits down at the other end of your pillar of cock, resting her soft-furred ballsack just behind the head. Her balls hang down to either side like big, squishy weights, pinning you to the floor, forming the top half of a supple, organic cock-ring. At the same time, she shifts her hips forward, pressing your gargantuan prong against a thoroughly-juiced cleft. She’s so wet that, at first, you barely notice how hard she’s thrusting against it, spellbound by what feels like curtains of heated liquid. Then, you feel those curtains give, spreading wide, almost inhumanly so, and the first inch slips into Emmy’s too-tight cunt, utterly plugging it. She gasps. You moan. You both shudder.");
	output("\n\nThe big-dicked shopkeeper gapes at you. <i>“H-how?! How does anyone take this?”</i> She leans forward, stroking it, making it throb and pulse, stretching her lips wider with superhuman tumescence. <i>“Ohh, I hope you’ve got as much cum as you’ve got dick, [pc.name].”</i> Curling her legs forward, she presses her bare feet to either side of your [pc.cockBiggest], spreading her toes to squeeze on as much as possible. <i>“Cause you’ve got a </i>lot<i> of dick.”</i> She bends lower and licks it, mouthing, <i>“A lot.”</i>");
	output("\n\nFiguring her questions are either rhetorical or unimportant, you let your head loll back and groan. Emmy’s feet feel almost better than her hands. Both have soft little pads on the digits and bigger ones on the sole, but the ones on her feet are far larger - and somehow softer. Her toe-claws are just as blunt as the ones on her fingertips, and with the way she’s stretched her toes, they occasionally rub on your sweating dickskin, sliding along the sides like polished glass.");
	output("\n\nEmmy flashes you a toothy grin and grabs hold of her breasts to begin titfucking her own king-sized cock, bouncing her pillowy J-cups to the tempo her feet are setting down south. She tries to look cocky, but her carefully crafted expression falls apart in no time flat. She moans, <i>“What’s the matter? Mmm... that big ol’ cock do all the thinking... f-for you?”</i> Twisting her ankles, she rotates her paw pads slightly, spiking the pleasure. <i>“T-too much cock on the brain to answer?”</i> She licks at her own dickhead, squeezing a dollop of pre-cum onto her tongue.");
	output("\n\nLicking your lips, you smile right back at her, stifling moans of pleasure before they can prove her right. <i>“");
	if(pc.isBimbo()) output("Like, y");
	else output("Y");
	output("ou’re the slut who loves cock so much she spent 15 grand just to give her wrists a break!”</i>");
	output("\n\nEmmy picks up the pace at the word ‘slut,’ and dives deeper onto her drooling doggie dong. Her feet, soft and fluffy as they are, pick up the pace of their maddeningly pleasant stroking, radiating bursts of pleasure all the way from your [pc.cockHeadBiggest] down to your ");
	if(pc.hasSheath(x)) output("sheath");
	else if(pc.hasKnot(x)) output("knot");
	else output("root");
	output(", making you twist and shudder in the throes of ecstasy.");
	output("\n\nPulling off with a noisy slurp, the lust-drunk jackaless coos, <i>“Somebody’s dick is getting biggeerrrrr! Mmm...”</i> She pumps faster and harder, all while continuing to milk a stream of her own pre-cum in the tawny fur between her boobs. <i>“Do my paws feel good on your cock, [pc.name]?”</i> A jet of liquid excitement squirts onto her chin. <i>“Are y-you gonna cum soon?”</i> A high pitched whine tears out of her throat. <i>“...I’m close. Just cum... cum, and I’ll cum, and...”</i> She sucks in a huge breath and groans, doubling the pace of her velvety paws’ frenzied caressing, smearing pussy juice and sweat along your gleaming, twitching length until it feels less like a dick and more like a million nerves crying out as one, demanding release.");
	//Flared cock
	if(pc.hasCockFlag(GLOBAL.TYPE_EQUINE,x)) 
	{
		output("\n\nThe closer you get, the more distressed Emmy’s expression becomes, and the tighter her straining cunny feels. Then, all at once, the tightness vanishes. A lurid pop splits the air, and slutty shopkeeper cries out in disappointment. You can still feel her lips against your expanding head, but no longer wrapped around it. Your tremendous flare literally pried its way out of her pussy.");
		output("\n\nLuckily, Emmy recovers quickly, slapping her cunt-lips against your [pc.cockHeadBiggest] and gyrating her hips to drag her clit around the upper rim of it, all while your spasming urethra remains squarely aimed into her canal. You can hear the wet squelches, and the smell of pussy fills the air, almost overpowering the musky odor of your animalistic erection.");
	}
	//Sheath
	if(pc.hasSheath(x)) output("\n\nYou can’t help yourself. You dip your fingers into your sheath, ravishing the sensitive dickflesh beneath, feeling it pulse and tremble with unrepressed desire. The raw nerves are all too ready to respond and fire off white-hot bliss at the slightest caress. Heady musk, released from your sheath by your frenzied attentions, tickles at your nose, but it absolutely wrecks poor Emmy. Her pussy palpably gushes over you, and her ears droop docilely to the side, making her look more like an obedient puppy than a fierce jackal. The once proud KihaCorp rep is taking deep sniffs in between strokes, and looks like she’d like nothing more than to crawl over your cock and stick her nose deep into your folded skin.");
	//Merge
	output("\n\nEmmy’s toes curl, digging into the sides of your rock-hard dick, squeezing it all the tighter. Fireworks of ecstasy erupt from inside it, rippling along a length that suddenly seems so rigid that it’ll lift the happy jackal into the air.");
	if(pc.balls > 0)
	{
		output(" Your [pc.balls] churn");
		if(pc.balls == 1) output("s");
		output(", and y");
	}
	else output("Y");
	output("our abdomen clenches, lurching with involuntary contractions. There’s no stopping it now, not even if Emmy ceased squeezing you between her toes, not even if her heels didn’t feel so delightfully soft and padded. You’re going to cum. You’re going to cum <i>directly</i> into Emmy’s pussy.");
	output("\n\nA toe brushes against the underside of your rapidly ballooning urethra, and you can’t help it. You cum. A spasm as violent as it is pleasurable racks your abdomen, and half-loaded [pc.cumNoun] fires out");
	var cum:Number = pc.cumQ();
	if(cum < 6) output(", leaking weakly into Emmy’s empty cunt, barely polishing her lips. Again and again, ecstasy wrenches smallish droplets from your [pc.balls], but there’s barely anything to give. Most of the time nothing even comes out - nothing aside from your moans, that is.");
	else if(cum < 1000)
	{
		output(", glazing Emmy’s tunnel in the fruit of your hyper-sized love. Her padded paws squeeze you deliciously, and you find the following ejaculations to be both larger and more enjoyable, hot squirts of passion that leave you drained and simultaneously fulfilled. ");
		if(cum >= 500) output("By the time you finish, you aren’t the only thing fulfilled. Emmy’s cunt is thoroughly creamed, and [pc.cumColor] goo drips out from around your turgid dickhead.");
		else output("Emmy’s cunt is nicely coated, inside and out, by the time you finish, but you fall well short of filling her up.");
	}
	else if(cum < 10000)
	{
		output(", thick as any normal terran’s entire orgasm. It squirts straight up into Emmy’s waiting quim, glazing the inside and out in a [pc.cumVisc] layer of [pc.cumColor] love, and that was just the first shot. The following volleys are both larger and more enjoyable, lurid lances of pressurized pussy-packing pleasure that make Emmy moan and buck against your super-sized inseminator.");
	}
	else 
	{
		output(", squelching noisily as it floods the jackaless’s empty canal in an instant. The second shot is easily twice as voluminous and three times as messy, forcing the pre-packed sperm directly into her womb while jets of sloppy [pc.cumNoun] squirt out to paint her thighs [pc.cumColor]. The longer you cum, the messier Emmy and the floor get - and the more visibly flooded her womb becomes. Her belly is obviously paunched");
		if(cum >= 20000)
		{
			output(", but her grasping toes never stop encouraging you to give her more, not until you’ve pumped her up into a ");
			if(cum < 25000) output("six");
			else if(cum < 30000) output("seven");
			else if(cum < 50000) output("eight");
			else output("nine");
			output("-month spunk-mother");
		}
		output(".");
	}
	output("\n\nGurgling happily, the spunk-basted hermaphrodite does the only thing she can in such a situation - blow a hot, sticky load directly into her own sucking lips. Her head drops lower, taking the top eight inches of her dick into her canine maw, and her throat bobs noisily, gulping wetly with every thick blob of seed that she devours.");
	if(cum >= 10000) output(" Her belly bobbles adorably between all the cum in her womb and in her stomach, full and taut.");
	else
	{
		output(" Her belly paunches out");
		if(cum >= 1000) output(", mostly from what she’s drinking, but surely all the [pc.cumNoun] in her womb helps.");
		else output(" entirely from her own issue. Your own meager offering surely couldn’t have had such an effect.");
	}
	output("\n\nEmmy pulls off and gasps, while ribbons of white hang between her maw and her dick, a glittering curtain of evidence if ever there was one. <i>“F-fuck. ");
	if(cum < 6) output("That was hot. Even with that little bit of cum, it felt so warm and nice inside me.");
	else if(cum < 1000) output("I can’t believe how good that felt, all hot and wet inside me, like it was </i>exactly<i> what my pussy has been needing all these months.");
	else if(cum < 25000) output("I can’t believe how good that felt, being flooded like that in both ends, but your cum felt so much better than mine, like it was exactly what my pussy needed. And you delivered in spades.");
	else output("I can’t believe you can stay conscious and cum that much. I’d pass out and drown in my own spunk the first time I tried to jack off!”</i> Licking her lips, the herm curls her mouth into a smile. <i>“And it felt good too. Nothing... nothing I’ve ever felt quite matches that. You fill back up, and come back soon, okay?");
	output("”</i> She rubs her belly contentedly while prying her slimy footpaws from your ");
	if(!pc.hasKnot(x)) output("shrinking boner");
	else output("distended knot, rubbing it fondly one last time");
	output(". Cum squishes out from between her toes, and after a moment of regarding them, Emmy starts lapping it up.");
	output("\n\nYou could help her with the other one, if you were so inclined.");
	//[Help] [Leave]
	processTime(23);
	emmy.loadInCunt(pc,0);
	pc.orgasm();
	clearMenu();
	addButton(0,"Help",helpEmmyCleanToes);
	addButton(14,"Leave",dontHelpEmmyCleanToes);
}

//Help Clean Toes
public function helpEmmyCleanToes():void
{
	clearOutput();
	showEmmy();
	output("You grab hold of Emmy’s other foot and lift it to your mouth, sucking her big toe into your maw. She seems surprised at first, but accepts it after a moment, closing her eyes to focus on cleaning her opposite digit. Your [pc.cumNoun] is [pc.cumFlavor], but working every drop out from her fur is harder than you thought. You have to swirl your tongue around again and again, each time gathering slight traces from your own flavor. And that’s just her big toe.");
	output("\n\nYou pop it out, offering it an apologetic kiss, and move down to her next blunt-clawed toe-tip, starting the whole process over again. The only sounds in the room are the lewd slurps coming from the two big-dicked, foot-obsessed sluts, busily polishing Emmy’s feet.");
	output("\n\nYou’re relishing her taste, your taste, and her smell in equal measure, tonguing her arches, circling the puffy little pads on her furry feet, when the foot is pulled from your hands abruptly.");
	output("\n\n<i>“Wha-?”</i> you dazedly ask.");
	output("\n\nEmmy giggles, and stands, offering you a hand up. <i>“They’re more than clean enough now. You’ve been licking my foot for like five minutes, [pc.name], and I do still have a shop to run.”</i> The hermaphrodite’s eyes twinkle knowingly as she gathers her equipment from the floor. <i>“I’m gonna go freshen up and re-open the place. Let me know when you want to do this again, okay?”</i>");
	output("\n\nYou just might have to.");
	processTime(7);
	pc.lust(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Leave
public function dontHelpEmmyCleanToes():void
{
	clearOutput();
	showEmmy();
	output("After a few minutes cleaning up, Emmy disappears into a back room to get properly dressed once more.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Hyper Prostate Milking
//Butt should already be exposed
public function emmyHyperProstateChampionIIHyperEdition():void
{
	clearOutput();
	showEmmy();
	output("Rather than answering with your words, you turn around, sink ");
	if(pc.hasKnees()) output("down on your hands and knees");
	else if(pc.legCount == 2) output("down on all fours");
	else output("to the ground");
	output(", and lift your exposed ass as high into the air as you can");
	if(pc.tailCount > 0) output(", your [pc.tails] swishing anxiously");
	output(". The floor is cold on your neglected, hyper-engorged penis, forcing it to bend a little too sharply where it makes contact with the hard tiles. When Emmy doesn’t react, you add a little wiggle");
	if(pc.buttRating() >= 9) output(", making your big, jiggling ass cheeks shake and bounce enticingly, allowing her to glimpse your [pc.asshole] whenever they wobble apart");
	else output(", making sure she sees your [pc.asshole] every time you wave it by");
	output(".");
	output("\n\nEmmy pants. She almost looks like she can’t believe the opportunity she’s being offered. With you on the ground, posed like an ausar bitch, she can do whatever she wants to you, and she seems momentarily paralyzed by indecision. The big-dicked jackal-girl stands there, her dick hanging out, pulsating and drooling even faster than her tongue. She watches you wiggle for few more pregnant moments, then finally slurps her tongue back up, giggling and kneeling behind you.");
	output("\n\n<i>“Really, [pc.name]?”</i> Emmy asks, her eyes wide. <i>“You’re just gonna bend over like that?”</i> She grabs hold and squeezes possessively. <i>“Does this mean that all I had to do, all this time, was push you down and take charge? You’ve got that huge, needy cock, but all you really want is someone to stick theirs in your ass and claim you? Huh.”</i> She slaps your [pc.butt] none-too-tenderly. <i>“I guess that makes you the slut then, doesn’t it?”</i> Threading her cock through your cheeks, Emmy giggles, <i>“And me the stud.”</i>");
	output("\n\nHer dick feels hotter and harder than you would’ve thought possible, like a bar of iron pulled fresh from a fire. Emmy doesn’t just let it lie there, either. She saws it back and forth slowly, making sure that the copious drops of pre get all over your crack, soaking you in slippery dick-oil. Your own [pc.cocks] hang");
	if(pc.cockTotal() == 1) output("s");
	output(" there, impotently throbbing in anticipation. Any second now, she’s sure to thrust it inside. Emmy isn’t the kind of girl to repress her sex-drive for long.");
	output("\n\nThen, she’s pulling back, and you feel her pointed tip coming to rest on your quivering ring, dripping more of her silky-hot pre-cum into your vulnerable gut.");
	output("\n\n<i>“You’re really going to let me do it, aren’t you?”</i> Emmy asks, her voice heavy with disbelief.");
	output("\n\nYou don’t try to look back at her, just bite your lip and nod, waiting for the inevitable penetration.");
	//1-2 tightness
	if(pc.ass.looseness() <= 2) output("\n\nIt’s... easier than you would have thought. With Emmy dribbling like a broken faucet, your ass is slipperier than a buttered teflon. The first inches climb right on in, and though the sensation is a little strange, her warm, pulsing boner feels quite nice inside you. Inch after inch climbs up your ass, stretching you wider and wider, until you can’t believe just how wide-open you feel, like your whole ass is about to split in half around the hung shopkeep’s prick.");
	//Medium TIghtness
	else if(pc.ass.looseness() <= 4) output("\n\nShe couldn’t slide in any easier if you buttered her up with industrial-strength lubricant and spent a few hours beforehand stretching. Your [pc.asshole] is no stranger to getting plowed, and Emmy’s cock is perfectly soaked in her own pre. It’s like you were made for each other. When her sheath bunches up against your blushing cheeks, you squeeze your muscles happily around it, amazed at how wide-open she’s stretched you without a single ounce of discomfort.");
	//Gapey McGaperson
	else output("\n\nEmmy pushes her whole cock inside you in the span of a half-second. One second, you’re anxious and waiting, the next you’re stuffed full of her cock. It doesn’t hurt at all either. How could it when your asshole pops open at the slightest provocation? Your butthole was made to take giant dicks inside it, and Emmy’s is no exception. Her throbbing rod feels wonderful sliding around inside your ass, and she’s actually thick enough to provide that glorious, ‘filled’ feeling.");
	pc.buttChange(emmy.cockVolume(0));

	//Prostate variances based on stored cum!
	var cum:Number = pc.cumQ();
	//Below 500!
	if(cum < 500) 
	{
		output("\n\n<i>“You’ve got a really nice ass, [pc.name],”</i> Emmy coos, swatting it. <i>“Now let’s see if I can find that prostate of yours!”</i> Adjusting her angle, the grunting girl thrusts her cock around inside you, thoroughly sliming every inch of your intestines in a relentless quest for the firm little bulb of your prostate. You know the moment she hits it - your [pc.cocks] jump");
		if(pc.cockTotal() == 1) output("s");
		output(", and ");
		if(cum < 250) output("a droplet");
		else output("droplets");
		output(" form on the tip");
		if(pc.cockTotal() > 1) output("s");
		output(". <i>“Oooh, it’s just a little guy. Don’t worry, [pc.name], I’ll give him a nice, warm cum-bath.”</i>");
	}
	//Below 10000
	else if(cum < 10000) output("\n\n<i>“Mmmm, nice ass, [pc.name],”</i> Emmy coos. <i>“Is that...”</i> She shifts her hips, pressing her cock down and forward, and pleasure explodes through your body. [pc.EachCock] jumps, slapping back down on the floor a second later and drooling something that looks halfway between your pre and [pc.cumNoun]. <i>“It is!”</i> Emmy wiggles her hips a few more times, making sure to hit that hot spot over and over, turning the floor beneath you into a slippery mess. <i>“Someone has a hot little cum-button!”</i>");
	//Huge gets it’s own scene!
	if(cum >= 10000)
	{
		output("\n\n<i>“Mmm, is that your prostate [pc.name]?”</i> Emmy coos curiously. <i>“It feels like it’s trying to push me out of your ass!”</i> She shifts her angle, and hot bliss explodes through your [pc.cocks]. Something halfway between pre and [pc.cumNoun] shoots out onto the floor in wide arcs. You can’t help it. The moment she started pushing on that spot, you couldn’t help but moan and cream all over everything.");
		output("\n\n<i>“Wow, [pc.name], you’re almost as backed up as me.”</i> She rubs your ass happily, sliding her cock back and forth in a slow grind while she talks. <i>“Don’t worry, I’ll make sure to squeeze out every drop. You just lie there and cum... like a good bitch.”</i> She presses on your prostate again, and any reply you have is obliterated by the tide of orgasmic pleasure erupting from between your legs. Emmy’s breath is hot on the back of your neck: <i>“Good bitch.”</i>");
		output("\n\nYou whimper. It feels too good and too strong for anything else. Your [pc.legOrLegs] turn");
		if(pc.legCount == 1) output("s");
		output(" to jello, but Emmy’s hands are right there, holding you up by your [pc.butt] to better savage your cum-balloon of a prostate. She pulls back, and your cock");
		if(pc.cockTotal() == 1) output(" sags");
		else output("s sag");
		output(" in relief, dribbling. Then she’s slamming right back in, prodding your prostate with the whole of her enormous, canine cock, rubbing her pre-cum into it even as she pushes your cum out of it. You feel like one of those little desk toys with the balls that bounce back and forth, only one side is Emmy pumping into you and the other is you squirting all over the floor.");
		output("\n\nThe more she hits your hot spot, the more the stuff pouring out of you looks like [pc.cumNoun], but you aren’t going soft... or feeling sated, at all. You want more. You want her to jackhammer against your ass. You want her to feel her fur on your cheeks and her knot inside you swelling wider, leaving no room for anything but her and her cum. It’s so hot. It feels so good... yet you <i>need</i> more. Looking back over your shoulder, you cry, <i>“");
		if(pc.isBimbo()) output("Like, h");
		else output("H");
		output("arder!");
		if(pc.isBimbo()) output(" Give me more cock!");
		output("”</i>");

		output("\n\nGrinning savagely, the furry dickgirl slaps your ass again, hard enough to leave a red mark. <i>“Suck your cock if you want more.”</i> Emmy slaps your ass again. <i>“Suck your cock, you big-dicked bitch.”</i>");
		if(pc.isBimbo()) output("\n\nThat’s a good idea! Why leave such a big, yummy cock drooling all over the floor when it could be in your mouth? <i>“Great idea!”</i> you answer, bending your neck down to slurp up your dick. You have to open your mouth pretty wide, but that’s just the price you have to pay for awesome dick!");
		else output("You cast a sharp glance over your shoulder, but Emmy rocks her hips confidently, pressing on your prostate just hard enough to make you dribble. Fuck it - you want to cum. You bend low, and after staring at your leaky dick for a few seconds, you open wide and slurp it up. Your jaw aches with the effort of it.");
		output(" It’s warm on your tongue, vaguely [pc.cumFlavor], and throbbing happily. You can’t help but give it a little suck and thrill at how great it feels.");
		output("\n\n<i>“Atta [pc.boyGirl], suck it,”</i> Emmy growls, putting pressure back on your prostate. [pc.Cum] jets into your mouth, forcing you to gulp it down lest it flood your mouth and shoot out your nose. Resuming humping, Emmy angles herself even further forward, pounding your prostate even harder than before. You can’t help but puff your cheeks out with the sheer volume of seed you squirt. In the few moments your mouth isn’t full of jism, you’re moaning around your dick like a wanton whore, amazed at how good the vibrations feel and simultaneously unable to stop yourself. Who cares if you look like some kind of cock-addicted fuck-slut. It feels <i>amazing.</i>");
		output("\n\nEmmy grunts with each ass-filling thrust. Her knot trembles inside you, on the verge of surging to full size, but the sensation of it pales next to the white-hot bliss that goes off every time she squeezes against your p-spot. Your belly is starting to feel full, but you keep swallowing, delirious with lust and unwilling to take the risk that Emmy might stop fucking you.");
		output("\n\nThe shop is filled with the wet sounds of fucking and sucking. The lurid slap of Emmy’s balls against ");
		if(pc.balls > 0) output("your own");
		else if(pc.hasVagina()) output("your [pc.vaginas]");
		else output("your [pc.butt]");
		output(" claps rhythmically, and between the mess on the floor and the scent of cock filling your nostrils, you have a hard time thinking of anything but sex and cum.");
		output("\n\n<i>“You like that, doncha, bitch?”</i> Emmy doesn’t sound like she expects an answer. Her hips thrust faster and harder, a little off-tempo. She’s <i>definitely</i> going to cum soon, you realize. She’s going to cum all over your prostate and flood your ass with jizz. Between imagining it, feeling your tongue on your cock, and having your prostate so thoroughly milked you find yourself crashing over the precipice and climaxing. [pc.Cum] pours down your throat unimpeded, and your [pc.asshole] clamps down around Emmy’s bloating doggie-dick.");
		output("\n\nLike a glutton, you love every lewd second, noisily gulping through the entire thing. [pc.CumNoun] dribbles from the corners of your mouth until a slimy trail hangs from your chin. Your [pc.belly] sloshes and wobbles, and just when you think it can’t get any better, Emmy sets the sexual equivalent of a nuclear bomb off in your ass, hosing hot jackal-jizz all over your insides, flooding your rectum with sticky spooge until you’re bloated from both ends and delirious with pleasure.");
		output("\n\nYour cock flops out of your mouth, smacking wetly to the floor. Emmy’s knot flexes, each absurd pulse leaving it larger than one before, sealing it inside your rectum, locking you in place so that when she thrusts, she drags you back and forth through the puddled sperm. The puddled sex-juice feels quite nice against your still-twitching prick, and with every slutty squirt into your ass, you leak your last few dregs of [pc.cum] into the miniature lake, utterly and completely milked.");
		output("\n\n<i>“Good bitch,”</i> Emmy purrs in your ear as she slows her motions, tugging you back by her cock until you’re forced to sit in her lap. <i>“Now you sit there until my knot goes down...”</i> She nips and kisses at your neck, and you’re hard-pressed to think of doing anything else, still drunk on residual eroticism of your anal climax.");
		//[Next]
	}
	//Normal cum volumez
	else
	{
		output("\n\nYou whimper needfully. Your whole ass is tingling, alight with pleasure, and Emmy’s back-and-forth stroking through your sphincter triggers involuntary contractions, all the better to milk her cock with. Sometimes those clenches force her mammoth pecker into contact with your prostate, and when that happens, you cannot help but cry out. It’s electric, almost orgasmicly pleasing, yet it doesn’t provide any sense of relief, only hunger for more.");
		output("\n\nEmmy’s shadow falls across you. Her breath is hot in your ear, and her voice comes out as a sultry growl. <i>“You like this - taking it like a bitch?”</i> She slams her hips into you - hard.");
		output("\n\nYou try to answer, but the impact robs your breath. Instead you shakily nod your head, watching goo trickle from your throbbing cock onto the floor. Your sphincter spasms, clamping down tight, and Emmy’s knot palpably pulsates, enlarging by the second.");
		output("\n\n<i>“Suck it, slut.”</i> Emmy’s voice is nearly as firm and commanding as the bitch-breaking bone lodged in your ass. <i>“You have such a big dick, and all you want is bent over and degraded. Go on then... suck it. Wrap your lips around that big, fat cock since you seem to like it so much.”</i> Her knot enlarges with every word, and the trickle of pre-cum oozing inside you transforms into a flood of something thicker. <i>“Suck your cock, bitch!”</i>");
		output("\n\nYour [pc.cockBiggest] is right there, right underneath you. It <i>would</i> feel good to have someone sucking it, even if you have to do it yourself. Caving in to the suddenly aggressive jackaless, you bend your neck low and suck your cock into your mouth. It’s messy from all the juices you’ve been leaking and tastes faintly [pc.cumFlavor] - not all that unpleasant. The [pc.cockHeadBiggest] twitches against your tongue, and you nearly cum from the pleasure on both ends.");
		output("\n\n<i>“That’s a - oh! - good - mmmm - [pc.boyGirl]!”</i> Emmy shouts, her angry red knot fully expanded in your ass. Her hips are lurching back and forth, dragging you across the floor by the bulb inside you, hammering into your prostate, forcing gouts of [pc.cum] to leak onto your tongue. Jackal-spunk is slopping everywhere inside you, filling you, flooding you, pressurizing you until you feel more like a condom for big-dicked herms than a [pc.race]. It’s delicious and decadent, and you’re moaning so stupidly that your big, useless cock flops out onto the floor, ");
		if(cum < 6) output("spilling its last few drops into a pint-sized puddle");
		else if(cum < 25) output("spilling a few ropes into a spermy puddle");
		else if(cum < 250) output("spilling thick ropes of sperm until a nicely-sized puddle of wasted [pc.cumNoun] adorns Emmy’s floor");
		else if(cum < 1000) output("spilling thick gouts of sperm in front of you until the floor seems half painted [pc.cumColor]");
		else if(cum < 10000) output("firing fat streaks of [pc.cumColor] sperm all over the place, splattering the walls and floor alike with your milked-out slime");
		else output("hosing out [pc.cumNoun] like water from a hose, nowhere near as forcefully as normal. The flow is thick as it is pleasurable, leaving you feeling like you’re swimming in a lake of your own sperm");
		output(".");

		output("\n\nAnd Emmy is <i>still</i> cumming too. Her dick is jerking around in your ass, wringing out any remaining pockets of [pc.cum], ensuring that every single drop you had is utterly spent. You shake and twitch, reveling in the feel if your [pc.cockBiggest] sloughing through it all, amazing at just how full your [pc.belly] is feeling. If your arms and legs weren’t bonelessly writhing, you’d probably be cradling it, that or jacking off yourself off, squeezing leftover sparks of bliss from your spent shaft.");
		output("\n\nIt is ecstasy, ecstasy so powerful that you can’t even keep your head out of the mess. You flop down and let Emmy mop the floor with you, your tongue hanging out, tasting your [pc.cumFlavor] [pc.cumNoun], and your eyes rolling back as rational thought leaves you.");
	}
	processTime(27);
	pc.loadInAss(emmy);
	pc.orgasm();
	pc.loadInMouth(pc);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	if(cum >= 10000) addButton(0,"Next",emmyHyperButtfuckCummyEnding);
	else addButton(0,"Next",emmyHyperButtfuckCumLiteEnd);
}

public function emmyHyperButtfuckCummyEnding():void
{
	clearOutput();
	showEmmy();
	output("You aren’t sure how long you sit there, but Emmy eventually walks you back to her shower. There, she’s free to pull out - and watch what must be gallons of jizz pour forth from your ");
	if(pc.ass.looseness() < 4) output("temporarily ");
	output("gaped asshole.");
	output("\n\nLooking entirely too confident, the hermaphrodite starts soaping you up. <i>“You liked that, didn’t you?”</i>");
	//Asshole
	if(pc.isAss()) 
	{
		output("\n\n<i>“Not as much as I’m going to like fucking you next time.”</i>");
		output("\n\nEmmy seems slightly chastised by the answer, but her nipples firm up nicely.");
	}
	//Else
	else
	{
		output("\n\nYou blush and nod. <i>“It felt");
		if(pc.isBimbo()) output(" super-dooper");
		output(" amazing.”</i>");
	}
	//MURGE :D
	output("\n\nAfter finishing up the shower, the two of you get dressed and step back out of the shop, ready to resume your normal duties.");
	
	processTime(8);
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Next]
public function emmyHyperButtfuckCumLiteEnd():void
{
	clearOutput();
	showEmmy();
	output("When you come to, you’re propped up on the floor outside Emmy’s shower, naked and still somewhat full of your lover’s issue. Judging by the dampness ");
	if(!pc.hasHair()) output("on your scalp");
	else output("of your hair");
	output(" and soreness of your ass, she must have have dragged you in there while you were still knotted and given you a thorough cleaning.");
	output("\n\nYour things are piled up next to you. You gather them up and walk back out to where you can hear Emmy humming and working.");
	processTime(22);
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//prostate stimulation Emmy [tbd title]:
//get emmy upside-down and stick hardlight up her pooper so her pre- and cum fall on her face
//emmy gives BJ/CJ/RJ from below PC; horses allowed in scene, but do not orgasm unless they have cock (emmy can't reach horse pussy)
public function emmyHardlightProstateFillToolTip():String
{
	var eBuffer:String = "Push Emmy upside-down, take hold of your hardlight sextoy, and use it to stimulate her prostate until she cums on her face. ";
	if(pc.isTaur() && !pc.hasCock()) eBuffer += "She won’t be able to reach your backside to reciprocate, though.";
	else eBuffer += "She might even be able to reach you with that long tongue of hers....";
	return eBuffer;
}

public function emmyHardLightProstateFillerUp():void
{
	clearOutput();
	showEmmy(true);
	author("Zeikfried");
	//first time
	if(flags["EMMY_PROSTATELIGHT"] == undefined)
	{
		output("<i>“You want to do what?”</i> Emmy asks, coyly.");
		if(pc.isBimbo()) output("\n\n<i>“Stick a toy up your butt and, like, tickle your prostate,”</i> you answer cheerfully. Even the hyper-sexual herm seems just a bit stunned by your brazenness. <i>“It’s super fun, I hear!”</i> you add.");
		else if(pc.isBro()) output("\n\n<i>“Work your prostate till you cum,”</i> you grunt.");
		else output("\n\nYou look innocent. <i>“Stimulate your prostate. You’ll enjoy it, I promise.”</i>");
		output("\n\nEmmy quickly gets into the spirit, however. She leans on the counter, squishing her cleavage to maximum display - possibly unintentionally, but probably not - and traces some idle doodles on the countertop with her finger. <i>“Show me how.”</i>");
		output("\n\nBaring your intent");
		if(!pc.isChestExposed() && !pc.isCrotchExposed()) output(" and a little skin, you strip and ");
		else output(", you ");
		output("activate your sci-fi underwear. A photonic prosthetic buzzes into life, jutting garishly from the surface of your ");
		if(pc.hasCock()) output("already-bulging ");
		output("crotch.");

		output("\n\nEmmy’s eyes twinkle. <i>“Ooh,”</i> she coos. <i>“I’ve heard of those. Like the sword.”</i> Her gaze flashes to one of the weapon racks for a moment.");

		if(pc.isBimbo()) output("\n\n<i>“It gets real hot like the sword, too,”</i> you giggle, winking.");
		else if(pc.isBro()) output("\n\n<i>“Sure,”</i> you reply. <i>“Let’s go. It’s fun.”</i>");
		else output("\n\n<i>“Sure,”</i> you reply. <i>“Much more pleasant to be stabbed with, though.”</i>");
		output("\n\nThe woman’s lips curl into a lewd, toothy grin. <i>“I bet.”</i> Her mouth works as she watches the lightspeed lewdness on your crotch bob with your movements, entranced and drawn out by her barely-repressed desires. <i>“What... do we do?”</i>");
		output("\n\n<i>“Unzip and");
		if(pc.isBimbo()) output(", like,");
		output(" get on your hands and knees");
		if(pc.isNice()) output(", please");
		output(".”</i>");
		output("\n\nEmmy steps briskly from behind the counter and moves her hand under her chin, clasping her zipper. She slowly pulls, exposing the line of her cleavage - the zip descends, through her breasts, down her ribcage, exposing inch after inch of brazenly exposed fur... until a sable peak interrupts the view.");
		output("\n\n<i>“Stop.”</i>");
		output("\n\nEmmy looks up from her zipper, hand hovering over her cock-tip.");
		output("\n\n<i>“Turn around and get on your hands and knees before you finish,”</i> you ");
		if(pc.isNice() || pc.isBimbo()) output("request.");
		else output("demand.");

		output("\n\nEmmy lowers her eyes - you’d swear she was blushing under her fur - and shyly drops herself to the ground. She turns about and stops with her big, round ass pointed at you. Wiggling it a bit, she pushes toward you, close enough that you can see her juicy balls in sharp relief, below the damp shadow of her pussy.");
		output("\n\n<i>“Like this?”</i> she asks. You nod, and she continues to unzip, releasing her stiff, lustful cock from its wrapper. It bobs underneath the sex-starved herm, dribbling a bit of pre that only heralds what you intend to unleash. Emmy continues to unzip until she can’t reach any further between her legs from the position you requested. <i>“You’ll have to finish me off,”</i> she says suggestively, flicking the little zipper with a long nail.");
		output("\n\nOh, indeed. You kneel and take the zip, pulling it gingerly over her sack, sure to brush the churning, seed-stuffed orbs with the back of your hand and feel their weight. The zipper continues along her perineum, revealing ");
		if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("the obvious shape of her herm harness’s dildo, which you swiftly yank out of place. Her sweltering pussy glistens, tempting you to visit, ");
		else output("a pussy that glistens in isolation and tempts you to visit, ");
		output("but you continue on until... her tight little pucker is finally revealed.");
		output(" It’s tucked into the very end of the zipper line, almost out of reach - almost. Emmy starts in surprise as you blow a puff of air at it.");
		output("\n\nYou slide off your expensive underwear. <i>“Here,”</i> you say, handing her the dildo. <i>“Why don’t you");
		if(pc.isBimbo()) output(", like,");
		output(" get this nice and wet?”</i>");

		output("\n\nEmmy takes the faux-cock eagerly, bringing it to her mouth and wrapping her long tongue around it with a lewd slurp. She coils and suckles on the dick like a lover’s, coating it with a layer of spit, and hands it back to you. <i>“Good?”</i> she asks, sweetly.");

		output("\n\n<i>“");
		if(pc.isNice()) output("Yes,");
		else output("You tell me,");
		output("”</i> you answer, pressing the spit-warmed cock to her pucker. Emmy jerks away with a gasp on instinct, then steels herself and pushes back, allowing you to slide the dildo into her asshole. A soft whine comes from the front of the jackal-girl as you push in, searching by feel for her prostate.");
		output("\n\nAnd then you find it. Emmy’s jaw drops and she grunts a ‘hnng’ as you nudge the organ; a line of pre spurts from her cock and drops to the floor with a soft sound, leaving a string of slippery fluid connected to the tip. You continue bumping it with soft strokes, teasing her anal ring on the draw-out and gently pressing in as you hilt the dildo. Emmy’s grunts turn to quick breaths as she tries to get a handle on the sensations. You wait for her to get distracted enough....");
		output("\n\nHer sounds let you know when it’s time. Just as Emmy begins pulsing with prostatic pleasure, you put your shoulder into her and push her bottom half into the air.");
		output("\n\n<i>“Hey, what the...!”</i> Emmy cries, as her elevated ass forces her weight over her head instead of her arms, the latter of which buckle and leave her leaning against the wall, standing on her shoulders with her face pointed up... right at her gushing cock. You smile ");
		if(pc.isNice()) output("apologetically");
		else if(pc.isMischievous()) output("mischievously");
		else output("sadistically");
		output(" and make a stroke against her prostate, producing a heavy glob of pre that lands right on her lips. <i>“Buh,”</i> she grunts, torn between irritation and lust.");
	}
	//repeat
	else
	{
		output("Emmy turns nervous at the suggestion. <i>“I guess so,”</i> she snips, pettishly. <i>“You made a hell of a mess of me last time, though. Are you going to help clean up?”</i>");
		if(pc.isAss() || pc.isBro())
		{
			output("\n\n<i>“Well... of course not,”</i> you answer, with a ");
			if(pc.isBro()) output("shrug");
			else output("cruel smirk");
			output(".");
		}
		else if(pc.isBimbo()) output("\n\n<i>“Ooh, but being covered in yummy cum is half the fun of it!”</i> you protest. <i>“Didn’t you enjoy it?”</i>");
		else if(pc.isNice()) output("\n\n<i>“I didn’t before because you seemed to be enjoying it... was I wrong?”</i> you answer.");
		else output("\n\n<i>“Last time I was waiting for you to stop playing with it,”</i> you reply, feigning a pout, <i>“but you never did, so I left.”</i>");
		output("\n\nYou start to expose yourself as you talk, and time yourself to activate the attention-grabbing toy on your underwear just when you finish.");
		output("\n\n<i>“Yeah, well... that’s....”</i> Emmy’s retort trails off as the laser-cut faux-cock springs forward.");
		output("\n\n<i>“That’s...?”</i> you prompt, pivoting your hips at her.");
		output("\n\n<i>“That’s... fine,”</i> Emmy finally answers, licking her lips. You can already see her swelling cock straining at her suit.");
		output("\n\n<i>“");
		if(pc.isBimbo()) output("You should, like, a");
		else output("A");
		output("ssume the position");
		if(pc.isNice()) output(", please");
		output(".”</i>");

		output("\n\nEmmy swallows hard, and begins to open her suit while you slide off your underwear. Her zip slides down, exposing her cleavage and stomach; her stored-up scent spills into the air like the musk of a breeding animal. She’s clearly been waiting for you. Before she’s cleared the navel her excited cock is already visible through the deepening gap, pulsing with veins, erect and waiting for love, so eager to put itself out there that she has to steady it with her free hand to keep it off the zipper.");
		output("\n\nShe finishes exposing her stomach, but now wants for hands to help hold her leg up while she passes the zip over her sensitive sack. ");
		if(flags["EMMY_QUEST"] >= 6 && flags["EMMY_QUEST"] != undefined) output("No longer hidden by her clothing, you can make out the lewd form of Emmy’s favorite sex-toy: the Herm Harness. You yank it out of the way, freeing her penis to flop forward,");
		else output("No longer restrained by her busy-elsewhere fingers, her penis flops forward,");
		output(" presenting in all its swollen, veiny glory and dribbling with Emmy’s anticipation. Her dark balls spill from her wrapper like melted chocolate, sticky and heavy. Once she’s exposed her asshole, she awkwardly gets down on the floor and pushes herself into the air - which allows her heavy breasts to escape her top and bounce against her neck. You steady her by catching a leg, and she relaxes.");
		output("\n\nAt least, until you push the dildo right under her cock to catch a drop of lube. Her expression betrays insanity as you turn the toy beneath her tap, tickling her slit and drawing rings of pre around it that grow thicker as she gets more excited. When you’ve teased her so much that you think she might undertake to suck herself off any minute now, you raise the dildo and press it to her ring.");
		output("\n\n<i>“C’mon...”</i> Emmy whines, eyes glazed over with lust. <i>“Do it already....”</i>");
		output("\n\nYou smile ");
		if(!pc.isAss()) output("eagerly");
		else output("smugly");
		output(" and oblige. The dildo slides into Emmy’s asshole with just a bit of resistance; tight enough that it’s still clearly novel to her but loose enough that you wonder if maybe she doesn’t play with putting her fingers up there. Emmy sucks air sharply as your toy traverses the nervous ridge of her hole, and you go right for the spot that gave the most payout last time");
		if(pc.isMischievous()) output(", hoping to land a glob of pre in her mouth while she’s wide open");
		output(". She snaps shut just as the first big string of smutty slime emerges, and it hits her in the nose.");
	}
	//merge intros
	output("\n\nEmmy retains her dignity admirably, even end-up - at least, initially. She moans, just a petite sound, and covers her breasts with feminine coyness like a pin-up hung upside-down by a blind man. They don’t remain still; her hands start to work her shapely breasts as pleasure mounts, willfully ignoring the huge, insistent dick that demands attention in front of her face. Emmy tries to close her eyes and enjoy the act passively, but a glob of pre hits her forehead and grabs her attention again.");

	output("\n\nHer eyes open and she reaches out, letting one big breast flop free to brush her cock aside coldly with a hand. Just like the last level of dignity, this one flees as well - a few seconds after she’s laid a stern hand on her throbbing glans, she begins to tweak and play with it, touching the sensitive tip and rubbing pre into it. Without thinking about it, she’s soon wrapping her cock in her fist and half-jerking off. Just short strokes at first, but you stimulate her asshole a bit more to help her lubricate her oversized prick. A magnificent glob of pre-cum pushes out in response to a sensational twitch of Emmy’s hips, ending up right in Emmy’s palm... where there’s little else she can do with it.");

	output("\n\nEmmy slathers her cock in her own fluid and begins to stroke, haltingly, then eagerly. The pre production works up and her cock is quickly more stimulated than she can handle. Pre runs from her like a tap, overflowing her hand and drooling constantly on her, matting her hair and spreading until her face glisters with male lube.");

	//PC has cock
	if(pc.hasCock())
	{
		output("\n\nA warm, wet touch finds your [pc.cockHead], and you peer around her voluminous balls to see what she’s doing. Emmy is completely lost in the sex, and has leaned in and glommed onto your own [pc.cock] with her mouth, winding up a sloppy blowjob as pre runs down her neck and into the rug of her hair that’s spread out over the floor.");
		output("\n\nHer efforts might be a bit distracted by your anal affection, but the herm’s long tongue still wraps you up in wet, enthusiastic dog-kisses and the sheer heat of the breath coming from her body makes you feel like you’ve hilted in pussy and it’s moving around you, spiral-striping your dick like a barber pole, winding and unwinding you in flesh.");
	}
	if(!pc.hasCock() && !pc.isTaur())
	{
		//PC has no cock and is not horse
		output("\n\nA warm, slippery touch finds your [pc.vagOrAss], and you pull back to see what Emmy is doing. She’s lost herself in lust, and her long, pre-drizzled tongue is stretching from her mouth, lapping at your neglected ");
		if(pc.hasVagina()) output("cunt");
		else output("hole");
		output(" like an oasis. Pre continues to fall from her, but she’s angled so far forward to eat ");
		if(pc.hasVagina()) output("pussy");
		else output("ass");
		output(" that it spatters on the underside of her tits, slicking her globes with lustrous sheen until their fur can hold no more and it begins to run off and decorate her neck instead.");

		output("\n\nEmmy’s tongue doesn’t play nice for long; within minutes she moves from teasing to penetration, sliding her surprisingly-strong oral organ through you with a powerful push. You shudder in ");
		if(pc.hasVagina()) output("delight");
		else output("your own miniature anal stimulation");
		output(" while her voracious appetite for sex takes the reins and her tongue flexes and curls in you, only just retaining enough focus to keep the dildo working. Her tongue is suspiciously good at sticking to the best parts of a pussy, and you wonder if Emmy is flexible enough and her face long enough to enable the sort of female masturbation you’re thinking...");
	}
	//merge all
	output("\n\nEmmy’s moans are getting more and more clipped; feminine yips fill the air and each one is cut off by a dildo-stroke right to her core. Her hand moves on her completely-wetted cock with a blur, stroking the shaft until it strains and stretches at its own taut skin, urging to burst with jizz and be free from the unrelenting pleasure. Her pussy is so sticky-wet that the fabric attached to your dildo has long since become a sopping mess, and the female lube is beginning to wick down your wrist ticklishly. You dutifully continue punishing her prostate, forcing higher and higher grunts from her, trying to time it so that her mouth is open just as a glob falls, but her mad writhing");
	if(pc.hasCock() || !pc.isTaur()) output(", oral affection,");
	output(" and pawing at her breasts with her free hand block you every time. ");
	if(pc.hasCock() || !pc.isTaur()) output("Wound up by her tongue on your sex and maybe");
	else output("Possibly");
	output(" irritated by being unable to land one in her throat, you redouble your efforts just in time for Emmy to have a bone-shaking orgasm.");

	output("\n\nGrunting painedly, she cums herself cross-eyed. Her swollen cock bulges and, amid the constant, pouring stream of pre, forces out thicker spurts of ropy cum. The first is sent crooked as her cock makes its initial lurch, and ends up splashed against the underside of Emmy’s breast. The second and third fly true as her male reproductive system shifts into gear, dropping from her glans onto her chin. She tenses with spasms, and more strokes of semen continue to drool out as you work her asshole, visible as white clouds in the stream of pre that now oozes onto her stomach and chest.");

	//if cock
	if(pc.hasCock())
	{
		output("\n\nEmmy’s blowjob fell into a momentary lull as she climaxed, but a jab on her prostate carries new life to her lips. Her tongue springs into action, curling around your [pc.cockHead] and spiraling over the tip. But something strange is happening with the friction. Her saliva is no longer thin enough that you can feel the bumps of her tongue, but thick and slimy and... heating up. It takes a moment for the reason to come to you. It’s her cum. Emmy’s cum is oozing down the wet, matted fur of her chin and into her mouth. The thought and feel of the sticky, slimy herm spunk engulfing your cock sets you off.");
		if(pc.cumQ() < 8) output(" Your cock twitches and deposits a few drops of your own [pc.cumNoun] in Emmy’s mouth, to mingle with hers.");
		else if(pc.cumQ() < 100) output(" Your cock spasms, firing your batch into Emmy’s mouth and swamping her own cum with enough to push it out the sides.");
		else
		{
			output(" Your cock jerks with such a huge load that Emmy almost loses her grip; your cum rushes through your slit and washes Emmy’s mouth clean, then begins to overflow onto the floor.");
			//(not horse)
			if(!pc.isTaur() && pc.cumQ() >= 6000) output(" You scoot forward a few more inches, plugging her throat and forcing the cum up her esophagus; Emmy coughs and her hands scrape at your [pc.legs] as your load distends her stomach far enough to push her still-drooling cockhead into the [pc.skinFurScales] of your belly.");
			else output(" If only you could scoot a bit further forward, you could get it down her throat....");
		}
	}
	//elseif not cock and not horse
	else if(!pc.isTaur())
	{
		output("\n\nEmmy’s ");
		if(pc.hasVagina()) output("cunnil");
		else output("anal");
		output("ingus stopped briefly while she was jerking and twitching in male fulfillment, but as she winds down, she once again resumes her upside-down licking... prompted, perhaps, by you squatting harder on her face. Her tongue glides tip-first ");
		if(pc.hasVagina()) output("down your [pc.clits]");
		else output("over your ring");
		output(", but something strange is happening on the stroke. The thin saliva of her tongue is turning thick... and warm... and slippery. It surrounds your ");
		if(pc.hasVagina()) output("clit");
		else output("ring");
		output(" in a gummy grip, smoothing the bumpy surface of her tongue to velvet. Your mind halts as you try to understand why her mouth is melting, and then it hits you in a wave - her thick cum is dripping into it and covering her tongue.");
		output("\n\nWith a slurpy push, Emmy pierces you one last time with a cum-slathered tongue-kiss, unintentionally carrying a thick load of her semen right into your [pc.vagOrAss]. The warm jizz being pushed through you sets you off and you orgasm, gratefully clamping down on her oral muscle as your lower body works out kinks with furious twitches. Your body squeezes so hard that you can feel Emmy’s tongue sharply as it pulls free - your ring of muscle has greedily scraped all the warm cum from it, preferring to keep it.");
		if(pc.hasVagina()) pc.loadInCunt(chars["EMMY"], 0);
		else pc.loadInAss(chars["EMMY"]);
	}
	//else if dickless horse, get a participation trophy
	else
	{
		output("\n\nEmmy’s ecstasy sets off a twinge of envy in you; your neglected ");
		if(pc.hasVagina()) output("pussy");
		else output("hole");
		output(" tingles for attention, too far away for a sixty-nine. You satisfy yourself by making a mental recording of the way the depraved jackal herm jerks and shoots spunk from her cock, splattering it on her own neck and breasts, and file it away for the next time you have some lackluster lovemaking. Emmy winds down ridiculously slowly, taking almost a minute to empty off her repressed libido, pouring out ten... no, twelve... no, more. So many strokes of cum are fired that the sheen of pre which covered her face before is completely ruined with white lines that dangle from her lips.");
	}
	//merge all to closer
	output("\n\nYou pull your dildo free, almost as wet as when it went in the slut. Her hole sighs and shudders at its absence, slowly closing again - but not completely. Emmy herself is completely dazed with joy; she slumps against the wall, covered in pre and cum, and her grateful eyes follow you as you re-dress. You finish and wait ");
	if(pc.isAss()) output("im");
	output("patiently for her to speak.");
	output("\n\n<i>“That was... good,”</i> she finally bubbles forth. <i>“You’re good.”</i>");
	if(!pc.isAss())
	{
		output("\n\n<i>“Then maybe I’ll ");
		if(pc.isBimbo()) output("</i>cum<i> again, sweetie");
		else output("come again");
		output(".”</i>");
	}
	else output("\n\n<i>“Shut up, baby; I know it.”</i>");
	output("\n\nEmmy laughs, and her drooping cock pushes out an aftershock, which <i>finally</i> lands right in her throat. As she coughs and laughs still, you make a quiet exit.");
	//do pc orgasm unless pc is horse and dickless, pass time, place pc at entrance to emmy shop
	processTime(35);
	if(pc.hasCock() || !pc.isTaur()) pc.orgasm();
	else pc.lust(10);
	IncrementFlag("EMMY_PROSTATELIGHT");
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].eastExit);
}