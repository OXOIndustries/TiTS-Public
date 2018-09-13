import classes.Items.Miscellaneous.EmptySlot;
// BET_AGAINST_SYRI				: 1 if PC has ever engaged in a bet with Syri
// FUCKED_SYRI_COUNT			: Number of times the PC has boned or been boned by the big-boned bitch.
// MET_SYRI						: 1 if the PC ever met her.
// TIMES_BET_YOURSELF_AGAINST_SYRI : You get the drill.
// TIMES_LOST_TO_SYRI			: Times you've lost betting to Syri!
// TIMES_WON_AGAINST_SYRI		: Times you've defeated her!
// TIMES_BUTTFUCKED_BY_SYRI		: Times lost AND been buttfucked.
// SEEN_SYRI_IN_THE_MORNING		: Times the PC has approached Syri in the mornings
// SYRI_BETTING_STORAGE			: Stores credit bet or 9001 if ass betting.
// SYRI_TALKS 					: Stores what talk scene to display next in the sequence. Scene 1 never repeats. YAY!
// SYRI_GIFT_PANTY
// SYRI_CREWMEMBER				: undefined not recruited, 0 at Burts, 1 onboard ship, 2 at Freezer

public function showSyri(nude:Boolean = false):void
{
	if(flags["MET_SYRI"] == undefined) userInterface.showName("AUSAR\nGIRL");
	else userInterface.showName("\nSYRI");
	showBust(syriBustDisplay(nude));
}
public function syriBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "SYRI";
	if(nude) sBust += "_NUDE";
	return sBust;
}

public function syriRecruited():Boolean
{
	if (flags["SYRI_CREWMEMBER"] != undefined) return true;
	return false;
}
public function syriIsCrew():Boolean
{
	if (flags["SYRI_CREWMEMBER"] == 1) return true;
	return false;
}

public function syriVaginalCapacity():Number { return 350; }

public function syriIsAFuckbuddy():Boolean
{
	if(syriFriendsWithBenefits()) return true;
	return false;
}

// Is Syri actually at Burt's bar?
public function syriAtBurts():Boolean
{
	if (flags["SYRI_CREWMEMBER"] == 0) return true;
	if (syriIsCrew() || syriQuestRunning() || syriQuestComplete()) return false;
	return true;
}

public function syriAtBurtsBonus(btnSlot:int = 2):void
{
	if(hours >= 12) {
		//Hasn't bet against Syri yet
		if(flags["BET_AGAINST_SYRI"] == undefined) {
			output("\n\nToward the corner of the Mead Hall, you note that a pair of holoscreens have been set up on one of the walls. A small crowd of dock workers and other spacers have gathered around it, apparently taking bets. Might be worth a look, who knows?");
			//[Games]
			addButton(btnSlot,"Games",syriGamesStart);
		}
		//Has bet against Syri
		else {
			output("\n\nThe cocksure ausar girl, Syri, is standing across from the game screens, deep into a match as she nurses a stiff Terran beer. Seeing you standing around, she waves you over, clearly looking for a rematch. ");
			if(flags["FUCKED_SYRI_COUNT"] != undefined) output("She’s certainly got that lusty look in her eyes...");
			//[!Syri]
			addButton(btnSlot,"Syri",syriGamesStart);
		}
	}
	//Add to Bar Description, Early Morning
	else {
		if(flags["FUCKED_SYRI_COUNT"] != undefined) {
			//(First time; must have fucked Syri at least once)
			if(flags["SEEN_SYRI_IN_THE_MORNING"] == undefined) {
				output("\n\nYou see Syri the ausar gamer sitting in a stool at the bar, scanning a data slate as she absently pokes at a hearty looking breakfast that looks like it’s been there for ages. Doesn’t look like she’s gaming yet, though with the place practically deserted in the wee hours, she might be up for just talking...");
			}
			//(Repeat)
			else {
				output("\n\nSyri’s at her usual place, reading and munching on some nuts Burt’s left for her. Seeing you looking her way, she flashes you a grin and indicates the empty seat beside her.");
			}
			//[Syri]
			addButton(btnSlot,"Syri",approachSyriIntheMorning);
		}
	}
}

public function syriGamesStart():void {
	clearOutput();
	showSyri();
	author("Savin");
	//[Games] (Repeat)
	if(flags["MET_SYRI"] != undefined) {
		output("You make your way over to the small crowd of frontier gamers, parting through the group gathered around the current match. Syri’s right in the thick of it, firing a hardlight rifle at some virtual foe one-handed as she gulps an ausar ale. Seeing you approach, she flashes you a grin.");
		//(If PC has NOT fucked her)
		if(flags["FUCKED_SYRI_COUNT"] == undefined) output(" <i>“Ready for a match, [pc.name]?”</i>");
		//(IF PC HAS fucked her)
		else output(" You can see the lust in Syri’s eyes as she looks you over, licking her lips. <i>“It’s your ass on the line, cow" + pc.mf("boy","girl") + ". Wanna play?”</i>");
	}
	//[Games] {Hasn't PLAYED yet}
	else {
		output("You make your way over to the small crowd that’s circled up around the screens, pushing your way in just in time to see an alien man and woman standing almost shoulder to shoulder, hooked up in holo-bracers and hardlight projectors, furiously playing one of the newest shooter games. The male, a particularly broad-chested Zil, awkwardly maneuvers a projected rifle in his chitin-y, insectile fingers, brow furrowed in concentration; the woman beside him, a buxom xeno with a pair of perky wolf-ears towering over her pale, almost human face, has a cock-sure grin a mile wide, moving with a tactical precision that just screams military.");

		output("\n\nTurning your eyes toward the screen, you’re just in time to see the wasp-man’s character leap from cover and charge into a hail of lasers and bullets; the crowd yells out a deafening cheer as his avatar rifle-butts another player, perfectly mimicking the Zil’s own motions. He thrusts his fist in the air, grabbing a beer from someone and knocking it back in one go. <i>“Not so cocksure now, Syri?”</i>"); 

		output("\n\nMost of the people around you join in, jeering at the ausar woman beside him.");

		output("\n\nJust as the Zil finishes speaking, the wolf-eared girl gives a predatory grin and squeezes the trigger on her holographic rifle. The Zil’s screen shudders violently and goes blood-red; the player himself cries out as some sort of feedback zaps him, nearly throwing him to the floor.");

		output("\n\nThere’s a long moment of silence - the entire tavern seems frozen in place - before the crowd around you groans and starts shelling out credit chits. The ausar marksman just keeps on grinning as she ditches the holo-gear, pulling herself up onto the nearest table and grabbing a beer.");

		output("\n\n<i>“Better luck next time, Jin,”</i> she laughs, waving gaily as the burly bee stalks out of the tavern quite a few credits shorter.");

		output("\n\n<i>“Oh, what’s this? Fresh meat for the grinder?”</i> she laughs, eyeing you. <i>“What do you say, stranger, care to test your skill? One on one matches, three kills to win. Maybe for a little wager...”</i>");
	}
	//[Bet 10] [Bet 50] [Bet 100] [Not today] [Bet yourself]
	clearMenu();
	if(pc.credits >= 10) addButton(0,"Bet 10",betSyriCredits,10);
	else addDisabledButton(0,"Bet 10","Bet 10","You’re too poor.");
	if(pc.credits >= 50) addButton(1,"Bet 50",betSyriCredits,50);
	else addDisabledButton(1,"Bet 50","Bet 50","You’re too poor.");
	if(pc.credits >= 100) addButton(2,"Bet 100",betSyriCredits,100);
	else addDisabledButton(2,"Bet 100","Bet 100","You’re too poor.");
	
	var timesWin:int = 0;
	var timesLoss:int = 0;
	if(flags["TIMES_WON_AGAINST_SYRI"] != undefined) timesWin += flags["TIMES_WON_AGAINST_SYRI"];
	if(flags["TIMES_LOST_TO_SYRI"] != undefined) timesLoss += flags["TIMES_LOST_TO_SYRI"];
	if(timesWin + timesLoss >= 3) addButton(3,"BetYourself",betYourselfAgainstSyri);
	else addDisabledButton(3,"BetYourself");

	//Pet-play
	//[Pet-play] //Requires [BetYourself] to have been done, also requires Syri’s fuckbuddy status. Not naga or taur compatible, sorry horse friends. 
	//This scene will have a very high aim check.
	if(syriIsAFuckbuddy() && !pc.isTaur() && !pc.isNaga()) addButton(4,"Bet Petplay",syriPettyPlayeeeeeeBettyBooButtMcBunners,undefined,"Pet-Play","Wager over who will spend the day being the other’s pet.");
	else if(syriIsAFuckbuddy()) addDisabledButton(4,"Bet Petplay","Pet-Play","Sadly these scenes do not support tauric creatures or nagas.");

	if(syriIsAFuckbuddy()) addButton(5,"Hug",syriHugStuff,undefined,"Hug","Hug the gamer-pup.");

	trace("SHIT ADDED UP: " + timesWin + timesLoss);
	
	addButton(14,"Back",notTodayDogslut);
}

// Game scoring
public function syriPlayGameResult(tries:int = 15):Boolean
{
	var won:Boolean = false;
	var misses:int = 0;
	
	// Calculate misses
	for(var i:int = 0; i < tries; i++)
	{
		if(rangedCombatMiss(chars["PC"], chars["SYRI"], 0)) misses++;
	}
	
	if(misses <= 1) won = true;
	// Give result
	//output("\n\nMisses: " + misses);
	return won;
}

//Not Today
public function notTodayDogslut():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("You shake your head and take a step back. The ausar sighs and sips her beer, <i>“Well, if you ever change your mind, you know where the action is.”</i>");

	//[Back to tavern menu]
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Bet X]
public function betSyriCredits(amount:int = 0):void {
	clearOutput();
	showSyri();
	author("Savin");
	IncrementFlag("BET_AGAINST_SYRI");
	flags["SYRI_BETTING_STORAGE"] = amount;
	
	if(flags["MET_SYRI"] == undefined) {
		flags["MET_SYRI"] = 1;
		output("<i>“Sure,”</i> you say, pulling up some credits on your codex tablet. <i>“Let’s see what you’ve got, miss...”</i>");

		output("\n\n<i>“The name’s Syri. Best shot in this dump - at least as far as video games go, anyway. Well come on then, step on up and grab a rig. Let’s see what you’re made out of...”</i>");

		output("\n\n<i>“[pc.name],”</i> you answer, picking up a bracer and visor.");
		clearMenu();
		addButton(0,"Next",syriGameRouting);
	}
	//PC must succeed two high-difficulty ranged weapon attacks out of three to win.
	else syriGameRouting();
}

//[Bet yourself]
public function betYourselfAgainstSyri():void {
	clearOutput();
	showSyri();
	author("Savin");
	flags["SYRI_BETTING_STORAGE"] = 9001;
	output("<i>“Sure, but not for credits,”</i> you say, letting your eyes play across the shapely curves and ample bust on the alien girl. Her tail twitches, nearly knocking over a beer bottle beside her.");

	//If First Time:
	if(flags["BET_AGAINST_SYRI"] == undefined) {
		output("\n\n<i>“Woah there, cow" + pc.mf("boy","girl") + ". Let’s not get ahead of ourselves here. Maybe once you’ve proved what you’ve got, then we can see about... upping the ante. What do you say?”</i>");
		// [Return to normal bet menu]}
		clearMenu();
		addButton(0,"Next",syriGamesStart);
		return;
	}

	var timesWin:int = 0;
	var timesLoss:int = 0;
	if(flags["TIMES_WON_AGAINST_SYRI"] != undefined) timesWin += flags["TIMES_WON_AGAINST_SYRI"];
	if(flags["TIMES_LOST_TO_SYRI"] != undefined) timesLoss += flags["TIMES_LOST_TO_SYRI"];
	
	//If you've bet 3+ times against her
	if(flags["FUCKED_SYRI_COUNT"] == undefined) {
		output("\n\n<i>“Well, well, feeling brave are we?”</i> the ausar girl says, slipping down from her perch to stalk toward you, hips swaying. She slips around you, one furry hand trailing across your [pc.hip]. <i>“Well, you’re not bad looking and not the worst gamer I’ve seen... not by a long shot... but I feel like I ought to warn you, [pc.name],”</i> she says, pressing herself up against you. At first, your mind can only think of the hefty, oh-so-soft orbs smushed against your back, a pert little teat on each rubbing across " + (pc.hasArmor() ? "your [pc.armor]" : "the surface") + ". After a moment, though, you feel a throbbing something... else... pressing against your [pc.butt].");

		output("\n\n<i>“I’ve got a little something extra, stranger. And if you lose, I’m going to bend you over this table and fuck your ass with a big knotty prick until I’ve got you nice and tied and screaming like a bitch in heat. Of course, if you somehow manage to win, you can ride my cock");
		//if PC has a dick:
		if(pc.hasCock()) output(" or pound my little pucker all you want, whichever suits your fancy. I don’t judge.");
		else output(".");
		output(" So what’ll it be, [pc.name]? Ready to put your ass on the line for a chance at mine?”</i>");
		//[Sure {Go to Bet X text}] [Not today]
		clearMenu();
		addButton(0,"Sure",syriGameRouting);
		addButton(1,"Nope",notTodayDogslut);
	}
	//If PC has won and fucked Syri more than not:
	else if(timesWin + timesLoss > 0 && timesWin >= timesLoss) {
		output("\n\nSyri licks her lips and slips down beside you, a furry hand running across your hip. <i>“I can’t say I’m not looking forward to a chance to stick my cock in this fine slice of meat... though I gotta admit, losing to you isn’t so bad either. Let’s see what you’ve got!”</i>");
		//[Go to Bet X text]
		clearMenu();
		addButton(0,"Next",syriGameRouting);
	}
	//If PC has lost more than not:
	else {
		output("\n\nSyri licks her lips and slips down beside you, a furry hand running across your hip. <i>“You just keep coming back, don’tcha? It’s like you just crave a nice ass full of my cock. Well, don’t worry, I’ve got just the thing you need, my little bitch. You want to try your chances? Then let’s see what you’ve got. But I’ve got a nice, thick load of cum built up just with your asshole’s name on it.”</i>");
		//[Go to Bet X text]
		clearMenu();
		addButton(0,"Next",syriGameRouting);
	}
}

