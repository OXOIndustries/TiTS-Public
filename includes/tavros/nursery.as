// General support shit
public function hasNurseryUpgrades():Boolean
{
	return false;
}

public function hasNurseryStaff():Boolean
{
	return yammiAtNursery() || reahaAtNursery();
}

public function yammiIsFollower():Boolean
{
	return false;
}

public function yammiAtNursery():Boolean
{
	return false;
}

public function reahaAtNursery():Boolean
{
	return false;
}

// Room functions


public function nurseryFoyerFunc():Boolean
{
	output(" The Steele Tech logo is emblazoned across the wall opposite the elevator, surrounded by pastel-colored images of flowers and small animals");
	if (silly) output(" There’s even a cute little cartoonish cow!");
	output(". A holo-terminal dominates the western wall, slowly scrolling through reams of digital text - the status of");
	var numChildren:int = ChildManager.numChildrenAtNursery();
	if (ChildManager.numChildren() == 0) output(" the nursery. One glance says it’s waiting and ready for the first of your spawn.");
	else if (numChildren == 1) output(" your child.");
	else output(" your children.");

	if (flags["BRIGET_MET"] == undefined)
	{
		output("\n\nA pallid-skinned woman in a suit-jacket and skirt is standing behind a desk, consulting a Codex couched under her arm. She doesn’t appear to have noticed you yet.");
		addButton(0, "Woman", nurseryMeetBriget);
	}
	else if (hours >= 7 && hours <= 16)
	{
		output("\n\nBriget is busily typing away behind the welcome desk. Seeing you standing around, your nurse-droid favors you with a matronly smile and slows the pace of her work invitingly, making herself look more available for you.");
		addButton(0, "Briget", nurseryApproachBriget);
	}

	addButton(1, "Nursery Comp.", nurseryComputer, undefined, "Nursery Status Computer", "The holoterminal in the nursery is set up to monitor and summarize the status "+ (numChildren == 0 ? "of your potential children" : (numChildren == 1 ? "of your child" : "of all your children")) +", letting you stay up-to-date with a push of a button.");

	return false;
}

public function nurseryCafeteriaFunc():Boolean
{
	output("\n\nA pair of server bots are sitting in the kitchen, making sure there’s plenty of food and drink to go around.");
	if (yammiIsFollower() && !yammiIsCrew()) output(" Yammi’s hanging out in the kitchen, too, overseeing things while she’s not assigned to your ship’s crew.");

	return false;
}

public function nurseryG14Func():Boolean
{
	output("You’re standing in a long, pastel-blue corridor connecting the foyer to the children’s wing of the nursery.");
	var numKids:int = ChildManager.numInAgeRangeYears(2, 8);
	if (numKids >= 10) output(" It looks as though a tornado has swept through here, leaving toys scattered around <i>everywhere</i>.");
	else if (numKids >= 1) output(" A few toys have been scattered around, left by one of your kids passing through.");
	
	return false;
}

public function nurseryEducationCenterFunc():Boolean
{
	if (hours >= 7 && hours <= 16)
	{
		if (ChildManager.inAgeRangeYears(3, 16))
		{
			output("\n\nThe schoolrooms are up and operational now that you’ve started to deposit your offspring here. Steele Tech keeps several teachers on retainer here, and those who aren’t actively busy overseeing your children’s’ education are working away on future course material and lesson plans.");
		}
		else
		{
			output("\n\nWithout any children to attend to, the staff of teachers and experts on retainer are milling around the desk. They’re currently in the middle of a game of cards.");
		}
	}

	return false;
}

public function nurseryKidsDormsFunc():Boolean
{
	output("\n\nMost of the nursery deck is devoted to living space for what Dad must have assumed");
	if (ChildManager.numChildren() >= 10) output(" - correctly -");
	output(" would be many, many offspring. A central hub provides access to over a dozen small halls, branching off like tunnels in an anthill off in every direction. There must be hundreds of individual rooms available here, not to mention bathrooms, showers, laundry facilities... everything your heirs and the station’s support staff could ever need.");

	return false;
}

