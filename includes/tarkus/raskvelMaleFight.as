import classes.Characters.RaskvelMale;
import classes.Engine.Combat.DamageTypes.DamageResult;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.GameData.CombatManager;
//Plans/Ideas
/**Three raskvel scavenging some junk. Possibly have a chance mechanic as to how they’re predisposed to you. They don’t care (low chance of that m8), they offer sexy times, they offer a gud deal on the junk, they want to get paid like the female.

*In any case, group fun. Submissive gang bang, high libido triple buttfuck.

*Masculine and feminine positives. As intelligent masculine they are more likely to let you go easily; as intelligent feminine you can make them fight each other over you.*/

public function showRaskGang():void
{
	userInterface.showBust("RASKVEL_GANG");
	if(inCombat()) userInterface.showName("RASKVEL\nMALE");
	else 
	{
		userInterface.showName("FIGHT: MALE\nRASKVEL");
		author("Nonesuch");
	}
}

public var raskLootItems:Array = [
	"Locked Metal Chest",
	"Some Sort of Shining Spaceship Part",
	"Intact, Antique Android",
	"Bulky Data-Core"
];
public function pcHasJunkPrize():Boolean
{
	if(pc.hasKeyItem("Locked Metal Chest")) return true;
	if(pc.hasKeyItem("Some Sort of Shining Spaceship Part")) return true;
	if(pc.hasKeyItem("Intact, Antique Android")) return true;
	if(pc.hasKeyItem("Bulky Data-Core")) return true;
	return false;
}

public function getRaskLootType(seller:String = "none"):int
{
	// Select the best deals!
	var stash:Array = [];
	var hasMetalChest:Boolean = pc.hasKeyItem("Locked Metal Chest");
	var hasShipPart:Boolean = pc.hasKeyItem("Some Sort of Shining Spaceship Part");
	var hasAndroid:Boolean = pc.hasKeyItem("Intact, Antique Android");
	var hasDataCore:Boolean = pc.hasKeyItem("Bulky Data-Core");
	
	switch(seller)
	{
		case "Anno":
			if(hasDataCore) stash.push(3);
			break;
		case "Colenso":
			if(hasMetalChest) stash.push(0);
			else
			{
				if(hasShipPart) stash.push(1);
				if(hasAndroid) stash.push(2);
				if(hasDataCore) stash.push(3);
			}
			break;
		case "Shekka":
			if(hasAndroid) stash.push(2);
			else if(hasShipPart) stash.push(1);
			break;
	}
	// If not valid seller-item match, do a random item
	if(stash.length <= 0) 
	{
		if(hasMetalChest) stash.push(0);
		if(hasShipPart) stash.push(1);
		if(hasAndroid) stash.push(2);
		if(hasDataCore) stash.push(3);
	}
	if(stash.length > 0) return stash[rand(stash.length)];
	// No valid items!
	return -1;
}
public function getRaskLootString(raskLootType:int = -1):String
{
	switch(raskLootType)
	{
		case 0: return "locked metal chest"; break;
		case 1: return "spaceship part"; break;
		case 2: return "antique android"; break;
		case 3: return "blocky data-core"; break;
		default: return "<i>NOTHING!</i>"; break;
	}
}

public function getRaskLootPrice():int
{
	return pc.keyItemv1("Locked Metal Chest") + pc.keyItemv1("Some Sort of Shining Spaceship Part") + pc.keyItemv1("Intact, Antique Android") + pc.keyItemv1("Bulky Data-Core");
}

public function removeRaskLoot():void
{
	pc.removeKeyItem("Locked Metal Chest");
	pc.removeKeyItem("Some Sort of Shining Spaceship Part");
	pc.removeKeyItem("Intact, Antique Android");
	pc.removeKeyItem("Bulky Data-Core");
	flags["SHEKKA_SCRAP_DISABLED"] = undefined;
	flags["COLENSO_SCRAP_DISABLED"] = undefined;
	flags["ANNO_SCRAP_DISABLED"] = undefined;
}

public function removeRaskLootOption():void
{
	clearOutput();
	output("You are going to drop all of your raskvel loot items, which is possibly worth around " + getRaskLootPrice() + " credits total. Are you sure you want to do that?");
	output("\n\n<i>Note that dropping the loot will remove it from your inventory and cannot be reclaimed.</i>");
	clearMenu();
	addButton(0, "Yes", dumpRaskLoot);
	addButton(1, "No", keyItemDisplay, "<RASKLOOT>");
}

public function dumpRaskLoot():void
{
	clearOutput();
	output("You have dropped all of your raskvel loot items!");
	removeRaskLoot();
	clearMenu();
	addButton(0, "Next", keyItemDisplay);
}

//Intro
public function raskvelGangEncounter():void
{
	showRaskGang();
	IncrementFlag("MET_MALE_RASKVEL_GANG");
	output("\n\nThere’s a lot of banging and cheerful shouting emanating from the big, rambling pile of junk directly in front of you. A red-scaled, massive-eared head pops out of the cockpit of a rusted hovercraft, swiftly followed by the rest of a squat form, hauling an over-sized screwdriver with it. He pauses when he sees you.");
	output("\n\n<i>“Oh! Hello,”</i> it says. The echoing chatter quiets and two other similar figures clamber into view to have a good stare. You recognize them as male raskvel: the hyperactive, dwarfish natives of this planet that you met plenty of back at Novahome. These three are looking down at you from their pile of trash with a mixture of mischievousness and bonhomie, smirks playing on their ruddy lips like they are all about to burst into laughter. Whether it’s with you or at you is difficult to tell.");
	if(!CodexManager.entryUnlocked("Raskvel"))
	{
		output("\n\nBeeping, your codex alerts you that this is a male of the raskvel race, just like the ones you met when you landed. It issues a quick summary: <i>The Raskvel are a race obsessed with fixing technology and breeding in equal measure. They are generally a very friendly race, but some are more than happy to turn to violence to secure a mate.</i>");
		CodexManager.unlockEntry("Raskvel");
	}

	//Gud Deal
	//30% Chance. Does not proc if PC already has junk prize on them
	if(rand(10) <= 2 && !pcHasJunkPrize())
	{
		output("\n\n<i>“You’re in luck, offworlder,”</i> says the one closest to you.");
		output("\n\n<i>“We are premier scavenge hunters – Tarkus’s finest,”</i> says the second, in close succession.");
		output("\n\n<i>“And we have just uncovered – treasure!”</i> exclaims the third. He proudly hauls ");
		var raskLootType:int = rand(4);
		switch(raskLootType)
		{
			case 0: output("a locked metal chest"); break;
			case 1: output("some sort of shining spaceship part"); break;
			case 2: output("an intact, antique android"); break;
			case 3: output("a bulky data-core"); break;
			default: output("<i>NOTHING!</i>"); break;
		}
		output(" into the light.");

		output("\n\n<i>“The kind of loot that would see us in Quivering Quasars and robot hookers for a lifetime,”</i> the first says dreamily.");
		output("\n\n<i>“But,”</i> his compatriot goes on, ears drooping theatrically. <i>“We can’t haul it back to Novahome for appraisal. It’s too far, and this sweet dig site has got to be protected.”</i>");
		var gudDealPrice:int = 100 + rand(901);
		output("\n\n<i>“Plus the bigger raskvel gangs will just pinch it off us,”</i> grumbles the smallest.");
		output("\n\n<i>“So! We’re offering you a deal of a lifetime,”</i> leers the biggest. <i>“For you, our offworlder friend, we’re willing to let you have it for a mere " + gudDealPrice + " credits.”</i>");
		output("\n\n<i>“A pittance, you lucky alien,”</i> groans the medium-sized one. <i>“Go on, snatch it out of our poor hands before we offer it to the next random soul that chances upon us.”</i>");
		output("\n\nYou squint up at the " + getRaskLootString(raskLootType));
		output(" the one furthest away is holding. It <i>could</i> be valuable, you suppose....");
		processTime(4);
		//[Buy It] [Don’t]
		clearMenu();
		if (pc.credits >= gudDealPrice) addButton(0, "Buy It", buySomeJankJunkJunk, [raskLootType, gudDealPrice], "Buy It", "Buy the offered prize.");
		else addDisabledButton(0, "Buy It", "Buy It", "You can’t afford the asking price.");
		addButton(1,"Don’t",dontBuyScrapShit,undefined,"Don’t","Don’t buy that hunk o’ junk.");
	}
	//Offers Fun
	//40% chance
	else if(rand(7) <= 3)
	{
		output("\n\nThe first one is the biggest, well over a mighty four feet tall, oil-stained and well rounded with muscle in an artless, purposeful kind of way, unabashedly naked. He wipes his hands on a rag, swinging his powerful hips deliberately as he does so.\n\n<i>“Good timing, good looking,”</i> he says, grinning at you rakishly. <i>“We were just about to knock off for our break. Why don’t you come along? I think we could all do with a bit of fun.”</i>");
		//[Yes] [No]
		//Yes Tooltip: You suspect by “fun” they mean “sex”.
		//No Tooltip: They can’t make you have fun.
		clearMenu();
		addButton(1,"No",noIDontWantFunRaskGang,undefined,"No","They can’t make you have fun.");
		if(pc.hasGenitals()) addButton(0,"Yes",sureRaskLetsHaveFun,undefined,"Yes","You suspect by ‘fun’ they mean sex.");
		else addDisabledButton(0,"Yes","Yes","You need genitals to have fun!");
	}
	//Wants a Bribe
	//30% chance
	else
	{
		output("\n\n<i>“Now then, offworlder,”</i> says the first, his expression suddenly turning grave. He is the biggest of the three, well over a mighty four feet tall, oil-stained and well rounded with muscle in an artless, purposeful kind of way, unabashedly naked. He wipes his hands on a rag, deliberately swinging his powerful hips as he does so. <i>“You’re trespassing on our dig site.”</i>");
		output("\n\n<i>“Just when we had uncovered something really valuable,”</i> puts in the second.");
		output("\n\n<i>“Now, now,”</i> says the first, wagging his finger piously. <i>“We here are only concerned with offworlder safety. All sorts of bad things could happen to unsupervised members of the public if they go wandering around a junkyard.”</i>");
		output("\n\n<i>“Could cut yourself,”</i> suggests the third.");
		output("\n\n<i>“Could get trapped under falling machinery.”</i>");
		var bribeAmount:int = 200 + rand(300);
		output("\n\n<i>“Or you could get pinned down and mercilessly fucked by a gang of raskvel,”</i> finishes the big one. <i>“But we’re understanding folk. So if you give us " + bribeAmount + " credits, we’ll let you run along.”</i>");
		output("\n\n<i>“But what if [pc.heShe] can’t pay?”</i> gasps the second.");
		output("\n\n<i>“I’m sure [pc.heShe] can think of some other way of duly compensating us,”</i> replies the first, running his eyes up and down your frame hungrily.");
		processTime(3);
		//[Pay] [Don’t Pay] [Pay with Sex]
		clearMenu();
		if(pc.credits >= bribeAmount) addButton(0,"Pay",payRaskGangForSafePassage,bribeAmount,"Pay","Pay them the money.");
		else addDisabledButton(0,"Pay","Pay","You can’t afford that!");
		addButton(1,"Don’t Pay",dontPayForSafePassageSlut,undefined,"Don’t Pay","It’s clobberin’ time!");
		if(pc.hasGenitals()) addButton(2,"PayWithSex",pay4SafetyWivSmex,undefined,"Pay With Sex","Maybe you can pay them off with some sex.");
		else addDisabledButton(2,"PayWithSex","Pay With Sex","You need genitals to pay them off with sex!");
	}
}

//No
public function noIDontWantFunRaskGang():void
{
	clearOutput();
	showRaskGang();
	output("<i>“Thanks, but no thanks,”</i> you reply.");
	//They don’t take it as an answer.
	//60% if masculine/andro, 80% if feminine
	if((pc.femininity >= 60 && rand(10) <= 5) || (pc.femininity < 60 && rand(10) <= 7))
	{
		output("\n\n<i>“Aww, that’s too bad!”</i> says the first one, ears drooping comically.");
		output("\n\n<i>“Frustrating,”</i> posits the second.");
		output("\n\n<i>“Yeah. Without break-time entertainment I’m going to feel really pent up,”</i> chips in the third.");
		output("\n\n<i>“Makes me want to, oh I don’t know, pin down a prissy, trespassing offworlder and fuck them silly anyway,”</i> says the first, who hasn’t taken his eyes off you.");
		output("\n\n<i>“Now that’s a plan I can get behind,”</i> grins one of the others. The three raskvel clamber out of the wreckage and advance upon you.");
		processTime(1);
		//[Go to combat]
		clearMenu();
		configRaskGangFight();
		addButton(0,"Next", CombatManager.beginCombat);
	}
	//They do take it as an answer
	//40% if masculine/andro, 20% if feminine
	else
	{
		output("\n\nThree pairs of ears which had been raising hopefully all droop as one, quite comically.");
		output("\n\n<i>“Suit yourself,”</i> the first one grumbles, climbing out of the wreckage. <i>“Just don’t steal any of our parts while we’re gone.”</i>");
		output("\n\nYou assure him that you won’t.");
		processTime(1);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

public function configRaskGangFight():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new RaskvelMale());
	CombatManager.victoryScene(victoryVsRaskGang);
	CombatManager.lossScene(lossVsRaskGang);
	CombatManager.displayLocation("RASKVEL (M)");
}

//Yes
public function sureRaskLetsHaveFun():void
{
	clearOutput();
	showRaskGang();
	if(!pc.isBimbo()) output("You shrug your shoulders amenably.");
	else output("You practically giggle as you run your eyes over their male forms. Three of these energetic little fuck-pumps at once? How nice of them to ask!");
	output("\n\n<i>“Fun sounds like fun,”</i> you say. <i>“Know a good spot?”</i>");
	output("\n\n<i>“Wouldn’t offer if we didn’t,”</i> he grins. The three raskvel skillfully work their way down towards you. Chattering and laughing between you, they put their warm, smooth hands in yours and lead you off into the depths of the junk.");
	// Go to cons gang bang
	clearMenu();
	addButton(0,"Next",consensualGangBang);
}

