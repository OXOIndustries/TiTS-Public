

public function newTexasRoadFirstTime():Boolean
{
	if(!pc.hasStatusEffect("Disarmed")) 
	{
		customsFucksYourShitUp();
		return true;
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
	//First Time Entering the Shop
	if(flags["SEEN_ELLIES_SHOP"] == undefined)
	{
		flags["SEEN_ELLIES_SHOP"] = 1;
		output("You step into the gift shop, pushing the glass door open ahead of you. You all but recoil when the door slides open, and an almost overpowering aroma assails your senses. It feels like you’ve just been hit by a brick, right in the chest; catching your breath is almost impossible for a long moment. Your mind swims as the potent musk in the shop washes over you, and you suddenly manage to identify the odor: sex. Raw, untamed sexuality and need. Your skin flushes as the musky odor clings to you, feeling like a haze around you as you force yourself to walk, not run, into the gift shop.\n\n");
		//applyDamage(new TypeCollection( { tease: 10 } ), null, pc, "minimal");
		pc.lust(10);
	}
	else pc.lust(5);
	output("The gift shop looks like every other gift shop in the ‘verse, with racks of memorabilia ranging from ten-gallon hats to holographic greeting cards. There’s a pretty good line leading up to the cashiers, and the most popular item going out seems to be a small white medipen labeled “The Treatment.” ");
	if(flags["MET_ELLIE"] != undefined) output("Ellie");
	else output("A tauric woman with black scales on her lower body and a massive GG-cup rack, only barely restrained by a semi-translucent bra that’s stained with milky moisture");
	output(" is overseeing the automated shopping terminals, occasionally distracted by a customer’s query or a particularly flirty bull wandering through.");
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
	vendingMachineButton(2, "J'ejune");
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