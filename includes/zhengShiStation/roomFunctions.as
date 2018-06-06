//import classes.Characters.MiningRobot;

public function zhengCoordinatesUnlocked():Boolean
{
	return (nyreaDungeonFinished() || (flags["KQ2_MYRELLION_STATE"] == 1 && MailManager.isEntryUnlocked("danemyrellioncoords")));
}

public function zhengElevatorF1Bonus():void
{
	//Power Out: 
	if(9999 == 9999) output("However, a big red sign has been hung up off a valve next to the elevator that reads <b>OUT OF ORDER</b>. The console that controls the elevator is powered down, and a couple of pokes doesn’t change that. Looks like the power’s been cut somewhere...");
	else output("The power has been restored to the elevator, and the console is flashing dimly with control instructions.");
}

public function zhengMinesEncounterBonus():Boolean
{
	IncrementFlag("ZS_MINE_STEP");
	var encounters:Array = [];
	//First 3 times are gimmes, then increasing odds till step 15 or so.
	if(flags["ZS_MINE_STEP"]-4 > rand(16))
	{
		flags["ZS_MINE_STEP"] = 0;
		
		encounters.push(miningRobotAttack);
	}
	if(encounters.length > 0) 
	{
		return encounters[rand(encounters.length)]();
	}
	return false;
}

public function slavePensBonus():Boolean
{
	//Hasn't freed slaves:
	if(9999 == 9999) 
	{
		output("\n\nIndeed, you can see several dozen shadowy figures shuffling around inside, trying to avoid your sight.");
		output("\n\nYou can’t get inside thanks to a massive metal bar running across the door. It’s electronically locked and hardened against hacking; you can’t even see a seam or a plug to abuse. You’ll have to find the right keycard for this one.");
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
	//player has RFID card
	if(pc.hasKeyItem("9999")) output("\n\nThe droid passes you by, however, stomping away towards a deposit it’s allowed to mine.");
	//else:
	else 
	{
		output("\n\nThe robot’s square head cranks towards you, flashing a scanner that beeps menacingly as it passes over you. A deep, bass-heavy voice booms through the tunnel: <i>“New source of minerals detected! Beginning excavation process!”</i>");
		
		output("\n\nUh oh...");

		clearMenu();
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
		if(9999 == 0) addButton(0,"Use Card",useMaikesCard,undefined,"Use Card","You already have the overseer’s access card. Go ahead and use it.");
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
	if(9999 == 9999)
	{
		output("Tivf is lounging on the bed, and perks up at your approach.");
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
	output("\n\nYour snap to wakefulness to a rhythmic beeping from your ship’s sensor suite. You don’t remember having fallen asleep, only the passage of hours waiting for your sensors to fully scan an entire solar system.");
	output("\n\nIt hasn’t found the probe, but as you wipe the sleep from your eyes, you see that your sensors have locked onto a ship puttering through the debris field on impulse power. She’s a big girl, too, practically bursting at the seams with hemispherical laser batteries and grappling cannons. She’s not flying any colors and her ID’s not pinging any databases you can access, so if you had to take a wild guess, you’d say she’s a pirate ship.");
	output("\n\nAnd she’s making good speed somewhere. Curious, you ease yourself into the field after her, taking it nice and slow to avoid detection. ");
	if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("It’s no sweat for you, given you previous occupation. You know all the tricks a ship like this might use to cover her tracks; following her is child’s play.");
	else if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output("You man the sensors closely, refusing to let any amount of interference from the massive debris field around you to distract you from your quarry.");
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
	addButton(0, "Next", flyTo, "Tarkus");
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