public function nurserySpecialistRooms():Boolean
{
	output("\n\nOf course, Dad couldn’t have predicted the needs of every alien species likely to");
	if (pc.hasVagina()) output(" knock you up");
	if (pc.hasVagina() && pc.hasCock()) output(" or");
	if (pc.hasCock()) output(" bear you an heir");
	output(", so the nursery comes equipped with a sub-deck of modular living chambers, able to easily be adapted to specific needs: from water tanks to zero-G to alternative atmospheres. Several specialist nurse-droids stand ready to tend to your more unique offspring.");

	var numSpecials:int = 0;

	if (ChildManager.ofType(GLOBAL.TYPE_VENUSPITCHER))
	{
		numSpecials++;
		output("\n\nOne of the modular chambers has been opened up and filled with soil sourced directly from Mhen’ga, allowing for the absolute best growing conditions possible for your venus pitcher offspring. Somehow, Briget has managed to secure a naleen female onto the staff, who is currently slithering about the jungle-like environ making sure everything is picture-perfect - and guaranteeing that your planty offpsring will have someone native to play with as they develop.");
	}

	if (ChildManager.ofType(GLOBAL.TYPE_WATERQUEEN))
	{
		output("\n\nConnected to the main entrance via a pressurized airlock is a water-filled chamber, simulating a deep saltwater lake with a sandy island in its center. Though the rooms inside are pitch black, a camera feed inside has been set to night vision, showing your Water Princesses scuttling about, half-submerged and completely hidden in the dark waters. Your head nurse has hired on a dusky female nyrea from their homeworld to help oversee their development - a brief word with her reveals the huntress is well acquainted with the Queen of the Deep, and that the princesses’ mother sends her regards.");
	}

	if (numSpecials == 0)
	{
		output("\n\nCurrently, the specialist deck is empty.");
	}

	return false;
}

private const NURSERY_STAIRS_NAMES:Array = [
	"first",
	"second"
];

public function nurseryStairsShared(activeFloor:int):void
{
	output("A gunmetal-grey stairwell connects the children’s floor with the second, dedicated to the nursery’s staff and support facilities. You’re currently on the "+ NURSERY_STAIRS_NAMES[activeFloor - 1] +" floor.");
}

public function nurseryStairs1F():Boolean
{
	nurseryStairsShared(1);
	return false;
}

public function nurseryStairs2F():Boolean
{
	nurseryStairsShared(2);
	return false;
}

public function nurseryPlayerApptFunc():Boolean
{
	if (flags["BRIGET_MET"] != undefined && pc.isPregnant()) addButton(0, "Maternity", nurseryMaternityWait, undefined, "Maternity Wait", "The nursery is set up to support you for the long term if need be. If adventuring across the galaxy while pregnant doesn't seem like the best idea, you can move into the nursery and allow the staff to take care of you until you're ready to pop.");
	addDisabledButton(0, "Maternity", "Maternity Wait", "If you were pregnant, you could probably camp out here and be looked after until you were due...");
	addButton(1, "Shower", showerOptions, 0); // 9999 this will probably require some tweaking internally to allow it to make complete sense off of the players actual ship.

	return false;
}

public function nurseryBrigetsApptFunc():Boolean
{
	if (flags["BRIGET_MET"] != undefined && (hours < 7 || hours > 16))
	{
		output("\n\nBriget herself is sitting in the bedroom, working on a small holoterminal on the desk. She glances up at you and smiles faintly, clearly none-too-disturbed by your presence in her abode.");
	}

	return false;
}

public function nurseryE6Func():Boolean
{
	flags["NAV_DISABLED"] = NAV_NORTH_DISABLE | NAV_SOUTH_DISABLE;
	return false;
}

// Actual content shit

