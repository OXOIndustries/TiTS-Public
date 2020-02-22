/* Android cuntboy by -GothPastel
 * https://docs.google.com/document/d/1UyMwEaKfiK6FNnNxCBF4EfqsSqS1RgZONiiUTmAydO8/edit#
 * edited Vaginal scene with HL support
 * https://docs.google.com/document/d/1ULfaQY1nxnREz1kevl0UuwOTZmCPgv9T4enbOGyp3es/edit#
 *
 * YOMA_MET
 * YOMA_SEEN_NAKED
 * YOMA_TIMES_ORALED
 * YOMA_TIMES_EATEN_OUT
 * YOMA_TIMES_VAGINAL
 * YOMA_TIMES_TAILFUCKED
 * YOMA_TALKED_ABOUT_HIMSELF
 * YOMA_TALKED_ABOUT_MASTER
 * YOMA_GAMES_PLAYED
 * YOMA_AVAIBLE_ENEMIES
*/

/* Yoma Xpak:
 * https://docs.google.com/document/d/1YN5yVN_go83MZM05hmG6_zApiaykvv4xNJoL0miI-sg/edit#
 *
 * YOMA_DATE_PROGRESS		-1 = dont want dates, disableds this encounter,
 * 							undefined/0 = didnt start any dates so far
 * 							1 = choose "later" on first date
 * 							2 = finished first date, unlocks anal/tribbing sex scenes
 * 							3 = choose "later" on second date
 * 							4 = finished second date, unlocks fingering sex scene
 * 							5 = choose "later" on third date
 * 							6 = finished third date
 * YOMA_BAR_DATE			date of Yomas last bar check, used to determine if he can appear today
 * YOMA_AT_BAR				0 = cant appear at bar today, 1 = can appear
 * YOMA_DATE_ELEVATOR_SEX	1 = had sex in the Uveto elevator
 * YOMA_RELATIONSHIP		0 = fuckbuddy, 1 = lover
 * YOMA_TIMES_ANALED
 * YOMA_TIMES_TRIBBED
 * YOMA_TIMES_FINGERED
*/

public function showYoma(nude:Boolean = false):void
{
	showName("\nYOMA");
	showBust(yomaBustDisplay(nude));
}

public function yomaBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "YOMA";
	if(nude) sBust += "_NUDE";
	return sBust;
}

public function yomaJungleEncounter():void
{
	flags["YOMA_AVAIBLE_ENEMIES"] = 0;
	yomaFirstMeeting();
}

public function yomaJungleMiddleEncounter():void
{
	flags["YOMA_AVAIBLE_ENEMIES"] = 1;
	yomaFirstMeeting();
}

public function yomaVanaeZoneEncounter():void
{
	flags["YOMA_AVAIBLE_ENEMIES"] = 2;
	yomaFirstMeeting();
}

public function yomaFirstMeeting():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	if (pc.hasStatusEffect("Yoma Sex Disabled")) pc.removeStatusEffect("Yoma Sex Disabled");
	
	yomaCooldown();

	if (flags["YOMA_MET"] == undefined) {
		output("You’re making your way through the jungle when you hear a crack behind you. Whipping around suddenly, you see a figure, too far away to make out in perfect detail but not far over five feet tall, slowly lifting their foot back off of a snapped twig. It’s definitely not a native, you realize - unless you’ve somehow missed a species with big fennec fox ears and tails.");
		output("\n\n<i>“Damn it,”</i> they - no, he, that’s a distinctly rich, masculine voice - say, <i>“I really must ask master for less clumsy feet.”</i>");
		output("\n\nFor a moment, you don’t say anything, but then decide that since he doesn’t seem to have registered your presence at all, you ought to call out a greeting.");
		output("\n\n<i>“Oh! Hello there!”</i> is the surprised response, and now that he’s talking a little louder, you can make out a rather posh sounding Terran accent: you’d guess British if pushed. <i>“Who are you?”</i> he asks.");
		output("\n\nYou introduce yourself, but not without asking for his name back too.");
		output("\n\nHe moves closer, extending a slender hand. <i>“Well, [pc.name], I will assume you are asking for what I am addressed as, and not my serial number...”</i> Indeed, on closer look, the ridges on his face and his glowing green eyes point him out as an android. <i>“It is Yoma.”</i>");
		output("\n\nHis hand hasn’t dropped yet, it looks like he wants you to shake it.");

		flags["YOMA_MET"] = 1;
		processTime(10);
		clearMenu();
		addButton(0,"Shake it",yomaShakeHands);
		addButton(1, "Don’t", yomaShakeHands, false);
	}
	else {
		output("You’re [pc.walking] through the jungle when a familiar voice calls out: <i>“Greetings, [pc.name]!”</i>");
		output("\n\nYoma is standing several feet behind you, hands on hips.");
		output("\n\nDo you want to stay and talk?");
		
		processTime(3);
		clearMenu();
		addButton(0,"Stay",yomaMenu,true);
		addButton(1,"Leave",yomaLeave);
	}
}

public function yomaLeave():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	output("You apologize to Yoma, saying you’re busy.");
	output("\n\n<i>“No problem, I will see you around!”</i> And without further ado, he’s gone again, vanishing into the jungle.");

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function yomaShakeHands(handshake:Boolean = true):void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	if (handshake) {
		output("<i>“Hah! Nice to meet someone with manners for once!”</i> he says, grip warm and firm.");
		output("\n\nYou give him a ");
		if (pc.isAss()) output("thin ");
		output("smile and explain you’re just relieved to meet someone out here who isn’t just trying to jump you. He smiles back, his toothy grin showing off artificially white and wicked sharp canines that stand out in stark contrast to his dark skin, and nods in agreement.");
		output("\n\n<i>“True, true, the natives here are so... uncivilized,”</i> he responds, <i>“And the girls are always so disappointed - not that an android like me could breed them anyway.”</i>");
	}
	else {
		output("He waits another five, ten seconds with his hand outstretched before dropping it to his side.");
		output("\n\n<i>“As uncivilized as the natives...? Brilliant.”</i> His face twists into a slight snarl, showing his artificially white and wicked sharp canines in stark contrast to his dark skin.");
		output("\n\nYou ");
		if (!pc.isAss()) output("apologise, saying");
		else output("say")
		output(" you’re just not a very touchy person");
		if (!pc.isAss()) output(" and that you didn’t mean to offend him");
		output(".");
		output("\n\nHe sighs, fluffy pale blond tail drooping behind him. <i>“That is fair. Just... do not go trying to jump me like they have been.”</i>");
		output("\n\nYou nod.");
		output("\n\n<i>“You would probably be disappointed too, Creator knows they have been.”</i>");
	}
	output("\n\nWait, what? Disappointed why?");
	output("\n\nHe must have noticed your confusion. <i>“Shall we say that while my master prefers the company of men...”</i> he pauses, flicking a platinum blond dreadlock behind a large ear, <i>“he would much rather fuck pussy.”</i>");
	output("\n\nHuh, looks like you’ve got a robotic cunt boy here.");
	output("\n\nIs there anything you want to talk about?");

	processTime(10);
	clearMenu();
	yomaMenu(true);
}

public function yomaMenu(clear:Boolean = false):void
{
	showYoma();
	author("GothPastel");

	if (clear) clearMenu();

	addButton(0,"Appearance",yomaAppearance);
	addButton(1,"Talk",yomaTalkMenu, true);
	if (flags["YOMA_TALKED_ABOUT_MASTER"] != 1) addDisabledButton(2, "Sex", "Sex", "You probably should find out who this android belongs to first, unless your kink is lawsuits.");
	else if (pc.hasStatusEffect("Yoma Sex Disabled")) addDisabledButton(2, "Sex", "Sex", "Yoma doesn’t want to have sex with you right now.");
 	else if (pc.lust() < 33) addDisabledButton(2, "Sex", "Sex", "You aren’t aroused enough for this.")
	else addButton(2,"Sex",yomaSexMenu);

	if(hours > 3 && hours < 21) addDisabledButton(3, "Hugs", "Hugs", "This scene is only avaible in the evening.");
	else addButton(3,"Hugs",yomaHugsI);
	addButton(14,"Leave",yomaLeave);
}

public function yomaAppearance():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	output("Yoma is a 5 foot and 3 inch tall dark-skinned android with big, pointed fennec fox ears and a long, fluffy tail sprouting from just above his soft, well proportioned ass. His fur and chin-length dreadlocks are a pale, platinum blond.");
	output("\n\nHe has solid glowing green eyes with only a paler line marking where he’s actually looking. Combined with the grooves running down his cheeks, it’s very apparent that he’s not organic.");
	output("\n\nHe’s wearing a red, high-necked but armless cropped shirt that leaves his flat stomach exposed, with matching flared shorts that do nothing to cover his wide hips. The android has no noticeable muscle tone and is remarkably thin waisted.");
	output("\n\nYou know that his shorts cover a ");
	if (flags["YOMA_SEEN_NAKED"] != undefined) output("human ");
	output("pussy lying between his legs ");
	if (flags["YOMA_SEEN_NAKED"] != undefined) output("with a heart shaped patch of pubic hair above it ");
	output("as well as ");
	if (flags["YOMA_SEEN_NAKED"] != undefined) output("a welcoming ");
	else output("an ");
	output("asshole.");
	output("\n\nHe must have caught you checking him out, because he tugs at his shirt collar and jokingly fans himself with his other hand.");

	processTime(3);
	yomaMenu();
	addDisabledButton(0, "Appearance");
}

public function yomaTalkMenu(clear:Boolean = false):void
{
	if (clear) {
		clearOutput();
		output("You tell Yoma that you’re interested in learning more about him.");
		output("\n\n<i>“Of course,”</i> he says, tail swishing from side to side. <i>“What do you want to know?”</i>");
	}

	showYoma();
	author("GothPastel");

	addButton(0,"Him",yomaTalkHim);
	addButton(1,"Mhen’ga",yomaTalkMhenga);
	addButton(2,"Master?",yomaTalkMaster);
	if(flags["UNLOCKED_JUNKYARD_PLANET"] == undefined) addButton(3,"Probe?",yomaTalkProbe);
	else addDisabledButton(3,"Probe?","Probe?","You’ve already found it, why ask?");
	if (flags["YOMA_TALKED_ABOUT_MASTER"] == 1 && silly) addButton(4,"Game",yomaTalkGame, undefined, "Game", "What could possibly go wrong with playing D&D in the middle of a jungle?");
	else if (flags["YOMA_TALKED_ABOUT_MASTER"] == 1) addButton(4,"Game",yomaTalkGame);
	else addDisabledButton(4,"Locked","Locked","You don’t know enough about him for this.")
	addButton(14,"Back",yomaMenu,true);
}

public function yomaTalkHim():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	output("You ask him about himself.");
	output("\n\n<i>“Me?”</i> He pauses for a moment. <i>“Well... I am an android, I have fox bits, I, uh...”</i>");
	output("\n\nHe seems stumped so you try to press for something that you couldn’t tell already.");
	output("\n\n<i>“I am a custom built unit, an AI rather than a VI - but do not worry, I am very well programmed in order to stop me from malfunctioning like some earlier... defective models.");
	if (flags["BESS_LOVER"] == 1) output("”</i> You flinch, realising he’s essentially just trash talked the " + bess.mf("Ben-14", "Bess-13") +" unit you love. <i>“");
	else output(" ");
	output("And, ah, yes, I am technically a medical and companion android.”</i>");
	output("\n\nThat’s interesting. You ask him what he likes doing, wanting to know more about him.");
	output("\n\n<i>“Hm. That is not a question I am used to, most people do not think I can actively like or dislike things,”</i> he says, before a gentle smile creeps up onto his face. <i>“I suppose I enjoy exploring, there is always a sense of satisfaction in being the first to have been recorded reaching somewhere. That and sewing, but there is much less to talk about there.”</i>");
	if (flags["YOMA_TALKED_ABOUT_HIMSELF"] == 1) {
		output("\n\nOkay, you can’t hold back on this question any more, just why does he never use contractions?");
		output("\n\nThe absolute shit eating grin that spreads across his face is inhumanly wide, and it takes a while for it to fade enough for him to actually speak. <i>“It pisses people off!”</i>");
		output("\n\nWell. That answers that question.");
	}
	
	processTime(10);
	if (flags["YOMA_TALKED_ABOUT_HIMSELF"] != 1) flags["YOMA_TALKED_ABOUT_HIMSELF"] = 1;
	yomaTalkMenu();
	addDisabledButton(0, "Him");
}

public function yomaTalkMhenga():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	output("You ask why he’s on Mhen’ga, of all places.");
	output("\n\nHe hums, like he’s trying to think of what to say for a moment, before finally speaking. <i>“My master gets very sick. Frequently he is unable to so much as leave his bed.”</i>");
	output("\n\nYou’re not quite sure how this ties into why he’s here though, so you press further.");
	output("\n\n<i>“The Planet Rush. He has always, always wanted to explore the frontier. We were supposed to go together as he had been feeling so much better over the months before, but then he got worse than he ever had been before. His parents cancelled the trip, but, well, he still wanted to see all of this, so I was sent alone.”</i>");
	output("\n\nThat makes sense, you guess.");
	output("\n\n<i>“Mhen’ga is not my first stop and it probably will not be the last. There are so many specimens I want to gather for him...”</i> There’s an almost sad note in his voice, you guess it’s just not the same without his owner here.");
	
	processTime(10);
	yomaTalkMenu();
	addDisabledButton(1, "Mhen’ga");
}

public function yomaTalkMaster():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	output("You ask him about the man he keeps referring to as his ‘master’.");
	output("\n\n<i>“My master is a relatively wealthy Terran human, but he is plagued by a very serious immune condition that doesn’t seem to respond to any treatment that has been attempted thus far.”</i> His shoulders sag a little, the trademark grin fading as he sighs. <i>“He probably will not live very long.”</i>");
	output("\n\nThat’s quite the bombshell, and the android looks upset, so you try to steer him towards another topic, asking him what he does.");
	output("\n\n<i>“Well, with his condition he is not employed, but he has quite the interest in robotics! The amount of times he has tried to take me apart is bordering on ridiculous.”</i> Considering that he’s laughing as he says it though, it looks like he doesn’t actually mind. <i>“He sells the odd patent though, despite the fortune his parents make, he prefers not to feel indebted to them.”</i>");
	output("\n\nWhat’s he like?");
	output("\n\nYou’ve really asked the golden question here, as Yoma absolutely <i>beams</i>. <i>“I fucking love him, [pc.name]. This is not just because I was made specifically for him, he is simply the most exemplary member of the human race I have ever met. He has such a genuine kindness about him, he is just... wonderful.”</i>");
	if (flags["YOMA_SEEN_NAKED"] != undefined) output("\n\nYou ask when you’ll get to meet him, and Yoma laughs. <i>“Now, now, I cannot bring back everyone I have slept with to meet my owner.”</i>");
	output("\n\nIt does look like he cares an awful lot about his owner, and you ask him what the two of them like doing together");
	if(pc.isBimbo() || pc.isBro()) output(", and you can’t stop the mildly flirtatious tone in your voice");
	output(". Yoma pauses before answering. <i>“Well, the... less explicit answer to that question is that we, well, adapted a tabletop roleplaying game so that’d it’d work for just two players");
	if (flags["YOMA_GAMES_PLAYED"] !=undefined) output(" but you already know about that");
	output(".”</i>");

	processTime(15);
	if (flags["YOMA_TALKED_ABOUT_MASTER"] != 1) flags["YOMA_TALKED_ABOUT_MASTER"] = 1;
	yomaTalkMenu();
	addDisabledButton(2, "Master?");
}

public function yomaTalkProbe():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	output("You ask if him if he’s seen anything resembling your dad’s probe.");
	output("\n\n<i>“Not personally, no, but you are not the first person to ask about that,”</i> he says, suddenly peering inquisitively at your face, probably wondering just what could be so interesting about a crashed space vessel.");
	output("\n\nWho else would be looking for it? Wait, why even ask? <i>[rival.name].</i>");
	output("\n\n<i>“Where did [rival.heShe] go?”</i> You ask, hurried now.");
	output("\n\nYoma snorts at your enthusiasm, pulling a dark hand towards his face to inspect his perfectly manicured nails, stalling for time before responding. <i>“North? East? Something like that. [rival.HeShe] was rather rude, but [rival.hisHer] ausar friend had the decency to apologise.”</i>");
	output("\n\nIt’s not much to go off, but it’s more than you had earlier.");
	if (pc.isNice()) output(" You make sure to thank him, and he smiles again, a flash of brilliant white.");
	
	processTime(10);
	yomaTalkMenu();
	addDisabledButton(3, "Probe?");
}

