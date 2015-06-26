public function bimbotoriumHallBonus():Boolean
{
	if(flags["DR_BADGER_TURNED_IN"] != undefined) 
	{
		output("There’s a run-down shack in a quiet corner with a sign reading <i>“Doctor Badger’s Free Clinic”</i>, though the shake has been all but mummified in flickering holographic police tape. A couple of uniformed Peacekeepers are standing outside, keeping the curious raskvel from entering the premises. <b>It looks like Doctor Badger’s offices have been shut down for good.</b>");
		rooms[currentLocation].northExit = "";
	}
	else output("The Novahome tunnel comes to an abrupt end here, closed off by a wall of solid metal and rusted-shut hatch doors. You can spot places where repairs have been attempted, but none of the entrances seem to be in a working state. There's still plenty of buildings around, and a clear path leads west, back the way you came. A few open-air stalls are even set up here, where you suppose the property values are low.\n\nThere’s a run-down shack in a quiet corner with a sign reading “Doctor Badger’s Free Clinic”, although on second glance the “Free Clinic” part has been hastily crossed out, and underneath someone has written “Lab”. That’s also been crossed out, and the odd term “Bimbotorium” written underneath that. That’s followed by a smiley face, and a crude drawing of a pair of breasts. Odd.");
	outsideDrLashBonusBonus();
	return false;
}

//Doc Badger’s Clinic
//[text to be added to hub location where Doc Badger’s Clinic is]
//There’s a run-down shack in a quiet corner with a sign reading “Doctor Badger’s Free Clinic”, although on second glance the “Free Clinic” part has been hastily crossed out, and underneath someone has written “Lab”. That’s also been crossed out, and the odd term “Bimbotorium” written underneath that. That’s followed by a smiley face, and a crude drawing of a pair of breasts. Odd.
//[Add button for “Doc Badger’s Shack” to options menu for location]

public function drBadgerMenu():void
{
	shopkeep = chars["DRBADGER"];
	//Unlock dumbfuck codex
	CodexManager.unlockEntry("Dumbfuck");
	clearMenu();
	addButton(0,"Buy",buyItem,undefined,"Buy something from Doctor Badger.");
	addButton(1,"Sell",sellItem,undefined,"Sell something from Doctor Badger.");
	if(flags["DR_BADGER_BIMBOED_PC"] == undefined && !pc.hasPerk("Ditz Speech")) addButton(5,"Be Hero",heyDocImAHero,undefined,"Be Hero","Volunteer that you're a hero. After your first encounter with the Doctor, you're fairly sure this is going to result in some heavy brain-drain.");
	else addDisabledButton(5,"Be Hero","Be Hero","Uhm, you don't really like, remember what this was all about.");
	addButton(14,"Leave",mainGameMenu);
}

//PC Enters Doc Badger’s Shack
public function drBadgerBonusShit():Boolean
{
	author("Abe E. Seedy");
	//Prep shop stuff!
	
	if(flags["MET_DR_BADGER"] == undefined)
	{
		flags["MET_DR_BADGER"] = 1;
		userInterface.showBust("DRBADGER");
		userInterface.showName("DR.\nBADGER");
		output("The door swings open easily as you push at it, stepping cautiously inside. It’s surprisingly dark in here, and you squint in an attempt to make out more than just a vague suggestion of the four walls around you.");
		output("\n\nSuddenly there’s an overwhelmingly bright flash of light, and you find yourself thrown back up against the inside of the door as it’s slammed shut behind you. A shrill beeping fills your ears as your equipment overloads dramatically, the tell-tale tingle of an EMP pulse ringing through your head. You have just enough time to register that this all means you’re completely defenseless when the feeling of claws digging lightly into your chest draws your attention to what exactly is happening in front of you.");
		output("\n\nThere’s someone there, holding you easily up against the door with one hand and leering as they do so. It doesn’t take much to figure out that this must be Doctor Badger; with black fur covering their plump, curvy body except for the white muzzle marking her as a mustelid. The tight-fitting white nurse’s shirt they’re wearing not only presents them as some sort of medical professional, but also highlights the bulging breasts that show her up as enthusiastically female. She notices you looking, and while one red-gloved hand keeps you pressed firmly against the wall, the other casually points your head downwards, where you soon see she’s not wearing any pants. This lets her frankly massive black cock and balls hang down freely from her crotch, her shaft decorated rather than concealed by the odd half-sleeve featuring a red and white cross wrapped around it. The only other clothes she’s wearing are a pair of red thigh high boots, which match nicely with the long sleeved gloves you can still feel pressing against your [pc.skinFurScales]. The whole effect of her outfit and demeanor does rather scream “mad doctor”, although “madly perverted” probably seems a little more accurate.");
		output("\n\nYou look back up slowly, finally noticing her long, purple-highlighted black hair now that your attention isn’t being distracted by her startling succession of outsized sexual characteristics, finishing by looking in her deep green eyes as she finally speaks.");
		output("\n\n<i>“So”</i>, she says, her voice somewhere between a growl and a purr, <i>“now that you’re </i>quite<i> done taking stock of me, I’ve got something I need to find out from you...”</i>");
		output("\n\nShe shifts, and suddenly she’s got one hand around your throat, squeezing just hard enough to let you know that she could squeeze a <i>lot</i> harder if she wanted to. <i>“See, I operate... a little outside the law, and I wouldn’t want to run the risk of someone running off and telling the authorities. You’re not one of those… hero types, are you?”</i> she asks, staring you down intensely.");
		//[Yes] [No]
		clearMenu();
		addButton(0,"Yes",yesImAHeroHurhurDurhurGurhurhurhurShit,undefined,"Yes","Tell the Doctor that you're a hero. This might be a bad idea.");
		addButton(1,"No",noImNotAHeroYouFuckingBimboDoctor,undefined,"No","You're pretty sure telling her no would be the best way to keep your cerebellum intact.");
		return true;
	}
	else
	{
		//Room desc
		output("The inside of the \"good\" doctor's shop is much the same as you remember it, complete with giant brain-lasers and devices whose purpose you don't even want to hazard. She's every bit the mad scientist you'd expect, which makes her the perfect person to sell you some of the less savory items the galaxy has to offer.\n\n");
		
	}
	addButton(0,"Dr.Badger",repeatBadgerApproach,undefined,"Dr. Badger","Check in with the curvy, bimbo badger.");
	return false;
}

