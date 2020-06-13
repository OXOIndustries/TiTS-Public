public function showAraKei():void
{
	showBust("ARAKEI");
	showName("AMBASSADOR\nARA KEI");
	author("Nonesuch");
}

public function bothriocEmbassyFunc():Boolean
{
	author("Nonesuch");
	
	// Intro If Araflag ClosedOff
	if(flags["ARAKEI_CLOSED_OFF"] != undefined)
	{
		bothriocEmbassyClosedOffFunc();
		return false;
	}
	if(bothriocQuestComplete() && flags["BOTHRIOC_EMBASSY_ENTERED"] != undefined)
	{
		return bothriocEmbassyPostSummitFunc();
	}
	
	showBust("ARAKEI");

	if (flags["BOTHRIOC_EMBASSY_ENTERED"] == undefined)
	{
		if (!CodexManager.entryUnlocked("Bothrioc"))
		{
			output("As you step through the doorway of the main office, you’re greeted by a strange sight. Scurrying about are a bunch of insectile people, all of them androgynous and clearly not myr. Dominating the area is a seven foot tall blue-black member of the species, idly writing out something on a sheaf of paper as another member of the species polishes the bureaucrat’s four chitin-clad legs with their tongue. Your codex pipes up: <i>“Bothrioc detected! Bothrioc are classified extremely dangerous and should be avoided where possible. A full entry has been downloaded.”</i>");

			output("\n\nThe dominant one laughs heartily, one of four hands partially covering a rather alarmingly wide smile. <i>“My, my. Offworlder technology certainly has a lot to say about us. It is also loud and insensitive. Welcome to the Bothrioc Embassy. I am your host and chief diplomat, Ara Kei Enya. Don’t be shy.”</i>");

			CodexManager.unlockEntry("Bothrioc");
		}
		else
		{
			output("Stepping into the bothrioc embassy is a fairly intimidating experience after crossing paths with the species before. There are so many scurrying about and performing various bureaucratic tasks that you’d struggle to count them. Not all of them are bothrioc, either.");
			
			output("\n\nStanding mostly to the fore and off to one side by a counter is an extremely tall bothrioc, who on account of having four legs seems to have skipped the customary bureaucrat’s office chair, opting instead to simply nestle down amidst their legs.");
			
			output("\n\nIf there were any remaining doubt that this is the person in charge, the sight of a submissive bothrioc carefully polishing the dominatrix’s legs with their tongue removes it. Moreover, they’ve already concluded the immediately pressing point of the paperwork they were handling, one of their arms gently setting it down, to regard you.");
			
			output("\n\n<i>“Ah, no elaborate, loud warning about my species from a newcomer? Either you’ve got a better grasp of your thinking machine’s functions than the average offworlder or you’ve already met us. That is peculiar, as very few newcomers pass through without meeting me and I remember every last one of you. Regardless, I am Ara Kei Enya, and welcome to the Bothrioc Embassy. Don’t be shy.”</i>");
		}

		flags["BOTHRIOC_EMBASSY_ENTERED"] = 1;
	}
	else
	{
		if (flags["MET_ARAKEI"] == undefined)
		{
			output("You step once more into the Bothrioc Embassy, greeted again by the sight of the tall one called Ara Kei being attended by a gaggle of underlings. The ambassador regards you unblinkingly, perhaps a bit miffed by your prior decision to depart without saying a word? After a long moment, Ara Kei speaks first.");
			
			output("\n\n<i>“Hello again, offworlder. Gotten over your fear of... Charles! What did you say we resemble?”</i>");
			
			output("\n\nA ginger head pops out from paperwork going on in the background.");
			
			output("\n\n<i>“Spiders. Wee eight-legged predators, trappers or ambushers.”</i>");
			
			output("\n\nThe host nods, granting the young man a beaming smile for his thorough and quick explanation. <i>“That’s the one. Yes. Welcome back to the spider’s web, offworlder.”</i>");
		}
		else
		{
			output("Stepping into the Bothrioc Embassy armed with your knowledge about the bothrioc is quite a different experience as you realize the vast majority of Ara Kei’s underlings scurrying about - mostly two-legged bothrioc, but some four-legged, some of the other native species, and even some offworlders - must in some way be a part of the gleaming dominatrix’s harem.");
			
			output("\n\nStanding for the most part head and shoulders above the crowd is Ara Kei [ara.himself]. If you couldn’t tell by the deference of the underlings, the faded blue hair cascading off [ara.his] head makes it unmistakable just which tall bothrioc is Ara Kei Enya, and [ara.his] pitch black eyes are instantly upon you with laser focus. You’d like to think that’s because Ara Kei wants to keep an eye on you, but it’s just as possible Ara Kei simply makes a point of identifying every visitor.");
			
			output("\n\n<i>“Hello again, Steele. Come to visit your favorite ambassador, have you? Come closer, let me get a good look at you.”</i> Ara Kei chimes airily.");
			flags["ARAKEI_INVITED"] = 1;
		}
	}

	addButton(0, "Ara Kei", approachAraKei);
	if (flags["ARAKEI_TALKED_BOTHRIOC"] != undefined) addButton(1, "Charles", approachCharles, undefined, "Charles", "The russet-haired human seems to be the only one here who isn’t under Ara Kei’s spell.");

	return false;
}

public function approachAraKei():void
{
	if(bothriocQuestActive())
	{
		bothriocQuestGreeting();
		return;
	}
	if(bothriocQuestComplete() && flags["BOTHRIOC_QUEST_COMPLETE"] == undefined)
	{
		bothriocQuestApproachAraKei();
		return;
	}
	
	clearOutput();
	showAraKei();

	IncrementFlag("MET_ARAKEI");
	var specialMenu:Boolean = false;
	var addiction:Number = bothriocAddiction();

	// This was gated behind having talked to her a bunch, but it makes dealing with the menu generation here 8000% more difficult
	// up front.
	if (flags["ARAKEI_TALKED"] == undefined)
	{
		araKeiTalk();
		specialMenu = true;
		return;
	}
	if (addiction <= 0 /*&& flags["ARAKEI_TALKED_OTHERBOTHRIOC"] != undefined*/)
	{
		if(bothriocQuestComplete())
		{
			output("<i>“Steele!”</i>");
			output("\n\nAra Kei instantly switches [ara.his] attention to you and clacks across, leaving [ara.his] four submissives looking softly confused, the moment [ara.he] notice" + ara.mfn("s", "s", "") + " you.");
			output("\n\n<i>“And what do we owe this pleasure to?”</i> the quadomme asks, smiling.");
		}
		else
		{
			output("<i>“You’re looking healthy and brimming with that distinct do-as-you-please attitude of yours,”</i> Ara Kei says with a dry, not unfriendly curl of the lip. You find yourself exhaling when [ara.his] big, black eyes move away from you back to the bustle all around [ara.him]. There is something slightly disconcerting about being the sole focus of the bothrioc ambassador’s attention.");
			output("\n\n<i>“Here to know more about my race?”</i> [ara.he] "+ ara.mfn("goes", "goes", "go") +" on. <i>“I have always felt we are better experienced than studied, you know.”</i>");
		}
	}
	else if (addiction >= 10 && flags["ARAKEI_ADDICTION_10"] == undefined)
	{
		flags["ARAKEI_ADDICTION_10"] = 1;

		output("Ara Kei’s eyes widen as they roam over your face and body.");

		output("\n\n<i>“Well, this is a new development. Come closer, Steele.”</i> You oblige. <i>“As I suspected. You’ve met with the unique hospitality of the bothrioc. Ahh....”</i> [ara.he] trail"+ ara.mfn("s", "s", "") +" off in a long, satisfied sigh, a sound that seems to tickle your [pc.skinFurScales]. <i>“This is an interesting turn of events indeed. Tell me, how did it feel?”</i>");

		specialMenu = true;

		//[Good] [Great] [Unpleasant]
		clearMenu();
		addButton(0, "Good", araKeiSpecialGreeting10Reaction, "good", "Good", "Admit you enjoyed yourself, but preserve your dignity.");
		addButton(1, "Great", araKeiSpecialGreeting10Reaction, "great", "Great", "Freely let Ara Kei know how you feel about it.");
		addButton(2, "Unpleasant", araKeiSpecialGreeting10Reaction, "bad", "Unpleasant", "Reject the experience.");
	}
	else if (addiction >= 20 && flags["ARAKEI_ADDICTION_20"] == undefined)
	{
		flags["ARAKEI_ADDICTION_20"] = 1;

		output("Ara Kei greets you with an appraising eye, as you’ve become accustomed to. You take the opportunity to appraise Ara Kei right back. How have you not noticed how delightful [ara.he] look"+ ara.mfn("s", "s", "") +"? From the sharp, elegant smile gracing Ara Kei’s lips to the lustrous sheen of chitin, Ara Kei really is a masterpiece of bothrioc breeding.");

		output("\n\n<i>“Careful now, Steele,”</i> [ara.he] say"+ ara.mfn("s", "s", "") +", that smile growing larger as you drink [ara.him] in. <i>“We are beautiful and I appreciate the hunger in that eye, but if you gaze too long... well, you might never stop.”</i>");

		output("\n\nYou snap out of it, but you can’t help admire the artful usage of all four hands bothrioc are capable of, as Ara Kei swiftly handles papers and pens and gestures subtle commands all in a continuous flurry of activity. You shudder to imagine what those hands could do if they got ahold of you.");
	}
	else if (addiction >= 30 && flags["ARAKEI_ADDICTION_30"] == undefined)
	{
		flags["ARAKEI_ADDICTION_30"] = 1;

		output("Ara Kei simply gazes at you for what seems like a long time. Long enough for you to begin to feel weak at the [pc.knees]. Why is... when did it start becoming really difficult to not bow in front of [ara.him]? To wait for [ara.his] instruction before doing anything?");
		// 9999
		if (pc.willpower() + rand(pc.lustMax() / 4) > pc.libido() + pc.lust()) output(" By sheer force of will, you keep yourself upright and... almost succeed at looking Ara Kei in the eye.");
		else output(" You can’t stop yourself from collapsing into a kneeling position, bowing your head before [ara.his] presence.");
		
		output("\n\n<i>“Ah,”</i> croons the ambassador, <i>“let me get a good look at you.”</i> A single smooth finger gently hooks your chin, pulling your face up toward [ara.his]. You shiver, unable to bring yourself to look into the gleaming dominatrix’s face. <i>“Look me in the eye, Steele.”</i>");
		
		output("\n\nIt is an instruction, so you do it instantly. You find yourself drowning in shining black pits of tar. Several long moments pass, and you find yourself calming down. You hadn’t even realized how tense you were.");
		
		output("\n\n<i>“That’s what I thought. You’re afraid. I understand, but you have no reason to fear. Let me show you something.”</i> Ara Kei takes hold of your shoulders, hugging you close with both arms on that side as you’re turned to get a good look at the harem busily maintaining the embassy. It’s always a slight shock that bothrioc aren’t actually cold, for all that chitin. Ara Kei is as warm as anyone else, though you can’t quite place what [ara.his] scent is.");
		
		output("\n\n<i>“Do you see this harem, Steele? They are my pride and joy. I love them more than life itself. They perform admirably at whatever I ask and I in turn provide for them. Master and servants are two halves to a whole, any sane dominatrix you meet will agree. What I’m trying to say is that you’re not losing yourself. They all can live healthy lives under me, and I’m sure when you find yours they’ll cherish you as I would.”</i> After a moment, Ara Kei releases you. <i>“Now, Steele. Do you understand my point?”</i> You nod, slowly. <i>“Good. Are you still afraid?”</i> After some deliberation, you answer noncommittally. <i>“We shall see what the future holds, then. Is there anything you need?”</i>");
	}
	else if (addiction >= 40 && flags["ARAKEI_ADDICTION_40"] == undefined)
	{
		flags["ARAKEI_ADDICTION_40"] = 1;

		output("This time, the urge to kneel before Ara Kei is not as pressing as it was. It does, however, feel much more natural.");
		if (pc.willpower() + rand(pc.lustMax() / 4) > pc.libido() + pc.lust()) output(" You remain standing. You figure there’s no need to debase yourself out of hand.");
		else output(" You drop to your [pc.knees] into a proper kneel, bowing your head respectfully.");
		
		output("\n\n<i>“Hmm...”</i> There’s a frivolous, musical quality to Ara’s normally-studied tones. <i>“It’s so precious to see an incubator coming along. What are you here for today, [pc.name]?”</i>");
	}
	else if (addiction >= 50 && flags["ARAKEI_ADDICTION_50"] == undefined)
	{
		flags["ARAKEI_ADDICTION_50"] = 1;

		output("Ara Kei greets you with nothing more than a slight, immaculate curl of the lip. [ara.He] seem"+ ara.mfn("s", "s", "") +" to be waiting for something - and, immediately, you know what it is. This time the urge is completely overwhelming, and you don’t fight it. When you "+ (pc.hasKnees() ? "kneel" : "approximate a kneeling stance with your awkward lower body") +", a huge smile spreads over the quadomme’s face, and you feel a rush of puppyish glee and happiness. The sun shines above when you please the big, dominant bothrioc.");

		output("\n\n<i>“You have come far since we first met, [pc.name],”</i> [ara.he] say"+ ara.mfn("s", "s", "") +". [ara.He] reach"+ ara.mfn("es", "es", "") +" a chitinous hand down and strok"+ ara.mfn("es", "es", "") +" your brow. Warmth blooms deep inside you, profound contentment and arousal");
		if (pc.hasVagina()) output(" moistening [pc.eachVagina]");
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasCock()) output(" hardening up [pc.eachCock]");
		output(" from the mere touch of this being. <i>“And now, I believe, you are on a threshold. Go on much further and you shall know the true contentment of being an incubator; you shall find what I believe to be your true role in life. But...”</i>");
		
		output("\n\nThe bothrioc’s voice turns sterner, and you find yourself snapping to attention, back straight, focusing on every word that forms on [ara.his] lips.");
		
		output("\n\n<i>“The time for playing and experimenting shall soon pass. Keep accepting eggs from my wild kin and you will not be able to go back to who you once were. Although my opinion is that being that person left you incomplete and unhappy - if that is who you want to be, this game you are playing must now come to an end. Push on and embrace it... or turn back now. Do you understand?”</i>");
		
		output("\n\nYou nod your head vigorously, and are granted with another wide smile.");
		
		output("\n\n<i>“Good. Now then, little one - was there something specific you came in here for?”</i>");
	}
	else if (addiction < 70)
	{
		output("<i>“I see you have been enjoying the hospitality of my brethren!”</i> Ara Kei’s big, black eyes regard you intently. You feel oddly soft and relaxed when [ara.he] "+ ara.mfn("does", "does", "do") +" that. <i>“Do keep me appraised of your situation, I’m intensely curious. Regardless - is there something you want today?”</i>");
	}
	else if (addiction >= 70 && flags["ARAKEI_ADDICTION_70"] == undefined)
	{
		flags["ARAKEI_ADDICTION_70"] = 1;

		output("A shiver runs down your spine as Ara considers you. Fantasies of [ara.him] throwing you over the nearby desk and forcefully making you [ara.his] assault you, making your [pc.skinFurScales] feel incredibly sensitive, begging to be touched. [ara.His] voice makes you snap out of your reverie.");
		
		output("\n\n<i>“I am delighted you have embraced who you truly are, little one,”</i> [ara.he] say"+ ara.mfn("s", "s", "") +". The satisfaction in [ara.his] voice is like a soothing balm to your brow. <i>“To see an alien freely accept our gifts and become one of our own - that is a vindication of our ways beyond anything I could once have dreamed. It makes me all the more determined to set our race amongst the stars.”</i> [ara.he] rap"+ ara.mfn("s", "s", "") +" a boot down sharply and you immediately snap to attention. <i>“But enough hubris. Let us discuss you.”</i>");
		
		output("\n\nYou aren’t quite capable of looking the arch bothrioc in the face - at least not without instruction - but you can tell by the way [ara.his] long, white neck is moving that [ara.he] "+ ara.mfn("is", "is", "are") +" still giving you a good once over.");
		
		output("\n\n<i>“You need to find a master, Steele.”</i> It is an order, not a suggestion, and you nod immediately. <i>“I have already told you once - I cannot be that for you, as much as your body may cry out for it when you are in my presence. You need someone to put you in your place and focus your mind, otherwise you will be a vulnerable mess. Do you understand?”</i>");
		
		output("\n\n<i>“Yes "+ ara.mfn("sir", "mistress", "mis... si... ambassador") +",”</i> you say, back straight.");
		
		output("\n\n<i>“Good.”</i> [ara.his] tone softens and you relax slightly - although the imperative [ara.he] "+ ara.mfn("has", "has", "have") +" given you continues to burn brightly in your mind. <i>“What else can the embassy provide you with today?”</i>");
	}
	else if (addiction < 100)
	{
		output("As you take up your familiar kneeling station before the ambassador, you receive a small sign of affection from Ara Kei. You find your");
		if (pc.hairLength > 0) output(" hair being ruffled");
		else output(" scalp being caressed");
		output(" by the bothrioc, in much the manner you might favor a pet.");

		output("\n\n<i>“It’s a pleasure to see you as you are, [pc.name].”</i>");
	}
	else if (flags["ARAKEI_ADDICTION_100"] == undefined)
	{
		flags["ARAKEI_ADDICTION_100"] = 1;

		output("You prostrate yourself in front of the scrying, black eyes of the bothrioc ambassador. Any lingering doubt, any shred of self-consciousness you might once have had about doing this have long since evaporated. And good riddance to it. You now clearly see how such concerns were clouds and shadows that cast themselves before the all-encompassing love that now radiates down to you from such big, dominant creatures as Ara Kei. [ara.His] powerful will is yours completely, and the mere thought of doing something that pleases [ara.him] even for a moment sends a shiver of pure joy down your spine.");

		output("\n\n<i>“Good, isn’t it?”</i> Ara Kei says after a moment, and the fondness in [ara.his] tone sends heat rifling down to your groin,");
		if (pc.hasVagina()) output(" making [pc.eachVagina] instantly become wet");
		if (pc.hasVagina() && pc.hasCock()) output(" and");
		if (pc.hasCock()) output(" [pc.eachCock] straining instantly to attention");
		output(". <i>“Didn’t I tell you that it would all be worthwhile if you truly embraced our gift, [pc.name]? Now, all those clutches you stoutly bore have provided you with your true awakening. I’m very proud of you.”</i>");

		output("\n\nYou beam at [ara.him] happily, and bathe in the waves of pure pleasure which wash over you when [ara.he] stroke"+ ara.mfn("s", "s", "") +" you underneath your chin.");

		output("\n\n<i>“Let’s talk about your responsibilities,”</i> Ara Kei says in a cooler tone, withdrawing her gleaming hand. You quickly snap to attention, avidly hanging on every syllable that those wide, elegant lips form. <i>“Yes, responsibilities, little one! Just because you’re an incubator doesn’t mean you get to shirk them. As your better and mentor, I gave you an order. What was it?”</i>");

		output("\n\n<i>“To find myself a master.”</i> The words come automatically to your lips. Did you remember? Your subconscious certainly did.");

		output("\n\n<i>“Yes.”</i> The quadomme’s shift rustles as [ara.he] reposition"+ ara.mfn("s", "s", "") +" [ara.himself], allowing [ara.his] haremling to begin work on a different limb. Good void, do you envy them. <i>“And have you?”</i>");

		araKeiPotentialMasterBlurbs();
	}
	else
	{
		// 'found' a master
		if (flags["ARAKEI_RESOLVED_MASTER"] != undefined)
		{
			output("You kneel in front of Ara Kei and bask in total pleasure when [ara.he] reach"+ ara.mfn("es", "es", "") +" out and strokes you beneath the chin.");

			output("\n\n<i>“Very pleasing,”</i> [ara.he] say"+ ara.mfn("s", "s", "") +", smiling widely. <i>“What can the bothrioc do for you today, little one?”</i>");
		}
		// not found a master, but lane is currently top of the list
		else if (flags["LANE_FULLY_HYPNOTISED_FOREVER"] == undefined && flags["ARAKEI_RESOLVED_MASTER_LANE"] != undefined && flags["LANE_FULLY_HYPNOTISED"] != undefined && flags["LANE_DETOX_COUNTER"] != undefined && flags["LANE_DETOX_STATUS"] == undefined)
		{
			output("You kneel in front of Ara Kei, and shudder with pleasure when [ara.he] reach"+ ara.mfn("es", "es", "") +" out and strokes you beneath the chin.");
			
			output("\n\n<i>“Tell me about Lane,”</i> [ara.he] say"+ ara.mfn("s", "s", "") +" after a moment’s pause.");
			if (silly) output(" <i>“Why does"+ lane.mf("he", "she") +" wear the mask?”</i>");
			
			output("\n\nHaltingly, you try to tell the quadomme that you have broken away from the daynar - but your words get jumbled up as conflicting imperatives push against each other in your mind, and you come to a mumbling halt as a serious headache takes over.");
			
			output("\n\n<i>“It is not over yet, Steele,”</i> the bothrioc says, authority hardening [ara.his] tones. <i>“You must continue to fight against this parasite’s will. It hurts now, I know - but this is for your own good. You know that.”</i>");
			
			output("\n\nYou do.");
		}
		else if (flags["LANE_FULLY_HYPNOTISED_FOREVER"] == undefined && flags["ARAKEI_RESOLVED_MASTER_LANE"] != undefined && flags["LANE_FULLY_HYPNOTISED"] != undefined && flags["LANE_DETOX_STATUS"] == 1)
		{
			output("You kneel in front of Ara Kei, and shudder with pleasure when [ara.he] reach"+ ara.mfn("es", "es", "") +" out and strokes you beneath the chin.");

			output("\n\n<i>“Tell me about Lane,”</i> [ara.he] say"+ ara.mfn("s", "s", "") +" after a moment’s pause.");
			if (silly) output(" <i>“Why does "+ lane.mf("he","she") +" wear the mask?”</i>");
			
			output("\n\nConfidently, you tell the quadomme that the daynar’s hypnotic compulsion has finally been flushed out of your system. A bright dawn of relief spreads across you as you verbalize it without a shred of doubt, without a single twinge of pain or hollowness. You share Ara Kei’s wide grin - at long last, it is over.");
			
			output("\n\n<i>“There is nothing that incubators cannot do, if they are given the necessary focus and drive by a dominant,”</i> [ara.he] say"+ ara.mfn("s", "s", "") +". <i>“I’m very proud of you, Steele. Take a while to rest, and then come see me again - there is still your future to discuss.”</i>");
			
			flags["ARAKEI_RESOLVED_MASTER_LANE"] = undefined;
			flags["ARAKEI_RESOLVED_MASTER"] = "lane";
		}
		else
		{
			output("You kneel in front of Ara Kei, and shudder with pleasure when [ara.he] reach"+ ara.mfn("es", "es", "") +" out and strokes you beneath the chin.");

			output("\n\n<i>“How goes it, little one?”</i> [ara.he] ask"+ ara.mfn("s", "s", "") +" distantly. <i>“Have you completed your task yet?”</i>");

			araKeiPotentialMasterBlurbs();
		}
	}

	if (!specialMenu) araKeiMenu();
}