public function nurseryComputer():void
{
	clearOutput();
	author("Savin");

	var numChildren:int = ChildManager.numChildrenAtNursery();

	if (flags["USED_NURSERY_COMPUTER"] == undefined)
	{
		output("You step up to the holoterminal and boot it up. A simple Steele Tech login screen prompts you for the same username and password as your company email before blinking away and resolving into a friendly, colorful UI in the company’s familiar dark blue hues. A soft, feminine voice welcomes you to the Steele family nursery, and once it confirms you’re, well, you, the voice adds:");

		output("\n\n<i>“Greetings, [pc.name], and welcome to your personal nursery. This facility is currently managed in trust by the Steele Industrial Technology and Production board of directors, though its day-to-day management has been sourced to your family until such time as new ownership of the company is determined. Minimum operating expenses are provided for based on the number of children and staff currently in the nursery. In other words, the facility is for your use, and is under your direction. Please enjoy the facilities, and work with us to ensure your offspring have the best possible future.”</i>");
		
		output("\n\nThe voice recording ends, and another UI slides into focus, displaying the status of the nursery and its");
		if (numChildren == 0) output(" non-existent");
		output(" occupants.");

		flags["USED_NURSERY_COMPUTER"] = 1;
	}
	else
	{
		output("You step up to the nursery’s computer station and log in. As ever, it hands over complete control to you, showing off the status of the nursery and its");
		if (numChildren == 0) output(" non-existent");
		output(" occupants.");
	}

	nurseryComputerMenu();
}

public function nurseryComputerMenu(lastUsed:Function = null):void
{
	clearMenu();

	if (lastUsed == nurseryComputerChildren) addDisabledButton(0, "Children");
	else addButton(0, "Children", nurseryComputerChildren);
	
	if (lastUsed == nurseryComputerUpgrades) addDisabledButton(1, "Upgrades");
	else addButton(1, "Upgrades", nurseryComputerUpgrades);
	
	if (lastUsed == nurseryComputerStaff) addDisabledButton(2, "Staff");
	addButton(2, "Staff", nurseryComputerStaff);

	if (lastUsed == nurseryComputerFacilities) addDisabledButton(3, "Facilities");
	else addButton(3, "Facilities", nurseryComputerFacilities);

	addButton(14, "Back", nurseryComputerLeaveMenu);
}

public function nurseryComputerLeaveMenu():void
{
	mainGameMenu();
}

public function nurseryComputerFacilities():void
{
	clearOutput();
	author("Savin");

	// Probably refactor this when we get more special types in
	var hasPitchers:Boolean = ChildManager.ofType(GLOBAL.TYPE_VENUSPITCHER);
	var hasWaterQueen:Boolean = ChildManager.ofType(GLOBAL.TYPE_WATERQUEEN);

	if (!hasPitchers && !hasWaterQueen)
	{
		output("Your nursery is equipped with a special modular section, designed to be able to easily support unique alien biologies. If you ever have children that need non-standard living environments, the headmistress will requisition the funds and staff to support them.");
	}
	else
	{
		output("You currently have the following Specialist Rooms, designed to give your uniquely-needy offspring the conditions their alien biology requires to survive:\n");
		if (hasPitchers) output("\n<b>* Venus Pitcher Terrarium</b>");
		if (hasWaterQueen) output("\n<b>* Water Strider Tank</b>")
	}

	nurseryComputerMenu(nurseryComputerFacilities);
}

public function nurseryComputerUpgrades():void
{
	clearOutput();
	author("Savin");

	if (!hasNurseryUpgrades())
	{
		output("The nursery is quite large, and though currently sparse, has plenty of room for upgrades. Any special devices or accoutrements related to birth and pregnancy you find in the galaxy can be sent here.");
	}
	else
	{
		output("You currently have installed the following special upgrades to the nursery’s facilities:");
	}

	nurseryComputerMenu(nurseryComputerUpgrades);
}

public function nurseryComputerStaff():void
{
	clearOutput();
	author("Savin");

	if (!hasNurseryStaff())
	{
		output("\n\nThe nursery is maintained largely by nurse droids at present, though a staff of biological caregivers and teachers are on retainer as well. If you find specialists who can support the nursery’s functions, perhaps you could send them here...");
	}
	else
	{
		output("\n\nYou currently have the following specialist staff on hand:\n");
		if (yammiAtNursery()) output("\n<b>* Yammi, Head Chef");
		if (reahaAtNursery()) output("\n<b>* Cured Reaha, Milk-giver");
	}

	nurseryComputerMenu(nurseryComputerStaff);
}

