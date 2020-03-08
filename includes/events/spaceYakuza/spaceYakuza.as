/* Finding the Shukuchi (so you can bang their local boss)
 * Yell at lighterfluid if this doesn't work
 * Flags:
 * SHUKUCHI_TAVROS_ENCOUNTER
 * -0: Chased, hasn't talked yet
 * -1: Chased, never talked
 * -2: Chased, talked
 * -3: Didn't chase
 * SHUKUCHI_MHENGA_ENCOUNTER
 * -0: Got rekt
 * -1: Guy beat up
 * -2: Guy beat off
 * SHUKUCHI_UVETO7_ENCOUNTER
 * -0: Got rekt
 * -1: Guys beat up
 * -2: Guys beat off
 * SHUKUCHI_FOURTH_ENCOUNTER
 * SHUKUCHI_EMAIL_TIMER
 * */

//Starts the Akane event chain, for PCs level 7 and above
public function shukuchiFoxBonus():Boolean
{
	if(pc.level >= 7 && hours >= 16 && flags["SHUKUCHI_TAVROS_ENCOUNTER"] == undefined)
	{
		output("\n\nThere appears to be a couple of hooded humanoids in a shadowed corner of a badly lit, closed up shop front. With their backs turned and wide postures, you can’t say for sure what it is they’re doing. Could just be idle conversation for all you know.");
		output("\nBut wait, is there someone in between them...? They - no, he - appears distressed. Some sort of fox-morph.");
		output("\n\nYou can’t hear what the three figures are saying but you’re certain that this is shady.");
	
		addButton(0, "Investigate", shukuchiTavrosEncounter, undefined, "Investigate", "Be the hero the fox needs right now but not the one he deserves! <b>Warning:</b> This quest involves getting your [pc.ass] beat up a lot and results in rather specific BDSM fun.\nDon’t expect to go away unscathed.");
	}
	else if (flags["SHUKUCHI_TAVROS_ENCOUNTER"] == 0)
	{
		shukuchiTavrosTalkFoxman();
		return true;
	}
	return false;
}
 
//Helping the foxman
public function shukuchiTavrosEncounter():void
{
	clearOutput();
	clearMenu();
	author("SoAndSo");
	
	output("You reservedly take note of the space around you, wondering if the two will try to flee if you confront them. Hey, you’re a trained pro, right?");
	if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" Wait, no, you’re just some tech nerd with a gun. Like that’s ever stopped you before!");
	output(" Having spotted all obvious routes for escape, you begin [pc.walking] with a hand loosely placed on your [pc.weapon]. You approach from the crowds, using the overall ambience and low light levels of the red-light sector as a cover.");

	output("\n\nIt only takes a few feet for you to hear the group, your suspicions confirmed when you hear not two but three voices in confrontational tones. Something about ‘protection’, ‘money’ and... ‘beans’? It’s all muffled and accented in a way unfamiliar to you, forcing you to focus instead on your potential battle plan. You think of what ifs: could you risk open combat in such a high security area? <i>Would they</i> risk it? When another’s life is potentially in danger, there’s no point to question it.");
	if(pc.personality <= 33) output(" Something nags you internally that it’s the right thing to do.");
	else output(" The old idea of some kind of kudos or reward shakes up your energy alongside...");
	
	output("\n\nYou’re within jumping distance of the three, wary of their arm movements and increased aggression of the hooded figures. You can see the third figure - a short fox-morph with a human face - nestled in between the two, his pawed hands put up defensively as one of the hoods barks something at him in a language you can’t make out: they’re turned away from you. The fox’s eyes seem to catch you moving, their glassy terror looking straight at you.");
	output("\n\nOh crap.");
	output("\n\nBoth hoods turn to you as if having bodies powered by pistons, revealing blank, black masks underneath and light-looking, sleeveless black body armor under cloaks and scarves.");
	output("\n\n<i>“You saw nothing!”</i> shouts one, pointing his finger at you. All at once - before you can react - the other hood gut-punches the hapless fox, the two culprits then darting off in opposite directions! Their victim collapses to the floor with a groan, clutching all over his abdomen. You let go of your [pc.weapon]’s grip, forcing yourself to choose a target!");

	addButton(0, "Chase!", shukuchiTavrosChase, undefined, "Chase!", "It’s on! Pick a guy, chase him through Tavros!" + (silly ? " YEAH, YOU, WHO ELSE AM I ADDRESSING?" : ""));
	addButton(1, "Ignore", shukuchiTavrosTalkFoxman, undefined, "Ignore", "Or... don’t. You’ve got a good source already. The culprits could be long gone in seconds.");
}