public function araKeiPotentialMasterBlurbs():void
{
	// Lane, prio 1
	if (flags["LANE_FULLY_HYPNOTISED"] != undefined && flags["LANE_DETOX_STATUS"] == undefined)
	{
		output("\n\nA picture immediately forms in your head. It’s lithe, scaly and has... such fabulous, mesmeric patterns.");

		output("\n\n<i>“Yes, Ara Kei,”</i> you say eagerly. <i>“I have.”</i>");

		output("\n\n<i>“Tell me about them,”</i> replies the bothrioc coolly. <i>“And I will decide if they are suitable.”</i>");

		output("\n\nWords pour out of your mouth as you describe Lane with gusto. It never crosses your mind to spare any detail about the relationship you and the daynar hypnotist share - you could no more lie or omit truth to the quadomme than you could turn into sand.");

		output("\n\n<i>“That’s enough,”</i> says Ara Kei at length, and your flow immediately freezes. There’s a hardness to [ara.his] tone that slices straight through your blissful little cloud. <i>“Amongst my people Steele, there are those who use the gift for more than shared happiness. Inveigle others into their harem before forcing them into mines, or prostitute them to nyrea. Such dommes, if they are discovered by other dommes, are killed, or driven far away. Far away, to a shack on the fringes of a failed world, perhaps. I do not know exactly how this Lane individual has developed a hold on you, Steele, but they bear you nothing but ill-will.”</i>");

		output("\n\nLane? Ill-will? That’s nonsense. You love Lane and Lane loves you... but if the bothrioc dominant is saying something different, and with such emphasis... your brain feels like it’s going to burst. A small, animal sound of distress reaches your ears, and it takes you a groggy moment to realize it came from your own lips.");

		output("\n\n<i>“Yes Steele,”</i> Ara Kei insists, and more agony knives into your skull. <i>“I know it hurts, but sometimes pain is essential. I will not have you give yourself to this insidious, self-enriching parasite anymore. I DEMAND that, as your better and mentor. Do you understand?”</i>");

		output("\n\nYes. The message is a throbbing artery of pain inside your mind, but it is there, pulsing over the fuzzy, pleasing entreaties of the flashing patterns - you are no longer to allow the daynar to do as they please.");

		output("\n\n<i>“Good,”</i> says the quadomme slowly, still eyeing you closely. <i>“Once we have weaned you off this individual, we can talk about more suitable candidates for keeping a steady hand on you. For now... I suggest you find a close friend, to help you through the process of withdrawal. People like Lane very rarely let free meals out of their grasp easily.”</i>");

		// Basically the way I saw it working was, when a Permanently Hypnotised PC reaches this bit they get bumped back down to Partially Hypnotised, and are thus able to detox and confront Lane. What Nik suggests in the comment seems wise, if what he's saying is the case; give the PC a 75% boost to their Willpower for the confront Lane scene only.
		if(flags["LANE_FULLY_HYPNOTISED_FOREVER"] != undefined) flags["LANE_FULLY_HYPNOTISED_FOREVER"] = undefined;
		if(flags["FOLLOWER_LANE_INTERVENTION"] != undefined) flags["FOLLOWER_LANE_INTERVENTION"] = undefined;
		flags["ARAKEI_RESOLVED_MASTER_LANE"] = 1;
	}
	// Sera
	else if (fuckedSeraAsMistress())
	{
		output("\n\nA picture immediately forms in your head. It’s purple, curvy, and radiates sadism.");
		
		output("\n\n<i>“Yes, Ara Kei,”</i> you say eagerly. <i>“I have.”</i>");
		
		output("\n\n<i>“Tell me about them,”</i> replies the bothrioc coolly. <i>“And I will decide if they are suitable.”</i>");
		
		output("\n\nWords pour out of your mouth as you describe Sera with gusto. It never crosses your mind to spare any detail about the relationship you and the demonic shopkeeper share - you could no more lie or omit truth to the quadomme than you could turn into sand.");
		
		output("\n\n<i>“Hmm,”</i> says Ara Kei at length, when your flow finally gives out. [ara.He] "+ ara.mfn("is", "is", "are") +" having to exercise all of [ara.his] diplomatic talents not to grin. <i>“Certainly a rather, um... crude individual to have as a master, and I am not particularly happy about the fact she is not an egg-giver. However - I do detect a lot of shared fondness between you and this... person, and she certainly has the forcefulness required. Alright then, Steele - you may consider your obligation towards me annulled. Well done.”</i>");
		
		output("\n\nYou feel a wonderful feeling of relief and joy. You had no idea of the onus that had been laid upon you until the dominant chose to lift it away - it dissipating feels like a genuine weight off your shoulders.");
		flags["ARAKEI_RESOLVED_MASTER"] = "sera";
	}
	// Xanthe
	else if (xantheIsDommingPC())
	{
		output("\n\nA picture immediately forms in your head. It’s soft, blue and caterpillar-like.");
		
		output("\n\n<i>“Yes, Ara Kei,”</i> you say eagerly. <i>“I have.”</i>");
		
		output("\n\n<i>“Tell me about them,”</i> replies the bothrioc coolly. <i>“And I will decide if they are suitable.”</i>");
		
		output("\n\nWords pour out of your mouth as you describe Xanthe with gusto. It never crosses your mind to spare any detail about the relationship you and the siel shopkeeper share - you could no more lie or omit truth to the quadomme than you could turn into sand.");
		
		output("\n\n<i>“That’s enough,”</i> says Ara Kei at length, and your flow immediately freezes. <i>“It may not come as a surprise to you that I know of this Xanthe character. I have some interest in farlander textiles, and she is not quite as alien in appearance and manner as other visitors to our world. Yes... it is a shame she is not an egg-giver, and therefore can never truly satiate you. However, I like her manner, and the fact that from here I can keep an eye on her and properly adjudge her ability to manage a harem. Alright then, Steele - you may consider your obligation towards me annulled. Well done.”</i>");
		
		output("\n\nYou feel a wonderful feeling of relief and joy. You had no idea of the onus that had been laid upon you until the dominant chose to lift it away - it dissipating feels like a genuine weight off your shoulders.");
		flags["ARAKEI_RESOLVED_MASTER"] = "xanthe";
	}
	// Gene
	else if (geneSubmissionLevel() >= 7)
	{
		output("\n\nA picture immediately forms in your head. It’s huge, masculine and dragonish.");
		
		output("\n\n<i>“Yes, Ara Kei,”</i> you say eagerly. <i>“I have.”</i>");
		
		output("\n\n<i>“Tell me about them,”</i> replies the bothrioc coolly. <i>“And I will decide if they are suitable.”</i>");
		
		output("\n\nWords pour out of your mouth as you describe Gene with gusto. It never crosses your mind to spare any detail about the relationship you and the fanfir shopkeeper share - you could no more lie or omit truth to the quadomme than you could turn into sand.");
		
		output("\n\n<i>“That’s enough,”</i> says Ara Kei at length, and your flow immediately freezes. <i>“I know a little of this particular starwalker - or rather, eager tales of his theatrics from the gold myr. He is a liar and a glutton, and furthermore he is not an egg-giver. However - despite the hold he has over you, he does not extort you, and allows you to come and go as you please. And from here, moreover, I can watch him and make sure that continues to be the case.”</i> [ara.he] sigh"+ ara.mfn("s", "s", "") +". <i>“Very well, Steele - you may consider your obligation towards me annulled. Well done.”</i>");
		
		output("\n\nYou feel a wonderful feeling of relief and joy. You had no idea of the onus that had been laid upon you until the dominant chose to lift it away - it dissipating feels like a genuine weight off your shoulders.");
		flags["ARAKEI_RESOLVED_MASTER"] = "gene";
	}
	// female treated
	else if (pc.isTreated() && pc.hasVagina())
	{
		output("\n\nIt is rare for the sunny sensuality of being Treated to conflict with the calm, submissive peace of being an egg slut, but it does now. Your cow instincts dimly speak against the bothrioc’s constant insistence on finding a master - at least in the singular. Why shouldn’t you share yourself with whoever wants a piece, and limit possible sexiness in such a way?");
		
		output("\n\n<i>“Hey, um,”</i> you say, timidly. <i>“Is it, like, necessary for me to have an owner? I just like being yummy and happy with whoever’s into it.”</i>");
		
		output("\n\n<i>“There is something different about you isn’t there, Steele?”</i> replies Ara Kei after a moment’s pause. <i>“Even before you embraced the gift, your smell, speech patterns and body language were... odd. Care to explain that?”</i>");
		
		output("\n\nEagerly you explain to the nice "+ ara.mfn("lady", "man", "bug-lady-man-thing") +" about the Treatment - how wonderful it made you feel even before you were made to feel even <i>more</i> wonderful via the bothrioc. You describe New Texas, and your glowing descriptions are only brought to an end by measured but heartfelt laughter.");
		
		output("\n\n<i>“My word,”</i> hoots Ara Kei, gleaming black glove to [ara.his] mouth, <i>“what people. What paradises are built, what decadence is achieved when you have millennia of peace and elegant machines to do all the thinking for you! Alright then, Steele; I can see that me insisting that such a polyamorous beast as yourself to make serious commitments would only make you unhappy. My main worry about an unattached incubator is a lack of focus; however I doubt even with the sternest of masters you would be particularly focused anyway. We shall rely on that remarkable serendipity of yours that has allowed you to travel as far as you have unscathed instead. Consider your obligation towards me annulled.”</i> [ara.He] pause"+ ara.mfn("s", "s", "") +". <i>“That means you don’t have to worry anymore.”</i>");
		
		output("\n\nYou beam. Hurray!");
		flags["ARAKEI_RESOLVED_MASTER"] = "treated";

	}
	else
	{
		output("\n\nYou feel cascading despondency; you came back into the quadomme’s presence, yet failed the task [ara.he] gave you. How could you be so feckless? From the heights of sheer ecstasy you were floating in a few moments ago to the depths of misery you are now cast into is a very long drop, and you feel every black inch.");
		
		output("\n\n<i>“I am sorry, Ara Kei. It does not seem if anyone is willing-”</i>");
		
		output("\n\n<i>“Oh, don’t give me that.”</i> A chitinous boot raps the floor impatiently, and your throat freezes instantly. <i>“There’s NOTHING worse than a self-pitying incubator. You are young, attractive, relatively well-off and extremely servile. You cannot tell me that there’s no-one out there that isn’t willing to crack a whip and pump you full of eggs from time to time, because I know it isn’t true. I gave you an order, and now you truly are what you are, you know what that means, don’t you?”</i>");
		
		output("\n\nYou do. You live and breathe that order.");
		
		output("\n\n<i>“So stop hanging around this office, expecting me to take you under my wing out of sheer pity - yes, Steele, I know what this is really about - and go find a nice, kind-but-extremely-forceful dominant to focus your mind and efforts. Have I made myself clear?”</i>");
		
		output("\n\nCrystal. The bothrioc ambassador allows just a hint of affection to warm the expression currently frosting [pc.his] face.");
		
		output("\n\n<i>“Good. Now scoot, unless there is something else you wish to discuss.”</i>");
	}
}