import classes.GameData.Pregnancy.Containers.Genders;

public function nurseryComputerChildren():void
{
	clearOutput();
	author("Savin");

	var numChildren:int = ChildManager.numChildren();

	if (numChildren == 0)
	{
		output("Should you ever choose to have children sent to the nursery, this screen will allow you to get updates on their status.");
	}
	else if (numChildren == 1)
	{
		var genders:Genders = ChildManager.numGenders();
		output("Your one and only child here at the nursery is the center of attention.");
		if (genders.Male > 0) output(" His");
		else output(" Her");
		output(" status is summarized below:");
	}
	else
	{
		output("The computer displays a summarized status of all your offspring currently residing within the nursery:");
	}

	nurseryDisplayAllChildren();

	nurseryComputerMenu(nurseryComputerChildren);
}

import classes.GameData.Pregnancy.Child;
import classes.GameData.Pregnancy.UniqueChild;

public function nurseryDisplayAllChildren():void
{
	var allUniques:Array = null;
	var sortedTypedBuckets:Object = null;

	if (ChildManager.nurseryCacheInvalid)
	{
		var types:Array = ChildManager.getKnownTypes();

		var uniques:Array = [];
		var bucketedTypes:Object = {};

		// It might be wise to smash the type + age buckets together as another tier in the underlying cache, but at least everything
		// will be in some form of order atm

		var ageBrackets:Array = [
			6571, 	// 18+
			6570, 	// 16-18
			5840, 	// 12 - 16
			4380, 	// 8 - 12
			2920, 	// 4-8
			1460, 	// 1-4
			365,	// 1 year
			273,	// 9 months
			181,	// 6 months
			90		// 3 months
		];

		for (var i:int = 0; i < types.length; i++)
		{
			var bucket:Array = ChildManager.getBucketOfType(types[i].name);
			var ageBuckets:Array = [];
			bucketedTypes[types[i].name] = ageBuckets;

			for (var b:int = 0; b < ageBrackets.length; b++)
			{
				ageBuckets.push(new Genders());
			}

			for (var c:int = 0; c < bucket.length; c++)
			{
				var cc:Child = bucket[c] as Child;
				
				if (cc is UniqueChild)
				{
					uniques.push(cc);
					continue;
				}
				
				for (var bb:int = 0; bb < ageBrackets.length; bb++)
				{
					if (cc.Days > ageBrackets[bb]) ageBuckets[bb].add(cc.NumGenders);
				}
			}
		}

		ChildManager.nurseryCacheInvalid = false;
		sortedTypedBuckets = ChildManager.nurseryComputerCache = bucketedTypes;
		allUniques = ChildManager.nuseryComputerUniquesCache = uniques;
	}
	else
	{
		sortedTypedBuckets = ChildManager.nurseryComputerCache;
		allUniques = ChildManager.nuseryComputerUniquesCache;
	}

	// It may be wise to expand this into some form of menu down the line. We have the backing data to support a lot of different
	// ways to view this too, so we could show all in age range quite easily
	nurseryDisplayGenericChildren(sortedTypedBuckets);
	//nurseryDisplayUniqueChildren(allUniques);
}

