//Storefront (Aka, Pretty Princess Dressup Simulator 2014 XL Collector's Edition, With $4.99 Horsecock Armor DLC)
//By Third
public function showAliss(nude:Boolean = false):void
{
	showBust(alissBustDisplay(nude));
	showName("\nALISS");
}
public function alissBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "ALISS";
	if(nude) sBust += "_NUDE";
	return sBust;
}
//First time enter
public function miAmoreBonusShit():Boolean
{
	author("Third");
	showBust(alissBustDisplay());
	if(flags["MET_ALICE"] == undefined)
	{
		flags["MET_ALICE"] = 1;
		output("From the outside this store, “Mi Amour” appears to be the prototypical lingerie shop. In the outside windows mannequins of various species model matching panties and bras. From here, the inside looks darker and moodier than the rest of the space station. Curious, you step inside.");
		output("\n\nThough indeed darker, your eyes quickly adjust and find the light quite pleasant. Red and pink braziers dangle from the ceiling, giving the place a warm, cozy feel. Racks of lingerie cover the walls to the south and west, while numerous circular displays are set up on the floor itself. To the north is the check-out counter, as well as a set of changing rooms and a door to the back room.");
		output("\n\nSeveral other humans and aliens are milling about the shop. Most are fully clothed, but some are wearing only lingerie. You’d guess they work here, and assume that must be part of the “work uniform.” One individual, however, catches your attention.");
		output("\n\nThe first thing you notice is her thick tail, almost as big around as her waist, and almost as long as she is tall! She stands about 6 feet tall, and her skin appears to be a light lavender color, speckled with yellow patches. Long tresses of blonde hair dangle just past her shoulders, and as she turns you notice her eyes: large viridian globes with slender, reptilian slits. Now that she’s turned your way, you can see her chest and stomach are a lighter shade of purple. Her body is toned but not muscular. She clearly looks after herself.");
		output("\n\nLike the other employees of this quaint little shop, she is dressed only in lingerie. A black bra adorned with pink lace cups her rather large DD-cup breasts, while a matching pair of panties fits snugly over her smooth groin. A pair of black fishnets grace her legs, and she teeters on a pair of 3-inch red pumps that match the vivid shade of her lips. From head to toe, this woman just oozes sex.");
		output("\n\nThe reptilian woman runs a hand through her blonde hair as her eyes fall upon you. She casually saunters over and gives you a quick wink before saying, in a very cheerful voice, <i>“Welcome, </i>mi amour,<i> to Mi Amour!”</i> She giggles softly at her own joke. <i>“Sorry for the joke. Those are on the house. Anyway, I don’t think I’ve seen you here before, and I know everyone that comes into my shop. I’m Aliss, and I own this place. We specialize in lingerie for every body type, from ausar to zeidrich, and everything in between. Male, female, tranz, or just a little curious, we cater to everyone.”</i> She smiles broadly and motions to the various racks of under garments. <i>“Just say the word and I, or any of my employees, will model anything you see here.”</i>");
		output("\n\nYou raise an eyebrow. <i>“Anything?”</i> you ask, eyeing the nearest rack. There’s some pretty skimpy stuff here... items that would only barely classify as floss.");
		output("\n\nAliss puts a hand on her hip and tilts her head at you daringly. <i>“Anything.”</i>");
	}
	else
	{
		output("The inside of “Mi Amour” is warm and cozy, thanks to the evenly spaced red and pink braziers that hang from the ceiling. The southern and western walls are covered in various lingerie racks, while more circular displays stand on the floor of the store. To the north are the various changing rooms, the back room, and the checkout counter. A number of people mill about the store, including employees dressed only in lingerie.");
		//Anno Buys a Strapon
		//PC visits Aliss’s shop while Anno’s on the crew. Anno doesn’t already own a strapon. Anno’s been sex’d.
		if(flags["ANNO_OWNS_LIGHT_STRAPON"] == undefined && annoIsCrew() && haveFuckedAnno())
		{
			takeOverAlisssShopForPuppySlootPeanutButterStrapons();
			return true;
		}
		output("\n\nAliss is here, tending to one of the circular displays. Her long tail curls around in front of her, and you’re surprised to note she’s using it to help fold the various intimates.");
		output("\n\nYou take a glance around the shop. They have a wide selection of items for sale. Various bras, corsets, and negligees to cover your upper body, and panties, garters and all manner of stockings to cover your lower body. There is even a display labeled “Handmade Cocksocks by Aliss”.");
		output("\n\nAliss sees you checking the place out and approaches you, saying, <i>“Welcome back, </i>mi amour<i>. See anything you like?”</i>");
	}
	if(flags["LIAMME_EXHIB"] != undefined)
	{
		//If not procced or expired:
		if(flags["LIAMME_ALISS_PROC"] == undefined || flags["LIAMME_ALISS_PROC"] + 60 < GetGameTimestamp())
		{
			//20% chance he shows up
			if(rand(5) == 0)
			{
				flags["LIAMME_ALISS_PROC"] = GetGameTimestamp();
			}
		}
		//If Liamme has already procced: stick around an hour
		if(flags["LIAMME_ALISS_PROC"] + 60 > GetGameTimestamp())
		{

			addBust(liammeBustString());
			output("\n\nYou see a blonde ausar femboy walking around the shop with a bag full of naughty goodies. By your guess, it’s <b>Liamme doing a little bit of shopping</b>. Maybe you could pay him a visit.");
			addButton(3,"Liamme",liammeShoppingAtAlissApproach,undefined,"Liamme","See what the trappy ausar is up to.");
		}
	}
	//[Upper Body] [Lower Body] [Cocksocks] [Aliss] [Leave]
	addButton(0,"Upper Body",upperBodyAlice,undefined,"Upper Body","See what tops Aliss has for sale.");
	addButton(1,"Lower Body",lowerBodyAlice,undefined,"Lower Body","See what bottoms Aliss has for sale.");
	//addButton(2,"Cocksocks",cocksocksAlice,undefined,"Cocksocks","See what Aliss’s “Handmade Cocksocks” are all about.");
	addButton(5,"Aliss",alissDiscussionsInsteadOfPanties,undefined,"Aliss","Talk with the shopkeeper herself.");
	if(flags["ALISS_FIXED_HL"] == -1)
	{
		if(pc.hasHardLightEquipped()) addButton(2,"Repair HL",alissRepairTalk,undefined,"Repair HL","Show Aliss the malfunctioning mod on your hardlight and see if she can fix it.");
		else addDisabledButton(2,"Repair HL","Repair HL","You aren’t wearing a broken hardlight projector!");
	}
	else if(flags["ALISS_FIXED_HL"] == 1)
	{
		if(pc.hasHardLightEquipped()) addButton(2,"Break HL",alissBreakItTalk,undefined,"Break HL","Ask Aliss to make your underwear malfunction again.");
		else addDisabledButton(2,"Break HL","Break HL","You aren’t wearing a hardlight projector!");
	}
	return false;
}

//Upper Body
public function upperBodyAlice():void
{
	clearOutput();
	author("Third");
	showBust(alissBustDisplay());
	output("You take a look at what <i>Mi Amour</i> has to offer in terms of upper body lingerie.");
	/*Plain Bra
	/Lacy Bra
	/Form-Fitting Swim Bra
	/Corset
	/Underbust Corset
	/Babydoll
	/Pasties
	/Undershirt
	/Shibari Top*/
	clearMenu();
	//addButton(0, "Plain Bra", plainBraOptions);
	addOverrideItemButton(0, new PlainBra(), "Plain Bra", plainBraOptions);
	//addButton(1, "Lacy Bra", lacyBraAliss);
	addOverrideItemButton(1, new LacyBra(), "Lacy Bra", lacyBraAliss);
	//addButton(2, "Sports Bra", sportsSwimBraAliss);
	addOverrideItemButton(2, new SportsBra(), "Sports Bra", sportsSwimBraAliss);
	//addButton(3, "Corset", tellMeAboutYerCorsetAlice);
	addOverrideItemButton(3, new Corset(), "Corset", tellMeAboutYerCorsetAlice);
	//addButton(4, "U.Corset", underbustCorsetOptionsAliss);
	addOverrideItemButton(4, new UnderbustCorset(), "U.Corset", underbustCorsetOptionsAliss);
	//addButton(5, "Babydoll", babydollsAtAliss);
	addOverrideItemButton(5, new Babydoll(), "Babydoll", babydollsAtAliss);
	//addButton(6, "Pasties", pastiesAndAliss);
	addOverrideItemButton(6, new Pasties(), "Pasties", pastiesAndAliss);
	//addButton(7, "Undershirt", undershirtWithAliss);
	addOverrideItemButton(7, new Undershirt(), "Undershirt", undershirtWithAliss);
	//addButton(8, "ShibariTop", shibariTopForAliss);
	addOverrideItemButton(8, new ShibariTop(), "ShibariTop", shibariTopForAliss);
	addButton(14,"Back",mainGameMenu);
}

public function purchaseSomethingFromAliss(purchaseItem:*):void
{
	clearOutput();
	author("Third");
	showBust(alissBustDisplay());
	output("You transfer the credits.\n\n");
	//Credits
	pc.credits -= getAlissPrice(purchaseItem);

	var foundLootItems:Array = new Array();
	foundLootItems[foundLootItems.length] = purchaseItem;
	
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	//Start loot
	itemCollect(foundLootItems);
}

public function getAlissPrice(zeItem:*):Number
{
	return Math.round(zeItem.basePrice);
}

//Plain Bra
public function plainBraOptions():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("Aliss produces a simple looking bra from a nearby stand and holds it up. <i>“This is simple, but functional. Keeps all your bits and bobs where they need to be. It’s made of our proprietary chameleon silk, which means you can download our app to your datapad and customize the color as needed. You’ll never have to worry about finding the right color again!”</i>");
	output("\n\nYou look the bra over and consider your options. The holographic price tag says " + getAlissPrice(new PlainBra()) + " credits. You could also have Aliss try it on for you.");
	//[Buy (go to Buy, below)] [Try On] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new PlainBra())) addButton(0,"Buy", purchaseSomethingFromAliss, new PlainBra());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addButton(1,"Try On",tryOnBraAlice);
	addButton(14,"Back",upperBodyAlice);
}

//Try On
public function tryOnBraAlice():void
{
	clearOutput();
	author("Third");
	showAliss();
	//Adds +1 to Aliss's lust
	chars["ALISS"].lust(5);
	if(chars["ALISS"].lust() >= 100)
	{
		alissSexyTimes();
		return;
	}
	output("You ask Aliss if she’d be so kind as to model the plain bra for you. She giggles and nods, <i>“Absolutely! Be back in two shakes, don’t you worry </i>mi amour<i>.”</i> Aliss turns and sashays towards the changing rooms, her tail and rump swishing enticingly.");
	output("\n\nYou don’t have to wait for long. Within two minutes she returns, sporting the plain bra in its white form. As she said, it’s simple, but functional. Her large, DD-cup breasts threaten to spill out at any moment, but are held fast by the bra. Aliss strikes a pose, with one hand on her hip while the other motions to key features on the bra.");
	output("\n\n<i>“As you can see here, it incorporates ultralastic, so no matter what mods you get and how much your body changes, it will always adapt. It’s customizable as well, as you can see I went for a bit of a tighter fit.”</i> The reptilian woman gives you a quick wink and remarks, <i>“A little cleavage never goes awry.”</i>");
	output("\n\nBefore your eyes, the white bra shifts to a vivid crimson, matching her lips and heels. <i>“Using our patented chameleon silk, you can customize the color as you see fit. It can even do simple patterns.”</i> The pattern on the bra shifts to white, but this time several black polka dots appear.");
	output("\n\n<i>“So, what do you think?”</i>");
	//[Buy] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new PlainBra())) addButton(0,"Buy", purchaseSomethingFromAliss, new PlainBra());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addDisabledButton(1,"Try On");
	addButton(14,"Back",upperBodyAlice);
}

//Lacy Bra
public function lacyBraAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("Aliss produces an intricately patterned bra trimmed with lace. <i>“Whenever you go out on the town, or just want to feel sexy, there’s nothing better than this. Not only does it look fantastic, but it functions as a push-up bra, giving you the appearance of at least another cup size. Not only that, but it’s made with our proprietary chameleon silk, which means you can download an app to your datapad to customize the color as needed! It’ll fit with any outfit, guaranteed.”</i>");
	output("\n\nYou look the bra over and consider your options. The holographic price tag says " + getAlissPrice(new LacyBra()) + " credits. You could also have Aliss try it on for you.");
	//[Buy] [Try On] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new LacyBra())) addButton(0,"Buy", purchaseSomethingFromAliss, new LacyBra());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addButton(1,"Try On",tryTheLacyBraAlice);
	addButton(14,"Back",upperBodyAlice);
}

//Try On
public function tryTheLacyBraAlice():void
{
	clearOutput();
	author("Third");
	showAliss();
	chars["ALISS"].lust(2);
	if(chars["ALISS"].lust() >= 100)
	{
		alissSexyTimes();
		return;
	}
	output("<i>Oh that’s simple, I’m already wearing this type,”</i> she says, spinning around and striking a pose. The black bra is accented with pink lace, and clings tightly to her chest. The cleavage it produces is almost mesmerizing, and you have to force yourself to look away from the light purple titflesh and examine the bra. <i>“As you can see, you can select two different colors, one for the bra itself, the other for the trim. And of course it incorporates ultralastic, so no matter what, it will always fit you.”</i>");
	output("\n\n<i>“So, what do you think?”</i>");
	//[Buy] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new LacyBra())) addButton(0,"Buy", purchaseSomethingFromAliss, new LacyBra());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addDisabledButton(1,"Try On");
	addButton(14,"Back",upperBodyAlice);
}

//Sports/Swim Bra
public function sportsSwimBraAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("Aliss produces the racerback sports bra from a nearby table and holds it up. <i>“This is popular among athletes and other active women, including planet rushers. It incorporates a small amount of nanosteel fibers to help keep your breasts from bouncing around, while also remaining sleek and comfortable.”</i>");
	output("\n\nYou look the bra over and consider your options. The holographic price tag says " + getAlissPrice(new SportsBra()) + " credits. You could also have Aliss try it on for you.");
	//[Buy] [Try On] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new SportsBra())) addButton(0,"Buy", purchaseSomethingFromAliss, new SportsBra());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addButton(1,"Try On",tryOnTheSwimBraAlice);
	addButton(14,"Back",upperBodyAlice);
}

//Try On
public function tryOnTheSwimBraAlice():void
{
	clearOutput();
	author("Third");
	showAliss();
	//Adds +1 to Aliss's lust
	chars["ALISS"].lust(5);
	if(chars["ALISS"].lust() >= 100)
	{
		alissSexyTimes();
		return;
	}
	output("You ask the reptilian woman if she’d be so kind as to model it for you. Aliss nods. <i>“You got it </i>mi amour<i>. Be back in two shakes,”</i> she says as she turns towards the changing rooms and saunters away. Her tail swishes enticingly behind her before she slips into one of the booths.");
	output("\n\nIndeed you don’t have to wait long. Within a couple minutes Aliss returns, wearing the racerback sports bra. It’s simple, and certainly not as flattering as the bra she had been wearing, but it does seem functional. Aliss’s ample bosom is kept under wraps. She strikes a pose and reviews the features of the bra, <i>“Of course it’s made with our patented chameleon silk, which means you can download an app to your datapad and control the color as needed. This way it will go with any outfit, no matter what. Like I mentioned before, it incorporates nanosteel fibers, which is effectively a non-Newtonian liquid rendered into a fabric. It really helps keep everything from moving around too quickly, which is really nice if you’ve got large “assets”.”</i> She giggles.");
	output("\n\n<i>“Of course, like all our garments, this is completely hydrophobic. Any liquid will just run off of it like it was nothing. You don’t have to worry about liquid stains in the least! This bra in particular is pretty popular as part of a swimsuit, though really any of our bras can fill that niche, depending on how you want to look on a given day.”</i>");
	output("\n\n<i>“So, what do you think?”</i>");
	//[Buy] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new SportsBra())) addButton(0,"Buy", purchaseSomethingFromAliss, new SportsBra());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addDisabledButton(1,"Try On");
	addButton(14,"Back",upperBodyAlice);
}

//Corset
public function tellMeAboutYerCorsetAlice():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("Aliss produces a black, lacy corset off of a nearby rack and holds it up to her body. <i>“This is a classic of fashion back on my home planet. I just love these, personally. This corset will keep your waist cinched and really emphasize your bust, hips and butt. Like all our products, of course, it’s made with chameleon silk, which means you can download an app to any datapad and customize its color. Perfect for any intimate encounter.”</i>");
	output("\n\nYou look the corset over and consider your options. The holographic price tag says " + getAlissPrice(new Corset()) + " credits. You could also have Aliss try it on for you.");
	//[Buy] [Try On] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new Corset())) addButton(0,"Buy", purchaseSomethingFromAliss, new Corset());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addButton(1,"Try On",tryDatCorsetOnAlice);
	addButton(14,"Back",upperBodyAlice);
}

//Try On
public function tryDatCorsetOnAlice():void
{
	clearOutput();
	author("Third");
	showAliss();
	//Add +1 to Aliss's lust.
	chars["ALISS"].lust(5);
	if(chars["ALISS"].lust() >= 100)
	{
		alissSexyTimes();
		return;
	}
	output("You ask if Aliss would be so kind as to model the corset for you. She winks one vivid green eye at you and nods, <i>“Absolutely, </i>mi amour<i>! You just wait right here and I’ll be back in a jiffy.”</i> She turns and struts away, giving you a tempting look at her backside before disappearing into the changing room.");
	output("\n\nTrue to her word, she’s back out in a flash. The corset clings tightly to her body, shrinking her waist by several inches, really emphasizing her wide hips and ass. Her large breasts threaten to spill over the black lace, but are kept in check enough to create a spellbinding rack of cleavage. <i>“Ah, I love these. As you can see, this appears to be a classic corset from humanity’s past, but it does have a few modern adjustments. First, like all of our garments, it includes our patented chameleon silk. This allows you to download an app to your datapad and customize the color to your tastes. It will go with any outfit, guaranteed!”</i>");

	output("\n\nAliss turns around so you can see the laces of the back, not to mention her supple, pantied ass and thick tail. <i>“Secondly, it includes an automatic cincher. A hundred years ago, putting on a corset properly would take a team of at least two people, but with this, you can do it alone with minimal discomfort! Finally, older corsets used to be made of old Earth whale bone, but these babies come with nanosteel fibers instead. What that means is it’s effectively indestructible, at least in terms of normal wear and tear. It will continuously support you, and never snap or break. In the event that you lose consciousness, the corset will even loosen, allowing you to regain your breath! Handy, right?”</i>");
	output("\n\nThe reptilian alien twirls around once more and gives a small bow, showing off her impressive cleavage. <i>“So, what do you think?”</i>");
	//[Buy] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new Corset())) addButton(0,"Buy", purchaseSomethingFromAliss, new Corset());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addDisabledButton(1,"Try On");
	addButton(14,"Back",upperBodyAlice);
}

//Underbust Corset
public function underbustCorsetOptionsAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("Aliss produces a black, lacy corset off of a nearby rack and holds it up to her body. It’s apparently designed to fit around a person’s midsection while leaving the breasts open. <i>“The overbust version are really popular on my home planet. I love both types, personally. This corset will keep your waist cinched and really emphasize your hips and butt, while showing off your breasts. Like all our products, of course, it’s made with chameleon silk, which means you can download an app to any datapad and customize its color. Perfect for any intimate encounter.”</i>");
	output("\n\nYou look the corset over and consider your options. The holographic price tag says " + getAlissPrice(new UnderbustCorset()) + " credits. You could also have Aliss try it on for you.");
	//[Buy] [Try On] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new UnderbustCorset())) addButton(0,"Buy", purchaseSomethingFromAliss, new UnderbustCorset());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addButton(1,"Try On",tryOnDisUnderBoobCorsetThingAliss);
	addButton(14,"Back",upperBodyAlice);
}