public function syriGameRouting():void {
	var won:Boolean = syriPlayGameResult(15);
	if(won) {
		IncrementFlag("TIMES_WON_AGAINST_SYRI");
	}
	else {
		IncrementFlag("TIMES_LOST_TO_SYRI");
	}
	//Bet yourself?
	if(flags["SYRI_BETTING_STORAGE"] == 9001) {
		IncrementFlag("TIMES_BET_YOURSELF_AGAINST_SYRI");
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
	showSyri();
	author("Savin");
	output("Nearly an hour passes in the game. The graphics are photo-realistic, the controls tight and precise. Every movement you make is perfectly mirrored in the game. The map is huge, and your character is slow. It’s a maze, and soon you realize it’s less skill in battle, here, than skill at the hunt. Just finding Syri in the ruined city map that the game has you in is challenging, and every time you think you’ve got her, she darts away. Finally, you slay her, putting a bullet between her avatar’s eyes. The audience cheers, and more and more people gather as they realize you’ve got skill.");

	output("\n\nA moment later, though, your screen blacks out as a grenade blasts near you. The holo-harness buzzes, giving you a nasty jolt that leaves your teeth chattering. Respawn. You move stealthily, creeping across the ruins at a snail’s pace. Shots are exchanged. You both retreat, licking your virtual wounds. You creep forward, cautiously taking the long road around the map, moving at a snail’s pace. Tensions run high; the audience is at the edge of their seats. You think you catch sight of your opponent, moving away from you. You slip into a building, move to higher ground. Looking down the rifle’s scope, you scan the rubble, looking for even the slightest movement.");

	output("\n\nThen you see her: crouched behind a burned-out hover car, waiting in ambush for you. You grin as you calmly take aim, putting your crosshair right over the virtual ausar’s avatar before pulling the trigger. Syri yelps as her rig zaps her in time with the bullet blasting her character’s head off. Spitting curses, the ausar throws her rig off. <i>“Holy fuck, how’d you hit me from WAY OVER THERE!?”</i> she shouts, staring wide-eyed at her screen. A deal’s a deal, though, and you answer by grabbing her and ripping her shirt off, baring her big, perky DD’s.");

	output("\n\nSyri’s breath catches as you cup one of her full mounds, twisting the pert red nipple between your fingers as you contemplate what to do with the defeated ausar.");
	//SEX MENU!
	clearMenu();
	if(pc.hasCock() && pc.cockThatFits(chars["SYRI"].analCapacity()*1.75) >= 0) addButton(0,"FuckHerButt",victoryFuckSyrisBunghole);
	else if(pc.hasCock()) addDisabledButton(0,"FuckHerButt","Fuck Her Butt","You’d split her in half if you tried to fuck her butt. Damn.");
	else addDisabledButton(0,"FuckHerButt","Fuck Her Butt","You need a dick to fuck her butt.");
	addButton(1,"RideHerDick",rideSyrisCockYouWinner);
	if(pc.hasVagina()) addButton(2,"Up My Pussy",rideSyriInYerCoochYaWinner,undefined,"Up My Pussy","Take your prize and stick it as far up your pussy as it will go.");
	else addDisabledButton(2,"Up My Pussy","Up My Pussy","You need at least one vagina on your crotch large enough to accept Syri’s cock to play this scene.");
	//Available in Syri's menu after winning her bet, requires a hardlight strapon, maybe no cock.
	//[HL Frot&Fuck] Put your hardlight-equipped [pc.lowerUndergarment] to use on all of Syri's good bits.
	if(pc.hasHardLightEquipped()) addButton(3,"HL Frot&Fuck",goddamnIAmSoTiredOfThisVanillaAssPuppyGirlSex,undefined,"HL Frot&Fuck","Put your hardlight-equipped [pc.lowerUndergarment] to use on all of Syri’s good bits.");
	else addDisabledButton(3,"HL Frot&Fuck","HL Frot&Fuck","You need panties equipped with a hardlight dildo for this.");
	addButton(4,"Nevermind",nevermindSyri,undefined,"Uh, Never mind","On second thought, you’ll pass on claiming your winnings this time.");
}

public function nevermindSyri():void
{
	clearOutput();
	showSyri();
	author("Not Savin. HAH!");
	output("<i>“You get off lucky this time, ausar,”</i> you say as you spin the panting dickgirl away. <i>“But next time you might not be so lucky.”</i>\n\nShe looks a little confused at the reprieve and maybe even a little hurt, but she doesn’t show it for long. Besides, you’ve got better things to do than waste all your time screwing around in a bar.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Available in Syri's menu after winning her bet, requires a hardlight strapon, maybe no cock.
//[HL Frot&Fuck] Put your hardlight-equipped [pc.lowerUndergarment] to use on all of Syri's good bits.
public function goddamnIAmSoTiredOfThisVanillaAssPuppyGirlSex():void
{
	clearOutput();
	showSyri(true);
	author("HugsAlright");
	output("You know just what you’re going to do with this defeated little pup.");
	output("\n\nReleasing your grasp on Syri’s pert red nipple you slide down and get yourself level with her pair of big, soft breasts, still groping and kneading one of her full orbs. Smiling to yourself, you let your tongue loll from your mouth and flick it across one of her cherry nubs, resulting in a little gasp from the subdued she-wolf before you close your [pc.lipsChaste] around her stiff teat.");
	output("\n\nShe doesn’t seem to be in any mood to protest, only able to release barely-suppressed whimpers as you start suckle on her supple jugs. Before too long her mewling turns to quiet moans, throwing her legs around your waist in an attempt to keep you where you are, stuck on her stiff, now even redder nubs. While you <i>are</i> enjoying keeping your lips wrapped firmly around this slutty bitch’s nipples, you can’t have her throwing her legs around whatever she wants like she owns the place; no, that won’t do at all.");
	output("\n\nWith all your might you grab Syri by her flared hips, hoist her upwards with a little yelp of surprise, spin the two of you around, and drop the she-wolf onto a nearby table with a grunt, her still-jiggling tits pointed skywards. The ausar’s legs are left spread around your [pc.hips], and you would have perfect access to that coveted pucker of hers if not for her pants... time to do something about that. With Syri still reeling from her sudden change of scenery, you reach down for the hem of her jeans and yank them off with the force of a thousand exploding suns. As soon as it’s clear of its confinements, Syri’s red, knotty cock pops free and slaps against her stomach, eliciting a sigh of relief from the wolfy bitch as you strip her bare before the whole bar.");
	output("\n\nTossing her lower garments aside, you eye up the naked ausar before you, [pc.eyes] scanning her curves and mounds, nearly drooling as lose yourself in all the wonderful possibilities you have with a body like this at your disposal. Then your lustful concentration is broken by a condescending tone from your canine prize, <i>“You just gonna stand there and gawk?”</i> You bring your gaze to meet Syri’s, only to see a smug smirk on her face.");
	output("\n\nCan’t have that now, can you? You give the ausar’s olive-skinned thigh a rough slap to remind her who’s in charge here, causing her to suck in a sharp breath.");
	//moreThanPanties:
	if(!pc.isCrotchExposedByArmor()) output(" With Syri good and nude (and quiet) on the table, you strip yourself of everything but your very special [pc.lowerUndergarment], smiling all the while and lining your hips up with Syri’s.");
	else output(" Already stripped of everything but your [pc.lowerUndergarment], you smile down at Syri and line your [pc.hips] up with hers.");
	output("\n\nThe ausar takes a single look at your [pc.lowerUndergarment]-clad crotch and careens her neck to look up at you, her mien appearing rather confused, and a bit supercilious.");
	output("\n\n<i>“Forgetting something?”</i> she asks.");
	if(pc.isBimbo()) output("\n\n<i>“I don’t think I am,”</i> you respond, giving her a slightly confused look and prompting Syri to roll her eyes.");
	else if(pc.isAss() || pc.isMischievous()) output("\n\n<i>“No,”</i> you respond, giving her your most evil grin.");
	else output("\n\n<i>“Of course not,”</i> you tell her with a warm smile.");

	output("\n\nWith that said, you flick on your hardlight-equipped undergarment, letting its bright light fill the dimly-lit bar for a moment as you wait for Syri’s reaction. She doesn’t look very impressed, or surprised; she just gazes up at you with the same, conceited smirk she was giving you before.");

	output("\n\n<i>“A strapon, huh?”</i> the she-wolf chimes in, <i>“I used to be a </i>god<i> with one of those back in the marines, never a quiet moment in the ladies barracks when I was around.”</i> Syri gives you a little <i>“Hmph”</i> before bringing her hands behind her head and leaning back, looking quite relaxed, and quite bored, <i>“I bet you barely even know how to handle one of those things.”</i>");
	output("\n\nIs that so? Well, you’re not going to take that insult sit- err... standing up; you flash the bitch your most predatory grin and hook your arms under her thighs, and with some strain you throw her well-toned limbs over your shoulders. Syri doesn’t give you a reaction, even with her legs all the way up and her tailhole within easy reach of your holo-cock. Regardless of that, you drop your solid-light prick onto the her own puppy-prick. Despite the she-wolf continuing her uninterested demeanor, you manage to draw a gasp from Syri with that, a slight buzz of pleasure running through your body as ausar cock makes contact with your simu-dick. Determined to get something out of this slut, you start to rock your hips, rubbing your hard light against warm, red cockflesh, all the sensations of a real dong running through your system. A little whimper forces its way past Syri’s lips as her cockflesh is caressed by your glowing dick, a few sounds of pleasure making their way out of your lungs as well.");
	output("\n\nYou continue with the same motion, slowly speeding up, frotting with your prize until you’re both fairly worked-up, moaning and groaning as the warmth of Syri’s knotty doggy-dong rubs against your simulated tool, driving you to move faster and faster. Your lover’s breasts fall into a rather hypnotic motion as she rocks back and forth on the table thanks to the ceaseless thrusting and pumping of your [pc.hips], her tail brushing against your [pc.thighs].");
	output("\n\nJust as the first few drops of her salty pre drip from her pointed tip onto her stomach, Syri speaks up again, her voice a bit shaky with near-orgasmic bliss, <i>“Well, c-c’mon, you just gonna rub my dick all day, o-or stick it in me?”</i>");
	output("\n\nWell, if she wants it <i>that</i> bad.");
	//upgradedStrapon:
	if(pc.hasHardLightUpgraded()) 
	{
		output("\n\nYou smile at Syri’s newfound enthusiasm and finally pull your holo-dong away from her throbbing red shaft, resulting in a lustful sigh from the asuar before you go to line your hardlight up with her exposed pucker. Giving your hips a little thrust forward, your glowing cockhead presses against her asshole, drawing a sharp gasp from her. You hold yourself there a moment, not pressing forward... no, you need her attention for this next part.");
		output("\n\nThe raven-haired woman quickly props herself of on her elbows to get a better look at what you’re doing, your sudden stillness clearly interesting her. <i>“Well?”</i> she asks, impatience written across her face, <i>“I don’t have all day.”</i>");
		output("\n\nYou don’t say a word, and simply reach down to your [pc.lowerUndergarment] and flip a single switch, causing your hardlight to grow a good and sudden extra foot in length.");
		output("\n\nSyri’s eyes widen at that, her once confident mien turning sour as she mutters the only words she can muster: <i>“Oh fuck.”</i>");
	}
	else output("\n\nYou smile at Syri’s newfound enthusiasm and finally pull your holo-dong away from her throbbing red shaft, resulting in a lustful sigh from the asuar before you go to line your hardlight up with her exposed pucker. Giving your hips a little thrust forward, your glowing cockhead presses against her asshole, drawing a sharp gasp from her. Then you start to push forward, applying as much pressure as you can until Syri starts to whimper at the force placed on her poor pucker.");

	output("\n\n<i>“Oh fuck, oh fuck, oh fuck fuck fuck <b>fuck</b>!”</i> the ausar girl cries out as sudden pressure builds on her tight tailhole, all until your light-bright tip penetrates the slut’s asshole, spreading her wide with a quivering, pleasured groan of <i>“Fuuuuuuuuuuuck”</i> ripped from her lips.");

	output("\n\nYou don’t let up and start to roll your [pc.hips], sawing more and more of your simulated cock into the bitch’s tailhole, stretching her puppy-pucker and setting her moaning until you finally reach her deepest depths. Syri’s asshole spasms around your holo-dong as you finally bottom out inside her, leaving the she-wolf panting, but she’s not going to get a single moment’s rest from you. Almost immediately after your relentless penetration ends, you start to pull back, drawing a few loud groans from Syri in the process, and a few globs of alabaster from her dick when your hardlight rubs against her prostate; as soon as the tip of your light-bright cock reaches her convulsing pucker, you grin wide and lustfully and thrust back into Syri with one long stroke. The trip back in leaves both you and Syri to moan and cry out in pleasure, your hardlight caressing the ausar’s inner walls and her tailhole caressing your simulated shaft in-turn.");

	output("\n\nYou repeat that same motion again and again, pounding this defeated pup’s ass without repose, feeling her big, squishy bottom jiggle against your [pc.thighs] with each inward thrust, and watching her sizeable breasts quake and shake hypnotically as she rocks back and forth on the table. Lost in the moment and biting down on your lip, you barely have anytime to react when Syri’s pucker suddenly clamps down on your solid-light cock, sending a jolt of bliss up your spine that makes you groan and look down at your lover... just in time to see her cream herself. The wolfy shemale’s pretty red prick spasms as a low grunt forces its way past the ausar’s lips, dispensing her salty alabaster all over her own tits, whimpering and quivering with the relief of her peak; quite the show, all in all. Syri goes limp on the table as her orgasm passes, relieving you of what little opposition her ass had to offer before, and flooding your nostrils with the heavy musk of her seed, both driving you to move faster and faster in an attempt to speed yourself to climax.");

	output("\n\nYour hard work pays off when you feel your entire body tense and your loins burn with inexorable pleasure that makes you cry out and moan, tightening your grip on Syri’s legs. Your [pc.hips] buck jerkily as you ride out your simulated orgasm, your hardlight sending wave after wave of dopamine to batter your mind’s shore until you can feel your peak start to plateau.");

	output("\n\nFinally coming down from your climax, you breath heavy and look down at Syri, watching her recover from the afterglow of her orgasm. You give her a little smirk before you pull your holo-cock from her well-fucked asshole, leaving it with quite the gape, and its owner to shudder at the sensation of being emptied so utterly.");

	output("\n\n<i>“Alright...”</i> The thoroughly-used ausar manages to mutter between each heave of her expansive chest, propping herself up on her elbows once more to look at you, <i>“Maybe you </i>do<i> know how to use one of those... but you’re still not as good as me.”</i>");

	output("\n\nWell, looks like you’ll have to settle for being second best if you’re trying to please this pup, but you can rest assured in the fact that you’re the <i>real</i> winner after that.");
	output("\n\nAs Syri picks herself up from the table she faces you again and smiles, <i>“I guess I’ll have to show you a few tricks to use with one of those.”</i>");

	processTime(32);
	pc.orgasm();
	pc.exhibitionism(2);
	IncrementFlag("FUCKED_SYRI_COUNT");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Fuck Her Butt
//Req's any dick! Handles big dongs A-okay.
public function victoryFuckSyrisBunghole():void {
	clearOutput();
	showSyri(true);
	author("Savin");
	
	var x:int = pc.cockThatFits(chars["SYRI"].analCapacity()*1.75);
	if(x < 0) x = pc.smallestCockIndex();
	
	output("Unable to resist the urge to spread this dog-slut’s legs and fuck her like the bitch she is, you flip Syri around and push her down onto the nearest table, pinning her arms behind her back. She squirms, struggling against you as your hand plays across her wide hips, squeezing one of her full cheeks beneath her pants. It’s like putty in your hand, so soft and kneadable. Her tail twitches and flickers, swatting across your face as its owner tries to pretend she doesn’t enjoy you playing with her big, delicious ass. You let her carry on for a few minutes as you grope her ass, starting to grind on her, cock swelling as it rubs against the coarse fabric of her clothes, feeling the radiant warmth of the ausar’s body and the hypnotic movements of her hips.");
	output("\n\n<i>“Come on,”</i> she growls, finally settling down a bit in your unrelenting grip. <i>“Just fucking get it over with already.”</i>");

	output("\n\nYou grin and with one deft motion hike her pants down, letting her throbbing erection pop free, slapping helplessly against the edge of the table as you drink in the thick crescents of Syri’s bared ass. Moving her tail out of the way, you slip down and spread her cheeks with a probing pair of fingers, trailing from the base of her knotty red pecker across her taint and up to the puckered little ring of her ass.");

	output("\n\nSyri shivers as your finger passes across the clenched hole, but the unconscious wriggle of her hips is all you need to know she’s ready for a pounding, even if she’s casting haughty death glares over her shoulder. Chuckling, you spit right on her asshole, leaving a thick dollop of saliva right on the mark.");

	output("\n\nSyri gasps as the warm saliva drools across her ass, but you don’t leave it there for long. Your finger goes to work with expert precision, circling around her ring with slow, thorough ease, gently swirling your lubricant in as you apply more and more pressure, right up until your finger pops into her pucker with a soft squelching sound.");

	output("\n\nThe ausar slut grits her teeth and groans as your finger probes into her, gliding in to the first knuckle with surprising ease. Her tail twitches as you delve into her ass, the pooch’s cock spasming thin little trickles of cum down the table edge and onto the floor. <i>“F-fuuuck,”</i> she groans, voice little more than a hoarse whisper as you try to move deeper, spreading your spit along her anal walls. She gets tighter and tighter as you move in");
	if(flags["FUCKED_SYRI_COUNT"] == undefined) {
		output(", making you wonder if she’s ever had anything more than a few fingers back here");
	}
	output(". Her sphincter clenches powerfully around your second knuckle as it passes through, sliding deeper and deeper until you’re able to feel a big, thick ball just through her muscles. Is that...?");

	output("\n\nYou roll your fingertip across the little ball, grinning to yourself as you watch Syri’s prick jump to attention and spurt a nice big glob of pre right onto her foot. She groans, arching her back and digging her nails into the table as you toy with her prostate, milking it with even the gentlest touches. Oh, she’s sensitive. So very, very sensitive.");

	output("\n\nAn irresistibly naughty thought crosses your mind: with a loud crack, you bring your other hand down hard on Syri’s butt. She yelps, flesh jiggling as her muscles squeeze down like a thousand vices on your finger, nearly pushing it out. A huge blob of cum drools obscenely from her engorged prick as your digit is shot back across her pleasure nub, and Syri can’t help but moan with pleasure, her prick throbbing in ecstasy, ready for, no, <i>demanding</i> more.");

	output("\n\nGiving the red mark on her ass an affectionate squeeze, you withdraw from her spit-filled hole and discard the last of your gear, letting your [pc.cock " + x + "] flop down into the tight little crevice of her wiggling cheeks. With your [pc.cockHead " + x + "] just sticking out from the middle of her crack, you arch an eyebrow as Syri’s tail wiggles around your length, tip tickling your cumslit until it’s stained and matted with the first drops of your own sexual need.");

	output("\n\n<i>“Don’t just sit there,”</i> the horny alien growls, tail caressing your cock until you shudder, waves of pleasure seething from the thousands of nerves on your crown. More seductively, voice bordering on a purr, she whispers, <i>“I’m waiting.”</i>");

	output("\n\nA predatory, sexual groan escapes your lips as your hips rock back, leveling your thick erection right at the bullseye between her cheeks. Syri even reaches back to pull them apart, giving you a straight shot into her waiting hole. With such a welcoming invitation, how could you refuse? You move forward, [pc.cockHead " + x + "] pressing into the spit-slick dark star, and immediately you can hear the thunk of Syri’s prick jumping to attention, slapping wetly against the cum-soaked table, drooling in anticipation.");
	pc.cockChange();

	output("\n\nSyri starts to speak, but her voice catches as you push in, instead coming out as a high-pitched squeal as your prick spreads her wide, battering past her spasming sphincter and into the dark, warm, wet channel beyond. She grabs the table, trying to steady herself as your hips rock slowly forward, giving her just enough time to adjust to each and every one of your " + possessive(pc.cockDescript(x)));
	//if cockLength >= 12:
	if(pc.cocks[x].cLength >= 12) output(" many");
	output(" inches.");

	output("\n\n<i>“Oh, fuck. Fuckfuckfuck,”</i> the ausar girl whines as you utterly spear her on your cock, her legs and tail twitching and her cock spasming as your thick length pushes inch after inch across her over-sensitive prostate. The act milks so much pre out of her in just one thrust that it pools between her paw-like feet, a white lake in contrast to her dark fur. For a moment, you stop your onslaught, [pc.chest] heaving as you revel in the vice-like grip of Syri’s ass, trembling in pleasure as you feel her heartbeat pulsing through her body. Her battered pucker is gently squeezing your cock, practically massaging your dick as your [pc.cockHead " + x + "] squirts out the first thick glob of pre into your submissive little ausar slut’s bowels.");

	output("\n\nYou sit still for a moment longer, and right on cue, Syri starts wriggling her hips for you, awkwardly humping on your cock to get a little more stimulation from the prick buried inside her. You respond with a sharp swat on the ass, making her yelp and clamp down hard on your [pc.cock " + x + "] just as you start to move. Grabbing her hips, you lay into the ausar’s tight little ass, jackhammering into her with a vengeance. Once she’s started, Syri can’t stop - with every thrust she’s crying out and moaning, hips thrusting back against and tail wagging wildly. Her back arches high, ears perked and tongue hanging out like the puppy-slut she is. You can feel her cock throbbing between her spread legs, spasming with every thrust that drags across her tiny bud.");

	output("\n\nYour buttfucking lasts for several more unrelenting minutes. You drill Syri’s ass, treating her like your personal onahole. She whines and moans like a bitch in heat, responding to your every motion with a wag of her tail and a wiggle in her hips, vigorously humping you back. You barely notice when she tenses up, letting out a high-pitched shriek as her knotty prick erupts in a flood of hot seed that pours onto the table and her thighs, staining her tanned flesh white. You never let up for a second, only even acknowledging the alien dickgirl’s orgasm with a harsh slap on the ass that gets her spasming ass squeezing even harder. She milks you hard, every muscle in her tight ass writhing in uncontrollable pleasure as your prick batters her prostate, pushing out load after thick, creamy load from her bright-red doggy dick.");

	output("\n\nThe canine rear’s convulsions eventually push your proud resolve to its brink. Sinking your fingers into Syri’s thick kiester, you roar a primal exaltation and slam your prick home ");
	if(pc.cockVolume(x) > chars["SYRI"].analCapacity()) output("until you’re giving her every inch the poor ausar can take");
	else output("to the hilt");
	if(pc.balls > 0)
	{
		output(". Your [pc.balls] churn");
		if(pc.balls <= 1) output("s");
	}
	else output(". Your prostate clenches");
	output(" and your [pc.cockHead " + x + "] blasts the first massive load into Syri’s guts, shooting a thick stream of [pc.cumColor] seed deep into her bowels. The ausar girl groans and cries as your burning love fills her, the excess spurting out around your [pc.cock] as you hammer her, fucking her right through the orgasm until you’re completely spent.");

	output("\n\nPrick still lodged in Syri’s well-fucked ass, you heave a heavy sigh and wipe the sweat from your brow. Beneath you, the ausar girl’s breath comes in short little gasps, her breasts rising and falling erratically as she tries to pick herself up from the table. <i>“D-damn, [pc.name]. You’re a fucking machine. Gods and spirits I’ll be sore for days after that reaming....”</i>");

	output("\n\nYou reach down and squeeze one of her delightfully squishy cheeks, promising ");
	if(pc.isNice()) output("you’ll take it easy on her");
	else if(pc.isMischievous()) output("that she’ll have to get used to it if she doesn’t get on your level");
	else output("that she’ll be walking bow-legged when you’re done with her");
	output(" next time.");

	output("\n\n<i>“Next time... it’s </i>your<i> ass, [pc.name],”</i> she growls, pulling your cock out - which only serves to unleash a flood of your pent-up seed that spills down between her cheeks and along the cleft of her swinging sack.");

	//If PC = Hard:
	if(pc.isAss()) output("\n\nYou grab your gear and stumble off, smirking, as Syri slinks away to the bathroom to clean up, leaking your cum behind her as she goes.");
	else output("\n\nYou give Syri an appreciative slap on the ass, making the sun-kissed skin of her taut bum jiggle, cum drooling obscenely from her violated hole as her muscles clench. You help the ausar-girl to her feet, legs shaking after your rectal reaming, and help her get to the bathroom to clean up before you collect your gear and stumble off.");
	processTime(30+rand(15));
	pc.orgasm();
	chars["SYRI"].loadInAss(pc);
	chars["SYRI"].orgasm();
	IncrementFlag("FUCKED_SYRI_COUNT");
	pc.exhibitionism(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Ride Her Cock
public function rideSyrisCockYouWinner():void {
	clearOutput();
	showSyri(true);
	author("Savin");
	output("If her tone was half an indicator, Syri wanted to bend you over the table there and fuck your ass raw. And to be honest, you wanted her cock up your ass, too. Otherwise, why the hell would you have bet yourself? You won, and it’s time to take your reward: a nice, knotty cock to spread your [pc.asshole] wide. You grab the ausar girl by the hips and push her back against the wall, cupping her breasts and drinking in her earthy musk. Syri gives a sharp gasp, but as soon as your lips wrap around one of her pert nipples, she gets the idea. Her legs hug your [pc.hips], and you feel a furry hand brushing ");
	if(pc.hasHair()) output("through your [pc.hair] ");
	else output("across your head ");
	output("as the ausar girl lets you get her ready in your own time, suckling on her big, soft breasts before trailing your hands down to her waist. You unzip her pants, eliciting a pleased sigh from the wolf-slut as her stiffening prick pops free, thick and red and succulent... and all yours.");

	output("\n\nYour fingers wrap around her prick, and a few rough strokes have Syri arching her back and moaning, a faint pool of white pre pooling in her crimson urethra. With a grunt, you turn the both of you around, pulling back from the wall and dumping Syri onto the nearest table, prick sticking straight up like a flag pole. You hike her legs over your shoulders and get to work on it, [pc.tongue] lapping up her veiny underside. She groans in sexual delight, legs wrapping around your neck to urge you on, nearly forcing her prick into your mouth. Instead, you turn it aside, letting it nuzzle against your cheek as you look up at the sexy ausar, tongue snaking out to gently caress her rod, leaving it nice and wet, shining in the dim light.");

	output("\n\n<i>“You’re skilled with your tongue, [pc.name], I’ll give you that,”</i> Syri pants, bare chest heaving as you ramp up your oral attentions, slathering her prick with licks and kisses. <i>“Oooh, that’s good. D-don’t forget the knot... it’s the best part...”</i>");

	output("\n\nYou give the ausar a quick swat on the thigh to remind her who’s in charge... but then, you’ve got to get that lubed up anyway. You move down, dragging your tongue from tip to taint, making sure to lavish her thickening knot with saliva, getting it positively coated. With every twitch of your tongue, Syri seems to gasp in quiet pleasure, breath catching as exploring hands brush her thighs and grope her upturned ass, fingers digging into the pliant cheeks before brushing her wagging tail.");

	output("\n\n<i>“If this is what I get for losing... I might not try so hard next time,”</i> Syri moans as your lips wrap around her cockhead, taking the first inch into your eager mouth. With a self-conscious hiss, she adds, <i>“J-just kidding. I’ll ream you good for this, [pc.name]. Especially if you don’t give head as good as you can lick.”</i>");

	output("\n\nAnother annoyed swat on the ass shuts her up again, letting you work in peace. You suckle on her prick, enjoying the few dollops of pre Syri gives you: she’s saltier than a human would be, and oh so much thicker... the musk is incredible, earthy and alive. Her cock tastes so good... so alien... so right. Before you know it your lips are caressing her thick knot, sucking on her swelling bulb like a candy as her prick discharges a thick, salty load right down your throat. Trying to grin around the cock in your mouth, you let your hand snake down the half-oblivious ausar’s backside, finger probing between her full cheeks for the entrance to her back door.");

	output("\n\nSyri stifles a gasp as your finger pushes through her tightly clenched sphincter, delving into her tight little anus, giving her a taste of what she’s about to get to do to you. With gentle swirls, you bring your finger deeper, basking in the feeling of her confused muscles trying to repulse you, sphincter clasping your knuckle like a perfect, fleshy ring. Finally, you find your goal: the tiny little bud of her prostate, just beyond the walls of her ass. One little touch has her cock spasming, a steady trickle of her inhumanly hot seed pouring down your throat as your finger starts to work her over, massaging her cum-maker until it’s on auto-pilot. Cum rushes through Syri’s engorged prick like a charm.");

	output("\n\nYou pull out of her, giving her a gentle pat on the ass as you start to ease off her cock, letting your tongue linger for a few long moments on her pointy, pre-stained tip before her prick pops out of your maw with a wet squelch. You can see Syri’s eyes are practically crossed with pleasure, her chest heaving - you’re sure to reach up and give her a quick grope, enjoying the full orbs of her big double-D tits for a few moments before you crawl up onto the table, straddling her");
	if(pc.legCount == 1) output(" as best as you can manage on your [pc.leg]");
	output(" with your bare ass hovering over her spit-and-cum-slick cock.");

	output("\n\nManaging a little smile, Syri plants her hands on your [pc.hips]: not forcing you down, no, she’s learned her lesson. Instead they simply rest on your hips, holding you gently as her thumb caresses your bare [pc.skin], surprisingly affectionate. Hell, why not... you lean down and plant a quick kiss on her lips, softly nibbling on her lower lip when she tries to return the gesture. Your hands move up, cupping her breasts, ready to use her for support as you start to lower yourself down. Her prick’s like a steel rod, perfectly erect and ready, slick with all the lubricant you’ve lavished over it. When the tip presses against your opening, it slides in almost effortlessly, passing your relaxed sphincter. A low groan escapes your clenched teeth as you slide down Syri’s slick fuckstick, all the way down until you can feel her swelling sphere pressing into your ass.");
	pc.buttChange(chars["SYRI"].cockVolume(0),true,true,false);

	output("\n\n<i>“N-not the knot,”</i> Syri whines. <i>“You don’t wanna be here for hours, do you?”</i>");

	output("\n\nYou tweak her nipple, telling her you’ll be here just as long as you want. Still, you relent, contenting yourself to rocking your [pc.hips], enjoying the feeling of Syri’s lengthy, veiny red cock spearing your ass like the buttslut in you deserves. You can feel her pulse right through her prick, the rhythmic twitch of her cock buried deep up your ass, the last inches tenderly fucking your hole with every motion.");

	output("\n\nWith a lusty groan, you start to bounce. The sensation of her cock dragging out of your hole is exquisite, every vein in her throbbing dick sliding through your [pc.asshole], drooling thick streams of pre in its wake. Syri moans, hands gripping your [pc.hips], teeth clenched as you pull up until her cock’s barely inside you, the tip just past your sphincter, before you slowly slide back down, your bowels eagerly welcoming her lengthy member back. The second bounce is faster; you’re practically slamming back down on her with the third. You ride her cock like a bitch in heat, crying and screaming as your ass takes Syri’s cock again and again, impaling yourself on her knotty prick until creamy streams of her salty pre are rolling out of your ass and back down her cock. Syri throws her head back and screams as you grab her tits, kneading the soft orbs between your fingers with every bounce.");

	output("\n\n<i>“Fuck me, fuck me, fuck me,”</i> she groans, almost insensate by the time her back arches, cock spasming as you feel a burning hot load blast into your bowels. You yank her up, pulling the lusty wolf-bitch into a kiss as another salty burst smears your anal walls, nearly throwing you over the edge of pleasure. She groans in your arms, body writhing as she cums for you.");
	//if PC has tits:
	output("\n\n");
	if(pc.biggestTitSize() >= 1) output("Your tits press into hers, mashing your [pc.chest] into her hefty orbs, nipples flicking across each other until the ausar slut takes your [pc.nipple] into her mouth, her hands grabbing your [pc.butt]. ");
	output("With one final bounce, you nearly take her swelling knot; you feel the huge orb nearly tearing you apart, stretching you even wider as your ass is painted white by another creamy load, shot deep inside by the throbbing puppy pecker buried in you.");

	output("\n\nAn explosion of ecstasy rocks your body, a thousand nerves responding to the wonderful, musky load being fucked into your ass as Syri’s knot nearly lodges itself in you - only to be pulled out at the very last moment, nearly sending you over again as a flood of cum drains out your [pc.asshole]. With a heavy, sated sigh, you roll off her, [pc.chest] heaving as you revel in the sensation of hot alien seed pouring out of your abused hole. A moment later, Syri flips onto you, straddling your [pc.hips], cock still bubbling the last trickles of her orgasm. She leans in, feinting to catch you off guard before planting a kiss right on your lips.");

	output("\n\n<i>“That was... wow, [pc.name]. You’d better come back for another game, you hear me?”</i>");

	output("\n\nSyri slips away, grabbing her shirt from the floor before turning back to you with a predatory grin. <i>“And next time... I’m on top.”</i>");
	processTime(30+rand(15));
	IncrementFlag("FUCKED_SYRI_COUNT");
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
	showSyri();
	author("Savin");
	output("Nearly an hour passes in the game. The graphics are photo-realistic, the controls tight and precise. Every movement you make is perfectly mirrored in the game. The map is huge, and your character is slow. It’s a maze, and soon you realize it’s less skill in battle, here, than skill at the hunt. Just finding Syri in the ruined city the game has you in is challenging, and every time you think you’ve got her, she darts away. Finally you slay her, pulling a bullet between her avatar’s eyes. The audience cheers, and more and more people gather as they realize you’ve got skill.");

	output("\n\nA moment later, though, your screen blacks out as a grenade blasts near you. The holo-harness buzzes, giving you a nasty jolt that leaves your teeth chattering. Respawn. You move stealthily, creeping across the ruins at a snail’s pace. Shots are exchanged; you both retreat, licking your virtual wounds. You creep forward, cautiously taking the long road around the map, moving at a snail’s pace. Tensions run high; the audience is at the edge of their seats. You think you catch sight of your opponent, moving away from you. You slip into a building, move to higher ground. Looking down the rifle’s scope, you scan the rubble, looking for even the slightest movement.");

	output("\n\nThen you see her: crouched behind a burned out hover car, waiting in ambush for you. You grin as you calmly take aim, putting your crosshair right over the virtual ausar’s avatar before pulling the trigger. Syri yelps as her rig zaps her in time with the bullet blasting her character’s head off. Spitting curses, the ausar throws her rig off, demanding to know where you were and what hacks you were using. But despite her grousing, a few moments later your codex makes a happy chirp, announcing that " + num2Text(flags["SYRI_BETTING_STORAGE"]) + " credits have been added to your account.");

	output("\n\n<i>“Not bad, [pc.name],”</i> she says, offering you a hand. <i>“But watch your ass: I’ll fuck up your shit next time around.”</i>");
	pc.credits += flags["SYRI_BETTING_STORAGE"];
	processTime(10+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//PC Loses the Shoot, Betting for Creds
public function pcLosesToSyriCredBetting():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("Nearly an hour passes in the game. The graphics are photo-realistic, the controls tight and precise. Every movement you make is perfectly mirrored in the game. The map is huge, and your character is slow. It’s a maze, and soon you realize it’s less skill in battle, here, than skill at the hunt. Just finding Syri in the ruined city the game has you in is challenging, and every time you think you’ve got her, she darts away. Finally you slay her, pulling a bullet between her avatar’s eyes. The audience cheers, and more and more people gather as they realize you’ve got skill.");

	output("\n\nA moment later, though, your screen blacks out as a grenade blasts near you. The holo-harness buzzes, giving you a nasty jolt that leaves your teeth chattering. Respawn. You move stealthily, creeping across the ruins at a snail’s pace. Shots are exchanged; you both retreat, licking your virtual wounds. You creep forward, searching the rubble for a target: it’s a silent ghost town, with no life in sight. You move forward, steadily checking every corner, taking cover when you think you might be vulnerable.");

	output("\n\nHowever, you never had a chance to see her. From behind, you hear the loud whine of a laser rifle, and suddenly the rig is zapping you, your avatar exploding in a hail of gore. You throw the holographic gear off as Syri’s character rushes your corpse, giving it a thorough tea-bagging before she sets her own gear aside.");

	output("\n\n<i>“Not bad, [pc.name], but you’ve gotta learn to watch your ass,”</i> she grins, her tail flicking around to brush your [pc.hips]. <i>“But not bad all the same. Little practice and you’ll be ready for the big leagues.”</i>");

	output("\n\nYou sigh and tap a button on your codex, transferring " + num2Text(flags["SYRI_BETTING_STORAGE"]) + " credits to the triumphant ausar. She shoots you a wink and saunters off for a drink, leaving you to contemplate your strategy for next time.");
	pc.credits -= flags["SYRI_BETTING_STORAGE"];
	processTime(20+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//PC Loses the Shoot, Betting for Sex
public function pcLosesToSyriBettingHisAss():void {
	clearOutput();
	showSyri(true);
	author("Savin");
	
	var x:int = -1;
	if(pc.hasCock()) x = pc.biggestCockIndex();
	
	output("Nearly an hour passes in the game. The graphics are photo-realistic, the controls tight and precise. Every movement you make is perfectly mirrored in the game. The map is huge, and your character is slow. It’s a maze, and soon you realize it’s less skill in battle, here, than skill at the hunt. Just finding Syri in the ruined city the game has you in is challenging, and every time you think you’ve got her, she darts away. Finally you slay her, pulling a bullet between her avatar’s eyes. The audience cheers, and more and more people gather as they realize you’ve got skill.");

	output("\n\nA moment later, though, your screen blacks out as a grenade blasts near you. The holo-harness buzzes, giving you a nasty jolt that leaves your teeth chattering. Respawn. You move stealthily, creeping across the ruins at a snail’s pace. Shots are exchanged; you both retreat, licking your virtual wounds. You creep forward, searching the rubble for a target: it’s a silent ghost town, with no life in sight. You move forward, steadily checking every corner, taking cover when you think you might be vulnerable.");

	output("\n\nHowever, you never had a chance to see her. From behind, you hear the loud whine of a laser rifle, and suddenly the rig is zapping you, your avatar exploding in a hail of gore. You throw the holographic gear off as Syri’s character rushes your corpse, giving it a thorough tea-bagging as the player herself tears off her holo-bracers, a predatory grin on her lips.");

	output("\n\nBefore you can even look away, the ausar woman’s on you like a animal, spinning you around and pinning you down on the table, hands held behind your back. You yelp out in surprise, nearly drowned out by the jeering of some of the nearby dive dwellers. <i>“Silly little bitch, thought " + pc.mf("he","she") + " could actually outshoot me. Well, a deal’s a deal, meat,”</i> Syri chuckles");
	if(!pc.isNude()) {
		output(", roughly tearing off your [pc.gear] to expose your [pc.butt].");
		if(pc.hasCock()) output(" [pc.EachCock] pops free in the process, flopping helplessly against the edge of the game table as your clothes are torn off. It throbs with your quickening heartbeat as the alien undresses you, hardening slightly as you hear her own trousers drop.");
		else output(" Your heartbeat quickens as you hear Syri’s trousers drop.")
	}
	else {
		output(", roughly grabbing hold of your completely exposed form.");
		if(pc.hasCock()) output(" [pc.EachCock] flops helplessly against the edge of the game tables as you’re handled. It throbs with your quickening heartbeat, hardening slightly as you hear Syri’s trousers drop.");
		else output(" Your heartbeat quickens as you hear Syri’s trousers drop.")
	}
	output(" Syri’s pants hug her ankles as the alien girl pushes you down hard and gropes your [pc.butt], clawed fingers scouring the sensitive flesh. You wince as she digs her fingers into you, squirming under her domineering assault.");

	output("\n\n<i>“Stop moving, dammit,”</i> she snaps, giving you a hard smack on the ass. You yelp, feeling your anxious pucker clenching");
	if(pc.hasCock()) output(" and [pc.cocks] throbbing");
	output(" as the alien dickgirl spits into her hand, slathering a little bit of much-needed lube onto her own cock. You feel a hand spreading your cheeks, and brace yourself for the coming reaming - only to feel a gentle caress. You look over your shoulder, seeing Syri on her knees behind you, cheek rubbing on your taut flesh. <i>“What?”</i> she snaps, giving you a sudden swat that sends shivers up your spine and quivers through your [pc.skin]. <i>“I’m an ass girl like you wouldn’t believe.");
	if(pc.isHuman()) output(" Humans have the best butts in the whole wide galaxy. So soft and squishy and gropable, I could fuck ‘em for days and days.");
	output(" And you... have a magnificient ass. Oh, I’m going to enjoy this");
	if(pc.ass.looseness() >= 4) output(", though not as much as you, if you’re half the buttslut this gaping maw of a hole makes you look like");
	output(".”</i>");

	output("\n\nChuckling to herself, Syri lets her long, rounded tongue drag through the cleft of your behind");
	if(pc.hasCock()) output(", stopping at the top to reverse course, slipping down and down your ass until she reaches the [pc.sheath " + x + "] of your [pc.cock " + x + "]. Your ignored member jumps to life as Syri’s tongue laps at the hilt of your prick, bringing you to full mast in a matter of moments. <i>“Poor little guy, looks so lonely down here. He needs a nice, tight little ass to fill, huh? Maybe if you step up your game, you’ll get to fuck mine,”</i> she says, planting a kiss on your head");
	output(". She steps back, standing and grabbing her prick and stroking it fiercely. She grunts with effort, vigorously jerking herself off as one of her hands caresses your [pc.asshole], thumb pushing and probing at your tightly clenched hole.");

	output("\n\n<i>“What’s that adorable rhyme you humans have? Little fig, little fig, let me in,”</i> she coos, <i>“or I’ll woof and I’ll woof and I’ll fuck your ass in.”</i>");

	output("\n\nYou grimace, but relax as much as possible, letting her probing thumb in. Syri sighs happily, still vigorously stroking off as her thumb plays around in your kiester, getting you nice and ready for the real fun. When she finally pulls out, you’re left feeling strange and empty, though not for long. Syri moves in, grabbing your [pc.hips] and slipping her cock into your crack, letting you feel all eight inches of red puppy pecker, from pointy tip to the thickening knot at her base. You dread the moment when that monster comes, but you can’t help but wiggle your [pc.hips] as Syri starts to move hers, thrusting into your moistened crack. A wet squelching sound taints the air as the ausar girl humps your behind with short, eager movements that soon have a big, swelling <i>something</i> pushing your cheeks apart.");

	output("\n\nLeaning down right next to your ear, Syri breathes, <i>“You know, an Ausar knot can stay filled for hours. Your earth dogs have nothing on us, [pc.name].”</i> She leaves you with a wet, affectionate lick across the cheek as she straightens and leans back, gripping her giant bitch-breaking boner and lining up with your puckered hole. You brace yourself as the pointed tip presses against your [pc.asshole], barely putting any pressure on your ass at all before she leans back, grabs your flanks, and rams it home. Your mouth gapes in a wordless, silent scream, your voice failing as inch after inch of throbbing alien cock slams into your ass, stretching you apart. Your fingers dig into the tables, leaving long marks as your anal passage becomes Syri’s personal cocksleeve, wrapping around the girthy girl-boner until her thickening knot presses against you, utterly hilted.");

	//If PC is uber-tight:
	if(pc.ass.looseness() < 2) output("\n\n<i>“O-oh shit you’re tight... what were you doing, betting this little pucker, huh? Trying to suffocate my cock or something?”</i>");
	// if mid-tight: 
	else if(pc.ass.looseness() < 4) output("\n\n<i>“OH, yeah, that’s right. Take every inch, little bitch,”</i> the ausar girl pants, reaching up to stroke your [pc.hair].");
	// if supah-loose: 
	else {
		output("\n\n<i>“Hoooly shit, [pc.name], what do you shove up here - people? God damn, I’m </i>hung<i> and there’s enough room back here for two of me.”</i> She swats your behind, trying to get you to tighten up for her. Her attention, though, goes to some of the bystanders to your sexual submission: <i>“Hey, that wasn’t an invitation. This time. Avert your eyes.”</i> More quietly, just for you, she adds: <i>“You’re loose enough for a few guests, huh? Maybe next time we’ll wager you between all the regulars. That might just fill this [pc.asshole] of yours up, huh?”</i>");
	}
	pc.buttChange(chars["SYRI"].cockVolume(0),true,true,false);

	output("\n\nYou groan, entire body shuddering around the thick prick spearing it. Syri keeps still inside you, her veiny cock pulsing and throbbing in your clenched anal tunnel, letting you slowly adjust to its presence before she moves. Involuntarily, your body shivers as you feel a thick, steaming hot plop of canine pre drip into your ass, much hotter than any human seed. You groan as the ausar girl gently rocks her hips, dragging the smear down your rectal walls until just her tip is spearing you, holding your hole open as she adjusts her grip on your [pc.hips] and slides back in. She pauses at each zenith of movement, fucking you with agonizing slowness.");
	if(pc.hasCock()) output(" [pc.EachCock] twitches against the table’s side each time her thick tip rolls across your prostate, and soon you’re dribbling a steady stream of [pc.CumColor], staining the faux wood and dripping onto the floor. Pretty soon, you’ve left a nice little lake between Syri’s furry legs.");
	if(pc.hasVagina()) 
	{
		output(" As the ausar’s nails dig into your hips, [pc.oneVagina] clenches around nothing but air, begging for a cock to suckle and drain, for some way to coax a little bit of pleasure for itself out of this anal reaming. Grinning down at you, Syri’s hand drifts from your behind down");
		if(pc.legCount > 1) output(" between");
		output(" your [pc.legOrLegs], a pair of fingers dipping into your [pc.vaginas]. <i>“I’m nothing if not a very... giving lover,”</i> she chuckles as her hot knot presses against your [pc.asshole].");
	}

	output("\n\nAgain and again the ausar’s hips slap loudly into your [pc.butt], the sound of flesh on flesh echoing as your dog-cocked dominator picks up the pace, hammering your ass with increasing vigor. Soon, her long tongue lolls listlessly from her agape mouth. Syri’s panting with pleasure as she spears you over and over on her long knotty rod. You can feel a lake of her hot, salty pre bubbling in your hole, thick streams of it leaking out around her pounding prick to stain your thighs. Suddenly, a huge geyser of the thick alien cream seems to erupt into you; you cry out as Syri picks up to a furious pace, moaning with abandon as her prick spasms into you, flooding you with what feels like an endless tide of her cum. The boiling batter comes and comes, every thrust dumping more of her hot seed into your bowels until you feel bloated, stomach churning with the oncoming flood of ausar-cum.");

	output("\n\nMinutes pass, leaving you heaving and groaning and pinned to the table as Syri collapses atop you, breasts pressing hard into your back. Her cock twitches in your rectum, little trickles of her cooling seed dribbling out around her engorged knot, just outside your worn hole. <i>“How’s it feel to be mounted and bred, " + pc.raceCute(true, true) + "?”</i> she chuckles, her tone surprisingly affectionate. <i>“Don’t pretend you didn’t enjoy being my little bitch for the night, [pc.name]. A perfect ass like this...”</i> she gropes your cheek, kneading it between downy fingers, <i>“...can’t possibly lie.”</i>");

	output("\n\nYour only reply is a low moan as she gently rocks her hips back, pulling her spent prick from your ass. <i>“Just be glad I didn’t give you the knot, or we’d be here for hours. Of course, if that’s what you really want, little bitch, I’m sure that can be arranged. ");
	//If first time:
	if(flags["TIMES_BUTTFUCKED_BY_SYRI"] == undefined) output(" We’d need somewhere more private for you to get a real taste of ausar cock, though. But then, you’ve got a ship, hmm?");
	output("”</i>");

	output("\n\nSyri chuckles as she pulls out, leaving your hole feeling empty and well-stretched; your stomach gurgles plaintively, churning as her thick cum drools throughout your bowels. Plenty of it leaks out your [pc.asshole], dripping onto the dusty floor. She steps back and pulls up her pants, giving you a playful swat on the [pc.butt] as she saunters away to the bar, high-fiving some of the other regulars who just watched you get thoroughly plowed. Red-faced and leaking, you gather your gear and stumble to the restroom to get cleaned up.");
	IncrementFlag("TIMES_BUTTFUCKED_BY_SYRI");
	IncrementFlag("FUCKED_SYRI_COUNT");
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
	showSyri();
	author("Savin");
	//[Syri] (First Time)
	if(flags["SEEN_SYRI_IN_THE_MORNING"] == undefined) {
		flags["SEEN_SYRI_IN_THE_MORNING"] = 0;
		output("You walk over to the lusty ausar gamer and grab a seat, peering over the top of her data slate. <i>“Hey. What’cha got there?”</i>");
		output("\n\nSyri grins up at you, <i>“Reading. New Graeme Black book. Some shitty ausar translation. I love humans to pieces but fuck your language and call it Sally.”</i> You cock an eyebrow at the alien woman and her human literature. <i>“What? I can’t just sit around and play videogames </i>all<i> the time, Steele.”</i>");
		output("\n\nYou chuckle and call for a drink - nothing too stout this early. Burt gives you a little nod and passes something pale your way. It tastes foul, but what doesn’t on a backwater?");
		output("\n\n<i>“So,”</i> Syri says, putting aside her book, <i>“what’s up, " + pc.mf("handsome","cutie") + "?”</i>");
	}
	//[Syri] (Repeat)
	else {
		output("You slip into your seat beside the lusty ausar. She grins and sets her book aside, giving you a quick peck on the cheek before reclining, tail wagging gaily. <i>“What’s up, " + pc.mf("handsome","cutie") + "?”</i>");
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
	//On Uveto? Go back to Syri's Uveto menu instead.
	if(currentLocation == "UVI R32" && syriAtFreeezer()) 
	{
		syriFreezerMenu();
		return;
	}
	clearMenu();
	addButton(0,"Talk",talkToSyriRouter);
	if(syriIsAFuckbuddy()) {
		if(pc.lust() >= 33) addButton(1,"Sex",syriSexMenu);
		else addDisabledButton(1,"Sex");
		//[Kiss Her]
		//Morning interactions w/ Syri, must be fuckbuddies
		addButton(4,"Kiss Her",morningInteractionsWithSyriKissHer);
	}
	addButton(2,"Appearance",syriAppearance);
	if(flags["UNLOCK_SYRI_ANNO_TALK"] != undefined) addButton(3,"Anno",syriTalksAboutAnno);

	addButton(14,"Leave",leaveMorningSyri);
}

//[Leave]
public function leaveMorningSyri():void {
	clearOutput();
	showSyri();
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
	showSyri();
	author("Savin");
	output("<i>“Hey,”</i> Syri says, crossing one leg over the other - just enough to hide the not-insignificant bulge in her pants. <i>“Sorry if I’m a little rough on you at game time. I get pretty into it, you know? Especially when I’ve got a nice piece of ass on the line.");
	//If PC usually wins:
	var timesWin:int = 0;
	var timesLoss:int = 0;
	if(flags["TIMES_WON_AGAINST_SYRI"] != undefined) timesWin += flags["TIMES_WON_AGAINST_SYRI"];
	if(flags["TIMES_LOST_TO_SYRI"] != undefined) timesLoss += flags["TIMES_LOST_TO_SYRI"];
	if(timesWin > timesLoss) output(" Not that I really mind losing to you, either. I’m a top, but being on bottom can be good, too. You sure make it fun.");
	output("”</i>");
	output("\n\nShe gives you a little smile - a surprisingly shy one - and takes a sip of her drink. <i>“Hey, if you ever want to get out of here... have a little fun, I mean...”</i> she fidgets nervously, <i>“You can always swing by and pick me up in the mornings. No fight for dominance shit, just two friends and a bed. W-we’re friends, right? We haven’t known each other very long, I mean, but once you stick a cock up someone’s ass... sorry. I’m probably making an ass of </i>myself<i>, but hey, I’m lonely and I like you.”</i>");

	output("\n\nSyri gives you a wan smile at that, looking pointedly away and at her plate. <i>“You’re the only other gamer in this dump who can give me a run for my money, and you’re pretty great in the sack... on the table... whatever. Hey, even if you just wanna flop down on the couch and play some vidya for funsies, I’m game for anything. Doesn’t have to be just sex all the time.”</i>");

	output("\n\nLooks like Syri wants to spend more time with you. You could shoot her down, of course - not everyone’s into having a horny wolf-girl with a dick hanging around. Then again, she’s a good lay and pretty good with a holo-controller. Could be fun to hang out with.");
	processTime(2);
	clearMenu();
	addButton(1,"Shoot Down",shootSyriDown);
	addButton(0,"Sure",sureBeFuckFriendsWithSyri);
}

//Shoot her Down
public function shootSyriDown():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Sorry,”</i> you say, withdrawing, <i>“Not interested.”</i>");

	output("\n\nSyri’s shoulders slump, but she nods her understanding. <i>“Roger that. No hard feelings; I’m used to it.”</i>");

	output("\n\nShe sighs and turns back to her book, leaving you to walk away in silence.");
	//Syri can be approached again at the bar in the AM, re-triggering the conversation until the PC decides having her around is just peachy keen
	flags["SYRI_TALKS"] = undefined;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sure, why not?
public function sureBeFuckFriendsWithSyri():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“Really? Awesome!”</i> Syri says, jumping up and grabbing you in a big bear hug. <i>“We’re gonna have a blast, you and I. Friends to the end!”</i>");
	output("\n\n<i>“Hey, you’re the captain of a ship, right? I saw you dock a while ago. That’s hot stuff. You should give me a tour sometime... </i>Captain<i> Steele. I haven’t been on a spaceship in ages, and I’d love to see your... captain’s quarters,”</i> she says, giving you a wink as her hand brushes playfully across your thigh.");

	output("\n\nYou nod, telling her you may do just that.");
	//Return to Syri's root menu
	clearMenu();
	addButton(0,"Next",approachSyriIntheMorning);
}

//Talk 2
public function talkToSyriNumber2():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("Talking with Syri for a few minutes, the topic eventually drifts towards her past. You can’t help but ask, then, where’d the dick come from?");

	output("\n\n<i>“Oh, this little thing?”</i> Syri laughs, uncrossing her legs in a very unladylike manner. <i>“Sorry, sorry. What, don’t think my parents just had a dickgirl fetish and popped me out with it?... I think there’s a law against that, actually. But no, yeah, you got a big throbbing puppy pecker on your mind, Steele? Better question is, where’d my girly bits go? I’ll, uh, let you know when they show up again. till then I’m just holding on to this prick for safe-keeping until Valden gets back.”</i>");

	output("\n\n<i>“What.”</i>");

	output("\n\n<i>“That was, uh, probably the strangest thing I could possibly say without context, huh?”</i> Syri laughs, grabbing a drink from the bar. <i>“So picture this: ausar invented the warp gates, right? My great great something great grandfather was part of the project. Science runs big in the Dorna family, see, and my sister gets this hare-brained idea to miniaturize the gates. She works for one of the Ausaril Star-Kings, part of the Akkadi R&D group, which is super-prestigious in case you don’t keep up with tech news, so she’s got the budget for it. So why not? Instant teleportation, just add warp beacon.”</i>");

	output("\n\n<i>“And I was stupid enough to sign up to test the prototype. Long story short, my commanding officer, Lieutenant Commander Valden and I go through the gate. I pop out the other side with a cock, and Valden vanishes with my cunt. Now I’m on medical leave until Valden pops out of some dimensional asshole and I get my dangly bits sorted out. Fuck me for volunteering, right?”</i>");

	output("\n\n<i>“Ouch. So why not get a new one?”</i>");

	output("\n\n<i>“New vag? Meh. I kinda dig the D, to be honest. Peeing standing up is great, and it’s not like I ever wanted to be a mother anyway. Plus, not doing the whole heat thing every year is, uh, a plus. That could just be Valden talking, though. There’s like a... 22 percent?... chance he’s in here with me somewhere.”</i> She laughs, rapping a knuckle on her head.");

	output("\n\n<i>“Only thing I really regret is the discharge. I coulda had my own ship in a couple years. Captain Syri Dorna, </i>A.F.S. Somethingorother<i>,”</i> she chuckles, taking another drink. <i>“Anyway, that’s pretty much the whole story. At least as much as I can say without violating an NDA. And probably getting shot by some navy spook in a dark alley.”</i>");

	processTime(5+rand(5));
	clearMenu();
	addButton(0,"Next",approachSyriIntheMorning);
}

//Talk 3
public function syriTalkThree():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("<i>“What’re you reading?”</i> you ask, nodding toward Syri’s data slate.");

	output("\n\nThe ausar shrugs, <i>“Some shitty fantasy book. They’re practically giving ‘em away on Congo. But they’re all just so... hackneyed. Village boy hero loses everything, slays dragon slash evil wizard, acquires princess. Lather rinse repeat. Blech. This one,”</i> she pokes her slate, <i>“is literally ‘I am a farmer. I will now slay a dragon, which carried off a princess.’ No, really. That’s the plot, hand to god. I need to go back to reading Sci-Fi or something...”</i>");

	output("\n\nYou chuckle at that, mentioning that you’re all practically living Science Fiction. Or at least, the sci-fi of yesteryear.");

	output("\n\n<i>“Yeah, that’s why I stopped reading it. Every time someone would put out a new idea, it was reality a couple years later. Takes the imagination out of everything when I figure, ‘hey, my sister could make that.’ I can just imagine what the guy who wrote </i>Dark Space Revelation<i> thought when the warp gates opened. Those were the books that inspired them, and the first gates were built in the author’s lifetime. There’s a statue of him in the square of Capital Bay back home.”</i>");

	output("\n\nYou ask Syri to tell you a little bit about the gates - her race’s crowning achievement. She shrugs lightly sipping at her drink. <i>“Hey, I’m not exactly an expert: you want to know the deep quantum physics shit, talk to my sister. She’s a genius about warp gates and wormholes and stuff. I’m just a dumb grunt. But hey, thank all the gods for the gates. Without them, I’d never have met you,”</i> she grins, giving you an affectionate wink.");
	flags["SYRI_FANTASY_TALKED"] = 1;

	output("\n\n<i>“But back to reading... so, what’re you into these days, Steele? Any good reads lately?”</i>");
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
	showSyri();
	author("Savin");
	output("You answer that most of what you’ve been reading is good old Science Fiction. Spaceships and time travel and wormholes galore. Syri nods attentively as you list off a few good books and authors, comparing their styles and subjects. She laughs as you relate the tropes and idiosyncrasies of the stories you’ve read lately, and how far-fetched or dead wrong some of the older books are.");
	syriBookTalkEpilogue();
}

//Fantasy
public function tellSyriYouReadFantasy():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("It’s swords and sorcery, elves and dwarves and dragons for you. That catches Syri’s interest, and in moments you’re deep into conversation, exchanging favorite authors and comparing your latest reads. When you bump into something you’ve both read, you’re soon laughing and joking about the stories, picking out favorite characters and more heart-wrenching or laughable moments, and Syri’s trying to convince you to start playing RPGs...");
	syriBookTalkEpilogue();
}
//Romance
public function tellSyriYouReadRomance():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("You mention you’ve been reading a lot of romances, and that promptly gets you a good few teases from the ausar girl as you try to relate the deep characters and heart-warming plots you’ve gotten off to lately. She laughs it off, saying that romances are just porn for girls... but then adds that she might have maybe read a few in her time, and once the dam is broken, you’re both soon giggling about your favorite series.");
	syriBookTalkEpilogue();
}

//Mystery
public function tellSyriYouReadMystery():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("You tell Syri that you’re all about the mystery novels: murders and gothic castles and hard-boiled detectives. She perks an ear, adding that she’s seen some old detective movies, but that kind of book never got popular on her world. Soon, you’re telling her all about the genre, sharing your favorite authors and the best of the best books. She grabs her slate and starts scrolling as you talk, grabbing titles at your suggestion for later perusal.");
	syriBookTalkEpilogue();
}
//Books? Pfft.
public function tellSyriYoureIlliterate():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("You shrug and mention that you really haven’t read anything at all lately. Syri makes a mock gasp of horror at the notion, and");
	if(!MailManager.isEntryUnlocked("syribooks"))
	{
		output(" grabs her data slate. <i>“Well, we’ll just have to rectify that, Captain Steele. Now, let’s start you off with some new Rondell Ramus books... and maybe a little Capser van Beck. Oh, and Imono Flaest’s new one - it’s a bestseller already, and it just came out today. Fifty billion copies by the time I woke up.”</i>");
		output("\n\n<i>“Here we go...”</i> she grins, tapping her screen. A moment later your codex announces that you have mail.");
		goMailGet("syribooks");
	}
	else output(" looks at you a bit beratingly. <i>“Even after I sent you that giant list? Don’t tell me you just wanted to listen to me talk about books... Here, let’s read some of these...”</i> She grabs her slate and scrolls through some short story titles, making suggestions for you to check out later.");
	
	syriBookTalkEpilogue();
}

//(Recombine)
public function syriBookTalkEpilogue():void {
	output("\n\nWith dozens of good books exchanged, you feel practically enlightened and ready to expand your mind when you get the chance to crack open a good book.");
	//[Tiny INT increase?]
	pc.slowStatGain("intelligence",1);
	clearMenu();
	if (syriQuestComplete()) addButton(0,"Next",syriFreezerMenu);
	else addButton(0,"Next",approachSyriIntheMorning);
}

//Talk 4
public function talkToSyriNumber4():void {
	clearOutput();
	showSyri();
	author("Savin");
	output("Thinking back to previous conversations, you ask Syri exactly what she does for a living. She’s on medical discharge, so does she get a pension or something?");

	output("\n\n<i>“Oh, what’s this? Do I have a petty little gold digger on my hands?”</i> Syri teases, giving you a conspiratorial wink. <i>“Here to sweep me off my feet and get ol’ Syri to take care of you forever after? Heh. I can just imagine the money you’ve got coming to you without my help, " + pc.mf("Mister","Miss") + " Steele. What, don’t act surprised, I know who you are. My sister - the hare-brained transporter chick? - she works for your damn company. Must be nice to be loaded like that!”</i>");

	output("\n\n<i>“I, uh, haven’t exactly gotten my hands on my inheritance yet,”</i> you admit, taking a few minutes to explain the quest that’s sent you out into the void... and reminding Syri she hasn’t answered your question.");

	output("\n\n<i>“Oh, fine. Nosey little shit, aren’t you? Yeah, the Joint Ausar Fleet pays me a little stipend to keep me from starving, but it doesn’t buy shit on the homeworld. That’s half of why I’m out here in the boonies, where everything’s barter or on the cheap. And hey, there’s actually work for someone like me out here.”</i>");

	output("\n\nSomeone like her?");

	output("\n\n<i>“Not a ‘hot babe with a cock and a smart mouth’ if that’s what you’re thinking.... Hey, come on, seriously. I have a degree, honest!”</i> Syri sighs and grabs her drink, knocking about half of it back in one swill. <i>“I’m not </i>just<i> a pretty face, Steele. They bus engineers out here to the fringes by the boatload to get roads and housing set up, maybe power and sewage. It’s not glamorous, but it pays the bills, you know? Ex-combat engineers like me are in especially high demand, since we can handle a gun and keep calm under pressure.”</i>");

	output("\n\n<i>“Combat engineer?”</i> you ask, cocking an eyebrow.");

	output("\n\n<i>“Yep! 30th J.A.F. Royal Engineers. Put in eight years, right out of high school till the transporter snafu. Don’t go thinking I’m some kinda badass commando or anything, though. Mostly had us building bridges or, if we were </i>really<i> lucky, blowing them up. Bridges and roads and shit fucking everywhere, man. But hey, I got to see the galaxy, from Terra and the Core Worlds to the Rendau Cluster and the Elyssian Expanse. And I built a bridge on all of ‘em, let me tell you,”</i> she sighs, finishing her whiskey.");

	output("\n\n<i>“So, ever see combat?”</i> you ask.");

	output("\n\n<i>“Twice,”</i> she says, somewhat hesitantly. <i>“A rebel ambush on Rendau Nine. Kind of a skirmish, really. Scary as hell, but it wasn’t big. Nobody died on either side, just took some pot shots at each other till the marines showed up. The second time... I, uh, went in with the first wave on Khaleen.”</i>");

	output("\n\nYou remember hearing about that back in school. A big joint operation between a bunch of Confederate armies that smashed a rogue planet’s entire civilization to bits. It was big news at the time, and got a lot of people angry. From the far-away look the ausar’s adopted, it doesn’t look like she’s in the mood to talk about it. Maybe later.");
	processTime(6);
	clearMenu();
	addButton(0,"Next",approachSyriIntheMorning);
}

//[Sex] 
public function syriSexMenu(outputs:Boolean = true):void {
	moveTo("SHIP INTERIOR");
	if(outputs) {
		clearOutput();
		showSyri(true);
		author("Savin");
		if (syriAtBurts()) {
			//(First Time Variant) 
			if(flags["SYRI_SEEN_PCS_SHIP_CABIN"] == undefined) {
				flags["SYRI_SEEN_PCS_SHIP_CABIN"] = 1;
				output("Looking around at the mostly empty bar and then at the pretty ausar girl staring up at you, you ask if she’d like to get out of here.");

				output("\n\n<i>“Ooh, I thought you’d never ask, " + pc.mf("handsome","beautiful") + ",”</i> Syri says with a wink and a grin, gathering up her scattered belongings. <i>“My place is kind of a wreck, so... let’s head back to that ship of yours. You still owe me a tour of your ship after all, Captain...”</i>");

				output("\n\nSyri hooks her arm through yours, drawing close to you as you lead the way from Burt’s bar to the docks. Soon you’re walking in the shadow of your docked ship, heading up toward the elevator. Flahne, the rahn secretary, gives you a little wave - and a knowing wink - as you pass, and then you’re in the elevator. The doors have barely closed before the lusty ausar grabs your arms, pulling you into a sudden kiss, her lips sucking on yours, tongue demanding entrance before you can recover. With a primal groan, Syri shoves you up against the wall, starting to pull your gear off as a furry leg hooks around your hip, locking her chest tight to yours. She moves in rhythmic undulations, grinding her crotch against yours");
				if(pc.hasCock()) output(", your [pc.cocks] stiffening as her knotty prick brushes up against you.");
				else output(", and you can feel her knotty cock hardening through her pants, a tantalizing taste of what’s to come."); 

				output("\n\nShe breaks the kiss as the elevator locks into place at the top, just outside your airlock. Breathlessly, she whispers, <i>“How about a tour of the captain’s cabin first...”</i>");

				output("\n\nYou give her the abridged version of the tour: the one where you’re running through the access corridors, teasing, kissing and caressing as clothes and gear tumble to the floor, leaving a trail of armaments and underwear leading right up to your cabin door. You seal it behind you, and a moment later you’re on your back, Syri straddling you, bare-breasted and panting right in your ear as her cock presses into your thigh, tip slick with her excitement. <i>“Nice digs. Now, how do you want me, captain?”</i>");
			}
			//Sex (Repeat Intro)
			else {
				output("You flash the sexy ausar a grin and ask if she’d care to go back to your place for a little fun. She feigns mulling it over but the rising tent in her pants betrays her, and soon Syri’s gathered her bag and has her arm hook around your waist, letting you lead on toward the docks.");
				output("\n\nFlahne, the rahn secretary, gives you a little wave as you pass by her office - along with a knowing wink - and then you’re in the elevator. The doors have barely closed before the lusty slut grabs your arms, pulling you into a sudden kiss, her lips sucking on yours, tongue demanding entrance before you can recover. With a primal groan, Syri shoves you up against the wall, starting to pull your gear off as a furry leg hooks around your hip, locking her chest tight to yours. She moves in rhythmic undulations, grinding her crotch against yours");
				if(pc.hasCock()) output(", your [pc.cocks] stiffening as her knotty prick brushes up against you.");
				else output(", and you can feel her knotty cock hardening through her pants, a tantalizing taste of what’s to come."); 

				output("\n\nAs soon as you pass the airlock, clothes start flying. ");
				if(pc.mf("man","") == "man") output("Syri leaps into your arms, legs wrapped around your waist and bare breasts pressed into your face, letting you stumble towards your cabin as she lavishes you in gropes and kisses.");
				else output("Syri sweeps you up off your [pc.feet], pulling you into a fierce kiss as she stumbles toward your quarters, shedding clothes and gear behind you as her prick presses into your belly, growing steadily until her pants are gone, letting the rigid red rod prod your thigh.");
				output(" Your door slides open, and you and Syri go tumbling into the bed. A moment later, and the alien beauty is straddling you, gently pumping her pecker as she growls, <i>“Your call, [pc.name]. How do we do this?”</i>");
			}
		}
		//on Uveto
		else
		{
			output("You flash the sexy ausar a grin and ask if she’d care to go back to your place for a little fun. She feigns mulling it over but the rising tent in her pants betrays her, and soon Syri’s gathered her bag and has her arm hook around your waist, letting you lead on toward the docks.");
			output("\n\nA quick bustle through the blustering Uvetan winds, holding each other tight for warmth, and you’re in the elevator heading spaceward. The doors have barely closed before the lusty slut grabs your arms, pulling you into a sudden kiss, her lips sucking on yours, tongue demanding entrance before you can recover. With a primal groan, Syri shoves you up against the wall, hands running all over you without the slightest concern for who might see you. ");
			output("\n\nIt takes all your willpower to pull her off before the elevator gets sent back down again, and the two of you make a quick run from the station center back to your docking arm. The airlock barely has a chance to cycle before Syri starts to pull your gear off,  a furry leg hooking around your hip to lock her chest tight to yours. She moves in rhythmic undulations, grinding her crotch against yours, ");
			if(pc.hasCock()) output("your [pc.cock] stiffens as her knotty prick brushes up against it.");
			else output("your [pc.cunt] burns with desire as Syri’s dick rubs against it."); 
			output("\n\nAs soon as you pass the airlock, clothes start flying. Syri sweeps you up off your feet, pulling you into a fierce kiss as she stumbles toward your quarters, shedding clothes and gear behind you as her prick presses into your [pc.belly], growing steadily until her pants are gone, letting the rigid red rod prod your thigh. Your door slides open, and you and Syri go tumbling into the bed. A moment later, and the canid beauty is straddling you, gently pumping her pecker as she growls, <i>“Your call, [pc.name]. How do we do this?”</i>");
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
			if(outputs) output("\n\nYou’re too big to fuck her with your cock.");
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
	addButton(4, "Catch Anal", catchAnalFromSyriIfYouDontUseACondom);

	//For Cocktail Cockwielders
	if (pc.hasCock() && pc.hasTailCock()) addButton(5, "Tailcock", bangSyriWithTailcock, undefined, "Tailcock","Use your tailcock on Syri’s ass while she sucks you off.");
	else if (!pc.hasCock()) addDisabledButton(5,"Tailcock","Tailcock","You also need a cock for this!");
	else addDisabledButton(5,"Tailcock","Tailcock","You don’t have a tailcock, silly!");
	
	if(flags["SYRIQUEST_SYRI_ONAHOLE"] == 2)
	{
		if(pc.hasCock() && pc.cockThatFits(syriVaginalCapacity()) >= 0) addButton(6, "Bionahole", bionaHoleSyri, undefined, "Bionahole", "Ask Syri if you can borrow her perfectly packaged pussy for a little playtime.");
		else if(pc.hasCock()) addDisabledButton(6, "Bionahole", "Bionahole", "You are too big to fuck her perfectly packaged pussy!");
		else addDisabledButton(6, "Bionahole", "Bionahole", "You will need a cock to fuck her perfectly packaged pussy!");
	}
}

//Reverse Cowgirl
public function syriReverseCowgirlConsensualization():void {
	clearOutput();
	showSyri(true);
	author("Savin");
	var x:int = pc.cockThatFits(chars["SYRI"].analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("Brushing a hand across the ausar beauty’s cheek, you tell her you’d like a front seat view of that nice, firm ass of hers bouncing on your cock. She grins down at you - the perfect opportunity for you to plant a kiss on her lips, cupping her cheeks and pulling her down. Her breath catches, voice melting into a low, contented moan as she relaxes in your arms.");

	output("\n\n<i>“Is that how you " + plural(pc.raceCute(true)) + " say ‘please’?”</i> she says, moving down to kiss along your neck, then shoulders. <i>“I prefer to pitch, captain, but for you...”</i>");

	output("\n\nSyri turns around atop you, planting her pert little ass right in front of your face as she grabs [pc.oneCock] in her firm, furred grip, giving it a few experimental pumps. Your prick jumps to attention, right into her waiting maw. Her tongue flicks out, trailing from base to [pc.cockHead " + x + "] until her lips wrap around your glans, planting a kiss right on the tip top of your prick. You lean back and sigh as Syri goes to work, pumping the length of your [pc.cock " + x + "] as her mouth tends the head, slathering your first inches in wet ausar kisses.");

	output("\n\nShe’s absolutely meticulous in her oral ministrations, unrelenting as she pumps your prick. Your hands slide up to her hips, digging into her taut ass cheeks and giving her a playful spank. Syri answers with a yelp that sounds a little too much like a bark before slurping up your [pc.cock " + x + "], lips sliding down your girth with seductively sensual slowness. As she gulps down your dick, the ausar girl lifts her bushy tail up and gives her hips an enticing wiggle. You figure you know what she’s after, and quickly put a pair of fingers in your mouth, swirling your tongue around them much as Syri’s doing to your own prick. You take your time, getting your digits nice and slathered before you spread Syri’s taut, smooth cheeks, revealing her tight little pucker. She shivers as one of your cool, spit-slick fingers presses up against the dark hole, but a moment later and Syri relaxes, pushing back against your finger until it pops through her sphincter, sinking into her welcoming ass. Your [pc.cock " + x + "] comes free from the user’s mouth as it falls agape, a low, feral moan escaping her lips as your finger plunges into her backside.");

	output("\n\nYou feel a tiny little bump at the tip of your finger, and immediately Syri’s veiny red prick jumps to attention, a pearlescent bead forming at its pointed tip. <i>“Ooh, right there, Steele,”</i> she groans, moving her hips ever so slightly. <i>“Thaaat’s the spot. Mmmm yeah.”</i>");

	output("\n\nYou grin, happy to have found the sexy ausar’s weak spot. You start to move your finger around, gently swirling it through her half-clenched back door, making sure to spread your slick spit all around. Syri’s voice soon falls into little gasps and moans, barely more than girlish cries before she makes herself get back onto your [pc.cock " + x + "], sucking up your shaft again. You reward her renewed attentions with a few quick, short thrusts into her, rolling your fingertip across her little bud. She groans around your prick as her own twitches and throbs, dripping a nice, thick bead ");
	if(pc.biggestTitSize() < 1) output("right onto your chest");
	else output("right between your [pc.chest]");
	output(". You slip another finger in, spreading her well-lubed hole wide; Syri’s breath catches, her mouth pulling off your [pc.cock " + x + "] with one final kiss on your [pc.cockHead " + x + "] before she pushes back hard on your hand, getting those fingers as deep in as she can.");

	output("\n\n<i>“Right there, [pc.name]. Riiiight there,”</i> she breathes, sitting up and pushing back, practically bouncing on your fingers. She humps back against your hand until you think your whole fist is about to disappear; finally, she relents, pulling off of you with tender slowness, savoring every inch before she’s finally off of you. Casting a wolfish grin over her shoulder, Syri crawls down the bed until she’s straddling your [pc.hips], your spit-slick [pc.cock " + x + "] standing erect between her legs. She grabs your prick, caressing your throbbing shaft with her silky-smooth fur as she slowly lowers herself down until your [pc.cockHead " + x + "] fits snugly between her cheeks.");

	output("\n\nWith a wiggle of her hips, Syri starts to hump your shaft. Leaning forward, she grabs your [pc.legOrLegs] for support, bracing her arms against them as she picks up the pace, hot-dogging your [pc.cock " + x + "] until you can see the streaks of creamy pre you’re starting to leave in her crack, adding just the right amount of lube to your stiff cockhead for her to confidently start to position herself overtop it, ready for the main course.");

	output("\n\nSyri reaches between her legs, steadying your [pc.cock " + x + "] as she slides down it. Her breath catches as the [pc.cockHead " + x + "] pierces her sphincter, but soon she’s cooing happily as your prick slides deep into her asshole. Before she even reaches the base, Syri’s head is thrown back and her back is arched as her whole body reacts to the thick, throbbing, and clearly quite pleasurable invader. As she slides down, you can do little more than bite your lip and grab her hips, gently guiding the ausar’s movements until after agonizing moments she’s fully impaled on your [pc.cock " + x + "].");
	pc.cockChange();

	output("\n\nLeaning back in your lap, Syri lets loose a deeply feminine little moan, her bushy black tail swishing happily as she adjusts to the utter fullness of your [pc.cock " + x + "] embedded in her ass. After a moment of adjustment, Syri plants her hands on your [pc.knees], steadying herself on the edge of your bed as she starts to move. It’s short, shallow movements at first, only pulling an inch or two up from your lap before descending back down, ending every slide with a satisfied moan or an emphatic twitch of the tail. As her pace starts to quicken, you move your hips up to meet her, thrusting back - but she quickly plants a palm on your chest, pushing you back down on the bed.");

	output("\n\n<i>“Oh no you don’t,”</i> Syri laughs, tickling your nose with her tail, <i>“You wanted a show, so sit back and relax. You’ll need your strength if you’re gonna keep up!”</i>");

	output("\n\nYou do as you’re told - but not before giving her a square swat on the ass to send her back to work. Syri winks over her shoulder and then she’s back at it, bouncing on your [pc.cock " + x + "] and giving you a full show of her ass: taut, perfect cheeks quivering with every movement, so yielding as you cup them in your hands, squeezing and kneading. This, at least, Syri doesn’t seem to mind: the dog-slut’s quick to wiggle her hips in your grasp, thrashing her tail happily as you playfully spank her, keeping her nice and tight on your dick. Her muscles respond to your every touch, squeezing your retreating shaft like a vice one moment, then open, slick, and welcoming the next as your prick slides home.");

	output("\n\nHer ass is the perfect fit for your [pc.cock " + x + "], sucking it in with every thrust and refusing to let go. Syri seems to agree, if her lusty pants and heaving breasts are any indication; and you can just glimpse her prick between thrusts, bouncing up and down with its owner’s movements. Her cock is dribbling pre freely, your dick practically milking her prostate, rubbing out more and more of her alien dogspunk with every movement. Her knot’s practically the size of an apple, a giant veiny red apple practically full to bursting with seed. She’s getting close to the edge, if the hardly controlled spasms rocking her ass are any indication, and you can see her tongue lolling from her mouth as she pants and moans with abandon, riding your cock like a bitch in heat.");

	output("\n\n<i>“Come on, give it to me, Steele! Fuck my ass full of cum!”</i> Syri cries, throwing her head back as she climaxes");

	//if knotty PC: 
	if(pc.hasKnot(x)) output(", coming down on your cock hard enough to finally take your engorged knot");
	output(". Her ass clamps down hard on your prick, nearly choking your rod as she cums. Your body’s eager to join her, and soon you’re letting loose a wave of [pc.cumColor] seed deep in her bowels as Syri’s prick shoots a wad hard enough to splatter on the door halfway across the room.");
	//If Anno's in the crew, 10% chance:
	if(annoIsCrew() && (rand(10) == 0 || silly)) output(" Just as the first shot of ausar seed smears your cabin door, you hear Anno calling out, <i>“Sis, are you in here? I thought I heard-”</i> and then, just as Syri’s sister takes a step through your door, she’s treated to a steaming hot shot of ausar cum. The startled tech cries out, flailing at her eyes before slamming the door closed, shouting something about coming back later. Syri laughs maniacally, though her tail curls up between her legs all the same.");

	output("\n\nBreathing hard and utterly spent, you survey the scene: Syri, sitting limp in your lap, cum drooling from her ass, falls back into your arms, nuzzling against your [pc.chest]. Pools of her seed trail all the way to the door, now plastered white. ");
	//If PC's cock has a knot: 
	if(pc.hasKnot(x)) output("With your own big, cum-stretched knot buried deep in the ausar’s ass, it looks like you’ll be together for at least a little while longer. You wrap your arms around Syri’s waist, holding the pretty girl close as you both bask in the afterglow. She leans up, planting a little kiss on your cheek.");
	else output("Though there’s no knot holding you together as two full ausars would be, Syri still curls up in your arms, resting her head on your shoulder and planting a kiss on your neck. You hold her close, basking in the afterglow.");

	output("\n\n<i>“That was... thanks, Steele. I needed that. Hope you liked the show.”</i>");

	output("\n\nRunning your fingers through her raven hair, you tell her that you most certainly did.");

	processTime(40+rand(10));
	pc.orgasm();
	chars["SYRI"].loadInAss(pc);
	IncrementFlag("FUCKED_SYRI_COUNT");
	clearMenu();
	addButton(0,"Next",syriSexOutro);
}

//Missionary
public function missionaryWithTheDogDickedSlutSyri():void {
	clearOutput();
	showSyri(true);
	author("Savin");
	var x:int = pc.cockThatFits(chars["SYRI"].analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("You grab Syri’s waist and, with a grunt of effort, roll the both of you over. Syri gives a sharp cry of surprise as she’s flipped onto her back, lips just below your own. Flashing you a grin, she leans up and kisses you, locking her lips to yours as she pulls you down atop her. You return the gesture, roving hands playing across her bare, beautiful body; your fingers trace up her smooth, toned gut to the soft, gropable mounds of her breasts. You cup one of her tits, squeezing the big, tender orb and teasing the stiff red teat at its tip. Syri’s breath catches, but soon her fingers are running ");
	if(!pc.hasHair()) output("affectionately across your head");
	else output("through your [pc.hair]");
	output(", pulling your face right into her chest. Your mouth opens, accepting one of her cherry nubs, tongue rolling across its pert surface as your hand squeezes and kneads the other breast, making your lover squirm deeper into the bed.");

	output("\n\nYou latch onto her nipple, rolling it between your teeth, tongue caressing its peak until Syri moans with pleasure and pain. Letting the red teat go, you crawl up her svelte body, trailing kisses across her taut flesh until you can bury your face in her neck, biting, kissing and caressing as the ausar girl squirms, arms locking around your [pc.hips] to hold you tight. Already, her breath is coming ragged, heart pounding in her chest as you tease and play. Surprisingly submissive beneath you, Syri nuzzles against your cheek, letting you have your way with her body as you please. You press your lips to hers, running a hand through her raven hair, stopping only to scratch the wolf-girl between her towering ears. They twitch in response, and Syri lets out a girlish whimper of pleasure, biting her lip as you lavish her with affection.");

	output("\n\nHer velveteen hand brushes your cheek, training down your neck to ");
	if(pc.biggestTitSize() >= 1) output("cup one of your [pc.chest]");
	else output("caress your [pc.chest]");
	output(", thumb dragging across your [pc.nipple] hard enough to draw a gasp from you. Down she goes, until her fingers slip");
	if(pc.legCount > 1) output(" between");
	else output(" down");
	output(" your [pc.legOrLegs], finding your [pc.cocks].");
	if(pc.cockTotal() > 1) output(" Syri wraps her fingers around your [pc.cock " + x + "], selecting it for her attentions");
	else output(" Syri wraps her fingers around your [pc.cock " + x + "], gently stroking it to hardness");
	output(". You moan low as the ausar’s dexterous grip goes to work on you, twisting and pumping until your [pc.hips] can’t help but move in response, humping her grasp on your prick as Syri grins up at you.");

	//If silly: 
	if(silly) output("\n\n<i>“Come on, Steele... give me your captain’s rod,”</i>");
	else output("\n\n<i>“You wanna stick it in, captain? Come on, then. I’m ready for you,”</i>");
	output(" Syri growls, pulling your head down into a tongue-filled kiss as your hips move closer to her own, pressing in until your [pc.cockHead " + x + "] brushes her taut cheeks. Her breath catches, body tensing as your prick prods against her puckered hole; she grabs her own red cock, rubbing it as she pulls it out of the way, giving you unrestricted access to her ass. As you press on, her arms wrap around your neck, lips pressing to yours in short, frantic kisses as her mind and body brace for impact.");

	output("\n\nYou push in, [pc.hips] rocking forward ever so slowly, edging your [pc.cock " + x + "] into the warm embrace of the ausar girl’s asshole. She draws a sharp breath at the moment of penetration, her back arching as her nails dig into your back, holding you fast as you enter her. Syri’s legs curl as your cock slides deeper, locking around your bare [pc.butt] and pulling you in. <i>“Don’t hold back, Steele,”</i> she groans, furry legs forcing your fuckstick deeper and deeper, faster and faster, <i>“Give it to me!”</i>");
	pc.cockChange();

	output("\n\nNot one to keep a lady waiting, you thrust all the way in with one long, furious thrust that leaves Syri screaming her pleasure and your cock ");
	if(pc.cockVolume(x) <= chars["SYRI"].analCapacity()) output("buried up to the hilt, groin pressed against her taut cheeks");
	else output("as deep in as the horny ausar can take it");
	output(". You start to move, but Syri grabs you, legs locking hard around your hips to keep you still. <i>“G-gimme a sec,”</i> she moans, pulling you into a quick kiss. You can feel Syri’s muscles spasming around your prick, her anal walls contracting and squeezing the girthy member in confusion, trying to force the invader out, which only makes you harder and more ardent. Slowly, Syri relaxes, legs falling back onto the bed and out of your way. Grinning down at her, you grab her hip for support as you start to pull out, leaving her groaning in pleasure until just the tip’s still in her. But her ass is like a black hole, drawing you back in before you can pause to tease the moaning dog-slut; your hips push forward again, burying your cock right back where it belongs, wedged between the quivering walls of Syri’s butt, making the ausar moan and cry, cupping her tits and arching her back as you slide back into her.");

	output("\n\nLetting your hips start up a familiar, automatic rhythm, you decide to join in on the fun topside. With a little grin, you seize Syri’s hands and pin them to the bedside, getting them out of your way. You lean into her heaving bust, burying your face between the full mountains of Syri’s cleavage. A long, pleasant moment passes as you fuck her ass and enjoy the warm, soft embrace of Syri’s tits, and soon your hands release her arms, letting them wrap around your shoulders to hug you tight. She guides you to one of her stiff erect nipples, and as if by reflex your mouth opens and takes it, suckling on the stiff point. As you cup the other, squeezing and sucking her breasts until the poor ausar’s panting, chest heaving with lust.");

	output("\n\nYou increase the tempo, tonguing her teats as your hips ram hers, faster and faster until her ass is practically sucking you in with every thrust, begging for your cock. You pound her harder, hefting yourself up from teats onto your [pc.knees] for leverage, gripping her wide hips and jackhammering her ass until she’s screaming, <i>“Yeah! Gods yeah! Fuck my ass, Steele! Fuck me full of your cum!”</i>");

	output("\n\nAs if responding to her words, you feel Syri’s ass tighten hard around your [pc.cock " + x + "] and look down as her own knotty cock bulges and twitches. You lean out as she cums, cock spasming as it shoots a thick cream-white rope of dog-spunk right between her heaving breasts. Syri yelps as the hot cum hits her flesh, and her shaft responds with another deluge, depositing a thick load of seed on her belly. Watching the squirming ausar cream herself and smelling the overpowering, heady odor of her musky seed is a potent combination that has you rutting like mad, racing to join your lover in orgasm.");

	output("\n\nYou cum with explosive force, ramming your [pc.cock " + x + "] deep up Syri’s ass before discharging a huge, sticky [pc.cumColor] glob into her bowels. The ausar girl cries out as you pound her, clearly feeling your seed pouring into her. Her cock jumps upright again, knot trembling with renewed vigor as your prick passes over her over-sensitive bud, milking it of every last drop left over from her own orgasm. Grunting and growling with feral passion, you cum deep inside your lover, grabbing her cheeks and pulling her into a tongue-tying kiss that soon has you rolling over each other, flipping off the lights as the sheets and blankets wrap around your bare, entwined bodies. Syri pulls you into her arms, letting you nestle your head back between her big breasts, cock deflating inside her");
	if(pc.hasKnot(x)) output(", though your own knot, like hers, will take some time to come back out, tying you together for a time");
	output(" as you curl up to sleep it off with your lover.");

	output("\n\n<i>“I love... the feeling of you inside me, Steele,”</i> Syri purrs, stroking your [pc.hair]. <i>“Gods, I’m so glad I met you... that we can be together.”</i>");

	output("\n\nYou lean up and kiss her, telling the beautiful ausar that you couldn’t agree more.");
	processTime(40+rand(15));
	pc.orgasm();
	chars["SYRI"].loadInAss(pc);
	chars["SYRI"].orgasm();
	IncrementFlag("FUCKED_SYRI_COUNT");
	clearMenu();
	addButton(0,"Next",syriSexOutro);
}

//Get Vag Fucked
public function getVagFukkedBySyri():void {
	var x:int = pc.cuntThatFits(chars["SYRI"].cockVolume(0));
	if(x < 0) x = rand(pc.totalVaginas());
	clearOutput();
	showSyri(true);
	author("Savin");
	output("Reaching between the lusty ausar’s spread legs, you wrap your hands around her throbbing red knotty cock and ask her how she’d like to bury that bad boy to the hilt inside you. She grins from ear to pointed ear, <i>“Now you’re speaking my language, Steele. Don’t you stop.”</i>");

	output("\n\nShe leans down and presses her lips to yours, locking you in a warm embrace as you stroke her cock, urging it to full hardness. It isn’t hard to get her stiff as diamonds, and her cock’s practically jumping in your hands, her hips bucking slightly. You can feel her tail wagging powerfully");
	if(pc.legCount > 1) output(" between");
	else output(" against");
	output(" your [pc.legOrLegs], brushing up against your thighs and even your [pc.vagina " + x + "], teasing your slit until her tail’s tip comes back dark-stained with moisture. Syri breaks the kiss and grins, chuckling as she lets her tail flicker over your drooling fuckhole, teasing you until your breath catches, nearly putting you over the edge with her merciless wagging.");

	output("\n\nGrabbing the ausar’s hips, you try to urge her and her big, throbbing cock toward your womanhood, but she swats your arms away with a playful grin, and rolls off of you. <i>“Easy, Steele, gotta grab something first,”</i> she says with a wink as she crawls out of bed. Tail wagging and hips swaying seductively, Syri sashays over to where her bag dropped on the way in, and bends over to dig something out. Seeing that ass swaying right at you, cock dangling half-hard between her legs so invitingly... it’s too much for you. You slip over to Syri, grabbing her taut cheeks hard enough to make her yelp.");

	output("\n\n<i>“K-knock it off, Steele,”</i> she growls, but you’ll have none of that. You give her a little push, and Syri tumbles into a nearby chair, cock aimed right at you. Much better. You slide down between Syri’s legs, pushing them apart so she’s nice and vulnerable, giving you ready access to her hot cock. She lets out a happy moan as you grab her prick again, steadily stroking it back to stiffness. <i>“Not what I had in mind, but... not gonna say no to a blowjob, am I?”</i>");

	output("\n\nYou nuzzle Syri’s thigh");
	if(pc.hasHair()) output(" as her fingers run through your hair");
	output(", gently urging your head toward her rod. You let the ausar beauty guide you in, and your tongue rolls out of its own accord, tip brushing the very base of her cock, just below the crest of her knot. Syri visibly shivers as you drag your tongue from stem to stern, licking up her length before swallowing her cock at the apex, lips sliding right back down. You catch your gag reflex as her girthy cock pushes down your throat; you stop at her swelling knot, planting a kiss on the salty sphere around her dick before backing off again. You’re rewarded at the height of your motion as her trembling phallus looses a bitter drop of pre down your throat, adding her own creamy lubricant to the spit coating her cock.");

	output("\n\nAs you steadily suck her off, you get your fingers in on the action: they slip in between bobs of your head, wrapping around Syri’s slick shaft to stroke her until she’s sighing and crying out at the ceaseless sexual stimulation. Once your digits are sufficiently slathered in a sheen of spit, you slip them down Syri’s shivering skin to the dark star of her ass, smiling up at the sexy ausar as you slide a finger into her. She yelps in surprise, sphincter squeezing mercilessly on your probing finger.");

	output("\n\nSyri’s back arches as you double-team her, sucking her cock and fingering her tight hole. You look up with glee as the horny ausar squirms, groping her own tits and rocking her hips, humping against your penetrating finger until you decide to show a little mercy and give her another, stretching her little tail pipe until she’s groaning and crying, wiggling her hips to get every inch of you inside her. You slip a third finger in, forcing her hole so wide it practically gapes as you delve deeper, searching for her most sensitive spot. It takes you just a moment to find it, the tight little ball a finger’s depth into her ass: with the gentlest touch, you can feel her cock jump to attention, practically spewing pre into your mouth. Watching Syri groan and pant only makes you want it more, and soon you’re mercilessly massaging her prostate on three fronts, slurping up the continual discharge of salty seed as her pointy prick spurts into you, slathering your tongue with ausar cream.");

	output("\n\n<i>“H-hey, ease up, tiger... gonna... gonna...”</i> Syri whines, a little too late to stave off the inevitable. You bear down, swallowing her prick to the base until her thick, swelling knot is tucked between your lips, letting you feel every surge and twitch as the massive tie fills with cum, urged on by your busy fingers until your can feel her shaft spasming around your tonsils, and the first thick ropes of puppy spunk shooting into you, burning hot and bitter on your tongue. Syri lets out a single long, low moan, cupping a tit as her other hand holds your head down on her rod, roughly bobbing you up and down as you swallow gouts of spooge, coming on so fast the slimy trails soon spurt down your chin. When you finally pull yourself off Syri’s cock, you’re linked together by thick ropes of spit and cum, mixed together into perfect pearlescent bridges.");

	output("\n\n<i>“Ah, gods,”</i> Syri moans, leaning back in the chair, chest heaving. <i>“That was... you’ve got a talented tongue, Steele. Real talented.”</i>");

	output("\n\n<i>“What, you think that’s it?”</i> you tease, climbing into the exhausted ausar’s lap, planting a cum-filled kiss on her lips, letting her taste her own seed. <i>“I’m not done with you yet!”</i>");

	output("\n\nYou grab her slick cock, fingers wrapping just above the full cum-swollen knot, stroking her until she’s hard again. Syri lets out a quiet whimper as you jack her off, slowly getting back to hardness over a few long minutes that leave you both panting with effort. Finally she’s firm and ready to go, and you rock your hips forward, bringing your slavering cunt right to the tip of her fuck-pole, only to be roughly pushed back. You give Syri a questioning glance, which she returns with a sheepish smile, and pulls a tightly-wrapped nanofiber condom out of her pocket.");

	output("\n\n<i>“Told you I needed something. You want a cunt full of cock, then you gotta use this. Sorry, babe,”</i> she says apologetically, tearing the packet open with a sharp canine. <i>“Not quite ready to be a dad yet, you know?”</i>");

	output("\n\nYou nod and grab the condom between your teeth, slipping back between her spread legs to press your face to her throbbing erection, planting one last kiss upon its crown before you adjust the condom clenched between your teeth, getting the almost imperceptibly thin fibers lined up just right before you plunge down, spreading it down and around her cock, letting it snap tight on the crown of her thick knot. Syri draws a sharp breath as the condom pops into place, reaching down to draw it tight as you straddle her once again, arms wrapping around her slender shoulders, [pc.vagina " + x + "] hovering over her slick, sheathed shaft.");

	output("\n\nThis time, Syri grabs your [pc.hips] and pulls you down, spearing you right on her cock. Your back steadily arches as the lips of your [pc.vagina " + x + "] part, swallowing inch after inch of Syri’s cock, feeling the impending, unstoppable fullness of being stuffed with alien dick until you let out a shrill yelp, cunt straining to accommodate the thick knot ramming it. You rock yourself back, pulling her back out to the head few inches, giving yourself a moment to brace for the knotting this time. A few short bounces on her cock slowly loosens you up, spreading your wet and ready walls wide for the real pleasure.");
	pc.cuntChange(x,chars["SYRI"].cockVolume(0),true,true,false);

	output("\n\nYou take it easy for the first few minutes, steadily working further and further down her length, moaning and whimpering with pleasure as her thick cock grinds into you. Soft, furred hands play across your skin");

	if(pc.biggestTitSize() >= 1) output(", cupping your [pc.chest] and squeezing the full orbs, bringing one up to Syri’s mouth so that her lips can wrap around a stiff [pc.nipple]");
	else output(", holding you tight enough that Syri can drag her tongue across your nearly flat chest, testing one of your [pc.nipples] before latching on");
	output(". Her fingers drift back down as your back arches, responding to the pinch and pressure of your lover suckling from your teat");
	if(pc.isLactating()) {
		output(" and the flow of your [pc.milk] into her eager mouth");
		pc.milked();
	}
	output(". Her hands finally grope your [pc.butt], kneading your cheeks and guiding you inexorably down toward her swollen base. You grit your teeth and try to relax as you slide down her length, suppressing a little gasp as you feel your lower lips parting at its crown. Your [pc.vagina " + x + "] spreads and stretches, pushed to the extremes of its elasticity to accommodate the ausar’s thick knot until with a gasp and cry, it pushes past, tying you to your lover as you sink into her lap.");

	output("\n\nSyri holds you tight to her as the knot sinks into your [pc.vagina " + x + "], planting kisses and caresses across your tender, sweating flesh. She cups your cheek, holding you steady for a long, tongue-tying kiss that soon has you both moving, grinding your hips against each other in the short, quick motions that the dog-tie holding you together allows. The feeling’s enough to nearly overwhelm you, though: so utterly full, stretched and filled by Syri’s swell, feeling her lengthy, pointed cock probing your womb... it’s too much.");

	output("\n\nYou feel yourself cumming, [pc.vagina " + x + "] spasming hard around the massive intruder spearing it open");
	if(pc.hasCock()) output(" as [pc.eachCock] explodes in a shower of seed, smearing Syri’s belly with a sudden gush of your cum");
	output(". Syri groans in response, her cock spasming in return, knot swelling again as your cunny clamps and squeezes, milking it even through the microfiber condom. With a quiet roar, Syri grabs your ass and pulls you hard onto her lap, shoving as much of her dick into you as she can before cumming; you can feel the condom balloon out as her hot seed pours into it, swelling the condom until it feels like a sloshing second knot pressing against your cervix.");

	output("\n\n<i>“Gods,”</i> Syri pants, hands clasping your [pc.butt], <i>“that was awesome, Steele. You’re an animal...”</i> Suddenly, you’re hefted up into her arms as the ausar girl hobbles to her feet, shakily carrying you back to the bed before you both fall in, laughing like kids until Syri rolls onto you, face inches from your own.");

	output("\n\n<i>“I don’t deserve a " + pc.mf("boy","girl") + " like you... you’re amazing, [pc.name],”</i> she says, smiling down at you with her puppy dog eyes that make you want nothing more than to kiss her, pulling the alien beauty onto you as you flip off the lights, drawing the blanket over your bare bodies to wait out her knot’s deflation in each other’s arms.");
	processTime(40+rand(15));
	pc.orgasm();
	pc.loadInMouth(chars["SYRI"]);
	//pc.loadInCunt(chars["SYRI"], x);
	chars["SYRI"].orgasm();
	IncrementFlag("FUCKED_SYRI_COUNT");
	clearMenu();
	addButton(0,"Next",syriSexOutro);
}

//Catch Anal
public function catchAnalFromSyriIfYouDontUseACondom():void {
	clearOutput();
	showSyri(true);
	author("Savin");
	
	var x:int = -1;
	if(pc.hasCock()) x = pc.biggestCockIndex();
	
	output("You spread your [pc.legOrLegs] around the ausar beauty’s hips, leaving your [pc.butt] perfectly vulnerable to her thick red prick. Syri grins as you move, her dark eyes drifting down your bare body and the tender flesh on offer, your ass lifted and eager for her. <i>“You’re just an insatiable slut, aren’t you, Steele?”</i> Syri laughs, giving you a sharp slap on the thigh." + (syriAtBurts() ? " <i>“If you just wanted a good buttfucking, you coulda stayed at the bar and given Burt a show.”</i>":""));

	output("\n\nYou start to answer, but she chuckles and winks, <i>“Yeah, yeah. I prefer you all to myself, anyway.”</i> Syri leans down, lips brushing along the nape of your neck as she trails kisses across your [pc.skin], culminating with a long tongue-tying embrace. It’s a long, pleasant moment before she breaks the kiss, bracing on her elbows an inch above your face, lips still bridged to yours with little ropes of crystal-clear saliva. Her soft, furry hand cups your cheek gently, thumb running just under your eye as your lover smiles prettily down at you, hips moving almost imperceptibly closer to your eager ass.");

	output("\n\n<i>“I can fuck your ass raw any day, [pc.name]. But when we’re alone like this... when I see you on your back, so beautiful, so very much mine... I just want to take it gentle. At least at first. What do you say?”</i>");

	output("\n\n<i>“That sounds just about perfect.”</i> You reach up and give your lover a deep, long kiss, pulling her down into your [pc.chest] as your [pc.legOrLegs]");
	if(pc.legCount > 1) output(" lock");
	else output(" wraps");
	output(" behind her, drawing her inexorably into you. Her breathing picks up, a shallow pant by the time you can feel the boiling hot rod of dog-cock spreading your cheeks, heading for home. Squeezing Syri tight, you grit your teeth and try to relax your sphincter to ease the coming blissful agony.");

	output("\n\nA slight, pleasured whimper escapes your lips as the pointy tip of Syri’s cock presses against your [pc.asshole], ");
	if(pc.ass.looseness() <= 2) output("building up pressure before your tight little pucker finally yields, letting it slip past");
	else output("sliding past your relaxed, yielding muscles to slip right in");
	output(". The both of you groan as your [pc.legOrLegs]");
	if(pc.legCount > 1) output(" shepherd");
	else output(" pulls");
	output(" Syri’s hips in, pushing her deeper and deeper in one long, slow motion until she’s so deep you can practically taste her cock; her thick, throbbing knot presses tightly to your back door, but she relaxes her advance just as your body tenses, bracing for impact.");

	output("\n\n<i>“Not so fast,”</i> Syri grins, a hand playing across your bare [pc.chest]");
	if(pc.biggestTitSize() >= 1) output(", cupping one of your full breasts, giving the perky teat a playful squeeze");
	output(". <i>“The thing about fucking an ausar bitch is... you have to take it slow,”</i> she adds, hips starting to pull away from you, her cock dragging back through your quivering rectal walls. <i>“You don’t want to take the knot right away. Even if you’re a real buttslut, you gotta enjoy the long, slow thrusts first. Then you can build up to the real treat.”</i>");

	output("\n\nWith one last kiss, Syri sits up, resting her hands on your [pc.hips] as her dick finishes its exodus from your ass, pulling out to the halfway point before she starts to slide back in, pushing back in with deliberate and unrelenting pressure that sends your muscles to spasming and clenching, desperately trying to repulse the girthy intruder, which only seems to make the motion more pleasurable for your lover. You grin as Syri’s face devolves into one of wanton lust, tongue practically rolled out as she fucks you, steadily thrusting again and again into your [pc.asshole]. The feeling of your tender walls being parted, your hole stretched");
	if(pc.hasCock()) output(", and prostate pounded");
	output(" is heavenly, and you can do little else but moan your pleasure, squeezing down on her cock with all your might.");

	output("\n\n<i>“Easy,”</i> Syri whines, but you don’t let up, clamping down on her until ");
	if(pc.ass.looseness() >= 4) output("even your loose, battered anus is making her work for every inch");
	else output("she’s forced to work for every inch she thrusts");
	output(". Her movements becomes sharp and shallow, tiny, fast thrusts into your tightly-clenched hole until she’s practically battering her way in. So much for gentle! You grab Syri’s flared hips and guide her in, urging her deeper and deeper until you once again feel a potent pressure building up against your tight-held hole. Syri grunts with effort, hammering it into you until you’re practically crying out. You manage to relax your body, forcibly loosening your [pc.asshole] so that the great orb of Syri’s knot can push through, reaming your abused sphincter with a flurry of quick strokes before it can finally push into you.");
	pc.buttChange(chars["SYRI"].cockVolume(0),true,true,false);

	output("\n\nBut she only goes half-way, leaving her knot stretching your ass at its widest point. You whine, trying to move your hips to either push it out or pull her thick tool in, but Syri grabs your [pc.hips], holding you immobile as her throbbing knot pulls you apart at the seams. The pleasure is incredible, but the feeling is mired with the sheer stretch inflicted on your [pc.asshole], making you whimper and whine, begging for more. Instead, Syri’s fingers dig into your hips as she pulls out, knot coming out with a wet pop that leaves you feeling horribly, irrevocably empty. You can barely notice her cock pulling out of your agape ass, flopping against your thigh as your lover grins down at you with a predatory lust.");

	output("\n\n<i>“You want the knot, Steele?”</i> she teases, leaning in so close you can feel her hot breath on your neck, her lips not even an inch from your own. With your mind a roiling mess of lust and need, all you can do is nod eagerly, hips wiggling enticingly between you. Syri chuckles, patting your thigh. <i>“You want it so bad, then let’s do it ausar style. Get on all fours, my friend, and ");
	if(!silly) output("brace yourself");
	else output("prepare your anus");
	output(".”</i>");

	output("\n\nYou hurry to comply, rolling over and pulling yourself up to rest on your hands and [pc.knees], hips and ass swaying for your hung lover. Looking over your shoulder, you see her lick her lips approvingly, hands running across your [pc.butt], playfully squeezing as she pulls your cheeks apart to give herself a good long look at that ass. She leans in, tongue flicking out to drag from taint to hole, circling your [pc.asshole] with a few long, fluid motions before pushing in, easily sliding past your thoroughly stretched sphincter. You shudder as the long, wet appendage slithers in, teasing your walls");
	if(pc.hasCock()) output(" and flicking across your most sensitive spot, making your [pc.cock " + x + "] twitch and jump to attention, almost boiling over with pre");
	output(".");

	output("\n\nYour fingers dig into the bed as Syri’s tongue explores your passage, flicking quickly in and out between long, languid slurps that paint your walls with thick coats of saliva, getting you nice and warmed up for round two. She keeps going for a long minute, slathering your ass up before backing out, letting her fingers take over. As a pair of spit-slick furry fingers slip into you, Syri chuckles <i>“Don’t ever say I’m not a very </i>giving<i> lover... takes a little more to cum from your ass, huh? Let’s see if this does it for you.”</i> You grit your teeth as two digits slip in, pumping in and out with quick, erratic thrusts that soon have you panting and moaning, wiggling your hips to the beat of the finger-fucking, barely noticing when a third... then a fourth join the fun in a ball practically as big as her knot.");

	//if PC is already pretty loose: 
	if(pc.ass.looseness() >= 3) output("\n\nNo matter how much anal you enjoy, though, there’s nothing quite like feeling Syri’s fingers ball up, forming a perfect fist as she practically punches into your gaping hole. A scream of overwhelmed pleasure bursts from your lips as Syri fists you, pushing deep into your ass until she’s halfway to her elbow before relenting. Her thrusts are slow and steady with such a massive insertion, spreading and stretching you with as much gentleness as she can muster. It isn’t much, but you’re thankful for what mercy she can show your poor asshole at this point. After this, though, taking her thick knot will be a cakewalk...");

	output("\n\nReduced to a quivering, whimpering pile of lust and desire after Syri’s thorough finger-fucking, you’re desperate for the release your lover always stops just short of giving you. You watch over your shoulder as Syri grips your hips, holding you steady as her dick makes its final approach, sliding easily into you up to the big knot at its base. Even after such a stretching, it’s still a moment of exquisite agony when it pushes into you; Syri’s cries her pleasure as she fucks the throbbing orb past your sphincter, which you match with a high moan of ecstasy as you nearly cum from penetration alone.");

	output("\n\nThe moment passes, though, and Syri’s knot sinks into you, your ass eagerly swallowing it up. Syri grins, giving you a sharp spank that makes you squeal as she starts to hump your butt, fucking her knotted cock deep into you. A few seconds of that nearly has you over the edge");
	//if cock: 
	if(pc.hasCock()) output(", especially as Syri’s hand reaches around your quivering hips to grab your [pc.cock " + x + "], quickly stroking the turgid member off to the beat of the assfucking that’s driving your prostate wild with stimulation");
	output(". The final blow is a hard spank, a sharp swat on your [pc.butt] as Syri pulls her cock back hard, nearly un-knotting herself around your spasming sphincter. You scream and cum");
	if(pc.hasCock()) output(", [pc.cocks] gushing onto the sheets as Syri’s dexterous hands and rectal ravaging finally overwhelm you");
	else output(", finally overwhelmed by the rectal ravaging");
	output(".");

	output("\n\n<i>“Yeah!”</i> Syri cries, hammering her hips right back in, slamming into your ass. <i>“Fuck yeah, Steele! Take it!”</i>");

	output("\n\nYour breath catches as your orgasm draws forth a thick, hot spurt of ausar cum that blasts deep in your colon, filling you with Syri’s seed. She humps away at your orgasmic ass, fucking you hard and fast as her cock spurts and spurts, painting your walls white with spooge. You groan and cry as Syri relentlessly, mercilessly jackhammers your ass, filling you again and again until she’s panting uncontrollably, chest heaving with effort. She keeps cumming, stuffing you with thick, hot spunk until you feel bloated, stomach churning as it’s packed with alien cum.");

	output("\n\nFinally, Syri’s orgasm passes. Exhausted and with ragged breath, she practically collapses, dragging you down into her arms as her little spoon. You groan as your knotted ass gets one last accidental thrust before her twitching cock finally comes to rest inside you, withering ever so slowly. Smiling dreamily, Syri reaches an arm around your waist, hugging you tight against herself as she plants a kiss on your cheek.");

	output("\n\n<i>“Sorry. I guess I’m not that great at being gentle,”</i> she says with a wry chuckle, fingers brushing along your groin, just over the dick held inside you. You give a pleasured little shudder, snuggling back into your lover’s arms as she draws the covers up over your bare, tied bodies. You dim the lights and relax, letting yourself drift off as Syri holds you close.");

	processTime(40+rand(15));
	pc.orgasm();
	pc.loadInAss(chars["SYRI"]);
	chars["SYRI"].orgasm();
	IncrementFlag("FUCKED_SYRI_COUNT");
	clearMenu();
	addButton(0,"Next",syriSexOutro);
}

//Blow Her
public function blowSyriYouFukkinSlut(postScene:Function = null):void {
	if (postScene == null) clearOutput();
	showSyri(true);
	author("Savin");
	output("Grinning up at your hung alien lover, you ask her if she’d like some good old fashioned oral attention. Syri grins and rolls off you, cock rising skyward as you crawl downward, slipping between her spread legs to give yourself a good view of her eager member. The ausar’s veiny puppy pecker is nice and stiff, swaying slightly as it stands erect for your inspection. Syri gives a little whine and shifts her legs, and her shaft waggles comedically at you, nearly brushing up against your nose; you take the opportunity to let your [pc.tongue] play out, lapping at her sensitive underside. The taste is bitter, but the sound of Syri’s breath catching in her throat is exquisite, and with the look of wanton pleasure etched on her face to motivate you, you slip down toward her base, tongue probing at the red, pulsing prick down and down to its very roots, your fingers rubbing aside the downy fuzz around her stem to plant a kiss on her most sensitive flesh.");

	output("\n\nHer legs tremble around you, knees squeezing your shoulders as you cup her full sack, rolling Syri’s hefty nads between your fingers. You can feel her quick heartbeat through her balls, so blatantly eager, and you can’t help but give her sack an appreciative squeeze, feeling the pent-up cum roiling inside them, over-ready for release. Syri lets out a small, whining moan, tail flicking happily between her full cheeks as you lean in toward her manhood, so close you can see her cock jumping as your breath boils over it, close enough to see it shiver with every heartbeat. With a smile and a lick of your lips, you gobble up the ausar’s heavy gonads, sucking her sack up until your lips are caressing her shaft. You suck gently on the two swollen orbs, oh so gently, just enough to make Syri’s back arch, her fingers brushing through your [pc.hair] to urge you on. You tenderly nibble at the yielding, folded flesh of her balls, giving them a little pull as your fingers work their way up her thighs, brushing through her furred lower legs to the bare, warm skin of her crotch.");

	output("\n\nYou suck Syri’s supple sack like a sweet little sucker, stroking her stiff shaft with smooth, sensuous motions. She sighs and shivers at your touch, practically shaking as you suckle on her soft orbs; you feel your own breath quicken, your ");
	if(pc.hasCock()) output("[pc.cocks] hardening");
	else if(pc.hasVagina()) output("[pc.vaginas] drooling");
	else output("ass clenching");

	output(" as your own excitement mounts. It’s so easy to imagine this big, pulsing, knotted tool pounding into you, stretching you wide as her knot takes you, claims you, makes you hers. You can only just resist the urge to mount your love, to ride her cock until she floods you with cum, but the burning desire to have the whole of her towering rod slip between your lips wins out. You pop her balls out of your mouth with a wet squelch, shifting up ever so slightly to look down on the pointed tip of her shaft. A nice, thick glob of white pre has swollen up into the tiny valley of her cumvein, and you’re quick to lick it off, tasting her seed on the tip of your tongue, planting a dainty kiss on her cockhead as you swallow her pre.");

	//If PC has tits C+ cups:
	if(pc.canTitFuck()) {
		output("\n\nBut before you go down all the way, it’s time to give your doggy lover a thrill. You cup your [pc.chest] tight together, wrapping your two soft mounds around the turgid shaft of Syri’s cock. The ausar gasps as she feels your tits encompassing her prick, ");
		if(pc.biggestTitSize() >= 10) output("utterly enveloping her eight inches of puppy pecker in your finger-straining mammaries");
		else output("your perky tits fitting her cock perfectly, letting just the pointed tip of her pride poke out between your pert breasts");
		output(". She shudders as you rock your bust forward, dragging her erection through the valley of your bust until just the tip is still buried in the tight compress of your cleavage. A couple long strokes and you start to pick it up, humping along the length of Syri’s pre-slick schlong. You can feel her cock twitching between your breasts, leaking a steady trickle of slick pre to stain your supple flesh with her errant seed.");
		output("\n\nYou keep her going for a long minute, titfucking your ausar lover faster and faster until she’s panting and moaning, all veneer of restraint lost in her pleasure. ");
	}
	else output("\n\n");
	output("As you caress her cock, you feel velvet-soft fingers " + (pc.hasHair() ? "slipping through your hair" : "gliding across your head") + ", guiding your pursed lips down onto the waiting point of her pre-leaking length. You keep your lips nice and tight as she pushes you down on her rod, making her work for every inch like she was fucking a virgin cunt. Your tongue slathers her underside as she pushes in, rubbing along her veiny length until you can feel a twitch and spurt of hot pre smearing onto the back of your throat.");

	output("\n\nYou swallow her sticky seed, already trying to coax more out of her. Syri cries out, back arching as she grabs one of her tits, squeezing and pinching her stiff nipple as you take her cock to the base, wrapping your lips around her engorged knot. You suck her knot like a sweet red candy, bobbing your head up and down on it as her pointy tip assaults your mouth, bulging your throat. With the way she’s twitching and squirting inside you, there’s not much longer until she blows her load right in you! Her knot is practically spasming between your [pc.lips], thumping the roof of your mouth in arhythmic spasms as pre leaks freely across your tongue, smearing across your cheeks. You bob your head down on her shaft, as far as you can go until you’ve completely swallowed up her knot.");

	output("\n\nBut that’s just not enough to push her over. Syri whines, bucking her hips ever so slightly to try and fuck your face just a little bit harder. You look up, meeting her lust-addled gaze for just a moment before you slip a hand down and push three fingers in.");

	output("\n\nSyri’s back arches up as she cries in surprise, ass spasming wildly as you press your fingers deep inside with one swift, forceful motion. Spreading your fingers out, stretching her nice and wide, takes a tremendous effort, but you’re rewarded with a steady flow of thicker and thicker spunk leaking from her cockhead, momentarily sating your need for seed until you can find her most sensitive place. With Syri, though, that doesn’t take long. One of your fingers brushes up against a thick little bump in her rectal tract, and her prick responds immediately, jumping so hard you nearly gag on it. You give the spasming ausar a slap on the thigh, digging in and holding her down as you suck and thrust, teasing her engorged cum-bubble until she can’t take it any more.");
	output("\n\nWith a hull-shaking scream, Syri cums. Her soft hand suddenly turns harsh, slamming you down on her cock as her shaft spasms. You feel it in your fingers first, her prostate tightening and pulsing as it churns up a thick load of white-hot spunk. There’s just enough time to brace yourself, doing everything you can to suppress your gag reflex as her cock swells and spurts, filling your throat with a thick white coating of ausar spunk. You try and swallow it as she cums, but there’s just so much, feeling like it’s burning your throat as it shoots straight down into your gut.");

	output("\n\nYou give her big, swollen knot a tight squeeze, stroking the cum from her thick orb and right down your own gullet. Spurred on by your triple assault of finger-fucking, knot-jerking, and cock-sucking, she just keeps cumming, stuffing you with thick, hot spunk until you feel bloated, stomach churning as it’s packed with alien cum. You struggle to take her massive load, swallowing too slowly to keep up with her spunk-swollen balls’ outpouring, and with a gag, find your face plastered with white, hot cum drooling down your face, bubbling on your chin.");

	output("\n\n<i>“Fuck yeah,”</i> she groans, stroking your [pc.hair] as her orgasm finally winds down, cock merely twitching and bubbling in your mouth. <i>“You’ve got a magic tongue on you, Steele. Do that again and I might just have to keep you as my own personal cum-bucket,”</i> she adds with a playful wink, brushing a bit of spooge from your cheek with her thumb. You let her prick go, keeping the last thick, sticky drops of her seed just long enough to crawl up the ausar’s tall, curvy frame to plant a kiss on her thin lips, giving her a taste of her own cum. She gives a little gasp at the unexpected bitter taste, but true to form opens wide for it, swallowing the last part of her own load with a slutty grin, lips stained white.");

	output("\n\nWith you in such a perfect position, Syri’s arms are quick to wrap around your [pc.hips] and back, pulling you down onto her and into a tight, affectionate hug. You nestle your cheek into her big, pillowy bust, smiling as Syri yawns contentedly, still stroking your [pc.hair]. <i>“Thanks for the blow, Cap. You’re the best.”</i>");

	output("\n\nYou smile and snuggle up, feeling like you’ve earned yourself a post-coitus cuddle as Syri’s load gurgles in your gut.");
	chars["SYRI"].orgasm();
	pc.loadInMouth(chars["SYRI"]);
	pc.lust(33);
	IncrementFlag("FUCKED_SYRI_COUNT");
	clearMenu();
	if (postScene == null) addButton(0, "Next", syriSexOutro);
	else addButton(0, "Next", postScene);
}


//Tailcock Scene, Coded by Savin, probably works like shit
public function bangSyriWithTailcock():void
{
	clearOutput();
	showSyri(true);
	author("Archangel");

	output("You suggest to Syri that she could suck you off while you plow her from behind.");
	
	output("\n\n<i>“That sounds really nice and all, but I’m no Kaithrit, Cap,”</i> she says with a wry smile and a shake of her head before starting to lightly rake her claws down your back. <i>“Maybe we could just-”</i> She abruptly stops when her hands reach the junction where tailcock meets spine. She looks downward with surprise, ");
	
	if (flags["SyriTailcocked"] != undefined)
	{
		output("as your tail curls around her wrist, and a playful grin spreads across her lips. She eagerly turns to the wall, shaking her full, round ass at you. <i>“Come on, Steele, spear your slutty ausar’s ass wide open with your [pc.tailCock]!”</i>");
	}
	else
	{
		output("“<i>Oh. You’ve got one of... those,”</i> she says with slight nervousness.");
		
		output("\n\nYou run your hands down her back and grope her pert ass, pulling her close, breathing in the musky scent of her arousal. <i>“Is something the matter?”</i> you ask, hooking your fingers into the waistband and pulling her tight jeans down.");
		
		output("\n\n<i>“No, not really. I’ve just never seen one of those before. Always wondered what one felt like, though.”</i> She says with a wolfish grin, pulling your [pc.upperGarment] off.");
	}
	
	output("\n\n<i>“There’s my girl. I knew you would come around,”</i> you say, smiling. <i>“I believe I should get you ready first, hmm?”</i> You say before spinning her by the shoulders, slamming her against the cabin wall, and dropping to your knees.");
	
	output("\n\n<i>“Ooh. Playing a little rough, are we?”</i> she says, giggling and wiggling her hips to entice you forwards, although you hardly need it, if your [pc.cocks] are any indication. You stretch her asscheeks wide, getting a good look at her slightly winking star before you dig in. You force your [pc.tongue] into her asshole and wildly lash it around. She moans loudly, pushing her ass into your face some more, wanting to get your tongue as deep into her tunnel as possible. You oblige, sticking it in as far as it will go. She moans whorishly loud when she feels your [pc.tongue] rub against her prostate, a tiny spurt of pre squirting out of her doggy dick.");
	
	output("\n\nYou take pity on her, reaching up and slowly stroke her pecker, using her pre as lube and eliciting another loud moan from your horny ausar buttslut.");
	
	output("\n\nYour [pc.tailCock] twitches and crawls up Syri’s leg while she’s busy moaning in pleasure, and plunges itself into her half open mouth. Her eyes widen with shock from the sudden girth invading her mouth, but she accepts it, eagerly sucking on it. You raise an eyebrow. Syri seems to have gotten over her prior nervousness rather quickly! Grinning, you let go of her cock and press three pre-slicked fingers into her backdoor. She whines loudly around the tentacle filling her mouth when she feels your fingers pushing past her sphincter. You start to thrust in and out of her ass, rubbing over her prostate as much as you can. You notice her cock twitch, and immediately pull your fingers and [pc.tailCock] out of her ass and mouth before she can cum.");
	
	output("\n\n<i>“Why’d you stop!? I was gonna cum!”</i> she whines plaintively.");
	
	output("\n\n<i>“That’s exactly </i>why<i> I stopped. Don’t want you cumming too early and ruining all the fun!”</i> you say, smirking and slapping her ass, which earns another lewd moan and a fresh gush of pre from her cock. You tug at her tail and sit on the bed. She turns, sinks to all fours and crawls towards you, a trail of pre leaking from her dick. Her ass and tits sway with each motion, making them jiggle wonderfully and urging your [pc.cocks] to become painfully hard. She reaches your spread legs and plants a chaste kiss on the tip of your [pc.cockBiggest].");
	
	output("\n\nShe wraps a hand around your [pc.cockBiggest] and starts slowly jacking it off. Your [pc.tailCock] slithers over the floor, then lifts itself up and hovers for a second before ramming into Syri’s asshole without warning. She gasps, her mouth falling open into a perfect O. You take the opportunity to grab her head and slam it down onto your [pc.cockBiggest]. She gags with the amount of dick filling her throat before you let go of her head.");
	
	output("\n\nSyri immediately pulls away, gasping for air. <i>“Fuck was that for, asshole?”</i> she says, lightly punching your stomach.");
	
	if(pc.isBimbo()) output("\n\n<i>“W- What? I thought you’d, like, like it! I totally love it when guys do that to me!”</i> you babble.");
	else if(pc.isBro()) output("\n\n<i>“I don’t think I gave you permission to stop sucking, slut!”</i> you grin, giving her a nudge back towards your dick.");
	else if(pc.isNice()) output("\n\n<i>“I-I’m sorry! I don’t know what came over me!”</i> You say, astonished at yourself at having treated your lover so roughly.");
	else if(pc.isMischievous()) output("\n\n<i>“What? I saw the opportunity and I took it!”</i> you say, grinning wickedly.");
	else if(pc.isAss()) output("\n\n<i>“Thought I was going to go easy on you? Think again!”</i> You growl.");
	output(" Syri rolls her eyes and lowers her head back to your [pc.cocks]. Lewd slurps fill the air as your dick is engulfed in her warm throat, her canid tongue wriggling along the underside of your [pc.cockBiggest]. The experience is made all the more pleasurable by the vibrations caused by her simultaneous moaning from the rough anal pounding she’s receiving from your tailcock. You notice that the haft of your tailcock has at some point wrapped itself around her dong and is now jacking it off with every thrust into her tight asshole, a little precum squirting out every time it rams itself into her slightly-gaping hole.");
	
	output("\n\nYou hook your hands under Syri’s armpits and pull her up, sliding your [pc.cocks] right between her bouncy mammaries as you do so. You grab her tits and start thrusting, using her breasts like a soft, squishy onahole. She opens her mouth and spits into the valley of her cleavage, providing lubricant to ease the passage of your [pc.cocks] through her boobflesh. She lowers her head and keeps her mouth slightly open, letting your [pc.cockHead] enter her warm mouth. It isn’t long before you feel your orgasm start to boil up in your [pc.balls], the rough ass and tit fucking starting to take its toll.");
	
	output("\n\n<i>“Oh fuck, I- I’m going to cum! Just a little more...!”</i> she manages to get out. You’re not sure you can hold on much longer, but a few minutes later, a loud <i>“Fuck yes! Fuck my slutty ass! I’m cumming!”</i> interrupts your thoughts. Syri cums hard, tilting her head back and howling, her asshole spasming and cock blasting thick ropes of cum all over your [pc.lowerBody] and the floor. The sudden wringing tightness of her asshole trying to milk the cum from you is too much, and you finally let go. Your [pc.cock] explodes, blasting a jets of [pc.cum] straight into the air, which fall back onto you and Syri; she leans back with an open mouth and hefted tits to catch as much cum as she can. Your [pc.tailCock] shudders and pumps load after load of cum into Syri’s well-fucked ass, which in turn sets off another mindblowing orgasm for Syri, who finally empties her nuts, hosing down the floor with whatever was left.");
	
	output("\n\nSyri looks at you for a moment with a face and tits covered in cum, then collapses forwards. You catch her, pulling her up onto the bed next to you. <i>“That... was absolutely... fucking... amazing. We have to do this again! Er... just not right now. I’m walloped,”</i> she says, giggling, then curls up against you.");
	
	processTime(40+rand(15));
	pc.orgasm();
	chars["SYRI"].orgasm();
	IncrementFlag("SyriTailcocked");
	IncrementFlag("FUCKED_SYRI_COUNT");
	
	clearMenu();
	addButton(0,"Next",syriSexOutro);
}


//Shipboard Sex Outro: Syri hits the Road
public function syriSexOutro():void {
	processTime(120+rand(60));
	sleepHeal();
	clearOutput();
	showSyri(true);
	author("Savin");
	output("You wake up several hours later, wrapped up in a tight, warm embrace of ausar fur and blankets. Syri’s arms are still locked around you, holding you tight. You look up from the valley of her cleavage, and find her smiling down at you, blue eyes glistening in the dim cabin light.");

	output("\n\n<i>“Sleep tight?”</i> she asks, leaning down to plant a kiss atop your head.");

	output("\n\nYou nod, and ask her the same. <i>“No bed I’d rather be in!”</i> she grins as you uncoil yourselves, making sure to give her a quick pop on the ass as she swings her legs over the bedside, searching for her pants. She pulls them up before sauntering over to you, stopping your efforts at redressing by slipping in behind you, cupping ");
	if(pc.biggestTitSize() >= 1) output("a tit");
	else output("your [pc.butt]");
	output(". <i>“Mind if I, uh, freshen up before I head out?”</i>");

	clearMenu();

	addButton(0,"Sure",sureUseMyShowerAndClogTheDrainWithDogHair);
	if(pc.libido() >= 60 || pc.lust() >= 33) addButton(1,"Don’t Go",dontGoAwayYouKnotCunt);
	else addDisabledButton(1,"Don’t Go","Don’t Go","You’re not aroused or sexually driven enough to continue!");
	addButton(2,"Join Her",joinSyriInTheShower,undefined,"Join Her","Climb in the shower and clean her a little more thoroughly... with your mouth.");
	if (pc.hasKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room.") && flags["SYRI_GIFT_PANTY"] == undefined)
	{
		if (!pc.hasLowerGarment()) addDisabledButton(3, "GivePanties", "Give Undergarments","You need to be wearing undergarments to give them to someone!");
		else if (pc.lowerUndergarment.sexiness < 0) addDisabledButton(3, "GivePanties", "Give Undergarments","Your undergarments probably aren’t the type to give as a gift.");
		else if (!pc.itemSlotUnlocked(GLOBAL.LOWER_UNDERGARMENT)) addDisabledButton(3, "GivePanties", "Give Undergarments","Your undergarment slot is currently locked!");
		else if (!pc.canDropItem(pc.lowerUndergarment)) addDisabledButton(3, "GivePanties", "Give Undergarments","You cannot drop your sexy undergarments!");
		else addButton(3, "GivePanties", syriGivePanties, undefined, "Give Undergarments", "Give Syri your [pc.lowerUndergarment] for her masturbatory pleasure.");
	}
}

//Don't Go
//High libido/lust PCs
public function dontGoAwayYouKnotCunt():void {
	clearOutput();
	showSyri(true);
	author("Savin");
	output("<i>“What, you think we’re done?”</i> you say, grabbing your ausar lover by the waist and pulling her into a tight embrace, feeling her bare breasts pressing hard into your [pc.chest].");

	output("\n\nShe laughs gaily, grabbing a handful of your backside as you kiss her. The bulge of her cock growing again is unmistakable as you yank her pants back down, grabbing her red shaft. <i>“Well, if you insist... not like I had plans,”</i> she grins, spinning you around and shoving you back into the bed before clambering over you, licking her lips predatorily. <i>“Lusty " + pc.mf("stud","slut") + ", aren’t ya?”</i>");

	output("\n\nYou grab her, pulling her down into another kiss as you grab her ass, spreading her cheeks wide with a rough squeeze.");
	if(pc.isMischievous()) output(" <i>“Takes one to know one!”</i>");
	//[Sex options, sans Blow Her]
	syriSexMenu(false);
	addButton(14,"Nevermind",sureUseMyShowerAndClogTheDrainWithDogHair);
}

//Me Too
//PC takes a shower with Syri. Can lead to a rimjob, or just hanging out and teasing


//Sure
//Alternative:
public function sureUseMyShowerAndClogTheDrainWithDogHair():void {
	clearOutput();
	showSyri(true);
	author("Savin");
	output("<i>“Sure,”</i> you say, pointing her toward your bathroom. She gives you a wink as she grabs her scattered clothes and vanishes, giving you a chance to get geared up");
	if(flags["SYRI_BUTT_GAPE_ALERT"] != undefined) output(" and spend a few minutes rubbing your poor abused hole, still gaping after Syri knotted you");
	output(". While the shower runs, you do your best to tidy up, starting to make your bed before sighing and chucking the cum-stained sheets down the laundry chute. When Syri returns, still toweling her hair dry, your cabin looks more or less back to normal again. She gives an approving nod and offers you a hand up, <i>“Buy you a drink?”</i>");

	output("\n\nYou nod and follow the ausar out as she grabs her coat, tail wagging happily behind her.");
	if(flags["SYRI_BUTT_GAPE_ALERT"] != undefined) {
		flags["SYRI_BUTT_GAPE_ALERT"] = undefined;
		//if silly and PC caught anal:
		output(" Your own steps are a little off-kilter after getting reamed that hard!");
	}
	processTime(15+rand(10));
	//Return PC to bar
	if (syriQuestComplete()) currentLocation = "UVI R32";
	else currentLocation = "BURT'S MAIN HALL";
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//This will be an option that appears along with Syri’s other after-sex options.
//STOP
//HOOOOAAAAGH

//[Join Her]
public function joinSyriInTheShower():void
{
	clearOutput();
	showSyri(true);
	author("HugsAlright");
	if(pc.isNice()) output("You tell Syri that she’s free to use your shower... and that you’d like to join her.");
	else output("You tell Syri that you don’t mind if she uses your shower... on the condition that you’re able to join her in there.");
	output("\n\nHer ears perk up at that suggestion, a lewd grin growing upon her face until all you can see is the desire in her gaze. The she-wolf turns around and starts to walk towards your shower before looking over her shoulder at you, <i>“Well c’mon, what are you waiting for?”</i> Giving her pointed ivory a lick, she returns her gaze to your shower and start to saunter her way there, fluffy tail swaying enticingly. You smirk and go to pick yourself up from the mattress, casting away your blankets. Leaving behind the comfort of your bed and lover’s strong arms makes you shiver, but the promise of the warm embrace of your showerhead - and Syri - pushes you on to follow her.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",syriShowerAdventures);
}

public function syriShowerAdventures():void
{
	clearOutput();
	showSyri(true);
	author("HugsAlright");
	output("Stepping into the shower alongside you, Syri turns the water on, and soon steam is filling the room as hot water dampens raven fur and wets [pc.skinFurScales]. You roll your shoulders in an attempt to adjust to the quick change of temperature when a pair of furry, soaked hands grab at your sides. The sudden sensation of Syri’s fur on your [pc.skinFurScalesNoun] paired with the trickle of steaming water running down your back makes you shudder, but you quickly find yourself settling into the she-wolf’s embrace as her hands start to rub up and down your sides.");
	output("\n\nYou both do your best to clean one another, washing the remnants of your love making off, soapy hands slipping and sliding over each other in a bubbly flurry. With a libido like Syri’s, though, it isn’t long before washing turns to groping, her hands sliding down to grasp at your [pc.butt], squeezing and toying with your lower cheeks. You, on the other hand, opt to move yours upward, reaching for Syri’s big, soft breast, cupping them so you can feel their heft properly. Your ausar lover whimpers when you give her chest a good squeeze, kneading her supple tits like slutty putty until, compelled by her lust, Syri presses her lips to yours, trapping you in a sloppy, tongue-filled kiss. The she-wolf starts to moan into your mouth as your gentle groping continues, tongues sliding in and out of each other’s mouths as your lover’s damp, velveteen palms make their way up your back and to your head.");
	output("\n\nSyri’s digits run ");
	if(pc.hasHair()) output("through your [pc.hair]");
	else output("over your head");
	output(" while her other hand still grabs at your ass, gently urging you downward with a little push, breaking your tongue-tying embrace in the process. You follow the ausar woman’s lead and start to lower yourself, trailing a few kisses along her sun-kissed skin until you’re level with her nice round double-D’s. Your gaze is immediately drawn to Syri’s big, red nipples, watching them glisten in the waters of your shower, rivulettes of the clear liquid dripping from her cherry nubs like morning dew off ripe fruit. You look up for a moment to see your lover smiling down at you, brushing her thumb along your scalp. Smiling right back at her, you let your [pc.tongue] loll out of your mouth and flick it across Syri’s stiff teat. The ausar’s breath catches when your tongue makes contact with her nipple, and she quickly proceeds to urge you onto her glistening red nub. You eagerly accept Syri’s stiff nipple into your mouth, letting your [pc.lips] close around it while your [pc.tongue] traces circles around the edge of her teat. You gently suckle on the she-wolf’s breast, your hands returning to grasp at her supple jugs, setting her moaning again.");
	output("\n\nStill squeezing and kneading Syri’s ever-impressive chest in your dexterous grip, you pop yourself off your lover’s now even redder nipple with a satisfyingly sloppy noise and place your mouth on her other, more neglected tit to start suckling again.");
	output("\n\nYou end up down by the she-wolf’s bust for quite a while, switching between squeezable breasts and sucking on her pair of stiff, red nubs until all she’s doing is moaning and running her fur-covered hands through your [pc.hair].");
	output("\n\nThen you feel something warm, hard, and tapered brush against your [pc.belly], followed by Syri pushing down on your head again, urging you onward past her chest. You smirk and follow the wolfy shemale’s lead, lowering yourself and trailing kisses across her tight tummy until your [pc.lips] meet the head of your lover’s cock, delivering a quick little lick to the pointed tip. Bringing your gaze to meet Syri’s, you see her move her hand to cup your cheek, stroking your [pc.skinFurScales] as water runs down your face. <i>“Think you can clean this up for me?”</i> she asks, grabbing her knotted tool to give it a few pumps and looking down at you with a lustful grin.");
	if(pc.isNice()) output("\n\n<i>“For you,”</i> you coo, taking hold of Syri’s cock and rubbing your cheek against it, letting it’s molten warmth caress your flesh, <i>“of course.”</i>");
	else if(pc.isMischievous()) output("\n\nYou give Syri a <i>“Hmmm”</i> filled with mock deliberation before taking hold of her cock, <i>“I guess I could while I’m down here.”</i>");
	else output("\n\nWithout saying a word, your hand darts for Syri’s cock, taking hold of the stiff rod and pulling it from the she-wolf’s grasp. She yelps when you yank her dick from her own fuzzy hands, but quickly settles back down with a lustful sigh.");

	output("\n\nThe ausar leans back against the wall of the shower as you slowly jerk her off, resting a raven-furred hand on your head. Her breath shudders as your hand rubs along her cockflesh, already wet and slippery from the hot flow of your shower, her grip on your [pc.hair] tightening and loosening with each movement of your fingers. Thinking you’ve teased the poor ravenette enough, you lean in closer to her dark-red doggy-dong and take a deep breath, letting the musky scent of her manhood fill your nostrils, making your heart flutter. You pull yourself back before you gobble up Syri’s cock in one go; no, gotta take thing slow, savor it, <i>at least at first</i>. Bringing your lips back to the ausar’s pointed tip, you look up at Syri, getting a good look at her lust-hazed gaze as you begin to lower yourself down onto her succulent shaft. <i>“Yeah,”</i> the wolfy shemale moans as you spear yourself on her cock, <i>“that’s niiiice.”</i>");
	output("\n\nYour [pc.lips] caress that ausar woman’s knotted rod all the way down, [pc.tongue] coating her red, throbbing dick with your saliva as the water falling down around you wets your [pc.skinFurScales]. You have Syri moaning by the time your lips reach her turgid knot, your spittle dripping down onto the thick red ball of cockflesh from your slightly parted lips.");

	if(pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output("\n\nTime to put your lengthy, flexible tongue to work: you wrap your sinuous appendage around Syri’s turgid, crimson shaft, just slow enough to make the girl whimper. When you have your lover’s knotty ausar dong well within your [pc.tongue]’s grasp, you start to shift your lengthy, prehensile member; you move the coils of your tongue up and down her doggy-dick, jerking her off in the warm embrace of your mouth. Syri starts moaning before too long, her grip on your scalp tightening to make sure you can’t pull off anytime soon. You didn’t have any thoughts of leaving the wolfy shemale’s cock to begin with, because you want Syri to blow her load right down you throat. With the intent of reaching your goal faster, you allow your [pc.tongue] to loll from your mouth and quickly drag it along the bulk of your ausar lover’s big red knot, then trailing it downward to wet her balls. Your tongue’s gentle motions across her base have Syri whimpering with pleasure, clearly close to her edge, but while you wait for her to finish, you’ll content yourself to keeping her cock sheathed between your [pc.lips].");
	//lameTongue:
	else output("\n\nTime to put your tongue to work: you lick all along Syri’s turgid, crimson shaft, just slow enough to make the girl whimper. You drag your [pc.tongue] from knotty base to pointed tip, letting your lover ride the sensation of your tongue on her doggy-cock. Syri starts moaning before too long, her grip on your scalp tightening to make sure you can’t pull off anytime soon. You didn’t have any thoughts of leaving the wolfy shemale’s cock to begin with, because you want Syri to blow her load right down you throat. With the intent of reaching your goal faster, you allow your [pc.tongue] to loll from your mouth and quickly drag it along the bulk of your ausar lover’s big red knot. Your tongue’s gentle motions across her base have Syri whimpering with pleasure, clearly close to her edge, but while you wait for her to finish, you’ll content yourself to keeping her cock sheathed between your [pc.lips].");

	output("\n\nA few moments later into your tongue-filled blowjob, you hear what you believe is Syri trying to announce her impending orgasm, but all that actually comes out of the ausar woman’s mouth is ");
	if(silly) output("<i>“Whoopsie woo, here comes the goo!”</i>");
	else output("<i>“Gonna-gonna-gonna-<b>GONNA</b>”</i>");
	output(" before the first shot of her salty alabaster hits the back of your throat. Syri moans all the louder when her climax begins, holding you on her spasming cock as she empties her bountiful load down your gullet. Her flared hips buck forward against your mouth, turning your blowjob into a right face-fucking. You take it all happily, listening to your wolfy-mistress’ pleasured tones, accepting her cum until its salty flavour overwhelms the earthy, full taste of her ausar cock.");
	output("\n\nAs your lover finishes riding out her orgasm, you swallow down the rest of her seed, the sound of Syri’s labored breathing fading into the pitter-patter of water onto the shower floor. You pull yourself off her knotty cock and smile up at the wolf-girl. She looks back down at you, returning your grin, though sometimes her face is blocked by her heaving bosom. She reaches down and cups your cheek, wiping away some of her excess cum with a fuzzy thumb, hot water caressing your face. You quickly return your [pc.tongue] to Syri’s doggy-cock, licking up the few drops of cum that haven’t been washed away by your shower’s flow. <i>“Thanks for that, [pc.name],”</i> the she-wolf sighs, <i>“your mouth is </i>magic<i>.”</i>");
	processTime(34);
	pc.lust(10);
	pc.loadInMouth(chars["SYRI"]);
	clearMenu();
	addButton(0,"Next",syriShowerAdventures2);
}

public function syriShowerAdventures2():void
{
	clearOutput();
	showSyri(true);
	author("HugsAlright");
	output("Once your oral adventure is over, you and Syri actually get to cleaning yourselves, washing away your lust in the constant downpour of steam and water. You both emerge from the shower some time later, and promptly start to dry yourselves off. ");
	if(pc.hasFur()) output("Both Syri’s fur and yours remain a little damp, even after all the towel-drying.");
	else output("While you manage to dry yourself rather easily, Syri’s fur still remains a bit damp.");
	output(" After giving your ausar lover one more slap on the ass, ");
	if(!pc.isNude()) output("she dresses herself while you do the same, putting your [pc.gear] back on until you’re good and clothed, ready to take on the world.");
	else output("she dresses herself while you watch bare ausar flesh disappear behind layers of cloth.");
	output("\n\nBy the time you’re both done, Syri’s giving you a grin and offering you a hand up, <i>“Buy you a drink?”</i>");
	//[Next] //Should take the PC back to purt’s padbass pead ball.
	processTime(15+rand(10));
	//Return PC to bar
	if (syriQuestComplete()) currentLocation = "UVI R32";
	else currentLocation = "BURT'S MAIN HALL";
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}



//Appearance
public function syriAppearance():void {
	clearOutput();
	showSyri(true);
	author("Savin");
	output("Syri Dorna is a six-foot tall ausar girl with shoulder-length raven hair and a pair of huge, perky wolf ears perched atop her head. Though she’s got a distinctly human body and face, the silky fur on her arms and legs, and the swishing, bushy tail give her a distinctly feral, alien appearance. Her attire is loose and carefree: a pair of torn up jeans, tall leather boots, and a T-shirt that’s a little too tight, accentuating her ample bust; more distinctive, though, is the long military coat she’s wearing. Long and flowing, her jacket nearly reaches the floor, and certainly seems to have seen better days, even if its buttons are brightly polished, glistening proudly amidst tears and cuts all around them. Under her tight clothes, you can see the outlines of her taut muscles: powerful legs, a firm ass, and a hint of a six-pack. What draws your eyes, though is the distinctive bulge between her legs, hinting at the big, veiny, knotty cock lurking below.");
	output("\n\nSyri has a pair of full DD-cup breasts, big and bouncy and oh so soft, each tipped with a big, sensitive nipple that’s perfect to tug and squeeze.");

	output("\n\nA thick eight-inch knotty dog-cock rests between Syri’s legs where her cunt ought to be, hanging over a pair of cum-filled testicles, surrounded by a nicely trimmed bush of downy pubes. Opposite that, she has a nice, inviting little asshole between her firm cheeks, right where it belongs.");
	clearMenu();
	if (syriQuestComplete()) addButton(0,"Next",syriFreezerMenu);
	else addButton(0,"Next",approachSyriIntheMorning);
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
	clearOutput();
	showSyri(true);
	author("FireDrops");
	output("You take your time caressing Syri’s tender DD titflesh. First you slowly squeeze her left breast. You don’t get any visible response, so you try stroking the circumference of her areola. That works: her fluffy tail begins to wag. You exploit this crack in her armor with a follow up attack of pinching and pulling, alternating with gentler rubs, until the dog-girl’s teat is visibly more turgid than its unattended neighbor.");
	output("\n\nShe’s definitely breathing harder now, yet – except for her out of control posterior – she’s stifled any response that would give her away to the onlookers gathering around the game console. While you are still planning your further assault, the black-haired ausar speaks: <i>“Don’t you think you’re overlooking something here, Steele?”</i>");
	output("\n\nYou play dumb and switch to the other breast, kneading her twistable nipple in an effort to make a matching pair.");
	output("\n\n<i>“Bastard,”</i> Syri mock-snarls, glancing at the crowd you’ve drawn, <i>“We’re settling a bet, not holding a three act play. Get on my cock or start collecting tickets.”</i>");
	output("\n\nEveryone in the bar is watching the two of you make out, and claiming a smoking hot wolf-girl in front of them suits you just fine.");
	//(if armor equipped)
	if(pc.armor.shortName != "") output("\n\nYou let go of her boob and guide her fingers to the fastenings of your [pc.armor]. Shortly, all your assets are on display while you");
	//(else if at least one underwear equipped)
	else if(!pc.isNude()) output("\n\nYou don’t hesitate to slip out of your [pc.gear]. Encouraging whistles come from the bystanders, but they hardly register as you");
	//(else naked PC)
	else output("You relent and");
	output(" undo the fly of Syri’s jeans. With a bit of effort you tug her garments down and the excited rod inside springs up to smack her belly. No wonder she was impatient: her hard-on must have been under quite a strain while still confined. For a moment you both watch as the reddish shaft finishes swelling to its full potential in the open air.");
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
		output("\n\n<i>“What do you have here?”</i> Syri asks. <i>“This little pussy is sopping wet. ");
		//(if PC is in heat)
		if(pc.inHeat()) output("So wet. I’ll bet you’re in heat aren’t you, little pussy? I know the signs");
		//(else) 
		output("You might as well be in heat with all this girlcum");

		output(".”</i> A slender fingertip reaches toward your inner gate. <i>“You really want a hard fucking, don’t you? You want a hard, knotted cock to reach that special spot deep inside.”</i> Now the finger rubs against");
		if(pc.hasClit()) output(" [pc.oneClit]");
		else output(" your slit");
		output(". Another joins it, strumming your sex while your back arches and your pelvis grinds into her hand. <i>“You want to feel my hot, thick ausar spunk shoot so hard into your belly that you’re sore from the inside out.”</i>");
		output("\n\nYou think it’s time for another, deeper kiss... but the dog-girl twists in your arms, breaks free of your embrace, and dances around an empty table. <i>“Too bad for you I’m strictly a butt lover, huh, captain? I’m not touching any other holes today.”</i>");
		output("\n\nYou follow and she continues to sidestep, using the furniture to stay just beyond reach. The excited crowd hollers, some in favor of her escape and some cheering for her capture and the show to follow.");
		//(if FWB)
		if(syriFriendsWithBenefits())
		{
			output("\n\nYou recognize this game: asserting her independence, dictating terms in spite of her loss. But she seems to have overlooked that, by running, the ausar has become your naked prey.");
			output("\n\nSo you play along, adding a little chase to your foreplay. Your quarry gives you, and coincidentally the whole mead hall, a fantastic show. Gorgeous tan breasts riding high as she ducks a swipe... waving red doggie dong careening as she twirls to reach the far side of a chair... taut, sun-kissed asscheeks flexing as she runs away laughing... raven-hued tresses flying with every twist of her head. You idly wonder how the cocky, ex-military gamer would react if she could hear the poetry running through your brain.");
			output("\n\nAlas, your own desire is consuming you with a need for action stronger than words. Your pursuit eventually brings you back to where you started, poised in a crouch near your gear, when Syri makes a fatal error: <i>“It’s too bad, [pc.name],”</i> she teases. <i>“I sort of enjoyed the last time you rode my pole. But I’m all out of condoms and I won’t wait around for you to fetch one. So get your asshole ready.”</i>");
			output("\n\nYou suspect the lie – it’s not like her to be unprepared – but you accept the charade. <i>“And I was really looking forward to riding my favorite pooch prick,”</i> you pretend to mourn. <i>“I was so close to having it stuffed deep in my cunny.”</i> You can see the corner of a foil wrapper amongst your personal effects. It takes two seconds to bend down and pick it up. The wolf-girl gasps. <i>“If only I had remembered Burt’s vending machine and made a pit stop before the game,”</i> you finish.");
			output("\n\nConceding the point, your ausar lover returns to your encircling arms. <i>“I can’t talk you out of this?”</i> she asks. You answer by pulling her into a deep tongue kiss, stroking one of her sensitive ears with your free hand and reveling in the press of her tender bosom against your [pc.chest].");
		}
		//(else not FWB)
		else
		{
			output("\n\nYou remind her that this issue was settled already, accusing her of reneging on your wager.");
			output("\n\n<i>“I told you then that it’s back door or no door, Steele. I want to hear you say it straight out this time.”</i> The nude ausar dodges another lunge with black hair flying and breasts bouncing. <i>“Just a few simple words and you can have what you </i>really<i> want. ‘I want Syri’s beautiful penis to fuck my sorry, gaping ass.’ Say it.”</i>");
			output("\n\nShe could run and tease like this for a long time; luckily, you planned for some resistance. You abandon the chase and return to ");
			if(pc.armor.shortName != "") output("your fallen [pc.armor]");
			else output("the gear you set down before the match");

			output(". With your best jaunty grin, you find and hold up the slim condom you pocketed from Burt’s restroom vending machine.");
			output("\n\n<i>“I want Syri’s needy fuck-stick to worship inside my slick temple of love,”</i> you tell her.");
			output("\n\n<i>“Stop twisting my words again, you " + pc.mf("son","daughter") + " of a space goat!”</i>");
			output("\n\nBut she can’t hold out. Once you start taunting her about what would happen if you walked away – how many others would try their own sex bet with the aroused ausar, whether her priapism would throw off her game – the mounting embarrassment leads to her marching stiffly back to you.");
			output("\n\n<i>“You win, but you’ll get what you deserve someday,”</i> she warns. <i>“And when you do, Syri Dorna is going to shove it so far up your ass that it’ll be two centuries until you shit it out again.”</i>");
		}
		//merge at part 2
		clearMenu();
		addButton(0,"Next",allVaginalPathsMergeHere);
	}
	//Variation 1B: else (Syri_WinBet_Vag = False), if FWB
	else if(flags["SYRI_WINBET_VAG"] == undefined && syriFriendsWithBenefits())
	{
		output("\n\n<i>“Hey, slow down there,”</i> Syri blurts. <i>“This”</i> – she holds up two wet digits – <i>“is just showing off how horny you are, right? ‘Cause my hard, red dog prick won’t bark for pussy.”</i>");
		output("\n\nYou mumble that a puppy treat for [pc.oneVagina] is exactly what you have in mind, and you think she will more than enjoy it, too.");
		output("\n\nWhatever her boner might be urging, the voluptuous gamer has enough self-control to shake her head. <i>“Sorry, [pc.name], not happening. You know I’m all about the ass.... Besides, you know that I’m shooting live ammo here? That’s a risk I wouldn’t take even just in the vidya.”</i>");
		//(PC is Nice)
		if(pc.isNice())
		{
			output("\n\nThis is the only time she’s hesitated on a wager you’ve both enjoyed. Your fuck buddy is asking one thing and your swampy love tunnel is asking another: what’s your choice?");
		}
		//(Mischievous)
		else if(pc.isMischievous()) output("\n\nEven as you process the dog-girl’s request, a drop of whitish pre squeezes out of her pointed tip: it looks like serious concern and not lack of ardor that made her stop the action. How will you ease her mind and get back to the steamy sex?");
		//(Hard)
		else output("\n\nYou curse the delay: you won and now that pooch needs to fill your cooch. On the other hand, keeping her friendly and receptive could be better in the long term. Make your call, captain.");
		//Menu Buttons
		clearMenu();
		//Action: New Page. Continue with text below, "Keep Going."
		addButton(0,"Keep Going",syriVagFuckKeepGoing,undefined,"Keep Going","You’re sure you can persuade her to pound your cunt.");
		//Action: New Page. Continue with part 4, "Give Butt."
		addButton(1,"Give Butt",giveHerYerButt,undefined,"Give Butt","She can change targets if it’s that important.")
	}
	//Variation 1C: all else (Syri_WinBet_Vag = False, not FWB)
	else
	{
		output("\n\nSyri reacts strangely upon touching your [pc.vaginas], freezing her motion and tensing her muscles. That’s all the warning you get before she shoves you away hard enough to make you stumble. Trying to clear the sex fog from your brain, you can only stare in confusion. What went wrong?");
		output("\n\n<i>“If you think what I think you’re thinking, Steele,”</i> she hisses, <i>“you’re dead wrong. I’ll ream your backdoor if you can’t do me, but our wager was for a good, hard ass fuck. No cunts allowed on this prick.”</i>");
		output("\n\n<i>“I believe your exact words were ‘you can ride my cock,’ no holes specified,”</i> you protest. <i>“That makes it winner’s choice.”</i>");
		output("\n\n<i>“No way,”</i> she states, ears flattened. <i>“I don’t know what your big life plans are, but I’m not risking any future pups on some shit-faced bar bet on the pimply back end of the galaxy’s behind.”</i>");
		output("\n\nBefore you can say anything to calm her, a broken-nosed prospector in the audience speaks up: <i>“The lady said ‘No,’ stranger.”</i> More agreements follow. Syri clearly has the regulars’ affection, and the owner, Burt, seems to be reaching for some sort of weapon beneath the bar.");
		//(PC is Nice)
		if(pc.isNice()) output("\n\nAll you wanted was some passionate loving with a curvy dog-girl, not to be practically accused of rape by your moments-ago willing partner. Can you retrieve the sexy mood?");
		//(Mischievous)
		else if(pc.isMischievous()) output("\n\nWhoa – you expected a little resentment after defeating the ausar in front of her buddies, but she’s ready to fight over this. How will you resolve the standoff?");
		//(Hard)
		else output("\n\nEven if you thought you could take on the whole mead hall and claim your rightful prize, you’d be declared a criminal for sure. Fighting is out, so what’s your move?");
		//Menu Buttons
		clearMenu();
		//Action: New page. Continue with following text, "Insist."
		addButton(0,"Insist",insistOnCoochFucksSyri,undefined,"Insist","Hey, who’s the winner here? You can still make this work.");
		//Action: New Page. Continue with part 4, "Give Butt."
		addButton(1,"Give Butt",giveHerYerButt,undefined,"Give Butt","She can change targets if it’s that important.")
	}
}

//[Keep Going]
//Processing: If PC attitude is Nice, change it 3(?) points toward Mischievous.//
public function syriVagFuckKeepGoing():void
{
	clearOutput();
	showSyri(true);
	author("FireDrops");
	pc.addMischievous(3);
	output("The whole point of betting your bodies on the hologame was to settle who would lead the post-match fucking. If you give in now, Syri will think that her begging “puppy eyes” trump your mad skills. Though tempted, you know better than to erode your advantage.");
	output("\n\nSo you keep up the assault on her willpower, simultaneously stroking her buttocks and the base of her fluffy tail – still wagging furiously – with your right hand, fondling her laden ballsack with your left, and suckling on a sweet breast with your [pc.lips]. Eager moans testify to the effectiveness of your technique.");
	output("\n\n<i>“Stop it, please. It’s too dangerous to take me in there,”</i> she whimpers.");
	output("\n\nSomeone in the crowd – no telling who with your face buried in Syri’s DD chest – coughs and says, <i>“There’s a condom dispenser in the toilet.”</i>");
	output("\n\nYou run for the restroom so fast you expect to hear a crash of thunder. When you return to the main hall, Syri is vainly attempting to cover her nakedness. With her melon-sized rack and her eight-inch dick at full mast, neither hand can conceal her assets. Luckily she is too busy glaring at the other bar patrons to catch the silly grin you get from seeing your lover on display.");
	output("\n\nYou manage to compose your face as you weave your way back to the gaming area; when you are within arm’s reach, you show her the condom and ask if she’s ready yet.");
	output("\n\n<i>“Don’t,”</i> the embarrassed dog-girl murmurs.");
	output("\n\nSomething moves in the lower edge of your vision, and you glance down to see the hand obscuring Syri’s cock: her forefinger is rubbing its narrow tip. Has she been keeping herself hard for you?");
	output("\n\nAt the same moment, Burt the bartender surprisingly joins your cause: <i>“Go on, Syri, we all know you’re sweet on [pc.name].”</i> His comment starts a rumble from the spectators, who begin an unimaginative but irresistible chant: <i>“Do it!... Do it!... Do it!...”</i>");
	//BUTT FUCK! BUTT FUCK! BUTT FUCK!
	output("\n\n<i>“Okay, damn it!”</i> the naked gamer yells.");
	if(40 + pc.intelligence() >= rand(100) + 1)
	output("\n\nYou’ve learned to read Syri’s moods, and there are clues in her stance and the point of her ears: underneath any resentment she is also... proud? You think she might be excited to have a lover who will stand up to her.");
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
	showSyri(true);
	author("FireDrops");
	pc.addHard(3);
	output("You need to settle things down, and fast, so you raise your open hands in a gesture of nonaggression. <i>“Let’s not get crazy over a miscommunication,”</i> you say. <i>“I just didn’t think it was such a big deal to expect sex after a sex bet. Male plug, female receptacle. Nothing fancy.”</i>");
	output("\n\nSyri appears unmoved – probably it didn’t help to imply that she’s insane – but the body language of the other patrons shifts. They have been expecting a show, after all. Maybe if you can sway them....");
	output("\n\n<i>“You were the one who brought ‘pups’ into this whole thing,”</i> you rationalize. <i>“I can totally understand why this is the wrong place and time to start a ");
	//(if PC's race is half ausar or more) litter
	if(pc.isAusar()) output("litter");
	else output("family");
	output(". So why don’t we just ask, does anybody here have a condom handy?”</i>");
	output("\n\nA skinny male zil in the crowd immediately volunteers, <i>“I will get one.”</i>");
	output("\n\n<i>“Izzy, you traitor!”</i> Syri shouts at the wasp-boy’s back as he disappears into the restroom. Less than thirty seconds later he emerges holding a small, shiny object. Burt must keep a dispenser in there.");
	output("\n\n<i>“Don’t you dare,”</i> the angry dog-girl yells, <i>“or I’ll pound your butt clear across this damn jungle.”</i>");
	output("\n\n<i>“You have beaten me many times, Syri,”</i> the striped alien explains calmly, <i>“ and my butt is yours whenever you wish to ask for it. But now this one has defeated you in your chosen battle, and so your penis must be " + pc.mf("his","hers") + ".”</i> He holds out the condom packet.");
	output("\n\nYou quickly add your own endorsement to this plan: you and Syri can have your fuck and it never has to leave this room. Pretty soon it becomes clear that the mood in the gallery has indeed turned in your favor. With your opponent’s most powerful objection nullified, several watchers mutter that she ought to pay up and one calls for her to <i>“take that cunt like a man.”</i> She doesn’t give in right away, but her tail sinks lower and lower between her legs.");
	//(PC is Hard)
	if(pc.isAss()) output("\n\nIf she had submitted from the start it wouldn’t have to be this way, but hopefully she’s learned a lesson about making wagers with you. Your own arousal grows with her humiliation now that you have won this little contest.");
	//(else)
	else output("\n\nYou’re sorry to see her shamed publicly, but not enough to sacrifice the prize you’ve earned. You console yourself by imagining the lewd acts she’ll perform beneath you, and your arousal builds once again.");
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
	showSyri(true);
	author("FireDrops");
	
	var x:int = pc.cuntThatFits(chars["SYRI"].cockVolume(0));
	if(x < 0) x = rand(pc.totalVaginas());
	
	output("Syri snatches the offered prophylactic. As she hops onto a table to unroll it, you find yourself with nothing to do beyond fingering your [pc.vagina " + x + "]");
	if(pc.hasCock()) output(" and stroking your [pc.biggestCock]");
	output(".");
	output("\n\nThe nanomesh wrapper expands comfortably over your ");
	//(FWB) lover's
	if(syriFriendsWithBenefits()) output("lover’s");
	else output("conquest’s");
	output(" canine endowment. She fiddles briefly with the leading edge before pulling it tight around her bright red knot; the elastic material accommodates the bulge while still hugging her shaft. She looks up and remarks, <i>“If that doesn’t hold it in, nothing will. I guess it’s your show now.”</i>");

	//Variation 2A: rear genitalia/taur PC
	if(pc.isTaur())
	{
		//(if height <= 60)
		if(pc.tallness <= 60)
		{
			output("\n\nYou enjoy the view of the dog-girl’s package, but your [pc.legOrLegs] just");
			if(pc.legCount == 1) output(" isn’t");
			else output(" aren’t");
			output(" long enough to comfortably reach her on the table, so you ask her to sit on a plastiform chair instead. Her distaste is obvious as she positions herself to be ridden: <i>“Crap, this thing’s sticky. Do you know what people have been doing on here?”</i>");
			output("\n\n<i>“Fucking?”</i> you ask as you present your rear end.");
		}
		//(else > 60)
		else
		{
			output("\n\nYou ask the dog-girl to scoot right up to the edge of her table: her dick should line up reasonably well with your [pc.vagina " + x + "]. As you turn around to present yourself, you warn her not to go sticking it in your asshole “by mistake.”");
			output("\n\n<i>“Yeah, yeah, just get it over with. You know, I’m pretty well hung, but you’re just a prick,”</i> she grouches.");
		}
		output("\n\nYour angle still isn’t 100% perfect, but your pussy is wet enough and you don’t think you can do better without the ");
		if(syriFriendsWithBenefits()) output("reluctant");
		else output("sullen");
		output(" ausar’s cooperation. Without further ado you press yourself backward. You relish the feel as the tapered canine glans pushes aside your folds; about halfway down you bump against Syri’s thighs, prompting her to open her legs farther. Centimeter by centimeter, you feed her hot-blooded member into your cunt. Once you reach her knot, already half swollen, you give your hips a wiggle to make sure you’re fully seated and let out a contented sigh.");
		//Processing: PC is penetrated.//
		pc.cuntChange(x,chars["SYRI"].cockVolume(0),true,true,false);
		output("\n\nFor a moment it looks like that will be all that happens. You rock yourself forward and back again, twice, but Syri sits completely motionless under you. Impatient, you turn around and ask when she’s going to start humping.");
		output("\n\n<i>“I thought </i>you<i> wanted to fuck </i>me<i>. I’m not stopping you,”</i> she retorts.");
		output("\n\nSo she’s still playing upset about your little argument, is she? Well, you didn’t go through all that fuss just to get a dildo – even one that feels so hot, thick, and alive as it spreads your slick walls. You want a hard screw with a high energy ausar, and you quickly devise a plan to restore her fighting spirit.");
		output("\n\n<i>“I was promised a ride,”</i> you say casually. <i>“But I guess that big dick of yours is too much for a little bitch like you to handle.”</i>");
		output("\n\nSyri scowls. <i>“What did you just say to me?!”</i>");
		output("\n\n<i>“I said screw me, bitch,”</i> you reply");
		if(syriFriendsWithBenefits()) output(" with a wink over your shoulder");
		output(". <i>“It’s my new name for you. You know, with the whole dog thing going on, and your big tits, the way you lose at video games. Or did you mean the part where I called you a weak-ass little girl who can’t do a real man’s job, you probably don’t even know–”</i>");

		output("\n\n<i>“FUCK you!”</i> she cries while shoving at least five of her inches into your twat. <i>“You want fucking, huh? Fuck YOU!”</i> On this last word she not only thrusts but pulls on your [pc.hips], spearing her wolfhood into your [pc.vagina " + x + "] and battering the knot against your gates.");
		output("\n\nYou laugh as the naked ausar beneath you responds to your power play. She hooks her legs around yours for better leverage and pounds as far up as she can reach. You only yell for more, ");
		//(FWB and not Hard)
		if(syriFriendsWithBenefits() && !pc.isAss()) output("reassuring yourself that she understands your game when you glimpse her grinning eyes. She");
		else output("jeering at her until she");
		output(" pulls her body up onto your back; now she’s resting her weight atop your torso, properly mounted to ravish your [pc.vagina " + x + "]. The difference is explosive: Syri pumps her unencumbered hips in rapid strokes that slam into you faster than you can count. If she had a blunter tool this jackhammer pace might be overwhelming, but her steel-hard rod slides smoothly through your twat thanks to the narrow tip. It is the other end of her equipment that hurts you – in the nicest possible way – when her thick red knot crashes into your");
		if(pc.hasClit()) output(" [pc.clit]");
		else output(" your sensitive walls");
		output(" several times each second. Every strike sends a shower of sparks up your nerves, churning your pussy around her cock and robbing you of breath.");
		output("\n\nAs best you can under this assault, you continue to antagonize the gamer by ordering her to go faster and reminding her that you are the winner around here. The two of you are shouting and cursing at each other when suddenly you feel her pull back for one ultimate thrust. Perhaps you shouldn’t be surprised that she came so easily going doggie style – but still it catches you unaware. For a moment the frantic action stops. You swear you can see the expression of each witness frozen in time. Then you and Syri are shouting <i>“Oohh!”</i> in synchrony as you both explode in pleasure.");

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
		output(" Yet for all the energy in your mutual climax, it quickly vanishes into ragged, deep breaths as you desperately try to replace all the oxygen you just spent. The video gamer has fallen against your back, her lack of motion contributing to your own rapid decline. You’re not even sure if she can walk right now.");
		output("\n\nThe occasional aftershock in your pussy squishes the full sack of spooge occupying your nethers, and you briefly toy with the idea of squeezing until it bursts – what would Syri think of that? – but even the cheap brands are tougher than they look these days. So you just wait for her stand up to pull herself out. She does so quite gently");
		if(pc.hasClit()) output(", brushing your sensitized [pc.clit]");
		output(" as she carefully extricates the used condom. You gasp, but her touch is not a prelude to any more action.");
	}
	//Variation 2B: else (front-to-front sex)
	else
	{
		output("\n\nYou clamber onto the tabletop with Syri, praying that Burt’s furniture will hold up despite its seedy condition. You assume a position hovering just above her groin, and then you rub her length ");
		//(if PC has exactly 1 vagina)
		if(pc.vaginaTotal() == 1)
		{
			output("up and down your [pc.vagina " + x + "], working you");
			if(pc.hasClit()) output("r [pc.clit]");
			output(" into a frenzy before taking the plunge.");
		}
		//(else more)
		else
		{
			output("between each pair of labia, stimulating");
			if(pc.hasClit()) output(" [pc.eachClit]");
			else output(" yourself");
			output(" before lining up her pointed tip with your chosen [pc.vagina " + x + "].");
		}
		output("\n\nYou ease yourself down the length of the ausar gamer’s big cock with a long sigh. Her fat manhood radiates a nearly burning heat inside your cunt. When you reach the swelling knot at its base, you playfully grind your pelvis to deliver a squelching nether kiss to Syri’s bulge.");
		//Processing: PC is penetrated.//
		pc.cuntChange(x,chars["SYRI"].cockVolume(0),true,true,false);
		output("\n\nThen you rise up until you barely sense her tip still inside you. You repeat the maneuver once more while peering closely at the wolf-woman’s eyes. You sense hints of her roiling emotions, but she’s keeping it all under wraps. Even her tail is nearly motionless, though her ears twitch from the effort. Impatient, you ask when she’s going to start humping.");
		output("\n\n<i>“I thought </i>you<i> wanted to fuck </i>me<i>. I’m not stopping you,”</i> she retorts.");
		output("\n\nSo she’s still playing upset about your little argument, is she? Well, you didn’t go through all that fuss just to get a dildo – even one that feels so hot, thick, and alive as it spreads your walls. You want a hard screw with a high energy ausar, and you quickly devise a plan to restore her fighting spirit.");
		output("\n\n<i>“I was promised a ride,”</i> you say casually. <i>“But I guess that big dick of yours is too much for a little bitch like you to handle.”</i>");
		output("\n\nSyri scowls. <i>“What did you just say to me?!”</i>");
		output("\n\n<i>“I said screw me, bitch,”</i> you reply");
		//(FWB and not Hard)
		if(syriFriendsWithBenefits() && !pc.isAss()) output(" with a wink your audience can’t see");
		output(". <i>“It’s my new name for you. You know, with the whole dog thing going on, and your big tits, the way you lose at video games. Or did you mean the part where I called you a weak-ass little girl who can’t do a real man’s job, you probably don’t even know–”</i>");
		output("\n\n<i>“FUCK you!”</i> she cries while shoving more than half her prick into your twat. <i>“You want fucking, huh? Fuck YOU!”</i> On this last word she not only thrusts but pulls on your [pc.hips], spearing her wolfhood into your [pc.vagina " + x + "] and battering the knot against your gates.");
		output("\n\nYou laugh as the naked ausar beneath you responds to your power game");
		//(FWB and not Hard)
		if(syriFriendsWithBenefits() && !pc.isAss()) output(" – she reassures you that she understands your ploy by returning your wink");
		output(". She’s doing her best to use your body as a cock sleeve, fiercely gripping your [pc.skinFurScales] to jerk you up and down. You will yourself to relax your [pc.legOrLegs] and surrender as she leads your tryst from below. Syri chooses a medium pace at first, wary of tugging you too deeply onto her expanding knot; instead, the bright reddish bulge delightfully grazes your");
		if(pc.hasClit()) output(" [pc.clit]");
		else output(" sensitive walls");
		output(" on each stroke. With Syri handling the vertical motion well enough on her own, you begin to gyrate in circles that press her thick dog prick against every ridge and crevice inside your [pc.vagina " + x + "].");
		output("\n\nYou continue to antagonize the gamer by ordering her to go faster and reminding her that you are the winner around here. The two of you are shouting and cursing at each other, and the");
		if (syriFriendsWithBenefits()) output(" ex-military");
		output(" wolf-woman impresses you with the breadth of her dirty vocabulary. Despite the resemblance to a brawl, there’s no danger of slipping off her wolf-cock because her insistent hands shorten the stroke as the action accelerates. Before long she’s withdrawing just the second half of her eight inches while the first four constantly slide across a very excited bundle of nerves inside your cunt. Her steel-hard rod drives you to a wild plateau: an invisible line that you don’t know has been crossed until you are shouting out the last molecules of your breath and sucking in more.");
		output("\n\nSyri continues pumping until a new source of heat suddenly flows into your pussy in the middle of your fourth <i>“Yes!”</i> In the confusion of orgasm, nearly two seconds tick away before you work out that the ausar’s big cock is filling you with dog-girl seed – and with that realization a second climax blossoms atop the first.");
		output("\n\nThe double dose of bliss fills you with keen awareness of every nuance of your body");
		if(pc.hasClit()) output(", as if even your fingertips were suddenly as sensitive as your [pc.clits]");
		output(". You try to wiggle them to increase your sensation, but it seems your body is no longer under your own command, responding only to Syri’s thrusts. She keeps fucking in powerful, if somewhat ragged, strokes while her canine testes empty themselves into your sucking twat. Into the condom, actually, but the difference is trivial right now.");
		output("\n\nEventually the busty slut beneath you shudders to a halt. You push yourself off her rod, barely clearing the swollen sack of cum on its end, and stagger over to the gaming couch. Your [pc.vagina " + x + "] is still twitching sporadically as your mind clears, no doubt hoping to reconnect with a certain wolfish wang.");
		output("\n\nIf it’s any help, Syri appears to be recovering as slowly as you. <i>“Damn. That was... uh, not half bad,”</i> she breathes.");

		//if (pc.hasCock = True) 
		if(pc.hasCock())
		{
			output(" Suddenly, she ");
			if(syriFriendsWithBenefits()) output("giggles");
			else output("frowns");
			output(". <i>“Looks like I’m not the only one who needed a rubber,”</i> she remarks, indicating the [pc.cum] ");
			if(pc.cumQ() < 25) output("pooling on her torso");
			else if(pc.cumQ() < 1000) output("spread across her stomach and boobs");
			else output("coating her chest and even dripping off her chin");
			output(". <i>“You better not give me any crap about it being good for my skin.”</i>");
		}
	}
	processTime(15);
	pc.orgasm();
	chars["SYRI"].orgasm();
	//pc.loadInCunt(chars["SYRI"],x);
	IncrementFlag("FUCKED_SYRI_COUNT");
	clearMenu();
	addButton(0,"Next",syriVagSexWrapupLikeHERDICKOOOOHSNAP);
	//merge at part 3
}

//Part 3: Vaginal sex wrap up
public function syriVagSexWrapupLikeHERDICKOOOOHSNAP():void
{
	clearOutput();
	showSyri(true);
	author("FireDrops");
	output("The bystanders disperse to their former pursuits as it becomes clear the only further action will be wiping up and re-donning clothes.");
	//(FWB)
	if(syriFriendsWithBenefits()) 
	{
		output(" Just before you turn to leave, Syri grabs your elbow. Her smile looks just a little giddy with the afterglow of her orgasm.");
		if(40 + pc.intelligence() >= rand(100) + 1) output("\n\n<i>“Thanks for, um... showing me that weakness in the apartment balcony sniper vantage. With skills like that, you’re welcome to play with me any time.”</i>");
		else output("\n\nShe opens her mouth but bites back her original thought. Instead she tells you, <i>“Just watch your back, [pc.name]. I want your ass more than ever now.”</i>");
	}
	//(not FWB)
	else
	{
		output("\n\nOnce you are both cleaned up, Syri turns to confront you.");
		output("\n\n<i>“Listen, Steele,”</i> she says, <i>“I may have said some things.... I just want you to know that you don’t have to worry about me coming after you. </i>Yet<i>. But you’ve got to stop thinking with your gonads or somebody with less patience will give you a thrashing.”</i>");
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
	showSyri(true);
	author("FireDrops");
	//(FWB)
	if(syriFriendsWithBenefits()) output("You decide not to risk the camaraderie you share with Syri, no matter how much your [pc.vagina] tingles at the thought of her proud dick filling it to the hilt. Instead");
	//(not FWB)
	else output("Syri’s sizable pecker stands proudly in defiance of this interruption – perhaps she’s not as angry as she sounds. Still, you won’t test her. Smiling, you ogle her bountiful tits and spend a few seconds frigging your [pc.vagina] to ease its disappointment.\n\nYou try to thaw the mood by telling her how cute she is when she’s angry, but the ausar’s scowl doesn’t slide away until");
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

	output("\n\n<i>“Please,”</i> you beg, <i>“fuck me. Fuck my cunt.”</i>");

	output("\n\nSyri leans in close, squashing two double-D breasts against your [pc.skinFurScales]. She whispers in your ear, <i>“Not a chance, Steele. You gave me the go signal; there’s no calling back the mission now.”</i>");
	output("\n\nThe pressure nearly knocks you off your feet as her ministrations move upwards once more. It may not be a spa treatment, but on this pass she starts to rub more of her torso against yours. You jump as her steely cock contacts your buttocks. <i>“Soon,”</i> she promises, <i>“just a little more work back here.”</i>");
	output("\n\n<i>“More,”</i> you urge. <i>“I need more.”</i>");

	output("\n\nAn evil-sounding chuckle is the only response to your plea. The massage has turned into a one-handed affair working down your spine. It soon becomes apparent where her other hand has gone as one... two squirts of fresh pre-cum fall onto your crack. Ausar fingers push it between your cheeks, spreading it around your ringpiece. Somehow you’ve gone from being the winner to being the bottom in this pair, although with your body leaking hormones and ");
	if(pc.hasCock()) output("pre-cum");
	else output("[pc.girlCum]");
	output(" you can’t pinpoint just why you ever wanted anything else. All your nerves hum in readiness to explode. Then she pulls back and speaks for the gallery’s benefit: <i>“And now you’re going to get what you came for.”</i> The onlookers cheer her announcement and the sharp slap that darkens your asscheek.");

	output("\n\nWith a deep breath, you lean against a wall. From behind, Syri scoops freely flowing girlspunk out of your pussy lips. You attempt to relieve your lust on her hand, but your own wetness allows her to slip free. She adds a couple handfuls of your homemade lube to the sticky mess on your [pc.butt], using her finger to push deep inside. Evidently the self-stimulation has brought the ausar close to the brink, because she works hard and fast to spread your dark passage: so fast that you whimper when you feel her thick rod slipping up your crack. Surely you haven’t unclenched <i>that</i> much!");
	output("\n\nSyri’s thrust proves that your [pc.asshole] is indeed opened well enough, at least for the pointy canine tip. You forget all protests as your long-delayed climax bursts outward from her first burning hot inch. [pc.GirlCum] streams down your [pc.legOrLegs], individual droplets flying free as your body rocks.");
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
	if(syriFriendsWithBenefits()) output("lover’s");
	else output("opponent’s");
	output(" invasion is slowed by your orgasmic clench, but she presses inexorably forward in tiny strokes timed to match your convulsions. Your awareness centers purely on the sensation of Syri’s fiery dog cock as inch after inch continues to spear into your [pc.butt]. Your ecstasy surges with each advance.");
	//Processing: PC is penetrated.//
	pc.buttChange(chars["SYRI"].cockVolume(0),true,true,false);
	output("\n\nPowerful hands tug at your [pc.hips], forcing you ever farther onto that enormous dong. Finally, you detect a wave of pressure surging up Syri’s pole to erupt in a white-hot fountain. The triumphant ausar howls as her own thick spunk eases the last millimeters of her throbbing dick to fully ram her knot against your straining pucker.");

	//From Savin's original Scene + tweaks
	output("\n\nMinutes pass, leaving you heaving and groaning and pinned to the wall as Syri collapses behind you, breasts pressing hard into your back. Her cock twitches in your rectum, little trickles of her cooling seed dribbling out around her engorged knot, just outside your worn hole.");
	output("\n\n<i>“See, that wasn’t so bad, Steele,”</i> she pants. <i>“You don’t need a dick up your cunny to get a good cum, after all.”</i>");
	output("\n\nEasy for her to say, you groan. You grab a few napkins to wipe up and then re-gather your [pc.gear].");
	//Processing:
	processTime(15);
	pc.orgasm();
	chars["SYRI"].orgasm();
	//Set early morning encounter if applicable
	//Increase affection?
	pc.loadInAss(chars["SYRI"]);
	IncrementFlag("FUCKED_SYRI_COUNT");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Getting Syri’s Panties
//Syri surprise with epic lingerie and some sex toys. PC keeps her panties afterwards.
//Small %chance to play when PC lands on Mhen’ga/Uveto while Syri’s there. Must have Fuckbuddy Syri, naturally.
public function gettingSyrisPanties():void
{
	clearOutput();
	showSyri(true);
	output("You’ve barely finished parking and gathering your equipment for your coming expedition when you hear a resounding ‘THUNK’ on the side of your ship, and your console lights up with an impact alert. Curious, you flip on one of the external cameras, and find a familiar raven-haired ausar standing outside your airlock, her long military coat wrapped tight around herself.");
	output("\n\nSeeing the camera swivel her way, Syri smiles up at it and waves.");
	output("\n\nYou hop out of your captain’s seat and head over to the airlock, cycling it open for your long-absent lover. The moment the outer lock makes its final loud, droning hiss and slides aside, you’re greeted by a wolfish smile and wagging tail. <i>“Heyya, Steele,”</i> Syri smiles, taking a step forwards. <i>“Long time no see.”</i>");
	output("\n\nIt can’t have been <i>that</i> long, but you have to admit, you’re happy to see her anyway.");
	output("\n\n<i>“You too. Mind if I come in?”</i>");
	output("\n\n<i>“Make yourself at home,”</i> you tell her, waving the ausar babe in. She grins and enters, wrapping an arm around her coat’s waist to keep its flaps closed. Syri does indeed make herself at home, exploring the familiar surroundings of your starship");
	if(annoIsCrew()) output(", running a hand across some of Anno’s possessions scattered around the living space. She gives you an almost jealous look, though somehow you doubt it’s because of anything <i>you</i> did..");
	output(". As she walks, your eyes are naturally drawn to the swaying slip of her hips, half-hidden behind a swishing black tail. Beneath that, you happen to notice that ");
	if(getPlanetName() == "Uveto") output("despite the frigid cold of the planet below,");
	output(" Syri’s not wearing any shoes. In fact, all she’s wearing below her long coat looks like a set of tight blue fishnets that vanish up her legs.");
	output("\n\n<i>“Wish I had a ship like this,”</i> Syri chuckles, turning back to you. <i>“I don’t get out into space nearly enough anymore.”</i>");
	output("\n\nAs she speaks, Syri takes a seat on the arm of your couch and beckons you over, patting the seat beside her invitingly. You join her eagerly, more and more sure you know why your favorite ravenette came to visit. Once you’re seated, Syri leans down and grabs the side of your head, leaning you into her and pressing her face ");
	if(!pc.hasHair()) output("against your cheek");
	else output("into your [pc.hair]");
	output(", drawing in a deep breath of you. <i>“Mmm, I love the way you smell, Steele... been away from me for </i>way<i> too long.”</i>");

	output("\n\nYou reach up and caress your lover’s cheek, turning her canid smell-session into a long, drawn-out kiss. She moans into your mouth, and you feel her arms falling away from her coat, wrapping around your shoulders. Your head buries into her bust instinctively, nestling into the big, soft mounds of ausar titflesh girded by a mesh of silky fishnets.");

	output("\n\nSyri breaks the kiss a moment later, stepping forward and shrugging off her coat. The heavy, faded military blues flop to the deck, revealing a body of smooth flesh, dark hair, and sexy blue lingerie covering her legs, arms, tits... and even the half-hard rod of throbbing dogflesh, its tapered tip peeking out of her baby-blue panties.");
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
	output("\n\nNow that’s an invitation you can’t refuse. You scoot up to sit on the edge of the couch and play your hands over Syri’s lube-slicked cheeks, making the horny ausar moan as your digits draw nearer and nearer to her lonely asshole. <i>“Nice and slow, now,”</i> she instructs you, wiggling her hips. <i>“Don’t want to spoil it all at once.”</i>");
	output("\n\nGrinning at her, you hook your finger through the little loop at the end of the string and draw it back until it’s a taut line of green plastic between you and Syri’s bum. Your lover moans, arching her back and flicking her tail up excitedly as you gently pull and pull the string, meeting awfully fierce resistance. <i>“Gentle...”</i> she whines between sultry moans that only make you want to go faster.");
	output("\n\nAfter a moment, you find you can’t pull the string any further: something’s straining against Syri’s asshole like a great big knot, and she’s clenching hard around it. You urge her to relax, rubbing her cheeks and whispering sweet nothings until you see her ass wink closed, then start to open, widening around something bright red and buzzing noisily. She moans, biting her lip as you pull the string a little harder.");
	output("\n\nWith a wet <i>pop,</i> the red ball finally pushes out of Syri’s butt, drooping down against her balls in a lube-covered mess. Your lover moans, unable to form words anymore as the over-sized anal bead starts vibrating on her nuts, and a second one starts to crest the rim of her hole. You can only imagine what it’s doing to her prostate, buzzing and rubbing and massaging it with every motion; you’ve got half a mind to just leave it there and let the ausar shemale cum from just the anal stimulation...");
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
	if(pc.hasCock()) addButton(1,"Fuck Ass",fuckSyrisAss,undefined,"Fuck Ass","Pull Syri’s anal bead out and pound her ass in. It’s already lubed up and stretched out for you...");
	else addDisabledButton(1,"Fuck Ass","Fuck Ass","You need a penis to fuck her ass.");
}

//Fuck Ass
//Pull Syri’s anal bead out and pound her ass in. It’s already lubed up and stretched out for you...
public function fuckSyrisAss():void
{
	clearOutput();
	showSyri(true);
	author("Savin");
	
	var x:int = pc.cockThatFits(chars["SYRI"].analCapacity() + 500);
	if(x < 0) x = rand(pc.cocks.length);
	
	output("Syri wasn’t kidding: watching her pop those buzzing anal beads out and busting a nut in her silky little outfit has gotten you more hot and bothered than a New Texan bull in a brothel. [pc.EachCock] is almost painfully rigid, demanding of attention. Or better yet, a hot, lubed-up hole to work out all your tension into.");
	output("\n\nRubbing a hand along Syri’s tight ass, you give the string of beads a final tug to pop the anchor out. Your lover moans and shivers as the last bead pops out, and you toss the chain of buzzing butt-breakers to the deck in a wet pile of cum-lube. <i>“Oh that feels better,”</i> Syri purrs, straightening up and smiling at you over her shoulder. <i>“Had those in me since about when you popped into the system... mmm, now I feel kind of empty. Think you can fill me up, Steele?”</i>");
	output("\n\nOh yeah. You lean back in the couch and pat your thigh, inviting your lover to come and get some. She saunters over and slips backwards into your lap, swinging her legs up to rest on either side of you and giving your a face-full of busy ausar tail. You laugh and bat her fluff out of the way, just enough to reach forward and pull Syri back against your chest. She moans and kisses you over her shoulder, grinding her slick ass against your [pc.cock " + x + "]. As she moves, Syri slowly slips her panties further down, getting them out of the way... and spilling more than a little of her still-hot spunk onto your own [pc.cock " + x + "], which her fingers are quick to rub in, spreading her spunk over your shaft like an extra layer of lube.");
	output("\n\nYou grab Syri’s hips to steady her, and your cock does the brunt of the work for you, stiff enough that a slight shift of your [pc.hips] brings it in line with Syri’s inviting tail-hole. She moans and bites her lip, fingers finding yours and holding on as you get positioned. <i>“Don’t hold back, Steele. I wanna feel you blowing your load deep inside!”</i>");
	output("\n\nYou start to ease Syri down, guiding her descent past the [pc.cockHead " + x + "] of your [pc.cock " + x + "]. She sucks in a sharp breath as soon as you’re starting to slide into her, but it’s nice and easy going after that, and you glide into your lover’s ample rump. Before long, Syri’s sitting flush in your lap, your [pc.cock " + x + "] buried nice and deep inside her; her own cock throbs and spurts between her legs as you rub up against her prostate just like the anal beads before you. Your lover moans and rubs back against you, trying to get every inch of your tumescent cockflesh into her ass as she can.");
	pc.cockChange();

	output("\n\nOnce you and your ausar cocksleeve are nice and comfortable, you encourage her to start moving with an affectionate slap on the ass; you feel the impact resound through her body, ending in a delightful squeeze on your [pc.cock " + x + "]. Syri just giggles and starts to move, rising on her knees before gliding back down your slick rod to settle back in your lap. Again and again she rises and falls, keeping a steady pace that soon has you both panting and moaning, holding on to each other for support as the ausar girl milks your dick with her wonderfully talented ass.");

	output("\n\nYou have to admit, Syri’s a consummate butt-slut, working anal magic on your [pc.cock " + x + "] until you’re barely holding on. She squeezes and wiggles and bounces, and for your part you just try and give as good as you get, making her moan with rekindled lust. Even so quickly after cumming, Syri’s red prick grows stiff again, and you reach around to give it a much-needed caress. She’s still nice and cum-slathered, and your hand is able to slide easily along her shaft to the same beat of her rises and falls. The two of you reek of sex by now: the heavy, musky smell of ausar-cum is thick in the air, and there’s about to be a lot more of it if the way Syri’s breathing is any indication.");
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
	showSyri(true);
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
	output("\n\nYou open wide, letting your [pc.tongue] play out across Syri’s cum-slathered rod. She gasps and moans, groping at a fishnet-clad boob as you slowly lap up all the delicious, salty ausar-spunk off her cock. The more of her you clean off, the more you slip into your mouth to enjoy the feeling of half-hard dogflesh throbbing between your lips. By the time you’ve worked your way down to Syri’s base, feeling her balls pressing against your chin and her tip battering the back of your throat, you feel her starting to recover from her first climax: before long she’s nice and hard, moaning as your tongue lavishes her sensitive cockflesh with love.");
	output("\n\n<i>“Got it nice and clean for me?”</i> she murmurs, giving you a gentle push back against the couch and off her now-gleaming dick. ");
	if(x >= 0) output("As she speaks, Syri grabs her fallen coat and reaches into its pocket, tearing open a bright-pink condom pack and stretching its contents out around her spit-slick shaft. ");
	output("<i>“Good " + pc.mf("boy","girl") + ". Now let me give you your reward!”</i>");

	output("\n\nSyri leaps onto you with a feral growl, pushing your [pc.legOrLegs] up over " + (pc.legCount == 1 ? "one of " : "") + "her shoulders and burying a pair of fingers straight into your [pc.vagOrAss " + x + "]. You groan and collapse into the cushions, biting your lip as Syri roughly penetrates you, spreading your hole wide open. <i>“That’s right. Moan for me, Steele,”</i> she grins, thrusting her fur-clad digits deep in again and again until you’re desperately trying not to scream in pleasure.");
	output("\n\nAs quickly as she started, Syri yanks her fingers out of you and flops her spit-slick dick onto your thigh, edging it towards your [pc.vagOrAss " + x + "]. All you can do is wrap your [pc.legOrLegs] around Syri’s waist and guide her in. As her hips edge into you, the rest of Syri leans in and kisses you fiercely, thrusting her tongue into your mouth a moment before her throbbing cock penetrates your [pc.vagOrAss " + x + "].");
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

	output("\n\nA moment later, and you feel a flood of hot, wet heat ");
	if(x < 0) output("flowing into your [pc.vagOrAss " + x + "]");
	else output("forming a tight bubble of wrapped-up puppy spunk inside your pussy");
	output(", and that’s enough to buckle you over the edge and into orgasm as well. Syri moans, bucking her hips against your [pc.butt] and filling your hole with a second heaping of ausar spunk. The air hangs heavily with the smells of sex and alien sweat, a heady odor that only elevates your own pleasure.");
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
	showSyri(true);
	author("Savin");
	//In 1st Time:
	if(!pc.hasKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room."))
	{
		output("You wake up a couple hours later, at once tired and relaxed. The blanket you’d wrapped around you and your lover now clings to you and you alone, tucked in under your arms and [pc.legOrLegs]. You yawn and stand up, happy to see Syri took the time to clean up after herself before she left.");
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

//This scene will automatically occur upon walking into Burt’s mead hall during the morning if the PC is under the effects of Omega Oil (probably “Fuck Fever”). Requires Syri’s fuckbuddy status.
public function syriButtreamHeatButtPCButtsInTheButtWithAButtDIDISAYBUTTYET():void
{
	showSyri(true);
	author("HugsAlright");
	output("\n\n<b>This is terrible.</b>");
	output("\n\nThe ache you’re feeling for a good reaming is unbearable. The heat flushing your body is inescapable. Luckily, you’re in just the right place to find what you need to sate your desires, because right there, sitting");
	if(syriAtFreeezer()) output(" in the common room");
	else output(" at the bar");
	output(" is the answer to all your problems: Syri.");
	if(silly) output(" Well, her pants hold the answer to all your problems, at least.");
	output(" You take a deep breath and start to walk towards the wolfy shemale, time seeming to slow as thoughts of her fucking your ass for hours on end cloud your mind. Pulling yourself from your lust-induced trance, you find yourself but a few steps from Syri, rivulets of sweat tickling your [pc.skinFurScales].");
	output("\n\nYou greet the ausar with a <i>“Hey”</i> and she’s quick to turn around, the gentle smile on her face letting you know she’s happy to see you.");
	output("\n\n<i>“What’s up, [pc.name]?”</i>");
	output("\n\nYou grab her furry wrist and tell the butt-lover you need her help with something. She takes a good look at your flushed face and hungry gaze and grins. <i>“I don’t know, Steele,”</i> she begins, taking a drink, <i>“I’m pretty busy here, if you couldn’t tell.”</i> You roll your eyes and groan in response before giving Syri’s fuzzy arm a rough yank, pulling her up off her");
	if(syriAtFreeezer()) output(" seat");
	else output(" stool");
	output(".");
	if(pc.isAss()) output(" She’s coming with you, whether she and her knotty dick like it or not.");
	output(" <i>“Hey, easy, [pc.name],”</i> the temptress protests, <i>“I was gonna go with you anyway.”</i> No time for small talk; you walk as fast as you can out the bar with Syri in tow.");
	processTime(10);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",syriButtreamHeatButtPCButtsInTheButtWithAButtDIDISAYBUTTYET2);
}

public function syriButtreamHeatButtPCButtsInTheButtWithAButtDIDISAYBUTTYET2():void
{
	clearOutput();
	showSyri(true);
	author("HugsAlright");
	moveTo("SHIP INTERIOR");
	output("All the way back to your ship, the burning desire to have Syri spread your pucker wide open, to feel her throbbing knot take you, pushes you to move fast.");
	if(pc.hasCock() && !pc.isCrotchExposed()) output(" You can already feel your [pc.cocks] straining against your [pc.underGarment].");
	output(" Holy shit, when did it get so hot in this jungle? Your goal is so close, the sanctity of your bed just a minute away. Lustful thoughts continue to batter your mind as you make your way through the airlock, letting go of Syri’s wrist as you hurry over towards your bed. Holy hell, it’s even hotter on your own ship.");
	output("\n\n<i>“So, captain, now that you’ve got me, how do you want me?”</i> your ausar companion asks, her sultry voice causing you to turn around to face her. Her hip is cocked against a furry hand, a smirk on her face, clearly awaiting any proposal from you. You don’t really have an answer for her, all you can think about is this unbearable heat.");
	//notNude:
	if(!pc.isAssExposed()) output("\n\nBarely thinking, you start to pull your [pc.gear] off, Syri happily watching you while you do so, her tail wagging faster than it was when you got to the ship. As soon as you’re bare, you throw yourself onto the bed, putting your face into your pillows and sticking your [pc.ass] up in the air for your lover to see.");
	else output("\n\nBarely thinking, you throw yourself onto the bed, putting your face into your pillows and sticking your [pc.ass] up in the air for your lover to see.");
	output(" You turn back to see Syri licking her lips at what you’ve presented her with, ready to get her clawed hands all over your butt.");
	output("\n\nThere’s a problem though: she isn’t fucking you yet, and you need her to, <i>now</i>. <i>“FUCK ME!”</i> you scream, trying to get the she-wolf to mount you as soon as possible. She doesn’t do anything though, she just stand there stroking her chin and staring at your butt.");
	output("\n\n<i>“Sorry, what was that? I couldn’t hear you,”</i> she says, drawing closer and angling one of her big, fluffy ears towards you.");
	output("\n\nLooks like you’re going to have to play her game to get what you want. You scream even louder this time, <i>“FUCK ME!”</i>");
	output("\n\nShe smiles at you and steps closer. Not too long after, you feel a furry hand caress one of your lower cheeks, making you wince for a moment, expecting something to penetrate you. Instead, you’re greeted by the ‘whap’ of clothes hitting the ground, followed by a rather tender voice from your raven-haired lover, <i>“You really need this, huh Steele?”</i> You feel the mattress shift as Syri steps onto the bed, kneeling behind you while another furry hand gropes your more neglected ass cheek. Little whimpers escape your lips as your [pc.butt] is kneaded in the ausar girl’s dextrous grip, like dough in her hands. <i>“You didn’t go and put yourself into a heat just for me, did you?”</i> she questions, spreading your needy ass so she can gaze upon your [pc.asshole]. You feel a furry thumb brush across your pucker. The sensation of her downy digit on your asshole makes your breath shudder, your [pc.chest] starting to heave as pressure builds on your pucker.");
	output("\n\nNot more than a moment later her digit pops into you, easily wriggling around inside your [pc.asshole]. You’re unable to find any words and can only moan softly under the immense and sudden pleasure of Syri’s prodding thumb. <i>“I guess it doesn’t matter whether you did or not,”</i> she says, gently thrusting her finger in and out of you, <i>“I’m just glad you came to me.”</i> With that, the ausar removes her digit from your supple hole, leaving you to whimper at the inescapable emptiness she’s left you with. Syri giggles at your desperation and reaches down to give her [syri.cockNoun] a few strokes before plopping it down into the crack of your ass. You instinctively start to roll your hips, trying to get her cock to enter your slightly-gaping pucker, whining as you do so. She quickly moves her hands, grabbing at your [pc.hips] to keep you still.");
	output("\n\nYour lover chuckles again, <i>“C’mon, Steele, tell me you </i>need<i> it.”</i>");
	output("\n\nAt this point, you’re willing to do anything to feed your perversions. <i>“I need it,”</i> you manage to whimper.");
	output("\n\n<i>“You’re gonna have to say it louder than that,”</i> the dommy-wolf responds as she starts to rock her hips back and forth, dragging her [syri.cock] through the valley of your lower cheeks, <i>“Beg for it.”</i>");
	output("\n\nYour fists clench in response to her motions. <i>“I NEED YOUR COCK!”</i> you scream, drool beginning to soak into your pillows as your lust for dick overtakes any sort of control you had.");
	output("\n\nSyri smirks and pulls back, just enough that her [syri.cockHead] presses againt your [pc.asshole], apparently pleased with your declaration. You start to whimper as your lover pushes into you, pressure slowly building against your pucker. Your eyes roll back and a long, satisfied groan forces its way out of your lungs as her pointed cockhead spreads your [pc.asshole] wide, her crown slipping into you. You cry out in pleasure; it all feels too good, but you need more. With the intent of getting this wolf-dick into you faster, you start to push back against her [syri.hips], moaning all the louder as her deep-red cock is sheathed inside you.");
	if(pc.hasCock()) 
	{
		output(" Your own [pc.cocks] jump");
		if(pc.cockTotal() == 1) output("s");
		output(" in response when Syri’s member brushes over your prostate, a small pool of pre forming on your sheets.");
	}
	pc.buttChange(syri.cockVolume(0));
	output("\n\nSyri’s [syri.cock] pulses inside you as you lie there panting from her relentless penetration, still craving more, but unable to move yourself. Your lover knows what you want; she tightens her grip on your hips and start to pull herself out of you, setting you moaning again. Veiny ausar dick glides along your inner walls, an experience that is only made more pleasurable by the burning heat you’re in. You even hear Syri’s breath start to stutter as she succumbs to her own lust. The glans of Syri’s cock reach your pucker once more, holding open for less than a second before she starts to thrust back into you. You don’t think it’s possible, but her [syri.cockNounSimple] feels even better going in the second time. Something about having your hungers sated, giving into such base needs just feels so wonderful, and you want more.");
	output("\n\n<i>“F-faster,”</i> you manage to blurt out under under the weight of Syri’s steady reaming.");
	output("\n\nA second later you feel a furry hand slap against your [pc.butt], <i>“I’m getting to it.”</i> The pang of pain from her rough spank meshes strangely with the pleasure you’re experiencing, but makes you moan all the same.");
	output("\n\nTrue to her word, Syri gets to it: her hips start rolling at a faster pace, [syri.cock] moving in and out of your [pc.asshole] until you’re clawing at the sheets and screaming with delight into your pillows. Her velveteen hands slide their way from your hips to your sides in an attempt to get a better grip on you as she speeds up. Syri’s forceful grunting is becoming loud enough to overpower your moaning at this point, her once slow reaming turning into a series of unending thrusts, long and hard. Your body rocks back and forth with each movement of your lover’s hips, each inward thrust eliciting spine-tingling cries of joy from the both of you.");
	output("\n\nYour mind is all but lost to your desires, drool pooling onto the fabric your head lies on, your eyes shut in bliss, and your [pc.butts] ");
	if(pc.buttRating() > 3) output("quaking");
	else output("jiggling");
	output(" every time Syri rams her cock into you. You’re almost at the point where you wouldn’t notice if the ausar were to knot you... almost; a particularly loud grunt from the wolfy mistress accentuates the sudden pressure placed on your already punished behind. All you can do is let out a silent scream of delight and discomfort as Syri’s [syri.knot] starts to force its way into you, spreading your gaping pucker even wider until the fist-sized bulb of cockflesh pops into you, its sheer size leaving you babbling incoherently. Your body goes limp as Syri has her way with your ass, battering your [pc.asshole], raining down on your poor hole with an endless barrage of jackhammering-thrusts. You can do nothing but sit there and take it with a wanton smile, kept in place by Syri’s knot.");
	output("\n\nSyri tries to speak, but <i>“H-how do you l-like tha-”</i> is as far as she gets before her voice breaks into a moan. She grabs your sides and pulls you back, holding you down on her [syri.cock] as it pulses and spasms inside of you, her [syri.balls] emptying. Her hips give a few last jerky thrusts as her creamy load is pumped into you while orgasm overtakes her body, grunting and groaning. The sudden heat of her [syri.cumNoun] flooding your depths makes you gasp and whimper; it’s a completely different feeling than the heat you were already experiencing, and all too much for your pleasure-ridden mind. Your body tenses and you let out a groan of relief, [pc.asshole] clamping down tight around Syri’s cum-leaking cock while she’s still filling you.");
	if(pc.hasCock()) 
	{
		output(" Along with Syri’s, your [pc.cocks] cum");
		if(pc.cockTotal() == 1) output("s");
		output(", spasming as ");
		if(pc.cockTotal() == 1) output("it");
		else output("they");
		output(" soak");
		if(pc.cockTotal() == 1) output("s");
		output(" your sheets with [pc.cum].");
	}
	if(pc.hasVagina())
	{
		output(" Your [pc.vaginas] tighten");
		if(pc.cockTotal() == 1) output("s");
		output(" around the cock that isn’t there, already spilling [pc.girlcum] onto your bed.");
	}
	output(" The mind-blowing ecstasy of your climax leaves you awash with pleasure, seeming to abate your heat as you lie there in bliss, waiting for your lover to finish.");
	output("\n\nYou pant heavily as you come down from your orgasm, ");
	if(pc.hasCock()) output("[pc.cocks] still twitching");
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("beads of fem-lube still dripping from your nether lips");
	output(", gut churning and gurgling full of [syri.cum]. Summoning the strength to turn your head, you see Syri, a wide smile on her face, [syri.ears] drooping lazily as her [syri.chest] heaves with each breath she takes. Between labored breaths you manage to tell the ausar you might need her to stick around for a bit.");
	output("\n\nShe looks down and gives your knotted ass an affectionate slap, <i>“Yeah, I guess I could hang around if you need me that bad, buttslut.”</i>");
	output("\n\nYou smirk and return your head to rest on some less drool-covered pillows. The heat flushing your body is already making its return, but for now all you can do is wait for her breeder’s knob to deflate, though you’re too eager for another good reaming to sleep at all.");
	processTime(25);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",syriButtreamHeatButtPCButtsInTheButtWithAButtDIDISAYBUTTYET3);
}

public function syriButtreamHeatButtPCButtsInTheButtWithAButtDIDISAYBUTTYET3():void
{
	clearOutput();
	showSyri(true);
	author("HugsAlright");
	output("Syri fucks your ass all morning long. Her [syri.cock] spreads your pucker like it’s her only purpose, leaving you sore as she fucks your [pc.asshole] raw. The quenching of your rather specific thirst comes at a price though: she makes you beg for it, taunting you until you scream for her cock. Sometime she request a blowjob, making you lavish her ausar dong with oral affections until she’s decided she’s ready to give you what you want.");
	pc.buttChange(syri.cockVolume(0));
	output("\n\nYou have to give it to her though, the reward more than makes up for the payment. Maybe it’s just the heat, but the feeling of that wolfy shemale fucking your [pc.butt] is incredible. No matter how sore you get she makes sure you feel good, one way or another.");
	output("\n\nThe time comes again and again where Syri knots you, tying the two of you together as she fills you with thick, alabaster ausar-spunk. You honestly don’t think you can go on, your stamina drained from one-too-many reamings. It’s almost impossible to keep yourself awake, the afterglow of your orgasm whisking you away to a happily knotted slumber.");
	processTime(100);
	var x:int = 0;
	for(x = 0; x < 20; x++) { pc.orgasm(); }
	for(x = 0; x < 4; x++) { pc.loadInAss(chars["SYRI"]); }
	clearMenu();
	addButton(0,"Next",syriButtreamHeatButtPCButtsInTheButtWithAButtDIDISAYBUTTYET4);
}

public function syriButtreamHeatButtPCButtsInTheButtWithAButtDIDISAYBUTTYET4():void
{
	clearOutput();
	author("HugsAlright");
	output("When you wake, Syri is nowhere to be found, though your tender asshole and the potent smell of ausar cum let you know she was most definitely here. At least the place seems relatively clean.");
	output("\n\nYou pick yourself up of the bed, knees still a bit wobbly from a long morning of buttfucking. Managing to balance yourself, you stretch, hoping to bring some feeling back to your [pc.legOrLegs].");
	output("\n\nAfter a few moments of making sure you’re still completely intact, you decide it’d be best to get moving again.");
	output("\n\nYou feel sated, at least for now.");
	processTime(125);
	//[Next] //Should return the PC to Mhen’ga docks.
	moveTo(shipLocation);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Kiss Her]
//Morning interactions w/ Syri, must be fuckbuddies
public function morningInteractionsWithSyriKissHer():void
{
	clearOutput();
	showSyri();
	author("Savin");
	output("You slide on over to Syri, hooking a finger over her datapad to push it out of the way.");
	output("\n\n<i>“Hey, I’m-”</i> she starts, only to be cut off as you lean in, cupping one of the ausar’s cheeks and locking lips with her. Her tail shoots out behind her like an arrow before starting to wag, beating rapidly against the barstool. She sighs lightly and plants a hand on your hip, returning the gesture once her momentary surprise washes past her.");
	output("\n\n<i>“I’m into that,”</i> Syri chuckles once you break the kiss. Her hand wanders down your leg, brushing across your crotch. <i>“Especially if it’s just the beginning.”</i>");
	processTime(2);
	pc.lust(2);
	while(pc.lust() < 33)
	{
		pc.lust(1);
	}
	clearMenu();
	syriMorningMenu();
	addDisabledButton(4,"Kiss Her","Kiss Her","You just did that.");
}

//[Hug]
//daytime only. Must be fuckbuddies.
public function syriHugStuff():void
{
	clearOutput();
	showSyri();
	output("Actually, you’ve got your eye on something more fun than a game. You push Syri’s hardlight gun out of the way and step up to the big ol’ brunette, wrapping your arms around her and giving her a quick, hard hug.");
	output("\n\n<i>“Oh! H-hey there!”</i> Syri laughs, tail wagging. She ");
	if(pc.hasHair()) output("scruffles your [pc.hair]");
	else output("pats your head");
	output(" and starts to step back, smiling.");
	processTime(2);
	if(pc.lust() >= 33)
	{
		output("\n\nBefore she can get out of reach, you shift your hands down and grab two handfuls of that sweet ausar booty. She yelps, and you immediately hear jeers and cat-calls from the gang of gamers surrounding you as you pull the ausar babe back against you, kneading that ass like dough. You feel a thick, hard package pressing against your thigh, and Syri’s ears flatten against her head. You just lean in and give her a kiss, thrusting your tongue into her mouth. She’s too embarrased and turned on to resist, letting you explore her mouth freely for a good long while.");
		output("\n\n<i>“God dammit!”</i> she hisses when you finally let her go. <i>“I build up all this street cred and now they’re just talkin’ about my ass again! Dammit!”</i>");
		output("\n\n<i>“Admit it,”</i> you laugh, eying her crotch. <i>“You love it.”</i>");
		output("\n\nSyri stiffens - in posture and in her pants - and grumbles something under her breath that sounds an awful lot like <i>“You know me too damn well.”</i>");
		processTime(1);
		pc.lust(4);
	}
	clearMenu();
	syriMorningMenu();
}

public function syriPettyPlayeeeeeeBettyBooButtMcBunners():void
{
	clearOutput();
	showSyri();
	author("HugsAlright");
	output("<i>“Actually,”</i> you begin, reaching into your inventory, <i>“I thought we could raise the stakes a bit.”</i>");
	output("\n\n<i>“Oh?”</i> Syri responds as you produce a black-leather collar and leash from your pack, holding it tightly in your grasp. She smirks and begins to stroke her chin, clearly intrigued with where this is going, <i>“Alright, Steele, what kind of stakes are we talking about?”</i>");
	output("\n\nWith mock deliberation you give Syri a little <i>“Hmmm”</i> before setting your gaze directly on hers and sauntering your way up to her, <i>“Let’s say... a day.”</i> You’re ");
	if(pc.tallness >= 72) output("pushing yourself into Syri’s double-D’s at this point");
	else if(pc.tallness >= 60) output("pressing your [pc.chest] into Syri’s double-D’s at this point");
	else output("pushing your head into Syri’s cleavage at this point");
	output(", bringing your face as close to hers as it can get, <i>“Loser gets to be the winner’s perfect little fuck-pet for a day.”</i> Syri beams down at you. You can see her raven tail appearing on either side of her flared hips as it wags faster and faster, relishing the thought of having you on that leather leash of yours, all to herself for a day.");
	output("\n\n<i>“Oh, you’re fucking on,”</i> she growls, nudging you off her. You step back and take a good look at your ausar opponent as she hastily puts on her rig, bulge all too visible underneath her pants. She’s <i>really</i> worked up over this bet, isn’t she? Before she finishes suiting-up, she glances your way and grins, <i>“Hope you know there’s no way in hell I’m letting you win, [pc.name].”</i>\n\n");
	if(flags["TIMES_WON_AGAINST_SYRI"] != undefined) output("You’re not too worried, after all, you’ve already beaten her before. ");
	output("By the time you finish putting on your rig the game is already booted up, and Syri’s just about ready to start. You take a deep breath and mumble to yourself, <i>“Time to put your money where your mouth is, Steele.”</i>");
	
	//[Next] //I guess this would trigger the skill check, need to figure that out. You know what? Make it a 50/50 if that’s easiest.
	processTime(12);
	clearMenu();
	addButton(0,"Next",syriPetPlayWinLossRouter);
}

public function syriPetPlayWinLossRouter():void
{
	var won:Boolean = syriPlayGameResult(30);
	if(won) syriPetPlayVictoryWinzo();
	else loseToSyriPetPlayeeeee();
}

//Loss
public function loseToSyriPetPlayeeeee():void
{
	clearOutput();
	showSyri();
	author("HugsAlright");
	output("You play for what feels like an eternity, on edge every second, every corner you turn, every shot you fire. Neither of you seem willing to risk anything, both of you retreating whenever your virtual gazes meet, hesitant to even try to attack. Eventually Syri steps up, leading her shot and delivering a skillful laser blast to your character as you run back for cover. Your rig gives you a jolt, but you don’t let it phase you, even as Syri lets out a little victory grunt.");
	output("\n\nLittle time passes before you find an opportunity to redeem yourself from that first death: Syri’s got her back to you, looks like you turned the bitch around enough to make her think you’re coming around the corner she’s facing. You grin deviously, line up your shot, and fire. Syri yelps as her rig shocks her; sure it wasn’t the most skillful or <i>“honorable”</i> kill, but it got the job done.");
	output("\n\nLasers fly, characters die, and virtual blood is spilled as the end draws nigh: match point. This is it; you’re sweating buckets, trying to keep your growing paranoia under control as you round corners and continuously look over your shoulder. Then it happens: you’re gaze meet as you both turn into the same alley, time appearing to slow as you both raise your weapons. You manage to bring your rifle up before Syri does. It’s now or never. You fire, and you miss as your shot goes wide. Your opponent’s shot isn’t far behind yours, and now you’re an easy target. All you can do is stand there and curse yourself and this whole bet as Syri lands a laser bolt right in your character’s chest.");
	output("\n\nYou remove your rig’s helmet only to see Syri, collar swinging around a furry finger, and a wide, predatory grin written across her face. <i>“Go on,”</i> She says, drawing closer towards you, <i>“Take your time getting that thing off; after all, we have the whole day.”</i> She makes sure to emphasize those last couple words. With a gulp you start to remove the rest of your rig, Syri eyeing you lustfully the whole time, hip cocked as she toys with the collar in her hand.");
	output("\n\nAs the last of your gaming-gear comes off Syri lunges, grabbing at your sides as she pushes you onto a nearby table. <i>“H-hey!”</i> you shout in protest.");
	output("\n\n<i>“Ah-ah,”</i> Syri says, bringing a shushing finger to your lips");
	if(!pc.isChestExposed() && !pc.isCrotchExposed())
	{
		output(" as she begins to pull off your ");
		if(!pc.isCrotchExposed()) output("[pc.crotchCover]");
		else output("[pc.chestCover]");
	}
	if(pc.biggestTitSize() >= 1) output(", taking time to give your [pc.chest] a solid squeeze");
	output(", <i>“puppies don’t talk.”</i> You make sure to quiet yourself; she won the bet, and now you’re hers. <i>“Now roll over like a good " + pc.mf("boy","girl") + ",”</i> the domineering ausar commands. You heed her words and roll yourself over on the table, still in her grasp, squirming and whimpering as she works her hands all over your body, ");
	if(!pc.isNude()) output("pulling your clothes off until you’re ");
	output("face down and naked on the table. Syri bends herself over you, brings the open collar to your nape, and ever-so-slowly wraps it around your neck before closing the shining stainless-steel buckle. You whimper helplessly as Syri pushes herself into you and starts to grind her hips against yours, making her bulge slide up and down the crack of your [pc.butt]. <i>“You look good in that collar, Steele,”</i> she hisses, taking hold of your leash.");
	output("\n\nThe wolfy mistress pulls herself off you when your cock-hungry whining and whimpering gets loud enough. <i>“Can’t give you your treat just yet, [pc.name],”</i> she says as you manage to look over your shoulder, getting a good view of her devious mien while she wraps your leash around her hand. With a rough yank of your tether you’re brought upwards again, but before you can even balance yourself, Syri speaks up: <i>“Down, " + pc.mf("boy","girl") + ",”</i> she instructs. You’re quick to follow her order and bring yourself down onto your hands and knees, like the loyal little fuck-puppy Syri wants you to be. <i>“Good [pc.boyGirl],”</i> the she-wolf coos, reaching down to ");
	if(pc.hasHair()) output("tussle your [pc.hair].");
	else output("scratch your head.");
	output("\n\n<i>“C’mon, we’re going for a little walk, you and I,”</i> Syri declares, gathering up your belongings and giving your leash another tug, beckoning you to follow her out of the bar. You think you might be following her to your ship, but Syri walks past the customs office, and hangs a left.");

	//highExhib:
	if(pc.exhibitionism() >= 66) output("\n\nWell, looks like it’s time for a little fun.");
	else output("\n\nWell, so much for that little bit of hope.");

	output("\n\nInstead of going directly home, your new master totes you around Esbeth for the next half hour, happily showing off her new pet to whomever she sees walking around the streets");
	if(pc.exhibitionism() >= 66) output(", and you’re happy to be shown off");
	output(". Sometimes she makes you do tricks, so you roll over and sit, other times she makes you speak, so you arf and bark; you’re completely at her whim. Your time on the streets is brought to an end when Syri brings you back around to the customs office again.");

	processTime(80);
	if(pc.exhibitionism() >= 33) pc.lust(5);
	if(pc.exhibitionism() >= 66) pc.lust(10);
	pc.exhibitionism(2);
	clearMenu();
	addButton(0,"Next",syriPetPlayPCLostPart2);
}

public function syriPetPlayPCLostPart2():void
{
	clearOutput();
	showSyri(true);
	author("HugsAlright");
	output("You’re finally back in the familiar corridors of your ship, away from prying eyes, but still under Syri’s command. She walks over to your sofa, and you trail behind her, keeping your eyes fixed on her swaying tail and behind. <i>“Stay,”</i> commands the ausar with a firm voice. You obey and sit on your knees while your better unceremoniously plops herself down on your couch and removes her pants, throbbing, red, knotty cock popping free as the lower garments come off. You can’t help but to open your mouth and let your tongue loll out at the sight of her lengthy ausar dong, wanting to feel her flavor play across your mouth. Syri takes notice of you eager gaze and leans back against the couch, beckoning you over with a curling, furry finger. <i>“Time for that treat I promised,”</i> she says, her voice full of condescension as she tugs on your leash, but you don’t need the encouragement, already making your way over to get yourself between the wolf girl’s spread legs.");
	output("\n\nYou take in a deep breath, letting the musky scent of her manhood fill your nostrils before you bring your lips down onto her pointed tip and your [pc.hands] up to her thighs, looking up at her with the best pair of puppy-dog eyes you can muster. But before you can make your own way down her succulent shaft, Syri yanks down hard on your leash, pulling you onto her knotted cock. She laughs, and you whine as her pointed cockhead brushes against the back of your throat. Well, this <i>is</i> what you wanted: a big, red puppy-prick down your throat, so you put your tongue to work, licking all along your master’s shaft as it fills your mouth. You receive a <i>“Good " + pc.mf("boy","girl") + ",”</i> from Syri for your diligent oral-pleasures.");
	output("\n\nSyri gives your leash a solid tug every once in a while, forcing her deep-red dick down your throat and making you whine while you continue to bob your head up and down the domineering ausar’s pole, gobbling up her cock contentedly. You let your tongue slip out of your mouth to play along her knot, making Syri whimper girlishly as you wet the thick bulb of cockflesh, suckling away at her doggy-dong all the while. Somehow, the wolfy slut is able to resist the urge to let you continue and pulls up on your leash, pulling you off her cock in turn. You whimper as your lips come off her cock, already missing her salty, earthy taste. Syri smiles down at you as you sit there on your knees, eagerly awaiting your next command, your tongue lolling out of your mouth like, well, a dog. <i>“Up, [pc.boyGirl],”</i> the ausar demands; you do as she says and stand up, practically trembling with anticipation. Syri grins, <i>“Now turn around,”</i> she says, drawing a little circle in the air with her finger. Quick to heed her command you turn around.");
	output("\n\nA furry pair of hands grab at your waist and hold your [pc.butt] just above Syri’s upward pointing cock, and with and unexpected feral yell of <i>“NOW SIT!”</i> she pulls you straight down, spearing you on her spit-slick puppy-pole. You cry out with inexorable pleasure and pain as eight inches of ausar dick spread your pucker wide open, Syri’s knot left teasing your supple hole. Your sudden and rapid descent leaves you panting like a bitch in heat, and Syri with a grin on her face, from ear to wolfish ear. You whimper and whine as your inner walls spasm, trying to force out the intruder that is Syri’s cock, your arms kept submissively at your sides. Your master is kind enough to give you a few moments to adjust to her knotty dong, affectionately whispering <i>“Good [pc.boyGirl]”</i> into your [pc.ear] before she start moving you.");
	pc.buttChange(syri.cockVolume(0));
	output("\n\nShe’s not very gentle, to say the least: she keeps a tight grip on your sides, forcefully lifting you off and pushing you back onto her knotted tool, using your ass like an onahole. Still, it’s a pleasurable experience all the same, the feeling of veiny ausar dick gliding along your inner walls making you moan loadly, ");
	if(pc.hasCock()) output("your [pc.cock] dispensing a bit of pre each time Syri’s cock brushes over your prostate, ");
	output("and your pucker clamping tightly on your master’s shaft with each ride down. Whenever you start to lose yourself Syri gives your leash a sharp yank, pulling you back to the world to continue bouncing up and down on her turgid length. You can’t help but enjoy the way you’re being treated, like a pet, with your lover in complete control, it just feels so... right.");
	output("\n\nSyri brings you down onto her cock, leaving you moaning as ausar cock fills you once more. She doesn’t lift you back up this time, though, instead she pushes you down harder, right onto her cum-filled knot. She pushes it in slowly, leaving you in agonizing anticipation and pleasure as she stretches your already gaping hole even wider. You’re about one-third of the way onto her knot when the ausar stops. You whine and wiggle, begging for more.");
	output("\n\n<i>“Does puppy want the knot?”</i> Syri whispers into your [pc.ear].");
	output("\n\nOh, do you ever: you nod without any hesitation, willing to do anything to feel her big red knot slip into your [pc.asshole]. Luckily, the wolf-bitch doesn’t keep you waiting long before she continues pushing you down onto her throbbing breeder’s knob, ever so slowly, until the thick, red bulb of flesh finally pops into your [pc.asshole], setting you moaning again, back arching before Syri gives your leash another good tug.");
	pc.buttChange((syri.cockVolume(0)+50));
	output("\n\nYou’re kept still as Syri fucks your ass like a jackhammer: short little thrusts as fast and long as her knot will allow. She wraps your leash around her hand and grabs hold of your wrists, pulling you down onto her cock as she humps away at your [pc.butt], every little movement of her knot making you whimper in pleasure.");
	if(pc.hasCock()) output(" Your master’s vigorous ass fucking leaves your [pc.cock] twitching on the verge of orgasm.");

	output("\n\nSyri let’s out a cry of delight and holds you down on her knotted shaft as it begins to spasm inside of you. The domineering bitch grunts as her cock begins to empty its load into your [pc.asshole]. Hot alabaster coats your inner walls while Syri’s hips buck into your [pc.butt]. The feeling of her seed filling you is all too much for your lust addled mind. With a long, lusty moan your orgasm starts, arms and legs locking in Syri’s grasp, your [pc.asshole] spasming around her cum-leaking puppy-prick.");
	if(pc.hasCock()) output(" Your [pc.cock] cums along with Syri’s, dispensing [pc.cum] all over the walls and floor of your poor ship while your orgasm ensues.");
	else if(pc.hasVagina()) output(" Trying to clamp down around a cock that isn’t there, your [pc.vagina] sprays fem-lube into Syri’s lap and all over the couch while your orgasm ensues.");

	output("\n\nYou find yourself stuck on Syri’s knot as both of your climaxes come to an end, leaving the two of you panting heavily, your master’s bountiful bosom heaving in and out, pressing into your back with each breath the she-wolf takes. She pulls your leash, causing you to fall backwards onto her big, soft breasts before she whispers another <i>“Good [pc.boyGirl]”</i> into one of your [pc.ears]. Syri smirks, <i>“And don’t worry about the knot, we’ve got all day.”</i> Bringing her hand down, she pats your belly, right where her softening bitch-dick is being held. You shudder at her words, feeling eager for more, wanting more, </i>needing<i> more, ready to be an obedient pet again. Doing your best to relax yourself you lean into Syri’s grasp, ready to sleep off her knot, collar still tight around your neck. You don’t think you’ll have a problem being Syri’s <i>“perfect little fuck-pet”</i> for the rest of the day.");
	processTime(45);
	pc.orgasm();
	pc.loadInAss(syri);
	//[Next]
	clearMenu();
	addButton(0,"Next",syriPetPlayPCLostPart3);
}

public function syriPetPlayPCLostPart3():void
{
	clearOutput();
	showSyri(true);
	author("HugsAlright");
	output("You spend the rest of your day being the submissive little puppy you told Syri you’d be, happily suckling on her cock, normally before she shoves it up your [pc.asshole]. Your time between reamings and blowjobs is spent curled up on your master’s lap, like an obedient pet; when you’re not knotted on Syri’s throbbing puppy-prick, that is. ");
	if(pc.hasCock()) output("She’s even nice enough to give you a handjob at one point. ");
	output("Time passes, though you don’t keep track, the scent of ausar cum in your ship growing ever more powerful with each passing orgasm of Syri’s. The two of you stop and rest for a while at some point, your master holding you close as you sleep.");
	output("\n\nSyri’s hands brush along your [pc.hair] while you’re curled up on her lap, waiting for her to build up another load of alabaster spunk to shoot into whatever hole she chooses. Despite your aching bottom, you find yourself in bliss as the dommy-wolf caresses your [pc.hair]. Alas, it seems your submissive little journey is to come to an end all too soon for you: <i>“Well, well, well, looks like time’s up,”</i> Syri announces as her raven-furred hand reaches down for your collar and takes it off, <i>“aren’t you just a lucky little bitch?”</i>");
	//repeat: 
	if(flags["SYRI_PETPLAY_LOST"] != undefined) output(" You can’t help but miss the feeling of it around your neck.");
	output(" Sitting yourself up, Syri suggest that the two of you get cleaned up; you oblige and follow your former-owner to your ship’s shower, hardly able to believe it’s been a day already. There you wash a good day’s worth of cum off Syri and yourself while she comments on your performance, <i>“So, how’d you like being my little pet for the day? You seemed... pretty into it.”</i>");
	pc.shower();
	if(flags["SYRI_PETPLAY_LOST"] != undefined) output("\n\nYou briefly consider telling her about how much you enjoyed it for a moment, reaching your hand up to where your collar once was and rubbing your neck. Of course, you quickly remember who you’re talking to.");
	else output("\n\nTaking a moment to consider every act of sexual deviancy you’ve been through with Syri today, you almost lose yourself to your thoughts and memories before you have a chance to answer.");
	output(" You smirk as you give the lusty ausar a slap on the ass and ask her how <i>“into it”</i> she’ll be when it’s her ass on that leash. Syri chuckles in response.");

	if(flags["SYRI_PETPLAY_LOST"] != undefined) output("\n\nThen again, do you really want to win if this is what you get for losing?");

	//[Next] //Should return the PC to their ship.
	processTime(22*60);
	for(var x:int = 0; x < 5; x++)
	{
		pc.orgasm();
	}
	IncrementFlag("SYRI_PETPLAY_LOST");
	IncrementFlag("FUCKED_SYRI_COUNT");
	moveTo("SHIP INTERIOR");
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Victory
public function syriPetPlayVictoryWinzo():void
{
	clearOutput();
	showSyri();
	author("HugsAlright");
	output("You play for what feels like an eternity, on edge every second, every corner you turn, every shot you fire. Neither of you seem willing to risk anything, both of you retreating whenever your virtual gazes meet, hesitant to even try to attack. Eventually Syri steps up, leading her shot and delivering a skillful laser blast to your character as you run back for cover. Your rig gives you a jolt, but you don’t let it phase you, even as Syri lets out a little victory grunt.");
	output("\n\nLittle time passes before you find an opportunity to redeem yourself from that first death: Syri’s got her back to you, looks like you turned the bitch around enough to make her think you’re coming around the corner she’s facing. You grin deviously, line up your shot, and fire. Syri yelps as her rig shocks her; sure it wasn’t the most skillful or <i>“honorable”</i> kill, but it got the job done.");
	output("\n\nLasers fly, characters die, and virtual blood is spilled as the end draws nigh: match point. This is it; you’re sweating buckets, trying to keep your growing paranoia under control as you round corners and continuously look over your shoulder. Then it happens: you’re gaze meet as you both turn into the same alley, time appearing to slow as you both raise your weapons. You manage to bring your rifle up before Syri does; it’s now or never. You fire, and you strike like lightning, landing a shot right between her character’s eyes.");
	output("\n\nIt’s not even a second before you hear Syri exclaiming her disbelief: <i>“WHAT? FUCKING- HOW? HOW DID YOU MOVE SO FUCKING FAST AND STILL HIT ME?!”</i> You remove your rig’s helmet to see Syri’s red face, though you can’t tell if it’s red with embarrassment or rage. Another anguished cry of <i>“FUCK!”</i> as she removes her gear makes you think it might be the latter. The she-wolf’s mien changes all too quickly as you remove the rest of your rig and reach for the collar. Syri gives you a nervous smile and chuckles as you begin to walk towards her, leather leash in hand, <i>“Uh, best two out of three?”</i> You don’t say a word. Instead you give her your most predatory grin and unbuckle the collar as you close in on her.");
	output("\n\nWhat are you to do with your new pet?");

	processTime(33);
	clearMenu();
	//[StripHer] Strip Syri and collar her in the bar before you take her home.
	//[LotsOfWalkies] Strip Syri and collar her, then take her on a long walk before you bring her home.
	//[BeThePet] Voluntarily be Syri’s little fuck-pet for the day.
	addButton(0,"Strip Her",barStrippySyriDooda,undefined,"Strip Her","Strip Syri and collar her in the bar before you take her home.");
	addButton(1,"LotsOfWalkies",walkieMcWalkerson,undefined,"LotsOfWalkies","Strip Syri and collar her, then take her on a long walk before you bring her home.");
	addButton(2,"BeThePet",voluntaryPetPlayAfterSyriWin,undefined,"BeThePet","Voluntarily be Syri’s little fuck-pet for the day.");
}

//Strip Her
//[StripHer]
public function barStrippySyriDooda():void
{
	clearOutput();
	showSyri(true);
	author("HugsAlright");
	output("You decide it best to just strip and collar your new wolf-puppy while you’re here. With almost " + pc.catDog("(or outright) ", "") + "feline grace you bound forward, grab Syri by her flared hips, push her up against a nearby wall, and turn her around until you’re pressing your hips into her big, squishy butt. She squirms in your grasp as you strip her down, making sure you take a moment to squeeze at her supple tits and bare ass as her clothes come off, drawing forth a few suppressed whimpers from the ausar. Once Syri’s bared before you (and the rest of the bar), you take the ring of black leather in your hands and close it around her neck. You give the collar a little tug before you close the buckle, making sure it’s nice and secure. <i>“Not so tight, dammit,”</i> Syri speaks out in response.");
	output("\n\nYou give her leash a little tug, making the ausar wince. <i>“Seems fine to me,”</i> you say with a smile, <i>“Now be a good little puppy and be quiet.”</i>");
	output("\n\nSyri’s face turns sour at your words, <i>“What did you just call me?”</i>");
	output("\n\nYour smile turns to a devious grin, <i>“I called you a puppy, because that’s what you’re gonna be for the rest of the day.”</i>");
	output("\n\nThe ausar girl doesn’t take kindly to your choice <i>“terminology”</i> and begins to cuss you out with her usual stuff: <i>“I SWEAR STEELE, I’LL FUCK YOUR-”</i> followed by something or other orifice and an arrangement of other colorful vocabulary. Seems like your pet isn’t willing to cooperate, yet, anyways. You scan the room looking for something you can use to silence the boisterous little puppy. There on the faux-wood floor near Syri’s furry feet you spy her discarded panties.");
	output("\n\nThose’ll do.");
	output("\n\nWhile keeping Syri pinned against the wall you reach down and grab her undergarments off the ground. You straighten yourself, and with the skill of an ancient Terran sailor, you place the clothing in her mouth and tie it around the back of her neck. The gagged girl emits a series of muffled curses before letting out a long sigh and looking over her shoulder at you. You give her a smile, <i>“Now that’s going to stay in there, unless you want me using something else to plug that hole,”</i> you say, grabbing your crotch. Syri rolls her eyes so hard you can feel it.");
	output("\n\n<i>“Down, girl,”</i> you command. The wolf girl looks at you for a moment, weighing her options before letting out another long, muffled sigh and bringing herself down on all fours. You grin with delight at her compliance, <i>“Alright, girl, time for walkies,”</i> you announce. Giving Syri’s leash a good tug you start to walk out the bar, but it takes another solid yank to get her to follow you. ");
	output("\n\nYou spare the girl too much embarrassment and decide to take her straight to your ship. A few people on the streets comment on your pet, and you tell them she just <i>loves</i> being petted; some of the passersby take you up on the offer and pat your pretty puppy on the head, leaving you to wonder just how she’s going to get back at you for this one. You’re making your way through the customs office when you’re stopped by a familiar voice: <i>“Cute dog!”</i> exclaims Flahne from behind her desk. You turn and give the Rahn a wink as you walk your way out the office, making Syri release another vexed groan into her makeshift gag.");
	output("\n\nFinally back within the familiar corridors of your ship, you make your way to your quarters, disgruntled puppy in tow. You stop at the foot of your bed and give Syri a little smile before you utter your next command: <i>“Stay, girl,”</i> Syri shakes her head but obliges and keeps her position, barely able to believe this is actually happening. ");
	if(!pc.isCrotchExposed()) output("You drop her leash for a moment and start removing your [pc.crotchCovers], stripping yourself in front of your pet, who manage to form a little smirk through her gag. As the last of your clothes come off you");
	else output("You");
	output(" hop up onto the bed, sitting up on your knees before beckoning Syri to follow: <i>“C’mon, girl,”</i> you say, bending down and patting your legs, <i>“Up-up!”</i> The ausar takes a deep breath and mumbles something through her panties before climbing her way onto the bed, resting on her hands and knees, tail wagging slightly.");
	output("\n\nShe’s looking at you expectantly, though there’s still a bit disdain in her gaze; now all you have to do is decide what to do with the puppy.");

	processTime(25);
	pc.lust(10);
	//[PitchAnal] Show the puppy what happens when you lose a bet. //Requires cock that fits.
	//[CatchAnal] Take your victory prize in the form of Syri’s knotty cock.
	//[Cuddle] Show your puppy some love.
	clearMenu();
	if(pc.hasCock() && pc.cockThatFits(syri.analCapacity()) >= 0) addButton(0,"Pitch Anal",pitchSyriAnalPetPlayWinnar,undefined,"Pitch Anal","Show the puppy what happens when you lose a bet.");
	else addDisabledButton(0,"Pitch Anal","Pitch Anal","You need a penis that fits in her butt for this.");
	addButton(1,"Catch Anal",catchAnalFromPuppySyri,undefined,"Catch Anal","Take your victory prize in the form of Syri’s knotty cock.");
	addButton(2,"Cuddle",cuddleWithSyri,undefined,"Cuddle","Show your puppy some love.");
}

//Walkies
//[LotsOfWalkies]
public function walkieMcWalkerson():void
{
	clearOutput();
	showSyri(true);
	author("HugsAlright");
	output("You decide it best to just strip and collar your new wolf-puppy while you’re here. With almost " + pc.catDog("(or outright) ", "")  + "feline grace you bound forward, grab Syri by her flared hips, push her up against a nearby wall, and turn her around until you’re pressing your hips into her big, squishy butt. She squirms in your grasp as you strip her down, making sure you take a moment to squeeze at her supple tits and bare ass as her clothes come off, drawing forth a few suppressed whimpers from the ausar. Once Syri’s bared before you (and the rest of the bar), you take the ring of black leather in your hands and close it around her neck. You give the collar a little tug before you close the buckle, making sure it’s nice and secure. <i>“Not so tight, dammit,”</i> Syri speaks out in response.");
	output("\n\nYou give her leash a little tug, making the ausar wince. <i>“Seems fine to me,”</i> you say with a smile, <i>“now be a good little puppy and be quiet.”</i>");
	output("\n\nSyri’s face turns sour at your words, <i>“What did you just call me?”</i>");
	output("\n\nYour smile turns to a devious grin, <i>“I called you a puppy, because that’s what you’re gonna be for the rest of the day.”</i>");
	output("\n\nThe ausar girl doesn’t take kindly to your choice <i>“terminology”</i> and begins to cuss you out with her usual stuff: <i>“I SWEAR STEELE, I’LL FUCK YOUR-”</i> followed by something or other orifice and an arrangement of other colorful vocabulary. Seems like your pet isn’t willing to cooperate, yet, anyways. You scan the room looking for something you can use to silence the boisterous little puppy. There on the faux-wood floor near Syri’s furry feet you spy her discarded panties.");
	output("\n\nThose’ll do.");
	output("\n\nWhile keeping Syri pinned against the wall you reach down and grab her undergarments off the ground. You straighten yourself and with the skill of an ancient Terran sailor you place the clothing in her mouth and tie it around the back of her neck. The gagged girl emits a series of muffled curses before letting out a long sigh and looking over her shoulder at you. You give her a smile, <i>“Now that’s going to stay in there, unless you want me using something else to plug that hole,”</i> you say, grabbing your crotch. Syri rolls her eyes so hard you can feel it.");
	output("\n\n<i>“Down, girl,”</i> you command. The wolf girl looks at you for a moment, weighing her options before letting out another long, muffled sigh and bringing herself down on all fours. You grin with delight at her compliance, <i>“Alright, girl, time for walkies,”</i> you announce. Giving Syri’s leash a good tug you start to walk out the bar, but it takes another solid yank to get her to follow you. ");
	output("\n\nYou could just walk your puppy home right away; but what would be the fun in that? No, things are just getting started, and you plan to take your new pet on a long walk around Esbeth.");
	output("\n\nAlthough Esbeth isn’t the most bustling town imaginable, the nearly empty, packed-dirt paths provide people with a good view of you and your pet. Some people stop to compliment you on your pet, others draw closer to give Syri a pet or two, talking to her like a puppy while they do so. Sometimes you stand outside of shops or other places of business, waiting until someone comes out so they can catch a glimpse of a leash-bound Syri, usually leading to a <i>“Aw, what a cute puppy!”</i> from happy consumers. Unfortunately, a few people don’t seem very interested in you or your pet, giving the wolf-puppy hope that she might get a few moments respite. Though, that hope seems to be wasted so long as you’re the one holding the leash: you lead your pet over to those that would pass you by, making her groan with disdain as you show her off to strangers.");
	output("\n\nYou continue parading your new pet around Esbeth for quite some time. She grumbles and mumbles muffled complaints into her gag like you’d expect, her ears drooping in displeasure with each passerby you come across.");
	output("\n\nJust when you’re thinking about taking Syri home, your thoughts are interrupted by a bubbly, happy, most definitely feminine cry of <i>“What a cute little doggie!”</i> You turn towards the voice to see a couple of Terran women - oh, this is gonna be good. With a grin you watch the two women approach: one of them appears very well modded, shirt bursting at the seams with boob, and her companion doesn’t look too different, but they both appear very giddy about your pet ausar.");
	output("\n\nThe two of them stop as they get close to Syri; one of them smiles happily then asks <i>“Can I pet her?”</i> You tell them she’d just <i>love</i> that. The woman squees with glee and reaches a hand down to your puppy’s big ol’ wolf-ears, which droop down in response to the hand closing in on them. Syri frowns through her gag as the Terran girl’s hand runs through her raven hair and across her ears. Just as the first woman stops her scritching and scratching, the other woman reaches down to do the exact same thing, all while you stand there smiling, reveling in the sight of Syri being treated like the puppy she is.");
	output("\n\n<i>“Does she know any tricks?”</i> asks the more well-endowed woman, wide smile still on her face.");
	output("\n\nYou smile right back, <i>“Does she ever.”</i> Your panty-gagged puppy looks up at you, giving you quite the death stare. You pay no heed to Syri’s contemptuous mien and issue you next order: <i>“C’mon girl, roll-over.”</i> Syri groans half-heartedly into her makeshift gag and does as she’s told, rolling herself along the ground until she’s up on all fours again. The Terran women giggle joyously at your pet’s performance and reach down to give her a <i>“reward”</i> pet. You think you see Syri’s eye twitching as their hands connect with her head. Counting yourself lucky she can’t bite through her gag, you reach down and add your hand to the petting, cooing <i>“good girl”</i> as you do so.");
	output("\n\nThinking that your puppy’s at her wit’s end, you decide to bid the two Terran women a fond farewell, though you do invite them to give Syri one last goodbye pet; an offer they happily accept. As the two busty broads continue their way down the road, you start to make your way back to your ship. You’re making your way through the customs office when you’re stopped by a familiar voice: <i>“Cute dog!”</i> exclaims Flahne from behind her desk. You turn and give the Rahn a wink as you walk your way out the office, making Syri release another vexed groan into her makeshift gag.");
	output("\n\nFinally back within the familiar corridors of your ship, you make your way to your quarters, disgruntled puppy in tow. You stop at the foot of your bed and give Syri a little smile before you utter your next command: <i>“Stay, girl,”</i> Syri shakes her head but obliges and keeps her position, barely able to believe this is actually happening. ");
	if(!pc.isNude()) output("You drop her leash for a moment and start removing your gear, stripping yourself in front of your pet, who manage to form a little smirk through her gag. As the last of your clothes come off you");
	else output("You");
	output(" hop up onto the bed, sitting up on your knees before beckoning Syri to follow: <i>“C’mon, girl,”</i> you say, bending down and patting your legs, <i>“Up-up!”</i> The ausar takes a deep breath and mumbles something through her panties before climbing her way onto the bed, resting on her hands and knees, tail wagging slightly.");
	output("\n\nShe’s looking at you expectantly, though there’s still a bit disdain in her gaze; now all you have to do is decide what to do with the puppy.");

	processTime(25);
	pc.lust(10);
	//[PitchAnal] Show the puppy what happens when you lose a bet. //Requires cock that fits.
	//[CatchAnal] Take your victory prize in the form of Syri’s knotty cock.
	//[Cuddle] Show your puppy some love.
	clearMenu();
	if(pc.hasCock() && pc.cockThatFits(syri.analCapacity()) >= 0) addButton(0,"Pitch Anal",pitchSyriAnalPetPlayWinnar,undefined,"Pitch Anal","Show the puppy what happens when you lose a bet.");
	else addDisabledButton(0,"Pitch Anal","Pitch Anal","You need a penis that fits in her butt for this.");
	addButton(1,"Catch Anal",catchAnalFromPuppySyri,undefined,"Catch Anal","Take your victory prize in the form of Syri’s knotty cock.");
	addButton(2,"Cuddle",cuddleWithSyri,undefined,"Cuddle","Show your puppy some love.");
}

//Voluntary Pet-Play
//[BeThePet]
public function voluntaryPetPlayAfterSyriWin():void
{
	clearOutput();
	showSyri();
	author("HugsAlright");
	output("Syri gives you a confused look as you stop in your tracks and hand the collar over to her, and even more confused as you ");
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("strip yourself of your [pc.gear] right in front of her, and ");
	output("drop down on your knees, craning your neck forward. <i>“Uh, you know you </i>won<i> the bet, right, [pc.name]?”</i> You don’t say a word, you just look up at her and smile.");
	var isAusar:Boolean = pc.isAusar();
	output("\n\nThe she-wolf rolls her eyes at you and bends downward, starting to bring the black leather collar to your neck. ");
	if(isAusar && pc.tailCount > 0) output("<i>“You know,”</i> she begins, rolling her eyes and bringing the collar around your neck, <i>“If you were anyone else I’d probably berate you a bit for perpetuating this whole ausar-pet thing. I mean, do you know how many people still think it’s okay to just come up and </i>pet<i> us?”</i> The shining stainless-steel buckle snaps close around you neck. <i>“But,”</i> Syri says, rebutting her own statement, <i>“I guess I can make a </i>small<i> exception.”</i> Your [pc.ears] perk up at her words, [pc.tail] beginning to sway with growing eagerness.");
	else output("<i>“Gods,”</i> she begins, bringing the black leather collar around your neck, <i>“you could’ve just, </i>lost<i> the bet if this is what you wanted.”</i> You say nothing, but continue smiling up at your new master as the shining stainless steel buckle snaps close around your neck, a feeling of eagerness swelling up inside of you.");
	output("\n\nGrabbing hold of your leash, Syri straightens herself and looks down at her new pet. ");
	if(isAusar && pc.tailCount > 0) output("You beam up at the wolf-girl, your [pc.tail] wagging happily back and forth as you lower your gaze, presenting your [pc.ears] to your master. Syri lets a drawn out sigh escape her lungs. <i>“Fine,”</i> she announces, reaching a soft, furry hand down to caress your [pc.ears]. You coo with pleasure as her hand works itself all over your sensitive spots.");
	else output("You beam up at the wolf-girl, your posture displaying your yearning to be treated like a puppy as you lower your gaze, presenting your head to your master. Syri lets a drawn out sigh escape her lungs. <i>“Fine,”</i> she announces, reaching a soft, furry hand down to tussle your [pc.hair].");
	output(" Your master seems relieved that she’s not going to be the one on the leash today. <i>“C’mon, we’re going for a little walk, you and I,”</i> she declares, gathering up your belongings and beckoning you to follow her out of the bar. You’re quick to follow her, eager for whatever’s to come.");
	output("\n\nYour new master totes you around Esbeth for the next half hour, showing off her new pet to whomever she sees walking around the streets, and you’re happy to be shown-off. Sometimes she makes you do tricks, so you roll over and sit, other times she makes you speak, so you arf and bark; you’re completely at her whim, all the while she praises you for being a good little puppy. Your time on the streets is brought to an end when Syri brings you back around to the customs office again.");

	processTime(22);
	clearMenu();
	addButton(0,"Next",voluntaryPetPlayAfterSyriWin2);
}

public function voluntaryPetPlayAfterSyriWin2():void
{
	clearOutput();
	showSyri(true);
	moveTo("SHIP INTERIOR");
	author("HugsAlright");
	output("You’re finally back in the familiar corridors of your ship, away from prying eyes, but still under Syri’s command. She walks over to your sofa, and you trail behind her, keeping your eyes fixed on her swaying tail and behind. <i>“Stay,”</i> commands the ausar with a firm voice. You obey and sit on your knees while your master unceremoniously plops herself down on your couch and removes her pants, throbbing, red, knotty cock popping free as the lower garments come off. You can’t help but to open your mouth and let your tongue loll out at the sight of her cock, wanting to feel her flavor play across your mouth. Syri takes notice of you eager gaze and leans back against the couch, beckoning you over with a curling, furry finger. She gives your leash a commanding little tug, but you don’t need the encouragement, already making your way over to get yourself between the wolf girl’s spread legs.");
	output("\n\nYou take in a deep breath, letting the musky scent of her manhood fill your nostrils before you bring your lips down onto her pointed tip and your hands up to her thighs, looking up at her with the best pair of puppy-dog eyes you can muster. Your [pc.lips] caress Syri’s doggie-dong as you make your way down her succulent shaft, the she-wolf whimpering all the way long until your mouth meets her knot. Well, now you’ve got what you want: a big, red puppy-prick down your throat, so you put your tongue to work, licking all along your master’s shaft as it fills your mouth. You receive a <i>“Good [pc.boyGirl],”</i> from Syri for your diligent oral-pleasures.");
	output("\n\nSyri gives your leash a solid tug every once in a while, forcing her turgid dick down your throat and making you whine while you continue to bob your head up and down the domineering ausar’s pole, gobbling up her cock contentedly. You let your tongue slip out of your mouth to play along her knot, making Syri whimper girlishly as you wet the thick bulb of cockflesh, suckling away at her deep-red cock all the while. Somehow, the wolfy slut is able to resist the urge to let you continue and pulls up on your leash, pulling you off her cock in turn. You whimper as your lips come off her cock, already missing her salty, earthy taste. Syri smiles down at you as you sit there on your knees, eagerly awaiting your next command, your tongue lolling out of your mouth like, well, a dog. <i>“Up, [pc.boyGirl],”</i> the ausar demands; you do as she says and stand up, rubbing your hands in anticipation. Syri grins, <i>“Now turn around,”</i> she says, drawing a little circle in the air with her finger. Quick to heed her command, you turn around.");
	output("\n\nA furry pair of hands grab at your waist and hold your [pc.butt] just above Syri’s upward pointing cock, and with an unexpected feral yell of <i>“NOW SIT!”</i> she pulls you straight down, spearing you on her spit-slick puppy-pole. You cry out with inexorable pleasure and pain as eight inches of ausar dick spread your pucker wide open, Syri’s knot left teasing your supple hole. Your sudden and rapid descent leaves you panting like a bitch in heat, and Syri with a grin on her face, from ear to wolfish ear. You whimper and whine as your inner walls spasm, trying to force out the intruder that is Syri’s turgid shaft, your arms kept submissively at your sides. Your master is kind enough to give you a few moments to adjust to her throbbing member, affectionately whispering <i>“Good [pc.boyGirl]”</i> into your [pc.ear] before she start moving you.");
	pc.buttChange(syri.cockVolume(0));
	output("\n\nShe’s not very gentle, to say the least: she keeps a tight grip on your sides, forcefully lifting you off and pushing you back onto her knotted tool, using your ass like an onahole. Still, it’s a pleasurable experience all the same, the feeling of veiny ausar dick gliding along your inner walls making you moan loadly, ");
	if(pc.hasCock()) output("your [pc.cock] dispensing a bit of pre each time Syri’s cock brushes over your prostate, ");
	output("and your pucker clamping tightly on your master’s big red dick with each ride down. You can do nothing but enjoy the way you’re being treated, like a pet, with your lover in complete control, it just feels so... right.");
	output("\n\nSyri brings you down onto her cock, leaving you moaning as ausar dong fills you once more. She doesn’t lift you back up this time, though, instead she starts to push you down harder, right onto her cum-filled knot. She pushes it in slowly, leaving you in agonizing anticipation and pleasure as she stretches your already gaping hole even wider. You’re about one-third of the way onto her knot when the ausar stops. You whine and wiggle, beggin for more.");
	output("\n\n<i>“Does puppy want the knot?”</i> Syri whispers into your [pc.ear].");
	output("\n\nOh, do you ever: you nod without any hesitation, willing to do anything to feel her throbbing, turgid knot slip into your [pc.asshole]. Luckily, the wolf-bitch doesn’t keep you waiting long before she continues pushing you down onto her throbbing breeder’s knob, ever so slowly, until the thick, red bulb of flesh finally pops into your [pc.asshole], setting you moaning again, back arching before Syri gives your leash another good tug.");
	output("\n\nYou’re kept still as Syri fucks your ass like a jackhammer: short little thrusts as fast and long as her knot will allow. She wraps your leash around her hand and grabs hold of your wrists, pulling you down onto her cock as she humps away at your [pc.butt], every little movement of her knot making you whimper in pleasure.");
	if(pc.hasCock()) output(" Your master’s vigorous ass fucking leaves your [pc.cock] twitching on the verge of orgasm.");
	output("\n\nSyri let’s out a cry of delight and holds you down on her cum-leaking shaft as it begins to spasm inside of you. The domineering bitch grunts as her cock begins to empty its load into your [pc.asshole]. Hot alabaster coats your inner walls while Syri’s hips buck into your [pc.butt]. The feeling of her seed filling you is all too much for your lust addled mind. With a long, lusty moan your orgasm starts, arms and legs locking in Syri’s grasp, your [pc.asshole] spasming around her cum-leaking puppy-prick.");
	if(pc.hasCock()) output(" Your [pc.cock] cums along with Syri’s, dispensing [pc.cum] all over the walls and floor of your poor ship while your orgasm ensues.");
	else if(pc.hasVagina()) output(" Trying to clamp down around a cock that isn’t there, your [pc.vagina] sprays fem-lube into Syri’s lap and all over the couch while your orgasm ensues.");

	output("\n\nYou find yourself stuck on Syri’s knot as both of your climaxes come to an end, leaving the two of you panting heavily, your master’s bountiful bosom heaving in and out, pressing into your back with each breath the she-wolf takes. She pulls your leash, causing you to fall backwards onto her big, soft breasts before she whispers another <i>“Good [pc.boyGirl]”</i> into one of your [pc.ears]. Syri smirks, <i>“And don’t worry about the knot, we’ve got all day.”</i> Bringing her hand down, she pats your belly, right where her softening bitch-dick is being held. You shudder at her words, feeling eager for more, wanting more, <i>needing</i> more, ready to be an obedient pet again. Doing your best to relax yourself you lean into Syri’s grasp, ready to sleep off her knot, collar still tight around your neck. You don’t think you’ll have a problem being her <i>“perfect little fuck-pet”</i> for the rest of the day.");

	processTime(35);
	pc.orgasm();
	pc.loadInAss(syri);
	clearMenu();
	addButton(0,"Next",voluntaryPetPlayAfterSyriWin3);
}

public function voluntaryPetPlayAfterSyriWin3():void
{
	clearOutput();
	showSyri();
	author("HugsAlright");
	output("You spend the rest of your day being the submissive little puppy you wanted to be, happily suckling on Syri’s cock, normally before she shoves it up your [pc.asshole]. Your time between reamings and blowjobs is spent curled up on your master’s lap, like an obedient pet; when you’re not knotted on Syri’s throbbing puppy-prick, that is. She’s fair though, after all: you won the bet, and she praises you like the good puppy you are.");
	if(pc.hasCock()) output(" She’s even nice enough to give you a handjob at one point.");
	output(" Time passes, though you don’t keep track, the scent of ausar cum in your ship growing ever more powerful with each passing orgasm of Syri’s. The two of you stop and rest for a while at some point, your master holding you close as sleep.");

	output("\n\nSyri’s hands brush along your [pc.hair] while you’re curled up on her lap, waiting for her to build up another load of creamy alabaster to shoot into whatever hole she chooses. Despite your aching bottom, you find yourself in bliss as the dommy-wolf caresses your [pc.hair]. Alas, it seems your submissive little journey is to come to an end all too soon for you: <i>“Well, well, well, looks like time’s up,”</i> Syri announces as her raven-furred hand reaches down for your collar and takes it off, <i>“hope my good little puppy enjoyed " + pc.mf("himself","herself") + ".”</i> You can’t help but miss the feeling of it around your neck. Sitting yourself up, Syri suggest that the two of you get cleaned up; you oblige and follow your former-owner to your ship’s shower, hardly able to believe it’s been a day already. There you wash a good day’s worth of cum off Syri and yourself while she comments on your performance, <i>“So, you’re pretty into this kind of stuff, huh Steele?”</i>");
	output("\n\nYou tell her that you most certainly did enjoy it, finding yourself rubbing the back of your neck where your collar once was. Giving her a slap on the ass, you also tell her she should step up her game, or it’s going to be her ass in that collar next time. Syri chuckles in response.");

	//[Next] //Should return the PC to their ship.
	processTime(22*60);
	for(var x:int = 0; x < 5; x++)
	{
		pc.orgasm();
	}
	IncrementFlag("SYRI_PETPLAY_WINS");
	IncrementFlag("FUCKED_SYRI_COUNT");
	moveTo("SHIP INTERIOR");
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Pitch Anal
//[PitchAnal]
public function pitchSyriAnalPetPlayWinnar():void
{
	clearOutput();
	showSyri(true);
	author("HugsAlright");
	var x:int = pc.cockThatFits(syri.analCapacity());
	if(x < 0) x = pc.cockThatFits(syri.analCapacity());
	moveTo("SHIP INTERIOR");

	output("With a duplicitous grin you move yourself a bit closer to Syri, who’s patiently waiting for you to make your next move. Without warning you lunge forward, grabbing the subdued she-wolf’s shoulders and shoving her onto her back. She lets out a muted gasp from underneath her gag as she falls onto the mattress and you climb atop her, straddling her rather impressive chest. You reach down behind her neck and grab hold of the knot keeping her panties stuck in her mouth. <i>“Now if I take this out,”</i> you begin, <i>“are you going to be a good girl and stay quiet?”</i> Giving her eyes another good roll, Syri groans before letting out a muffled <i>“fine”</i> from behind her panties. You smile wide at her compliance, quickly reaching down to undo her gag. Syri stretches her jaw and moves her tongue around as you remove the undergarments from her mouth, probably trying to get the taste of her own cock off her lips, and you have just the remedy for her problem.");
	output("\n\nYou grab hold of Syri’s leash and give it a yank, craning her neck forward as you reach down to stroke your rapidly stiffening member. <i>“Open wide,”</i> you demand, <i>“I’ve got a treat for you.”</i> Syri doesn’t look all that thrilled, but she heeds your words, opening her mouth and letting her tongue loll out, ready to accept your length. Happy that your puppy is obeying orders, you align your cock with her maw and push your [pc.hips] forward. You shudder with pleasure as you sheath your [pc.cock " + x + "] inside Syri’s warm, wet mouth, her tongue caressing the bottom of your shaft all the way in. The ausar puts her tongue to work, fondling your dick with quite some skill as you begin to roll your hips, sliding your [pc.cock " + x + "] in and out of her mouth. You moan and groan while Syri whimpers and whines with every tug of her leash, forcing her down onto your [pc.cock " + x + "], cheeks bulging in response.");
	output("\n\nOnce you feel like you’ve gotten your cock nice and wet, you pull yourself back, cock falling out of your pet’s mouth. <i>“Good girl,”</i> you coo, stroking your spit-slick [pc.cockNoun " + x + "]. <i>“Now roll-over and sit up for your </i>real<i> treat,”</i> you command, making Syri roll her eyes again, mumbling something along the lines of <i>“I’ll show you a fuckin’ treat”</i> under her breath. The wolf-puppy rolls herself over and brings herself up on all fours, sliding herself out from under you in the process.");
	output("\n\nYou smile at the sight of Syri’s nice, round, gropable ass as it’s presented to you and quickly get your hands all over it, spreading those cheeks to give you a nice view of her pucker. With a tug of Syri’s leash you line your cock up, ready to sink it into her waiting asshole, and you do just that: grabbing at your puppy’s plush bottom you push your [pc.hips] forwards, lubed-up [pc.cockNoun " + x + "] easily spreading her supple hole. Syri howls in pleasure as you fill her with your length, swollen glans pushing past her pucker. You give the rowdy girl’s leash a tug to quickly remind her where she is, and who’s in charge as you press yourself further into her depths. Unable to suppress your own satisfaction, you groan in bliss as you finally bottom out inside your ausar pet.");
	pc.cockChange();
	output("\n\nHer asshole spasms as she adjusts to your length, panting loudly, her cock twitching in response to your interminable penetration. You don’t give her much time before you start moving again, pulling your hips back, setting the lusty ausar moaning again, but you’re quick to give her tether another tug, making sure she stays well and focused for the next part of her reaming. Your [pc.cockHead " + x + "] meets Syri’s puppy pucker once more, and with tight grip on her hips you slam forward, sending your [pc.cock " + x + "] right back where it came from, your leash-bound ausar crying out with glee as you bury your manhood inside her again. You repeat the same motion again, and again, and again, relentlessly pounding Syri’s ass until all her moaning, groaning, and grumbling becomes nothing more than incoherent babbling. <i>“What’s the matter?”</i> you ask, <i>“all this cock too much for you, girl?”</i> All she can do is whimper in response. Well, at least you found a way to keep her from complaining, though you figure most would have trouble talking at all with a cock in them.");
	output("\n\nIt isn’t long before all of Syri’s babbling becomes one long, drawn out moan of overwhelming pleasure. You feel the girl tense up in your hands as her gaping pucker clenches down tight around you cockflesh, causing you to release a particularly loud groan. Your wolf-puppy’s own knotty cock twitches and spasms as she cums all over your sheets, whimpering and shaking with orgasmic pleasure all the while.");

	//hasKnot:
	if(pc.hasKnot(x))
	{
		output("\n\nWith your [pc.cock " + x + "] surrounded by sudden and unbearable tightness, you feel like you won’t last much longer. Thrusting forward one last time, you slip your knot into Syri’s already gaping pucker with ease, making her whimper with pleasure again. You bend yourself over the buttslut and wrap your arms around her waist, [pc.chest] pressing into her back. From then on you breed her like the bitch she’s going to be for the day, fucking her ample ass with renewed vigor, whispering another <i>“Good girl”</i> into her twitching, slightly drooping wolf-ear. Syri’s still recovering from her orgasm when you feel yours begins.");
		if(pc.cumQ() >= 1000) output(" You slam your [pc.cock " + x + "] home as it starts to spasm, spraying her bowels with your [pc.cum] as your climax intensifies. Syri cries out when your hot, [pc.cumColor] [pc.cumNoun] starts to overwhelm her. You smile as her tight-tummy starts to distend in your arms, the she-wolf letting out a quivering groan of <i>“F-fuuuuuuuuck,”</i> as she’s pumped full of your seed, belly rounding until she’s so utterly full all she can do is whimper.");
		else output(" You slam your [pc.cock " + x + "] home as it starts to spasm, spraying her bowels with your [pc.cum]. Syri cries out in response, the chorus of your combined moaning filling your ship.");

		if(pc.cumQ() >= 4000) output("\n\nYou’re left with your chest heaving, hands gently caressing your puppy’s swollen stomach, oh-so full of your [pc.cum].");
		else output("\n\nYou’re left with your chest heaving, your arms still wrapped around your puppy’s waist.");
		output(" Syri seems pretty exhausted after that, panting like the well-fucked bitch you’ve made of her. You grin and push yourself deeper into her, drawing forth a shuddering breath from the ausar as your knot rubs against her inner walls. <i>“Hope my puppy’s up for more,”</i> you whisper, <i>“because we’re going to be at this all day.”</i> Syri manages to give you a smug look over her shoulder. You figure you’d better settle in for now, seeing as you and your new pet are going to be stuck here for a while. Nuzzling your head into Syri’s back, you close your eyes, ready to rest your knot away.");
	}
	//noKnot:
	else
	{
		output("\n\nWith your [pc.cock " + x + "] surrounded by sudden and unbearable tightness, you feel like you won’t last much longer. You slam your [pc.hips] into Syri’s, making her whimper with pleasure again. Bending yourself over the pleasure-ridden ausar, you wrap your arms around her waist, [pc.chest] pressing into her back. From then on you breed her like the bitch she’s going to be for the day, fucking her ample ass with renewed vigor, whispering another <i>“Good girl”</i> into her twitching, slightly drooping wolf-ear. Syri’s still recovering from her orgasm when you feel yours begins.");
		if(pc.cumQ() >= 1000) output(" You slam your [pc.cock " + x + "] home as it starts to spasm, spraying her bowels with your [pc.cum] as your climax intensifies. Syri cries out when your [pc.cumColor], hot [pc.cumNoun] starts to overwhelm her. You smile as her tight-tummy starts to distend in your arms, the she-wolf letting out a quivering groan of <i>“F-fuuuuuuuuck,”</i> as she’s pumped full of your [pc.cum], belly rounding all the more until your [pc.cumNoun] begins to leak from her gaping pucker.");
		else output(" You slam your [pc.cock] home as it starts to spasm, spraying her bowels with your [pc.cum]. Syri cries out in response, the chorus of your combined moaning filling your ship.");

		if(pc.cumQ() >= 4000) output("\n\nYou’re left with your chest heaving, hands gently caressing your puppy’s swollen stomach, oh-so full of your [pc.cum].");
		else output("\n\nYou’re left with your chest heaving, your arms still wrapped around your puppy’s waist.");
		output(" Syri seems pretty exhausted after that, panting like the well-fucked bitch you’ve made of her");
		if(pc.cumQ() >= 100) output(", [pc.cum] dribbling from her gaping pucker");
		output(". You grin and withdraw your cum-leaking [pc.cockNoun " + x + "] from her gaping hole, ");
		if(pc.cumQ() >= 500) output("a torrent of [pc.cum] splling out onto the sheets.");
		else output("[pc.cum] spilling out onto the sheets.");
		output(" <i>“Hope my puppy’s up for more,”</i> you say, giving the she-wolf a slap on the ass, <i>“because we’re going to be at this all day.”</i> Syri manages to give you a smug look over her shoulder.");
	}
	processTime(25);
	IncrementFlag("FUCKED_SYRI_COUNT");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",syriPetPlayAftermath);
}

//Catch Anal
//[CatchAnal]
public function catchAnalFromPuppySyri():void
{
	clearOutput();
	showSyri(true);
	moveTo("SHIP INTERIOR");
	author("HugsAlright");

	output("You deserve quite the prize for bringing this puppy to heel, and quite the prize you’ll get: a nice, knotty puppy-prick spreading your [pc.asshole] wide. Syri’s watching you, impatiently waiting for you to make your next move. You give the ausar a smug grin and lunge forward, grabbing her shoulders and pushing her onto her back. With a gasp of surprise she hits the mattress, and you climb atop her not long after, straddling her waist.");
	output("\n\nWhat a sight it is to see Syri like this: leash-bound and gagged under you, your wish her command. You bring your gaze down to her big ol’ tits, those nice, full orbs looking right back at you. Come to think, you don’t really get to have your fun with those nearly as often as you should. Your hands dart down faster than a ship through a warp gate, grasping at Syri’s double-D’s. The she-wolf lets out another muffled gasp, her body tensing for a moment before she realizes what you’re up to. You don’t waste time and start kneading and squeezing her impressive bust, producing a few suppressed whimpers from the puppy. Her breasts are putty in your hands, so soft and squeezable");
	if(annoSexed() > 0) output(", unsurprisingly like her sister’s");
	output(". You bring your fingers up to Syri’s cherry nubs and start tugging and pinching those stiff teats until her muffled whimpering becomes almost audible.");
	output("\n\nLooking over your shoulder, you see Syri’s throbbing cock at full mast, twitching eagerly, her knot ready to lodge itself inside any willing orifice. You turn back to your pet and give her a smile of approval. There’s just one thing left to do before you can ride her red rocket like a rodeo. Releasing your grip on her breasts, you slide yourself off Syri, bringing yourself down on your [pc.stomach] between her legs, your mouth left tantalizingly close to the wolf girl’s cock. Syri cranes her neck forward to get a look at what you’re doing. You smile up at her and say, <i>“lie down, girl.”</i> She rolls her eyes, but brings her head back down to lay on the bed, leaving you <i>“alone”</i> with her knotty ausar cock. Well, no point in holding back any longer; you give Syri’s deep-red shaft a long lick up the bottom of her shaft, coating your tongue with her potent flavour. You savour her taste for a moment, letting it roll around your mouth, licking your lips until you’re ready for the main course.");
	output("\n\nYou start with her knot, giving it a kiss before you let your [pc.tongue] wrap around it, wetting it with your saliva. Syri starts to moan through her panties, but you give her leash a tug, quieting her for a moment. Satisfied with the renewed silence, you move up, trailing kisses along Syri’s shaft until your lips meet her pointed tip, leaving your pet in agonizing anticipation. You bring yourself down ever-so-slowly until you reach the top of her knot, [pc.lips] caressing your puppy’s prick all the way down. Syri moans as you start to bob your head up and down her turgid length, tongue dancing around your mouth to continuously coat her doggie-dong in your spittle, making sure to get it nice and lubed up for what’s to come. Once you’re finally done gobbling up Syri’s cock, you pull off, causing her to release a stifled whimper, begging for release, but unfortunately for her: you’re more interested in a butt full of ausar dick than you are a mouth full of cum.");
	output("\n\nWith a wide, lusty grin on your face, you slide your way back up Syri’s sultry body until you’re straddling her wide hips. Keeping your eyes locked on your pet’s, you reach between your legs, and grab hold of her tongue-polished puppy prick, guiding her pointed cockhead to your eager pucker. Despite her previous stubbornness, Syri’s looking at you impatiently, as ready for this next part as you are. You don’t keep the girl waiting and begin to lower yourself onto her throbbing, rock-hard dick. Her lubed-up cockhead presses into your [pc.asshole], the pressure against your opening building before your puppy’s cock finally slips in, leaving her glans pressing into your spread pucker. You let out a cry of pleasure as you continue making your way down Syri’s puppy pole, listening to her moan into her gag. ");
	pc.buttChange(syri.cockVolume(0));

	output("\n\nYou savor every inch, every moment of Syri’s knotty ausar dong slipping into you. The feeling of her spreading your supple hole is almost blissful, but it all comes to an end once you halt yourself at her thick, red knot. You stop and take a moment and pull yourself together, [pc.asshole] spasming around Syri’s prick, it’s owner moaning and whining under you. Giving the puppy a smile you lean forward, tugging on her leash to bring her face closer to yours, offering a gentle <i>“good girl”</i> before you let her head fall backwards. You straighten yourself and get comfortable before you begin to lift yourself up again, spit-slick shaft gliding against your inner walls, the sound of your combined pleasure filling the ship. Your ascent is stopped as Syri’s glans meet your pucker again, and you wait there for a moment, watching your puppy squirm and moan, waiting for her cock to fill your [pc.asshole] again.");
	output("\n\nWithout warning, the panty-gagged ausar’s furry hands reach up to your hips, trying to force you back down onto her twitching dong. You’re quick to grab your disobedient pet’s wrists and pry them off you before leaning forward, pinning the puppy’s hands on either side of her head. <i>“Ah-ah,”</i> you taunt, bringing your face close to Syri’s, <i>“that’s a bad girl, a very, very bad girl.”</i> She wiggles and squirms, grumbling and cussing into her gag, but she ultimately gives up, relaxing her body and sighing. While keeping the wolf girl pinned down submissively, you start to move your hips again, pushing yourself down onto her knotty prick again, groaning loudly as you do so. You don’t stop, lifting your [pc.butt] back off Syri’s cock, then dropping yourself back down, again and again. Faster and faster, you ride her throbbing bitch-dick, chest heaving, letting her muffled moans push you further and further.");
	output("\n\nYou’re practically bouncing on Syri’s knotted tool at this point, your love tunnel eagerly swallowing her cock over and over again. Your mind is all but lost to lust when you hear Syri babbling something into her gag, seconds before the first couple shots of ausar spunk hit your inner walls. Not wanting to miss out on anything, you slam your hips downward, letting Syri’s knot pop into your waiting asshole, your mouth forming an <i>“o”</i> and letting out a silent scream of delight as your pet’s knot stretches you wide. Well, no time to rest yet; Syri’s still reeling with orgasmic pleasure under you as you roll your hips, striving for as much movement as her knot will allow, grinding it against your [pc.asshole], moaning as she fills you with her white-hot seed.");
	if(pc.hasCock()) output(" You feel your [pc.cock] begin to twitch and spasm as your climax rocks your body, spraying thick ropes of [pc.cumNoun] all over your puppy’s chest.");
	else if(pc.hasVagina()) output(" Your [pc.vagina] tightens as climax rocks your body, spraying [pc.girlCum] all over your puppy’s midsection.");
	output(" Your [pc.asshole] spasms around her knotted tool, back arching as your orgasms swells and ebbs.");

	output("\n\nAs your climax comes to pass, you fall forward onto Syri’s big, soft breasts, whispering a quivering little <i>“Good girl”</i> into her raven-furred wolf-ear as your chests heave against each other. Her knot is still stuck inside you, gently rubbing against your rectal walls with every breath she takes, so you figure you better get ready to be stuck here for a bit. You sprawl yourself out, keeping a tight grip on your pet’s leash in case she tries anything, although she seems a bit too tired to even attempt to rebel.");
	output("\n\nYou smile with delight and close your eyes, ready to sleep Syri’s knot away.");

	processTime(25);
	pc.loadInAss(syri);
	IncrementFlag("FUCKED_SYRI_COUNT");
	pc.orgasm();

	clearMenu();
	addButton(0,"Next",syriPetPlayAftermath);
}

//Cuddle
//[Cuddle]
public function cuddleWithSyri():void
{
	clearOutput();
	showSyri(true);
	moveTo("SHIP INTERIOR");
	author("HugsAlright");

	output("Perhaps your puppy would be more compliant if she was shown a bit of compassion, and you plan to do just that. <i>“Here, girl,”</i> You command, resulting in a grumbling Syri crawling her way over to you on her hands and knees. With a smile you order her to sit up, and she does so, mumbling complaints into her gag as she sits herself up on her knees. <i>“Now,”</i> you begin, reaching for the knot holding Syri’s panties in place, <i>“I’m gonna take this out, and you’re going to be a good puppy, right?”</i> The puppy in question gives her eyes a good roll before uttering a muffled <i>“right”</i> in response. Overjoyed at her agreement, you start to remove the makeshift gag from the wolf girl’s mouth, who stretches her jaw a bit as the undergarments come free.");
	output("\n\nWasting no time, you make your next move, quickly tackling the now audible wolf puppy and taking her down to the mattress. She lets out a yelp of surprise as you land on top of her, straddling the ausar on all fours, lust in your gaze. Without saying a word you drop down, your face landing in Syri’s cleavage as you let out a groan of satisfaction.");
	output("\n\nThe she-wolf gives you an unsure <i>“uh?”</i> before you wrap your arms around her back and pull the both of you over on your sides.");
	output("\n\n<i>“Nap time, girl,”</i> is all you say as you rub your cheeks all about Syri’s sizeable chest, letting warm ausar boobflesh carress your skin.");
	output("\n\nAs your arms tighten around her back Syri lets out a chuckle, <i>“Don’t tell me you’re going soft on me, Steele.”</i>");
	output("\n\nYou reach a hand down and give the noisy puppy a firm slap on the ass, <i>“Bad girl, quiet.”</i>");
	output("\n\nYour puppy gives you an unhappy grunt, but reciprocates your actions and throws her arms around your back, pulling you closer to her, heat radiating between your bare bodies. As your legs intertwine with Syri’s, you can hear her tail batting against the mattress, rather quickly, from the sound of it. You smile in complacence; you knew she wouldn’t be able to resist a good ");
	if(silly) output("Steele Cuddle™");
	else output("cuddle");
	output(".");
	output("\n\nSyri brushes a furred hand through your [pc.hair] as you settle in, nuzzling your head into her supple jugs. Your puppy seems happy with this little arrangement, although, judging by the ausar cock stiffening against you stomach, she might be up for a little more than a snuggle when she wakes up.");
	processTime(100);
	restHeal();
	clearMenu();
	addButton(0,"Next",syriPetPlayAftermath);
}

//[Next]
//Aftermath
//[Next]
public function syriPetPlayAftermath():void
{
	clearOutput();
	showSyri(true);
	author("HugsAlright");

	output("You spend the rest of your day treating Syri like the puppy she is, like you own her (and for all intents and purposes: you do). Your pretty pet’s body is all yours to have your way with; all her holes and poles yours to use. She grumbles and complains, of course, but follows your orders well enough, and complains less when she’s thoroughly fucked, so you make sure she always is. Time passes, though you don’t keep track, the scent of ausar cum in your ship growing ever more powerful with each passing orgasm of Syri’s.");
	//hasCock:
	if(pc.hasCock()) 
	{
		output("\n\nOnce again, you empty your [pc.cum] into Syri’s waiting maw, ");
		if(pc.cumQ() >= 2000) output("her belly distending slightly as your seemingly endless bounty flows down her throat.");
		else output("your puppy swallowing your seed as she’s held down on your [pc.cock] by her leash.");
		output(" You release your pet’s leash as your orgasm ends, making her cough as she comes off your cock to see you smiling down at her. What to do with your puppy next... you could - wait, has it been a day already? Well, looks like your fun has come to an end; you reach down and unbuckle Syri’s collar, freeing her from her day of servitude. <i>“Looks like time’s up girl,”</i> you say, giving her one last pet between her fluffy ears. Your former pet breathes a sigh of relief and asks if she can use your shower before she heads out. You oblige and tell the ausar you’ll join her.");
	}
	//noCock:
	else 
	{
		output("\n\nThrowing yourself down onto Syri’s throbbing cock, potent ausar spunk fills you once more, her bounty dribbling out of your [pc.asshole] as her orgasm comes to an end. You breathe a happy sigh as your pet comes down from her climax, and already you’re planning what to do with her next. You could - wait, has it been a day already? Well, looks like your fun has come to an end; you reach down and unbuckle Syri’s collar, freeing her from her day of servitude. <i>“Looks like time’s up girl,”</i> you say, giving her one last pet between her fluffy ears. Your former pet breaths a sigh of relief and asks if she can use your shower before she heads out. You oblige and tell the ausar you’ll join her.");
	}
	output("\n\nIn the shower you tease Syri mercilessly, telling her what a good little puppy she makes, and that the two of you should do this more often. She chuckles in response, and starts to step towards you, telling you that the two of you should most certainly do this again. The now free ausar girl presses herself into you, trailing her furred hands up you body and telling you <i>“Next time it’ll be you on the leash, though.”</i> Grinning deviously, she pulls back and returns to washing a day’s worth of cum off herself.");
	output("\n\nMaybe you should be a bit worried; she seemed serious.");

	processTime(60*22);
	pc.orgasm();
	if(!pc.hasCock()) pc.loadInAss(syri);
	IncrementFlag("SYRI_PETPLAY_WINS");
	moveTo("SHIP INTERIOR");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function syriGivePanties():void
{
	clearOutput();
	showSyri(true);
	author("HugsAlright");
	clearMenu();
	
	if (pc.isNice())
	{
		output("<i>“Sure,”</i> you say, pausing to reach for your own clothes, <i>“But I want to give you something first!”</i> Finally finding the article you’re looking for, you ball it up and hide it in your hands, turning towards Syri.");
		output("\n\n<i>“Oh?”</i> the ravenette hums, smirking down at your intertwined fingers, <i>“Alright, I’m game. What’d you got?”</i>");
		output("\n\nGrinning wide, you unfold your hands -- and your [pc.lowerUndergarment] -- to reveal the latter in all its sex-stained glory, prompting a barely contained smile from your ausar companion.");
		output("\n\n<i>“Thanks,”</i> she says, happily taking the undergarment from your hands and bundling it with her own clothes, <i>“I’ll be sure to take good care of them... now about that shower.”</i>");
	}
	else if (pc.isMischievous())
	{
		output("<i>“Sure,”</i> you say, pausing to reach for your own clothes, <i>“But I think you’re gonna need this before you leave.”</i> Finally finding the article you’re looking for, you ball it up and toss it towards Syri with a call of <i>“Heads up!”</i>");
		output("\n\nThe ravenette easily catches the naughty orb then goes to unravel it, a barely contained smile appearing on her face as your sex-stained underwear is revealed. The ausar takes a deep breath of your scent as she holds your [pc.lowerUndergarment] up, trying to be sly by keeping them away from her face.");
		output("\n\nWith an almost lustful sigh, Syri lowers your gift again. <i>“Thanks,”</i> she says, happily taking the undergarment and bundling it with her own clothes, <i>“I’ll be sure to take good care of them... now about that shower.”</i>");
	}
	else
	{
		output("You don’t give Syri answer just yet. Instead, you quickly reach for your own clothes to search through them. Finally finding the article you’re looking for, you ball it up in your hands, and pelt it at your lover in a very " + pc.mf("gentlemanly", "ladylike") + " fashion.");
		output("\n\n<i>“Hey!”</i> the disgruntled puppyslut yells as the naughty orb hits her face, covering her visage with your sex-stained underwear. As the ausar goes to remove your [pc.lowerUndergarment] from her face, she pauses, taking a muffled, deep breath full of your scent, reveling in your " + (pc.hasCock() ? "musk" : "aroma") + " before pulling your clothing away.");
		output("\n\n<i>“Guess these are mine now, huh?”</i> Syri asks with a smirk, trying too hard to keep your [pc.lowerUndergarment] away from her nose and her tail from wagging.");
		output("\n\nYou tell the wolfy shemale you thought she could use some extra underwear after she “lost” her own on your ship.");
		output("\n\n<i>“Thanks,”</i> she says, happily taking the undergarment and bundling it with her own clothes, <i>“I’ll be sure to take good care of them... now about that shower.”</i>");
	}
	output("\n\nYou chuckle at Syri’s nonchalant attitude and point her to your bathroom. Then just like that, she’s gone, the distant sound of running water soon filling your ears.");
	output("\n\nWhile the raven-haired beauty is away, you do your best to clean up your quarters, dressing yourself with somewhat unsullied clothing and replacing cum-stained sheets " + (celiseIsCrew() ? "hopefully leaving the rest to Celise" : "") + ". By the time Syri’s back, still drying all that fur of hers, things seem more or less like there wasn’t a libidinous ausar in your bed. She gives an approving nod and offers you a hand up, “Buy you a drink?”");
	output("\n\nYou smile and follow the ausar out as she grabs her jacket, walking hand-in-hand back to " + (syriAtBurts() ? "Esbeth":"Irestead") + ", raven tail wagging happily.");
	
	processTime(15 + rand(10));
	flags["SYRI_GIFT_PANTY"] = pc.lowerUndergarment.longName;
	pc.lowerUndergarment = new EmptySlot();
	if (syriQuestComplete()) currentLocation = "UVI R32";
	else currentLocation = "BURT'S MAIN HALL";
	
	addButton(0, "Next", mainGameMenu);
}

public function syriVideoEmailText():String
{
	var buff:String = "";
	
	buff += "<i>There isn’t a single line of text in this email, only an attached video file with a thumbnail that’s hard to make out. With a cocked eyebrow, you hit the play button, and almost immediately your eyes go wide. It’s Syri alright, with her legs spread and propped up on her desk, a fluffy hand firmly gripping her own doggy-cock, an ausar-shaped dildo buried to the knot in her ass, and her face covered by a pair of undies. Hold on... is that <i>your</i> underwear she’s sniffing?! Hot " + (silly ? "dog" : "damn") + "! You better save this video for later!</i>";
	buff += "\n\n<i>Wait... did Syri mean to send you this message?</i> ";
	buff += "\n\n(The video has been downloaded to your ship’s console!)";
	
	return buff;
}

public function syriJackVid():void
{
	clearOutput();
	showSyri(true);
	author("HugsAlright");
	clearMenu();
	
	output("It doesn’t take you too long to bring up that special video your favourite ravenette sent you, and even less time to hit the play button.");
	output("\n\nThe whole thing starts with Syri already whimpering, sitting with her legs spread wide and propped up on her desk... and your " + flags["SYRI_GIFT_PANTY"] + " held between her teeth. She pulls a hand back from her terminal’s mouse to grope at her chest as an already lubed-up ausar dildo presses against her pucker. With a little extra pressure behind her wrist, the toy’s tapered tip pops into her accompanied by a sharp gasp. The shewolf continues to slowly ease the faux-cock into herself while her free hand gets a firm grip on the swiftly stiffening doggy-dick between her legs and starts to stroke it. Holo-recorded whimpers and pants fill your ears as that dildo slides into Syri, her asshole visibly clenching around the plastic shaft until synthetic lubricants drip down the curves of her big ol’ butt.");
	output("\n\nThe ausar wastes no time knotting herself when she gets going, pressing that thick ball of artificial cockflesh against her pucker. With a chorus of forceful grunts, Syri pushes the breeder’s knob into her, letting it stretch her wide until it finally pops in, tearing a low, pleasured groan from her lips.");
	output("\n\nStill stroking her shaft, the ausar shemale reaches for a small button on the base of her dildo and presses it, and judging by the way she starts moaning, that toy’s a vibrator!");
	output("\n\nWith her free hand, Syri pulls your " + flags["SYRI_GIFT_PANTY"] + " from between her pointed ivory and holds it to her face, obscuring most of her visage as she takes a deep breath full of your scent. Her race’s sense of smell is something to behold, because she growls like an animal in heat when she takes in your " + (pc.hasCock() ? "musk" : "aroma") + ", jerking herself off even faster, vigorously rubbing soft fur against her sensitive ausar dong. You can see her tease her knot with each downstroke, wrapping her fingers around the big red ball of cockflesh only to let off before she gets too worked-up. She keeps your " + flags["SYRI_GIFT_PANTY"] + " glued to her nose, each whiff of your sexual bouquet she takes in driving her to move faster and drawing choruses of moans and grunts from the wolf-girl. All the while her ass spasms around that vibrator, making her legs kick, almost enough to knock some things off her desk, thrusting against her own hand.");
	output("\n\nEventually, but unsurprisingly, the combination of your scent, that knotty dildo, and her own unyielding masturbation becomes too much for Syri, and with a loud cry of <i>“[pc.name]!”</i> her orgasm begins. Her whole body tenses on the screen before you, her eyes closing and back arching as bliss overtakes her senses. The ausar can only muster a grunt as her deep-red cock convulses in her grip, erupting in a fountain of hot, alabaster cum that splatters onto her bare breasts and dribbles down over her fur-covered digits. Her hips buck forward in some act of breeding instinct, trying to fuck the lover that isn’t there, even as she clenches around her vibrating toy and cums her brains out.");
	output("\n\nComing down from her peak with a long sigh of <i>“Oh yeah”</i> and your underwear still on her face, Syri slumps back into her chair, bringing her knot-filled ass a bit closer to the camera for you to see. She lets her cock fall from her hand, still dripping seed all over, and reaches back for her computer’s keyboard. There, you catch a few precious moments of the ausar woman’s heaving chest in full view, sun-kissed skin glistening with beads of sweat and jizz that roll down her boobflesh and over her cherry-red nipples. Then just like that, the video ends, stopping on a frame with Syri’s well-pleased, " + flags["SYRI_GIFT_PANTY"] + "-covered face taking up most of the screen.");
	output("\n\n<i>Whew.</i>");
	output("\n\nWith that done, you click your way off the video, and get ready to blow off some steam... maybe you could go visit Syri.");
	
	processTime(10 + rand(3));
	pc.lust(60);
	
	addButton(0, "Next", smutFapMenu, true);
}