public function araKeiSpecialGreeting10Reaction(choice:String):void
{
	clearOutput();
	showAraKei();

	switch (choice)
	{
		case "good":
			output("You’re a bit uncomfortable with Ara’s probing question. You don’t really feel entirely up to admitting to the nerve-biting pleasure, and the warm glow that suffuses you in the wake. Nevertheless, you gather your courage, and guardedly admit that it was an enjoyable experience.");
			output("\n\n<i>“I understand your reticence,”</i> the quadomme says, drawing back a little and regarding you in a softer focus. <i>“It can be difficult at first. I’m sure you’ll become more comfortable with yourself as things proceed. I wish you all the best in your exploration. Now - what can the embassy do for you today?”</i>");
			output("\n\nThere was a certain, insidious assumption in there...");
			break;

		case "great":
			output("You were seeing stars, and the entire time you’ve carried a clutch there’s been a warm glow suffusing every step. You unhesitatingly share your fantastic experience with Ara Kei. A warm smile splits [ara.his] face in two.");
			output("\n\n<i>“That’s wonderful to hear! It is so important to embrace those feelings, and to be entirely open about them - to us, anyway. There is a long path ahead of you, [pc.name], but the fact you’ve taken to it in exactly the right manner means that every step along it will be a fresh pleasure for you to enjoy.”</i>");
			output("\n\nThe sunny feeling inside of you intensifies as the quadomme talks, until you feel faintly giddy; you feel slightly disappointed and empty when finally [ara.his] voice ceases and [ara.his] attention drops back.");
			output("\n\n<i>“Now then - what can the embassy do for you today?”</i>");
			break;

		case "bad":
		default:
			output("You bluntly describe your distaste for what transpired. Ara Kei nods sagely, drawing back.");
			output("\n\n<i>“I understand. It isn’t for everyone. Nevertheless, I believe you’ll come to enjoy yourself and accept the changes, if you keep at it. Think of it as... an acquired taste.”</i>");
			output("\n\nYou try and put the arachnid-esque ambassador’s confidence out of mind and consider what it is you <i>do</i> want.");
			break;
	}

	processTime(3+rand(2));
	araKeiMenu();
}

public function araKeiMenu(lastF:Function = null):void
{
	var addiction:Number = bothriocAddiction();
	
	clearMenu();
	
	addButton(0, "Talk", araKeiTalk);
	
	if (flags["ARAKEI_TALKED_BOTHRIOC"] == undefined) addDisabledButton(1, "Flirt", "Flirt", "You don’t know this being well enough to try.");
	else if (flags["ARAKEI_FLIRTED"] != undefined && pc.isTaur()) addDisabledButton(1, "Flirt", "Flirt", "Being a centaur displeases the bothrioc, for some reason. You won’t get any further with [ara.him] whilst you are one.");
	else if (addiction >= 100 && flags["ARAKEI_POLISHED_BOOTIES"] != undefined && pc.isPregnant(3))
	{
		addDisabledButton(1, "Flirt", "Flirt", "You should probably deal with your current brood first. You get the overwhelming impression that being bred by Ara Kei is not for someone who is already stuffed with spawn.");
	}
	else gatedButton({ 
		id: 1,
		lbl: "Flirt", 
		f: araKeiFlirt,
		arg: undefined, 
		ttH: "Flirt",
		ttB: addiction >= 100 
				? "Debase yourself in front of this perfect being. (You probably don’t want to be anywhere anytime soon if you’re choosing this.)"
				: addiction >= 50
					? "Perhaps if you displayed your devotion enough..."
					: "Hey, it’s worth a shot."
	});
	
	addButton(10, "Appearance", araKeiAppearance);
	addButton(14, "Leave", function():void { 
		currentLocation = "603";
		flags["ARAKEI_INVITED"] = undefined;
		mainGameMenu();
	});
}

public function araKeiAppearance():void
{
	clearOutput();
	showAraKei();

	output("Ara Kei Enya is easily seven feet tall standing, but is currently squatted down amongst four relatively thin and nimble legs, serenely passing on orders to [ara.hisHer] many underlings. The legs end in feet that are like some sort of chitinous boot. It is segmented and jointed, but has the overall shapes of toe, ball, instep, and heel that you’re familiar with. It is a heeled boot thanks to an upward bite of the chitin, you’d hazard an adaptation for resting comfortably on a web. The chitin in question is black, but under the gas lamps that seem to be preferred in the bothrioc office, it shimmers with deep blue tones. A gauzy, elegant gray shift drapes down from the creature’s upper shoulders down to four gleaming thighs.");
	
	output("\n\nThe face is pale with an angular look to it that suggests predatory intent and is framed by long, loose pale-blue hair neatly tucked behind chitin-shelled ears. Not far behind the hairline is a pair of firm, unbending antennae. There aren’t any eyebrows, merely a ridge where you feel like they should be. Beneath that ridge are a pair of eyes that are slightly larger than human standard, but pulled tight. Somewhat unexpectedly, they do have eyelashes atop actual eyelids. The eyes, however, are black as pitch, the particular shade which makes it hard to identify their shape and depth. There’s nothing breaking up the distance between eyes and mouth. The distance isn’t quite as vast as it would normally be if there was a nose, which seems to be largely due to how big the eyes and mouth are. The mouth is thin, seemingly permanently compressed or pursed, but it is wide, and when Ara Kei speaks it splits open hugely, revealing a massive set of teeth and a long tongue.");
	
	output("\n\nBehind the pair of legs not facing you is the quadomme’s abdomen; at least as big as a gold myr’s, it is clad entirely in black, pliable latex-like chitin. The bothrioc could be described as toned, in the small expanse of stomach that is snow-white skin rather than chitin, unlike the rest of the lower body. Even that gives the impression of someone tuned for combat by genetics rather than training, however.");
	
	output("\n\nAltogether, the bothrioc ambassador gives off the impression of intellect and good manners lightly coating a highly evolved and utterly assured rapacity.");
}

public function araKeiTalk():void
{
	if (flags["ARAKEI_TALKED"] == undefined)
	{
		flags["ARAKEI_TALKED"] = 1;
		clearOutput();
		showAraKei();

		if (flags["ARAKEI_TALKED"] == undefined)
		{
			output("You approach the one clearly in charge");
		}
		else
		{
			output("You step forward in acceptance of the ambassador’s invitation");
		}
		output(". Your gaze slowly sweeps up and down, trying to take it all in. You’re already well used to meeting strange new life forms, but the mixture of new and familiar that this bothrioc has in spades makes it hard to pin down where to start.");

		output("\n\nAra Kei arches one hairless eyebrow.");
	
		output("\n\n<i>“Well, dearest visitor, are you quite done gawking? Let me guess, my gender is throwing you off?”</i>");
		
		output("\n\nYou nod. It’s not the only thing, but it’s certainly high on the list.");
		
		output("\n\n<i>“That’s quite alright, let me help you settle the issue. Observe.”</i> The delicate gray shift draped about Ara Kei’s wide hips is gently pulled aside by one of the lower arms, revealing a completely featureless, hairless mound, topped by a chitin plate that smoothly separates the legs. No genitals. At all. <i>“There, see? Bothrioc don’t have genders or any of the charming parts that accompany them. We have a cloaca and an ovipositor, which makes us functional hermaphrodites. You’ll forgive my modesty if I don’t show them to you without even knowing your name, stranger. Has that helped you land upon an appropriate pronoun? Do let me know what you think it is. I always find it fascinating.”</i>");
	
		output("\n\nAn opinion on gender is slowly forming in your head.");

		// [They] [He] [She]
		clearMenu();
		addButton(0, "They", setAraKeiGender, 0, "They", "The safe choice. Potentially the wise choice.");
		addButton(1, "He", setAraKeiGender, 1, "He", "It’s a he, right? Obviously a he.");
		addButton(2, "She", setAraKeiGender, 2, "She", "It’s a she, right? Obviously a she.");
		return;
	}
	else if(bothriocQuestAvailable() && flags["BOTHRIOC_QUEST"] == undefined)
	{
		bothriocQuestTalk();
		return;
	}

	araKeiTalkMenu();
}

public function setAraKeiGender(genderType:uint):void
{
	clearOutput();
	showAraKei();

	ara.setStatusValue("Forced Gender", 1, genderType);

	switch (genderType)
	{
		case 0:
		default:
			output("You communicate your acceptance of the ambiguity, and throw in a full introduction while you’re at it. Ara Kei chuckles.");
			output("\n\n<i>“Well, aren’t you the cagey type. Allow me to reintroduce myself. I am Ara Kei Enya. I rule this harem and represent the bothrioc before the galaxy as our ambassador. My goal is to drag my species kicking and screaming into the light of civilization.”</i>");
			break;

		case 1:
			output("You communicate that ultimately you think of Ara Kei as male, and that your name is [pc.name] Steele. This seems to give him pause.");
			output("\n\n<i>“Farlanders are full of surprises. The myr tend to think of us as female, given their cultural obsession with the idea of female power. Perhaps the men are the powerful ones where you’re from, hm? Perhaps... ah, well, allow me to reintroduce myself. I am Ara Kei Enya. I am the master of this harem, and the ambassador of the bothrioc before the entire galaxy. My goal is to drag my species kicking and screaming into the light of civilization.”</i>");
			break;

		case 2:
			output("You communicate that ultimately you think of Ara Kei as female, and that your name is [pc.name] Steele. She nods, amused.");
			output("\n\n<i>“That’s the standard line around here. Most every other species likes to think of us as female - even if it is usually they who bear our young. Ah, but we’ll get to that. Allow me to reintroduce myself. I am Ara Kei Enya. I am the mistress of this harem, and the ambassador of the bothrioc before the entire galaxy. My goal is to drag my species kicking and screaming into the light of civilization.”</i>");
			break;
	}

	output("\n\nThe fabric of [ara.his] shift hisses softly as "+ ara.mfn("he repositions", "she repositions", "they reposition") + " [ara.himself]. The submissive waits patiently on their hands and knees until a new leg is presented to them, at which point the tongue-polishing continues unabated.");
	
	output("\n\n<i>“Since you have assuaged my curiosity, I shall do the same for you,”</i> the tall piebald being goes on. <i>“That is what I am here to do, after all. Nothing shall improve for our people unless someone stands here and talks to every visitor who wishes to get to know us, as wearisome as that may be. So what would you like to know?”</i>");
	
	araKeiMenu();
}

public function araKeiTalkMenu(lastF:Function = null):void
{
	clearMenu();

	gatedButton({ 
		id: 0, 
		lbl: "Bothrioc", 
		f: araKeiTalkBothrioc, 
		arg: undefined, 
		ttH: "Bothrioc", 
		ttB: "Let’s hear the truth about talking spiders from the head talking spider.", 
		prevF: lastF
	});

	gatedButton({ 
		id: 1, 
		lbl: "Ambassador", 
		f: araKeiTalkAmbassador, 
		arg: undefined, 
		ttH: "Ambassador", 
		ttB: "Ask about [ara.his] role here.", 
		prevF: lastF 
	});

	gatedButton({ 
		id: 2, lbl: "History", 
		f: araKeiTalkHistory, 
		arg: undefined, 
		ttH: "History", 
		ttB: "How do the bothrioc fit into the grander scheme of Myrellion?", 
		prevF: lastF 
	}, flags["ARAKEI_TALKED_AMBASSADOR"] == undefined);

	gatedButton({ 
		id: 3, 
		lbl: "Other B.ric", 
		f: araKeiTalkOtherBothrioc, 
		arg: undefined, 
		ttH: "Other Bothrioc", 
		ttB: "Ask whether the other bothrioc are on board with [ara.his] plans.", 
		prevF: lastF
	}, flags["ARAKEI_TALKED_HISTORY"] == undefined);
	
	if(flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_QUADOMME)
	{
		if(flags["BOTHRIOC_QUEST_COUNTERAGENT"] == undefined) addButton(4, "Finish", bothriocQuestSummit, ["intro", bothriocAddiction()], "Finish", "Tell Ara you’ve finished the mission [ara.he] set for you.");
		else addButton(4, "Ready", bothriocQuestSummit, ["ready", bothriocAddiction()], "Ready", "Join Ara Kei at the summit.");
	}
	
	addButton(14, "Back", araKeiMenu);
}

public function araKeiTalkBothrioc():void
{
	clearOutput();
	showAraKei();
	
	if(flags["BOTHRIOC_QUEST_COMPLETE"] != undefined) bothriocQuestTalkBlurbs("bothrioc");
	else
	{
		output("<i>“I’m afraid I simply haven’t the time to explain every intricacy of our species, but I can certainly outline some very important things to bear in mind. Now...”</i> one of Ara Kei’s fingers taps a chin in thought. <i>“Where to start...”</i>");
		output("\n\n<i>“We used to be the boogiemen of this planet. Before the myr really got going; before they became boogiemen unto themselves. To this day though, when a myr mother wants her rebellious spawn to behave, she threatens that the bothrioc will take her away and keep her in a harem, stuffed full of children that aren’t hers.”</i>");
		output("\n\n"+ ara.mfn("He laughs", "She laughs", "They laugh") + " when "+ ara.mfn("he catches", "she catches", "they catch") +" your expression. "+ ara.mfn("He displays", "She displays", "They display") + " a lot of teeth when "+ ara.mfn("he does", "she does", "they do") +" that.");
		output("\n\n<i>“Effective, isn’t it? Don’t worry, I’m not going to fill your head with lies, nor stuff your belly with spawn. Our reproductive system is unique though, and I readily admit is an easy source of fascination and revulsion.”</i> The four-legged bothrioc makes a sweeping gesture that takes in everyone in the embassy. <i>“As you can see, we all have an abdomen at the base of our torso. That is the ovipositor. It creates eggs and a fertilizing oil. We exchange the oil to fertilize eggs, and then plant the eggs in another’s orifices using the tube. Usually this is an intra-bothrioc matter, but we’re quite capable of both implanting in and being fertilized by others. That is where the fear and fascination a boogieman needs is sourced.”</i>");
		output("\n\nAra Kei coos down at the dutiful harem member still polishing [ara.his] leg chitin to a gleaming shine, pointing out a few spots that need special attention. <i>“We can put life in barren soil, but to the other species, that life is alien. We can be a mother where mothers are slim, and a father where the inverse is true. However, because it doesn’t have their genes and their eggs it is somehow not theirs when they bear it. There would probably be a strong tendency to abandon our young if not for the other little peculiarity of our breeding.”</i>");
		output("\n\nThe ginger human busily eroding a mountain of paperwork into a hill gives a long drooping whistle from across the room, of the <i>“here comes the big one”</i> variety. The look Ara Kei gives him is nothing short of venomous, and all the more backed up by the incredible chitinous physiology on display.");
		output("\n\n<i>“Thank you, Charles, your commentary is appreciated.”</i>");
		output("\n\nYou’re not sure what the dynamic between the two of them is. Charles is clearly human, but he’s definitely working largely for Ara Kei. He’s not a harem boy, you think, but that’s all the conclusion you can draw.");
	}
	processTime(5+rand(3));
	clearMenu();
	addButton(0, "Next", araKeiTalkBothriocII);
}

