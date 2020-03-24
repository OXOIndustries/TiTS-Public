//SKoW (SomeKindofWizard)'s self-insert write-pup.

/*	MET_PERDITA			1 = met
						2 = met after she comes back with new eyes.
	PERDITA_CHAMPEON	Day you pledged support
	perditaPayouts()	How much you've paid her, total.

*/
public function perditaAvailable():Boolean
{
	return (!pc.hasStatusEffect("PERDITA_MEETING_CD"));
}
//Description in Kally’s Bar
//Add onto the room description for Kally’s Bar
public function perditaBonus(button:int):void
{
	if(!perditaAvailable()) {}
	else if(flags["MET_PERDITA"] == undefined)
	{
		output("\n\nAnd perched on a stool is a new face. A rather pale-looking half Ausar with dark brown hair and a small stack of empty glasses.");
		addButton(button,"Half-Ausar",perditaMeeting);
	}
	//She disappears for a week after you’ve met her once, this would be at least a week later
	else
	{
		output("\n\nPerdita the Half-Ausar also draws your attention, with an idly-wagging tail as she drains another tumbler of whisky.");
		addButton(button,"Perdita",perditaIsBackForNormalInteractions);
	}
}

public function processPerditaPayments(deltaT:int, doOut:Boolean, totalDays:int):void
{
	if(flags["PERDITA_CHAMPEON"] == undefined) return;
	var pledgeDay:Number = flags["PERDITA_CHAMPEON"];
	var dayDiff:Number = (days - pledgeDay);
	if(dayDiff % 30 == 0 && dayDiff > 29)
	{
		var loots:Array = perditaLootsAvailable();
		if(loots.length > 0) eventQueue.push(getPerditaStory);
		else
		{
			if(pc.credits >= 100) AddLogEvent("A notification comes through that your monthly 100 credit Champeon pledge for Perdita was processed successfully." + (loots.length > 0 ? " Attached is a download code for one of her stories!":""), "passive", deltaT);
			else AddLogEvent("A notification arrives to inform you that your 100 credit per month Champeon pledge was deducted from your credit account, putting you <b>into debt</b>.", "passive", deltaT);
			pc.credits -= 100;
			perditaPayouts(100);
		}
		
	}
}
public function getPerditaStory():void
{
	clearOutput();
	showName("CHAMPEON\nBILL/REWARD");
	var loots:Array = perditaLootsAvailable();
	if(pc.credits >= 100) output("A notification comes through that your monthly 100 credit Champeon pledge for Perdita was processed successfully." + (loots.length > 0 ? " Attached is a download code for one of her stories!":""));
	else output("A notification arrives to inform you that your 100 credit per month Champeon pledge was deducted from your credit account, putting you <b>into debt</b>." + (loots.length > 0 ? " At least it came with a story download code...":""));
	output("\n\n");
	pc.credits -= 100;
	perditaPayouts(100);
	quickLoot(loots[rand(loots.length)]);
}

public function perditaLootsAvailable():Array
{
	var loots:Array = [];
	if(!CodexManager.entryUnlocked("Go Jackals!")) loots.push(new GoJackals());
	if(!CodexManager.entryUnlocked("Hellhound Gangbang")) loots.push(new HellhoundGangbang());
	if(!CodexManager.entryUnlocked("Leather Club")) loots.push(new LeatherClub());
	if(!CodexManager.entryUnlocked("Monster Threesome!")) loots.push(new MonsterThreesome());
	if(!CodexManager.entryUnlocked("My First Story")) loots.push(new MyFirstStory());
	if(!CodexManager.entryUnlocked("My Romantic Encounter")) loots.push(new MyRomanticEncounter());
	if(!CodexManager.entryUnlocked("Succubus in Love")) loots.push(new SuccubusInLove());
	if(!CodexManager.entryUnlocked("Wolf Breeding")) loots.push(new WolfBreeding());
	if(!CodexManager.entryUnlocked("Worshipping The Anubis Queen")) loots.push(new WorshippingTheAnubisQueen());
	return loots;
}

public function showPerdita(nude:Boolean = false):void
{
	var tanString:String = "";
	if(flags["MET_PERDITA"] == 2) tanString = "_TAN";
	showBust("PERDITA" + tanString + (nude ? "_NUDE":""));
	showName("\nPERDITA");
}
//Talk First Time
//First Time you select [Perdita]
public function perditaMeeting(back:Boolean = false):void 
{
	clearOutput();
	showPerdita();
	author("SomeKindofWizard");
	if(back)
	{
		output("What else would you like to do with Perdita?");
	}
	else
	{
		output("You approach the pup, and she gently pushes aside a few empty glasses to make space for you at her table. A smiling Kally saunters over, placing down a drink for her before winking at you. <i>“Oh! Uh, hey there. Name’s Perdita.”</i> She says, rubbing her face a few times.");
		if(flags["MET_PERDITA"] == undefined) flags["MET_PERDITA"] = 1;
	}
	//[Appearance] [About] 
	//[Champeon] 
	//Greyed ‘til About [Buy Smut]
	//Greyed ‘til About [Support]
	//Greyed ‘til About [Flirt]
	//Greyed ‘til About, She promises to resume this next week
	processTime(1);
	perdita1stTimeMeatingMenu();
}

public function perdita1stTimeMeatingMenu():void
{
	clearMenu();
	addButton(0,"Appearance",perditaAppearance,undefined,"Appearance","How’s she Lookin’?");
	addButton(1,"About",learnAboutPerdita,undefined,"About","Learn about Perdita.");
	if(flags["PERDITA_ABOUT"] == undefined) 
	{
		addDisabledButton(2,"???","???","You don’t know her well enough for this.");
		addDisabledButton(3,"???","???","You don’t know her well enough for this.");
		addDisabledButton(4,"???","???","You don’t know her well enough for this.");
		addDisabledButton(5,"???","???","You don’t know her well enough for this.");
	}
	else 
	{
		addButton(2,"Champeon",champeonPerditaTalk,undefined,"Champeon","Money every month?");
		addButton(3,"Buy Smut",buySmutFromPerditles,undefined,"Buy Smut","Does she sell-direct?");
		addButton(4,"Support",supportThatBroadOnPatreon,undefined,"Support","Support her on Champeon.");
		addButton(5,"Flirt",flirtWivPerditles,undefined,"Flirt","Perhaps she’s interested in a tumble?");
	}
	addButton(14,"Leave",leavePerditaBeforeFlirtingFirstTime);
}

//[Appearance]
//How’s she Lookin’?
public function perditaAppearance():void
{
	clearOutput();
	showPerdita();
	author("SomeKindofWizard");
	output("She’s a cute half-ausar; probably about six foot tall not including the near-foot of wolf-ear height. Her brown hair is tied up in a ponytail that passes her shoulder, with scruffy bangs that rest just above pale blue eyes and soft-looking feminine features. She also seems to have the kind of skin that looks like it’s lost a fair amount of tan. Probably the result of spending a long time cooped up in a ship. It’s impossible to miss the huge fluffy tail that idly wags from side-to-side as she’s observed on the bar-stool, poking out from a tail-hole cut into some tight black jeans.");
	output("\n\nOf course it’s impossible to miss her other assets; those jeans are holding in a big bouncy-looking ass and a thick bulge. As for her top, she’s wearing a matching black cropped jacket over a pale pink button-up shirt whose buttons have failed to restrain a plush DD-Cup chest. You half expect her to give you the ‘Eyes up here’ routine but instead she proudly stretches for you, revealing perky nipples that push through whatever bra it is that she’s wearing.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",perditaMeeting,true);
}

