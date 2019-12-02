//import classes.Characters.MiningRobot;
import classes.Items.Miscellaneous.MaikesKeycard;
import classes.Items.Transformatives.SnakeByte;
import classes.Items.Armor.JumperSpacesuit;

public function zhengCoordinatesUnlocked():Boolean
{
	return (nyreaDungeonFinished() || (flags["KQ2_MYRELLION_STATE"] == 1 && MailManager.isEntryUnlocked("danemyrellioncoords")));
}

public function zhengElevatorF1Bonus():void
{
	variableRoomUpdateCheck();
	//Power Out: 
	if(flags["ZHENG_SPACEWALKED"] == undefined && flags["ZHENG_SHI_SLAVE_SNUCK"] == undefined) output(" However, a big red sign has been hung up off a valve next to the elevator that reads <b>OUT OF ORDER</b>. The console that controls the elevator is powered down, and a couple of pokes doesn’t change that. Looks like the power’s been cut somewhere...");
	else 
	{
		output(" The power has been restored to the elevator, and the console is flashing dimly with control instructions.");
		addButton(5,"Up",move,"ZSF I16");
	}
}

public function slavesuitRoomOfZhengShiMines():Boolean
{
	if(flags["ZHENG_SHI_JUMPSUITED"] == undefined)
	{
		output("\n\nAn old slave jumpsuit is discarded here.");
		addButton(0,"Jumpsuit",takeZhengShiJumpsuit);
	}
	return zhengMinesEncounterBonus();
}