public function shukuchiTavrosChase():void
{	
	//Foxguy will wait, don't worry
	flags["SHUKUCHI_TAVROS_ENCOUNTER"] = 0;
	
	//Chase that cyberninja towards a hair salon. Make your dad proud.
	moveTo("9015");
	showName("\nCHASE!");
	clearOutput();
	clearMenu();
	author("SoAndSo");
	
	output("Eanie meanie, oh fuck this. You speed off to the best of your ability, [pc.legs] working at full sprinters pelt after the hood who assaulted the fox!");
	output("\n\nHe goes for the direction of the deck elevator, expertly weaving his way through a crowd of unsuspecting station-dwellers. You keep up but you’re still far from apprehending him!");
	output("\n\nAs you both dart around and race each other down, leaving a trail of disgruntled sex workers and patrons in your wake, you spot him hitting the much more crowded shopping district. Sheer Beauty comes into view just as a long, bustling crowd of similarly dressed, suited humans walk past it towards you.");
	output("\n\nThe hooded culprit slows his speed but quickly adjusts his footing, sidestepping into the incoming group in a seamless fashion. Almost instantly, you lose clear sight of him aside fromthe bobbing black top of his hood.");
	output("\n\nYou’re forced to take the other aisle, the rest of the shopping district forming a colorful obstruction for your speedy chase.");
	if(pc.tallness <= 84) output("\n\nYou have to squint and hop around just to keep track of that bob but you’re still able to follow it.");
	else output("\n\nIt’s no effort to follow the erratically moving bob from above, although there’s still a crowd of bodies stopping you from a speedy advance.");
	output("\n\nYou spot a gap in your lane up ahead: some idle shoppers just standing around an open plaza space. Time to close the distance!");
	output("\n\nUsing the gap, you sprint with as little public collision as you can muster towards the bobbing head, his own cover melting away as you breeze by a kiosk. Somehow, he’s still kept tabs on you, quick movements of his head suggesting the anticipation of your movements. A smart, experienced one to say the least!");
	output("\n\nYou catch sight of a small cluster of U.G.C. officers ahead, cracking some joke or another on duty. You react quickly in an attempt to catch their attention!");
	output("\n\n<i>“Heeey!”</i> you shout, as loud as your breathless lungs will let you. The officers turn their heads, slow to react to the oncoming chase.");
	output("\n\nYou see the hood raise his fist in the air, something small and blue peeking out between the clenched fingers: a grenade?!");
	output("\n\nWith a quick series of motions, the hood chucks his payload right before the officers, leapfrogs one of the confused lawbringers and springboards off of another!");
	output("\n\nYou’ve only a second of taking in the acrobatic display before having to cover your face with your arms!");
	output("\n\n<i><b>PREEEEeeeeeeeeeeeee!</b></i>\nInstead of the bone breaking, horrific explosion you were expecting, a punctuating wail and impossibly bright light makes its way into your peripheral vision! You can’t help but grunt and grityour teeth, still staggering forward in the direction you think you were moving in.");
	output("\n\nThe screams and shouts from around you seem to blur into nothingness and the only focus is the masked culprit. With some hefty blinks and a wall to lean on, you catch a blurry glimpse of that hood and mask looking back at you for a few solid seconds. It’s almost as if he’s taunting you from afar...");
	output("\n\nDetermined not to let this criminal go, you give chase once again with a renewed surge of energy!");
	
	addButton(0, "Next", shukuchiTavrosChasePartIITheChasening);
}

public function shukuchiTavrosChasePartIITheChasening():void
{
	//Now towards an elevator. Make your dad prouder.
	moveTo("MERCHANT'S THOROUGHFARE2");
	soreDebuff(1);
	clearOutput();
	clearMenu();
	author("SoAndSo");
	
	output("The crowd thins surprisingly quickly as you race down the deck, some sort of warning alert playing out along the plazas and walkways while the occasional UGC officer gets caught in the crowds.");
	output("\n\nYou can see that even this acrobatic assailant is tiring somewhat, his parkour-esque jumping and people-dodging becoming less and less finessed as you catch him up! Even if it takes its toll on you all the same, you’re confident you can catch this bastard...");
	output("\n\nThe assailant holds another device in his hand, the same blue as before!");
	output("\n\nWith a little more forethought, he throws it almost directly at you!");
	output("\n\nOn instinct, you dive to the left with your arms in front of your face, just about keeping yourself on your [pc.feet] as another flashbang, wall of horrified screams and chorus of loudspeaker announcements causes more pain for your senses! But you’re so close...!");
	output("\n\nYou see the elevator up ahead, the doors opening just wide enough for the assailant to slip into the empty carriage. Now’s the chance!");
	output("\n\nOnly a few feet away, you dive for the open doors and land inside! Taken over by adrenaline, you ignore the painful ache in your elbows from impact and push yourself up to see the... culprit...");
	output("\n\n...as he looks at you from the other side of the doors.");
	output("\n\n<i>“You saw. Nothing,”</i> he says in a roboticized voice, gesturing with an open palm over his face. As he lowers it, a stealth field follows and completely removes him from view, as if he was never there to begin with.");
	if(silly) output(" <i>dramatic brass section</i>");
	output("\n\nThe doors close.");
	output("\n\nYou slump against the floor with your hands over your eyes.");
	output("\n\n<i>Fuck.</i>");
	output("\n\nWell, the least you could do is check out the victim. He’ll certainly know at least a thing or two about his ‘friends’...");
	
	addButton(0, "Leave", shukuchiTavrosChaseCredits);
}

