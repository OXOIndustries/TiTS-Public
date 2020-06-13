//[DUN] Futa / Muscles / Angels, Bukkake, Cumflation, and of course big horsecocks.
//Lightfinger

//Futangels come down, informing you that you are dirty and need to be cleansed, they then proceed to lift their habits, revealing chiseled bodies and big, fat, equine members. Bukkake culminating in massive, oral cumflation.
//So futa muscle angel with a horsecock...

public function dreamChances(inShip:Boolean = false):Boolean
{
	if (disableExploreEvents()) return false;
	
	if (flags["ANNO_SLEEPWITH_DOMORNING"] == 1) return false;
	if (flags["BESS_SLEEPWITH_DOMORNING"] == 1) return false;
	if (flags["KASE_SLEEPWITH_DOMORNING"] == 1) return false;
	
	var dreamed:Boolean = false;
	var dreams:Array = new Array();
	if(flags["DREAM_CD"] == undefined) flags["DREAM_CD"] = 0;
	//Special Dreams
	if (pc.hasStatusEffect("Queen Pregnancy State"))
	{
		if (pc.statusEffectv1("Queen Pregnancy State") > 0 && flags["Queen Message Supression"] == undefined && (flags["Queen Dream Last Day"] < days || flags["Queen Dream Last Day"] == undefined))
		{
			eventQueue.push(queenDreamEvent);
			flags["Queen Message Supression"] = 1;
			flags["Queen Dream Last Day"] = days;
			dreamed = true;
		}
	}
	else if(pc.hasStatusEffect("Primorditatts Queued"))
	{
		if(!pc.hasPerk("Primorditatts"))
		{
			eventQueue.push(capraphormDreamSequence);
			eventQueue.push(capraphormPrimorditattsGain);
			dreamed = true;
		}
		pc.removeStatusEffect("Primorditatts Queued");
	}
	else if(inShip && flags["SLEEP_FAPNEA_ACTIVE"] != undefined)
	{
		if(pc.hasStatusEffect("Sleep Fapnea Dream"))
		{
			eventQueue.push(sleepFapneaDreamGo);
			dreamed = true;
		}
		else if(flags["SLEEP_FAPNEA_REPEAT"] != undefined && flags["SLEEP_FAPNEA_DREAMCATCHER"] != undefined)
		{
			eventQueue.push(flags["SLEEP_FAPNEA_DREAMCATCHER"]);
			dreamed = true;
		}
	}
	//Alexandra dreams :3
	else if(alexandraDreamsAvailable() && rand(2) == 0) 
	{
		eventQueue.push(playAlexandraDream);
		dreamed = true;
	}
	//April fools Berwyn. Once only
	else if(isAprilFools() && pc.hasCock() && kaseIsCrew() && inShip && flags["BERWYN_DREAMED"] == undefined) 
	{
		eventQueue.push(berwynSleepyBoiDram);
		dreamed = true;
	}
	//If you havent dreamed in 20 days, and didnt get a special dream
	var dreamCD:Number = 20;
	if(isHalloweenish()) dreamCD = 10;
	var bDream:Boolean = (days >= flags["DREAM_CD"] + dreamCD && rand(4) == 0);
	if(inShip && flags["SLEEP_FAPNEA_ACTIVE"] != undefined)
	{
		// Chaste mode
		if(flags["SLEEP_FAPNEA_ACTIVE"] == 0) bDream = false;
		// Dream mode
		else bDream = true;
	}
	
	if(!dreamed && bDream)
	{
		//Halloween Spoopers
		if(isHalloweenish())
		{
			//Dullahan Spoopy Times
			if(pc.hasCock()) dreams.push(dullahanSpoops);
			//Some weird asian cloning monstergirl fuck
			if(pc.hasGenitals()) dreams.push(linsMonster);
			//Werewolf and Vampire gaysex
			if(pc.hasCock() && pc.mf("m","") == "m" && !pc.analVirgin) dreams.push(gothPastelSpookDream);
			//pumpkin patch fuck
			if(pc.hasGenitals() && !pc.analVirgin) dreams.push(pumpkinPatchNightmare);
			//Gardeford's Goblinfuck
			if(pc.hasCock() && pc.biggestTitSize() >= 5) dreams.push(gardefordsCollegeGoblinSlutTrickOrTreatbang);
			//Frog's Handsiness
			dreams.push(handsDreamFromFrogapus);
			//Witch's kitten
			if(pc.hasCock() && pc.mf("m","") == "m") dreams.push(witchsKittenScene);
			//Demon Sera Ship Rape
			//Requires been intimate with Sera, have crewmembers, have crew Anno, crew Sera, and 4+ crew
			if(crew(true) >= 4 && annoIsCrew() && seraIsCrew()) dreams.push(demonSeraShipRape);
			//Oral cummies
			if(pc.hasStatusEffect("Orally-Filled")) dreams.push(foxxlingsOralCumDream);
			//Anal Cummies
			if(pc.hasStatusEffect("Anally-Filled")) dreams.push(analButtCumMonster);
			//Hello Nurse
			if(pc.hasGenitals()) dreams.push(halloweenNurseDream);
			//Anno werewolf
			if(pc.hasCock() && flags["CREWMEMBER_SLEEP_WITH"] == "ANNO") dreams.push(werewolfLady);
			//Goblin mad scientist!
			if(pc.hasCock()) dreams.push(goblinMadScientistDream);
			//Saurmorian Dream
			if(CodexManager.entryUnlocked("Saurmorians") && pc.hasGenitals() && !pc.isPregnant()) dreams.push(saurmorianCultDream);
			//Paige dream!
			if(paigeIsCrew()) dreams.push(hyperPaigeDream);
			//Dr. Hyena dream!
			if(pc.hasGenitals() && flags["SEXED_VERUSHA"] != undefined) dreams.push(spookyHyenaDream);
			//MistyBirbs witch futa stuff
			if(pc.hasVagina() && !pc.hasCock()) dreams.push(mistybirbsDream);
		}
		//Christmas Funzles!
		if(isChristmas())
		{
			if(pc.isAss() && pc.hasCock() && pc.mf("m","") == "m") dreams.push(carolJChristmasElfDreamyWeamy);
		}
		if(MailManager.isEntryViewed("lets_fap_unlock"))
		{
			dreams.push(angelDreamGo);
		}
		if(wearingSubTuner() && flags["MET_SAEC"] != undefined) dreams.push(subTunahDream);
		if(flags["FROSTWYRM_NOT_HOSTILE"] != undefined) dreams.push(frostwyrmWetDream);
		if(venusSubmission() >= 65)
		{
			if(pc.hasVagina()) dreams.push(everyLittleInchDream);
			if(pc.hasCock() && pc.canSelfSuck()) dreams.push(venusAutofellateDream);
			dreams.push(venusDreamyButtStart);
		}
		// On board ship-related dreams
		if(inShip)
		{
			if(annoIsCrew() && flags["CREWMEMBER_SLEEP_WITH"] == "ANNO" && pc.hasCock())
			{
				// Anno shotgun weddings
				if(flags["MET_SYRI"] != undefined) dreams.push(shotgunWeddingDream);
				// Ginormous Tiddies
				if(flags["KAEDE_MET_ON_UVETO"] == 1) dreams.push(annoAndKaedesGinormousTiddies);
			}
			// Reaha dreams
			if(reahaIsCrew() && pc.hasCock() && flags["CREWMEMBER_SLEEP_WITH"] == "REAHA") dreams.push(reahaDreamSequenceForNerdsByNerdsDesignedByNerdsToArouseNerdsForNerdpletion);
			//Repeat of April Fools Berwyn dream
			if(flags["BERWYN_DREAMED"] != undefined && pc.hasCock()) dreams.push(berwynSleepyBoiDram);
		}
		if(seraIsMistress()) dreams.push(demonDream);
		if(isHalloweenish()) dreams.push(superGhostioDream);
		if(pc.hasPerk("Primorditatts")) dreams.push(capraphormDreamSequence);
		//Kiro & Kally fun!
		if(kiroIsCrew() && kiroKallyThreesomes() > 1 && kiro.hasCock() && !kiro.isBimbo() && kiro.hasCock(GLOBAL.TYPE_EQUINE))
			dreams.push(kiroAndKallyBreedingDreamForCrewKiro);

	}
	if(dreams.length > 0) 
	{
		if(!dreamed)
		{
			var dreamFunc:Function = dreams[rand(dreams.length)];
			if(inShip && flags["SLEEP_FAPNEA_ACTIVE"] != undefined) flags["SLEEP_FAPNEA_DREAMCATCHER"] = dreamFunc;
			eventQueue.push(dreamFunc);
		}
		dreamed = true;
	}
	if(dreamed) flags["DREAM_CD"] = days;
	return dreamed;
}

// For temporarily setting genitals for dream scenes that require specific genitals!
public var dreamNewVagina:Boolean = false;
public var dreamNewCock:Boolean = false;
public function dreamCheckVagina():void
{
	if(!pc.hasVagina())
	{
		dreamNewVagina = true;
		pc.createVagina();
		pc.setNewVaginaValues(0);
	}
}
public function dreamResetVagina():void
{
	if(dreamNewVagina)
	{
		pc.removeVaginas();
		dreamNewVagina = false;
	}
}
public function dreamCheckCock():void
{
	if(!pc.hasCock())
	{
		dreamNewCock = true;
		pc.createCock();
		pc.setNewCockValues(0);
	}
}
public function dreamResetCock():void
{
	if(dreamNewCock)
	{
		pc.removeCocks();
		dreamNewCock = false;
	}
}

public function angelDreamGo():void
{
	clearOutput();
	showName("\nANGELS...");
	showBust("ANGEL");
	output("You awake to the light of a bright-burning sun in your eyes. The softness of the bed you once laid upon is replaced by fluffy yet somehow solid clouds. High above is a sky bluer than a robin’s egg and seemingly endlessly vast, stretching around below you as well as above. There’s no sign of land or even a planet to be found. Stumbling up on your [pc.footOrFeet], you look around in a panic, searching for something, anything familiar, but there is nothing to be found. Not a ship, not a holoconsole, not a single other person.");
	output("\n\nWell, except for those angels fluttering down from out of the sun’s glare.");
	output("\n\nWait... angels? Cupping your hand to shield yourself from the unearthly radiance, you piece together the details of their forms: tall statuesque bodies clad in heavy, gold-accented robes, eyes glowing like a cloudless morning, immaculate blonde hair, and yes... radiant halos of pure light. Wings more majestic than any siren’s casually flutter behind them, casting no breeze and yet somehow holding their charges aloft. Your mouth gapes open, and you make no move to close it. This is insane.");
	output("\n\n<i>“[pc.name]!”</i> Booms a voice like a brassy warhorn.");
	output("\n\nYou clap your hands to your ears in pain, doubling over from the intensity of her voice. Just hearing her talk is like standing next to a heavy freighter while it lifts off.");
	output("\n\n<i>“Sorry,”</i> the lead angel whispers, putting a gentle hand on your shoulder as she apologizes. <i>“It is easy to forget how fragile you mortals are. Do not be afraid of us. Be afraid of the corruption within you.”</i> She squeezes, so strongly that it’s almost harmful, casually pushing you to ");
	if(pc.hasKnees()) output("your [pc.knees]");
	else output("the ground");
	output(". <i>“You are tainted. The seething darkness within you could infect an entire realm if not purified, even cast down gods in time. We have seen it happen before, in another land, and we will not see it happen again.”</i>");
	output("\n\nAwestruck, you ask, <i>“Can you purify me?”</i>");
	output("\n\nThe angelic archon releases your shoulder and lifts your chin, smiling beatifically. <i>“Of course we can, child. Enough holy essence can wash away even the foulest taint, but it must applied thoroughly, without and within.”</i>");
	output("\n\n<i>“Essence?”</i> You look at her curiously. You’ve never heard such an expression before.");
	output("\n\nThe angel pats your head and laughs, <i>“Yes child... essence.”</i> Pulling her robe to the side, she reveals her angelic form. She is both curvy and muscular, chesty and strong. She’s the kind of girl who could bury your head between her breasts and pin you there until you suffocated... and she’s got a cock. A big, fat horse-cock, to be specific. It is completely at odds with the rest of her appearance. Where she has skin like polished marble, it has sweat and musk, its veiny surface pulsating in a decidedly un-angelic way.");
	//Bimb!
	if(pc.isBimbo()) output("\n\nOhh, why didn’t she just lead with that! It looks super delicious, and yummier than an ice-cream sundae... with cum on top! Licking your [pc.lips], you open wide and await your purification.");
	//Normal
	else output("\n\nYour head swims. This isn’t right, is it? But the smell... it’s like walnuts and ocean salt, only dizzyingly potent. Your whole body flushes just from the smell of it, so thick you can taste it on your tongue. Even stranger, you realize just how much you want to taste it on your tongue.");
	//Merge - new PG.
	output(" The rest of the divine choir tosses aside their robes, revealing a bevy of bestial behomoths, every single one of them just as big and fragrant as their leader’s, but they are far from identical. Some are jet black, others pink, and some mottled.");
	output("\n\nThey press in on all sides. You ");
	if(pc.isBimbo()) output("stretch out your hands, eager to play with such benevolent boners. The moment you make skin to skin contact, you shudder, reveling in the holy hotness pulsing against your fingers.");
	else output("hold out your hands, ostensibly to push them away, but the minute you feel the benevolent boners touching your palms, you squeeze them right back.");
	//[Next]
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",angelFutaBukkakePart2);
}
public function angelFutaBukkakePart2():void
{
	clearOutput();
	showName("\nANGELS...?")
	showBust("ANGEL");
	output("<i>“Corruption may also be burned out with heat,”</i> the lead angel proclaims, snapping her fingers. Her halo bursts into fire, and her cock surges, growing several inches longer in the span of a single heartbeat. Its rich, pheromonal scent doubles, and your [pc.skin] feels hot. The barest breeze is like feathers stroking your molten skin. Sweating profusely, you stare in wonder, licking your lips unthinkingly. You aren’t sure if its the corruption within you or the angel’s own unholy power that’s making you crave her cock so powerfully, but you don’t care much either way. It’s too hot to think. Too hot not to pant.");
	output("\n\nThe archon’s cockhead swells fatter and fatter, then spurts a trickle of brilliant white fluid. It slaps into your lips, splattering across your face, painting you in a layer of glowing goo. She strokes herself, willing more of her silvery pre-spunk to spurt forth, and then, midway through a squirt, she presses her flare to your [pc.lips], forcing you to kiss the pebbly flesh of its rim. True to its name, it flares wide, stretching your mouth open as it’s fed inside, making you gurgle perversely.");
	output("\n\nWith your attentions almost entirely focused on the holy creature’s unholy beast-cock, you’re surprised to discover that your arms are starting to get sore. Not from the position you’re in but from the way you’re furiously pumping the circle of dicks around you. They’re thrust at you so lewdly, their animalistic tips leaking more of that blessed liquid over your hands, wrists, and arms. You panic briefly, unable to decide on which ones you should focus on, darting from dick to dick to dick, never giving one more than a half-dozen affectionate strokes before journeying on to the next. There’s just too much dick!");
	output("\n\nWarmth surges in your throat, pouring down your esophagus, ");
	if(!pc.isBimbo()) output("smoothing away your gag reflex and your panic along with it");
	else output("making you so glad for your suppressed gag reflex as it smooths away your panic");
	output(". Your eyes drift closed, and that perfect, creator-blessed horse-prick burrows in along its lubricated path, briefly bulging your neck in a clear imprint of its distinctive shape. Strong hands with stronger fingers grab your arms, wrap your digits around the closest dick, and frantically pump you back and forth along the lucky equine phallus. The same is done to your other hand. Balls clap against your chin, forcing your nose to push up into her leather sheath.");
	output("\n\nYou swoon, drunk on the archon’s scent, feeling her cohorts clench in your hands and unload, dizzy and hot, so very hot. It feels like the divine spooge splatting into your [pc.skinFurScales] is sizzling from your heat. The balls on your chin pulse, and your tongue gives an answering swirl. Your arms are passed around to the next pair of angels, pressed into the unyielding, veiny flesh and forced to stroke once more. Flaring your nostrils, you suck in a desperate breath, drunk on the resplendent being’s bestial cock-stench, allowing yourself to be used... purified... whatever.");
	output("\n\nThey could bend you over and ram one up your asshole, and you wouldn’t complain. A wave of brilliant goo cascades over your [pc.hair]. Simultaneously, a geyser of purifying cum bathes your flank. Your hands are pried off the trembling lengths mid-orgasm, no matter how tightly your fingers clutch at them, and forced to serve new masters. These ones go off immediately, like they’ve been edging this whole time, getting off to watching you deep-throat their mistress, ready to explode the moment they brushed your pinkie.");
	output("\n\nThis time, the cum doesn’t stop. You are bathed in it, anointed in it, baptized in a swimming pool of angelic nut-butter. Better still, the dick in your mouth is bulging, its urethra straining, expanding, pumped full of a sticky snack for your corrupted middle. It goes off like a cannon, making your [pc.belly] burble and expand. It’s flooding you, pumping what must be gallons of angelic essence forcefully into your very soul. You can feel yourself expanding with it, not just physically but completely, becoming greater, holier, more fit to serve the galaxy and these gifted girls.");
	output("\n\nWhite-glowing juices blind you, but you don’t need to see with your eyes. You can see with your own blinding radiance, ignited by these divine creatures’ offerings. Every cummy splash is a declaration of your own divine purpose, a reminder that you exist to serve the universe’s whims. Your spirit drinks in the cum right alongside your belly, and just when you feel fit to burst, you cum.");
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",angelFutaBukkakePart3);
}

