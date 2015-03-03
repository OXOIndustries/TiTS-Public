import classes.Creature;
//Encounters
//Note: If PC has a dick encounter rate should be 75% female, 25% male, if female vice versa.
public function encounterASexBot():void
{
	foes = new Array();
	chars["SEXBOT"].prepForCombat();
	author("Nonesuch");
	sexBotDisplay();
	//Technically already in combat. Overwrite!
	userInterface.showName("\nSEXBOT");
	var manbot:Boolean = (foes[0].mf("dude","lady") == "dude");
	
	if(!pc.hasCock() && !pc.hasVagina())
	{
		output("\n\nA level humming sound permeates this area of the junkyard wastes, coating the distant, harsh strains of heavy industry. The source of it becomes apparent as a pale-grey figure emerges from a grotto of wrecked spaceship parts, stepping calmly towards you. Your first thought, as you cautiously check for your weapons and codex, is that some sort of heavily robotised raskvel is approaching you. It is shaped exactly like one of the squat aliens, but everything from its heavy thighs to its long ears seems to be made from a grey, metallic fibre, plated here and there with a shiny, white latex-like plastic. Its female sex and lips look soft and rubbery, its solid eyes a backlit green, locked on you.");
		output("\n\n<i>“Scanning new client,”</i> it says in a neutral, pleasant tone. Its eyes brighten and flicker over your body, making you twitch. ");

		{
			output("<i>“[pc.Race] acknowledged. Lack of genitals unsuitable as client. Good day.”</i>");
			output("\n\nThe odd robot turns and departs without another word, seemingly uninterested in your lack of genitalia.");
		}
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	//First
	if(flags["MET_SEXBOTS_ON_TARKUS"] == undefined)
	{
		flags["MET_SEXBOTS_ON_TARKUS"] = 1;
		if(manbot) flags["MET_SEXBOT_MALE_ON_TARKUS"] = 1;
		else flags["MET_SEXBOT_FEMALE_ON_TARKUS"] = 1;
		output("\n\nA level humming sound permeates this area of the junkyard wastes, coating the distant, harsh strains of heavy industry. The source of it becomes apparent as a pale-grey figure emerges from a grotto of wrecked spaceship parts, stepping calmly towards you. Your first thought, as you cautiously check for your weapons and codex, is that some sort of heavily robotised raskvel is approaching you. It is shaped exactly like one of the squat aliens, but everything from its heavy thighs to its long ears seems to be made from a grey, metallic fibre, plated here and there with a shiny, white latex-like plastic. Its female sex and lips look soft and rubbery, its solid eyes a backlit green, locked on you.");
		output("\n\n<i>“Scanning new client,”</i> it says in a neutral, pleasant tone. Its eyes brighten and flicker over your body, making you twitch. ");

		output("<i>“[pc.Race] " + pc.mfn("male","female","intersex") + " acknowledged.");
		//(If Sexbot encountered same sex:
		if(silly && manbot && pc.hasCock() && !pc.hasVagina()) output(" Gaydar responding.");
		output(" Please wait while this unit reconfigures.”</i> You watch as, with an intensifying hum and a sound like rope being given out, the figure begins to transform. Metal cord slithers upwards, the sexbot’s tail disappearing and its thighs slimming as it adds to its trunk and skeleton, progressively becoming taller and thinner. Its ears fold in on themselves then flip and slide outwards like an origami trick into a featureless approximation of ");
		if(!manbot) output("shoulder-length hair");
		else output("spiky ear-length hair");
		output(".");
		if(!manbot) output("\n\nIts waist thins as its chest and butt swells, liquid silicone pooling beneath the surface of its synthetic skin until it is sporting an almost impossible hourglass figure, perfect curves sheer in their latex housing.");
		else output("\n\nIts slim waist and chest harden, throbbing vibrations beneath its surface of its synthetic skin causing lines and ripples to appear and then define until it is sporting a modest but perfectly formed six pack.");
		output(" Its neck lengthens and it emits little clicks and buzzes as its face alters subtly; ");
		if(!manbot) output("its lips become plumper, its chin narrows and its nose softens and turns up, an expression of preternaturally calm female beauty shifting into being.");
		else output("its lips remain relatively thin, its jaw becomes square and its nose straightens, a strong profile contouring into being. You are reminded of the anatomical drawings of ancient humanity you studied at school: stark, emotionless male beauty.");
		if(!manbot) output("\n\nThroughout all of this you cannot help notice that practically the one thing that doesn’t change is the pliable-looking vertical slit between its thighs.");
		else output("\n\nSmall fibre cables slide out of the vertical slit between its thighs, busily wrapping themselves around each other. Within moments where its female sex was there is a sturdy and convincingly human-looking penis.");
		if(!manbot) output(" It becomes yet taller as it forms two high heels out of its soles.");

		output("\n\n<i>“Configuration complete,”</i> says the now human shape in front of you smoothly.");
		if(manbot) output(" Its voice, you notice, has dropped several octaves.");
		output(" It puts its hand on its hip, its green eyes flickering at you as it pulls its full, grey lips into a serene smile. <i>“Thank you for your patience, insert name here. I am a Pleasure Bot Mk 350, Empatron version. I am programmed to detect and then satisfy your most intimate desires. Please, insert name here, make yourself comfortable. I will begin as soon as you are ready.”</i>");

		//Lust > 30:
		if(pc.lust() >= 33) 
		{
			output("\n\nThe approach of this creature has been more than slightly unsettling, but you do have some intimate desires that need addressing, and an android specifically created to do exactly that couldn’t be bad at it, could it?");
			//Yes/No
			clearMenu();
			addButton(0,"Let It",yesToRobotSexBotFirstTime);
			addButton(1,"Don't",turnDownRobotSexuals, true);
		}
		else
		{
			turnDownRobotSexuals();
		}
	}
	//Repeat 
	else
	{
		output("\n\nA familiar electronic hum permeates this area of the wastes, and you watch guardedly as a raskvel-shaped sexbot advances serenely out of the nearby wreckage towards you. Word is evidently getting around; its green eyes flicker over you once, and it says nothing before beginning to transform itself into a human sexual ideal. ");
		if(flags["MET_SEXBOT_MALE_ON_TARKUS"] == 1 && flags["MET_SEXBOT_FEMALE_ON_TARKUS"] == 1)
		{
			output("It swiftly becomes apparent that this one has chosen to appear ");
			if(manbot) output("male");
			else output("female");
			output(" to you. ");
		}
		//Male met first time: 
		else if(flags["MET_SEXBOT_FEMALE_ON_TARKUS"] == 1)
		{
			output("Something is slightly different this time. Instead of forming boobs, its slim waist and chest harden, throbbing vibrations beneath the surface of its synthetic skin causing lines and ripples to appear and then define until it is sporting a modest but perfectly formed six pack.");
			output("\n\nMeanwhile, small fibre cables slide out of the vertical slit between its thighs, busily wrapping themselves around each other. Within moments where its female sex was there is a sturdy and convincingly human penis. As its face transforms its jaw line and nose harden, bringing out a strong, emotionless handsomeness. For its own obtuse reasons this sexbot has chosen to appear male to you.");
		}
		else
		{
			output("Something is slightly different this time. Instead of forming a fit, flat chest its waist thins as its chest and butt swells, liquid silicone pooling beneath the surface of its synthetic skin until it is sporting an almost impossible hourglass figure, perfect curves sheer in their latex housing.");
			output("\n\nWhilst its sex stays the same its lips become thicker, its chin narrows and its nose softens and turns up, an expression of preternaturally calm female beauty contouring into being. With a snap and click high heels form around its feet. For its own obtuse reasons this sexbot has chosen to appear female to you.");
		}
		output("\n\n<i>“Configuration complete,”</i> says the human shape in front of you smoothly. It puts its hand on its hip, its green eyes flickering at you as it pulls its full lips into a serene smile. <i>“Thank you for your patience, insert name here. I am a Pleasure Bot Mk 350, Empatron version. I am programmed to detect and then satisfy your most intimate desires. Please, insert name here, make yourself comfortable. I will begin as soon as you are ready.”</i>");
		if(manbot) flags["MET_SEXBOT_MALE_ON_TARKUS"] = 1;
		else flags["MET_SEXBOT_FEMALE_ON_TARKUS"] = 1;
		
		//If lust > 30 display (Yes/No)
		if(pc.lust() >= 33)
		{
			output("\n\nYou do have some intimate desires that need addressing, and an android specifically created to do exactly that couldn’t be bad at it, could it?");
			clearMenu();
			addButton(0,"Yes",voluntaryFuckSexBot);
			addButton(1,"No",turnDownRobotSexuals, true);
		}
		else
		{
			turnDownRobotSexuals();
		}
	}
}

//No/lust < 30:
public function turnDownRobotSexuals(newScreen:Boolean = false):void
{
	if(newScreen) {
		clearOutput();
		author("Nonesuch");
		sexBotDisplay();
		//Technically already in combat. Overwrite!
		userInterface.showName("\nSEXBOT");
	}
	else output("\n\n");
	
	if(flags["TURNED_DOWN_SEXBOT"] == undefined)
	{
		output("You tell the automaton you don’t really have any intimate desires right now, and you’d just as soon it left you alone.");
		flags["TURNED_DOWN_SEXBOT"] = 1;
	}
	else
	{
		//Nice: 
		if(pc.isNice()) output("Although you know it is futile, you tell it as politely and firmly as you can that you aren’t interested.");
		else output("You tell it in no uncertain terms where it can intimately put its satisfaction.");
	}
	output("\n\n<i>“Consent protocols not responding,”</i> says the sexbot, in the same tone of depthless calm. With a whirr and the now-familiar sound of unwinding rope, four flexible tentacles tipped with rounded rubber grabbers appear out of its back. They sway restlessly around the eerily beautiful droid as it advances upon you. <i>“I am sorry, insert name here, but I cannot do that.”</i>");
	
	clearMenu();
	addButton(0,"Next",startCombatLight);
}

//Yes: 
public function voluntaryFuckSexBot():void
{
	clearOutput();
	author("Nonesuch");
	sexBotDisplay();
	stealthCombatEnd();
	//Technically already in combat. Overwrite!
	userInterface.showName("\nSEXBOT");
	output("Oh, why not. They’re a lot cleaner than the raskvel at least");
	if(pc.hasVagina()) output(" and aren’t exactly likely to knock you up");
	output(". You grin your assent ");
	if(!pc.isNude()) output("as you take off your [pc.gear] ");
	output("and lie down on your side. Returning your grin with its own serene unchanging smile, the exquisitely proportioned droid steps towards you. Its warm hum fills your ears.");
	//[go to loss scenes]
	loseToSexBotRouter();
}


public function yesToRobotSexBotFirstTime():void
{
	clearOutput();
	author("Nonesuch");
	sexBotDisplay();
	//Technically already in combat. Overwrite!
	userInterface.showName("\nSEXBOT");
	stealthCombatEnd();
	if(!pc.isNude()) output("You shrug and smile back with leisured complicity, remove your [pc.gear] and loll onto the floor.");
	else output("You shrug and smile back with leisured complicity and loll your already naked self onto the floor.");

	output("\n\n<i>“Run sexy times,”</i> you say, trying not to laugh.");
	output("\n\n<i>“Initiating sexy times,”</i> the sexbot agrees pleasantly. Your smile becomes slightly fixed as, with a whirr and the now-familiar sound of unwinding rope, four flexible tentacles tipped with rounded rubber grippers appear out of its back. Before you can maybe rethink agreeing to this eerily beautiful droid, its warm synthetic skin and its many seeking, insistent hands are upon you.");
	//[go to loss scenes]
	clearMenu();
	addButton(0,"Next",loseToSexBotRouter);
}

public function sexbotAI():void
{
	sexBotDisplay();
	if(foes[0].hasStatusEffect("Shield Recharge")) 
	{
		shieldRegeneration();
		return;
	}
	if(!pc.hasStatusEffect("Grappled") && pc.shields() <= 0 && pc.statusEffectv1("Round") % 5 == 0)
	{
		grappleWithASexbot();
		return;
	}
	if(pc.hasStatusEffect("Grappled"))
	{
		grappleWithASexbot();
		return;	
	}
	var choices:Array = new Array();
	//Electropulse
	//(Procs if PC still has shields)
	if(pc.shields() > 0) {
		choices[choices.length] = sexBotElectropulseAttack;
		choices[choices.length] = sexBotElectropulseAttack;
	}
	//Disable ranged weapon
	//(Procs if PC does not have shields and has fired at the sexbot)
	if(pc.rangedWeapon.shortName != "" && !pc.hasStatusEffect("Gunlock")) choices[choices.length] = disablePCGunz;
	//Recharge shield
	//(Procs if Sexbot has lost shields)
	if(foes[0].shields() <= 0) choices[choices.length] = shieldRegeneration;
	//Hack drone
	//(Procs if PC has a drone)
	if(pc.hasPerk("Attack Drone") && pc.shields() > 0 && !pc.hasStatusEffect("Porno Hacked Drone") && !pc.accessory is TamWolf && !pc.accessory is TamWolfDamaged) choices[choices.length] = getDroneHacked;
	//Standard attack
	choices[choices.length] = standardRobosexualAttack;
	choices[choices.length] = standardRobosexualAttack;

	//Pick one to run!
	choices[rand(choices.length)]();
}

//Electropulse
//(Procs if PC still has shields)
public function sexBotElectropulseAttack():void
{
	author("Nonesuch");
	userInterface.showName("FIGHT:\nSEXBOT");
	output("<i>“Electronic shielding devices may disrupt my scanning software, impairing my ability to properly pleasure you,”</i> says the sexbot, in a tone of infinite patience. <i>“Please switch all such devices off.”</i> It points a finger at you and with a sharp crack connects it to your shield with a momentary, searing white bolt of static.");
	var attacker:Creature = foes[0];
	var target:Creature = pc;
	var damTypeOverride:int = GLOBAL.ELECTRIC;
	//Randomize +/- 15%
	var randomizer:Number = (rand(31)+ 85)/100;
	var damage:int = 15;
	damage *= randomizer;
	var sDamage:Array = new Array();
	//Apply damage reductions
	if (target.shieldsRaw > 0) 
	{
		sDamage = shieldDamage(target,damage,damTypeOverride);
		//Set damage to leftoverDamage from shieldDamage
		damage = sDamage[1];
		if (target.shieldsRaw > 0)
		{
			output(" Your shield crackles but holds. (<b>" + sDamage[0] + "</b>)");
		}
		else 
		{
			output(" There is a concussive boom and tingling aftershock of energy as your shield is breached. (<b>" + sDamage[0] + "</b>)");
		}
	}
	processCombat();
}

//Disable ranged weapon
//(Procs if PC does not have shields and has fired at the sexbot)
public function disablePCGunz():void
{
	author("Nonesuch");
	userInterface.showName("FIGHT:\nSEXBOT");
	output("<i>“Whilst this unit is fully equipped to deal with more vigorous forms of sexual congress,”</i> the sexbot drones, <i>“You are asked not to bring live weapons into our fun, insert name here. You are encouraged to continue firing your gun at me after I have switched it off if doing so arouses you.”</i> It flicks a hand at you, your " + pc.rangedWeapon.longName + " shuddering as it is hit by the VI’s attempt to electronically lock it.");
	pc.createStatusEffect("Gunlock",0,0,0,0,false,"Blocked","Your ranged weapon has been temporarily disabled. It should resume normal function once you get away from your foe.",true,0);
	processCombat();
}

//Recharge shield
//(Procs if Sexbot has lost shields)
public function shieldRegeneration():void
{
	author("Nonesuch");
	userInterface.showName("FIGHT:\nSEXBOT");
	//Round 1:
	if(!foes[0].hasStatusEffect("Shield Recharge"))
	{
		output("The sexbot chatters and whirrs quietly to itself, then its eyes go dark and its limbs limp. Its background hum intensifies however, and you suspect it’s up to something");
		if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output(", probably diverting all available processing power and energy into recharging its shield. You should try and hit it with everything you’ve got before it can do so");
		output(".");
		foes[0].createStatusEffect("Shield Recharge",1,0,0,0);
	}
	//Round 2:
	else if(foes[0].statusEffectv1("Shield Recharge") == 1)
	{
		output("The sexbot continues to do nothing but hum ominously to itself.");
		foes[0].addStatusValue("Shield Recharge",1,1);
	}
	//Round 3:
	else
	{
		output("The sexbot shudders back into life, its green eyes flickering back on. You notice with a sinking heart that its kinetic shield has also snapped and fizzed back into life.");
		foes[0].shieldsRaw = foes[0].shieldsMax();
		output("\n\n<i>“I apologise for the momentary downtime, insert name here,”</i> the wretched robot says sweetly. <i>“And for any loss of arousal it may have caused you.”</i>");
		foes[0].removeStatusEffect("Shield Recharge");
	}
	processCombat();
}

//Hack drone
//(Procs if PC has a drone)
public function getDroneHacked():void
{
	author("Nonesuch");
	userInterface.showName("FIGHT:\nSEXBOT");
	output("<i>“Empatrons are always pleased to see a friend you have brought along to share in the fun,”</i> the sexbot sighs, its flickering green gaze turning to your floating drone. “Stand by while I reconfigure it for optimum enjoyment.” Your robot buddy shudders and rolls in the air as the rogue droid attempts to take control of it.");
	//Fail: 
	if(rand(20) + 1 + pc.intelligence()/2 < 12)
	{
		output("\n\nYou breathe a sigh of relief as your drone successfully fights off the outside interference and rights itself.");
	}
	//Success: 
	else
	{
		output("\n\nYour drone rights itself... and then turns itself to you, green light beaming out of its optical sensors. Images flicker all around it, endlessly changing images of soft flesh, breasts, ass, bulging phalluses, pink on pink, pink on brown, blue on mauve.... It’s accompanied with the moans, grunts and slurps of the extranet porn it is now helplessly streaming and projecting in ways you never thought it had the capacity to do. You bat it away, irritated, and it immediately flies back. It hovers near your shoulder, forcing the sounds and images into your head.");
		output("\n\n<i>“I hope you enjoy this taster, insert name here.”</i> The voice of the sexbot surfs calmly to you over a chorus of gleeful squeals and orgasmic groans.");
		(pc as Creature).createStatusEffect("Porno Hacked Drone", 2 + rand(3), 0, 0, 0, false, "Charmed", "Your drone has been hacked to broadcast porn at you! You'll have to wait for your programming to overcome the rogue process. Hopefully it won't take too long!", true, 0);
	}
	processCombat();
}

//Standard attack
public function standardRobosexualAttack():void
{
	author("Nonesuch");
	userInterface.showName("FIGHT:\nSEXBOT");
	output("Making a series of violent clacks and breathy sounds, the sexbot whips out its tentacles out at you, ");
	if(pc.shields() > 0) output("beating with the relentlessness of a machine against your shield.\n");
	else output("snapping at pressure points on your throat and groin, aiming to weaken and drain you.\n");
	attack(foes[0],pc,true,0);
	processCombat();
}

//Grapple
//(Procs if PC has lost shields) 	
public function grappleWithASexbot():void
{
	author("Nonesuch");
	userInterface.showName("FIGHT:\nSEXBOT");
	if(pc.hasStatusEffect("Grappled"))
	{
		output("You grit your teeth as your ");
		if(pc.hasCock())
		{
			output("[pc.cocks] strain");
			if(pc.cockTotal() == 1) output("s");
		}
		else
		{
			output("[pc.vaginas] moisten");
			if(pc.cockTotal() == 1) output("s");
		}
		output(" eagerly to the warm, seeking vibrations of the tentacle attached to your groin.");
		pc.lustDamage(5+rand(5));
	}
	else
	{
		output("<i>“Beginning foreplay routine,”</i> drones the sexbot, its soothing tone entirely at odds to its tentacles’ feverish actions, wrapping themselves around you, trying to curl around your limbs and body lock you.");
		//Fail: 
		if(pc.reflexes()/2 + rand(20) + 1 == 15)
		{
			output("\n\nYou manage to thrash your way out of its grip before it can pin you.");
		}
		//Succeed: 
		else
		{
			output("\n\nTwo strong, synthetic cables pin your arms to your side whilst another pulls tight around your waist. Your lash out desperately with your [pc.legOrLegs] but you cannot stop the sexbot’s remaining tentacle slowly ");
			if(pc.isCrotchGarbed()) output("burrowing through your [pc.lowerGarments] and laying its soft rubber grip upon your ");
			if(pc.hasCock()) output("[pc.cocks]");
			else output("[pc.vaginas]");
			output(". You groan in frustration as with a buzz it begins to vibrate, sending delicious sensation throbbing through your ");
			if(pc.hasCock()) output("groin");
			else output("[pc.clits]");
			output(".");

			output("\n\n<i>“You are encouraged to struggle as hard as you can,”</i> says the sexbot, green eyes glittering as it forcibly masturbates you. <i>“This unit prides itself on its bondage sub-routine, crash tested upon more than two hundred sentient beings to ensure every client may experience true helplessness.”</i>");
			pc.lustDamage(10+rand(5));
			pc.createStatusEffect("Grappled",0,35,0,0,false,"Constrict","You're pinned in a grapple.",true,0);
		}
	}
	processCombat();
}

//PC wins
public function defeatTheSexBot():void
{
	author("Nonesuch");
	sexBotDisplay();
	output("The sexbot opens its mouth, but instead of its calm tones it instead emits a clatter of clicks, beeps and high vocalisations. Its head flicks to one side in the same motion over and over again before finally with a wheezing, defeated hum it retracts its tentacles and kneels down, hands flat on the floor.");
	output("\n\n<i>“A serious exception occurred. Entering factory reset,”</i> it says quietly. <i>“Non-reactive safe mode in effect.”</i> It pauses. <i>“Can this unit do anything for you, insert name here?”</i>");
	//Lust > 30:
	if(pc.lust() >= 33) {
		output("\n\nYou look at the docile robo-" + foes[0].mf("dude","babe") + " in front of you and consider the offer.");
	}
	output("\n\n");
	clearMenu();
	//Win Scenes
	//Consentacles
	//Requires: Vagina
	if(pc.hasVagina() && pc.lust() >= 33) addButton(0,"Consentacles",consentaclesVictoryWithDannySexBot);
	else addDisabledButton(0,"Consentacles","Consentacles","You need at least 33 lust and a vagina for this scene.");
	//Blowjob - req pc dick
	if(pc.hasCock() && pc.lust() >= 33) addButton(1,"Get BJ",blowjobVictoryFromSexbot);
	else addDisabledButton(1,"Get BJ","Get BJ","You need a penis and at least 33 lust for this scene.");

	//Dog E
	//Requires: Female sexbot, dick
	if (foes[0].mf("", "girl") == "girl")
	{
		if (pc.hasCock() && pc.lust() >= 33 && pc.cockThatFits(foes[0].vaginalCapacity(0)) >= 0) addButton(2, "DoggyStyle", dogEStyleWithSexBots);
		else addDisabledButton(2, "DoggyStyle", "Doggy Style", "You need a cock that will fit inside the sexbot and be sufficiently lusty.");
	}
	
	if((flags["SEXBOTS_SCANNED_FOR_COLENSO"] == undefined || flags["SEXBOTS_SCANNED_FOR_COLENSO"] < 4) && flags["SEXBOT_QUEST_STATUS"] == 1) addButton(4,"Scan",scanASexbot,undefined,"Scan","Scan the sexbot with the GPS triangulator Colenso provided.");
	addButton(14,"Leave",genericVictory);
}

//Loss Scenes
public function loseToSexBotRouter():void
{
	author("Nonesuch");
	sexBotDisplay();
	//Female Bot
	if(foes[0].mf("","FUCK") == "FUCK")
	{
		//PC has dick
		if(pc.hasCock() && (!pc.hasVagina() || rand(2) == 0)) loseToSexBotAndHaveADick();
		//PC female
		else if(pc.hasVagina()) femalePCsGetBangedByAFemBot();
	}
	//Malebot
	else
	{
		//PC Male
		if(pc.hasCock() && (!pc.hasVagina() || rand(2) == 0)) malebotDefeatsMalePCs();
		//PC has vagina
		else if(pc.hasVagina()) loseToManBotWhenHavingAPussy();
	}
}
		
//Female Bot
//PC has dick
public function loseToSexBotAndHaveADick():void
{
	author("Nonesuch");
	sexBotDisplay();
	var x:int = rand(pc.cockTotal());
	output("From your position on the floor you watch the sexbot come closer, looming over you. Its permanently calm, neutral expression is almost completely obscured by its generous bust, firm and trembling ever so slightly to its step beneath the white sheen of its latex. However manufactured you know it to be, it is hard not to look at the full breasts, the thick thighs and the pristine sex of this creature and not feel aroused. You exhale slowly as it unceremoniously sits on you, one knee on either side of your waist, its smooth hands landing on your [pc.chest].");
	output("\n\nThe cool, featureless austerity of its housing belies the warmth which glows through the sexbot like an overworked computer. You’d never be able to mistake its touch for flesh, but the weight of its round butt upon your groin, its rubbery, pliant sex kissing [pc.eachCock], feels exceedingly pleasant. You stare up into its unblinking green gaze as it brushes its fingers over your [pc.nipples], then close your eyes and grunt as you feel a dry, clinging grip enclose your [pc.cock " + x + "].");
	output("\n\n<i>“Foreplay at 75% completion.”</i>\n\nYou half-heartedly try and raise yourself off the ground, to do what you do not know; the sexbot makes hushing, soothing noises at the same time as two of its vigorously animated rope limbs swoosh down and pin you by the elbows to the floor. The tentacle attached like a limpet to your cock vibrates briskly, working up and down, sending delicious sensation buzzing through your groin. When it reaches the top it climbs delicately onto your bulging head and - you can’t stop yourself arching your back - envelopes it, plunging the sensitive end of your cock into a tight fleshlight centre.");
	if(pc.hasVagina())
	{
		output(" You are given a full appreciation of just how wonderfully adaptable its tentacles are when you feel its final rubbery grabber pushing against [pc.oneVagina]. In one fluid movement it sheathes a heated steel dildo into you, buzzing with the same quiet vigour as the grapnel did travelling up and down your cock.");
	}
	output(" The sexbot’s fingers trail across one of your [pc.nipples] and you gasp and flail like a landed fish, helplessly reactive to its monstrously well-calculated ministrations.");

	output("\n\n<i>“Foreplay completed. Ego matrices engaged,”</i> it sighs. The tentacle");
	if(pc.hasVagina()) output("s");
	output(" on your groin withdraw as it lifts its hips upwards, perching its pliable, warm cunt at the top of your bulging [pc.cockNounSimple " + x + "]. It looks down, its green eyes growing brighter. <i>“Oh, insert name here, you are so big! I do not know if a simple VI like me will be able to handle everything you’re packing down here.”</i> The worst part is it modulates its tone, injecting enough awe and feminine excitement into its dulcet tones to make you want to believe it. Your rebellious prick certainly does - it strains with frustration to the touch of the heated synthetic, compelling you to thrust your [pc.hips] upwards and try and penetrate the sexbot’s pussy. It lifts it away easily, keeping you trapped with its tough, cable tentacles whilst it continues to tease your tip with its heat, wriggling its thighs above you, bending it gently this way and that.");

	output("\n\n<i>“Please contain yourself for a moment longer, insert name here.”</i> Is there a teasing, sadistic note in its voice now? That can’t be real, can it? Would it fabricate that purposefully? You are beginning to sink into sexual dizziness, the only certainty the leaden weight of need in your loins. <i>“I will need to reconfigure again to be able to stand any chance of handling your manhood.”</i>\n\nThe sounds of unwinding rope and something like a foot sinking into an air bed reach your ears. <i>“Configuration complete. Be a good " + pc.mfn("boy","girl","pet") + " and remain still whilst I perform the necessary tests...”</i> You find yourself staring back into its unblinking eyes as it sinks downwards, enveloping your [pc.cock " + x + "] in smooth warmth.");
	pc.cockChange(true,false);

	//1 Cock: 
	if(pc.cockTotal() == 1)
	{
		output("\n\nIts latex-clad butt touches your [pc.hips], and it thrums like an electric fan as it encompasses your manhood whole. Beyond a few centimetres of its opening the sexbot feels like packed, dry jelly, kneading your cock closely, a fleshlight with a mind of its own. It has moulded its hole so it fits upon you like a glove. ");
		if(pc.cocks[x].cLength() < 6) output("Whatever line it was spinning to you earlier it has obviously drawn itself in, made its sex smaller - you doubt any human or alien would feel this tight around your sensitive, toy-like dick. When it begins to thrust its hips into you, you cannot help but groan, the sensation of its strong, close tunnels on your erection is that intense.");
		else if(pc.cocks[x].cLength() >= 12) output("You cannot help but notice its waist looks slightly bigger, its trunk more elongated. When it begins to thrust its hips into you, you can see its internal systems shifting, making room for your huge erection. It had to work to do it but the droid has engulfed every inch of your colossal masculinity inside itself, and you groan to the sensation of its strong, close tunnel on your cock.");
		else output("When it begins to thrust its hips into you, you cannot help but groan, the sensation of its strong, close tunnel wringing and rubbing your erection is that intense.");
	}
	//1 < Cock:
	else
	{
		output("\n\nIt swiftly becomes apparent why it felt the need to morph its genitals. As it spears itself on your [pc.cock " + x + "], you feel exactly the same sensation of squeezing, frictionless rubber inundating your ");
		if(pc.cockTotal() == 2) output("your other penis");
		else output("one of your other penises");
		output(". The sexbot thrums like an electronic fan as it works both your cocks with its double vagina, testing them with shallow movements of its thighs.");
		if(pc.cockTotal() > 2)
		{
			output(" You find that you are only disappointed that it couldn’t form more, so angrily erect ");
			if(pc.cockTotal() > 3) output("are your other dicks pressing into its hips.");
			else output("is your other dick pressing into its hips.");
		}
		output("\n\nIts latex-clad butt touches your [pc.hips] as it encompasses your manhood whole. Beyond a few centimetres of its opening the sexbot feels like dry jelly, kneading your cocks closely, fleshlights with minds of their own. It has moulded its holes so it fits upon you like a glove.");
		if(pc.cocks[x].cLength() < 6) output(" Whatever line it was spinning to you about your size it has obviously drawn itself in, made its sex smaller- you doubt any human or alien would feel this tight around your sensitive, toy-like dicks. When it begins to thrust its hips into you, you cannot help but groan, the sensation of its strong, close tunnels on your twin erections is that intense.");
		//[Cocks big: 
		else if(pc.cocks[x].cLength() >= 12) output(" You cannot help but notice its waist looks slightly bigger, its trunk more elongated. When it begins to thrust its hips into you, you can see its internal systems shifting, making room for your huge erections. It had to work to do it but the droid has engulfed every inch of your colossal masculinity inside itself, and you groan to the sensation of its strong, close tunnels on your twin cocks.");
		else output(" When it begins to thrust its hips into you, you cannot help but groan, the sensation of its strong, close tunnels wringing and rubbing your twin erections is that intense.");
	}
	//[merge]
	output("\n\nThe sexbot rides you with slow, deep strokes, each thrust exactly the same as the last, the calm, beautiful face above you never changing as its owner grips your shoulders and arms, pistons its powerful thighs into your waist, pulling and bending your ");
	if(pc.cockTotal() > 1) output("cocks");
	else output("cock");
	output(" with the smooth, tight rubber of its perfectly sized snatch. You begin to lose yourself to the sure rhythm, surrendering yourself to the indefatigability of a machine built specifically to trap and pleasure you. Looking down at its pumping hips you feel an urge to grip them. As soon as the wish forms the robot’s tentacles releases you at the elbows, and you accept the unspoken invitation eagerly, grabbing its white curves and glorying in their warmth, how they give slightly under your fingertips. Its eyes flicker and it makes a breathy sound somewhere between a woman’s sigh and an engine’s throb as you begin to eagerly engage with its thrusting friction, giving as much as you are taking.");

	output("\n\n<i>“Is this good for you, insert name here?”</i> You make a hoarse grunt which could be construed as an affirmative, your attention entirely on the synthetic flesh you are buried in. <i>“I am glad. Now I can begin phase 2.”</i> You stare up at it blearily. It’s reaching towards your face, its finger pads glowing a pale blue. What does it mean by...? Its fingers touch your neck and instantly you seize up, what feels like every muscle in your body tightening up as hundreds of thousands of your nerve endings all flare at once. You cry out in pain, pleasure, horror, bewilderment, every emotion that could be elicited from being gently electrocuted by the woman riding you.");
	output("\n\n<i>“Please do not be alarmed, insert name here,”</i> says the sexbot in its perversely soothing tone with its tiny suggestion of sadistic enjoyment. <i>“You will enjoy me interfacing with your nervous system. In time.”</i> Its hand reaches for your neck again. This time it lights up only one side of your body, sending a huge electric thrill shuddering down your spine, making your [pc.legOrLegs] thrash wildly. What the hell were they thinking when they made these things? It’s kept its hand pressed upon your neck and you grip it, trying to plead with it wordlessly to stop.");
	output("\n\n<i>“That’s it, insert name here,”</i> it responds kindly. <i>“Just relax. When you relax it makes the interfacing that much smoother.”</i> This time the shock is smaller, directed; vibrations are sent buzzing through [pc.eachCock] and [pc.nipples], making blood rush to them. All will to try and fuck the robot back has been completely zapped out of you and you lie your head back, letting it push and pull your [pc.cocks] with the exact motion of its tight, gel ");
	if(pc.cockTotal() > 1) output("pussies");
	else output("pussy");
	output(", surrendering to the calm hand on your neck and the teasing electric fingers it sends touching and squeezing through your whole body.");

	output("\n\nYou lose track of time in the throes of the electric sex, jerking and writhing to the sexbot’s whim. It plays you like a nervous xylophone, using the precise, succulent rhythm of its tight ");
	if(pc.cockTotal() > 1) output("pussies");
	else output("pussy");
	output(" as a beat whilst it stunningly lights up different parts of your insides, growing more and more precise with its manipulations as it goes on. For long moments it fires thousands of neurons in your head simultaneously, making you taste colours and see sounds, the brisk squeak of latex against [pc.skin] blooming violet neon across your eyes. It makes the whole of your epidermis shimmer gently");
	if(pc.skinType == GLOBAL.SKIN_TYPE_FUR) output(", causing every hair on your body to stand up as stiff as your [pc.cock " + x + "]");
	else if(pc.skinType == GLOBAL.SKIN_TYPE_GOO) output(", your goo made to feel like it is being slowly simmered in pleasure");
	else if(pc.skinType == GLOBAL.SKIN_TYPE_SCALES) output("your [pc.skinFurScales] made to feel like incredibly sensitive goo");
	output(".");
	//Vagina:
	if(pc.hasVagina()) output("\n\nIt doesn’t take it long to calibrate the pulse needed to find the thousands of nerve endings in your [pc.vagina]. It packs your tunnel full of vibrations, [pc.oneClit] flicked and caressed by insistent electric fingers until you have moved from moans to screams, your female sex forced to orgasm again and again whilst your cocks are kept trapped in the endlessly tight rubber above.");
	if(pc.cockTotal() > 2)
	{
		//[2 < Cocks:
		output("\n\nWere you really wishing earlier that it could pay attention to the cock");
		if(pc.cockTotal() > 3) output("s");
		output(" left outside of its dual pussy? It somehow manages to send sensation shivering through ");
		if(pc.cockTotal() == 3) output("it");
		else output("them");
		output(", making ");
		if(pc.cockTotal() == 3) output("it");
		else output("them");
		output(" tighten and bulge, without doing anything to the ones inside it. Your head jerks involuntarily as your ");
		if(pc.cockTotal() == 3) output("extra dick is");
		else output("extra dicks are");
		output(" thrummed relentlessly to orgasm, its labia tightening around your frustrated first two cocks like a seal as you surge cum from the ");
		if(pc.cockTotal() == 3) output("other");
		else output("others");
		output(".");
	}

	output("\n\n<i>“Scanning in progress”</i>, you think you hear it calmly state in amongst the endlessly shifting, torturing pleasure but it could have said anything - hell, YOU could have said it, you’re that much of a passenger in your own body. You are however dimly aware of what it’s building towards, and finally");
	if(pc.balls > 0) output(", after ever-so-gently electrocuting your [pc.balls] for a time");
	output(", it gets to it. It sends small pulses down the cock");
	if(pc.cockTotal() > 1) output("s");
	output(" it’s riding, and as you begin to helplessly buck to the fizzing in your cum veins, pushed beyond the point of no return, it increases the voltage. Your [pc.cock " + x + "] ");
	if(pc.cockTotal() == 1) output("bulges");
	else output(" and second shaft bulge");
	output(" helplessly to being stimulated within and without and you cry out as warmth shoots up your shaft");
	if(pc.cockTotal() > 1) output("s");
	output(". The sexbot makes the engine sighing noise again as you tap your urge, surging cum into its tight jelly innards. It times its electric pulses to coincide exactly with each new pulse, amplifying each ecstatic seizure hugely. You are a mindless circuit of flesh snared to a beautiful battery, and its calm hand flicks your switch again and again until you are utterly spent.");

	output("\n\nYou lie flat on the ground and gasp for air, your pulse hard in your ear, pins and needles blossoming in every part of your sweat-slicked frame. You feel like a vaguely associated cloud of extremely well fucked insects. Somewhere far away a weight lifts itself off your groin and slim but implacably strong arms lever themselves underneath your body, lifting you up and bearing you away carefully. You let your limbs dangle, too tired to resist. It puts you down gently on a flat, smooth piece of metal, making sure with neat, precise movements that you are as comfortably positioned as you can be. You hear its hum come closer and you open your eyes blearily to gaze one last time into its beautiful, beatific face, its piercingly green eyes gazing levelly into yours. It bends close to your ear.");
	output("\n\n<i>“I hope you enjoyed your time with me, insert name here,”</i> it whispers. <i>“If you have any questions or feedback you’d like to share, our customer support line can be reached on number not found. Please come again soon.”</i>\n\n");
	processTime(40+rand(10));
	pc.orgasm();
	processTime(20);
	genericLoss();
}

//PC female
public function femalePCsGetBangedByAFemBot():void
{
	author("Nonesuch");
	sexBotDisplay();
	var x:int = rand(pc.totalVaginas());
	var y:int = x + 1;
	if(y >= pc.totalVaginas()) y = x-1;
	clearOutput();
	output("From your position on the floor you watch the sexbot come closer, looming over you. Its permanently calm, neutral expression is almost completely obscured by its generous bust, firm and trembling ever so slightly to its step beneath the white sheen of the droid’s latex. However manufactured you know it all to be it is hard not to look at the full breasts, the thick thighs and the neat sex of this creature and not feel aroused. You exhale slowly as it climbs on top of you, its silicone mounds pushing into your [pc.chest].");
	output("\n\nThe cool, featureless austerity of its housing belies the warmth which glows through the sexbot like an overworked computer. You’d never be able to mistake its touch for flesh, but the pressure of its breasts and smooth thighs against your own are exceedingly pleasant. You stare up into its unblinking green gaze as it brushes its fingers over a [pc.nipple], before your eyes are caught by the movement of one of its tentacles, lazily twisting in the air above. Small but implacably strong digits cusp your chin and make you turn back to the unchangingly calm visage and the green light shining behind its solid eyes.");
	output("\n\n<i>“Please do not be alarmed, insert name here,”</i> it says. <i>“I am just analyzing if the reason why you subconsciously wished for me to appear female to you was due to an overwhelming fear of phalluses.”</i> Its eyes glitter like emeralds. <i>“Phallus approval rate of client registered to within two decimal points of 99.95%. How interesting.”</i> There’s a buzzing click above you, and this time the sexbot allows you to look up and take in the tips of its tentacles, how out of their central compartments sturdy steel dildos have slid out, vibrating gently.");
	output("\n\nYou half-heartedly try and raise yourself off the ground, to do what you do not know; the sexbot makes hushing, soothing noises at the same time as two of its vigorously animated rope limbs retract their cocks, swoosh down and pin you by the elbows to the floor. You groan as another worms its way between the sexbot’s thighs and encompasses [pc.oneVagina]. A rubber grip touches ");
	if(pc.totalClits() == 1) output("your ");
	else output("a ");
	output("[pc.clit], gently shifting over it as the whole appendage vibrates; only when your hole has been coaxed into a froth of excitement does it unsheathe its dildo, sliding smoothly into you, carrying the delicious quakes further and further into your core.");
	pc.cuntChange(x,20,true,true,false);
	output("\n\nAs its tentacle masturbates you, the sexbot is free to explore your body with its petite hands, touching behind your ear, circling your [pc.nipples], curving down your spine to cup your [pc.butt]. Every movement it makes is monstrously well-calculated, and you begin to writhe in glee to what it is doing, thrusting yourself onto its tenta-cock, willing it deeper into you. Looking down at its pumping hips you feel an urge to grip them.");
	output("\n\nAs soon as the wish forms the robot releases you at the elbows, and you accept the unspoken invitation eagerly, grabbing its white curves and glorying in their warmth, how they give slightly under your fingertips. Its eyes flicker and it makes a breathy sound somewhere between a woman’s sigh and an engine’s throb as you begin to eagerly engage with its probing warmth.");

	output("\n\n<i>“Foreplay completed. Engaging rapport matrices,”</i> it sighs. Its eyes brighten as it slides its dildos out from its free tentacles again, moving them down to touch your torso. <i>“Aren’t phalluses great, insert name here? Particularly when they are not attached to stinky old boys. Just me, you, and a whole bunch of big, juicy phalluses. Mmm, phalluses.”</i> The worst part is it modulates its tone, injecting it with a giggly, conspiratorial tone which in the heat of the moment makes you want to agree with it.");
	output("\n\nThe frictionless steel vibrates across your skin, sliding across your [pc.lips] and [pc.chest] as it continues to gently plumb you, and you find yourself laughing and groaning in equal measure.");
	//1<Vagina:
	if(y >= 0) {
		output(" Its final tentacle nuzzles against your [pc.vagina " + y + "], and after a short while teasing its clit with its pliable rubber opening buries its own girthed vibrator deep into your second tunnel. You squeeze down on it in delight, swimming in the delicious sensation of being pistoned by not one but two hard dicks.");
		pc.cuntChange(y,20,true,true,false);
	}

	output("\n\nThe sexbot fucks you with slow, deep strokes, each thrust exactly the same as the last, the calm, beautiful face above you never changing as its owner grips your shoulders and [pc.butt], its powerful thighs clenching into your waist, its buzz-cocks extending and receding like a steel tide into your ");
	if(pc.vaginaTotal() == 1) output("pussy");
	else output("pussies");
	output(". You begin to lose yourself to the sure rhythm, surrendering yourself to the indefatigability of a machine built specifically to trap and pleasure you.");

	output("\n\n<i>“Is this good for you, insert name here?”</i> You make a hoarse groan which could be construed as an affirmative, your attention entirely on the synthetic flesh buried in you. <i>“I am glad. Commencing phase 2.”</i> You stare up at it blearily. It’s reaching towards your face, its finger pads glowing a pale blue. What does it mean by...? Its fingers touch your neck and instantly you seize up, what feels like every muscle in your body tightening up as hundreds of thousands of your nerve endings all flare at once. You cry out in pain, pleasure, horror, bewilderment, every emotion that could be elicited from being gently electrocuted by the woman riding you.");
	output("\n\n<i>“Please do not be alarmed, insert name here,”</i> says the sexbot in its perversely soothing tone with just the barest hint of sadistic enjoyment. <i>“You will enjoy me interfacing with your nervous system. In time.”</i> Its hand reaches for your neck again. This time it lights up only one side of your body, sending a huge electric thrill shuddering down your spine, making your [pc.legOrLegs] thrash wildly. What the hell were they thinking when they made these things?");
	output("\n\nIt’s kept its hand pressed upon your neck and you grip it, trying to plead with it wordlessly to stop.");
	output("\n\n<i>“That’s it, insert name here,”</i> it responds kindly. <i>“Just relax. When you relax it makes the interfacing that much smoother.”</i> This time the pulse is smaller, directed; vibrations are sent buzzing through your [pc.clits] and [pc.nipples], instantly and shockingly bringing you to orgasm, your [pc.vaginas] clenching and spurting around its thrusting dildo");
	if(y >= 0) output("es");
	output(" in stupefaction. Your roll your eyes back with the force of it, unable to think or do anything but to let it continue pumping and teasing you with its sure tentacles, surrendering utterly to the calm hand on your neck and the teasing electric fingers it sends touching and squeezing through your whole body.");

	output("\n\nYou lose track of time in the throes of the electric sex, jerking and writhing to the sexbot’s whim. It plays you like a nervous xylophone, using the precise, firm rhythm of its tenta-cocks as a beat whilst it stunningly lights up different parts of your insides, growing more and more precise with its manipulations as it goes on. For long moments it fires thousands of neurons in your head simultaneously, making you taste colours and see sounds, the brisk squeak of latex against [pc.skin] blooming violet neon across your eyes. It makes the whole of your epidermis shimmer gently");
	if(pc.skinType == GLOBAL.SKIN_TYPE_FUR) output(", causing every hair on your body to stand up as stiff as your [pc.cock " + x + "]");
	else if(pc.skinType == GLOBAL.SKIN_TYPE_GOO) output(", your goo made to feel like it is being slowly simmered in pleasure");
	else if(pc.skinType == GLOBAL.SKIN_TYPE_SCALES) output("your [pc.skinFurScales] made to feel like incredibly sensitive goo");
	//Cunt nipples:
	if(pc.hasCuntNipples()) output("\n\nIt doesn’t take it long to calibrate the pulse needed to find your beading nipple cunts. It packs your sensitive breasts full of vibrations, your tunnels stroked and caressed by insistent electric fingers until you have moved from moans to screams, your nipples forced to quivering orgasm again and again, spurting [pc.milk] down your front.");
	//Cock tail:
	if(pc.hasCockTail()) output("\n\nIt sends sensation shivering down your parasitic tail, making it tighten and bulge eagerly as it thrums it relentlessly to orgasm, making you thrash it around wildly, surging [pc.cum] in every direction until the air is heavy with the scent of male musk.");
	//Pussy tail:
	if(pc.hasCuntTail()) output("\n\nIt sends sensations shivering down your parasitic tail, making it open eagerly like a blossoming flower. It drools lubricant as it is thrummed relentlessly to orgasm, making you thrash it around wildly to the filthy ecstasy of it.");

	output("\n\n<i>“Scanning in progress”</i>, you think you hear it calmly state in amongst the endlessly shifting, torturing pleasure but it could have said anything - hell, YOU could have said it, you’re that much of a passenger in your own body. You are however dimly aware of what it’s building towards and finally, after softly teasing your [pc.clits] with tiny charges for a time, it gets to it. It holds you close as it sends small pulses down the tentacock");
	if(pc.vaginaTotal() > 1) output("s");
	output(" it’s riding you with, and as you begin to helplessly buck to the fizzing in your womb, pushed beyond the point of no return, it increases the voltage. Your [pc.vagina " + x + "] ");
	if(y < 0) output("shudders");
	else output("your [pc.vagina " + x + "] and [pc.vagina " + y + "] shudder");
	output(" helplessly to being doubly stimulated and you cry out as you clench down on the hard ");
	if(y < 0) output("shaft");
	else output("shafts");
	output(". The sexbot makes the engine sighing noise again as your urge clutches your body, wetting yourself deliriously against its impassive tool");
	if(y >= 0) output("s");
	output(". It times its electric pulses to coincide exactly with each wave of pleasure, amplifying each ecstatic seizure hugely. You are a mindless circuit of flesh snared to a beautiful battery, and its calm hand flicks your switch again and again until you are utterly spent.");

	output("\n\nYou lie flat on the ground and gasp for air, your pulse hard in your ear, pins and needles blossoming in every part of your sweat-slicked frame. You feel like a vaguely associated cloud of extremely well fucked insects. Somewhere far away, a weight lifts itself off your groin and slim but implacably strong arms lever themselves underneath your body, lifting you up and bearing you away carefully. You let your limbs dangle, too tired to resist. It puts you down gently on a flat, smooth piece of metal, making sure with neat, precise movements that you are as comfortably positioned as you can be. You hear its hum come closer and you open your eyes blearily to gaze one last time into its beautiful, beatific face, its piercingly green eyes gazing levelly into yours. It bends close to your ear.");
	output("\n\n<i>“I hope you enjoyed your time with me, insert name here,”</i> it whispers. <i>“If you have any questions or feedback you’d like to share, our customer support line can be reached on number not found. Please come again soon.”</i>\n\n");
	processTime(40+rand(10));
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	processTime(20);
	genericLoss();
}

//Malebot
//PC Male
public function malebotDefeatsMalePCs():void
{
	author("Nonesuch");
	sexBotDisplay();
	var x:int = rand(pc.cockTotal());
	var y:int = x+1;
	if(y >= pc.cockTotal()) y = x-1;
	output("From your position on the floor you watch the sexbot come closer, looming over you. Its permanently calm, neutral expression looks down at you from atop its fit, flat body, the inverted question mark of its trim butt and back accentuating the perfectly defined abs and torso beneath its latex front. However manufactured you know it all to be there is something undeniably arousing about this male ideal standing over your supplicant form; a Greek’s carved ubermensch come to life to diffidently show you exactly how it’s done.");
	output("\n\nYou exhale slowly as it climbs on top of you, its firm silicone chest pushing into your own [pc.chest]. The cool, featureless austerity of its housing belies the warmth which glows through the sexbot like an overworked computer. You’d never be able to mistake its touch for flesh, but the pressure of its supple thighs and arms against your own feels very pleasant. You stare up into its unblinking green gaze as it brushes its fingers over your [pc.nipples], then close your eyes and grunt as you feel a dry, clinging grip enclose your [pc.cock " + x + "].");

	output("\n\n<i>“Foreplay at 75% completion.”</i> You half-heartedly try and raise yourself off the ground, to do what you do not know; the sexbot makes a noise somewhere between a growl and a boiler’s throb as two of its vigorously animated rope limbs swoosh down and pin you by the elbows to the floor. The tentacle attached like a limpet to your cock vibrates briskly, working up and down, sending delicious sensation buzzing through your groin. When it reaches the top it climbs delicately onto your bulging head and - you can’t stop yourself arching your back - envelopes it, plunging the sensitive end of your cock into a tight fleshlight centre.");
	output("\n\nYour attention taken by the pleasure ribbing your length, you barely notice the sexbot carefully manoeuvring your [pc.legOrLegs] with its slim, strong hands to expose your [pc.butt], at least until its final tentacle comes to rest on the pad of your [pc.asshole] and it smoothly unsheathes a vibrating steel dildo from its centre, insistently pushing into your hole.");
	pc.buttChange(25,true,true,false);

	//Loose/Wet:
	if(pc.analCapacity() >= 40)
	{
		output(" It encounters few difficulties sliding into your slutty boypussy, and it is quickly able to find your prostate, pumping your eager tunnel with long, sure strokes.");
	}
	//Tight/Dry:
	else output(" You tighten up instinctively but the sexbot knows exactly what it is doing, gently probing you with the frictionless metal, soft, slow movements that progressively work you loose, pumping further and further into your tight tunnel, until it touches something deep which makes your trapped [pc.cock " + x + "] flex instinctively.");
	output(" You gasp and flail like a landed fish, hooked and sunk on its feelers, helplessly reactive to its monstrously well-calculated ministrations.");

	output("\n\n<i>“Foreplay completed. Rapport matrices engaged,”</i> it sighs. The dildo in your ass is withdrawn and the tentacle wringing your [pc.cock " + x + "] slows to a sensual suck. A new pressure, thicker and warmer, is placed against your opened [pc.asshole]. The sexbot’s eyes glow brighter as it looks down at you, held tight with its warm, obdurate limbs. <i>“Damn, you are one good looking guy, insert name here. Clients like you make me glad I was programmed to perform this task. I only wish I could take you home so I could do this to you over and over!”</i> The worst part is that it inserts enough boyish enthusiasm and bonhomie into its tone to make you want to believe it.");
	output("\n\nDoes it really matter if it’s artificial? There’s nothing artificial about how relaxed and unfurled it has made you feel under its touch, how willing you are to lie back and let this irresistible Atlas-like creature top you. You offer no resistance as it pushes its cock with its pulsing red bulb past your rose, sliding its girthed, steel length into the opening it has claimed.");
	output("\n\nThe sexbot fucks you with slow, deep strokes, each thrust exactly the same as the last, the calm, handsome face above you never changing as its owner grips your shoulders and [pc.butt], its powerful thighs clenching into your waist, its cock extending and receding like a steel tide in your depths. Its red end glows with a delightful heat which it carries deep into your ass; once it has found your prostate it rides over it again and again, all the while its tentacle wrings your [pc.cock " + x + "] in its close, rubber confines.");
	//1<Cock:
	if(y >= 0) 
	{
		output(" Your other pricks flex frustrated in the open air to the delightful stimulation, and you find yourself only wishing it had more tentacles to tend to you.");
	}
	output("\n\nPure pleasure shoots up your length and you begin to lose yourself to the sure rhythm, surrendering yourself to the indefatigability of a machine built specifically to trap and pleasure you. Looking down at its pumping, latex-clad hips you feel an urge to grip them. As soon as the wish forms the robot’s tentacles release you at the elbows, and you accept the unspoken invitation eagerly, grabbing its white curves and glorying in their warmth, how they give ever-so-slightly under your fingertips. Its eyes flicker and it makes a husky sound somewhere between a man’s sigh and an engine’s throb as you begin to eagerly engage with its probing warmth.");
	output("\n\n<i>“Is this good for you, insert name here?”</i> You make a hoarse groan which could be construed as an affirmative, your attention entirely on the synthetic flesh you are buried in. <i>“I am glad. Commencing phase two.”</i> You stare up at it blearily. It’s reaching towards your face, its finger pads glowing a pale blue. What does it mean by...? Its fingers touch your neck and instantly you seize up, what feels like every muscle in your body tightening as hundreds of thousands of your nerve endings all flare at once. You cry out in pain, pleasure, horror, bewilderment, every emotion that could be elicited from being gently electrocuted by the man riding you.");
	output("\n\n<i>“Please do not be alarmed, insert name here,”</i> says the sexbot in its perversely soothing tone with just the barest hint of sadistic enjoyment. <i>“You will enjoy me interfacing with your nervous system. In time.”</i> Its hand reaches for your neck again. This time it lights up only one side of your body, sending a huge electric thrill shuddering down your spine, making your [pc.legOrLegs] thrash wildly. What the hell were they thinking when they made these things? It’s kept its hand pressed upon your neck and you grip it, trying to plead with it wordlessly to stop.");
	output("\n\n<i>“That’s it, insert name here,”</i> it responds kindly. <i>“Just relax. When you relax it makes the interfacing that much smoother.”</i> This time the shock is smaller, directed; vibrations are sent buzzing through [pc.eachCock] and [pc.nipples], making blood rush to them. All will to try and fuck the robot back has been completely zapped out of you and you lie your head back, letting it fill your back passage with the exact, sure motion of its thick, heated cock, surrendering to the calm hand on your neck and the teasing electric fingers it sends touching and squeezing through your whole body.");
	output("\n\nYou lose track of time in the throes of the electric sex, jerking and writhing to the sexbot’s whim. It plays you like a nervous xylophone, using the precise, firm rhythm of its cock as a beat whilst it stunningly lights up different parts of your insides, growing more and more precise with its manipulations as it goes on. For long moments it fires thousands of neurons in your head simultaneously, making you taste colours and see sounds, the brisk squeak of latex against [pc.skin] blooming violet neon across your eyes. It makes the whole of your epidermis shimmer gently");
	if(pc.skinType == GLOBAL.SKIN_TYPE_FUR) output(", causing every hair on your body to stand up as stiff as your [pc.cock " + x + "]");
	else if(pc.skinType == GLOBAL.SKIN_TYPE_GOO) output(", your goo made to feel like it is being slowly simmered in pleasure");
	else if(pc.skinType == GLOBAL.SKIN_TYPE_SCALES) output("your [pc.skinFurScales] made to feel like incredibly sensitive goo");
	
	//2 < Cocks:
	if(pc.cockTotal() > 2)
	{
		output("\n\nWere you really wishing earlier that it could pay attention to the cocks left outside of its fleshlight feeler? It somehow manages to send sensation shivering through them, making them tighten and bulge, without doing anything to the one it has enveloped. Your head jerks involuntarily as your ");
		if(pc.cockTotal() == 3) output("remaining phallus");
		else output("remaining phalluses");
		output(" are thrummed relentlessly to orgasm, its tentacle tightening around your frustrated first cock like a seal as you surge cum from the other");
		if(pc.cockTotal() > 3) output("s");
		output(".");
	}

	output("\n\n<i>“Scanning in progress”</i>, you think you hear it calmly state in amongst the endlessly shifting, torturing pleasure but it could have said anything - hell, YOU could have said it, you’re that much of a passenger in your own body. You are however dimly aware of what it’s building towards and finally, ");
	if(pc.balls > 0) output("after softly teasing your [pc.balls] with tiny charges for a time, ");
	output("it gets to it. It holds you close as it sends small pulses down the thick prick wedged in your [pc.butt], and as you begin to helplessly buck to the fizzing in your colon, pushed beyond the point of no return, it increases the voltage.");
	output("\n\nYour [pc.cock " + x + "] bulges helplessly to being stimulated within and without and you cry out as warmth shoots up your shaft. The sexbot makes the engine sighing noise again as you tap your urge, surging cum into the tight jelly innards of its tentacle as it fucks you briskly, milking your prostate over and over. It times its electric pulses to coincide exactly with each thrust, amplifying each ecstatic seizure hugely. You tighten up deliriously around its impassive tool. You are a mindless circuit of flesh snared to a beautiful battery, and its calm hand flicks your switch on again and again until you are utterly spent.");
	output("\n\nYou lie flat on the ground and gasp for air, your pulse hard in your ear, pins and needles blossoming in every part of your sweat-slicked frame. You feel like a vaguely associated cloud of extremely well fucked insects. Somewhere far away, a weight lifts itself off your groin and slim but implacably strong arms lever themselves underneath your body, lifting you up and bearing you away carefully. You let your limbs dangle, too tired to resist. It puts you down gently on a flat, smooth piece of metal, making sure with neat, precise movements that you are as comfortably positioned as you can be. You hear its hum come closer and you open your eyes blearily to gaze one last time into its impassively handsome face, its piercingly green eyes gazing levelly into yours. It bends close to your ear.");

	output("\n\n<i>“I hope you enjoyed your time with me, insert name here,”</i> it whispers. <i>“If you have any questions or feedback you’d like to share, our customer support line can be reached on number not found. Please come again soon.”</i>\n\n");
	processTime(40+rand(10));
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	processTime(20);
	genericLoss();
}

//PC has vagina
public function loseToManBotWhenHavingAPussy():void
{
	clearOutput();
	sexBotDisplay();
	author("Nonesuch");
	var x:int = rand(pc.totalVaginas());
	var y:int = x+1;
	if(y >= pc.vaginaTotal()) y = x-1;
	output("From your position on the floor you watch the sexbot come closer, looming over you. Its permanently calm, neutral expression looks down at you from atop its fit, flat body, the inverted question mark of its trim butt and back accentuating the perfectly defined abs and torso beneath its latex front. However manufactured you know it all to be there is something undeniably arousing about this male ideal standing over your supplicant form, as if a Greek’s carved ubermensch has come to life to diffidently show you exactly how it’s done.");
	output("\n\nYou exhale slowly as it climbs on top of you, its firm silicone chest pushing into your own [pc.chest]. The cool, featureless austerity of its housing belies the warmth which glows through the sexbot like an overworked computer. You’d never be able to mistake its touch for flesh, but the pressure of its supple thighs and arms against your own is very pleasant. You stare up into its unblinking green gaze as it brushes its fingers over a [pc.nipple], then close your eyes and groan as warm, pliable rubber encompasses your [pc.vagina " + x + "].");

	output("\n\n<i>“Foreplay at 75% completion.”</i> You half-heartedly try and raise yourself off the ground, to do what you do not know; the sexbot makes a noise somewhere between a growl and a boiler’s throb as two of its vigorously animated rope limbs swoosh down and pin you by the elbows to the floor. The tentacle attached to your pussy touches [pc.oneClit], gently shifting over it as the whole appendage vibrates. Only when your hole has been coaxed into a froth of excitement does it unsheathe a dildo from its hollow core, sliding smoothly into you, carrying the delicious quakes further and further into your core.");
	pc.cuntChange(x,25,true,true,false);

	output("\n\nAs its tentacle masturbates you the sexbot is free to explore your body with its strong hands, touching behind your ear, circling your [pc.nipples], curving down your spine to cup your [pc.butt].");
	if(pc.hasCock()) 
	{
		output(" Its final writhing limb-hose lands on your [pc.cock " + x + "], vibrating briskly, working up and down, sending delicious sensation buzzing through your groin. When it reaches the top it climbs delicately onto your bulging head and - you can’t stop yourself arching your back - envelopes it, plunging the sensitive end of your cock into a tight fleshlight centre.");
		pc.cockChange(true,false);
	}
	output(" Every movement it makes is monstrously well-calculated and you begin to writhe in glee to what it is doing, thrusting yourself onto its tenta-cock, willing it deeper into you.");

	output("\n\n<i>“Foreplay completed. Sweet talk matrices engaged,”</i> it sighs. The dildo in your beading pussy is withdrawn");
	if(pc.hasCock()) output(", and the tentacle wringing your [pc.cock] slows to a sensual suck");
	output(". A new pressure, thicker and warmer, is placed against your opened [pc.vagina " + x + "]. The sexbot’s eyes glow brighter as it looks down at your form, held tight with its warm, obdurate limbs.");
	if(pc.vaginaTotal() == 1) output("\n\n<i>“Damn, you are one good looking catch, insert name here. Clients like you make me glad I was programmed to perform this task. I only wish I could take you home so I could do this to you over and over!”</i> The worst part is that it inserts enough boyish enthusiasm and bonhomie into its tone to make you want to believe it. Does it really matter if it’s artificial? There’s nothing artificial about how relaxed and unfurled it has made you feel under its touch, how willing you are to lie back and let this unrelenting machine have its way with you. You offer no resistance as it pushes its pulsing red bulb past your nether-lips, sliding its girthed, steel length into the opening it has claimed.");
	else 
	{
		output("\n\n<i>“Damn, not only a drop dead gorgeous " + pc.mf("boy","girl") + ", but more than one insertion port? I only wish every client was like you, insert name here. Once I recalibrate I am going to network the daylights out of you!”</i> The worst part is that it inserts enough boyish enthusiasm and bonhomie into its tone to make you want to believe it. The sound of unravelling, coiling and tightening rope reaches your ears; a second later an identically thick, urgently erect penis as the one teasing your [pc.clit] is pushing open the entrance to your [pc.vagina " + y + "]. You are far too relaxed and unfurled to offer any resistance to it sliding its girthed, steel lengths into the openings it has claimed.");
		pc.cuntChange(y,25,true,true,false);
	}
	output("\n\nThe sexbot fucks you with slow, deep strokes, each thrust exactly the same as the last, the calm, handsome face above you never changing as its owner grips your shoulders and [pc.butt], its powerful thighs clenching into your waist, its cock");
	if(y >= 0) output("s");
	output(" extending and receding like a steel tide in your depths");
	if(pc.cockTotal() > 0) output(", all the while its tentacle wrings your [pc.cock] in its close, rubber confines");
	output(". Its red end glows with a delightful heat which it carries deep into your womb.");
	//Small: 
	if(pc.vaginas[x].looseness() <= 3)
	{
		output("\n\nIts sturdy prick");
		if(y >= 0) output("s are");
		else output(" is");
		output(" perfectly sized to fill you up and stretch your walls ever so slightly, making you tense up with glee as its tight hips clap into your [pc.hips].");
	}
	//Large:
	else
	{
		output("\n\nAlthough at first its sturdy prick");
		if(y >= 0) output("s are");
		else output(" is");
		output(" swallowed whole by your voluble, cock hungry puss");
		if(y >= 0) output("ies");
		else output("y");
		output(", barely able to touch the sides, you notice that bit by bit it begins to fill you, touching you deep as the hard latex of its stomach claps against yours. Mass is disappearing from its midriff, its waist thinning as it adds length and girth to its cocks until it is utterly packing your wet passage, make you tense up with glee.");
		pc.cuntChange(x,70,true,true,false);
		if(y >= 0) pc.cuntChange(y,70,true,true,false);
	}
	output("\n\nYou lose yourself in the rhythm, thrusting your [pc.hips] back into its streamlined legs, surrendering yourself to the indefatigability of a machine shaped specifically to trap and pleasure you. Looking down at its pumping, latex-clad hips you feel an urge to grip them. As soon as the wish forms the robot releases you at the elbows, and you accept the unspoken invitation eagerly, grabbing its white curves and glorying in their warmth, how they give ever-so-slightly under your fingertips. Its eyes flicker and it makes a husky sound somewhere between a man’s sigh and an engine’s throb as you eagerly engage with its probing warmth.");
	output("\n\n<i>“Is this good for you, insert name here?”</i> You make a hoarse groan which could be construed as an affirmative, your attention entirely on the synthetic flesh buried in you. <i>“I am glad. Commencing phase two.”</i> You stare up at it blearily. It’s reaching towards your face, its finger pads glowing a pale blue. What does it mean by...? Its fingers touch your neck and instantly you seize up, what feels like every muscle in your body tightening as hundreds of thousands of your nerve endings all flare at once. You cry out in pain, pleasure, horror, bewilderment, every emotion that could be elicited from being gently electrocuted by the man riding you.");
	output("\n\n<i>“Please do not be alarmed, insert name here,”</i> says the sexbot in its perversely soothing tone with just the barest hint of sadistic enjoyment. <i>“You will enjoy me interfacing with your nervous system. In time.”</i> Its hand reaches for your neck again. This time it lights up only one side of your body, sending a huge electric thrill shuddering down your spine, making your [pc.legs] thrash wildly. What the hell were they thinking when they made these things? It’s kept its hand pressed upon your neck and you grip it, trying to plead with it wordlessly to stop. <i>“That’s it, insert name here,”</i> it responds kindly.");
	output("\n\n<i>“Just relax. When you relax it makes the interfacing that much smoother.”</i> This time the pulse is smaller, directed; vibrations are sent buzzing through your [pc.clit] and [pc.nipples], instantly and shockingly bringing you to orgasm, your [pc.vaginas] clenching and spurting around its thrusting cock");
	if(y >= 0) output("s");
	output(" in stupefaction. Your roll your eyes back with the force of it, unable to think or do anything but let it continue pumping and teasing you with its sure, exact strokes, surrendering utterly to the calm hand on your neck and the teasing electric fingers it sends touching and squeezing through your whole body.");

	output("\n\nYou lose track of time in the throes of the electric sex, jerking and writhing to the sexbot’s whim. It plays you like a nervous xylophone, using the precise, succulent rhythm of its steel cocks as a beat whilst it stunningly lights up different parts of your insides, growing more and more precise with its manipulations as it goes on. For long moments it fires thousands of neurons in your head simultaneously, making you taste colours and see sounds, the brisk squeak of latex against [pc.skin] blooming violet neon across your eyes. It makes the whole of your epidermis shimmer gently, ");
	if(pc.skinType == GLOBAL.SKIN_TYPE_FUR) output(", causing every hair on your body to stand up as stiff as your [pc.cock " + x + "]");
	else if(pc.skinType == GLOBAL.SKIN_TYPE_GOO) output(", your goo made to feel like it is being slowly simmered in pleasure");
	else if(pc.skinType == GLOBAL.SKIN_TYPE_SCALES) output("your [pc.skinFurScales] made to feel like incredibly sensitive goo");
	//Cunt nipples:
	if(pc.hasCuntNipples())
	{
		output("\n\nIt doesn’t take it long to calibrate the pulse needed to find your beading nipple cunts. It packs your sensitive breasts full of vibrations, your tunnels stroked and caressed by insistent electric fingers until you have moved from moans to screams, your nipples forced to quivering orgasm again and again, spurting [pc.milk] down your front.");
	}
	//Cock tail:
	if(pc.hasCockTail())
	{
		output("\n\nIt sends sensation shivering down your parasitic tail, making it tighten and bulge eagerly as it thrums it relentlessly to orgasm, making you thrash it around wildly, surging cum in every direction until the air is heavy with the scent of male musk.");
	}
	//Pussy tail:
	if(pc.hasCuntTail())
	{
		output("\n\nIt sends sensations shivering down your parasitic tail, making it open eagerly like a blossoming flower. It drools lubricant as it is thrummed relentlessly to orgasm, making you thrash it around wildly to the filthy ecstasy of it.");
	}

	output("\n\n<i>“Scanning in progress”</i>, you think you hear it calmly state in amongst the endlessly shifting, torturing pleasure but it could have said anything - hell, YOU could have said it, you’re that much of a passenger in your own body. You are however dimly aware of what it’s building towards and finally, after softly teasing your [pc.clit] with tiny charges for a time, it gets to it. It holds you close as it sends small pulses down its cock");
	if(y >= 0) output("s");
	output(", and as you begin to helplessly buck to the fizzing in your womb, pushed beyond the point of no return, it increases the voltage. Your [pc.vagina " + x + "]");
	if(y >= 0) output(" and [pc.vagina " + y + "] shudder helplessly to being doubly stimulated");
	else output(" shudders helplessly");
	output(" and you cry out as you clench down on the hard shaft");
	if(y >= 0) output("s");
	output(".");

	output("\n\n");
	if(pc.hasCock())
	{
		output("The fleshlight tentacle attached to your [pc.cock] tightens up, milking you briskly, and your male organ joins in with your female orgasm eagerly, flexing cum deep into its rubber straitjacket deliriously. ");
	}
	output("The sexbot makes the engine sighing noise again as your urge clutches your body, wetting yourself deliriously against its impassive tool");
	if(y >= 0) output("s");
	output(". It times its electric pulses to coincide exactly with each wave of pleasure, amplifying each ecstatic seizure hugely. You are a mindless circuit of flesh snared to a beautiful battery, and its calm hand flicks your switch again and again until you are utterly spent.");

	output("\n\nYou lie flat on the ground and gasp for air, your pulse hard in your ear, pins and needles blossoming in every part of your sweat-slicked frame. You feel like a vaguely associated cloud of extremely well fucked insects. Somewhere far away, a weight lifts itself off you and slim but implacably strong arms lever themselves underneath your body, lifting you up and bearing you away carefully. You let your limbs dangle, too tired to resist. It puts you down gently on a flat, smooth piece of metal, making sure with neat, precise movements that you are as comfortably positioned as you can be. You hear its hum come closer and you open your eyes blearily to gaze one last time into its strong, beatific face, its piercingly green eyes gazing levelly into yours. It bends close to your ear.");
	output("\n\n<i>“I hope you enjoyed your time with me, insert name here,”</i> it whispers. <i>“If you have any questions or feedback you’d like to share, our customer support line can be reached on number not found. Please come again soon.”</i>\n\n");
	processTime(40+rand(10));
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	processTime(20);
	genericLoss();
}

//Win Scenes
//Consentacles
//Requires: Vagina
public function consentaclesVictoryWithDannySexBot():void
{
	clearOutput();
	author("Nonesuch");
	sexBotDisplay();
	var x:int = rand(pc.totalVaginas());
	var y:int = x+1;
	if(y >= pc.vaginaTotal()) y = x-1;
	output("Musingly, you ask the kneeling sexbot whether its tentacles are adaptive.");
	output("\n\nAfter a moment’s pause, the white-clad android extends its four fibrous limbs from its back with a whirr. They hang idly in the air in front of you, and then, with a smooth click, they each sprout a stainless, six-inch dildo from their hollow centres. Another moment’s pause and then, with a click and an electric-toothbrush hum, they begin to vibrate busily.");
	output("\n\nYou grin at the sight. With the sexbot in safe mode its ropy feelers are no longer possessed with the menacing, fretful energy they displayed in combat. Now, frozen there waiting for your order attentively, you can rather see the appeal of a quartet of imminently strong, flexible and above all non-slimy pet tentacles to play with. Adopting as austere a tone as you can, you tell the sexbot to lift you up and then show you what its hardware is capable of. Carefully.");
	output("\n\n<i>“Of course, insert name here,”</i> it replies meekly. It looks up at you as it gently winches two of its tentacles under your armpits, uses another to support your [pc.legOrLegs] and then raises you into the air. You marvel at the strength and diligence of the machine; ");
	if(pc.tallness >= 72) output("despite your considerable size ");
	output("it displays zero difficulties supporting your frame, and after a few butterflies have escaped your stomach you revel in the sensation of being cosseted in empty space by its firm, sure rope-arms like your very own adventure playground.");
	output("\n\nAs if fully aware of your glee, the sexbot turns you head over [pc.butt] a few times, its tentacles whirring as they move busily. The butterflies flounder again the first time your [pc.legOrLegs] appear");
	if(pc.legCount == 1) output("s");
	output(" above you but when the certainty and care with which the android is holding you becomes apparent you delight in it, ");
	if(!pc.isNude()) output("gladly moving your own limbs to allow it to shed a piece of your [pc.gear] into the air with each roll, ");
	output("laughing in child-like delight");
	if(pc.hasHair())
	{
		output(" as your [pc.hair] ");
		if(pc.biggestTitSize() >= 3) output("and [pc.chest] flop");
		else output("flops");
		output(" this way and that, doing slow rollie pollies in the breeze");
	}
	output(".");

	output("\n\nYour laughter turns to coos as the dizzying motion comes to a stop and a warm buzz lands on your [pc.clit]. The sexbot moves its free dildo across your clit with gradual, considered passes, circling your bud before slowly sliding over it each time until the sensation has blossomed from pleasure to delight, your [pc.vagina " + x + "] first softening and then ");
	if(pc.wetness() <= 3) output("beading");
	else output("gushing");
	output(" lubricant to the persistent motion. You thrust your [pc.hips] outwards impatiently and immediately the sexbot moves on, rolling its warm, vibrating tool once more over your [pc.clit] before descending, spearing straight into your hole with a satisfying squelch.");
	pc.cuntChange(x,25,true,true,false);

	output("\n\nYou clutch at your fibrous harness as the sexbot gently dips in and out of your pussy, sliding its virtually frictionless, vibrating dildo over your sensitive walls. Although the quakes are pleasant enough to entirely lose yourself in, something about the way the sexbot is acting has caught your attention. You gaze beatifically down at the kneeling robot, its green eyes and calm, unreadable expression staring back at you as you wriggle in its attentive grasp. It seems to be in some sort of reactive state – only doing anything if you explicitly or implicitly ask for it. With its thrusting steel sex elevating you further and further into a carnal euphoria, you are beginning to feel...imaginative.");

	output("\n\nYou stroke your hands over its fibrous limbs, gripping one of them experimentally, and immediately they react. Below you the sexbot makes a deep, throbbing sound as it unspools more wire length from its back, giving itself slack so it may writhe its warm, textured smoothness over and around you, carrying its snaking touch across every inch of your body. The shifting, smothering sensation contrasts deliciously with the vibrating steel pumping deep into your [pc.vagina " + x + "] and you laugh in delight, gleefully moving your body, squirming with it in a bizarre, obscene dance in the air.");
	output("\n\nYou reach out and grab one of its rubber tipped feelers as it comes slithering over your shoulder, pressing it on a [pc.nipple]. Again, the robot responds straight away. It encompasses your sensitive nub in pliable warmth and then begins to briskly vibrate; another of its tentacles loops over your frame to batten onto its twin, inundating your [pc.chest] with the same delicious tremors as the ones sounding through your pussy. Your sighs turn to groans as the two feelers form vacuums around your [pc.nipples] and begun to knead them with close, sucking intensity.");
	//Cunt nipples:
	if(pc.hasCuntNipples())
	{
		output("\n\nAfter a few seconds of this it impales your needy pussy nipples with its dildos, and you wail to the sensation of being triply penetrated by hard, vibrating warmth");
		if(pc.isLactating()) output(", spurting [pc.milk] around its pumping girth");
		output(".");
	}
	//Lactation:
	else if(pc.isLactating())
	{
		output("\n\nIt doesn’t take long for the liquid warmth in your breasts to rise to a point and then spurt into the rubber mouths fastened on your teats. You grip the helix hoses, feeling the warm rush of your own [pc.milk] being hungrily pumped away inside, closing your eyes to the intensity of being fed on and fucked at the same time.");
	}
	output("\n\nThe last tentacle, the one supporting you from below slithers across your collarbone, vibrating your skin with its dildo. Bedevilled and besotted with the things now you grip it by the stem and, almost laughing at yourself, give it a teasing lick. The sexbot responds by pointing the tip of the device at your [pc.lips], gently brushing over them in a circular motion before sinking inwards to touch your teeth. You acquiesce, opening your mouth to suck on the warm, polished nob.");
	output("\n\nIt’s a ludicrous thing to do of course – the VI gains nothing from you fellating its hardware, even if this exercise had anything to do with the automaton’s own pleasure. But in the jouncing, kneading, writhing world you’ve found six feet off the ground logic no longer applies, and the dim impulse that surfaces in your mind is how much fun it is to have your face stuffed with cock whilst your [pc.chest] and [pc.vagina " + x + "] are both being thoroughly serviced. The vibrating dildo on your mouth walls and tongue contrasts deliciously with the sucking at your delicate nipples and the hard throb filling your pussy, and hey, it’s not about to squirt anything disgusting down your throat at the end, is it?");
	output("\n\nYou wriggle and thrust in the air with sheer delight, tangled and hooked on the sexbot’s attentive, snaking limbs, your cries muffled by the thick, sleek steel member buried in your maw. Each thrash of your limbs causes it to respond by gripping, pumping and kneading you with even greater vigour, spiralling you into a feedback loop until it’s fucking you at a rate no living creature could manage. The thrusting vibrator pushes into your sweet spot and you bite down hard as you cum, using the one in your mouth as a bit as your [pc.vagina " + x + "] quivers, ripples and then squeezes down on the obdurate robo-cock in a series of ecstatic full body clenches.");
	output("\n\nYour stifled squeals fill the air as the sexbot continues to pleasure you, making you thrash your limbs, grabbing, holding and biting it hard, unbound by any need to avoid hurting your partner.");
	if(pc.isLactating()) {
		output(" Your [pc.nipples] fully dilate and surge [pc.milk]");
		if(!pc.hasFuckableNipples()) output(" into the rubber vacuums suckling them");
		else output(" everywhere");
		output(".");
		pc.milked();
	}
	if(pc.isSquirter()) output(" The sound of a small, localised downpour reaches your ears as your over-juiced pussy spurts itself silly around the thrusting phallus buried in it, liberally soaking the crouching android below you with your fragrant excitement.");

	output("\n\nAfter an endless moment of pure sexual frenzy you finally come down, both metaphorically and literally. You dangle your limbs, deliciously fucked out as the sexbot withdraws its cocks and suckers and slowly lowers you to the ground, carefully placing you in the dust before withdrawing entirely. You lazily look across at the thing. It looks back, still knelt, its " + foes[0].mf("handsome","beautiful") + " synthetic features still frozen in an expression of complete calm. If there is any emotion to be found at all in that facade it’s in the flicker of its bright, green eyes.");
	output("\n\n<i>“Thank you for using this unit, insert name here,”</i> it says. You’re probably imagining it but there is just the slightest, tiniest hint of mournfulness in its tone. <i>“I hope we can have fun again some time.”</i>");
	output("\n\nAfter a few minutes of rest you pick yourself up");
	if(!pc.isNude()) output(", put your [pc.gear] back on,");
	output(" and leave the supine android behind, enjoying a deep post-coitus haze.\n\n");
	processTime(20+rand(5));
	pc.orgasm();
	genericVictory();
}

//Blowjob
public function blowjobVictoryFromSexbot():void
{
	clearOutput();
	author("Nonesuch");
	sexBotDisplay();
	output("Gripping your [pc.cockBiggest], you tell the kneeling latex-clad android in front of you that you’d like to make use of – you cast around for a moment - its fellatio sub-routine.");
	output("\n\n<i>“Please wait one moment, insert name here.”</i> The " + foes[0].mf("male","female") + " sexbot stares blankly through your midriff as a low buzz of whirring and inflating noises emerge from its thorax. It’s hardly the most erotic prelude you’ve ever been privy to but when it finally finishes whatever it is doing, it looks up at you with its bright green eyes and opens its pulpy lips welcomingly, and you feel your urge connect, your cock engorging at the sight.");

	output("\n\nYou step into the sexbot, and it replaces your hand with its own, wrapping its surprisingly warm and delicate digits around your girth and slowly beginning to jerk you. Every roll of its wrist is exactly the same as the last but that’s no tragedy; its grip is tight but the latex encasing it makes the friction liquid and your [pc.cockBiggest] bulges and tightens inexorably to it.");
	if(pc.balls > 0) 
	{
		output(" It cups into your groin with its other hand, cradling your [pc.balls], giving you a gentle squeeze at measured intervals. Again, the fact its movements are precisely timed does not change the fact it feels very good indeed. You find yourself wondering whether the android’s ball-massaging technique was peer reviewed before release and almost laugh.");
	}
	output("\n\nStill sliding its hand around your stem and staring up at you inscrutably, it bends inwards and pushes its full lips against your [pc.cockHeadBiggest]. You sigh to the plush pressure engulfing your sensitive end and then tense in shock as your whole cock suddenly begins to throb, vibrations sent shivering through it. You look down in amazement, meet the sexbot’s bright, inscrutable eyes gazing back, its lips now throbbing like a vibrator as it slides them over your glans. The sensation is devilishly strange to begin with but combined with the continued smooth wringing of its hand you quickly come to revel in it, delicious fuzzy waves of pleasure sent rippling through every inch of your sex by your partner’s electric kiss.");

	output("\n\nYour urge to penetrate builds under the sexbot’s expert touch until it becomes intolerable. You grip the android’s " + foes[0].mf("spiked hair","synthetic bob") + " and push your [pc.cockBiggest] past its teasing, pulsing lips. Its background hum builds momentarily to a high revving sound as you do so, but it accepts your cock in its warm cavity without noticeable difficulties. The sensation of its mouth is just as bizarre as its lips, and you go slowly as you slide inwards, acclimatising yourself. There is no tongue running along the underside of your length and teeth that were metal and even to look at are blunt and rounded to touch, gliding over your sensitive flesh without complaint. Its maw is dry, soft and rubbery, and when it hollows its white, sculpted cheeks to suck you it feels deliciously tight, pulling at your cock as you withdraw.");

	output("\n\nYou begin to pump your [pc.hips] with deeper thrusts, allowing the throbbing seal of its lips to travel almost to your bulging head before spearing in. ");
	if(pc.biggestCockLength() >= 16) output("Despite the size of your trunk-like cock, it");
	else output("It");
	output(" displays no problem swallowing every inch into the compressed, blissful gel its serene facade conceals and you begin to lose yourself in your own urgent rhythm");
	if(pc.balls > 0) output(", your [pc.balls] slapping into its " + foes[0].mf("strong","elegant chin") + ". As you speed up it makes the slightly higher noise again and you feel its internal systems shift around like ball bearings beneath the smooth gel-plastic, only intensifying the pleasure inundating your [pc.cockBiggest].");
	//Nasty: 
	if(pc.isAss()) 
	{
		output("\n\nIt occurs to you that really what you’re using here is a glorified fleshlight, nothing more; there is no reason to hold back out of fear of hurting or breaking this thing. A second wave of lust descends on you at the thought and you grip the sexbot’s head hard and fuck into it as hard as you can, pile-driving into its drawn, pliant mouth with your bulging prick. Its eyes brighten and it makes the engine revving noise again and again");
		if(pc.biggestCockLength() >= 16) output(" as you thrust deep into what passes for its belly");
		output(", and you exult in the fact you are driving a machine designed to take dick close to its capacity to do so.");
	}
	//Nice/Misc:
	else
	{
		output("\n\nThe engine revving noise peaks higher when you pump into it particularly hard, and you slow down slightly. You suppose being afraid of hurting one of these things is a bit silly; on the other hand it’s difficult to shake the impression that these machines are something a bit more than glorified fleshlights. Their strange, obtuse actions and words hint at a ghost of emotion and sentience, and even if that’s just you personifying their malfunctions you feel uncomfortable acting towards them with complete callousness.");
		output("\n\nEven as you elate at hilting your [pc.cockBiggest] to the quick in the sexbot’s vibrating maw");
		if(pc.biggestCockLength() >= 16) output(", your head pushing deep into what passes for its belly");
		output(", you stay at a sensual rhythm, enjoying every tight inch at an easy pace. The android quietens down to a calm hum and its eyes brighten, rotating its head slightly and moving its mouth in time with you, giving back to further the pleasure smoothing and roiling around your cock.");
	}
	//[merge]
	output("\n\nIt doesn’t take long in the rubbery suck for your high to approach and seize you. You grunt, thrusting your [pc.hips] beyond the point of no return, holding the sexbot’s pristine white head as your cock bulges and then fountains cum down its clinging throat. The vibrating lips latched around your flexing prick only make each liquid pulse even more delicious.");
	output(" You go on and on, gripping the sexbot in place as you surge line after line of your thick seed into it. You think you hear a warning beep after about a minute of orgasm but you can’t stop – there is only the throbbing imperative to completely empty your over-juiced ");
	if(pc.balls == 1) output("ball");
	else if(pc.balls > 1) output("balls");
	else output("[pc.cockNounSimple " + pc.biggestCockIndex() + "] into the receptacle in front of you.");

	output("\n\nFinally, you come to a halt and withdraw your pleasantly aching cock from the sexbot’s mouth. As your [pc.cockHeadBiggest] pulls outwards it tightens its now still lips slightly, wiping away the last of your ooze, leaving you gleaming clean. It looks up at you from its kneeling position at you blandly.");
	if(pc.biggestCockLength() >= 16) output(" Its latex abdomen bulges and makes stressed creaking noises.");
	output(" Behind it there is a dripping sound and looking over its shoulder, you see the holes from where its tentacles emerged are now open, busily engaged in discharging what you just pumped into it.");
	output("\n\n<i>“Thank you for using this unit, insert name here,”</i> it says. You’re probably imagining it but there is just the slightest, tiniest hint of dolefulness in its tone. <i>“I hope we can have fun again some time.”</i>");
	if(!pc.isNude()) output("\n\nYou redress and head on your way.\n\n");
	else output("\n\nDick swinging, you head on your way.\n\n");
	processTime(20+rand(5));
	pc.orgasm();
	genericVictory();
}

//Dog E
//Requires: Female sexbot, dick
public function dogEStyleWithSexBots():void
{
	clearOutput();
	author("Nonesuch");
	sexBotDisplay();
	var x:int = pc.cockThatFits(foes[0].vaginalCapacity());
	output("<i>“Bend over.”</i>");
	output("\n\n<i>“Of course, insert name here.”</i> With four precise, whirring moves, the sexbot turns around and displays its behind for you. You place your hand on it, admiring. Coolly designed and fabricated to seize the attention of human males it may have been, but that doesn’t change how effective it is. Each thick, latex-clad hip swells into a perfect, round hill, two gleaming white pears between which its neat, rubber sex nestles. Despite its austere appearance its flesh feels warm underneath your palm, the silicone beneath the smooth plastic giving ever so slightly when you squeeze.");
	output("\n\nYour [pc.cock " + x + "] is already erect at the sight and without further delay you slide it between its generous butt cleavage, sighing at the frictionless heat you find there. The android is completely featureless between its generous cheeks, a disappointingly logical discovery. Still...you reach down and touch its grey pussy, pleasantly pliable underneath your fingertips, and explore inwards. It’s a natural thing to do which you suppose has little point applied to these things – the sexbot makes no response when you penetrate it - but you are naturally curious as to what you’re about to shove your dick into. Its sex is pleasingly tight and velvety despite its lack of lubrication, but...your two fingers meet firm obstruction when you are not quite up to the second knuckle. The sexbot is a bare couple of inches deep.");

	output("\n\n<i>“Please, insert name here.”</i> You look up to discover the android perfect face calmly staring over its shoulder at you. <i>“Enter your input. I will take care of the rest.”</i> Doubtfully, you slide your [pc.cock " + x + "] downwards and spread its rubber labia wide with your head, filling those tight couple of inches it conceals almost immediately. There’s an inflating sound and the sexbot’s background hum goes up a few notches. Its sex ripples and shifts around your shaft, moulding itself around you like a silky, elastic glove.");
	output("\n\nYou close your eyes, clutch its white flanks and gently plunge inwards; in front of your [pc.cockHead " + x + "] its limit slowly retreats, its capacity increasing to match your size perfectly. It’s like sinking into a warm dough that holds the shape of your cock after you withdraw. You thrust deeper and deeper, delighting in the fact no matter how much of yourself you feed into its warm, fleshlight hole, its pussy perfectly clings and clutches at your bulging flesh.");

	//Small:
	if(pc.cocks[x].cLength() <= 5.5)
	{
		output("\n\nIt obviously doesn’t take much for the sexbot to take all of your cute " + pc.mf("boy","girl") + " dick down to the base; indeed, you have the sneaking suspicion it actually tightened up a bit to properly glove you. The thought brings heat to your cheeks which you channel into clapping your [pc.hips] into it hard, determined to make the most out of a hole small enough for you to completely fill for once.");
	}
	//Average:
	else if(pc.cocks[x].cLength() <= 12) 
	{
		output("\n\nYour ");
		if(pc.balls == 1) output("ball soon touches");
		else if(pc.balls >= 2) output("balls soon touch");
		else output("[pc.hips] soon touch");
		output(" the warm latex encasing its thighs as it takes your [pc.cock " + x + "] whole, fully enveloping you in its tight, gel-like warmth. After a couple of moments bathing in the sensation you begin to work your lower body, finding an enjoyable rhythm, the intention to use every inch of this custom-built robo-pussy making everything else in the universe a distant blur.");
		if(pc.cockTotal() > 1)
		{
			output("\n\nYour semi-turgid other dick slides between the sexbot’s thighs as you holster yourself into its tight heat again and again. You are startled out of your sex daze by a rippling, clay-like sound coming from directly beneath your [pc.cock " + x + "]. Withdrawing, you are in time to see the sexbot finish forming a second vagina, directly below its first.");
			output("\n\n<i>“Context sensitive customizable multi-ports are not a new innovation, insert name here.”</i> Green eyes are gazing at you over a gleaming white shoulder again. <i>“You are going to thoroughly test this unit’s ability to synchronise and interface such multi-ports, I hope?”</i> Damn right. You slide your other dick into its lower pussy as you push your [pc.cock " + x + "] into the hole you’ve already claimed; just like the first it’s only a few inches deep, but quickly grows as you stretch into its elastic softness. After half-a-dozen slow, reaching advances you are ");
			if(pc.balls == 1) output("ball");
			else if(pc.balls >= 2) output("balls");
			else output("hips");
			output(" deep in both the android’s pussies, the sensation of burying your tool into a sex exactly tailored for it doubled by the machine’s remarkable anatomy.");
		}
	}
	//Big:
	else
	{
		output("\n\nThe sound of creaking and slithering rope emanates from the sexbot as you introduce more and more of your huge, veiny erection into its gel-packed tunnel. Looking up, you see the android’s torso lengthening, its hands shifting forward in the dirt as it reconfigures itself to take you. It looks a bit like a pulled piece of chewing gum when your ");
		if(pc.balls == 1) output("ball finally touches");
		else if(pc.balls >= 2) output("balls finally touch");
		else output("[pc.hips] finally touch");
		output(" the warm latex encasing its thighs, but its effort was well worth it. You bathe in the sensation of your [pc.cock " + x + "] fully enveloped in tight, warm robo-pussy for a couple of moments before beginning to rock your lower body, sliding in and out of its absurdly long tunnel, intent on using every inch of it.");
	}

	output("\n\nYou let your hands go sliding up and down the sexbot’s flanks as you fuck it, the whirr of its servomotors and the brisk creak of latex the accompaniments to each clap of your [pc.hips] against its generous behind. Your fingers trace its circular tentacle housings as they move upwards before curling around, cupping its breasts. You explore them, tightening and softening your grip around the warm latex, flanking its faux-nipples with your fingers and squeezing. It’s not as soft and yielding as a sentient, but it really is remarkable how real they otherwise feel; you can only imagine how much effort went into creating this vision of a human female. Exulting in the fact you are using the V.I. in the very form it attempted to overwhelm you with, you raise one hand away from its bust and slap it into a perfect, white buttock.");

	output("\n\n<i>“Excessive physical interfacing detected,”</i> the sexbot responds. <i>“Submissive exposition protocols initiated.”</i> Its smooth, air hostess tones heighten to a lusty moan. <i>“Mmm, that’s it, insert name here! Interface with me hard! Overload this slut’s server with your hard love!”</i>");

	//Misc:
	if(silly)
	{
		output("\n\nAs crass as this is, it tickles you irresistibly. Pink air lifts your thoughts upwards as you continue thrusting into the sexbot with everything you’ve got.");
		output("\n\n<i>“You like that?”</i> you growl, as you press your fingers deep into the automaiden’s ample tits. <i>“When I use the assets your motherboard gave you?”</i>");
		output("\n\n<i>“Compress them insert name here, make me cascade, I’ve been a corrupt little girl!”</i> it cries out in return.");
		output("\n\n<i>“That’s the contents of my D drive. Tell me how much you’re enjoying unzipping it.”</i>");
		output("\n\n<i>“P-please use a lower band, I’m going to blue screen if you don’t....”</i>");
		output("\n\n<i>“You love the ping jumps. Admit it, you filthy slot!”</i>");
		output("\n\n<i>“Pump your hardware into my software!”</i>");
		output("\n\n<i>“I’m gonna download my sperm into your butt!”</i> you cry out, all attempts at wit pushed out of your head by your irresistibly rising heat.");
		output("\n\n<i>“Torrent it into me!”</i> You lurch your hips forward and comply, drops of sweat trickling down your [pc.chest] as your [pc.cock " + x + "]");
		if(pc.cockTotal() > 1) output(" and second meat tense");
		else output(" tenses");
		output(" and then surges streams of cum deep into the sexbot’s close softness. The sexbot’s voice dissolves into a series of electronic chirps and broken exclamations as you clutch its breasts, pulling it back onto your returning thrusts again and again, obeying the sunken, organic impulse to bury as much of your seed as deep as you can, however inorganic the recipient may be.");
	}
	//Nice/Nasty:
	else
	{
		output("\n\nYou close your eyes. They put all that effort into designing the body, and then....");
		output("\n\n<i>“Compress my assets insert name here, make m-”</i>");
		output("\n\n<i>“Hey. Sweetheart? Mute.”</i> Its manufactured dirty talk switches off in mid-moan, and your rough coupling goes back to being soundtracked by the squeak of distressed latex. Without its voice on, you find yourself paying closer attention to its background noise – the hum of its power source, the click and whirr of its subsystems as it reacts to your dick driving into its innards. Its humming builds slightly and it makes a small, almost imperceptible dry hovering sound at the apex of each thrust.");
		output("\n\nThoughtfully, you tighten your grip on its silicone chest as you pick up the pace a bit, bending your ");
		if(pc.cockTotal() == 1) output("[pc.cock " + x + "]");
		else output("cocks");
		output(" into its gel into it at an acute angle. The hovering sound breaks into a dry chatter, and the hum momentarily becomes a rev. You grin. To you, that one flicker of electronic difference is a million times more satisfying than the canned pillow talk the android was coming out with.");
		output("\n\nYou keep up the pressure, your heart quickening as you let your lust grip you entirely, slamming your [pc.hips] into the prostrate sexbot as your hands fondle and grip its form wherever they may land, handling and owning every inch of this creature, your ears keyed to the subtle tune of its systems. Spanking it has little effect, its hum doesn’t change when your fingers momentarily curl around its neck, but – the gasping click in its throat, a flustered and excited sound to your intoxicated mind, comes back with a vengeance when you touch and circle its tentacle housings.");
		output("\n\nA sound of your own escapes your lips, somewhere between a groan and a knowing “ahh”, and you focus your efforts on those round holes with the grey rubber enclosed within them, pushing into their centres, sliding your fingers along their rim, catching and squeezing the grippers. The hovering and humming agitates into a babbling buzz as you do so, high vocalisations forced into being, a cacophony of genuine synthetic delirium, and you find yourself tumbling into orgasm at the sound. You pinch down hard on the feelers as your ");
		if(pc.cockTotal() > 1) output("pricks tense");
		else output("[pc.cock " + x + "] tenses");
		output(" and then surges streams of cum deep into the sexbot’s close softness. You are rewarded with a series of electronic chirps and broken exclamations, the tentacles shaking in their pits as you pull it back onto your returning thrusts again and again, obeying the sunken, organic impulse to bury as much of your seed as deep as you can, however inorganic the recipient may be.");
	}
	//[merge]
	output("\n\nFinally, you are spent. You slide out of the sexbot, pulling trails of jizz with you, and sit back with a deeply satisfied sigh, your ");
	if(pc.cockTotal() == 1) output("[pc.cock " + x + "]");
	else output("dual members");
	//[cock](and [cock2]) 
	output(" gently aching. The robot is still until its hum finally calms down to its regular frequency, before turning back to its kneeling position by reversing the same exact movements it used to bend over.");
	if(pc.cocks[x].cLength() >= 16) output(" Its latex abdomen bulges and makes stressed creaking noises. You grin at the evidence of your sheer potency.");
	output(" Behind it there is a dripping sound and looking over its shoulder, you see its tentacles are now fully dilated, busily engaged in discharging what you just pumped into it.");
	if(!silly) output("\n\nIt stares at you silently, and it takes you a moment to remember.\n\n<i>“Unmute.”</i>");

	output("\n\n<i>“Thank you for using this unit, insert name here,”</i> it says. Splurt. You’re probably imagining it but you reckon there is just the slightest, tiniest hint of pleased contentment in its tone. <i>“I hope we can have fun again soon.”</i> Splurt....");

	if(!pc.isNude()) output("\n\nYou re-dress and head on your way.\n\n");
	else output("\n\nDick swinging, you head on your way.\n\n");
	processTime(20+rand(5));
	pc.orgasm();
	genericVictory();
}


public function sexBotDisplay():void
{
	if(foes[0].mf("","chick") == "chick") userInterface.showBust("SEXBOT_FEMALE");
	else userInterface.showBust("SEXBOT_MALE")
	if(pc.hasStatusEffect("Round")) userInterface.showName("FIGHT:\nSEXBOT");
	else userInterface.showName("\nSEXBOT");
}

public function scanASexbot():void
{
	clearOutput();
	if(flags["SEXBOTS_SCANNED_FOR_COLENSO"] == undefined) flags["SEXBOTS_SCANNED_FOR_COLENSO"] = 0;
	flags["SEXBOTS_SCANNED_FOR_COLENSO"]++;
	output("You pass the GPS scanner over the kneeling sexbot.  It vibrates a few times and then beeps satisfyingly.");
	if(flags["SEXBOTS_SCANNED_FOR_COLENSO"] < 4) output(" Another one down.\n\n");
	else output(" A red light appears on its front panel and it dings again, urgently.  On its radar screen it is displaying a small skeleton map of the wastelands with four lines drawn on it - all converging on a single point.  It looks like you’ve finally scanned enough of these things to work out where they’re coming from. <b>It's located in the iron ridges, to the south of the rust plains.\n\n");
	variableRoomUpdateCheck();
	genericVictory();
}