public function repeatBadgerApproach():void
{
	clearOutput();
	userInterface.showBust("DRBADGER");
	userInterface.showName("DR.\nBADGER");
	author("Abe E. Seedy");
	//REPEAT GREETING NON-BIMBOIFIED
	if(flags["DR_BADGER_BIMBOED_PC"] == undefined && !pc.hasPerk("Ditz Speech"))
	{
		output("The Doctor looks up as you enter, currently busy pouring through another seemingly innocuous pile of mechanical trash. <i>“Well well, if it isn’t my only repeat customer!”</i> She pauses for a moment as she considers this. <i>“Wow, I have a really terrible business plan.”</i> For a moment, it looks like she might be genuinely concerned, but soon she shrugs and continues happily. <i>“Oh well. You gotta love what you do. So, here to do some more shopping? I’ve still got those little happy pills in stock. They can’t be beat if you want to live a little...”</i>");

		//[Buy Dumbfuck pills] [Leave]
	}
	//REPEAT GREETING NON-BIMBOIFIED BUT DITZ
	else if(flags["DR_BADGER_BIMBOED_PC"] == undefined && pc.hasPerk("Ditz Speech"))
	{
		output("The Doctor looks up as you enter, her expression changes into a faint smile at your presence. <i>“Well well, if it isn’t my special customer!”</i> She pauses for a moment as you let out a bubbly giggle and a pink fog of lust clouds your mind. <i>“It seems you've gone to the right place - then again, all bimbos tend to end up here, don't they?”</i> She licks her lips and continues. <i>“So, did you come here to do some shopping? I’ve still got those little happy pills in stock if you want them, but I'm not sure if they will do much for your, ehm, condition...”</i>");
		applyDamage(new TypeCollection( { tease: 5 } ), null, pc, "minimal");
	}
	//REPEAT GREETING BIMBOIFIED
	else
	{
		output("The Doctor looks up as you enter, her face sliding into a lecherous grin as she sees you. <i>“Well well”</i>, she says, <i>“if it isn’t my little bimbo pet. Back from slutting your way around the galaxy, are you? I hope you’ve been a good little bimbo and sucked some nice alien cock while you’ve been away, hmm</i>?”");
		output("\n\nYou can’t seem to do anything but squirm in response, even just being teased by the Doctor enough to make the pink fog rise up in your brain again and leave you feeling achingly horny.");
		output("\n\nIn the end however, she simply sighs heartily without standing. <i>“Unfortunately, my supplies are a little low right now”</i>, she says, indicating her ramshackle surroundings with a lazy sweep of her arm, <i>“so I’m afraid I can’t offer you anything more… intense… right now. I do still have some of those happy pills if you want them though. How does that sound</i>?”");
		applyDamage(new TypeCollection( { tease: 10 } ), null, pc, "minimal");
	}
	drBadgerMenu();
}

//YES
public function yesImAHeroHurhurDurhurGurhurhurhurShit():void
{
	clearOutput();
	userInterface.showBust("DRBADGER");
	userInterface.showName("DR.\nBADGER");
	author("Abe E. Seedy");
	output("<i>“Oh, really?”</i>, she answers, one eyebrow arching upwards with amused curiosity. She steps a little to the side, still keeping you pinned up against the door, but now letting you see the large, complicated-looking machine behind her. It’s some sort of… ray gun, by the looks of it, but industrial-sized; some massive squatting mess of tangled wires and haphazardly bolted together metal, and the only thing you can say for sure about it is that it’s very definitely pointing at you. Your eyes flick back to Dr Badger, and seeing your expression she starts grinning disturbingly. <i>“Heroes”</i>, she says, squeezing your throat again lightly for emphasis at the word, <i>“earn themselves a session with my patented bimbo-making machine over there</i>.”");
	output("\n\nBetween that ominous machine and the leering Dr Badger herself, you pretty quickly determine that saying the wrong thing here would have some fairly significant consequences. That said, something about her tells you that whatever she has in mind <i>would</i> probably be highly enjoyable, if you’re up for the sort of outsized genitalia and overblown libidos she seems to be all about, that is.");

	output("\n\n<i>“So...”</i> she concludes, licking her surprisingly plump lips, <i>“are you </i>sure<i> you’re a hero?”</i>");
	//[I’m a hero] [I’m just here to shop]
	clearMenu();
	addButton(0,"Hero",heyDocImAHero,undefined,"Hero","Yeah... this probably going to result in a fight or rapid bimbofication; that much seems clear.");
	addButton(1,"Shopper",heyDocImJustHereToShop,undefined,"Shopper","Telling her that you're just shopping around might be the best plan.");
}

//NO
public function noImNotAHeroYouFuckingBimboDoctor():void
{
	clearOutput();
	userInterface.showBust("DRBADGER");
	userInterface.showName("DR.\nBADGER");
	author("Abe E. Seedy");
	output("<i>“Oh”</i>. She looks down for a moment, seeming to almost deflate as she relaxes a little. When she looks back up at you, you realise she looks a little… disappointed, somehow? <i>“Well… are you sure</i>?”, she asks hopefully.");
	output("\n\nShe steps a little to the side, still keeping you pinned up against the door, but now letting you see the large, complicated-looking machine behind her. It’s some sort of… ray gun, by the looks of it, but industrial-sized; some massive squatting mess of tangled wires and haphazardly bolted together metal, and the only thing you can say for sure about it is that it’s very definitely pointing at you. Your eyes flick back to Dr Badger, and she perks back up on seeing your wide-eyed expression. <i>“Heroes”</i>, she says with a hungry grin, <i>“earn themselves a session with my patented bimbo-making machine over there</i>.”");
	output("\n\nBetween that ominous machine and the leering Dr Badger herself, you pretty quickly determine that saying the wrong thing here would have some fairly significant consequences. That said, something about her tells you that whatever she has in mind would probably be highly enjoyable, if you’re up for the sort of outsized genitalia and overblown libidos she seems to be all about, that is.");
	output("\n\n<i>“So...”</i>, she concludes, licking her surprisingly plump lips, <i>“what do you say? Are you </i>sure<i> you’re not a hero?”</i>");
	//[I’m a hero] [I’m just here to shop]
	clearMenu();
	addButton(0,"Hero",heyDocImAHero,undefined,"Hero","Yeah... this probably going to result in rapid bimbofication; that much seems clear.");
	addButton(1,"JustShop",heyDocImJustHereToShop,undefined,"JustShop","A civilized option for a civilized result.");
}