//Try On
public function tryOnDisUnderBoobCorsetThingAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	//Adds +2 to Aliss's lust.
	chars["ALISS"].lust(10);
	if(chars["ALISS"].lust() >= 100)
	{
		alissSexyTimes();
		return;
	}
	output("You ask if Aliss would model the corset for you. She gives you a little smile and nods, saying, <i>“Of course! You just wait right here, and I’ll be back before you can blink.”</i> With that she turns and makes her way to the changing rooms, her tail swishing sensuously behind her.");
	output("\n\nIt doesn’t take long before you see the door to the changing rooms open and Aliss sashay’s out, her naked breasts bobbing with every step. She approaches you, and you have to tear your eyes away from her dark, perky, and quite hard nipples. And it’s not even that cold in here. Aliss gives you a little smirk as she poses with one hand on her hip. <i>“Like what you see? Well, the features on this corset are much like its overbust counterpart. Of course there’s the chameleon silk which I mentioned earlier. It also uses nanosteel fibers in place of the traditional Earth-bound whale bone, so it’s practically indestructible. It will never snap or break through normal wear and tear.”</i>");
	output("\n\nShe briefly covers her breasts with one arm, but goes back to gesturing with the hand, bringing your attention back down to her dark, almost black nipples. <i>“It’s auto-cinching, so you never have to have a team of people nearby to put it on. Not only that, but if you ever lose consciousness, it will automatically loosen to facilitate breathing. Wonders never cease, huh?”</i> She giggles for a moment before striking one last pose, thrusting her naked tits out, with both hands on her hips.");
	output("\n\n<i>“So, what do you think?”</i>");
	//[Buy] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new UnderbustCorset())) addButton(0,"Buy", purchaseSomethingFromAliss, new UnderbustCorset());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addDisabledButton(1,"Try On");
	addButton(14,"Back",upperBodyAlice);
}

//Babydoll
public function babydollsAtAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("Aliss produces a skimpy pink babydoll. It almost looks like a dress, were it not for the extremely short length, and the thin, silky material. You’d guess it would only barely cover the crotch of its wearer, and certainly wouldn’t leave much to the imagination. <i>“These are super cute, I love using them as my sleepwear when I’ve got... someone over,”</i> she says, her vivid green eyes lingering on you for a moment. <i>“It’s comfy, fashionable, and downright sexy.”</i>");
	output("\n\nYou look the babydoll over and consider your options. The holographic price tag says " + getAlissPrice(new Babydoll()) + " credits. You could also have Aliss try it on for you.");
	//[Buy] [Try On] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new Babydoll())) addButton(0,"Buy", purchaseSomethingFromAliss, new Babydoll());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addButton(1,"Try On",tryOnTheBabydollAliss);
	addButton(14,"Back",upperBodyAlice);
}

//Try On
public function tryOnTheBabydollAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	//Add +2 to Aliss's lust.
	chars["ALISS"].lust(10);
	if(chars["ALISS"].lust() >= 100)
	{
		alissSexyTimes();
		return;
	}
	output("You ask the reptilian woman if she would be so kind as to model the babydoll for you. Her red lips curl slightly and she nods, <i>“Absolutely, </i>mi amour<i>. You just wait right here and I’ll be right back. Two shakes, promise.”</i> She turns and makes her way towards the changing rooms. She gives her tail and pantied butt one last shake before disappearing behind the door.");
	output("\n\nWithin two minutes the door opens and Aliss returns. The little bralet of the babydoll clings to her breasts, and does nothing to hinder her nipples from poking forward, completely obvious despite the silky garment. The dress part hangs down, just barely long enough to cover Aliss’s crotch. Any wrong (or right) move on her part would grant anyone in the vicinity a clear look at her underwear. <i>“So, what do you think? Cute, isn’t it? These babydolls, like our other products, are made of our patented chameleon silk, which means you can download an app to your datapad and customize the color to suit your mood. So no matter what else you’re wearing, this is sure to match. Not only that, but these come with a special new feature, to control the transparency!”</i>");
	output("\n\nBefore your eyes, the pink material of the babydoll shifts to black, and then slowly fades. You realize it’s becoming more sheer. You can make out the color of Aliss’s skin... then the dark outline of her areolae. Pretty soon the babydoll is practically transparent, only barely visible over Aliss’s otherwise naked body.");
	output("\n\n<i>“So, what do you think?”</i>");
	//[Buy] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new Babydoll())) addButton(0,"Buy", purchaseSomethingFromAliss, new Babydoll());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addDisabledButton(1,"Try On");
	addButton(14,"Back",upperBodyAlice);
}

//Pasties
public function pastiesAndAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("Aliss produces a small plastic package from a nearby table and opens it up to reveal two red circular pasties. <i>“Super simple, and revealing. A staple of any strip tease,”</i> she says with a grin. <i>“There’s not much else to say, I’m afraid.”</i>");
	output("\n\nYou look the package of pasties over and consider your options. The holographic price tag says " + getAlissPrice(new Pasties()) + " credits. You could also have Aliss try it on for you.");
	//[Buy] [Try On] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new Pasties())) addButton(0,"Buy", purchaseSomethingFromAliss, new Pasties());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addButton(1,"Try On",tryOnPastiesAliss);
	addButton(14,"Back",upperBodyAlice);
}

//Try On
public function tryOnPastiesAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	//Add +2 to Aliss's lust.
	chars["ALISS"].lust(10);
	if(chars["ALISS"].lust() >= 100)
	{
		alissSexyTimes();
		return;
	}
	output("Despite the miniature nature of the “garment”, you ask Aliss if she’d be so kind as to model the pasties for you. A sly grin crosses her face and she nods, <i>“Oh absolutely. You just wait right there and I’ll be back.”</i> She turns with the package in hand and makes her way to the changing rooms, her ample rump and tail swaying sensuously behind her.");
	output("\n\nIn less than a minute she returns, her full naked breasts on display to everyone, except for the nipples, which are capped by the sparkly red circles. She cups one breast and jiggles it lightly. <i>“As you can see, there’s not much to them. Using Geckoglue they’ll cling to any type of skin, even fur, and can be removed without pain. They’ve also incorporated some of our patented chameleon silk, meaning you can download an app to any datapad to customize the colors as you wish. Other than that, there’s not much to say, so I’ll just give you a good look.”</i>");
	output("\n\nAliss giggles softly and twirls, her breasts freely wobbling to and fro. Your eyes follow the red dots affixed to each tit as though they were targets. <i>“So what do you think?”</i>");
	//[Buy] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new Pasties())) addButton(0,"Buy", purchaseSomethingFromAliss, new Pasties());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addDisabledButton(1,"Try On");
	addButton(14,"Back",upperBodyAlice);
}

//Undershirt
public function undershirtWithAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("Aliss produces a simple white tank top from a nearby rack. <i>“This is simple, but functional. Perfect for any guy, or girl, who wants to cover up but wants a little bit more comfort than the average shirt. The material is silky smooth, and it’ll feel great against your skin. Using our patented chameleon silk you can download an app to your datapad and customize the color as you see fit. It’ll go with any outfit, guaranteed!”</i>");
	output("\n\nYou look the undershirt over and consider your options. The holographic price tag says " + getAlissPrice(new Undershirt()) + " credits. You could also have Aliss try it on for you.");
	//[Buy] [Try On] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new Undershirt())) addButton(0,"Buy", purchaseSomethingFromAliss, new Undershirt());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addButton(1,"Try On",tryOnAnUndershirtAliss);
	addButton(14,"Back",upperBodyAlice);
}

//Try On
public function tryOnAnUndershirtAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	chars["ALISS"].lust(2);
	if(chars["ALISS"].lust() >= 100)
	{
		alissSexyTimes();
		return;
	}
	output("You ask Aliss if she’d be so kind as to model the undershirt for you. She nods and says, <i>“Of course, </i>mi amour<i>. You just wait here and I’ll be back in a jiffy.”</i> With that she turns and makes her way towards the changing rooms, her tail raising just enough to give you a nice view of her ass.");
	output("\n\nTrue to her word, she returns not two minutes later, sporting the simple white undershirt. On her it seems to be a little tight in the chest; her tits strain against the high-tech fabric, while the rest hangs a little loose. She smiles and puts one hand on her hip while motioning to the shirt with her other. <i>“Perfect for those who prefer an understated look, this shirt is comfy, and boasts all the features of our products, including the chameleon silk, as well as complete hydrophobia. No matter what liquid is involved, it will just roll off this like it was nothing.”</i>");
	output("\n\n<i>“So what do you think?”</i>");
	//[Buy] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new Undershirt())) addButton(0,"Buy", purchaseSomethingFromAliss, new Undershirt());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addDisabledButton(1,"Try On");
	addButton(14,"Back",upperBodyAlice);
}

//Shibari Top
public function shibariTopForAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("Aliss smiles broadly as she retrieves an awkward bra-like garment made of ropes. <i>“Ah yes, this is for some of our more adventurous customers. It comes from an old practice of bondage from Earth called shibari. We simplified it down and created this. It’ll feel restrictive, but not actually limit your movements. It’s made with a combination of spinerran silk as well as our patented chameleon silk, allowing you to customize the color as you see fit simply by downloading an app for any datapad.”</i>");
	output("\n\nYou look over the rope “bra” and consider your options. The holographic price tag says " + getAlissPrice(new ShibariTop()) + " credits. You could also have Aliss try it on for you.");
	clearMenu();
	if(pc.credits >= getAlissPrice(new ShibariTop())) addButton(0,"Buy", purchaseSomethingFromAliss, new ShibariTop());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addButton(1,"Try On",tryOnAShibariTopAliss);
	addButton(14,"Back",upperBodyAlice);
}

//Try On
public function tryOnAShibariTopAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	//Add +2 to Aliss's lust.
	chars["ALISS"].lust(10);
	if(chars["ALISS"].lust() >= 100)
	{
		alissSexyTimes();
		return;
	}
	output("You ask if Aliss would be so kind as to model the bra for you. Her eyes sparkle as she smiles. <i>“Oh, definitely, </i>mi amour<i>. You just wait right there and I’ll be back before you can miss me.”</i> With that she turns and makes her way towards the changing rooms, her tail sensuously swaying behind her.");
	output("\n\nWithin the next few minutes she returns. The rope top clings tightly to her body. Her large, DD-cup breasts threaten to burst out at any moment, but you’re positive the bondage bra can handle it. Aliss giggles as she strikes a pose. <i>“This top is perfect for those with a bit of a masochistic or submissive streak. If it’s worn for any substantial time, it’ll even leave rope marks, which I’m told many wear as badges of honor. As mentioned, its color is fully customizable, and it’s practically indestructible thanks to a combination of spinerran silk and ultralastic. In addition, it’s completely hydrophobic, so it’s rather popular as beachwear amongst submissive exhibitionists.”</i> The way Aliss’s eyes glint at that last line makes you think that she has tried that out for herself.");
	output("\n\n<i>“So, what do you think?”</i>");
	//[Buy] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new ShibariTop())) addButton(0,"Buy", purchaseSomethingFromAliss, new ShibariTop());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addDisabledButton(1,"Try On");
	addButton(14,"Back",upperBodyAlice);
}

//Lower Body
public function lowerBodyAlice():void
{
	clearOutput();
	author("Third");
	showBust(alissBustDisplay());
	output("You take a look at what <i>Mi Amour</i> has to offer in terms of lower body lingerie.");
	/*Plain Panties
	/Thong
	/Boyshorts
	/Boxers
	/Fishnet Set
	/Shibari Bottom
	*/
	clearMenu();
	//addButton(0, "Plain Panties", alissPlainPantiesForNerds);
	addOverrideItemButton(0, new PlainPanties(), "Panties", alissPlainPantiesForNerds);
	//addButton(1, "Thong", thongWithAliss);
	addOverrideItemButton(1, new Thong(), "Thong", thongWithAliss);
	//addButton(2, "Boyshorts", boyShortsWithAliss);
	addOverrideItemButton(2, new Boyshorts(), "Boyshorts", boyShortsWithAliss);
	//addButton(3, "Boxers", boxersWithAliss);
	addOverrideItemButton(3, new Boxers(), "Boxers", boxersWithAliss);
	//addButton(4, "Stockings Set", stockingSetWithAliss);
	addOverrideItemButton(4, new Stockings(), "Stockings", stockingSetWithAliss);
	//addButton(5, "Shibari Bottom", shibariBottomAliss);
	addOverrideItemButton(5, new ShibariBottom(), "Shib. Bottom", shibariBottomAliss);
	
	addButton(14,"Back",mainGameMenu);
}

//Plain Panties
public function alissPlainPantiesForNerds():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("Aliss produces a pair of simple white panties. <i>“Simple, comfortable, and functional. Every girl, and some boys, need a pair of these. They keep everything under wraps until the time is right. And with our proprietary chameleon silk, you can even download an app to your datapad and customize the color as you see fit. They’ll go with any outfit, guaranteed!”</i>");
	output("\n\nYou look over the panties and consider your options. The holographic price tag says " + getAlissPrice(new PlainPanties()) + " credits, as well as “HARDLIGHT COMPATIBLE.” You could also have Aliss try it on for you.");
	//[Buy] [Try On] [Hardlight] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new PlainPanties())) addButton(0,"Buy", purchaseSomethingFromAliss, new PlainPanties());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addButton(1,"Try On",tryOnHardlightPantiesAliss);
	addButton(2,"Hardlight",hardLightDiscussion,new PlainPanties());
	addButton(14,"Back",lowerBodyAlice);
}

//Try On
public function tryOnHardlightPantiesAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	chars["ALISS"].lust(2);
	if(chars["ALISS"].lust() >= 100)
	{
		alissSexyTimes();
		return;
	}
	output("You ask if Aliss would kindly model the panties for you. She gives you a slight smile and says, <i>“Of course! You just stay right here, and I’ll be right back.”</i> She turns and makes her way back towards the changing rooms, her thick purple tail lifting just enough to give you an enticing look at her ass.");
	output("\n\nWithin a minute the reptilian woman returns, sporting the bikini-cut panties. She giggles and gives a slow swirl, letting you see how they fit on her at every angle. Despite the fact that the panties she took with her didn’t have a hole for the tail, you notice they fit seamlessly around her tail. <i>“Like I said, simple but functional. They’re made of chameleon silk, as well as ultralastic. They’ve even been designed to detect the presence of a tail and mold themselves around it. Really useful if you’re like me. I swear before they came up with that, finding the right pair of underwear was a pain, even when you’re in the industry!”</i>");
	output("\n\n<i>“So, what do you think?”</i>");
	//[Buy] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new PlainPanties())) addButton(0,"Buy", purchaseSomethingFromAliss, new PlainPanties());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addDisabledButton(1,"Try On");
	addButton(2,"Hardlight",hardLightDiscussion,new PlainPanties());
	addButton(14,"Back",lowerBodyAlice);
}

//Thong
public function thongWithAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("Aliss produces a skimpy “garment” that wouldn’t even be considered clothing according to several planet’s governments. <i>“Ah, the always popular thong. You know, ten years ago they had to smuggle these onto the planet Bronka IV because the local government outlawed them for being too “risque”. Anyway, despite their appearance, they’re still quite comfortable.”</i>");
	output("\n\nYou look over the thong and consider your options. The holographic price tag says " + getAlissPrice(new Thong()) + " credits, as well as “HARDLIGHT COMPATIBLE.” You could also have Aliss try it on for you.");
	//[Buy] [Try On] [Hardlight] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new Thong())) addButton(0,"Buy", purchaseSomethingFromAliss, new Thong());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addButton(1,"Try On",tryOnTheThong);
	addButton(2,"Hardlight",hardLightDiscussion,new Thong());
	addButton(14,"Back",lowerBodyAlice);
}

//Try On
public function tryOnTheThong():void
{
	clearOutput();
	author("Third");
	showAliss();
	//Adds +2 to Aliss's lust.
	chars["ALISS"].lust(10);
	if(chars["ALISS"].lust() >= 100)
	{
		alissSexyTimes();
		return;
	}
	output("You ask if Aliss would be so kind as to model this thong for you. A sly look crosses her face and she nods, <i>“Oh absolutely. You just hang out right here and I’ll be back in two shakes.”</i> She turns and sashays her way to the changing rooms, her tail and ass swaying sensuously behind her.");
	output("\n\nWithin a minute she returns, sporting the simple thong. She strikes a pose and then turns all the way around, letting you see how it fits from every angle. The little strip of fabric in the front does only the bare minimum at concealing Aliss’s sex. Despite the fact that the thong she took with her was clearly intended for tailless individuals, the one she’s wearing has seamlessly adapted to her rather thick tail. <i>“Like our other products, this thong is made primarily of chameleon silk, which means you can download an app to your datapad and customize the color as you see fit. Not only that, but it’s completely hydrophobic, so it’s actually popular as a swimsuit.”</i>");
	output("\n\n<i>“So, what do you think?”</i>");
	clearMenu();
	if(pc.credits >= getAlissPrice(new Thong())) addButton(0,"Buy", purchaseSomethingFromAliss, new Thong());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addDisabledButton(1,"Try On");
	addButton(2,"Hardlight",hardLightDiscussion,new Thong());
	addButton(14,"Back",lowerBodyAlice);
}

//Boyshorts
public function boyShortsWithAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("Aliss produces a simple, lacy pair of boyshorts. <i>“I like this kind. It’s a simple cut, but looks really cute no matter your body type. They lend one the nice tomboy, or the boyfriend’s clothes look.”</i> She giggles and gives you a quick wink. <i>“They’re made with our proprietary chameleon silk, which means you can download an app to your datapad and customize the color as you see fit. They’ll go with any outfit!”</i>");
	output("\n\nYou look over the boyshorts and consider your options. The holographic price tag says " + getAlissPrice(new Boyshorts()) + " credits, as well as “HARDLIGHT COMPATIBLE.” You could also have Aliss try it on for you.");
	//[Buy] [Try On] [Hardlight] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new Boyshorts())) addButton(0,"Buy", purchaseSomethingFromAliss, new Boyshorts());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addButton(1,"Try On",tryOnBoyShortsAliss);
	addButton(2,"Hardlight",hardLightDiscussion,new Boyshorts());
	addButton(14,"Back",lowerBodyAlice);
}

//Try On
public function tryOnBoyShortsAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	chars["ALISS"].lust(2);
	if(chars["ALISS"].lust() >= 100)
	{
		alissSexyTimes();
		return;
	}
	output("You ask if Aliss would be so kind as to model these boyshorts for you. She nods happily, saying, <i>“Of course, </i>mi amour!<i> You just wait right here and I’ll be back in a flash.”</i> With that, she turns and makes her way towards the changing rooms, giving her rump a tantalizing little shake before disappearing.");
	output("\n\nShe returns a short while later, sporting the boyshorts. They cling to her purple skin tightly, but look to be comfortable enough. The tightness of the fit definitely leaves little to the imagination. <i>“Looks good doesn’t it?”</i> she asks, giving a quick spin so you can see it from every angle. <i>“Like all our undergarments, it includes intelligent ultralastic, so even if you have a tail, like me, they’ll adapt to fit you. We really do live in an amazing time, huh?”</i>");
	output("\n\n<i>“So, what do you think?”</i>");
	//[Buy] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new Boyshorts())) addButton(0,"Buy", purchaseSomethingFromAliss, new Boyshorts());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addDisabledButton(1,"Try On");
	addButton(2,"Hardlight",hardLightDiscussion,new Boyshorts());
	addButton(14,"Back",lowerBodyAlice);
}