public function yomaTalkGame():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	var possibleRaces:Array = ["human","ausar","kaithrit","gryvain","leithan","elvish","demonic","dwarvish"];
	var possibleClasses:Array = ["fighter","magic user","ranged fighter","healer"];
	var progress:Array = ["virtually no progress","a modicum of progress","a fairly good chunk of progress","so much progress you doubt there’ll be much left to play through next time"];
	var results:Array = ["some effort","the loss of one of your party members","the destruction of an entire, thankfully fictional, village","a significant chunk of damage done to your party"];

	if (flags["YOMA_GAMES_PLAYED"] == undefined) {
		output("You ask him about the game he mentioned earlier, and his ears perk up.");
		output("\n\n<i>“Well, we altered an existing game that normally needs a group of people so it can function with just a game leader and a single player - altered difficulty and such, the ability to play more than one character. It is quite fun, if I do say so myself!”</i>");
		output("\n\nYou ask him what the game’s called, at least, and if the two of you could play it.");
		output("\n\n<i>“Oh, well we renamed it, we called our version Caves and Cryptids! And... I do not see why we could not play.”</i> he remarks, sticking a hand into his pocket and fishing out a set of bright green dice, the same color as his eyes.");
		output("\n\nYou agree");
		if (pc.isNice()) output(" enthusiastically");
		output(".");
		output("\n\nBefore you know it, Yoma’s taken you through character creation and you’ve made a "+ RandomInCollection(possibleRaces) +" "+ RandomInCollection(possibleClasses) +" for your main character. Yoma only teases you a <i>little</i> about [pc.himHer] being a self insert, that you ")
		if (pc.isMischievous()) output("don’t even try to ");
		output("deny.");
		output("\n\nAfter about an hour of going over the rules, you have to agree to reconvene another time to actually play.");
	}
	else {
		output("You ask Yoma to get his ")
		if (silly) output("dick, wait no, you mean ");
		output("dice out, you’re ready to play.");
		if ((rand(3) == 0 && !(pc.accessory is JungleRepel)) || pc.accessory is JungleLure) {
			yomaInitiateFight();
			return;
		}
		else {
			output("\n\nNot long after, you settle down into ");
			if (pc.IQ() > 66) output("what proves to be a harsh fought battle of wits, as you try to catch up with Yoma’s constantly one step ahead spiralling plot threads");
			else if (pc.IQ() > 33) output("a fairly standard bit of campaign work");
			else output("a session that leaves you feeling just a little embarrassed as Yoma has to stop more than once to explain a plot hook you’d walked right past");
			output(" and before you know it, almost an hour has gone past. You’ve made "+ RandomInCollection(progress) +", but not without "+ RandomInCollection(results) +".");
			output("\n\nThe two of you spend a fair amount of time discussing the session, Yoma giving you pointers on strategy, you remarking on bits of plot that probably needed a little more polish.");
			output("\n\nEventually, you part ways. You’ve relaxed a little, the session a welcoming distraction from the stress of the Rush, and you even feel a little smarter for it.");
		}
	}
	IncrementFlag("YOMA_GAMES_PLAYED");
	processTime(60);
	//increased gain to 1, 0.2 seemed rather pointless
	pc.slowStatGain("intelligence", 1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function yomaInitiateFight():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	var avaibleEnemies:Array = [];
	if (flags["YOMA_AVAIBLE_ENEMIES"] == 1) avaibleEnemies.push(new Naleen(),new NaleenMale());
	else if (flags["YOMA_AVAIBLE_ENEMIES"] == 2) avaibleEnemies.push(new HuntressVanae(),new MaidenVanae());
	else avaibleEnemies.push(new ZilFemale(),new ZilMale(),new FrogGirl());

	var attackingEnemy:Creature = RandomInCollection(avaibleEnemies);

	output("You don’t even really have the chance to finish setting up before Yoma’s ears perk up, his tail bristling. Just a second later you hear the undergrowth rustling.");
	output("\n\nBefore you know it, a "+ attackingEnemy.short +" is charging towards the two of you. You ready yourself for a fight");
	if(pc.hasEquippedWeapon() || pc.hasShieldGenerator(true)) {
		output(", ");
		if (pc.hasEquippedWeapon()) {
			output("[pc.drawingWeapon]");
			if (pc.hasShieldGenerator(true)) output(" and ");
		}
		if (pc.hasShieldGenerator(true)) output("firing up your "+ pc.shield.longName);
	}
	output(".");
	output("\n\nYoma, however, does not seem to have quite the same readiness. He locks eyes with you for a moment before a panicked grin spreads across his features. A moment later and he’s gone, <b>leaving you alone to fight off your attacker!</b>");

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(attackingEnemy);

	switch(attackingEnemy.short)
	{
		case "huntress vanae":
			IncrementFlag("MET_VANAE_HUNTRESS");
			//CodexManager.unlockEntry("Vanae");
			CombatManager.victoryScene(vanaePCVictory);
			CombatManager.lossScene(vanaeHuntressPCDefeat);
			CombatManager.displayLocation("HUNTRESS");
			break;
		case "maiden vanae":
			IncrementFlag("MET_VANAE_MAIDEN");
			//CodexManager.unlockEntry("Vanae");
			CombatManager.victoryScene(vanaePCVictory);
			CombatManager.lossScene(vanaeMaidenPCDefeat);
			CombatManager.displayLocation("MAIDEN");
			break;
		case "female zil":
			IncrementFlag("TIMES_MET_FEMZIL");
			//CodexManager.unlockEntry("Zil");
			CombatManager.victoryScene(defeatHostileZil);
			CombatManager.lossScene(girlZilLossRouter);
			CombatManager.displayLocation("FEMALE ZIL");
			break;
		case "zil male":
			IncrementFlag("ENCOUNTERED_ZIL");
			//CodexManager.unlockEntry("Zil");
			CombatManager.victoryScene(winVsZil);
			CombatManager.lossScene(zilLossRouter);
			CombatManager.displayLocation("MALE ZIL");
			break;
		case "kerokoras":
			IncrementFlag("MET_KEROKORAS");
			//CodexManager.unlockEntry("Kerokoras");
			CombatManager.victoryScene(victoryAgainstTheFrogs);
			CombatManager.lossScene(loseAgainstTheFrogs);
			CombatManager.displayLocation("KEROKORAS");
			break;
		case "naleen":
			IncrementFlag("TIMES_MET_NALEEN");
			//CodexManager.unlockEntry("Naleen");
			CombatManager.victoryScene(beatDatCatNaga);
			CombatManager.lossScene(pcLosesToNaleenLiekABitch);
			CombatManager.displayLocation("NALEEN");
			break;
		case "naleen male":
			IncrementFlag("TIMES_MET_MALE_NALEEN");
			//CodexManager.unlockEntry("Naleen");
			CombatManager.victoryScene(defeatAMaleNaleen);
			CombatManager.lossScene(loseToDudeleenRouter);
			CombatManager.displayLocation("NALEEN MALE");
			break;
	}

	clearMenu();
	addButton(0,"Next", CombatManager.beginCombat);
}

public function yomaSexMenu():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	clearMenu();

	output("You’re not here to talk, you tell him, ");
	if (pc.sstdTotal() == 0) {
		output("and he beams, stripping out of his shirt and hooking his thumbs into the waistband of his shorts before you can even process what’s happening.");
		output("\n\n<i>“So, what do you want to do?”</i>");

		if (pc.hasGenitals()) addButton(0,"Get oral",yomaSexGetOral);
		else addDisabledButton(0,"Get oral","Get oral","You need genitals for this scene.");
		
		addButton(1,"Give oral",yomaSexGiveOral);
		
		if (pc.isTaur() || pc.isNaga()) addDisabledButton(2,"Vaginal","Vaginal","You need a more humanoid anatomy for this.");
		else if (pc.hasHardLightEquipped() || pc.hasCock()) addButton(2,"Vaginal",yomaSexVaginal);
		else addDisabledButton(2,"Vaginal","Vaginal","You need a cock or a hardlight strap-on for this scene.");
		
		if (pc.hasCockTail()) addButton(3,"Cocktail",yomaSexCocktail);
		else addDisabledButton(3,"Cocktail","Cocktail","You need a tail-mounted, parasitic penis for this.");
		
		//xpak scenes!
		if (flags["YOMA_DATE_PROGRESS"] == undefined || flags["YOMA_DATE_PROGRESS"] < 2) addDisabledButton(4,"Locked","Locked", "Spend more time with him, get more sex.");
		else if (pc.isTaur() || pc.isNaga()) addDisabledButton(4,"Anal","Anal","You need a more humanoid anatomy for this.");
		else if (pc.hasHardLightEquipped() || pc.hasCock()) addButton(4,"Anal",yomaSexAnal);
		else addDisabledButton(4,"Anal","Anal","You need a cock or a hardlight strap-on for this.");

		if (flags["YOMA_DATE_PROGRESS"] == undefined || flags["YOMA_DATE_PROGRESS"] < 2) addDisabledButton(5,"Locked","Locked", "Spend more time with him, get more sex.");
		else if (pc.isTaur() || pc.isNaga()) addDisabledButton(5,"Tribbing","Tribbing","You need a more humanoid anatomy for this.");
		else if (pc.hasVagina()) addButton(5,"Tribbing",yomaSexTribbing);
		else addDisabledButton(5,"Tribbing","Tribbing", "You need a vagina for this scene.");

		if (flags["YOMA_DATE_PROGRESS"] == undefined || flags["YOMA_DATE_PROGRESS"] < 4) addDisabledButton(6,"Locked","Locked", "Spend more time with him, get more sex.");
		else if (pc.isTaur() || pc.isNaga()) addDisabledButton(6,"Get fingered","Get fingered","You need a more humanoid anatomy for this.");
		else if (pc.hasGenitals()) addButton(6,"Get fingered",yomaSexGetFingered);
		else addDisabledButton(6,"Get fingered","Get fingered","You need genitals for this scene.");
		addButton(14,"Back",yomaSexBack);
	}
	else {
		output("but he shakes his head.");
		output("\n\n<i>“No way. I do not care whether it is benign or not, you are not coming near me like that when you are infected.”</i>");
		output("\n\nYou try to protest, explaining your enhanced immune system, but he folds his arms, tail bristling.");
		output("\n\n<i>“You have a brilliant immune system, but my master has a terrible one. I am not taking any chances on that managing to balance out.”</i>");
		output("\n\nIt looks like he won’t budge on that.");
		processTime(3);
		pc.createStatusEffect("Yoma Sex Disabled");
		addButton(0,"Next",yomaMenu);
	}
}

public function yomaSexBack():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	output("On second thoughts, you change your mind, telling him to put his shirt back on.");
	output("\n\n<i>“Oh, come on now, you are going to be like that?”</i> he huffs, but pulls it back on anyway, <i>“Very well, but do not go changing your mind another time.”</i>");
	pc.createStatusEffect("Yoma Sex Disabled");
	yomaMenu(true);
}