//I’M A HERO
public function heyDocImAHero():void
{
	clearOutput();
	userInterface.showBust("DRBADGER");
	userInterface.showName("DR.\nBADGER");
	author("Abe E. Seedy");
	output("Doctor Badger grins widely, pressing you a little harder against the door as she moves one hand down to retrieve a remote control from some hidden pocket. <i>“Well, </i>hero”, she teases, <i>“let’s see just how heroic you are once I’ve had some fun with you…”</i>");
	output("\n\nShe presses a prominent button on the remote, releasing you and stepping away to the side in one fluid motion. Before you can react you hear the machine in front of you whirr menacingly, and then a great white beam shoots out of it, bathing your head in a thick, hazy glow.");
	output("\n\nIt feels… nice. Warm. You tense yourself for something dramatic to happen, but after several seconds you eventually re-open your eyes, and hesitantly wave a hand in front of your face. Several more seconds pass, and absolutely nothing continues to happen. Maybe it doesn’t work? Or maybe your protective enhancements were too powerful for it? Laughing, you strike a confident, heroic pose, turning to face Dr Badger again now that you’ve defeated her nefarious plan, only to discover her bearing down on you while holding a large hypodermic needle filled with some brightly glowing substance.");
	output("\n\nYou don’t have time to do anything more than stare before she jabs you with the needle, pressing the plunger down and pumping whatever’s inside it into your body. She doesn’t even bother to restrain you after that; simply pulling the needle out with shrug and explaining <i>“I’ve never been much of an engineer unfortunately, but I do have a soft spot for sneaking up and surprising people…”</i>");
	output("\n\nYou feel a thick warmth flowing into you from the needle, a pink fog filling up your mind as you fall helplessly to your [pc.knees]. <i>“That’s just a little something to get you in the right… frame of mind”</i>, the Doctor says, shifting her stance a little as you sink down to be level with her waist. From there you get a good view of her thick cock, and after a sudden start you realise that you’ve started drooling. It just looks so… you can’t describe it, but you <i>need</i> it; you can’t help but be enraptured as you watch her casually unwrap the sleeve from around it.");
	output("\n\nYou make a move forwards, but she stops you with a firm hand on your head. <i>“Ah-ah-ah”</i>, she taunts, wagging a finger at you for emphasis, <i>“not so fast. First we have to get you nice and conditioned…”</i>");
	output("\n\nWith that she moves forward, and brings herself right against you. After your telling off earlier you keep still, allowing her to simply rub her soft cock against your [pc.face]. Her musk is overpowering; you feel her scent pouring through your nose, reaching up into your brain and absolutely dominating your thoughts. All you can think about is her cock - the way it feels against your [pc.skin], the way it looks as she slides it back and forth, but most importantly the rich, intoxicating scent of it that leaves you helplessly enthralled. You pant breathlessly, your eyes following every movement it makes as the Doctor looks down at you approvingly.");
	output("\n\n<i>“You like my cock, don’t you?”</i>, she asks softly.");
	output("\n\nYou can’t even bring yourself to respond. ‘Like’ isn’t a strong enough word, you <i>need</i> it, it’s like a drug you didn’t even know you were addicted to, and as much as you try to fight it it’s as though she’s just reached into your brain and flicked all the switches that leave you utterly fixated on it. In the end, you only respond with a nod because she moves herself up and down against you, and your head follows the movement into a nod unthinkingly.");
	output("\n\n<i>“That’s good”</i>, she coos, and then suddenly she steps backwards, abruptly taking her wonderful cock away from you. You gasp for breath, not sure if you’re relieved or upset to be able to think a little more clearly for a moment. <i>“But </i>heroes”, she continues, putting a mocking emphasis on that word, <i>“don’t get to have fun with Doctor Badger’s cock.”</i>");
	output("\n\nShe bends forward, putting her plump, perfect lips right next to your ear, whispering <i>“my cock is reserved for bimbos; slutty bimbo girls with big tits, a nice full ass and a wonderfully big cock of their own.”</i> She pulls back a little and winks, gesturing over her own voluptuous body. <i>“You might say I appreciate the look</i>.”");
	output("\n\nFor your part, you’re still unable to respond. You <i>want</i> to say something, but she’s still so close to you that you can <i>feel</i> the musk pouring off her, and the scent of it is wrapped so fiercely around your brain that all you can do is drool wantonly.");
	output("\n\nMercifully - or tragically, you’re still not sure which - she steps back again, turning away and walking over to the other side of the room. She flicks a switch there and a bright light comes on, revealing what seems to be a little metal stand about half the height of a person, like a speaker’s podium except instead of an open book or a microphone the top of it holds only a pair of leather straps. She moves up behind it and presses another button on her remote, at which point some concealed panel in the roof slides open. From there a long mechanical tendril stretches down slowly; only a few inches wide but long enough to reach all the way down to the floor and then some, and apparently dexterous enough to curl easily around the Doctor’s outstretched hand. The tip of it oozes with what looks to be the same brightly glowing substance you were injected with earlier, and she brings the tendril up to her mouth to give the liquid a light tasting lick, smacking her lips in appreciation.");
	output("\n\n<i>“Mhmmm”</i>, she coos happily, before turning her eyes back to you. <i>“Now then, </i>hero”, she continues, <i>“may I present to you the solution to your little problem. This wonderful machine of mine will make you into the perfect bimbo; give you all the… assets and desires that a cute little bimbo could need. And I’ll tell you what - I’ll let you go afterwards. You can still be a hero, even! But you’ll be a hero with great heaving tits, a thick throbbing cock, and, I’m afraid, rather more difficulty in thinking about anything other than sex. So you’ll still be a hero, but you might find things a little… </i>harder<i> than before…”</i> She leans heavily on that word, and you can’t help but notice that she’s started stroking her own cock absently just in describing it all, and it’s rapidly putting its own emphasis on the word. <i>“So”</i>, she finishes with a grin, <i>“what do you say</i>?”");
	output("\n\nYou try to resist. You really do. But you can’t. You can’t stop yourself from moving over towards her, utterly mesmerized by her offer and, more importantly, the sight of her hardening cock. You <i>need</i> it, you have ever since she first pushed it into your face, and no matter how hard you screw up your eyes and try to turn away you still find yourself moving slowly but inevitably over. Eventually you’re beside her, eyes downcast as you offer yourself helplessly to her.");
	output("\n\n<i>“Good girl”</i>, she purrs,");
	if(pc.mf("him","her") != "her") output(" your gender apparently already being disregarded to match the one she’s designating for you,");
	output(" her clawed hands landing delicately but firmly on your back to position you properly. She bends you forward, making you rest on your elbows");
	output(" before she tightens the straps and locks your arms into place. She disappears for a moment, then reappears in front of you with the mechanical tendril in one hand, holding it up in front of you. <i>“Open wide”</i>, she says with a leer, and when your mouth falls open reflexively she simply lets the thing go, and it shoots forward under its own power and presses itself between your lips.");
	output("\n\nYou tense up instinctively, but despite that it still pushes its way down your throat, your gag reflex somehow suppressed as the mechanical thing impales you fiercely. Soon you feel an extra motion to it, beyond its simple wiggling as it pushes downwards; a distinct series of bulges stretching your lips open slightly further as they make their way along the tendril. Dimly you feel it release inside you, the actual tip by now so far down your throat that you can’t possibly taste anything from it, only vaguely register the sensation of wave after wave of fluid pumping into you. At first you simply begin to feel full, but it isn’t long until other symptoms manifest themselves.");
	//IF PC BODYTYPE IS THIN/NOT PLUMP
	if(pc.thickness < 75) 
	{
		output("\n\nYou feel your body begin to swell dramatically, rounding out until you look like the Doctor herself, all the to better show off your sexually-charged figure to all onlookers. <b>Your body is now plump and curvy</b>.");
		pc.thickness = 75;
		//IF PC DOES NOT HAVE TWO LEGS
		if(pc.legCount != 2) 
		{
			output("\n\nThis change seems to come at the expense of your lower body, your rounding figure reconstituting your mass with startling speed. <b>You are now standing on two legs</b>.");
			pc.legCount = 2;
			pc.genitalSpot = 0;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			pc.legType = GLOBAL.TYPE_HUMAN;
		}
	}
	else
	{
		if(pc.legCount != 2) 
		{
			output("\n\nYour lower body is the first to change, your changing figure reconstituting your mass with startling speed. <b>You are now standing on two legs</b>.");
			pc.legCount = 2;
			pc.genitalSpot = 0;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			pc.legType = GLOBAL.TYPE_HUMAN;
		}
	}
	//IF PC HAS GOO-SKIN
	if(pc.skinType == GLOBAL.SKIN_TYPE_GOO) 
	{
		output("\n\nYou feel yourself solidify at the same time, your body turning to normal flesh. <b>You have lost your goo form</b>.");
		pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
	}
	//IF PC DOES NOT HAVE BREASTS
	if(pc.biggestTitSize() < 1)
	{
		output("\n\nYour chest strains alarmingly, and even from your current position you manage to look down and watch your body reshape; the fluid being pumped into you somehow congregating in very specific spots until with a shuddering gasp two breasts push themselves out of your [pc.skin]. You can’t help but keep moaning as they swell further and further, until eventually they are left dangling almost all the way to the floor, pulling your bent over body downwards even more just by the sheer weight of fluid that sloshes inside of them. Strainingly stiff nipples cap them off, making you look like you’re perpetually on the verge of actively leaking. <b>You now have very large breasts</b>!");
		pc.breastRows[0].breastRatingRaw = 8 + rand(4);
	}
	//IF PC HAS SMALLER THAN VERY LARGE BREASTS
	if(pc.biggestTitSize() < 8)
	{
		output("\n\nYour breasts seem to get the most attention, pushing out emphatically as the fluid somehow seems to concentrate itself in filling them as much as possible. You can’t help but moan as they grow to become achingly large, leaving them almost touching the floor as you’re bent double over this podium. They slosh noisily too, seeming to be filled with a vast reservoir of loose fluid that your strainingly stiff nipples struggle to contain without leaking eagerly. <b>You breasts are now very large</b>!");
		pc.breastRows[0].breastRatingRaw = 8 + rand(4);
	}
	//IF PC HAS MORE THAN ONE SET OF BREASTS
	if(pc.bRows() > 1)
	{
		output("\n\nWhile your main set of breasts twitch and slosh with the fluid that fills them, your extra breasts slide smoothly upwards, merging soundlessly into just your one emphatic rack.<b>You now have only one set of breasts</b>!");
		while(pc.bRows() > 1)
		{
			pc.removeBreastRow(1,1);
		}
	}
	//IF PC DOES NOT HAVE A COCK
	if(!pc.hasCock())
	{
		output("\n\nYou grimace as the feeling of fullness moves to concentrate on your crotch, the sensation so overpowering for a moment that your [pc.knees] almost buckle");
		if(pc.legCount == 1) output("s");
		output(" beneath it. You find yourself gasping for breath, hurriedly taking in air in short, desperate bursts as you grasp at the top of the podium feverishly, until finally the unstoppable pressure within you releases in one great orgasmic rush. You feel an intense surge, and somehow you become aware that your body is responding along with it, a great thick shaft pressing out of your crotch. You pant as you feel the fluid work its way through it, molding it and filling it out all at the same time, until finally you feel your new, massive cock hanging heavily from your body, twitching and pulsing with the fluid that fills it so desperately. God, it feels so <i>good</i>, but you <i>need</i> to cum, and despite how good it felt you still somehow haven’t. <b>You now have a very large cock</b>!");
		pc.createCock();
		pc.cocks[0].cLengthRaw = 11;
		pc.cocks[0].cockColor = "black";
	}
	//IF PC HAS A SMALLER THAN VERY LARGE COCK
	else if(pc.biggestCockLength() < 11)
	{
		output("\n\nYou grimace as the feeling of fullness moves to concentrate on your crotch, the sensation so overpowering for a moment that your [pc.knees] almost buckle");
		if(pc.legCount == 1) output("s");
		output(" beneath it. You can feel the fluid pumping into you, surge after surge flowing through your body and aiming directly for your cock, which soon shudders and responds to the massive increase in pressure. It presses out from you slowly, building outwards with every pulse and almost knocking your [pc.legOrLegs] out from under you at the sheer intensity of it, leaving you struggling to keep breathing as your cock fills absolutely with this new, surging fluid. You want to cum, you <i>need</i> to cum, but you can’t - all you can do is clutch desperately at the top of the podium while your shaft slowly grows to become large enough to almost match Dr Badger herself. <b>Your cock is now very large</b>!");
		pc.cocks[0].cLengthRaw = 11;
	}
	//IF PC HAS MORE THAN ONE NON-TAIL COCK
	if(pc.cockTotal() > 1)
	{
		output("\n\nYour extra cock");
		if(pc.cockTotal() > 2) output("s flow ");
		else output(" flows ");
		output("together like they were liquid themselves, feeding their mass into your main cock, ensuring you’re more focussed on receiving breeding than being able to breed others. <b>You now have only one very large cock on your groin</b>!");
		
		while(pc.cockTotal() > 1)
		{
			pc.removeCock(1,1);
		}
	}
	//IF PC DOES NOT HAVE BALLS
	if(pc.balls == 0)
	{
		output("\n\nThe flow of fluid shifts within you, moving to pool at the very base of your crotch. Here it simply builds unstoppably, dragging a groan from you as you feel your body swell in response, a growing set of balls descending slowly. The fluid focusses on these mercilessly; pumping them so achingly full that they feel like they’re overflowing - a constant, endless, churning torturing you as your seed demands to be spent, and even then you’re not sure how much release you would get from any one single orgasm. <b>You now have very large balls</b>!");
		pc.balls = 2;
		pc.ballSizeRaw = 4;
		if(pc.cumMultiplierRaw < 60) pc.cumMultiplierRaw = 60;
		if(pc.ballEfficiency < 120) pc.ballEfficiency = 120;
	}
	//IF PC HAS SMALLER THAN LARGE BALLS, OR HAS LESS THAN LARGE CUM PRODUCTION
	if(pc.maxCum() < 500 && pc.balls > 0)
	{
		if(pc.balls > 1) output("\n\nThe flow of fluid shifts within you, moving to pool heavily in your balls. Here it simply builds unstoppably, dragging a groan from you as you feel them swell in response. The fluid focusses on them mercilessly, pumping them so achingly full that they grow dramatically. They feel like they’re overflowing - a constant, endless churning torturing you as your seed demands to be spent, and even then you’re not sure how much release you would get from any one single orgasm. <b>Your balls are now very productive</b>!");
		else output("\n\nThe flow of fluid shifts within you, moving to pool heavily in your ball. Here it simply builds unstoppably, dragging a groan from you as you feel it swell in response. The fluid focusses on it mercilessly, pumping it so achingly full that it grows dramatically. It feels like it's overflowing - a constant, endless churning torturing you as your seed demands to be spent, and even then you’re not sure how much release you would get from any one single orgasm. <b>Your ball is extra productive</b>!");

		if(pc.ballSizeRaw < 4) pc.ballSizeRaw = 4;
		if(pc.cumMultiplierRaw < 60) pc.cumMultiplierRaw = 60;
		if(pc.ballEfficiency < 120) pc.ballEfficiency = 120;
	}
	//IF PC HAS MORE THAN ONE SET OF BALLS
	if(pc.balls > 2)
	{
		output("\n\nWith a sensation that makes your eyes roll back in your head you feel your extra sets of balls drain themselves into your main pair, sliding seamlessly into your flesh while your remaining balls slosh as they fill to overflowing with extra seed. <b>You now have only one set of balls</b>!");
		pc.balls = 2;
		pc.ballSizeRaw += pc.ballSizeRaw/2;
	}
	//IF PC DOES NOT HAVE A VAGINA
	if(!pc.hasVagina())
	{
		output("\n\nThere’s a sudden shift inside you, and suddenly you feel a distinct pleasure sinking into the very base of your crotch, below even your balls. The sensation is almost blissful; after all the straining fullness from the fluid earlier this response is enough to make your head sink happily down to one side, your tongue lolling out of your mouth in pleasure. With a shudder you feel a slit opening");
		if(pc.legCount > 1) output(" between your [pc.legs]");
		else output(" at your crotch");
		output(", and you can’t help but smile dopily as you feel it become wonderfully slick and deep; literally dripping with enough ready-made lubrication to leave you always available for use by almost any size of client. <b>You now have capacious vagina</b>!");
		pc.createVagina();
		pc.vaginas[0].wetnessRaw = 3;
		pc.vaginas[0].loosenessRaw = 2;
		pc.vaginas[0].bonusCapacity = 20;
		pc.vaginas[0].vaginaColor = "black";
	}
	//IF PC HAS A LESS THAN DEEP VAGINA, OR LESS THAN CONSTANTLY DRIPPING FEMCUM PRODUCTION
	else if(pc.hasVagina())
	{
		if(pc.vaginas[0].bonusCapacity < 20 || pc.vaginas[0].wetnessRaw < 3)
		{
			output("\n\nThere’s a sudden shift inside you, and suddenly you feel a distinct pleasure in your vagina. The sensation is almost blissful; after all the straining fullness from the fluid earlier this response is enough to make your head sink happily down to one side, your tongue lolling out of your mouth in pleasure. With a shudder you feel your slit changing, and you can’t help but smile dopily as you feel it become wonderfully slick and deep; literally dripping with enough ready-made lubrication to leave you always available for use by almost any size of client. <b>Your vagina is now capacious</b>!");
			pc.vaginas[0].bonusCapacity = 20;
			pc.vaginas[0].wetnessRaw = 3;
		}
	}
	//IF PC HAS MORE THAN ONE NON-TAIL VAGINA
	if(pc.totalVaginas() > 1)
	{
		output("\n\nYour fingers clench involuntarily as you undergo the indescribable sensation of your superfluous vagina");
		if(pc.totalVaginas() > 2) output("s sealing themselves");
		else output(" sealing itself");
		output(" closed; leaving you with only one slick slit, ensuring that any groups of potential partners would have to pass you around one after the other to breed you successfully. <b>You now have only one vagina on your groin</b>!");
		while(pc.totalVaginas() > 1)
		{
			pc.removeVagina(1,1);
		}
	}
	//IF PC HAS NO ASSHOLE
	//IF PC HAS A NON-LUBRICATING ASSHOLE
	if(pc.ass.wetnessRaw < 2)
	{
		output("\n\nThe fluid moves to massage your sizeable rear, and you can’t help but moan as it almost feels like your ass somehow orgasms. With a shudder of pleasure you realise that your asshole is now slick and dripping just like your vagina, ready and eager to be filled by all-comers. <b>Your asshole is now self-lubricating</b>!");
		pc.ass.wetnessRaw = 2;
	}
	//IF PC HAS A NON-COCK/VAGINA TAIL
	if(!pc.hasCockTail() && !pc.hasTailgina() && pc.tailCount > 0) 
	{
		output("\n\nYou feel your [pc.tails] quiver, trembling as the unstoppable flow of liquid pumps through ");
		if(pc.tailCount == 1) output("it ");
		else output("they ");
		output("in turn. ");
		if(pc.tailCount == 1) output("It shifts up on itself");
		else output("They shift up on themselves");
		output(", bunching up into a little black tuft, perfectly imitating the Doctor’s own tail. <b>Your tail is now a badger tail</b>!");
		pc.tailCount = 1;
		pc.tailType = GLOBAL.TYPE_BADGER;
		pc.clearTailFlags();
		pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
		pc.addTailFlag(GLOBAL.FLAG_FURRED);
	}
	//IF PC DOES NOT HAVE A TAIL
	if(pc.tailCount == 0)
	{
		output("\n\nThere’s a sudden stretching sensation in your backside, and then a short sharp shock as you feel a small fluffy tail burst through your flesh. It twitches for a few moments before settling down, a perfect imitation of the Doctor’s own tail. <b>You now have a badger tail</b>!");
		pc.tailCount = 1;
		pc.tailType = GLOBAL.TYPE_BADGER;
		pc.clearTailFlags();
		pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
		pc.addTailFlag(GLOBAL.FLAG_FURRED);
	}
	//IF PC DOES NOT HAVE FUR
	if(pc.skinType != GLOBAL.SKIN_TYPE_FUR)
	{
		output("\n\nA shiver runs through your entire body, and with a feeling like sinking into a warm bath you feel fur slide blissfully out over your [pc.skin], sweeping over your body in moments to leave you wrapped entirely in thick black fur. <b>You now have black fur</b>!");
		pc.skinType = GLOBAL.SKIN_TYPE_FUR;
		pc.clearSkinFlags();
		pc.addSkinFlag(GLOBAL.FLAG_FURRED);
		pc.furColor = "black";
	}
	//IF PC HAS NON-BLACK FUR
	if(pc.skinType == GLOBAL.SKIN_TYPE_FUR && pc.furColor != "black")
	{
		output("\n\nA shiver runs through your entire body, and with a feeling like sinking into a warm bath you feel your fur changing, a wave of color sweeping over your body in moments to leave you wrapped entirely in thick black fur. <b>You now have black fur</b>!");
		pc.furColor = "black";
	}
	if(pc.legType != GLOBAL.TYPE_SUCCUBUS && pc.isBiped())
	{
		output("\n\nYour feet tense abruptly, and you grit your teeth against a brief flash of pain as you feel your bones altering dramatically. The soles of your feet are shifted upwards, pushing you onto your tiptoes as the heels of your feet extend downwards in a thin spike. The changes finish in only a few moments, leaving you with feet that are somehow natural high heels; forcing you to totter about with your gait altered permanently. <b>Your feet are now permanent high heels</b>!");
		pc.legType = GLOBAL.TYPE_SUCCUBUS;
		pc.clearLegFlags();
		pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
		pc.addLegFlag(GLOBAL.FLAG_HEELS);
	}
	if(pc.armType != GLOBAL.TYPE_BADGER)
	{
		output("\n\nYour hands change too, albeit not so dramatically; finishing up almost normal looking - so long as your definition of “normal” includes black fur and small but significant claws. <b>Your hands are now clawed badger hands</b>!");
		pc.armType = GLOBAL.TYPE_BADGER;
	}
	output("\n\nFinally you begin to feel full, the liquid that has been mercilessly pumping into you seeming to surge back up your throat and fill the inside of your head. The haze you’ve been swimming in intensifies, a pink mist so thick that it’s almost physical overwhelming your thoughts. Your vision blurs, and you’re dimly aware of your face reshaping, but mostly all you can think about is your need. You <i>need</i> to fuck - no, that’s not right; you need to <i>be</i> fucked. That’s right, that’s what’s important; you need to be used and taken and god you’d forgotten that smell of cock but suddenly it’s in front of you again and it’s all you can think about. Thinking is hard, but somehow you <i>know</i> deep inside yourself that thinking isn’t important for you anymore, nowhere near as important as being fucked.");
	output("\n\nYou barely register the tendril pulling itself out of your mouth, the only thought that provokes in you is one of mild discomfort as you’re no longer being filled from at least one end. You drool helplessly, your dripping tongue hanging from your lips");
	if(pc.faceType != GLOBAL.TYPE_BADGER)
	{
		output(" as you only just manage to notice the feeling of your mouth shifting, changing into a black and white muzzle just like the smiling face of the Doctor before you. You can barely even manage to look up at her; you feel at once both so utterly drained and so completely in need of release. <b>Your head is now shaped into a badger muzzle</b>!");
		pc.faceType = GLOBAL.TYPE_BADGER;
		pc.clearFaceFlags();
		pc.addFaceFlag(GLOBAL.FLAG_MUZZLED);
	}
	else output(".");
	if(pc.femininity > 75) pc.femininity = 75;
	if(pc.lipMod < 1) pc.lipMod = 1;
	output("\n\n<i>“There girl”</i>, Dr Badger coos, <i>“doesn’t that feel better? Don’t you like being one of my perfect bimbos better than being a silly hero?”</i>");
	output("\n\nYou nod happily. You’d agree to anything she says, but especially in this case because when she calls you a bimbo your body responds instinctively; making thick strands of pre-cum leak from your straining cock while your slit moistens even further in excitement.");
	output("\n\n<i>“You should be flattered. I don’t normally make copies of myself - weakens the brand, you know - but I decided I liked the idea of a slutty badger bimbo running around the galaxy, fucking new and exciting people. I’ve left you with more intelligence than most too - for now at least - just because I want you to be able to <i>try</i> to keep up with the hero business, even as your juicy cock <i>aches</i> for release.");
	if(pc.hasCockTail() || pc.hasTailgina()) output(" I couldn’t help but leave your most interesting feature intact too. I must say I’ve never seen a tail like yours up close before, and a beauty like that would have been a shame to lose.");
	output(" If you ever get tired of pretending that you’re anything more than a slutty little bimbo pet, feel free to come on back and I’ll take care of the rest of your pesky mind. But for now…”</i>, you realise she’s moved behind you while she’s been talking, and suddenly you feel her claws sinking into the ample flesh of your rear before she continues, <i>“it’s time to claim first use.”</i>");
	output("\n\nShe thrusts deeply into your ass before you put together her intentions, and as your eyes shoot open you can’t think about anything other than her inside you. It feels so good, her thick, powerful cock filling you utterly, while your slick and willing asshole eagerly accepts her intrusion. Your eyes roll back in your head in bliss; you moan deliriously as she settles into a fierce rhythm, making your massive breasts swing pendulously beneath you. She doesn’t even pretend to be gentle; grabbing your head and pulling you backwards towards her, both for leverage and as a gesture of dominance, and your only reaction is one of pleasure. Of course she isn’t gentle with you, she shouldn’t be - it’s right for you to be fucked fiercely, to be held down and bred with wild abandon. Or tied up and forced to suck cock, or let loose to service others on command, or anything else demanded of you - you’re there to fuck and be fucked exactly how anyone else wants you to be. How could you be anything else? A desperate gasp makes it way out of your mouth as you feel any reservations drifting away, replaced with insatiable lust and an absolute need to serve. You shudder as you feel the cock filling you give one last dramatic thrust, and then the bliss of someone cumming inside you, and on the back of that wonderful feeling you finally, <i>finally</i> feel yourself properly orgasm; your cock spurting again and again onto the floor beneath you as your slit sends a great tide of slickness sliding down the inside of your thighs.");
	pc.buttChange(120,true,true,false);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	output("\n\nIt’s several minutes before your eyes uncross from the delirious bliss of your repeated climaxes. When you can finally see clearly you look up to find Dr Badger again looking down at you with a smile, idly re-applying the half-sleeve to her cock. While you do still find her scent powerfully alluring, it seems like now that you’ve been serviced the lustful haze that clouded your mind seems to have let up a little. It’s still a little hard to think, and you’re sure you’ve dropped some IQ points, but you <i>are</i> able to think of something other than sex, at least. Her cock catches your eye, and you swallow nervously as you mentally add “for now” to that last statement.");
	output("\n\n<i>“Now”</i>, Dr Badger says nonchalantly, as though nothing unusual had happened, <i>“with that… consultation out of the way, do you care to buy any of my take home products? I’ve got some lovely pills that will give you a nice little bimbo kick, although nowhere near as much as my personal attention.”");
	//Give PC “Dumbfuck” perk, set at unlock level 9 (Breed-Hungry: +5 fertility rating and balls fill to halfway much faster than normal)
	//Easy Perk
	if(!pc.hasPerk("Easy"))
	{
		output("\n\n(<b>Bimbo Perk Gained: Easy</b> - gain 20% more lust from combat sources.)");
		pc.createPerk("Easy",20,0,0,0,"Gain 20% more lust from combat sources.");
	}
	//Inhuman Desire
	if(!pc.hasPerk("Inhuman Desire"))
	{
		output("\n\n(<b>Bimbo Perk Gained: Inhuman Desire</b> - Your maximum lust is increased by 15.)");
		pc.createPerk("Inhuman Desire",15,0,0,0,"Increases maximum lust by 15.");
	}
	//Breed-Hungry perk
	if(!pc.hasPerk("Breed Hungry"))
	{
		output("\n\n(<b>Bimbo Perk Gained: Breed Hungry</b> - Your balls refill much faster than normal and your pregnancies are more likely and faster.)");
		pc.createPerk("Breed Hungry",15,0,0,0,"Increases speed that semen is created at and the pregnancy speed.");
	}
	//[Reduce PC intelligence by 30 to minimum of 20]
	if(pc.libido() < 30) pc.libido(10);
	if(pc.libido() < 50) pc.libido(10);
	if(pc.libido() < 70) pc.libido(10);
	pc.libido(10);
	pc.intelligence(Math.round(-.5 * pc.intelligence()))
	flags["DR_BADGER_BIMBOED_PC"] = 1;
	//[Add the following as one of the random Tease attack texts: “You shake what Dr. Badger gave you, running your hand happily over your bimbo body to accentuate your slutty appeal to your opponent.”]
	processTime(40+rand(15));
	pc.loadInAss(chars["DRBADGER"]);
	pc.loadInAss(chars["DRBADGER"]);
	output("\n\n(You could probably like, report this troublemaker to the a U.G.C. peacekeeper and get her arrested. Maybe you can find a sexy cop!)");
	//[Buy Dumbfuck pills] [Leave]
	drBadgerMenu();
}