//Pay
public function payRaskGangForSafePassage(arg:int):void
{
	clearOutput();
	showRaskGang();
	output("You have neither the time nor the energy to deal with this right now and just paying these three idiots seems like the easiest way out. You tap up a credit chit and silently chuck it up to the closest. He’s barely expecting it and it almost hits him square in the nose.\n\n<i>“I – oh!”</i> he says. He looks confused and slightly saddened. <i>“We weren’t – I mean you don’t really – that will do, offworlder,”</i> he recovers haughtily. <i>“You’re free to go.”</i>");
	output("\n\nYou’re already going.");
	pc.credits -= arg;
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Don’t Pay
public function dontPayForSafePassageSlut():void
{
	clearOutput();
	showRaskGang();
	output("<i>“You must know I’m not giving you anything,”</i> you say.");
	output("\n\n<i>“So few people have the public good at heart,”</i> the first one sighs. <i>“Ah well. Examples have to be made.”</i>");
	output("\n\nThe three of them skillfully clamber down from their junk and close in on you.");
	// go to fight
	clearMenu();
	configRaskGangFight();
	addButton(0, "Next", CombatManager.beginCombat);
}

//Pay with Sex
public function pay4SafetyWivSmex():void
{
	clearOutput();
	showRaskGang();
	//Treated:
	if(pc.isTreated()) output("You find yourself shaking your head and smiling in exasperation to this. They’re guys, they want to rut, why are they bothering with so many words?\n\n");
	if(pc.isNice())
	{
		output("<i>“I’m not paying you blockheads anything,”</i> you say");
		if(!pc.isTreated()) output(", smiling and shaking your head");
		output(". <i>“But why don’t we go someplace? Maybe I could let you win a different way.”</i>");
		output("\n\n<i>“I think we could maybe allow that,”</i> the first raskvel grins. The three of them quickly clamber down to you. Chattering and laughing between you, they put their warm, smooth hands in yours and lead you off into the depths of the junk.");
	}
	//Misc:
	else if(pc.isMischievous())
	{
		output("<i>“Oh dear, I left my wallet back at the spaceport!”</i> you clap your hands into your face with theatrical dismay. <i>“Maybe I’ve got what you’re looking for in my back pocket.”</i> You turn and display your [pc.butt] for them, before scrounging");
		if(pc.isCrotchGarbed()) output(" beneath your [pc.lowerGarment]");
		else output(" between your cheeks");
		output(" with apparent earnestness. This is met with a chorus of appreciative laughter.");

		output("\n\n<i>“You’re alright, offworlder,”</i> the first raskvel says, as the three of them quickly clamber down to you. Chattering and laughing between you, they put their warm, smooth hands in yours and lead you off into the depths of the junk.");
	}
	//Hard: 
	else
	{
		output("<i>“If you want to fuck, cut the bullshit and let’s fuck,”</i> you say curtly. There’s a short silence.\n\n<i>“I like your style offworlder,”</i> the first raskvel says, as the three of them quickly clamber down to you. Chattering and laughing between you, they put their warm, smooth hands in yours and lead you off into the depths of the junk.");
	}
	// Go to cons gang bang
	processTime(2);
	clearMenu();
	addButton(0,"Next",consensualGangBang);
}

//Don’t
public function dontBuyScrapShit():void
{
	clearOutput();
	showRaskGang();
	output("<i>“You must think I dropped off a shuttle here yesterday,”</i> you say, shaking your head.");
	output("\n\n<i>“You mean you didn’t?”</i> replies one of the raskvel curiously.");
	output("\n\n<i>“Leave [pc.himHer] be, brother,”</i> sighs the first. <i>“Some people wouldn’t know a good deal if it bit them on the bum.”</i> They disappear back into the junk with their find.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Buy It
public function buySomeJankJunkJunk(lootType:Array):void
{
	clearOutput();
	showRaskGang();
	output("<i>“You’ve got a deal,”</i> you say, plucking a blank credit chit from your belt.");
	output("\n\n<i>“What, really?”</i> chokes the middle one.");
	output("\n\n<i>“Shut up! Here you go, offworlder,”</i> says the third, clambering down and carefully handing over his find for the money. He helps you strap it to your back.");
	output("\n\n<i>“Take it back to Novahome,”</i> chuckles the first. <i>“Any junk dealer will buy it off you for twice, thrice the price.”</i>");
	output("\n\nThat sense of heartiness that hovers somewhere between maliciousness and friendliness persists as you bid the raskvel goodbye. You just hope you’re the one laughing once you get your purchase back to Novahome.");
	var actualPrice:int = 5 + rand(2001);
	var raskLootType:int = lootType[0];
	switch(raskLootType)
	{
		case 0: pc.createKeyItem("Locked Metal Chest",actualPrice,0,0,0); break;
		case 1: pc.createKeyItem("Some Sort of Shining Spaceship Part",actualPrice,0,0,0); break;
		case 2: pc.createKeyItem("Intact, Antique Android",actualPrice,0,0,0); break;
		case 3: pc.createKeyItem("Bulky Data-Core",actualPrice,0,0,0); break;
	}
	pc.credits -= lootType[1];
	processTime(3);
	output("\n\n(<b>Gained Key Item: ");
	switch(raskLootType)
	{
		case 0: output("Locked Metal Chest"); break;
		case 1: output("Spaceship Part"); break;
		case 2: output("Antique Android"); break;
		case 3: output("Blocky Data-Core"); break;
	}
	output("</b> - You can try to sell this to one of the vendors back onboard Novahome.)");
	
	processTime(7);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*Notes

The raskvel sell it for 100-1000 credits. How much they sell it for has nothing to do with its value, which is a random number between 5 and 2000 credits assigned upon purchase which can be modified by who you take it to.

All four of Tarkus’s vendors are in some way classified as scrap dealers, so all four have been accounted for.

//Add “sell scrap” to each of their main menus

Tooltip: See what you can get for the piece of scrap you purchased from the raskvel, if anything.
*/

//Shekka
//SHEKKA will not buy anything you bring her EXCEPT the android, which she will offer 1.75x the value for, AND the spaceship part, which she also offers 1.75 for.
public function shekkaGetsSoldRaskShitz():void
{
	clearOutput();
	showShekka();
	var raskLootType:int = getRaskLootType("Shekka");
	output("<i>“What would you give me for...”</i> you untie the " + getRaskLootString(raskLootType) + " from your back and plonk it down on the raskvel’s counter as grandly as you can, <i>“...this?”</i>");
	
	//Spaceship part
	if(raskLootType == 1)
	{
		if(shekkaIsCrew()) output("\n\n<i>“That doesn’t look like something that’d work with your ship. I’m not much of a scrapper, but I don’t... think...”</i> The small woman thinks a bit, then throws up her arms in resignation. <i>“Fine, I’ll take it off your hands. How does " + Math.round(getRaskLootPrice()*1.75) + " sound? C’mon, it might just be junk metal.”</i>”</i>);");
		else 
		{
			output("\n\n<i>“That looks like something one of the technicians could use, sure, but I’m not much of a scrapper. I don’t... think...”</i> The small woman begins to trail off as she looks up and beyond you, a distracted frown forming on her face. When <i>you</i> look, there isn’t anything there but the doorway. Still, Shekka throws her hands up in the air in resignation.");
			output("\n\n<i>“Fine, fine. How does " + Math.round(getRaskLootPrice()*1.75) + " sound? C’mon, it might just be junk metal.”</i>");
		}
		processTime(2);
		clearMenu();
		addButton(0,"Deal",dealOnShipPartWithShekka);
		addButton(1,"No Deal",noDealOnShipPartWivShekka);
	}
	//Android: 
	else if(raskLootType == 2)
	{
		output("\n\nShekka’s eyes go round. <i>“Ooh. I’ve never seen that model before! Mind if I - ?”</i> you step back and allow her to pad over and run her inquisitive hands over the old robot. <i>“It looks pretty intact, too. I wonder what algorithms it uses? You can use older droids to do rough-edge stuff it’s so hard to program more recently produced droids to do, you know...”</i> You pull it back a few inches meaningfully when her fingers reach for its head. The raskvel laughs exasperatedly.");
		output("\n\n<i>“Oh, alright! How does " + Math.round(getRaskLootPrice()*1.75) + " credits sound?”</i>");
		processTime(2);
		clearMenu();
		//[Deal] [No Deal]
		addButton(0,"Deal",sellARobotToShekka);
		addButton(1,"No Deal",noDealRobotSellingToShekka);
	}
	//Anything but the android or the spaceship part:
	else
	{
		output("\n\nShekka peers at what you’ve brought her dubiously.");
		output("\n\n<i>“I’m not really a scrapper, [pc.name],”</i> she replies. <i>“That’s more that weird gabilani’s thing. I mean, I’ll take it off your hands to use for spare parts, but I can’t pay you anything for it.”</i>");
		//[Give] [Don’t]
		clearMenu();
		addButton(0,"Give",giveStupidShitRaskPartsToShekkaFree);
		addButton(1,"Don’t",dontGiveShitToShekka);
	}
}

//Give:
public function giveStupidShitRaskPartsToShekkaFree():void
{
	clearOutput();
	showShekka();
	output("It’s just a relief to get it off your back in all honesty. You shrug and let Shekka hobble away with it into the back, leaving you to feel slightly resentful about the raskvel race as a whole.");
	removeRaskLoot();
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Don’t: 
public function dontGiveShitToShekka():void
{
	clearOutput();
	showShekka();
	output("You shrug and take it back, resolving to try your luck with it elsewhere.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//No Deal: 
public function noDealRobotSellingToShekka():void
{
	clearOutput();
	showShekka();
	output("<i>“Not enough,”</i> you reply calmly. <i>“A decent piece like this is worth way more by my reckoning.”</i>");
	output("\n\nShekka looks at you incredulously.");
	output("\n\n<i>“Really? Well, good luck with that. Because you won’t be offloading it on me now.”</i> She flounces back behind her counter, piercings jangling angrily.");
	//”Sell scrap” ghosted out for her as long as PC is still holding this piece
	flags["SHEKKA_SCRAP_DISABLED"] = 1;
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Deal:
public function sellARobotToShekka():void
{
	clearOutput();
	showShekka();
	output("You help her take the robot into the back, after which she returns to her inventory screen. A few moments later, your bank balance is updated.");
	output("\n\n<i>“I’m gonna have a lot of fun with that, I can tell,”</i> Shekka grins. <i>“Nice find [pc.name], and thanks for letting me have it.”</i>");
	pc.credits += Math.round(getRaskLootPrice()*1.75);
	removeRaskLoot();
	processTime(6);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Deal
public function dealOnShipPartWithShekka():void
{
	clearOutput();
	showShekka();
	if(!shekkaIsCrew())
	{
		output("You stop yourself from going to help stow the machinery away when Shekka merely flops back down in her seat, crossing her arms with a surly expression on her face. Before you can ask why, someone comes bursting into the room above you and yanks the part up in her hands like an expert thief.");
		//If you haven't met Aurora, you swine:
		if(flags["MET_AURORA"] == undefined) output("\n\nThe child’s haphazard");
		else output("\n\nAurora’s haphazard");
		output(" motions are like a dangerous pendulum, a heavy wrecking ball that threatens to sprawl you across the floor with a blow to the head. You can only watch in surprise as she skitters along the ceiling, grasping her dexterous claws into exposed piping, perforated tiles, lights, and whatever else happens to be around to get back into the hall and, you assume, her workshop, all the while giggling with glee at her new toy.");
		output("\n\n<i>“I’m sure she’s behaved...”</i> grumbles the woman behind you as she transfers the credits to your account. Well, you’ve made someone happy.");
	}
	else
	{
		output("You toss Shekka the machinery and catch the credits in return.");
		output("\n\n<i>“Aurora’s gonna fucking die when she sees this,”</i> Shekka chirps. <i>“I hope she’s behaving...”</i>");
	}
	processTime(3);
	pc.credits += Math.round(getRaskLootPrice()*1.75);
	removeRaskLoot();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//No deal
public function noDealOnShipPartWivShekka():void
{
	clearOutput();
	showShekka();
	output("<i>“For this thing? That’s practically the amount I’d pay for someone to lug it around in the first place!”</i>");
	output("\n\n<i>“Hey! Watch it, you. Credits don’t spawn on trees around here, there’s plenty of trash to go around. You just made someone </i>very<i> unhappy, though.”</i> Shekka crosses her arms, looking up to you with a stern expression. <i>“That’s was my only offer. ");
	if(!shekkaIsCrew()) output("Go chuck it at the gabilani, then.");
	else output("Go chuck it at someone else on Tarkus, then.");
	output("”</i>");
	//”Sell scrap” ghosted out for her as long as PC is still holding this piece
	flags["SHEKKA_SCRAP_DISABLED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Colenso
//COLENSO will buy anything at 0.5 the value EXCEPT the metal chest, which he will offer 1.5x the value for.
public function sellRaskShitToColenso():void
{
	clearOutput();
	showColenso();
	var raskLootType:int = getRaskLootType("Colenso");
	output("<i>“What would you give me for...”</i> you untie the " + getRaskLootString(raskLootType) + " from your back and plonk it down on the counter as grandly as you can, <i>“...this?”</i>");
	//Chest:
	if(raskLootType == 0) 
	{
		output("\n\n<i>“Let’s have a... what the blimmin ‘eck is this?”</i> The heavily built gabilani rolls his chair over to you, fumbles a jeweller’s glass into one eye and then stares at the locked metal chest you have landed on his counter.");
		output("\n\n<i>“Where did you find it? Do you have the key? No... no, obviously not.”</i> He strokes the lid, entranced. <i>“Well secured locker like this wouldn’t have no key knocking around with it. Whoever locked it wouldn’t want ANYONE getting inside... prob’ly even if you FOUND the key and put it in, it would just release poison gas or something, you’d have to turn it the right way and know a voice activated code as well, and... What could be inside? What desperate galactic secrets have been buried in the junkyards this whole time? You’d better give it to me, " + pc.mf("guv","luv") + ". You wouldn’t be able to trust anyone else to get inside safely, and then disseminate the contents to the masses responsibly... I could liveblog me opening it on the Truth3000!”</i> You deliberately shift the chest back towards you. Colenso grits his teeth and grips the air in the direction of it instinctively.");
		output("\n\n<i>“Nngh... alright. " + Math.round(getRaskLootPrice()*1.5) + " credits. That’s more ‘n reasonable.”</i>");
		processTime(2);
		//[Deal] [No Deal]
		clearMenu();
		addButton(0,"Deal",dealWivColensoForTheChestGuv);
		addButton(1,"No Deal",noDealOnTheChestCommaColenso);
	}
	else
	{
		output("\n\n<i>“Let’s have a butcher’s.”</i> The heavily built gabilani rolls his chair over to you, affixes a jeweller’s glass to one eye and then spends what seems an inordinate amount of time considering what you’ve brought him from every possible angle.");
		output("\n\n<i>“Mmm. Weeeell,”</i> he rumbles eventually with an air of great reluctance, rubbing his chin. <i>“Mass produced, not in great nick, difficult to move this kind of thing on. But since me and you go way back, I’ll take it off your hands for " + Math.round(getRaskLootPrice()*.5) + " credits, as a favor. That’s ripping my own arm off, mind.”</i>");
		processTime(2);
		//[Deal] [No Deal]
		clearMenu();
		addButton(0,"Deal",dealColensoIllSellYouGenericScrap);
		addButton(1,"No Deal",noDealOnGenericSpecialRaskScrapColenso);
	}
}

//No Deal: 
public function noDealOnGenericSpecialRaskScrapColenso():void
{
	clearOutput();
	showColenso();
	output("<i>“Not enough,”</i> you reply calmly. <i>“A decent piece like this is worth way more by my reckoning.”</i>");
	output("\n\nColenso shrugs easily, removing his glass.");
	output("\n\n<i>“Your call, " + pc.mf("guv","luv") + ". Good luck hocking it elsewhere – you’ll need it.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Deal:
public function dealColensoIllSellYouGenericScrap():void
{
	clearOutput();
	showColenso();
	output("You heave across the bulky metal, and Colenso updates your bank account with a few taps of his screen.");
	output("\n\n<i>“Difficult to find really good scrap these days,”</i> he sighs. <i>“The rask have picked most everything worthwhile around Novahome clean. Still, keep trying eh? Ol’ Colenso will have a looksie at everything you bring him, if nothing else.”</i>");
	pc.credits += Math.round(getRaskLootPrice()*.5);
	removeRaskLoot();
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//CHEST
//No Deal
public function noDealOnTheChestCommaColenso():void
{
	clearOutput();
	showColenso();
	output("<i>“Not enough,”</i> you reply calmly. <i>“A decent piece like this is worth way more by my reckoning.”</i>");
	output("\n\nColenso practically explodes.");
	output("\n\n<i>“I...pbbt...no! Let me have it! I can’t... fine. Fine!”</i> he flings his arms into the air in absolute disgust, almost falling out of his chair. <i>“Sell it back to the man then, for all I care! ‘Ope they slit yer throat in the bargain, you rotten merc!”</i>");
	//”Sell scrap” ghosted out for her as long as PC is still holding this piece
	flags["COLENSO_SCRAP_DISABLED"] = 1;
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Deal: 
public function dealWivColensoForTheChestGuv():void
{
	clearOutput();
	showColenso();
	output("Colenso stabs at his console a few times, and a couple of seconds later your bank balance is updated. The gabilani runs his hands over his new acquisition lovingly.");
	output("\n\n<i>“You’re a star, [pc.fullName],”</i> he says, grinning happily. <i>“You can’t put a price on buried secrets like these, just can’t. Find anything like this out in the wastes again, bring it right here.”</i>");
	pc.credits += Math.round(getRaskLootPrice()*1.5);
	removeRaskLoot();
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Anno
//ANNO will not buy anything EXCEPT the data core which she will offer 1.75x the value for.
public function tryToSellAnnoSomeRaskScrapGuv():void
{
	clearOutput();
	showAnno();
	var raskLootType:int = getRaskLootType("Anno");
	output("<i>“What would you give me for...”</i> you untie the " + getRaskLootString(raskLootType) + " from your back and plonk it down on the ausar’s floor as grandly as you can, <i>“...this?”</i>");
	processTime(2);
	//Anything but the core:
	if(raskLootType != 3)
	{
		output("\n\nAnno looks at what you’ve brought her askance and then is quiet for a time, as if trying to think of the politest way of putting something.");
		output("\n\n<i>“I appreciate the effort you’ve gone to, bringing this all the way back here boss,”</i> she says eventually. <i>“But...");
		if(annoIsCrew())
		{
			if (flags["ANNO_MISSION_OFFER"] == 3) output(" while it’s great working for ya, I’m not really a pawn shop, you know?");
			else output(" even though I know some contacts that might be interested, I don’t think this will sell very high on the markets at all. The price to ship it off is probably worth more than what you’d get in return.");
		}
		else output(" this isn’t really a pawn shop. I mean, what would it look like if I were buying random bits of junk off Victor’s " + pc.mf("son","daughter") + " and not doing that for anyone else?");
		output(" Try Colenso. He’s the serious scrap dealer in Novahome. For a certain value of serious, anyway.”</i>");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Data core:
	else
	{
		output("\n\nAnno peers at what you’ve brought her interestedly.");
		output("\n\n<i>“Is that -? Let me take a look.”</i> She rummages around in her back room and then trots around to you with a tangle of wires and a power source, before poking and twiddling around with the hulk of severed plastic and metal. <i>“Seems to be still functioning. People throw away stuff like this wholesale with malfunctioning or outdated machinery, and I will never understand why – memory is valuable, always has been, always will be. There may even be one or two interesting things stored on it, who knows...”</i>");
		output("\n\n<i>“So?...”</i> you say meaningfully. Anno pauses, then simpers.");
		output("\n\n<i>“I’m not supposed to. But I can really use cores like this for my research. When you’re dealing with macro-data, you wouldn’t believe how much memory... is " + Math.round(getRaskLootPrice()*1.75) + " credits alright?”</i>");
		//[Deal] [No Deal]
		clearMenu();
		addButton(0,"Deal",itsADealAnnoBossDataCore);
		addButton(1,"No Deal",noDealonCoresAnno);
	}
}

//No Deal:
public function noDealonCoresAnno():void
{
	clearOutput();
	showAnno();
	output("<i>“Not enough,”</i> you reply calmly. <i>“A decent piece like this is worth way more by my reckoning.”</i>");
	output("\n\nAnno sighs, and then click off her power source.");
	output("\n\n<i>“Yeah. I shouldn’t be throwing around");
	if(annoIsCrew())
	{
		if (flags["ANNO_MISSION_OFFER"] == 3) output(" our funds on questionable items anyway");
		else output(" my earnings so recklessly");
	}
	else output(" unauthorized company money anyway");
	output(". Good luck with getting a good price for it elsewhere, boss.”</i>");
	//”Sell scrap” ghosted out for her as long as PC is still holding this piece
	flags["ANNO_SCRAP_DISABLED"] = 1;
	processTime(2);
	clearMenu();
	if(annoIsCrew()) addButton(0,"Next",annoFollowerMenu);
	else addButton(0,"Next",mainGameMenu);
}

//Deal: 
public function itsADealAnnoBossDataCore():void
{
	clearOutput();
	showAnno();
	output("You accept the ausar’s payment and then help her haul it into the back.");
	output("\n\n<i>“Enjoy the credits boss,”</i> she grins once it’s done. <i>“You’ve earned them.”</i>");
	pc.credits += Math.round(getRaskLootPrice()*1.75);
	processTime(2);
	removeRaskLoot();
	clearMenu();
	if(annoIsCrew()) addButton(0,"Next",annoFollowerMenu);
	else addButton(0,"Next",mainGameMenu);
}
 
//Aurora
//AURORA will not buy anything. Apparently.
public function tryToHawkRaskShitToAurora():void
{
	clearOutput();
	auroraBust();
	var raskLootType:int = getRaskLootType("Aurora");
	output("<i>“What would you give me for...”</i> you untie the " + getRaskLootString(raskLootType) + " from your back and plonk it down on the bat kid’s floor as grandly as you can, <i>“...this?”</i>");

	//(Anything at all) 
	output("\n\n<i>“Huh? Hey! I’ve seen that before! It always looked like trash to me, up above... but I’m not allowed to buy anything, they don’t let me ‘hold the wallet’.”</i> In some show of childish indignation, the pint-sized girl puffs her cheeks out adorably. <i>“Shekka is, though! She’s... probably an adult! Go ask her! And hurry, too, I wanna look at it!”</i>");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Combat Texts
//Description
//You are fighting the raskvel gang. The three red-scaled males, their big, rabbit-like ears and blunt tails swinging as they move, have you surrounded. The biggest one, a good four foot two, is brazenly naked and is using his fists and feet for weapons. The other two have harnesses around their waists and are swinging heavy wrenches. Though short, all three of them are pretty strongly built: tight, unostentatious muscle bulges underneath their smooth, rusty skin, particularly in their thick thighs. {Lust 0-40: Their dicks are hidden away in their sheaths, although their snug, pouch-like balls are clear to see.} {41-80: Their brilliantly purple cocks, the same color as their long tongues, have protracted some of the way out of their sheaths. The three of them seem distracted and even redder in the face than usual.} {81-100: Their thick, sleek dicks are straining urgently upwards, and it is taking obvious effort on their part to maintain their focus on you.} They have jolly, lively faces, and they laugh and call to each other as they fight you, as if they’re not taking this particularly seriously. Their attacks, though, are very definitely serious.

/*Likes/Dislikes

Feminine face: Really likes!
Gaping orifices: Really dislikes!
Small dicks: Kinda likes!
Big boobs: Dislikes!
Small boobs: Likes!
Broad hips: Really likes!
Multiple dicks: Dislikes!
Brightly coloured hair: Really likes!
Tauric: Really dislikes!

Suggested Stats

Level 4
Shields 30
Health 75
Initial Lust 35

//Stick em to the far west of the map is my advice.
*/

//Aphrodisiac Darts
//Pulled from female encounter and works exactly the same
//Use tweaked function from females:
//enemyAphrodisiacDarts()

public function victoryVsRaskGang():void
{
	//Raskvel loss texts
	//Via HP
	if(enemy.HP() < 1)
	{
		output("Your blow fells the big raskvel; he lands in a semi-comatose heap at your feet. The other two, all the laughter thoroughly thrashed out of them, take this as a sign to collapse as well, groaning surrender. You look down at the dusty pile of taut, burnished reptile muscle you’ve created, feeling rather satisfied.");
		if(pc.lust() >= 33) output(" You wonder if you’re quite satisfied enough, though.\n\n");
	}
	//Via Lust
	else
	{
		output("<i>“F-fuck,”</i> groans the big raskvel. He’s fallen to his knees, transfixed by your form, his hand a blur on his thick, purple erection.");
		output("\n\n<i>“You know, I’ve always hated fighting,”</i> mumbles one of the others, wrench falling from his hand.");
		output("\n\n<i>“Yeah. Make love, not war, that’s my motto,”</i> says the third, gazing at you dreamily.");
		output("\n\n<i>“Why don’t we celebrate this new spirit of serenity we have found with our new friend?”</i> wheezes the first, still looking at you with a kind of awe. <i>“We’d do anything. If it involved you. Anything.”</i>");
		output("\n\nYou laugh quietly to yourself as you consider it.\n\n");
	}
	clearMenu();
	addButton(14,"Leave",CombatManager.genericVictory);
	//Red Riding
	//Requires: Vagina
	if(pc.hasVagina()) addButton(0,"Ride ‘Em",redRidingRaskvel,undefined,"Ride ‘Em","Put their dicks to use in your slit, where they belong. The foolish little creatures should’ve let you take the lead all along!");
	else addDisabledButton(0,"Ride ‘Em","Ride ‘Em","You need a vagina to ride ‘em!");
	//Buttfuckery
	//Req: Cock that fits
	if(pc.cockThatFits(enemy.analCapacity()) >= 0 && pc.hasCock()) addButton(1,"Butt Fuck",raskMaleButtfuckery,undefined,"Butt Fuck","Give them a good reaming for inconveniencing you with their cute little butts.");
	else addDisabledButton(1,"Butt Fuck","Butt Fuck","You need a dick that’ll fit inside the raskvel in order to fuck their butts.");
}
public function lossVsRaskGang():void
{
	loseToRaskvelAndGetGangBangued();
}

//Sex
//Consensual Gangbang
//Just say no to centaurs and genderless
public function consensualGangBang():void
{
	setEnemy(new RaskvelMale());
	
	clearOutput();
	showRaskGang();
	userInterface.showBust("RASKVEL_GANG_NUDE");
	output("As you walk, hands begin to wander and the talk – which the raskvel seem to bounce between them equally – turns increasingly saucy. With supple scales pushing into you from all sides there’s plenty for you to grasp");
	if(pc.tallness >= 84) output(", even if you do have to reach a distance down to get at it");
	output(", and by the time they lead you to their cubbyhole underneath a massive leaning crane you are feeling hot, at ease and more than glad you’ve got three of them all to yourself, ");
	if(pc.hasCock()) output("your [pc.cocks] stiffening");
	if(pc.hasCock() && pc.hasVagina()) output(" and ");
	if(pc.hasVagina()) output("your [pc.vaginas] moistening and puffing up");
	output(" as multiple mischievous fingers slide between your inner thighs.");

	output("\n\nThe space in here is scruffy - the walls and ceiling decorated with the oddities the trio have found in their scavenging - but padded with plenty of blankets and quite cosy, redolent with the pleasant smell of leather and wild, masculine musk. That intensifies as the three boyish raskvel surround you, laughing with soft delight as they ");
	if(!pc.isNude()) output("impatiently shuck your [pc.gear] off you and ");
	output("swaddle you in their tight, burnished scales, their increasingly urgent erections pressing into your [pc.skinFurScales].");

	output("\n\nYou feel leisured and sensuous at the center of attention, happy to allow your partners the initiative and bask in the impression of being treasured. You hump yourself up onto the lap of one, curling your hand around his neck whilst surrounding his thick, purple penis with your [pc.butt], smirking provocatively as you splay your thighs to the other two, displaying your [pc.crotch]. They don’t need any further encouragement.");
	if(pc.hasVagina())
	{
		output(" One of them wraps his hands around your thighs, slides his long, brightly colored tongue over your");
		if(pc.hasClit()) output(" [pc.clit]");
		else output(" labia");
		output(" teasingly before lapping at [pc.oneVagina] with it enthusiastically, quickly making it shine with pleasure.");
	}
	else output(" One of them wraps his hand around [pc.oneCock] and unspools his long, purple tongue. With a few teasing licks he’s got it sternly erect, and he wastes no time in sinking it into his mouth, running the soft, thin rasp of his mouth muscle along its sensitive underside.");
	output(" The other clambers over his brethren – earning him a muffled grunt of irritation as he manages to knee him in the head in his impatience – and sits his dense weight down on your [pc.belly]. You find yourself deeply appreciative of how long and flexible raskvel tongues are as this one’s flicks over your [pc.nipples], quickly making them ");
	if(pc.hasFuckableNipples()) output("wet");
	else output("wet");
	output(".");

	output("\n\nThe twin movement of the raskvel’s hungry mouths on the neediest tips of your body makes you feel like you are shimmering with pleasure, and you translate that into flaring your [pc.butt] into the one you are sitting on, embedding his cock between your cheeks and hotdogging it with increasing fervor as the raskvel below");
	if(pc.hasVagina()) 
	{
		output(" reaches his long tongue deep into you, caressing the most sensitive areas of your wet tunnel. You gasp and squeeze your hips into the sides of his head as you tense up and reach a small but perfectly formed high");
		if(pc.wetness() >= 4) output(", slathering his face in liberal amounts of lube as you do");
		output(".");
	}
	else if(pc.hasCock())
	{
		output(" slathers your length in tongue, squeezing as he continues to suckle your head. It’s all you can do to hold on, teeth-gratingly on the edge, and not orgasm on the spot.");
	}
	output(" The raskvel pinned down beneath you groans as you tense your butt-cheeks up around him and squeezes your flanks; you feel warm slime spurt up your back and crack. You frown back at him in disbelief. Has he really cum already? The youthful reptile blissfully opens his eyes and gazes back at you languidly.");

	output("\n\n<i>“Yeah, the" + (flags["LAPLOVE"] == undefined ? "y all":" lapinara") + " get surprised by that too,”</i> he says lowly. <i>“Do ");
	if(pc.mf("male","female") != "male") output("your males ");
	else output("offworlders ");
	output("only cum the once too, then? Sucks to be you.”</i> He shunts his still-very-much-erect-dick between your cheeks teasingly.");

	output("\n\n<i>“Sucks to be you,”</i> agrees his friend, who has crawled up your front, used his weight to lay you back into the one behind you and is presenting his seven inch purple dick to your face. You gaze up at him slyly before licking his tip, tantalizing him with it and tasting his musk before enveloping it with your [pc.lips] and swallowing his smooth hardness whole, earning a delighted groan as you do. You’ve barely gotten down to the base when he tenses up, grabs your shoulders and ejaculates; again, one single pump of thick semen, coating the back of your mouth, and just like the other one, he stays rock hard.");

	output("\n\nHe spreads his fingers across the back of your head and continues to piston his length between your lips, his orgasm only seeming to intensify lust. His heady urgency is evidently infectious. You arch your back and give out a muffled gasp as the raskvel beneath you spreads your cheeks and with a satisfied grunt pierces your [pc.asshole] with the thick, pointed dick you’d thought you’d teased into submission. You tense up around him and feel yet more liquid warmth fire into your insides.");
	if(pc.ass.wetness() > 1 || pc.ass.looseness() >= 3) output(" Not that your slutty, always-ready back passage needed it, but ");
	else output(" Whether he meant to do it or not, ");
	output("this makes his penetration of you much easier; he slides into your cum-oiled tunnel with ease, bucking his powerful hips into your [pc.butt] as he fills you. The one between your legs meanwhile has taken the opportunity to clamber up and mount you.");
	pc.buttChange(enemy.cockVolume(0),true,true,false);

	//ifVag:
	if(pc.hasVagina()) 
	{
		output("\n\nWith a flat reptile stomach flapping eagerly against your face, you can’t quite see but can definitely can feel another raskvel plunging his own hot cock deep into your [pc.vagina], clutching your thighs and beginning to pump into you. The sensation of twin lizard pricks pushing into each other through your sensitive walls is unbearably good and you can’t help but give out a wet squeal around the one in your mouth, your pussy oozing excitement around the raskvel’s smooth, girthy, rubbing fuck.");
		pc.cuntChange(0,enemy.cockVolume(0),true,true,false);
		//ifmultiVag:
		if(pc.totalVaginas() > 1) 
		{
			output("\n\nYour pleasure becomes inhumanely delirious when a blunt, questing tail finds your [pc.vagina 1] and thrusts inside, the raskvel to whom it belongs chuckling to himself as you squirm around him.");
			pc.cuntChange(1,enemy.cockVolume(0),true,true,false);
		}
	}
	//ifnoVagBUTcunttail: 
	else if(pc.hasCuntTail()) 
	{
		output("\n\nHe seems momentarily thrown about what to do – but your ever-hungry [pc.cuntTail], sopping and blossoming with frustration at being left out, solves that for him. The raskvel grunts with surprise and then delight as of its own volition it slithers out from beneath you and clamps itself down on his thick erection, immediately beginning to milk it hard. It may be out of your control but you certainly can feel every succulent pump and jerk of your tail’s sensitive innards around the reptile’s dick; you " + pc.mf("groan","moan") + " around the one in your mouth, utterly subsumed in sex.");
	}
	else
	{
		output("\n\nWhat with a flat reptile stomach flapping against your face, you can’t see but can definitely feel a pair of hands reaching around both your [pc.cock] and his, pressing his hot, thick erection against yours and beginning to thrust. He is heavy and fervent in his mutual masturbation, and you tense up in delight at the sensation of hot, smooth hands and dick planing over your own. You groan your approval around the one in your mouth, trying to spur him on.");
	}

	output("\n\nGetting triply dicked like this quickly drives you to orgasm, your whole body quaking as ");
	if(pc.hasCock())
	{
		output("[pc.eachCock] tenses up and ");
		if(pc.cumQ() < 100) output("spurts");
		else output("fountains");
		output(" [pc.cum]");
		if(!pc.hasVagina() && !pc.hasCuntTail()) output(" over the one engaged with it");
	}
	if(pc.hasVagina())
	{
		if(pc.hasCock()) output(", and ");
		output("your [pc.vaginas] ");
		if(pc.totalVaginas() == 1) output(" ripples and tightens up around its juicy, swollen insertion");
		else output(" ripple and tighten up around their juicy, swollen insertions");
	}
	//Cunt tail previous scene is exclusive with the others
	else if(pc.hasCuntTail() && !pc.hasCock())
	{
		output("your cunt-tail dribbles excitement, doing its level best to wring the raskvel dick it’s battened onto dry");
	}
	output(". The three supple reptiles slow down in sympathy as you gasp your breath back, but they are still hard and pressed into you, and have no intention of letting you go so easily. They chuckle and banter to each other in low voices as they move you around, letting each other enjoy different parts of you and pressing their girthy, purple sexes into your sensitive holes in fresh positions. You quickly get absolutely plastered with gooey raskvel cum, but it’s difficult to care when there’s two hard cocks in ");
	if(!pc.hasVagina()) output("your [pc.butt]");
	else output("your [pc.vaginas]");
	output(" at once whilst the other ");
	if(pc.canTitFuck()) 
	{
		output("pushes your [pc.chest] together and rams his erection between them, ");
		if(!pc.hasFuckableNipples()) output("gently pinching");
		else output("fingering");
		output(" your [pc.nipples] as he does");
	}
	//ifnoboobs:
	else 
	{
		output("rams his erection into the softness between your inner arm and chest, using your armpit whilst gently ");
		if(!pc.hasFuckableNipples()) output("pinching");
		else output("fingering");
		output(" your [pc.nipples]");
	}
	output(".");

	output("\n\nEventually, the biggest one bends you over, and the other two gather at your front end. He grasps your flanks and uses his thick hips to rail your [pc.vagOrAss] as hard as he can, every half second applying his cock to your tender and needy ");
	if(pc.hasVagina()) output("g-spot");
	else output("prostate");
	output(" with extreme prejudice. The vigorous action jerks you into the dense sex of the one using your mouth, pushing your [pc.lips] right up to his glossy groin and tightening, pouch-like balls. A spit roast as frantic as this takes up almost all of your available attention but still, the pants and approving exhalations of the raskvel whose hot, bulging dick you’re coiling with your hand tells you you’re still doing pretty well by his measure.");

	output("\n\nA cloud of deep, heavy fucking gathers and holds for a couple of wonderful, sweaty minutes – and then breaks as the one behind you drives you to a final orgasm, ");
	if(pc.hasCock()) output("[pc.eachCock] flexing out hot [pc.cumNoun] onto the blankets almost as far as your face");
	if(pc.hasCock() && pc.hasVagina()) output(", and ");
	if(pc.hasVagina()) output("[pc.eachVagina] quaking and seeping wet excitement");
	output(" in response to his energetic thrusting. You moan happily around the big, purple cock in your mouth, spreading your tongue along its sleek underside, allowing the pounding you’re taking from behind do all the forward work, and are rewarded a moment later when the raskvel clutches your [pc.hair] reactively and groans in exultant orgasm, shooting a thick load down your throat. The other two last a little longer and you float blissfully on a symphony of ecstatic male gasps and exultations, gratified by your ability to occupy three youthful fucks at once, until your tightening hand and [pc.vagOrAss] finally forces them over the edge, making them pulse their last into and onto you.");

	output("\n\nThey spoon into you once they’re all done, sleek scales padding your [pc.butt], [pc.boobs] and [pc.legOrLegs], just one big pile of mutually satisfied, sticky flesh enjoying the afterglow.");

	output("\n\n<i>“One of our better break times that,”</i> murmurs one.");
	output("\n\n<i>“You’re a hell of a ride, offworlder,”</i> says another, heartfelt. <i>“Makes me want to get off this rock and see if you’re all as good as that.”</i>");

	output("\n\nAfter you’ve rested a while longer, they provide you with a towel to give yourself a quick clean-up before warmly waving you off. You watch them return with a certain roll in their step to their junk-pile before setting off in the opposite direction with your own, slightly tender movement.");
	processTime(65);
	for(var i:int = 0; i < 3; i++)
	{
		pc.loadInMouth(enemy);
		if(pc.hasVagina())
		{
			for(var v:int = 0; v < pc.vaginas.length; v++) { pc.loadInCunt(enemy, v); }
		}
		else pc.loadInAss(enemy);
		pc.applyCumSoaked();
	}
	pc.orgasm();
	pc.orgasm();
	if(pc.hasCuntTail()) feedCuntSnake(enemy);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	setEnemy(null);
}


//Buttfuckery
//Req: Cock that fits
public function raskMaleButtfuckery():void
{
	clearOutput();
	showRaskGang();
	userInterface.showBust("RASKVEL_GANG_NUDE");
	var x:int = pc.cockThatFits(enemy.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	var y:int = pc.cockThatFits2(enemy.analCapacity());
	//Just incase.
	if(y == x) y = -1;
	output("<i>“You!”</i> you say imperiously to the smallest one");
	if(!pc.isNude())
	{
		output(" as you begin to ");
		if(pc.isGoo()) output("ooze");
		else if(pc.isNaga()) output("slither");
		else output("step");
		output(" out of your [pc.gear]");
	}
	output(". <i>“You people always keep oil around, right? Go fetch some. Make sure it’s non-toxic: ");
	if(!pc.isAss()) output("you’ll be hearing about it from these two later if it isn’t");
	else output("it’s in your best interest, seeing as it’s going up your ass later");
	output(".”</i> The blunt implication settles heavily on the remaining duo and they mumble protests half-heartedly. You’ve asserted your authority over them however, proven by the fact that the smaller one rummages in his harness and throws you a bottle containing a clear fluid without a word and when you cut off the complaints of the other two with a curt <i>“Bend over”</i>, they do so immediately.");

	output("\n\nYou admire the sight, stroking [pc.oneCock] as you take in the mini-range of red scaly foothills you’ve called into existence in front of you, reveling in your dominance over the snack-sized fuck-boys. The bottom-heavy nature of the raskvel give them bigger bums than males of other species, dense and deep with muscle that clenches up timidly when you teasingly slap your erect girth between first one crack and then the other: perfect, you feel, for a good ramming. There’s plenty else to enjoy; as you unscrew the bottle and slather your increasingly urgent erection in warm, clinging lubricant you dip down between the thick legs of the middle-sized one and gently squeeze his cute, pouch-like scrotum, feeling the tightly-compressed gonads within and earning a gratifying gasp from its owner.");

	//No cock-tail, not high libido
	if(!pc.hasCockTail() && pc.libido() < 70)
	{
		output("\n\nIt’s fun to admire the pair of them but realistically you know you can only properly fuck one of them. That doesn’t stop you from teasing both for a little while longer, running your hands over their enjoyably compact and polished bodies at your leisure as you slide ");
		if(pc.cockTotal() > 1) output("each of your pricks");
		else output("your [pc.cock " + x + "]");
		output(" between their valleys and over their purple puckers before reluctantly slapping the medium one on a wide cheek.");

		output("\n\n<i>“Sorry to say, but I’ve only got time");
		if(pc.cockTotal() == 1) output(" and dick");
		output(" for one of you today,”</i> you murmur. <i>“Maybe next time you’ll get lucky though, who knows...”</i> he’s on his feet and scurrying away with his young friend back into the looming junk before you’ve finished. Maybe the pair of them will watch the show from their cover; your attention though is entirely on the big, mouthy one in front of you, the one you adjudged to be most in need of a good ass-fucking.");

		output("\n\n<i>“He would have been way better for this,”</i> he tries. <i>“I don’t – look, why don’t we call it a dr- Ack!”</i> You shush his whimpers by taking a firm hold of his shoulders and carefully spreading his sphincter with your oily prick, penetrating the delicious clinging warmth within.");
		pc.cockChange();

		output("\n\nThe raskvel certainly seems to be something of a novice to being on the receiving end, continuously tightening up and gasping harshly as you feed more and more of your [pc.cock " + x + "] into his tunnel; you suspect his size has something to do with that. In your mind this makes it even more important that he be forced to enjoy this, particularly as – you gasp as a series of contractions ripple up your cock – your initial impressions were correct, in raw physical terms he’s excellent. The heavy, supple padding of his broad behind feels wonderful against your groin");
		if(pc.balls > 0) output(" and [pc.balls]");
		output(" when you spear into him deep, and the fact of his dense form and the amount of labor he evidently engages in means he’s a wonderful squeeze all the way down.");

		output("\n\nIt’s a struggle to hold onto the urge to pile-drive into him, but you keep yourself responsive to his exertions, slowing down whenever it sounds and feels like he can’t take anymore, but continuously pushing his limit");
		if(pc.cockVolume(x) <= enemy.analCapacity()) output(" until you are happily giving him every bulging inch, your [pc.hips] patting purposefully against his");
		output(". You snake a hand between his legs and begin to briskly run it up and down his purple seven inch cock, which is flopping well out of its slit. It takes suspiciously little time for it to be fully erect, hot and straining in your grip. You grin to yourself and begin to pick up the pace, pumping your hips strongly into the raskvel’s behind as you continue to generously coil him. There’s no question about it now: he doesn’t gasp in pain and in resistance to what you are doing, but in forced, physical delight. You lose yourself in the tight, oily crease you’re thrusting your maleness into, no longer limiting your thrusting, beating out a solid rhythm with your [pc.hips]");
		if(pc.balls > 0) output(" and [pc.balls]");
		output(" on the brawny butt you’re thoroughly buried in.");

		output("\n\n<i>“You’re an excellent piece of ass,”</i> you murmur, stroking and occasionally gripping his long ears, your other hand still on his hot, straining cock. <i>“And let’s not pretend you don’t enjoy taking it like this. So I think in the future if you’re wanting a bribe you should be getting on your knees for me, what do you say?”</i>\n\nNothing is the answer, except a long series of catching groans as he orgasms, his purple prick jerking upwards again and again in your hand, spurting thick cum to your heavy thrusts. His well oiled tunnel clamps down on your own [pc.cock " + x + "] reactively, just as good as any pussy, and it is a joy to let go yourself a few moments later, using his dick and ear as moorings as you pump your seed into him with a series of ecstatic clenches.");
		if(pc.cumQ() >= 1500) output(" A creature as small as this has little chance of taking it all, and after you’ve rounded his belly out with your [pc.cum] plenty more spurts out around your girth as you continue to plunge your contracting cock.");

		output("\n\nYou rest against the grounded reptilian for a while after you’re done, still wedged into him, enjoying the buzz and the sweat drying on your brow. Your partner is in no shape to do anything but groan woozily, even when you do finally withdraw, a satisfying ");
		if(pc.cumQ() < 100) output("dribble");
		else output("gush");
		output(" of your cum following you out of his well-used boy-hole. You give him a friendly swat on the ass-cheek ");
		if(!pc.isNude()) output("as you climb back into your [pc.gear]");
		else output("as you sit on a rock to collect yourself");
		output("; by the time you turn back around he’s vanished, withdrawn to join his friends back in the junk, blunt tail thoroughly between his legs. You smile at the thought as you continue on.");
	}
	//Cock-tail, not high libido
	else if(pc.libido() < 70)
	{
		output("\n\nIt’s fun to admire the pair of them but realistically you know you can only properly fuck one of them. That’s what you’re thinking, at least, before red, alien lust twinges your nerves and a certain appendage reminds you of its presence by twitching and thickening up at the sight of the two raised rumps in front of you. You grin to yourself as you swing your [pc.cockTail] around; it’s oozing at the tip and practically bulging with indignation at your apparent will to leave it out of the action. You assuage it by flexing your [pc.hips] and lolloping its stem down with a fleshy smack between the butt-cheeks of the raskvel to the right of you.");
		output("\n\n<i>“You’re in luck, champ!”</i> you " + pc.mf("chuckle","giggle") + " lightly, running your hands over their enjoyably compact and polished bodies at your leisure as you slide each of your pricks between their valleys and over their purple puckers, enjoying the way they squirm. <i>“Guess I do have enough dick for the two of you!”</i>");
		output("\n\n<i>“Couldn’t you use the little guy for this?”</i> the biggest one ventures. <i>“I-I’m sure he’d be better suited- ack!”</i> You shush his whimpers by taking a firm hold of his shoulders and carefully spreading his sphincter with your oily prick, penetrating the delicious clinging warmth within. The other gasps in a similarly delicious timbre a moment later when you piston into his asshole with your cocktail, the amount of pre-cum it is excitedly dribbling more than enough to ease its passage inwards.");
		pc.cockChange();
		output("\n\n<i>“Your friend did a runner the moment he handed me the oil,”</i> you reply lowly, leaning back and taking a moment to revel in the sensation of having ");
		if(pc.cockTotal() > 1) output("two");
		else output("both of your");
		output(" cockheads encased in tight flesh, before taking hold of the big one’s flanks again and slowly driving forward, embedding yourself further and further into each passage with each passing moment. <i>“So it’s just you...”</i> You slap one wide butt cheek, sighing as he fleetingly tightens up on your [pc.cock " + x + "] in response, <i>“...you...”</i> your palm lands on another cheek, your [pc.cockTail] throbbing with approval as the other raskvel does likewise, <i>“and me.”</i> You begin to slowly pump your hips.");
		output("\n\nThe raskvel certainly seem to be novices to being on the receiving end, continuously tightening up and gasping harshly as you feed more and more of your [pc.cock " + x + "] and [pc.cockTail] into their tunnels. In your mind this makes it even more important that they be forced to enjoy this, particularly as – you gasp as a series of contractions ripple up your cock – your initial impressions were correct, in raw physical terms they are excellent. The heavy, supple padding of his broad behind feels wonderful against your groin ");
		if(pc.balls > 0) output("and [pc.balls] ");
		output("when you spear into him deep, your cock-tail just seems to keep finding more and more taut tunnel to wriggle into, and the fact that their dense forms and the amount of labor they evidently engage in mean they’re a wonderful squeeze all the way down.");

		output("\n\nIt’s a serious struggle to hold onto the urge to pile-drive into them, particularly with the deep lusts of your");
		if(pc.hasParasiteTail()) output(" parasitic tail");
		else output(" [pc.tail]");
		output(" pulling and biting at the strings of your subconscious, but you keep yourself responsive to their exertions, slowing down whenever it sounds and feels like they can’t take anymore, but otherwise determinedly pushing their limit");
		if(pc.cockVolume(x) <= enemy.analCapacity()) output(" until you are happily giving the one in front of you every bulging inch, your [pc.hips] patting purposefully against his");
		output(". You snake a hand between the big raskvel’s legs and begin to briskly run it up and down his purple seven inch cock, which is flopping well out of its slit. It takes suspiciously little time for it to be fully erect, hot and straining in your grip.\n\nYou grin to yourself and begin to pick up the pace, pumping your hips strongly into the reptilian’s behind as you continue to generously coil him. You can’t offer the same sort of service to the other one, but your tail seems to know what to do; without you directing it at all, it pulls back and drives into a pulpy spot in the raskvel’s walls over and over again which, given the way he clutches at the dirt and arches his back, gasping reactively, can only be his prostate.");

		output("\n\nSatisfied that it’s deep pleasure rather than pain you’re pushing onto them you begin to lose yourself in the tight, oily creases you’re flexing your maleness into, no longer limiting your thrusting, beating out a solid rhythm with your [pc.hips]");
		if(pc.balls > 0) output(" on the brawny butt you’re thoroughly buried in.");

		output("\n\n<i>“You’re an excellent piece of ass,”</i> you murmur, stroking and occasionally gripping the raskvel’s long ears, your other hand still on his hot, straining cock. <i>“And let’s not pretend you don’t enjoy taking it like this. So I think in the future if you’re wanting a bribe you should be getting on your knees for me, what do you say?”</i>\n\nNothing is the answer, except a long series of catching groans as he orgasms, his purple prick jerking upwards again and again in your hand, spurting thick cum to your heavy thrusts. Your eyes on him, you writhe your [pc.cockTail] aggressively into the other, reaching as much bulging prehensile goodness into his muscular ass as you can. He can’t take it and a few seconds later his wails are joining those of the first, his own dick sputtering and spurting white seed reflexively to your ruthless prostate milking. Delicious.");
		output("\n\nTheir well oiled tunnels clamp down on your own [pc.cock " + x + "] reactively, just as good as any pussy; thrusting into that sensation doubled is more than any mere mortal can enjoy for more than a few wonderful, juicy seconds. You take hold of one each of their flat ears and use them as moorings as you pump your seed into them with a series of ecstatic clenches.");
		if(pc.cumQ() >= 1500) output("\n\nCreatures as small as this have little chance of taking it all, and after you’ve rounded their bellies out with your [pc.cum] plenty more spurts out around your twin girths whilst you continue to plunge your contracting cocks into their quaking butts.");
		output("\n\nYou rest against the grounded reptilians for a while after you’re done, still wedged into them, enjoying the buzz and the sweat drying on your [pc.skinFurScales]. Your partners are in no shape to do anything but groan woozily even when you do finally withdraw, a satisfying ");
		if(pc.cumQ() < 100) output("dribble");
		else output("gush");
		output(" of your cum following you out of their well-used boy-holes. Your tail swings happily back to its spot behind your [pc.legOrLegs], oozing plant-seed and for once not bothering you with its insistent itch to use it. You give the two raskvel a friendly swat on the ass-cheek each ");
		if(!pc.isNude()) output("as you climb back into your [pc.gear]");
		else output("as you sit on a rock to collect yourself");
		output("; by the time you turn back around they’ve vanished, joining their friend back in the junk, blunt tails undoubtedly between their legs. You smile at the thought as you carry on.");
	}
	//High libido
	else
	{
		output("\n\nThe sight and texture of their polished, taut bodies feeds your growing lust until it feels like it’s thudding just behind your eyes – not that it needs much of an excuse to reach over your higher thinking and grab your impulses’ reigns these days anyway. The raskvels’ wide, muscular butts raised in supplication to you seems like a challenge being made directly to your " + pc.mf("masculine","hermaphrodite") + " prowess, one that makes your blood quicken and your [pc.cock " + x + "] strain upwards, demanding that you meet it, demanding that you pound into submission both... no, all three of these ill-mannered assholes that had the audacity to accost you.");
		output("\n\nPresumably some of what you are thinking is showing on your face, because the one that handed you the oil is backing away as quickly and unassumingly as he can. Grinning, you silently point at him and then at the space besides the big one. Shakily, he comes.");
		//1 cock:
		if(y < 0 || pc.cockTotal() == 1) output("\n\n<i>“Ass up, and wait your turn,”</i> you say tartly. You slide your [pc.cock " + x + "] between their valleys and over their purple puckers in turn, reveling in the sight, tantalizing yourself with what is to come. The smallest raskvel has a pretty cute ass; rounder, softer and more pert than the other two. That’s for later, though. You concentrate on the big one in front of you, the one you adjudge to be most in need of a good ass-fucking. Even now he’s shooting his mouth off.");
		//>1 cock: 
		else
		{
			output("\n\n<i>“Suck,”</i> you demand tartly, pointing at your [pc.cock " + y + "]. After composing himself the smallest raskvel wraps his smooth, dry hands around the base of it");
			if(pc.tallness >= 70) output("; he doesn’t even need to get on his knees");
			output(". You close your eyes as pleasure wriggles down your dick as a long, thin tongue laps at its tip and then spreads his lips over your head. Mired in desire, you slide your [pc.cock " + x + "] over the valleys and purple puckers of the other two, reveling in the sight, tantalizing yourself with what is to come.");
			if(pc.cockTotal() > 2) output(" A crazy but undeniably attractive image flits before your eyes, of a stack of facedown raskvel, you ploughing them all at the same time... but no, even in your current state you accept that probably wouldn’t work.");
			output(" You growl soft instructions to the one blowing you, positioning him directly in front of the biggest one, the one you adjudge to be most in need of a good ass-fucking. Even now he’s shooting his mouth off.");
		}
		output("\n\n<i>“This is - what you’re doing is a bit crazy offworlder. Biting off more than you can chew, if you don’t mind me saying,”</i> he ventures. The medium one mumbles in agreement. <i>“Maybe if you were raskvel you could try this, but – ack!”</i> You shush him up by taking a firm hold of his shoulders and carefully spreading his sphincter with your oily prick, penetrating the delicious clinging warmth within.");
		pc.cockChange();
		output("\n\nThe raskvel certainly seems to be something of a novice to being on the receiving end, continuously tightening up and gasping harshly as you feed more and more of your [pc.cock " + x + "] into his tunnel; you suspect his size has something to do with that. In your mind this makes it even more important that he be forced to enjoy this, particularly as – you gasp as a series of contractions ripple up your cock – your initial impressions were correct, in raw physical terms he’s excellent.");
		output("\n\nThe heavy, supple padding of his broad behind feels wonderful against your groin ");
		if(pc.balls > 0) output("and [pc.balls] ");
		output("when you spear into him deep, and the fact of his dense form and the amount of labor he evidently engages in means he’s a wonderful squeeze all the way down.");
		if(pc.cockTotal() > 1) output("\n\nThe same motion that drives your first cock into his ass slides your second into the wet, silken grasp of the sucking mouth between your legs; the smallest raskvel copes with your thrusting well, very well, his long tongue slithering along your sensitive underbelly, and you feel sweat stand out on your brow to how good the double penetration feels.");
		//1 cock: 
		else output("\n\nWhilst you sink your cock again and again into the big raskvel you keep your hands on the other two, cupping their ass cheeks and reaching between their legs, teasing their cocks out of their pockets. You want to keep them involved in the action – and to stop them from going anywhere.");
		//>1 cock:
		if(y >= 0) output("\n\nWhilst you sink your cock again and again into the big raskvel you keep one hand wrapped around the smallest one’s head, gently pushing him into your [pc.cock " + y + "], and the other on the medium one, still crouched to the side. You cup his ass cheeks and reach between his legs, teasing his cock well out of its pocket. You want to keep him involved in the action... and ensure he doesn’t go anywhere.");
		output("\n\n<i>“You’re next, handsome!”</i> you sigh, squeezing your fingers through the ring of the middle one’s anus, testing and loosening him as you thrust ");
		if(pc.cockVolume(x) > enemy.analCapacity()) output("as much of your");
		else output("every inch of your");
		output(" [pc.cock " + x + "] into his friend’s quaking tunnel as you can; he whimpers, the dirty <i>thwap thwap thwap</i> of your [pc.hips] on the bigger one’s butt translating into his own brawny flesh. Your intention to keep your thrusting slow and measured is lost in a red mist of lust as your ");
		if(pc.balls == 1) output("ball tightens");
		else if(pc.balls > 1) output("balls tighten");
		else output("your seed rises");
		output(" and you pound into him with everything you’ve got. You are now interested only in claiming every inch of his body that you can for your straining dick, and the way you fuck him <i>tells</i> him that.");
		output("\n\nStill, even before you’ve reached your own high he orgasms with a series of catching gasps, his purple prick jerking upwards again and again as you pound his prostate. You hold onto his long ears, use them as handlebars and pump [pc.cum] into his seizing-up tunnel, sighing with delight as you finally bury some of your tightly packed heat in there with a series of clenches that ");
		if(pc.cumQ() < 1500) output("has your cum dribbling out around your girth");
		else output("quickly rounds the raskvel’s belly out with your copious seed, spurting out around your girth as you completely fill him out.");
		//>1 cock: 
		if(y >= 0)
		{
			output("\n\nThe smallest raskvel copes with your change of pace admirably, even when you penetrate the tight squeeze of his throat in your mania, keeping his wet lips and tongue moving across your urgently thrusting [pc.cockNounSimple " + y + "]. Just as much [pc.cum] surges into his mouth as his brethren’s butt, however he swallows it down uncomplainingly. You wheeze deliriously to the twin orgasm rocketing through you, made all the better by having both dicks mired deep in warm, clinging hole.");
		}
		output("\n\nIt’s not enough, though. You slide the limp, groaning raskvel off your [pc.cock " + x + "] and sigh with exaggerated frustration when you get visual confirmation of what you can already feel – you are still rock hard, still itchy and fevered with lust.");
		if(pc.cockTotal() > 1) output(" The smaller one flops down to one side, cum dripping from his mouth, looking dazed. Your attention is not on him, though.");

		output("\n\n<i>“A single dance with me and your friend is ready to call it quits,”</i> you observe, disdainfully taking in the pile of quivering scales at your feet before moving across, planting your hands on the medium one’s flanks. He tenses up - which you think is unwise, given the circumstances. <i>“Maybe you’ve got a bit more lasting power? Let’s see.”</i>\n\nWithout missing a beat you plough your cum-slicked member straight into his readied boy hole, grunting with fierce enjoyment at the unmistakable pleasure of driving your sex into a fresh, tight tunnel. He wails, clawing at the ground, and you wait for him to get used to it – before indomitably carrying on, sliding out and pushing in, each time reaching further into his warm guts.");
		output("\n\nFor all his caterwauling he’s every bit as enjoyable a fuck as the first, and just like the first he cannot help but be turned on by the firm passage of your [pc.cockHead] over his deeply planted sweet spot, and his purple erection is soon batting against his flat stomach as surely as your ");
		if(pc.balls > 1) output("[pc.balls]");
		else output("[pc.hips]");
		output(" are against his behind. Now that you’re thrusting deep into him you have zero interest in providing him with service, though – this is all about you, using every piece of cocksure ass available to satiate yourself and demonstrate exactly who is number one around here.");
		output("\n\nStill... out of the corner of your eye you notice that, whilst the first raskvel is insensate the other has sat up and is watching your exertions in a kind of stupor, his own fairly small prick quite erect. He could probably have gotten away whilst you were engaged with the other two, but... he hasn’t.");
		if(pc.cockTotal() > 1) output(" Even after you used his mouth without a hint of thanks or reciprocation.");
		output("\n\nIt spurs you on, laughing almost as you claim the second one’s muscular, clinging tunnel again and again, taking hold of his ears, tugging and rubbing them insistently as you surge to another high, every bit as juicy as the first, making him moan like a whore");
		if(pc.cumQ() > 500) output(" as you pack his intestines quite full with [pc.cum]");
		else output("as you fill him with your [pc.cum]");
		output(". You don’t manage to make this one cum from your anal “stimulation” alone, though. Are you bothered by that? Less than the fact that when you slide out of him – making him gasp as you leave his sphincter with an audible “pop”, a ");
		if(pc.cumQ() < 100) output("dribble");
		else output("stream");
		output(" of cum following you out – your [pc.cock " + x + "], though aching, is still hard.");

		output("\n\n<i>“And he was even less use!”</i> you sigh theatrically, gesticulating at the crumpled, stocky reptile panting raggedly at your feet. You set your gaze on the last one and smile softly. <i>“These two were all talk, weren’t they? I bet it’s you who can really give me what I need.");
		if(pc.cockTotal() > 1) output(" Certainly you know how to suck it good. Can you take it as well?");
		output("”</i> He looks away from your gaze but does manage a small, tremulous grin, and when you make your way over to him he gets back on his hands and knees without any encouragement. <i>“Good boy,”</i> you sigh, grasping his supple scales and parting his purple rose with your filthy, well-lubricated cock.");

		output("\n\nYou go slower now, partly because you’ve already expended the real bite of your fervor and partly because of how willing this particular raskvel is. He gasps once when you slide into him, but he’s obviously considerably more used to this than the other two were, and he’s soon letting you holster ");
		if(pc.cockVolume(x) > enemy.analCapacity()) output("almost ");
		output("all of your [pc.cock] in his rectum, your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("[pc.hips]");
		output(" patting gently against his tush");
		output(". And such a nice ass, too – you squeeze a tight buttock, surprisingly pliant underneath his red scales but wonderfully round and neat, perfect for a miniature boy whore who lets you dip deep into his warmth but is still able to clamp up and squeeze you up and down your length, who gasps again in that wonderful cadence when you stroke his ears and furl your hand around his cute, stubby, fat four inch cock.");
		output("\n\nYou jerk him slowly as you push into his hot, buttery crease rhythmically, " + pc.mf("growling","purring") + " with approval in his ear when he arches his back and gasps in orgasm after barely a minute of it, helplessly painting the ground with his cream in response to your smushing over his evidently sensitive prostate. Just like you though, he stays quite hard and deliberately looks over his shoulder at you with a come-hither look when he’s finished. You’re more than happy to comply to his silent challenge, bucking your [pc.hips] into him more briskly, pushing your fingers into his mouth as you continue to milk him with your other hand.");

		output("\n\n<i>“You </i>are<i> the best, aren’t you?”</i> you murmur in his ear, molding your [pc.chest] into his hot, smooth back. <i>“Maybe I should take you with me. An energetic little sissy who tends to my ship’s engines during the day and my dick at night? You’d like that, wouldn’t you?”</i> In response he clenches up again, exhaling repeatedly as he ruts back into you, using your bulging, hard-worked pole to reach another spurting orgasm, his own small hot cock pulsing in your hand.");

		output("\n\nYou let him have it as much as he wants, sending ripples across his pert, tidily padded butt as you fuck him firmly but tenderly, gradually working yourself up towards a final, delicious release. It’s his third high that pushes you over the edge; the boyish groans and gasps, his back passage rippling up and down your [pc.cock " + x + "], the sight of his urgently flexing body, it pushes the sweat into your head and then the jizz down your dilating cock... achingly good.\n\nYou stay firmly fixed into the twink-ish raskvel, slapping into his wonderfully close-fitting ass until he’s milked you, your prick pulsing almost painfully dry with your last couple of heaves. It is with immense satisfaction that when you finally withdraw, your tool finally flaccid and swinging downwards, you see you’ve packed the smallest just as full as the other two, his opened sphincter leaking [pc.cum]");
		if(pc.cumQ() >= 1500) output(" and his stomach pregnant-curved with your hot seed");
		output(". He rolls onto his side and grins at you dopily, his eyes heavy-lidded.");
		output("\n\n<i>“You aren’t too bad after all, outlander,”</i> he says. <i>“Talk a bit too much, though.”</i>");
		output("\n\nFair. You return his smile");
		if(!pc.isNude()) output(" as you pull your clothes back on");
		output(". It is with a tender but definite swagger that you turn and leave him ");
		if(pc.cumQ() >= 1500) output("to stroke his rounded belly ");
		output("with his two insensate chums.");
		enemy.loadInAss(pc);
		enemy.loadInAss(pc);
		pc.orgasm();
		pc.orgasm();
	}
	processTime(45);
	enemy.loadInAss(pc);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//Red Riding
//Requires: Vagina
public function redRidingRaskvel():void
{
	clearOutput();
	showRaskGang();
	var x:int = rand(pc.totalVaginas());
	var y:int = x-1;
	if(pc.totalVaginas() > 1)
	{
		//If we picked an out of bounds number because x got picked as index 0, pick on the other side.
		if(y < 0)
		{
			y = x+1;
		}
	}
	userInterface.showBust("RASKVEL_GANG_NUDE");
	output("<i>“On the floor,”</i> you say curtly to the largest one, <i>“and let’s see it. Now.”</i> The raskvel is clearly not used to this treatment; cheeks burgundy and with no idea where to put his eyes, he clumsily sits down and ");
	if(enemy.lust() >= 60) output("exposes the thick, purple erection you’ve caused to erupt out of his slender slit, curling his hand around it in an almost protective gesture");
	else output("slides his thick, purple, semi-erect erection out of his slender slit. Probably aware of what you want, he wraps his hand around and nervously rubs it, practically urging it to get harder quickly.");
	output(" You smirk at the sight; the belligerent tech-savage prostrate in front of you, subdued, intimidated and yet still rock hard, waiting to be used. It’s pleasing, and you feel blood sink towards your groin, [pc.eachVagina] reacting warmly and wetly to the fact of your position of strength.");

	output("\n\nYou ");
	if(!pc.isNude()) output("shuck your [pc.gear] off impatiently, uninterested in providing any sort of show for him, and ");
	output("sit down unceremoniously on the reptile’s wide, muscular thighs, riding your [pc.vagina " + x + "] up onto the base of his prick, making him gasp and instinctively draw his hand away. You catch it and clasp it firmly back on his dick.");

	output("\n\n<i>“Look at me and keep rubbing,”</i> you order. You snap your fingers at the other two, who are awkwardly frozen nearby. <i>“You! Come here and lick. Do a good job and who knows... you might get as lucky as this guy’s going to get.”</i>");
	if(pc.totalVaginas() == 1)
	{
		output(" After a moment’s pause the medium-sized one obediently trots over, delicately places his hands on your [pc.thighs] as best he can and bends over your [pc.vagina " + x + "]. You sigh as a long, wet reptile tongue is slathered over");
		if(pc.hasClit()) output(" [pc.oneClit] and");
		else output(" your");
		output(" upper lips, pleasure beginning to pulse freely through your sex.");
	}
	else 
	{
		output(" After a moment’s pause the medium-sized one trots over. He squats by your side and makes to bend over your [pc.vagina " + x + "]. Your callous laugh stops him.");
		output("\n\n<i>“No, no. I’m going to be using </i>that<i> one, silly. Underneath.”</i> He looks up at you with soulful, overawed eyes as understanding dawns, and then he slowly crawls behind you. You raise and flare your [pc.butt] a bit to allow him to shift his way in, his hot breath billowing over [pc.eachVagina], and then you sit down on his face with a satisfying fleshy sound. His long, wet reptile tongue laps desperately over your [pc.vagina " + y + "]");
		if(pc.hasClit()) output(", blanketing attention across [pc.eachClit]");
		output(" and causing pleasure to pulse freely through you as he reaches deeper into your sensitive depths.");
	}
	output("\n\nYou grunt with fervor as the second raskvel lavishes servile attention on you, dabbing and rasping his ever-so-slightly rough, hot tongue across your sex, holding your own magisterial attention on the raskvel you have trapped ");
	if(pc.legCount > 1) output("between your [pc.thighs]");
	else output("underneath your weight");
	output(". His eyes are glazed as he stares back, his hand shifting over his straining cock, apparently transfixed by your sheer dominance... or by your [pc.chest]. Difficult to tell. At any rate it’s a satisfying sight, and with your lust being so ably stoked by his pussy-licking friend you’re soon overpowered with the urge for more.");
	output("\n\nYou hold his helpless eyes as you lift yourself up, tantalizing his needy cock-end with the entrance of your [pc.vagina " + x + "] for a moment, and then sit yourself down with a growl. ");
	if(pc.vaginas[x].looseness() >= 4) output("Your capacious, man-eating cunt easily gloves him and aside from the intense satisfaction of taking his cock within you there’s the further sadistic knowledge that you’re really going to have to work him to get what you need.");
	else output("You feel faintly dizzy with pleasure as his thick, lizard cock stretches and rubs your tight cunt all the way down, laced with triumph when your [pc.thighs] touch his again, absolutely stuffing you to the brim with obedient dick.");
	pc.cuntChange(x,enemy.cockVolume(0),true,true,false);
	if(pc.totalVaginas() > 1)
	{
		output(" The medium one waits patiently for you to finish before going back to licking your");
		if(pc.hasClit()) output(" clit");
		else output(" labia");
		output(", your sex inundated with hot, shifting pleasure outside and in.");
	}

	output("\n\n<i>“Rusting hell...”</i> the big one groans, tensing up as you begin to work your hips, bending his cock into you, squeezing it deep, pressing your ");
	if(pc.totalVaginas() == 1) output("groin forwards");
	else output("[pc.butt] downwards");
	output(" into the other one’s face. Leisurely you open your eyes to see that the smallest one is still standing there, his mouth slightly ajar and his fat, four inch boy cock standing on end to your performance.");
	if(pc.lust() >= 66) output(" You need to think of something to do with him before the heat you can feel building irresistibly in your nether regions gets too much to form cogent instructions.");

	pc.changeLust(50);
	processTime(13);

	var args:Array = [x,y];
	//[Hard light peg] [Feed milk] [Pussy tail] [Cock tail]}
	clearMenu();
	if(!pc.hasCockTail() && !pc.hasCuntTail() && !pc.hasHardLightEquipped()) addButton(0,"Next",feedRaskGangMalk,args);
	else
	{
		if(pc.hasHardLightEquipped()) addButton(0,"HardlightPeg",raskvelHardlightPegEdition,args,"Hardlight Peg","Peg one of them with the hardlight strap-on you’ve got.");
		else addDisabledButton(0,"HardlightPeg","Hardlight Peg","You need a hardlight strap-on for this scene.");
		addButton(1,"Tittysuckle",feedRaskGangMalk,args,"Tittysuckle","Invite him to suck on your [pc.nipple], whether or not you have any milk to give.");
		if(pc.hasCuntTail()) addButton(2,"Tail Milk",cuntTailRaskPlay,args,"Tail Milk","Use your symbiotic tail to wring pleasure from the pint-sized alien.");
		else addDisabledButton(2,"Tail Milk","Tail Milk","You need at least one cunt-tail for this scene.");
		if(pc.hasCockTail()) addButton(3,"Tail Fuck",raskVelCockTailPegging,args,"Tail Fuck","Use your penis-tipped tail to wring pleasure from the pint-sized alien.");
		else addDisabledButton(3,"Tail Fuck","Tail Fuck","You need at least one cock-tail for this scene.");
	}
}

//Feed milk
//PC with none of the above defaults to this
public function feedRaskGangMalk(args:Array):void
{
	clearOutput();
	showRaskGang();
	userInterface.showBust("RASKVEL_GANG_NUDE");
	var x:int = args[0];
	var y:int = args[1];
	output("<i>“Come here, little boy,”</i> you purr, ");
	if(pc.biggestTitSize() > 1) output("cupping");
	else output("spreading your hands over");
	output(" your [pc.chest]. What with you thoroughly embedded in his two friends he could easily run away if he wanted – but instead he obeys, meekly trotting over, placing his perky bottom on the chest of the biggest and giving you the same, solemn puppy-dog eyes the medium one did, awaiting further instruction. Still slowly riding the big one’s cock, you curl your arm around the small one’s shoulder and silently direct him to your [pc.nipple].");

	output("\n\nYou sigh as he spreads his lips over it, lapping and smoothing his tongue over it with the same motion the medium one is using on your ");
	if(!pc.hasClit() || pc.clitLength < 2) output("pussy");
	else output("clit");
	output(" until it is ");
	if(pc.hasClit() && pc.clitLength >= 2) output("tenderly standing on end");
	else output("oozing fluid freely");
	output(". He spreads his fingers over your other ");
	if(pc.biggestTitSize() < 1) output("nipple");
	else output("boob");
	output(", softly stroking it as he bends further into you, rather sweetly closing his eyes and focusing all his attention on your ");
	if(pc.biggestTitSize() >= 1) output("breast");
	else output("chest");
	output(".");

	if(pc.isLactating())
	{
		output("\n\nIt doesn’t take long under this sort of kneading for the heavy liquid in your [pc.chest] to rise, dribbling and then spurting into his hot, hungry mouth, your other tit oozing your [pc.milk] freely down onto the heaving scales beneath you.");
	}
	output("\n\nYou gasp and tense up to the ecstasy of it, milking hard cock with your [pc.vagina " + x + "] whilst long tongues lap attentively at your body’s most sensitive spots.");
	processTime(4);
	args.push(feedRaskGangMalk);
	clearMenu();
	addButton(0,"Next",vaginaRaskStuffEpilogus,args);
}

//Hard light peg
public function raskvelHardlightPegEdition(args:Array):void
{
	clearOutput();
	showRaskGang();
	userInterface.showBust("RASKVEL_GANG_NUDE");
	var x:int = args[0];
	var y:int = args[1];
	output("<i>“Come here, little boy,”</i> you purr, bending across and flapping through your pile of discarded clothes for what you need. What with you thoroughly embedded in his two friends he could easily run away if he wanted – but instead he obeys, meekly trotting over to your side. He does pause when he sees you click on the bright light of your strap-on with a flourish, and the impulse to turn and make for the hills clearly occurs to him.");
	output("\n\n<i>“Don’t be afraid,”</i> you coo lowly. <i>“" + pc.mf("Daddy","Mommy") + " has no use for a sissy clit like yours, but " + pc.mf("he","she") + " doesn’t want to see you go home empty-handed. On your knees here and let me see that cute butt of yours... that’s it.”</i>");
	output("\n\nHe really does have a nice ass: supple, smaller and rounder than the other two, really crying out for a good, hard reaming. He gasps in a delightful rising cadence and grasps handfuls of dirt as, whilst you continue to lazily ride the big one’s cock, you work his tight, purple pucker loose and then begin to feed the length of strong, warm light into his colon, flexing your arm muscles, pumping into him with increasing fervor. Reveling in his arched neck and sweat-beaded brow - his expression somewhere between anguish and intense gratification - whilst swiveling your sex hard into the mouth and cock of the other two, is absolutely delightful.");
	processTime(4);
	args.push(raskvelHardlightPegEdition);
	clearMenu();
	addButton(0,"Next",vaginaRaskStuffEpilogus,args);
}

//Cock-tail
public function raskVelCockTailPegging(args:Array):void
{
	clearOutput();
	showRaskGang();
	userInterface.showBust("RASKVEL_GANG_NUDE");
	var x:int = args[0];
	var y:int = args[1];
	output("<i>“Come here, little boy,”</i> you purr. What with you thoroughly embedded in his two friends he could easily run away if he wanted – but instead he obeys, meekly trotting over to your side. Perhaps he lives in hope he will get in on the pussy action – if that is what he thinks he’s about to be sorely disappointed, quite literally. He pauses when your [pc.cockTail] rears into view, throbbing with frustrated lust and beading pre, and the impulse to turn and make for the hills does now clearly occur to him.");
	output("\n\n<i>“Let’s not pretend you aren’t going to enjoy this,”</i> you say lowly. <i>“On your knees here and let me see that cute butt of yours... that’s it.”</i> He really does have a nice ass: supple, smaller and rounder than the other two, really crying out for a good, hard reaming. He gasps in a delightful rising cadence and grasps handfuls of dirt as, whilst you continue to lazily ride the big one’s cock, you allow your cock-tail to wriggle its way between his butt-cheeks, sternly working his sphincter loose and oiling him with a steady dribble of pre-cum, before thrusting deeply into his tight, clenching colon.");
	output("\n\nYou gasp and growl to the variegated ecstasy of it, penetrated and penetrating, reveling in the twinkish raskvel’s arched neck and sweat-beaded brow, his expression somewhere between anguish and intense gratification as your bulging");
	if(pc.hasParasiteTail()) output(" parasitic tail");
	else output(" cock-tail");
	output(" claims his ass again and again, all the while you swivel your female sex purposefully into the mouth and cock of the other two.");
	processTime(4);
	args.push(raskVelCockTailPegging);
	clearMenu();
	addButton(0,"Next",vaginaRaskStuffEpilogus,args);
}

//Cunt-tail
public function cuntTailRaskPlay(args:Array):void
{
	clearOutput();
	showRaskGang();
	userInterface.showBust("RASKVEL_GANG_NUDE");
	var x:int = args[0];
	var y:int = args[1];
	output("<i>“Come here, little boy,”</i> you purr. With you thoroughly embedded in his two friends he could easily run away if he wanted – but instead he obeys, meekly trotting over to your side. He pauses as your [pc.cuntTail] rears into view, dripping and spreading itself with unrequited arousal, an expression somewhere between fright and lust crossing his ruddy face.");
	output("\n\n<i>“Kneel beside me,”</i> you say lowly. <i>“Relax, and let me do everything. That’s it...”</i> You, in fact, don’t have to do anything at all; your");
	if(pc.hasParasiteTail()) output(" parasitic tail");
	else output(" [pc.tail]");
	output(" can sense a ready, needy cum-pump a mile off, and it whips down without instruction to plaster itself over the raskvel’s small, thick erection. It’s not the size it wants and it is soon squeezing him ruthlessly, dribbling fluid down his flanks, writhing around to milk him so hard that you’re slightly worried it’s going to tear it right off him.");
	output("\n\nHe gasps and shouts, grasping handfuls of dirt with his body arched backwards, quivering to the [pc.cuntTail] squelching ministrations. You sigh blissfully to the sensation of double penetration, pleasure channeling back down your tail and twining with that arriving from swiveling your [pc.vagina " + x + "]");
	if(pc.totalVaginas() > 1) output(" and [pc.vagina " + y + "]");
	output(" into the mouth and cock of the other two.");
	processTime(4);
	args.push(cuntTailRaskPlay);
	clearMenu();
	addButton(0,"Next",vaginaRaskStuffEpilogus,args);
}

// merge
public function vaginaRaskStuffEpilogus(args:Array):void
{
	var x:int = args[0];
	var y:int = args[1];
	var originalScene:Function = args[2];
	clearOutput();
	showRaskGang();
	userInterface.showBust("RASKVEL_GANG_NUDE");
	output("You swiftly become immersed in the sex, rutting and thrusting into the multiple hot, gasping, licking raskvel. Domineered they may be but they’ve retained their energy and the two beneath you buck their cock and tongue into you vigorously, their bodies almost working on auto-pilot. You gasp and squeeze your [pc.hips] into the groaning reptile beneath you, tensing up to the hard bounce of his cock into your walls as you mercilessly ride him to orgasm. Catching him up in your excited bucking, you force him to cum with you, juicing him with the delicious flexing of your [pc.vagina " + x + "]");
	if(pc.totalVaginas() == 1) output(", smearing the face of the second raskvel with girl-lube as you do");
	output(".");
	if(pc.totalVaginas() > 1) 
	{
		output(" The second raskvel almost chokes as your [pc.vagina " + y + "] quivers simultaneously, pushed into lush downfall by the rubbing ministrations of his long tongue – his reward is ");
		if(pc.isSquirter()) output("a series of gushes of [pc.girlCum] down his throat.");
		else output("getting his face liberally smeared with [pc.girlCum].");
	}

	pc.orgasm();

	output("\n\nYou sigh, still gently rotating your hips, enjoying the after-tremors whilst you ");

	if(originalScene == feedRaskGangMalk) 
	{
		output("continue to push the third raskvel’s face into your ");
		if(pc.isLactating()) output("beading ");
		output("[pc.nipple]");
	}
	else if(originalScene == raskvelHardlightPegEdition) output("continue to gently but firmly whisk the third raskvel’s guts with hard light, his small cock jerking reactively as you ride over his sweet spot again and again, his gasps rich in your ears");
	else if(originalScene == raskVelCockTailPegging) output("continue to thrust your [pc.cockTail] into the tight, clenching hole it has claimed, the third raskvel’s small cock jerking reactively as you ride over his sweet spot again and again, his gasps rich in your ears");
	else output("continue to milk the third raskvel’s small cock with your [pc.cuntTail] assiduously, pleasure shimmering up your stem as surely as he gasps and almost wails to the wet wring you’ve trapped him in");
	output(". The big raskvel’s cock is still very much erect, his alien physiology allowing him to keep pressing strongly into your walls when you sway, and that to your blissed-out mind is all for the good; you want them kept in this nice, attentive state you’ve got them in. He’s looking at you now, his breath catching every time you bend his cock within your oozing cunt.");

	output("\n\n<i>“Please...”</i> he manages. There’s a woozy mumble of support for this statement somewhere beneath you.");

	output("\n\n<i>“Oh very well,”</i> you sigh. <i>“Just give me a moment...”</i>");
	if(originalScene == feedRaskGangMalk) 
	{
		output("\n\nYou release the other raskvel from the");
		if(pc.biggestTitSize() >= 10) output(" suffocating");
		else if(pc.isLactating()) output(" wet");
		output(" kiss of your");
		if(pc.biggestTitSize() >= 1) output(" breast");
		else output(" chest");
		output("; he looks completely zoned out as he falls back from your");
		if(!pc.hasFlatNipples() && !pc.hasFuckableNipples()) output(" erect");
		else if(pc.isLactating()) output(" drooling");
		output(" nipple");
		if(pc.isLactating()) output(", eyes dilated and [pc.milk] on his lips.");
	}
	else if(originalScene == raskvelHardlightPegEdition) output("\n\nThe third raskvel wails as you mercilessly up the tempo of your manual pegging, the muscles in your arm beginning to ache as you holster a large proportion of the dildo in his tight little butt again and again; he is forced to orgasm, spurting a surprising amount of cum from his shaking cock to your stringent prostate milking.");
	else if(originalScene == raskVelCockTailPegging) output("\n\nThe third raskvel wails as you mercilessly up the tempo of your cock-tail’s thrusting, pumping your way towards a sighted orgasm. Your sighs soon combine with his moans as hot cum courses up your long stem and then fountains deep within him, quickly packing him like a red hot water-bottle full of your seed.");
	else
	{
		output("\n\nThe third raskvel wails as your cunt-tail kneads him to orgasm, a surprising amount of cum shooting deep into its dripping blossom; deep, unnatural bliss fills your mind, endorphins geyser as you, the host, achieve your lusty");
		if(pc.hasParasiteTail()) output(" parasite");
		else output(" tail");
		output("’s purpose.");
	}
	
	output("\n\nYou then release the raskvel’s dick – still pointing needily at the sky, thickly pasted in cum, when you allow it to schlorp out of your steaming [pc.vagina " + x + "] – and, with a few taps of your hand and whispered instructions, reposition them. You leer down at the second raskvel as you slide your cum-slicked pussy down his eager, purple length, tightening up as much as you can as you do so, enjoying every inch that fills your depths. On his back, snared and overwhelmed by the taste on his lips and texture on his dick, he simply cannot take it. He clenches up and grunts in helpless orgasm when your [pc.hips] touch his, a single spurt of fresh warmth deep within you.");
	output("\n\nIt makes no difference to you. Like his friend, now");
	if(pc.vaginaTotal() == 1)
	{
		output(" crouched in front of you");
		if(pc.hasClit()) output(" and licking fervently at your [pc.clit]");
	}
	else output(" buried beneath your [pc.ass], licking fervently at your [pc.vagina " + y + "]");
	output(", he stays rock hard and ready to use - which you do, clenching and riding him demandingly. The third raskvel doesn’t even need instruction.");

	output(" He crawls onto the heaving red scales beneath you and places his lips on ");
	if(originalScene == feedRaskGangMalk) output("your other ");
	else output("a ");
	output("[pc.nipple], with skillful licks quickly makes it ");
	if(pc.isLactating() || pc.hasCuntNipples()) output("ooze fluid");
	else if(pc.hasLipples()) output("pucker excitedly");
	else output("stand on end");
	if(pc.isLactating()) output(", before making the ripe warmth brimming inside shoot outwards into his thirsty mouth");
	output(", his only aim to gratify you. You stroke his ears and laugh ecstatically at both the pleasure coursing through you and the wonderful lack of control you inspire in these creatures.");

	output("\n\nYou rock yourself to another high, slower this time, exulting in the one-sided four-way, reaching down occasionally to tease the smallest one’s small, hot erection, never giving him quite enough of your touch to allow him release, but enough to keep him worshipfully attached to your [pc.chest]. When your heat builds to the point where you can bask in it no longer you clamp your [pc.hips] down on the second raskvel and ride him hard, your own hard breathing combining with his as you reach it, a fresh wave of pulses seizing your [pc.vagina " + x + "]");
	if(pc.totalVaginas() > 1) output(" and [pc.vagina " + y + "]");
	output(" up, contracting around his cock and making you ");
	if(!pc.isSquirter()) output("seep");
	else output("spurt");
	output(" your juices all over the biggest one’s questing tongue.");

	output("\n\nYou roll off them at last with a sigh, a thick cocktail of sexual fluids seeping out of your [pc.vagina " + x + "] and oozing down your [pc.thighs] when you allow the middle raskvel’s dick to slide out – disgusting, yet weirdly satisfying.");
	output("\n\n<i>“I always wanted to breed an alien,”</i> groans the biggest, flat on his back. <i>“But this... I wasn’t...”</i>");
	output("\n\n<i>“...");
	if(!silly) output("Wasn’t ready");
	else output("My body wasn’t ready");
	output(",”</i> supplies the second, gazing unfocused at the sky. There’s a smile on your face as you");
	if(!pc.isNude()) output(" put your [pc.gear] back on and");
	output(" sway off, leaving your boy toys behind you in a discarded heap.\n\n");
	processTime(22);
	pc.loadInCunt(enemy, x);
	if(pc.totalVaginas() > 1) pc.loadInCunt(enemy, y);
	pc.orgasm();
	CombatManager.genericVictory();
}

//Loss Gangbang
public function loseToRaskvelAndGetGangBangued():void
{
	showRaskGang();
	userInterface.showBust("RASKVEL_GANG_NUDE");
	output("You collapse into the red dust of Tarkus, too ");
	if(pc.HP() < 1) output("battered");
	else output("aroused");
	output(" to offer any more resistance. Dizzily you listen to the three raskvel banter with each other as they surround you, pinning you down with their warm, smooth hands.");

	var aphrodisiaced:Boolean = false;

	//Male/genderless not raskmorph:
	if(!pc.hasVagina() && pc.raceShort() != "raskvel")
	{
		output("\n\n<i>“After all that coy courting you just put us through, it’s pretty damn rude of you not to be a girl, offworlder,”</i> sighs the biggest");
		if(pc.isCrotchGarbed()) output(" as he busily rips off your [pc.lowerGarments]");
		output(". Something pricks your skin and immediately your pulse quickens");
		if(pc.hasCock()) output(", [pc.eachCock] stiffening in immediate reaction to the heavy load of chemical aphrodisiac that has just been dumped into your veins");
		else output(" in immediate reaction to the heavy load of chemical aphrodisiac that has just been dumped into your veins");
		output(". <i>“Breeding one of your hoity toity lofty rofty women – what a prize that would’ve been.”</i>");
		
		//PC is 4’3” or less:
		if(pc.tallness <= 51) output("\n\n<i>“[pc.HeShe]’s smaller than you, what are you basing “lofty rofty women” on?”</i> the medium sized one interjects.");
		output("\n\n<i>“You going to get up in that or what?”</i> husks the smallest, voice heavy with need. <i>“Because if you’re not I will.”</i>");
		aphrodisiaced = true;
	}
	//Female/herm not raskmorph:
	else if(pc.raceShort() != "raskvel")
	{
		output("\n\n<i>“There now sweetheart, there was no need for such a fuss,”</i> sighs the biggest");
		if(pc.isCrotchGarbed()) output(" as he busily rips off your [pc.lowerGarments]");
		output(". Something pricks your skin and immediately your pulse quickens, [pc.eachVagina] beading moisture in immediate reaction to the heavy load of chemical aphrodisiac that has just been dumped into your veins. <i>“We only wanted to fuck your every orifice and stuff you full of the good, strong kids like a big breeding cow like you can’t help but want.”</i>");
		//PC is 4’3” or less:
		if(pc.tallness <= 51) output("\n\n<i>“[pc.HeShe]’s smaller than you, what are you basing “big breeding cow” on?”</i> the medium sized one interjects.");
		output("\n\n<i>“You going to get up in that or what?”</i> husks the smallest, voice heavy with need. <i>“Because if you’re not I will.”</i>");
		aphrodisiaced = true;
	}
	//Raskmorph:
	else
	{
		output("\n\n<i>“You’re probably wondering why we haven’t mistaken you for a raskvel, am I right offworlder?”</i> the biggest one laughs");
		if(pc.isCrotchGarbed()) output(" as he busily rips off your [pc.lowerGarments]");
		output(". <i>“It’s just, oh, everything about you. The way you walk, how you hold yourself, the manner with which you speak to us. You’re a tourist, aren’t you? Thought the way we look was so cute you had to be it, right? But being raskvel means coping with a lot of urges. Constant urges. I don’t think I have to give you the aphro, you know exactly what I’m talking about.”</i> It’s true; the jostling of brawny, familiar flesh on yours is filling you with inadvertent, irrepressible desire, your ");
		if(pc.hasVagina())
		{
			if(pc.totalVaginas() == 1) output("pussy");
			else output("pussies");
			output(" oozing excitement, and your");
		}
		if(pc.cockTotal() > 0) 
		{
			output(" cock");
			if(pc.cockTotal() > 1) output("s");
			output(" straining in excitement, and your");
		}
		output(" feral instincts eagerly preparing you for a hard fucking regardless of what your mind has to say on the matter. The raskvel grins with a mixture of understanding and schadenfreude as he squeezes your [pc.ass]. <i>“Time to find out what being a lone raskvel out in the wilds is all about, tourist.”</i>");
		output("\n\n<i>“You going to stand on the stump all day or get up in that?”</i> husks the smallest, voice heavy with need. <i>“Because if you’re not I will.”</i>");
	}
	output("\n\nThe biggest answers simply enough by taking hold of your [pc.hips] and unceremoniously driving his thick, purple prick into your [pc.vagOrAss]. You cry out in shock at the sudden, hot intrusion, but he evidently isn’t interested in your peace of mind in the slightest, immediately beginning to pick up a vigorous tempo, plumbing your depths with gusto. You are bumped and shaken forward into the medium sized one, who cusps his hand around your head almost comfortingly, introducing your face to his own gleaming, six inch dick, sharply erect and beading musky pre.");

	if(pc.hasVagina()) pc.cuntChange(0,enemy.cockVolume(0),true,true,false);
	else pc.buttChange(enemy.cockVolume(0),true,true,false);

	output("\n\nBent over, weak with the arousal ");
	if(aphrodisiaced) output("they have ");
	else output("your instincts have ");
	output("sunken into you and being pumped like this, there’s really no struggling against it. Hard, hot cock flesh enters your mouth, held in there by the strong fingers caressing the nape of your neck, the raskvel sighing with deep enjoyment at the way the jerking of your body to the pounding you’re taking from behind sends your [pc.lips] and [pc.tongue] sliding and quivering down his sex.");

	output("\n\nIt soon transpires that the zealous way the big raskvel is thrusting into your [pc.vagOrAss] is actually just him warming up; once he’s enjoyed finding your limit a few times, your gasps melding with his grunts of approval at how much of his large, glossy cock he can fit into your clinging, tender passage, he picks up the pace, battering his powerful hips into your [pc.butt], pile-driving into your deepest sensitive areas once every second like a jackhammer, brusquely using you to push towards his own high. The other is quickly caught up in the physicality and manner in which the bigger one is going at you too, and he’s soon fucking your mouth for all he’s worth, drool rolling down your chin as his taut stomach flaps into your nose, thick, bulging dick filling your maw again and again.");

	output("\n\nA rougher spit-roast it is difficult to imagine but ");
	if(aphrodisiaced) output("the aphrodisiac high in your veins means ");
	else output("your impossible-to-control instincts mean ");
	output("that as unwilling and uncaringly used as you are, your body is ecstatic with the cock being thrust into it, your ");
	if(pc.hasVagina()) output("[pc.vagina] basting the raskvel rutting you in its juices, clinging eagerly to him as he recedes and practically sucking him in when he extends");
	else 
	{
		output("your [pc.asshole] softening up eagerly for the raskvel behind you");
		if(pc.ass.wetness() > 0) output(" and slathering him in your oily lubricant");
		output(", sending thrills running up your spine when he fills you");
	}
	output(". Increasingly to your scattered senses the cock in your mouth is something to celebrate too: the texture of it on your lips and soft inner cheeks, the bestial scent and taste of pre drives your overcharged lust ever upwards, ");
	if(pc.hasCock()) output("[pc.eachCock] straining, bulging and beading as surely as the second raskvel’s is");
	if(pc.hasVagina() && pc.hasCock()) output(" and ");
	if(pc.hasVagina()) output("your clenching [pc.vagina] practically frothing to the energetic press of your conquerors");
	output(".");

	output("\n\nYou realize suddenly that the smallest raskvel has been flopped on the ground this whole time, lazily masturbating to the one-sided threesome in front of him, evidently biding his time; the knowledge you’ve got plenty more fucking ahead of you combines with the forceful sensation of being doubly penetrated into a heady delirium of involuntary pleasure and suddenly you are cumming, the muffled sound of your moans combining with the beat of the raskvel’s tight muscles against your face and [pc.butt], ");
	if(pc.hasVagina()) 
	{
		output("[pc.eachVagina] clenching up ");
		if(pc.isSquirter()) output("and spurting gleeful amounts of fluid ");
		output("around its hard intrusion");
		if(pc.hasClit()) output(", your [pc.clits] pulsing wickedly");
	}
	else if(pc.hasCock()) 
	{
		output("[pc.eachCock] flexing ");
		if(pc.cumQ() >= 125) output("copious amounts of ");
		output("[pc.cum] onto the ground in response to the insistent rubbing on your prostate");
	}
	output(".");

	//Raskmorph: 
	if(!aphrodisiaced) 
	{
		output("\n\n<i>“That’s it tourist,”</i> pants the big raskvel, continuing to slam his length into your ");
		if(pc.hasVagina()) output("convulsing pussy");
		else output("clenching ass");
		output(". <i>“You got to start at the bottom if you want to be one of us - but that’s not so bad, is it? Maybe you’ll enjoy it so much you’ll want to stay there...”</i>");
	}
	//Female/Herm: 
	else if(pc.hasVagina()) output("\n\n<i>“Such a big, beautiful broodmare,”</i> pants the big raskvel, continuing to slam his length into your convulsing pussy. <i>“I knew you’d enjoy this. Show - show my kids the stars...”</i>");
	//Male/Genderless: 
	else output("\n\n<i>“I knew you’d enjoy it, offworlder,”</i> pants the big raskvel, continuing to slam his length into your clenching ass. <i>“Gotta say, you’re a better lay than you look...”</i>");

	output("\n\nHe loses the ability to form words as he speeds into his own orgasm, gripping your [pc.hips] tightly as he clenches up once and with a breathless grunt fills your ");
	if(!pc.hasVagina()) output("guts");
	else output("tunnel");
	output(" with liquid warmth. It’s a single, heavy ejaculation, a feature driven home to you when a few moments later the second raskvel holds your face tight to his abdomen and pouch-balls, filling your whole mouth with his cock and then cumming as well, a single, long stream of thick jizz coating your gullet. He releases your head and a satisfied sigh at the same time, grinning down at you as his thick, saliva-shone purple prick slides out from your gasping, panting [pc.lips], gloating in your own hazy realization that, oozing seed from the tip as it may be, it’s still as hard as when it first entered your mouth.");

	output("\n\n<i>“It’s tough when you need a good two or three rolls in the hay to properly calm down,”</i> he sighs, teasingly batting you around the face with it. <i>“But generous offworlders like you make that a lot easier.”</i> Your shaking orgasm has only made you weaker in their hands, ");
	if(!aphrodisiaced) output("your own instincts insisting you need more sex just as surely as theirs do");
	else output("the cursed drug of theirs still making your pulse quicken and your mind vague with need");
	output(" and you can offer no resistance as they eagerly change positions, fingers drifting over your ");
	if(pc.hasCuntNipples() || pc.isLactating()) output("moist");
	else output("pebbly");
	output(" [pc.nipplesNoun]");
	if(pc.hasHair()) output(" and through your [pc.hair]");
	output(" whilst the smallest impatiently insinuates himself in the action, rubbing his stiff erection between your butt cheeks as the biggest imperiously presents his girthy, sex-smeared erection to your lips. Defeated by your own uncontrollable ");
	if(aphrodisiaced) output("chemical");
	else output("hormonal");
	output(" lust now you pad and lick at it with your [pc.tongue] deferentially, feeling the glow of the sharp, mixed musk sink down to where another red erection is poking fervently in at you.");

	//1 < Vagina:
	if(pc.totalVaginas() > 1) 
	{
		output("\n\n<i>“Oh man, you never said [pc.heShe] had more than one of them!”</i> the raskvel at your back exclaims, his fingers tracing the outer lips of your [pc.vagina " + 1 + "]");
		if(pc.hasClit()) output(" and caressing [pc.oneClit]");
		output(". <i>“I LOVE aliens!”</i>\n\nYou moan as with one excited movement he thrusts deeply into your wet hole, masses of nerves within your core firing in frothy response, your oversexed body delighting in the anticipation of getting another creamy, virile filling.");
		pc.cuntChange(1,enemy.cockVolume(0),true,true,false);
	}

	//1 Vagina: 
	if(pc.totalVaginas() == 1) output("\n\nYou gasp and cry out in protest as the raskvel at your back scorns your oozing, gaping pussy to spread your [pc.asshole] with his tool-like head instead. Fogged with arousal and already thoroughly fucked as you are it’s easier than it might be to relax and let him gradually slide in, and your oversexed body delights in any penetration at all. The roughness of it mingles with the pleasure of the muffled pressure put on your tenderized pussy tunnel as he bends into you with a heartfelt groan, and even to your ears the whimpers that accompany the pat of his hard thighs against your [pc.butt] are ones of slutty enjoyment.");
	//0 Vagina:
	else 
	{
		output("\n\nThe raskvel squeezes your [pc.butt] and thrusts straight into your gaped, oozing [pc.asshole], his passage greatly eased by the heavy fucking and filling it has already taken. Fogged with arousal your body urges, then demands you push back into him to feel the rub of his dick on your tenderized walls ");
		if(pc.hasCock()) output("and needy prostate ");
		output("and eventually that’s exactly what you’re doing, hazily justifying that you may as well get out of this humiliating situation what you may. He groans with approval at your bucking and speeds up in kind, pushing and bumping deep into your colon.");
	}

	output("\n\nTantalized by your drifting tongue and lips and re-energized by the sight of his brother pumping into you, the raskvel in front of you wastes no more time in taking firm hold of your head and driving his leaking, over-sized dick into your mouth, and the frenetic spit-roast begins afresh. The pair of them don’t take long to reach a fresh set of orgasms, their hands clenching on your thighs and neck as they propel fresh cum into your softened ");
	if(pc.hasVagina()) output("pussy");
	else output("ass");
	output(" and sucking maw... but that’s simply a signal for them to swap positions again, their apparently insatiable purple dicks still pointing fiercely upwards, ever eager to thrust into another tender orifice of yours, making the very most out of ");
	if(aphrodisiaced) output("your exotic offworlder flesh");
	else output("your wriggling, shortstack flesh that they know so well how to manipulate");
	output(".\n\nYou are made to cum again and again, out of pattern with them, ");
	if(pc.hasVagina()) 
	{
		output("your ");
		if(pc.totalVaginas() == 1) output("pussy");
		else output("pussies");
		output(" tightening up and pulsing around the demanding thrust of their cocks");
		if(pc.wettestVaginalWetness() >= 3) output(", dribbling ferment onto the dust");
		output(".");
	}
	else if(pc.hasCock()) 
	{
		output("your cock");
		if(pc.cockTotal() > 1) output("s");
		output(" thickening, simmering with heat and then flexing cum out uselessly to the relentless bumping against your buried boy button.");
	}
	else output("your ass tightening up and pulsing around the demanding thrust of their cocks, that strange anal orgasm of yours tightening up your whole body in unwanted ecstasy.");

	output("\n\nAt long, long last, when the biggest one withdraws from your [pc.asshole] and the middle-sized one from your [pc.lips]. After burying yet another warm load in you deep, their lengths flop downwards. They release you with lazy, satiated groans, and you are allowed to sink to the ground, panting hoarsely, raskvel cum oozing richly out of each and every hole you own.");

	output("\n\n<i>“Whew!”</i> one of them sighs. Somebody pats your [pc.ass] comfortingly. <i>“Sorry if we got a bit carried away there, ");
	if(aphrodisiaced) output("but it’s not often we get to tap offworlder ass, y’know? And you shouldn’t have tried it on with us.");
	else output("but you gotta learn what to expect if you want to be one of us, y’know?");
	output("”</i>");

	output("\n\n<i>“Just agree to have fun with us next time,”</i> suggests one of the others. <i>“Doesn’t have to be so rough.”</i>");
	output("\n\nWith that they turn back to their junk pile, happily nattering to one other as they leave you in a quivering, leaking pile in the dust.\n\n");
	processTime(55);
	for(var i:int = 0; i < 3; i++)
	{
		pc.loadInMouth(enemy);
		if(pc.hasVagina())
		{
			for(var v:int = 0; v < pc.vaginas.length; v++) { pc.loadInCunt(enemy, v); }
		}
		else enemy.loadInAss(pc);
		pc.applyCumSoaked();
	}
	pc.orgasm();
	CombatManager.genericLoss();
}

//Seduction
//Requires: Not a centaur, has a vagina, feminine, 70%+ intelligence, 3+ sexiness clothing OR female Treated, 3+ sexiness clothing
//If requirements met add following text to paragraph if the raskvel attack: It occurs to you that there might be another, cleaner way out of this... if you use your feminine wiles to your best advantage.

public function nopeGonnaFightCapn():void
{
	clearOutput();
	showRaskGang();
	pc.createStatusEffect("Seduction Declined",0,0,0,0);
	output("You’d rather show these brutes what you’re made of than titillate them any further.");
	CombatManager.continueCombat();
}

public function seduceTheRaskvelAttackYaNerd():void
{
	clearOutput();
	showRaskGang();
	userInterface.showBust("RASKVEL_GANG_NUDE");
	output("<i>“Oh no, the big strong raskvel are going to get me!”</i> You widen your eyes in dismay and set your upper lip to tremulous as the three of them surround you. <i>“Please don’t get rough with me! Oh, this is all too much...”</i> you deliberately stagger back into the medium sized one, gasping as you do, pushing your [pc.butt] against his hard, flat abdomen. You throw an arm around his shoulders, apparently for support, and bend into his ear.");
	output("\n\n<i>“You won’t let them harm me, will you?”</i> you whisper, letting your warm breath curl around his long ears and neck. <i>“It’s plain to see you’re the smartest one here, you could make them go away... imagine the fun we could have, just the two of us...”</i> He pushes you off him, but you can see that the laughter on his face has been replaced with a slight, uncertain frown.");
	output("\n\n<i>“What did she say to you?”</i> says the smallest suspiciously. The biggest makes to grab you; you dart out of his reach.");
	output("\n\n<i>“Why do you have to be so mean?”</i> you mewl");
	if(pc.biggestTitSize() >= 3 && pc.isChestGarbed()) output(", allowing your [pc.chest] to shift and heave conspicuously in your [pc.upperGarment]");
	output(". <i>“All this violence. Why, I’d love to do... such things with strong, youthful boys as you...”</i> you purse your [pc.lips] and allow your [pc.eyes] to drift winsomely over all three, favoring each of them equally. <i>“But when there’s three of you all getting rough together, it’s just, just too much!”</i> The smallest one seems to be in a slight daze, his long flap-like ears and feathers twitching as he gazes at you. You drape yourself over him, very gently caressing his lower back, stopping before the rise of his round, pert bum.");

	output("\n\n<i>“I bet those two don’t let you have any fun,”</i> you breathe in his ear. <i>“Always the last and least for you, isn’t it? I can tell, and it makes my heart ache to think of you being so unhappy. Imagine if it were just you and me... if you had me all to yourself...”</i> His breath is coming thick and hard.");

	output("\n\n<i>“Look, knock it off,”</i> says the biggest weakly. <i>“If you want to have fun, stop doing... doing that and we’ll share. That’s how we do it.”</i>");

	output("\n\n<i>“Really?”</i> you gaze at him with sculpted, sophisticated incredulity. You allow a finger to trail down your face and then suck on it as you stare, apparently unaware of the effect this has on three increasingly flared reptilian libidos. <i>“You share? You call this undignified tumble, with other nasty man parts flying everywhere, satisfying no one, really... sharing?”</i> You ");
	if(pc.isNaga()) output("slither");
	else if(pc.isGoo()) output("ooze");
	else output("pace");
	output(" slowly towards him as you talk, lowering your tone as you go until only he can hear you. <i>“I can barely believe you, the biggest, the strongest, the leader, </i>shares<i> with these two rejects. Is that really proper? The alpha of the pack, sharing?”</i> he takes a big shuddering breath as you gently touch the bottom of his chin with your damp finger.");

	output("\n\n<i>“I... maybe if – ”</i> he howls and jerks in pain as the smallest one, who has crept up behind him, lands him a savage blow with his wrench.");

	output("\n\nYou stand back and watch with a pleased smile as the three raskvel descend into a howling red ball of flying fists, tails, feet and recriminations, mauling each other in an explosion of sexual aggression, purely to try and win a chance to make it with you. If you wanted to sneak away, this would be the time to do it. Or you could stay and see if you can have some further fun with whoever wins...");

	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	processTime(3);
	//[Sneak away] [Stay]
	clearMenu();
	addButton(0,"Sneak Away",sneakAwayFromRaskvel);
	addButton(1,"Stay",stayAroundForBonusRaskbuttSex);
}

//Sneak away
public function sneakAwayFromRaskvel():void
{
	clearOutput();
	showRaskGang();
	userInterface.showBust("RASKVEL_GANG_NUDE");
	output("With all three of the raskvel entirely concerned with beating the hell out of each other, it’s easy for you to quietly take your leave. You giggle to yourself as you imagine the expression of whoever wins, once he realizes you’re no longer there.");
	CombatManager.abortCombat();
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Stay
public function stayAroundForBonusRaskbuttSex():void
{
	clearOutput();
	showRaskGang();
	userInterface.showBust("RASKVEL_MALE_NUDE");
	var raskWinner:String = "big";
	output("You settle down and watch the animalistic display. It’s quite arousing, in its own way – you’re essentially watching three young males rut over you. Their growls and gasps fill the air, their muscles clenching and shuddering, sweat mingling on their rusty scales as they wrestle, punch and bite each other’s taut flesh angrily. You don’t know if raskvel produce testosterone but certainly there’s a wild, bitter-sweet smell in the air which makes ");
	if(pc.hasVagina()) output("[pc.eachVagina] react, spreading and moistening welcomingly");
	else output("your head shiver");
	output(".");

	if(rand(3) == 0) 
	{
		output("\n\nThe smallest fights with the savagery born of a lifetime of frustrations, and against all the odds – and the early blow which knocked his biggest competitor semi-comatose – he is the eventual victor.");
		raskWinner = "small";
	}
	else if(rand(2) == 0) output("\n\nThe medium sized one is able to match speed with strength, and eventually overcomes the other two.");
	else output("\n\nDespite the early blow dealt him from behind the biggest one is simply far too strong for the other two, and is eventually able to pummel them into submission.");
	output(" He leaves his opponents in a stunned heap and staggers towards you. You can see it’s not just you that got turned on by the fight – his purple erection is reaching well out of its slit, the only part of him that doesn’t look battered and bruised. You smile at him widely, tracing the shape of your [pc.nipple]");
	if(pc.isChestGarbed()) output(" through your [pc.upperGarment]");
	output(" and slowly licking your [pc.lips]. His response to this is to stumble and fall at your [pc.feet].");

	output("\n\n<i>“Please,”</i> he groans, staring up at you blearily. He’s completely under your spell; you idly consider what task to put him to.");

	processTime(6);
	pc.changeLust(7);
	//[Lick pussy] [Lick feet]
	clearMenu();
	addButton(0,"Lick Pussy",lickPussyRaskButt,raskWinner,"Lick Pussy","Put the winner to work on your pussy, where he belongs.");
	addButton(1,"Lick Feet",feetLickingGoodTimes,raskWinner,"Lick Feet","Put the winner to work down at your feet, where he belongs.");
	if(pc.hasTailCunt()) addButton(2,"Tail Cunt Milk",seduceCuntTailMilk,raskWinner,"Tail Cunt Milk","Milk the winner dry with your tail-mounted twat.");
	else addDisabledButton(2,"Tail Cunt Milk","Tail Cunt Milk","This requires a tail vagina!");
}

//Lick pussy
public function lickPussyRaskButt(raskWinner:String = "big"):void
{
	clearOutput();
	showRaskGang();
	userInterface.showBust("RASKVEL_MALE_NUDE");
	output("<i>“Oh, very well,”</i> you whisper, ");
	if(pc.isCrotchGarbed()) output("slowly sliding off your [pc.lowerGarments] and ");
	output("spreading your [pc.hips]");
	if(pc.hasCock()) output(", shifting [pc.eachCock] out of the way to properly present yourself");
	output(". From his position on the ground raskvel dazedly gazes in at the moist, parting veil of [pc.oneVagina], mouth slightly ajar, panting quietly. <i>“I suppose you’ve earned the right to have a taste. Just a taste...”</i>");

	output("\n\nYou sigh as he hooks his arms around your thighs – more for support than anything, poor boy – and sinks his face into your crotch. He pauses before your opening, gathering his breath, the warmth of his exhalations wafting over your sex, increasing your anticipation");
	if(pc.hasClit()) output(" so that [pc.eachClit] plumps up, practically demanding attention");
	output(". You rub behind his feathers encouragingly – finding a spot underneath his ear that makes him tense and exhale raggedly, his tail flopping this way and that – and finally he bends forward and spreads his broad tongue over your sex.");

	output("\n\nThe sodden, rhythmic sound of cunnilingus fills the dusty air as he laps at you, his long, ever-so-slightly rough mouth muscle shifting across your [pc.vagina " + x + "], thrills shooting up your spine every time the warm, wet texture of it blankets over your");
	if(pc.hasClit()) output(" [pc.clit]");
	else output(" labia");
	output(". You tighten the ");
	if(pc.legCount > 1) output("grip of your [pc.hips] around the sides of his head");
	else output("grip of your hand on his feathers");
	output(", ensuring that worshipful mouth goes nowhere.");

	output("\n\n<i>“That’s it,”</i> you coo. <i>“What a fine reward for all your hard efforts, hmm? Make it shine, my little warrior...”</i> You bite your lip and close your eyes as he slips his tongue inside of you, lapping at your soft, inner walls. Such is the size and length of it he’s able to reach far up your tunnel, searching and coaxing out more of your nectar, packing it full of writhing, rubbing flesh.");
	if(pc.totalVaginas() > 1) 
	{
		output(" With a few murmured, humoured instructions, you are able to make him pull out and lavish the same treatment on your [pc.vagina 1], ");
		if(pc.totalVaginas() > 2) output("each");
		else output("your two primary pussies");
		output(" burnished to a froth of high excitement by his moving, seeking, servile mouth.");
	}
	output(" His eyes are closed as he does it, dizzily lost in the “prize” he’s won.");

	output("\n\nYou sit there, gasping quietly, luxuriating in the pleasure shimmering and tingling through you as long as you possibly can; when the urge to do so gets too much, you grasp his long ears and bury his face firmly into your cunt, pumping your thighs hard into his head, pushing towards your fast approaching high. You exhale exultantly when you reach it, the pulses clenching up [pc.eachVagina] and your [pc.legOrLegs] made all the better by the steady warm rasp moving across your");
	if(pc.hasClit())
	{
		output(" throbbing clit");
		if(pc.totalClits() > 1) output("s");
		output(" and");
	}
	output(" inner walls. As well as coating his cheeks and nose in it you make sure he drinks down as much of your [pc.girlCum] as you can make him; it’s sheer gratification spurting your inordinate amount of juices down an obedient, thirsty throat.");

	output("\n\nYou release your grip when you’re done, letting him flop onto his back, allowing yourself a good wallow in the afterglow whilst you look down at your toy. If anything, he’s harder than he was than when he started; his ");
	if(raskWinner != "small") output("broad, purple dick");
	else output("stubby, purple boy-prick");
	output(" stands almost painfully on end, the taste and texture of you evidently only turning him even more on.");

	output("\n\n<i>“Please...”</i> he groans again. You hold his powerless gaze as you reach down and place a single, dainty fingertip on the fevered flesh at the bottom of his dick; then, very gradually, you move it upwards. It’s near the tip when he cums, a doubling up of his muscled thighs and back to cause a single spout of white cum to erupt upwards, landing straight back down on his stomach. He moans long and low as he relaxes back into the dust, a sound of defeat more than anything.");

	output("\n\n<i>“Good boy,”</i> you leer down at him, before getting up");
	if(!pc.isNude()) output(", rearranging your clothes,");
	output(" and then setting off again, leaving all three of them unconscious on the ground having never lifted a finger. Well, except one.");

	processTime(17);
	pc.orgasm();
	CombatManager.abortCombat();
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Lick feet
//Requires: biped
public function feetLickingGoodTimes(raskWinner:String = "big"):void
{
	clearOutput();
	showRaskGang();
	userInterface.showBust("RASKVEL_MALE_NUDE");
	output("You raise an arch eyebrow at the kneeling raskvel, allowing a faint, disdainful smile to creep onto your face. You extend a [pc.foot], gently circling it in front of his face.");

	output("\n\n<i>“And now you want to get your dirty mitts on me, do you?”</i> you say softly. Wriggle wiggle, goes your dainty [pc.foot]. The weary red reptilian has his eyes on it; you let your words sink into him as you continue to rotate your [pc.foot], changing direction from time to time... <i>“This isn’t what I wanted at all. Such violence towards your friends. Such brutality. Why should I let a wicked brute like you anywhere near my body?”</i>");

	output("\n\n<i>“No...”</i> mumbles the entranced raskvel, head swaying gently with the movements of your foot. <i>“I proved... you said...”</i> He gestures dozily at the stunned pile of brawny scales behind him. <i>“I’m the... let me prove...”</i>");
	output("\n\n<i>“Oh, very well,”</i> you whisper. You bend ");
	if(pc.hasLegFlag(GLOBAL.FLAG_PAWS)) output("the pad of your big claw");
	else output("your big toe");
	output(", touching his warm lips with it. <i>“You may prove yourself to be something other than a savage animal, and then we’ll see if you’re worthy of anything else.”</i>");

	output("\n\nThe soft, wet, slightly rough texture of the raskvel’s long, purple tongue spreads itself across the underside of your [pc.foot] and you hum quietly in enjoyment as it shifts across it gently. Whatever reservations the raskvel may have once harboured about doing this are quickly lost in the task of giving your pads the treatment they deserve; eyes closed, feathers bobbing, ");
	if(!pc.hasLegFlag(GLOBAL.FLAG_CHITINOUS)) output("he envelopes one digit after the other in his hot mouth, sucking on them, gently pulling at them as he disengages and moving onto the next.");
	else output("he trails his tongue across the chitin of your boot-like insect leg, polishing your instep to a high, latex-like sheen");
	output(". You continue to bend and flex your [pc.foot] placidly, murmuring coy encouragement to your kneeling boy-toy when he moves on to the areas you wish him to concentrate on.");

	output("\n\nRaskvel tongue really is extremely good for the purpose you’ve set it to – with the width and length of his wet, flexible muscle he is able to entirely coat the bottom of your [pc.foot] and, with careful laps, send sparks of delightful sensation rushing up your [pc.leg] and burrowing into [pc.eachVagina].");
	if(pc.hasLegFlag(GLOBAL.FLAG_CHITINOUS)) output(" Armored in stern chitin they may be, but you still harbor vast numbers of nerves in your feet, and you can feel them shooting off in a strange, decentralized kind of way under the pressure of the worshipful licking, and the pleasure is almost better for the vaguely frustrating, alien manner of its conveyance.");
	else output(" You harbor vast numbers of nerves in your [pc.feet], and they shoot off in small explosions of pleasure under the pressure of the worshipful licking.");
	output(" The wet massage is made all the better by how it’s being conducted – by this rough, rape-happy savage you’ve tamed into a quiet, needily attentive foot servant.");

	output("\n\n<i>“You enjoying yourself down there?”</i> you giggle, withdrawing your saliva-gleaming [pc.foot] from him. The rabbit-reptile doesn’t answer; he looks almost stoned, his eyes vague as he gazes up at you. You redirect his attention by wiggling ");
	if(pc.legCount == 2) output("your other ");
	else output("another ");
	output("[pc.foot] in his face. <i>“Of course you are. You may continue.”</i>");

	output("\n\nHis mouth feels just as good concentrated on your other [pc.foot], rivulets of delicious pleasure running up your [pc.leg] to the steady lap of his tongue ");
	if(pc.hasLegFlag(GLOBAL.FLAG_CHITINOUS)) output("polishing the point of your boot");
	else output("between the gaps of your toes");
	output(" and you’re feeling quite aroused in a leisured kind of way by the end, sensuous and pleased. You smirk down at him once you finally decide you’ve had enough, deliberately turning your attention to your [pc.feet], turning them this way and that, allowing him a grudgingly admiring raise of the eyebrow as you consider each of your extremely clean [pc.feet]. You return your [pc.eyes] to the raskvel. If anything, he’s harder than he was than when he started; his ");
	if(raskWinner != "small") output("broad, purple dick");
	else output("stubby, purple boy-prick");
	output(" stands almost painfully on end, what you’ve made him do, the taste and texture of you evidently only turning him more on.");

	output("\n\n<i>“Please...”</i> he groans again. You hold his powerless gaze as you reach down and place a single, dainty fingertip on the fevered flesh at the bottom of his dick; then, very gradually, you move it upwards. It’s near the tip when he cums, a doubling up of his muscled thighs and back to cause a single spout of white cum to erupt upwards, landing straight back down on his stomach. He groans long and low as he relaxes back into the dust, a sound of defeat more than anything.");

	output("\n\n<i>“Good boy.”</i> You leer down at him, before getting up");
	if(!pc.isNude()) output(", rearranging your clothes,");
	output(" and then setting off again, leaving all three of them unconscious on the ground having never lifted a finger. Well, except one.");

	processTime(17);
	pc.orgasm();
	CombatManager.abortCombat();
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


public function seduceCuntTailMilk(raskWinner:String = "big"):void
{
	clearOutput();
	showRaskGang();
	userInterface.showBust("RASKVEL_MALE_NUDE");
	author("MistyBirb");

	output("You walk towards the exhausted raskvel and set your hands on your [pc.hips], looming over him. You smirk at how well your plan worked, thinking about what you want to do to him and his delicious-looking cock. But your thoughts are interrupted by a tingling from your rear. You notice your tail hovering between your legs, the [pc.tailVagina] at its tip literally dripping with desire.");
	
	output("\n\n<i>“Mmm, somebody’s hungry,”</i> you purr, setting one foot on either side of the raskvel to stand directly above him. Your tail hangs down, gravitating towards his quivering dick. A few drops of girlish lust land on his groin, and he squirms beneath you.");
	
	output("\n\nHe takes a deep breath, staring up into your eyes. <i>“W-what are you-”</i> Your cunt tail swallows the tip of his manhood, cutting him off.");
	
	output("\n\n<i>“Hush. It’s time for your reward, just like I promised.”</i> You ease yourself down and push him onto his back, settling your [pc.butt] atop his scaled abdomen. ");
	if (pc.tallness >= 84) output("Considering how you dwarf the raskvel beneath you, you’re forced to support most of your own weight, but you apply just enough pressure to keep him firmly pinned to the ground. ");
	output("Your tail begins to twitch, and your face grows hot as jolts of pleasure shoot up your spine. Slowly, your tail slides up and down its meal, thoroughly lubing the raskvel’s reptilian shaft. The victor of your scheming contest just lies there, looking a bit confused but also seeming to enjoy himself. Your tail picks up the pace, and the raskvel grunts as his dick is teased to an almost painful hardness.");
	
	output("\n\nHe blinks a few times as he pieces together what’s actually happening to him, peeking around your hips to get a glimpse of your tail. His mouth falls open as he sees -and feels- the rapid pulsations of the hungry orifice around his cock, tight enough to keep any pre that manages to slip from the head of his dick trapped inside. He winces and falls back onto the ground as your tail swallows his tool in its entirety, his tight, rounded balls pressed against the stretched entrance of your tail’s vagina.");
	
	//has deek
	if (pc.hasCock()) {
		output("\n\nWhile your tail works the cock behind you, you ");
		if(pc.hasArmor() && !(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN))) output("fumble with the front of your [pc.armor] and ");
		if(pc.hasLowerGarment() && !(pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN))) output("pull your [pc.lowerUndergarment] away");
		else output("lean back");
		output (" to expose your own [pc.multiCocks], now standing fully erect in the open air. The raskvel eyes you warily, which makes you smile. <i>“Not for you,”</i> you whisper as your begin to tug and stroke, <i>“Not yet, anyways...”</i>");
	}
	//deekend
	
	output("\n\nYour other slit");
	if (pc.hasVaginas()) output("s");
	output(" refuse");
	if (pc.hasVaginas()) output("s");
	output(" to be ignored, soaking your partner’s scaly stomach with [pc.girlCum]. You tuck a finger into [pc.oneVagina], then another, playing with yourself and teasing [pc.eachClit] as your tail continues to squeeze the alien’s rock-hard length.");
	
	output("\n\nThe raskvel moans and tosses his head from side to side, fully immersed in your [pc.tailVagina]. You feel him straining against you, unable to move freely with your weight on top of him. He grips your ass and bucks his hips as much as he can, his dick not finding the depths of your tail as it moves alongside him. He keeps thrusting, trying to find the end of your tail cunt and letting out a plaintive whine when he can’t.");
	
	output("\n\nYou glance over your shoulder ");
	if (pc.hasWings()) output("and pull your [pc.wings] out of the way ");
	output("to watch the show, giving your tail and the firm dick inside it a few affectionate strokes. [pc.eachVagina] cries out for even more attention, prompting you to send your fingers a little deeper and pinch [pc.eachClit] a little harder. The pleasure comes from all sides, and you’re forced to lean heavily against the raskvel’s torso to keep yourself from tipping over. ");
	if (pc.tallness >= 84) output("You almost crush the little guy, but you manage to pull yourself back up before he lets out more than a squeak of genuine discomfort. ");
	output("Ragged gasps escape your lips, matching the alien pinned beneath you.");
	
	output("\n\nYou assert a more conscious control of your tail, twisting and pulling the raskvel’s dick back and forth. Slow, fast, hard, and soft, you mix and match every technique you can. The raskvel whimpers, sometimes in pain, sometimes in pleasure, as your thirsty cunt tail milks him for all he’s worth. ");
	if (pc.hasCock()) {
		output("Your own cock");
		if(pc.hasCocks()) output("s");
		output(" near");
		if(!pc.hasCocks()) output("s");
		output(" the point of no return, and you can’t suppress a few shivering thrusts into the empty air as you grind against the raskvel’s chest.");
	}
	
	output("\n\nThe movements of your tail become more extreme, almost desperate, and the wet slapping it makes as it pleasures the raskvel is positively sordid. The battered alien grits his teeth and throws his hips forward one last time, actually managing to lift you into the air ever-so-slightly. Your [pc.eyes] go wide as a surge of warm, sticky cum fills your tail pussy, the voracious opening sealing around its meal with incredible force and sending tremors through your body.");
	
	if (pc.hasCock()) {
		output("\n\nYour hand falls aside as orgasm overtakes you, [pc.multiCocks] pulsing and ");
		if (pc.cumQ() >= 15000) output("drenching the raskvel’s upper body with a torrent of [pc.cum]. ");
		else output("covering the raskvel with [pc.cum] from the chest up. Your powerful release leaves you twitching helplessly, mind blanked by bliss.");
	}
	
	output("\n\nThere’s no way you can hold back a shameless whine as [pc.eachVagina] ");
	if (pc.isSquirter()) output("showers your companion’s hips and everything around him with [pc.girlCum]");
	else output("sends even more [pc.girlCum] dribbling down your companion’s hips");
	output(", and the earth below is stained with the lust of your spasming slits.");
	
	if (pc.isLactating()) output("\n\nBeads of [pc.milk] slip down your [pc.fullChest], the intensity of your orgasm coaxing out a bit of your motherly bounty. As you throw your head back and submit fully to pleasure, your release kicks up, and thick streams of [pc.milk] coat the raskvel’s stomach and your own [pc.skinFurScales].");
	
	output("\n\nThe climax lasts for a few wondrous moments, but you eventually descend. You let out an exhausted sigh, then slide off the panting raskvel and give him a pat on the chest. Your limp and satisfied tail follows suit, gradually releasing his member with a wet slurp. Freed from the weight of your body, the raskvel groans and rolls onto his side, while you refocus your thoughts and gather your things.");
	if (pc.hasArmor()) output(" You sort your appearance, smooth your clothing, and do a quick pat-down to make sure nothing is forgotten.");
	output(" As you get ready to leave you notice the raskvel, curled into a ball and tenderly massaging his deflated cock.");
	
	if (pc.isNice()) output("\n\nA sheepish grin spreads across your face. You might have been a little too rough with the poor thing. As you turn around to leave, you see the unconscious forms of the other two raskvel, and your embarrassed grin turns into an awkward wince. You feel rather guilty about the chaos you’ve wrought, but what’s done is done. You give an apologetic bow to nothing in particular and scurry off.");
	if (pc.isMischievous()) output("\n\n<i>“Aww, is somebody sore?”</i> you tease. He grunts incoherently and rolls over, keeping his back to you. You laugh and step over the other two raskvel, idly wondering which side wound up with the better deal. It doesn’t really matter in the end, because none of them got off as well as you did. You smile and set out across Tarkus once more, tail curling happily around your leg.");
	if (pc.isAss()) output("You let out a sigh that draws the raskvel away from his aching groin. <i>“You’re fine. Walk if off.”</i> He clears his throat and shakily stands up, managing a few steps and an embarrassed grimace. He does his best to come off as a victorious, dominating Alpha, but looks anything but. You shake your head and set off across Tarkus once more.");

	processTime(17);
	pc.loadInCuntTail(enemy);
	pc.orgasm();
	CombatManager.abortCombat();
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}