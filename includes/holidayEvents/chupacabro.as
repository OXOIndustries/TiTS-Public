//Hugs' spooky halloween combat dream

public function reahaIsScaredOfTheChupacabro():void
{
	clearOutput();
	clearMenu();
	author("HugsAlright");
	showName("\nREAHA");
	showBust(reahaBustDisplay());
	
	output("As you’re " + (!pc.isNude() ? "undressing and " : "") + "getting ready for bed, your door hisses open, grabbing your attention and revealing a curvy, stout body standing in the frame. You can just barely make out the strawberry-blonde hue of the figure’s hair with almost all the lights out. It’s Reaha, no doubt.");
	output("\n\nShe’s holding an arm under her big ol’ boobs and rubbing the other nervously. <i>“Hey, [pc.name],”</i> she says quietly, noticing she’s got your attention, <i>“Hey, uh, you wouldn’t mind me sleeping with with you tonight, do you?”</i>");
	if(flags["CREWMEMBER_SLEEP_WITH"] == "REAHA") output("\n\nWell, considering that she already does sleep with you, probably not, but Reaha is visibly upset, and you ask her what’s got her so worried.");
	else output("\n\nBefore you can consider it, you notice that Reaha is visibly upset, and you ask her what’s got her so down.");
	output("\n\n<i>“Oh, it’s nothing, really,”</i> she says, giving you a little smile and stepping out from the doorframe, <i>“Nothing important, anyway.”</i> She shakes her head and walks towards your bed before taking a seat on the edge, <i>“It’s just this dumb story, an urban legend from New Texas: " + (silly ? "el Chupacabro" : "the Chupacabro") + ".”</i>");
	output("\n\nYou cock an eyebrow at that and ask her what the hell exactly a <i>“Chupacabro”</i> is.");
	output("\n\n<i>“A made-up monster that gets used to scare kids that stay up too late,”</i> she sighs, turning to you, <i>“Some sort of goat-bull with 6 foot horns and eyes made of fire that got raised by varmints and likes to eat cows on New Texas. That’s the thing, though, I know it’s a load of crap made up by some coastal hillbilly... but it still scares the hell out of me, like I’m a kid.”</i> The cowgirl chuckles and shakes her head again, <i>“I think part of it has to do with my sisters buying some cheap Halloween mask and scaring the hell out of me with it one year.”</i>");
	output("\n\nShe grimaces at the memory before placing that thought aside, <i>“Anyway, according to ‘legend,’ this is the time of year he comes back to hunt and prey on all the pretty young cows who misbehave... and I just thought... you know, after all you’ve done for me, that sleeping with you might make me feel a bit more safe.”</i> She smiles warmly at you with that.");
	output("\n\nLooks like your favorite cow is spooked by some old New Texan campfire stories. You could let her sleep with you, safe and comfortable in your arms, or leave her to face her fears on her own...");
	
	flags["CHUPACABRO'D"] = 1;
	processTime(5);
	
	addButton(0, "SleepWith", dontWorryReahaIllGetRapedWithYou, undefined, "", "");
	addButton(1, "NoSleepWith", dontBringYourTexanMonstersInMyBed, undefined, "", "");
}

public function dontBringYourTexanMonstersInMyBed():void
{
	clearOutput();
	clearMenu();
	author("HugsAlright");
	showName("\nREAHA");
	showBust(reahaBustDisplay());
	
	output("You shake your head and tell Reaha she’s on her own tonight. Her smile immediately fades in place of a scared look, but you " + (!pc.isAss() ? "place a reassuring hand on her shoulder and " : "") + "explain to her that she’ll be better off facing her fears on her own.");
	output("\n\nThe cowgirl’s eyes narrow with determination. <i>“You’re right,”</i> she states, going to stand up from the bed, <i>“I can do this! It’s just some dumb story, right?”</i> Walking her way towards the door again, she turns back with a warm smile on her face, <i>“Thanks, [pc.name], I think I needed to hear that.”</i>");
	output("\n\nThen, just as soon as she appeared, she’s gone again, leaving her to deal with her problems and you to sleep alone peacefully.");
	
	pc.addHard(flags["CREWMEMBER_SLEEP_WITH"] == "REAHA" ? 5 : 2);
	processTime(5);
	
	addButton(0, "Next", sleep);
}