public function yomaSexGetOral():void
{
	clearOutput();
	showYoma(true);
	author("GothPastel");

	output("You tell him not to bother removing his shorts, ")
	if (pc.isNude()) output("gesturing down to");
	else output("pulling your own [pc.lowerGarments] down and kicking them off to show off");
	if (pc.hasCock() && pc.hasVagina()) {
		output(" your [pc.cocks] and [pc.vaginas], you’re more interested in getting oral than anything else right now.");
		output("\n\nYoma sticks his pink tongue out at you, but doesn’t complain as he pulls his hands away from his shorts, using them to beckon you closer.");
		output("\n\n<i>“Quite the arrangement you have got down here,”</i> he comments as he gracefully drops to his knees, <i>“It is not often that I meet hermaphrodites.”</i>");
		output("\n\nYou suppose that’s fair, but you’re not here for discussions about the rarity of certain genital configurations, so you ");
		if (pc.isNice()) output("gently");
		else if(pc.isMischievous()) output("playfully");
		else output("roughly");
		output(" grab a handful of platinum dreadlocks, pulling him closer.");
		output("\n\n<i>“Patience, [pc.name], patience,”</i> he murmurs, pressing a kiss to your inner thigh, <i>“I will be right to it.”</i>");
		output("\n\nGood.");
		output("\n\nHe doesn’t waste much time, kissing at your [pc.thighsDescript] and ");
		if (pc.tone >= 50) output("toned ");
		output("stomach before taking the head of your [pc.cockNounBiggest] into his mouth, engulfing it in wet heat. Not that he ignores your [pc.vagina], a free hand finding its way between your lips, soft fingertips playing over your outermost folds. He hums around your cock as a little of your [pc.cum] slips out onto his tongue, before pulling away.");
		output("\n\nBefore you can even begin to protest, his mouth is back on you, licking a long stripe down your [pc.biggestCockDescript]");
		if (pc.balls > 0) output(", over your [pc.scrotum]");
		output(" and right onto your [pc.clit], before snaking his way back up again to press messy kisses to the base of your cock.");
		output("\n\nYou’re throbbing under his ministrations to the extent that you barely notice that he’s slipped two fingers into you, until he finds your G-spot. At this you cry out, feeling yourself wetten drastically. Before you can get off too soon though, Yoma pulls the fingers back out again, instead using his hand to pump your [pc.biggestCock]. Luckily for your rather desperate feeling [pc.vagina], he’s swapping places entirely, and his flattened tongue is soon pressed to your wet folds, lapping at you with, well, the exact level of precision you’d expect from a companion droid.");
		output("\n\nEventually, he swaps back, but this time, instead of more kisses, he takes your cock all the way down, deepthroating you");
		if (pc.cLength(pc.biggestCockIndex(), true) >= 40) output(", that is, you feel your tip hit what his manufacturers must have thought was the absolute deepest his throat needed to go");
		else if (pc.cLength(pc.biggestCockIndex(), true) >= 20) output(", although it’s quite a struggle to take it all down");
		else if (pc.cLength(pc.biggestCockIndex(), true) >= 10) output(" with a little difficulty");
		else output(" without a hint of difficulty ");
		output(". This combined with fingers once again pressed up against your G-spot");
		if (pc.balls > 0) output(" while his other hand cups your [pc.ballsNoun]");
		output(", causes you to cum, your feminine fluids spraying the jungle floor as your [pc.cum] ");
		if (pc.cumQ() < 500) output("trickles");
		else output("floods");
		output(" down Yoma’s throat.");
		output("\n\nAll things must come to an end though, and with one final loving lick, Yoma pulls himself away.");
		output("\n\n<i>“That was quite the time, [pc.name]!”</i> he says, muffled as he pulls his shirt back over his head, <i>“You should come back some time!”</i>");
	}
	else if (pc.hasCock()) {
		output(" your [pc.cocks], you’re more interested in getting oral than anything else right now.");
		output("\n\nYoma sticks his pink tongue out at you, but doesn’t complain as he pulls his hands away from his shorts, using them to beckon you closer.");
		output("\n\n<i>“Mm,”</i> he hums, nuzzling his face against your [pc.cocks], seeming to almost sniff at ");
		if (pc.cocks.length > 1) output("them");
		else output("it");
		output(", <i>“Lovely.”</i>");
		output("\n\nWell, that sounds like approval.");
		output("\n\nHe doesn’t waste much time, kissing at your [pc.thighsDescript] and ");
		if (pc.tone >= 50) output("toned ");
		output("stomach before taking the head of your [pc.biggestCockDescript] into his mouth, engulfing it in wet heat. His tongue slips past his lips, tracing the veins on your shaft deftly.");
		output("\n\nYoma drags his soft lips back up your [pc.cockNounBiggest], pulling away only to press messy kisses to your shaft")
		if (pc.balls > 0) {
			output(" before sliding down to give your [pc.balls] some attention");
			if (pc.balls > 1) output(", rolling them gently in his palms as he lathes the outside with his soft tongue");
			output(". One hand moves up to stroke your cock as he continues to lavish attention on them");
		}
		output(".");
		output("\n\nYou’re starting to get incredibly excited when he pulls away, and you swear he must be able to feel your heartbeat through your cock as he engulfs it again. He takes it deeper this time, deepthroating you ");
		if (pc.cLength(pc.biggestCockIndex(), true) >= 40) output(", that is, you feel your tip hit what his manufacturers must have thought was the absolute deepest his throat needed to go");
		else if (pc.cLength(pc.biggestCockIndex(), true) >= 20) output(", although it’s quite a struggle to take it all down");
		else if (pc.cLength(pc.biggestCockIndex(), true) >= 10) output(" with a little difficulty");
		else output(" without a hint of difficulty ");
		output(". This");
		if (pc.balls > 0) output(", combined with his hands caressing your [pc.ballsNoun],");
		output(" pushes you to orgasm, your [pc.cum] ");
		if (pc.cumQ() < 500) output("trickling");
		else output("flooding");
		output(" down Yoma’s throat.");
		output("\n\nAll things must come to an end though, and with one final loving lick, Yoma pulls himself away.");
		output("\n\n<i>“That was quite the time, [pc.name]!”</i> he says, muffled as he pulls his shirt back over his head, <i>“You should come back some time!”</i>");
	}
	else if (pc.hasVagina()) {
		output(" your [pc.vaginas], you’re more interested in getting oral than anything else right now.");
		output("\n\nYoma sticks his pink tongue out at you, but doesn’t complain as he pulls his hands away from his shorts, using them to beckon you closer.");
		output("\n\n<i>“I’m not quite accustomed to taking care of more feminine anatomy,”</i> he comments as he gracefully drops to his knees, <i>“but I shall try my best.”</i>");
		output("\n\nYou suppose that’s fair, but you’re not here for discussions about his preferences when he’s already on his knees, so you ");
		if (pc.isNice()) output("gently");
		else if(pc.isMischievous()) output("playfully");
		else output("roughly");
		output(" grab a handful of platinum dreadlocks, pulling him closer.");
		output("\n\n<i>“Patience, [pc.name], patience,”</i> he murmurs, pressing a kiss to your inner thigh, <i>“I will be right to it.”</i>");
		output("\n\nGood.");
		output("\n\nHe keeps trailing those kisses further and further up your thigh, ears flicking and swivelling towards you as you let out small, pleasured noises. Luckily, once he’s run out of thigh to kiss, he doesn’t tease you further, instead going straight for your bare cunt. One hand nudges the hood of your [pc.clit] out of the way while the other braces against your thigh as his soft, pink tongue attacks your lower lips. His tongue strikes your clit, barraging it with a wave of short, sharp licks that makes you moan loudly.");
		output("\n\nYou grip his ears, pulling him closer and gasping at the feeling of his lips pressing against your own. His response is to flatten his tongue out, giving you long, fast laps from base to clit that make you shudder violently. Eventually though, you pull him back up to your [pc.clit] and he hums against it. The vibrations bring you so much closer to the precipice, and when his tongue resumes its previous attacks on your button, you just don’t know how much longer you’re going to last.");
		output("\n\nYour orgasm hits suddenly, then all at once. Yoma even has to snake his hands around your [pc.thighsDescript] to stop you from toppling over - not that it stops him from his oral ministrations, he’s still working your [pc.vagina] all the way through your climactic high.");
		output("\n\nAll things must come to an end though, and with one final loving lick, Yoma pulls himself away, face drenched in your femcum.");
		output("\n\n<i>“That was quite the time, [pc.name]!”</i> he says, muffled as he pulls his shirt back over his head, <i>“Maybe you will come back and help me get more practice?”</i>");
	}
	output("\n\nYou think you will, you decide as the two of you ");
	if (!pc.isNude()) output("redress and ");
	output("say your goodbyes.");

	processTime(30+rand(15));
	pc.orgasm();
	IncrementFlag("YOMA_TIMES_ORALED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function yomaSexGiveOral():void
{
	clearOutput();
	showYoma(true);
	author("GothPastel");

	output("You wait for Yoma to finish stripping off before you gesture him closer, dropping to your knees in front of him. You look at his cute, human pussy and the heart shaped patch of hair above it almost hungrily.");
	output("\n\n<i>“Oh?”</i> He starts, <i>“You want to eat me out down there? Well, it would be rude to refuse you.”</i> He places his hand on your head, ")
	if (pc.hasEmoteEars()) output("but not before petting your ears gently, ");
	output("and pulls you closer.");
	output("\n\nHe’s already slightly wet, you notice, beads of translucent fluid clinging to his hairless outer lips, and you lap them up");
	if (pc.HP() <= pc.HPMax()) output(" noticing a faint but ignorable, mildly cherry flavoured, medicinal taste");
	output(". The android gasps quietly as your greedy tongue slips into his folds. That’s no good, you want him a <i>lot</i> louder than that.");
	output("\n\nYoma almost purrs as you press gentle kisses to his inner thighs, occasionally moving back up to flick lightly across his ever wettening slit. He can’t keep his cool forever, starting to let out rather deep mewls and moans whenever you hit a particularly sensitive spot. And his clit - void, his clit - you’ve not even touched it yet and it looks like it’s throbbing slightly, he’s so needy.");
	output("\n\n<i>“[pc.name], please,”</i> he begs, voice husky, and finally, finally you relent, pushing into him urgently.");
	output("\n\nHis thighs press against the side of your head in attempt to stabilize himself, shaky hands finding their way ");
	if (pc.hasHair()) output("into your [pc.hair]");
	else output("onto your head");
	output(" as he’s caught off guard by the sudden doubling of your efforts. You take his swollen clit into your [pc.mouthFull], sucking it gently at first, but soon, emboldened by the cries of pleasure he’s letting out, you step up the intensity.");
	output("\n\nVoid, he’s absolutely gushing.");
	output("\n\nAll of this is affecting you too, it’s hard not to be swept up in the moment with a cute android moaning out your name like this. You can feel");
	if(pc.hasGenitals())
	{
		if (pc.hasCock()) output(" your [pc.multiCockDescript] stiffening");
		if (pc.isHerm()) output(" and");
		if (pc.hasVagina()) output(" your [pc.vaginas] starting to leak");
	}
	else output(" a warmth rush to the empty expanse between your legs");
	output(". At this rate, Yoma isn’t the only one who’s going to get off here, you’re close to cumming");
	if (!pc.isNude()) output(" in your own [pc.lowerGarments]");
	output("!");
	output("\n\nYou ease off a bit in an attempt to calm yourself, pulling your mouth off his clit and hooking two fingers into his vagina, sliding them in and out gently until he shudders and you know you’ve found his g-spot. Your fingers stay in place as you return back to sliding your [pc.tongue] against his folds, circling his button. He mewls in approval, clearly loving the internal attention.");
	output("\n\nYour tongue lashes come long and slow for a while, waiting for Yoma to relax back into you, but the moment he does you strike.");
	output("\n\nYoma proves to be no match for the sudden attack on his clit, soon spasming in orgasm, but you’re not any better off. Despite your efforts to calm down earlier, you’re gasping out your own reciprocal orgasm");
	if (pc.hasGenitals()) {
		output(", soaking ");
		if (pc.isNude()) output("the jungle floor");
		else output("your lower garments");
		output(" in your ");
		if (pc.hasCock()) output("[pc.cumDescript]");
		else if (pc.hasVagina()) output("[pc.girlCumDescript]");
	}
	output(".");
	output("\n\nAfter a while, the two of you calm down enough ")
	if (!pc.isNude()) output("to redress, ")
	output("and head back on your separate ways.");

	if (pc.HPRaw <= pc.HPMax()) pc.changeHP(10);
	processTime(30+rand(15));
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasVagina()) pp.createVagina();
	pc.girlCumInMouth(pp);
	pc.changeLust(10);
	if (flags["YOMA_SEEN_NAKED"] == undefined) flags["YOMA_SEEN_NAKED"] = 1
	IncrementFlag("YOMA_TIMES_EATEN_OUT");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function yomaSexVaginal():void
{
	clearOutput();
	showYoma(true);
	author("GothPastel");

	var cIdx:int = pc.cockThatFits(500);
	if(cIdx < 0 && pc.hasCock()) cIdx = pc.smallestCockIndex();
	
	if (pc.isNude()) output("Already naked, you wait for Yoma to finish undressing before you step closer to him.");
	else if (pc.hasOnlyHLUndiesEquipped()) output("Already unclothed as much as possible for this act, you wait for Yoma to finish undressing before you step closer to him.");
	else output("You join Yoma in stripping off, carefully putting your "+ (pc.hasCock() ? "[pc.gear]" : "[pc.chestCovers]") +" somewhere you’ll be able to find them later and set down your codex.");
	output(" He looks you up and down before speaking, <i>“I can definitely show you a good time. How about you lie down?”</i>");
	output("\n\nThere’s no reason to protest, so you do so, clearing off the jungle floor so you don’t lie on anything sharp. The android grins, gently sitting down on your stomach, and you groan at the feeling of warm, wet cunt settling on top of you. Yoma takes "+ (pc.hasCock() ? "your [pc.cock " + cIdx + "] in a hand" : "the controls for the hardlight projector in your [pc.lowerUndergarment] with one hand") +", and you know enough about him now to tell that he’s grinning from the gentle swish of his tail.");
	output("\n\n<i>“This will do nicely,”</i> he says, "+ (pc.hasCock() ? "" : "flicking it on and ") +"giving it a firm few strokes. You groan, his soft palm caressing "+ (pc.hasCock() ? "you" : "the phantom cock") +" feels amazing.");
	output("\n\nIt doesn’t last long though, Yoma pulls his hand away from you - but not before giving your [pc.cockOrStraponHead " + cIdx + "] one last, teasing touch - and lifts himself up, positioning himself. Your "+ pc.legs(false,true) +" are easily pinned beneath his and he turns to you with a wide, teasing grin when you try and fail to buck your [pc.hips] up to penetrate the sweltering pussy rubbing itself against your tip.");
	
	pc.cockChange();
	
	output("\n\n<i>“I am in charge, [pc.name], I will take this at my own pace,”</i> he says, before turning back to the task at hand.");
	output("\n\nAt first, he seems content to tease you, strong legs holding you in place as you "+ (pc.hasCock() ? "leak pre into" : "mewl at the feeling of") +" his bare snatch, but he suddenly tenses up, letting out a loud moan, he’s caught his clit on you. That’s all it takes for him to stop, re-adjusting himself and rapidly impaling himself on your length with a gasp.");
	output("\n\n<i>“Sh-shit [pc.name] that... That is good,”</i> he forces out, already setting to bounce up and down, tail flicking from side to side rapidly.");
	output("\n\nIt’s good for you too. He’s so <i>tight</i>.");
	output("\n\nYoma doesn’t waste any time, riding you at a decent pace, the walls of his slit fitting to you like a glove and massaging your [pc.cockOrStrapon " + cIdx + "]. It’s absolutely heavenly, but not quite fast enough.");
	output("\n\nSitting forward, you take his wide hips in your hands and pull him down hard. His head tips back in a silent scream, his tail fluffing up.");
	output("\n\nDid he just... cum? Already?");
	output("\n\nThe slight flush you can make out on his face when he finally calms down and turns to look at you prove that he did. He shoots you a glare, but there’s an edge of playfulness in it. You’ve not <i>really</i> pissed him off.");
	output("\n\n<i>“I am going to have to redouble my efforts to get you off, am I not?”</i> he asks, and it’s the only warning you get before ")
	if (pc.tone >= 50) output("even ");
	output("your grip can’t hold him still. Yoma’s tail stands ramrod straight now, letting you get a glimpse of a very welcoming looking asshole, as he rapidly slams himself up and down on your "+ (pc.hasCock() ? "[pc.cockNounComplex " + cIdx + "]." : "fake dick."));
	if (pc.hasVagina()) output(" He doesn’t leave your "+ pc.vaginaNounDescript(pc.biggestVaginaIndex()) +" out either, reaching down between your legs to stroke your throbbing clit expertly, the sensation bringing you ever closer to orgasm.");
	output(" His hot, wet cunt grips you tight, and the fast, rippling motion brings you closer and closer to your climax.");
	output("\n\nEventually, you can’t hold back any longer and slam your hips up"+	(pc.hasKnot(cIdx) ? (", forcing your knot into him") : "") + (pc.hasCock() ? ", spraying cum into his waiting passage" : "") +" just as he peaks to a second orgasm, crying out loudly. ");
	if (pc.hasCocks() || pc.hasVagina()) {
		if (pc.cocks.length > 1) {
			output("Your other "+ (pc.hasCocks() ? "cocks unload" : "cock unloads") +" onto the jungle floor ");
			if (pc.hasVagina()) output("and [pc.girlCumDescript] ");
		}
		else if (pc.hasVagina()) output("[pc.GirlCumDescript] ");
		if (pc.hasVagina()) output("sprays over Yoma’s hand ");
		output("in your orgasm, and finally, finally your climax draws to a close.");
	}
	else output("Your bare nethers don’t bear any juices to signal your climax, but your asshole twitches until finally, finally it draws to a close.");
	if (pc.hasKnot(cIdx)) output("\n\nFor just a moment, he tries to pull himself back off your cock, but you hold him steady so that he doesn’t try and get your knot out until it goes down. Said deflation takes some time, what with Yoma’s pussy convulsing around you even now. At some point you sit up to wrap your arms around his waist, pressing gentle kisses to his neck. Eventually though, your knot goes down just enough for him to safely get off it and you release him.");
	output("\n\nYour hips are <i>soaked</i>, you realize as he pulls himself up. You had no idea just how wet he was!");
	output("\n\n<i>“You might need a towel, [pc.name].”</i> Yoma manages to pant out as he pulls his shirt back on, but he doesn’t produce one; not that you were expecting him to have it in the middle of the jungle.");
	if (!pc.isNude() && !pc.hasOnlyHLUndiesEquipped()) output("\n\nIt doesn’t take long to put back on your "+ (pc.hasCock() ? "[pc.gear]" : "[pc.chestCovers]") +" and the");
	else output("The");
	output(" two of you soon say your goodbyes.");

	processTime(30+rand(15));
	pc.orgasm();
	pc.applyPussyDrenched();
	if (flags["YOMA_SEEN_NAKED"] == undefined) flags["YOMA_SEEN_NAKED"] = 1
	IncrementFlag("YOMA_TIMES_VAGINAL");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function yomaSexCocktail():void
{
	clearOutput();
	showYoma(true);
	author("GothPastel");

	output("Your tail has been acting up recently with no relief to be found, but it looks like you’ve just found the perfect victim. Seemingly sensing your thoughts, it coils itself around your hip, in plain view of the fennec android.");
	output("\n\n<i>“A parasitic lifeform?”</i> he asks, curiously, <i>“That is certainly interesting... It is not contagious, is it?”</i>");
	output("\n\nYou allay his fears, telling him you had to almost force it to join with you in the first place and if he can’t get pregnant, he’s not going to be spreading it anywhere.");
	output("\n\n<i>“Hm,”</i> he still doesn’t look convinced, but soon relents, <i>“I suppose it would be a new experience.”</i>");
	output("\n\nIt would be, you tell him stepping closer, your [pc.tailCock] also shuffling closer to him.");
	output("\n\nYoma hums again, reaching out to take it in a hand and you groan, contact at last. He grins up at you, giving it a few strokes until a little precum splashes into his hand and he lets go, lifting his hand to his face to give it a taste.");
	output("\n\n<i>“Citrus?”</i> he muses, <i>“I was expecting something a bit more herbal. But this? This is much better.”</i>");
	output("\n\nYou ask if that means he’s going to give this a go.");
	output("\n\n<i>“Oh, absolutely,”</i> he agrees, hooking his thumbs back into his shorts again, pulling them off, treating you to a very nice view of his soft, human pussy and a cute little love heart shape of hair above it. <i>“So, how do you want me?”</i> he asks, green eyes half lidded.");
	output("\n\nAfter a moment of consideration, you tell him to stand against the nearest tree, ass facing you. He does it without a moment’s hesitation, putting his hands against it and lifting his tail out of the way. You don’t waste a moment, ");
	if (!pc.isNude()) output("stripping off your clothes and" );
	output("stepping closer, taking his hips in your hands. Your cockvine snaps to attention, tucking itself through your legs to brush against your ");
	if (pc.hasVagina()) output("own [pc.vaginasNounSimple]");
	else output("[pc.assholeSimple]");
	output(" for just a little extra stimulation, and wastes no time in sliding against his sweltering cunt.");
	output("\n\nSliding in only takes a moment, his folds spreading willing and eager.");
	output("\n\n<i>“A-ah!”</i> he yelps, taken by surprise as your tail starts to thrust away of its own volition, <i>“Oh, it feels very similar to a real cock!”</i>");
	output("\n\nWell, of course, void, most people can’t tell the difference, you tell him.");
	output("\n\n<i>“I am an android, [pc.name], of course I ca-”</i> he starts, but a particularly hard thrust from your tail cuts him off entirely.");
	output("\n\nFuck, that’s good. The parasite attached to you shoots wave after wave of pleasure up your spine and you buck your hips forward. The two of you moan out in unison, Yoma as the parasite pushes hard against his simulated G-spot, and you as it rewards you with a flow of ecstasy that goes straight to your ");
	if (pc.hasCock()) output("[pc.cocksLight]");
	else if (pc.hasVagina()) output("own [pc.vaginasLight]");
	else output("lower regions");
	output(".");
	output("\n\nYou have no idea how long the two of you are at it, the pleasure coursing through you blurs your judgement, but unfortunately it can’t last forever. The rubbing of your long tail against your ");
	if (pc.hasVagina()) output("[pc.vaginasNounSimple]");
	else output("[pc.assholeSimple]");
	output(" starts to become erratic, along with the rhythm of its thrusting.");
	output("\n\nYoma goes first, his cunt spasming around your cocktail, and that’s all it can take, soon unloading it’s citrusy payload into the android’s waiting channel.");
	if (pc.hasGenitals()) {
		output("Your non-parasitic genitals follow soon after, spraying ");
		if (pc.hasCock()) output("[pc.cumDescript]");
		if (pc.hasCock() && pc.hasVagina()) output(" and ");
		if (pc.hasVagina()) output("[pc.girlCumDescript]");
		output(" everywhere.");
	}
	output("\n\nContent that it’s done its job, your tail retreats back to its usual position behind you, and you keep your hands on Yoma’s hips to steady him. Not that he needs it though, the android isn’t exactly programmed to lose his balance.");
	output("\n\nAfter a while, the two of you settle enough to separate, and you soon find yourself handing Yoma his clothes");
	if (!pc.isNude()) output("and being handed your own back");
	output(".");
	if (flags["YOMA_TIMES_TAILFUCKED"] == undefined) output("\n\n<i>“Thank you for the new experience, [pc.name], I hope to see you around!”</i>");
	output("\n\nAfter a while of small talk, the two of you go on your separate ways, not without waving each other off, of course.");

	processTime(30+rand(15));
	pc.orgasm();
	if (flags["YOMA_SEEN_NAKED"] == undefined) flags["YOMA_SEEN_NAKED"] = 1
	IncrementFlag("YOMA_TIMES_TAILFUCKED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function yomaSexTribbing(onADate:Boolean=false):void
{
	clearOutput();
	showYoma(true);
	author("GothPastel");

	var vIdx:int = pc.biggestVaginaIndex();

	if (!onADate) {
		output("You coo in appreciation as Yoma allows his shorts to slip off, looking on in delight as he bends over to lay it and his shirt carefully across the ground as a makeshift sheet, unintentionally (or maybe intentionally) giving you a glimpse of wetness trickling down his inner thigh from his hot pink cunt as his tail swishes ever so slightly to the side. You soon"+ (pc.isNude() ? "" : " strip and") +" join him, shifting so you’re lying on your back, the android’s dextrous digits exploring your form.");
		output("\n\n");
	}
	output("One of Yoma’s hands ");
	if (pc.hasCock()) output("ignores your "+ (pc.hasCocks() ? "[pc.multiCocks]" : "[pc.cockNounComplex]") +" entirely and ");
	output("pushes against your [pc.vagina " + vIdx +"], a long finger pushing its way gently into your already wet entrance as the others tease your [pc.clits] out of "+ (pc.totalClits() > 1 ? "their hoods." : "its hood."));
	output("\n\nOh - that gives you an <i>idea</i>.");
	output("\n\nYou pull away from his hands, laughing breathily as his ears twitch in slight confusion, before sitting back and threading your legs with his so as to press your wet [pc.vaginaNoun " + vIdx +"] against his. Getting the hint, the android pushes himself up until he’s sitting propped up with his hands just behind you. [pc.OneClit] pushes against his own, and he lets out a quiet, pleasured moan.");
	output("\n\nTaking the lead, you begin to shift, sliding your cunt over his in a gentle, humping motion. He’s a little clumsy at first, clearly not used to an action such as this - but his designation as a companion droid seems to aid him along and he soons takes to it.");
	output("\n\nDespite his mechanical composition, Yoma’s flesh is delightfully soft against your own, your passage over each other smooth, soon lubricated by both your mixed juices and the sweat trickling down your inner thighs. The two of you lose yourselves easily to the rhythm, thrusting to the frantic pace of your thundering heartbeat.");
	output("\n\nYou feel yourself peaking towards a climax soon, all too soon, ");
	if (pc.hasCock()) output("even your neglected [pc.cocks] standing to attention, pre gathering on "+ (pc.hasCocks() ? "their" : "its") +" [pc.cockHeadsNoun] ");
	output("but a single, terrible second before you can manage, Yoma pulls back. The android leans over you, catching both your wrists lightly in one of his hands and smiling that <i> grin </i> of his at you in a way that just confirms it - he’s intentionally edging you. A few moments later and your whining is completely out of your control as he closes back in gently, you’ve calmed down just a little, and the cycle begins anew.");
	output("\n\nHe brings you to the edge, over and over, each time more torturous to the last until the both of you can take it no more and he pushes hard against you. His clit catches on yours once more, his own soft cry of pleasure completely drowned out under your own <i>scream</i> of delight as finally, finally you tumble over that peak, your [pc.girlcum] ");
	if (pc.vaginas[vIdx].wetness() < 3) output("dribbling");
	else if (pc.vaginas[vIdx].wetness() < 5) output("pouring");
	else output("flooding");
	output(" from your [pc.vaginas]. ");
	if (pc.hasCock()) output("A fraction of a second later your "+ (pc.hasCocks() ? "cocks spurt their" : "cock spurts its") +" payload in an arc, coating you both with yet more sex juices. ");
	output("The relief - oh the <i>relief</i> is so long coming that you barely catch a moment of overglow before passing out entirely.");
	output("\n\nIt takes you a few minutes to come back to your senses, but when you do, you’re laying a pool of your mixed juices, cuddled into Yoma’s flat chest.");
	output("\n\n<i>“I think I rather overdid that, [pc.name]. I do hope - are you quite alright now?”</i> he speaks, tone a little hushed, worried almost.");
	output("\n\nYou assure him you’re feeling fine, you were just overstimulated for a moment, but you’ve recovered now. The companion droid relaxes, releasing you after pressing a light kiss to your forehead.");
	output("\n\n<i>“We have made something ");
	if (pc.vaginas[vIdx].wetness() > 5 || pc.cumQ() >= 1000) output("- more than something, if we are being honest - ");
	output("of a mess, [pc.name]. ");
	if (onADate) {
		output("Feel free to return to piloting, I may join you once I have refreshed your sheets.”</i>");
		output("\n\nHis tone allows no argument that’d let you stay and help " + (pc.isAss() ? "- not that you would’ve - " : "") +"and" + (pc.isNude() ? "" : ", once you’ve redressed,") +" you leave him to it, heading back to the cockpit.");
	}
	else {
		output("Now would be an opportune moment to find some sort of river to clean up in.”</i>");
		output("\n\nHis tone allows no argument to the contrary, and the two of you soon clean yourselves up before parting ways again.");
	}

	processTime(30+rand(15));
	pc.orgasm();
	pc.applyPussyDrenched();
	IncrementFlag("YOMA_TIMES_TRIBBED");
	clearMenu();
	if (onADate) addButton(0,"Next",yomaFirstDateOutro);
	else addButton(0,"Next",mainGameMenu);
}

public function yomaSexAnal(onADate:Boolean = false):void
{
	clearOutput();
	showYoma(true);
	author("GothPastel");

	var cIdx:int = pc.cockThatFits(300);
	if(cIdx < 0) cIdx = pc.smallestCockIndex();

	if (!onADate) {
		output("Yoma spreads his quickly dropped shorts on the ground, shirt joining it soon after, before gently pushing you down"+ (pc.isNude() ? "" : " - after you’ve stripped off -") +" onto the makeshift cover from the hard ground.");
		output("\n\nHe joins you, leaning over, and one");
	}
	else output("One");
 	output(" of Yoma’s hands ");
	if (pc.hasCock()) output("ghosts over your [pc.cock " + cIdx + "] and he hums, pulling");
	else output("finds the controls for your hardlight equipped [pc.lowerUndergarment] and he hums briefly, before flicking it on, stroking the virtual cock gently as it grows to its full size. He");
	output(" back enough to look you in the eyes, trademark grin perhaps a little shyer than usual.");
	output("\n\n<i>“[pc.name]...”</i> he practically purrs out, ");
	if (flags["YOMA_TIMES_ANALED"] == undefined) {
		output("<i>“I do not believe I have let you penetrate me anally before.”</i>");
		output("\n\nHuh, he’s right. ");
	}
	else {
		output("<i>“Shall we have a repeat performance?”</i>");
		output("\n\n");
	}
	output("You smirk, fumbling about for some lubricant that your partner soon hands you, and go to coat your fingers. Yoma stops you though, explaining. <i>“I am an android, [pc.name]. Your willingness to spend time on fingering is admirable, but also entirely unnecessary - I can easily adjust to accommodate without pain."+ (pc.hasCock() ? "”</i>" : " Besides, hardlight implements are not designed to be... Hard to take.”</i>"));
	output("\n\nYou flush, embarrassed, and the robot snickers, amused, before taking the lube back from you to pour a decent amount over your ");
	if (pc.hasCock()) {
		output("[pc.cock " + cIdx + "]");
		if (pc.hasCocks()) output(", giving your "+ (pc.cocks.length > 2 ? "other cocks" : pc.cockNounComplex(pc.biggestCockIndex())) +" a sympathetic pat that lets you know that " + (silly ? "the author doesn’t want to write" : "he’s not interested in") +" double penetration today");
	}
	else output("strapon");
	output(". He wraps a hand around it and you groan, "+ (pc.hasCock() ? "" : "synthetic ")+"erection straining further as he ensures an even coating - his grip so masterful that you "+(pc.WQ() > 80 ? "almost " : "")+"whimper at the loss of his touch when he releases you"+ (pc.hasCock() ? "." : ", your brain already successfully registering the toy like it would a normal cock."));
	output("\n\nOf course, you’re not left disappointed for long. Yoma shuffles to straddle your waist, hovering over your groin, and you take your " + (pc.hasCock() ? "[pc.cock " + cIdx + "]" : "false cock") +" in one hand, helping him line it up until it presses perfectly against his pucker. " + (silly ? "You sigh, knowing that a certain someone is smiling over a successful use of alliteration. " : "") +"His complexion flushes just a little darker for a moment, cautious, before he begins to ever-so-slowly lower himself down your shaft.");
	
	pc.cockChange();

	output("\n\n<i>Fuck</i>, that’s good. Whilst his tightness and warmth is certainly enough to provide intense feeling by themselves, you’re instantly made aware of a subtle ribbing to his passage, stimulating your "+ (pc.hasCock() ? "[pc.cockNoun " + cIdx + "]" : "addition") +" in ways an organic partner never could.");
	if (!pc.hasCock()) output(" Void, you almost want a real cock to fuck him with.");
	output("\n\nYou can barely wait for him to sink all the way down to your "+ (pc.hasCock() ? "[pc.knot " + cIdx + "]" : "base") +" at his own pace, jerking your hips upwards to impale him fully, smirking at his gasp.");
	output("\n\n<i>“[pc.name]!”</i> he whines out, pouting at you. Noticing the amused glint in his eyes though, you just laugh, twitching your hips up again. The noise he makes is almost a mewl, and he leans forwards, bracing his hands on the bed either side of your shoulders.");
	output("\n\nOnce he’s recovered sufficiently though, you lose all hope of retaining your dominance over the situation.");
	output("\n\n<i>“Now then, how about you settle down - just a little. I am not used to this particular action,”</i> he states, pulling back up off your "+ (pc.hasCock() ? "[pc.cockNounComplex " + cIdx + "]" : "[pc.hardlightCock]") +". You can’t stop yourself from jerking your hips up again as he sinks down, but to your horror, he just grins and pulls back up before you can bottom out. <i>“No, we really cannot have that, [pc.name]! This happens by my pace, or not at all.”</i>");
	output("\n\nGrumbling, you agree to double your efforts to stay still and the android pats your head affectionately" + (pc.hasEmoteEars() ? " making sure to scratch behind your ears in a way that never fails to make you relax" : "") +". <i>“Much better.”</i>");
	output("\n\nThe next attempt goes better than the prior, Yoma actually manages to settle into a rhythm fast enough to get your heart racing"+ (pc.hasCock() ? " and shaft throbbing" : "") +", but it doesn’t last - the pleasure from the subtle ribbing wears away at your self restraint until you just can’t help it, thrusting in as far as you can manage. Despite your protests, he pulls up again, shaking his head in amusement at you.");
	output("\n\n<i>“Let us try that again.”</i>");
	output("\n\nAnd try the two of you do. It takes several attempts, each more frustrating than the last, until finally, finally you cum");
	if (pc.hasVagina()) output(" - soaking your sheets with [pc.girlCum]"+ (pc.hasCock() ? " to add to the mess your cock is unloading" : ""));
	else if (!pc.hasGenitals()) output(" - empty nether regions flushing with intense heat");
	output(", your partner sinking down to your base and orgasming in sympathy"+ (pc.hasCock() ? " at the feeling of being filled with hot [pc.cumType]." : "."));
	output("\n\nOnce you’ve settled");
	if (pc.hasKnot(cIdx)) output(" and your knot deflates enough");
	else if (!pc.hasCock()) output(" and removed your spoiled underclothes");
	output(", Yoma gently pulls off to flop beside you, cuddling into you briefly before he sits up again, planting a kiss on your forehead.");
	output("\n\n<i>“We will have to do that again, [pc.name],”</i> he murmurs. You nod, completely in agreement, before Yoma offers a hand to pull you back up. ");
	if (onADate) {
		output("<i>“You do need to fly us home, unfortunately. Now go, I may join you once I have refreshed your sheets.”</i>");
	output("\n\nHis tone allows no argument that’d let you stay and help "+ (pc.isAss() ? "- not that you would’ve - " : "") +"and" + (pc.isNude() ? "" : ", once you’ve redressed,") +" you leave him to it, heading back to the cockpit.");
	}
	else {
		output("<i>“Unfortunately, I do believe you have places to be.”</i>");
		output("\n\nYou agree reluctantly, and"+ (pc.isNude() ? " he redresses" : " you and he redress") +", the two of you soon parting ways.");
	}

	processTime(30+rand(15));
	pc.orgasm();
	IncrementFlag("YOMA_TIMES_ANALED");
	clearMenu();
	if (onADate) addButton(0, "Next", yomaFirstDateOutro);
	else addButton(0,"Next",mainGameMenu);
}


public function yomaSexGetFingered(onADate:Boolean=false):void
{
	clearOutput();
	showYoma(true);
	author("GothPastel");

	if (!onADate) {
		output("You suggest a repeat of New Texas... Without the nearly dying bit. Your companion doesn’t need to think twice about the comment, visibly amused at that.");
		output("\n\n“I always appreciate not dying. Race you?” He barely has the final syllable out before he’s off, sprinting ahead of you."+ (pc.RQ() > 80 ? " You easily outstrip him though, regardless of the advantage he has." : ""));
		output("\n\nBefore you know it, you’re");
	}
	else output("You’re");
	output(" sweating like some kind of animal, pinned against the wall of your shower as Yoma fumbles for the controls with his spare hand. You gasp and pant as he breaks the messy, adrenaline-comedown inspired liplock you’re sharing.");
	output("\n\n<i>“"+ (flags["YOMA_TIMES_FINGERED"] != undefined ? "As you know, " : "") +"I am waterproof - this is fine. I will not accidentally electrocute you "+ (pcIsPainslut() ? "though something tells me you might enjoy that" : "")+ ".”</i>");
	output("\n\nYou laugh breathily, kissing him again to shut him up. He takes the hint, flicking the shower on"+ (PCShipIsCasstech() ? " - snickering at the way you jump as the water comes out freezing cold, though it soon warms up" : "") +". You can feel your sweat being wicked away by the steaming flow, and Yoma begins helping, lathering his hands up with soap and humming gently as he begins cleaning you off.");
	output("\n\nOf course, he’s not subtle about your shared desire for physical intimacy"+ (onADate ? " after your near miss earlier" : "") +". His hands are hot and heavy, lingering far longer on your [pc.chest], ");
	if (pc.isHerm()) output("[pc.cocks], [pc.vaginas]");
	else if (pc.hasVagina()) output("[pc.vaginas]");
	else output("[pc.cocks]");
	output(" and [pc.butt] to have any hope of appearing chaste.");
	output("\n\nNaturally, you return the favour. Synthetic skin with its lack of sweat doesn’t require nearly as much care as your own, but this gives you an opportunity to explore, your hands roaming freely. You find that, if you press just a little harder than you should, you can just about feel the metal, inhuman skeleton - but then Yoma’s fingers press against "+ (pc.hasVaginas() ? "one of" : "") +" your ");
	if (pc.hasVaginas()) output("wet entrances");
	else if (pc.hasVagina()) output("wet entrance");
	else output("anus");
	output(" and any other thoughts go blank.");
	if (pc.hasVagina()) {
		output("\n\nHe doesn’t waste any time, his hands already more than slick enough from the water and aided by your " + (pc.girlCumQ() < 500 ?"trickling" : "gushing") +" natural wetness, curling up into your passage.");
		output("\n\nLong, slim fingers are best for this type of work, easily questing about "+ (pc.looseness(pc.biggestVaginaIndex()) < 3 ? "despite your tightness " : "") +"and finding your most sensitive spots. You pull him back in to another sloppy kiss, moaning into him as he finds that perfect spot within you, deft digits working you - no - <i>playing</i> you like a void-damned fiddle.");
		output("\n\nHe doesn’t stay focused on it for long though, taking an opportunity to explore your passage "+ (pc.vaginalCapacity(pc.biggestVaginaIndex()) < 150 ? ", but being careful not to stretch you too far" : "") +", probing your depths. Hell, he gets deep enough into you to grind the heel of his palm against your [pc.oneClit], an action that causes you to break your kiss again, keening loudly.");
		output("\n\nYou try reaching down to touch him back, but he slaps your hands away lightly with his unoccupied one, clearly intending for this to be solely about you, and your pleasure. Instead, you find your hands ");
		if (pc.biggestTitSize() >= 1) {
			output("playing with your [pc.breasts " + pc.biggestTitRow() + "] and ");
			if (pc.hasFuckableNipples()) output("fingers slipping into your breasts’ hidden cavities");
			else output("tweaking your [pc.nipples " + pc.biggestTitRow() + "]");
		}
		else output("scrabbling at the slick shower wall behind you");
		output(", just to find something to occupy them with.");
		output("\n\nYou’re completely at Yoma’s mercy and he knows it. Frenzied kissing turns into almost <i>harsh</i> nips at your neck and shoulders, " + (pcIsPainslut() ? "only spurring your arousal on further" : "though you’re too far gone to mind,") + " as he picks up his pace, moving back to that one spot inside you and thrusting against it roughly.");
		output("\n\nThe other hand finds your [pc.oneClit], giving it a more personal touch than the heel of the other was, ");
		if (pc.clitLength < 1) output("pushing back the hood easily to stimulate the sensitive flesh even better.");
		else if (pc.clitLength < 4) output("stroking it like the miniature cock it resembles.");
		else output("jerking it off like the proud psuedopenis it is.");
		if (pc.hasCock()) output(" Much as your [pc.cocks] "+ (pc.hasCocks() ? "go ignored, they leak" : "goes ignored, it leaks") +" pre like a fountain, making every action slipperier and wetter than you ever thought possible.");
	}
	else {
		output("\n\nHe doesn’t waste any time, his hands already more than slick enough from the water to"+ (pc.ass.wetness() > 0 ? ", aided by your unnatural wetness," : "")+ " curl up into your passage.");
		output("\n\nLong, slim fingers are best for this type of work, easily questing about " + (pc.ass.looseness() < 3 ? "despite your tightness " : "") +"and finding your most sensitive spots. You pull him back in to another sloppy kiss, moaning into him as he finds that perfect spot within you, deft digits working you - no - <i>playing</i> you like a void-damned fiddle.");
		output("\n\nHe doesn’t stay focused on it for long though, taking an opportunity to explore your passage "+ (pc.analCapacity() < 150 ? ", but being careful not to stretch you too far" : "") +", probing your depths. Hell, he gets deep enough into you to grind the heel of his palm against your perineum, an action that causes you to break your kiss again, keening loudly as your prostate is stimulated once more.");
		output("\n\nYou try reaching down to touch him back, but he slaps your hands away lightly with his unoccupied one, clearly intending for this to be solely about you, and your pleasure. Instead, you find your hands ");
		if (pc.biggestTitSize() >= 1) {
			output("playing with your [pc.breasts " + pc.biggestTitRow() + "] and ");
			if (pc.hasFuckableNipples()) output("fingers slipping into your breasts’ hidden cavities");
			else output("tweaking your [pc.nipples " + pc.biggestTitRow() + "]");
		}
		else output("scrabbling at the slick shower wall behind you");
		output(", just to find something to occupy them with.");
			output("\n\nYou’re completely at Yoma’s mercy and he knows it. Frenzied kissing turns into almost <i>harsh</i> nips at your neck and shoulders, " + (pcIsPainslut() ? "only spurring your arousal on further" : "though you’re too far gone to mind,") + " as he picks up his pace, moving back to that one spot inside you and thrusting against it roughly.");
		output("\n\nThe other hand finds your [pc.cockBiggest], giving it a slippier and wetter handjob than you ever thought possible, pre " + (pc.cumQ() < 500 ?"trickling" : "streaming") +" from your [pc.cockHeads].");
	}
	output("\n\nIt’s not long before you’re crying Yoma’s name to the heavens - or at least the ceiling - cumming hard enough that your vision goes blank as your eyes roll back into your head. It doesn’t stop your robotic companion, of course, as he continues to finger your "+ (pc.hasVagina() ? "cunt" : "backdoor") +" all the way through your orgasm.");
	output("\n\nThe steady flow of water has cleared away all evidence of the tryst by the time your vision returns to you, Yoma’s fingers sliding out of you gently.");
	output("\n\nIt doesn’t take long for you to gather your equipment back together"+ (pc.isNude() ? "" : " and redress") +", soon "+ (onADate ? "plotting a course back to Mhen’ga." : "parting ways."));

	processTime(30+rand(15));
	pc.orgasm();
	IncrementFlag("YOMA_TIMES_FINGERED");
	clearMenu();
	if (onADate) addButton(0,"Next",yomaSecondDateOutro);
	else addButton(0,"Next",mainGameMenu);
}

public function yomaHugsI():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	output("It’s getting late, you notice, barely stifling a yawn. Yoma’s large ears swivel, catching the sound and he speaks, <i>“Are you tired, [pc.name]?”</i>");
	output("\n\nNow that he mentions it, yeah, you are.");
	output("\n\nHe smiles, wrapps an arm around your ");
	if (pc.tallness >= 53) output("shoulders");
	else output("waist");
	output(" and pulls you in. <i>“Do not worry, you can stay with me for the night, if you would like,”</i> he suggests. He sounds genuine.");
	output("\n\nThat honestly seems like a good plan right now, so you nod, letting him sit you down against a tree, his arm still around you. You push into him, wrapping your arms around his thin waist and leaning your head into his neck, stifling a giggle as a dreadlock brushes across your skin. He smells of cinnamon and woodsmoke, not something you were expecting from an android. The scent is relaxing, lulling you into letting your body lose all tension.");
	output("\n\n<i>“That is it,”</i> he murmurs, <i>“You can fall asleep if you want to, I will watch over you.”</i>");
	output("\n\nYou might just do that, but before you forget, you gently take the end of his tail, tugging it towards you. Yoma takes the hint, flopping it over you like a fluffy, platinum blond blanket. <i>“Get some rest,”</i> he says, air tickling your cheek as he whispers in your ear.");
	output("\n\nYou let your eyes drift shut, unable to stop a ");
	if (pc.isAss()) output("hint of a ");
	output("smile spreading across your features as you feel his long fingers card ");
	if (pc.hasHair()) output("through your hair");
	else output("across your scalp");
	output(". It’s not long before you fall asleep completely.");

	processTime(420+rand(60));
	sleepHeal();
	clearMenu();
	addButton(0,"Next",yomaHugsII);
}

public function yomaHugsII():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	output("You wake up several hours later to Yoma grinning down at you, trilling out a, <i>“Good morning, [pc.name]!”</i>");
	output("\n\nIt takes a little effort, but you soon extricate yourself from the android’s grip, climbing to your feet. Morning? It’s barely daybreak, you grumble ");
	if (!pc.isAss()) output("goodnaturedly");
	output(", but he laughs you off, getting to his feet too.");
	output("\n\n<i>“I will see you around again, soon hopefully,”</i> he says, waving you off. The grin takes a little while to fade from your face, definitely sticking around longer than Yoma did. Void, you’re <i>still</i> comfortable, even now.");

	processTime(3);
	IncrementFlag("YOMA_TIMES_HUGGED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function yomaAtBurtsAddendum(btnSlot:int):void
{
	output("\n\nUnusually, you see Yoma leaned up against the bar. Whilst he’s trying to stay casual, he’s shuffling his feet, and his ears keep swivelling towards the door. When he sees you enter, he straightens up, waving in your direction. Was he waiting for you"+ (flags["YOMA_DATE_PROGRESS"] != undefined ? " again?" : "?"));
	addButton(btnSlot, "Yoma", yomaDateRouter, undefined);
}

public function yomaCanAppearAtBurts():Boolean {

	var currentDay:int = Math.floor(GetGameTimestamp() / 24 / 60);

	// either canceled or finished the dates
	if (flags["YOMA_DATE_PROGRESS"] == -1 || flags["YOMA_DATE_PROGRESS"] == 6) return false;
	// never had sex with Yoma, didnt talk about his Master or never played a game with him
	if ((flags["YOMA_SEEN_NAKED"] == undefined && flags["YOMA_TIMES_ORALED"] == undefined) || flags["YOMA_TALKED_ABOUT_MASTER"] == undefined || flags["YOMA_GAMES_PLAYED"] == undefined) return false;
	// finished first date, but didnt unlock NV
	if (flags["YOMA_DATE_PROGRESS"] >= 2 && !newTexasCoordinatesUnlocked()) return false;
	// finished second date, but didnt unlock Uveto
	if (flags["YOMA_DATE_PROGRESS"] >= 4 && !uvetoUnlocked()) return false;
	// if none of the other conditions apply, have a 50% chance every day
	if (flags["YOMA_BAR_DATE"] == undefined || flags["YOMA_BAR_DATE"] < currentDay) {
		flags["YOMA_BAR_DATE"] = currentDay;
		if (rand(2) == 0) flags["YOMA_AT_BAR"] = 0;
		else flags["YOMA_AT_BAR"] = 1;
	}
	if (flags["YOMA_AT_BAR"] == 1) return true;
	return false;
}

public function yomaWaitingAtBurts():Boolean
{
	if (flags["YOMA_DATE_PROGRESS"] == 1 || flags["YOMA_DATE_PROGRESS"] == 3 || flags["YOMA_DATE_PROGRESS"] == 5) return true;
	return false;
}

public function yomaExploringTheJungle():Boolean
{
	if (yomaWaitingAtBurts()) return false;
	else if (pc.hasStatusEffect("Yoma Cooldown")) return false;
	return true;
}

public function yomaCooldown(disappointedYoma:Boolean = false):void
{
	if (disappointedYoma) pc.createStatusEffect("Yoma Cooldown", 0, 0, 0, 0, true, "", "", false, 7 * 24 * 60);
	// cut the cooldown by 50% if lovers
 	else if (flags["YOMA_RELATIONSHIP"] == 1) pc.createStatusEffect("Yoma Cooldown", 0, 0, 0, 0, true, "", "", false, 3 * 60);
	else pc.createStatusEffect("Yoma Cooldown", 0, 0, 0, 0, true, "", "", false, 6 * 60);
}

public function yomaDateRouter():void {
	switch(flags["YOMA_DATE_PROGRESS"])
	{
		case undefined:
		case 0:
		case 1:
			yomaFirstDate();
			break;
		case 2:
		case 3:
			yomaSecondDate();
			break;
		case 4:
		case 5:
			yomaThirdDate();
			break;
	}
}

public function yomaFirstDate():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	if (flags["YOMA_DATE_PROGRESS"] == undefined) {
		output("You approach the android, asking what brings him out of his usual lair.");
		output("\n\n<i>“I was...”</i> he starts, before pausing, fidgeting with a loose dreadlock. Is he nervous? "+(flags["BESS_LOVER"] == 1 ? "" : "Can androids even manage that? ")+"Regardless, he soon continues. <i>“Well, actually I was looking for you, [pc.name]!”</i> It takes you by surprise, just a little. Just what could Yoma want from you?");
		output("\n\n<i>“This is my first long stay away from home. I am slightly embarrassed to admit it, but I am what you would call homesick.”</i> "+(pc.isNice() ? "You assure him that it’s nothing to be ashamed of, but you have to ask, w" : "W")+"hat does he expect you to do about it?");
		output("\n\n<i>“I have considered, and I believe it would be sensible if I were to allay this strange loneliness by spending time with someone I am familiar with. I have been in contact with Master, but there is only so much that can be done when not in person. I hope you are not offended to learn that you are my secondary choice, [pc.name].”</i> ");
		if (flags["YOMA_SEEN_NAKED"] != undefined || flags["YOMA_TIMES_ORALED"] != undefined) output("You are a little miffed, but you suppose second place isn’t all that bad.");
		else output("Is he asking you on a date?");
		output("\n\nThe android looks to the side, tail curling over his legs as you ask, clearly embarrassed. <i>“I would suppose so,”</i> he starts, voice a little quieter than usual, as if he doesn’t really want to admit it. <i>“Yes. If you would be interested, that is.”</i>");
		output("\n\nWell, are you?");
		processTime(5);
	}
	else {
		output("You approach the android again, and he perks up.");
		output("\n\n<i>“Have you reconsidered, [pc.name]?”</i>");
		output("\n\nWell, have you? What’s your decision?");
		processTime(2);
	}
	clearMenu();
	addButton(0,"Yes",yomaFirstDateProceed,undefined);
	addButton(1,"Later",yomaDateComeBackLater,undefined);
	addButton(2,"No",yomaDontDateTheAndroid, undefined, "No", "<b>WARNING:</b> This <i>will</i> lock you out of a good deal of future content.");
}

public function yomaDontDateTheAndroid():void
{
	clearOutput();
	showYoma();
	author("GothPastel");
	
	output("You tell Yoma that you’d really rather not.");
	output("\n\nHis ears droop, a disappointed expression spreading onto his face, but he nods. <i>“That is fine, [pc.name]. I will be off, then.”</i> He flashes you a faint smile as he straightens himself up and leaves, perhaps trying to show that he doesn’t hold anything against you.");

	processTime(2);
	flags["YOMA_DATE_PROGRESS"] = -1;
	// reset jungle encounter
	yomaCooldown();

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function yomaDateComeBackLater():void
{
	clearOutput();
	showYoma();
	author("GothPastel");
	
	switch(flags["YOMA_DATE_PROGRESS"])
	{
		case undefined:
		case 0:
		case 1:
			output("You tell Yoma that you’d like that, but you’re too busy right now"+(flags["YOMA_DATE_PROGRESS"] == 1 ? "and just wanted to check that the offer still stood." : "."));
			output("\n\n<i>“Oh - that is perfectly fine with me, [pc.name] - I will remain here until you are ready.”</i> You thank him, and he flashes you a grin as you leave.");
			flags["YOMA_DATE_PROGRESS"] = 1;
			break;
		case 2:
		case 3:
			output("You tell Yoma that you’d like that, but you’re too busy right now"+ (flags["YOMA_DATE_PROGRESS"] == 3 ? "and just wanted to check that the offer still stood." : "."));
			output("\n\n<i>“Oh - that is perfectly fine with me, [pc.name] - I will remain here until you are ready.”</i> You thank him, and he flashes you a grin as you leave.");
			flags["YOMA_DATE_PROGRESS"] = 3;
			break;
		case 4:
		case 5:
			output("You let Yoma know that, whilst you’d love to come, you’re not properly equipped for frozen wasteland exploration right now" +(flags["YOMA_DATE_PROGRESS"] == 5 ? " and just dropped in to check on him." : "."));
			output("\n\n<i>“I will wait here until you are then, [pc.name],”</i> he says, catching your hand and pressing a light kiss to it as you go.");
			flags["YOMA_DATE_PROGRESS"] = 5;
			break;
	}
	processTime(3);

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function yomaFirstDateProceed():void
{
	clearOutput();
	showYoma();
	author("GothPastel");
	
	output("You tell Yoma that you’d love to. He blinks for a moment, but once he’s done processing your agreement he grins, straightening up and pushing himself away from the bar.");
	output("\n\n<i>“There is a nice little café on Tavros I have heard of - we could take your ship?”</i> He doesn’t really wait for an answer, picking up a small bag you hadn’t noticed next to him and burying his free hand into a pocket of his shorts as he walks for the door, leaving you to hurriedly follow after. He seems almost on edge as he passes through Esbeth - perhaps not used to venturing far outside the jungle here - only settling down once you enter the spaceport building. You ask him about it as you checkout with ");
	if (pc.isBimbo() || pc.isBro()) output("and just plain check out ");
	output("Flahne, heading out to the elevator that’ll take you back up to your ship.");
	output("\n\n<i>“I am simply not familiar with the area, [pc.name]. It was not my destination either, so no need to dawdle,”</i> he states, his tone not particularly welcoming further questioning. It doesn’t take too long for you to take the elevator up to the platform your ship is docked at, and Yoma rocks back onto the heels of his feet as he looks at it, whistling lowly. For a while, it looks like he’s examining it, tracing a hand along its paintwork with an expression of curiosity painted across his features - ears and tail flicking about, as if making observations of his own.");
	output("\n\n<i>“Nice ship, [pc.name]!”</i> is the eventual verdict, the android turning back to look at you. <i>“I like a [pc.manWoman] who treats their machines well.”</i> You don’t doubt that for a moment.");
	output("\n\nA moment of final admiration "+ (PCShipIsCasstech() ? "and a confirmation that yes, this is the same ship your father used for the Rush he took part in, " : "") +"later and you ask if he’d like to come inside. There’s no need to ask twice - as soon as the words are out of your mouth he brushes past you into the ship.");
	output("\n\nIt’s not long before ");
	if (crew(true, true) > 0) {
		output("you hear him introducing himself to your crew,");
		if (bessIsCrew()) output(" though his introduction to [bess.name] sounds a little steely,");
		output(" excitedly explaining that he’s stealing you away for a date, then ");
	}
	output("he calls back to you, letting you know he’s going to be getting changed into something more festive and he’ll join you once you’ve landed.");
	output("\n\nTime to set a course for Tavros.");

	processTime(15);

	clearMenu();
	addButton(0,"Next",yomaFirstDateProceedII);
}

public function yomaFirstDateProceedII():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	output("By the time you’ve "+ (pc.isNude() ? "picked out a simple outfit to wear" : "straightened out your [pc.clothes]") +", Yoma is already waiting for you in the hangar. He’s still wearing his signature red, but this time it takes the form of a cozy looking poncho. Combined with cream leggings and black jackboots, it’s a fetching look.");
	output("\n\nYou cross over to him, laughing quietly as he now seems to be pretending that he wasn’t just watching for you to come out.");
	output("\n\n<i>“Took you long enough,”</i> he murmurs as you draw close.");
	output("\n\nYou joke around, asking if he missed you already.");
	output("\n\n<i>“No! No, of course not. Are you ready?”</i> he asks. You nod, extending a hand out to him. The android stares at you blankly for a moment, but soon takes it. His hand is surprisingly warm - not the usual cool of a synthetic.");
	output("\n\n<i>“Miniature thermal generators under the synthetic flesh of my palms.”</i> Yoma explains, seeming to have noticed your surprise. <i>“My master’s idea - it feels more natural, does it not? Come on though, we did not come all the way out here to stand around.”</i> He takes off, gently tugging you behind him. More natural, huh? Next he’ll be telling you he’s going to be getting a heartbeat.");
	output("\n\n<i>“Oh, we experimented with that.”</i> He says, and you snort - you were only joking! ");
	output("\n\n<i>“No, really, we did. It was... Too far into what you would call the uncanny valley though. Master removed the feature after about a week. I was quite relieved - it used a lot of processing power trying to analyze whether to pick up or slow down the pace in response to every single stimulus...”</i> He seems to have calmed down a bit, happily chattering away to you.");
	output("\n\nIt’s not long before the two of you are in the elevator and he’s punching in for the residential deck. The elevator’s music is as aggravating as usual - greeting the two of you with odd, tinny versions of Ausar pop and some Terran ballad that sounds old enough to have been popular when your father was a child - not that it stops Yoma prodding you into at least humming along to the ones the both of you recognise.");


//	moveTo("TAVROS HANGAR");
	moveTo("LIFT: MERCHANT DECK");
	showLocationName();
	processTime(600 + rand(30));
	
	clearMenu();
	addButton(0,"Next",yomaFirstDateProceedIII);
}

public function yomaFirstDateProceedIII():void
{
	clearOutput();
//	showYoma();
	showBust(ilariaBustDisplay(),yomaBustDisplay());
	author("GothPastel");

	output("It doesn’t take long for the two of you to step into Bunny’s Buns & Confectionary. The usual near-garish flashing lights are as obnoxious as ever, the music at least toned down to a thankfully much higher quality version of the sort of stuff that the elevator earlier was playing.");
	output("\n\n<i>“Hey sweeties,”</i> croons "+ (flags["MET_ILARIA"] != undefined ? "Ilaria" : "the bunny girl that bounces up to you from behind the counter - Ilaria, according to her name tag") +". <i>“Can I get you anything?”</i>");
	output("\n\nYoma speaks up before you can. <i>“We will take a hot chocolate!”</i>");
	output("\n\nIs he not having anything?");
	output("\n\n<i>“Ah, no - I was not programmed to taste in anything but the vaguest terms. I would hate to waste our charming hostess’s talents.”</i> The last line is accompanied with his signature wide grin in Ilaria’s direction.");
	output("\n\nShe laughs, and turns to you. <i>“So, you want cream on that?”</i>");
	output("\n\nWell, do you?");

	moveTo("BUNBAKERY");
	showLocationName();
	
	processTime(15);

	clearMenu();
	addButton(0,"Yes",yomaFirstDateProceedIV, true);
	addButton(1,"No",yomaFirstDateProceedIV, false);
}

public function yomaFirstDateProceedIV(wantCream:Boolean = true):void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	if (wantCream) output("Yoma snickers "+(flags["ILERIA_GLAZED"] != undefined ? "and you smirk right back at him, letting him know that yes - you’re perfectly aware of what that entails - " : "")+"and leads you to sit towards the back of the establishment.");
	else output("Yoma looks disappointed "+(flags["ILERIA_GLAZED"] != undefined ? "and you smirk at him, letting him know that you already knew about the special ‘sauce’ " : "for some reason")+", but he leads you to sit towards the back of the establishment.");
	output("\n\nIs it true that he really can’t taste?");
	output("\n\n<i>“Mhmm - standard practice really. What would the point of the extra programming be? I am not designated to a cooking task, after all. You cannot miss something you never experienced.”</i> The statement is pretty matter of fact.");
	if (flags["YOMA_TIMES_TAILFUCKED"] != undefined)
	{
		output("\n\nYou ask him how he could tell the taste of your tail-mounted cock’s signature semen, more than a little confused about this apparent clash of information.");
		output("\n\n<i>“Oh, I am able to register abnormally large presence of certain compounds - I noticed a good deal of limonene, is all, which wasn’t my expectation. I really just store the information, there is no emotional response - hence I would not describe this ability as taste.”</i> It’s a bit of an oddity, but the answer does satisfy your confusion.");
	}
	output("\n\nIlaria isn’t long coming over with your hot chocolate"+ (wantCream ? ", cream and all," : "") +" and you settle into your booth properly, smirking a little as Yoma not so subtly uses the opportunity to slip his arm behind you, wrapping it around your waist. ");
	output("\n\n<i>“I feel like we talk a lot about me, [pc.name]. Tell me about yourself for once! I do not even know where you grew up,”</i> he says, ears swivelled curiously towards you.");
	output("\n\nAt first you wave him off, trying to pass it off as nothing too interesting - your character is really forming now, on the Rush - but he insists, and you soon find yourself ");
	switch(flags["PC_UPBRINGING"])
	{
	case GLOBAL.UPBRINGING_AUSTERE:
		output("describing how despite your late father’s affluence, you still worked for everything you have");
		break;
	case GLOBAL.UPBRINGING_PAMPERED:
		output("admitting that you were probably more than a little spoiled, thanks to your late father’s affluence");
		break;
	default:
		output("talking about your earlier life");
		break;
	}
	output(", as well the brief period of time you spent working as a [pc.class] before Victor’s passing. Yoma listens intently, interrupting you now and then to remind you to actually drink your hot chocolate before it goes cold, or to ask you to elaborate on something you’ve said.");
	output("\n\nHe’s pleasantly warm, pushed up against you as he is, and even after you’ve finished your drink, you stay there, chattering away. ");
	output("\n\nEventually though, after polishing up a "+ (pc.isMischievous() ? "highly exaggerated " : "") +"story about something embarrassing that your cousin did on one of [rival.hisHer] rare visits, you realize that you’ve been here easily an hour and it’s probably time you head out. Yoma doesn’t remove his arm from you "+(pc.tallness < 53 ? "though he does move it up to be around your shoulders now " : "")+"as you stroll through Tavros Station, still talking idly.");
	output("\n\nAfter you’re quite certain you’ve walked off that hot chocolate, you start moving towards your ship again, not ignoring the little circles that Yoma’s been rubbing into your flesh and the grin that hints he’d like a little more than a quiet ride home.");

	showLocationName();
	processTime(70);

	clearMenu();
	addButton(0,"Next",yomaFirstDateProceedV);
}

public function yomaFirstDateProceedV():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	output("Setting your ship into autopilot "+(crew(true, true) > 0 ? "and asking a member of your crew to keep an eye on your course " : "")+"for the journey back to Mhen’ga, you take a few deep breaths to calm the mild anticipatory lust gathering inside yourself before you step into your quarters. Your [pc.eyes] are greeted with a welcome sight - Yoma is already unclothed - aside from his boots - and is lazily reclined across your bed.");
	output("\n\n<i>“Nice of you to join me,”</i> he almost purrs, standing up to join you at the door, closing it behind you.");
	output("\n\nYou roll your eyes, reminding him that it was only a few minutes, and he laughs, ");
	if (!pc.isNude()) {
		output("before hooking his slender fingers into your [pc.clothes] and helping you pull it off")
		if (pc.hasHardLightEquipped()) output("though he leaves your hardlight-equipped underwear in place");
		output(", and ");
	}
	output("pulling you towards him, your [pc.chest] "+ (pc.tallness <= 72 ? "pressing against his" : "finding a comfortable resting place against his chest") +" as he roams his hands over you. A finger ghosts lightly across your [pc.asshole], but passes on");
	if (pc.hasPlumpAsshole() || pc.hasPerk("Buttslut")) output(", much to your chagrin");
	output(", before he’s tweaking at your nipples gently");
	if (pc.isLactating()) output(" drawing forth a drop of [pc.milk] that he licks up, seemingly amused");
	output(".");
	output("\n\nAfter a while of teasing, you can take no more, leading the android back towards your bed, pushing him down onto it and locking your [pc.lipsChaste] with his. It’s not long before his hands snake down towards your [pc.genitals], although he strokes teasingly across your lower stomach "+(pc.hasVagina() ? "and mons " : "")+"for several moments before you needily push against him.");

	moveTo("SHIP INTERIOR");
	showLocationName();
	processTime(30);

	clearMenu();
	if (pc.hasHardLightEquipped() || pc.hasCock()) addButton(0,"Next",yomaSexAnal, true);
	else addButton(0,"Next",yomaSexTribbing, true);
}

public function yomaFirstDateOutro():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	output("The rest of your journey back to Mhen’ga is uninterrupted - mostly, that is - as Yoma slinks into the cockpit with you the moment he’s finished cleaning up, watching you handle the controls with your usual ease"+ (PCShipIsCasstech() ? " rather impressed, as he makes a point of noting, that you remain unbothered by the somewhat antiquated controls." : "."));
	output("\n\nThere aren’t any distractions other than that, and you’re soon touching down. You walk your android companion as far as the bar before the two of you say your goodbyes.");
	output("\n\nYoma gets a few metres away from you before he spins back, running back up to you and stumbling a little over his feet - though you catch him before he trips over.");
	output("\n\n<i>“Sorry, sorry - I almost forgot! I had an absolutely lovely night, [pc.name], and I would certainly not object to a similar event in the future,”</i> he says, trademark beam back on his face once he’s recovered from nearly tripping.");
	output("\n\nYou’re about to respond in turn when you’re cut off, Yoma ");
	if (pc.tallness < 63) output("leaning down");
	else if (pc.tallness == 63) output("leaning in");
	else output("tugging you down");
	output(" in order to press a gentle but affectionate kiss to your [pc.lipsChaste]. By the time you’ve recovered, he’s darted off again, a small skip in his step this time.");
	output("\n\nCute!");

	flags["YOMA_DATE_PROGRESS"] = 2;
	moveTo("NORTH ESBETH 2");
	showLocationName();
	processTime(600 + rand(30));
	// reset jungle encounter
	yomaCooldown();
	//disable the dates for a couple of days
	flags["YOMA_BAR_DATE"] = 3 + (Math.floor(GetGameTimestamp() / 24 / 60));
	flags["YOMA_AT_BAR"] = 0;

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function yomaSecondDate():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	if (flags["YOMA_DATE_PROGRESS"] == 2) {
		output("You saunter up to the android, having a good idea of what he’s here for. He grins as he spots you heading his way, swinging up a bag you’d barely noticed from the floor, and stands to excited attention. Another date?");
		output("\n\n<i>“Of course!”</i> he chirps, <i>“A little different from last time, though - a little more casual. I thought we could find somewhere nicer to play.”</i> Play? Oh - of course - Caves and Cryptids again. Where does he feel like taking you?");
		output("\n\n<i>“I was thinking of somewhere a bit brighter, less humid - less chance of getting jumped by bug people. I took a look at the coordinates you have picked up the last time I was on your ship - and New Texas seems friendly enough.”</i>");
		output("\n\nUnable to help yourself, you let out a small snort of laughter.");
		output("\n\nIt’s his turn to laugh, of course. <i>“Now, now - it is not jumping if they ask first - and I did say it in reference to the Zil, anyway.”</i> Well, he’s not <i>wrong.</i>");
		output("\n\nHe laughs again before speaking. <i>“Well, do you feel up to it?”</i>");
		processTime(5);
	}
	else {
		output("You approach the android again, and he perks up, picking his bag up off from the floor.");
		output("\n\n<i>“Have you reconsidered, [pc.name]?”</i>");
		output("\n\nWell, have you? Do you want to go?");
		processTime(2);
	}

	clearMenu();
	addButton(0,"Yes",yomaSecondDateProceed,undefined);
	addButton(1,"Not Now",yomaDateComeBackLater,undefined);
}

public function yomaSecondDateProceed():void
{
	clearOutput();
	showYoma();
	author("GothPastel");
	
	output("Of course you do.");
	output("\n\nYoma beams, plopping his bag back onto his shoulder properly, before weaving his way out of the bar, you close behind him. You have to jog a few paces once you’re out to keep up with his energetic, bouncy pace, but once you do catch up the android links his arm with yours, slowing down to match your regular pace.");
	output("\n\nIt’s not long before you reach your ship,");
	if (crew(true, true) > 0) output(" your companion calling out a cheery greeting to its other occupant"+ (crew(true, true) > 1 ? "s" : "") +" before");
	else output(" and");
	output(" the two of you easily settle into your cockpit. Clearly, Yoma doesn’t feel the need to get dressed up this time - though you suppose his shorts and sandals really are already fitting gear for a warm weather picnic.");
	output("\n\nIt’s simple enough to tap in the right coordinates and pilot away from Mhen’ga’s docks before you put the ship into autopilot. You’ve got a good couple of hours before you’ll need to do anything more intensive than keep watch... And Yoma seems to have the perfect distraction, hand tracing over your [pc.crotch], that Void-damned grin on his face.");
	output("\n\nYou’re going to have a fun flight.");

	moveTo("SHIP INTERIOR");
	showLocationName();
	processTime(15);

	clearMenu();
	addButton(0,"Next",yomaSecondDateProceedII);
}

public function yomaSecondDateProceedII():void
{
	clearOutput();
	showYoma();
	author("GothPastel");
	
	output("You touch down at the dock closest to New Texas’s customs building, and Yoma pokes his head back into the cockpit, having snuck out at some point to change... After cleaning himself off.");
	output("\n\n<i>“How do I look?”</i> he asks, giving you a twirl that oh so nearly has him tripping over his own feet again.");
	output("\n\nOnce he’s settled back to a steady stance, you give him a look of appraisal. He’s wearing a white short sleeved shirt, tucked into some high waisted loose pants. You almost think he’s lacking his signature red for a moment, but the flat sand shoes on his feet throw in some red laces for a splash of color.");
	if (pc.isBimbo()) {
		output("\n\n<i>“You look, like, so cuuuute?!I just wanna jump you right now and-”</i>");
		output("\n\nYoma laughs awkwardly, cutting you off. <i>“Maybe later, [pc.name]!”</i>");
	}
	else if (pc.isBro()) {
		output("\n\n<i>“Good.”</i>");
		output("\n\nIt’s a simple compliment, but he grins anyway, clearly registering the heartfelt meaning behind it.");
		output("\n\n<i>“I am willing to bet you will like tearing it off later too,”</i> he says, grinning.");
		output("\n\nWell, he got you there.");
	}
	else {
		output("\n\n<i>“Absolutely resplendent.”</i>");
		output("\n\nHe laughs. <i>“Oh, come on [pc.name], you are just saying that to get on my good side.”</i>");
		output("\n\nIt is true though, he does look wonderful. And what’d be so wrong with it, anyway?");
		output("\n\n<i>“Nothing, but it is unnecessary, you are already there, [pc.name].”</i>");
	}

	moveTo("500");
	showLocationName();
	processTime(600 + rand(30));

	clearMenu();
	addButton(0,"Next",yomaSecondDateProceedIII);
}

public function yomaSecondDateProceedIII():void
{
	clearOutput();
	showBust("OGRAM",yomaBustDisplay());
	author("GothPastel");
	
	output("Customs is a slightly longer affair than you’re used to, as Yoma seems to have some trouble with the no weapons policy.");
	output("\n\nJust as you’re wandering over to see if you can help, he flexes his wrists in a strange and frankly uncomfortable looking way. There’s a quiet <i>shnik</i>, and you watch as a second set of nails - wicked sharp and dark metal - slip out over his current ones.");
	output("\n\nFor a moment, you nearly panic, before Yoma pushes hard just behind each claw, popping them out one by one, much to the border agent he’s dealing with’s evident approval. You have little time to more than quirk a questioning eyebrow at him before he speaks.");
	output("\n\n<i>“I am not a combat model, but "+(silly ? "it is dangerous to go alone" : "it would be foolish to go about unprotected")+". Luckily they are quite removable, hm?”</i>");
	output("\n\nIt is lucky - arriving only to get your android companion barred from entry would have been less than ideal.");

	moveTo("TEXAS CUSTOMS");
	showLocationName();
	processTime(15);

	clearMenu();
	addButton(0,"Next",yomaSecondDateProceedIV);
}

public function yomaSecondDateProceedIV():void
{
	clearOutput();
	showYoma();
	author("GothPastel");
	
	output("It’s sunny as ever on New Texas, and you blink owlishly at the sudden change of lighting as you step outside, Yoma laughing softly and waiting for you to adjust before taking one of your hands in his.");
	output("\n\n<i>“Come on, [pc.name], I want to see the fields - they still employ older agricultural methods here.”</i> You’re not entirely sure why he’s so fascinated, but go along with it anyway, letting him pull you away from the main settlement, and out into the fields of New Texas. ");
	output("\n\nSoon, you both find yourselves weaving your way through orchards and fields, growing a multitude of crops in a multitude of sizes, until Yoma eventually settles at the border between an orchard that seems to be growing something akin to pomegranates"+(flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_BOOKWORM ? ", though you know from your more eclectic range of studies that the trees tower much too tall to be quite natural," : "")+" and a field of freshly threshed wheat.");
	output("\n\nIt’s pleasantly shaded where you sit down, but far brighter than the jungle you’re normally situated in together, allowing you both to see each other much more clearly in the natural light. With all of this, it’s possible to admire just how remarkable Yoma’s craftsmanship is...");
	output("\n\nHuh. You don’t actually know what company made him, and absently, you pose the question.");
	output("\n\n<i>“Now, do not laugh,”</i> he starts, and you give him a curious look. <i>“...And do not give me that look, either.”</i> Okay, okay, you’ll stop.");
	output("\n\n<i>“KihaCorp. In semi-partnership with JoyCo at first, just for the medical angle, but KihaCorp broke that off to spearhead their own medical programme. Not that you would be able to tell they have one - it has not really taken off at all. But that is beside the point.”</i>");
	output("\n\nWell then. He’s certainly not quite what you’d expect from a KihaCorp model - certainly, he’s not one of there ‘Tsundere’ styled lines - though then again, the occasional stubbornness you’ve noticed over small things does fit.");
	output("\n\n...You can’t help but imagine a situation with him acting like said line though, you’ve seen enough holovids.");
	output("\n\n<i>“I told you not to laugh!”</i>");
	output("\n\nOh Void, he even looks flustered enough, and your laughter doubles, causing him to let out an undignified <i>squawk</i> - and that just creates a vicious cycle.");

	moveTo("503");
	processTime(15);

	clearMenu();
	addButton(0,"Next",yomaSecondDateProceedV);
}

public function yomaSecondDateProceedV():void
{
	clearOutput();
	showYoma();
	author("GothPastel");
	
	output("Some time later, you’ve managed to calm down enough to actually start what you came here to do, Yoma’s signature bright green dice spinning the sunlight beautifully as he tumbles them out, before digging back through his pocket for something.");
	output("\n\nJust as you’re about to ask, Yoma’s hands clasp around yours, pressing something cool and metallic into them.");
	output("\n\nOh <i>wow</i>.");
	output("\n\nThese can’t have been cheap - silvery metal dice inlaid with softly pulsing [pc.eyeColor] numbers. Each one feels heavy, yet perfectly weighted in your hands, the corners sharp enough to get neat spins, but not to an extent that risks causing injury on being picked up by the edge.");
	output("\n\n<i>“It was getting a little bit awkward, swapping my dice forward and back between the two of us, so I bought you your own set.”</i>");
	output("\n\nFor a moment, his faux-fur seems to fluff up a little in apparent embarrassment.");
	output("\n\n<i>“I hope you do not mind that I went a little overboard on the quality for an unsolicited gift, but you really have come to be a great source of comfort to me so far from home, and I wanted to repay some of that fact.”</i>");
	output("\n\nYou’re honestly not sure how to respond, but you thank him, giving his hands a reassuring squeeze.");
	output("\n\nSoon enough, you’re settled down and playing. You can’t help but notice the gentle smile that never seems to leave the android’s face - far removed from the teeth baring grin you’ve grown accustomed to, but no less genuine. It’s obvious that he’s enjoying himself... Perhaps today is a good opportunity to get him talking about more personal matters?");

	output("\n\n<b>(Key Item Acquired: Personalised Dice Set)</b>");
	//better not use the eye color parser here or the dice will change everytime the PC changes their eyes
	pc.createKeyItem("Personalised Dice Set", 0, 0, 0, 0, "A gift from Yoma - they’re metal, with "+ String(pc.eyeColor) +" numbers.");

	moveTo("534");
	processTime(30);

	clearMenu();
	addButton(0,"Next",yomaSecondDateProceedVI);
}

public function yomaSecondDateProceedVI():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	output("About two hours later, you find yourselves taking a break - you’re lazily sprawled out, head in Yoma’s lap with his fingers "+(pc.hasHair() ? "stroking through your hair." : "gently tapping a rhythm against your bare scalp."));
	output("\n\nEventually, you start dozing off, only to catch the end of a murmured sentence.");
	output("\n\n<i>“...Missed this...”</i>");
	output("\n\nHm?");
	output("\n\nThere’s an undignified squeak from above you, and you look up to see Yoma plastering a hand over his mouth.");
	output("\n\nOh, now that’s quite the sign of embarrassment.");
	output("\n\n<i>“Apologies, [pc.name] - talking to oneself is not a solely organic habit. I suppose I will have to admit to sentiment.”</i>");
	output("\n\nHe pauses, taking a long breath that you know is only for - probably unintended - dramatic effect.");
	output("\n\n<i>“I miss my master - like a hole in my, and please excuse the turn of phrase, heart. But having you here? Being close to you? I think that it is at least going some of the way to patching it.”</i>");
	output("\n\nYou don’t know what to say, and choose the more tactful approach of propping yourself up a little better, showing off that you’re paying attention.");
	output("\n\n<i>“Ah, to get to the point... [pc.name], I love Xinyi, my master... but I think that I love you too.”</i>");
	output("\n\nJust as you’re about to respond, the two of you are interrupted by the sound of rustling, growing closer and closer, faster and faster, before whatever it is bursts through the treeline - a blur of blue spikes and white fangs.");
	output("\n\n<i>Shit.</i>");
	output("\n\nThere’s no time to think, and unarmed as you are, no way to fight. You grab Yoma’s hand, tugging him to his feet and <i>run</i>. He barely has time to scoop up his belongings, but manage it he does, and the two of you are off.");
	output("\n\nYou daren’t stop, not even to catch your breath - these things eat silicone, credits, anything. If they catch you, maybe you’ll be fine - but Yoma? Yoma won’t be.");
	output("\n\nYou can’t have that. Even when he stumbles you don’t stop, just scooping him up and throwing him over your shoulder"+ (pc.tallness <= 60 ? ", not caring at all about how ridiculous you’ll look when you make it back to the townstead" : "") + ".");
	output("\n\nAfter what seems like an age, you collapse out of the fields, lungs burning and sweat dripping from every pore. You hear gunshots as "+ (flags["MET_CAMERON"] != undefined ? "Cameron" : "the farmhand") +" takes potshots at the varmint chasing you, and the sigh of relief as it scarpers.");
	output("\n\nYoma sits up before you, crying a desperately relieved thanks to anybody who will listen, before you stagger to your feet.");
	output("\n\nStumbling back through customs, and onto your ship seems to take eons, but the moment you’ve set a course back for Mhen’ga the almost deadly encounter begins to take its toll, and you can do nothing else but press a clumsy kiss to your android lover’s lips as he leads you back to your quarters.");

	processTime(30);

	clearMenu();
	addButton(0,"Next",yomaSexGetFingered,true);
}

public function yomaSecondDateOutro():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	output("Parting is harder, this time. Even after you’ve docked your ship, you find yourself making inane smalltalk, hoping one of you will find a reason that you don’t have to separate again. It can’t last, though. You have probes to find, he has a jungle to finish exploring.");
	output("\n\nOf course, you kiss him as he leaves, waiting until he’s out of sight before you turn back, into your ship.");
	output("\n\nOh void, he loves you.");
	output("\n\nYou might need some time to process that.");

	flags["YOMA_DATE_PROGRESS"] = 4;
	moveTo("NORTH ESBETH 2");
	showLocationName();
	processTime(600 + rand(30));
	// reset jungle encounter
	yomaCooldown();
	//disable the dates for a couple of days
	flags["YOMA_BAR_DATE"] = 3 + (Math.floor(GetGameTimestamp() / 24 / 60));
	flags["YOMA_AT_BAR"] = 0;

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function yomaThirdDate():void
{
	clearOutput();
	showYoma();
	author("GothPastel");
	
	if (flags["YOMA_DATE_PROGRESS"] == 4) {
		output("It’s getting pretty commonplace now; [pc.walking] into the bar and seeing Yoma waiting for you.");
		output("\n\nLike last time, he’s not just carrying himself - you notice what looks like a pretty heavy change of clothing slung over one arm. So, where does he want to go this time?");
		output("\n\n<i>“Uveto VII.”</i> Is the surprisingly curt reply, and you can’t disguise your shock. The place isn’t exactly a touristic hotspot. Yoma’s ears droop slightly, but you motion him to explain, not wanting to completely crush his dreams.");
		output("\n\n<i>“Well, the thing is... I am supposed to be exploring in my master’s stead and yet I have not so much as left Mhen’ga. I thought about journeying off to several others, but there was always some form of stumbling block. Tarkus could have me stripped for parts, Myrellion could be glassed at any given moment, and all manner of other issues.”</i>");
		output("\n\nYou do suppose that makes sense, but still - why Uveto? It’s not exactly a recent discovery.");
		output("\n\n<i>“Oh, I know, I know, but settlement is recent, and so much of it lies unexplored! So long as we are careful to plan around the lightning storms, it will be such a wonderful opportunity!”</i>");
		output("\n\nWith how enthused he sounds, you can’t bring yourself to say no outright.");
		output("\n\nAre you ready?");
		processTime(5);
	}
	else {
		output("Yoma straightens up when he sees you approach again, almost seeming to bounce on the balls of his feet.");
		output("\n\n<i>“Are you ready to head out, [pc.name]?”</i>");
		processTime(2);
	}
	clearMenu();
	addButton(0,"Yes",yomaThirdDateProceed,undefined);
	addButton(1,"Later",yomaDateComeBackLater,undefined);
}

public function yomaThirdDateProceed():void
{
	clearOutput();
	showYoma();
	author("GothPastel");
	
	output("Properly equipped and ready to go, you find yourself taking the android’s unoccupied hand and leading him out of and away from the bar. He laughs, picking up the pace so he can walk alongside you, ");
	if (pc.tallness < 60) output("pulling you close enough for you to lean into his chest");
	else if (pc.tallness < 66) output("leaning his head on your shoulder");
	else output("leaning into your chest");
	output(" as you go.");
	output("\n\nIt’s an easy, comfortable walk to your ship, spent in companionable silence, and Yoma vanishes off into your quarters to change as you set a course for Uveto.");
	output("\n\nA few minutes later, he emerges back into the cockpit, and you can’t muffle a laugh when you see him - decked out in a currently unbuttoned thick, red, padded coat that extends down to his knees and long, sole-studded snow boots, both lined with white synthetic fur.");
	output("\n\n"+ (pc.isBimbo() ? "<i>“Aren’t you gonna get too warm?”</i>" : "<i>“Are you sure you won’t overheat in all that? I don’t want to have to carry you again.”</i>") +" You can’t help but ask"+ (pc.isNice() ? ", a look of concern plastered across your face" : "") +". He laughs, walking across the room to sit with you, letting the coat drape off his shoulders a little to reveal the ribbed black turtleneck underneath it.");
	output("\n\n<i>“No such luck, [pc.name], you will not get rid of me that easily. I cool off just fine, the fennec ears are not for a simple show, but the last thing I am sure either of us want is my joints freezing solid!”</i> There’s no stopping your next snort of laughter, imagining a frozen Yoma-sicle left out there on the tundra.");
	output("\n\n<i>“Now then! I will have you know I would use the very last of my processing power to send an email direct to your codex. A very, very angry email,”</i> he huffs, but his tail swishes in amusement all the same.");
	output("\n\nThe horror! Can he really do that, though?");
	output("\n\n<i>“Of course, watch.”</i> He pauses for a moment, before his eyes flash a slightly brighter green, and your codex pops up with an email alert...");
	output("\n\nLo and behold, you’ve received an email from one ‘Yoma.Jin@JinSystems.ltd’, including absolutely no subject line"+(pc.characterClass == GLOBAL.CLASS_ENGINEER ? " to your disgust" : "")+", and a main body consisting of a few "+(pc.isAss() ? "" : "adorable ")+".gif files of various desert foxes. You laugh, rolling your eyes at him and stashing it in an archive somewhere, before posing a simple question. <i>“Jin?”</i>");
	output("\n\nYoma’s ears twitch and you just about recognise a flush on his features. <i>“Master Xinyi’s surname... He suggested I use it for my, um, email address as the system did not like it being left blank.”</i>");
	output("\n\nThe next bit is muffled as he tugs his coat back up, subconsciously burying his face into it.");
	output("\n\n<i>“I use it for paperwork too... It feels nice.”</i>");
	output("\n\nYou ");
	if (!pc.isAss()) output("smile at him"+(pc.isNice() ? " softly" : ""));
	else output("nod curtly");
	output(", recognising again just how strongly he has feelings for his master. Of course, it does remind you that he told you that he felt that way about you, too. You shove the thought down though. If he doesn’t bring it up beforehand, you’ll wait until after this to tell him your own opinion on the matter, not wanting to make things awkward.");

	moveTo("SHIP INTERIOR");
	showLocationName();
	processTime(15);

	clearMenu();
	addButton(0,"Next",yomaThirdDateProceedII);
}

public function yomaThirdDateProceedII():void
{
	clearOutput();
	showYoma();
	author("GothPastel");
	

	output("A few hours and a few laughably bad movies you brought up on your codex later, you’re touching down on Uveto at last.");
	output("\n\n");
	if (pc.hasPerk("Icy Veins") || pc.hasStatusEffect("Icy Veins") || (pc.hasFur() && pc.hasPerk("Wooly"))) output("Having no need for warm clothing or heat belts, you’re the first to step down from your ship, extending a hand to your "+ (pc.RQ() <= 20 ? "marginally " : "") +"less graceful companion.");
	else
	{
		if (!pc.isNude()) output("Tugging your [pc.clothes] around you"+ (pc.hasHeatBelt() ? " and firing up your heat belt" : "") +", you step down from your ship, helping your "+(pc.RQ() <= 20 ? "marginally " : "")+"less graceful companion down as you do.")
		if (pc.hasHeatBelt()) output(" Once you’re done taking extra care to make sure that your heat belt is pushing out enough energy to keep you positively toasty and not a single inch of your bare flesh is left exposed and out of its field, y");
		else output(" Y");
		output("ou step down from your ship");
		if (!pc.isAss()) output((pc.isNice() ? ", graciously" : ",")+" taking Yoma’s extended hand to help steady the descent.");
		else output(", barely noticing Yoma’s offered hand.");
	}
	output("\n\nThe android himself still looks slightly ridiculous, bundled up as he is, but you’re certainly not worried about him freezing over - so you suppose it’s a small sacrifice. It certainly doesn’t impede his movement like you thought it would either, as he’s soon tugging you towards the space elevator that you can see towards the other end of the low orbit station.");
	output("\n\nThe two of you manage to squirrel yourself away into a corner of the thing, Yoma hopping up onto one of many RhenWorld branded boxes, and you join him. Your android companion leans into you, letting out a pleased noise as you wrap one arm around his waist whilst the other reaches for your codex, giving the weather a quick check.");
	output("\n\nYep, you’ll be fine for a good few hours yet, there’ll be no need to find somewhere to camp out in Irestead when you get down there... In about forty five minutes. As you’re trying to think of something simple to chat about on the way down, you’re cut off.");
	output("\n\n<i>“You know, [pc.name], we are going to be here for a while. How about some <i>fun</i> while we wait?”</i> It doesn’t take a genius to figure out what he means, but");
	if (pc.hasPerk("Ultra-Exhibitionist")) output("... Okay, you forgot what your objection was going to be with how hot the idea is.");
	else if (pc.exhibitionism() >= 66) output(" isn’t he worried about getting caught? You’re sure as hell past the point of caring, but is he?");
	else if (pc.exhibitionism() >= 33) output("... wow ! The idea of having sex just out of view of who knows how many people really is kinda hot - but isn’t he worried about getting caught?");
	else output(" void! There are people here - you might be out of plain view, but so public? Really?");
	output("\n\n<i>“Do not worry, I checked for cameras on the way in. I just need you to keep it down. Are you up for it?”</i> he asks, ");
	if (pc.hasPerk("Ultra-Exhibitionist") || pc.exhibitionism() >= 66) output("disappointing you a little with the fact that videos probably won’t end up on the extranet.");
	else output("quelling any fears you might have had of videos ending up on the extranet.");

	moveTo("UVS LIFT");
	showLocationName();
	processTime(600 + rand(30));

	clearMenu();
	addButton(0,"Yes",yomaThirdDateElevatorPitch, true);
	addButton(1,"No",yomaThirdDateElevatorPitch, false);
}

public function yomaThirdDateElevatorPitch(wantSex:Boolean = true):void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	if (wantSex) {
		flags["YOMA_DATE_ELEVATOR_SEX"] = 1;
		pc.orgasm();
		pc.exhibitionism(1);
		if (pc.hasPerk("Ultra-Exhibitionist") || pc.exhibitionism() >= 66) output("Excited and getting turned on already, your ");
		else output("Nervous as you may be, your ");
		if (pc.isHerm()) output("hard [pc.cocksNoun] and wet [pc.vaginasNoun]");
		else if (pc.hasCock()) output("hardening [pc.cocksNoun]");
		else output("moistening [pc.vaginasNoun]");
		if (pc.isHerm() || pc.hasCocks() || pc.hasVaginas()) output(" take");
		else output(" takes");
		output(" control of your mind, and all you can do is nod.");
		output("\n\nYoma grins, the hand he’d been sliding up your thigh moving in to ");
		if (pc.isCrotchGarbed()) {
			if (pc.hasCock()) output("fish your [pc.cockBiggest] out from your [pc.lowerGarments].");
			else output("pull down your [pc.lowerGarments] far enough to expose your [pc.biggestCunt].");
		}
		else {
			if (pc.hasCock()) output("grab your [pc.cockBiggest].");
			else output("nudge your [pc.legs] apart, and spread the lips of [pc.biggestCunt].");
		}
		//To keep it simple the scene should default to the cock variant if PC is herm
		if (pc.hasCock()) {
			output("\n\nRather than jerk it off like you were first expecting, Yoma leans over, wetting his lips with a single flick of his tongue before wrapping them around your [pc.biggestCockHead], humming in amusement as you let out a startled gasp. You take a quick look around you, confirming that nobody’s coming over to investigate ");
			if (pc.hasPerk("Ultra-Exhibitionist") || pc.exhibitionism() >= 66) output("- <i>damn</i> - ");
			output("and soon you’re having to slap a hand over your [pc.lipsChaste] to muffle a loud moan as he swallows your "+ pc.cockNounComplex(pc.biggestCockIndex())+" ");
			if (pc.cLength(pc.biggestCockIndex(), true) < 10) output("to the base without a hint of difficulty.");
			else if (pc.cLength(pc.biggestCockIndex(), true) < 30) output("to the base with a little difficulty.");
			else if (pc.cLength(pc.biggestCockIndex(), true) < 40) output(" to the base, although it’s quite a struggle to take it all down.");
			else output("as far as he can, until you feel your tip hit the end of the overly long passage, prompting him to wrap his slender fingers around the rest.");
			output("\n\nIt’s immediately apparent that this was only intended as a quickie, your partner wasting no time with anything but a fast pace, letting out wet sucking and slurping noises as he goes " + (pc.exhibitionism() < 33 ? "that you pray aren’t actually as loud as you’re hearing." : ""));
			output("\n\nOne hand ");
			if (pc.hasBalls()) {
				if (pc.ballSize() < 16) output("cups your [pc.ballsNoun] lightly, dexterously rolling and fondling them");
				else output("strokes over the surface of your [pc.ballsNoun], doing its best to pleasure the oversized beasts");
			}
			else if (!pc.hasBalls() && pc.hasVagina()) output("reaches down to lightly finger your [pc.biggestCunt], thumb flicking [pc.biggestCuntClit]");
			else output("reaches down to lightly finger your [pc.asshole], thumb stroking over your perineum ");
			output(" and one of your [pc.hands] instinctively reaches for Yoma’s head, getting a good grip on a fistful of dreadlocks to steer him.");
			output("\n\nNeither of you are particularly interested in dragging it out, just wanting some quick relief and the thrill of public sex, and it’s not long until you’re "+(pc.cumQ() >= 1000 ? " flooding your partner’s oral passage with enough cum that he’s still coughing it up when he pulls off." : "cumming."));
			output("\n\nYou don’t quite manage to muffle your loud, orgasmic cry in time - something you soon realize as you hear a gruff, huskar-sounding voice call out an <i>“Everything okay back there?”</i>");
			output("\n\n" + (pc.cumQ() >= 1000 ? "Now that he’s finished coughing, " : "") + "Yoma calls out a confirmation, earning an amused laugh from the voice. Looks like they realized that there’s more than one of you back here...");
			output("\n\nIt doesn’t take long to clean up, and soon the two of you have settled back to how you were.");
		}
		else {
			output("\n\nRather than just finger you like you were first expecting, Yoma slides back off the storage box you’ve settled down on, flicking his tongue over his lips to wet them before he does the same with your lower pair. He’s soon sucking messily at your "+ pc.clitDescript(pc.biggestVaginaIndex(), true) +", humming amusedly as you gasp in surprise at the sudden action.");
			output("\n\nYou’re soon left with one hand covering your mouth to muffle your moans and the other fisting into dreadlocked hair, pulling him in close as you can. He does his best to keep up, tongue plunging deep into your sopping passage, nose bumping your "+ pc.clitDescript(pc.biggestVaginaIndex(), true) +".");
			output("\n\nHis eyes meet yours, bright green glow seeming to pulse in time with the beating of your heart that he can doubtless feel through the throbbing of your "+ pc.vaginaNounDescript(pc.biggestVaginaIndex()) +", and you find yourself doubling over as he hums wickedly before returning his attention to your " + pc.oneClitPerVagina(pc.biggestVaginaIndex()) +", ");
				if (pc.clitLength >= 4) output("deepthroating it and letting out wet slurping and sucking noises as he does");
				else output("delving under its hood for even more intense stimulation");
				output(". It’s all you can do not to scream at the sensations washing through your shaking body.");
			output("\n\nIt’s obvious to both of you that you’re not particularly interested in dragging this out, just wanting some quick relief and the thrill of public sex, so it doesn’t surprise you when you cum suddenly and spectacularly, unable to cover up your loud yell of pleasure in the heat of the moment.");
			output("\n\nYou soon realize your mistake as you hear a gruff, huskar-sounding voice call out an <i>“Everything okay back there?”</i>");
			output("\n\nWiping the [pc.girlcum] from his visage, Yoma calls out a confirmation, earning an amused laugh from the voice. Looks like they realized that there’s more than one of you back here...");
			output("\n\nIt doesn’t take long to clean up, and soon the two of you have settled back to how you were.");
		}
	}
	else {
		if (pc.hasPerk("Ultra-Exhibitionist") || pc.exhibitionism() >= 66) output("Steeling yourself"+(silly ? "not that that’s too hard - it is your name" : ""));
		else output("Shaking your head");
		output(", you refuse the offer. Regardless of your own feelings, lack of cameras doesn’t mean lack of people wandering about and potentially walking right into whatever you’re doing, and you’re fairly sure that getting into trouble will just sap away any time you get planetside.");
		output("\n\nThe hand that was beginning to steal its way between your legs withdraws, Yoma squeezing your hand instead.");
		output("\n\n<i>“I do suppose you have a point there. Maybe another time?”</i> he responds, and you relax, glad that he isn’t too disappointed.");
	}
	output("\n\nThe "+ (wantSex ? "rest of " : "") +"the journey down passes relatively uneventfully - there’s not really much time to have a meaningful conversation or anything in the less than an hour you have.");
	output("\n\nSooner than you thought, you’ve soared past the halfway point and its blinding flash of brilliant light and touched down. Yoma takes your hand as you navigate your way out of the elevator, and is soon clutching it tightly as he looks out at the small township, then past it. There’s a light in his eyes that strikes you as familiar - ah, yes, the delight of an explorer setting foot on a new, alien world.");
	output("\n\nNot wanting to waste time, you do another quick check of your shields "+ (pc.isNude() ? "" : "and clothing ") +"to make sure you’re not about to freeze over, before gently tugging your android companion’s hand to snap him out of his reverie. He laughs, caught off guard, before letting you lead him out.");
	output("\n\nYou spent a good few minutes trailing behind him, thoroughly amused at how fascinated he seems by every little thing, from what he deems as odd rock formations to the natives - who seem far more skittish than usual. Strength in numbers, you’d wager.");
	output("\n\nAfter a while though, he speaks up, a more serious tone in his voice than you’re used to. <i>“Ah, [pc.name], perhaps I should not have waited so long to mention this to you...”</i> he trails off, ears flicking nervously. <i>“I received a message from Master Xinyi a week or so ago. He is doing much better and should be meeting up with me on Mhen’ga soon.”</i>");
	output("\n\nYou nod, not quite sure what he’s getting at.");
	output("\n\n<i>“Well, I...”</i> another pause, another nervous ear flick. <i>“I am really not sure how to introduce you both. I know you will get on fine, and my master is not the jealous sort but what am I to say? ‘Hello this is [pc.name] Steele and I spent more time fucking [pc.himHer] than I did being a stand-in Rusher?’”</i>");
	output("\n\nMuch as you try, you can’t help but laugh at the sheer bluntness of the statement, earning you a brief glare before he laughs a little too, taking your point.");
	output("\n\n<i>“Okay, okay, I suppose I should not be that short about it. But One almighty, I do not even know myself where we stand! Am I your lover? Just a fuckbuddy?”</i>");
	output("\n\nOh. You really were hoping that this wouldn’t come up until after you were finished here, but Yoma seems quite anxious to know.");
	output("\n\nSo, how do you see your relationship?");

	processTime(45);

	clearMenu();
	addButton(0,"Lovers",yomaThirdDateSetRelationship, true, "Lovers", "Dates, sex, tabletop RPGs... What’s not to love?");
	addButton(1,"Fuckbuddies",yomaThirdDateSetRelationship, false, "Fuckbuddies", "You take your friends on dates too, right?");
}

