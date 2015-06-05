// BET_AGAINST_SYRI				: 1 if PC has ever engaged in a bet with Syri
// FUCKED_SYRI_COUNT			: Number of times the PC has boned or been boned by the big-boned bitch.
// MET_SYRI						: 1 if the PC ever met her.
// TIMES_BET_YOURSELF_AGAINST_SYRI : You get the drill.
// TIMES_LOST_TO_SYRI			: Times you've lost betting to Syri!
// TIMES_WON_AGAINST_SYRI       : Times you've defeated her!
// TIMES_BUTTFUCKED_BY_SYRI		: Times lost AND been buttfucked.
// SEEN_SYRI_IN_THE_MORNING     : Times the PC has approached Syri in the mornings
// SYRI_BETTING_STORAGE			: Stores credit bet or 9001 if ass betting.
// SYRI_TALKS 					: Stores what talk scene to display next in the sequence. Scene 1 never repeats. YAY!

public function showSyriName():void
{
	if(flags["MET_SYRI"] == undefined) userInterface.showName("AUSAR\nGIRL");
	else userInterface.showName("\nSYRI");
}

public function syriIsCrew():Boolean {
	return false;
}
public function syriIsAFuckbuddy():Boolean
{
	if(flags["SYRI_TALKS"] != undefined) return true;
	return false;
}

public function syriGamesStart():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();

	author("Savin");
	//[Games] (Repeat)
	if(flags["MET_SYRI"] != undefined) {
		output("You make your way over to the small crowd of frontier gamers, parting through the group gathered around the current match. Syri's right in the thick of it, firing a hardlight rifle at some virtual foe one-handed as she gulps an ausar ale. Seeing you approach, she flashes you a grin.");
		//(If PC has NOT fucked her)
		if(flags["FUCKED_SYRI_COUNT"] == undefined) output(" <i>“Ready for a match, [pc.name]?”</i>");
		//(IF PC HAS fucked her)
		else output(" You can see the lust in Syri's eyes as she looks you over, licking her lips. <i>“It's your ass on the line, cow" + pc.mf("boy","girl") + ". Wanna play?”</i>");
	}
	//[Games] {Hasn't PLAYED yet}
	else {
		output("You make your way over to the small crowd that's circled up around the screens, pushing your way in just in time to see an alien man and woman standing almost shoulder to shoulder, hooked up in holo-bracers and hardlight projectors, furiously playing one of the newest shooter games. The male, a particularly broad-chested Zil, awkwardly maneuvers a projected rifle in his chitin-y, insectile fingers, brow furrowed in concentration; the woman beside him, a buxom xeno with a pair of perky wolf-ears towering over her pale, almost human face, has a cock-sure grin a mile wide, moving with a tactical precision that just screams military.");

		output("\n\nTurning your eyes toward the screen, you're just in time to see the wasp-man's character leap from cover and charge into a hail of lasers and bullets; the crowd yells out a deafening cheer as his avatar rifle-butts another player, perfectly mimicking the Zil's own motions. He thrusts his fist in the air, grabbing a beer from someone and knocking it back in one go. <i>“Not so cocksure now, Syri?”</i>"); 

		output("\n\nMost of the people around you join in, jeering at the ausar woman beside him.");

		output("\n\nJust as the Zil finishes speaking, the wolf-eared girl gives a predatory grin and squeezes the trigger on her holographic rifle. The Zil's screen shudders violently and goes blood-red; the player himself cries out as some sort of feedback zaps him, nearly throwing him to the floor.");

		output("\n\nThere's a long moment of silence - the entire tavern seems frozen in place - before the crowd around you groans and starts shelling out credit chits. The ausar marksman just keeps on grinning as she ditches the holo-gear, pulling herself up onto the nearest table and grabbing a beer.");

		output("\n\n<i>“Better luck next time, Jin,”</i>  she laughs, waving gaily as the burly bee stalks out of the tavern quite a few credits shorter.");

		output("\n\n<i>“Oh, what's this? Fresh meat for the grinder?”</i>  she laughs, eyeing you. <i>“What do you say, stranger, care to test your skill? One on one matches, three kills to win. Maybe for a little wager...”</i>");
	}
	//[Bet 10] [Bet 50] [Bet 100] [Not today] [Bet yourself]
	clearMenu();
	if(pc.credits >= 10) addButton(0,"Bet 10",betSyriCredits,10);
	else addDisabledButton(0,"Bet 10","Bet 10","You're too poor.");
	if(pc.credits >= 50) addButton(1,"Bet 50",betSyriCredits,50);
	else addDisabledButton(1,"Bet 50","Bet 50","You're too poor.");
	if(pc.credits >= 100) addButton(2,"Bet 100",betSyriCredits,100);
	else addDisabledButton(2,"Bet 100","Bet 100","You're too poor.");
	if(flags["TIMES_WON_AGAINST_SYRI"] == undefined) flags["TIMES_WON_AGAINST_SYRI"] = 0;
	if(flags["TIMES_LOST_TO_SYRI"] == undefined) flags["TIMES_LOST_TO_SYRI"] = 0;
	if(flags["TIMES_WON_AGAINST_SYRI"] + flags["TIMES_LOST_TO_SYRI"] >= 3) addButton(3,"BetYourself",betYourselfAgainstSyri);
	
	else addDisabledButton(3,"BetYourself");
	trace("SHIT ADDED UP: " + flags["TIMES_WON_AGAINST_SYRI"] + flags["TIMES_LOST_TO_SYRI"]);
	addButton(14,"Back",notTodayDogslut);
}

//Not Today
public function notTodayDogslut():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	output("You shake your head and take a step back. The ausar sighs and sips her beer, <i>“Well, if you ever change your mind, you know where the action is.”</i>");

	//[Back to tavern menu]
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Bet X]
public function betSyriCredits(amount:int = 0):void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	flags["BET_AGAINST_SYRI"] = 1;
	flags["SYRI_BETTING_STORAGE"] = amount;
	
	if(flags["MET_SYRI"] == undefined) {
		flags["MET_SYRI"] = 1;
		output("<i>“Sure,”</i>  you say, pulling up some credits on your codex tablet. <i>“Let's see what you've got, miss...”</i>");

		output("\n\n<i>“The name's Syri. Best shot in this dump - at least as far as video games go, anyway. Well come on then, step on up and grab a rig. Let's see what you're made out of...”</i>");

		output("\n\n<i>“[pc.name],”</i> you answer, picking up a bracer and visor.");
		clearMenu();
		addButton(0,"Next",syriGameRouting);
	}
	//{PC must succeed two high-difficulty ranged weapon attacks out of three to win.}
	else syriGameRouting();
}

//[Bet yourself]
public function betYourselfAgainstSyri():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	flags["SYRI_BETTING_STORAGE"] = 9001;
	output("<i>“Sure, but not for credits,”</i>  you say, letting your eyes play across the shapely curves and ample bust on the alien girl. Her tail twitches, nearly knocking over a beer bottle beside her.");

	//If First Time:
	if(flags["BET_AGAINST_SYRI"] == undefined) {
		output("\n\n<i>“Woah there, cow" + pc.mf("boy","girl") + ". Let's not get ahead of ourselves here. Maybe once you've proved what you've got, then we can see about... upping the ante. What do you say?”</i>");
		// [Return to normal bet menu]}
		clearMenu();
		addButton(0,"Next",syriGamesStart);
		return;
	}

	//If you've bet 3+ times against her
	if(flags["FUCKED_SYRI_COUNT"] == undefined) {
		output("\n\n<i>“Well, well, feeling brave are we?”</i>  the ausar girl says, slipping down from her perch to stalk toward you, hips swaying. She slips around you, one furry hand trailing across your [pc.hip]. <i>“Well, you're not bad looking and not the worst gamer I've seen... not by a long shot... but I feel like I ought to warn you, [pc.name],”</i>  she says, pressing herself up against you. At first, your mind can only think of the hefty, oh-so-soft orbs smushed against your back, a pert little teat on each rubbing across your [pc.armor]. After a moment, though, you feel a throbbing something... else... pressing against your [pc.butt].");

		output("\n\n<i>“I've got a little something extra, stranger. And if you lose, I'm going to bend you over this table and fuck your ass with a big knotty prick until I've got you nice and tied and screaming like a bitch in heat. Of course, if you somehow manage to win, you can ride my cock");
		//if PC has a dick:
		if(pc.hasCock()) output(" or pound my little pucker all you want, whichever suits your fancy. I don't judge.");
		else output(".");
		output(" So what'll it be, [pc.name]? Ready to put your ass on the line for a chance at mine?”</i>");
		//[Sure {Go to Bet X text}] [Not today]
		clearMenu();
		addButton(0,"Sure",syriGameRouting);
		addButton(1,"Nope",notTodayDogslut);
	}
	//If PC has won and fucked Syri more than not:
	else if(flags["TIMES_WON_AGAINST_SYRI"] >= flags["TIMES_LOST_TO_SYRI"]) {
		output("\n\nSyri licks her lips and slips down beside you, a furry hand running across your hip. <i>“I can't say I'm not looking forward to a chance to stick my cock in this fine slice of meat... though I gotta admit, losing to you isn't so bad either. Let's see what you've got!”</i>");
		//[Go to Bet X text]
		clearMenu();
		addButton(0,"Next",syriGameRouting);
	}
	//If PC has lost more than not:
	else {
		output("\n\nSyri licks her lips and slips down beside you, a furry hand running across your hip. <i>“You just keep coming back, don'tcha? It's like you just crave a nice ass full of my cock. Well, don't worry, I've got just the thing you need, my little bitch. You want to try your chances? Then let's see what you've got. But I've got a nice, thick load of cum built up just with your asshole's name on it.”</i>");
		//[Go to Bet X text]
		clearMenu();
		addButton(0,"Next",syriGameRouting);
	}
}

public function syriGameRouting():void {
	var won:Boolean = false;
	var misses:int = 0;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;
	if(rangedCombatMiss(pc,chars["SYRI"])) misses++;

	if(misses <= 1) won = true;

	if(won) {
		if(flags["TIMES_WON_AGAINST_SYRI"] == undefined) flags["TIMES_WON_AGAINST_SYRI"] = 0;
		flags["TIMES_WON_AGAINST_SYRI"]++;
	}
	else {
		if(flags["TIMES_LOST_TO_SYRI"] == undefined) flags["TIMES_LOST_TO_SYRI"] = 0;
		flags["TIMES_LOST_TO_SYRI"]++;
	}
	//Bet yourself?
	if(flags["SYRI_BETTING_STORAGE"] == 9001) {
		if(flags["TIMES_BET_YOURSELF_AGAINST_SYRI"] == undefined) flags["TIMES_BET_YOURSELF_AGAINST_SYRI"] = 0;
		flags["TIMES_BET_YOURSELF_AGAINST_SYRI"]++;
		if(won) pcBeatsSyriWhenSexBet();
		else pcLosesToSyriBettingHisAss();
	}
	else {
		if(won) winForCredits();
		else pcLosesToSyriCredBetting();
	}
}

//PC Wins the Shoot, Betting for Sex
public function pcBeatsSyriWhenSexBet():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	output("Nearly an hour passes in the game. The graphics are photo-realistic, the controls tight and precise. Every movement you make is perfectly mirrored in the game. The map is huge, and your character is slow. It's a maze, and soon you realize it's less skill in battle, here, than skill at the hunt. Just finding Syri in the ruined city map that the game has you in is challenging, and every time you think you've got her, she darts away. Finally, you slay her, putting a bullet between her avatar's eyes. The audience cheers, and more and more people gather as they realize you've got skill.");

	output("\n\nA moment later, though, your screen blacks out as a grenade blasts near you. The holo-harness buzzes, giving you a nasty jolt that leaves your teeth chattering. Respawn. You move stealthily, creeping across the ruins at a snail's pace. Shots are exchanged. You both retreat, licking your virtual wounds. You creep forward, cautiously taking the long road around the map, moving at a snail's pace. Tensions run high; the audience is at the edge of their seats. You think you catch sight of your opponent, moving away from you. You slip into a building, move to higher ground. Looking down the rifle's scope, you scan the rubble, looking for even the slightest movement.");

	output("\n\nThen you see her: crouched behind a burned-out hover car, waiting in ambush for you. You grin as you calmly take aim, putting your crosshair right over the virtual ausar's avatar before pulling the trigger. Syri yelps as her rig zaps her in time with the bullet blasting her character's head off. Spitting curses, the ausar throws her rig off. <i>“Holy fuck, how'd you hit me from WAY OVER THERE!?”</i>  she shouts, staring wide-eyed at her screen. A deal's a deal, though, and you answer by grabbing her and ripping her shirt off, baring her big, perky DD's.");

	output("\n\nSyri's breath catches as you cup one of her full mounds, twisting the pert red nipple between your fingers as you contemplate what to do with the defeated ausar.");
	//SEX MENU!
	clearMenu();
	if(pc.hasCock() && pc.cockThatFits(chars["SYRI"].analCapacity()*1.75) >= 0) addButton(0,"FuckHerButt",victoryFuckSyrisBunghole);
	else if(pc.hasCock()) addDisabledButton(0,"FuckHerButt","Fuck Her Butt","You'd split her in half if you tried to fuck her butt. Damn.");
	else addDisabledButton(0,"FuckHerButt","Fuck Her Butt","You need a dick to fuck her butt.");
	addButton(1,"RideHerDick",rideSyrisCockYouWinner);
	if(pc.hasVagina()) addButton(2,"Up My Pussy",rideSyriInYerCoochYaWinner,undefined,"Up My Pussy","Take your prize and stick it as far up your pussy as it will go.");
	else addDisabledButton(2,"Up My Pussy","Up My Pussy","You need at least one vagina on your crotch large enough to accept Syri's cock to play this scene.");
	addButton(3,"Uh, Nevermind",nevermindSyri,undefined,"Uh, Nevermind","On second thought, you'll pass on claiming your winnings this time.");
}