//[About]
//Learn about Perdita
public function learnAboutPerdita():void
{
	clearOutput();
	showPerdita();
	flags["PERDITA_ABOUT"] = 1;
	author("SomeKindofWizard");
	output("<i>“My name’s [pc.name] Steele, pleasure.”</i> You accept the spot she’s cleared for you amongst her various empties, ordering a drink for yourself as you do so. Perdita necks a mouthful of her own; it looks like a simple whisky on the rocks...");
	output("\n\nStill she doesn’t look <i>entirely</i> blasted. <i>“Something about me draw you in? Perhaps you’re just looking to kill some time.”</i> She pauses for a moment, pulling out a palm-sized looking datapad. It chirps at her and she smiles brightly, tail wagging. <i>“Sorry, got mail. Anyway, please! Tell me about yourself [pc.name]. I’ve got enough drink in me to actually manage being sociable.”</i>");
	output("\n\nAlthough Perdita says as much, she has a hard time keeping eye contact with you while you’re talking. ");
	if(pc.biggestTitSize() >= 4 || pc.lipRating() >= 4) output("Indeed, plenty of the time her attention trails down to your [pc.breasts] or [pc.lips]. ");
	output("You recount some of your exploits (including the raunchier few) before you manage to turn the conversation in her direction.");
	output("\n\n<i>“Pfft, shit. I’m no galactic sex-tourist on a quest for money and danger. I don’t think you’d find me interesting at all.”</i> She frowns, attempting to wave the matter off even as fresh drinks are placed down. " + (flags["MET_KALLY"] != undefined ? "Kally":"The kui-tan bartender") + " grins wickedly at the both of you before giving the buxom half-pup a skritch between the ears.");
	output("\n\n<i>“You be nice to her, [pc.name]. She’s been gone a long while!”</i> The curvy ‘nuki insists with a wicked grin.");
	output("\n\nRolling her booze-glazed eyes Perdita takes a fresh sip. <i>“I’m a ship engineer. My last contract was with a bunch of exploration ships over a planet with a practically-dead atmosphere full of people who hid underground. It was an awful, awful job with lots of downtime...”</i>");
	output("\n\n<i>“At least for a while. There was some drama with our sister ship nearly getting ripped out of orbit and dying, and then some Rushers turned up. Then some pirates turned up chasing after those Rushers.”</i> She pauses, shrugging and draining her glass <i>“and then there was a diplomatic incident when a bunch of Rushers made first contact with a paradise planet full of sexy floating mermaid people.”</i>");
	output("\n\nYou stop her, holding up a hand. <i>“You just glossed over a bunch of details.”</i>");
	output("\n\nPerdita fidgets and clears her throat. <i>“Loooook, there’s a lot I’m not allowed to say. What I can say is that rich people are already visiting there riiight now. Kind of surprised you haven’t yet, what with you being a Steele.”</i>");
	output("\n\nThis time you’re the one to shrug; it’s not hard to create some decent credit turnover, but you don’t own Steele Tech yet.");
	output("\n\n<i>“Right, sorry. Your cousin sounds like a fuckin’ dick by the way. But yeah, I spent a long time trapped doing nothing, then there was a lot of excitement I can’t talk about, and now I’m here. Hence not wanting to go into it.”</i>");
	output("\n\n<i>“My bad.”</i> You say, by way of simple apology. " + (flags["MET_KALLY"] != undefined ? "Kally":"The thick barkeep") + "’s peering at you across the bar, hand-motioning a quick ‘eyes on you’ that you return with an entirely-too-innocent smile.");
	output("\n\n<i>“It’s cool. Let’s just say I’m done working big-organization crank jobs now though. I might take independant ship repair stuff, but I’ve been working on something far more fun!”</i> Perdita’s body-language goes from one of awkward shifting on the spot to an open-faced grin and a wagging tail. <i>“I write porn!”</i>");
	output("\n\n<i>“Huh.”</i> Not what you’d expected.");
	output("\n\n<i>“Yup! Turns out despite all the oversexed cunt-pumping galactic teledildonics and simple sweet sluttery people still love to give themselves the five-knuckle-shuffle to the written word.”</i>");
	output("\n\nYou’re certainly no stranger to the pornographic arts, but definitely more as a consumer... or actor.");
	output("\n\nPerdita giggles, pulling out her little data-pad again. <i>“Well, I can’t say I get up to quite so much miscellaneous strange... but yeah, I write porn! And then people pay for access to the stuff I write by giving me money on Champeon. Y’know the crowd-funding thing, right?”</i>");
	if(silly) output("\n\nKnow it? Fuck, this conversation just suddenly became so meta that you’re about to climb out of the fourth wall.");
	else output("\n\nYes, you’ve come across it before. Seems hard to imagine people just pay for descriptions instead of visuals.");
	output(" <i>“Hmmm... maybe I should get an artist to draw some of the smut I write. Thoughts for another day!”</i>");
	output("\n\n<i>“Sadly I think you’ve basically tapped me out on conversation topics. I was a ship engineer, now I write about dicks’n’stuff for a living.”</i>");
	processTime(15);
	clearMenu();
	//[Next] //back to talk first time menu
	addButton(0,"Next",perditaMeeting,true);
}

//[Champeon]
//Money every month?
public function champeonPerditaTalk():void
{
	clearOutput();
	showPerdita();
	author("SomeKindofWizard");
	if(flags["PERDITA_CHAMPEON"] == undefined)
	{
		output("So what if <i>you</i> wanted to give her money for smut-writes?");
		output("\n\nPerdita blinks a few times before her oversized fluffy tail begins wagging a storm again. She nearly baps another patron in the face, tucking back apologetically a moment later. <i>“A-hem. Uh, I wouldn’t say no to an offer like that! If you’re willing to support me every month you’ll get a new one until you’re all caught up with the library.”</i>");
		output("\n\n<i>“And what kind of porn do you write?”</i>");
		output("\n\nThe half-ausar folds her arms beneath her chest, leaning back proudly. <i>“Just about all of it! Though I definitely prefer girls with big ol’ dicks, and monster girls. Ooooh... gets me all a-wriggle. But I get that it might not be to your specific tastes.”</i>");
		processTime(3);
		clearMenu();
		//[Support] //Hot damn, a hundred credits a month? What a steal. [Next] //back to talk first time menu
		addButton(0,"Next",perditaMeeting,true);
		addButton(1,"Support",supportThatBroadOnPatreon,undefined,"Support","Hot damn, a hundred credits a month? What a steal.");
	}
	else
	{
		output("<i>“Thanks for the support!”</i> Perdita raises a glass in your honor.");
		clearMenu();
		addButton(0,"Next",perditaMeeting,true);
	}
}

//[Support]
//Support her on Champeon
public function supportThatBroadOnPatreon(repeats:Boolean = false):void
{
	clearOutput();
	showPerdita();
	if(flags["PERDITA_CHAMPEON"] == undefined)
	{
		output("Judging by what it says on the website, supporting her costs one hundred credits a month.");
		clearMenu();
		if(!repeats) addButton(4,"Back",perditaMeeting,true);
		else addButton(0,"Next",perditaIsBackForNormalInteractions,true);
		if(pc.credits >= 100) addButton(0,"Support",supportThatBroadOnPatreon2,repeats,"Support","Spend one hundred credits a month to support Perdita.");
		else addDisabledButton(0,"Support","Support","You can’t afford to support Perdita.");
	}
	//Already supporting
	else
	{
		output("You ask Perdita about your current support for her, and she clears her throat nervously.");
		output("\n\n<i>“Considering stopping? Th-that’s okay. You’ve already helped me out more than you know.”</i>");
		//[End Support] //No more monthly payments! [[Nah]] //Awooooo! :3
		clearMenu();
		addButton(0,"End Support",endSupportForPerdita,undefined,"End Support","No more monthly payments!");
		if(repeats) addButton(1,"Nah",perditaIsBackForNormalInteractions,true,"Nah","Awoooo! :3");
		else addButton(4,"Back",perditaMeeting,true);
	}
}
public function endSupportForPerdita():void
{
	clearOutput();
	showPerdita();
	author("Fenoxo");
	output("You discretely end your recurring payments, not that you can hide that fact from Perdita.");
	flags["PERDITA_CHAMPEON"] = undefined;
	clearMenu();
	if(flags["MET_PERDITA"] == 2) addButton(0,"Next",perditaIsBackForNormalInteractions,true);
	else addButton(4,"Back",perditaMeeting,true);
}

public function supportThatBroadOnPatreon2(repeats:Boolean = false):void
{
	clearOutput();
	showPerdita();
	author("SomeKindofWizard");
	output("Alright, you’re in. It only takes a few clicks on your Codex (which she oogles with an intense ‘oooh~’) and you’re one of Perdita’s Champeon Supporters. There’s a ping from your codex as the very first of her stories is delivered.");
	output("\n\nShe grins nervously, twiddling her fingers. <i>“I hope you like it.”</i>");
	processTime(3);
	flags["PERDITA_CHAMPEON"] = days;
	perditaPayouts(100);
	pc.credits -= 100;
	//[Next] //back to talk first time menu
	clearMenu();
	if(repeats) addButton(0,"Next",perditaIsBackForNormalInteractions,true);
	else addButton(0,"Next",perditaMeeting,true);
}

public function perditaPayouts(arg:Number = 0):Number
{
	if(flags["PERDITA_PAYOUTS"] == undefined) flags["PERDITA_PAYOUTS"] = 0;
	flags["PERDITA_PAYOUTS"] += arg;
	return flags["PERDITA_PAYOUTS"];
}

//[Buy Smut]
//Does she sell-direct?
public function buySmutFromPerditles():void
{
	clearOutput();
	shopkeep = new Perdita();
	if(flags["PERDITA_CHAMPEON"] != undefined) shopkeep.sellMarkup = 0.01;
	buyItem();
	author("SomeKindofWizard");
}

//Fen note: Didnt wanna futz with the effort to add this...
//output("\n\n<i>“I hope you like it [pc.name]! They’re a lot of fun to write... but being able to afford booze is even funner.”</i>");

//[Next] //back to talk first time menu