public function nurseryDisplayGenericChildren(sortedTypedBuckets:Object):void
{
	var displayAges:Array = [
		"18+",
		"16-18",
		"12-16",
		"8-12",
		"4-8",
		"1-4",
		"12 month",
		"9 month",
		"6 month",
		"newborn"
	];

	for (var key:String in sortedTypedBuckets)
	{
		var thisBucket:Array = sortedTypedBuckets[key];

		output("\n\n<b>" + GLOBAL.TYPE_NAMES[int(key)] + " Offspring:</b>");

		for (var i:int = 0; i < thisBucket.length; i++)
		{
			if (thisBucket[i].any())
			{
				var b:Genders = thisBucket[i];

				var str:String = "\n<b>" + displayAges[i] + ":</b>";

				var entries:Array = [];
				if (b.Male > 0) entries.push(" " + b.Male + " sons");
				if (b.Female > 0) entries.push(" " + b.Female + " daughters");
				if (b.Intersex > 0) entries.push(" " + b.Intersex + " mixed-gender");
				if (b.Neuter > 0) entries.push(" " + b.Neuter + " ungendered");

				output("\n<b>" + displayAges[i] + ":</b> " + CompressToList(entries));
			}
		}
	}
}

public function nurseryDisplayUniqueChildren(uniques:Array):void
{
	// Placeholder-esque until I come back through implementing the first actual unique children

	/*
	Children by {Unique Parter}
	// Agerange + gender of child, plus race name/hybridism. If name, show name.
	*/
}

public function nurseryMeetBriget():void
{
	
}

public function nurseryApproachBriget():void
{
	
}

public function nurseryMaternityWait():void
{
	clearOutput();
	author("Savin");

	output("You glance around the apartment, finding your hand drifting to your [pc.belly]. Maybe you shouldn’t be galavanting about the galaxy when you’ve got a young, vulnerable life growing inside you, you think to yourself. The nursery is equipped to support you and your spawn almost indefinitely: you can stay here in safety and comfort until you’re ready to give birth, whenever that may be. Hopefully your space-race quest can wait.");

	output("\n\nWould you like to stay here until you give birth?");

	clearMenu();
	addButton(0, "Yes", nurseryMaternityWaitGo);
	addButton(1, "No", mainGameMenu);
}