public function nevermindSyri():void
{
	clearOutput();
	showSyriName();
	author("Not Savin. HAH!");
	output("<i>“You get off lucky this time, ausar,”</i> you say as you spin the panting dickgirl away. <i>“But next time you might not be so lucky.”</i>\n\nShe looks a little confused at the reprieve and maybe even a little hurt, but she doesn’t show it for long. Besides, you’ve got better things to do than waste all your time screwing around in a bar.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Fuck Her Butt
//Req's any dick! Handles big dongs A-okay.
public function victoryFuckSyrisBunghole():void {
	clearOutput();
	userInterface.showBust("SYRI_NUDE");
	showSyriName();
	author("Savin");
	output("Unable to resist the urge to spread this dog-slut's legs and fuck her like the bitch she is, you flip Syri around and push her down onto the nearest table, pinning her arms behind her back. She squirms, struggling against you as your hand plays across her wide hips, squeezing one of her full cheeks beneath her pants. It's like putty in your hand, so soft and kneadable. Her tail twitches and flickers, swatting across your face as its owner tries to pretend she doesn't enjoy you playing with her big, delicious ass. You let her carry on for a few minutes as you grope her ass, starting to grind on her, cock swelling as it rubs against the coarse fabric of her clothes, feeling the radiant warmth of the ausar's body and the hypnotic movements of her hips.");
	output("\n\n<i>“Come on,”</i>  she growls, finally settling down a bit in your unrelenting grip. <i>“Just fucking get it over with already.”</i>");

	output("\n\nYou grin and with one deft motion hike her pants down, letting her throbbing erection pop free, slapping helplessly against the edge of the table as you drink in the thick crescents of Syri's bared ass. Moving her tail out of the way, you slip down and spread her cheeks with a probing pair of fingers, trailing from the base of her knotty red pecker across her taint and up to the puckered little ring of her ass.");

	output("\n\nSyri shivers as your finger passes across the clenched hole, but the unconscious wriggle of her hips is all you need to know she's ready for a pounding, even if she's casting haughty death glares over her shoulder. Chuckling, you spit right on her asshole, leaving a thick dollop of saliva right on the mark.");

	output("\n\nSyri gasps as the warm saliva drools across her ass, but you don't leave it there for long. Your finger goes to work with expert precision, circling around her ring with slow, thorough ease, gently swirling your lubricant in as you apply more and more pressure, right up until your finger pops into her pucker with a soft squelching sound.");

	output("\n\nThe ausar slut grits her teeth and groans as your finger probes into her, gliding in to the first knuckle with surprising ease. Her tail twitches as you delve into her ass, the pooch’s cock spasming thin little trickles of cum down the table edge and onto the floor. <i>“F-fuuuck,”</i>  she groans, voice little more than a hoarse whisper as you try to move deeper, spreading your spit along her anal walls. She gets tighter and tighter as you move in");
	if(flags["TIMES_BUTTFUCKED_BY_SYRI"] == undefined) {
		output(", making you wonder if she's ever had anything more than a few fingers back here");
	}
	output(". Her sphincter clenches powerfully around your second knuckle as it passes through, sliding deeper and deeper until you're able to feel a big, thick ball just through her muscles. Is that...?");

	output("\n\nYou roll your fingertip across the little ball, grinning to yourself as you watch Syri's prick jump to attention and spurt a nice big glob of pre right onto her foot. She groans, arching her back and digging her nails into the table as you toy with her prostate, milking it with even the gentlest touches. Oh, she's sensitive. So very, very sensitive.");

	output("\n\nAn irresistibly naughty thought crosses your mind: with a loud crack, you bring your other hand down hard on Syri's butt. She yelps, flesh jiggling as her muscles squeeze down like a thousand vices on your finger, nearly pushing it out. A huge blob of cum drools obscenely from her engorged prick as your digit is shot back across her pleasure nub, and Syri can't help but moan with pleasure, her prick throbbing in ecstasy, ready for, no, <i>demanding</i> more.");

	output("\n\nGiving the red mark on her ass an affectionate squeeze, you withdraw from her spit-filled hole and discard the last of your gear, letting your [pc.cock " + x + "] flop down into the tight little crevice of her wiggling cheeks. With your [pc.cockHead " + x + "] just sticking out from the middle of her crack, you arch an eyebrow as Syri's tail wiggles around your length, tip tickling your cumslit until it's stained and matted with the first drops of your own sexual need.");

	output("\n\n<i>“Don't just sit there,”</i>  the horny alien growls, tail caressing your cock until you shudder, waves of pleasure seething from the thousands of nerves on your crown. More seductively, voice bordering on a purr, she whispers, <i>“I'm waiting.”</i>");

	output("\n\nA predatory, sexual groan escapes your lips as your hips rock back, leveling your thick erection right at the bullseye between her cheeks. Syri even reaches back to pull them apart, giving you a straight shot into her waiting hole. With such a welcoming invitation, how could you refuse? You move forward, [pc.cockHead " + x + "] pressing into the spit-slick dark star, and immediately you can hear the thunk of Syri's prick jumping to attention, slapping wetly against the cum-soaked table, drooling in anticipation.");
	pc.cockChange();

	output("\n\nSyri starts to speak, but her voice catches as you push in, instead coming out as a high-pitched squeal as your prick spreads her wide, battering past her spasming sphincter and into the dark, warm, wet channel beyond. She grabs the table, trying to steady herself as your hips rock slowly forward, giving her just enough time to adjust to each and every one of your " + possessive(pc.cockDescript(x)));
	//{if cockLength >= 12:}
	if(pc.cocks[x].cLength >= 12) output(" many");
	output(" inches.");

	output("\n\n<i>“Oh, fuck. Fuckfuckfuck,”</i>  the ausar girl whines as you utterly spear her on your cock, her legs and tail twitching and her cock spasming as your thick length pushes inch after inch across her over-sensitive prostate. The act milks so much pre out of her in just one thrust that it pools between her paw-like feet, a white lake in contrast to her dark fur. For a moment, you stop your onslaught, [pc.chest] heaving as you revel in the vice-like grip of Syri's ass, trembling in pleasure as you feel her heartbeat pulsing through her body. Her battered pucker is gently squeezing your cock, practically massaging your dick as your [pc.cockHead " + x + "] squirts out the first thick glob of pre into your submissive little ausar slut's bowels.");

	output("\n\nYou sit still for a moment longer, and right on cue, Syri starts wriggling her hips for you, awkwardly humping on your cock to get a little more stimulation from the prick buried inside her. You respond with a sharp swat on the ass, making her yelp and clamp down hard on your [pc.cock " + x + "] just as you start to move. Grabbing her hips, you lay into the ausar's tight little ass, jackhammering into her with a vengeance. Once she's started, Syri can't stop - with every thrust she's crying out and moaning, hips thrusting back against and tail wagging wildly. Her back arches high, ears perked and tongue hanging out like the puppy-slut she is. You can feel her cock throbbing between her spread legs, spasming with every thrust that drags across her tiny bud.");

	output("\n\nYour buttfucking lasts for several more unrelenting minutes. You drill Syri's ass, treating her like your personal onahole. She whines and moans like a bitch in heat, responding to your every motion with a wag of her tail and a wiggle in her hips, vigorously humping you back. You barely notice when she tenses up, letting out a high-pitched shriek as her knotty prick erupts in a flood of hot seed that pours onto the table and her thighs, staining her tanned flesh white. You never let up for a second, only even acknowledging the alien dickgirl's orgasm with a harsh slap on the ass that gets her spasming ass squeezing even harder. She milks you hard, every muscle in her tight ass writhing in uncontrollable pleasure as your prick batters her prostate, pushing out load after thick, creamy load from her bright-red doggy dick.");

	output("\n\nThe canine rear's convulsions eventually push your proud resolve to its brink. Sinking your fingers into Syri's thick kiester, you roar a primal exaltation and slam your prick home ");
	if(pc.cockVolume(x) > chars["SYRI"].analCapacity()) output("until you're giving her every inch the poor ausar can take");
	else output("to the hilt");
	if(pc.balls > 0)
	{
		output(". Your [pc.balls] churn");
		if(pc.balls <= 1) output("s");
	}
	else output(". Your prostate clenches");
	output(" and your [pc.cockHead " + x + "] blasts the first massive load into Syri's guts, shooting a thick stream of [pc.cumColor] seed deep into her bowels. The ausar girl groans and cries as your burning love fills her, the excess spurting out around your [pc.cock] as you hammer her, fucking her right through the orgasm until you're completely spent.");

	output("\n\nPrick still lodged in Syri's well-fucked ass, you heave a heavy sigh and wipe the sweat from your brow. Beneath you, the ausar girl's breath comes in short little gasps, her breasts rising and falling erratically as she tries to pick herself up from the table. <i>“D-damn, [pc.name]. You're a fucking machine. Gods and spirits I'll be sore for days after that reaming....”</i>");

	output("\n\nYou reach down and squeeze one of her delightfully squishy cheeks, promising ");
	if(pc.isNice()) output("you'll take it easy on her next time");
	else if(pc.isMischievous()) output("that she'll have to get used to it if she doesn't get on your level next time");
	else output("that she'll be walking bow-legged when you're done with her next time.");

	output("\n\n<i>“Next time... it's </i>your<i> ass, [pc.name],”</i>  she growls, pulling your cock out - which only serves to unleash a flood of your pent-up seed that spills down between her cheeks and along the cleft of her swinging sack.");

	//If PC = Hard:
	if(pc.isAss()) output("\n\nYou grab your gear and stumble off, smirking, as Syri slinks away to the bathroom to clean up, leaking your cum behind her as she goes.");
	else output("\n\nYou give Syri an appreciative slap on the ass, making the sun-kissed skin of her taut bum jiggle, cum drooling obscenely from her violated hole as her muscles clench. You help the ausar-girl to her feet, legs shaking after your rectal reaming, and help her get to the bathroom to clean up before you collect your gear and stumble off.");
	processTime(30+rand(15));
	pc.orgasm();
	chars["SYRI"].loadInAss(pc);
	chars["SYRI"].orgasm();
	if(flags["FUCKED_SYRI_COUNT"] == undefined) flags["FUCKED_SYRI_COUNT"] = 0;
	flags["FUCKED_SYRI_COUNT"]++;
	pc.exhibitionism(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Ride Her Cock
public function rideSyrisCockYouWinner():void {
	clearOutput();
	userInterface.showBust("SYRI_NUDE");
	showSyriName();
	author("Savin");
	output("If her tone was half an indicator, Syri wanted to bend you over the table there and fuck your ass raw. And to be honest, you wanted her cock up your ass, too. Otherwise, why the hell would you have bet yourself? You won, and it's time to take your reward: a nice, knotty cock to spread your [pc.asshole] wide. You grab the ausar girl by the hips and push her back against the wall, cupping her breasts and drinking in her earthy musk. Syri gives a sharp gasp, but as soon as your lips wrap around one of her pert nipples, she gets the idea. Her legs hug your [pc.hips], and you feel a furry hand brushing ");
	if(pc.hasHair()) output("through your [pc.hair] ");
	else output("across your head ");
	output("as the ausar girl lets you get her ready in your own time, suckling on her big, soft breasts before trailing your hands down to her waist. You unzip her pants, eliciting a pleased sigh from the wolf-slut as her stiffening prick pops free, thick and red and succulent... and all yours.");

	output("\n\nYour fingers wrap around her prick, and a few rough strokes have Syri arching her back and moaning, a faint pool of white pre pooling in her crimson urethra. With a grunt, you turn the both of you around, pulling back from the wall and dumping Syri onto the nearest table, prick sticking straight up like a flag pole. You hike her legs over your shoulders and get to work on it, [pc.tongue] lapping up her veiny underside. She groans in sexual delight, legs wrapping around your neck to urge you on, nearly forcing her prick into your mouth. Instead, you turn it aside, letting it nuzzle against your cheek as you look up at the sexy ausar, tongue snaking out to gently caress her rod, leaving it nice and wet, shining in the dim light.");

	output("\n\n<i>“You're skilled with your tongue, [pc.name], I'll give you that,”</i>  Syri pants, bare chest heaving as you ramp up your oral attentions, slathering her prick with licks and kisses. <i>“Oooh, that's good. D-don't forget the knot... it's the best part...”</i>");

	output("\n\nYou give the ausar a quick swat on the thigh to remind her who's in charge... but then, you've got to get that lubed up anyway. You move down, dragging your tongue from tip to taint, making sure to lavish her thickening knot with saliva, getting it positively coated. With every twitch of your tongue, Syri seems to gasp in quiet pleasure, breath catching as exploring hands brush her thighs and grope her upturned ass, fingers digging into the pliant cheeks before brushing her wagging tail.");

	output("\n\n<i>“If this is what I get for losing... I might not try so hard next time,”</i>  Syri moans as your lips wrap around her cockhead, taking the first inch into your eager mouth. With a self-conscious hiss, she adds, <i>“J-just kidding. I'll ream you good for this, [pc.name]. Especially if you don't give head as good as you can lick.”</i>");

	output("\n\nAnother annoyed swat on the ass shuts her up again, letting you work in peace. You suckle on her prick, enjoying the few dollops of pre Syri gives you: she's saltier than a human would be, and oh so much thicker... the musk is incredible, earthy and alive. Her cock tastes so good... so alien... so right. Before you know it your lips are caressing her thick knot, sucking on her swelling bulb like a candy as her prick discharges a thick, salty load right down your throat. Trying to grin around the cock in your mouth, you let your hand snake down the half-oblivious ausar's backside, finger probing between her full cheeks for the entrance to her back door.");

	output("\n\nSyri stifles a gasp as your finger pushes through her tightly clenched sphincter, delving into her tight little anus, giving her a taste of what she's about to get to do to you. With gentle swirls, you bring your finger deeper, basking in the feeling of her confused muscles trying to repulse you, sphincter clasping your knuckle like a perfect, fleshy ring. Finally, you find your goal: the tiny little bud of her prostate, just beyond the walls of her ass. One little touch has her cock spasming, a steady trickle of her inhumanly hot seed pouring down your throat as your finger starts to work her over, massaging her cum-maker until it's on auto-pilot. Cum rushes through Syri's engorged prick like a charm.");

	output("\n\nYou pull out of her, giving her a gentle pat on the ass as you start to ease off her cock, letting your tongue linger for a few long moments on her pointy, pre-stained tip before her prick pops out of your maw with a wet squelch. You can see Syri's eyes are practically crossed with pleasure, her chest heaving - you're sure to reach up and give her a quick grope, enjoying the full orbs of her big double-D tits for a few moments before you crawl up onto the table, straddling her");
	if(pc.legCount == 1) output(" as best as you can manage on your [pc.leg]");
	output(" with your bare ass hovering over her spit-and-cum-slick cock.");

	output("\n\nManaging a little smile, Syri plants her hands on your [pc.hips]: not forcing you down, no, she's learned her lesson. Instead they simply rest on your hips, holding you gently as her thumb caresses your bare [pc.skin], surprisingly affectionate. Hell, why not... you lean down and plant a quick kiss on her lips, softly nibbling on her lower lip when she tries to return the gesture. Your hands move up, cupping her breasts, ready to use her for support as you start to lower yourself down. Her prick's like a steel rod, perfectly erect and ready, slick with all the lubricant you've lavished over it. When the tip presses against your opening, it slides in almost effortlessly, passing your relaxed sphincter. A low groan escapes your clenched teeth as you slide down Syri's slick fuckstick, all the way down until you can feel her swelling sphere pressing into your ass.");
	pc.buttChange(chars["SYRI"].cockVolume(0),true,true,false);

	output("\n\n<i>“N-not the knot,”</i>  Syri whines. <i>“You don't wanna be here for hours, do you?”</i>");

	output("\n\nYou tweak her nipple, telling her you'll be here just as long as you want. Still, you relent, contenting yourself to rocking your [pc.hips], enjoying the feeling of Syri's lengthy, veiny red cock spearing your ass like the buttslut in you deserves. You can feel her pulse right through her prick, the rhythmic twitch of her cock buried deep up your ass, the last inches tenderly fucking your hole with every motion.");

	output("\n\nWith a lusty groan, you start to bounce. The sensation of her cock dragging out of your hole is exquisite, every vein in her throbbing dick sliding through your [pc.asshole], drooling thick streams of pre in its wake. Syri moans, hands gripping your [pc.hips], teeth clenched as you pull up until her cock's barely inside you, the tip just past your sphincter, before you slowly slide back down, your bowels eagerly welcoming her lengthy member back. The second bounce is faster; you're practically slamming back down on her with the third. You ride her cock like a bitch in heat, crying and screaming as your ass takes Syri's cock again and again, impaling yourself on her knotty prick until creamy streams of her salty pre are rolling out of your ass and back down her cock. Syri throws her head back and screams as you grab her tits, kneading the soft orbs between your fingers with every bounce.");

	output("\n\n<i>“Fuck me, fuck me, fuck me,”</i>  she groans, almost insensate by the time her back arches, cock spasming as you feel a burning hot load blast into your bowels. You yank her up, pulling the lusty wolf-bitch into a kiss as another salty burst smears your anal walls, nearly throwing you over the edge of pleasure. She groans in your arms, body writhing as she cums for you.");
	//if PC has tits:
	output("\n\n");
	if(pc.biggestTitSize() >= 1) output("Your tits press into hers, mashing your [pc.chest] into her hefty orbs, nipples flicking across each other until the ausar slut takes your [pc.nipple] into her mouth, her hands grabbing your [pc.butt]. ");
	output("With one final bounce, you nearly take her swelling knot; you feel the huge orb nearly tearing you apart, stretching you even wider as your ass is painted white by another creamy load, shot deep inside by the throbbing puppy pecker buried in you.");

	output("\n\nAn explosion of ecstasy rocks your body, a thousand nerves responding to the wonderful, musky load being fucked into your ass as Syri's knot nearly lodges itself in you - only to be pulled out at the very last moment, nearly sending you over again as a flood of cum drains out your [pc.asshole]. With a heavy, sated sigh, you roll off her, [pc.chest] heaving as you revel in the sensation of hot alien seed pouring out of your abused hole. A moment later, Syri flips onto you, straddling your [pc.hips], cock still bubbling the last trickles of her orgasm. She leans in, feinting to catch you off guard before planting a kiss right on your lips.");

	output("\n\n<i>“That was... wow, [pc.name]. You'd better come back for another game, you hear me?”</i>");

	output("\n\nSyri slips away, grabbing her shirt from the floor before turning back to you with a predatory grin.  <i>“And next time... I'm on top.”</i>");
	processTime(30+rand(15));
	if(flags["FUCKED_SYRI_COUNT"] == undefined) flags["FUCKED_SYRI_COUNT"] = 0;
	flags["FUCKED_SYRI_COUNT"]++;
	pc.orgasm();
	pc.loadInAss(chars["SYRI"]);
	chars["SYRI"].orgasm();
	chars["SYRI"].orgasm();
	pc.exhibitionism(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu)
}

//PC Wins the Shoot, Betting for Creds
public function winForCredits():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	output("Nearly an hour passes in the game. The graphics are photo-realistic, the controls tight and precise. Every movement you make is perfectly mirrored in the game. The map is huge, and your character is slow. It's a maze, and soon you realize it's less skill in battle, here, than skill at the hunt. Just finding Syri in the ruined city the game has you in is challenging, and every time you think you've got her, she darts away. Finally you slay her, pulling a bullet between her avatar's eyes. The audience cheers, and more and more people gather as they realize you've got skill.");

	output("\n\nA moment later, though, your screen blacks out as a grenade blasts near you. The holo-harness buzzes, giving you a nasty jolt that leaves your teeth chattering. Respawn. You move stealthily, creeping across the ruins at a snail's pace. Shots are exchanged; you both retreat, licking your virtual wounds. You creep forward, cautiously taking the long road around the map, moving at a snail's pace. Tensions run high; the audience is at the edge of their seats. You think you catch sight of your opponent, moving away from you. You slip into a building, move to higher ground. Looking down the rifle's scope, you scan the rubble, looking for even the slightest movement.");

	output("\n\nThen you see her: crouched behind a burned out hover car, waiting in ambush for you. You grin as you calmly take aim, putting your crosshair right over the virtual ausar's avatar before pulling the trigger. Syri yelps as her rig zaps her in time with the bullet blasting her character's head off. Spitting curses, the ausar throws her rig off, demanding to know where you were and what hacks you were using. But despite her grousing, a few moments later your codex makes a happy chirp, announcing that " + num2Text(flags["SYRI_BETTING_STORAGE"]) + " credits have been added to your account.");

	output("\n\n<i>“Not bad, [pc.name],”</i>  she says, offering you a hand. <i>“But watch your ass: I'll fuck up your shit next time around.”</i>");
	pc.credits += flags["SYRI_BETTING_STORAGE"];
	processTime(10+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//PC Loses the Shoot, Betting for Creds
public function pcLosesToSyriCredBetting():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	output("Nearly an hour passes in the game. The graphics are photo-realistic, the controls tight and precise. Every movement you make is perfectly mirrored in the game. The map is huge, and your character is slow. It's a maze, and soon you realize it's less skill in battle, here, than skill at the hunt. Just finding Syri in the ruined city the game has you in is challenging, and every time you think you've got her, she darts away. Finally you slay her, pulling a bullet between her avatar's eyes. The audience cheers, and more and more people gather as they realize you've got skill.");

	output("\n\nA moment later, though, your screen blacks out as a grenade blasts near you. The holo-harness buzzes, giving you a nasty jolt that leaves your teeth chattering. Respawn. You move stealthily, creeping across the ruins at a snail's pace. Shots are exchanged; you both retreat, licking your virtual wounds. You creep forward, searching the rubble for a target: it's a silent ghost town, with no life in sight. You move forward, steadily checking every corner, taking cover when you think you might be vulnerable.");

	output("\n\nBut you never had a chance to see her. From behind, you hear the loud whine of a laser rifle, and suddenly the rig is zapping you, your avatar exploding in a hail of gore. You throw the holographic gear off as Syri's character rushes your corpse, giving it a thorough tea-bagging before she sets her own gear aside.");

	output("\n\n<i>“Not bad, [pc.name], but you've gotta learn to watch your ass,”</i>  she grins, her tail flicking around to brush your [pc.hips]. <i>“But not bad all the same. Little practice and you'll be ready for the big leagues.”</i>");

	output("\n\nYou sigh and tap a button on your codex, transferring the credits to the triumphant ausar. She shoots you a wink and saunters off for a drink, leaving you to contemplate your strategy for next time.");
	pc.credits -= flags["SYRI_BETTING_STORAGE"];
	processTime(20+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//PC Loses the Shoot, Betting for Sex
public function pcLosesToSyriBettingHisAss():void {
	clearOutput();
	userInterface.showBust("SYRI_NUDE");
	showSyriName();
	author("Savin");
	output("Nearly an hour passes in the game. The graphics are photo-realistic, the controls tight and precise. Every movement you make is perfectly mirrored in the game. The map is huge, and your character is slow. It's a maze, and soon you realize it's less skill in battle, here, than skill at the hunt. Just finding Syri in the ruined city the game has you in is challenging, and every time you think you've got her, she darts away. Finally you slay her, pulling a bullet between her avatar's eyes. The audience cheers, and more and more people gather as they realize you've got skill.");

	output("\n\nA moment later, though, your screen blacks out as a grenade blasts near you. The holo-harness buzzes, giving you a nasty jolt that leaves your teeth chattering. Respawn. You move stealthily, creeping across the ruins at a snail's pace. Shots are exchanged; you both retreat, licking your virtual wounds. You creep forward, searching the rubble for a target: it's a silent ghost town, with no life in sight. You move forward, steadily checking every corner, taking cover when you think you might be vulnerable.");

	output("\n\nBut you never had a chance to see her. From behind, you hear the loud whine of a laser rifle, and suddenly the rig is zapping you, your avatar exploding in a hail of gore. You throw the holographic gear off as Syri's character rushes your corpse, giving it a thorough tea-bagging as the player herself tears off her holo-bracers, a predatory grin on her lips.");

	output("\n\nBefore you can even look away, the ausar woman's on you like a animal, spinning you around and pinning you down on the table, hands held behind your back. You yelp out in surprise, nearly drowned out by the jeering of some of the nearby dive dwellers. <i>“Silly little bitch, thought " + pc.mf("he","she") + " could actually outshoot me. Well, a deal's a deal, meat,”</i>  Syri chuckles");
	if(!pc.isNude()) {
		output(", roughly tearing off your [pc.gear] to expose your [pc.butt].");
		if(pc.hasCock()) output(" [pc.EachCock] pops free in the process, flopping helplessly against the edge of the game table as your clothes are torn off. It throbs with your quickening heartbeat as the alien undresses you, hardening slightly as you hear her own trousers drop.");
		else output(" Your heartbeat quickens as you hear Syri's trousers drop.")
	}
	else {
		output(", roughly grabbing hold of your completely exposed form.");
		if(pc.hasCock()) output(" [pc.EachCock] flops helplessly against the edge of the game tables as you're handled. It throbs with your quickening heartbeat, hardening slightly as you hear Syri's trousers drop.");
		else output(" Your heartbeat quickens as you hear Syri's trousers drop.")
	}
	output(" Syri's pants hug her ankles as the alien girl pushes you down hard and gropes your [pc.butt], clawed fingers scouring the sensitive flesh. You wince as she digs her fingers into you, squirming under her domineering assault.");

	output("\n\n<i>“Stop moving, dammit,”</i>  she snaps, giving you a hard smack on the ass. You yelp, feeling your anxious pucker clenching");
	if(pc.hasCock()) output(" and [pc.cocks] throbbing");
	output(" as the alien dickgirl spits into her hand, slathering a little bit of much-needed lube onto her own cock. You feel a hand spreading your cheeks, and brace yourself for the coming reaming - only to feel a gentle caress. You look over your shoulder, seeing Syri on her knees behind you, cheek rubbing on your taut flesh. <i>“What?”</i>  she snaps, giving you a sudden swat that sends shivers up your spine and quivers through your [pc.skin]. <i>“I'm an ass girl like you wouldn't believe. Humans have the best butts in the whole wide galaxy. So soft and squishy and gropable, I could fuck 'em for days and days. And you... have a magnificient ass. Oh, I'm going to enjoy this");
	if(pc.ass.looseness() >= 4) output(", though not as much as you, if you're half the buttslut this gaping maw of a hole makes you look like");
	output(".”</i>");

	output("\n\nChuckling to herself, Syri lets her long, rounded tongue drag through the cleft of your behind");
	if(pc.hasCock()) output(", stopping at the top to reverse course, slipping down and down your ass until she reaches the [pc.sheath " + x + "] of your [pc.cock " + x + "]. Your ignored member jumps to life as Syri's tongue laps at the hilt of your prick, bringing you to full mast in a matter of moments. <i>“Poor little guy, looks so lonely down here. He needs a nice, tight little ass to fill, huh? Maybe if you step up your game, you'll get to fuck mine,”</i>  she says, planting a kiss on your head");
	output(". She steps back, standing and grabbing her prick and stroking it fiercely. She grunts with effort, vigorously jerking herself off as one of her hands caresses your [pc.asshole], thumb pushing and probing at your tightly clenched hole.");

	output("\n\n<i>“What's that adorable rhyme you humans have? Little fig, little fig, let me in,”</i>  she coos, <i>“or I'll woof and I'll woof and I'll fuck your ass in.”</i>");

	output("\n\nYou grimace, but relax as much as possible, letting her probing thumb in. Syri sighs happily, still vigorously stroking off as her thumb plays around in your kiester, getting you nice and ready for the real fun. When she finally pulls out, you're left feeling strange and empty, though not for long. Syri moves in, grabbing your [pc.hips] and slipping her cock into your crack, letting you feel all eight inches of red puppy pecker, from pointy tip to the thickening knot at her base. You dread the moment when that monster comes, but you can't help but wiggle your [pc.hips] as Syri starts to move hers, thrusting into your moistened crack. A wet squelching sound taints the air as the ausar girl humps your behind with short, eager movements that soon have a big, swelling <i>something</i> pushing your cheeks apart.");

	output("\n\nLeaning down right next to your ear, Syri breathes, <i>“You know, an Ausar knot can stay filled for hours. Your earth dogs have nothing on us, [pc.name].”</i>  She leaves you with a wet, affectionate lick across the cheek as she straightens and leans back, gripping her giant bitch-breaking boner and lining up with your puckered hole. You brace yourself as the pointed tip presses against your [pc.asshole], barely putting any pressure on your ass at all before she leans back, grabs your flanks, and rams it home. Your mouth gapes in a wordless, silent scream, your voice failing as inch after inch of throbbing alien cock slams into your ass, stretching you apart. Your fingers dig into the tables, leaving long marks as your anal passage becomes Syri's personal cocksleeve, wrapping around the girthy girl-boner until her thickening knot presses against you, utterly hilted.");

	//If PC is uber-tight:
	if(pc.ass.looseness() < 2) output("\n\n<i>“O-oh shit you're tight... what were you doing, betting this little pucker, huh? Trying to suffocate my cock or something?”</i>");
	// if mid-tight: 
	else if(pc.ass.looseness() < 4) output("\n\n<i>“OH, yeah, that's right. Take every inch, little bitch,”</i>  the ausar girl pants, reaching up to stroke your hair.");
	// if supah-loose: 
	else {
		output("\n\n<i>“Hoooly shit, [pc.name], what do you shove up here - people? God damn, I'm </i>hung<i> and there's enough room back here for two of me.”</i>  She swats your behind, trying to get you to tighten up for her. Her attention, though, goes to some of the bystanders to your sexual submission: <i>“Hey, that wasn't an invitation. This time. Avert your eyes.”</i>  And more quietly, just for you, she adds: <i>“You're loose enough for a few guests, huh? Maybe next time we'll wager you between all the regulars. That might just fill this [pc.asshole] of yours up, huh?”</i>");
	}
	pc.buttChange(chars["SYRI"].cockVolume(0),true,true,false);

	output("\n\nYou groan, entire body shuddering around the thick prick spearing it. Syri keeps still inside you, her veiny cock pulsing and throbbing in your clenched anal tunnel, letting you slowly adjust to its presence before she moves. Involuntarily, your body shivers as you feel a thick, steaming hot plop of canine pre drip into your ass, much hotter than any human seed. You groan as the ausar girl gently rocks her hips, dragging the smear down your rectal walls until just her tip is spearing you, holding your hole open as she adjusts her grip on your [pc.hips] and slides back in. She pauses at each zenith of movement, fucking you with agonizing slowness.");
	if(pc.hasCock()) output(" [pc.EachCock] twitches against the table's side each time her thick tip rolls across your prostate, and soon you're dribbling a steady stream of [pc.CumColor], staining the faux wood and dripping onto the floor. Pretty soon, you've left a nice little lake between Syri's furry legs.");
	if(pc.hasVagina()) 
	{
		output(" As the ausar's nails dig into your hips, [pc.oneVagina] clenches around nothing but air, begging for a cock to suckle and drain, for some way to coax a little bit of pleasure for itself out of this anal reaming. Grinning down at you, Syri's hand drifts from your behind down");
		if(pc.legCount > 1) output(" between");
		output(" your [pc.legOrLegs], a pair of fingers dipping into your [pc.vaginas]. <i>“I'm nothing if not a very... giving lover,”</i> she chuckles as her hot knot presses against your [pc.asshole].");
	}

	output("\n\nAgain and again the ausar's hips slap loudly into your [pc.butt], the sound of flesh on flesh echoing as your dog-cocked dominator picks up the pace, hammering your ass with increasing vigor. Soon, her long tongue lolls listlessly from her agape mouth. Syri's panting with pleasure as she spears you over and over on her long knotty rod. You can feel a lake of her hot, salty pre bubbling in your hole, thick streams of it leaking out around her pounding prick to stain your thighs. Suddenly, a huge geyser of the thick alien cream seems to erupt into you; you cry out as Syri picks up to a furious pace, moaning with abandon as her prick spasms into you, flooding you with what feels like an endless tide of her cum. The boiling batter comes and comes, every thrust dumping more of her hot seed into your bowels until you feel bloated, stomach churning with the oncoming flood of ausar-cum.");

	output("\n\nMinutes pass, leaving you heaving and groaning and pinned to the table as Syri collapses atop you, breasts pressing hard into your back. Her cock twitches in your rectum, little trickles of her cooling seed dribbling out around her engorged knot, just outside your worn hole. <i>“How's it feel to be mounted and bred, " + pc.race() + "?”</i>  she chuckles, her tone surprisingly affectionate. <i>“Don't pretend you didn't enjoy being my little bitch for the night, [pc.name]. A perfect ass like this...”</i> she gropes your cheek, kneading it between downy fingers, <i>“...can't possibly lie.”</i>");

	output("\n\nYour only reply is a low moan as she gently rocks her hips back, pulling her spent prick from your ass. <i>“Just be glad I didn't give you the knot, or we'd be here for hours. Of course, if that's what you really want, little bitch, I'm sure that can be arranged. ");
	//If first time:
	if(flags["TIMES_BUTTFUCKED_BY_SYRI"] == undefined) output("  We'd need somewhere more private for you to get a real taste of ausar cock, though. But then, you've got a ship, hmm?");
	output("”</i>");

	output("\n\nSyri chuckles as she pulls out, leaving your hole feeling empty and well-stretched; your stomach gurgles plaintively, churning as her thick cum drools throughout your bowels. Plenty of it leaks out your [pc.asshole], dripping onto the dusty floor. She steps back and pulls up her pants, giving you a playful swat on the [pc.butt] as she saunters away to the bar, high-fiving some of the other regulars who just watched you get thoroughly plowed. Red-faced and leaking, you gather your gear and stumble to the restroom to get cleaned up.");
	if(flags["TIMES_BUTTFUCKED_BY_SYRI"] == undefined) flags["TIMES_BUTTFUCKED_BY_SYRI"] = 0;
	else flags["TIMES_BUTTFUCKED_BY_SYRI"]++;
	if(flags["FUCKED_SYRI_COUNT"] == undefined) flags["FUCKED_SYRI_COUNT"] = 0;
	flags["FUCKED_SYRI_COUNT"]++;
	chars["SYRI"].orgasm();
	pc.exhibitionism(1);
	processTime(30+rand(15));
	pc.orgasm();
	pc.loadInAss(chars["SYRI"]);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Mornings!
public function approachSyriIntheMorning():void {
	
	if (syriPuppyslutmasEntry())
	{
		return;
	}
	
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	//[Syri] (First Time)
	if(flags["SEEN_SYRI_IN_THE_MORNING"] == undefined) {
		flags["SEEN_SYRI_IN_THE_MORNING"] = 0;
		output("You walk over to the lusty ausar gamer and grab a seat, peering over the top of her data slate. <i>“Hey. What'cha got there?”</i>");
		output("\n\nSyri grins up at you, <i>“Reading. New Graeme Black book. Some shitty ausar translation. I love humans to pieces but fuck your language and call it Sally.”</i>  You cock an eyebrow at the alien woman and her human literature. <i>“What? I can't just sit around and play videogames  </i>all<i> the time, Steele.”</i>");
		output("\n\nYou chuckle and call for a drink - nothing too stout this early. Burt gives you a little nod and passes something pale your way. It tastes foul, but what doesn't on a backwater?");
		output("\n\n<i>“So,”</i>  Syri says, putting aside her book, <i>“what's up, " + pc.mf("handsome","cutie") + "?”</i>");
	}
	//[Syri] (Repeat)
	else {
		output("You slip into your seat beside the lusty ausar. She grins and sets her book aside, giving you a quick peck on the cheek before reclining, tail wagging gaily. <i>“What's up, " + pc.mf("handsome","cutie") + "?”</i>");
	}
	flags["SEEN_SYRI_IN_THE_MORNING"]++;
	/*
	Syri's Options:
	[Talk]
	[Sex] (After 1st Talk)
	[Let's Play] (After 1st Talk)
	[Appearance]
	[Leave]
	*/
	syriMorningMenu();
}

public function syriMorningMenu():void
{
	clearMenu();
	addButton(0,"Talk",talkToSyriRouter);
	if(flags["SYRI_TALKS"] != undefined) {
		if(pc.lust() >= 33) addButton(1,"Sex",syriSexMenu);
		else addDisabledButton(1,"Sex");
	}
	addButton(2,"Appearance",syriAppearance);
	if(flags["UNLOCK_SYRI_ANNO_TALK"] != undefined) addButton(3,"Anno",syriTalksAboutAnno);
	addButton(14,"Leave",leaveMorningSyri);
}

//[Leave]
public function leaveMorningSyri():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	output("You sit and chat with Syri for a few minutes, little more than gossip and idle banter. Eventually, though, you decide to hit the road. She stands as you do, slipping close enough to feel her breasts pressing against your [pc.chest]. <i>“See you around, Steele. Stop by for a game this afternoon, will ya? I get bored without someone of... skill...”</i>");
	output("\n\nShe gives you a wink and a quick pat on the ass before sending you on your way.");
	processTime(5+rand(3));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function talkToSyriRouter():void {
	//[Talk] 1 (Talks play in order; Talk 1 does NOT repeat after)
	if(flags["SYRI_TALKS"] == undefined) {
		flags["SYRI_TALKS"] = 1;
		syriTalkOne();
	}
	else if(flags["SYRI_TALKS"] == 1) {
		flags["SYRI_TALKS"] = 2;
		talkToSyriNumber2();
	}
	else if(flags["SYRI_TALKS"] == 2) {
		syriTalkThree();
		flags["SYRI_TALKS"] = 3;
	}
	else {
		talkToSyriNumber4();
		flags["SYRI_TALKS"] = 1;
	}
}

//[Talk] 1 (Talks play in order; Talk 1 does NOT repeat after)
public function syriTalkOne():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	output("<i>\"Hey,”</i>  Syri says, crossing one leg over the other - just enough to hide the not-insignificant bulge in her pants. <i>“Sorry if I'm a little rough on you at game time. I get pretty into it, you know? Especially when I've got a nice piece of ass on the line.");
	//If PC usually wins:
	if(flags["TIMES_WON_AGAINST_SYRI"] > flags["TIMES_LOST_TO_SYRI"]) output(" Not that I really mind losing to you, either. I'm a top, but being on bottom can be good, too. You sure make it fun.”</i>");
	else output("”</i>");
	output("\n\nShe gives you a little smile - a surprisingly shy one - and takes a sip of her drink. <i>“Hey, if you ever want to get out of here... have a little fun, I mean...”</i>  she fidgets nervously, <i>“You can always swing by and pick me up in the mornings. No fight for dominance shit, just two friends and a bed. W-we're friends, right? We haven't known each other very long, I mean, but once you stick a cock up someone's ass... sorry. I'm probably making an ass of </i>myself<i>, but hey, I'm lonely and I like you.”</i>");

	output("\n\nSyri gives you a wan smile at that, looking pointedly away and at her plate. <i>“You're the only other gamer in this dump who can give me a run for my money, and you're pretty great in the sack... on the table... whatever. Hey, even if you just wanna flop down on the couch and play some vidya for funsies, I'm game for anything. Doesn't have to be just sex all the time.”</i>");

	output("\n\nLooks like Syri wants to spend more time with you. You could shoot her down, of course - not everyone's into having a horny wolf-girl with a dick hanging around. Then again, she's a good lay and pretty good with a holo-controller. Could be fun to hang out with.");
	processTime(2);
	clearMenu();
	addButton(1,"Shoot Down",shootSyriDown);
	addButton(0,"Sure",sureBeFuckFriendsWithSyri);
}

//Shoot her Down
public function shootSyriDown():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	output("<i>“Sorry,”</i> you say, withdrawing, <i>“Not interested.”</i>");

	output("\n\nSyri's shoulders slump, but she nods her understanding. <i>“Roger that. No hard feelings; I'm used to it.”</i>");

	output("\n\nShe sighs and turns back to her book, leaving you to walk away in silence.");
	//{Syri can be approached again at the bar in the AM, re-triggering the conversation until the PC decides having her around is just peachy keen}
	flags["SYRI_TALKS"] = undefined;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sure, why not?
public function sureBeFuckFriendsWithSyri():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	output("<i>“Really? Awesome!”</i>  Syri says, jumping up and grabbing you in a big bear hug. <i>“We're gonna have a blast, you and I. Friends to the end!”</i>");
	output("\n\n<i>“Hey, you're the captain of a ship, right? I saw you dock a while ago. That's hot stuff. You should give me a tour sometime... </i>Captain<i> Steele. I haven't been on a spaceship in ages, and I'd love to see your... captain's quarters,”</i>  she says, giving you a wink as her hand brushes playfully across your thigh.");

	output("\n\nYou nod, telling her you may do just that.");
	//{Return to Syri's root menu}
	clearMenu();
	addButton(0,"Next",approachSyriIntheMorning);
}

//Talk 2
public function talkToSyriNumber2():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	output("Talking with Syri for a few minutes, the topic eventually drifts towards her past. You can't help but ask, then, where'd the dick come from?");

	output("\n\n<i>“Oh, this little thing?”</i>  Syri laughs, uncrossing her legs in a very unladylike manner. <i>“Sorry, sorry. What, don't think my parents just had a dickgirl fetish and popped me out with it?... I think there's a law against that, actually. But no, yeah, you got a big throbbing puppy pecker on your mind, Steele? Better question is, where'd my girly bits go? I'll, uh, let you know when they show up again. Till then I'm just holding on to this prick for safe-keeping until Valden gets back.”</i>");

	output("\n\n<i>“What.”</i>");

	output("\n\n<i>“That was, uh, probably the strangest thing I could possibly say without context, huh?”</i>  Syri laughs, grabbing a drink from the bar. <i>“So picture this: ausar invented the warp gates, right? My great great something great grandfather was part of the project. Science runs big in the Dorna family, see, and my sister gets this hare-brained idea to miniaturize the gates. She works for one of the Ausaril Star-Kings, part of the Akkadi R&D group, which is super-prestigious in case you don't keep up with tech news, so she's got the budget for it. So why not? Instant teleportation, just add warp beacon.”</i>");

	output("\n\n<i>“And I was stupid enough to sign up to test the prototype. Long story short, my commanding officer, Lieutenant Commander Valden and I go through the gate. I pop out the other side with a cock, and Valden vanishes with my cunt. Now I'm on medical leave until Valden pops out of some dimensional asshole and I get my dangly bits sorted out. Fuck me for volunteering, right?”</i>");

	output("\n\n<i>\"Ouch. So why not get a new one?\"</i>");

	output("\n\n<i>“New vag? Meh. I kinda dig the D, to be honest. Peeing standing up is great, and it's not like I ever wanted to be a mother anyway. Plus, not doing the whole heat thing every year is, uh, a plus. That could just be Valden talking, though. There's like a... 22 percent?... chance he's in here with me somewhere.”</i> She laughs, rapping a knuckle on her head.");

	output("\n\n<i>“Only thing I really regret is the discharge. I coulda had my own ship in a couple years. Captain Syri Dorna, </i>A.F.S. Somethingorother<i>,”</i>  she chuckles, taking another drink. <i>“Anyway, that's pretty much the whole story. At least as much as I can say without violating an NDA. And probably getting shot by some navy spook in a dark alley.”</i>");

	processTime(5+rand(5));
	clearMenu();
	addButton(0,"Next",approachSyriIntheMorning);
}

//Talk 3
public function syriTalkThree():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	output("<i>“What're you reading?\"</i>  you ask, nodding toward Syri's data slate.");

	output("\n\nThe ausar shrugs, <i>“Some shitty fantasy book. They're practically giving 'em away on Congo. But they're all just so... hackneyed. Village boy hero loses everything, slays dragon slash evil wizard, acquires princess. Lather rinse repeat. Blech. This one,”</i>  she pokes her slate, <i>“is literally 'I am a farmer. I will now slay a dragon, which carried off a princess.' No, really. That's the plot, hand to god. I need to go back to reading Sci-Fi or something...”</i>");

	output("\n\nYou chuckle at that, mentioning that you're all practically living Science Fiction. Or at least, the sci-fi of yesteryear.");

	output("\n\n<i>“Yeah, that's why I stopped reading it. Every time someone would put out a new idea, it was reality a couple years later. Takes the imagination out of everything when I figure, 'hey, my sister could make that.' I can just imagine what the guy who wrote </i>Dark Space Revelation<i> thought when the warp gates opened. Those were the books that inspired them, and the first gates were built in the author's lifetime. There's a statue of him in the square of Capital Bay back home.”</i>");

	output("\n\nYou ask Syri to tell you a little bit about the gates - her race's crowning achievement. She shrugs lightly sipping at her drink. <i>“Hey, I'm not exactly an expert: you want to know the deep quantum physics shit, talk to my sister. She's a genius about warp gates and wormholes and stuff. I'm just a dumb grunt. But hey, thank all the gods for the gates. Without them, I'd never have met you,”</i>  she grins, giving you an affectionate wink.");

	output("\n\n<i>“But back to reading... so, what're you into these days, Steele? Any good reads lately?”</i>");
	processTime(4);
	clearMenu();
	addButton(0,"Scifi",tellSyriYouReadScifi);
	addButton(1,"Fantasy",tellSyriYouReadFantasy);
	addButton(2,"Romance",tellSyriYouReadRomance);
	addButton(3,"Mystery",tellSyriYouReadMystery);
	addButton(4,"Books?",tellSyriYoureIlliterate);
}

//Sci-Fi
public function tellSyriYouReadScifi():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	output("You answer that most of what you've been reading is good old Science Fiction. Spaceships and time travel and wormholes galore. Syri nods attentively as you list off a few good books and authors, comparing their styles and subjects. She laughs as you relate the tropes and idiosyncrasies of the stories you've read lately, and how far-fetched or dead wrong some of the older books are.");
	syriBookTalkEpilogue();
}

//Fantasy
public function tellSyriYouReadFantasy():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	output("It's swords and sorcery, elves and dwarves and dragons for you. That catches Syri's interest, and in moments you're deep into conversation, exchanging favorite authors and comparing your latest reads. When you bump into something you've both read, you're soon laughing and joking about the stories, picking out favorite characters and more heart-wrenching or laughable moments, and Syri's trying to convince you to start playing RPGs...");
	syriBookTalkEpilogue();
}
//Romance
public function tellSyriYouReadRomance():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	output("You mention you've been reading a lot of romances, and that promptly gets you a good few teases from the ausar girl as you try to relate the deep characters and heart-warming plots you've gotten off to lately. She laughs it off, saying that romances are just porn for girls... but then adds that she might have maybe read a few in her time, and once the dam is broken, you're both soon giggling about your favorite series.");
	syriBookTalkEpilogue();
}