public function dontWorryReahaIllGetRapedWithYou():void
{
	clearOutput();
	clearMenu();
	author("HugsAlright");
	showName("\nREAHA");
	showBust(reahaBustDisplay());
	
	output("Smiling, you slide yourself over to Reaha, throwing your arms around her waist and pulling her close. You tell your little bovine friend she’s always welcome in your bed, gently fondling her " + (silly ? "biggy milky" : "big, milky") + " tits as you start to pull her down to the mattress.");
	output("\n\n<i>“Thanks, [pc.name],”</i> she coos happily, falling into your embrace, <i>“You’re the best...”</i>");
	output("\n\nSo, you both fall back onto the bed, squirming a bit as you settle in for what promises to be a nice, warm sleep. Your cowgirl nuzzles against your [pc.chest] and presses herself into you, a faint smile visible on her face while you both drift off to a peaceful slumber.");
	
	addButton(0, "Next", reahaYouBetterBeDyingOrBeingRapedToWakeMeFromMySlumber, undefined, "", "");
}

public function reahaYouBetterBeDyingOrBeingRapedToWakeMeFromMySlumber():void
{
	clearOutput();
	clearMenu();
	clearBust();
	author("HugsAlright");
	showName("\nYOUR BED");
	
	output("Something wakes you from your sleep.");
	output("\n\nYou jolt up from the covers, a feeling of worry suddenly set upon you. Hastily looking around, you see that Reaha is nowhere to be found.");
	output("\n\nThen you hear it - a frantic cry of <i>“[pc.name], help!”</i> from outside your room. It’s almost certainly Reaha’s voice.");
	output("\n\nAdrenaline surges through your blood at the thought of the poor cow being in danger, giving you the strength you need to leap out of bed and grab your gear and weapons, ready to deal with an intruder if there is one.");
	
	addButton(0, "Next", ohYouAreBeingRapedIGuessThatsReasonableThen, undefined, "", "");
}

public function ohYouAreBeingRapedIGuessThatsReasonableThen():void
{
	clearOutput();
	clearMenu();
	author("HugsAlright");
	showName("REAHA &\n" + (silly ? "EL" : "THE") + " CHUPACABRO");
	//Maybe there will be a Chupacabro bust eventually idk
	showBust(reahaBustDisplay(), "CHUPACABRO");
	
	output("You make your way out of your room as another cry for help permeates the otherwise eerily silent halls of your ship. Following the voice, you plunge into the pitch blackness of your ship’s corridors. You search for a light switch before pushing on, but the one you flick does nothing, leaving you in the dark.");
	output("\n\nShit. " + (silly ? "Looks like you walked into a shitty horror story." : " Let this be a reminder that you should change your lights more often."));
	output("\n\nWell, your friend’s in trouble and you’re not about to let the dark scare you back into your room. So, you move onwards towards your ship’s common area, cautiously approaching the already-open door and rounding the corner with disciplined patience. Then, your eyes see the unbelievable... the only things you can see beyond the lightlessness enveloping your ship.");
	output("\n\nReaha’s cowering in the corner, curled up into a scared, naked ball, looking up at a huge and imposing figure standing over her. She sees you out the corner of her eyes and turns towards you, visage brightening when the cow sees you’ve come for her.");
	output("\n\n<i>“[pc.name]!”</i> She yells, <i>“Get this rape-goat away from me!”</i>");
	output("\n\nThe towering silhouette before her straightens as she screams, slowly turning around until you can see who, or <i>what</i>, it is.");
	output("\n\nIt’s " + (silly ? "your mom, lol!" : "the damned Chupacabro!"));
	output("\n\nHe’s at least ten feet tall, stomping towards you on bowed, furry legs that end in cloven hooves. Massive, curling horns extend from his skull and his eyes glow red against the dark of your ship, illuminating the beast’s face and body, just like Reaha described! You can see he’s mostly humanoid, and might pass up for a New Texan if not for his super-human size. He’s definitely as muscular as " + (flags["LANDED_ON_TEXAS"] != undefined ? "any bull you’ve seen" : "the bulls you’ve heard of") + ", with biceps as big as your head and thighs as thick as your torso, accentuating the large, two-foot bullcock dangling between his legs. His angular face twists into a " + (pc.isFeminine() ? "sly smile as he scans your body... obviously more than a meal is on this monster’s mind." : "an angered, perturbed frown, obviously not happy about your interruption."));
	output("\n\nWell, so much for an urban legend; this fucker’s real!");
	output("\n\nThe goat-like beast clenches his fist and starts to walk away from Reaha, attention now fixed on you. He doesn’t seem much for words, because all he does is point at you " + (pc.isFeminine() ? "and then at his stiffening bull-dick" : "and then pound his fists together") + ".");
	output("\n\n" + (pc.isBimbo() ? "You’re flattered, but you still" : "You") + " grimace a bit at that and go to level your weapon at the hulking brute. Looks like you’re in for a fight.");
	
	addButton(0, "Fight!", iWillStopTheRapingDontWorry, undefined, "", "");
}