public function shukuchiTavrosChaseCredits():void
{
	moveTo("LIFT: RESIDENTIAL DECK");
	mainGameMenu();
}

public function shukuchiTavrosTalkFoxman():void
{
	clearOutput();
	clearMenu();
	author("SoAndSo");
	
	//Did the pc come back from the chase or did they not even bother
	var pcIsLazy:Boolean = flags["SHUKUCHI_TAVROS_ENCOUNTER"] == 3;
	
	if (pcIsLazy)
	{
		output("No way you’re falling for that trap.");
		output("\n\nYou point your [pc.weapon] between the two fleeing individuals, a show of force to ensure they don’t turn back to attack. You’ve little fear left as they both blend into the crowds around you, leaving their foxy friend on his own. You walk up to him with your piece stashed away, hands raised as a show of peace and goodwill.");
	}
	else
	{
		flags["SHUKUCHI_TAVROS_ENCOUNTER"] = 2;
		output("Having been winded, blinded, bashed about and thoroughly perplexed from your random act of kindness, you’ve a growing curiosity for what transpired. So many questions multiplying as you consider what happened: how did all this get by security? Why was security slow on the uptake? Who were the assailants and what kind of illegal nonsense where they involved in?");
		output("\n\nAs you make your way along the shopfronts, wary of the U.G.C. personnel clearing up the mess, juggling airwaves and reassuring passers-by, you catch sight of the fox victim recounting the incident to a detective. He seems no worse for wear, aside a slight jitter in his movements and clasped gut. Certainly a good source to get some information out of, you think. The detective has already begun moving off, his leather mack twirling behind him as he returns to his subordinates.");
		output("\n\nWith that window open, you power walk over to the fox and raise your hand to greet him, hoping that he doesn’t see you and freak out.");
	}
	
	output("<i>“Ohh jeez, oh no!”</i> he calls out, wiping his eyes with the back of his paw. <i>“Look, I’m too tired to run, just ask what you need and let me be, alright?");
	if (!pcIsLazy) output(" The detective knows everything and that punch was... something else, I tells ya.");
	output("”</i>\n\nYou try to clarify, only wishing to get the facts straight with the hope of solving this strange incident.");
	output("\n\n<i>“Consider me curious and keen,”</i> you add, offering a hand for him to shake. He does so with obvious reluctance, the winded look on his face turning into defeat.");
	output("\n\n<i>“Might as well come clean then, U.G.C. are useless for this shit, enough for me to trust a random savior at least. So you know how it is in this galaxy, pretty much everything has its price. Little did I know that, as a small-time goods dealer on some backwater station, there are assholes with a vested interest in my ‘safety,’”</i> he begins, leaning his back against the wall. You fold your arms as he talks, occasionally staring him in the eye as he tells his story.");
	output("\n\n<i>“Now these goods ain’t much, just food and drink not normally sold here, nothing illegal... okay, maybe some ‘grey areas’ but I paid off the right people. Who knew soybean was considered a rarity in this part of space? Anywho, some other people come along, all mysterious and masked like some motherfuckers out of one of them mindless " + (silly ? "vidja gaems" : "vid games") + " I grew out of. They lay down an ultimatum: take this deal or they take my legs,”</i> he sighs, clutching at his orange-red tail meekly. You ask him to continue, determined and patient as you listen.");
	output("\n\n<i>“Deal isn’t so bad, all things considered. I give them some profit and an ‘associates discount,’ they come by and <b>buy</b> some things, keep the competitors away from suppliers, usually treat me right... just sometimes I can’t pull enough cash. They play rough a bit, never enough to put the nails in though. That punch was the worst I’d had in months so it’s usually ok. But, ‘nice’ as it is, I wouldn’t say no to having them gone...”</i>");
	output("\n\nHe finishes with his head in his hands, his breathing a little wheezy. You comfort him with a rub on his shoulder, asking him for any other details.");
	output("\n\n<i>“Appreciated. Uh, details, details... no idea of any personal names, it’s different people each time. Same getup too, whole hood and mask thing. If I didn’t know it was an organic under there, I’d have thought it was androids or somethin’. Anyway, never had any direct confirmation but... I have <b>heard</b> a potential name for the group,”</i> he sighs, pulling at his tail again.");
	output("\n\n<i>“Host Shukichi. I only heard it the once but it’s like a clan sign or something, iunno. Gotta be useful though, right? It’s not a name I’ve ever heard elsewhere,”</i> he finishes, shrugging his shoulders.");
	output("\n\n<i>“I’m pretty sure that this isn’t just a Tavros thing, how could it be? My suppliers probably get their own problems, the Host being one of them and with the tech they pool, they gotta be minting it somewhere else.”</i>");
	output("\n\nHe pauses for a moment.");
	output("\n\n<i>“Ey one more thing, before you go hunting for ghosts: you might be as good as their agents or better but they’ll have their tricks. They ain’t the type to kill but they ain’t the type to let you off easy.”</i>");
	output("\n\nYou mull it over a bit, taking time to consider the poor fox’s ideas. You thank him with another shake, thinking that it would be best not to linger in case this ‘Host’ or anyone else intrudes on your investigations or - indeed - on any other investigators.");
	
	addButton(0, "Leave", shukuchiReturnFromFoxman);
}