public function yomaThirdDateSetRelationship(lovers:Boolean):void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	if (lovers) {
		output("You can’t help it. There’s a reason why you keep coming back to Mhen’ga after all this time, and he’s looking right at you.");
		output("\n\nThe android blinks a few times, struggling to process for a few moments that feel more like hours to you, before you’re bodily tackled into the nearest snowdrift by the force behind the launching hug sprung on you.");
		output("\n\n<i>“I did not dare hope, [pc.name]. I have been telling myself I was foolish to consider the possibility, let alone blurt it out to you like I did. I kept thinking ‘oh, do not be so silly, [pc.heShe] has so many possibilities better than someone else’s robot’... But I am so, so glad to be proved wrong.”</i>");
		output("\n\nThe words are half mumbled into your chest, uncharacteristic shyness evident in every tense inch of your companion’s form. Compelled, you gently take his chin in one hand, pressing what starts as a chaste kiss to his soft lips. He’s soon reciprocating, impassioned to the point where you’re half expecting him to jump you");
		if(flags["YOMA_DATE_ELEVATOR_SEX"] == 1) output(", even so soon after that last fuck");
		output(", but he pulls back eventually.");
		output("\n\nStanding up, he offers you a hand and you realize that - oh - you’re still lying in the snow. You take his hand"+ (pc.isMischievous() ? ", tugging it playfully like you might just pull him back down, before you " : " and") + " let him help you up, not letting go even after you’re back on your feet. He helps you dust off the worst clumps sticking to you"+ (pc.isNude() ? " and giving you a playful swat on the [pc.ass] as he does" : "") + ", before ");
		if (pc.tallness < 63) output("leaning down");
		else if (pc.tallness == 63) output("leaning in");
		else output("tugging you down");
		output(" to plant another light kiss to your [pc.lipsChaste].");
		output("\n\n<i>“I love you, [pc.name].”</i>");
		output("\n\nYou love him too.");

		flags["YOMA_RELATIONSHIP"] = 1;
	}
	else {
		output("You just can’t do it. Yoma’s a good friend to you, and an even better fuck, but try as you might you just can’t return his romantic feelings.");
		output("\n\nThe android blinks a few times, struggling to process for a few moments that feel more like hours to you, before his ears droop, looking down at his feet dejectedly.");
		output("\n\n<i>“I knew it was a foolish hope, [pc.name]. I kept thinking ‘oh, do not be so silly, [pc.heShe] has so many possibilities better than someone else’s robot’... But I suppose I understand. One cannot force love, after all.”</i>");
		output("\n\nThe words are half mumbled, but you hear fine. Compelled to do something, anything, to snap him out of how upset he seems, you wrap an arm around his shoulder and pull him in for a loose hug.");
		output("\n\nIt takes a while, but he does eventually cheer up to a point. There’s still an edge of something unpleasant in his tone when he speaks, but he puts on a brave face all the same.");

		flags["YOMA_RELATIONSHIP"] = 0;
	}

	moveTo("UVIP H40");
	processTime(30);

	clearMenu();
	addButton(0,"Next",yomaThirdDateMilodanEncounter);
}