public function iWillStopTheRapingDontWorry():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new Chupacabro());
	CombatManager.victoryScene(chupacabroMoreLikeChupacablowsdick);
	CombatManager.lossScene(iDidntStopTheRapingSorryReaha);
	CombatManager.displayLocation("CHUPACABRO");
	
	CombatManager.beginCombat();
}

public function chupacabroMoreLikeChupacablowsdick():void
{
	author("HugsAlright");
	showName("REAHA &\n" + (silly ? "EL" : "THE") + " CHUPACABRO");
	//Maybe there will be a Chupacabro bust eventually idk
	showBust(reahaBustDisplay(), "CHUPACABRO");
	
	output("" + (silly ? "El Chupacabro" : "The Chupacabro") + " takes a few stumbling, angry steps towards you before falling to the ground. The fire fades from his eyes as he hits the floor, a long, curling horn shattering when his head meets the cold, hard ground, defeated.");
	output("\n\nYou breathe deep and let out a sigh of relief as you look down at the motionless monster lying on your ship’s hull, shaking your head with disbelief at whatever the fuck just happened. But, your thoughts are broken by Reaha’s voice.");
	output("\n\n<i>“O-oh my god, [pc.name],”</i> she says, her voice shaking and her body uncurling, <i>“You did it, holy shit, you beat the actual fucking Chupacabro.”</i>");
	output("\n\nYou smile at the realization your favorite heifer is okay and quickly bring yourself low to the ground beside her, wrapping your arms around her naked form scooping her up into a warm embrace.");
	output("\n\nShe blushes and grins, happily returning your hug and going to whisper in your [pc.ear]. <i>“Thanks, [pc.name],”</i> she says, nuzzling against you, <i>“I don’t know what would’ve happened without you... you’re the best.”</i>");
	output("\n\nPride swells in your chest as you hold Reaha close, yeah... you are pretty great, aren’t you?\n\n");
	
	eventQueue.push(itWasOnlyJustADreamWin);
	
	CombatManager.genericVictory();
}