public function shukuchiReturnFromFoxman():void
{
	processTime(60);
	moveTo("TAVROS HANGAR");
	mainGameMenu();
}

//Private Steele Dick 2: Revenge on Mhenga (as in taking place there, not against it)
//Space jungle japanese crime syndicates
public function shukuchiMhengaBonus():Boolean
{
	if (flags["SHUKUCHI_TAVROS_ENCOUNTER"] != undefined && flags["SHUKUCHI_MHENGA_ENCOUNTER"] == undefined)
	{
		output("\n\nThere’s a hooded, diminutive humanoid hanging around outside the space port. At a glance, you’d say a particularly bushy ausar male: a glossy tri-color of white, black, and toffee brown, lean and piston-like in his build. He has sleeveless body armor, all in black, with a short cape and hood. A smooth, featureless orb of a mask covers his features, a lot like...");
		output("\n\nWait a second.");
		output("\n\n...A lot like those thugs on Tavros.");

		addButton(0, "Investigate", shukuchiMhengaEncounter, undefined, "Investigate", "In the jungle, the mighty jungle, there lives a weird space mafia. Considering the culprits got away before, you’re gonna have to expect some tricks.");
	}
	
	return false;
}

public function shukuchiMhengaEncounter():void
{
	clearOutput();
	clearMenu();
	author("SoAndSo");
	
	output("Given how your last encounter panned out, you figure the hands-on-weapon method is not the right approach for this one. The mask and hood confirm it all: someone who’s a part of or affiliated with the mysterious syndicate operating out of Tavros.");
	output("\n\nHe’s on his own, so it seems. Waiting for something, perhaps, or at least setting up for some scheme you couldn’t put a finger on.");
	if(flags["MET_PENNY"]){
		output("\n\nYou’re certain that Officer Penny would be aware of a shady character operating like this, although this is the most backwater a planet can be.");
		if (penny.isBimbo() || pennyIsCumSlut()) output("\n\nThinking on it, Officer Penny probably has more cum-centric problems to take care of, anyway...");
	}
	output("\n\nHaving no clear route of action on the spot, you approach the leaning figure from the side with your left arm to the wall, careful not to make yourself too obvious. You can’t see him react to you and with that mask, it’s impossible to know if he’s playing you or not. Nothing for it, either way...");
	output("\n\nAs you come within several feet of him, there’s the echo of synthetic voice chatter and static coming through your codex. How in the hell...?");
	output("\n\nYou press an [pc.ear] to it, hoping to pick up the details.");
	output("\n\nSale, chemicals, no show, mark, blood money...");
	output("\n\nSome terms seem to make sense but the rest is just digitized enough to be indecipherable. You pause for a moment, hoping to pick up on anything else important while keeping out of sight. A hand finds itself trailing along your [pc.weapon], just in case... even against your better judgement. Perhaps a desperate measure, although flashbangs could only be the tip of the iceberg with these types of organized criminals.");
	if(pc.isBimbo() || pc.isBro()) output(" Jeez, when did I get all smarty and brainful? Gotta get rid of this non - sexy stuff later!");
	output("\n\nYou keep quiet as the strange communication continues, a knot rising in your chest as you seem close to uncovering some master mystery in the easiest way possible.");
	output("\n\n<i>“I could do with a fuckin’ lay...”</i> is blurted through the codex.");
	output("\n\nInteresting.");
	output("\n\nWithout a signal, the cloaked ausar pushes himself off the wall and walks off south. Giving a wide berth, you hold on before following him, only taking a few trepidatious movements once you’re certain he’s out of earshot.");
	output("\n\nLooking this way and that to check for a clear coast, you start following him as he sticks to the jungle side of the path. What you’ll find when he finds his destination, you couldn’t posit at this point with any kind of certainty...");
	output("\n\nAnd as you think for a second too long on that point, the ausar waves his hand in front of his face and melds into the foliage, becoming a ghost of green leaves and air.");
	output("\n\nWell <i>shit</i>...");

	addButton(0, "Next", shukuchiMhengaAmbush);
}