public function takeZhengShiJumpsuit():void
{
	lootScreen = takeZhengShiJumpsuitCheck;
	flags["ZHENG_SHI_JUMPSUITED"] = 1;
	itemCollect([new Slavesuit()]);
}
public function takeZhengShiJumpsuitCheck():void
{
	if (pc.armor is Slavesuit || pc.hasItemByClass(Slavesuit))
	{
		mainGameMenu();
		return;
	}
	clearOutput();
	output("You put the suit back where you found it.");
	flags["ZHENG_SHI_JUMPSUITED"] = undefined;
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function takeZhengShiSpacesuit():void
{
	lootScreen = takeZhengShiSpacesuitCheck;
	flags["ZHENG_SPACESUIT_TAKEN"] = 1;
	itemCollect([new SpacesuitIncomplete()]);
}
public function takeZhengShiSpacesuitCheck():void
{
	if (pc.armor is SpacesuitIncomplete || pc.hasItemByClass(SpacesuitIncomplete))
	{
		mainGameMenu();
		return;
	}
	clearOutput();
	output("You put the spacesuit back where you found it.");
	flags["ZHENG_SPACESUIT_TAKEN"] = undefined;
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function zhengMinesSpaceBonus():Boolean
{
	// Stranded load Hotfix
	addButton(0,"Airlock",move,"ZSM YY18");
	addButton(1,"Hangar",fastSpacewalkToHangar);
	
	return zhengMinesEncounterBonus();
}

public function zhengMinesEncounterBonus():Boolean
{
	IncrementFlag("ZS_MINE_STEP");
	var encounters:Array = [];
	//First 3 times are gimmes, then increasing odds till step 15 or so.
	if(flags["ZS_MINE_STEP"]-4 > rand((isLoreleisBitchVisibly() ? 20 : 16)))
	{
		flags["ZS_MINE_STEP"] = 0;
		IncrementFlag("ZS_MINE_ENCOUNTERS");

		if(flags["ZS_MINE_ENCOUNTERS"] > 7 && !pc.hasStatusEffect("DisabledRoz") && flags["ROZ_ARMOR_STOLEN"] == undefined && flags["ROZ_CORED_4_GUD"] == undefined) encounters.push(encounterRoz);
		
		if(flags["MAIKE_SLAVES_RELEASED"] == 1 || flags["MAIKE_SLAVES_RELEASED"] == 2) 
		{
			encounters.push(encounterSlyverenSlavebreaker);
			encounters.push(encounterSlyverenSlavebreaker);
			encounters.push(boredJumperAttackProc);
			encounters.push(boredJumperGangbangProc);
			//Robots become a very rare encounter
			if(rand(5) == 0) encounters.push(miningRobotAttack);
		}
		//No more robot
		else
		{
			encounters.push(miningRobotAttack);
			encounters.push(miningRobotAttack);
			encounters.push(boredJumperAttackProc);
			encounters.push(boredJumperAttackProc);
		}
		
		if (ratsAvailable() && rand(3) == 0) encounters.push(ratsInTheMineEncounter);
		if (rollForLorelei()) encounters.push(loreleiRandomEncounter);
		
		var pregScene:int = boredJumperPregScene();
		if (flags["BJUMPER_BIRTH_SCENE"] == 1)
		{
			encounters.push(boredJumperPregEncounterJumperPregBirth);
		}
		else if (pregScene > 0)
		{
			if (pregScene == 1 || pregScene == 4 || pregScene == 5) encounters.push(boredJumperPregEncounterJumperPreg);
			if (pregScene == 2 || pregScene == 4 || pregScene == 5) encounters.push(boredJumperPregEncounterSteelePreg);
			if (pregScene == 3 || pregScene == 5) encounters.push(boredJumperPregEncounterBothPreg);		
		}
	}
	if(encounters.length > 0) 
	{
		return encounters[rand(encounters.length)]();
	}
	//If no combat, MAUS!
	if(flags["MAUS_MECHANIC_DISABLED"] == undefined && flags["MINING_ROBOT_ENCOUNTERS"] != undefined && !pc.hasKeyItem("Zheng Shi RFID Badge"))
	{
		// Check for button space. If not space on top button row, no mouse.
		var mouseBtn:int = 0; 
		for(mouseBtn = 0; mouseBtn < 5; mouseBtn++) { if(!hasButton(mouseBtn)) break; }
		if(mouseBtn >= 5) return false;
		//Move Mouse
		if((rand(20) == 0) && !pc.hasStatusEffect("Maus CD"))
		{
			flags["MAUS_LOCALE"] = currentLocation;
			pc.createStatusEffect("Maus CD");
			pc.setStatusMinutes("Maus CD",8*60);
		}
		if(flags["MAUS_LOCALE"] == currentLocation)
		{
			output("\n\nA pair of mousy ears peaks out over the bulk of a busted mining robot. Half its circuits are splayed across the ground like spilled spaghetti, and more join the pile with each passing moment. The caustic curses coming from behind the ill-used metal could strip industrial paint.");
			addButton(mouseBtn,"Investigate",investageDatMouseMechanicYo,undefined,"Investigate","This probably won’t lead to a fight. Probably. Maybe.");
		}
	}
	return false;
}

public function zhengFoundrySoftwareDevSuckBonus():Boolean
{
	if(zhengFoundryF1EncounterBonus()) return true;
	if(flags["SNAKEBYTE_LOOTED"] == undefined)
	{
		output("\n\nA vial of something called ‘SnakeByte’ sits on the desk.");
		addButton(0,"SnakeByte",takeSnakeByte1,undefined,"SnakeByte","Check it out.");
	}
	return false;
}

public function takeSnakeByte1():void
{
	clearOutput();
	showName("\nSNAKEBYTE");
	flags["SNAKEBYTE_LOOTED"] = 1;
	output("The injector is apparently some kind of hyper-specific gene-mod, designed to imbue the user with inhuman deepthroating abilities. Do you want to take it?");
	clearMenu();
	addButton(0,"Take It",takeSnakeByte2);
	addButton(1,"Don’t",mainGameMenu);
}

public function takeSnakeByte2():void
{
	clearOutput();
	showName("\nSNAKEBYTE");
	quickLoot(new SnakeByte());
}
	
public function zhengFoundryF1EncounterBonus():Boolean
{
	IncrementFlag("ZS_FOUNDRY_STEP");
	var encounters:Array = [];
	//First 3 times are gimmes, then increasing odds till step 15 or so.
	if(flags["ZS_FOUNDRY_STEP"]-4 > rand((isLoreleisBitchVisibly() ? 20 : 16)))
	{
		flags["ZS_FOUNDRY_STEP"] = 0;
		IncrementFlag("ZS_FOUNDRY_ENCOUNTERS");

		//encounters.push(forgehoundEncounter);
		encounters.push(encounterPunkSecOp);
		encounters.push(encounterPunkSecOp);
		encounters.push(encounterPunkSecOp);
		encounters.push(coronaFlamerEncounter);
		encounters.push(coronaFlamerEncounter);
		encounters.push(coronaFlamerEncounter);
		if (ratsAvailable())
		{
			//encounters.push(ratsInTheMineEncounter);
			encounters.push(ratsInTheMineEncounter);
			encounters.push(ratsInTheMineEncounter);
		}
		if (rollForLorelei())
		{
			encounters.push(loreleiRandomEncounter);
			encounters.push(loreleiRandomEncounter);
		}
		if (snekAndMausHavingFun())
		{
			encounters.push(snekMausBonus);
			encounters.push(snekMausBonus);
			encounters.push(snekMausBonus);
			encounters.push(snekMausBonus);
		}
		/*encounters.push(boredJumperAttackProc);
		encounters.push(boredJumperAttackProc);*/
		var pregScene:int = boredJumperPregScene();
		if (flags["BJUMPER_BIRTH_SCENE"] == 1)
		{
			encounters.push(boredJumperPregEncounterJumperPregBirth);
		}
		else if (pregScene > 0 && rand(2) == 0)
		{
			if (pregScene == 1 || pregScene == 4 || pregScene == 5) encounters.push(boredJumperPregEncounterJumperPreg);
			if (pregScene == 2 || pregScene == 4 || pregScene == 5) encounters.push(boredJumperPregEncounterSteelePreg);
			if (pregScene == 3 || pregScene == 5) encounters.push(boredJumperPregEncounterBothPreg);
		}
		if (breedwellPremiumBootyCallCheck("zheng shi"))
		{
			encounters.push(breedwellPremiumBootyCallPing);
			encounters.push(breedwellPremiumBootyCallPing);
		}
	}
	if(encounters.length > 0) 
	{
		return encounters[rand(encounters.length)]();
	}
	return false;
}

public function zhengFoundryF2EncounterBonus():Boolean
{
	IncrementFlag("ZS_FOUNDRY_STEP");
	var encounters:Array = [];
	//First 3 times are gimmes, then increasing odds till step 15 or so.
	if(flags["ZS_FOUNDRY_STEP"] - 8 > rand((isLoreleisBitchVisibly() ? 20 : 16)))
	{
		flags["ZS_FOUNDRY_STEP"] = 0;
		IncrementFlag("ZS_FOUNDRY_ENCOUNTERS");

		//encounters.push(forgehoundEncounter);
		encounters.push(encounterPunkSecOp);
		encounters.push(encounterPunkSecOp);
		encounters.push(encounterPunkSecOp);
		encounters.push(encounterPunkSecOp);
		encounters.push(encounterPunkSecOp);
		encounters.push(encounterPunkSecOp);
		encounters.push(encounterPunkSecOp);
		encounters.push(encounterPunkSecOp);
		encounters.push(coronaFlamerEncounter);
		encounters.push(coronaFlamerEncounter);
		encounters.push(coronaFlamerEncounter);
		encounters.push(coronaFlamerEncounter);
		encounters.push(coronaFlamerEncounter);
		encounters.push(coronaFlamerEncounter);
		encounters.push(coronaFlamerEncounter);
		encounters.push(coronaFlamerEncounter);
		/*encounters.push(boredJumperAttackProc);
		encounters.push(boredJumperAttackProc);*/
		if (ratsAvailable())
		{
			//encounters.push(ratsInTheMineEncounter);
			encounters.push(ratsInTheMineEncounter);
			encounters.push(ratsInTheMineEncounter);
			encounters.push(ratsInTheMineEncounter);
			encounters.push(ratsInTheMineEncounter);
		}
		if (rollForLorelei())
		{
			encounters.push(loreleiRandomEncounter);
			encounters.push(loreleiRandomEncounter);
			encounters.push(loreleiRandomEncounter);
			encounters.push(loreleiRandomEncounter);
		}
		var pregScene:int = boredJumperPregScene();
		if (flags["BJUMPER_BIRTH_SCENE"] == 1)
		{
			encounters.push(boredJumperPregEncounterJumperPregBirth);
		}
		else if (pregScene > 0)
		{
			if (pregScene == 1 || pregScene == 4 || pregScene == 5) encounters.push(boredJumperPregEncounterJumperPreg);
			if (pregScene == 2 || pregScene == 4 || pregScene == 5) encounters.push(boredJumperPregEncounterSteelePreg);
			if (pregScene == 3 || pregScene == 5) encounters.push(boredJumperPregEncounterBothPreg);
		}
	}
	if(encounters.length > 0) 
	{
		return encounters[rand(encounters.length)]();
	}
	return false;
}

public function takeFedoraYooo():Boolean
{
	if(flags["TOOK_FEDORA"] == undefined) output(" A dusty fedora rests on the desk next to it, put down and never picked back up. This guy really needs to get his shit together.");
	if(zhengFoundryF1EncounterBonus()) return true;
	if(flags["TOOK_FEDORA"] == undefined) addButton(0,"Take Fedora",takeTheFedora);
	output(" The software development center stretches north and west.");
	return false;
}
public function takeTheFedora():void
{
	clearOutput();
	showName("A\nFEDORA!");
	quickLoot(new Fedora());
	flags["TOOK_FEDORA"] = 1;
}

public function zsmw8Bonus():Boolean
{
	if(flags["MAIKE_SLAVES_RELEASED"] != 1 && flags["MAIKE_SLAVES_RELEASED"] != 2) output("Slaves chip away at the bountiful wealth of Zheng Shi, held in place by chains hooked to collars and waists alike. Robotic loaders follow behind them to gather the samples they deposit and whisk them away to be refined. They spare no time to look at you or react in any way, leaving you with the distinct impression that they’re completely broken. You could cut them out of their collars, and they’d probably just keep digging...");
	else output("Robotic miners chip away at the bountiful wealth of Zheng Shi, striding over dozens of discarded tools and empty slave collars. They spare no time to react to your presence. These ‘bots are utterly fixated on the simple task of extracting minerals.");
	output(" Exposed gems with promise to the west, while a red-tinted tunnel worms south through the station.");
	return zhengMinesEncounterBonus();
}
public function zsmyy18AirlockBonus():Boolean
{
	//Haven’t found replacement helmet:
	if(flags["ZHENG_SPACESUIT_TAKEN"] == undefined)
	{
		output("\n\nThere’s a bulky black space suit next to you, the only one hanging up on the racks. Somebody’s stenciled in a white skull and crossbones on the shoulders, and a smiley face smoking a cigar on the chest.");
		if(!pc.hasItemByClass(SpacesuitHelmet)) output(" Unfortunately for you, the helmet hanging on the peg next to the space suit has a great big hole smashed through the glass bubble. Looks like somebody had a headbutt contest with a rocket hammer and lost.");
		else output(" You’ve got a replacement helmet for the broken one hanging on the peg; nothing would stop you from combining the two and taking a walk in the black, were you so inclined.");
		addButton(0,"Take Suit",takeZhengShiSpacesuit);
		return false;
	}
	else output("\n\nThe racks for storing spacesuits are empty... and have been ever since you grabbed the last one.");
	
	if(flags["ZHENG_SPACEWALKED"] == undefined && flags["ZHENG_SHI_SLAVE_SNUCK"] == undefined)
	{
		if(pc.hasAirtightSuit() && !(pc.armor is SpacesuitComplete)) 
		{
			output("\n\nWhile your current choice of armor is airtight, without magnetic boots or thrusters, you’ll be helpless in the void.");
			addDisabledButton(0,"Spacewalk","Spacewalk","Bad idea.");
		}
		else if(pc.armor is SpacesuitComplete) 
		{
			output("\n\n<b>You’re all ready to go for a spacewalk!</b>");
			addButton(0,"Spacewalk",spacewalkGoooo,undefined,"Spacewalk","Take a walk on the surface of the asteroid.");
		}
		else
		{	
			addDisabledButton(0,"Spacewalk","Spacewalk","Stepping into space without protection is a one-way ticket to a real quick death. You aren’t feeling particularly suicidal today.");
		}
	}
	else 
	{
		if(flags["ZHENG_SHI_SLAVE_SNUCK"] != undefined) output(" <b>With the elevator getting power again, you have no need to perform a repair out in the void.</b>");
		else output(" <b>Good thing you’ve already repaired the power outside.</b>");
		if(pc.hasAirtightSuit() && !(pc.armor is SpacesuitComplete)) 
		{
			output(" While your current choice of armor is airtight, without magnetic boots or thrusters, you’ll be helpless in the void.");
			addDisabledButton(0,"Spacewalk","Spacewalk","Bad idea.");
		}
		else if(pc.armor is SpacesuitComplete) 
		{
			output(" You could walk around the outside of the station to get back to the hangar without enemy interference....");
			addButton(0,"Spacewalk",fastSpacewalkToHangar,undefined,"Spacewalk","Take a jaunt in the vacuum back to the hangar.");
		}
		else
		{	
			addDisabledButton(0,"Spacewalk","Spacewalk","Stepping into space without protection is a one-way ticket to a real quick death. You aren’t feeling particularly suicidal today.");
		}
	}
	return false;
}

public function fastSpacewalkToHangar():void
{
	clearOutput();
	showName("\nSPAAAAACE!");
	output("Walking along the outside of Zheng Shi is beautiful but slow. Fortunately, there’s nobody around to bother a lone astronaut going for a stroll. Ships float by, loaded with illicit cargo and inattentive crews. You may as well not exist.\n\nThere’s the hangar! And you have plenty of oxygen to spare.");
	processTime(30);
	currentLocation = "ZS L50";
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function fastSpacewalkToAirlock():void
{
	clearOutput();
	showName("\nSPAAAAAACE");
	output("The trip back into the raw void should be fraught with peril... but it’s safer than bumbling around in the mines. You walk carefully for what feels like a half hour until you reach the airlock door. The trip barely put a dent in your oxygen reserves!");
	processTime(30);
	currentLocation = "ZSM YY18";
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


public function zsms14Bonus():Boolean
{
	output("Stepping around a support column, you’re confronted by a serious mining effort. ");
	if(flags["MAIKE_SLAVES_RELEASED"] != 1 && flags["MAIKE_SLAVES_RELEASED"] != 2) output("Dozens of slaves in plain jumpsuits and metallic obedience collars work at the walls with sweat-soaked determination while");
	else output("Dozens of crude robots, hastily assembled to replace the rebelling slave workers, toil endlessly at the walls while");
	output(" a bigger, rumbling device bores straight into the eastern wall, spraying fist-sized chunks of stone of ore into a cart tethered behind. The reddish stone must be rich in geddanium - a material prized for both jewelry and the alloys used for starship armor.");
	return zhengMinesEncounterBonus();
}

public function tIntersectionSlaveFunProcChance():Boolean
{
	return slavePretenderooo();
}

public function slavePensBonus():Boolean
{
	//Hasn’t freed slaves:
	if(flags["MAIKE_SLAVES_RELEASED"] != 2) 
	{
		output("\n\nIndeed, you can see several dozen shadowy figures shuffling around inside, trying to avoid your sight.");
		output("\n\nYou can’t get inside thanks to a massive metal bar running across the door. It’s electronically locked and hardened against hacking; you can’t even see a seam or a plug to abuse. You’ll have to find the right keycard for this one.");
		if(pc.hasKeyItem("Maike’s Keycard") || pc.hasItemByClass(MaikesKeycard)) addButton(0,"Free Slaves",unlockTheSlavePen,undefined,"Free Slaves","Throw open the doors and let loose the men and women held captive by the pirates. Cry havoc, and let loose the slaves of... a giant rebellion!");
		else addDisabledButton(0,"Free Slaves","Free Slaves","You don’t have any way to get the door open right now.");
	}
	else
	{
		output("\n\nThe door is hanging open, almost ripped off its hinges in the stampede of freed slaves. There’s nothing here for you anymore.");
	}
	return false;
}

public function miningRobotAttack():Boolean
{
	showName("MINING\n‘BOT");
	showBust("MINING_ROBOT");
	output("\n\nAs you wander through the byzantine sprawl of mine tunnels, you hear a thunderous <i>stomp... stomp... stomp...</i> coming towards you from one of the side passages. You turn to face it, just in time to see a lumbering black mass of metal, cables, and flickering digital readouts. A robot, shoddily built and probably a thousand years out of date besides... but it’s got a massive drill in place of one of its arms, and you can see where several lasers have been bolted onto the droid’s head and shoulders.");
	IncrementFlag("MINING_ROBOT_ENCOUNTERS");
	//player has RFID card
	if(pc.hasKeyItem("Zheng Shi RFID Badge")) output("\n\nThe droid passes you by, however, stomping away towards a deposit it’s allowed to mine.");
	//else:
	else 
	{
		output("\n\nThe robot’s square head cranks towards you, flashing a scanner that beeps menacingly as it passes over you. A deep, bass-heavy voice booms through the tunnel: <i>“New source of minerals detected! Beginning excavation process!”</i>");
		
		output("\n\nUh oh...");

		CombatManager.newGroundCombat();
		CombatManager.setFriendlyActors(pc);
		CombatManager.setHostileActors(new MiningRobot());
		CombatManager.victoryScene(defeatAMiningRobot);
		CombatManager.lossScene(loseToAMiningRobot);
		CombatManager.displayLocation("M.ROBOT");
		
		clearMenu();
		addButton(0,"Next",CombatManager.beginCombat);
		return true;
	}
	return false;
}

public function defeatAMiningRobot():void
{
	clearOutput();
	showName("\nVICTORY!");
	showBust("MINING_ROBOT");
	output("The robot shudders, stumbles backwards, and with a shrieking howl, collapses on its back and starts flailing its legs like a capsized turtle. As it goes down, a compartment on its chest bursts open and spews a handful of small gemstones across the ground.");
	if(silly) output(" It’s like a big metal piñata!");
	//PC gets a random gemstone stack.
	output("\n\n");
	CombatManager.genericVictory();
}

public function loseToAMiningRobot():void
{
	clearOutput();
	showName("\nDEFEAT!");
	showBust("MINING_ROBOT");
	//if PC has no gemstones or goo core.
	var hasGems:Number = 0;
	var purgeSlots:Array = [];
	var i:int = 0;
	for(i = 0; i < pc.inventory.length; i++)
	{
		if(pc.inventory[i].type == GLOBAL.GEM && !pc.inventory[i].hasFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE))
		{
			hasGems++;
			purgeSlots.push(i);
		}
	}
	if(hasGems == 0 && 9999 == 9999)
	{
		CombatManager.abortCombat();
		
		output("The droid stomps forward, bashing you in the face before rearing back with its mighty drill arm.");
		output("\n\nThe last thing you ever see is the tip whirring, spinning up.");
		badEnd();
		return;
	}
	//PC has 1+ gemstone on them.
	if(hasGems > 0)
	{
		output("The droid backhands you, sending you sprawling back on your ass. Rather than immediately driving its drill into your guts to harvest you, the droid stomps forward and activates its scanners again. A wave of light passes over you, stem to stern, before the robot’s great big hand reaches down and grabs your pack. It brusquely rips your pack open and reaches in, yanking out the gemstone");
		if(hasGems > 1) output("s");
		output(" inside and lifting them up to be analyzed.");
		output("\n\n<i>“Valuable minerals detected. Efficiency protocols activated.”</i>");
		output("\n\nThe robot dumps your gems into a cabinet in its chest and turns, stomping off down another tunnel.");
		output("\n\nGood thing you had something to distract it, you guess...");
		
		while(purgeSlots.length > 0)
		{
			pc.inventory.splice(purgeSlots[purgeSlots.length-1],1);
			purgeSlots.splice(purgeSlots.length-1,1);
		}
	}
	//PC has a goo core equipped:
	else
	{
		output("You quiver with the impact of the droid’s last punch, splattering yourself against the nearby wall. The droid advances, drill whirring, until its scanner fixates on your [pc.chest]. You stare doe-eyed up at the monumental mountain of metal while it bathes you with a wave of searching light. It seems to find something it likes, because the drill powers down, and its more humanoid hand reaches down to you. You try and squirm away, but the bastard’s backed you up into a corner, and soon its hand is sinking into your chest, pushing into your gooey body and wrapping its metal fingers around your core!");
		output("\n\n<i>“No!”</i> you yelp, flailing helplessly as the robot yanks on your core. There’s a pulling sensation deep inside, like he’s grabbing at your formerly-fleshy heart, and then it’s out! You watch in horror as the droid rips your core out and chucks it into a cabinet in its chest - and as it does so, you can almost immediately feel your mind becoming hazy, your thoughts getting... hungrier!");
		output("\n\nToo bad this big guy doesn’t have a dick you can suck while he takes your pretty core stone.");
		output("\n\nThe robot stalks off, leaving you to recongeal yourself and try to find your gear.");
	}
	output("\n\n");
	CombatManager.genericLoss();
}

public function maikesOfficeBonus():Boolean
{
	if(flags["MAIKE_QUARTERS_UNLOCKED"] == undefined)
	{
		clearOutput();
		showName("\nLOCKED...");
		currentLocation = rooms[currentLocation].westExit;
		generateMap();
		//Maike’s door has a lock puzzle the PC must bypass to enter, or have her access card.
		output("You try to open the door to Overseer Maike’s quarters, but find the door locked down tight. There’s a security lock in place next to it with a card reader in place. Looks like the Overseer values her privacy.");
		
		clearMenu();
		//[Use Card] [Bypass]
		if(pc.hasKeyItem("Maike’s Keycard") || pc.hasItemByClass(MaikesKeycard)) addButton(0,"Use Card",useMaikesCard,undefined,"Use Card","You already have the overseer’s access card. Go ahead and use it.");
		else addDisabledButton(0,"Use Card","Use Card","You’d need the overseer’s card for that!");
		addButton(1,"Bypass",bypassMaikesRoomieroomHackerman,undefined,"Bypass","Embrace your inner Hackerman.");
		addButton(14,"Leave",mainGameMenu);
		return true;
	}
	//Hasn’t freed slaves:
	if(flags["MAIKE_SLAVES_RELEASED"] == undefined)
	{
		if(flags["MET_TIVF"] == undefined)
		{
			tivfGreeting();
			return true;
		}
		output("\n\nTivf is lounging on the bed, and perks up at your approach.");
		//[Tivf]
		//Go talk to the zil boy slave.
		//Slaves must not have been freed.
		addButton(0,"Tivf",repeatTivfApproach,undefined,"Tivf","Go talk to the zil boy slave.");
	}
	addButton(9,"Sleep",maikeRestOverride);
	return false;
}

public function useMaikesCard():void
{
	clearOutput();
	showName("\nCLICK!");
	output("You slide Maike’s card through the reader, and are rewarded with a high-pitched beep and a flashing green light. It’s open!");
	flags["MAIKE_QUARTERS_UNLOCKED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Bypass]
public function bypassMaikesRoomieroomHackerman():void
{
	clearOutput();
	showName("\nHACKING!");
	output("Well, you should be able to take care of this no problem. You wrench off the protective plastic casing and start dicking with the wiring inside...");
	//Insert KaraQuest-style connect-the-node puzzle. TechSpecs get an easier version.
	clearMenu();
	addButton(0,"Next",startUpMaikeHackerman);

}

public function startUpMaikeHackerman():void
{
	userInterface.showMinigame();
	var gm:RotateMinigameModule = userInterface.getMinigameModule();
	
	var g:uint = RGMK.NODE_GOAL;
	var i:uint = RGMK.NODE_INTERACT;
	var l:uint = RGMK.NODE_LOCKED;
	
	var n:uint = RGMK.CON_NORTH;
	var e:uint = RGMK.CON_EAST;
	var s:uint = RGMK.CON_SOUTH;
	var w:uint = RGMK.CON_WEST;
	
	//Baby difficulty
	/*
	if(pc.characterClass == GLOBAL.CLASS_ENGINEER)
	{
		gm.setPuzzleState(azraQuestHackerDoor, 3, 3,
		[
			g | s    ,	i | w | n,	i | n | w,
			i | e | w,	i | w | e,	g | n    ,
			i | s | w,	i | s | e,	i | s | n
		]);
	}*/
	/*Commented out for Gedan to look at it.
	else if(pc.isBimbo() || pc.IQ() <= 30)
	{
		gm.setPuzzleState(azraQuestHackerDoor, 6, 6,
		[
			l        ,	i | n | e,	i | e | w,	i | s | w,	i | n | w,	l        ,
			i | n | w,	i | w | n,	i | n | s,	i | n | w,	i | e | s,	i | e | w,
			i | s | n,	i | e | w,	i | n | s,	i | n | s,	l | n | s,	i | w | s,
			i | e | n,	l | n | w,	i | w | s,	i | e | w,	i | n | e,	i | w | n,
			i | w | e,	l        ,	i | e | w,	i | s | w,	i | s | e,	i | w | s,
			g | n | e,	i | n | s,	i | n | s,	i | e | s,	i | w | n,	g | s    ,
		]);
	}*/
	gm.setPuzzleState(hackingMaikeDoorSuccess, 5, 5,
	[
		g | e | s,	i | n | s,	i | n | e,	i | s | e,	i | n | w,
		i | n | s,	l        ,	i | w | e,	i | w | e,	i | w | e,
		i | w | s,	i | s | w,	l | n | e,	i | e | w,	i | n | e,
		i | n | w,	l | e | s,	i | n | w,	i | s | w,	i | n | s,
		i | n | w,	g | e    ,	i | n | s,	i | w | e,	i | n | e,
	]);
}

/*
public function hackingFailure():void
{
	clearOutput();
	showName("\nFAILURE");
	//On fail, play:
	output("Shit! You stumble back as sparks fly from a miss-crossed wire. You’ll have to give that another try.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}*/

//On success, play:
public function hackingMaikeDoorSuccess():void
{
	clearOutput();
	showName("\nSUCCESS");
	output("A little finesse, a little skill, and a little determination is all it takes to slice through the security box and unlock the Overseer’s door. After a few minutes’ work, the lock beeps and flashes green: you’re in!");
	flags["MAIKE_QUARTERS_UNLOCKED"] = 2;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function urbolgsOffice():void
{
	vendingMachineButton(0,"energy");
	output(" You’re surprised it doesn’t have a combination as well.");
	//Appended to Urbolg’s room description.
	if(flags["GOT_URBOLGS_SHIELD"] == 0) 
	{
		output("\n\nThe brown safe Urbolg mentioned is in fact under his desk. If you remember correctly, the combination is 7-8-9. You could pop it open, if you wanted to.");
		addButton(1,"Open Safe",collectUrbolgsSafe);
	}
	else if(flags["GOT_URBOLGS_SHIELD"] == 1) output("\n\nUrbolg’s brown safe is open and empty, like you left it. How nice of him to let you use his extra shield belt!");
}

//Making Landfall at Zheng Shi
public function landingAtZhengShi():void 
{
	clearOutput();
	showName("ZHENG\nSHI");
	author("Savin");
	//Presumably [Zheng Shi] gets added to your address menu right when you get Probe 4. Play the first time the PC selects that destination.
	//First Time Variant
	if(flags["ZHENG_SHI_PASSWORDED"] == undefined)
	{
		output("You punch the coordinates you got from Dad’s last probe into the local Warp Gate. In short order, your ship is hurtling through the stars, one step closer to your inheritance. The moment the ship pops out of the far gate, though, all thoughts of a cushiony life of leisure are swept away in an instant: you’re assaulted by a cacophony of warning lights and klaxons from every sensor on the ship. The forward viewscreen is dominated by huge, tumbling chunks of rock careening towards you at deadly speeds.");
		output("\n\nLuckily your shields come up, deflecting the worst of the impacts, but the ship’s deck still rattles under your [pc.feet]. You grip the arm rests of your captain’s seat tight, trying to keep from being thrown across the bridge with the rapid impacts. Eventually, the meteor storm subsides, leaving you floating in space with your shields barely holding up and several breakers flipped all throughout the ship. But you’re alive, so there’s that.");
		output("\n\nWith the immediate catastrophe dealt with, you send out a scanner ping to try and figure out where the hell you are - and where you’re supposed to go. According to the coordinates you received, the Warp Gate should have been orbiting your destination, but all you see are the tumbling brown hulks of shattered...");
		output("\n\n...hey, that asteroid has a building on it!");
		output("\n\nYou squint out the forward screen, commanding it to zoom in as far as possible on a meandering chunk of earth about the size of Australia. That definitely is what’s left of a city, blasted and airless. Guess this <i>was</i> the planet you were sent to explore, but it clearly had an accident between the Warp Gates being launched and the Rush starting. There’s nothing left but debris.");
		output("\n\nShit. Now what?");
		output("\n\nThe probe’s gotta be in the field somewhere.");
		output("\n\nThe probes you’ve seen so far are rated to survive just about anything, hardened against impact and electronic tampering alike. No matter what happened to the planet, you’re pretty sure your objective remains the same - unless it drifted off into the binary stars flickering in the distance, anyway. Time to run some scans; try and find what happened to it...");
		//[Next]
		//Recharge PC HP to max; reduce lust to minimum.
		sleepHeal();
		pc.lust(-100);
		clearMenu();
		addButton(0,"Next",firstTimeZhengApproach);
	}
	//Repeat Approach, Fled Last Time
	else if(flags["ZHENG_SHI_PASSWORDED"] == -1)
	{
		output("Alright, maybe this time will go smoother. You take yourself back towards that shattered world the pirate outpost uses to shield itself from prying eyes. It’s easy enough to find it again now that you know what you’re looking for, and in short order you’re cruising towards the heavily-armed docking bay.");
		output("\n\nA bored voice comes over the short-wave radio once again: <i>“This is Zhèng Shi Docking to... whoever the fuck you are. This ship’s not on the roster. Cough up the password or get blown to space dust.”</i>");
		output("\n\nLooks like whoever’s on the other end doesn’t remember you, at least...");
		//Player is given a text box. Buttons are [Submit] and [Flee]
		//Flee loop repeats until PC gets the password
		displayInput();
		userInterface.textInput.text = "Password";
		userInterface.textInput.maxChars = 40;
		output("\n\n\n");
		zhengApproachPasswordOptions();
	}
	//Repeat Approach, Post Correct Answer
	else
	{
		if((shits["SHIP"] is Sidewinder) && pirateResearchVesselStolen() && flags["TEYAAL_SHIPFITES"] != 3)
		{
			currentLocation = "SHIP INTERIOR";
			generateMap();
			zhengShiReturnDoof();
			return;
		}
		output("You set course for the pirate base at Zhèng Shi. Now that you know where it is, and have solidified your right to be there as far as its gate guards are concerned, it’s easy going. The heavy cannons surrounding the docking bay entrance follow you in, but hold their fire while your slide your ship in through the force field and into your parking spot at the back of the massive hangar. Looks like you’re on the roster now!");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

public function firstTimeZhengApproach():void
{
	clearOutput();
	showName("ZHENG\nSHI");
	author("Savin");
	processTime(5*60);
	output("<b>Several hours later...</b>");
	output("\n\nYou’re snapped to wakefulness by a rhythmic beeping from your ship’s sensor suite. You don’t remember having fallen asleep, only the passage of hours waiting for your sensors to fully scan an entire solar system.");
	output("\n\nThey haven’t found the probe, but as you wipe the sleep from your eyes, you see that your sensors have locked onto a ship puttering through the debris field on impulse power. She’s a big girl, too, practically bursting at the seams with hemispherical laser batteries and grappling cannons. She’s not flying any colors and her ID’s not pinging any databases you can access, so if you had to take a wild guess, you’d say she’s a pirate ship.");
	output("\n\nAnd she’s making good speed somewhere. Curious, you ease yourself into the field after her, taking it nice and slow to avoid detection. ");
	if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("It’s no sweat for you, given you previous occupation. You know all the tricks a ship like this might use to cover her tracks; following her is child’s play.");
	else if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output("You monitor the sensors closely, refusing to let any amount of interference from the massive debris field around you distract you from your quarry.");
	else output("You’ve flown more dangerous combat missions than this. It’s easy to pretend the asteroids are big, slow missiles, and you dodge and weave between then while staying just out of view.");

	output("\n\nAfter about an hour, the ship seems confident it isn’t being followed and takes a sharp turn towards one of the largest asteroids - indeed, <i>the</i> largest - in the field. You follow from a safe distance, watching the ship approach a structure you instantly recognize: a spacedock! The same kind as back on Tavros, with a huge metal opening, wide enough for a cruiser to slip through, projecting a permeable force field to keep the air in.");
	output("\n\nAnd it’s not the only ship.");
	output("\n\nIndeed, several other ships are coming and going from the hidden port, all of different models but armed and painted in gregarious colors that suggest more pirates than you’ve ever seen gathered in one place before. <b>This must be some kind of pirate base!</b>");
	output("\n\nWell shit, that makes finding your probe in this system a lot more challenging. Especially if it’s ended up in the pirates’ possession... and considering how many credi-hungry opportunists appear to be using this chunk of crust as a port of call, you wouldn’t be surprised. You wait until the ship’s gone in before easing forward again, trying to come up with a plan...");
	processTime(20);
	clearMenu();
	addButton(0,"Next",firstTimeZhengApproachIII);
}

public function firstTimeZhengApproachIII():void
{
	clearOutput();
	showName("ZHENG\nSHI");
	author("Savin");
	output("There are so many ships, each more ostentatious than the last. There’s no way they all belong to the same pirate group. Not the Black Void, certainly. No, the longer you watch, the more you become convinced that this is some kind of gathering place for underworld scum. ");
	if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output(" At last, you’ve found your people!");
	output(" Indeed, now that you’ve found the base, your cursory scans show that there’s quite a vast complex in there, and you can visually identify some exterior structures on the asteroid’s surface, all nice and powered but without any obvious means of ingress for your ship.");
	output("\n\nThe only way you’re getting in is, well... the front door.");
	output("\n\nAlright, time to put that Steele charm to work. You strap in, divert all power to the shields, and begin your approach.");
	output("\n\nWhat could go wrong?");
	processTime(10);
	clearMenu();
	addButton(0,"Next",firstTimeZhengApproachIV);
}

public function firstTimeZhengApproachIV():void
{
	clearOutput();
	showName("ZHENG\nSHI");
	author("Savin");
	output("As you approach the docking bay, a direct-beam transmission comes across your communications display. That’s <i>old</i> tech, no use of standard quantum entanglement: just straight radio waves directed at your antennae. You furrow your brow and go down into your ship’s emergency S.O.S. beacon, pulling out the old-style handheld from its cradle. Something buzzes and crackles, and then you hear a voice come across:");
	output("\n\n<i>“This is Zhèng Shi Docking to... whoever the fuck you are. This ship’s not on the roster. Cough up the password or you’re gonna get blown to space dust.”</i>");
	output("\n\nWell, you knew this wasn’t going to be easy....");

	//Player is given a text box. Buttons are [Submit] and [Flee]
	//[Fuck This (hinted to start combat but actually gets you in)], [Call Kiro (Turns out she’s been there and knows the password)]
	displayInput();
	userInterface.textInput.text = "Password";
	userInterface.textInput.maxChars = 40;
	output("\n\n\n");

	processTime(2);
	zhengApproachPasswordOptions();
}

public function zhengApproachPasswordOptions():void
{
	clearMenu();
	addButton(0,"Submit",submitThePiratePassword);
	if(metKiro() && roamingKiroAvailable()) addButton(1,"Call Kiro",callAKiroFriend);
	else addDisabledButton(1,"Locked","Locked","You haven’t met a character you could call in a favor from...");
	if(paigeIsCrew()) addButton(2,"Call Paige",callAPaigeFriend);
	else addDisabledButton(2,"Locked","Locked","You need a specific character on your crew for this.");
	addButton(14,"Run!",fuckThisShit);
}

public function callAPaigeFriend():void
{
	if(stage.contains(userInterface.textInput)) removeInput();
	clearOutput();
	showPaige();
	author("B");
	output("You stretch out and slap the main breaker, listening to the headset and nearly everything else go dead as you feign a power failure. Hopefully that’ll buy you a few seconds to phone a friend...");
	output("\n\nUsing your systems emergency power, you dial into your ship’s intercom. <i>“Paige to the bridge,”</i> you say, <i>“and quickly.”</i>");
	output("\n\nSeconds later, you hear the hurried tap-tap of Paige’s footsteps approaching the bridge of your ship. She bursts into the room, out of breath from rushing as quickly as she could. <i>“Yes, captain?”</i> she asks.");
	output("\n\nYou direct her to the asteroid base in front of your ship, and you tell her that it’s apparently a pirate base. You want to dock, but the harbormaster that responded to your hail asked you for a password. You figured, since Paige was a pirate at one point, maybe she knows what it is?");
	output("\n\nPaige straightens her back and starts to laugh at the question. <i>“That’s easy. Do you still have them on call?”</i> You tell her that you do, as soon as you flip the breaker back on. <i>“Do it. I’ll handle it, sweet thing.”</i>");
	output("\n\nYou do as she asks, as she steps up to the communicator’s receiver. A few button presses later, power hums back through your ship, and the crackling communication channel snaps back open. <i>“Can you hear me, asshole? Pony up with the password or join the debris field. Your call.”</i>");
	output("\n\nPaige wets her lips before responding.");
	output("\n\n<i>“Hey, go fuck yourself, dipshit!”</i> she hollers into the receiver. <i>“The fuck is this, about some ‘password’ horseshit? We got business on the base, so lower your fucking weapons before </i>I<i> tell </i>you<i> what your </i>safeword<i> is!”</i>");
	output("\n\n<i>“Alright, jeez!”</i> the station controller’s voice says. <i>“Guns are down. We’ll see how long that attitude keeps up, fresh meat.”</i>");
	output("\n\nTrue to the harbormaster’s word, the target locks from the asteroid release, and you’re free to bring your ship into the bay unmolested.");
	output("\n\n<i>“That’s the secret, [pc.name],”</i> Paige says as she turns toward the door of the bridge. <i>“Don’t let them push you around. There’s no law or decorum in Zheng Shi; as soon as you show them any weakness, they’ll make you their bitch, so if you enjoy being your own " + pc.mf("","wo") + "man, you need to push as hard as they shove.”</i>");
	output("\n\nYou thank Paige for her advice and dismiss her from the bridge as you pass through the force field and into a sweeping hangar bay, big enough for twenty or so large ships - and countless little tramp freighters and scout ships like the old Z14.");
	output("\n\nNobody’s paying you much mind now that you’re docked. Indeed, you manage to find a relatively isolated spot at the back of the hangar to land. The ship settles with a resounding thud, and you make your way to the airlock. Time to see where your probe’s gotten off to... assuming it’s really here.");
	flags["ZHENG_SHI_PASSWORDED"] = 1;
	flags["PAIGE_HELPED_ZHENG"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Call Kiro
//What good is having a pirate friend if you can’t call in a favor?
//Fenwrote dis
public function callAKiroFriend():void
{
	if(stage.contains(userInterface.textInput)) removeInput();
	clearOutput();
	showKiro();
	output("You stretch out and slap the main breaker, listening to the headset and nearly everything else go dead as you feign a power failure. Hopefully that’ll buy you a few seconds to phone a friend...");
	output("\n\nThe Codex’s warm light bathes the inside of your now-dark cockpit in its familiar glow as you tap into the system’s surviving comm buoy and make a high-priority holocall to your big-balled ");
	if(flags["KIRO_BF_TALK"] == 1) output("girlfriend");
	else output("tanuki-buddy");
	output(".");
	output("\n\n<i>“Heya, Angel,”</i> Kiro drunkenly slurs. Her holographic image wobbles unsteadily. Judging by the background noise, she’s deep into her drinks in some scummy space bar. <i>“Usually I’m one the one in charge of makin’ booty calls! You wanna hook up?”</i> She props her head up on her arm and licks her lips.");
	//Bimbo
	if(pc.isBimbo()) output("\n\nOoooh, you so like, totally do, but maybe after you land your ship. <i>“Ummm, actually Kiro I’m at some pirate base, and they want a password or something. I think they might like, blow me up if I don’t give the right one! Ugh. Anyways, it’s called Zheng Shi. You ever been there?”</i>");
	//Bro
	else if(pc.isBro()) output("\n\n<i>“Bitch, please!”</i> You sigh. <i>“You know Zheng Shi? They want a password that I don’t have.”</i>");
	//Nice
	else if(pc.isNice()) output("\n\n<i>“Maybe later,”</i> you answer with a shake of your head, <i>“I’m at a pirate base that goes by the name of Zheng Shi. Ever been there? I could really use the password.”</i>");
	//Misch
	else if(pc.isMischievous()) output("\n\n<i>“Assuming the pirates at Zheng Shi don’t paste me in space-dust, I might look into it.”</i> You say, <i>“I’m in a tight spot here, and if I don’t get them the right password in a minute or two, this is going to be a real short Rush for me.”</i>");
	//Hard
	else output("\n\n<i>“Focus up, Kiro.”</i> You slam your fist into the console. <i>“These pirate assholes at Zheng Shi want a password, and if I don’t guess the right one, I’m going to have to fight my way in. I’d rather not kill any of your friends.”</i>");
	//Merge
	output("\n\nKiro facepalms and airily giggles, <i>“Fuck you!”</i>");
	output("\n\nWha-?");
	output("\n\n<i>“No, no, no! The password. Just tell ‘em to go fuck themselves.”</i> She takes a swig of a mystery drink that doesn’t quite render in. <i>“That’s the thing about us pirates - the only thing we hate more than being ordered around is dealing with red tape and regulation. Fuck, you’re so naive sometimes, Angel.”</i>");
	output("\n\nYou thank her for the help and end the call, watching Kiro’s smirking lips fade away into nothing.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",kiroHelpCallEpilogue);
}

public function kiroHelpCallEpilogue():void
{
	clearOutput();
	showName("ZHENG\nSHI");
	showBust("");
	flags["KIRO_HELPED_ZHENG"] = 1;
	output("A few button presses later, power hums back through your ship, and the crackling communication channel snaps back open. <i>“Can you hear me, asshole? Pony up with the password or join the debris field. Your call.”</i>");
	output("\n\nPirates: not the most patient bunch.");
	//Display normal password input options.
	displayInput();
	userInterface.textInput.text = "Fuck You";
	userInterface.textInput.maxChars = 40;
	addButton(0,"Submit",submitThePiratePassword);
	addButton(4,"Run!",fuckThisShit);
}

//Flee
//You don’t know the password! Fuck!
public function fuckThisShit():void
{
	clearOutput();
	showName("STEELE\nOUT!");
	author("Savin");
	if(stage.contains(userInterface.textInput)) removeInput();
	output("That’s a lot of target lock alerts you just got, and you have no idea what the password is, so...");
	output("\n\nSteele out!");
	output("\n\nYou reverse the throttle and book it back into the cover of the asteroid belt. The station takes a couple parting shots at you, but nothing gets through the shields before you’re covered by another half-moon of broken planet.");
	output("\n\nWell, now you need to find a pirate to coax the answer out of... one way or another.");
	flags["ZHENG_SHI_PASSWORDED"] = -1;
	processTime(5);
	clearMenu();
	addButton(0, "Next", flyToWrapper, "Tarkus");
}

public function submitThePiratePassword():void
{
	clearOutput();
	showName("ZHENG\nSHI");
	var pwordCheckString:String = userInterface.textInput.text.toLowerCase();
	var pwordOkay:Boolean = (pwordCheckString.indexOf("fuck") != -1 || pwordCheckString.indexOf("cock") != -1 || pwordCheckString.indexOf("cunt") != -1 || pwordCheckString.indexOf("screw you") != -1 || pwordCheckString.indexOf("bastard") != -1);
	if(stage.contains(userInterface.textInput)) removeInput();
	//Submit, Wrong Password
	if(!pwordOkay)
	{
		output("<i>“Yeah, nice try,”</i> the voice says over the radio, suddenly with a dangerous edge. <i>“Only gate you’re crashing is the afterlife’s!”</i>\n\nShips buzz out of Zheng Shi’s hangar like bees from a hive you just accidentally kicked... Shit.");
		//gib spess battle
		zhengSpaceBatturu();
	}
	//Submit, Answer: Fuck You
	else
	{
		output("<i>“Yeah, alright, alright,”</i> the station controller’s voice says over your short wave, followed by a surprisingly girlish laugh. <i>“You sure sound like a pirate. Guns are down... for now. Don’t make trouble, fresh meat.”</i>");
		output("\n\nThe target locks from the asteroid subside, and you’re able to bring your ship forward into the bay unmolested. You pass through the force field and into a sweeping hangar bay, big enough for twenty or so large ships - and countless little tramp freighters and scout ships like the old Z14.");
		output("\n\nNobody’s paying you much mind now that you’re docked. Indeed, you manage to find a relatively isolated spot at the back of the hangar to land. The ship settles with a resounding <i>thud</i>, and you make your way to the airlock. Time to see where your probe’s gotten off to... assuming it’s really here.");
		//To meeting dwarfgonne
		flags["ZHENG_SHI_PASSWORDED"] = 1;
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

public function zhengSpaceBatturu():void
{
	var pcShip:ShittyShip = shits["SHIP"];

	var tEnemy:ShittyShip = new Pyrotech();
	tEnemy.captainDisplay = "GASMASK";
	tEnemy.isUniqueInFight = false;
	var tEnemy2:ShittyShip = new Pyrotech();
	tEnemy2.captainDisplay = "BURNIE";
	tEnemy2.isUniqueInFight = false;
	var tEnemy3:ShittyShip = new MoondastGruss();
	tEnemy3.removePerk("PCs");
	tEnemy3.captainDisplay = "FERRUS";
	tEnemy3.factionDisplay = "C.PUNKS";
	tEnemy3.createPerk("AGGRESSIVE_AI");
	tEnemy3.meleeWeapon = new EMCannon();
	tEnemy3.rangedWeapon = new EmptySlot();
	tEnemy3.accessory = new EmptySlot();
	tEnemy3.createPerk("PIRATE_GUN");
	tEnemy3.short = "EM Turrets";
	tEnemy3.isPlural = true;
	tEnemy3.isUniqueInFight = true;
	tEnemy3.btnTargetText = "Turrets";
	tEnemy3.long = "Zheng Shi houses numerous EM turrets across its rocky surface, perfect for gunning down anybody who wanders too close. It’ll be hard to escape while they’re still online.";
	tEnemy3.HPMod = 1200;
	tEnemy3.physiqueRaw = 0;
	tEnemy3.reflexesRaw = 0;
	tEnemy3.willpowerRaw = 100;
	tEnemy3.inventory = [];
	

	CombatManager.newGroundCombat();
	
	CombatManager.setHostileActors(tEnemy,tEnemy2,tEnemy3);	
	CombatManager.setFriendlyActors(pcShip);
	//CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, tEnemy);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pcShip);
	CombatManager.victoryScene(winZhengSpaceBattle);
	CombatManager.lossScene(loseZhengSpaceBattle);
	CombatManager.displayLocation("PIRATES");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

public function loseZhengSpaceBattle():void
{
	clearOutput();
	showName("\nDEFEAT...");
	author("Fenoxo");
	output("While core system after core system fails, the bombardment continues. Simply disabling your ship isn’t enough for these pirates. Alarms blare as thunderous vibrations rattle through the deck beneath your [pc.legOrLegs]. You close your eyes, awaiting the inevitab-");
	badEnd(); 
}

public function winZhengSpaceBattle():void
{
	clearOutput();
	showName("\nVICTORY!");
	author("Fen & Savin");
	output("The comm crackles to life. <i>“Huh. I guess you got what it takes to hang in Zheng Shi after all. Here, since you freed up some hangar space down on Cargo Deck, I’ve allocated you a parking slot. To the victor go the spoils and all that rot. Oh, and for future reference, when pirates ask you for a password, you ask them to fuck off. Nobody uses passcodes but corp-sluts and peacekeeper corp-sluts.”</i> The girl on the other side of the line cuts it before you can reply.");
	output("\n\nThe target locks from the asteroid subside, and you’re able to bring your ship forward into the bay unmolested. You pass through the force field and into a sweeping hangar bay, big enough for twenty or so large ships - and countless little tramp freighters and scout ships like the old Z14.");
	output("\n\nNobody’s paying you much mind now that you’re docked. Indeed, you manage to find a relatively isolated spot at the back of the hangar to land. The ship settles with a resounding <i>thud</i>, and you make your way to the airlock. Time to see where your probe’s gotten off to... assuming it’s really here.");
	flags["ZHENG_SHI_PASSWORDED"] = 2;
	output("\n\n");
	CombatManager.genericVictory();
}

public function foundryLounge2Bonus():Boolean
{
	output("With a couch and plenty of nearby cushions, it’s clear that this quiet corner of the break room provides the pirate officers with a quiet place to rest, relax, and cuddle with their pleasure-slave of choice. A squat box with an onahole-like entrance lends further credence to that theory. The stained nameplate labels it as a TamaniCorp Hora Series 69 Dong Designer.");
	if(flags["USED_DONG_DESIGNER"] != undefined) output(" You know all too well about such devices. Maybe you could give it a spin?");
	else output(" A quick extranet search reveals that it does exactly what the name suggests. Just stick a penis inside, and the magic box will change it into any crazy alien dong your mind might dream up.");
	output("\n\nUnfortunately it’s bolted to the floor");
	if(flags["LOOTED_COCKBOX"] == 1 && flags["COCKBOX_UPGRADE"] == undefined) output(", but nothing’s stopping you from snagging a copy of the updated firmware to install on your own personal box. Custom pigmentation selection seems like quite the upgrade!");
	else output(".");
	
	addButton(0,"DongDesigner",useInstalledDickBox,undefined,"Dong Designer","Take a closer look a this dick-customizing box!");
	return false;
}

public function prefabDeadEndBonus():Boolean
{
	output("A square white wall stops this hallway dead in its eastward tracks. You’re free to walk through the sterile alabaster passage westward instead, or step through the unlocked door to the north. The placard labels it as the Robotics Lab.");
	if(flags["MINING_ROBOT_ENCOUNTERS"] != undefined) output(" This is probably where they put together those horrible mining robots you ran into down below.");
	else output(" This is probably where they put together all the different kit-bashed robots they have all over the station.");
	output(" Leave it to pirates to eschew the tried and true off-the-shelf models!");
	return zhengFoundryF1EncounterBonus();
}

public function zhengFoundryFloor2ElevatorBonus():Boolean
{

	if(flags["ZHENG_SHI_FOUNDRY_2F_OPEN"] == undefined) output("The cargo elevator’s door is closed. A piece of malformed of pipe jammed through the works will keep it that way, unless you bother to free it from its bondage and restore access to this hanging pathway.");
	else output("The cargo elevator’s door is wide-open thanks to you. Without the bent-up pipe holding it shut, you’re free to travel back up here without having scamper up a four story ladder.");
	output(" Boxes of parts and tools sit stacked neatly by the side in a pile, awaiting their chance to be loaded up and whisked away.");
	if(flags["ZHENG_SHI_FOUNDRY_2F_OPEN"] == undefined) 
	{
		output(" You suppose the pirates forgot about them.");
		flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
		addButton(0,"Pull Pipe",freePipeElevator);
	}
	else output(" You suppose they’ll be waiting here until Peacekeepers show up to drive everyone away.");
	return false;
}

public function freePipeElevator():void
{
	clearOutput();
	showName("\nYOINK!");
	output("With a " + (pc.PQ() >= 50 ? "mighty yank":"exhausting, straining pull") + ", you disloge the pipe and allow the elevator’s outer door to swing open. That’ll save you some time!");
	flags["ZHENG_SHI_FOUNDRY_2F_OPEN"] = 1;
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function zhengFoundryScaffoldElevatorBonus():void
{
	if(flags["ZHENG_SHI_FOUNDRY_2F_OPEN"] == undefined)
	{
		output(" The outer doors are stuck closed. You won’t be able to get off on this floor until you find a way to open them. Maybe there’s another way onto the scaffolding?");
		flags["NAV_DISABLED"] = NAV_WEST_DISABLE;
	}
}

public function forgeySpaceDooter():Boolean
{
	if(flags["FORGEHOUND_WREKT"] != undefined) return false;
	else return forgehoundEncounter();
}

//[Investigate]
public function investageDatMouseMechanicYo():void
{
	clearOutput();
	showName("\nMECHANIC");
	showBust("RODENIAN_MECHANIC");
	author("Fenoxo");
	if(flags["MAUS_THINKS_PIRATE"] == undefined) 
	{
		output("You circle around the disabled ‘bot with a wary step and a hand on your [pc.weapon], just in case.");
		output("\n\nThe slight figure that comes into view is explicitly, almost universally non-threatening. She’s a rodenian" + (!CodexManager.entryUnlocked("Rodenians") ? " (according to your Codex’s notification)":"") + " and barely over four feet tall - small for her race. Maybe if the grease stains were swapped for blood, she could look like some kind of petite berserker, but her armor consists of a breezy shirt and scuffed-up overalls. Her ‘weapons’ aren’t much better: a hand-sized plasma torch with a 1-inch flame and a purple-and-green painted toolbox.");
		if(!CodexManager.entryUnlocked("Rodenians")) CodexManager.unlockEntry("Rodenians");
		output("\n\nIt’s the mouse-girl’s mouth and nimble fingers that pose the real threat. She effortlessly strips wires and charred circuit boards while uttering a litany of slurs so sinful they could score her some jail time on a more civilized planet.");
		output("\n\nSo long as the rodenian’s not packing some secretive mil-spec cybernetics, you doubt you have much to fear from her. Do you get her attention?");
		processTime(2);
		clearMenu();
		addButton(0,"Greet",greetDatRodentMech);
		addButton(14,"Leave",mainGameMenu);
		//[Greet] [Leave] (Leave just dumps to mainGameMenu)
	}
	else
	{
		output("You approach the mouse-girl once more. This time, the rodenian looks up almost immediately. <i>“You again? Whaddya want?”</i>");
		rodentTalkTopics();
	}
}

//Greet
public function greetDatRodentMech():void
{
	clearOutput();
	showName("\nMECHANIC");
	showBust("RODENIAN_MECHANIC");
	author("Fenoxo");
	output("<i>“Hey!”</i> You wave at the swearing mouse-woman non-threateningly.");
	output("\n\nShe doesn’t look up. <i>“Whatever it is, I don’t have time for it. Why don’t you go hit some rocks or something and stop trying to bother the girl who’s just doing hers.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Not A Slave",ImNotASlaveLittleRat);
	addButton(1,"I’m A Pirate",ImAPirateLittleRat);
}

//I’m a Pirate
public function ImAPirateLittleRat():void
{
	clearOutput();
	showName("\nMECHANIC");
	showBust("RODENIAN_MECHANIC");
	author("Fenoxo");
	output("You tell her that you’re a pirate.");
	output("\n\nShe nearly hyperventilates laughing, her diaphragm spasming with the forcefulness of her squeaking delight. <i>“So’s my left tit, but you don’t hear me bandying it about like some kind of title. Everybody ‘round these parts calls themself a pirate. Even the dumbshit dog in the hangar down here.”</i> She snorts. <i>“Yeah, you’re a real big pirate, asshole. Keep sitting on your ass and polishing real pirates’ ships.”</i> A burnt-out servo slams into the ground next to your [pc.foot]. <i>“So, " + pc.mf("Mister","Miss") + " pirate, how are you going to waste my time today?”</i>");
	flags["MAUS_THINKS_PIRATE"] = 2;
	processTime(5);
	rodentTalkTopics();
}

//Not A Slave
public function ImNotASlaveLittleRat():void
{
	clearOutput();
	showName("\nMECHANIC");
	showBust("RODENIAN_MECHANIC");
	author("Fenoxo");
	output("You protest that you aren’t a slave.");
	output("\n\nShe shakes her head, dish-shaped ears wobbling. <i>“That’s where you’re wrong. Everyone’s a slave. They’re just one bad day away from accepting it.”</i> A half-melted servo nearly smacks into your skull from a careless toss. <i>“One fucked up night partying with the wrong people. One businessman thoughtlessly crossed. One bad decision to sample an experimental drug.”</i> Her weary laughter cuts deeper than her burning torch. <i>“Might as well just find yourself a decent master before you stumble into one of the bad ones.”</i>");
	output("\n\nYou ");
	if(pc.isNice()) output("politely decline to follow her advice.");
	else if(pc.isMischievous()) output("glibly suggest that you’re more interested in being a good master than anyone’s slave.");
	else output("casually dismiss her advice. You’re not the giving up sort.");
	output("\n\n<i>“Look, if you aren’t going to get to work, what do you want from me?”</i>");
	flags["MAUS_THINKS_PIRATE"] = 1;
	processTime(5);
	rodentTalkTopics();
}
public function rodentTalkTopics():void
{
	clearMenu();
	if(pc.hasKeyItem("Zheng Shi RFID Badge")) addDisabledButton(0,"Mining Robots","You already have the RFID pass!");
	else addButton(0,"Mining Robots",mouseRobotTalk);
	if(pc.hasKeyItem("Zheng Shi RFID Badge") || flags["REFUSED_BADGE"] != undefined) 
	{
		if(flags["TALKED_ABOUT_RAIDERS_WMAUS"] == undefined) addButton(3,"Raiders",raidersTalkWithMaus);
		else addDisabledButton(3,"Raiders","Raiders","You already had this discussion.");
	}
	else addDisabledButton(3,"Locked","Locked","You don’t know enough for this.");
	if(flags["TALKED_ABOUT_MAUS"] == undefined) addButton(1,"Her",askMausAboutHer);
	else addDisabledButton(1,"Her","Her","She didn’t seem very keen on sharing.");
	if(flags["FLIRTFAILED_WITH_MAUS"] == undefined) addButton(2,"Flirt",flirtWithThisMaus);
	else addDisabledButton(2,"Flirt","Flirt","You tried this. It didn’t work.");
	addButton(4,"Fight",fightTheMausRaider);
	addButton(14,"Leave",mainGameMenu);
}

//Flirt
public function flirtWithThisMaus():void
{
	clearOutput();
	showName("\nMECHANIC");
	showBust("RODENIAN_MECHANIC");
	author("Fenoxo");
	output("You suggest that you’d be happy to keep her company if she wanted to take a break.");
	output("\n\nThe mouse-girl pauses briefly, then resumes tossing down bits of metal. <i>“Yeah, you’re either new to rodenians or an asshole. Either way, not interested. Already got a mate, and don’t need any new friends, with or without benefits.”</i> Her tail tosses a wrench into her toolbox angrily. <i>“But we both know that " + pc.mf("guys","girls") + " like you are all about those benefits. Don’t you have anything better to do than waste my time?”</i>");
	flags["FLIRTFAILED_WITH_MAUS"] = 1;
	processTime(3);
	rodentTalkTopics();
}

//Her
public function askMausAboutHer():void
{
	clearOutput();
	showName("\nMECHANIC");
	showBust("RODENIAN_MECHANIC");
	author("Fenoxo");
	output("You ask the mouse-woman her name.");
	output("\n\n<i>“Nope. You don’t need it, and I’m not giving it.”</i>");
	output("\n\nMaybe you should ask something else...");
	flags["TALKED_ABOUT_MAUS"] = 1;
	setButtonDisabled(1);
	rodentTalkTopics();
}

//Robots
public function mouseRobotTalk():void
{
	clearOutput();
	showName("\nMECHANIC");
	showBust("RODENIAN_MECHANIC");
	author("Fenoxo");
	if(flags["REFUSED_BADGE"] == undefined)
	{
		output("You ask her what the deal is with the mining robots, and why they keep attacking you.");
		output("\n\n<i>“Oh for fuck’s sake...”</i> The rodenian whirls around to stare down at you. <i>“You came down here without an RFID badge?”</i> Her eyes widen. <i>“You did. You fucking moron. Are you </i>trying<i> to get yourself killed? These things...”</i> She kicks the disabled robot in the head. <i>“They have the all the brainpower of the universe’s dumbest cockroach. Half of them think organic matter’s just some easily drillable rock. The other half might realize you’re a living thing and assume you’re a thief. Either way, the results are the same.”</i>");
		output("\n\nYou nod. That’s about in line with your experiences.");
		output("\n\n<i>“Those dumb fuck-bunnies are worse at running this place than they are at taking showers.”</i> The sour mechanic sighs. <i>“Look, I might be an asshole, but I’m not gonna let you get yourself killed on your way out of here.”</i> She digs deep into her toolbox, spilling a few tiny screwdrivers into the cut-open diggerbot. <i>“Ah, here it is!”</i> A small alligator clip with skull and crossbones appears in her fuzzy hand. <i>“Pin this on somewhere, and they’ll leave you alone.”</i> It sails through the air into your hand.");
		output("\n\nYou thank the mystery mouse for her help.");
		output("\n\n<i>“Don’t mention it. And smarten up! Zheng Shi eats up idiots and spits out slaves. We already have too many of those if you ask me. Can’t even go up to the recreation deck without three pretty slaves trying to warm my bed.”</i> The mouse-girl waves dismissively. <i>“Now get out of my hair. I’m already behind on this repair job, and I am </i>not<i> going to waste anymore time in this hell-pit than I have to. Bad enough the other Raiders sent me down here in the first place.”</i>");
	}
	else
	{
		output("You bring up the robots again, and how you’re thinking over her offer for a RFID badge.");
		output("\n\nThe mouse-woman rolls her eyes. <i>“Oh so now you want my help to keep your insides from being drilled into your outsides?”</i> She snorts disdainfully. <i>“Wise up before you get yourself killed. Here.”</i> She tosses a badge through the air.");
	}
	processTime(10);
	output("\n\n<b>Do you keep the RFID badge? Doing so will permanently disable encounters with mining robots.</b>");
	clearMenu();
	addButton(0,"Yes",keepTheBadge);
	addButton(1,"No",dontKeepTheBadge);
}

public function keepTheBadge():void
{
	clearOutput();
	showName("\nMECHANIC");
	showBust("RODENIAN_MECHANIC");
	author("Fenoxo");
	output("(<b>Key Item Gained:</b> Zheng Shi RFID Badge! With this, mining robots will no longer see you as a source of ore!)");
	pc.createKeyItem("Zheng Shi RFID Badge");
	rodentTalkTopics();
}

public function dontKeepTheBadge():void
{
	clearOutput();
	showName("\nMECHANIC");
	showBust("RODENIAN_MECHANIC");
	author("Fenoxo");
	output("You toss the badge back.");
	if(flags["REFUSED_BADGE"] == undefined) 
	{
		output("\n\n<i>“Suit yourself. I tried.”</i> The mouse-eared woman shakes her head sadly. <i>“I tried.”</i> She waves you away, unwilling to speak any longer.");
		flags["REFUSED_BADGE"] = 1;
	}
	else output("\n\n<i>“You’re a moron. When you die, it won’t be my fault.”</i>");
	rodentTalkTopics();
}

//Raiders talk
public function raidersTalkWithMaus():void
{
	clearOutput();
	showName("\nMECHANIC");
	showBust("RODENIAN_MECHANIC");
	author("Fenoxo");
	output("<i>“Raiders?”</i> you ask.");
	output("\n\n<i>“Holy titty-fucking space-Jesus, no wonder you didn’t have a badge. You don’t know anything, do you?”</i> The mouse-girl whistles. <i>“Guess they’re letting any idiot who calls [pc.himHer]self a pirate in nowadays. Whatever.”</i> With a slow wave and slower enunciation, she explains, <i>“Rat’s Raiders are one of the big gangs that runs Zheng Shi. Unlike the rest of these degenerates, we’re not big ol’ dick-bags about it. See we aren’t in the game </i>entirely<i> to line our pockets. We’re in it to fuck with the status quo. Take from the jackasses at the top who can afford it and put it to better use helping out those of us at the bottom. That’s the idea anyway.”</i>");
	output("\n\n<i>“Really?”</i>");
	output("\n\nSomething approximating a smile spreads across her pointed snout. <i>“You betcha. Of course we’re not big enough to stick it to the people that matter on our own. That’s why we gotta put up with the asshole Vipers, the slut Jumpers, the machine fetishists, and those self-important corona-huffers.”</i> She shrugs. <i>“Anyway, I have work to do, and you...”</i> She points at you with her tail, not even bothering to look. <i>“...are bothering me.”</i>");
	processTime(5);
	flags["TALKED_ABOUT_RAIDERS_WMAUS"] = 1;
	rodentTalkTopics();
}

//Fight her
public function fightTheMausRaider():void
{
	clearOutput();
	showName("\nMECHANIC");
	showBust("RODENIAN_MECHANIC");
	author("Fenoxo");
	output("You pull out your [pc.weapon].");
	output("\n\n<i>“Oh fuck this.”</i> The mouse-girl rolls behind the bot and slaps it hard. <i>“Can’t even finish a repair job without some </i>ASSHOLE<i> trying to ear-fuck me into his pet puppet.”</i> The mining robot’s eyes light up. Even with its panels off and half its pieces on the floor, it’s still an impressive piece of tech. <i>“Fuck ‘em up, big guy.”</i>");
	output("\n\nThrough the robot’s legs, you see the sprinting mouse-girl flipping you the bird.");
	output("\n\nFuck.");
	clearMenu();
	var tEnemy:Creature = new MiningRobot();
	tEnemy.HP(-0.5*tEnemy.HPMax());
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(defeatAMiningRobot);
	CombatManager.lossScene(loseToAMiningRobot);
	CombatManager.displayLocation("M.ROBOT");
	flags["MAUS_MECHANIC_DISABLED"] = 1;
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

public function leaveTheMouse():void
{
	clearOutput();
	showName("\nMECHANIC");
	showBust("RODENIAN_MECHANIC");
	author("Fenoxo");
	output("You bid your farewells.");
	output("\n\n<i>“Yeah, try not to die to badly. If they send me down to clean up the mess, I’m going to be </i>pissed<i>.”</i>");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function leaveDisShitOverwrite():void
{
	addButton(11,"Exit Ship",move,"ZSF V22");
}

public function enterShip():void
{
	clearOutput();
	author("Fenoxo");
	output("With your stolen credentials, unlocking the airlock is a breeze.");
	clearMenu();
	addButton(0,"Next",move,"ZSF V20")
}

public function sidewinderCargohold():void
{
	//5th galomax dose, probe, jumper vacuum suit:
	//First time:
	if(flags["SIDEWINDER_CARGOHOLD"] == undefined)
	{
		output("You tap in the access code, and the door pops open. You flick the lights on and step in, taking a quick glance around.\n\n");
		flags["SIDEWINDER_CARGOHOLD"] = 1;
	}
	//Merge
	output("A high vaulted ceiling confirms that you’ve entered the Sidewinder’s cargohold (one of them, anyway). Still, it isn’t quite as roomy as you would expect from such a large vessel - only a little bigger than your old Casstech’s. The engines don’t just look big from the outside: they take up the majority of the ship’s volume. Even now, you can feel the idle thrum of its enormous power plants churning in a low-power state, ready to launch you past a peacekeeper blockade like a ballistic missile.");
	//Probe uncollected
	if(flags["ZHENG_SHI_PROBED"] == undefined)
	{
		output("\n\nTucked into the corner is your father’s probe. It’s scuffed to all hell and scored from laser blasts where someone used it for target practice. The keypad is intact, though. It flickers to life when you approach, and when you make contact, <b>a new set of coordinates download onto your Codex.</b>");
		output("\n\nEat that, [rival.name]!");
		output("\n\nSteele Tech salvage won’t be able to retrieve the probe from here, so you’ll have to leave it for the time being.");
		flags["ZHENG_SHI_PROBED"] = 1;
		variableRoomUpdateCheck();
	}
	//Probe collected
	else
	{
		output("\n\nThe probe is right where you left it: propped in the corner and pockmarked by dozens of laser blasts from its time with careless pirate crews. <b>You already have the coordinates, so it has nothing more to offer you.</b>");
	}
	//Merge
	output("\n\nAside from your probe, the hold is full of spare parts for various systems onboard the Sidewinder. Cables, tools, and racks of armor plate patches are organized neatly against the back wall.");
	//Jumper suit - no new PG:
	if(flags["ZHENG_SHI_JUMPERSPACESUIT"] == undefined) 
	{
		output(" A singular vacuum suit in the Jumper’s signature style hangs from a hook on the wall.");
		addButton(0,"J.Spacesuit",takeZhengShiJumperSpacesuit);
	}
	//Galomax not collected
	if(flags["ZHENG_SHI_GALOMAX"] == undefined)
	{
		output(" Lastly, you spot an expensive looking case on a fold-out table. It’s labeled as Galomax.");
		addButton(1,"Galomax",takeZhengShiGalomax);
	}
	//Galo or jumper suit here no new PG.
	if(flags["ZHENG_SHI_JUMPERSPACESUIT"] == undefined || flags["ZHENG_SHI_GALOMAX"] == undefined)
	{
		output(" Nobody could stop you from claiming an extra trophy");
		if(flags["ZHENG_SHI_JUMPERSPACESUIT"] == undefined && flags["ZHENG_SHI_GALOMAX"] == undefined) output(" or two");
		output("!");
	}
	return;
}

public function takeZhengShiGalomax():void
{
	clearOutput();
	showName("\nYOINK!");
	quickLoot(new GaloMax());
	flags["ZHENG_SHI_GALOMAX"] = 1;
}

public function takeZhengShiJumperSpacesuit():void
{
	clearOutput();
	showName("\nYOINK!");
	quickLoot(new JumperSpacesuit());
	flags["ZHENG_SHI_JUMPERSPACESUIT"] = 1;
}

public function accessCorridorX14Bonus():void
{
	output("One of the walls is missing a panel, allowing you a glimpse at the maze of pipes and wires that keep this marvel of lawless engineering running. You briefly trace their path until you come upon some crude graffiti. <i>“Kilroy was here.”</i> is written above a stylized depiction of a cock and balls, complete with a ring of curly hairs. Cute.");
	output("\n\nA wide door to the west offers access to one of the Sidewinder’s cargoholds, mirrored on the east with an additional <i>“Out of Order”</i> sign. ");
	if(flags["SHOCK_HOPPER_DEFEATED"] == undefined) 
	{
		output("<b>The security terminal alongside indicates you’ll need an access code to get inside. Shit!</b> ");
		flags["NAV_DISABLED"] = NAV_WEST_DISABLE;
	}
	output("The access corridor travels north toward aft end of the ship and south toward the cockpit.");
}

public function x22BonusRoomFuncInZhengiShiiiii():void
{
	output("While most ships have empty corridors that only differ in how they’re lit or how well worn they’ve become over the years, the Sidewinder’s occupants have clearly taken to decorating it in their own, truly unique style. This particular section houses a cat-eared mannequin ");
	if(flags["ZHENG_SHI_LATEX_BRAD"] == undefined || flags["ZHENG_SHI_LATEX_THONGD"] == undefined)
	{
		output("dressed in ");
		if(flags["ZHENG_SHI_LATEX_BRAD"] == undefined) 
		{
			addButton(0,"Take Bra",takeZhengBra);
			output("a leather bra");
		}
		if(flags["ZHENG_SHI_LATEX_BRAD"] == undefined && flags["ZHENG_SHI_LATEX_THONGD"] == undefined) output(" and ");
		if(flags["ZHENG_SHI_LATEX_THONGD"] == undefined) 
		{
			addButton(1,"Take Panty",takeZhengThong);
			output("leather panties");
		}
	}
	else output("that’s completely nude, thanks to your kleptomania");
	output(". Its proportions fall on the extreme end of the busty scale, well-endowed up top even by the skewed scale of female kaithrit. They must have made the feet from solid lead to keep it from tipping over under its own chesty weight.\n\nThe doorway to the cockpit signals the end of this hallway, just to the south. The rest of the ship lies north.");
}

public function takeZhengBra():void
{
	clearOutput();
	showName("\nYOINK!");
	quickLoot(new LeatherBra());
	flags["ZHENG_SHI_LATEX_BRAD"] = 1;
}

public function takeZhengThong():void
{
	clearOutput();
	showName("\nYOINK!");
	quickLoot(new LeatherPanties());
	flags["ZHENG_SHI_LATEX_THONGD"] = 1;
}

public function enterRecreationDeck():Boolean
{
	//if not allowed
	if(flags["SHOCK_HOPPER_DEFEATED"] == undefined) 
	{
		output("While the elevator obediently takes you to your destination, the doors stubbornly refuse to open no matter how fervently you jab at the console’s control buttons. It keeps flashing something about an unresolved security breach and recreation being temporarily suspended.\n\nMaybe you can come back here later, once the proverbial heat has died down.");
		flags["ZHENG_REC_BLOCKED"] = 1;
		clearMenu();
		addButton(7,"Down",move,rooms[currentLocation].outExit);
		return true;
	}
	//first time
	else if(flags["ZHENG_REC_VISITED"] == undefined)
	{
		flags["ZHENG_REC_VISITED"] = 1;
		//If tried before
		if(flags["ZHENG_REC_BLOCKED"] == 1) 
		{
			output("This time, you notice, there’s no software lock on the door controls. It would seem the Shock Hopper and L.D.C. gave up on pursuing you and let their crews go back to ‘recreation.’ As for what kinds of recreation they partake in... well, you’re about to find out.\n\n");
			//One time only, then clear it out.
			flags["ZHENG_REC_BLOCKED"] = undefined;
		}
		output("Once the elevator’s doors grind and rattle aside, you’re blasted with a cacophony of noise and light the likes of which never expected to see beyond the digitized walls of a virtual reality simulation. It’s overwhelming, even to a hardened explorer like yourself. Everywhere you look there are blinking lights, gleaming hardlight barriers, and acts of debauchery wanton enough to shock a purer soul into unconsciousness.");
		output("\n\nYou blink and look again, determined to take in this new locale.");
		output("\n\nThis time, you’re prepared to puzzle out the deck’s unique geography: that of a hollow sphere. The shape allows you to see everything at once: shops, kiosks, pirates, scantily clad slaves, and even the glitz and glam of an packed casino. Looking up is a dizzying experience made all the more nauseating by the floating forms of dancing slaves, pirouetting in zero G around the center of the elevator shaft. All bound with gleaming, silvery collars, they are without a doubt the most attractive creatures you’ve seen on this entire station, chosen for their task on the sole basis of peerless bone structure and flawless skin. One favors you with a wink and a sensuously blown kiss.\n\nYou half-heartedly wave back but turn your attention aside, determined to get a feel for this place before indulging in its basest forms of entertainment.");
		output("\n\nYou aren’t sure what history lead to the creation of this place - whether the pirates built it, or indeed, if they found it amongst the planet’s rubble, but you are sure that they’ve done a decent job of organizing the mind-boggling topography. Colorized paths drill through the chaotic mess of hedonistic pleasure-seeking and pure, unregulated capitalism. A gleaming green trail climbs straight up the wall that your Codex’s compass has chosen to designate as ‘north,’ mirrored by a crimson path to the south. Both come together at the apex of the chamber, forming a tight ring around the elevator shaft. Meanwhile, a luminous gold-floored alley winds east and west, reaching for the deck’s equator without quite reaching it. Where it meets with the brighter routes, it slides beneath into the caustic glow of simulated neon projections and dangerously dark corners only to emerge on the other side, brighter for the contrast.");
		output("\n\nYou’d best watch yourself. While the crowds of pirates range from amicable-looking to indifferent, it’s best to remember that these are all wanted men (and women) - every last one of them.");
	}
	else
	{
		output("The elevator doors hang open, exposing the interior to the glaring cacophony that is Zheng Shi’s recreation deck. The familiar colored paths stretch on in the four cardinal directions - or what your Codex approximates as them. Should you want to return to the rest of the station, it’s simple as stepping inside and pressing the down arrow.");
	}
	return false;
}

public function bonusHolosharkFun():void
{
	if(flags["SHARKED"] == undefined) output("A sizzle of static draws your eyes upward just in time to see the colossal maw of a shark bearing down upon. Teeth as big as infantryman’s rifle race toward your face with bowel-loosening speed, and on pure instinct, you roll aside a split-second before it crashes into the floor, its jaw scissoring shut with a staticy ‘snap.’ Nearby pirates burst into laughter as the imposing beast fizzles away into shimmering lettering, revealing itself to be nothing more than a hologram. “Beware the Suula menace!” it proudly declares.\n\nYou spot the hologram emitter nestled into a seam in the wall next to a glowing Cyber Punks logo." + (azraIsCrew() ? "\n\nIt’s a good thing Azra isn’t here.":""));
	else output("\n\nYou’re careful not to trigger the trapped hologram emitter on your way through the area. You have no desire to be jumped by a gigantic holo-shark for these pirates’ amusement, nor do you wish a second look at the inside of its impressively rendered maw. The floor panel with a splotch of red paint never gets stepped on by anyone else, after all. Now that you know to tread carefully here, you won’t have to suffer again.\n\nThe yellow-hued pathway winds east and west through a forest of dividers and entertainments.");
	output("\n\nTo the south, you spot a opening that winds through the flash, improvised constructions. The pirates entering seem excited. Those leaving stroll with relaxed, satisfied smiles.");
}
public function zhengGameFloorBonus():Boolean
{
	output("Glasses clink and voices raise in celebration of victories. Astute, fastidious, and utterly professional dealers man tables strikingly traditional but with mechanical flair. Pirates and mercenaries of all walks gamble their life savings in the pursuit of riches " + (silly ? "and bitches ":"") + "at blackjack, roulette, craps... most known forms of poker even have dedicated tables crammed full of players and witnesses. So much liquor is passing through this exultant atmosphere that the otherwise pleasant aromas are overpowered with signature drinks and the regular cry of <i>Another round!</i>");
	basicBitchBlackjackDealerIntro();
	return false;

}

public function enteringTreasureNovaBonus():Boolean
{
	// First Time Entering Treasure Nova
	if(flags["TREASURE_NOVAD"] == undefined)
	{
		clearOutput();
		showName("CASINO\nSECURITY");
		showBust("CASINO_SECURITY");
		author("William");
		output("You’re not entirely sure it’s a smart idea patronizing a pirate-owned-and-managed casino, but up to the flaring neon gates you [pc.walk], sidestepping sore losers and boastful winners. A hulking thraggen man is thrown to the ground in your direction by two well-armed and vertically endowed terran bouncers dressed in silver suits. The viridian-skinned giant storms off in a huff while they dust their gloved hands of the trash.");
		output("\n\nBoth bruisers sport obvious augmentation. On the sides of their oval-shaped heads sit square-shaped implants that summon visors of simmering green light across their field of vision. You don’t need to see their eyes to know that they are staring at you, one intently and the other aggressively.");
		output("\n\n<i>“A newbie,”</i> the red-haired one says apathetically, folding his trunk-like arms.");
		output("\n\n<i>“Right, I’ll handle this,”</i> the black-haired one responds brusquely, upturning his muscle-rippled palm and beckoning you to the side - can’t hold up traffic, after all.");
		output("\n\n<i>“Welcome to Treasure Nova,”</i> he begins in a professional oboe voice, interlocking his fingers behind his back. The same movement reveals the gun at his hip under the fancy jacket he wears. <i>“First, no weapons.”</i> ");
		if(pc.tallness <= 70) output("He looks down at you hard enough that his scrunched eyes are visible behind the mask, making it clear that was <i>not</i> an innocuous statement.");
		else if(pc.tallness < 80) output("He looks across at you hard enough and with tense body language, his firm warning crystal clear.");
		else output("He stares up at you unintimidated, his rock-solid body language supporting his terse warning.");
		output(" <i>“You will check your equipment before passing the gates and submit them to storage, and you will reclaim them when you leave. If it makes you feel better, nobody else will handle your gear.”</i>");
		output("\n\n");
		if(pc.isBimbo() || pc.isBro() || pc.isNice() || pc.isMischievous()) output("Nodding, you make ready to disarm. Agitating local security is the last thing you want on a crowded station.");
		else output("You scowl and prep your gear for apprehension. If someone tries anything, it’ll be a race between you and the help to make it their last mistake.");
		output("\n\n<i>“Lastly, you will respect the Dealers and adhere to the rules of the game. Credits are to be presented up front. Bets will not be forfeited or surrendered. Take it from me, you would do well <b>not</b> to spend beyond your means.”</i> A light smirk crosses his olive features. <i>“Everything else should be self-explanatory.”</i>");
		output("\n\nHe nods once, cracking his neck in the stiff motion, before returning to his post and quashing a sprouted argument.");
		output("\n\nIn the nearby alcoves, not too unlike a set of keyed lockers, you claim an unused rack and stash your [pc.rangedNoun] and whatever else on your personage that could be construed as a weapon, sealing them under magnetic clamps that will only open for the cardkey you take. You then [pc.move] unmolested through the cerulean forcefield, feeling the scanner bristle along your [pc.skinFurScalesNoun].");
		processTime(5);
		clearMenu();
		addButton(0,"Next",firstTimeCasinoPartDues);
		return true;
	}
	return false;
}

public function firstTimeCasinoPartDues():void
{
	clearOutput();
	showName("CASINO\nSECURITY");
	showBust("CASINO_SECURITY");
	author("William");
	output("Weaponized glamor that could topple old Terran religions decorates the <i>Treasure Nova</i> interior - the opulence on display stabs you right in the eye. Behind the idolatry are hardlight walls tuned to exhibit an accurate representation of atmospheric auroras. Soothing magenta rays fade into chilling emerald gradients, dimming until a chromatic pulse revivifies them, changing the color and the mood as it travels.");
	output("\n\nYou can practically see the aurelian strings being pulled from this grand space, attached tightly to the money moving through here at rapid rates. Obnoxiously loud slot machines jingle all around, shrill noises and psychologically exploitative lights persuading retries from lightened wallets. Dealers bellow at the nadir of the casino, in an area devoted to high-stakes gambling. Platinum-white carpets are laid at the center of every walkway, pathing through wealthy thoroughfares.");
	output("\n\nDominating the center of this hall is a massive bar that can be described as the very core of this den of iniquity. It may in fact <b>be</b> a giant power core with its eye-catching design. There, a battalion of bartenders serve freelancers, Jumpers, Cyber Punks, anyone who seats themselves at the counter. A poppy jazz theme highlighted by a suplerative sax emanates from the speakers slotted into its crown.");
	output("\n\nSlaves happy with their lot in life handle platters of steaming food and fizzy, raspberry-colored drinks, delivering condiments where they’re needed most, dressed in fine clothing featuring name tags and the logo of their owner’s business: unsurprisingly, a stylized nova.");
	output("\n\nNow that you’ve adjusted to the celestial aesthetic, you wonder where your money would best be spent. " + (silly ? "Assuming you don’t disturb the sound of silence, anyway. ":"") + "Considering everyone checks their weapons at the door, this may just be the safest place on Zheng Shi.");
	output("\n\nAt least until someone loses hard enough.");
	flags["TREASURE_NOVAD"] = 1;
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function aquariusBonusFunc():void
{
	var btnSlot:int = 0;
	if(daneAtZhengShi()) daneBonus(btnSlot++);
}

/* REDUX FOR SIDEWINDER STEALINGL */
public function ZSFG16Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("You stand square in the center of the station’s foundry level, aptly named, judging by the red-glowing, steam-belching furnaces and auto-smithies to the north. The entire area is one massive cavern - with a gleaming ship dangling high over it, surrounded by heavy scaffolds and the flashing torches of busy work-slaves. Rusty steel beams and geddanium-braid cabling stretch all the way into the craggy ceiling above, marking out just how much higher the cargo elevator can climb. Prefab hallways and white-boxed workrooms sit just to the south, undoubtedly providing a locale for more cerebral talents to be employed, insulated from the cacophonous din. A tunnel in the western wall is tagged with cheap spraypaint: “Shuttle Bay.”");
	else output("You stand square in the center of the station’s foundry level, aptly named, judging by the red-glowing, steam-belching furnaces and auto-smithies to the north. The entire area is one massive cavern - with the skeletal frame of a ship dangling high over it, surrounded by heavy scaffolds and the flashing torches of busy work-slaves. Rusty steel beams and geddanium-braid cabling stretch all the way into the craggy ceiling above, marking out just how much higher the cargo elevator can climb. Prefab hallways and white-boxed workrooms sit just to the south, undoubtedly providing a locale for more cerebral talents to be employed, insulated from the cacophonous din. A tunnel in the western wall is tagged with cheap spraypaint: “Shuttle Bay.”");
	return zhengFoundryF1EncounterBonus();
}
public function ZSFM12Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("The machinery comes to a halt along the eastern edge of the cavern. High above, a suspended scaffold surrounds the shape of an enormous craft. It looks complete, any work long since finished. To your northwest, the forgefires burn bright, the plasma furnaces glittering with fiery, metal-dissolving energies.");
	else output("The machinery comes to a halt along the eastern edge of the cavern. High above, a suspended scaffold surrounds the skeleton of an enormous craft. You may have stolen the original, but a replacement is well on its way. To your northwest, the forgefires burn bright, the plasma furnaces glittering with fiery, metal-dissolving energies.");
	return zhengFoundryF1EncounterBonus();
}
public function ZSFR6Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("This scaffold hangs from anchors in the cavern’s ceiling. Looking down, you’re at least four stories up from the ground floor and its bevy of automated smelting equipment. A fall from this height could kill you. Fortunately, the pirates eschewed their traditional disregard for safety and sprung for some quality steel railings. Still, you’d rather not lean to hard on any of them. The scaffold stretches off to the east and south around the bulk of a gleaming, newly constructed ship.");
	else output("This scaffold hangs from anchors in the cavern’s ceiling. Looking down, you’re at least four stories up from the ground floor and its bevy of automated smelting equipment. A fall from this height could kill you. Fortunately, the pirates eschewed their traditional disregard for safety and sprung for some quality steel railings. Still, you’d rather not lean to hard on any of them. The scaffold stretches off to the east and south around the bulk of a new <i>Sidewinder</i> - one still a long ways from complete.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFT6Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("Walking along the scaffold, you pass by one of the ship’s enormous engines. It isn’t just large - it’s large for the heavy corvette it’s bolted onto. Boosters this size are rarely seen on anything smaller than a full-size capital ship, but you suppose the pirates are rigging this ship for speed, the better to avoid Peacekeeper intervention. A little to the west, you can see a ladder. The scaffold also continues east.");
	else output("Walking along the scaffold, you pass by one of the ship’s partly-completed engines. Even half built, it’s large for the heavy corvette it’s bolted onto. Boosters this size are rarely seen on anything smaller than a full-size capital ship, but you suppose the pirates are rigging this ship for speed, the better to avoid Peacekeeper intervention. A little to the west, you can see a ladder. The scaffold also continues east.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFV6Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("You stand directly behind and below a wall of awe-inspiring engines, their exhaust cones individually big enough to contain a large house. The ship’s hull gleams with fresh paint and a variety of pirate insignias (along with some flashy graffiti). This is what Zheng Shi was built for - you’re sure of it. The station exists purely to produce this ship in secret, constructed bespoke for some oh-so-specific job. The scaffold around the engines runs east and west from here.");
	else output("You stand directly behind and below a wall of awe-inspiring engines, their exhaust cones individually big enough to contain a large house. The ship’s hull is somewhat less complete. Patchworks of armor plating and exposed internal systems show off its masterful engineering like a camwhore shows off her tits. This is what Zheng Shi was built for - you’re sure of it. The station exists purely to produce this ship in secret, constructed bespoke for some oh-so-specific job. The scaffold around the engines runs east and west from here.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFX6Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("To your south lies the Zheng Shi’s crown jewel: a heavy corvette with engines befitting a capital ship. One of them is close by - so close you could reach out and touch the flare of its cone, caress the super-high durability alloy. A ladder to the east descends along the cavern’s southern wall back to the foundry level and its heat belching machines. Alternatively, this suspended platform strolls west behind the ship’s thruster bank.");
	else output("To your south lies the Zheng Shi’s newest crown jewel: a second heavy corvette with engines befitting a capital ship. One of them is close by - so close you could reach out and touch the flare of its cone, caress the super-high durability alloy. A ladder to the east descends along the cavern’s southern wall back to the foundry level and its heat belching machines. Alternatively, this suspended platform strolls west behind the ship’s thruster bank.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFZ6Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("You stand at the corner of an enormous, suspended scaffold. One fork trails west along a bank of colossal engines. The other follows south along the bottom of the craft’s fuselage. The ladder itself, bolted into the northern wall, descends through plumes of smoke and air thick with the tang of aerosolized metals, back to the foundry that produced this triumph of lawless engineering.");
	else output("You stand at the corner of an enormous, suspended scaffold. One fork trails west along a bank of colossal engines. The other follows south along the bottom of the replacement craft’s partly-constructed fuselage. The ladder itself, bolted into the northern wall, descends through plumes of smoke and air thick with the tang of aerosolized metals, back to the foundry that produced this triumph of lawless engineering.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFZ8Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("Following along the underside of a corvette, the scaffold allows you to admire its every swell and curve, the size and reflective sheen of its sensor dishes, the girth of its steam-belching barrels. Unfortunately the scaffold itself is not so glorious, but it tracks north and south, giving you ample opportunity to take a closer look at the custom-built vessel.");
	else output("Following along the underside of a corvette, the scaffold allows you to admire its every swell and curve, marred by huge gaps that remain to be filled in. Even half-finished, the second <i>Sidewinder</i> is a sight to behold. Unfortunately the scaffold itself is not so glorious, but it tracks north and south, giving you ample opportunity to take a closer look at the custom-built vessel.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFZ10Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("Part of the scaffold’s railing is broken and dangles precariously over the forge below, nearly four stories down. You move carefully past it and back to the safer path beyond, briefly wondering why nobody has bothered to fix it. Then you look up at the ship’s side, every panel polished and in position. Work here is done. The scaffold continues to the north and south.");
	else output("Part of the scaffold’s railing is broken and dangles precariously over the forge below, nearly four stories down. You move carefully past it and back to the safer path beyond, briefly wondering why nobody has bothered to fix it. Then you look up at the ship’s side, where half-welded panels sway dangerously. After your theft, safety appears to be an even lower priority. The scaffold continues to the north and south.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFZ12Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("Following the ship’s hull like a lost puppy, these hanging platforms bend along in a generally north-south path. Heavy cables as thick as your arm hold them aloft, able to support the weight of dozens of workers, armor plates, and a small army of tools.");
	else output("Following the new ship’s partial hull like a lost puppy, these hanging platforms bend along in a generally north-south path. Heavy cables as thick as your arm hold them aloft, able to support the weight of dozens of workers, armor plates, and a small army of tools.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFZ14Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("Ten feet across and hemmed in by sturdy safety rails, the metallic scaffold continues its north-south journey in the shadow of the pirate’s corvette, providing an awesome view of the assembled industry below and the spacecraft above.");
	else output("Ten feet across and hemmed in by sturdy safety rails, the metallic scaffold continues its north-south journey in the shadow of the pirate’s corvette, providing an awesome view of the assembled industry below and the second Zheng Shi-crafted spacecraft above.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFZ22Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("The crimson vessel’s smooth bulges and rounded curves evoke memories of sporty hover-cars. Its recessed turret ports allow it to maintain a sleek profile for maneuverability in atmospheres of all types while still carrying enough weaponry to come out ahead in a dogfight. The longer you walk around it, the more surprised you are that these rag-tag groups of degenerates managed to come together to build something so beautiful. The walkway continues to the north and south.");
	else output("The bare metal vessel’s framework hints at the rounded curves of a sporty hover-car. You know all too well how well those smooth arcs will fill out. Recessed turret ports will allow it to maintain a sleek profile for maneuverability in atmospheres of all types while still carrying enough weaponry to come out ahead in a dogfight. The longer you walk around it, the more surprised you are that these rag-tag groups of degenerates managed to come together to build two incredible spacecraft. The walkway continues to the north and south.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFZ24Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("The scaffold doesn’t so much as sway when you walk. The heavy cables the bolt it to the foundry’s ceiling should allow some amount of motion, but it hangs rock solid. The secret, you realize, is the black boxes positioned at several of the intersections between panels. They occasionally flare with repulsive energy, pushing back in opposition to the inertial load it is subjected to. Brilliant.");
	else output("The scaffold doesn’t so much as sway when you walk. The heavy cables the bolt it to the foundry’s ceiling should allow some amount of motion, but it hangs rock solid. The secret, you realize, is the black boxes positioned at several of the intersections between panels. They occasionally flare with repulsive energy, pushing back in opposition to the inertial load it is subjected to. Brilliant.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFZ26Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("Bending 90 degrees to follow the last bits of construction on the pirate’s prized ship, the hanging catwalk stretches away to the north and west. Flecks of red paint adorn places of the deck. Bored-looking workers and slaves sometimes pass you by without a second thought, taking the long walk to their next job. Now if you could get the sharper-eyed scalawags to ignore you as easily.");
	else output("Bending 90 degrees to follow the hurried re-construction on the pirate’s prized ship, the hanging catwalk stretches away to the north and west. Flecks of red paint adorn places of the deck. Bored-looking workers and slaves sometimes pass you by without a second thought, taking the long walk to their next job. Now if you could get the sharper-eyed scalawags to ignore you as easily.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFX26Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("You stand under the fore portions of an enormous, red-painted vessel. Its body swells wider and wider to the north, fattening to a huge bank of engine cones in the distance. She’s no capital ship, but she sure makes the Casstech Z14 you started with look like small potatoes. The scaffold leads east and west. A few steps in the former direction and you’ll hit a right angle bend to the north.");
	else output("You stand under the fore portions of the enormous attempt to replace your pilfered vessel. Its body swells wider and wider to the north, fattening to a huge bank of engine cones in the distance. She’s no capital ship, but you know firsthand that she’ll have it where it counts. The scaffold leads east and west. A few steps in the former direction and you’ll hit a right angle bend to the north.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFV26Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("You flick your gaze back and forth along the hanging scaffold. It races east and west from here, under the nose of the privateer’s star-faring vessel. That ship is complete now - or mostly complete. More abandoned tools can be found lingering in disuse than workmen to crew them. The craftspeople who pass by do so with the casual smiles of men and women on the cusp of completing a long-time labor, and you don’t see them often.");
	else output("You flick your gaze back and forth along the hanging scaffold. It races east and west from here, under the nose of the privateer’s second attempt at a star-faring vessel. This ship is still a long way from complete. More abandoned tools can be found lingering in disuse than workmen to crew them. The craftspeople who pass by do so with the casual smiles of men and women on the cusp of completing a long-time labor, and you don’t see them often.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFT26Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("A smaller scaffold breaks north from the bigger, better-supported cat-walk to strike out toward a boarding hatch in the suspended ship. The larger path continues east and west, while the view over the southern railing presents you with a bird’s-eye view of the manufacturing complex below.");
	else output("A smaller scaffold breaks north from the bigger, better-supported cat-walk to strike out toward an incomplete boarding hatch in the suspended ship. The larger path continues east and west, while the view over the southern railing presents you with a bird’s-eye view of the manufacturing complex below.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFR26Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("The hanging metal catwalk jerks north and east at a perfect right angle, flanking around all sides of the crimson ship. The north path hugs along its starboard side. The eastern one dangles beneath its nose, providing a beautiful head-on view of its sporty curves. There, a smaller scaffold breaks toward a hatch - the only entrance you’ve seen on your suspended jaunt.");
	else output("The hanging metal catwalk jerks north and east at a perfect right angle, flanking around all sides of the stand-in for your crimson ship. The north path hugs along its starboard side. The eastern one dangles beneath its nose, providing a head-on view of its soon to be armored curves. There, a smaller scaffold breaks toward a hatch - the only entrance you’ve seen on your suspended jaunt.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFR20Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("Walking into this section of scaffold is like stepping into a cool mountainside morning, except the mist here is rolling off a ceiling-mounted coolant pipe. It cuts a dogleg east and plugs into a frost-rimmed port in the corvette’s flank. A lingering worker leans against the railing, savoring the chill, but a warning beep stirs him into action. He steps away with a respectful nod, heading back toward some unknown post to the north. You could follow or wander off in the other direction, though it’ll be tough to see anything until you escape this bank of artificial fog.");
	else output("Walking into this section of scaffold is like stepping into a cool mountainside morning, except the mist here is rolling off a ceiling-mounted coolant pipe. It dangles limp, unconnected to anything. The port at its terminus only closes halfway, causing it to spill out an avalanche of aerosolized chill. You recognize it as the same coolant your ship uses, and you suppose once the <i>Sidewinder II</i> is complete enough to plug it in, you won’t have to deal with this leak any longer. You could head north or wander off in the other direction, though it’ll be tough to see anything until you escape this bank of artificial fog.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFR16Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("From this T-intersection, the catwalk splits three ways. The north and south branches combine to form a solid avenue for bustling workmen (or workslaves) to move around every side of the hanging, heavy corvette. The east fork more heavily reinforced and over twenty feet across. It races up to the side of the cargo elevator, itself narrowly threading narrowly alongside the tremendous craft.");
	else output("From this T-intersection, the catwalk splits three ways. The north and south branches combine to form a solid avenue for bustling workmen (or workslaves) to move around every side of the hanging corvette’s exposed skeleton. The east fork more heavily reinforced and over twenty feet across. It races up to the side of the cargo elevator, itself narrowly threading narrowly alongside the tremendous craft.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFR12Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("Sensor dishes went out of style decades ago, but the reality of long distance detection has made them a practical necessity for dealing with pirates - and skirting the long arm of the law. The one shading the top of the ship is quite large for a vessel of this size, and workmen with magsuits slowly crawl around the struts and folded metal of the bay of its hidden storage bay. The scaffold continues north and south.");
	else output("An unhappy-looking slave dangles above second <i>Sidewinder</i>’s exposed frame. In her hand, the sputtering plasma welder carefully traces the connection between metallic skeleton and sensor dish mounting bracket, merging two pieces of metal into one. Such equipment went out of style decades ago, but the reality of long distance detection has made them a practical necessity for dealing with pirates - and skirting the long arm of the law. This particular dish is quite large for a vessel of this size.\n\nThe scaffold continues north and south.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFR10Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("A patch of unpainted armor flares out to within arm’s reach of the catwalk, seated by concealed fastening mechanisms on the underside so as not to present any weaknesses to hostile fire. A few tools hang from a bucket on the rail, left behind by some workers on break. Such basic implements are hardly worth the effort it would take to steal them. Your path along the suspended catwalk traverses in a straight north-south line.");
	else output("A bit of the second <i>Sidewinder</i>’s exposed frame almost within arm’s reach, and the pirates have taken the opportunity to paint <i>“Fuck [pc.Name]!”</i> on the side. A few tools hang from a bucket on the rail, left behind by some workers on break. Such basic implements are hardly worth the effort it would take to steal them. Your path along the suspended catwalk traverses in a straight north-south line.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFR8Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("From this high up you’re able to casually follow the foundry’s every connection. Ore rises on conveyors below to be carried into crucibles for smelting and pouring, then fed into automatic smelters to the east that hammer and the ingots into chunks of modular armor plating. It’s a miniaturized take on the processes occurring in the mega-corps’ orbital shipyards, doubtless assembled with the help of stolen manufacturing data schematics. The scaffold stretches north and south along the ship’s starboard side.");
	else output("From this high up you’re able to casually follow the foundry’s every connection. Ore rises on conveyors below to be carried into crucibles for smelting and pouring, then fed into automatic smelters to the east that hammer and the ingots into chunks of modular armor plating. It’s a miniaturized take on the processes occurring in the mega-corps’ orbital shipyards, doubtless assembled with the help of stolen manufacturing data schematics. The scaffold stretches north and south along the skeletal ship’s starboard side.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFT22Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("This suspended boarding ramp hangs a sharp, 90 degree turn to the east and south from here. The ship itself lies in the former direction, majestic and gleaming, its aerodynamic curves suggesting equal ease among stars or cloudy skies. The other direction leads back to the wider catwalks above Zheng Shi’s foundry.");
	else output("This suspended boarding ramp hangs a sharp, 90 degree turn to the east and south from here. You remember the first time you came here, looking up at the majestic, gleaming curves of your ship. Now there’s nothing but the sharp, angled metal of support beams and half-completed armor plating. The ship lies east, though there’s nothing to climb inside of... yet. The other direction leads back to the wider catwalks above Zheng Shi’s foundry.");
	return zhengFoundryF2EncounterBonus();
}
public function ZSFV22Bonus():Boolean
{
	if(!pirateResearchVesselStolen()) output("The catwalk terminates at the Sidewinder’s side, buffered by the six inches of rubberized padding, squished tight against the gleaming hull. A squarish seam, roughly eight feet high, provides graciously accommodating entry to the craft, assuming you can work the transparent aluminum touchscreen and card reader to get inside.");
	else output("The catwalk terminates at a large gap between you and the new <i>Sidewinder</i>’s frame. When it’s complete, the gleaming hull will connect nicely with the catwalk’s six inches of rubberized padding.\n\nThere’s nothing to do but go back.");
	return cousinEncounterBonus();
}