//I’M JUST HERE TO SHOP
public function heyDocImJustHereToShop():void
{
	clearOutput();
	userInterface.showBust("DRBADGER");
	userInterface.showName("DR.\nBADGER");
	author("Abe E. Seedy");
	output("The Doctor glares at you intently for a few seconds, and then turns away with an exaggerated sigh. <i>“Fiiine</i>!” She releases you, walking back over to a cluttered workbench in the corner, more or less entirely uninterested in you now that you’ve turned out not to be the type of fun she was hoping for.");
	output("\n\n<i>“What can I interest you in then? I’m a little low on stock at the moment, but I’ve got a shipment of pills that will get your engine revving.”</i> She rolls her eyes for a moment, mumbling to herself, <i>“not as much as I could have in person, but </i>oh well.”");
	output("\n\n<i>“Anyway”</i>, she continues to you directly, <i>“what do you want</i>?”");
	output("\n\n(You could probably report this troublemaker to the a U.G.C. peacekeeper and get her arrested. Nothing about this seems legal.)");
	//[Buy Dumbfuck pills] [Leave]
	drBadgerMenu();
}


//[BREAK YOURSELF FREE]
//9999 - unused. Feels like a copout. Maybe thread the goo bit into with non-goos still getting screwed.
public function omgBreakFreeFromDat():void
{
    clearOutput();
    userInterface.showBust("DRBADGER");
    userInterface.showName("DR.\nBADGER");
    author("Abe E. Seedy");
    output("You don’t fancy going along with whatever plans this mad doctor has, but at the same time you’re not about to meekly beg her to let you go either. You’re [pc.name] Steele");
    if(pc.isNice()) output(" and you are not going to put up with any of that!");
    else if(pc.isMischievous()) output(", dammit! Who is she to try to tell you what you can do?");
    else output("! No one fucks with you and gets away with it!");
    // If the PC has a goo form
    if(pc.isGoo()) output("\n\nYou pause for a moment to roll your eyes dramatically, then you simply <i>relax</i>. In moments whatever grip Dr Badger had on you is lost, your entire body melting away into formlessness, and the sudden shift puts her so off-balance that she slumps awkwardly to the floor. You flow past her as an unstoppable mass, reforming in moments on the other side of the room. You grab a comfortingly solid piece of machinery as your limbs re-emerge, raising it over your head like a club.");
    // If PC does not have a goo form, and Intelligence is higher than both Physique or Reflexes
    else if((pc.intelligence() > pc.physique()) || (pc.intelligence() > pc.reflexes())) output("\n\nGiven that Dr Badger has you firmly by the throat you’re left at a distinct disadvantage, but as your eyes flick frantically across the room you manage to catch sight of a way to get out of this. You spot a support beam in the wall already straining under a heavy load, and realise that the ramshackle nature of the doctor’s hut looks like it could be used against her. You swing yourself out towards it, catching the doctor by surprise as you manage to land a heavy blow with one flailing limb. At first she’s simply confused, surprised by your seemingly random movements, but soon she catches sight of the smile on your face and the expectant look in your eyes. Following your gaze upwards, she manages to see just in time that a section of the roof is already beginning to slip, and she has barely half a second to throw herself backwards before several feet of metal collapses right where she was standing. She lands heavily, sprawled on her ass by the awkward dodge, and in the few seconds it takes her to recover you’re already readying your weapon and resetting your disabled equipment.");
    // If PC does not have a goo form, and Physique or Reflexes or both is higher than or equal to Intelligence
    else output("\n\nYou grit your teeth and push away from the door behind you, which fortunately manages to hold together despite the impressive force you put on it. Your sudden surge manages to catch Dr Badger off-guard, and the two of you tumble forwards onto the floor, her hand losing its grip around your throat as you fall. You manage to roll to your feet faster than she does, and before she can ready herself again you’ve managed to get a hold of some comfortingly solid piece of machinery, holding it up like a club and fully ready to defend yourself.");
    // Merged
    output("\n\nYou’re expecting a fight, but instead Dr Badger just laughs.");
    if(pc.isNice()) output(" You don't understand why she would mock you in such a way, but seeing the serious look on");
    else if(pc.isMischievous()) output(" Alright, if she wants to dance, you'll make her fucking dance... Though seeing the wry smirk on");
    else output(" The contempt of it almost makes you want to attack her more, but seeing the anger in");
    output(" your face she raises her hands in apology. <i>“No, no, don’t get me wrong. I’m just surprised. It’s been so long since anyone actually </i>challenged<i> me. The locals are fun to play with and all, but they have so little </i>fight<i> in them. It’s nice to meet someone I can have a little... back and forth with</i>.”");
    output("\n\nShe raises herself to her feet, her hands lowered and non-threatening, and in response you");
    if(pc.isNice()) output(" carefully");
    else output(" begrudgingly");
    output(" lower your weapon a little too, although you still keep your eyes on her warily.");
    output("\n\n<i>“If it’s all the same to you though”</i>, she continues, <i>“I would prefer if we don't get into an actual fight. I feel like we can respect each other, and I have so little equipment with me here, I’d hate for any of it to get broken.”</i>");
    output("\n\nSomehow that last part seems almost like a threat, as though, as far as she’s concerned, the worst outcome of a fight between the two of you would be a few broken items.");
    if(pc.isNice()) output(" With that said,");
    else if(pc.isMischievous()) output(" You’re inclined to disagree, but that said,");
    else output(" You would probably floor her on the spot, but");
    output(" she seems to consider any conflict you had resolved, and you’re not sure");
    if(pc.isNice()) output(" enough in your");
    else output(" of her");
    output(" abilities that you want to risk forcing the issue.");
    output("\n\nShe moves behind a pile of junk which you only now realize conceals a desk, pulling up a chair nonchalantly and sitting down. She fishes around in the pile of detritus, pulling out what look like a pair of elaborate sunglasses, except silver and completely opaque. She hits a button on the side and suddenly you notice an array of red dots flicking on around the room, seemingly signalling a web of cameras you can only assume feed into her new eyewear.");
    output("\n\n<i>“Now”</i>, she says, <i>“if you’d like to shop instead, I could certainly use some income to get things a little more off the ground here. I don’t have much now, but I’ve got big plans...”</i>");
    
    clearMenu();
    if(silly) addButton(0,"Next",drBadgerMenu,undefined,"Hmm...","Welp, that happened.");
    else addButton(0,"Next",drBadgerMenu);
}