public function shukuchiMhengaAmbush():void
{
	clearOutput();
	author("SoAndSo");
	
	output("You figure this is a dead end, the suspect having disappeared right before your eyes with some sort of cloaking mechanism. With your only lead dead in the water, you turn back towards the Mhen’ga spaceport with a defeated sigh.");
	output("\n\nHowever, you can’t quite shake the fee");
	output("\n\n<i><b> GRNKKKK </b></i> ");
	output("\n\nYour eyes close up as a heavy, shocking pain in the back of your head makes you lurch forward, almost to the floor!");
	applyDamage(new TypeCollection({unresistablehp: 30}, DamageFlag.BYPASS_SHIELD), null, pc, "minimal");
	output("\n\nA pair of fast, clawed hands grip you by the shoulder and neck, an angry bark coming from overhead.");
	output("\n\n<i>“Gotcha! Whoareyou!!”</i> he growls, trying to wrestle you to the ground!");
	if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output("\n\nWith your mercenaries instincts alert and ready, you fling your arm and upper body around with a fist at the other end, staggering the ausar back as it hits him right in the cheek!");
	else if (pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("\n\nWith a little bit of sneaky thinking, you pull your [pc.legs] up so that you pivot on your palms, the sudden fall in posture from the ausar allowing you to springboard him away from you with your [pc.legOrLegs]!");
	else if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output("\n\nWith a bit of desperation, you trigger a panic circuit in your codex and swing your arm around to make contact with the ausar! The shock staggers him back, leaving him open!");
	
	processTime(1);
	
	output("\n\n<b>It’s a fight!</b>");
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new ShukuchiAusar());
	CombatManager.victoryScene(shukuchiMhengaVictory);
	CombatManager.lossScene(shukuchiMhengaLoss);
	CombatManager.displayLocation((silly ? "AUSAR FUCKER" : "AUSAR AGENT"));
	
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function shukuchiMhengaVictory():void
{
	author("SoAndSo");
	if (enemy.HP() <= 0)
	{
		output("The masked assailant slips to his knee, his head bowed low and his chest heaving for air as he struggles to recover from that last hit. He hides his blade, concealing it away as a sign of surrender. Now to get some juice out of him...");
		flags["SHUKUCHI_MHENGA_ENCOUNTER"] = 1;
	}
	else
	{
		output("The masked assailant staggers backwards and onto his knees and palms, whining as your sexual prowess upsets his physical aggression.");
		output("\n\n<i>“Whyyyy didn’t I jack off before I left, whyyyy,”</i> he groans, crumpling up and hiding his weapon from view.");
		flags["SHUKUCHI_MHENGA_ENCOUNTER"] = 2;
	}
	
	output("\n\nYou hold your weapon out all the same, figuring that he’d be smart enough to have a backup. At least you can threaten him for answers with the power of " + indefiniteArticle(pc.getWeaponName(true)) + "! You’re within a half meters grasp of him, your hand outstretched to-");
	
	addButton(0, "Wuh?", shukuchiMhengaMerge);
}

public function shukuchiMhengaLoss():void
{
	author("SoAndSo");
	output("You’re knocked to the floor by a blind-siding spinkick, your [pc.weapon] clattering underneath as a sure sign of your defeat!");
	output("\n\nYou look up from your prone position, gasping for air as pain aches and throbs throughout your entire abdomen.");
	output("\n\nThe ausar squats beside you, his arms on his knees and weapon nowhere to be seen.");
	if (silly) output(" <b>“CYKA BLYAT,”</b> is what his body seems to say.");
	output("\n\nYou fully expect him to do you in there and then, his entire M.O. seeming to leave no room for a scene...");
	output("\n\nHe leans in closer, picking up your piece and putting it back in your...hands...?");
	
	flags["SHUKUCHI_MHENGA_ENCOUNTER"] = 0;

	addButton(0, "Wuh?", shukuchiMhengaMerge);
}

public function shukuchiMhengaMerge():void
{
	clearOutput();
	author("SoAndSo");
	
	output("<i>“You saw nothing,”</i> comes a digitized voice, calm and ready from ");
	if (flags["SHUKUCHI_MHENGA_ENCOUNTER"]) output("below you.");
	else output("above you.");
	output("\n\nWith the same quick hand gesture as before, leaving you no time to speak or react, his stealth field swiftly bleeds over his body and the faint sound of rapid footsteps blasts by you.");
	output("\n\n<i>Damnit.</i>");
	output("\n\nAnother strange thug having evaded your capture, you decide to pull your sorry ass together instead and put this event out of your mind for now. A hundred different questions play over and over again in your head as you take stock of all your gear, giving you more impetus to get to the bottom of this odd cabal of masked weirdos. Better keep those eyes peeled!\n\n");

	if (flags["SHUKUCHI_MHENGA_ENCOUNTER"]) CombatManager.genericVictory();
	else CombatManager.genericLoss();
	
	processTime(30);
}

public function shukuchiUvetoBonus():Boolean
{
	if (flags["SHUKUCHI_MHENGA_ENCOUNTER"] != undefined && flags["SHUKUCHI_UVETO7_ENCOUNTER"] == undefined)
	{
		output("\n\nIn the icy streets of Irestead, under a dimly lit lamp, stands a nervous-looking human. He couldn’t be more than 18 or 19, layered in an oversized coat and snow wear with a black hood covering most of his head. He seems to be trying to warm himself, waiting for someone perhaps.");
		output("\n\nYou don’t think much of it: it’s quite literally some guy.");
		output("\n\nYou spot him fumbling with something, something bowl-ish and black, almost like...");
		output("\n\n...a mask.");
		
		addButton(0, "Investigate", shukuchiUvetoEncounter, undefined, "Investigate", "More of these thugs and their sneaky tech. You swear to fuck, if they run away again...");
	}
	
	return false;
}

public function shukuchiUvetoEncounter():void
{
	clearOutput();
	clearMenu();
	author("SoAndSo");
	
	output("Before setting off, you measure your choices: previous run-ins have had these Host agents ahead of you at a moment’s notice, they’re dangerous and seemingly <i>too</i> fast for the local law enforcement.");
	output("\n\nPerhaps the past methods of jumping out with all the bells and whistles to alert the suspects should be avoided this time...");
	output("\n\nYou decide to go full covert, looking all over for a distant spot to observe this suspicious human. Spying a shadowed nook from behind a building support, you casually walk behind it and lean back just enough to give yourself a view of the suspect.");
	output("\n\nNo major movements so far, just more hand-warming and twitchy looks.");
	output("\n\nMight be a rookie, you posit. Is this what you do when you join such an organization? Stand in the snow on a frozen ice-ball of a planet and wait around for... something? Irrelevant now, any movement could mean something. You keep a hand near your [pc.weapon], the absolute last resort in every case.");
	output("\n\nYou take a mental note of the mask: black on both sides, smooth on the front face. The inside appears to be moulded to the face of the user, from the small glimpse you get of it. If he has any weapons or disruptive devices, it’s one more thing you’re unable to tell. All that bulky snow gear is more useful than it appears...");
	output("\n\nOut of some unseen corner comes a male huskar, similarly dressed to the human. You instantly tense up as you spot his mask on his face, the confident step of the huskar appearing to put the human at ease. You sink back a little further against the wall.");
	if (pc.tallness > 72 || pc.isTaur()) output(" When you consider your stature, you hunker down further, just as a precaution.");
	output("\n\nThe huskar strides slowly, now within a meter of the human. You wait for them to make contact and...");
	output("\n\nNothing.");
	output("\n\nHm.");
	output("\n\nThe huskar continues walking along, mask and all, while the human merely looks around him as if ignoring the other agent completely. As the huskar strides away and out of view, the human dons his mask in a slow and purposeful manner. From the way he angles it as he puts it on - from forehead to mouth in one slow motion - an idea springs about that it must be some sort of rite or ritual. You couldn’t say at this point, only that the game plan stays the same: follow the rookie.");
	output("\n\nAt that moment, the human turns right and begins a slow walk south. What could be down there? Racecourse...?");
	output("\n\nWould make sense that a crime ring would have a gambling and betting angle. With that in mind, you wait just long enough for him to be out of earshot and consider following.");
	
	addButton(0, "Next", shukuchiUvetoSleuth);
}

public function shukuchiUvetoSleuth():void
{
	clearOutput();
	author("SoAndSo");
	moveTo("UVI N40");
	showName("FOLLOWING\nSUSPECT");
	
	output("There’s little in the way of crowding as you track the masked agent towards the racecourse. With this weather, you both consider how to navigate the snowy streets. You’ve little difficulty in keeping up with him: the bulky jacket and general chill in the air would be enough to discourage anyone from going about in this weather.");
	output("\n\nYou see him tapping on some sort of device every now and then, a small datapad no bigger than his hand. It’s impossible to tell what’s on it from that distance and angle.");
	output("\n\nThe human pauses for a moment, making you sidestep towards a wall for cover. You check around for civilians in the area: only a few couples here and there, all heading towards the track.");
	output("\n\nRace day?");
	output("\n\nAs you ponder that, a portly looking figure lumbers from around a corner, a walking cane in his right hand. Wearing some sort of furred hat and the smuggest smile you’ve seen on a man, he ambles along at a leisurely pace in the opposite direction to you, northbound for some other reason. You’d think nothing of it at any other point but when the portly man and the masked agent brush against each other.");
	output("\n\nYou raise your codex UI up: even a low rez image could be useful here.");
	output("\n\nYou see the glint of several small circles exchange hands in the meeting, the fat, gloved hand of the portly gentleman dropping them into the incoming palm of the masked agent. That smug grin beams ever brighter as he does so, perhaps the sign of a job well done. In any case, as quickly as they intersect, they brush past each other as if nothing had happened at all.");
	output("\n\nHmm...");
	output("\n\nThe human then raises his hand in front of his face, some distance away from the sparsely populated streets. In a motion you’ve grown to recognize, he pulls his hand down and a stealth field blends over his form. You stop as you lose complete sight of him, reconsidering your options. Thinking on your toes, you decide to track down the wobbling fat man. You could put the nails to him if need be: you’ve got photographic evidence of collusion with a criminal gang...");
	
	addButton(0, "Follow", shukuchiUvetoSleuthMore);
}

public function shukuchiUvetoSleuthMore():void
{
	clearOutput();
	author("SoAndSo");
	moveTo("UVI J34");
	processTime(60);
	
	output("Despite the cold, you’ve more drive than ever to get to the bottom of this.");
	output("\n\nThe portly gentlemen is as slow as he looks, stretching the idea of a leisurely stroll as he makes his way north towards the intersection. You figure you can loosen your guard a little, considering he’s not once looked over his shoulder. You walk in tandem with him, the opposite side of the street giving a generous distance for you to remain out of his line of sight.");
	output("\n\nIt’s a long, uneventful walk. Aside from very rarely adjusting his coat, the fat man makes little significant movement or action. His smugness doesn’t seem to wear off either. It takes a while, during which time you’ve relaxed in tune with your mark as he goes slow.");
	output("\n\nIn time, he reaches the heavy doors leading to the spaceport elevator, just before the geological building. You stay back a little as he ambles through the sliding walls of metal, the grace period before they close giving you enough space to rush in behind him.");

	addButton(0, "Next", shukuchiUvetoSleuthMost);
}

public function shukuchiUvetoSleuthMost():void
{
	clearOutput();
	author("SoAndSo");
	
	output("The fat man comes to a halt as he hugs a building, reaching for some device or another in his pocket.");
	output("\n\nNow’s your chance, while he’s preoccupied.");
	output("\n\nChecking for any witnesses, you take a path over to him that puts you out of his line of sight. From what you’ve seen and gathered, you can force a response out of him with some deft words and finger waving.");
	output("\n\nAnd all of this right under the syndicate’s nose.");
	output("\n\nYou approach from his right, [pc.walking] lightly and cautiously up to his side. You reach out and grab his arm and shoulder, holding him in place!");
	output("\n\n<i>“Oh pardon me, I- excuse me! Let go you-”</i> he stammers, stuffing his device into a pocket.");
	output("\n\n<i>“I have evidence of you making deals with known criminals,”</i> you state flatly, boring your eyes into his alarmed face.");
	if (pc.personality <= 33) output("\n\nDamn, feels good to be bad once in a while!");
	else if (pc.personality <= 66) output("\n\nIt’s all for show anyway, he’ll get over it.");
	else output("\n\nTime to apply some real nails to this scumlord.");
	output("\n\n<i>“I-I say, I know nothing, " + pc.mf("sir", "madam") + "! Is this some ruse o-or racket?! Need I scream for help?! Believe me, I have the lungs of a Netherfrostic whale a-and-”</i>");
	output("\n\nYou jerk his arm enough to shake him on the spot, making him halt his ranting for a second. You assure him that you just need information: what’s his deal with the masked agent, does he know who they are, how they operate, what they’re planning?");
	output("\n\n<i>“I-I-I’m just one of many betting managers, a humble fellow! Look, I’ll tell all just please, please! Let go of this jacket, it’s <b>exceedingly</b> expensive!”</i> he flusters, batting at your hand. You relent, letting go of his shoulder but cornering him with folded arms.");
	output("\n\n<i>“Right, right, right, you seem to be of at least a r-reasonable sort! But it’s true, I merely collect earnings and g-give them to the winners! Of course, that depends on who you see as ‘winners’, ahehehe...”</i> he begins timidly, idly rubbing his coat in duress.");
	output("\n\n<i>“I just addle a few numbers here and t-there, the fairest form of tax, I assure you! And then... ‘they’ come by to collect. In turn, the racecourse gains security and an undercurrent of legitimate business. Think of it what you will, I have the city’s best interests in mind!”</i> he exclaims, thumping his cane against the floor.");
	output("\n\nYou’re less concerned about that and more concerned about names, aims... dangers.");
	output("\n\n<i>“Names? Only... Host and sometimes </i>‘Shukuchi’<i>. I don’t know what it all means! But apart from that, no names, only masks and agents. Sometimes male, female, alien, anything at all. If it weren’t for the agents, they’d might as well not exist and they’d be very far from my mind... I’d rather it all be left alone, be left alone myself! As for what they’re doing here, I’ve no idea, what do criminals usually do? Make money is my own guess, I’m sure yours as well! Undesirables all, the difference is the amount of firepower between me and them!”</i> he kicks up again, harrumphing his way through his answers.");
	output("\n\nYou draw your thumb and index finger across your eyes, inhaling slowly and exhaling with audible annoyance. Another dead end, it seems.");
	if (pc.isBro()) output(" This sucks balls: why can’t those buttholes just fight you already?!");
	output("\n\nYou back away from the suspect, not knowing what to make of it all. The portly man slinks off in a surprisingly speedy fashion, as if his life was hinging on it. Not as if he’s any use now. With another dead lead, you decide to put the whole thing to rest and get back on the road.");
	output("\n\nYou shuffle a few meters forward, past a nearby alleyway and then...");

	addButton(0, "Huh??", shukuchiUvetoAmbush);
}

public function shukuchiUvetoAmbush():void
{
	clearOutput();
	author("SoAndSo");
	
	output("A bristling wave of air leads to something throwing you into the alleyway!");
	output("\n\nYou land on your elbows and [pc.knees], pushing yourself forward by your [pc.feet] to face your attacker.");
	output("\n\nThe air ripples then breaks away as two tall figures in black materialize before you: blank masks, hoods, body armor...");
	output("\n\nAh shit.");
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new ShukuchiHuman(), new ShukuchiHuman());
	CombatManager.victoryScene(shukuchiUvetoVictory);
	CombatManager.lossScene(shukuchiUvetoLoss);
	CombatManager.displayLocation("HOST AGENTS");
	CombatManager.encounterText("Two similarly built, human male agents wearing black body armor with masks and hoods. They’re taking up equal amounts of space, just enough to maneuver in a close-quarters environment. In their hands are a hardlight dagger each and some sort of advanced-looking fake knuckle device in the other. The blue glow of the devices makes you wary. While they’re not advancing on you, you’re sure they’ve no intention of letting you escape...");
	
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function shukuchiUvetoVictory():void
{
	author("SoAndSo");
	
	if (enemy.lust() < enemy.lustMax())
	{
		flags["SHUKUCHI_UVETO7_ENCOUNTER"] = 1;
		output("Both agents struggle to hold themselves up after a very physical tussle, using the confines of the alleyway for support. Knowing failure, they both hide their weapons away and push themselves onto one knee.");
		output("\n\nHonor in defeat.");
	}
	else
	{
		flags["SHUKUCHI_UVETO7_ENCOUNTER"] = 2;
		output("Both agents struggle to hold themselves up after getting so thoroughly aroused by your salacious tricks. You can see them clutching at their lower bodies, surely dismayed that they were defeated in such a perverted, demeaning way.");
		
	}
	output("\n\nYou saunter over to the two of them with your [pc.weapon] held up, knowing that their M.O. is to run first. True to that assertion, both assailants adjust themselves to kneel properly, their heads bowed low: it seems you’ve cut off their escape route.");
	output("\n\n<i>“You should’ve left our mutual friend alone,”</i> says one, the roboticized voice low and breathless. Mutual friend... the betting manager?");
	output("\n\n<i>“And what could you do now? You’re in my sights,”</i> you say, staring the two down as you approach with an unsure step.");
	output("\n\nYou couldn’t be more than a foot away from them when-");
	
	addButton(0, "OhNotAgain", shukuchiUvetoYesYesAgain, undefined, "Oh Not Again", "Again with this disappearing act, oy.");
}

public function shukuchiUvetoLoss():void
{
	author("SoAndSo");
	flags["SHUKUCHI_UVETO7_ENCOUNTER"] = 0;
	
	output("You stagger backwards as your body and strength give in to the twin assault, clutching your [pc.weapon] in both hands.");
	output("\n\nThe two agents, with the confident postures of victory, cast longer shadows as they slowly, defiantly corner you in. You brace yourself for inevitable pain...!");
	output("\n\n<i>“You’d be wise to not get involved in the future,”</i> says the closest, the two of them stowing their weapons away in brisk movements.");
	output("\n\n<i>“S-so...I’m free to go?”</i> is all you blurt out.");
	output("\n\nThey both raise their hands over the faces.");

	addButton(0, "OhNotAgain", shukuchiUvetoYesYesAgain, undefined, "Oh Not Again", "Again with this disappearing act, oy.");
}

public function shukuchiUvetoYesYesAgain():void
{
	clearOutput();
	author("SoAndSo");
	
	output("<i>“You saw nothing,”</i> says the closest agent, both of their hands giving way to stealth fields.");
	output("\n\nYou consider retaliation. Invisible as they are, a swipe or a shot would catch them in this window.");
	if (flags["SHUKUCHI_UVETO7_ENCOUNTER"]) output("\n\nThey did submit, however... honor for honor. You instead put your [pc.weapon] in its holster and dust yourself down.");
	else output("\n\nYou wouldn’t want to antagonize them further: you lost, after all. Tired and beaten, you pull yourself up against the wall, stow your [pc.weapon] and dust yourself down.");
	output("\n\nWith a sigh, you stumble out of the alleyway and hold yourself up against a wall. You consider what you’ve learned and uncovered from all of this...");
	output("\n\nThey’ve got their fingers in many financial pies, small scale by the looks of things. They’re highly trained and seem adept at stealth-based combat. They have some semblance of moral code: it wouldn’t be difficult for them to outright kill anyone that got in their way, yet they’ve only tried to subdue you instead...");
	output("\n\nAside that, only a few words stand out: Host and Shukuchi.");
	output("\n\nBut with all your leads found by chance and burnt out, you’re not sure how to proceed. You’ve a suspicion that if you don’t find them, then they’ll find you...");
	output("\n\nWith this in mind, you head back towards the spaceport elevator.\n\n");
	
	flags["SHUKUCHI_EMAIL_TIMER"] = GetGameTimestamp();
	
	if (flags["SHUKUCHI_UVETO7_ENCOUNTER"]) CombatManager.genericVictory();
	else CombatManager.genericLoss();
}