public function yomaThirdDateMilodanEncounter():void
{
	clearOutput();
//	showYoma();
	showBust(bustDisplayMilodanMale(),yomaBustDisplay());
	showName("MALE\nMILODAN");
	author("GothPastel");

	if (flags["YOMA_RELATIONSHIP"] == 1 ) {
		output("The goal of exploration gets forgotten pretty quickly, constantly interrupted by pauses for quick makeout sessions, impromptu snowball fights, Yoma tripping into a far deeper snowdrift than the one you were knocked into earlier, and going completely off the rails after the two of you find a chunk of unrefined savicite, presumably left after some kind of mining operation.");
		output("\n\n<i>“Come on, [pc.name]! Anyone would think you were scared of a little rock!”</i> he taunts, darting back at you again, only to be met with a barrage of "+ (pc.AQ() <= 20 ? "poorly aimed " : "")+"snowballs"+ (pc.AQ() > 80 ? " - one of them hitting him right between the eyes and earning you a surprised screech." : "."));
		output("\n\n<i>“It’s too cold!”</i> You try to reason with him. ");
			if (pc.isBimbo()) output("<i>“Like, fucking is super fun and all, but I don’t wanna freeze my sweet ass off out here because you got me too horny to think of anything but eating you out!”</i>");
			else output("<i>“Wait until we’re somewhere warm, I don’t want frostbitten genitals!”</i>");
		output("\n\nHe lets up, thankfully, but not before tucking the thing into one of his inner pockets for future use. Of course, just as you think you’ve escaped, you’re pelted with a hastily made snowball yourself, Yoma crying out victorious.");
		output("\n\n<i>“Sweet, sweet vengeance!”</i> he laughs, narrowly avoiding your returning volley.");
		output("\n\nOh, come on, is that any way to treat your lover? So petty!");
		output("\n\nYour partner is easy to track, red clothing and dark skin standing out clearly against stark white snow as you chase him down again.");
	}
	else {
		output("The goal of exploration gets forgotten pretty quickly when, in an attempt to bring his trademark smile back to his face, you target him with a barrage of "+ (pc.AQ() <= 20 ? "poorly aimed " : "")+"snowballs. You instantly earn yourself a surprised shriek when "+ (pc.AQ() <= 20 ? "one of them makes" : "they make")+" contact, shocking him enough that he manages to trip himself into a pretty deep snowdrift.");
		output("\n\nAt first, you think he’s mad at you from the shake of his shoulders as you go to pull him up, but soon realize he’s laughing gleefully. Of course, just as you think you’ve escaped, you’re pelted with a hastily made snowball yourself, Yoma crying out victorious.");
		output("\n\n<i>“Sweet, sweet vengeance!”</i> he laughs, narrowly avoiding your returning volley.");
		output("\n\nOh, come on, that’s so petty!");
		output("\n\nYour friend is easy to track, red clothing and dark skin standing out clearly against stark white snow as you chase him down again.");
	}
	output("\n\nThe Milodan who emerges from seemingly nowhere though, is not.");
	output("\n\nYou don’t have any time for a reaction other than an undignified <i>squeak</i> of shock as you’re knocked prone, Yoma soon joining you when he backtracks to try and help. Both of you look up, meeting the ice cold and furious blue gaze of the sabre-toothed native as he speaks.");
	output("\n\n<i>“Scaring prey. Crush you.”</i> Comes the low rumble, and instinctively you reach for your weapons, only for your hand to be batted away as your companion sits up.");
	output("\n\n<i>“I am so sorry!”</i> Yoma starts, a frightened wide eyed grin spreading across his face as he talks.");
	output("\n\nVoid, is he really going to try and blag his way out of this? The towering hulk of a man is a primitive, you’ll be surprised if he can even keep up with how fast the android talks.");
	output("\n\n<i>“We will be out of your hair - fur, rather - immediately. We did not know this was the turf of an... imposing, powerful man such as yourself - did we, [pc.name]?”</i>");

	moveTo("UVIP N42");
	processTime(30);

	clearMenu();
	addButton(0,"Play Along",yomaThirdDateMilodanPlayAlong, undefined, "Play Along", "You’ll end up sucking dick.");
	addButton(1,"Fuck No",yomaThirdDateMilodanFuckNo);
}