public function araKeiTalkBothriocII():void
{
	clearOutput();
	showAraKei();
	
	if(flags["BOTHRIOC_QUEST_COMPLETE"] != undefined) bothriocQuestTalkBlurbs("bothrioc ii");
	else
	{
		output("<i>“Yes,”</i> sighs Ara Kei theatrically, <i>“this is what has us classed by your thinking machines as not merely dangerous, but to be avoided at all costs. Our fertilizing slime has a variety of hormones in it. They serve to signal a bothrioc in submission that their time as a dominant is through. Their abdomens begin to swell more with fertile oil than eggs, that we may bathe larger batches of eggs in it, before depositing them. In species with biological sexes, it is feminizing, as the trigger to change to fertilization production is the same hormone mixture that turns girls into women. The real prize, however, is that it brings them to love their role as an incubator and to be naturally led by the dominant partners. It also tends to make them a bit absent-minded. If you watch closely, it takes my lovely harem here a good deal of concentration to handle all of this paperwork.”</i>");
		output("\n\nAt [ara.his] invitation, you take in the harem a bit more closely. Charles is sharp and on tack, but the bothrioc around the place are, while certainly seemingly competent, also working very hard to be. One bothrioc is filling out forms with a tongue stuck out and their face inches from the paper, contorted in concentration. Another, seeming lost in thought, is gently pulled toward a back room while another is brought in to take their place. Ara Kei regards [ara.his] harem warmly.");
		output("\n\n<i>“You see, the impression is that our oil makes you stupid. No, that is not the case. Rather, your priorities are reoriented, and between our love and our oil, you come to love your new place in life, to the point of excluding most other cares or concerns. My darlings are working so hard because this is important to me, and they wouldn’t be motivated by anything less.”</i> This last statement is accompanied by an encompassing gesture of [ara.his] arms.");
		output("\n\nTurning [ara.his] gaze once more to you, Ara Kei adds, <i>“And that is what you are told to fear. You see me before you, and I don’t attack you, or try to deceive you. However, the rules in the caverns we call home are not the ones I have embraced here, in order to state our case. Down there, the pidemmes and quadommes still consider any wanderer fair game. Consider that the real warning.”</i>");
	}
	
	//Unlocks “Charles” option in Embassy main menu
	processTime(10 + rand(3));
	
	flags["ARAKEI_TALKED_BOTHRIOC"] = 1;
	araKeiTalkMenu(araKeiTalkBothrioc);
}

public function araKeiTalkAmbassador():void
{
	clearOutput();
	showAraKei();
	
	if(flags["BOTHRIOC_QUEST_COMPLETE"] != undefined) bothriocQuestTalkBlurbs("ambassador");
	else
	{
		output("<i>“What exactly are you aiming to achieve up here?”</i> you ask. Ara Kei gazes at you silently for a few moments.");
		output("\n\n<i>“Perhaps you do not know?”</i> "+ ara.mfn("he says", "she says", "they say") +", seemingly mostly to [ara.himself]. <i>“Yes, likely. Something always taken for granted... well, who are we to judge such an attitude, after all.”</i>");
		output("\n\n<i>“It is both straightforward and very complicated, Steele,”</i> "+ ara.mfn("he goes", "she goes", "they go") +" on in louder tones. <i>“When your U.G.C. first stepped down from the stars to greet us, I was at first elated, and not just because they postponed the myr destroying the world. Here, at last, was an opportunity to get my race equal representation on Myrellion - to speak for our needs and wishes, instead of living forever in helpless fear of what the myr might do next. For surely if I presented our plight to these enlightened beings, they would help us?”</i>");
		output("\n\nAra Kei’s long, elegant face twists wryly.");
		output("\n\n<i>“Alas. It turns out aliens are turned just as cruel by bureaucracy and ulterior motive as the myr are. Did you know that your U.G.C’s legal protections for planetary sovereignty doesn’t merely require sapience? Merely existing and thinking do not satisfy the requirements for citizenship in this galaxy; it also requires a demonstration that the species has contributed meaningfully to the planet, through cultural or technological innovation. They tell me this clause exists to prevent warlike and savage species from being uplifted before they are capable of integration. From my brief exposure to this Xenogen organization and their fur-thing friends, however, I suspect the </i>real<i> reason is that it allows for the casual exploitation of races who are helpless to resist. Is that an unfair assumption to make, starwalker?”</i>");
		output("\n\nYou shrug uncomfortably. Ara Kei sighs, absently ruffling the hair of the haremling dutifully polishing [ara.his] chitin.");
		output("\n\n<i>“Unfortunately, the bothrioc’s very nature means we have extremely little to show for our long history, and the myr leadership will not hesitate to see us bereft of those protections. Therefore, I am the ambassador for my people out of a necessity of which most aren’t even aware. Oh, if I could make them see how precarious it all is, that would surely unite them like nothing ever has.”</i>");
		output("\n\n"+ ara.mfn("He smiles", "She smiles", "They smile") +" down lovingly.");
		output("\n\n<i>“At least my little ones support my endeavours, even if the rest of the species is too ill-informed.”</i>");
	}
	
	processTime(5 + rand(3));
	flags["ARAKEI_TALKED_AMBASSADOR"] = 1;
	araKeiTalkMenu(araKeiTalkAmbassador);
}

public function araKeiTalkHistory():void
{
	clearOutput();
	showAraKei();
	
	if(flags["BOTHRIOC_QUEST_COMPLETE"] != undefined) bothriocQuestTalkBlurbs("history");
	else
	{
		output("<i>“History? You ask for history from a species with no written records, no architecture, only the technology required to trap, eat and breed?”</i> Ara Kei sneers in apparent disbelief - however, the way [ara.his] eight limbs tremble slightly with restless energy telegraph "+ ara.mfn("he’s", "she’s", "they’re")+ " pleased you’ve brought this topic up.");
		output("\n\n<i>“We have history, Steele, but not as you understand it. Imagine that the only unspoken descriptions that existed of you were written by someone else - someone who was at best ambivalent to you, at worst an enemy.”</i> "+ ara.mfn("He watches", "She watches", "They watch") +" your expression closely with those big, black eyes of "+ ara.mfn("his", "hers", "theirs") +". <i>“Yes, there is someone, isn’t there? Not such a pleasant thought, is it. That is why I am here - to fight against my race being a scribbled footnote in somebody else’s tragedy. In order to apply for legal protection within the U.G.C.”</i>");
		output("\n\nA gleaming black arm is swept at the rows of bothrioc busying themselves over the books and reams of paper that are piled on the tables all around.");
		output("\n\n<i>“Even before the farlanders arrived, I - that is to say, me and my harem - collected and scoured the records of both sets of myr, tracking down every single mention of our race that we could find. It has been fascinating - and incredibly frustrating.”</i> A single index finger is pointed downwards. With a sigh of pleasure, the tongue polisher envelopes it in their mouth. Ara Kei’s attention and fervency are entirely directed at you. <i>“It is like a single bright thread woven into a vast garment, constantly disappearing from sight, reappearing where you wouldn’t expect - but definitively there. We had empires, you know. Bothrioc sometimes stood at the head of red myr armies. Some legends even had them as kings to gold myr queens. But it’s all so vague, so often contradictory, because of course the myr do not often waste print talking about us. WE are not THEY. Ah!”</i>");
		output("\n\nThere is a distinct, wet <i>“pop”</i>, and the submissive looks vaguely confused as all four of Ara Kei’s hands go up into the air, giving voice to pure exasperation.");
		output("\n\n<i>“My people! So assured that they would forever be the top pods on Myrellion that they never even noticed the myr building, and developing, and growing, until their factories and palaces were being built right on top of them. Now the myr are bent on destroying the world, a world that we happen to be on, but have no say in the running of. I will not have it, Steele.”</i> "+ ara.mfn("He wags", "She wags", "They wag") +" a stern, spit-polished finger at you, as if you had disagreed. <i>“The work I am doing here will prove the bothrioc are a distinct culture - one that deserves to be recognized and given a say in how this planet is developed. We shall not wallow in ignorance and shy away from the light, as the wetraxxal and the ganrael do; nor shall we bend our knees to the Federation, as some of the nyrea have chosen. We shall come to the galactic table on our own terms, as a result of our own hard work, with our heads held high!”</i>");
		output("\n\n<i>“Or at least some of us will,”</i> "+ ara.mfn("he amends", "she amends", "they amend") +", gazing at the hive of activity around [ara.him] serenely. <i>“Some of us will come kissing the ground upon which the others walk. But you get the idea.”</i>");
	}
	
	processTime(5+rand(3));
	flags["ARAKEI_TALKED_HISTORY"] = 1;
	araKeiTalkMenu(araKeiTalkHistory);
}

public function araKeiTalkOtherBothrioc():void
{
	clearOutput();
	showAraKei();
	
	if(flags["BOTHRIOC_QUEST_COMPLETE"] != undefined) bothriocQuestTalkBlurbs("other bothrioc");
	else
	{
		output("<i>“Do you have the support of the other bothrioc?”</i> you ask.");
		output("\n\n<i>“It is an up-hill struggle securing that if I am to be honest with you, Steele,”</i> Ara Kei sighs. <i>“The problem is that the dominants innately distrust one another. If your haremlings give you everything you need, why would you be reaching out to another, except to try and steal their prizes? Outside of our lovers we are a solitary species, always have been; wider organization is a difficult thing to sell. It does not help that I have the single largest harem of any bothrioc known. I keep an even forty, which has slaked my thirst for more lovers.”</i> "+ ara.mfn("He laughs", "She laughs", "They laugh") +", again with that wry note. <i>“But try explaining that to other quadommes! They just think I’m particularly greedy and untrustworthy. And it’s no good me applying for citizenship on my own. I need as many other quadommes as possible to step forward, if my plan has any chance of succeeding.”</i>");
	}
	
	// Diplomacy mission goes here
	processTime(3+rand(2));
	flags["ARAKEI_TALKED_OTHERBOTHRIOC"] = 1;
	araKeiTalkMenu(araKeiTalkOtherBothrioc);
}