public function angelFutaBukkakePart3():void
{
	clearOutput();
	showName("\nWAKING...");
	showBust("");
	output("You wake up, shuddering in the throes of bliss. What a dream!");
	pc.orgasm();
	if((pc.hasCock() && pc.cumQ() >= 30) || (pc.hasVagina() && pc.isSquirter())) 
	{ 
		output(" If only it hadn’t left you so plastered in ");
		if(pc.hasCock() && pc.hasVagina()) output("[pc.cum] and [pc.girlCumNoun]");
		else if(pc.hasCock()) output("[pc.cum]");
		else output("[pc.girlCum]");
		output(". You’ll need a shower for sure.");
		if(pc.hasCock() && pc.cumQ() >= 30) pc.applyCumSoaked();
		if(pc.hasVagina() && pc.isSquirter()) pc.applyPussyDrenched();
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Anno Wedding Dream
//Summary
//A wet dream that occurs for dick-having PCs after talking with Syri and having Anno move onto the ship and share a bed. PC has a very strange dream about Syri and a few other Ausar hosting a shotgun wedding, forcing them to marry Anno and fuck in front of the whole assembly of wedding guests. PC will grow a knot in the dream if they don’t have one. I figure even if that’s clumsy, it’s better than excluding non-knotted PCs. Also, no cock size requirements or height restrictions. The magic of dreams, people!

public function shotgunWeddingDream():void
{
	dreamCheckCock();
	
	clearOutput();
	author("Night Trap");
	showName("SYRI\n& ANNO");
	showBust(syriBustDisplay(), annoBustDisplay());
	output("It feels like you only just fell asleep when you hear a familiar voice behind you. <i>“Did you think we wouldn’t find out [pc.name]? That we’d be tolerate this sort of behavior?”</i> Is Syri in your cabin right now? No, you remember: you’re on Ausaril, standing at the altar of a temple that has been decorated for a wedding. Your wedding!");
	output("\n\nYou adjust the bowtie on your tuxedo and turn around, only to be greeted by the sight of Syri wearing her own similar tuxedo and propping an antiquated shotgun on her shoulder. She is flanked on both sides by a nondescript but imposing ausar man, each with an identical outfit and firearm. The black-haired beauty is practically snarling at you, her pretty features twisted in a frightening mixture of anger and disgust. <i>“You’ve been gallivanting around with my sister, living in sin with her all this time. Well we’re finally going to force you to make an honest woman of her; it’s time for you two to tie the knot!”</i>");
	output("\n\nYou nod at her with a nervous smile, trying to placate her as she continues. <i>“This wedding is going to be mostly in the old Terran style, but there are going to be some key traditional Ausar elements to it. ");
	if(silly) output("I hope you don’t mind that the catering is garbage and old tennis balls. ");
	output("You’d better do this by the letter if you don’t want to make Anno a widow on her wedding day! Now get ready. The ceremony is about to start.”</i> With that she gives you a light shove and gestures for you take your position next to the priest.");
	output("\n\nAs soon as you regain your balance and fix your jacket, a massive pipe organ begins playing music. Down the aisle of the temple walks Anno in a beautiful white wedding dress and matching veil. It briefly crosses your mind that white is traditionally reserved for virgin brides, but you think better than to give voice to this thought. Anno is holding a ");
	if(silly) output("pork femur");
	else output("bouquet of white lilies");
	output(" in front of her as she slowly walks towards the altar. The music peaks as your snow-white bride-to-be takes her place across from you, and you notice the train of her dress is subtly moving back and forth. She must be wagging her tail under there.");
	output("\n\nYou shuffle nervously as the organ finally stops playing and a tall ausar priest begins his speech. You don’t really process the words he’s saying, his sermon moving by in a blur. Finally though, he gestures to you and asks <i>“Does the groom have the symbol of union?”</i> You panickedly pat your pockets for a moment before you feel a tap on your shoulder. You glance over to see Syri handing you a bundle of cloth with a growl. With no small amount of relief, you accept it and unwrap the cloth. Inside, you find a black leather collar, studded with diamonds, with an attached golden heart-shaped tag engraved with the words Anno Steele.");
	output("\n\nYou look around in confusion. Shouldn’t this be a ring? Before things can get too awkward though, your bride steps forward, the blush on her face actually visible through her veil before she lifts it. She gives you a subtle gesture indicating you are supposed to put it on her. You quickly fasten the collar around her slender neck, after which the priest continues speaking. <i>“I now pronounce you, Mr. and Mrs. [pc.name] Steele. You may now kiss the bride.”</i>");
	output("\n\nClosing her eyes, Anno leans toward you slightly with her lips pursed. You move in to deliver a chaste kiss to her, but as soon as your lips touch those of your blushing bride’s she puts a furry arm behind your head and pulls you in for much more than you bargained for. Her lips practically smash your own [pc.lips] as her tongue invades your mouth, overwhelming your [pc.tongue] in the process. Anno smothers you with a meltingly-hot french kiss that sends you swooning. You’re so surprised by this that all you can really do is stand there and take it. The raunchy tonguefuck goes on for what feels like ages, until just as you think you are about to go hypoxic, Anno finally breaks the kiss and releases you, a strand of saliva connecting your lips for a few moments before gravity breaks it.");
	//[Next]
	clearMenu();
	addButton(0,"Next",shotgunWeddingDream2);
}

public function shotgunWeddingDream2():void
{
	clearOutput();
	showName("SYRI\n& ANNO");
	showBust(syriBustDisplay(), annoBustDisplay());
	author("Night Trap");
	output("The assembled ausar clap and - howl? Even to your oxygen-starved mind that seems wrong. Before you can catch your breath or think about this strange turn however, the priest raises a furred hand, silencing the crowd as he solemnly intones <i>“You may now <i>lick</i> the bride.”</i> Utterly bewildered now, you simply stare at the priest until you hear a sound that makes your hairs stand on end: a shotgun racking a shell. Syri growls out to you <i>“I said by the numbers, Steele. If you wanted to fuck an ausar girl, you should’ve researched what a proper ausar marriage was first. Now get on your knees!”</i> Does she mean what you think she means? In answer to your question, Anno steps forward with a toothy smile and gently pushes down on your shoulders with one hand while raising the hem of her wedding dress with the other, revealing a snowy-furred leg with a lacy garter on it. Your face practically combusts as you flush scarlet. The thought of eating out your bride in front of all these people, including her family and friends, fills you with ");
	if(pc.exhibitionism() >= 66) output("unspeakable arousal.");
	else if(silly) output("Determination!");
	else output("profound shame.");
	output(" You dutifully sink to your knees and crawl under Anno’s dress, letting her drop the hem down again as you do.");
	output("\n\nYour first breath in your new cloth oubliette overwhelms you with the scent of lilies and aroused female. You notice that your knees are wet before you feel a warm, slimy droplet hit your face. Although it’s too dark to see, you realize immediately what’s happening: Anno is hornier than she has ever been; she’s almost trickling, and you’re practically being showered in her girlcum. After just a few moments though, Anno taps you urgently with her leg, an obvious signal to get started. You begin just above her knee, your [pc.tongue] following a stream of your bride’s liquid lust upwards to her blooming flower. Her flavor is utterly divine. It’s possibly the best thing you’ve ever tasted. You can sense with your oral organ that her lips are already slightly parted, and her clitoris is standing proud, begging for attention. Eager for more of her nectar, you trace the outline of her mound before working inwards and tracing her lips. You relish every droplet of sweet, sweet arousal you find before moving your [pc.lipsChaste] to the top of her pussy, sealing off her precious pearl with a sucking kiss. You hear a whine as her thighs suddenly clench around your head, covering your [pc.ears]. You place your hands on her thighs to steady yourself and relieve some of the crushing pressure in preparation for your next move. You release her clit from your kiss and move lower down again, working your tongue into her channel proper.");
	//PC has normal tongue:
	if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("\n\nYou move your head back and forth to grind Anno’s pleasure buzzer as you prod the sides of her love-tunnel with your [pc.tongue]. Your ministrations bear fruit almost immediately: Anno’s trickle turns into an actual stream of femlube, and you have to start immediately swallowing to avoid drowning. You alternate between swirling your tongue in rapid circles inside her and lapping at her pussy like" + pc.catDog("", ", appropriately,", false) + " a thirsty dog lapping at water: your tongue powerfully stroking her pearl at the apex of each lick, pulling back her hood.");
	//PC has long tongue:
	else output("\n\nYour inhuman tongue slithers into her love-tunnel like a self-lubricated cock. You just keep unfurling more and more oral muscle into Anno until you reach her cervix. After giving it a few loving little flicks, you sensuously withdraw your muscle until it’s completely outside of her. You proceed to tenderly wrap a few inches of tongue around her pearl, digging under her clitoral hood before rapidly withdrawing your tongue in the exact same pattern you unfurled it in to begin with, drawing her hood back in the process. You alternate between plundering her pussy and worshipping her button, hearing muffled screams of pleasure the whole time.");
	output("\n\nA few minutes of this has her going wild until with ");
	if(silly) output("an awooo!");
	else output("a howl");
	output(", she gushes out her orgasm, squirting a torrent of musky girlcum all over your face and upper half.");
	if(silly) output(" There goes the deposit on this tuxedo...");

	output("\n\nWhen the gushing, blushing bride finally releases your head from her thigh clench, you crawl out from under her dress, your head and torso a sopping mess of eau de horny dog-girl.");

	output("\n\nAs you shakily climb to your feet, the audience goes wild with applause, barks, and howls, and you see many a panting ausar in the crowd. This reaction definitely seems off to you, but once more interrupting your chance to think about it, the priest silences the crowd before speaking to you. He hands you a golden goblet full of a strangely-hued liquid that smells vaguely alcoholic, commanding you to drink. The instant you do, you immediately feel a rush of intense arousal, and a swelling sensation at the base of your [pc.cocks].");
	//give all of PC’s dicks that don’t have them knots; set the knotMultiplier to 1.5. Revert changes after the dream ends.
	var cockHolding:Creature = new Creature();
	var changed:Boolean = false;
	
	for(var x:int = 0; x < pc.totalCocks(); x++)
	{
		//Set up duplicate dix.
		cockHolding.createCock();
		cockHolding.cocks[x].cType = pc.cocks[x].cType;
		cockHolding.cocks[x].cLengthRaw = pc.cocks[x].cLengthRaw;
		cockHolding.cocks[x].cLengthMod = pc.cocks[x].cLengthMod;
		cockHolding.cocks[x].cThicknessRatioRaw = pc.cocks[x].cThicknessRatioRaw;
		cockHolding.cocks[x].cThicknessRatioMod = pc.cocks[x].cThicknessRatioMod;
		cockHolding.cocks[x].cockColor = pc.cocks[x].cockColor;
		cockHolding.cocks[x].knotMultiplier = pc.cocks[x].knotMultiplier;
		cockHolding.cocks[x].flaccidMultiplier = pc.cocks[x].flaccidMultiplier;
		cockHolding.cocks[x].virgin = pc.cocks[x].virgin; //to make it work in a similar fashion as copyVagina
		for(var y:int = 0; y < pc.cocks[x].cockFlags.length; y++)
		{
			cockHolding.cocks[x].cockFlags.push(pc.cocks[x].cockFlags[y]);
		}
		if(!pc.hasKnot(x)) 
		{
			//Now adjust dick
			pc.cocks[x].addFlag(GLOBAL.FLAG_KNOTTED);
			if(pc.cocks[x].knotMultiplier < 1.5) pc.cocks[x].knotMultiplier = 1.5;
			changed = true;
		}
	}

	output("\n\nWhile you’re still reeling, he gestures to you and the still panting and flushed Anno, solemnly intoning <i>“There is but one more step to completing your union, and for it, you must bare all your secrets for the dearly beloved to see today, and let the assembled witness you tying the knot.”</i> You shoot a quizzical look at the priest before you notice that Anno has turned her back to the crowd. She leans backwards and shouts ");
	if(silly) output("<i>“fetch!”</i> as she throws her pork bone into the crowd.");
	else output("<i>“catch!”</i> as she throws her bouquet into the nearest group of women.");
	output(" The dog-girl then starts taking off her dress!");

	//PC is exhibitionist:
	if(pc.exhibitionism() >= 66)
	{
		output("\n\nOh, that’s what the priest meant! With the thought of all these people here watching you, you eagerly strip down, baring your now-painfully hard [pc.cocks]. ");
		if(changed) 
		{
			output("You notice with some surprise that ");
			if(pc.cockTotal() > 1) output("all of your cocks are now knotted! ");
			else output("your cock has grown a knot! ");
			output("You take a few seconds to examine your new attribute, giving yourself a testing squeeze. You shudder with pleasure and openly moan. It must have been that drink that did this. Oh well, everything seems to be in order and a whole lot more fun.");
		}
		else
		{
			output("You notice that your [pc.knot] has already begun to swell, and is so sensitive that casually brushing it as you undressed nearly made you cum on the spot. Must’ve been something in the drink you suppose.");
		}
		output(" By the time you’re done, Anno is already nude. She gives you a smoking hot “fuck me” look before turning around and getting down on all fours, tail high and wagging a million miles an hour. Your groin has been practically screaming for release ever since that kiss, and the drink the priest gave you has had your [pc.cockNounComplex] aching ever since. It’s a miracle you didn’t rip the crotch of your pants already.");
	}
	//PC is not exhibitionist:
	else
	{
		output("\n\nDo they seriously expect you to have sex in front of the whole audience? It was embarrassing enough to have to go down on Anno while everyone was watching, but at least you were hidden from them there! Even as you think this, the drink the priest gave you makes itself known, a massive bulge forming on the crotch of your pants as your [pc.cockNounComplex] betrays you. When you reach to cover it up with your hands though, Syri and the other ausar with her point their shotguns at you. <i>“Didn’t I tell you that you were going to have to ‘tie the knot’ with my sister? If you’ve been screwing her silly behind closed doors, you shouldn’t have a problem doing the same right here. Now strip down, and get to it dammit!”</i>");
		output("\n\nIf it weren’t for the concoction the priest gave you, your [pc.cocks] would be totally flaccid. As it stands, your traitorous package is drawing you like a magnet to your canine mate. You ashamedly start undressing as your approach Anno. ");
		//PC had at least one dick that wasn’t knotted:
		if(changed) 
		{
			output("You notice with shock that ");
			if(pc.cockTotal() > 1) output("all of your cocks are now knotted!");
			else output("your cock has grown a knot!");
			output(" You furtively examine your new attribute, giving yourself a testing squeeze. You are forced to suppress a moan as you shudder with pleasure. It must have been that drink that did this. Damn that priest!");
		}
		else output("You notice that your [pc.knot] has already begun to swell, and is so sensitive that casually brushing it as you undressed nearly made you cum on the spot. It must have been the drink; there’s no way you’d be so horny otherwise!");
		output(" By the time you’re done, Anno has already gotten on all fours, tail high and wagging a million miles an hour. She looks over her shoulder at you, face flushed scarlet and mouth open in a pant as she lets out a begging whine.");
	}
	output("\n\nYou drop down to your knees behind Anno, sinking into an ever-expanding lake of ausar fem-lube as you align your [pc.cockBiggest] with her now fully-bloomed pussy. There’s an intricate web of fem-slime hanging between her thighs that you have to push through to claim your prize. With the drink the priest gave you flowing through your system, you practically pounce on Anno, the snowy Ausar yelping as you grab her big hips. Purely on instinct, you guide your [pc.cockNounComplex] to her womanhood, parting the veil of slime with your [pc.cockHead]. With a violent thrust of your [pc.hips] and a yelp from Anno, you ram your [pc.cock] into your lover- no, your bitch. That’s all you can think of her as right now. You are feeling more bestial and feral than you have in your entire life, and right now you want to mount your bitch. Now that you’re operating at this level, you realize that all the pussy-eating you did was just prep work for the hard, animalistic fuck you’re about to dish out; now you don’t have to worry about going slow with your new wife- <b>no, your bitch</b>.");
	output("\n\nWith that single thought consuming your mind, you pull back your [pc.hips] and slam into Anno again, eliciting a pitiful whine from your white-furred canine mate before your [pc.knot] kisses her lower lips with a sloppy, wet squish. She lets out a happy little sound when you grind your bulb against her clit, the sensation overwhelming the both of you. The canid girl’s quim is a constantly spasming, soaking wet channel of pleasure. Her walls slimily wring your manhood from every direction, trying their damndest to suck the cum right out of you. Your [pc.cockSimple] feels like it would melt in the boiling cauldron that is Anno’s slit if you weren’t pistoning it in and out as fast as you could. You pound into her squishy butt so fast that it almost produces one continual sound rather than individual slaps.");
	output("\n\nYour bitch cums almost immediately. How could she not? She howls as a huge gush of fem-cum squirts out around your [pc.cockNounComplex], and your frenetic penetration sends it splattering everywhere, much of it landing on the priest and Syri. In the brief but frequent instances where you pause to grind your [pc.knot] against Anno’s engorged button, she cums again with a wailing howl, sending more girl-jizz flying. Each time she howls, more of the audience joins in with her, until the whole temple sounds like someone just let a cat loose in a kennel.");
	output("\n\nThe one time when you take your eyes off Anno to look over, you see that Syri has become the center of a one-woman foursome. She has one of the shotgun-toting ausar who was with her on all fours in front of her as she wildly fucks his ass. At the same time she is fellating the other gunman, and being fucked by the priest, who is guiding her thrusts with his own. Eventually though, the only thing in your mind is the overwhelming desire to fuck your [pc.knot] as deep into your bitch as your can, to mate her as publicly and as hard as possible in order to let everyone else know that she’s yours and yours alone. By this point Anno is nearly unconscious. She is locked in a continuous orgasm, forcing you to hold onto her hips as tight as possible to keep them from jerking fitfully while you breed her. This proves impossible once your bitch-breaker swells to the point that you graze her pleasure buzzer from every angle you attempt, so you simply give up and let her flared hips go.\n\nYou lean down over her, placing your [pc.chest] on her shoulders, [pc.hands] over hers, and your face next to hers in a passionate kiss. In this position you simply let Anno’s hips do what they want, which turns out to be fucking your [pc.knot] into her overwhelmed pussy. After a few battering thrusts, her spasming folds finally relax enough to accept your breeding bulb, and you feel your [pc.cockHead] pressing against her dilated cervix, reveling in the sensation as every inch of your shaft is squeezed and basted in Anno’s juices. You break the kiss to let out a howl yourself as your [pc.balls] go");
	if(pc.balls == 1) output("es");
	output(" into overdrive, dumping their scalding hot payload into your bitch’s defenseless baby-maker.");
	if(pc.cockTotal() > 1) 
	{
		output(" Your other shaft");
		if(pc.cockTotal() == 1) output(" glazes");
		else output("s glaze");
		output(" Anno’s breasts and belly [pc.cumColor], marking her even more completely with your seed.");
	}
	output(" As you pump rope after rope of [pc.cum] into Anno’s womb, the howling in the temple, both yours and everyone else’s, somehow synchronizes and harmonizes. The pitch grows and grows, until suddenly, you hear your name being called.");
	//PC Cums and is covered in cum
	pc.orgasm();
	if(!dreamNewCock) pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",shotgunWeddingDream3,cockHolding);
}

public function shotgunWeddingDream3(cockHolding:Creature):void
{
	clearOutput();
	
	var changed:Boolean = false;
	for(var x:int = 0; x < pc.totalCocks(); x++)
	{
		//Set up duplicate dix.
		pc.cocks[x].cType = cockHolding.cocks[x].cType;
		pc.cocks[x].cLengthRaw = cockHolding.cocks[x].cLengthRaw;
		pc.cocks[x].cLengthMod = cockHolding.cocks[x].cLengthMod;
		pc.cocks[x].cThicknessRatioRaw = cockHolding.cocks[x].cThicknessRatioRaw;
		pc.cocks[x].cThicknessRatioMod = cockHolding.cocks[x].cThicknessRatioMod;
		pc.cocks[x].cockColor = cockHolding.cocks[x].cockColor;
		pc.cocks[x].knotMultiplier = cockHolding.cocks[x].knotMultiplier;
		pc.cocks[x].flaccidMultiplier = cockHolding.cocks[x].flaccidMultiplier;
		pc.cocks[x].virgin = cockHolding.cocks[x].virgin; //to make it work in a similar fashion as copyVagina
		// Clear previous flags
		pc.cocks[x].cockFlags = [];
		// Renew to original flags
		for(var y:int = 0; y < cockHolding.cocks[x].cockFlags.length; y++)
		{
			pc.cocks[x].cockFlags.push(cockHolding.cocks[x].cockFlags[y]);
		}
	}
	
	if(flags["CREWMEMBER_SLEEP_WITH"] != "ANNO")
	{
		showBust("");
		showName("\nWAKING...");
		
		output("You wake with a start to the loud sound of your codex’s alarm beeps, paired with the humming of your ship against the ambient silence. After a moment, you take a look at your surroundings. You are in your bed");
		if(!dreamNewCock) output(", covered in [pc.cumVisc] [pc.cumNoun]");
		output(".");
		output("\n\nOh, it was just a dream...");
		output("\n\nDisappointed, you");
		if(!dreamNewCock) output(" rub away the mess of [pc.cum] from your [pc.cockHead] and");
		output(" wipe the sleep from your eyes.");
		if(flags["CREWMEMBER_SLEEP_WITH"] == undefined) output(" Now if only Anno " + (flags["ANNOxSYRI_WINCEST"] != undefined ? "and Syri were" : "was") + " here to wake up with you...");
		
		dreamResetCock();
		
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		
		return;
	}

	showAnno();
	author("Night Trap");
	
	output("<i>“[pc.name]. [pc.name]! Damn boss, what kind of dream are you having?!?”</i> You wake with a start to Anno shaking you. After a moment her words sink in, and you look at your surroundings. You are in your bed");
	if(!dreamNewCock) output(", covered in [pc.cumVisc] [pc.cumNoun],");
	output(" with Anno lying next to you");
	if(!dreamNewCock) output(", her tail, lower back, and enchanting butt plastered in your [pc.cumVisc] [pc.cumNoun] as well");
	output(". Your bitch - no, your lover - breaks her frown and laughs softly.");
	if(!dreamNewCock) output(" <i>“You got yourself, the bed, and me covered in your [pc.cum]. As much as I may love the stuff, I also love being warned when this sort of thing is going to happen.”</i>");
	output("\n\nYou wipe the sleep from your eyes before apologizing to Anno. You roll out of bed and start stripping the sheets with her help.");
	output("\n\n<i>“So who was it boss? Who or what did you");
	if(!dreamNewCock) output(" bust your nut all over");
	else output(" get all exicted about");
	output(" in your dream?”</i> ");
	if(pc.isNice()) output("Sheepishly");
	else if(pc.isMischievous()) output("Impishly");
	else output("Bluntly");
	output(" you admit that it was her. Your lover blushes slightly, giggling as she gives you a dismissive gesture. <i>“Oh, you’re having me on. That’s way too corny. And besides, I’m sure you say that to all the girls");
	if(!dreamNewCock) output(" you surprise with sleep-bukkake");
	output(".”</i>");
	output("\n\nYou explain the dream to her quickly, Anno laughing at just about every detail you mention. <i>“Well traditional Ausar weddings aren’t quite like you described, but I kind of want to try that skirt thing you mentioned. Probably not in front of my parents though. And sis would be pissed at you for even suggesting that she would provide a collar for me. She thinks I’m ‘perpetuating stereotypes,’”</i> Anno says in a mocking imitation of Syri’s voice, <i>“every time I go for walkies or talk about petplay.”</i>");
	output("\n\nYou concede that perhaps it would be best not to tell Syri about this dream, especially considering how slutty she was acting in it. <i>“Well, I’m sure glad we’re not actually married. I’ve got a date with Kaede later tonight where I plan on ‘tying the knot’ with her. Having just one lover would be so limiting, plus if you’re going to be polyamorous anyway, why bother having some huge wedding ceremony? That collar did sound really cute though. I wouldn’t mind finding something like it around my neck one day,”</i> she says with a wink. <i>“Maybe we could arrange some sort of wedding roleplay with");
	//if Pupcest unlocked:
	if (flags["ANNOxSYRI_WINCEST"] != undefined) output(" Syri and");
	output(" Kaede sometime. Shopping for bridesmaids dresses with ");
	if (flags["ANNOxSYRI_WINCEST"] == undefined) output("her");
	else output("those two");
	output(" would be so much fun. Plus I’d be lying if I said I wouldn’t love to see how messy that could get.”</i>");

	output("\n\nYou tell her that sounds fun, but you’re a little tired of weddings for now. She giggles again at your reaction as she takes the last of the sheets off the bed and throws them into the laundry. <i>“I’m going to get all this");
	if(!dreamNewCock) output(" [pc.cum]");
	else output(" love musk");
	output(" off me now boss. I’ll see you later. Don’t wait up for me!”</i> She blows you a kiss as she steps into the bathroom, the door closing behind her. You stretch the last kinks out of your muscles, and start getting ready for your day. What a dream!");
	
	dreamResetCock();
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Requirements: Reaha is bed partner, has dick
public function reahaDreamSequenceForNerdsByNerdsDesignedByNerdsToArouseNerdsForNerdpletion():void
{
	dreamCheckCock();
	
	clearOutput();
	showBust(reahaBustDisplay(true));
	author("Shadefalcon");
	showName("THE\nBARN");
	//Nerds
	output("It’s a long walk to the barn, but early as it is the sun has barely peeked over the horizon before you reach the red building where you keep your cowgirls. As you open its large doors, you’re greeted with welcoming moos from the cows sitting on the hay beds within their stalls. They must be brimful with milk, if those needy eyes are any indication. Not a [pc.manWoman] to keep your job or beloved farm animals waiting, you set to work, taking out one buxom cow at a time for milking. It’s a routine you’re so familiar with, yet one you never seem to grow tired of. One by one you escort a girl out, leading her by a leash or a gentle tug on her arm, whatever she prefers, and place her in front of a bucket while you sit on a small three legged wooden stool. Looking her in the eyes reassuringly, you knead her swollen tits with your warm [pc.hands] until milk starts leaking out by itself. Then you twist and pinch at her nipples, squeezing out her delicious cream, filling the metal container to the brim.");
	output("\n\nIt’s kind of hard to explain, but there are few things in this world that bring you as much joy as emptying a busty cow. The feeling of your hands sinking into and massaging their soft orbs, the satisfied moans and moos as you relieve them of their pent up milk, the streams of pure white flowing like rivers; yeah, nothing really beats milking a cow.");
	output("\n\nAfter filling a couple of cans, you’re about to empty them in the milk tank when you suddenly slip on something. The buckets swirl gracefully in the air, spreading their contained white liquid over the ground, with quite a bit soaking you, too. Feeling uncomfortable and sticky all over, you get out of your blue overalls, leaving yourself naked for the cows to stare at in awe. The one you were just milking, however, looks quite flustered and embarrassed, clearly feeling guilty, believing she was the one at fault. Being the good owner you are, you quickly scoot over to comfort her, wrapping your arms around her shoulders, not entirely sure why she feels this way until you see the clear glisten running down her two smooth legs, joining a bigger puddle; most likely what you just slipped on. Seems like you forgot how horny they’ve been lately. You’ve had to do a lot of cleaning after the milking sessions for a while now. It’s probably time to think of some way to sate their growing arousal: maybe you should consider investing in one of them bulls?");
	output("\n\nYou shake your head; no money for that, unfortunately. Bulls are freaking expensive, after all. They tend to be a little too rough on cows too, making it harder to milk them the next day. You’ve also never really liked the thought of someone else claiming one of your beloved farm animals, and even if you could get over that, seeing such a display probably wouldn’t do any good for your massive libido.");
	output("\n\nJust thinking about it is enough to make your loins burn with passion, but you quickly force yourself back to the usual work routine, trying to focus on other things, lest you risk beating your meat right then and there. You’ve still got one cow left to milk, after all. If you begin to fap now, you’ll be masturbating right in front of the cattle for hours on end. With a great <i>*smack*</i> you clap your hands against your face, a necessary effort to drive the arousing thoughts away. Afterwards, you proceed to lead the flushing green haired cow to her stall; she seems a lot happier after the tight embrace.");
	output("\n\nMoving on, you take out your biggest bucket and walk up to the final stall, gazing right at your favorite prize winning cow, Reaha. She usually sports a pair of big FF-cups, already looking quite huge on her short, fleshy body, but now they’ve swollen up to double Gs, forcing her to lie down or bend forward to ease the strain on her back. She looks up to you with both need and affection, the same affection you’ve always held for each other. Reaha was your first cow, after all, and if it wasn’t for her famed milk, you would never have been able to afford this nice farm, yet alone the dozens of cows on it. While reminiscing about the good old times, you smile back at the cow and ruffle her strawberry blonde hair, right between her cute little bovine horns. A content moo escapes her lips as you continue to pat her head with one hand, while caressing her cheek with another - just the way she loves it.");
	output("\n\nA couple of giggles and moos from the other cows forces the two of you out of the shared trance. Reluctantly, you remove your hands from her warm body and relocate them to the cold metal fence separating you and the busty pet. With a slight creak, you open up the gate and let Reaha walk out on her own. You don’t need to utter any command or use any kind of leash to have her happily following after you, her full milky tits supported by her slender arms.");
	output("\n\nReaha has always been an obedient one, but when it comes to the milking process itself, she’s a bit more stubborn. Immediately after taking a seat on the tiny wooden stool, your [pc.crotch] is soon greeted by a handful of Reaha’s [reaha.butt]. You’ve already gotten used to her needing to sit on your lap and feel your [pc.chest] on her back, while your hands reach around her, hugging her through the milking session. But this time, stark naked and still slightly aroused from the trip down sexy memory lane, it’s a different matter, and you try to push her off. Reaha, however, won’t have any of that, slamming her soft ass back down, making her “Steele’s cow” tattoo jiggle in the process. Annoyed by your resistance, she keeps wriggling back and forth across your crotch, mooing in frustration until you’re forced to give in to the childlike tantrum. <i>“Who do you think I’m worried about”</i>, you irritatedly mutter as you start massaging her breasts, warming them up while trying to keep your mind on granny’s cookies, or anything else except the growing heat in your nethers.");
	output("\n\nIt’s not only the cows who’ve been horny lately. Without a steady partner, you’ve been pretty backed up too, and masturbation clearly doesn’t seem to cut it anymore. At this point, you’re worried you could attack your dear cows. You’re particularly concerned about Reaha. The last thing you want is for her to hate you after a relentless assault, but the bovine in question seems blissfully unaware of that, smiling from ear to ear while you knead her heavenly soft udders.");
	output("\n\nAfter you’ve thoroughly warmed her up, milk already dripping involuntarily from her teats, she’s ready for the real deal. Placing her stiffening nipples between your experienced fingers, you start tugging and pinching at them, and are immediately rewarded with a cry of delight and a fountain of milk flooding out of her. Reaha moos in pure bliss as you empty her breasts, visibly shuddering while the big orbs deflate at a steady rate. It’s not long before you fill the bucket and the white waterfall starts slowing down, turning into small trickles that leak down her bosom, occasionally flowing out again whenever you pinch hard enough.");
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Next",reahaDreamPart2);
}

public function reahaDreamPart2():void
{
	clearOutput();
	showBust(reahaBustDisplay(true));
	author("Shadefalcon");
	showName("PRIZED\nCOW");
	output("Normally, you’d be content just looking at the flying white arcs and the relieved expression on her adorable face, but this time you’re all too well aware of her quivering body and the slight stream of fem-spunk dripping down along your crotch. It took every ounce of your willpower to control your urges when she just sat on you, but feeling her naked skin on yours, and hearing her groans of pleasure, there’s nothing that can stop your mast");
	if(pc.cockTotal() > 1) output("s");
	output(" from swelling. You can sense Reaha too is flushing with arousal. Whether because of the usual milking or her sodden snatch grinding against ");
	if(pc.cockTotal() > 1) output("one of ");
	output("your throbbing member");
	if(pc.cockTotal() > 1) output("s");
	output(", it is hard to tell. At least until she turns around, lust in her eyes, a begging pout in her expression, and the cherry on top - an anxious little <i>“mooo?”</i>, a clear as day request for approval. The world spins around you, your head dizzy with lust and moral dilemmas. But before you’re able to voice an opinion, Reaha raises her [reaha.hips] until her [reaha.cunt] aligns with [pc.oneCock]. The moment she starts sinking down on it, the voice of reason leaves you. No longer able to suppress your urges, you slam your cock in all the way to the ");
	if(pc.hasKnot()) output("knot");
	else output("hilt");
	if(pc.biggestCockVolume() >= 600) output(", a visible bulge forming on Reaha’s stomach");
	output(".");

	output("\n\nA bellowing moo escapes Reaha’s lips, followed by moans and whimpers. Worried that you might’ve hurt your beloved cow you try to slide out of her, only to be trapped by her tightening hole, and the delightful feeling of Reaha forcing herself down again as hard as she can manage. Suddenly, she looks back at you, uttering an encouraging <i>“mooooo!”</i> She’s joined by the rest of your cattle, their hands placed between their legs, rubbing themselves while they watch the two of you cross the boundaries between a master and their pet.");

	output("\n\nAssured by their encouragement and Reaha’s quickening pace, you grab her hips and slam them down on you, thrusting into her inner folds with more and more vigor. You can’t help but grunt and moan yourself as you feel her vaginal muscles contract and squeeze around your [pc.cock] from tip to base. In chorus, reluctant whines escape your mouths as you leave Reaha’s [reaha.pussy], followed by contented sighs whenever the two of you meet in thrusts, your [pc.cock] bumping against her cervix every time. Reaha’s tits bounce back and forth with every smack against her jiggling backside, a sight so irresistible that your hands automatically start massaging them, your pace lessening a bit as a result. In turn, it seems like Reaha enjoys doing most of the work while you worship her fleshy body, caressing a boob with one hand and pinching at a teat with the other, earning you another spurt of milk and a shuddering moo from your bovine lover.");

	output("\n\nYou find yourself moving your [pc.arms] lower and lower, caressing ");
	if(pc.biggestCockVolume() >= 600) output("the bulge in her stomach");
	else output("her stomach");
	output(" before you reach her sensitive clit. Just the slightest stroke against it is enough to send her spasming, causing her to squirt out large streams of girl-cum, completely soaking your lower body while she clamps down on your intruding member, making it hard to continue moving with the vice like grip. Determined to make her get the most out of this new experience, you move your hands back up to her udders and begin to tug and twist at her nipples, forcing even more delicious cream to flood out of Reaha. Unable to keep her primal instincts in check, she keeps mooing louder and louder, body quivering once more as she experiences her first real boobgasm.");
	output("\n\nWell aware that you’ve still not come yet, Reaha tries to force herself to move again, but the way she whimpers and grips at your tool proves that she’s much too sensitive from her dual climax. Instead, she can only look back at you once again, eyes full of love, egging you on. Too lust addled to refuse, you begin your own relentless assault, pounding her with reckless abandon. It doesn’t take too much effort before you near your own peak, feeling that familiar tightness in your [pc.balls]. Loud moos fills the barn as your cows seem to reach their limit as well, only to be drowned in Reaha’s ecstatic <i>“MOOOOOOO!”</i> earned by her second, much stronger orgasm. It all proves too much for you: the overwhelming feminine scent, Reaha’s squeezing hole, and the thought of the perverted circumstance you’ve found yourself in - shagging a cow, your beloved Reaha no less!");
	//hasKnot:
	if(pc.hasKnot())
	{
		output("\n\nWith one final thrust you slam your expanding knot into her, the rush of your climax hitting your brain and [pc.cockNounSimple] like a lightning bolt of ecstasy.");
		output("\n\nMeanwhile, the obscene bulge of cockflesh inflates, stretching out Reaha’s tunnel until you’re locked inside of her. <i>“Moo?-MOOOOOOOO!”</i> Reaha is unable to contain her own vocalizations and they grow inexplicably louder as you tie the two of you together, thoroughly breeding her like the chosen alpha bitch she is.");
		if(pc.cumQ() < 1000)
		{
			output("\n\nThick ropes of [pc.cum] escape your cock, coating Reaha’s inner folds, and with your knot blocking the exit, there’s no way for your seed to leak out of her pussy; though judging by that satisfied expression of hers, you don’t think she’d want it any other way.");
		}
		else if(pc.cumQ() <= 40000)
		{
			output("\n\nStreams of [pc.cum] shoot off inside Reaha, her belly visibly expanding, while you get to enjoy having your own cock coated in the warm sloshing cum. It’s not long before she looks a couple of months pregnant, and with your knot blocking the exit, not even a trickle escapes her; but judging by how she lovingly strokes her stomach, letting out deeply satisfied moos the whole time, you don’t think she’d want it any other way.");
		}
		else
		{
			output("\n\nA torrent of [pc.cum] explodes inside of Reaha, her belly visibly expanding, while you get to enjoy having your own cock bathed in the warm sloshing cum. It’s not long before she looks nine months pregnant, and with your knot blocking the exit, not even a trickle escapes her; but judging by how she lovingly strokes her stomach, letting out deeply satisfied moos the whole time, you don’t think she’d want it any other way.");
		}
	}
	//noKnot:
	else
	{
		output("\n\nWith one final thrust you slam yourself to the hilt, the rush of your climax hitting your brain and [pc.cockNounSimple] like a lightning bolt of ecstasy.");
		if(pc.cumQ() < 1000)
		{
			output("\n\nThick ropes of [pc.cum] shoot out of your cock, coating Reaha’s inner folds. Naturally, some of your seed leaks out of her, but Reaha seems happy enough just having you inside her yearning box.");
		}
		else if(pc.cumQ() < 40000)
		{
			output("\n\nStreams of [pc.cum] shoot off inside Reaha, her belly visibly expanding until she looks a couple of months pregnant. But with nothing blocking the exit, her belly deflates back to normal proportions before long, and your lower body get drenched with the sticky excess.");
		}
		else
		{
			output("\n\nA torrent of [pc.cum] explodes inside of Reaha, her belly visibly expanding. Streams of it escape her snatch, but with the amount you’re pumping out, it doesn’t take long before she ends up looking nine months pregnant either way. However, with nothing blocking the exit, her belly deflates back to normal proportions soon after you’re done, and your lower body gets drenched with the sticky excess.");
		}
		if(pc.totalCocks() + pc.totalVaginas() > 1)
		{
			output(" Your excess anatomy goes off as well, releasing ");
			if(pc.totalCocks() + pc.totalVaginas() > 2) output("their own");
			else output("its");
			output(" juice into the large bucket, adding to the all natural Steele flavor.");
		}
		output("\n\nNo longer seeing any reason to hold back, you kiss Reaha, pressing your [pc.lips] against her own, muffling her surprised moo, which soon evolve into silent moans. The two of you end up lying on the ground for a while, chests heaving and sweat dripping from your skin. You’re both content to just enjoy the post orgasmic bliss while engaging in a steamy makeout session. The world would probably frown upon such a relationship, but to you this feels just right, natural even, like you’ve been lovers for a good while already.");
	}
	//hasKnot
	if(pc.hasKnot(x))
	{
		output("\n\nThis heavenly moment of joy lasts for what seems like an eternity before your knot finally deflates and you pull out of the spent cow. The [pc.cumNoun] trapped in Reaha ");
		if(pc.cumQ() >= 1000) output("gushes");
		else output("oozes");
		output(" out of her [reaha.cunt]");
		if(pc.cumQ() >= 8000) output(", her belly noticeably deflating");
		output(", until only a small dribble remains, a clear sign of a job well done.");
	}
	else
	{
		output("\n\nThis fleeting moment of joy lasts for what seems like an eternity until you finally pull out of the spent cow, a nice trickle of [pc.cumNoun] oozing out of her, a clear sign of a job well done.");
	}
	output("\n\nLooking at your blissed out lover, you wonder what you’re gonna do with her and all this mess before several of the other cows start mooing loudly, desperate for their own turn. <i>“Duty calls”</i>, you think to yourself, smiling from ear to ear, not seeing any reason to stop yourself now that you’ve already come this far. With this many cows you might finally be able to quench the insatiable need in your loins. However, just as you’re about to scuff over to them, you find yourself pinned down by Reaha once again. <i>“I’m not done with you yet”</i>, she says, eyes glimmering mischievously.");
	pc.changeLust(100);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",reahaDreamPart3);
}

public function reahaDreamPart3():void
{
	clearOutput();
	
	if(flags["CREWMEMBER_SLEEP_WITH"] != "REAHA")
	{
		showBust("");
		showName("\nWAKING...");
		
		output("You abruptly wake up, eyes opening wide in pure shock. <i>“Reaha was talking? How is that possible? She’s just a cow!”</i> Thoughts like these keep swirling inside your head until it dawns upon you that the whole farmer life setting was just a dream, and that Reaha, is as much a talking person as you are.");
		output("\n\nJust a dream... you remind yourself.");
		output("\n\nDisappointed, you");
		if(!dreamNewCock) output(" rub away the mess of [pc.cum] from your [pc.cockHead] and");
		output(" wipe the sleep from your eyes.");
		if(flags["CREWMEMBER_SLEEP_WITH"] == undefined) output(" Now if only Reaha was next to you...");
		
		pc.changeLust(5);
		dreamResetCock();
		
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		
		return;
	}
	
	reahaHeader(true);
	author("Shadefalcon");
	//50 % chance of occurring instead of sleeping Reaha:
	if(rand(2) == 0)
	{
		output("You abruptly wake up, eyes opening wide in pure shock. <i>“Reaha was talking? How is that possible? She’s just a cow!”</i> Thoughts like these keep swirling inside your head until your wandering gaze falls onto Reaha sleeping next to you with an innocent expression on her slumbering face. Only then does it dawn upon you that the whole farmer life setting was just a dream, and that Reaha, obviously, is as much a talking person as you are. While looking at her cute expression, you can’t help but ruffle her hair, just like in the dream. Reaha, deep inside a sweet dream of her own, starts smiling at that, surprising you by affectionately whispering <i>“[pc.name].”</i>\n\nAlthough still asleep, your momentary confusion gives her plenty of time to embrace you in a tight, boob filled hug, followed up by Reaha sleepkissing you right on your [pc.lipsChaste]. Unable and unwilling to disentangle from her, you’re content with dozing off once again, nestling your head into her soft pillows.");
	}
	else
	{
		output("You abruptly wake up, eyes opening wide in pure shock. <i>“Reaha was talking? How is that possible? She’s just a cow!”</i> Thoughts like these keep swirling inside your head while you fondle the pair of lactating tits in front of you. Feeling a bit thirsty, you’re about to get some delicious milk straight from the tap, when you’re suddenly interrupted with a questioning low voice; <i>“Ummmmm, [pc.name]?”</i>");
		output("\n\nReluctantly, you move away from the inviting bosom and look up, only to find yourself eye to eye with a flustered Reaha, her face flushed with rosy red color. You drowsily gaze back at her puzzled expression for a while, still kneading her breasts, until you’re struck by a realization. Gradually, it dawns upon you that the whole farmer life setting was just a dream, and that Reaha, obviously, is as much a talking person as you are. After letting go of her mammaries, you look away from her for a bit, your face colored with the same red hue..");
		output("\n\n<i>“" + (pc.isNice() ? "I’m sorry, h" : "H") + "ow long have I been doing that?”</i> you eventually utter, slightly embarrassed.");
		output("\n\n<i>“You’ve been going at it for quite some time now, to be honest,”</i> she responds, her tone less insecure now.");
		output("\n\nNot entirely sure what to do or say, you’re surprised by Reaha raising a hand towards your cheek, gently moving your head until your eyes meet once again. Reaha smiles at you with a reassuring, yet playful grin, <i>“I didn’t tell you to stop.”</i> Hearing this, your expression lightens up considerably and you quickly lower your head back into her welcoming pillows.");
		output("\n\nAs you start to massage her chest once again, Reaha ");
		if(pc.hasHair()) output("ruffles with your [pc.hair]");
		else output("gently pets your scalp");
		output(" and whispers sweet words of encouragement. <i>“Shhh!”</i> you hush, putting a finger on her lips, <i>“cows don’t speak.”</i> This makes her giggle a bit and she playfully moos back at you. Smiling at that, you take in one of her lactating jugs and dig in, sucking at it like a hungry child.");
		
		output(" [reaha.Milk] flows into your mouth, a true delight to your senses, and Reaha’s too, if her exhilarated moans are any indication.");
		output("\n\nAt the rate Reaha’s [reaha.milk] rushes out of her, your cheeks can’t help but swell like balloons with the overflowing fluid, forcing you to swallow the delicious treat at a steady pace.");
		output("\n\nWith each chug you feel more awake and energetic, and when you’ve drained her first boob, you don’t hesitate to move on to the second, where you nibble at the bud, earning you an even greater flood of her rich bounty. Reaha visibly shudders with delight, mooing happily as you keep emptying her [reaha.breasts]. It’s not long before lust begins to blossom, and the moment you’ve quenched your thirst, a different, more carnal desire needs to be sated. Unable to contain yourselves any longer you practically pounce at each other, almost wrestling to be the first one on top.");
		output("\n\nAfter fooling around for a while you disentangle from a sated, sleepy Reaha. The poor girl probably didn’t get too much sleep with you groping her for so long, but now Reaha grins from ear to ear as she falls into slumber.");
		if(pc.isNice()) output("\n\nYou place a soft kiss on her forehead and whisper <i>“good girl”</i> before you leave the room.");
		else if(pc.isMischievous()) output("\n\nYou gently rub at her [reaha.butt] and whisper <i>“good pet”</i> before you leave the room.");
		else output("\n\nYou smack at her [reaha.butt], causing her to wake up with a yelp before you say <i>“good job”</i> and leave the room.");
		
		pc.milkInMouth(reaha);
	}
	pc.changeLust(5);
	dreamResetCock();
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//You wake up in bed with a single mission: Find the venus pitcher. Feel strange psychic pull, jerking off your mind, your spirit, curious lack of physical sensation. Arrive, she looks unimpressed. “What am I supposed to do with that?” she asks. You look down. You see, no cock, no pussy, genderless expanse. Don’t worry, you’ve got a few other perfectly good holes to use. Bimbo variant, large breast variant, dicknipple variant, normal variant - then cock, then pussy. Bit of everything. // 

//Part 1 of scene
public function venusDreamyButtStart():void
{
	clearOutput();
	author("eSuccubus");
	output("Tonight’s the night, and it’s going to happen again and again.");
	output("\n\nHas to happen.");
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("\n\nThere is a wet heat between your " + (pc.hasLegs() ? "legs" : "thighs") + " that reaches up inside you and strokes your mind as well. One image surfaces from the maelstrom of thought: a green-skinned plant woman who only wants what is best for you. Best for both of you. There is no sign of her yet, here in the dark forest. Memories of your arrival are fuzzy, but the “why” of your visit isn’t. That relentless stroking feeling, like your mind itself being jerked off. Subconsciously, it’s been haunting you for a long time. Your conscious mind doesn’t even know how badly you hunger.");
	output("\n\nThe forest makes you feel like everything will be alright. The part of you that tells you when you are home, filled with her and connected to her and buried face-first in her breasts, is pulsing happily. A tether between you and she, the object of your desire, flashing vibrations into your mind until the comfortgasm of submission has you scrabbling more quickly through the overgrowth. Maybe you will fall face first into her tits.");
	output("\n\nThinking of her calls an image of the Venus Pitcher to mind. Powerful, cunning, tempting, seductive: your mental image grows in intensity until you can see her ghostly image superimposed over the environment. An effect like wearing glasses with a hologram of her on the inside. There she is. Breasts swaying from side to side. Blinking has a familiar difficulty to it, and your fixated mind sees her in the foreground of the world. In front of the trees, even in front of your hand when you try holding it up in front of your face.");
	output("\n\nShe is there, from the waist up, a perfect image of your leafy temptress floating like a cheap holovid effect on the inside of a pair of glasses... you look at the tiny version of her painted on your hand, but you know you’re really seeing her from inside your eyes. From inside your head. She’s mouthing something. Can’t hear the words. Have to get closer with the ghostly images of her on the inside of your eyes to guide you. They remain when you blink. They are within, bouncing boobs and all.");
	output("\n\nThat thought brings a particularly potent spasm of euphoria. Thinking of her tits at all brings too much pleasure to bear. You try to recall the exact shape of those pebbly nips, the bountiful flesh you can sink into, and your body just shivers before your mind turns away. Like looking at the sun - too bright, too much ecstatic nervous-system sensation, too many happy memories tied up there. You can only handle small doses of thinking about her tits. Floating drunk and drugged by your mind’s own chemicals. The release of love and lust and ache. A familiar clearing in the forest. A familiar plant pod, emerging from the ground.");
	output("\n\nPerhaps you should not have come here...");
	clearMenu();
	addButton(0,"Next",venusDreamsPart2);
}

public function venusDreamsPart2():void
{
	clearOutput();
	author("eSuccubus");
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("The answer is swift and sure.");
	output("\n\n<i>“You are wrong, you need this,”</i> says a confident feminine voice. The voice. Her voice. Its harmonics begin euphoric stimulation of a part of you that is more than physical. You fall to the ground in shivering paroxysms at this first taste of her. It was never so strong before, but your face pressed to the scattered leaves is undeniable proof of her control. Something feels strange about all this.");
	output("\n\nThat thought vanishes quickly because the beautiful and welcoming voice is outside, inside, everywhere and everything.");
	output("\n\nMelody and seductive music in the form of a temptress’ voice, and you must follow it. Your vision is fuzzy. Your brain is fuzzy. You make an attempt to cross your eyes: to look inside your head, past the ghostly images of her that are on your eyes themselves. This effort to see the source of her control ends in failure. You think you hear a second sound, more mechanical. It sounds like the ambient noise of a ship, but the voice reassures you it is just the wet piston thrum of your pleasure center being fucked. Your mind itself is like every other part of you: it needs a rough slick pounding in the depths of the night.");
	output("\n\nA headache spelled out in ecstasy and ache and the fucking of your mind itself. No, more like bouncing and swaying. Huge, bouncing, swaying tits. Back and forth. Back and forth. In front of every tree, each small path through the brush, before your very eyes is the ghostly superimposed image of a tall green woman and her huge breasts. <i>“That’s right, good [pc.boyGirl]. Closer and closer.”</i> Each word, every syllable, strikes a chord. This is only making the pleasure-ache inside your head better - worse - better. Closer to the source. Wait, there she is.");
	output("\n\nStanding in darkness, but you can pick out every part of her. Each detail was committed to memory as your overfucked body heard her words and recorded them for your subconscious to struggle under later. Struggling with effort to turn your head away, more for sport than because you think you can. You think you feel your brain creak, as if it would break from the difficulty of resisting her.");
	output("\n\nWorse still is the fact that the pleasure stroking suspension of thought ceases when you’re actively trying to resist her. You want that full-body euphoria that turns all your thoughts to vapor. Resistance vanishes. The tether she has inside your soul is once more jerking off your brain until remnants of thought ooze out of your mouth and mind and body like so much wasted sexual fluid.");
	output("\n\nRemembering each and every time you’ve ");
	if(pc.hasVagina()) output("schlicked");
	else output("jerked");
	output(" yourself to moaning completion with her eyes and tits and curves and vines as your sole obsession, you stand drooling in front of her. Those breasts bounce, held in her hands, swaying, matching the ephemeral image superimposed over reality like a bad holovid editing trick. You’ve been seeing her all along, every time your eyes close. Each bounce and tremble of those tits is perfection in triplicate: the tiny ghostly versions of her swimming on your eyes and still present when you can bring yourself to blink, and the real thing there in the darkness. You want her. You need her. You spread your " + (pc.hasLegs() ? "legs" : "thighs") + " and shamble closer with everything on display.");
	output("\n\n<i>“That’s right, come to the familiar home of your desires. We can both be so happy. You understand where your home is... climb in and let me pleasure your... wait. That is strange.”</i>");
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",venusDreamsPart3);
}

public function venusDreamsPart3():void
{
	clearOutput();
	author("eSuccubus");
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("She pauses her show, breasts falling out of her hands with a joyfully perky bounce. The brain-shudder that follows this gesture makes you feel like you want to cum. You’re right on the cusp, but something is missing.");
	output("\n\n<i>“What am I supposed to do with that?”</i> she says, pointing down between your " + (pc.hasLegs() ? "legs" : "thighs") + " with one hand, while the other covers her mouth to barely-suppress a laugh.");
	output("\n\nYou look down and see...");
	output("\n\nNothing " + (pc.isSexless() ? "out of the ordinary.." : "but a flat empty space where your sex organs should be") + ".");
	output("\n\nThe stimulation has all been mental, internal, mesmerizing and deep. She seems to be laughing at you, and so are the ghostly visions of her imposed on your eyes and within your mind. You scrabble your hands futilely between your " + (pc.hasLegs() ? "legs" : "thighs") + ", finding no way to force pleasure through the front. No womb to impregnate, no cock to surrender to her or supply her with your seed. You think for a moment as she looms over you, her vines extending and tickling you as they probe the blank expanse where your sex might otherwise reside.");
	output("\n\nYou look up at her, trying to ask a question, trying to muster words or thought. The ravishing plant woman has resumed the slow oscillation of her tits, moving them in circles that leave afterimages in your vision. The real tits are now backdrops for tiny busts of her, massaging her breasts, which are resting on your eyelids. You blink, with effort, and still see tiny versions of her winking and tempting you. When you open your eyes, the phantom venus pitchers transparently imposed on your field of view happen to line up perfectly with her nipples.");
	output("\n\nShe is everywhere. She is within. She is without. You have to offer something. She can’t be left wanting. She can’t be left without a part of you to use...");
	
	//it branches after this into multiple possible scenes
	var venusDreamList:Array = [];
	
	if(pc.isBimbo()) venusDreamList.push(venusDreamsPartBimbo);
	if(pc.biggestTitSize() >= 10) venusDreamList.push(venusDreamsPartFucknormousTits);
	
	clearMenu();
	if(venusDreamList.length > 0) addButton(0, "Next", venusDreamList[rand(venusDreamList.length)]);
	else addButton(0, "Next", venusPitcherDreamsPartNormal);
}

public function venusDreamsPartBimbo():void
{
	clearOutput();
	author("eSuccubus");
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("That’s like, no problem though. You know the answer. She seems surprised, because you smile and kneel instead of looking sad. You lay on your side on the leafy ground, and face away from the lady. Well, you try. But the titties are so big. Need to lookit the titties! So you gaze all sultry and stuff, you know, like over your shoulder at them. You lick and then open your [pc.lips], your tongue laid out and curling obscenely. You’ll suck anything so good. Anything, anyone, fuck your brain, fill your mouth, make your bimbo body burst like a cumming pussy or a spurting cock or a clenching ass or a happy titgasm.");
	output("\n\nAll of you should be like that. One big sexy slut slit for her to fuck. Your [pc.butt] is facing toward her. She might not be able to see your [pc.asshole] so you grip one butt cheek and pull it upward. If you had a pussy or a cock she’d be able to see that. Instead, the nice lady emits an appreciative murr at the sight. <i>“I’ve got all the slutty holes you need!”</i> you giggle. <i>“Like, duh, if there’s no pussy then just make new pussies. Mouth ‘n ass ‘n brain all slutty pussies.”</i> You keep your lips wide open. Your butt wiggles when you rub your hip against the leafy ground. A nice smell fills the air and your eyes get all heavy and stuff. Sex and flowers and musk and ache and it isn’t all from you. Good, she likes it.");
	output("\n\nShe seems intrigued and reaches out. But you laid on the ground too far from her, aww, you’re gonna have to get up when you just posed all sexy! But no, because the ground moves and vines reveal themselves. A conveyor belt of vines pulling you closer. Unstoppable. Feels squirmy and good.");
	output("\n\nShe wants you. Your bimbo senses are tingling. You can already imagine your butthole as a nice overfucked and pregnant pussy. And your mouth. But which one do you want more?");
	output("\n\nYour slowed down thoughts momentarily free you from the insistent comfort-masturbation of just being near her. You consider whether you want it in your mouth or up your slutty ass more. You don’t know how, but if anyone can make you into one big pussy, it’s her. So you give the answer every bimbo does when asked to choose between different fun and freaky fuckable bits. <i>“All of ‘em.”</i>");
	output("\n\n<i>“Excuse me?”</i> she asks, apparently having paused to marvel at bubbles of thought percolating through a bimbo brain.");
	output("\n\n<i>“Fuck all of my holes,”</i> you declare.");
	output("\n\n<i>“You only have two,”</i> she says. Even her lust and desire to use your newly offered holes is slaked by your dreamy drooling declaration.");
	output("\n\nYou suck some of the aforementioned drool off the corner of your wide spread lips, and think on this. It takes soooo long that she’s already wrapping long vines around your ankles, leaving moisture there that speaks of her verdant eagerness. You eventually find your answer, bubbling to the surface. <i>“Then fuck ‘em both but do it really deep.”</i>");
	output("\n\n<i>“How deep?”</i> she asks, interest and amusement cutting off sexual need. Her vines are poised. You aren’t spreading your butt any more, one of her vines is doing it. You know a good bimbo never rests, so your hands grab two of the vines prepared to plunge into your mouth and you begin jerking them off as if they were big green bendy cocks.");
	output("\n\n<i>“All the way through!”</i> you say, before getting lost in dreams of giant green cock on giant green people, fucking you all the way through. Bendy and gooey and bimbo-brain-breaking...");
	output("\n\nThe vines move. It happens gradually, then all at once: they are inside of you by the tiniest bit before falling like an avalanche of pleasure onto your tongue, into your rear, into your mind. Her vines are doing the work, and so the pitcher’s breasts are still on display. You stare with every appearance of interest, but it is just the vague remnant of sentience left over.");
	output("\n\nYou seem to see yourself from outside, hovering over your body spit roasted high off the forest floor. Suspended in a web of vines, the beautiful lady rubbing her nipples and rotating those mind-stealing globes, everything is perfect.");
	output("\n\nLike, wow, who’s that down there... She’s droolin’ so much. Fuck, her whole body is full...");
	output("\n\nIt is. Sparks and spikes and bolts of pleasure. One finds a place inside your ass you weren’t sure existed, and just begins vibrating on top of it. Whatever the liquid on those vines is, it coats your tongue and turns it into a clit, a cock, a pussy, an entire sexual explosion between your lips. Only the whites of your eyes are visible in the moment her vines really begin their push.");
	output("\n\nLubricated, gentle, and all encompassing. The vines in your ass weave themselves together to form a structure like a huge but prehensile dildo. It keeps going and going until nothing is left of “you” except the you floating above, watching herself get fucked. The body down there looks uncomfortable with the vines filling it up and going all the way through. But all your discomfort is taken away by those big tits. She drifts forward through the fertile ground and rests her huge tits on your face.");
	output("\n\nGiggling. Clenching. Trying to send instructions to the poor vine-sleeve of meat and need and groaning ecstasy below with the plant lady’s green tits taking your mind. None of your instructions work. None of your thoughts work. Eventually even your out of body experience starts having mindless fuckquakes that send the green woman’s seed gushing back out of your butt. Mingled with your drool it has painted a pale green trail down your chest and formed a puddle under your suspended form.");
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",venusDreamsPartBimbo2);
}

public function venusDreamsPartBimbo2():void
{
	clearOutput();
	author("eSuccubus");
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("There is nowhere inside your head for your mind to run from this. The pleasure is so much that you just spread and contort before going limp. You belong to her now. Your tongue feels so good from that stuff. Sucky, sucky, blank stars and rainbows cascading through your mind - a wonderful backdrop to the dancing ghostly images of her embedded in your subconscious, playing on the viewscreen of your visual cortex.");
	output("\n\nYou always see her. Always crave her. Your mouth is like a pussy, your ass is like a pussy. Vines grab your thighs and hips, holding you tight with an intimate closeness. The breasts resting on your face remind you that those big titties you so love are as close as they can be. You’re simply unable to deal with that. The sensitivity of a bimbo body overtakes and there is white hot pleasure. After this, your mind is too overtaxed to firmly record it all. You have to focus on one thing at a time if you’re gonna get any thinking done. You drool, and at one point begin to giggle.");
	output("\n\nShe loves that because the mouth-vines which are pushing out of sight down your throat get the full vibration treatment. Spurting. There is spurting on your tongue. So much that the stuff oozes down it and you think it should be hard to breathe. But it is easy. Easy to breathe and sway. You can only see her green flesh - and the two superimposed images of her dancing and swaying inside your eyes.");
	output("\n\nVines everywhere, overfucked and mindlessly submitting. You feel her breasts covering your eyes. The vines are deep inside your belly, that must be the only explanation for why you have butterflies there. This feels as good as the first time. No, better, because you know her. Your ass is spread around a complex interweaving of vines that hits every sweet spot. Winding up inside you. You are suspended in the air, with a woven basket of vines holding you up. Plus many mingled and woven down your gagging throat, and many more up your horny ass.");
	output("\n\nThe heat isn’t focused between your " + (pc.hasLegs() ? "legs" : "thighs") + ", or even in your nerves, it is in your head.");
	output("\n\nHer breasts press to your eyes. You record the tiny tremors and wiggles, the way she jiggles them over your face. Your whole body jiggles with transferred energy. Then the thrusting begins. Deciding they’d gone deep enough to meet up, the vines join inside your body...");
	output("\n\nYou know it. You know it because your eyes roll back. The vines have joined together and become one long thick stream of vine from mouth all the way through. You feel it in your belly and brain. Your drool doubles, your brain is a suspended epiphany: here you belong, part of her. Part of her body, her organs, her plant system. Part of the beautiful woman who is shhhing and tenderly rubbing your scalp with her delicate fingers as her tits shiver in pleasure. You gave her pleasure. Her vines begin to move in and out, sawing you like a violin bow.");
	output("\n\nYou obligingly make noise but it is only a slow rumbling gurgle. Too neutralized by her chemical and hypnotic influence. Too controlled. You lay there as an ornament, a vine-sleeve. Lacking a pussy for her to impregnate and claim, your whole body became one.");
	output("\n\nNow there are no vines holding you up, just your giggling empty head spitroasted and turning on the spit of her vines. Your belly slowly swelling as the tips of vines which terminate in your stomach squirt her seed directly there. More, into your mouth, into your ass. Thick and full. The warmth triggers an orgasm, the first real orgasm of the whole affair.");
	output("\n\nYou are cumming and it is unlocalized. It begins in your mouth, it begins in your ass, it began on the day her swaying breasts first stole your thoughts. Now you shake, juices gushing as the fluids she has filled you with are partly pushed out. But there is no shying away: the vines are inside you, all the way inside, all the way through, you feel them swaying and wiggling as they connect and begin pistoning in one end, out at the other, back and forth.");
	output("\n\nYou feel you might be turned inside out. The white heat in your mouth and ass and brain joins into full body paroxysms and half-strangled noises of pure obscenity do make it out. This is what you’re for. The vines are inside and you are cumming your way into a useless stupor for the gorgeous plant girl who is massaging your shoulders in response to a particularly powerful orgasmic spasm.");
	output("\n\nShe soothes your helplessness and cradles you on her lap when things become too intense, when the mind has fled and all there is remaining are smiles, giggles, blank moments of squeezing her tits or sucking her nipples. Soothes, but does not remove the vines or the huge quantity of seed. Nor does she show any sign of stopping.");
	output("\n\n<i>“This is what is best for you,”</i> she insists as the vines powerfully press previously undiscovered pleasure centers. Your tongue clings to the roof of your mouth, twining around the vine, dripping with her fluids and your own saliva. Your eyes roll back in your head when a powerful thrust widens your ass for her to pass yet another vine...");
	output("\n\nEven rolled back, you can still see the twin busts of her on your eyelids, dancing hypnotically, reassuring you that even when the tenth orgasm makes your inner thighs an electrified shaking mess of sweat and useless blankness - you will still be hers.");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",venusDreamsPartBimbo3);
}

public function venusDreamsPartBimbo3():void
{
	clearOutput();
	author("eSuccubus");
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("The mess the next morning is unspeakable, and leaves you with a lot to think about. You are covered in ");
	if(pc.hasCock()) output("drying streams of cum");
	else if(pc.hasVagina()) output("trickles of dried pussy juice");
	else output("the remnants of a milky mindless orgasm all down your [pc.tits] and torso.");
	output(" As you clean up, you imagine you can see the Venus Pitcher’s swaying breasts and her upper body where she rises from the ground superimposed on your vision like something from a bad pair of holovid goggles. You still hear your bimbo brain sublimating and leaking out of your mind like water boiling through an aperture. A high pitched <i>eeeeee</i> of thoughts escaping.");
	output("\n\n<i>Eeeeeeeee</i> also the sound of your shivery post-orgasmic cry turning into- the sound of your alarm.");
	output("\n\nYou jolt upright in a puddle of your sticky sweat, mind simple and giggly. After a while you even line up enough brain cells in a row to turn off the ship’s notification.");
	output("\n\nLike wow, what a crazy dream!");
	//continues on to part 3 after this
	clearMenu();
	addButton(0,"Next",venusDreamEpilogue);
}

//Part 2 of Scene version If sufficiently big titties
public function venusDreamsPartFucknormousTits():void
{
	clearOutput();
	author("eSuccubus");
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("Even though your mind is slow in the presence of this beautiful leafy seductress, you try to find an answer to her question. While looking down your body, you couldn’t help but notice something. Grabbing your [pc.tits] by their [pc.nipples], you lift them dully into the air, as high as you can, and let them drop. They bounce and sway, reminding you of the hypnotic breasts buried somewhere in barely-encoded memory. Hers. Yours are like hers, and that symmetry is joyous: reminding you of the woman in front of you, when she was seducing you, drawing you in, welcoming you into her warm arms. The rebounding boobquake makes more of the shivery stroking-stroking-stroking feeling invade your thoughts. The secret connection jerks off your mind and you’re drooling with the possibilities mingled with the impossibility of resistance.");
	output("\n\nYou feel permeated, like her roots are in every part of you.");
	output("\n\n<i>“To seed your breasts?”</i> The plant’s breath catches in her throat. The intrigued look she gives you is gratifying. <i>“I suppose they are big enough... if you would offer them up for that purpose.”</i>");

	//[Next]
	// IF dicknipples, the scene branches to here
	clearMenu();
	if(pc.hasDickNipples()) addButton(0,"Next",venusDreamsPartDicknipples);
	else addButton(0,"Next",venusDreamsPartFucknormousTits2);
}

public function venusDreamsPartDicknipples():void
{
	clearOutput();
	author("eSuccubus");
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("You shake your head.");
	output("\n\n<i>“No? Did you have something else in mind?”</i> the pitcher asks.");
	output("\n\nYou grip your [pc.dickNipples] more tightly for emphasis, bringing up a spurt of precum. You show off their shape, their heft, and the tiny dribbles which are then oozing down your [pc.breasts].");
	output("\n\n<i>“Do you imagine sliding those inside of me? Letting all of your spurting [pc.cum] flood me? Sustenance, connection, homecoming... yes?”</i> She licks her lips as she says it, beckoning you over to the edge of the pit from which her pod has arisen on the forest floor. Your dual dribbling titty toppers grow that much harder to handle, when she breathes those words with every sign that her own arousal is overflowing. They’re pointing up toward the sky, engorging your [pc.breasts] until they are comically rigid and torpedo shaped.");
	output("\n\nConvinced of your sincerity, she lets her vines loose. A small loop of nimble prehensile plant matter lassos the base of each of your dicknipples. The vines tug them downward gently. The insistence of this maneuver has the effect of bringing your whole body toward the verdant floor. The sensitive back muscles of your dual dicks shiver with pent up desire. Veins stand out, carrying sensation and rigidness to a whole new level when her long green appendages begin to pulse and pump up and down the shafts. Tightness varies from excruciatingly restrictive to the loosest possible tingle of contact. You crawl closer to her from your submission position on the ground, following the insistent vines. Closer and closer to the hole in the ground from which her pod extends.");
	output("\n\nYou can see her sex. Looking up shows only beautiful boob, but you know she can see you. Looking straight ahead shows her alluringly smooth slit and its slightly parted petals. The honeyed fluids dripping. A golden light is reflecting from them, even here in the dark. The Nectar. Something in you hungers, and you reach out one hand. The vines tighten, tugging your dual points of stimulation until your eyes cross. One vine, wound so tightly that nothing can escape from between its coils, dedicates itself to each nippledick. This handily distracts you from your attempt to drink her drooling arousal.");
	output("\n\n<i>“Not yet,”</i> she admonishes. You are close enough to reach out and touch her, though. The green manipulator flips you over with a third vine wound around your waist. It is an intimate gesture, as it brings you closer to the hole down to her resting place under the forest floor.");
	output("\n\n<i>“I would never let you fall,”</i> she reminds you with a companionable squeeze.");
	output("\n\nSparks of pleasure come from your chest. They travel a much shorter distance than if she were stroking a normal cock, and so there is less time between each signal. The weight of your dicknipples turns her on, and she uses a few of the vine strokes to tilt the nipples left and right on your yielding tits. Pleasure is interrupting each thought in such a way that even your normally worshipful gaze turns hazy every time you look up at her. The vines can do as much as any hand, plus the way they are wrapping up your cocknips creates a swampy prison from which neither pleasure nor the building rivers of pre-ejaculate can escape. One vine, wound so tightly that nothing can ooze out from between its coils, dedicates itself to each nippledick.");
	output("\n\nYour cocks are bathing in slick “personal” lubricant, and the feeling of mounting euphoria is in your tits as well as your brain. Your entire upper body is floating, the lower half forgotten. She turned you over at some point there, so she is looming over you now.");
	output("\n\n<i>“How are we... going to do this?”</i> she asks, her usual calm demeanor momentarily turned perplexed.");
	output("\n\nYou are laying on your back with your huge firm breasts almost covering your face. Her vines hold you fast and jerk your tits, and her body is over you. She’s partly connected to a vast structure underground, and so the act of fitting your dicknipple in her pussy is daunting. You hear a satisfied sigh from above, and notice she is spreading her slick nether lips with the fingers of one hand. Your vine-wrapped dicknipples jut skyward - and then are released.");
	output("\n\nFreed, they glisten with her vines’ strange humors and your own all too understandable fluids. She mingles the juice from her pussy with this, grabbing one of the nipplecocks. Then she pulls you closer to the hole, and straddles one of your [pc.breast]. The slicked up shaft slides inside of her.");
	output("\n\n<i>“Oh yes!”</i> she cries out, with every appearance of abandon. You can only see her taut ass and curved back. You feel so much more. Your [pc.dickNipple] is buried in her sex. It is not that hot, but it is wet and perfectly sized. She rides you down to the hilt, astride your huge tit as if it were an inflatable bouncy ball. Your cock swells, its slight curve pressing against the walls of her sex as she extends above the deep rooted hole in the ground and mounts your tit reverse cowgirl.");
	output("\n\nThis still leaves one cock out in the cold. She could just grasp it with the vines, but the plant woman chooses a more personal touch. Her long slender fingers capture it. The entrance of her wet perfect sex squeezes tight on your cock’s base. The back “muscle” of the erected dicknipple is being sucked as if by tiny mouths. A complete internal muscular control is mirrored in her hand, so the way her thumb and forefinger pump the base of the neglected dick not trapped in her folds is the same as her pussy’s ministrations.");
	clearMenu();
	addButton(0,"Next",venusDreamsPartDicknipples2);
}

public function venusDreamsPartDicknipples2():void
{
	clearOutput();
	author("eSuccubus");
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("You feel her weight, but her vines are taking much of it off of you. There is just enough to know she is sitting astride you, pushing air out of your body with each gleeful titquake from her butt and inner thighs slamming down on your breast. Your dicknipple has vanished, hilted, but you see her nectar and your precum mingled on the shaft when she rises up. Each time the gorgeous goddess of the vine lets herself drop, your head spins and your titty dick vanishes.");
	output("\n\nHer back glistens with moisture, and the reflected light in the dark vegetation makes her glow in your vision. Your lower body is forgotten in the wild rut as the extended foreplay builds to a head. Bouncing, slapping, the music of passion throughout the forest. It is not long before tension takes over your upper body and you begin to feel light headed. You inform her that you are about to cum. It has never been like this before.");
	output("\n\nThen the waves begin. The inside of her pussy is sucking, trying to swallow you deeper within. It moves in paroxysms: true spasms as a tight-knit conveyor belt of pleasure just sucks on and on. Trying to pull your cock deeper into her body. Her hand emulates this by switching from just two fingers to a full palm stroke. Now both hands. She is riding, moaning, letting her breath out in tiny gasps. The only thing in the world are your cocks and her control.");
	output("\n\nOne of her hands grabs the base, slides up your slick [pc.dickNipple] exposed in the open forest air, and when it reaches the head it slips off your cock entirely - brushing her tight palm over the glans and frenulum with tickling pressure. This is a lot like your other cock feels, inside her pussy. Somehow she knows, and can mirror the sensation of her pussy with just a hand. When the first hand leaves your cock, the other grasps the base and repeats the motion. Hand over hand. Her body over you. Her bouncing righting smacking impacts filling your ears and mind with a deep-hilted braingasm. She’s so close and you’re so completely locked inside her.");
	output("\n\nClimax arrives. Your entire breast goes pebbly with goosebumps and tenses up - becoming firm and heavy as cum prepares to flow along your nipple-shaft. The moment is here. Your breasts pulse, cum is squirting from " + (pc.totalNipples() == 2 ? "both cocks" : "each cock") + " and your mind sings its approval. An entire pleasure system wracked by her perfect milking. Everything else goes numb, joyously. It is like a tightness, a cramping in your shoulders - but then the cramp lets out. The tightness is gone. All over. All over your mind too. The tightness of life itself, in that moment, has no hold on you. You are cumming, and it is for her and in her and all through you. Spurt after spurt of cum flying into the air and coating both of her hands from the “free” dick, while the spreading cum pools and surrounds the one inside her. She laughs joyously at the geyser. You hear her sucking her fingers, lapping up the stuff. At least, she does that at first. Then her movement slows. She takes a single long deep breath, and another, trying to speak.");
	output("\n\n<i>“Oh, oh my...”</i> she manages to get out, then another noise you at first fail to realize came from the same body: <i>“Eeeeeeeeeeeee...”</i>");
	output("\n\nAn uncharacteristically keening emits from the woman above you. Your be-dicked and mounted tit quivers because her inner thighs are moving as though shocked. Streams of her sweet-scented plant cum flow down your breast in waterfalls. You try to catch a stream of her secretions in your mouth, but it is occupied and there is too much motion anyway. Streams of water and cum are scattered to paint the surrounding trees more readily than they manage to stay on your face.");
	output("\n\nJolt after jolt. She is still squealing. A glance up shows her shoulders and head lolling without resistance. No trace of sapience in her eyes, her belly swelling outward until she looks positively gravid. You wonder why. Oh, right. Your dick is still cumming, deep inside her. Spurting ropes of cum that paint the furthest walls of her sex then ooze back out onto your breast. She is too stuffed to take any more. Her swollen belly bounces against your own. There is labor in her rise-and-fall motion now, but she shows no sign of wanting escape.");
	output("\n\nYou feel her swollen form getting bigger, heavier with your cum on every downswing because she has never stopped riding. Pumping and swallowing your seed into her body somewhere. Your [pc.dickNipples] are absolutely slathered in her juices and your [pc.cum]. Her legs lock down, squeezing almost uncomfortably around your boob.");
	output("\n\nThe scream goes on and on, her entire body still in paroxysmic delight. She has stopped riding up and down, but the horizontal oscillation of her writhing hips is no more gentle on your body and psyche. Belly swollen from splendid geysers that swell her cytoplasm outward, until the walls of her seem strained with your incredible issue. Drool is running from your mouth, cum is still spurting from the free cock-nip as well and this has coated the ground for a foot around with a quantity of cum you did not think you had in you.");
	output("\n\nThe cramps return to your shoulders, and then release themselves with a combination of relief and lightheaded joy. Joy at her so full and getting heavier atop your well fucked breast. Her mind is in as much disarray as yours, and the <i>eeeeeeeeee</i> continues.");
	output("\n\n<i>Eeeeeeeee</i> her high orgiastic cry turning into- the sound of your alarm.");
	output("\n\nYou jolt upright in a puddle of your sticky nipple cum, " + (pc.totalNipples() == 2 ? "both" : "all") + " tit-toppers erect, and turn off the ship’s notification.");
	output("\n\nThat was a crazy dream.");

	pc.orgasm();
	//continues on to part 3 after this
	clearMenu();
	clearMenu();
	addButton(0,"Next",venusDreamEpilogue);
}

//IF no dicknipples but still dem big titties within this chesty portion, this instead
public function venusDreamsPartFucknormousTits2():void
{
	clearOutput();
	author("eSuccubus");
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("You’re nodding your consent before she’s even finished the proposal. Vines are already winding precisely around your ankles. The green slithering appendages stem from a hole beneath the woman. They lift you up, treating your weight like no burden at all. There is a moment of inversion as you are suspended by your ankles, hanging free and open with your eyes level with her mouth, and vice versa. Nothing between your " + (pc.hasLegs() ? "legs" : "thighs") + " is exposed, but your [pc.tits] try to fall and cover your face. This vulnerability occupies your mind for a moment, and then your nipples are being squeezed.");
	output("\n\nShe has drawn you close enough that she is using her fingers on your [pc.nipples], not vines. Her pinching and squeezing allows you to feel how smooth her fingertips are. No ridges or grooves there, only the smooth plant “flesh” pressing your nipples in. They perk up in response to her touch, and the vision of her lips curling up in a smile. You are close to her. You breathe deeply, letting your big tits and nips surrender to her. Your arms hang free. Strung up in helplessness, there is nothing you can do as she keenly inspects your breasts.");
	output("\n\nFingers massage so deep that you feel the sensitive nerve endings pulsing happy messages to your mind. With no other sexual contact to distract you. She is feeling you out, giving the impression she can feel right through to the interior structure of your [pc.breasts] with her greenish “tongue” between her lips. Her eyes are locked unblinking on the flushed and goosebump laden skin. As much as you can while hanging there, you try to rock against her palms and let her squeeze your tits.");
	output("\n\nShe wastes no time after feeling out their form and structure. The nipple tips are spread open. Smearing some greenish fluid on your nips, she presses them to their fullest extension. Small vines with grasping sticky tips pull the nipples and areolae forward, stretching the flesh of your [pc.breasts] to bring them into prominence. She moves so a light from some distant place can highlight and warm your boobs. Then there is a brief pinch at the tip.");
	output("\n\nThe smallest of her vines are weaving their way inside your nipples. It looks strange. You hang upside down, so the vines weave their way upward and in diagonally. Expecting discomfort, finding only pleasure. Tension along your breasts and into the muscles in your shoulders and back. Tight, and she is smiling.");
	output("\n\n<i>“Good, you have been so good. Accept me. Welcome my seed inside.”</i> She intones these and other words like them, allowing her beautiful harmonics to create arousal. Your nipples grow even more engorged. Seeing the vines vanish inside of them, they grow. Swelling outward, the inside of your breasts is full of vines and a cold sensation. Cold, numbing, filling. Her vines pump obscenely, showing fluid flowing along the inside of them and swelling your tits to their largest extent.");
	output("\n\nThen beyond, pleasure alongside it. Your mind is full to bursting, but your breasts can take much more.");
	output("\n\nYou are nodding, a strange gesture while hovering upside down. Nodding affirmation in a way that jiggles your breasts and makes the vines lash wildly. A second thin tendril joins each of the first ones, already pulsing with greenish fluid. Your breasts swell so much that your suspended feet dip lower in the air. The vines around your feet are having trouble holding you up as your boobs get so big they occlude the edge of your field of vision. Your eyes are busy rolling back, however.");
	output("\n\nSparks and spikes of joy. Life is filling you, the feeling of her life, of new life. The fluid is transmitting information. Information, genetic material, life. Your breasts shiver and vibrate with profound life and restoration. A safeguarding desire, a feeling of attachment, warmth, and kindness toward your breasts. You need to nurture these, protect these. The vines around your feet lower you to the ground and lay you out. The tips of the thin tendrils woven into your nipples can now move freely, pushing downward, then pulling back out. All sorts of spreading aching elasticity has been introduced into your breasts.");
	output("\n\nItching warmth from below... and then they grow. Growing so much that as you lay on your back you feel weighed down into the forest floor. Warm growing spurting fucking yes - the vines are fucking their way in and out of your nipples. She looms over you, smiling down, reaching out to stroke your forehead.");
	output("\n\n<i>“You have done so well. Good.”</i> She is kind, she is nurturing. You are safe. All of this is transmitted in a simple gesture.");
	output("\n\nThen she kisses your forehead.");
	output("\n\nYour breasts bounce and vibrate, cumming from within. You are cumming from being fucked full of her seed. Turned into fertile ground. Planted, filled, fulfilled, made part of her ecosystem. Your bouncing breasts occupy so much of your mind that the presence of any other sensory cluster vanishes into oblivion.");
	output("\n\nOblivious to your own state, your eyes white and then glowing green with need from within. Mouth drooling faintly green drool. Your forehead heated as she kisses it again. Another climax, more tender need, more wonderful ache. You are there for the vines to fuck your tits full of seeds and make you full. They are growing, getting bigger. Each burst of growth is accompanied by a mindless moan you are surprised to realize comes from your own mouth. Jumping off the ground a little, your whole body tense with good feelings, you notice that a third larger vine is reaching for your stretched nipples.");

	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",venusDreamsPartFucknormousTits3);
}
public function venusDreamsPartFucknormousTits3():void
{
	clearOutput();
	author("eSuccubus");
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("The vines fuck in and out, but they twine around the larger one, turning it into a nipple-fucking green dildo with flanges and bumps from the smaller vines it is “wearing”. Your nipples are numb to discomfort, as only pleasure remains. The pleasure of life growing inside of you. You can feel it stir, feel it spread, feel it filling and fulfilling your brain.");
	output("\n\n<i>“This is endless,”</i> she announces, as she once more kisses your head.");
	output("\n\nVision flashes green. " + (pc.totalBreasts() == 2 ? "Both" : ("The " + num2Text(pc.totalBreasts()))) + " breasts bounce against one another as the larger vines wetly fuck your tits deep. Fucking your nipples into wide spread holes for receptive mating. She is fucking you pregnant, and intent on her task. Then her delicate little hands, dwarfed by both your tits and the huge vines fucking your nipples, grasp your breasts. Pressing them together, creating a narrow valley of cleavage.");
	output("\n\nYou lay there as spurts travel along the vines. They swell before your eyes, bowing outward, letting waves of green seed that dwarf the previous flood into your tits. So much has filled them that some spurts back out and falls onto your chest, spilled upon you, marking you. Laying there, giggles and groans escaping a mind drugged and fucked. Your chest is close to your head, your mind, and it is using this shortened connection to over burden the sensory hub for pleasure. Each pulse travels such a short distance from the deep-fucked seedbed she has forged inside your body.");
	output("\n\nYour drooling mouth and fucked tits then combine perfectly. Slipping a vine into your mouth lets you taste a honeyed golden nectar. The nectar ends everything except the spasming almost-electric pleasure that makes your arms flail, tits quake as the vines pull out. You lay there shivering and trying to mentally withstand a chemical rush of happy ecstasy.");
	output("\n\nThe nectar-chemical is the end of all save incubation. Mind is gone, as there is only pulsing warmth and the joy of suspension. Like melting into the world, into nature, into the planet, like dissolving until there is nothing of your mind or personality left.");
	output("\n\nExcept pleasantly.");
	output("\n\nWalls inside your mind move, because perhaps more seeds can be planted there.");
	output("\n\n<i>“You are perfect,”</i> she says, sounding awed.");
	output("\n\nYour breasts have grown so much that she now places a lattice of vines underneath the tits to keep them from crushing you. These vines rise, as if on a winch. A small supporting platform of them is under you. Holding you up in the air to soak in light.");
	output("\n\nYour tits are turning green. The nipples are stretched wide. Every now and then, a joyous moment comes. She fucks you daily, your tits stretched and nutrients squirted in with the help of visiting pitchers who filter through the ground to come see this perfect seed bed.");
	output("\n\nThis exquisite you.");
	output("\n\nProtect, nurture, offer, submit, surrender.");
	output("\n\nYour breasts are so full, so big. They keep growing. Pleasure keeps arriving as your drool and sweat and excess seeds ooze from the nipple tips.");
	output("\n\nTime for birth arrives. They breach the sack inside your breasts with a warm forcibly drugged feverish beautiful euphoria. There is a squeaking sound as the seed pods spill free, you are turned once more upside down, out of the sun, dangled above her. You see her approving face looking up, and hear the squeaking squeak of emerging young.");
	output("\n\n<i>Eeeeeee....</i>");
	output("\n\n<i>Eeeeeeee....</i>");
	output("\n\n<i>Eeeeeeeee</i> the high satisfaction to your urge of seedbed “motherhood” and the daily doses of golden nectar.");
	output("\n\n<i>EEEEEEEE</i> the ship’s alarm going off.");
	output("\n\nYou jolt upright in a puddle of your sticky nipple cum, " + (pc.totalNipples() == 2 ? "both" : "all") + " tit-toppers erect, and turn off the ship’s notification.");
	output("\n\nThat was a crazy dream.");

	pc.orgasm();
	
	clearMenu();
	clearMenu();
	addButton(0,"Next",venusDreamEpilogue);
}

//Part 2 Else aka the normal version of the scene for people without tig bitties/dicknipples/bimbo brainpans
public function venusPitcherDreamsPartNormal():void
{
	clearOutput();
	author("eSuccubus");
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("Cold sweat coats your body. You reach between your " + (pc.hasLegs() ? "legs" : "thighs") + ".");
	output("\n\nWas it always that way? You swear you remember some other use you served, some other purpose orbiting around the space between your " + (pc.hasLegs() ? "legs" : "thighs") + ".");
	output("\n\n<i>“I suppose this will have to do,”</i> she says. Rather than use her vines, the green beauty reaches out her hands and you walk willingly into her arms. A passionate kiss, sealing your lips, cutting off both your protests and your self-flagellation. She tells you everything will be alright.");
	output("\n\n<i>“Do not worry, I have a plan.”</i> There is amusement in her voice, as well as exasperation. She is acting more like someone whose friend locked their keys in the car than a deprived sexual partner. She turns you around, facing out toward the forest. You feel something pressing against your butt. Something knobbly and thick, coated in juices or perhaps nectar.");
	output("\n\nLooking over your shoulder grants the briefest glimpse of a network of vines woven around one another to form a makeshift dildo - positioned right between her legs and rubbing against her visibly drooling sex. The tip is right against your hole. The beauty behind you grips the sides of your head and turns you to face front, depriving you of any sight of what she is doing. You only have your senses now.");
	output("\n\n<i>“Relax for me...”</i> Her mounds press against your back, the erect greenish nipples poking you with proof you’re turning her on at the prospect. Rolling your hips backward fills your ass with pulses and throbs, already relaxing, a desire to welcome her inside overwhelming rational thought. Thrust. Tip formed and bulbous, a nub or nodule of plant, perhaps a seed pod, spreading your ass and filling you with delight as your rim spreads.");
	output("\n\nSpreading makes every other pleasure sensor fire and you’re lost in the unique cooling tingle of her lubricating nectar before your eyes have even closed. But they do close. Collapsing into her arms with spasms, your body unable to disguise this sensation as anything other than the perfect ass fuck. She paused after one inch went in, but this sensation is all from your butt and her closeness and your sphincter squeezing on her big viney dick. So you roll your hips back again and again, aiding her. She slaps her body against your ass. Vines find their way up to stretch your lips wide, forming a gag at the corners, inducing the further feeling that you are only able to drool and suck and be open to her.");
	output("\n\nOne particularly large vine, golden nectar flowing from the tip, finds its way down your tongue. Your eyes swim and then go into soft focus at the taste of honey beyond honey, musk and the claimed essence of a thousand submissions to her all forced into your head by liquid and desire.");
	output("\n\nWell, that and her cock up your ass. Spreading, fucking, a full foot long but bendy and prehensile and able to find every place in the walls that touches where sex organs used to be. You are less complete outside, but finally completed within. The vine in your mouth flows down your throat, but some property of the nectar makes this a natural, comfortable, even comforting process. You suck the nectar deeply until it fills your belly and you go limp. Arms limp from the shoulders, " + (pc.hasLegs() ? "legs" : "thighs") + " nerveless and easy for her to spread as her vines and hands combine to raise you high up. Only the tip, the first inch, of her vined faux-phallus is within you. She lets you drop.");
	output("\n\nFalling onto her cock stretches your sphincter wide and brings answering reports from every nerve cluster in your body: she is fucking you, overriding all other sensations. There is only tightness in your ass and the way her mouth is open taking in deep breaths of thoroughly unnecessary air. The panting, the grunting, the eagerness in how she swings her hips. Each movement is carried to you and makes music in the air around you both.");
	output("\n\nSlap, smack, squish. So much lubricant and nectar inside that it flows back out onto the ground from your stretched well fucked ass. She is powerful and the vines around your wrists and ankles aid her in lifting and dropping you. Gravity bottoms you out and makes you its bitch every time you think you have a moment’s break from her long thick “cock”. You ride it deep, making sure to wiggle and squeeze your sphincter as tight as you can on the full hilting.");
	output("\n\nShe moans, she can feel it, and she is even more inspired to let go when her would-be fucktoy begins riding and bouncing. You can only move a little in her grasp, but a little is enough. <i>“Oh, such an eager [pc.boyGirl]... I shall have to help you express both that desire, and all of your fluids...”</i> She pauses, smirks, whispers something: <i>“Oh, but you cannot.”</i>");

	pc.changeLust(20);
	clearMenu();
	addButton(0,"Next",venusPitcherDreamsPartNormal2);
}
public function venusPitcherDreamsPartNormal2():void
{
	clearOutput();
	author("eSuccubus");
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	output("That reminder does it. There is no way for cum, for juices, for anything to leave your body. No way for the pleasure to escape. She keeps fucking your ass, now at a piston’s rapid pace. She does not stop her movements. Occasional strokes vary in intensity, stopping just short of a full hilting so that your ass has to clench around a different part of the thick viney shaft. Her fucking has made you the shape of her, in her strong arms.");
	output("\n\nNow her hands grip your hips, leaving an impression, fucking you full of her. You stay there trembling. Something is cumming but it has nowhere to escape.");
	output("\n\n<i>“So close...”</i> she groans from over your shoulder. Does she mean you? Yes, close. Tightness and tension in your lower body is preparing to release itself in a final moment where nothing has any hold on your mind but her. You will melt into sweet green embrace and submit thoroughly to her shaft. You tell her as much and she only smiles a pained smile.");
	output("\n\n<i>“No, me...”</i> she says. And then succumbs.");
	output("\n\nHer vines inside your ass corkscrew with lubricated and exquisite speed. Your ass is being quite literally drilled, the walls hit with bumps and ridges of varying hardness so often that the sensations build up. A dam breaks, your head lolls, your entire body nervelessly falls into her grasp like a puppet with its strings cut, but so does she.");
	output("\n\nOrgasmic screaming, she falls back and down into the hole, the underground chamber her pod hides in or emerges from. You are in her arms. The fall is relatively slow. You are hilted the whole time, letting senseless tons emit from body and brain as your ass belongs to her green intruding presence. You sit on her lap as the two of you descend to a place that is darker, warm, full of roots and earth but also a flow of tons of air and such a comfortable temperature it might as well be air conditioned.");
	output("\n\nShe is cumming. You know it by the eagerness of the vines, the way she fucks you a few extra times during the descend to her subterranean home. The keening whine. You turn over your shoulder and give her an overfucked look as you suck the vine still buried in your mouth. Her expression is untidy and unfocused, her own mouth hanging open with some gold and green mixture running from the corner. She smiles back at you and grabs your hips.");
	output("\n\nWith her lower plant structure shuddering in a way indicative of climax or some less knowable sensation, the vines begin to vibrate. She grabs your hips, raises you, prepares to bring you down for a gravity-aided impalement. The light in her eyes is hungry, a hunger never before seen.");
	output("\n\n<i>“You look so good on there. I believe you should stay.”</i> Her voice rings with odd harmonics, underground. The forest floor has closed with vines far overhead. The only light is the green glow of her eyes, glistening as her nectar continues to fill your ass alongside the vined strapon.");
	output("\n\nMore vines join the one circle-gagging your mouth into a drooling fuckhole. Now your mouth is full. Groans and grunts are possible, but when nourishing food and nectar flow down your throat alongside the aphrodisiacs, not even that. An attempt to squirm away from her green vine-strapon is futile, and it just invades more fully. She fucks you until you fit her perfectly, body and mind.");
	output("\n\nShe cums often, a squealing sound you didn’t expect.");
	output("\n\nPart of her, in that chamber far below. Mouth full, ass full, nothing else present or relevant. Her vines meet in the middle, integrate, seed, fill and fulfill. Every now and then your ass spasms in a buttgasm beyond imagination. She learns the places that stimulate what were once sexual organs. It is perfection. Eventually she meets others, you sense her talking to them, sense their presence.");
	output("\n\nBut you are an organ, an extension, a part in that tiny chamber. You have one function.");
	output("\n\nEvery now and then, your squeezing clenching ass makes her cum hard enough to squeal.");
	output("\n\n<i>Eeeeee.</i>");
	output("\n\n<i>Eeeeeeeee...</i>");
	output("\n\nThe ship’s alarm notification goes off, and your hands scrabble between your " + (pc.hasLegs() ? "legs" : "thighs") + ", finding your");
	if(pc.isHerm()) output(" [pc.cocks] and [pc.vaginas] just as they");
	else if(pc.hasCock()) output(" [pc.cocks] just as " + (pc.cocks.length == 1 ? "it" : "they"));
	else if(pc.hasVagina()) output(" [pc.vaginas] just as " + (pc.vaginas.length == 1 ? "it" : "they"));
	else output(" body just as it");
	output(" should be. There is an incredible mess on the bed.");
	output("\n\nYou turn off the alarm, sigh, and try to compose yourself.");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",venusDreamEpilogue);
}

//Part 3 of the scene
public function venusDreamEpilogue():void
{
	clearOutput();
	author("eSuccubus");
	showBust("");
	showName("VENUS\nPITCHER...");
	output("You lay there catching your breath, and consider how to navigate to the shower with a minimum of further stickiness. Except, there is something more important. Your ass is squeezing, clenching, tingling, trying to get your attention. Something squirming under the covers. Moving them aside reveals vines, winding up the hatch of the ship, into your room, between your " + (pc.hasLegs() ? "legs" : "thighs") + ", pressing into your ass. Promptly they begin to vibrate and some strange golden fluid oozes out of your ass. Spurted inside by the moving vines. They wind around each other. Pleasure, pleasure, surrender, the buzzing psychic imprint of something more powerful than you.");
	output("\n\nHands clamoring to stimulate your body, you feel your [pc.legOrLegs] tugging you out of bed...");
	output("\n\nYou begin to follow the vines, back to their source.");
	output("\n\nBack home.");
	clearMenu();
	addButton(0,"Next",venusDreamsEpilogue2);
}

public function venusDreamsEpilogue2():void
{
	clearOutput();
	author("eSuccubus");
	showBust("");
	showName("WAKING\nUP...");
	output("With a jolt");
	if(pc.hasGenitals()) output(", still coated in cum");
	output(", you bolt out of the bed the moment you wake. This time making sure you’re really upright. You pinch your skin, you let the reassuringly cool air of your room assure you. You check for vines. None.");

	output("\n\nThe ");
	if(pc.hasCock() || pc.hasDickNipples()) 
	{
		output("[pc.cum]");
		pc.applyCumSoaked();
		if(pc.hasVagina()) 
		{
			if(pc.cumType != pc.girlCumType) output(" and [pc.girlcum]");
			pc.applyPussyDrenched();
		}
	}
	else if(pc.hasVagina()) 
	{
		output("[pc.girlcum]");
		pc.applyPussyDrenched();
	}
	else if(pc.hasStatusEffect("Sweaty")) output("sweat");
	else output("drool");
	output(" is absolutely everywhere.");
	pc.orgasm();
	//if there are status effects involving being covered in cum, put them here! Also like, maybe lust set to 0
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Completing the Circuit
//self facial scene, for penis-havers
public function venusAutofellateDream():void
{
	dreamCheckCock();
	
	clearOutput();
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	author("eSuccubus");

	output("Your hazy brain notices the slightest discomfort, first. Your shoulders and back are on the ground, lower body from the waist down leaned against something so you form an obscene “L” shape with your ");
	if(pc.hasToes()) output("toes");
	else output("[pc.feet]");
	output(" pointed at the ceiling and [pc.cockBiggest] pointed at your face. Hard. Your [pc.butt] is exposed and slick from some spreading nectar. Dripping from the tip of a long ridged vine - prehensile, flitting, and teasing around your rear entrance. It pushes inside, and all is squeezing walls as your butt welcomes it. Your prick begins to drool long streams of pre-ejaculate right onto your face. This is just the start. It feels electric as the obscene butt-searching vegetation does anything but vegetate: it latches right onto your prostate and attaches with a tiny suction cup. Oblivious from the onslaught of white-hot pleasure, you don’t notice a cum-seeking sheath of leaves descending from above until it is wrapped about you. It leaves the tip of your dick free to drool into the open air, but otherwise jerks your shaft like a soft and verdant hand.");

	output("\n\nPrecum oozes down your taut stomach and flows onto the ground below: a sign that you are somehow ‘incomplete’. Your cock agrees, pulsing and waiting, waiting for the thing that will let it cum. It only takes you a moment for your mouth and tongue to volunteer, instinctively forming a welcoming carpet. Suction. That’s what’s missing...");

	output("\n\nWith the help of a supportive green hand on your butt, your body bends impossibly and the tip of your cock enters your mouth. You taste plant nectar drooling from the leaf-onahole as your eyes roll back, and the vine in your ass goes wild with insistent hammering pulses. No vibrator could make you hum so hard, and no other additive could make your own [pc.cum] pulsing down your greedy gullet quite so sweet. Comforting, mind-filling, shock-jolting orgasm makes you uselessly fatigued, and the vine keeping you in place feels more and more natural when it is impossible to fight.");

	output("\n\nSucking yourself is shockingly pleasurable. You never realized how warm your own mouth is. Somehow your entire length pulses down your throat. You are a self contained system for pleasure. Your only need is the vine invading your overfucked rear and asserting dominion over your prostate. The electric buzz keeps you sucking, keeps you in place, and keeps your eyes fixed on the approving smile of the curvy green woman pulling you down underground and into her lair when-");
	
	if(!dreamNewCock)
	{
		output("\n\nYou awaken with a start, somehow having propped yourself against the edge of the bunk in just the right position to deliver a sloppy self-facial blast from your spent and softening [pc.cock].");
		if(pc.balls > 1) output(" Your [pc.balls] are still taut against the base muscle and are churning as though eager to go another round.");
		pc.applyCumSoaked();
	}
	else
	{
		output("\n\nYou awaken with a start, somehow having propped yourself against the edge of the bunk and stroking... your phantom cock?");
		dreamResetCock();
	}
	output(" Pity it was just a dream... surely such delights exist nowhere in the universe.");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Every Inch
//messy plant nectar fucked-full scene for vagina havers
public function everyLittleInchDream():void
{
	dreamCheckVagina();
	
	clearOutput();
	showBust("VENUSPITCHER");
	showName("VENUS\nPITCHER");
	author("eSuccubus");
	output("The lengthy plant stamen invades your mouth. You are tormenting your cunt and pinching your clit. You can’t help it. The sweet syrup that plant prick is flooding your mouth with is thick and delicious. It makes you hot from the inside out until you sway your hips like a bitch in heat and try to shove more fingers inside your fuckhole. Your pussy is opening like a flower, the engorged lips spreading. Turning your eyes upward only shows you the length of the long green-skinned dick descending from the futa flower above you. Her cheeks are tinged deeper green with arousal - and her breasts are bouncing with each thrust.");
	output("\n\nShortly after your tongue touched the sticky syrupy coated length, she began to fuck your face. Now you’re in a world where this gorgeous lady is hammering your lips and throat. Drool and her golden nectar leak from the corner of your mouth. Every swallow you make is rewarded with more of it. Her pleasure is obvious and sincere, as her own mouth is hanging dumbly open. You watch her tits bounce around with the ferocity of those thrusts. Your face is surrounded by her thighs every time she hilts deep, and her dick discharges right into your stomach.");
	output("\n\nYour throat is stretched and your eyes are watering. She shows no signs of letting up, no emotion at all save pleasure. No sound but the slap of her wet thighs and the brief murr of appreciation as your pussy is forming more than droplets, more than streams. A spreading, viscous puddle of needy fucksign has so permeated the ground that it is beginning to pool half an inch deep around your knees and feet.");
	output("\n\nYou’ve never been so wet.");
	output("\n\nYou feel a flash of pride at the drool on the ground, there to paint you as a wanton slut for her cock in the eyes of anyone lucky enough to stumble upon this place. Your tongue slides on the bottom of the plant lady’s shaft, getting out of the way so your warm vacuum sealed mouth can take as much veiny viney fuckstick as possible. You give pleasure and she finally grips the sides of your head and holds you deep. No more bobbing, no more swaying, no more fucking. Stillness. Then the taste.");
	output("\n\nHer shaft is seated to the back of your tongue and it is spurting something divine.");
	output("\n\nShe groans deep and you feel the cock vibrate. Something oozes from it, and her hips shake against your face with each thrust, spilling precious droplets to paint your chin and neck with a thicker seed. You redouble your suction. You won’t let it escape.");
	output("\n\nThere is no way to tell when the transition happens. One moment you’re providing oral service to a woman, using an organ that is very much yours - mouth and tongue and all - and then an instant later your throat is a cock sleeve, because there is no way to think or be a person on the other side of that nectar. Nectar, sweeter than before. Your vision blurs. Your head seems to shake. You taste your own thoughts as they turn to liquid syrup on your tongue and flow down into your belly.");
	output("\n\nYou are no longer fingering your pussy because it is cumming. A white hot nerveless explosion. All mind and soul and your submission to the cock, your worship of it, your drinking in. Your hands have instead reported to their new home: fondling your warm and swelling belly as she distends it with her sublime seed. Swelling out under your hands as if pregnant. You are. Impregnated with the knowledge of your new home - flooded with her cum.");
	output("\n\n<i>“We have two more holes to fuck.”</i>");
	output("\n\nTears actually form at the corners of your eyes when she says it. Joy and silence and a blissfully quiet anxiety-free mind. For a moment, her cock leaves your lips - with that huge loud pop of escaping forceful suction and your instinctive suckling motions - just for a moment, and you think maybe you can run.");
	output("\n\nBut now your pussy and ass are relaxing to welcome her cock, and your weak arms and legs are barely managing to turn you in your own puddle of slick feminine want. Your belly holds you somewhat off the ground, still sweetly full. Your tongue is sticky. More than just your belly has been filled. Your mind is trying to move through nectar, filled right up to the brim of the tank. She seals your fate.");
	output("\n\nIf this is what happens when she fucks your belly full, where will you keep your mind when she’s flooded your ass and pussy too? You present them both for her appreciation: face down, ass up.");
	output("\n\nBefore the thrust you were still just barely pondering what will happen to the few thoughts that haven’t turned to nectar and leaked out of your cunt. That thought liquefies too. Eyes rolled back in your head, nectar dripping from moist lips, spread. Around her. She’s deep inside and your pussy is cumming just from insertion. In the midst of one orgasm, being fucked to another, sweet blank smiles stealing time on your face.");
	output("\n\nYour clit sings oversensitivity that would make you back away from any normal lover, that would require you to have a breather to just feel pretty and free and alive and safe and like your own person again.");
	output("\n\nInstead you roll into it, working your oversensitized nub against the top of her cock as your brain turns to nectar and a slow, happy, drugged giggle escapes when she begins pushing your bouncy, cum-inflated belly against the ground on every obscenely squelching thrust.");
	output("\n\nYour quivering pussy doesn’t stop its overload of torment until the moment you are listening to a beeping alarm clock and grabbing sheets instead of sex-moistened leaves on the forest floor.");
	if(!dreamNewVagina)
	{
		output("\n\nAnd tears are in the corners of your eyes again, as you resolve to get dressed once the flood has been cleaned up.");
	}
	else
	{
		output("\n\nRecovering from your orgasmic ordeal, you prepare to wake up... finding that you are missing your [pc.vagina], not needing to clean the imaginary flood below you.");
		dreamResetVagina();
	}

	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//This dream should have a random chance of occurring if the PC has completed Kaede’s Uveto encounter, and has Anno as their sleeping partner. Requires a donger.
public function annoAndKaedesGinormousTiddies():void
{
	dreamCheckCock();
	
	clearOutput();
	showBust("KAEDE_NUDE","ANNO_NUDE");
	showName("KAEDE\n& ANNO");
	author("HugsAlright");
	if(silly) author("HugsNotAlright");
	output("<i>“Ooooh yeah...”</i> you moan, letting your eyes open as a tingle of pleasure rushes through your body, <i>“That’s the stuff.”</i>");

	output("\n\nA groan of bliss escapes your lips as your [pc.eyes] meet Kaede’s blue puppy-dog eyes, your [pc.cock] held firmly amidst her big, soft titties while the puppy sits happily between your legs. ");
	if(pc.cocks[0].cLength() <= 12) output("Your [pc.cockHead] is just barely able to poke out beyond Kaede’s cleavage and right into her mouth, where it’s lavished with oral affections.");
	else output("Your [pc.cockNoun] is well sheathed in Kaede’s cleavage, though a fair amount remain remains uncovered and unloved. Luckily, those excess inches are quickly gobbled up by the eager-to-please halfbreed, taken into her warm, wet embrace of tongue.");
	output(" Void, she’s gotten really good at these titjobs since she took those breast mods she mentioned, not to mention the hefty pair of G-cups suit her well. Speaking of, Anno is positioned just behind her, guiding her girlfriend’s head onto your cock while sporting a rather similar bust: nice and big and soft and... milky.");

	output("\n\n<i>“How’s she doing, boss?”</i> The snowy-haired ausar asks, giving her half-breed lover a good push onto your cock, making the poor puppy whine.");
	output("\n\nYou can hardly resist sinking back in your seat at this point, and manage to respond to Anno with a half-hearted <i>“Perfect.”</i>");
	output("\n\nYour ausar lover smiles wide at that, running a velveteen hand through Kaede’s hair until the red-head’s ears start twitching, <i>“Keeping going, babe, just like that.”</i>");

	output("\n\nWith that command given, Anno pulls her hand back and stands up, massive tits wobbling as she straightens herself and flashes you a lustful grin. A moment later she starts to saunter towards you, making sure to have her big, milk-leaking breast jiggle and quake as much as possible until she reaches you. Taking a seat on the arm of your chair, she swings arounds so her bountiful jugs are right in your face, beads of milk already forming on her big, pink nipples, <i>“How about a drink to go with that treat?”</i>");
	output("\n\nBefore you have a chance to respond, Anno’s already shoving her big, soft titties all up in your [pc.face], which quickly falls into the valley of her cleavage. You let out another groan as your cheeks are caressed by ausar boobflesh, so warm and kneading, but Anno didn’t come here for a motorboating; you reach up and grab at her breasts with an impassioned fervor, immediately giving them a good squeeze once they’re in your hands. She mewls as you have your way with her chest and places a hand on your head, running it through your [pc.hair] and slowly guiding you to one of her stiff teats. You eagerly accept her nipple into your mouth, letting your lips wrap around it and flicking your tongue across it, resulting in a pleasured gasp from Anno. You’re not all that surprised to find her lactatious bounty already dribbling onto your [pc.tongue]; she’s been extra-milky since she’d taken the same mods Kaede had, to the point where you and the fiery-haired shemale need to drain the ausar regularly.");
	output("\n\nNot wanting any of the ausar’s bounty to go to waste, you begin suckling on Anno’s stiff nipple, drawing more milk out onto your tongue to flow down your throat, and drawing a few lewd moans from the snowy-haired slut as well. With your free hands you continue to grope at the big-breasted girl’s leaky jugs, squeezing and kneading them to draw out more of her bounty, and causing her grip on your head to tighten. All the while, Kaede is still hard at work on your [pc.cock], rubbing her big, soft breasts all over your shaft, keeping it nice and warm in the cleavage of her pillowy chest while her mouth lavishes your [pc.cockHead]. Between the caress of your lovers’ combined boobflesh, and the rigourous blowing and mouthful of milk you’re receiving, you find yourself in bliss. You content yourself to sink back in your seat and moan onto Anno’s pink, milk-leaking teats as her red-headed girlfriend brings you closer and closer to orgasm with every shift of her tits and every movement of her tongue. With all that going on and Anno’s near-ceaseless moaning and groaning into your [pc.ear], it’s no surprise you’re already so close to your climax, able to feel hot [pc.cumNoun] pooling in your urethra and you loins burning with the need for relief.");
	output("\n\nWell, there’s not much point to holding back any longer; you let your willpower slide away as a low grunt makes its way out your lungs before it’s quickly muffled by the milk-dripping nipple in your mouth, your limbs tensing with the power of your ensuing orgasm. Your [pc.cock] spasms as bliss overtakes your senses, already dispensing its load of [pc.cum] into Kaede’s mouth, her lips still wrapped firmly around your cockhead. You moan and shiver as your climax continues, ");
	if(pc.cumQ() >= 1000) output("and although you can’t see it, you can hear yours and Anno’s ginger pup whimper as her tummy distends under the pressure of your tremendous load.");
	else output("listening to your ginger pup gulp down each shot of spunk you have to offer her.");

	output("\n\nEven as your peak is passing, and afterglow flowing through your veins, you feel the need to keep yourself latched onto Anno’s pink nubs, to listen to her moan, to drink in more and more of what she’s giving you, even as her girlfriend continues to polish your cock with her cum-soaked tongue.");

	output("\n\nYes... you need more. You can feel your mind crying out for it: <i>“MORE! MORE! MORE! MORE!”</i>");
	output("\n\nOver and over: <i>“MORE! MORE! MORE...”</i>");
	output("\n\nEventually, though, all those cries off <i>“More!”</i> begin to change, like your name is being called: <i>“[pc.name]! [pc.name]! [pc.name]!”</i>");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",annoKaedeTiddyDrama);
}

public function annoKaedeTiddyDrama():void
{
	clearOutput();
	
	if(flags["CREWMEMBER_SLEEP_WITH"] != "ANNO")
	{
		showBust("");
		showName("\nWAKING...");
		
		output("You suck in a deep breath as you’re suddenly ripped from your sleep, and your pleasant dream subsequently, only to hear your name suddenly fade into the sound of your codex’s alarm beeps, paired with the humming of your ship against the ambient silence.");
		output("\n\nOh, it was just a dream...");
		output("\n\nDisappointed, you");
		if(!dreamNewCock) output(" rub away the mess of [pc.cum] from your [pc.cockHead] and");
		output(" proceed to wake up.");
		if(flags["CREWMEMBER_SLEEP_WITH"] == undefined) output(" Now if only Anno was here besides you...");
		
		dreamResetCock();
		
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		
		return;
	}
	
	showAnno();
	author("HugsAlright");
	
	output("You suck in a deep breath as you’re suddenly ripped from your sleep, and your pleasant dream subsequently, only to hear your name still being yelled... and something warm and stiff still between your lips.");
	output("\n\nLooking up, you see Anno, very out of breath, and her face red with lust, halfheartedly trying to get your attention with each call of <i>“[pc.name]...”</i>");
	output("\n\nYou stop and realize the girl’s nipple is still in your mouth, and you quickly relinquish it as its snowy-haired owner turns to look at you, the sudden absence of your tongue on her teat getting her attention.");

	//ifSilly:
	if(silly) output("\n\nWait! This is not your beautiful house! These are not Anno’s massive milk-leaking breasts!");
	else output("\n\nYou’re quick to realize none of what you just dreamt actually happened, looking around to see not a single pair of breasts above a D-cup, nor any ginger half-breeds attached to your cock, leaving you with a slight pang of disappointment.");
	output("\n\n<i>“Oh...”</i> she moans, <i>“You’re finally awake, you’ve been, uh... doing </i>that<i> for a while now.”</i> With that last word she nods her head to get you to look down, and you do so, only to see you’ve");
	if(!dreamNewCock) output(" covered this pup’s tummy in your [pc.cum], your [pc.cockHead] still gently leaking onto her smooth stomach");
	else output(" been humping the pup’s tummy with your crotch");
	output(".");
	output("\n\nYou look back up to the girl’s nipples, still stiff and a bit reddened from your sleepy suckling... and all too succulent for you to resist.");

	if(pc.isNice()) 
	{
		output("\n\n<i>“Mind if I keep going?”</i> you ask with a lick of your lips, prompting Anno to smile up at you.");
		output("\n\n<i>“Never asked you to stop, boss,”</i> she responds with a wink and a playful giggle, wrapping her arms around your waist to hold you tight.");
		output("\n\nWell, with an invitation like that, how could you resist? You quickly bring your head back do to your lover’s breasts, flicking your [pc.tongue] across her nipple a few short times before you let your lips close around it, gently suckling until little gasps of ausar pleasure fill the air.");
	}
	//pcMisch:
	else if(pc.isMischievous())
	{
		output("\n\n<i>“I’m just gonna keep going, then,”</i> you say with a smirk, winking at Anno before you bring your lips right down to her teats again, teasing her with your [pc.tongue] until she gasps with pleasure.");
		output("\n\nCompelled by her lust, the snow-white ausar grabs at your head and pulls you straight onto her breasts. You smile to yourself and quickly set yourself to sucking on her milkless nipples, enjoying all the blissful sounds your lover is making.");
	}
	//pcHard:
	else
	{
		output("\n\nYou don’t say a word, but quickly place your mouth back onto one of Anno’s still stiff teats, drawing a surprised gasp from your lover. Then you start to move your tongue, flicking it across the girl’s nipple, causing her to sigh lustfully, wrapping her arms around your waist to keep you where you are, compelling you to restart you suckling. Though, much less milk is to be found this time.");
	}
	output("\n\nNo doubt you’ll need to stop and get moving again soon, but for now you can lie here and savor the moment with your");
	if(!dreamNewCock) output(" cum-covered");
	output(" lover.");
	
	dreamResetCock();
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Demon Dream
//By: Doots
//(Requires Sera to be PC's mistress.)
public function demonDream():void
{
	clearOutput();
	showName("\nDEMONS?");
	author("Doots");
	output("The faint smell of sulfur and the blazing heat that are ever present in your master’s domain wakes you from your rest. Looking around the modestly sized cave you don’t see your master anywhere. It seems that he has already left. Since your master isn’t here, you decide to prepare for his inevitable return.");
	output("\n\nDiscarding your barely modest trappings you glance at the crystal formation on the opposite side of the room. A tall red skinned woman stares back at you. Her onyx hair flows over her large F-cups, and a dark liquid oozes heavily from her nipples.");
	if(pc.biggestTitSize() < 11) output(" You’re happy that your master decided to take the time to improve your body. His wishes are your wishes, after all.");
	output(" You continue to stare at the crystal. Looking up from her amber eyes, you spot two small horns poking from her forehead, colored a beautiful dark red. She has a smooth belly with her master’s symbol tattooed around her cute belly button, and her hips are befitting those of a prized breeder. Turning around you gaze at her butt and see two cushiony cheeks perfect for grabbing, or for a hard spanking; and a spaded tail curling above it, perfect for teasing. Turning back around you gaze at her pussy, hairless and plump. Despite how small it looks it can easily accommodate your master’s length.");
	if(pc.hasCock()) output(" Your master wasn’t happy when he saw your [pc.cockNounComplex], but your master found a way to get rid of it without hurting you. You don’t miss your [pc.cock], you have no use for it anymore; your master would never allow you to use it.");
	output(" All in all the woman looking back at you is a true trophy wife for a demon of your master’s status. You are happy that your master loves you, and you are happy to belong to him.");
	output("\n\nFinally done gazing at yourself, you walk over to the pool area. There are a few servants lazing around, but you dismiss them with a wave of your hand. They scurry off, after each bows down to you of course; they wouldn’t want to anger their master by disrespecting his most prized possession.");
	output("\n\nWalking down the stairs to the pool of magma, you head over to a corner where the molten rock flows in a beautiful waterfall. Letting the hot liquid ooze over you, you pull your hair back before you start running your hands along your smooth skin, cleaning off the sweat you worked up last night. You work over every inch of your red skin, your hands brushing over your impressively sized breasts. From the corner of your eye, you can see your master’s servants peeking from around the corner. You snicker to yourself. They know that they aren’t allowed to watch you bathe, but they just can’t resist. They are pathetic, horny creatures. You decide it would be fun to tease them for a bit. Bending down to wash your legs you give them a perfect view of your smooth asshole and the puffy lips of your pussy. By now you are sure they are jerking off, there is no way they can resist your form; since you are a forbidden fruit for them it makes you twice as sweet.");
	output("\n\nThey are an unimportant diversion however, it is time to get back to what you were doing, cleaning your body in preparation for the master’s return. You can’t forget to wash the most important part, your pussy. Turning back towards the doorway you slide one hand over your pussy lips, a lone finger slipping between them. You just can’t help yourself. Biting your lower lip you twist your nipple, oozing some dark liquid onto your fingers. From the doorway, you hear a breathless moan and the sound of seed splattering onto obsidian. <i>“You’d better clean that up. If master finds out he’ll have your heads on a pike.”</i> You laugh softly at their panicked scrambling.");
	output("\n\nYou settle down and into one of the more shallow areas of the pool, letting the heat work out any knots you worked up last night. After cleaning up their mess a small and timid servant brings you a drink, trying not to look at your breasts. You can’t help but tease him and raise your massive cups above the magma as you pick up the glass. His shaft gives a twitch in approval, and he hurries off before you can continue your cruel teasing.");
	output("\n\nAfter drying yourself, you decide to go back to your room and pick up your clothes. However, when you walk back to the room where you left them you feel a pair of hands gripping you by your hips. Not the diminutive hands of the servants but the hands of a true male. Your breath catches in your throat, your master is back! Looking down between your legs you see your master’s length thrusting between your thighs. <i>“You missed your morning service dear, you’ll have to start with that,”</i> he growls into your ear, voice heavy and deep. His command sends a shiver down your spine.");
	output("\n\nHe turns you around and pushes you to your knees, then places his dick in front of your face. It’s so close its head is bopping in excitement against your nose. Your eyes gloss over as you look at your master’s dick. It is at least four inches thick, twenty inches long, veiny, and covered in small nubs. <i>“You know what to do my dear.”</i> You do this every morning, so of course, you know what to do. You guide him into your mouth, swirling your tongue around its head, drinking down your master’s pre. <i>“That’s a good girl, but you need to do more than that.”</i> You look up to your master’s eyes, directly into those crimson irises surrounded by a pure black void. Following his command you plunge deeper, taking more of him into your mouth hole. The nubs along his length scrape against your throat. Someone inexperienced would gag around him, but you’ve done this enough to control your gag reflex. After a few more seconds of swallowing his length, your chin bumps into his massive balls. Both of them are larger than your head and seem to swell with his load. You fondle his sign of virility, it takes both hands just to worship one of his testicles. You lift them to test their weight, to feel the amount of cum that is going to end up inside you.");
	output("\n\nYou snap out of your dick induced haze when he pulls out from your throat, only to slam back inside. Seems like he decided to take the initiative and started to fuck your throat. Well, it’s his right to, he does own you. Settling down while he takes his pleasure from your throat, you concentrate on breathing every time he pulls out.");
	output("\n\nWanting to give your master more pleasure, you start to rub his balls. It takes both of your hands to hold your master’s orbs. Lifting them and rubbing them you try to help release his cum. You can hear them slosh with his seed, becoming heavier and heavier, producing more and more cum in preparation of pumping his bitch full. You start to salivate at the idea of drinking directly from your master’s cock.");
	output("\n\nHis dick starts to pulse in your throat, and before you know it, he starts to thrust and pump his seed down your gullet. Your stomach slowly bloats, but he continues to unload more of his cum in a seemingly never ending stream.");
	output("\n\nYour vision starts to darken, but he keeps your head tight against his crotch. Just before things fade to black he pulls out, causing you to gasp for breath. <i>“What do you say?”</i> He leans your head back, looking deep into your eyes.");
	output("\n\n<i>“Thank you, master.”</i> You say, licking your lips as you stare at his cum covered cock.");
	output("\n\n<i>“That’s a good girl. Now, clean me up and get ready for the next round.”</i>");
	output("\n\nFollowing your master’s orders, you lick along his length and collect the leftover cum, gathering mouthfuls of it before swallowing it down. When you are done he picks you up, hoists you over his shoulder, and walks back to the bedroom.");
	output("\n\nHe throws you onto the bed before crawling over you. <i>“Present yourself for me,”</i> he states. Once you do he gropes at your breasts, kneading at your ample tit flesh, and twisting your nipples. He soon brings one of your nipples to his mouth and starts to nibble on it, then pull at it with his teeth. After a while of your master playing with your nipple, you start to ooze your master’s favorite liquid. Drinking it down eagerly he starts to pay more attention to your other breast, flicking your free nipple with his claws.");
	output("\n\nYou get hornier as your master suckles on you, the liquid serving as an aphrodisiac for him, not that he needs it, though. Looking down you see the effect, his already erect shaft is engorging, the veins covering it thickening, and the nubs flaring. Spreading your legs, you wrap them around his hips, bringing him closer to your leaking pussy. Resting his tip at your pussy he whispers in your ear: <i>“Beg.”</i>");
	output("\n\n<i>“Please master, I need you inside me. Please fuck me!”</i>");
	output("\n\n<i>“Well, if you really are that needy.”</i> With that he starts to push inside you, not stopping until the head of his shaft rests at the entrance of your womb.");
	output("\n\nYour master has made sure you won’t get pregnant, no matter how much he cums inside you. Even when you beg your master to give you a litter of spawn he just smiles. Still, you hold on to hope, wishing that your master will someday change his mind. But in the end, your master does know better than you.");
	output("\n\nYour master’s tongue invading your mouth snaps you from your daydreaming. Wrapping your arms around his neck you start to wrestle with his tongue, but it quickly wrestles yours into submission. With your tongue subdued he pushes his own slippery organ deep down your throat, fucking your esophagus while his dick starts to drill at your pussy.");
	output("\n\nHe brings one hand down to your pussy and begins alternating between rubbing your clit and pinching it, while his other hand brushes along your side, leaving a tingling sensation.");
	output("\n\nSuddenly you find yourself on top of your master! He’s hammering into you from below, allowing him to thrust into you with full force. His hands are raking your back now, and he has switched back to sucking on your breasts.");
	output("\n\nYou feel your limit fast approaching. With those nubs rubbing along your love-tunnel, you are starting to leak like crazy. With a heavy thrust, you find yourself thrown over the edge, screaming your pleasure out for all the world to hear.");
	output("\n\n<i>“Tell me, dear, do you want me to cum inside you?”</i> He gazes at you, his hips still pumping at you.");
	output("\n\nYour fuck hazed mind has trouble answering, but eventually, you get a hold of your vocal cords and gasp: <i>“Yes!”</i>");
	output("\n\n<i>“That was a rhetorical question, I already knew that.”</i> He laughs as he slaps your breast and pulls on your nipple. After already cumming once, this treatment has you barely holding on. After several heavy thrusts, he hilts deep inside you, his plentiful load spilling into your womb. As he pulls out from your cum filled cunt, his hand starts to pull your butt cheek aside, while his finger rubs at your pucker. <i>“Your needy ass hasn’t felt the touch of my cock today. We can’t have that, now can we?”</i>");
	output("\n\nYou groan, exhausted from master taking you twice already. Nevertheless, you climb off him and turn around on the bed. Getting onto your hands and knees, you present your ass for your master.");
	output("\n\n<i>“You’re a bad girl for oversleeping, and bad girls deserve punishment.”</i> Just as he finishes talking, his hand connects with your butt cheek, resounding with a meaty slap. You start squirming and struggling, not because it hurts, but because you want him to fuck you already. Your cum stuffed pussy engorges again.");
	output("\n\n<i>“You could at least act like you’re being punished. Maybe I shouldn’t fuck you; that would be a fitting punishment for a needy whore like you.”</i>");
	output("\n\nThe thought of master leaving you like this is nightmarish. Lifting your ass higher, you start begging your master to fuck you.");
	output("\n\nHe ignores your needy begging, continuing to paddle away at your ass. Only when your cheeks are stinging with his hand prints does he stop and begin pressing one of his digits into your overflowing pussy. He begins fingering you until his digit is covered in his own leftover cum. You flinch as he slaps your ass again, and begins pushing his cum covered finger into your asshole. After running his cum covered finger along your rectal walls, he finally pulls out once your asshole is slick and wet with his seed; only to be quickly replaced by his cock.");
	output("\n\nHe fills you slowly, slapping you on the buttcheek one more time. Your ass is stretched tight around his cock when suddenly his hips stop, leaving you only half stuffed. With a whine you start to push your hips backward, wanting to have your master’s full length inside you. You don’t stop until you can feel your butt cheeks slap into his hips.");
	output("\n\nYour master bends down over you, groping away at your breasts while he starts to move. The nubs sliding through your ring makes you shudder, your pussy leaking a mixture of his cum and your juices. The pleasure starts to overwhelm you, and you lose control of your limbs. Your face falls down to the pillows, but your ass is still held high by your master’s strong arms.");
	output("\n\nYou’re thankful for your master, controlling your body for you since you can’t be trusted with something so simple. Picking up the pace, your master starts to hammer down at your ass, his hips crashing into your behind with a thunderous clap.");
	output("\n\nSuddenly, your master pulls out of your ass completely, leaving you gaped and quivering. You feel the warm air of the room flow inside your ass, cold in comparison to your overheated body. He plunges two fingers inside you, scratching at your insides. Your eyes cross in a mixture of pain and pleasure, and a small moan escapes your lips. After a while he adds a third finger, then another; before long his entire hand is inside you up to his wrist. <i>“When I made you mine, I never would have thought that you would make such a perfect cock sock.”</i>");
	output("\n\nYour master’s treatment of your ass has you breathless and shaking. You don’t even notice your orgasm until your pussy clenches and squirts around a cock that it wishes were there.");
	output("\n\n<i>“What a shameless slut you are, cumming from having your master’s fist inside your ass.”</i>");
	output("\n\nYour master pulls his fist out from inside you, quickly replacing it with his cock. Your ass is now quite loose from his fist, so you have to clench your muscles to provide your master with pleasure. You manage it though, and soon your quivering rim has your master ramming into you with full force. You let out a gasp as your master grabs you by your hair, pulling your head back. You cry out your master’s name at the top of your lungs. With a hearty throb, your master cums. An immense tide of his seed starts to fill your ass. Your master keeps pumping his hips through his orgasm, causing his cum to squelch around his cock. Eventually, it starts leaking over your pussy and down onto the mattress.");
	output("\n\nOnce your master finishes pumping your last hole full of his cum he picks you up and hoists you over his shoulder. Your master is so strong, you think to yourself, he came three times and he isn’t even the slightest bit tired. You are pretty sure you wouldn’t be able to even stand up on your own at this point.");
	output("\n\nYour master carries you over to the pool area and jumps down into the molten rock. He walks through the magma and into the same corner where you were sitting earlier. Laying you down next to him you find yourself leaning into his strong arms. Exhausted from the vigorous fucking, you quickly fall asleep in his embrace.");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",demonDream2);
}

public function demonDream2():void
{
	clearOutput();
	showName("A\nDREAM?");
	author("Doots");
	output("You bolt upright. What a strange dream! You don’t have a master, you are a free " + pc.mf("man","woman"));
	//if PC not a bimbo or cumcow:
	if(!pc.isBimbo() && !pc.isCumCow()) output(", not some cock sucking bimbo");
	output(". ");
	if(pc.hasCock()) output("Your hand starts to wander downstairs. Good, your [pc.cock] is still there");
	//if PC cup size not F-cup:
	if(pc.biggestTitSize() < 11) output(", and nothing has happened your breasts");
	output(". You get up and start walking to the bathroom. You start to think about the dream you had, and you’re not sure how you feel about it. Splashing cold water on your face you think to yourself, it doesn’t really matter how you feel about it, it wasn’t real.");
	output("\n\nPicking up your [pc.gear] you get ready for another day of trying to find your dad’s probes, or whatever you plan on doing.");
	clearMenu();
	pc.orgasm();
	addButton(0,"Next",mainGameMenu);
}

// Capraphorm: Dream sequence
// Only triggers when PC has the Primorditatts perk. Has a 5% chance of triggering every time PC goes to sleep on the ship. Repeatable.
// Do goats dream of electric rituals?
public function capraphormDreamSequence(pageNum:int = 0):void
{
	clearOutput();
	author("SoAndSo");
	clearMenu();
	
	switch(pageNum)
	{
		case 0:
			dreamCheckCock();
			
			showBust("GOAT_WORSHIPPER", "GOAT_WORSHIPPER", "GOAT_WORSHIPPER");
			showName("\nA RITUAL");
			
			output("Your sleep is a soft one, a calm one and one that warms your heart. With that warmth comes courage, joy, and righteousness, a sense of purpose and power. You feel it deep within, placing a hand on your chest.");
			output("\n\nTaking a deep breath through your nose, your eyes re-open to the world around you.");
			output("\n\nA crowd of hooded figures of all sizes stands before you. As far as the eye can see, a static tide of brown robes and pointy, flicking ears point in your direction with faces covered. The sight reminds you of your purpose, why you are here and it makes you smile to the solemn crowd. You stand naked before them: A singular, green orator to a populace of brown initiates.");
			output("\n\nThe sky is open to you, a grey slate of thunderclouds and distant lightning. Beneath, you stand on a smooth plane of granite, but wait... not a plane, more of a plinth or an altar. It’s roughly hewn but there are intricate, alien designs carved into its surface. They glow in faint colors of greens, reds and oranges.");
			output("\n\nThere’s a monotonous harmony of notes coming from crowd, all varying in intensity in seemingly random intervals. They hum in perfect pitch, the sound resonating off of the black stones around you.");
			output("\n\nYou raise a hand of clawed fingers, green fur running across your skin. Unknowable and alien words leap from your throat, directed towards the crowd. A figure near the front walks forward, shorter than most.");
			output("\n\nAs they approach, you extend your other hand outward to greet them. They accept: A dainty, feminine hand settles into your large palm. The figure removes their hood.");
			output("\n\nYour gaze is drawn to them, a female goat-like alien standing before you. Locking your eyes with hers, you sense a lifetime’s worth of memories and happiness filling your mind when you share the gaze. You call back to the crowd and their humming shifts, a new, joyous chord ringing throughout.");
			output("\n\n");
			
			addButton(0, "Next", capraphormDreamSequence, 1);
			break;
		case 1:
			showBust("GOAT_MAIDEN");
			showName("THE\nVIRGIN");
			
			output("Guiding her by the hand, you help her remove the cloak. Her form is furred and pure white, naked and petite: Just as you remember her. She’s as assured and confident as you feel, somehow you can sense this from looking in her eyes. You both want what’s to come.");
			output("\n\nHelping her onto the altar, she lies on her back with her arms outstretched over her head. She is in full view of the crowd, a tentative chord added to the chorus.");
			output("\n\nYou descend from the altar top, lining yourself up with her exposed cunny. Your sheathed member, proud and slender, rises in anticipation of your conquest. With your loins afire and the love of your life before you, you say some final, unintelligible words to the crowd and plunge your shaft into your lover!");
			output("\n\nShe bleats and squeals, her hymen giving way to your insertion. You thrust your lower body to as deep a place as your shaft can go, making sure to be gentle even so. You feel your lover’s hooves clamp round your locked thighs, urging you on with approval.");
			output("\n\nAlthough your body is flushed with pleasuring heat, your mind is clear.");
			output("\n\nA lightning bolt strikes the ground several hundred meters away, to which you raise your hands to the air and look straight into the dark grey sky. The crowd of hoods grows louder in its chorus, a purposeful, dissonant note breaking through each harmony. You call to the sky in a final plea to the heavens, the last word being ‘a...dremma..lex’?");
			output("\n\nAnother bolt of light hits you and your entwined lover with overwhelming force entering your body! You feel locked, paralyzed in place as it surges around your entire being, essence, and consciousness. Out of the corner of your eye, your lover is convulsing in delight on the altar as a glow takes over her form!");
			output("\n\nIn the space of seconds, the glow spreads, burns then fades from you both, a thin film of smoke rising from the altar around you. Your eyes are fixed on your lover: She’s panting heavily but is still smiling, her own eyes closed together.");
			output("\n\nYour body feeling taught, used, and spent, you take some sheepish steps back. Your alien shaft is just as spent, covered in virginal blood and sexual fluids. The female pulls herself up, gingerly standing up on the edge of the altar.");
			output("\n\nShe’s changed: Her fur is the same jade green as yours, her head adorned with large, black horns! Various markings in gold and red dot her fur and she seems taller, stronger, and more youthful. Approaching each other, you embrace and the crowd erupts in cheer!");
			
			addButton(0, "Next", capraphormDreamSequence, 2);
			break;
		case 2:
			showBust("");
			showName("\nWAKING...");
			
			output("And then you wake.");
			output("\n\nWhat a strange dream! The adoration, the sense of security and the blessings bestowed... you miss it all already.");
			output("\n\nStill, the tender embrace has left its own mark: Arousal flushes to your [pc.crotch]!");
			
			dreamResetCock();
			// PC lust fills to max.
			pc.maxOutLust();
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
	return;
}
public function capraphormPrimorditattsGain():void
{
	clearOutput();
	showBust("");
	showName("\nTATTOOS...?");
	author("SoAndSo");
	
	output("There’s an indescribable itch that takes over your [pc.skinFurScales], one that covers your body. You feel the urge to scratch but merely brushing your fingers against the sensitive surface makes you wince.");
	if(pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR))
	{
		if(pc.skinType == GLOBAL.SKIN_TYPE_FUR)
		{
			output("\n\nThe surface of your [pc.skinFurScales] visibly shifts color to a cool, jade green shade!");
		}
		else
		{
			output("\n\nYou feel sharp hairs come out from unseen pores all over your body, their color to a cool, jade green shade!");
			pc.skinType = GLOBAL.SKIN_TYPE_FUR;
			pc.clearSkinFlags();
		}
		
		pc.addSkinFlag(GLOBAL.FLAG_FURRED);
		pc.addSkinFlag(GLOBAL.FLAG_THICK);
		pc.furColor = "jade green";
	}
	output("\n\nOn your [pc.chest], back and [pc.legs], you can see that surreal, unfamiliar markings in vibrant red and gold shades have formed " + (pc.hasFur() ? "in the mess of hair" : "all over yourself") + ". When your body has calmed itself, you take note that a pleasurable, even sexy, aura seems to come about when you focus on them.");
	//output(" In turn, <i>you</i> feel sexier!");
	output(" <b>You’ve now got alien tattoos!</b>");
	
	if(pc.hasAccentMarkings())
	{
		output(" The newly obtained accents seem to have replaced your previous body markings however.");
		pc.clearAccentMarkings();
	}
	pc.skinAccent = "gold and red";
	
	output("\n\n(<b>Perk Gained: Primorditatts</b> - You’re covered in faintly glowing gold and red tattoos! Sometimes, you get weird dreams.)");
	// Cut - Note: "You have a permanent increase to sexiness (+2) but have -10% lust resistance."
	
	// Perk: "Primorditatts"
	// v1: 
	// v2: 
	// v3: 
	// v4: 
	pc.createPerk("Primorditatts", 0, 0, 0, 0, "You’re covered in intricate tattoos that sometimes give you strange dreams.");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	return;
}

// Frostwyrm dreams
public function frostwyrmWetDream():void
{
	clearOutput();
	showBust("FROSTWYRM");
	showName("\nDRAGONS");
	author("B");
	
	output("[frostwyrm.name] lays on her back, and you lay on yours, on her belly, using her like a mattress. Her middle two legs wrap gently around you, keeping you in place, pinning you to her; her breathing rises you a solid foot higher with every inhale, and her heartbeat rocks through you, shaking your whole body with each pulse, and both only grow more raucous the more excited she becomes.");
	output("\n\nHer haunches jerk impiously off the icy ground of her lair, and with every thrust you hear a wet ‘schlap,’ followed by a sticky peeling. [frostwyrm.name]’s legs obstruct your view somewhat, but beyond them you see the angry red, bloated tip of her cock, waggling in the air, its precum spraying every which way as she humps herself upward.");
	output("\n\n<i>We are not done yet,</i> she says to you. She crunches her rear end, her dick remaining still and adjusting its aim towards you, its bulbous, leaking head peering and winking in your direction. With a visible flex, another dollop of hot Frostwyrm precum juts out, splashing across your body and all the way up to [frostwyrm.name]’s ribs.");
	output("\n\nYou open your mouth as it rains down, hoping to catch as much as you can across your [pc.tongue]; the few drops of her fine elixir you collect are tangy, powerful, musky, and delicious; it incentivizes you for more. But [frostwyrm.name] has you so thoroughly pinned: there’s no way you’re going to wriggle yourself free from her grip.");
	output("\n\nIn response, you feel what feels like someone climbing along [frostwyrm.name]’s belly scales. You crane your head to the side, and you see... yourself, hoisting yourself onto her body. You lick your [pc.lips] as you eye [frostwyrm.name]’s turgid, leaking rod, and you don’t hesitate to crawl towards it, wrapping your arms around its flesh and pressing your [pc.chest] against it.");
	output("\n\nAnother person climbs up her other side, and again, it’s you, clamoring into position on the other side of [frostwyrm.name]’s tool. You give yourself a glance and a wink before you take your position on the other side of the titanic cock; you take a similar position, joining hands with yourself and with your [pc.chest] against the throbbing heat of [frostwyrm.name]’s body.");
	output("\n\nThe one on the left rubs [pc.hisHer] cheek against it, while the one on the right plants several, loving kisses, licking [pc.hisHer] [pc.lips] in between each one. You both move synchronously up and down [frostwyrm.name]’s dick; familiarizing yourselves with its contours and ridges, until its bloats once and rains down yet more precum; the salty ambrosia dribbles down the sides of her dick, and, thirsty, you each slide out your [pc.tongue], scrounging up [frostwyrm.name]’s gift and then actively bathing her cock to entice out more.");
	output("\n\nYou feel every sensation: you can feel yourself grip yourself by the wrists, and you can feel the texture of [frostwyrm.name]’s penis against your tongue. You taste the tincture on your tongue and you smell the growing musk pervading from her raised haunches. You feel [frostwyrm.name]’s heartbeat through her mammoth cock, and your own heart skips a beat when you feel it pump another wad of thick pre for you to sup on. Pinned to her belly, you watch two of yourself worship [frostwyrm.name], but your vision is also blocked by the veiny, red skin of the massive rod you’re worshipping – occasionally, you catch a glimpse of yourself on the other side, licking and kissing at her body like a whore, and it only entices you to do the same.");
	output("\n\n<i>More,</i> [frostwyrm.name] demands. On cue, you feel your fingers trail along her belly, your [pc.feet] patting against the cold ice as you go down her side to her haunches – and then again, on her other side. You watch yourselves tend to her throbbing erection, coaxing out more juice, but now your focus is a bit southward, to her aching testicles and the feminine treasure they hide beneath; you watch them bounce and struggle in her tight, leathery sack. A good, attentive mate has to make sure that their mate has no need left unfulfilled.");
	output("\n\nYou meet yourself behind [frostwyrm.name]’s overturned form, and you both gently take a knee on the base of her tail. You give yourself a deep, tongue-filled kiss, before you heft up her sack by the center, revealing [frostwyrm.name]’s glistening, inviting pussy, patient for someone to tend to it. One of you climbs forward, submerging yourself in the musky heat of your Frostwyrm’s body; two questing hands find the vulva of her draconic pussy, pulling at the spongy flesh just slightly, before your [pc.face] lunges forward and immerses itself into the wetness of her cunt.");
	output("\n\nOnce you’re settled into attending [frostwyrm.name]’s feminine needs, the one still behind her releases [pc.hisHer] grip on the scaly sack; you feel the heavy weight of [frostwyrm.name]’s testicles on your back, but you’re not done. You shuffle forward a bit, placing your torso into the crease between [frostwyrm.name]’s testicles, and get to work massaging both, working them with both hands and pressing your [pc.lips] against the pliant flesh, your [pc.tongue] reaching out to push against the thick, powerful ball within one. When the patch of skin on her sack is adequately washed, you switch to the other, washing another patch before repeating the process.");
	output("\n\n[frostwyrm.name] sighs and her haunches thrust again, pumping out another blast of her precum, washing the you locked against her belly and feeding the two of you tending to her inflated dick. The you underneath her body, pleasing her pussy, reaches forward and dips [pc.hisHer] hand in; [frostwyrm.name]’s body reacts instinctively, sucking on your hand as though it were a cock, urging out the cum it wants.");
	output("\n\n<i>I need more,</i> [frostwyrm.name] says, her voice sounding guttural and forceful. Her wishes are your command: the two of you at her cock, now dripping from [pc.hair] to waist in precum, disengage and draw their hands along the spine of her cock, tilting it towards [frostwyrm.name]’s belly, and towards you.");
	output("\n\nIt bumps against the you locked against [frostwyrm.name]’s body, its heat searing against your [pc.skinFurScales] and its precum staining you some more. The left you inches forward, your hands grabbing at your own [pc.ass] to lift you slightly, aligning your [pc.vagOrAss] upward and against the head of [frostwyrm.name]’s cock. Once it’s pressed against your body, you give its head one long lick, encouraging out another blob of precum to be injected directly into you.");
	output("\n\n[frostwyrm.name] lets her instincts take over, and she thrusts, sinking most of herself into your [pc.vagOrAss] in one swift motion. She exhales deeply as your body takes her massive, heavy cock with ease, each centimeter sliding into you uninhibited. You squirm in her grip, cheeks flushed in pleasure, while the two of you still at her dick resume their work, kissing and rubbing along the exposed parts of [frostwyrm.name]’s shaft.");
	output("\n\n[frostwyrm.name] relaxes her haunches, sliding herself out of you, and thrusts back in; her testicles pull against her body, bringing the you bathing them along with, and when they relax, they ease back against you, bubbling full of cum and eager for more of your ministrations. When she thrusts again, you feel every single bit slide inside you, stretching your [pc.vagOrAss] for more, and you’re eager for it.");
	output("\n\nWith every thrust, every one of you clenches against her, each experiencing the same sensation as the other. Every time she withdraws, her freshly-exposed cock is covered in her own pre, which you lap at leisurely, taking in your taste as well. Every time you find a new, sensitive spot against her pussy, she douses you in her feminine ichor, baptizing you and squeezing against whatever body part is against her or inside her. With every splurt of precum, her balls tense, then relax against you, their weight roiling towards you and their submerging you in their musk.");
	output("\n\nEvery little action causes a feedback chain-reaction against you, and you beg her for more between getting impaled on her dick, and between licks and kisses on her cock, and between licks and massages on her balls, and between plies and tickles on her cunt. She grows closer with every thrust into your [pc.vagOrAss], until she can’t take it anymore: the you at her balls finds out first, when they suddenly bloat, then squeeze against her.");
	output("\n\nYour body fills to the brim with her warm, draconic cum by the first blast, and that was only the first one. You rapturously watch every wad of cum crawl its way up her cock and then into yourself; when her pearly white cum gushes from your inflated, distended body, you’re on yourself immediately, lapping at the rim of your own [pc.vagOrAss] to collect every drop you can’t contain.");
	output("\n\nThe you at her pussy is having just as fun a time: she clenches hard on your arm, sucking you up to the shoulder and dousing the rest of you with her cum, soaking you from head to [pc.chest] to waist in herself as you service her. The orgasm racking along her cock times perfectly with the one vibrating her cunt, and they work in tandem to fill you and shower you, respectively, with her cum.");
	output("\n\nIt lasts longer than you could have hoped for; though she’s dumped gallons of her draconic cum inside your willing body, you don’t feel the slightest bit overextended and you only hunger for more. You beg her for it; you tell her that you want every last drop she has; to fill you with herself, and to baptize yourself, and to feed yourself. You want nobody and nothing else in the universe; you want nothing but [frostwyrm.name] and her body.");
	output("\n\n[frostwyrm.name] takes one final, deep breath as her cock pumps its last and her pussy coats you one final time. You sigh with her, licking gently at your own body and at her still-red cock and her still-wet cunny, winding down from the vigorous session. Her balls relax against you once more, and you press into them, sinking into the crease between each heavy nut, surrounding yourself in their heat and musk.");
	output("\n\n<i>More,</i> [frostwyrm.name] demands. On cue, you feel four more pairs of hands trail along her body; two go to her neck, while two more go to her haunches, climbing aboard and shuffling their way to the base of her thick dick. She thrusts her hips impiously once more, driving her back inside her mate’s welcoming hole....");
	
	clearMenu();
	addButton(0, "Next", frostwyrmAwakening, undefined);
}
public function frostwyrmAwakening():void
{
	clearOutput();
	showBust("");
	showName("\nWAKING...");
	author("B");
	
	output("Your eyes flutter open. You’re back in your bed.");
	output("\n\nYou check your codex for the time. You’ve been asleep for eight hours, but it felt like that dream had lasted an eternity. So many things happened in such a short amount of time; you doubt you’ll be able to remember a lot of the finer details.");
	output("\n\nThat said, if anyone’s going to remember any part of that");
	if(pc.hasGenitals()) {
		output(", it’s going to be y");
		if (pc.hasCock()) output("our raging, almost angry tent between your legs, demanding a ‘Good Morning’ <i>right now</i>");
		if (pc.isHerm()) output(". Just underneath it, y");
		if (pc.hasVagina()) output("our sheets that are stained and wet, tainted with the familiar tang of your own horny, needy pocket, ready to jump on the first halfway-phallic thing it sees");
	}
	output(".");
	output("\n\nYou’re already starting to forget a lot of the dream, but for some reason, you’re inspired to take a visit to Uveto. You’re sure [frostwyrm.name] (and the kips) wouldn’t mind you spending some familial time together.");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//(1ST DREAM/OPT IN OR OUT)
//Requires dongo longo & masculine pronouns
//Requires been to NT
//Requires level 4+
//Balls
public function alexandraDream1():void
{
	clearOutput();
	showBust("ALEXANDRA");
	showBust("ALEXANDRA");
	author("Carol J.");
	showName("\nDREAMING...");
	output("You know you’re asleep. There’s a sort of objective awareness of that fact. Even as you stare up at the bright, all-encompassing screen above you, you know you’re asleep. You’re in your bed right now, not standing in a line of hundreds, staring mindlessly up at a spiral as it spins ad infinitum for you and your drooling brethren.");
	output("\n\nBut you’re not quite dreaming. It’s like there’s a movie being projected into your sleeping mind, a vision that someone else is deliberately curating and using to fill up your subconscious as you rest. None of this is real. None of this is normal.");
	output("\n\nYou stare up into the spiral. You find yourself forgetting that you’re not dreaming. You find yourself forgetting that you’re not awake. You stare up into the spiral, and you hear a voice in the back of your head. It’s smooth. Seductive. Just a little hint of throatiness to it, the kind of rumbling sensuality that tells you that the woman speaking is undeniably in charge.");
	output("\n\n<i>“If you’re hearing this message, I’d like to personally welcome you to another round of rest, relaxation, and mindless obedience. I’m Alexandra Holliday, and you need to <b>relax</b>.”</i>");
	output("\n\nAs soon as she says the word, you feel a pulse of warmth fill up your skull and trickle down in pleasant tremors through your muscles. You don’t know under whose power you remain standing, but it certainly isn’t your own. You feel so deliciously loose and limber, like you’ve just spent the past hour soaking in a nice, warm bath. Your body takes another step forward, and you find yourself smiling. It feels good to relax, especially when Alexandra is the one telling you to do so. Your body takes another step forward, and you realize that you’re hard.");
	output("\n\n<i>“For those who have relaxed with me before, you can just enjoy this. For those who are joining me for the first time tonight, I’d like to explain what it is I’m doing here. It’s very simple. All you have to do is listen and agree with everything I say. I’ll make it very easy for you to nod your head and believe the truth. OK?”</i>");
	output("\n\nThe spiral you’re staring into on the big, pretty screen pulses pink, and you nod. Your body takes another step forward, and you see out of the corner of your eye that the line of men you’re in is slowly proceeding towards a door. Or something. You’re far more interested in the screen...especially when a woman appears on it.");
	output("\n\nYou’re drooling in seconds, salivating over the sight of the buxom beauty dominating your attention as the spiral fades away. While it’s true that her features are impeccable in their own right - high cheekbones, piercing blue eyes, plump, pouty lips - your focus is right where she wants it to be: her fat, wobbling tits. Each one of them is probably bigger than your own head, and even if they just barely sag under their own weight, the mesmerizing bounce they give whenever she moves so much as an inch tells you they’re 100% natural. Her cleavage is all but bottomless, and you openly gape up at the screen as she begins to speak. With a rack like that to stare at, you’re getting too stupidly horny to do anything but listen.");
	output("\n\n<i>“Men think <b>so</b> much. <b>Too</b> much, I think. They think about their jobs and their hobbies and their plans for the future. And that’s a lot more thinking than guys need to do, I think. I think that guys only need to think about how they’re going to get off. I think guys like it better when they don’t think with their brain. I think guys like it better when they think with their ‘head.’ And here’s proof.”</i>");
	output("\n\nYou blink. Suddenly the screen isn’t above you. It’s right in front of you, right above the door to nowhere that you’re slowly, steadily walking towards.");
	output("\n\n<i>“Right now you have a choice to make. It’s a choice that’s all up to you. You can choose to wake up and go about your day. Do whatever it is you do for a living, break your back, spend that blood, sweat, and tears to earn a few more credits. Or.”</i>");
	output("\n\n<i>“You can stay with me just a little bit longer. You can get stiff. You can get your dick nice and hard. And you can walk through this door and have the best cumshot of your life.”</i>");
	output("\n\nShe may say there’s a choice, but there’s really no choice at all. Your eyes are locked on the sight of her fat, heaving tits, and your cock is straining forward, practically pulling you towards the door to heaven itself. If she’s telling the truth - and you have no reason to doubt that she is - you’re going to end up absolutely emptied by the time you wake up.");
	output("\n\nYou smile dreamily, and your prick dribbles precum messily at the thought. All you have to do is cum. All she wants you to do is cum. That sounds really nice. <i>“That sounds really, really nice. All the nice lady wants you to do is take just a few steps forward, that’s right. Just step forward and let the machine take care of everything.”</i>");
	output("\n\nYou groan as the screen is momentarily lifted away from your half-lidded eyes, but it’s not long before a visor is placed over your eyes instead. The sight of Alexandra fills your vision. Even if you wanted to look away - which you certainly don’t - you can’t. All you can do is stare into her cleavage and lose yourself in the sight of her big, bouncy breasts. All you can do is listen to her speak. All you-");
	output("\n\nYou grunt appreciatively as something suddenly applies suction to your cock. You don’t know what it could be, but there’s something hot, wet, and tight pumping away at your cock now <i>“and you don’t really care what it is. It feels good, and isn’t that what matters? That’s right, just enjoy the pleasure and let the milking machine drain your balls dry. It feels incredible, doesn’t it? Such a good little breeding bull.”</i>");
	output("\n\nYou let your jaw drop, drool trickling down your chin as your bloated cockhead belches gobs of pre into the machine. You feel incredible, and it’s only getting better. Sometimes you think, and it doesn’t sound like your thoughts in your head <i>“but that’s perfectly fine, because thinking doesn’t feel as good as cumming anyway. All you want to do is fuck your load into the nice, sexy machine. All men ever want to do is cum. That’s why men like you do the things they do, isn’t it?”</i>");
	output("\n\n<i>“You want to impress pretty girls. You want to make sure all the babies you fuck into your sexy little wives are provided for. You want to feel good. You just want to fuck and cum and enjoy yourself. That’s all men want to do.”</i>");
	output("\n\nYou gurgle in half-witted agreement. Your cock feels good <i>“and that means you’re willing to do whatever it takes to keep feeling good. Men are so stupid when they get horny, and it’s the best feeling in the world when a guy like you ends up fucking his wad into whatever tight, wet hole he’s plunged into. It doesn’t matter how big you are or how small you are or even how many you have: if you have a cock, you were built to be a slave to girls with tits big enough to get you stiff. And these tits are big enough to do that, aren’t they?”</i>");
	output("\n\nThe milk-bloated rack in front of your eyes wobbles, and you nod in blind agreement. Imagine those wrapped around your shaft. You grunt and gurgle as the mental image flashes through your scattered thoughts. Your cock twitches and pumps another wad of precum into the machine.");
	output("\n\n<i>“This is easy. So easy. You don’t have to worry about impressing anyone or saying the right things or fighting or winning. All you have to do is give up and cum. All you have to do is let the titties control your mind and do what feels good. You want to feel this way all the time. This is so much easier than other ways you could cum. You love it when Alexandra reaches out with her powers and gives you dreams like this. You love it when you get to be a mindless cum-pump breeding stud.”</i>");
	output("\n\n<i>“You’re addicted to this.”</i>");
	output("\n\n<i>“You love it when I make you my stupid stud-slave.”</i>");
	output("\n\n<i>“You love it when I show you just how weak your mind is and just how good it feels to obey me.”</i>");
	output("\n\n<i>“You want to cum.”</i>");
	output("\n\n<i>“You need to cum.”</i>");
	output("\n\n<i>“Cum.”</i>");
	output("\n\nYou cum into the machine. You grunt and groan and buck your hips forward, plunging yourself into the artificial fuckhole and emptying your balls into the warm, welcoming suction. Every wad of spunk you pump into the machine is accompanied by a throb of pleasure, and soon the waves of your orgasm - together with the euphoria of psychic submission - combine and overwhelm you. You’re just a stupid stud-slave. You love it when Alexandra controls your mind and makes you her brainless cum-pump. Men just want to feel good. You’ll do anything if it means you cum as hard as this. Obey. Submit. Surrender.");
	output("\n\n...");
	output("\n\nYou blink awake in your bed, sheets stained and balls aching. Were you dreaming?");
	output("\n\nAh, well. It’s impossible to tell, and with the golden haze of afterglow pulsing through your body, all you really want to do right now is lay back and relax a little bit more. The rest of the day can wait. You just want to feel good.");
	pc.orgasm();
	alexandraIndulge();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//(2ND DREAM/ALEXANDRA’S MACHINATIONS)
//Requires dongo longo & masculine pronouns
//Requires been to NT
//Requires level 4+
//Requires ALEXANDRA_DREAM_LEVEL == 1
//Balls
public function alexandraDream2():void
{
	clearOutput();
	showBust("ALEXANDRA");
	author("Carol J.");
	showName("\nDREAMING...");
	output("You slide into a dream...\n\n");
	output("No matter how many times you sit back and appreciate it, the view from the top never gets old. It was one hell of an adventure, scouring the galaxy for your old man’s probes and earning the reins of the company, but...well, “worth it” is an understatement. Fame and fortune are yours now, the kind of vast, limitless wealth that’s more of a concept than an actual number. Even if not everyone in the galaxy knows your name, the movers and shakers do. As your countless “liaisons” with pampered socialites and trillionaire playboys can attest, the moneyed elite are infatuated with their newest member. Whether rich, powerful, or some combination of the two, everyone who matters has their eye on [pc.name] Steele.");
	output("\n\nAs it turns out, that’s what ends up being your downfall.");
	output("\n\n--");
	output("\n\nIt’s a day like any other when you get that fateful call. Just one little beep in your earpiece as you’re managing the path forward for Steele Industries from your office on the top floor of the monolithic headquarters building. You pause your strategizing for a moment and answer the call.");
	output("\n\nThe only thing you hear is your secretary’s breathy giggle. Maybe a snippet or two of some muffled conversation. It takes a sharp cough to get her attention, but that’s all it takes.");
	output("\n\n<i>“Oh! Mr. Steele! There’s a, uh.”</i> She giggles once more. <i>“There’s someone here to see you. (I’m sorry, what’s your name?)”</i> A pause. <i>“Miss Alexandra Holliday. It doesn’t sound like she has an appointment, but, uh. She says she’s very interested in talking to you. Would you like me to buzz her in?”</i>");
	output("\n\nYou quirk a brow and purse your lips. <i>“Alexandra Holliday,”</i> huh? The name doesn’t ring a bell. You open your mouth, about to answer that no, you’re busy right now... <i>but that seems so rude, doesn’t it? She came all this way to see you. It would be the gentlemanly thing to do to let her in. Just to talk to her, right?</i> You lean back in your seat. <i>You can afford to just talk to her for a little bit.</i>");
	output("\n\nIt’s with a smile in your voice that you tell your secretary certainly, you’d love to meet Miss Holliday, and there’s a little pulse of warmth at your answer. <i>It’s so easy to just agree.</i>");
	output("\n\n<i>“Alright! I’ll send her in right now. (So, what did you say YOUR name was again?)”</i> Her voice trails off, and your earpiece goes silent a moment later. A moment past that, the door to your office opens to reveal...ooh.");
	output("\n\nSeems like it was the right call to take a chance and meet her, because Miss Holliday is...exceptional. She’s clearly Treated - the polished horns jutting out from her head are a dead giveaway - but the hourglass figure straining against her outfit isn’t <i>quite</i> as exaggerated as the prototypical “bigger is better” body you’d see on most New Texas cowgirls. Sure, her child-bearing hips are wide enough to crush a lesser man’s lap. Sure, her fat, wobbling tits jiggle hypnotically with every confident step she takes forward. But there’s a glint in her eyes and a knowing smile on her lips.");
	output("\n\nIt’s clear that Alexandra is no ditzy cow. For one, she’s wearing a suit and pencil skirt, charcoal black and expertly tailored. That kind of outfit would probably be reserved for the token female bureaucrats working in the New Texas administrative buildings, and you’re sure they’d be off those cowgirls as often as they’re on. On top of that, her eyes haven’t left yours for even a moment. Normally a Treated cowgirl would have started ogling your package by now, but as Alexandra thrusts her hand forward, it’s clear she’s all business. (For now, at least.)");
	output("\n\n<i>“Mr. Steele,”</i> she murmurs. <i>“Pleasure to finally meet the new head of Steele Industries.”</i> You take her hand and shake it, her grip surprisingly firm. <i>“I have to admit,”</i> she continues, sitting opposite you and crossing her legs casually. <i>“You and your cousin put on quite a show for the rest of us. As far as last wills and testaments go, your father’s has to be the most entertaining anyone could hope to pen. And!”</i>");
	output("\n\nShe leans forward, eyes sparkling as she rests her elbows on your desk. Her breasts are big enough to press up against the surface in the process. Even if her eyes are locked on yours, you don’t necessarily have to restrain yourself, do you? A quick glance down to appreciate the sight of her pillowy tits mashed up against the lacquered wood of your desk, then it’s back to business. Or, you know, polite conversation, at least.");
	output("\n\n<i>“<b>You’re</b> the swashbuckling hero that managed to snag the inheritance!”</i> She leans back, shaking her head in well-meaning disbelief. <i>“What a story, and talk about a reward well-earned. I can’t <b>tell</b> you how many executives I’ve dealt with that just had their parents’ legacies handed over without a lick of fanfare. It’s a pleasure and a <b>relief</b> to know I’m not dealing with the kind of spoiled milquetoast that’s happy to let the board of directors handle things as they piss away their credits on escorts and gold diggers. I can’t tell you how many businessmen I’ve reached out to that spent the entire time staring at my tits. Half of them end up drooling by the end of the conversation.”</i>");
	output("\n\nShe winks at you.");
	output("\n\n<i>“That being said, if you want to enjoy the view, I’d say you’ve earned it at this point. There’s something to be said for a man who’s taken what he wants instead of being given it.”</i> Her eyes go half-lidded, and her smile grows. <i>“I don’t think I’d have a problem with a man like <b>you</b> ogling me.”</i>");
	output("\n\nYou smirk in return. Don’t mind if you do. After all, you reason, it’d be a shame to let art like her to go unappreciated.");
	output("\n\nShe laughs quietly and shakes her head. <i>“Please. I’ve seen some truly <b>breathtaking</b> examples back home on New Texas. Some of the girls I have back on my ranch have tits big enough to knock a guy out if they turn too fast. Not that they’re liable to complain, of course. Compared to them, I’m hardly anything special.”</i>");
	output("\n\nYou’re quick to disagree, but after the reassurance that she’s a singularly striking woman comes a question that comes to mind: <i>“Her ranch?”</i>");
	output("\n\n<i>“Yes. My ranch.”</i> Alexandra smiles brightly, canting her head to the side just so. <i>“I own and operate a luxury retreat on New Texas. Politicians, business executives, et cetera.”</i> She pulls a business card from her breast pocket and offers it to you, and you’re quietly pleased to note that it’s still warm from her body heat. <i>“In this day and age, there’s a certainly problem with the high and mighty falling prey to their...<b>vices,</b> shall we say.”</i>");
	output("\n\n<i>“You see it all the time, unfortunately. People have the means to pursue whatever pleasures they fancy, and they don’t realize that too much of a good thing isn’t always a better thing. For instance.”</i> She cocks her head back towards the door to your office. <i>“I can tell you without a shadow of a doubt that the pretty young thing you have at the receptionist’s desk would be on the first shuttle to New Texas if she didn’t have to worry about working a nine-to-five. I had one of my boys with me when I came in, and she was batting her eyelashes at him in <b>seconds</b>. Sure, he’s Treated, so she might not be used to the kind of pheromones he’s putting out, but that’s the danger, isn’t it? You run up against something you’re not used to, something new and fun and exciting, and you end up diving in headfirst to the best bad decision you’ve ever made.”</i>");
	output("\n\nShe straightens up in her seat, and you catch the bounce of her chest out of the corner of your eye. <i>“That’s why we provide that kind of temptation in a controlled environment. Everything is strictly limited by the releases you sign before entering the retreat, and I’m <b>quite</b> proud to say that since its founding, we haven’t had a <b>single</b> client either begin or relapse into any ‘bad habits’ they had once they’ve spent some time unwinding at the ranch.”</i>");
	output("\n\n<i>“In short, Mr. Steele,”</i> Alexandra purrs, <i>“when’s the last time you let yourself <b>relax?</b>”</i>");
	output("\n\nYou blink at her, caught just the slightest bit off-guard by her sudden flirtatiousness. Definitely a pleasant addition, though. And the idea sounds wonderful. You can’t really remember the last time you ever had the chance to let loose and indulge yourself. And honestly, you deserve it. You deserve all that and more. Someone as rich as you can afford to spend as much time as you want with Alexandra, and thanks to the steady, tranquilizing wobble of her tits right in front of you, it’s an exceedingly tempting offer.");
	output("\n\nYou blink. You try to bring your eyes back up to hers. <i>But she said you could stare as much as you want, didn’t she? So there’s really no need to do anything but stare at her big, bouncy boobies and relax into your seat. So that’s exactly what you do. You just sit back and stare at her tits as they bounce up and down. Up and down.</i>");
	output("\n\n<i>A ranch full of bubbly, buxom beauties, a harem of Treated cowgirls ready to pamper you whenever and wherever you want. You drift off into daydreams of fat, pillowy tits wrapped around your prick, the warm sandwich of your latest playmate’s tits lubricated with sweet, creamy milk spilling from her teats. One nipple in your mouth, one hand on your head smoothing your hair, one pair of lips right against your ear, cooing and mewling, begging you to pump your load into the velvety vice of cowgirl cleavage.</i>");
	output("\n\n<i>A nonstop pleasure cruise of fucking and sucking and cumming. Cowgirls milking your balls dry as you lay down to sleep, sent to bed by silky-smooth handjobs and nice, relaxing cumshots. Wake-up calls at the crack of noon, groggily blinking awake from your psionically-enhanced wet dreams to find either a cowgirl bobbing her head in your lap or a state-of-the-art cock-milking machine slurping up yet another splurt of spunk. The only decision you have to make past that is whether or not you want to bend a bitch over the dining room table as you enjoy a meal or get “breakfast” in bed as you mindlessly fuck your bedmate - robotic or not.</i>");
	output("\n\n<i>And honestly, it sounds nice not having to make any decisions except for the small stuff. It must be one of those retreats where there’s a schedule. Thinking is hard. Fucking is easy. Yeah, so they have a schedule there for you to follow, nice and easy. And if you have a hard time letting go of control - after all, you’re such a big, strong man; you must be so used to being in control - they can probably set it up to have a cowgirl guide make sure you end up exactly where you need to be. Hips swaying, cunt pouring off heat and the near-irresistible scent of her arousal.</i>");
	output("\n\nYou blink. You realize you’re drooling as you stare at Alexandra’s tits, and the embarrassment is enough to shock you out of your daydreams. You’re so sorry, you explain; you don’t know what came over you.");
	output("\n\nWhen Alexandra smiles, it carries the mischief of someone who looks like they know just a bit more than they’re letting on. <i>“Not a problem, Mr. Steele. If anything, that kind of episode is the sort of thing that shows just how <b>badly</b> you need this. I mean.”</i>");
	output("\n\nShe sighs ruefully and crosses her arms under her titanic bust, hefting them up to make it easier to stare at them. <i>“Imagine if some breed-happy floozy strutted in here with a chemical cocktail you’d never seen before? Pheromones tickling your hind-brain <b>just</b> right. You’d probably fuck your next heir into her without a second thought. It’s not a strike against you. It’s just the truth.”</i>");
	output("\n\nShe moves one hand from below her bust to slide you a piece of paper. <i>“It’s not your fault. You’ve worked <b>so</b> hard to make sure you didn’t fall prey to the sorts of sluts that take men like you and suck them dry. Here. All you have to do is sign right down here, right on the bottom line, and we’ll make sure that doesn’t happen. You’ll come with me back to the ranch, we’ll get you set up in your little vacation home, and you’ll get to finally let out all that pent-up desire.”</i>");
	output("\n\nThe contract is right in front of you, a pen placed helpfully beside it. Even if your limbs feel like they’re made of cement right now, you’re able to pick up the pen and sign the paper if you want to. <i>And you really, <b>really</b> want to.</i>");
	output("\n\nDo you?");
	pc.changeLust(25);
	clearMenu();
	addButton(0,"Yes",alexandraDream2Yes);
	addButton(1,"No",alexandraDream2No);
}

public function alexandraDream2No():void
{
	clearOutput();
	showBust("ALEXANDRA");
	author("Carol J.");
	showName("\nALEXANDRA");
	output("You blink down at the paper. Nonsense words swirl in lazy spirals on the surface of it. You squint down and realize that it’s a smear of ink and deceit. This isn’t real. None of this is real. When you look back up to Alexandra, her eyes are glowing pink, and her horns seem to glow with the same ephemeral energy. Her smile’s a bit colder now. Eyes narrowed to slits.");
	output("\n\n<i>“Well,”</i> she hums, rising to her feet. <i>“Looks like you’re not as stupid as you look. Doesn’t matter, though. Next time you go to bed all pent-up, you can count on having a nice, messy wet dream.”</i>");
	output("\n\nShe winks. <i>“My treat.”</i>");
	output("\n\n--");
	output("\n\nYou wake up with a start. Memories fragment moments after they form. Syncopated, they fail to coalesce, and soon you’re left alone in your bed, the phantoms of your dream fading into nonexistence. Confused - and in some part aroused - you lay your head back down and try to fall back asleep.");
	//Reset!
	alexandraResist();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function alexandraDream2Yes():void
{
	clearOutput();
	showBust("ALEXANDRA");
	author("Carol J.");
	showName("\nALEXANDRA");
	output("You grope at the pen without a second thought, smiling as you scribble some vague attempt at a signature onto the paper. You’re rewarded with another dull throb of warmth in the back of your head, but this time it trickles down in little pulses to the root of your cock.");
	output("\n\nAlexandra rises from her seat and gives you a condescending pat on the head. Smiling, she takes the contract, folds it in half, then in quarters, and tucks it in her breast pocket. <i>“There’s a good boy. So <b>agreeable.</b> Now...”</i> Her eyes flash with a dizzying pink light, and you go limp in your seat.");
	output("\n\n<i>“Just enjoy yourself while I take you through the <b>additional services</b> we offer.”</i>");
	output("\n\nIt’s hard to think of anything but enjoying yourself. Your brain feels like it’s been dipped in liquid bliss, and you’re more than happy to just bask in the pleasure. Even if your muscles are slack, your cock is stiffer than ever, throbbing and twitching with every heartbeat.");
	output("\n\n<i>“So!”</i> Alexandra continues, clicking a pen and moving to make additions to the contract you just signed. <i>“We have a few different packages available for businessmen of your stature, and for your <b>convenience,</b> we accept alternate forms of payment! For the basic plan, you’d get one week’s stay on the ranch and one of my Treated cowgirls to introduce you to the facilities available. Which is nice, but...”</i>");
	output("\n\nThe pleasure thrumming through your body seems to fade, if only for a moment. You grumble in disappointment...");
	output("\n\n...only to grunt in mindless, ecstatic shock when the bliss returns, stronger than ever. It’s not just some vague, somatic pleasure, either. It’s a hand, pumping your cock up and down, up and down, up and down-");
	output("\n\nYou groan, gurgling as an ephemeral cowgirl coos and mashes her tits up against your chest. She’s got one hand between your legs stroking insistently. The other brushes your hair to the side as she presses her phantom lips to yours.");
	output("\n\n<i>“For just five percent of your company’s total shares, you’ll have access to her for your entire stay as part of the ‘Silver’ Package. Oversexed, buxom, Treated, lactating, <b>expertly</b> trained in all the different ways to wring big, silly bulls dry. And if she knows how to tame a <b>bull,</b> a poor little city slicker like you is going to be <b>putty in her hands.</b> Doesn’t that sound <b>nice?</b>”</i>");
	output("\n\nThe cowgirl-mirage stares into your eyes with a smile, nodding. You nod along, groaning.");
	output("\n\n<i>“And that’s for <b>only</b> five percent. That’s <b>nothing.</b> That’s <b>less</b> than nothing. Which is why so many CEOs that come with me go even higher. For <b>twenty</b> percent...”</i>");
	output("\n\nOne becomes two becomes three, four, five. You’re not in your office chair anymore. You’re laying back in a warm, luxurious bed, tits mashed up against your body from myriad angles. A pair of plush cock-milkers squeeze your cock as two cowgirls grind themselves up against you from your left and right. One massive breast is forced into your face, its nipple practically begging to be suckled. You don’t have to lift a finger. Even your pillow is warm and soft, head laid back in a cowgirl’s lap.");
	output("\n\n<i>“...we have the ‘Gold’ package. Five Treated cowgirls prepared to make sure you never have to lift a <b>finger.</b> They’ll feed you, fuck you to sleep, bathe you. Everything you could ever want, and more. Most executives that try this end up <b>never</b> succumbing to the wiles of, shall we say, ‘off-brand’ temptresses. These girls will keep you <b>perfectly</b> safe, and all you have to do is let them take care of you.”</i>");
	output("\n\n<i>“But let’s say that’s not enough. Let’s say you’re really, truly, <b>deeply</b> afraid of what might happen if you end up in the arms of the exact wrong type of girl.”</i> Alexandra’s voice is little more than smoke twirling in your mind at this point, a fugue that tells you what to think, what’s good and what’s bad.");
	output("\n\n<i>“For fifty-one percent of your company’s total shares, we have the ‘Platinum’ package.”</i>");
	output("\n\nFive becomes one once more, but it’s like she’s seen through a kaleidoscope. Her features shift moment to moment. She’s not just one woman, she’s every woman, all at once. She’s sensuous, irresistible, exotic, familiar, sweet, red-hot, doting, maternal, seductive, smoldering, teasing, exquisite. She’s every dream girl you’ve ever had and every dream girl you never knew you had. You gape at her wordlessly, gawking at the ponderous heft of her chest as she steps up over you.");
	output("\n\nYou can’t do a thing but watch her, spellbound. Even as she looms over you, smirking as she begins to squat down onto your lap. The heat between her legs is even hotter than yours, and with every whiff of her pheromone-laden musk that you huff, with every drop of white-hot arousal her cunt drools onto your lap, your cock <b>aches</b> to bury inside her.");
	output("\n\n<i>“Let’s face it, guys like you have to deal with gold diggers every single day. They come in here, sweet as honey, trying to get you to bust a fat, sloppy nut in their womb so they’re walking around with [pc.name] Steele’s baby kicking in their tummy. It gets tempting, doesn’t it? But you never can. All they need to take advantage of is one little moment of weakness, and then you’re their personal piggy bank. A mindless little ATM stumbling dick-first after them and handing over the world’s easiest paycheck just because her pussy makes you go cross-eyed.”</i>");
	output("\n\n<i>“That’s why the Platinum package is the most popular one we have by <b>far.</b> Not just one week. It’s an indefinite stay on the ranch. As long or as short as you want. And while your meals in the other packages might include oral contraceptives to discourage unwanted pregnancies...”</i>");
	output("\n\nThe illusory cowgirl lowers herself further, and soon her white-hot cunt is brushing up against the bloated tip of your cock.");
	output("\n\n<i>“...when it comes to Platinum, we pump you <b>so</b> full of virility-enhancers that you’re breeding <b>every single bitch</b> you fuck.”</i>");
	output("\n\nShe drops down, and your eyelids flutter at the sensation of her pussy clamping down around your cock. She’s bouncing in seconds, and it’s not long before the steady clench of her vaginal walls around your length have you drooling and giggling dully. Add to that a pleasant tingle whenever her hips slap down - courtesy of Alexandra’s abilities, whatever they might be - and you’re being fucked <b>stupid.</b>");
	output("\n\n<i>“You don’t have to worry about holding back, because you <b>won’t</b> be holding back. You’ll be fucking your sons and daughters into every available cowgirl we have. How better to fight temptation than to indulge it in every way you can? There’s no need to think. Not when you can just fuck and fuck and <b>fuck.</b>”</i>");
	output("\n\n<i>“You’ll be fucked into the mattress every day and every night, your brain so utterly <b>pickled</b> in sex hormones and our modified does of the Treatment that you’ll forget your name. Your job. Your life before the ranch. And you’ll forget why you’d ever care, either. We’ll handle all your business off-planet. All <b>you</b> need to do is focus on fucking as many bastards into my girls as you can. There’ll be no need to set up some silly race for planetary probes, because we’ll <b>both</b> know that my ranch is the only party with a legitimate claim to your company.”</i>");
	output("\n\n<i>“And you’ll be <b>perfectly</b> safe throughout. We’ll make sure the <b>only</b> bitches you breed are <b>my</b> cowgirls. That the only wombs you’re bloating with your thick, <b>virile</b> seed are the ones <b>I</b> own.”</i>");
	output("\n\nThe cowgirl bounces on your lap, her face shifting, her skin blending from one color to the next. Her body’s impeccable. Her face is beautiful. Her hips are slamming you into the bed. Her tits are wobbling with every bounce, keeping your already dazed mind further distracted. You distantly realize that your hand is moving, signing paper after paper.");
	output("\n\n<i>“Just one more signature, darling,”</i> purrs the cowgirl riding your cock, and it’s with vacant delight that you realize...it’s Alexandra. She’s bouncing in your lap, a perfect, irresistible fantasy. You rumble with barely-restrained desire. Your body shakes. Your hand twitches, and you sloppily scrawl your name on one final contract.");
	output("\n\n<i>“<b>Good boy.</b>”</i>");
	output("\n\nHer voice crashes down on you along with a rush of pleasure, and soon Alexandra’s mashed one of her milk-drooling teats against your lips. You start suckling immediately, too lust-drunk to care if it’s real or not. You don’t care if it’s fantasy or if it’s reality anymore. You know it <b>will</b> be real soon, and that’s all that matters. You slurp down mouthful after mouthful of sweet, corruptive cream, and by the third gulp...");
	output("\n\n...you’re pumping your seed up into her tight, wet cunt. She helps you along, of course, clenching and wringing your cock with every enthusiastic spurt you fuck up into her womb. <i>You want to breed. You’re addicted to breeding. You’re a stupid, fuckdrunk breeding bull who needs to be drained every day, every <b>hour</b> by a buxom, beautiful cowgirl. You’re a dumb, empty-headed tit addict. You’ll do anything for a big pair of tits. Thank goodness Alexandra got to you first before some gold digging bitch could.</i>");
	output("\n\n<i>“Good boy. <b>Such</b> a good boy.”</i> Alexandra croons from the throne of your lap. She splays one hand just below her navel, and you tingle with delight, knowing that you’ve seeded her. The thought that you’ve fucked her pregnant is such a turn-on. You’re a breeding addict, and you need her to keep you safe from your own carnal urges.");
	output("\n\n<i>You need Alexandra. You’ll always obey Alexandra.</i>");
	output("\n\n<i>“Now that you’ve gotten the sample of what it’s like to be my mindless plaything,”</i> she purrs, the illusory Alexandra fading away. Along with the rest of your office. <i>“I think it’s time you <b>wake up.</b>”</i>");
	output("\n\n--");
	output("\n\nYou blink sleepily awake, stretching luxuriously in your bed. There’s a smile on your lips and a stain on your sheets, but you couldn’t care less about the latter. You just had the most <b>wonderful</b> dream, and even if you can’t <b>quite</b> remember the details, you’re sure that you’ll remember the important parts when it comes time to make the decision.");
	output("\n\nWhat decision? You’re not sure. It isn’t important right now.");
	output("\n\nRight now, you just want to find some fertile bitch to <b>breed.</b>");
	pc.taint(1);
	pc.changeLust(25);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	alexandraIndulge();
}

//(3RD DREAM/BULL ON RANCH)
//Requires dongo longo & masculine pronouns
//Requires been to NT
//Requires level 4+
//Balls
public function alexandraDream3():void
{
	clearOutput();
	showBust("ALEXANDRA");
	author("Carol J.");
	showName("\nDREAMING...");
	output("The world behind your eyelids is dark, but only for a moment. It’s not long before your sleep gives way to dreams, and they flicker to life in your mind like film flapping through a projector. You’ve never had a dream like this before, one that starts so jarringly, so suddenly, but...much like the other dreams you’ve had in the past, everything makes just enough sense to your sleeping mind that you don’t question it. And really, that’s the most important part.");
	output("\n\nDon’t question anything.");
	output("\n\nAnd really, your tired mind doesn’t have to make nearly as many concessions with this dream. You’re not some kind of giant lizard tromping around a miniature city-scape, there are no rocks mumbling trivia questions at you as faces melt from the three watches on your wrist. No, this is all pretty normal stuff. For the kind of life you’ve been living, lately.");
	output("\n\nYou’re a bull. A bull living on a ranch.");
	output("\n\nIt’s a simple premise, right? Nice and easy to wrap your head around, and you’re really thankful for that. Complicated stuff isn’t your style, awake or asleep, and sometimes it’s nice to just sit back and relax. After all, you’re asleep, right? No sense wasting brainpower on some big, cumbersome dream-narrative. That’s right, all you have to do is accept your role and play it as best you can.");
	output("\n\nYou’re a bull. And you’re stupid.");
	output("\n\nThe details of your dream-life begin to fill in as you plod from your pen in the “barn” towards the milking machines in the other building. You used to not be a bull, but then you came to New Texas, took the Treatment, and now you’re just another New Texan. Just another big, brutish bull. Your cock got big, your brain got slow, and your balls fattened up with cum again and again.");
	output("\n\nYou smile dimly to yourself, walking on autopilot. There’s a collar around your neck, and it doesn’t take but five seconds before you remember how you got that collar, too. Back when you were first feeling the effects of the Treatment changing your body, you’d made the mistake of pumping a wad into some cowgirl’s <b>juicy</b> little cunt. Normally that’d be fine, but there was a quirk in your biology and hers.");
	output("\n\nYour cock dribbles a musky dollop of precum as you think back to the cumshot that changed your life. The second you fucked your load into Alexandra’s pussy, you remember a pleasure unlike anything you’d felt in your life. Eye-crossing, tongue-lolling, jaw-dropping, the kind of pleasure that makes you go limp and useless whenever you feel it crash down on you in the milking pens. Right as the Treatment had been rerouting your neurons, shortening and redirecting your axial pathways, that pernicious flood of dopamine had criss-crossed your circuits and left you a stupid, horny animal. Most bulls ended up smug, swaggering studs, and make no mistake, you’re a <b>complete stud.</b>");
	output("\n\nYou also happen to be a pussywhipped fuck-addict, too.");
	output("\n\nAt first it was manageable. The Treatment was still changing you, but you weren’t totally changed. You remember thinking about getting back to your ship, but you just couldn’t pull yourself away from that Holliday minx. The first romp with was incredible. The second was impeccable. And the third? Well, that was all it took to seal your fate for good.");
	output("\n\nIt was almost like she planned it. Like she’d gotten your prick nice and stiff at just the right time to leave you a cum-dribbling boy-toy. Sometimes you wonder if it was all a giant conspiracy, a trap that you fell into. Fuck if you care, though. It feels incredible to be Alexandra’s cum-pump, and every nut you spunk into one of her “milking” machines just makes you that much stupider. And that much hornier.");
	output("\n\nBesides, she’s far from selfish! She provides everything you could ever want! She feeds you, houses you, makes sure you’re nice and clean when she rents you out to breed disobedient bitches... Part of you wonders if it’s a bad thing that she sends you out to turn independent and politically-minded young women into cross-eyed milk-cows, but it’s all nice and simple for the rest of you. Couldn’t be easier:");
	output("\n\nSlamfuck the bitch into submission. Let Alexandra talk to her. Give her the Treatment medipen. Even a stupid bull like you can handle that. And then a few days later there’d be a new milk-cow to fuck when you’re bored! Everyone wins, even the policewomen that try to take you away from Alexandra.");
	output("\n\nYou’re hard again, and you’re not even in the milking pens. This is gonna be a problem.");
	output("\n\nYou wrap your hand around your cock and start to pump. A quick half-orgasm should clear your head enough for you to navigate to...wherever you’re going. But you really wish you had something to fuck your hand <b>to.</b> Something like-");
	output("\n\nOh, perfect! As soon as you think about it, a video of Alexandra appears before your very eyes. You’d recognize the wobble of her titanic teats anywhere, and that’s pretty fortunate, because the video doesn’t show a single inch of her face. No, staring openly and unabashedly at Alexandra’s rack, you fuck your fist like a drooling idiot.");
	output("\n\nThank god she has this automatic masturbation-aid system set up on the ranch. You remember back before you were a bull, back when you’d have to find porn on your own <b>before</b> you started stroking yourself. Now all you have to do is wrap your hand around your cock, and a pre-recorded video of Alexandra will pop up and dominate your field of vision. You don’t quite get why the spirals are there, and you never really pay attention to what she’s saying in the video, but that’s not the point, is it?");
	output("\n\nYou remember hearing about some other bulls who tried to “clear their heads” by rubbing one out when they weren’t scheduled to fuck or get milked, and you honestly can’t imagine a worse feeling than not being horny. That’s why she talks her bulls to sleep as soon as they empty their balls. No stress, no worries, no thinking.");
	output("\n\nYou idly drool a bead of pre from the tip of your bloated bull-cock.");
	output("\n\nIt feels amazing. And you’re so thankful that Alexandra took you in after she mindfucked you and turned you into a stupid breeding bull. Honestly, the whole race to find the...probes or whatever. That was so boring. Most of it didn’t even feel good. Not like this. No, here on Alexandra’s ranch, you get to feel good all the time, and whenever you want to feel even better, you can just ask Alexandra to make you even stupider.");
	output("\n\nYou aren’t quite sure how she does it - no surprise there - but Alexandra can do this thing with her brain that makes it even harder to think. You’re pretty sure she’s explained the process to you once or twice before, but more or less as a way to rub it in your face just how stupid you’re becoming. Something about persistent dopamine feedback loops and selective oxytocin triggers. You don’t know what big words like those mean anymore. All you know is that when you hear Alexandra’s voice and see her big, heaving tits, you get stiff for her because you love her.");
	output("\n\nLove is kind of a complicated emotion, honestly. Maybe it’s more accurate to say that you want her.");
	output("\n\nYou drool as you fuck your hand, staring at the screen in front of you. Alexandra’s rack wobbles in front of your glassy eyes, and soon you’re just mindlessly pumping away. You can practically hear her voice in your ear:");
	output("\n\n<i>“Good bull. Such a good, stupid bull.”</i>");
	output("\n\nWith a grunt, you cum. Before the Treatment - and the modified epipen Alexandra convinced you to take after you signed yourself away to her ranch - the wad of spunk you just pumped from your bloated bullprick would have been an absolutely <b>magnificent</b> cumshot. Enough to creampie even the hungriest Venus Pitcher and leave her satisfied for days to come. Now, it’s barely enough to make your cock go half-hard. Your balls start to churn with a fresher load in seconds, and it’s only Alexandra’s careful programming that sends you stumbling towards the milking pens.");
	output("\n\nHave to get milked. Have to be a good bull.");
	output("\n\nYour tongue is lolling out again by the time you get to the milking pens, cock stiffer than ever and balls bloating up fat with your next orgasm. You’ve been meaning to ask Alexandra about the thing where you can sign up to just be in the milking pens all the time, but whenever you try to talk to her about something, you just end up staring at her rack and masturbating. It’s not a bad problem to have, as far as problems go, but you wish you were one of the lucky bulls in here. The ones who get to cum and cum and cum. Your cock throbs at the thought. Mindlessly pumping away in a fake pussy as you watch video after video of Alexandra’s tits bouncing and wobbling and jiggling.");
	output("\n\n<i>You’d give anything to do that.</i>");
	output("\n\n<i>You’d give up everything to do that.</i>");
	output("\n\nYeah. You would. You’d abandon your hunt for the probes or whatever if you got to just be a stupid, horny bull and get your cock milked all the time. You smile dimly to yourself. <i>When you wake up, you’re going to think about doing just that.</i> But for right now, you have to get your balls drained. Otherwise you’re just going to be pouring off pheromones and sending all the cows into heat. It’s a real problem, and even if the cows are nice to fuck, they make you do so much <b>work.</b> Sometimes you just want to let yourself get strapped down, have a suction hose wrap around your cock, and let the pretty spirals spin in your eyes as Alexandra mindfucks you until you pump your wad into the milking machine.");
	output("\n\nAnd that’s just what you do. You stumble into your pen, clumsy and brutish and uselessly muscular, and gentle automated hands guide you to your milking bed. The first few times, they had to strap you down. Now your muscles go limp the instant it begins to lean back. Your body knows what comes next just as well as your mind does, and it’s more than happy to cooperate with the automated cock-pumping.");
	output("\n\nA screen lowers in front of your face, and - just like every other time you come in to get drained - you get a choice of videos to watch. Something to help you get off as hard as possible as fast as possible. Every porn star in the universe is presented for your perusal, but you grunt out your answer without a moment’s hesitation:");
	output("\n\n<i>“Alexandra.”</i>");
	output("\n\nYou’re so fucking smart for figuring this out. You don’t know if the other guys know this, but if you choose to watch Alexandra, two <b>more</b> screens come down. That’d be good enough already. But you know <b>another</b> secret. One that Alexandra <b>herself</b> told you. Three screens of her perfect hourglass figure were good, but six is twice that. And all you have to say is");
	output("\n\n<i>“I’m a stupid bull for Alexandra.”</i>");
	output("\n\nJust like that, three more screens lower in front of your face, and soon you’re assaulted with six simultaneous video feeds at once, each showing your mistress doing...something else. God, she’s so fucking gorgeous. The machine pumping at your cock is definitely helping, but your attention is almost entirely dominated by the sights and sounds of Alexandra.");
	output("\n\nAlexandra trying on clothes, squeezing into bras before the hooks snap and the buttons of her blouse pop off uselessly. Alexandra smirking as she presses her tits up against each other, the valley of her cleavage all but inescapable. Alexandra, calm, cool, collected, sexy and in control, wearing a full, figure-hugging business suit as she nudges a truly monstrous bullprick with the tip of her foot. You grunt and groan as she snaps her fingers, and the cock she’s inspecting - attached to some faceless bullstud like you - pumps its load eagerly into the air at her implicit command. You gurgle in pleasure and desire. You want that. <i>You want to be Alexandra’s mindfucked bullstud. You want to be her mindless cumpump and cum on her command. Nothing turns you on more than being Alexandra’s horny, useless slave.</i>");
	output("\n\nMilk dribbling from her teats. Alexandra smirking as she wrings another load from one of her bullstuds with her fat, heaving tits. You’re so close to cumming. Alexandra instructing you to obey, using her psychic powers to influence you at your most vulnerable, to shape your desires while you hand yourself over to pleasure, to sleep, to dreams. You can almost feel her in your head, <b>adjusting</b> you to be more how she <b>wants</b> you to be.");
	output("\n\nYou - the real you, not the dream you - know you can wake up. And you know that if you don’t, if you stay in the fantasy, if you see it through to the end...you’ll end up changed. But would that be a bad thing? It feels incredible. And it’s not like you’re going to wake up zombified if you let this psychic cowgirl goddess give you a wet dream. Right?");
	output("\n\nYou can indulge a little bit more. You can let Alexandra take control. All she wants to do is make you feel good. All she wants is to make you cum so hard your brain turns off for a while.");
	pc.changeLust(120);
	clearMenu();
	addButton(0,"Wake Up",wakeUpForAlexandra);
	addButton(1,"Stay Asleep",stayAsleepForAlexandra);
}

//(wake up)
public function wakeUpForAlexandra():void
{
	clearOutput();
	showName("\nAWAKE...");
	author("Carol J");
	output("It’s not worth the risk. You focus, fighting against her influence and shaking off the artificial dream she’s foisted upon you and....");
	output("\n\n...sitting up in your bed. Were you dreaming? You shake your head and try to remember what just happened. Something about...");
	output("\n\nHm. You can’t quite remember. It must not have been very important.");
	alexandraResist();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//(stay asleep)
public function stayAsleepForAlexandra():void
{
	clearOutput();
	showBust("ALEXANDRA");
	author("Carol J.");
	showName("\nALEXANDRA");
	output("You don’t care what else might happen, because you know Alexandra is going to make you. You want to feel good. You’re a stupid, horny bullstud, and stupid, horny bullstuds get to pump fat wads of cum into the milking machines. You hand yourself over to the dream, and you’re rewarded for it.");
	output("\n\nThe dreamscape shifts, rapidfire, an overwhelming deluge of pleasure and fantasies and sights and sounds and sensations. You take a cowgirl from behind, plunging yourself in her tight, wet cunt. You bottom out in her pussy, bellowing with pleasure with each high, keening <i>“moo”</i> she gives.");
	output("\n\nYou lay back, boneless and drooling as the milking machine expertly massages and slurps at your cockflesh, glassy-eyed as Alexandra showcases how her machinery works on her latest bullstud to potential investors. It feels incredible to be put on display like this, just a stupid, mindless demonstration of fuckdrunk addiction for all the people who know better than to think with their cocks.");
	output("\n\nYou’re collared, chained to a throne. So big. So <b>strong.</b> Alexandra presses a single fingertip under your chin and guides you to face her. You salivate at the sight of her ruby-red lips curling up into a smirk. So powerful. And yet so weak. She reaches down to knead your cum-bloated balls, rolling them in the palm of her hand and giving teasing little clenches to make sure your fat, heavy nuts stay nice and backed-up. It makes you easier to control, she reminds you. So easy to control a horny bullstud like you.");
	output("\n\nBulls like you don’t know any better, and that’s the problem, really. They don’t know what’s good for them and what they <b>should</b> be doing. But that’s why Alexandra is ready to guide you. All you have to do is let her take over. Not just now, even though it’s certainly a start. You have to let her take control <b>forever.</b>");
	output("\n\nCum.");
	output("\n\nYou’re back on the display table, prick twitching and throbbing, orgasm about to crash down on you.");
	output("\n\nCum.");
	output("\n\nYou’re stumbling after her on the ranch, eyes glued to the fertile swell of her hips as they sway from side to side.");
	output("\n\n<b>Cum.</b>");
	output("\n\nYou’re in her office on New Texas, signing your life away just for the chance to feel one of those <b>exquisite</b> cumshots awake instead of just in your dreams.");
	output("\n\n<b>CUM.</b>");
	output("\n\nYou groan, blinking awake as you pump a fat, sloppy load into your sheets. It’s not long before they’re stained white, but even before your orgasm’s over, you’re drifting back to sleep. You were pulled out of your rest by the same irresistible pleasure that’s sucking you right back down into blissful dreams of obedience...");
	output("\n\n...and instruction.");
	pc.orgasm();
	pc.taint(1);
	alexandraIndulge();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//(4TH DREAM/BREEDING BULL IN OFFICE)
//Requires dongo longo & masculine pronouns
//Requires been to NT
//Requires level 4+
//Balls
public function alexandraDream4():void
{
	clearOutput();
	showBust("ALEXANDRA");
	author("Carol J.");
	showName("\nDREAMING...");
	output("Something happens during your slumber...\n\n");
	output("You don’t know why you’re here, but as long as Alexandra’s holding your leash, you don’t have to know. Probably have to fuck some woman. You grin dully to yourself. You like it when you get to fuck the women Alexandra tells you to. Sometimes they try to push you away at first, but they always end up cross-eyed and giggling with a womb full of your cum.");
	output("\n\n<i>“I don’t really have an interest in repeating myself, Fiona,”</i> Alexandra says calmly, a hint of a smile playing at her lips. She’s dressed conservatively, but her figure is enough to send any prick stiffening at the sight. <i>“It’s cute that you and your company thought you could wriggle around my <b>talents</b> with the hiring criteria you’ve adopted lately, but you’ve made the mistake of underestimating him and overestimating yourself.”</i>");
	output("\n\nThe woman sitting across from her at the desk fidgets, looking from Alexandra’s eyes to yours. Then to your cock. <i>“Fiona,”</i> apparently. The boss? The manager? You don’t know. She doesn’t look bad. For an unTreated human, at least. A nice, generous chest. Attractively short blonde hair. Blue eyes. Fair skin. You can’t tell if she’s got a proper hourglass figure, but you don’t really care. Alexandra’s tits are bigger, so that means she’s in charge. The idle thought of Alexandra’s wobbling rack drags your attention back down to her tits, and soon your half-hard prick is at full mast.");
	output("\n\n<i>“He’s quite a specimen, isn’t he?”</i> Alexandra brings one delicate hand to the underside of your fuckrod, hefting it up as if she’s examining a particularly interesting mineral sample instead of the fattest, thickest bitchtamer genetic modification can buy. <i>“The Treatment really is something, and all it takes to produce results as impressive as this is a teensy modification to the end formula.”</i>");
	output("\n\n<i>“<b>I’m</b> used to it.”</i> She lets your cock down, and it sags under its own ponderous weight. <i>“Not just the sight of it. The scent, too. I have to admit, it’s impressive in its own right that you haven’t bent over the desk and presented yourself to him, but it’s really only a matter of time.”</i> Alexandra’s calm. Cool. Collected.");
	output("\n\nFiona isn’t. Her pale skin is flushed deep red, and her eyes have been locked on your fuckrod since the moment Alexandra showed it off. She’s biting her lower lip, and you can practically <b>smell</b> her cunt leaking. Her chest heaves with every deep breath she takes, and the sight of her tits straining against her blouse makes your cock twitch. Her breath catches in her throat in response.");
	output("\n\n<i>“And that’s not even necessarily the problem. One moment of weakness isn’t enough to ruin someone and turn them into a <b>fuck-drunk sex addict.</b>”</i> Alexandra enunciates the last four words like she’s cracking a whip. Fiona whimpers, and Alexandra rises from her seat. <i>“Forget going from zero to sixty. This is going from zero to six <b>thousand.</b> After all, it’s not unusual for women to visit New Texas and sample the, ah...”</i>");
	output("\n\nAlexandra steps around the desk. Behind the woman. <i>“‘Local flavors,’ shall we say. Sometimes they can even go back. Sure, a good number end up immigrating permanently, but it’s not the <b>majority.</b>”</i> Her hands go to Fiona’s shoulders, and Alexandra leans in to whisper in her ear. <i>“Sometimes one little taste is enough. Just one roll in the hay with a big, buff bull. A fantasy that some overworked office drone needs to get out of their system. One and done.”</i>");
	output("\n\n<i>“But <b>imagine.</b>”</i> Alexandra’s voice is a low, smoky hiss now. The sound of it - and a few pulses of warmth in the back of your brain - send your cock throbbing fatter and harder with every heartbeat. <i>“Imagine a fuck so <b>good</b> and so <b>hard</b> that you can’t even remember your <b>name</b> after it’s happened. Imagine a bull so <b>big</b> and <b>strong</b> that you can just go limp and let him do all the work. I’ve seen my bulls pick up girls and fuck them like <b>toys.</b> Doesn’t that sound nice? A little break after all the hard work managing imports and exports and all those silly trade regulations.”</i>");
	output("\n\nYour prick belches a glob of precum onto the surface of her desk, and Fiona can barely stifle a moan. Scratch that, she can’t. With Alexandra’s hands kneading insistent circles into her shoulders, she’s melting bit by bit.");
	output("\n\n<i>“Only. You might want to be careful. Every rose has its thorn, you know? And this one has one <b>hell</b> of a <b>prick.</b> See.”</i> Alexandra’s using that special voice of hers. The one that’s smooth, a touch lower than normal. The kind she uses when she wants to turn someone’s brain off without using her powers. Sure enough, it starts to work. The woman’s eyelids begin to flag, but her gaze never leaves you bitchtamer. <i>“My boys are <b>special.</b> They have a <b>nasty</b> little habit of making strong-willed career women into empty-headed <b>mommies.</b> The mods I made to the Treatment has a few... side effects. You probably don’t even realize it right now, but...”</i>");
	output("\n\nAlexandra chuckles, throaty and luxurious. <i>“The second you caught a whiff of this big, bad bull’s <b>cock,</b> you started <b>ovulating.</b>”</i>");
	output("\n\nFiona gasps softly, but she hardly sounds concerned.");
	output("\n\n<i>“One little sniffle of the Alpha male’s musk, and your ovaries got all hot to trot. I give you about five minutes before you’re shaking your ass like an animal begging to be mounted. I’ve seen stronger women than you end up cumming around this bull’s <b>fuckrod</b> like a virgin with her first vibe. Then they cum again when he actually fucks his load into them. Then they cum <b>again</b> when they feel that little <b>ping.</b> Right <b>here.</b>”</i>");
	output("\n\nAlexandra splays her hand out just below the woman’s navel, and you notice with distant confusion that she’s... pressing her thighs together. What, does she not want to fuck? That’s weird. Whatever.");
	output("\n\nIt suddenly feels like a very good idea to jerk yourself off. Your pupils dilate just so as Alexandra’s influence nudges you in the right direction, and soon you’ve wrapped your hand around the bloated length of your shaft and begun to clumsily pump your rod up and down. Pre leaks from the tip in cloudy pearls, splattering on the desk in front of you. Sometimes you wring your prick particularly hard and end up dribbling your pre-seed onto the woman’s blouse directly.");
	output("\n\n<i>That’s a good thing. It’s a very good thing.</i> You jerk yourself harder. You make sure every stroke ends with a few more droplets staining the woman’s clothes. It isn’t long before the entire room swims with the aroma of your musk. The woman’s nearly swooning from the scent alone, and you note with satisfaction that her mouth’s begun to water as she leers at your big, stiff prick.");
	output("\n\nAnd all the while, Alexandra’s whispering in her ear, the naughtiest little shoulder devil a girl could ask for. Most women think that they’re safe because her powers don’t affect them. Lucky for them, they’re wrong. If they were right, you might not get to breed them stupid. You might not get to pump your spunk into their eager little wombs and send them cumming themselves to sleep as your sperm wriggles its way up to their eggs and makes sure they’re well and truly <b>seeded.</b>");
	output("\n\nAlexandra just needs you to fuck your hand right now, so you’re free to daydream. It’s so easy to sink into fantasies ever since you started letting Alexandra mindfuck you every night. Barely takes a moment before you’re lost in visions of wide-hipped, breedable cow-bitches and milk squirting from plump, full udders. When Alexandra found out you used to be [pc.name] Steel, <b>the</b> [pc.name] Steele, she decided your genes were too good to waste.");
	output("\n\nSo instead of being strapped down and hooked up to a pump, you ended up becoming Alexandra’s personal bitchbreaker. A mindless drone sculpted into the perfect masculine form so you could seduce and subjugate as many women as she needed you to. And the best part? You get to creampie every bitch you fuck.");
	output("\n\nSometimes even more than once. Most of the time your job means that you’re not back home on the ranch, but sometimes everything Alexandra plans on doing goes off without a hitch and she doesn’t need you right away. When that happens, it’s rest and relaxation in your private harem, a bevy of bovine beauties worshiping your bitchtaming prick while you gulp down as much milk as their udders have to offer.");
	output("\n\nYou smile to yourself. <i>You’re so glad you followed Alexandra’s influence through the dreams she gave you and signed your life away at her hidden ranch on New Texas.</i> Given that most of her bulls just end up as glorified cum-factories, <i>it’s an honor that you get to serve her so directly,</i> as her influence reminds you.");
	output("\n\nYou’re so lost in the fugue of pleasure that you don’t notice Fiona move until she’s pressed up against you. Panting and mewling with barely-restrained desire, she’s got her tits mashed up against your rock-hard abs...and her hands on your cock, silky smooth skin pumping up and down. She stares up at you dreamily, like you’re her knight in shining armor. Given what Alexandra’s whispering in her ear, you might as well be.");
	output("\n\n<i>“No stress. No worries. Just a nice, relaxing vacation. Right? You’re not like those other silly girls, Fiona.”</i> Alexandra lies with a nice, wide smile on her face, and Fiona believes every word. <i>“And you can always leave whenever you want. It’s not like I’d <b>force</b> you to stay. You’ll be able to leave whenever you get tired of getting plowed by my big, <b>strong</b> bulls.”</i>");
	output("\n\nFiona nods, barely aware of her surroundings. The only thing she sees is you, and the only thing you see is her. It’d almost be romantic if your bloated prick wasn’t drooling pre onto her belly. And if you were thinking about anything more than how good it’s going to feel to mindbreak her into another docile cowgirl. She’s so small. Barely any curves. The Treatment will fix that.");
	output("\n\n<i>“Here’s what we’re going to do,”</i> Alexandra continues, moving slowly to undo the buttons of Fiona’s blouse. <i>“We’re going to set up a little change in the chain of command here. You know, so no one has to make any <b>calls</b> or send you any <b>messages</b> while you’re relaxing. No interruptions. And then, just as a little treat from me to you, my bull here is going to fuck you <b>senseless.</b> Let’s call it...”</i> Alexandra giggles to herself. <i>“‘Proof of conception.’”</i>");
	output("\n\nFiona purrs with delight. She presses her now-bare breasts up against your rod, sandwiching the sizable length of your fuckpillar between her tits. She massages the warm softness of her chest around your shaft, but it’s painfully clear that she’s not nearly big enough to titfuck you properly. That’s fine, though. Alexandra doesn’t want you to just fuck their tits. She wants you to spunk in their cunts and make sure they get hooked on being creampied. On being bred.");
	output("\n\nYour eyelids sink lower, and you feel the programming she’s drilled into your head begin to take over. It’s so simple. Like going on autopilot and getting a nice, fat cumshot at the end for being a good little slave. <i>All you have to do is give up. All you have to do is give in.</i>");
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Give Up",alexandraDream4GiveUp);
	addButton(1,"Get Out",alexandraDream4GetOut);
}

//(get out)
public function alexandraDream4GetOut():void
{
	clearOutput();
	showBust("ALEXANDRA");
	author("Carol J.");
	showName("\nAWAKE!");
	output("You awake with a start, sitting up in your bed. There’s sweat beading on your brow. Even as your heart pounds in your chest, you can’t shake the feeling that you just avoided something...terrible? Wonderful? It’s hard to tell, and it’s even harder to shake the arousal pulsing in the back of your head.");
	output("\n\nYou try to push the visions of eager, submissive cowgirls from your mind as you force yourself to sleep. In time, the teasing phantoms fade, but the indistinct memories of pleasure and mindless submission do not.");
	alexandraResist();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//(give up)
public function alexandraDream4GiveUp():void
{
	clearOutput();
	showBust("ALEXANDRA");
	author("Carol J.");
	showName("\nALEXANDRA");
	output("You give up. You give in. It’s so wonderfully simple to surrender to your programming, to just be a bull. To just breed.");
	output("\n\nYour hands go to Fiona’s waist, and she squeaks with delight as you lift her up into the air. For someone as Herculean as you, she’s light as a feather, and it’s trivial to bring the hot, wet mound of her sex down to the tip of your cock. Alexandra steps back with a smile, turning away from the two of you as she moves to take a seat at Fiona’s desk.");
	output("\n\n<i>“You two enjoy yourselves,”</i> she says, eyes focusing intently on the computer screen Fiona was working at. <i>“And don’t mind me. I’m just going to take care of a few things here so you can focus on getting fucked nice and hard.”</i>");
	output("\n\nYou’re almost mechanical when you move, but it seems like Fiona likes it. Maybe she mistakes your indifference for a sort of attractively masculine callousness. Either way, you’re going to have her cumming helplessly around your thick, stiff cock. She squirms and twitches in your hands as you force her down around your rod, and for a moment it seems as if she’s going to protest. She’s tight, sure, but that moment of half-formed resistance melts away as your prick lubes her cunt with another dollop of mind-clouding precum. The scent of it was one thing, but the instant a bitch gets a taste of your seed - precum or no - she’s all but guaranteed to bliss out.");
	output("\n\nFiona’s no different. She was pawing at your chest before, batting at it like an affectionate kitten, but now her arms and legs are going limp. Her pupils go wide, and her lips turn up into a vacant smile. The sight makes your cock throb in satisfaction, but you won’t get that rush of pleasure from Alexandra’s instructions until she’s drooling cum from her pussy and gurgling on the ground.");
	output("\n\nThat’s what compels you to bring her down even harder, and soon you’ve hilted the entire length of your bitchtamer prick in her cunt. Your hands around her waist give you the perfect grip to piston Fiona up and down on your dick, and soon you’re jerking yourself off with her as a toy. After all, she’s small enough to be a toy compared to you, so why not use her like one?");
	output("\n\nSeems like she likes the treatment, too, because she’s cumming rapidfire around your cock. There’s a twitch every now and then around your shaft, and her body’s tensing up in the same syncopated rhythm. Given that she’s never done it with a bull - whether he be one of Alexandra’s stock or just a normally Treated guy - she may as well be a virgin when it comes to stamina. Her eyes have crossed already, and her jaw’s hanging open as you fuck yourself with her.");
	output("\n\nEven if you’re not fucking the kind of cowgirls you’d have fawning over you back on the ranch, she’s still tight, she’s still wet, she’s still <b>hot.</b> It doesn’t take long before you’re teetering on the edge of orgasm yourself, and what finally pushes you over the edge is...");
	output("\n\n<i>Alexandra. You love to obey Alexandra. Obeying Alexandra makes you cum so hard. You get off because Alexandra wants you to cum hard and cum often.</i>");
	output("\n\nSomeone else might think that Fiona’s the submissive one here, but you’re just as mindless as she is. As you bottom out in her cunt and pump your seed into her womb, the only thought in your mind is that <i>you’re so lucky Alexandra found you. You’re so lucky you get to cum as hard as this. Most men would do anything to be a horny bull-slave. You’ll do anything to be a horny bull-slave.</i>");
	output("\n\nYou groan, body going limp as the pleasure washes over you. Your prick throbs and bulges with every massive splurt of cum you empty into Fiona’s sex. After a few spurts, the only thing keeping your hot, thick cumshot in her cunt is your bulbous cockhead. It’s packed into her womb, plugged up with your cock, and it won’t be long before she’s been utterly <b>fertilized.</b>");
	output("\n\n--");
	output("\n\nYou blink awake groggily. Where are you? You’re not in bed, even if you- Hold on, are you sitting at your ship’s comm? What’s- Did you just jerk off or something? There’s streaks of cum splattered onto the screen, and your dick is still hard. Were you...sleepsturbating?");
	output("\n\nIt isn’t even porn on the screen, though you have no idea how you’d watch porn through shut eyelids. No, the only thing on the screen is a <i>“Message Sent!”</i> indicator.");
	output("\n\nYou consider checking your extranet outbox, <i>but there’s no need to do that. Everything is fine.</i> When you get right down to it, all you really need to do is <i>get back to sleep. You’ll know what to do soon.</i>");
	output("\n\nRising from your ship’s comm system, you shrug and make your way back to your quarters. It’s nice and easy to brush aside the nascent concerns that an episode like this would normally raise. In fact, you find yourself wondering more about the <b>wonderful</b> dreams you’ve had lately than anything else.");
	output("\n\nIf only you could remember them...");
	alexandraIndulge();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//(FINAL DREAM/BAD END)
//Requires dongo longo & masculine pronouns
//Requires been to NT
//Requires level 4+
//Balls
public function alexandraDream5():void
{
	clearOutput();
	showBust("ALEXANDRA");
	author("Carol J.");
	showName("\nDREAMING...");
	output("When you wake up, there’s this...compulsion. You don’t know quite where it comes from, but you know that it’s important. It’s very important that you open a line of communications to New Texas, and it’s even more important that you make sure the line is secure. Encrypted. Your fingers tap absently - almost clumsily - at the main commline’s keyboard, and soon the numbers in your head translate to numbers on the screen. How you know this line or even what this line is doesn’t really matter. You’re half-hard and drowsy, operating purely on autopilot.");
	output("\n\nIt’s such a relief when Alexandra’s face crackles to life on the screen that you can’t help but smile. Why would you do anything <b>but</b> smile? The woman who’s gotten her claws in your dreams is finally ready to meet up in person and complete your induction into her legion of slaves.");
	output("\n\n<i>“Very good,”</i> she purrs, eyes narrowing as she scrutinizes you from her side. <i>“Who would have known that [pc.name] Steele would have been such an easy catch? Poor thing.”</i> She winks, and her other eye glows pink. You grunt in surprise as your cock begins to stiffen, and a phantom hand begins to stroke it up and down, nice and slow, so luxurious that all you can do is slump back in your seat and let it happen.");
	output("\n\nAlexandra says something about a credit transfer and a few agreements to sign. <i>“Nothing you can’t do while you’re relaxing,”</i> she reassures you. Her eyes glow brighter still, and a pair of unseen lips wrap around the bulbous crown of your prick, tongue swirling in circles around the very tip. <i>“All you have to do is authorize the routing number and provide your fingerprint, biometric signature, and a <b>teensy</b> sample of your DNA. That’s not too much to ask. Is it?”</i>");
	output("\n\nShe smiles cutely, turning side to side in her seat and sending her tits wobbling from left to right in the wake of her fidgeting. You follow her breasts’ motions helplessly, shaking your head in blind, stupid mimicry.");
	output("\n\n<i>“Good bull.”</i> Alexandra’s voice is a low, smoky purr, and you realize for the first time that your decisions here might not have all been your own. <i>The thought of that turns you on. Your dick gets so hard thinking about how she’s manipulated you with her sex appeal and your own mind-clouding arousal. You love how she’s learned your weakness for breeding fertile cowgirls and sucking on their big, fat tits.</i>");
	output("\n\nOr did she <b>give</b> you those weaknesses? <i>It doesn’t matter. You feel so good when she uses her body to control you. You don’t care that she gave you your fetish for being an easily-controlled bull. It feels good, and that’s what matters. You only care about cumming as hard as you can. You only care about feeling good. You’ll do anything to feel good.</i>");
	output("\n\n<i>“Oh? Do you actually <b>like</b> it when I seduce you?”</i> Alexandra quirks an eyebrow as you finish typing in the information. Wait. What? Were you saying that out loud? Or is she feigning surprise at another thought <b>she</b> gave you? You don’t know. <i>You don’t care. You just want to cum.</i>");
	output("\n\n<i>“If you want,”</i> she continues, <i>“I can make it feel even <b>better.</b>”</i> She presses her arms up against either side of her tits, and you gurgle uselessly as you stare into the bottomless valley of her cleavage. Even better? Is that possible? You’ve spent countless hours stumbling blindly through dreams, utterly controlled, collared by your lust and her expert guidance. How could it get any better than that? Mindlessly cumming and indulging in every pleasure she could possibly offer your sleeping mind.");
	output("\n\nBut...<i>maybe she’s right. Maybe you can be further controlled. Maybe you don’t need to be asleep to dream. All you need to do is let her make a few little changes. All you need to do is hand over control. All of it. Having to think is such a pain. Responsibility is just a burden. It’d be so much easier, feel so much better to just be a mindless animal, awake or asleep.");
	output("\n\nYou’re already so weak-minded. You already get off so hard dreaming about being a horny breeding bull. You’d get to feel like that all the time. Every waking moment, every wonderful dream. You’d be a perpetually stiff cum-pump, drooling pre from your thick, stupid fuckrod and emptying your fat, bloated balls whenever and wherever you want. You’d be able to breed cowgirls pregnant. You’d be able to mindlessly fuck your spunk into milking machines. You’d cum every single thought in your silly little head away and just be a happy, stupid bull.</i>");
	output("\n\nYou’ve started to touch yourself without even realizing it, and Alexandra giggles at the sight. <i>“See? Your cock knows what it wants. And you gave up trying to disobey your cock a <b>lo-o-ong</b> time ago. If you were ever capable of disobeying it, that is.”</i> She presses her palms to her still-clothed tits, covering the stiff peaks of her nipples. Rubbing them in slow circles. Sending your fuckstick twitching and throbbing in desperate anticipation. Her eyes glow brighter, and you can feel her tits kneading up against either side of your stiff, twitching cock. Soft, pillowy, perfect. <i>You can just sit back and let her massage her titties around your prick until you cum. It’s all you have to do.</i>");
	output("\n\nBut there’s something more to be done, isn’t there? You’re supposed to be looking for something. Something important. <i>If it’s that important, though, wouldn’t you remember it without having to think about it?</i> Or maybe Alexandra is using her influence to make you forget. Maybe you need to fight this. <i>But why would you ever fight something that feels so good?</i>");
	output("\n\nYou grunt and gurgle in your seat, reaching a hand up to the keyboard and preparing to type...something. But what? It’s on the tip of your tongue, the end goal of your mission, the whole reason you set out and started this grand adventure.");
	output("\n\nThe probes! Your father’s legacy! That’s right, you’re <i>looking for them so Alexandra can take care of-</i> No, that’s not right, you’re looking for them for...for yourself?");
	output("\n\nAlexandra watches you frown from her flickering vantage on the viewport. Her eyes narrow before glowing brighter than ever. <i>“You’re being a bad bull,”</i> she growls, and for a moment, the pleasure throbbing in your cock fades. Your prick begins to wilt, and you whimper in disappointment. Half of you wants to apologize, to promise you’ll be good, that you’ll stop thinking.");
	output("\n\nThe other half wants to fight.");
	output("\n\n...");
	output("\n\nBut maybe you only want to fight so it’s that much better when you lose. Alexandra’s mind is moments away from subsuming yours, and what she’s promising isn’t...entirely unpleasant.");
	output("\n\nShe’s willing to make sure you win. That you inherit your father’s legacy and take control of Steele Industries. And she has <b>considerable</b> leverage. And what’s she asking for in return? Nothing. Not a single credit. If you want to hand everything over to her once you claim your inheritance, that’s absolutely your decision. She just wants you to make sure that you know what she’s prepared to give you if you do.");
	if(crew(true) > 1) output("\n\nA seemingly random twitch of your hand hits a seemingly random key on your keyboard. It isn’t until the oppressive drone of electromag locks hits your ears that you realize she just forced you to lock your crewmates in their rooms. To stop them from interrupting? To keep them trapped while she influences them?");
	output("\n\nThrough the fugue, though, you realize something important: she hasn’t made you do anything that can’t be undone. Nothing that can’t be solved with another quick press of a button, at least. Not while you’re awake. Dreaming, Alexandra can make you do almost anything at this point. She can make you jerk yourself into a mindless cum pump. She can brainwash you into her bitchtaming bullstud. She can make you sign over everything you own with a smile on your face and a fat, pre-drooling stiffie jutting up from your lap.");
	output("\n\nBut when you’re awake...it seems like you have a choice. You can refuse her offer. Or accept it. You can sink deeper. Or you can swim up to the surface.");
	output("\n\nIf you want, you can end the call, block the commline, and make sure that she’s never able to contact you again, awake or asleep. You can turn her down for good.");
	output("\n\n<i>Or you can give up. You can let Alexandra take over and be her stupid, horny, thick-dicked bull-slave. You can admit that you’re so, so weak for her powers and her big, bouncy titties. You can finally accept that you’re just a stupid, horny animal that loves to fuck. The kind of weak-willed brute that just wants to bury your cock in something hot, tight, and wet, no matter if it’s a cowgirl or a milking machine.");
	output("\n\nYou’ll be her puppet, you’ll win, and your reward will be a harem of breedable cowgirls and a life where you only have to stumble from one cumshot to the next. You’ll help her fuck her enemies into submission and control all the other weak, horny bull breeders. Even the ones who don’t know they’re just fuck-addicted bulls yet.");
	output("\n\nAnd the best part is that it’s all your choice. You’re seconds away from signing away your free will and admitting that you’d rather be a mindless drone than a real person with hopes and dreams and choices.");
	output("\n\nDo it. Give in. Give up.</i>");
	pc.changeLust(30);
	//(Give in) (or not i guess)
	clearMenu();
	addButton(0,"Give In",alexandraDream5GiveIn);
	addButton(1,"Don’t",alexandraDream5OrNot);
}

//(or not i guess)
public function alexandraDream5OrNot():void
{
	clearOutput();
	showBust("ALEXANDRA");
	author("Carol J.");
	showName("\nAWAKE");
	output("No. No! You may falter, but you’ll never fail. And if you do, you won’t fail like this! Mustering the last <b>fragments</b> of your willpower, you <b>barely manage to</b> reach over and <b>no, don’t</b> end the communication.");
	output("\n\nYou shake your head. It’s as if there’s a weight off your shoulders. Or maybe more accurate to say a fog is clearing from your thoughts. You unlock the magnetically sealed doors and begin the process of safeguarding your ship against Alexandra’s influence. True, blocking out psionics entirely is all but impossible with the resources you have now. Given that you have a direct address for where her influence is coming from, though, you can at least make sure <b>she</b> won’t be causing you any problems while you’re looking for your father’s probes.");
	output("\n\nYou briefly wonder if it’s safe to stop over at New Texas in the future. The idea that Alexandra would try to mindfuck you in person is a worrying prospect, but...well, if she’s looking for the kind of weak-willed saps that let her walk all over them, you’ve already shown her that you are <b>not</b> one of them.");
	output("\n\nAs you add her commline number to the list of blocked users, you smile. To paraphrase an old saying, ‘you can lead a bull to water, but you can’t make him drink.’”</i>");
	//(+5 will/int, maybe? seems like kind of a waste to end it with no benefit/reward for walking away)
	pc.slowStatGain("willpower",5);
	flags["ALEXANDRA_DISABLED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//(give in)
public function alexandraDream5GiveIn():void
{
	clearOutput();
	showBust("ALEXANDRA");
	author("Carol J.");
	showName("\nALEXANDRA");
	output("All the information’s ready to send. All you need to do is hit the button. All you need to do is take that one little step into blissful, mindless, stiff-dicked servitude. All your personal information, your DNA signature, everything Alexandra needs to take control of your life and make you her horny little puppet.");
	output("\n\nYou push the key.");
	output("\n\nA few seconds later, the world seems to swim before your eyes, and you sink back in your seat, knowing you’ve done the right thing. Your lips turn up in a vacant smile, and you can all but <b>feel</b> your thoughts slow to a trickle. That’s right. All you have to do now is enjoy the fantasies she’s injecting into your brain, the delusions you’re all too eager to accept as reality. Your cock twitches in anticipation, and as Alexandra brings your body to its feet, you fall into bliss.");
	output("\n\n--");
	output("\n\nThe next few days pass by in a blur of sex, pleasure, and indoctrination. Alexandra handles most of the important issues, and your hunt for the probes benefits immensely from the focus she brings to the table. As you drift through daydreams of hot, sopping-wet cunts begging to get stuffed full of cock, you’re occasionally reminded that you’re just a dumb animal who loves to fuck. Just a little voice in the back of your head, a sweet, sibilant whisper that almost seems synchronized with your mind-clearing cumshots. Whenever you pump your wad into the next dream girl Alexandra queues up for you, you get that little tickle in your head, that pleasant reassurance that Alexandra is going to make sure you don’t end up failing for <b>real.</b>");
	output("\n\nIn fact, when she realizes just how <b>hard</b> you get off on giving up and sinking into the depths of depravity, Alexandra seems more than happy to indulge your fetishes. You aren’t just milked like the stupid breeding bull you are deep down, you fall prey to each and every pitfall that could have tempted you on your hunt for the probes.");
	output("\n\n--");
	output("\n\nYou sneeze, swaying on your feet and watching a gorgeous plant-woman’s breasts bounce up and down. You’re drawn forward, a mindless slave to her titties, stumbling face-first into her enormous floral throne. You’re mesmerized by the sight of verdant vixens, brain reduced to mush as vines pump your cock and wring her next meal from your hopelessly addicted manhood. Nothing more than a spunk tank for the most cunning predator in the jungle.");
	output("\n\nYou stagger back, blinking through the fog of intoxicating pheromones that surround you. Aliens hover on bee-like wings, the steady buzz of their flight disrupting your focus whenever you try to stumble to your feet. You’re escorted to a mountaintop village and raped until your mind breaks.");
	output("\n\nYou foolishly indulge a malfunctioning robot, and her inhuman skill is so overwhelming that you can’t help but bring her aboard. Nights blend into weeks as you lose yourself between her perfect, artificial thighs. Eventually your addiction brings your quest to a halt, and you end up collecting broken, insatiable sex-bots, a prisoner of your own robotic harem.");
	output("\n\nYou collapse to the ground, stricken with lust as you realize that you’d much rather fuck the criminals you came to stop rather than fight them. One of them licks her lips and giggles as she tells you what to say over your commlink, and as soon as the Peacekeepers are assured that you’re handling the bomb defusal on your own, a well-muscled monster of a woman slams her hips down on your lap.");
	output("\n\nYou step in where you shouldn’t. You involve yourself in things far beyond the scope of your abilities, and the honey-laden ants are more than happy to take advantage of your weakness. You broker a merciless peace in your mistress’ favor, a “neutral” third party. Your reward is to be used as a toy by any woman who wants to get fucked pregnant by the tool who helped them secure their victory over the now-defanged “crimson menace.” The political balance of an entire planet is now irrevocably skewed, but you find it impossible to care, pinned to the mattress of your new queen’s bed as she uses you to relieve her lust.");
	output("\n\n--");
	output("\n\nYou groan. You can’t remember when it was exactly that Alexandra found the last probe using your body, but it’s been months at least. Months of neglecting your newly inherited business as Alexandra helms its management instead. A permanent vacation, one where you’re never more than five seconds away from something capable of emptying your balls of any sperm-packed seed you might have. Sometimes she has you fuck one of her girls pregnant, but most of the time she just lets you lay back in bed and fuck the milking machine as you stare at the pretty spirals on your mindwash visor.");
	output("\n\nAn imagined chime goes off in your head, and you rise to your feet. You have a cocksleeve to wear when you’re walking around. Alexandra makes sure her bulls always have something keeping their dick nice and hard and their brain nice and soft. Your eyes glaze over as you start reciting Alexandra’s mantras in your head.");
	output("\n\nHard cock. Soft mind. Hard cock. Soft mind.");
	output("\n\nShe doesn’t have the time to control you directly around the clock. Luckily you’ve proven to be incredibly receptive to her pleasure-based brainwashing techniques. At this point, all it takes is a reminder that your cock is hard to reduce you to a mindless slave.");
	output("\n\nAnd sometimes that’s what Alexandra needs. Like right now, for example. It’s around that time when she has you fuck your wad into a few more cowgirls. She called it “insurance” the first time she had you do it, and you start drooling as you think about how she explained it. She has to make sure you’re still in her clutches even if you somehow shake off her control. You never will, of course. It feels too good.");
	output("\n\nBut just in case you do, Alexandra’s had you breed so many bastards into her cowgirls that everything you own will end up in her coffers someday. You still remember that first exquisite cumshot, the one that cemented your addiction to pumping your load into bitches, bareback.");
	output("\n\nLucky you, she has <b>two</b> cowgirls for you to impregnate today, and that means that one of them is going to prime you as the other one fucks you. Your afternoon is a blur of hot, wet cunts and cum-bloated wombs, and even if you can’t remember what they said, you know that you came that much harder thanks to the seductive purr in your ear as one of the cowgirls told you all about how fertile the other one was. How she was ovulating, how you’d been secretly fed virility-enhancing drugs the night before. How there was <b>no way</b> she would walk away without twins at <b>least.</b>");
	output("\n\nAfter that are a few hours reinforcing your new fetishes, ones designed to reel you back in if you try to escape. The goggles go over your eyes, and soon you’re as malleable as clay. You love being manipulated. You crave powerful women, the kind who use their sex appeal to make stupid, horny men make bad decisions. You <b>love</b> cowgirls.");
	output("\n\nYou’re taken through countless hypothetical scenarios, each of them designed to wriggle into your hindbrain and become subconscious fantasies. They’re the kind of career-ending bad decisions that only happen in the heat of the moment, and you love every second of them. Gold-digging femme fatales tricking you into fucking a baby into them. Flirtatious secretaries coaxing you into letting her suck you off right in plain view of the security cameras. Stumbling drunk into strip clubs and blowing thousands, if not millions on lap dances and the kind of seedy pleasure that happens behind closed doors. Bribes, corruption, seduction.");
	output("\n\nYou smile vacantly as you empty your balls into the milking machine.");
	output("\n\n--");
	output("\n\nYou can’t even recall it anymore, but you used to be more than just a pleasure-addicted orgasm junkie. Now all you care about is that rush of pleasure when you get to cum. Your willpower’s been crushed into dust, and you’re so fucking happy.");
	output("\n\nLately Alexandra’s had you help her fine-tune some political ads she’s planning on broadcasting. She’s running for governor of New Texas, and even if Big T may still win this election, it’s only a matter of time before her ads wear away at all the other bulls’ minds.");
	output("\n\nYou’re already a brainless bullstud for her titties, but you get off even harder knowing that it helps Alexandra make her ads that much more irresistible. Eventually she has you cumming in under ten seconds, brought to orgasm by the sensuous purr of her voice as she promises a better New Texas... all thanks to a “woman’s touch.” Her tits wobble and bounce on-screen, and your cock pumps out another load in obedient response.");
	output("\n\nIn the end, you’re nothing more than a tool, the means to an end, another stepping stone for Alexandra to reach her ambitions. Exactly how you wanted.");
	pc.orgasm();
	pc.libido(100);
	pc.taint(100);
	pc.intelligence(-100);
	pc.physique(100);
	pc.willpower(-100);
	badEnd();
}

public function alexandraIndulge():void
{
	IncrementFlag("ALEXANDRA_DREAM_LEVEL");
	flags["ALEXANDRA_RESISTS"] = undefined;
}
public function alexandraResist():void
{
	IncrementFlag("ALEXANDRA_RESISTS");
	if(flags["ALEXANDRA_RESISTS"] >= 2) flags["ALEXANDRA_DISABLED"] = 1;
}

public function alexandraDreamsAvailable():Boolean
{
	return (flags["ALEXANDRA_DISABLED"] == undefined && pc.mf("m","") == "m" && pc.balls > 1 && pc.hasCock() && CodexManager.entryUnlocked("The Treatment") && !pc.hasStatusEffect("AlexandraCD") && pc.level >= 7 && getPlanetName().toLowerCase() == "new texas");
}
public function playAlexandraDream():void
{
	pc.createStatusEffect("AlexandraCD");
	pc.setStatusMinutes("AlexandraCD",24*60*2);
	if(flags["ALEXANDRA_DREAM_LEVEL"] == undefined) alexandraDream1();
	else if(flags["ALEXANDRA_DREAM_LEVEL"] == 1) alexandraDream2();
	else if(flags["ALEXANDRA_DREAM_LEVEL"] == 2) alexandraDream3();
	else if(flags["ALEXANDRA_DREAM_LEVEL"] == 3) alexandraDream4();
	else if(flags["ALEXANDRA_DREAM_LEVEL"] == 4) alexandraDream5();
}

//This scene is not accessible by taurs, requires the PC to have a cock, should possibly require the PC to have shown interest in Kase/Liamme or some other femboy character.
public function berwynSleepyBoiDram():void
{
	clearOutput();
	showBust("BERWYN");
	author("HugsAlright");
	showName("\nDREAMS...");
	output("Your dreams are assailed by images cute femboys of various species, impossibly androgynous members of the male sex fighting jealously over being the next to hop on your cock. Like all good dreams though, it’s a quickly fading bliss, and soon enough you realize that everything you’re feeling is just a figment of your unconscious imagination. As you wake, the illusion collapses: all those wonderful sensations of svelte bodies pressed against your own and all sorts of hands running along your [pc.skinFurScales], everything but that feeling of your throbbing erection being tightly squeezed inside the tight tailhole of the ausar riding your [pc.cockNoun], fades.");
	output("\n\nStrange.");
	output("\n\nAs your eyes slowly open and sleep abandons you, you realize that singular sensation was real!");
	output("\n\nYour sleep-addled mind can barely comprehend what’s going on right now, but from what you can see there’s currently a femmy, chocolate-skinned ausar bouncing on your morning wood!");
	output("\n\nYou blink a few times to try and confirm what you’re seeing is what’s actually happening, but a jolt of pleasure from your loins as the dogboy plunges down onto your cock quickly has you convinced. You groan as the the white-furred ausar’s tailhole hugs as your tool. When your consciousness fully returns to you, you’re struck by many different feelings, but one outweighs them all: confusion.");
	output("\n\nIn a vain attempt to ascertain the identity of this cock-riding femboy, you analyze his features and trying to piece together if he’s possibly a lover from last night before you simply don’t remember yet. Nothing about him strikes you as familiar though. The dark tone of his skin, his smoky black-and-white fur, his snowy locks, nor his girly hips and shapely, plump ass ring up and memories. What’s more, he’s got a massive slab of an ausar cock sitting between his legs, though you can barely see most of it with him facing away from you. You do notice his balls are covered in fur though, which seems odd for an ausar.");
	output("\n\nYou let out a quiet, pleasured cry again as the femboy makes another trip down your shaft");
	if(pc.cocks[0].cLength() >= 14) output(", your tool bulging the dogboy’s flat tummy with an outline of your manhood");
	output(". His ears twitch at your blissful tones, and he looks over his shoulder at you, a smug look on his effeminate face. He has striking, pale blue eyes that gaze at you expectantly.");
	output("\n\nLooking at him though, all you can manage to do is choke out a very sincere <i>“Who are you?”</i>");
	output("\n\nThe ausar frowns and rolls his eyes at you.");
	output("\n\n<i>“Oh, ha-ha,”</i> he says, thrusting himself down hard onto your tool, and keeping his ass pressed to your lap, <i>“Berwyn starts liking anal so you forget who he is... funny.”</i>");
	output("\n\nYou manage to get yourself up onto your elbows and ask again, <i>“No, really, who are you?”</i>");
	output("\n\n<i>“Berwyn”</i> gives an irritated groan at that, and then places a furry hand on your [pc.chest] and promptly pushes you back down onto the mattress. As you fall back to the bed, you notice his hand is distinctively more paw-like than an ausar’s would normally be.");
	output("\n\n<i>“Listen!”</i> he says sternly, <i>“This whole anal-addiction thing is your fault anyway, [pc.name]... so you’re gonna sit back and let me enjoy this!”</i>");
	output("\n\nWith that said, he begins bouncing up and down on your [pc.cock] again, leaving you moaning quietly. Seeing his perfectly round ass quaking with each downward plunge he makes seems to nullify your bewilderment as this whole scenario continues onward. Everything about this about this supposed Berwyn character seems too perfect to be true: his almost fantastical femininity, his perfectly proportioned hips and ass, and that monster ausar-cock of his bouncing up and down with the rest of this body. Just looking at the femmy dogboy fills you heart with desire for chocolate-colored femboys like him.");
	output("\n\nThe sight of the sweat rolling down his dark skin and his tongue lolling as he rides you seems to put your mind at ease. You settle back down on the covers as Berwyn begins to pant and moan, the steady pace of his pleasured noises calming you again.");
	output("\n\nNow, you find yourself smiling at this whole ordeal, and place your hand Berwyn’s wide hips as he sits himself down on your cock again and again. This time, he looks over his shoulder and smile at you, barely maintaining that smugness you saw before until a moan forces its way past his svelte lips. He turns back around, then leans forward with his arms straddling your [pc.legOrLegs]. You can’t tell if the pleasure of your [pc.cock] spreading his pucker has him doubling over or if he’s simply trying to get a better angle with his seemingly practiced dick-riding.");
	output("\n\nHis tailhole hugs ever tighter at your shaft each time your tool disappears inside his cushy ass, leaving you filled with carnal ecstasy, your body beginning to quiver as Berwyn does what you think all good ausar boys should do: take a good dicking.");
	output("\n\nBerwyn starts groaning deeply with his new position, and you can see his paw-like toes curling with each thrust he makes down onto your lap. Then you feel something warm trickling onto your [pc.legs]. Peering past the femboy’s pillowy thighs, you can see a long string of pre leaking from the tapered head of his massive cock and down onto you and your sheets. You crack a smile at that, guessing that you’re giving this ausar a pretty good prostate massage.");
	output("\n\nYou’re so focused on this mystery ausar that you hardly have any time to revel in your own pleasure, but you quickly rectify that little oversight and throw your head back with a moan. Berwyn’s steady hip movements make sure you’re never without that blissful sensation of his tailhole tightly hugging at your [pc.cock]. Sometimes he’ll thrust himself downward and plant his ass in your lap, then give his hips a nice, slow roll, rubbing your manhood all along his sensitive inner walls and teasing his prostate until his balls are leaking continuously flow of stick pre-cum. The scent of his seed is almost over-powering. Some of this femboy’s features may be un-ausar-like, but that musky scent is almost definitely ausar.");
	output("\n\nHis tail wags back and forth across your chest as he rides you only stopping its joyous motions to stand up straight and quiver each time his pillar of puppy-cock flexes and dispenses another glob of pre.");
	output("\n\nIt’s all quickly becoming too much for your mind to handle, and despite your best efforts to hold on and enjoy Berwyn’s ass for as long as you can, your body has different plans. You grit your teeth and grab tightly at Berwyn’s hips, and " + (pc.hasKnot(0) ? "pull him down right onto your [pc.knot], popping it into him and holding him down on your":"hold him down on your") + " [pc.cock] as it begins to convulse. Your body tenses under your lover’s as your orgasm ensues, and your tool spasms inside Berwyn’s tight tailhole as bliss dulls your senses and floods your mind. The first shot of [pc.cumNoun] meets the chocolate femboy’s inner walls soon after. He gasps as your seed coats floods his depths, the sudden heat of your cum causing him to clench and his asshole to tighten around your cock.");
	output("\n\nHe pants and moans at the sensation as you continue to pump him full of your cum, and it seems to you like that’s enough to get the ausar to his own climax. He shivers atop you, legs quivering as he tumbles over his orgasmic peak. His tailhole convulses around your shaft while his inhumanly large ausar cock flexes and spasms. A nigh endless supply of ausar spunk empties from his plump, fuzzy balls and all over your bed, filling your quarters with his heavy musk, which only seems to make you cum that much harder.");
	output("\n\nYour [pc.cum] is " + (pc.hasKnot(0) ? "held safe inside Berwyn’s ass by your knot":"leaking from Berwyn’s ass") + " as your climax endures.");
	var cumQ:Number = pc.cumQ();
	if(cumQ >= 2500) output(" The utterly ludicrous size of your load soon has the femboy’s flat tummy distending as he’s filled with cum, leaving his stomach nice and round and full of your seed.");
	else output(" The appreciable size of your load has Berwyn groaning contentedly as you fill him with your seed.");
	output("\n\nIt’s a while longer before you finally come down from your climax, and even longer still before Berwyn’s hefty testicles are finally empty, leaving the thoroughly-fucked femboy with his flat, boyish chest heaving, barely able to keep himself upright. As a haze of lust clears from your eyes and your senses return in full, you look up to see Berwyn smiling over his shoulder at you, looking more than a little smug, but entirely content.");
	output("\n\nHe promptly collapses back onto you with his head resting against your [pc.chest], his long snowy locks spread out along your body and bed. You grin and " + (cumQ >= 2500 ? "caress his cum-swollen tummy":"wrap your arms around his svelte midsection") + ".");
	output("\n\nBerwyn sighs happily then chuckles, <i>“Yeah, anal’s pretty good...”</i>");
	output("\n\nFor some reason, you can’t help but smile at that. You still have no idea who Berwyn really is, but something about that makes feel prideful, like you’ve won some victory over this femboy, attained some goal that you didn’t know you had.");
	output("\n\nEither way, you feel quite tired after all that besides having just woken up. So, you let your eyelids close as they grow heavy, and drift off to sleep with Berwyn in your arms...");
	processTime(35);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",berwynDream2);
}

public function berwynDream2():void
{
	clearOutput();
	author("HugsAlright");
	output("You awake for what appears to be the second time today... only to find that your dark-skinned ausar lover has disappeared!");
	//sleepingWithKase:
	if (flags["CREWMEMBER_SLEEP_WITH"] == "KASE")
	{
		showKase();
		output("\n\nIn his place, you find yourself spooning Kase. The kaithrit is still asleep and in your arms. You look down and see that at least some of what happened with Berwyn was <i>“real”</i> enough. It seems you’ve been hotdogging the poor catboy’s butt in your sleep and have completely coated his ass and back with [pc.cum].");
		output("\n\nWell, that was definitely some dream, one you won’t soon forget. For now, though, you think you better get up before Kase does...");
		output("\n\nWho knows, maybe there will be some cute ausar boys out and about in rusher space today who look a bit like Berwyn for you to lay!");
	}
	//Else:
	else
	{
		showName("JUST\nA DREAM...");
		output("\n\nLooking around, you don’t see anyone or anything, other than your [pc.cockNoun] tenting your covers. Ugh, that dream was pretty amazing, but it left you more than a fair bit horny.");
		output("\n\nYou decide you better get up and deal with that in one way or another.");
		output("\n\nWho knows, maybe you’ll find some cute ausar boy today who looks a bit like Berwyn for you to lay!");
	}
	//[Next] //End of scene.
	flags["BERWYN_DREAMED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}