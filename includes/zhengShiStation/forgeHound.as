//Corona Lord Forgehound, by Wsan
public function showForgehound(nude:Boolean = false):void
{
	showName("\nFORGEHOUND");
	showBust("FORGEHOUND" + (nude ? "_NUDE":""));
}

//Meeting
public function forgehoundEncounter():Boolean
{
	showForgehound();
	author("Wsan");
	if(flags["FORGEHOUND_APOLIFUCKED"] == undefined) 
	{
		output("\n\n<i>“You! You’re not meant to be here!”</i> a deep voice barks from your side. You turn to see a large leithan man approaching you, glaring accusingly. <i>“You’d better have a good fucking reason for me not to shoot you on the spot.”</i>");
		output("\n\nThe six-barreled gatling gun, idly spinning in place mounted on his side, ensures that is not an idle threat. It swivels as he regards you with contempt; it looks like he controls it with the targeting eyepiece he’s wearing over his right eye.");
		output("\n\nThe man is muscled, wearing a bulky black combat vest with nothing underneath, his ashen gray skin exposed. It doesn’t look like its presence is really necessary, as the armor plates typical of leithans coat most of his body anyway. He’s built like a walking tank, standing at what looks like around thirteen feet tall, a gigantic specimen of his race.");
		output("\n\nOddly, he has two dog ears along with a couple of keratin protrusions atop his head, pretty clearly out of place. His face is exactly what you’d expect from a mercenary pirate: stubbled, with minor scarring. You can see a large one running from above his left eye down his cheek and others across the rest of his body where plates don’t protect him.");
		clearMenu();
		//[Fight!] [Talk] [Submit]
		addButton(0,"Fight",forgehoundFightSetup,true);
		addButton(1,"Talk",talkToForgehound,undefined,"Talk","Try talking to the big man.");
		//[Submit]
		addButton(2,"Submit",submitToForgehound,undefined,"Submit","Give in. The large, domineering man is just too intimidating and hot for you to fight him.");
	}
	else 
	{
		output("\n\n<i>“Oh, it’s you,”</i> a deep voice grunts in amusement from behind you. You whirl to see the leithan man you met here before,");
		if(pc.isHerm()) output(" your [pc.cocks] instantly growing erect and your [pc.vaginas] starting to drip with excitement");
		else if(pc.hasCock()) 
		{
			output(" your [pc.cocks] instantly hardening");
			if(pc.balls > 0) output(" while your [pc.balls] tighten in anticipation");
			output(" and your breathing becomes heavier");
		}
		else if(pc.hasVagina()) output(" your [pc.pussies] instantly beginning to drip with excitement and your breathing becoming labored");
		output(".");

		output("\n\n<i>“Wondered when you’d be back,”</i> he says, apparently completely unconcerned by your shaking hands gripping your weaponry. <i>“Do you want to fight before we fuck? I don’t mind.”</i>");
		output("\n\n<i>“Y-you,”</i> you say, already close to panting. <i>“You did something to me.”</i>");
		output("\n\n<i>“Oh, me?”</i> he says innocently. <i>“Funny, you seem a lot smarter than the first time we met. I guess even idiots can understand life-threatening danger when it’s inside them.”</i>");
		output("\n\nHe lowers his head a little and taps his head. No, he taps those keratin horns protruding from his head. He’s done that before, why is the gesture significant?");
		output("\n\n<i>“Do you know what these are?”</i> he asks you.");

		if(CodexManager.entryUnlocked("Dzaan")) 
		{
			output("\n\n<i>“I...”</i> you start, trailing off. Where have you seen these mentioned before? Was it your codex? A specific race had them as a trait. The... oh no. You gasp in utter dismay.");
			output("\n\n<i>“So you do,”</i> he says, a vicious grin splitting his face. <i>“But you didn’t even bother to think about them before the consequences of fucking a D’zaan alpha smacked you upside your empty head, did you?”</i>");
		}
		else
		{
			output("\n\n<i>“No,”</i> you say dully.");
			output("\n\n<i>“They’re what d’zaan alphas grow when they come of age,”</i> he informs you. <i>“That won’t really mean anything to you on its own, though. But if you’d done any research at all, you’d know d’zaan can be a pretty fucked up species. To make a long story short: their cum is addictive.”</i>");

			output("\n\n<i>“Oh, fuck,”</i> you groan in dismay.");

			output("\n\n<i>“Oh fuck is right,”</i> he agrees. <i>“See, getting d’zaan cum is actually pretty hard. In the end, the only way I could get these fuckass eggheads to give it to me is by having them load it in parallel with ausar genes. I don’t know what the fuck that really means, but it gave me the dog ears and the cock along with the cum. Honestly, well worth it. You should see yourself right now, by the way,”</i> he adds, smiling. <i>“Your despair is fucking palpable. Probably shoulda thought about this before the consequences of fucking a d’zaan alpha smacked you upside your empty head, huh?”</i>");
		}
		output("\n\n<i>“Well, not quite empty,”</i> he continues, strolling towards you. <i>“I bet it’s </i>full<i> of fantasies about me right now. Like gazing longingly into my eyes as I savagely fuck you full of my spunk. It’s great, right? You’ll romanticize even the most uncaring of treatment. I could let you pass out while I knot your throat and when you woke up, the first thing you’d do after swallowing is tell me you love me.”</i>");
		output("\n\n<i>“I- I won’t let you win that easy,”</i> you say, trembling as you struggle to steady your breathing. <i>“I won’t!”</i>");
		output("\n\n<i>“Well, we did only fuck once,”</i> he says, stopping and shrugging. <i>“If you really want to make this formality long and drawn-out, we can. Makes it even sweeter when you give up. But honestly,”</i> he adds, smirking at you, <i>“you don’t look like you’ll put up much of a fight.”</i>");
		output("\n\n<i>“S-shut up,”</i> you mutter.");
		pc.lust(25);
		clearMenu();
		addButton(0,"Fight",forgehoundFightSetup,true);
		addButton(1,"Submit",submitToForgehound,undefined,"Submit","Give in. The large, domineering man is just too intimidating and hot for you to fight him.");
	}
	IncrementFlag("FORGEHOUND_ENCOUNTERED");
	return true;
}

//For delayed fite setup
public function forgehoundFightSetup(immediate:Boolean = false):void
{
	var tEnemy:ForgeHound = new ForgeHound();
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(defeatForgy);
	CombatManager.lossScene(loseToForgehound);
	CombatManager.displayLocation("FORGEHOUND");
	if(!immediate)
	{
		clearMenu();
		addButton(0,"Next",CombatManager.beginCombat);
	}
	else CombatManager.beginCombat();
}

public function addictionTurnWaster():void
{
	clearOutput();
	author("Wsan");
	
	var damageValue:int = 2;
	if(pc.isSubby()) damageValue += 5;
	if(pc.isBimbo()) damageValue += 5;
	if(pc.isCumSlut()) damageValue += 10;
	
	output("You watch him, waiting for an opening so you can throw yourself at the muscular bulwark of his chest and just beg him to take you. To fuck you like he did before. To <i>use</i> you until he’s satisfied. When he notices you standing still and staring at him raptly, he stops and turns around, letting you admire his gigantic balls.");
	output("\n\n<i>“Just give up and you can suck all the spunk you like outta these,”</i> he says, taunting you.");
	output("\n\nThe cruel jibe brings you back to your sensibilities - mostly, at least.");
	output("\n\n<i>“Stop doing that,”</i> you moan, raising your weapons again.");
	output("\n\n<i>“You’re the one doing it,”</i> he says, smirking and turning back around.");
	
	applyDamage(new TypeCollection( { drug: damageValue } ), enemy, pc, "minimal");
	CombatManager.processCombat();
}

//[Sprint]
public function sprintToSafetyBois():void
{
	clearOutput();
	author("Wsan");
	output("You immediately break into a sprint, running faster than you ever have in your life. Plasma flies through the air where you just standing, more following in your footsteps! You realize, suddenly, the most crucial thing is to stay ahead of his eye and be unpredictable. There’s a slight delay between his target acquisition and the firing, along with the projectile actually reaching you. If you can just maintain this speed...");
	pc.energy(-10);
	clearMenu();
	addButton(0,"Sprint",sprintToSafetyBois2);
}

//[Sprint]
public function sprintToSafetyBois2():void
{
	clearOutput();
	author("Wsan");
	output("You’re panting and sweating, your athletic ability the only thing between you and the increasingly close hail of plasma fire superheating the air behind you. You can only keep this up for so long! There’s a weakness here you can exploit if you can just survive long enough to see it!");
	output("\n\n<i>“Why won’t you fucking die?!”</i> the leithan screams in rage.");
	pc.energy(-10);
	clearMenu();
	addButton(0,"Sprint",sprintToSafetyBois3);
}

public function sprintToSafetyBois3():void
{
	clearOutput();
	author("Wsan");
	output("You put your head down and run. You can <i>feel</i> the heat behind you, encroaching upon not only your body but your mind. His threat of burning in hellfire seems very real right now. In the last moments you have, you find yourself fixated on a particular memory of your childhood. Strange, you’d always thought it was meant to be your entire life that flashed by.");
	output("\n\nYou’re running down the track, behind the guy in first. Sometimes you don’t win. That’s sports, really. Even if you were to run your absolute hardest, you probably wouldn’t be able to catch up. Limits are just that - limits. They were never meant to be surpassed. Then you hear a voice, loud and clear, as if it were right in your ear. It’s your dad, on the sidelines.");
	output("\n\n<i>“Come on, [pc.name]!”</i> he shouts, hands cupped to his mouth. <i>“You can do it! I believe in you!”</i>");
	output("\n\nYeah, that’s him alright. You wouldn’t be who you are today without him taking care of you and cheering you on. Plus... you just don’t want to let him down. To let him see you giving up. If nothing else, you want to try. You hear a loud, mechanical click and the noise that’s drilling into your brain suddenly starts to subside.");
	output("\n\nYou glance over to see the leithan struggling with his weapon, hitting it with his fist then recoiling in pain as the red-hot barrels burn his hand. It’s clearly inoperable - the barrels are almost melted from the continuous fire. This is what you were waiting for, a chance to snatch victory from the jaws of defeat. You double over, breathless.");
	output("\n\n<i>“Thanks, dad,”</i> you huff, hands on your knees. <i>“Wouldn’t still be here without you.”</i>");
	output("\n\n<i>“You!”</i> the leithan roars, his fists clenched in anger. <i>“You piece of fucking </i>shit<i>! How the fuck- I’m going to rip you to PIECES!”</i>");
	output("\n\nHe charges forward as you stand back up, ready to fight. You can see it in his face. The fear. You can beat him.");
	enemy.createStatusEffect("Disarmed",8000);
	enemy.createStatusEffect("Overheated");
	pc.energy(-10);
	CombatManager.continueCombat();
}

//[HoldGround]
public function holdGroundBois():void
{
	clearOutput();
	author("Wsan");
	output("You’re not going to run. You’re going to stand right here and plant your feet. ");
	if(pc.rangedWeapon is AegisLightMG) output("The LMG chatters in your armored fist, shell casings flying from it in a cascading rainbow of brass");
	else if(pc.rangedWeapon is Chaingun) output("Your chaingun screams in your armored fist, hundreds of spent shells flying from it as you keep it trained on the leithan");
	else if(pc.rangedWeapon is Chainlaser) output("Your chainlaser howls in your armored fist like a banshee, the servo whining as fire pours from the rotating barrels");
	else output("You shoot at him over and over, time seemingly drawing to a standstill as the two of you exchange fire");
	output(". You don’t know which of you is going to die first, but you’ll never go down without a fight and at a minimum you’re taking this guy with you. You grit your teeth as white-hot plasma scorches your armor. You can feel the heat rising inside the suit, sweating as you pour fuel on the fire. Are you going to die here, cooked alive in your armor?");
	clearMenu();
	addButton(0,"Next",holdGroundVictory);
}

public function holdGroundVictory():void
{
	clearOutput();
	author("Wsan");
	output("It never comes to that. The leithan staggers backwards clutching his chest, the gatling’s arc of fire jolting upwards before clicking to a stop as the servo fails. The continuous fire was too much for a plasma weapon to take. You finally stop firing, watching as he starts to fall.");
	enemy.HP(-400);
	CombatManager.continueCombat();
}

//[Talk]
//Available one time only.
//tooltip: Try talking to the big man.
public function talkToForgehound():void
{
	clearOutput();
	showForgehound();
	author("Wsan");
	output("<i>“What are you?”</i> you ask, despite yourself.");
	output("\n\n<i>“The forgehound,”</i> he growls menacingly, eyes narrowing. <i>“And you’re in my territory.”</i>");
	processTime(2);
	clearMenu();
	//[Insult] [Keratin?] [Apologize]
	if(flags["FORGEHOUND_INSULTED"] == undefined) addButton(0,"Insult",insultDatFireBoi,undefined,"Insult","Mock him for fun.");
	else addDisabledButton(0,"Insult","Insult","You already did that. It didn’t accomplish much.");
	if(flags["FORGEHOUND_KERATIN_TALK"] == undefined) addButton(1,"Keratin?",keratinChunksHound,undefined,"Keratin?","Ask him about the odd features atop his head.");
	else addDisabledButton(1,"Keratin?","Keratin?","He already told you. It came from his gene mods.");
	addButton(2,"Apologize",apologizeToDzaanMan,undefined,"Apologize","You’re just pissing this guy off even more. Apologize to try and get in his favor.");
}

//[Insult]
//tooltip: Mock him for fun.
public function insultDatFireBoi():void
{
	clearOutput();
	showForgehound();
	author("Wsan");
	output("<i>“Oh no, don’t hurt me, mister forge puppy,”</i> you mock him. <i>“You just look so menacing with your wittle doggy ears and nubby horns!”</i>");
	output("\n\n<i>“I’m gonna beat the </i>fuck<i> out of you before I show you exactly why those are there, you " + pc.mf("dumbfuck","stupid cunt") + ",”</i> he hisses viciously, tensing up as he prepares to leap forward.");
	output("\n\nLooks like that pissed him off a little. <b>It’s a fight!</b>");
	flags["FORGEHOUND_INSULTED"] = 1;
	processTime(2);
	//fite
	forgehoundFightSetup();
}

//[Keratin?]
//tooltip: Ask him about the odd features atop his head.
public function keratinChunksHound():void
{
	clearOutput();
	showForgehound();
	author("Wsan");
	flags["FORGEHOUND_KERATIN_TALK"] = 1;
	output("<i>“What’re the horns on your head for?”</i> you inquire.");
	output("\n\nHe can’t resist rolling his eyes. <i>“God damn, you’re a special breed of stupid. Have you ever seen what a gatling plasma cannon does to a person? I bet you haven’t.”</i>");
	output("\n\nYou stay silent, still looking up at his horns. Curiosity burns within you.");
	output("\n\n<i>“Fuck me,”</i> the leithan man sighs angrily, shaking his head. <i>“They’re a byproduct of my gene mods, same reason I have the dog ears. Now what the fuck are you doing here, you absolute moron?”</i>");
	output("\n\nIf at all possible, he looks even angrier than he was before. How unfortunate.");
	//Back to talk menu, remove Keratin? from options
	processTime(2);
	//disable button
	setButtonDisabled(1);
}

//[Apologize]
//tooltip: You’re just pissing this guy off even more. Apologize to try and get in his favor.
public function apologizeToDzaanMan():void
{
	clearOutput();
	showForgehound();
	author("Wsan");
	output("<i>“Sorry, I didn’t mean to annoy you,”</i> you say, shrugging and spreading your arms. <i>“I don’t know why you’re so angry with me.”</i>");
	output("\n\nThe leithan stares at you dully for a few seconds, expressions flickering across his face before he finally settles on ‘resignation’. He heaves another sigh.");
	output("\n\n<i>“If you really want to apologize," + (pc.isTaur() ? " turn around and I’ll mount you to blow off some steam":" get on your knees and suck my cock") + ",”</i> he says.");
	processTime(2);
	clearMenu();
	//[Okay] [No]
	addButton(0,"Okay",okayApologySexItIs,undefined,"Okay","That seems like a pretty good deal.");
	addButton(1,"No",noYouArentApolifucking,undefined,"No","But you don’t want to do that.");
}