public function araKeiFlirt():void
{
	clearOutput();
	showAraKei();
	
	var addiction:Number = bothriocAddiction();

	if (flags["ARAKEI_FLIRTED"] == undefined)
	{
		flags["ARAKEI_FLIRTED"] = 1;
		output("An eight-limbed "+ ara.mfn("dom", "domme", "dom") +" with a 40-strong harem? You reckon Ara Kei must be something else in bed. The question is - how to get [ara.him] there?");

		if (pc.isBimbo())
		{
			output("\n\n<i>“I bet you’re really good at snugglings,”</i> you say brightly. <i>“I’m really good at snuggling too. Wanna compare notes?”</i>");
		}
		else if (pc.isBro())
		{
			output("\n\n<i>“All this talk, "+ ara.mfn("dude bro", "baby doll", "baby dude bro doll") +"!”</i> you complain with mocking exasperation. <i>“Why don’t you show me where the money is?”</i>");
		}
		else
		{
			output("\n\n<i>“It seems as if there’s a lot about the bothrioc that has to be experienced to be properly understood,”</i> you grin, rocking your [pc.hip] gently. <i>“Perhaps you could give me a little personal demonstration?”</i>");
		}

		output("\n\nAra Kei gazes at you with silent incomprehension.");
		
		output("\n\n<i>“Are you... trying to flirt with me?”</i> "+ ara.mfn("he says", "she says", "they say") +" at last, touching [ara.his] long neck. <i>“Are those your people’s body signatures? How droll! I guess what they say is true - the outside galaxy is a fantastically promiscuous place.”</i> For a moment Ara Kei looks at you with [ara.his] big, black eyes as if you were the only person in the room, the sole focus of [ara.his] attention, and something turns in your gut. The thought that maybe, just maybe, you have bitten off more than you can chew flies through your head....");
		
		output("\n\nThe next moment [ara.his] gaze turns away to take in the bustle all around you again, and you breathe.");

		if (!pc.isTaur())
		{
			output("\n\n<i>“I’m flattered, Steele,”</i> "+ ara.mfn("he says", "she says", "they say") +" airily, <i>“but I have 40 people to take care of my needs. I have nothing to gain from rolling around on the floor with you. You run along down to Gildenmere - you should be able to find plenty of willing gold myr to see to you there.”</i>");
		}
		else
		{
			output("\n\n<i>“I’m flattered, Steele,”</i> "+ ara.mfn("he says", "she says", "they say") +" airily, <i>“but I have 40 people to take care of my needs. Your cumbersome body shape would present certain difficulties for me, moreover. You prance along down to Gildenmere - you should be able to find plenty of willing gold myr to see to you there.”</i>");
		}

		output("\n\nOh well. Nothing ventured, nothing gained.");

		araKeiMenu();
		return;
	}
	else if (addiction <= 24)
	{
		if(bothriocQuestComplete()) output("<i>“I’m still not interested, Steele,”</i> says Ara Kei with a wry smile, before you even open your mouth. <i>“I know, after all you’ve done for us, and all that you have learned! But your knowledge of us is all in your brain, not in your soul. Not sunken into your skin. There are other ways of learning than merely observing, and still you do not submit to them. Until you have - no. I am far too busy, anyway.”</i>");
		else output("<i>“Don’t be tiresome, Steele,”</i> says Ara Kei sharply, antennae twitching, before you even open your mouth. <i>“I have zero interest in weekending farlanders looking for an exotic screw. When you have gained a little more insight into my people - then we’ll see.”</i>");
		araKeiMenu(araKeiFlirt);
		processTime(1);
		return;
	}
	else if (addiction <= 59 || flags["ARAKEI_FLIRTED_59_ADDICTION"] == undefined)
	{
		IncrementFlag("ARAKEI_FLIRTED_59_ADDICTION");

		output("<i>“Perhaps - we could - ?”</i> you say haltingly.");
		
		output("\n\n<i>“Hmm,”</i> murmurs Ara Kei, the sound trailing off into a whispery, silky susurration. <i>“A little reward, perhaps? For taking a step towards true understanding?”</i>");
		
		output("\n\n<i>“Yeah!”</i> you say eagerly. The big quadomme gazes at you, and again you have that sense of being the center of something incredibly powerful’s attention - a thrilling fright tightening up your chest.");
		
		output("\n\n<i>“Let me be crystal clear about this, Steele,”</i> "+ ara.mfn("he says", "she says", "they say") +" briskly, breaking the spell by turning [ara.his] face back to the maid fervently polishing [ara.his] chitin. <i>“So you do not feel led on. I will never be your master. Forty is a challenge to manage, particularly with the amount of work that I have undertaken, and I will not deny my loved ones by taking on board more submissives than I can manage. So the things you really crave - being controlled, the bliss of submission, a loving boot pressing your face to the floor - are not things I can give you. I am sorry.”</i>");
		
		output("\n\nIt’s difficult, in the presence of the towering bothrioc, not to feel a slumping misery about this.");
		
		output("\n\n<i>“But -”</i> Ara Kei goes on, with a slight musical undercurrent, and your [pc.ears] perk up. <i>“But. I am not averse to giving obedient incubators little rewards. IF, Steele. If you finish the path you have undertaken, and do as I ask. And only then.”</i>");
		processTime(5 + rand(3));
		araKeiMenu(araKeiFlirt);
		return;
	}
	else if (addiction <= 99 || flags["ARAKEI_FLIRTED_99_ADDICTION"] == undefined)
	{
		IncrementFlag("ARAKEI_FLIRTED_99_ADDICTION");
		output("<i>“Please, Ara Kei,”</i> you say breathlessly. You don’t have to say anything else; the quadomme’s merciless, gleaming chitin and [ara.his] long, plump abdomen dominates your vision, and your [pc.skinFurScales] cries out to have it pressed hard against you, making passionate use of your tender flesh.");
		
		output("\n\n<i>“You do beg awfully sweetly, Steele,”</i> says the blue-haired bothrioc with amused diffidence, gazing down. <i>“I very much hope there’s someone else out there that knows that.”</i> "+ ara.mfn("He sighs, and shoos his maid away", "She sighs, and shoos her maid away", "They sigh, and shoo their made away") +". You watch as four, heeled boots slowly clack towards you, until the elegant, black-and-white monster towers over you.");
		
		if (flags["ARAKEI_FLIRTED_99_ADDICTION"] <= 1)
		{
			output("\n\n<i>“Very well,”</i> Ara Kei whispers. <i>“Let’s see how much you truly want this, little one. My second left leg has not been polished in at least four hours. You may begin.”</i>");
		}
		else
		{
			output("\n\n<i>“I shouldn’t need to tell you, little one,”</i> Ara Kei whispers. <i>“Just looking should tell you which of my legs is in need of polishing. And then... maybe then.”</i>");
		}

		processTime(3+rand(3));
		// [Polish] [No]
		clearMenu();
		addButton(0, "Polish", araKeiPolishBooties, undefined, "Polish Booties", "Yes. This is where you belong.");
		if (pc.lust() < 90) addButton(1, "No", araKeiNoPolishBooties, undefined, "No", "No... it may be difficult, but you’re not quite willing to abase yourself THAT much");
		else addDisabledButton(1, "No", "No", "You can’t bring yourself to say no... not with this amount of lust in your system.");
		return;
	}
	else
	{
		if (flags["ARAKEI_POLISHED_BOOTIES"] == undefined)
		{
			flags["ARAKEI_POLISHED_BOOTIES"] = 1;

			output("You prostrate yourself in front of Ara Kei and gaze at [ara.him] pleadingly. You don’t need to say anything; you can communicate your need, how [ara.he] "+ ara.mfn("makes", "makes", "make") +" you feel when you are in [ara.his] presence, without saying a word. <i>Fuck me. Fuck me hard. Make me yours.</i>");
			
			output("\n\n<i>“Ah, yes,”</i> smiles Ara Kei, gazing down fondly. <i>“Your reward. For having faith in my words, and being brave. There’s still one or two things you have left to learn though, Steele.”</i> [ara.He] "+ ara.mfn("shoos", "shoos", "shoo") +" [ara.his] foot-maid away. You watch as four, heeled boots slowly clack towards your face, until the elegant, black-and-white monster towers over you.");
			
			output("\n\n<i>“My second left leg has not been polished for at least four hours,”</i> they whisper. <i>“Begin immediately.”</i>");
			
			output("\n\nYou reach forward, bend forward and lay your [pc.tongue] on Ara Kei’s latex-like chitin, as if the order to do so had arrived from your own instincts. When you drag it upwards, warmth suffuses you, submissive bliss radiating through your whole body. All of this sheer, black authority, the feet of a wise, beautiful, absolute master - it deserves to be polished. It NEEDS to be polished, so all may know the devotion this quadomme commands.");
			
			output("\n\nAll this spreads inexorably through your mind in the course of three long licks directing along the warm, inflexible smoothness of Ara Kei’s calf, so that within moments you are nothing but a vessel of euphoric submissiveness. A little whimper of pleasure escapes your [pc.lips] as you change position and lavish saliva on [ara.his] inner knee");
			if (pc.hasCock() || pc.hasVagina())
			{
				output(";");
				if (pc.hasCock()) output(" [pc.eachCock]");
				if (pc.hasCock() && pc.hasVagina()) output(" and");
				if (pc.hasVagina()) output(" [pc.eachVagina]");
				if (pc.hasCock() && pc.hasVagina() || pc.cocks.length > 1 || pc.vaginas.length > 1) output(" are");
				else output(" is");
				output(" very, very");
				if (pc.hasCock()) output(" erect");
				if (pc.hasCock() && pc.hasVagina()) output(" and");
				if (pc.hasVagina()) output(" wet");
			}
			output(".")
			
			output("\n\n<i>“Yes little one,”</i> the bothrioc says, [ara.his] relaxed voice sending fuzzy sensation softly vibrating through you. <i>“Isn’t servility wonderful?");
			if (flags["ARAKEI_REFUSED_BOOTIES"] != undefined) output(" Just think - only a short time ago you refused to do this. Now you can appreciate how silly that attitude was, can’t you?”</i> you wag your head fervently. What an idiot you were being! <i>“");
			else output(" ");
			output("Let us not mistake willingness and effort for a job well done, though. Your technique needs work.”</i>");
			
			output("\n\nYou aren’t doing the very best you could? The soft bliss subsuming you immediately narrows down into a laser-guided focus. You pay solemn, microscopic attention as Ara Kei silently directs [ara.his] foot-maid to come back over and begin work on the leg directly next to yours.");
			
			output("\n\n<i>“See how she rolls her tongue, and goes with the grain,”</i> the quadomme instructs. Swiftly you follow suit, bending down to lap at Ara Kei’s narrow ankle, shivering at the way obeying [ara.his] order sends a fresh wave of pleasure crashing through your body. <i>“That prevents streaking. Kisses along the inner thigh are also very important...”</i>");
			
			output("\n\nYou are not allowed to stop until Ara Kei’s leg shines wetly with your saliva - and even then, you are made to go over several areas again by your strict instructor. You don’t mind. Being knelt in front of the bothrioc and forced to improve by them is gratifying beyond anything you think you’ve ever felt. By the end you feel ablaze with arousal,");
			if (pc.hasCock()) output(" [pc.eachCock] hard against your [pc.belly]");
			if (pc.hasCock() && pc.hasVagina()) output(" and");
			if (pc.hasVagina()) output(" [pc.eachVagina] puffy and spread, fervently awaiting a hard breeding");
			output(".");
			
			output("\n\n<i>“Inexpertly but ardently done, Steele,”</i> says the quadomme. You practically purr when [ara.his] fingers");
			if (pc.hasHair()) output(" run through your [pc.hair]");
			else output(" rub you behind the [pc.ear]");
			output(" fondly. <i>“Watching your progress all the way along the path has warmed my hearts. Ah... if only all farlanders had the same honesty and humbleness as you.”</i>");
			
			output("\n\n<i>“Will you breed me now, "+ ara.mfn("master", "mistress", "master-mistress") +"?”</i> you ask. Perhaps there was a time when you wouldn’t have had asked such a question so directly. A colder, sadder time.");
			
			output("\n\n<i>“Hmm,”</i> replies Ara Kei thoughtfully. [ara.He] withdraw" + ara.mfn("s", "s", "") +" [ara.his] hand to touch the pit of your throat with a single finger, drawing it slowly up your neck. You shiver with bliss. <i>“No. You may believe me cruel and sadistic for this, Steele, but there’s a very important lesson I want you to take away from today: Worshipping a domme is a reward in and of itself. You can feel that for yourself now, but still, connecting the absolutely essential tasks of an incubator to getting packed with eggs - no, I will not do your");
			if (flags["ARAKEI_RESOLVED_MASTER"] == undefined) output(" future");
			output(" owner that disservice.");
			if (flags["ARAKEI_REFUSED_BOOTIES"] != undefined) output(" Given you refused my wish earlier, it is all the more important for you to grasp this.");
			output(" You have done everything I’ve asked though, and I honor my promises. Meditate on this lesson, and then come see me again, if you are still interested in... learning more.”</i>");
			
			output("\n\nThe incandescent words finally cease to echo around the cathedral of your head, and it takes you a few moments to realize that [ara.he] "+ ara.mfn("has", "has", "have") +" denied you again! But with the bliss of worshipping [ara.his] wonderful smooth, warm armor still fresh in your mind, it’s difficult to be incredibly upset about it. And that promise [ara.he] "+ ara.mfn("has", "has", "have") +" given you... leading you inexorably on...");

			processTime(20+rand(10));
			pc.changeLust(15);
			araKeiMenu(araKeiFlirt);
		}
		else
		{
			output("You prostrate yourself in front of Ara Kei and gaze at [ara.him] pleadingly. You don’t need to say anything; you can communicate your need, how [ara.he] make"+ ara.mfn("s", "s", "") +" you feel when you are in [ara.his] presence, without saying a word. <i>Fuck me. Fuck me hard. Make me yours.</i>");

			output("\n\nBut you aren’t dumb, or at least not where getting what you want from the bothrioc is concerned. The peaceful, empathic clarity that comes from being an egg bitch allows you to perceive things that previously you could not. Like the fact Ara Kei’s jet, burnished abdomen is slightly more swollen than usual. Like the fact there’s just a hint of tetchiness to how [ara.he] "+ ara.mfn("is", "is", "are") +" directing [ara.his] minions, as if [ara.he] were pent up and on edge. You’ve picked your moment carefully. Perhaps this was the lesson [ara.he] "+ ara.mfn("was", "was", "were") +" trying to impart all along by denying you like this? The art of being able to perceive when a dominant is feeling the itch? It wouldn’t surprise you.");

			if (flags["ARAKEI_THE_REAMENING"] == undefined)
			{
				output("\n\n<i>“So here we are at last, [pc.name] Steele,”</i> says the bothrioc ambassador. The big, pupil-less eyes are focused on you, and this time they don’t turn away; you are at the center of Ara Kei’s attention, and it feels like being at the very bottom of a black, silk-lined pit. <i>“In the clearing at the end of the path. True understanding. And now I am to present you a small taste of the fruits available from achieving this state of being. I said that I would, and so it shall be. There is no need to rise.”</i>");
			}
			else
			{
				output("\n\n<i>“Again, Steele?”</i> says the bothrioc ambassador, raising an eyebrow. <i>“");
				if (flags["ARAKEI_RESOLVED_MASTER"] != undefined) output(" Is your owner not seeing to your needs? The level of your abasement makes me worry.");
				else output(" Can you not see the need for someone who has the time to properly take care of you, now? Occasionally getting me to fuck you senseless is a temporary solution at best.");
				output("”</i> [ara.he] sigh" + ara.mfn("s", "s", "") +" heavily. <i>“Oh, very well. It is so difficult to say no to that face.”</i>");
			}

			output("\n\n"+ ara.mfn("He", "She", "They") +" shoo"+ ara.mfn("s", "s", "") +" away [ara.his] foot-maid, rise"+ ara.mfn("s", "s", "") +" up to their full height, and then stride"+ ara.mfn("s", "s", "") +" off in mesmerising, alien style. You");
			if (pc.isNaga()) output(" slither after her, [pc.belly] rubbing along the ground");
			else if (pc.isGoo()) output(" ooze deferentially after her");
			else if (!pc.isTaur())
			{
				output(" follow on your [pc.hands]");
				if (pc.hasKnees()) output(" and knees");
			}
			else output(" follow behind");
			output(", eyes fixed on the gleaming black chitin rising and falling with utterly assured grace ahead of you.");

			pc.lustRaw = pc.lustMax();
			processTime(10+rand(5));

			clearMenu();
			addButton(0, "Next", araKeiTheReamening);
			//Max out Lust
		}
	}
}

