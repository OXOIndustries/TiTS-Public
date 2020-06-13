public function paigeSparSetup():void
{
	if(!pc.hasStatusEffect("PAIGE_SPAR")) 
	{
		var paigesLevel:Number = pc.level;
		//Blind Paige stuck at level 10.
		if(paigeBlind()) paigesLevel = 10;
		//Unblind Paige gets bumped to 12 regardless of if PC is there, otherwise levels are even
		else if(pc.level < 12) paigesLevel = 12;
		//Paige is a max-physique character who scales up with the PC, and as such will have the same or more spar HP than any PC, barring max-physique bumps.
		var sparHP:int = Math.ceil(pc.physique()/10 * pc.HP()/pc.HPMax());
		if(sparHP < 1) sparHP = 1;
		pc.createStatusEffect("PAIGE_SPAR",Math.floor(paigesLevel/2),sparHP,1+rand(3),0);
	}
	clearMenu();
	addButton(0,"Next",paigeSparringScreen);
}

public function paigeSparringScreen():void
{
	clearOutput();
	showPaige();
	if(paigeIsCrew()) output("<b>You are sparring Paige!</b>\n\nYou’re standing in your ship’s cargo hold. Your Ausar opponent stands across from you, her fists raised and close to her face. Her stance is wide and steady; unaggressive, yet you know that a moment’s hesitation will get you opened up. Her clothing offers little protection, but her muscles serve as her armor. Now that she can see, her determination to earn her victory has never been sturdier, and she’s about to prove it to you.");
	else output("<b>You are sparring Paige!</b>\n\nYou’re standing in her yoga class. Your Ausar opponent stands across from you, her fists raised and close to her face. Her stance is wide and steady, but unaggressive; she isn’t about to make the first move. Despite her battle-unprepared clothing and her disability, you know that this fight isn’t going to be an easy one. She wants to prove herself <i>to</i> herself, and she’ll fight like a beast to do it.");
	output("\n\n<u>Your HP:</u> " + pc.statusEffectv2("PAIGE_SPAR") + "\n<u>Paige’s HP:</u> " + pc.statusEffectv1("PAIGE_SPAR"));
	output("\n\nWhat will you do?");
	//Hook -> Uppercut -> Jab
	clearMenu();
	addButton(0,"Hook",paigeSparAction,1,"Hook","Throw a hook to hit her from the side. It ought to shot down an uppercut in its tracks, assuming she doesn’t jab you first.");
	addButton(1,"Uppercut",paigeSparAction,2,"Uppercut","Clock her in the jaw with an uppercut. You should be able to block any jabs. Just hope she doesn’t tag you with a right hook!");
	addButton(2,"Jab",paigeSparAction,3,"Jab","Hit her with a quick jab. It’ll interrupt her attempts at throwing a hook but leave you open to an uppercut.");
	//v1 = paige HP, v2 = pc HP, v3 = next turn action :3
	addButton(4,"Yield",yield2Paige,undefined,"Yield","Do this if you’re not interested in getting hurt just to satisfy Paige’s pride.");
}

public function paigeExitWrapper():void
{
	if(currentLocation != "SHIP INTERIOR") moveSouth();
	else mainGameMenu();
}

public function paigeSparAction(arg:Number = 1):void
{
	clearOutput();
	showPaige();
	showName("\nSPARRING");
	var hit:Boolean = false;
	var paigeHit:Boolean = false;
	var paigeMove:Number = pc.statusEffectv3("PAIGE_SPAR");
	//PC throws a hook
	if(arg == 1)
	{
		output("You try to tag her with a right hook!");
		if(paigeMove == 1)
		{
			paigeHit = true;
			hit = true;
		}
		else if(paigeMove == 2)
		{
			hit = true;
			paigeHit = false;
		}
		else
		{
			hit = false;
			paigeHit = true;
		}
	}
	//PC throws a uppercut
	else if(arg == 2)
	{
		output("You come in low, then strike high, aiming for her chin!");
		if(paigeMove == 1)
		{
			paigeHit = true;
			hit = false;
		}
		else if(paigeMove == 2)
		{
			paigeHit = true;
			hit = true;
		}
		else
		{
			paigeHit = false;
			hit = true;
		}
	}
	else
	{
		output("You make a quick jab for her solar plexus!");
		if(paigeMove == 1)
		{
			paigeHit = false;
			hit = true;
		}
		else if(paigeMove == 2)
		{
			hit = false;
			paigeHit = true;
		}
		else
		{
			hit = true;
			paigeHit = true;
		}
	}
	if(!hit)
	{
		output(" ");
		if(rand(4) == 0) output("Paige deftly ducks from your wide swing, her body moving with practiced fluidity. You could swear, with her reflexes, she wasn’t actually blind.");
		else if(rand(3) == 0) output("Paige steps away from your attack, and you run out of reach, stumbling forward. It was as if she saw your movement coming from miles away.");
		else if(rand(2) == 0) output("Paige sidesteps your strike, giving her full access to your open side. Her clouded eyes are focused on yours with an eerie discipline – she doesn’t even need eyes to read your body language.");
		else output("Paige, with impeccable reflexes belying her disability and a cocksure expression on her face, blocks your attack easily and maneuvers herself into your now-open flank.");
	}
	// if Paige does not dodge the attack
	// Randomly play one of the following
	else
	{
		output(" ");
		pc.addStatusValue("PAIGE_SPAR",1,-1);
		if(pc.statusEffectv1("PAIGE_SPAR") <= 0)
		{
			output("The blow lands hard and does visible damage to Paige’s form and stance, and after a few moments of her trying and failing to collect herself, you understand just how hard you hit her. Eventually, she falls, and she does not get back up.");
		}
		else if(rand(4) == 0) output("Paige’s eyes go wide as your attack strikes true. Just before you felt your knuckles on her fur, it seems she realized her mistake and it was too late to try and fix it.");
		else if(rand(3) == 0) output("Paige winces – and almost flinches – just as you land the blow. Although it felt like punching concrete, it’s clear, from her pained gasp, it had the intended effect on her.");
		else if(rand(2) == 0) output("Paige’s teeth clench as your fist connects. She reels in surprise, but rights herself quickly and doesn’t let the shock to her cheek confuse her.");
		else output("Paige gasps out in surprise and turns her body to avoid your attack, but she’s too late, and soon your clenched hand makes contact, knocking her back a pace.");
		output(" (-1 Paige HP)");
	}
	//Paige swing!
	if(pc.statusEffectv1("PAIGE_SPAR") > 0)
	{
		// if Paige’s counterattack is unsuccessful
		// Randomly play one of the following
		output("\n\n");
		if(!paigeHit)
		{
			//hook -> uppercut -> jab
			if(paigeMove == 1) 
			{
				output("Her left hook never gets a chance to connect, not after you tagged her with that brutal jab.");
			}
			else if(paigeMove == 2) output("She’s reeling so badly that her aggressive attempt at an uppercut completely misses you.");
			else output("Her jab glances off your elbow. Not today, Paige!");
		}
		// if Paige’s counterattack is successful
		// Randomly play one of the following
		else
		{
			if(paigeMove == 3) 
			{
				if(rand(2) == 0) output("Her closed fist swings forward and, before you could react yourself, connects with your lower ribs.");
				else output("She clenches her fist and strikes forward with a fierce jab to your open stomach!");
			}
			else if(paigeMove == 2)
			{
				output("Her hand rushes in and up, coming in low, for a devastating uppercut to your exposed jaw. Your teeth crunch together in the blow, and the shock rattles your whole head.");
			}
			else output("Her fist comes in from the side, catching you completely off guard. Ouch!");
			pc.addStatusValue("PAIGE_SPAR",2,-1);
			output(" (-1 HP)");
		}
	}
	if(pc.statusEffectv1("PAIGE_SPAR") <= 0)
	{
		output("\n\n<b>You win!</b>");
		pc.energy(-50);
		clearMenu();
		addButton(0,"Next",paigeSparringVictory);
	}
	else if(pc.statusEffectv2("PAIGE_SPAR") <= 0)
	{
		output("\n\n<b>That last one has you feeling like maybe sitting down a while...</b>");
		pc.HPRaw = 0;
		clearMenu();
		addButton(0,"Next",loseToPaige);
	}
	else
	{
		//hook -> uppercut -> jab
		var nextMove:Number = 1 + rand(3);
		if(!paigeBlind() && rand(3) == 0)
		{
			if(rand(3) == 0) output("\n\nPaige shuffles cautiously, doing her best to make it impossible to get a read on her next move. You’ll have to guess!");
			else if(rand(2) == 0) output("\n\nPaige hops from foot to foot, changing stances by the moment in an effort to conceal her next move. Who knows what’s coming next?");
			else output("\n\nPaige laughs, <i>“What’s the matter, can’t handle me now that I can see?”</i>");
		}
		else if(nextMove == 1)
		{
			if(rand(3) == 0) output("\n\n<i>“I hope you can handle this,”</i> Paige taunts.");
			else if(rand(2) == 0) output("\n\nPaige cocks her arm back.");
			else output("\n\nPaige hops to your left, then to your right.");
		}
		else if(nextMove == 2)
		{
			if(rand(3) == 0) output("\n\nPaige crouches low, ready for the next exchange.");
			else if(rand(2) == 0) output("\n\nPaige seems to be looking right through you.");
			else output("\n\nPaige’s left ear flicks in irritation, despite her smile.");
		}
		else if(nextMove == 3)
		{
			if(rand(3) == 0) output("\n\nPaige pulls her guard in tight.");
			else if(rand(2) == 0) output("\n\nPaige rolls her shoulders before resuming a fighting stance.");
			else output("\n\nPaige’s right ear twitches.");
		}
		pc.setStatusValue("PAIGE_SPAR",3,nextMove);
		clearMenu();
		addButton(0,"Next",paigeSparringScreen);
	}
}

public function yield2Paige():void
{
	clearOutput();
	showPaige();
	if(paigeIsCrew())
	{
		output("You drop your fighting stance and bend your knee to Paige. <i>“I give up,”</i> you tell her. Paige looks on as you sink before her, bemused. <i>“I don’t think I can win against you, and I don’t want to get hurt trying.”</i>");
		output("\n\nPaige clicks her tongue as she takes a casual stance. <i>“Well, that’s boring,”</i> she hums, placing her hands on her hips. <i>“But I guess that’s the smarter move. Gotta pick your battles, and all that.”</i> She smiles toothily at you, in an almost mocking way. <i>“And now that I can see, I’ve never felt better. I feel like I could fight three of you!”</i>");
		output("\n\nBlind or not, you point out, she’s still built like concrete. <i>“I try!”</i> she laughs. <i>“I don’t hold it against you for wanting to not get hurt, [pc.name]. If I had the luxury back then, I probably would have run too.”</i> She turns around and bends at the waist, lifting her tail to give you a somewhat-clothed view of what it is you’re not fighting for. <i>“But I guess we’ll be saving these spoils,”</i> she says, slapping her own left cheek, <i>“for some other victory.”</i>");
	}
	else
	{
		output("You drop your fighting stance and raise a hand in surrender. <i>“I give up, Paige,”</i> you say to her. Her stance doesn’t drop, but her ears perk up at the news. <i>“I don’t think I can win, and I don’t want to get hurt trying.”</i>");
		output("\n\nPaige clicks her tongue as she takes a casual stance. <i>“Well, that’s boring,”</i> she hums, placing her hands on her hips. <i>“But I guess that’s the smarter move. Gotta pick your battles, and all that.”</i> She smiles toothily at you, in an almost mocking way. <i>“And a blind woman isn’t in that league for you, I take it.”</i>");
		output("\n\nYou point out that, despite being blind, she’s also built like a truck. <i>“I try!”</i> she laughs. <i>“I don’t hold it against you for wanting to not get hurt, [pc.name]. If I had the luxury back then, I probably would have run too.”</i> She turns around and bends at the waist, lifting her tail to give you a somewhat-clothed view of what it is you’re not fighting for. <i>“But I guess we’ll be saving these spoils,”</i> she says, slapping her own left cheek, <i>“for some other victory.”</i>");
	}
	flags["PAIGE_SPAR_RESULT"] = "yield";
	//[=Next=]
	processTime(5);
	pc.changeLust(5);
	pc.removeStatusEffect("PAIGE_SPAR");
	// place PC one square outside of Paige's Yoga Class
	// end scene (scene: Yield)
	clearMenu();
	addButton(0,"Next",paigeExitWrapper);
}

// The remainder of the document is combat win/loss versus Paige.
// (scene: Fair Fight – Loss)
public function loseToPaige():void
{
	clearOutput();
	showPaige(true);
	pc.removeStatusEffect("PAIGE_SPAR");
	flags["PAIGE_SPAR_RESULT"] = "loss";
	IncrementFlag("PAIGE_SPAR_LOSSES");
	output("You’re battered, bruised, a little disoriented with the flurry of horny motion around you, and, before you realize it, naked. You lay there as Paige has her way with you, stripping you of your effects, y");
	if(pc.hasCock()) output("our [pc.cocks] at half-mast and rising");
	if(pc.isHerm()) output(" and y");
	if(pc.hasVagina()) output("our [pc.vaginas] sit" + (pc.vaginas.length == 1 ? "s" : "") + " exposed, a little slick and only getting wetter");
	if(!pc.hasGenitals()) output("our [pc.crotch] exposed, betraying the arousal you’re truly feeling with its plainness");
	output(".");

	output("\n\n<i>“Damn,”</i> Paige sighs lustfully, lifting her shirt up and exposing her taut C-cups to the air. In two swift kicks, her pants are gone, and she’s as naked as you are: her nipples poke sharply through her fine fur, and you can smell a hint of her arousal from the floor. <i>“I almost forgot how randy a good fight gets me. Hope you’re ready for the</i> real <i>test, [pc.name].”</i>");

	output("\n\nShe straddles you, squatting herself flat onto your crotch");
	if(pc.hasCock()) output(", immediately squashing [pc.oneCock] flat against your belly as she hotdogs you, lubing up your shaft with herself");
	else if(pc.hasVagina()) output(", her cunt against [pc.oneVagina], sharing her personal lube with you and getting you wet and ready for what’s about to come");
	else output(", her cooch slapping wetly against your [pc.crotch], doing enough lubing for two");
	output(". She lewdly humps against you, riling herself up, as her hands travel to your [pc.chest] and start playing with your [pc.nipples], pinching at them roughly.");
	output("\n\n<i>“Let it be known that I’m merciful in victory,”</i> she says, ironically accentuating her statement with a tight pinch, making you wince. <i>“I’m going to fuck you, [pc.name], and it’s going to be exhausting.”</i> She licks her lips, examining your body as she toys with it. <i>“But I’ll let you decide how I do it. It’s the least I can do for my little, mmmm, my little victim.”</i>");

	processTime(5);
	pc.changeLust(10);
	//[=Oral=][=Vaginal=][=Anal=]
	// end scene (scene: Fair Fight – Loss)
	addButton(0,"Oral",FFLO,undefined,"Oral","Take it in the mouth. Since you lost the fight and this isn’t about you, Paige probably won’t return the favor.");
	if(pc.hasCock())
	{
		if(pc.cockThatFits(paige.vaginalCapacity(0)) >= 0) addButton(1,"Vaginal",FFLV,undefined,"Vaginal","Put it in her the old-fashioned way. Although this is typical sex between two consenting adults, Paige is on such an adrenaline rush that you should probably expect it to be... challenging.");
		else addDisabledButton(1,"Vaginal","Vagina","Even though Paige has given you the option, she wouldn’t accept this. You’re way too big for her!");
	}
	else addButton(1,"Vaginal",FFLV,undefined,"Vaginal","Go with the usual bump-and-grind. Although this is typical sex between two consenting adults, Paige is on such an adrenaline rush that you should probably expect it to be... challenging.");
	if(flags["PAIGE_ANAL"] != undefined)
	{
		if(pc.hasCock())
		{
			if(pc.cockThatFits(paige.analCapacity()) >= 0) addButton(2,"Anal",FFLA,undefined,"Anal","Challenge Paige to take you up the butt. Given how Paige is a bit of an anal fiend and she’s in a bit of an adrenaline rush, this may be biting off more than you can chew.");
			else addDisabledButton(2,"Anal","Anal","You’re so big that even going in properly would be a task in of itself. No way would Paige let you put something so big in her butt!");
		}
		else addDisabledButton(2,"Anal","Anal","This would be kind of difficult to do without a dick to do it with!");
	}
	else addDisabledButton(2,"Anal","Anal","You know where you’d <i>like</i> to tell Paige to shove you, but you’re not sure if she’d be into that. Maybe you should ask her in a more controlled environment first.");
}