public function nurseryMaternityWaitGo():void
{
	clearOutput();
	author("Savin");

	output("You ping Briget over the nursery’s intercom and tell your old nurse that you’re thinking about taking an extended stay with her.");
	
	output("\n\n<i>“Oh? That’s marvelous, [pc.name]. Say the word, and I’ll have your personal effects brought up from your ship.”</i>");
	
	output("\n\nYou affirm your decision with her and turn your focus to the bed, deciding that with so much free time suddenly on your hands, it’s time to catch up on some much-needed rest. It isn’t long before Briget arrives along with several of the nursery’s drones, carrying boxes of your personal effects: everything from spare clothes to your toothbrush, whatever you’ll need for your stay. Before she leaves you, the gynoid nurse gingerly approaches and places a hand on your [pc.belly].");

	output("\n\n<i>“I’m very excited to see what the newest addition to the family will be, [pc.name],”</i> she");
	if (flags["BRIGET_FUCKED"] == undefined)
	{	
		output(" says with the warm, matronly smile you’ve come to expect. <i>“Now you just relax and let me and my staff take good care of you until the next Steele is ready to join us.”</i>");

		output("\n\nYou nod appreciatively, content to have someone experienced to care for you while you’re vulnerable - and for your offspring once you’ve delivered them. Briget chuckles at the complement, reaching in to give you a kiss on the brow before sashaying out of the room. You’re half surprised she didn’t try and tuck you in.");
	}
	else
	{
		output(" murmurs, guiding you back to the bed. Once the drones are gone she’s quick to straddle your [pc.hips], wrapping her arms around your neck and leaving her over-ample chest so close that you can’t help but nestle your head into the soft, pillowy embrace of her cleavage. <i>“Just as important, I get to have you all to myself for a while. Now I want you to lay back and let momma take care of absolutely everything, my dear.”</i>");

		output("\n\nBefore you can respond, Briget’s hand reaches down,");
		if (pc.hasCock()) output(" wrapping around your [pc.cock]");
		else if (pc.hasVagina()) output(" slipping a pair of fingers across the lips of your quim");
		else output(" caressing your barren loins");
		output(". She smiles seductively, eyelids heavy and plump lips pursed; it’s only natural to follow her into a deep, long kiss, letting Briget lead you into bed and take care of your every need the way only an amorous nurse droid can...");
	}

	output("\n\nYour first night in the nursery is more restful than you imagined it ever could be.");
	var pregDuration:int = PregnancyManager.getLongestRemainingDuration(pc);
	if (pregDuration >= 2880)
	{
		output(" By the end of the second day, you can feel all the tension bleeding away: all the aches and the cares of your adventuring life seem so far away as you’re pampered by Briget and her staff. The matronly gynoid simply refuses to let you lift a finger for yourself, insisting that she knows exactly how to treat a pregnant Steele after all these years. Considering her breadth of experience, and how relaxed and contented you soon find yourself, it’s hard to argue the point.");

		if (flags["CREWMEMBER_SLEEP_WITH"] != undefined)
		{
			var sleepWithIsMale:Boolean = false;
			if (flags["CREWMEMBER_SLEEP_WITH"] == "BESS")
			{
				output(" [bess.name]");
				sleepWithIsMale = bess.mf("m", "f") == "m";
			}
			else
			{
				output(" " + StringUtil.capitalize(flags["CREWMEMBER_SLEEP_WITH"], true));
				// 9999 for crewmember gender
			}
			output(" joins you after the first night, carrying in a handful of belongings and making "+ (sleepWithIsMale ? "him" : "her") + "self comfortable in your shared living space. Briget");
			if (flags["BRIGET_FUCKED"] != undefined) output(" takes the extra presence in your bed in stride - you are a Steele, after all. Your poor bed, however, clearly wasn’t made for the sexual escapades that the three of you get up to - though a shattered headboard or two is easily replaced.");
			else output(" quickly rearranges things to accommodate your lover, making sure you’re both well tended to.");
		}
	}

	if (pregDuration >= 1051200) output("\n\nThe years pass")
	else if (pregDuration >= 481800) output("\n\nThe year passes");
	else if (pregDuration >= 80640) output("\n\nThe months pass");
	else if (pregDuration >= 20160) output("\n\nThe weeks pass");
	else if (pregDuration >= 1440) output("\n\n The days pass");
	else output("\n\nThe day passes");
	output(" in a slow, peaceful haze. Your [pc.belly] grows, swelling with life until the inevitable end of your pregnancy comes. When it does, Briget is at your side in the blink of an eye, accompanied by several nurse-droids that haul you onto a stretcher, dazed and moaning, and cart you off to a maternity ward on the station. You barely notice an anesthetic hypospray hissing against your neck; only a sudden grogginess tips you off, and then the world goes black.");

	// We don't want to process-time passed the actual birthing stuff, we need to intercept the usual system, execute the cleanups (for stat tracking)
	// THEN pass the time, so we don't trigger any of the other stage progression outputs.

	clearMenu();
	addButton(0, "Next", nurseryMaternityWaitPostBirths);
}

public function nurseryMaternityWaitPostBirths():void
{
	clearOutput();
	author("Savin");
	
	/*

When you wake up you're back in your bedroom, buck naked and tucked into the covers. You've definitely been given a bath while you were out, and your equipment is neatly stacked on the desk across the room from you. Briget is sitting in the chair, turned half aside from you and humming happily to herself. Her suit-jacket is unbuttoned, and she's holding a newborn {progenyrace} in her arms, letting {him/her/it} nurse from one of her full, milk-swollen breasts.

Briget blinks when you stir, brought back from her motherly daydreaming. "Oh, [pc.name]. I thought you would be asleep for some time still.... Do forgive an old gynoid for still taking some little pleasure in watching over you while you dream, hmm?"

She smiles and glances down to the little bundle in her arms. "Everything went perfectly, of course. You're now mother to {X} newborn {raceName}. Congratulations, dear."

You spend a few moments stretching and collecting yourself -- and fussing over your newborn offspring -- before glancing at the clock sitting on the desk. <b>You've spent {X} days and {Y} hours here</b> in leisure. God only knows what your rival's gotten up to in that time.

Now unburdened of your pregnancy, you figure it's time to get back on the space-trail.
*/
}