public function araKeiTheReamening():void
{
	clearOutput();
	showAraKei();

	output("Ara Kei leads you into a large, shaded room, maybe a former office space that has been cleared of its former accoutrements and hung with tall, thin tapestries and banners. When [ara.he] close"+ ara.mfn("s", "s", "") +" the door with a firm click behind you all the noise and bustle from the embassy is hushed down to a quiet drone; it’s as if it’s coming from a distant street outside. The room is dominated by a huge, cylindrical object that hangs from the ceiling all the way down to the floor, so odd-looking it almost breaks the spell of all that lithe, white flesh and plump, gleaming chitin in front of you. It’s like a massive mosquito net, or a drooping chandelier made entirely out of sheets; layer upon layer of white silk flowing downward and strung with an intricate pattern of ropes and pulleys.");

	output("\n\n<i>“I must say, I’m very impressed with the siel’s work,”</i> the quadomme says, leaving you kneeling on the wooden floor to stride around the room, touching and stroking various large, white bundles securely tied to the ceiling. Between [ara.him] and the hanging sheeted object, you don’t immediately realize what they are. <i>“Made exactly to my specifications and then some,”</i> [ara.he] murmur"+ ara.mfn("s", "s", "") +", sinking [ara.his] long fingers into one of the webbed submissives with surgical precision, eliciting a hoarse gasp of pleasure from the uncovered mouth. <i>“If my people are ever uplifted, there is a very rich relationship to be had there. You will stand at the bottom of my bed, Steele.”</i>");

	output("\n\nTremulously you do so, carefully pulling aside a silk sheet so that you can stand at the center of the cylinder of hanging sheets and ropes. There’s a light on at the top of it. You try and control your breathing when the clack of four stilettoed feet comes steadily closer and the rays are blotted out by a tall shape behind you, but it’s impossible. Even when you’re not looking directly at [ara.him], the mere presence of Ara Kei makes your heart thump and your skin feel incredibly sensitive, begging to be touched.");

	if (flags["ARAKEI_THE_REAMENING"] == undefined)
	{
		output("\n\n<i>“You probably think I’m dreadfully cruel,”</i> says the quadomme. [ara.His] hands move with business-like briskness over your body, divesting you of your [pc.gear] with the ease only a person with twenty fingers and a lot of practice undressing others could achieve. You shiver as the four hands come to rest on your naked frame, two on your shoulders and two on your waist, this time more tenderly. <i>“Denying you for so long, when your body has been crying out for me to throw you over the nearest desk and take you roughly for who knows how long now.”</i> [ara.His] fingers are following the line of your muscles down one arm whilst another draws the limb out, pulling it taut; every so often [ara.his] fingertips dig in, probing, testing. A particular pinch near your inner elbow makes you gasp slightly, your bicep tensing up. Ara Kei makes a whispering <i>“ahh”</i> noise, and holding your arm in position, loops a knotted rope around your wrist.");

		output("\n\n<i>“Didn’t you?”</i> [ara.he] persist"+ ara.mfn("s", "s", "") +", performing the same trick with your other arm, so that both limbs are splayed helplessly above you. <i>“Wondered why I didn’t make casual use of you whenever I felt like it? Did you wonder if it was an act of sadism?”</i>");

		output("\n\n<i>“I - I did wonder, Ara Kei,”</i> you manage. [ara.He] "+ ara.mfn("is", "is", "are") +" concentrating on your lower half, now. Chitinous fingers drift over your [pc.groin],");
		if (pc.hasCock())
		{
			output(" grasping your fervently erect cock");
			if (pc.cocks.length > 1) output("s");
			output(" momentarily");
		}
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina())
		{
			output(" sliding over the inner lips of your moistened cunt");
			if (pc.vaginas.length > 1) output("s");
		}
		output(" - but that isn’t their main interest here. The bothrioc’s glossy digits roam over the mass of your [pc.thighs] and [pc.legs], twisting you this way and that, searching out those raw, tingling nerve-endings that they are looking for. The longer [ara.he] explore"+ ara.mfn("s", "s", "") +" your body, the more of those little tweaks and flexes that make you tense up [ara.he] discover"+ ara.mfn("s", "s", "") +", and... you don’t know for how much longer you can keep breathing if they keep touching you that way...");

		output("\n\n<i>“I didn’t lie,”</i> [ara.he] say"+ ara.mfn("s", "s", "") +", reaching down to");
		if (pc.isNaga() || pc.isGoo())
		{
			output(" tie a series of rope loops around your");
			if (pc.isNaga()) output(" serpentine lower half");
			else output(" gooey lower half");
		}
		else output(" circle your ankles with rope");
		output(", securing them tightly with practiced jerks of the wrist. [ara.He] step"+ ara.mfn("s", "s", "") +" back, you hear the squeak of pulleys, and the next second you are being hoisted off the ground. You fall forwards into mid-air, helplessly dangling from your trapped wrists and looped up [pc.legs].");

		output("\n\n<i>“Looking after 40 incubators is far too much responsibility for me to bend over every cute morsel that happens to come into the embassy and give me the eye,”</i> [ara.he] murmur"+ ara.mfn("s", "s", "") +" in your ear. Somehow [ara.he] "+ ara.mfn("is", "is", "are") +" travelling with you, limbs shuffling in the hanging bed’s fabric behind you as [ara.he] winch"+ ara.mfn("es", "es", "") +" you further and further away from the hard, polished floor. Ten feet up your bound, helpless form comes to a stop with a click. Two hard, stilettoed feet come to rest on your waist. Three long fingers touch you near the pit of your neck, tracing your collarbone comfortingly until your breathing is no longer ragged and your heartbeat has dropped at least a bit.");

		output("\n\n<i>“But that wasn’t the only reason, I admit,”</i> Ara Kei continues. [ara.He] "+ ara.mfn("is", "is", "are") +" utterly measured, the same tone of voice that [ara.he] used to address you the very first time you met still in place here, crouched over your naked and completely helpless form; composed, relentless, flawless power. [ara.His] hand slides away from your collarbone, down your spread-eagled arm, and grips you at a pressure point. At the same time, they curl another hand around your [pc.thigh] and pinches you there. It’s as if somebody just directed a bolt of electricity through you; you spasm in your bonds, crying out wordlessly, almost unaware of how");
		if (pc.hasCock()) output(" [pc.eachCock] flexes up eagerly");
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina()) output(" [pc.eachVagina] quivers with unspeakable pleasure");
		if (pc.hasCock() || pc.hasVagina()) output(" to [ara.his] touch.");
		else output(" effortlessly [ara.he] toy" + ara.mfn("s", "s", "") +" with your pleasure.");

		output("\n\n<i>“If you have the ability to cure a half-blind person’s sight, why show them a beautiful landscape before you have done so?”</i> Another pair of simultaneous pinches, another blazing electrical spasm which scatters whatever thoughts you have to the four corners of the galaxy. <i>“Certainly I could have been doing this to you much sooner, but what a shame if you hadn’t already completely surrendered to me. To us. To a lifetime of bliss.”</i>");
	}
	else
	{
		output("\n\n[ara.His] hands move with business-like briskness over your body, divesting you of your [pc.gear] with the ease only a person with twenty fingers and a lot of practice undressing others could achieve. You shiver as the four hands come to rest on your naked frame, two on your shoulders and two on your waist, this time more tenderly. [ara.His] fingers follow the line of your muscles down one arm whilst another draws the limb out, pulling it taut; every so often [ara.his] fingertips dig in, probing, testing. A particular pinch near your inner elbow makes you gasp slightly, your bicep tensing up. Ara Kei makes a whispering <i>“ahh”</i> noise, and holding your arm in position, loops a knotted rope around your wrist.");

		output("\n\n<i>“It’s mostly down to memory, you know,”</i> [ara.he] say"+ ara.mfn("s", "s", "") +" briskly, performing the same trick with your other arm, so that both limbs are splayed helplessly above you. <i>“If I can remember exactly what makes each of my subs crease up and whimper with pleasure I can remember exactly which articles need to be cited in front of the Kui Tan Consul, and if I can remember which articles...”</i> chitinous fingers drift over your [pc.groin],");
		if (pc.hasCock())
		{
			output(" grasping your fervently erect cock");
			if (pc.cocks.length > 1) output("s");
			output(" momentarily");
		}
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina())
		{
			output(" sliding over the inner lips of your moistened cunt");
			if (pc.vaginas.length > 1) output("s");
		}
		output(" - but that isn’t their main interest here. The bothrioc’s glossy digits roam over the mass of your [pc.thighs] and [pc.legs], twisting you this way and that, searching out those raw, tingling nerve-endings that they are looking for. The longer [ara.he] explore"+ ara.mfn("s", "s", "") +" your body, the more of those little tweaks and flexes that make you tense up [ara.he] discover"+ ara.mfn("s", "s", "") +", and... you don’t know for how much longer you can keep breathing if [ara.he] keep"+ ara.mfn("s", "s", "") +" touching you that way... <i>“...you get the picture.”</i>");

		output("\n\n[ara.He] reach"+ ara.mfn("es", "es", "") +" down to");
		if (pc.isNaga() || pc.isGoo())
		{
			output(" tie a series of rope loops around your");
			if (pc.isNaga()) output(" serpentine lower half");
			else output(" gooey lower half");
		}
		else output(" circle your ankles with rope");
		output(", securing them tightly with practiced jerks of the wrist. [ara.He] step"+ ara.mfn("s", "s", "") +" back, you hear the squeak of pulleys, and the next second you are being hoisted off the ground, helplessly dangling from your trapped wrists and looped up [pc.legs]. Somehow [ara.he] "+ ara.mfn("is", "is", "are") +" travelling with you, limbs shuffling in the hanging bed’s fabric behind you as [ara.he] winch"+ ara.mfn("es", "es", "") +" you further and further away from the hard, polished floor. Twelve feet up your bound, helpless form comes to a stop with a click. Two hard, stilettoed feet come to rest on your waist. Three long fingers touch you near the pit of your neck, tracing your collarbone comfortingly until your breathing is no longer ragged, your heartbeat has dropped at least a bit.");

		output("\n\n<i>“So here we are again, Steele,”</i> Ara Kei goes on. [ara.He] "+ ara.mfn("is", "is", "are") +" utterly measured, the same tone of voice that [ara.he] used to address you the very first time you met still in place here, crouched over your naked and completely helpless form; composed, relentless, flawless power. [ara.His] hand slides away from your collarbone, down your spread-eagled arm, and grips you at a pressure point. At the same time, they curl another hand around your [pc.thigh] and pinches you there. It’s as if somebody just directed a bolt of electricity through you; you spasm in your bonds, crying out wordlessly, almost unaware of how");
		if (pc.hasCock())
		{
			output(" [pc.eachCock] flex");
			if (pc.cocks.length == 1) output("es");
			output(" up eagerly");
		}
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina())
		{
			output(" [pc.eachVagina] quiver");
			if (pc.vaginas.length == 1) output("s");
			output(" with unspeakable pleasure");
		}
		if (pc.hasCock() || pc.hasVagina()) output(" to [ara.his] touch.");
		else output(" effortlessly [ara.he] toy" + ara.mfn("s", "s", "") +" with your pleasure.");

		output("\n\n<i>“Willingly you come in here - no, you beg to come in here, so that I can render you helpless, play with you as I wish and utterly engorge you with my children-to-be.”</i> Another pair of simultaneous pinches, another blazing electrical spasm which scatters whatever thoughts you have to the four corners of the galaxy. <i>“It doesn’t make the slightest bit of sense if you stop to think about it. But that’s the joy of my race, isn’t it?”</i> [ara.His] breath washes over the nape of your neck, and [ara.his] feet tighten their grip on your waist. <i>“We evolved so that the </i>prey<i> would come to </i>us<i>.”</i>");
	}

	output("\n\nThis time, four hands touch you in four different places, gently but firmly. The effect is to force you to inexorably arch your back, presenting your [pc.ass] to the huge, slim creature that has made [ara.himself] your puppet-master. You moan as something warm and oily nestles itself between your ass-cheeks, spreading them to press against your [pc.anus] with agonising slowness. At the same time, the four hands clamp where they are resting, at your elbows and just below your ribcage.");
	if (pc.hasCock())
	{
		output(" Your desperate erection");
		if (pc.cocks.length > 1) output("s are");
		else output(" is");
		output(" incredibly tight, unbearable arousal making");
		if (pc.cocks.length > 1) output(" them");
		else output(" it");
		output(" rock hard");

		if (pc.hasVagina()) output(", e");
	}
	if (!pc.hasCock() && pc.hasVagina()) output(" E");
	if (pc.hasVagina())
	{
		output("cstatic electricity pulses through your cunt");
		if (pc.vaginas.length > 1) output("s");
		output(", making");
		if (pc.vaginas.length == 1) output(" it");
		else output(" them");
		if (pc.wettestVaginalWetness() < 3) output(" drip");
		else output(" drool");
		output(" [pc.femcum] onto the floor far below.");
	}
	output(" The quadomme holds you like that, on a precipice of keening arousal, for what seems like hours, days of sadistic ecstasy; and then [ara.he] punch"+ ara.mfn("es", "es", "") +" [ara.his] ovipositor inwards, piercing your "+ (pc.mf("m", "f") == "m" ? "boy pussy" : "ass pussy") +" and spreading you with its first bulging section with a single fierce movement.");
	pc.buttChange(ara.cockVolume(0), true, true, false);
	output(" You scream as you orgasm, thrashing helplessly against your bonds as");
	if (pc.hasCock())
	{
		output(" [pc.eachCock] flume");
		if (pc.cocks.length == 1) output("s");
		output(" [pc.cum] into the air, hitting the far curtain you’re clenching up that hard");
		if (pc.hasVagina()) output(" and");
	}
	if (pc.hasVagina())
	{
		output(" [pc.eachVagina] gutter");
		if (pc.vaginas.length == 1) output("s");
		output(" juices deliriously");
	}
	output(", full body pulses of submissive ecstasy which are made all the more powerful by how raw the bothrioc’s touch has left your nerve endings.");

	output("\n\n<i>“Ah, the little death,”</i> sighs Ara Kei, fondling your heaving [pc.chest] with sweeps of [ara.his] hands all the while. Even in the middle of your shocking orgasm, you can feel [ara.him] narrowing [ara.his] focus, working out just where your");
	if (pc.biggestTitSize() > 1) output(" breasts are");
	else output(" chest is");
	output(" most sensitive, just exactly how to touch your [pc.nipples] to make them tingle with agonising joy... <i>“You’re going to be dying a lot, over the next day or so.”</i>");

	pc.orgasm();
	processTime(20+rand(10));
	pc.lustRaw = pc.lustMax() * 0.4;

	clearMenu();
	addButton(0, "Next", araKeiTheReameningII);
}

public function araKeiTheReameningII():void
{
	clearOutput();
	showAraKei();

	output("Ara Kei spends at least half an hour inserting [ara.his] ovipositor into you; thick, oily segment after thick, oily segment, disappearing past your stretched ring. There seems to be no end to it, no end to how [ara.he] can bulk out your bowels with [ara.his] hot, bulbous sex, no end to how much of your sensitive slut body can be appropriated to serve as its clinging sleeve. Your perception of both it and time is warped by the fact [ara.he] refuse" + ara.mfn("s", "s", "") +" to stretch you wide again, refuse"+ara.mfn("s", "s", "")+" to force another vast, hard bulge into you, without mercilessly electrifying you, making you wriggle and spasm and wail to how [ara.his] four hands touch and tease you. Another orgasm is had");
	if (pc.hasCock() || pc.hasVagina() || pc.isLactating())
	{
		output(", more")
		if (pc.hasCock()) output(" [pc.cum]");
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina()) output(" [pc.femcum]");
		if ((pc.hasCock() || pc.hasVagina()) && pc.isLactating()) output(" and");
		if (pc.isLactating()) output(" [pc.milk]");
		output(" spurted wildly into the air");
	}
	output(" as [ara.he] carefully close"+ ara.mfn("s", "s", "") +" your windpipe, lovingly asphyxiating you with a knot of silken sheets so that sensuous stars burst inside your head. Another is pushed onto you whilst you’re still trying to regaining your breath, a low, tuneful groan forced past your lips, nerves jangling up one side of your body and then the other,");
	if (pc.hasCock()) output(" your aching [pc.cock] flexing ecstatically but dryly to the bothrioc’s rigorous milking of your prostate");
	if (pc.hasCock() && pc.hasVagina()) output(" and");
	if (pc.hasVagina()) output(" your throbbing [pc.vagina] quivering and clenching up to how [ara.he] pressures its tender walls through your stuffed [pc.asshole]");
	if (!pc.hasVagina() && !pc.hasCock()) output(" your [pc.asshole] quivering and clenching up around the thick intruder spreading it wide")
	output(".");

	output("\n\n<i>“Such delightful sounds,”</i> [ara.he] laugh"+ ara.mfn("s", "s", "") +", <i>“such wonderful little dances");
	if ((pc.hasCock() && pc.cumQ() >= 500) || (pc.hasVagina() && pc.wettestVaginalWetness() >= 4) || (pc.isLactating() && pc.milkQ() >= 500)) output(" and such astonishing quantity of juices");
	output("! Oh, you make me doubt my own wisdom, little one; maybe I do have a space for you, somewhere in my larder.”</i> There’s genuine passion and lust running through their cultured tone, now. <i>“Such an enjoyable mating display has me swollen and overburdened,”</i> [ara.he] growl"+ ara.mfn("s", "s", "") +" in your ear. [ara.He] pause"+ ara.mfn("s", "s", "") +" to bite you, hard, at the joining of neck and shoulder. You exhale raggedly, warm oil dribbling down from your [pc.anus], warm, fuzzy bliss twining with the sensation of being utterly owned, brutally dominated. <i>“You will take full responsibility for how worked up you’ve gotten me.”</i> Ara Kei");
	if (!pc.hasFuckableNipples())
	{
		output(" tightens [ara.his] fingertips around your [pc.nipples]");
		if (pc.isLactating())
		{
			output(", making them");
			if (pc.milkQ() <= 200) output(" dribble");
			else output(" spurt");
			output(" [pc.milk]");
		}
	}
	else
	{
		output(" slips [ara.his] fingertips into your [pc.nipples]");
		if (pc.isLactating())
		{
			output(", making them");
			if (pc.milkQ() <= 200) output(" dribble");
			else output(" spurt");
			output(" [pc.milk] around them");
		}
	}
	output(" at the same time as the first of [ara.his] eggs travels down [ara.his] extended egg-stalk and stretches your [pc.anus].");

	// Doubled quantity or w/e
	pc.loadInAss(ara);

	output("\n\nOval after oval are ejaculated into your [pc.ass] and deposited heavily in your bowels. You chose to approach the quadomme when [ara.he] "+ara.mfn("was", "was", "were") +" particularly plump with eggs, and duly receive your reward for doing so; your belly bulks, then swells, then grows utterly taut with packed, bumpy warmth, Ara Kei breeding you with harsh gasps, clasps of your flesh and hisses, pausing occasionally to sink [ara.his] teeth into your neck and [pc.ears]. The huge pressure [ara.his] load ");
	if (pc.hasCock()) output(" puts on your poor prostate");
	else if (pc.hasVagina()) output(" puts on your tingling pussy walls");
	else output(" packs into your ass")
	output(" drives you to another delirious orgasm");
	if (pc.hasCock()) output(", your [pc.cock] straining to pulse out [pc.cum] it ran out of long ago");
	output(", but the real joy is the indescribable sensation of fulfilling your purpose; the sunny, blossoming euphoria of taking everything an egg-giver’s got, of hearing their groans of pleasure as they pack you utterly full of new life. They deserve it, for being so powerful and beautiful - being a vessel for such a creature’s potent lusts makes you unspeakably happy. You only wish you could live forever in this movement - clasped by the arch-bothrioc, harshly twisted this way and that by [ara.his] masterful hand, and having every inch of your soft, radiant self fucked by [ara.him].");

	output("\n\nChitinous hands slide over your [pc.chest] and [pc.hips] soothingly when, at long last, the supply of eggs runs out. Ara Kei spends almost as much time withdrawing [ara.his] ovipositor as [ara.he] did inserting it. [ara.He] hold"+ ara.mfn("s", "s", "") +" you tight, stroking your sweat-soaked");
	if (pc.hairLength > 0) output(" [pc.hair]");
	else output(" scalp"); 
	output(", whispering nothings in your teeth-imprinted ears, as another segment pulls back, stretching your tender asshole... and then coming free, making the breath catch in your throat. You don’t feel any less full for the glorious purple egg-cock retreating from you; the quadomme has packed your intestines with [ara.his] dense, oily love, more eggs than you’ve ever taken from any other source. When [ara.he] finally draw"+ ara.mfn("s", "s", "") +" away the tip of it, [ara.he] reach"+ ara.mfn("es", "es", "") +" down with two hands and, whilst gently stroking your face, squeezes your ass-cheeks firmly together until your [pc.anus] agrees to close itself up.");

	//Lust down 40%, anal looseness up if ass tight
	processTime(15+rand(10));
	pc.orgasm();
	pc.lustRaw = 0;

	clearMenu();
	addButton(0, "Next", araKeiTheReameningIII);
}