//[=Oral=]
// No requirements.
// Tooltip: Take it in the mouth. Since you lost the fight and this isn’t about you, Paige probably won’t return the favor.
// (scene: FFLO)
public function FFLO():void
{
	clearOutput();
	showPaige(true);
	output("The fight’s left you exhausted, and you’re not sure you have the energy to withstand a ‘proper session’ with Paige, especially since she’s as riled up as she is. <i>“Please fuck my face,”</i> you say to her, intentionally sounding meek and subservient for her pleasure despite your exhaustion. <i>“It’s what a loser properly deserves, don’t you think?”</i>");
	output("\n\nThe smile on her face grows from ear to pointed ear, her eyes lighting up like she just opened her first birthday present. <i>“Couldn’t have said it better, you little bitch,”</i> she growls, then, without lifting too far off your body, scoots forward on her knees, dragging her wet paunch up your [pc.belly] and across your [pc.chest]. Then she goes to your neck, then your chin – then dodges your mouth entirely and lands her sex on your nose, forcing her scent into your nostrils.");
	output("\n\n<i>“Smell that?”</i> she asks you redundantly as she rocks and grinds herself on your face, penetrating herself with your nose. <i>“Smells like</i> victory.”</i> With the message sent, she crunches her belly and leans back, tracing your upper lip with her lower lips, and then plugging herself tightly against your mouth. You feel her strong hand grip you");
	if(pc.hasHair()) output("r [pc.hair]");
	else output(" by the back of your skull");
	output(" and lock you against her pelvis. <i>“This is what it tastes like, too.”</i>");

	output("\n\nShe starts humping against your face, grinding her cooch along your [pc.lips], her juice coating them and dripping down your chin. There’s nothing left for you to do but open up, stick out your tongue, and do as she demands of you.");

	output("\n\nShe hisses sharply as soon as she feels your [pc.tongue] dig into her, spearing into her depths. <i>“Good [pc.boyGirl],”</i> she congratulates, using her lock on your head to guide your face as she grinds and presses against you. You feel her strong legs tense around your head, her toned thighs framing against your head and your ears, sealing you in. You’re forced to breathe through your inundated nose, getting another deep breath of her scent with each lungful.");

	output("\n\n<i>“Grab my ass,”</i> she commands, and you eagerly do, reaching up and grasping both tight globes, pulling at the strong flesh and fine fur you find. You massage them lightly as she idly bounces on your face, fucking herself with your tongue. <i>“You’re very compliant,”</i> she notes, mashing your face into her pelvis once more to prove her point. <i>“Hell, if this is what you wanted, [pc.name], we could always skip the foreplay next time.”</i>");

	output("\n\nShe squeezes on your tongue, trapping it inside her as she uses her free hand to toy with her clit, jilling herself off on you. <i>“But, hmm, that wouldn’t leave me very satisfied.”</i> She contemplates to herself as she casually uses you as some kind of sex saddle. <i>“I’m not ever as horny as I am after the thrill of a decent challenge. I guess skipping to the end would just be doing you the favor.”</i>");

	output("\n\nYour hands quest upward, one hand reaching for her tail, knowing that she has a particular weakness there. You deftly stroke two fingers along its underside, near her base, scratching at her most vulnerable erogenous zone. The effect is immediate: she stiffens on you, her wet and puffy cunt gushing more of its honey down your tongue and across your face, and she shuts up momentarily, unable to breathe as you take advantage of her.");

	output("\n\n<i>“Aah,”</i> she shudders delightfully, her fingers rotating her button a little faster. <i>“You’re a bit of a trickster, [pc.name]. Or maybe you’re a sore loser? Trying to come out on top, even with a mouthful of Ausar cunt?”</i> She answers your aggression by lowering her body, pressing more of her weight onto your face, forming a sloppy seal around your lips. You feel the inside of her tunnel take a narrower shape towards the tip of your [pc.tongue] as she does – you’ve almost bottomed her out.");

	output("\n\nHer dominance and unwillingness to let up is painful, but not painful enough to hurt. You wriggle your tongue, massaging against her each and every bump and wall, twisting and coiling it, saturating it with her essence. Your movements are effective: Paige subtly twists her pelvis with your appendage, wanting to follow it to coax more pleasure for herself.");

	output("\n\nPaige’s eyes close in bliss as she rides you, and her breathing becomes long, slow, and deep. She’s not there yet, but she’s getting closer. <i>“You know, a lot of people would kill to be in your position,”</i> she notes, the fingers on her clit drawing broad, lazily circles. <i>“Face-deep in a stronger, superior woman’s genitals, drinking her cum like it were heaven’s nectar. If that sounds like a good time to you, say nothing at all.”</i> You’re unable to speak, considering your position. <i>“That’s what I thought.”</i>");

	output("\n\nHer movements slowly become erratic and strenuous as she continues ");
	if(!silly) output("riding your face");
	else output("her magic carpet-eating ride");
	output(". Despite her incoming orgasm and her herculean effort to stave it off in favor of lording herself over you, her rebellious body gives you all the signals you need to know that the event is nearly over. She draws in deeper drags of air and holds it for longer before exhaling as she tries to contain herself.");
	output("\n\n<i>“I got some good news,”</i> she says, her knuckles losing their grip on your head – but that just means her claws start digging into your [pc.skinFurScales] sharply. <i>“You’re about to get baptized. I’m sure you’ll love it.”</i> She releases her inhibition and starts really fucking you; she leans her hips back and pumps them forward, almost as if she was fucking your mouth with a dick rather than a pussy. <i>“Then we’ll get up, pretend this never happened, and after you take a breather to get your strength back, you can challenge me again, lose, and start it all over – as many times as you like.”</i>");

	if(silly) output("\n\nThat was oddly specific. ");
	else output("\n\n");
	output("As the final herald to her incoming orgasm, she bumps you forward, your nose hard-pressed against her lower belly, as she squeaks out wordless gasps of joy. You first feel her tunnel collapse and converge around your tongue, squeezing it hard; you secondly feel the hot liquid of her cum burst around you, further coating your [pc.tongue] all the way to the root in your mouth and across your face.");

	output("\n\nShe sighs and laughs delightedly as she cums and cums on your face and in your mouth. Her ironclad grip on your head doesn’t let up, despite her hands shaking and her body quivering in barely-restrained effort to stay in control. You feel her thighs tighten around your skull, and your senses are restricted to seeing, feeling, hearing, smelling and most definitely tasting Paige, her girlcum soaking your mouth in waves.");

	output("\n\nYou don’t <i>hate</i> your position, and to enhance it for her, you stroke along her weak spot at her tail some more, causing her to shudder and her voice to rise. Your tongue in pinched and strung of everything Paige’s body could have hoped to gain from it, yet she squeezes and massages you for moments longer – until, finally, her convulsions grow farther apart and weaker in strength.");

	output("\n\nPaige doesn’t get up right away, enjoying her own afterglow and eking out her chance at sexual dominance a bit longer. <i>“Phew!”</i> she finally gasps, satisfied. <i>“Damn, do you know how to eat a box, [pc.name]. I’ll have to beat the shit out of you more often!”</i>");
	output("\n\nShe disengages, you and take a deep breath of fresh air for the first time in what feels like an air. Your mouth is still absolutely caked in her juices, and you doubt you’ll be tasting anything else for a little while. Y");
	if(pc.hasCock()) 
	{
		output("our [pc.cocks] ");
		if(pc.cockTotal() == 1) output("is ");
		else output("are ");
		output("rigid as could be, dripping your pre-cum impetuously");
	}
	//if (pc.isHerm = true)
	if(pc.isHerm()) output(" and y");
	if(pc.hasVagina())
	{
		output("our [pc.vaginas] ");
		if(pc.totalVaginas() == 1) output("is");
		else output("are");
		output(" soaked through, your own [pc.girlCum] soaking the floor through in a lewd and expanding puddle");
	}
	if(!pc.hasGenitals()) output("ou’re frustrated for some kind of relief yourself after such an incredible display, yet you have nothing that Paige could return the favor with, if she even would");
	output(".");

	output("\n\nYou watch Paige as she gets to her feet and dresses herself. <i>“Thanks!”</i> she says to you casually, like you just lent her a twenty. She’s well aware of your situation but she’s pretending not to notice or care – while cold, you know it’s also part of the game. <i>“Hurry up and beat me, [pc.name], so you can show</i> me <i>what a loser properly deserves.”</i> Once she’s fully dressed, she blows you a kiss and leaves the room.");

	output("\n\nYou’re dazed, beaten, exhausted, and horny as you could possibly be. If you went to Paige right now and asked her to fuck you, you know damn well she’d reciprocate for another round. But until you make that decision to swallow your pride, all you can do is put your effects back on and leave after her.");

	// end scene (scene: FFLO); place PC one square outside of Paige’s Yoga Class or back to the ship’s main menu; increase Lust by 50; add Cum Soaked status
	pc.applyPussyDrenched();
	pc.girlCumInMouth(paige);
	processTime(20);
	pc.changeLust(50);
	output("\n\n");
	clearMenu();
	addButton(0,"Next",paigeExitWrapper);
}

//[=Vaginal=]
// Requires a penis with an area of 65 or less OR a vagina or to be totally sexless. Grey out if the PC is too big, including herms
// Tooltip (Too big): Even though Paige has given you the option, she wouldn’t accept this. You’re way too big for her!
// Tooltip (Just right): Put it in her the old-fashioned way. Although this is typical sex between two consenting adults, Paige is on such an adrenaline rush that you should probably expect it to be... challenging.
// Tooltip (PC is a woman or sexless): Go with the usual bump-and-grind. Although this is typical sex between two consenting adults, Paige is on such an adrenaline rush that you should probably expect it to be... challenging.
// (scene: FFLV)