//Boxers
public function boxersWithAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("Aliss produces a pair of white boxers decorated with red hearts. <i>“We do cater to the masculine here as well. These boxers are not only functional and fashionable, but comfortable as well. They feature a slightly upgraded version of our chameleon silk, which allows you to not only control the color, but the patterning as well. All with just a simple app you can download to any datapad.”</i>");
	output("\n\nYou look over the boxers and consider your options. The holographic price tag says " + getAlissPrice(new Boxers()) + " credits. You could also have Aliss try it on for you.");
	//[Buy] [Try On] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new Boxers())) addButton(0,"Buy", purchaseSomethingFromAliss, new Boxers());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addButton(1,"Try On",tryOnBoxersAliss);
	addButton(14,"Back",lowerBodyAlice);
}

//Try On
public function tryOnBoxersAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	chars["ALISS"].lust(2);
	if(chars["ALISS"].lust() >= 100)
	{
		alissSexyTimes();
		return;
	}
	output("You ask if Aliss would be so kind as to model these boxers for you. She giggles and nods, saying, <i>“Of course, </i>mi amour<i>. I’ll be back in two shakes, don’t you go anywhere.”</i> She turns and sensuously makes her way back to the changing rooms.");
	output("\n\nA few moments later she emerges, sporting the boxers. They fit loosely on her body, but definitely give off a sexy “I just slept with my boyfriend” type look. She spins around slowly, letting you see how they fit on every curve of her body, before placing one hand on her hip and motioning down with the other. Before your eyes, the boxers shift from white with red hearts, to pink with black polka dots, and then to solid green. <i>“As mentioned, you can customize the color and pattern as you wish. Thanks to the wonders of ultralastic, they’ll always fit you no matter what, even if you have a big tail like mine, as you can see they adapt to fit.”</i> She turns again to show the way the boxers seamlessly wrap around the base of her tail.");
	output("\n\n<i>“So, what do you think?”</i>");
	//[Buy] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new Boxers())) addButton(0,"Buy", purchaseSomethingFromAliss, new Boxers());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addDisabledButton(1,"Try On");
	addButton(14,"Back",lowerBodyAlice);
}

//Stocking Set
public function stockingSetWithAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("Aliss produces a pair of panties, garter and pair of stockings. Draping the stockings and garter over one arm, she holds up the lacy panties. <i>“Popular for any romantic rendezvous, this set is sure to start a flame in your lover’s heart. Of course it features our patented chameleon silk, which means you can customize the color any way you see fit. No matter what else you’re wearing, or not wearing, you’ll look great.”</i>");
	output("\n\nYou look over the lingerie set and consider your options. The holographic price tag says " + getAlissPrice(new Stockings()) + " credits, as well as “HARDLIGHT COMPATIBLE.” You could also have Aliss try it on for you.");
	//[Buy] [Try On] [Hardlight] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new Stockings())) addButton(0,"Buy", purchaseSomethingFromAliss, new Stockings());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addButton(1,"Try On",tryOnTheStockingsAliss);
	addButton(2,"Hardlight",hardLightDiscussion,new Stockings());
	addButton(14,"Back",lowerBodyAlice);
}

//Try On
public function tryOnTheStockingsAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	chars["ALISS"].lust(1);
	if(chars["ALISS"].lust() >= 100)
	{
		alissSexyTimes();
		return;
	}
	output("You ask Aliss if she’d be so kind as to model the lingerie for you. She simply giggles and motions downward. <i>“That’s easy, </i>mi amour<i>! I’m already wearing it, see?”</i> The purple-skinned woman raises a leg forward, showing off the fishnets that cover her legs. <i>“With the chameleon silk, you can choose whether you want them to be fishnets, sheer stockings, opaque, it’s all up to you.”</i> Your eyes make their way up to see the attached garter, and then the black, lacy panties around her groin. As Aliss turns slowly, you even notice how seamlessly they wrap around the base of her tail.");
	output("\n\n<i>“So, what do you think?”</i>");
	//[Buy] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new Stockings())) addButton(0,"Buy", purchaseSomethingFromAliss, new Stockings());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addDisabledButton(1,"Try On");
	addButton(2,"Hardlight",hardLightDiscussion,new Stockings());
	addButton(14,"Back",lowerBodyAlice);
}

//Shibari Bottom
public function shibariBottomAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("Aliss produces a complicated-looking rope garment from a nearby display. After fiddling with it for a moment, she holds it up proudly and you can see the ropes take the form of panties. <i>“For our more adventurous customers, we have these. Inspired by an old practice of bondage from Earth, known as shibari, we made these. It’s a simplified concept, it feels restrictive, without actually being so. It’s made of a combination of spinerran silk, and our proprietary chameleon silk, so of course you can customize the color as you see fit.”</i>");
	output("\n\nYou look over the “panties” and consider your options. The holographic price tag says " + getAlissPrice(new ShibariBottom()) + " credits. You could also have Aliss try it on for you.");
	//[Buy] [Try On] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new ShibariBottom())) addButton(0,"Buy", purchaseSomethingFromAliss, new ShibariBottom());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addButton(1,"Try On",tryOnShibariBottoms);
	addButton(14,"Back",lowerBodyAlice);
}

//Try On
public function tryOnShibariBottoms():void
{
	clearOutput();
	author("Third");
	showAliss();
	chars["ALISS"].lust(10);
	if(chars["ALISS"].lust() >= 100)
	{
		alissSexyTimes();
		return;
	}
	output("You ask if Aliss would be so kind as to model these “panties” for you. Her eyes glitter as she nods, <i>“Oh absolutely! You just wait right here, and I’ll be back before you can miss me.”</i> With that, she turns and makes her way towards the changing rooms, her pleasant rump swaying enticingly behind her.");
	output("\n\nNo more than two minutes later she reemerges, the shibari panties firmly around her groin. She does a slow twirl, allowing you to see how the panties fit from every angle. <i>“These panties are perfect for anyone with a bit of a submissive or masochistic streak. If it’s worn for prolonged periods, it’ll even leave rope marks, which I’m told many wear as badges of honor. As mentioned, its color is fully customizable, and it’s practically indestructible thanks to a combination of spinerran silk and ultralastic. In addition, it’s completely hydrophobic, so it’s rather popular as beachwear amongst submissive exhibitionists.”</i> The way Aliss’s eyes glint at that last line makes you think that she has tried that out for herself.");
	output("\n\n<i>“So, what do you think?”</i>");
	//[Buy] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(new ShibariBottom())) addButton(0,"Buy", purchaseSomethingFromAliss, new ShibariBottom());
	else addDisabledButton(0,"Buy","Buy","You cannot afford this item.");
	addDisabledButton(1,"Try On");
	addButton(14,"Back",lowerBodyAlice);
}

//Hardlight
public function hardLightDiscussion(arg:*):void
{
	clearOutput();
	author("Third");
	showAliss();
	output("You question the holographic tag that proclaims “HARDLIGHT COMPATIBLE”. <i>“Ohoh, that’s a fun feature. We’re one of the first shops to offer this, and it certainly has been popular. See, by incorporating miniaturized hardlight projectors across the outside of the fabric, we can set it up so that it will project a holographic, fully corporeal strap-on. No need for complicated straps, and no worries about potentially addictive or harmful drugs, you can simply wear these panties and be good to go, whenever, wherever. It will even interface with your own nervous system and give you a real time tactile feedback! And it should be noted, these projectors are so miniscule and well hidden you’d never even know they were there.”</i>");
	output("\n\n<i>“If you want to upgrade it to include these projectors, that’ll be an extra 3000--making it " + (getAlissPrice(arg) + 3000) + " credits, total.”</i>");
	//[Buy Normal] [Buy Hardlight] [Back]
	clearMenu();
	if(pc.credits >= getAlissPrice(arg)) addButton(0,"Buy Normal", purchaseSomethingFromAliss, arg);
	else addDisabledButton(0,"Buy Normal","Buy Normal","You cannot afford this item.");
	if(pc.credits >= (getAlissPrice(arg) + 3000)) addButton(1,"BuyHardlight", purchaseSomethingHardlightFromAliss, arg);
	else addDisabledButton(1,"BuyHardlight","BuyHardlight","You cannot afford this item.");
	addButton(14,"Back",lowerBodyAlice);
}

public function purchaseSomethingHardlightFromAliss(purchaseItem:*):void
{
	clearOutput();
	author("Third");
	showBust(alissBustDisplay());
	output("You transfer the credits for a hardlight-equipped version of your chosen undergarment.\n\n");
	//Credits
	pc.credits -= (getAlissPrice(purchaseItem) + 3000);
	
	purchaseItem.basePrice += 3000;
	purchaseItem.hasRandomProperties = true;
	purchaseItem.hardLightEquipped = true;

	var foundLootItems:Array = [];
	foundLootItems.push(purchaseItem);

	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	//Start loot
	itemCollect(foundLootItems);
}

//Cocksocks
public function cocksocksAlice():void
{
	clearOutput();
	author("Third");
	showBust(alissBustDisplay());
	// 9999
	output("Nothing to see here!");
	
	clearMenu();
	addButton(14,"Back",mainGameMenu);
}

//Sexytimes
//(When Aliss' lust reaches 10, the next time the PC asks her to model an outfit, it triggers this scene.)
public function alissSexyTimes():void
{
	clearOutput();
	author("Third");
	showAliss(true);
	output("You ask if Aliss would be so kind as to model this garment for you. She nods, though for some reason her face flushes hotly, turning a deeper shade of purple. <i>“You, ah, you just wait right here, [pc.name]. I’ll be right back!”</i> She turns away and quickly makes her way to the changing rooms, her steps a little more hurried than usual. How odd. That’s the first time she’s called you by your name.");
	output("\n\nAfter a minute’s time you hear a soft call from the changing rooms, <i>“Ah, [pc.name]. Could you come here for a moment? I, ah, need your help with something.”</i> You raise an eyebrow. Need help with something? It couldn’t be that hard to put on, could it?");
	output("\n\nShrugging to yourself, you approach the door to the changing room and knock. Aliss’ voice calls out softly, <i>“It’s not locked.”</i> You carefully open the door and peek inside. Aliss’ back is to you, her thick tail swaying with agitation, but you can see her clearly in the mirror beyond. Her face is flushed a deep violet and her eyes half lidded. Her bountiful breasts are exposed, the dark purple nipples erect and straining for attention. Your eyes drift downward, and then widen in surprise.");
	output("\n\nContained in Aliss’ grip, and projecting from her groin, is a fourteen inch cock, colored a dark, almost lightless amethyst. It’s uniformly wide, and ends in a slightly rounded tip, not unlike an equine penis. One of Aliss’ hands is gripping the base firmly, while the other gathers a dollop of pre-cum and smears it across the length.");
	output("\n\n<i>“There you are, [pc.name],”</i> she says, her brilliant green spotting you in the mirror. She bites her lip playfully. <i>“All that swapping clothes and strutting out there half-naked has really gotten me going, and I was hoping you might be able to lend me a hand with... relieving my problem?”</i> Aliss’ ruby red lips form into a needy pout as she looks you over.");
	output("\n\nYou’re left a little stunned. This entire time you’ve seen Aliss strutting about with only a thin piece of cloth between you and her crotch, and it turns out she’s been smuggling this anaconda in there the entire time? You figure you could get in there and help her out, if you don’t mind the dick. You could question her before making any rash decisions. Or, of course, you could always ");
	if(!silly) output("high tail it out");
	else output("nope the fuck out");
	output(".");
	processTime(1);
	//[Help] [Question] [Nope]
	clearMenu();
	addButton(0,"Help",helpAlissWithSexyTiems,undefined,"Help","Helping Aliss with her “problem” is likely to include sex.");
	addButton(1,"Question",questionAlissAboutHerHorsecock,undefined,"Question","Get a little more information before making a decision.");
	addButton(2,"Nope",nopeDafuqOut,undefined,"Nope","Nope. Nope! NOPE! Nope-nope-nopenope!!!");
}

//Help
public function helpAlissWithSexyTiems():void
{
	clearOutput();
	author("Third");
	showAliss(true);
	output("You slip inside the changing room, noting how spacious it seems to be. Surprise dick or not, you figure you’d have to be an idiot to pass up an opportunity like this. Aliss beams at you as she turns around, letting you come face to face with the fourteen inch purple cock between her legs.");
	if(!pc.isNude()) output(" You quickly strip down, tossing your clothes into a neat pile in the corner.");
	output("\n\n<i>“Oh thank goodness. I was worried I might have to deal with this bad boy by myself...”</i> she says, her voice trailing off. Clearly she expects you to take the first step. How would you like to proceed?");
	processTime(1);
	//[Fuck Her] [Offer Pussy] [Offer Ass] [Suck Her Off]
	clearMenu();
	if(pc.hasCock())
	{
		if(pc.cockThatFits(chars["ALISS"].analCapacity()) >= 0) addButton(0,"Fuck Her",fuckDatBitchesSluttyAss,undefined,"Fuck Her","Fuck Aliss in the ass.");
		else addDisabledButton(0,"Fuck Her","Fuck Her","You’re a little too big to fuck Aliss in the ass.");
	}
	else if(pc.hasHardLightEquipped()) addButton(0,"Fuck Her",fuckDatBitchesSluttyAss,undefined,"Fuck Her","Fuck Aliss in the ass with a hardlight strapon.");
	else addDisabledButton(0,"Fuck Her","Fuck Her","You need a dick to fuck her.");
	if(pc.hasVagina()) addButton(1,"Offer Pussy",offerPussyYouSloot,undefined,"Offer Pussy","Offer Aliss the use of a proper cocksheath - your pussy.");
	else addDisabledButton(1,"Offer Pussy","Offer Pussy","You need a vagina to offer Aliss the use of it!");
	addButton(2,"Offer Ass",offerAlissYourAss,undefined,"Offer Ass","Offer Aliss the use of your ass. What better place for her to spend her lust?");
	addButton(3,"SuckHerOff",suckAlissOffBecauseYouLikeToGulpDownLoadsOfJizzYouSlut,undefined,"SuckHerOff","Suck Aliss off with your mouth.");
	if(pc.hasCock()) addButton(4,"PantyFrot",alissPresentForThirdsBday2019,undefined,"PantyFrot","Do a bit of frottage with a pair of surplus panties to wrap everything up nice and tight.");
	else addDisabledButton(4,"PantyFrot","PantyFrot","You need a penis for this.");
}

//Question
public function questionAlissAboutHerHorsecock():void
{
	clearOutput();
	author("Third");
	showAliss(true);
	output("Before you agree to anything, you’ve got to settle a few things. <i>“So... Is that normal?”</i> you ask in a quiet voice, motioning towards the dick between her legs.");
	output("\n\nAliss shrugs nonchalantly, <i>“Whenever I get horny, but I’m guessing that’s not what you meant, is it?”</i> You shake your head. <i>“I’m guessing you don’t know much about my race then? Well then, fun fact, [pc.name]: I’m a male! Males for my species, the ovir, are pretty “feminine” according to your culture. Breasts, hips, the whole shebang. Oh yeah, and this thing,”</i> she grips the horse-like cock between her legs for emphasis. <i>“Don’t worry though, </i>mi amour<i>, I don’t plan on sticking it anywhere you don’t want it to go. So, how about it? Are you going to join me in here, or do I have to deal with this thing by myself?”</i>");
	processTime(1);
	//[Help] [Nope]
	clearMenu();
	addButton(0,"Help",helpAlissWithSexyTiems,undefined,"Help","Helping Aliss with her “problem” is likely to include sex.");
	addDisabledButton(1,"Question");
	addButton(2,"Nope",nopeDafuqOut,undefined,"Nope","Nope. Nope! NOPE! Nope-nope-nopenope!!!");
}

//Nope
public function nopeDafuqOut():void
{
	clearOutput();
	author("Third");
	showAliss(true);
	output("You shake your head and softly close the door before quickly ");
	if(!silly) output("retreating from the store");
	else output("noping the fuck out");
	output(". Hopefully she’ll deal with <b>that</b> on her own, and won’t bother you with such advances again.");
	chars["ALISS"].orgasm();
	clearMenu();
	addButton(0,"Next",move,"110");
}

//Sex Ahoy!
//Fuck Her Slutty Ass
public function fuckDatBitchesSluttyAss():void
{
	//Should go for the largest cock that will fit (we'll say... an area of 100? she's had some practice)
	var x:int = pc.cockThatFits(chars["ALISS"].analCapacity());
	if(x < 0 && !pc.hasHardLightEquipped()) x = pc.smallestCockIndex();

	//PC can also use a hardlight strapon that she sells, if it's worn and the PC has no applicable cocks.
	clearOutput();
	author("Third");
	showAliss(true);
	output("As tantalizing as that cock is, you think you can help Aliss relieve herself in other ways. Advancing, your hands grip her upper arms, while you lean in for a kiss. The alien lets out a surprised sound, but once your lips meet with her strawberry flavored ones, she seems to melt in your arms.");

	output("\n\nYou press her back against a mirrored wall, forcefully but gently. Aliss moans into your mouth, then with a little reluctance she pulls away and giggles. <i>“Mmm, like it rough, do you? Well, </i>mi amour,<i> how about we get a little inventive?”</i> she says with a coy smile, motioning to her own discarded lingerie. You arch an eyebrow quizzically, and then it dawns on you what she means. Smirking, you pick up one of her stockings and test its strength. It seems abnormally strong. Probably thanks to whatever hi-tech nanofibers they use nowadays.");

	output("\n\nYou take the stocking and gently tie one end around Aliss’ right wrist. Then you do the same with another stocking and her left wrist. She holds her arms up, as though she were being bound to some invisible post. Her breasts curve up as her spine arches, the dark nipples hard as diamonds and twice as beautiful. It takes all of your willpower not to dive into those luscious tits right then and there.");

	output("\n\n<i>“Oh my,”</i> she says in mock alarm. <i>“Whatever shall I do? My captor has me bound and plans to... do things to me.”</i> She undulates her body at you, her long cock aiming right at you, aching to be touched. <i>“Wonderful, wonderful things.”</i>");

	output("\n\nSmiling, you move in to kiss Aliss again, taking hold of both her wrists in one of your hands. The moan that escapes her lips is lustful and needy. This kind of play is clearly turning her on. You release her lips, but keep your grasp on her wrists. Spinning her around, you whisper in her ear to keep still while you secure her. She wiggles her butt and tail at you disobediently, and you tut slightly, remarking that you’ll have to punish her for that later.");

	output("\n\nTaking the loose ends of the stockings tied to her wrist, you fasten them to clothing hooks set into the mirrored wall. They’re some distance away, so Aliss is forced to keep her arms apart. She’s also forced to look in the mirror, seeing her own face, flushed with desire and need.");

	output("\n\nYou smoothly nudge Aliss’ legs apart and lift her bulky tail to see her swollen asshole, already wet and ready for you. You dip a hand between her thighs, running your finger around the succulent pucker. Her whole body shivers for a moment. She looks over her shoulder at you, her expression suddenly serious, <i>“Ah, sorry to say this now... but can you put a condom on us both? It’s just such a bother to clean up in here, you know?”</i>");

	output("\n\nYou consider this. There seems to be a batch of condoms nearby, it wouldn’t be too difficult. Of course, she is bound and at your whims... what would you like to do?");

	processTime(5);
	//[Condom] [No Condom]
	clearMenu();
	addButton(0,"Condom",condomWithAliss,x,"Condom","Use condoms for safety and fun. Who doesn’t like to watch those balloons fill?");
	addButton(1,"No Condom",noCondomsAlissYerASlut,x,"No Condom","Don’t use condoms. Who doesn’t like making a mess out of their lover and everything around them?");
}