public function iDidntStopTheRapingSorryReaha():void
{
	author("HugsAlright");
	showName("REAHA &\n" + (silly ? "EL" : "THE") + " CHUPACABRO");
	//Maybe there will be a Chupacabro bust eventually idk
	showBust("CHUPACABRO", "REAHA");
	
	if(pc.HP() <= 1)
	{
		output("Defeated, you fall to ");
		if(pc.isTaur()) output("your haunches");
		else if(pc.isNaga()) output("the ground");
		else output("your knees");
		output(", left looking up at " + (silly ? "el Chupacabro" : "the Chupacabro") + ", at his mercy as Reaha watches the situation unfold with visible worry.n");
	}
	else
	{
		output("You fall to ");
		if(pc.isTaur()) output("your haunches");
		else if(pc.isNaga()) output("the ground");
		else output("your knees");
		output(", stricken with lust, left looking up at the towering Chupacabro while Reaha looks upon your defeated form with visible worry.");
	}
	
	if(!pc.hasVagina() || !pc.isFeminine())
	{
		output("\n\nThe goat-bull steps towards you, grinning down at you, lust in his fiery red eyes. He reaches down and grabs at your scalp with a powerful hand, while his other grasps at his huge, half-hard cock and angles it towards you.");
		output("\n\nAlmost immediately, a powerful musk envelops you mind, pheromones like that of a Treated individual. Your tongue lolls from your mouth as you find yourself filled with a voracious need for dick. ");
		if(pc.isBimbo() || pc.isTreated()) output("Not that you aren’t used to this kind of thing...");
		output("\n\nYou look up at " + (silly ? "el Chupacabro" : "the Chupacabro") + " with a newfound, eager lust, that scent of his washing away any previous worry or anger you may have been holding on to. The goat-bull is happy to accommodate your desires and lets his horse-dong flop forward onto your face. The sudden heat of his cockflesh on your [pc.skinFurScales] makes you gasp, but your eyelids fall shut with lust as it overcomes your senses. You take your already lolling [pc.tongue] and drag it along the underside of " + (silly ? "el Chupacabro" : "the Chupacabro") + "’s shaft, taking in his musky taste and more of his scents.");
		output("\n\nIt doesn’t seem like he’ll be satisfied by just your tongue, though, because the monstrous man smirks down at you, tightening his grip on your head and pushing you back until his flat tip meets your [pc.lips]. It’s obvious what he wants and you’re happy to supply it, wrapping your lips around his cockhead, tongue flicking across and wetting his flare. You’re not given even a moment to enjoy that position before " + (silly ? "el Chupacabro" : "the Chupacabro") + " starts to thrust forward and pull you back down onto his meaty tool. Your eyes widen as the goat-bull attempts to force all of his shaft into your mouth, bucking his hips forward until the clap of cockmeat is just about down your throat.");
		output("\n\nYou struggle to control your gag reflex, but take it all the same, eyes rolling back as inch after inch of thick horse-dong is forced down your gullet. Then, it isn’t long before " + (silly ? "el Chupacabro" : "the Chupacabro") + " starts to thrust his hips, fucking your throat like his personal onahole, still looking down at your with the same smug smirk as his balls slap against your chin.");
		output("\n\nAnd it seems you aren’t the only one " + (silly ? "el Chupacabro" : "the Chupacabro") + "’s pheromones are affecting, because what you’re able to see of Reaha’s face is flushed red, and her fingers are drifting down to her slightly-parted lower lips. They delve in soon after, loosing a whimper from whimper from the redhead’s lips before they start to thrust in and out. Though, it’s hard to see exactly what’s going on with hard abs constantly slapping against your face and a cock down your throat. ");
		output("\n\nSpeaking of, it looks like " + (silly ? "el Chupacabro" : "the Chupacabro") + " is just about ready to finish. A strong thrust forward and a power push of your head back down onto his shaft seems to signal his climax. He grunts hards as his massive tool spasms between your lips, the first rope of his potent seed spraying across the back of your throat. You can barely breath and are on the verge of losing consciousness at this point, the goat-bull looming over you bucking his hips forward against your face, large balls emptying down straight down your gullet. Your [pc.stomach] even starts to swell with the sheer size of the monsters monstrous load, rounding with each shot of cum.");
		output("\n\nFinally, the beast of a bull seems to finish, and pulls his softening horsecock from your mouth, managing to leave alabaster essence splattered across your [pc.face]. The pheromones and the vigorous throat-fucking leave you dazed, barely able to comprehend what just happened.");
		
		pc.changeLust(75);
	}
	else
	{
		output("\n\nThe goat-bull steps towards you, grinning down at you, lust in his fiery red eyes. He reaches down and grabs at your shoulders with powerful hands, gingerly but forcefully pushing you down onto your back.");
		output("\n\nAlmost immediately, a powerful musk envelops you mind, pheromones like that of a Treated individual. Your tongue lolls from your mouth as you find yourself filled with a voracious need for dick. ");
		if(pc.isBimbo() || pc.isTreated()) output("Not that you aren’t used to this kind of thing...");
		output("\n\nWith your mind and thoughts haze by this scent-induced ardor, you hardly notice the goat-bull pressing his lips to your [pc.nipples]. You gasp at his touch, and even start whimper as he begins to suckle, " + (pc.isLactating() ? "drawing [pc.milk] from your [pc.breasts]" : "attempting to draw some milk from your dry chest") + " like the vicious blood-sucker Reaha made him out to be. It all fills you with an even greater need, leading you to " + (pc.isNaga() ? "uncoil" : "spread") + " your [pc.legs] and whine.");
		output("\n\n" + (silly ? "El Chupacabro" : "The Chupacabro") + " takes notice of your urgent tones and is happy to accommodate your needs and slide from your [pc.chest] and down " + (pc.isNaga() ? "between" : "atop") + " your [pc.legs], kneeling above you with that same smug smirk on his face. He takes hold of his big, imposing member and angles it towards your [pc.vagina], masculine hips moving slightly forward until his cockhead is pressed against your sopping nether lips.");
		output("\n\nYou whimper has his flat tip presses against your mons, lust easily overtaking any sort of worry or misgivings you might have been holding before this. " + (silly ? "El Chupacabro" : "The Chupacabro") + " doesn’t content himself with stopping there. He thrusts his hips forward, spreading your [pc.vagina] wide until his flare is firmly between your stretching, needy quim. You start to moan as the goat-bull pushes more of his thick, meaty shaft into you, widening your cunt around his tool as he pushes in. a visible bulge forms in your tummy as the penetration continues, a sure sign of the monster’s sheer size.");
		output("\n\nYou’re left babbling by the time " + (silly ? "el Chupacabro" : "the Chupacabro") + " bottoms out inside you, the combination of his girth and scene leaving you in bliss, [pc.vagina] spasming around his tool on the verge of orgasm.");
		output("\n\nAnd it seems you aren’t the only one " + (silly ? "el Chupacabro" : "the Chupacabro") + "’s pheromones are affecting, because what you’re able to see of Reaha’s face is flushed red, and her fingers are drifting down to her slightly-parted lower lips. They delve in soon after, loosing a whimper from the redhead’s lips before they start to thrust in and out. Though, it’s hard to see exactly what’s going on with this giant bull over you, already pulling out of your slavering cunt. You cry out as he does, inner walls being caressed by all that cock rubbing against them. Then, as soon as he’s out, he thrusts back in with considerable force, making you moan aloud, much to his delight. Again and again he repeats the same motions, vigorously fucking you and stretching you with his huge horsecock, leaving you to fill the room with pleasured tones as Reaha jills off to the whole ordeal in the corner.");
		output("\n\nYou’re hardly surprised by the time you reach your climax, your back arching and your voice reaching a fever pitch when the force of your orgasm finally hits you. Your whole body erupts into a fit of spastic movements, [pc.hips] grinding against " + (silly ? "el Chupacabro" : "the Chupacabro") + "’s instinctively. Pleasure shoots through your entire body, further dulling every other sense as your [pc.vagina] clamps down around the goat-bull’s cock, spasming and convulsing in a somewhat-rhythmic sequence that leaves the great, big brute grunting.");
		output("\n\nIt seems that’s enough to set the monster over his edge. His sides thrust forward, shoving all the bull-dick that will fit right into your spasming snatch. [pc.Girlcum] pours out around his shaft as it convulses inside you, already filling you with warm, white cum. ");
		if(pc.totalCocks() > 1) output("At the same time, your own [pc.cocks] empty themselves onto your [pc.chest], coating you with your own seed. ");
		else if(pc.totalCocks() > 0) output("At the same time, your own [pc.cocks] empties itself onto your [pc.chest], coating you with your own seed. ");
		output("\n\nYour [pc.stomach] swells with the sheer volumes of " + (silly ? "el Chupacabro" : "the Chupacabro") + "’s virile load, leaving your tummy rounded to the point where you look pregnant.");
		output("\n\nWhen the beast of a man finally does finish, he pulls out of you without any ceremony or hesitation, leaving you whimpering and gaping considerably as you’re emptied. You lie there on the floor, all full of cum and barely able to keep your eyes open after that forceful fucking as " + (silly ? "el Chupacabro" : "the Chupacabro") + " rises to his hooves again, smirking down at you.");
		pc.orgasm();
	}
	
	output("\n\nPoor Reaha doesn’t even get a chance to finish her fingering before " + (silly ? "el Chupacabro" : "the Chupacabro") + " is fixing his attention on her once more, stomping over to her. The cowgirl squeals with terror as the bull grabs one of her leg and starts to drag her out of the room, an evil grin on his face. ");
	output("\n\n<i>“Steeeeele!”</i> the heifer cries out as she’s pulled away, trying to reach out to your " + (pc.HP() <= 1 ? "tired" : "lust-filled") + " form.");
	output("\n\nThough, it feels like you’re paralyzed, locked in your place by fear as your friend is dragged off into the blackness of your vessel’s halls.");
	output("\n\nYou can hardly summon the " + (pc.HP() <= 1 ? "strength" : "will") + " to move... but you need to go after her... you need to save Reaha! Rising to ");
	if(pc.isTaur()) output("your haunches");
	else if(pc.isNaga()) output("up");
	else output("your knees");
	output(", you start to make your into the darkness of your ship again, [pc.walking] through the next corridor only to see the most terrible sight-\n\n");
	
	eventQueue.push(itWasOnlyJustADreamLose);
	
	CombatManager.genericLoss();
}