//[Okay]
//tooltip: That seems like a pretty good deal.
public function okayApologySexItIs():void
{
	clearOutput();
	showForgehound(true);
	author("Wsan");
	output("<i>“And then I walk free, right?”</i> you ask.");
	output("\n\n<i>“</i>God<i>, yes,”</i> the leithan replies. <i>“With any luck I’ll never see you again in my life. But then again,”</i> he continues, laughing a little and tapping the keratin protrusions on his head, <i>“I’ve got a funny feeling you’ll be back. Now " + (pc.isTaur() ? "turn around":"kneel") + ", bitch.”</i>");
	output("\n\n<i>“Hey, you don’t need to be rude,”</i> you mutter, " + (pc.isTaur() ? "turning around and looking back":"kneeling down in front of him, noting how muscular his forelegs are from up close") + ". <i>“Like this?”</i>");
	output("\n\n<i>“That’s right. So you </i>can<i> follow an instruction if I keep it simple enough,”</i> the man says, letting out a breath of relief. <i>“Good [pc.boyGirl].”</i>");
	if(pc.isBimbo()) output("\n\nYou giggle a bit at that. Yeah, you might not be the <i>brightest</i> bulb, but you’re definitely the goodest.");
	if(pc.isTaur())
	{
		if(pc.isBimbo()) output(" ");
		else output("\n\n");
		output("You wiggle your [pc.ass] a little, waiting for your stud.");
		if(!pc.isCrotchExposed()) output(" He’s quick to remove your [pc.crotchCovers], letting your coverings slide down your hindlegs to the ground.");
		output(" He’s on top of you not even a second later, scrabbling around your sides to get a proper grip - fuck, he’s big! And not even his cock! You’re having trouble just staying upright with such a gigantic leithan on top of you.");
	}
	else 
	{
		if(pc.isBimbo()) output(" ");
		else output("\n\n");
		output(" You stick out your [pc.tongue] at the leithan, provoking him just a bit. He steps over you, what’s hanging between his hindlegs drawing closer. Oooh, his balls are <i>fat</i>! His cock is apparently still in its sheath, but there’s more than enough to keep you entertained here.");
	}

	if(pc.isTaur()) 
	{
		output("\n\nHis body is so big you’re practically enveloped, his forelegs almost touching the ground even while he’s on top of you. You have an inkling of how this is going to end, but you’ll do your best and stay standing for now - his cock’s not even inside yet, and that’s going to be the best part!");
		output("\n\n<i>“Stay still, cumdump,”</i> he grunts. You can feel his powerful hips shifting behind you, getting himself in position. You can already tell this is going to be very, very rough. <i>“Here.”</i>");
		output("\n\nWith a single thrust, he spears your [pc.vagOrAss] a foot deep with his gigantic, swollen cock. Your eyes cross momentarily at the feeling of it, your tiny tensing up at the moment of entry not at all enough to have protected you. A groan of surprise leaks from your lips, your [pc.legs] shaking already. How fucking big is his dick that he can get a full foot of himself inside you on the first thrust? You can’t even feel his groin against your hindquarters, not to mention...");
		if(pc.hasVagina()) pc.cuntChange(0,new ForgeHound().cockVolume(0));
		else pc.buttChange(new ForgeHound().cockVolume(0));
		output("\n\n<i>“Bet you didn’t expect a dogcock, huh?”</i> he sneers from behind you. <i>“The tip’s usually nothing impressive, not like a horse. But I’ll save telling you why mine is special for the end. For now, you can just moan like the " + (pc.hasVagina() ? "cunt whore":"little fuckslut") + " you are.”</i>");
		output("\n\nYou do. Not because he told you to, but because it’s unavoidable. You can feel all the minute details of his penetration, the way his doggy cock throbs in time with his heartbeat and leaves a trail of precum in your sensitive " + (pc.hasVagina() ? "canal":"insides") + " every time. Fuck, you don’t want to admit it, but the way he’s controlling you is actually pretty hot. He’s got you completely in hand to the point where he might as well have a fucking bit in your mouth and a taur-sized saddle on your back.");
		output("\n\n<i>“That’s right,”</i> he murmurs. <i>“Submit to your alpha.”</i>");
		output("\n\nGod, every time his cock throbs is just... heavenly. There’s a burst of pleasure in your " + (pc.hasVagina() ? "cunt":"asshole") + " with each one, almost as if his precum is a drug. You can’t help it. You let out a long, low " + (pc.bovineScore() >= 3 ? "moo":"animal groan") + " of pleasure, your base instincts rising to the fore. Then, just in case you were thinking of recovering your dignity, he shoves another foot of himself inside you and all thoughts fly from your head.");
		output("\n\n<i>“Oh, </i>god<i>,”</i> you grunt, thrusting back at him. <i>“Fuck me! Fuck me! Fuck me!”</i>");
		output("\n\n<i>“Hahaha, that’s what I thought,”</i> he says, closer behind you now but still not balls-deep. Void, his cock must be fucking gigantic. You can feel it stretching out your insides, reshaping you and forcing your body to submit to his whims. <i>“Go ahead and cum.”</i>");

		output("\n\nIt’s not a choice. Wordlessly, you feel yourself tighten up around him as ");
		if(pc.isHerm()) output("your [pc.biggestCock] throbs once, twice, then lets out what feels like the fattest load you’ve ever cum. It splatters against the ground so hard your underbelly is flecked with [pc.cum], staining you with your own seed. Behind you, the dominant man enjoys a luxurious dick massage courtesy of your frantically squeezing and drooling cocksheath. Your juices soak his length, " + (pc.isSquirter() ? "squirting":"dripping") + " down your shaking hindlegs.");
		else if(pc.hasCock()) 
		{
			output("your [pc.cocks] tense up, ");
			if(pc.balls > 0)
			{
				output("your [pc.balls] tightening, ");
			}
			output("then shudder as " + (pc.cockTotal() == 1 ? "it lets":"they let") + " out a massive load that jets into the ground so violently it splashes your underbelly with flecks of [pc.cum]. Your asshole gives the man a nice massage as a reward for making you cum like a submissive little bitch, flexing and squeezing around him while he makes you work out everything you have to give from the end of your cock" + (pc.cockTotal() > 1 ? "s":"") + ".");
		}
		else if(pc.hasVagina()) output("your pussy desperately squeezes down on his dick, trying to milk it for more of that blissful precum but succeeding only in giving him a sensuous, shaking massage. You " + (pc.isSquirter() ? "squirt all over his underside, your warm juices spattering against his balls as if inviting them to do the same inside you while the excess runs down your hindlegs":"drool your juices all over his cock and down your hindlegs, unable to help yourself") + ". You can’t stop cumming, eyes fluttering while you try to comprehend what’s going on.");

		output("\n\nYou don’t even make a noise during the process, your mouth just hanging open in dumbfounded awe while your body uncontrollably and emphatically betrays you in the worst way. How did he do that? You’d never even imagined such a thing was possible, that you could just be told to cum and it would happen. This man is special, somehow. Different from all the rest. Suddenly, he’s in your ear.");
		output("\n\n<i>“Ready to become my breeding bitch?”</i> he whispers.");
		output("\n\n<i>“Nuh- no,”</i> you gasp, your heart breaking a little. You so badly want to give in but you understand that if you do, it’s all over and you’ll never escape. <i>“Nnnn- never!”</i>");
		output("\n\n<i>“Hah, you’re strong-willed,”</i> he chuckles, seemingly congratulating you. <i>“But I haven’t even started fucking you yet and you’re already cumming so hard. Wouldn’t it be easier to just give in now? I could make you feel even better.”</i>");
		output("\n\n<i>“Nnnnngh! Uhhh!”</i> you groan. It only makes it all the worse knowing that every word he’s saying must be true. This man could rule over you like a god if you just let him. <i>“I- I won’t!”</i>");
		output("\n\n<i>“That’s fine,”</i> he murmurs, calmer than you expected. <i>“You’ll be back anyway.”</i>");
		output("\n\nHe keeps saying that, and you don’t know why. All you know is that he abruptly " + (pc.hasHair() && pc.hairLength > 2 ? "grabs your [pc.hairNoun] and pulls":"puts his hand around your head and pulls you back by your chin") + ", forcing you to bend backwards until you’re looking up into his rugged face.");
		output("\n\n<i>“I want to see what you look like when I start fucking you,”</i> he states simply, and you try your hardest to scowl. The attempt is ruined when you let out a simpering, submissive moan of need.");
		output("\n\nThen, as swiftly as he made you cum, he’s fully inside you with one sharp movement of his hips. You’re mixed between shock and wanting to cry with joy, and he can see it all in your face. You can see him grin as he begins to fuck you with all three feet of his cock, ");
		if(pc.hasVagina()) output("his tapered tip pressing against your " + (!pc.isPregnant() ? "empty, fertile and defenseless ":"") + "womb");
		else output("revelling in the feel of your insides wrapping around him");
		output(". His smile only spreads when you let out a cry of ecstasy, your shame finally driving you to close your eyes while he spreads you wide and spears your dignity on the end of his stupendous cock.");

		output("\n\nHe promised that you’d walk free, but with every passing minute you’re less and less sure of the prospect of being capable of it. You can feel your ego crumbling before him, becoming more and more <i>his</i>, aided by that infuriating throbbing in his cock that sets your body alight with pleasure and need. He’s dangerous. You should never have agreed to this, it would have been better to fight. Now all you can do is rock underneath him and hope he cums soon and it’ll all be over.");

		output("\n\nUnfortunately for you, he seems content to just let you cum all on your own for what feels like hours. You start passing in and out of consciousness, eyes glazing over and breathing becoming labored and methodical while he ruts you. The only thing keeping utter submission at bay is a little voice in the back of your head promising you that if you do submit, it will all be over.");

		output("\n\nThat’s the only thing that gets you to the finish line, momentarily rousing yourself from what feels like a drug-induced stupor as the man begins to grunt in pleasure. Oh void, he’s finally going to cum. This is what you’ve been waiting for, you’ll be able to escape afterwards. The chance of escape seems very real now, and you can’t help but let a cry of joy from your lips as he cums.");

		output("\n\nThe next moment, everything is dashed on the rocks. Everything - your mind, your hopes, and even the little voice that was keeping you afloat. All of the things that make you ‘you’ dissipate in a pool of slick, warm seed that jets from the leithan’s cock into your " + (pc.hasVagina() ? "[pc.womb]":"guts") + " and drowns your mind in a thick, white haze. You stand stock-still, completely accepting of what he has to give. You drink down every load he delivers, obediently squeezing his cock just to give him moral encouragement.");
		output("\n\nYou hardly even notice that he chooses not to knot you, instead pulling out and letting his massive loads begin to run down your ass and underside. Your eyes are completely vacant and glossy, and you don’t even register the hard spank to your flank from your beloved.");
		output("\n\n<i>“Now get the fuck out and come back when you’re ready to submit completely,”</i> he says.");
		output("\n\nThat’s the last thing you remember from the encounter. When you open your eyes again, you’re alone. What... what <i>was</i> that? It seemed almost like hypnosis or some kind of psychic power, but you’ve never heard of such sudden control. Even now, you can feel an ache inside you, reminding you that you yearn for the man’s touch... and more of that sensational spunk. God, if you could live the rest of your life just getting to drink it - no! Damn it, this is what he was talking about. There’s something addictive about him.");
	}
	else
	{
		output("\n\n<i>“Oh, taking the initiative, are we?”</i> the man chuckles, enjoying the moment as you take his two gigantic balls and press them against your face, licking his sack while his musk surrounds you. Each one is as big as your fucking head, some perverse impulse inside you driving you to wonder what it would be like to make these beasties empty themselves inside you. You’re shuddering when he talks again. <i>“Hey, put your lips on my sheath.”</i>");
		output("\n\nYou hasten to do so. The thought of giving his emerging cock a nice greeting kiss and a cursory suck before you really get down to giving him his ‘apology blowjob’ and then going on your way is cute, after all. You’re gonna have so much fun watching him grunt and groan while you jack him off to finish him, his cum flying everywhere!");
		output("\n\nYou barely even notice the pointed tip emerging, but you definitely pay attention when the next several inches spring free so fast as his cock becomes erect that they shoot down your throat. Suddenly your eyes are wide and you have more than a foot of his monstrous dick down your gullet, practically pinning you directly beneath him as he gets thicker and thicker.");
		output("\n\n<i>“Aaaah, fuck yeah,”</i> the man sighs, luxuriating while you gurgle under him. <i>“Knew you were dumb enough for that. Bet you thought you were gonna be on the giving end, huh? Wrong, bitch,”</i> he grunts, punctuating the insult by lowering his hips just enough that you’re forced to straighten your spine to take him further inside. <i>“You’re going to sit there and be an obedient cumdump while I fuck your face until I cum inside your stomach.”</i>");
		output("\n\nYou reply by way of wet, desperate gurgles around his massive length, your jaw stretched so wide it hurts. All you can see is his underside, covering your panicked vision. You frantically beat your open palms against it, but receive nothing for your efforts but a mocking laugh.");
		output("\n\n<i>“Haha, did you not listen to what I said?”</i> the man asks, shifting his hindlegs a little. <i>“Do that again and I’ll claw you hard enough to scar that " + pc.mf("handsome","pretty") + " face of yours. Just calm down and you’ll realize it’s pretty good.”</i>");
		output("\n\nBy some miracle, you can still just barely breathe through your nose with him plunged what must be two feet inside you. At the very least, you’re not in imminent danger yet, and you don’t want to be clawed open - those hindlegs look extremely powerful, and you can’t even escape. It would be best to accept what he said and relax as best you can.");
		output("\n\n<i>“There you go,”</i> he says encouragingly, raising his hips and sinking them again. You gurgle some more, feeling his thick cock rub against the insides of your throat and stretch it taut. Tears leak from your eyes. <i>“You know, you’d never be able to fit this if you just started sucking it when I was already fully hard. Your throat just seizes up instinctively when such a large foreign object tries to get in. But if you take it offguard...”</i> he continues, raising his hips once more, <i>“you get a </i>fantastic<i> fucktoy!”</i>");
		output("\n\nHe begins slamming himself downwards, mercilessly battering your face with his cock. It feels like your entire upper half is being stretched around a tree trunk, and to make matters worse you can feel every singular throb of his overlarge dick in your throat, taut as it is. Each one signifies another spurt of precum directly into your stomach, and as irritating as it is to admit it, that feels <i>really</i> good. A wave of pleasure radiates outwards from each splattered deposit, and you find yourself looking forward to the next outrageous throb of his cock.");
		output("\n\nLuckily for you, he seemingly has more than enough to spare. You can feel ");
		if(pc.isHerm())
		{
			output("your [pc.cocks] hardening even as the bulge of your partner’s cock swells your neck outwards twice a second. You don’t know if it’s just the raw eroticism of the act or what he’s putting in your stomach, but you know your [pc.pussy] is getting wetter");
			if(!pc.isCrotchExposed()) output(" in your [pc.lowerGarments]");
			output(" with every downward thrust.");
		}
		else if(pc.hasCock() && !pc.hasVagina()) output(" your [pc.cocks] getting harder with every downward thrust. The harder you get, the more you wish he was in your [pc.asshole] instead - then he could make you cum, too. The longer he’s inside you, the more you’re inclined to jack yourself off in time to his orgasm.");
		else output(" your [pc.pussy] getting wetter with every downward thrust, dripping and drooling. God, if you’re this turned on just from having him bulging your neck outwards, how good would it be to have him inside your cunt? You find yourself wanting to masturbate, edging yourself until he cums too.");
		output("\n\n<i>“You can masturbate, you little biped cocksleeve,”</i> he grunts from above you. How did he know?! He can’t even see you! <i>“I know how horny you must be getting. I can feel your tongue lashing my cock even while I’m treating you like shit. You fucking love this, you dumb whore.”</i>");

		output("\n\nFuck it. You can ignore the insults, even if it hurts a little when he acknowledges that he’s treating you poorly. What’s important is that you’ve been given permission to get yourself off while you’re serving him. You already know how; you’re going to ");
		if(pc.isHerm()) output("jack off in time to those brain-massaging throbs of his cock, then shove your fingers up your cunt on his outstroke");
		else if(pc.hasCock()) output("jack off in time to those brain-massaging throbs of his cock");
		else output("shove your fingers up your cunt every time his cock throbs in your head");
		output(" until he cums. If he ever does, anyway. This guy seems like the kind of stud that could just go forever and ever...");

		output("\n\nThe moment you start, it’s evident you’re not going to last nearly as long as he will. It’s been barely ten seconds and already you can feel the familiar pangs of orgasm rising within you, halting your hands movements doing nothing to help. Have you <i>ever</i> been this sensitive? Is there something in his cum doing this to you?");
		output("\n\n<i>“Go ahead and cum,”</i> he tells you from above.");
		output("\n\nYou’ve barely even processed the fact he just commanded you to cum like you’re a two-bit whore being instructed to act out his fantasies before it happens. Your eyes fluttering at the sensation, you groan and gurgle into his majestic cock as your ");
		if(pc.isHerm()) output("own begins spurting seed all over you, your pussy tightening up on your fingers and " + (pc.isSquirter() ? "squirting all over your hand":"dripping on your palm") + ".");
		else if(pc.hasCock()) output("own spurts seed all over you, flopping up and down while the leithan continues to make violent love to your throat.");
		else output("pussy tightens up on your fingers, " + (pc.isSquirter() ? "spraying down your hand with femcum":"drooling femcum all down your digits") + ".");

		output("\n\n<i>“Good [pc.boyGirl],”</i> he grunts, and that’s the only acknowledgement you get.");

		output("\n\nWhat the fuck just happened? He just <i>made</i> you cum, like you’re some kind of willing bitch! You’re gonna ask him to pay you some respect after he’s done pummeling your throat with his big, beautiful dogcock. Well, make a polite request, anyway. For now, because you’re tired of the treatment and for absolutely no other reason, you decide to massage his gigantic, hanging balls so he cums faster and this’ll be over.");

		output("\n\nYou can hear his appreciation and you’re intensely grateful - you have no idea how long he’s been facefucking you, but you know you’re going to have trouble talking tomorrow and your neck’s going to be sore. Finally, when he cums you’ll be able to get out of here and away from this - this <i>impossible</i> cock, well before he can take command of you with it. You’re cognizant enough to recognize something is going on, just not what... yet. Maybe when he cums you’ll figure it out. That thought spurs you on to try just a little harder.");

		output("\n\nYour efforts are rewarded when you hear him begin to pant and strain, his cock hardening inside your throat. Then jets of slick, creamy jizz begin to jet inside your stomach, splattering against your walls, and your consciousness is being buoyed away on a hazy white cloud. Your [pc.lips] stretched taut around his spasming cock like any other fuckhole would be, you dimly perceive yourself sitting completely still and obediently letting him make use of your stomach to store his great, throat-stretching loads of cum.");

		output("\n\nYou don’t even get to taste it. His gigantic dick is far too deep inside you for that, so the only reward you get is the sense of joyous fulfillment as your belly begins to swell with his spunk. You hardly even notice when he’s done, pulling himself out with a satisfied sigh. You just sit there with your mouth still hanging open, like you’re just waiting for him to use you again. His cock lets out one last spurt, spraying your face. A heavy rope of seed lands in your mouth and up your nose, coating your open eye with extremely sticky spunk.");

		output("\n\nYou don’t even notice. You sit there with a tummyful of hot jizz until the man orders you to stand and close your mouth.");

		output("\n\n<i>“Now get the fuck out and only come back when you’re ready to submit completely. Oh, and hold the rest in your mouth.”</i>");

		output("\n\nThat’s the last thing you remember from the encounter. When you open your eyes again, you’re alone again. What the hell just happened? You look down at yourself and see your belly, still swollen with a baby bump of jizz, then notice there’s something on your lips. You wipe your hand across your mouth and check what it is: thick, sticky cum. Before you can stop yourself or even think, you instinctively swallow the rest of the load in your mouth.");

		output("\n\nYou immediately groan in disgust and spit. You can <i>feel</i> it travelling down your abused throat to join the rest, its heat massaging your sore insides. That man is dangerous. He’s done something to you, gotten inside your head somehow. You ache just thinking about him, wanting to walk back inside and offer all of your ho- no! Damn, this is what he meant by you coming back to him. You have to find out exactly what it was he did.");
	}
	//merge
	output("\n\nMaybe you’ll ask him about it when you go back and see h-no! Fuck! You’re going to go back and <i>fight</i> him, not fuck him! You shake your head and look down at yourself, steeling your resolve. Yes... you’ll go back and settle this once and for all.");
	output("\n\n");
	flags["FORGEHOUND_APOLIFUCKED"] = 1;
	processTime(80);
	pc.orgasm();
	pc.orgasm();
	var tempE:ForgeHound = new ForgeHound();
	if(!pc.isTaur()) pc.loadInMouth(tempE);
	else
	{
		if(pc.hasVagina()) pc.loadInCunt(tempE,0);
		else pc.loadInAss(tempE);
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[No]
//tooltip: But you don’t want to do that.
public function noYouArentApolifucking():void
{
	clearOutput();
	showForgehound();
	author("Wsan");
	output("<i>“I don’t wanna do that, though,”</i> you say.");
	output("\n\n<i>“Alright. This’ll be a mercy killing, then,”</i> the leithan says, looking at your forehead. You can see the gatling gun swivelling slightly to zero in. <i>“You’re far too stupid to live.”</i>");
	output("\n\n<b>It’s a fight!</b>");

	forgehoundFightSetup();
}

//[Submit]
//Different variants for having apologized or not.
//tooltip: Give in. The large, domineering man is just too intimidating and hot for you to fight him.
public function submitToForgehound():void
{
	clearOutput();
	showForgehound(true);
	author("Wsan");
	var forgy:ForgeHound = new ForgeHound();
	if(flags["FORGEHOUND_APOLIFUCKED"] == undefined) 
	{
		output("<i>“I got your reason right here, big boy,”</i> you murmur, letting your weapons fall to the ground and kneeling before him");
		if(!pc.isChestExposed() && !pc.isCrotchExposed()) output(", stripping out of your clothes");
		output(". His surprised expression quickly shifts to a smug smirk.");

		output("\n\n<i>“I see. You just had to come see what the big deal was, huh?”</i> he says, approaching you. <i>“Then you ran into me. Lucky you. I’ve been looking for a fucktoy to have to myself lately.”</i>");

		output("\n\n<i>“You can </i>make<i> me that fucktoy, you big fucking stud,”</i> you breathe, looking up at him with flushed cheeks{clothed: as you shed your last piece of gear}. Your [pc.nipples] stand out on your chest, erect as they can be");
		if(pc.canMilkSquirt()) output(" and leaking milk");
		output(". <i>“Wear me as a fucking sheath, you sexy fucking beast!”</i>");

		output("\n\n<i>“I like the words coming outta your mouth,”</i> the leithan man says, chuckling to himself. <i>“Don’t think it’s gonna be hard to break </i>you<i> in. You seem like the type to take to it pretty quick.”</i>");

		output("\n\nAs he draws closer, you finally get to see what he’s wielding between his legs. It’s a monstrously large canine cock, swollen, red, and already leaking precum - and it is the most amazing thing you have ever laid your eyes upon. Every instinct inside screams to submit, to offer yourself to it, your mouth automatically opening just in case he should choose to thrust it between your [pc.lips].");

		output("\n\n<i>“Go on,”</i> he grunts, flexing his mighty cock. <i>“Pay your respects.”</i>");

		output("\n\nLeaning forward, you plant a gentle kiss on the pointed tip before you take it inside. It’s delightfully smooth and suckable despite having such intimidating veins running through it, and when the first drop of precum reaches your lips it tastes like utter bliss. You moan into his cock, bringing your hands up to start stroking it with reverence.");

		output("\n\n<i>“Like the taste, huh?”</i> the leithan notes in a casual manner. <i>“Bet you do. Take it deeper, slut.”</i>");

		output("\n\nHe’s right - if you’re going to be his fucktoy cumdump, you’re going to have to meet <i>all</i> his needs. That includes deepthroating as much of his cock as physically possible. You’re going to love the heat of his seed exploding directly into your stomach, you’re sure of it. You straighten your back and lean forward, grabbing onto his middle set of legs when you feel him shifting above you, getting ready to thrust.");

		output("\n\n<i>“Nnnh!”</i> he grunts, shoving what must be over a foot of swollen, throbbing dogcock down your throat. The rest of it won’t fit, owing to his insane size, but you think you’ve done pretty well. <i>“Not bad for a rookie cumdump,”</i> he says, shifting his footing again. <i>“We’ll get you some mods later so you can take me, don’t you worry. I know some people.”</i>");

		output("\n\nA second later and you’re being taken, almost literally, for the ride of your life. He <i>hammers</i> your face, his gigantic cock slipping in and out of your throat as you gag, cough, and blow bubbles of spit around it. You’re in love. You cum not even twenty seconds into it, completely unnoticed by the man above you. Your senses are in overdrive, the sensation of him sliding into your tight, wet fuckhole of a mouth just too much to bear. Serving this big, strong, dominant man is its own reward in itself.");

		output("\n\n<i>“Haaa, fuck!”</i> he grunts in approval, starting to thrust more violently. <i>“Swallow all of it down if you know what’s good for you, bitch.”</i>");

		output("\n\nIs he gonna cum? He’s gonna cum! He must be about to cum! Your eyes widen, pupils dilated in your euphoria, and you relax your throat as much as you can. You’re soon rewarded with a giant, neck-swelling load of thick leithan seed that travels down his cock and jets down your throat. Still thrusting, he gets most of the next load in your mouth, fucking it right down your gullet with his cock. Your eyes roll back into your head in pleasure, most of your body limp in utter subservience except the two arms that grasp his legs to keep you in place.");

		output("\n\n<i>“Grrrr... nnngh,”</i> he growls, sinking himself as deep as he can get into your face to ride out the rest of his amazing orgasm. You can’t look down right now, but you can <i>feel</i> your stomach swelling, bloated with his thick, swirling jizz. You’re down there long enough that, eventually, you can feel it " + (pc.isTaur() ? "pressing against your folded-up legs":"touching the ground beneath you") + ".");
		output("\n\nFinally, he kicks your hands away and steps back, pulling out of your abused throat. You immediately seal your lips, eyes widening in urgency as the cum he left behind swells up and threatens to leak. It takes you several long, laborious seconds of swallowing it again - it’s so thick and sticky you can hardly get it down - but the taste it leaves in your mouth is well worth the effort. You cum again while he watches, ignoring your ecstasy completely.");
		output("\n\n<i>“Fuck... pretty good, but not as good as when I get it all in,”</i> he muses, looking down at you. <i>“Have to go aftermarket to fix that. Well, get up.”</i>");
		output("\n\nYou slowly, gingerly rise to your feet, " + (pc.isTaur() ? "your legs somewhat awkwardly splayed around your sloshing, semen-filled":"cradling your pregnant") + " stomach. It’s swollen obscenely after you faithfully followed his instructions, not letting a single drop leak.");
		output("\n\n<i>“Now walk,”</i> he says, grinning. <i>“We’re going back to my quarters, and we’re going to have a </i>lot<i> of fun when we get there.”</i>");
		processTime(15);
	}
	//Apologized:
	else
	{
		output("<i>“... and fuck me, you stud,”</i> you pant, dropping your weapons. <i>“Oh god, I need it so bad! Please! Please f-”</i>");
		output("\n\n<i>“Sshhh,”</i> the man says, quieting you down immediately. You watch him approach as your lips part instinctively, your breath coming out in hot gasps. <i>“Just relax, my little beta.”</i>");
		output("\n\n<i>“Uuuuhhhh,”</i> you moan, " + (pc.isTaur() ? "bowing your forelegs a little":"your knees pressing together") + ". It feels so <i>good</i> when he calls you that, to give voice to the concept of his complete and utter dominion over you. <i>“Yes, alpha...”</i>");
		output("\n\n<i>“I like my bitches quiet and obedient,”</i> he murmurs, looking into your face. <i>“Can you be a quiet, obedient bitch?”</i>");
		output("\n\nYou say nothing, biting your lip and just nodding. He’s so close..! You could reach out and touch him, but you don’t dare.");
		output("\n\n<i>“Smart,”</i> he notes, nodding once. <i>“As a reward, I’ll let you lick my cock. You’re not allowed to touch it with anything but your tongue, bitch.”</i>");
		output("\n\nYou nod eagerly, almost bouncing in excitement. He’s gonna let you lick his fucking cock! You can barely contain yourself, ");
		if(pc.isHerm()) output("both your [pc.pussies] and [pc.cocks] dripping in anticipation");
		else if(pc.hasCock()) output("your [pc.cocks] dripping in anticipation");
		else output("your [pc.vaginas] dripping in anticipation");
		output(". You’re scarcely able to resist cumming the moment you lay your eyes on it as he steps over you, sheltering you under his body while you pant in lust. You <i>need</i> it.");
		output("\n\nLeaning forward, you almost take it into your hands before remembering what he instructed you to do. Nothing but tongue. Your [pc.tongue] lolls from your mouth, sliding up the underside of his cockhead to get at all of the precum dripping from his tip. Oh, god, fuck <i>yes</i>. This is what you’re here for. Getting more of <i>this</i>. You moan loudly into his cock, cumming all over yourself as you lick and swallow down his pre.");
		output("\n\nYou can hear him chuckling above you. <i>“Couldn’t hold on, huh?”</i> he grunts, amused. <i>“What a whore. I thought you would fight back a little, at least. Where’d the strong-willed bitch from the first time go, huh?”</i>");
		output("\n\nHe’s right - but if this makes you a whore, you’ll <i>be</i> his whore. For the rest of your life, even. His cum is just so good; you don’t want anything more than just getting his cock in one of your holes, being fucked over and over and pumped full of his thick spunk. You’re on the verge of cumming again when he tells you to stop.");
		output("\n\n<i>“Alright, playtime’s over. Lie on the ground,”</i> he grunts, shifting above you. <i>“And tighten your asshole.”</i>");
		pc.buttChange(forgy.cockVolume(0));
		output("\n\nYou scream he enters you, not in pain but in pure, blissful joy. You cum immediately, not even having the slightest chance of resisting it. The throbbing of his cock and slick precum that follows with it has your head in the clouds, lying down with an expression of ecstasy while he ravages your gaped-wide asshole.");
		output("\n\nYou can’t stop cumming, a new orgasm rolling on top of the previous with every single thrust of his amazing cock, your mouth open in a silent scream of joy. Drool runs from the corner of your mouth as your eyes roll up into your head, your mind fighting desperately to stay conscious, not to survive but to ensure you experience every single agonizingly pleasurable second of his dick inside you.");
		output("\n\nBy the time he cums, you’ve already lost your voice. Nothing but gasps and silent moans emanate from your throat as he impales you as deeply as he can, ");
		if(pc.isTaur()) output("thrusting himself so far in you can feel his enormous balls pulsing against your shaking hindquarters.");
		else output("fucking you so hard you can scarcely breathe.");

		output("\n\n<i>“Nnnngghhh... fuck,”</i> he growls in satisfaction, leaving his stupendous cock bulging inside you while he empties himself. <i>“You’re gonna make a great cumdump.”</i>");
		output("\n\nThe words set your mind alight with desire, and you’d giggle with happiness if you were capable. The thought that your master’s going to enjoy you is so enticing and rewarding that you cum again without touching yourself. He’s just so <i>good</i>...");
		output("\n\n<i>“Now get up and come to my quarters, bitch,”</i> he says, grinning as he pulls out of your ruined asshole. Seed pours " + (pc.isTaur() ? "down your [pc.ass], soaking your underside":"from the gaping orifice, forming a pool between your [pc.thighs]") + ". <i>“There’ll be more time for fun when you get there.”</i>\n\nMotivated by his promise of more attention, you shakily rise to your [pc.footOrFeet].");
		processTime(15);
		for(var y:int = 0; y < 5; y++) { pc.orgasm(); }
		pc.loadInAss(forgy);
	}
	pc.loadInMouth(forgy);
	clearMenu();
	addButton(0,"Next",badEndToForgy);
}

//PC wins
public function defeatForgy():void
{
	author("Wsan");
	//Win by lust
	if(enemy.lust() >= enemy.lustMax()) 
	{
		output("The monster-sized leithan collapses to his knees, keeling over and panting in lust. You give a winning smile as you walk over to him, watching him buck his hips. The pheromones are pouring off him - he needs it <i>bad</i>. Between his legs, you can see his massive canine cock throbbing with desire.");
		if(flags["FORGEHOUND_APOLIFUCKED"] != undefined)
		{
			output("\n\n<i>“S-shoe’s on the other foot now,”</i> you pant, your mind swimming in his musk. It would be <i>so</i> easy to take advantage of him right now and just sit on his cock, bouncing until he came again. Hell, he’s enough of a stud that he can probably go more than once - you’d never want for sex again.");
			output("\n\n<i>“Great work, you fuckin’ moron,”</i> he grunts, glaring at you. <i>“Now I’m all worked up and desperate. And who’s in front of me? My beta. You can’t resist this.”</i>");
			output("\n\nYou struggle internally, gritting your teeth. Are you really going to try and walk away from this? This is an almost once in a lifetime opportunity for happiness, and all it would cost is your free will.");
			output("\n\n<i>“Just give in,”</i> he cajoles you, flexing his cock to make it stand proud and erect. <i>“Nobody has the kind of willpower you’d need to say no. Just make it easier on yourself.”</i>");
			processTime(3);
			clearMenu();
			addButton(0,"Give In",giveInToForgehoundFunsies,undefined,"Give In","You <b>need</b> this.");
			addButton(1,"Resist",resistDisHomeboy,undefined,"Resist","You can resist this!");
		}
		else
		{
			output("\n\n<i>“You don’t look so big lying on the ground with your dick out like that,”</i> you muse. <i>“Poor puppy.”</i>");
			output("\n\n<i>“F-fffuck you,”</i> he pants, cheeks flushed a dark red under his gray skin. <i>“You’ll regret insulting me later!”</i>");
			output("\n\n<i>“Alright, spill it,”</i> you say, bending down to look him in the eye. <i>“There’s something going on with you, something you’re hiding. It’s too obvious. What is it?”</i>");
			output("\n\nHe says nothing, and you sigh theatrically as you get back up. <i>“Guess I’m wasting my time. I’ll just leave you here with that giant, painful-looking erection.”</i>");
			output("\n\n<i>“Fuck,”</i> he spits, then looks up at you. <i>“Fine. I’m a d’zaan alpha, I have addictive cum.”</i>");
			output("\n\n<i>“Ohooo, I see,”</i> you say, raising an eyebrow. <i>“Then I won’t be doing anything with your dick after all.”</i>");
			output("\n\n<i>“Wait wait wait,”</i> he begs, imploring you. <i>“You can still jack me off, or- or something! Come on!”</i>");
			clearMenu();
			addButton(0,"If You Beg",ifYouBegForgy,undefined,"If You Beg","After what he’s put you through? He needs to beg.");
			addButton(1,"Nah",nahIWontGetYouOffPuppu,undefined,"Nah","He’s on his own.");

			if(pc.hasCock()) addButton(5,"Facefuck",cockSelect,[facefuckForgy,9998888,false,0],"Facefuck","Teach the so-called forgehound a lesson in manners - orally.");
			else addDisabledButton(5,"Facefuck","Facefuck","You need a penis for this.");

			if(pc.hasCock() && pc.cockThatFits(enemy.analCapacity()) >= 0) addButton(6,"Assfuck",cockSelect,[assfuckDatHo,enemy.analCapacity(),false,0],"Assfuck","Take his donut for a ride!");
			else if(pc.hasCock()) addDisabledButton(6,"Assfuck","Assfuck","You’re way too big to fit in his asshole, capacious though it may be.");
			else addDisabledButton(6,"Assfuck","Assfuck","You need a penis for this.");

			if(pc.isTaur())
			{
				if(pc.hasCock() && pc.cockThatFits(enemy.analCapacity()) >= 0) addButton(7,"MountNRut",cockSelect,[mountNRut,enemy.analCapacity(),false,0],"MountNRut","");
				else if(pc.hasCock()) addDisabledButton(7,"MountNRut","MountNRut","You’d never fit inside?");
				else addDisabledButton(7,"MountNRut","MountNRut","You need a penis for this.");
			}
			else addDisabledButton(7,"MountNRut","MountNRut","You need to be a centaur to do this.");

			if(pc.hasCock()) addButton(8,"Balljob",cockSelect,[forgyBalljobby,9998888,false,0],"Balljob","He’s got big balls - big enough you could slide in between them and squeeze yourself to climax.");
			else addDisabledButton(8,"Balljob","Balljob","You need a penis for this.");

			addButton(9,"Fist Him",fistDatTaurBoi,undefined,"Fist Him","Introduce the big guy to a five-finger prostate punch of anal pleasure.");
		}
	}
	//Win by damage
	else
	{
		output("The leithan crumples to the floor, worn down by your tenacity and beaten by your strength. His gatling gun appears nonfunctional, the targeting apparatus apparently destroyed. There’s a loud thump as he slumps onto his side, breathing hard. You approach him, still slightly wary but confident in your victory.");
		output("\n\n<i>“What was it again? ‘The bigger they are, the harder they fall’?”</i> you say, smiling down at him. He gives you a sullen glare in response. You’re left considering what to do with him.");
		//[Facefuck] [Assfuck] [MountNRut] [Balljob] [Fist him] [Leave]
		clearMenu();
		
		if(pc.hasCock()) addButton(0,"Facefuck",cockSelect,[facefuckForgy,9998888,false,0],"Facefuck","Teach the so-called forgehound a lesson in manners - orally.");
		else addDisabledButton(0,"Facefuck","Facefuck","You need a penis for this.");

		if(pc.hasCock() && pc.cockThatFits(enemy.analCapacity()) >= 0) addButton(1,"Assfuck",cockSelect,[assfuckDatHo,enemy.analCapacity(),false,0],"Assfuck","Take his donut for a ride!");
		else if(pc.hasCock()) addDisabledButton(1,"Assfuck","Assfuck","You’re way too big to fit in his asshole, capacious though it may be.");
		else addDisabledButton(1,"Assfuck","Assfuck","You need a penis for this.");

		if(pc.isTaur())
		{
			if(pc.hasCock() && pc.cockThatFits(enemy.analCapacity()) >= 0) addButton(2,"MountNRut",cockSelect,[mountNRut,enemy.analCapacity(),false,0],"MountNRut","");
			else if(pc.hasCock()) addDisabledButton(2,"MountNRut","MountNRut","You’d never fit inside?");
			else addDisabledButton(2,"MountNRut","MountNRut","You need a penis for this.");
		}
		else addDisabledButton(2,"MountNRut","MountNRut","You need to be a centaur to do this.");

		if(pc.hasCock()) addButton(3,"Balljob",cockSelect,[forgyBalljobby,9998888,false,0],"Balljob","He’s got big balls - big enough you could slide in between them and squeeze yourself to climax.");
		else addDisabledButton(3,"Balljob","Balljob","You need a penis for this.");

		addButton(4,"Fist Him",fistDatTaurBoi,undefined,"Fist Him","Introduce the big guy to a five-finger prostate punch of anal pleasure.");
		addButton(14,"Leave",leaveForgyBehind);
	}
}

//[IfYouBeg]
public function ifYouBegForgy():void
{
	clearOutput();
	showForgehound(true);
	author("Wsan");
	pc.addMischievous(1);
	output("<i>“Sure, I’ll get you off,”</i> you say, grinning. <i>“If you beg.”</i>");
	output("\n\nThough sullen, he performs the act immediately. <i>“Please get me off.”</i>");
	output("\n\n<i>“No no no no, that’s not nearly good enough,”</i> you sigh, shaking your head in disappointment. <i>“Like a dog. Put your front legs out and ask your master if I can give you a treat.”</i>");
	output("\n\nHe glares at you with murder in his eyes. If looks could kill, you would surely be writhing in agony right now. But they can’t, so instead you smile sweetly at him. <i>“Can you do a trick?”</i>");
	output("\n\n<i>“I swear to god I’m going to find you and kill you some day,”</i> he mutters, raising his forelegs. <i>“Can you give me a treat,”</i> he says, monotone.");
	output("\n\n<i>“Put some heart into it,”</i> you insist, gesturing with your hands. <i>“Like this!”</i>");
	output("\n\n<i>“God damn, fine!”</i> he snarls, raising his forelegs further. You watch in utter delight as he softens his expression. <i>“Master, would you please give me a treat?”</i>");
	output("\n\n<i>“Hahahahahaha!”</i> you crack up in his face, smacking the ground. <i>“You actually did it!”</i>");
	output("\n\n<i>“You fucking asshole,”</i> he growls, face flushing with embarrassment. <i>“</i>Now<i> can you get me off? I can’t do it myself...”</i>");
	processTime(4);
	//[Yes] [No]
	clearMenu();
	addButton(0,"Yes",yesIllMakeYouCumForgy,undefined,"Yes","Let him cum.");
	addButton(1,"No",noIWontGetYouOff,undefined,"No","Are you this much of a dick? Maybe.");
}

public function yesIllMakeYouCumForgy():void
{
	clearOutput();
	showForgehound(true);
	author("Wsan");
	output("<i>“Hahahaha, I guess it would be pretty shitty if I didn’t,”</i> you gasp, trying to control your laughter. <i>“Okay puppy, here’s your reward. Can you roll over too?”</i>");
	output("\n\n<i>“Fuck off!”</i> he snarls angrily.");
	output("\n\n<i>“Aww, fine,”</i> you say, reaching forward and taking his cock in hand. <i>“Here you go, good boy.”</i>");
	output("\n\n<i>“Nnnh,”</i> he moans, the tension fading from his body as you begin to rub his massive length up and down. <i>“Finally...”</i>");
	output("\n\n<i>“Yeah, guess I made you jump through a few hoops first,”</i> you agree, squeezing his tip a little. Some precum runs down his underside, coating it in slick lubrication. <i>“You’d make a great circus dog actually, you’ve already got the tricks part down.”</i>");
	output("\n\nHe chooses not to respond to that, but you don’t stop there. <i>“Heaps of people would pay to see you. ‘The biggest puppy you’ve ever seen!’ would be a crowd-pleaser for sure,”</i> you mention, jacking him harder. He was already so close to cumming, you’ve got him right on the edge. <i>“You sure you don’t want to go into business with me?”</i>");
	output("\n\n<i>“I f-fuh, fucking hate you!”</i> he pants, his hips starting to move, bucking in slow motion. <i>“Ffffuuuck..!”</i>");

	output("\n\nWith a very loud, deep groan, he finally begins to cum. Massive ropes of seed spurt from his throbbing canine cock, splattering all over the ground while you follow through on your promise and make him cum as hard as you can with your hands. He goes <i>everywhere</i>, strands of his narcotic spunk flying several feet as he flexes and moans. When he’s finished he’s shaking all over and breathing hard, his eyes fluttering closed in relief.");
	output("\n\n<i>“Is the big bad puppy all tuckered out now? Wanna sleep in your cage?”</i> you ask him.");
	output("\n\n<i>“Uuuuuugh,”</i> he groans, turning over to face away from you. <i>“Just please fuck off. Go. I don’t want to ever see you again.”</i>");
	output("\n\n<i>“Aw, fine,”</i> you sigh. <i>“Here, I’ll scratch my extranet mail on the ground. Hit me if you want to start a circus.”</i>");
	output("\n\nYou can’t tell if he’s sobbing or shaking in rage, but either way your job here is done. You leave with a spring in your step.");
	processTime(10);
	pc.lust(5);
	output("\n\n");
	CombatManager.genericVictory();
}

//[No]
public function noIWontGetYouOff():void
{
	clearOutput();
	showForgehound();
	author("Wsan");
	output("<i>“Nope,”</i> you say, flashing him your teeth in a brilliant smile. <i>“But thanks for the recording. I dunno if there’s a market for embarrassment porn, but if there is this has </i>gotta<i> be a record-breaker.”</i>");
	output("\n\nYou get up and leave, the leithan’s apoplectic rage following you like a thunderstorm. As you get further away he begins to beg, then goes back to yelling angrily as you make it clear you’re not coming back. Eventually, silence falls. You don’t bother checking on him.");
	pc.addHard(1);
	output("\n\n");
	processTime(2);
	CombatManager.genericVictory();
}

//[Nah]
public function nahIWontGetYouOffPuppu():void
{
	clearOutput();
	showForgehound();
	author("Wsan");
	output("<i>“Not interested,”</i> you say, shrugging. <i>“You big dumb ");
	if(pc.mf("","f") == "f") output("boys");
	else output("aggressive types");
	output(" are just too easy to take advantage of with a bit of sex appeal.”</i>");
	output("\n\n<i>“Fuckin’... Goddamnit!”</i> he rages as you walk away. <i>“I’m gonna find you again and fuck you unconscious! Gonna fuck you in half, bitch!”</i>");
	output("\n\n<i>“Whatever you say, chump,”</i> you call out over your shoulder, ignoring the rest of his angry ranting. You roll your eyes. The least a loser could do is shut up about it.\n\n");
	processTime(2);
	CombatManager.genericVictory();
}

//[Give in]
public function giveInToForgehoundFunsies():void
{
	clearOutput();
	showForgehound();
	author("Wsan");
	output("<i>“Oh fuck, just let me at it!”</i> you cry out, rushing towards the leithan’s side. ");
	if(!pc.isChestExposed() && !pc.isAssExposed()) output(" You’re stripped out of your [pc.gear] in seconds.");
	output(" You get on " + (pc.hasKnees() ? "your knees":"the ground") + " immediately, sucking the tip hard enough to make him groan in relief before you begin to take it inside, choking yourself in your eagerness.");
	output("\n\n<i>“That’s more like it,”</i> he sighs, relaxing on the ground. <i>“Work yourself for my cum, [pc.boyGirl]. Suck it until I get back up.”</i>");
	output("\n\nAs it turns out, he doesn’t want to get back up for quite some time. You successfully make him cum, his thick, narcotic seed shooting from his cock so fiercely that some of it pours from your nostrils while you’re desperately trying to swallow it all. Immediately after that you get back to work earning more of his seed, gulping the excess down even as you suck and lick at him. Gradually, as the leithan regains his strength after venting his frustrations into you a few times, he pushes you away and stands once more, towering above your prostrate form.");
	output("\n\n<i>“There we go,”</i> he grunts, stretching out and flexing. You watch his muscles bulge, admiring him from below while his thick seed drips down your chin. It would be disingenuous to say he’s finally broken you in - you and he both know that he broke you in the first time you met, turned you into his needy little cockslut before you ever fought him. God, he’s like sex incarnate, and you... you’re just happy to bask in his presence.");
	output("\n\n<i>“My little cocksock,”</i> he chuckles, looking down on you. <i>“Present yourself, bitch.”</i>");
	output("\n\nYou immediately turn over and raise your [pc.ass], " + (pc.isTaur() ? "hindlegs elevated as far as they’ll go":"reaching back to pull your cheeks apart") + ".");
	output("\n\n<i>“Is this good enough?”</i> you ask him.");
	output("\n\n<i>“Yeah,”</i> he says, settling into position. <i>“Now shut up and keep yourself tight.”</i>");
	output("\n\nYou let out a slutty moan of ecstasy as your [pc.chest] rubs against the ground, borne forward as your strong, dominant lover - no, your <i>master</i> - enters your [pc.vagOrAss]. The feeling is divine, like you’ve been waiting for this your whole life. It’s hard to imagine anything better, and he hasn’t even cum yet.");

	if(pc.hasVagina()) pc.cuntChange(0,enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));

	output("\n\nHe keeps you writhing in ecstasy, ignoring your moans of praise while he pumps you with strong, rough strokes that force you to grip onto his legs to avoid being shunted along the ground. It’s apparent that he thinks nothing more of you than a warm cumdump, but this is by far the best you’ve ever felt. You’re more than willing to spread yourself for him and get fucked like a whore every night if that’s what he desires, just for another feel of that heavenly cum inside you.");

	output("\n\nWhen he finally cums, you almost pass out from the strength of the orgasm you endure. Your entire body is aflame with need, eyelids fluttering as your eyes roll back into your head in pleasure. Your muscles flex and shake, trying hard to contextualize the feeling of bliss and failing - nothing has ever felt this good. You would die for this feeling without a second thought.");
	output("\n\nBy the time he pulls out, you’re scarcely more than a well-used fucktoy. Leaking cum from both ends, you lie on the ground panting and groaning in the afterglow of so many orgasms in a row. Your newfound master gives you a light kick.");
	output("\n\n<i>“Get up,”</i> he grunts. <i>“You’re coming back to my quarters for another fuck.”</i>");
	output("\n\nDespite yourself - despite the treatment, despite clearly meaning nothing more to your master than a pet to amuse himself with - you unsteadily clamber to your [pc.feet] to follow his orders. Your head swims with the fantasy of being taken again and again, fucked nightly like you’re this fantastic man’s concubine, just another conquered bitch in the wake of his dominance. And that’s all you could ever want.");

	//to bad end
	processTime(30);
	pc.orgasm();
	if(pc.hasVagina()) pc.loadInCunt(enemy,0);
	else pc.loadInAss(enemy);
	clearMenu();
	addButton(0,"Next",badEndToForgy);
}

//[Resist]
public function resistDisHomeboy():void
{
	clearOutput();
	showForgehound();
	author("Wsan");
	output("Nnnnnngh-”</i> you groan, squeezing your eyes shut and trying, willing yourself with all your might, to resist. You’re almost doubled over in pain trying to get the words out. Sweat breaks out on your forehead as you struggle for survival. <i>“Nnnuh-no!”</i>");
	output("\n\n<i>“What?”</i> he says, shocked. <i>“Fuck me, you idiot! Jump on my dick!”</i>");
	output("\n\n<i>“No,”</i> you say, more decisively now as you slowly stand back up. <i>“Fuck you.”</i>");
	output("\n\n<i>“Th-that’s impossible,”</i> he mumbles, staring at you. <i>“Nobody... nobody could resist that.”</i>");
	processTime(3);
	clearMenu();
	//[Ignore] [Execute] [Assfuck] [Fist him]
	addButton(0,"Ignore",ignoreTheDumboTaurboi,undefined,"Ignore","Forget him. You can overcome this!");
	//addButton(1,"Execute",,undefined,"Execute","");
	if(pc.hasCock() && pc.cockThatFits(enemy.analCapacity()) >= 0) addButton(1,"Assfuck",cockSelect,[assfuckDatHo,enemy.analCapacity(),false,0],"Assfuck","Take his donut for a ride!");
	else if(pc.hasCock()) addDisabledButton(1,"Assfuck","Assfuck","You’re way too big to fit in his asshole, capacious though it may be.");
	else addDisabledButton(1,"Assfuck","Assfuck","You need a penis for this.");
	addButton(2,"Fist Him",fistDatTaurBoi,undefined,"Fist Him","Introduce the big guy to a five-finger prostate punch of anal pleasure.");
}

//[Ignore]
public function ignoreTheDumboTaurboi():void
{
	clearOutput();
	showForgehound();
	author("Wsan");
	output("<i>“W-wait, where are you going?”</i> he says, watching you begin to walk away. <i>“Come back! Uh, serve your alpha!”</i>");
	output("\n\nYou say nothing, continuing past him and onwards.");
	output("\n\n<i>“You can’t do this! You can’t just leave!”</i> he howls in desperation, raking his claws against the ground. <i>“You... you can’t,”</i> he trails off into a whisper.");
	output("\n\nYou think you hear him calling out to stop, but you can’t be sure. You don’t bother looking back.\n\n");
	CombatManager.genericVictory();
}

//[Execute]
//This can be cut if desired
public function executeDumbTaurboy():void
{
	clearOutput();
	showForgehound();
	author("Wsan");
	output("<i>“Looks like you should’ve thought about the consequences of fucking with me before they smacked you upside the head,”</i> you say, throwing his words back in his face. He gapes in open-mouthed disbelief as you raise your [pc.rangedWeapon] with a grim expression, aiming right between his eyes. <i>“Goodbye, you lowlife scum.”</i>");
	//output("\n\n-");
	//output("\n\nYou regard his body with disdain before your eyes sweep over the gatling gun. Unfortunately, it’s too big to carry and the mounting apparatus looks like it took quite some setup.{No PA: If only you had some power armor you might be able to lug it around/else: Even in the power armor, you would have to put a lot of work in to get it operational}. Some other time, maybe. You step away, continuing onwards.");
	output("\n\n");
	CombatManager.genericVictory();
}

//[Assfuck]
//Requires cock
public function assfuckDatHo(x:int):void
{
	clearOutput();
	showForgehound();
	author("Wsan");
	output("<i>“Yeah, well, I know what I’m not gonna resist,”</i> you say, smirking. <i>“See, I’ve got a bit of a kink for fucking big, strong, dominant men until they break down and learn their place. And you seem to fit the bill.”</i>");
	output("\n\n<i>“You- you can’t fuck </i>me<i>,”</i> he says, incredulous. You’ll- you’ll get addicted!”</i>");
	output("\n\n<i>“Yeeeah, that’s not how that works,”</i> you say, already");
	if(!pc.isCrotchExposed()) output(" removing your [pc.crotchCovers] and");
	output(" lifting his tail. Sweaty and glistening, his asshole reminds you of a delicious donut, protruding just enough to look like you’re being invited. <i>“Oh, looks like someone left the backdoor open.”</i>");

	output("\n\n<i>“Wait wait wait,”</i> he says, panicking when he sees your [pc.cock " + x + "]. <i>“I don’t- I’ve never- oh! Fuck!”</i>");
	output("\n\nYou sink your [pc.cockHead " + x + "] into his velvet soft ring, spreading him around you. The groan he makes is exquisite.");
	pc.cockChange();
	output("\n\n<i>“Oooh, for someone who’s supposedly an anal virgin you sure are welcoming,”</i> you murmur, rubbing his muscular flank. <i>“I think you’ve got the makings of a real anal slut.”</i>");
	output("\n\n<i>“F-fuck you,”</i> he pants, gripping the ground. <i>“Uuugh!”</i>");

	output("\n\nYou get another few inches inside him, and suddenly you find yourself ");
	if(pc.cocks[x].cLength() < 12) 
	{
		output("railing him with reckless abandon, your " + (pc.balls > 0 ? "[pc.balls]":"loins") + " smacking against his large tauric behind while you pummel him");
	}
	else output("a foot deep inside him, exploring his massive backside with your stiffly erect cock. You really do believe he was a virgin back here, but being as big as he is has some hidden drawbacks - like the fact you can fuck his cute asshole with no preptime");
	output(". You can feel his prostate, large enough for you to prod it when you rub him. If you pay enough attention to it, it should be relatively effortless to make him have an anal orgasm. Fortunately for him, that’s exactly what you had planned.");

	output("\n\n<i>“Come on, you little whore,”</i> you taunt him, " + (pc.cocks[x].cLength() < 12 ? "ramming him repeatedly":"drawing back and slowly pushing back in") + " while he makes muffled grunts up ahead. <i>“Let me hear that sweet singing voice.”</i>");

	output("\n\n<i>“Wuh, what the fff- fuck are you doing to me,”</i> he gasps, so overcome with lust he can’t deny your control of him. <i>“Nnnngh! Grrgh!”</i>");
	output("\n\n<i>“Aw, you gonna cum?”</i> you ask, teasing him. <i>“Never had your prostate stimulated before, big boy? You’re missing out.”</i>");
	output("\n\n<i>“Uh! Uuuhh,”</i> he moans, losing strength. <i>“S-stop, I’m- I’m gonna-”</i>");
	output("\n\nYou coo in approval while he groans in defeat, the precum that was dribbling from his cock suddenly giving away to a much more strong, thick mixture of narcotic cum that spurts and sprays from his tip. It comes out in a steady stream, pumping from his oversized balls and splashing to the ground underneath him. His inexperienced asshole clamps down on you desperately, trying to arrest your motion while he’s cumming, but you’re determined both not to cum yet and to run him completely dry.");
	output("\n\n<i>“Good boy, good booooyyy,”</i> you murmur, keeping up the steady rhythm while he grunts and groans in exertion. <i>“Stop thinking so hard and just cum.”</i>");
	output("\n\nWhether or not he’s embracing his role as an anal slut mentally, he’s definitely got the look down. His ass continues to squeeze you while his legs shake, seed still coming from his tip in giant, sticky loads. There’s a pool of his essence forming underneath his body, seeping away from him through grooves in the ground. You can even feel him pressing back slightly, ");
	if(pc.cocks[x].cLength() < 12) output("instinctively seeking more pleasure.");
	else output("trying to get you deeper. You decide, in your generosity, to indulge him.");

	output("\n\n<i>“Guuuuhhh!”</i> he groans loudly, arching his humanoid back. <i>“Fuck, fuuuck!”</i>");
	output("\n\nHe’s cumming a <i>second</i> time before he’s even done with his first! Oh, this guy has a gift. You were right to call him a slut from the outset. You’d taunt him, but another round of frantic flexing and squeezing around your cock has you right on the edge yourself.");
	output("\n\n<i>“Open wide, you slut,”</i> you grunt, getting as deep as you can in his tight, warm asshole. <i>“Here’s your reward!”</i>");
	output("\n\nYour [pc.cum] jets inside him " + (pc.cumQ() < 25000 ? ", spurting into his tauric behind and coating his insides with your mark":"deep enough to make his underbelly swell with it, his groans spurring you onwards. You’re well and truly leaving your mark on and inside this leithan, inviting him to be a subby slut") + ". Your jizz might not be narcotic, but you have a feeling he’s going to be addicted all the same. He’s clearly never cum like this before, and his reactions are so sweet and juicy.");
	output("\n\nWhen you finish cumming, you keep yourself hilted just for fun. Moaning and panting, the leithan whore has long since laid down in exhaustion to ride it out. Seed continues to spill from his cocktip, running freely like it’s a leaky faucet. He’s loosened up a little, his ass only flexing around you once every few seconds while he empties his wasted spunk onto the ground. You wait for him to finally finish before you lean forward and murmur to him.");
	output("\n\n<i>“Bet you’d love to come with me and get some more of that, right big guy?”</i>");
	output("\n\n<i>“I... never want to see you again,”</i> he mutters sullenly, balling his hands into fists.");
	output("\n\n<i>“Yeah, right,”</i> you say, smiling as you pull out. <i>“I think you’ll be seeing a lot of me at night when you’re alone. Remember, if you want to cry it out - the name’s Steele.”</i>");
	output("\n\n<i>“Ugh!”</i> he moans as your [pc.cockHead " + x + "] slips free, [pc.cumColor] spunk starting to run down his gray backside. It’s a beautiful contrast, you have to say. <i>“Fuck off...”</i>");
	output("\n\n<i>“Just about to, unless you want me to go another round,”</i> you say, standing and looking down at him in faux interest.");
	output("\n\nHe panics and starts trying to crawl away, exhaustion betraying him. <i>“Nono! I already came!”</i>");
	output("\n\n<i>“Twice, too, you insatiable whore,”</i> you murmur fondly, turning away. <i>“Hopefully we run into each other again! Wouldn’t mind a round two with that fat ass of yours. See you!”</i>");
	output("\n\nWith that, you depart, leaving him on the ground with your seed trickling down his hindquarters.\n\n");
	//set a flag for this, might try and crowdfund an expansion where he shows up again in trap form wanting to get fucked.
	IncrementFlag("FORGEHOUND_PEGGED");
	processTime(30);
	enemy.loadInAss(pc);
	pc.orgasm();
	CombatManager.genericVictory();
}

//[Fist him]
public function fistDatTaurBoi():void
{
	clearOutput();
	showForgehound(true);
	author("Wsan");
	output("<i>“Well, now that we’ve established I’ve beaten you, I’ll take a little pity on you and get you off,”</i> you say, walking around to his muscular hindquarters and seating yourself next to his flank. <i>“I don’t want to touch your dirty cock, though. You don’t deserve it.”</i>");
	output("\n\n<i>“How the fuck else am I going to get off?”</i> he says, confused. <i>“Men cum with their dicks, dumbshit.”</i>");
	output("\n\n<i>“Is that so?”</i> you ask sweetly, stroking his behind and lifting his tail up out of the way. <i>“‘Cuz I think I know another way.”</i>");
	output("\n\nWithout waiting for his smartass comeback, you slip two fingers into his soft, plush asshole, spreading them wide. He grunts in surprise, leaning forward. Encouraged by its pliability, you sink the rest of your fingers into the tight entrance. There’s initial resistance, but he’s actually quite stretchable - it should be a cinch to get an arm inside him.");
	output("\n\n<i>“Wh-what the fuck are you doing?”</i> he pants, trying to twist away from you but too exhausted to pull it off. <i>“Nngh!”</i>");
	output("\n\n<i>“Oooh, looks like a big strong </i>man<i> might have to expand his horizons a bit,”</i> you tease, balling your hand into a fist. He groans in response, his ass desperately tightening up on you to try and prevent you from moving. It’s no use. <i>“Here you go, you big old stallion. Can’t wait to see your dignity dripping from your dick!”</i>");
	output("\n\n<i>“Ogh! Nnn! Wh-what are you doing to me,”</i> he gasps, feeling you slowly sink your hand deeper inside him. Then, as the underside of your curled fist passes over a protrusion in his asshole, you see him give a great, bodywide shiver. <i>“Aaah!”</i>");
	output("\n\n<i>“Ooh, someone discovered their prostate exists,”</i> you murmur, patting his flank with your spare hand. <i>“After this I bet you’ll be going around begging to be ridden. You’ve got the makings of an anal slut with this lewd hole of yours.”</i>");
	output("\n\nSure enough, not even ten seconds have gone by since you mentioned it before his cock begins to drip with precum, a small but steady stream lazily extending from his pointed tip to the ground. You’re treating him gently, going slow since it’s fairly evident he’s never had anything in his ass before. You give his prostate a gentle rub every time you withdraw your hand, your fingers passing over it like you’re petting him with a fist. The reactions are truly delicious.");
	output("\n\n<i>“Guh! Nnngh!”</i> he strains, trying not to arch his back with pleasure. He was already so close to cumming, there’s no way he can resist. <i>“F-fuck!”</i>");
	output("\n\n<i>“Come on, big boy,”</i> you moan, rubbing his flank. <i>“Let it all out. You’ll feel so much better when you do.”</i>");
	output("\n\nHe’s right on the edge, and you have the joy of being the one to push him over. You momentarily uncurl your fist and give his prostate a stroke with your fingertips, all but massaging him from the inside.");
	output("\n\n<i>“Oh, fuck!”</i> he moans, throwing his head back. <i>“I- I’m-”</i>");
	output("\n\nWith a groan of defeat, he bucks his hips weakly and starts to cum, those oversized balls of his pumping seed from his tip. You watch in delight as he debases himself, thick, narcotic seed pouring from his tip to form a pool underneath him. It spreads across the floor away from his body, his side rising and falling rapidly as he pants and moans his way through the intense anal orgasm.");
	output("\n\nYou leave your hand inside him, enjoying the sensation of him tightening up on you over and over. Eventually, after what must be upwards of a minute, he starts to grunt and run dry of the alabaster cream running freely from his canine cock. You start to slowly withdraw, earning a series of high-pitched moans as you slip free of his lewd asshole. It gapes after you’re done, winking repeatedly as it tries and fails to close. It’s gonna take him some time to tighten back up.");
	output("\n\n<i>“There. That wasn’t so bad, was it?”</i> you say, smiling as you pet his butt. <i>“Or did you want another run?”</i>");
	output("\n\n<i>“Uuugh,”</i> he moans, laid out on the floor. You’ve taken a lot out of him between the fight and the fistfuck. <i>“Never... wanna see you again.”</i>");
	output("\n\n<i>“Aww, we both know that’s not true!”</i> you say, standing up and looking down at him. <i>“You’ll be seeing me in dreams for weeks, I bet. Just come find me if you want more!”</i>");
	output("\n\nYou leave the softly moaning leithan laid out on the ground in a pool of his own spunk, his asshole a lot wider than it was when you found him.");
	//set a flag for this, might try and crowdfund an expansion where he shows up again in trap form wanting to get fucked.
	IncrementFlag("FORGEHOUND_FISTED");
	processTime(20);
	pc.lust(5);
	output("\n\n");
	CombatManager.genericVictory();
}

//[Facefuck]
//Requires dick
public function facefuckForgy(x:int):void
{
	clearOutput();
	showForgehound(true);
	author("Wsan");
	output("<i>“Alright, open wide, big boy,”</i> you say, walking to his front. <i>“I’ve got a second bitter pill for you to swallow after the crushing defeat.”</i>");
	output("\n\nHe eyes your [pc.cock " + x + "]" + (!pc.isCrotchExposed() ? " as you pull your [pc.crotchCovers] down":"") + ", groaning in despair. <i>“Goddamnit.”</i>");
	output("\n\n<i>“That’s right, get angry,”</i> you murmur, " + (pc.isTaur() ? "cock bulging as you stand over him, looking down at":"cock in hand as you kneel in front of") + " the stationary leithan. <i>“But trust me, it’s better than the alternative.”</i>");

	if(pc.cocks[x].cLength() < 12) 
	{
		output("\n\n<i>“Fuck it, just get it over with,”</i> he sighs, resigning himself to his fate.");
		output("\n\n<i>“Good boy,”</i> you tell him, aligning yourself with his lips. <i>“Open up...”</i>");
	}
	else
	{
		output("\n\n<i>“That is </i>not<i> gonna fit in my mouth,”</i> he protests, trying to back away. <i>“No way!”</i>");
		output("\n\n<i>“Aw, don’t worry,”</i> you tell him, grinning as you align yourself. <i>“We’ll make it work somehow.”</i>");
	}
	output("\n\nYou thrust between his lips and he gags almost immediately, trying to cough but failing as you slide a little deeper. Instead he just makes a choking noise and you enjoy the sensation of his mouth suddenly being full of warm, wet saliva.");
	output("\n\n<i>“Oooh, this is gonna get </i>messy<i>,”</i> you moan, already " + (pc.isTaur() ? "feeling":"seeing") + " him drool around your length. <i>“Let’s see if we can plug that leak a little, huh?”</i>");

	output("\n\nYou press your [pc.hips] forward, " + (pc.cocks[x].cLength() < 8 ? "grinding against his face as your [pc.cockHead " + x + "] slides into his throat":"feeding him several inches of your dick straight down his throat") + ". Indeed, he swiftly goes silent, his eyes widening in distress. You pull back to let him take a grateful breath, then slip back in. You get yourself into a nice pattern of sorts, allowing him half a second to gasp before you plunder his throat again.");
	output("\n\n<i>“Mmmm, you are a natural at this, big boy,”</i> you sigh, shuddering in pleasure with a grin on your face. <i>“If your crew knew you sucked cock this good you’d never get a break from it.”</i>");
	output("\n\n<i>“I wouldn’t suck their cocks,”</i> he splutters, afforded precious time to respond. <i>“I’m- gghhhlrk-”</i>");
	output("\n\n<i>“That’s enough outta you, cutie,”</i> you say, snickering. <i>“But it does make me feel a little hotter to know that I’m a special case. Guess </i>my<i> cock ain’t so bad, huh?”</i>");
	output("\n\nYou don’t give him a chance to reply to that one, instead thrusting your hips as the pleasure of getting your cock sucked begins to rise within you. You weren’t even kidding - it takes a natural to just open their throats up and relax on their first try, and you intend to make full use of it. ");
	if(pc.cocks[x].cLength() < 15) output("The more you fuck his face, the closer you get, until you’re standing right on the edge about to blow in his mouth.");
	else 
	{
		output("It feels better with every successive inch you feed into him until ");
		if(pc.cocks[x].cLength() < 25) output("you’re " + (pc.balls > 0 ? "balls-deep":"sheathed") + " in his face, pressing your bare crotch against his nose while he chokes on you.");
		else output("he can’t take any more, just not having the capacity to swallow your behemoth dick. Denied the satisfaction of hilting yourself, you choose instead to just slam his face full while he chokes on you.");
	}
	output("\n\n<i>“Nnnngh, fuck,”</i> you pant in desire, rolling your hips. <i>“Hope you’re ready to swallow all my cum, ‘cause I’m definitely not pulling out!”</i>");
	output("\n\nYou sink yourself as deep as you can and thrust once, twice, then groan as [pc.cum] begins to spurt from your cock. Shivering, you pull him towards you for the last thrust. Your eyes roll upward in bliss, eyelids fluttering as you cum deep inside the leithan’s throat. ");
	if(pc.isTaur()) output("You instinctively lower yourself a little above him, trying to work yourself into a better angle, and earn a noisy gag around your cock for your efforts. Oh, that feels fucking <i>good</i>..");
	else output("You hold his head and " + (pc.cocks[x].cLength() < 25 ? "wrap your shaking thighs around the back of it, locking your [pc.legOrLegs] around him as you cum your mind out":"grip him with your legs, keeping him in place while you have him gulp down your loads") + ".");
	output("\n\n<i>“Fuuuuck,”</i> you groan, throwing your head back. <i>“Oh, that’s </i>so<i> good... drink it all down, you little slut. Good boy.”</i>");

	if(pc.cumQ() < 10000) output("\n\nThough he has trouble getting all of it down as he tries to swallow each and every load you bust in his throat, he very quickly learns to just let you take the lead. You’re almost proud for teaching him to be a submissive bitch so quickly. When you pull out, he’s still trying to swallow down the last few ropes of seed, [pc.cum] trailing from his lips down his dark gray skin.");
	else output("\n\nHe tries to swallow your massive loads of [pc.cum] but very quickly learns he should just relax and let you fill him up. Biting your lip, you watch his tauric underbelly begin to swell a little with your seed. You have no idea what he himself thinks, but it’s fucking hot to watch his body submit to your superiority so emphatically. You end up cumming just a little bit harder than you usually do, inspired by his cumflated tummy. By the time you pull out, jizz is trickling from his nose - and his cock.");
	output("\n\n<i>“Mmmm, hope you had as much fun as I did, big boy,”</i> you say, noting his straining dogcock. <i>“Don’t be afraid to come after me for more. I can give you some of that </i>any<i> time you like.”</i> You lean down to whisper in his ear. <i>“If you do it enough, you might even be able to </i>cum<i>. Wouldn’t that be so nice?”</i>");
	output("\n\nGrinning devilishly, you " + (!pc.isCrotchExposed() ? "put your [pc.lowerGarments] back on and":"") + " leave him behind, your teasing delivered. Maybe you’ll even run into him again someday.");
	//set a flag for this, might try and crowdfund an expansion where he shows up again in trap form wanting to get fucked.
	IncrementFlag("FORGEHOUND_FACEFUCKED");
	processTime(30);
	enemy.loadInMouth(pc);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//[MountNRut]
//Taur only, requires dick
public function mountNRut(x:int):void
{
	clearOutput();
	showForgehound(true);
	author("Wsan");
	output("<i>“Only one thing I know to do with a big, panting, sweaty taur,”</i> you say, grinning as you stand over him" + (pc.legCount > 1 ? " and splay your [pc.legs] to either side of his body":"") + ". <i>“Fuck ‘em ‘till they can’t stand. Though I guess in your case it’s a little different.”</i>");
	output("\n\n<i>“Ugh,”</i> he groans in despair, looking back. Your [pc.cock " + x + "] grows harder by the second, wavering until it stiffens to its full length under your tummy." + (pc.cocks[x].cLength() < 16 ? " <i>“At least you’re not that big for a taur.”</i>\n\n<i>“Maybe not, but I think you’ll be surprised with yourself all the same,”</i> you reply":" <i>“Aw fuck!”</i>\n\n<i>“Aw fuck is right,”</i> you nod") + ", bending down and angling your hips to meet his soft, plush asshole. <i>“Open wide, cutie.”</i>");

	output("\n\nHe grits his teeth and moans as " + (pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED) ? "your flare starts to cave his asshole inwards, pressing into him until at least, you feel your cockhead sink into him and let out a groan of pleasure":"your [pc.cockHead " + x + "] sinks into his assole, eliciting a groan of pleasure from your lips") + ". Just feeling him wrapped around you, tight and squeezing, is enough to confirm what you’d suspected when you saw him lying on his side: he’s going to be an <i>amazing</i> fuck.");
	output("\n\n<i>“Mmmm, you’re not quite used to this, are you, big boy?”</i> you tease him gently, letting him get used to the feeling of having you inside for a moment. <i>“I can feel your inexperience. It’s cute.”</i>");
	pc.cockChange();
	output("\n\n<i>“Sh-shut up,”</i> he pants, hands balled into fists. <i>“Uugh!”</i>");
	output("\n\n<i>“That hostile part of you is cute too,”</i> you tell him, wiggling your hips from side to side. His formerly virgin asshole clings to you with desperation, not letting you slip free. <i>“I’d be bored if I broke you in immediately!”</i>");
	output("\n\nHis probable retort is cut off by you sliding another few inches inside him with a buck of your tauric hindquarters, working yourself deeper in his ass while he groans. You grunt in satisfaction - he’s <i>tight</i>. You’re conquering unexplored territory here! He’s strong enough that when he squeezes down on you, he <i>really</i> squeezes, too. Honestly, he’s a natural.");
	output("\n\n<i>“You’re </i>good<i> at this, you little buttslut,”</i> you tell him, shifting above him. <i>“Let me at least get a little deeper before you go cumming all over yourself, okay?”</i>");
	output("\n\n<i>“N-not gonna cum,”</i> he gasps, despite his swollen dogcock already drooling clear precum. <i>“You can’t make me!”</i>");
	output("\n\n<i>“Ooohhh, but I bet I can,”</i> you murmur in a sultry tone, taking a step forward. <i>“How’s this? Or this?”</i> Thrusting inside him, you ");
	if(pc.cocks[x].cLength() < 12) output("get yourself " + (pc.balls > 0 ? "balls-deep":"sheathed") + " in his ass");
	else output("get over a foot of yourself inside his ass");
	output(", earning a moan of pleasure from up front. <i>“Don’t you love it, you little whore? It’s okay. Just let it all out when you feel like it.”</i>");

	output("\n\n<i>“Uh!”</i> he grunts, clawing the ground as you lift your hips to slowly slide yourself out before jamming your cock back in. <i>“Oohhh!”</i>");
	output("\n\n<i>“That’s right,”</i> you whisper, feeling extremely hot yourself. Your cheeks are flushed and sweaty, droplets falling from your chin. <i>“Let me take you higher.”</i>");
	output("\n\nYou work him over with a rhythm, one that has him shivering and gasping and pleading. He <i>so</i> badly doesn’t want to cum with your cock in his ass, but you’re more than happy to tease it out of him. You can feel his prostate along the underside of your cock as it slides in and out of him, all but massaging it with your length. It only takes a few minutes for the cracks to start showing.");
	output("\n\n<i>“Oh- oohhh, fuck,”</i> he moans, twitching underneath you. The stream of precum from his doggydick suddenly doubles in intensity, a free-running waterfall of clear, sticky pre pouring from his overstimulated nuts. <i>“Hhhuh- uuuhh! Nnnh! Ffff- fuck...”</i>");
	output("\n\n<i>“That’s right, baby!”</i> you say excitedly, a big smile on your lust-reddened face. <i>“Come on, cum for me! Don’t you want to just let go and empty those oversized balls of yours on the ground? C’mon, I promise it’ll feel fucking </i>amazing<i>.”</i>");
	output("\n\n<i>“Oh,”</i> he gasps sharply, shuddering violently. <i>“G-gonna- grrrrgh- fuuuck!”</i>");
	output("\n\nA delighted cry spilling from your lips, you watch as his cock jerks upward and begins to let loose a flood of thick, white cum that almost has the consistency of cream. The view is so exciting you can’t stop yourself from going wild, suddenly rutting his ass so hard you might as well be a stallion breeding a mare. You don’t even hear the groans of mixed pleasure and confusion from below you, wholly fixated on the dogcock irresistibly spewing wasted seed all over the ground.");
	output("\n\n<i>“Yes, yes, yes,”</i> you pant, tongue out and licking your lips as you watch him debase himself. <i>“Oh, I’m gonna cum so fucking hard! Take it, you little slut!”</i>");
	output("\n\nWith a loud, erotic moan of joy, you sink yourself as deep as you can get inside him and unload, letting out " + (pc.cumQ() < 1000 ? "rope after rope":"a waterfall") + " of jizz into his lewd, squeezing asshole. The two of you buck in shared pleasure, each of you cumming hard enough to spur the other onwards. It takes a long time for you to stop, continually milked for your cum. When you finally pull out, you’re breathing so hard there’s almost steam rising from your nostrils.");
	output("\n\n<i>“Mmmmm, that was </i>amazing<i>, you sexy little whore,”</i> you moan, looking down at the shaking leithan. He seems to be on the verge of passing out, his eyelids fluttering while both his asshole and his cock drip with seed. You bend down and whisper to him, watching his eyes droop closed.");
	output("\n\n<i>“Come back and find me again if you want some more, big boy.”</i>");
	output("\n\nWith that, you" + (pc.isCrotchExposed() ? " re-dress yourself":"") + " and leave him behind, moving ever onwards.");
	//set a flag for this, might try and crowdfund an expansion where he shows up again in trap form wanting to get fucked.
	IncrementFlag("FORGEHOUND_MOUNTEDRUTTED");
	processTime(30);
	enemy.loadInAss(pc);
	output("\n\n");
	CombatManager.genericVictory();
}

//[Balljob]
//Requires dick
public function forgyBalljobby(x:int):void
{
	clearOutput();
	showForgehound(true);
	author("Wsan");
	output("<i>“Mmmm, those are some big, juicy balls hanging between your legs, stud,”</i> you murmur, eyeing his oversized endowments" + (!pc.isCrotchExposed() ? " as you pull your [pc.lowerGarments] off":"") + ". <i>“You don’t mind if I play with them a little, do you?”</i>");
	output("\n\n<i>“Wh-what are you doing back there,”</i> he says nervously, trying to crane his neck to look. <i>“Don’t- nn!”</i>");
	output("\n\n<i>“Ohoo, wooow,”</i> you breathe, lustily taking in the sight and feel of the heavy, round orbs in your hands. They’re warm to the touch, somewhat sweaty, and the musk rising from them permeates your nostrils like varnished wood. Juicy was the right word - they’re <i>full</i> of cum, positively ripe with it, ready to pump thick, virile seed into a mate. Only they’re not going to get to do that.");
	output("\n\nThe leithan starts in surprise as you slowly lay your [pc.cock " + x + "] in the gap of his sack, your own heat pressed against his. His large, scaly sack is surprisingly soft and pliable, almost squishable, even, though he moans when you do so.");
	output("\n\n<i>“You’re just fuckable all over, aren’t you big guy?”</i> you mutter, mostly to yourself. <i>“Let me just...”</i>");
	output("\n\nPlacing your hands under his round, plump nuts, you gently press them against your cock from either side. Your [pc.cockHead " + x + "]");
	if(pc.cocks[x].cLength() < 10) output(" is completely covered up, wrapped in his soft, warm embrace");
	else if(pc.cocks[x].cLength() < 20) output(" peeks out from the warm embrace to rub against his large behind, but that’s fine - you’ll just blow your load all over his ass");
	else output(" extends so far beyond the warm embrace of his balls that you’re rubbing against his hindquarters, but that works for you. When you cum, you’ll cover his back in your seed");
	output(". You start slowly rolling your [pc.hips], rubbing yourself into the leithan’s giant cumtanks. He grunts from up front, unable to see what you’re doing but no doubt feeling it.");
	output("\n\n<i>“W-what the fuck are you doing,”</i> he moans.");

	output("\n\n<i>“Giving myself a nice erotic massage with these big, musky balls of yours, stud,”</i> you say, sighing in pleasure. <i>“Pity I don’t have any lotion on hand, but your sweat’ll do.”</i>");
	output("\n\n<i>“You’re what?”</i> he groans, partially confused but mostly annoyed. <i>“I’m not your toy!”</i>");
	output("\n\n<i>“Oh, but you are,”</i> you say, shrugging off his suggestion and continuing your seesawing movements up and down his sack. You can actually feel it getting warmer, his semen further weighing his massive testicles down in your hands. <i>“I’m gonna blow my load all over your fat ass and balls when I’m done just to remind you.”</i>");
	output("\n\n<i>“Nnn... fuck,”</i> he grunts.");
	output("\n\nYou’re not sure what it feels like for <i>him</i>, but it feels amazing to you. Like all the eroticism of titfucking a generously endowed woman but with the added dirty taboo of dominating a man with his own sex organs. You’ve literally got him by the balls, and it has never felt this good. Precum drips from your tip and rolls down the underside of your cock, flowing freely enough that you never want for lube even with the friction.");
	output("\n\nIt can’t feel all that bad, either; you can see his cock twitching and dripping with transparent, sticky pre. It hangs from his doggy dick like a rope, slowly forming a puddle of it at the end of his cock.");
	output("\n\n<i>“Aww, you getting off to me fucking your big, fat balls?”</i> you tease him, starting to rub a little faster. That feels <i>really</i> good. <i>“Maybe we’ll both get a happy ending then, stud. Man, you’re so big but I guess on the inside there’s a submissive, slutty little bitch just waiting to bust out, huh? Look at you.”</i>");
	output("\n\n<i>“Fuh-fuck you,”</i> he pants, feebly trying to crawl away. It doesn’t work and he doesn’t shift at all save for his nuts tightening a little as he flexes his muscles.");
	output("\n\n<i>“Oh, that’s really nice,”</i> you murmur, squeezing his balls a little and earning a high-pitched moan from the leithan. <i>“You can keep doing that if you want.”</i>");
	output("\n\nHe groans as you begin to pump harder, rubbing his balls with your dick hard enough that you feel yourself getting closer to cumming by the second. The leithan doesn’t seem to be far from it either, his cock now fully erect and pumping out slick, clear precum like a river that ebbs and flows continually.");
	output("\n\n<i>“Mmmm, I’m about to cum,”</i> you moan sluttily, playing it up just to stoke the leithan’s fire for fun. <i>“Where do you want it, big boy?”</i>");
	output("\n\n<i>“Uh! Nnnuh! D-don’t!”</i> he pants, right on the edge of release. <i>“Grrrgh- fuck!”</i>");
	output("\n\nYou’ve got about a second to decide whether you want to thrust yourself into his asshole to seed him or blow your load all over his ass and balls.");

	processTime(20);
	//[Inside] [On him]
	clearMenu();
	addButton(0,"Inside",jizzInBallBoiForgysBHole,x,"Inside","Cream-filled leithan is a delicacy!");
	addButton(1,"On Him",cumOnForgySpewspew,x,"On Him","Nothing like a little frosting to complete the taur’s look.");
}

//[Inside]
public function jizzInBallBoiForgysBHole(x:int):void
{
	clearOutput();
	showForgehound();
	author("Wsan");
	output("Letting his nuts swing free, you grab his hindquarters and unceremoniously spread his asshole apart with your hands as you jab your [pc.cockHead " + x + "] inside. He’s a fucking tight fit, owing to probably being formerly anally virginal, but he feels great. You get two lackadaisical thrusts that have the leithan moaning like a whore in before [pc.cum] begins to splurt into his asshole, your dick flexing inside him.");
	pc.cockChange();
	output("\n\nUnable to help himself after being edged for so long with the ballplay, the added prostate stimulation sends the leithan careening over the edge. He lets out a loud, staggering groan of despair as thick, white cum begins to fountain from the end of his cock. Right on time, you feel his warm, inviting asshole begin to squeeze down on you, all but milking you for your seed. You’re only too happy to provide in spades, moaning in release and slapping the leithan’s muscular ass while you pump him full of jizz.");
	output("\n\n<i>“Ooooh, good boy,”</i> you sigh, applauding his uncontrolled instincts. <i>“That’s right, squeeze me dry. You want me deeper, don’t you?”</i>");
	output("\n\n<i>“Nuh- nnngh! Guh! Uhh!”</i> the leithan cries out, his attempted protest foiled by his own pleasure. <i>“Hnnnnh! Nnnn!”</i>");
	output("\n\n<i>“Mmm, let all that stored-up spunk out,”</i> you say, smirking. <i>“Don’t worry, I’m filling you right back up.”</i>");
	output("\n\nBy the time you finish cumming, the leithan man is a wreck. H");
	if(pc.cumQ() > 10000) 
	{
		output("is stomach is");
		if(pc.cumQ() > 30000) output(" massively");
		output(" distended, swollen with your deposited cum. He looks more like a pregnant mare than he does a male");
	}
	else output("e pants in exertion, lying on his side while a massive puddle of spunk slowly rolls away from his body");
	output(". He’s not broken in, but he’s definitely bent. You crouch down to whisper in his ear, his glazing-over eyes trying to focus on your face.");

	output("\n\n<i>“If you ever want to get fucked like that some more, come see me again,”</i> you murmur, rubbing his chin. <i>“I wouldn’t mind getting another round with this oversized body of yours, stud.”</i>");
	output("\n\nYou get up and leave the ‘stud’ in a pool of his own thick, no doubt virile, and utterly wasted seed. There are more important things to take care of than a tired leithan.");
	//set a flag for this, might try and crowdfund an expansion where he shows up again in trap form wanting to get fucked.
	IncrementFlag("FORGEHOUND_PEGGED");
	output("\n\n");
	processTime(20);
	enemy.loadInAss(pc);
	pc.orgasm();
	CombatManager.genericVictory();
}

//[On him]
public function cumOnForgySpewspew(x:int):void
{
	clearOutput();
	showForgehound(true);
	author("Wsan");
	output("You reach a heady climax just fucking his balls, practically jacking yourself off with them by the time your orgasm hits. The increased pace sets him off too, his back arching as he moans. The clear precum dribbling from his dick abruptly gives way to thick, white loads of jizz as you begin to cum ");
	if(pc.cocks[x].cLength() < 10) output("all over his jiggly, swaying sack. You can feel it pumping and pulsing in your hands while he empties himself all over the ground, spurting wasted loads everywhere");
	else if(pc.cocks[x].cLength() < 20) output("with your tip pressed against his muscular ass, [pc.cum] shooting up his rear and coating it in [pc.cumColor] spunk. His balls throb in your hands, the gentle squeezing encouraging them to expel their heavy burden from the end of the leithan’s cock");
	else output("in an upward fountain that splatters all over the leithan’s back and ass, [pc.cum] rolling down his muscular ass and sides. He’s coated in [pc.cumColor] jizz, and you pull back a little just to ensure his asshole is covered in it too");
	output(".");

	output("\n\nThe leithan groans half in despair and half in pleasure, shooting ropes of creamy spunk all over the ground while he lies unmoving. Having been teased for so long, you can feel his balls shaking as they excitedly unload themselves. He can only endure so much, and you pushed him well past the limit. Now he just looks like a regular whore, cumming himself after getting a good fuck. You tell him as much.");

	output("\n\n<i>“You look like a huge slut right now, you know,”</i> you say, giggling a little. <i>“Just couldn’t help it after being manhandled like that, huh?”</i>");

	output("\n\n<i>“Nnnngh, nuh-no,”</i> he pants in desperation, trying to protest. <i>“I-I- nnngh! Uuuh! Nnnnn!”</i>");

	output("\n\n<i>“Aw, relax,”</i> you sigh, lifting a hand and patting his flank. <i>“It’s hot to watch you fucking lose it like the bitch slut you are, anyway.”</i>");

	output("\n\nYou let go and let his nuts slap back into position between his legs, where they sit and make his cock noisily gush all over the floor. It’s fun just to watch while you jack off, shooting the rest of your jizz all over his balls to ensure they get a thorough coating. By the time you’re done, the leithan is a wreck. Covered in spunk, he looks like he just got done starring in a kui-tan fetish video. You crouch next to him, taking care to avoid the rapidly growing puddle of his spunk spreading from his side outwards.");

	output("\n\n<i>“Hey,”</i> you murmur, tapping his chin and directing his unfocused gaze upwards. He looks to be close to passing out. You give him an affectionate rub just to confuse him. <i>“If you ever want more like that, or more of </i>this<i>,”</i> you say, indicating your [pc.cockBiggest], <i>“come and find me. I’ll make it worth your while... stud.”</i>");

	output("\n\nYou leave him there, moaning and on the verge of unconsciousness, covered in two people’s worth of spunk. Time to move on with your journey.\n\n");
	//set a flag for this, might try and crowdfund an expansion where he shows up again in trap form wanting to get fucked.
	IncrementFlag("FORGEHOUND_BUKKAKED");
	processTime(20);
	pc.orgasm();
	enemy.applyCumSoaked();
	CombatManager.genericVictory();
}

//[Leave]
public function leaveForgyBehind():void
{
	clearOutput();
	showForgehound();
	author("Wsan");
	output("<i>“Eh. Guess I’ll just leave you here,”</i> you say, shrugging disinterestedly. <i>“You’re not worth my time." + (silly ? " Smell ya later, loser.":"") + "”</i>");
	output("\n\nYou leave him lying there, bruised and coughing in the wake of his utter defeat.\n\n");
	//Cut dis now that he's not 1x only: You don’t think you’ll be seeing him again; the huge, egotistical types tend to fade away after being shamed.
	CombatManager.genericVictory();
}

//PC loses
public function loseToForgehound():void
{
	author("Wsan");
	//Insulted
	if(flags["FORGEHOUND_INSULTED"] != undefined) output("<i>“Well then,”</i> he grunts, striding towards you as you fall to your knees. <i>“Time to show you why you don’t talk shit to your betters.”</i>");
	else output("<i>“About time,”</i> he says, walking towards you. <i>“I don’t know why you even bothered, as weak as you are.”</i>");

	//Had apology sex:
	if(flags["FORGEHOUND_APOLIFUCKED"] != undefined) 
	{
		output("\n\n<i>“You... you...”</i> you start, your mouth working but no sound coming out as he draws closer. Oh god, you can <i>smell</i> him - his scent, his <i>musk</i>. It’s so strong, invading your nostrils and wrapping itself around your brain like he has it in his dominant fist. Your eyes gradually turn glassy and vacant as you sit there, breathing through your mouth. You hardly even register him stepping over you until you’re face to face with his glorious cock, right where you should be.");
		output("\n\n<i>“Alpha,”</i> you murmur, opening your mouth wide. <i>“Aaaah-”</i>");
		output("\n\nHe fucks your face so violently you’re borne to the ground, lying against it while he violates your throat. His midlegs holding your arms on the floor, you can’t even move as he recklessly shoves his dick down your gullet, grunting in pleasure. You can see his big, fat balls jiggling above you, tantalizingly close but unable to be touched - you’ll just have to wait for the thick, creamy narcotic seed inside them to be slammed inside you instead.");
	}
	else
	{
		output("\n\n<i>“Get- get away from me,”</i> you pant, trying to raise yourself to your feet. He puts a clawed foot on your chest and easily sends you sprawling with a shove. You end up on your back, trying to lift your head as he steps over you. You can see his cock emerging from its sheath, and it is monstrously huge - he’s going to fuck you with it, that much is for sure, but if you can just endure it you’ll have a chance to escape.");
		output("\n\n<i>“Haha, still so unwilling and resistant,”</i> he chuckles indulgently. <i>“Wonder how long that’ll last before my cum kicks in.”</i>");
		output("\n\nBefore you can even ask him what he means, he’s thrusting his massive cock between your [pc.lips]. The tip of the canine endowment slips in without resistance, the length of it rapidly spreading your jaw wide as his dick thickens to an absurd degree a few inches down. Your eyes bulge as your neck swells outwards, suddenly full of hulking dogcock. He grunts and sinks himself even deeper, his gigantic balls coming ever closer to your face.");
	}
	output("\n\nYou get an eyeful of his big, strong underside working as he slams his muscular hindquarters downwards, facefucking you with no regard for your condition whatsoever. " + (flags["FORGEHOUND_APOLIFUCKED"] != undefined ? "You love it":"Frustratingly, the way his slick precum makes your head spin when it spurts inside you makes it almost feel good, like you want more") + ". He’s all too keen to indulge himself completely, making use of you as if you were nothing but a sex doll. With your mouth stretched in such a wide O shape and given how he’s fucking it, it’s not that far from the truth.");
	output("\n\nEverything - <i>everything</i> - changes when he cums, his cock explosively jetting sperm down your throat somewhere below your tonsils. Your head spins as the thick, creamy spunk slops into your stomach" + (flags["FORGEHOUND_APOLIFUCKED"] != undefined ? " and you start to cum your brains out all over again":", the sudden realization that there’s some kind of mind-altering substance in his cum arriving far too late for you to prevent your fate") + ". You orgasm so hard you let out a strained, muffled scream of exertion into the throbbing cock in your mouth, resting between your lips.");

	output("\n\nBy the time he removes his cock from your mouth still spurting addictive seed all over your face and [pc.chest] while you lie prone, you’re mentally shattered, never to recover. Your hollow gaze follows his big, swinging dick as it sways from side to side, and you suddenly find yourself back up on your hands and knees sucking it with a desperation reminiscent of a desert wanderer finding an oasis. You’re already coming to depend on his thick, delicious cum for survival.");
	output("\n\n<i>“That’s right,”</i> he grunts, pleased. <i>“Clean me up, slut. Then get up and get ready to walk. We’re going back to my quarters and you can get the real deal.”</i>");
	output("\n\nWith single-minded focus you spitshine him to an impressive degree. Gulping down every errant strand and rope of cum you can find, you submissively lick and suck his swollen knot for a few minutes before he taps you with a hindleg. Understanding his purpose, you gingerly stand and place a hand on his side to steady yourself. He slaps it away immediately and shoves you in front of him.");
	output("\n\n<i>“Walk,”</i> he says.");
	processTime(40);
	pc.loadInMouth(enemy);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",badEndToForgy);
	//[Next]
	//To Bad End
}

//Bad End
public function badEndToForgy():void
{
	clearOutput();
	author("Wsan");
	showForgehound(true);
	if(!pc.isTaur() && pc.hasCock() && !pc.hasVagina())
	{
		output("The sounds of sex echo in his room, leaking under the door and causing passing pirates to snicker knowingly. The noisy slap of your master’s sweaty balls impacting your backside resounds amidst your groaning, your asshole stretched taut around his giant, dominant cock.");
		output("\n\n<i>“That’s right, you little fucktoy,”</i> he grunts, shoving himself deeper. <i>“Tell me who your master is!”</i>");
		output("\n\n<i>“You!”</i> you moan in a high-pitched voice. <i>“It’s you, you’re my master!”</i>");
		output("\n\nYour stomach is massively distended, owing to the gigantic dogprick thrust more than a foot inside you. Having been taken through a drug regime to make you");
		if(pc.tallness > 5*12)
		{
			output(" smaller,");
		}
		if(pc.femininity < 50) output(" more feminine,");
		output(" cuter, and left with only a pathetic nub of a cock, you’ve been broken down into more or less exactly what he called you: a fucktoy. You cum from your tiny, pre-dripping cock almost every time he thrusts inside you, your prostate extremely oversized and sensitive in relation to your size.");
		output("\n\nIt’s only been a couple of weeks since he first defeated you, but between his deliciously addictive narcotic cum and the drugs, you didn’t stand a chance. None of your former ego or pride remains, having been turned into little more than an exotic novelty. You spend the vast majority of your time strapped to his underside facing downwards, limbs spreadeagled and tied. That way, the moment his cock springs from its sheath he’s entering you, spreading your asshole open.");
		output("\n\nThere’s <i>just</i> enough give in the bindings for him to swing his hips into you, sending you sliding up and down his underbelly while he slams his oversized cock inside you. Right now, though, you’re not doing that. You’re lying down with your legs in the air, too short to wrap around his massive sides but spread far enough that he can pound your fuckhole with ease. He bucks on the bed above you, getting ready to cum while your own pathetic dick spurts wasted seed all over your flat, undefined chest.");
		output("\n\n<i>“Here’s your reward, you fucking whore,”</i> he growls, and suddenly you’re in heaven.");
		output("\n\nYou moan in ecstasy as hot, thick cum begins to flood inside you, pumping into your guts and swelling your stomach outwards with the sheer liquid weight of it. He grunts, forcing as much of himself into you as possible to empty his nuts. By the time he’s done, your tummy is so obscenely inflated outwards that you look like you’re carrying a litter of children despite your maleness.");
		output("\n\nHe pulls out with a wet, sloppy pop, his cum spurting from your ruined asshole onto the bed. He sighs in satisfaction and makes to leave, his urges - and yours - satisfied. You dazedly watch him get dressed, asshole gaped and legs still spread wide. It just feels like a natural position by now.");
		output("\n\n<i>“Clean this place up,”</i> he tells you, flicking his thumb at the mess-covered sheets. <i>“I don’t wanna sleep in this shit because you can’t hold it all inside you.”</i>");
		output("\n\nHe strides towards the door, standing in the entrance while it hisses open before he turns back and reminds you. <i>“And remember - don’t cum until I’m back.”</i>");
		output("\n\nWith that, he leaves you behind. You gradually rouse yourself from your cum-induced stupor, intent on serving your alpha. The sheets need to be replaced, some of the room needs dusting, and you need to be empty so he can fill you up again when he returns. He lets you keep a drawer of underwear to wear, all of it lacy and feminine. Luckily, your cock is so small the bottoms tend to fit perfectly, if a little snug.");
		output("\n\nYou take a shower first, getting yourself thoroughly cleaned and washed up before you return to your task. Newly invigorated, you hum to yourself while you make the bed and think fondly about how he’s going to fuck you to pieces on it tonight. He might be rough, but you <i>do</i> love him. The way he makes you feel is unlike anything else. You feel so safe when you’re with him, protected by a big, strong man.");
		output("\n\nUh, now you’re hard... and you have the dirty sheets full of his scent, his essence. But Master told you not to cum! He’ll know if you did, he’s too perceptive. But... but... oh, Master! You collapse onto the sheets, sliding three fingers up your asshole while you instinctively roll your hips, bathed in the scent of your lover. Stroking your prostate, you throw your head back and pant, glassy-eyed and smiling.");
		output("\n\n<i>“Oh, Master! I love you, I love you, I love you!”</i>");
		output("\n\nIn the end, you lose track of time as you moan and buck your way through several frustratingly weak orgasms. It doesn’t feel nearly as good as when <i>he</i> does it to you, serving only to drive you onwards. By the time you snap out of your semi-conscious torpor, you realize he’ll be back soon. You rush to get the sheets clean and make up the rest of the room, just in time for the door to hiss open again.");
		output("\n\n<i>“I’m back. Did you clean the sheets?”</i> he grunts, looking over at the bed. <i>“You did. Good.”</i>");
		output("\n\nMaster’s praise washes over you, warming your insides and swelling your heart with love. You sigh in happiness and gaze up at him, smiling.");
		output("\n\n<i>“And did you cum?”</i> he asks suddenly.");
		output("\n\nYour expression instantly shifts to one of shock, then embarrassment, then regret. There’s no way you could lie to him, be unfaithful to your Master.");
		output("\n\n<i>“Yes...”</i> you mumble. <i>“I’m sorry, Master.”</i>");
		output("\n\n<i>“Hmmm,”</i> he says, closing in on you as a grin slowly spreads across his face. <i>“Just couldn’t hold back, could you? I bet you masturbated into the sheets over and over, you little slut. Didn’t you? Tell me.”</i>");
		output("\n\n<i>“I... I did!”</i> you gasp in dismay. <i>“I- I couldn’t help it! It- it just smelled too much like you...”</i>");
		output("\n\n<i>“Heh,”</i> he grunts, standing above you and looking down. He’s so large in comparison that he blots out the light from above, forcing you to stand in his shadow. <i>“I’ll punish you later. For now, get your dinner. Maybe if you do real well I won’t have to punish you after all.”</i>");
		output("\n\n<i>“Yes, Master,”</i> you murmur, grateful for the chance to prove yourself. Your ‘dinner’ looms in front of you as you kneel, dripping from the end of his cock. You take his dick in hand and suck gently, his narcotic precum swirling around your mouth before you swallow it down. God, it’s so good - you could spend the rest of your life down here if he asked you, just sucking and swallowing.");
		output("\n\nYour masterful, learned technique earns you your dinner in no less than ten minutes of laboriously sucking his studly cock, throbbing in your throat while thick spunk gushes into your stomach. You gurgle and moan, cumming harder with every swallow. Cum weakly spurts from your tip, spilling to the floor beneath you. Your orgasm lasts a lot longer than your ejaculation, dick still twitching and flexing while you eagerly gulp down your meal.");
		output("\n\nYou get time to breathe again when he moves away, pulling out of your sloppy mouth and leaving his spunk to trickle down your chin. You lick everything you can reach and then slowly scoop the remainder into your mouth with your fingers, swallowing down everything until both you and him are spit-shined to cleanliness. You go to bed that night with a full stomach and a chastity cage on, Master deciding in his wisdom to punish you. It’s okay... you love him all the more for not letting you disobey him.");
		processTime(102*60);
		for(var x:int = 0; x < 20; x++)
		{
			pc.orgasm();
		}
	}
	else
	{
		if(pc.hasVagina()) 
		{
			output("Primal screams of ecstasy emanate from the closed room, pirates passing by cracking jokes about what Jeiyt must be doing to some poor girl inside. They’ve been going on for hours - not that anyone cares. Least of all you, your throat hoarse to the point of soreness.");
		}
		else 
		{
			output("He’s been busy breaking in your newest endowment, a tight virgin cunt with thick black lips. It’s grotesquely distended around his behemoth of a cock, juices spilling from it with every deep thrust he makes inside you. Your former maleness has been all but erased save for a brand in small block letters on your flank that labels you ‘M2F’.");
			output("\n\nHe got rid of nearly all of those masculine features of yours within your first couple of days staying with him, temporarily leaving you only the smallest, most pathetic cock the universe has ever seen");
			if(pc.isTaur()) output(" on a taur");
			output(" to cum with when he brutally fucked your ass. You didn’t mind at all, more than happy to be cruelly bent to his will. You exist to serve your alpha and make him happy, after all. Still, you were secretly more than thrilled to receive his newest gift - it’s just more <i>meaningful</i> when he makes you swell with his cum, now.");
		}
		output("\n\nYou don’t know how many rounds of drugs you went through, but you’ve come out the other side almost unrecognizable. You’re a big, overendowed bimbo slut");
		if(!pc.isTaur()) output(" of a taur");
		output(" by now, breasts so massive it’s lucky you have a taur spine to support them.");
		if(pc.tallness < 11*12)
		{
			output(" You’ve grown");
			if(pc.tallness < 7*12) output(" several");
			else output(" a couple of");
			output(" feet, too, just to ensure you can be mounted for hours at a time without collapsing.");
		}
		output(" Your permanently-lipsticked lips stand out on your face too, obvious at first glance that they’re more a tool for sucking cock than communication. Anything you say comes out with an almost indecipherable lisp, not that you have anything of value to contribute. You’re so fucking dumb you can barely string a coherent sentence together without giggling.");

		output("\n\nLuckily for everybody else in your vicinity, you don’t really talk much. Whenever Jeiyt’s not vigorously using you like the fuckdoll cumdump you are, you’re kept on a leash outside his room with a ring gag in your mouth for anyone to use. He keeps your sweet pussy and plush, sexy asshole locked up tight, however, reserving them exclusively for his use. That really only serves to fuel the frustrations of the people using you, and he knows it. The oral sex you get is <i>very</i> rough, trending towards having the cocks you suck wind up south of your tonsils. Not that you mind, of course - you cum whenever you get yourself some seed orally delivered anyway.");
		output("\n\nIt’s not all bad, though; by the time they’ve finished using you, most of the pirates are really nice. They even let you suck them completely dry and lick them clean when they’re done. All in all, your master has really done a number on you. Even so, your time with him is by far what you look forward to most. Your days are full of slurping cock and cumming all down your shuddering underside, but nothing matches the time you spend with <i>him</i>.");
		output("\n\nYour ruttings are legendary. He’s made you the ideal mate, completely obedient and able to withstand his full strength when he destroys your cunt with a bestial savagery that leaves you dizzy and slumped in a pile of limbs after he’s done. Then he starts again. You cum explosively every time he thrusts inside you, your gigantic breasts jiggling wildly as his hips grind against your wide, feminine ass. Your nipples pierced with golden rings that would otherwise look at home through the nose of a cow, you look every bit the willing slut while he rides you.");
		output("\n\nWhenever he cums inside you, it takes you hours to mentally recover from the bliss. He takes advantage of that, fucking your slut holes over and over while you reel from the pleasure, eyes rolling back in your head as you moan in joy. On particularly good days, you’re still entranced by his cum by the time he comes back in the evening. Sometimes, though, he deigns to take you somewhere.");
		processTime(102*60);
		for(var y:int = 0; y < 20; y++)
		{
			pc.orgasm();
		}
	}
	pc.loadInMouth(enemy);
	pc.loadInAss(enemy);
	if(pc.hasVagina()) pc.loadInCunt(enemy,0);
	clearMenu();
	addButton(0,"Next",moreBadEndingToForgy);
}

//[Next]
public function moreBadEndingToForgy():void
{
	clearOutput();
	showForgehound(true);
	author("Wsan");
	if(!pc.isTaur() && pc.hasCock() && !pc.hasVagina())
	{
		output("Having negotiated with the merchant, Master watches with amusement as you jab the needle into your own arm. The effects take place before it’s even empty and you find yourself moaning in discomfort as your body begins to heat up, shivering with the intensity of the sensation.");
		output("\n\n<i>“U-uuhnh, M-master,”</i> you pant, the needle dropping to the floor and rolling away. <i>“Hot, it’s hot- nnngh!”</i>");
		output("\n\n<i>“Come on then, you little slut,”</i> he chuckles, arms crossed and observing. <i>“Show me what the big deal’s about.”</i>");
		output("\n\nOver the course of the next fifteen seconds, the heat slowly centralizes on a single point: your groin. You crumple to your knees and stare in disbelief, your hips jerking up and down while your cock grows fully erect. It’s so <i>hard</i>, harder than any erection you’ve been able to maintain since your Master turned you into his fucktoy. You gaze up at him in confusion, wondering what’s going to happen to your body.");
		output("\n\nThen, with a gasp, you look back down as the heat focuses even further and swells to a blaze within you. With a massive buck of your hips and a grunt that slips past your clenched teeth, you think you see your dick... grow?");
		output("\n\n<i>“Oh! Oh, it feels so good, Master!”</i> you whine, your voice rising in volume and octave. <i>“Master! Masterrrr!”</i>");
		output("\n\nYour dick throbs with the intensity, growing several inches in the span of a few seconds as thick cum begins to froth and pour from your swollen head. Throwing your head back, you let out an orgasmic scream, your hips jerking in the air while your cock flops back and forth, spurting creamy cum everywhere. Your master watches you debase yourself, a smirk on his face.");
		output("\n\n<i>“Nice,”</i> he grunts in approval. You try and meet his gaze but your dick lands on your stomach and spurts straight upwards, ropes of cum covering your torso, and you find yourself too engrossed in the pleasure to find his face. When the changes finally come to an end, you’re lying on your side and panting, sweat running down your face. That took a lot out of you. Your cock begins to soften, but even as it begins to go limp you can see it’s over a foot long.");
		output("\n\n<i>“Th-thank you, Master,”</i> you moan. <i>“I’m so happy...”</i>");
		output("\n\n<i>“Oh, don’t thank me just yet,”</i> he says, drawing two more needles from a satchel. <i>“You’re not even done.”</i>");
	}
	else
	{
		output("You’re hanging out in the mess hall with your master and another pirate, idly gazing at them while their words go in one ear and out the other. You start paying attention for a moment, your daydream of being roughly taken fading away.");
		output("\n\n<i>“Sell them, you fuckin’ idiot,”</i> Jeiyt laughs. <i>“What else?”</i>");
		output("\n\n<i>“Damn, that’s cooold, man,”</i> the other jokes, jabbing his thumb at you. <i>“Ain’t gon’ let your girlfriend handle them?”</i>");
		output("\n\n<i>“Man, you gotta be fuckin’ kidding me,”</i> Jeiyt snorts. <i>“Look at her. This dumb cunt can barely form a sentence! The only thing she can handle is a cock.”</i>");
		output("\n\nThe two of them look over at you, and you dopily raise your hand to wave with a great big smile on your face. <i>“Hiiii.”</i>");
		output("\n\nThey exchange a meaningful look. Jeiyt sighs and gets up, making to leave. You eagerly follow suit.");
		output("\n\n<i>“Anyway, I’m gonna go pound her cunt in,”</i> he says, pulling on your leash. Dim as you are, you choke for a second before remembering to walk with it. <i>“About all she’s good for, anyway.”</i>");
		output("\n\n<i>“Should share the action, man,”</i> the other pirate says, clicking his tongue. <i>“You know the boys want a piece. Hell, the girls too.”</i>");
		output("\n\n<i>“Yeah, been thinking about it lately,”</i> Jeiyt replies, looking at you. <i>“Maybe next month. I’ll see you round, man.”</i>");
		output("\n\n<i>“Yeah, later.”</i>");
		output("\n\nWalking along beside him on your leash, you struggle to think of what to say. What makes him happy? Oh!");
		output("\n\n<i>“Master... wan’ me to suck Master’s cock?”</i> you ask, looking at him.");
		output("\n\nHe gives you a sideways glance and sighs. <i>“Why?”</i>");
		output("\n\n<i>“‘Cuz tha’s wut makes Master happiest!”</i> you giggle, your massive pierced teats shaking up and down. <i>“Wan’ make Master happy.”</i>");
		output("\n\n<i>“What makes master happiest is when you shut the fuck up,”</i> he grunts, tugging your leash. He doesn’t look that angry, though. You know him extremely well by now, having learned with your body. You draw closer and stroke his muscular arm, marvelling at his strength. Having arrived at his quarters, he pushes you inside with it and the door slides shut behind the two of you. He doesn’t make a move immediately, though you very subtly" + (pc.tailCount > 0 ? " raise your [pc.tails]":" spread your [pc.thighs]") + " to expose your glistening sex just in case he wants to.");
		output("\n\n<i>“Maaan... fuck the other guys,”</i> he mutters, looking your body over as you turn your upper half around to watch him. <i>“Gonna keep you for myself.”</i>");
		output("\n\n<i>“Master not goin’ ‘way?”</i> you ask cheerfully. <i>“Yay!”</i>");
		output("\n\nHe moans in frustration. <i>“I wonder if there’s a drug that makes you </i>smarter<i>...”</i>");
	}
	processTime(100*60);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",finishBadEndingToForgyYaDumbCunt);
}

public function finishBadEndingToForgyYaDumbCunt():void
{
	clearOutput();
	showForgehound(true);
	author("Wsan");
	if(!pc.isTaur() && pc.hasCock() && !pc.hasVagina()) 
	{
		output("You cry out in desperate, hungering joy even as you cum with your ass, unable to ever fully sate your needs. Master’s cock is wonderful, the divine implement of a god, but he’s changed you. Cum jets from the end of your useless, oversized cock, your virile balls tightening against your groin again and again, but it’s never enough. You always have more to give, more pointless seed to spill, thrusting needily into Master’s dogdick while he stands still and lets you debase yourself.");
		output("\n\n<i>“Hahaha, pathetic,”</i> he laughs, watching as a puddle of your spunk forms below the two of you. <i>“Work harder, you little whore. I’m almost there.”</i>");
		output("\n\nYou have to; you <i>need</i> it, to earn that cum from him - it’s the only way you can ever achieve some measure of satisfaction. Your cock rubs along the ground, still adding to the ever-widening pool of jizz while you pant in need. Your orgasms are good, amazing, even - but <i>his</i> orgasms are heavenly. Bringing Master to release is why you’re here, your singular purpose, the only thing that can fulfill you now.");
		output("\n\n<i>“Nnnnn, come on,”</i> he grunts, tail swishing in the air while his hindlegs tighten. <i>“Nnnngh-”</i>");
		output("\n\nHe lets loose a loud, satisfied groan as the tension fades from his body and hot spunk begins to spurt and jet into your stretched out asshole. The blessed heat pours into you, assuaging your need as you get him as deep as possible inside you. Moaning beneath him while he cums, your cock lets a continuous stream of spunk paste itself across the floor. You shudder and shake, impaling yourself on Master’s magnificent cock while he unloads.");
		output("\n\n<i>“Fuuuck,”</i> he groans deeply, sighing in release. <i>“Milk it all out, bitch. Then you can suck the rest out and clean me off.”</i>");
		output("\n\nThat’s the <i>least</i> you can do for him, and you’ll prove it by sucking and licking his enormous balls clean as well. For now, though, you’re wholly focused on just getting as much of cum out of the end of his doggy dick with your tight, squeezing asshole as possible. The more of him you get, the longer you can go before becoming almost feral in need. When Master is feeling particularly spiteful, he’ll let you go a couple of days before you’re finally overwhelmed. Then he’ll make you perform some utterly degrading act that chisels away at your sense of self, leaving you with nothing but the burning heat inside you.");
		output("\n\nIt might not be the end you foresaw when you set out on your journey, but you’re sure to enjoy it anyway. His cock slips free of your distended ass, still dripping and spurting seed, and you turn around to get a grip on it with your hands. Oh, his knot... you should start there, of course. Master does so love it when you lick and suck it.");
		output("\n\nHe relaxes above you and lets out a long, deep inhale as his slave slut gets to work. Life is good.");
	}
	else
	{
		output("The rest of your life will no doubt be a happy one. You get ridden hard every single day, screaming in utter bliss while narcotic cum floods your womb, keeping you firmly in your master’s grasp. The life of a d’zaan’s beta is certainly blessed, especially when they’re the singular member of a species that usually opts for a harem. You fulfill your alpha’s urges whenever he wants, your ever-tight pussy getting rut full of seed on multiple times a day. Sometimes you’re awoken from sleep to find his big, fat cock thrusting into your slutty throat, which is always the best way to wake up. You take great personal enjoyment from getting your master off before he starts his day.");
		output("\n\nSometimes, when he’s particularly horny, he leaves your cunt and asshole dripping with his spunk before he leaves. It’s a nice present to keep you company until he’s back when you’re cooped up in his room, flooding it with pheromones. By the time he returns, the place is so laden with your maddening scent that he usually fucks you right on the spot for a couple of hours, just pulling your hair and savagely bucking his powerful hips into your massive ass.");
		output("\n\nIn time, you swell with pregnancy. That doesn’t stop him from ravaging you day in and day out, plowing your thick-lipped pussy and your plump asshole with a need approaching your own. If anything, it feels like he’s even <i>more</i> studly now, cumming harder and staying erect longer. It’s to the point where you spend nearly every waking hour with him screaming in ecstasy while you get railed underneath him, your stretched-taut fuckhole squirting all over his balls.");
		output("\n\nYou take a second to consider just how lucky you are to be allowed to serve your alpha, sucking and fucking him the moment he desires it. Having his cum bestowed upon you for the rest of your life is all you could ever ask for, like a dream come true. The mere fact that you’re carrying your lover’s children, blessed with his seed, is all you need. You stand and thrust back into him as he bucks his hips, an expression of utter bliss on your face while he empties yet another massive load into your tight, squeezing cunt. After he’s finished knotting you like the bitch mare you are, you’ll suck his beautiful cock clean so that he might do it again.");
		output("\n\nYou can hardly wait.");
	}
	processTime(200*60);
	badEnd();
}