public function yomaThirdDateMilodanPlayAlong():void
{
	clearOutput();
	showBust(bustDisplayMilodanMale(true),yomaBustDisplay());
	author("GothPastel");

	output("You can only play along, adding additional "+ (pc.isBimbo() ? "and heartfelt " : "") +"compliments of your own, hoping that the flattery will buy you a combat free way out of the situation.");
	output("\n\nEventually, the Milodan male lets out a derisive snort, but the enraged glint in his eyes is fading. Looks like you’ve talked your way out of a fight " + (pc.IQ() <= 20 ? "somehow. " : "."));
	output("\n\n<i>“Can stop talking. Use mouths to prove meaning.”</i> Comes the eventual response, and before you can so much as ask him to clarify the meaning, he’s shucking off the thin loincloth that just barely passed as clothing.");
	output("\n\nThe both of you look on in equal parts relief, nervousness, and arousal as the brute’s knotted, barbed cock rises out of its sheath inch by tantalising inch.");
	output("\n\nYou’re not sure who goes for it first. One moment the two of you are eyeing each other and the cock inbetween you, the next Yoma has his lips wrapped around the head of his cock, tongue flicking out to passage the blunt barbs around it, and you’re kissing and licking messily at the currently uninflated knot.");
	output("\n\nDeft hands on your head push you to focus on the Milodan’s balls instead, your fellow cocksucker choosing to deepthroat the thick meat presented to the two of you as you’re relegated to below, nuzzling at the native’s fat, productive orbs and breathing in the heady scent of his natural musk.");
	output("\n\nYou bring your hands up to cup them, aiding in your quest to fondle and kiss, and ohhh, they smell so good. Heady, masculine aroma fills your nostrils and clouds your mind with cocklust, pushing down all thoughts but the urge to serve, the sound of almost bestial grunts of pleasure from your aggressor, and the perfect melody of a well trained companion droid expertly sucking cock.");
	output("\n\nYoma pulls back for a moment, and you can’t help but take the opportunity to impale yourself to the hilt on the Milo’s cock yourself, synth-spit aiding your passage down it"+ (pc.canDeepthroat() ? ", not that you needed its aid," : "") +" and you moan both in delight and pleasure at managing the feat. The blunt barbs on his cock are oh so soft in comparison to the rock hardness of the rest of the glorious cock, serving to massage the inside of your throat, making it easier and easier with every bob of your head to suck and swallow and milk his cock like an eager slut "+ (pc.isBimbo() ? " - well, that’s not really far wrong." : "."));
	output("\n\nA certain fox isn’t to be outdone though, hands servicing the brute’s balls whilst his tongue presses into the his sheath, doubtless licking and pleasuring the sensitive flesh there, occasionally swapping to press messy kisses to the thickening knot whenever you pull up for breath.");
	output("\n\nIt soon turns into a competition of sorts - both of you are completely engrossed in your task and don’t let it distract you - but there’s no doubt about it. You both want to be able to hold the idea that <i>you</i> were the one to make the horny native orgasm above the other’s head.");
	output("\n\nVoid, you’re not even sure why you’re so horny. Maybe the savicite you found earlier? Maybe this pillar of masculinity really is just that perfect?");
	output("\n\nIt doesn’t matter.");
	if (flags["YOMA_RELATIONSHIP"] == 1) {
		output("\n\nYou reach down, "+ (pc.isFemale() ? "pushing two fingers into your drooling [pc.biggestCunt]" : "wrapping a hand around your [pc.cockBiggest]") +", only for Yoma to grab your wrist to stop you. For a horrible moment, you’re left exposed and untouched, but once he releases your wrist he replaces your hand with his own "+ (pc.hasCock() ? "jacking" : "jilling") +" you off with far more vigour than you could have managed for yourself.");
		output("\n\nIt’d be rude not to reciprocate, you think, and your hand practically moves of its own accord, slinking its way through a maze of thick fabric into your companion’s pants before plunging into that hot, always wet and ready pussy buried between soft, synthetic thighs.");
		output("\n\nThe Milodan towering over your kneeling forms seems close to his peak, clearly having got more than he bargained for with a couple of relatively harmless looking offworlders. You both realize at the same time and once again you’re not sure who actually goes for it first, but you’re almost instantly frenching messily, his cockhead sealed firmly between your matched lips.");
	}
	else {
		output("\n\nYou reach down, "+ (pc.isFemale() ? "pushing two fingers into your drooling [pc.biggestCunt]" : "wrapping a hand around your [pc.cockBiggest]") +", noticing that Yoma’s reaching into his own pants, doubtless frigging his cunt. It’s a damn hot sight, and you start "+ (pc.hasCock() ? "jacking" : "jilling") +" off even more vigorously than before.");
		output("\n\nThe Milodan towering over your kneeling forms seems close to his peak, clearly having got more than he bargained for with a pair of relatively harmless looking offworlders.");
	}
	output((pc.canDeepthroat() ? "Instinctually, you" : "You")+" make sure you’re the one who ends up with the cock down your throat when the three of you orgasm almost simultaneously, swallowing down as much of the thick load as you’re able before pulling back, letting the brute jerk himself off and painting the both of you with the last of his seed.");
	output("\n\nAfter a scant few moments of recovery, he’s pulling his loincloth back on, cock retreating back into his sheath as he does.");
	output("\n\n<i>“Not crush you. Starwalkers do good job. Go back to stars now,”</i> he grunts, before sauntering off, leaving you where you lay.");
	output("\n\nNeither of you are feeling particularly up to disobeying him, so once you’re done "+(pc.isBimbo() ? "licking" : "cleaning")+" the cum off each others faces you’re clambering to your respective feet, brushing snow away from cold lower legs. You keep it down a bit more on the way back to Irestead, not wanting to incur the wrath of any less forgiving natives when you’re still tired and sensitive from the last encounter. Luckily, the more direct route that Yoma seems to have calculated for you gets you home and dry much faster than the journey out did.");
	output("\n\nYou’re soon back on the elevator to Uveto station "+ (flags["YOMA_DATE_ELEVATOR_SEX"] == 1 ? ", a few Huskar giving you amused to aroused looks as if half expecting a repeat performance that they don’t receive" : "") +", and from there it’s only a short walk back to your ship.");
	output("\n\n<i>“I have really got to say, [pc.name], the two of us always seem to run into some kind of trouble, don’t we?”</i> Yoma asks half jokingly as he drapes himself over the back of your chair while you plot your route back to Mhen’ga. <i>“Do you think it is my bad luck, or yours?”</i>");
	output("\n\nIt’s got to be a combination, you wager. Sure, you have the benefits of rich parentage and a potential fortune to look forward to, he’s got "+ (flags["YOMA_RELATIONSHIP"] == 1 ? "at least two people" : "someone") +" that he’s clearly in love with... But on the other hand you’ve got your cousin to worry about and his "+ (flags["YOMA_RELATIONSHIP"] == 1 ? "lovers consist of a mostly absent Rusher and his own sickly owner" : "lover is still pretty far away, not to mention his illness") +". Makes sense that your good times often seem to have something go wrong at the end - it’s just par for the course.");
	output("\n\nHe hums, thinking about it, but nods. <i>“I cannot say that you are wrong there.”</i>");

	pc.applyCumSoaked();
	processTime(45);

	clearMenu();
	addButton(0, "Next", yomaThirdDateOutro );
}