//Mystery
public function tellSyriYouReadMystery():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	output("You tell Syri that you're all about the mystery novels: murders and gothic castles and hard-boiled detectives. She perks an ear, adding that she's seen some old detective movies, but that kind of book never got popular on her world. Soon, you're telling her all about the genre, sharing your favorite authors and the best of the best books. She grabs her slate and starts scrolling as you talk, grabbing titles at your suggestion for later perusal.");
	syriBookTalkEpilogue();
}
//Books? Pfft.
public function tellSyriYoureIlliterate():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	output("You shrug and mention that you really haven't read anything at all lately. Syri makes a mock gasp of horror at the notion, and grabs her data slate. <i>“Well, we'll just have to rectify that, Captain Steele. Now, let's start you off with some new Rondell Ramus books... and maybe a little Capser van Beck. Oh, and Imono Flaest's new one - it's a bestseller already, and it just came out today. Fifty billion copies by the time I woke up.”</i>");
	output("\n\n<i>“Here we go...”</i>  she grins, tapping her screen. A moment later you codex announces that you have mail.");
	syriBookTalkEpilogue();
}

//(Recombine)
public function syriBookTalkEpilogue():void {
	output("\n\nWith dozens of good books exchanged, you feel practically enlightened and ready to expand your mind when you get the chance to crack open a good book.");
	//[Tiny INT increase?]
	pc.slowStatGain("intelligence",1);
	clearMenu();
	addButton(0,"Next",approachSyriIntheMorning);
}

//Talk 4
public function talkToSyriNumber4():void {
	clearOutput();
	userInterface.showBust("SYRI");
	showSyriName();
	author("Savin");
	output("Thinking back to previous conversations, you ask Syri exactly what she does for a living. She's on medical discharge, so does she get a pension or something?");

	output("\n\n<i>“Oh, what's this? Do I have a petty little gold digger on my hands?”</i>  Syri teases, giving you a conspiratorial wink. <i>“Here to sweep me off my feet and get ol' Syri to take care of you forever after? Heh. I can just imagine the money you've got coming to you without my help, " + pc.mf("Mister","Miss") + " Steele. What, don't act surprised, I know who you are. My sister - the hare-brained transporter chick? - she works for your damn company. Must be nice to be loaded like that!”</i>");

	output("\n\n<i>“I, uh, haven't exactly gotten my hands on my inheritance yet,”</i>  you admit, taking a few minutes to explain the quest that's sent you out into the void... and reminding Syri she hasn't answered your question.");

	output("\n\n<i>“Oh, fine. Nosey little shit, aren't you? Yeah, the Joint Ausar Fleet pays me a little stipend to keep me from starving, but it doesn't buy shit on the homeworld. That's half of why I'm out here in the boonies, where everything's barter or on the cheap. And hey, there's actually work for someone like me out here.”</i>");

	output("\n\nSomeone like you?");

	output("\n\n<i>“Not a 'hot babe with a cock and a smart mouth' if that's what you're thinking.... Hey, come on, seriously. I have a degree, honest!”</i>  Syri sighs and grabs her drink, knocking about half of it back in one swill. <i>“I'm not </i>just<i> a pretty face, Steele. They bus engineers out here to the fringes by the boatload to get roads and housing set up, maybe power and sewage. It's not glamorous, but it pays the bills, you know? Ex-combat engineers like me are in especially high demand, since we can handle a gun and keep calm under pressure.”</i>");

	output("\n\n<i>“Combat engineer?”</i>  you ask, cocking an eyebrow.");

	output("\n\n<i>“Yep! 30th J.A.F. Royal Engineers. Put in eight years, right out of high school till the transporter snafu. Don't go thinking I'm some kinda badass commando or anything, though. Mostly had us building bridges or, if we were </i>really<i> lucky, blowing them up. Bridges and roads and shit fucking everywhere, man. But hey, I got to see the galaxy, from Terra and the Core Worlds to the Rendau Cluster and the Elyssian Expanse. And I built a bridge on all of 'em, let me tell you,”</i>  she sighs, finishing her whiskey.");

	output("\n\n<i>“So, ever see combat?”</i>  you ask.");

	output("\n\n<i>“Twice,”</i>  she says, somewhat hesitant. <i>“A rebel ambush on Rendau Nine. Kind of a skirmish, really. Scary as hell, but it wasn't big. Nobody died on either side, just took some pot shots at each other till the marines showed up. The second time... I, uh, went in with the first wave on Khaleen.”</i>");

	output("\n\nYou remember hearing about that back in school. A big joint operation between a bunch of Confederate armies that smashed a rogue planet's entire civilization to bits. It was big news at the time, and got a lot of people angry. From the far-away look the ausar's adopted, it doesn't look like she's in the mood to talk about it. Maybe later.");
	processTime(6);
	clearMenu();
	addButton(0,"Next",approachSyriIntheMorning);
}

//[Sex] 
public function syriSexMenu(outputs:Boolean = true):void {
	if(outputs) {
		clearOutput();
		userInterface.showBust("SYRI_NUDE");
		showSyriName();
		author("Savin");
		//(First Time Variant) 
		if(flags["SYRI_SEEN_PCS_SHIP_CABIN"] == undefined) {
			flags["SYRI_SEEN_PCS_SHIP_CABIN"] = 1;
			output("Looking around at the mostly empty bar and then the pretty ausar girl starting up at you, you ask if she'd like to get out of here.");

			output("\n\n<i>“Ooh, I thought you'd never ask, " + pc.mf("handsome","beautiful") + ",”</i>  Syri says with a wink and a grin, gathering up her scattered belongings. <i>“My place is kind of a wreck, so... let's head back to that ship of yours. You still owe me a tour of your ship after all, Captain...”</i>");

			output("\n\nSyri hooks her arm through yours, drawing close to you as you lead the way from Burt's bar to the docks. Soon you're walking in the shadow of your docked ship, heading up toward the elevator. Flahne, the rahn secretary, gives you a little wave - and a knowing wink - as you pass, and then you're in the elevator. The doors have barely closed before the lusty ausar grabs your arms, pulling you into a sudden kiss, her lips sucking on yours, tongue demanding entrance before you can recover. With a primal groan, Syri shoves you up against the wall, starting to pull your gear off as a furry leg hooks around your hip, locking her chest tight to yours. She moves in rhythmic undulations, grinding her crotch against yours");
			if(pc.hasCock()) output(", your [pc.cocks] stiffening as her knotty prick brushes up against you.");
			else output(", and you can feel her knotty cock hardening through her pants, a tantalizing taste of what's to come."); 

			output("\n\nShe breaks the kiss as the elevator locks into place at the top, just outside your airlock. Breathlessly, she whispers, <i>“how about a tour of the captain's cabin first...”</i>");

			output("\n\nYou give her the abridged version of the tour: the one where you're running through the access corridors, teasing and kissing and caressing as clothes and gear tumble to the floor, leaving a trail of armaments and underwear leading right up to your cabin door. You seal it behind you, and a moment later you're on your back, Syri straddling you, bare-breasted and panting right in your ear as her cock presses into your thigh, tip slick with her excitement. <i>“Nice digs. Now, how do you want me, captain?”</i>");
		}
		//Sex (Repeat Intro)
		else {
			output("You flash the sexy ausar a grin and ask if she'd care to go back to your place for a little fun. She feigns mulling it over but the rising tent in her pants betrays her, and soon Syri's gathered her bag and has her arm hook around your waist, letting you lead on toward the docks.");
			output("\n\nFlahne, the rahn secretary, gives you a little wave as you pass by her office - along with a knowing wink - and then you're in the elevator. The doors have barely closed before the lusty slut grabs your arms, pulling you into a sudden kiss, her lips sucking on yours, tongue demanding entrance before you can recover. With a primal groan, Syri shoves you up against the wall, starting to pull your gear off as a furry leg hooks around your hip, locking her chest tight to yours. She moves in rhythmic undulations, grinding her crotch against yours");
			if(pc.hasCock()) output(", your [pc.cocks] stiffening as her knotty prick brushes up against you.");
			else output(", and you can feel her knotty cock hardening through her pants, a tantalizing taste of what's to come."); 

			output("\n\nAs soon as you pass the airlock, clothes start flying. ");
			if(pc.mf("man","") == "man") output("Syri leaps into your arms, legs wrapped around your waist and bare breasts pressed into your face, letting your stumble towards your cabin as she lavishes you in gropes and kisses.");
			else output("Syri sweeps you up off your [pc.feet], pulling you into a fierce kiss as she stumbles toward your quarters, shedding clothes and gear behind you as her prick presses into your belly, growing steadily until her pants are gone, letting the rigid red rod prod your thigh.");
			output(" Your door slides open, and you and Syri go tumbling into the bed. A moment later, and the alien beauty is straddling you, gently pumping her pecker as she growls, <i>“Your call, [pc.name]. How do we do this?”</i>");
		}
	}
	//Sex Options @ Ship:
	clearMenu();
	//For Cockmeisters:
	if(pc.hasCock()) {
		if(pc.cockThatFits(chars["SYRI"].analCapacity()) >= 0) {
			addButton(0,"Cowgirl",syriReverseCowgirlConsensualization);
			addButton(1,"Missionary",missionaryWithTheDogDickedSlutSyri);
		}
		else {
			if(outputs) output("\n\nYou're too big to fuck her with it.");
			addDisabledButton(0,"Cowgirl");
			addDisabledButton(1,"Missionary");	
		}
	}
	else {
		addDisabledButton(0,"Cowgirl");
		addDisabledButton(1,"Missionary");	
	}
	//For Cuntlets:
	if(pc.hasVagina()) {
		addButton(2,"Vaginal",getVagFukkedBySyri);
	}
	else addDisabledButton(2,"Vaginal");

	//For All
	//Catch Anal
	//Blow Her
	addButton(3,"Blow Her",blowSyriYouFukkinSlut);
	addButton(4,"Catch Anal",catchAnalFromSyriIfYouDontUseACondom);
}

