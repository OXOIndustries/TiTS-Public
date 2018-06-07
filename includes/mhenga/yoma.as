/* Android cuntboy by -GothPastel
 * https://docs.google.com/document/d/1UyMwEaKfiK6FNnNxCBF4EfqsSqS1RgZONiiUTmAydO8/edit#
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
 	pc.createStatusEffect("Yoma Cooldown", 0, 0, 0, 0, true, "", "", false, 24 * 60);
	if (flags["YOMA_MET"] == undefined) {
		output("You’re making your way through the jungle when you hear a crack behind you. Whipping around suddenly, you see a figure, too far away to make out in perfect detail but not far over five feet tall, slowly lifting their foot back off of a snapped twig. It’s definitely not a native, you realise - unless you’ve somehow missed a species with big fennec fox ears and tails.");
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
		output("You’re walking through the jungle when a familiar voice calls out: <i>“Greetings, [pc.name]!”</i>");
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

	output("You apologise to Yoma, saying you’re busy.");
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
		output("\n\n<i>“As uncivilised as the natives...? Brilliant.”</i> His face twists into a slight snarl, showing his artificially white and wicked sharp canines in stark contrast to his dark skin.");
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
	if (flags["YOMA_TALKED_ABOUT_HIMSELF"] == 0) flags["YOMA_TALKED_ABOUT_HIMSELF"] = 1;
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

	if (attackingEnemy.short == "huntress vanae") {
		IncrementFlag("MET_VANAE_HUNTRESS");
	//	CodexManager.unlockEntry("Vanae");
		CombatManager.victoryScene(vanaePCVictory);
		CombatManager.lossScene(vanaeHuntressPCDefeat);
		CombatManager.displayLocation("HUNTRESS");
	}
	else if (attackingEnemy.short == "maiden vanae") {
		IncrementFlag("MET_VANAE_MAIDEN");
	//	CodexManager.unlockEntry("Vanae");
		CombatManager.victoryScene(vanaePCVictory);
		CombatManager.lossScene(vanaeMaidenPCDefeat);
		CombatManager.displayLocation("MAIDEN");
	}
	else if (attackingEnemy.short == "female zil") {
		IncrementFlag("TIMES_MET_FEMZIL");
	//	CodexManager.unlockEntry("Zil");
		CombatManager.victoryScene(defeatHostileZil);
		CombatManager.lossScene(girlZilLossRouter);
		CombatManager.displayLocation("FEMALE ZIL");
	}
	else if (attackingEnemy.short == "zil male") {
		IncrementFlag("ENCOUNTERED_ZIL");
	//	CodexManager.unlockEntry("Zil");
		CombatManager.victoryScene(winVsZil);
		CombatManager.lossScene(zilLossRouter);
		CombatManager.displayLocation("MALE ZIL");
	}
	else if (attackingEnemy.short == "kerokoras") {
		IncrementFlag("MET_KEROKORAS");
	//	CodexManager.unlockEntry("Kerokoras");
		CombatManager.victoryScene(victoryAgainstTheFrogs);
		CombatManager.lossScene(loseAgainstTheFrogs);
		CombatManager.displayLocation("KEROKORAS");
	}
	else if (attackingEnemy.short == "naleen") {
		IncrementFlag("TIMES_MET_NALEEN");
	//	CodexManager.unlockEntry("Naleen");
		CombatManager.victoryScene(beatDatCatNaga);
		CombatManager.lossScene(pcLosesToNaleenLiekABitch);
		CombatManager.displayLocation("NALEEN");
	}
	else if (attackingEnemy.short == "naleen male") {
		IncrementFlag("TIMES_MET_MALE_NALEEN");
	//	CodexManager.unlockEntry("Naleen");
		CombatManager.victoryScene(defeatAMaleNaleen);
		CombatManager.lossScene(loseToDudeleenRouter);
		CombatManager.displayLocation("NALEEN MALE");
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
		else addDisabledButton(0,"Get oral","Get oral", "You need genitals for this scene.");
		addButton(1,"Give oral",yomaSexGiveOral);
		if (pc.isTaur() || pc.isNaga()) addDisabledButton(2,"Vaginal","Vaginal", "You need a more humanoid anatomy for this.");
		else if (!pc.hasCock()) addDisabledButton(2,"Vaginal","Vaginal", "You need a cock for this scene.");
		else addButton(2, "Vaginal", yomaSexVaginal);
		if (pc.hasCockTail()) addButton(3, "Cocktail", yomaSexCocktail);
		else addDisabledButton(3,"Cocktail","Cocktail", "You need a tail-mounted, parasitic penis for this.");
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
		if (pc.cumQ() <= 500) output("trickles");
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
		if (pc.cumQ() <= 500) output("trickling");
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
	output("\n\n<i>“[pc.Name], please,”</i> he begs, voice husky, and finally, finally you relent, pushing into him urgently.");
	output("\n\nHis thighs press against the side of your head in attempt to stabilize himself, shaky hands finding their way ");
	if (pc.hasHair()) output("into your [pc.hair]");
	else output("onto your head");
	output(" as he’s caught off guard by the sudden doubling of your efforts. You take his swollen clit into your [pc.mouthFull], sucking it gently at first, but soon, emboldened by the cries of pleasure he’s letting out, you step up the intensity.");
	output("\n\nVoid, he’s absolutely gushing.");
	output("\n\nAll of this is affecting you too, it’s hard not to be swept up in the moment with a cute android moaning out your name like this. You can feel ");
	if (pc.hasCock()) {
		output("your [pc.multiCockDescript] stiffening");
		if (pc.hasVagina()) output(" and ");
	}
	if (pc.hasVagina()) output("your [pc.vaginas] starting to leak");
	else output("a warmth rush to the empty expanse between your legs");
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

	if (pc.HPRaw <= pc.HPMax()) pc.HP(10);
	processTime(30+rand(15));
	pc.loadInMouth();
	pc.lust(10);
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

	if (pc.isNude()) output("Already naked, you wait for Yoma to finish undressing before you step closer to him.");
	else output("You join Yoma in stripping off, carefully putting your [pc.gear] somewhere you’ll be able to find them later and set down your codex.");
	output(" He looks you up and down before speaking, <i>“I can definitely show you a good time. How about you lie down?”</i>");
	output("\n\nThere’s no reason to protest, so you do so, clearing off the jungle floor so you don’t lie on anything sharp. The android grins, gently sitting down on your stomach, and you groan at the feeling of warm, wet cunt settling on top of you. Yoma takes your [pc.biggestCock] in a hand, and you know enough about him now to tell that he’s grinning from the gentle swish of his tail.");
	output("\n\n<i>“This will do nicely,”</i> he says, giving it a firm few strokes. You groan, his soft palm caressing you feels amazing.");
	output("\n\nIt doesn’t last long though, Yoma pulls his hand away from you - but not before giving your head one last, teasing touch - and lifts himself up, positioning himself. Your "+ pc.legs(false,true) +" are easily pinned beneath his and he turns to you with a wide, teasing grin when you try and fail to buck your [pc.hips] up to penetrate the sweltering pussy rubbing itself against your tip.");
	output("\n\n<i>“I am in charge, [pc.name], I will take this at my own pace,”</i> he says, before turning back to the task at hand.");
	output("\n\nAt first, he seems content to tease you, strong legs holding you in place as you leak pre into his bare snatch, but he suddenly tenses up, letting out a loud moan, he’s caught his clit on you. That’s all it takes for him to stop, re-adjusting himself and rapidly impaling himself on your length with a gasp.");
	output("\n\n<i>“Sh-shit [pc.name] that... That is good,”</i> he forces out, already setting to bounce up and down, tail flicking from side to side rapidly.");
	output("\n\nIt’s good for you too. He’s so <i>tight</i>.");
	output("\n\nYoma doesn’t waste any time, riding you at a decent pace, the walls of his slit fitting to you like a glove and massaging your cock. It’s absolutely heavenly, but not quite fast enough.");
	output("\n\nSitting forward, you take his wide hips in your hands and pull him down hard. His head tips back in a silent scream, his tail fluffing up.");
	output("\n\nDid he just... cum? Already?");
	output("\n\nThe slight flush you can make out on his face when he finally calms down and turns to look at you prove that he did. He shoots you a glare, but there’s an edge of playfulness in it. You’ve not <i>really</i> pissed him off.");
	output("\n\n<i>“I am going to have to redouble my efforts to get you off, am I not?”</i> he asks, and it’s the only warning you get before ")
	if (pc.tone >= 50) output("even ");
	output("your grip can’t hold him still. Yoma’s tail stands ramrod straight now, letting you get a glimpse of a very welcoming looking asshole, as he rapidly slams himself up and down on your [pc.biggestCock].");
	if (pc.hasVagina()) output(" He doesn’t leave your [pc.oneVagina] out either, reaching down between your legs to stroke your throbbing clit expertly, the sensation bringing you ever closer to orgasm.");
	output(" His hot, wet cunt grips you tight, and the fast, rippling motion brings you closer and closer to your climax.");
	output("\n\nEventually, you can’t hold back any longer and slam your hips up");
	if (pc.hasKnot()) output(", forcing your knot into him");
	output(", spraying cum into his waiting passage just as he peaks to a second orgasm, crying out loudly.");
	if (pc.cocks.length > 1 || pc.hasVagina()) {
		if (pc.cocks.length > 1) {
			output(" Your other cock");
			if (pc.cocks.length > 2) output("s");
			output(" unload onto the jungle floor ");
			if (pc.hasVagina()) output("and [pc.girlCumDescript] ");
		}
		else if (pc.hasVagina()) output(" [pc.GirlCumDescript] ");
		if (pc.hasVagina()) output("sprays over Yoma’s hand ");
		output("in your orgasm, and finally, finally your climax draws to a close.");
	}
	if (pc.hasKnot()) output("\n\nFor just a moment, he tries to pull himself back off your cock, but you hold him steady so that he doesn’t try and get your knot out until it goes down. Said deflation takes some time, what with Yoma’s pussy convulsing around you even now. At some point you sit up to wrap your arms around his waist, pressing gentle kisses to his neck. Eventually though, your knot goes down just enough for him to safely get off it and you release him.");
	output("\n\nYour hips are <i>soaked</i>, you realise as he pulls himself up. You had no idea just how wet he was!");
	output("\n\n<i>“You might need a towel, [pc.name].”</i> Yoma manages to pant out as he pulls his shirt back on, but he doesn’t produce one; not that you were expecting him to have it in the middle of the jungle.");
	if (!pc.isNude()) output("\n\nIt doesn’t take long to put back on your [pc.gear] and the");
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
	output("\n\n<i>“A parasitic life formlifeform?”</i> he asks, curiously, <i>“That is certainly interesting... It is not contagious, is it?”</i>");
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