public function yomaThirdDateMilodanFuckNo():void
{
	clearOutput();
	showBust(bustDisplayMilodanMale(),yomaBustDisplay());
	author("GothPastel");

	output("Yoma may have batted your hand away from your weapons, but one way or another you do <i>not</i> want to deal with this right now. Honestly, some people have no sense of timing.");
	output("\n\nYou "+(pc.RQ() <= 20 ? "clumsily " : "")+"roll to the side, grabbing your [pc.rangedNoun] and "+ (pc.rangedWeapon is Rock ? "chucking it as hard as you can manage" : "letting loose a hasty shot") +". It grazes the brute’s shoulder and he staggers back, caught off guard, giving your android "+ (flags["YOMA_RELATIONSHIP"] == 1 ? "lover" : "fuckbuddy") +" time to clamber to his feet.");
	output("\n\nMuch as you were expecting a trademark grin and another round of running like hell, it’s not what you get. Instead, you hear a piercing, screeching <i>scream</i> of fury as he leaps bodily at your would be attacker, claws and teeth bared.");
	output("\n\nFor a long, fearful moment, you actually think Yoma’s out for blood - but you manage, thankfully, to wrap your arms around him and tug him off. The Milo takes one final look at you both, deep scratches down his form, before absolutely booking it.");
	output("\n\nYour companion scrabbles for a moment, looking like he wants to chase him down, but a while of holding him still and reminding him that he’ll probably end up face down in another snowdrift calms him down, going limp until you put him back on his feet.");
	output("\n\nYou keep it down a bit more on the way back to Irestead, not wanting to incur the wrath of any less easily scared off natives when the adrenaline from the last encounter fades. Luckily, the more direct route that Yoma seems to have calculated for you gets you home and dry much faster than the journey out did.");
	output("\n\nYou’re soon back on the elevator to Uveto station "+ (flags["YOMA_DATE_ELEVATOR_SEX"] == 1 ? ", a few Huskar giving you amused to aroused looks as if half expecting a repeat performance that they don’t receive" : "") +", and from there it’s only a short walk back to your ship.");
	output("\n\n<i>“I have really got to say, [pc.name], the two of us always seem to run into some kind of trouble, don’t we?”</i> Yoma asks half jokingly as he drapes himself over the back of your chair while you plot your route back to Mhen’ga. <i>“Do you think it is my bad luck, or yours?”</i>");
	output("\n\nIt’s got to be a combination, you wager. Sure, you have the benefits of rich parentage and a potential fortune to look forward to, he’s got at least two people that he’s clearly in love with... But on the other hand you’ve got your cousin to worry about and Yoma’s lovers consist of a mostly absent Rusher and his own sickly owner. Makes sense that your good times often seem to have something go wrong at the end - it’s just par for the course.");
	output("\n\nHe hums, thinking about it, but nods. <i>“I cannot say that you are wrong there.”</i>");

	processTime(45);

	clearMenu();
	addButton(0, "Next", yomaThirdDateOutro );
}


