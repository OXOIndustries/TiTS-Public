public function newTexasCoordinatesUnlocked():Boolean
{
	return (flags["NEW_TEXAS_COORDINATES_GAINED"] != undefined);
}

public function newTexasRoadFirstTime():Boolean
{
	if(!pc.hasStatusEffect("Disarmed")) 
	{
		//Hasn't agreed to disarm yet
		if (flags["NEW_TEXAN_CUSTOMS_MET"] == undefined)
		{
			customsFucksYourShitUp();
			return true;
		}
		//Repeat encounters
		else
		{
			flags["CHECKED_GEAR_AT_OGGY"] = (pc.hasEquippedWeapon() ? 1 : 0);
			pc.takeMeleeWeapon();
			pc.takeRangedWeapon();
			pc.createStatusEffect("Disarmed",4,0,0,0,false,"Blocked","You’ve checked all forms of weaponry at New Texas’ customs.",false,0,0xFF0000);
			processTime(1);
			output("You check your gear with Ogram and step out onto New Texas.\n\n");
		}
	}
	//First time:
	if(flags["SEEN_TEXAS_SURFACE"] == undefined)
	{
		output("So this is New Texas, the pastoral paradise, huh? With the seemingly endless blue sky, rustic-looking structures, and rolling fields of grass and grain, you can see where it got its name. Presently you’ve stepped out onto a bumpy dirt road; it’s fortunate the locals rely on hover-based transit over primitive wheel systems, or they’d need to invest a little more heavily into their infrastructure. A huge barn looms over you to the south. Just inside the doors, you know there’s a customs checkpoint and more ships than you bother to count. To the north sits a ranch house, the kind with a big, elevated porch that would normally house a farmer and his extended family. This one is dressed up with a bit of extra flair. Signs declare it to be the official visitor’s center.");
		flags["SEEN_TEXAS_SURFACE"] = 1;
	}
	//Repeat
	else
	{
		output("You recognize this spot on the dusty country road. It’s where you got your first real look at New Texas’ so-called pastoral paradise. The whole place is built up in the style of old terran farms. The hangar is designed to resemble a gigantic barn, despite its contents being made of gleaming metal instead of flesh. Off to the northeast is a fancy ranch house, replete with a fenced-in porch, rocking chairs, and a dazzlingly white coat of paint. In other directions are fenced off fields.");
	}

	return false;
}

//Rearms the PC automatically
public function autoRearmNewTexas():Boolean
{
	if (pc.hasStatusEffect("Disarmed"))
	{
		returnAllItems(true);
		pc.removeStatusEffect("Disarmed");
		flags["CHECKED_GEAR_AT_OGGY"] = undefined;
		output("You reclaim your gear from Ogram and continue on your way.\n\n");
		processTime(1);
	}
	//Room descriptive text
	output("Naturally, next to the space dock you have the cargo deck. Here, crates full of offworld goods and local produce are going back and forth on conveyer belts, overseen by several bull-men in overalls and caps. Most of the out-going produce is labeled “milk,” packaged in huge, temperature-controlled barrels. To the north, a small office has been set off from the rest of the barn with a big, friendly sign over the door labeled “Customs”. Your ship is parked back to the east.");
	return false;
}