public function FFLV():void
{
	clearOutput();
	showPaige(true);
	
	var x:int = -1;
	
	// Continue here if the PC has a dick that fits
	if(pc.hasCock() && pc.cockThatFits(paige.vaginalCapacity(0)) >= 0)
	{
		x = pc.cockThatFits(paige.vaginalCapacity(0));
		if(x < 0) x = pc.smallestCockIndex();
		output("You’re exhausted and battered from the battle, but Paige has gotten at least <i>one</i> part of you excited and ready for round two. You’re not about to deny yourself the reward you suffered through your lickings for, and, based on Paige’s body language, you know exactly what answer she wants you to give. <i>“Let’s not make this complicated,”</i> you say, your [pc.cock " + x + "] throbbing underneath Paige’s body. <i>“Fuck me like you own me.”</i>");
		output("\n\n<i>“That’s what I thought.”</i> She obliges you, lifting herself off your body and fishing your [pc.cock " + x + "] out from between you. She strokes the head against her mons, dipping it between her labia teasingly, wetting it for the better journey coming up. <i>“The real challenge is only coming up, [pc.name].”</i>");
		output("\n\nShe squats, spearing yourself into her honeypot. You feel her body contort itself to accommodate yourself; her vaginal walls ripples and squeeze around you as you sink deeper and deeper, until her hips press flat against yours. She hums to herself and rocks her hips a bit, getting you good and lodged, acclimating herself to your girth.");
		
		pc.cockChange();
		
		output("\n\n<i>“That’s the good shit,”</i> she sighs delightedly. When she’s as settled as she’s going to get, she leans forward, bracing herself on your [pc.chest] and drawing her hips forward. <i>“I’m not going to break you,”</i> she promises, drawing one finger down your cheek lovingly. <i>“But I</i> am <i>going to test you.”</i>");
		output("\n\nYou barely have time to register her words when she slams back onto you");
		if(pc.balls > 0) output(", her pert ass capping your [pc.balls] with one heavy slap");
		output(". When she pulls up, it’s comparatively languid and lazy, but then she fucks herself back down onto you just as ferociously, until she’s established a steady, powerful rhythm with herself on your dick.");

		output("\n\nYou have no say in anything: when you tried to reach up to grab her ass, she batted your hands away. When you thrust up into her (involuntarily), she responds by growling and slapping your [pc.hips] back down with her own, making your hips ache a bit. You’re nothing more than a large, warm, fleshy doll with an erection for her to pleasure herself with.");

		output("\n\n<i>“Don’t pretend you don’t like being where you are,”</i> she says through halting, heaving breaths. <i>“If you didn’t want to get topped by an Ausar bombshell, you’d have put in a little more effort, don’t you think?”</i> She punctuates her taunting by hilting herself and crunching her abdominals – you can feel her vaginal walls grip you like a vice, rather painfully, as the blood rushes to your [pc.cockHead " + x + "]. It’s all a demonstration on not only her impressive bodily strength and control, but her dominance over you. <i>“You know what you gotta do to get it the way you want it.”</i>");

		output("\n\nHer grip on your [pc.chest] grows tighter as she increases her pace and her breathing, but you don’t think she’s quite ready to orgasm yet. You’re hard as stone inside her, and although you’re certainly feeling the typical, carnal pleasure of having sex with a woman, your experience is a bit shunted by your inability to do anything other than lay still.");

		output("\n\nStill, you can’t deny Paige’s words: having her be so <i>thorough</i> with you is a new type of submissive pleasure you hadn’t realized you wanted until now. Paige is a wild woman on top of you, claiming what is hers by right of combat, and watching the ways she moves – her powerful muscles all clenching and relaxing in a beautiful symphony to the universe’s most timeless and pleasurable truth – is a spectacle all in its own. You catch yourself thinking that maybe losing to her more often wouldn’t be so bad.");

		output("\n\nPaige leans in, her mouth against your ear, as she whispers to you. <i>“I can tell you like it.”</i> Her tone is loving, almost motherly, and she gently strokes at your [pc.hair] even as her powerful hips crush yours to dust. <i>“It’s okay to admit that you like being my bottom bitch. That you</i> like <i>getting your ass handed to you, and that you like getting owned physically and sexually, and that,”</i> she pauses, licking along your ear wetly, <i>“and that you want it. If I were the type to own a harem, you’d be first in line. It’s okay to like that.”</i>");
		output("\n\nThe talk is as much for her benefit as it is for you, and the ideas she’s been sharing with you have had an effect on her performance: her hips jackhammer you into the floor, shucking the entirety of your shaft into and out of her at ferocious, greedy speeds. She licks you again. <i>“Maybe I can start. And you’d be my alpha breeding stud; my number-one go-to for a hot dick. Would you like that?”</i> You don’t want to admit anything with words, but you whimper as your orgasm approaches. <i>“Let me show you how much that idea turns me on, too.”</i>");
		output("\n\nWith a few more pumps, she takes a sharp breath and holds still. You feel her pussy tighten around you, then convulse, milking your [pc.cock " + x + "] for its load. Already on the verge of an orgasm and eager to answer your dominator’s call, you oblige, ");
		if(pc.cumQ() <= 300) output("your dick bloating with its load as it travels through you and into Paige. She winces in delight, her grip on your [pc.chest] tightening with every pulse she feels inside her; she rocks her hips and tenses her abs again, squeezing every last drop she can from you.");
		else output("at last getting the upper hand on Paige, even if neither of you were expecting how: your load, far more substantial than she anticipated, rockets up your shaft and deluges her tunnel with your [pc.cum]. Her breath catches in her throat as her body instinctually works to take in as much as it can, even when it clearly can’t – her tense abs slowly bloat outward from her body trying to contain you, and when she can simply take no more, you feel it splash awkwardly back onto your pelvis, soaking you both through with your seed. And you’re still not done.");
		paige.loadInCunt(pc, 0);
	}
	// Continue here if the PC is female or sexless
	else
	{
		output("You’re exhausted and battered from the battle, but Paige has gotten at least <i>one</i> part of you excited and ready for round two. You’re not about to deny yourself the reward you suffered through your lickings for, and, based on Paige’s body language, you know exactly what answer she wants you to give. <i>“Let’s not make this complicated,”</i> you say, your [pc.vagina] throbbing underneath Paige’s body. <i>“Fuck me like you own me.”</i>");
		output("\n\n<i>“That’s what I thought.”</i> She obliges you, lifting away from you and sliding her hips back a bit until her pussy is lined up perfectly with yours. With impressive grace, she tilts her hips just enough until her clit presses against your [pc.clit], tickling each other before she presses against you properly. <i>“The real challenge is only coming up, [pc.name].”</i>");
		output("\n\nShe humps forward, charging her honeypot against your own in one rough thrust. You feel the heats of your individual genitals mingle; you feel her own feminine honey drip and lube you up, as you do to her. She hums to herself and rocks her hips a bit, getting you good and bothered, working to fit your bodies together like a lewd puzzle.");
		output("\n\n<i>“That’s the good shit,”</i> she sighs delightedly. When she’s as settled as she’s going to get, she leans forward, bracing herself on your [pc.chest] and drawing her hips forward. <i>“I’m not going to break you,”</i> she promises, drawing one finger down your cheek lovingly. <i>“But I</i> am <i>going to test you.”</i>");
		output("\n\nYou barely have time to register her words when she rocks her hips backward, completing a circuit of her wet cunt against yours.");
		output(" As pleasurable as it is, the underlying friction between her uncaring thrusts causes a tingling, almost burning, sensation in your mons: not enough to hurt but enough to know it’ll hurt after too long.");
		output("\n\nYou have no say in anything: when you tried to reach up to grab her ass, she batted your hands away. When you thrust up into her (involuntarily), she responds by growling and slapping your [pc.hips] back down with her own, making your hips ache a bit. You’re nothing more than a large, warm, fleshy doll with a wet hole for her to pleasure herself with.");
		output("\n\n<i>“Don’t pretend you don’t like being where you are,”</i> she says through halting, heaving breaths. <i>“If you didn’t want to get topped by an Ausar bombshell, you’d have put in a little more effort, don’t you think?”</i> She punctuates her taunting by stopping herself and flexing her thighs, scissored tightly between yours; you feel a tight pressure between your legs caused by nothing more than the muscle mass in her legs. It’s all a demonstration on not only her impressive bodily strength and control, but her dominance over you. <i>“You know what you gotta do to get it the way you want it.”</i>");
		output("\n\nHer grip on your [pc.chest] grows tighter as she increases her pace and her breathing, but you don’t think she’s quite ready to orgasm yet. You’re a wet puddle beneath her, and although you’re certainly feeling the typical, carnal pleasure of having sex with a woman, your experience is a bit shunted by your inability to do anything other than lay still.");
		output("\n\nStill, you can’t deny Paige’s words: having her be so <i>thorough</i> with you is a new type of submissive pleasure you hadn’t realized you wanted until now. Paige is a wild woman on top of you, claiming what is hers by right of combat, and watching the ways she moves – her powerful muscles all clenching and relaxing in a beautiful symphony to the universe’s most timeless and pleasurable truth – is a spectacle all in its own. You catch yourself thinking that maybe losing to her more often wouldn’t be so bad.");
		output("\n\nPaige leans in, her mouth against your ear, as she whispers to you. <i>“I can tell you like it.”</i> Her tone is loving, almost motherly, and she gently strokes at your [pc.hair] even as her powerful hips crush yours to dust. <i>“It’s okay to admit that you like being my bottom bitch. That you</i> like <i>getting your ass handed to you, and that you like getting owned physically and sexually, and that,”</i> she pauses, licking along your ear wetly, <i>“and that you want it. If I were the type to own a harem, you’d be first in line. It’s okay to like that.”</i>");
		output("\n\nThe talk is as much for her benefit as it is for you, and the ideas she’s been sharing with you have had an effect on her performance: her hips jackhammer you into the floor, taking all the pleasure she can for herself from you at ferocious, greedy speeds. She licks you again. <i>“Maybe I can start. And you’d be my alpha bottom bitch; my number-one go-to for a hot pot to jill off with. Would you like that?”</i> You don’t want to admit anything with words, but you whimper as your orgasm approaches. <i>“Let me show you how much that idea turns me on, too.”</i>");
		output("\n\nWith a few more humps, she takes a sharp breath and holds still. You feel her body tighten on top of you, followed by a low groan, followed by a particular gushing of her fluids onto your ");
		if(pc.hasVagina()) output("[pc.vagina], her juices overflowing yours as she marks you. Your own flows from you in response to your dominator’s unspoken command: your [pc.girlCum] squirts from you in waves, the liquids mixing into a unique tonic of [pc.race] and Ausar girl-cum, soaking you both to the bone. When you think Paige is done, she convulses again, intent on making sure you don’t cum more than she does, until she’s got nothing left to squirt with");
		else output("pelvis, her juices overflowing as she marks you. You feel intensely frustrated, unable to join her orgasmic state: you clench your hands and your teeth in agony as Paige paints your legs with her Ausar liquids, and you’re helpless to vent your own lust for your dominator in kind. On top of everything – losing the fight; being forced to remain still as Paige fucks you; and your ever-mounting lust with no outlet – being unable to obey to Paige’s unspoken command to cum with her has you feel lame as a submissive");
		output(".");
		pc.applyCumSoaked();
	}
	// Merge here
	output("\n\nPaige rocks against you a few more times, getting absolutely everything out of you before she lets you go. She giggles to herself as she comes down her adrenaline high; you feel her body relax against you, her strong muscles losing their tension. <i>You,</i> on the other hand, are far more bruised than you were when you started: ");
	//if (pc.hasCock = true)
	if(x >= 0) output("your [pc.cock " + x + "] skips the flagging and half-hard cooldown and goes straight to flaccid, too damaged to maintain its structure for longer than a second");
	else output("your [pc.hips] ache with the damage Paige inflicted on them with her strongwoman-vice; a dull pain radiates from your [pc.crotch] that you’re sure isn’t permanent, but you’re also not sure when it’ll leave");
	output(".");

	output("\n\n<i>“Godsdamn, does it feel good to be the winner.”</i> Paige congratulates herself as she disengages from you");
	if(x >= 0) output(", your [pc.cum] leaking from her tunnel as she does");
	output(". <i>“Hurry up and win a match, [pc.name], so you can know what it’s like. I’m excited to see what kind of kinks you have in mind for me.”</i>");

	output("\n\nYou lay on the floor, physically and sexually dominated and defeated as Paige casually redresses. You’re exhausted and stiff, and Paige does nothing to alleviate you or help you with your pain – which is a little cold, but it’s all playing the part of the dominant victor, you realize, and her pleasure for her victory didn’t necessarily involve your own. You’re alone in the room before you have the strength to get up and gather your effects.");

	// end scene (scene: FFLV); reduce Lust to 0 (if sexless, do nothing); place PC one square outside of Paige’s Yoga Class or back to the ship’s main menu; inflict Sore on the PC
	output("\n\n");
	processTime(20);
	if(pc.hasCock()) pc.orgasm();
	soreDebuff(3);
	pc.changeLust(50);
	clearMenu();
	addButton(0,"Next",paigeExitWrapper);
}