public function araKeiTheReameningIII():void
{
	clearOutput();
	showAraKei();

	output("<i>“I hope it was worth the wait, Steele,”</i> Ara Kei murmurs, supple chest pressing into your back. The best you can manage in response is a long, exhausted groan, which draws a husky laugh from the dominant. <i>“And that you are ready for the next stage.”</i>");

	output("\n\nWait. You aren’t done...? There’s a shuffling above you as the warmth of [ara.his] white chest parts from you and [ara.he] move"+ ara.mfn("s", "s", "") +" [ara.himself] further up the vertical bed - so that the great teardrop shape of [ara.his] abdomen looms above your shoulders. Sticky strands of silk land on your [pc.skinFurScales], and before you can gather enough of your scattered thoughts to understand what [ara.he] "+ ara.mfn("is", "is", "are")+" doing, Ara Kei is skilfully manipulating your bonds and [ara.his] legs to turn you around and around, [ara.his] spinnerets busily producing thin but incredibly tough silk to wrap your entire frame in. Your [pc.legs] are cocooned in white, your arms are bound tightly to your side, your face is brought close to [ara.his] plump, nodule-like spinnerets - and then there is nothing but muffling, sticky darkness. The only part of your naked body [ara.he] leave"+ ara.mfn("s", "s", "") +" unbound are your nose and [pc.lips].");

	output("\n\n<i>“Now then,”</i> says the monstrous bothrioc thoughtfully. You feel yourself being moved around, being brought downwards, dangled from above. How "+ ara.mfn("is", "is", "are") +" [ara.he] doing this? Where does [ara.his] physical strength come from? You don’t know. You don’t really care. You are [ara.his] pawn, the towering "+ ara.mfn("king", "queen", "king-queen") +" of this dark sensual hole you’ve tumbled down, and it doesn’t seem unreasonable that [ara.he] can turn your whole world this way and that however [ara.he] please"+ ara.mfn("s", "s", "") +". You are hoisted upwards again, you hear sticky wet sounds above you - and then finally you are left where you are. Dangling, bound and blind from the ceiling, utterly stuffed with the eggs of the being that’s done this to you. Thin, smooth lips meet yours, and for a moment Ara Kei’s tongue tangles with yours.");

	output("\n\n<i>“You sit there and ruminate for a bit, little one,”</i> [ara.he] husk"+ ara.mfn("s", "s", "") +". <i>“Bask in the feeling of my spawn growing within you. I will be back to set you on your way in due course. Probably.”</i>");
	if (pc.hasLowerGarment()) output(" You feel something soft being pushed past your [pc.lips], and you emit a muffled whimper when you realize what it is. The taste and smell of your own intense arousal inundates your senses as your [pc.lowerUndergarment] are stuffed into your mouth.");
	if (pc.cumQ() <= 1000 && pc.wettestVaginalWetness() <= 5 && pc.milkQ() <= 1000) output(" Four stilettoes clack their way away from you, a door opens and shuts... and then you’re on your own.");
	else
	{
		output(" Four stilettoes clack their way away from you, pausing halfway across the room.");

		output("\n\n<i>“I’m going to have to get someone in here with a mop, aren’t I?”</i> Ara Kei sighs. You hear the rustle of heavily soiled linen. <i>“Farlanders - a lot of fun, but very high maintenance.”</i> A door opens and shuts... and then you’re on your own.");
	}

	processTime(55+rand(10));
	clearMenu();
	addButton(0, "Next", araKeiTheReameningIV);
}

public function araKeiTheReameningIV():void
{
	clearOutput();
	showAraKei();

	output("Time drifts by as you dangle there, a mummified ornament in a spider’s boudoir. Perhaps the old you would have gotten bored after about two minutes of this, but that could not be further from the case where the new you is concerned. The frazzling, mind-blowing sex you just endured has scattered your sense of self and pushed you into a state of Zen, happy simply to be the creature of total submission you have been molded into. Everything centers around the big, warm, contented glow in your tautened stomach, utter engorgement on a dominant’s lusts. As the moments slip by you can feel that reaching out and permeating every cell in your body, changing you to be even more suited to being an egg slut, softness piling on upon your [pc.chest] and [pc.hips]. It is true contentment, and hard, sharp thoughts - like your mission and whether your crew are wondering where you are - cannot pierce the all-encompassing fuzz.");

	//Time forward 4 hours, normal Lust increase
	output("\n\nOccasionally a door opens, a slight breeze touches your lower face. A single pair of armored feet will click-clack busily around and swiftly depart, or two pairs come in and you hear Ara Kei issue some brisk orders to the underlings around [ara.him] - or tend to the harem already here. Slithery, sticky sounds and murmurs as [ara.he] unbind"+ ara.mfn("s", "s", "") +" morsels attached to the ceiling and trusses up others; gasps, coos and moans as [ara.he] deliver"+ ara.mfn("s", "s", "") +" soft love, tough love, and hard oil-drainings to those who remain here. You are given an insight into the sheer level of duty and engagement required to maintain the quadomme’s life: Constantly rotating [ara.his] attention"+ ara.mfn("s", "s", "") +" around 40 other people, [ara.his] never-ending awareness of where every submissive is at any one time, the docility, cooperative spirit and total investment of each haremling to make it all work like a well-oiled machine. It takes a while for your brood-slowed mind to think of this, but it eventually occurs that Ara Kei deliberately put you here so that you could observe all of this. A lesson within a lesson, imparted to a farlander who can carry the memory of these sights, sounds and feelings to the stars above, a willing vector of bothrioc love. Certainly [ara.his] cunning and lust are multi-layered enough.");

	//Time forward 2 hours, high Lust increase

	output("\n\nAgain and again the fact that the dominant wants you to be here, trussed up");
	if (pc.hasLowerGarment()) output(", mouth stuffed with your [pc.lowerUndergarment]");
	output(" and helpless, chimes all the way through you like a deep, repeating piano note, making heat climb up to your [pc.skinFurScales]. Each time your own arousal climbs a bit higher, abetted by the hot, plump glow suffusing your core, and after a while you’re rocking slightly in your adhesive bindings in frustration,");
	if (pc.hasCock()) output(" [pc.eachCock] hard against the silk");
	if (pc.hasCock() && pc.hasVagina()) output(" and");
	if (pc.hasVagina()) output(" [pc.eachVagina moist and puffy, begging for the same filling your [pc.ass] has received");
	if (!pc.hasCock() && !pc.hasVagina()) output(" seeking the slightest touch to bring pleasure to yourself")
	output(". The sharp, certain sound of four chitinous heels return to you just as it’s starting to get unbearable.");

	var unfilledVag:int = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);
	if (unfilledVag >= 0)
	{
		output("\n\nAra Kei reaches up and undoes you from the ceiling, carefully drawing you downwards, laying you between [ara.his] four legs before peeling the silk away from your [pc.skinFurScales]. [ara.He] leave"+ ara.mfn("s", "s", "") +" your arms bound, however, forcing you to raise your [pc.ass] up with a telling stroke and press of a finger, and then unceremoniously thrusting [ara.his] ovipositor deep into your wet, spread pussy.");
		pc.cuntChange(unfilledVag, ara.cockVolume(0), true, true, false);

		output("\n\n<i>“I would hate for you to leave without tasting a range of a kept incubator’s experiences...”</i> groans the quadomme, hands pressed into your [pc.chest] as [ara.he] stretch"+ ara.mfn("es", "es", "") +" your sensitive labia wide with rough thrust after thrust of hard, oily bulges. <i>“The ecstasy of a long, lavish breeding - and the crude joy of being simple, swift relief for your owner, whenever they feel like it.”</i> Your [pc.vagina " + unfilledVag + "] quivers around [ara.his] egg-stalk, drooling [pc.femcum] as it impatiently wills it on. The sensation is all the greater for how stuffed you already are, the bulges of unborn young in your gut compressing your pussy, making you feel every inch of Ara Kei’s thrusting, questing breeding pole. You tense up and orgasm as the first egg forces its way past your mouth and travels up your claimed tunnel, crying out and throwing your head back with delight as it blooms into your womb, the squeezing of thin fingers on your [pc.nipples] augmenting your slutty joy even more. The bothrioc doesn’t give you many eggs this time - even this quadomme, it seems, has limits - but it’s enough to swell out your stomach even more. Two layers of full, fertile weight for you to bear.");

		// Regular bothrioc preggers
		pc.loadInCunt(ara, unfilledVag);

		output("\n\nAfter a short time relaxing against you, their whispering breath in your [pc.ears] and [pc.hair] and their flat chest moulded against your back, Ara Kei withdraws - each bump of their ovipositor sending little tingles through your tenderized cunt - draws you up into a kneeling position, and then stalks around to face you.");
	}
	else if (pc.hasCock())
	{
		output("\n\nThere’s a murmur of cultured amusement below you, and Ara Kei first tears a hole in the bindings where you are most incongruously bulging, allowing your [pc.cock] to dangle downwards. Hoarse gasps are forced past your [pc.lips] as [ara.he] play"+ ara.mfn("s", "s", "") +" with it for a time, stroking the underside with a single finger, circling the [pc.cockHead]");
		if (pc.balls > 0) output(", teasing your [pc.balls] with gentle squeezes");
		output(", allowing you to get so close to release you’re bulging up, before withdrawing agonisingly. You’re left on the edge as [ara.he] reach"+ ara.mfn("es", "es", "") +" up and undoes you from the ceiling, carefully drawing you down and peeling off [ara.his] silk, so that when you are finally left naked and kneeling before [ara.him], your [pc.cock] is as stiffly erect as your back. The face-splitting grin on the white face above you tells you how pleasing this sight is to [ara.him].");
	}
	else
	{
		output("\n\nAra Kei reaches up and undoes you from the ceiling, carefully drawing you downwards, laying you in front of [ara.him] before peeling the silk away from your [pc.skinFurScales]. [ara.His] movements are such that you are left");
		if (pc.hasKnees()) output(" on your knees with");
		output(" back straight, [pc.chest] out and hands behind your back.");
	}

	output("\n\n<i>“Did we enjoy our reward, little one?”</i> [ara.he] ask"+ ara.mfn("s", "s", "") +", raising a thin, immaculate eyebrow. The quadomme looks exactly the same as [ara.he] always "+ ara.mfn("has", "has", "have") +" - [ara.he] could have just finished delivering a seminar to you, rather than stuffing you utterly full of [ara.his] fertilized eggs and then keeping you bound for half a day, for all the difference it makes to [ara.his] snow-white facade. You have now experienced the depthless sexual despotism which underlies [ara.his] verbosity and apparent calm, however. A lake of tar that you could drown in for weeks, without ever touching its bottom.");

	output("\n\n<i>“Yes, Ara Kei. Thank you,”</i> you manage. You receive a rub");
	if (pc.hairLength > 0) output(" through your [pc.hair]");
	else output(" behind the ear");
	output(" in return.");

	output("\n\n<i>“I shouldn’t do this,”</i> the bothrioc ambassador says as [ara.he] lead"+ ara.mfn("s", "s", "") +" you back through on all fours into the embassy. The massive clutch [ara.he] "+ ara.mfn("has", "has", "have") +" implanted into you necessitates you splay your [pc.hips] in order to move, practically dragging your baby bulge with you. <i>“But you have been an awfully sweet and obedient [pc.boyGirl] throughout Steele, and through your actions told me much about the outside galaxy. So if you’re ever feeling the need really badly again...”</i> A finger touches you on the [pc.lips]. <i>“You know where to come.”</i>");

	//PC gets double number usual bothrioc pregnancy in ass, regular bothrioc pregnancy in pussy if that happened

	processTime((6 * 60) + rand(30));
	pc.changeLust(10);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function araKeiPolishBooties():void
{
	clearOutput();
	showAraKei();

	flags["ARAKEI_POLISHED_BOOTIES"] = 1;

	output("It occurs to you that you’ve wanted to do this for a long time now. That thought solidifies, becomes as intrinsically obvious as the need to breathe, when you reach forward, bend forward and lay your [pc.tongue] on Ara Kei’s latex-like chitin. When you drag it upwards, warmth suffuses you, submissive bliss radiating through your whole body. All of this sheer, black authority, the feet of a wise, beautiful, absolute master - it deserves to be polished. It NEEDS to be polished, so all may know the devotion this quadomme commands.");

	output("\n\nAll this spreads inexorably through your mind in the course of three long licks directing along the warm, inflexible smoothness of Ara Kei’s calf, so that within moments you are nothing but a vessel of euphoric submissiveness. A little whimper of pleasure escapes your [pc.lips] as you change position and lavish saliva on [ara.his] inner knee");
	if (pc.hasCock() || pc.hasVagina())
	{
		output("; ");
		if (pc.hasCock()) output(" [pc.eachCock]");
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina()) output(" [pc.eachVagina]");
		if (pc.hasCock() && pc.hasVagina()) output(" are");
		else output(" is");
		output(" very, very");
		if (pc.hasCock()) output(" erect");
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina()) output(" wet");
	}
	output(".");

	output("\n\n<i>“Yes little one,”</i> the bothrioc says, [ara.his] relaxed voice sending fuzzy sensation softly vibrating through you. <i>“Isn’t servility wonderful? This is what you have to look forward to every day when you do find a proper egg-giving master. Until then - I shall do them a favor and begin your training proper. Your technique needs work.”</i>");

	output("\n\nYou aren’t doing the very best you could? The soft bliss subsuming you immediately narrows down into a laser-guided focus. You pay solemn, microscopic attention as Ara Kei silently directs [ara.his] foot-maid to come back over and begin work on the leg directly next to yours.");

	output("\n\n<i>“See how she rolls her tongue, and goes with the grain,”</i> the quadomme instructs. Swiftly you follow suit, bending down to lap at Ara Kei’s narrow ankle, shivering at the way obeying [ara.his] order sends a fresh wave of pleasure crashing through your body. <i>“That prevents streaking. Kisses along the inner thigh are also very important...”</i>");


	output("\n\nYou are not allowed to stop until Ara Kei’s leg shines wetly with your saliva - and even then, you are made to go over several areas again by your strict instructor. You don’t mind. Being knelt in front of the bothrioc and being forced to improve by them is gratifying beyond anything you think you’ve ever felt. By the end you feel ablaze with arousal,");
	if (pc.hasCock()) output(" [pc.eachCock] hard against your [pc.belly]");
	if (pc.hasCock() && pc.hasVagina()) output(" and");
	if (pc.hasVagina()) output(" [pc.eachVagina] puffy and spread, fervently awaiting a hard breeding");
	output(".");

	output("\n\n<i>“Inexpertly but ardently done, Steele,”</i> says the quadomme. You practically purr when [ara.his] fingers");
	if (pc.hasHair()) output(" run through your [pc.hair]");
	else output(" rub you behind the [pc.ear]");
	output(" fondly. <i>“Seeing you progress along the path so willingly warms my hearts. Ah... if only all farlanders had the same honesty and humbleness as you.”</i>");

	output("\n\n<i>“Will you breed me now, "+ ara.mfn("master", "mistress", "master-mistress") +"?”</i> you ask. Perhaps there was a time when you wouldn’t have had asked such a question so directly. A colder, sadder time.");

	output("\n\n<i>“Hmm,”</i> replies Ara Kei thoughtfully. [ara.He] withdraw"+ ara.mfn("s", "s", "") +" [ara.his] hand to touch the pit of your throat with a single finger, drawing it slowly up your neck. You shiver with bliss. <i>“No. For two reasons. Firstly, you must learn that worshipping a domme is a reward in and of itself. You can perhaps feel that for yourself now, but still, connecting the absolutely essential tasks of an incubator to getting packed with eggs - no, I will not do your future owner that disservice. Secondly: I can sense that you aren’t quite all the way there yet. Once you are - when I can see the beauty all the way through you, when the thought of disobeying me doesn’t even occur to you, when you will move the stars in order to lick the very tip of my boot - then. I promise you that sincerely, little one.”</i>");

	output("\n\nThe incandescent words finally cease to echo around the cathedral of your head, and it takes you a few moments to realize that [ara.he] "+ ara.mfn("has", "has", "have") +" denied you again! But with the bliss of worshipping [ara.his] wonderful smooth, warm armor still fresh in your mind, it’s difficult to be incredibly upset about it. And that promise [ara.he] "+ ara.mfn("has", "has", "have") +" given you... leading you inexorably on...");

	processTime(15);
	pc.changeLust(15);
	araKeiMenu(araKeiFlirt);
}