public function milkBarn512Func():Boolean
{
	output("You’re standing square in the middle of a wide passage that runs north-south through the center of the barn. Stalls line it on either side along its whole length, but what really catches your eye is the bank of blinking lights built into the eastern wall. Flat panel displays, blinking lights, and various keypads all vie for your attention. It looks like you’ve found the controls for the barn’s machinery.");
	if(9999 == 9999)
	{
		output(" The stall next to the console is closed, and marked “occupied”. Faint moans emanate from within.");
		flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
	}
	else output(" The stall next to the console is slightly open, and marked “unoccupied”.");
	output(" Opposite, the door hangs open. You could step inside if you wished.");
	
	giannaBonusShit();
	
	return false;
}
public function milkBarn513Func():Boolean
{
	output("It’s not often you get to see buildings constructed in the ancients’ styles, built with nothing more than beams of hewn wood, sweat, and a few metal bolts. Of course, here and there you see hints of modern technology running through it. New Texas may be an upper-class tourist hotspot advertised as getting back to nature, but they’re obviously spending their credits on securing the best milking technology available.");
	if(9999 == 9999)
	{
		output(" Judging by the deep groans of pleasure coming from the sealed stall to the west, they’re milking more than milk too. The door to the east is marked “occupied” as well.");
		flags["NAV_DISABLED"] = NAV_WEST_DISABLE;
	}
	else output(" The door to the east is marked “unoccupied”.");
	output("\n\nYou can hear a dull thudding coming from one of the stalls to the east.");
	if (pc.hasStatusEffect("Haley Satisfied"))
	{
		output("\n\nHaley isn't at the milker. She probably won't need it for a while after winning your bet.");
		setNavDisabled(NAV_EAST_DISABLE);
	}
	
	return randomBarnEventFunc();
}
public function milkBarn514Func():Boolean
{
	output("The barn’s central thoroughfare comes to an abrupt end here at the north wall. Worse yet, only one of the stalls has the door open. You can enter it to the west, if you like. To the east, there’s rhythmic slapping along with the occasional grunt of male pleasure. Sometimes a quivering moan can be heard as well. The air is particularly thick with the musky scent of heated bodies writhing against one another back here. You’ll need to head south if you want to clear your head.");
	flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
	
	return randomBarnEventFunc();
}

public function manMilkerRoomBonusFunc():Boolean
{
	//Special Cameron Scene
	//PC has cock, has sexed Cameron, has used the milker, the milker isn't broken, hasn't done the scene in 24 hours, 
	//and then it's a ~15% chance
	if (pc.hasCock() 
			&& flags["SEXED_CAMERON"] != undefined 
			&& StatTracking.getStat("milkers/prostate milker uses") > 0 
			&& flags["MILK_BARN_COCKMILKER_BROKEN"] == undefined
			&& !pc.hasStatusEffect("Cameron Milker Cooldown")
			&& rand(7) == 0)
	{
		cameronCockMilker();
		return true;
	}
	
	output("Unlike most of the stalls in the Milk Barn, this one isn’t closed or empty.");
	if(StatTracking.getStat("milkers/prostate milker uses") == 0) output(" A single auburn-haired cow");
	else output(" Carrie");
	output(" is sitting on a stool near the door, dressed up in a cow-print corset, panties, and stockings, but otherwise the stall is empty. The center of the room is dominated by what looks like a padded steel vaulting horse with several holes drilled into the top. Pipes lead from the holes to drains and other machines along the walls. Looming overhead is a large, powerful-looking mechanical arm, from which dangles a huge");
	if(StatTracking.getStat("milkers/prostate milker uses") == 0) output(" floppy pink dildo.");
	else output(" pink dildo - better known as “Mister Floppycock.”");
	output("\n\nA sign overtop the stall reads in faded letters, “Male Milker.” Doesn’t take a genius to figure out what that means...");
	
	if (flags["MILK_BARN_COCKMILKER_BROKEN"] != undefined || flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] != undefined)
	{
		if(flags["MILK_BARN_COCKMILKER_BROKEN"] != undefined)
		{
			if(flags["MILK_BARN_COCKMILKER_SCANNED"] == undefined) addButton(0,"Fix Milker",yesFixDaMilkar,true,"Repair Milker","The male milker looks to be broken from your previous use... It’ll need to be repaired before you can use it again.");
			else addButton(0,"Fix Milker",yesFixDaMilkar,false,"Repair Milker","The male milker looks to be broken from your previous use... You’ll need to pay for the repairs before you can use it again.");
		}
		else if (flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] > 0) addDisabledButton(0,"Use Milker","OUT OF ORDER","The machine is currently being repaired. You’ll have to wait for it to be fixed first!");
		else addButton(0,"Use Milker",useDaMilkar,undefined,"Use Milker","It looks like the male milker has finally been fixed. It looks good as new!");
	}
	else if(pc.hasStatusEffect("NT Male Milker Disabled")) addDisabledButton(0,"Use Milker","Use Milker","It looks like the milkers are full of stud stock already. Maybe try again later...");
	else addButton(0,"Use Milker",useDaMilkar,undefined,"Use Milker","Use the male milker. It looks to function based off of prostate stimulation.");
	return false;
}