//[=Anal=]
// Requires a penis with an area of 50 or less.
// Display, but lock, this option if the PC has not yet had anal sex with Paige
// Tooltip (Too big): You’re so big that even going in properly would be a task in of itself. No way would Paige let you put something so big in her butt!
// Tooltip (Just right): Challenge Paige to take you up the butt. Given how Paige is a bit of an anal fiend and she’s in a bit of an adrenaline rush, this may be biting off more than you can chew.
// Tooltip (No dick at all): This would be kind of difficult to do without a dick to do it with!
// Tooltip (Option is locked): You know where you’d <i>like</i> to tell Paige to shove you, but you’re not sure if she’d be into that. Maybe you should ask her in a more controlled environment first.
// (scene: FFLA)
public function FFLA():void
{
	clearOutput();
	showPaige(true);
	output("<i>“Let’s see you keep up your attitude with an ass full of dick,”</i> you challenge, knowing full-well it’s hot air.");

	var x:int = pc.cockThatFits(paige.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();

	output("\n\n<i>“Really, now?”</i> she chides, grinding against you a bit more, exaggerating her movements as she hotdogs your stiff rod with her slick cunt. You’re sure she’s using her pussy juice to lube your [pc.cock " + x + "] so it doesn’t go in raw. <i>“I never realized how much of a fool for butt-stuff I was before I met you, you know. You only have yourself to blame for what’s about to happen.”</i>");

	output("\n\n<i>“From my point of view, I’m about to get anal with a bombshell of an Ausar. Not much of a loss, if you ask me.”</i>");

	output("\n\n<i>“You’re just asking for it to hurt, aren’t you?”</i> She smiles confidently; she knows her limits, and your own, and your challenging has inspired her to test them both. <i>“We’ll see how much you’re into it when we’re done.”</i>");

	output("\n\nPaige is done with preparing and talking; she lifts herself up and grabs your [pc.knot " + x + "], batting it once more against her exposed cunt before lining it up behind herself, pressing your [pc.cockHead " + x + "] against her back entrance. <i>“Last chance to back out,”</i> she warns. When you keep mum, she lowers herself, far faster than you expected, piercing you into her tunnel as deep as she’s comfortable with.");
	
	pc.cockChange();

	output("\n\n<i>“Ahh,”</i> she sighs, rotating her hips a bit to settle you inside her. Her tunnel is tight, far tighter than you had anticipated, and it’s hotter than you were ready for. When Paige is good and ready, she crunches her abs, tightening her every muscle, squeezing every covered inch of your [pc.cock " + x + "] lodged in her butt tighter than what you’re comfortable with. You knew what you were getting into when you challenged Paige to take you anally, but rather than you having any sort of agency by plowing her ass, you’re a prisoner in the cage that is her body, and, from the ‘you fucked up’ expression on her face, Paige isn’t going to be a kind warden.");

	output("\n\n<i>“It’s kind of weird,”</i> Paige says, not the least little bit winded or strained as her hips bounce on your dick, her sphincter and every part of her insides gripping you tight enough to cause a light burning from the friction on your shaft. This isn’t how doing her butt <i>normally</i> goes, but the circumstances aren’t exactly normal – and Paige seems to enjoy every bounce, apparently loving the tighter sensations involving her ring and using your every wince as she squeezes on you when she goes down and pulls on you when she raises to fuel her own lust.");

	output("\n\n<i>“I dunno if I’d say I like anal more than I like it in my cunt, like the good Gods intended,”</i> she pontificates while you struggle in confused pleasure beneath her: on the one hand, you’re fucking Paige’s ass and you’re experiencing every sensation that entails, but on the other, she’s using her amazing control over her body, honed over a lifetime of yoga exercises, to make sure you don’t treat it like just some other anal fling.");

	output("\n\n<i>“But the good Gods probably shouldn’t have made taking it up the butt so much fun! Maybe it’s because it’s so wrong? Maybe it’s because my ass is one of my sexier assets? Whatever the case, I’m getting about the same results. What do you think?”</i>");

	output("\n\nYou can’t muster any sort of reply, focused too much on taking her punishment. <i>“That’s what I thought, [pc.name].”</i> Paige breathes calmly through her nose as she fucks you; you wince through clenched teeth as you take it. Paige’s hips move fluidly and with a sort of grace that only a yoga master could achieve with something in their butt; the few times you find pleasure between her ruthless pounding is insulted by your agitated body fidgeting helplessly beneath you.");

	output("\n\nYou attempt to involve yourself in the sex a bit, raising your hands to grab onto something of hers: a thick globe of ass, or a strong thigh, or a bouncy boob. But Paige angrily slaps your hands away each time you try and punishes you by squatting on you and clenching even harder, somehow. <i>“Don’t go getting comfortable on me, now,”</i> she taunts. <i>“When you win, you get to touch whatever you want, [pc.name], but until then, you’re</i> my <i>bitch, useful for nothing but a good reaming, got me?”</i>");

	output("\n\nThere’s nothing left you can do but grunt in frustration and lay there uselessly as Paige tortures your [pc.cock " + x + "]. <i>“Oh, don’t you grunt at me,”</i> she says, laying a pointed finger on your nose. <i>“You said it yourself, I’m a bombshell! You should be thanking me for the opportunity for some of</i> this,”</i> she says, slapping her own ass. You can feel the ripple through her body and across your spire.");

	output("\n\nPaige’s hand dips between her legs, playing with herself in front of you. Her pussy is engorged and puffy; her clit stands erect and swollen, especially as she pinches and plays with it. Her breathing starts to deepen as she rides you – thank heaven, she’s nearly done. <i>“You know what? That sounds like a good idea. I want you to thank me. Thank me for fucking my ass.”</i>");

	output("\n\nYour eyes trail to her bouncing hips, watching her move in time to the clapping of her heavy flesh against yours. Your own orgasm isn’t too far off, but you’re sort of dreading it. The last thing you need is to get bloated in her vicegrips.");
	output("\n\nPaige leans forward, her face directly in front of yours. <i>“Thank me!”</i> she demands, raising her voice. <i>“Thank me, [pc.name], or I’m not letting you go and we’re having another round!”</i>");
	output("\n\nHer ass pinches at your [pc.knotOrSheath " + x + "], cutting off its circulation and forcing back the bubbling cum just beneath. <i>“Thank you,”</i> you say lowly.");

	output("\n\nShe leans back and clenches harder, using her hands on her ass to press herself tighter. <i>“Try again. Say it like you mean it!”</i>");
	output("\n\n<i>“I said ‘thank you!’”</i> you bark. <i>“Thank you, Paige, for beating the shit out of me and fucking me with your ass. Thank you for making me think twice about challenging you; thank you for giving my dick rope-burns. Happy?”</i>");
	output("\n\nPaige leans forward, her hand working overtime on her pussy. <i>“Very,”</i> she answers as her quivering quim squirts her juices across your [pc.belly] and as high as your lower [pc.chest]. She grunts herself, jilling another squirting wave from herself, then a third; she doesn’t stop her bouncing the entire time. <i>“Cum, if you can,”</i> she tells you.");
	output("\n\nYou’re about ready to, despite the conflicting sensations Paige is inflicting on you. You tense as your orgasm starts rising up your loins – and then stops at your dick. You’re momentarily dazed at the total lack of a climax, despite it being right there, but then you realize: Paige’s inhuman grip on your shaft with her ass is stopping it, just beneath the surface. Without any circulation, including your vas deferens, there’s just nowhere for it to go.");
	output("\n\n<i>“Well?”</i> Paige gasps, working her way up to a third orgasm, her fingers, and much of your torso, soaked in her liquid love.");
	output("\n\n<i>“This would be easier if you’d–”</i>");
	output("\n\n<i>“Oh, is this my fault?”</i> she asks innocently, gasping out as her flow revitalizes for a third go. <i>“Sorry about that.”</i> She has no intent to ease her hold on you, even as her third orgasm winds down to nothing and she exhausts herself on top of you. <i>“Damn,”</i> she breathes, slouching on top of you but the ring of her sphincter remains pinched on you. <i>“Was it good for you too, stud?”</i>");
	output("\n\nYour body isn’t sure how to respond to this, and you’re starting to feel a sort of unsettling, mild panic descend on you as your orgasm is denied over the moments. <i>“I’d tell you if you’d just–”</i>");
	output("\n\nPaige hums in satisfaction, rolling her hips on you, enjoying the warmth of having a cock in her ass and her total control over your body. The burning and the stretching has stopped, thankfully enough, but the way your [pc.cum] lurches within you, wanting to escape but unable, submits you to a unique hell that you’re sure Paige thought of on the spot.");
	output("\n\nLong moments pass. You cross your eyes several times and chew on your bottom lip, trying in vain to do <i>anything</i> to alleviate the pressure in your loins, but nothing works. Finally, Paige, having had her fun, lifts herself off your body, letting the cool air of the room soothe your aching and steel-hard dick. <i>“Maybe now you</i> will <i>think twice about challenging me like that, [pc.name],”</i> she says casually as she picks up her clothing. <i>“Not if you’re not into this, that is.”</i>");
	output("\n\nYour hand immediately goes to your shaft, desperate to beat off, but Paige kicks you in the wrist each time you try. You’re forced to remain there as she dresses herself, satisfied with everything that’s transpired in this room. By the time she’s nearly dressed, your erection is flagging. <i>“Hopefully,”</i> she says as she slips her shirt on, fully-dressed and making for the door, <i>“this will incentivize you winning our fight next time. Maybe I’ll know what it’s like, huh?”</i>");
	output("\n\nYou’re left alone in the room, beaten and owned both physically and sexually. The dull ache of an impending orgasm has passed and you’re not hard enough anymore to get it out of you in a hurry. You grunt in defeat as you pull yourself to your feet for your own effects. You’re horribly backed up; if you went to Paige, she’d probably help you out, but you’re not sure if you’re willing to sell your dignity even lower than that. Once you’re dressed, you leave the room in a sour mood.");

	// end scene (scene: FFLA); increase Lust by 50; place PC one square outside of Paige’s Yoga Class or back to the ship’s main menu; inflict Sore and Blue Balls on the PC
	processTime(30);
	pc.changeLust(50);
	soreDebuff(3);
	if(!pc.hasStatusEffect("Blue Balls")) pc.applyBlueBalls();
	clearMenu();
	addButton(0,"Next",paigeExitWrapper);
}


// (scene: Fair Fight – Win)
// Action Tree: http://i.imgur.com/bUxVDtB.png
public function paigeSparringVictory():void
{
	clearOutput();
	showPaige(true);
	pc.removeStatusEffect("PAIGE_SPAR");
	flags["PAIGE_SPAR_RESULT"] = "win";
	IncrementFlag("PAIGE_SPAR_WINS");
	//showPaige(true);
	output("Despite her defeat, Paige wants you as badly as you want her, and she’s eager to fill the role of the submissive for you. It’s a quick formality until you’re both naked (Paige moving noticeably slower than you, still aching from the fight). You’re standing above Paige’s prone form, y");
	if(pc.hasCock()) output("our [pc.cocks] erect as could be, towering over your Ausar");
	if(pc.isHerm()) output(", and y");
	if(pc.hasVagina()) output("our [pc.vaginas] soaked and dripping down your leg, readying herself for Paige’s ‘punishment’");
	output(".");

	output("\n\nPaige licks her lips as she awaits your command. She splays her limbs on the floor, displaying her every asset for your benefit. <i>“I lost, [pc.name],”</i> she says huskily. She’s already dripping in antici");
	if(silly) output("......................");
	output("pation for you, but she makes no movements to touch herself. <i>“Fuck me like the bitch I am, you sexy</i> champion.”");

	output("\n\nYou smirk at your willing prize, already so eager for you. You have a couple of ideas on how you want to treat your willing plaything beneath you, and you wonder to yourself: just which option is best? The world that is Paige’s body is your oyster.");

	//[=Oral=][=Vaginal=][=Anal=]
	processTime(5);
	clearMenu();
	addButton(0,"Oral",FFWO,undefined,"Oral","What better way to assert yourself over Paige than to have her service you?");
	if((pc.hasCock() && pc.cockThatFits(paige.vaginalCapacity(0)) >= 0) || pc.hasVagina()) addButton(1,"Vaginal",FFWV,undefined,"Vaginal","Paige has already taken a beating; let’s see if she can take a pounding.");
	else if(pc.hasCock()) addDisabledButton(1,"Vaginal","Vaginal","Tab D is too big for slot P.");
	else addDisabledButton(1,"Vaginal","Vaginal","You need genitals to do this.");
	if(flags["PAIGE_ANAL"] != undefined)
	{
		if(pc.hasCock() && pc.cockThatFits(paige.analCapacity()) >= 0) addButton(2,"Anal",FFWA,undefined,"Anal","Knowing Paige, this would be a reward for her too. You’re okay with that.");
		else if(pc.hasCock()) addDisabledButton(2,"Anal","Anal","You’d split the poor girl in half with a dick your size! You’re in charge, but you’re not <i>cruel</i>.");
		else addDisabledButton(2,"Anal","Anal","Try as you might, you can’t fuck Paige’s butt if you don’t have anything to fuck her butt with!");
	}
	else addDisabledButton(2,"Anal","Anal","Despite playing the role of top, you’re not inconsiderate, and you don’t know how Paige would react to trying this with you. Maybe you should pitch it with her in a more relaxed, controlled setting, first.");
}

//[=Oral=]
// No requirements.
// Tooltip: What better way to assert yourself over Paige than to have her service you?
// (scene: FFWO)
public function FFWO():void
{
	clearOutput();
	showPaige(true);
	var args:Array = [];
	args.push("FFWO");
	// Continue here if the PC has a penis
	if(pc.hasCock())
	{
		output("You stroke your [pc.cock], keeping it hard as you consider your options. Paige is panting in exertion and lust, her tongue lolling out of her mouth like the thirsty mutt she really is. Hmm... maybe you have something that could quench her thirst.");
		//if (pc.isNaga = false)
		if(!pc.isNaga()) output("\n\nYou step forward, one foot on either side of her ribs, and fall to your knees");
		else output("\n\nYou slither forward and drape your [pc.legs] across her stomach, aligning your crotch with her face");
		output(". <i>“Open up,”</i> you say curtly; Paige does nothing to resist and opens her mouth, licking her lips for the meaty treat you’re about to give her.");

		output("\n\nYou inch forward, draping your [pc.cock] along her outstretched tongue and rubbing your length along it. You don’t thrust into her mouth and coat her tastebuds with the meaty tang of your cockflesh, letting her familiarize herself with it before you invade her throat. You tilt to one side, tracing along the inside of her cheek with your [pc.cockHead]. Paige obediently has her mouth open and waiting the whole time, although her tongue is hardly idle, wrapping and massaging as much as she can.");

		output("\n\n<i>“Get sucking,”</i> you command, placing your left hand on her head. She closes her mouth and quickly gets to work, bobbing her head up and down your length");
		if(pc.cLength(0) <= 11) output(", taking your entirety into her muzzle and gently lapping at everything stuffed inside");
		else output(", diving down as far as she can before your head finds her limit, leaving some of you exposed to the air");
		output(". She hums loudly for your benefit, trying to make it as enjoyable for you as she can.");
	}
	// Continue here if the PC has a vagina or is sexless
	else
	{
		output("You pet your [pc.crotch], keeping yourself ");
		if(pc.hasVagina()) output("wet");
		else output("hot");
		output(" as you consider your options. Paige is panting in exertion and lust, her tongue lolling out of her mouth like the thirsty mutt she really is. Hmm...");
		if(pc.hasVagina()) output(" maybe you have something that could quench her thirst.");

		if(!pc.isNaga()) output("\n\nYou step forward, one foot on either side of her ribs, and fall to your knees");
		else output("\n\nYou slither forward and drape your [pc.legs] across her stomach, aligning your crotch with her face");
		output(". <i>“Tongue out,”</i> you say curtly; Paige does nothing to resist and opens her mouth, licking her lips for the ");
		if(pc.hasVagina()) output("wet ");
		output("treat you’re about to give her.");

		output("\n\nYou place your left hand on Paige’s head and bring her the rest of the way to your ");
		if(pc.hasVagina()) output("dripping cunny");
		else output("blank crotch");
		output(". The flat of her tongue slaps against you");
		if(pc.hasVagina()) output("r labia");
		output(", staying there momentarily and soaking her tastebuds with your essence; without a word, she takes a long, lazy lick, ");
		if(pc.hasVagina()) output("from bottom to your [pc.clit]");
		else output("from the taint where your crotch ends and that begins");
		output(" to your [pc.belly], then backing away to start again. You quiver in pleasure as she goes");
		if(pc.hasVagina()) output(", noting how she’s avoiding penetrating you until you give the word");
		output(".");

		if(pc.hasVagina()) output("\n\n<i>“Get eating,”</i> you command, aligning her head to look up, so her tongue can properly enter you. Her lips form a tight seal around you as she does eagerly, spearing her long, flat Ausar tongue into your tunnel, as far as she can in one go.");
		else output("\n\n<i>“Get started,”</i> you command, mashing her nose against your pelvis for her to begin in earnest. Her lips form a tight seal around the flat flesh she finds there and begins eagerly, slathering your body with long licks of her lascivious Ausar tongue.");
		output(" She hums loudly for your benefit, trying to make it as enjoyable for you as she can.");
	}
	// Merge here
	output("\n\nYou exhale through your nose, enjoying your position over your submissive puppy. You thrust your [pc.hips] against her mouth");
	//if (pc.hasBalls = true)
	if(pc.balls > 0) output(", slapping her chin with your [pc.balls]");
	output("; she’s immediately into it. You could tell her as much, if you wanted – or you could try to fill the role of dominant and verbally put her in her place.");

	processTime(10);
	pc.changeLust(20);
	clearMenu();
	addButton(0,"Congratulate",FFWOC,args);
	addButton(1,"Berate",FFWOB,args);
	//[=Congratulate=][=Berate=]
	// end scene (scene: FFWO)
}

//[=Vaginal=]
// PC must have a gender.
// Tooltip: Paige has already taken a beating; let’s see if she can take a pounding.
//Fen note: let's make sure the dick can fit inside her if !pussy
// (scene: FFWV)
public function FFWV():void
{
	clearOutput();
	showPaige(true);
	var args:Array = [];
	args.push("FFWV");
	output("You fuck Paige’s body with her eyes: her panting mouth searching for something to quench its thirst; her heaving, firm, pert breasts, begging to be touched, groped, and mistreated; her tight stomach, each ab flexing through her fur; to the real prize: her wet cunt, seeping at the hope that you’ll give it what it wants. You can smell her from where you are: her position beneath you, beaten and begging for some rough fucking, is making her even hornier than usual.");

	// Continue here if the PC has a penis
	if(pc.hasCock() && pc.cockThatFits(paige.vaginalCapacity(0)) >= 0)
	{
		var x:int = pc.cockThatFits(paige.vaginalCapacity(0));
		if(x < 0) x = pc.smallestCockIndex();
		output("\n\n<i>“Raise your hips,”</i> you demand, and she does so without hesitation, excited for whatever you have planned for her. You drop to your knees, gripping your [pc.base " + x + "] and slapping your shaft against her wet pouch a couple times; the wet sound of flesh on flesh fills the room, and you enjoy the face Paige makes as every slap sends a little shock of pleasure up her back.");
		output("\n\nYou lean back and align your [pc.cockHead " + x + "], rubbing it between her mons delicately, kissing her lips with your rod. She mewls, her hips quivering, desperate to buck upward and swallow you but stopped by her own willpower. The sounds and motions she’s making delight you perversely, and, really, you could do this all day – but you want to fuck her almost as badly as she wants to be fucked.");
		output("\n\nYou thrust forward, sinking your length into her tunnel in one swift motion");
		if(pc.cLength(x) <= 11) 
		{
			output(", bottoming out in one swing");
			if(pc.balls > 0) output(", your [pc.balls] slapping against her ass in the swing");
		}
		//if (pc.cockLength >= 12)
		else 
		{
			output(", stopping just as you feel yourself reach as deep as she can take you");
			if(pc.balls > 0) output(", your [pc.balls] swatting at the air in the swing");
		}
		output(". <i>“Ah!”</i> Paige shouts in pleasure, her fingers clawing at the floor.");
		
		pc.cockChange();

		output("\n\nNow that you’re good and snug inside her, you there’s really only one thing left for it. Question is, now that you have Paige at her most vulnerable, how do you want to treat her?");
	}
	// Continue here if the PC has a vagina without a penis
	else
	{
		output("\n\n<i>“Spread your legs,”</i> you demand, and she does so without hesitation, excited for whatever you have planned for her. You drop to your knees, sliding a finger in between her labia and slapping her pussy with your palm; the wet sound of flesh on flesh fills the room, and you enjoy the face Paige makes as every slap sends a little shock of pleasure up her back.");
		output("\n\nYou lift her left leg over your shoulder and slide your [pc.crotch] up against her own until your hips collide with hers. She mewls, her hips quivering, desperate to buck upward and fuck you but stopped by her own willpower. The sounds and motions she’s making delight you perversely, and, really, you could do this all day – but you want to fuck her almost as badly as she wants to be fucked.");
		output("\n\nYou shift your [pc.hips] enough to make one full pass of her cooch against yours, your buttons pressing against each other and her fluids combining and dripping uselessly to the floor. <i>“Ah!”</i> Paige shouts in pleasure, her fingers clawing at the floor. You pause, keeping still and teasing her just a bit longer.");
		output("\n\nNow that you’re good and snug against her, you there’s really only one thing left for it. Question is, now that you have Paige at her most vulnerable, how do you want to treat her?");
	}
	//[=Gently=][=Roughly=]
	// end scene (scene: FFWV)
	processTime(5);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Gently",FFWVG,args);
	addButton(1,"Roughly",FFWVR,args);
}

//[=Anal=]
// PC must have a penis with an area of 50 or less.
// Display, but lock, this option if the PC has not yet had anal sex with Paige
// Tooltip (Too big): You’d split the poor girl in half with a dick your size! You’re in charge, but you’re not <i>cruel</i>.
// Tooltip (Just right): Knowing Paige, this would be a reward for her too. You’re okay with that.
// Tooltip (No dick at all): Try as you might, you can’t fuck Paige’s butt if you don’t have anything to fuck her butt with!
// Tooltip (Option is locked): Despite playing the role of top, you’re not inconsiderate, and you don’t know how Paige would react to trying this with you. Maybe you should pitch it with her in a more relaxed, controlled setting, first.
// (scene: FFWA)
public function FFWA():void
{
	clearOutput();
	showPaige(true);
	var args:Array = [];
	args.push("FFWA");
	
	var x:int = pc.cockThatFits(paige.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	
	output("You study your options, from Paige’s open and thirsty mouth to her quivering hips, horny enough to hump the first willing leg she finds like a mutt. You hum as you appreciate her form, everything from her taut muscles to her firm boobs, but there’s one real target that you want and it’s not in front of you – not yet, anyway.");
	output("\n\nYou stroke your [pc.cock " + x + "] idly, keeping it hard as can be. <i>“Flip over,”</i> you command, and Paige does so without hesitation, eager for whatever you have in mind for her. <i>“Raise your hips.”</i> She does so, wagging her tail reflexively as she bends her knees and presents herself to you.");
	output("\n\nYou kneel on one knee, tracing along her quim with one finger, teasing her into thinking you’re going to give it to her pussy doggy-style. You reach forward, flicking at her button, and slowly frig your way backward, coating your finger in her juices. You stop before finding her anus; you wipe your slick fingers along your [pc.cockHead " + x + "], using her personal lubricant as your own, and you slap her ass hard with your free hand. <i>“Nice,”</i> you congratulate, feeling how firm her butt is.");
	output("\n\nYou sidle forward, hotdogging yourself between her thighs to make sure you coat yourself, tip to base, with herself. It’s not as thorough a lube-job as you know you could get from her. You’re not going to get any harder and she’s not going to get any hornier, even though her cooch isn’t your goal. Still, if you wanted, you could delay the journey a bit longer so that Paige adequately <i>prepares</i> you for her.");

	//[=Get Ready=][=Raw=]
	// end scene (scene: FFWA)
	processTime(5);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Get Ready",FFWAGR,args);
	addButton(1,"Raw",FFWAR,args);
}

//[=Congratulate=]
// (scene: FFWOC)
public function FFWOC(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FFWOC");

	output("Just because you’re the top right now doesn’t mean you have to be an asshole. Who doesn’t like being told they’re doing a good job?");

	output("\n\n<i>“You put up a good fight today, Paige,”</i> you tell her, rocking your hips against her face");
	//if (pc.hasCock = true)
	if(pc.hasCock()) output(", sawing your length in and out of her mouth");
	output(". She hums in ascension, imploring you for more as she works you over, ");
	if(pc.hasCock()) output("her tongue slathering across your [pc.cock] from shaft to tip to base and back again, making sure no part of you is left dry and wanting.");
	else if(pc.hasVagina()) output("her tongue drilling into your tunnel, bloating and twisting inside you, making sure no muscle or nerve in your [pc.vagina] is left unattended to.");
	else output("her tongue bathing your [pc.crotch] dutifully, knowing that whatever she does to you is effective, even if there’s nothing there to appreciate.");

	output("\n\n<i>“I love strong women,”</i> you continue, casually pumping against her mouth. <i>“");
	if(pc.hasCock()) output("And I know how much you love cum, you little slut. In your throat, in your cooch, in your ass – wherever you can get it. Consider this a reward for such a good show");
	else 
	{
		output("You know, I kind of consider you to be a role model of sorts. You’re stronger than your average Ausar, for damn sure. Standing here, with your tongue ");
		if(pc.hasVagina()) output("in my cunt");
		else output("against my skin");
		output(", is as much a privilege for me as it is for you");
	}
	output(".”</i> She closes her eyes and hums, relaxing into her service and enjoying your words. The effect is what you’d hoped: ");
	if(pc.hasCock()) output("her technique changes from ardent sucking and licking to something gentler but nonetheless craving; while she’s a thirsty girl, she also wants to make it last");
	else 
	{
		output("her craving, searching tongue relaxes a bit and she takes longer, broader strokes ");
		if(pc.hasVagina()) output("inside");
		else output("against");
		output(" you");
		if(pc.hasVagina()) output(", collecting and savoring every drop of your [pc.girlCum] before lunging in for another mouthful");
	}
	output(".");
	output("\n\n<i>“Don’t tell me you threw the match on purpose, just so you could ");
	if(pc.hasCock()) output("suck me off");
	else output("eat me out");
	output("?”</i> you ask rhetorically. Paige shakes her head and hums negatively. <i>“Could have fooled me, you little natural. You’re going at it like this is what you’ve always wanted.”</i> You rub your hands through her hair lovingly as she tickles your every sensitive spot, making you quiver and buckle under his skill. <i>“Hah, you, it’s okay to like it, you know. If you like going down on me like this, we could always skip the fighting.”</i>");
	output("\n\nPaige’s technique doesn’t change. <i>“But then, I guess, that wouldn’t make it very rewarding for either of us, would it?”</i> you hum, lazily moving against her, tilting her head ");
	if(pc.hasCock()) 
	{
		output("until it’s level, then thrusting forward, shoving yourself into her");
		if(pc.cLength(0) >= 12) output(" until you hit her limit");
	}
	else output("upward, squatting your hips just slightly to force more of yourself onto her face");
	output(". <i>“It’s not like I can’t just walk up to you and ask you to fuck me already. Something about ‘proving’ ourselves to one-another makes it... sweeter, somehow, don’t you think?”</i>");

	output("\n\nPaige hums again. You’re running out of things to say, but you think Paige has gotten the idea by now. All that’s left is for her to finish her work on you. You could just leave her to it, but – you look over your shoulder, to Paige’s resting form underneath you. She has a cooch of her own that could use some attention.");

	//[=Enjoy It=][=Reciprocate=]
	// end scene (scene: FFWOC)
	processTime(5);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Enjoy It",FFWOEI,args);
	addButton(1,"Reciprocate",FFWOR,args);
}

//[=Berate=]
// (scene: FFWOB)
public function FFWOB(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Hey, you’re the top now. Why not take advantage of it? You know for a fact that Paige would use her position over you to the fullest, if the situation were reversed.");
	output("\n\n<i>“You really only have yourself to blame for being where you are,”</i> you say venomously, ");
	if(pc.hasCock()) output("withdrawing your [pc.cock] from her suckling mouth and slapping her in the cheek with it a few times");
	else output("grabbing her by the back of her head and meshing her mouth and nose harshly against your pelvis");
	output(". <i>“I was hoping for a bit more of a challenge from you, Paige. I’m actually disappointed.”</i>");
	output("\n\nPaige’s technique doesn’t flounder throughout your treatment, and in fact, from her deeper breathing and lashing tongue, she’s actually kind of into it. You try to choose your words ahead of time, so you don’t say anything truly hurtful, but luckily, you know you have a handful of leeway. <i>“Unless you threw the fight? I could see it; you’re a cum-thirsty ditz, whether or not you want to admit it. If this were just some elaborate way to get ");
	if(pc.hasCock()) output("a thick helping of dick");
	else 
	{
		output("a mouthful of [pc.race]");
		if(pc.hasVagina()) output("cunt");
		else output("crotch");
	}
	output(", I’d believe it.”</i>");
	
	output("\n\nPaige shakes her head and hums negatively, trying to reject your assumptions, even as she feverishly ");
	if(pc.hasCock()) output("sucks your dick like it’s the only meal she’s getting for the next week");
	else if(pc.hasVagina()) output("eats your cookie like it’s the only one in the universe, and it’s hers, for a fleeting moment");
	else output("munches on your [pc.crotch] as if you were a God and this would be the only chance she ever got");
	output(". The motions and the vibrations are pleasurable, and your hips quiver from what she’s doing to you, but you don’t let that show. <i>“Take me out of your mouth and</i> then <i>try to argue that, Paige. I bet you won’t.”</i>");

	output("\n\nTrue to your hunch, Paige remains where she is, ");
	if(pc.hasCock()) output("dutifully suckling on your meat");
	else 
	{
		output("tongue-deep ");
		if(pc.hasVagina()) output("in");
		else output("on");
		output(" your crotch");
	}
	output(". Her eyes are closed as she focuses on the sensations of you");
	if(!pc.hasGenitals()) output("r genitals");
	output(" in her mouth and the words you’re saying, despite their intensity. You stroke your fingers through her hair as she works on you. <i>“That’s what I thought. Good girl.”</i> You intentionally tone your words like you were speaking to a pet rather than an Ausar going down on you.");
	output("\n\nYou could keep thinking of things to say – Paige is clearly okay, and then some, with you being a rude dominant – but your mind goes blank as you focus on the sensation of her working you over. Suddenly, you’re struck with inspiration: why use words when actions work so much better?");

	processTime(5);
	pc.changeLust(10);
	//[=Reciprocate=][=Titfuck=]
	// end scene (scene: FFWOB)
	clearMenu();
	addButton(0,"Reciprocate",FFWOR,args);
	addButton(1,"Titfuck",FFWOTR,args);
}

//[=Gently=]
// (scene: FFWVG)
public function FFWVG(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FFWVG");
	output("You’re not totally convinced that the whole thing was a charade to see who would top whom, and what Paige really wanted was just a good ol’ fashioned fucking. You’re okay with that.");
	var x:int = -1;
	if(pc.hasCock() && pc.cockThatFits(paige.vaginalCapacity(0)) >= 0)
	{
		x = pc.cockThatFits(paige.vaginalCapacity(0));
		output("You grip onto Paige’s thighs for support and start to casually rail her; you withdraw until Paige is gripping onto your [pc.cockHead " + x + "], then you push yourself back in sensually, twisting your [pc.hips] a bit so she can really feel every fiber and vein on your shaft as you go in.");
	}
	else if(pc.hasVagina()) output("You grip onto Paige’s upraised leg for support and start to casually trib her; your upward strokes are lazy and elongated, making her wait for your downward stroke. You twist your [pc.hips] as you descend, so she can really feel every contour and nuance of your [pc.vagina] as you fuck her.");
	output(" She winces in delight, her body quivering, impatient but obedient for you.");

	output("\n\nYou settle into a rhythm; your body is a little tense from the awkward angle, but you’re getting what you both want. You watch your conquest from your higher angle, appreciating her form: you love the way her abs pop out when you push in and the way her biceps bulge when you bottom out inside her. You claw at her thighs to see her reaction. <i>“Gods,”</i> she whispers, biting her bottom lip in pleasure.");

	output("\n\nIt’s not quite as intimate as whenever you have sex on her bed, but the setting has certainly done something to you both: Paige is wetter");
	if(x >= 0) output(" and tighter");
	output(" for you than usual, and the way she’s moving her body off-time with yours – her hands above her head; her abdominals clenched; her hips moving to one side on the outswing and the other on the inswing – she’s clearly into this far more than you expected.");
	output("\n\nYou lean in closer to Paige, doubling over her body so you can talk to her nose-to-nose. You don’t dare stop your humping. <i>“Paige,”</i> you ask lowly, <i>“did you lose on purpose? Be honest.”</i>");
	output("\n\n<i>“I would never,”</i> she answers. From her tone and body language, she’s telling the truth.");
	output("\n\n<i>“So,”</i> you ask slowly, drawing a hand up to pinch her left nipple, <i>“you just like losing?”</i>");
	output("\n\nHer breath catches in her throat as she considers her answer. <i>“I like...,”</i> she struggles to say through the mounting pleasure in her pussy, <i>“I like it when you win. I like it when my tops... assert themselves.”</i>");
	output("\n\nIs that all? She likes it when her champions are a little more assertive? Well, that’s pretty easy to do.");

	processTime(5);
	pc.changeLust(10);
	//[=Kiss Her=][=Own Her=]
	// end scene (scene: FFWVG)
	clearMenu();
	addButton(0,"Kiss Her",FFWVKH,args);
	addButton(1,"Own Her",FFWVOH,args);
}

//[=Roughly=]
// (scene: FFWVR)
public function FFWVR(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FFWVR");
	output("Paige knew from the beginning what the reward was for winning – and, more importantly, what the cost was for losing. You’ve got a horny Ausar beneath you, legs spread, ready and willing for you to <i>claim</i> her as your own trophy for besting her. No sense in letting the opportunity go to waste.");
	var x:int = -1;
	if(pc.hasCock() && pc.cockThatFits(paige.vaginalCapacity(0)) >= 0)
	{
		x = pc.cockThatFits(paige.vaginalCapacity(0));
		output("\n\nYou start fucking Paige, <i>really</i> fucking her. You grip onto her thick thighs and you start pounding her tight cunt like it’s made you mad. You saw your [pc.cock " + x + "] in and out of her, ");
		//if (pc.cockLength <= 11)
		if(pc.cLength(x) <= 11) 
		{
			output("bottoming out with every push, crushing her pelvis with your own");
			if(pc.balls > 0) output(" and slapping her ass with your [pc.sack] on the inward swing");
		}
		else output("hitting her limit with every thrust, backing off only because you risk injuring each other if you go any deeper");
		output(". You’re horny and on an adrenaline rush from your hard-fought victory, and Paige is little more than a hole for you. She gambled her chastity, and she lost – this is what she gets.");
	}
	else if(pc.hasVagina())
	{
		output("\n\nYou start fucking Paige, <i>really</i> fucking her. You grip onto her strong leg and you start pounding her slick cunt like it exists for nothing else but what you’re doing to it right now. You trib your [pc.vagina] against her, assaulting her labia with your own and pounding your [pc.clit] against hers; your individual fluids quickly start to cascade between you. You’re horny and on an adrenaline rush from your hard-fought victory, and Paige is little more than a sex toy for you. She gambled her chastity, and she lost – this is what she gets.");
	}
	output("\n\nPaige’s breath catches in her throat as she willingly takes your hardcore pounding. Her eyes roll back into her head as you take her; her elbows collapse from beneath her, and she lays on her back, her hips supported only by you and your sexual ferocity. She realizes her place beneath you as a living, breathing");
	if(x >= 0) output(" condom; a tool for your pleasure; a place for you to keep your cream whenever you feel the need to shoot it.");
	else if(pc.hasVagina()) output(" sybian; a saddle for you to straddle and masturbate with; right now, she’s nothing more than an onahole with an opinion.");
	output(" Like a proper sub, she embraces it.");

	output("\n\n<i>“Yes,”</i> you hear her whisper to yourself as you have your way with her. You grunt once, and she shuts her mouth, knowing that you haven’t given her permission to say anything as you use her. But she doesn’t need to say anything to show you that she’s having the time of her life: the tense muscles, shortness of breath, and that telltale ‘I’m being fucked silly and I love it’ look on her face, complete with lolling tongue. Still, what does her pleasure mean to you right at this moment?");

	//[=Don’t Care=][=Own Her=]
	// end scene (scene: FFWVR)
	processTime(5);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Don’t Care",FFWVDC,args);
	addButton(1,"Own Her",FFWVOH,args);
}

//[=Get Ready=]
// (scene: FFWAGR)
public function FFWAGR(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FFWAGR");
	
	var x:int = pc.cockThatFits(paige.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	
	output("You hum has you fuck Paige’s closed thighs lazily, enjoying the firmness of her legs and the soft, fine fur against the shaft of your cock. But it’s not quite enough for you. <i>“Face me,”</i> you command as you withdraw from her. She complies, scurrying on her hands and knees until she is facing you. <i>“Get me ready,”</i> you also command.");
	output("\n\nShe’s on you without any hesitation, opening her mouth and slipping your [pc.cockHead " + x + "] into her mouth, toying with it a bit before dipping down and lathering your shaft. She moans in ascension as she tastes herself on you. You whisper her name as she goes, and her tail wags again, loving that she’s pleasuring you. <i>“You’ve got an amazing ass,”</i> you tell her. She moans with you at the compliment. <i>“I can’t wait to see my dick in it.”</i>");
	output("\n\nPaige dips lower, spurred by your promise, to get as much of your meat wet and ready as she can. She knows how much she likes it in the ass; this is a promise, not a punishment. She’s drooling on you, her saliva coursing down your [pc.cock " + x + "]");
	if(pc.balls > 0) output(" and pooling where your shaft meets your [pc.sack]");
	output("; the goal for her sloppy blowjob isn’t for pleasure, strictly speaking.");

	output("\n\n<i>“That’s enough,”</i> you say when you feel your pleasure mounting a little higher than you’d like. <i>“Show me your ass, girl.”</i> Paige yips in delight as she pivots back around, presenting herself to you the same way as before, tail high in the air. You suck your own finger a bit and brush it against her star, lubing it a bit on her end");
	//if {PC has seen SSAP3}
	if(flags["PAIGE_RIMMING"] == 3) output("; you’re tempted to return the favor and lube her <i>properly</i>, but you don’t trust that you’d spend all day back there if you do");
	output(".");

	output("\n\nWhen she’s ready, you shuffle on your knees, lining your [pc.cockHead " + x + "] up with her asshole. You’re just a thrust away from claiming her once more....");
	
	pc.cockChange();

	processTime(5);
	pc.changeLust(10);
	//[=Act Casual=][=Own Her=]
	// end scene (scene: FFWAGR)
	clearMenu();
	addButton(0,"Act Casual",FFWAAC,args);
	addButton(1,"Own Her",FFWAOH,args);
}
//[=Raw=]
// (scene: FFWAR)
public function FFWAR(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FFWAR");
	
	var x:int = pc.cockThatFits(paige.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	
	output("You clap both your hands onto Paige’s upturned rump. She shudders at the impact and melts when you massage her flanks, groping sensually at her muscles. You pull her cheeks apart and reveal your target to yourself. You’re hard as diamonds and Paige is so willing and pliant to your advances – you don’t wait another second.");
	output("\n\nYou shuffle forward a bit, positioning one leg up and against her thigh to keep her in place. You grip your [pc.cock " + x + "] just beneath its head and draw it against the tight star of her asshole, feeling her jump in surprise, clearly not expecting your direction, but she relaxes underneath you, obviously ready and willing. That’s all the signal you need: you thrust forward, stuffing your [pc.cockHead " + x + "] into her.");
	output("\n\nPaige lowers her head and moans into her arms, wiggling her butt in your direction to entice you to hurry up and bury more of your bone into your Ausar. She’s dry, and you haven’t been properly lubed up, but in a way, that kind of makes it better: the raw friction between you as you push into her, violating her with her consent, makes the pleasure between you two a little hotter, a little more real. From the way Paige is writhing beneath you the deeper you sink in, she agrees.");
	output("\n\nYou reach forward, gripping onto Paige by her hips, and you start to piston into her. You push in a little, then a little more, then stop and pull out to start again. <i>“Damn,”</i> you hear Paige whisper as your pattern goes by a little quicker, and then again. You watch her fingers claw at the floor whenever you rock your [pc.hips] to one side, and then her palms go in broad circles when you pull back.");
	output("\n\nOne last pattern, and you’ve bottomed out");
	if(pc.balls > 0) output(", your [pc.balls] resting gently against her vulva, tickled by the contact between you");
	output(".");
	
	pc.cockChange();
	
	output(" Paige sighs in delight and consigns herself to you, ready to take whatever you have planned for you. Which begs the question: just what <i>do</i> you have planned, now that you’re cock-deep in her ass?");

	processTime(5);
	pc.changeLust(10);
	//[=Own Her=][=Just Give ‘Er=]
	// end scene (scene: FFWAR)
	clearMenu();
	addButton(0,"Own Her",FFWAOH,args);
	addButton(1,"Just Give ‘Er",FFWAJGE,args);
}

//[=Enjoy It=]
// (scene: FFWOEI)
public function FFWOEI(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FFWOEI");
	output("Eh, fuck that. You’re the winner today; you just want to enjoy her skillful mouth on you as a reward. Besides, you reason to yourself, if you really feel bad about it later, you can always just eat her out in her unit.");
	output("\n\nYou tilt your head back and close your eyes in bliss, relishing in the sensations of having Paige go down on you. ");
	//if (pc.hasCock = true)
	if(pc.hasCock()) output("The way her tongue glides along the body of your [pc.cock], folding itself around its underside to massage your cum-tube; the way she masterfully uses the back of her tongue and her soft palette to flex the glans of your [pc.cockHead]; the way her lips trail and kiss along your shaft, petting them with gentle, almost fluffy caresses");
	else if(pc.hasVagina()) output("The way she constantly roves her lips in closed, but broad, circles around your vulva, tilting her head up so her lower lip reaches to your womanly taint and leaning in you kiss at your [pc.clit]; the way her tongue dives in, bloats, contorts and folds, then withdraws, bringing your [pc.girlCum] with it for her to drink before going in for more; the way she hums her own delight at her work, her vibrations massaging your tunnel in a new, erotic way");
	else output("The way she kisses and licks at your blank slate of a pelvis, appreciating it as thoroughly as she would if she had anything to play with; the way her hands roam over your body, clenching periodically at your [pc.ass] for your appreciation; the way she hums and moans like she’s got the real deal in her mouth");
	output(" – she’s really taken to the role of the submissive, eager for your pleasure and only half-minded-at-best of her own. You love it.");

	output("\n\nHer efforts slowly yield results on you, and you feel your orgasm build up inside you. ");
	if(pc.hasCock()) 
	{
		output("Your [pc.cum] bubbles and rises within you");
		if(pc.balls > 0) output("r [pc.balls]");
	}
	else if(pc.hasVagina()) output("The familiar churning within your tunnel builds up before making its way to your [pc.vagina]");
	else output("It’s unmistakable; even though you don’t have anything to cum with, it’s on its way");
	output(", ready to bring this confrontation with Paige to its inevitable, delicious end. You try to hold onto yourself for as long as you can –you kind of want to maintain your control on her a little longer. You know that once you’re done, you’re going to have to beat her in competition again if you want your respective positions, and you want this moment to last.");

	output("\n\n<i>“Slow down a bit,”</i> you instruct her. She whines – she wants you to cum almost as badly as you do – but she obeys, delaying her deliberations on you and taking to slower, broader motions on you");
	//if (pc.gender != 0)
	if(pc.hasGenitals()) output("r genitals");
	output(". You grab Paige by her hair, easing yourself against her face, your [pc.hips] moving in time with her mouth and her body. You bite your bottom [pc.lip], trying to tide yourself, but it’s getting harder over time.");

	output("\n\n<i>“Gonna cum,”</i> you warn her. She doesn’t change her strategy, waiting patiently for you");
	if(pc.hasGenitals())
	{
		output(" to ");
		if(pc.hasCock()) output("seed");
		else output("douse");
		output(" her mouth with your gift");
	}
	output(". <i>“You’re a good girl,”</i> you tell her. ");
	if(pc.hasGenitals()) output("<i>“A good, thirsty girl. Good, thirsty girls get rewards.”</i> You start pumping yourself against her, no longer willing to hold back. <i>“Get ready – it’s your favorite!”</i>");
	else output("<i>“You’re making me feel bad that I won’t have anything tasty to reward you with.”</i> Despite your words, you’re pumping against her face all the fiercer. <i>“Oh well. I’m sure you’ll survive.”</i>");

	processTime(5);
	pc.changeLust(10);
	//[=Climax=]
	// end scene (scene: FFWOEI); go to (scene: FFWOE)
	clearMenu();
	addButton(0,"Next",FFWOE,args);
}

//[=Reciprocate=]
// (scene: FFWOR)
public function FFWOR(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FFWOR");

	//if {FFWOC}
	if(InCollection("FFWOC", args)) output("Aw, hell, what kind of top would you be if you didn’t give Paige what she so obviously needs? Besides, she’s been a good girl, and you want to let her know that good girls get rewarded. <i>“Stop a second,”</i> you say, tapping her head – she complies and withdraws, whining, needing to go back to work. You disengage and pivot your hips, lifting one leg over, and then the other. <i>“Spread your legs.”</i> She stops whining immediately.");
	//if {FFWOB}
	if(InCollection("FFWOB", args)) output("You don’t <i>have</i> to do anything. You won the fight fair and square, and you <i>could</i> just leave Paige to deal with herself. But, you reason, Paige is being compliant enough to deserve a reward. <i>“Let me show you how it’s done, Paige,”</i> you say, grabbing her by the hair and yanking her off you. With a quick twist, you lift one knee over her, then the other, and you’re face-to-face with your own juicy Ausar treat.");

	output("\n\nFirst thing’s first, of course: you plop your [pc.hips] back onto her face, getting her back to work on you. ");
	if(pc.hasCock()) output("She slides up your [pc.cock] easily, resuming where she left off as if she hadn’t stopped");
	else if(pc.hasVagina()) output("She lunges back into you, her tongue jettisoning into your [pc.vagina] where it belongs, servicing you like she hadn’t stopped");
	else output("Her tongue is back on your [pc.crotch], tending to the wet, sensitive skin there and eating your imaginary genitals like they were real");
	output(". You rotate your hips a bit, getting her nice and snug between your legs, before falling forward, your [pc.chest] against her tight, sexy belly and your face against her cooch.");

	output("\n\nYou waste no time – your orgasm isn’t far off, and time is of the essence – and dive in: your [pc.lips] form a tight seal around Paige’s labia and your [pc.tongue] shoots deeply into her, spearing her to your tongue’s length. She’s wetter and tighter than you had realized! Already her Ausar juices are leaking down your chin and between your lips as you explore her tunnel, drinking up all the girlish cum and lubricant you find there");
	if(!pc.hasCock() && pc.hasVagina()) output(". You mimic her actions, bloating your tongue and twisting it before withdrawing for maximum effect");
	output(".");

	output("\n\nPaige’s body tenses beneath you, and she rumbles her throat in pleasure onto your genitals. Your pace is rather casual, enjoying the flavors and sensations and making the most of your time on her cunt, while Paige is borderline feverish, shivering beneath you with her orgasm coming up so quickly on her. Her fingers reach up and wrap themselves around the fat of your [pc.ass] as, rather suddenly, she cums a fountain in your mouth, squirting her feminine cum against your tongue and across the floor.");

	output("\n\nShe quakes in uncontrolled abandon, her body practically vibrating beneath you, and she does her best to keep from screaming into your [pc.crotch]. Not that you’d mind: you triggering her orgasm just brings your own to the forefront of your mind, and watching Paige bust her lady-nut all over the place inspires you to do the same....");

	//[=Climax=]
	// end scene (scene: FFWOR); go to (scene: FFWOE)
	processTime(5);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",FFWOE,args);
}

//[=Titfuck=]
// If the PC does not have a dick, change this button to [=Rimjob=]
// (scene: FFWOTR)
public function FFWOTR(args:Array):void
{
	clearOutput();
	showPaige(true);
	// Play from here if Paige is blowing the PC’s dick
	if(pc.hasCock())
	{
		output("You look down at Paige’s body as she works you over. She moves at the waist when she bobs on your [pc.cock] rather than at the neck, getting a fuller-body experience for her work, and it has the delightful side effect of making her tits jiggle whenever she hilts herself on the inward thrust. Damn, does she have some great tits: they aren’t so large that they’re overbearing, but they’re more than enough that they create a void in her cleavage that yearns to have something in it.");
		output("\n\n<i>“Stop,”</i> you command. She does so immediately, leaning back, panting like the bitch in heat she is for a cock to either service or to claim her. You’ll do neither. <i>“Lean back. Show me those tits of yours, Paige. Make it easy for me.”</i>");
		output("\n\nShe goes beyond your expectations: she scoots forward first, then stretches out her legs behind her, and then reaches for her own ankles, bending backwards and displaying the whole of her toned stomach and fleshy mounds with pointed nipples for caps. Her neck follows her back, forcing her to face away from you. <i>“Is this enough for you, Master?”</i>");
		output("\n\nYou like the sound of that. ‘Master Steele.’ You whisper it to yourself as you straddle her body, grabbing her breasts by the nipples, making her wince, and slapping your [pc.cock] in between them. <i>“That’s just right, babe.”</i>");
		output("\n\nYou get to work fucking Paige’s boobs, gripping each roughly in a strong hand and sawing yourself in between her fleshy mounds. Her fur is short and smooth; it’s an interesting sensation as it directs you nicely against her chest when you thrust forward, but fights back slightly when you pull back, tickling you. Her chest isn’t a warm, wet, active hole like her mouth was, but the pushy skin and tightness of her breasts against you are on a different level of pleasure.");
		output("\n\nHer body is rigid against your onslaught, and despite her contortion, she isn’t strained and her breathing is even throughout it all. She’s sturdy as could be as you pound her chest, fucking them like you both need it, bringing you closer and closer to that final edge. You withdraw to your [pc.cockHead], then push in to your [pc.cockBase], feeling her tits ripple through your hands with the force.");
		output("\n\nYou can’t hold on for much longer, and you tell Paige as much. You idly wonder where on her body you’re going to cum, but, just as you feel that familiar feeling surge up your [pc.cock], you figure worrying about it isn’t worth the effort.");
	}
	// Play from here if the PC does not have a penis
	else
	{
		output("Hmm. You don’t <i>have</i> to make Paige do this, but... hell, it’s a delightfully dominant attitude, and it’s perverse enough to really push you over the edge.");
		//if {SSAP3}
		if(flags["PAIGE_RIMMING"] == 3) output(" You should know, after all.");

		output("\n\n<i>“Stop,”</i> you command. She does so immediately, leaning back, panting like the bitch in heat she is ");
		if(pc.hasVagina()) output("for a cunt to either service or to claim her. You’ll do neither; y");
		else output(". Y");
		output("ou turn to face away from her and bend at the waist, spreading your [pc.ass] for Paige. <i>“Eat my ass.”</i>");

		output("\n\nIt’s a simple command that’s impossible to fuck up, but Paige is nonetheless hesitant. You try playing nice before pulling rank. <i>“This isn’t a punishment. You’re doing fine.”</i> You reach back and slap your left cheek, pulling it farther apart for her. <i>“I just want your tongue in my ass, is all.”</i>");

		output("\n\nYou think that maybe you’ll have to get a little louder to convince her, when you feel her hands on your [pc.ass], keeping you steady, and then you feel her attentive, eager tongue press against your [pc.asshole]. Your [pc.legs] buckle at the sudden pleasure as she laps and kisses at your star, and you feel her face bump and frame itself against the meat of your butt as she presses in to go deeper.");

		output("\n\nThe pleasure isn’t like having her ");
		if(pc.hasVagina()) output("in your [pc.vagina]");
		else output("against your [pc.crotch]");
		output("; the combination of it being inappropriate and taboo along with the confirmation that you <i>control</i> Paige, at least for now, makes her every press, her every dig into your butt, all the better for the orgasm that’s building inside you. At your command, Paige is gladly fucking your butt with her mouth, and that sort of power is just a little intoxicating. You can see how Paige would like being the top so much.");

		output("\n\nShe’s even getting into it: her hands trail up your flesh to lock at the small of your back, and Paige leans forward, putting herself into your body for support as the gentle smacks of her tongue against you fill your ears. She moans into you, the vibration reaching into your [pc.hips] and straight to your ");
		if(pc.hasVagina()) output("cunt");
		else output("crotch");
		output(". You find yourself wondering how you taste; whether you’ve pushed your rank too far; whether she’s really enjoying it or if she’s only playing the part; but those are all fleeting questions that are all shut up by another swipe of her tongue against you.");

		output("\n\nYour once-distant orgasm is right on top of you now. Your breath is short and your balance is a little rickety against Paige’s earnest administrations; your [pc.crotch] pulses in warning, ");
		if(pc.hasVagina()) output("your plump cunt-lips bloating for a cock to suck and milk");
		else output("your wet-and-now-lonely blank slate of flesh radiating, begging for tactile pressures to get you over that damnable edge");
		output(", but you can’t risk reaching back to help yourself for fear of losing your balance.");

		output("\n\nPaige, the good girl she is, hears your body’s cries loud and clear, and her right hand reaches down, beneath your [pc.asshole] to your wet ");
		if(pc.hasVagina()) output("treasure. You’re skewered on two of her fingers, which crook and thrust into you, and suddenly....");
		//if (pc.hasVagina = false)
		else output("skin. Her palm presses gently against you, rotating shallow circles on you, and suddenly....");
	}

	//[=Climax=]
	// end scene (scene: FFWOTR); go to (scene: FFWOE)
	processTime(5);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",FFWOE,args);
}

//[=Kiss Her=]
// (scene: FFWVKH)
public function FFWVKH(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Well, you certainly know one way to assert yourself, even as you’re already fucking Paige into the floor: already nose-to-nose and chest-to-[pc.chest], you close the gap and lock your [pc.lips] against hers. Her mouth is already open, and all you have to do is surge your [pc.tongue] forward to invade.");
	output("\n\nHer breath catches at first, and then she responds eagerly, slapping her long, flat Ausar tongue against yours, tasting your tip and scrawling her way into your mouth to count your teeth and massage your tastebuds. She sucks on your tongue before devouring it back down, and she twists her head to give your tongues a different angle to dance with.");
	output("\n\nYou don’t stop fucking her as you kiss, your [pc.hips] jackhammering into hers");
	var x:int = -1;
	if(pc.hasCock() && pc.cockThatFits(paige.vaginalCapacity(0)) >= 0) 
	{
		x = pc.cockThatFits(paige.vaginalCapacity(0));
		if(x < 0) x = pc.smallestCockIndex();
		output(", feeding her sloppy cunt your [pc.cock " + x + "] to the limit. The repeated squelching noises of her cunny sucking your dick are at odds with the repeated smacking of her mouth sucking your tongue; her tunnel grips you possessively while her mouth kisses you worshipfully, and you’re not sure which hole is thirstier");
		//if (pc.hasBalls = true)
		if(pc.balls > 0) output(". You hope it’s her cunt, because your [pc.balls] have quite the thirst-quencher lined up for her");
	}
	//if (pc.hasCock = false)[if (pc.hasVagina = true)
	else if(pc.hasVagina()) output(", your [pc.vagina] meshing and kissing hers much the same way your lips are locked up above. The room is filled with the wet sounds of exchanging fluids and the smell of a horny [pc.race] fucking a horny Ausar. Your [pc.hips] start to ache a bit from the constant force, but the pleasure is far too great to consider stopping; it’s unique sessions like these that you love being a woman and fucking another the way you know a woman loves being fucked");
	output(".");

	output("\n\nYou pull away from her, taking a deep breath while you can. You ask her if she’s close; she responds with a low gurgle and crossed eyes. That’s answer enough for you: you maintain your pace but with broader strokes, the crack of flesh reverberating off flesh growing louder and more intense as your individual climaxes draw nearer.");

	output("\n\nYou lean in and kiss her again, hungry for more of her sugar. It’s enough to put her over the edge, and she cums messily all over you; her tongue is in your mouth but remains still, Paige losing the cognizance to do much of anything. That’s okay with you, because you’re about to get just as dumb in the head and just as happy in the ");
	if(x >= 0) output("cock");
	else if(pc.hasVagina()) output("cunt");
	output(".");

	//[=Climax=]
	// end scene (scene: FFWVKH); go to (scene: FFWVE)
	processTime(5);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",FFWVE,args);
}

//[=Own Her=]
// (scene: FFWVOH)
public function FFWVOH(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FFWVOH");
	var x:int = pc.cockThatFits(paige.vaginalCapacity(0));
	if(!pc.hasCock()) x = -1;
	//if {FFWVG}
	if(InCollection("FFWVG", args)) output("She wants assertiveness? She’ll get assertiveness.\n\n");
	//if {FFWVR}
	if(InCollection("FFWVR", args)) output("She’s not here for her pleasure. She’s here for <i>yours.</i> Time to remind her of that.\n\n");

	output("Your hands travel down to her hips, locking her in place, and you fucking <i>rail</i> her with everything you’ve got. ");
	if(pc.hasCock() && x >= 0)
	{
		output("Your [pc.cock " + x + "] brutalizes her poor quim, hilting itself");
		if(pc.balls > 0) output(" to the [pc.balls]");
		output(" before withdrawing far enough to make Paige believe you might slip out, before starting it all over again");
	}
	else if(pc.hasVagina()) output("Your [pc.vagina] dominates her poor quim, slapping against her and bruising it and her powerful hips with every collision; you thrust high enough against her that you’re practically fucking her belly, and on the downswing, you bounce low enough to shake the floor");
	output(". Paige’s hands grip onto you tightly and she moans out, incapable of doing anything more.");

	output("\n\n<i>“You like... when I’m on top... do you?”</i> you ask her, stuttering between thrusts. You clench your teeth so that you don’t accidentally bite into your [pc.tongue] during your rocky motions. <i>“Maybe that’s wrong. Maybe... you like losing? You like... being the bottom</i> bitch?!”</i>");

	output("\n\nPaige exclaims her pleasure to the room, surrendering herself, mind and body, to your onslaught. When she breathes, it’s with long inhales and broken exhales. Her body clenches around you, from her shoulders to her ");
	if(x >= 0) output("tight pussy, eager and greedy for every single drop you can give it");
	else if(pc.hasVagina()) output("raised leg, both her thighs bulging as you rail her pussy with your own");
	output(". <i>“All I have to do!”</i> you shout. <i>“Is win a little fight... and then you’re nothing but a warm cunt! For me! For</i> me!”</i>");

	if(!pc.isAss()) output("\n\nYou’re getting a little intense, but you’re just playing a part for Paige, and it’s clearly working for her. And either way, you <i>are</i> getting to bust a nut, so there are no real losers here.");
	else output("\n\nYou don’t mean <i>every</i> word you say – Paige is a lot more to you than some warm hole. But the words come to you unbidden and unchallenged, and, luckily for you both, Paige <i>loves</i> it.");
	output(" She screams to the room as you feel");
	if(x >= 0) output(" her tight cunt grip you like a vice and ripple around your [pc.cock " + x + "], demanding in its own way your virility, specimen that you are, so she can make superior Ausar pups with your seed");
	else if(pc.hasVagina()) output(" her sloppy cunt leak its girlish cum all over your own [pc.vagina] and coating your thighs, submitting in its own way to your superiority and offering what it can in tribute to what it obviously the alpha between the two");
	else output(" her sloppy cunt leak its girlish cum all over your thighs");
	output(".");

	output("\n\nHer total sexual submission to you is sign enough to give her what she now desperately craves. Your orgasm comes up on you in a tidal wave, starting in your hips and moving outward, preparing to quench Paige and prove to the world who she belongs to.");

	//[=Climax=]
	// end scene (scene: FFWVOH); go to (scene: FFWVE)
	processTime(5);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",FFWVE,args);
}

//[=Don’t Care=]
// (scene: FFWVDC)
public function FFWVDC(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FFWVDC");
	output("Whatever; you’re only concerned with busting your own nut. Whatever pleasure Paige derives from it is accessory to your own.");
	output("\n\nYou maintain your pace, hips pumping against hers possessively. Paige writhes underneath your strong grip, your body moving in time with yours so that your ");
	var x:int = pc.cockThatFits(paige.vaginalCapacity(0));
	if(!pc.hasCock()) x = -1;
	if(pc.hasCock() && x >= 0) output("[pc.cock " + x + "] hits all the right nerves and hits just the right spots inside her body");
	else if(pc.hasVagina()) output("[pc.vagina] glides and connects with hers, her clit kissing your [pc.clit], and your shared lube making the experience all the smoother");
	output(". She moans wordlessly, her hands toying with her breasts for both your benefit.");

	output("\n\nFuck that, you realize; why let Paige play with herself when you got a pair of perfectly good hands? You swat at her wrists, and she lets go, freeing her chest for your groping palms; your fingers dig into her mounds, matting down her fur and pressing into her pointed nipples. You pull and massage them in alternating directions, rotating one boob clockwise and pulling the other up and down. You’re chaotic and directionless in your fervor to get off.");

	output("\n\nYou rut against her, ");
	if(pc.hasCock() && x >= 0) 
	{
		output("the familiar tingling in your [pc.cock " + x + "] starting to surge up from within you");
		if(pc.balls > 0) output("r [pc.balls], coinciding with the wet slapping they make against her ass on every thrust");
	}
	else if(pc.hasVagina()) output("the building rush of an orgasm puffing your [pc.vagina], ready to douse your Ausar beneath you");
	output(". You lean forward, removing one hand from a boob and replacing it with your [pc.lips], suckling on the nipple hidden beneath her short fur, nibbling it gently with your front teeth even as you pound into Paige down below.");

	output("\n\nPaige’s noises rise in pitch every second thrust, until her moans become yips and then barely-restrained shouts. You feel her body tense, and then a blast of warm liquid coats your [pc.crotch], proving to you just how much she’s appreciating the careless attitude of yours; how she, from time to time, enjoys being the inferior to someone like yourself. Maybe she even threw the match between you two.");

	output("\n\nHer pleasure is accessory to your own: like a good sex toy, her orgasm helps bring about your own. Her squeezing, tensing, and squirting beneath you is enough to respond in kind.");

	//[=Climax=]
	// end scene (scene: FFWVDC); go to (scene: FFWVE)
	processTime(5);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",FFWVE,args);
}

//[=Act Casual=]
// (scene: FFWAAC)
public function FFWAAC(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FFWAAC");
	
	var x:int = pc.cockThatFits(paige.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	
	output("With one motion, you’re inside her. Just the tip first; you ease yourself in, her hole puckering open at your insistence, then you pause to let her adjust to you. Then you slide a bit farther forward; you hear her wince, not in pain, and grumble when you stop after just a few centimeters. You know what she’s capable of taking, and your slower pace is almost strictly just to tease her.");

	output("\n\nYou finally bottom out");
	//if (pc.hasBalls = true)
	if(pc.balls > 0) output(", your [pc.balls] resting gently against her untouched cooch, warmed by her heat and moistened by her excitement");
	output(". You sigh to yourself, enjoying the warmth of Paige’s body surrounding your [pc.cock " + x + "] and the tightness of her insides. Paige restlessly shifts her lower body, trying to get you started. You agree wordlessly, withdrawing a whole lot faster than when you pushed in, and you start fucking her butt properly.");

	output("\n\nYou feel the ripple of Paige’s ass-flesh through your hands with every impact, and she starts bouncing back against you with every thrust inward. The sounds of your body clapping against hers fill the room, joining the symphony that is her ragged, whining breath");
	if(pc.balls > 0) output(", your [pc.sack] whapping her in the cunt with every push");
	output(", and the sound of her claws on the floor as she clenches her hands in pleasure.");

	output("\n\nYou maintain your pace for a while, with no changes in intensity or earnest. You <i>could</i> have played up to the role of the dominant champion a little better, but really, all the reward you need is already wrapped around your dick, and you’re just enjoying your time with your Ausar. There’s no rush; no hot-headed power-plays; just the feel of her warm, welcoming body contorting around your shaft, eagerly showing you in and reluctant to let you go with each cycle. Paige’s head rests gently on her arms as she relaxes into the rhythm you’ve settled between you both, falling into the same casual attitude as you over time.");

	output("\n\nThe minutes pass by, and your orgasm starts to come up on you. You hear – and feel, through her body – Paige masturbate herself beneath you as you rail her, bringing herself closer to that edge, and based on her breathing, she’s very nearly there. You stop your pace just for a moment, leaning over Paige, your hand trailing along her tail and scratching at its underside, near the base, while you kiss at her neck.");
	output("\n\nIt’s more than enough, and Paige tenses beneath you, groaning out your name. You hear the dripping of her cum against the floor and you feel her tightening against your body. It’d be rude, you rationalize, not to join her....");

	//[=Climax=]
	// end scene (scene: FFWAAC); go to (scene: FFWAE)
	processTime(5);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",FFWAE,args);
}

//[=Own Her=]
// (scene: FFWAOH)
public function FFWAOH(args:Array):void
{
	clearOutput();
	showPaige(true);
	
	var x:int = pc.cockThatFits(paige.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	
	output("It’s not enough to take her ass. It’s not enough that you’ve beaten her and you’re about to fuck her in the backdoor, leaving her cooch unattended and cold. ");
	//if {FFWAGR}
	if(InCollection("FFWAGR", args)) output("It’s not enough that you made her slobber all over you to get you ready for her anal violation");
	//if {FFWAR}
	else if(InCollection("FFWAR", args)) output("It’s not enough that you’re already inside her, completely raw, with no preparation or warning");
	output(". She has to <i>know.</i> You have to <i>tell her.</i>");

	output("\n\nYour hand reaches down and yanks at the base of her tail; you align your fingers to her underside, scratching at her weakest erogenous zone, making sure she’s putty in your hands. <i>“This is because you lost, you know,”</i> you tell her, accentuating yourself with a hard pump of the [pc.hips], your body clapping against hers loudly, her flesh rippling up her tight, toned booty to her lower back. <i>“Here you are, on the dirty floor, getting railed in the ass. If only you could have won a simple sparring match, Paige.”</i>");

	output("\n\nYour other hand goes to her shoulder blades, pressing down on them and keeping her in place as you fuck her. She whimpers beneath you, her ass high and her head low, taking it all. Your every stroke of your fingers against her tail has her shudder in resignation, and her tongue is lolling from her mouth in pleasure as you take what is yours.");

	output("\n\n<i>“I know how much you enjoy taking it up the ass, Paige,”</i> you say, your thrusting increasing in power as your orgasm approaches. <i>“I know this is as much a reward for you as it is for me. I want you to thank me.”</i>");

	output("\n\nPaige mumbles some words, then draws her tongue back in. <i>“Thank you!”</i> she says clearly.");
	output("\n\n<i>“Thank me for beating you up and shoving my fucking meat into your ass.”</i>");
	output("\n\n<i>“Thank you!”</i> Her body is trembling, tensing around your [pc.cock " + x + "], obviously very close herself.");
	output("\n\n<i>“Ask me to do it again when you lose our next match.”</i>");
	output("\n\n<i>“Please,”</i> she stutters, unable to maintain her balance underneath you. Her shoulders twist to one side, lying on her cheek as you bone her butt. <i>“Please fuck... please fuhhhh....”</i>");
	output("\n\nThat’s all you get from her when you feel her warm, womanly ejaculate burst from her pussy, soaking your [pc.thighs] as low as your knees");
	if(pc.balls > 0) output(" and as high as your [pc.sack]");
	output(". The dripping sound of her leaking onto the floor nicely matches the tempo of you pounding her ass, and her ass clenches around your [pc.cock " + x + "], her confused body desperately searching for cum to fill any yawning void it can.");

	output("\n\n<i>“We’ll work on that later,”</i> you say as you stop denying your own body its pleasure. With one more thrust, you’re at the limit, and your [pc.cum] starts its short journey from your body to hers.");

	processTime(5);
	pc.changeLust(10);
	//[=Climax=]
	// end scene (scene: FFWAOH); go to (scene: FFWAE)
	clearMenu();
	addButton(0,"Next",FFWAE,args);
}

//[=Just Give ‘Er=]
// (scene: FFWAJGE)
public function FFWAJGE(args:Array):void
{
	clearOutput();
	showPaige(true);
	
	var x:int = pc.cockThatFits(paige.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	
	output("Well, you’re hip-deep in Paige’s butt already. What’s left to do? You’re not gonna tease her, you’re already all the way in. There’s nothing left for it but to <i>absolutely ruin her.</i>");
	output("\n\nYou lock your hands onto her pelvis, making sure she’s anchored solidly to you, and then you slowly withdraw until just the [pc.cockHead " + x + "] is in – and then you fuck her like you were a custom-built machine, made for fuckin’ butts, satisfaction guaranteed. The room is filled with the sound of your [pc.hips] battering against hers");
	if(pc.balls > 0) output(" and your [pc.sack] swinging up to slap her in the pussy], her flesh shaking from the point of impact before her muscles dissolve the ripples. You accidentally snort as you take a deep breath, sounding like a wild, rutting animal with only one thing in mind.");
	output("\n\n<i>“Ah!”</i> Paige says each time you lock yourself dick-deep into her. You lean forward, using your hands to lift Paige’s rear for more leverage, letting gravity help with your thrusts. You slap her ass once, hard enough for the crack to echo off the walls. Paige’s tunnel barely has the time to hold onto you, to keep you from pulling out, before you’re out and back in.");
	output("\n\n<i>“Holy shit,”</i> Paige manages to gasp out, astonished by your animalistic plowing into her tight ass. The same hand that slapped her reaches for her tail, grasping it by the base and giving it a sharp tug, making sure her body stays in position. You know she’s not strained by the unconventional position – this is crap compared to her yoga – so you don’t take any precautions when it comes to pushing her around to better take your cock.");
	output("\n\nPaige groans lowly, and you feel her body spasm beneath your rabid pounding. You feel a hot wetness cascade down your [pc.legs]");
	if(pc.balls > 0) output(" and across your [pc.balls] with each thrust in");
	output("; Paige must have cum, satiated with your abuse. Somewhere in your head, you’re proud of yourself that you managed to please your woman, but the primal, lizard-like part of your brain is concerned only with your own pleasure. It just so <i>happens</i> that the feelings, sounds, and scents that come about with Paige’s orgasm helps in bringing yours around....");

	processTime(5);
	pc.changeLust(10);
	//[=Climax=]
	// end scene (scene: FFWAJGE); go to (scene: FFWAE)
	clearMenu();
	addButton(0,"Next",FFWAE,args);
}

// (scene: FFWOE)
public function FFWOE(args:Array):void
{
	clearOutput();
	showPaige(true);
	output("Your body clenches tightly, every muscle buckling down as your orgasm comes up on you. ");
	//if {FFWOEI}
	if(InCollection("FFWOEI", args)) output("You tap on Paige’s head, letting her know that you’re there, and she speeds up her work, eager to taste you.");
	//if {FFWOR}
	if(InCollection("FFWOR", args)) output("You tap on Paige’s knee, letting her know that you’re there, and she speeds up her work, eager to taste you.");
	//if {FFWOTR}
	if(InCollection("FFWOTR", args)) output("You grunt out to the air. <i>“Paige,”</i> you say gruffly, but then you don’t finish your sentence. She’ll figure it out on her own.");

	// Continue here if the PC is male
	if(pc.hasCock())
	{
		output("\n\nYour [pc.cock] bloats, your cum shooting up your tube ");
		//if {not FFWOTR}
		if(!InCollection("FFWOTR", args)) 
		{
			output("and into Paige’s eager mouth. ");
			if(pc.cumQ() <= 300) output("She easily gulps down your load, taking the time to swish It around in her cheeks before swallowing it down and accepting the rest of you. You provide her with as much as you can, fucking her mouth with your [pc.hips] slapping into her chin, and she takes it all easily and gladly");
			else output("She takes the first load in her mouth, surprised at first by your quantity, and struggles to swallow it down before the next load is halfway across her mouth already. Her throat works overtime, taking every shot of your [pc.cum] like a champion cocksucker, but no matter what she does, more than a little bit leaks from her cheeks");
			output(".");
			//if {FFWOR}
			if(InCollection("FFWOR", args))
			{
				output("\n\nPaige’s orgasm is only fueled further by your own, splashing yet more of her Ausar cunt-juice into your mouth and down your chin, quenching you much the same way you’re feeding her. Her every audible gulp is subsumed by another gush down at her pussy, providing a feedback loop that lasts as long as you do.");
			}
		}
		//if {FFWOTR}
		else
		{
			output(" and into the air above Paige. ");
			if(pc.cumQ() <= 300) output("You paint her chest and neck with your [pc.cum], giving her a proper pearl necklace, fucking her tits throughout your entire orgasm. When the first load subsides and the second is on its way, you thrust between her cleavage and clamp them tighter against your flesh, pushing out another few dollops for her collection.");
			else output("Your [pc.cum] arcs through the air with quantity and force, coming down in a huge splash that covers Paige from her tits, to her neck and chin, and definitely across her chin, face, and hair, even though you can’t see them. And that’s just the first load: your second comes just as powerfully, and with it, you thrust deeper into her cleavage, squeezing her tits a little too painfully (you’re sure), soaking her further and burying her upper torso in your spunk, but you’re still not done....");
		}
	}
	// Continue here if the PC is female
	else if(pc.hasVagina())
	{
		output("\n\nYour [pc.vagina] puffs, your [pc.girlCum] bursting from you in a gushing flood ");
		//if {not FFWOTR}
		if(!InCollection("FFWOTR", args)) 
		{
			output("and into Paige’s eager mouth. You fuck her face, your [pc.hips] rolling back and forth, baptizing her tongue and mouth with your fluids, following the wriggling tongue still locked into your tunnel. Paige hums in concentration, breathing through her nose as she sucks you down, focused on not drowning in your ambrosia.");
			//if {FFWOR}
			if(InCollection("FFWOR", args)) output(" Paige’s orgasm is only fueled further by your own, splashing yet more of her Ausar cunt-juice into your mouth and down your chin, quenching you much the same way you’re quenching her. Her every audible gulp is subsumed by another gush down at her pussy, providing a feedback loop that lasts as long as you do.");
		}
		//if {FFWOTR}
		else output("and down Paige’s neck, spraying onto her boobs, her face preoccupied with your [pc.asshole] to pay much attention. You hum to yourself as she works you through the whole thing, her tongue drilling and twisting inside your ass while your [pc.vagina] sprays its girly load all over her body. She doesn’t seem to mind, and in fact, your orgasm inspires her to keep going, covering as much of you as she can, inside and out, with her tongue and lips until your orgasm hits its end. Which is going to be a bit of a ways away....");
	}
	// Continue here if the PC is sexless
	else
	{
		output("\n\nYou grunt, feeling a warmth bloom from your [pc.crotch] as Paige continues her work loyally. The sensation you have – a heat that originates from between your legs, then hits every part of your body, from your scalp to your [pc.feet] – is exactly what you remember an orgasm to be, despite your lack of ejaculate, masculine or feminine. Paige doesn’t stop ");
		//if {not FFWOTR}
		if(!InCollection("FFWOTR", args)) output("bathing your crotch");
		//if {FFWOTR}
		else output("eating your [pc.asshole]");
		output(" the entire time, knowing, even if she doesn’t understand it, that what she’s doing is having an effect.");
		//if {FFWOR}
		if(InCollection("FFWOR", args)) output(" Paige’s orgasm is only fueled further by your own, splashing yet more of her Ausar cunt-juice into your mouth and down your chin. Her every audible moan is subsumed by another gush down at her pussy, providing a feedback loop that lasts as long as you do.");
	}
	// Merge here
	output("\n\nYou slump, knees shaking, as you come down from your orgasmic high. ");
	//if {not FFWOTR}
	if(!InCollection("FFWOTR", args)) output("Paige keeps working you over, but at a much slower, relaxed pace, winding herself down and enjoying the afterglow between you two. Her attention grows lazy and broad as she pulls herself out of her sexual reverie, until her eyes un-cross and she’s sensate enough to disengage from you.");
	//if {FFWOTR}
	else 
	{
		output("Paige lets go of her ankles and straightens herself up, covered in your jizz");
		//if (pc.cumQuantity >= 300)
		if(pc.cumQ() >= 300) output(" and then some");
		output(", but she doesn’t seem to mind; she reaches up to her neck, dragging a finger across a thicker pool of your spunk, before sticking out her tongue and laying her finger across it.");
	}
	//if (pc.hasCock = false)
	if(!pc.hasCock()) output("Paige gives your asshole once last kiss, then starts giving lazier kisses along the meat of your [pc.ass] as she slowly works her way up, towards your [pc.tail]. Her tongue is out, trailing long lines in between her kisses, until she finds the small of your back and stops.");

	output("\n\n<i>“Did your girl do good?”</i> Paige asks you innocently");
	//if {FFWOTR}
	if(InCollection("FFWOTR", args))
	{
		if(pc.hasCock()) output(", still dripping with your [pc.cum] and offhandedly still cleaning herself, one finger-full at a time");
	}
	output(".");

	output("\n\nYou take a moment to catch your breath before responding. <i>“Yeah,”</i> you answer finally, your satiated [pc.crotch] cooling down from the activity. <i>“You’re my good Ausar girl, Paige.”</i>");

	output("\n\nPaige mmm’s to herself, licking her lips exaggeratingly. <i>“I’m glad to hear that.”</i> She pulls herself to her feet, wobbling and achy – despite the entertainment, she’s still beaten and bruised from your fight. <i>“I’ll have to hurry up and beat you back, so I can know what it’s like to be the top with a hungry mouth to feed.”</i> She’s lopsided as she reaches for her effects. <i>“But, uh... some other day. I gotta... I gotta lie down.”</i>");

	output("\n\nYou agree wholeheartedly.");

	processTime(5);
	pc.changeLust(10);
	//[=Next=]
	// end scene (scene: FFWOE); reduce Lust to 0; place PC one square outside Paige’s Yoga Class, or put them in the ship’s main menu
	pc.orgasm();
	
	output("\n\n");
	clearMenu();
	addButton(0,"Next",paigeExitWrapper);
}

// (scene: FFWVE)
public function FFWVE(args:Array):void
{
	clearOutput();
	showPaige(true);
	args.push("FFWVE");
	var x:int = pc.cockThatFits(paige.vaginalCapacity(0));
	if(!pc.hasCock()) x = -1;
	output("Your abject humping against Paige’s delicious, strong body grows ragged and lopsided as your orgasm quickly overtakes you, ");
	if(pc.hasCock()) output("your [pc.cum] rushing up your dick, eager to seed your Ausar lover right here and now");
	//if (pc.hasCock = false)
	else output("your [pc.girlCum] building up inside you, ready to gush forward and paint your Ausar lover’s own cunt");
	output(". <i>“I’m nearly there,”</i> you warn her.");

	output("\n\n<i>“H-Hurry!”</i> she answers, her orgasm already well underway. You don’t need to be asked twice.");

	if(pc.hasCock() && x >= 0)
	{
		output("\n\nYour [pc.cock " + x +"] bloats in her tunnel with your [pc.cum] until it hits your tip and explodes inside her. ");
		//if (pc.cumQuantity <= 299)
		if(pc.cumQ() <= 300) output("You grunt out as your first load paints her insides white, and Paige moans your name as she feels it seep into her. She flexes her tunnel and her abs, milking you for more, voracious for as much of your [pc.race] seed as she can get, and you’re more than willing to oblige; your second burst is as quantified as the first, and your orgasm only begins to taper by the third.");
		else output("You sigh in delight as the first burst detonates inside her tunnel, your massive load bursting like a bubble inside her. Paige grunts in surprise at the sensation, but then coos and tenses herself around your shaft, thirsty for more of your heavenly [pc.race] cum, greedy for it to bloat her until she can’t hold any more.");
		output(" By the time you’ve got nothing left");
		if(pc.balls > 0) output(" in your drained, happy balls");
		output(", Paige is humming delightfully to herself in post-orgasmic bliss, idly sucking the last of you through the last remnants of her own orgasm.");
	}
	//if (pc.hasCock = false)[if (pc.hasVagina = true)
	else if(pc.hasVagina()) output("\n\nYour [pc.vagina] puffs and bloats with sexual energy as your [pc.girlCum] washes from you in torrents, adding to the mess your Ausar has already started. The liquid heat between you gets messier and expansive as you fuck Paige, spreading it all as high as your [pc.belly], and this is only the first wave; you don’t dare stop your rocking as the second comings thundering out of you, messing you both up even further. Only by the third does the strength and longevity of your orgasm begin to taper, but that doesn’t stop you for reaching for a fourth.");

	output("\n\nYour motions continue for another few moments as you both relax into a casual pace, riding out your pleasures until all that’s left is satisfaction. You sigh through your nose, drinking in Paige’s form one more time: her powerful, toned body, melted into a puddle of happy Ausar beneath you, twitching in different places now and again in post-orgasmic pleasure.");
	output("\n\n<i>“Holy hell, sweet thing,”</i> Paige finally says, pulling herself up. You agree. <i>“I couldn’t have asked for a better punishment for losing. Gods, I’m going to be walking funny for weeks.”</i>");
	output("\n\nPaige disengages from you");
	if(pc.hasCock() && x >= 0) output(", cum leaking out of her beaten-yet-happy cunt");
	output(" – then winces, easing herself onto her back after a moment. <i>“Oh yeah,”</i> she laughs, apparently having forgotten that she had lost a fight to get here. <i>“For more than one reason, I guess. I’ll have to win our next fight; I can’t</i> wait <i>to know what it’s like to be on top.”</i>");

	output("\n\nYou pull yourself up, reaching for your effects to redress. Paige, however, doesn’t move. <i>“I’ll, uh,”</i> she stutters, waving you off. <i>“I’ll still be a minute. I got a ton of aches, and not all of them are the good kind.”</i>");
	output("\n\nYou understand, and, as a show of compassion, move her articles closer to her so she doesn’t have to reach for them. <i>“Thanks, sweet thing.”</i>");

	//[=Next=]
	// end scene (scene: FFWVE); reduce Lust to 0; place PC one square outside Paige’s Yoga Class, or put them in the ship’s main menu
	processTime(5);
	pc.orgasm();
	output("\n\n");
	clearMenu();
	addButton(0,"Next",paigeExitWrapper);
}

// (scene: FFWAE)
public function FFWAE(args:Array):void
{
	clearOutput();
	showPaige(true);
	
	var x:int = pc.cockThatFits(paige.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	
	output("Paige is tensing and cumming her brains out underneath you, absorbed into herself and her own little, blitzed-by-anal-sex world as you do her. Her body clenches hard onto your [pc.cock " + x + "], thirsty for its reward; you just need a few more pumps and you’ll give it to her.");
	output("\n\nYou hilt yourself ");
	if(pc.balls > 0) output("to your [pc.balls]");
	output(" and stay there as you feel your [pc.cum] inflate your cock inside her, pushing her muscles to the side to make room for your bloating load. ");
	if(pc.cumQ() <= 300) output("Your jizz flows in bursts into Paige’s upturned rump and then drizzles deeply into her body, spreading its warmth from her butt to her lower belly. Your first load is followed by two more, dutifully seeding her ass, giving her thirsty hole what it begged of you. You continue pumping through it all, through shorter, static thrusts, timing your push in with another burst, and Paige giggles deliriously through each one.");
	//if (pc.cumQuantity >= 300)
	else output("You explode inside Paige; the first bubble of cum blasts through your cock and slams deep into Paige’s ass, sticking to her every muscle and flowing into her upturned rump, gravity taking it as deep as her lower stomach, and that’s only the first load. You pack her fuller and fuller of your jizz, giving her body exactly what it was begging for; you continue fucking her, your thrusts far more restrained, but your inward pushes accentuated with another hot, sticky gift. By the time you start to calm down, Paige is practically gravid, and yet you don’t hear her moan in discomfort.");

	output("\n\nYou two stay that way for a while. Your [pc.cock " + x + "], still hard at the moment, has no more cum to provide but doesn’t quite want to leave the warm socket that is Paige’s ass, and Paige’s clenching ass doesn’t want your dick to leave it. You knead at her flesh, squeezing her rump a few times, milking your cock and the moment as long as you can, until you inevitably grow soft and slip from her, despite both your efforts.");

	output("\n\nPaige collapses onto the floor");
	if(pc.cumQ() >= 300) output(", your [pc.cum] dribbling from her used pucker");
	output(". She lies still, panting and exhausted: whenever she moves a muscle, she winces, reminded of exactly how your session came to be in the first place. <i>“Wow,”</i> Paige says dumbly. She has a smile on her face from one Ausar ear to the other, satisfied beyond words after having been fucked so thoroughly.");

	output("\n\n<i>“You sure know how to make a loser feel loved,”</i> she slurs – her lips are too tired to make proper enunciations. <i>“I’ll have to try and remember to return the favor when I win next time.”</i> You laugh: you’re looking forward to the challenge, and its outcome, already.");

	output("\n\nYou stand, reaching for your effects and become presentable once more. Realizing how beaten Paige is – in body, from the fight, and, well, in her ass, after getting saddled with a dick like yours – you bring her own things to her so she doesn’t have to crawl her battered body to them. <i>“Thanks, sweet thing. You’re so considerate.”</i>");

	output("\n\nStill, she doesn’t move. <i>“I’ll, uh, just be another minute or two,”</i> she waves at you. <i>“I’m going to be walking a bit funny for a while yet. Don’t wait up for me.”</i>");

	output("\n\nOn her encouragement, you leave her there, well-fucked and on the floor. She’ll be fine, you’re sure.");

	//[=Next=]
	// end scene (scene: FFWAE); reduce Lust to 0; place PC one square outside Paige’s Yoga Class, or put them in the ship’s main menu
	processTime(5);
	pc.orgasm();
	output("\n\n");
	clearMenu();
	addButton(0,"Next",paigeExitWrapper);
}