//Condom
public function condomWithAliss(x:int = -1):void
{
	clearOutput();
	author("Third");
	showAliss(true);
	output("You decide to oblige Aliss, and pick up one of the stray condoms she had with her. Emblazoned on it is the word “Stallionguard” along with a stylized picture of an eight-legged horse.");
	output("\n\n<i>“Yep, those are the ones,”</i> Aliss says, looking over her shoulder. <i>“They’re designed for folks with equine dicks, but they fit us ovir perfectly too. They’ll certainly fit you as well, just maybe not as comfortably.”</i>");
	output("\n\nYou tear open the package and pull out the condom, then sidle up behind the lizard “girl”. Pressing your body against hers, you reach down, your hands easily finding her dick. You press the tip of the “Stallionguard” condom to her flat cockhead and slowly unroll it across her member. Her entire body stiffens and you hear a light sound emanate from her throat. In no time at all, her cock is covered from top to bottom, with a clear latex sheen.");
	output("\n\n<i>“And now how about you, </i>mi amour<i>?”</i> Aliss asks, cocking her head over her shoulder at you. ");
	//if using hardlight strapon:
	if(x < 0) output("You merely smirk and activate the hardlight projectors in your panties. Looking down, you watch as a vague penis shape forms at your crotch, made entirely of orange light. As it solidifies, it takes on a more natural color, matching your skin. It takes only a few seconds for it to achieve its intended shape, a perfectly normal human-like penis, about nine inches long. Finally, you feel a slight pinch around your waist as the panties begin sending your body tactile feedback. You can feel the air on your new virtual cock, and as you run a hand over it, you can’t help but shiver at the odd, alien feeling. <i>“Ohh, using my own products against me? Well, no need for a condom I guess.”</i>");
	else output("You smile, slipping your hand between your [pc.thighs] to grip the hardening member there. You grab another “Stallionguard” condom, unwrap it and gently slip it on. Once it’s properly on, you note it’s almost like you’re not wearing anything at all. You can still feel the air blow across your dick, or the gentle caress of your own fingers. Not a single sensation is dulled.");
	condomOrNoCondomAlissButtfuck(x,true);
}

//No Condom
public function noCondomsAlissYerASlut(x:int = -1):void
{
	clearOutput();
	author("Third");
	showAliss(true);
	output("You shake your head, a grin on your face. There will be no condoms today. Any mess she makes she’ll have to clean up herself. She raises her eyebrows in surprise, but quickly lowers one, giving you a sultry look. <i>“Well then I hope for your sake, you’re worth it,”</i> she says, looking over her shoulder at you.");

	//if using hardlight strapon:
	if(x < 0) output("\n\nThe grin still plastered on your face, you activate the hardlight projectors in your panties. Looking down, you watch as a vague penis shape forms at your crotch, made entirely of orange light. As it solidifies, it takes on a more natural color, matching your skin. It takes only a few seconds for it to achieve its intended shape, a perfectly normal human-like penis, about nine inches long. Finally, you feel a slight pinch around your waist as the panties begin sending your body tactile feedback. You can feel the air on your new virtual cock, and as you run a hand over it, you can’t help but shiver at the odd, alien feeling.");
	else output("\n\nYou slip a hand between your [pc.thighs], bringing your cock to full attention. It gleams in the soft lighting of the changing room, pulsing with blood and energy. Aliss gives you an appreciative little nod.");
	condomOrNoCondomAlissButtfuck(x,false);
}

//Condom and No-Condom meet here
public function condomOrNoCondomAlissButtfuck(x:int = -1, condom:Boolean = false):void
{
	output("\n\n<i>“Mmm, you just look good enough to eat... but here I am, all bound up and at your mercy,”</i> Aliss says, making a show of struggling at the lingerie binding her. <i>“Whatever am I to do?”</i> Smiling, you sidle up behind her, wrapping an arm around her large tail and lifting it. Her asshole, plump and delicious, glistens before you, seemingly dripping with natural lubricant. You run a finger around its puckered edge, watching as Aliss squirms away from your touch.");
	output("\n\nDelicately, you press your thumb inside her depths. It’s quickly enveloped inside her warm, wet ass. Her walls squeeze you tight. With how tight, wet and warm it is, it actually reminds you more of a proper woman’s pussy than anything else. Your thumb presses further inside, searching for that magical spot. When Aliss suddenly tenses up, nearly pulling away from your grip, you know you’ve hit it. That magical prostate spot. You muse to yourself that it must be even more sensitive for her, since her testicles are also internal. Pressure in just the right spot must drive her <i>crazy</i>. You’ll have to keep that in mind, you tell yourself.");
	output("\n\nAs you retract your thumb you notice Aliss beginning to relax. Acting quickly, you position yourself behind the horny alien and press the head of your ");
	if(x >= 0) output("[pc.cock " + x + "]");
	else output("hardlight cock");
	output(" inside her. Her sweltering depths easily part, but she tenses up again. Her asshole clamps down around you, though only briefly. Aliss lets out a slight moan as you press a few more inches into her.");
	if(x >= 0)
	{
		if(pc.cocks[x].cLength() < 6) output(" With your tiny dick having bottomed out already, Aliss peers over her shoulder at you, obviously a little disappointed. <i>“Don’t worry about it, hun, it’s not the size, it’s how you use it.”</i> Hm. Cliche, but she’s right. You’re just the right length to... you pull out slightly and angle down. Thrusting forward you hit Aliss’ p-spot just right so that she cries out soundlessly as a little pleasure quake rocks her body.");
		else if(pc.cocks[x].cLength() < 14) output(" A few more inches are swallowed up by Aliss’ hungry anus. The reptilian moans slightly, as each thrust puts a little bit more pressure on her prostate.");
		else output(" Aliss’ walls unsurprisingly cling tightly to your huge cock. She closes her eyes as she sucks in her lower lip. You can only imagine the feelings going through her head right now, of being <i>filled</i> so exquisitely. With every extra inch you sink into her ass lusty moans escape her throat.");
	}
	else output(" A few more inches are swallowed up by Aliss’ hungry anus. The reptilian moans slightly, as each thrust puts a little bit more pressure on her prostate.");
	if(x >= 0) pc.cockChange(true);

	output("\n\nAliss’ cock trembles, going completely untouched. With every thrust of your hips, her dick bobs, copious amounts of precum ");
	if(condom) output("collecting in the transparent condom");
	else output("raining down on the floor");
	output(". The pressure on her p-spot must be intense. You lift the alien woman’s tail higher, pounding her ass just a little bit harder and more forcefully. Aliss cries out loudly, a powerful sound you’re certain could be heard from outside the little changing room.");
	output("\n\nFrowning, you redouble your grip on her tail, and give her plump, cock-filled ass a spanking with the other. Another moan flitters from her throat, lost in the sea of carnal noises. You urge her to be quiet, lest everyone know what’s going on in here. Aliss doesn’t seem to care, with each rough assault on her backdoor producing yet another pleasure-laden exclamation. She struggles weakly at the bonds holding her, not truly intent on getting free.");
	output("\n\nGrowing frustrated, you glance around, searching for something to ease your troubles. That’s when you spot it, and a smirk crosses your face. Taking a momentary break from the ovir’s asshole, you bend down and pick up her discarded panties. Leaning forward you catch her attention, and promptly shove the balled up pair of underwear in her mouth. She makes a muffled groan of dismay, her eyebrows furrowing at you, but makes no attempt to remove the panties. The impromptu gag doesn’t eliminate the sounds, but it does mitigate them. Aliss’ moans are deeper, more sensual, without having to alert the entire space station to her presence.");
	output("\n\nWith silence restored, you return to the matter at hand. You give Aliss’ round ass a quick, friendly smack as you easily slide your ");
	if(x >= 0) output("[pc.cock " + x + "]");
	else output("artificial dick");
	output(" back into her, eliciting a stifled moan. You quickly find your pace again, ramming so fast and intensely into the alien that she has to brace herself against the wall as best she can given the bindings. She spreads her legs further and bends over, allowing you to penetrate deeper and deeper into her love canal. Her ");
	if(condom) output("condom-clad ");
	output("cock heaves, bouncing with every motion.");
	output("\n\nAliss seems to tremble as pleasure wracks her body. You reinforce your grip on her tail, raising it as high as you can as you maintain the cadence of your thrusts. Muffled half-moans fill the air around you as Aliss’ brilliant green eyes roll back in her head. Her cock stiffens, while her backdoor clamps down around your ");
	if(x >= 0) output("[pc.cock " + x + "]");
	else output("strapon");
	output(" like a vise. You know she’s on the edge, and all it will take is a little nudge to send her toppling over.");

	output("\n\nWith your free hand you reach forward, caressing Aliss’ smooth, patterned back. Your hand slinks higher, up her neck and into her flowing blonde hair. You take a fistful of hair around the base of her skull, gripping tightly, and using this leverage to thrust even deeper within the slutty ovir. Heady groans make their way through her panty-gagged mouth. Her eyes clench shut and her whole body seems to stiffen. The muffled groans turn into an orgasmic scream as her cock suddenly pulses, sending a large spout of cum ");
	if(condom) output("right into her condom");
	else output("splattering against the wall and floor");
	output(". More sprays follow, all the while her asshole quavers around your cock like a flowing wave.");

	output("\n\nYou can’t take any more of this either, and as Aliss seems to chant <i>“Oh fuck”</i> through her gag, you bury the entirety of your tool inside her, filling her to the brim as you cum. ");
	//OR, if using strapon: 
	if(x < 0) output("The artificial connection forged by the hardlight cock seems to waver, sending a rush of orgasmic energy through your body. Though there’s no ejaculation, your arms and legs seems to quiver and quake as if you had just came with every inch of your body.");
	//Condom:
	else if(condom)
	{
		//Little Cum:
		if(pc.cumQ() < 25) output("You feel your [pc.cock] pulse several times, filling the small rubber condom with your [pc.cum].");
		//Medium Cum:
		else if(pc.cumQ() < 100) output("You rocket off jet after jet of cum, filling the condom separating you and your lover with your hot [pc.cum].");
		//Vente Cum: 
		else if(pc.cumQ() <= 500) output("Your cock pulses, a veritable stream of cum pouring out of you into the flimsy condom separating the two of you. You’re certain the condom grows bulbous, filled to the brim with your hot [pc.cum].");
		//CumStahp:
		else output("Your eyes roll back in your head as cum pours out of your dick in nearly neverending waves. The condom is almost certainly filled to its breaking point with your sticky [pc.cum], and you even notice Aliss sporting a bit of a belly bulge.");
	}
	//No-Condom:
	else
	{
		//Little Cum: 
		if(pc.cumQ() < 25) output("Your body tingles as you unleash a few quick jets of [pc.cum] directly into Aliss’ bowels.");
		//Medium Cum:
		else if(pc.cumQ() < 100) output("You blast Aliss’ insides [pc.cumColor] as you deposit your load directly into Aliss’ backdoor, filling her up with your hot [pc.cum].");
		//Lots'o'Cum:
		else if(pc.cumQ() < 500) output("Your manhood trembles as you blast Aliss’ bowels with your hot [pc.cum], filling her to the brim. She wriggles under your grasp as small streams of love juice escapes the seal around your cock and dribbles down her legs.");
		//SupersizeMe:
		else 
		{
			output("A tingling overtakes your [pc.balls] as ");
			if(pc.balls <= 1) output("it empties");
			else output("they empty");
			output(" out, delivering a fountain of cum straight into Aliss’ backdoor. The hot sticky liquid fills every nook and cranny, and then some, bloating the ovir so much it looks like she might be pregnant. Streams of your [pc.cum] escape the seal around your cock, spraying out like little waterfalls to cover both your and Aliss’ legs.");
		}
	}
	output("\n\nThe two of you collapse into a ");
	if(!condom) output("cum-slicked ");
	output("pile, Aliss easily slipping out of the improvised stocking cuffs. She sighs contentedly, plucking the panties out of her mouth and tossing them aside. As you both sit there, your ");
	if(x >= 0)
	{
		if(pc.hasKnot(x)) output("still hard, knotted dick");
		else output("rapidly deflating dick");
	}
	else output("artificial cock");
	output(" still inside her, she ");
	if(condom) output("pulls off her condom, expertly tying it off and setting it aside.");
	else output("plays with the puddle of spunk surrounding her, while giving you a dirty look. <i>“And of course now I have to clean up... Thanks for that </i>mi amour<i>.”</i>");

	output("\n\nAfter a moment Aliss regains the use of her legs and ");
	var knotted:Boolean = false;
	if(x >= 0)
	{
		if(pc.hasKnot(x)) knotted = true;
	}
	if(!knotted) output("stands up, pulling herself off your cock with a wet squelch. She stretches her arms and legs and reaches for the stash of condoms, <i>“Mmm, that was a great start. Let’s see if you can do that again.”</i>");
	else output("tries to stand up, though she doesn’t manage to get far with your knot firmly lodged inside her. She frowns and twists around to look at you, <i>“Oh boy, looks like we get to cuddle for a bit,”</i> she says with delight as she leans back into you. <i>“And then we’ll try it again. Let’s see if you can put out the same performance, shall we?”</i>");
	processTime(20+rand(10));
	pc.orgasm();
	chars["ALISS"].orgasm();
	

	clearMenu();
	if(condom) addButton(0,"Next",alissButtFuckEndWithCondom);
	else addButton(0,"Next",alissButtFuxEnd,x);
}

public function alissButtFuckEndWithCondom(x:int = -1):void
{
	alissButtFuxEnd(x,true);
}