public function araKeiNoPolishBooties():void
{
	clearOutput();
	showAraKei();

	flags["ARAKEI_REFUSED_BOOTIES"] = 1;

	output("You take big, sucking gulps of air. It takes a while, but at last the imperative urge to obey the dominant... to sink into the soft, sweet, fuzz of obedience... fades, and you can voice the words, as unpleasant and bitter as they are.");

	output("\n\n<i>“No. I don’t want to, Ara Kei.”</i>");

	output("\n\nThe maid knelt nearby utters a wordless sound of frightened incomprehension to this.");

	output("\n\n<i>“This far, and still you clutch on to an utterly outmoded concept of dignity!”</i> sighs Ara Kei in exasperation, stepping back from you. <i>“I can hear, I can taste how unhappy it makes you, this obstruction you’ve designed for yourself. Until you break that down we can go no further, [pc.name]. I cannot show someone true paradise if they aren’t willing to take their hands away from their eyes.”</i> "+ ara.mfn("he points", "she points", "they point") +" silently, and the maid immediately scoots over and, with a sigh of bliss, resumes licking.");

	processTime(2+rand(2));
	araKeiMenu(araKeiFlirt);
}

public function showCharles():void
{
	author("Nonesuch");
	showName("\nCHARLES");
	showBust("CHARLES");
}

public function approachCharles():void
{
	if(bothriocQuestComplete() && flags["MET_CHARLES"] == 1)
	{
		bothriocQuestApproachCharles();
		return;
	}
	
	clearOutput();
	showCharles();
	
	var addiction:Number = bothriocAddiction();
	
	if (flags["MET_CHARLES"] == undefined)
	{
		flags["MET_CHARLES"] = 1;
		output("<i>“Hey pal,”</i> says the human with a wry grin when you amble across to him. He’s a fairly young, buff-looking man who sounds like he comes from Ur Caledon. <i>“Hope Ara didn’t talk your ear off, ey?”</i>");

		if (addiction <= 10)
		{
			output("\n\n<i>“Guid. She’s a nice enough person y’know - head screwed on tighter ‘n the other bigwig earwigs you’ll run into doon here - but you shouldn’t listen TOO closely to what she’s sayin’, if you catch me drift. If you find yourself - lessay getting sudden urges tae kneel a lot - cum’n have a chat with me. I can fix that.”</i>");
		}
		else if (addiction <= 50)
		{
			output("\n\nYou don’t like his tone. You can’t place exactly why, but hearing the kind, generous bothrioc being talked of so cursorily irks you.");

			output("\n\n<i>“Ara Kei is nice! [ara.He] can talk to me all [ara.he] like"+ ara.mfn("s", "s", "") +" if [ara.he] want"+ ara.mfn("s", "s", "") +",”</i> you say hotly. Charles looks at you beadily.");
			
			output("\n\n<i>“Already gotten tae you, haven’t they?”</i> he says. <i>“Righty ho, well - not sayin’ Ara ain’t nice or anythin’ - but if you want those strange urges to stop before they get so strong you can’t say no to ‘em, cum’n have a chat with me. I can fix ‘em... but only if you’re willing to be fixed.”</i>");
		}
		else
		{
			output("\n\n<i>“Oh no!”</i> you say, [pc.eyes] widening at the very thought of being unhappy in the presence of the kind, generous, powerful bothrioc. <i>“[ara.he] can talk to me as much as [ara.he] want"+ ara.mfn("s", "s", "") +". [ara.He]"+ ara.mfn("s", "s", "‘re") +" wonderful, "+ ara.mfn("isn’t", "isn’t", "aren’t") +" [ara.he]?”</i>");
			
			output("\n\nCharles laughs.");
			
			output("\n\n<i>“Wow,”</i> he chortles. <i>“They’ve already got tae you guid, haven’t they? Should’ve talked to me sooner.”</i> He looks you up and down with a keen eye. <i>“Hmm. I think you’re too far along to be helped properly - and you sound like you’re havin’ great craic bein’ an egg bin anyway - but if you want to keep those urges of yours under control, cum’n have a chat with me. I can fix ‘em... at least a bit.”</i>");
		}
	}
	else
	{
		output("<i>“Hullo again, "+ pc.mf("Master", "Miss") +" Steele,”</i> says Charles with that wry grin of his when you go across to him. <i>“Needin’ a wee fix, by any chance?”</i>");
	}
	
	processTime(2 + rand(3));

	talkCharlesMenu();
}

public function talkCharlesMenu(lastF:Function = null):void
{
	clearMenu();
	gatedButton({ 
		id: 0,
		lbl: "Myrellion", 
		f: talkCharlesMyrellion,
		arg: undefined, 
		ttH: "Myrellion",
		ttB: "Ask him what he’s doing on this planet."
	});
	gatedButton({
		id: 1,
		lbl: "Ara Kei",
		f: talkCharlesAraKei,
		arg: undefined,
		ttH: "Ara Kei",
		ttB: "Ask him about the chief bothrioc."
	});

	if (flags["CHARLES_TALKED_FIX"] == undefined)
	{
		addButton(2, "Fix?", talkCharlesFix, undefined, "Fix?", "What’s all this about fixing?");
	}
	else if (flags["CHARLES_DISABLED_FIX"] == undefined)
	{
		if(pc.hasStatusEffect("Curdsonwhey")) addDisabledButton(2, "Fix", "Fix", "You are already under the effects of Curdsonwhey.");
		else addButton(2, "Fix", talkCharlesBuyFix, undefined, "Fix", "Buy some Curdsonwhey off the human.");
	}

	addButton(14, "Back", mainGameMenu);
}

public function talkCharlesMyrellion():void
{
	clearOutput();
	showCharles();

	output("<i>“Why did you come to Myrellion?”</i> you ask. <i>“And why did you decide to work in here?”</i>");
	
	output("\n\n<i>“Got a soft spot a mile wide, haven’t I,”</i> he replies with an affable shrug. <i>“These people are doomed, all uvvem, unless we can get them ant lasses to give up their nooks. The more offworlders there are doon here, workin’ with the locals, the less likely things are gonna kick off. Even the most fanatic gold ‘n red leaders know killin’ farlanders is probably a bad idea.”</i>");
	
	output("\n\n<i>“So why the bothrioc, particularly?”</i>");
	
	output("\n\n<i>“Every planet in the rush’s gotty race like this,”</i> the human says, gesturing at the room full of black-and-white arachnid people. <i>“Some poor bastards who aren’t quite advanced enough, or weren’t in the right spot when the flyin’ saucers landed, so don’t get to be the U.G.C.’s favored sons ‘n daughters. Usually they get the absolute shite exploited out of ‘em by the corporations, scooped up by the thousands to be taken to gene labs, private zoos and knockin’ shops whilst their homes get built over by whoever the winners were. I ain’t gonny let that happen to the bothrioc. They’ve got a chance, see: A leader with a plan, who can talk to the U.G.C. in their own bureaucratese.”</i>");
	
	output("\n\n<i>“That attitude don’t extend tae wantin’ eggs shoved up me, mind,”</i> he goes on, reverting to his more jovial tone. <i>“Compassion only goes so far.”</i>");

	processTime(5);
	talkCharlesMenu(talkCharlesMyrellion);
}

public function talkCharlesAraKei():void
{
	clearOutput();
	showCharles();

	output("<i>“Do you get on with Ara?”</i> you ask.");
	
	output("\n\n<i>“Wouldn’t be here if I didn’t,”</i> Charles says. <i>“As you’ve probably noticed for yerselves, she loves the sound of her own voice - as a result of 40 people hangin’ off every word that comes out of her mooth - but that ain’t so bad, cos she’s gotty lot of interestin’ things to say. Travelled a lot to get her hands on all the information she needs for this citizenship case. Doubt there’s a more knowledgeable native on Myrellion.”</i>");
	
	output("\n\n<i>“[ara.He]"+ ara.mfn("’s", "’s", "‘re") +" a she to you, then,”</i> you observe. The ginger human snickers.");
	
	output("\n\n<i>“Oh aye. Kinda unavoidable to think when all the other leaders and diplomats around here are lasses too, ain’t it? Actually though, I do it to annoy her. She likes bein’ special, and bein’ lumped in with all the others winds her up, I know it does. It’s tae get back at her for that tragic tone she always takes with me.”</i>");
	
	output("\n\n<i>“Tragic?”</i>");
	
	output("\n\n<i>“Yeah.”</i> Charles stops writing for a moment to compose his thoughts. <i>“It’s just the way they are. I don’t go in for their egg stuff, right? I prefer dealin’ with people as an equal. For the bothrioc though, bein’ equal is a bit like sufferin’. Like... bein’ in limbo, not knowin’ what you should be doing. So though I’ve made alluv that clear to Ara, she basically thinks I’m makin’ myself miserable for no reason. If only I went down into the caves and found meself a nice lass to shove her ovipositor up me jacksie... so yeah. Tragic.”</i>");

	if (bothriocAddiction() >= 50)
	{
		output("\n\n<i>“It is a bit tragic,”</i> you affirm, looking at him soulfully. He laughs again.");
		
		output("\n\n<i>“I got 40 colleagues telling me that every day mate, don’t worry about me not knowin’!”</i>");
	}

	processTime(5);
	talkCharlesMenu(talkCharlesAraKei);
}

public function talkCharlesFix():void
{
	clearOutput();
	showCharles();

	flags["CHARLES_TALKED_FIX"] = 1;

	output("<i>“So - you have some sort of cure to bothrioc hormones?”</i> you ask.");

	output("\n\n<i>“Ehh, nothin’ as cut and dried as that, I’m afraid,”</i> replies Charles, drawing his chair back to get at his bureau’s drawers. <i>“But the myr do make this stuff - “Curdsonwhey”, they call it - which fights off the mental effects. Tae stop their males walkin’ off in a dream with the first bothrioc they happen tae meet, y’know.”</i> He withdraws a medicinal bottle full of old-fashioned, oblong pills and stands it on the desk. <i>“Two things though, mate. This stuff ain’t cheap. It’s made from sum rare as hell cave fungus, but more tae the point the golds I get it from </i>really<i> don’t want me to have it. On account of me workin’ in here, ‘n probably helpin’ the head spider witch there to brew up a counter to it. So I am chargin’ a premium for it, I’m afraid.”</i>");

	output("\n\nHe shakes a few lozenges out onto the wood and picks one up, looking you in the eye.");
	
	output("\n\n<i>“Second thing. It stops workin’ well after a certain point. You keep goin’ down to the caves and enjoyin’ the glow, it’ll have a permanent effect on you regardless of how many o’ these you take. And eventually... you won’t be able to take ‘em anyway.”</i>");

	output("\n\nHe proffers it to you.");

	var addiction:Number = bothriocAddiction();
	if (addiction <= 10)
	{
		output(" You reach across and accept it, frowning slightly. What on earth is he talking about? Will you not be able to swallow, or something? It seems a ridiculous warning.");

		output("\n\n<i>“Just remember what I said,”</i> Charles insists with a wry twist of his lip, plucking the pill back out of your hand.");
	}
	else if (addiction <= 50)
	{
		output("\n\nYou feel a dragging reluctance to take it - the innate knowledge that what is in his hand is frosty bleakness to the calm warmth inside you. Still, you reach across and accept the pill.");

		output("\n\n<i>“Just a wee bit difficult, isn’t it? Remember what I said,”</i> Charles says with a wry twist of his lip, plucking it back out of your hand.");
	}
	else if (addiction <= 99)
	{
		output("\n\nSomething about the pill revolts you. It looks bad, you’re sure it will taste bad, and you’re absolutely certain it will make you deeply unhappy. You don’t understand why this nasty man is pressuring you to take it. Can’t he see how at peace you are with the world? Why would you want to change that? A slight sweat breaks out on your forehead, and you can’t help but look at the Caledonian with the deepest resentment, but you do force yourself to reach across and accept the pill.");

		output("\n\n<i>“Difficult, isn’t it? Remember what I said,”</i> Charles insists with a wry twist of his lip, plucking it back out of your hand.");
	}
	else
	{
		flags["CHARLES_DISABLED_FIX"] = 1;
		output("\n\nEverything about the pill revolts you. It’s unnatural, and speaks against your very being. You know innately that what is being offered in that hand of his is unhappiness, doubt and loneliness. You don’t hate the Caledonian for offering it, because he’s incapable of understanding (and you’re incapable of hate) - but equally, there is nothing in the galaxy that will make you touch that pill. You calmly refuse it.");

		output("\n\n<i>“Aye, I thought as much, lookin’ at you,”</i> Charles sighs, stowing it and the bottle away. <i>“You’re a bothrioc plaything for the long haul, mate. Hope you’re canny with that.”</i>");

		output("\n\nYou cheerfully assure him that you are.");
	}

	processTime(3 + rand(3));
	talkCharlesMenu(talkCharlesFix);
}

public function talkCharlesBuyFix():void
{
	clearOutput();
	showCharles();

	output("<i>“Got some?”</i> you query. By way of answer, Charles fetches the medicinal bottle out of his bureau drawer.");

	output("\n\n<i>“Got the cash?”</i> you asks in turn. <i>“And the willing?”</i>");

	processTime(1);
	
	clearMenu();
	if (pc.credits >= 15000) addButton(0, "Buy", charlesBuyFix);
	else addDisabledButton(0, "Buy", "Buy", "You don’t have enough credits.");
	addButton(1, "Don’t", mainGameMenu);
}

public function charlesBuyFix():void
{
	clearOutput();
	showCharles();

	var addiction:Number = bothriocAddiction();
	if (addiction <= 10)
	{
		output("You take the brown pill.");
		
		output("\n\n<i>“Stay frosty, Steele,”</i> Charles grins at you, returning to his work.");
	}
	else if (addiction <= 50)
	{
		output("You feel a strange reluctance to take the pill you’ve bought - but you push that aside and pluck it out of Charles’s outstretched hand.");

		output("\n\n<i>“Stay frosty, Steele,”</i> Charles grins at you, before returning to his work.");
	}
	else if (addiction <= 99)
	{
		output("It takes a huge amount of willpower to take the pill out of Charles’s outstretched hand - sweat breaks out on your brow, your soul seems to cry against it - but take it you do, despite how unhappy it makes you feel.");
		
		output("\n\n<i>“Doing the right thing, Steele,”</i> Charles says gently. <i>“Better tae have it under control, don’t you think?”</i> He returns to his work.");
	}
	else
	{
		flags["CHARLES_DISABLED_FIX"] = 1;

		output("You frown at the pill in Charles’s outstretched hand. Why are you doing this? Everything about that lozenge revolts you. It’s unnatural, and speaks against your very being. You know innately that what is being offered in that hand of his is unhappiness, doubt and lovelessness. You don’t hate the Caledonian for offering it, because he’s incapable of understanding (and you’re incapable of hate) - but equally, there is nothing in the galaxy that will make you touch that medicine. Calmly, you tell him you’ve changed your mind.");
		
		output("\n\n<i>“Aye,”</i> he says gravely, putting the bottle away, <i>“I suspect you’ve changed your mind for guid. You’re a bothrioc plaything for the long haul now, mate. Hope you’re canny with that.”</i>");
		
		output("\n\nYou cheerfully assure him that you are.");

		processTime(5);
		talkCharlesMenu();
		return;
	}

	processTime(3);
	// cost
	pc.credits -= 15000;
	output("\n\n");
	quickLoot(new Curdsonwhey());
}