/* ‘Kay Sera, Sera */

/*

Vanilla Flags:
FUCKED SERA						If Sexed before
TIMES_RODE_BY_SERA				Times She Rode You
SERA_STUCK_IT_ALL_IN_BUTT		Times She Stuffed Your Ass with Dicks
SERA FUCKED PCS TAILCUNT		Times She Fucked Your Tail Cunt
SERA_URETHRA_TAILFUCKS			Times She Tail-Fucked Your Urethra
SAEN_X_SERA_THREESOME			Sera has fucked Saendra before

New Flags:
PURCHASED_FROM_SERA				Purchased an item from her store
SERA_TRIPLE_X_RATED				Expansion activated
SERA_CREATE_VAG					Sera has created a vagina on you before
SERA_INCH_STEALING_SEX			Times She Absorbed Your Length
SERA_INCH_STEALING_HELP			Times Helped Her Tail
SERA_EXHIBITION_BLOWJOB			Times She Gave You a Public Blowjob
SERA_IN_JARDI_THREESOME			Times Sexed in Threesome with Jardi
SERA_FACE_RIDE_TRAINING			Times She Trained You in Face Riding
SERA_TIT_FUCK_LUCKY_DIP			Times Titfuck or Lucky Dip

SERA_TAILED						Times Sera fucked the tail-cockvine
SERA_TONGUE_FUCKED				Times Sera tonguefucked you during salary collection
SERA_MILKINGS					Times Sera milked you
SERA_PUNISH_FIX				Times Sera punished you
*/

public function seraIsMistress():Boolean
{
	return (flags["SERA_TRIPLE_X_RATED"] != undefined && flags["SERA_TRIPLE_X_RATED"] >= 4);
}
public function seenSerasDungeon():Boolean
{
	if(flags["SERA_MILKINGS"] != undefined) return true;
	if(flags["SERA_PUNISH_FIX"] != undefined) return true;
	return false;
}
public function seraExitToMain():void
{
	pc.removeStatusEffect("Temporary Nudity Cheat");
	pc.removeStatusEffect("Genital Slit Reveal");
	if(pc.getStatusTooltip("Armor Slot Disabled").indexOf("Sera") != -1) pc.removeStatusEffect("Armor Slot Disabled");
	mainGameMenu();
}

// Specialist mods?
// Get this stuff without kissing demon butt
// (available in main menu after you have bought/sold first time)
public function seraSexXXXTFModsCheck():Boolean
{
	var numUnlocked:int = 0;
	
	if(flags["SERA_UNLOCK_CLIPPEX"] != undefined) numUnlocked++;
	if(flags["SERA_UNLOCK_SEMENS"] != undefined) numUnlocked++;
	if(flags["SERA_UNLOCK_LUCIFIER"] != undefined) numUnlocked++;
	
	if(numUnlocked >= 3) return true;
	return false;
}
public function seraSexXXXTFModsAsk():void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	
	output("<i>“Do you have anything that’s a bit more...”</i> You want to say “interesting”. <i>“...exotic?”</i>");
	
	// PC has submitted
	if(seraIsMistress())
	{
		output("\n\n<i>“Of course I do silly,”</i> Sera smiles lazily. <i>“Some modder I would be if I didn’t. Why, are you interested?”</i>");
		output("\n\n<i>“Yes mistress,”</i> you say, politely. Sera’s leer widens.");
		output("\n\n<i>“Hmm. I think you’ll have to earn a look at them, pet. Be obedient, get on your");
		if(pc.hasKnees()) output(" knees");
		else output(" kneel");
		output(" down and open that pretty mouth of yours enough times, and who knows how I’ll reward you...”</i> she finishes on a tuneful, teasing note. You struggle not to roll your eyes.");
		processTime(2);
	}
	// PC has not submitted 
	else
	{
		output("\n\nSera eyes you beadily.");
		output("\n\n<i>“Maybe I do and maybe I don’t, fly [pc.boy]. Maybe you’re a U.G.C. jobsworth who’s come out here to lay down some new regulations on fringe mods, and wants to see if I’ve got some first so [pc.he] can fine me. It’s happened before. So why would I show you anything?”</i>");
		if(pc.IQ() >= 75 || pc.credits > 90000)
		{
			// PC intelligence 75%:
			if(pc.IQ() >= 75)
			{
				output("\n\n<i>“If I were a U.G.C. official I could have pulled you up on about a dozen things in here if I wanted to,”</i> you say, sounding bored. <i>“Not least you throwing something at my head when I first came in. Now you’re refusing to show me whatever passes as your specialist stock after complaining about your competitor taking away your business? Guess I’ll go across the way and see what she’s got to offer.”</i>");
			}
			// Lodes emone:
			else
			{
				output("\n\n<i>“Here.”</i> You casually tap up a credit chit and clatter it onto the counter.");
				output("\n\nSera reluctantly picks it up and looks at the amount it contains. She’s got a decent poker face, but her inhuman eyes go slightly rounder as she does so. <i>“I’m in the mood to lay down some serious dough on gene mods,”</i> you go on breezily. <i>“I was thinking of doing it here. However your attitude is making me think I should take my bank balance elsewhere.”</i>");
			}
			output("\n\n<i>“Alright! Jeez. Just don’t tell anyone with a badge where you’ve got this stuff.”</i> The succubus hurriedly taps into her touch screen. Three new items appear in the buy menu. <i>“One does stuff to your tits. One does stuff to your balls. One will make you look like me. I’m going to assume you aren’t so stupid I have to tell you which is which. Don’t expect me to sell any of it cheap,”</i> she finishes with a scowl. <i>“Not easy sourcing shit like this out here.”</i>");
			
			flags["SERA_UNLOCK_CLIPPEX"] = 1;
			flags["SERA_UNLOCK_SEMENS"] = 1;
			flags["SERA_UNLOCK_LUCIFIER"] = 1;
			processTime(4);
		}
		// Neither:
		else 
		{
			output("\n\n<i>“This is a mod shop!”</i> you snap angrily. <i>“Show me your goddamn mods!”</i>");
			output("\n\n<i>“Stick to the fem-pops, sweetheart,”</i> Sera sneers. <i>“You need to mellow out some. If I had a top shelf I wouldn’t be showing it to some " + (isAprilFools() ? "dogecoin" : "credit") + "-less slack-jawed colony hick who shuttled in here yesterday, I can tell you that.”</i>");
			processTime(2);
		}
	}
	
	clearMenu();
	addButton(0, "Next", seraMenu);
}

public function letSeraFuckYouXXXpac(response:String = "no"):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	
	var cockIndex:int = 0;
	var biggestLength:Number = -1;
	if(pc.hasCock())
	{
		cockIndex = pc.biggestCockIndex();
		biggestLength = pc.cocks[cockIndex].cLength();
	}
	
	if(response == "yes")
	{
		pc.lust(50 + rand(51));
		
		//If PC has 12 inch or bigger penis 
		if(flags["SERA_TRIPLE_X_RATED"] == undefined && pc.hasCock() && pc.biggestCockLength() >= 12)
		{
			output("<i>“Yes,”</i> you say, trying to keep your voice level. <i>“I’d be interested in that.”</i>");
			output("\n\n<i>“Mmm, I bet,”</i> says Sera, smiling... or at least displaying her teeth. Her soft palm moves up and down your [pc.cock " + cockIndex + "] slowly, easing then contracting as she breathes out, long and low, in your ear. You open your mouth as you become fully erect, slowly but inexorably... then you gasp and tense up as she suddenly stops, ruthlessly tightening her grip. <i>“But </i>this<i> isn’t acceptable,”</i> she goes on smoothly. <i>“I can’t be having any bitch of mine swinging around a dick bigger than my own. Status thing, and it doesn’t suit you anyway. So if you’re interested in me, you’re gonna have to prove it. Shrink that ugly piece of meat down, then maybe we’ll talk.”</i> She holds on for a moment longer before blessedly releasing, taking the razor sharp claws poking into your thigh with her. The succubus steps back to the counter, ass bouncing ever-so-slightly, and calmly goes back to filing her nails as if nothing happened.");
			
			processTime(2);
			flags["SERA_TRIPLE_X_RATED"] = 0;
		}
		//Subsequent “sex” if PC has shrunk below 12 inches
		else if(flags["SERA_TRIPLE_X_RATED"] == 0 && pc.hasCock() && pc.biggestCockLength() < 12)
		{
			output("Haltingly, you tell Sera you have done as she asked. She looks at you uncomprehendingly for a moment, and then wicked delight spreads across her face.");
			if(pc.isCrotchExposed())
			{
				output("\n\n<i>“Let me see,”</i> she commands. Feeling deeply embarrassed, you");
				if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
				{
					output(" part your genital slit and");
					pc.createStatusEffect("Genital Slit Reveal");
				}
				output(" flourish your [pc.cock " + cockIndex + "]. It is inescapably forlorn in comparison to how it used to look.");
			}
			else
			{
				output("\n\n<i>“Take your stuff off,”</i> she commands. <i>“Let me see.”</i> Feeling deeply embarrassed, you shuffle out of your [pc.lowerGarments]");
				if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
				{
					output(", part your genital slit");
					pc.createStatusEffect("Genital Slit Reveal");
				}
				output(" and display your [pc.cock " + cockIndex + "]. It’s rather forlorn in comparison to how it used to look.");
				pc.createStatusEffect("Temporary Nudity Cheat");
			}
			output("\n\n<i>“Oh. My. God,”</i> glees the succubus, balling her fists, leering from ear to ear. <i>“I can’t believe you actually did it! I said do and you actually did...”</i> she’s actually getting hard looking at you. She grasps her own shaft, rubbing it almost subconsciously as she stares into your eyes. <i>“How does it feel now? More sensitive? Is it harder to resist cumming? Did you think about me as you shrank it? Did you whisper “mistress” as your pride disappeared, bit by bit? Do you like how it looks in comparison to mine now, all cute and sissy-like?”</i> You don’t know how to respond to this deluge of questions and you feel a shaky, hot emotion at the way she is openly masturbating at what she’s made you do: somewhere between deep shame and naked lust. It intensifies as she gets up and strides over to you, deliberately pushing her fiercely erect foot long shaft into your tumescent [pc.cock " + cockIndex + "]. You stare into her fierce, round face, heart thumping.");
			output("\n\n<i>“You’ve proven yourself to me, my new pet,”</i> she breathes, her eyes half-slitted, almost post-coital. She runs a finger down your cheek, the softness of her pad followed closely by the scrape of her nail. <i>“So next time you’re feeling frisky, you");
			if(pc.hasKnees()) output(" get on your [pc.knees]");
			else output(" crouch down");
			output(", call me “mistress”, and we’ll see where it goes.”</i>");
			
			processTime(3);
			flags["SERA_TRIPLE_X_RATED"] = 1;
		}
		//Subsequent “sex” if PC straight up got rid of their penis(es): 
		else if(flags["SERA_TRIPLE_X_RATED"] == 0 && !pc.hasCock())
		{
			output("Haltingly, you tell Sera you have done as she asked. She looks at you uncomprehending for a moment, and then wicked delight spreads across her face.");
			output("\n\n<i>“This?”</i> she gestures at you. <i>“You did this for me? Oh. My. God.”</i> The succubus glees, balling her fists, before controlling herself long enough to adopt a commanding tone.");
			if(!pc.isCrotchExposed())
			{
				output("\n\n<i>“Take your stuff off. Let me see.”</i> Feeling deeply embarrassed, you shuffle out of your [pc.lowerGarments]");
				if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
				{
					output(", part your genital slit");
					pc.createStatusEffect("Genital Slit Reveal");
				}
				output(" and display your");
				pc.createStatusEffect("Temporary Nudity Cheat");
			}
			else
			{
				output("\n\n<i>“Show me.”</i> Feeling deeply embarrassed you");
				if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
				{
					output(" part your genital slit and");
					pc.createStatusEffect("Genital Slit Reveal");
				}
				output(" display your");
			}
			if(pc.hasVagina()) output(" [pc.vaginas].");
			else output(" featureless mound.");
			output("\n\n<i>“I can’t believe you completely got rid of it. I said do and you actually did... more than that, made yourself into a cute little slut/butt slut/cunt boy just for me,”</i> she breathes. She’s actually getting hard looking at you. She grasps her shaft, rubbing it almost subconsciously as she stares into your eyes.");
			output("\n\n<i>“What does it feel like, knowing you’re always going to be the bitch from now on? Knowing the only way you’ll cum is by taking it, hard and deep? Do you like the way every big male and herm looks at you now? Did you think about me as you shrank it? Did you whisper “mistress” as your pride disappeared, bit by bit? How does my dick make you feel now? Make you want to bend over my counter even worse, huh?”</i> You don’t know how to respond to this deluge of questions and you feel a shaky, hot emotion at the way she is openly masturbating at what she’s made you do: somewhere between deep shame and naked lust. It intensifies as she gets up and strides over to you, deliberately pushing her fiercely erect foot long shaft into your stomach");
			if(pc.hasVagina()) output(", the base of it pressing into your [pc.clits]");
			output(". You stare into her fierce, round face, heart thumping.");
			output("\n\n<i>“You certainly proved yourself to me, my new pet,”</i> she breathes, her eyes half-slitted, almost post-coital. She runs a finger down your cheek, the softness of her pad followed closely by the scrape of her nail. <i>“So next time you’re feeling frisky, you");
			if(pc.hasKnees()) output(" get on your [pc.knees]");
			else output(" crouch down");
			output(", call me “mistress”, and we’ll see where this goes.”</i>");
			
			processTime(3);
			flags["SERA_TRIPLE_X_RATED"] = 2;
		}
		//If PC grows beyond 12 inches after unlocking further scenes 
		else if(pc.hasCock() && pc.biggestCockLength() >= 12)
		{
			output("Sera glowers at you as you obediently kneel in front of her, her pretty face twisted up as she considers you, as if she can smell something unpleasant.");
			if(!pc.isCrotchExposed())
			{
				output("\n\n<i>“Take your pants off,”</i> she commands. Slowly you get up and do as she asks,");
				if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
				{
					output(" parting your genital slit and");
					pc.createStatusEffect("Genital Slit Reveal");
				}
				output(" eventually allowing your [pc.cock " + cockIndex + "] to flop out into the walnut scented air. You and it quail under the succubus’s withering glare.");
				pc.createStatusEffect("Temporary Nudity Cheat");
			}
			if(flags["SERA_INCH_STEAL"] == undefined)
			{
				output("\n\n<i>“");
				//PC shrank themselves before:
				if(flags["SERA_TRIPLE_X_RATED"] == 1) output("So you’ve overgrown your cock again,”</i> she says softly. The tension in her face and flared nostrils suggest she’s angrier now than you’ve ever known. <i>“Despite the fact I specifically told you not to.");
				else if(flags["SERA_TRIPLE_X_RATED"] == 2) output("So you went and grown a new cock... and made it monstrously ugly to boot,”</i> she says softly. The tension in her face and flared nostrils suggest she’s angrier now than you’ve ever known. <i>“Despite the fact I specifically told you why that wouldn’t be ideal for you.");
				else output("Are you just fucking with me?”</i> she says sharply, glaring at your [pc.cock " + cockIndex + "] with disgust. The tension in her face and flared nostrils suggest she’s extremely pissed off. <i>“Despite the fact I specifically told you to shrink that monster down, you have the gall to come strolling into my shop thinking you’re all large-and-in-charge.");
				output(" Do you know how ridiculous you look? An obedient slut like you swinging around an elephant trunk like that, probably imagining themselves the biggest alpha in the jungle instead of a stupid little [pc.boy] who’s gotten into daddy’s things. I guess this means you aren’t interested in this relationship anymore,”</i> she goes on calmly, examining her nails. <i>“That can be the only reason why you would disobey me so flagrantly.”</i>");
				
				processTime(3);
				flags["SERA_TRIPLE_X_RATED"] = -1;
			}
			else 
			{
				output("\n\n<i>“You just never learn, do you?”</i> Sera says in anger, flicking the tip of her foot on your [pc.cock " + cockIndex + "]. <i>“You’re supposed to be my bitch, not some fat penis slug... If you’re still interested in doing this, I’ll have to force that trouser serpent of yours down to size, especially if you’re not going to do it yourself. Got it?”</i>");
				
				processTime(1);
				clearMenu();
				addButton(0, "Yes Shrink", letSeraFuckYouXXXpac, "yes shrink", "Accept", "Allow Sera to shrink your [pc.cock " + cockIndex + "].");
				addButton(1, "Got It", letSeraFuckYouXXXpac, "don't show me", "Refuse", "Tell her you’ve got this covered.");
				addButton(2, "Never Mind", seraInchStealing, "nevermind", "Never Mind", "Actually, you’d rather not at this time....");
				if(seraIsMistress()) addDisabledButton(3, "Don’t Care", "Not Interested", "You really don’t have the power to tell her off now that you’re committed to her being your Mistress.");
				else if(pc.WQ() >= 50) addButton(3, "Don’t Care", letSeraFuckYouXXXpac, "not interested", "Not Interested", "Tell her you are not putting up with her attitude anymore.");
				else addDisabledButton(3, "Don’t Care", "Not Interested", "You really don’t have the willpower to tell her off....");
				return;
			}
		}
		//PC Does Not Have 12” Inch or more cock
		else
		{
			output("<i>“Yes,”</i> you say, trying to keep your voice level. <i>“I’d be interested in that.”</i>");
			output("\n\n<i>“Mmm, I bet,”</i> says Sera, smiling...or at least displaying her teeth.");
			if(pc.hasGenitals())
			{
				if(!pc.isCrotchExposed())
				{
					output(" In an instant, she undoes your [pc.lowerGarments] to get at your [pc.groin].");
					pc.createStatusEffect("Temporary Nudity Cheat");
				}
				if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
				{
					output(" Finding your genital slit, she carefully parts it.");
					pc.createStatusEffect("Genital Slit Reveal");
				}
				if(pc.hasCock()) output(" Her soft palm moves up and down your [pc.cock " + cockIndex + "] slowly, easing then contracting");
				else output(" Her finger-pad moves slowly around your [pc.clit], gently cresting it now and then");
				output(" as she breathes out, long and low, in your ear.");
			}
			else output(" She breathes out, long and low, in your ear.");
			output(" <i>“And you’re a flavor of meat I happen to like. A nice cute " + pc.mfn("bitch boi", "girl slut", "manslut") + " who knows [pc.his] place. Or do you?”</i> You’ve gotten so into the expert movement of her fingers this last bit, asked in a tone of genuine enquiry, catches you by surprise.");
			output("\n\n<i>“I... yes, I do.”</i> You respond. Sera’s nails dig into your skin as she grips your jaw and makes you gaze into her impassive expression.");
			output("\n\n<i>“Mistress.”</i>");
			output("\n\n<i>“Mistress. Yes I do, mistress.”</i>");
			output("\n\n<i>“Hmm,”</i> says Sera coolly. <i>“I think you’re gonna have to prove it.”</i>");
			if(pc.hasGenitals())
			{
				output(" Your urgently");
				if(pc.hasCock()) output(" erect cock");
				else output(" beading pussy");
				output(" practically cries out in exasperation as she pulls her hand away");
			}
			output(".");
			output("\n\n<i>“Kneel.”</i> You do it straight away, gazing up at the perfectly formed purple demon and her idly bobbing cock; you can guess what comes next. But contrary to your expectations, she turns around and bends over slightly. You are faced with her perky, round bottom.");
			output("\n\n<i>“Kiss it,”</i> she says. You can tell from her tone she’s trying not to laugh. <i>“Kiss my ass, if you really know your place.”</i>");
			
			processTime(4);
			flags["SERA_TRIPLE_X_RATED"] = 3;
		}
		
		clearMenu();
		if(flags["SERA_TRIPLE_X_RATED"] < 0)
		{
			addButton(0, "Interested", letSeraFuckYouXXXpac, "interested", "Interested", "Tell her you are still interested.");
			if(seraIsMistress()) addDisabledButton(3, "Don’t Care", "Not Interested", "You really don’t have the power to tell her off now that you’re committed to her being your Mistress.");
			else if(pc.WQ() >= 50) addButton(1, "Don’t Care", letSeraFuckYouXXXpac, "not interested", "Not Interested", "Tell her you are not putting up with her attitude anymore.");
			else addDisabledButton(1, "Don’t Care", "Not Interested", "You really don’t have the willpower to tell her off....");
		}
		else if(flags["SERA_TRIPLE_X_RATED"] == 3)
		{
			addButton(0, "Kiss", letSeraFuckYouXXXpac, "kiss", "Kiss", "Obey your mistress and give her a smooch on her booty.");
			addButton(1, "Perform", letSeraFuckYouXXXpac, "perform", "Perform", "Surprise your mistress with a little more than what she’s asking for.");
		}
		else addButton(0, "Next", seraExitToMain);
	}
	else if(response == "no")
	{
		output("You take a deep breath and then step backwards, ripping away from the succubus’s hand.");
		output("\n\n<i>“I’m sorry, I - ”</i>");
		output("\n\n<i>“Whatever.”</i> Sera turns back to the counter with a flick of the horn, wholly unconcerned. <i>“I’ve got no time for cowards. You want to bend over that desk for me go ahead any time, but don’t ever imagine I’m giving you a cum enema because I’m interested in you.”</i> She returns to her nail file as if nothing happened.");
		processTime(1);
		clearMenu();
		addButton(0, "Next", seraSexMenu);
	}
	else if(response == "not interested")
	{
		output("You feel deep resentment at the frankly pathetic way she’s treating you.");
		output("\n\n<i>“I’m keeping this just the way it is,”</i> you say, gripping your [pc.cock " + cockIndex + "] protectively. <i>“And if you can’t handle that, that’s your problem.”</i>");
		output("\n\n<i>“Whatever,”</i> replies Sera. She looks at you with slitted yellow disdain one last time before returning to her file and magazine. <i>“If you think I’m going to play kiss-chase with a disobedient " + pc.mf("bastard", "bitch") + " you’ve got another thing coming. Good luck using that thing. You’re going to need it.”</i>");
		
		//Sex/interactions other than mercantile disabled
		flags["SERA_NO_SEX"] = 1;
		
		processTime(1);
		clearMenu();
		addButton(0, "Next", seraExitToMain);
	}
	else if(response == "interested")
	{
		output("<i>“No! No, look, it was a mistake,”</i> you say. <i>“I didn’t mean it. I was trying some new modifications, and then...”</i> You trail off as she stares at you balefully for a couple of long moments.");
		output("\n\n<i>“Hmm. Well, I know you have difficulty controlling the impulse to put things in your mouth,”</i> she says, lips twitching slightly. <i>“But it’s not good enough, slut. You are going to shrink it down before we do anything again. Understood?”</i>");
		output("\n\n<i>“Yes mistress,”</i> you say, relieved. She continues to consider you for a while longer, that smirk continuing to tease at her mouth.");
		output("\n\n<i>“I have a way of doing it,”</i> she murmurs eventually. <i>“Slightly unorthodox, but since you’ve shown a willingness to mend your ways...”</i>");
		
		// [Show me] [No]
		clearMenu();
		addButton(0, "Show Me", letSeraFuckYouXXXpac, "show me", "Accept", "Tell her you want to see what she has in store.");
		addButton(1, "No", letSeraFuckYouXXXpac, "don't show me", "Refuse", "Tell her you’ve got this covered.");
	}
	else if(response == "don't show me")
	{
		output("<i>“Thank you mistress,”</i> you say nervously. <i>“But I will do it myself.”</i>");
		output("\n\n<i>“See that you do.”</i> She turns away with a flick of the tail.");
		
		//Sex/Talk disabled until biggestcock < 12”
		flags["SERA_NO_SEX"] = -1;
		
		processTime(1);
		clearMenu();
		addButton(0, "Next", seraExitToMain);
	}
	else if(response == "show me")
	{
		//First time PC overgrew:
		if(flags["SERA_INCH_STEAL"] == undefined)
		{
			output("<i>“I’m going to be lenient with you,”</i> she says softly. She doesn’t look lenient. She looks extremely angry. She strides forward and grabs your [pc.cock " + cockIndex + "] hard. <i>“Because you’re a good slut who can’t help needing a firm hand to guide them from time to time. This - </i>this<i> isn’t acceptable,”</i> she goes on smoothly, clenching her grip up around your manhood, almost hard enough to be painful.");
			if(flags["SERA_TRIPLE_X_RATED"] == undefined || flags["SERA_TRIPLE_X_RATED"] > 0) output(" <i>“I can’t be having any bitch of mine swinging around a dick bigger than my own. Status thing, and it doesn’t suit you anyway. So you are going to let me shrink it down to a size more befitting you. Capiche?”</i>");
			processTime(1);
			clearMenu();
			addButton(0, "Yes", letSeraFuckYouXXXpac, "yes shrink", "Yes", "Agree to shrink your penis.");
			addButton(1, "No", letSeraFuckYouXXXpac, "no shrink", "No", "Refusing her offer this far may piss her off.");
		}
		// Inch Stealing
		else seraInchStealingIntro();
	}
	else if(response == "no shrink")
	{
		output("You feel deep resentment over the frankly pathetic way she’s treating you. You look her steadily in the eye.");
		output("\n\n<i>“Take your hand the fuck off what doesn’t belong to you.”</i>");
		output("\n\nSera lets go. She looks at you with yellow-slit disdain one last time before returning to her file and magazine. <i>“If you think I’m going to play kiss-chase with a disobedient " + pc.mf("bastard", "bitch") + " you’ve got another think coming. Good luck using that thing. You’re going to need it.”</i>");
		
		//Sex/interactions other than mercantile disabled
		flags["SERA_NO_SEX"] = 1;
		
		processTime(1);
		clearMenu();
		addButton(0, "Next", seraExitToMain);
	}
	else if(response == "yes shrink")
	{
		output("<i>“I understand, mistress,”</i> you say tentatively. <i>“I will do as you ask.”</i> She keeps ahold of your [pc.cock " + cockIndex + "] for a while longer, staring into your [pc.eyes], a smile twitching the corners of her cerulean mouth.");
		processTime(1);
		clearMenu();
		addButton(0, "Next", seraInchStealingIntro);
	}
	else if(response == "kiss")
	{
		output("Well, you’ve come this far... and it’s not the ugliest thing you’ve ever faced. After a moment’s pause, you awkwardly bob forward and peck one of the soft, purple cheeks.");
		output("\n\n<i>“And the other one!”</i> You roll your eyes, scootch over and press your lips into her other warm buttock. Sera turns back around, giggling to herself, looking down at you fondly. <i>“Ohoh... I wish I’d put some nice, wet, red lipstick on you first. It would suit you, too.”</i>");
		output("\n\n<i>“Is that all, mistress?”</i> you say, trying to keep the exasperation out of your voice. She slides her clawed hand");
		if(pc.hasHair()) output(" through");
		else output(" across");
		output(" your [pc.hair] soothingly.");
		output("\n\n<i>“You’ve proved yourself to me my new pet, don’t you fret. So next you’re feeling frisky, you");
		if(pc.hasKnees()) output(" get on your [pc.knees]");
		else output(" crouch down");
		output(", call me “mistress”, and we’ll see where it goes.”</i>");
		
		flags["SERA_TRIPLE_X_RATED"] = 4;
		flags["SERA_NO_SEX"] = undefined;
		
		processTime(2);
		clearMenu();
		addButton(0, "Next", seraExitToMain);
	}
	else if(response == "perform")
	{
		output("Your heart hops slightly as you feel an overwhelming desire to demonstrate your commitment to your sadistic new mistress. You wet your [pc.lips] and gently press them into a soft, purple cheek. You keep going until your face is practically buried in warm flesh, before slowly withdrawing. When your lips finally leave her flawless hill, you open your mouth and begin to gently lick all around the red pucker you’ve created.");
		output("\n\n<i>“Oh wow,”</i> comes the voice of Sera, somewhere above you. She sounds both amused and slightly awed. <i>“I wasn’t wrong about you, was I? You and me... this is going to be a match made in heaven. Somewhere biblical, anyway.”</i> Her tone suddenly turns imperious. <i>“The other cheek now, bitch.”</i>");
		output("\n\nWithout complaint you turn to her second buttock and repeat the process, delighting in her pillowy warmth as you push your mouth into it, before giving it a gentle tongue bath. You top the performance off with a small, contented sigh you adjudge that the succubus cannot help but hear. She turns back around, and gazes down at you with a fierce possessiveness. Her dick is pointing upwards and her nipples are rock hard.");
		output("\n\n<i>“Thank you, mistress,”</i> you say sweetly. She slides her clawed hand");
		if(pc.hasHair()) output(" through");
		else output(" across");
		output(" your [pc.hair].");
		output("\n\n<i>“You’ve certainly proved yourself to me, my new pet,”</i> she husks. <i>“So next time you’re feeling frisky, you");
		if(pc.hasKnees()) output(" get on your [pc.knees]");
		else output(" crouch down");
		output(", and we’ll see what other services you can provide your mistress.”</i>");
		
		flags["SERA_TRIPLE_X_RATED"] = 4;
		flags["SERA_NO_SEX"] = undefined;
		
		processTime(2);
		clearMenu();
		addButton(0, "Next", seraExitToMain);
	}
	else
	{
		clearMenu();
		addButton(0, "Next", seraExitToMain);
	}
}

// Inch Stealing
public function seraInchGain(lengthGain:Number = 0, set:Boolean = false):Number
{
	if(flags["SERA_INCH_STEAL"] == undefined) flags["SERA_INCH_STEAL"] = 0;
	if(set) flags["SERA_INCH_STEAL"] = lengthGain;
	else if(lengthGain != 0) flags["SERA_INCH_STEAL"] += lengthGain;
	if(flags["SERA_INCH_STEAL"] < 0) flags["SERA_INCH_STEAL"] = 0;
	
	return flags["SERA_INCH_STEAL"];
}
public function seraInchStealingIntro(response:String = ""):void
{
	clearOutput();
	showSera();
	
	var cockIndex:int = pc.biggestCockIndex();
	var biggestLength:Number = pc.cocks[cockIndex].cLength();
	
	if(response == "ask her")
	{
		if(!pc.isCrotchExposed())
		{
			output("Quickly removing your [pc.lowerGarments]");
			if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
			{
				output(" and parting your genital slit");
				pc.createStatusEffect("Genital Slit Reveal");
			}
			output(",");
			pc.createStatusEffect("Temporary Nudity Cheat");
		}
		else
		{
			output("Swaying your crotch");
			if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
			{
				output(" and parting your genital slit");
				pc.createStatusEffect("Genital Slit Reveal");
			}
		}
		output(" you turn to your mistress and ask her if there is anything she can do about your [pc.cock " + cockIndex + "].");
		if(biggestLength >= 12) output("\n\n<i>“Ugh, look at that thing,”</i> she scoffs. <i>“Yes, I can do something about that, but it won’t be for you--it’ll be for </i>me<i>.”</i>");
		else if(biggestLength <= 11.5 && biggestLength >= 7) output("\n\n<i>“I think it looks perfect,”</i> she compliments, but it is quickly reversed by, <i>“but if you think that makes you look too manly, I have a solution to make you better suited to be my sissy " + pc.mf("boy", "slut") + ".”</i>");
		else if(biggestLength <= 6.5 && biggestLength >= 4.5) output("\n\n<i>“Aw, how adorable,”</i> she teases. <i>“What makes you want to change that puny pecker of yours?”</i>");
		else output("\n\n<i>“Mmm, are you sure you want me to fiddle with your petite pretty?”</i> she sneers, <i>“It complements your status quite well.”</i>");
		output("\n\nShe gives you a loud slap on your [pc.ass] and grabs your cock, taking a moment to examine it some more.");
		output("\n\n<i>“Since you sound so interested, I’ll show you what I’ve got in store for you, pet - but are you ready for it?”</i>");
		
		processTime(2);
		clearMenu();
		addButton(0, "Yes", letSeraFuckYouXXXpac, "yes shrink", "Yes", "Allow Sera to alter your [pc.cock " + cockIndex + "].");
		addButton(1, "Never Mind", seraInchStealing, "nevermind", "Never Mind", "Actually, you’d rather do something else....");
		return;
	}
	
	author("Nonesuch");
	
	// First time
	if(flags["SERA_INCH_STEAL"] == undefined)
	{
		output("Sera takes you by the hand and leads you briskly into the back of the Dark Chrysalis, down a narrow corridor and into another room. It’s dominated by a large, circular bed, unkempt, as everything in here seems to be. Clothes, headphones and who knows what else clutter the floor and shelves. You can’t really tell because it’s even duller in here than in the shop, if that’s possible – small, purple shaded wall fixtures seem to throw gloom rather than light. There’s a gentle, muffled white noise coming from somewhere – a stereo? – that permeates the perfumed space. You try hard not to step on anything as your demonic mistress leads you to the bed, pushes you down on it and then reaches beneath it.");
		output("\n\n<i>“This,”</i> she breathes, displaying a squat bottle of orange ointment to you, <i>“is something very special. You’re going to enjoy what it does, and so am I.”</i> She unscrews the glass stopper. A greasy, honeyed smell touches your nostrils; it gets stronger when Sera pushes the bottle into your hands, slithering onto the bed next to you as she does.");
		output("\n\n<i>“The first step is very simple,”</i> she whispers in your ear, her hot weight against your side. Her pupils are piercingly yellow in here, as day-glo as her horns. <i>“You’re going to – ah - apply that, to me.”</i> Her semi-erect prick flops into your lap.");
		processTime(4);
		// [Do it] [Perform]
		clearMenu();
		addButton(0, "Do It", seraInchStealing, "first do it", "Do It", "Apply the potion onto her penis.");
		addButton(1, "Perform", seraInchStealing, "first perform", "Perform", "Apply the potion onto her penis - but make a show of it.");
	}
	else
	{
		if(response == "shrink me")
		{
			output("Haltingly, you say you’d like to do some adjustments downstairs.");
			output("\n\nSera smiles toothily as she silently takes you by the hand and leads you into her strange, spacey bedroom.");
		}
		else output("Sera silently takes you by the hand and leads you into her strange, spacey bedroom.");
		if(pc.isCrotchGarbed())
		{
			output("\n\n<i>“Take ‘em off,”</i> she commands once she’s sat you on the bed. <i>“Let’s see.”</i> Meekly you do as she says. You");
			pc.createStatusEffect("Temporary Nudity Cheat");
		}
		else output("\n\n<i>“Let’s see.”</i> she says. You");
		if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
		{
			output(" part your genital slit and you");
			pc.createStatusEffect("Genital Slit Reveal");
		}
		else if(pc.genitalLocation() == 0) output(" thrust your [pc.hips] and you");
		output("r [pc.cock " + cockIndex + "] flops onto the duvet.");
		
		// 12 inches or over:
		if(biggestLength >= 12) output("\n\n<i>“We’re getting there,”</i> she sighs, twisting her lip at the sight of your oversized member. <i>“Slowly but surely. You better not still be taking dick enhancers out there,”</i> she suddenly says sharply, grabbing you by the shoulder and glaring into her eye. <i>“I’m not wasting my time on this simply because it’s fun watching you squirm.”</i>");
		// 11.5-7 inches:
		else if(biggestLength <= 11.5 && biggestLength >= 7) output("\n\nShe looks at you slyly, drifting her hand down to brush it. <i>“You know that’s an alright size, right? I don’t mind what you do with your prick, as long as it’s not bigger than mine.”</i> You close your eyes and say you want it be smaller. You might be imagining it, but you think Sera’s breath comes quicker to your words.");
		
		output("\n\n<i>“Okay then, pet,”</i> she breathes. <i>“Let’s make it happen.”</i>")
		processTime(3);
		
		// Mod size check!
		if(pc.cocks[cockIndex].cLengthRaw <= 1 && biggestLength >= 4.5)
		{
			output("\n\nYou can feel your pulse beat as you look down at your [pc.cock " + cockIndex + "]. She reaches in and squeezes it, making you gasp - but something makes her stop and pause.");
			output("\n\n<i>“Odd... Even for its size, I don’t think I’ll be able to get your pecker any smaller than this...”</i> she speculates. Giving a disappointed sigh, she continues, <i>“Look, if you’re trying to spoil the mood with some size-locking mods or bloat-loving parasites then woop-dee-doo mission accomplished, meat.”</i> She stares you down. <i>“You better fix it or we can’t continue with your sissy-fication. Seriously. You’ve got me all worked up for nothing!”</i>");
			output("\n\nWith that, you");
			if(pc.hasStatusEffect("Temporary Nudity Cheat") || !pc.isNude()) output(" re-dress,");
			output(" take your things and leave the room.");
			output("\n\n<b>It seems something is preventing your penis from getting any smaller!</b>");
			
			clearMenu();
			addButton(0, "Next", seraExitToMain);
			return;
		}
		// 6.5-4.5 inches:
		else if(biggestLength <= 6.5 && biggestLength >= 4.5) output("\n\nYou can feel your pulse beat as you look down at your cock, toy-like in comparison to Sera’s. She reaches down and squeezes it, easily wrapping her whole hand around it, making you gasp. <i>“You want me to make it even smaller?”</i> she whispers in your ear as she jerks her wrist. <i>“Make it into a cute little sissy twig that every girl in the galaxy will d’aww over? Maybe put a little bow around it?”</i> She giggles. <i>“Why am I asking this like you have an option? Let’s get to it.”</i>");
		// Less than 4.5, 
		else if(biggestLength < 4.5)
		{
			// [Yes] [No]
			clearMenu();
			// 1 cock:
			if(pc.cockTotal() == 1)
			{
				output("\n\nSera looks down at your petite boy clit. She bends down and breathes on it. You bite your lip. It’s enough; so sensitive is it, and so sensitive are you to her, it reacts, twitching, almost becoming hard.");
				output("\n\n<i>“Mmm,”</i> she says with deep contentment. <i>“So cute. So well suited for my eager little " + pc.mf("bitch boy", "dick girl") + ".”</i> She reaches out and takes you by the chin, making you stare into her face. Her expression is sober. <i>“I can’t shrink that any further. If I do, it’ll make you female. I can do that if you really want. I won’t force you to.");
				if(!pc.hasVagina()) output(" If I do, though...”</i> She sucks in her breath, her eyes burning. <i>“...I won’t be held responsible for my actions afterwards.");
				output("”</i> There’s a long pause. <i>“Do you really want me to do it?”</i>");
				
				if(pc.removeCockUnlocked(cockIndex, 1))
				{
					if(!pc.hasVagina() && !pc.createVaginaUnlocked(1)) addDisabledButton(0, "Yes", "Yes", "Something is preventing you from changing down there!");
					else addButton(0, "Yes", seraInchStealing, "lose penis", "Yes", "Choose to lose your manhood completely.");
				}
				else if(pc.isBro()) addDisabledButton(0, "Yes", "Yes", "What--Why would you want to lose your manhood?!");
				else addDisabledButton(0, "Yes", "Yes", "Something is preventing your [pc.cock " + cockIndex + "] from being removed!");
			}
			// more than 1 cock:
			else
			{
				output("\n\n<i>“Mmm,”</i> she says with deep contentment. <i>“So cute. So well suited for my eager little " + pc.mf("bitch boy", "dick girl") + ".”</i> She reaches out and takes you by the chin, making you stare into her face. Her expression is sober. <i>“I can’t shrink that any further. If I do, it’ll disappear for good.”</i> There’s a long pause. <i>“Do you really want me to do it?”</i>");
				
				if(pc.removeCockUnlocked(cockIndex, 1) && !pc.isBro()) addButton(0, "Yes", seraInchStealing, "standard", "Yes", "Choose to shrink your [pc.cock " + cockIndex + "] completely.");
				else addDisabledButton(0, "Yes", "Yes", "Something is preventing your [pc.cock " + cockIndex + "] from being removed!");
			}
			addButton(1, "No", seraInchStealing, "keep penis", "No", "Choose to keep your [pc.cock " + cockIndex + "] instead.");
			return;
		}
		clearMenu();
		addButton(0, "Next", seraInchStealing, "standard");
	}
}

public function crashDaddy():void
{
	output(pc.cocks[98].cLength());
}
public function seraInchStealing(response:String = ""):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	
	var cockIndex:int = pc.biggestCockIndex();
	var biggestLength:Number = 0;
	if(cockIndex >= 0) biggestLength = pc.cocks[cockIndex].cLength();
	
	if(response == "back away")
	{
		output("You fight the urge to obey your mistress and turn away as if you didn’t notice her demands.");
		output("\n\n<i>“Why you disobedient little fuck!”</i> she scolds as you continue pretending to browse her store....");
		processTime(1);
		clearMenu();
		addButton(0, "Next", seraExitToMain);
		return;
	}
	else if(response == "nevermind")
	{
		output("On second thought,");
		if(pc.hasStatusEffect("Temporary Nudity Cheat") || !pc.isNude()) output(" you re-cover your cock");
		else output(" you pull your cock back");
		output(" and tell Sera you’d rather not have her mess with it, at least for now.");
		output("\n\nWith a deep, annoyed sigh she berates you, <i>“Fine, fine. But don’t go wasting my time asking for things you are not willing to follow through with, got it?”</i>");
		output("\n\nYou nod.");
		if(biggestLength >= 12) output("\n\nWith that she mutters, <i>“Keep carrying that disgusting beast around and I don’t think you care to be my pet anymore....”</i>");
		
		processTime(1);
		pc.removeStatusEffect("Temporary Nudity Cheat");
		seraMenu();
		return;
	}
	else if(response == "first do it" || response == "first perform")
	{
		if(response == "first do it")
		{
			output("You exhale slowly as you dip your fingers into the jar, smear the stuff all around your hand and reach across to grip Seras thick girth in the darkness. She sighs as you move it up her shaft, the tan balm adhering easily to her.");
			output("\n\nThe atmosphere here is strange, uncanny; the strange white noise makes you feel both detached and sensitive, not really in control. It combines with what you are doing in this dark space, this odd ointment and the aggressive demon who has taken possession of you, to give you a sense of sexual, sensual surrealism. You curl your fingers into the pot again before slathering the grease all around Sera’s hardness, burningly hot to your touch.");
			processTime(3);
		}
		else if(response == "first perform")
		{
			output("You feel like you have something to prove to your mistress. You exhale slowly as you dip your fingers into the jar before reaching up to your mouth. You slather the stuff thickly over your [pc.lips], before bending over Sera’s thick shaft.");
			output("\n\n<i>“Oh you are a clever, filthy little [pc.boy],”</i> she groans, gripping your [pc.hair] as you engulf her prick, running your lips down her hot, hard flesh. The tan balm adheres to her easily, and soon enough you have to pull away to apply more of it to your lips.");
			output("\n\nThe atmosphere in here is strange, uncanny; the strange white noise makes you feel both detached and sensitive, not really in control. It combines with what you are doing in this dark space, this odd ointment and the aggressive demon who has taken possession of you, to give you a sense of sexual, sensual surrealism.");
			processTime(5);
		}
		output("\n\n<i>“That’s enough,”</i> says Sera thickly. You disengage from her, feeling mildly dazed.");
		if(pc.isBimbo() || pc.isTreated() || pc.isCumSlut()) output(" Your smeared lips feel lavish and vaguely tingly; you stifle the urge to lick them.");
		output(" She turns to you, her bulging cock pointing lividly at your face. <i>“Come sit across me. In close. That’s it.”</i> Her dark, bullet-like nipples press into your [pc.chest] as you shuffle yourself into her on the bed, your [pc.hips] rubbing against her own smooth thighs. She looks down at your semi-erect [pc.cock " + cockIndex + "] disdainfully. <i>“Rub that against me. Nice and slow.”</i>");
		output("\n\nTentatively you grip her waist and do as she says, pumping your hips to frot your prick against hers. The oozing grease it’s covered in makes the friction smooth, there’s plenty of warmth and soon enough you’re erect as she is. Sera responds once you’re there, pumping her smaller cock against yours with harder and harder strokes, clutching your back almost painfully, her mountainous breasts plumping into you. You press into each other with fierce intimacy, jousting your bulging, pleasure-dense cocks.");
		output("\n\nShe reaches forward and limpets her lips on yours, invading your mouth with her tongue, attacking your walls with it fiercely. At the same time a tingling sensation spreads down your [pc.cock " + cockIndex + "]. It suddenly feels achingly sensitive, as if the skin on it has disappeared. You cry out in shock, muffled, around Sera’s tongue. She smirks against your face and then forces herself onto you, forcing you back onto the duvet, holding your arms down as she humps you vigorously, throwing her whole body into it. Your eyes roll to the sensation of the savage friction on your sensitized cock.");
		output("\n\n<i>“You’ve gotta want it,”</i> she snarls wolfishly, her hot breath on your face. <i>“You’ve gotta want your mistress to take it away, to absorb your inches. The more you want it, the better it will work. So say it. Say how much you enjoy me turning you into my blushing, small-dicked beta bitch.”</i>");
		
		processTime(2);
		// [Say it] [Perform]
		clearMenu();
		addButton(0, "Say It", seraInchStealing, "say it", "Say It", "Let her know you want to be her tiny-dicked beta.");
		addButton(1, "Perform", seraInchStealing, "say perform", "Perform", "Really let her know you want to be her puny-penised pansy.");
		return;
	}
	else if(response == "standard")
	{
		output("She gropes around underneath her bed and then tosses you the jar. You exhale slowly into the greasy, honeyed smell, dipping your fingers into the jar, wondering how to apply the stuff this time.");
		
		// [Hand] [Oral]
		clearMenu();
		addButton(0, "Hand", seraInchStealing, "standard hand");
		addButton(1, "Oral", seraInchStealing, "standard oral");
		return;
	}
	else if(response == "lose penis")
	{
		//She durn turn you into a gurl
		output("With a shuddering sigh, you say you want this. You want her to turn you");
		if(!pc.hasVagina()) output(" fully");
		output(" female.");
		output("\n\nSera says nothing as she gropes around underneath her bed and then tosses you the jar. She doesn’t take your eyes off you, though – there is a deep, lizard-like hunger in them, and her huge penis – so different from your own sensitive [pc.cockNoun " + cockIndex + "] that they could be completely alien appendages – is fully erect by the time the container lands into your hand. You breathe in the greasy, honeyed smell, dipping your fingers into the jar, wondering how to apply the stuff this time.");
		
		// [Hand] [Oral]
		clearMenu();
		addButton(0, "Hand", seraInchStealing, "gurl hand");
		addButton(1, "Oral", seraInchStealing, "gurl oral");
		return;
	}
	else if(response == "keep penis")
	{
		output("You shake your head. Sera nods once, and gets up. Although you were expecting a verbal barrage for wasting her time she doesn’t say anything at all as you");
		if(pc.hasStatusEffect("Temporary Nudity Cheat") || !pc.isNude()) output(" re-dress and");
		output(" head back out to the shop.");
		processTime(1);
		clearMenu();
		addButton(0, "Next", seraExitToMain);
		return;
	}
	else if(response == "say it" || response == "say perform")
	{
		if(response == "say it")
		{
			output("<i>“Yes, I- I want it...”</i> you whisper.");
			output("\n\n<i>“Louder!”</i>");
			output("\n\n<i>“I want it!”</i> you cry. You arch your back as you cum, thrusted and pummeled to your high by your mistress’s dick; a moment later she joins, making a knowing “ahh” noise as she fountains cum onto your [pc.chest]. It feels like with every euphoric clench of your body your penis is dissipating, surrounded by a hot, shifting, nibbling force which is melting it away. You open your mouth as your tingling dick contracts ecstatically under Sera’s assault.");
		}
		else if(response == "say perform")
		{
			output("<i>“I want it,”</i> you moan. You fill your head with submissive thoughts; how powerful your mistress feels thrusting away at your unworthy cock, how badly you want to please her, how shamefully right it would feel to have a cute, sensitive little boy-clit for a dick...");
			output("\n\n<i>“Louder!”</i>");
			output("\n\n<i>“It belongs to you mistress, it all belongs to you!”</i> you cry out. You arch your back as you cum, thrusted and pummeled to your high by your mistress’s dick; a moment later she joins, making a knowing “ahh” noise as she fountains cum, mingling with yours on your [pc.chest]. It feels like with every euphoric clench of your body your penis is dissipating, surrounded by a hot, shifting, nibbling force which is melting it away. You open your mouth as your tingling dick contracts ecstatically under Sera’s assault.");
		}
		
		// “Say It” takes away 2 inches if cock > 12”, 1.5 if cock < 12”. “Perform” takes away 3.5 inches regardless. “Inch Stealing” option on Sera main menu unlocked. Sera always picks PC’s biggest cock. Track inches taken for Shax’s scene below.
		var inchLoss:Number = 1.5;
		if(biggestLength >= 12) inchLoss = 2;
		if(biggestLength >= 24) inchLoss++;
		if(biggestLength >= 36) inchLoss++;
		if(biggestLength >= 48) inchLoss++;
		if(response == "say perform") inchLoss = Math.round(inchLoss * (7/3));
		if(pc.hasPerk("Mini")) inchLoss *= 2;
		
		if(inchLoss > (pc.cocks[cockIndex].cLengthRaw - 1)) inchLoss = (pc.cocks[cockIndex].cLengthRaw - 1);
		
		pc.cocks[cockIndex].cLengthRaw -= inchLoss;
		
		output("\n\nAfter a moment of hazy, pleasurable floating you clamber onto your elbows to apprehensively gaze down at your gently throbbing dick. Sera lies on her side, hand rested on hip, gazing at you complacently.");
		if(pc.cocks[cockIndex].cLengthRaw <= 1)
		{
			if(pc.cocks[cockIndex].cLength() > 1)
			{
				output(" Your dick shrinks until it suddenly stops and can’t shrink no more... <b>It seems something is keeping your penis from getting any smaller.</b>");
			}
			else
			{
				if(pc.isBro()) output(" FUCK");
				output(" Wow");
				output("... Your dick is");
				if(pc.isBimbo()) output(" like, all");
				output(" tiny now. Your [pc.cockNoun " + cockIndex + "] feels so infantile now... Giving it some exprimental tugs, you confirm that it can’t possibly get any smaller. <b>This seems to be as small as your penis can get.</b>");
			}
		}
		else if(response == "say it")
		{
			output(" It’s gotten slightly but appreciably smaller, maybe a");
			if(inchLoss <= 1) output("n inch");
			else if(inchLoss <= 2) output(" couple of inches");
			else
			{
				output(" few inches");
				if(inchLoss > 3) output(" or so");
			}
			output(".");
		}
		else
		{
			if(inchLoss <= 1) output(" Unsurprisingly, only an inch has been shaved off your length.");
			else
			{
				output(" Oh God... your heart thumps as you look at how much your dick has shrunk.");
				output(" Three");
				if(inchLoss >= 4) output(", four");
				if(inchLoss >= 6) output(", six");
				if(inchLoss >= 12) output(", twelve");
				output(" inches or more disappear from your length...");
			}
			output(" What’s left feels tingly and sensitive.");
		}
		output(" Slowly, you turn and look at Sera’s.");
		if(flags["SERA_INCH_STEAL"] == undefined) output("\n\n<i>“Good, isn’t it?”</i> The demon smiles as she waggles her massive, leaking prick teasingly, swollen by what she has absorbed off you. <i>“But my dick is perfect as it is, as you know. So...”</i> She presses an opal on her harness, and then flops onto her back. Above the swell of her ass, her tail makes a peeling sound as it gains length, swelling out from its base. <i>“Can always use a couple more inches there,”</i> she says, demonstrating it by swishing her spade end and clapping it into your [pc.butt]. She looks down at yours.");
		else output("\n\nThe demon smirks back at you as she waggles her massive, leaking prick teasingly, swollen by what she absorbed off you. She lazily flops onto her back, presses an opal on her harness as she does. Above the swell of her ass, her tail makes a peeling sound as it gains length, swelling out from its base. Humming in contentment, she looks down at yours.");
		
		// 12 inches or over:
		if(biggestLength >= 12) output("\n\n<i>“Still too big I’m afraid, slut,”</i> she sighs. She scrunches your shoulder comfortingly. <i>“Never mind. A few more sessions like this and you’ll be exactly where I want you.”</i>");
		// Under 12 inches:
		else if(flags["SERA_INCH_STEAL"] == undefined) 
		{
			output("\n\n<i>“That wasn’t so hard, was it?”</i> she beams down, relishing what she’s done to you. <i>“A nice eager beta dick, perfect for you.”</i> She slides her hands up your back, brushing her lips against your ear. <i>“Or maybe it’s not?”</i> she whispers. <i>“Maybe you’d like it to be even smaller, pet?");
			if(!pc.hasVagina()) output(" Maybe you’d like to keep on going until I turn you into a girl. Would you like that?");
			output(" If you do... you can always come back.”</i>");
		}
		// Under 12 inches subsequent:
		else
		{
			output("\n\n<i>“Such a pretty, suitable little sissy prick,”</i> she croons. She gazes into your eyes, radiating utter satisfaction. <i>“You’re a very good " + pc.mf("boy", "girl") + ", coming back for these sessions. I only wish every bitch was as committed as you.”</i>");
			// Multicock removal
			if(pc.cockTotal() > 1 && biggestLength < 4.5)
			{
				output("\n\n<i>“This is it, sissy,”</i> she whispers gutturally, her breath hot on your face. <i>“This is me, finally taking it away. At least you’ve got");
				if(pc.cockTotal() == 2)output(" another");
				else output(" others");
				output(" to fill its place.”</i> She giggles, throaty and wicked. <i>“For now.”</i> It’s difficult to do anything but clutch her hot, aggressively writhing flesh, unable to concentrate on anything but her hot meat pushing and beating into your tender [pc.cock " + cockIndex + "]. The hot, shifting, nibble force is surrounding your tenderised cock, making you clench up helplessly as it disappears, centimetre by centimetre. It feels stronger, more overwhelming than ever before...");
				output("\n\n<i>“I’d tell you to want it,”</i> groans Sera above you, her cock head slapping into your midriff, leaving impact marks of pre. <i>“But I already know how very much you do. So – just – fucking – take – it!”</i> She finishes in a gleeful howl as she orgasms, fountaining cum onto your [pc.chest]. You moan as you do the same, your little bud contracting ecstatically under your mistress’s assault, dissolving deliriously, and – gone. Your cum mingles with that of Sera’s, but it comes from your [pc.cockSmallest], bulging and surging in sympathetic reaction to what just happened.");
				output("\n\nAfter a moment of hazy, pleasurable floating you clamber onto your elbows to apprehensively gaze down at your groin. Your [pc.cock " + cockIndex + "], oozing and tingling, has taken the place of your former dick, which has completely disappeared. Slowly, you turn and look at Sera’s.");
				output("\n\nThe demon smirks back at you as she waggles her massive, leaking prick, swollen by what she absorbed off you. She lazily flops onto her back, presses an opal on her harness as she does. Above the swell of her ass, her tail makes a peeling sound as it gains length, swelling out from its base. Humming in contentment, she looks back at you.");
				output("\n\n<i>“There we go dear,”</i> she whispers. <i>“The silly little thing is all gone. Replaced by another silly little thing.”</i> Again the giggle, low and wicked. <i>“You look better with less. Trust me.”</i>");
				
				// Remove cock
				pc.removeCock(cockIndex, 1);
				inchLoss = biggestLength;
			}
		}
		output("\n\nAfter you’ve rested a while longer you");
		if(pc.hasStatusEffect("Temporary Nudity Cheat") || !pc.isNude()) output(" shakily re-dress and");
		output(" head back out to the shop, your mistress’s words burning in your mind, very aware of how much more space there is between your [pc.thighs] now.");
		
		processTime(15 + rand(21));
		sera.orgasm();
		pc.orgasm();
		seraInchGain(inchLoss);
	}
	else if(response == "standard hand" || response == "standard oral" || response == "gurl hand" || response == "gurl oral")
	{
		if(response == "standard hand" || response == "gurl hand")
		{
			output("You smear the stuff all around your palm and reach across to grip Sera’s thick girth in the darkness. She sighs as you move it up her shaft, the tan balm adhering easily to her.");
			output("\n\nAgain you have the sense of being detached and sensitive, not really in control. The tactile sensation of your mistress’s prick in your busily working hand, the cloying smell of the ointment combining with the sharp smell of her musk, the muffled white noise which seems to reach into you and make you feel pliable and submissive; you feel aroused, your [pc.eachCock] hardening");
			if(pc.hasVagina()) output(" and your [pc.vagina] moistening");
			output(" as you slather the grease all around Sera’s hardness, burningly hot to your touch.");
		}
		else
		{
			output("You exhale slowly as you dip your fingers into the jar before reaching up to your mouth. You slather the stuff thickly over your [pc.lips], before bending over Sera’s thick shaft.");
			output("\n\n<i>“Such a dedicated little cocksucker,”</i> she groans, gripping your [pc.hair] as you engulf her prick, running your lips down her hot, hard flesh. The tan balm adheres to her easily, and soon enough you have to pull away to apply more of it to your lips. Again you have the sense of being detached and sensitive, not really in control. The tactile sensation of your mistress’s prick moving in your mouth, the cloying smell of the ointment combining with the heavy taste of her musk, the muffled white noise which seems to reach into you and make you feel pliable and submissive; you feel aroused, your [pc.eachCock] hardening");
			if(pc.hasVagina()) output(" and your [pc.vagina] moistening");
			output(" as you slather the grease all around Sera’s hardness. You moan softly as it occurs to you you’re sucking the dick that is shortly going to literally emasculate you.");
		}
		output("\n\n<i>“That’s enough,”</i> says Sera thickly. You disengage from her, feeling mildly dazed.");
		if(pc.isBimbo() || pc.isTreated() || pc.isCumSlut()) output(" Your smeared lips feel lavish and vaguely tingly; you stifle the urge to lick them.");
		output(" She turns to you, her bulging cock pointing lividly at your face. <i>“Come sit across me. In close. That’s it.”</i> Her dark, bullet-like nipples press into your [pc.chest] as you shuffle yourself into her on the bed, your [pc.hips] rubbing against her own smooth thighs. She looks down at your semi-erect [pc.cock " + cockIndex + "]");
		if(biggestLength >= 12) output(" disdainfully");
		else output(" with a smirk");
		output(". <i>“");
		if(response == "standard hand" || response == "standard oral") output("Rub that against me");
		else output("Savor it");
		output(". Nice and slow.”</i>");
		output("\n\nTentatively you grip her waist and do as she says, pumping your hips to frot your prick against hers. The oozing grease it’s covered in makes the friction smooth, there’s plenty of warmth and soon enough you’re erect as she is. Sera responds once you’re there, pumping her cock against yours with harder and harder strokes, clutching your back almost painfully, her mountainous breasts plumping into you. You press into each other with fierce intimacy, jousting");
		if(response == "standard hand" || response == "standard oral") output(" your bulging, pleasure-dense cocks.");
		else output(" her massively larger cock into yours, making you arch your back and gasp.");
		output("\n\nShe reaches forward and limpets her lips on yours, invading your mouth with her tongue, attacking your walls with it fiercely. At the same time a tingling sensation spreads down your [pc.cock " + cockIndex + "]. It suddenly feels achingly sensitive, as if the skin on it has disappeared. You cry out");
		if(response == "standard hand" || response == "standard oral")
		{
			output(" in shock, muffled, around Sera’s tongue. She smirks against your face and then lunges herself onto you, forcing you back onto the duvet, holding your arms down as she humps you vigorously, throwing her whole body into it. Your eyes roll to the sensation of the savage friction on your sensitized cock.");
			// 9.5 inches or more:
			if(biggestLength >= 9.5) output("\n\n<i>“You’ve gotta want it,”</i> she snarls wolfishly, her hot breath on your face. <i>“You’ve gotta want your mistress to take it away, to absorb your inches. The more you want it, the better it will work. So say it. Say how much you enjoy me turning you into my blushing, small-dicked beta bitch.”</i>");
			// 9 inches or less:
			else if(biggestLength <= 9) output("\n\n<i>“That’s it, take it, sissy,”</i> she snarls, holding you down, glorying in her power over you. <i>“You love how this feels, don’t you? Me sucking away your manhood, bit by bit, by wanking your pathetic bitch stick silly with my wonderful cock. It feels fucking wonderful, in case you were wondering. It surges into me whilst you’re lying there, gasping and mewling, every thrust making your prick more girly and better suited to being my bottom. Then I transfer it to my tail. A few more inches to flick around over my ass. I barely even think about it after that... until I need to penetrate a slut with it. Then it all comes back. Fitting, huh?”</i> She pauses for breath as she rubs into you frenetically. <i>“You know the drill. Remember: sound like you mean it.”</i>");
			
			processTime(5);
			// [Say it] [Perform]
			addButton(0, "Say It", seraInchStealing, "say it", "Say It", "Let her know you want to be her tiny-dicked beta.");
			addButton(1, "Perform", seraInchStealing, "say perform", "Perform", "Really let her know you want to be her puny-penised pansy.");
			return;
		}
		else
		{
			output(", muffled around Sera’s tongue. She launches herself onto you, forcing you back onto the duvet, holding your arms down as she humps you vigorously, throwing her whole body into it. Your eyes roll to the sensation of the savage friction on your sensitized cock.");
			output("\n\n<i>“This is it, sissy,”</i> she whispers gutturally, her breath hot on your face. <i>“This is me, finally taking it all away. The ability to fuck, rather than be fucked. You should be grateful, you know. Nobody is going to laugh at you in the shower or the bedroom again.");
			if(!pc.hasVagina()) output(" You’re gonna be using a different room from now on, actually. Just one of the many exciting new things you’ll be experiencing.");
			output(" Thank me.”</i> It’s difficult to do anything but clutch her hot, aggressively writhing flesh, unable to concentrate on anything but her hot meat pushing and beating into your tender [pc.cockNoun " + cockIndex + "], but such is the imperative her words instill in you, you still manage a whimpered “hanks”. The hot, shifting, nibble force is surrounding your tenderised cock, making you clench up helplessly as it disappears, centimetre by centimetre. It feels stronger, more overwhelming than ever before...");
			output("\n\n<i>“I’d tell you to want it,”</i> groans Sera above you, her cock head slapping into your midriff, leaving impact marks of pre.");
			if(!pc.hasVagina())
			{
				output(" Dimly, you feel like she’s angling herself differently this time, deliberately thrusting the base of her greased cock between your");
				if(pc.hasLegs()) output(" [pc.legOrLegs]");
				else output(" [pc.thighs]");
				output(". The tingling sensation begins to take hold there, pins and needles sinking into your taint...");
			}
			output(" <i>“But I already know how very much you do. So – just – fucking – take – it!”</i> She finishes in a gleeful howl as she orgasms, fountaining cum onto your [pc.chest]. You moan as you do the same, your little bud contracting ecstatically under your mistress’s assault, but – something is different. Very different. There is no communal mingling of warm cum on your front; it’s all Sera’s. You aren’t ejaculating at all.");
			// Herm
			if(pc.hasVagina()) output(" It’s a sensation you’re familiar with, but your female orgasm is more powerful than it usually is. You shudder and roll under your mistress’s thrusting, incapacitated by the delicious pulses throbbing through you.");
			// Male
			else output(" Whatever is left down there flexes gleefully, but it’s part of something new – something inward which clenches your lower body up in a powerful series of pulses like nothing you’ve ever experienced before.");
			output("\n\nAfter you’ve screamed your last at the ceiling, you float down into what feels like an eternity of hazy, pleasurable floating. You’re not able to summon the strength to get up onto your elbows, so you simply listen to Sera do the usual; the coo of glee at the bloated state of her cock, the click on her harness and the organic peeling sound as she transfers what she’s taken from you to her long tail.");
			
			// Herm
			if(pc.hasVagina())
			{
				//Cock removed, clit increase by 1, libido increase by 1
				pc.removeCock(cockIndex, 1);
				pc.removeBalls();
				pc.clitLength += 1;
				if(pc.hasPerk("Hung")) pc.clitLength += 1;
				pc.slowStatGain("libido", 1);
				
				output("\n\nHumming happily to herself she bends over you. You’re only able to summon the energy to close your eyes when you feel her fingernails touch your inner thigh.");
				output("\n\n<i>“It’s all gone, dear,”</i> she says merrily. She touches your [pc.clit] gently and you twitch. It feels more sensitive and distended than it used to. <i>“That’s a bit bigger, though. Little reminder of what you once had.”</i> She slides herself into you, clasping your body into hers, drawing your head to her cerulean lips as she gently teases one of your [pc.nipples]. <i>“No more odd looks from guys in the corridors. No more trying to hide bulges in polite society. You’re a girl now, pure and sweet. Of course me and you will know the truth – you had a cock, but your mistress made you cum so bad it melted right off.”</i> She licks behind your ear, tasting your sweat. <i>“Best to leave cocks to those who know how to use them, hmm?”</i>");
				output("\n\nAfter you’ve rested a while longer you");
				if(pc.hasStatusEffect("Temporary Nudity Cheat") || !pc.isNude()) output(" shakily re-dress and");
				output(" head back out to the shop, your mistress’s words burning in your mind, very aware of how much more space there is between your [pc.thighs] now.");
				
				processTime(15 + rand(11));
			}
			// Male
			else
			{
				output("\n\nYou are only snapped out of it when a long fingernail flicks one of your [pc.nipples]. You gasp – and your mouth freezes around the sound. The pitch of your voice is higher. You look over at Sera, who’s lying on her side and considering you with a satisfied grin on her face.");
				// Masculine
				if(pc.mfn("m", "f", "n") == "m")
				{
					// B cup or below:
					if(pc.biggestTitSize() <= 2) output("\n\n<i>“I’ve made myself a nice little cunt boy,”</i> she says. <i>“People will still think you’re a guy. You and me though... we’ll know something different.”</i>");
					// C cup or above:
					else output("\n\nShe laughs finally, shaking her head at you fondly. <i>“You’ll want to look into moisturiser or something, pet. You’re a bit of a mess at the moment.”</i>");
				}
				// Andro/Feminine
				else
				{
					// B cup or below:
					if(pc.biggestTitSize() <= 2) output("\n\n<i>“I’ve made myself a nice, flat chested little slut,”</i> she breathes. She gently grazes your chest with her claws. <i>“You should change that. Grow out some nice big tits so your mistress has something to squeeze when you walk by.”</i>");
					// C cup or above:
					else output("\n\n<i>“That was just one small last step really, wasn’t it?”</i> she breathes, sinking a hand into one of your [pc.breasts]. <i>“You’ve been a girl in all but one place for some time now.”</i>");
				}
				output("\n\nShe shifts in closer, her navy nipples pressing into you, her scent heavy in your nose, as well as a faint trace of greasy honey.");
				output("\n\n<i>“Now then, pet,”</i> she says. <i>“Let me walk you through your new self.”</i> She spoons into you, clasping your body into hers as her hand slides up your thigh, touching – you twitch – a new, wet opening below where your [pc.cock " + cockIndex + "] once was");
				if(pc.balls > 0) output(" - not to mention a curious lack of [pc.balls]..");
				output(". Sera traces its lips and pushes her thumb gently into its top fold. You squirm as she touches a nub of flesh which has only just stopped throbbing. <i>“That,”</i> she whispers, her cerulean lips next to your ear. <i>“Is what you once were. Even cuter and more sensitive than it was, and now it won’t make any nasty messes when I’m making you squeal.”</i> You are very aware of her cock, which she has wedged between your butt cheeks, methodically hot-dogging herself, rubbing herself to a fresh erection with your soft flesh as her fingers move inwards. You tense up when she touches an obstruction – delicately pressing her nails against a thin membrane.");
				
				//Cock removed, vagina added, auto- lost hymen and gaping
				pc.removeCocks();
				pc.removeBalls();
				pc.createVagina();
				pc.vaginas[0].clits = 1;
				pc.clitLength = biggestLength * 0.25;
				if(pc.clitLength < 0.75) pc.clitLength = 0.75;
				
				output("\n\n<i>“And that is your precious maidenhead,”</i> the succubus murmurs. <i>“You’ve got to be careful with that, blushing virgin of mine. It’d be awful if some wicked someone took advantage of you before your wedding night.”</i> She giggles lowly as she fingers your tight slit. Warmth blooms in your groin, but there’s nothing there to engorge - you just feel warmer, wetter and more unfurled the more her fingers move. The sensations she is pressing on you are difficult to properly take in, it’s all so new... experimentally you shift into her hand by rotating your hips, your breath catching in your throat as it makes Sera’s fingers slide over your tender pink.");
				output("\n\n<i>“Goddamn,”</i> she husks ferally. She’s shifting you, forcing you to kneel and bend, pressing your [pc.butt] out to present your new sex to her. Her huge erection slides down your [pc.anus]. You’re either still too spaced out to stop her or you don’t want her to stop; some heady combination of the two. <i>“You know how cute you sound now? I’m gonna make you sing a symphony for me.”</i> Her thick bulb presses against your moist new entrance. It feels ridiculously, ludicrously big. There’s simply no way... Sera pushes in gently but determinedly and you tense up, your breath again catching in your throat as her beading head spreads your lips wide. She stops for a moment, recedes slightly, then extends herself again. Something gives in your pussy, a dull sliver of pain. <i>“Been so long since I did that,”</i> sighs the succubus with deep satisfaction. You grit your teeth as she continues to gently dip in and out of you. She stretches you wider, and wider, and it feels like she must be tearing you apart - then with a wet sound her huge head fully enters you. You pant hard, your eyes crossing slightly as a comforting hand squeezes your [pc.butt].");
				
				pc.cuntChange(0, chars["SERA"].cockVolume(0));
				
				output("\n\n<i>“That wasn’t so bad, was it pet?”</i> she says, leaning back to admire her thick cock embedded in your rear. <i>“It gets better now. A lot better. Your mistress promises.”</i> You groan as she takes you by the [pc.hips] and begins to thrust in deeper.");
				output("\n\nShe fucks you gently but purposefully, nudging herself further in with each slow push, forcing you to get used to her girth and length. It never stops feeling impossibly big, but at some unclear point the intense sensation crosses over from pain to pleasure. Your pussy seems to quiver around her, gladly lubricating her hot bulging head as she spreads your tunnel with it from one end to the other. You try to make as little noise as possible because you quickly discover making the smallest squeak results in Sera incrementally picking up the pace, pumping her hips with greater force, finding your limit and using every inch. It vaguely occurs that she can’t get anywhere near her whole cock into you; she is at best penetrating you with only half of it. The thought of what it might be like to have a big enough pussy to take her whole mingles with the sensation of her hands slides up your flank to fondle your [pc.nipples] and you wail, your new physiology suddenly clenching up in a series of ecstatic contractions around her. It’s so much better than taking it in the ass; some deeper biological need being met.");
				output("\n\n<i>“That’s it you tight little cocksleeve, sing for me,”</i> groans Sera, clutching your [pc.chest] as she pounds into your flexing pussy hard. You feel utterly tenderised, only able to lie there with your [pc.butt] in the air as she finally tenses deep inside you and pumps you full of thick warmth. Hazily you wonder how she can possibly cum as hard as this when she covered your front in her seed only fifteen minutes ago; hard on the heels of that thought is that you are blissfully, filthily glad that she can.");
				output("\n\nFinally, with a deeply satisfied sigh, she is spent. You moan long and low as she withdraws. Her cock head makes a “pop” noise as it goes, and you feel a long, slimy stream of hot demon jizz ooze out of your disgracefully treated new sex.");
				output("\n\n<i>“There we go, pet,”</i> she whispers, pressing you between her pliant breasts. <i>“Broken in and gaped. Now no one will look at you and think you’re anything other than what you are – an obedient slut who belongs to someone with a big, thick cock.”</i> She licks behind your ear, tasting your sweat. <i>“Best to leave dicks to those who know how to use them, hmm?”</i>");
				
				pc.vaginas[0].hymen = false;
				pc.vaginas[0].minLooseness = 5;
				pc.vaginas[0].loosenessRaw = 5;
				pc.vaginas[0].wetnessRaw = 3;
				
				output("\n\nAfter you’ve rested a while longer you");
				if(pc.hasStatusEffect("Temporary Nudity Cheat") || !pc.isNude()) output(" shakily re-dress and");
				output(" head back out to the shop, the fact of what your mistress has done to you throbbing tenderly");
				if(pc.genitalLocation() <= 2 && pc.hasLegs()) output(" between your [pc.legOrLegs]. You can actually walk a little easier now. There is that");
				else if(pc.genitalLocation() <= 2 ) output(" between your [pc.thighs]");
				else output(" in your new genital");
				output(".");
				
				processTime(20 + rand(11));
				flags["SERA_CREATE_VAG"] = 1;
			}
			flags["FUCKED SERA"] = 1;
			IncrementFlag("SERA_INCH_STEALING_SEX");
			seraInchGain(biggestLength);
			sera.orgasm();
			pc.orgasm();
		}
	}
	if(pc.hasStatusEffect("Sera's TailCock Cooldown")) pc.setStatusMinutes("Sera's TailCock Cooldown", ((6 + rand(7)) * 60));
	else pc.createStatusEffect("Sera's TailCock Cooldown", 0, 0, 0, 0, true, "", "", false, ((6 + rand(7)) * 60));
	clearMenu();
	addButton(0, "Next", seraExitToMain);
}

// Inch Stealing Ain’t Easy
public function seraInchStealingAintEasy(intro:Boolean = false):void
{
	clearOutput();
	showSera();
	
	if(intro && pc.WQ() >= 50)
	{
		output("She looks pretty peeved... Are you sure you want to approach your mistress?");
		
		clearMenu();
		addButton(0, "Yes", seraInchStealingAintEasy);
		addButton(1, "No", seraInchStealing, "back away");
		return;
	}
	
	//By Shax
	//Repeatable one-off scene for players who have had inches stolen by Sera
	//Basic scene requires ~5in stolen or vagina created by Sera, whichever. Also the threesome //with the snowy googirl, so’s you already definitely definitely definitely know the tailcock.
	//Cooldown of a day before it can randomly appear again.
	author("Shax");
	
	var seraLength:Number = seraInchGain();
	var faceOrgasm:Boolean = false;
	
	output("You quickly ");
	if(pc.isGoo()) output("ooze");
	else if(pc.isNaga()) output("slither");
	else if(pc.isCentaur()) output("trot");
	else if(pc.isDrider()) output("scuttle");
	else if(pc.isTaur() || !pc.hasFeet()) output("pad");
	else output("step");
	output(" over to her. You assume the default pose, on bended knee");
	if(!pc.hasKnees()) output(", or what passes for it");
	output(", adding, <i>“Mistress?”</i>");
	
	output("\n\nYou notice through her grimace that her tail is not waving about as energetically as it usually does during one of her rages, and in fact is nowhere to be seen.");
	output("\n\n<i>“Look what you did, sissy,”</i> she says simply, turning about. Before your eyes is one of the most tangled knots you’ve ever seen, let alone on something living. Her tail is a total mess. <i>“Your extra inches let this happen. It wasn’t even that serious an argument and now I can’t get this shit undone without a mirror and some real fucking irritation. Seeing as this is the result of you being such an oversized slut, this is your problem to fix now.”</i> She pulls a chair over to lean on.");
	if(!pc.isNude()) output(" <i>“Strip down for this, I may like it like that later.”</i> You comply without complaint.");
	
	output("\n\nWith the speed born of a mistress’ command, you reach up and begin to examine the knotted tail. Ultimately it can easily be traced back to the spade of her tail. It’s easy for her spade to slip through a crevice, as you know so well, but its fat, blunt reverse side makes it reluctant to go the other way. You decide that the best way to get it back through this is to get it hard, as the spade eventually diminishes with the tailcock at full erectness. You take the spade in one hand, and begin stroking it lovingly with the other. Your mistress winces at the contact at first, but recovers. She doesn’t question your actions, probably having suspected the same thing. It’s a brief affair. The spade grows engorged under your ministrations. Then, it starts to split along a seam, which you focus your attentions on lovingly. Next thing you know, a respectable tailcock is throbbing gently in your hands and the spade has indeed become thinner for it.");
	
	output("\n\nYou can’t seem to help yourself. You give the head of her tailcock a dainty lick before pulling it on its way through the morass of coiled tail. Your first unraveling loop completed, you give it another little lick, causing Sera to breathe a little harder and tense up against the chair. You repeat the action several times. Inspect, lick, pull, lick. As a result, your progress toward finishing the knot and finishing your Mistress seem about on par. The heady aroma of cock starts to mingle with fresh juice from your Mistress’ pussy a foot or so away. Between them and the staccato blowjob you’re delivering, you’re starting to get turned on yourself.");
	
	output("\n\nThis next bit is tricky. The tail somehow wound itself through a gap in an already existing knot, and then back through a different loop in the same knot, all of which were pulled tight by its subsequent antics. You’re amazed it managed to avoid cutting off its own circulation, or at least enough so to avoid putting itself in dire straits. There’s no way the spade would have made it back through this. You take a moment to slobber over the base of your mistress’ tailcock to lube its eventual passage, causing Sera to suck in air sharply. With one hand you pull the knot open as much as possible, with the other you start to pull her tailcock through the loop. It’s a tight fit, and you have to be gentle. A bit of wiggling back and forth and suddenly the tail pops through! You know you just have to do it again immediately, so you keep at it, ignoring your usual celebration. Sera’s breathing is ragged by the time you manage to squeeze her tailcock through the second loop. With that out of the way a");
	if(seraLength >= 5) output(" significant");
	else if(seraLength >= 10) output(" small");
	else if(seraLength >= 20) output(" meager");
	output(" portion of the knot falls free.");
	
	output("\n\nBefore you can even take a moment to celebrate, her tailcock finds its way to your [pc.lips] with unerring accuracy. At its insistent push you submissively open your mouth to it, which provokes a sigh of pleasure from your mistress. The tailcock quickly finds its rhythm as it fucks your face");
	if(pc.lipRating() >= 4) output(" and slurps noisily through the pillowy seal of your [pc.lips]");
	output(". You figure there’s nothing to be done about your predicament right now but soldier on.");
	
	output("\n\nUntangling a knot of this magnitude is difficult and delicate work, the sort that can really hurt your fingers if the material is rough. Untangling a knot that is both writhing and fucking your face is a different matter altogether. Every time you think you have the knot figured out, it’ll collapse in a way which shows you’re wrong, or your mistress will just barely tickle your gag reflex. Ultimately you resort to the tried and true method, running your fingers along the end of it until you spot where it emerges from the knot. Slowly and steadily you thread her tail through it, which doesn’t diminish her thrusting in any way.");
	
	output("\n\nFinally you get down to the wire, and as you go to tug the cock through it won’t budge - because Sera is determined to fuck your face. You lean forward, pressing your [pc.lips] against the knot and taking several inches of tailcock down your throat in the process. Naturally, getting suddenly deepthroated would make anyone gasp, and you’re getting rather antsy yourself. As you finally extricate the tailcock from your face and through the loop, it, and with it your mistress, starts cumming. Great gouts of alabaster rain down on your face and [pc.chest]. Looking back over her shoulder, Sera smirks down at your impromptu bukkake with a glow of satisfaction as her primary naughty bits release all over the seat.");
	output("\n\n<i>“A certain slut’s going to have to clean that up later,”</i> she muses.");
	
	output("\n\nAs you sit there, stunned, the cum-leaking cock finds its way back into your maw and resumes fucking you ruthlessly as though nothing had happened. Obviously you’re not getting a reprieve until the job is done. The new cycle involves working through the knot as Sera’s tailcock spends as little time outside your mouth as is remotely possible.");
	
	//This section for 20+ inches. 
	if(seraLength >= 20)
	{
		output("\n\nYou’ve got a long way to go and a powerful fire in your loins. In hopes of achieving some sort of satisfaction out of this, you redouble your pace as much as you’re able. It wouldn’t do to cause your mistress any discomfort for several good reasons.");
		output("\n\nFortunately, that massive tangle you undid seems to have been the worst of it. The rhythm of getting facefucked and pulling out tangled loops settles in easily. At some point your Mistress cums again, coating you in a second layer of alabaster goo.");
	}
	//This section for 10+ inches. The sequel 2: son of electric boogaloo.
	if(seraLength >= 10)
	{
		output("\n\nBy now the knot is significantly diminished, but it’s still quite a lot of work. Diligence in the face of your mounting lust is the order of the day.");
		if(pc.canTitFuck()) output(" Sera’s tail takes to draping between your [pc.chest] getting a pseudo-titfuck out of it as she fucks your mouth. Which just makes your job harder still.");
		output(" You start getting distracted by the cock in your mouth, sometimes pausing to fellate it properly with eyes closed in bliss. Then you remember that that is getting you nowhere, and get yourself back to the task at hand.");
		output("\n\nYour mistress grunts suddenly, and starts spraying cum all over you again as you unthread another tricky loop.");
		if(seraLength >= 20) output(" You’re so drenched in her jizz by this point that you’re more of a spermy ghost than " + indefiniteArticle(pc.raceShort()) + ".");
		output(" Her chair, apparently waterproof, is currently serving as a cumbowl rather than a seat.");
	}
	// End inch variants
	
	output("\n\nThankfully, the end of your task is finally in sight. It’s the sort of knot you might expect from a cord in your pocket now rather than willful malevolence. Completing it at this stage is ultimately trivial next to what you’ve unraveled, and you set to the ending with gusto, all but fighting down your mistress’ tailcock to speed the process along. Finally, it all comes down to a simple, stupid pretzel loop. After everything else, getting her tailcock through that is trivial...");
	
	output("\n\nSera, it seems, can feel that the job is done. She crows in delight as she buries her tailcock once more in your face, now with all the fine control having her tailcock unbound allows her to bring to bear. She quickly brings herself to another panting orgasm, this time with her cock buried halfway into your mouth so you have to taste every drop of jizz as it squirts out of her.");
	
	//Orgasm scene only for PCs who either a) have some sort of oral fixation mechanic or b) have //been through the face-riding training scene with Sera 3+ times.
	// Orally Fixated:
	if(pc.isBimbo() || pc.isTreated() || pc.isCumSlut())
	{
		output("\n\nSucking her cock for so long with nothing else has already engorged your lips and livened your mouth. Feeling the pulsing beat of her cock wrapped in your [pc.lips] with such a huge load spilling into your mouth is enough to finally send you over the edge with warmth radiating out from cock and lips and jizz and tongue");
		// also done face-riding
		if(flags["SERA_FACE_RIDE_TRAINING"] >= 3) output(", as if your mistress’ training wasn’t enough to make the familiarity of her pleasure your pleasure");
		output(". You start to spasm throughout your body");
		if(pc.hasKnees())output(" and your [pc.knees] go weak");
		output(".");
		faceOrgasm = true;
	}
	// Only sera face-riding
	else if(flags["SERA_FACE_RIDE_TRAINING"] >= 3)
	{
		output("\n\nThey say that the mind is the largest erogenous zone, and between your mistress training you and the aphrodisiacs thrown about to do it, you suddenly learn all over again just how true that is. As her cock spurts out its pleasure onto your tongue, with all that build behind it, you feel something inside you turn over. And then it’s like there’s a live conduit between your mouth and your loins. You cum, and cum <i>hard</i>.");
		faceOrgasm = true;
	}
	// Orgasms
	if(faceOrgasm)
	{
		if(pc.isHerm())
		{
			output("With the symphony of [pc.cum] and [pc.girlCum] playing in your loins, a passing observer would assume some sort of toy or torment has been applied, but ultimately the complete lack thereof is what allowed you to be set off like this.");
		}
		else if(pc.hasCock())
		{
			output("\n\n[pc.OneCock] begins to spurt, completely unaided by you or your demonic mistress, ");
			if(pc.cumQ() < 50) output("droplets");
			else if(pc.cumQ() < 200) output("streamers");
			else output("blasts");
			output(" of [pc.cum] going splattering all over the floor in the general direction of your mistress’ feet.");
		}
		else if(pc.hasVagina())
		{
			output("has vagina: [pc.OneVagina] clenches in sympathy with the wondrous flood your mouth is experiencing, despite the complete lack of play your neglected ");
			if(pc.vaginaTotal() == 1) output("pussy has");
			else output("pussies have");
			output(" seen. Your [pc.girlCum] ");
			if(pc.girlCumQ() < 50) output("beads up");
			else if(pc.girlCumQ() < 200) output("streams down your [pc.leg]");
			else output("liberally coats the deck beneath you");
			output(".");
		}
		else
		{
			output("Has none of the above: Your asshole twitches, nerves lighting up like a christmas tree in orgasm, as satiating as your genitals might once have delivered.");
			if(pc.ass.wetness() >= 2) output(" In response to this turn of events your asshole’s lube kicks into overdrive, leaving you feeling slick and sensual in the only unfilled fuckhole.");
		}
		if(pc.canOviposit())
		{
			output(" Your ovipositor" + (pc.totalTailOvipositors() == 1 ? " even seems" : "s even seem") + " to come alive with the electric sensation of your orally-motivated orgasm. Eggs and fluids churn with pregnant poise, bringing with it that breed-hungry sensation they always provoke before calming back into the afterglow of your orgasm.");
		}
		output("\n\nYour mistress catches sight of your orgasm as you swallow down every drop like a proper cumslut, and seems positively giddy at the sight. <i>“Oh. My. God. You actually,”</i> and here she stops and trips over her thoughts. <i>“You actually came from that.");
		if(flags["SERA_INCH_STEALING_HELP"] == undefined) output(" I was just going to fucking leave you to stew on it, ‘cause it’s your fucking fault this happened. Fuck that though, this is amazing, the best damn thing I’ve seen all day.");
		else output(" Clearly I just can’t punish you with blowjobs anymore, oh woe, my lust for the perfect cumslut has gone horribly right,”</i> she adds sarcastically.");
		output(" You are one well-tuned fuckslut,");
		if(flags["SERA_FACE_RIDE_TRAINING"] >= 3) output(" and I’m fucking proud of your progress under my tutelage.");
		else output(" and I’m... happy to have a pet this well trained.");
		output("”</i> Her gleeful moment passes, back in command of herself.");
		
		pc.orgasm();
	}
	//In case you’re a sucker who didn’t get one of those things under your belt.
	else output("\n\nYou slowly and methodically take every last drop of jizz down your throat, slurping up the ripe and fresh cum like a true cumslut, need burning in your loins and driving you to further and further heights of lust and degradation. Finally, your mistress simply says,");
	
	output(" <i>“Alright slut, you know what you need to do.”</i>");
	
	output("\n\nDutifully, you comply.");
	// PC came with jizz or femjizz:
	if(faceOrgasm && pc.hasGenitals()) output(" You start by bending over and cleaning up what has escaped the notice of gravity and the Chrysalis’ floor drains with your [pc.tongue].");
	output(" Your own visage is a hopeless case, and no doubt the last thing she would want you to clean, so you turn your attention to the chair, which she steps aside from.");
	output("\n\nThe chair is a lake of mixed semen and femcum, cooling down. You can scarcely believe you’re going to lick up every drop, but you know that is exactly what you are going to do. <i>“Lap it up like");
	if(pc.isNaga() || pc.isTaur() || pc.isDrider() || pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED) || !InCollection(pc.skinType, [GLOBAL.SKIN_TYPE_SKIN, GLOBAL.SKIN_TYPE_GOO])) output(" the animal you are");
	else output(" an animal");
	output(",”</i> is Sera’s only instruction.");
	// pc has special tongue:
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG) || pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE) || pc.hasTongueFlag(GLOBAL.FLAG_HOLLOW)) output(" After a moment she adds, <i>“and no cheating with that special tongue of yours. Lick it up </i>right<i>.”</i>");
	output("\n\nYou set to your task. Tentatively your tongue reaches out, scooping up some of the mixture and bringing it into your mouth. It’s thick, musky, and hard to deal with. It fights being swallowed, like sticky gelatin. Neverthless, it begins sliding down your throat slowly. You don’t waste any time scooping up a second mouthful and repeating the process, it can only get more difficult to deal with.");
	output("\n\nTime passes and it feels like your only pleasure is the approving gaze of your mistress roving over your cum-plastered form. Progress is made. At one point, you actually scrape the bottom of the seat, noticing a peculiar tang. It only takes a moment to analyze the flavor and realize it tastes like Sera’s distilled ball-musk and femcum. You return to your task with a slight grin.");
	output("\n\nFinally, after ages and continually worse conditions amongst the bodily fluids, you’ve cleaned your mistress’ chair. Unceremoniously, she steps over you and takes a seat on it, proud cock hanging by the side of her leg. She is supremely satisfied, a thought which gives you a bit of a warm glow in the pit of your stomach. You lurch a moment thinking about your stomach, overfull of cum and femcum, roiling in a mixture, but you recover without anything more serious.");
	output("\n\nYou ultimately just bow your head. Sera says <i>“Alright, you’ve done your job, and a damn fine one at that. Time for you to get out of here, go find someplace to clean yourself up, because my shower is </i>not<i> dealing with that.”</i>");
	output("\n\nYou stagger to your feet and get out of the Chrysalis, far too drained and submissive at the moment to even think of protesting.");
	
	processTime(60 + rand(31));
	//Would be amusing if it disabled Sera sex for an hour or two.
	pc.createStatusEffect("Sera No Sex Cooldown", 0, 0, 0, 0, true, "", "", false, ((1 + rand(2)) * 60));
	pc.createStatusEffect("Sera's TailCock Cooldown", 0, 0, 0, 0, true, "", "", false, (24 * 60));
	if(faceOrgasm)
	{
		if(pc.hasCock()) pc.loadInMouth(chars["PC"]);
		if(pc.hasVagina()) pc.girlCumInMouth(chars["PC"]);
	}
	if(seraLength >= 20) pc.loadInMouth(chars["SERA"]);
	if(seraLength >= 10) pc.loadInMouth(chars["SERA"]);
	pc.loadInMouth(chars["SERA"]);
	pc.girlCumInMouth(chars["SERA"]);
	flags["FUCKED SERA"] = 1;
	IncrementFlag("SERA_INCH_STEALING_HELP");
	seraInchGain(0, true);
	clearMenu();
	addButton(0, "Next", seraExitToMain);
}

// Sex
public function fuckedSeraAsMistress():Boolean
{
	var totalSex:Number = 0;
	
	if(flags["SERA_INCH_STEALING_SEX"] != undefined) totalSex += flags["SERA_INCH_STEALING_SEX"];
	if(flags["SERA_INCH_STEALING_HELP"] != undefined) totalSex += flags["SERA_INCH_STEALING_HELP"];
	if(flags["SERA_EXHIBITION_BLOWJOB"] != undefined) totalSex += flags["SERA_EXHIBITION_BLOWJOB"];
	if(flags["SERA_IN_JARDI_THREESOME"] != undefined) totalSex += flags["SERA_IN_JARDI_THREESOME"];
	if(flags["SERA_FACE_RIDE_TRAINING"] != undefined) totalSex += flags["SERA_FACE_RIDE_TRAINING"];
	if(flags["SERA_TIT_FUCK_LUCKY_DIP"] != undefined) totalSex += flags["SERA_TIT_FUCK_LUCKY_DIP"];
	if(flags["SERA_PARTY_FUCKED"] != undefined) totalSex += flags["SERA_PARTY_FUCKED"];
	if(flags["SERA_TAILED"] != undefined) totalSex += flags["SERA_TAILED"];
	if(flags["SERA_TONGUE_FUCKED"] != undefined) totalSex += flags["SERA_TONGUE_FUCKED"];
	if(flags["SERA_MILKINGS"] != undefined) totalSex += flags["SERA_MILKINGS"];
	if(flags["SERA_PUNISH_FIX"] != undefined) totalSex += flags["SERA_PUNISH_FIX"];
	
	if(totalSex > 0) return true;
	
	return false;
}

//randomly generated. Possibly play in order before returning to first, so PCs can always get at the mod scene?
public function seraSexXXXRouter():void
{
	flags["FUCKED SERA"] = 1;
	
	var choices:Array = new Array();
	var newScenes:Array = new Array();
	var chance:int = 1;
	
	// Exhibition blowjob
	if(flags["SERA_EXHIBITION_BLOWJOB"] == undefined) newScenes.push(seraSexXXXhibitionBlowjobStart);
	choices.push(seraSexXXXhibitionBlowjobStart);
	// No. 3 in a Threesome
	if(flags["SERA_IN_JARDI_THREESOME"] == undefined) newScenes.push(seraSexXXXJardiThreesome);
	choices.push(seraSexXXXJardiThreesome);
	// Get Ridden
	if(flags["SERA_FACE_RIDE_TRAINING"] == undefined) newScenes.push(seraSexXXXGetRiddenStart);
	choices.push(seraSexXXXGetRiddenStart);
	// Titfuck/Vaginal or Anal + Lucky Dip
	if(flags["SERA_UNLOCK_CLIPPEX"] != undefined) chance += 2;
	if(flags["SERA_UNLOCK_SEMENS"] != undefined) chance += 2;
	if(flags["SERA_UNLOCK_LUCIFIER"] != undefined) chance += 2;
	if(flags["SERA_TIT_FUCK_LUCKY_DIP"] == undefined || (timesFuckedSera() % 4 == 0 && chance < 6)) newScenes.push(seraSexXXXTitfuckLuckyDipStart);
	if(rand(chance) == 0) choices.push(seraSexXXXTitfuckLuckyDipStart);
	// Parasite tail-cock
	if(pc.hasParasiteTailCock())
	{
		if(flags["SERA_TAILED"] == undefined) newScenes.push(seraCockvineScene);
		choices.push(seraCockvineScene);
	}
	// Milkings
	if(pc.biggestTitSize() > 2 && pc.isLactating())
	{
		if(flags["SERA_MILKINGS"] == undefined || (flags["SERA_MILK_RESERVE_DAYS"] <= 0 && rand(3) > 0)) newScenes.push(seraMilkingsStart);
		choices.push(seraMilkingsStart);
	}
	// Punishments
	if(flags["SERA_PARTY_INVITE"] >= 3 && (flags["SERA_PARTY_DATE"] + (1 * 24 * 60)) <= GetGameTimestamp())
	{
		if(flags["SERA_PUNISH_FIX"] == undefined) newScenes.push(seraPunishingFixStart);
		if(flags["SERA_PUNISH_FIX_DAY"] == undefined || flags["SERA_PUNISH_FIX_DAY"] < days) choices.push(seraPunishingFixStart);
	}
	
	// Go go sexytimes
	if(newScenes.length > 0) newScenes[rand(newScenes.length)]();
	else choices[rand(choices.length)]();
}

// Exhibition blowjob
public function seraSexXXXhibitionBlowjobStart():void
{
	var vagIndex:int = -1;
	
	if(pc.hasVagina() && rand(2) == 0) vagIndex = rand(pc.totalVaginas());
	
	seraSexXXXhibitionBlowjob([1, vagIndex]);
}
public function seraSexXXXhibitionBlowjob(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	showSera(true);
	
	var dildoSize:Number = 300;
	var pageNum:int = arg[0];
	var vagIndex:int = arg[1];
	
	// First
	if(flags["SERA_EXHIBITION_BLOWJOB"] == undefined)
	{
		if(pageNum == 1)
		{
			output("You kneel in front of her, gazing up at her fantastically perverse augmented body.");
			output("\n\n<i>“Mistress.”</i>");
			output("\n\n");
			if(!pc.isNude()) output("<i>“Take your clothes off.”</i> She taps a heel as you do so. ");
			output("<i>“Come here.”</i> She slides her hand down to the scruff of your neck and then, with a few directed pokes and pulls, gets you to crawl around to her side of the counter. There’s a square recess here for her chair; something glittering on the underside of the table catches your eye, but your attention is drawn back to Sera when she grunts. She’s reaching around her ass and drawing something out of her gleaming pussy; she withdraws it with a wet sound and a sigh of deep satisfaction.");
			output("\n\n<i>“Sitting around here can be so boring,”</i> she says, tapping the soaked pink dildo against her naked thigh as she gazes down at you. The long, slim tool is vibrating gently. <i>“Least with this thing I can take the frustration off a bit. That’s the theory, anyway...”</i> as she speaks she’s kneeling down, presenting the dildo to you. She doesn’t continue until you open your mouth and lick the gently humming device, tasting her vaguely spicy musk; once you have she bends forward, pressing her breasts into your [pc.chest] as she reaches around your [pc.butt] and pushes it against the entrance of your");
			if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
			else output(" [pc.asshole]");
			output(". She rotates it gently, teasing you with it, before using a single, wicked thrust to sheathe it fully in your");
			if(vagIndex >= 0) output(" pussy");
			else output(" ass");
			output(".");
			if(vagIndex >= 0) pc.cuntChange(vagIndex, dildoSize);
			else pc.buttChange(dildoSize);
			output(" Your gasp turns into a cry of shock as, with a click, she turns the vibrations way up. She slaps you harshly across the face.");
			output("\n\n<i>“Instead of thanking me for doing you the privilege of lubing your fuck stick up, you whine about it?”</i> she snarls. <i>“Thank me! Now!”</i>");
			output("\n\n<i>“Th-thank you mistress,”</i> you manage, trying to keep your voice level despite the quakes now shaking irresistibly through your core.");
			output("\n\n<i>“As I was saying before I got rudely interrupted...”</i> She pushes you back into the recess. With a brilliant shudder, you discern what caught your eye under here. Steel handcuffs dangle from the underside of the counter, level and set about three feet away from each other. Your breathing comes heavier as purple claws firmly grab your wrists and snap you into place. <i>“In theory it takes the edge off, but really all it does is make my cock all het up and prickly. Even if I fuck myself off with it, I get blue balls. After-effect of some of the mods I’ve used. You use your pussy and it makes you want to use your cock, you use your cock and it makes you want to use your pussy... on and on it goes.”</i>");
			output("\n\nShe gazes down at you, her pretty, evil face split by a huge grin up above her pert rack and huge, thick rod. You dangle helplessly underneath the counter, trying hard not to think about the dildo shuddering insistently into");
			if(vagIndex >= 0) output(" your wet, sensitive walls");
			else if(pc.hasCock()) output(" the needy, buried ball of your prostate");
			else output(" your sensitive walls");
			output(". It’s getting harder to do as she lightly brushes her prick against your [pc.lips], filling your nose with its scent – similar but denser, wilder than her pussy. Your breath continues even heavier. <i>“Since I’ve got you though, I haven’t even been trying to get off. Just teasing myself, keeping that frustration simmering away, for hours. Know how hard it is to serve a customer like that?”</i> she growls suddenly, pushing her beading end into your mouth. <i>“Fucking hard. But now I’ve got you, oh yes, all to myself. My personal little gloryhole. I’m going to use you for hours, you ass-kissing, cock-sucking whore. It’s going to be awesome.”</i> She drives her hot shaft in deeper as she says these last words, stretching your maw; you brace yourself for what is likely to be one hell of a throat-fucking.");
			output("\n\nHowever, after about a minute of fretful, muffled, shallow thrusting into your maw, Sera momentarily relents.");
			output("\n\n<i>“No,”</i> she groans harshly. <i>“Gonna hold back. Gonna savor this.”</i> You pant, unable to respond, clutching the air with your chained hands. When she’s using your mouth, it’s difficult to focus on anything else but the sensation of being ruthlessly penetrated from above and below, the shuddering dildo stuffed into you making");
			if(pc.hasCock()) output(" [pc.eachCock] thrum and flex irresistibly as");
			if(vagIndex >= 0) output(" you seep juices");
			else output(" you tense");
			output(" eagerly around it; but what is dimly picking at the edges of your deep, submissive intoxication at all this is what happens if a customer comes in. You’ve got a bad");
			if(pc.exhibitionism() >= 33) output(" (or is it shamelessly arousing?)");
			output(" feeling Sera will present and humiliate you whilst you’re helpless. Your attention is drawn unavoidably back to your immediate situation as an urgently erect foot-long cock pokes at your mouth.");
			output("\n\n<i>“Focus, sweetheart,”</i> growls Sera. She smears beading pre-cum around your [pc.lips]. <i>“I’m not gonna waste this by blowing my load down your throat straight away, much as you’d like that. You’re gonna lick every inch, good and slow. Go on.”</i> You trail your tongue around her bulbous, bulging head, lap softly at her slit, almost not touching her at all. <i>“Oh god yes,”</i> she hisses in response. <i>“Now kiss it and draw it in. Yes! And let’s hear some nice, slutty moaning, huh? Anyone would think you weren’t enjoying worshipping your owner’s big, juicy prick.”</i>");
			output("\n\nYou open wide and slide your lips beyond her head, your tongue advancing surely down her underside; as you do you groan softly into her meat, letting the vibrations travel through her. Honestly, you don’t even do it on request; the throbbing in your own nether regions is growing, twining so closely to the pleasure of blowing your filthy-mouthed mistress you can’t separate the two.");
			output("\n\n<i>“That’s it, that’s it,”</i> husks Sera, clutching the desk and beginning to pump her thighs again. <i>“Keep doing it like th-”</i> The shop door jingles, and the two of you freeze.");
			output("\n\n");
			
			processTime(35);
			var lustChange:Number = 5;
			if(pc.exhibitionism() >= 33) lustChange += 5;
			if(pc.exhibitionism() >= 66) lustChange += 5;
			pc.changeLust(lustChange);
			clearMenu();
			addButton(0, "Next", seraSexXXXhibitionBlowjob, [2, vagIndex]);
			return;
		}
		else if(pageNum == 2)
		{
			output("Your eyes open wide – and you orgasm. Maybe it’s the sudden tension in your muscles which does it. You rock against the dick in your mouth, letting the dildo fuck you deliriously,");
			if(pc.hasCock()) output(" [pc.eachCock] spurting rope after rope of cum against your stomach and [pc.chest]");
			else if(vagIndex >= 0) output(" your [pc.vagina " + vagIndex + "] clenching up around it again and again, spurting fluid onto the floor");
			else output(" your butt clenching up around it again and again");
			output(", trying so hard to stay quiet beads of sweat stand out on your forehead.");
			output("\n\n<i>“Hi,”</i> says a deep voice hesitantly, somewhere far away. <i>“This place open?”</i>");
			output("\n\n<i>“Yes! Yes, of course it is,”</i> says Sera. She withdraws from your mouth with a “schlorp” sound. To your ears, it sounds as loud as an alarm going off. She sways away from behind the counter, her dick still fiercely erect. Whoever that is must see how wet her cock is, surely...");
			output("\n\n<i>“My word,”</i> says the customer, sounding awed.");
			output("\n\n<i>“Eyes up here,”</i> Sera replies sharply. <i>“What are you looking for?”</i>");
			output("\n\n<i>“I, er...”</i> there’s some ponderous shifting around. Whoever he is, he sounds big. Whoever he is, you badly want him to fuck off. You wait, dangling by your arms");
			if((pc.hasCock() && pc.cumQ() >= 50) || (pc.hasVagina() && pc.girlCumQ() >= 50)) output(" in a sticky pool of your own juices");
			output(", barely daring to breathe. <i>“I’m looking for a... gift. For my nephew. He’s interested in these, human arcane type things. If you had some which aren’t particularly dangerous or, um... obscene...”</i>");
			output("\n\n<i>“Right this way,”</i> Sera says briskly. More shuffling around. <i>“This collection has all toys, reasonably priced. Give me a shout if you need a hand.”</i>");
			output("\n\n<i>“Yes, thanks...”</i> The sharp clop of six inch stilettos comes towards you. Before you can prepare yourself, Sera is on you. Without ceremony, she shoves her dick straight into your mouth, driving into your throat. You gag, choke slightly but she doesn’t care. She grips the counter, arches her back and thrusts her thick, purple thighs downwards, her breasts bouncing, practically lifting her feet off the ground to fuck your mouth as hard as she can. You desperately try and go soft, quell your gag reflex, make as little noise as you can – but your ears are full of the strenuous wet sounds of the furious oral and the light batting noise the succubus’s balls make when they beat into your chin. Your own heat is building again, the dildo mercilessly beating");
			if(vagIndex >= 0)
			{
				output(" the wettened walls of your [pc.vaginaNoun " + vagIndex + "]");
				if(pc.hasCock()) output(", stiffening your aching [pc.cockNoun]");
			}
			else if(pc.hasCock()) output(" at your sensitive prostate, stiffening your aching [pc.cockNoun]");
			else output(" the walls of your [pc.anus]");
			output("...");
			output("\n\n<i>“Excuse me?”</i> It’s coming from almost directly above you. You stifle a whimper only with difficulty.");
			output("\n\n<i>“Uh?”</i> says Sera. The thrusting stops, but she keeps her girthy meat wedged deep in your throat.");
			output("\n\n<i>“I’m, I’m sorry, I haven’t been quite forthright with you,”</i> the deep voice says. He sounds ashamed. <i>“I’m not really looking for a child’s gift. I was wondering, I came in here, that is to say...”</i>");
			output("\n\n<i>“Spit it out!”</i> As she snaps this she withdraws her bell end from your throat and into your mouth, allowing you to take as large a breath as you can while remaining silent. Dimly but urgently you consider ways to stop her using your throat again. Maybe make it feel so good in your mouth she doesn’t want to? You begin to lick and hollow your cheeks around her bulging, musky cock frenetically, using it as a gag to stop a moan surfacing as pleasure trembles up your spine.");
			output("\n\n<i>“What- what do you have in the way of testicular mods?”</i> the customer finally says. <i>“I was born with the unfortunate condition of having only two... of those, and I - the thing is, I don’t know if it’s worth asking you or going across the way to the other place, I know that some animals – ”</i>");
			output("\n\n<i>“Don’t you dare go to that place!”</i> she snarls. You try to remain absolutely silent as she begins to pump into you hard again. <i>“That bitch won’t give you what you need – what all bitches NEED – I mean, she will give you some crap that MIGHT give you a quad, but will also give you a disgusting snout, two rhino feet and who the fuck knows what else?”</i> She angrily penetrates you right to the quick, making stars dance in front of your eyes.");
			output("\n\n<i>“Is everything alright?”</i> the deep voice rumbles. <i>I should count myself lucky that this guy is the most oblivious sentient in the galaxy</i> you think, and now have to stifle the hysterical urge to laugh.");
			output("\n\n<i>“Never mind. Look, take this.”</i> Something is slapped onto the surface above you, making you flinch. <i>“Absolutely guaranteed to give you extra balls. 4000 credits. Don’t take too much or you’ll end up with about eight.”</i>");
			output("\n\n<i>“Eight, you say? Wow!”</i> The transaction takes place in a flurry of muffled clicks. As Sera carries it out she continues to slide her cock between your [pc.lips], but she’s calmed down a bit; your trick of bathing her sensitive end in attention seems to have worked, and she allows you to suck at it with steady rotations of her thighs. You slide your tongue along her straining flare gladly; you’re through the worst of it.");
			output("\n\n<i>“Thank you so much,”</i> says the customer effusively. <i>“Eight, I – this is more than I could have hoped for.”</i> His voice is becoming harder to discern as if he heads to the door.");
			output("\n\n<i>“My pleasure,”</i> trills Sera sarcastically. Your arch your neck as you feel another orgasm approaching.");
			output("\n\n<i>“And, er – you sure everything’s alright? There’s a heavy vibration of some sort coming from underneath your desk. Faulty heating?”</i>");
			output("\n\n<i>“Oh, that’s just my bitch,”</i> replies the demon casually, running her fingers through her hair. Your heart stops. <i>“[pc.He]’s under here, sucking me off.”</i> There’s a pause, and then the heavy sound of approaching footsteps. Sera steps back, pulling her cock away and gestures at you, cuffed to her counter, stuffed with a dildo and drool dripping down your chin, to an astonished-looking large, square reptile creature. The all-consuming humiliation should not in any way feel good. It may make your skin burn and your pulse beat like nothing else, but definitely not in that way, no, definitely not.");
			output("\n\n<i>“I, er, see.”</i> A thought slowly occurs to him. <i>“I don’t suppose I - ?”</i>");
			output("\n\n<i>“No,”</i> says Sera bluntly. <i>“Don’t let the door hit you on your way out.”</i>");
			output("\n\n<i>“Right. Well. Cheerio then...”</i> The door jingles. Sera looks down at you, hand on her hip, spit-polished dick pointing at you, a proud smirk on her face.");
			output("\n\n");
			
			processTime(15);
			pc.orgasm();
			var changeL:Number = 15;
			if(pc.exhibitionism() >= 33) changeL += 15;
			if(pc.exhibitionism() >= 66) changeL += 15;
			pc.changeLust(changeL);
			clearMenu();
			addButton(0, "Next", seraSexXXXhibitionBlowjob, [3, vagIndex]);
			return;
		}
		else if(pageNum == 3)
		{
			output("You don’t know what to say or how you should feel, however she performs an executive decision by gripping the back of your head and penetrating your mouth-cunt again.");
			output("\n\nShe fucks you strenuously now, pummeling your throat with her bulging end. The force, taste, and how this sadistic hellion you have given yourself to has used and humiliated you, wrap around the buzzing warmth in your nether regions so that when she finally reaches it, gasping as she draws lines in the counter with her claws, thrusting thick cum straight into your stomach, you orgasm too, your muffled moans joining her gloating crows as your");
			if(vagIndex >= 0)
			{
				output(" cunt seizes up around the whirring dildo");
				if(pc.isSquirter(vagIndex)) output(", spurting juice everywhere");
				output(", clenching your body with ecstatic pulses");
				if(pc.hasCock()) output(" as [pc.eachCock] is forced to an almost dry, aching orgasm");
			}
			else
			{
				output(" [pc.anus] seizes up around the whirring dildo");
				if(pc.hasCock()) output(", forcing [pc.eachCock] to an almost dry, aching orgasm");
				if(pc.hasVagina() && pc.isSquirter()) output(" as your [pc.eachVagina] spurt juices everywhere");
			}
			output(". Once she’s warmed your stomach she pulls out step by step, surging her seed down your gullet, filling your mouth full of it before finally pulling out and splattering your face and [pc.hair] with the last few pulses. At last, she staggers back and collapses on her stool, semi-flaccid and oozing.");
			output("\n\n<i>“Whew!”</i> she sighs with deep satisfaction, gazing at you with heavy-lidded yellow eyes. <i>“You should feel grateful to that guy, you know. I planned to keep you under there for a lot longer.”</i> You swallow deeply. You suspect pleading with her to let you go and, in particular, remove the dildo still juddering away inside your sorely-abused tunnel would probably result in her leaving you where you are. You grope for something that might work.");
			output("\n\n<i>“Thank you for using me, mistress,”</i> you say eventually. <i>“May I have another?”</i>");
			output("\n\n<i>“You’re such a greedy slutbag!”</i> She tsks to herself as she frees your complaining wrists and blessedly withdraws the dildo. <i>“And after the mess you’ve created down here, too! Manners, bitch.”</i> She taps her thigh determinedly as she draws you, dripping, out of the alcove, reaching into a locker to throw a scented towel at you. <i>“We’re going to have work on them. Next time.”</i> You jerk as she slaps your [pc.butt] as way of farewell.");
			
			processTime(10);
			pc.exhibitionism(2);
		}
	}
	// Repeat
	else
	{
		if(pageNum == 1)
		{
			output("<i>“Mistress.”</i>");
			output("\n\nSera looks down at you, savoring the sight for a long moment before closing her inhuman eyes, reaching around her ass and withdrawing a long, pink something out of her pussy. She taps the soaked dildo against her naked thigh, watching and waiting with a small smirk on her face. You know what’s expected of you; after gathering yourself you slowly crawl around to her side of the counter and, heart thumping, shuffle backwards into the square recess. The steel handcuffs fixed to the underside brush against your shoulders.");
			output("\n\n<i>“You aren’t going to get away so easily this time,”</i> she husks, presenting the gently vibrating device to you. You lick it, tasting her vaguely spicy musk, knowing she won’t continue until you do. Her breasts press into your [pc.chest] as she reaches around your own [pc.butt] and pushes it against the entrance of your");
			if(vagIndex >= 0) output(" [pc.vagina]");
			else output(" [pc.asshole]");
			output(". She rotates it gently, teasing you with it, before using a single, wicked thrust to sheathe it fully in your");
			if(vagIndex >= 0) output(" pussy");
			else output(" ass");
			output(".");
			if(vagIndex >= 0) pc.cuntChange(vagIndex, dildoSize);
			else pc.buttChange(dildoSize);
			output("\n\nYou grit your teeth as, with a click, she turns the vibrations way up.");
			output("\n\n<i>“What do you say?”</i>");
			output("\n\n<i>“Th-thank you mistress,”</i> you manage, trying to keep your voice level despite the quakes now shaking irresistibly through your core.");
			output("\n\n<i>“Good slut.”</i> She pushes you back into the alcove, and your breathing comes heavier as purple claws firmly grab your wrists and snap them into the handcuffs. She gazes down at you when she’s done, her pretty, evil face split by a huge grin up above her pert boobs and thick rod. You dangle helplessly underneath the counter, trying hard not to think about the dildo shuddering insistently into");
			if(vagIndex >= 0) output(" your wet, sensitive walls");
			else if(pc.hasCock()) output(" the needy, buried ball of your prostate");
			else output(" your sensitive walls");
			output(". It’s getting harder to do as she lightly brushes her prick against your [pc.lips], filling your nose with its scent – similar but denser, wilder than her pussy. ");
			output("\n\n<i>“I’ve been keeping myself pent up for so long,”</i> she breathes. <i>“It builds up. All the little things, you know? The boredom, the annoying customers, the bookkeeping, the frustration.”</i> She pushes her beading end into your mouth. <i>“But now I’ve got you, my personal little gloryhole, to work it all off on. It’s going to take hours. It’s going to be awesome.”</i> She drives her hot shaft in deeper as she says these last words, stretching your maw wide open; she pummels the front of your throat with it, urgently jerking her thick thighs, quickly losing herself in the rhythm. As you attempt to soften your mouth and take this face fucking as best you can, it vaguely occurs to you that if she keeps this pace up, she will be using you for seconds, not hours.");
			output("\n\nSera is true to her word, however. After about a minute of fretful, muffled, shallow thrusting she relents, groaning harshly as she forces herself back down. She spends a long while sliding her cock in and out as slowly as she can, glorying in the sensation of your [pc.lips] gliding over her hard meat, giving you time to wrap and smooth your tongue over it. When she’s using your mouth it’s difficult to focus on anything but the sensation of being ruthlessly penetrated from above and below, the shuddering dildo stuffed into you making");
			if(pc.hasCock()) output(" [pc.eachCock] thrum and flex irresistibly as");
			if(vagIndex >= 0) output(" you seep juices");
			else output(" you tense");
			output(" eagerly around it; when she gives you instructions you follow them immediately, as if they arrived from your own impulses.");
			output("\n\nWhen she pulls her prodigious bulbous head out almost to your teeth, keeping it there and demanding you polish it, you do so, roiling your tongue across her cum-slit and the light, slightly giving flesh around it, the taste of her pre inundating your taste buds; when she says that you aren’t vocalizing your enjoyment enough, you ramp up the wet sounds you are already making, your muffled groaning around her cock fueled by the vibrations juddering through your core. It’s around then that the first customer comes in...");
			
			processTime(25 + rand(11));
			var changeL2:Number = 15;
			if(pc.exhibitionism() >= 33) changeL2 += 15;
			if(pc.exhibitionism() >= 66) changeL2 += 15;
			pc.changeLust(changeL2);
			clearMenu();
			addButton(0, "Next", seraSexXXXhibitionBlowjob, [2, vagIndex]);
			return;
		}
		else if(pageNum == 2)
		{
			output("You quickly learn the best way to stop your mistress vigorously throat-fucking you or getting tempted to exhibit you to her customers is to bathe the end of her dick in close attention. When you lag, Sera either starts thrusting harder, or, if the customer is talking to her, starts dropping casual remarks about how much “entertainment” her own mods have provided for her. Or maybe this is all in your head. She is horribly, brilliantly random in her sadism.");
			output("\n\nIt may be half an hour later after you have successfully gotten through three customers without discovery that she grips the counter, arches her back and thrusts her thick, purple thighs downwards, practically lifting her feet off the ground to fuck your mouth as hard as she can. Your ears are full of the strenuous wet sounds of the furious oral, the light batting noise the succubus’s balls make when they beat into your chin. She pushes you back into the dildo mercilessly beating");
			if(vagIndex >= 0) output(" the wettened walls of your vagina");
			else if(pc.hasCock()) output(" at your sensitive prostate");
			else output(" the walls of your [pc.anus]");
			output(" and you are forced into orgasm");
			if(pc.hasCock())
			{
				output(", [pc.eachCock] spurting");
				if(pc.cumQ() >= 200) output(" rope after rope of");
				else if(pc.cumQ() >= 50) output(" a rope of");
				output(" cum against your stomach and [pc.chest]");
			}
			if(vagIndex >= 0)
			{
				output(", your [pc.vagina " + vagIndex + "] clenching up around it again and again");
				if(pc.isSquirter(vagIndex)) output(", spurting girl juice onto the floor");
			}
			else output(", your butt clenching up around it again and again");
			output(", beads of sweat standing out on your forehead.");
			output("\n\nYou dangle from your cuffs, spent and dissolved as Sera furiously pumps deep into your throat, filling every inch of your mouth with thick, musky meat, your own small gags and spasms around the impalement only seeming to provide her with greater pleasure and impetus. She groans long, low and exultant as her prick stretches your mouth even wider and then gutters hot cum straight into your stomach, pressing your [pc.lips] right up to her hairless crotch. Stars begin to swim around your vision before she unplugs herself from your throat, as ever doing it in stages - once she’s filled your stomach with warmth she pulls out step by step, surging her seed down your gullet, filling your mouth with it before finally pulling out and splattering your face and [pc.hair] with the last few pulses. She clutches her dangling, tumescent male sex in front of your mouth when she’s finished; after you’ve swallowed the hot cream in your mouth and managed to haul in several boat-loads of air after it, you lick her oozing end clean without instruction. The dildo continues to judder insistently at your tenderized inner walls; you’re at the stage now where you’ll do anything if it means release.");
			output("\n\n<i>“Whew!”</i> Sera says, breathing heavily. She wipes the sweat off her own forehead, looking like she’s just completed a strenuous but ultimately satisfying piece of shop work. <i>“That was pretty good for a first go. Hope you’re enjoying yourself down there, because even as good as you are at choking on dick it’s going to take me a while to build up as big a load as that for you again.”</i> Your wet moan turns into an arrested gulp as the door beeps again.");
			output("\n\nYou lose track, but in the time it takes for her to build to a second orgasm, plunging into your mouth gently at first and then with increasing insistence as she gets more and more erect, she manages to serve nine customers and you are driven to two more forced highs, your");
			if(vagIndex >= 0)
			{
				output(" aching cunt seizes up around the whirring dildo");
				if(pc.isSquirter(vagIndex)) output(", spurting juice everywhere");
				output(", clenching your body with ecstatic pulses");
				if(pc.hasCock()) output(" as [pc.eachCock] is forced to an almost dry, aching orgasm");
			}
			else
			{
				output(" [pc.anus] seizes up around the whirring dildo");
				if(pc.hasCock()) output(", forcing [pc.eachCock] to an almost dry, aching orgasm");
				if(pc.hasVagina() && pc.isSquirter()) output(" as your [pc.eachVagina] spurt juices everywhere");
			}
			output(". The whole universe narrows down to the vibrator stuffed in you and Sera’s cock; the dim understanding that you can escape this pleasure hell makes you focus on it intently, trying to excite and entice her as best you can with the sucking, roiling movements of your mouth and tongue.");
			output("\n\nFinally real urgency clenches her body up again; she scratches the counter with her claws, gasping as she pummels your throat strenuously with her bulging end, a fresh peak in sight. Your subdued moans join her gloating crows as she surges jizz down your throat, every bit as copious an ejaculation as the first. This time she pulls out before she’s half done, taking the time to clutch her foot-long pole and thoroughly paint you with her thick, musky seed. Unable to flinch or cover yourself, you take the hot, slimy shower on your [pc.face], [pc.hair] and [pc.chest]. At long last, she staggers back and collapses on her stool, semi-flaccid and oozing. After a few long, panting moments, she opens her yellow eyes to gaze down at you.");
			output("\n\n<i>“That’s a good look for you,”</i> she sighs, looking thoroughly pleased with herself. You are too dazed to respond; the dildo continues to thrum away inside you, oblivious to your exhaustion. The entire alcove is plastered with you and your mistress’s fluids; her jizz drips off you in gobbets. You suddenly see why she doesn’t put carpet down in her shop, and you stifle the urge to laugh hysterically. <i>“Having fun, are we?”</i> Sera husks with a raised eyebrow. She’s sliding her hand slowly down her massive cock, which never does go entirely flaccid. With a sweltering mixture of horror, awe and arousal it dawns on you that she’s more than capable of keeping you down here indefinitely. <i>“It goes without saying you enjoy polishing your mistress’s dick, but if you’re that keen I suppose we could go a third time...”</i>");
			output("\n\n<i>“I would like that very much, mistress,”</i> you say immediately, with as much enthusiasm as you can muster. She rolls her eyes and snorts with exasperation, as you knew she would.");
			output("\n\n<i>“Such a greedy slutbag!”</i> She tsks to herself as she frees your complaining wrists and blessedly withdraws the dildo. <i>“And after the mess you’ve created down here, too! Manners, bitch.”</i> She taps her thigh determinedly as she draws you, dripping, out of the alcove, reaching into a locker to throw a scented towel at you. She seems to have an unlimited supply of those. You are fast gaining an appreciation for why she does. <i>“We’re going to have work on them. Next time.”</i> You jerk as she slaps your [pc.butt] as way of farewell.");
			
			processTime(45 + rand(11));
			pc.exhibitionism(1);
			pc.exhibitionism(1);
			pc.exhibitionism(1);
			mimbraneFeed("face");
			mimbraneFeed("chest");
		}
	}
	
	pc.orgasm();
	pc.loadInMouth(chars["SERA"]);
	pc.loadInMouth(chars["SERA"]);
	sera.orgasm();
	IncrementFlag("SERA_EXHIBITION_BLOWJOB");
	clearMenu();
	addButton(0, "Next", seraExitToMain);
}

// No. 3 in a Threesome
public function seraSexXXXJardiThreesome(response:String = "jardis"):void
{
	clearOutput();
	author("Nonesuch");
	showName("SERA\n& JARDI");
	
	// First
	if(flags["SERA_IN_JARDI_THREESOME"] == undefined)
	{
		if(response == "jardis")
		{
			showBust("SERA", "JARDI");
			
			output("You kneel in front of Sera, gazing up at her unabashedly perverse form.");
			output("\n\n<i>“Mi - ”</i> The door beeps.");
			output("\n\n<i>“Mistress?”</i> says a breathy, female voice. <i>“I’m sorry I – oh.”</i> Sera beckons impatiently.");
			output("\n\n<i>“Finally! Stand over there, girl.”</i> You slowly look up at the person who nervously takes her place at your side.");
			// Flahne met:
			if(flags["MET_FLAHNE"] != undefined) output(" It’s a rahn – but quite different to the one you met on Mhen’ga. Her eyes are brown, her lips are a deep red and her flesh is an opaque gelatinous white, like Turkish delight. She’s also considerably more svelte than Flahne, perky, pert breasts and ass discernible underneath her simple slacks and blouse. Her “hair” is done up in a neat top pile, though. Perhaps that’s fashionable amongst the rahn right now.");
			// Otherwise:
			else
			{
				if(CodexManager.entryViewed("Rahn")) output(" It appears to be rahn, with");
				else
				{
					output(" It’s some sort of");
					CodexManager.unlockEntry("Rahn");
				}
				output(" partially opaque gel humanoid with long ears, brown eyes, deep red lips and a pretty face, despite its lack of a nose. Her flesh is a striking, gelatinous white, like Turkish delight, and she is agreeably slim by human standards, her perky, pert breasts and ass discernible underneath her simple slacks and blouse. Her “hair”, which seems to be simply an extension of her gel flesh, is done up in a neat top pile.");
			}
			output(" Sera waves a claw lazily.");
			output("\n\n<i>“[pc.name], meet Jardi. She is a go’rahn and a bitch. Jardi, meet [pc.name]. [pc.He] is " + indefiniteArticle(pc.raceShort()) + " and also a bitch");
			output(".”</i> She bites her lower lip as she considers the two of you, before getting up. <i>“I’m going to make some adjustments in the back. You two have a chat. You’re going to be working together very closely soon.”</i>");
			output("\n\nJardi looks across at you shyly as the succubus strides out of the room. Feeling you should take the initiative, you ask the pretty gel-girl how she got to know Sera.");
			output("\n\n<i>“I work on the flight deck. I didn’t come in here for anything specifically, I just like exploring the station, meeting new people. But when I came in here... uh...”</i> She twiddles her fingers, her cheeks turning a lovely rose color. <i>“I don’t know how much you know about the rahn, but we’re a very open and casual people when it comes to sex. Very... consensual? When I encountered something as forceful as that, I kind of... You know how they tell you when you meet a new people to wear a breathing mask, because they might be carrying stuff your immune system has no resistance to?”</i>");
			output("\n\nYou tell her you understand. She looks at you with her big, brown eyes.");
			output("\n\n<i>“Are all human relationships like this?”</i> You only have time to laugh before Sera’s voice comes floating out of the door behind the counter.");
			output("\n\n<i>“You two. Down the corridor and on your right. Now.”</i> You proffer your hand companionably to Jardi, who takes it with a grateful smile. Together you head on through and into the gloom of the room on your right.");
			output("\n\n");
			if(fuckedSeraAsMistress()) output("Although you’ve been in here before, the atmosphere in Sera’s bedroom is even more thickly sensual and unreal than it usually is. She’s set up a hookah on a table at the head of the bed, where she herself is positioned, lounging against the back. The smoke from the ornate device, cloying and vaguely herbal, sits effervescently in the air, making the purple-lit space even more gloomy than it usually is. The only certain illuminations are Sera’s horns and brilliant yellow slit eyes, boring into you from across the room. The strange white noise is still there, a whispering interference burying busily into your mind. The memory of the things you have already done in here combine with the dense ambience to make you feel open, pliant, accepting and sensitive before you’ve even taken two steps in.");
			else output("The space is dominated by a large, heart-shaped bed, unkempt, as everything in here seems to be – clothes, headphones and who knows what else clutter the floor and shelves. You can’t really tell because it’s even duller in here than in the shop, if that’s possible – small, purple-shaded wall fixtures seem to throw gloom rather than light. There’s a gentle, muffled white noise coming from somewhere – a stereo? – that permeates the space. There is a hookah on a table at the head of the bed, where Sera herself is positioned, lounging against the back. The smoke from the ornate device, cloying and vaguely herbal, sits faintly in the air, making the purple-lit space even more shadowy than it would normally be. The only certain illuminations are Sera’s horns and brilliant yellow slit eyes, gazing at you from across the room. The dense ambience makes the place feel unreal, thickly sensual.");
			output("\n\n<i>“Aww,”</i> she croons to herself, as you and Jardi pause in the doorway. <i>“Hand in hand. You two are so sweet I might just bust a nut.”</i> She pauses to take a long pull on the hose she has in her hand, pupils dilating as she fountains smoke out of her nostrils. <i>“You,”</i> she says, pointing at you. <i>“Come here.”</i>");
			output("\n\nHesitantly, you let go of Jardi and climb onto the bed. Your mistress lays a comforting hand on your shoulder, sliding it downwards as she offers you the mouthpiece. Again with a certain degree of apprehension, you put your lips on it and inhale. It’s not acrid, as you were expecting; hot, perfumed air with the faintest trace of bitterness billows into your lungs. It’s quite nice, in fact. The way the smoke feels like it’s permeating through you, making your pores open and the blood rise to the surface of your skin, the way it makes warmth sink down to your groin");
			if(pc.hasGenitals())
			{
				output(",");
				if(pc.hasCock()) output(" your [pc.cock] engorging");
				if(pc.isHerm()) output(" and");
				if(pc.hasVagina()) output(" your [pc.vagina] puffing up");
			}
			output("... Sera looks down at you with a knowing smile.");
			output("\n\n<i>“Take another drag,”</i> she says lowly. <i>“This time hold it.”</i> You do so quite happily, drawing in the perfumed smoke, feeling intensely relaxed and happy to be here, near the warmth and power of your mistress. <i>“Now,”</i> she whispers. <i>“Go across and give it to her.”</i> ");
			output("\n\nHolding your breath, you turn to where she’s gesturing, vaguely surprised to find Jardi is still here, sitting on the edge of the bed and watching this display nervously. Why is she tense? There is nothing to be tense about here. Feeling an instinctive urge to touch her, you crawl across the duvet, your payload hot in your lungs, spread your hands around her gooey head and push your lips against hers tenderly. You wait until she reciprocates, opening her mouth to kiss you back before releasing, channelling the perfumed smoke into her. You slide your lips over hers for a while longer, enjoying the beautiful warm give of this creature, before gently parting.");
			output("\n\n<i>“Ooh,”</i> sighs Jardi, blinking a couple of times. Her pupils dilate and she smiles at you amorously. You do the same back, practically giggling together at how wonderful everything is.");
			
			processTime(25);
			var changeL3:Number = 15;
			if(pc.hasCock()) changeL3 += 15;
			if(pc.hasVagina()) changeL3 += 15;
			pc.changeLust(changeL3);
			clearMenu();
			addButton(0, "Next", seraSexXXXJardiThreesome, "hookah");
			return;
		}
		else if(response == "hookah")
		{
			showBust("SERA_NUDE", "JARDI_NUDE");
			
			output("<i>“Good,”</i> husks Sera. She’s lying back against the bed frame, clutching her turgid cock with one hand and toying with her gleaming pussy with the other. <i>“Now take off");
			if(!pc.isNude()) output(" each other’s");
			else output(" her");
			output(" clothes. Put on a display for me.");
			if(pc.hasCock()) output(" Don’t fuck, though. That’s not for you.");
			else output(" Make it good. It’s been so long since I watched two lesbian sluts go at each other.");
			output("”</i> You slide off Jardi’s blouse, undo her bra slowly, and when her pretty, petite breasts are exposed engulf a nipple with your mouth.");
			if(!pc.isNude()) output(" Her hands slide beneath your [pc.gear], exploring and touching you with her pleasantly moist hands as she unclasps and unwraps you as you do the same for her. She coos as you continue to work, slowly divesting her of her slacks and pink panties.");
			else output(" With your clothes already long gone the goo-girl has nothing to do but coo and slide her pleasantly moist hands down your frame, exploring you as you slowly divest her of her slacks and pink panties.");
			output("\n\nJardi’s naked, gooey flesh is delightful to touch, to cusp and sink your fingers and tongue into, a hot, human-shaped blancmange which sighs and gasps when you touch its erogenous areas, and by the way she eagerly reciprocates she finds your body equally enjoyable. She straddles your waist with her slim thighs, rotating them gently as you sink your fingers into her sweltering pussy, passionately frenching you, her long tongue reaching deeper into your mouth the deeper you probe into her sex.");
			output("\n\nPanting slightly, she pulls out and descends to your [pc.chest]. You place your hands behind you and exhale long and low as she slathers her tongue over first one [pc.nipple] then the next,");
			if(pc.hasCuntNipples() || pc.hasLipples()) output(" making them bead before penetrating them with her delightfully long, drooling muscle, humming happily as she laps at the pink insides of your pussy breasts");
			else output(" the gentle, insistence of her mouth making them stand out, keenly erect");
			output(".");
			if(pc.isNaga()) output(" You slither your coils onto the bed and slowly wrap them around the goo-girl; she runs her hands over your smooth scales as they surround her, blissed out, and gladly opens her mouth when you gently poke it with your tip. You smile dozily as she envelopes your tail end in sucking balm.");
			if(pc.hasCock()) output(" Her own hand descends to your [pc.cock] and envelopes it, goo swaddling that mushily milks you, making you achingly hard. The desire to push forward and penetrate this lissom, willing girl is almost unbearable, but your mistress’s words echo in your head, holding you back and just that, being denied by your own obedience makes it even hotter, your cock straining to Jardi’s teasing touch.");
			else if(pc.hasVagina())
			{
				output(" Her own hand descends to your mound, traces your labia and then quests into your [pc.vagina]. She is able to caress your [pc.clit] with her thumb whilst penetrating you deep, rubbing your walls with pulsing jelly. The desire to thrust your [pc.hips] into her hand and get off to what this lissom, generous girl is doing is almost unbearable – but you know your mistress wouldn’t want that, she wants you kept on the edge, and you keep your movements slow. Just that, being denied by your own obedience makes you even hotter, your pussy");
				if(pc.isSquirter()) output(" streaming");
				else output(" dripping");
				output(" to Jardi’s teasing touch.");
			}
			output("\n\nYour sighs, kisses and licks are overlain by the heavy sound of Sera’s breathing and the shifting, wet sound of her masturbation as she watches you. <i>“And some people pay for porn,”</i> you think you hear her groan at one point. Making out with this slim, tender rahn under the sensitizing effects of this room and the smoke would be wonderfully pleasant whatever the case, but the fact it’s done for your mistress’s own viewing pleasure makes it overwhelmingly erotic.");
			output("\n\nWhen you clasp Jardi’s hands and kiss her deeply again, crouched opposite you, Sera makes her move. She shifts over and lays her hand behind each of your heads, knelt over you. You continue to curl your tongue around Jardi’s, confused for a moment – until a musky, foot long prick slides in front of your lips from the side.");
			output("\n\n<i>“Keep going dears,”</i> sighs the succubus, clasping your heads firmly and moving her hips slowly, gliding your lip-lock up and down her thick cock. You open your mouth wide and feel the goo-girl’s soft, red mouth on the other side of the veiny hardness shifting between you. With a bit of effort it’s possible for the two of you to continue mingling your tongues and lips whilst Sera runs all twelve inches of her male sex through your joining, it just requires you to open your mouths quite wide, make sloppier and needier noises than you were before. Jardi’s hands tighten around yours when Sera ends by sliding all the way back so her pre-cum beading bulb is between you; your body throbbing with arousal and acquiescent bliss, you join the goo girl in lavishing it with your tongue.");
			output("\n\nSera’s breath is heavy as she withdraws and singles out Jardi, her hand brushing her breasts as she turns her around and firmly presses her head into the duvet, exposing her tight round ass and oozing goo pussy, rose with arousal. She slides her bulging cock down the crack of her behind and teases her entrance with it; the goo girl’s muffled whimper travels to you through the sheets. Sera looks over her shoulder at you, her yellow eyes livid in the gloom.");
			// Cock, less than 6 inches:
			if(pc.hasCock() && pc.biggestCockLength() < 6)
			{
				output(" Her teeth gleam as she sees how eagerly erect your toy-like [pc.boy] cock is.");
				output("\n\n<i>“I’m gonna touch her and make her cry out in ways you can’t, sissy.”</i> She flares her hips as she gently dips into Jardi’s seeping vagina, displaying her purple rear to you – her bloated balls, wet pussy, and large, round ass. <i>“Since you did such a good job of warming her up for me, though... I will leave it up to you how you use your mouth to please me as I do.”</i>");
			}
			// Otherwise:
			else
			{
				output(" Her teeth gleam as she flares her hips to dip into Jardi’s seeping vagina, displaying her rear to you - her bloated balls, wet pussy, and large, round ass.");
				output("\n\n<i>“Since you did such a good job of warming this slut up for the good, hard fucking I’m gonna give her... I will leave it up to you how you use your mouth to please me as I do.”</i>");
			}
			
			processTime(10);
			var lustC:Number = 5;
			if(pc.hasCock()) lustC += 5;
			if(pc.hasVagina()) lustC += 5;
			pc.changeLust(lustC);
			
			// [Balls] [Pussy] [Ass]
			clearMenu();
			addButton(0, "Balls", seraSexXXXJardiThreesome, "balls");
			addButton(1, "Pussy", seraSexXXXJardiThreesome, "pussy");
			addButton(2, "Ass", seraSexXXXJardiThreesome, "ass");
			return;
		}
		else if(response == "balls" || response == "pussy" || response == "ass")
		{
			showBust("SERA_NUDE", "JARDI_NUDE");
			
			if(response == "balls")
			{
				output("You slowly crawl forward, the sight of Sera’s ample thighs and behind taking up everything as she slowly buries every inch into Jardi’s plump cunt. The rahn makes a sing song gasp when her mistress’s hips touch her behind, seeping fluid from her stuffed tunnel freely. You wrap your hands around the purple, pliant warmth of the succubus’s waist and when she withdraws you envelope one of her bulging testicles in your mouth. Equal parts mistress musk and salt saturates your [pc.tongue], sending arousal wiring down to your [pc.groin].");
				output("\n\n<i>“Oh, that’s good,”</i> Sera whispers. <i>“Use your tongue. Yes!”</i> She practically sings it when you gently compress your cheeks around the sensitive orb in your mouth. <i>“You should feel what this filthy [pc.boy]-slut is doing, Jardi,”</i> groans the demon. <i>“[pc.He]’s going to make me cum a fucking ocean into you. Now the other one,”</i> she orders, with a stern flourish. You are too under the influence of the room and her to do anything other; you shift your [pc.lips] across her dipping and rising scrotum to suck at her other ball, gently lapping at it as her round ass rises and recedes, buried in the white mound ahead of you.");
				output("\n\nShe pumps into Jardi slowly at first, letting you get used to her recede and extent, before picking up the pace, bumping back into you brusquely, making you move your neck in order to continue shifting your lips worshipfully over her cum factories. With every inward thrust they seem to tighten, thicken, as they prepare their load. There is a breathy, muffled moan as the succubus thrusts harder, driven on by your ministrations.");
				output("\n\nSomething warm and blunt drifts down your lower back, questing into the crack of your [pc.butt].");
				if(!pc.hasVagina())
				{
					output(" You tense up for a moment when Sera pushes her tail spade into your [pc.anus], but it is only for a moment; the beguiling relaxation and arousal inundating your senses allows her to easily penetrate you, pumping into your tight depths with demanding fretfulness");
					if(pc.hasCock()) output(", inexorably making your erect [pc.cockNoun] twitch and bat against your abdomen");
					output(".");
				}
				else
				{
					output(" You close your eyes and sigh as Sera skillfully reaches further down with her tail spade and circles your [pc.clit] with its very tip, making it bulge deliciously.");
					output("\n\n<i>“I don’t believe I said stop, slut.”</i> You bend back to your task, lapping delicately at her balls and she rewards you by penetrating your [pc.vagina] hard, making you spasm slightly. The beguiling relaxation and arousal inundating your senses allows her to easily penetrate you though, pumping into your tight depths with demanding fretfulness, inexorably making you wetter and wetter.");
				}
				if(flags["SERA_INCH_STEAL"] != undefined) output(" A purple tinted memory of how she gained such a long tail surfaces, and you stifle a moan only with difficulty.");
				
				output("\n\nSera fucks into the two of you ruthlessly with her hard, unrelentingly adept appendages, and soon your own cries join those of Jardi’s, every bit as muffled as hers. You flinch as, with a reverberating crack, Sera’s hand lands on the goo girl’s butt. Jardi’s breathy whimper becomes a squawk, and there is a sound like a tap momentarily being turned on.");
				output("\n\n<i>“You don’t know about go’rahns, do you [pc.name]?”</i> Sera says magisterially, slowing her thrusting down for a moment. <i>“I know you can’t see from where you are – sucking my balls and all – but you can hear. Consider this an education.”</i> She speeds up, jouncing into you, pushing herself hard into your caressing warmth. Her hand smacks into Jardi’s other flank.");
				output("\n\n<i>“Who’s your spring, huh snow slut?”</i> Your mistress snarls. Smack. <i>“Who’s your spring melt? Tell me!”</i>");
				output("\n\n<i>“You are mistress, you are,”</i> whimpers Jardi. Her voice sounds thick, as if her mouth is full of drool. Again the gushing sound. You arch your back as Sera pushes her tail deep into you");
				if(pc.hasVagina() && pc.isSquirter()) output(", forcing your cunt to sound like a tap itself");
				output(". You encompass her gonads whole, kneading the dense orbs closely with your sucked in cheeks and tongue.");
				output("\n\n<i>“S’right you cum-colored cocksleeve, I’m your spring melt,”</i> Sera declaims. <i>“So what are you?”</i>");
				output("\n\n<i>“I’m your w - I’m your waterf...”</i> It’s lost as Jardi orgasms. It sounds exactly like somebody tipped a bucket of water onto the bed. Even from where you are, your arms and [pc.chest] are splattered with warm fluid. Every inch of Sera’s spade penetrates you and you clench your arms around her waist as you cum,");
				if(pc.hasVagina()) output(" your [pc.vagina] flexing ecstatically around her tail, your [pc.hips] pumping into it as hard as they can as you surround her overstuffed balls with sucking warmth.");
				else if(pc.hasCock()) output(" your [pc.cock] flexing out streamers of cum onto the bed and your chest, your [pc.hips] pumping into it as hard as they can as you surround her overstuffed balls with sucking warmth.");
				else output(" your [pc.anus] flexing tremulously around her tail, your [pc.hips] pumping into it as hard as they can as you surround her overstuffed balls with sucking warmth.");
				output(" They swell in your mouth as, with a dozen gratified exhalations, she unloads them into the mess of an albino goo-girl in front of you. It’s not quite a simultaneous triple orgasm, but it’s close enough to call it that.");
			}
			else if(response == "pussy")
			{
				output("You slowly crawl forward, the sight of Sera’s ample thighs and behind taking up everything as she slowly buries every inch of her cock into Jardi’s plump cunt. The rahn makes a sing-song gasp when her mistress’s hips touch her behind, seeping fluid from her stuffed tunnel freely. You wrap your hands around the purple, pliant warmth of the succubus’s waist and when she withdraws you bury your face into her neat, gleaming cunt, touching the stubborn bud of her clit with your tongue.");
				output("\n\n<i>“Good [pc.boy],”</i> sighs Sera, withdrawing and flaring her hips further, drawing your mouth into her wet opening. <i>“Lick all around and then – yes!”</i> You lavish saliva on her firm button until it is bulging out of its hood, before sinking your tongue into her moist opening, curling into her warm pink as deep as you can go. She pumps into Jardi slowly at first, letting you get used to the extent of her movements before picking up the pace, bumping back into you brusquely, swathing her female sex around your tongue every time she draws her male sex outwards. Her pussy muscles are incredibly limber; when she thrusts inwards she tightens up hard on your tongue, making it almost impossible to move. Still, with smart movements of your tongue you are able to caress her clit whilst attacking her inner pink vigorously. There is a breathy, muffled moan ahead of you as the demon pumps harder, driven on by your ministrations.");
				output("\n\nSomething warm and blunt drifts down your lower back, questing into the crack of your [pc.butt].");
				if(!pc.hasVagina())
				{
					output(" You tense up for a moment when Sera pushes her tail spade into your [pc.anus], but it is only for a moment; the beguiling relaxation and arousal inundating your senses allows her to easily penetrate you, pumping into your tight depths with demanding fretfulness");
					if(pc.hasCock()) output(", inexorably making your erect [pc.cockNoun] twitch and bat against your abdomen");
					output(".");
				}
				else
				{
					output(" You close your eyes and sigh as Sera skillfully reaches further down with her tail spade and circles your [pc.clit] with its very tip, making it bulge deliciously.");
					output("\n\n<i>“I don’t believe I said stop, slut.”</i> You bend back to your task, lapping delicately at her pussy and she rewards you by penetrating your own [pc.vagina] hard, making you spasm slightly. The beguiling relaxation and arousal inundating your senses allows her to easily penetrate you though, pumping into your tight depths with demanding fretfulness, inexorably making you wetter and wetter.");
				}
				if(flags["SERA_INCH_STEAL"] != undefined) output(" A purple tinted memory of how she gained such a long tail surfaces, and you stifle a moan only with difficulty.");
				
				output("\n\nSera fucks into the two of you ruthlessly with her hard, unrelentingly adept appendages, and soon your own cries join those of Jardi’s, every bit as muffled as hers. You flinch as, with a reverberating crack, Sera’s hand lands on the goo girl’s butt. Jardi’s long, breathy whimper becomes a squawk, and there is a sound like a tap being turned on momentarily.");
				output("\n\n<i>“You don’t know about go’rahns, do you [pc.name]?”</i> Sera says magisterially, slowing her thrusting down for a moment. <i>“I know you can’t see from where you are – face full of my pussy and all – but you can hear. Consider this an education.”</i> She speeds up, jouncing into you, penetrating herself hard on your tongue. Her hand smacks into Jardi’s other flank.");
				output("\n\n<i>“Who’s your spring, huh snow slut?”</i> Your mistress snarls. Smack. <i>“Who’s your spring melt? Tell me!”</i>");
				output("\n\n<i>“You are mistress, you are,”</i> whimpers Jardi. Her voice sounds thick, as if her mouth is full of drool. Again the gushing sound. You arch your back as Sera pushes her tail deep into you");
				if(pc.hasVagina() && pc.isSquirter()) output(", forcing your cunt to sound like a tap itself");
				output(". Urgently you focus your attention on your mistress’s cunt, delving into her wet tunnel as far as you can.");
				output("\n\n<i>“S’right you cum-colored cocksleeve, I’m your spring melt,”</i> Sera declaims. <i>“So what are you?”</i>");
				output("\n\n<i>“I’m your w - I’m your waterf...”</i> It’s lost as Jardi orgasms. It sounds exactly like somebody tipped a bucket of water onto the bed. Even from where you are, your arms and [pc.chest] are splattered with warm fluid. Every inch of Sera’s spade penetrates you and you clench your arms around her waist as you cum,");
				if(pc.hasVagina()) output(" your [pc.vagina] flexing ecstatically around her tail, your [pc.hips] pumping into it as hard as they can as you bury every inch of your [pc.tongue] into her pussy.");
				else if(pc.hasCock()) output(" your [pc.cock] flexing out streamers of cum onto the bed and your chest, your [pc.hips] pumping into it as hard as they can as you bury every inch of your [pc.tongue] into her pussy.");
				else output(" your [pc.anus] flexing tremulously around her tail, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her pussy.");
				output(" Your mistress’s buttocks slap into you as, with a dozen gratified exhalations, she completely unloads her over-stuffed balls into the mess of an albino goo-girl in front of you, her pussy clenching down on your tongue and glazing your face liberally with lubricant. It’s not quite a simultaneous triple orgasm, but it’s pretty close.");
			}
			else if(response == "ass")
			{
				output("You slowly crawl forward, the sight of Sera’s ample thighs and behind taking up everything as she slowly buries every inch into Jardi’s plump cunt. The rahn makes a sing song gasp when her mistress’s hips touch her behind, seeping fluid from her stuffed tunnel freely. You wrap your hands around the purple, pliant warmth of the succubus’s waist and when she withdraws you bury your face between her soft butt-cheeks, touching the tight pucker of her rose with your [pc.tongue].");
				output("\n\n<i>“Give a [pc.boy] a chance to lick my pussy and [pc.he] chooses to lick my ass,”</i> sighs Sera in mocking exasperation, withdrawing and flaring her hips further, drawing your mouth into her crack. <i>“Says a lot about you. Lap all around it then you nasty whore, make it nice and soft – mmm, that’s it – then get your tongue up in there. I want to feel it deep when I cum into this bitch.”</i> You lavish saliva on her sphincter, lubing and loosening it sufficiently for you to penetrate into her hot tunnel, reaching inside as far as you can, your [pc.lips] pressing deep into her ass. She pumps into Jardi slowly at first, letting you get used to her recede and extent, before picking up the pace, bumping back into you brusquely, her flawless butt-cheeks flapping into your face energetically. When she thrusts inwards she tightens up hard on your tongue, making it almost impossible to move. Nonetheless, after curling downwards you feel something like a hard ball against your tip which makes Sera crow with glee when you bump it. There is a breathy, muffled moan ahead of you as the succubus thrusts harder, driven on by your ministrations.");
				output("\n\nSomething warm and blunt drifts down your lower back, questing into the crack of your [pc.butt].");
				if(!pc.hasVagina())
				{
					output(" You tense up for a moment when Sera pushes her tail spade into your [pc.anus], but it is only for a moment; the beguiling relaxation and arousal inundating your senses allows her to easily penetrate you, pumping into your tight depths with demanding fretfulness");
					if(pc.hasCock()) output(", inexorably making your erect [pc.cockNoun] twitch and bat against your abdomen");
					output(".");
				}
				else
				{
					output(" You close your eyes and sigh as Sera skillfully reaches further down with her tail spade and circles your [pc.clit] with its very tip, making it bulge deliciously.");
					output("\n\n<i>“I don’t believe I said stop, slut.”</i> You bend back to your task, lapping delicately at her anus and she rewards you by penetrating your [pc.vagina] hard, making you spasm slightly. The beguiling relaxation and arousal inundating your senses allows her to easily penetrate you though, pumping into your tight depths with demanding fretfulness, inexorably making you wetter and wetter.");
				}
				if(flags["SERA_INCH_STEAL"] != undefined) output(" A purple tinted memory of how she gained such a long tail surfaces, and you stifle a moan only with difficulty.");
				
				output("\n\nSera fucks into the two of you ruthlessly with her hard, unrelentingly adept appendages, and soon your own cries join those of Jardi’s, every bit as muffled as hers. Your head jerks as, with a reverberating crack, Sera’s hand lands on the goo girl’s butt. Jardi’s long, breathy whimper becomes a squawk, and there is a sound like a tap being turned on momentarily.");
				output("\n\n<i>“You don’t know about go’rahns, do you [pc.name]?”</i> Sera says magisterially, slowing her thrusting down for a moment. “I know you can’t see from where you are – licking my butt and all – but you can hear. Consider this an education.”</i> She speeds up, jouncing into you, penetrating herself hard on your tongue. Her hand slams into Jardi’s other flank.");
				output("\n\n<i>“Who’s your spring, huh snow slut?”</i> Your mistress snarls. Smack. <i>“Who’s your spring melt? Tell me!”</i>");
				output("\n\n<i>“You are mistress, you are,”</i> whimpers Jardi. Her voice sounds thick, as if her mouth is full of drool. Again the gushing sound. You arch your back as Sera pushes her tail deep into you");
				if(pc.hasVagina() && pc.isSquirter()) output(", forcing your cunt to sound like a tap itself");
				output(". Urgently you focus your attention on your mistress’s asshole, searching in deep to tongue at her prostate.");
				output("\n\n<i>“S’right you cum-colored cocksleeve, I’m your spring melt,”</i> Sera declaims. <i>“So what are you?”</i>");
				output("\n\n<i>“I’m your w - I’m your waterf...”</i> It’s lost as Jardi orgasms. It sounds exactly like somebody tipped a bucket of water onto the bed. Even from where you are, your arms and [pc.chest] are splattered with warm fluid. Every inch of Sera’s spade penetrates you and you clench your arms around her waist as you cum,");
				if(pc.hasVagina()) output(" your [pc.vagina] flexing ecstatically around her tail, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her ass.");
				else if(pc.hasCock()) output(" your [pc.cock] flexing out streamers of cum onto the bed and your chest, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her ass.");
				else output(" your [pc.anus] flexing tremulously around her tail, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her ass.");
				output(" Your mistress’s full buttocks slap into your face as, with a dozen gratified exhalations, she completely unloads her over-stuffed balls into the mess of an albino goo-girl in front of you. It’s not quite a simultaneous triple orgasm, but it’s pretty close.");
			}
			output("\n\nWhen it is all over, Sera collapses onto the sheets, shifting herself away from the massive wet patch your frantic threesome has left. As she does so she throws an arm around both you and Jardi, taking you with her, drawing you into the warmth of her soft, sweat-dappled breasts as she sinks into the pillows.");
			output("\n\n<i>“My");
			if(pc.mfn("m", "f", "n") != "m") output(" girls");
			else output(" boy and girl");
			output(",”</i> she croons, looking down at the two of you with deep, avaricious satisfaction. Jardi, who looks thinner and utterly drained, doesn’t seem to have the strength to do anything but hug her back. It’s unusual to see your hyper-sexed mistress look anything but agitated so you savor the moment; press into her soft boob and doze in this strange, shadowy room for a few spaced out minutes.");
			output("\n\nEventually she shoos you off with a throaty laugh and a wave of her claw. You quickly");
			if(!pc.isNude()) output(" re-dress and");
			output(" head back out to the shop floor: the real world, or something approaching it. Jardi wiggles her fingers at you, smiling bashfully as she leaves. Standing here now, it’s difficult to believe anything of what just happened... if it wasn’t for a throbbing afterglow and the taste of perfumed smoke in your mouth.");
			
			processTime(35);
		}
	}
	// Repeat
	else
	{
		if(response == "jardis")
		{
			showBust("SERA", "JARDI");
			
			output("<i>“Mistress.”</i>");
			output("\n\nSera looks down at you from atop her stool silently, tapping her nails on the counter. She looks like she’s waiting for something. What that might be occurs to you at the exact moment the shop door beeps.");
			output("\n\n<i>“I won’t be late again mistress, I sw- oh.”</i> The purple dominatrix eats you and Jardi up with her eyes for a few moments, a predatory smile on her face, then without a word gets up and saunters into the back, slapping her butt cheek lightly with her tail as she does.");
			if(!wearingSeraCollar())
			{
				output(" You take a deep breath and offer your hand to the albino goo girl; she as ever takes it with a tremulous red smile. Together you head down the corridor and into the smoky, spacey gloom of Sera’s bedroom.");
				output("\n\n<i>“I thought the hand-holding thing would stop being adorable but it never does,”</i> murmurs the tall, dusky figure lounging at the head of the bed, twisting a hookah pipe. <i>“I’m going to have to look into getting you two matching collars.”</i> Brilliant, inhuman eyes consider you from across the room. <i>“Here.”</i>");
			}
			else
			{
				output("\n\n<i>“Oh hey, you got one too!”</i> Jardi’s shy gaze has drifted down to your neck. You realize that she’s got a slim band of seamless blue steel running around her own, evenly set with little white gemstones. Like snow crystals, perhaps. <i>“Yours has got such a pretty blue stone, though. I guess they’re both...”</i> A small, breathy gasp escapes the rahn’s mouth, and she squirms slightly, squeezing her thighs together. <i>“I guess they’ve got different... oh Void...”</i>");
				output("\n\n<i>“Don’t keep me waiting.”</i> Sera’s command husks its way up the hall. Jardi grips your hand and almost yanks you towards the back door.");
				output("\n\n<i>“I thought the hand-holding thing would stop being adorable but it never does,”</i> murmurs the tall, dusky figure lounging at the head of the bed, twisting a hookah pipe. “All collared up now, as promised.” Brilliant, inhuman eyes consider you from across the room. <i>“Here.”</i>");
			}
			output("\n\nThe memory of the things you have done in here combine with the dense ambience to make you feel open, pliant, accepting and sensitive before you’ve even gotten to Sera’s proffered nozzle and sucked in the hot, perfumed air. You close your eyes and let it permeate through you, making your pores open and the blood rise to the surface of your skin, warmth sinking down to your groin");
			if(pc.hasGenitals())
			{
				output(",");
				if(pc.hasCock()) output(" your [pc.cock] engorging");
				if(pc.isHerm()) output(" and");
				if(pc.hasVagina()) output(" your [pc.vagina] puffing up");
			}
			output("...");
			output("\n\nFeeling intensely relaxed and blissful, you don’t need your mistress to tell you to take a second pull, holding it deep within you as you turn and crawl over to Jardi. She doesn’t resist when you put your hand around her gooey head and push your lips against hers tenderly, hums happily as she opens her mouth to kiss you back, allowing you to channel the perfumed smoke into her. You slide your lips over hers for a while longer, enjoying the beautiful warm give of this creature, before gently parting. The pale goo girl looks at you dozily as her pupils dilate, a red, amorous smile slowly spreading across her glistening face.");
			output("\n\n<i>“Good,”</i> husks Sera. She’s lying back against the bed frame, clutching her turgid cock with one hand and toying with her gleaming pussy with the other. <i>“Now take off");
			if(!pc.isNude()) output(" each other’s");
			else output(" her");
			output(" clothes. Enjoy yourselves");
			if(flags["SERA_IN_JARDI_THREESOME"] == undefined) output(" like an owned pair of sluts should");
			output(".");
			if(flags["SERA_IN_JARDI_THREESOME"] == undefined) output(" Not too much, though. I’m the one who’s going to make you two cum.");
			output("”</i> You slide off Jardi’s blouse, undo her bra slowly, and when her pretty, petite breasts are exposed engulf a nipple with your mouth.");
			if(!pc.isNude()) output(" Her hands slide beneath your [pc.gear], exploring and touching you with her pleasantly moist digits as she unclasps and unwraps you as you do the same for her, unbuttoning her blouse, exposing her pretty, petite breasts, engulfing a nipple as you do. She coos as you continue to work, slowly divesting her of her slacks and pink panties.");
			else output(" With your clothes already long gone the goo-girl has nothing to do but coo and slide her pleasantly moist hands down your frame, exploring you as you slowly divest her of her slacks and pink panties.");
			output("\n\nJardi’s naked, gooey flesh is delightful to touch, cusp and sink your fingers and tongue into, a hot, human-shaped blancmange which sighs and gasps when you touch her erogenous areas, and by the way she eagerly reciprocates she finds your body equally enjoyable. She straddles your waist with her slim thighs, rotating them gently as you sink your fingers into her sweltering pussy, passionately snogging you, her long tongue reaching deeper into your mouth the deeper you probe into her wet pussy.");
			output("\n\nPanting slightly, she pulls out and descends to your [pc.chest]. You place your hands behind you and exhale long and low as she slathers her tongue over first one [pc.nipple] then the next,");
			if(pc.hasCuntNipples() || pc.hasLipples()) output(" making them bead before penetrating them with her delightfully long, drooling muscle, humming happily as she laps at the pink insides of your pussy breasts");
			else output(" the gentle, insistence of her mouth making them stand out, keenly erect");
			output(".");
			if(pc.isNaga()) output(" You slither your coils onto the bed and slowly wrap them around the goo-girl; she runs her hands over your smooth scales as they inundate her, blissed out, and gladly opens her mouth when you gently poke it with your tip. You smile dozily as she envelopes your tail end in sucking balm.");
			if(pc.hasCock()) output(" Her own hand descends to your [pc.cock] and envelopes it, goo swaddling that mushily milks you, making you achingly hard. The desire to push forward and penetrate this lissom, willing girl is almost unbearable, but your mistress’s words echo in your head, holding you back and just that, being denied by your own obedience makes it even hotter, your cock straining to Jardi’s teasing touch.");
			else if(pc.hasVagina())
			{
				output(" Her own hand descends to your mound, traces your labia and then quests into your [pc.vagina]. She is able to caress your [pc.clit] with her thumb whilst penetrating you deep, rubbing your walls with pulsing jelly. The desire to thrust your [pc.hips] into her hand and get off to what this lissom, generous girl is doing is almost unbearable – but you know your mistress wouldn’t want that, she wants you kept on the edge, so you keep your movements slow. Just that, being denied by your own obedience makes you even hotter, your pussy");
				if(pc.isSquirter()) output(" streaming");
				else output(" dripping");
				output(" to Jardi’s teasing touch.");
			}
			processTime(25 + rand(11));
			var lustC2:Number = 15;
			if(pc.hasCock()) lustC2 += 15;
			if(pc.hasVagina()) lustC2 += 15;
			pc.changeLust(lustC2);
			clearMenu();
			addButton(0, "Next", seraSexXXXJardiThreesome, "hookah");
			return;
		}
		else if(response == "hookah")
		{
			showBust("SERA_NUDE", "JARDI_NUDE");
			
			output("Your sighs, kisses and licks are overlain by the heavy sound of Sera’s breathing and the shifting, wet sound of her masturbation as she watches you. <i>“And some people pay for porn,”</i> you think you hear her groan at one point. Making out with this slim, tender rahn under the sensitizing effects of the room and smoke would be wonderfully pleasant whatever the case, but the fact it’s done for your mistress, for her own viewing pleasure makes it overwhelmingly erotic.");
			output("\n\nWhen you clasp Jardi’s hands and kiss her deeply again, crouched opposite you, Sera makes her move. She shifts over and lays her hand behind each of your heads, kneeling over you. You continue to curl your tongue around Jardi’s, confused for a moment – until a musky, foot long prick slides in front of your lips from the side.");
			output("\n\n<i>“Keep going dears,”</i> sighs the demon, clasping your heads firmly and moving her hips slowly, gliding you and Jardi’s lip-lock up and down her thick cock. You open your mouth wide and feel the goo-girl’s soft, red mouth on the other side of the veiny hardness shifting between you. With a bit of effort it’s possible for the two of you to continue mingling your tongues and lips whilst Sera runs all twelve inches of her sex through your joining, it just requires you to open your mouths quite wide, make sloppier and needier noises than you were before. Jardi’s hands tighten around yours when Sera ends by sliding all the way back so her pre-cum beading bulb is between you; your body throbbing with arousal and acquiescent bliss, you join the goo girl in lavishing it with your tongue.");
			output("\n\nSera’s breath is ragged as she withdraws and singles out Jardi, her hand brushing her breasts as she turns her around and firmly presses her head into the duvet, exposing her tight round ass and oozing goo pussy, rose with arousal. She slides her bulging cock down the crack of her behind and teases her entrance with it; the goo girl’s muffled whimper travels to you through the sheets. Sera looks over your shoulder at you, her yellow eyes livid in the gloom.");
			// Cock, less than 6 inches:
			if(pc.hasCock() && pc.biggestCockLength() < 6)
			{
				output(" Her teeth gleam as she sees how eagerly erect your toy-like [pc.boy] cock is.");
				output("\n\n<i>“I’m gonna touch her and make her cry out in ways you can’t, sissy.”</i> She flares her hips as she gently dips into Jardi’s seeping vagina, displaying her purple rear to you – her bloated balls, wet pussy, and large, round ass. <i>“Since you did such a good job of warming her up for me, though... I will leave it up to you how you use your mouth to please me as I do.”</i>");
			}
			// Otherwise:
			else output(" Her teeth gleam as she flares her hips to dip into Jardi’s seeping vagina, displaying her rear to you - her bloated balls, wet pussy, and large, round ass. <i>“Since you did such a good job of warming this slut up for the good, hard fucking I’m gonna give her...I will leave it up to you how you use your mouth to please me as I do.”</i>");
			
			processTime(10);
			var lustC3:Number = 5;
			if(pc.hasCock()) lustC3 += 5;
			if(pc.hasVagina()) lustC3 += 5;
			pc.changeLust(lustC3);
			// [Balls] [Pussy] [Ass]
			clearMenu();
			addButton(0, "Balls", seraSexXXXJardiThreesome, "balls");
			addButton(1, "Pussy", seraSexXXXJardiThreesome, "pussy");
			addButton(2, "Ass", seraSexXXXJardiThreesome, "ass");
			return;
		}
		else if(response == "balls" || response == "pussy" || response == "ass")
		{
			showBust("SERA_NUDE", "JARDI_NUDE");
			
			if(response == "balls")
			{
				output("You slowly crawl forward, the sight of Sera’s ample thighs and behind taking up everything as she slowly buries every inch into Jardi’s plump cunt. The rahn makes a sing song gasp when her mistress’s hips touch her behind, seeping fluid from her stuffed tunnel freely. You wrap your hands around the purple, pliant warmth of the succubus’s waist and when she withdraws you envelope one of her bulging testicles in your mouth. Equal parts mistress musk and salt saturates your [pc.tongue], sending arousal wiring down to your [pc.groin].");
				output("\n\n<i>“Oh, that’s good,”</i> Sera whispers. <i>“Use your tongue. Yes!”</i> She practically sings it when you gently compress your cheeks around the sensitive orb in your mouth. <i>“You should feel what this filthy [pc.boy]-slut is doing, Jardi,”</i> groans the demon. <i>“[pc.He]’s going to make me cum a fucking ocean into you. Now the other one,”</i> she orders with a stern flourish. You are too under the influence of the room and her to do anything other; you shift your [pc.lips] across her dipping and rising scrotum to suck at her other ball, gently lapping at it as her round ass rises and recedes, buried in the white mound ahead of you.");
				output("\n\nShe pumps into Jardi slowly at first, letting you get used to the extent of her movements, before picking up the pace, bumping back into you brusquely, making you move your neck in order to continue moving your lips over her cum factories. With every inward thrust they seem to tighten and thicken as they prepare their load. There is a breathy, muffled moan as the succubus thrusts harder, driven on by your ministrations.");
				output("\n\nSomething warm and blunt drifts down your lower back, questing into the crack of your [pc.butt].");
				if(!pc.hasVagina())
				{
					output(" You tense up for a moment when Sera pushes her tail spade into your [pc.anus], but it is only for a moment; the beguiling relaxation and arousal inundating your senses allows her to easily penetrate you, pumping into your tight depths with demanding fretfulness");
					if(pc.hasCock()) output(", inexorably making your erect [pc.cockNoun] twitch and bat against your abdomen");
					output(".");
				}
				else
				{
					output(" You close your eyes and sigh as Sera skillfully reaches further down with her tail spade and circles your [pc.clit] with its very tip, making it bulge deliciously.");
					output("\n\n<i>“I don’t believe I said stop, slut.”</i> You bend back to your task, lapping delicately at her balls and she rewards you by penetrating your [pc.vagina] hard, making you spasm slightly. The beguiling relaxation and arousal inundating your senses allows her to easily penetrate you though, pumping into your tight depths with demanding fretfulness, inexorably making you wetter and wetter.");
				}
				if(flags["SERA_INCH_STEAL"] != undefined) output(" A purple tinted memory of how she gained such a long tail surfaces, and you stifle a moan only with difficulty.");
				
				output("\n\nSera fucks into the two of you ruthlessly with her hard, unrelentingly focused appendages, and soon your own cries join those of Jardi’s, every bit as muffled as hers. Your head jerks as, with a reverberating crack, Sera’s hand lands on the goo girl’s butt. Jardi’s long, breathy whimper becomes a squawk, and there is a sound like a tap being turned on momentarily. The succubus speeds up, jouncing into you, penetrating herself hard on your tongue. Her hand smacks into Jardi’s other flank.");
				output("\n\n<i>“Who’s your spring, huh snow slut?”</i> Your mistress snarls. Smack. <i>“Who’s your spring melt? Tell me!”</i>");
				output("\n\n<i>“You are mistress, you are,”</i> whimpers Jardi. Her voice sounds thick, as if her mouth is full of drool. Again the gushing sound. You arch your back as Sera pushes her tail deep into you");
				if(pc.hasVagina() && pc.isSquirter()) output(", forcing your cunt to sound like a tap itself");
				output(". You encompass her gonads whole in return, kneading the dense orbs closely with your sucked in cheeks and tongue.");
				output("\n\n<i>“S’right you cum-colored cocksleeve, I’m your spring melt,”</i> Sera declaims. <i>“So what are you?”</i>");
				output("\n\n<i>“I’m your w - I’m your waterf...”</i> It’s lost as Jardi orgasms. It sounds exactly like somebody tipped a bucket of water onto the bed. Even from where you are, your arms and [pc.chest] are splattered with warm fluid. Every inch of Sera’s spade penetrates you and you clench your arms around her waist as you cum,");
				if(pc.hasVagina()) output(" your [pc.vagina] flexing ecstatically around her tail, your [pc.hips] pumping into it as hard as they can as you surround her overstuffed balls with sucking warmth.");
				else if(pc.hasCock()) output(" your [pc.cock] flexing out streamers of cum onto the bed and your chest, your [pc.hips] pumping into it as hard as they can as you surround her overstuffed balls with sucking warmth.");
				else output(" your [pc.anus] flexing tremulously around her tail, your [pc.hips] pumping into it as hard as they can as you surround her overstuffed balls with sucking warmth.");
				output(" They swell in your mouth as, with a dozen gratified exhalations, she unloads them into the mess of an albino goo-girl in front of you. It’s not quite a simultaneous triple orgasm, but it’s close enough to call it that.");
			}
			else if(response == "pussy")
			{
				output("You slowly crawl forward, the sight of Sera’s ample thighs and behind taking up everything as she slowly buries every inch into Jardi’s plump cunt. The rahn makes a sing-song gasp when her mistress’s hips touch her behind, seeping fluid from her stuffed tunnel freely. You wrap your hands around the purple, pliant warmth of the succubus’s waist and when she withdraws you bury your face into her neat, gleaming cunt, touching the stubborn bud of her clit with your tongue.");
				output("\n\n<i>“Good [pc.boy],”</i> sighs Sera, withdrawing and flaring her hips further, drawing your mouth into her wet opening. <i>“Lick all around and then – yes!”</i> You lavish saliva on her firm button until it is bulging out of its hood, before sinking your tongue into her moist opening, curling into her warm pink as deep as you can go. She pumps into Jardi slowly at first, letting you get used to the extent of her movements before picking up the pace, bumping back into you brusquely, your tongue swallowed whole by her female sex every time she draws her male sex outwards. Her pussy muscles are incredibly limber; when she thrusts inwards she tightens up hard on your tongue, making it almost impossible to move. Still, with smart movements of your tongue you are able to caress her clit whilst attacking her inner pink vigorously. There is a breathy, muffled moan ahead of you as the succubus pumps harder, driven on by your ministrations.");
				output("\n\nSomething warm and blunt drifts down your lower back, questing into the crack of your [pc.butt].");
				if(!pc.hasVagina())
				{
					output(" You tense up for a moment when Sera pushes her tail spade into your [pc.anus], but it is only for a moment; the beguiling relaxation and arousal inundating your senses allows her to easily penetrate you, pumping into your tight depths with demanding fretfulness");
					if(pc.hasCock()) output(", inexorably making your erect [pc.cockNoun] twitch and bat against your abdomen");
					output(".");
				}
				else
				{
					output(" You close your eyes and sigh as Sera skillfully reaches further down with her tail spade and circles your [pc.clit] with its very tip, making it bulge deliciously.");
					output("\n\n<i>“I don’t believe I said stop, slut.”</i> You bend back to your task, lapping delicately at her pussy and she rewards you by penetrating your own [pc.vagina] hard, making you spasm slightly. The beguiling relaxation and arousal inundating your senses allows her to easily penetrate you though, pumping into your tight depths with demanding fretfulness, inexorably making you wetter and wetter.");
				}
				if(flags["SERA_INCH_STEAL"] != undefined) output(" A purple tinted memory of how she gained such a long tail surfaces, and you stifle a moan only with difficulty.");
				
				output("\n\nSera fucks into the two of you ruthlessly with her hard, unrelentingly focused appendages, and soon your own cries join those of Jardi’s, every bit as muffled as hers. Your head jerks as, with a reverberating crack, Sera’s hand lands on the goo girl’s butt. Jardi’s long, breathy whimper becomes a squawk, and there is a sound like a tap being turned on momentarily. The succubus speeds up, jouncing into you, penetrating herself hard on your tongue. Her hand smacks into Jardi’s other flank.");
				output("\n\n<i>“Who’s your spring, huh snow slut?”</i> Your mistress snarls. Smack. <i>“Who’s your spring melt? Tell me!”</i>");
				output("\n\n<i>“You are mistress, you are,”</i> whimpers Jardi. Her voice sounds thick, as if her mouth is full of drool. Again the gushing sound. You arch your back as Sera pushes her tail deep into you");
				if(pc.hasVagina() && pc.isSquirter()) output(", forcing your cunt to sound like a tap itself");
				output(". Urgently you focus your attention on your mistress’s cunt, delving into her wet tunnel as far as you can.");
				output("\n\n<i>“S’right you cum-colored cocksleeve, I’m your spring melt,”</i> Sera declaims. <i>“So what are you?”</i>");
				output("\n\n<i>“I’m your w - I’m your waterf...”</i> It’s lost as Jardi orgasms. It sounds exactly like somebody tipped a bucket of water onto the bed. Even from where you are, your arms and [pc.chest] are splattered with warm fluid. Every inch of Sera’s spade penetrates you and you clench your arms around her waist as you cum,");
				if(pc.hasVagina()) output(" your [pc.vagina] flexing ecstatically around her tail, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her pussy.");
				else if(pc.hasCock()) output(" your [pc.cock] flexing out streamers of cum onto the bed and your chest, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her pussy.");
				else output(" your [pc.anus] flexing tremulously around her tail, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her pussy.");
				output(" Your mistress’s buttocks slap into you as, with a dozen gratified exhalations, she completely unloads her over-stuffed balls into the mess of an albino goo-girl in front of you, her pussy clenching down on your tongue and glazing your face liberally with lubricant. It’s not quite a simultaneous triple orgasm, but it’s pretty close.");
			}
			else if(response == "ass")
			{
				output("You slowly crawl forward, the sight of Sera’s ample thighs and behind taking up everything as she slowly buries every inch into Jardi’s plump cunt. The rahn makes a sing song gasp when her mistress’s hips touch her behind, seeping fluid from her stuffed tunnel freely. You wrap your hands around the purple, pliant warmth of the succubus’s waist and when she withdraws you bury your face between her soft butt-cheeks, touching the tight pucker of her rose with your tongue.");
				output("\n\n<i>“Give a [pc.boy] a chance to lick my pussy and [pc.he] chooses to lick my ass,”</i> sighs Sera in mocking exasperation, withdrawing and flaring her hips further, drawing your mouth into her crack. <i>“Says a lot about you. Lap all around it then you nasty whore, make it nice and soft – mmm, that’s it – then get your tongue up in there. I want to feel it on my prostate when I cum into this bitch.”</i> You lavish saliva on her sphincter, lubing and loosening it sufficiently for you to penetrate into her hot tunnel, reaching inside as far as you can, your [pc.lips] pressing deep into her ass. She pumps into Jardi slowly at first, letting you get used to the extent of her movements before picking up the pace, bumping back into you brusquely, her flawless butt-cheeks flapping into your face energetically. When she thrusts inwards she tightens up hard on your tongue, making it almost impossible to move. Nonetheless, after curling downwards you feel something like a hard ball against your tip which makes Sera crow with glee when you bump it. There is a breathy, muffled moan ahead of you as the succubus thrusts harder, driven on by your ministrations.");
				output("\n\nSomething warm and blunt drifts down your lower back, questing into the crack of your [pc.butt].");
				if(!pc.hasVagina())
				{
					output(" You tense up for a moment when Sera pushes her tail spade into your [pc.anus], but it is only for a moment; the beguiling relaxation and arousal inundating your senses allows her to easily penetrate you, pumping into your tight depths with demanding fretfulness");
					if(pc.hasCock()) output(", inexorably making your erect [pc.cockNoun] twitch and bat against your abdomen");
					output(".");
				}
				else
				{
					output(" You close your eyes and sigh as Sera skillfully reaches further down with her tail spade and circles your [pc.clit] with its very tip, making it bulge deliciously.");
					output("\n\n<i>“I don’t believe I said stop, slut.”</i> You bend back to your task, lapping delicately at her anus and she rewards you by penetrating your [pc.vagina] hard, making you spasm slightly. The beguiling relaxation and arousal inundating your senses allows her to easily penetrate you though, pumping into your tight depths with demanding fretfulness, inexorably making you wetter and wetter.");
				}
				if(flags["SERA_INCH_STEAL"] != undefined) output(" A purple tinted memory of how she gained such a long tail surfaces, and you stifle a moan only with difficulty.");
				
				output("\n\nSera fucks into the two of you ruthlessly with her hard, unrelentingly focused appendages, and soon your own cries join those of Jardi’s, every bit as muffled as hers. Your head jerks as, with a reverberating crack, Sera’s hand lands on the goo girl’s butt. Jardi’s long, breathy whimper becomes a squawk, and there is a sound like a tap being turned on momentarily. The succubus speeds up, jouncing into you, penetrating herself hard on your tongue. Her hand smacks into Jardi’s other flank.");
				output("\n\n<i>“Who’s your spring, huh snow slut?”</i> Your mistress snarls. Smack. <i>“Who’s your spring melt? Tell me!”</i>");
				output("\n\n<i>“You are mistress, you are,”</i> whimpers Jardi. Her voice sounds thick, as if her mouth is full of drool. Again the gushing sound. You arch your back as Sera pushes her tail deep into you");
				if(pc.hasVagina() && pc.isSquirter()) output(", forcing your cunt to sound like a tap itself");
				output(". Urgently you focus your attention on your mistress’s asshole, searching in deep to tongue at her prostate.");
				output("\n\n<i>“S’right you cum-colored cocksleeve, I’m your spring melt,”</i> Sera declaims. <i>“So what are you?”</i>");
				output("\n\n<i>“I’m your w - I’m your waterf...”</i> It’s lost as Jardi orgasms. It sounds exactly like somebody tipped a bucket of water onto the bed. Even from where you are, your arms and [pc.chest] are splattered with warm fluid. Every inch of Sera’s spade penetrates you and you clench your arms around her waist as you cum,");
				if(pc.hasVagina()) output(" your [pc.vagina] flexing ecstatically around her tail, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her ass.");
				else if(pc.hasCock()) output(" your [pc.cock] flexing out streamers of cum onto the bed and your chest, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her ass.");
				else output(" your [pc.anus] flexing tremulously around her tail, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her ass.");
				output(" Your mistress’s buttocks slap into you as, with a dozen gratified exhalations, she completely unloads her over-stuffed balls into the mess of an albino goo-girl in front of you. It’s not quite a simultaneous triple orgasm, but it’s pretty close.");
			}
			output("\n\nWhen it is all over, Sera collapses onto the bed, shifting herself away from the massive wet patch your frantic threesome has left. As she does so she curls an arm around both you and Jardi, taking you with her, drawing you into the warmth of her soft, sweat-dappled breasts as she sinks into the pillows.");
			output("\n\n<i>“My");
			if(pc.mfn("m", "f", "n") != "m") output(" girls");
			else output(" boy and girl");
			output(",”</i> she croons, looking down at the two of you with deep, avaricious satisfaction. Jardi, who looks thinner and utterly drained, doesn’t seem to have the strength to do anything but hug her back. It’s unusual to see your hyper-sexed mistress look anything but agitated, so you savor the moment; press into her soft boob and doze in this strange, shadowy room for a few spaced out minutes.");
			output("\n\nEventually she shoos you off with a throaty laugh and a wave of her claw. You quickly");
			if(!pc.isNude()) output(" re-dress and");
			output(" head back out to the shop floor: the real world, or something approaching it. Jardi wiggles her fingers at you, smiling bashfully as she leaves. Standing here now, it’s difficult to believe anything of what just happened... if it wasn’t for a throbbing afterglow and the taste of perfumed smoke in your mouth.");
			
			processTime(25 + rand(11));
		}
	}
	
	pc.orgasm();
	sera.orgasm();
	IncrementFlag("SERA_IN_JARDI_THREESOME");
	clearMenu();
	addButton(0, "Next", seraExitToMain);
}

// Get Ridden
public function seraSexXXXGetRiddenStart():void
{
	var vagIndex:int = -1;
	var cockIndex:int = -1;
	
	if(pc.hasVagina()) vagIndex = rand(pc.totalVaginas());
	if(pc.hasCock()) cockIndex = rand(pc.cockTotal());
	
	seraSexXXXGetRidden([1, vagIndex, cockIndex]);
}
public function seraSexXXXGetRidden(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	showSera(true);
	
	var dildoSize:Number = 300;
	var pageNum:int = arg[0];
	var vagIndex:int = arg[1];
	var cockIndex:int = arg[2];
	
	// Female/Genderless
	if(cockIndex < 0)
	{
		// First
		if(flags["SERA_FACE_RIDE_TRAINING"] == undefined)
		{
			if(pageNum == 1)
			{
				output("<i>“Mistress.”</i>");
				output("\n\n<i>“You’re in luck pet,”</i> Sera purrs. She rises and sashays over to your kneeling form, touching a flawless purple thigh as she runs her claws through your [pc.hair]. <i>“I need my female side tended to today. I’m sure your tender little butthole is glad to hear about that. Unfortunately, you don’t have the common courtesy to have a dick I can ride raw.”</i>");
				// Emasculated:
				if(vagIndex >= 0 && flags["SERA_CREATE_VAG"] != undefined) output(" She raises an eyebrow at you and you blush deeply, your thoughts and hers running the same way. <i>“Perhaps I got a bit carried away when I was reshaping you, hmm?”</i>");
				output(" She sighs and clasps your shoulders, bringing her round, infernal face close to yours.");
				output("\n\n<i>“Don’t fret over it, though. Your mistress thinks of everything.”</i> She reaches over to the counter, plucks a small remote control off it and points it at the front of the shop. The lock clicks and the windows go dark, except for deep blue neon signage on one, blinking on and off. It looks like the glass has turned one way, but... you squint at the sign as Sera continues to rummage around behind you. SNIM 03 NI KCAB – TULS A GNIOD, blears back at you blandly. It’s accompanied by two line figurines, repeating a vigorous action with every second blink. Both the figurines have smiley faces. The one that isn’t on all fours has two curly lines over its head.");
				output("\n\nSomething claps down behind you and you jump. Sera has put her chair down in the center of the room. Tapping impatiently against her thigh is what looks like a long, purple double dildo with a harness built into it halfway down, evidently designed to fuck the wearer whilst they themselves are fucking. One end is relatively modest, a smooth six inches; the other is monstrous, roughly the same size and length as Sera’s dick itself. Only Sera’s doesn’t have round nodules all the way down.");
				output("\n\n<i>“It’s one of my favorite pieces of gear, this,”</i> says Sera lovingly. <i>“So many good features.");
				if(!pc.isNude()) output(" Take your clothes off.");
				output("”</i>");
				if(!pc.isNude()) output(" Slowly you do as she asks, discarding your [pc.gear] onto the floor.");
				output(" You can’t take your eyes off the fearsome piece of equipment as it slowly rises and falls into the succubus’s thigh, making her flesh ripple. It’s clear what end she intends for you, and the thought makes blood rush to your skin. Without instruction you slowly sink down to the floor, spreading your [pc.hips], exposing your");
				if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
				else output(" [pc.anus]");
				output(". Sera laughs to herself softly.");
				output("\n\n<i>“Oh, bitch. So naive. Come sit here.”</i> Confused, you do as she directs, shuffling into the chair so your back is pressed into its two front legs. Your mistress presses her hot palm against your forehead, pushing it back so it is lying on the seat. It is only then, as she brings the double dildo over, the plastic harness slithering onto your face, that you understand.");
				output("\n\n<i>“Oh do be quiet pet,”</i> Sera sighs exasperatedly as your gasp is muffled by a vast amount of thick, bumpy latex. <i>“This is all for your own good and I’m going to be giving you important instructions, so try and keep your cries for mercy to a minimum for once, okay?”</i> The dildo almost completely fills your mouth, touching the front of your throat. You can breathe... just. Air hisses through your nose as Sera buckles your head securely to the seat of the chair, leaving the other half of the strap-on pointing at the ceiling. You stare up at it as Sera clacks away, swaying her hips. The only light in the room now is the flickering candles and the intermittent blare of blue light from the window, but you can make out the logo inscribed on the upper half: VAPUWARE. You reach out and touch it, tracing the words as your tongue moves around the smooth synthetic flesh in your mouth.");
				output("\n\nA pulpy tail spade slaps into the back of your hand. Sera stands over you, smiling cruelly, her curvy form lit by the syncopated stun of cold neon behind her. There are blunt, indistinct objects in her hands.");
				output("\n\n<i>“Put them behind the chair legs.”</i> Slowly, you do as she asks, curling your fingers around the back of them.");
				// >12” inches stolen:
				if(flags["SERA_INCH_STEAL"] >= 12) output(" Sera’s grin splits wider as she steps over your [pc.legs] and wiggles her butt, allowing her extremely long tail to do the work, slithering around your form and the chair to tighten around your wrists, leaving you tied and pressed helpless into the hard wood, your neck bent back helplessly. <i>“Your tax inches in action, sissy,”</i> she breathes.");
				// Otherwise:
				else output(" She bends down and, with a firm click, handcuffs you to the back of the chair. You are left tied and strapped helpless into the hard wood, your neck bent back, your [pc.chest] exposed.");
				if(vagIndex >= 0)
				{
					output(" You give out a muted moan as something warm and thrumming is nestled into the entrance of your vagina. Sera plays with your sensitive [pc.vaginaColor " + vagIndex + "] [pc.vaginaNoun " + vagIndex + "] slowly until your [pc.clit] is bulging well out of its hood before shoving the squat vibrator all the way in to your moistened pussy.");
					pc.cuntChange(vagIndex, dildoSize);
				}
				else
				{
					output(" You cringe but cannot resist as the blunt tip of a cone enters your [pc.anus]; you seize up and writhe slightly as she screws the butt plug in, your entrance stretched, the two insertions pressing into each other through your sensitive walls.");
					pc.buttChange(dildoSize);
				}
				output("\n\n<i>“There we go, dear,”</i> Sera sighs as she sits her warm, purple flesh down north of your collarbone, near the erection she has used your mouth to project vertically over the chair. <i>“Something in all of your slut holes.");
				if(vagIndex < 0) output(" The important ones, anyway.");
				output("”</i> She sidles in closer, holding the back of the chair to lead her moist pussy up your chin, immersing your lower lip with the texture of it. <i>“So even when I’m riding you you’re learning how to take it, nice and hard.”</i> She raises herself up the dildo slowly, sliding it over her visibly bulging clit, sighing as it bends into her wetness before enveloping it with a harsh gasp, sitting down on your face hard.");
				
				processTime(35);
				pc.changeLust(10);
				clearMenu();
				addButton(0, "Next", seraSexXXXGetRidden, [2, vagIndex, cockIndex]);
				return;
			}
			if(pageNum == 2)
			{
				output("The chair creaks briskly as she grasps the back of it and begins to thrust into you, riding her end with rhythmic rotations of her lower body. Her thighs tighten and jounce into your ears, occasionally blocking out all sound but her soft flesh impacting into your head. She seems to have angled the chair back towards her a bit, reducing the strain on your neck, but that’s really the least of the things occupying your attention.");
				if(vagIndex >= 0) output(" The teasing vibrations in your [pc.vagina " + vagIndex + "] shudder against the thick, obdurate plug in your [pc.anus], making you quiver with the intensity of it.");
				else output(" The teasing vibrations in your [pc.anus] shudder through you, making you quiver with the intensity of it.");
				output("\n\nYou grasp the chair legs with your helpless hands as Sera begins to ride you harder, her juices beginning to dribble maddeningly down your cheeks. You are forced to look up at her writhing front, her flat abdomen pushing into your nose, her turgid cock batting against the chair back, her high breasts bouncing with each clench of her thighs. She looks back at you above it all, smiling back exultantly.");
				output("\n\n<i>“Are you sucking, pet?”</i> You try and register disbelief with your eyes. It’s filling your mouth, isn’t it? <i>“You aren’t sucking properly,”</i> she says softly, brushing a nipple as she lays her hand on your brow again. <i>“This harness is designed to let your mistress know when you’re slacking on your blowjob training. WORSHIP that big piece of meat in your mouth. You and I will both know when you’re doing it right.”</i>");
				output("\n\nYou groan slightly, her female musk dense in your nose, and try and do as she asks; hollowing your cheeks to knead the girthy dildo strapped into your face, equally merciless and obdurate PVC boring into you below and the pliant weight of her butt and thighs bouncing into you from above. You are convinced forcing you to do this is simply sadism on the part of Sera – until the thing suddenly shakes slightly in your mouth and she squeals with joy.");
				output("\n\n<i>“You’re getting it, don’t stop, don’t stop!”</i> she cries out, tightening her hips crushingly around your head. Breath whistling through your nose, you attack the obscene gobstopper filling your mouth, running your tongue along its length and shifting your lips around its base. It seems to be glowing with warmth now, and apparently powered by your ministrations, the upper end is now shaking and twisting, elevating Sera’s excitement into a euphoric froth.");
				output("\n\nYou feel battered, dazed and extremely warm as she rides you as hard as she can, clattering and jarring the chair as she growls with guttural enjoyment, smearing your face with her juices as she thrusts down hard. You’d be worried about her breaking it if you weren’t so worried about yourself. Valiantly, you ignore the softness thrashing around your head to surround the synthetic cock with your wet flesh, kneading as vigorously as you can; as best you can tell this causes the other end to begin to shudder violently. Claw-tipped fingers grip your [pc.hair] and hold painfully tight as Sera cums, howling at the ceiling as her pussy seizing up around the ecstatic vibrations you’ve filled it with.");
				output("\n\nYour eyes open wide as you feel the tip of your end bulge. Before you have time to think it suddenly unloads thick, sweet liquid down your gullet. Good grief, what an absolutely disgusting feature! It fills you with... with... you moan, heat sweeping through you as the dildo’s juice hits your stomach, your [pc.nipples] suddenly");
				if(pc.hasCuntNipples() || pc.hasLipples()) output(" wetting themselves deliriously");
				else output(" standing out on end");
				output(". Arousal crowds your mind, blotting out everything, and your own muffled cries join those of your mistress’s as you are pushed to an overwhelming orgasm, thrashing your [pc.legs] around and straining against your bonds as your");
				if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
				else output(" [pc.anus]");
				output(" pulses again and again around the vibrator shoved up it.");
				output("\n\nYou look up at your mistress when you are done, utterly melted. Still embedded on your shared dildo, she grins down at you, radiating satisfaction.");
				output("\n\n<i>“Good, isn’t it?”</i> she whispers. <i>“Suck it good and it will make your mistress cum. Make your mistress cum and it will blow a nice, thick load of aphrodisiac down your throat. So...”</i> She slides her fingers through your [pc.hair] again and shifts slightly, her beading pussy sliding across your [pc.lips]. <i>“Ready for round two?”</i> You answer by opening wide and swallowing the warm, thick prosthetic up to its base, humming happily as you do.");
				output("\n\nBlue light flashes over your strange, conjoined forms as Sera rides you to a second orgasm. It takes her longer to get there this time – she spends a time idly simmering, swivelling her hips tortuously slow in a post-orgasm haze – but as you dutifully suckle your end the vibrations begin to buzz through her again and she fucks into your face with increasing urgency. You accept her soft weight bouncing aggressively onto you, knowing that this is simply a sign your own reward is fast approaching.");
				output("\n\nYou lave the underside of the broad, warm prosthetic closely with your tongue, making succulent smacking sounds as you french it, your drool mingling with your mistress’s juices on your face; you can feel the way this makes the other end thrash like a landed fish. Sera groans harshly, taking your head in her hands again and thrust down hard deliberately again and again. Your coo is drowned out by a fresh deluge of sweet ejaculate, washing away everything but orgasmic bliss as it spreads through you");
				if(vagIndex >= 0) output(", your [pc.vagina " + vagIndex + "] spurting around its insertion as you seize up around it and your butt plug ecstatically.");
				else output(", your [pc.anus] clenching up around its insertion ecstatically.");
				output("\n\nSera pools onto the floor when she’s done, spending a luxurious amount of time regaining her breath and enjoying her haze before returning to you. You slither down next to her when she finally unties you and removes all of your insertions, throbbing with satisfaction, your face glazed with your mistress’s juices. She puts an arm around you and draws you into her musk and heat.");
				output("\n\n<i>“Eventually dear,”</i> she breathes, <i>“I am going to get you so good at this that you’ll get an ‘O’ as sweet and round as your mouth every time I feel the need to empty my balls down your throat. Won’t that be nice?”</i> To your blissed out mind, this sounds like everything you’ve ever wanted.");
				
				processTime(35);
			}
		}
		// Repeat
		else
		{
			if(pageNum == 1)
			{
				output("<i>“Mistress.”</i>");
				output("\n\n<i>“You’re in luck pet,”</i> Sera purrs. <i>“I need my female side tended to today.”</i> Click. The door locks, the windows go dark and the deep blue neon comes on. In its syncopated light you watch Sera stand. <i>“So you know what that means.”</i> You feel a shuddering thrill as you see the object in her hand; a long, asymmetrical double dildo, with a harness halfway down.");
				output("\n\nSera picks up her chair and claps it down in the center of the room. She turns and nods at it with a smirk. She watches, gently tapping the toy into her thigh, flesh gently rippling with each impact as you");
				if(!pc.isNude()) output(" slowly take your [pc.gear] off,");
				output(" crawl across and sit your naked back against its front legs. You sigh shakily as you feel your mistress’s hot palm against your forehead, pushing it back so it is lying on the seat, obediently opening your mouth as the big end of the dildo looms above you. Thick, bumpy synthetic cock s pushed past your [pc.lips]; it almost completely fills your mouth, touching the front of your throat. You can breathe...just. Air hisses through your nose as Sera buckles your head securely to the seat of the chair, leaving the other half of the strap-on pointing at the ceiling. You stare up at it as Sera clacks away, swaying her hips. The only light in the room is the flickering candles and the intermittent blare of blue light from the window. ");
				output("\n\nAs you hear stilettos tapping back towards you, you curl your fingers around the back legs of the chair in preparation. Sera still can’t help flicking her tail across your body, flicking your [pc.nipples] and make you twitch.");
				// >12” inches stolen:
				if(flags["SERA_INCH_STEAL"] >= 12) output(" She steps over your [pc.legs] and wiggles her butt, allowing her extremely long tail to do the work, slithering around your form and the chair to tighten around your wrists, leaving you tied and pressed helpless into the hard wood, your neck bent back helplessly. <i>“Your tax inches in action, sissy,”</i> she breathes.");
				// Otherwise:
				else output(" She bends down and, with a firm click, handcuffs you to the back of the chair. You are left tied and strapped helpless into the hard wood, your neck bent back, your [pc.chest] exposed.");
				output(" You give out a muted moan as something warm and thrumming is nestled into the entrance of your");
				if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
				else output(" [pc.anus]");
				output(". Sera plays with");
				if(vagIndex >= 0)
				{
					output(" your cunt slowly until your [pc.clit] is bulging well out of its hood before shoving the squat vibrator all the way in to your moistened pussy.");
					pc.cuntChange(vagIndex, dildoSize);
				}
				else
				{
					output(" you teasingly. You cringe but cannot resist as the blunt tip of a cone enters your [pc.anus]; you seize up and writhe slightly as she screws the butt plug in, your entrance stretched, the two insertions pressing into each other through your sensitive walls.");
					pc.buttChange(dildoSize);
				}
				output("\n\n<i>“There we go, dear,”</i> Sera sighs as she sits herself down north of your collarbone, near the erection she has forced you to hold with your mouth over the chair. <i>“Something in all of your slut holes.");
				if(vagIndex < 0) output(" The important ones, anyway.");
				output("”</i> She sidles in closer, holding the back of the chair to lead her moist pussy up your chin, immersing your lower lip in the texture of it. You can smell and taste her piquant excitement as she exults in your helpless, bound form. <i>“So even when I’m riding you you’re learning how to take it, deep and hard.”</i> She raises herself up the dildo slowly, sliding it over her visibly bulging clit, sighing as it bends into her wetness before enveloping it with a harsh gasp, sitting down on your face hard.");
				
				processTime(25 + rand(11));
				pc.changeLust(10);
				clearMenu();
				addButton(0, "Next", seraSexXXXGetRidden, [2, vagIndex, cockIndex]);
				return;
			}
			if(pageNum == 2)
			{
				output("The chair creaks briskly as she grasps the back and begins to thrust into you, riding her end with rhythmic rotations of her lower body. Her thighs tighten and jounce into your ears, occasionally blocking out all sound but her soft flesh impacting on your head. She seems to have angled the chair back towards her a bit, reducing the strain on your neck but that’s the least of the things occupying your attention.");
				if(vagIndex >= 0) output(" The teasing vibrations in your [pc.vagina " + vagIndex + "] shudder against the thick, obdurate plug in your [pc.anus], making you quiver with the intensity of it.");
				else output(" The teasing vibrations in your [pc.anus] shudder through you, making you quiver with the intensity of it.");
				output(" You grasp the chair legs with your helpless hands as Sera begins to ride you harder, her juices beginning to dribble maddeningly down your cheeks. You are forced to look up at her writhing front, her flat abdomen pushing into your nose, her turgid cock batting against the chair back, her high breasts bouncing with each clench of her thighs. She looks back at you above it all, smiling back exultantly.");
				output("\n\n<i>“You know what you should be doing, pet. WORSHIP that big piece of meat in your mouth. You and I will both know when you’re doing it right.”</i> You get to work, hollowing your cheeks to suckle at the girthy dildo strapped into your face, working warmth into it as equally merciless and obdurate PVC boring into you below and the pliant weight of her butt and thighs bouncing into you from above. The thing shakes slightly in your mouth and she squeals with joy.");
				output("\n\n<i>“You’re getting it, don’t stop, don’t stop!”</i> she cries out, tightening her hips crushingly around your head. Breath whistling through your nose, you attack the obscene gobstopper filling your mouth, running your tongue along its length and shifting your lips around its base. It seems to be glowing with warmth now, and powered by your ministrations, the upper end is now shaking and twisting, elevating Sera’s excitement into a euphoric froth.");
				output("\n\nYou feel battered, dazed and extremely warm as she rides you as hard as she can, clattering and jarring the chair as she growls with guttural enjoyment, smearing your face with her juices as she thrusts down hard. You’d be worried about her breaking it if you weren’t so worried about yourself. Valiantly, you ignore the thrashing around about your head to surround the synthetic cock with your wet flesh, kneading it as vigorously as you can; as best you can tell this causes the other end to shudder violently. Claw-tipped fingers grip your [pc.hair] and hold painfully tight as Sera cums, howling at the ceiling as her pussy seizing up around the ecstatic vibrations you’ve filled it with. You feel the tip of your end bulge. Blissfully you close your eyes as it unloads thick, sweet liquid down your gullet, moaning as heat sweeps through you when the dildo’s juice hits your stomach. Your [pc.nipples] suddenly stand out on end/wet themselves deliriously and arousal crowds your mind, blotting out everything. Your own muffled cries join those of your mistress’s as you are pushed to an overwhelming orgasm, thrashing your [pc.legs] around and straining against your bonds as your");
				if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
				else output(" [pc.anus]");
				output(" pulses again and again around the vibrator shoved up it.");
				output("\n\nYou look up at your mistress when you are done, utterly melted. Still embedded on your shared dildo, she grins down at you, radiating satisfaction.");
				output("\n\n<i>“Good, isn’t it?”</i> she whispers. <i>“Suck it good and it will make your mistress cum. Make your mistress cum and it will blow a nice, thick load of aphrodisiac down your throat. So...”</i> She slides her fingers through your [pc.hair] again and shifts slightly, her beading pussy sliding across your [pc.lips]. <i>“Ready for round two?”</i> You answer by opening wide and swallowing the warm, thick prosthetic up to its base, humming happily as you do.");
				output("\n\nBlue light flashes over your strange, conjoined forms as Sera rides you to a second orgasm. It takes her longer to get there this time – she spends a time idly simmering, swivelling her hips tortuously slow in a post-orgasm haze – but as you dutifully suckle your end the vibrations begin to buzz through her again and she fucks into your face with increasing urgency. The deep, dirty eroticism of being used like this whilst pleasure is forced into you is compounded by the satisfaction you know you’re providing your mistress; the way she looks down at you from her position of power at you and coos indulgently, the soft weight of her butt and thighs piling and squeezing into you harder and harder, heightens your arousal.");
				output("\n\nYou lave the underside of the broad, warm prosthetic closely with your tongue, making succulent smacking sounds as you french it, your drool mingling with your mistress’s juices on your face; you can dimly feel the way this makes the other end thrash like a landed fish. Sera groans harshly, taking your head in her hands and thrust down deliberately hard again and again. You coo is drowned out by a fresh deluge of sweet ejaculate, washing away everything but orgasmic bliss as it spreads through you,");
				if(vagIndex >= 0) output(" your [pc.vagina] spurting around its insertion as you seize up around it and your butt plug");
				else output(" your [pc.anus] seizing up around its insertion");
				output(" ecstatically.");
				output("\n\nSera pools onto the floor when she’s done, spending a luxurious amount of time regaining her breath and enjoying her haze before return to you. You slither down next to her when she finally unties you and removes all of your insertions, throbbing with satisfaction, your face glazed with your mistress’s juices. She puts an arm around you and draws you into her musk and heat.");
				output("\n\n<i>“Eventually dear,”</i> she breathes, <i>“I am going to get you so good at this that you’ll get an ‘O’ as sweet and round as your mouth every time I feel the need to empty my balls down your throat. Won’t that be nice?”</i> To your blissed out mind, this sounds like everything you’ve ever wanted.");
				
				processTime(25 + rand(11));
			}
		}
		pc.orgasm();
	}
	// Male/Herm
	else
	{
		output("<i>“You’re in luck pet,”</i> Sera purrs. She rises and sashays over to your kneeling form, touching a flawless purple thigh as she runs her claws through your [pc.hair]. <i>“I need my female side tended to today. I’m sure your tender little butthole is glad to hear about that.”</i> She turns around to reach over to the counter, giving you a good look at her trim, bare pussy with its prominent clit, framed by her black harness straps. She retrieves a small remote control and points it at the front of the shop. The lock clicks and the windows go dark, except for deep blue neon signage on one, blinking on and off. It looks like the glass has turned one way, but... you squint at the sign as Sera continues to rummage around behind you. SNIM 03 NI KCAB – TULS A GNIOD, blears back at you blandly. It’s accompanied by two line figurines, repeating a vigorous action with every second blink. Both the figurines have smiley faces. The one that isn’t on all fours has two curly lines over its head.");
		output("\n\nSomething claps down behind you and you jump. Sera has put her chair in the center of the room.");
		output("\n\n<i>“");
		if(!pc.isNude()) output("Take your clothes off and sit.");
		else output("Sit.");
		output("”</i>");
		if(!pc.isNude()) output(" She watches you as you do this, slowly discarding your [pc.gear] before seating yourself.");
		output(" The cold wood makes goosebumps crowd your skin as Sera slowly approaches, swinging her hips exaggeratedly. They stand out even more when a blare of neon light allows you to see what is swinging in one of her hands.");
		output("\n\nShe sits herself down in your lap with a sigh, pushing her pillowy breasts into your front as she reaches behind you. Her slightly spicy, warm scent inundates you as she takes each of your hands and handcuffs them securely to the chair legs. With your arms forced downwards at full stretch your [pc.chest] is helplessly pushed outwards. You try to keep your breathing level as Sera shifts her soft but considerable weight on top of your [pc.hips], gently grazing your throat with her claws, then your [pc.nipples], leading her hands down inexorably to your groin. You exhale slowly as her palm encircles your semi-erect [pc.cockNoun " + cockIndex + "].");
		if(pc.cocks[cockIndex].cLength() < 6) output("\n\n<i>“I’m really going to have to ride you hard in order to get anything out this little thing,”</i> she sighs. If she’s dispirited by the prospect she’s doing a very good job of disguising it. She stares into your eyes gloatingly as she coils you tighter, the smooth dry pressure making you ragingly erect. <i>“May wind up breaking your pelvis I’m gonna squeeze your boy clit so bad. You’re alright with that, right?”</i>");
		else output("\n\n<i>“What a polite and eager beta dick,”</i> she coos. She stares into your eyes gloatingly as she coils you tighter, the smooth dry pressure making you ragingly erect. <i>“Do you try and impress all the naive native girls and guys with this when you’re out on the frontier? I hope you make it clear to them who it really belongs to.”</i>");
		output("\n\nShe flexes her wrist more and more vigorously, drawing your [pc.cock " + cockIndex + "] out in a winch of warm, wringing friction. You open your mouth and grip the chair legs with your trapped hands as your sex bulges and strains to the movement of her hand. You can’t pull away, can’t do anything to stop her, and you can’t stop your orgasm rising upwards... you cry out as something suddenly clamps down tightly around the base of your fierce erection.");
		output("\n\n<i>“There we go,”</i> says Sera briskly, gently flicking your helplessly stiff prick, trapped by the cock ring she has placed at the base of it. She shifts herself forward, encircling your waist with her thick thighs, sliding her arm around your neck, kissing your snared erection with her labia. <i>“It’d be terrible if you came like a spineless sissy the second my pussy touched you, wouldn’t it? It’s good you’ve got your mistress to plan ahead. So she can make use of you again, and again, and again.”</i> So saying, she leads her moistened sex up the sensitive underside of your [pc.cock " + cockIndex + "], and after gently teasing its swollen head for a moment with her entrance, sits down hard, swallowing you whole.");
		output("\n\nShe rides you with luxuriant rolls of her hips, her hot, purple flesh rippling up your bound body with each push, her pussy milking you assiduously. Her fuck-cave is long yet incredibly tight, gloving you easily and clenching every inch. She grips your head between her breasts as she screws you, bending your [pc.cock " + cockIndex + "] backwards in the succulent grip of her sex. You dare enough initiative to shift your head over her pillowy softness to find a hard nipple, surrounding it with your [pc.lips] and lapping at the erect nub; you are rewarded with a pleased, husky growl and a pick up of the pace.");
		output("\n\nSera’s tumescent cock and flat abdomen slap into your tummy, her toned pussy squeezing you almost painfully close with every returning pump of her hips. Melded beneath her you find yourself fretfully pushing upwards into her with the shallow amount of movement available to you, the frenetic sex made unbearably good by your bound state, your back arching as you tense against your handcuffs.");
		output("\n\nShe gasps and then buries her sharp teeth into your shoulder, hips tightening around your waist as her pussy spasms around your [pc.cock " + cockIndex + "], her juices rolling down your [pc.hips]. Dizzy with her scent, warmth and delicious clenching you want nothing more to join her in orgasm, to pack her cunt with your cum, and you desperately rock yourself upwards – to no avail. Whatever she’s clamped around your cock has you well and truly trapped. You are left to roll your eyes and head back as the waves of female flesh roll over you, the exquisite pleasure kneading your manhood contrasting with the pain locked into the soft part of your shoulder, your mistress’s heavy breath hissing out of her nose and down your back.");
		output("\n\nYou are brought out of your stunned state by another pain, more acute and directed, seizing one of your [pc.nipples]. You jerk your head back up to look into Sera’s wicked gaze.");
		output("\n\n<i>“I know what you were trying to do there,”</i> she says in a teasing, lilting voice, domineering cruelty prowling through her relaxed, post-orgasm tones. <i>“And you are a bad pet for attempting it. You cum when your owner says you can. That understood?”</i> She pinches your nipple again, making you spasm; your [pc.cock " + cockIndex + "] still embedded in her wet depths, your sudden jerk of movement makes her coo.");
		output("\n\n<i>“Yes, mistress!”</i>");
		output("\n\n<i>“Good,”</i> Sera murmurs. <i>“Now let’s see if you can make up for your slutty behavior by being an obedient and attentive [pc.boy] toy now.”</i> You groan lowly as she begins to thrust into you again.");
		output("\n\nIn the slow blink of the blue light she rides you insensate, rocking herself to two further highs. You think. It stops mattering to you after a while; there is only your bulging, sensitized cock and her ruthless use of it, her cock ring keeping you singing on edge as surely as the metal around your wrists keeps you secured to the rocking, jerking chair. Whenever you begin to zone out and lose yourself completely to the wringing wetness she plays with your [pc.nipples], making you twitch and spasm in her pussy in a way which is evidently pleasing to her. To get her sharp nails away from your reddened teats you go back to her own nipples, attending to her pert and high breasts with your tongue in a way you hope she will enjoy enough to give you release.");
		output("\n\nShe pauses for one blissful moment a long time later, sliding her fingers");
		if(pc.hasHair()) output(" through");
		else output(" across");
		output(" your [pc.hair] as you suckle her, panting slightly.");
		output("\n\n<i>“End,”</i> she says thickly. Confusion is swiftly overrun by ecstasy as heat suddenly grips the base of your snared dick, vibrations thrumming through it. Your");
		if(pc.balls > 0)
		{
			if(pc.balls == 1) output(" [pc.ball] tightens as your");
			else output(" [pc.balls] tighten as your");
		}
		output(" long denied orgasm begins to rise. Sera’s thighs and pussy pulse around you fervently as she fucks herself to her final high; you jolt upwards with cramped movements in response, elated you are finally going to reach one yourself. Your seed builds as you fly over the point of no return...");
		output("\n\nSomething taps distinctly into your groin, and your heat immediately begins to dissipate. No! God no! You’re already there, your cock is bulgingly full of your seed, and... it’s gone. Slowly, agonisingly, the wonderful, mind-blowing high which has been just out of reach this entire time recedes, like a slowly approaching tide of wine lapping at your toes before ebbing away. On top of you Sera cries out exultingly, her breasts pushing into your [pc.chest] as she grips you tight and reaches it again, her pussy glazing your [pc.hips] as she kneads your useless dick for all it is worth.");
		output("\n\nWhen it is finally over, and she has spent a time regaining herself on your lap, she grins at you lazily and slides off. Still handcuffed to the chair, you can do nothing as she grips your [pc.cock " + cockIndex + "] and carefully points it downwards. You moan long and low as a small waterfall of cum oozes warmly out onto the floor.");
		output("\n\n<i>“There we go,”</i> she says happily. <i>“You served your mistress well, and we got all that nasty spooge out of you. Everyone’s happy, right?”</i> You stare at her dully, soaked in sweat, unable to speak as she removes the cock ring, waggling it teasingly in front of you. The monstrous device is chrome, glowing with a steady, inward red pulse. The demon girl strokes your jaw comfortingly.");
		output("\n\n<i>“Bitches cum from taking, not giving,”</i> she breathes, looking down at you heavy-lidded with carnal satisfaction. Blue light highlights her incredible form in flashes; without the light all you can see are her eyes and phosphorescence. <i>“You should know that by now. Thank your mistress for being kind enough to drain you.”</i> Experience tells you that she is more than capable of simply leaving you here, and your arms are beginning to ache.");
		output("\n\n<i>“Th-thank you, mistress.”</i> White teeth reveal themselves in a wicked grin.");
		output("\n\n<i>“Good [pc.boy].”</i> The handcuffs and chair disappear, and you pool onto the floor, exhausted and reddened with thwarted arousal. You’re still pulling your [pc.gear] back on when the inside lights flick back into being. Sera has gone back to flicking through her touch pad device as if nothing happened... the only difference being the big, contented smile on her face now.");
		
		processTime(35 + rand(11));
		// Cum reset, lust +10
		pc.ballFullness = 0;
	}
	pc.loadInMouth(chars["SERA"]);
	pc.girlCumInMouth(chars["SERA"]);
	pc.changeLust(20);
	sera.orgasm();
	IncrementFlag("SERA_FACE_RIDE_TRAINING");
	clearMenu();
	addButton(0, "Next", seraExitToMain);
}

// Titfuck/Vaginal or Anal + Lucky Dip
public function seraSexXXXTitfuckLuckyDipStart():void
{
	var vagIndex:int = -1;
	var cockIndex:int = -1;
	
	if(pc.hasVagina()) vagIndex = rand(pc.totalVaginas());
	if(pc.hasCock()) cockIndex = rand(pc.cockTotal());
	
	seraSexXXXTitfuckLuckyDip(["intro", vagIndex, cockIndex]);
}
public function seraSexXXXTitfuckLuckyDip(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	showSera(true);
	
	var response:String = arg[0];
	var vagIndex:int = arg[1];
	var cockIndex:int = arg[2];
	
	if(response == "intro")
	{
		output("<i>“Mistress.”</i>");
		output("\n\nSera rises from her chair and quickly clacks over to you. Her expression - usually some combination of malevolence, cupidity and schadenfreude - is one of pure glee. ");
		output("\n\n<i>“What a day this is,”</i> she says, gripping your shoulders tightly. <i>“Not only do I make a massive sell, but my favorite toy walks through the door immediately afterwards for me to reward myself with!”</i> Her hands are moving as she speaks, reaching underneath your [pc.gear], impatiently shucking it off you. It’s difficult not to be carried along with the exuberance in your mistress’s face and you find yourself aiding her, fumbling your clothes off until you’re knelt naked in front of her impossibly curvy form. She steps back for amount, idly fondling her semi-erect 12 inch cock as she considers you. ");
		// If B cup or below:
		if(pc.biggestTitSize() <= 2)
		{
			output("\n\nShe trails her claws across your bare chest, lightly touching your [pc.nipples] before, with a lusty grin, slapping you in the face with her pendulous male sex. You sigh with mocking exasperation as you grasp it and begin to shift your grip up and down her meat.");
			output("\n\n<i>“Don’t pretend you don’t enjoy it,”</i> she murmurs as you skillfully jerk her, undulating your fingers up her sensitive raphe as you press your palm closely into the top side, coiling her more and more vigorously as the flesh beneath your hand gets hotter and harder, pointing further and further up. Her bulbous end seems to grow in size, her wet cum-slit dilating, and you give it a gentle, teasing lick, the sharp, musky flavor of her in your mouth and nose stoking your own arousal.");
			output("\n\nShe pushes herself into you a moment later, urging you to rise silently. Her big, pert breasts flattening against your [pc.chest], hissing quietly into your ear as she urgently turns you, bends you over the counter, grips your hands behind your back and finally slides her fully recovered erection between your butt-cheeks. It’s clear she’s not interested in her usual theatrics - simply the base, gleeful use of you for her own gratification. Still, she finds time to test you,");
			if(vagIndex >= 0)
			{
				output(" pushing her fingers into your [pc.vagina " + vagIndex + "], curling over your [pc.clit], curling at you briskly until you are");
				if(pc.isSquirter(vagIndex)) output(" dribbling moisture");
				else output(" eagerly beading");
				output(" to her movements.");
			}
			else output(" pushing her thumb into your [pc.anus], waiting until you relax before briskly working you loose.");
			output(" Her bulging head presses against your entrance.");
		}
		// If C cup or above:
		else
		{
			output("\n\nA lusty grin splits her face as her yellow eyes fall on your [pc.chest]. She slides her hand all the way down to the base of her dick and swings it forward, landing it with a slap between your breasts. She hasn’t said a word but it doesn’t take a genius to work out what she’s looking for. You smile up at her coquettishly as you wrap your hands around your [pc.skinColor] softness and press it into her hot, stiff length. Sera hums with approval, looking into your eyes as she tightens her grip on your shoulders, slowly beginning to pump into the sleeve of boob-flesh you’ve created. The sharp, musky smell of her pre is in your nose as her thick, purple meat pushes demandingly towards your face.");
			output("\n\nIt’s clear she’s not interested in her usual theatrics - simply the base, gleeful use of you for her own gratification. As she gets more and more into the smooth friction she has found between your [pc.chest] her hands move downwards, following the curve of your rippling boobs, landing for a moment on your hands before sliding inwards to touch your [pc.nipples].");
			if(pc.bRows() == 1)
			{
				output("\n\n");
				if(pc.hasCuntNipples() || pc.hasLipples()) output("You sigh as she runs her finger-pads around their sensitive lips, then squeak as she ruthlessly buries her thumbs into them up to the quick, stroking their insides insistently. Acute pleasure shivers through you");
				else output("You sigh and then squeak when she first rubs your erect nubs between thumb and forefinger before squeezing them ruthlessly hard, sending acute pleasure shivering through you");
				if(vagIndex >= 0) output(", your [pc.vagina " + vagIndex + "] moistening");
				else if(cockIndex >= 0) output(", your [pc.cock " + cockIndex + "] hardening");
				output(".");
			}
			else
			{
				output("\n\nHer grin widens as her fingers sink down still further to grip your [pc.breasts " + 0 + "]. She plays with your second set of nipples for a time, sending acute pleasure shivering through you before gripping them between her fingers, squeezing your second pair of breasts ruthlessly hard, using them as leverage to fuck your top row with firm drives of her hips. You groan to the intensity of it, in turn pressing the boobs in your own hands into her rapidly moving prick.");
			}
			if(pc.isLactating()) output("\n\nIt doesn’t take long underneath this fierce treatment for [pc.milk] to begin to dribble and squirt freely from your [pc.nipples], slicking Sera’s hands with the proof of the shameless enjoyment you’re taking from being titfucked. She giggles to herself softly at the sight and takes the time to rub her straining dick over each nipple, teasing your wet, delicate nubs at the same time as slathering her hardness with your own juices; then she slaps it between your [pc.chest] and begins to thrust into your presented rack again, going at you even harder now that she’s thoroughly lubricated both of you.");
			output("\n\nShe pants as she fucks your softness faster and faster, arching her head back and pushing her thick thighs into you as she rises towards her orgasm. The submissive notion of licking her bulging end as it presents itself between your pre-cum");
			if(pc.isLactating()) output(" and [pc.milk]");
			output(" slicked boobs dimly occurs to you, but she’s fucking you so frenetically it’s not even an option. She reaches down and");
			if(pc.hasCuntNipples() || pc.hasLipples()) output(" fingers");
			else output(" pinches");
			output(" your nipples intently as her slit dilates, so that your cries join hers as she orgasms; yours however are swiftly drowned out by the warm jizz which is fountained onto you with each upward thrust of hard meat between your [pc.chest]. Sera doesn’t stop until she has caked your face and much of your [pc.hair] with her glorious love, her final few spatters providing you with a presentable pearl necklace too.");
		}
		
		processTime(15);
		pc.changeLust(15);
		clearMenu();
		addButton(0, "Next", seraSexXXXTitfuckLuckyDip, ["second", vagIndex, cockIndex]);
		return;
	}
	else if(response == "second")
	{
		if(pc.biggestTitSize() > 2)
		{
			output("She takes a few steps back to lean against the counter with a raspy sigh, her distended cock leaving a dribbled trail of cum on the floor as she goes. You lean back to gather yourself, the alabaster mess oozing down you, and raise a hand to wipe your face.");
			output("\n\n<i>“No.”</i> You freeze. You were expecting Sera to be lost in a warm, self-centered fuzz of her own but her eyes are open, gazing down at you: golden, playful and cruel. Cat’s eyes. <i>“I’m not done with you yet pet, and you look so much more... appropriate when you’re covered in my jizz. Come here, and prepare your mistress for the good, hard fucking she’s going to give you now.”</i> A warm shudder passes through you as, after a pause, you shift yourself over so you’re between her long legs and wrap one hand around her long, fluid-slicked shaft. Claw-tipped fingers urge you to rise, staying where they are to convex down your back and grip your [pc.ass] as you do whilst continuing to steadily jerk her.");
			output("\n\nShe leans back with a wide, lazy smile, enjoying the luxuriant refractory period you’re providing her with, drinking in your cum-creamed face whilst your grip gently shifts up and down her girth. Blushing, you look down from that gloating, infernally alluring visage, try to ignore the sensation of musky cream steadily oozing down your [pc.chest] and quickly hit on something to busy yourself with. You send your other hand burying beneath her warm, pliant thighs and touch the lips of her pussy. She hums with deep approval, pushing her thighs outwards so you can enter her, curling your fingers into her hot, moist depths as you continue to wring her male sex. In response she gets to work with her own hands, clutching your [pc.ass] tightly before moving inwards, penetrating your");
			if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
			else output(" [pc.anus]");
			output(", testing and loosening you.");
			output("\n\nSera may have been human once but her present physiology scorns the limitations her birthright would have given her. It takes little more than a minute for her cock to be bulging and erect again, pointing at you demandingly. She pushes herself into you, her big, pert breasts flattening against your [pc.chest], hissing quietly into your ear as she urgently turns you, bends you over the counter, grips your hands behind your back and finally slides her fully recovered erection between your butt-cheeks.");
			if(vagIndex >= 0)
			{
				output(" Your [pc.vagina " + vagIndex + "] has been anticipating this for some time now, her flavor rich in your mouth and nose, and it eagerly");
				if(pc.isSquirter(vagIndex)) output(" dribbles");
				else output(" beads");
				output(" moisture to the hot thickness sliding over your labia and [pc.clit].");
				
			}
			output(" Her bulging head presses against your entrance.");
			output("\n\n");
		}
		
		output("<i>“So, uh,”</i> trying to keep your voice steady. <i>“What was the big sell? Mistress?”</i> you add, for good measure. Sera pauses, as if slightly surprised by your question. Then she thrusts forwards, burying most of her huge cock into your");
		if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
		else output(" [pc.anus]");
		output(" with a single action. You arch your back and open your mouth, globs of cum flying off you, every cell in your nether regions attempting to grow accustomed to the massive intrusion.");
		
		if(vagIndex >= 0)
		{
			pc.cuntChange(vagIndex, chars["SERA"].cockVolume(0));
			IncrementFlag("SERA_COCK_STEELE_VAG");
		}
		else pc.buttChange(chars["SERA"].cockVolume(0));
		
		//Randomised
		var TFList:Array = [];
		if(flags["SERA_UNLOCK_CLIPPEX"] == undefined || flags["SERA_UNLOCK_SEMENS"] == undefined || flags["SERA_UNLOCK_LUCIFIER"] == undefined)
		{
			if(flags["SERA_UNLOCK_CLIPPEX"] == undefined) TFList.push("Clippex");
			if(flags["SERA_UNLOCK_SEMENS"] == undefined) TFList.push("Semen’s Friend");
			if(flags["SERA_UNLOCK_LUCIFIER"] == undefined) TFList.push("Lucifier");
		}
		else TFList = ["Clippex", "Semen’s Friend", "Lucifier"];
		
		var TFItem:String = RandomInCollection(TFList);
		
		output("\n\n");
		// Clippex:
		if(TFItem == "Clippex")
		{
			output("<i>“Someone bought a whole load of Clippex,”</i> she grunts. She saws into you, keeping her grip tight around your wrists, filling more and more of your tunnel with her alarmingly thick cock, bending it into your sensitive spots to make you tense up around her with involuntary pleasure. <i>“Grows your tits and particularly your nipples out, does crazy things with them if you keep taking it. Turns them into cunts, then mouths...</i> “ You are not capable of responding. Your hands grip the air and you suck skies of air into your mouth as she finds your limit and begins to thrust into you vigorously, her balls slapping into your [pc.hips], her length rubbing and stretching your tunnel acutely.");
			output("<i>“...pretty specialist transformation, expensive. Lucky to find someone willing to... ungh... buy so much.”</i> She stops talking for a while, concentrating on rutting you hard enough to make the counter shake, her thighs beating a soft percussion against your [pc.butt].");
			if(vagIndex >= 0) output(" Your stuffed [pc.vagina " + vagIndex + "] seeps juices around her cock deliriously.");
			else if(cockIndex >= 0) output(" Your [pc.cock " + cockIndex + "] strains helplessly against your abdomen as she rides over your prostate again and again.");
			else
			{
				output(" Your [pc.anus]");
				if(pc.ass.wetness() >= 2) output(" seeps lubricant and");
				output(" up around her cock deliriously.");
			}
			output(" <i>“Thinking maybe I should give some to you?”</i> she husks finally. You feel her protuberant nipples touch your shoulders. <i>“Pets could always use more slut holes that need filling.”</i>");
		}
		// Semen’s Friend:
		else if(TFItem == "Semen’s Friend")
		{
			output("<i>“This guy bought a whole packet of Semen’s Friends,”</i> she says thickly. She saws into you, keeping her grip tight around your wrists, filling more and more of your tunnel with her alarmingly thick cock, bending it into your sensitive spots to make you tense up around her with involuntary pleasure. <i>“Increases the size of your balls, makes them more productive but does all sorts of other crazy stuff with your cum, too. Can turn it black. Can make it look and taste like chocolate.”</i> You are not capable of responding. Your hands grip the air and you suck skies of air into your mouth as she finds your limit and begins to thrust into you vigorously, her balls slapping into your [pc.hips], her length rubbing and stretching your tunnel acutely.");
			output("<i>“I regretted ordering it almost as soon as I clicked “OK”. Who wants four testicles? Well... someone, obviously. So – goddamn – glad to have shifted it.”</i> She stops talking for a while, concentrating on rutting you hard enough to make the counter shake, her thighs beating a soft percussion against your [pc.butt].");
			if(vagIndex >= 0) output(" Your stuffed [pc.vagina " + vagIndex + "] seeps juices around her cock deliriously.");
			else if(cockIndex >= 0) output(" Your [pc.cock " + cockIndex + "] strains helplessly against your abdomen as she rides over your prostate again and again.");
			else
			{
				output(" Your [pc.anus]");
				if(pc.ass.wetness() >= 2) output(" seeps lubricant and");
				output(" up around her cock deliriously.");
			}
		}
		// Lucifier
		else
		{
			output("<i>“I managed to sell almost my entire stock of Lucifier,”</i> she grunts. She saws into you, keeping her grip tight around your wrists, filling more and more of your tunnel with her alarmingly thick cock, bending it into your sensitive spots to make you tense up around her with involuntary pleasure. <i>“Wondered what I used to make me look like this? Does almost everything – the skin, the horns, the eyes...”</i> You are not capable of responding. Your hands grip the air and you suck skies of air into your mouth as she finds your limit and begins to thrust into you vigorously, her balls slapping into your [pc.hips], her length rubbing and stretching your tunnel acutely.");
			output("<i>“...it’s popular on human colonies. Out here though – well, you try explaining to an alien its cultural significance. And frontier explorers steer clear of it because it... ungh... does things to your libido. Big things.”</i> She stops talking for a while, concentrating on rutting you hard enough to make the counter shake, her thighs beating a soft percussion against your [pc.butt].");
			if(vagIndex >= 0) output(" Your stuffed [pc.vagina " + vagIndex + "] seeps juices around her cock deliriously.");
			else if(cockIndex >= 0) output(" Your [pc.cock " + cockIndex + "] strains helplessly against your abdomen as she rides over your prostate again and again.");
			else
			{
				output(" Your [pc.anus]");
				if(pc.ass.wetness() >= 2) output(" seeps lubricant and");
				output(" clenches up around her cock deliriously.");
			}
			output(" <i>“As I’m sure you’re getting a good appreciation of,”</i> she pants finally. You feel her protuberant nipples touch your shoulders. <i>“But it’s not so bad if you’ve got a whole load of slut to work it off on.”</i>");
		}
		
		output("\n\nTalking done, she uses the hand not holding your wrists back to pull your head back, squeezing it between her heaving breasts as she rams into you, filling you from stem to stern.");
		if(pc.hasLongTongue())
		{
			output(" Aware this is one of her favorite moves and ready for it, you slide your long, flexible tongue out of your open mouth and glide it across your skin and hers, flicking it over one of her erect nipples.");
			output("\n\n<i>“Oh – you – clever – fucking – [pc.boy]!”</i> she gasps, between slams of her hips into your ass.");
		}
		output("\n\nYour moans turn into cries of ecstasy as your");
		if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
		else output(" [pc.anus]");
		output(" clenches up around her unremitting sex and you orgasm helplessly");
		if(vagIndex >= 0) output(", your pussy quaking and wetting itself ecstatically");
		else if(cockIndex >= 0) output(", your prick surging lines of cum onto the counter as your prostate is mercilessly milked");
		else output(", your ass quaking ecstatically");
		output(". Sera fucks you with regal heedlessness throughout, keeping hold of your hands and head firmly so you are made to wriggle and spasm your high out impaled on her cock. Only when you are a quivering mess does she push to her own peak, hissing and groaning wordlessly as she embeds herself deep into your brutalized tunnel, her claws digging into you as her cock bulges and she pumps a new, thick, warm load into your depths. Your eyes roll as she fills your");
		if(vagIndex >= 0) output(" womb");
		else output(" intestines");
		output(" with her seed, pulling out after a series of deeply satisfied exhalations to spurt the last of it over your [pc.ass] and lower back.");
		output("\n\nThe succubus collapses back on to her chair, breathing heavily, satiated at last – for the next ten minutes or so, anyway. You pitch onto your side, soaked from head to bottom, panting hard yourself. She’s taking you in with heavy-lidded eyes - you, covered from head to toe in her cum, leaking more of it gently from your");
		if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
		else output(" [pc.anus]");
		output(" – with an expression of profound contentment.");
		
		processTime(15);
		pc.loadInMouth(chars["SERA"]);
		if(vagIndex >= 0) pc.loadInCunt(chars["SERA"], vagIndex);
		else pc.loadInAss(chars["SERA"]);
		pc.orgasm();
		sera.orgasm();
		clearMenu();
		if(TFItem == "Semen’s Friend") addButton(0, "Semen’s?", seraSexXXXTitfuckLuckyDip, [TFItem, vagIndex, cockIndex], TFItem + "?", "Ask your mistress for some " + TFItem + ".");
		else addButton(0, TFItem + "?", seraSexXXXTitfuckLuckyDip, [TFItem, vagIndex, cockIndex], TFItem + "?", "Ask your mistress for some " + TFItem + ".");
		addButton(1, "Finish", seraSexXXXTitfuckLuckyDip, ["finish", vagIndex, cockIndex]);
		return;
	}
	else if(response == "Clippex" || response == "Semen’s Friend" || response == "Lucifier")
	{
		output("<i>“So, um... " + response + ",”</i> you say hesitantly. Sera gazes at you impassively. <i>“Do you think I could have some?”</i>");
		output("\n\n<i>“Interested in doing some bodywork, are we?”</i> she murmurs. Idle with post-coitus, she slides her chair back to consider your recumbent, ooze-covered form further. Her platform shoes came loose during the vigorous sex; she slides a dainty, clipped foot out, replete with its natural four-inch horn stiletto, and circles her big toe at you teasingly. <i>“Your mistress thinks you look just fine as you are, candy-cheeks, and that’s all that matters. She wonders just how interested </i>you<i> really are.”</i>");
		
		processTime(1);
		// [Not interested] [Interested] [Perform]
		clearMenu();
		addButton(0, "Nah", seraSexXXXTitfuckLuckyDip, ["not interested", vagIndex, cockIndex], "Not Interested", "You are not really interested in the " + response + ".");
		addButton(1, "Interested", seraSexXXXTitfuckLuckyDipGetItem, response, "Interested", "Accept the " + response + " from your mistress.");
		addButton(2, "Perform", seraSexXXXTitfuckLuckyDipPerform, response, "Perform", "Accept the " + response + " but make a show of it.");
		return;
	}
	else if(response == "not interested")
	{
		output("<i>“You’re right,”</i> you say. <i>“It’s not important.”</i> Sera considers you for a moment longer before flicking her toe at the locker behind the counter. She looks slightly disappointed, but doesn’t say anything more whilst you get up to fetch yourself a towel.");
		
		processTime(2);
	}
	else if(response == "finish")
	{
		output("<i>“Life is so goddamn grand,”</i> she exults finally. She closes her eyes and flicks a dismissive, lazy claw at the locker behind the counter. After you’ve spent a few more moments resting, you get up to fetch yourself a towel.");
		
		processTime(5);
	}
	
	IncrementFlag("SERA_TIT_FUCK_LUCKY_DIP");
	clearMenu();
	addButton(0, "Next", seraExitToMain);
}
public function seraSexXXXTitfuckLuckyDipGetItem(TFItem:String = ""):void
{
	clearOutput();
	author("Nonesuch");
	showSera(true);
	
	processTime(2);
	IncrementFlag("SERA_TIT_FUCK_LUCKY_DIP");
	
	var discount:Boolean = false;
	
	output("You clamber into a kneeling position on her desk and grasp your hands together between your thighs.");
	output("\n\n<i>“Please mistress,”</i> you say. <i>“May I have some " + TFItem + "?”</i> Sera is silent a moment longer. You give it the doe-eyes, and she laughs.");
	output("\n\n<i>“Oh, I can’t say no to that. Fine! But it’s expensive stuff, pet.");
	
	// “Interested” = product unlocked w/ discount.
	if(TFItem == "Clippex")
	{
		if(!pc.hasKeyItem("Coupon - Clippex"))
		{
			pc.createKeyItem("Coupon - Clippex", 0.25, 0, 0, 0, "Save 75% on your next purchase of Clippex!");
			discount = true;
		}
		flags["SERA_UNLOCK_CLIPPEX"] = 1;
	}
	if(TFItem == "Semen’s Friend")
	{
		if(!pc.hasKeyItem("Coupon - Semens F."))
		{
			pc.createKeyItem("Coupon - Semens F.", 0.25, 0, 0, 0, "Save 75% on your next purchase of Semen’s Friend!");
			discount = true;
		}
		flags["SERA_UNLOCK_SEMENS"] = 1;
	}
	if(TFItem == "Lucifier")
	{
		if(!pc.hasKeyItem("Coupon - Lucifier"))
		{
			pc.createKeyItem("Coupon - Lucifier", 0.25, 0, 0, 0, "Save 75% on your next purchase of Lucifier!");
			discount = true;
		}
		flags["SERA_UNLOCK_LUCIFIER"] = 1;
	}
	if(discount) output(" I’m going to give it to you at a discount but you can’t tell anyone else about it, okay?");
	output("”</i> As she speaks she’s flicking her claws over her touch screen. You grin quietly to yourself as you get up to find a towel.");
	if(discount) output("\n\n<b>You have gained a coupon for " + TFItem + "!</b>");
	
	clearMenu();
	addButton(0, "Next", seraExitToMain);
}
public function seraSexXXXTitfuckLuckyDipPerform(TFItem:String = ""):void
{
	clearOutput();
	author("Nonesuch");
	showSera(true);
	
	processTime(10);
	// “Perform” = 1 of product added + unlocked w/ discount.
	IncrementFlag("SERA_TIT_FUCK_LUCKY_DIP");
	
	var discount:Boolean = false;
	
	output("You can see what she’s asking for here and, with a familiar, unabashed thrill wriggling through you, you acquiesce. Slowly, you climb off the table and sit yourself down in front of her chair. Your eyes are on hers as you bend forward and touch her outstretched toe with your tongue. Her mouth is open, reveling in the sight of you as you gently suck her slim, bulbous digit before lapping at the rough skin of the balls of her feet.");
	output("\n\n<i>“Oh, that’s good,”</i> she sighs. <i>“Every girl who spends all day on high heels needs one of you... Be sure to get between the toes.”</i> You do so, tasting her sweat as you curve up and down each valley before taking the thin, hard pole of her stiletto in your mouth and sucking on it as if it were a miniature cock. You finish off with a long, worshipful wash of the soft instep, flexing beneath your mouth as she coos to your treatment of the most sensitive part of her feet. You allow yourself a swallow when she finally withdraws it, knowing exactly what’s coming next.");
	output("\n\n<i>“You didn’t spend enough time on the balls, bitch,”</i> Sera says imperiously, wiggling her other bare set of toes and horn point in front of your face. <i>“Make sure you do that with this one.”</i>");
	output("\n\nYour tongue aches and your mouth is dry by the time you are done. Sharp teeth, piercings and yellow eyes gleam down as purple, saliva-dampened toes are curled and stretched in front of you admiringly. Her cock is in its normal semi-erect state... but from where you are you can see her pussy is glistening richly.");
	output("\n\n<i>“Oh, I shouldn’t. But you’re such a precious slut! I want to keep you and watch you lick my feet every single... just this once, then.”</i> A ");
	
	if(TFItem == "Clippex")
	{
		output("small white bottle");
		if(!pc.hasKeyItem("Coupon - Clippex"))
		{
			pc.createKeyItem("Coupon - Clippex", 0.25, 0, 0, 0, "Save 75% on your next purchase of Clippex!");
			discount = true;
		}
		flags["SERA_UNLOCK_CLIPPEX"] = 1;
	}
	else if(TFItem == "Semen’s Friend")
	{
		output("small silver tin");
		if(!pc.hasKeyItem("Coupon - Semens F."))
		{
			pc.createKeyItem("Coupon - Semens F.", 0.25, 0, 0, 0, "Save 75% on your next purchase of Semen’s Friend!");
			discount = true;
		}
		flags["SERA_UNLOCK_SEMENS"] = 1;
	}
	else if(TFItem == "Lucifier")
	{
		output("candy apple in a wrapper");
		if(!pc.hasKeyItem("Coupon - Lucifier"))
		{
			pc.createKeyItem("Coupon - Lucifier", 0.25, 0, 0, 0, "Save 75% on your next purchase of Lucifier!");
			discount = true;
		}
		flags["SERA_UNLOCK_LUCIFIER"] = 1;
	}
	
	output(" lands on the counter above you. You didn’t even see where it came from.");
	if(discount) output(" <i>“I can give you more at a discount,”</i> Sera purrs, flicking a big toe at the locker near your head. You shuffle over and open it to find a pile of clean towels. <i>“But that one’s your only freebie, okay? Unless... well... hmm.”</i>");
	else output(" Sera purrs and flicks a big toe at the locker near your head. You shuffle over and open it to find a pile of clean towels. <i>“That one’s your only freebie, okay? Unless... well... hmm.”</i>");
	output("\n\n<b>You have gained one " + TFItem + "!</b>");
	if(discount) output("\n\n<b>You have also gained a coupon for your next purchase of " + TFItem + "!</b>");
	output("\n\n");
	
	if(TFItem == "Clippex") quickLoot(new Clippex());
	else if(TFItem == "Semen’s Friend") quickLoot(new SemensFriend());
	else if(TFItem == "Lucifier") quickLoot(new Lucifier());
	else
	{
		clearMenu();
		addButton(0, "Next", seraExitToMain);
	}
}


// Sera’s Collar + Tongue Fuck
/*
Notes
•	She gifts it the second time you ask for the salary, having used that money to get it made.
•	PC can use the gem dildo to masturbate. Sera probably has some way of keeping count how many times you do it.
•	Has a good sexiness rating (+3?)... but in order to take it off you have to throat the gem-dildo.
•	Kiss scene can happen whenever salary asked for, regardless of collar. Collar gives extra dialogue though
•	Jardi gets her own collar, mentioned in threesome scene
*/

public function seraOrallyTrained():int
{
	var numTrained:int = 0;
	
	if(flags["SERA_EXHIBITION_BLOWJOB"] != undefined) numTrained += flags["SERA_EXHIBITION_BLOWJOB"];
	if(flags["SERA_FACE_RIDE_TRAINING"] != undefined) numTrained += flags["SERA_FACE_RIDE_TRAINING"];
	
	return numTrained;
}
// Gifting Scene
// If PC already getting salary, scene plays next time they go get it
public function seraGiftCollar(page:int = 0):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	clearMenu();
	
	switch(page)
	{
		case 0:
			output("Sera sits cross-legged on her stool, lips pursed and face stony, as you deliver your report.");
			output("\n\n<i>“Mm. Nice, watching your mouth move,”</i> she says at last. <i>“You aren’t getting your salary this week. I got you something instead. Take off your shit and come into the back.”</i>");
			output("\n\nYou follow the pale blue hair, jouncing bum and coiling, beckoning spade a few moments after they’ve disappeared beyond the door, your [pc.skinFurScales] shiveringly bared for whatever it is the sadistic slave driver has got prepared.");
			output("\n\nShe’s seated on her bed, swinging the end of her tail, leering with that trademark blend of menace and lust of hers, by the time you enter her room. There’s a small, red box on the floor on front of her, done up in black ribbon.");
			output("\n\n<i>“It’s great, you know, ordering someone to do whatever I want and them just doing it,”</i> she husks, reptilian eyes crawling over your naked body. <i>“Kneel.”</i> You comply,");
			if(pc.isNaga()) output(" coils settling into the carpet");
			else if(pc.isGoo()) output(" goo settling into the carpet");
			else if(pc.isTaur() || pc.isDrider()) output(" folding your legs beneath you");
			else if(pc.hasKnees()) output(" knees pressing into the carpet");
			else output(" settling down onto the carpet");
			output(", and there’s no denying the pang of submissive pleasure you get from obeying. The shiny latex of Sera’s thigh-highs are inches away from your nose; above them climb the flawless, obscene curves and taut canvas of her hips, stomach and breasts.");
			output("\n\n<i>“Very nice,”</i> she hisses, molten eyes gazing down, one set of cerulean claws stroking a breast, the other grazing the length of her thick cock. Her tail-spade slithers down and touches you in the pit of your throat, leading slowly up to your chin before withdrawing, leaving a faint trace of cock-musk behind. <i>“It’s a picture that’s missing something, though. Go ahead and open your prezzie.”</i> The pulpy spade slaps your hand when you reach for the box. <i>“You should know better than that by now, slut,”</i> admonishes Mistress in a sharper voice.");
			
			processTime(5);
			pc.changeLust(5);
			
			addButton(0, "Next", seraGiftCollar, 1);
			break;
		case 1:
			output("Well then. Hands firmly on the carpet, you bend forward - making sure your [pc.ass] is up and nicely flared - and grab the ribbon end with your teeth. It’s thankfully not tied very tightly, but it’s still fairly awkward to do this using only your mouth, a performance of careful, huffing yanks that Sera no doubt enjoys. You tip the box lid off with your [pc.tongue]. You gaze down at the contents, and then up at her in silent query.");
			output("\n\n<i>“Go ahead,”</i> she says, grinning back. <i>“You have permission to use your hands.”</i> You pick the band of ornate material out of its wrapping and examine it carefully. It’s a collar, as you had perhaps guessed - but a pretty unique looking one. Ferns of fine black lace covered in little faux-pearls sprout from the leather band, which has PROPERTY OF SERA embossed in gothic script on one side. It has a brass hasp ring attached at the back and at the front... a gemstone? It’s blue and glows faintly from within, not unlike the ones she has fixed in her own collar - but bigger.");
			output("\n\n<i>“Yeah, that there’s the real treat,”</i> the succubus says, eagerness breaking through the controlled veneer. She draws you up onto the bed and takes the collar, carefully fixing the soft leather around your throat. It makes an ominous ‘click’ when it’s in place; you exhale slowly, touching the pretty, black thing. It’s surprisingly comfortable, the lace contouring perfectly with the shape of your neck. It’s tight though, tight enough that you are made aware of its presence with every breath you take.");
			output("\n\n<i>“Thank you Mistress,”</i> you say, swiftly remembering your manners as Sera sidles around in front of you.");
			output("\n\n<i>“Oh, thanking is coming later, bitch. You haven’t seen what this thing can do yet...”</i> Mouth ajar, she reaches out her claws and grasps the front-mounted gemstone. With a small twist and click, she dehouses the thing entirely.");
			output("\n\n<i>“Kiss.”</i> The gently glowing oval is presented to your [pc.lips]. Brow furrowed, you bend forward and press your lips against the stone. You gasp as something suddenly rears out of it in response, a hard form made of warm light that bats you in the cheek before stretching outwards ever further...");
			output("\n\n<i>“Nice,”</i> Sera says, admiring the hardlight projection of a thick, human penis in her hand, once it has finished growing out to a foot in length. She sits back down on her bed, holding it by the shaft and twisting it around so that you can take it in from every angle. Good Void, it’s even got balls. And the thing moves and sways exactly like a dick of that size would... <i>“Perfect, you might even say. Remind you of anything?”</i> She sets it down, leans back and grasps the holo-cock’s fleshy twin, thickening between her legs. <i>“Now wherever you go, my little field agent, you’ll only be a simple kiss away from a big piece of your owner’s love. C’mere.”</i>");
			output("\n\nYou crawl forward a bit, and the gem is presented to your lips again, this time the back. <i>“Lick, and say ‘Thank you, Mistress’.”</i>");
			output("\n\n<i>“Th-thank you, Mistress.”</i> Your tongue slides over the warm, hard stone. With a click, the obscene shape dangling away from you retracts, and in a second it’s just a gemstone again. Sera clicks it back into place on your neck, before reaching around your head. Her intoxicating, smoky smell and the mesmerizing sight of her boobs prevent you from realizing what she’s doing until you hear a second click, and the leather leash is being led out above you.");
			output("\n\n<i>“Yeeeess,”</i> she purrs, gazing down at you kneeling in front of her proudly, taut leash in one hand, her hardening cock in the other. <i>“That’s it, right there. Picture complete.”</i> She licks her lips, enjoying the sight of you for a couple moments more, before giving the leash a sharp yank, forcing you forward with a gasp. She opens her hips a bit; the moist, musky tip of her penis, real one this time, touches your lips. <i>“Now. Now you start thanking me.”</i>");
			
			processTime(7);
			pc.changeLust(10);
			
			addButton(0, "Next", seraGiftCollar, 2);
			break;
		case 2:
			output("The collar strains your neck as you wrap your hand around the hot, purple meat of Sera’s shaft. Just enough to be uncomfortable, just enough to remind you of its presence, whilst you pull her to full, wooden erection and spread your [pc.lips] over the bulbous tip, savoring the heavy, spicy flavor of her musk spreading over your taste buds.");
			output("\n\n<i>“I know the dildo won’t be as good as the real thing,”</i> Sera murmurs, exhaling long and low and closing her eyes as you open wide and fill your mouth with her cock. <i>“That’s why we make the most of these lil’ opportunities...”</i> ");
			output("\n\nYou sink deep onto her hot, delicious root, deep enough for the bulb to press against your tonsils, before slowly slurping outwards, retracting so you can lick her further down, fondling her big, heavy balls as you do it, creeping your fingers further inside even to trace the lips of her pussy. Her husky groans, and the presence of sharp nails stroking");
			if(!pc.hasHair()) output(" behind your [pc.ear]");
			else output(" you through your [pc.hair]");
			output(" informs you how much Mistress enjoys your masterful attention.");
			// If vagina and PC has done strap-on face dildo scene at least twice:
			if(pc.hasVagina() && seraOrallyTrained() >= 2)
			{
				output("\n\nYou’re getting wet, outrageously wet, doing this; the taste and feel of cock in your mouth sparking urgent instructions in your brain, making [pc.eachVagina] feel like " + (pc.vaginas.length == 1 ? "it’s" : "they’re") + " melting. She’s hardwired you by now into being an oral slut, and that combined with the deep submission of being naked, collared and on your [pc.knees] in front of this sadistic cunt is wonderful, arousal as deep and black and devouring as a tarpit. You let her know how much you enjoy it with hungry, muffled moans, letting her feel your drool seep down her foot-long cock before sweeping them away with luxurious drags of your [pc.tongue].");
			}
			output("\n\nSera tugs you up roughly with a jerk of the leash when you reach the bottom, levering you up so you can be placed at the top of her hot, veiny fuck-pole again.");
			output("\n\n<i>“Faster now,”</i> she growls, steadily playing the leather strap through her hand so you can sink your [pc.lips] further and further down it. You comply, fixing your [pc.eyes] on her face above the gentle tremble of her boobs as you blanket the bottom of her cock in both hands and pump the top briskly within your mouth, hollowing your cheeks around her to provide the sweetest, tightest pocket of ecstasy possible. Obscene slurps and gulps fill the room as your head bobs energetically, and a servile thrill shivers through you as you watch Sera writhe and growl, stretching her unearthly body, tugging at a nipple viciously in response to your efforts. You know you can source a torrent of delicious filth out of her in more than one way doing this.");
			output("\n\n<i>“That’s right, just like that you born cocksucker, you");
			if(pc.hasVagina() && pc.buttRating() >= 10) output(" fat-bottomed breeder bitch");
			else if(pc.hasCock() && pc.biggestCockVolume() < chars["SERA"].cockVolume(0)) output(" twig-dicked little sissy");
			else output(" rump-shaking ho");
			output(",”</i> she groans, head thrown back now, lost in it completely. <i>“Polish that demon dick like you know how! Show your pimp why she pays so well to keep you around...”</i>");
			output("\n\nHer fat balls twitch, her dick swells against your hollowed cheeks like it’s going to explode, and then she’s reflexively thrusting upwards into your maw, a heavy gout of cock-cream pulsed towards your throat with every quaking heave of her thighs. You’re well-practiced at this by now though and you maintain your suction and focus supremely, draining her completely despite her lusty thrashings and the tight pressure around your neck. You smack your lips as you withdraw, her bell-end completely clean, and open your mouth so she can admire the lake of pearl she’s left within, before swallowing the oily, musky load all down with a heavy gulp.");
			output("\n\n<i>“Beautiful,”</i> Sera says, looking you in the eye as she strokes your jaw line, and the genuineness in her tone makes your [pc.skin] tingle with happiness. <i>“Forgot to give you a facial, you’re that good.”</i> ");
			output("\n\n<i>“Mistress...”</i> You stroke your collar all away around its circumference, listening to the tiny pearls click together. A question has been tickling the back of your mind, and you think now, when she’s wallowing in post-blowjob bliss, is the best time to put it. <i>“...how do I take this off? If I ever wanted to, I mean.”</i>");
			output("\n\n<i>“Hmm? Oh, that’s easy.”</i> The succubus is withdrawing a cigarette from a packet on the bedside table. <i>“Just take the jewel off, and kiss the front once. Then kiss the front again, five seconds later.”</i>");
			output("\n\nShe sits there and watches you, eyes and cigarette-end glowing, as you work this out, before laughing throatily. The sound of purest evil.");
			
			processTime(11);
			
			// Black Jeweled Collar added to PC’s person
			// ++ Lust, load in mouth
			// Move PC to outside Dark Chrysalis
			
			output("\n\n<b>You got Sera’s Black Lace Collar!</b>");
			// v1: Wearing toggle off/on
			// v2: Day last taken off
			// v3: Day last masturbated with vag
			// v4: Day last masturbated with ass
			pc.createKeyItem("Sera’s Collar", 0, 0, 0, 0);
			toggleCollar("Sera’s");
			
			pc.changeLust(25);
			pc.loadInMouth(chars["SERA"]);
			
			currentLocation = "9018";
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

public function wearingSeraCollar():Boolean
{
	var itm:StorageClass = pc.getKeyItem("Sera’s Collar");
	if(itm != null) return (itm.value1 == 1);
	return false;
}
public function seraCollarValue(value:String = "", track:Boolean = false):Number
{
	var itm:StorageClass = pc.getKeyItem("Sera’s Collar");
	var retValue:Number = 0;
	if(itm != null)
	{
		switch(value)
		{
			case "on":
				if(track) itm.value2 = 0;
				retValue = itm.value2;
				break;
			case "off":
				if(track) itm.value2 = days;
				retValue = itm.value2;
				break;
			case "vag":
				if(track) itm.value3 = days;
				retValue = itm.value3;
				break;
			case "ass":
				if(track) itm.value4 = days;
				retValue = itm.value4;
				break;
			case "fap":
				retValue = Math.max(itm.value3, itm.value4);
				break;
		}
	}
	return retValue;
}
// Taking it Off and On
// Scene activates if PC attempts to un-equip it
public function toggleSeraCollarOff(response:String = "prompt"):void
{
	clearOutput2();
	author("Nonesuch");
	clearGhostMenu();
	
	switch(response)
	{
		case "prompt":
			output2("You follow the line of your collar all the way around. The joining at the back is completely seamless, and it’s so tight it’s impossible to fit a finger between it and your neck. Bar finding a very trustworthy lasering service, there’s only one thing you can do to try taking it off: Follow the instructions Sera gave you. You click the central jewel out, consider the pretty blue thing. Kiss the top... then kiss it again, five seconds later.");
			output2("\n\nAre you going to do it?");
			
			addGhostButton(0, "Yes", toggleSeraCollarOff, "yes");
			addGhostButton(1, "No", toggleSeraCollarOff, "no");
			break;
		case "no":
			output2("You snap the jewel back into place. It’s a lovely collar, on reflection. Yeah. No need to remove it.");
			
			addGhostButton(0, "Next", manageWornCollar);
			break;
		case "yes":
			output2("You plant your [pc.lips] on the warm, dry stone, then draw it back to give the giant, glowing replica of Sera’s penis space to spring gleefully into existence. You swivel the smooth, twelve-inch piece around in your hands thoughtfully. You’ve done this before, haven’t you? It won’t be all that tough. It should be approached as a welcome opportunity to practice, more than anything.");
			output2("\n\nYou spread your lips over the smooth, round knob of the head, jaw cracking a bit as you open wide to accept the solid projection of cock into your mouth. It’s missing a lot of the qualities of the original that make it such an enjoyable experience to suck off - the filthily delicious taste, the expectancy of hot cum drowning your taste buds, and overarching all the seductive, malevolent body and mind attached to it - but still. The breadth and density of it filling your maw, sliding past your [pc.lips] and down your [pc.tongue] towards your tonsils, causes happy memories to flourish, warmth pulsing down to your [pc.groin].");
			output2("\n\nYou slide it in and out a few times, getting used to its size, steadying yourself for the next stage - then, taking a deep breath, you firmly push it into your throat. The impulse to retch grips your senses... and then you’re past it, accepting inch after glorious inch into your esophagus, stretching your neck beneath your collar. A huffing moan escapes your nostrils as you watch more and more of it disappear before your eyes, the hand feeding it in getting inexorably closer, the other instinctively");
			if(pc.hasVagina()) output2(" scrabbling at [pc.eachVagina]");
			else if(pc.hasCock()) output2(" jerking [pc.eachCock]");
			else output2(" reaching at your [pc.asshole]");
			output2(", pulse thudding in your temple, the base of it tantalizingly close... and then in a panic you’re drawing it out, a remarkable amount of dripping holo-cock reaching out of your mouth before finally your air-hole is unblocked and you’re able to draw in coughing, saliva-choked breaths.");
			output2("\n\nAlright. Alright, this time. You wait until your heartbeat has steadied and you’ve taken several deep, reassuring breaths, before submitting to the slutty ritual again. Calmly you open your mouth around the dildo’s smooth end and let it swell your cheeks again, fellating the glowing, flavorless light rhythmically, building yourself up; then you make it enter your throat again, determinedly feeding it further and further in, eyes fixed upon the glittering base. They water as the proud thickness claims you as deep as it possibly can, seemingly stretching into your stomach itself; but the insistent stroke of your fingers on your");
			if(pc.hasVagina()) output2(" [pc.clit]");
			else if(pc.hasCock()) output2(" [pc.cock]");
			else output2(" [pc.butt]");
			output2(" keeps you going, makes the acuteness of it ecstatic.");
			output2("\n\nYour [pc.lips] touch the stone - you even let your [pc.tongue] slip out, lap at the balls... and then in a sudden, hollowing moment, it’s gone, faux-cock meat retracting and blinking away in a second, leaving your throat gaped around nothing, stone clutched to your mouth. With an almost imperceptible click, the collar opens at the front. The [pc.skin] on your neck breathes fresh air.");
			output2("\n\nYou sit yourself down and take some big, sighing inhalations. You’re free of the soft, incessant pressure around the neck - at the expense of some heavy throating practice. Very Sera. You click the stone back into place upon the opened band of leather and lace and finally stow it into your gear.");
			
			seraCollarValue("off", true);
			toggleCollar("Sera’s");
			pc.lust(15);
			
			addGhostButton(0, "Next", manageWornCollar);
			break;
	}
}
// Putting it on
// Blurb plays if PC equips it
public function toggleSeraCollarOn():void
{
	clearOutput2();
	author("Nonesuch");
	
	output2("You take up the opened curlicue of leather and lace, hesitate... and then thread it around your neck. It fastens at the front, behind the glowing cerulean stone, with an emphatic ‘click’. A tiny frog leaps in your stomach. Sera’s collar has its soft, sure grip around your throat now - and you know what you have to do if you ever want release from it.");
	
	//seraCollarValue("on", true);
	toggleCollar("Sera’s");
	pc.lust(5);
	
	clearGhostMenu();
	addGhostButton(0, "Next", manageWornCollar);
}

// Masturbation
// Add [Gem Vag] and [Gem Anal] if PC is wearing it in Masturbation options
public function fapSeraCollarVag():void
{
	clearOutput();
	author("Nonesuch");
	showBust("");
	showName("SERA’S\nCOLLAR");
	
	var vIdx:int = rand(pc.vaginas.length);
	var numClits:int = pc.totalClits();
	
	output("Your fingers touch the cerulean gemstone held in place over your throat, and with a small jerk and click, you uncouple it. You bring it up to your mouth and lay your lips upon the dry, faintly warm jewel, quickly pulling it back to avoid being batted in the face by the foot-long projection of hard light which springs eagerly into existence out of it.");
	output("\n\nYou have to laugh at the absurdity of it: both the giant glowing blue wang now in your hand, and the whole ritual involved in turning it on. Honestly, how in love with yourself would you have to be to have something like this made? The demon-morph must have had it carefully measured and molded, all so you could have this ridiculous thing attached to your neck. Still... you heft it this way and that, enjoying its stiff waggle and bobbing balls. There’s no questioning she has a really nice dick. And this way you can enjoy it without necessarily getting an earful of abuse, or a big helping of cum splattered over you.");
	output("\n\nYou lie back and spread your [pc.hips]. The size of the phallus requires you to hold it with both hands, using one to angle it whilst with the other you gently butt it against [pc.eachVagina]. You spend a little while nuzzling the smooth, warm head against [pc.eachClit], flicking over " + (pc.vaginas.length == 1 ? "it" : "them") + " like only you know how, sending fizzles of pure pleasure quivering through your lower half. Your pussy is soon lush with anticipation, " + (pc.isSquirter(vIdx) ? "drooling" : "moist with") + " [pc.girlCum]; but it’s only when");
	if(numClits > 1) output(" [pc.eachClit] are bulging well out of their hoods");
	else output(" your [pc.clit] is bulging well out of its hood");
	output(" to your insistent nudging that you push the big, bright, bulbous protrusion against your entrance proper.");
	output("\n\nSlowly you slide it in, opening your [pc.lips] as the firm thickness of it spreads you wide, inch after inch disappearing inside. You always forget how <i>big</i> she is... your body knows this invader, instinctively remembers all of the times it’s roughly made one of your wet holes its own, and quivers with filthy delight in response to it. You groan hoarsely as you");
	if(pc.vaginalCapacity(vIdx) < chars["SERA"].cockVolume(0)) output(" fit as much of it inside of you as you can");
	else output(" keep feeding it in until its big, plush testicles are propped up against your thighs");
	output(", a big, warm insertion filling your [pc.vagina " + vIdx + "] wonderfully.");
	
	pc.cuntChange(vIdx, chars["SERA"].cockVolume(0));
	
	output("\n\nYou begin to steadily jerk it with one hand, working it against your sensitive walls deep inside you; your other skitters over your needy clit");
	if(numClits > 1) output("s");
	output(", fingering them so pleasure enflames every nerve ending your cunt has to offer. You gasp as your fingers flick furiously, gasp again, and then swear as [pc.eachClit] pulsate");
	if(numClits > 1) output("s");
	output(", sensation throbbing through you.");
	output("\n\nOnly when the last delicious buzz has dissipated do you begin to work the dildo inside of you hard, bending that wonderful, obdurate density into your walls, this way and that. It’s simply a nice, satisfying feeling to begin with, but then you find the spot, <i>the</i> spot, and the next moment you’re levering the thing like a stuck brake handle, enthralled to that deep, glorious feeling growing deep within you.");
	output("\n\nYou arch your back as it breaks over you, seizing your muscles up in orgasm, and you dig the phallus into you hard, intensifying the quakes rolling through [pc.eachVagina].");
	if(!pc.isSquirter(vIdx)) output(" A thin dribble of [pc.girlCum] finds its way past your packed entrance.");
	else output(" Gratuitous spurts of [pc.girlCum] force their way past your packed entrance.");
	output("\n\nWhen the last delicious pulse has dissipated, you slowly retract the smooth firmness out of you, sighing at the pleasure of it sliding over your sensitive, gently aching walls, gasping a bit as the bulbous head catches at your lips. You serenely consider your twelve inch friend, damp now but obdurate and waggly as ever, its faint, warm glow matching how you feel rather well. You draw it up to your [pc.lips] and give the back a lick");
	if(!pc.isSquirter()) output(", tasting your [pc.femCumFlavor] juices as you do");
	output(".");
	output("\n\n<i>“Thank you, Mistress.”</i>");
	output("\n\nThe hard light retracts out of existence, and in a moment you’re holding nothing but a deceptively light gemstone again. You fix it back into your collar and then, with a reluctant sigh, get back to what you were doing.");
	
	processTime(15);
	pc.orgasm();
	seraCollarValue("vag", true);
	IncrementFlag("SERA_COLLAR_FAPS");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function fapSeraCollarAnal():void
{
	clearOutput();
	author("Nonesuch");
	showBust("");
	showName("SERA’S\nCOLLAR");
	
	output("Your fingers touch the cerulean gemstone held in place over your throat, and with a small jerk and click, you uncouple it. You bring it up to your mouth and lay your lips upon the dry, faintly warm jewel, quickly pulling it back to avoid being batted in the face by the foot-long projection of hard light which springs eagerly into existence out of it.");
	output("\n\nYou have to laugh at the absurdity of it: both the giant glowing blue wang now in your hand, and the whole ritual involved in turning it on. Honestly, how in love with yourself would you have to be to have something like this made? The demon-morph must have had it carefully measured and molded, all so you could have this ridiculous thing attached to your neck. Still... you heft it this way and that, enjoying its stiff waggle and bobbing balls. There’s no questioning she has a really nice dick. And this way you can enjoy it without necessarily getting an earful of abuse, or a big helping of cum splattered over you.");
	output("\n\nYou lay yourself down on your side, reaching your [pc.thigh] up and arching your back so you can bump the bulbous head of the hardlight dildo against your [pc.anus]. It’s awkward, particularly with a member this size, to properly position it. However... you gasp at the frisson of sensation you get as the warm, blunt head nudges inwards, slowly but surely opening you up, that delicious intensity that dances between pain and pleasure. Yep, definitely worth it.");
	output("\n\nHolding onto the sturdy warmth of the projection hard, you work yourself open with tight, huffing grunts, loosening yourself to the point where it can be pushed inside. You gasp slightly as you manage it, the tight insides of your ass clamping down around the dense head. You always forget how fucking big she is! You spend a few moments deliberately relaxing yourself, and then with a firm push, begin to fill your colon with delicious, obdurate density, inch after inch of it disappearing beyond your stretched ring.");
	output("\n\nTo begin with the sensation is simply intense, enjoyable only in a diffuse way, the hard smoothness filling and rubbing against your passageway as you stir yourself slowly. Gradually though, genuine pleasure does begin to flow through you, as");
	if(pc.hasVagina()) output(" the dildo presses into your sensitive pussy walls");
	if(pc.isHerm()) output(" and");
	if(pc.hasCock()) output(" you find your prostate and repeatedly bump over it, making [pc.eachCock] flex and jerk eagerly");
	output(". You begin to work the shaft harder, driven to stoke that arousal, emitting little gasps as it burns hotter with each jerk of the dildo within you.");
	output("\n\nYou feel an acute desire to");
	if(pc.hasVagina()) output(" diddle your [pc.vaginas]");
	else if(pc.hasCock()) output(" pump your [pc.cocks]");
	else output("stimulate your [pc.nipples]");
	output(" at the same time, work yourself into a fit - but you bite down on it. Better to train yourself to be a true anal slut, to get off to the sensation of your mistress using your ass and your ass alone. That was surely her intention when she gave you this thing... you whine as your mind floods with submissive thoughts, driving the huge, glowing penis between the cheeks of your [pc.ass] roughly, desperate to translate that tantalizing, knock-on arousal into true orgasm.");
	output("\n\nAfter a couple of minutes of hard butt-reaming, ratcheting your lust up by agonizing degrees, you manage it.");
	if(pc.hasCock())
	{
		output(" Having already leaked a ton of pre, [pc.eachCock] seize");
		if(pc.cocks.length == 1) output("s up and then " + (pc.cumQ() < 500 ? "spurts" : "fountains" ));
		else output(" and " + (pc.cumQ() < 500 ? "spurt" : "fountain" ));
		output(" [pc.cum] all over");
		if(InShipInterior(pc)) output(" your sheets");
		else output(" the ground");
		output(".");
	}
	else if(pc.hasVagina())
	{
		output(" [pc.EachVagina] shiver");
		if(pc.vaginas.length == 1) output("s");
		output(" with each unrelenting press of the thick dildo and then break");
		if(pc.vaginas.length == 1) output("s");
		output(" into a series of wonderful clenches, sourcing");
		if(!pc.isSquirter()) output(" a few fragrant drops of [pc.girlCum]");
		else output(" a delicious spurt of [pc.girlCum]");
		output(" with each crashing wave of joy.");
	}
	else
	{
		output(" Your [pc.buttcheeks] clench tight and your climax finally erupts");
		if(pc.canMilkSquirt()) output(" as [pc.milk] squirts freely from your [pc.nipples]");
		else output(", sending pleasurable shivers up your spine");
		output(".");
	}
	output(" You moan in submissive ecstasy, driving the dildo into you forcefully all the while.");
	output("\n\nOnce");
	if(pc.hasCock()) output(" your [pc.cocks] " + (pc.cocks.length == 1 ? "is" : "are") + " flopped down in blissed out defeat");
	if(pc.isHerm()) output(" and");
	if(pc.hasVagina()) output(" your [pc.vaginas] " + (pc.vaginas.length == 1 ? "has quaked out its" : "have quaked out their") + " last");
	if(pc.isSexless()) output(" your rapid anal spasms subside");
	output(", you slowly withdraw the hard-light cock, gasping slightly as the head stretches out your [pc.anus] again. You draw it up to your [pc.lips] and give the back a lick.");
	output("\n\n<i>“Thank you, Mistress.”</i>");
	output("\n\nThe hard light retracts out of existence, and in a moment you’re holding nothing but a deceptively light gemstone again. You fix it back into your collar. You feel raw and tender, but profoundly satisfied with the efforts you’ve put into becoming a better anal slut. Won’t your mistress be pleased! You clean yourself up and after a few more moments of rest, continue on your way.");
	
	processTime(15);
	pc.orgasm();
	seraCollarValue("ass", true);
	IncrementFlag("SERA_COLLAR_FAPS");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Tongue Fucking What is This I Don’t Even
// Has chance of playing every time PC asks for salary, similarly to existing tail-cock scene, if the PC has at least met kerokeras or raskvel (c’mon man)
public function seraTongueFuckBonus():Boolean
{
	output("\n\n<i>“I’m interested,”</i> Sera interrupts, before you’re halfway through your current tale of the frontier, <i>“if you’ve ever seen something like... this.”</i>");
	output("\n\nHolding your gaze, she opens her mouth. Out of it flops her tongue - a long, slick ribbon of red, unspooling and lolling down her front until the blunt end slaps restlessly against her breasts. Staring at her with that thing hanging out, you realize for a sudden, jarring moment how inhuman your Mistress really looks - an eerie vision of sensual unholiness beyond the sweatiest of medieval imaginings. There can’t be many aliens that come into her shop that can guess her origins.");
	
	var hasCock:Boolean = pc.hasCock();
	var select:int = -1;
	
	var convoList:Array = [];
	if(pc.tongueType == GLOBAL.TYPE_DEMONIC) select = 1;
	if(pc.tongueType == GLOBAL.TYPE_RASKVEL) select = 2;
	if(pc.tongueType == GLOBAL.TYPE_FROG) select = 3;
	if(pc.tongueType == GLOBAL.TYPE_BEE) select = 4;
	if(select < 0 && (flags["MET_FEMALE_RASKVEL"] != undefined || flags["MET_MALE_RASKVEL_GANG"] != undefined)) convoList.push(5);
	if(select < 0 && flags["MET_KEROKORAS"] != undefined) convoList.push(6);
	if(select < 0 && (flags["TIMES_MET_FEMZIL"] != undefined || flags["ENCOUNTERED_ZIL"] != undefined)) convoList.push(7);
	
	if(select < 0 && convoList.length > 0) select = (convoList[rand(convoList.length)]);
	
	switch(select)
	{
		// Demon tongue:
		case 1:
			output("\n\n<i>“Uh... yeah?”</i> You open your own mouth and lollop out your own tongue, dangling it down as far as your [pc.chest] as well. Sera smirks, retracting her own to speak.");
			output("\n\n<i>“I wondered if you were making good use of all that Lucifier,”</i> she says, eye on the end of it. She leans back on her counter, eyes half-lidded. <i>“Alright. Go on.”</i>");
			break;
		// Raskvel tongue:
		case 2:
			output("\n\n<i>“Kinda?”</i> You open your own mouth and lollop out your own tongue, a wide, wet, purple carpet that can easily touch your [pc.chest] as well. Sera eyes widen slightly, and she retracts her own to speak.");
			output("\n\n<i>“That’s pretty good,”</i> she murmurs, eyeing it. <i>“Bit lizard-y, but... useful-looking. Tell me how you got it.”</i>");
			break;
		// Kerokeras tongue:
		case 3:
			output("\n\n<i>“Kinda?”</i> Your tongue never turns down the opportunity to perform, and the moment you open your mouth it’s out there, whipping this way and that with wet, sticky intent. You have it catch a fetish doll off a nearby shelf and deposit it clumsily next to Sera. Her eyes widen slightly, and she retracts her own to speak.");
			output("\n\n<i>“That’s pretty good,”</i> she murmurs, eyeing it. <i>“Bit frog-like, but... useful-looking. Tell me how you got it.”</i>");
			break;
		// Zil tongue:
		case 4:
			output("\n\n<i>“Kinda?”</i> You open your own mouth and lollop out your own tongue, a hollow, wet, yellow muscle that touches the your [pc.chest]. You make it run kisses all along the surface with its talented tip. Sera eyes widen slightly, and she retracts her own to speak.");
			output("\n\n<i>“That’s pretty good,”</i> she murmurs, eyeing it. <i>“Too much like a nectar-sucking bug, but... useful-looking. Tell me how you got it.”</i>");
			break;
		// Raskvel met:
		case 5:
			output("\n\n<i>“Kinda?”</i> Slightly nervously, you begin to talk about the raskvel, the Tarkus-born race of rabbit-reptiles and their big, long tongues. Sera slurps her obscene mouth appendage away, bit by flailing bit, listening to you with half-lidded eyes.");
			break;
		// Kerokeras met:
		case 6:
			output("\n\n<i>“Kinda?”</i> Slightly nervously, you begin to talk about the kerokeras, the obscure race of frog-alogues that inhabit Mhen’ga, and their long, sticky whip-tongues. Sera slurps her obscene mouth appendage away, bit by flailing bit, listening to you with half-lidded eyes.");
			break;
		// Zil met:
		case 7:
			output("\n\n<i>“Kinda?”</i> Slightly nervously, you begin to talk about the zil, the race of wasp-like beings that inhabit Mhen’ga, and their long, hollow tongues. Sera slurps her obscene mouth appendage away, bit by flailing bit, listening to you with half-lidded eyes.");
			break;
	}
	
	output("\n\nShe gazes at your [pc.lips], the tip of her tongue tracing her own cerulean lips, as you talk, trying to come up with tidbits that might tickle her modding passions. You falter - it’s plainly evident that she’s not really listening - yet she impatiently waves her hand, urging you to continue talking about alien anatomy, and the things you’ve gotten into on the frontier. The moment you start getting into it again, however, she strides forward and forcefully pulls you into a hot kiss.");
	output("\n\nHer clawed hands roughly grope your [pc.ass] as her lips mold into yours, plush breasts pooling against your [pc.chest]. You open your mouth, and for a moment taste her warm, smoky breath... and then that is replaced by her tongue, rearing past your teeth and into your mouth like a snake that’s spotted something plump and furry in the bushes. It’s a prehensile beast that can easily wrap around yours, melding with it passionately, owning it and squeezing it in muffled, saliva-slathered embrace. But Sera isn’t interested in merely your mouth. Your [pc.eyes] widen as she bends in further, and with a filthy wet sound pushes her long tongue past your tonsils.");
	output("\n\nYou try and relax as wet, hot muscle reaches down your throat but it’s rather difficult, particularly when its owner is");
	if(!pc.isCrotchExposed()) output(" shoving its hand inside your [pc.lowerGarment] and");
	if(hasCock) output(" gripping your [pc.cock] and brusquely jerking you, working leaden arousal into your shaft with sharp, certain movements");
	else output(" sliding her digits into your [pc.pussy], brusquely fingering you with clever, certain movements");
	output(". You quiver as she ravages you, pinioned upon her extremities at both ends, and she husks something wicked into your mouth, " + (hasCock ? "jacking" : "jilling") + " you harder. The next second she’s withdrawing her tongue, slithering up your esophagus and then past your own [pc.tongue], pulling away from you sharply. You heave for breath.");
	output("\n\n<i>“‘S why I’m interested in long tongues,”</i> she growls. <i>“For me, anyway. " + (InCollection(select, [1, 2, 3, 4]) ? "Yours is for other purposes." : "On you it’d be for other purposes.") + " Sub, dom... a tonsil toucher is something to have. I wanna have a selection of gene mods that produce ‘em in my shop.”</i>");
	
	processTime(4);
	pc.changeLust(20);
	
	clearMenu();
	addButton(0, "Next", seraTongueFuck, [select, hasCock]);
	
	return true;
}
public function seraTongueFuck(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	clearMenu();
	
	var select:int = arg[0];
	var hasCock:Boolean = arg[1];
	
	// If collar:
	if(wearingSeraCollar())
	{
		output("Her burning eyes travel downwards, to the gothic curlicue of black lace and leather strapped tightly around your neck.");
		output("\n\n<i>“I’ve got an app that keeps count of how many times you use that thing, you know,”</i> she murmurs, in a lower, sultry tone. <i>“And how many times you take it off.");
		if(seraCollarValue("fap") > 0 && days - seraCollarValue("fap") <= 7)
		{
			// PC has masturbated with and has taken it off in last 7 days:
			if(seraCollarValue("off") > 0 && days - seraCollarValue("off") <= 7) output(" I know you’ve been enjoying yourself. In your mouth, in your " + (seraCollarValue("fap") == seraCollarValue("vag") ? "pussy" : "ass pussy") + "... mmm, what a </i>good<i> slut. Taking it balls deep for Mistress, even when you’re light years away doing research for her.");
			// If PC has masturbated with it but hasn’t taken it off in last 7 days:
			else output(" I’m glad you’ve been enjoying the best dick in the galaxy. You’ve earned that. But no taking it off? I use <i>all</i> of your holes as and when, slut. Hard. So you better train ‘em all.");
		}
		else
		{
			// If PC has not masturbated with it, but has taken it off in last 7 days:
			if(seraCollarValue("off") > 0 && days - seraCollarValue("off") <= 7) output(" No masturbating... but plenty of deep throating. Saving yourself for the real thing, but still getting some training in? Oh, I like that a <b>lot</b>, slut!");
			// If PC has not masturbated with it in last 7 days:
			else output(" Which isn’t nearly enough. It’s not enough to just look pretty if you belong to me, bottom bitch; you gotta train. Get that thing up you on the regular, and sing my name as you do it.");
		}
		output("”</i>");
		output("\n\n");
	}
	output("Lust enlivens the succubus’s face as she goes on, and you have a single moment to draw breath before she presses the assault again, gripping you in her supple embrace so she can invade your mouth with her rolling, lavishing serpent of a tongue again, lips mushing over each other, curling around your own for a few moments before she penetrates your gullet with it, blocking out your air. She fucks your throat with it, thrusting into it back and forth, all the while her hand reaches between your [pc.thighs] and masturbates you furiously");
	if(hasCock) output(", tight grip whipping up and down your [pc.cock] until it’s straining and beading pre");
	else
	{
		output(", hot fingers curving into your [pc.vagina] and flicking away at your [pc.clits] ceaselessly until");
		if(pc.vaginas[0].clits == 1) output(" it’s straining out of its hood");
		else output(" they’re straining out of their hoods");
	}
	output(".");
	// If tail genitals:
	if(pc.hasTailGenital())
	{
		output(" Her spade tail wraps around your own tail until it looks like the galaxy’s most obscene medical symbol,");
		if(pc.hasTailCock()) output(" frotting your [pc.tailCocks] until " + (pc.tailCount == 1 ? "it’s" : "they’re") + " giddily bulging and straining");
		else output(" thrusting into " + (pc.tailCount == 1 ? "your" : "one of your") + " [pc.cuntTails] hard until it’s sopping and shimmering with joy");
		output(".");
	}
	
	pc.changeLust(100);
	
	output("\n\nYou are helpless to do anything but hold the curve of her back and take it, trying to do your best to relax and not gag to the singular sensation of her wet, eel-like appendage filling your mouth and throat, pulse thudding in your ears as the moments drag by, and then cumming like a caught fish yourself, seizing up and spurting");
	if(hasCock) output(" [pc.cum]");
	else output(" [pc.girlCum]");
	output(" all over her hand, transfixed upon the savage, expert movements of her fingers and upon her tongue, the asphyxiating kiss making it all the wilder and more intoxicating.");
	// Large output:
	if((hasCock && pc.cumQ() >= 1000) || (!hasCock && pc.girlCumQ() >= 1000)) output(" Your orgasm is, as ever, gratuitous, and you spray the floor of the shop with your " + (hasCock ? "seed" : "pussy juices") + ", led on by the relentless march of her " + (hasCock ? "jerking" : "fingering") + ".");
	output("\n\nYour muffled whines and moans combines with her own dark chuckle in the recesses of your mouth, and she withdraws, letting you take a couple of gasping breaths before going back to snogging you lasciviously one last time, tongues and lips rolling over each other as orgasm continues to tremble through your [pc.groin], before she departs with a pinching bite on your lower lip.");
	output("\n\n<i>“Mmm,”</i> she sighs, still holding you close, exploring around the insides of her mouth ruminatively. <i>“Tastes of fuck-slave.”</i>");
	// Lust/cum reset
	if((hasCock && pc.cumQ() < 1000) || (!hasCock && pc.girlCumQ() < 1000))
	{
		output("\n\nShe considers her own " + (hasCock ? "[pc.cum]" : "[pc.girlCum]") + "-smeared hand dispassionately, and then presents it to you. Holding her gaze, you obediently lick her clean, lapping away every trace of " + (hasCock ? "[pc.cumFlavor]" : "[pc.girlCumFlavor]") + ", finishing by sucking on her index finger. You receive a pleased smile and a stroke behind the [pc.ear] in return.");
		pc.orgasm();
		processTime(5);
		
		addButton(0, "Next", seraTongueFuckFin, false);
	}
	else
	{
		output("\n\nShe steps back and considers the respectably sized puddle of " + (hasCock ? "[pc.cum]" : "[pc.girlCum]") + " on the floor beneath you dispassionately.");
		output("\n\n<i>“You’re such a messy pet, aren’t you?”</i> She shakes her head. <i>“It’s fun making you squirt, but man, I don’t envy the person who has to clean that up.”</i> She sashays back behind her counter, tail swinging. <i>“");
		if(InCollection(select, [1, 2, 3, 4])) output("Good thing you’ve got that tongue.");
		else output("Like I said - you need to sort yourself out with a better tongue.");
		output(" Don’t take too long - I don’t want a customer slipping in it.”</i>");
		output("\n\nHumiliation burns on your cheeks as you " + (pc.hasKnees() ? "kneel" : "lower yourself") + " down over the " + (hasCock ? "[pc.cumVisc]" : "[pc.girlCumVisc]") + " pool and begin to lap it up. This tastes nowhere <i>near</i> as good going cold. The pleasant ache in your genitals and the fuzz of subspace help a lot, though...");
		pc.orgasm();
		processTime(20);
		
		addButton(0, "Next", seraTongueFuckFin, true);
	}
}
public function seraTongueFuckFin(lickedFloor:Boolean = false):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	
	if(lickedFloor)
	{
		output("Only after she’s considered the spit-polished cerami-synth floor with a sadist’s discerning eye does Sera");
		if(!wearingSeraCollar()) output(" let you get up");
		else output("’s spade tail catch the brass ring of your collar and orders you up with a stiff jerk");
		output(". Your mouth feels thoroughly despoiled, but the pleased smile and rub behind the [pc.ear] you receive from Mistress makes it all worthwhile. Probably.");
		output("\n\n");
	}
	output("<i>“Keep discovering interesting things out there and sticking them into you, my little researcher,”</i> Sera says, casually leaning over and pressing a button on her store screen. Your codex beeps the sweet sound of credits received a moment later. <i>“Remember to keep brushing your teeth, though. Oral hygiene is very important.”</i>");
	
	processTime(3);
	
	seraGetDosh();
	IncrementFlag("SERA_TONGUE_FUCKED");
	
	clearMenu();
	addButton(0, "Next", seraMenu);
}

// Sera Milkings
// Requirements: PC must be at least C cup, must be lactating
/*
Sera cuffs you up and gets some creamery and some puss. PC doesn’t necessarily have to be preg, anal variant possible.
Some breastfeeding requested.
Scene should be added to her standard sub rotation. If possible, scene should proc straight away if the PC qualifies after it is added.
*/
public function seraMilkingsStart():void
{
	seraMilkings([0]);
}
private var seraMilkTankVolReg:Number = 20000;
private var seraMilkTankVolBig:Number = 200000;
public function seraMilkings(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	clearMenu();
	
	var pageNum:int = (arg.length > 0 ? arg[0] : 0);
	var milkQ:Number = (arg.length > 1 ? arg[1] : 0);
	var vIdx:int = (arg.length > 2 ? arg[2] : -1);
	
	switch(pageNum)
	{
		case 0:
			showSera();
			
			var seraIsDad:Boolean = (StatTracking.getStat("pregnancy/sera kids") > 0 || pc.hasPregnancyOfType("SeraSpawnPregnancy"));
			
			output("<i>“Mistress.”</i>");
			output("\n\nSera gazes down at your [pc.chest] with her glowing eyes, claws drumming on the counter, expression inscrutable. The demon domme has a steaming cup reading ‘Galaxy’s #1 " + (seraIsDad ? "Dad" : "Domme") + "’ with her today; she takes a sip from it and twists her lip.");
			output("\n\n<i>“Look at those " + (pc.milkFullness < 75 ? "fat titties" : "swollen teats") + " of yours,”</i> she says softly.");
			if(flags["SERA_MILKINGS"] == undefined) output(" <i>“Give ‘em a squeeze and they spray everywhere. So much fun... but such a waste too. No more, though.”</i> The demon-morph grins at you in that crooked way she has that never fails to send a cold thrill running right through you. <i>“I’ve set something up, in the back. Just for you.”</i>");
			else output(" <i>“Practically dripping with slut calories. Crying out for your owner to give them a good... hard... milking. What do you say?”</i>");
			output("\n\n<i>“Yes Mistress,”</i> you mumble, heat shooting into your face. <i>“Please... please milk me.”</i>");
			if(pc.isPregnant() && pc.bellyRating() >= 10)
			{
				output("\n\n<i>“Do me a favor first,”</i> she says, teasing grin on her face. <i>“You aren’t wearing shoes right now, are you? Just... stand up. Stand right there, for a moment.”</i>");
				output("\n\nYou do so, the conditioned air moving over your naked [pc.skinFurScales] in the middle of the shop store, under the burning gaze of your Mistress. You realize why she’s made you do this when those eyes move down to your taut, round belly, and your face burns even more as you picture yourself.");
				output("\n\n<i>“Pregnant, naked and barefoot. Standing there, obediently waiting to be ordered around by " + (seraIsDad ? "daddy" : "me") + ".”</i> Sera groans in soft enjoyment, tracing her lips with a claw. <i>“");
				if(wearingSeraCollar()) output("With the collar on and all! ");
				if(pc.hasPregnancyOfType("SeraSpawnPregnancy")) output("I can’t believe you had to convince me so hard to knock you up. ");
				output("It’s so good, seeing the billionaire’s brat like that. So primal.”</i> Her teeth clench. <i>“One I can’t wait to get my nails into you. C’mon, babycakes. Time’s a-wasting.”</i>");
			}
			output("\n\nYou follow the beckoning tail and hypnotic purple form into the Dark Chrysalis’s back, where the succubus stores her merchandise and commits her more exquisitely nasty activities.");
			if(!seenSerasDungeon())
			{
				output(" You’re expecting her to lead you into her bedroom, but she strides right past, to the door at the far end.");
				output("\n\nThis is a spacious storage space, of the sort you’d find in the rear of any space station commercial lot. Or, at least, it was; the grey, synthetic floors and walls are slowly being devoured by matte black panelings, and bits and pieces of equipment that look distinctly like they’re geared more towards Sera’s pleasures than her work have been set up, or standing waiting forbiddingly for assemblage.");
				output("\n\n<i>“This is going to be my dungeon,”</i> she explains, gazing around her with a happy smile. <i>“I always intended to build one, once I had my own place. It’s coming along.");
				if(seraPartySuccess()) output(" Mostly thanks to you.”</i> She turns and grazes her claws along the line of your jaw lovingly.");
				else output("”</i>");
				output(" She raps a knuckle against one of the black panels. <i>“Soundproof. Once I’m done, nobody’ll be able to hear you scream. I’ll be able to make it pitch black in here too, so the only thing you’ll be able to see is...”</i> Sera points at her eyes. She’s beaming, already picturing it. <i>“It’s gonna be so good. For now, though...”</i>");
			}
			else
			{
				output(" Once again, Sera leads you past her bedroom to her half-constructed dungeon, where she conducts her more... industrial activities. You think it’s come together a little more since you were here last, the black paneling closing in on the remaining grey. The implication makes you shiver a bit, a fact not lost on Sera.");
				output("\n\n<i>“Aww, you a little cold?”</i> She runs her claws " + (pc.hasHair() ? "through" : "over") + " your [pc.hair] affectionately. <i>“Don’t worry. There’ll be plenty of ways for me to warm you up in here, once it’s finished.”</i> Her expression turns hungrier. <i>“For now, though...”</i>");
			}
			output("\n\nImpulsively she reaches in, seizing one of your breasts. You have a moment to see her mouth open, a wet red cavern with that sinuous beast of a tongue slathering out of it, and then it’s plastered itself over your [pc.nipple], licking and pulling at it ravenously. Claws and teeth prickle your sensitive flesh, making you gasp, and quickly the liquid wealth swollen within rises exquisitely to the surface, " + (!pc.canMilkSquirt() ? "spotting delicately into Sera’s mouth in response to her kneading lips" : "squirting heavily into Sera’s mouth, such is the dense pressure contained therein") + ".");
			output("\n\n<i>“Mmm,”</i> she purrs, breaking off for a moment. You see a drop of [pc.milk] disappear down her throat. <i>“");
			if(InCollection(pc.milkType, [GLOBAL.FLUID_TYPE_HONEY, GLOBAL.FLUID_TYPE_MILKSAP, GLOBAL.FLUID_TYPE_NECTAR])) output("Slut-honey, sticky and horny. So fucking decadent.");
			else if(InCollection(pc.milkType, [GLOBAL.FLUID_TYPE_STRAWBERRY_MILK, GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT, GLOBAL.FLUID_TYPE_FRUIT_CUM, GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM])) output("Fruity, drippy slut. Over-ripe and ready to pluck.");
			else if(InCollection(pc.milkType, [GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK, GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK]))
			{
				output("Fruity. Holy shit, what is that?”</i> You can actually see her pupils dilate as it hits her veins. She laughs, slightly giddy. <i>“I feel so... is that an aphro?”</i> She bites her lip, staring at you. <i>“Oh [pc.name]. I am going to fuck you so damn hard. Then I’m going to take another drag from those tits of yours, and do you again. Then you’re gonna tell me where you got the mod for those from.");
				
				chars["SERA"].lust(50);
			}
			else output("Slut-milk, straight from the source.");
			output(" Yes...”</i> she sighs beatifically, licking her lips. <i>“This is the shit I should be getting.”</i>");
			output("\n\nShe draws your other breast into her mouth, licking and pulling at you slower and more purposefully this time, her other hand grazing down over your [pc.belly] as she does it, drifting between your delta");
			if(pc.hasVagina() || pc.hasCock())
			{
				output(" to tease");
				if(pc.hasVagina()) output(" the lips of [pc.eachVagina]");
				else output(" [pc.eachCock]");
			}
			output(" with little strokes and pulls. You sigh with pleasure as " + (!pc.canMilkSquirt() ? "little spots and drops" : "little oozes and squirts") + " of [pc.milk] are produced by Sera’s ardent, hungry mouth, lust and a naughty thrill darting through you at nursing your Mistress like this.");
			output("\n\n<i>“Alright,”</i> the tall, horned human says lowly, breaking off. " + (pc.totalNipples() == 2 ? "Both" : "All") + " of your [pc.nipples] are wet and");
			if(pc.hasErectNipples()) output(" protrude like cherries");
			else output(" plush, leaking fluid like " + (!pc.hasCuntNipples() ? "aroused pussies" : "the aroused pussies they are"));
			output(". She flicks at one tender nub, making you gasp. <i>“Go stand over there, and grip the bar.”</i>");
			pc.changeLust(25);
			output("\n\n");
			
			processTime(4);
			// ++Lust
			milkQ = pc.milkQ();
			if(pc.hasVagina())
			{
				vIdx = pc.findEmptyPregnancySlot(1);
				if(vIdx < 0) vIdx = pc.cuntThatFits(chars["SERA"].cockVolume(0));
				if(vIdx < 0) vIdx = rand(pc.vaginas.length);
			}
			
			addButton(0, "Next", seraMilkings, [1, milkQ, vIdx]);
			break;
		case 1:
			showSera(true);
			
			output("A series of horizontal steel bars protrude from the wall on the opposite, like rungs leading nowhere. LEDs gleam around one a short distance above your head. You grip that one, and try and keep your breath steady as you feel Sera’s breasts press into your back, her soft thigh creeping around your own, her smoky breath in your ear as she reaches around you and cuffs your wrists to the bar. Light, cool vices on your [pc.skinFurScales] that ensure you aren’t going anywhere. You mumble something, you aren’t sure what, when she then loops a black, perforated rubber ball over your head.");
			output("\n\n<i>“This is for the neighbors’ good, sugarplum,”</i> Sera explains, pressing the ball gag against your [pc.lips] until you open up and accept it, mouth held open by the smooth, flavorless rubber. Its leather strap is firmly tightened around the back of your neck. <i>“Told you - not soundproofed yet. Also it is pretty sweet, making you drool.”</i>");
			output("\n\nIt’s difficult for you to turn like this, hands held helplessly above your heads with your [pc.boobs] exposed, so you can only listen to her drag across a " + ((flags["SERA_MILKINGS"] == undefined || flags["SERA_MILKINGS_OVERFLOW"] == undefined || milkQ < seraMilkTankVolReg) ? "moderately sized" : "huge") + " glass canister with the box device across, its dangling pods sprouting out the top like drooping glass orchids.");
			// First
			if(flags["SERA_MILKINGS"] == undefined)
			{
				output("\n\nSera’s brow is furrowed as she turns the suction on, experiments by placing her palm over the milker’s rubber mouths, and then carefully applies one to each of your [pc.nipples], only letting go when she’s sure they’re going to stay.");
				output("\n\n<i>“Min suck,”</i> she says, eyes flicking up to your face. <i>“How’s that?”</i>");
				output("\n\nIt’s clear she’s never done this before, and like all dommes is terribly self-conscious about performing in front of her bottoms. You help her by murmuring in muffled pleasure as the vacuum clutches at your areola, nibbling air around your already wet and tender [pc.nipples]. <i>Yes,</i> you tell her with your [pc.eyes], <i>I like this.</i>");
				output("\n\n<i>“Mmm. Good,”</i> she purrs, claws grazing your [pc.boobs]. <i>“But does it actually... ooh!”</i> she exclaims, as little beads of [pc.milkColor] start out of your nips, lovely, precious warmth oozing out of your nourishment-givers in response to the coaxing vacuum. <i>“It works!”</i>");
				output("\n\nYou sigh, flexing your trapped arms as your [pc.milk] spots the glass tubes, hurried away in drops down the curling tubes to the canister, a lovely, gentle sensation pulsing through your [pc.boobs]. Sera watches enthralled for a little while, delighted with how well her new toy interacts with her favorite one. Inevitably, though...");
				output("\n\n<i>“That’s the minimum setting. A cow slut like you needs plenty more juice than that, no?”</i> She’s clicked the dial up before you can respond. The machine throbs, the tubes quiver, and your [pc.nipples] are gripped fiercely by the tubes, puffed almost all the way inside them by a vacuum intent on milking poor chained you mercilessly hard. You whine around your ball gag, shaking helplessly against your bonds, and Sera laughs with glee.");
				output("\n\n<i>“There we gooooo,”</i> she coos, as " + (!pc.canMilkSquirt() ? "a sizeable spurt" : "a huge, rich spurt") + " of [pc.milk] blots out the cups. <i>“I knew you were holding out on me, you saucy bitch. Makes me wonder how much more you might give, with the right stimulation...”</i>");
				output("\n\nShe brushes her thigh and tail against your [pc.hip] as she stalks behind you. Your breath comes more ragged as she molests your bound, naked body freely, hands moving over your [pc.ass], up your sides to your boobs, which she gives a hard squeeze, tittering slightly at the fresh spurt into the sucking cups this causes. Hot, semi-hard meat presses between your [pc.thighs], hot-dogging itself in-between the soft flesh there.");
				output("\n\n<i>“So there’s this big, fat, dripping demon dick,”</i> she breathes in your ear. <i>“Fills cow slut " + (vIdx >= 0 ? "pussy" : "butt") + " pretty well, so I’ve heard. That something you might be interested in? Ooh... you know, I think you might be!”</i> Her hand is busy between your " + (vIdx >= 0 ? "cleft, fingering [pc.eachVagina]" : "ass cheeks, testing your [pc.anus] with her fingers") + ".");
				if(pc.isTreatedCow()) output("\n\n<i>“Mmm... mmmmmeeeeeerrrrph,”</i> you moan through the gag, making Sera laugh with glee.");
				output("\n\nYou can’t help it - bound and gagged like this, being teased and tormented by your Mistress whilst the milker attacks your inflamed [pc.nipples]... it’s a rush of subby sensations that is such a turn on. Above all, that wonderful feeling of giving from your body to the strict, unceasing vacuum... that fills your head as Sera draws her cock back " + (vIdx >= 0 ? "over the lips of your sopping pussy" : "between your buttocks") + " and presses the blunt head against your [pc.vagOrAss " + vIdx + "], clutching you by the boobs, setting her teeth into your shoulder and biting down with a hiss as she opens you up, helping herself to " + (vIdx >= 0 ? "the tender wetness inside" : "the tightness inside") + ".");
				
				if(vIdx >= 0) pc.cuntChange(vIdx, chars["SERA"].cockVolume(0));
				else pc.buttChange(chars["SERA"].cockVolume(0));
				
				output("\n\nBigger than your average dick, intense as ever as she slots more and more hot, unyielding cock-flesh into you, but fuck so good, so good when your chest is being stimulated like this. Saliva clogging your ball, you butt your [pc.ass] back into her, eager for her to go at you hard, one request she will always happily comply with. You huff and moan with pleasure, melting as her curvy thighs slap into you, a foot of purple slut-pleaser thrust energetically past your entrance repeatedly, your arousal ratcheting upwards.");
				if(pc.isPregnant() && pc.bellyRating() >= 10) output("\n\n<i>“Fucking... pregnant puss...”</i> she groans, transported as [pc.femcum] drools down her ardent shaft and balls, her hands spreading over your [pc.belly] as she rocks against you. <i>“So wet... so deep... gotta... give my baby momma what [pc.heShe] needs...”</i>");
			}
			// Repeat, low to moderate lactation
			else if(milkQ < seraMilkTankVolReg || flags["SERA_MILKINGS_OVERFLOW"] == undefined)
			{
				output("\n\nSera’s turns the suction on, and then carefully applies one to each of your [pc.nipples], only letting go when she’s sure they’re going to stay.");
				output("\n\n<i>“Min suck,”</i> she says. <i>“You like that, don’t you?”</i>");
				output("\n\nShe knows what she’s doing now, smirking as you murmur in response to the vacuum clutching at your areola, nibbling air around your already wet and tender [pc.nipples]. You know, already, you should savor the gentleness.");
				output("\n\n<i>“Mmm. Good,”</i> she purrs, claws grazing your [pc.boobs]. <i>“And how much have you... mmm.”</i> Little beads of [pc.milkColor] start out of your nips, lovely, precious warmth oozing out of your nourishment-givers in response to the coaxing vacuum.");
				output("\n\nYou sigh, flexing your trapped arms as your [pc.milk] spots the glass tubes, hurried away in drops down the curling tubes to the canister, a lovely, gentle sensation pulsing through your [pc.boobs]. Sera watches enthralled for a little while, delighted with how well her toys interact with one another. Inevitably, though...");
				output("\n\n<i>“That’s the minimum setting. A cow slut like you needs plenty more juice than that.”</i> She’s clicked the dial up before you can respond. The machine throbs, the tubes quiver, and your [pc.nipples] are gripped fiercely by the tubes, puffed almost all the way inside them by a vacuum intent on milking poor chained you mercilessly hard. You whine around your ball gag, shaking helplessly against your bonds, and Sera laughs with glee.");
				output("\n\n<i>“There we gooooo,”</i> she coos, as " + (!pc.canMilkSquirt() ? "a sizeable spurt" : "a huge, rich spurt") + " of [pc.milk] blots out the cups. <i>“I knew you were holding out on me, you saucy bitch. Makes me wonder how much more you might give, with the right stimulation...”</i>");
				output("\n\nShe brushes her thigh and tail against your [pc.hip] as she stalks behind you. Your breath comes more ragged as she molests your bound, naked body freely, hands moving over your [pc.ass], up your sides to your boobs, which she gives a hard squeeze, tittering slightly at the fresh spurt into the sucking cups this causes. Hot, semi-hard meat presses between your [pc.thighs], hot-dogging itself in-between the soft flesh there.");
				output("\n\n<i>“So there’s this big, fat, dripping demon herm dick,”</i> she breathes in your ear. <i>“Fills cow slut " + (vIdx >= 0 ? "pussy" : "butt") + " pretty well, so I’ve heard. That something you might be interested in? Ooh... you know, I think you might be!”</i> Her hand is busy between your " + (vIdx >= 0 ? "cleft, fingering [pc.eachVagina]" : "ass cheeks, testing your [pc.anus] with her fingers") + ".");
				if(pc.isTreatedCow()) output("\n\n<i>“Mmm... mmmmmeeeeeerrrrph,”</i> you moan through the gag, making Sera laugh with pure glee.");
				output("\n\nYou can’t help it - bound and gagged like this, being teased and tormented by your Mistress whilst the milker attacks your inflamed [pc.nipples]... it’s a rush of subby sensations that is such a turn on. Above all, that wonderful feeling of giving from your body to the strict, unceasing vacuum... that fills your head as Sera draws her cock back " + (vIdx >= 0 ? "over the lips of your sopping pussy" : "between your buttocks") + " and presses the blunt head against your [pc.vagOrAss " + vIdx + "], clutching your by the boobs, setting her teeth into your shoulder and biting down with a hiss as she opens you up, helping herself to " + (vIdx >= 0 ? "the tender wetness inside" : "the tightness inside") + ".");
				
				if(vIdx >= 0) pc.cuntChange(vIdx, chars["SERA"].cockVolume(0));
				else pc.buttChange(chars["SERA"].cockVolume(0));
				
				output("\n\nBigger than your average dick, intense as ever as she slots more and more hot, unyielding cock-flesh into you, but fuck so good, so good when your chest is being stimulated like this. Saliva clogging your ball, you butt your [pc.ass] back into her, eager for her to go at you hard, one request she will always happily comply with. You huff and moan with pleasure, melting as her curvy thighs slap into you, a foot of purple slut-pleaser thrust energetically past your entrance repeatedly, your arousal ratcheting upwards.");
				if(pc.isPregnant() && pc.bellyRating() >= 10) output("\n\n<i>“Fucking... pregnant puss...”</i> she groans, transported as [pc.femcum] drools down her ardent shaft and balls, her hands spreading over your [pc.belly] as she rocks against you. <i>“So wet... so deep... gotta... give my baby momma what [pc.heShe] needs...”</i>");
			}
			// Repeat, High to Mega Lactation
			else
			{
				output("\n\n<i>“Just for you, milk tank,”</i> she says, tapping the glass cylinder. It’s the same height as her. <i>“I had to find a farm equipment company to get one this size.”</i> She turns the suction on, and then carefully applies one to each of your [pc.nipples], only letting go when she’s sure they’re going to stay. <i>“It’s gonna be so worth it, though.”</i>");
				output("\n\nYou thrill slightly to the sight of it, knowing you’re going to be in for a long, hard milking. And you need it; your [pc.boobs] bulge with barely contained [pc.milk], all for Mistress. She knows what she’s doing now, smirking as you murmur in response to the vacuum clutching at your areola, nibbling air around your already wet and tender [pc.nipples].");
				output("\n\n<i>“Mmm. Good,”</i> she purrs, claws grazing your [pc.boobs]. <i>“And... yeah, that’s what I wanna see.”</i> It drips and then spurts out of your [pc.nipples] in warm, wet little trickles, your boobs drooling sumptuously in response to the gentle air.");
				output("\n\nYou close your eyes, flexing your trapped arms as your [pc.milk] spots the glass tubes, hurried away in drops down the curling tubes to the canister. Already, you want more - it’s not powerful enough to really get your milk churning. Sera’s grin widens when she sees you huff impatiently around you gag.");
				output("\n\n<i>“You want more do you, [pc.boyGirl]?”</i> she coos. <i>“You want me to really work those " + (pc.isTreatedCow() ? "teats" : "big juicy tits") + " of yours? Well... ok.”</i>");
				output("\n\nShe clicks the dial up. The machine throbs, the tubes quiver, and you groan with pleasure as your [pc.nipples] are gripped fiercely by the tubes, puffed almost all the way inside them by a vacuum intent on milking poor chained you mercilessly hard. You shudder against your cuffs, and Sera laughs with glee.");
				output("\n\n<i>“There we gooooo,”</i> she coos, as a huge, rich spurt of [pc.milk] blots out the cups. <i>“Now we’re cooking with gas.”</i> Her hand hovers over the dial. <i>“Why cook with gas when you can cook with octane, though?”</i>");
				output("\n\nThe machine moans as she clicks it to max, the tubes shake, and your teats are sucked into a vacuum intended for large farm animals. It’s on the verge of painful, but fuck it’s so good to feel that [pc.milk] bursting out of you in response, finally draining all that dense, liquid pressure you’ve been carrying around... a huge gush of it pours out of you, and it feels like it washes over your brain, blotting out everything but the sensation of being given the hard, ruthless milking you deserve.");
				output("\n\nSera brushes her thigh and tail against your [pc.hip] as she stalks behind you. Your breath comes more ragged as she molests your bound, naked body freely, hands moving over your [pc.ass], up your sides to your boobs, which she gives a hard squeeze, tittering slightly at the fresh spurt into the sucking cups this causes. Hot, semi-hard meat presses between your [pc.thighs], hot-dogging itself in-between the soft flesh there.");
				output("\n\n<i>“So there’s this big, fat, dripping demon herm dick,”</i> she breathes in your ear. <i>“You’d think only the sluttiest, loosest of " + (pc.isTreatedCow() ? "cow slaves" : "breeding bitches") + "’d be interested in it.”</i> Her hand is busy between your " + (vIdx >= 0 ? "cleft, fingering [pc.eachVagina]" : "ass cheeks, testing your [pc.anus] with her fingers") + ". <i>“Is that you? Would you like a good hard " + (vIdx >= 0 ? "screw" : "fuck up the ass") + " whilst you’re having your milkers seen to?”</i>");
				output("\n\nYou arch your back, eagerly presenting your " + (vIdx >= 0 ? "dripping pussy" : "[pc.ass]") + " for her. You can’t help it - bound and gagged like this, being teased and tormented by your Mistress whilst the milker attacks your inflamed [pc.nipples]... it’s a rush of subby sensations that is such a turn on. Above all, that wonderful feeling of giving from your body to the strict, unceasing vacuum... that fills your head as Sera draws her cock back " + (vIdx >= 0 ? "over the lips of your [pc.vagina " + vIdx + "]" : "between your buttocks") + " and presses the blunt head against your [pc.vagOrAss " + vIdx + "], clutching your by the boobs, setting her teeth into your shoulder and biting down with a hiss as she opens you up, helping herself to " + (vIdx >= 0 ? "the tender wetness inside" : "the tightness inside") + ".");
				
				if(vIdx >= 0) pc.cuntChange(vIdx, chars["SERA"].cockVolume(0));
				else pc.buttChange(chars["SERA"].cockVolume(0));
				
				output("\n\nBigger than your average dick, intense as ever as she slots more and more hot, unyielding cock-flesh into you, but fuck so good, so good when your chest is being stimulated like this. Saliva clogging your ball, you butt your [pc.ass] back into her, eager for her to go at you hard, one request she will always happily comply with. You huff and moan with pleasure, melting as her curvy thighs slap into you, a foot of purple slut-pleaser thrust energetically past your entrance repeatedly, your arousal ratcheting upwards.");
				if(pc.isPregnant() && pc.bellyRating() >= 10) output("\n\n<i>“Fucking... pregnant puss...”</i> she groans, transported as [pc.femcum] drools down her ardent shaft and balls, her hands spreading over your [pc.belly] as she rocks against you. <i>“So wet... so deep... gotta... give my baby momma what [pc.heShe] needs...”</i>");
			}
			pc.changeLust(35);
			output("\n\n");
			
			processTime(9);
			
			// ++Lust
			
			addButton(0, "Next", seraMilkings, [2, milkQ, vIdx]);
			break;
		case 2:
			showSera(true);
			
			processTime(32);
			var cums:int = 0;
			
			// First
			// Repeat, low to moderate lactation
			if(flags["SERA_MILKINGS"] == undefined || milkQ < seraMilkTankVolReg || flags["SERA_MILKINGS_OVERFLOW"] == undefined)
			{
				output("It doesn’t take you long to orgasm quiveringly,");
				if(vIdx >= 0) output(" your [pc.vagina] clenching up and " + (!pc.isSquirter() ? "drooling" : "spurting") + " [pc.femcum] in response to the magical thrust and beat of your Mistress’s cock,");
				else if(pc.hasCock()) output(" [pc.cum] leaking slowly down your semi-erect shaft as your prostate is milked as relentlessly as your breasts are,");
				output(" saliva clogging your ball-gag as you whine with joy, trapped hands balling up.");
				// Low-moderate lactation
				if(milkQ < seraMilkTankVolReg)
				{
					output("\n\nYour [pc.boobs] go into overdrive in response to the hot pleasure pulsing through you, and ecstatic little spurts of [pc.milk] blot out the glass cups, the tubes turning [pc.milkColor].");
					output("\n\n<i>“Yeah, that’s what I thought... that’s what I fucking thought,”</i> snarls Sera passionately, seizing your breasts and squeezing hard, making you squeal and spurt and shake against your chains. Fluids run down your [pc.thighs] as she pumps her cock into your " + (vIdx >= 0 ? "oozing, simmering cunt" : "abused asshole") + " furiously. <i>“Put some cock up you and you’re like a soaked sponge! And I’m " + (flags["SERA_MILKINGS"] == undefined ? "gonna" : "here to") + " squeeze out every... last... drop.”</i> She emphasises her words with one " + (flags["SERA_MILKINGS"] == undefined ? "dirty" : "ardent") + " slap of her thighs against your [pc.ass] after another.");
					output("\n\nGetting milked and fucked at the same time like this is a heady, glorious experience, quickly spinning you down into mewling, blissful subspace, happy to be your Mistress’s cowslave, giving her all the milk and " + (vIdx >= 0 ? "pussy" : "ass") + " she desires. Void, she gets so filthily eloquent when she gets into this state... You orgasm once, twice more, each time a bit more warm [pc.milkFlavor] shaken out of you, eyes rolling at the intense sensation. Sera orgasms spectacularly with you the last time, a huge rocket of demon cum warming your " + (vIdx >= 0 ? "inner pussy" : "bowels") + ", quickly spurting thickly out over your [pc.thighs] and her clenching balls as she howls and swears with delight.");
					
					// Lust reset, Milk reset
					if(vIdx >= 0) pc.loadInCunt(chars["SERA"], vIdx);
					else pc.loadInAss(chars["SERA"]);
					pc.milked(100);
					for(cums = 0; cums < 5; cums++) { pc.orgasm(); }
					chars["SERA"].orgasm();
					
					output("\n\n<i>“One fucking damn,”</i> she sighs, soft, sweat-dappled breasts pressing again on your back, nails trailing over your [pc.hair]. <i>“I’m gonna have so much fun with you in here.”</i>");
					output("\n\nA muffled whimper from you makes her focus on your [pc.boobs]. You have been kneaded utterly dry, but the milkers don’t care: they continue to pull mercilessly at your hugely inflamed [pc.nipples], starting out around the sides. Sera withdraws from your gaped " + (vIdx >= 0 ? "twat" : "asshole") + " in a cascade of sexual fluids and fiddles with the box. Mercifully, the vacuum quits, although Sera needs to pull the pods off herself, such is the swelling.");
					output("\n\n<i>“Aww,”</i> she laughs, gazing down at your throbbing teats. She raises her claw and then puts it down again, clearly suppressing an urge to flick them only with difficulty. <i>“Are they a little tender?”</i>");
					output("\n\nShe picks up the moderately sized glass tanker and examines it. " + (milkQ < 5000 ? "There’s a few inches of [pc.milkColor] swirling around in there, as much as you’d expect a pregnant human to give." : "It’s close to full of warm [pc.milk], an impressive amount of bounty harvested from your generous tits, and you feel a glow of pride."));
					output("\n\n<i>“Lovely,”</i> Sera says, admiring the liquid wealth. <i>“Cream and sweetener for my coffee for the next week.”</i> Her eyes slide meaningfully back to you. <i>“Then I’m gonna want more.”</i> She puts it down and gives you a long, passionate kiss, her long tongue filling your mouth, owning it with its writhing explorations as her pert lips move over yours. <i>“My sweet little " + ((pc.isPregnant() && pc.bellyRating() >= 10) ? "baby factory" : "cow slut") + ".”</i>");
				}
				// High-Mega Lactation
				else
				{
					output("\n\nYour [pc.boobs] go into overdrive in response to the hot pleasure pulsing through you, and you ecstatically surge [pc.milk] into the glass cups, the tubes first turning completely [pc.milkColor], then shaking with the volume being drawn out.");
					output("\n\nYou’re releasing the deep cream, kept trembling and pent up inside of you for a moment like this, and fuck it’s so good to spurt it all out of your tender [pc.nipples]! You squeal and " + (pc.isTreatedCow() ? "moo" : "moan") + " as the liquid warmth jets out of you.");
					output("\n\n<i>“Yeah, that’s what I thought... that’s what I fucking thought,”</i> snarls Sera, lost in the throws of passion, seizing your breasts and squeezing hard. That’s... a mistake. A huge spurt of [pc.milkFlavor] fluid fills the cups entirely, backs up the tubes and then forces them off your udders, your [pc.boobs] no longer able to be contained by such modest equipment.");
					output("\n\n<i>“Holy... holy shit,”</i> the succubus groans, staring at your wildly shaking tits spattering milk all over the floor. But she’s too into it to stop, too into emphatically pumping her cock into your " + (vIdx >= 0 ? "oozing, simmering cunt" : "abused asshole") + ", and so you continue with your [pc.boobs] hanging down and drooling like partially opened taps.");
					
					// Lust reset, Milk reset
					if(vIdx >= 0) pc.loadInCunt(chars["SERA"], vIdx);
					else pc.loadInAss(chars["SERA"]);
					pc.milked(100);
					for(cums = 0; cums < 8; cums++) { pc.orgasm(); }
					chars["SERA"].orgasm();
					
					output("\n\nJust because you’re no longer being actively milked doesn’t slow down your bountiful tits: they react wonderfully to every sumptuous thrust of your Mistress’s dick. You orgasm once, twice more, and each time you spurt rich [pc.milkColor] all over the floor and wall, bliss trembling through you. eyes rolling");
					if(pc.isTreatedCow()) output(" and slutty, muffled moos forced out of your throat");
					output(" to the intense sensation. Sera orgasms spectacularly with you the last time, a huge rocket of demon cum warming your " + (vIdx >= 0 ? "inner pussy" : "bowels") + ", quickly dripping thickly out over your [pc.thighs] and her clenching balls as she howls and swears with delight.");
					output("\n\n<i>“Alright. Wow. Fuck,”</i> she says at last, boobs rested on your back, staring over your shoulder at your own set of crowd-pleasers. They continue to drip and ooze freely, adding to the heavy [pc.milkColor] mess you’ve left all over the floor. Her hands shift around, stroking your [pc.boobs] wonderingly.");
					output("\n\n<i>“Ordinarily I’d probably give you a paddling and then make you lick that up,”</i> she says. <i>“But this is my fault, isn’t it? I wasn’t prepared for the amount of snack you carry around with you.”</i> She strokes your [pc.hair]. <i>“We’ll make this a test run, ok? I’ll be better prepared next time.”</i>");
					output("\n\nShe picks up the moderately sized glass tanker and examines it. The only reason it’s not filled to the brim with [pc.milkColor] calories is that the milkers broke off too soon. You feel a glow of pride.");
					output("\n\n<i>“Lovely,”</i> Sera says, admiring the liquid wealth. <i>“Cream and sweetener for my coffee for the next week.”</i> Her eyes slide meaningfully back to you. <i>“Then I’m gonna want more.”</i> She puts it down and gives you a long, passionate kiss, her long tongue sliding into your mouth, owning it with its writhing explorations as her pert lips move over yours. <i>“My sweet little " + ((pc.isPregnant() && pc.bellyRating() >= 10) ? "baby factory" : "cow slut") + ".”</i>");
					
					milkQ = (seraMilkTankVolReg - Math.floor(seraMilkTankVolReg * 0.10));
					if(flags["SERA_MILKINGS_OVERFLOW"] == undefined || flags["SERA_MILKINGS_OVERFLOW"] < 1) flags["SERA_MILKINGS_OVERFLOW"] = 1;
				}
			}
			// Repeat, High to Mega Lactation
			else
			{
				output("Your [pc.boobs] go into overdrive in response to the hot pleasure pulsing through you, and you ecstatically surge [pc.milk] into the glass cups, the tubes first turning completely [pc.milkColor], then shaking with the volume being drawn out.");
				output("\n\nYou’re releasing the deep cream, kept trembling and pent up inside of you for a moment like this, and fuck it’s so good to spurt it all out of your tender [pc.nipples]! You squeal and " + (pc.isTreatedCow() ? "moo" : "moan") + " as the liquid warmth jets out of you.");
				output("\n\n<i>“Yeah, all of it... all of it!”</i> snarls Sera, lost in the throws of passion, seizing your breasts and squeezing hard. The sweet liquid chatters like a stream as it pours into the canister steadily, litre after litre filling the human-sized container. Skilfull, sharp fingers knead your bulky softness, bring you to one unbearably good boobgasm after another, drool hanging down from your gagged mouth.");
				// Mega lactation
				if(milkQ > seraMilkTankVolBig)
				{
					output("\n\nEven industrial equipment is no match for your herculean tits. Once again, the fluid backs up, the tank completely full, and [pc.milk] is still gushing out of your [pc.nipples]. The pods come loose in warm spurts of [pc.milkColor].");
					output("\n\n<i>“Holy... holy shit,”</i> the succubus groans, staring at your wildly shaking tits spattering milk all over the floor. But she’s too into it to stop, too into emphatically pumping her cock into your " + (vIdx >= 0 ? "oozing, simmering cunt" : "abused asshole") + ", and so you continue with your [pc.boobs] hanging down and drooling like partially opened taps.");
					output("\n\nJust because you’re no longer being actively milked doesn’t slow your boobs down: they react wonderfully to every sumptuous thrust of your Mistress’s dick. You orgasm once, twice more, and each time you spurt rich [pc.milkColor] all over the floor and wall, bliss trembling through you. eyes rolling");
					if(pc.isTreatedCow()) output(" and slutty, muffled moos forced out of your throat");
					output(" to the intense sensation. Sera orgasms spectacularly with you the last time, a huge rocket of demon cum warming your " + (vIdx >= 0 ? "inner pussy" : "bowels") + ", quickly dripping thickly out over your [pc.thighs] and her clenching balls as she howls and swears with delight.");
					
					// Lust reset, Milk reset
					if(vIdx >= 0) pc.loadInCunt(chars["SERA"], vIdx);
					else pc.loadInAss(chars["SERA"]);
					pc.milked(100);
					for(cums = 0; cums < 12; cums++) { pc.orgasm(); }
					chars["SERA"].orgasm();
					
					output("\n\n<i>“Alright. Wow. Fuck,”</i> she says at last, boobs rested on your back, staring over your shoulder at your own set of crowd-pleasers. They continue to drip and ooze freely, adding to the heavy [pc.milkColor] mess you’ve left all over the floor. Her hands shift around, stroking your [pc.boobs] wonderingly.");
					output("\n\n<i>“Didn’t really know what I was getting into when I decided it’d be neat to milk you, did I?”</i> she sighs. <i>“You’re a messy bitch who’s too milky for your own good.”</i> She reaches over and removes the ball gag, stroking your [pc.ass] as she does so. You tense up slightly. You can guess what’s coming.");
					output("\n\n<i>“What are you?”</i>");
					output("\n\n<i>“I’m a... a messy...”</i> You gasp as the palm of her hand lands on your left buttock, the fleshy sound reverberating off the walls.");
					
					var dom:Sera = (chars["SERA"] as Sera);
					var sub:PlayerCharacter = (pc as PlayerCharacter);
					var actualDamage:TypeCollection = new TypeCollection( { kinetic: 5, tease: 2 }, DamageFlag.BYPASS_SHIELD );
					var damageResult:DamageResult;
					var smacks:int = 0;
					
					damageResult = applyDamage(actualDamage, dom, sub, "minimal");
					
					output("\n\n<i>“Start again.”</i> Sharp, flat pain lands on your right buttock. <i>“What are you?”</i>");
					
					damageResult = applyDamage(actualDamage, dom, sub, "minimal");
					
					output("\n\n<i>“I’m a messy bitch who’s too... milky for my own good,”</i> you manage. Spank, spank, spank goes her hand on your [pc.ass] rhythmically as you say it, motion shivering up to your hanging udders.");
					
					for(smacks = 0; smacks < 3; smacks++)
					{
						damageResult = applyDamage(actualDamage, dom, sub, "suppress");
						if (damageResult.totalDamage > 0) { output("\n"); outputDamage(damageResult); }
					}
					
					output("\n\n<i>“Again.”</i>");
					output("\n\n<i>“I’m a --”</i> SLAP. <i>“-- messy bitch who’s too --”</i> SMACK. <i>“-- milky for my own --”</i> SLAP. <i>“-- good!”</i>");
					
					for(smacks = 0; smacks < 3; smacks++)
					{
						damageResult = applyDamage(actualDamage, dom, sub, "suppress");
						if (damageResult.totalDamage > 0) { output("\n"); outputDamage(damageResult); }
					}
					
					output("\n\n<i>“Good [pc.boy].”</i> A hot hand strokes your blushing face. <i>“You’ve paid for the clean-up I’m gonna have to do.”</i>");
					output("\n\nShe’s examining the tanker as you’re feeling your tender wrists. The only reason it’s not filled to the brim with [pc.milkColor] calories is that the milkers broke off too soon. You feel a glow of exhausted pride.");
					output("\n\n<i>“What am I going to do with all this?”</i> Sera laughs in soft amazement, admiring the liquid wealth. <i>“I don’t need coffee THAT much.”</i> Her eyes slide meaningfully over to you. <i>“Not that that’s gonna stop me doing it to you whenever I get the chance.”</i> She puts it down and gives you a long, passionate kiss, her long tongue sliding into your mouth, owning it with its writhing explorations as her pert lips move over yours. <i>“My sweet little " + ((pc.isPregnant() && pc.bellyRating() >= 10) ? "baby factory" : "cow slut") + ".”</i>");
					
					milkQ = (seraMilkTankVolBig - Math.floor(seraMilkTankVolBig * 0.10));
					if(flags["SERA_MILKINGS_OVERFLOW"] == undefined || flags["SERA_MILKINGS_OVERFLOW"] < 2) flags["SERA_MILKINGS_OVERFLOW"] = 2;
				}
				else
				{
					output("\n\nGetting milked and fucked at the same time like this is a heady, glorious experience, quickly spinning you down into mewling, blissful subspace, happy to be your Mistress’s cowslave, giving her all the milk and " + (vIdx >= 0 ? "pussy" : "ass") + " she desires. Void, she gets so filthily eloquent when she gets into this state... and now your tits are connected to a vessel that can take every last drop that she screws out of you. Your whimpers of delight twine with the gurgle of warm liquid, litre after litre drawn out of your shaking [pc.chest].");
					output("\n\nYou cum repeatedly, full body tremors, each time a bit more warm [pc.milkFlavor] shaken out of you, eyes rolling at the intense sensation. Sera orgasms spectacularly with you the last time, a huge rocket of demon cum warming your " + (vIdx >= 0 ? "inner pussy" : "bowels") + ", quickly spurting thickly out over your [pc.thighs] and her clenching balls as she howls and swears with delight.");
					
					// Lust reset, Milk reset
					if(vIdx >= 0) pc.loadInCunt(chars["SERA"], vIdx);
					else pc.loadInAss(chars["SERA"]);
					pc.milked(100);
					for(cums = 0; cums < 8; cums++) { pc.orgasm(); }
					chars["SERA"].orgasm();
					
					output("\n\n<i>“One fucking damn,”</i> she sighs, soft, sweat-dappled breasts pressing again on your back, nails trailing over your [pc.hair]. <i>“I’m gonna have so much fun with you in here.”</i>");
					output("\n\nA muffled grunt from you makes her focus on your [pc.boobs]. You have been kneaded utterly dry, but the milkers don’t care: they continue to pull mercilessly at your hugely inflamed [pc.nipples], starting out around the sides. Sera withdraws from your gaped " + (vIdx >= 0 ? "twat" : "asshole") + " in a cascade of sexual fluids and fiddles with the box. Mercifully, the vacuum quits, although Sera needs to pull the pods off herself, such is the swelling.");
					output("\n\n<i>“Aww,”</i> she laughs, gazing down at your throbbing teats. She raises her claw and then puts it down again, clearly suppressing an urge to flick them only with difficulty. <i>“Are they a little tender?”</i>");
					output("\n\nShe examines the human-sized vessel. It’s close to full of warm [pc.milk], a massive amount of bounty harvested from your lavish tits, and you feel a glow of exhausted, sweaty pride.");
					output("\n\n<i>“Man,”</i> Sera says, shaking her head in awe. <i>“What am I even gonna do with all this? I don’t like coffee THAT much.”</i> Her eyes slide meaningfully back to you. <i>“I’ll think of something. Cuz we’re definitely gonna be doing this more.”</i> She puts it down and gives you a long, passionate kiss, her long tongue filling your mouth, owning it with its writhing explorations as her pert lips move over yours. <i>“My sweet little " + ((pc.isPregnant() && pc.bellyRating() >= 10) ? "baby factory" : "cow slut") + ".”</i>");
				}
			}
			output("\n\n");
			
			addButton(0, "Next", seraMilkings, [3, milkQ, vIdx]);
			break;
		case 3:
			showSera();
			
			output("A little while later, you’re back in your [pc.gear] and out in the shop front, stroking your wrists. Your [pc.boobs] and [pc.groin] ache mightily in that way that tell you you’ve just had a thoroughly rigorous experience with the heavily modded sadist that is your owner.");
			output("\n\n<i>“Mmm,”</i> she says, taking a long sip of her coffee as she examines her stock reports, smacking her lips. <i>“Just right.”</i>");
			output("\n\n");
			
			processTime(5);
			
			IncrementFlag("SERA_MILKINGS");
			StatTracking.track("milkers/sera milker", Math.min(Math.floor(milkQ), seraMilkTankVolBig));
			// Milk can last for 2 weeks. Chance will randomly increase when she's craving some cream.
			if(flags["SERA_MILK_RESERVE_DAYS"] == undefined) flags["SERA_MILK_RESERVE_DAYS"] = 0;
			flags["SERA_MILK_RESERVE_DAYS"] += 14;
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}
public function seraDrinksMilk(totalDays:int = 0):void
{
	if(flags["SERA_MILK_RESERVE_DAYS"] != undefined)
	{
		if(totalDays != 0) flags["SERA_MILK_RESERVE_DAYS"] -= totalDays;
		if(flags["SERA_MILK_RESERVE_DAYS"] < 0) flags["SERA_MILK_RESERVE_DAYS"] = 0;
	}
}

// More Dom Sera
// Punishing Fix
// Requirements: PC completed party event, hasn’t been activated in 24 hours. Add to standard rotation. If possible have it the first to be activated if PC meets requirements, so players can get at it easily after it is added.
public function seraPunishingFixStart():void
{
	var cIdx:int = -1;
	var vIdx:int = -1;
	if(pc.hasCock())
	{
		cIdx = pc.biggestCockIndex();
	}
	if(pc.hasVagina())
	{
		vIdx = pc.findEmptyPregnancySlot(1);
		if(vIdx < 0) vIdx = pc.cuntThatFits(chars["SERA"].cockVolume(0));
		if(vIdx < 0) vIdx = pc.wettestVaginaIndex();
	}
	
	seraPunishingFix(["intro", cIdx, vIdx]);
}
public function seraPunishingFix(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	clearMenu();
	
	var response:String = (arg.length > 0 ? arg[0] : "intro");
	var cIdx:int = (arg.length > 1 ? arg[1] : -1);
	var vIdx:int = (arg.length > 2 ? arg[2] : -1);
	
	switch(response)
	{
		case "intro":
			showBust("SERA");
			showName("\nSERA");
			
			output("<i>“I’ve been waiting for you.”</i> A tiny piece of ice slides down your back as Sera grins down at you toothily. <i>“I need an assistant for something. Take off your shit.”</i>");
			output("\n\nYou do so, baring your [pc.skinFurScales] and all your sensitive bits to the infernal gaze of your Mistress. You try to keep your breath steady as she bends down, the softness of her breasts pillowing into your shoulders as she snaps your wrists together behind your back with those old-fashioned handcuffs of hers with practiced ease, forcing your [pc.chest] outwards.");
			if(wearingSeraCollar())
			{
				output("\n\nShe rises to admire you, naked and knelt before her demonically luscious form.");
				output("\n\n<i>“Cuffed and collared,”</i> she murmurs, touching her lips. <i>“You look so lovely like that, you know that? Missing a gag I suppose, but... well, maybe we’ll get to that.”</i>");
			}
			output("\n\nShe snaps her claws as she turns and sways towards the back of her store, tail swishing along behind her.");
			output("\n\n<i>“Come.”</i>");
			output("\n\nAwkwardly, flexing futilely against your cuffs, you clamber to your [pc.feet] and follow, that familiar sensation of dread and fluttery excitement blooming in your gut.");
			
			processTime(4);
			// +Lust
			pc.changeLust(12);
			output("\n\n");
			
			addButton(0, "Next", seraPunishingFix, ["dungeon", cIdx, vIdx]);
			break;
		case "dungeon":
			showBust("SERA","FIX");
			showName("\nSERA & FIX");
			
			if(!seenSerasDungeon())
			{
				output("You’re expecting her to lead you into her bedroom, but she strides right past, to the door at the far end. ");
				output("\n\nThis is a spacious storage space, of the sort you’d find in the rear of any space station commercial lot. Or, at least, it was; the grey, synthetic floors and walls are slowly being devoured by matte black panelings, and bits and pieces of equipment that look distinctly like they’re geared more towards Sera’s pleasures than her work have been set up, or standing waiting forbiddingly for assemblage.");
				output("\n\n<i>“This is going to be my dungeon,”</i> she explains, gazing around her with a happy smile. <i>“I always intended to build one, once I had my own place. It’s coming along.");
				if(seraPartySuccess()) output(" Mostly thanks to you.”</i> She turns and grazes her claws along the line of your jaw lovingly.");
				else output("”</i>");
				output(" She raps a knuckle against one of the black panels. <i>“Soundproof. Once I’m done, nobody’ll be able to hear you scream. I’ll be able to make it pitch black in here too, so the only thing you’ll be able to see is...”</i> Sera points at her eyes. She’s beaming, already picturing it. <i>“It’s gonna be so good. For now, though...”</i>");
			}
			else
			{
				output("Your gut turns over again as she strides right past her bedroom to the door at the far end. You already know that means she has something heavy duty lined up today. Your [pc.skin] prickles as you enter the airy, half-constructed blackness of Sera’s dungeon.");
			}
			output("\n\nOn the wall to the left three long metal bars have been fixed, one horizontal over two vertical, forming an ‘n’ shape. Its purpose is made obvious by the fact that somebody is naked and spread-eagled taut between them, bound by his hands and feet. It’s a petite male kaithrit, the fur on his tails and the hair on his head sandy, milky skin luminous in the gloom. He’s bound facing the wall, so you can see his cute, peachy bum - and the strappings of the chastity device clasped around his groin.");
			output("\n\n<i>“You remember Fix, don’t you [pc.name]?”</i> Sera coos as she sashays across to the kaithrit. She’s got half a dozen candles lit around him, as if he were some sort of demonic sacrifice, and they give the space that flickering, gloomy atmosphere that makes anything feel possible. Fix emits a muffled moan, shivering as Sera gently scrapes her claws down the slim curve of his back. When he arches his neck like that, you can see he’s ball-gagged and blindfolded.");
			output("\n\n<i>“He’s my good little boi. Well, usually. Today he was late for his session, forgot to address me as Mistress - and then had the pebbles to beg me to let him out of his cage!”</i>");
			output("\n\nSera looks over her shoulder at you, her sneer inviting you to share in her outrage.");
			output("\n\n<i>“So now he’s getting punished.”</i> The purple-skinned succubus bends down, displaying the lush fruit-bowl of her backside and pussy to you as she plucks a whip off the floor. <i>“I’m going to weave a tapestry of pain on his ass, and afterwards the worm is going to lick the tips of my boots in gratitude. Least if he knows what’s good for him.”</i>");
			output("\n\nYou flinch as she whirls the whip, delivering a fleshy flick to Fix’s shoulder. He squeals into his gag, swaying like an obscene wall-hanging in the wind; she murmurs with pleasure.");
			output("\n\n<i>“Your job?”</i> Sera smiles at you lovingly. <i>“Sit there - that’s right, in front of him, good.”</i>");
			output("\n\nYou try and remain calm as she fixes another long, straight metal bar to the back of your head, padded so that it won’t discomfit you, and clips it to the chain of your cuffs and to the carpet with hard light fixtures. You find, once she rises away again, that the bar both supports your head, and prevents you from changing position as you are, knelt naked and chained to the floor.");
			output("\n\nSera turns her attention back to her helpless kaithrit slave, sticking her tongue out thoughtfully as if she were an artist considering her canvas.");
			output("\n\n<i>“You’re my chair. Tiring work, torture. And there’s nothing like getting your pussy eaten as you do it.”</i>");
			
			processTime(5);
			// +Lust
			pc.changeLust(15);
			output("\n\n");
			
			addButton(0, "Next", seraPunishingFix, ["bound", cIdx, vIdx]);
			break;
		case "bound":
			showBust("SERA","FIX");
			showName("\nSERA & FIX");
			
			output("You kneel, hands bound behind your back, and watch Sera work Fix over for... who knows. It’s impossible to tell how much time passes while in here, within the dark spell she casts over this room; there’s only her wonderful, profane body slowly clacking backward and forward in front of the slim, spread-eagled kaithrit, with that luminous, freckle-speckled skin of his that turns out to be so tragically sensitive.");
			output("\n\nPart of Sera’s breathtaking malice is that she never stays with one type of torment long enough for her slave to get used to it. You watch her draw red lines on Fix’s back, ass and thighs with her whip, delivered with one whirling snap of her whip after another, syncopated so the shivering sub doesn’t know when the next one is going to land... then she unbuckles his chastity device, curling one hand around his short, fat cock, jerking him slowly as she whispers in her ear, tongue touching his lobe as he quivers, moans, tight ballsack clenching as he nears release... and then she pulls away, clicks his cage back in place, and rams an electroshock device into his taint.");
			output("\n\nEvery so often she pulls back, flares her butt cheeks and sits herself down on your upraised face, swaddling your eyes and forehead in soft ass flesh, the bar behind you taking her weight but also smushing your face deep into her waiting wet sex. You dutifully lick her, unfurling her cunt with flicks of your [pc.tongue] and delving deep into her slippery, tangy insides, nose buried between her buttocks.");
			output("\n\nIt’s undeniably pleasurable to be used like this, something perversely arousing about rewarding her sadism with plentiful oral, and with hot, hard lust");
			if(cIdx >= 0) output(" veining through [pc.eachCock]");
			else if(vIdx >= 0) output(" moistening [pc.eachVagina]");
			else output(" thrumming through your [pc.asshole]");
			output(" you lick her with increasing ardor, flicking at her clit before burying your [pc.tongue] into her hole, coaxing little dribbles of tangy juice into your mouth.");
			output("\n\nShe hums and sighs with pleasure, her curvy butt plumped on your face as she deliberates her next piece of sadism, spade tail tickling your back, the obscene, slippery sounds of pussy worship filling the dark, still room.");
			output("\n\n<i>“Mmm. Hear that, Fix?”</i> she purrs. <i>“That’s what you could be enjoying, if you’d just learn to be a good boy.”</i>");
			output("\n\nSera returns to the transfixed cat boy with a vengeance, sliding a piece of ice over the welts on his back whilst pincering one of his small, pink nipples with her claws, assaulting his senses with a vivid mixture of sensations. She laughs with genuine delight as he grunts and wordlessly yowls for mercy through his gag, and returns to your sex-glazed face eagerly.");
			output("\n\n<i>“Yeah,”</i> she snarls, riding your [pc.tongue] with fervent jerks of her thick thighs, butt slapping against your forehead now, reptilian eyes fixed upon the marked, panting kaithrit. <i>“Polish that cunt, slave! Oh yeah! I fucking deserve this!”</i>");
			output("\n\nGetting your face ridden like a dildo in this awkward, fixed position is tough, but you do your best for your mistress, smitten with her drooling pussy, lapping at its inhumanly spry innards. You are rewarded with a spurt of femcum over your [pc.lips] and chin, Sera crowing with glee as she reaches an orgasm made spectacular by the tableau of sadism she’s created for herself.");
			
			processTime(11);
			// ++Lust
			pc.changeLust(32);
			output("\n\n");
			
			addButton(0, "Next", seraPunishingFix, ["fix", cIdx, vIdx]);
			break;
		case "fix":
			showBust("SERA","FIX");
			showName("\nSERA & FIX");
			
			output("You feel a glow of satisfaction when at last she lifts her weight off you and turns, favoring you with a big beam and a loving stroke of your face and [pc.hair]. Her eyes, burning bright in the gloom, drift down further to your [pc.groin], and the succubus’s smile curls into impishness. You open your mouth as her warm tail slithers up your [pc.thigh]");
			if(cIdx >= 0) output(", curling its ropiness around your semi-erect [pc.cockNoun " + cIdx + "] and begins to gently squeeze");
			else if(vIdx >= 0) output(", gently playing with the entrance to your [pc.vagina " + vIdx + "], flicking at the hood of your [pc.clit " + vIdx + "]");
			output(".");
			output("\n\n<i>“You’ve been such a good [pc.boyGirl], I’m gonna let you decide,”</i> Sera purrs, as pleasure veins into your core. <i>“What do you think: has Fix has had enough for one day?”</i>");
			output("\n\nYou gaze up at the bound, blindfolded twinkish kaithrit, the pale skin of his back, butt and legs covered with marks. He seems to be holding his breath.");
			output("\n\n");
			
			processTime(2);
			
			// [Yes] [No]
			addButton(0, "Yes", seraPunishingFix, ["yes", cIdx, vIdx], "Yes", "The poor cat boy has clearly been through enough.");
			addButton(1, "No", seraPunishingFix, ["no", cIdx, vIdx], "No", "Not even slightly, in your humble opinion.");
			break;
		case "no":
			showBust("SERA","FIX");
			showName("\nSERA & FIX");
			
			output("<i>“No Mistress,”</i> you chirp. <i>“I think he deserves more.”</i>");
			output("\n\nFix flexes his thin arms in his bonds and protests around his ball-gag, muffled, mewling consternation which makes both you and Sera laugh.");
			if(flags["SERA_PUNISH_FIX_HARD"] == undefined) output("\n\n<i>“Woooww,”</i> Mistress says, eyes wide and slit pupils narrow in surprise. <i>“That wasn’t the answer I was expecting. My little sadist! Well, come up here then, [pc.boyGirl]. You want to see this kitty slut hurt some more? You can be the one who does it.”</i>");
			else output("\n\n<i>“It still surprises me, you know,”</i> Mistress says, smiling fondly down at you. <i>“I never knew there was a domming streak in you, just waiting to be brought out.”</i> Her tail caresses your [pc.foot]. <i>“Well, you know the drill, [pc.boyGirl]. You want to see this kitty slut hurt some more? You’re the one who makes it happen.”</i>");
			output("\n\nShe unfastens you from the floor and raises you up in her arms, claws scraping over your [pc.skinFurScales] as she turns you around, presents you with the kaithrit’s slim, helpless back and presses the whip into your hand.");
			output("\n\n<i>“I’m tired now Fix, but you’ll be pleased to learn I’ve sub-contracted your punishment out,”</i> Sera says, tracing the line of his jaw with a claw. <i>“So it can keep going on. They’re much less skilled, but just as enthusiastic. You’re alright with that, aren’t you? Of course you are, sissy. Ok [pc.name], let’s see your technique.”</i>");
			output("\n\nYou whirl the whip a couple of times, getting a sense of its heft, and then flex your arm muscles in the direction of Fix. He spasms slightly as the whip slaps across the thin, luminous curve of his back.");
			output("\n\n<i>“No, no,”</i> Sera tuts. Her smoky smell engulfs you as she nestles into you behind, her tits pressing into your " + (pc.tallness < 60 ? "neck" : "back") + " as she grips your wrist. <i>“You’ve got to </i>flick<i> at the end of the stroke. Like that, see? The difference between being hit by a rope and being stung by the sweetest, nastiest insect in the galaxy. Flick. That’s it, sweetheart. Now try again.”</i>");
			output("\n\nYou rotate your wrist, getting a feel for it, then do as she directs, whirling the whip at Fix and <i>flicking</i> as the rope swings in the air. The end swats the kaithrit’s shoulder thickly, and this time the little guy squeals in pain, shuddering helplessly against the bonds that keep him spread-eagled. A little erotic shiver runs through you as you gaze at the big, red mark you’ve left on his tender, milky flesh. That... that was actually pretty fun!");
			output("\n\n<i>“Nice! You’ve got it!”</i> Sera wraps her arm around your neck and gives you a warm squeeze. <i>“But, ok, that’s what I call a finishing stroke. You gotta work up to those. I want you to bite down on the raw desire to cause pain and give it to him a bit more gentle. I know - it’s hard. But building up is so worth it...”</i>");
			output("\n\n");
			
			processTime(7);
			// +1 Hard
			pc.addHard(1);
			
			addButton(0, "Next", seraPunishingFix, ["no next", cIdx, vIdx]);
			break;
		case "no next":
			showBust("SERA","FIX");
			showName("\nSERA & FIX");
			
			output("It’s the weirdest tutorial you’ve ever received.");
			if(flags["SERA_PUNISH_FIX_HARD"] != undefined) output(" Although you’ve done this with her before, Sera never tires of using her long experience of being a heartless domineering bitch to hone your sadism. And you like doing it with her. It’s a bonding exercise. Thwap. Sorry, Fix.");
			output(" She watches as you tease and torment the masochistic kaithrit boi with the enthralling array of equipment she keeps in here - vibrators, clamps, dildos, jolters, soothing creams, coating oil, burning fluids - rapping out orders and giving advice.");
			output("\n\nIt’s somewhat daunting at first; there is a constant nagging worry that you might seriously hurt the unfortunate kitty sub one way or another. As you grow more accustomed to the sadist’s set of tools, though, a wonderful sense of control and power settles over you.");
			output("\n\nYou delight at Fix’s helpless, adorably supple and sensitive flesh, and all the wonderful torments you can inflict upon it. Heat suffuses your body as you watch it quiver. Your");
			if(cIdx >= 0 || vIdx >= 0)
			{
				if(vIdx >= 0) output(" [pc.vagina] gets moist");
				if(cIdx >= 0 && vIdx >= 0) output(" and your");
				if(cIdx >= 0) output(" [pc.cock] gets hard");
			}
			else output(" [pc.asshole] pulses with arousal");
			output(" as you make him gasp and moan through his saliva-clogged ball gag. You find yourself daydreaming of owning your own slut, thoroughly deserving of the hot wax you now pour down his front, being sure to dribble it over his small, erect, tender nipples.");
			output("\n\nYou grin rosy-cheeked at Sera, feeling like a door to an entirely new realm of sensual experience has opened for you - the view from above as well as below - just a crack. Mistress responds with a sly smile and a bitten lip.");
			output("\n\n<i>“It makes me hot, watching you do that,”</i> she husks. <i>“Bringing that out of you. My feisty bottom bitch. C’mere.”</i>");
			output("\n\nYou embrace her and kiss by the flickering light of the candles, tenderly at first and then with increasing lasciviousness, her long, demonic tongue slithering into your mouth and wrestling with your own, [pc.lips] moving wetly over hers in a lewd, wet, amorous dance, her hands moulding themselves into your bare buttcheek.");
			output("\n\n<i>“I’ll give it to you soon, ok sweetheart?”</i> she purrs when you part. <i>“You’ve made your Mistress ever so proud. And horny. For now, though... watch the most important part.”</i>");
			output("\n\nShe unfastens Fix from the wall bars, carefully letting his limbs go one by one, feeling each for muscle stress. She coos softly as she removes his ballgag, her smoky voice telling Fix that he is forgiven, his Mistress is pleased with how he took his medicine, and she smiles upon him once again. This is administered at the same time as soothing cream, applied to the worst of the burning welts and scratches you left upon him, as well as a long cuddle.");
			output("\n\nThere’s a dopy, puppyish look on Fix’s pert, boyish face by the end, happily returning Sera’s cuddles, and when she softly but firmly reminds him of his duty, he goes to it eagerly.");
			output("\n\n<i>“See, [pc.name]?”</i> Sera smirks, hand on hip, eyes glimmering in the gloom as the chastised kaithrit kneels before her, pert bum in the air as he licks his arch-tormentor’s boots. <i>“Put yourself out there, do it right and you’ll soon have a couple of these yourself.”</i>");
			output("\n\n");
			
			processTime(12);
			
			addButton(0, "Next", seraPunishingFix, ["no finish", cIdx, vIdx]);
			break;
		case "no finish":
			showBust("SERA","FIX");
			showName("\nSERA & FIX");
			
			output("<i>“Wow,”</i> Fix says, when you’re both clothed and standing back in the Dark Chrysalis.<i>“You’re, uh, you’re meaner than you look, [pc.name]. No offense.”</i>");
			output("\n\nYou grin at each other sheepishly, cheeks glowing, sharers of a particularly filthy secret.");
			output("\n\n<i>“You’re going to be on time from now on, right?”</i>");
			output("\n\nHe shrugs, a simper stealing over his cute, pale androgynous face as he heads to the door.");
			output("\n\n<i>“Oh, I dunno... maybe I like mean. Maybe I, uh... like it a lot.”</i>");
			if(flags["SERA_PUNISH_FIX"] != undefined)
			{
				output("\n\n<i>“You aren’t even trying to behave anymore,”</i> you accuse Fix, when you’re both clothed and standing back in the Dark Chrysalis. The catboy laughs.");
				output("\n\n<i>“And </i>you<i> don’t pretend you don’t enjoy it anymore,”</i> he says, blinking his lashes at you coyly. <i>“So who here is complaining?”</i>");
				output("\n\nThat’s true enough, you suppose. You watch the little masochist leave, waving at you knowingly as he goes.");
			}
			output("\n\n");
			
			processTime(5);
			
			IncrementFlag("SERA_PUNISH_FIX");
			IncrementFlag("SERA_PUNISH_FIX_HARD");
			flags["SERA_PUNISH_FIX_DAY"] = days;
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "yes":
			showBust("SERA","FIX");
			showName("\nSERA & FIX");
			
			output("<i>“I think he’s been punished enough, Mistress,”</i> you reply promptly.");
			output("\n\nFix exhales, sagging in his binds with relief. Sera gazes down at you, expression frozen for a moment, and then withdraws her tail, undoes your cuffs, and then turns back to the wall. You touch your wrists, watching as she begins to unravel the cord wound around the kaithrit’s wrists and ankles.");
			output("\n\n<i>“As you wish, slut. C’mon, you. Aren’t you lucky to share a harem with such a sweet-natured soul?”</i> She plucks the ball gag out of his mouth.");
			output("\n\n<i>“...Yes, Mistress. I, uh, am,”</i> the lean cat boy mumbles in his sonorous voice. He staggers slightly as his feet find the floor, his knees shaking.");
			output("\n\n<i>“You really are. It’s not just anyone who would volunteer to take the rest of your punishment </i>for<i> you. Slut! Here!”</i> Sera raps, pointing at the rack.");
			output("\n\nYour eyes widen in dismay. But you didn’t...");
			output("\n\n<i>“Now, slut,”</i> Sera coos. She tests the strength of one of the cords with a brisk jerk. <i>“Every second you waste is another minute you’re gonna be up there.”</i>");
			output("\n\nFix flashes a grateful, bashful grin at you as you slowly approach the bars, spread your arms so that your breathtakingly malicious Mistress can take hold of your wrists and tie them to the cold metal.");
			if(pc.hasLegs() && pc.isBiped()) output(" Your ankles follow a moment later, each one taken up and securely fixed to a vertical bar, so that you are dangling by your bonds over the floor, legs and arms spread helplessly.");
			else output(" She doesn’t bother with your burdensome bottom half, simply gives you a stiff instruction not to move it.");
			output(" As was the case with the handcuffs, Sera’s touch, grip and tighten is careful and sure, testing and stroking your limbs as she leaves them hanging, ensuring her slave will not be hurt by the way she’s tied [pc.himHer]. Not unintentionally, anyway.");
			output("\n\nYou try and remain calm as red silk drifts over your eyes, swaddling you in darkness as Sera tightens the blindfold behind your head. A claw gently traces your [pc.lips], waiting for you to open them of your own volition so that she can slip a smooth, rubber ball between your teeth, holding your mouth open, and then strapping that securely to your head as well. Your breath huffs from your nose. Blinded and bound, your other senses feel augmented - which is, of course, the point. You can’t help but shiver as that same claw slowly traces the line of your back, a grazing point scraping from your shoulder blades all the way down to the crack of your [pc.ass] that you can’t cringe away from. The [pc.skinFurScales] of your back has never felt so exposed. So <i>deliciously</i> exposed.");
			output("\n\n<i>“Mmm. I knew I could rely upon your sweet nature, [pc.name],”</i> Sera purrs. Spots of burning, liquid pain erupt on your shoulders, and you can’t help but ball your fists and cry out through the ball gag. Void... you sound so helpless. <i>“And now I get a whole new body to play with! New sights, new sounds!”</i> She drools another little streamer of hot wax onto your other shoulder, whilst the other is still slowly coursing and hardening down your back. <i>“I love my pets so much. They make me so goddamn horny. Fix! Kneel there. You’re on cocksucking duty. Got that?”</i>");
			output("\n\n<i>“Y... yes, Mistress.”</i>");
			
			processTime(6);
			// -1 Hard
			pc.addNice(1);
			// +Lust
			pc.changeLust(8);
			output("\n\n");
			
			addButton(0, "Next", seraPunishingFix, ["yes next", cIdx, vIdx]);
			break;
		case "yes next":
			showBust("SERA","FIX");
			showName("\nSERA & FIX");
			
			output("Sera spends a while speckling your back, arms and [pc.butts] with angry red; those slow drools of burning wax taking their sweet time to dry on your [pc.skinFurScales], fierce, creeping sensation. The next moment she presses something wet and incredibly cold into the small of your back, so chillingly different from the wax you make the bars shudder with your convulsions and muffled wail.");
			output("\n\nShe passes the ice cube around to the front, playing it over your [pc.nipples] until");
			if(pc.hasErectNipples()) output(" they are almost agonizingly erect");
			else output(" until they are clamped shut, shivering internally as she continues to circle them over the tender areola");
			if(pc.hasNormalNipples()) output("; then she seizes them with her long claws, pulling at them cruelly");
			output(".");
			output("\n\nAs she tortures you like this she breathes over your neck and [pc.hair] whispering <i>things</i> into your ear in that delicious, smoky voice of hers; how sweet you look trussed up like this just for her, how she wishes she could keep you as a subby fuck pet so she could do this to you all the time, how much you enjoy being punished, yes you do, she can tell.");
			if(cIdx >= 0 || vIdx >= 0)
			{
				output(" And as she speaks her other hand reaches down");
				if(cIdx >= 0) output(" and sleeves your [pc.cock " + cIdx + "], coiling and stroking it into a full, raging erection.");
				else if(vIdx >= 0) output(" and traces the labia of your [pc.vagina " + vIdx + "], slipping inside to tenderly stroke your innards, play with your [pc.clit] until you’re soaking down there, desperate for penetration.");
			}
			if(pcIsPainslut())
			{
				output("\n\nThe fact is you <i>do</i> like being hurt, you’ve been mercilessly trained for it, so you can’t deny how exquisitely turned on you are; you drool through your gag as Sera pincers you and burns you and teases you, you arch your back as your masochistic impulses take over entirely, and you orgasm in her hand explosively.");
				if(cIdx >= 0 || vIdx >= 0)
				{
					output(" She laughs in soft surprise as you");
					if(cIdx >= 0) output(" helplessly spurt out ropes of [pc.cum] all over the wall");
					if(cIdx >= 0 && vIdx >= 0) output(" and");
					if(vIdx >= 0) output(" soak her hand in [pc.femcum], " + (pc.isSquirter(vIdx) ? "dripping" : "gushing") + " out of your eagerly flexing pussy");
					output(".");
				}
				output("\n\n<i>“Oh my,”</i> the demon says wonderingly, drawing back. <i>“I knew you liked this [pc.name], but not </i>that<i> much. Who got you into this?”</i> She comes in closer again, and you shiver as her whisper drips into your ear. <i>“I’ll remember it for next time. We’ll do it harder. For longer. For now...”</i> Her wet fingers meet your [pc.lips], push inside, make you taste your own intense arousal. <i>“I’m gonna punish you for cumming without permission.”</i>");
			}
			output("\n\nAs she did with Fix, she alternates her sadism with receiving regular oral, only now she’s having her male side serviced. You hang there, back and [pc.nipples] throbbing, listening to the sighs and wet, muffled slurps of your punisher getting her foot-long cock sucked, aware that every time she returns to the task of torturing you she does so with her sadism inflamed, her gusto renewed. You whimper as she slides her blunt electro-dildo up your [pc.anus], and then spasm and cry out helplessly in your bonds as she begins to whip your back and [pc.butt], alternating that with an occasional corruscating buzz of electricity flickering into your innards.");
			output("\n\n<i>“Yeah,”</i> she snarls, delivering another stinging blow to your right buttock. <i>“That’s it, bitch. Sing for me! Oh, I love that sound. I love making you pay!”</i>");
			output("\n\nYou transcend into a strangely peaceful mindset as the blows rain down; you accept the punishment as necessary and that makes each fleshy slap, every sharp jolt of energy as right, exquisitely just. You arch your back and eagerly await each one. The fact it makes your Mistress vocally happy to do it makes it all the more deliciously, chasteningly correct.");
			output("\n\nYou sag in your bonds, revelling in your sweat and throbbing flesh, as Sera’s sadistic lust finally overwhelms her, and she hurls aside the whip in order to grab her faithful cat boy and begin to ardently throat fuck the obeisant sissy. The fervent, obscene gulping and gagging and the succubus’s own increasingly ecstatic grunts and moans fill your ears");
			if(cIdx >= 0 || vIdx >= 0)
			{
				output(", making your own");
				if(vIdx >= 0) output(" [pc.vagina " + vIdx + "] ache and moisten unrequitedly");
				if(cIdx >= 0 && vIdx >= 0) output(" and");
				if(cIdx >= 0) output(" [pc.cock " + cIdx + "] throb and stiffen");
			}
			output(".");
			output("\n\n<i>“Yes! Take it all! Fuck I deserve this! Fuck that tight mouth pussy of yours! Yeeeeessssssss,”</i> Sera groans, audibly unloading a thick load of cum into Fix’s gut. In your deep, woozy sub-space, your only regret is that you can’t taste it yourself.");
			output("\n\n");
			
			processTime(13);
			
			addButton(0, "Next", seraPunishingFix, ["yes finish", cIdx, vIdx]);
			break;
		case "yes finish":
			showBust("SERA","FIX");
			showName("\nSERA & FIX");
			
			output("She gets you down a little while after that, drawing you into her soft, smoky embrace, purring about how much you’ve pleased your Mistress. She lays you on her spacious bed next to Fix and making you flex your limbs this way and that, checking for strain and the burning marks she’s left on your naked flesh, admiring her own handiwork at the same time as laying a cool, moist cloth on each, murmuring all the while how proud she is of the pair of you. <i>One</i> does that feel better than it really should.");
			output("\n\nThe purple-skinned hellion does at last follow through on her malicious demand of Fix, and since you managed to get roped into his punishment, you’re right there with him. She gazes down above the proud mountains of her breasts, smirking and playing with her hair as you kneel before her, licking the glossy black latex of her left boot as your kaithrit partner does the right, your naked [pc.butt] pressed side by side to his own pert, round bum. Your mind is still a soft, happy sink of submission; if your wonderful, terrible Mistress desires you to tongue-polish her heels, it’s sheerest bliss to do so.");
			output("\n\n<i>“Hmm,”</i> Sera says at last, examining her left foot critically. <i>“Passable. Alright, you two - I guess you’ve satisfied your Mistress. Don’t ever be late again, Fix. Unless you want to do this again. Only harder.”</i>");
			if(flags["SERA_PUNISH_FIX_KIND"] == undefined)
			{
				output("\n\n<i>“Thanks for - stepping in,”</i> Fix says, when you’re both clothed and standing back in the Dark Chrysalis.<i>“My arms were beginning to ache. I-It was fun, to do that with you.”</i>");
				output("\n\nYou grin at each other sheepishly, cheeks glowing, sharers of a particularly filthy secret.");
				output("\n\n<i>“You’re going to be on time from now on, right?”</i>");
				output("\n\nHe shrugs, a simper stealing over his cute, pale androgynous face as he heads to the door.");
				output("\n\n<i>“Oh, I dunno... she’d never say it, but Mistress likes it when I misbehave. And so do I.”</i>");
			}
			else
			{
				output("\n\n<i>“You aren’t even trying to behave anymore,”</i> you accuse Fix, when you’re both clothed and standing back in the Dark Chrysalis. The catboi laughs.");
				output("\n\n<i>“Maybe, but </i>you<i> know what you’re getting into when you cut it short,”</i> he says, blinking his lashes at you coyly. <i>“And you still do it.”</i>");
				output("\n\nThat’s true enough, you suppose. You watch the little masochist leave, waving at you knowingly as he goes.");
			}
			output("\n\n");
			
			processTime(5);
			
			IncrementFlag("SERA_PUNISH_FIX");
			IncrementFlag("SERA_PUNISH_FIX_KIND");
			flags["SERA_PUNISH_FIX_DAY"] = days;
			
			addButton(0, "Next", mainGameMenu);
			break;
		default:
			showBust("");
			showName("");
			
			output("ERROR!");
			output("\n\n");
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