public function alissButtFuxEnd(x:int = -1, condom:Boolean = false):void
{
	clearOutput();
	author("Third");
	showAliss(true);
	output("<b>One hour later.</b>");
	output("\n\nInsatiable as she is, the rapacious ovir doesn’t let you go until you’ve ");
	if(x <= 0) output("fucked her senseless several times");
	else if(condom) output("filled several more condoms in her ass");
	else output("deposited several more loads in her ass");
	output(", and not until she’s ");
	if(condom) output("filled a small mountain of condoms herself");
	else output("painted half the room white with her spooge");
	output(". Toward the end you found yourself nearly exhausted, while Aliss still seems to have energy to spare.");

	output("\n\nShe giggles and waves a hand. <i>“Don’t worry about it lover-" + pc.mf("boy","girl") + ", how about you get cleaned up and head back out onto the floor. I’ll clean all this up,”</i> she says, motioning towards the ");
	if(condom) output("mountain of filled condoms");
	else output("massive puddle of spunk");
	output(" with a resigned sigh. She hands you a few moist wipes, which you use to clean up ");
	if(!pc.isNude()) output("and then re-dress ");
	output("before returning to the storefront proper.");

	fuckedAliss();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	chars["ALISS"].orgasm();
	chars["ALISS"].orgasm();
	chars["ALISS"].orgasm();
	processTime(60+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Offer Pussy, But No One Plays Females in TiTS Geez What Are You Doing
public function offerPussyYouSloot():void
{
	clearOutput();
	author("Third");
	showAliss(true);
	var x:int = rand(pc.totalVaginas());
	output("The cock before you glistens tantalizingly with precum. You swallow hard, feeling a warm tingle from down below. Almost instinctually [pc.eachVagina] is growing wet with arousal.");
	output("\n\nSeeming to sense this, Aliss steps forward, her strawberry flavored lips suddenly on yours. One of her hands");
	if(pc.legCount > 1) output(" delves between");
	else output(" caresses");
	output(" your [pc.legOrLegs], her fingers gently exploring your outer cunt lips while her mouth explores your real lips. She gently sucks your lower lip into her mouth, nibbling it for a moment before pulling away and releasing it.");
	//Tauric players:
	if(pc.isTaur()) output(" Aliss slips behind your large, bulky body and kneels.");
	else output(" <i>“Let’s get you comfortable first,”</i> she says, motioning to the bench in the changing room. She pulls you over to it and gently lays you down onto your back before sitting on the opposite end and leaning down.");
	output(" Her lips caress your nethers as she lightly kisses. Her hands tenderly drift up and down your [pc.legOrLegs], caressing you in faint circles. The heat builds in your groin as you find yourself growing damper under these ministrations.");

	//not very wet:
	if(pc.wetness(x) < 1) output("\n\n<i>“Hmm, we’re going to have to give mother nature a helping hand here I think,”</i> Aliss says, noting your general lack of wetness.");
	//normal wetness:
	else if(pc.wetness(x) < 3) output("\n\n<i>“Oh my, getting excited are we?”</i> Aliss giggles, her lips coming back sticky from your pussy.");
	else if(pc.wetness(x) < 5) output("\n\n<i>“Ooh,”</i> Aliss says, her lips coming back with trails of slime on them. <i>“Someone’s getting very excited for the </i>coming<i> attractions.”</i>");
	else output("\n\nAliss’ eyes go wide as her lips come back with long strands of feminine slime connecting her to your cunt. You’re already so wet that rivulets of your arousal are forming a puddle somewhere beneath you. Aliss looks positively dumbstruck for a moment, but then a predatory grin comes to her face.");
	output(" She delves back down, delivering a few more kisses before she gently licks your outer folds. You lean back, moaning slightly, content to be eaten out for now.");

	output("\n\nYou feel her tongue slipping inside you, lapping at your inner walls for a moment before zipping right back out. Then it delves back inside, just a little bit further than before. Her long reptilian tongue slips in and out, like a slick prehensile cock fucking you over and over. Little arcs of electric bliss fly through your body as her tongue finds its mark... your g-spot. The tip of her tongue flicks over it and you have to stifle a cry of pleasure, lest everyone in the store hear you.");

	output("\n\nHer tongue continues to work the g-spot in between moments of exploration. With each flicker of her tongue you moan just a little bit louder. You arch your back and your body shudders slightly as a minor orgasm passes over you. Rather than diminishing your arousal, instead you feel more worked up. With every pulse of her tongue over your g-spot, your skin grows warmer, your flesh tingling as if your entire body were an erogenous zone. Hornier than ever, you can’t help but open your mouth. Your voice comes out breathier than normal as you ask... no, beg Aliss to fuck you.");

	output("\n\nA grin passes over her face as she withdraws her tongue from your sensitive folds. <i>“I thought you’d never ask, baby,”</i> she says. The grin turns mischievous, however, as she grabs a pair of panties loose on the floor. <i>“Trust me, </i>mi amour<i>, this will be fun.”</i> She takes your hands and, using the panties, expertly ties them together and pins them up onto a nearby clothes hook. You quirk a brow and struggle against the bindings for a moment. <i>“Ah-ah,”</i> she tuts at you. <i>“No struggling, just let me take care of everything.”</i> Her voice practically purrs as she says ‘everything.’");

	output("\n\nAs you ");
	if(pc.isTaur()) output("stand");
	else output("sit");
	output(" there, your arms bound, you watch Aliss reach to the side and produce what appears to be a silver condom package. The wrapper has an eight-legged horse and the word “Stallionguard” emblazoned on it. <i>“They make them specifically for horsecocks, but we ovir are so similar they’re just perfect for us too,”</i> she says, momentarily rubbing your outer folds to elicit a light moan from you. <i>“I love them... they’re so thin it’s like wearing nothing at all");
	if(silly) output("-”</i> Stupid sexy Aliss! <i>“-");
	else output(",");
	output(" and besides that, they help keep the room nice and tidy.”</i> She giggles softly as she opens the packet and produces a translucent condom, which she expertly slips onto her hard shaft.");

	//tauric:
	if(pc.isTaur()) output("\n\nStanding, Aliss takes her shaft in hand as she positions herself behind your large body.");
	else if(pc.isNaga()) output("\n\nAliss straddles your serpentine body, her shaft in hand as she lines it up with your vagina.");
	else if(pc.isBiped()) output("\n\nShe sits up, straddling the bench as you splay your [pc.legs] wide, granting her entrance to your waiting hole.");
	else output("\n\nShe sits up, straddling the bench as you spread your [pc.legOrLegs], granting her entrance to your waiting hole.");
	output(" Her slick purple rod tantalizes your nethers for a moment as she rubs the flat tip across your folds");
	if(pc.hasClit()) output(" and clit");
	output(". This teasing continues for another minute, until your [pc.legOrLegs]");
	if(pc.legCount == 1) output(" is");
	else output(" are");
	output(" dripping with arousal. You groan loudly and tell her to just stick it in already.");

	output("\n\nAliss smirks and obliges, sinking the first few inches of her impressive cock into your waiting cunt. ");
	if(pc.hasCock()) output("[pc.eachCock] has a pang of jealousy and twitches, rapidly growing to full mast while Aliss plunges into you. ");
	output("You feel her girth stretching you wide, a pleasant feeling that makes your whole body quiver. The alien shemale wastes no time developing a fast-paced rhythm as she dives into your trembling depths again and again. Your whole body aches; you want to use your hands for something, anything! But bound as they are, you feel so helpless, at the whims of Aliss and whatever she wants to do to you.");
	pc.cuntChange(x,chars["ALISS"].cockVolume(x),true,true,false);

	output("\n\nYour nipples, hard as they are, ache to be caressed. A need Aliss is all too willing to fulfill. With one hand on your hip, the other takes hold of one of your nipples, gripping it roughly between several fingers. You arch your back, moaning as she rolls the little nub around, gently teasing and tantalizing it. Aliss continues to pound away at your wet, sloppy cunt, a determined look on her face.");

	output("\n\nMiniature tremors flow throughout your body, making you quiver this way and that. Your body grows hotter with every thrust, with every pussy-stretching moment. You shut your eyes and lick your lips. A whine escapes your lips as you ache to touch yourself. You can feel orgasms building, but the way Aliss is going seems to keep you on the edge rather than push you over it. The panties binding you seem to be stronger than you’d thought. The more you struggle against them the tighter they feel.");

	output("\n\nNoticing your battle with the bindings, Aliss slides the hand on your nipple downward to your crotch");
	if(pc.hasClit()) output(". Between thrusts she rubs her thumb along your [pc.clits]");
	output(", sending spikes of pleasure all over your body. Your plaintive cries grow louder and louder. You no longer care about the rest of the store hearing you in here. You just need some kind of relief!");

	output("\n\nAliss’ pace picks up, her hips undulating in time with some unheard beat. You notice her bulky tail slipping forward between her legs to flick over ");
	if(pc.totalVaginas() == 2) output("your other neglected pussy");
	else if(pc.totalVaginas() > 2) output("one of your other neglected pussies");
	else output("your sensitive asshole");
	output(". Biting your lip, you stifle another moan as another miniature orgasm rockets through you. It’s quickly followed by a second, and then a third. None of them bring you the relief you so desire, instead they only make your body hotter and more sensitive.");

	output("\n\nYour entire body feels like it’s one big erogenous zone at this point, like almost any kind of touch could send you right over the edge. But with your hands bound, you’re at the mercy of Aliss, who seems to know exactly what to do to keep you on the brink. Your body quivers at her touch, your pussy clamping down on her condom-clad cock. It just feels so damn <b>good</b> to be filled like this, but it’s not enough! You need more!");

	output("\n\nJust when you think Aliss is going to keep you like this forever, she gives a grunt, her euphoric cries surpassing your own. Her slick rod pulses within you, filling the condom somewhere in your belly with a warm, gooey payload. This. This more than anything sends you teetering over the edge. You’d been building up to this for several minutes, and now you give in, letting your instinctual mind take over. Your body ignites like a firework. Orgasmic electricity fires throughout your body. Your fingers ");
	if(pc.legType == GLOBAL.TYPE_HUMAN) output("and toes ");
	output("curl. Your stomach tenses and back arches. You clamp your eyes so tightly shut you can see blue-tinged specks erupt in the darkness. Gasping for air, your mouth hangs open, tongue easily lolling out. Your limbs twitch and spasm, completely out of your control. Your cunt clamps down on the invader inside it and pulses, as if trying to milk the cock for all it’s worth.");

	output("\n\nAs the powerful orgasm begins to subside, you slump back");
	if(pc.isTaur()) output(", leaning on the wall");
	else output(" onto the bench");
	output(" and let out a satisfied sigh. The aftershocks of orgasmic ecstasy continue through you for several minutes, and you’re content to wait it out, reveling in the feelings.");

	output("\n\nAfter a while, you’re suddenly aware of Aliss, who, it seems, has been watching you with a curious yet content look on her alien visage. She pulls out of you with a wet <i>schlorp</i> and slips the condom off her penis. Tying it up with expert speed, she sets it aside, and then reaches for a new one. Oh boy. The fun is just beginning.");
	processTime(30+rand(5));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",takeItInZeCoochFromAlissFinal,x);
}

public function takeItInZeCoochFromAlissFinal(x:int = 0):void
{
	clearOutput();
	author("Third");
	showAliss(true);
	output("<b>One hour later.</b>");
	output("\n\nYou emerge from the changing room shakily. Your body feels like it’s been through an intense workout. Not content to have just one romp, Aliss filled several more condoms inside of you, stacking them all in the corner of the room like a perverted timepiece. You switched positions several times, and even got free of the damnable panties once, forcing her into the same position you were in while you rode her for all she’s worth.");
	output("\n\nYou smile a bit, but rub your sore muscles. You’ll be feeling this in the morning, that’s for sure. Sighing to yourself, you allow Aliss some time to “clean” the changing room, while you look over the displays and wait for her.");
	fuckedAliss();
	processTime(60+rand(5));
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	chars["ALISS"].orgasm();
	chars["ALISS"].orgasm();
	chars["ALISS"].orgasm();

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Offer Ass, Because You're Slutty McButtslut
public function offerAlissYourAss():void
{
	clearOutput();
	author("Third");
	showAliss(true);
	output("You bite your lip as you look at the impressive member between Aliss’ legs.");
	if(pc.hasCock() && pc.biggestCockLength() >= 15) output(" It’s not as big as yours, of course, but as far as natural dicks go, fourteen inches is quite respectable.");
	output(" Its purple exterior glistens with fresh pre-cum, beckoning you closer.");

	output("\n\nAliss smiles and steps forward, taking your hand in hers and guiding it to the throbbing, slick rod between her legs. The alien woman coos softly as your fingertips make contact with her. You wrap your fingers around the firm shaft, marveling at the heat emanating from its smooth surface. Aliss guides your hand, urging you to gather up a fresh dollop of pre-cum on your fingers before bringing it up to her mouth and enveloping two of your fingers in her mouth. Her eyes roll back in their sockets as you feel her tongue lap her own sexual juices off your digits.");
	output("\n\nOnce they’ve been polished clean, Aliss relinquishes your hand, which you reluctantly withdraw from her mouth. The lizard licks her lips seductively and leans in. <i>“So, </i>mi amour<i>,”</i> she says, her plump lips emphasizing the endearment. <i>“I’m gonna stick this thing somewhere... where do you want it to go?”</i>");
	output("\n\nYou gulp, but smile. In the confined space, you can’t help but rub against Aliss, who makes no play at modesty. Her hands are on you the entire time, her pink painted nails sliding across your flesh, raising goosebumps wherever they go. You give an involuntary shiver as the digits make their way down");
	if(pc.isTaur()) output(" and across");
	output(" your body, before ending at your groin. You turn around");
	if(!pc.isTaur()) output(" and slowly bend over");
	output(", presenting your [pc.asshole] to the horny ovir.");

	output("\n\n<i>“Ohh, what have we here,”</i> she says, her voice turning husky. <i>“So eager to have your little asshole plugged. But not yet, we’ve got to get you ready first.”</i> You quirk an eyebrow and look to the side, watching Aliss in the mirrors that surround you. She ");
	if(pc.tallness >= 84) output("leans in");
	else output("kneels down and leans in");
	output(", giving your asshole a quick kiss. You start slightly when you feel her warm tongue lap at the edges of your pucker.");
	if(pc.hasVagina() || pc.hasCock()) 
	{
		output(" Suppressing another shiver, you find ");
		if(pc.hasCock())
		{
			output("[pc.eachCock] rising to the occasion");
			if(pc.hasVagina()) output(" and ");
		}
		if(pc.hasVagina()) output("[pc.eachVagina] moistening");
		output(" in approval of the tongue bathing you’re receiving.");
	}

	output("\n\nAliss’ tongue dives into your sphincter, exploring its hot folds. ");
	if(pc.hasCock()) output("It probes deeper and deeper before finding its mark... [pc.eachCock] gives a twinge of urgency as a sudden pressure comes down on your prostate. ");
	output("You gasp slightly and bite your lip. The invader in your anus delves deeper still until your entire body shivers, as if Aliss had just touched the core of your being... which is of course, impossible. Nevertheless, the snake-like appendage inside you writhes and squirms, coating the walls of your rectum in saliva, no doubt in preparation for your imminent reaming.");

	output("\n\nAnd then, just like that, the sensation is gone. Aliss’ tongue retreats from your freshly slickened asshole, leaving you feeling strangely empty. You catch the ovir’s reflection licking her lips as she smiles. <i>“Mmm, now that you’re all good to go, let me just grab some protection,”</i> she says, retrieving a small silver packet from the nearby bench. Emblazoned on the wrapper is an eight-legged horse, and even at this angle you can see it says “Stallionguard.” <i>“These bad boys are meant for people with horsecocks, but they fit us ovir perfectly too,”</i> Aliss giggles, opening the wrapper and producing a large, semi-transparent condom.");
	output("\n\nShe gathers up another dollop of pre-cum and smears it down her length, her eyes fluttering ever-so-slightly in response. Your ovir lover presses the condom against her semi-flat cockhead and begins pulling it down. You bite your lip in anticipation as, inch by inch, the cock that will soon be buried in you is covered in a transparent, latex-like sheen. Your [pc.asshole] quivers slightly as a drop of Aliss’ saliva dribbles downwards.");
	if(pc.hasCock())
	{
		output("\n\nAliss also produces ");
		if(pc.cockTotal() == 1) output("an");
		else if(pc.cockTotal() == 2) output("a couple");
		else output("a few");
		output(" extra condom");
		if(pc.cockTotal() > 1) output("s");
		output(" and passes them to you. <i>“You’d best suit up too, I don’t want to have to spend the next hour cleaning, and I don’t think you do either.”</i> You nod absently. Making a mess is great when you don’t have to worry about the consequences. Reluctantly, you put on the condom");
		if(pc.cockTotal() > 1) output("s");
		output(", and present your ass once more.");
	}
	output("\n\nGripping her newly covered cock, Aliss looks down at your ");
	if(!pc.isTaur()) output("bent-over ");
	output("body with mirthful eyes. She inches closer, and you can suddenly feel the heat of her cockhead against your asscheeks. <i>“Are you ready?”</i> she asks. You nod and shift your body slightly, pressing it against the lizard girl behind you. <i>“Eager slut aren’t you? Mm, so am I...”</i> Her voice quivers and trails off at the end.");

	output("\n\nWeight shifts behind you, and you suddenly feel more than heat. A new, urgent pressure eases into your butthole. ");
	if(pc.ass.looseness() < 1) 
	{
		output("Your tight ");
		if(pc.analVirgin) output("virgin ");
		output("asshole resists, reflexively clamping shut as the invader pushes forward. Aliss gives a grunt of effort and thrusts, piercing your snug ");
		if(!silly || !pc.hasCock()) output("rosebud");
		else output("yaoi-hole");
		output(".");
	}
	else if(pc.analCapacity() <= chars["ALISS"].cockVolume(0)) output("Your asshole resists, reflexively attempting to clamp shut as the anal invader inches forward. You bite your lip as Aliss grunts, thrusting in with one smooth motion.");
	else output("Your spacious and gaped asshole yawns widely as Aliss thrusts forward, engulfing her alien cock in one smooth motion.");
	output(" A sigh escapes your lips as your fuckhole widens to accept the dick. You clench once, acutely aware of the miniature beast within you.");
	pc.buttChange(chars["ALISS"].cockVolume(0),true,true,false);

	output("\n\n<i>“Ohh, fuck yes,”</i> Aliss mutters under her breath, <i>“");
	if(pc.ass.looseness() < 1) output("You are <b>tight</b>!");
	else if(pc.analCapacity() <= chars["ALISS"].cockVolume(0)) output("Your ass is squeezing me just right.");
	else output("Mmm, you certainly have a cock hungry ass, don’t you?");
	output("”</i> You open your mouth to respond, but Aliss thrusts forward, replacing any coherent words coming out of your mouth with a deep, throaty moan. Thanks to the extra lubrication, she has no problem slipping a few more inches of smooth lizard cock inside.");

	output("\n\nLetting out a low moan, you can’t help but stare at your reflection in the mirror. With every thrust, the lustful look on your face grows more distinct. The hard, hot rod in your ass pounds away, sending shivers of delight throughout your body. A light tingling starts to build in your fingers and toes, a pleasant erotic buzz that threatens to overtake your entire body. Aliss, sensing this, slows her onslaught while bending over. You feel fingers on your back, tracing small invisible patterns in your flesh. The fingers slowly trail down your body, slipping under you and finding their target: your nipples. You squirm passively as Aliss’ cutely painted nails pinch at ");
	if(pc.totalNipples() > 2) output("two of ");
	output("your nipples, lightly rolling the hard nubs between the tips of her fingers.");
	if(pc.cockTotal() > 1) output(" [pc.EachCock] throbs painfully, jealous of the attention your nipples are getting.");

	output("\n\nThe tingling only builds, like electricity firing off between your nerve endings. Aliss sighs contentedly as she buries the last few inches of her cock into your yearning ass. You let out another lusty moan. You can just feel every last inch in your ass. It half-heartedly squeezes the large condom-clad invader. The tingling running throughout your body now seems focused on your asshole, the heat building. Your reptilian alien lover gets back into her rhythm without letting go of your nipples.");

	output("\n\nLooking back in the mirror, you see your own desire-filled face is matched only by Aliss’. Her eyes are rolled back, her eyelids drooping listlessly. Seeing her like this just drives your body into overdrive. You bite your lip as the lightning-like orgasm in your veins fires off again and again, rolling over your body like a wave. The utter, euphoric pleasure makes your fingers and toes curl in delight, and your vision tinges blue.");
	if(pc.hasVagina()) 
	{
		output(" Your [pc.vaginas] twinge");
		if(pc.totalVaginas() == 1) output("s");
		output(" jealously, its walls contracting and pulsing, as if begging for a cock to fill it.");
	}
	if(pc.hasCock()) 
	{
		output(" Meanwhile, [pc.eachCock], though neglected, throbs as the orgasmic wave flows through you. You moan as ");
		if(pc.cockTotal() == 1) output("it erupts");
		else output("they erupt");
		output(", spurting cum directly into the high-tech condom, which grows bulbous.");
	}

	output("\n\nAliss, seemingly unable to go any further either, lets out a light cry of, <i>“Oh fuck, yes!”</i> Her thrusts slow but do not stop as you feel a new source of warmth coming from your belly... Jet after jet of cum fills the condom inside you, and though you can’t see it, the mental image drives you right over the edge.");
	output("\n\nAn earth-shattering moan escapes your lips as another orgasm washes over you... you just feel so <i>full</i>.");
	if(pc.hasVagina()) 
	{
		output(" Your cunt");
		if(pc.cockTotal() > 1) output("s quiver");
		else output(" quivers");
		output(", climax striking once again.");
	}
	if(pc.hasCock())
	{
		output(" The condoms hanging from your dick");
		if(pc.cockTotal() > 1) output("s twitch and pulse");
		else output(" twitches and pulses");
		output(" as you let out another barrage of cum.");
	}
	output(" You want this feeling to last forever, being filled with cock and cum. You want <i>more</i>. You barely recognize your own voice, breathily begging, <i>“More. Fuck me, fuck me more,”</i> as though you were nothing more than a slut on a holovid.");

	output("\n\nThe two of you collapse onto the changing room bench, both panting. Aliss’ hands roam your body, her lips kissing your skin. It’s a long, precious moment before you realize her cock is still buried deep inside you, holding its payload of cum.");
	output("\n\nAliss tenderly pulls out, a massive white-filled balloon attached to the end of her dick. She slips the condom off and ties it up, careful as to avoid spillage. She then looks down at your body and grins, reaching for another condom.");
	processTime(30+rand(5));
	pc.orgasm();
	pc.orgasm();
	chars["ALISS"].orgasm();
	clearMenu();
	addButton(0,"Next",offerAlissYourAssPart2);
}

public function offerAlissYourAssPart2():void
{
	clearOutput();
	author("Third");
	showAliss(true);
	output("<b>One hour later.</b>");
	output("\nSeemingly insatiable, Aliss doesn’t quit until several condoms surround her");
	if(pc.hasCock()) output(", both yours and hers");
	output(". By the end you’d lost count of how many times you came... it has to be a least a dozen, if not more.");

	output("\n\nYou stand up shakily, and Aliss helps you get dressed. <i>“Go on then, </i>mi amour<i>. I’ll clean up here,”</i> she says, motioning to the multitude of condoms strewn about. You nod, and depart the changing room. All eyes are on you... it seems everyone in the store knows what went on. Not like you were particularly subtle about it.");
	fuckedAliss();
	pc.orgasm();
	pc.orgasm();
	if(rand(2) == 0) pc.orgasm();
	if(rand(2) == 0) pc.orgasm();
	chars["ALISS"].orgasm();
	chars["ALISS"].orgasm();
	if(rand(2) == 0) chars["ALISS"].orgasm();
	if(rand(2) == 0) chars["ALISS"].orgasm();
	pc.exhibitionism(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Suck Her Off, You Cum Addict You
public function suckAlissOffBecauseYouLikeToGulpDownLoadsOfJizzYouSlut():void
{
	clearOutput();
	author("Third");
	showAliss(true);
	output("The way that purple alien cock dangles between Aliss’ legs makes your mouth water. There’s something about the fresh pre-cum glistening across its length that seems so mesmerizing. As you watch, the alien gathers another dollop of pre-cum and smears it along the shaft.");
	output("\n\n<i>“You seem quite fixated on this... perhaps you’d like a taste?”</i> she asks, a devilish smile creeping over her face. You nod absently. Aliss steps forward suddenly, slipping a hand underneath your chin ");
	//(PC <6')
	if(pc.tallness < 72) output("and raising your head");
	else output("while leaning in");
	output(" for a kiss. Her lips are soft, tasting of fresh strawberries. Aliss presses closer, draping one arm over your shoulder and sliding it up the back of your head");
	if(pc.hasHair()) output(", her fingers running through your hair");
	else output(", her fingers cupping your bald head passionately");
	output(". You return her kisses passionately, pulling her closer to you, your hands running down her lush sides to cup her supple, pert ass. Aliss’ slick member presses against your ");
	if(pc.tallness > 78) output("groin");
	else if(pc.tallness > 66) output("stomach");
	else output("[pc.chest]");
	output(", sandwiched between your bodies. You can feel it pulse as blood flows through it.");

	output("\n\nYou drop a hand, plunging it between you and Aliss, to fondle that large, purple horsecock, feeling it pulse under your touch. Its smooth skin is slick with pre-cum, and your fingers want to glide along it effortlessly. Aliss moans into your mouth as you lightly grip her member.");

	output("\n\n<i>“Mmph, can’t wait for the main attraction, huh?”</i> she giggles girlishly, pulling away from the kiss. <i>“Well all right, I’m happy to oblige such an eager cumslut.”</i> The alien woman gives you one last, deep kiss, sucking one of your [pc.lips] into her mouth to lightly nibble on for a moment, before breaking away. She sits down and spreads her legs invitingly. The purple rod betwixt them gleams and beckons you closer.");
	output("\n\nYou feel your face flush as you ");
	if(pc.hasKnees()) output("kneel");
	else output("lower your body");
	output(", your gaze locked on that cock. Aliss’ fingers lightly wrap around it, giving it a few, shallow strokes. Precum oozes out the slit on the end and your mouth waters.");

	output("\n\n<i>“Come on then, my little cockslut,”</i> she says, a coy smile on her face. <i>“Give it a lick.”</i>");

	output("\n\nYou nod absently and lean forward, your tongue extending. You lap at the long trail of precum dribbling down her length, sucking it up into your mouth and savoring its salty-sweet taste.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Then you wrap your [pc.tongue] around her shaft, marveling at its taste. Using it like a hand, you slip it up and down, pausing only to lick at the head, or to gently caress the folds of her cloaca.");
	else output(" You lick up and down her shaft, tracing every vein and paying close attention to the slight flare around her cockhead.");
	output(" Aliss moans quietly, leaning back on the bench while you work.");

	output("\n\nSoon the sheen of precum has been replaced by a sheen of saliva. Your mouth still watering, you take a deep breath and pull the tip of her cock into your mouth. Aliss moans appreciatively. Her eyes meet yours and without saying a word she urges you to continue. You work your tongue around her head, flicking it along the tender underside as well as the slender cumslit. You bob your head down slightly, sucking more of the sweet, hot rod into your mouth with every motion.");

	output("\n\nYou alternate between sucking on the tip and licking her length. Each time you take it into your mouth, you take it a bit deeper. You wrap one hand around her manhood, gripping her tight before slowly pumping it as you blow her. Aliss bites her lip and sinks lower on the bench. Her groans grow louder with every passing minute. You’d smile to yourself right now, but it’s kind of difficult to do so when you have a mouth filled with dick.");

	output("\n\nWorking your tongue around her shaft you find her responding more actively to certain areas... the area just behind the flare, and right on the slit. Aliss squirms in her seat as you concentrate there momentarily. She practically squeals when you simply focus on flicking your tongue over her cumslit for a whole minute. As fun as it would be to have her blow her load right now, showering you with her hot, gooey cum, you force yourself to focus elsewhere.");

	output("\n\nYou pull back to get your breath, and then delve back down onto that cock in one fell swoop. Were she an average, or hell, even above average human male, you’d have taken her to the hilt. But as an above average ovir male, you find your mouth and even some of your throat filled, with several inches yet to go. You pull back up and bob back down, quickly finding a rhythm. With every downward movement your throat gets filled a little more.");

	output("\n\nAliss’ eyelids flutter half-closed. One of her hands finds its way to a dark, chocolatey nipple while the other reaches for you, ");
	if(pc.hasHair()) output("her fingers running through your hair before");
	else output("running over your smooth head before");
	output(" hooking around at the base of your skull, pulling you down further onto her cock. Minutes pass of this intensely arousing throat fucking, and you only have to pause for air once or twice. Aliss’ tail finds its way to you, wrapping around your torso in feverish abandon.");

	output("\n\nThe lizard-like alien’s cries grow ever louder, so much so you’re certain the entire store can hear what’s going on. That doesn’t seem to stop her, however. Her hips gyrate as you blow her, stuffing your mouth even more. With every thrust she gives, her body seems to tense up a little more....");
	output("\n\nShe’s almost ready to pop. The question is, where do you want her sweet, creamy cum to go?");

	processTime(20+rand(10));
	pc.changeLust(15+rand(10));
	//[Swallow] [On You] [On her]
	clearMenu();
	addButton(0,"Swallow",swallowAlissSpunk,undefined,"Swallow","Take Aliss’ load into your mouth and stomach, where it belongs.");
	addButton(1,"On You",takeALoadInDaFaceFromAliss,undefined,"On You","Take Aliss’ load all over you, where it belongs.");
	addButton(2,"On Her",alissDumpsALoadOnHirseflLOLHirDurhurhur,undefined,"On Her","Aim Aliss’ load back at her own body, where it belongs.");
}

//Swallow
public function swallowAlissSpunk():void
{
	clearOutput();
	author("Third");
	showAliss(true);
	output("You quickly make the decision to swallow every last drop of her cum. As she’s tensing up you make sure she’s buried as far into your mouth as possible. Aliss bites her lip, and you can feel her body tensing up. The tail wrapped around your midsection constricts, though not painfully. Aliss bucks her hips as the cock within your throat suddenly grows rigid.");
	output("\n\nAn unearthly cry escapes from the lizard-girl’s throat, filling the little changing room, and most certainly echoing throughout the rest of the store. A sudden flood of warmth envelops your body as Aliss’ seed is pumped directly into your stomach. You pull the cock out slightly so that jet after jet of cum goes straight into your mouth. You gulp it down greedily, your mind in too much of a haze right now to think properly. You swirl the cum around in your mouth, luxuriating in its taste. With every gulp of cum you feel your body growing warmer... more aroused with every mouthful.");
	output("\n\nSighing softly, Aliss slumps back on the bench happily. <i>“You are a mighty fine cocksucker,”</i> she giggles. <i>“Anyone ever tell you that?”</i>");
	output("\n\nYou smile back at her and dutifully clean her softening cock with your tongue. After a few minutes Aliss pulls you close and kisses you once again. You get the taste of cum and strawberries, a decidedly marvelous combination. She doesn’t seem to mind the traces of cum on your lips and mouth. Quite the contrary, she kisses you deep, her tongue intermingling with your own, and when she pulls back she says, <i>“Hmm, I taste good.”</i>");
	output("\n\nNodding, you agree, and share another kiss. After a moment Aliss sits back up. <i>“All right, </i>mi amour<i>, I’ll handle the clean up, why don’t you get your sexy ass back outside before people think we’re having a sex marathon in here?”</i>");
	output("\n\nYou smile, get dressed and head back out into the store. All eyes are on you, until Aliss rejoins you a few minutes later.");
	chars["ALISS"].orgasm();
	pc.loadInMouth(chars["ALISS"]);
	fuckedAliss();
	pc.changeLust(10);
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//On You
public function takeALoadInDaFaceFromAliss():void
{
	clearOutput();
	author("Third");
	showAliss(true);
	output("As nice as it would be to have this cum inside you, what you really want is to be covered in it. At the last second you pull the cock out of your mouth and aim it at your face. Aliss’ body tenses up, and the tail around you constricts painlessly. You wrap your hands around her cock, pumping them up and down as it grows suddenly rigid.");
	output("\n\nAll at once, her cumvein thickens, and then a burst of white, gooey cum erupts from the alien cock before you. The first jet of cum splatters against your face. The rest are less precise, landing on your outstretched tongue, chin, chest... really an available space. Pretty soon you’re practically covered in the warm substance. You greedily gulp down whatever lands in your mouth.");
	output("\n\nWhen Aliss slumps backward on the bench, completely spent, you lean back as well, taking a moment to appreciate the feeling of the seed on your [pc.skinFurScales]. Then, using two fingers, you collect some of the cum and swallow it. You lick your cum-stained lips, and then lean forwards, giving Aliss a sloppy, wet kiss that tastes of strawberry and jizz. She giggles and returns it, even going so far as to lick some of her own seed off your face.");
	output("\n\nAfter a minute or so, Aliss sits up and retrieves a few moist wipes. <i>“Let’s get you washed up, shall we?”</i> You clean yourself as best you can, get dressed, and the two of you head back out into the store.");
	pc.applyCumSoaked();
	pc.changeLust(10);
	chars["ALISS"].orgasm();
	fuckedAliss();
	processTime(5);
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//On Her
public function alissDumpsALoadOnHirseflLOLHirDurhurhur():void
{
	clearOutput();
	author("Third");
	showAliss(true);
	output("A mischievous thought crosses your mind. As much as you’d like the cum... you think Aliss might like a taste of her own medicine. As her body tenses and the cock inside your throat grows rigid, you pull your mouth away. You grip it firmly and point it, not at yourself, but at the lizard-like woman in the throes of passion.");
	output("\n\nHer cumvein thickens and suddenly a burst of pearlescent white cum erupts from the cock, splattering against her own face. Her eyes widen in surprise, but there’s nothing she can do about it as another jet blasts against her face, then another against her breasts. Blast after blast covers her from face to stomach in creamy goo. You can’t help but giggle as she gulps down any that falls into her mouth. She licks her lips and actually scoops up some more seed with two fingers, letting that dribble into her mouth.");
	output("\n\nAliss slips forward on the bench, pulling you into a sloppy, salty kiss. Her lips taste of strawberries and cum this time, an altogether not unpleasant taste. Her tongue breaches your mouth, carrying globules of sticky jizz, which you are all too happy to swallow. She breaks the kiss and bites her lip, suddenly looking coy. <i>“Well, dear, I certainly wasn’t expecting that, but I must say... I taste damn good. Perhaps next time you’ll have to get your own full taste.”</i>");
	output("\n\nShe laughs and the two of your share another messy kiss. After a minute, Aliss retrieves some moist wipes. <i>“Let’s get cleaned up, shall we? Don’t want to look like we were just assaulted by some kind of ghost that left ectoplasm everywhere.”</i> The two of you clean up, get dressed and return to the store proper.");
	pc.changeLust(10);
	chars["ALISS"].orgasm();
	fuckedAliss();
	processTime(5);
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function fuckedAliss():void
{
	if(flags["TIMES_SEXED_ALISS"] == undefined) flags["TIMES_SEXED_ALISS"] = 0;
	flags["TIMES_SEXED_ALISS"]++;
}

//Aliss
//(Open's Aliss' options.)
public function alissDiscussionsInsteadOfPanties():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("<i>“I’m not here for shopping right now,”</i> you say. <i>“I came here to talk with you.”</i>");
	output("\n\nAliss smiles, <i>“All right, </i>mi amour<i>. What can I do for you?”</i>");
	//[Sex] [Talk] 
	clearMenu();
	addButton(0,"Talk",talkToAliss,undefined,"Talk","Ask Aliss some questions.");
	if(flags["TIMES_SEXED_ALISS"] != undefined)
	{
		if(chars["ALISS"].lust() >= 40) 
		{
			if(pc.lust() >= 33) addButton(1,"Sex",sexWithAlissFromMainMenu,undefined,"Sex","Talk the lingerie-wearing lady into a bedroom bout.");
			else addDisabledButton(1,"Sex","Sex","You aren’t turned on enough for sex with Aliss at the moment.");
		}
		else addDisabledButton(1,"Sex","Sex","Aliss doesn’t seem turned on enough for sex.");
	}
	else addDisabledButton(1,"Sex","Sex","You don’t know Aliss well enough for sex. Perhaps if you got her to try on a number of slinky items in a row....");
	addButton(14,"Back",mainGameMenu);
}

//Sex
//(If Aliss' lust is over 30)
//Fen note: bumped this to 40 for reasons.
public function sexWithAlissFromMainMenu():void 
{
	clearOutput();
	author("Third");
	showAliss(true);
	output("You slide your hand along Aliss’ ass and whisper in her ear if she’d like to head into the changing to blow off some steam. She blushes, but gives you a smile, <i>“All right, </i>mi amour<i>, follow me.”</i>");
	output("\n\nShe takes you by the hand and leads you into the closest changing room. You notice several other employees at the store rolling their eyes, though others seem to have barely-concealed smirks.");
	output("\n\nOnce inside, Aliss’ lingerie immediately comes off");
	if(!pc.isNude()) output(", quickly followed by your clothes");
	output(". Before you can even react her fourteen-inch long cock slides out of its cloaca and dangles enticingly. <i>“Mmm, so, baby. How would you like to relieve me?”</i>");
	processTime(1);
	//[Fuck Her] [Offer Pussy] [Offer Ass] [Blow Her]
	clearMenu();
	if(pc.hasCock())
	{
		if(pc.cockThatFits(chars["ALISS"].analCapacity()) >= 0) addButton(0,"Fuck Her",fuckDatBitchesSluttyAss,undefined,"Fuck Her","Fuck Aliss in the ass.");
		else addDisabledButton(0,"Fuck Her","Fuck Her","You’re a little too big to fuck Aliss in the ass.");
	}
	else if(pc.hasHardLightEquipped()) addButton(0,"Fuck Her",fuckDatBitchesSluttyAss,undefined,"Fuck Her","Fuck Aliss in the ass with a hardlight strapon.");
	else addDisabledButton(0,"Fuck Her","Fuck Her","You need a dick to fuck her.");
	if(pc.hasVagina()) addButton(1,"Offer Pussy",offerPussyYouSloot,undefined,"Offer Pussy","Offer Aliss the use of a proper cocksheath - your pussy.");
	else addDisabledButton(1,"Offer Pussy","Offer Pussy","You need a vagina to offer Aliss the use of it!");
	addButton(2,"Offer Ass",offerAlissYourAss,undefined,"Offer Ass","Offer Aliss the use of your ass. What better place for her to spend her lust?");
	addButton(3,"SuckHerOff",suckAlissOffBecauseYouLikeToGulpDownLoadsOfJizzYouSlut,undefined,"SuckHerOff","Suck Aliss off with your mouth.");
	if(pc.hasCock()) addButton(4,"PantyFrot",alissPresentForThirdsBday2019,undefined,"PantyFrot","Do a bit of frottage with a pair of surplus panties to wrap everything up nice and tight.");
	else addDisabledButton(4,"PantyFrot","PantyFrot","You need a penis for this.");
	addButton(14,"Back",alissDiscussionsInsteadOfPanties);
}

//Talk
public function talkToAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("You lean against a nearby countertop and ask if you could just talk for a moment.");
	output("\n\nAliss quirks an eyebrow. <i>“Oh, sure. Not used to people wanting to talk,”</i> she says with a light laugh. She goes to stand behind the counter and waves a hand. <i>“What would you like to talk about?”</i>");
	processTime(1);
	talkToAlissMenu();
}
public function talkToAlissMenu():void
{
	//[Ovir] [Mi Amour] [Chameleon Silk] [Libido] [Exhibitionism]
	clearMenu();
	addButton(0,"Ovir",talkToAlissAboutOvier,undefined,"Ovir","Talk to Aliss about her species.");
	addButton(1,"Mi Amour",miAmourTalkWithAliss,undefined,"Mi Amour","Talk to Aliss about her store, Mi Amour.");
	if(flags["TALKED_WITH_ALISS_ABOUT_HER_SHOP"] != undefined) addButton(2,"Cham.Silk",chameleonSilkTalkWithAlissYouSlut,undefined,"Chameleon Silk","Ask Aliss about Chameleon Silk.");
	else addDisabledButton(2,"Cham.Silk","Chameleon Silk","You can’t ask about this until you know about it! Try talking to her about her shop, Mi Amour, first.");
	if(flags["TIMES_SEXED_ALISS"] != undefined) addButton(3,"Libido",talkToAlissAboutLibido,undefined,"Libido","Talk to Aliss about her libido...");
	else addDisabledButton(3,"Libido","Libido","You’ll need to get intimate with Aliss before you can ask her about something like this.");
	if(flags["TALKED_TO_ALIIS_ABOUT_LIBIDO"] != undefined) addButton(4,"Exhibitionism",exhibitionismTalkWithAliss,undefined,"Exhibitionism","Talk to her about her exhibitionist tendencies.");
	else addDisabledButton(4,"Locked","Locked","There’s more to talk about here, but not until you’ve learned a bit more about her.");
	addButton(14,"Back",alissDiscussionsInsteadOfPanties);
}

public function talkToAlissAboutOvier():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("You ask about her race, the ovir.");
	output("\n\n<i>“Oh, that’s easy. You could probably find this on the extranet but whatever, I’m happy to talk about it. We were “discovered” by the UGC a couple planet rushes ago. Back then our society was reasonably advanced. We were well into an industrial revolution, even had our own primitive version of the extranet. And boy were we curious. When the UGC showed up, we were actually planning missions to land on our own moons. So when a bunch of aliens land and say there’s actually a vast network of worlds and species, we jumped at the opportunity to join them.”</i>");
	output("\n\n<i>“From what I understand, we fit pretty well into the universe as a whole. There wasn’t much of an awkward phase for us. We came in and adapted really well. My parents, and their parents, all grew up in mostly human settlements.”</i>");

	output("\n\n<i>“Now, physiologically, we’re pretty different. For example, I’m a male,”</i> she giggles, motioning down at her voluptuous, and most definitely feminine body shape. <i>“We learn about it in school. Back in our early history, the more colorful you were, the better mates you could attract. It also worked as camouflage in some areas on our home planet. As for the tits, well, who doesn’t like tits? Our women most certainly did. The bigger your boobs, the better your chances of getting a girl. It was a sign of how healthy you were. A sign that you could easily feed yourself and others.”</i>");
	output("\n\n<i>“Our females, on the other hand, are less colorful. They didn’t need the bright colors, or the large boobs, so they never developed them. Now, of course, there’s gene mods and all that, so you can’t always tell the gender of an ovir by their coloration, at least in human settlements and stations. Back home, and in primarily ovir colonies, tradition usually wins out.”</i>");
	output("\n\nAliss stretches and asks, <i>“Anything else you want to ask?”</i>");
	processTime(3);
	//clearMenu();
	//addButton(14,"Back",talkToAliss);
	talkToAlissMenu();
}

//Mi Amour
public function miAmourTalkWithAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	flags["TALKED_WITH_ALISS_ABOUT_HER_SHOP"] = 1;
	output("You ask Aliss about her store, Mi Amour.");
	output("\n\nShe perks up, her eyes suddenly sparkling. <i>“Oh! That’s a good story. Now, I grew up in a mostly human colony. There were other ovir about, but mostly humans. The local clothing shops didn’t really ever have anything that fit me, not with this big old tail.”</i> She lifts part of her bulky purple tail. <i>“So I got into sewing my own clothing. It was a bit of a natural talent, really. I </i>loved<i> clothes, so I really got into making my own.”</i>");
	output("\n\n<i>“I had huge wardrobes filled with hand-sewn dresses, blouses, skirts, pants, and so on. And all the girls in my colony wanted some too! I had a bit of an eye for fashion, even back then. So, by the time I was 15 I had this nice little side business and was cleaning up pretty good. So I paid my own way through university, and when I graduated I bought this storefront! It started off pretty small, but after my business really picked up, I bought out the surrounding stores and expanded my showfloor.”</i>");
	output("\n\n<i>“And now with my new chameleon silk, business is really booming! I’ve got people coming from all over to pick up some of my lingerie. I’m even thinking of expanding to new locations.”</i>");
	processTime(3);
	//clearMenu();
	//addButton(14,"Back",talkToAliss);
	talkToAlissMenu();
}

//Chameleon Silk
//(Unlocked after Mi Amour conversation)
public function chameleonSilkTalkWithAlissYouSlut():void
{
	clearOutput();
	author("Third");
	showAliss();
	output("You ask Aliss about the chameleon silk she’d mentioned earlier.");
	output("\n\nAliss pulls out a pair of panties from a nearby display and puts them on the counter. <i>“It’s this new type of fabric I invented. It uses these multihued synthetic fibers. They normally look like little rainbow strands, but when you pulse electricity through them, they change to solid colors. So positioned around the panties,”</i> she points at areas on the inside of the underwear. You can’t seem to see anything different. <i>“There are these little nano machines that control the colors. I made it so that they can be linked up with a simple application on any wireless device to alter the color as you see fit.”</i>");
	output("\n\nAliss retrieves a small tablet computer and presses something on the screen. The panties, before your eyes, shift from black to white, then to white and pink polka dot, pink and green stripes, and finally to solid red. <i>“It’s really cool. Patterns are taking a bit longer to work with, for obvious reasons, but we’re working on it. My biggest accomplishment was getting it to work with stockings.”</i>");
	output("\n\nShe sits on a stool and lifts both legs up onto the countertop, crossing them and smiling. A few taps on the tablet, and they shift from fishnets, to sheer, then to opaque black stockings. <i>“It took some doing, but I managed to set these up to vary in transparency as well as color. I’m hoping to apply this to thicker pieces like bras and panties next, but it’s going to take a lot of work.”</i>");
	processTime(3);
	//clearMenu();
	//addButton(14,"Back",talkToAliss);
	talkToAlissMenu();
}

//Libido
//(PC must have sexed up Aliss)
public function talkToAlissAboutLibido():void
{
	clearOutput();
	author("Third");
	showAliss();
	flags["TALKED_TO_ALIIS_ABOUT_LIBIDO"] = 1;
	output("You mention that you’ve noticed her sex drive is a little high at times, and wonder why that is.");
	output("\n\nAliss blushes, but smiles. <i>“Oh, I may have gotten a few mods to help with that. Normally, we ovir don’t have too much of a libido. A few times a year we go into a sort of heat, but aside from that we don’t really get as horny as, say, humans. Well, when I was in college, I may have been persuaded to pick up a few libido mods...”</i> she says, blushing brighter.");
	output("\n\n<i>“It was all the rage at the time. Campus was a little wild at times. And I’ll tell you what, I got to be pretty popular with my roommate. And my various neighbors.”</i> She looks around conspiratorially. <i>“And maybe a professor or two. Worst thing was, I didn’t even take their classes! Anyway. I’ve since gotten those mods toned down, but I’ve still got a few active. Enhanced sex drive, eliminated refractory period, increased sensitivity... I’ll tell you, it really gets me going just showing off my body to anyone who comes into the shop. As you’ve already found out.”</i>");
	output("\n\nHm... does Aliss have a bit of an exhibitionism fetish?");
	chars["ALISS"].lust(5);
	processTime(3);
	//clearMenu();
	//addButton(14,"Back",talkToAliss);
	talkToAlissMenu();
}

//Exhibitionism
//(Unlocked via Libido; talk with Aliss about her exhibitionism, can unlock the ability to watch Aliss via a stream & toy with her)
public function exhibitionismTalkWithAliss():void
{
	clearOutput();
	author("Third");
	showAliss();
	flags["TALKED_WITH_ALISS_ABOUT_EXHIBITIONISM"] = 1;
	output("Since it seems like Aliss is a bit of an exhibitionist, you prod her on that subject.");
	output("\n\n<i>“Oh, I... maybe. Probably. Yeah, I’m an exhibitionist,”</i> she laughs lightly, looking flustered. <i>“So, it started in college after I got those mods. I found that whenever I was modeling new clothes for people, I just got really turned on. Like, hardcore really want to fuck something. The skimpier the clothing, the better. I’d host these little fashion shows for my roommate and whoever wanted to come by, to show off my new designs and whatnot. By the end of each show, I’d just be this quivering mass just wanting to fuck everything. About that time I’d drag my roommate off into another room and we wouldn’t come out for a few hours.”</i>");
	output("\n\nAliss giggles and has a wistful look in her eyes, before snapping back to the present. <i>“Now though, it’s not so bad. But it still really gets me going. That’s why I work every day. I could just let my employees take care of everything, but I love the feeling of showing off for people. It just makes my stomach flutter. The fact that it’s in public too, that really puts a bounce in my step.”</i>");
	output("\n\nThe alien looks thoughtful for a moment. You’re pretty confident that there might be something more to this in a future update.");
	chars["ALISS"].lust(10);
	processTime(3);
	//clearMenu();
	//addButton(14,"Back",talkToAliss);
	talkToAlissMenu();
}

//sensory feedback malfunction (reviewedready for review)
//after the hardlight upgrade kit has been installed, the upgraded hardlight may begin to malfunction with very low odds while worn
//malfunction quietly sets a flag and/or replaces the underwear item with a malfunctioning version; triggers a lust-raising event at random intervals as long as the malfunctioning hardlight is worn (having separate items allows malfunction status to be tracked for each pair of panties)
//PC can fix the malfunction by returning the broken hardlight to Aliss, who will also copy the upgrade tech during the repair (unlocks upgrade kit or simply upgraded panties in Aliss's shop)
//getting the first fix may or may not prevent the malfunction from re-occurring, may reduce odds, or may allow PC to fix them on his own (designer's choice)

//lust events
public function lustOvahTimeEvent():void
{
	clearOutput();
	showName("\nMALFUNCTION!");
	author("Zeikfried");
	//first, increase lust
	pc.lust(40);
	output("A strange feeling brings your movements up short... something is tickling the ");
	if(pc.hasVagina()) output("tip of your [pc.clit]");
	else if(pc.hasCock()) output("[pc.cockHead] of your [pc.cockNounSimple]");
	else output("ring of your [pc.asshole]");
	output(". A warmth spreads through your crotch, far away and irregular, like your groin is falling asleep just as you slip into a bath.");
	if(pc.isCrotchExposedByArmor()) output(" You look down, trying to find any cause,");
	//(clothed, is airtight or horse)
	else if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT) || pc.isTaur()) output(" You shift uncomfortably in your [pc.armor], trying to break the contact and stop the rubbing,");
	//(clothed, not airtight & not taur)
	else output(" You reach into your [pc.lowerGarment], trying to find whatever’s rubbing against it,");
	output(" but the tingle persists, growing more intense until it feels like a fingertip pressing on your sex. Your body reacts to the phantom touch, pumping blood to the site... what is happening to you?");

	output("\n\nThe tingle spreads to encompass your whole pelvis, until it feels like ");
	if(pc.hasCock())
	{
		output("your [pc.cocksLight] ");
		if(pc.cockTotal() == 1) output("is");
		else output("are");
		output(" being sucked into a rough-skinned, yielding pussy");
	}
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina() || !pc.hasGenitals()) output("your [pc.vagOrAss] is penetrated by crinkly-feeling, ephemeral prick");
	output(", all tingling with tiny shocks like a sleeping limb in reverse. Your [pc.knees] wobble violently as your nerves shift gear from idle to mid-coitus; your ");
	if(pc.hasCock())
	{
		output("cock");
		if(pc.cockTotal() == 1) output(" swells and becomes");
		else output("s swell and become");
		output(" erect rapidly");
	}
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina() || !pc.hasGenitals())
	{
		output("your ");
		if(pc.hasVagina()) output("pussy");
		else output("ass");
		output(" throbs with lust");
	}
	if(pc.hasVagina()) output(", drooling lubrication into your [pc.lowerUndergarment] and ");
	else output(", ");
	output("throbbing in the numb fuzz of static-electric caresses. As the sensation reaches its peak, you finally place the feeling... it’s almost like a decentralized version of the sensory feedback from your hardlight underwear. <b>Somehow, it’s activated itself without the projector!</b>");

	//if PC’s lust does not reach max from the event damage, do this output chain
	if(pc.lust() < pc.lustMax())
	{
		output("\n\nYour [pc.hips] begin to tremble and then to pump, unbidden, trying to take pleasure from the strange slutty phantom that has possessed your body, but the fuzz remains constant, no matter your twitching, twerking, and jerking. Your arousal simmers, your body begins to heat up, but like a teakettle, you have no way to relieve your frustration short of whining.");

		//if in public, very small exhib increase and insert this
		if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) && pc.hasGenitals())
		{
			output("\n\nNor does your strange affliction escape notice; passers-by are beginning to stop and stare at the strange [pc.race] with [pc.hisHer] [pc.knees] pinched together, groaning and sweating. Most look away in embarrassment and keep moving, but a few continue to watch. You make eye contact with one");
			if(rand(2) == 0) output(" girl, and she stares back for several seconds; color rises in her cheeks as your lewd sounds turn from mumbles to moans. She blushes, and looks away... then smiles shyly and glances back again, out of the corner of her eye. ");
			else 
			{
				output(" young man, whose eyes drift greedily ");
				if(pc.biggestTitSize() >= 1) output("to your chest and then ");
				output("your sex. Your eyes trace the same path on him, and you clearly see his own erection bulging in his pants. ");
			}
			output("Your face burns... deep down, ");
			if(pc.exhibitionism() < 50) output("could it be you’re enjoying their attention, just a bit?");
			else output("you’re drinking up the attention, exulting in the eyes of your increasingly aroused audience.");
			//end public
			pc.exhibitionism(1);
		}
		output("\n\nJust as abruptly as it began, the tingle switches off and leaves you with nothing but ");
		if(pc.hasCock()) 
		{
			if(pc.cockTotal() == 1) output("a ");
			output("massive hardon");
			if(pc.cockTotal() > 1) output("s");
		}
		if(pc.isHerm()) output(" and ");
		if(pc.hasVagina())
		{
			if(pc.totalVaginas() == 1) output("a ");
			output("gushing puss");
			if(pc.totalVaginas() == 1) output("y");
			else output("ies");
		}
		if(!pc.hasGenitals()) output("a twitching asshole");
		output(" and a lot of questions. <b>Your underwear is malfunctioning. If you don’t want any more abrupt episodes like this, you should take it off or return to the store and get it fixed.</b>");
		//end of low-lust ver.
		processTime(5);
	}
	//if PC’s lust reaches maximum from the event damage, do pc orgasm and this output chain instead
	else
	{
		output("\n\nThe sudden stimulation is too much for you - it pushes you over the edge. Your [pc.knees] buckle under you, and you throw out your hands barely in time to stop yourself from hitting the dirt face-first.");
		pc.orgasm();
		//if in public and not wearing airtight, do a moderate exhib increase and this fork
		if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) && !pc.hasAirtightSuit())
		{	
			output("\n\nYour sudden collapse draws the attention of some bystanders, who crowd around to see if you’re okay. What they see tells them that you are anything but. Most who see your ");
			if(pc.exhibitionism() < 50) output("ashamed blush");
			else output("wanton, gaping smile");
			output(" and shaking hips recoil in embarrassment and scurry off quickly, but as your orgasm draws closer, a few closet perverts in each wave remain, forming a fence of bodies to take in your show.");

			//pick a boy or girl onlooker at random
			//girl
			if(rand(2) == 0)
			{
				output("\n\nAs you pan the faces of your watchers, helpless, your eye catches on the face of a young lady, smallish of frame, wearing a short skirt and radiating interest. The girl’s eyes lock with yours; held by your gaze, she doesn’t look away. Your face must show your impending climax clearly, because her cheeks flush with embarrassment. Allured by something, she sidles closer and squats next to you, right up beside your head, so close that the people on the other side of you can no longer see her feet.");
				output("\n\nThough she has apparently no problem reading your emotions, hers are a mystery. Surreptitiously, she casts her eyes around, then hooks a finger into the hem of her skirt. Blushing even deeper, she spreads her knees and hikes her skirt just a few inches, until you can see underneath. The smooth flesh tones of her thigh continue into the shadow between her legs, but instead of a strip of fabric, what peers out is a dark, glistening slit. She’s not wearing any panties!");
				output("\n\nYour eyes widen and your pupils dilate, and when you look again at her face in surprise, your little exhibitionist’s unreadable expression finally breaks - her eyes flutter and she flashes an embarrassed, proud smile.");
				output("\n\nThe lewd little lady, quite pleased with how you’re reacting to her private viewing, smiles wider and her eyes migrate to your crotch. Slowly, she reaches out to you, extending slender fingers toward ");
				if(pc.hasCock()) output("the bulge of your [pc.cockBiggest]");
				else if(pc.hasVagina()) output("the nub of your [pc.clit]");
				else output("your flat, featureless groin");
				output(". You tremble, and she stops just short. Your climax is so urgent that your vision begins to sharpen. Her chest falls with a released breath... her pussy glints as a drop of moisture wets her labia... her fingers flinch, then extend again. Her eyes lock to yours, reading your expression; your need brings a twinkle to her eye, and she presses her palm into you. You can no longer hold back. At the same moment as her hand begins to cup your ");
				if(pc.hasCock()) output("[pc.cockHead]");
				else if(pc.hasVagina()) output("[pc.vagina]");
				else output("crotch");
				output(", you orgasm.");

				output("\n\nThe girl starts as you spasm, and pulls away, but to your focused eyes it’s as if she’s moving in slow motion. You react without thinking, grabbing her arm and pulling her back in until you once again feel the curve of her palm against your sex. Her shy smile disappears, then reappears with understanding.");
				if(pc.hasCock()) 
				{
					output(" Your [pc.cocks] spurt");
					if(pc.cockTotal() == 1) output("s");
					output(", spilling [pc.cum] into your underwear; your shy admirer curls her fingers in close, until she can almost assuredly feel the strokes of semen distending your urethra and hitting the fabric beneath her demure hand.");
					//(PC has no lower outer garment)
					if(!pc.isCrotchExposedByArmor()) 
					{
						if(pc.cumQ() < 25) output(" Drops");
						else output(" Streams");
						output(" of [pc.cumGem]s squish through the sopping material, spilling over her hot skin, running between her fingers and down her wrist.");
					}
				}
				//(vag, no cock)
				else if(pc.hasVagina())
				{
					output(" Your [pc.vaginas] ");
					if(pc.isSquirter()) 
					{
						if(pc.totalVaginas() == 1) output("gushes");
						else output("gush");
						output(" with");
					}
					else
					{
						if(pc.totalVaginas() == 1) output("drools");
						else output("drool");
					}
					output(" [pc.girlCum]");
					if(pc.isCrotchExposedByArmor()) output(", turning the cloth beneath her hot hand translucent, [pc.girlCumVisc], and slick");
					output(". Her fingers curl inward, parting your labia just a bit to tease your vagina with the fabric, and her naked pussy trickles with lubrication sympathetically.");
				}
				else
				{
					output(" Your [pc.asshole] twitches and clenches; the girl cups her fingers over your crotch, trying to find the genesis of your orgasm, and finally brushes a fingertip against your pucker. With a knowing expression, she slides her hand forward until she’s pressing your sweat-stained");
					if(pc.ass.wetness() > 0) output(", lubricated");
					output(" undies into the ring playfully.");
				}
				output(" You hold her there for a long minute, cumming into her hand as she becomes more and more excited by your shamelessness - her blush begins to fade, or more accurately it decreases by contrast as the rest of her body flushes.");

				output("\n\nJust as she begins to rub her thighs together in lust, your orgasm winds down, and you release your death-grip on her arm. She almost looks disappointed. The girl pulls back and, unable to help herself, casts a furtive glance around before slipping up her skirt to give her pussy a quick rub");
				//(cock or vag and no lower outer armor)
				if(pc.hasGenitals() && pc.isCrotchExposedByArmor()) 
				{
					output(" with her ");
					if(pc.hasCock()) output("[pc.cumNoun]");
					else if(pc.hasVagina()) output("[pc.girlCumNoun]");
					output("-smeared hand");
				}
				output(". She shivers, then masters herself and tugs her skirt back over her knees. With one sly wink, the young woman stands up and disappears through the fence of onlookers, which parts to let her pass with something like reverence. And thus your anonymous benefactor is gone, leaving you there in the middle of the dwindling crowd to recover. <b>Your hardlight underwear is malfunctioning. You need to have it fixed or stop wearing it, or this will keep happening.</b>");
				//end of hi-lust, public, girl ver.
				pc.orgasm();
			}
			//boy
			else
			{
				output("\n\nPanning the crowd of observers, immobilized by your lust, your eye lights on a young man and woman standing together. The girl, a frilly-skirted, flat-chested little slip, looks away bashfully, but the young man returns your gaze with prurient, almost knowing, interest. He cracks a smile as he takes in your condition - ");
				if(pc.hasCock()) output("your bulging [pc.cocksLight]");
				else if(pc.hasVagina()) output("your pussy-slickened [pc.thighs]");
				else output("your sweating face");
				output(" and twitching hips.");

				output("\n\nThe lad’s face glints with mischief as he comprehends; he taps a finger to his lips in mock thought. With his other hand, he reaches down and tugs his pants tight, pushing his hips forward and giving you a clear view of his bulge. If there were any blood not rushing to your face before, you’re sure it’s all there now as you watch the mischief-maker unbutton his pants and expose his erection - which is quite pronounced thanks to your display. The girl next to him also notices and blushes, but instead of moving away, she simply turns her head until he can’t see her face and giggles silently. They must be together.");
				output("\n\nYour momentary lapse doesn’t escape his notice. He leans toward the girl you’re distracted by and very deliberately slides his hand under her skirt, pushing it up to expose her ass, which he squeezes plafully and then begins to caress. The girl’s blush turns furious, and her hands drop to the front of her skirt, pinning it down against his incorrigible rubbing as best she can and looking around nervously to see if any of the other onlookers have noticed yet.");
				output("\n\nSatisfied that he has recaptured your attention, the young man with one hand on his cock and one on his girlfriend’s ass beams a terrific smile, and then steps behind her such that you can only see his grinning head and shoulders over hers. The girl’s face takes on a defeated expression, as if she knows what’s coming; indeed, you can make out something shifting in her clothes. His hands appear under her frilly hemline, lowering something fabric which you belatedly realize are panties. The girl leans forward a bit, biting her bottom lip and closing her eyes, and you can see by the way his hips are moving that he’s rubbing his cock through her asscheeks, which he occasionally reaches down and pinches, looking into your eyes the entire time.");
				output("\n\nWithin a minute, the miscreant stops teasing his girl’s ass; he holds steady for a few seconds, lingering on your reaction, and then pushes forward. The girl’s face tightens - he just slipped inside, and judging from the angle of her body, <i>not</i> into the front door. Your ");
				if(pc.hasCock()) output("[pc.cocksLight]");
				else output("[pc.vagOrAss]");
				output(" throb");
				if(pc.cockTotal() == 1) output("s");
				output(" with envy, watching the slip of a girl take his impressive cock, and your orgasm draws closer under the dull throb of your malfunctioning feedback system.");

				output("\n\nYour showman gets into the fuck quickly, as excited by your distress as you are from his exhibition. A few murmurs ring the crowd, now, and by them you know that you’re no longer the only focus of attention. The girl hears as well. Her eyebrows knit in frustration but just as quickly she relaxes again, unable and apparently unwilling to end the spectacle. A hand appears under her arm; her lover slides into her top, groping her flat chest and tweaking her nipple as he uses the leverage to pull her asshole onto his cock even harder. A breath catches in her throat, and her hand clasps over his.");

				output("\n\nDespite having the attention of at least half of the crowd by now, the young man’s eyes never break with yours. He studies you keenly, watching the quivering wreck that is your near-climax body. Almost hypnotized, you stare back, watching him and his girl until your hips are shaking in unison with ");
				if(pc.hasCock()) output("his");
				else output("hers");
				output(". Your sex burns with lust to see them, aching for release, and he can see it in your eyes. His other, idle hand appears from behind the girl, pointing at the front of her skirt and drawing your attention down to it; eyes closed and oblivious, she never notices. When you look down, he grabs the frilly hem and flips it up suddenly, exposing her... instead of a pussy, a small, erect penis greets you! It’s no more than four inches and even though fully hard, the red crown barely peeks out from the foreskin. Pert balls cling tightly to the shaft and the whole package is tied with a decorative ribbon of pink lace. A thick line of pre-cum is dangling from the phimosis penis, pushed out by the prostate stimulation its owner is receiving. The ‘girl’ gasps and her eyes flutter open as the breeze hits her cock; the gaze of the crowd brings her blush back and she shuts her eyes tightly again in embarrassment... but her cockhead peeks out a little further from her foreskin, and drools a little more.");

				output("\n\nThe spectacle is too much; you cum. ");

				if(pc.hasCock()) 
				{
					output("[pc.Cum] ");
					if(pc.cumQ() < 5) output("trickles");
					else if(pc.cumQ() < 200) output("spurts");
					else output("floods");
					output(" from you, soaking your [pc.lowerUndergarment]");
					if(pc.isCrotchExposedByArmor()) output(" and beading through the fabric for anyone to see");
					output(". ");
				}
				else if(pc.hasVagina())
				{
					output("[pc.GirlCum] soaks your [pc.lowerUndergarment], darkening it with [pc.girlCumVisc] juice");
					//(no outer lower)
					if(pc.isCrotchExposedByArmor()) output(" and creating a wet spot for anyone to see");
					output(". ");
				}
				else output(" Your asshole twitches and shakes in lonely frustration, neatly stimulated by your malfunctioning projector but missing the wet, pre-squirting prick that the trap across from you is enjoying.");

				output("\n\nWatching you climax seems to excite your tormentor to his own limit, and he buries his cock in the ass of his companion. Her face twitches as his hot load hits her insides, and a moment later, her cock lances out its own modest spurt of jizz. The string flies through the air and ");
				if(pc.libido() < 50) output("lands less than an inch from your crotch");
				else output("would have landed an inch away, but you thrust out your hand and catch the femboy’s load. She looks aroused and embarrassed, casting her eyes to the side");
				output(". With the spectacle winding down, the crowd fencing you in begins to disperse, leaving you three cum-spattered exhibitionists to recover yourselves in full view of the greater public.");
				if(pc.exhibitionism() < 50) output(" You do so as quickly as you can, but still catch a fair number of scandalized looks");
				else output(" You take your time, soaking up the scandalized looks");
				output(" - of course, not as many as the young man with his cock pushed so deep into his ‘girl’friend’s cum-soaked prostate that her prick leaks a line of sperm down to the ground. <b>If you don’t want to be caught out like this again, you should find someone to fix your malfunctioning hardlight - or go commando.</b>");
				//end of hi-lust, public, boy ver.
				processTime(15);
				pc.orgasm();
			}
			pc.exhibitionism(2);
		}
		//if not in public /or/ if wearing airtight
		if(!rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) || pc.hasAirtightSuit())
		{
			if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC))
			{
				output("\n\nThough your sudden collapse draws some attention, your [pc.armor] covers your lewd display. A few people stop and lean down to check on you, but their eyes show only concern - not one recognizes your jerks and shakes as the public indecency they are. ");
				//(end public blurb after paragraph break)
			}
			else output("\n\n");
			output(" All by your lonesome, you fill your [pc.lowerUndergarment] with ");
			if(pc.hasCock()) 
			{
				output("[pc.cum]. ");
				if(pc.cumQ() < 5) output("Sad little squirts droop from your trembling member, barely enough to wet the fabric but all that your body can muster.");
				else if(pc.cumQ() < 1000)
				{
					output("Spurts of spunk fly from your cock");
					if(pc.cockTotal() > 1) output("s");
					output(", turning your lower half into a warm, [pc.cumVisc] mess.");
				}
				//(mega cum)
				else
				{
					output("Your monster load distends your urethra");
					if(pc.cockTotal() > 1) output("s");
					output(" to escape, turning your underpants into a mere suggestion as it washes your lower half in [pc.cumColor].");
					if(pc.hasAirtightSuit()) 
					{
						output(" With nowhere to go in your airtight armor, the spunk builds up and up, flooding your suit until you");
						if(!(pc.upperUndergarment is EmptySlot)) output("r [pc.upperUndergarment] is as soaked as your bottoms and you");
						output(" could stick out your tongue and taste a [pc.cumFlavor] sample.");
					}
				}
			}
			//(vag, no cock)
			else if(pc.hasVagina())
			{
				output("[pc.girlCum]. Your pussy twitches and squeezes, expecting by the shape of the stimulation to find something hard, but comes down on nothing.");
				if(!pc.isSquirter()) output(" With no real cock to stop your feminine juices, you turn the seat of your underwear to a slippery, clingy mess.");
				else output(" With no real cock in the way, your pussy-juice soaks your [pc.lowerUndergarment] until it can’t hold any more, then begins to run down your [pc.thigh].");
			}
			else
			{
				output("sweat as your [pc.asshole] tensions and releases rapidly in climax. Without any actual tool to stroke, your pucker simply gulps air, trying to lock down on the phantom stimulation.");
				//(anal wet)
				if(pc.ass.wetness() > 0) output(" Lubrication flows from your ever-ready ass, wicking into your [pc.lowerUndergarment].");
			}
			output("\n\nYou cum out aftershocks for a few minutes more - at some point in the haze, the feedback from your hardlight shuts off, leaving you thankfully able to recover. <b>Unless you want this to happen again, you should get your hardlight underwear fixed or wear something else.</b>");
			//end of hi-lust non-public ver.
			processTime(15);
			pc.orgasm();
		}
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function processHLPantyShit():void
{
	if(pc.hasHardLightEquipped() && pc.hasHardLightUpgraded())
	{
		//Set timer and check for breakage.
		if(flags["ALISS_FIXED_HL"] == undefined)
		{
			
			if(flags["HL_BREAK_COUNTER"] == undefined) flags["HL_BREAK_COUNTER"] = GetGameTimestamp();
			else if(flags["HL_BREAK_COUNTER"] + 28800 < GetGameTimestamp()) flags["ALISS_FIXED_HL"] = -1;
		}
		//Broken!
		else if(flags["ALISS_FIXED_HL"] == -1)
		{
			if(rooms[currentLocation].hasFlag(GLOBAL.NOFAP) || rooms[currentLocation].hasFlag(GLOBAL.FAPPING_ILLEGAL)) return;
			if(rand(25) == 0 && !pc.hasStatusEffect("PANTYBREAK_CD")) 
			{
				pc.createStatusEffect("PANTYBREAK_CD", 0, 0, 0, 0, true, "", "", false, 48*60);
				eventQueue.push(lustOvahTimeEvent);
			}
		}
	}
}