public function NTGiftShopBonusFunc():Boolean
{
	//Ellie Pregnancy Announcement
	if(flags["ELLIE_PREG_TIMER"] >= 1 && (flags["ELLIE_OPERATION"] == 1 || flags["ELLIE_OPERATION"] == undefined))
	{
		clearOutput();
		clearMenu();
		author("Wsan");
		showBust("ELLIE");
		showName("\nELLIE");
		
		output("Upon walking into Ellie's store, you can immediately tell something is different. There are fewer bulls milling around restlessly, and the air is somehow... clearer. Ellie, however, looks exactly the same. She stands at her till animatedly chatting to a cowgirl, and when she spots you she utters a little squeal and comes bounding around the counter, eyes wide with excitement.");
		output("\n\n<i>“[pc.name]!”</i> she squeals, ");
		if(!pc.isTaur() && pc.tallness < 8*12) output("sweeping you off your feet into a big, squishy hug between her huge breasts.");
		else output("throwing her arms around you and nuzzling her face into your neck, along with her massive rack into your [pc.chest].");
		if(pc.isBimbo()) output("\n\n<i>“Oof! Jeez, Ellie, did your tits get even bigger?”</i>");
		else output("\n\n<i>“Oof! Hello to you too, Ellie.”</i>");
		output("\n\nShe pulls back, ");
		if(!pc.isTaur() && pc.tallness < 8*12) output("lifting you into the air until you're level with her face, beaming at you proudly.");
		else output("looking you square in the eye and beaming proudly.");
		output("\n\n<i>“I'm pregnant!”</i> she brazenly announces to you in front of the entire store before pulling you in for another hug. <i>“We're gonna have kids!”</i>");
		if(pc.isBimbo()) output("\n\n<i>“Hooray! Tinytaurs!”</i> you squee.");
		else output("\n\nOvercome with emotion, you wrap your arms around Ellie in celebration. <i>“Ellie!”</i>");
		output("\n\nThe two of you rock side to side in each other's gleeful hugs, laughing and smiling in celebration.");
		output("\n\n<i>“It's gonna be so much fun,”</i> Ellie gushes. <i>“Our kids'll be so cute! I'm still trying to think of names! And I gotta get toys for them!”</i>");
		output("\n\n<i>“Whoa, slow down, Ellie,”</i> you say, suddenly comprehending something. <i>“Exactly how many kids are we having?”</i>");
		output("\n\n<i>“Three!”</i> she says, smiling happily without a care in the world. <i>“Two girls and a boy. I need a place to lay the eggs, too...”</i>");
		output("\n\n<i>“You can lay them at the Nursery, no problem,”</i> you reply, thinking about logistics for a second. <i>Three kids!</i> If they're anything like Ellie, this is going to be a real handful...");
		output("\n\n<i>“Thanks, [pc.name],”</i> Ellie says, squishing her chest against you. <i>“You're a real sweetheart, y'know that?”</i>");
		output("\n\n<i>“Hey, no problem,”</i> you reply, tightening your grip on her before letting go. <i>“Are you doing okay? Is there anything you need?”</i>");
		output("\n\n<i>“Hmm,”</i> she hums thoughtfully, tapping a plated finger against her pouty lips before fixing you with a cheerful smile. <i>“I could do with a kiss.”</i>");
		output("\n\nYou unhesitantly " + (pc.tallness < 8*12 ? "reach up and " : "") + "bring her pretty face closer to yours, planting a kiss right on her welcoming lips and leave her beaming radiantly.");
		output("\n\n<i>“Okay! I've been given leave for the next few months that I can use whenever I want, so let me know when you wanna check out the nursery 'n stuff!”</i> Ellie says, hopping back behind the counter.");
		flags["ELLIE_OPERATION"] = 2;
		//Might as well max this shit
		nephAffection(100);
		processTime(10+rand(5));
		addButton(0, "Next", mainGameMenu, undefined, "", "");
		return true;
	}
	//Ellie is at the Nursery visiting kiddos
	if(flags["ELLIE_AT_NURSERY"] != undefined)
	{
		output("Ellie doesn't seem to be around, and there's a little placard on her counter that reads 'out on break'. Maybe she's at the Nursery on Tavros?");
		addDisabledButton(0, "Ellie", "Ellie", "Ellie isn't around right now.");
		vendingMachineButton(1, "J'ejune");
		return false;
	}
	//Kids are about to be hatched why are you here
	if(flags["ELLIE_OPERATION"] == 3 && flags["ELLIE_PREG_TIMER"] == 70)
	{
		output("Ellie isn't here right now, she's at the Nursery waiting for you! You're gunna be a dad any minute now!");
		addDisabledButton(0, "Ellie", "Ellie", "Go to the Nursery! ASAP!");
		vendingMachineButton(1, "J'ejune");
		return false;
	}
	//First Time Entering the Shop
	if(flags["SEEN_ELLIES_SHOP"] == undefined)
	{
		flags["SEEN_ELLIES_SHOP"] = 1;
		output("You step into the gift shop, pushing the glass door open ahead of you. You all but recoil when the door slides open, and an almost overpowering aroma assails your senses. It feels like you’ve just been hit by a brick, right in the chest; catching your breath is almost impossible for a long moment. Your mind swims as the potent musk in the shop washes over you, and you suddenly manage to identify the odor: sex. Raw, untamed sexuality and need. Your skin flushes as the musky odor clings to you, feeling like a haze around you as you force yourself to walk, not run, into the gift shop.");
		applyDamage(new TypeCollection( { tease: 10 } ), chars["ELLIE"], pc, "minimal");
		output("\n\n");
	}
	output("The gift shop looks like every other gift shop in the ‘verse, with racks of memorabilia ranging from ten-gallon hats to holographic greeting cards. There’s a pretty good line leading up to the cashiers, and the most popular item going out seems to be a small white medipen labeled “The Treatment.” ");
	if(flags["MET_ELLIE"] != undefined) output("Ellie");
	else output("A tauric woman with black scales on her lower body and a massive GG-cup rack, only barely restrained by a semi-translucent bra that’s stained with milky moisture");
	output(" is overseeing the automated shopping terminals, occasionally distracted by a customer’s query or a particularly flirty bull wandering through.");
	if(flags["SEEN_ELLIES_SHOP"] != undefined) pc.changeLust(5);
	//Next, to room description. Add [Shopkeeper] button
	ellieApproachButtonSetup();
	return false;
}