//Reverse Cowgirl
public function syriReverseCowgirlConsensualization():void {
	clearOutput();
	userInterface.showBust("SYRI_NUDE");
	showSyriName();
	author("Savin");
	var x:int = pc.cockThatFits(chars["SYRI"].analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("Brushing a hand across the ausar beauty's cheek, you tell her you'd like a front seat view of that nice, firm ass of hers bouncing on your cock. She grins down at you - the perfect opportunity for you to plant a kiss on her lips, cupping her cheeks and pulling her down. Her breath catches, voice melting into a low, contented moan as she relaxes in your arms.");

	output("\n\n<i>“Is that how you " + plural(pc.race()) + " say 'please'?”</i>  she says, moving down to kiss along your neck, then shoulders. <i>“I prefer to pitch, captain, but for you...”</i>");

	output("\n\nSyri turns around atop you, planting her pert little ass right in front of your face as she grabs [pc.oneCock] in her firm, furred grip, giving it a few experimental pumps. Your prick jumps to attention, right into her waiting maw. Her tongue flicks out, trailing from base to [pc.cockHead " + x + "] until her lips wrap around your glans, planting a kiss right on the tip top of your prick. You lean back and sigh as Syri goes to work, pumping the shaft of your [pc.cock " + x + "] as her mouth tends the head, slathering your first inches in wet ausar kisses.");

	output("\n\nShe's absolutely meticulous in her oral ministrations, unrelenting as she pumps your prick. Your hands slide up to her hips, digging into her taut ass cheeks and giving her a playful spank. Syri answers with a yelp that sounds a little too much like a bark before slurping up your [pc.cock " + x + "], lips sliding down your girth with seductively sensual slowness. As she gulps down your dick, the ausar girl lifts her bushy tail up and gives her hips an enticing wiggle. You figure you know what she's after, and quickly put a pair of fingers in your mouth, swirling your tongue around them much as Syri's doing to your own prick. You take your time, getting your digits nice and slathered before you spread Syri's taut, smooth cheeks, revealing her tight little pucker. She shivers as one of your cool, spit-slick fingers presses up against the dark hole, but a moment later and Syri relaxes, pushing back against your finger until it pops through her sphincter, sinking into her welcoming ass. Your [pc.cock " + x + "] comes free from the user's mouth as it falls agape, a low, feral moan escaping her lips as your finger plunges into her backside.");

	output("\n\nYou feel a tiny little bump at the tip of your finger, and immediately Syri's veiny red prick jumps to attention, a pearlescent bead forming at its pointed tip. <i>“Ooh, right there, Steele,”</i>  she groans, moving her hips ever so slightly. <i>“Thaaat's the spot. Mmmm yeah.”</i>");

	output("\n\nYou grin, happy to have found the sexy ausar's weak spot. You start to move your finger around, gently swirling it through her half-clenched back door, making sure to spread your slick spit all around. Syri's voice soon falls into little gasps and moans, barely more than girlish cries before she makes herself get back onto your [pc.cock " + x + "], sucking up your shaft again. You reward he renewed attentions with a few quick, short thrusts into her, rolling your fingertip across her little bud. She groans around your prick as her own twitches and throbs, dripping a nice, thick bead ");
	if(pc.biggestTitSize() < 1) output("right onto your chest");
	else output("right between your [pc.chest]");
	output(". You slip another finger in, spreading her well-lubed hole wide; Syri's breath catches, her mouth pulling off your [pc.cock " + x + "] with one final kiss on your [pc.cockHead " + x + "] before she pushes back hard on your hand, getting those fingers as deep in as she can.");

	output("\n\n<i>“Right there, [pc.name]. Riiiight there,”</i>  she breathes, sitting up and pushing back, practically bouncing on your fingers. She humps back against your hand until you think your whole fist is about to go disappear; finally, she relents, pulling off of you with tender slowness, savoring every inch before she's finally off of you. Casting a wolfish grin over her shoulder, Syri crawls down the bed until she's straddling your [pc.hips], your spit-slick [pc.cock " + x + "] standing erect between her legs. She grabs your prick, caressing your throbbing shaft with her silky-smooth fur as she slowly lowers herself down until your [pc.cockHead " + x + "] fits snugly between her cheeks.");

	output("\n\nWith a wiggle of her hips, Syri starts to hump your shaft. Leaning forward, she grabs your [pc.legOrLegs] for support, bracing her arms against them as she picks up the pace, hot-dogging your [pc.cock " + x + "] until you can see the streaks of creamy pre you're starting to leave in her crack, adding just the right amount of lube to your stiff cockhead for her to confidently start to position herself overtop it, ready for the main course.");

	output("\n\nSyri reaches between her legs, steadying your [pc.cock " + x + "] as she slides down it. Her breath catches as the [pc.cockHead " + x + "] pierces her sphincter, but soon she's cooing happily as your prick slides deep into her asshole. Before she even reaches the base, Syri's head is thrown back and her back is arched as her whole body reacts to the thick, throbbing, and clearly quite pleasurable invader. As she slides down, you can do little more than bite your lip and grab her hips, gently guiding the ausar's movements until after agonizing moments she's fully impaled on your [pc.cock " + x + "].");
	pc.cockChange();

	output("\n\nLeaning back in your lap, Syri lets loose a deeply feminine little moan, her bushy black tail swishing happily as she adjusts to the utter fullness of your [pc.cock " + x + "] embedded in her ass. After a moment of adjustment, Syri plants her hands on your [pc.knees], steadying herself on the edge of your bed as she starts to move. It's short, shallow movements at first, only pulling an inch or two up from your lap before descending back down, ending every slide with a satisfied moan or an emphatic twitch of the tail. As her pace starts to quicken, you move your hips up to meet her, thrusting back - but she quickly plants a palm on your chest, pushing you back down on the bed.");

	output("\n\n<i>“Oh no you don't,”</i>  Syri laughs, tickling your nose with her tail, <i>“You wanted a show, so sit back and relax. You'll need your strength if you're gonna keep up!”</i>");

	output("\n\nYou do as you're told - but not before giving her a square swat on the ass to send her back to work. Syri winks over her shoulder and then she's back at it, bouncing on your [pc.cock " + x + "] and giving you a full show of her ass: taut, perfect cheeks quivering with every movement, so yielding as you cup them in your hands, squeezing and kneading. This, at least, Syri doesn't seem to mind: the dog-slut's quick to wiggle her hips in your grasp, thrashing her tail happily as you playfully spank her, keeping her nice and tight on your dick. Her muscles respond to your every touch, squeezing your retreating shaft like a vice one moment, then open, slick, and welcoming the next as your prick slides home.");

	output("\n\nHer ass is the perfect fit for your [pc.cock " + x + "], sucking it in with every thrust and refusing to let go. Syri seems to agree, if her lusty pants and heaving breasts are any indication; and you can just glimpse her prick between thrusts, bouncing up and down with its owner's movements. Her cock is dribbling pre freely, your dick practically milking her prostate, rubbing out more and more of her alien dogspunk with every movement. Her knot's practically the size of an apple, a giant veiny red apple practically full to bursting with seed. She's getting close to the edge, if the hardly controlled spasms rocking her ass are any indication, and you can see her tongue lolling from her mouth as she pants and moans with abandon, riding your cock like a bitch in heat.");

	output("\n\n<i>“Come on, give it to me, Steele! Fuck my ass full of cum!”</i>  Syri cries, throwing her head back as she climaxes");

	//if knotty PC: 
	if(pc.hasKnot(x)) output(", coming down on your cock hard enough to finally take your engorged knot");
	output(". Her ass clamps down hard on your prick, nearly choking your rod as she cums. Your body's eager to join her, and soon you're letting loose a wave of [pc.cumColor] seed deep in her bowels as Syri's prick shoots a wad hard enough to splatter on the door halfway across the room.");
	//If Anno's in the crew, 10% chance:
	if((annoIsCrew() && this.rand(10) == 0) || silly) output(" Just as the first shot of ausar seed smears your cabin door, you hear Anno calling out, <i>“Sis, are you in here? I thought I heard-”</i>  and then, just as Syri's sister takes a step through your door, she's treated to a steaming hot shot of ausar cum. The startled tech cries out, flailing at her eyes before slamming the door closed, shouting something about coming back later. Syri laughs maniacally, though her tail curls up between her legs all the same.");

	output("\n\nBreathing hard and utterly spent, you survey the scene: Syri, sitting limp in your lap, cum drooling from her ass, falls back into your arms, nuzzling against your [pc.chest]. Pools of her seed trail all the way to the door, now plastered white. ");
	//If PC's cock has a knot: 
	if(pc.hasKnot(x)) output("With your own big, cum-stretched knot buried deep in the ausar's ass, it looks like you'll be together for at least a little while longer. You wrap your arms around Syri's waist, holding the pretty girl close as you both bask in the afterglow. She leans up, planting a little kiss on your cheek.");
	else output("Though there's no knot holding you together as two full ausars would be, Syri still curls up in your arms, resting her head on your shoulder and planting a kiss on your neck. You hold her close, basking in the afterglow.");

	output("\n\n<i>“That was... thanks, Steele. I needed that. Hope you liked the show.”</i>");

	output("\n\nRunning your fingers through her raven hair, you tell her that you most certainly did.");

	processTime(40+rand(10));
	pc.orgasm();
	chars["SYRI"].loadInAss(pc);
	clearMenu();
	addButton(0,"Next",syriSexOutro);
}

//Missionary
public function missionaryWithTheDogDickedSlutSyri():void {
	clearOutput();
	userInterface.showBust("SYRI_NUDE");
	showSyriName();
	author("Savin");
	var x:int = pc.cockThatFits(chars["SYRI"].analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("You grab Syri's waist and, with a grunt of effort, roll the both of you over. Syri gives a sharp cry of surprise as she's flipped onto her back, lips just below your own. Flashing you a grin, she leans up and kisses you, locking her lips to yours as she pulls you down atop her. You return the gesture, roving hands playing across her bare, beautiful body; your fingers trace up her smooth, toned gut to the soft, gropable mounds of her breasts. You cup one of her tits, squeezing the big, tender orb and teasing the stiff red teat at its tip. Syri's breath catches, but soon her fingers are running ");
	if(!pc.hasHair()) output("affectionately across your head");
	else output("through your [pc.hair]");
	output(", pulling your face right into her chest. Your mouth opens, accepting one of her cherry nubs, tongue rolling across its pert surface as your hand squeezes and kneads the other breast, making your lover squirm deeper into the bed.");

	output("\n\nYou latch onto her nipple, rolling it between your teeth, tongue caressing its peak until Syri moans with pleasure and pain. Letting the red teat go, you crawl up her svelte body, trailing kisses across her taut flesh until you can bury your face in her neck, biting and kissing and caressing as the ausar girl squirms, arms locking around your [pc.hips] to hold you tight. Already, her breath is coming ragged, heart pounding in her chest as you tease and play. Surprisingly submissive beneath you, Syri nuzzles against your cheek, letting you have your way with her body as you please. You press your lips to hers, running a hand through her raven hair, stopping only to scratch the wolf-girl between her towering ears. They twitch in response, and Syri lets out a girlish whimper of pleasure, biting her lip as you lavish her with affection.");

	output("\n\nHer velveteen hand brushes your cheek, training down your neck to ");
	if(pc.biggestTitSize() >= 1) output("cup one of your [pc.chest]");
	else output("caress your [pc.chest]");
	output(", thumb dragging across your [pc.nipple] hard enough to draw a gasp from you. Down she goes, until her fingers slip");
	if(pc.legCount > 1) output(" between");
	else output(" down");
	output(" your [pc.legOrLegs], finding your [pc.cocks].");
	if(pc.cockTotal() > 1) output(" Syri wraps her fingers around your [pc.cock " + x + "], selecting it for her attentions");
	else output(" Syri wraps her fingers around your [pc.cock " + x + "], gently stroking it to hardness");
	output(". You moan low as the ausar's dexterous grip goes to work on you, twisting and pumping until your [pc.hips] can't help but move in response, humping her grasp on your prick as Syri grins up at you.");

	//If silly: 
	if(silly) output("\n\n<i>“Come on, Steele... give me your captain's rod,”</i>");
	else output("\n\n<i>“You wanna stick it in, captain? Come on, then. I'm ready for you,”</i>");
	output(" Syri growls, pulling your head down into a tongue-filled kiss as your hips move closer to her own, pressing in until your [pc.cockHead " + x + "] brushes her taut cheeks. Her breath catches, body tensing as your prick prods against her puckered hole; she grabs her own red cock, rubbing it as she pulls it out of the way, giving you unrestricted access to her ass. As you press on, her arms wrap around your neck, lips pressing to yours in short, frantic kisses as her mind and body brace for impact.");

	output("\n\nYou push in, [pc.hips] rocking forward ever so slowly, edging your [pc.cock " + x + "] into the warm embrace of the ausar girl's asshole. She draws a sharp breath at the moment of penetration, back arching as her nails dig into your back, holding your fast as you enter her. Syri's legs curl as your cock slides deeper, locking around your bare [pc.butt] and pulling you in. <i>“Don't hold back, Steele,”</i>  she groans, furry legs forcing your fuckstick deeper and deeper, faster and faster, <i>“Give it to me!”</i>");
	pc.cockChange();

	output("\n\nNot one to keep a lady waiting, you thrust all the way in with one long, furious thrust that leaves Syri screaming her pleasure and your cock ");
	if(pc.cockVolume(x) <= chars["SYRI"].analCapacity()) output("buried up to the hilt, groin pressed against her taut cheeks");
	else output("as deep in as the horny ausar can take it");
	output(". You start to move, but Syri grabs you, legs locking hard around your hips to keep you still. <i>“G-gimme a sec,”</i>  she moans, pulling you into a quick kiss. You can feel Syri's muscles spasming around your prick, her anal walls contracting and squeezing the girthy member in confusion, trying to force the invader out, which only makes you harder and more ardent. Slowly, Syri relaxes, legs falling back onto the bed and out of your way. Grinning down at her, you grab her hip for support as you start to pull out, leaving her groaning in pleasure until just the tip's still in her. But her ass is like a black hole, drawing you back in before you can pause to tease the moaning dog-slut; your hips push forward again, burying your cock right back where it belongs, wedged between the quivering walls of Syri's butt, making the ausar moan and cry, cupping her tits and arching her back as you slide back into her.");

	output("\n\nLetting your hips start up a familiar, automatic rhythm, you decide to join in on the fun topside. With a little grin, you seize Syri's hands and pin them to the bedside, getting them out of your way. You lean into her heaving bust, burying your face between the full mountains of Syri's cleavage. A long, pleasant moment passes as you fuck her ass and enjoy the warm, soft embrace of Syri's tits, and soon your hands release her arms, letting them wrap around your shoulders to hug you tight. She guides you to one of her stiff erect nipples, and as if by reflex your mouth opens and takes it, suckling on the stiff point. As you cup the other, squeezing and sucking her breasts until the poor ausar's panting, chest heaving with lust.");

	output("\n\nYou increase the tempo, tonguing her teats as your hips ram hers, faster and faster until her ass is practically sucking you in with every thrust, begging for your cock. You pound her harder, hefting yourself up from teats onto your [pc.knees] for leverage, gripping her wide hips and jackhammering her ass until she's screaming, <i>“Yeah! Gods yeah! Fuck my ass, Steele! Fuck me full of your cum!”</i>");

	output("\n\nAs if responding to her words, her feel Syri's ass tighten hard around your [pc.cock " + x + "] and look down as her own knotty cock bulges and twitches. You lean out as she cums, cock spasming as it shoots a thick cream-white rope of dog-spunk right between her heaving breasts. Syri yelps as the hot cum hits her flesh, and her shaft responds with another deluge, depositing a thick load of seed on her belly. Watching the squirming ausar cream herself and smelling the overpowering, heady odor of her musky seed is a potent combination that has you rutting like mad, racing to join your lover in orgasm.");

	output("\n\nYou cum with explosive force, ramming your [pc.cock " + x + "] deep up Syri's ass before discharging a huge, sticky [pc.cumColor] glob into her bowels. The ausar girl cries out as you pound her, clearly feeling your seed pouring into her. Her cock jumps upright again, knot trembling with renewed vigor as your prick passes over her over-sensitive bud, milking it of every last drop leftover from her own orgasm. Grunting and growling with feral passion, you cum deep inside your lover, grabbing her cheeks and pulling her into a tongue-tying kiss that soon has you rolling over each other, flipping off the lights as the sheets and blankets wrap around your bare, entwined bodies. Syri pulls you into her arms, letting you nestle your head back between her big breasts, cock deflating inside her");
	if(pc.hasKnot(x)) output(", though your own knot, like hers, will take some time to come back out, tying you together for a time");
	output(" as curl up to sleep it off with your lover.");

	output("\n\n<i>“I love... the feeling of you inside me, Steele,”</i>  Syri purrs, stroking your hair. <i>“Gods, I'm so glad I met you... that we can be together.”</i>");

	output("\n\nYou lean up and kiss her, telling the beautiful ausar that you couldn't agree more.");
	processTime(40+rand(15));
	pc.orgasm();
	chars["SYRI"].loadInAss(pc);
	chars["SYRI"].orgasm();
	clearMenu();
	addButton(0,"Next",syriSexOutro);
}

//Get Vag Fucked
public function getVagFukkedBySyri():void {
	var x:int = pc.cuntThatFits(chars["SYRI"].cockVolume(0));
	if(x < 0) x = rand(pc.totalVaginas());
	clearOutput();
	userInterface.showBust("SYRI_NUDE");
	showSyriName();
	author("Savin");
	output("Reaching between the lusty ausar's spread legs, you wrap your hands around her throbbing red knotty cock and ask her how she'd like to bury that bad boy to the hilt inside you. She grins from ear to pointed ear, <i>“Now you're speaking my language, Steele. Don't you stop.”</i>");

	output("\n\nShe leans down and presses her lips to yours, locking you in a warm embrace as you stroke her cock, urging it to full hardness. It isn't hard to get her stiff as diamonds, and her cock's practically jumping in your hands, her hips bucking slightly. You can feel her tail wagging powerfully");
	if(pc.legCount > 1) output(" between");
	else output(" against");
	output(" your [pc.legOrLegs], brushing up against your thighs and even your [pc.vagina " + x + "], teasing your slit until her tail's tip comes back dark-stained with moisture. Syri breaks the kiss and grins, chuckling as she lets her tail flicker over your drooling fuckhole, teasing you until your breath catches, nearly putting you over the edge with her merciless wagging.");

	output("\n\nGrabbing the ausar's hips, you try to urge her and her big, throbbing cock toward your womanhood, but she swats your arms away with a playful grin, and rolls off of you. <i>“Easy, Steele, gotta grab something first,”</i>  she says with a wink as she crawls out of bed. Tail wagging and hips swaying seductively, Syri sashays over to where her bag dropped on the way in, and bends over to dig something out. Seeing that ass swaying right at you, cock dangling half-hard between her legs so invitingly... it's too much for you. You slip over to Syri, grabbing her taut cheeks hard enough to make her yelp.");

	output("\n\n<i>“K-knock it off, Steele,”</i>  she growls, but you'll have none of that. You give her a little push, and Syri tumbles into a nearby chair, cock aimed right at you. Much better. You slide down between Syri's legs, pushing them apart so she's nice and vulnerable, giving you ready access to her hot cock. She lets out a happy moan as you grab her prick again, steadily stroking it back to stiffness. <i>“Not what I had in mind, but... not gonna say no to a blowjob, am I?”</i>");

	output("\n\nYou nuzzle Syri's thigh as her fingers run through your hair, gently urging your head toward her rod. You let the ausar beauty guide you in, and your tongue rolls out of its own accord, tip brushing the very base of her cock, just below the crest of her knot. Syri visibly shivers as you drag your tongue from stem to stern, licking up her length before swallowing her cock at the apex, lips sliding right back down. You catch your gag reflex as her girthy cock pushes down your throat; you stop at her swelling knot, planting a kiss on the salty sphere around her dick before backing off again. You're rewarded at the height of your motion as her trembling phallus looses a bitter drop of pre down your throat, adding her own creamy lubricant to the spit coating her cock.");

	output("\n\nAs you steadily suck her off, you get your fingers in on the action: they slip in between bobs of your head, wrapping around Syri's slick shaft to stroke her until she's sighing and crying out at the ceaseless sexual stimulation. Once your digits are sufficiently slathered in a sheen of spit, you slip them down Syri's shivering skin to the dark star of her ass, smiling up at the sexy ausar as you slide a finger into her. She yelps in surprise, sphincter squeezing mercilessly on your probing finger.");

	output("\n\nSyri's back arches as you double-team her, sucking her cock and fingering her tight hole. You look up with glee as the horny ausar squirms, groping her own tits and rocking her hips, humping against your penetrating finger until you decide to show a little mercy and give her another, stretching her little tail pipe until she's groaning and crying, wiggling her hips to get every inch of you inside her. You slip a third finger in, forcing her hole so wide it practically gapes as you delve deeper, searching for her most sensitive spot. It takes you just a moment to find it, the tight little ball a finger's depth into her ass: with the gentlest touch, you can feel her cock jump to attention, practically spewing pre into your mouth. Watching Syri groan and pant only makes you want it more, and soon you're mercilessly massaging her prostate on three fronts, slurping up the continual discharge of salty seed as her pointy prick spurts into you, slathering your tongue with ausar cream.");

	output("\n\n<i>“H-hey, ease up, tiger... gonna... gonna...”</i>  Syri whines, a little too late to stave off the inevitable. You bear down, swallowing her prick to the base until her thick, swelling knot is tucked between your lips, letting you feel every surge and twitch as the massive tie fills with cum, urged on by your busy fingers until your can feel her shaft spasming around your tonsils, and the first thick ropes of puppy spunk shooting into you, burning hot and bitter on your tongue. Syri lets out a single long, low moan, cupping a tit as her other hand holds your head down on her rod, roughly bobbing you up and down as you swallow gouts of spooge, coming on so fast the slimy trails soon spurt down your chin. When you finally pull yourself off Syri's cock, you're linked together by thick ropes of spit and cum, mixed together into perfect pearlescent bridges.");

	output("\n\n<i>“Ah, gods,”</i>  Syri moans, leaning back in the chair, chest heaving. <i>“That was... you've got a talented tongue, Steele. Real talented.”</i>");

	output("\n\n<i>“What, you think that's it?”</i>  you tease, climbing into the exhausted ausar's lap, planting a cum-filled kiss on her lips, letting her taste her own seed. <i>“I'm not done with you yet!”</i>");

	output("\n\nYou grab her slick cock, fingers wrapping just above the full cum-swollen knot, stroking her until she's hard again. Syri lets out a quiet whimper as you jack her off, slowly getting back to hardness over a few long minutes that leave you both panting with effort. Finally she's firm and ready to go, and you rock your hips forward, bringing your slavering cunt right to the tip of her fuck-pole, only to be roughly pushed back. You give Syri a questioning glance, which she returns with a sheepish smile, and pulls a tightly-wrapped nanofiber condom out of her pocket.");

	output("\n\n<i>“Told you I needed something. You want a cunt full of cock, then you gotta use this. Sorry, babe,”</i>  she says apologetically, tearing the packet open with a sharp canine. <i>“Not quite ready to be a dad yet, you know?”</i>");

	output("\n\nYou nod and grab the condom between your teeth, slipping back between her spread legs to press your face to her throbbing erection, planting one last kiss upon its crown before you adjust the condom clenched between your teeth, getting the almost imperceptibly thin fibers lined up just right before you plunge down, spreading it down and around her cock, letting it snap tight on the crown of her thick knot. Syri draws a sharp breath as the condom pops into place, reaching down to draw it tight as you straddle her once again, arms wrapping around her slender shoulders, [pc.vagina " + x + "] hovering over her slick, sheathed shaft.");

	output("\n\nThis time, Syri grabs your [pc.hips] and pulls you down, spearing you right on her cock. Your back steadily arches as the lips of your [pc.vagina " + x + "] part, swallowing inch after inch of Syri's cock, feeling the impending, unstoppable fullness of being stuffed with alien dick until you let out a shrill yelp, cunt straining to accommodate the thick knot ramming it. You rock yourself back, pulling her back out to the head few inches, giving yourself a moment to brace for the knotting this time. A few short bounces on her cock slowly loosens you up, spreading your wet and ready walls wide for the real pleasure.");
	pc.cuntChange(x,chars["SYRI"].cockVolume(0),true,true,false);

	output("\n\nYou take it easy for the first few minutes, steadily working further and further down her length, moaning and whimpering with pleasure as her thick cock grinds into you. Soft, furred hands play across your skin");

	if(pc.biggestTitSize() >= 1) output(", cupping your [pc.chest] and squeezing the full orbs, bringing one up to Syri's mouth so that her lips can wrap around a stiff [pc.nipple]");
	else output(", holding you tight enough that Syri can drag her tongue across your nearly flat chest, testing one of your [pc.nipples] before latching on");
	output(". Her fingers drift back down as your back arches, responding to the pinch and pressure of your lover suckling from your teat");
	if(pc.isLactating()) {
		output(" and the flow of your [pc.milk] into her eager mouth");
		pc.milked();
	}
	output(". Her hands finally grope your [pc.butt], kneading your cheeks and guiding you inexorably down toward her swollen base. You grit your teeth and try to relax as you slide down her length, suppressing a little gasp as you feel your lower lips parting at its crown. Your [pc.vagina " + x + "] spreads and stretches, pushed to the extremes of its elasticity to accommodate the ausar's thick knot until with a gasp and cry, it pushes past, tying you to your lover as you sink into her lap.");

	output("\n\nSyri holds you tight to her as the knot sinks into your [pc.vagina " + x + "], planting kisses and caresses across your tender, sweating flesh. She cups your cheek, holding you steady for a long, tongue-tying kiss that soon has you both moving, grinding your hips against each other in the short, quick motions that the dog-tie holding you together allows. The feeling's enough to nearly overwhelm you, though: so utterly full, stretched and filled by Syri's swell, feeling her lengthy, pointed cock probing your womb... it's too much.");

	output("\n\nYou feel yourself cumming, [pc.vagina " + x + "] spasming hard around the massive intruder spearing it open");
	if(pc.hasCock()) output(" as [pc.eachCock] explodes in a shower of seed, smearing Syri's belly with a sudden gush of your cum");
	output(". Syri groans in response, her cock spasming in return, knot swelling again as your cunny clamps and squeezes, milking it even through the microfiber condom. With a quiet roar, Syri grabs your ass and pulls you hard onto her lap, shoving as much of her dick into you as she can before cumming; you can feel the condom balloon out as her hot seed pours into it, swelling the condom until it feels like a sloshing second knot pressing against your cervix.");

	output("\n\n<i>“Gods,”</i>  Syri pants, hands clasping your [pc.butt], <i>“that was awesome, Steele. You're an animal...”</i>  Suddenly, you're hefted up into her arms as the ausar girl hobbles to her feet, shakily carrying you back to the bed before you both fall in, laughing like kids until Syri rolls onto you, face inches from your own.");

	output("\n\n<i>“I don't deserve a " + pc.mf("boy","girl") + " like you... you're amazing, [pc.name],”</i> she says, smiling down at you with her puppy dog eyes that make you want nothing more than to kiss her, pulling the alien beauty onto you as you flip off the lights, drawing the blanket over your bare bodies to wait out her knot's deflation in each other's arms.");
	processTime(40+rand(15));
	pc.orgasm();
	pc.loadInCunt(chars["SYRI"]);
	chars["SYRI"].orgasm();
	clearMenu();
	addButton(0,"Next",syriSexOutro);
}

//Catch Anal
public function catchAnalFromSyriIfYouDontUseACondom():void {
	clearOutput();
	userInterface.showBust("SYRI_NUDE");
	showSyriName();
	author("Savin");
	output("You spread your [pc.legOrLegs] around the ausar beauty's hips, leaving your [pc.butt] perfectly vulnerably to her thick red prick. Syri grins as you move, her dark eyes drifting down your bare body and the tender flesh on offer, your ass lifted and eager for her. <i>“You're just an insatiable slut, aren't you, Steele?”</i> Syri laughs, giving you a sharp slap on the thigh. <i>“If you just wanted a good buttfucking, you coulda stayed at the bar and given Burt a show.”</i>");

	output("\n\nYou start to answer, but she chuckles and winks, <i>“Yeah, yeah. I prefer you all to myself, anyway.”</i>  Syri leans down, lips brushing along the nape of your neck as she trails kisses across your [pc.skin], culminating with a long tongue-tying embrace. It's a long, pleasant moment before she breaks the kiss, bracing on her elbows an inch above your face, lips still bridged to yours with little ropes of crystal-clear saliva. Her soft, furry hand cups your cheek gently, thumb running just under your eye as your lover smiles prettily down at you, hips moving almost imperceptibly closer to your eager ass.");

	output("\n\n<i>“I can fuck your ass raw any day, [pc.name]. But when we're alone like this... when I see you on your back, so beautiful, so very much mine... I just want to take it gentle. At least at first. What do you say?”</i>");

	output("\n\n<i>“That sounds just about perfect.”</i> You reach up and give your lover a deep, long kiss, pulling her down into your [pc.chest] as your [pc.legOrLegs]");
	if(pc.legCount > 1) output(" lock");
	else output(" wraps");
	output(" behind her, drawing her inexorably into you. Her breathing picks up, a shallow pant by the time you can feel the boiling hot rod of dog-cock spreading your cheeks, heading for home. Squeezing Syri tight, you grit your teeth and try to relax your sphincter to ease the coming blissful agony.");

	output("\n\nA slight, pleasured whimper escapes your lips as the pointy tip of Syri's cock presses against your [pc.asshole], ");
	if(pc.ass.looseness() <= 2) output("building up pressure before your tight little pucker finally yields, letting it slip past");
	else output("sliding past your relaxed, yielding muscles to slip right in");
	output(". The both of you groan as your [pc.legOrLegs]");
	if(pc.legCount > 1) output(" shepherd");
	else output(" pulls");
	output(" Syri's hips in, pushing her deeper and deeper in one long, slow motion until she's so deep you can practically taste her cock; her thick, throbbing knot presses tightly to your back door, but she relaxes her advance just as your body tenses, bracing for impact.");

	output("\n\n<i>“Not so fast,”</i>  Syri grins, a hand playing across your bare [pc.chest]");
	if(pc.biggestTitSize() >= 1) output(", cupping one of your full breasts, giving the perky teat a playful squeeze");
	output(". <i>“The thing about fucking an ausar bitch is... you have to take it slow,”</i>  she adds, hips starting to pull away from you, her cock dragging back through your quivering rectal walls. <i>“You don't want to take the knot right away. Even if you're a real buttslut, you gotta enjoy the long, slow thrusts first. Then you can build up to the real treat.”</i>");

	output("\n\nWith one last kiss, Syri sits up, resting her hands on your [pc.hips] as her dick finishes its exodus from your ass, pulling out to the halfway point before she starts to slide back in, pushing back in with deliberate and unrelenting pressure that sends your muscles to spasming and clenching, desperately trying to repulse the girthy intruder, which only seems to make the motion more pleasurable for your lover. You grin as Syri's face devolves into one of wanton lust, tongue practically rolled out as she fucks you, steadily thrusting again and again into your [pc.asshole]. The feeling of your tender walls being parted, your hole stretched");
	if(pc.hasCock()) output(", and prostate pounded");
	output(" is heavenly, and you can do little else but moan your pleasure, squeezing down on her cock with all your might.");

	output("\n\n<i>“Easy,”</i>  Syri whines, but you don't let up, clamping down on her until ");
	if(pc.ass.looseness() >= 4) output("even your loose, battered anus is making her work for every inch");
	else output("she's forced to work for every inch she thrusts");
	output(". Her movements becomes sharp and shallow, tiny, fast thrusts into your tightly-clenched hole until she's practically battering her way in. So much for gentle! You grab Syri's flared hips and guide her in, urging her deeper and deeper until you once again feel a potent pressure building up against your tight-held hole. Syri grunts with effort, hammering it into you until you're practically crying out. You manage to relax your body, forcibly loosening your [pc.asshole] so that the great orb of Syri's knot can push through, reaming your abused sphincter with a flurry of quick strokes before it can finally push into you.");
	pc.buttChange(chars["SYRI"].cockVolume(0),true,true,false);

	output("\n\nBut she only goes half-way, leaving her knot stretching your ass at its widest point. You whine, trying to move your hips to either push it out or pull her thick tool in, but Syri grabs your [pc.hips], holding you immobile as her throbbing knot pulls you apart at the seams. The pleasure is incredible, but the feeling is mired with the sheer stretch inflicted on your [pc.asshole], making you whimper and whine, begging for more. Instead, Syri's fingers dig into your hips as she pulls out, knot coming out with a wet pop that leaves you feeling horribly, irrevocably empty. You can barely notice her cock pulling out of your agape ass, flopping against your thigh as your lover grins down at you with a predatory lust.");

	output("\n\n<i>“You want the knot, Steele?”</i>  she teases, leaning in so close you can feel her hot breath on your neck, her lips not even an inch from your own. With your mind a roiling mess of lust and need, all you can do is nod eagerly, hips wiggling enticingly between you. Syri chuckles, patting your thigh. <i>“You want it so bad, then let's do it ausar style. Get on all fours, my friend, and ");
	if(!silly) output("brace yourself");
	else output("prepare your anus");
	output(".”</i>");

	output("\n\nYou hurry to comply, rolling over and pulling yourself up to rest on your hands and [pc.knees], hips and ass swaying for your hung lover. Looking over your shoulder, you see her lick her lips approvingly, hands running across your [pc.butt], playfully squeezing as she pulls your cheeks apart to give herself a good long look at that ass. She leans in, tongue flicking out to drag from taint to hole, circling your [pc.asshole] with a few long, fluid motions before pushing in, easily sliding past your thoroughly stretched sphincter. You shudder as the long, wet appendage slithers in, teasing your walls");
	if(pc.hasCock()) output(" and flicking across your most sensitive spot, making your [pc.cock " + x + "] twitch and jump to attention, almost boiling over with pre");
	output(".");

	output("\n\nYour fingers dig into the bed as Syri's tongue explores your passage, flicking quickly in and out between long, languid slurps that paint your walls with thick coats of saliva, getting you nice and warmed up for round two. She keeps going for a long minute, slathering your ass up before backing out, letting her fingers take over. As a pair of spit-slick furry fingers slip into you, Syri chuckles <i>“Don't ever say I'm not a very </i>giving<i> lover... takes a little more to cum from your ass, huh? Let's see if this does it for you.”</i>  You grit your teeth as two digits slip in, pumping in and out with quick, erratic thrusts that soon have you panting and moaning, wiggling your hips to the beat of the finger-fucking, barely noticing when a third... then a fourth join the fun in a ball practically as big as her knot.");

	//if PC is already pretty loose: 
	if(pc.ass.looseness() >= 3) output("\n\nNo matter how much anal you enjoy, though, there's nothing quite like feeling Syri's fingers ball up, forming a perfect fist as she practically punches into your gaping hole. A scream of overwhelmed pleasure bursts from your lips as Syri fists you, pushing deep into your ass until she's halfway to her elbow before relenting. Her thrusts are slow and steady with such a massive insertion, spreading and stretching you with as much gentleness as she can muster. It isn't much, but you're thankful for what mercy she can show your poor asshole at this point. After this, though, taking her thick knot will be a cakewalk...");

	output("\n\nReduced to a quivering, whimpering pile of lust and desire after Syri's thorough finger-fucking, you're desperate for the release your lover always stops just short of giving you. You watch over your shoulder as Syri grips your hips, holding you steady as her dick makes its final approach, sliding easily into you up to the big knot at its base. Even after such a stretching, it's still a moment of exquisite agony when it pushes into you; Syri's cries her pleasure as she fucks the throbbing orb past your sphincter, which you match with a high moan of ecstasy as you nearly cum from penetration alone.");

	output("\n\nThe moment passes, though, and Syri's knot sinks into you, your ass eagerly swallowing it up. Syri grins, giving you a sharp spank that makes you squeal as she starts to hump your butt, fucking her knotted cock deep into you. A few seconds of that nearly has you over the edge");
	//if cock: 
	if(pc.hasCock()) output(", especially as Syri's hand reaches around your quivering hips to grab your [pc.cock " + x + "], quickly stroking the turgid member off to the beat of the assfucking that's driving your prostate wild with stimulation");
	output(". The final blow is a hard spank, a sharp swat on your [pc.butt] as Syri pulls her cock back hard, nearly un-knotting herself around your spasming sphincter. You scream and cum");
	if(pc.hasCock()) output(", [pc.cocks] gushing onto the sheets as Syri's dexterous hands and rectal ravaging finally overwhelm you");
	else output(", finally overwhelmed by the rectal ravaging");
	output(".");

	output("\n\n<i>“Yeah!”</i>  Syri cries, hammering her hips right back in, slamming into your ass. <i>“Fuck yeah, Steele! Take it!”</i>");

	output("\n\nYour breath catches as your orgasm draws forth a thick, hot spurt of ausar cum that blasts deep in your colon, filling you with Syri's seed. She humps away at your orgasmic ass, fucking you hard and fast as her cock spurts and spurts, painting your walls white with spooge. You groan and cry as Syri relentlessly, mercilessly jackhammers your ass, filling you again and again until she's panting uncontrollably, chest heaving with effort. She keeps cumming, stuffing you with thick, hot spunk until you feel bloated, stomach churning as it's packed with alien cum.");

	output("\n\nFinally, Syri's orgasm passes. Exhausted and with ragged breath, she practically collapses, dragging you down into her arms as her little spoon. You groan as your knotted ass gets one last accidental thrust before her twitching cock finally comes to rest inside you, withering ever so slowly. Smiling dreamily, Syri reaches an arm around your waist, hugging you tight against herself as she plants a kiss on your cheek.");

	output("\n\n<i>“Sorry. I guess I'm not that great at being gentle,”</i>  she says with a wry chuckle, fingers brushing along your groin, just over the dick held inside you. You give a pleasured little shudder, snuggling back into your lover's arms as she draws the covers up over your bare, tied bodies. You dim the lights and relax, letting yourself drift off as Syri holds you close.");

	processTime(40+rand(15));
	pc.orgasm();
	pc.loadInAss(chars["SYRI"]);
	chars["SYRI"].orgasm();
	clearMenu();
	addButton(0,"Next",syriSexOutro);
}

//Blow Her
public function blowSyriYouFukkinSlut(postScene:Function = null):void {
	if (postScene == null) clearOutput();
	userInterface.showBust("SYRI_NUDE");
	showSyriName();
	author("Savin");
	output("Grinning up at your hung alien lover, you ask her if she'd like some good old fashioned oral attention. Syri grins and rolls off you, cock rising skyward as you crawl downward, slipping between her spread legs to give yourself a good view of her eager member. The ausar's veiny puppy pecker is nice and stiff, swaying slightly as it stands erect for your inspection. Syri gives a little whine and shifts her legs, and her shaft waggles comedically at you, nearly brushing up against your nose; you take the opportunity to let your [pc.tongue] play out, lapping at her sensitive underside. The taste is bitter, but the sound of Syri's breath catching in her throat is exquisite, and with the look of wanton pleasure etched on her face to motivate you, you slip down toward her base, tongue probing at the red, pulsing prick down and down to its very roots, your fingers rubbing aside the downy fuzz around her stem to plant a kiss on her most sensitive flesh.");

	output("\n\nHer legs tremble around you, knees squeezing your shoulders as you cup her full sack, rolling Syri's hefty nads between your fingers. You can feel her quick heartbeat through her balls, so blatantly eager, and you can't help but give her sack an appreciative squeeze, feeling the pent-up cum roiling inside them, over-ready for release. Syri lets out a small, whining moan, tail flicking happily between her full cheeks as you lean in toward her manhood, so close you can see her cock jumping as your breath boils over it, close enough to see it shiver with every heartbeat. With a smile and a lick of your lips, you gobble up the ausar's heavy gonads, sucking her sack up until your lips are caressing her shaft. You suck gently on the two swollen orbs, oh so gently, just enough to make Syri's back arch, her fingers brushing through your [pc.hair] to urge you on. You tenderly nibble at the yielding, folded flesh of her balls, giving them a little pull as your fingers work their way up her thighs, brushing through her furred lower legs to the bare, warm skin of her crotch.");

	output("\n\nYou suck Syri's supple sack like a sweet little sucker, stroking her stiff shaft with smooth, sensuous motions. She sighs and shivers at your touch, practically shaking as you suckle on her soft orbs; you feel your own breath quicken, your ");
	if(pc.hasCock()) output("[pc.cocks] hardening");
	else if(pc.hasVagina()) output("[pc.vaginas] drooling");
	else output("ass clenching");

	output(" as your own excitement mounts. It's so easy to imagine this big, pulsing, knotted tool pounding into you, stretching you wide as her knot takes you, claims you, makes you hers. You can only just resist the urge to mount your love, to ride her cock until she floods you with cum, but the burning desire to have the whole of her towering rod slip between your lips wins out. You pop her balls out of your mouth with a wet squelch, shifting up ever so slightly to look down on the pointed tip of her shaft. A nice, thick glob of white pre has swollen up into the tiny valley of her cumvein, and you're quick to lick it off, tasting her seed on the tip of your tongue, planting a dainty kiss on her cockhead as you swallow her pre.");

	//If PC has tits C+ cups:
	if(pc.canTitFuck()) {
		output("\n\nBut before you go down all the way, it's time to give your doggy lover a thrill. You cup your [pc.chest] tight together, wrapping your two soft mounds around the turgid shaft of Syri's cock. The ausar gasps as she feels your tits encompassing her prick, ");
		if(pc.biggestTitSize() >= 10) output("utterly enveloping her eight inches of puppy pecker in your finger-straining mammaries");
		else output("your perky tits fit her cock perfectly, letting just the pointed tip of her pride poke out between your pert breasts");
		output(". She shudders as you rock your bust forward, dragging her erection through the valley of your bust until just the tip is still buried in the tight compress of your cleavage. A couple long strokes and you start to pick it up, humping along the length of Syri's pre-slick schlong. You can feel her cock twitching between your breasts, leaking a steady trickle of slick pre to stain your supple flesh with her errant seed.");
		output("\n\nYou keep her going for a long minute, titfucking your ausar lover faster and faster until she's panting and moaning, all veneer of restraint lost in her pleasure. ");
	}
	else output("\n\n");
	output("As you caress her cock, you feel velvet-soft fingers slipping through your hair, guiding your pursed lips down onto the waiting point of her pre-leaking length. You keep your lips nice and tight as she pushes you down on her rod, making her work for every inch like she was fucking a virgin cunt. Your tongue slathers her underside as she pushes in, rubbing along her veiny length until you can feel a twitch and spurt of hot pre smearing onto the back of your throat.");

	output("\n\nYou swallow her sticky seed, already trying to coax more out of her. Syri cries out, back arching as she grabs one of her tits, squeezing and pinching her stiff nipple as you take her cock to the base, wrapping your lips around her engorged knot. You suck her knot like a sweet red candy, bobbing your head up and down on it as her pointy tip assaults your mouth, bulging your throat. With the way she's twitching and squirting inside you, there's not much longer until she blows her load right in you! Her knot is practically spasming between your [pc.lips], thumping the roof of your mouth in arhythmic spasms as pre leaks freely across your tongue, smearing across your cheeks. You bob your head down on her shaft, as far as you can go until you've completely swallowed up her knot.");

	output("\n\nBut that's just not enough to push her over. Syri whines, bucking her hips ever so slightly to try and fuck your face just a little bit harder. You look up, meeting her lust-addled gaze for just a moment before you slip a hand down and push three fingers in.");

	output("\n\nSyri's back arches up as she cries in surprise, ass spasming wildly as you press your fingers deep inside with one swift, forceful motion. Spreading your fingers out, stretching her nice and wide, takes a tremendous effort, but you're rewarded with a steady flow of thicker and thicker spunk leaking from her cockhead, momentarily sating your need for seed until you can find her most sensitive place. With Syri, though, that doesn't take long. One of your fingers brushes up against a thick little bump in her rectal tract, and her prick responds immediately, jumping so hard you nearly gag on it. You give the spasming ausar a slap on the thigh, digging in and holding her down as you suck and thrust, teasing her engorged cum-bubble until she can't take it any more.");
	output("\n\nWith a hull-shaking scream, Syri cums. Her soft hand suddenly turns harsh, slamming you down on her cock as her shaft spasms. You feel it in your fingers first, her prostate tightening and pulsing as it churns up a thick load of white-hot spunk. There's just enough time to brace yourself, doing everything you can to suppress your gag reflex as her cock swells and spurts, filling your throat with a thick white coating of ausar spunk. You try and swallow it as she cums, but there's just so much, feeling like its burning your throat as it shoots straight down into your gut.");

	output("\n\nYou give her big, swollen knot a tight squeeze, stroking the cum from her thick orb and right down your own gullet. Spurred on by your triple assault of finger-fucking, knot-jerking, and cock-sucking, she just keeps cumming, stuffing you with thick, hot spunk until you feel bloated, stomach churning as it's packed with alien cum. You struggle to take her massive load, swallowing too slowly to keep up with her spunk-swollen balls' outpouring, and with a gag, find your face plastered with white, hot cum drooling down your face, bubbling on your chin.");

	output("\n\n<i>“Fuck yeah,”</i>  she groans, stroking your [pc.hair] as her orgasm finally winds down, cock merely twitching and bubbling in your mouth. <i>“You've got a magic tongue on you, Steele. Do that again and I might just have to keep you as my own personal cum-bucket,”</i>  she adds with a playful wink, brushing a bit of spooge from your cheek with her thumb. You let her prick go, keeping the last thick, sticky drops of her seed just long enough to crawl up the ausar's tall, curvy frame to plant a kiss on her thin lips, giving her a taste of her own cum. She gives a little gasp at the unexpected bitter taste, but true to form opens wide for it, swallowing the last part of her own load with a slutty grin, lips stained white.");

	output("\n\nWith you in such a perfect position, Syri's arms are quick to wrap around your [pc.hips] and back, pulling you down onto her and into a tight, affectionate hug. You nestle your cheek into her big, pillowy bust, smiling as Syri yawns contentedly, still stroking your [pc.hair]. <i>“Thanks for the blow, Cap. You're the best.”</i>");

	output("\n\nYou smile and snuggle up, feeling like you've earned yourself a post-coitus cuddle as Syri's load gurgles in your gut.");
	chars["SYRI"].orgasm();
	pc.loadInMouth(chars["SYRI"]);
	pc.lust(33);
	clearMenu();
	if (postScene == null) addButton(0, "Next", syriSexOutro);
	else addButton(0, "Next", postScene);
}

//Shipboard Sex Outro: Syri hits the Road
public function syriSexOutro():void {
	processTime(120+rand(60));
	clearOutput();
	userInterface.showBust("SYRI_NUDE");
	showSyriName();
	author("Savin");
	output("You wake up several hours later, wrapped up in a tight, warm embrace of ausar fur and blankets. Syri's arms are still locked around you, holding you tight. You look up from the valley of her cleavage, and find her smiling down at you, blue eyes glistening in the dim cabin light.");

	output("\n\n<i>“Sleep tight?”</i>  she asks, leaning down to plant a kiss atop your head.");

	output("\n\nYou nod, and ask her the same. <i>“No bed I'd rather be in!”</i>  she grins as you uncoil yourselves, making sure to give her a quick pop on the ass as she swings her legs over the bedside, searching for her pants. She pulls them up before sauntering over to you, stopping your efforts at redressing by slipping in behind you, cupping ");
	if(pc.biggestTitSize() >= 1) output("a tit");
	else output("your [pc.butt]");
	output(". <i>“Mind if I, uh, freshen up before I head out?”</i>");

	clearMenu();

	addButton(1,"Sure",sureUseMyShowerAndClogTheDrainWithDogHair);
	if(pc.libido() >= 60 || pc.lust() >= 33) addButton(2,"Don't Go",dontGoAwayYouKnotCunt);
	else addDisabledButton(2,"Don't Go");
}

//Don't Go
//{High libido/lust PCs}
public function dontGoAwayYouKnotCunt():void {
	clearOutput();
	userInterface.showBust("SYRI_NUDE");
	showSyriName();
	author("Savin");
	output("<i>“What, you think we're done?”</i>  you say, grabbing your ausar lover by the waist and pulling her into a tight embrace, feeling her bare breasts pressing hard into your [pc.chest].");

	output("\n\nShe laughs gaily, grabbing a handful of your backside as you kiss her. The bulge of her cock growing again is unmistakable as you yank her pants back down, grabbing her red shaft. <i>“Well, if you insist... not like I had plans,”</i>  she grins, spinning you around and shoving you back into the bed before clambering over you, licking her lips predatorily. <i>“Lusty " + pc.mf("stud","slut") + ", aren't ya?”</i>");

	output("\n\nYou grab her, pulling her down into another kiss as you grab her ass, spreading her cheeks wide with a rough squeeze.");
	if(pc.isMischievous()) output(" <i>“Takes one to know one!”</i>");
	//[Sex options, sans Blow Her]
	syriSexMenu(false);
	addButton(14,"Nevermind",sureUseMyShowerAndClogTheDrainWithDogHair);
}

//Me Too
//{PC takes a shower with Syri. Can lead to a rimjob, or just hanging out and teasing}


//Sure
//Alternative:
public function sureUseMyShowerAndClogTheDrainWithDogHair():void {
	clearOutput();
	userInterface.showBust("SYRI_NUDE");
	showSyriName();
	author("Savin");
	output("<i>“Sure,”</i>  you say, pointing her toward your bathroom. She gives you a wink as she grabs her scattered clothes and vanishes, giving you a chance to get geared up");
	if(flags["SYRI_BUTT_GAPE_ALERT"] != undefined) output(" and spend a few minutes rubbing your poor abused hole, still gaping after Syri knotted you");
	output(". While the shower runs, you do your best to tidy up, starting to make your bed before sighing and chucking the cum-stained sheets down the laundry chute. When Syri returns, still toweling her hair dry, your cabin looks more or less back to normal again. She gives an approving nod and offers you a hand up, <i>“Buy you a drink?”</i>");

	output("\n\nYou nod and follow the ausar out as she grabs her coat, tail wagging happily behind her.");
	if(flags["SYRI_BUTT_GAPE_ALERT"] != undefined) {
		flags["SYRI_BUTT_GAPE_ALERT"] = undefined;
		//if silly and PC caught anal:
		output(" Your own steps are a little off-kilter after getting reamed that hard!");
	}
	processTime(15+rand(10));
	//{Return PC to bar}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Appearance
public function syriAppearance():void {
	clearOutput();
	userInterface.showBust("SYRI_NUDE");
	showSyriName();
	author("Savin");
	output("Syri Dorna is a six-foot tall ausar girl with shoulder-length raven hair and a pair of huge, perky wolf ears perched atop her head. Though she's got a distinctly human body and face, the silky fur on her arms and legs, and the swishing, bushy tail give her a distinctly feral, alien appearance. Her attire is loose and carefree: a pair of torn up jeans, tall leather boots, and a T-shirt that's a little too tight, accentuating her ample bust; more distinctive, though, is the long military coat she's wearing. Long and flowing, her jacket nearly reaches the floor, and certainly seems to have seen better days, even if its buttons are brightly polished, glistening proudly amidst tears and cuts all around them. Under her tight clothes, you can see the outlines of her taut muscles: powerful legs, a firm ass, and a hint of a six-pack. What draws your eyes, though is the distinctive bulge between her legs, hinting at the big, veiny, knotty cock lurking below.");
	output("\n\nSyri has a pair of full DD-cup breasts, big and bouncy and oh so soft, each tipped with a big, sensitive nipple that's perfect to tug and squeeze.");

	output("\n\nA thick eight-inch knotty dog-cock rests between Syri's legs where her cunt ought to be, hanging over a pair of cum-filled testicles, surrounded by a nicely trimmed bush of downy pubes. Opposite that, she has a nice, inviting little asshole between her firm cheeks, right where it belongs.");
	clearMenu();
	addButton(0,"Next",approachSyriIntheMorning);
}


//Scene Proposal: "Up My Pussy"
//Author credit: {almost entirely} FireDrops
//Summary: Vaginal sex option for winning "Bet Yourself" against Syri
//Main features:
//• Requires PCs with regular vagina; I believe Syri's cock is listed at 8*thick. (so, 2? 3? inches)
//• Allowances for PC features: penises, rear genitalia (taurs).
//• No support for tail or nipple genitalia—at one point I did start to write some but the action diverged so greatly as to suggest separate scenes.

//Why I wrote it:
//I believe that the existing option—namely, the single button "RideHerDick" unless the character has male bits—is egregiously restricted considering the opening sentences of that path impute anal oriented desires to the PC. How much is wanting it and how much is not having any choice? True, the player can avoid it altogether by not betting with Syri; but I feel cheated when playing a female fresh out of character creation. My avatar has more than one potential entry point, so I'm seeking to indulge desires comparable to her penis endowed counterparts.

//General Notes:
//As far as I know, the parser call [pc.vagina] describes the first in the array, which may not be the one that qualifies in case of multiples. I didn't find more detailed calls as there are for cocks, so this probably needs fixing throughout. Ditto [pc.clit].

//Since this option wasn't part of the original writing, part of my inspiration became the idea that Syri doesn't automatically want/accept vaginal sex (that is, not in the bar) (and not after betting "your ASS on the line").
 
//Even if you get your way, Syri will likely be less friendly than if you play by her rules. I never intended that this path should open up her next relationship stage; I simply wanted a meaningful choice in how female winners may approach her. Even if you're otherwise on good terms, I assumed as I wrote that the vaginal path wouldn't count as much to increase Syri's friendship with the PC: you're rather selfish about coercing her.

//Syri eventually offers what I call a "friends with benefits" relationship. Not knowing the official flag name, I use the abbreviation FWB to mean you have accepted. I figure Syri should be more amicable after this milestone.

//Affection
//At one point Savin wrote about having an affection stat for Syri. If that is/becomes a thing, I suggest the following gains relative to whatever the standard increase for sex happens to be:
//• If FWB: Vaginal = 2/3 (maybe with extra 1/3 for the "any time" bonus ending)
//Anal = 1
//• If not FWB: Vaginal = 0
//Anal = 2/3

//New Variables/Flags:
//Syri_WinBet_Vag
//(Boolean; default = False) Scene repeat check: next time you'll know to bring a condom.

//Revisions and Additions:
//Add button to menu options after winning "Bet Yourself."

//Check the toggle for Syri's early morning encounter.
//It may need changing to preserve the gating logic. Any of the butt sexing paths ("TakeHerAss", "RideHerDick", losing the bet, or my own "Give Butt") should trigger it. Vaginal sex should not, without erasing it if set by a previous bet.
//-OR-
//Text change in the friends offer to match new events.
//If Savin thinks the butt loving ausar is okay with doing it to the player's pussy after all, a slight emendation will help with continuity. I recommend altering the line "once you stick a cock up someone's ass..." to "once you stick a cock that deep in someone...."

//New Stuff:
//Part 1: "Up My Pussy"

public function syriFriendsWithBenefits():Boolean 
{
	return flags["SYRI_TALKS"] != undefined;
}
public function rideSyriInYerCoochYaWinner():void
{
	//Bust: naked/sex Syri throughout//
	//Processing: Lust +20//
	author("FireDrops");
	showBust("SYRI_NUDE");
	showName("\nSYRI");
	clearOutput();
	output("You take your time caressing Syri's tender DD titflesh. First you slowly squeeze her left breast. You don't get any visible response, so you try stroking the circumference of her areola. That works: her fluffy tail begins to wag. You exploit this crack in her armor with a follow up attack of pinching and pulling, alternating with gentler rubs, until the dog-girl's teat is visibly more turgid than its unattended neighbor.");
	output("\n\nShe's definitely breathing harder now, yet – except for her out of control posterior – she's stifled any response that would give her away to the onlookers gathering around the game console. While you are still planning your further assault, the black-haired ausar speaks: \"<i>Don’t you think you're overlooking something here, Steele?</i>\"");
	output("\n\nYou play dumb and switch to the other breast, kneading her twistable nipple in an effort to make a matching pair.");
	output("\n\n\"<i>Bastard,</i>\" Syri mock-snarls, glancing at the crowd you've drawn, \"<i>We're settling a bet, not holding a three act play. Get on my cock or start collecting tickets.</i>\"");
	output("\n\nEveryone in the bar is watching the two of you make out, and claiming a smoking hot wolf-girl in front of them suits you just fine.");
	//(if armor equipped)
	if(pc.armor.shortName != "") output("\n\nYou let go of her boob and guide her fingers to the fastenings of your [pc.armor]. Shortly, all your assets are on display while you");
	//(else if at least one underwear equipped)
	else if(!pc.isNude()) output("\n\nYou don't hesitate to slip out of your [pc.gear]. Encouraging whistles come from the bystanders, but they hardly register as you");
	//(else naked PC)
	else output("You relent and");
	output(" undo the fly of Syri's jeans. With a bit of effort you tug her garments down and the excited rod inside springs up to smack her belly. No wonder she was impatient: her hard-on must have been under quite a strain while still confined. For a moment you both watch as the reddish shaft finishes swelling to its full potential in the open air.");
	output("\n\nNow that both of you are in the buff, you restart the action by leaning ");
	//(if height >=85) 
	if(pc.tallness >= 85) output("down");
	else if(pc.tallness <= 60) output("up");
	else output("forward");
 	output(" to suck her lower lip into a sloppy, nibbling kiss.");
 	//(if rear genitals)
 	if(pc.isTaur()) output(" After a while, she breaks away to give love bites to your neck. You turn to one side and lead her hand toward your hind end ");
 	//(else standard)
 	else output(" As she gives you a series of low, throaty growls, you press her hand downward ");
 	output("to trace between your pussy lips.");

 	processTime(4);
 	pc.lust(20);

	//Variation 1A: repeating if Syri_WinBet_Vag = True
	if(flags["SYRI_WINBET_VAG"] != undefined)
	{
		output("\n\n\"<i>What do you have here?</i>\" Syri asks. \"<i>This little pussy is sopping wet. ");
		//(if PC is in heat)
		if(pc.hasStatusEffect("Heat")) output("So wet. I'll bet you're in heat aren't you, little pussy? I know the signs");
		//(else) 
		output("You might as well be in heat with all this girlcum");

		output(".</i>\" A slender fingertip reaches toward your inner gate. \"<i>You really want a hard fucking, don't you? You want a hard, knotted cock to reach that special spot deep inside.</i>\" Now the finger rubs against [pc.oneClit]. Another joins it, strumming your sex while your back arches and your pelvis grinds into her hand. \"<i>You want to feel my hot, thick ausar spunk shoot so hard into your belly that you're sore from the inside out.</i>\"");
		output("\n\nYou think it's time for another, deeper kiss... but the dog-girl twists in your arms, breaks free of your embrace, and dances around an empty table. \"<i>Too bad for you I'm strictly a butt lover, huh, captain? I'm not touching any other holes today.</i>\"");
		output("\n\nYou follow and she continues to sidestep, using the furniture to stay just beyond reach. The excited crowd hollers, some in favor of her escape and some cheering for her capture and the show to follow.");
		//(if FWB)
		if(syriFriendsWithBenefits())
		{
			output("\n\nYou recognize this game: asserting her independence, dictating terms in spite of her loss. But she seems to have overlooked that, by running, the ausar has become your naked prey.");
			output("\n\nSo you play along, adding a little chase to your foreplay. Your quarry gives you, and coincidentally the whole mead hall, a fantastic show. Gorgeous tan breasts riding high as she ducks a swipe... waving red doggie dong careening as she twirls to reach the far side of a chair... taut, sun-kissed asscheeks flexing as she runs away laughing... raven-hued tresses flying with every twist of her head. You idly wonder how the cocky, ex-military gamer would react if she could hear the poetry running through your brain.");
			output("\n\nAlas, your own desire is consuming you with a need for action stronger than words. Your pursuit eventually brings you back to where you started, poised in a crouch near your gear, when Syri makes a fatal error: \"<i>It's too bad, [pc.name],</i>\" she teases. \"<i>I sort of enjoyed the last time you rode my pole. But I'm all out of condoms and I won't wait around for you to fetch one. So get your asshole ready.</i>\"");
			output("\n\nYou suspect the lie – it's not like her to be unprepared – but you accept the charade. \"<i>And I was really looking forward to riding my favorite pooch prick,</i>\" you pretend to mourn. \"<i>I was so close to having it stuffed deep in my cunny.</i>\" You can see the corner of a foil wrapper amongst your personal effects. It takes two seconds to bend down and pick it up. The wolf-girl gasps. \"<i>If only I had remembered Burt's vending machine and made a pit stop before the game,</i>\" you finish.");
			output("\n\nConceding the point, your ausar lover returns to your encircling arms. \"<i>I can't talk you out of this?</i>\" she asks. You answer by pulling her into a deep tongue kiss, stroking one of her sensitive ears with your free hand and reveling in the press of her tender bosom against your [pc.chest].");
		}
		//(else not FWB)
		else
		{
			output("\n\nYou remind her that this issue was settled already, accusing her of reneging on your wager.");
			output("\n\n\"<i>I told you then that it's back door or no door, Steele. I want to hear you say it straight out this time.</i>\" The nude ausar dodges another lunge with black hair flying and breasts bouncing. \"<i>Just a few simple words and you can have what you </i>really<i> want. ‘I want Syri's beautiful penis to fuck my sorry, gaping ass.’ Say it.</i>\"");
			output("\n\nShe could run and tease like this for a long time; luckily, you planned for some resistance. You abandon the chase and return to ");
			if(pc.armor.shortName != "") output("your fallen [pc.armor]");
			else output("the gear you set down before the match");

			output(". With your best jaunty grin, you find and hold up the slim condom you pocketed from Burt's restroom vending machine.");
			output("\n\n\"<i>I want Syri's needy fuck-stick to worship inside my slick temple of love,</i>\" you tell her.");
			output("\n\n\"<i>Stop twisting my words again, you " + pc.mf("son","daughter") + " of a space goat!</i>\"");
			output("\n\nBut she can't hold out. Once you start taunting her about what would happen if you walked away – how many others would try their own sex bet with the aroused ausar, whether her priapism would throw off her game – the mounting embarrassment leads to her marching stiffly back to you.");
			output("\n\n\"<i>You win, but you'll get what you deserve someday,</i>\" she warns. \"<i>And when you do, Syri Dorna is going to shove it so far up your ass that it'll be two centuries until you shit it out again.</i>\"");
		}
		//merge at part 2
		clearMenu();
		addButton(0,"Next",allVaginalPathsMergeHere);
	}
	//Variation 1B: else (Syri_WinBet_Vag = False), if FWB
	else if(flags["SYRI_WINBET_VAG"] == undefined && syriFriendsWithBenefits())
	{
		output("\n\n\"<i>Hey, slow down there,</i>\" Syri blurts. \"<i>This</i>\" – she holds up two wet digits – \"<i>is just showing off how horny you are, right? 'Cause my hard, red dog prick won't bark for pussy.</i>\"");
		output("\n\nYou mumble that a puppy treat for [pc.oneVagina] is exactly what you have in mind, and you think she will more than enjoy it, too.");
		output("\n\nWhatever her boner might be urging, the voluptuous gamer has enough self-control to shake her head. \"<i>Sorry, [pc.name], not happening. You know I'm all about the ass.... Besides, you know that I'm shooting live ammo here? That's a risk I wouldn't take even just in the vidya.</i>\"");
		//(PC is Nice)
		if(pc.isNice())
		{
			output("\n\nThis is the only time she's hesitated on a wager you've both enjoyed. Your fuck buddy is asking one thing and your swampy love tunnel is asking another: what's your choice?");
		}
		//(Mischievous)
		else if(pc.isMischievous()) output("\n\nEven as you process the dog-girl's request, a drop of whitish pre squeezes out of her pointed tip: it looks like serious concern and not lack of ardor that made her stop the action. How will you ease her mind and get back to the steamy sex?");
		//(Hard)
		else output("\n\nYou curse the delay: you won and now that pooch needs to fill your cooch. On the other hand, keeping her friendly and receptive could be better in the long term. Make your call, captain.");
		//Menu Buttons
		clearMenu();
		//Action: New Page. Continue with text below, "Keep Going."
		addButton(0,"Keep Going",syriVagFuckKeepGoing,undefined,"Keep Going","You're sure you can persuade her to pound your cunt.");
		//Action: New Page. Continue with part 4, "Give Butt."
		addButton(1,"Give Butt",giveHerYerButt,undefined,"Give Butt","She can change targets if it's that important.")
	}
	//Variation 1C: all else (Syri_WinBet_Vag = False, not FWB)
	else
	{
		output("\n\nSyri reacts strangely upon touching your [pc.vaginas], freezing her motion and tensing her muscles. That's all the warning you get before she shoves you away hard enough to make you stumble. Trying to clear the sex fog from your brain, you can only stare in confusion. What went wrong?");
		output("\n\n\"<i>If you think what I think you're thinking, Steele,</i>\" she hisses, \"<i>you're dead wrong. I'll ream your backdoor if you can't do me, but our wager was for a good, hard ass fuck. No cunts allowed on this prick.</i>\"");
		output("\n\n\"<i>I believe your exact words were 'you can ride my cock,' no holes specified,</i>\" you protest. \"<i>That makes it winner's choice.</i>\"");
		output("\n\n\"<i>No way,</i>\" she states, ears flattened. \"<i>I don't know what your big life plans are, but I'm not risking any future pups on some shit-faced bar bet on the pimply back end of the galaxy's behind.</i>\"");
		output("\n\nBefore you can say anything to calm her, a broken-nosed prospector in the audience speaks up: \"<i>The lady said 'No,' stranger.</i>\" More agreements follow. Syri clearly has the regulars' affection, and the owner, Burt, seems to be reaching for some sort of weapon beneath the bar.");
		//(PC is Nice)
		if(pc.isNice()) output("\n\nAll you wanted was some passionate loving with a curvy dog-girl, not to be practically accused of rape by your moments-ago willing partner. Can you retrieve the sexy mood?");
		//(Mischievous)
		else if(pc.isMischievous()) output("\n\nWhoa – you expected a little resentment after defeating the ausar in front of her buddies, but she's ready to fight over this. How will you resolve the standoff?");
		//(Hard)
		else output("\n\nEven if you thought you could take on the whole mead hall and claim your rightful prize, you'd be declared a criminal for sure. Fighting is out, so what's your move?");
		//Menu Buttons
		clearMenu();
		//Action: New page. Continue with following text, "Insist."
		addButton(0,"Insist",insistOnCoochFucksSyri,undefined,"Insist","Hey, who's the winner here? You can still make this work.");
		//Action: New Page. Continue with part 4, "Give Butt."
		addButton(1,"Give Butt",giveHerYerButt,undefined,"Give Butt","She can change targets if it's that important.")
	}
}

//[Keep Going]
//Processing: If PC attitude is Nice, change it 3(?) points toward Mischievous.//
public function syriVagFuckKeepGoing():void
{
	clearOutput();
	author("FireDrops");
	showBust("SYRI_NUDE");
	showName("\nSYRI");
	pc.addMischievous(3);
	output("The whole point of betting your bodies on the hologame was to settle who would lead the post-match fucking. If you give in now, Syri will think that her begging \"puppy eyes\" trump your mad skills. Though tempted, you know better than to erode your advantage.");
	output("\n\nSo you keep up the assault on her willpower, simultaneously stroking her buttocks and the base of her fluffy tail – still wagging furiously – with your right hand, fondling her laden ballsack with your left, and suckling on a sweet breast with your [pc.lips]. Eager moans testify to the effectiveness of your technique.");
	output("\n\n\"<i>Stop it, please. It's too dangerous to take me in there,</i>\" she whimpers.");
	output("\n\nSomeone in the crowd – no telling who with your face buried in Syri's DD chest – coughs and says, \"<i>There's a condom dispenser in the toilet.</i>\"");
	output("\n\nYou run for the restroom so fast you expect to hear a crash of thunder. When you return to the main hall, Syri is vainly attempting to cover her nakedness. With her melon-sized rack and her eight-inch dick at full mast, neither hand can conceal her assets. Luckily she is too busy glaring at the other bar patrons to catch the silly grin you get from seeing your lover on display.");
	output("\n\nYou manage to compose your face as you weave your way back to the gaming area; when you are within arm's reach, you show her the condom and ask if she's ready yet.");
	output("\n\n\"<i>Don't,</i>\" the embarrassed dog-girl murmurs.");
	output("\n\nSomething moves in the lower edge of your vision, and you glance down to see the hand obscuring Syri's cock: her forefinger is rubbing its narrow tip. Has she been keeping herself hard for you?");
	output("\n\nAt the same moment, Burt the bartender surprisingly joins your cause: \"<i>Go on, Syri, we all know you're sweet on [pc.name].</i>\" His comment starts a rumble from the spectators, who begin an unimaginative but irresistible chant: \"<i>Do it!... Do it!... Do it!...</i>\"");
	//BUTT FUCK! BUTT FUCK! BUTT FUCK!
	output("\n\n\"<i>Okay, damn it!</i>\" the naked gamer yells.");
	if(40 + pc.intelligence() >= rand(100) + 1)
	output("\n\nYou've learned to read Syri's moods, and there are clues in her stance and the point of her ears: underneath any resentment she is also... proud? You think she might be excited to have a lover who will stand up to her.");
	else
	output("\n\nThen she blushes, her sun-kissed face reddening. You would have expected a larger outburst from the cocksure ausar. Well, her good attitude will make it easier to have your way with her body.");
	//merge with part 2
	processTime(3);
	clearMenu();
	addButton(0,"Next",allVaginalPathsMergeHere);
}

//[Insist]
//Processing: If PC's attitude is not already Hard, change it 3 points toward Hard.//
public function insistOnCoochFucksSyri():void
{
	clearOutput();
	author("FireDrops");
	showBust("SYRI_NUDE");
	showName("\nSYRI");
	pc.addHard(3);
	output("You need to settle things down, and fast, so you raise your open hands in a gesture of nonaggression. \"<i>Let's not get crazy over a miscommunication,</i>\" you say. \"<i>I just didn't think it was such a big deal to expect sex after a sex bet. Male plug, female receptacle. Nothing fancy.</i>\"");
	output("\n\nSyri appears unmoved – probably it didn't help to imply that she's insane – but the body language of the other patrons shifts. They have been expecting a show, after all. Maybe if you can sway them....");
	output("\n\n\"<i>You were the one who brought ‘pups’ into this whole thing,</i>\" you rationalize. \"<i>I can totally understand why this is the wrong place and time to start a ");
	//(if PC's race is half ausar or more) litter
	if(pc.race() == "ausar" || pc.race() == "half-ausar") output("litter");
	else output("family");
	output(". So why don't we just ask, does anybody here have a condom handy?</i>\"");
	output("\n\nA skinny male zil in the crowd immediately volunteers, \"<i>I will get one.</i>\"");
	output("\n\n\"<i>Izzy, you traitor!</i>\" Syri shouts at the wasp-boy's back as he disappears into the restroom. Less than thirty seconds later he emerges holding a small, shiny object. Burt must keep a dispenser in there.");
	output("\n\n\"<i>Don't you dare,</i>\" the angry dog-girl yells, \"<i>or I'll pound your butt clear across this damn jungle.</i>\"");
	output("\n\n\"<i>You have beaten me many times, Syri,</i>\" the striped alien explains calmly, \"<i> and my butt is yours whenever you wish to ask for it. But now this one has defeated you in your chosen battle, and so your penis must be " + pc.mf("his","hers") + ".</i>\" He holds out the condom packet.");
	output("\n\nYou quickly add your own endorsement to this plan: you and Syri can have your fuck and it never has to leave this room. Pretty soon it becomes clear that the mood in the gallery has indeed turned in your favor. With your opponent's most powerful objection nullified, several watchers mutter that she ought to pay up and one calls for her to \"<i>take that cunt like a man.</i>\" She doesn't give in right away, but her tail sinks lower and lower between her legs.");
	//(PC is Hard)
	if(pc.isAss()) output("\n\nIf she had submitted from the start it wouldn't have to be this way, but hopefully she's learned a lesson about making wagers with you. Your own arousal grows with her humiliation now that you have won this little contest.");
	//(else)
	else output("\n\nYou're sorry to see her shamed publicly, but not enough to sacrifice the prize you've earned. You console yourself by imagining the lewd acts she'll perform beneath you, and your arousal builds once again.");
	//merge with part 2
	processTime(3);
	clearMenu();
	addButton(0,"Next",allVaginalPathsMergeHere);
}

//Part 2: all vaginal paths merge here
//Processing: Time passes. (I believe the comparable scenes are randomly 35-45 minutes.)//
public function allVaginalPathsMergeHere():void
{
	clearOutput();
	author("FireDrops");
	showBust("SYRI_NUDE");
	showName("\nSYRI");
	output("Syri snatches the offered prophylactic. As she hops onto a table to unroll it, you find yourself with nothing to do beyond fingering your [pc.vagina " + x + "]");
	if(pc.hasCock()) output(" and stroking your [pc.biggestCock]");
	output(".");
	output("\n\nThe nanomesh wrapper expands comfortably over your ");
	//(FWB) lover's
	if(syriFriendsWithBenefits()) output("lover's");
	else output("conquest's");
	output(" canine endowment. She fiddles briefly with the leading edge before pulling it tight around her bright red knot; the elastic material accommodates the bulge while still hugging her shaft. She looks up and remarks, \"<i>If that doesn't hold it in, nothing will. I guess it's your show now.</i>\"");

	//Variation 2A: rear genitalia/taur PC
	if(pc.isTaur())
	{
		//(if height <= 60)
		if(pc.tallness <= 60)
		{
			output("\n\nYou enjoy the view of the dog-girl's package, but your [pc.legOrLegs] just");
			if(pc.legCount == 1) output(" isn't");
			else output(" aren't");
			output(" long enough to comfortably reach her on the table, so you ask her to sit on a plastiform chair instead. Her distaste is obvious as she positions herself to be ridden: \"<i>Crap, this thing's sticky. Do you know what people have been doing on here?</i>\"");
			output("\n\n\"<i>Fucking?</i>\" you ask as you present your rear end.");
		}
		//(else > 60)
		else
		{
			output("\n\nYou ask the dog-girl to scoot right up to the edge of her table: her dick should line up reasonably well with your [pc.vagina " + x + "]. As you turn around to present yourself, you warn her not to go sticking it in your asshole \"by mistake.\"");
			output("\n\n\"<i>Yeah, yeah, just get it over with. You know, I'm pretty well hung, but you're just a prick,</i>\" she grouches.");
		}
		output("\n\nYour angle still isn't 100% perfect, but your pussy is wet enough and you don't think you can do better without the ");
		if(syriFriendsWithBenefits()) output("reluctant");
		else output("sullen");
		output(" ausar's cooperation. Without further ado you press yourself backward. You relish the feel as the tapered canine glans pushes aside your folds; about halfway down you bump against Syri's thighs, prompting her to open her legs farther. Centimeter by centimeter, you feed her hot-blooded member into your cunt. Once you reach her knot, already half swollen, you give your hips a wiggle to make sure you're fully seated and let out a contented sigh.");
		//Processing: PC is penetrated.//
		pc.cuntChange(x,chars["SYRI"].cockVolume(0),true,true,false);
		output("\n\nFor a moment it looks like that will be all that happens. You rock yourself forward and back again, twice, but Syri sits completely motionless under you. Impatient, you turn around and ask when she's going to start humping.");
		output("\n\n\"<i>I thought </i>you<i> wanted to fuck </i>me<i>. I'm not stopping you,</i>\" she retorts.");
		output("\n\nSo she's still playing upset about your little argument, is she? Well, you didn't go through all that fuss just to get a dildo – even one that feels so hot, thick, and alive as it spreads your slick walls. You want a hard screw with a high energy ausar, and you quickly devise a plan to restore her fighting spirit.");
		output("\n\n\"<i>I was promised a ride,</i>\" you say casually. \"<i>But I guess that big dick of yours is too much for a little bitch like you to handle.</i>\"");
		output("\n\nSyri scowls. \"<i>What did you just say to me?!</i>\"");
		output("\n\n\"<i>I said screw me, bitch,</i>\" you reply");
		if(syriFriendsWithBenefits()) output(" with a wink over your shoulder");
		output(". \"<i>It's my new name for you. You know, with the whole dog thing going on, and your big tits, the way you lose at video games. Or did you mean the part where I called you a weak-ass little girl who can't do a real man's job, you probably don't even know–</i>\"");

		output("\n\n\"<i>FUCK you!</i>\" she cries while shoving at least five of her inches into your twat. \"<i>You want fucking, huh? Fuck YOU!</i>\" On this last word she not only thrusts but pulls on your [pc.hips], spearing her wolfhood into your [pc.vagina " + x + "] and battering the knot against your gates.");
		output("\n\nYou laugh as the naked ausar beneath you responds to your power play. She hooks her legs around yours for better leverage and pounds as far up as she can reach. You only yell for more, ");
		//(FWB and not Hard)
		if(syriFriendsWithBenefits() && !pc.isAss()) output("reassuring yourself that she understands your game when you glimpse her grinning eyes. She");
		else output("jeering at her until she");
		output(" pulls her body up onto your back; now she's resting her weight atop your torso, properly mounted to ravish your [pc.vagina " + x + "]. The difference is explosive: Syri pumps her unencumbered hips in rapid strokes that slam into you faster than you can count. If she had a blunter tool this jackhammer pace might be overwhelming, but her steel-hard rod slides smoothly through your twat thanks to the narrow tip. It is the other end of her equipment that hurts you – in the nicest possible way – when her thick red knot crashes into your [pc.clit] several times each second. Every strike sends a shower of sparks up your nerves, churning your pussy around her cock and robbing you of breath.");
		output("\n\nAs best you can under this assault, you continue to antagonize the gamer by ordering her to go faster and reminding her that you are the winner around here. The two of you are shouting and cursing at each other when suddenly you feel her pull back for one ultimate thrust. Perhaps you shouldn't be surprised that she came so easily going doggie style – but still it catches you unaware. For a moment the frantic action stops. You swear you can see the expression of each witness frozen in time. Then you and Syri are shouting \"<i>Oohh!</i>\" in synchrony as you both explode in pleasure.");

		output("\n\nYou feel the condom expanding with ausar jizz even while your [pc.vagina " + x + "] clamps down around it.");
		if(pc.hasCock()) 
		{
			output(" Your own ");
			if(pc.balls > 0) output("[pc.sack]");
			else output("prostate");
			output(" empties itself as well, with ");
			//(ordinary cum amount)
			if(pc.cumQ() < 25) output("several shots of [pc.cum] flying out of your [pc.cocksLight]");
			//(high cum amount)
			else if(pc.cumQ() < 1000) output("rope after rope shooting from your [pc.cocksLight] to land all over in wild tangles of [pc.cum]");
			//(super cum amount)
			else output("[pc.cumColor] seed spraying continuously from your [pc.cocksLight] to pool in a sticky lake on the mead hall floor");
			output(".");
		}
		output(" Yet for all the energy in your mutual climax, it quickly vanishes into ragged, deep breaths as you desperately try to replace all the oxygen you just spent. The video gamer has fallen against your back, her lack of motion contributing to your own rapid decline. You're not even sure if she can walk right now.");
		output("\n\nThe occasional aftershock in your pussy squishes the full sack of spooge occupying your nethers, and you briefly toy with the idea of squeezing until it bursts – what would Syri think of that? – but even the cheap brands are tougher than they look these days. So you just wait for her stand up to pull herself out.  She does so quite gently, brushing your sensitized [pc.clit] as she carefully extricates the used condom. You gasp, but her touch is not a prelude any more action.");
	}
	//Variation 2B: else (front-to-front sex)
	else
	{
		output("\n\nYou clamber onto the tabletop with Syri, praying that Burt's furniture will hold up despite its seedy condition. You assume a position hovering just above her groin, and then you rub her length ");
		//(if PC has exactly 1 vagina)
		if(pc.vaginaTotal() == 1) output("up and down your [pc.vagina " + x + "], working your [pc.clit] into a frenzy before taking the plunge.");
		//(else more)
		else output("between each pair of labia, stimulating [pc.eachClit] before lining up her pointed tip with your chosen [pc.vagina " + x + "].");
		output("\n\nYou ease yourself down the length of the ausar gamer's big cock with a long sigh. Her fat manhood radiates a nearly burning heat inside your cunt. When you reach the swelling knot at its base, you playfully grind your pelvis to deliver a squelching nether kiss to Syri's bulge.");
		//Processing: PC is penetrated.//
		pc.cuntChange(x,chars["SYRI"].cockVolume(0),true,true,false);
		output("\n\nThen you rise up until you barely sense her tip still inside you. You repeat the maneuver once more while peering closely at the wolf-woman's eyes. You sense hints of her roiling emotions, but she's keeping it all under wraps. Even her tail is nearly motionless, though her ears twitch from the effort. Impatient, you ask when she's going to start humping.");
		output("\n\n\"<i>I thought </i>you<i> wanted to fuck </i>me<i>. I'm not stopping you,</i>\" she retorts.");
		output("\n\nSo she's still playing upset about your little argument, is she? Well, you didn't go through all that fuss just to get a dildo – even one that feels so hot, thick, and alive as it spreads your walls. You want a hard screw with a high energy ausar, and you quickly devise a plan to restore her fighting spirit.");
		output("\n\n\"<i>I was promised a ride,</i>\" you say casually. \"<i>But I guess that big dick of yours is too much for a little bitch like you to handle.</i>\"");
		output("\n\nSyri scowls. \"<i>What did you just say to me?!</i>\"");
		output("\n\n\"<i>I said screw me, bitch,</i>\" you reply");
		//(FWB and not Hard)
		if(syriFriendsWithBenefits() && !pc.isAss()) output(" with a wink your audience can't see");
		output(". \"<i>It's my new name for you. You know, with the whole dog thing going on, and your big tits, the way you lose at video games. Or did you mean the part where I called you a weak-ass little girl who can't do a real man's job, you probably don't even know–</i>\"");
		output("\n\n\"<i>FUCK you!</i>\" she cries while shoving more than half her prick into your twat. \"<i>You want fucking, huh? Fuck YOU!</i>\" On this last word she not only thrusts but pulls on your [pc.hips], spearing her wolfhood into your [pc.vagina " + x + "] and battering the knot against your gates.");
		output("\n\nYou laugh as the naked ausar beneath you responds to your power game");
		//(FWB and not Hard)
		if(syriFriendsWithBenefits() && !pc.isAss()) output(" – she reassures you that she understands your ploy by returning your wink");
		output(". She's doing her best to use your body as a cock sleeve, fiercely gripping your [pc.skinFurScales] to jerk you up and down. You will yourself to relax your [pc.legOrLegs] and surrender as she leads your tryst from below. Syri chooses a medium pace at first, wary of tugging you too deeply onto her expanding knot; instead, the bright reddish bulge delightfully grazes your [pc.clit] on each stroke. With Syri handling the vertical motion well enough on her own, you begin to gyrate in circles that press her thick dog prick against every ridge and crevice inside your [pc.vagina " + x + "].");
		output("\n\nYou continue to antagonize the gamer by ordering her to go faster and reminding her that you are the winner around here. The two of you are shouting and cursing at each other, and the");
		if (syriFriendsWithBenefits()) output(" ex-military");
		output(" wolf-woman impresses you with the breadth of her dirty vocabulary. Despite the resemblance to a brawl, there's no danger of slipping off her wolf-cock because her insistent hands shorten the stroke as the action accelerates. Before long she's withdrawing just the second half of her eight inches while the first four constantly slide across a very excited bundle of nerves inside your cunt. Her steel-hard rod drives you to a wild plateau: an invisible line that you don't know has been crossed until you are shouting out the last molecules of your breath and sucking in more.");
		output("\n\nSyri continues pumping until a new source of heat suddenly flows into your pussy in the middle of your fourth \"<i>Yes!</i>\" In the confusion of orgasm, nearly two seconds tick away before you work out that the ausar's big cock is filling you with dog-girl seed – and with that realization a second climax blossoms atop the first.");
		output("\n\nThe double dose of bliss fills you with keen awareness of every nuance of your body, as if even your fingertips were suddenly as sensitive as your [pc.clits]. You try to wiggle them to increase your sensation, but it seems your body is no longer under your own command, responding only to Syri's thrusts. She keeps fucking in powerful, if somewhat ragged, strokes while her canine testes empty themselves into your sucking twat. Into the condom, actually, but the difference is trivial right now.");
		output("\n\nEventually the busty slut beneath you shudders to a halt. You push yourself off her rod, barely clearing the swollen sack of cum on its end, and stagger over to the gaming couch. Your [pc.vagina " + x + "] is still twitching sporadically as your mind clears, no doubt hoping to reconnect with a certain wolfish wang.");
		output("\n\nIf it's any help, Syri appears to be recovering as slowly as you. \"<i>Damn. That was... uh, not half bad,</i>\" she breathes.");

		//if (pc.hasCock = True) 
		if(pc.hasCock())
		{
			output(" Suddenly, she ");
			if(syriFriendsWithBenefits()) output("giggles");
			else output("frowns");
			output(". \"<i>Looks like I'm not the only one who needed a rubber,</i>\" she remarks, indicating the [pc.cum] ");
			if(pc.cumQ() < 25) output("pooling on her torso");
			else if(pc.cumQ() < 1000) output("spread across her stomach and boobs");
			else output("coating her chest and even dripping off her chin");
			output(". \"<i>You better not give me any crap about it being good for my skin.</i>\"");
		}
	}
	processTime(15);
	pc.orgasm();
	chars["SYRI"].orgasm();
	pc.loadInCunt(chars["SYRI"],x);
	if(flags["FUCKED_SYRI_COUNT"] == undefined) flags["FUCKED_SYRI_COUNT"] = 0;
	flags["FUCKED_SYRI_COUNT"]++;
	clearMenu();
	addButton(0,"Next",syriVagSexWrapupLikeHERDICKOOOOHSNAP);
	//merge at part 3
}

//Part 3: Vaginal sex wrap up
public function syriVagSexWrapupLikeHERDICKOOOOHSNAP():void
{
	clearOutput();
	author("FireDrops");
	showBust("SYRI_NUDE");
	showName("\nSYRI");
	output("The bystanders disperse to their former pursuits as it becomes clear the only further action will be wiping up and re-donning clothes.");
	//(FWB)
	if(syriFriendsWithBenefits()) 
	{
		output(" Just before you turn to leave, Syri grabs your elbow. Her smile looks just a little giddy with the afterglow of her orgasm.");
		if(40 + pc.intelligence() >= rand(100) + 1) output("\n\n\"<i>Thanks for, um... showing me that weakness in the apartment balcony sniper vantage. With skills like that, you're welcome to play with me any time.</i>\"");
		else output("\n\nShe opens her mouth but bites back her original thought. Instead she tells you, \"<i>Just watch your back, [pc.name]. I want your ass more than ever now.</i>\"");
	}
	//(not FWB)
	else
	{
		output("\n\nOnce you are both cleaned up, Syri turns to confront you.");
		output("\n\n\"<i>Listen, Steele,</i>\" she says, \"<i>I may have said some things.... I just want you to know that you don't have to worry about me coming after you. </i>Yet<i>. But you've got to stop thinking with your gonads or somebody with less patience will give you a thrashing.</i>\"");
	}
	//Processing:
	//PC orgasm
	//Set repeat Syri_WinBet_Vag = True
	processTime(4);
	flags["SYRI_WINBET_VAG"] = 1;
	//Increase affection?
	//End encounter (to Burt's Badass Mead Hall)
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Part 4: [Give Butt]
//Processing: Time advances.//
public function giveHerYerButt():void
{
	clearOutput();
	author("FireDrops");
	showBust("SYRI_NUDE");
	showName("\nSYRI");
	//(FWB)
	if(syriFriendsWithBenefits()) output("You decide not to risk the camaraderie you share with Syri, no matter how much your [pc.vagina] tingles at the thought of her proud dick filling it to the hilt. Instead");
	//(not FWB)
	else output("Syri's sizable pecker stands proudly in defiance of this interruption – perhaps she's not as angry as she sounds. Still, you won't test her. Smiling, you ogle her bountiful tits and spend a few seconds frigging your [pc.vagina] to ease its disappointment.\n\nYou try to thaw the mood by telling her how cute she is when she's angry, but the ausar's scowl doesn't slide away until");
	output(" you turn your backside toward her, give your [pc.butt] a slap, and tell her to come and get it.");

	output("\n\nThe busty wolf-girl shows her teeth in a huge grin. She surprises you when her first touch is to knead your shoulders, yet you press yourself into her hands, eager to erase any hard feelings. Your sighs transition into moans as the massage drifts downward ");
	//(if wings) past your [pc.wings]
	if(pc.hasWings()) output("past your [pc.wings] ");
	output("to the ");
	if(pc.tailCount > 0) output("base of your [pc.tails]");
	else output("top of your rump");
	output(". Then her hands circle around your [pc.hips] and she fondles your");
	if(pc.hasCock()) output(" crotch. It is the first attention for your [pc.cocks] during this entire encounter, and you barely stop yourself from squirting");
	else output(" [pc.vaginas]. If only that were her final destination, you think");
	output(". Her rough handling enflames your genitals.");

	output("\n\n\"<i>Please,</i>\" you beg, \"<i>fuck me. Fuck my cunt.</i>\"");

	output("\n\nSyri leans in close, squashing two double-D breasts against your [pc.skinFurScales]. She whispers in your ear, \"<i>Not a chance, Steele. You gave me the go signal; there's no calling back the mission now.</i>\"");
	output("\n\nThe pressure nearly knocks you off your feet as her ministrations move upwards once more. It may not be a spa treatment, but on this pass she starts to rub more of her torso against yours. You jump as her steely cock contacts your buttocks. \"<i>Soon,</i>\" she promises, \"<i>just a little more work back here.</i>\"");
	output("\n\n\"<i>More,</i>\" you urge. \"<i>I need more.</i>\"");

	output("\n\nAn evil-sounding chuckle is the only response to your plea. The massage has turned into a one-handed affair working down your spine. It soon becomes apparent where her other hand has gone as one... two squirts of fresh pre-cum fall onto your crack. Ausar fingers push it between your cheeks, spreading it around your ringpiece. Somehow you've gone from being the winner to being the bottom in this pair, although with your body leaking hormones and ");
	if(pc.hasCock()) output("pre-cum");
	else output("[pc.girlCum]");
	output(" you can't pinpoint just why you ever wanted anything else. All your nerves hum in readiness to explode. Then she pulls back and speaks for the gallery's benefit: \"<i>And now you're going to get what you came for.</i>\" The onlookers cheer her announcement and the sharp slap that darkens your asscheek.");

	output("\n\nWith a deep breath, you lean against a wall. From behind, Syri scoops freely flowing girlspunk out of your pussy lips. You attempt to relieve your lust on her hand, but your own wetness allows her to slip free. She adds a couple handfuls of your homemade lube to the sticky mess on your [pc.butt], using her finger to push deep inside. Evidently the self-stimulation has brought the ausar close to the brink, because she works hard and fast to spread your dark passage: so fast that you whimper when you feel her thick rod slipping up your crack. Surely you haven't unclenched <i>that</i> much!");
	output("\n\nSyri's thrust proves that your [pc.asshole] is indeed opened well enough, at least for the pointy canine tip. You forget all protests as your long-delayed climax bursts outward from her first burning hot inch. [pc.GirlCum] streams down your [pc.legOrLegs], individual droplets flying free as your body rocks.");
	if(pc.hasCock()) 
	{
		output(" Your ");
		if(pc.balls > 0) output("[pc.sack] ");
		else output("prostate ");
		output("contributes its store as well, with ");
		//(ordinary cum amount)
		if(pc.cumQ() < 25) output("several shots of [pc.cum] flying out of your [pc.cocksLight] to augment the mess on the walls and floor.");
		//(high cum amount)
		else if(pc.cumQ() < 1000) output("rope after rope shooting from your [pc.cocksLight] to land all over in wild tangles of [pc.cum].");
		//(super cum amount)
		else output("[pc.cumColor] seed spraying continuously from your [pc.cocksLight] to pool in a sticky lake at the base of the wall.");
	}

	output("\n\nYour ");
	//(FWB)
	if(syriFriendsWithBenefits()) output("lover's");
	else output("opponent's");
	output(" invasion is slowed by your orgasmic clench, but she presses inexorably forward in tiny strokes timed to match your convulsions. Your awareness centers purely on the sensation of Syri's fiery dog cock as inch after inch continues to spear into your [pc.butt]. Your ecstasy surges with each advance.");
	//Processing: PC is penetrated.//
	pc.buttChange(chars["SYRI"].cockVolume(0),true,true,false);
	output("\n\nPowerful hands tug at your [pc.hips], forcing you ever farther onto that enormous dong. Finally, you detect a wave of pressure surging up Syri's pole to erupt in a white-hot fountain. The triumphant ausar howls as her own thick spunk eases the last millimeters of her throbbing dick to fully ram her knot against your straining pucker.");

	//From Savin's original Scene + tweaks
	output("\n\nMinutes pass, leaving you heaving and groaning and pinned to the wall as Syri collapses behind you, breasts pressing hard into your back. Her cock twitches in your rectum, little trickles of her cooling seed dribbling out around her engorged knot, just outside your worn hole.");
	output("\n\n\"<i>See, that wasn't so bad, Steele,</i>\" she pants. \"<i>You don't need a dick up your cunny to get a good cum, after all.</i>\"");
	output("\n\nEasy for her to say, you groan. You grab a few napkins to wipe up and then re-gather your [pc.gear].");
	//Processing:
	processTime(15);
	pc.orgasm();
	chars["SYRI"].orgasm();
	//Set early morning encounter if applicable
	//Increase affection?
	pc.loadInAss(chars["SYRI"]);
	if(flags["FUCKED_SYRI_COUNT"] == undefined) flags["FUCKED_SYRI_COUNT"] = 0;
	flags["FUCKED_SYRI_COUNT"]++;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Getting Syri’s Panties
//Syri surprise with epic lingerie and some sex toys. PC keeps her panties afterwards.
//Small %chance to play when PC lands on Mhen’ga/Uveto while Syri’s there. Must have Fuckbuddy Syri, naturally.
public function gettingSyrisPanties():void
{
	clearOutput();
	showSyriName();
	showBust("SYRI_NUDE");
	output("You’ve barely finished parking and gathering your equipment for your coming expedition when you hear a resounding 'THUNK' on the side of your ship, and you console lights up with an impact alert. Curious, you flip on one of the external cameras, and find a familiar raven-haired ausar standing outside your airlock, her long military coat wrapped tight around herself.");
	output("\n\nSeeing the camera swivel her way, Syri smiles up at it and waves.");
	output("\n\nYou hop out of your captain’s seat and head over to the airlock, cycling it open for your long-absent lover. The moment the outer lock makes its final loud, droning hiss and slides aside, you’re greeted by a wolfish smile and wagging tail. <i>“Heyya, Steele,”</i> Syri smiles, taking a step forwards. <i>“Long time no see.”</i>");
	output("\n\nIt can’t have been <i>that</i> long, but you have to admit, you’re happy to see her anyway.");
	output("\n\n<i>“You too. Mind if I come in?”</i>");
	output("\n\n<i>“Make yourself at home,”</i> you tell her, waving the ausar babe in. She grins and enters, wrapping an arm around her coat’s waist to keep its flaps closed. Syri does indeed make herself at home, exploring the familiar surroundings of your starship");
	if(annoIsCrew()) output(", running a hand across some of Anno’s possessions scattered around the living space. She gives you an almost jealous look, though somehow you doubt it’s because of anything <i>you</i> did..");
	output(". As she walks, your eyes are naturally drawn to the swaying slip of her hips, half-hidden behind a swishing black tail. Beneath that, you happen to notice that ");
	if("Panties - Syri's - Sky blue, silky, and extra crotch room.") output("despite the frigid cold of the planet below,");
	output(" Syri’s not wearing any shoes. In fact, all she’s wearing below her long coat looks like a set of tight blue fishnets that vanish up her legs.");
	output("\n\n<i>“Wish I had a ship like this,”</i> Syri chuckles, turning back to you. <i>“I don’t get out into space nearly enough anymore.”</i>");
	output("\n\nAs she speaks, Syri takes a seat on the arm of your couch and beckons you over, patting the seat beside her invitingly. You join her eagerly, more and more sure you know why your favorite ravenette came to visit. Once you’re seated, Syri leans down and grabs the side of your head, leaning you into her and pressing her face ");
	if(!pc.hasHair()) output("against your cheek");
	else output("into your [pc.hair]");
	output(", drawing in a deep breath of you. <i>“Mmm, I love the way you smell, Steele... been away from me for </i>way<i> too long.”</i>");

	output("\n\nYou reach up and caress your lover’s cheek, turning her canid smell-session into a long, drawn-out kiss. She moans into your mouth, and you feel her arms falling away from her coat, wrapping around your shoulders. Your head buries into her her bust instinctively, nestling into the big, soft mounds of ausar titflesh girded by a mesh of silky fishnets.");

	output("\n\nSyri breaks the kiss a moment later, stepping forward and shrugging off her coat. The heavy, faded military blues flop to the deck, revealing a body of smooth flesh, dark hair, and sexy blue lingerie covering her legs, arms, tits... and even the half-hard rod of throbbing dogflesh, its tapered tip peeking out of her Syri’s baby-blue panties.");
	output("\n\n<i>“Like what you see, Steele?”</i> she asks, not needing an answer as she slips a hand down her thigh, drawing the tip of a pointed claw around her crotch. You nod eagerly, leaning back in the couch and letting Syri approach you. She takes one long-legged stride forward and grabs the back of the sofa, pushing you against the cushion and kissing you fiercely, both hands grabbing at your cheeks... then your chest, and your [pc.crotch].");
	output("\n\n<i>“I missed you,”</i> she breathes between kisses. <i>“It’s so fuckin’ lonely here without my best friend.”</i>");
	//if Silly & Anno Companion:
	if(silly && annoIsCrew()) 
	{
		output("\n\n<i>“Hey, I thought we were best friends!”</i> Anno shouts from her quarters.");
		output("\n\n<i>“Oh my GOD. BLOW ME.”</i> Syri snaps back, rolling her eyes. As barely a whisper, she adds, <i>“You... uh... don’t think she actually will, do you?”</i>");
		output("\n\nLaughing, you shake your head and tell Syri to get back to what she was doing. Don’t ruin the mood.");
	}
	output("\n\n<i>“Missed you too,”</i> you tell your lover, reaching up to grab her ass, digging your fingers into those sexy blue fishnets. Syri moans, rocking forward over you, pressing her tits into your face.");
	output("\n\n<i>“You have no idea how happy I am to hear that,”</i> she whispers wrapping her arms around your head to trap you in between her breasts. She moves forward, onto the couch and straddling your [pc.hips]; your hands move in turn, around her waist and down between her legs, teasing her red puppy prick until it’s nice and hard, tenting her panties like a proper dog pole. Syri moans, rewarding your exploratory movements with hotter and heavier groans of pleasure as you seek out those familiar, tender spots along her sex or cup her balls, rolling the churning, full orbs in your hands.");
	output("\n\nBreathlessly, Syri manages to mumble between moans, <i>“Hey... I brought you a present. Wanna see?”</i>");
	output("\n\nYou nod into her tits, and in an agonizing instant, Syri’s off you, stepping back off the couch and spinning on a heel. She gives you a playful wink over her shoulder and starts to bend over, nice and slow, running her hands down her fishnet-clad legs until she’s almost grabbing her ankles. Through the fabric of her sheer blue panties, you can almost make out... something... between her spankable cheeks, but can’t tell what until the ausar beauty reaches up and pulls her silky panties down: just enough to show off her ass and keep that big, red dick of hers nice and bound in fabric.");
	output("\n\nYour eyes widen in surprise as you see that Syri’s apparently put a whole lot of lube in her behind, so much that her whole crack is glistening in the light. That, and dangling from right out of Syri’s dark little asshole is a long plastic string.");
	output("\n\n<i>“Go ahead,”</i> Syri teases, smacking her ass, <i>“open your present.”</i>");
	output("\n\nNow that’s an invitation you can’t refuse. You scoot up to sit on the edge of the cough and play your hands over Syri’s lube-slicked cheeks, making the horny ausar moan as your digits draw nearer and nearer to her lonely asshole. <i>“Nice and slow, now,”</i> she instructs you, wiggling her hips. <i>“Don’t want to spoil it all at once.”</i>");
	output("\n\nGrinning at her, you hook your finger through the little loop at the end of the string and draw it back until it’s a taut line of green plastic between you and Syri’s bum. Your lover moans, arching her back and flicking her tail up excitedly as you gently pull and pull the string, meeting awfully fierce resistance. <i>“Gentle...”</i> she whines between sultry moans that only make you want to go faster.");
	output("\n\nAfter a moment, you find you can’t pull the string any further: something’s straining against Syri’s asshole like a great big knot, and she’s clenching hard around it. You urge her to relax, rubbing her cheeks and whispering sweet nothings until you see her ass wink closed, then start to open, widening around something bright red and buzzing noisily. She moans, biting her lip as you pull the string a little harder.");
	output("\n\nWith a wet <i>pop,</i>, the red ball finally pushes out of Syri’s butt, drooping down against her balls in a lube-covered mess. Your lover moans, unable to form words anymore as the over-sized anal bead starts vibrating on her nuts, and a second one starts to crest the rim of her hole. You can only imagine what it’s doing to her prostate, buzzing and rubbing and massaging it with every motion; you’ve got half a mind to just leave it there and let the ausar shemale cum from just the anal stimulation...");
	output("\n\n<i>“C’mon,”</i> she whines. <i>“There’s a lot of those big bastards. Feel like my whole gut’s dancing around... unf, totally worth buying the vibrating kind...”</i>");
	output("\n\nInstead of pulling, you smack Syri’s ass, making her shriek and clench, drawing the second bead back inside. <i>“Oh fuck, oh fuck,”</i> Syri grunts as you start to pull again, making her repeat the whole process until she’s trying not to scream, and there’s a knot-sized lump of buzzing plastic holding her hole wide open.");
	output("\n\nYou pull it out, letting the second bead drop down to join the first in teasing its owner’s cock and balls, making sure Syri’s never lacking for stimulation. As you work, you slowly start to strip off your [pc.gear], getting yourself nice and comfortable as the third bead pops out, then the fourth. By the time you’re wiggling the fifth bead out, Syri can’t help but scream in pleasure, begging you alternatively to go slower or speed up - completely surrendering to pleasure. You can see her knees quaking, barely able to keep her standing at attention for you even as their owner is desperately stroking her cock through her panties.");
	output("\n\n<i>“No... no wait... Steele wait!”</i> Syri cries, just a second too late to keep you from popping bead number five out of her ass in a shower of packed-in cum-colored lube... and triggering a shrill shriek from your lover that sounds an awful lot like <i>“Cumming!”</i>");
	output("\n\nAnd cum she does, throwing her head back with a feral roar of pleasure as she floods her blue panties with a steady stream of creamy white. Syri curses, cries your name, and bucks back against your hands as she blows her load into her silky undies. You grab her hands, pulling them behind her back - both to keep Syri from falling over, and to make sure she gets to enjoy her orgasm the right way: all anal, all the time.");
	output("\n\n<i>“Fuck, ah,”</i> she whines, squirming in your hands. <i>“Wasn’t... wasn’t supposed to happen like this. Stupid fucking vibes oh fuck...”</i>");
	output("\n\nGrinning, you tell your lover you wouldn’t have wanted it any other way.");
	output("\n\nShe gives you a teasing scowl and thrusts her hips back, bowling you over onto the couch. <i>“Got one more bead left, Steele.");
	if(pc.hasCock()) output(" Why don’t you take your present out, and let’s have some real fun. Something tells me you’ve got a nice, thick load ready to go after all this. Or maybe you’d just like to suck my cock clean, huh? Either way’s fine with me....");
	else output(" Maybe just leave it in there, help me get hard again... and let me fuck you silly?”</i>");
	processTime(18);
	pc.lust(33+rand(20));
	clearMenu();
	//Get Fucked
	addButton(0,"Get Fucked",getFuckedBySyri,undefined,"Get Fucked","Leave those anal beads in and help Syri man up and fuck you!");
	//Fuck Ass
	addButton(1,"Fuck Ass",fuckSyrisAss,undefined,"Fuck Ass","Pull Syri’s anal bead out and pound her ass in. It’s already lubed up and stretched out for you...");

}

//Fuck Ass
//Pull Syri’s anal bead out and pound her ass in. It’s already lubed up and stretched out for you...
public function fuckSyrisAss():void
{
	clearOutput();
	showSyriName();
	showBust("SYRI_NUDE");
	author("Savin");
	output("Syri wasn’t kidding: watching her pop those buzzing anal beads out and busting a nut in her silky little outfit has gotten you more hot and bothered than a New Texan bull in a brothel. [pc.EachCock] is almost painfully rigid, demanding of attention. Or better yet, a hot, lubed-up hole to work out all your tension into.");
	output("\n\nRubbing a hand along Syri’s tight ass, you give the string of beads a final tug to pop the anchor out. Your lover moans and shivers as the last bead pops out, and you toss the chain of buzzing butt-breakers to the deck in a wet pile of cum-lube. <i>“Oh that feels better,”</i> Syri purrs, straightening up and smiling at you over her shoulder. <i>“Had those in me since about when you popped into the system... mmm, now I feel kind of empty. Think you can fill me up, Steele?”</i>");
	output("\n\nOh yeah. You lean back in the couch and pat your thigh, inviting your lover to come and get some. She saunters over and slips backwards into your lap, swinging her legs up to rest on either side of you and giving your a face-full of busy ausar tail. You laugh and bat her fluff out of the way, just enough to reach forward and pull Syri back against your chest. She moans and kisses you over her shoulder, grinding her slick ass against your [pc.cock]. As she moves, Syri slowly slips her panties further down, getting them out of the way... and spilling more than a little of her still-hot spunk onto your own [pc.cock], which her fingers are quick to rub in, spreading her spunk over your shaft like an extra layer of lube.");
	output("\n\nYou grab Syri’s hips to steady her, and your cock does the brunt of the work for you, stiff enough that a slight shift of your [pc.hips] brings it in line with Syri’s inviting tail-hole. She moans and bites her lip, fingers finding yours and holding on as you get positioned. <i>“Don’t hold back, Steele. I wanna feel you blowing your load deep inside!”</i>");
	output("\n\nYou start to ease Syri down, guiding her descent past the [pc.cockHead] of your [pc.cock]. She sucks in a sharp breath as soon as you’re starting to slide into her, but it’s nice and easy going after that, and you glide into your lover’s ample rump. Before long, Syri’s sitting flush in your lap, your [pc.cock] buried nice and deep inside her; her own cock throbs and spurts between her legs as you rub up against her prostate just like the anal beads before you. Your lover moans and rubs back against you, trying to get every inch of your tumescent cockflesh into her ass as she can.");
	pc.cockChange();

	output("\n\nOnce you and your ausar cocksleeve are nice and comfortable, you encourage her to start moving with an affectionate slap on the ass; you feel the impact resound through her body, ending in a delightful squeeze on your [pc.cock]. Syri just giggles and starts to move, rising on her knees before gliding back down your slick rod to settle back in your lap. Again and again she rises and falls, keeping a steady pace that soon has you path panting and moaning, holding on to each other for support as the ausar girl milks your dick with her wonderfully talented ass.");

	output("\n\nYou have to admit, Syri’s a consummate butt-slut, working anal magic on your [pc.cock] until you’re barely holding on. She squeezes and wiggles and bounces, and for your part you just try and give as good as you get, making her moan with rekindled lust. Even so quickly after cumming, Syri’s red prick grows stiff again, and you reach around to give it a much-needed caress. She’s still nice and cum-slathered, and your hand is able to slide easily along her shaft to the same beat of her rises and falls. The two of you reek of sex by now: the heavy, musky smell of ausar-cum is thick in the air, and there’s about to be a lot more of it if the way Syri’s breathing is any indication.");
	output("\n\n<i>“Ah, come on,”</i> she growls, flashing you a vicious grin over her shoulder. <i>“Don’t make me cum again before you do. Blow that fuckin’ load in me already!”</i>");
	output("\n\nWell, if she insists. You roll your head back and let your willpower slide away, surrendering to Syri’s anal ministrations. It doesn’t take a moment more before you feel a rush of tension and pleasure rising through your loins; you buck your hips into Syri’s behind and let loose ");
	if(pc.cumQ() < 15) output("a spurt of [pc.cum]");
	else if(pc.cumQ() < 500) output("a thick stream of [pc.cum]");
	else output("a torrential load of [pc.cum]");
	output(" into the ausar’s greedy ass. Your climax sets Syri’s off in turn, and your raven-haired lover collapses back against you as her cock erupts in another fountain of ausar-spunk that splatters her legs and your deck, making an even bigger mess of your ship.");

	output("\n\n<i>“That’s the stuff!”</i> Syri sighs, sinking into your embrace with a heavy sigh. <i>“Mmm, so good... wish we could do this all the time, Steele. I soooo needed that.”</i>");
	output("\n\nYou smile and give Syri a kiss on the cheek. Coincidentally, you’re sure, her bright red prick jumps and spurts onto her leg, soiling her blue leggings. <i>“Think we could stay like this a while?”</i> your lover asks, grabbing at a blanket lying nearby. <i>“I don’t think I could walk if I wanted to...”</i>");
	output("\n\nLaughing, you pull the blanket over the pair of you and cuddle up underneath Syri, content to drift off in your friend’s embrace as you go soft inside her...");

	//[Next]
	processTime(35);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",syriPantySceneEpilogue);
}

//Get Fucked
//Leave those anal beads in and help Syri man up and fuck you!
public function getFuckedBySyri():void
{
	clearOutput();
	showSyriName();
	showBust("SYRI_NUDE");
	author("Savin");
	var x:int = -1;
	if(pc.hasVagina())
	{
		x = pc.cuntThatFits(chars["SYRI"].cockVolume(0));
		if(x < 0) x = rand(pc.totalVaginas());
	}
	output("You give Syri’s booty the attention it deserves, smacking her cheeks and pushing them together around the last ausar-knot sized anal bead. She moans and swipes her tail at you, flailing around as you seal the last of the toys inside her - leaving the rest of the chain drooping against her cock and balls, keeping her nice and stimulated.");
	output("\n\n<i>“Mmm,”</i> Syri groans, hooking her hands into her blue panties and pulling them down into a cum-and-lube-smeared mess. <i>“That feels... really weird. But good. </i>Really<i> good.”</i>");
	output("\n\nShe flashes you a smile over her shoulder and runs a hand along the deflating length of her crimson pecker, covering one of her nails in cum before licking it sensually off. <i>“I see that look, babe. You want a taste too?”</i>");
	output("\n\nYou nod, beckoning your lover to you. She turns on a heel and saunters over, each step making her dick bounce and bob in the most alluring way. She’s still covered in hot cum, a sticky white coat around dark red cockflesh. Your lover’s hands wrap around your head, caressing your [pc.ears] and running her fingers over your [pc.hair] while she angles her cock up to your [pc.lips].");
	output("\n\n<i>“Brought you a snack,”</i> she grins, planting her tapered crown right on your lip, The smell of ausar cum is almost overwhelming now, the strong and earthy aroma making your heart hammer in your chest. What you wouldn’t give to have Syri hard again already, able to just throw you back against the couch and pound your [pc.vagOrAss " + x + "]. But no, you’ll have to work for your fun today.");
	output("\n\nYou open wide, letting your [pc.tongue] play out across Syri’s cum-slathered rod. She gasps and moans, groping at a fishnet-clad boob asyou slowly lap up all the delicious, salty ausar-spunk off her cock. The more of her you clean off, the more you slip into your mouth to enjoy the feeling of half-hard dogflesh throbbing between your lips. B the time you’ve worked you way down to Syri’s base, feeling her balls pressing against your chin and her tip battered the back of your throat, you feel her starting to recover from her first climax: before long she’s nice and hard, moaning as your tongue lavishes her sensitive cockflesh with love.");
	output("\n\n<i>“Got it nice and clean for me?”</i> she murmurs, giving you a gentle push back against the couch and off her now-gleaming dick. <i>“Good " + pc.mf("boy","girl") + ". Now let me give you your reward!”</i>");

	output("\n\nSyri leaps onto you with a feral growl, pushing your [pc.legs] up over her shoulders and burying a pair of fingers straight into your [pc.vagOrAss " + x + "]. You groan and collapse into the cushions, biting your lip as Syri roughly penetrates you, spreading your hole wide open. <i>“That’s right. Moan for me, Steele,”</i> she grins, thrusting her fur-clad digits deep in again and again until you’re desperately trying not to scream in pleasure.");
	output("\n\nAs quickly as she started, Syri yanks her fingers out of you and flops her spit-slick dick onto your thigh, edging it towards your [pc.vagOrAss " + x + "]. All you can do is wrap your [pc.legs] around Syri’s waist and guide her in. As her hips edge into you, the rest of Syri leans in and kisses you fiercely, thrusting her tongue into your mouth a moment before her throbbing cock penetrates your [pc.vagOrAss " + x + "].");
	output("\n\nShe slides in nice and slow, stretching you out around her thick shaft until you feel the thickened bulb of her fleshy knot battering against your ");
	if(x < 0) output("rim");
	else output("lips");
	output(". <i>“Oooh, that’s good,”</i> Syri grins between kisses, reaching down to grab your [pc.butt] in both hands. <i>“Maybe I should just knot you now, let us cuddle in like this, huh?”</i>");
	if(x < 0) pc.buttChange(chars["SYRI"].cockVolume(0));
	else pc.cuntChange(x,chars["SYRI"].cockVolume(0));
	output("\n\nHonestly... that wouldn’t be that bad. You smile up invitingly at your lover, and she takes your approval eagerly. Her hips push forward, grinding her knot against your hole the same way you handled the beads that are still buzzing behind her, helping the ausar girl start building up to another orgasm. Given the way she’s treating you, you don’t doubt she’ll rip one out of you as well... especially when she pounds that thick knot of hers into you.");
	output("\n\n<i>“Get ready!”</i> Syri grunts, rocking her hips further and further into your backside, forcing her bitch-breaker to strain your hole so far open you think she’ll break you in half... before with a wet, echoing pop it vanishes inside you. Your mouth twists open in a silent scream of bliss; feeling a fist of hot, throbbing canid flesh stretching your ");
	if(x >= 0) output("vaginal");
	else output("anal");
	output(" passage wide until your whole body is convulsing with pleasure.");

	output("\n\nA moment later, and you feel a flood of hot, wet heat flowing into your [pc.vagOrAss " + x + "], and that’s enough to buckle you over the edge and into orgasm as well. Syri moans, bucking her hips against your [pc.butt] and filling your hole with a second heaping of ausar spunk. The air hangs heavily with the smells of sex and alien sweat, a heady odor that only elevates your own pleasure.");
	if(pc.hasCock()) output(" Your [pc.cock] erupts all over your belly, spraying you down with [pc.cum] just as Syri’s filling you.");

	output("\n\n<i>“Oh fuck,”</i> your lover moans, bracing her arms against the back of the couch and panting hard into your ear. <i>“Oh, I needed that...”</i>");
	output("\n\nYou grin at her and reach around her waist, grabbing the last of the buzzing anal beads and giving it a gentle tug. She tenses and whines as you pull and pull, finally popping it out and letting the train of knot-shaped beads clatter to the floor. They just keep buzzing, moving around in a sea of lube and cum on your deck as Syri crawls onto the couch with you, trailing kisses up your neck.");
	output("\n\n<i>“Now look what you made me do,”</i> she teases, patting your crotch just over her knot. <i>“Now I’m stuck here till it’s deflated.”</i>");
	output("\n\n<i>“Is that so bad?”</i> you ask, grabbing a blanket from nearby and throwing it over her back.");
	output("\n\nShe flashes you a smile. <i>“Not bad at all.”</i>");
	//[Next]
	processTime(35);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",syriPantySceneEpilogue);
}

public function syriPantySceneEpilogue():void
{
	clearOutput();
	showSyriName();
	author("Savin");
	showBust("SYRI_NUDE");
	//In 1st Time:
	if(!pc.hasKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room."))
	{
		output("You wake up a couple hours later, at once tired and relaxed. The blanket you’d wrapped around you and your lover now clings to you and you alone, tucked in under your arms and [pc.legs]. You yawn and stand up, happy to see Syri took the time to clean up after herself before she left.");
		output("\n\nAll except a pair of sky-blue panties, still plastered with dried cum, sitting beside you. You can’t tell if Syri just forgot them, or if she wanted to leave a memento... for the next time you’re parted for so long.");
		output("\n\n<b>You’ve acquired Syri’s panties!</b>");
		//Syri’s panties: sky blue, silky, with extra crotch room.
		pc.createKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room.");
	}
	//Repeat
	else output("You wake up a couple hours later, at once tired and relaxed. You’re not surprised to find Syri gone, though it does bring a slight smile to your face when you notice the room’s spotless: no trace of your previous fun. A few minutes pass in quiet afterglow, remembering the feeling and the smell of your lover’s embrace, wishing she were still here with you. What you wouldn’t give to have her over all the time like that...");
	processTime(230+rand(20));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