public function itWasOnlyJustADreamWin():void { itWasOnlyJustADream(true); }
public function itWasOnlyJustADreamLose():void { itWasOnlyJustADream(false); }
public function itWasOnlyJustADream(win:Boolean):void
{
	clearOutput();
	clearMenu();
	author("HugsAlright");
	showName("\nYOUR BED");
	clearBust();
	
	if(!win)
	{
		output("You wake with a gasp, shooting out from under your covers drenched in sweat. Your first immediate thought is to find Reaha, so you hastily look around before seeing her: still asleep in bed right next to you, safe and sound.");
		output("\n\nWait, that was a dream, wasn’t it?");
		output("\n\nYou breathe a sigh of relief and settle back down into bed, your movement seeming to stir Reaha wake. Her breath stutters tiredly as her pretty head rises from the pillow. She turns to look at you, smiling warmly as her eyes land upon your face.");
	} 
	else
	{
		output("Suddenly, you’re pulled from that embrace as you wake from your sleep. You feel rejuvenated as your [pc.eyes] open, seeing that you’re still in bed with Reaha safe at your side and coming to the realization that you just had one wild dream.");
		output("\n\nYou yawn and shift in your place, contemplating and trying to remember that vile Chupacabro as best you can, and your movement seems to be enough to stir your milky companion. Her breath stutters tiredly as her pretty head rises from the pillow. She turns to look at you, smiling warmly as her eyes land upon your face.");
	}
	output("\n\n<i>“Hey, [pc.name],”</i> the heifer breathes with a still-waking voice, <i>“Sleep good last night? I know I did.”</i> With that, she goes to wrap her slender arms around your waist, holding you close in a surprise morning hug.");
	output("\n\nYou chuckle and return the embrace, prompting Reaha to look up at you with a smile.");
	output("\n\n<i>“Thanks for that last night, by the way,”</i> she shakes her head, <i>“I know he’s not real, but it’s nice knowing no rapey Chupacabro would get past you.”</i>");
	output("\n\nYou briefly consider telling her about that dream you had, but decide against " + (win ? "boasting about something your brain made up" : "recounting getting your butt handed to you by a ten-foot-tall goat man") + ". Instead, you simply hold her close, enjoying the warmth of her naked flesh against your own for just a bit longer before you have to start another long day of fortune hunting, that terrible nightmare already fading from your thoughts...");
	
	/* Fen cut this because it's dumb and it should feel dumb. A commemorative key item would've been fine.
	if(win) pc.createPerk("Chupacabro Slayer", 1, 50, 0, 0, "You defeated the legendary Chupacabro, and now do +10% damage against treated individuals.");*/
	
	//do some sleep shit idk
	genericSleep(420 + rand(80) + 1);
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}