//Big T.’s Barbeque Pit
public function NTBarbequeBonusFunc():Boolean
{
	clearOutput();
	author("Savin");
	showBust("HERMAN");
	//Fen: This’d be as good a place as any to stick Dane.
	output("The restaurant attached to the ranch house is a smoky, meaty-smelling BBQ joint, advertising authentic terran steaks, ribs, and roast beef sandwiches. An open grill dominates the far northern wall of the restaurant, with several tourists and cow-folk lined up to order some delicious barbeque. ");
	if(flags["MET_HERMAN"] != undefined) output("Herman the chef");
	else output("The chef");
	output(" is busily trying to fill the orders as they come in, clearly swamped with customers.");
	addButton(0,"Food",getFoodAtBigTs,undefined,"Food","See what’s on the menu.");
	addButton(1,"Watch Screen",stephIrsonBySavinWhoSaysHesTiredOfTreatedCowBimbosThenMakesHerATreatedCowGirlForShitsAndGigglesWhyIsThisFunctionNameSoLong,undefined,"Watch Screen","Watch an episode of Steph Irson: Galactic Hunter.");
	vendingMachineButton(2);
	return false;
}

public function randomBarnEntranceEventsFunc():Boolean 
{
	// Gonnae splice gobbles in here so it can be handled separately
	if (gobblesAvailable() && rand(3) == 0 && flags["GOBBLES_SEXYTIMES_STARTED"] == undefined)
	{
		supGobbles2014CanadaEdition();
		return true;
	}
	if (gobblesAvailable() && flags["GOBBLES_SEXYTIMES_STARTED"] == 1 && flags["GOBBLES_COOLDOWN"] != undefined && flags["GOBBLES_COOLDOWN"] >= 24 && rand(3) == 0)
	{
		trace("EVENT TRIGGERED!");
		canadaTheTurkeyRepeats();
		return true;
	}
	trace("SEXYTIMES?: " + flags["GOBBLES_SEXYTIMES_STARTED"] + " COOLDOWN? " + flags["GOBBLES_COOLDOWN"] + " GOBB AVAIL? " + gobblesAvailable());
	return false;
}