//repair talk (bonus Aliss sex scene abandoned for now as lust event came in over budget)
//Aliss
//shove a button in her menu somewhere
//tooltip: Show Aliss the malfunctioning mod on your hardlight and see if she can fix it.
//tooltip disabled, not wearing or carrying a broken hardlight: You don’t have a broken hardlight projector anywhere on your person!

public function alissBreakItTalk():void
{
	clearOutput();
	showAliss();
	output("You motion Aliss closer.");
	output("\n\n<i>“Yeah?”</i> she asks, leaning in conspiratorially.");
	output("\n\n<i>“Could you make my hardlight malfunction again? Like before?”</i> You try hard not to blush. <i>“It was... fun.”</i>");
	output("\n\nAliss’s eyerows rise with interest. <i>“Really?”</i> She takes the underwear from you when you offer it, a sly smile on her reptilian face. <i>“It’ll be my... our pleasure.”</i> She winks and disappears into a back room.\n\nWhen she reappears, she’s smiling mischievously, panties in hand. <i>“I should probably charge for this, but it’s just too much fun.”</i>");
	output("\n\nThe ovir hands over your underwear.");
	flags["ALISS_FIXED_HL"] = -1;
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function alissRepairTalk():void
{
	clearOutput();
	showAliss();
	author("Zeikfried");
	output("You motion Aliss closer.");
	output("\n\n<i>“Yeah?”</i> she asks, leaning in conspiratorially.");
	output("\n\n");
	if(pc.isBimbo()) output("<i>“Um, can you do repairs on a broken projector? It’s a little </i>too<i> fun,”</i> you whisper.");
	else if(pc.isBro()) output("<i>“I fucked my hardlight up,”</i> you say frankly.");
	else output("<i>“My hardlight projector is malfunctioning,”</i> you whisper.");

	output("\n\nAliss’s eyerows rise with interest. <i>“How so?”</i>");
	output("\n\nYou give her a description of your ‘problem’, which, despite your best efforts to downplay the spectacle, makes her burst out in tinkly laughter.");
	output("\n\n<i>“We can take a look. Do you have them with you?”</i> she finally answers, after giggling her fill.");

	output("\n\nYou produce the hardlight mods from your pack; Aliss takes them and disappears into a back room.");
	
	//if first time, pass ~90 minutes
	processTime(90);
	clearMenu();
	addButton(0,"Next",alissRepairPart2);
}

public function alissRepairPart2():void
{
	clearOutput();
	showAliss();
	output("For 90 minutes, you wait. Finally, Aliss reappears.");
	output("\n\n<i>“Well?”</i> you ask.");
	output("\n\n<i>“It’s the aftermarket mod you added, of course. We repaired the problem, so it should be good to go.”</i>");
	//(else if Fen decides that the malfunction can reoccur), but there’s no way to completely prevent it from breaking again without removing the upgrade.”</i>");

	if(flags["ALISS_FIXED_HL_COUNT"] == undefined)
	{
		output("\n\n<i>“So what took so long?”</i> you reply.");
		output("\n\nAliss shrugs. <i>“Ah, that... we were copying the design. I think we might be able to make something like it here - buyer beware, of course.”</i> The ovir looks down at your crotch, then winks at you and hands over your underwear.");
	}
	//(else repeat)
	else output("\n\nThe ovir hands over your underwear.");
	IncrementFlag("ALISS_FIXED_HL_COUNT");
	flags["ALISS_FIXED_HL"] = 1;
	//if first time repair, either directly unlock the upgraded version of each hardlight panties or add the upgrade kit in Aliss’s shop
	//tooltip: Take your repaired [pc.lowerUndergarment] and leave.
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function alissPresentForThirdsBday2019():void
{
	clearOutput();
	showAliss(true);
	author("Fenoxo");
	var x:int = pc.biggestCockIndex();
	output("You tell Aliss what you want.");
	output("\n\n<i>“Really?”</i> Aliss twirls a pair of panties around her fingertip, a slow smile spreading across her scaled features. <i>“I didn’t take you for that type, Mi Amour.”</i> Hesitance forgotten, the cock-toting ovir steps closer, the slight scent of her lingering body soap warring with potent hint of sexuality that wafts from the engorging shaft between her thighs. She leans forward, presenting you with the sight of her ample bosom. Her breasts heave with lascivious excitement. <i>“I didn’t think my little show would... coerce you into such depravity.”</i>");
	output("\n\nYou do not resist as her nimble fingers come to rest on your [pc.chest], nor when they pause to fondle one [pc.nipple]. The whispering sigh that slips your [pc.lipsChaste] is tacit admission of just how turned on you are - so turned on that when you slide to the floor, all you’re aware of is how hard you’re throbbing. Your [pc.cock " + x + "] juts upward in rigid declaration of your ovir-inspired ardor. It quivers with unbridled anticipation, though judging by the dangling panties, its bridle is about to be affixed.");
	output("\n\nAliss smiles sweetly, easing one thigh over [pc.legOrLegs] at a time. Her own prick, you note, is equally erect, almost distended with the force of the passion coursing through it. It bobs and dips to the beat of her heart. When she shifts a little closer, that heaving, blunt-headed monster rubs against your own, lighting off starbursts of pleasure all over the formerly untouched length. <i>“Oh myyy,”</i> the ovir husks. <i>“I needed this.”</i> Twirling a pair of panties around one finger, she leans down low for you to feel her breath on your neck. Her slitted eyes search your own. <i>“We both did.”</i>");
	output("\n\nYou agree wholeheartedly.");
	output("\n\nWhen the sensuous shopkeep deftly wraps the silky underthings against your paired pricks, you find yourself immensely grateful to her, not just for the pleasure but for the way she muffles your resulting gasp with a fierce kiss. Her inhuman tongue slides over your [pc.lipsChaste] one at a time before sliding through to wrestle your own. As the muscles writhe together in passionate embrace, slender digits dance around your dong, surrounding it in layer after layer of satiny binding.");
	output("\n\nHer cock no longer simply brushes against your own. It’s practically welded to it such that you are acutely aware of how very pleasantly her every throb is transmitted through your sparking, over-eager nerves, and your phallic flesh quivers right back. Both dicks strain and squeeze against one another, flooding the inside of the swaddling underthings with heat and intensely virile musk. When Aliss spins the last free strap around one more time to tie into a delicate-looking bow, you moan into her mouth in pure, panty-bound pleasure.");
	output("\n\nBreaking the kiss, Aliss says only, <i>“Wow.”</i> Her cheeks flush purple.");
	//Light to no precummies
	if(pc.cumQ() < 150) output("\n\nInside the cloth cocoon, the panty-vendor’s prick shifts slightly against your own, leaving a patch of warm slickness in its wake for you to slip through. The resulting spike of pleasure sends blissful spasms through your [pc.cock " + x + "], driving you to slide through the moist patch and dive headlong into an even slipperier spot. Aliss’s blunt-tipped member leaks more pre-cum by the second, saturating not just the fabric wrapping but your [pc.dickSkin " + x + "] as well. Her phallic lubrication seeps <i>everywhere</i>, transforming the taut pouch of tied panties into a slick heaven for your pre-glazed schlongs.");
	//Good precummies
	else if(pc.cumQ() < 1000) output("\n\nInside the cloth cocoon, things get... syrupy. Instead of mere warmth and silken fabric, the distinct sensation of something wet and slick alerts you to the growing presence of pre-cum. It’s difficult to identify the responsible party, but who cares? Your [pc.cockNoun " + x + "] grows hotter thanks to the phallus-powered sauna of Aliss’s panties. Inside, your flesh must be glossy and dripping with combined pre-cum, and when you shift even the slightest amount, you’re rewarded with the heady buzz of low-friction genital-to-genital contact. You can detect a little of your own dribbling as you leaking your own additions to the ambrosial stew surrounding your veiny, pulsing flesh.");
	//Sopping precummies
	else output("\n\nInside the cloth cocoon, your prick goes to work doing what it always does when you’re this turned on: pumping out enough pre-cum to turn any hole, no matter how dry or unprepared, into a soaked, suckling fuck-channel. Aliss’s panties are no different. You impregnate the fabric with pre-spunk so thoroughly that fragrant dribbles emerge from the underside to stain your [pc.belly]. Inside, the twin tools swim through the soupy morass as they reflexively grind against one another, lighting up with the same sort of low-friction ecstasy you’d expect from an eager cunt - not frottage-binding underthings. In turn, you spew ever greater torrents of liquid excitement, raising the temperature and the sloppiness of your prick-to-prick affection to new heights of depravity.");
	//Mergywurgy
	output("\n\n<i>“Mi Amour!”</i> Aliss cries, beginning to scissor her hips back and forth, exposing the pre-glossed surface of her base a moment before slamming it back into the increasingly wet garment. <i>“You kinky beast!”</i> She giggles, her tail curling around to stroke your cheek. <i>“Talking me into soiling my inventory... and I don’t regret it at all.”</i> She’s openly frotting now, fucking the panties as much as grinding against your dick. After her first few strokes, she grabs the sticky mess with both hands and humps harder, focused entirely on the pleasure this unique activity can provide.");
	//Smaller
	if(pc.cocks[x].cLength() <= 11) 
	{
		output("\n\nYou join the rutting ovir without conscious thought. Lifting your [pc.ass] off the ground with the force of your strokes, you become quite aware at the difference in size between your members. Aliss packs those panties so much more than you ever could, and the added length allows her to ply you with longer, uninterrupted streaks of friction. Meanwhile, you’re reduced to quick humps and wriggles that take advantage of the alien beastprick’s superior size. Once you accept the difference and change your motions to support the well-endowed dick-girl instead of competing with her, everything becomes more pleasurable.");
		output("\n\nAliss’s cock smothers you with its size, heat, and wetness. Her veins, thick and pulsating, tickle your smaller [pc.cockHead " + x + "] on the way by. The sheer weight of her triumphant tool keeps you pinned in place but also maximizes the sensations of every little wiggle and squirm. You pant while she grinds herself off on your dick, barely able to keep yourself from shouting for joy at how wonderful it feels. Everything is just so warm and hot and wet and good...");
	}
	//Samish
	else if(pc.cocks[x].cLength() <= 15.5)
	{
		output("\n\nYou join the rutting ovir without conscious thought. Lifting your [pc.ass] off the ground with the force of your strokes, you answer hump for hump, accelerating the pace at which the turgid, veiny flesh slides past. Your matching lengths make it easy to slide into a steady rhythm with the giggling shopkeeper. Squelches and excited pants fill the air as you pump away at each other, fully saturating the garment in prickscent and pre alike. Words seem unnecessary by this point. Looking Aliss in the eyes, you moan back as the gyrations and slick, hot, tunnel work to overwhelm you with pleasure. There’s no resisting something that feels this good.");
	}
	//Bigger
	else
	{
		output("\n\nYou join the rutting ovir without conscious thought. Lifting your [pc.ass] off the ground with the force of your strokes, you become instantly and powerfully aware of just how much bigger you are than her. Aliss’s dick is great - with its short, back-and-forth motions, but when you move, dragging your [pc.cockHead " + x + "] from far above the ovir’s all the way down to her sensitive base, it’s one continuous, uninterrupted smear of ecstasy. When you thrust back inside, you do so with authority, pleasuring her so thoroughly that she stops trying to move herself and simply rests herself atop you, wiggling back and forth to tease you to new heights panty-bulging rut.");
		output("\n\nAn assertive, jackhammer-like stroke blasts your [pc.cockHead " + x + "] right through the pretty little bow Aliss had tied on top, but the smooth-scaled slut’s hands are right there to shift the wrap around and smother your sensitive apex in tantalizingly slick fabric once more. Still gripping the bundle, she strokes you as you hump, her tongue lolling out when the heat and bound-up eroticism threaten to overwhelm her, and you know just how she feels. With the bindings on your huge cock tightened, it becomes impossible to hold yourself any longer.");
	}
	//merge Cummies time!
	output("\n\nYou cum a second after gasping a warning. Your phallic flesh strains");
	if(pc.hasCocks()) 
	{
		output(", unbound dick" + (pc.cockTotal() > 2 ? "s":"") + " jerking and spraying ");
		if(pc.cocks[x].cLength() < 12) output("onto your [pc.chest]");
		else if(pc.cocks[x].cLength() < 24) output("onto your [pc.face]");
		else output("over your shoulder and into the wall");
	}
	output(".");
	if(pc.cumQ() < 150) output(" [pc.Cum] spurts and sputters into sweltering bindings, making them slicker and hotter on your skin. Aliss must feel it, because a moment after releasing your own load, she joins you in erupting, disgorging inhumanly thick pulsations of virile alien cream all over your [pc.cockNoun " + x + "]. It feels like she’s drowning you in cum, slowly but surely bathing your entire length in the heat of her now-released orgasm.");
	else if(pc.cumQ() < 3500) output(" [pc.Cum] shoots in long, lurid flows directly into the sweltering bindings, rendering them slicker and hotter while simultaneously bathing Aliss’s tool in your virile bliss. She reacts by throwing back her head and screaming, the flare of her dick opening wide in time to shoot out a load of her own. Spunk swirls and blends around your taut, flexing shafts, thickening by the second. Fat droplets spill out onto your conjoined bases as the internal pressure slowly pries apart the panties, allowing the fragrant double-load to dump itself onto your [pc.belly].");
	else 
	{
		output(" [pc.CumNoun] erupts in a single panty-flooding column, blasting into the sodden undies like a broken fire hydrant. Potent seed swirls around the paired penises forcefully enough to coax Aliss to unleash her own torrid contributions. Truth be told, her spunk barely registers against the swirling vortex of your own seed. Each garment-ballooning ejaculation strains the seams and sprays rivers of [pc.cumVisc] backwash down your thighs, though it’s hardly enough to ease the pressure upon your hypersensitive shaft. All that packed-in spooge squeezes you tighter than a virgin’s pussy, in turn triggering you to cum all the harder, spurting and spraying until one end blows open to release a coursing waterfall of warm jism.");
	}
	output("\n\nSighing in delight and shuddering with aftershocks of sensation, Aliss slowly - and very, very carefully - withdraws her [pc.cumColor]-stained dick free of the ruined undergarment. Dribbles of excess hang from her still-flared tip, and as you watch, her urethra opens, leaking one last, pearly drop.");
	output("\n\n<i>“Ohh, Mi Amour...”</i> Aliss murmurs, peeling what’s left of the underwear from your orgasm-sensitized member. It’s a flimsy mess, and unwrapping it releases the combined scents of fifteen minutes worth of solid fucking. <i>“They’re ruined.”</i> She flings the sticky mess into a bin and fetches a towel to mop the worst from her scales. <i>“But I can’t say it wasn’t worth it. I just can’t let you talk me into this too often, or you’ll put me out of business. Won’t you?”</i>");
	output("\n\nOne well-thrown towel hits you in the face when you go to nod, and by the time you pull it off and start to wipe off, Aliss has already seen herself out.");
	processTime(25);
	pc.orgasm();
	fuckedAliss();
	chars["ALISS"].orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}