public function yomaThirdDateOutro():void
{
	clearOutput();
	showYoma();
	author("GothPastel");

	if (flags["YOMA_RELATIONSHIP"] == 1 ) {
		output("You take a more intimate than sexual shower this time. Sure, there’s a bit of groping, ‘accidental’ or otherwise, here and there, but you spend far more time with your hands buried wrist deep in the silky soft synthetic fur of Yoma’s tail whilst his hands easing any remaining tension out of your shoulders.");
		output("\n\nThe rest of the flight is spent curled up together in your cockpit");
		if (yammiIsCrew()) output(" - only interrupted the once when Yammi brings you a hot drink that your android lover seems content to hold onto for you between sips, apparently liking the warm sensation after the cold of Uveto’s snow");
		output(". Neither of you have any real desire to move away from your positions, cuddled up and comfortable as you are, but unfortunately all good things come to an end, your partner sliding off your lap reluctantly as it comes time for you to land.");
		output("\n\nThe two of you hesitate for a while at the door to your ship. You don’t want to say goodbye, you don’t want to leave each other so soon, maybe not even at all, but you must. ");
		output("\n\nYou share a passionate kiss that leaves you gasping before Yoma withdraws, a sad look in his eyes at having to let you go. Nonetheless, he scoops up his bag and departs with a final <i>I love you</i>, and all you can do is watch him leave, heart heavy.");
		output("\n\nYou’ll see him again soon. You have to.");
		// reset jungle encounter
		yomaCooldown();
	}
	else {
		output("You shower separately this time, not wanting to send him too many mixed messages about the state of your relationship. The rest of the journey back to Mhen’ga is spent chattering about this and that, turning into a conversation of what sort of theme his new Caves and Cryptids campaign should have when you add Xinyi to the group.");
		output("\n\nBy the time you land, you feel confident in the idea that Yoma should be able to get over your rejection, though as you wave him off, you don’t feel like you’d blame him if he spent a week or so avoiding you as he works through it.");
		// reset jungle encounter
		yomaCooldown(true);
	}

	flags["YOMA_DATE_PROGRESS"] = 6;
	moveTo("SHIP HANGAR");
	showLocationName();
	processTime(600 + rand(30));
	//disable the dates for a couple of days
	flags["YOMA_BAR_DATE"] = 3 + (Math.floor(GetGameTimestamp() / 24 / 60));
	flags["YOMA_AT_BAR"] = 0;

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
