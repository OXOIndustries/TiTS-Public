//import classes.Characters.MiningRobot;
import classes.Items.Miscellaneous.MaikesKeycard;
import classes.Items.Transformatives.SnakeByte;

public function zhengCoordinatesUnlocked():Boolean
{
	return (nyreaDungeonFinished() || (flags["KQ2_MYRELLION_STATE"] == 1 && MailManager.isEntryUnlocked("danemyrellioncoords")));
}

public function zhengElevatorF1Bonus():void
{
	variableRoomUpdateCheck();
	//Power Out: 
	if(flags["ZHENG_SPACEWALKED"] == undefined && flags["ZHENG_SHI_SLAVE_SNUCK"] == undefined) output("However, a big red sign has been hung up off a valve next to the elevator that reads <b>OUT OF ORDER</b>. The console that controls the elevator is powered down, and a couple of pokes doesn’t change that. Looks like the power’s been cut somewhere...");
	else 
	{
		output("The power has been restored to the elevator, and the console is flashing dimly with control instructions.");
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
	clearOutput();
	flags["ZHENG_SHI_JUMPSUITED"] = 1;
	quickLoot(new Slavesuit());
}
public function takeZhengShiSpacesuit():void
{
	clearOutput();
	flags["ZHENG_SPACESUIT_TAKEN"] = 1;
	quickLoot(new SpacesuitIncomplete())
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
	if(flags["ZS_MINE_STEP"]-4 > rand(16))
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
	}
	if(encounters.length > 0) 
	{
		return encounters[rand(encounters.length)]();
	}
	//If no combat, MAUS!
	if(flags["MAUS_MECHANIC_DISABLED"] == undefined && flags["MINING_ROBOT_ENCOUNTERS"] != undefined && !pc.hasKeyItem("Zheng Shi RFID Badge"))
	{
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
			addButton(0,"Investigate",investageDatMouseMechanicYo,undefined,"Investigate","This probably won’t lead to a fight. Probably. Maybe.");
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
	if(flags["ZS_FOUNDRY_STEP"]-4 > rand(16))
	{
		flags["ZS_FOUNDRY_STEP"] = 0;
		IncrementFlag("ZS_FOUNDRY_ENCOUNTERS");

		encounters.push(forgehoundEncounter);
		encounters.push(encounterPunkSecOp);
		encounters.push(encounterPunkSecOp);
		encounters.push(encounterPunkSecOp);
		encounters.push(encounterPunkSecOp);
		encounters.push(encounterPunkSecOp);
		encounters.push(encounterPunkSecOp);
		encounters.push(encounterPunkSecOp);
		encounters.push(encounterPunkSecOp);
		/*encounters.push(boredJumperAttackProc);
		encounters.push(boredJumperAttackProc);*/
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
	//Haven't found replacement helmet:
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
	//Hasn't freed slaves:
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
		//Maike's door has a lock puzzle the PC must bypass to enter, or have her access card.
		output("You try to open the door to Overseer Maike’s quarters, but find the door locked down tight. There’s a security lock in place next to it with a card reader in place. Looks like the Overseer values her privacy.");
		
		clearMenu();
		//[Use Card] [Bypass]
		if(pc.hasKeyItem("Maike’s Keycard") || pc.hasItemByClass(MaikesKeycard)) addButton(0,"Use Card",useMaikesCard,undefined,"Use Card","You already have the overseer’s access card. Go ahead and use it.");
		else addDisabledButton(0,"Use Card","Use Card","You’d need the overseer’s card for that!");
		addButton(1,"Bypass",bypassMaikesRoomieroomHackerman,undefined,"Bypass","Embrace your inner Hackerman.");
		return true;
	}
	else if(flags["MET_TIVF"] == undefined)
	{
		tivfGreeting();
		return true;
	}
	//Hasn't freed slaves:
	if(flags["MAIKE_SLAVES_RELEASED"] != undefined)
	{
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
	//Appended to Urbolg's room description.
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
		processTime(5*60);
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
		clearMenu();
		addButton(0,"Submit",submitThePiratePassword);
		if(metKiro() && roamingKiroAvailable()) addButton(1,"Call Kiro",callAKiroFriend);
		else addDisabledButton(1,"Locked","Locked","You haven’t met a character you could call in a favor from...");
		if(paigeIsCrew()) addButton(2,"Call Paige",callAPaigeFriend);
		else addDisabledButton(2,"Locked","Locked","You need a specific character on your crew for this.");
		addButton(4,"Run!",fuckThisShit);
	}
	//Repeat Approach, Post Correct Answer
	else
	{
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
	clearMenu();
	addButton(0,"Submit",submitThePiratePassword);
	if(metKiro() && roamingKiroAvailable()) addButton(1,"Call Kiro",callAKiroFriend);
	else addDisabledButton(1,"Locked","Locked","You haven’t met a character you could call in a favor from...");
	addButton(4,"Run!",fuckThisShit);
}

public function callAPaigeFriend():void
{
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
	output("\n\n<i>“Hey, go fuck yourself, dipshit!”</i> she hollers into the receiver. <i>“The fuck is this, about some ‘password’ horseshit? We got business on the base, so lower your fucking weapons before <i>I<i> tell </i>you<i> what your </i>safeword<i> is!”</i>");
	output("\n\n<i>“Alright, jeez!”</i> the station controller’s voice says. <i>“Guns are down. We’ll see how long that attitude keeps up, fresh meat.”</i>");
	output("\n\nTrue to the harbormaster’s word, the target locks from the asteroid release, and you’re free to bring your ship into the bay unmolested.");
	output("\n\n<i>“That’s the secret, [pc.name],”</i> Paige says as she turns toward the door of the bridge. <i>“Don’t let them push you around. There’s no law or decorum in Zheng Shi; as soon as you show them any weakness, they’ll make you their bitch, so if you enjoy being your own {wo}man, you need to push as hard as they shove.”</i>");
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
	clearOutput();
	showKiro();
	if(stage.contains(userInterface.textInput)) removeInput();
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
		output("<i>“Yeah, nice try,”</i> the voice says over the radio, suddenly with a dangerous edge. <i>“Only gate you’re crashing is the afterlife’s!”</i>");
		//gib spess battle
		//9999
		output("\n\n(There was meant to be a space battle here, so placeholder bad-end for now!)");
		badEnd();
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

public function foundryLounge2Bonus():Boolean
{
	output("With a couch and plenty of nearby cushions, it’s clear that this quiet corner of the break room provides the pirate officers with a quiet place to rest, relax, and cuddle with their pleasure-slave of choice. A squat box with an onahole-like entrance lends further credence to that theory. The stained nameplate labels it as a TamaniCorp Hora Series 69 Dong Designer.");
	if(flags["LOOTED_COCKBOX"] != undefined) output(" You know all too well about such devices. Maybe you could give it a spin?");
	else output(" A quick extranet search reveals that it does exactly what the name suggests. Just stick a penis inside, and the magic box will change it into any crazy alien dong your mind might dream up.");
	output("\n\nUnfortunately it’s bolted to the floor");
	if(flags["LOOTED_COCKBOX"] != undefined) output(", but nothing’s stopping you from snagging a copy of the updated firmware to install on your personal box. Custom pigmentation selection seems like quite the upgrade!");
	else output(".");
	addButton(0,"DongDesigner",useInstalledDickBox,undefined,"Dong Designer","Take a closer look a this dick-customizing box!");
	//Gunna need to update the dong designer
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
		output("You approach the mouse-girl oncemore. This time, the rodenian looks up almost immediately. <i>“You again? Whaddya want?”</i>");
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
	output("\n\nShe nearly hyperventilates laughing, her diaphragm spasming with the forcefulness of her squeaking delight. <i>“So’s my left tit, but you don’t hear me bandying it about like some kind of title. Everybody ‘round these parts calls themself a pirate. Even the dumbshit dog in the hangar down here.”</i> She snorts. <i>“Yeah, you’re a real big pirate, asshole. Keep sitting on your ass and polishing real pirates’ ships.”</i> A burnt-out servo slams into the ground next to your [pc.foot]. <i>“So, " + pc.mf("Mister","Miss") + " pirate, how are you going to waste my time today?");
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
	output("\n\n<b>Do you keep the RFID badge? Doing so with permanently disable encounters with mining robots.</b>");
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