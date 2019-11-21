// Smut check
public function hasSmutOptions():Boolean
{
	//Mails that require ship presence for some reason:
	if(MailManager.isEntryViewed("extrameet_invite_email")) return true;
	if(MailManager.isEntryViewed("lets_fap_unlock")) return true;
	if(MailManager.isEntryViewed("steph_on_demand")) return true;
	if(MailManager.isEntryViewed("syri_video")) return true;
	if(flags["PENNY_SYRIVAG_WATCHED"] != undefined) return true;
	if(flags["KHORGAN_PREGSTURBATE"] != undefined) return true;
	if(pc.hasKeyItem("Video - Zil Nigh the Science Bi")) return true;
	//Ones that don't:
	if(MailManager.isEntryViewed("kiroandkallyholomail")) return true;
	return false;
}

//Enter Ship > Masturbate > Smut
public function smutFapMenu(fromPrevious:Boolean = false):void
{
	var inShip:Boolean = InShipInterior();
	
	if(inShip)
	{
		if(seranigansTrigger("computer")) return;
		if(seraBitcheningDebtCheck()) return;
	}
	
	clearOutput();
	clearBust();
	showName("\nSMUT");
	
	if(!fromPrevious)
	{
		if(inShip) output("Firing up your console with a few keystrokes, you settle back and ");
		else output("Activating your codex browser with a few taps, you settle back and ");
		if(pc.isCrotchExposed()) output("absently rest your hand on your groin");
		else output("free your crotch");
		output(" for ease of access while tuning in. What will you watch?");
	}
	else
	{
		output("Your " + (inShip ? "console" : "browser") + " is still active. Do you want to watch anything in particular?");
	}
	
	// First time: Cock Review
	// Repeat: New Let’s Fap
	// If the player becomes a Champeon: Let’s Fap
	// Champeons select from any of the episodes they’ve already viewed, or the newest one. The newest episode is just marked “New Let’s Fap” to keep the cock type a surprise.

	// New Let’s Fap episodes come out a week of game time after the player has viewed the most recent one, so that players don’t actually miss an episode if they don’t remember to check every week
	// Maybe add recordings of Steph’s show (up to the point that the PC has seen so far) for more starting smut options?
	var possibleFuncs:Array = [];
	var shipAvailableBlurb:String = "This option is only available from the ship’s console!";
	
	if(MailManager.isEntryViewed("extrameet_invite_email")) possibleFuncs.push({ t: "ExtraMeet", th: "ExtraMeet", tb: (inShip ? "Login to ExtraMeet." : shipAvailableBlurb), f: (inShip ? extrameetStartPage : null), ar: undefined } );
	if(MailManager.isEntryViewed("lets_fap_unlock")) possibleFuncs.push( { t: "LetsFap", th: "Let’s Fap", tb: (inShip ? "Watch Atha’s Let’s Fap episodes." : shipAvailableBlurb), f: (inShip ? letsFapSelectionMain : null), ar: undefined } );
	if(MailManager.isEntryViewed("steph_on_demand")) possibleFuncs.push( { t: "Steph OD", th: "Steph Irson: On Demand", tb: (inShip ? "Watch on-demand episodes of Steph Irson: Galactic Huntress." : shipAvailableBlurb), f: (inShip ? stephOnDemandVODs : null), ar: undefined } );
	if(MailManager.isEntryViewed("syri_video")) possibleFuncs.push( { t: "Syri", th: "Syri Video", tb: (inShip ? "Take a good look at that very private video Syri sent you." : shipAvailableBlurb), f: (inShip ? syriJackVid : null), ar: undefined } );
	if(flags["PENNY_SYRIVAG_WATCHED"] != undefined) possibleFuncs.push( { t: "Penny & Syri", th: "Penny’s Syri Vid", tb: (inShip ? "Check out this video -- you want another look at what’s happening between these two." : shipAvailableBlurb), f: (inShip ? pennySyriOnaholeVid : null), ar: undefined } );
	if(flags["KHORGAN_PREGSTURBATE"] != undefined) possibleFuncs.push({ t: "Khorgan", th: "Khorgan Video", tb: (inShip ? "Witness an incredibly pregnant and horny Thraggen woman masturbate to the thought of you." : shipAvailableBlurb), f: (inShip ? khorganPregsturbate : null), ar: undefined } );
	if(MailManager.isEntryViewed("kiroandkallyholomail")) possibleFuncs.push({ t: "KiroXXXKally", th: "Kiro XXX Kally Video", tb: "Witness a little show Kiro and Kally recorded for you.", f: kiroXKallyEmailShow, ar: undefined } );
	if(pc.hasKeyItem("Video - Zil Nigh the Science Bi")) possibleFuncs.push({ t: "Zil Nigh", th: "Zil Nigh the Science Bi", tb: (inShip ? "Brought to you by Girderbeam technologies Ltd." : shipAvailableBlurb), f: (inShip ? zilNightScienceBiPlay : null), ar: undefined } );
	
	clearMenu();
	
	var btnSlot:int = 0;
	var backFunc:Function = ((pc.lust() < 33 || availableFaps(false, true).length <= 0) ? arousalMenu : masturbateMenu);
	for (var i:int = 0; i < possibleFuncs.length; i++)
	{
		if(i >= 14 && (i + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", backFunc);
			btnSlot++;
		}
		
		var o:Object = possibleFuncs[i];
		if(o.f == null) addDisabledButton(btnSlot, o.t, o.th, o.tb);
		else addButton(btnSlot, o.t, o.f, o.ar, o.th, o.tb);
		btnSlot++;
		
		if(possibleFuncs.length > 14 && (i + 1) == possibleFuncs.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Back", backFunc);
		}
	}
	
	addButton(14, "Back", backFunc);
}
public function backToSmutMenu(toMainMenu:Boolean = false):void
{
	if(!toMainMenu) smutFapMenu(true);
	else mainGameMenu();
}


/* BY ADJATHA 

Atha - Futa Let’s Player
Design notes
Basically does a ‘net show (Let’s Fap) where she gets a variety of cocks, describes the feelings, then jerks off for the audience and gives it a review. Could also do a few variations on the formula, like an “unboxing” video, by trying out a new cock by cream pie’ing a friend’s “box.” Or a live streamed show where she takes prompts from the audience (player can vote on stuff to happen, etc.) Or a silly mode scene where she hosts a Q&A with various references and such in there (’how do you fap with boxing gloves on?’). Could have her videos on “Cum Streamer” or “Tremble” or something like it, possibly making it a subscription service or have her advertise her “Champeon” account for added monies. Players could subscribe to access her much older videos (prequel events). And don’t forget to Love, Comment, and Support!
*/

public function showAtha(bonus:String = ""):void
{
	showName("\nATHA");
	if(bonus == "") showBust("ATHA");
	else showBust("ATHA_" + bonus);
}

//..Introduction Email
//(Player receives an extranet message from a tech savvy NPC they have sexual relations with. Maybe Penny, Syri, Anno, or Embry?)

public function letsFapEmailUnlock():void
{
	//Save the name so that it doesnt change when the PC makes relations with someone higher up the list.
	
	if(!MailManager.isEntryUnlocked("lets_fap_unlock"))
	{
		flags["LETS_FAP_INVITE_FROM"] = letsFapUnlockFromName();
		MailManager.unlockEntry("lets_fap_unlock", GetGameTimestamp());
		AddLogEvent("<b>New Email from " + flags["LETS_FAP_INVITE_FROM"] + " ("+ letsFapUnlockFromEmail() +")!</b>", "passive");
	}
}

public function letsFapUnlockFromEmail():String
{
	var selMail:String = "";
	if(flags["LETS_FAP_INVITE_FROM"] == undefined)
	{
		//Pick sender:
		if(kiroTrust() >= 50) selMail = "piratebooty@sbemail.com";
		else if(saendra.hasCock()) selMail = "FlyGirl@PhoenixCargo.net";
		else if(penny.hasCock()) selMail = "fenneclaw@anime.fans";
		else if(flags["EMMY_QUEST"] >= 3 && flags["EMMY_QUEST"] != undefined) selMail = "emmy_astarte@cmail.com";
		else if(flahneDickOut() && (flags["FLAHNE_PISSED"] == 0 || flags["FLAHNE_PISSED"] == undefined)) selMail = "sweet_gurl@cmail.com";
	}
	else {
		if(flags["LETS_FAP_INVITE_FROM"] == "Kiro Tamahime") selMail = "piratebooty@sbemail.com";
		else if(flags["LETS_FAP_INVITE_FROM"] == "Saendra en Illya") selMail = "FlyGirl@PhoenixCargo.net";
		else if(flags["LETS_FAP_INVITE_FROM"] == "Penny Inoue") selMail = "fenneclaw@anime.fans";
		else if(flags["LETS_FAP_INVITE_FROM"] == "Emmy Astarte") selMail = "emmy_astarte@cmail.com";
		else if(flags["LETS_FAP_INVITE_FROM"] == "Flahne") selMail = "sweet_gurl@cmail.com";
	}
	return selMail;
}
public function letsFapUnlockFromName():String
{
	var selName:String = "";
	if(flags["LETS_FAP_INVITE_FROM"] == undefined)
	{
		//Pick sender:
		if(kiroTrust() >= 50) selName = "Kiro Tamahime";
		else if(saendra.hasCock()) selName = "Saendra en Illya";
		else if(penny.hasCock()) selName = "Penny Inoue";
		else if(flags["EMMY_QUEST"] >= 3 && flags["EMMY_QUEST"] != undefined) selName = "Emmy Astarte";
		else if(flahneDickOut() && (flags["FLAHNE_PISSED"] == 0 || flags["FLAHNE_PISSED"] == undefined)) selName = "Flahne";
	}
	else selName = flags["LETS_FAP_INVITE_FROM"];
	return selName;
}

//From: {NPC email address}
//To: [pc.email]@SteeleTech.corp
//Subject: You’re in to stuff like this, right?
public function futaLetsPlayerIntroEmail():String
{
	var ret:String = "Hey " + pc.short + ". I saw this show that you might get a kick out of. Basically, some girl does reviews of different dicks. She uses some machine to give herself a different cock every week and ends up soaked in her own cum more often than not.\n\nIf you’re gonna watch, you probably want to do so from the privacy of your own ship, ha ha.\n\nA site address has been included below.\n\n(<b>The Smut menu has been added to your ship’s Masturbate option!</b>)";
	// Adds new option to Ship’s “Masturbate” menu: “Smut”.
	return ret;
}

//[Champeon]
public function athasChampeonPage():void
{
	clearOutput();
	showAtha();
	output("Atha’s Champeon page is filled with fan art pictures her other Champeons have apparently contributed. The title reads: <i>“Support Atha in Creating Public Reviews for Exotic Privates.”</i> Below, there is a Support button, along with a long list of various top contributors. The main body of the site seems to be her sales pitch.");
	output("\n\n<i>“Hello! My name is Atha and I’m a critic for that most important of organs: the cock! Although born female, I’ve always had a fascination with the male genitalia. How it looks, how it feels, how it responds to subtle stimulation, just everything about it!”</i>");
	output("\n\n<i>“With a lot of hard work, I was able to acquire a Dong Designer and some recording equipment to memorialize my experiences. Doing these reviews has been the greatest experience of my life, and I would love nothing more than to keep sharing my reviews with you!”</i>");
	output("\n\n <i>“With your contribution, I promise to try out ever more exotic phalluses from every corner of the galaxy!”</i>");
	output("\n\nBeneath this, a number of donation tiers have been included, accompanied by screenshots of variously energetic orgasms.");

	output("\n\n<b>Faucet Tier:</b> Pledge 25 credits");
	output("\nAccess the recording history for all previous Let’s Fap episodes.");
	output("\n\n<b>Hydrant Tier:</b> Pledge 250 credits");
	output("\nAccess the recording history for all previous Let’s Fap episodes.");
	output("\nGain early access to new Let’s Fap episodes.");
	// new episodes go up every five days instead of every seven
	output("\n\n<b>Geyser Tier:</b> Pledge 2500 credits");
	output("\nAccess the recording history for all previous Let’s Fap episodes.");
	output("\nGain early access to new Let’s Fap episodes.");
	output("\nParticipate in a live CumStreamer episode, with a Q&A and special requests segment.");

	output("\n\nWould you like to help support Atha?");
	// [Faucet]   [Hydrant]   [Geyser]   [Leave]
	processTime(2);
	clearMenu();
	if(pc.credits >= 25) addButton(0,"Faucet",champeonAthaDonate,25,"Faucet","Donate at the faucet level, allowing you to view old episodes.");
	else addDisabledButton(0,"Faucet","Faucet","You cannot afford even this lowly donation tier!");
	if(pc.credits >= 250) addButton(1,"Hydrant",champeonAthaDonate,250,"Hydrant","Donate at the hydrant level, allowing you to view old episodes and get early access to new ones!");
	else addDisabledButton(1,"Hydrant","Hydrant","You can’t afford to donate at the hydrant level!");
	if(pc.credits >= 2500) addButton(2,"Geyser",champeonAthaDonate,2500,"Geyser","Donate at the geyser level, allowing you to view old episodes, get early access to new ones, and view a live CumStreamer episode!");
	else addDisabledButton(2,"Geyser","Geyser","You can’t afford that donation tier!");
	addButton(14,"Back",backToSmutMenu);
}

// if the player donates
public function champeonAthaDonate(amount:int):void
{
	clearOutput();
	showAtha();
	output("You fill out a short contact form and authorize the " + (isAprilFools() ? "dogecoin" : "credit") + " transfer. A small ding tells you that the transaction has gone through and a confirmation message has been sent.");
	if(flags["LETS_FAP_ARCHIVES"] == undefined)
	{
		output("\n\nPrevious episodes of Let’s Fap have been downloaded to your account!");
		flags["LETS_FAP_ARCHIVES"] = 1;
	}	
	if(amount >= 250) flags["EARLY_LETS_FAPS"] = 1;
	
	if(amount >= 2500) flags["CUMSTREAM_UNLOCKED"] = 1;

	MailManager.unlockEntry("champeon_comfirmation",GetGameTimestamp());
	pc.credits -= amount;
	//[End]
	clearMenu();
	addButton(0,"Next",backToSmutMenu);
}

//Confirmation Email//
// if the player becomes a Champeon, they receive an email from Atha:
//From: Atha Peters <CockAddict001@CumStreamer.com>
//To: [pc.email]@SteeleTech.corp
//Subject: Thank You For Your Support!
public function athaChampeonConfirmationEmail():String
{
	var ret:String = "Hello " + pc.short + "! I wanted to thank you for choosing to support me via Champeon! I hope you enjoy all my previous work and I’ll keep doing my best to give detailed reviews on the hottest cocks the galaxy has to offer!\n\nLove and kisses,\n\tAtha\n\n(Previous episodes of Let’s Fap have been downloaded to your ship’s console!)";
	return ret;
}

public const LETS_FAP_EPISODES:Array =
[
	letsFapAusar,
	letsFapLaquine,
	letsFapKuiTan,
	letsFapUnboxing,
	letsFapOvir,
	letsFapRahnScene,
	letsFapCockTail
];

public function letsFapSelectionMain():void
{
	clearOutput();
	showBust("LOGO_CHAMPEON");
	showName("");
	
	letsFapSelectionMenu();
	
	output("You bring up the Champeon site and log in. Above the main display, you access the rollout, find Atha’s channel tab and open it.");
	output("\n\nAccording to her page, you are currently");
	if(flags["CUMSTREAM_UNLOCKED"] != undefined) output(" a Geyser Tier");
	else if(flags["EARLY_LETS_FAPS"] != undefined) output(" a Hydrant Tier");
	else if(flags["LETS_FAP_ARCHIVES"] != undefined) output(" a Faucet Tier");
	else output(" not a");
	output(" donor.");
	
	output("\n\nMaybe there is something here that will catch your fancy...");
}
public function letsFapSelectionMenu():void
{
	clearMenu();
	if(flags["LETS_FAP_LATEST"] == undefined) 
	{
		if(letsFapTrack() == 0) flags["LETS_FAP_LATEST"] = LETS_FAP_EPISODES.indexOf(letsFapAusar);
		else if(letsFapTrack() == 1) flags["LETS_FAP_LATEST"] = LETS_FAP_EPISODES.indexOf(letsFapLaquine);
		else if(letsFapTrack() == 2) flags["LETS_FAP_LATEST"] = LETS_FAP_EPISODES.indexOf(letsFapKuiTan);
		else if(letsFapTrack() == 3) flags["LETS_FAP_LATEST"] = LETS_FAP_EPISODES.indexOf(letsFapUnboxing);
		else if(letsFapTrack() == 4) flags["LETS_FAP_LATEST"] = LETS_FAP_EPISODES.indexOf(letsFapOvir);
		else if(letsFapTrack() == 5) flags["LETS_FAP_LATEST"] = LETS_FAP_EPISODES.indexOf(letsFapRahnScene);
		else if(letsFapTrack() == 6) flags["LETS_FAP_LATEST"] = LETS_FAP_EPISODES.indexOf(letsFapCockTail);
		//if letsFapTrack returns a garbage value, reset
		else
		{
			flags["LETS_FAP_LATEST"] = LETS_FAP_EPISODES.indexOf(letsFapAusar);
			trace("Invalid lets fap unlock value.");
		}
	}
	addButton(0,"LatestEpisode",LETS_FAP_EPISODES[Math.min((LETS_FAP_EPISODES.length - 1),flags["LETS_FAP_LATEST"])],undefined,"Latest Episode","Watch the latest episode of Let’s Fap!");
	if(flags["LETS_FAP_ARCHIVES"] != undefined)
	{
		addButton(1,"Terran",letsFapTerran,undefined,"Terran","Watch the very first episode of Atha’s show!");
		addButton(2,"Equine",letsFapEquine,undefined,"Equine","Watch Atha try out an equine toy.");
		addButton(3,"Kaithrit",letsFapKaithrit,undefined,"Kaithrit","Watch Atha try out a kaithrit penis.");
		addButton(4,"Zil",letsFapZil,undefined,"Zil","Watch her try out a zil member.");
		if(letsFapTrack() >= 1 && flags["LETS_FAP_LATEST"] != LETS_FAP_EPISODES.indexOf(letsFapAusar)) addButton(5,"Ausar",letsFapAusar,undefined,"Ausar","Watch Atha try out an ausar member.");
		if(letsFapTrack() >= 2 && flags["LETS_FAP_LATEST"] != LETS_FAP_EPISODES.indexOf(letsFapLaquine)) addButton(6,"Laquine",letsFapLaquine,undefined,"Laquine","Watch Atha try out a laquine member.");
		if(letsFapTrack() >= 3 && flags["LETS_FAP_LATEST"] != LETS_FAP_EPISODES.indexOf(letsFapKuiTan)) addButton(7,"Kui-Tan",letsFapKuiTan,undefined,"Kui-Tan","Watch Atha try out a kui-tan member.");
		if(letsFapTrack() >= 4 && flags["LETS_FAP_LATEST"] != LETS_FAP_EPISODES.indexOf(letsFapUnboxing)) addButton(8,"Unboxing",letsFapUnboxing,undefined,"Unboxing","Watch Atha try out unboxing a toy.");
		if(letsFapTrack() >= 5 && flags["LETS_FAP_LATEST"] != LETS_FAP_EPISODES.indexOf(letsFapOvir)) addButton(9,"Ovir",letsFapOvir,undefined,"Ovir","Watch Atha try out an ovir member.");
		if(letsFapTrack() >= 6 && flags["LETS_FAP_LATEST"] != LETS_FAP_EPISODES.indexOf(letsFapRahnScene)) addButton(10,"Rahn",letsFapRahnScene,undefined,"Rahn","Watch Atha try out a rahn member.");
		if(letsFapTrack() >= 7 && flags["LETS_FAP_LATEST"] != LETS_FAP_EPISODES.indexOf(letsFapCockTail)) addButton(11,"Cockvine",letsFapRahnScene,undefined,"Cockvine","Watch Atha try out a cockvine tail.");
	}
	if(flags["CUMSTREAM_UNLOCKED"] != undefined) addButton(13,"Live Stream",liveCumstreamerEpisode,undefined,"Live CumStream","Catch her live CumStream!");
	addButton(14,"Back",backToSmutMenu);
}

public function letsFapTrack(arg:int = 0):Number 
{
	if(arg != 0)
	{
		if(flags["LATEST_LETS_FAP"] == undefined || arg > flags["LATEST_LETS_FAP"])
		{
			flags["LATEST_LETS_FAP"] = arg;
			if(flags["LETS_FAP_RELEASE_TIMER"] == undefined && flags["LATEST_LETS_FAP"] < LETS_FAP_EPISODES.length) flags["LETS_FAP_RELEASE_TIMER"] = GetGameTimestamp();
		}
	}
	return flags["LATEST_LETS_FAP"];
}

//Let’s Fap - Ausar #1
public function letsFapAusar():void
{
	clearOutput();
	showAtha("ZIL");
	//First view:
	if(flags["LATEST_LETS_FAP"] == undefined)
	{
		output("The girl on the screen seems to be human, at least from what you can see. She’s fairly young - perhaps 20 - and on the small side, with dusky, caramel skin and jet black hair that hangs down well past her hips in long, silky waves. A pair of half moon glasses bring out her playful, green irises, but the only piece of jewelry she seems to be wearing is a small jet stud set in the dead center of her forehead. She’s wearing a white dress shirt with a burgundy vest over it and a loosely cinched silk tie around her neck. Her hefty F-cup breasts strain against the shirt and vest, while the tie simply snuggles into the girl’s cleavage. There is a long white skirt around her curvy hips, with a brass clasp at her left side.\n\n");
	}
	output("<i>“Hi Net!”</i> the camgirl chirps, cocking her head to one side and flashing a bright grin. <i>“Atha here with exciting news! All my dear, sweet followers have made my Champeon account a huge success! And guess what? With their support, I’ve been able to buy a top of the line Dong Designer, from TamaniCorp!”</i>");
	output("\n\nShe blushes a bit, biting the tip of her thumb. <i>“I don’t know if I’m supposed to say this or not, but I kind of have some fans over at TamaniCorp and they sent me one of the new Stud Series. It’s not even available for sale yet!”</i> She clasps her hand over her mouth and nervously giggles. <i>“That means you guys get to enjoy some exciting new options in the next few weeks.”</i>");
	output("\n\nThe perky girl stands up, her excitement evident from the length tentpoling her pale skirt. <i>“As promised, I’ve been saving up all week, so this should hopefully be a really big load!”</i> Atha waggles a finger at the screen, offering a wry smile. <i>“But let’s not get ahead of ourselves. If we’re going to do a cock review, we’re going to need a new cock!”</i>");
	output("\n\nGrabbing the buckle on her right hip, the cam girl unhooks the latch and draws the skirt away from her legs like a theater curtain. Her smooth, dark-hued skin glistens with the soft shimmer of greasy lotion, her wide hips parting in a fist-sized thigh gap that draws the eye up to her groin. Sitting atop a pair of golf ball sized testes, the camgirl has a cute, 3 inch cock, already semi-stiff and bobbing in the air in time with her heartbeat. Her flushed tip peeks out from the folds of copious foreskin sheathing the fleshy tool.");
	output("\n\nRocking her hips back and forth slowly, she swings the little prick in front of the camera as she talks. <i>“As you can see, I’m still enjoying last week’s show. Let me thank TinyBee73 once again for that Zil Ration! Mhen’ga sounds like a super fun place to explore, so I hope you’re having fun out there!”</i> She waves vigorously with one hand, while the other loosely circles the luxurious coat of sloughed skin. <i>“I’m going to miss the sweet scent a lot, but I think mostly I’m going to miss just rolling all this foreskin between my fingers all the time,”</i> she blushes again, her bronze cheeks flushing a dark russet hue.");
	output("\n\n<i>“Just reaching down, into my skirt and rolling that sweet, sensitive tip in its loose, spongy sheath... well, let’s just say I can’t go back to that restaurant for a little while!”</i> She giggles and teasingly hides the small shaft behind the palm of one of her hands.");
	output("\n\n<i>“So,”</i> she continues with an impish smile, <i>“I know you guys have been asking for an ausar cock for a long time and I thought that as a special reward for everything you lovelies have done for me, I’ll finally give it a try!”</i> She claps her hands in front of her breasts, bobbing up and down as she does so. <i>“I’m super excited, you guys! Let me fire up the Designer and we’ll start the review,”</i> she promises, stepping out of frame with a foxy grin.");
	processTime(6);
	pc.lust(6);
	clearMenu();
	addButton(0,"Next",ausarLetsFap2);
}

public function ausarLetsFap2():void
{
	clearOutput();
	showAtha("AUSAR");
	output("When Atha steps back into frame, she is holding a small silk scarf over her crotch. <i>“Drum roll please,”</i> she says with a wink, before dropping the cloth. In place of the small, flesh-folded pucker of her bee dick, now she’s got a raised mound of skin set atop her pelvis. Just a hint of red peeks out from the sheath as her fingers trace lazy circles around the crest. Adjusting her glasses, the camgirl stands on her tippy toes to better frame the alien biology between her legs. ");
	output("<i>“Okay, first thing’s first- ausar don’t normally have sheathes. Their anatomy hangs free just like terran organs. But...”</i> she shrugs her shoulders, a little embarrassed. <i>“Well, after playing with my Zil cock all week, I kinda wanted to have a little bit of extra skin to play with! I plugged in a Kui-Tan sheath, but they’re pretty similar organs so hopefully the purists out there will forgive my little tweak.”</i>");
	output("\n\n<i>“As far at the sheath goes, it feels pretty WEIRD, ha ha! I mean, it’s like I’ve got all this mass, but it’s inside my body " + (rand(2) == 0 ? "rather than" : "instead of") + " outside? There’s a ton of pressure down there, too! Even soft, it’s like there’s all this potential, ya know?”</i> Her emerald eyes flash with an eager light, and the fingers circling her sheath speed up, fingertips dimpling golden, caramel skin.");
	output("\n\n<i>“Ha hah, I’m doing a bad job of explaining it. You wouldn’t know I talk for a living, would you? I will say, it’ll be nice to be able to wear tight pants this week, so that’s a point in the sheath’s favor. I always love it when fabric hugs my balls without the cock getting in the way,”</i> she murmurs, her thumb lovingly stroking the taut sack dangling between her plump thighs. <i>“The loose skin is pretty sensitive,”</i> she continues, squeezing the bulging lips between her forefinger and thumb. <i>“Not bad at all,”</i> she moans, her chest rising in a sigh that threatens the top button of her vest. <i>“I wouldn’t mind having that nibbled on during foreplay, or maybe even slapped,”</i> Atha teases, giving herself an open palmed smack across the pelvis.");
	output("\n\n<i>“Oh? Looks like somebody’s come out to play,”</i> the girl remarks with a delighted coo. The crimson tip poking between the girl’s burnished mounds gradually begins to expand and swell, emerging from her sheath one slow inch after another. <i>“Okay, I’m not going to lie- having this thing sliding between these sensitive lips feels friggin’ fantastic. When popping a boner feels as good as stroking it, you know you’re doing something right.”</i> Atha reaches a hand up to cup one of her breasts through the fabric while the other delicately, gently, tantalizingly plays across the inflating surface of the stiffening canid cock.");
	output("\n\n<i>“Oh, the tip’s so weird,”</i> she giggles. <i>“There’s no foreskin or anything, but the shape is really quite interesting!”</i> She thumbs the ausar crest, the sloping, blunted surface twitching at her touch. <i>“Eeee! Look at the cute little tip at the bottom of the cockhead! Oh my god, it looks like a little clit,”</i> she titters, squeezing the ruby peak between her knuckles. She gasps, her open mouth slowly curling into a pleased smile. <i>“Oh, it’s pretty fucking sensitive too,”</i> she chuckles. <i>“I wonder if they use the tip to poke into their mate’s womb? Open the way for the cum to pour in? If you know why ausar have hard, little clit-tips on their penises, leave a comment below for me, kay?”</i>");
	output("\n\nWith seven inches of wolf cock wobbling from her crotch, Atha turns to the side to give a better view of the shaft. <i>“So, as you can see, it’s already longer than my hand. I could really go for something bigger, but that’s just the size queen in me being greedy.”</i> She gives the audience a wink and lowers her voice a touch. <i>“Don’t tell anybody, but a really cool fan said that she’s got an inside track on some pretty sweet growth supplements. We might get to see just how big I can get next week. Maybe so big I can’t even walk,”</i> she muses, biting her lower lip and obviously relishing the thought.");
	output("\n\nShaking her head to dismiss the thought, the camgirl sends a rippling cascade down her nearly four foot long tresses. <i>“You can tell that the ausar dick is doing its job because I can’t focus on doing mine,”</i> she laughs. <i>“So, the shape is pretty cool, too. See how it swells in the middle and gets thinner by the tip and base? I’ll have to change the pressure of my grip as I stroke, which is a good habit to get into anyway, but is also means that I’ve got a milking motion more than just a typical rubbing one. Let me demonstrate,”</i> she adds, reaching offscreen to retrieve a dab of lubricating gel and begins rolling it between her palms.");
	output("\n\nOnce her hands are nice and glistening, she wraps one around her root while the other curls around her new shaft, fingertips barely able to touch at the widest swell of the canid cock. <i>“Ooo, I think we’ve got a winner, ‘Net,”</i> she sings, one eye closed to better focus on the sensations. <i>“No wonder everybody loves ausar - they’re built to breed! What I wouldn’t give for one of my dear viewers to be here right now,”</i> she moans, her hand speeding up, <i>“just bent over my desk as I shove this thick, hot cock right into their tight little body again and again. Oooo, fuck!”</i> she curses, the pitch of her voice climbing another register as she begins squeezing the firm tip of her canid shaft.");
	output("\n\nThe plump slit around her shaft parts, pushed aside by the emergence of another 2 inches of cock, the oval bulb of her knot pushing forward as the girl’s hips buck into the open air. <i>“Oh, damn...”</i> she pants, slowing her stroking enough to resume her narration. <i>“I’d almost forgotten about the knot,”</i> she exclaims with a gulp. One of her hands slides over the bulging orb, squeezing as tightly as she can as she bites down on her lower lip. <i>“Oh, gosh. So, for those of you without a knot,”</i> she starts, turning to face the camera with reddening cheeks, <i>“it’s like the ultimate in bitch-breaker technology. Nobody’s an ice queen with one of these in her,”</i> she laughs.");
	output("\n\n<i>“But on my end, it’s like this huge, numb lump that’s covering up my most sensitive nerve ever! It’s kind of frustrating,”</i> she moans, squeezing her knot again, so tightly that her fingers sink into the muscled flesh a bit. <i>“A bit like a built-in cock ring, really. I guess it’s there to discourage routine masturbation or encourage jamming it into a partner or something? It’s doable, but I’m going to have to work for this orgasm!”</i>");
	output("\n\nCollapsing into her seat, Atha scoots back a bit so the camera has full view of her scarlet titan, all nine inches throbbing with pent-up need. The lube from her hands coats the bulging member, giving it a glistening shine that almost makes it seem unreal, had you not just seen the bestial spire emerge from the camgirl’s bronze body. Her chest heaving under the straining confines of her shirt, the camgirl leans forward, the tip of her tongue just barely gracing the tip of her feral cockhead. <i>“Aw, if only I were a bit bigger,”</i> she laments, <i>“I could take the whole tip into my mouth and you’d get to see my gooey spunk shoot out of my nose!”</i>");
	output("\n\nShe quickly forgets her complaint as the pumping begins. One hand straining up and down the length of her shaft while the other squeezes the inflating globe at her root in time to her exhilarating pace. <i>“Oh... ohhhh... oh you guys. Fuck me! It’s so good... I just wanna- I wanna jam my cock in someone! I wanna fuck their tight little womb-hole with my clit-tip and squish my fat knot against their slit till the whole thing just pops in!”</i> She pulls both hands down to her fleshy node, compressing the wine-colored orb as her hips buck into the air.");
	output("\n\n<i>“Oh fuck! Oh fuck!”</i> she cries, her voice so high pitched the audio equipment barely catches it. Her cock wobbles heavily, tip swinging in the air as pre-cum bubbles to its broad, sloping surface. <i>“Gonna plug this knot in,”</i> Atha moans, her eyes closed, clearly lost in her own fantasy, <i>“seal you nice and tight. Just fill you up with my seed till your belly bulges with my hot, fucking cuuuuuum...”</i>");
	output("\n\nShe lets out a ragged gasp of surprise as her climax finally arrives, a long strand of alabaster spurting from her cock in a geyser of release. She seems stunned, her mouth hanging open, arms too weak to do anything more than feebly stroke her oblong canid mast. A dribbling stream of cream rises from the twitching member with every heartbeat, small cataracts of spunk spilling down her red lacquered shaft. Her hips buck again and another heaving blast jets from her body, streams of the goo lancing into the air before arcing over to splatter wetly all over the room.");
	output("\n\nThe gushing spring of her orgasm shoots ever higher as she milks her cockvein for all it’s worth. Blobs of her own jizz rain down on the camgirl, but she barely seems to notice the pearl slime forming dripping puddles in her long, black hair and only barely reacts when a loose rope deposits its sticky load across the bridge of her nose and across her thin glasses. At her base, the two inch knot swells before your eyes, tight muscle both contracting and expanding until it bloats to a brutish, fist-sized orb that practically throbs with irresistible girth.");
	output("\n\nAs her climax slacks, Atha seems to remember she’s on camera. <i>“Oh,”</i> she says with a squeak, clearing her throat to bring her voice back down to a normal. <i>“Oh man. That was... intense,”</i> she admits with a laugh. <i>“Woah. I see why you guys have been asking for that one!”</i> She pushes her glasses up, notices that they’re coated in her milky seed, and rolls her eyes. <i>“I was so excited to try it out, that I forgot to wear a condom again! What a mess,”</i> she teases, her mouth curled up in a crooked smile.");
	output("\n\nSher adopts a professional demeanor, totally at odds with her current cum-coated, fuck-silly appearance. <i>“As far as ausar cocks go: if you’re more a grower than a shower, this is definitely one you’ll want to try. The shaft takes some getting used to, and the head can make your loads hard to aim,”</i> she glances meaningfully around the slimy mess all over her desk. <i>“But, overall, I’d recommend it! Even if you don’t have somebody on hand to jam your knot into, the primal feeling of being a rutting beast is too good to pass up. Just remember to plan out a good block of time for yourself, ‘cause this thing,”</i> she pokes her meaty bulb, <i>“ain’t going away for a while! Good for a couple’s movie night, though! Nothing says intimacy like having your throbbing cock and a few gallons of spunk sealed up inside your partner for an hour and a half.”</i>");
	output("\n\nAtha seems to notice the cum dripping down the bridge of her nose, so she wipes it up with a finger and pops the slimy digit into her mouth with a wink. <i>“Thanks again for watching, everybody! If you want to see even more big, messy loads, don’t forget to Love, Comment, and Support!”</i>");
	output("\n\nWith that, the feed goes dead and a little orange message box pops up asking if you’d like to become a Champeon and support Atha’s cock reviews. Would you like to learn more?");
	//[Champeon]   [Turn Off]
	processTime(13);
	pc.lust(35);
	letsFapTrack(1);
	champeonOrOffMenu();
}

public function champeonOrOffMenu():void
{
	clearMenu();
	addButton(14,"Back",backToSmutMenu);
	if(flags["CUMSTREAM_UNLOCKED"] == undefined) addButton(0,"Champeon",athasChampeonPage);
	else addDisabledButton(0,"Champeon","Champeon","You’ve already backed her at the maximum level!");
}
//Let’s Fap - Laquine #2
public function letsFapLaquine():void
{
	clearOutput();
	showAtha();
	output("Atha’s bright smile beams into the camera, the brushed bronze of her dusky skin brilliant against her customary white dress shirt and burgundy vest and tie. Her considerable bulk of four foot long sable hair has been done up in a fat braid that hangs over one shoulder, snuggled up against her F-cup breasts on its path all the way down to the floor. The voluptous yet nerdy girl adjusts her half-moon glasses as she makes sure the recording devices are all set before nodding with delight.");
	output("\n\n<i>“Hi ‘Net! Atha here with another thrilling installment of Let’s Fap,”</i> she purrs, her chipper voice eager with anticipation. <i>“Now, what are we going to try out today?”</i> she ponders, tapping the small ebony gem set in the center of her forehead. <i>“I’ll bet it was going to be something cool,”</i> she teases, eyes twinkling with delight.");
	output("\n\n<i>“Oh yeah, we’re going to try out one of the new settings on my Dong Designer!”</i> she cries out, lunging toward the camera with a geeked grin. <i>“I know some of you were bugging out about how I teased some of the new cock options TamaniCorp put in their new model, but I can’t just go and spoil the surprise right away! The anticipation’s half the fun,”</i> she scolds with a laugh.");
	output("\n\n<i>“Oh, and let me just say that you guys are destroying my Champeon account! After last week, you just about bent her over and fucked her silly,”</i> the camgirl remarks with a huge smile. <i>“I’m so grateful to all of you for being so supportive and I can hardly wait to do some of the special Backer Rewards you guys earned.”</i> Her green eyes glint with naughty glee.");
	output("\n\n<i>“So, last week we did the Ausar model, and it’s been crazy fun. Every time I was hanging with my friends, all I could think about was the heavy pole inside my abdomen, hot with animal need.”</i> She blushes, turning her head sideways and biting the tip of her thumb. <i>“I might’ve knotted one of my friends by the end of the week,”</i> she confesses with bashful chagrin, hands anxiously playing with the thick braid slung over her shoulder.");
	output("\n\n<i>“Like, I didn’t mean to! I was totally going to save up all my cum for this week’s show, but the beast between my legs wasn’t having any of it! I was with Nett, watching some holovids and when she bent over to turn on a new movie, her short skirt sort of hiked up, and I noticed that she wasn’t wearing any panties! That is not my fault,”</i> she sternly asserts, her lips pursed into a pout. <i>“It just sort of happened! I jumped her and by the time the knot was inside, I realized I’d promised you guys big, messy loads like last time.”</i> She closes her eyes with a sigh of resignation. <i>“But at the time, all I could think about was jamming my doggy dick right into Nett’s hot womb and breeding her like a bitch in heat. I’m so embarrassed!”</i> She claps her palms over her face and rocks her head back and forth.");
	output("\n\nSlowly sliding her hands down until they just cover her mouth, she looks back up at the camera. <i>“But I’ve got good news too,”</i> she adds, raising one eyebrow. <i>“The Stud series of Dong Designers let you select ball modifications too. That way, your package can match your cock!”</i> She practically gurgles in delight, folding her arms under her ponderous breasts with a lecturing air. <i>“Obviously some changes are just cosmetic- like adding soft little fuzz to your sack. But for some races, the testes are really quite amazing!”</i>");
	output("\n\n<i>“So, to make up for leaving a gallon of spunk in little Nett’s pussy, we’ll be trying out the ball modification option with this week’s cock review! And you’ll never guess what we’ll be trying today,”</i> she giggles. <i>“No, not the one you’re thinking of- we’re saving THAT for a special Champeon milestone.”</i> The camgirl’s dress starts to lift up off of her lap as the Ausar dick beneath swells with her excitement. <i>“Ooops! Maybe I should just go make the change and get started, before this puppy pecker of mine gets me in any more trouble! Back in a bit, everybody!”</i>");
	output("\n\nAtha steps out of frame and when she’s returned, her face is flushed, a bead of sweat at her temples. <i>“Wow,”</i> she breathes warmly, <i>“this one is a bit of a rush, so give me a moment to adjust,”</i> she pants, loosening the tie around her neck and popping open a few buttons on the overfilled shirt holding back her buxom bust. <i>“Okay, okay, I’m fine,”</i> she mutters to herself, standing up in front of the camera.");
	processTime(6);
	pc.lust(6);
	clearMenu();
	addButton(0,"Next",laquineFapPart2);
}

//[Next]
public function laquineFapPart2():void
{
	clearOutput();
	showAtha("LAQUINE");
	output("<i>“Ha hah, sorry for the delay, it’s just that this one is a bit more intense than I would’ve thought. Maybe it’s the ball transformation? Anyway, let’s get on with the show,”</i> she offers a weak grin, her face flushed almost as red as her vest and tie. Grabbing the clasp at her hip, she whips off her long white skirt with a theatrical flourish.");
	output("\n\nAt the junction of her tawny, copper legs, a dark mound of flesh rises like the arm hole of a bunched-up sweater. The thick, meaty folds are smooth and as darkly sable as the girl’s pitch black hair. Beneath the plump, carnal sheath, a pair of heavy, apple-sized balls hang tightly against her groin. The glistening ebony flesh of the taut orbs seems almost impossibly dense, as if they were larger on the inside somehow.");
	output("\n\n<i>“Now, I know some of you are saying that the Hora model already had an equine setting. Well, this is actually a laquine cock, see?”</i> She turns in place slowly, showing off her new organ. <i>“It looks similar, but as anybody who’s been with one of those cute bunnies can tell you - they’re worlds apart. Especially where these are concerned,”</i> she adds, lightly hefting the substantial balls throbbing between her plump thighs.");
	output("\n\n<i>“Oh geez, how do I describe this? I don’t wanna get too metaphorical, but it’s like having a pair of black holes attached to your body.”</i> She gives them a small squeeze and one of her eyes twitches from the sensation. <i>“They are heavy, heavy, heavy! I can feel them churning away, getting my load ready with every passing second and - oh geez - I don’t know if they’re going to stop. I’d better hurry up with this review, or I’ll end up flooding my room with spunk!”</i>");
	output("\n\nReaching one hand down into her opened shirt, Atha begins fondling the wobbling bulk of her full chest, nipples poking up against the tight fabric. <i>“So, this guy takes a little more coaxing than the ausar cock, which is a good thing if you find yourself always dealing with over-stuffed pants.”</i> She clenches her teeth as her other hand rubs through the fabric of her shirt, pinching her nipples tightly. As she works herself up, the sheath on her pelvis quivers, its dark depths gradually opening as the broad, bulging laquine cockhead emerges. Long inches filling with lustful relish, the shaft flops out to its full length, dangling between Atha’s knees as it slowly stiffens, plump flesh filling with the girl’s wanton ardor.");
	output("\n\n<i>“Woof,”</i> she moans with a low whistle. <i>“Bigger than I thought she’d be! I’ve got to give the laquines this: they know how to tickle the size queen in me.”</i> Her tongue pokes out of the side of the camgirl’s mouth as she moves her hands to the mass of sensitive cockflesh jutting from her bestial sheath. Just as dark as the girl’s balls, her black cock makes her fingers seem positively dainty as they struggle and fail to completely encircle the barrel shaft of her thickness. <i>“Fuck,”</i> she sighs in appreciative delight. <i>“I’m not going to get anything done this week with a fat fuck-stick like this to play with!”</i>");
	processTime(5);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",laquineFapPart3);
}

public function laquineFapPart3():void
{
	clearOutput();
	showAtha("LAQUINE");
	output("Shaking her head, she returns to the task at hand. <i>“Okay, so the laquine dick has a lot of the good stuff I mentioned in my equine review back a few months ago. You’ve got size, you’ve got heft, and you’ve got this sweet medial ring.”</i> She strokes the bulging band of flesh about 3/4ths of the way down her member with a fond smile. <i>“Fuck, I love how these big horse cocks just make my veins bulge,”</i> she murmurs to herself, fingering some of the throbbing veins twisting their way up the elephantine mass.");
	output("\n\nThe floppy pole inflates in her hands, not so much growing larger as stiffer. Every wiggling bob she sends down its length produces a tighter oscillation, until the full firmness curves slightly upward from her crotch, a full 14 inches proudly on display. Atha turns to the side, sliding her palm up the length before stopping at the crest, her fingers hooked around to clutch the protuberant cockhead. <i>“The really cool thing about this cock, however, is its head. Take a look!”</i>");
	output("\n\nTurning back to the camera, Atha moves closer and closer until the massive immensity of her laquine peak fills the screen entirely. <i>“Just look at this beautiful biology,”</i> she says from behind the monstrous mound, her voice tight and strained. The cockhead is vaguely oblong, plump at the top with a smaller, split valley at the bottom. At the bottom center of the pulsing expanse, a fat, external urethra pokes out like a tiny mouth, the muscled tube twitching with the girl’s rising climax.");
	output("\n\nThe closeup on her cockhead ends when Atha pulls the organ to one side, her heart-shaped face brimming with panting delight. <i>“I’d almost considered busting my load right there, to give you a facial-eye-view of this thing in action, but then I’d need a new camera, ha ha! Besides, lemme show you one of the cool things about these cocks.”</i> She unbuttons the bottom of her vest, leaving only the very top cinched up. Lifting her laquine organ upward, she bends it back and forth, the pliant surface still supple despite its firmness. <i>“See? You can flop it around even while you’re hard! Great for when you wanna slap a fat ass but you’ve got your hands busy,”</i> she chirps, fingers pinching her nipples.");
	output("\n\n<i>“Now, don’t try this at home, guys. I’m a professional.”</i> She grabs her fourteen inch shaft and bends it down so that the head slides into her tight dress shirt. Pushing it upward, she feeds her length under her vest and between her hefty, F-cup tits until the broad crest quivers in her cleavage, just below her chin. <i>“Awesome, right?”</i> she asks, eyes fixed on her hypnotically pulsing cumslit as she slowly takes her seat.");
	output("\n\nOne hand massaging the base of her bulging stem while the other hugs her wobbling chest tightly, she begins to buck her hips, driving her girth between the pillowy mounds of her breasts. <i>“Oh yeah, this is the best kind of slow burn,”</i> she groans, her mouth hanging open with narcotic rapture. <i>“As with the equine model, the biggest problem I foresee with laquine shafts is finding a hole stretchy enough to stick them in. If you’ve got an extra large pocket pussy - or maybe just an extra brave pussy playmate - you’ll really enjoy using a bunny bone.”</i>");
	output("\n\nShe speeds up her stroking, craning her neck down to bring her lips close enough to kiss her expanding cockhead. Eagerly licking the sticky globs of pre-cum that sputter from her organ, Atha continues. <i>“The - huge - cum - vein-”</i> she says between her caressing laps, <i>“is - extra - nice!”</i> She squeezes fiercely at the bulky base, her pinkie dipping into her stretched sheath. <i>“And this slit... so big you just wanna stick something in there. Fuck your own dick, you know?”</i> she asks with a laugh. Entranced by the idea, she pokes the tip of her tongue against the swollen cleft, prodding the tender spout.");
	output("\n\nHer eyebrows leap up, her body bucking savagely as the livid spire surges with an irresistible climax. Her sheath dilates as the base of her root bulges with the weight of her mounting bliss. The thickening shaft puts so much pressure on her constrained chest that one of the buttons of her dress shirt pops off, pinging against the camera lens. At the very top of her towering length, the circular frill around her broad tip expands, flaring outward, like an umbrella opening.");
	output("\n\nWith an open mouthed smile of delight, Atha plunges her head down, taking the entire bulbous tip into her mouth just as her orgasm finishes the alpine climb through her meaty member. She gags as the cum fills her cheeks in an instant, spurts of jizz shooting from the sides of her mouth. She tries to swallow and keep the laquine seed down, but the first spurt is followed quickly by half a dozen others, alabaster cream geysering against the back of her throat faster than she can swallow. The camgirl makes a hacking gurgle and ivory streams of spoo spurt from her nostrils, knocking her glasses right off of her face.");
	output("\n\nShe releases the futile hold her untrained mouth has over her spasming shaft, mouthfuls of slimy spunk spilling out all over her exposed cleavage and soaking her white shirt to translucence. Gooey webs of saliva and sperm connect Atha’s gasping mouth to her erupting peak, as fresh jets of pearl stream into her face and hair. In moments, her bronze skin is buried beneath a dripping mask of creamy alabaster that plops against her lust-drunk body.");
	output("\n\nAfter more liters than you’d been prepared to count, her orgasm finally begins to slow. Flared tip still sputtering the occasional rope of jizz a few inches into the air, the camgirl begins to collect herself. Eyes still sealed behind a sticky mask of goo, she retrieves her slender glasses from her lap and daintily places them atop her nose. Blindly, she turns to the approximate direction of the camera and licks the spunk away from her lips. <i>“So, that’s what I meant when I was describing laquine balls as black holes.”</i> Her massive, cum-soaked tits bounce with her tittering giggle. <i>“I guess white holes would be more appropriate!”</i>");
	output("\n\nHer eyes flutter behind her glasses, trying to open. Finding them still glued shut by her spooge, she gives up and finishes her review without bothering to clean herself up. <i>“I would SO recommend the full cock and balls treatment. I don’t know how these girls produce this much cum, but they’ve got to be just about the hardest working testes in the galaxy! If you’re going to give it a try, be sure to pick up some XXXXXL-volume condoms, because you’re likely to burst just about anything smaller.”</i>");
	output("\n\n<i>“Hope you sweeties enjoyed the show! Next week we’re going to try something maybe a little less messy, but I promise it’ll be great. Remember to Love, Comment, and Support. Bye ‘Net!”</i>");
	output("\n\nThe show ends, the afterimage of Atha’s cum-drenched curves fading to black. The little orange message box pops up asking if you’d like to become a Champeon and support Atha’s cock reviews. Would you like to learn more?");
	//[Champeon]   [Turn Off]
	processTime(14);
	pc.lust(30);
	letsFapTrack(2);
	champeonOrOffMenu();
}

//Let’s Fap - Kai-Tan #3
public function letsFapKuiTan():void
{
	clearOutput();
	showAtha("KUITAN");
	author("Adjatha");
	output("When the show starts, Atha is in her usual spot, waving hello to the ‘Net with a cheerful smile on her face. Unlike usual, she seems to have forgotten to put on a shirt, her stacked upper torso barely hidden by her burgundy vest. In place of her typical tie, she’s wearing a small, green bowtie cinched around her thin neck like a silk collar. Her long black hair has been parted down the middle to either side and held in a pair of rope-like pigtails that sweep down the back of her chair to the ground. The camgirl is wearing her usual half-moon glasses on the tip of her tiny nose, her eyes unfocused with dilated pupils. The tiny black gem set in the caramel center of her forehead twinkles as she bobs her head this way and that, as if concealing a juicy secret.");
	output("\n\n<i>“So, I know what you’re thinking...”</i> she muses aloud. <i>“How could Atha tease the ball-modification of her Dong Designer and then NOT go for a kui-tan review?”</i> She giggles with spritely mirth. <i>“Oh, you poor dears,”</i> she gasps, her fingertips held over her mouth. <i>“To leave you in such suspense! Well, your wait is finally over, my lovely viewers, because I did a little pre-show preparation for this week’s episode!”</i>");
	output("\n\nSliding out of her chair, Atha stands up and adjusts her camera to focus entirely below her waist. The bulge of swollen testes makes small mounds under her long, white skirt. Without further ado, she unclasps the curtain and reveals the massive pair of gonads swinging between her thighs. Easily 12 inches long, the girl’s huge sack nearly matches the color of her plump, bronze legs, but for the slight shimmer that ripples down them as she moves, revealing a very fine layer of furry fuzz over the bloated bulk. She swings back and forth, letting the ponderous orbs slosh for the camera, their fluid inflation nearly tidal in its rippling movements. <i>“Like, woah, right? I changed these over yesterday, but I think the machine needs some calibration, ‘cause look how big I got! It’s supposed to take a full week to fill up like this- not that I’m complaining, he-heh.”</i>");
	output("\n\nThrough the show, she keeps a palm over her groin, concealing the mate to her imposing nuts. Slowly, finger by finger, she lifts her hand away from her crotch, revealing another new feature. In place of her thick, wrinkly, ebony sheath, the girl has a rotund, circular sheath, covered in the same fine, fuzzy fur of her balls. The pudgy, donut-like skin is fat enough to conceal the organ contained within, though a small trickle of pearlescent pre-cum slowly dribbles from the aperture at the center.");
	output("\n\n<i>“You guys may be wondering why I seem like I’m in such a hurry, but my kui-tan viewers probably know already,”</i> she offers a weak smile, a trickle of sweat running down her temples. <i>“The truth is, as much fun as having huge nuts may be, they’re REALLY distracting! I couldn’t even put on a shirt today, because the stimulation on my nipples nearly caused me to shoot my load twice! And then my tie tickling my cleavage nearly got me a third time,”</i> she admits, fingering the little bowtie. <i>“So we gotta do this quick before yours truly pops!”</i> Tucking her legs behind the weighty girth of her juicy spheres, Atha takes a seat once more, balls resting in her lap and spilling over the sides of her thighs.");
	output("\n\n<i>“Okay, so, the review. I did a little research on this one in advance and let me stress again- kui-tan balls don’t normally fill up this fast,”</i> she manages an uncertain laugh. <i>“But if you let them get this big, they are heavy. And I don’t just mean they make for good workout equipment, they’re heavy in every sense of the word. It’s like there’s this intense pressure on my chest, making it hard to breathe sometimes! My abdomen feels like I’m always on the verge of a climax, just all tensed up and ready to release. Even my head feels foggy,”</i> she sways again, her glasses teetering and nearly falling off her nose. <i>“It’s a bit like being drunk, but without the slurring,”</i> she observes, swallowing hard.");
	pc.lust(10);
	processTime(5);
	clearMenu();
	addButton(0,"Next",kuiTanLetsFap2);
}

public function kuiTanLetsFap2():void
{
	clearOutput();
	showAtha("KUITAN");
	author("Adjatha");
	output("<i>“I’ve got to be careful on this next part,”</i> she mutters to herself as she looks down at the swaying mass in her lap. Clearing her throat, the camgirl raises her voice, gaining an octave. <i>“The balls themselves are crazy sensitive. Like, you would not believe,”</i> she asserts as her fingertips start pressing into the pliant immensity of her sack. <i>“But they’re not over-sensitive, like most balls,”</i> she goes on, her stroking growing more fierce. <i>“Normally, if somebody flicks your balls, you’ll probably double over, right? Not so with kui-tan balls. Pretty much everything transmits as pleasure, no matter how aggressive!”</i> As a demonstration, she raises one hand up and delivers an open-palmed slap, the sharp note of her impact on the cum-filled scrotum sending ripples through her bulk.");
	output("\n\nThe girl’s mouth opens as her eyes squeeze shut, soundless moans sending shudders down her spine. The donut of her sheath dilates, a hefty shaft nearly the color of her burgundy vest lurches upward, thick blobs of pre-cum sputtering from its tip in a gooey shower that leaves slimy pools of thin liquid speckled across her massive sack. Her shoulders shiver as she slowly begins to breathe again. <i>“Wow,”</i> she sighs, panting and struggling to loosen her bowtie. <i>“Yeah, that’s pretty amazing. And oh hey,”</i> she continues, glancing down, <i>“Looks like the star of the show has made her appearance. This lil’ gal is a kui-tan cock. It gets overlooked a lot because of the balls, but don’t think for a minute that it’s not just as cool!”</i>");
	output("\n\nMastering herself, the flow of precum slows and stops, Atha’s hands using the tiny leak to polish her stiffening pole, greasing it up to a glistening sheen as she rolls all ten inches between her fingers with a showroom flourish. <i>“Not one, not two, but THREE knots on this sucker! They’re pretty similar to the ausar knot, but tend to be smaller and more manageable. You might get some leakage, especially with the volume of cum we’re dealing with, but since nearly the whole shaft expands, you’re pretty much guaranteed to nail the g-spot or prostate with a meaty care package that lasts for upwards of an hour!”</i>");
	output("\n\nResting her fingers atop the very peak of her shaft, Atha pokes the firm tip of her coral spire. <i>“So you guys got back to me and sure enough, the ausar tip, like my kui-tan tip here, is to stimulate a partner’s cervix. Awesome guess on my part, huh? Totally nailed it!”</i> Her fingers trace down the swell of her cockhead with tender caresses. <i>“The tip kinda looks like an upside-down heart, doesn’t it? So cute, oh my geeze.”</i> She rolls her fingers over one knotted swell, to the next and onto the third, her descent slowing as she reaches the widest point of each hefty protrusion. <i>“This is actually really cool- unlike the ausar knot, these aren’t numb at all. They’ve got separate muscles in each knot, too, so I can flex and milk myself with my own cock!”</i> She demonstrates, each knot tightening slightly, one after another, ending with a thick pearl of alabaster appearing at the very crest of her alien organ.");
	output("\n\nFinally, her fingers reach the stretched ring of her fuzzy sheath. Rolling it between her knuckles playfully, the camgirl looks back up at the camera. <i>“So, last week was super fun, but I’m pretty sure if I just let this load go free, I’ll end up needing all new recording equipment! But no fear, I picked up some Panzer condoms just for this occasion.”</i> She reaches offscreen and produces a long chain of shiny chrome foil packages, each about 4 inches long. Pulling one off of the bundle and tearing it open, she shows off the latex ring inside, its rolled length glistening with lubrication.");
	output("\n\n<i>“Okay, this is pretty nerdy, but I’ve just got to geek out about these for a second. This type is called the <i>“Molar”</i> series, not because it’s ideal for blowjobs, but because it is the exact volume of one mole of a gas. It’s a whole chemistry thing, but basically a mole is a very large number that ends up equalling 22.4 liters when it’s vapor. How cool is that? Not very, if it’s still in gaseous form!”</i> Atha’s silly grin shows that she enjoys the joke far too much and as she pushes her glasses up, you’re forced to consider that this exuberant sexpot may actually be a huge dork under all those curves.");
	processTime(5);
	pc.lust(4);
	clearMenu();
	addButton(0,"Next",kuiTanLetsFap3);
}

public function kuiTanLetsFap3():void
{
	clearOutput();
	showAtha("KUITAN");
	author("Adjatha");
	output("<i>“Okay, okay, let’s get on with the show,”</i> Atha chuckles, biting her lower lip as she shifts her attention wholly on her throbbing cock and bloated balls. With excited glee, she positions the condom over her heart-shaped crest and quickly rolls it down her length, the thin film sealing her kui-tan member in stretchy latex so tight it may as well have been a second skin. Fingering the reservoir tip with one thumb while her other hand begins pumping up and down her shaft, the camgirl tosses her head back, her heavy pony tails like a bridle around her head.");
	output("\n\n<i>“Please don’t think less of me,”</i> she pants, voice rising in a keening moan, <i>“but I don’t think I can last very long, guys! My cock is so hot in my hands! My sheath feels tight, like I’ve got a pair of lips locked down, sucking at my root! And this pressure, oh man, you guys. If you could feel this...”</i> she gasps, a shudder electrifying her body with twitching shakes. <i>“Oh, fuck me this is a really bad idea, but...”</i> Reaching off screen again, she pulls out a small vial filled with creamy white fluid. <i>“I read that if kui-tans drink each other’s cum, it sets off a cum-cascade...”</i> she squeaks. <i>“One of you sweet, sexy tanukis sent in your cum for me and well...”</i> She disengages the seal, a hiss of pressurizing vapor steaming from the preservation cap. <i>“Bottoms up!”</i> she toasts, flicking the vial back and emptying the gooey load into her anxious mouth.");
	output("\n\nShe swallows the spunk and the effect is immediate. Her balls visibly throb, expanding and inflating before your eyes. With a breathless moan, Atha begins pumping away at her cock furiously, both hands working her shaft while her hips bounce up and down, her voluminous sack slapping against her thighs with every impact. <i>“Oh shit, oh fuck,”</i> she whines, her jaw hanging open, tongue freely hanging from the side of her mouth. <i>“FuuuUUUuuck,”</i> she yipes as her orgasm begins, a geyser of spunk leaping from her ten inch shaft, the condom bloating with the sudden liquid weight of her budding climax. Pump after pump fills the condom, liter after liter inflating the latex bubble as the camgirl’s cum bloats the tight, glossy sheath with her ivory seed. Drooping under the weight of her discharge, the rubber begins to pull itself free, the taut, ringed neck sliding up her knots, one after another until it barely clings to the curved swell of her cockhead.");
	output("\n\n<i>“Oh, fuck,”</i> she curses quietly, noticing the full condom’s near spill. Gritting her teeth, she flexes all three knots to try to hold back the tide of her orgasm. Pulling the bulging mass of the prophylactic free, she ties off the apertured to the nearly 14 inch diameter globe she’s made. Using both hands, she hefts it off of her lap and onto the table in front of her, the latex bubble wobbling with the burden of her load. Grabbing another condom, Atha’s concentration slips for just a second and her knots relax just slightly. A leaping gout of spoo spurts upward, its arc sending the sticky rope splashing back down all over the bronze girl’s face and tits. She lets out a little <i>“eep!”</i> of surprise before she manages to get the next condom free and rolled in place.");
	output("\n\nHer kui-tan cascade in full effect, the camgirl manages to sputter out only vague, half-hearted descriptions of the mindless, meaty pleasure of her release before interrupting herself with aching moans and heavy gasps. Her body rocking in an attempt to keep pace with the turbulent spring spurting wildly from her spasming girth, it’s all she can do to replace one condom after the next, filling each Panzer up to the brink before tying it off and tossing it onto her table with a moist, splurching thud. Her balls begin shrinking, but as the orgasm winds down, it seems to grow more intense, her cum-slit dilating from the pressure of her continual climax.");
	output("\n\nFive huge latex pouches wobble with hydraulic urgency on the camgirl’s desk, each six gallon bubble rippling as Atha’s climax reaches its critical mass. The condom on her knotted ‘nuki cock fills with every double handed pump she delivers, her eyes closed in bliss and glasses askew from her furious jerking. She blindly reaches for another condom but, feeling nothing, opens one eye to find nothing but empty wrappers. <i>“Oh fuck me,”</i> she moans, both hands locked around her last condom as its corpulent capacity threatens to tug it off of her shaft. <i>“No no no no no...”</i> she moans as the bubble gets larger and larger, her balls rapidly shrinking now, from quivering melons until they are just about as large as apples. The condom’s latex grows thinner and thinner as it exceeds its maximum capacity and, knees clinched together, trying futilely to stop herself, Atha pumps just a few more loads into the straining orb.");
	output("\n\nWith a sharp, wet pop, the condom breaks! Gallons of jizz explode all over the girl, turning her red vest white in the blink of an eye. The spoo bathes her thighs and balls, thick cream splashing upwards to catch her face and several heavy globs even reach the camera lens, obscuring your view. A shocked, shuddering gasp comes from behind the curtain of blurry cum, quickly followed by the camgirl’s spritely laughter. <i>“Well, that’s a first! Condom popping on cam, all for my sweet followers,”</i> she coos. The blur of her body approaches the camera and the feed goes dark. In another second you can see a close up of Atha’s tastebuds as she cleans the lens with her tongue.");
	output("\n\nLeaning back, the dusky-skinned girl looks whitewashed, glistening seed covering her in a shiny lacquer, with the ringed neck of the exploded rubber still tight around her shaft. On both sides, the alabaster smeared girl is flanked by the heavy globes of the five intact condoms. <i>“One hundred and twelve liters!”</i> she giggles, proudly wrapping her dripping arms around the quaking bounty. A quick mental conversion translates that into 30 gallons and you can just about believe it too! The condoms are so hefty you can’t make up much of the girl behind them all.");
	output("\n\nWith a contented sigh, head resting atop the jiggling waterbed of her copious loads, Atha offers a distant grin. <i>“Would I recommend kui-tan genitalia? Fuck yes I would. If you do only one crazy thing in your life, you’ve got to give the cum-cascade a try for yourself. Words fail me,”</i> she muses, spunk dripping down her flushed cheeks. <i>“Do me a favor and nobody tell TamaniCorp about the bug in their Kui-Tan Balls setting, kay?”</i> she asks with an impish wink before the screen fades to black.");
	output("\n\nThe little orange message box pops up asking if you’d like to become a Champeon and support Atha’s cock reviews. Would you like to learn more?");
	//[Champeon]   [Turn Off]
	processTime(10);
	pc.lust(35);
	letsFapTrack(3);
	champeonOrOffMenu();
}

//Let’s Fap - Unboxing #4
public function letsFapUnboxing():void
{
	clearOutput();
	showAtha();
	author("Adjatha");
	output("When the title card snaps away, Atha is sitting in her accustomed place with a bright smile on her dusky face, her hands clasped together in excitement. The camgirl is wearing her customary red vest and tie over a dress shirt and a long white skirt cinched at the side with a metal clasp. Her lengthy black hair has been put into a series of thick braids that are hitched up in looping coils behind her, with a single, heavy plait affixed all the way around her head like a wreath. A large, tan box sits on the desk in front of her, still wrapped with delivery information.");
	output("\n\n<i>“Hi ‘Net!”</i> she starts, with an encouraging nod. <i>“Thank you so much for joining me for another week! Have I got a surprise for you! It looks like I’ve got some fans over at HumpHard too, and they sent me one of the new toys they’ve got in testing! So this episode is kind of an unboxing show!”</i> She gleefully raps her fingertips over the sealed package, giggling to herself in delight.");
	output("\n\nStruggling to suppress her anxious grin, the caramel skinned girl waves her hands in a soothing motion. <i>“Oh, but don’t worry, we’ll be reviewing another cock too. This is just a bonus!”</i> Without further ado, she begins tearing off the packaging, tossing handfuls of small, airy peanut shaped foam into the air as she digs into the hefty box. One by one, she produces a number of items from the box, turning them about for the camera before setting them down, onto the table in front of her. There is a pink, plastic two inch ring that seems to be adjustable at the side, a pair of matching pink earring clips, and a slightly curved pink bead. All three objects have blue, glowing lights in them that pulse at the exact same frequency.");
	output("\n\nWhen she finally finishes digging everything out of the box, Atha sets it aside and lifts up the small instruction sheet, giving it a quick read through in a matter of seconds. Adjusting her shallow, half-moon glasses, she sets the sheet down and turns back to the camera with a pleased expression that threatens to boil into mania. <i>“Oh my geez. You guys will never guess what HumpHard is making! I could tell you, but why not show you instead?”</i> Searching about, Atha grabs a large, violet dildo from off screen, setting it upright on her desk.");
	output("\n\nThe shaft appears to have been modelled after a gryvain shaft, its bulbous thickness flaring out wider and wider near the base, with a narrowing tip that almost resembles a stinger. <i>“This was a gift from an awesome viewer a while ago,”</i> she mentions as the rubbery toy wobbles on the desk. <i>“I’d mentioned that Nett was off on a trip and I was missing her and so you cool peeps sent me a gryvain cock to keep me company. And what great company it was, hehehe,”</i> she reminisces with a dopey smile on her face. <i>“Anyway, check this out! So the product’s working name is HoloHalo and let me show you why.”</i> She takes the curved bead in one hand and the plastic ring in the other. Slipping the ring over the tip of the dildo produces an immediate change in the bead. From either end of the tiny device, a looping ring of hardlight curves outward, meeting in the middle to produce a ring exactly the width of the dildo’s head.");
	output("\n\n<i>“Awesome, right?”</i> Atha marvels. <i>“But that’s not all!”</i> She slides the pink ring down to a thicker section of the shaft and the hardlight expands accordingly, growing wider to perfectly mirror the contents of its partner. <i>“HumpHard took a cockring and matched it up to a ring-gag,”</i> the camgirl explains with a sly grin. <i>“And as for the little clips here? Well, that’s linked to the ring-gag!”</i> She snaps the little clips to her ears and passes a finger through the hardlight band, shivering a bit as she does so. <i>“Eh-he-heh, yeah that’s good stuff. The clips give bio-kinetic feedback every time something passes through the ring. You can put them just about anywhere, but apparently it’s best if you put it somewhere sensitive, like a human clit or Ausar ears.”</i> With a little wink, she flips her tie over one shoulder, undoes one of the buttons of her shirt, and reaches in to snap the small devices to the nipples topping her F-cup breasts.");
	output("\n\nTrembling from anticipation, the skirt around Atha’s lap begins to tentpole up, propelled by whatever cock she has this week. She glances down and begins gnawing at her lower lip. <i>“Actually, I kinda wanna give this new toy a spin,”</i> she mumbles, face flushing a dark copper. <i>“You guys will forgive me if I make you wait a week to find out what I’ve got under here, won’t you,”</i> she asks in a sweet, pleading tone. Apparently assuming the answer is ‘yes,’ she pops the curved bead in her mouth and pulls the plastic ring under her skirt, apparently fitting it onto whatever she’s got between her legs.");
	processTime(5);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",unboxingLetsFap2);
}

public function unboxingLetsFap2():void
{
	clearOutput();
	showAtha();
	author("Adjatha");
	output("The cam girl’s mouth snaps open as the hardlight ring pries her maw apart in a huge, inviting ingress. The faint glow of the device illuminates the inside of her mouth, revealing the cute pink tongue while keeping her shiny white teeth firmly locked against the protective halo. <i>“Ooh hy. Hy Eee hiddn hycpec his ho hy ho hyg!”</i> she gurgles. Subtitles wink on under the display. <i>“Oh my. I didn’t expect this to be so big!”</i> they translate, helpfully. Experimentally passing a finger through her opened mouth, the camgirl undergoes another please shiver, the feedback from the clips just as effective while the halo is in use.");
	output("\n\nMischievously, Atha picks up the ponderous, azure dildo from her desk and gestures with it while she offers another muddled thought. The subtitle reads: <i>“You know, Nett gets mentioned so often on this show, I really ought to have her come on sometime. Really put my cock through its paces!”</i> Drool starts leaking down the side of her mouth as her continued attempts to speak get her yawning maw simply saturated. <i>“But for now, a stand-in will have to do,”</i> the translation goes on as the camgirl lifts the draconic dildo to her plumped up lips.");
	output("\n\nAs she inserts the girthy bulk past the glowing ring, Atha’s body trembles in delight, the clips on her nipples feeding untold pleasure directly into her nervous system. The tent in her skirt leaps upwards, the massive shaft beneath thickening with her oral stimulation. Using one hand to push the throbbing prick back down into her lap, the girl feeds more inches into her gagged mouth, tongue poking out to lick the shaft as her cheeks bulge with the synthetic member. Panting hotly, her body rocking under the buzzing bliss of her toy’s feedback, Atha gives up trying to talk in favor of merely moaning and whining as she slowly pumps the gryvain prick in and out of her mouth with increasing fervor.");
	output("\n\nThe secret prick in the camgirl’s lap fights against her suppressing grip, her mouth widening slightly as the swelling meat responds to her nipple’s humming ecstasy. Turning her chair sideways to give the camera a better view, Atha slowly feeds the alien member further into her mouth with steadily increasing strokes. Her neck begins to bulge as the rubbery cock is forced past her tonsils and into her taut throat. Bubbling foam builds at the corner of her mouth as the girl’s eyes roll up, chasing her burgeoning orgasm. The toy rewards the savage speed of her face-fucking with ever greater vibrations, milking her unseen shaft without even touching it.");
	output("\n\nWith a pin-point pupil focused entirely on the camera, Atha slams the dildo completely into her mouth, the fake balls at the base slapping against her lips wetly as her throat balloons with the draconic girth filling it. The hum of the clips on her nipples becomes so high pitched that you can no longer hear it, the silence more telling than a crash of thunder. Atha’s body rocks and shudders, back arching and legs thrashing under the concealing curtain of her long, pale skirt. The phallic length under it twitches, slipping past her trembling, powerless hand to turn her lap into a practical pavilion, 14 inches of girthy flesh spasming and discharging its load directly into the concealing fabric.");
	output("\n\nA huge wet spot spreads from the peak of her lap as the thick cum sprays into her clothing, occasional droplets propelled with enough force to shoot through the fabric and splatter on the chair she’s sitting in. Eyes wild with the hysterical climax rocking through her, Atha can no longer suppress her gag reflex, her entire body heaving with the effort of dislodging the suffocating dildo. She coughs and hacks, slimy inches slowly forced out until the entire cobalt length slips from her halo-ringed lips, a small river of sticky, viscous saliva drools down her face. The buzzing clips on her nipples slow and eventually fade to silence, giving the overwrought girl a chance to catch her breath.");
	output("\n\nPanting and drooling helplessly, she sits on display for a long moment, skirt completely soaked with her cum, clinging to the hefty length within but too bunched up to give you any idea what sort of shaft she has. She turns an exhausted, bliss-drunk expression to the camera and gives a weak thumb’s up before passing out in her chair, slavering drool still leaking from her gaping mouth while her clandestine cock spasms occasionally with the gooey aftershocks of her rather too intense orgasm. As the screen fades out, you wonder if perhaps HumpHard may have the clamp feedback turned up a bit high. Or maybe not high enough?");
	output("\n\nThe little orange message box pops up asking if you’d like to become a Champeon and support Atha’s cock reviews. Would you like to learn more?");
	processTime(20);
	pc.lust(35);
	letsFapTrack(4);
	champeonOrOffMenu();
}

//Let’s Fap - Ovir #5
public function letsFapOvir():void
{
	clearOutput();
	showAtha("OVIR");
	author("Adjatha");
	output("Today, Atha seems to be joined by a friend. The dusky skinned human is at her typical seat, vest and tie crisp and crimson while her prodigious hair has been tied up in a massive, messy bun that hangs down around her neck. Towering at her side, managing to look both embarrassed and bored, is a gryvain woman dressed all in tattered, shredded clothing. The loose, well worn shirt covering her C-cup breasts is dull gray with a simple message stenciled on it: <i>“fuck you you fucking fucker.”</i> Her human-like upper torso has a variety of eye-watering tattoos, many of which feature skulls, serpents, and- oddly- butterflies. Her hips and groin are covered by a skirt that seems to have been sewn together from tattered pieces of latex. The wings in her back and the tail thrashing back and forth behind her are covered in blue scales so dark they’re nearly nearly a midnight indigo. A pair of horns curl up from the top of her punky, pink dyed hair.");
	output("\n\n<i>“Hi everybody!”</i> Atha chirps with a wave. <i>“Like I promised, here’s my pal Nett! ‘Net, meet Nett!”</i> she giggles and the gryvain audibly sighs. <i>“Since I kinda messed up last week, I’m going to make it up to you this week with Nett’s help!”</i> The camgirl looks up at the imposing draconic woman with a fond expression. <i>“She looks so big and scary, but she’s a softy deep down.”</i> She grabs the winged woman’s whipping tail and pulls it in between her pillowy F-cup bosoms for a tight hug. <i>“And she’s my bestest friend!”</i> Nett grimaces with a slight blush and turns her back to the camera, her tail slowly wiggling in Atha’s embrace.");
	output("\n\n<i>“So a lot of you tried to guess what kind of cock I had last week and the good news is: some of you were right! Since we didn’t actually get around to reviewing it, I’ve kept the same one this week, which means I’ve had a chance to do some extra testing!”</i> Standing up and turning at a provocative angle, the camgirl sashays her hips and unlatches her skirt. With a flick, the white fabric pulls away to reveal... nothing. Atha appears to have a vagina right where you would expect to find one, but there is no trace of a masculine organ at all.");
	output("\n\nThe caramel-skinned girl’s smile brightens to nova intensity and she’s forced to hold a hand over her mouth so she doesn’t crack up. <i>“It was magic all along!”</i> she teases, wiggling her fingers. <i>“Ha ha, no I wouldn’t do that to you guys! It’s an ovir cock! TamaniCorp’s new Dong Designer has a feature that lets you turn your genitals into an internal gonad and with the placement of Ovir genitalia, you can get away with appearing to be just another typical girl! Wearing tight little panties or the sheerest swimsuit that you own, and nobody’s the wiser!”</i> She glaces over her shoulder at the impatient gryvain. <i>“Well, as long as somebody doesn’t keep teasing you with the tip of her tail, that is! Then, it turns into quite a scene.”</i>");
	output("\n\nPoking at the slight swell of her labia, Atha leans back to give the camera a better view. <i>“So the Ovir have what’s called a cloaca, which is a lot of biology but it basically comes down to a bunch of internal, multi-use business. Both the males and the females have one of these vaginal slits, but if you look, you can see that there’s no clitoris! All of their stimulation is internal. So, Nett, if you’d be so kind...”</i>");
	output("\n\nWithout turning around, the draconic woman’s tail loops up, her tip sliding along Atha’s exposed thighs and coiling around the bare slit of her cloaca. With a teasing reluctance, it plays across her lower lips for a minute before slipping an inch into the girl. The camgirl lets out a happy little squeak and holds her hands over the wiggling tail, keeping it firmly in place as she continues. <i>“Ovir all have breasts, regardless of their gender, with men actually having larger breasts than women! They don’t have nipples though, so it’s mostly for bragging rights,”</i> she chirps, her face reddening as Nett’s tail keeps at it inside of her.");
	output("\n\n<i>“Ooo, I think we’ve got liftoff,”</i> she mutters, biting her lip and pulling the gryvain’s tail out. Pulling the wagging member to her lips, she plants a dainty kiss on the navy blue scales. Between her legs, meanwhile, the slit of her cloaca begins parting, a broad, cylindrical girth slowly spilling out. Its meaty excess dilates her lips as smooth, coal black flesh extends from her bronze cunt. <i>“Ovir shafts can be nearly as colorful as their scales, though in my case, I guess it’s just matching my hair color,”</i> she offers with a shrug.");
	output("\n\nThe alien cock reaches nine inches before a slightly larger medial ridge pops out, followed by a slightly darker sheath that covers the remaining five. Deployed but flaccid, the thick pole hangs from the camgirl’s pelvis like a third leg. <i>“Ovir dicks share some common elements with equine or laquine cocks,”</i> she explains, hefting it up with both hands. <i>“The medial ring and the lower sheath are the big ones, as you can see. The head has little ridges, but it doesn’t have the same degree of flare as a laquine member. From what I read, that’s because the vaginal cavity inside the cloaca holds cum really well, so you don’t need to block it from splashing back. But, apparently it requires a special position to reach, which is kinda weird, huh?”</i>");
	output("\n\nHoisting her shaft all the way up, Atha lets the corpulent member slap against her tightly bound chest, exposing the thick urethra. <i>“In terms of use, the Ovir cock is pretty fun, but it’s definitely not the most sensitive shaft I’ve had. I kinda miss my balls, too! The internal stuff is neat, but you really can’t replace a pair of huge, cum-swollen globes just twitching for release. Oh well!”</i> Turning to her draconic companion, the camgirl tugs at one of the gryvain’s wings. <i>“You wanna do the thing now?”</i> Nett looks over her shoulder, glancing down at the massive Ovir cock clutched to Atha’s F-cup tits and arches an eyebrow. Rolling her eyes, she sighs and steps off-screen.");
	output("\n\nThere’s a grinding noise, as if furniture is being moved to the side and Atha leans in close to the camera, lowering her voice. <i>“Don’t tell her I told you, but when I mentioned the HumpHard toy I got last week, Nett started begging me to let her try it out. I’m serious, she was on her hands and knees!”</i> She giggles conspiratorially, adjusting her glasses. <i>“She likes to act all cool, but give her a little tweak and she’s as needy as a bitch in heat,”</i> she confides with a wink. The source of the noise comes into frame as the massive dragon girl shoves a heavy massage table into frame, a half circle cut out of the end where the head would dangle. Nett chuffs, arms folded under her chest and leans against it, her tail tip lashing behind her with an eagerness that she carefully keeps from her face.");
	output("\n\n<i>“Up you go!”</i> Atha commands in a sing-song tone, letting the soft mass of her cock drop so she can tap the bed-like table with both hands. Nett climbs up and lies on her back, wiggling her tail through a gap that seems to have been made for just such a purpose. Her wings dangle to either side and her head leads back into the recess, chin making a straight line with her throat.");
	output("\n\nAtha skips over to the dragoness’ skirt and lifts it up just enough to reveal the pale blue gryvain cock underneath- nearly a twin to the dildo the camgirl was deepthroating last week. With a pleasant humming, she attaches both pulsing HoloHalo clips to her friend’s shaft and lets the patchwork skirt fall back in place. Beneath the table, Nett’s tail begins thrashing excitedly, but up above she simply yawns. The busty host of the show uses the yawn to pop the inactive ring into the dragon girl’s mouth while she slips the pink circlet around her ovir girth. Nett’s mouth immediately snaps open, the hardlight blinking to life with a faint glow. Despite herself, the sudden application of the ring gag seems to have caught the gryvain by surprise, her skirt twitching.");
	output("\n\nThe camgirl takes her position at the front of the table, her friend’s head conveniently at groin level. <i>“One thing they don’t tell you when you get a gryvain pet is just how often you’ve got to swab out their throats,”</i> she jokes, lifting her fat cock to eye level with the dragoness. Nett takes a deep breath, her chest rising in anticipation as the ovir organ nears her gaping maw. <i>“Maybe it’s just me, but it seems like ovir dicks are always slick. Pre-lubricated from the cloaca, I guess,”</i> Atha muses as she plunges the ridged tip of her hefty cylindrical shaft into the other girl’s mouth.");
	output("\n\nA small buzzing starts under Nett’s skirt and her eyes widen even as her slitted pupils narrow to a hair’s breadth. Atha rocks back and forth, easily sliding four or five inches into her friend’s mouth in a single stroke. <i>“Oh my! This halo-gag seems made for an ovir cock! The flat tip makes for an often awkward entry, but with the ring in place, everything’s nice and... open!”</i> She illustrates her point by plunging all the way to her medial ring - a full nine inches into the dragoness’ mouth. Her throat bulges from the intrustion, visibly swollen with the heavy meat inside. The buzzing under her skirt kicks up to high gear and her tail thrashes madly beneath the table.");
	output("\n\nAtha pulls back until only her tip is still in Nett’s mouth, gooey drool dripping from her slick inches in sticky strands. <i>“Ovir cocks tend to be pretty huge, so they take a while to stiffen, but I think we’ve got a pretty good firmness here,”</i> she says with an affectionate smack on her rod, the impact sending gooey slaver dribbling down onto her friend’s face. Nett winces, her jaw tightening, but the ring gag holds her mouth in a perfectly permissive pucker. Atha teasingly slaps her cock a few more times, sending further drips down with a giggle. <i>“Oh, Nett’s gonna punish me for this later,”</i> she coos. The gryvin turns her furious eyes toward the camera and gives an enthusiastic nod, though her shaft has brought the patchwork skirt to a precipitously steep slope.");
	output("\n\nGoing back to running her cock back and forth into the dragoness’ mouth, Atha closes her eyes to better enjoy the face fucking. <i>“The ovir are definitely built for depth,”</i> she moans, her hands closing around the other girl’s horns. <i>“There’s not much of a cockhead and it’s way less sensitive than most types, which is kind of a bummer. But the shaft gets more receptive the further down you go, which is a neat change. Really encourages you to get all the way in there,”</i> she grunts, her thrusts becoming more aggressive as the camgirl fucks her friend’s throat on camera. The dragoness must have amazing lung capacity, because she seems perfectly at ease with nine inches of meat bulging back and forth in the taut pussy her friend has made of her esophagus.");
	output("\n\nAtha begins panting, as her long strokes become faster and more shallow. <i>“It’s actually pretty... intoxicating,”</i> she huffs. <i>“The deeper you are, the deeper you want to be,”</i> she whines, her medial ring slapping the gryvain’s lips. <i>“Maybe, just a little bit...”</i> she groans, pushing the oversized ring against the glowing halo as she uses Nett’s horns for added leverage. With a slow, agonizing effort, Atha manages to pop the fleshy band past the gag, sighing with pleasure. The dragoness, meanwhile, shudders at the added intrusion, her tail convulsing beneath her while the vibes on her shaft go white hot. Her hips buck and the skirt falls away as her cyan shaft spurts alabaster ropes into the air.");
	output("\n\nAtha laughs with delight at her friend’s orgasm and sets to pumping the final five inches into her throat. The gryvain’s wings flap ineffectually and she seizes the edges of the table with both hands, powerful fingers crunching the firm padding as her death grip tightens. The camgirl thrusts easily now, making the full use of her tender root. You can see the added girth of the medial ring distending the dragoness’ throat as the bloated member pounds into the gorged gryvain. Nett’s orgasm carries on, her draconic dick spasming helplessly at the twin assault of both feedback clips, her puffy cum-vein trembling at the milking bliss paralyzing everything but her wild tail. Thick gouts of cream arch up from her twitching length only to fall back down and splatter against the pale skin of her narrow abdomen or the ultramarine scales of her thighs.");
	output("\n\n<i>“O-oh! Here it comes!”</i> Atha bottoms out against her friend’s tender lips, the girth buried in her throat swelling with the camgirl’s surging load. Her hands tightly locked around Nett’s horns, arms straining with the effort of locking her hips to the other girl’s face, Atha clenches her teeth and lets out a high pitched moan. Seemingly, nothing happens for a minute or two - except for the continued gush of Nett’s spurting release. Gradually, however, you can make out the faintest swell appearing in the dragoness’ belly, the bulge growing with each passing second. Atha whines again, her hips feebly bucking against her friend as unseen gallons pour past her poor, stretched neck and directly into her stomach.");
	output("\n\nThe dragon girl’s taut abs vanish beneath the inflating weight of the camgirl’s voluminous climax, her waistline growing until it seems she’ll be buried under the wobbling mass of her gut. As if remembering that the other girl may want to breath some time soon, Atha lets out an embarrassed <i>“eep!”</i> and pulls back, sliding her medial ring past the hardlight halo with a wet pop. All fourteen inches slide out of the dragoness’ throat, slick and shiny with the foamy mixture of sticky saliva and gooey cum. When the broad, flat tip finally slides out of her lips, the softening cock flops down, slapping the reclining girl across the face with a wet impact. The gryvain coughs, a thick blob of cummy drool splurting from her mouth as she pants in sweet, fresh air once more. The clips on her cock go silent and her orgasm finally winds out as well. Letting out a noise somewhere between a groan and a contented sigh, the dragoness strokes her heavily tumescent belly with both hands, marvelling at the hot, fluid weight within.");
	output("\n\nA shy smile on her face, Atha turns back to the camera. <i>“So,”</i> she starts with a deep gasp, <i>“the ovir cock. It’s got a lot of cool features and a lot of kind of lame features, but over all, not a bad time! If you don’t mind going deep, definitely give it a try! But if you’re used to a softer, more tender experience, you probably won’t get very much out of it.”</i> Glancing over at her friend’s bloated belly, the camgirl gives a helpless shrug. <i>“And while I didn’t give the internal gonad much credit, it certainly seems to have done its job, so I guess it’s not too bad after all! And hey, for once I don’t have to clean up the set afterwards!”</i>");
	output("\n\nNett’s indigo tail wraps around Atha’s waist, pulling the smaller girl close to the prone dragoness. With a swift motion, she unhooks the sensor ring from the camgirl’s flaccid cock and pops the inactive ring gag from her mouth. Just as quickly, she slams the sensor ring right back down the ovir prick and plucks both vibe clips from her cock and attaches them to the hyper tender base of Atha’s organ. Holding the glowing halo with one hand and lifting the bulky alien dick with the other, she slides the ring all the way down, forcing it past the medial ring with a trivial display of strength. The vibes roar to life, the camgirl’s face going from affectionate amusement to boneless shock in an instant. She collapses to the ground, gurgling as her member springs to life once more, sending spurts of pearlescent slime into the air as she ineffectually tries to pull any of the sextoy pieces from her shaft.");
	output("\n\nNett slowly climbs down from the massage table, her belly swaying with its ponderous burden. She walks toward the camera, her tail whipping behind her. <i>“Needy as a bitch in heat, huh?”</i> she echoes, her tail curling around the spasming length of Atha’s ovir cock. With heavily lidded eyes and a crooked grin, she cocks her head to one side. <i>“Yeah, that I am, I suppose,”</i> she admits. <i>“Just don’t tell that dorkbutt I said that, kay?”</i> Raising an eyebrow, she hits a button, ending the show just as the camgirl’s moans reach the height of another climax.");
	output("\n\nThe little orange message box pops up asking if you’d like to become a Champeon and support Atha’s cock reviews. Would you like to learn more?");
	//[Champeon]   [Turn Off]
	processTime(19);
	pc.lust(40);
	letsFapTrack(5);
	champeonOrOffMenu();
}

//Let’s Fap - Rahn #6
public function letsFapRahnScene():void
{
	clearOutput();
	showAtha("RAHN");
	author("Adjatha");
	output("When the screen flicks on, Atha is at her usual seat, but she looks considerably less chipper than usual. The normally prim burgundy tie has been looped around her neck like a collar, the long silk hanging down her back like a leash. Her regularly styled and restyled curtain of hair is loose and messy, bunches hanging down and covering half of her face. Her half moon glasses are parked up on the top of her head, all but forgotten, while her vest and shirt are unbuttoned, exposing the caramel valley of her bountiful cleavage and taut belly. She has an expression of blissful exhaustion on her face and hardly seems to have realized that she started the show.");
	output("\n\nAfter a moment of swaying back and forth, the camgirl notices the broadcasting light on the desk in front of her. She blinks her eyes and looks around for her glasses before giving up on them and pulling her unkempt hair back behind her ears. <i>“Oh, hey everybody. Sorry for the mess,”</i> she weakly laughs with an embarrassed grimace. <i>“Nett kept me playing with my toys all week, so I’m feeling a bit drained. But don’t worry- the show must go on!”</i> She gestures into the air with a single, triumphant finger before realizing she’s put too much momentum into the motion and ends up toppling out of her chair, with an awkward <i>“Gah!”</i>");
	output("\n\nUsing the desk to help her back onto her feet, Atha offers a feeble smile, not realizing that the fall has opened her shirt, leaving both massive, F-cup tits hanging ponderously close to the camera. Her umber areolas are surprisingly puffy and apparently inverted, the tip of her firm nipples hidden behind plump, lip-like folds. With an almost drunken stagger, she jerks her thumb off screen. <i>“Just a sec. Gonna get a new dick.”</i>");
	output("\n\nWhen she returns, her skirt has been forgotten, the camgirl’s pudgy thighs framing the bare, smooth skin of her pelvis. At first, you think she must’ve set it to Ovir again, but the more you look at her, the clearer it seems that she doesn’t have ANY genitalia at all! You’re tempted to turn the show off, but stick with it to at least hear the fatigued girl’s explanation.");
	output("\n\nAtha pokes her abdomen curiously, cocking her head left and right. <i>“But how does it...?”</i> she mumbles before realizing she’s back on camera. <i>“Oh! Sorry. So yeah, new dick. It’s not invisible and you’re not crazy- it’s just a new feature in the Stud Series of Dong Designer: a Rahn dick.”</i> She pokes her groin again, and you do notice a very slight wobble on her brown skin. <i>“Now the option said ‘Highly Experimental,’ but I trust TamaniCorp,”</i> she asserts with a dismissive handwave, <i>“so things should be just fine,”</i>");
	output("\n\n<i>“To be honest, it doesn’t feel like anything, at the moment! Good if you’re having trouble controlling your erections, I guess. Still no balls on this model, but I think they do eggs or something, so I guess there’d be no need. Better get this gal up and at ‘em,”</i> she shrugs as she rights her chair and sits heavily in it. Reaching off screen, she produces a pale, cream colored wand about the size of her forearm with a JoyCo logo on it. The rounded tip seems to glisten, as if freshly lubricated. Flicking a switch on the shaft, the tip begins to vibrate silently, pale blue lights glowing along the side.");
	output("\n\nHolding the vibe more or less where a cock ought to be, Atha offers a contented sigh and leans back in her chair. The camgirl’s skin sends up a light humming as the toy touches her, a smile wedging itself onto her lips while her free hand circles the slightly spongy flesh of her groin before sliding up to cup one of her massive breasts. <i>“Well,”</i> she coos, <i>“the skin’s sensitive and pretty responsive, so that’s a good sign.”</i> She begins groping her chest, fingers sinking into the pliant skin with moaning delight. She locks her knees tightly together and leans forward slightly as she kicks the vibrator to a higher setting.");
	output("\n\nAmazingly, a small bump surfaces on the cam girl’s abdomen, bubbling larger and fuller as the toy skips quietly across her pelvis. She begins fingering the russet crest of her tit, squeezing the puffy peak until her nipple pops out of its seclusion. Her legs straighten, tensing as the vibe kicks up another notch, the bulge between her hips swelling into a full, phallic protrusion.");
	output("\n\nWhen at last it seems to stop growing, the floppy Rahn cock is roughly an inch and a half across and 5 inches long. The camgirl switches off the wand to get a better look at the still-vibrating gel. It is roughly the same copper hue as her skin, but slightly translucent and seems to lack any distinguishing characteristics beyond its drooping, sausage-like shape. Panting slightly, trickles of sweat running down the swell of her breasts, the camgirl looks up at the camera with considerably more focus than before.");
	output("\n\n<i>“Okay, that felt really fucking weird. You know how a regular erection is like you’re suddenly just more aware of the dick that’s always been between your legs? Well, a Rahn cock doesn’t have any feeling beforehand ‘cause it’s not there when it’s not in use. Like, at all. So getting hard is like growing a cock for the first time. Shit’s intense, is what I’m trying to say. Almost feels like it’d respond to my thoughts, if I had more practice. Like exercising a muscle you hardly ever use- it’s there, but you’ve got to really push to flex it. I dunno, I’m not making any sense.”</i> She shakes her head, dislodging the glasses perched on her brow, letting them fall back onto the girl’s nose. With a suddenly business-like intensity, she eyes the camera, emerald eyes blazing. <i>“Enough foreplay, let’s fap.”</i>");
	processTime(6);
	pc.lust(8);
	clearMenu();
	addButton(0,"Next",rahnFapPart2);
}

public function rahnFapPart2():void
{
	clearOutput();
	showAtha("RAHN_XL");
	author("Adjatha");
	output("Wrapping her hand around the fleshy pseudopod, she begins stroking up and down, gently at first until it’s clear that the phallus seems to be producing its own lubrication. The dull cinnamon skin tone turns to a polished copper in short order, her hand easily sliding along the flaccid gel with wet, slapping strokes. The seamless, rounded tip wobbles back and forth with each pump, glistening but growing no firmer.");
	output("\n\n<i>“This is... frustrating...”</i> she grumbles between strokes. <i>“I can’t seem to make it hard! Unless...?”</i> Closing her eyes and steadying her breathing, the camgirl slows her fapping motion, taking care to squeeze the squishy girth tighter and tighter each time. Slowly, the goo dick seems to firm up, gradually growing denser yet still yielding. With its new stiffness, it nearly resembles a regular cock, minus any sort of tip or opening.");
	output("\n\n<i>“That’s pretty cool,”</i> Atha marvels, grinning. <i>“Now if I could just- woah!”</i> Momentarily losing her grip on the jelly phallus, the camgirl’s abdomen ripples and convulses. Her gel cock flops upright as a semi-solid, egg shape pushes itself into the bulk from her groin, thickening the semi-transparent length with an opaque nucleus. <i>“The fuck? Is that how that works? Your load just builds up as these eggs? Sorry guys, I really should’ve done my homework before trying this one out.”</i>");
	output("\n\nExperimentally, she touches the shaft and winces, leaning forward reflexively. <i>“Ah! Oh, okay... so I guess it gets more sensitive when eggs are inside. That makes sense,”</i> she analyzes slowly. <i>“So, if I started jerking off again...?”</i> she gives herself a few slow pumps, a moan forcing itself past her clenched teeth. <i>“Oh shit yes. That’s the good stuff,”</i> she murmurs. Her free hand grabs the vibrating wands once more and places it right at the seamless peak of her gel cock while the other jerks with eager intensity. <i>“Come on, baby. Gimme dem eggs,”</i> she coos, with a crooked smile.");
	output("\n\nHips bucking in time to her pumps, a shudder overtakes the camgirl and another egg slides into her rahn cock, squishing up against the first and bloating her shaft slightly larger than before. The now six inch length ripples and quivers under the toy’s buzzing stimulation while the squishy girth slurps and slaps wetly within her desperate grasp. A third egg pops in, and then a fourth, her dick growing with each addition, her expression tightening to a shuddering ecstasy.");
	output("\n\nBy the tenth egg, Atha’s rahn cock has grown to over twenty inches long and nearly four inches wide, her hand no longer able to completely encircle the expanding bulk. The eggs inside are so bunched together that the jelly surface is nearly translucent, with a bumpy texture in place of its previously smooth shaft. Her chest heaving, sweat freely streaming from her brow and glistening in large drops on her bronze tits, the camgirl seems to be losing control of the situation. The more she pumps, trying to reach a climax, the more eggs get added to her load, multiplying the sensitivity of her shaft.");
	output("\n\nTossing the viberator to one side, she goes to worth with both hands on the towering length, pumping up and down as quickly as she can. <i>“I think I’m fucked,”</i> she gasps, weakly, her pace an unsustainable frenzy of motion. <i>“I don’t know the trick to makin’ these things come out,”</i> she moans. Her abdomen seems to be getting leaner with each addition, as if her body’s borrowing mass to make up for the swelling pillar in her lap. <i>“At this rate, I’ll be nothing but a cock with glasses,”</i> she whines.");
	output("\n\nTrying a new route, she flops the gelatinous mass across her chest and leans down to suck at the featureless tip. Despite the girth, the huge, rounded peak easily slides into and out of her mouth, its shape conforming to the taut oval of her lips. She gulps down inch after inch, nearly a foot of copper gel sliding into her throat as easily as slurping down a gooey dessert.");
	output("\n\nThe gel seems to react to the pressure of her mouth, its bloated contents shifting heavily within. There is a tremble that passes over her floppy phallus and the eggs move up slightly, Atha’s eyes going wide as an egg pops out of the cock and slides into her belly. She hacks and pulls her head off the length, but not before another two follow down her throat and into her stomach. As the crest slides free from her lips, the wobbly pillar seems to explode with action, egg after egg launching from the dilated tip of the jelly prick, a shower of pale white slime following after.");
	output("\n\nCum and eggs launching with wild abandon, the camgirl’s face becomes one of blissful rapture, both hands milking the pent up release for all its worth. The rubbery eggs arc up and land randomly around the room, some even bouncing off Atha’s head like rubbery fruit falling from a tree. The last egg pops free and the built up fluid is released in one, continual stream, a geyser of sticky cum shooting up with all the subtlety of an out of control fuel rig. Glistening showers of gooey spunk splatter down on the girl in a slushy shower. Far thicker than normal cum, her rahn spunk pools in slimy globules that gradually becomes nearly a full body coating like runny marshmallow icing.");
	output("\n\nThe gel cock eventually reaches the end of its orgasm, gradually shrinking and vanishing back into Atha’s pelvis. The camgirl appears as if she’s been transformed into a white, opaque galotian, her gooey chest heaving from the afterglow of her slimy climax. <i>“So, that’s probably why they said it’s experimental,”</i> she pants from under her oozing glaze. <i>“I dunno what I’m gonna do with all these eggs,”</i> she ponders idly. <i>“Leave a comment if you want me to send you an egg,”</i> she laughs. <i>“I’ve got a feeling I’ll be making ‘em all week, so there should be plenty to go around,”</i> she sighs, a playful tone coming through the obvious exhaustion.");
	output("\n\n<i>“Oh, yeah. The review. Rahn dicks are great. Awesome if you want to feel like you’re growing a brand new cock with every boner or if you just want something that will grow all by itself. Maybe wait till they get the kinks worked out, unless you’ve got a cleaning crew on staff,”</i> she mutters, her hands leisurely scooping up the cummy cream coating her and letting it drip between her fingers in thick blobs.");
	output("\n\n<i>“As always, don’t forget to Love, Comment, and Support! Next week’s the season finale, so I hope you’ll join me again. Bye ‘Net!”</i> And with that, the cum-coated camgirl’s feed goes dead.");
	output("\n\nThe little orange message box pops up asking if you’d like to become a Champeon and support Atha’s cock reviews. Would you like to learn more?");
	//[Champeon]   [Turn Off]
	processTime(26);
	pc.lust(42);
	letsFapTrack(6);
	champeonOrOffMenu();
}

//Let’s Fap - Cock Tail #7
public function letsFapCockTail():void
{
	clearOutput();
	showAtha();
	author("Adjatha");
	output("When the show begins, Atha is looking rather nervous. Her standard shirt and vest and clean and pressed, her tie tightly cinched against her long neck. The cam girl’s long, black hair hangs in loose waves behind her, swishing every time she turns her head to glance around. When she turns to focus entirely on the camera, her eyes are narrowed conspiratorially behind her half moon glasses.");
	output("\n\n<i>“Hey ‘Net,”</i> she whispers. <i>“Today’s the season finale and I’ve got something really special for you. Some fans sent in stuff that may or may not be kinda super illegal.”</i> She begins chewing on her lower lip nervously. <i>“So I’ve kinda been debating what to do about ‘em. I should probably take them to somebody to be disposed of, but I feel like I’d be depriving you fine folks of a very important learning experience!”</i>");
	output("\n\nSeemingly talking herself into a more confident position, she goes on. <i>“After all, the whole point of this show is to give you a review of different types of dicks, right? And I’m a professional, so it’s my duty to check out even fringe biology. If it’s dangerous - or worse, boring - I can let you guys know to stay away from it. It’s practically a public service!”</i> The camgirl’s chest has swollen with pride for her selfless sense of duty, her tightly bound F-cups nearly bursting out of the straining dress shirt.");
	output("\n\n<i>“In the interest of anonymity, we’re gonna keep the identities of the folks who sent me this stuff secret. But you know who you are, so thanks!”</i> Reaching off screen, Atha retrieves two sealed packages, placing them carefully on the desk in front of her. <i>“Oh, I also just wanted to say that TamaniCorp and JoyCo had nothing to do with this episode, so don’t get the wrong idea.”</i> She laughs nervously, fingers drumming across the largest of the two packages.");
	output("\n\n<i>“Okay,”</i> she mutters to herself, <i>“no more stalling.”</i> Carefully, she unwraps the largest container, revealing a long, circular tube with biohazard symbols neatly printed along its nearly two foot length. Both ends appears to be capped with a complex sealing device, normally used to keep specimens in stasis. With a flick to the restraining straps, Atha loosens one end, a small hiss of steam escaping the tube. Carefully, gingerly, she reaches into the packages and withdraws a long, limp cylindrical mass. Roughly two feet long and three inches across, the limp noodle resembles a snake, one end a folded mass of wrinkled flesh, the other a hand-like network of thin, root fibers.");
	output("\n\n<i>“This,”</i> Atha introduces quietly, <i>“is a cockvine seedling. They’re native to Myrellion, which is one of those new planets that opened up with the Planet Rush this year. Apparently there’s some kind of conflict over there and there’s a huge import/export ban on a ton of stuff, including this little guy.”</i> She lifts the flesh head a bit, to show it off to the camera. You’re struck by how much it resembles an equine sheath, until you realize that’s probably exactly what it is.");
	output("\n\n<i>“These cockvines are technically parasites, because their bonding can be non-consensual and they retain some small influence over their host once attached. Of course, it’s always dangerous to play with potentially invasive species, but like I said - I’m an expert. Don’t try this at home.”</i> She gives the little guy a slight shake, examining its roots doubtfully. <i>“This seedling is still alive, just drugged from the journey to make it more docile.”</i> She takes a hard gulp. <i>“Well, better get to it...”</i>");
	processTime(7);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",cockVinePart2);
}

public function cockVinePart2():void
{
	clearOutput();
	showAtha("COCKTAIL");
	author("Adjatha");
	output("Standing, she pulls away her thick skirt to reveal a plain, feminine pelvis, the slight swell of her pussy the only monument between her legs. <i>“I removed my cock to make sure I could give you a full report on this little guy without getting any mixed signals,”</i> she explains, actually looking uncomfortable without a massive phallus to hang in front of the camera. <i>“So, this end,”</i> she lifts the roots, <i>“attaches to a host’s nervous system to begin the bonding. They can hook on in a number of places, but the easiest is right at the base of the spine.”</i>");
	output("\n\nAtha turns around, showing off the plump, bronze bubble butt she’s been sitting on all this time. Leaning down, to raise her rotund cheeks. Reaching backward, she pulls the rooted end of the cockvine into contact with the peak of her rotund crack. The vine slowly begins to regain its awareness, the thick, pipe-like body undulating slowly to acquaint itself with its new surroundings. The roots wiggle against the camgirl’s skin experimentally, searching for fertile soil. Then, with a sudden, viper quickness, the nubs plunge into her skin like the fangs of an actual snake.");
	output("\n\nAtha shrieks at the bite, quickly slapping a hand over her mouth. The sight of the parasite’s bonding is actually quite shocking. The vine’s finger-like roots wiggle into her, sending out smaller shoots that are just barely visible under the girl’s dusky skin. Like a hand clenching, the gap between the penetrating fingers and the vine’s shaft close in mere moments. There’s no blood from the intrusion, just a thin, clear fluid that the vine seems to be excreting at the contact points - probably a numbing coagulant.");
	output("\n\n<i>“Sorry for that,”</i> she apologizes in a hushed tone. <i>“There was a sharp pinch, but everything’s gone a little numb now. If I weren’t watching her in action, I’d think the little girl went back to sleep!”</i> The camgirl winces, straightening slightly. <i>“Ah, starting to get a little feeling back,”</i> she murmurs, cheeks blushing. <i>“O-oh!”</i> The cockvine gives another vigorous wiggle and the seam between her posterior and the parasite seems to vanish before your eyes. <i>“Oh fuck me, that feels as weird as growing a third arm. I can feel the snake moving around but even stranger, I can feel my own hands holding the tip,”</i> she explains with a look of unsettled worry.");
	output("\n\n<i>“I’ve got to admit, this isn’t what I thought it’d be like,”</i> she admits, hands unconsciously stroking the cockvine. <i>“When I heard about these, I assumed they’d be like a tentacle that just grabs on and goes to town, you know, like in the porn holos. But I’m beginning to feel everything from this thing, even its muscles...”</i> she trails off and the vine attached to her rump wags back and forth, like a happy dog’s tail. <i>“I gotta say, it doesn’t feel like a parasite! I’m not sure I understand all the government worry about these things.”</i>");
	processTime(6);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",cockVinePart3);
}

//[Next]
public function cockVinePart3():void
{
	clearOutput();
	showAtha("COCKTAIL");
	author("Adjatha");
	output("The vine rustles, crinkling as its green coloration bleeds to a brown that mimics Atha’s skintone. With the seam gone and the color a perfect match, it’s nearly impossible to tell that the camgirl didn’t simply grow a massive, 3’ tail. It droops limply in her hands but with a small effort of will, she flexes its length back and forth, up and down. She curls the long member around her thighs and hips, squeezing tight her already dripping pussy as she lifts the wrinkled sheath of its tip to the level of the camera.");
	output("\n\n<i>“Let’s see what we got in the bonding, eh ‘Net?”</i> she asks with confident glee, apparently forgetting her earlier caution. She slides the thick member up, under her shirt, pumping the bonded member between her F-cups so suddenly that buttons start popping off of her dress shirt. <i>“Woah, this thing is sensitive! Like, even more than a normal dick! Maybe it’s ‘cause the thing’s so new, but even the slightest friction is...”</i> she begins panting, a weak smile on her face, <i>“well, it’s like plunging into Nett’s tight dragon pussy for the first time.”</i>");
	output("\n\nShe winks and drives her tail onward. The fat limb fucks her compressed breasts with wild abandon, the pumping strokes radiating down the length and into Atha’s spine, sending shivers through the girl. If she weren’t binding her own legs together, you get the feeling her knees would’ve given out by now. She grabs her tie and clenches it in her mouth as she stares down at the sheathed tail sending quakes through her ample titflesh.");
	output("\n\nShirt torn open by the fucking, her vest just barely holding on, the camgirl lifts her length so that its sheath is just barely visible in the sweating valley of her cleavage. The cocktail twitches and throbs as it begins stiffening and swelling. The sheath rolls away at a massive phallus inflates from within, the broad flatness of her tip hitting the girl’s chin, then nose, before finally obscuring the entirety of her face. All told, the equine tip of her cocktail grows to a towering 12\", its fleshy girth a graphite hue of blackish gray that seems bulbous distended into three palpitating cylinders. A single drop of alabaster cream rolls down from the massive urethral slit, polishing the pole on its way.");
	output("\n\nAtha lets the tie drop from her mouth as she contemplates the flood of new experiences flooding her. <i>“No joke, I think I creamed myself just from getting hard,”</i> she admits with a woozy smile. The horsecock-tipped tail slowly pulls out from between her breasts and uncoils from around her legs. She sits heavily in her chair and her tail whips around to wind itself neatly into a spiral on her lap, the distended, phallic tip swaying upright at its center like a charmed serpent. <i>“Damn, it is easy to control this thing, too! Like, I thought I’d have to fight its primal instincts but nope! Just as easy as reaching for your favorite vibrator!”</i>");
	output("\n\nShe absently begins stroking the girthy member while she continues. <i>“So, biologically, it looks like the muscle walls surround the whole thing, giving it greater flexibility than most cocks,”</i> she illustrates the point by having the shaft bend and wiggle without moving the rest of her tail. <i>“It seems like it’s got the three shaft layout, but these other two shafts feel like they’re full of something other than cum. I can’t quite put my finger on it, but stroking the sides is just as intense as stroking the bottom.”</i> Her pumping becomes faster, her glasses sliding down her nose as their half moon glass begins fogging up.");
	output("\n\nLooking up at the camera with a gaze blurred by her building orgasm, Atha flashes a big, wicked smile. <i>“But you guys know me - I can’t be happy unless I’ve got the biggest cock on the block. So let’s take a look at our second surprise, shall we?”</i> She regretfully takes her hands off of the throbbing tailcock and brazenly opens the second, far smaller box on her desk. The camgirl lifts the contents to the camera, tossing the box aside recklessly. In her small bronze hand, Atha appears to be holding a small, needleless medipen, loaded with a cylinder full of glowing blue liquid.");
	pc.lust(10);
	processTime(5);
	clearMenu();
	addButton(0,"Next",cockVinePart4);
}

public function cockVinePart4():void
{
	clearOutput();
	showAtha("COCKTAIL");
	author("Adjatha");
	output("<i>“This, ‘Net, is Throbb. I’m sure you’ve all heard about it before. Supposedly very addictive and very dangerous. At the very least, very illegal. While I can’t really see the big problem with cockvine seedlings, I can tell you that Throbb is NOT something that you want to toy with,”</i> despite the severity of her tone, the camgirl’s obvious glee is impossible to hide. Her chest heaving, sweat beading on her brow, she slowly raises the medipen to the tip of her cocktail. <i>“Do as I say, don’t do as I do, kids,”</i> she murmurs before touching the jet-pressured device directly to her thumb-sized cumslit and hits the release button. The syringe lets out a faint <i>“hssst”</i> as the drug is sprayed through her skin, directly into the bloodstream of her new tail.");
	output("\n\nOnce all the blue liquid is gone, Atha sets the pen down on the table with shaky hands. <i>“That wasn’t too bad. Like a little splash of coldness no worse than running an ice cube down your cock. Feels weird at first, but one could definitely get used to it...”</i> she shakes her head. <i>“Ha ha no no. No second hit. Once is enough. Except...”</i> she stares intently at the equine mass trembling on her lap. <i>“Shouldn’t it be growing? That might’ve been a bad batch. Maybe I need to get another...?”</i>");
	output("\n\nWhile Atha’s attention is entirely focused on the point of contact, you notice a slight change to the coiled tail resting on her thighs. The thick flesh seems to be flexing, small spasms running up its length. The tail seems to be growing both longer and thicker, its loops spilling over the sides of her lap as the growth works its way upwards. <i>“Oh!”</i> the camgirl loses her focus on the cock and looks down at her lap, noticing the tail growth but seems to be squirming at something beneath it. She dumps the swelling coils over the arm of her chair to reveal the change within her lap.");
	output("\n\nWhere before there was just the mounds of her pussy, now a pair of smooth balls seems to be growing right below where a cock ought to be. <i>“T-that’s w-weird,”</i> she tries to get out as her face flushes at the changes coursing through her system with increasing rapidity. <i>“I do love b-balls, but m-m-my cock’s on the wrong end,”</i> she laughs, fingers hefting the three inch orbs in delight as much as in confusion. The narrow tail behind her has thickened immensely by now, its loose length visibly swelling from three inches thick to 6\" at its base. The tail curls upwards, lifted unconsciously by the girl’s rampant, drugged lust. You can see that the three inch vine has grown to five feet long and gradually narrows to 4\" thick by the sheath.");
	output("\n\nThe infectious growth seems to have finally reach the tip, her twelve inch equine cock bloats outward, gaining four inches with a frightening rapidity before slowing but still growing. <i>“Oooooh shit,”</i> the camgirl moans. <i>“These things are playing h-havoc on me. Maybe both wasn’t a good idea,”</i> she whines, one hand gripping her expanding horsetip while the other futilely tries to keep her partnerless balls from swelling ever larger. <i>“W-well, if this is the series finale, I’d better t-t-try to do my job,”</i> she laughs, the pitch of her voice growing manic.");
	pc.lust(10);
	processTime(6);
	clearMenu();
	addButton(0,"Next",cockVinePart5);
}

//[Next]
public function cockVinePart5():void
{
	clearOutput();
	showAtha("COCKTAIL");
	author("Adjatha");
	output("<i>“Okay, the tail. Imagine if, like, your leg - no, arm! Yeah, like you’ve got this arm, ah!”</i> she jiggles as her cock gains another inch. <i>“New arm, right? But like everything on it is like your fingertips, yeah? Now you keep making a fist and the arm gets l-l-larger!”</i> Her balls have swollen too large to be covered by her hand any more, each orb nearly six inches across. <i>“S-s-so the arm gets larger each time you flex, but you’ve got an inch all over it so you keep flexing and as you do so it fills up with more and more blood, but it’s not blood it’s cum and ohdamniticantthinkthisfuckingthingistoo-too... BIG!”</i>");
	output("\n\nHer tail whips about, apparently no longer under her control. The mass of equine flesh at the tip has grown to nearly 20\", its inflated bulk nearly as large as the camgirl’s face at the flared head. The urethral slit is an inch and a half across and gapes like a tiny, needy mouth, trickles of pearlescent goo leaking from it steadily. Atha experimentally sticks one of her fingers into the lubed hole and her body bucks as if stricken. <i>“Fuuuuuuuuck,”</i> she moans as her tail bulges and surges. Her massive balls tremble and roll in her lap, apparently connected to the tail’s sinuous orgasm, bronze skin pulsing with each throbbing shudder.");
	output("\n\nThe camgirl seems to be losing her mind as her climax travels up all five feet of her snake-like cocktail. She pants, she moans, she drools and yowls like a beast in heat as her fingers pump away at the pliant, stretchable slit at the peak of her horsetip. When her climax reaches the flared crest, the cum spray is unlike anything you’ve seen before. With the construction of her fingers, the geyser is split into all directions, thick goo shooting everywhere in heavy, jet propelled pumps. Atha’s shrieks of pleasure nearly take out her audio equipment as load after load of hot spunk surges up her tail, all three barrels of her cockvine member bloated by the rush of her orgasmic release.");

	output("\n\nInstinctively, she leans forward to try to take the orgasming member in her mouth, but its flared tip is far too large to fit past the small girl’s lips. She messily swallows as best she can, the intensity of her orgasm blasting the glasses off of her face and coating her skin and hair in dripping waves of slime. Her tail loops upward, lashing the girl’s shoulders to the back of her hair, holding her in place as the tip loops around, forcing itself between her knees. Sputtering and choking on her own spoo, she hardly even notices when the cockvine attempts to force itself into her pussy, the obscuring orbs of her balls hiding the futile assault from the camera. The cock it simply too large to get into the girl’s pussy, so it simply presses itself tightly against the entry and pumps gallons past her labia. The force of her jetting release is enough to inflate the girl’s pelvis with a fluid paunch as more seed fills her than can leak back out.");

	output("\n\n<i>“W-what the actual fuck?”</i> she moans, struggling to free herself from the tail’s binding loops. <i>“The other two veins,”</i> she cries out, <i>“They’re releasing something new? T-t-that’s not cum!”</i> She bites her lip and wiggles her arms down to seize the tail and pull it up and away from her pussy. In addition to the pale cream gushing from it, tiny green orbs about the size of grapes seem to be shooting out of the shaft. <i>“Fuck me, this thing’s still got seeds? Did I just knock myself up?”</i> she moans with a lunatic giggle. <i>“I’ve gotta c-c-call somebody! D-do something! I can’t just sit here and keep... and keep... keep cumming!”</i>");

	output("\n\nHer wild, whipping tail sprays jizz all around the room and over the camgirl, her belly visibly growing before your eyes as the inseminated seeds, perhaps overcharged by the Throbb, start filling her with a host of fresh cockvine seedlings. Eyes rolling in the back of her head, unable to keep pace with her seemingly endless orgasm, Atha slackens. A knock at an offscreen door comes just as the wild spurting spray seems to hit a critical broadcasting component, knocking out the feed. The screen goes black, the audio cuts out, and the show - it seems - is over.");
	processTime(25);
	pc.lust(50);
	letsFapTrack(7);
	champeonOrOffMenu();
}

//Let’s Fap - Live CumStreamer Episode
// for Geyser-tier Champeons only. Becomes available in the Smut menu as “CumStreamer” after the player pledges, but cannot be accessed after the Cock Tail event is viewed.
// The Chat Names are more or less random, with a few oblique references. We can change them to whatever, if you’ve got better ideas
// Is it possible to save the player’s choices and the random questions asked by the audience to this episode can be “saved” for the player’s later play back, or would it make more sense to have it viewable only the once?

public function liveCumstreamerEpisode():void
{
	clearOutput();
	showAtha();
	author("Adjatha");
	output("Following the flashing notification on your console to a private CumStreamer chat room, you take your place among Atha’s other top tier backers. The video feed hasn’t begun yet, so the other viewers are making small talk while they wait:");
	output("\n\n\t<b>TinyBee73:</b> what kind of requests do you think she’ll take?");
	output("\n\t<b>ZeroMinus:</b> I’m just hoping for something with a lotta cummies! XD");
	output("\n\t<b>RavenWulf:</b> She should play some CoV while jacking off- that’d be hilarious!");
	output("\n\nIt seems to join the conversation, you’ll need to put in a user name. Probably best to stay away from your real name, just in case. What would you like to call yourself?");
	// Enter CumStreamer name
	displayInput();
	userInterface.textInput.text = "";
	userInterface.textInput.maxChars = 12;
	output("\n\n\n");
	clearMenu();
	addButton(0,"Next",cumStreamNameSelect);
}

public function cumStreamNameSelect():void
{
	if(userInterface.textInput.text == "") {
		liveCumstreamerEpisode();
		output("<b>You must input a name.</b>");
		return;
	}
	// Illegal characters check. Just in case...
	if(hasIllegalInput(userInterface.textInput.text)) {
		liveCumstreamerEpisode();
		output("<b>To prevent complications, please avoid using code in the name.</b>");
		return;
	}
	if(userInterface.textInput.length > 14) {
		liveCumstreamerEpisode();
		output("<b>Please select a name no more than fourteen characters long.</b>");
		return;
	}
	var cName:String = userInterface.textInput.text;
	liveCumstreamerEpisode2(cName);
}

public function liveCumstreamerEpisode2(cName:String):void
{
	if(stage.contains(userInterface.textInput)) removeInput();
	clearOutput();
	showAtha();
	author("Adjatha");
	output("As you finish registering the name, the video feed kicks on, your host appearing more or less as you recognize her from her show. Atha’s wearing her white dress shirt, burgundy vest and tie, and half-moon glasses tightly pressed against her face. Her long hair hangs in twin streams over her shoulders, cascading past the swell of her massive chest and pooling atop her pale skirt. The onyx gem set in her forehead seems larger and more noticeable than usual, but it seems she’s using a different camera for the stream and it has something of a fish-eye effect, distorting proportions based on closeness.");
	output("\n\n<i>“Hi ‘Net!”</i> she announces with a sing-song lilt. <i>“Well, not the whole ‘Net, just you cool guys,”</i> she grins, cupping one hand over her cheek. <i>“I’m super grateful for everything you guys do for me, so I wanted to try out this private event as a way of saying thanks! If it goes well, we might try to do more down the line. Sound good?”</i>");
	output("\n\n\t<b>PumpKing:</b> Yus!!!");
	output("\n\t<b>ZeroMinus:</b> Woooooo");
	output("\n\t<b>Waifu4u:</b> SHOW US THE DICK");

	output("\n\nHer eyes scanning over the responses, she chuckles and her grin broadens. <i>“All in good time! Let’s do the question and answer bit first, while I’m still dry. So! Anybody got any questions for me?”</i>");

	//Player Questions
	output("\n\nWhat would you like to ask?");
	// [Your Gender]   [Your Fetishes]   [Do You Travel?]   [No Questions]
	// For more questions the player can ask, check with Fen & Savin if they have any questions
	processTime(4);
	clearMenu();
	addButton(0,"Your Gender",askCumStreamerHerGender,cName);
	addButton(1,"Your Fetishes",askCumStreamerHerFetishes,cName);
	addButton(2,"Travel?",askCumStreamerIfSheTravels,cName);
	addButton(3,"No Questions",noQuestionsForCumStram,cName);
}

//[Your Gender]
public function askCumStreamerHerGender(cName:String):void
{
	clearOutput();
	showAtha();
	author("Adjatha");
	output("\t<b>" + cName + ":</b> You go through so many changes, what would you actually consider yourself to be? Do you have a preferred pronoun?");
	output("\n\n<i>“Oh, interesting! I suppose I never really gave that much thought. Even with all these dicks, I still think of myself as a girl!”</i> She leans back, tapping the side of her glasses in thought. <i>“Even though I’ve got a dick most of the time, I never really think of them as MY dick, you know? More like, I’m borrowing them from somebody to give ‘em a try,”</i> she giggles. <i>“Sounds weird, right?”</i>");
	output("\n\n\t<b>TinyBee73:</b> i definitely thought of your zil cock as borrowing mine :D");
	output("\n\t<b>YourPalBadger:</b> Borrowing other people’s cocks? Sounds like a lovely fetish...");
	output("\n\t<b>Yyyyu2:</b> I’d send you mine, but only if you promise to swallow every drop");
	output("\n\t<b>ZeroMinus:</b> Stealing cocks?! O_o");

	output("\n\n<i>“Ha hah, I don’t know if they’ve actually got the technology to do that, but you guys better hope not, or I’d quit this job and become the most feared Penis Pirate the galaxy has ever seen!”</i> She closes one eye and tucks her right hand into her sleeve, leaving only a single, crooked finger to represent a hook. <i>“Yarr!”</i>");
	//God help us if she ever meets Kiro, then!
	processTime(2);
	clearMenu();
	addButton(0,"Next",randomChatQuestionsForCumStram,[]);
}

//[Your Fetishes]
public function askCumStreamerHerFetishes(cName:String):void
{
	clearOutput();
	showAtha();
	author("Adjatha");
	output("\t<b>" + cName + ":</b> Other than big dicks, what kind of stuff gets you going?");
	output("\n\n<i>“Ha hah, " + cName + ", you took my answer away in your questions! I was gonna say big ole dicks. I know, I’m such a size queen,”</i> she blushes with a wide grin. <i>“But it’s true! It’s fun to play with smaller cocks, but at the end of the day, nothing lights my fire like a third leg.”</i>");
	output("\n\n\t<b>RavenWulf:</b> Ha hah, you’re terrible, Atha!");
	output("\n\t<b>TinyBee73:</b> T_T");
	output("\n\t<b>PumpKing:</b> Hell yeah! Big dicks 4 life!");
	output("\n\t<b>Yyyyu2:</b> How big? Is 10\" enough?");
	output("\n\t<b>ZeroMinus:</b> How big is too big?");
	output("\n\t<b>Waifu4u:</b> B-b-b-bitch Breaker!");

	output("\n\n<i>“I mean, sure you want to be able to move, but frankly: the bigger the better!”</i> She scans the responses. <i>“Oh, TinyBee73, don’t feel bad! I think you’re adorable,”</i> she coos. <i>“I don’t mean to size shame anybody - all cocks are awesome!”</i>");

	processTime(2);
	clearMenu();
	addButton(0,"Next",randomChatQuestionsForCumStram,[]);
}

//[Do You Travel?]
public function askCumStreamerIfSheTravels(cName:String):void
{
	clearOutput();
	showAtha();
	author("Adjatha");
	output("\t<b>" + cName + ":</b> There’s a ton of exciting new species being discovered every day in the Planet Rush. Have you considered coming out to the fringe for an on-site show?");
	output("\n\n<i>“Do it live? Ha hah I don’t know if I could handle that! It’s one thing to record everything, but having everybody staring at me in person, not just through a camera?”</i> She blushes furiously, wiggling in place. <i>“Ooooo that’d be so naughty!”</i>");
	output("\n\n\t<b>Singularity:</b> You must!");
	output("\n\t<b>YourPalBadger:</b> Do it!");
	output("\n\t<b>ZeroMinus:</b> You should!");
	output("\n\t<b>TinyBee73:</b> It’s not so bad out here!");
	output("\n\t<b>MsCupcake:</b> I think you’d do great, dear.");

	output("\n\n<i>“Alrighty, alright, settle down guys!”</i> she laughs. <i>“I’ll look into it, but it’s definitely not happening any time soon. I’m just a simple terran girl with but a camera and a fuckload of sextoys to my name. A starship is a bit much for the time being!”</i>");
	output("\n\n\t<b>RavenWulf:</b> Could do a donation drive.");
	output("\n\t<b>TinyBee73:</b> Or a show for the UGC troops. They’d probably fly you out.");
	output("\n\t<b>YourPalBadger:</b> Nah, stay away from the military. They’re idiots.");
	output("\n\t<b>ZeroMinus:</b> Hey! Watch it!");
	output("\n\n<i>“Now now, everybody be nice! Don’t get politics in the porn!”</i>");

	processTime(2);
	clearMenu();
	addButton(0,"Next",randomChatQuestionsForCumStram,[]);
}

//[No Questions]
public function noQuestionsForCumStram(cName:String):void
{
	clearOutput();
	showAtha();
	author("Adjatha");
	output("You decide to let the rest of the chat room pester the camgirl. You’re just here for the show.");
	clearMenu();
	addButton(0,"Next",randomChatQuestionsForCumStram,[]);
}

//Random questions from Chat
public function randomChatQuestionsForCumStram(args:Array):void
{
	clearOutput();
	showAtha();
	author("Adjatha");
	//Load up the list of choices if first call.
	if(args.length == 0)
	{
		if(silly) args.push("SILLY");
		args.push("COCK","CLEAN UP","SPONSORSHIP");
	}
	//Pick the question and strip it from queue or queue up next segment.
	var x:int = rand(args.length);
	var select:String = args[x];
	args.splice(x,1);
	if(args.length == 1 || (args.length == 2 && silly)) select = "DONE";
	//[Silly Mode]
	if(select == "SILLY")
	{
		output("\t<b>MightyWicked:</b> How do you fap with boxing gloves on?");
		output("\n\n<i>“Well, it’s certainly not easy,”</i> Atha replies, hoisting up the large red boxing gloves she’s never seen without. <i>“I mean, the grip is okay, but you wouldn’t believe how challenging it is to hit buttons on the capture equipment! And one time I accidentally hit all the buttons on the Dong Designer at once. Boy, was THAT a confusing few hours!”</i>");
		output("\n\n\t<b>RavenWulf:</b> Sounds fun!");
		output("\n\t<b>Yyyyu2:</b> Push it to the limit!");
		output("\n\t<b>ZeroMinus:</b> ARE YOU ASKING FOR A CHALLENGE?!?");
		output("\n\nAtha boops the side of her nose with the heavy mitt. <i>“Please. You’re a thousand years too early to challenge me,”</i> she teases, sticking out her tongue.");
		processTime(3);
	}
	//[Cock]
	else if(select == "COCK")
	{
		output("\t<b>Singularity:</b> What’s your favorite cock?");
		output("\n\n<i>“Ah, that’s the tough one, Singularity. I don’t know if I can answer that one! Part of being a reviewer is impartiality, right? I don’t want to develop a bias,”</i> she scolds, shaking her finger at the camera.");
		output("\n\n\t<b>TinyBee73:</b> Just as long as it’s got foreskin~");
		output("\n\t<b>RavenWulf:</b> Everybody knows ausar dicks are the best.");
		output("\n\t<b>ZeroMinus:</b> You misspelt ‘kaithrit.’");
		output("\n\t<b>RavenWulf:</b> Please, that’s knot even cute.");
		output("\n\t<b>MsCupcake:</b> I prefer kui-tan, but I understand if not everybody is fond of them.");

		output("\n\n<i>“Maybe after I’ve had a chance to sample every cock the galaxy has to offer, I can get back to you on that. But for now, I’ll just say I haven’t made up my mind yet!”</i>");
		processTime(3);
	}
	//[Clean Up]
	else if(select == "CLEAN UP")
	{
		output("\t<b>ZeroMinus:</b> How do you clean up between episodes?");
		output("\n\n<i>“Ha hah that’s a very good point. I do make quite a mess, don’t I? Well, when it comes to me personally, I take a shower and run my clothes through a cleaning service. They see me so often, you’d think I was their long lost daughter or something! I’ve tried to waterproof all my equipment, so it’s not too bad cleaning up the studio - one of my neighbors is a sweet Galotian girl and she swings by to leave everything nice and tidy.”</i>");
		output("\n\n\t<b>ZeroMinus:</b> Aw, I want some of the cummies too!");
		output("\n\t<b>RavenWulf:</b> Pays to make friends with some goos, huh?");
		output("\n\t<b>MsCupcake:</b> Goodness, have you considered asking your neighbor over one week?");
		output("\n\t<b>PumpKing:</b> Using a Galotian is cheating! You should lick everything up yourself >:3");
		output("\n\n<i>“Oh, Ms. Cupcake, I wouldn’t try to persuade her to join me unless she asked. Galotians so rarely say no that I’d feel bad for pressuring her. Plus, not everybody wants their face on the ‘Net, you know?”</i>");
		processTime(3);
	}
	//[Sponsorship]
	else if(select == "SPONSORSHIP")
	{
		output("\t<b>Yyyyu2:</b> So do you actually have a sponsorship with TamaniCorp or JoyCo? You’ve got a lot of their stuff on your show - it seems like you’re the best advertising they’ve got!");
		output("\n\nAtha laughs, rolling her eyes. <i>“Ah, no I’m afraid no sponsorship deal just yet. The folks who send me all the fun toys are just awesome viewers like you guys - I have to buy everything else myself! Were it not for my crippling addiction to new, fun sex toys, I’d probably be a very rich woman by now, ha ha!”</i>");
		output("\n\n\t<b>RavenWulf:</b> I know that feeling, lol!");
		output("\n\t<b>Singularity:</b> Aw, poor Atha. D:");
		output("\n\t<b>YourPalBadger:</b> Corporate sponsorship is overrated. Better to get the experimental stuff secretly!");
		output("\n\n<i>“Oh, it’s not like that, Badger! I don’t have secret agents infiltrating corporations or anything! Just some cool folks who gave me new stuff early.”</i> She thinks about this for a moment. <i>“Okay, I guess I kind of do have secret agents. Huh. Never really thought about it that way. But no fear - I’m not up to any industrial espionage! As long as I don’t have Federation agents knocking on my door, I’ll assume everything is just fine,”</i> she closes with a nervous grin.");
		processTime(3);
	}
	else 
	{
		athaLiveShowGo();
		return;
	}
	clearMenu();
	addButton(0,"Next",randomChatQuestionsForCumStram,args);
}

//Live Show
public function athaLiveShowGo():void
{
	output("Atha scoots back a bit and leans against one of the arms of her chair with an eager giggle. <i>“So! Let’s get down to brass tacks, ladies and gentlemen!”</i>");
	output("\n\n\t<b>Singularity:</b> Woooo!");
	output("\n\t<b>Waiful4u:</b> Let the spermathon begin!");
	output("\n\t<b>PumpKing:</b> Chix w/ dix!");
	output("\n\t<b>MsCupcake:</b> How exciting!");

	output("\n\n<i>“Well, since you guys are the stars of the hour, how about we do this democratically? What kind of balls should I go with for today’s show?”</i>");

	output("\n\n\t<b>RavenWulf:</b> Ausar!");
	output("\n\t<b>Yyyyu2:</b> Terran!");
	output("\n\t<b>ZeroMinus:</b> Kaithrit!");
	output("\n\t<b>YourPalBadger:</b> Kui-Tan");
	output("\n\t<b>Waifu4u:</b> All of them!");
	output("\n\t<b>MsCupcake:</b> Kui-Tan, dear.");
	output("\n\t<b>TinyBee73:</b> Zil!");
	output("\n\t<b>PumpKing:</b> Anything as long as they’re huge!");
	output("\n\t<b>Singularity:</b> Nuki nuts!");

	output("\n\nThe camgirl rubs her hands together, obviously delighted. <i>“Kui-Tan it is! That takes care of the cum factories, but what’ll I be fapping with? Gimme a dick!”</i>");

	output("\n\n\t<b>Yyyyu2:</b> Kaithrit?");
	output("\n\t<b>ZeroMinus:</b> Kitty Kaithrit!");
	output("\n\t<b>TinyBee73:</b> Zil forever!");
	output("\n\t<b>PumpKing:</b> Terran superior.");
	output("\n\t<b>RavenWulf:</b> Ausar always!");
	output("\n\t<b>Singularity:</b> I’m going to go with Zil this time.");
	output("\n\t<b>Waifu4u:</b> Dick-Nipples!");
	output("\n\t<b>YourPalBadger:</b> Let’s go with Ausar.");
	output("\n\t<b>MsCupcake:</b> Kui-Tan again, of course!");

	output("\n\nIt seems like the chat is pretty divided. What will you vote for?");
	processTime(5);
	pc.lust(5);
	clearMenu();
	//[Kaithrit]  [Zil]  [Ausar]
	clearMenu();
	addButton(0,"Kaithrit",pickAKaithritCock);
	addButton(1,"Zil",cumStreamingZilCock);
	addButton(2,"Ausar",ausarCumStreaming);
}

//[Kaithrit]
public function pickAKaithritCock():void
{
	clearOutput();
	showAtha("KAITHRIT");
	author("Adjatha");
	output("<i>“Kitty cat cock, huh? He-heh these are always fun. Back in a sec!”</i>");

	output("\n\n\t<b>TinyBee73:</b> Aw :(");
	output("\n\t<b>Yyyyu2:</b> Yisss");
	output("\n\t<b>ZeroMinus:</b> Cheer up, bee-boy");
	output("\n\t<b>Singularity:</b> Actually, I missed the kaithrit show, so this’ll be interesting");
	output("\n\t<b>TinyBee73:</b> I know ZeroMinus, I just gotta get my foreskin fix!");
	output("\n\t<b>Waifu4u:</b> Tiny sweaters for yo’ dick");
	output("\n\t<b>YourPalBadger:</b> Or tiny collars...");
	output("\n\t<b>TinyBee73:</b> O_o");
	output("\n\t<b>TinyBee73:</b> You scare me, Badger.");
	output("\n\t<b>YourPalBadger:</b> Good >:D");

	output("\n\nWhen Atha returns, she’s got a pair of sloshing bowling balls dangling just below a 10\" kaithrit shaft. The sleek, pink, feline member curves upward, bobbing with every step. The head and root are covered in tiny nodules that seem to flex and quiver as her shaft throbs with the stiffening excitement of exhibition.");
	output("\n\n<i>“You know, I think kaithrit are very underrated,”</i> she remarks as she takes her seat in front of the camera once more. <i>“Everyone hears ‘barbs’ and freaks out, but these little flourishes are really more like tiny cockheads than spikes,”</i> she purrs as she strokes the bristling bumps across her shaft. Tracing a finger up and down the thick cumvein, she gently massages one of her massive, mis-matched testes with the other hand. <i>“Well, since I’ve already reviewed this cock type, how about we try out some new toys?”</i>");
	output("\n\n\t<b>RavenWulf:</b> Toys! :)");
	output("\n\t<b>MsCupcake:</b> Oh, what a wonderful idea!");
	output("\n\t<b>Yyyyu2:</b> Toys and cat-cocks rarely mix, but let’s give it a try.");
	output("\n\t<b>Waifu4u:</b> Cupcake, show us your tits");
	output("\n\t<b>PumpKing:</b> Atha, show us your tits");
	output("\n\t<b>RavenWulf:</b> Waifu, show us your tits");
	output("\n\t<b>Singularity:</b> Singularity, show us your tits");
	output("\n\t<b>Singularity:</b> ....");
	output("\n\t<b>Singularity:</b> Nobody?");
	output("\n\nReaching off screen, Atha produces a steel ring with a soft, plush inner lining and numerous blinking lights all along the donut shaped device. Roughly 4\" across and 2\" thick, the inner hole barely looks large enough to accommodate her girth, but she slips it on easily enough, eyes wincing as it slides down past the tender nubs encircling her cockhead.");
	output("\n\n<i>“This model was discontinued due to power consumption issues, but I don’t mind paying for all the batteries. I mean, check this out!”</i> She flicks a switch on the ring and an image of a woman’s lower torso flickers around it, holographic projection just barely translucent enough to see a shadow of the cock within. Atha places her hands on the holo onahole and they seem to sink in just slightly before finding purchase. <i>“See? It’s hardlight, but it’s actually really soft! So cool,”</i> she gleefully gurgles.");
	output("\n\n\t<b>ZeroMinus:</b> WANT");
	output("\n\t<b>Yyyyu2:</b> Sweet");
	output("\n\t<b>RavenWulf:</b> Who made that? I must have one!");
	output("\n\t<b>MsCupcake:</b> Oh!");
	output("\n\t<b>Waifu4u:</b> Where does she get all those wonderful toys?");

	output("\n\n<i>“But check this out: it’s got a vibrate function too!”</i> Reaching under the holographic pussy, she flicks another switch and the sound of soft buzzing fills the audio feed. The hologram begins jiggling gently, as if riding Atha’s cock by itself. The vibrations flow through her kitty cock and down into her nuki balls, the twin masses swaying with tidal tumescence. Both hands digging into the pliant cheeks of the holo toy’s plump ass, Atha begins lifting and thrusting slowly as she grins for the camera.");

	output("\n\n\t<b>ZeroMinus:</b> Aw yeah");
	output("\n\t<b>Yyyyu2:</b> nice");
	output("\n\t<b>Waifu4u:</b> IT BEGINS");
	output("\n\t<b>RavenWulf:</b> Ha hah, no matter how many times I see ‘em, kaithrit cocks just look silly!");
	output("\n\t<b>Yyyyu2:</b> Hey D:");
	output("\n\t<b>ZeroMinus:</b> Ouch.");
	output("\n\t<b>RavenWulf:</b> No offense, guys! Just my preference!");

	output("\n\nAtha’s pace picks up, the sound of her thighs and balls slapping against the humming holo carrying over the buzzing of its internal vibration. Through the translucent pelvis, you can make out the silhouette of her kitty cock swelling and pumping with every hammering thrust. The soft barbs both above and below bloat and expand outward, swollen with the camgirl’s vigorous excitement. <i>“Oh heck,”</i> she softly curses. <i>“These little spurs are... NICE!”</i> She gasps, her head rocking back, eyes unable to focus on must as her humping grows more frantic.");
	output("\n\n<i>“I know I docked points from the Kaithrit cock ‘cause the bristles seemed more for your partner than you but... dang if they don’t feel amazing when you’re exciting them all at once!”</i> She tries to smile, but her mouth is hanging open with amazement. <i>“I may have to go back and redo that review! Definitely not the best for just your hands, but with the right toy or with a partner, being a bit of a pussy is a good thing!”</i> She bites her lower lip and plunges into the sex toy with lunging heaves that nearly take the camgirl out of her chair.");

	output("\n\n\t<b>Yyyyu2:</b> Yes! Vindication!");
	output("\n\t<b>MsCupcake:</b> Ah~");
	output("\n\t<b>TinyBee73:</b> That does look nice...");
	output("\n\t<b>ZeroMinus:</b> Ride ‘em, camgirl!");

	output("\n\nThe holographic onahole begins flickering, its charge apparently almost up already. Noticing the failing, Atha winces in disappointment and flicks off the hardlight projection to save on power. Her throbbing kitty cock comes back into full view, the soft pink surface marred by numerous thick veins that pulse and throb with her building climax. Her balls seem to have swollen thicker as well, each orb nearly 8\" across and sloshing with their hot, liquid bounty. Gathering up the thick blobs of pre-cum leaking from her narrow tip, Atha slathers her shaft with the slimy lube. Gripping the vibrating ring with both hands, she pumps it up and down her shaft furiously. Each peak and trough brings a fresh wave of moans and cries from the camgirl, as the buzzing toy stimulates her nub clusters.");

	output("\n\n\t<b>MsCupcake:</b> Oh no!");
	output("\n\t<b>Yyyyu2:</b> Wouldn’t be a stream if Atha didn’t break something, ha ha");
	output("\n\t<b>PumpKing:</b> Aw yeah, let’s see that cream!");
	output("\n\t<b>Waifu4u:</b> Pocket pussy ran out of pussy.");

	output("\n\nAtha slams the donut-shaped vibrator down to the very root of her length, the encircling spurs practically purring in delight as the toy overstimulates the tender, flesh quills. Her cock bulges outward, thickening in the moment of her climax, her barbs stroking the interior of an imaginary pussy. Brilliant white spunk shoots from her member in thick, ropey jets that arc all the way off screen before splattering back down on the camgirl’s black hair like a pumping, gooey shower. She leans forward to put the most pressure possible on the base of her sweetly raw shaft and in doing so, puts her face directly in the line of fire. A jet catches one side of her glasses, knocking them from her face, while the next shoots directly into a mouth opened in a cry of surprise.");

	output("\n\nHacking and reflexively swallowing the jizz, the rest of her face is treated to the full intensity of her rapid pumping orgasm. Sticky spoo splatters against her delicate bronze features, splashing into her jet black hair and dripping down onto her burgundy vest and tie. She groans as her overfull kui-tan testes try to shoot their load past the too-narrow urethra of her kaithrit cock and the individual spurts become one unbroken stream of alabaster cream.");
	output("\n\nThe fountaining phallus flops wildly for a moment before Atha seizes it with both hands and leans forward to lock her lips around the tip of the spasming member. Her throat distends with thick gulping motions, but just as much cum drools out as goes down, drenching her in her own fluids. When, finally, her balls reach the end of their reservoirs, the suckling girl glances upward. Still suckling on her cock, she catches up on the chat progress with a sly grin.");

	output("\n\n\t<b>Yyyyu2:</b> Yesss");
	output("\n\t<b>RavenWulf:</b> Awesome");
	output("\n\t<b>ZeroMinus:</b> So messy :)");
	output("\n\t<b>PumpKing:</b> Mmmm");
	output("\n\t<b>TinyBee73:</b> Daily shower~");
	output("\n\t<b>MsCupcake:</b> What a wonderful mess");
	output("\n\t<b>Waifu4u:</b> Condoms not allowed");
	output("\n\t<b>ZeroMinus:</b> Shoot, we should’ve asked her to fill up some condoms to send to us.");
	output("\n\t<b>RavenWulf:</b> Pretty sure you’re not allowed to send your cum to strangers.");
	output("\n\t<b>ZeroMinus:</b> We’re not strangers! We’re fans, supporters, and friends!");
	output("\n\t<b>MsCupcake:</b> What would you do with the cum, dear?");
	output("\n\t<b>ZeroMinus:</b> ...stuff.");

	output("\n\nWith a wet “muah!” Atha releases her kitty cock, her last mouthful of cum leaking down her lips and dribbling from her slimed chin. <i>“Ha hah, you guys are too much! Thank you so much for supporting me in doing what I love!”</i>");

	output("\n\n\t<b>MsCupcake:</b> My pleasure.");
	output("\n\t<b>ZeroMinus:</b> Loved it!");
	output("\n\t<b>Yyyyu2:</b> Kitty Cock Redemption!");
	output("\n\t<b>RavenWulf:</b> The show was great, Atha. Thanks again for this!");
	output("\n\t<b>YourPalBadger:</b> Always educational.");
	output("\n\t<b>TinyBee73:</b> You’re so welcome, Atha! You’re the best :D");
	output("\n\t<b>Singularity:</b> Gotta get a friend to help next time! Friends don’t run out of batteries!");
	output("\n\t<b>YourPalBadger:</b> Says you. >:3");
	output("\n\t<b>PumpKing:</b> Round 2!");
	output("\n\t<b>Waifu4u:</b> 2 of 20!");

	output("\n\nThe buzzing toy on Atha’s base slows and dies, its charge gone. She slips the loop off and sets it aside with a sheepish grin. Body still slick with her own seed, the camgirl chats for a little while longer before the stream eventually comes to an end, the camgirl thanking everybody once more before the screen goes black.");
	
	processTime(20);
	pc.lust(40);
	clearMenu();
	addButton(0,"Next",backToSmutMenu);
}

//[Zil]
public function cumStreamingZilCock():void
{
	clearOutput();
	showAtha("ZIL");
	author("Adjatha");
	output("<i>“Bee boy cock, huh? He-heh these are always fun. Back in a sec!”</i>");

	output("\n\n\t<b>TinyBee73:</b> Ooooh");
	output("\n\t<b>TinyBee73:</b> I’m so excited!");
	output("\n\t<b>PumpKing:</b> I don’t get the fascination with foreskin");
	output("\n\t<b>Singularity:</b> Don’t even worry about it.");
	output("\n\t<b>MsCupcake:</b> I must admit, I do enjoy seeing Atha with cute dicks like that Zil member.");
	output("\n\nWhen Atha returns, she’s got a pair of sloshing bowling balls dangling just below a 9\" Zil shaft. The rumpled, yellow foreskin around her member shifts slightly with every step. The tip is just barely visible from within the wrinkled, fleshy sheath. Copious rolls of pliant skin hang in semi-taut flab that seem to flex and quiver as her shaft throbs with the stiffening excitement of exhibition.");
	output("\n\n<i>“It’s a shame CumStreamer doesn’t transmit scent,”</i> she remarks as she takes her seat in front of the camera once more. <i>“The pheromones are so sweet just being around my own cock makes me wet. I’d love to have all of you panting with need as you fawn over my floppy little dick,”</i> she buzzes excitedly as she strokes the yielding foreskin hanging thickly around her shaft. Tracing a finger up and down the barely visible thick cumvein, she gently massages one of her massive, mis-matched testes with the other hand. <i>“Well, since I’ve already reviewed this cock type, how about we try out some new toys?”</i>");

	output("\n\n\t<b>TinyBee73:</b> Yay!");
	output("\n\t<b>ZeroMinus:</b> Atha, you have so many toys! Who spoiled you so? ;)");
	output("\n\t<b>YourPalBadger:</b> Pheromones, ha! Child’s play.");
	output("\n\t<b>RavenWulf:</b> Nah, Zil Pheromones are the real deal, Badger.");
	output("\n\t<b>TinyBee73:</b> She’s right. They’ll have you drooling for honey cum in no time :D");
	output("\n\t<b>YourPalBadger:</b> Bah, I say. And BAH again!");
	output("\n\t<b>Waifu4u:</b> bah bah black badger, have you any wool?");

	output("\n\nReaching off screen, Atha produces a steel ring with a soft, plush inner lining and numerous blinking lights all along the donut shaped device. Roughly 4\" across and 2\" thick, the inner hole barely looks large enough to accommodate her girth, but she slips it on easily enough, eyes wincing as it slides down past the tender crest of skin encircling her cockhead.");
	output("\n\n<i>“This model was discontinued due to power consumption issues, but I don’t mind paying for all the batteries. I mean, check this out!”</i> She flicks a switch on the ring and an image of a woman’s lower torso flickers around it, holographic projection just barely translucent enough to see a shadow of the cock within. Atha places her hands on the holo onahole and they seem to sink in just slightly before finding purchase. <i>“See? It’s hardlight, but it’s actually really soft! So cool,”</i> she gleefully gurgles.");

	output("\n\n\t<b>RavenWulf:</b> Oooo, I gotta get one of those!");
	output("\n\t<b>Singularity:</b> I think I can see where this is going...");
	output("\n\t<b>Waifu4u:</b> Should save on cleanup, at any rate.");

	output("\n\n<i>“But check this out: it’s got a vibrate function too!”</i> Reaching under the holographic pussy, she flicks another switch and the sound of soft buzzing fills the audio feed. The hologram begins jiggling gently, as if riding Atha’s cock by itself. The vibrations flow through her bee boi cock and down into her nuki balls, the twin masses swaying with tidal tumescence. Both hands digging into the pliant cheeks of the holo toy’s plump ass, Atha begins lifting and thrusting slowly as she grins for the camera.");

	output("\n\n\t<b>TinyBee73:</b> And away she goes!");
	output("\n\t<b>PumpKing:</b> Put that filly through her paces!");

	output("\n\nAtha’s pace picks up, the sound of her thighs and balls slapping against the humming holo carrying over the buzzing of its internal vibration. Through the translucent pelvis, you can make out the silhouette of her zil cock swelling and pumping with every hammering thrust. The soft folds tighten as her foreskin rolls on and off of the girl’s peak, bloated skin tightening with the camgirl’s vigorous excitement. <i>“Oh heck,”</i> she softly curses. <i>“The scent just gets stronger the more you pump!”</i> She gasps, her head rocking back, eyes unable to focus on must as her humping grows more frantic.");

	output("\n\n<i>“I know some people are weirded out by all the thick folds, but zil cocks are just too cute! And everything’s so sensitive, it’s a miracle I’ve held out this long. It’s like a single touch is enough to make you shoot your load!”</i> She tries to smile, but her mouth is hanging open with restrained bliss. <i>“I could just bury my nose in these folds and sniff all day long, but duty calls,”</i> she jokes weakly. She bites her lower lip and plunges into the sex toy with lunging heaves that nearly take the camgirl out of her chair.");

	output("\n\n\t<b>TinyBee73:</b> Zil are too cute? *blushes*");
	output("\n\t<b>MsCupcake:</b> Goodness! She’s really getting in there.");
	output("\n\t<b>Waifu4u:</b> How do you feel about a spin-off show called “Let’s Breed”?");
	output("\n\t<b>PumpKing:</b> The King has found his Queen!");

	output("\n\nThe holographic onahole begins flickering, its charge apparently almost up already. Noticing the failing, Atha winces in disappointment and flicks off the hardlight projection to save on power. Her throbbing zil cock comes back into full view, the soft amber surface just taut enough to hint at the numerous thick veins that pulse and throb beneath the fleshy covering. Her balls seem to have swollen thicker as well, each orb nearly 8\" across and sloshing with their hot, liquid bounty. Gathering up the thick blobs of pre-cum leaking from the folds of her concealed tip, Atha slathers her shaft with the slimy lube. Gripping the vibrating ring with both hands, she pumps it up and down her shaft furiously. Each peak and trough brings a fresh wave of moans and cries from the camgirl, as the buzzing toy stimulates every inch of the too-tender rod.");

	output("\n\n\t<b>RavenWulf:</b> Aw, toy cut out.");
	output("\n\t<b>TinyBee73:</b> Yeah, but now you can see the cock better! :)");
	output("\n\t<b>YourPalBadger:</b> I may get one of those toys. I bet there’s lots of fun modifications I could make...");
	output("\n\t<b>Singularity:</b> Always worried about business, Badger.");
	output("\n\t<b>Waifu4u:</b> Yeah, stop and smell the Zil Cocks.");
	output("\n\t<b>TinyBee73:</b> *Blushing intensifies*");

	output("\n\nAtha slams the donut-shaped vibrator down to the very root of her length, the loose foreskin pulled down to reveal the camgirl’s cockhead fully. She practically purs in delight as the toy overstimulates the tender, rumpled flesh. Brilliant gold spunk shoots from her member in thick, ropey jets that arc all the way off screen before splattering back down on the camgirl’s black hair like a pumping, gooey shower. She leans forward to put the most pressure possible on the base of her sweetly raw shaft and in doing so, puts her face directly in the line of fire. A jet of honey catches one side of her glasses, knocking them from her face, while the next shoots directly into a mouth opened in a cry of surprise.");

	output("\n\nHacking and reflexively swallowing the sweetly narcotic jizz, the rest of her face is treated to the full intensity of her rapid pumping orgasm. Sticky spoo splatters against her delicate bronze features, splashing into her jet black hair and dripping down onto her burgundy vest and tie. She groans as her overfull kui-tan testes try to shoot their load past the too-narrow urethra of her zil cock and the individual spurts become one unbroken stream of golden amber cream.");

	output("\n\nThe fountaining phallus flops wildly for a moment before Atha seizes it with both hands and leans forward to lock her lips around the tip of the spasming member. Her throat distends with thick gulping motions, but just as much cum drools out as goes down, drenching her in her own fluids. When, finally, her balls reach the end of their reservoirs, the suckling girl glances upward. Still suckling on her cock, she catches up on the chat progress with a sly grin.");

	output("\n\n\t<b>Singularity:</b> Woo!");
	output("\n\t<b>ZeroMinus:</b> Tasty cream for Atha~");
	output("\n\t<b>Yyyyu2:</b> Ha hah, this show always leaves you such a mess, girl!");
	output("\n\t<b>TinyBee73:</b> That was AWESOME! Thank you so much for the show!");
	output("\n\t<b>MsCupcake:</b> Indeed, I agree with Tiny Bee. Wonderful performance.");
	output("\n\t<b>MsCupcake:</b> I’m all hot and bothered myself.");

	output("\n\nWith a wet “muah!” Atha releases her bee cock, her last mouthful of cum leaking down her lips and dribbling from her slimed chin. <i>“Ha hah, you guys are too much! Thank you so much for supporting me in doing what I love!”</i>");

	output("\n\n\t<b>RavenWulf:</b> Our pleasure, Atha!");
	output("\n\t<b>TinyBee73:</b> Always!");
	output("\n\t<b>Waifu4u:</b> A hundred years, Atha and alien cocks. Alien cocks and Atha dot com a hundred years.");
	output("\n\t<b>Singularity:</b> Very cool stuff!");
	output("\n\t<b>ZeroMinus:</b> Do we get to watch you lick up all that honey cum?");

	output("\n\nThe buzzing toy on Atha’s base slows and dies, its charge gone. She slips the loop off and sets it aside with a sheepish grin. Body still slick with her own amber seed, the camgirl chats for a little while longer before the stream eventually comes to an end, the camgirl thanking everybody once more before the screen goes black..");
	processTime(20);
	pc.lust(40);
	clearMenu();
	addButton(0,"Next",backToSmutMenu);
}

//[Ausar]
public function ausarCumStreaming():void
{
	clearOutput();
	author("Adjatha");
	showAtha("AUSAR");
	output("<i>“Puppy pecker, huh? He-heh these are always fun. Back in a sec!”</i>");

	output("\n\n\t<b>RavenWulf:</b> Killer.");
	output("\n\t<b>TinyBee73:</b> Aw :(");
	output("\n\t<b>Singularity:</b> But you always see Ausar cocks! They’re everywhere.");
	output("\n\t<b>MsCupcake:</b> They’re certainly common, but I wouldn’t be too upset.");
	output("\n\t<b>MsCupcake:</b> I’m sure Atha knows how to put on a show.");
	output("\n\t<b>YourPalBadger:</b> Ausar dicks are everywhere because they’re more successful. It’s science!");

	output("\n\nWhen Atha returns, she’s got a pair of sloshing bowling balls dangling just below a 12\" ausar shaft. The sleek, red, canine member curves upward, bobbing with every step. The head slopes forward into a rounded point while the knotty flesh at her base seems to flex and bloat as her shaft throbs with the stiffening excitement of exhibition.");
	output("\n\n<i>“You know, people say ausar cocks are over rated, but I think they deserve all the hype,”</i> she remarks as she takes her seat in front of the camera once more. <i>“The shaft is perfectly sloped for stroking or for pumping, and while the knot is fun in private, it’s oh so delightful when you’re sharing it with a friend,”</i> she laughs as she strokes the firm bulb at her root. Tracing a finger up and down the thick cumvein, she gently massages one of her massive, mis-matched testes with the other hand. <i>“Well, since I’ve already reviewed this cock type, how about we try out some new toys?”</i>");

	output("\n\n\t<b>ZeroMinus:</b> Oh goody! Toys!");
	output("\n\t<b>RavenWulf:</b> Ha hah what wacky gadgets do you have this time?");
	output("\n\t<b>Yyyyu2:</b> Sex bot? Please be a sex bot!");
	output("\n\t<b>MsCupcake:</b> Dear, I think we’ll all have to donate rather more if Atha is to get one of those.");
	output("\n\t<b>YourPalBadger:</b> I could probably whip something up...");
	output("\n\t<b>TinyBee73:</b> I don’t think we want to see what you could whip up. O_o");

	output("\n\nReaching off screen, Atha produces a steel ring with a soft, plush inner lining and numerous blinking lights all along the donut shaped device. Roughly 4\" across and 2\" thick, the inner hole barely looks large enough to accommodate her girth, but she slips it on easily enough, eyes wincing as it slides down past the slight flare of her sloping cockhead.");

	output("\n\n<i>“This model was discontinued due to power consumption issues, but I don’t mind paying for all the batteries. I mean, check this out!”</i> She flicks a switch on the ring and an image of a woman’s lower torso flickers around it, holographic projection just barely translucent enough to see a shadow of the cock within. Atha places her hands on the holo onahole and they seem to sink in just slightly before finding purchase. <i>“See? It’s hardlight, but it’s actually really soft! So cool,”</i> she gleefully gurgles.");

	output("\n\n\t<b>RavenWulf:</b> Nice!");
	output("\n\t<b>ZeroMinus:</b> I wonder if they make hardlight condoms?");
	output("\n\t<b>PumpKing:</b> Ooo, we get a little hard pumping thrown in, huh?");

	output("\n\n<i>“But check this out: it’s got a vibrate function too!”</i> Reaching under the holographic pussy, she flicks another switch and the sound of soft buzzing fills the audio feed. The hologram begins jiggling gently, as if riding Atha’s cock by itself. The vibrations flow through her dog cock and down into her nuki balls, the twin masses swaying with tidal tumescence. Both hands digging into the pliant cheeks of the holo toy’s plump ass, Atha begins lifting and thrusting slowly as she grins for the camera.");

	output("\n\n\t<b>PumpKing:</b> Yessss");
	output("\n\t<b>YourPalBadger:</b> I wonder who the model was for that design?");
	output("\n\t<b>Singularity:</b> Whoever it was, they’ve got quite an ass!");
	output("\n\t<b>YourPalBadger:</b> That’s why I was curious. >:)");

	output("\n\nAtha’s pace picks up, the sound of her thighs and balls slapping against the humming holo carrying over the buzzing of its internal vibration. Through the translucent pelvis, you can make out the silhouette of her puppy cock swelling and pumping with every hammering thrust. The soft tip of her peak pushes ever deeper, shaft swollen with the camgirl’s vigorous excitement. <i>“Oh heck,”</i> she softly curses. <i>“The vibrations on my knot are...”</i> She gasps, her head rocking back, eyes unable to focus on must as her humping grows more frantic.");

	output("\n\n<i>“The only downside here is, it might be a bit... tough... to get the ring... around my knot!”</i> She tries to smile, but her mouth is hanging open with the strain of her efforts. <i>“Really the only mark against the ausar cock is how thick these knots are even before you cum!”</i> She bites her lower lip and plunges into the sex toy with lunging heaves that nearly take the camgirl out of her chair.");

	output("\n\n\t<b>RavenWulf:</b> I believe in you!");
	output("\n\t<b>MsCupcake:</b> You can do it!");
	output("\n\t<b>ZeroMinus:</b> Knot that pussy! Don’t let a single drop escape!");

	output("\n\nThe holographic onahole begins flickering, its charge apparently almost up already. Noticing the failing, Atha winces in disappointment and flicks off the hardlight projection to save on power. Her throbbing canine cock comes back into full view, the soft red surface marred by numerous thick veins that pulse and throb with her building climax. Her balls seem to have swollen thicker as well, each orb nearly 8\" across and sloshing with their hot, liquid bounty. Gathering up the thick blobs of pre-cum leaking from her narrow tip, Atha slathers her shaft with the slimy lube. Gripping the vibrating ring with both hands, she pumps it up and down her shaft furiously. Each peak and trough brings a fresh wave of moans and cries from the camgirl, as the buzzing toy stimulates her swollen bulb.");

	output("\n\n\t<b>ZeroMinus:</b> Ooops.");
	output("\n\t<b>ZeroMinus:</b> On the plus side, now we get to see all the cummies");
	output("\n\t<b>Waifu4u:</b> I need more power, captain!");

	output("\n\nAtha slams the donut-shaped vibrator down to the very root of her length, the girthy knot finally sliding past the ring’s lip. Practically howling in delight as the toy overstimulates the tender flesh, the camgirl digs her fingers into the pliant masses of her expanding balls. Her cock bulges outward, thickening in the moment of her climax, her knot swelling to lock inside the interior of an imaginary pussy. Brilliant creamy spunk shoots from her member in thick, ropey jets that arc all the way off screen before splattering back down on the camgirl’s black hair like a pumping, gooey shower. She leans forward to put the most pressure possible on the yielding bulk of her fluid balls and in doing so, puts her face directly in the line of fire. A jet catches one side of her glasses, knocking them from her face, while the next shoots directly into a mouth opened in a cry of surprise.");

	output("\n\nHacking and reflexively swallowing the jizz, the rest of her face is treated to the full intensity of her rapid pumping orgasm. Sticky spoo splatters against her delicate bronze features, splashing into her jet black hair and dripping down onto her burgundy vest and tie. She groans as her overfull kui-tan testes shoot their load past the too-narrow urethra of her ausar cock and the individual spurts become one unbroken stream of alabaster cream.");

	output("\n\nThe fountaining phallus flops wildly for a moment before Atha seizes it with both hands and leans forward to lock her lips around the tip of the spasming member. Her throat distends with thick gulping motions, but just as much cum drools out as goes down, drenching her in her own fluids. When, finally, her balls reach the end of their reservoirs, the suckling girl glances upward. Still suckling on her cock, she catches up on the chat progress with a sly grin.");

	output("\n\n\t<b>PumpKing:</b> First class performance.");
	output("\n\t<b>Yyyyu2:</b> Not bad for a doggy dick.");
	output("\n\t<b>YourPalBadger:</b> We’ll make a breeder of you yet.");
	output("\n\t<b>RavenWulf:</b> Yeah!");
	output("\n\t<b>RavenWulf:</b> I knew you could knot it if you tried.");
	output("\n\t<b>MsCupcake:</b> We always believed in you, dear.");
	output("\n\t<b>TinyBee73:</b> Now leave it on for the rest of the day~");
	output("\n\t<b>MsCupcake:</b> Tiny Bee! You’ve got a bit of a kinky side, don’t you?");
	output("\n\t<b>TinyBee73:</b> :3");

	output("\n\nWith a wet “muah!” Atha releases her doggy cock, her last mouthful of cum leaking down her lips and dribbling from her slimed chin. <i>“Ha hah, you guys are too much! Thank you so much for supporting me in doing what I love!”</i>");

	output("\n\n\t<b>ZeroMinus:</b> Delicious.");
	output("\n\t<b>Singularity:</b> Can’t wait for more!");
	output("\n\t<b>RavenWulf:</b> ... we have GOT to get you out to the Planet Rush, girl!");
	output("\n\t<b>YourPalBadger:</b> I couldn’t agree more.");
	output("\n\t<b>PumpKing:</b> Definitely wanna see more hard fuckin’ in the future!");

	output("\n\nThe buzzing toy on Atha’s base slows and dies, its charge gone. She tries to slip the loop off, but her knot is far too thick to release the ring so she abandons the effort with a sheepish grin. Body still slick with her own seed, the camgirl chats for a little while longer before the stream eventually comes to an end, the camgirl thanking everybody once more before the screen goes black.");
	processTime(20);
	pc.lust(40);
	clearMenu();
	addButton(0,"Next",backToSmutMenu);
}

/*Let’s Fap Archives
These are unlocked for players to view at their leisure after becoming a ‘Geyser Tier’ Champeon.
Terran (hyper) (Dong Designer by TamaniCorp, overclocked and broken)
Equine (SynthSheath Mk1 by Xenogen bought with Champeon muns)
Living Strap-on (SynthSheath knock-off by Tamani Corp sent by YourPalBadger)
Kaithrit (Nepeta by Xenogen sent by ZeroMinus)
Zil (Zil ration from Mhen’ga sent by TinyBee73)*/

//Let's Fap - Terran
public function letsFapTerran():void
{
	clearOutput();
	showAtha();
	author("Adjatha");
	output("Selecting the first Let’s Fap from the archives shows a slightly younger Atha, the wide-eyed camgirl poking at some equipment doubtfully. The screen flickers with occasional static, ambient sounds of traffic filtering in. <i>“Well, it’s not great, but it should work,”</i> she mutters, perhaps referencing the video or audio capture. <i>“Okay, so hi,”</i> she begins, waving. <i>“I’m Atha Last-Name-Withheld, and this is my show.”</i> She pauses, biting the tip of her thumb. <i>“Nah, that was terrible. Whatever, roll with it.”</i>");
	output("\n\nTurning back to the camera, she presses her palms against either side of her breasts, squeezing them together. <i>“So, I’m a girl in case you couldn’t tell. But, like, I’ve always been fascinated by, you know...”</i> she trails off before lowering her voice. <i>“Um. Dicks?”</i> She blushes. <i>“Like, they’re cool and have all kinds of weird parts and I really want to give ‘em a try. I figured that might be something you guys would like to see, so I got this camera and stuff and oh geez this is a dumb idea, why am I doing this?”</i>");
	output("\n\nAtha slaps her forehead, groaning. <i>“Whatever! It’s too late to chicken out now. So yeah... dicks. Dicks. I’m gonna try em out and you’re gonna watch. It’ll be great times.”</i> She sighs and bops herself on the chin to psych herself up. <i>“So! You’re asking yourself how I’m going to get a dick, right? Well, there’s lots of ways probably, but for this show I’ll be using a TamaniCorp Dong Designer!”</i> She tilts the camera slightly to put the machine into frame before refocusing on herself. <i>“It’s not mine, I just borrowed it from a friend. But they won’t mind as long as nobody tells her,”</i> she adds with a wink.");
	output("\n\n<i>“Okay, dick-town, population: me. Let’s do this thing!”</i> Atha stands up, apparently wearing pants instead of her usual skirt, and heads off screen to the Dong Designer. There is a long pause, the sound of her fiddling with the instrument, followed by the sound of her hitting the machine several times. When she comes back on camera, Atha seems frustrated. <i>“So APPARENTLY you have to have a dick to use the dong designer? How stupid is that? I’m gonna figure this thing out and get back to you.”</i>");
	output("\n\nShe switches the capture off and a second later it turns back on. Apparently much later, Atha seems to have lost her tie, grease and scorch stains all over her shirt and hands. <i>“Okay! Camera good? Fine! It took me just about hecking forever, but I think I got the thing working.”</i> She gives a vigorous nod of affirmation and sticks out a fierce thumb’s up, as if it were a weapon. <i>“Dong Designer: take two!”</i>");
	processTime(4);
	clearMenu();
	addButton(0,"Next",letsFapTerran2);
}

public function letsFapTerran2():void
{
	clearOutput();
	showAtha();
	author("Adjatha");
	output("She steps off camera again and after a brief pause, her startled cry comes through, followed by a string of invectives that nearly makes you blush. From off screen, Atha’s voice faintly comes through on the capture. <i>“Oh wow, this feels freaky. Is it always going to feel like this? Man, and it keeps going, too. Okay, that’s probably enough. Um, stop? I said that’s enough! Cut it out! Stop you stupid, overclocked piece of space trash!”</i> There is the further sound of a machine being banged and kicked and finally a heavy, wet popping noise.");
	output("\n\nGradually, Atha leans into frame, her glasses askew, her face flushed, and a nervous smile on her face. <i>“Okay, so, this is embarrassing, but I think my tweaks to that machine kinda broke it. So... I gotta buy Nett a new Dong Designer. Sorry Nett!”</i> She clasps her hand over her mouth. <i>“Oh, shoot! I shouldn’t have used your name.”</i> Closing her eyes with a sigh, she shakes her head. <i>“It’s really hard to think with this thing hanging off of me.”</i>");
	output("\n\nWhen she steps fully into frame, the camgirl’s pants are bunched around her knees, exposing her pelvis. Where there had been smooth skin before, now a massive, terran cock hangs between her legs- nearly twenty inches long and four inches wide while still flaccid. <i>“Taking those limiters off the dong designer was probably a bad idea, in retrospect,”</i> she admits as she shuffles a little closer to the camera.");
	output("\n\n<i>“Well, I wanted a dick and this is about as much dick as anybody could ask for,”</i> she admits, unable to suppress a small smile. <i>“I don’t think this monster is going to fit in anybody’s holes any time soon, so I guess we’d better just take stock of the thing.”</i> Lifting the hefty pillar with both hands, she flashes a silly grin as she swings her hips back and forth. <i>“Okay, well it feels pretty good! A lot softer and squishier than I would’ve thought. Like playing with your cheeks,”</i> she says, poking the inside of her cheek with her tongue.");
	output("\n\nSliding her hands up, she reaches the crest of the shaft, staring doubtfully at her cockhead. <i>“I guess this looks okay, but it’s a little weird with the foreskin.”</i> She flicks the thin folds with her fingers, eyebrows shooting up in surprise. <i>“Woah! Okay now this part’s sensitive as hell!”</i> She tries again and her mouth becomes a delighted oval of awe. <i>“Shoot! It’s like the whole tip’s as tender as a clit! Well dang, it’s no wonder guys get hard all the time, with something like this in their pants.”</i>");
	output("\n\nA wicked smile crosses Atha’s face. <i>“Speaking of pants... bear with me, I wanna try something.”</i> Letting go of her massive length, she bends down to lay hold of the clothing hanging at her knees and slowly begins to pull them up, shifting so that her member is funneled down one of the pants legs. She grunts as she reaches her thighs, the added girth making the cloth bulge, but she just barely manages to get the pants on, the outline of her shaft clearly visible on her inner thigh. <i>“Ha ha woah! That is tight!”</i> She takes a step and flinches. <i>“Ah, maybe too tight,”</i> she adds with a tense frown. <i>“Definitely getting tighter, too.”</i> The camgirl uses her hands to push down against the organ stretching her clothing out, but the dismissive strokes predictably cause only greater swelling.");
	output("\n\n<i>“Okay, pants were a bad call,”</i> she admits, struggling to pull them down again before her expanding phallus tears through the fabric. <i>“What’s up with this thing anyway? It can’t decide if it wants to be soft or hard! And nothing I do seems to make it go back. Is it supposed to fight you?”</i> Bending forward to pull her pants down all the way, the camgirl is struck by her own cock on its way up, the fleshly impact heavy enough to be picked up by her poor audio setup. Startled, Atha stumbles backward, loses her balance and falls on her ass. She collapses, below the view of the camera except for the burgeoning obelisk of her prick.");
	processTime(6);
	pc.lust(7);
	clearMenu();
	addButton(0,"Next",letsFapTerran3);
}
public function letsFapTerran3():void
{
	clearOutput();
	showAtha("TERRAN");
	author("Adjatha");
	output("Slowly rising to her feet, Atha rubs the reddish mark left on her forehead by the traitorous organ. <i>“Gettin’ a little light headed,”</i> she mutters, struggling over to her chair and dropping into it heavily. <i>“It’s really hard to think with this big, throbbing cock in my lap,”</i> she whines, hands struggling to hold the now nearly thirty inch behemoth to one side. With a member that towers over her head, the camgirl offers a weak smile and a helpless shrug. <i>“I guess we’d better take care of this girl before she gets any more out of hand!”</i>");
	output("\n\nLacing her fingers together around the swollen cumvein of her jawbreaking behemoth, the camgirl slowly strokes up and down the tense flesh. She presses tightly against the yielding mass, whining with unfamiliar delight. <i>“Hnnn... oh, yes, this is the fucking best,”</i> she purrs. Her hips shift uncontrollably with every pump, mouth opening in an ‘O’ of shock every time she reaches the nerve-dense peak. Bubbles of pre-cum spurt from the tip of her monster but she hardly notices, the oozing goo quickly worked into her strokes.");
	output("\n\nThe seeping spoo leaves her terran monster glistening and adds lubrication that speeds her strokes beyond the girl’s capacity to bear. <i>“W-what? It’s - hng! - really tight! Feels - oh! - like a hot pressure...”</i> she moans. Her pumps quick and tight, Atha leans in and begins licking the crested tip of her titanic dick. Veins bulging all over the ponderous mass, she wraps both arms around her cock, squeezing it tightly against her buxom chest and nibbles lightly at the tender tip.");
	output("\n\n<i>“I just... wanna... put this whole thing in-”</i> her thought is interrupted when a burst of cum shoots out of the overwrought meat and catches her directly in the face. She freezes in shock and alarm, her cock throbbing before its next blast fires into the open air. Atha gasps raggedly, her shoulders shivering and her body twitching as the shaft has its way with her. She releases her grip to fondle her breasts, allowing the incredible heft of her fuckstick to drop heavily onto her desk. With the camera at eye-level with the giant phallus, you have a perfect view as the head tenses, its slit widening reflexively. An ivory stream of spunk bursts from the fleshy cannon, the wild spray just barely missing the camera but giving a beautiful view of its splattering passage.");
	output("\n\n<i>“The camera!”</i> Atha yelps, gathering her colossal cock back into her arms protectively even as another burst nearly robs her of her strength again. <i>“Oooh... ohhh... feels so good,”</i> she mutters, chewing slightly on her lower lip as she strokes, squeezes, and milks the pliant cumvein of her terran titan. Her orgasm goes on and on, thick ropes of rich, virginal cum spurting from the camgirl’s new organ, pooling on her desk as often as it rains down on her quivering form. With a manic voice she tries to explain the sensations of her relentless orgasm, but keeps descending into a babble of cooing glee and sharp exclamations of bliss.");
	output("\n\nWhen, at last, her sloppy cream slows to a trickle, the camgirl lets her cock drop again, the mammoth member thudding heavily onto her desk with a force that bounces the camera. Atha slouches in her chair, mouth hanging open while she pants helplessly. <i>“Fucking. Yes,”</i> she gasps, her face dripping with the white slime of her first masculine release. <i>“This is for me. This is so very much for me. I am going to pump this thing till I can’t think any more,”</i> she swears with a grin of lust-crazed lunacy. Her emerald eyes are nearly vacant with a far-off euphoria, the tiny onyx gem set in her forehead glittering with her face’s polished lacquer.");
	processTime(7);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",letsFapTerran4);
}

public function letsFapTerran4():void
{
	clearOutput();
	showAtha("TERRAN");
	author("Adjatha");
	output("Licking her lips, she starts upright, slightly more aware of herself. Gathering fingerfuls of the seed, she pops the goo into her mouth and thoughtfully rolls it around her mouth before swallowing heavily. <i>“I even like the taste,”</i> she sighs. <i>“Oh man, and if a human cock felt this good, imagine what other cocks must feel like?”</i> Her eyes practically twinkle at the thought. <i>“Yeah, we’re doing this. This is a thing that is definitely getting done. But first...”</i>");
	output("\n\nShe trails off as she begins stroking her cock again, eager for a second round that the throbbing organ is all too happy to provide. Checking the playback, it seems the video goes on for another three hours as Atha jacks herself into carnal oblivion, cumming another six times before she passes out in her seat, practically glued there by the thick glaze of her dripping seed, eyes half veiled and rolled to the back of her lolling head. This time, when she lets her cock flop onto the desk, it apparently hits something because the feed goes dead.");
	processTime(20);
	pc.lust(15);
	champeonOrOffMenu();
}

//[NEW] Let's Fap - Equine
public function letsFapEquine():void
{
	clearOutput();
	showAtha("TERRAN");
	author("Adjatha");
	output("When you switch on the archived video, Atha is sitting at her usual place, but the dark skinned camgirl looks a bit run down. Her hair is out of order, her glasses are askew, and deep shadows under her eyes suggest that she’s been pulling some long nights. It’s no wonder she’s so exhausted, you realize as you take in the rest of the scene. Her desk is virtually covered in large, fluid-filled balloons about the size of a melon, tied off at the top and sagging with their ivory wealth. There must be three or four dozen overfilled condoms surrounding the girl, in just one week.");
	output("\n\nA sharp snap pulls your eyes back up to Atha, who has apparently just finished tying off the latest addition to her hoard. Bouncing the blobby ball in the palm of her hand, she turns to the camera with an irrepressible smile. <i>“Hey ‘Net, it’s Atha. As you can see, I’ve been a bit busy this week. Just checking to make sure the new equipment works, you know. Like... six times a day.”</i> She rolls her head on her shoulders with a deep sigh. <i>“Oooh boy. It’s been a long week!”</i>");
	output("\n\nSetting the condom down with the others, she raps her fingers on the edge of her desk and gathers her thoughts through the lust-fatigued haze. <i>“Oh! Great news! So I used my last paycheck to buy a new Dong Designer for Nett. She was a little ticked that I borrowed her old one, but we talked it over and she forgave me.”</i> Rolling her eyes upward and offering an impish grin, Atha reaches down and hoists the flaccid mass of her titantic terran cock onto the desk with a thump, sending rippling shock waves through the condoms all around her. <i>“I should say, my new gal pal here did most of the talking...”</i> she teases with a lilting voice.");
	output("\n\n<i>“Oh! And another thing,”</i> she remembers with a delighted coo, <i>“I set up a Champeon page! I’ll put a little link thingie at the end of the video and if you want to see me try out a bunch of cool dick stuff, consider making a little donation to support me! I figured we’d see how much demand there is to see girls jacking off big ole cocks, but if all the Ultra Porn on my compy is any indication, I’d say folks are pretty into chicks with dicks.”</i> She beams and lifts both thumbs up with an excitement that is steadily overtaking her exhaustion. The soft behemoth on her desk quivers, slowly expanding.");
	output("\n\n<i>“As for this week, I thought we’d try out some toys. You guys like that kinda stuff, yeah?”</i> Reaching down, she produces a massive dildo that seems to have been crafted to resemble a horse’s phallus. The 15 inch bestial member is dull maroon, speckled with darker spots around the shaft, terminating in a charcoal gray at the medial ring. At the base, a pair of massive, globular balls hang heavily, as if they’re already filled. <i>“Cute girl, huh? I found this while I was sound-proofing this room for recording. I think I got this as a joke gift from a friend? I’d... uh... be lying if I said I didn’t give it a try a few times,”</i> she admits, blushing and glancing over her shoulder.");
	output("\n\n<i>“But check this out!”</i> She turns the dildo around to reveal a slit in the back, where the balls connect to the cock. She slips a few fingers into the hole, before jamming her fist up to the elbow into gap. <i>“It’s a fuck-toy with options! It seems a bit silly to be fucking a dick from the back, but ha ha just silly enough to be entertaining, I think. So, here we go!”</i>");
	processTime(7);
	pc.lust(6);
	clearMenu();
	addButton(0,"Next",letsFapEquine2);
}

public function letsFapEquine2():void
{
	clearOutput();
	showAtha("EQUINE");
	author("Adjatha");
	output("Hoisting the floppy dildo next to her own swelling flesh, she positions her cockhead against the slitted entrance with a wild laugh. <i>“Hey, it’s even warm! What a cool toy. I just wish it were bigger...”</i> Next to her erect 20\" length, the 15\" horse toy is positively puny. Shrugging, she leans forward and starts sliding the rubbery covering over her heft like a second skin. She lets out a deep gasp as inch by inch she slides her member into the too-tight equine length, its flexible composition bulging with the intrusion.");
	output("\n\nAtha begins panting, gripping the horsecock toy tighter as she pulls it onto her body. <i>“Is this thing already lubricated? Feels soft and wet inside, which is great, but I think the lube’s gone bad ‘cause I’m getting a funny tingling all over. Kind of a... nice one though...”</i> She shivers and grits her teeth, pulling the sheath down with bucking thrusts, fucking the inside of the toy with pants and gasps until at last she bottoms out, the toy’s spongy balls slapping against her inner thighs. <i>“Oh, fuck,”</i> she gasps with a whine, <i>“my balls are so heavy...”</i>");
	output("\n\nThe camgirl stops, freezing in place. She looks down at the 15\" horsecock pressed tightly against her pelvis and the hefty pair of testes throbbing between her thighs. <i>“Wait a minute,”</i> she mutters slowly. <i>“This math doesn’t add up. Unless this toy’s bigger on the inside, something’s wrong.”</i> She gingerly reaches out to wrap her hands around the pliant equine member and squeezes, wincing from the pressure. With her other hand, she grasps the hanging orbs and presses a thumb against their yielding surface. The shiny toy in her lap leaps upward at the touch, thrilling at the investigation. <i>“Oh... shoot.”</i>");
	output("\n\nA blush starts on her cheeks and quickly spreads until her entire face is flushed a polished copper hue. <i>“I’ve heard of stuff like this. They’re called Synth-Sheaths. You put ‘em on and they rewire your biology to make the toy a permanent part of your body.”</i> Experimentally, she tries to pull the horsecock off, but merely succeeds in jerking herself off further, her now flared tip twitching and swollen. <i>“Well... fuck me. Uh, a little help guys?”</i> She looks imploringly at the camera before remembering this is a recording.");
	processTime(6);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",letsFapEquine3);
}

public function letsFapEquine3():void
{
	clearOutput();
	showAtha("EQUINE");
	author("Adjatha");
	output("<i>“Right. I’m an idiot. Heck. What am I gonna do now? I’ve got a pony pecker the size of my arm and a pair of cum factories bigger than my fist.”</i> She touches it again, wincing. <i>“And fun me if it doesn’t feel ready to go off at a moment’s notice.”</i> A small trickle of sweat rolls down her brow, her overfull chest gasping with quickening breaths. <i>“I think it’s these big... animal balls. Feels like they’re filling my body with - hrng - like a need. Like I gotta jam this thing in some slut and just pump ‘em full of my spunk.”</i>");
	output("\n\nShe grabs her horsecock and begins stroking the shiny, supple organ tenderly at first, but quickening her pace with each panting gasp. <i>“Void,”</i> she curses, clasping a hand over her mouth in shock. <i>“Sorry about that,”</i> she apologizes, her wincing. <i>“It’s just a real effort not to blow my load immediately. I didn’t realize horses were so sensitive,”</i> she moans, rocking in her chair with the intensity of her exertion. <i>“The tip, the shaft, the - ah! - the ring... just everything drives me crazy!”</i> Sliding down in her chair until her mouth is hidden behind the swell of her wobbling breasts, the camgirl pumps with both hands. The towering phallus wobbles with her bucking strokes, it’s hefty peak broadening and flaring outward as she climbs this latest peak.");
	output("\n\n<i>“Gosh dang!”</i> Atha cries out as her orgasm swells. <i>“The condoms!”</i> Frantically, she grabs one of the small foil squares on her desk and tries to slide it down onto her member, but the flared head is far too large for a terran ring. <i>“Not on the new equipment!”</i> she moans helplessly, tossing the useless rubber to one side. The camgirl clenches down as hard as she can on the spasming shaft, trying to hold off the inevitable tide. Her bestial anatomy, however, ignores her distress and the climax finds her all the same. The earthy fleshtones of the synth-sheath flush with the girl’s passion, distending as streams rush up her thick cumvein to the mushroomed peak. Balls pulsing, the camgirl cums and cums hard.");
	output("\n\nFingers twitching and jaw clenched, Atha is swept away in the savage spree of her geysering spunk. Heavy ropes of unnaturally thick jizz spurt from her artificial member, splattering all over the room in a moist shower. Globs plop on top of the mountain of condoms all over her desk, the weight of their impact creating a small avalanche as the cylindrical prophylactics roll madly around the desk. Without her hands to steady it, the erupting peak bows under its own mass, leaning backward to point at the moaning girl herself before releasing another gooey stream into her face. She sputters in surprise and outrage but every attempt to rein in the bucking stallion between her legs simply adds fuel to the fire, igniting fresh spasms of alabaster slime. Sighing from under her dripping ivory mask, she gives in and begins massaging her equine balls, resigned to at least enjoy the gooey spree repainting her room one creamy spurt at a time.");
	output("\n\nWhen she finishes, the camgirl is virtually buried under the pearl muck of her still-drizzling horsecock. <i>“Well,”</i> she begins weakly, <i>“that didn’t exactly go the way I’d planned it. Note to self: check all your sex toys to see if they’re actually anatomy-altering bio-medical supplies.”</i> Wiping the opaque, syrupy spoo from her eyes, Atha blinks and surveys the damage. <i>“Well, I think my recording equipment survived, so that’s a plus. I gotta waterproof everything in this room, I think.”</i>");
	output("\n\nTurning to the camera, she offers a tapped out shrug. <i>“Hope you guys enjoyed that little catastrophe! Despite the white molasses dripping down my walls, I actually had a good time.”</i> She swings the now floppy horsecock back and forth, its rubbery girth sagging like a fleshy pendulum. <i>“I guess if you wanna see more stuff like that, be sure to hit the Love button on these videos! If you’ve got ideas for new stuff, leave a comment! And, if you wanna help me make this my full time job, please support me on Champeon!”</i> Waving her drooping member goodbye, she ends the video with a button press.");
	output("\n\nThe little orange message box pops up asking if you’d like to become a Champeon and support Atha’s cock reviews. Would you like to learn more?");
	
	if(!CodexManager.entryUnlocked("SynthSheath"))
	{
		output("\n\nYour Codex beeps with a warning about how the device you just witnessed, a “Xenogen Biotech SynthSheath Mk1”, may irreversibly alter ones biology. You grimace at the fact.");
		CodexManager.unlockEntry("SynthSheath");
	}
	
	processTime(10);
	pc.lust(25);
	champeonOrOffMenu();
}

//[NEW] Let’s Fap - Kaithrit
public function letsFapKaithrit():void
{
	clearOutput();
	showAtha();
	author("Adjatha");
	output("You turn on one of Atha’s old episodes and are a little surprised to see that the camgirl looks differently than you’d expected. She’s still wearing her normal vest and tie, but above the long mane of raven hair, the camgirl has a pair of twitching black cat ears. The video cuts in mid-sentence. <i>“-just start it now,”</i> she mutters, annoyed. Glancing up at the camera, the normally excitable girl seems fairly frustrated. You notice that her eyes seem to have a cat-like slit that you didn’t remember and behind her chair, a pair of tails flick about with evident agitation.");
	output("\n\n<i>“Hey ‘Net, it’s Atha. Thanks for joining me again. Sorry about, you know, all this,”</i> she gestures at her changes with a dusky hued hand, rolling her eyes. <i>“So, a supporter named ZeroMinus sent me a whole pack of Nepeta treats, which was super cool of him. However, they’re not exactly laser-guided.”</i> She pouts, folding her arms under her massive F-cup breasts. <i>“If I start getting fuzzy, I’m calling this whole thing off,”</i> she grumps, reaching off screen for the Xenogen snacks.");
	output("\n\nPopping a handful in her mouth and chewing thoughtfully, she daintily holds her hand in front of her mouth while chewing. With a swallow, she nods her head slightly, her ears standing upright. <i>“I will say, they’re quite tasty, twin tails or no.”</i> With a sigh, she waits for the snack to have their desired effect, grabbing one of her kaithrit tails and playing with the furry tip while she waits. <i>“I have to say, I’m going into this review a little biased. I haven’t really encountered a kaithrit cock before, so I’m just working off of rumors. Don’t they have barbed tips or something?”</i> She shivers, frowning. <i>“Sounds scary!”</i>");
	output("\n\nThe audio picks up a gurgle from her belly and the camgirl blinks, her ears flattening against her scalp. <i>“Oh, I think we got the right one,”</i> she smiles, a little surprised. Scooting her chair back, Atha pulls her long, white skirt up to reveal the 8\" terran cock between her legs, semi-firm and flopping about as she moves. <i>“Well, I can feel something down there,”</i> she remarks, loosely circling the length with her forefinger and thumb.");
	processTime(4);
	pc.lust(4);
	clearMenu();
	addButton(0,"Next",letsFapKaithrit2);
}

public function letsFapKaithrit2():void
{
	clearOutput();
	showAtha("KAITHRIT");
	author("Adjatha");
	output("<i>“It doesn’t look any-”</i> she pauses as a small collection of bumps start forming around the bottom crest of her cockhead. <i>“Oh! Are those the barbs?”</i> She rubs her fingertips along the slowly swelling nubs. <i>“Well, they don’t feel sharp. Maybe barb is the wrong word for them. Just fleshy little protuberances,”</i> she observes, adjusting her glasses. <i>“Though, I admit, that’s not as catchy.”</i> The bumps grow larger and seem to multiply until the camgirl’s cock practically bristles with them.");
	output("\n\nAtha lets out a little sigh, rubbing her knees together as her cock hardens with every fresh addition to the nub-studded member. Her shaft, despite stiffening, seems to shrink, gradually losing size until it is a mere five inches long and two inches wide. The greatly reduced member is practically covered in nodules, with the thickest concentration at the head and the root.");
	output("\n\nGripping her kaithrit cock with one hand, Atha blushes a bit as her thumb teases the head. <i>“Well... this is it I guess,”</i> she says with a petulant lament. Her tails curl around her legs as she takes stock of her new shaft. <i>“The protuberances aren’t as sensitive as I’d have expected,”</i> she remarks, wiggling one with a fingertip. Running her hand up and down the organ, she gasps before composing her face into a slightly disappointed frown.");
	output("\n\n<i>“I mean, it’s okay, but I think they’re mostly there for your partner. Probably feels really great inside of a pussy, but just for jacking off? Ehhhh,”</i> She maintains her grumpy, sulking pout as she continues her delicate, caressing strokes. <i>“Really though, why so small? It’s not even... very... exciting...”</i> she trails off, losing her train of thought as her stroking becomes more aggressive, her other hand cupping and fondling her 3\" terran balls.");
	output("\n\n<i>“I don’t know if I can’t recommend t-this cock,”</i> she murmurs, reaching off screen and revealing a Humphard hardlight condom. Slipping the ring around her shaft and switching it on, a small flicker of faint pink light is the only indication that the holodom is active. Stroking the nub-covered phallus through the prophylactic, Atha scoots back in her chair, lifting her long legs to brace the heels of her feet on the edge of the seat.");
	processTime(5);
	pc.lust(8);
	clearMenu();
	addButton(0,"Next",letsFapKaithrit3);
}

public function letsFapKaithrit3():void
{
	clearOutput();
	showAtha("KAITHRIT");
	author("Adjatha");
	output("Her chin tucked down, body leaning back, the lower half of the camgirl’s face is hidden behind the mountainous breasts beneath her shirt and vest. <i>“Dumb kitty cock,”</i> she mumbles, stroking her bulging cumvein through the hardlight sheath. Her tails flick and twitch behind her, rising up and curling around the left side of her chair in excitement. Using her tits to muffle the increasing frequency of her gasps and moans, Atha dutifully pumps at her feline phallus, only barely maintaining the pretense of disinterest.");
	output("\n\nScrunching her legs up tighter until her knees press against her tits, the camgirl nearly balls herself up as she paws her way towards climax. Her tails whip back and forth in a vigorous, slashing motion, her cat-slit pupils dilating with each passing moment. <i>“Ah! It’s hard- ah!- hard to stroke this- oh!- dick. Hmmm... fuuuuck... all the stupid barbs get in the way,”</i> she whines, her hand having no apparent trouble despite her complaints.");
	output("\n\nWith a sharp intake of breath, Atha’s knees spread wide, smooth bronze skin framing the twitching kaithrit member that glows slightly with every moaning squeeze. The shaft widens, its nubs stiffening and bristling outward, swelling to 3\" thick in anticipation for her imminent orgasm. <i>“Stupid caaaaaaaaats!”</i> she wails as the camgirl climaxes, the pink light around her shaft flickering brightly as load after load spurts into the holodom. Atha’s toes curl with the intensity of her orgasm, both hands stroking the flaring bumps of her cock, with intense delight, her grumpy demeanor completely abandoned.");
	output("\n\nHer tails curl around to encircle her breasts through the white dress shirt, squeezing and fondling as her hands focus entirely on the spasming hose filling the growing bubble of spunk-filled hardlight. Her ears flatten, the camgirl’s whole body rocking with her milking motions so hard that her chair begins squeaking in protest. Atha leans forward and softly bites one of her own fluffy tails to hush her frantic moaning.");
	processTime(4);
	pc.lust(14);
	clearMenu();
	addButton(0,"Next",letsFapKaithrit4);
}

public function letsFapKaithrit4():void
{
	clearOutput();
	showAtha("KAITHRIT");
	author("Adjatha");
	output("When, at last, her orgasm subsides, a hardlight bubble nearly the size of a melon dangles from her bobbing member, its liquid contents sloshing audibly. Remembering herself, Atha glances up at the camera, trying to regain some measure of composure. She slides her feet off the chair and takes a more normal sitting position, straightening her tie and adjusting her glasses. <i>“Hrmprph,”</i> she starts, before realizing she’s still got a tail in her mouth. She spits it out with a blush and runs a hand through her wild, tangled hair, smoothing her feline ears as she does so.");
	output("\n\n<i>“As I was saying,”</i> she starts again, <i>“the kaithrit cock is probably great for sex with a partner, but by yourself, it’s just not as good as a good ole terran dick.”</i> She heaves a deep sigh of relief, wiping a bit of sweat from her brow, tapping the small jet set into her forehead thoughtfully. <i>“Oh yeah, there was one other thing,”</i> she remembers. <i>“The whole reason why I was using this holodom! ZeroMinus was kind enough to send me the Nepeta for this review and asked that I send him back the cum from the review.”</i> She carefully slides the humming ring off of her cock and hits another button on it, sealing the gap. Hoisting the bloated bubble of pink light in one hand, she shrugs. <i>“I guess fair’s fair. Sorry ZeroMinus, for the negative review, but hopefully this will cheer you up!”</i>");
	output("\n\nReaching off-screen, Atha produces a medical fluid storage cylinder, which she drops the bulging condom into. Sealing it with a pressurized hiss, she sets the return gift to one side. <i>“One of my friends works at a fertility clinic, and she borrowed a few of these for me,”</i> she explains with a wink. <i>“That’s it for this week’s show, ‘Net! Thanks for watching and my apologies to any Kaithrit viewers. I’m sure you are sexy beasts, but your dicks just aren’t for me,”</i> she asserts, a slight smile on her face, her tails languidly lashing back and forth.");
	output("\n\n<i>“See you guys next week! Don’t forget to Love, Comment, and Support!”</i> The recording switches off, the orange Champeon promotion flickering in its place. Would you like to learn more?");
	processTime(6);
	pc.lust(10);
	champeonOrOffMenu();
}

//Let’s Fap - Zil
public function letsFapZil():void
{
	clearOutput();
	showAtha("ZIL");
	output("The recording flicks on, showing Atha at her custom station, the bronze-skinned camgirl prim and pleased with a rosy cheeked smile. <i>“Hi ‘Net, it’s Atha! I sure hope you guys are having a great day, ‘cause mine is just awesome. You’ll never guess what I got. Not in a decillion years,”</i> she teases, her head cocked slightly to one side. Sitting on the edge of her chair, fingertips drumming on her desk, she patiently waits for a beat before tittering with delight. <i>“Zil rations!”</i> she blurts out, hands balled into tiny, elated fists.");
	output("\n\nWith a deep breath that threatens to pop the top button on her vest, she calms herself a bit. <i>“Okay, so for those of you who haven’t been following the Planet Rush, one of the new planets is called... M’henga? Mhen’gha? Sorry if I’m mispronouncing this... Mhen’ga? Anyway, it’s this really cool temperate world filled with lush jungles and all kinds of neat wildlife. The primary population consists of these folks called ‘zil,’ who apparently resemble bees found on Terra.”</i>");
	output("\n\nAtha adjusts her half-moon glasses and seems ready to deliver an entire lecture on the planetary politics of Mhen’ga. As she talks, however, one of her hands slips under the desk and slowly begins to move back and forth. The camgirl doesn’t seem to notice the motion and continues her discussion. <i>“An awesome viewer named TinyBee73 sent me several zil rations, which I wanted to show off on this week’s show.”</i> Reaching offscreen with her free hand, she produces a handful of small, orange tubes. Picking one up and holding it sideways, you can see that it’s a thin, jellied paste that has been affixed to a sticky plastic coating and rolled up for transit.");
	output("\n\nUnder the desk, Atha’s hand seems to be moving more aggressively, while a small trickle of sweat leaks down the side of her face. <i>“These rations are made from mashing and blending local fruits and nectars, then drying them for long term storage. Apparently the locals eat them all the time, but for everybody else they can cause some major digestive problems- unless treated properly for terran consumption.”</i> A small shiver races through the camgirl’s body, but she smiles obliviously.");
	output("\n\n<i>“I had one earlier,”</i> she remarks off-handedly, <i>“and I’ve got to say, pretty delicious! They’re so exotic, it was a bit off-putting at first, but after you’ve had a few bites, you get used to the sugar rush. Kind of has an aftertaste of honey, too.”</i> She licks her lips, pressing her fingertips to the moisture with a deep sigh of contentment.");
	output("\n\n<i>“Ah hah, well thanks for indulging me, ‘Net. I just wanted to geek out about the super cool gift before getting to this week’s show. Now, for dicks this week, I was thinking we’d go with... huh?”</i> The camgirl glances down, noticing finally that she’s been stroking her cock under her desk for the last ten minutes. <i>“W-what? Woah, when did that happen?”</i> Scooting her chair back, Atha shows the camera that her skirt has been pulled to one side, her dusky thighs framing a 6\" penis. This would hardly be cause for surprise - for Atha at least - except that the otherwise terran-like shaft seems wrapped in copious folds of foreskin that start at her tip and go all the way down to her root, like a baggy sweater.");
	output("\n\n<i>“Oh, geez! That’s new. Was that from eating the zil ration?”</i> Her fingers stroke up and down the semi-firm surface, the almost fluid skin yielding to her touch. <i>“Hey, that’s pretty fun,”</i> she chirps with a grin. <i>“It’s like my cock comes pre-lubricated all the time.”</i> She pumps a little harder, fingers sinking into the pliant sheath as her member stiffens and swells. <i>“Oooh, that’s great. Geez, is it hot in here?”</i> She tugs at her collar while sweat beads on her brow. She loosens her tie with one hand while unbuttoning her vest. She can’t seem to keep her hands off her zil cock for long, though, because she is only half way through unbuttoning her shirt when she gives up and locks both palms around the rumpled member once more.");
	output("\n\nPumping slowly with one hand while the other rubs the tiny crest of her cockhead peeking from under the smothering creases of her foreskin. She sniffs, sweat now rolling down the voluminous cleavage of her partially exposed chest. <i>“Do I smell honey?”</i> she asks with a drunken murmur. Atha leans forward, her long hair falling in a concealing curtain around her head as she buries her face just above her crotch. She holds this position for a few minutes, sniffing gently at first, then in deep, sharp inhales to take in as much as she can. When the brown girl straightens up again, lifting her head, a small blob of amber pre-cum is dripping from her nose.");
	output("\n\n<i>“He-he-heh,”</i> she giggles woozily, <i>“that’s pretty potent stuff! Eeeeee, I feel funny,”</i> she remarks faintly, her eyes unfocused and her chest rising and falling in a deep, slow rhythm that reveals the chocolate nipples just beneath her half-opened shirt. <i>“I kinda want more,”</i> she pants, her face curling into a silly, drugged grin. Leaning back, she begins jacking off once more. With protracted, lingering strokes, she lifts the ample furrows of her pleated member to bury the honey-brimming tip only to reverse the motion and pull back the wrinkled ridges to her base, exposing the shiny copper crest of her cockhead. Long and slow, she pumps away, her need evident from the twitches running through her thighs and cheeks, but too drugged to increase her caresses from the languorous, placid pace.");
	output("\n\nWhen, at last, she does begin to cum, her body freezes right at the peak of her soothing stroke, the full, meaty folds of her foreskin drawn upward to squeeze the hidden peak of her spasming organ. She lurches forward with a gasp, beads of honey blobbing upward from the buried cumslit. Too overwhelmed by her climax, the girl can’t release her hold, the full force of her jetting discharge impeded by the obstructing foreskin. Thick, glistening spoo bubbles upward, in half-hearted spurts that pool and dribble down the soft, smothering sheath. A few thin streams manage enough force to climb a few inches into the air before splattering down on her shuddering hands, coating her fingers in golden nectar that dribbles and drools until her entire lap is a messy, sticky basin of cummy honey.");
	output("\n\nGasping and panting, Atha slowly releases her deathgrip on her zil cock, the freed member spurting a few more amber ropes before flopping to one side, settling into the gooey lake of jizz pooling between her thighs. <i>“W- what happened?”</i> she murmurs groggily, her expression still dazed and light-headed. She dips a finger into the warm cum pond and slips it into her mouth with a tentative motion. Her eyes light up. <i>“Woah! Actual honey? What was that zil ration treated with?”</i> She smiles and gathers more spunk between her fingers, rising it to her mouth and slurping the sticky slime with relish. <i>“Oh, this is good,”</i> she mutters between gulps, the sugars apparently helping her shake off the narcotic scent of her bee dick.");
	output("\n\nRemembering that she’s on camera, Atha pauses in her gluttonous spree and offers an awkward, embarrassed smile, cum dripping down her chin. <i>“Oh, um, right. The review? Yeah. So zil dicks are awesome. The foreskin is crazy sensitive but so supple you just want to squeeze it between your fingers all day. Plus, I think it gives off some kind of pheromone. I don’t know if they all do that, but getting a big ole dose is sure to leave you giggling and horny. Finally, I don’t know if the zil actually cum honey, or if TinyBee73 was havin’ a little fun at my expense, but honey cum? Friggin’ brilliant idea! If you’re going to Mhen’ga, be sure to have some fun with the zil and try out a zil cock of your own!”</i>");
	output("\n\nMessy, sticky, and buzzed on her own golden cream, the camgirl flashes a wide, ditzy smile and pokes the camera with one finger, leaving a honey jizz blob on the glass. <i>“Don’t forget to Love, Comment, and Support!”</i> Her job done, the camgirl goes back to spooning up handfuls of spunk and dripping it into her mouth, tongue lapping appreciatively at each fingertip. The zil cock in her lap twitches and starts stiffening as she drinks down gulp upon gulp of hot jizz, but the feed cuts off before she serves up a second helping. A little orange message box pops up asking if you’d like to become a Champeon and support Atha’s cock reviews. Would you like to learn more?");
	//output("\n\n[Champeon] [Turn Off]");
	processTime(28);
	pc.lust(54);
	champeonOrOffMenu();
}