//[Flirt]
//Perhaps she’s interested in a tumble?
public function flirtWivPerditles():void
{
	clearOutput();
	showPerdita();
	author("SomeKindofWizard");
	output("You lean across the little bar table, grinning to yourself. Perdita blinks and leans back a little, tilting her head before you speak up.");
	if(pc.isBimbo()) output(" <i>“Hey! Do you want to fuck?”</i>");
	else if(pc.isBro()) output(" <i>“Want some fuck?”</i>");
	else output(" <i>“Perhaps you’d be interested in a little personal time with me?”</i>");
	output("\n\nPerdita might as well have been shocked in the butthole for reaction, going stock on end and rocking backwards so hard in her stool she nearly falls out of it. <i>“W-what? Me?”</i>");
	output("\n\nHow can she not be aware that she’s hot? At your plaintive stare she starts to squirm and blush. <i>“I– okay you’re hot and the answer is yes, but surely you can understand why I’m stunned? You’re literally a star-hopping sex-beast compared to me.”</i>");
	output("\n\nWhen you push the matter further she sighs deeply <i>“Okay, I’d love to. But I’m headed out in an hour or so and I’m going to be away for like... a week? I can’t afford to be late.”</i>");
	output("\n\nShe isn’t going to fly drunk, is she?");
	output("\n\nAs if to answer your unspoken thought she grins and tail-wags again. <i>“Don’t sweat it, autopilot was invented for a reason.”</i>");
	output("\n\nYou sigh and relent for now; it’s probably not worth pushing her too far for just a quicky.");
	processTime(5);
	if(!pc.hasStatusEffect("PERDITA_MEETING_CD")) pc.createStatusEffect("PERDITA_MEETING_CD");
	pc.setStatusMinutes("PERDITA_MEETING_CD",7*24*60);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function leavePerditaBeforeFlirtingFirstTime():void
{
	clearOutput();
	showPerdita();
	author("SKoW & Fen");
	output("You let her know that you’ve got to head out.");
	output("<i>“I’m headed out in an hour or so and I’m going to be away for like... a week? I can’t afford to be late.”</i> She grins and tail-wags. <i>“Don’t sweat it. You can hit me up later, if you like.”</i>");
	if(!pc.hasStatusEffect("PERDITA_MEETING_CD")) pc.createStatusEffect("PERDITA_MEETING_CD");
	pc.setStatusMinutes("PERDITA_MEETING_CD",7*24*60);
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Talk Repeat
//After a week has passed, Perdita is back and ready for action, a lil’ tanned and with fancy eyes.
public function perditaIsBackForNormalInteractions(back:Boolean = false):void
{
	clearOutput();
	showPerdita();
	author("SomeKindofWizard");
	if(back) output("Anything else?");
	//First Time
	else if(flags["MET_PERDITA"] == 1)
	{
		output("On top of It also seems that she had some genetic work done; her eyes are a gently-glowing lavender, although somewhat fuzzy thanks to the stack of empty glasses lined up on the table. After fetching a drink of your own (and flashing a smile at the bouncy, buxom bartender) you make your way over. <i>“Hey, Steele! Good to see you again.”</i> she says as you settle onto a barstool opposite. <i>“How have you been?”</i>");
		output("\n\nWith a stretch, you recount some of your exploits, allowing the drinks to flow before turning the conversation on her. <i>“I can’t help but notice the freckles and the eyes, pick up something nice?”</i>");
		output("\n\nPerdita smiles, tail wagging again as she knocks back the last of her drink, pausing to stretch until everything clicks. <i>“Yup, I went on holiday! Hung out with some family on Ausaril, spent some time at the beach. My mother paid for some eyes after I told her I was kind of going blind. I decided on a fancy color and some glow at the same time.”</i>");
		output("\n\n<i>“You were going blind?”</i> you ask, frowning.");
		output("\n\nPerdita shrugs helplessly, pausing to look at a beeping datapad before slipping it away. <i>“Yeah, I mean – not quickly mind you – but I spend a lot of time looking at little typed words. You can imagine for a writer that gets a bit head-achey.”</i> she smiles fondly. <i>“Mum’s a sweetie though! She knew I’d been angling for some cool eyes or something for a while, it’s waaay cheaper to get that done at the same time as getting an actual medical fix-up. All I had to do was drop in a couple hundred extra credits, and voila.”</i>");
		output("\n\nThe half-Ausar leans in, giving you a good look (and a faceful of whisky-breath) before settling back. Very cool indeed, you agree, opting not to mention your more... extensive alterations.");
		processTime(5);
		flags["MET_PERDITA"] = 2;
		showPerdita();
		//[Appearance] [About] [Champeon] [Buy Smut] [Support] [Flirt]
	}
	else
	{
		output("Perdita’s already making space for you when you settle down into the barstool opposite, pausing only to wave and smile over her shoulder. When " + (flags["MET_KALLY"] == undefined ? "the chubby tanuki bartender":"Kally") + " turns up it’s with two tumblers of whisky, and a blown kiss for the both of you.");
		output("\n\n<i>“Hey Steele! How’s it going?”</i>");
		processTime(1);
		//[Appearance] [About] [Champeon] [Buy Smut] [Support] [Flirt]
	}
	perditaMenu();
}

public function perditaMenu():void
{
	clearMenu();
	addButton(0,"Appearance",howIsPerditaLooking,undefined,"Appearance","How’s she Lookin’?");
	addButton(1,"About",perditaAboutNumbah2,undefined,"About","Learn about Perdita.");
	
	if(flags["PERDITA_ABOUT"] == undefined) 
	{
		addDisabledButton(2,"???","???","You don’t know her well enough for this.");
		addDisabledButton(3,"???","???","You don’t know her well enough for this.");
		addDisabledButton(4,"???","???","You don’t know her well enough for this.");
		addDisabledButton(5,"???","???","You don’t know her well enough for this.");
	}
	else 
	{
		addButton(2,"Champeon",repeatPerditaChampeonTalk,undefined,"Champeon","Money every month?");
		addButton(3,"Buy Smut",buySmutFromPerditles,undefined,"Buy Smut","Does she sell-direct?");
		addButton(4,"Support",supportThatBroadOnPatreon,true,"Support","Support her on Champeon.");
		addButton(5,"Flirt",flirtWithPostVacayPerditles,undefined,"Flirt","Perhaps she’s interested in a tumble?");
	}
	addButton(14,"Leave",mainGameMenu);

}

//[Appearance]
//How’s she Lookin’?
public function howIsPerditaLooking():void
{
	clearOutput();
	showPerdita();
	output("She’s a cute half-ausar; probably about six foot tall not including the near-foot of wolf-ear height. Her brown hair is tied up in a ponytail that passes her shoulder, with scruffy bangs that rest just above lavender-colored eyes that glow faintly in the dark and soft-looking feminine features. Her skin is lusciously tanned now that she’s spent some time out of active ship-engineering duty. It’s impossible to miss the huge fluffy tail that idly wags from side-to-side as she’s observed on the bar-stool, poking out from a tail-hole cut into some tight black jeans.");
	output("\n\nOf course it’s impossible to miss her other assets; those jeans are holding in a big bouncy-looking ass and a thick bulge. As for her top, she’s wearing a matching black cropped jacket over a pale pink button-up shirt whose buttons have failed to restrain a plush DD-Cup chest. You half expect her to give you the ‘Eyes up here’ routine but instead she proudly stretches for you, revealing perky nipples that push through whatever bra it is that she’s wearing.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",perditaIsBackForNormalInteractions,true)
}

//[About]
//What has she been up to?
public function perditaAboutNumbah2():void
{
	clearOutput();
	showPerdita();
	author("SomeKindofWizard");
	flags["PERDITA_ABOUT"] = 1;
	output("<i>“Well’p! After my last engineering job I put more time into writing. Then was the holiday so I can actually see the things I’m writing properly...”</i> She smiles and tailwags, eyes pointedly glowing. <i>“I just write now! Or drink. Even better; I can do both. Right here.”</i>");
	output("\n\nShe ponders for a moment, sipping from her glass. <i>“Guess I’ve not been up to much else. Until the cash dries up I get to meet and see new people. I even met a reader here! I think. They were drunk and might have been mixing me up with a different person.”</i>");
	output("\n\nPerdita pushes you to update her on how you’ve been doing too, no doubt logging a number of your more lurid events for later writing.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",perditaIsBackForNormalInteractions,true);
}

//[Champeon]
//Money every month?
public function repeatPerditaChampeonTalk():void
{
	clearOutput();
	showPerdita();
	author("SomeKindofWizard");
	//Not a supporter yet
	if(flags["PERDITA_CHAMPEON"] == undefined)
	{
		output("So what if <i>you</i> wanted to give her money for smut-writes?");
		output("\n\nPerdita blinks a few times before her oversized fluffy tail begins wagging a storm again. She nearly baps another patron in the face, tucking back apologetically a moment later. <i>“A-hem. Uh, I wouldn’t say no to an offer like that! If you’re willing to support me every month you’ll get a new one until you’re all caught up with the library.”</i>");
		output("\n\n<i>“And what kind of porn do you write?”</i>");
		output("\n\nThe half-ausar folds her arms beneath her chest, leaning back proudly. <i>“Just about all of it! Though I definitely prefer girls with big ol’ dicks, and monster girls. Ooooh... gets me all a-wriggle. But I get that it might not be to your specific tastes.”</i>");
		//[Support] //Hot damn, a hundred credits a month? What a steal. [Next] //back to talk menu
		processTime(3);
		clearMenu();
		addButton(0,"Next",perditaIsBackForNormalInteractions,true);
		addButton(1,"Support",supportThatBroadOnPatreon,true,"Support","Hot damn, a hundred credits a month? What a steal.");
	}
	//Already a supporter
	else
	{
		output("How’s the Champeon business treating her?");
		output("\n\nPerdita smiles, tail wagging up a usual furious storm once again... to be fair you’re not sure it’s ever still. <i>“Super well actually! Like... really well. I’m only asking for a little, but so many people are putting in. It’s </i>almost<i> enough to have me consider quitting engineering forever.”</i> She pinches a finger and thumb together, <i>“almost.”</i>");
		output("\n\nThe half-ausar pauses a few moments later, grinning. <i>“I think the only problem is the amount of drink I’m putting away on a daily basis. I’ve had to move away from all the whisky and drink more of... Kally’s special brew.”</i>");
		output("\n\n...There are worse fates out there than limiting yourself to the squishy ‘nuki’s nutty beverage.");
		//[Next] //back to talk menu
		clearMenu();
		addButton(0,"Next",perditaIsBackForNormalInteractions,true);
	}
}

/*
output("\n\n[Buy Smut]");
output("\n\n//Try and get some shiny new porn");

output("\n\n<i>“Would you be willing to sell any of it directly?”</i> You ask, grinning when her eyes widen in surprise.");

output("\n\n<i>“U-uh, yes!”</i> Perdita announces, sitting up properly <i>“Just a warning though, sending out smut monthly is kind of an automated thing, so you’ll probably see them crop up again down the line.”</i>");

output("\n\nHer tail wags when she pulls out her tablet. <i>“Let me know if any of them interest you!”</i>");

output("\n\n//options to purchase, I’unno what credit costs are good.");

output("\n\nMy First Story");
output("\n\nLeather Club");
output("\n\nGo, Jackals!");
output("\n\nWolf Breeding");
output("\n\nWorshipping The Anubis Queen");
output("\n\nHellhound Gangbang");
output("\n\nSuccubus in Love");
output("\n\nMy Romantic Encounter");
output("\n\nMonster Threesome!");

output("\n\n<i>“I hope you enjoy them. There’re a few that’re definitely, uh... personal favorite.”</i> She says with a blush.");

output("\n\n[Next] //back to talk menu");
*/

//[Flirt]
//Perhaps she’s interested in a tumble?
public function flirtWithPostVacayPerditles():void
{
	clearOutput();
	showPerdita();
	author("SomeKindofWizard");
	output("You lean across the little bar table, grinning to yourself. Perdita blinks and leans back a little, tilting her head before you speak up.");
	if(pc.isBimbo()) output(" <i>“Hey! Do you want to fuck?”</i>");
	else if(pc.isBro()) output(" <i>“Want some fuck?”</i>");
	else output(" <i>“Perhaps you’d be interested in a little personal time with me?”</i>");
	output("\n\nPerdita’s face smile transforms into a bright – if somewhat drunk – smile, tail wagging away at its usual storm while she necks another of " + (flags["MET_KALLY"] != undefined ? "Kally":"this establishment") + "’s fine shots. <i>“Awww, a roll in the hay with little ol’ me?”</i> She folds her arms up beneath her bust until it’s threatening to escape from her shirt... in fact you’re pretty sure yet another button gives up on restraining it. It’s definitely an appreciable effect.");
	output("\n\n<i>“Alright then " + pc.mf("handsome","sweetie") + ", after we knock back one more of these. Okay?”</i> She gently taps a fingernail against the side of an empty shot glass. <i>“Oh, and should we smash in the sauna? I don’t know if you’ve noticed but it’s fucking incredible.”</i>");
	output("\n\nWell...");
	//[Fuck] //Drink up and fuck this pup 
	//[Get Fucked] //She’s got a thick ol’ dick, see if she can use it 
	//[Titfuck] //They’re practically begging for it 
	//[Get Titfucked] //You’ve got some cushion for the pushing yourself 
		//You need some bigger tits for this 
	//[Footjob] //No better job in a sauna 
	//[Body-shots] //Why stop at one? [Ice-Play] //Kally’s probably got an ice bucket you can borrow
	processTime(4);
	pc.changeLust(3);
	perditaSexMenu();
}

public function perditaSexMenu():void
{
	clearMenu();
	if (pc.hasCock() && pc.cockThatFits(2000) >= 0) addButton(0, "Fuck", penisRouter, [fuckPerditles, 2000, false, 0], "Fuck", "Drink up and fuck this pup.");
	else if (pc.hasCock()) addDisabledButton(0, "Fuck", "Fuck", "Perdita’s an adventurous slut-pupper, but even she has limits.");
	else addDisabledButton(0, "Fuck", "Fuck", "You need a phallus for this.");
	if (pc.hasGenitals()) addButton(1, "Ice Play", icePlayWivPerditles, undefined, "Ice Play", "Get cold to get hot.");
	else addDisabledButton(1, "Ice Play", "Ice Play", "You need genitals for this.");
	addButton(14, "Back", perditaIsBackForNormalInteractions, true);
}

//Sex
//Fuck
//Comes with variations for taur
public function fuckPerditles(x:int):void
{
	clearOutput();
	showPerdita(true);
	author("SomeKindofWizard");
	moveTo("CANADA7");
	output("With a " + (pc.mf("laugh","giggle")) + " you pluck up a shot glass and knock the nutty nut-beverage back. Perdita does the same, licking the inside of the glass out and up-ending it on the table. <i>“Stars that stuff’s fucking great.”</i> her cheeks are definitely a little flushed as she lifts herself out of the chair, before offering you a hand <i>“" + (pc.mf("Sir","M’lady")) + "?”</i>");
	output("\n\nSnorting, you accept and follow along. She all but pulls you along to the sauna, but you’re too busy enjoying the way she walks; even without having heels on she seems to do the most of the lifting with her ass, treating you to a delightful ass-sway accompanied by that always-wagging tail. The sliding door between bar and sauna rolls gently aside before washing the both of you in a backdraft of heat, and the moment it’s slid shut behind you all sounds of the raucous bar-talk is muted to practical silence. Instead there’s nothing but the gentle trickle of water interspersed by the occasional ‘tonk’ of bamboo fountains knocking against each other. Perdita takes a deep breath of the steamy air, stretching and slipping off her jacket.");
	output("\n\nThere’s a little space for coat hooks and boxes to ditch your belongings in, so while she’s busily undressing you strip off your own equipment. A variety of swimwear hangs on a rack beside the wooden clothes-bins... but you won’t be needing those. When you return your attention to Perdita, the horny pup’s only gotten her top off; it seems she’s stopped in order to admire your own form.");
	//muscular
	if(pc.tone > 66) output(" You give her a mighty flex, making sure she gets the full show.");
	else if(pc.tone < 33) output(" You grin and hug your softened curves, but she seems just as appreciative of a little paunch.");

	output("\n\n<i>“Mmmnf. Sorry for the holdup... just. Had to...”</i> She gulps and blushes, hurriedly squeezing out of the last of her own belongings. You take advantage of the opportunity to enjoy her own nude form; her bouncing breasts are just as shapely and squeezable when they’re not being restrained by a lacy low-cup black bra that matches a modest pair of black panties that she has to wriggle past her broad bum.");
	//first time
	if(flags["PERDITA_SEEN_NAKED"] == undefined) 
	{
		output(" You blink a few times in surprise at her lack of a cunt, even if there’s now a great many inches of knotted ausar-cock hanging free in the sweltering sauna air.");
		output(" <i>“It’s a good show watching a " + (pc.mf("stud","cutie")) + " like you undress, y’know?”</i>\n\nYou’re pretty sure you <i>do</i> know, considering the way she’s ass-up and grinning at you over her shoulder as her panties hit the floor. ");
		output("\n\n<b>Perdita is a dick-girl.</b> Do you wish to continue?");
		clearMenu();
		addButton(0,"Hell Yes",continueFuckingPerditaWithCock,x);
		addButton(1,"No Thanks",nopeOutOfPerditasDick);
		return;
	}
	else output(" She makes sure to shake her ass for you and grant you a good look at the way it jiggles before her ring winks enticingly at you. Her usual thick ausar-cock already drools pre and her trappy pouch hugs her tightly at the change in temperature.");
	output(" <i>“It’s a good show watching a " + (pc.mf("stud","cutie")) + " like you undress, y’know?”</i>\n\nYou’re pretty sure you <i>do</i> know, considering the way she’s ass-up and grinning at you over her shoulder as her panties hit the floor. ");
	perditaDickFuckingPart2(x);
}

public function continueFuckingPerditaWithCock(x:int):void
{
	clearOutput();
	showPerdita(true);
	author("SomeKindofWizard");
	flags["PERDITA_SEEN_NAKED"] = 1;
	output("After a moment to take in her attributes, you smile and carry on. ");
	perditaDickFuckingPart2(x);
}
public function nopeOutOfPerditasDick():void
{
	clearOutput();
	showPerdita();
	flags["PERDITA_SEEN_NAKED"] = -1;
	output("You put up your hand and pull away, explaining that you aren’t into girls with a little extra.");
	output("\n\nPerdita recoils as if struck broadside, her features narrowing from wide-open excitement to painfully guarded. Crossing her arms across her chest, she says one word: <i>“Fine.”</i>");
	clearMenu();
	addButton(0,"Next",move,"CANADA5");
}

public function perditaDickFuckingPart2(x:int):void
{
	output("She skips away when you approach however, leading you towards one of the larger baths. There are a few other people in various pools of water either relaxing, hungover, or enjoying similar pleasures of the flesh.");

	output("\n\n<i>“Mmm, this one. This one’s perfect [pc.name]...”</i> She dips a toe into the water and lifts it up; the liquid trickles from her in a way that reminds you somewhat of lube. Certainly not as thick, but there’s no doubt something similar in it to the kind of stuff they use in New Texas. Not a surprise, considering someone loaded to the gills on " + (flags["MET_KALLY"] != undefined ? "Kally":"the bar") + "’s special brew is going to be interested in only one kind of flesh-on-flesh collision. She slides gently into the water, moaning softly and shivering a little at the fresh heat-shock. You follow along with her " + (pc.isGoo() ? "(concentrating to make sure your gooey form doesn’t turn the pool into dissolved Steele) ":"") + "and let out a similar noise of satisfaction when the warmth sinks into your extremities.");
	output("\n\nThe half-ausar rolls her neck and stretches until she clicks before standing up in the sultry waters. Her hands are already latched onto her tits where she can pinch and tease her nipples, letting out a deeply appreciative moan for your enjoyment. The naturally lube-laden water has her hefty cups glistening in the light, even through the steam winding its way around her body like a lover’s arms. When she turns around it’s to show you the broadness of her heart-shaped ass, which she delivers a spank to that’s so loud your ears twitch and the flesh giggles appreciatively. Her hand doesn’t leave her broad rear alone though, digging in so that she can spread wide and reveal her winking ring. <i>“What do you think?”</i>");

	output("\n\nWhy bother with words when you can stand up? ");
	//taur
	if(pc.isTaur()) output("You work your way up on your multitude of [pc.legs], revealing " + (!pc.hasCocks() ? "a ":"") + "rock-hard, pre-drooling, lube-coated cock" + (pc.hasCocks() ? "s":"") + " and breathe in the scent of horny borker");
	else output("You stand up in the pool as well, revealing your [pc.cocks] to be just as ready and raring to go as her fuckable backdoor");
	output(". You’d swear the moderately-drunk pup has to wipe the drool from her mouth as she drinks you in, before she delivers a spank to her other cheek and folds herself over the bath so that only her legs are submerged before spreading that buttock wide too. You can just about make out her throbbing cock where it’s pinned between her soft flesh and the bathhouse floor, no doubt still freely dripping pre. Her tail (just about the only part of her lower half that remained un-submerged) begins to wag with anticipation. The bedroom eyes she’s casting over her shoulder are firmly locked on your [pc.cock " + x + "]." + (pc.isTaur() ? " She gulps a few times and makes sure to prop herself up in preparation for the extra weight you’ll be fucking her into the floor with.":"") + " <i>“Well " + pc.mf("handsome","sexy") + "? I’m oooh so fucking ready for you! Give me something to scream for!”</i>");
	output("\n\nHer tail’s wagging so hard you have to grip her cushy backside, squeezing in an attempt to hold her still so that you can properly " + (pc.isTaur() ? "mount her":"lay into her") + ". It’s obvious this pup-slut wants to go hard, but there’s still an order to these things. She gasps audibly as you pin her tail still and spit on your fingers before leaning down, shivering and moaning when you meet her plump ring. The heat coming off of her could put the water you’re knelt in to shame; it’s a surprise that steam doesn’t rise from your now saliva-coated fingers once you sink them into her asshole. Another obvious throbbing comes from her cock as you grind two [pc.fingers] around in her backdoor, and dribbling pre is milked out where it can join the water.");
	if(pc.cocks[x].cLength() < 7) output(" You may not be the largest, but a properly-prepared slut is a far more fuckable slut.");
	else if(pc.cocks[x].cLength() < 14) output(" It’s a good thing you stopped to prepare her, judging by the way she tries to practically crush your fingers with eager muscles.");
	else output(" Fuck, even with your ministrations preparing her it’s going to be a tough fit to fit your massive bitch-breaker of a cock in her.");
	output("\n\nYour thoughts are interrupted when your fingers bump against something even hotter than the rest of her sensitive walls... just how engorged is this girl’s cum-button? A testing press turns her gasping into one long sultry moan, and she grips the edge of the bath so hard her knuckles go white while her ears fold back as far as they can go. <i>“H-hhh... oh shit. Stupid sexy kui-tan nut-sauce, I’m already gonna blow.”</i> Perdita groans, waving her hips from side-to-side and grinding her prick against the sauna’s edge while her tight little pouch seems to grow heavier. <i>“Steele, please... I wanna cum with you inside me! Oh fuck, fuck do I need it!”</i>");
	output("\n\nAs if you needed the invitation; after a moan like that your own ");
	if(pc.cockTotal() == 1) output("[pc.cock " + x + "] aches with a need to breed");
	else output("[pc.cocks] are oozing [pc.cumColor] all over themselves in preparation");
	output(". So long as the smutty half-ausar can keep on going after cumming once, you don’t care one bit. Her asshole winks at you invitingly once you withdraw your fingers, but she reaches back and gathers more of the semi-lubricated water before pressing it into her ass with what might be her entire fist. With a frown you take her hand back out, dishing a spank across one quivering cheek that releases an orgasmic bark from the pup. It’s no good if she gets carried away now! " + (pc.isTaur() ? "After making sure she’s not going to be actually <i>crushed</i> by your bulk you get your [pc.legs] up on either side of her, letting your cock rest in the drenched cleft of her asscheeks. With a desperately horny moan Perdita reaches back and lifts her ass up on tip-toes, helping guide your [pc.cockHead " + x + "] to her wanton asshole.":"You step up close enough to rest your [pc.cock " + x + "] between her asscheeks, and she immediately starts bouncing and grinding against you. Grunting, you force her to keep still once more while you line your [pc.cockHead " + x + "] up with her wanton asshole.") + " She finally goes still, grabbing her own massive fluffy tail to keep it from getting in the way. In the stillness of that pre-penetration moment you can only hear her panting for breath while she watches over her shoulder in anticipation.");
	output("\n\n<i>“Hey, what are you waiting f–ooooh... Fuuuuck~”</i> With a smug smile you wait for her mouth to open in question before pressing forward. Her maw becomes an open ‘o’ of pleasure, tongue hanging out as you feed ");
	if(pc.cocks[x].cLength() < 7) output("the entirety of your [pc.cock " + x + "]");
	else if(pc.cocks[x].cLength() < 14) output("most of your [pc.cock " + x + "]");
	else output("nearly a foot of [pc.cock " + x + "]");
	output(" into her twitching ring. Perdita immediately " + (pc.isTaur() ? "bucks up against your tauric body":"bounces on the spot") + ", toes curling as her eyes squeeze shut tightly enough to form tears at their corners. ");
	if(pc.cocks[x].cLength() < 7) output("Her asshole turns itself into a burning-hot vice around the base of your prick, while her balls tighten up against her body. Cum sprays from her bitch-boner in long ropes that pulse in thickness in time with her heartbeat before slowly to a trickle, pinned between you and the sauna floor.");
	else if(pc.cocks[x].cLength() < 14) output("There’s only a moment of tension where you have to slam your [pc.cockHead " + x + "] home past her enlarged prostate, before every muscular wall in her clenching backside roots you to the spot. The underside of your shaft is practically massaged by the cum passing through her p-spot, and her balls tighten up until they’re practically kissing her own knot. Cum sprays from her bitch-boner in long ropes that pulse in thickness in time with her heartbeat before the flow is choked off by the weight of your cock in her.");
	else output("Getting your thick shaft actually <i>past</i> her prostate is a nearly impossible task in and of itself; stars begin to flicker at the corners of your vision by the time you’re a foot deep, and she’s hunkered down on you so hard you’d probably be able to see your cock bulging against her stomach if it weren’t pinned to the floor. That tightness only redoubles as she finally cums; long ropes of cum that pulse in time with her hammering heartbeat are fired off from her bitch-boner, turned high-pressure by the raw girth of your prick smashing down on her p-spot.");
	pc.cockChange();
	output("\n\nIt’s hard to be sure, but it sounds as though she’s still babbling words once her voracious grip on your prick finally relaxes. You’d not even realized you’d stopped breathing when you finally gulp down a lungful of spunk-laden air, shuddering as you draw yourself out" + (pc.cocks[x].cLength() >= 10 ? " a few inches":"") + ". Her asshole now gapes hungrily at you, begging to be filled with more of you again. The horny half-ausar may have cum, but you’ve barely begun! " + (pc.isTaur() ? "The only downside is being unable to see her rendered down to a quivering wreck... you’ll just have to make do with the way her muscles try to milk you dry. ":"") + "Finally you thrust again, slamming hard enough into her that she’s nearly lifted out of the water while she whimpers in pleasure. <i>“Ah! Steele... so sensitive,”</i> moans your licentious lover <i>“Gonna break me!”</i>");
	output("\n\nYou can’t say if that’s an accusation or she’s just begging to be turned into a cockslave... not that it matters. Even when you aren’t moving it feels like Perdita’s trying to wring your cock dry, and you drink in the sensation of being worshiped by her muscles while her cock gradually returns to aching red hardness. Another (albeit gentler) swat against her broad bum has her clenching instinctively, perfect for dragging your rod back out before taking a deep breath. Glancing around shows the baths to be a little less unoccupied than you thought; the shapes of other men and women in the mist are cavorting in similarly rapturous fashion, getting off on the sounds of your noisy lovemaking. <i>“Hey, [pc.name]... d-did you know that when I drink enough of Kally’s stuff I stop... phew. Running out of cum?”</i> Perdita asks, wiggling her hips in open invitation.");
	output("\n\nSounds like something to put to the test. ");
	if(pc.isTaur()) output("Your fore[pc.legsNoun] shift again in an effort to keep your balance steady, and you lower your hips until her tail is pinned between her ass and your crotch. It’s the perfect angle to start pistoning into her properly.");
	else output("Her ass is just begging to be ravaged, and you slap your hands down onto it in order to sink your fingers in properly. At a point her taut flesh springs back, but at the very least she’s locked firmly enough in place that you can get to some real fucking.");
	output(" The fuck-hungry pup’s urging turns to moaning the moment you throw your weight into thrusting once more, but instead of stopping as before you all but turn the poor girl inside out with the pace of your jackhammer thrusts. The moaning turns into a staccato chorus in time with your wicked pace, throwing herself back against you for dear life. At some point along the way Perdita manages to get one of her hands out of their death-grip on the bath’s edge and wrapped firmly around her bone. Each time your nethers slam into her" + (pc.balls > 0 ? " with the audible clap of [pc.balls] on cushy rear":"") + ", the pup’s hand bottoms out and squeezes her knot.");
	output("\n\nEach thrust is telegraphed into her eager grip, taking only a matter of heartbeats to coat her hands with thick whitening pre as it’s liberally milked out of her asshole by the ");
	if(pc.cocks[x].cLength() < 7) output("raw force of your hips smashing into her backdoor");
	else if(pc.cocks[x].cLength() < 14) output("head of your cock constantly slamming into her prostate");
	else output("weight of your seemingly-endless shaft grinding its way past her prostate between gut-bulging thrusts");
	output(". By now there’s an actual layer of pup-spunk on the hot lube-y water, and you’ve not even had a chance to cum once!");
	if(pc.balls > 0) output(" Perhaps Perdita notices this, swapping from jerking herself off to fondling your [pc.balls] each time " + (pc.balls > 1 ? "they clap":"it claps") + " home against her own taut pouch.");
	output(" If not for the heat of the bath itself you’d be concerned at the sweat that practically ");
	if(pc.isTaur()) output("pours down your flanks");
	else if(pc.hasFur()) output("mats your [pc.fur] together");
	else output("flows from your pores");
	output(" before joining the slurry of sexual juices and water. One particularly hard thrust rocks you to the core, and the moment your pace falters the pup pounces on her chance. She clenches with every muscle her broad backside has to offer ");
	if(pc.cocks[x].cLength() < 7) output("gripping your modest member until you’re rooted to the spot.");
	else if(pc.cocks[x].cLength() < 14) output("trapping you at the [pc.knotOrSheath " + x + "] of your [pc.cockType " + x + "] cock.");
	else output("fighting to hold your immense [pc.cockType " + x + "] cock in place.");

	output("\n\nJudging by the way her tongue hangs loosely from her drooling maw, you’ve all but fucked the sentience right out of this slutty pup. Even then, everything she does seems to be devoted to getting you to cum right here and now. That final, intense grasp her well-plowed depths hug your ");
	
	if(pc.cocks[x].cLength() >= 12 && (pc.hasKnot(x) || pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED))) output("bestial bitch-breaker");
	else if(pc.hasCocks()) output("cocks");
	else output("member"); 
	output(" heralds your approach to the end. Instead of grit your teeth and nut however, you ");
	var cumQ:Number = pc.cumQ();
	if(pc.isTaur()) 
	{
		output("bend down at the tauric half and get your hands beneath her pits. She yelps in surprise, flailing a little until you twist her around atop you. Now you’re graced the perfect position to watch her eyes roll back and drink in her pleasure-broken expression. The horny half-ausar cums again, wrapping her arms around your monstrous lower-half and humping weakly against it. Buried as you are within her, it’s actually possible to <i>feel</i> her prostate churn before she blasts your underside with seed and turns your bodies into an alabaster sandwich. At last you stop holding back yourself, joining her in ecstasy ");
		if(cumQ < 2000) output("and blasting thick ropes of [pc.cumNoun] into her depths. By the time you’ve finished firing away she’s still whimpering and cumming, although it soon peters out into a trickle that escapes the press of your forms and fills the bathtub beneath.");
		else output("and not so much cum as you do flood her bowels in [pc.cumColor]. She’s still spasming her way through the orgiastic aftershocks of her own mighty finish when you’ve packed her as full as she can go. The rest of your potent cock-sauce is forced to squirt out around the tight seal her ass is forming around your [pc.cock " + x + "] until the bath looks like it’s threatening to overflow.");
	}
	else
	{
		output("lean back and grab her by the hips. She squeals in surprise and spreads her legs wide so that you can flip her over, serving to grind your cockflesh into ");
		if(pc.cocks[x].cLength() < 7) output("her sensitive walls");
		else if(pc.cocks[x].cLength() < 14) output("her prostate");
		else output("every inch of flesh you’re able to fit your prick past");
		output(". You get to capture that perfect moment; Perdita comes crashing headlong into a massive orgasm. The first thick streak of alabaster cream paints the underside of her tits before you take a hold of her cock, aiming it straight up so that her scalding hot fluids can come raining down onto the two of you. At the same time you finally relax and allow yourself to join her in ecstasy. ");
		if(cumQ < 2000) output("\n\nImmediately her depths are filled with ropes of [pc.cumType], but apparently this pup wasn’t kidding about her production. By the time you’ve finished jettisoning every last quart of cream and rendered your balls aching and empty, she’s still twitching and squirming on your length and only just starting to peter off.");
		else output("\n\nIt doesn’t matter how proud of her production Perdita is; you don’t so much cum as you do baste her guts in goo. By the time she’s spasming her way through those last aftershocks of orgasm you’ve finished filling her to the brim, the rest of your ardor is forced to squirt out around the tight seal of her ring and your [pc.cock " + x + "] where it fills the bath until it’s fit to flood.");
	}
	output("\n\n<i>“Fuuuck...”</i> She eventually moans, running her hands across her cum-covered " + (!silly ? "tits":"yams") + " and squeezing her puffy nipples. Jizz escapes between her fingers like leaking milk as you attempt to unlodge yourself");
	if(pc.hasKnot(x)) output("; thanks to a little extra hot lubrication it’s just barely possible to draw your knot out");
	output(". There’s ");
	if(cumQ < 2000) output("a small waterfall of your cum that quickly joins the pupperspunk already forming a thick layer atop the water");
	else output("an epic waterfall of cum that finally floods the bath, creating a sure slip-hazard entirely of sexual effluvia");
	output(". With an almost breathless laugh you clamber ");
	if(pc.isTaur()) 
	{
		output("the rest of the way ");
	}
	output("out of the bath, basically carrying Perdita with you while she helplessly drools out pleasure-laden nothing-words.");
	output("\n\nYou hunt out another of the hot baths, before climbing into it and letting Perdita sprawl herself out. <i>“Steele. Stars and suns you’re a good fuck. I... yeah. Gonna need a minute.”</i>");
	output("\n\nStill grinning, you start giving yourself a scrub-down. " + (pc.isTaur() ? "After a few minutes the writer-pup gathers enough of her wits to help you tend to your massive tauric flanks. ":"") + "Perdita herself seems content to just rest filthy and let whatever natural enzymes exist in the water break down the jizz that coats her body... whether the bath you’d just fucked in will ever be the same is another matter. <i>“Hey... that was awesome, thanks.”</i> She says, turning around in the bath before leaning over the edge so that her expansive tits can cushion her crossed arms. <i>“Uh... I can’t feel my legs. Or ass. Could you ask Kally to send out a drink for me?”</i>");
	//[Next] //Count as cleaned of sweat/filth, pass time 1 hour, back to Kally’s bar main room with no pupper in the room descrip until a day passes.
	processTime(60);
	pc.orgasm();
	pc.shower();
	new Perdita().loadInAss(pc);
	clearMenu();
	addButton(0,"Next",move,"CANADA5");
}

//Ice Play
public function icePlayWivPerditles():void
{
	clearOutput();
	showPerdita(true);
	author("SomeKindofWizard");
	moveTo("CANADA7");
	var x:int = -1;
	if(pc.hasCock()) x = pc.biggestCockIndex();
	//Herms have a 50/50 chance of either genital.
	if(x >= 0 && pc.hasVagina() && rand(2) == 0) x = -1;
	output("Perdita toys with the shot glass of nutty nut-brew for a few moments before knocking it back, while you quickly do the same. <i>“Alright, uh... gimme a sec.”</i> The wickedly-grinning pup slides off of her perch, making straight for the bar. For a second you’re afraid that she’s about to get the two of you too plastered to fuck, but instead she retrieves a small silver bucket while Kally giggles to herself... call it paranoia but you could <i>swear</i> she looked right at you before laughing. There’s a little spring in the half-ausar’s step as she makes toward Kally’s bathhouse sauna. It’s incredibly satisfying just to watch her walk; each rise and fall of her feet is met by a tail-wag mirror. Apparently it helps make for an incredibly broad and springy bum.");
	output("\n\nThe sliding door between bar and sauna rolls gently aside before washing the both of you in a backdraft of heat, and the moment it’s slid shut behind you all sounds of the raucous bar-talk is muted to practical silence. Instead there’s nothing but the gentle trickle of water interspersed by the occasional ‘tonk’ of bamboo fountains knocking against each other. Perdita takes a deep breath of the steamy air, stretching and slipping off her jacket.");
	output("\n\nThere’s a little space for coat hooks and boxes to ditch your belongings in, so while she’s busily undressing you " + (!pc.isCrotchExposed() ? "strip off your own coverings":"ditch your excess equipment") + ". A variety of swimwear hangs on a rack beside the wooden clothes-bins... but you won’t be needing those. When you return your attention to Perdita, the horny pup’s only gotten her top off; it seems she’s stopped in order to admire your own form.");
	//muscular
	if(pc.tone > 66) output(" You give her a mighty flex, making sure she gets the full show.");
	else if(pc.tone < 33) output(" You grin and hug your softened curves, but she seems just as appreciative of a little paunch.");

	output("\n\n<i>“Mmmnf. Sorry for the holdup... just. Had to...”</i> She gulps and blushes, hurriedly squeezing out of the last of her own belongings. You take advantage of the opportunity to enjoy her own nude form; her bouncing breasts are just as shapely and squeezable when they’re not being restrained by a lacy low-cup black bra that matches a modest pair of black panties that she has to wriggle past her broad bum. ");
	//first time
	if(flags["PERDITA_SEEN_NAKED"] == undefined) 
	{
		output(" You blink a few times in surprise at her lack of a cunt, even if there’s now a great many inches of knotted ausar-cock hanging free in the sweltering sauna air.");
		output(" <i>“It’s a good show watching a " + (pc.mf("stud","cutie")) + " like you undress, y’know?”</i>\n\nYou’re pretty sure you <i>do</i> know, considering the way she’s ass-up and grinning at you over her shoulder as her panties hit the floor. ");
		output("\n\n<b>Perdita is a dick-girl.</b> Do you wish to continue?");
		clearMenu();
		addButton(0,"Hell Yes",continueFuckingPerditaWithIce,x);
		addButton(1,"No Thanks",nopeOutOfPerditasDick);
		return;
	}
	else output(" She makes sure to shake her ass for you and grant you a good look at the way it jiggles before her ring winks enticingly at you. Her usual thick ausar-cock already drools pre and her trappy pouch hugs her tightly at the change in temperature.");
	output(" <i>“It’s a good show watching a " + (pc.mf("stud","cutie")) + " like you undress, y’know?”</i>\n\nYou’re pretty sure you <i>do</i> know, considering the way she’s ass-up and grinning at you over her shoulder as her panties hit the floor. ");
	perditaIceFuckpart2(x);
}

public function continueFuckingPerditaWithIce(x:int):void
{
	clearOutput();
	showPerdita(true);
	author("SomeKindofWizard");
	flags["PERDITA_SEEN_NAKED"] = 1;
	output("After a moment to take in her attributes, you smile and carry on. ");
	perditaIceFuckpart2(x);
}

public function perditaIceFuckpart2(x:int):void
{
	output(" She skips away when you approach however, leading you towards one of the larger baths. There are a few other people in various pools of water either relaxing, hungover, or enjoying similar pleasures of the flesh.");
	output("\n\n<i>“Mmm, this one. This one’s perfect [pc.name]...”</i> She dips a toe into the water and lifts it up; the liquid trickles from her in a way that reminds you somewhat of lube. Certainly not as thick, but there’s no doubt something similar in it to the kind of stuff they use in New Texas. Not a surprise, considering someone loaded to the gills on Kally’s special brew is going to be interested in only one kind of flesh-on-flesh collision. She slides gently into the water, moaning softly and shivering a little at the fresh heat-shock. You follow along with her ");
	if(pc.isGoo()) output(", concentrating to make sure your gooey form doesn’t turn the pool into [pc.name]-slurry,");
	output(" and let out a similar noise of satisfaction when the warmth sinks into your extremities.");
	output("\n\n...And then the pup places down a silver bucket. Condensation already trails the edges until it forms a pool that joins the far-hotter waters you both rest in. When she turns around to poke inside the bucket it leaves her ass fully out of the water, granting you a wonderful view of hot lube-y water trickling down tight balls and a thick prick. Before you can reach for the treats on display however, she’s twisting around to face you while she sits herself on that cushy bum. <i>“Mm... now how to start? Stars these things are cold.”</i>");
	output("\n\nIce cubes drip in each hand, and she has to pause and lick them both a little as though they were melting treats as opposed to plain water. " + (pc.isTaur() ? "It’s hardly as though you could sidle over to her; with your bulk it’s a lot easier to just <i>walk</i> into the center of the water in order to get your nude upper-half in range.":"With a smile you sidle around the bath towards her, making sure to get your nude body in range of her expected ministrations.") + " Once more Perdita looks you over, making sure to drink in every ");
	if(pc.tone > 66) 
	{
		if(!pc.isTreated() && !silly) output("toned muscle");
		else output("toned mooscle");
	}
	else output("luscious " + (pc.biggestTitSize() >= 4 || pc.buttRating() > 8) ? "curve":"part");
	output(" of you that she can. She closes the last scant inches, popping one of the ice-cubes into her mouth and shivering. <i>“Ith cold.”</i> She complains before sinking her face into your neck" + (pc.hasHair() ? " and [pc.hairNoun]":"") + ", slipping her now-free hand behind your back to keep you held in place.");
	output("\n\nThe gentle press of her lips against your neck is almost enough to fool you into relaxing, before a shock of icy cold joins it. There’s a winsome flutter to the pup’s lashes as she uses her tongue to manipulate the ice-cube, grinding it against your flesh while her soft lips noisily smooch you. She gives you no moment to prepare, pressing the cube between her fingers against your ");
	if(pc.biggestTitSize() < 1) output("chest");
	else if(pc.biggestTitSize() < 20) output("breasts");
	else output("heaving tits");
	output(" and running it down your flesh until");
	if(pc.isGoo()) output(" your gooey-flesh toughens and grows more sensitive");
	else output(" gooseflesh prickles into being");
	output(" in a trail across your body. Perdita lets out a muffled giggle that slowly gains more clarity once the ice in her mouth has melted down, and you reach for her chin to pull her up into a kiss.");
	output("\n\nHer eyes go wide for a moment before she moans her way into your embrace; her tongue and lips are chilled from their frozen passenger, but you quickly warm them back up until she’s practically drooling. Even while her mouth is otherwise occupied by your [pc.tongue], she’s plucking up fresh ice-cubes to tease you with. You can feel her lips turn into a smile at your stifled gasp when she places a cube on each of your [pc.nipples], ");
	//innynips//
	if(pc.hasInvertedNipples()) output("practically drawing them out of hiding");
	///lactating//
	else if(pc.isLactating()) output("drawing a little chilled [pc.milk] from your temperature-shocked teats");
	else output("turning them into rock-hard nubs just begging to be toyed with");
	output(". Her palms roll back over that tender flesh, re-warming it so that she can shock you once more.");
	output("\n\nOnce your locked lips finally part there’s a strand of drool connecting you both, but it’s soon lost in the moisture you’ve already bodily thrown yourself into. Perdita presses one of the ice-cubes against your neck while the other is run down your tummy. She smiles innocently as you fidget and squirm, although her coquettish pose is somewhat spoiled by the wildly-wagging tail from behind. There’s no doubt that if her hand reaches any further down she’ll be ");
	if(pc.isTaur()) output("tickling that seam between humanoid torso and bestial body");
	else output("teasing your [pc.crotch]");
	output(". Her lips touch against your neck, warming the frozen flesh with kisses and licks while you gasp at the ice being pushed into your belly button.");
	output("\n\nIn fact Perdita’s pressed so closely against you now that it’s possible to feel her bitch-boner pressing against your flesh; what’s the harm in making sure you know just how much you <i>appreciate</i> her? You choose your moment carefully; when the horny pup puts a fresh ice cube in her mouth in order to nibble on your ear again, you wrap your [pc.fingers] around her prick and give her a nice slow squeeze. <i>“A-ah!”</i> She gasps, nearly dropping the ice-cube before nuzzling up against you. <i>“Ooh... I approve.”</i>");
	output("\n\nJust before you can turn the tables on your canid lover she grips you back");
	if(x < 0) output(", sinking chilled fingers into your sopping twat");
	else output(", wrapping chilled digits around your own scalding [pc.cockNounSimple " + x + "]");
	output(". She might as well have rooted you to the spot as the juxtaposition of cold and hot fight for control over the arguably most sensitive part of your body, eliciting a giggle out of her that turns into a delighted little bark when you reach around in order to start jerking her off properly.");
	output("\n\nShe guides you back towards the water’s edge, pinning you there with a series of kisses against your " + (!pc.isTaur() ? "neck":"flanks") + " that are always followed by the touch of swiftly-melting ice. Now however she has you entirely at the mercy of her other hand " + (x >= 0 ? "jerking":"jilling") + " you steadily towards completion, watching all the while so that she can drink in every expression on your face. The attentions are so earnest it’s almost hard to make eye-contact with her, suddenly self-conscious about being added to her collection of stories.");
	output("\n\nThat train of thought quickly disables itself again when the last of the ice melts and she swaps to two hands, ");
	if(x >= 0) output("piston-fucking your cock while squeezing you at the [pc.knotOrSheath " + x + "]");
	else output("practically driving a whole fist into you while rapidly fanning your clit");
	output(" until your nerves are screaming with desire. She must have been waiting for your eyes to scrunch shut however; the moment they do you actually " + pc.mf("yell","squeal") + " out with surprise. She had one last ice-cube, and it’s now firmly in your ass where it can slowly melt. Your legs tremble while unconscious shivers rock their way up-and-down your body, and you might even be annoyed at the shock if not for the constant onslaught. " + (x >= 0 ? "It doesn’t help when the icy weight is being pushed down onto your prostate, further confusing your challenged nerves.":"Hell, from where she is now though you could probably feel the hand in your cunt make contact with the walls between your depths and melt that ice faster."));
	output("\n\n<i>“C’mon [pc.name]. Cum! You know you want to!”</i> Again she beams those bright and expectant eyes at you, doing her damndest to finish you off. And finally she does.");
	output("\n\nYou slump out of her grasp and into the water, shuddering once more as your muscles tighten up");
	if(x < 0) output(" and force her hand out of your pussy");
	output(". What’s left of the ice-cube in your rear shoots out before you ");
	if(x >= 0)
	{
		var cumQ:Number = pc.cumQ();
		if(cumQ < 50) output("fire off a few errant ropes of [pc.cumColor] spunk under the water’s surface where it can bubble and steam upwards");
		else if(cumQ < 10000) output("let off every last ounce of [pc.cum] you have in your reserves, not stopping until the hot water is thrown off-color and become even thicker");
		else output("don’t so much fill the waters with cum as you do <i>over</i>-fill them. The waters immediately turn [pc.cumColor] and thick, putting whatever special cum-consuming enzymes that hide in this pool to the true test. Perdita giggles and squeals, climbing out of the water before her fur is rendered a matted mess by the lurid ooze. <i>“Stars, look at you go! You’re a fucking monster down there!”</i>");
	}
	else
	{
		if(pc.isSquirter()) output("spray girl-cum like a water-feature of your own, grinning even as you gasp as it forms a layer on top of the water before mixing and becoming one with it.");
		else output("dribble girl-cum in orgasmic ecstasy, grinning even as your juices taint the water with your heady pleasure.");
		output(" Perdita manages to slip her fingers back inside you before you’re completely away though, smiling with satisfaction when she gets a chance to sample your flavor from her fingers.");
	}
	output("\n\n<i>“Fun, huh?”</i> She asks after you’re done venting the remaining sexual liquids in your body, helping you clamber out of the (now far murkier) water. Yeah, that was pretty good. She could have warned you about the ass-cube though.");
	output("\n\nShe smiles with feigned bashfulness despite her nudity, tail-wagging from side-to-side as she looks away. <i>“I have noooo idea what you could possibly mean, [pc.name].”</i>");
	//[Next] //Back to the bar
	processTime(60);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",move,"CANADA5");
}

/*
output("\n\nSmut List");
output("\n\n//Books purchased for fun times");

output("\n\nMy Romantic Encounter");

output("\n\nYou saunter into Kally’s bar, soaking in the atmosphere and taking in the sights. Perched up on a barstool is a familiar half-Ausar, Perdita, and they seem to be the first to notice your arrival. Large pointed wolf-ears peak out from scruffy auburn hair, and a long fluffy tail gently wags from side to side as she waves at you. Her tan skin is lightly dusted with freckles compared to the first time you saw her, evidence of a little more time spent in the sun perhaps.");

output("\n\nIt also seems that she had some genetic work done; her eyes are a gently-glowing lavender, although somewhat fuzzy thanks to the stack of empty glasses lined up on the table. After fetching a drink of your own (and flashing a smile at the bouncy, buxom bartender) you make your way over. <i>“Hey, Steele! Good to see you again.”</i> she says as you settle onto a barstool opposite. <i>“How have you been?”</i>");

output("\n\nWith a stretch, you recount some of your exploits, allowing the drinks to flow before turning the conversation on her. <i>“I can’t help but notice the freckles and the eyes, pick up something nice?”</i>");

output("\n\nPerdita smiles, tail wagging again as she knocks back the last of her drink, pausing to stretch until everything clicks. <i>“Yup, I went on holiday! Hung out with some family on Ausaril, spent some time at the beach. My mother paid for some eyes after I told her I was kind of going blind. I decided on a fancy color and some glow at the same time.”</i>");

output("\n\n<i>“You were going blind?”</i> you ask, frowning.");

output("\n\nPerdita shrugs helplessly, pausing to look at a beeping datapad before slipping it away. <i>“Yeah, I mean – not quickly mind you – but I spend a lot of time looking at little typed words, you can imagine for a writer that gets a bit head-achey.”</i> she smiles fondly. <i>“Mum’s a sweetie though, she knew I’d been angling for some cool eyes or something for a while, it’s waaay cheaper to get that done at the same time as an actual medical fix-up. All I had to do was drop in a couple hundred extra credits, and voila.”</i>");

output("\n\nThe half-Ausar leans in, giving you a good look (and a faceful of whisky-breath) before settling back. Very cool indeed, you agree, opting not to mention your more... extensive alterations. Before the girl gets a chance to pour more alcohol down her gullet, you bring up her writing again; have there been any more additions to the catalogue?");

output("\n\nHer freckles seem to pale in time with a blush before scratching the back of her head. <i>“Yeeeah... there’s been another that I got done during my holiday. Might be based on something I got up to. It’s really lewd, I don’t know if it’s your kind of thing.”</i>");

output("\n\n<i>“You’ve got to be kidding me. I’m literally asking if you have any more smut I can buy.”</i> you say, snorting and finishing your own drink. What kind of hard-core shit is this half-borker into?");

output("\n\nPerdita blushes and clears her throat. <i>“Hand-holding.”</i>");

output("\n\n<i>“You are such a dick.”</i> you grumble, accepting fresh glasses off a waitress-delivered tray. <i>“But what is it really?”</i>");

output("\n\n<i>“No! It actually really is. I’ve written things from my own perspective before, that’s no issue usually. But this time it was... uh...”</i> Perdita trails off, gulping her glass and waving for another. She fights down a belch and pats her chest. <i>“This one felt kind of embarrassing for me, I got my rocks off hard. We held hands, tied them together, and made love like fucking animals.”</i>");

output("\n\n...Nice. You reach into your pocket and pull out a stack of credit chits, starting to place them out into a little tower. <i>“One hundred... two hundred... three hundred...”</i> you begin, before the half breed’s hands shoot up in surrender.");

output("\n\n<i>“Okay! Okay. Fine. Fuck...”</i> she says in defeat, although her newly-glowing eyes are bright as she scoops in sweet money. <i>“You are a truly incredible patron of the smutty arts, Steele. Here you go... and be kind, this was an odd thing to write down, but it was honest.”</i> Perdita slips out her datapad, swipes all of the credit-chits through it, and makes a flicking motion. A soft ‘boop’ from your Codex announces new mail!");

output("\n\nPerdita smiles, tail wagging up a storm. <i>“With that handled, anything you’d like to do before you go?”</i>");

output("\n\nThe night passes deep in drink. At some point a Moosetaur starts up a game of New Texas Hold’em, and quickly the table finds itself lacking in clothing.");

output("\n\nOnce you’re back on your ship (and turning the heating up thanks to your now-nude form), you give your mail a quick look.");



output("\n\nThank you very much for purchasing this piece! If you like this, and would like to read more, you can subscribe to me for a little cash and get more very month.");

output("\n\n-");
output("\n\nHugs’n’kisses for you Steele! xxx");

output("\n\nYou are now the proud owner of a story titled ‘Hand-Holding Lewds’. Descriptive, albeit unimaginative.");

*/