public function randomBarnEventFunc():Boolean
{
	var retVal:Boolean = false;
	
	//If Cameron is getting milked right now disable entering the male milker
	if (currentLocation == "511" && pc.hasStatusEffect("Cameron Getting Milked")) flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
	
	//Chance to proc any one of these events when passing by a milking stall. Each can proc 1/day at most.
	if(flags["MILK_BARN_EVENT_TODAY"] == undefined && rand(10) == 0)
	{
		//Cured Reaha
		if(9999 == 0 && rand(3) == 0)
		{
			output("\n\n<b>Reaha steps out of the stall as you pass by,</b> rubbing her reddened nipples after a little time on the milker. <i>“Oh, uh, hey [pc.name]!”</i> she says, blushing a little");
			//if reaha clothed
			if(!chars["REAHA"].isNude()) output(" as she pulls on her clothes");
			output(". <i>“When in Rome, right?”</i>");
			output("\n\nYou give your cow an affectionate pat on the head and send her on her way back home.");
		}
		//Treated Reaha
		else if(9999 == 0 && rand(3) == 0)
		{
			output("\n\n<b>Reaha steps out of the stall as you pass by,</b> stretching her powerful muscles and wiping away a few trickles of milk still drooling from her huge bust. <i>“Hey, [pc.name]!”</i> she says, shooting you a big grin. <i>“Figured I’d let the machine take a load off you this time. Don’t get used to it, though,”</i> she chuckles, giving you a playful punch on the shoulder");
			if(pc.physique() < chars["REAHA"].physique()) output(", though still hard enough to stagger you");
			output(".");
			output("\n\n<i>“See ya back at the ship. Maybe I’ll have a drink stored up for you... if you’re lucky.”</i>");
		}
		//Ellie
		else if(flags["MET_ELLIE"] != undefined && rand(5) == 0)
		{
			output("\n\nAs you pass by this stall, you hear a particularly lewd moan from inside, and can’t stop yourself from peeking in the door, which has been left open. <b>Ellie’s inside, awkwardly hooked up to the milkers</b> that were clearly made for bipedal cows. As she’s getting milked, a particularly buff looking bull is making use of her animalistic hind-quarters, pounding away at her with abandon. Seeing you walking past, Ellie gives you a playful wink before the pressure on her tits distracts her into another series of moans and groans.");
		}
		//Ellie II
		else if(flags["MET_ELLIE"] != undefined && rand(5) == 0)
		{
			output("\n\n<b>Ellie is wandering out of this stall</b> as you pass by, fiddling with the straps on her bra, which is already soaked with milk still drooling from her saucer-sized teats. <i>“Hey, sweet-thing!”</i> she says, wiggling on up to you in a cloud of sex-scent.");
			//if sex'd:
			if(flags["ELLIE_SEXED"] != undefined) output(" <i>“Wish I’d known you were out and about, I could have used a cute little thing to help me out instead of the rough old machine.”</i>");
			else output(" <i>“Have fun in the barn! I know I did!”</i>");
			output("\n\nShe gives you a playful wink before meandering off, winking at you from the back-side, too.");
		}
		//Gianna
		else if(flags["MET_GIANNA"] != undefined && rand(4) == 0 && currentLocation != "512")
		{
			output("\n\n<b>Gianna is stepping out of the stall as you pass by,</b> a mop slung over her shoulder and a big pail of milk in her left hand, sloshing over with fullness. <i>“Oh, hi, [pc.name],”</i> she says, stopping to give you a bright smile. <i>“Don’t mind me, just doing a little bit of cleaning. Some of the cow-girls get a little... messy sometimes.”</i>");
		}
		//Dane
		//Rare chance. Only outside of male milker. PC can't have beaten the Myrellion boss fight. 
		else if(flags["UNLOCKED_JUNKYARD_PLANET"] != undefined && rand(4) == 0 && currentLocation == "511")
		{
			output("\n\n<b>Of all the people to bump into... Dane, your cousin’s bodyguard, is wandering out of the male-milker stall</b>. He gives a big yawn as he steps out, a towel slung over one broad shoulder. Behind him, ");
			if(StatTracking.getStat("milkers/prostate milker uses") == 0) output("the stall attendant");
			else output("Carrie");
			output(" pokes her head out and waves. <i>“See you around, Dane!”</i>");
			output("\n\nHe gives a lazy wave back over his shoulder, and all but crashes into you while he’s distracted. <i>“Gah! Oh, uh, hey, [pc.name]. Just getting some R&R. Don’t tell your cuz.”</i>");
			output("\n\nBefore you can question it, the four-armed ausar man walks off. Huh.");
		}
		else if (brynnRandomBarnEventFunc())
		{
			if (flags["BRYNN_AUTOENTER"] == 1)
			{
				retVal = true;
			}
		}
		else
		{
			//Amma and Ogram
			if(rand(2) == 0)
			{
				output("\n\n<b>You see Ogram standing outside this stall</b>, leaning against the door with his arms crossed over his broad chest. <i>“Hey there, " + pc.mf("buddy","beautiful") + ",”</i> he says, inclining his head to you as you pass. <i>“Just waiting on the little lady in there.”</i>");
				output("\n\nThrough the stall door, you can hear pleasured moans and cries as his partner gets a little lactic relief.");
			}
			//Amma and Ogram II
			else
			{
				output("\n\n<b>Amma is stepping out of the stall as you pass by</b>, buttoning her blouse back up after a little time on the milker. A few droplets of excess milk quickly stain through the fabric. <i>“Hey, cutie!”</i> she calls, shooting you a wink across the barn.");
				if(pc.biggestTitSize() >= 5) output(" <i>“Come to spend a little time on the milker, too?”</i>");
				else output(" <i>“Come to see if any of the girls need a little </i>help<i> with their milkers? How sweet of you!”</i>");
				output("\n\nAs she speaks, Ogram steps out from the stall behind her, zipping his jeans back up. <i>“C’mon, you. Back to work before the big man sees we’re gone!”</i> He scoops Amma up under an arm like she weighs nothing at all, giving you a friendly wave before absconding with his giggling cow-girl partner.");
			}
		}
		flags["MILK_BARN_EVENT_TODAY"] = 1;
	}
	return retVal;
}
public function newTexasEncounterChances():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	IncrementFlag("NEW_TEXAS_STEP");
	
	var choices:Array = new Array();	
	
	//10% chance one of these procs when at least 20 steps taken
	if (rand(10) == 0 && flags["NEW_TEXAS_STEP"] >= 20)
	{
		if (tentongymCanEncounterLola()) choices.push(tentongymEncounterLola);
		if (tentongymCanEncounterSimone()) choices.push(tentongymEncounterSimone);
		if (tentongymCanEncounterBetsyVictoria()) choices.push(tentongymEncounterBetsyVictoria);
		if (tentongymCanEncounterLolaSimone()) choices.push(tentongymEncounterLolaSimone);
	}
	
	if (choices.length > 0) 
	{
		flags["NEW_TEXAS_STEP"] = 0;
		//Run the event
		choices[rand(choices.length)]();		
		return true;
	}
	
	return false;
}