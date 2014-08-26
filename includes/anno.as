import classes.Items.Guns.Goovolver;
import classes.Items.Miscellaneous.GrayMicrobots;
//Steele Tech Shop (Tarkus)
//Dogsloots 'r' Us

// DECK13 Flags
// DECK13_GRAY_PRIME_DECISION: PC choice on how to resolve Gray Prime shit. Undefined == not happend, 1 == Give Cyberware, 2 == Wipe Bots, 3 == Fought
// ANNO_MISSION_OFFER: Stage of the Deck 13 quest. Undefined == Not started, 1 == Offered, 2 == In progress (Actually on Deck13), 3 == Gray Prime resolved

function annoSexed(arg:int = 0):int {
	if(flags["ANNO_SEXED"] == undefined) flags["ANNO_SEXED"] = 0;
	if(arg != 0) flags["ANNO_SEXED"] += arg;
	return flags["ANNO_SEXED"];
}

function steeleTechTarkusShopAvailable():Boolean
{
	if (flags["ANNOS_SHOP_CLOSED"] == undefined || flags["ANNOS_SHOP_CLOSED"] == 0) return true;
	if (flags["ANNO_CREWMEMBER"] == 1) return false;
	return false;
}

function steeleTechTarkusOutsideFunction():Boolean
{
	variableRoomUpdateCheck();
	if (steeleTechTarkusShopAvailable())
	{
		output("\n\nSet into the wall of the main corridor through the <i>Nova</i> is a smallish shop bearing your name: a neon \"Steele Tech\" sign hangs above the door, the last \"e\" on your name flickering pitifully every few moments. A dusty window set in side of the shop shows stacks of salvaged tech from the now-lost wastelands: mostly old machine parts, though there are a few weapons and useful bits with glowing holographic price tags hovering over them.");
	}
	else
	{
		output("\n\nSet into the wall of the main corridor through the <i>Nova</i> is a smallish shop bearing your name: a broken neon \"Steele Tech\" sign hangs above the door, although it's usual garish glow is absent, having been turned off. A dusty window set in side of the shop shows stacks of salvaged tech from the now-lost wastelands, along with a much smaller sign in the door: \"CLOSED\".");
	}
	
	return false;
}

function steeleTechTarkusEntry():Boolean
{
	if (steeleTechTarkusShopAvailable())
	{
		return steeleTechBonusFunction();
	}
	else
	{
		clearOutput();
		output("<b>Steele Tech is currently closed. You'll have to come back later.</b>");
		clearMenu();
		addButton(0, "Next", move, "212");
		return true;
	}
}

//Outside Descriptor
//output("Set into the wall of the main corridor through the <i>Nova</i> is a smallish shop bearing your name: a neon \"Steele Tech\" hangs above the door, the last \"e\" on your name flickering pitifully every few moments. A dusty window into the shop shows stacks of salvaged tech from the wastes outside, mostly old machine parts, though there are a few weapons and useful bits with glowing holo-price tags hovering over them.");
function steeleTechBonusFunction():Boolean
{
	if(flags["TARKUS_DESTROYED"] != undefined)
	{
		return insideSteeleTechPostPlanetCrack();
	}
	//Inside Descriptor (First Time)
	if(flags["MET_ANNO"] == undefined)
	{
		output("The inside of the Steele Tech outpost is a cluttered mess of rusty alien technology stacked ten feet high. Pillars of engine parts and disassembled devices you can't identify reach to the ceiling, making the shop seem more like a storage room than a storefront. A snowy-haired ausar woman is moving between the stacks with a clipboard, apparently cataloguing some of the recent arrivals, clad in the skin-tight black and yellow uniform Dad issued a few years ago. It hugs her curves nicely, even if her bushy white tail is hiding her backside from view.");
		//[Ausar]
		addButton(0,"Ausar",meetingAnno);
	}
	//Inside Descriptor (Has met Anno)
	else
	{
		output("The inside of the Steele Tech outpost is a cluttered mess of rusty alien technology stacked ten feet high. Pillars of engine parts and disassembled devices you can't identify reach to the ceiling, making the shop seem more like a storage room than a storefront. Anno is sitting behind the counter, working on some paperwork. She smiles slightly at you. <i>\"Hey, boss. What's up?\"</i>");
		//[Anno]
		addButton(0,"Anno",repeatAnnoApproach);
	}
	return false;
}

//[Ausar] (Meeting Anno)
function meetingAnno():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	flags["MET_ANNO"] = 1;
	output("You step up to the ausar woman, clearing your throat to get her attention. She looks up, eyeing you up and down before returning her attention to her data slate. <i>\"Good ");
	if(hours < 12) output("Morning");
	else if(hours < 18) output("Afternoon");
	else output("Evening");
	output(", " + pc.mf("Mr.","Ms.") + " Steele,\"</i> she says simply, poking at what looks like an engine block with her stylus. <i>\"Welcome to Tarkus. Anything I can help you with?\"</i>");
	output("\n\n<i>\"You know who I am?\"</i>");
	output("\n\nShe glances up at you and nods. <i>\"Sure! Victor used to talk about you all the time. Plus, I can </i>smell<i> the family resemblance,\"</i> she adds, her cute little nose twitching.");
	output("\n\n<i>\"Oh, by the way: we all got the memo after Victor passed on. I can give you a fair discount on our public inventory, but otherwise we're to treat you just like anyone else until otherwise notified.\"</i>");
	output("\n\nShe hesitates a moment before tucking the pad under her arm and putting a surprisingly familiar hand on your shoulder. <i>\"Sorry about your old man, by the way. The 'verse is a lesser place without him. The name's Anno, by the way,\"</i> she says, extending a fluffy hand to you. <i>\"Anno Dorna. Planetary manager for the company here.\"</i>");
	//First Time Talk Options
	processTime(2);
	firstTimeAnnoTalks();
}

//[Memo]
function annosMemo():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	output("<i>\"What's this about a memo?\"</i>");
	output("\n\nShe shrugs. <i>\"Right before Victor died, he sent out a company-wide message. Told us to operate independently for the time being, and not to treat you too special. I guess you're not the CEO just yet?\"</i>");
	output("\n\nThat's an understatement.");
	output("\n\n<i>\"Don't worry, I'm sure you'll take the xathas by the reins before too long. You look like the kind of " + pc.mf("guy","girl") + " who could manage the company, if I'm any judge.\"</i>");
	flags["ANNO_TALKED_ABOUT_THE_MEMO"] = 1;
	processTime(5);
	firstTimeAnnoTalks();
}

//[Knew my Dad?]
function didAnnoyKnowYourDad():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	output("<i>\"Did you know my Dad?\"</i> you ask. The way she was talking about him, after all...");
	output("\n\nThe ausar grins and nods. <i>\"You could say that...\"</i> she says cheekily.");
	output("\n\nOh, <i>EEEEWWWWWW!</i>");
	output("\n\nShe snickers, covering her mouth. <i>\"Sorry, sorry. But yeah, I did. Met him at a theoretical physics conference about three years back. I was doing a presentation on warp gate theory, and Victor was out in the audience, I guess. Afterwards, he pulled me aside and asked if I wanted a job. I worked in Steele's R&D for a couple years, before he picked me to lead our team here to Tarkus, right before he died. I didn't know him, uh, </i>personally<i> for very long, but he was a good man. Very kind.\"</i>");
	//If PC is male:
	if(pc.hasCock())
	{
		output("\n\nAnno turns to you, chewing the tips of her stylus as she regards you again. <i>\"You've got a big pair of shoes to fill, " + pc.mf("Mr.","Mrs.") + " Steele, but ");
		//if small dick:
		if(pc.biggestCockVolume() < 150) output("I think, with a lot of work and skill, you might just be able to fill them.");
		//if PC has a big dick: 
		else if(pc.biggestCockVolume() <= 1000) output("I think you'll make Victor proud.");
		else output("a guy like you might just surpass him. I've got a good feeling about you!");
		output("\"</i> But that's just my two creds.");
	}
	//If PC is female:
	else
	{
		output("\n\nAnno turns to you, chewing the tips of her stylus as she regards you again. <i>\"For what it's worth, I think Steele Tech could use a woman's touch. ");
		//if PC has small tits:
		if(pc.biggestTitSize() < 4) output("Put a lot of elbow grease into it, and I think you're just the kind of gal we need to get back on track!");
		else if(pc.biggestTitSize() < 10) output("You look like you have what it takes to fill your dad's shoes, if you don't mind me saying so.");
		else output("You've definitely got what it takes to lead, though. I can see it a mile away, Ms. Steele.");
		output("\"</i>");
	}
	processTime(5);
	flags["ANNO_TALKED_ABOUT_YOUR_DAD"] = 1;
	firstTimeAnnoTalks();
}

function firstTimeAnnoTalks():void
{
	clearMenu();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	if(flags["ANNO_TALKED_ABOUT_THE_MEMO"] == undefined) addButton(0,"Memo",annosMemo,undefined,"Memo","What's up with the memo that went out.");
	else addDisabledButton(0,"Memo","Memo","You already had this discussion.");

	if(flags["ANNO_TALKED_ABOUT_YOUR_DAD"] == undefined) addButton(1,"Knew Dad?",didAnnoyKnowYourDad,undefined,"Knew Dad?","Ask her what she knows about your father.");
	else addDisabledButton(1,"Knew Dad?","Knew Dad?","You already had this discussion.");
	
	addButton(4,"Discount",soAboutDatDiscountSlut,undefined,"Discount","Skip all the small talk and get to the shopping.");
	
}

//[Discount?]
function soAboutDatDiscountSlut():void
{
	shopkeep = chars["ANNO"];
	chars["ANNO"].keeperBuy = "<i>\"So, about that discount...\"</i>\n\n<i>\"Of course. Right this way, " + pc.mf("Mr.","Ms") + " Steele,\"</i> Anno says, guiding you to the register.\n";
	//[Shop Menu Here]
	buyItem();
}

//Repeat Encounters
function repeatAnnoApproach():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	//{If not sex'd yet:}
	if(annoSexed() == 0)
	{
		output("Anno looks up from her data slate as you approach her. <i>\"Hey, boss! What's up?\"</i>");
	}
	//{if Sex'd:}
	else
	{
		output("Anno rests her chin in her hand, still leaning over the counter to give you a nice look down the half-zipped front of her uniform. <i>\"Hey, sexy. Come back to see lil' old me? Or did you have something else in mind...\"</i>");
	}
	annoMainMenu();
}

function annoMainMenu():void
{
	//[Buy] [Sell] [Talk] [Repair Gear] [Ear Scratches]
	clearMenu()
	annoShopSetup();
	addButton(0,"Buy",buyFromDatDogslut,undefined,"Buy","See what Anno has for sale.");
	addButton(1,"Sell",sellItem,undefined,"Sell","See if you can sell any of your carried items to Anno.");
	addButton(2,"Talk",annoTalkMenu,undefined,"Talk","Talk to Anno about a variety of topics.");
	addButton(3,"EarScratches",earScritchesForAnno,undefined,"Ear Scratches","Give her a good scratching right behind the ears. She's been a good girl, after all.");
	addButton(5,"Appearance",annoAppearance,undefined,"Appearance","Review what Anno's entire body looks like.");
	if(pc.hasStatusEffect("Rusted Emitters")) addButton(4,"Fix Emit.",repairMyRustBroInjuryAnno,undefined,"Fix Emit.","See if Anno can possibly fix your sydian-damaged shield emitters.");
	else addDisabledButton(4,"Fix Emit.","Fix Emit.","Your shield emitters are totally undamaged. Don't worry about it.");
	if(flags["SEEN_ANNO_BUY_MENU"] != undefined) addButton(4,"Test Drive",testDriveArmorsForShit);
	addButton(14,"Leave",mainGameMenu);
}


//Buy
function buyFromDatDogslut():void
{
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	shopkeep = chars["ANNO"];
	if(flags["SEEN_ANNO_BUY_MENU"] == undefined)
	{
		flags["SEEN_ANNO_BUY_MENU"] = 1;
		chars["ANNO"].keeperBuy = "<i>\"Wanna take a look through the catalogue?\"</i> Anno says hopefully. <i>\"We mostly do business with rushers and pioneers coming through, so I've got some pretty decent weapons and armor in stock. Even some military grade stuff, which I'm pretty sure you're allowed to buy. Plus, plenty of junk I've managed to repair or repurpose from the wasteland. Here, let me pull up the inventory for you.\"</i>\n\nA holographic display pops to life between you, listing the Steele Tech shop's goods.";
	}
	else annoShopSetup();
	buyItem();
}
function annoShopSetup():void
{
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	shopkeep = chars["ANNO"];
	if(flags["TARKUS_DESTROYED"] != undefined)
	{
		//{First Time}
		chars["ANNO"].keeperBuy = "<i>\"Wanna take a look through the catalogue?\"</i> Anno says hopefully. <i>\"Not a lot of business to work with after the planet blew, so I've got some pretty decent weapons and armor in stock. Even some military-grade stuff, which I'm pretty sure you're allowed to buy. Plus, plenty of junk I've managed to repair or repurpose from the wasteland. Here, let me pull up the inventory for you.\"</i>\n\nA holographic display pops to life between you, listing the Steele Tech shop's goods.";
	}
	else chars["ANNO"].keeperBuy = "<i>\"Wanna take a look through the catalogue? Victor said I could give you a pretty nice discount.\"</i>\n";
	//List prices and whatnot. Back should go back to Jade's main menu.
	//Sell Menu
	chars["ANNO"].keeperSell = "<i>\"Got a little something weighing you down? I'm sure I can take a load off you!\"</i> she chuckles as you sort through your sellable gear.\n";
	chars["ANNO"].keeperGreeting = "Anno shrugs. <i>\"Well, how can I help you, boss?\"</i>\n";
}

//Test Drive
function testDriveArmorsForShit():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	output("<i>\"Nice hardware,\"</i> you surmise, looking through the weapons and armor on display. <i>\"Hard to choose just from the tooltips, though...\"</i>");
	output("\n\nAnno's eyes light up before you've even finished speaking. <i>\"Want to see my goods in action, do you? Well, for you, I think I might be able to work something out. Follow me.\"</i>");
	output("\n\nAnno crooks a finger invitingly before disappearing into the back of the shop. You dutifully follow her through a long corridor behind the shop, then down a flight of stairs and into the belly of the old ship. ");
	//First time:
	if(flags["ANNO_TEST_DROVE"] == undefined) output("As you walk, Anno explains, <i>\"Novahome is terrible for storage. I ended up having to take up a small secondary crew lounge to store the shop's inventory. Lucky me it happened to make a pretty decent place for me to bunk up, and to, uh, test drive some of the merchandise. I even found some target dummies!\"</i>\n\nA moment later, you come to a wide open chamber stacked ceiling-high with crates full of a seemingly random assortment of space junk and sealed crates from the Core. In the center of the chamber is an almost comically out of place living room setup, complete with couch, coffee table, and holoscreen.");
	else output("Anno leads you back down into the belly of the ship, to her strange little living room surrounded by cargo and guns.");
	output(" She beckons you to sit as she wanders over to a crate, seemingly at random, and cracks it open with a nearby crowbar.");
	output("\n\n<i>\"Here we go... yeah, this should be fun,\"</i> she says, pulling out an armload of firearms and dropping them onto the coffee table with a loud, echoing clatter that makes your teeth ache. With a grin, she prances off down another corridor leading off from the chamber, and returns with a pair of dummies under each arm, both with several bullet holes and scorch marks across their bodies. <i>\"[pc.name], meet Bob and Bobber. They're going to be showing us why we wear shield belts and armor these days, aren't you, boys?\"</i>");
	output("\n\nShe bobs their heads in a mock-nod before setting them up at the end of the corridor and beckoning you and the stack of guns over.");
	output("\n\nAnno grabs one of the guns, a heavy wood-and-polymer rig with a stock and oversized magazine. <i>\"Let me introduce you to the Hammer Carbine. We all know the good old Hammer pistol - you see it in the holos all the time. Sturdy, tough, reliable. Jams less than a retired rocker on painkillers.\"</i>");
	output("\n\nShe racks the slide and puts the stock to her shoulder. <i>\"Well, the Hammer Carbine is like that, but with a bigger magazine, an integrated three-round burst, and enhanced optics. To wit:\"</i> she pulses the trigger twice in quick succession, firing a deafening burst of lead down range, which quickly vaporizes Bob(ber?)'s head, leaving little but shrapnel. She spins the gun on her finger and collapses the stock. <i>\"Three rounds of ten-millimeter hollowpoint, all in the ten-ring. Recoil's a bit of a pain, so make sure you use the stock, or you won't be fapping for a while.\"</i>");
	output("\n\n<i>\"Ouch,\"</i> you laugh, taking the weapon from her.");
	output("\n\n<i>\"Let's see... oh, my favorite, the Reaper,\"</i> she says, picking up a sleek black gun you've seen in just about every action holo and shooter game since you were a kid. <i>\"Reaper mark five laser carbine. Deadly accurate to medium range, more powerful than your average laser firearm, and comes standard-equipped with an integrated holographic sight and heads-up display.\"</i>");
	output("\n\nAnno presses a button on the weapon's side, and a faintly-glowing holo-display pops up over the rifle's barrel and to the side of the trigger. She spends a moment pointing out battery capacity indicators, maps, and wireless uplinks built into the rifle before bringing it up to her shoulder and sighting it on one of the dummies through the holographic scope. <i>\"The big leg up with a laser rifle is that there's no recoil. This baby's got a scope, a foregrip, and a high-power-no-kick shot on semi-automatic. It's standard issue to Terran marines and Confederate Peacekeepers, not to mention seeing wide use with local law-enforcement and planetary militaries. 'The Battle Rifle of the Confederacy,' they call it.\"</i>");
	output("\n\nShe fires six shots back to back, each quick and quiet, barely moving the weapon with each pull of the trigger. When she's finished, Bob the Second is looking worse for wear: six clean holes right through his chest in a tight Star of David pattern no more than an inch across.");
	output("\n\n<i>\"Devastating to anything not smart enough to wear a shield,\"</i> she grins, setting the rifle down in exchange for a third gun, a big and bulky long gun.");
	output("\n\n<i>\"Last but not least, the darling of marksmen and assassins the galaxy over: the good old ZK rifle. Accurate enough out of the box, but more importantly, it uses an integrated rail accelerator to send a heavy round down range with enough force to punch through even light vehicle armor.\"</i> As she's speaking, Anno pulls a rifle scope from the gun pile and affixes it to the rail atop the ZK, quickly converting it to a marskman's rifle.");
	output("\n\n<i>\"What do you say to a little wager, boss? There's a third target hidden down at the end of the corridor: good old Bobbest. The best headshot wins, huh... and maybe if you can outshoot this old navy girl, I'll throw in a little something extra for you...\"</i> she says, slipping dangerously close to you, a hand coming to rest on your thigh, close enough to your groin that you gasp at her touch.");
	output("\n\n<i>\"Sound like fun?\"</i>");
	processTime(20);
	clearMenu();
	//addButton(0,"Yes",sureAnnoWeShotLetsFuck,undefined,"Yes","Yes, get some Anno.");
	addButton(0,"Yes",sureAnnoWeShotLetsFuck,undefined,"Yes","Shoot. Loser probably does something sexy for the winner.");
	addButton(1,"No",noAnnoSexPlz,undefined,"No","That's unprofessional!");
}

//No
function noAnnoSexPlz():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	output("<i>\"Not exactly professional,\"</i> you say, shaking your head.");
	output("\n\nAnno's lips twist into a pout. <i>\"Fiiine. You're the boss, I guess. C'mon, let's get back up to the shop.\"</i>");
	//{Return to shop}
	processTime(2);
	annoMainMenu();
}

//Sure
function sureAnnoWeShotLetsFuck():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	//Sure
	output("<i>\"Sounds good,\"</i> you say, stepping up to the range with her.\n\n<i>\"I'll go first,\"</i> Anno says, as she plants the rifle on a crate and takes a knee behind it. <i>\"Gotta set the bar high for you.\"</i>");
	output("\n\nYou nod and watch as the ausar girl adjusts her scope and fixes her sights on the target. She takes a long moment to set up her shot before you see her exhale deeply, finger moving down to the trigger.");
	//If repeat:
	if(flags["ANNO_SHOT_WITH"] != undefined) output(" Knowing that Anno's probably going to mess with you, this would be the ideal opportunity to return the favor!");
	processTime(1);
	clearMenu();
	addButton(0,"Watch",doNothingWhileAnnoShoots);
	if(flags["ANNO_SHOT_WITH"] != undefined) addButton(1,"GropeHer",gropeAnnoShoots);
}

//Do Nothing
function doNothingWhileAnnoShoots():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	output("You stand back and watch as Anno squeezes the trigger. A loud crack echoes through the room as she sends a heavy lead package down range, slamming into the target dummy. She pumps her fist excitedly, handing the rifle over to you. <i>\"Score! Try and top that, boss!\"</i>");
	output("\n\nYou peek through the scope, and see Anno's scored a pretty good shot: right through the bridge of the nose. That'll be hard to top, though you could plant a round right in the forehead if your aim is true...");
	processTime(2);
	clearMenu();
	addButton(0,"Next",takeYourShot)
}

//Grope Her
//Requires shot with her before.
function gropeAnnoShoots():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	//{2nd time +; tiny Mischievous bump?}
	output("You're not going to let Anno get the better of you this time... at least not without returning the favor. As Anno's lining up her shot, you slip behind the bent-over ausar and grab a handful of her ass, squeezing hard enough to make her yelp.");
	output("\n\n<i>\"Hey! W-what're you...\"</i> she snaps, her voice turning into a low mewl as you grope and squeeze her butt, working your hand up around the base of her bushy white tail. Her leg twitches visibly as you stroke her tail, fingers running through the soft fur before trailing down between her now limply spread legs. You slip a pair of fingers down through her groin, pushing up through the sheer material of her catsuit uniform until you feel the hot ridges of her cunt, already moist with sudden excitement at your unexpected touch.");
	output("\n\n<i>\"You're gonna mess up my shot,\"</i> she whines, though you don't hear anything but arousal in her voice as you finger her through her uniform. After a few seconds of searching, you find your prize: the tiny bump of her clitoral hood, just poking out against the uniform as you turn the horny ausar more and more on. When you brush it, she lets out a pitiful whimper of pleasure, and her finger slips - right on the trigger. You both wince as the sniper rifle fires and Annos sends a heavy lead package down range, slamming into the target dummy.");
	output("\n\nShe pouts, looking back through the scope. <i>\"Still a headshot, but... well, at least you've got a chance now, right boss?\"</i>");
	output("\n\nAnd, leering, she adds, <i>\"Don't worry, I'll be sure to get you back for that!\"</i>");
	output("\n\nYou grab the rifle and peek through the scope, and see Anno's scored a decent shot, though her aim clearly wandered while you were molesting her: she landed a hit right through the cheek. Still a hit, though you could plant a round right in the forehead if your aim is true....");
	pc.lust(3);
	processTime(3);
	clearMenu();
	addButton(0,"Next",takeYourShot,true)
}

//Take Your Shot!
// PC has to make a Ranged Attack Roll, just like in Syri's game, though with a nasty penalty thanks to Anno's ministrations.
function takeYourShot(easy:Boolean = false):void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	output("Rifle in hand, you crouch down and lay the barrel on the crate for stability, adjusting your sights as you start to line up your shot. A few tweaks of the scope, and the dummy's head comes into focus.");
	output("\n\nBefore you can squeeze the trigger, your body suddenly convulses as a hand grabs your [pc.butt], squeezing hard. You shoot a glance over your shoulder to see Anno nonchalantly grabbing your ass, grinning at you. <i>\"C'mon, boss, don't keep me waiting.\"</i>");
	output("\n\nYou're about to respond when her hand slips lower, fingers brushing across your [pc.groin]");
	if(pc.isCrotchGarbed()) output(" through your [pc.lowerGarment]");
	output(". You shudder, feeling a sudden heat rushing up through your loins as the ausar gropes you, clearly trying to mess with your marksmanship. You try and concentrate on the target, but every time you think you have a it, Anno changes her tactics, ");
	if(pc.hasCock()) output("massaging your shaft");
	else if(pc.hasVagina()) output("probing at your pussy");
	else output("rubbing your bare crotch");
	output(" or teasing your ass");
	if(pc.biggestTitSize() >= 1) output(", even reaching up to cup one of your [pc.breasts]");
	output(", doing everything in her power to arouse and distract you.");

	output("\n\nYou suppress a moan as her fingertips brush your [pc.nipple], trying to bat her hands away and failing miserably. With a frustrated sigh, you press your cheek to the rest and try to concentrate as your finger squeezes down on the trigger. With a flash, your rifle kicks back in your hand as it sends a chunk of super-heated death down-range.");
	flags["ANNO_SHOT_WITH"] = 1;
	processTime(2);
	pc.lust(3+rand(4));
	clearMenu();
	addButton(0,"Next",annoShootsResults,easy);
}

function annoShootsResults(easy:Boolean = false):void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	//PC Succeeds
	if((easy && (pc.aim()/2 + pc.willpower()/4 + rand(20) + 1 > 15)) || (pc.aim()/2 + pc.willpower()/4 + rand(20) + 1 > 25))
	{
		output("<i>\"Let's see what we have here,\"</i> Anno says, squinting down range. You adjust your sights, looking back down to your target, and smile. Even with Anno's cheaty \"distractions,\" you landed a clean headshot, right to poor Bobbest's forehead. You set the rifle down and smile at Anno, grinning lasciviously at your \"prize.\"");
		output("\n\n<i>\"Oh you've gotta be kidding...\"</i> Anno moans, looking at the ruins of the dummy's head. <i>\"So, uh, how about... uh... best two out of three?\"</i> she says sheepishly, trying to avoid your gaze as you decide what to do with the puppy-slut.");
		pc.lust(10);
		processTime(1);
		//[Petplay] [Anal] [Snuggle]
		clearMenu();
		addButton(0,"Petplay",petPlayForAnnoAfterCheating,undefined,"Petplay","Teach her what happens to cheaters. Put Anno in a collar and parade her around Nova. Who knows what might happen...");
		//Snuggle
		addButton(1,"Snuggle",snuggleWithAnnoAfterWhuppinHerAss,undefined,"Snuggle","Be nice to the cute lil' pooch and let her snuggle up on your lap for a little nap. She said anything, after all...");
		//Anal
		//Note to Fen: If she doesn't already, Anno needs a tight, virgin asshole (right where it belongs). This scene can take her anal virginity, after which she'd be a little looser, but still tight as hell.
		//{PC must have a cock that fits in Anno's heiny-hole} + 50%
		if(pc.hasCock() && pc.cockThatFits(chars["ANNO"].analCapacity() * 1.5) >= 0) addButton(2,"Buttfuck",putItInAnnosButtYouSloot,undefined,"Buttfuck","Fuck that needy ass like you mean it.");
		else if(pc.hasCock()) addDisabledButton(2,"Buttfuck","Buttfuck","You're too big to fit in her ass.");
		else addDisabledButton(2,"Buttfuck","Buttfuck","You need a dick to buttfuck her.");
	}
	//PC Fails
	else
	{
		userInterface.showBust("ANNO_NUDE");
		output("<i>\"Let's see what we have here,\"</i> Anno says, squinting down range. You adjust your sights, looking back down to your target. Unfortunately, it looks like Anno's tender ministrations paid off for her: the shot went wide, blowing off the dummy's arm.");
		output("\n\n<i>\"Poor Bobbest,\"</i> Anno grins, pressing up against you. You gulp, feeling her ample chest tight against your back, stiff nipples poking through her sheer uniform to rub against you. Stroking a hand over your [pc.hair], Anno slips around you and onto the crate, deftly positioning her legs around your kneeling head. With one hand, she takes the traitorous rifle from you; her other makes a sensually slow trip up her body as she leans back, stifling a moan as her fingers brush along the curves of her breast, and up to the zipper holding her outfit together. Your eyes are locked on with laser precision as she grips the zipper and slowly pulls it down, taking her time to reveal the heavy mounds of her bust. With a shake of her shoulders, her perky tits bounce free of their confines, already flushed red with lust.");

		output("\n\nYou make to grab one, but quickly find yourself trapped in a prison of latex-clad ausar-leg, tightly clasped around your shoulders, holding your head level with her crotch. She tsks her tongue at you, <i>\"Losers don't get to feel girls up, [pc.name].\"</i> She emphasises her point by wrapping both tits in her hands, shuddering happily as her fingers find her teats, pinching them just enough to get them diamond-stiff. As she does so, you start to become aware of a thick, earthy scent wafting up around you, utterly enveloping you in a rising cloud of ausar-musk.");

		output("\n\nYou could hardly call the smell unpleasant, doubly so as Anno finally draws the zipper down past her groin, letting you have a front-row seat to the wet and ready slit within, crowned with a little tuft of downy white hair and surrounded by juicy rivulets of feminine excitement. Finally, Anno relaxes her legs from around you, using her feet to gently urge you into the gulf between her thighs.");

		output("\n\n<i>\"Dig in,\"</i> Anno playfully commands, shrugging out of the parts of her uniform still clinging to her, leaving her bare from the groin up. With her feet still on your back, gently pulling you in, there's little to do but assent to her demand and bury your face in her sodden box. The musk of sex and need is almost overpowering down here, making your mouth water and ");
		if(pc.hasCock()) output("cock jump to attention as ");
		output(" lust hit");
		if(pc.hasCock()) output("s");
		output(" you like a ton of bricks. You let a hand wander down to your own needy crotch, tugging at your gear as your [pc.tongue] makes its first tentative venture from your [pc.lips]. Your breath catches as your tongue makes contact with one of the wet lust-stains on your ausar lover's thigh - and it has an impact on Anno, too, as her legs clench involuntarily around your head, pinning into your groin. You hold still, denying Anno the touch she craves until she relents, relaxing her vice-like grip on you. Though by now, your face is utterly drenched in her aromatic, sticky juices, well and truly plastered across your face.");
		output("\n\n<i>\"Oh, you look good like that,\"</i> Anno grins, using a finger to wipe a bit of girl-slime off your face, which she proceeds to lick off her fingers. <i>\"The best part of us ausar girls: how </i>wet<i> we get... gotta be able to take those big, thick knots, you know.\"</i> She sounds positively dreamy, already lost to fantasy.");
		output("\n\nWell then. You plant your hands on Anno's hips and dive in. Your tongue slurps along the route between her leg and sex until you feel the rise of her mons, and are immediately rewarded by a little gasp from your lover, and a gentle trickle of excitement that nearly turns into a squirt as you trace your way up the hill and brush against the lip of her labia. Anno groans, back arching as you slide into her sex. A hand plants itself on your head");
		if(pc.hasHair()) output(", fingers digging into your [pc.hair]");
		output(", urging you on as your [pc.tongue] slithers past her folds and into the smooth passage of her " + chars["ANNO"].vaginaDescript() + ".");

		//if PC has some kinda bigass tongue
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("\n\nAnno only just holds back a scream as your inhuman tongue rolls out, slithering into her open passage, spreading her nice and wide as you eat her out.");
		else output("\n\nAnno gasps as your tongue slips into her, circling the spread lips of her cunt before slipping into her channel, spreading her out as you dig into her pussy.");
		output("\n\nAgain her legs clamp and squeeze around your head, muscles on auto-pilot as she stifles little gasps and moans of pleasure. You respond with faster movements, deeper inside her, swirling around in her spasming sex until you can taste the trickles of fem-slime beading around your probing [pc.tongue]. The taste is divine, sweet and just a little bitter, and utterly alien. You barely notice your own heavy breathing as the taste and smell of Anno's growing excitement threaten to overwhelm you");
		if(pc.hasCock()) output("; [pc.eachCock] strains painfully under your [pc.gear]");
		else if(pc.hasVagina()) output("; [pc.eachVagina] drools obscenely, smearing your [pc.gear] with a mix of your and Anno's sexual juices");
		output(". Your own arousal is almost painful, and yet denied the slightest hint of relief from the orally-fixated ausar.");

		output("\n\nAmid thoughts of her cheating, groping ways, your [pc.tongue] finds its way out of her slick passage and upwards, to the flushed-red bud of her clit. Anno has just enough time to yelp, <i>\"Not there!\"</i> before her voice breaks into a shriek of pleasure, thighs clamping down around your head until you see stars - but your oral assault is undeterred, lapping up from the inside of her cooch until you're probing the inside of her clit's little hood, driving your puppy-slut wild with pleasure.");

		output("\n\nWith a shuddering moan, Anno flops back atop the crate, legs nearly limp as you suck her clit up between your lips, rolling it between them until she's panting and gasping, only able to articulate little yelps and moans. With a slight grin, you shift your grip up to the tops of her legs, hiking them up over your shoulders as you move in for a better angle on her now wide and ready pussy, completely defenseless against your onslaught.");

		output("\n\nAs your tongue goes in for another taste of Anno's quivering quim, you feel a powerful twitch beside your ear as Anno's leg moves, knocking limply against your back. You lick again, and feel the same motion, twice now. As you continue to lick and slurp at Anno's cunt, you cast a glance aside, watching her leg start to spasm to the beat of your oral ministrations. You lick faster, suckling on her clit and probing deep into her pussy, working the poor, lust-addled ausar up into a leg-shaking frenzy.");

		output("\n\nOh, she's <i>panting</i> now! You grin as you feel her chest heaving, body going wild as you tease her most sensitive spots with unrelenting oral force, lapping up her sweet honey until it's running down your chin, pooling between your [pc.knees] as you feast. Good lord, she wasn't kidding about how wet she'd get. But that only gets <i>you</i> ");
		if(pc.hasCock() && pc.hasVagina()) output("harder and wetter");
		else if(pc.hasCock()) output("harder");
		else if(pc.hasVagina()) output("wetter");
		else output("more excited");
		output(", compelling you onwards as your lover gets closer and closer to the breaking point, losing control of herself until she's a panting, gasping, moaning mess of a dog-slut.");

		output("\n\nWhen Anno cums after a few minutes of that, she certainly lets you know. Her back arches, clawed hands digging trenches into the sides of the crate, and her thighs clamp around your head, twitching and spasming as her " + chars["ANNO"].vaginaDescript() + " contracts around your [pc.tongue], milking your probing appendage like it's a cock, squeezing until you're trapped inside her vice-like cunt, forced to yelp open-mouthed as her pussy contracts and squirts, a geyser of fem-cum splattering across your face and into your mouth.");

		output("\n\nYou recoil as Anno's grip on your tongue finally relaxes, stumbling back from your [pc.knees] and wiping fem-cum from your face. With a heavy sigh, Anno drags herself into a sitting position, still breathing hard, tits heaving on her chest as she tries to catch her breath. <i>\"Holy shit, boss... that was... I'm gonna have to put in some practice on that rifle, I think. Gotta make you get down there more often.\"</i>");

		output("\n\nShe gives you a wink, and a come-hither crook of her finger. You stand and come to her, ");
		if(pc.tallness <= 65 && !pc.isTaur()) output("crawling up into her lap");
		else output("parking yourself between her still-spread, sopping-wet thighs");
		output(". With a lascivious grin, Anno slips her arms around you, pulling you close into a... a wet tongue. You shudder as she slurps up along your cheek, lapping up the cunt-juice still smeared on your face. Still, you submit to the ausar's affectionate grooming, letting her clean you up - and clearly enjoy the taste of herself all over you.");

		output("\n\nWhen she's finished, Anno sends you on your way with a sharp slap on the [pc.butt], whispering, ");
		if(pc.hasCock()) output("<i>\"You keep that up, and maybe I'll show you what an ausar can do with a big, hard bone....\"</i>");
		else output("<i>\"If you're lucky, maybe next time I'll return the favor.\"</i>");

		output("\n\nYou leave Anno to get cleaned up, and return to the storefront.");
		pc.girlCumInMouth(chars["ANNO"]);
		processTime(30+rand(10));
		pc.lust(23);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Snuggle
//Tooltip: Be nice to the cute lil' pooch and let her snuggle up on your lap for a little nap. She said anything, after all...//One time +Kind}
function snuggleWithAnnoAfterWhuppinHerAss():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	if(flags["ANNO_SNUGGLED_AFTER_SHOOTOFF"] == undefined)
	{
		flags["ANNO_SNUGGLED_AFTER_SHOOTOFF"] = 1;
		pc.addNice(4);
	}
	output("You step up to Anno, closing the distance between the two of you with one long stride and slipping your arms around her waist. She gives a surprised gasp, cheeks flushing as you press yourself close, feeling her ample chest squishing against your [pc.chest]. For your victory lap, you pull the cute ausar girl down onto the couch behind you, resting her in your lap as you recline and close your eyes.");
	output("\n\n<i>\"Wh-what...\"</i> Anno starts to say, but you put a finger to her lips to silence her.");
	output("\n\n<i>\"Nap time,\"</i> you say commandingly, pulling Anno's head down to rest against your [pc.chest].");
	output("\n\nShe fidgets awkwardly, getting comfortable before settling down again in your arms, her fluffy tail swishing against your [pc.leg]. You find yourself smiling slightly as Anno's tall, canid ear twitches against your chin, its owner nuzzling into your chest. After a few minutes, Anno reaches up behind the couch and pulls a blanket down over the two of you, wrapping your bodies in warmth.");
	output("\n\n<i>\"You're nice,\"</i> she murmurs sleepily, planting a tiny kiss on your cheek before settling back in, and joining you in drifting off to sleep.");
	processTime(5);
	//[Next]
	//{Pass ~2 hours}
	clearMenu();
	addButton(0,"Next",snuggleWithAnnoAfterWhuppinHerAss2);
}

function snuggleWithAnnoAfterWhuppinHerAss2():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	output("You wake up with a yawn, struggling to open your eyes. When you do, you're glad to find Anno's still napping in your arms, snoring ever so softly, with her tail tucked comfortably between your [pc.legs]. You run your hands through her soft, snowy hair, brushing a few stray strands from her face. Anno mewls in her sleep, a soft, pathetic little noise of comfort as she rubs her cheek against your chest. You stay like that few a few more pleasant minutes before realizing that you still have a quest to complete. You gently nudge Anno off you, resting her back under the blanket once you've stood up. You tuck your ausar friend back in before making your way back to the shop front, content to let her finish her nap.");
	processTime(122);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Petplay
//Tooltip: Teach her what happens to cheaters. Put Anno in a collar and parade her around Nova. Who knows what might happen...
//Arth! Arth Arth!
//One time +Hard}
function petPlayForAnnoAfterCheating():void
{
	clearOutput();
	if(flags["TAKEN_ANNO_AROUND_AS_A_PET"] == undefined)
	{
		flags["TAKEN_ANNO_AROUND_AS_A_PET"] = 1;
		pc.addHard(2);
	}
	author("Savin");
	userInterface.showBust("ANNO_NUDE");
	userInterface.showName("\nANNO");
	output("Grinning dangerously at Anno, you tell her to strip out of that uniform: dogs don't wear clothes.");
	output("\n\n<i>\"W-what?\"</i> she starts to say, until you grab the zipper on her uniform and yank it down, baring her breasts in one swift motion. Anno gasps, trying to cover them. You bat her arm down.");
	output("\n\n<i>\"Bad puppy,\"</i> you say, pulling the rest of her uniform off. Her tail tucks in, ears lowering as you scold her for her disobedience. You circle around your bare-naked ausar, tracing a hand along her taut midriff and then down to the rounded cheek of her ass, squeezing it had enough to make her wince. <i>\"Sit, girl.\"</i>");
	output("\n\nAnno hesitates a moment, earning another hard grope until she wriggles free and down onto her knees.");
	output("\n\n<i>\"Good girl,\"</i> you tease, planting your hand on the top of her head and giving her a few quick scratches between her canine ears. Anno moans slightly at your touch, her tail finally poking back out to wiggle a bit. There we go. You bend down to the discarded uniform beside her and pull the belt free. You pause to think for a moment, testing the elasticity and length. The material is incredibly stretchy, easily allowing itself to be pulled taut into a several-feet long length. A little crude, but what can you do. You slip the elastic band around Anno's neck, hooking it closed with enough room for her to breathe easy, but not get her pretty little head free. She looks up at you with a keen understanding, and her tail starts to wag fiercely.");
	output("\n\n<i>\"Time for walkies,\"</i> you declare, giving Anno a little nudge toward the exit. Her tail beats faster, batting against your [pc.leg] as she starts to crawl along on all fours. She even gives you a happy little bark, panting a bit as she starts to clamber up the stairs. Oh, she likes it, does she?");
	output("\n\n<i>\"C'mon, girl, let's go!\"</i> you say, more energetically now as you wander back up to the storefront. There's actually a few customers inside, now, browsing the wares on sale and junk piled ceiling-high. Hearing you, they turn to see what's up... and promptly stare as Anno scampers up behind you, still on all fours and as naked as an ausar can get. Seeing customers, she blushes beet-red, straining against the leash, trying to stay in the darkness of the stairwell. You give the leash a commanding tug, yanking her out of the shadows and into full sight for the handful of people gathered 'round.");
	output("\n\nAnno whines, looking up at you plaintively. <i>\"Don't mind her,\"</i> you say, indicating your pooch. <i>\"Still trying to get her comfy on the leash. Isn't that right, girl?\"</i>");

	output("\n\nYou reach down and give Anno a few comforting scratches - enough that her tail manages to pull itself out from between her legs. When it does so, you notice a distinct damp patch in her snowy fur right where... oh... oh, that's too good.");

	output("\n\nYou give her another gentle tug as you start walking for the shop door, blatantly ignoring the stares of your company's customers as they watch the branch manager trot out the door for walkies.");

	output("\n\nOut the door you go, into the crowded bazaar-like halls of Novahome. Dozens of raskvel push and shove their way around you, living currents of foot-traffic surging this way and that. You take care to keep your puppy safe, making sure she doesn't get stepped on - although given the raskvel's diminutive size and Anno's impressive six feet, even on all fours she's still almost as big as one of the feathery scamps.");

	output("\n\nOf course, not every raskvel just walks around you. As you make your way down the corridor, more than a few daring raskvel reach out and grab a piece of your pooch, slapping her ass or groping one of her (by raskvel standards, absolutely huge) mammaries. Anno growls dangerously at them, even snapping her sharp teeth at the first one to go after her breasts, but there's simply too many wanderring hands trying to \"pet\" the cute puppy at your heels for her to keep up with.");

	output("\n\nWhen she nearly bites a raskvel, you give her a sharp rap on the top of the head, barking <i>\"Bad! No biting!\"</i> Anno whines and whimpers, but complies with her master's command, allowing the locals to feel her up to their hearts' content. Just as you suspected, you're soon trailing a trickle of feminine excitement behind you as Anno's lust wells, unable to hide her lifting tail or heaving chest as diminutive hands grope and caress her body.");

	output("\n\nWell, the raskvel - and Anno - both seem to be getting awfully frisky. Maybe you could see if any of them will throw Anno a bone. She's been such a good girl, after all. Or you could keep your pooch all to yourself back at the shop...");

	pc.lust(5);
	processTime(10);
	clearMenu();
	addButton(0,"Go Back",takeYourPetBackToTheShop)
	addButton(1,"Public Use",publicUsePuppyAnno,undefined,"Public Use","See how many of the locals you can get your loyal bitch to publicly service.");
}

//Back to Shop
function takeYourPetBackToTheShop():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO_NUDE");
	userInterface.showName("\nANNO");
	output("<i>\"C'mon girl, time to get home,\"</i> you say, tugging on Anno's leash until she turns around. She barks thankfully as you start to lead your puppy back to the shop. The gropes and wandering hands continue all the way home, until you finally get through the door. A small crowd tries to follow you in, dicks waving around at the defenseless pooch-cooch on display. You quickly close and lock the shop, cutting off their access to Anno. Still in character, she gives you an appreciative mewl and rubs her head against your [pc.leg].");

	output("\n\n<i>\"Good girl,\"</i> you say, praising her with a few head pats. Still blushing and oh-so-very wet after her public excursion, Anno's tail pries itself out from her crotch and wiggles happily at the praise. You sit yourself down, inviting your pup to jump up onto your lap. She clambers up on her knees, hands and chin resting on your [pc.chest] expectantly. You run a hand through her snowy hair, scratching just hard enough to make her tail leap up in excitement. Grinning to yourself, you give the slutty ausar-dog a few minutes of affectionate play, rubbing and squeezing all over her eager body until her hips and tail are both wagging madly, and she's even barking happily as you scratch between her ears or giving her a belly rub that moves a little higher to her ample chest.");

	output("\n\nShe gives a little squeal as your fingers run over her pert nipples, making you stop and play with the perky mounds for a while, kneading and caressing their supple curves until you can see the moisture beading up between Anno's legs again. Good girl. You keep on few a few long, pleasant minutes until your fingers are sore from petting. By then, Anno's staring dreamily off into the distance, practically ready for a nap. You pick your puppy up and set her down on the counter, reminding her that she's a good girl as you collect your things and get ready to leave.");
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Public Use Puppy
function publicUsePuppyAnno():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO_NUDE");
	userInterface.showName("\nANNO");
	output("Anno might try to deny it, but she certainly seems to be enjoying the attention. Her body's already reacting so sweetly t o the touches of the many raskvel men interested in her, wet and ready and eager to fuck. You give a sharp whistle to Anno and command her to sit. She does so, falling onto her knees and staring up expectantly at you.");

	output("\n\n<i>\"Good girl. Stay.\"</i>");

	output("\n\nShe whines plaintively as she's left to the progressively-bolder touches of the crowd, until one particularly daring male finally drops his trousers and waddles up to your puppy, presenting her with his bone. Anno recoils, tail tucking; she looks up to you for help.");

	output("\n\n<i>\"Uh... fetch?\"</i> you say, pointing at the pointed purple prick plopped down on her nose. Hesitantly, Anno opens her mouth, and is immediately rewarded with a gob-full of dick as the horny alien thrusts his hips forward, burying his length between her lips. Your pup gives a defeated whine as the raskvel grabs the back of her head and starts jackhammering, using her as little more than an onahole to get himself off in. You step back and watch, trying to hide the growing heat in your own crotch as you observe the proceedings.");

	output("\n\nIt doesn't take long for the first raskvel to reach his limit. With a grunt, he slams his hips into Anno's chin and blows his load. She yelps and coughs as her mouth is suddenly filled with sticky whiteness, and ends up hacking most of it up onto the deck and her own chin. She isn't given much of a respite, though, before a second taker saunters up and gives her something to suck on again. You smile as Anno's initial resistance melts away little by little, cock after cock, until by the time the fifth member of the crowd you're drawing steps up to take advantage, she's practically begging for it, ass and tail in the air, opening wide for another mouthful of spunk.");

	output("\n\nYou accept a few gracious high-fives and other appreciative greetings from the raskvel as they use your puppy, one by one sating themselves in Anno's mouth. Before long, she's a drooling wet mess of ausar lust, panting and wagging her tail at any cock that comes by, eagerly lunging forward to suck and slurp, head bobbing on pole after pole of raskvel meat until you're afraid she'll fall over into the growing pool of spunk around her. You have to give her credit: she's an excellent cocksucker, and the crowd of raskvel around her seems to know it. Some are even coming back for seconds.");

	output("\n\nEventually, you decide to call it quits. Anno's front half is almost totally glazed white, and the poor pup's barely able to stand anymore - much less clench her jaw. She stumbles forward when you tug on her leash: her eyes are crossed and her expression is one of bank, vacant pleasure. <i>\"Come on, girl,\"</i> you say firmly, trying to shake Anno out of her addled daze; she merely moans and gives a little yip, her mouth idly nudging toward your crotch.");

	output("\n\n<i>\"No,\"</i> you urge her, tugging her leash back toward the shop. You're forced to push back a few particularly horny raskvel who try and get at her exposed ass and pussy. You swat them away, finally resorting to dragging Anno back toward the shop. With some effort, you're able to get her in past the door and lock up shop, depriving Anno of cock long enough for her to recover from her daze.");

	output("\n\n<i>\"Woof,\"</i> she finally says, rolling over and lazily spitting out a mouthful of cum. You chuckle and lean down to rub her belly, leaving the ausar slut with an affectionate pet for being such a good sport.");
	pc.lust(15+rand(10));
	processTime(30+rand(15));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Repair Gear
//{PC must have a Rust Monster Debuff active}
function repairMyRustBroInjuryAnno():void
{
	//Cost: ~50 Creds? 
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	output("<i>\"Can you take a look at this?\"</i> you ask, pulling your equipment off and setting it onto the counter.");
	//if that leaves the PC bare-breasted AND PC has boobs:
	if(pc.upperUndergarment == "" && pc.biggestTitSize() >= 1) output("\n\nAnno's eyes widen a bit as you take off your top, but she's quick to recompose herself into a businesslike demeanor as you start talking price and time. You can't shake the feeling of her eyes glancing up at your bare chest, though, and more than once her swishing tail knocks some widget or another over behind the counter.");
	output("\n\n<i>\"Uh, yeah, sure,\"</i> she says, scooping your gear off the counter and into a bin beneath it. <i>\"Just be a sec, boss. Promise I won't charge you more than component costs!\"</i>");
	output("\n\nShe hefts the bin up and vanishes into a back room behind the store. You spend the next few minutes browsing the weird techno-crap piled up in the storefront, occasionally wincing as Anno lets out a curse or clangs something metallic together, sending reverberations up your spine. Eventually, she pops back into the store, your gear looking... better. Anno wipes some grease and soot from her brow before handing it back over.");
	output("\n\n<i>\"There ya go! Good as, uh... well, it's fixed. Try not to get sydianed again, okay?\"</i>");
	output("\n\n<i>\"I'll try,\"</i> you chuckled, putting your stuff back on.");
	pc.credits -= 50;
	processTime(15);
	pc.removeStatusEffect("Rusted Emitters");
	//Main menu
	annoMainMenu();
}

//Ear Scratches
function earScritchesForAnno():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	//{if First time:}
	if(flags["ANNO_SCRITCHES_HAPPENED"] == undefined)
	{
		flags["ANNO_SCRITCHES_HAPPENED"] = 1;
		output("You reach across the counter, planting an open palm between Anno's perky white wolf-ears. <i>\"Hrmm?\"</i> she murmurs, ears perking up. <i>\"H-hey, what're you...\"</i>");
	}
	//{If repeat}
	else output("You reach across the counter, planting an open palm between Anno's perky white wolf-ears. <i>\"Hey, c'mon boss, it's work hours...\"</i> you flick one of her big ears, and she wriggles under your grasp. <i>\"Then again...\"</i>");
	//{Combine}
	output(" Grinning, you start scratching the sensitive space between her ears, fingers running through her snowy hair. Her protestation melts away in an instant as you give ");
	if(!silly) output("her a playful scratch");
	else output("that bitch a scratch. Bitches love scratches");
	output(". Anno groans happily, eyes fluttering closed as you lavish her ears with affection, fingers slowly moving up and down the two prominent peaks. You switch around to the fleshy insides of her perky ears, thumb teasing the bushy tufts of hair at their bases, making the ausar girl visibly shudder with pleasure.");
	output("\n\n<i>\"Mmmm, right there...\"</i> she moans, breath quickening as you tease her big, fluffy ears. Behind her, her bushy tail thuds against her chair, wagging uncontrollably as she melts in your grasp. <i>\"Riiiight there....\"</i>");
	processTime(2);
	pc.lust(3);
	//[Sex][Tease]
	clearMenu();
	if(pc.lust() >= 33 && (pc.hasCock() || pc.hasVagina())) addButton(0,"Sex",sexWIthAnnoPostTease,undefined,"Sex","See if Anno is up for some sexytimes.");
	else addDisabledButton(0,"Sex","Sex","You need to be turned on enough for sex and have a penis or vagina.");
	addButton(1,"Tease",teaseAnno,undefined,"Tease","Tease her like a dog - really pet that bitch.");
}

//Sex
function sexWIthAnnoPostTease():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	output("With Anno panting happily, bent over the counter with her ass in the air and tail wagging freely behind her, you figure the perky little ausar's in for a special treat.");
	//[Face Fuck] [Get Slurped]
	clearMenu();
	if(pc.hasCock()) addButton(0,"Face Fuck",faceFuckAnno,undefined,"Face Fuck","You could use a blowjob, right? There's never a bad time for a blowjob.");
	else addDisabledButton(0,"Face Fuck","Face Fuck","You need a penis in order to have Anno give you a blowjob.");
	if(pc.hasVagina()) addButton(1,"GetSlurped",getSlurpedOnByAnnoz,undefined,"GetSlurped","Have Anno put that ausar tongue to work somewhere it can be truly appreciated.");
	else addDisabledButton(1,"GetSlurped","GetSlurped","You need a vagina for her to eat you out.");
	addButton(14,"Leave",mainGameMenu);
}

//Tease
function teaseAnno():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	output("<i>\"Who's a good puppy?\"</i> you ask, ruffling her hair. <i>\"Who's a good girl?\"</i>");
	output("\n\n<i>\"I-I am?\"</i> Anno moans, nuzzling up against your hand.");
	output("\n\n<i>\"That's right! You are!\"</i> you tease, stopping your scratches a few moments later to give her a final pat on the head.");
	output("\n\nAnno murmurs happily, resting her head on the counter, tail still wagging happily. <i>\"Mmm. Do that again and I might just make you use those fingers somewhere else, " + pc.mf("handsome","cutie") + "!\"</i>");
	output("\n\n... And some people wonder why ausars and humans get on so well.");
	processTime(1);
	pc.lust(4);
	annoMainMenu();
}

//Talk
function talkToAnnoAboutShitz():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	output("You ask Anno if she's got a few free minutes to chat.");
	output("\n\nShe glances around the customer-less storefront and grins, <i>\"I dunno, I'm pretty swamped at the moment...\"</i>");
	output("\n\nYou both chuckle as Anno hops up onto the counter");
	if(!pc.isTaur()) output(", patting an empty space beside her invitingly. You join her, your [pc.legs] dangling off the edge with hers");
	output(".");

	output("\n\n<i>\"So, what's on your mind, boss?\"</i>");
	processTime(1);
	annoTalkMenu();
}

function annoTalkMenu():void
{
	clearMenu();
	showBust("ANNO");
	showName("\nANNO");
	addButton(0,"Anno",askAbootAnnoz,undefined,"Anno","Ask her about herself.");
	addButton(1,"Novahome",novaHomeTalk,undefined,"Novahome","Ask her about the Nova.");
	addButton(2,"Locals",talkToSyriAboutTheLocals,undefined,"Locals","Ask her about the locals.");
	addButton(3,"Lovers?",anyoneSpecial,undefined,"Lovers?","Ask Anno if she has any lovers.");
	addButton(4, "Business?", howsBusiness, undefined, "How's Business?", "Ask Anno about how business is at her shop.");
	
	if (!pc.hasKeyItem("Goozooka"))
	{
		if (pc.hasItem(new GrayMicrobots()))
		{
			addButton(5, "Gray Goo", beginTheGoozookeningHas, undefined, "Gray Goo", "Ask Anno about the samples you've collected from some Grey Goos.");
		}
		else
		{
			addDisabledButton(5, "Gray Goo", "Gray Goo", "Maybe you could ask Anno about the Gray Goo Menace local to Tarkus if you had a sample of their microbots to hand.");
		}
	}

	if (flags["ANNO_MISSION_OFFER"] == undefined)
	{
		if (flags["TARKUS_DESTROYED"] == undefined)
		{
			addButton(6, "Join Crew", joinCrewPlanetFineVersion, undefined, "Join Crew", "Offer Anno a new job working directly with yourself.");
		}
		else
		{
			addButton(6, "Join Crew", joinCrewPlanetCrackerVersion, undefined, "Join Crew", "Offer Anno a new job working directly with yourself.");
		}
	}
	else if (flags["ANNO_MISSION_OFFER"] == 1)
	{
		addButton(6, "Mission", annoTalkAboutDaMission, undefined, "The Mission", "Ask about this super secret mysterious mission Anno was talking about.");
	}
	else if (flags["ANNO_MISSION_OFFER"] == 3)
	{
		addButton(6, "Join Crew", joinCrewMissionComplete, undefined, "Join Crew", "Offer Anno a new job working directly with yourself.");
	}
	

	addButton(14,"Back",repeatAnnoApproach);
}

//Anno
function askAbootAnnoz():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	output("<i>\"So, tell me about yourself,\"</i> you say, by way of breaking the ice.");
	output("\n\n<i>\"No, you,\"</i> Anno giggles, giving you a playful punch on the shoulder. <i>\"You're the billionaire playboy's " + pc.mf("son","daughter") + ". That's, like, a hundred times more interesting than me.\"</i>");
	output("\n\nYou try and refudiate her claim, but Anno's insistent, and eventually pries you into telling her a bit about yourself, your rather unorthodox upbringing and training, and eventually to the quest that's brought you all the way out to Tarkus.");
	output("\n\n<i>\"Aha! I knew it!\"</i> she exclaims, a smug grin across her face. <i>\"I thought I picked up a Steele signal coming from the wastes a while ago, but I couldn't track it. That must be the probe you're after! Wish I could help you, boss: would be nice to hear Vic's voice again, even if it's just a recording in a probe.\"</i>");
	output("\n\nShe hesitates a moment, before placing a hand on your shoulder, squeezing tight. <i>\"I bet you would too, huh?\"</i>");
	output("\n\nYou nod sadly. <i>\"Yeah... and now, your turn.\"</i>");

	output("\n\n<i>\"My...? Oh, right,\"</i> she says, flashing a grin. <i>\"I was hoping you'd forget. Uh, let's see... me, me, me. Well, I went through what a Terran would call Officer Candidate School, got a degree in physics, and spent a couple years in the Fleet's R&D group. I specialize in Warp Gate Theory, and did my doctoral dissertation in applied gate sciences - that's basically, 'how can we use gate tech in other fields. Like short-range teleportation or quantum ammunition.\"</i>");
	output("\n\n<i>\"Doctoral?\"</i>");
	output("\n\n<i>\"Oh, yeah. That's DOCTOR Anno Dorna to, uh... not you, my Glorious Corporate Paymaster,\"</i> she says with a wink. <i>\"Anyway, bopped around in R&D for a few years, discharged after some budget cuts got my panties in a twist, and then your dad gave me a job working for Steele Tech R&D. Which is a step up </i>if only<i> because of these sexy uniforms,\"</i> she says, pushing out her chest until it strains against the tight, nearly-latex material of her ultra-sheer catsuit, a nipple making itself visible beneath your company logo.");
	output("\n\n<i>\"So yeah, um... God, you know how you can have all the deep thoughts in the world, but when someone asks you about yourself, you're like... 'uh... I like hamburgers' or something. Let's see, uh, my parents are old money! Something something cousins of His Royal Highness the Star-King of Ausaril, fifty times removed or so. You know the type: they spend all their time going to charity balls and other assorted rich people stuff. I've got a crazy little sister who's into video games and pretending she's a wizard or whatever. She's a hoot, though we aren't exactly close these days. Working on other ends of the galaxy and all.\"</i>");
	processTime(8);
	//{FEN, PREPARE YOURSELF FOR A DIALOGUE TREE. CALL ACTION STATIONS, HERE WE GO!!!}
	//{if PC hasn't met Syri, append "end of talk" section here}
	//{if PC has met Syri:}
	if(flags["MET_SYRI"] != undefined)
	{
		if(flags["TOLD_TO_ANNO_ABOUT_SYRI_RELATIONSHIP"] == undefined)
		{
			output("\n\n<i>\"Wait... do you mean Syri?\"</i>");
			output("\n\nAnno blinks. <i>\"You know my sister?\"</i>");
			output("\n\n<i>\"Yeah, I met her back on Mhen'ga.\"</i>");
			flags["UNLOCK_SYRI_ANNO_TALK"] = 1;
			//If PC fucked Syri:
			if(flags["FUCKED_SYRI_COUNT"] != undefined)
			{
				output(" You could tell Anno about your relationship with her sister at this point, and try your luck. Or just keep it to yourself. It's not technically lying, right?");
				//[Tell Her] [Don't]
				clearMenu();
				addButton(0,"Tell Her",tellAnnoAboutSyri);
				addButton(1,"Don't",dontTellAnnoAboutSyri);
				return;
			}
		}
		output("\n\nShe smirks. <i>\"Hey, if you see her, tell her I said 'Write me, bitch!'\"</i>");
	}
	endAnnoSyriTalk();
}

//[Tell Her]
function tellAnnoAboutSyri():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	//if Friends w/ Benefits with Syri:
	if(flags["SYRI_TALKS"] != undefined) output("<i>\"We got pretty close, actually.\"</i>");
	else output("<i>\"We, uh, hung out.\"</i>");

	flags["TOLD_TO_ANNO_ABOUT_SYRI_RELATIONSHIP"] = 1;
	//If PC has sex'd Anno:
	if(annoSexed() > 0)
	{
		output("\n\n<i>\"Hey... you're not trying to get some kind of weird sister-thing going on here, are you?\"</i> your ausar lover asks, eyes narrowing at you.");
		output("\n\nYou quickly assure her you aren't. They're on different planets, after all.");
		if(pc.isMischievous()) output(" The logistics would be a nightmare.");
		output("\n\n<i>\"Well... you and I aren't exactly together, really, and knowing Syri she's just looking for a bum to fuck, so... yeah, I guess that's alright. Kinda weird, though...\"</i>");
		output("\n\nAnno stares at you for an uncomfortable moment before shrugging. <i>\"Well, I'm glad Sysy found someone to love. Or fuck. Whatever. Couldn't ask for a better " + pc.mf("boy","girl") + "friend for her, if that's what you two are. Better tell her to watch out, though, or I might snatch you away!\"</i>");
		output(" She smirks. <i>\"Hey, if you see her, tell her I said 'Write me, bitch!'\"</i>");
	}
	else output("\n\n<i>\"Cool! I didn't even know she moved. Hey, if you see her, tell her I said 'Write me, bitch!'\"</i>\n\nYou chuckle and say you will.");
	processTime(2);
	endAnnoSyriTalk();
}

//[Don't]
function dontTellAnnoAboutSyri():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	output("You decide to keep your... intimate relations with Syri to yourself");
	//[Append as follows, as if you hadn't fucked her]
	//Didn't Fuck/Didn't Tell:
	output("\n\n<i>\"Cool! I didn't even know she moved. Hey, if you see her, tell her I said 'Write me, bitch!'\"</i>\n\nYou chuckle and say you will.");
	endAnnoSyriTalk();
}

//End Talk
function endAnnoSyriTalk():void
{
	output("\n\nYou thank Anno for talking, and quickly find yourself pulled into a tight hug. <i>\"Thanks for caring, boss. Most billionaire CEO's wouldn't give a lil' nobody like me the time of day.\"</i>");
	output("\n\nRuffling Anno's hair, you let her get back to work.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//{NEW SYRI TALK OPTION: "Anno"}
function syriTalksAboutAnno():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	output("<i>\"Oh, hey, Anno says 'Write me, bitch!' by the way.");
	if(pc.isNice() || pc.isMischievous()) output(" Her words, not mine!");
	output("\"</i>");

	output("\n\nSyri cocks an eyebrow at you. <i>\"Why do... right, billionaire play" + pc.mf("boy","girl") + ",\"</i> she rolls her eyes. <i>\"Tell that pussy-stealing harpy she can write </i>me<i> whenever she feels like it. I haven't exactly changed email addresses.\"</i>");
	output("\n\n<i>\"Harsh.\"</i>");
	output("\n\nSyri holds your gaze for a long second before sighing, the fight gone out of her. <i>\"Yeah. I'll write her when I get off work later.\"</i>");
	output("\n\nSuddenly, Syri's lips curl into a fierce grin, and her big, blue eyes search you over. <i>\"Hmm... maybe I ought to ask her to take some vacation time and come on out here. What do you say, Steele... ever thought about what it'd be like with twins?\"</i>");
	output("\n\n<i>\"Twins? I, uh...\"</i> you fidget, <i>\"I thought she was your older sister?\"</i>");
	output("\n\n<i>\"By like, five minutes. Don't change the subject, killjoy,\"</i> Syri growls, looming over you. ");
	//If PC has a cock: 
	if(pc.hasCock()) output("“Come on, we even have the same cup size. Imagine two identical pairs of tits, big and soft and all over your [pc.cockBiggest], jacking you off together until you bust a big, thick nut all over our faces... watching us lick it off each other, maybe turns into kissing, groping, until you bend us over and take us together, still in each others' arms...”");
	else output("“Imagine yourself bent over, face buried in Anno's big, perky tits, your hands all over the sensitive little teats of hers as I fuck you from behind, pounding you extra hard cuz you've got your grubby, terran hands on my sister... until maybe my cock slips, and suddenly I'm doing her, pounding her wet, sloppy little bitch-hole while you watch.”");
	output(" Your eyes eyes dart down to the suddenly immense-looking bulge in Syri's pants. She's... she's not joking, is she?");
	output("\n\nThe ausar follows your gaze, her body suddenly tense. Syri grabs you by the ");
	if(pc.armor.shortName != "") output("front of your " + pc.armor.longName);
	else output("shoulders");
	output(", slamming you back against the bar as she crawls into your lap, her heaving breasts pressing hard into your [pc.chest]. <i>\"Take me back to your place before I bust a nut in my pants just thinking about it.\"</i>");
	output("\n\nHo boy!");
	pc.lust(10);
	//[Sex Menu]
	syriSexMenu(false);
}

//Novahome
function novaHomeTalk():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	if(flags["TARKUS_DESTROYED"] == undefined)
	{
		output("<i>\"So, what do you think of Nova?\"</i> you ask, gesturing out the shop front to the derelict spaceship around you.");
		output("\n\n<i>\"Honestly? Scares the hell out of me,\"</i> Anno says, matter-of-factly. <i>\"The decks creak, pipes and wires break all the time... I'm amazed we have power. And more amazed that when we do, the reactor doesn't go nuclear. I wouldn't be surprised if I wake up one morning as a pile of ash. And that's on a good day.\"</i>");
		output("\n\nAnno shudders. <i>\"Sorry to be a downer, boss. It's not the worst gig in the world: at least I'm not stationed on Galotia or something. Still, this ship's seen better days, even putting aside the crash. I'm not sure if the Nova got shot down or just fell into the planet's gravity well, but this place is </i>ancient<i>, and I don't use the word lightly. I'm still poking around, doing some research on it. I know its human, but I couldn't extranet search up a trace of it. At least, from before the rushers found it. No departure records, no crew manifest, no record of who owned it... I've turned up something about a Bell-Isle-stroke-Grunmann company from the robo-goo-things outside after I net-hacked a few of them, but other than that... nothing. Every computer onboard is either slagged or wiped, and I can't recover anything. The only databanks I've come across are deadlocked. I tried connecting to the reactor's computer, and got my rig fried for my trouble.\"</i>");
		output("\n\n<i>\"Something's seriously wrong with this ship,\"</i> she concludes. And quieter, she adds, <i>\"When my computer burnt out, I heard... God, it was like the wails of the damned. This place is a tomb.\"</i>");
		output("\n\n<i>\"Woah.\"</i>");
		output("\n\n<i>\"Yeah,\"</i> Anno sighs. <i>\"It's like something out of a horror movie, but so far we're just in the tense part, before the jump scares. There's even been some disappearances, you know? That Shekel girl or whatever across the way's been screaming about it, just about starting a riot... but she's not wrong. I don't think its slavers, though. The pioneers woke this ship up when they landed, and now?\"</i>");
		output("\n\n<i>\"Anyway, I probably sound like a nut job, huh? Let's just say this place gives me the creeps, boss. You ask me: bomb the </i>Nova<i> from orbit.\"</i>");
	}
	else
	{
		output("<i>\"So, what do you think of Nova?\"</i> you ask, gesturing out the shop front to the derelict spaceship around you.");
		output("\n\n<i>\"Honestly? Scares the hell out of me,\"</i> Anno says, matter-of-factly. <i>\"The decks creak, pipes and wires break all the time... I'm amazed we have power. And more amazed that when we do, the reactor doesn't go nuclear. I wouldn't be surprised if I wake up one morning as a pile of ash. And that's on a good day. How the hell this this didn't just break apart when we went orbital, I don't even know.\"</i>");
		output("\n\nAnno shudders. <i>\"I don't mean to be a downer, but... this place is a deathtrap. It's a humanitarian crisis that there's thousands of people stuck in here, waiting for a bulkhead to give out or an airlock to malfunction. Hell, even before the crash the ship's seen better days. I'm not sure if the Nova got shot down or just fell into the planet's gravity well, but this place is </i>ancient<i>, and I don't use the word lightly. I'm still poking around, doing some research on it. I know it’s human, but I couldn't extranet search up a trace of it. At least, from before the rushers found it. No departure records, no crew manifest, no record of who owned it... I've turned up something about a Bell-Isle-stroke-Grunmann company from the robo-goo-things that didn't get spaced after I net-hacked a few of them, but other than that... nothing. Every computer onboard is either slagged or wiped, and I can't recover anything. The only databanks I've come across are deadlocked. I even tried connecting to the reactor's computer, and got my rig fried for my trouble.\"</i>");
		output("\n\n<i>\"Something's seriously wrong with this ship,\"</i> she concludes. And, more quietly, she adds, <i>\"When my computer burnt out, I heard... God, it was like the wails of the damned. This place is a tomb.\"</i>");
		output("\n\n<i>\"Woah.\"</i>");
		output("\n\n<i>\"Yeah,\"</i> Anno sighs. <i>\"It's like something out of a horror movie, but so far we're just in the tense part, before the jump scares. There's even been some disappearances, you know? That Shekel girl or whatever across the way's been screaming about it, just about starting a riot... but she's not wrong. I don't think its slavers, though. The pioneers woke this ship up when they landed, and now?\"</i>");
		output("\n\n<i>\"Anyway, I probably sound like a nut job, huh? Let's just say this place gives me the creeps, boss. If you offered me a ride out on the next shithaul freighter, I wouldn't say no.\"</i>");
	}
	processTime(10+rand(2));
	annoTalkMenu();
	removeButton(1);
	addDisabledButton(1,"Novahome");
}

//The Locals
function talkToSyriAboutTheLocals():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	if(flags["TARKUS_DESTROYED"] == undefined)
	{
		output("<i>\"So, what can you tell me about the locals?\"</i>");
		output("\n\n<i>\"Who the raskvel? Or do you mean planet-wide? Or just on the ship? No, don't ask me that, I don't know anybody in Nova except the bartender and that stone-cold dominatrix lady that runs the Mess. So, uh, planet-wide. That sounds fun.\"</i>");
		output("\n\n<i>\"First thing to know: there are a lot of different species on Tarkus. Really, that's the trend the Rush, with multi-species planets. Normally you only get one dominant race per world, like on Terra or Ausaril; here, you've got several equally powerful, prominent races sharing the world. The only reason Tarkus seems like the Planet of the Rask is because they're the ones holding onto Novahome when the pioneers opened the gate up, and of course they landed on the creepy human ship.\"</i>");
		output("\n\n<i>\"That could be because Tarkus is actually a hybrid planet made up of several fragments. I don't know if the different races are natives to the different worlds of Tarkus, if they came here by colonization, or what, but it's strange.\"</i> She pauses a moment for breath, then grins, <i>\"I've been thinking of writing a book while I'm here, in case you're wondering.\"</i>");
		output("\n\nShe sighs wistfully. <i>\"Anyway, the most important actual races are the sydians and the raskvel. Sydians are pretty interesting: they rip apart metal and eat it, thanks to some kind of chemical on their feelers. Plus they have biological aphrodisiacs in their spit. I think? Could be cum, need to research more. Possibly hands on, if you know what I mean. Either way, I'm sure Xenogen is going to love getting their dirty hands on some... specimens... to dissect. They also have big dicks, big, bulging muscles, and an adversity to clothes, which as a lady who likes the D, is a pretty big bonus. They're eye candy of the highest order.\"</i>");
		output("\n\n<i>\"Then there's the raskvel. They're cute as buttons, but their average I.Q. seems to be about fish, give or take trout. Some are clever repairmen, and I have to admit, they did wonders restoring this ship of theirs, but... they just seem kind of doe-eyed, you know? They're the kind of aliens I want to have stuffed animals of and cuddle, not have a conversation with. And they smell like dirt and leather. The ones here in Novahome are pretty tame, but watch out if you go outside: they get kind of rapey when nobody's there to stop them, and those wrenches of theirs pack a punch when they've got shotguns built into the grip.\"</i>");
		output("\n\nShe laughs, <i>\"Still, if you want an easy lay, just ");
		if(pc.hasCock()) output("grab a rask and bend her over something");
		else output("bend over and hike your clothes");
		output("; they'll take care of the rest. As a race, they're obsessed with eggs and rutting, which makes sense when they can just get stepped on by sydians. Outbreed and outlast.\"</i>");
		output("\n\nAfter a moment of thought, Anno adds, <i>\"There's also the little eggy girls, the lapinara; goblins - they're like something out of that shitty book-game-thing my sister plays - and probably other races, too. Don't know much about them, though. Try the extranet,\"</i> she says with a playful wink.");
	}
	else
	{
		//The Locals
		output("<i>\"So, what can you tell me about the locals?\"</i>");
		output("\n\n<i>\"Who, the raskvel? Heh, I guess that's about all that's left of the old world, huh? Everybody else... God. Shit, I don't even know anybody in Nova except the bartender and that stone-cold dominatrix lady that runs the Mess.\"</i>");
		output("\n\n<i>\"Well. Tell me about Tarkus-that-was, then,\"</i> you suggest. <i>\"There used to be lots of critters running around.\"</i>");
		output("\n\nAnno shrugs. <i>\"Yeah. I can do that. First thing to know: there were a lot of different species on Tarkus. Really, that's the trend this Rush, with multi-species planets. Normally you only get one dominant race per world, like on Terra or Ausaril; here, you had several equally powerful, prominent races sharing the world. The only reason Tarkus seemed like the Planet of the Rask is because they were the ones holding onto Novahome when the pioneers opened the gate up, and of course they landed on the creepy human ghost ship.\"</i>");
		output("\n\n<i>\"That could be because Tarkus was actually a hybrid planet made up of several fragments. I don't know if the different races were natives to the different worlds of Tarkus, if they came here by colonization, or what, but it's strange.\"</i> She pauses a moment for breath, then grins, <i>\"I was just about to query some publishers about writing a book before... before the subject pool got a whole lot smaller.\"</i>");
		output("\n\nShe sighs sadly. <i>\"Anyway, the most important actual races are the sydians and the raskvel. Sydians are pretty interesting: they rip apart metal and eat it, thanks to some kind of chemical on their feelers. Plus they have biological aphrodisiacs in their spit. I think? Could be cum; need to research more. Possibly hands-on, if you know what I mean. Either way, I'm sure Xenogen is going to love getting their dirty hands on some... specimens... to dissect. They also have big dicks and big, bulging muscles, not to mention an adversity to clothes... which, as a lady who likes the D, is a pretty big bonus. They're eye candy of the highest order. There's even a fairly good population left aboard the ship, still. Not a breeding pool, though... I think these sydians will be the last, or close to it.\"</i>");
		output("\n\n<i>\"Then there's the raskvel. They're cute as buttons, but their average I.Q. seems to be about fish, give or take trout. Some are clever repairmen, and I have to admit, they did a miracle restoring this ship of theirs to be mostly-kind-of spaceworthy, but... they just seem kind of doe-eyed, you know? They're the kind of aliens I want to have stuffed animals of and cuddle, not have a conversation with. And they smell like dirt and leather. The ones here in Novahome are pretty tame, and the real asshole ones that'd attack you all got spaced, so... I guess that takes care of the aggressive part of the gene pool.\"</i>");
		output("\n\nShe laughs, <i>\"Still, if you want an easy lay, just ");
		if(pc.hasCock()) output("grab a rask and bend her over something");
		else output("bend over and hike your clothes");
		output("); they'll take care of the rest. As a race, they're obsessed with eggs and rutting, which makes sense when they can just get stepped on by sydians. Outbreed and outlast.\"</i>");
		output("\n\nAfter a moment of thought, Anno adds, <i>\"I don't think any other races made it off Tarkus. Not in enough numbers, anyway. Still some of the more harmless grey goo and goblins around, but not many.\"</i>");
	}
	processTime(10);
	annoTalkMenu();
	removeButton(2);
	addDisabledButton(2,"Locals");
}

//Anyone Special?
function anyoneSpecial():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	//if sexed:
	if(annoSexed() > 0) output("It might be a little too late for this question, but... ");
	output("You ask Anno if there's anyone special in her life. She laughs, <i>\"What're you, trying to sell me the Good Book or something?\"</i>");
	output("\n\nYou cock an eyebrow at her. <i>\"Sorry. Uh, well... kind of? I've got a girlfriend, Kaede, but we're kind of in an on-again-off-again sort of place right now. Plus we've always been in an open relationship, so don't worry... I'm not out of your reach yet, " + pc.mf("Mr.","Ms.") + " Steele!\"</i> she teases, giving you a wink.");
	output("\n\nYou follow up, asking her to tell you about the special lady.");
	output("\n\n<i>\"Kaede? Oh, I met her while I was doing grad work at Ausaril Tech. Go jackals! I was a few years older than her, but we hit it off... dated for a couple years till she had to withdraw. She was actually through here just a few weeks ago, helping me with some things: we had a run-in with some mercs and raskvel. Fun times. Anyway, she's a freighter captain, independent. Cute, nerdy, with curves in all the right places... plus a big dick, which is, you know, pretty great.");
	processTime(2);
	if(pc.hasCock())
	{
		//if PC has a bigger cock than 8in, has sex'd Anno:
		if(pc.biggestCockLength() > 8 && annoSexed() > 0) output(" I mean, not as big as </i>yours<i>, but still.");
	}
	output("\"</i>");
	clearMenu();
	addButton(0,"Threeway",threeWayAnno,undefined,"Threeway","Ask her if she's up for threeways sometime.");
	//[Leave] [Threeway?]  If NotSex'd & PC is girl: [Into Girls?] PC is shemale/futa: [Into Dickgirls?]
	//If NotSex'd & PC is girl: [Into Girls?]
	if(pc.hasVagina() && !pc.hasCock() && annoSexed() == 0)
	{
		//[Into Girls?]
		addButton(1,"Into Girls?",intoGirlsAnno,undefined,"Into Girls?","Ask her if she's into girls.");
	}
	//PC is shemale/futa: [Into Dickgirls?]
	else if(pc.hasCock() && pc.mf("he","she") == "she" && annoSexed() == 0)
	{
		//[Into Dickgirls?]
		addButton(2,"Into D-Girls?",intoDickgirlsAnno,undefined,"Into Dickgirls?","Ask her if she's into dickgirls.");
	}
	//[Leave]
	addButton(14,"Leave",mainGameMenu);
}

//Threeway?
function threeWayAnno():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	output("Grinning, you ask Anno if she'd be into a little group activity, next time she and her girlfriend get together.");
	output("\n\n<i>\"Haha! Any time, any place. That's actually how we got together the first time, you know... a, uh, mutual friend I was tutoring brought beer one night, and before I know it I'm in bed with a pair of smoking hot half-ausars, with two dicks, six beers, and a box of sex toys between us. I couldn't sit down for a week! I'll give you a call if you're around, boss: I think you'll like her!\"</i>");
	processTime(1);
	annoTalkMenu();
	removeButton(3);
	addDisabledButton(3,"Lovers?");
}

//Into Girls?
function intoGirlsAnno():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	output("<i>\"So, you're into girls?\"</i> you tease, weight shifting to subtly emphasizing your own feminine form.");
	output("\n\nAnno grins. <i>\"Guys, girls, and everything in between. I mean, in this day and age it's hard to limit yourself like that. Heck, my </i>parents<i> switched genders for a year or two. 'It'll be fun,' they said. 'We're just playing,' they said. So yeah, I like girl just plenty...\"</i>");
	output("\n\n<i>\"So, why do you ask?\"</i> she teases, pressing herself close. <i>\"Thinking about asking little ol' me out?\"</i>");
	output("\n\nThat sounded a little more serious than you expected...");
	processTime(1);
	annoTalkMenu();
	removeButton(3);
	addDisabledButton(3,"Lovers?");
}

//Into Dickgirls?
function intoDickgirlsAnno():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	output("<i>\"So, you're into girls with a little more?\"</i> you tease, weight shifting to subtly emphasizing your own feminine form... as well as what lies between your [pc.legs].");
	output("\n\nAnno grins. <i>\"I should hope so, or I've got some bad news for Kaede!\"</i> She laughs, taking a few moments to compose herself. <i>\"Yeah, yeah I do. There's something just... </i>right<i> about a curvy, sexy lady's body with a big, throbbing cock between her legs, you know? Soft and squishy in all the right places, but hard and powerful where it counts.\"</i>");
	output("\n\n<i>\"So, why do you ask?\"</i> she teases, pressing herself close. <i>\"Thinking about asking little ol' me out?\"</i>");
	output("\n\nThat sounded a little more serious than you expected...");
	processTime(2);
	annoTalkMenu();
	removeButton(3);
	addDisabledButton(3,"Lovers?");
}

//How's Business
function howsBusiness():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	if(flags["TARKUS_DESTROYED"] == undefined)
	{
		output("<i>\"So, how's business these days?\"</i> you ask, giving a nod towards the widget shop across the way.");
		output("\n\nAnno's eyes dart around the storefront, mostly devoid of customers, and shrugs. <i>\"Could be better. The Mess keeps most of the spacers close by, but they're the only ones buying, pretty much. Which is fine, I guess: we're more of a research station than a shop, anyway. And it leaves me with plenty of free time.\"</i>");
		output("\n\nYou give her a little nudge and ask about the competition.");
		output("\n\n<i>\"Well... there's Skezza's junk hut across the corridor. Or was it Shella? Shekka? Shekka! She's mostly selling shit the raskvel salvage from Nova or the wasteland outside, and most of what I've bought from her just breaks or explodes. For a race supposedly all about fixing things over building them, you'd think I could walk down the hall without a shield belt on. Wouldn't buy from her again, but she seems pretty cute, so... I dunno. I just wanna give her a hug every time I see her.\"</i>");
		output("\n\nYou chuckle at the thought, but Anno just sighs. <i>\"Honestly, I kind of think... no, I </i>know<i> I'm wasted out here. I've got a fucking PhD, but I'm manning a store on... on fucking TARKUS of all places. Thanks for giving me responsibility and all, I appreciate that - I really do - but seriously. It smeeeeelllsssss heeeerrreeeee.\"</i>");
		output("\n\nYou pat Anno reassuringly on the shoulder as she pouts.");
	}
	else
	{
		output("<i>\"So, how's business these days?\"</i> you ask, indicating the piles of disorganized crap all over the shop.");
		output("\n\nAnno's eyes dart around the storefront, entirely devoid of customers, and shrugs. <i>\"Nonexistent. The only reason to come out here was to salvage shit from the planet. Now most of it’s either floating in space or even MORE broken, so... let's say traffic to Tarkus is plummeting.\"</i>");
		output("\n\nYou give her a little nudge and ask about the competition.");
		output("\n\n<i>\"Well... there's Skezza's junk hut across the corridor. Or was it Shella? Shekka? Shekka! She's mostly selling shit the raskvel salvage from... I don't even know where anymore... and most of what I've bought from her just breaks or explodes. For a race supposedly all about fixing things over building them, you'd think I could walk down the hall without a shield belt on. Wouldn't buy from her again, but she seems pretty cute, so... I dunno. I just wanna give her a hug every time I see her.\"</i>");
		output("\n\nYou chuckle at the thought, but Anno just sighs. <i>\"Honestly, I kind of think... no, I </i>know<i> I'm wasted out here. I've got a fucking PhD, but I'm manning a store on a fucking ghost ship that nobody comes to. I don't even know why I'm out here anymore, but Corporate won't approve my transfer requests. They're fucking punishing me for getting special treatment from Vic, I know it. I just want off this fucking tub!\"</i>");
		output("\n\nYou pat Anno reassuringly on the shoulder as she pouts.");
	}
	processTime(3);
	annoTalkMenu();
	removeButton(4);
	addDisabledButton(4,"Business?");
}

//Appearance
//{Unlocked after sexed at least once}
function annoAppearance():void
{
	clearOutput();
	author("Savin");
	userInterface.showName("\nANNO");
	output("Anno Dorna is a six-foot tall ausar girl with long, snow-white hair and a pair of huge, perky wolf ears perched atop her head. Though distinctly humanoid in face and form, the silky fur on her arms and legs, plus the swishing, bushy tail give her a playfully alien appearance, more like a perky little puppy than a fearsome predator. She's wearing the distinctive Steele Tech field uniform: an ultra-sheer black and yellow catsuit that hugs her frame and accentuates her curves in all the right places, supporting her ample bust so that it looks almost impossibly perky for its size. Thanks to the catsuit, you can see the full expanse of her fleshy body: a big, bouncy butt only barely hidden by her tail, a sizable rack, and a pair of long, toned legs.");
	if(annoSexed() > 0)
	{
		
		output("\n\nAnno has a pair of full DD-cup breasts, big and bouncy and oh so soft, each tipped with a big, sensitive nipple that's perfect to tug and squeeze.");
		output("\n\nBetween her legs, Anno has a tight little pussy. Naturally stretchier and so much wetter than a human's, her sex is perfect for taking thick knots and great big cocks with ease. It's topped with a trimmed landing strip of downy white fuzz. Opposite that, she has a nice, inviting little asshole between her firm cheeks, right where it belongs.");
	}
	annoMainMenu();
	if(annoSexed() > 0) userInterface.showBust("ANNO_NUDE","ANNO");
	removeButton(5);
	addDisabledButton(5,"Appearance");
}

//Face Fuck
function faceFuckAnno():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO_NUDE");
	userInterface.showName("\nANNO");

	var x:int = pc.biggestCockIndex();
	output("You ");
	if(pc.isNude()) output("start pulling yourself out of your [pc.gear] and ");
	output("grab your [pc.cock " + x + "], the rapidly hardening length mere inches from Anno's bliss-etched face. She doesn't react at all as your possessions clatter to the ground behind you; the only sign she gives that she's even aware of you anymore is the slight raise of her tail, the tell-tale gesture of an ausar ready to play. You let your dong drop onto her cheek, " + num2Text(Math.round(pc.cocks[x].cLength())) + " inches of hard, hot meat suddenly caressing her cheek is enough to break Anno from her reverie, her big, blue eyes fluttering open, wandering over your naked form.");

	//if first time having sex:
	if(annoSexed() == 0)
	{
		output("\n\nFlashing you a grin, the ausar whispers, <i>\"You could have bought me dinner first.\"</i> She nuzzles against your [pc.cock " + x + "], licking her lips");
		if(pc.balls > 0) output(" and reaching back to cup your [pc.balls], feeling the heft of them as she goes");
		output(". ");
	}
	else output("\n\n");
	output("You give your canine friend a little push, just enough to roll her over as you bark the command aloud; she giggles and complies, flipping onto her back with her head hanging over the edge of the counter, at just the perfect angle to give you easy access to her throat.");

	output("\n\n<i>\"Think you deserve a treat?\"</i> you tease, scratching at one of her perky white ears.");

	output("\n\nAnno giggles, answering, <i>\"Maaaaybeeee,\"</i> as she reaches back to stroke your thigh, a soft, furred pair of hands slipping between them to");
	if(pc.balls > 0) output(" cup and caress your [pc.balls], squeezing just enough to make your shiver with pleasure");
	else if(pc.hasVagina()) output(" stroke the base of your manhood before gliding downward, paying a visit to the slick slit of your sex, teasing at the edges of your clitoral hood");
	else output(" caress the base of your [pc.cock " + x + "], stroking the shaft ever so gently");
	output(" as you guide your [pc.hips] forward toward the welcoming warmth of Anno's mouth.");

	output("\n\nShe opens wide for you, tongue guiding your [pc.cockHead " + x + "] in with a quiet slurp, cheeks bulging as your member slides into her inviting hole. Hot and humid breath courses around your [pc.cock " + x + "] as it enters her, finding a nice, hot holster that conforms to your prick's girth and length with aplomb, tight where it needs to be, but loose enough that you don't have much trouble pushing in enough dick meat to have your ");
	if(pc.cocks[x].cLength() < 8)
	{
		if(pc.balls > 0) output("[pc.balls]");
		else output("groin");
		output(" touch her brow.");
	}
	else output("cock start distending her throat, which proves to be quite elastic as it stretches around your hefty member. This girl's got some gag reflexes!");
	output(" Sated with your first foray between Anno's lips, you take a moment to enjoy the tight, wet feeling of your new favorite cock-cozy around your member, the muscles of her mouth");
	if(pc.cocks[x].cLength() >= 8) output(" and throat");
	output(" rhythmically contracting and shifting around your dick with the precisions you'd expect from a well-fucked whore. For her part, the dog-slut beams up at you from beneath your throbbing cock, clearly enjoying herself.");

	output("\n\nAnno's head bobs slightly, reaching up to plant her lips on your base before withdrawing the few inches her neck can reach from her position bent over the counter. You're going to need a little bit more than that if you want to get off, and a quick look between the two of you gains your lover's assent. You lean in, grabbing the edge of the counter for balance as you shift most of your weight over Anno. At this new angle, it's a simple matter to pull your hips back, withdrawing your prick from her mouth until your crown is all that's left, Anno's lips planted on it like a lover's kiss before you push back.");

	output("\n\nYou go slow at first, easing yourself into her, giving her a chance to adjust to the new position. A few steady strokes, and you feel her throat relaxing around your shaft, her gag reflex utterly suppressed, leaving her mouth open and defenseless against your invading manhood. An opportunity you'd be a fool to waste. You move faster, hips bucking into her face as you slam your prick home into the welcoming embrace of your lover's lips. She lets out a soft, strained moan as you pick up the pace, breathing coming quicker, more shallow, as she's forcefully face-fucked into the counter.");

	output("\n\nBetween your powerful thrusts, Anno works her hands up the sheer surface of her catsuit uniform, white-furred fingers tugging at the zipper. She pulls it down around her ample pair of sweater-puppies, letting them free from their confines to taste the musky air, her nipples both as hard as rocks. You shift your hands to grab her breasts, squeezing them roughly; they're putty in your hands, so soft and forgiving, flesh flowing around your fingers until you can barely resist the urge to turn this into a titfucking.");

	output("\n\nBut the feeling of your cock pounding their owners' face, her chest heaving with every thrust, dissuades you. Content to fondle and squeeze, you let your thumbs run across the stiff, pink peaks of her nipples, rolling their rounded points under your digits in slow, wide circles, one full rotation for every half-dozen pumps of your [pc.cock " + x + "]. Anno moans, her back arching at your touch as her breath catches between mouthfuls of cock. Still, her fingers travel down, pulling open her uniform straight down her belly to the crotch, where her hand quickly disappears.");

	output("\n\nYou thought she was moaning before... Her voice breaks into a high-pitched whine as her fingers delve her sex, her cries only stifled when your [pc.cock " + x + "] is occupying her throat. You fuck faster, hips hammering to the beat of her wrist's movements, reciprocating her every movement with one of your own. Soon, your voice joins hers, quiet moans turning into bestial grunts as your hips batter her face, her oh-so-skilled tongue, mouth, and throat working in concert to milk every inch of cockflesh that comes their way.");

	output("\n\nBetween the lewd show of your lover jilling off and your own oral-induced pleasure, you find yourself hurtling toward climax. You have just enough time to warn Anno before, with a grunt and a ");
	if(pc.balls > 0) output("balls");
	else output("groin");
	output("-deep thrust, you flood her mouth with [pc.cumColor] spunk. Anno gasps, eyes widening as your hot load goes straight down her throat. Your [pc.hips] piston forward again and again, using her throat like a cockmilker to squeeze out every last drop your can, thrusting and cumming until");
	if(pc.cumQ() < 100) output(" your reserves go dry");
	else if(pc.cumQ() <= 1000) output(" creamy seed is drooling down her cheeks");
	else output(" she looks several months pregnant, belly bloated with your spunk");
	output(".");

	output("\n\nFinally, you stumble back, catching yourself on a junk-laden shelf as your prick pops wetly out of Anno's mouth, trailing trickles of seed across her cheek and onto the floor. She coughs and flops back onto her belly, spitting up a thick wad of [pc.cumColor] spunk onto the floor as she does so. She gives a deep, husky sigh, tail swaying happily as she beams at you, cum still dripping down her chin.");

	output("\n\n<i>\"That sure was a treat, boss... but about you throw me a bone, huh?\"</i> she says with a wolfish grin, her bushy white tail raising invitingly over her arched back.");
	processTime(15+rand(10));
	annoSexed(1);
	pc.orgasm();
	clearMenu();
	if(pc.cockThatFits(chars["ANNO"].vaginalCapacity(0)) >= 0)
	{
		if(pc.lust() >= 33 || pc.libido() >= 80) addButton(0,"Fuck Her",fuckAnnoAfterBeeJay,undefined,"Fuck Her","Fuck Anno. You've got another round in you, right?");
		else addDisabledButton(0,"Fuck Her","Fuck Her","You need a libido of 80 or 33 minimum lust in order to keep it up for another go-round.");
	}
	else addDisabledButton(0,"Fuck Her","Fuck Her","There's no way you're going to fit yourself in a hole that small.");
	addButton(14,"Leave",mainGameMenu);
}

//Fuck Her
function fuckAnnoAfterBeeJay():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO_NUDE");
	userInterface.showName("\nANNO");

	var x:int = pc.cockThatFits(chars["ANNO"].vaginalCapacity());
	output("<i>\"I think I can manage that,\"</i> you grin, slipping around behind the counter and taking hold of Anno's flared hips, fingers digging into the elastic material of her sheer, flesh-hugging catsuit. Before you can get carried away, Anno's fluffy tail reaches up, its tip tickling your nose as its owner looks over her shoulder expectantly.");

	output("\n\nYou mock rolling your eyes as you take hold of the wriggling appendage, stroking it gently as you guide it out of the way. Anno visibly shudders at the sensation, clearly enjoying a little affection on her canid parts. You give the tail a little push back through the hole in her catsuit's rear end before pulling the whole outfit down in one easy stroke, letting it ball around your ausar lover's spread legs, leaving her nice and bare for you. She gives a happy moan as the last of her clothing falls free, wiggling her butt back into your bare, cum-slathered groin. You answer with a quick slap on one of her rounded cheeks, eliciting a startled squeak from her as her flesh jiggles in response.");

	output("\n\n<i>\"Not yet,\"</i> you tease, pulling your crotch back from her ample ass. You slide down to your [pc.knees], hands running up and down Anno's toned legs and big, squishy butt as you go, feeling up every inch of bare ausar flesh, fingers running through the furred lowers halves of her legs, all the way down to her cute, clawed feet. Slowly, sensually, you work your way back up to your goal: the soft, pliant flesh of her ass; at your touch, her cheeks quiver and quake as Anno's excitement makes itself known with a vigorous tail-wag that batters at your face. Again you move the troublesome tail out of the way as your hands spread her cheeks wide, revealing the flushed red lips of her sex. Anno tries and fails to suppress an anxious whimper as your breath comes hot on her naked slit, fingers holding her cheeks wide open, just enough to give her the slightest hint of a gape.");

	output("\n\n<i>\"Mmmm. What're you...\"</i> Anno moans, her voice trailing off as you lean in, tongue darting out to lap at the sweet ambrosia glazing the lips of her sex. She gasps and fidgets, feet clawing at the ground in response to the sudden, pleasurable touch. You give one of her full cheeks a squeeze to calm her twitching leg, letting you concentrate on the pair of eager holes at hand. Your tongue probes in, gently parting the veil of her cunny only to be instantly greeted with an almost overpowering scent of sex and need as a trail of slime rolls out onto your delving [pc.tongue]. You shudder at the sweet taste of your lover's want, eagerly lapping up the sweet juices.");

	output("\n\nAnno shudders, moaning quietly as you start to eat her out. To your delight, you're soon joined by one of Anno's own hands as she reaches back between her legs to spread her lips wide for you, giving you unimpeded access to her honeypot. You reward the eager slut with a kiss right to the pleasure-buzzer, giving her another ecstatic shock that nearly ends with you getting a faceful of tail before you can bury yourself back between her cheeks. You can hear your lover moan and sigh as you start to really work your way into her, but your vision is completely blotted out by the two half-moons of ass in front of you, leaving you to navigate in darkness as your tongue probes deep into her womanhood, caressing the convulsing walls and lapping up her free-flowing juices as fast as you can. No matter how fast you slurp up her nectar, though, there's always more escaping by you, beading on your cheeks and chin until you feel like you've just dunked your head. Well, that's an ausar for you - you're soon nose-deep in a glistening delta of slime and excitement as her body reacts to your touches, preparing itself for a knotty ausar cock to spear her sex wide open");
	if(pc.hasKnot(x)) output(", and that's exactly what you're going to give it");
	output(".");

	output("\n\nSatisfied that your pooch's pussy is nice and ready for you, you rise back up and take hold of your [pc.cock " + x + "], dropping it into the spread hind cleavage of Anno's ass. Her breath catches when she feels your man-meat slap against her slick skin. You can feel her positively shiver with excitement, looking back at you over her shoulder with bated breath, awaiting your next move. You flash her a grin and rock your hips back, sliding your prick lengthwise through the lips of her cunt, barely suppressing a shudder as the slimy, wet slit reaches out to kiss your cock, smearing it with her ample juices. A few thrusts through that channel, and your [pc.cock " + x + "] is coated with a nice sheen of fem-lube, glistening in the dim light of Anno's store as you bring the [pc.cockHead " + x + "] to rest just barely parting the veil of her " + chars["ANNO"].vaginaDescript() + ".");

	output("\n\n<i>\"H-hold on,\"</i> Anno moans, leaning out of your embrace. You give her a questioning look, until she reaches under the counter and pulls out a sealed condom wrapper. With an understanding nod, you take the nanofiber sheath from its packaging and ");
	if(pc.cockVolume(x) < 400) output("slide it easily over your [pc.cock " + x + "].");
	else if(pc.cockVolume(x) < 900) output("spend a moment stretching the tight condom out over your oversized dong.");
	else output("spend a minute struggling to just encase the head of your massive prick in the human-sized sheath. Good enough!");

	output("\n\nWhen you're finished, Anno smiles appreciatively over her shoulder, wiggling her ass into the underside of your wrapped wang. <i>\"Come on then... I'm ready for you,\"</i> she breathes, her white tail raising invitingly as your sheathed schlong slowly slides forward.");

	output("\n\nAnno bites her lip, muffling a girlish whimper as your [pc.hips] rock forward, inching your [pc.cock " + x + "] into her sodden quim. You nearly join her as you feel your cock submerging into the sultry hole, surrounded by hot, wet, squirming walls as Anno's pussy clenches around your intruding member. You push forward despite her body's resistance, the ausar's incredibly wet sex making it unnaturally easy to spread her walls wide. Anno moans as you plunge deep into her sex, fingers digging into the lip of her desk, tail flicking madly as you bottom out inside her");
	if(pc.cockVolume(x) >= 500) output(", your tremendous cock stretching her out almost painfully wide, distending her gut against the hardwood of the desk");
	output(".");

	output("\n\n");
	if(pc.balls > 0) output("Balls ");
	else output("Hilt ");
	output("deep inside your bent-over lover, you give her a two-pronged slap on the butt, both hands dagging into the pert assflesh on display. Anno yelps playfully, and her vaginal muscles contract hard around your member, wringing tight enough that you can feel her quickening heartbeat through the grinding walls of her pussy. With a firm grip on Anno's hind-end, you drag yourself out of her slick slit, pleased to see your sheath slathered with her juices, so covered that it starts to drip onto the floor, pooling between your [pc.feet] - and with your cock withdrawn to the crown, even more of her fem-slime drools out of her pussy, a constant trickle down her thighs onto the deck.");
	if(pc.isAss()) output(" Maybe you'll have to make her clean up after herself after you're done with her....");

	output("\n\nFaster this time, you thrust back into Anno's still-gaping pussy. She gives a sharp moan as your [pc.hips] slap into her, leaving her ass bouncing with the impact and your [pc.cock " + x + "] buried back into that wonderful hole of hers, surrounded by spasming muscles as she recovers from the potent thrust. Again and again you thrust into her, working yourself up to a steady rhythm of pussy-pounding, occasionally punctuating your peaks with a sharp slap on Anno's jiggling butt or reaching up to cup one of her bouncing breasts, squeezing her stiff nips until she's screaming for more.");

	output("\n\nThanks to your recent orgasm and the minutes of pussy-eating that preceded your penetration, you're soon greeted by the howling cries of Anno's impending climax. You grin, slapping her cheeks and burying yourself deep inside your lover as she screams her pleasure, echoing in the store and down the corridors; her pussy clenches down hard, milking your [pc.cock " + x + "] for all its worth as she cums and cums, going crazy around your thrusting cock.");

	//if PC has a knot:
	if(pc.hasKnot(x))
	{
		output("\n\nWhile she's at the peak of her pleasure, you decide its time for the main course. With one last, mighty thrust of your hips, you slam the turgid ball of your [pc.knot " + x + "] into the sodden delta of Anno's drooling, orgasming sex. Her cries of pleasure crescendo into a high-pitched scream of shock and mind-wracking ecstasy as her cooch is forced open by your thick canid member. Your thrust pins Anno to the desk, spreading her legs and sex apart as you sink yourself into her, tying the two of you together.");
	}
	output("\n\nThanks to the wild, milking motions of Anno's cunt, you can feel your own orgasm rushing up to follow hers. You push your prick as deep inside your lover as you can, letting her still-spasming muscles do the work for you, squeezing and caressing your cock, slathering it with hot juices trapped inside her wanton hole by the thick cock spearing her, unable to escape. Your orgasm hits you like a hammer, giving you just enough time to let loose a feral roar of pleasure as a thick wad of cum surges up your [pc.cock " + x + "], blasting into the trap of the tightly bound sheath around it. You grunt and groan with the spasms, hips bucking against Anno's red-flushed ass as your load works itself out, eased along by Anno's own squirming walls.");

	output("\n\nChest heaving from exertion, you sigh heavily as your orgasm passes, contained in a now-bloated condom");
	if(pc.cumQ() >= 750) output(" that feels like a grapefruit stretching Anno wide from the inside");
	output(". For a moment, you let yourself lean forward, resting against Anno's back as the last shockwaves of pleasure pass through you");
	if(pc.biggestTitSize() >= 1) output(", pressing your tits against her back and letting her feel your every tiny motion against her sweat-sheened skin");
	output(". With a soft moan, Anno leans back and kisses you, letting you taste your last orgasm still clinging to her lips as she locks tongues with you. You reach under her, cupping her heaving bosom until she squeals with over-sensitivity as you pick her up and pull her down atop you, your bodies slinking down the back wall of the shop until you're sitting with Anno in your lap.");
	output("\n\n<i>\"Now </i>that<i> was a treat,\"</i> Anno purrs, nuzzling back against you. <i>\"Mmm... how about we stay like this for a little while, huh? I want to feel you go soft inside me.\"</i>");

	output("\n\nWell, that's one request you can't refuse....");
	processTime(20+rand(10));
	annoSexed(1);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Get Slurped
///{Va-jay-jay-type characters} Slurp-rise!
//[13:21] <Fenoxo> @Savin to stretch out F/F, I suggest some full body massage that turns into her jamming her nose into your cunt in licking, then scissoring, then sixtynining up the mess
function getSlurpedOnByAnnoz():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO_NUDE");
	userInterface.showName("\nANNO");

	output("Continuing to pet your ausar pooch, you figure that she's in for a very special treat indeed. Your hands slowly move down from her perky wolf-ears, starting to work at her shoulders and the base of her neck, massaging the taut skin underneath her slick catsuit of a uniform. Anno's voice curls into a murmur of curiosity, but once she feels your fingers going to work on her tense muscles, her tail resumes wagging happily, and she slowly relaxes in your grip.");

	output("\n\n<i>\"Oh yeah... you've got some magic fingers there, boss,\"</i> she sighs, resting her head in her arms. <i>\"Keep that up and I might have to put them to some real use.\"</i>");

	output("\n\n<i>\"I'm counting on it,\"</i> you answer. Now that she's laid out across the counter, you start to make your way downward, massaging down her back, occasionally stopping to stroke her soft, snowy hair. She moans, a tiny little whine of pleasure as you find a sensitive spot on her back and dig into it, working your way along her sides and ribs, to the swells of her breasts, pressed against the hardwood.");

	output("\n\nHer breath catches as your fingers brush the sides of her ample bust. To your delight, though, she recovers quickly, saying, <i>\"You sure you want to work through this suit of mine... maybe you could work a little better without it?\"</i>");

	output("\n\nNow she's talking. You nod and ease up, letting the ausar slip from your grasp - though she does nothing to keep your wandering hands from playing across her breasts as she stands up and takes hold of the zipper hidden in her collar. She puffs her chest out, making her big double-Ds strain against the elastic material of her uniform as she slowly, sensually slides the zipper down. It takes the better part of half a minute for the little metal clip to reach her chest, but the reward is well worth the wait as the pale tops of her tits come into sight, struggling to break free of their captivity. You can just see the faintest hint of a nipple poking through, the pink areola sliding out of the suit, when Anno wraps an arm around her chest in mock modesty, grinning at you.");

	output("\n\n<i>\"Oops, almost embarrassed myself,\"</i> she teases, turning on a heel to put her back to you. <i>\"How unprofessional of me... boss,\"</i> she adds, emphasizing the last word with a shuddering hiss as she pulls the zipper down past her navel, shrugging out of the sleeves and leaving herself totally topless.");

	output("\n\nNot done yet, Anno plants a hand on the wall behind her counter, hooking the other through her suit's belt. You watch appreciatively as she starts to pull her pants down, hips and tail both swishing gaily as she slowly pulls her waistline half way down the swells of her butt cheeks, letting her floofy white appendage pop free. It rises invitingly as she's forced to bend over to remove the rest of the suit, legs spread just enough to give you a glance at the glistening delta joining them, and a pair of heavy, full breasts hanging down from her chest as she pulls the suit down to her feet and slips out it, leaving herself bare but for the fur coating her lower limbs and the aura of need and desire practically radiating off her.");

	output("\n\nBare as an ausar can be, Anno sashays back to the counter and leans over it, finally revealing her bosom to you as it's all but in your face. She grins at you, watching your face as it's overcome with desire, eyes drawn to the luscious curves, the rises and falls of her breasts. <i>\"I think I know where that massage should start back up,\"</i> she hints, sliding up onto the counter and rolling onto her back, giving you easy access to her chest. With a pat on the wood beside her, she invites you in - and you're quick to oblige.");

	output("\n\nJoining her atop the counter, you straddle Anno's flared hips, resting your hands on the tops of her [anno.chest]. She moans softly, hands locking behind her head as she closes her eyes and surrenders utterly to you, willing you to act out your desires upon her vulnerable body. You don't need more than that to get you started, and soon your hands are wandering around the mountains of her breasts, rubbing and kneading and squeezing the bounty of boobflesh on display.");

	output("\n\nAs you start to hit the sensitive spots, working up towards her perky nipples or caressing the tender undersides of her chest, Anno twitches and squirms under your wandering hands, gasping and moaning as you roll a nipple between your thumb and forefinger, taking the other into your mouth. Her back arches at that, breath catching as your tongue rolls out across her stiff teat, suckling ever so gently.");

	output("\n\n<i>\"Don't stop...\"</i> Anno begs as you kiss your way down from her nipple, into the valley of her cleavage. With a heavy heart, you ignore her pleas, slowly working your way down her body. With a flick of your [pc.leg], you're facing downwards on her body, her splayed legs and bare pussy in easy reach. You brush your fingers through the downy patch of white fuzz sitting proudly atop Anno's slit, and are immediately rewarded with a moan of pleasure, her hands reaching up to grab your [pc.butt].");

	output("\n\nYou look over your shoulder, smiling playfully at her. <i>\"What was that about not stopping?\"</i> you tease, wiggling your [pc.butt] over her face, close enough to brush her nose with your crotch. She whimpers at that touch, and you see her tail stick straight out, alert and eager. Something in your mind ticks over <i>ausar sense of smell...</i> just as you feel Anno's fingers dig into your [pc.gear], pulling it off with a gusto. Now it's your turn to gasp and shudder as you're suddenly left bare to the world, soft-furred hands playing excitedly up your body.");

	output("\n\nIt doesn't take long, though for her probing digits to find the gash between your [pc.legs]. You stifle a moan as one of her fingers traces along the lip of [pc.oneVagina], only narrowly missing the bud of [pc.oneClit]. She puts just enough force on that digit to urge you back, until your [pc.vagina] is situated directly above her face, close enough that the tip of her cute little nose is nearly pressed between the folds of your sex.");

	output("\n\nAnno takes a deep breath, and sighs happily. <i>\"You smell amazing, boss,\"</i> she says, half-muffled in your muff. <i>\"Positively delicious...\"</i>");

	output("\n\nThat last \"s\" turns into a long, languid slurp through the channel of your [pc.vagina], her long, flat tongue reaching out to probe in past your lips, slipping past your defenses. You hold back a whimper of pleasure, back arching as you feel the ausar's tongue exploring you, teasing your sensitive slit's deepest recesses. Spurred on by her alien senses and instincts, Anno grabs your hips, pulling you straight down onto her face. Finally your barriers break down, and you find yourself moaning and ");
	if(pc.biggestTitSize() >= 1) output("cupping your [pc.chest]");
	else output("pinching your [pc.nipples]");
	output(", starting to rock your [pc.hips] over Anno's probing tongue, helping her wriggle it in ever deeper. Your moans turn a pitch higher as her fingers enter the picture again, a pair of digits finding easy access behind her tongue, spreading your walls wide.");

	output("\n\nYou'd almost forgotten what you were doing, thanks to Anno's expert oral skill. But the massage you promised isn't finished without a happy ending for your tail-lifting slut of a lover. You plant your hands on her thighs, giving her enough of a nudge to tell Anno to spread 'em wide. She answers with a slight moan and compliance, wrapping her long legs around the edges of the counter, wide enough that her cunt is ever-so-slightly agape before you even get to it. She's wearing her excitement on her thighs already, her pussy glistening with fem-lube as her body prepares for the fucking it expects. You lean down, getting a nice whiff of the potent sex aroma coming from her cunt, and almost immediately feel your mouth watering, eager for a taste of her sweet juices.");

	output("\n\nYou let your tongue play out, licking down the crest of Anno's thigh, getting your first taste of ausar pussy. Your tongue tingles at her taste, kissing up the little rivulets running across her leg toward her slit, making your way up until your lips brush hers, all but kissing Anno's cunt. Getting it straight from the source is too much to resist: before you know it, you're burying your face between your lover's legs, slurping away at the sweet sex. She moans, gasping as you brush your fingers across her clit, sending a visible shudder of pleasure up her quaking body. She answers with a deep thrust of her fingers into your own [pc.vagina], ramming them in to the knuckles as you tease her pleasure buzzer.");

	output("\n\nFingers, lips, and tongues working into each other, you and Anno settle into a comfortable pattern of kisses and pussy-spreading probes, eating each other out until Anno's face feels frenched with your mounting excitement, and she's sitting with her ass in a growing pool of femslime. You feel your chest heaving, diamond-hard [pc.nipples] dragged across the slick skin of Anno's belly with every breath, making even that simple act overwhelm you with pleasure. Your loins are a never-ending cavalcade of sensation as fingers plunge into you, a tongue slurps and slides along the lips of your [pc.vagina], and Anno's full lips suckle on your sensitive clit, making you shiver and groan, clenching down hard on her delving digits.");

	output("\n\nJust a little more.... You moan as Anno slides ");
	if(pc.vaginas[0].looseness() < 4) output("a third digit into your tight pussy");
	else output("the full length of her fist into your stretched-out, well-used cunt");
	output(", stretching you nice and wide with a few even strokes, punctuating each with a long lick across your labia and clit, again and again until your [pc.hips] are shaking on their own, whole body shuddering as you feel the budding hints of orgasm welling up from your well-fucked crotch.");

	output("\n\nYou surrender to your pleasure, mindlessly suckling the nectar deep in your lover's pussy as she brings you to climax. Your moan out a stuttering, <i>\"c-cumming!\"</i> when you do, voice breaking into a squeal as your [pc.vagina] spasms around Anno's probing tongue. Your world explodes in pleasure as you cum, raining femspunk onto Anno's face as your [pc.legs] clench around her, muscles recoiling from the overwhelming sensation. Still, your tongue is ceaseless in its pursuit of your partner's pleasure even in the face of your own, and before you've calmed down, it's Anno's turn to scream out her climax, voice echoing down the corridors as her pussy goes wild around your tongue buried to the hilt inside her. And she's a squirter, no doubt about it: you manage to pull back just in time to avoid a faceful of ausar girl-spunk as Anno cums, splattering the register and floor with her thick, aromatic love juice.");

	output("\n\nPanting with exhaustion and staggered by errant bursts of ecstasy in the afterglow of your lovemaking, you slump down, resting your head in in the soft, wet valley of Anno's thighs, trying to catch your breath. You can't stop a smile, though, as you see Anno's tail wagging happily, especially as you reach out and stroke the soft white appendage, sending another shiver of bliss through your lover as you rest in each other's arms.");
	processTime(30+rand(5));
	annoSexed(1);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Anal
//Note to Fen: If she doesn't already, Anno needs a tight, virgin asshole (right where it belongs). This scene can take her anal virginity, after which she'd be a little looser, but still tight as hell.
//{PC must have a cock that fits in Anno's heiny-hole} + 50%
function putItInAnnosButtYouSloot():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO_NUDE");
	userInterface.showName("\nANNO");
	var x:int = pc.cockThatFits(chars["ANNO"].analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("<i>\"Turn around,\"</i> you command, approaching the defeated ausar. She makes a show of rolling her eyes and turns on a heel, bracing her hands on another crate. Anno flicks her tail up, giving you a good view of her [anno.butt], the sheer material of her uniform stretched taut across her big, squishy cheeks. You step up and give one of those supple butt-cheeks a slap and squeeze, watching Anno's flesh jiggle at your touch; its owner gives a little hiss of pain when you spank her, but settles in with a little wag of her tail as you start to grope and knead her backside, clearly not all that put out about losing anymore. Indeed, she's outright moaning by the time you've worked your way to the other cheek, spreading them as far apart as her catsuit-uniform will allow.");

	output("\n\nWith a whimper of pleasure, Anno settles down atop the crate, ass in the air and wiggling happily as you feel up that perfect round ass. You can feel your own [pc.cock " + x + "] jumping to attention as you move directly behind your ausar lover, your crotch dangerously close to her rear end... if only it weren't for those troublesome clothes. With a little grin, you lean over her, your [pc.chest] pressing tight into Anno's back as your hands run up her sides, playing across her ribs and the ample curves of her bust. Anno moans lightly as your hands tease their way around her tits, her tail wagging hard between your [pc.legs]; she gasps when you finally find the zipper hidden in her collar and give it a little tug, your hand drawing the pull-tab slowly down until her suit's barely holding Anno's [anno.boobs] back. Finally, with a short, final tug, the ausar's breasts pop free of their constraints - and right into your waiting hands. Anno only just stifles a moan as your fingers squeeze her ample mounds, working her pert nipples between your fingers until you can feel a sudden surge of wetness soaking through Anno's catsuit and into your crotch. Oh, she likes that....");

	output("\n\nYou work the zipper further down, until you're able to pull the suit off of her and straight down her legs, letting it bunch into a pile between her furry feet. Anno gives a little gasp as you yank her clothes off, but her ass manages to ratchet higher in the air, her fluffy tail teasing at your nose, curling invitingly downwards. You let a hand reach back, following it down to the gap between her thick ass-cheeks. Your fingers easily find their way to her sodden quim, rubbing along the soaked expanse of her pussy. It isn't long before your digits are soaked in Anno's slick juices, coated with the thick, sweet excitement of your ausar lover. She groans as your fingers slip inside her, teasing the entrance to her womanhood, even the hood of her [anno.clit], making sure to slather yourself up with as much of her juices as you can scrounge up - which has the added effect of getting the horny ausar slut nice and ready, breath coming ragged as she's fingered deep, clearly expecting a nice cock to follow your fingers' course.");

	output("\n\nBut where's the fun in that? You won, after all. You deserve something special.");

	output("\n\nYou strip yourself out of your [pc.gear], letting your [pc.cock " + x + "] flop free into the crack of her ass, the crown just pressing into the base of her tail. Anno gives you a lusty grin over her shoulder and clenches down, momentarily trapping your prick between the taut cheeks. You give her ass a sharp slap, enough to make her yelp and let you go. Once you've regained control of your prick, you spend the next few moments slathering it in the readily-available juices on your fingers, only stopping to refresh your supplies in the rivers running down Anno's thighs.");

	output("\n\nSatisfied your [pc.cock " + x + "] is nice and wet, you move in toward your dark little prize, rubbing a few pussy-soaked fingers through the cleft of Anno's sex and up to the clenched ring of her ass.");

	output("\n\nAnno shrieks in alarm as one of your fingers presses in on her hole, almost achieving entry. <i>\"H-hey! What're you doing!?\"</i> she barks, voice breaking as you put a little more pressure on her ass, just enough to slide the first knuckle in.");

	output("\n\n<i>\"Stopstopstop,\"</i> she whines, her sharp nails digging into the crate, sphincter clenching tight on the intruding digit. <i>\"Wrong hooooole.\"</i>");

	output("\n\n");
	if(pc.isNice()) output("<i>\"Come on... you'll like it,\"</i>");
	else if(pc.isMischievous()) output("<i>\"Should have shot straighter,\"</i>");
	else output("<i>\"Deal with it,\"</i>");
	output(" you say, pushing your finger in a little more, stretching her out as best you can. Anno whines, tail tucking in until you can't see what you're doing anymore. With an exasperated sigh, you lift her snowy tail back out of the way and spread her legs a bit wider, giving you room to work. For her part, Anno shudders as you push another knuckle in, but makes no further move to stop your impending victory assfuck beyond clenching tight around your finger.");

	output("\n\nSlowly, you start to move your finger in and out, making sure to coat every inch of her tight passage with a nice, thick coating of fem-lube. You try to stretch her out, but just a little bit: gotta keep this hole nice and tight for the main event.");

	output("\n\nTo your surprise, Anno glances over her shoulder at you and gives a nervous half-smile, saying, <i>\"Go on already... stop teasing me and put it in.");
	if(chars["ANNO"].analVirgin) 
	{
		output(" Just be gentle... okay? It's... I've never had anything back there before...\"</i>\n\nWoah, what? Anno's never had anal before?");
		if(flags["FUCKED_SYRI_COUNT"] != undefined && flags["FUCKED_SYRI_COUNT"] != 0) output(" Hard to believe, considering her sister's a galactic buttslut of the highest order!");
		output(" Well, you suppose you can take it easy on her this time....");
	}
	else output("\"</i>");
	output(" You give Anno a reassuring nod, glad to see she's at least somewhat on board with the idea, and withdraw your finger. Her ass is left ever-so-slightly agape after your fingering, just enough to leave a little black hole winking at you as her body recovers. Before it can close, you bring your lube-slathered prick to bear, pressing the [pc.cockHead " + x + "] into the gaping well of her [anno.asshole].");

	output("\n\nAnno gives a quiet, mewling cry of mixed pleasure and pain as you gently press your [pc.hips] forward. Her back arches steeply, and you can see her nails digging trenches in the wooden crate as you slowly press your [pc.cock " + x + "] in. It's hard going at first, no matter how much lube you've applied: Anno's just so <i>tight</i> and is clamping down hard besides, slowing your entry to a crawl that seems little better than an inch per minutes. Still, that at least gives you time to savor the sensation: the feeling of her tight, clenching ring squeezing down on you, parting against its will as your cock demands entry, is divine. You grip her ass firmly, fingers sinking into her pliant flesh as you spread her cheeks as wide as you can; Anno even wiggles her legs wider, stretching the uniform bundled at her legs, doing everything she can to ease your entry.");
	pc.cockChange(true,false);

	output("\n\nFinally, you find yourself ");
	if(pc.cockVolume(x) > chars["ANNO"].analCapacity()) output("unable to progress, your oversized prick as deep in Anno's tight hole as you can force it");
	else output("pressing your crotch to Anno's backside, your cock fully sheathed inside her tight little asshole");
	output(". You stop yourself, giving Anno a few moments to adjust to your girth. While you do, you take a little pity on the trembling ausar, letting your hands roam across her sweat-slick body, cupping breasts and caressing curves. She slowly relaxes at your affectionate, comforting touches, even managing to let her tail wag hesitantly in the momentary calm. You lean in again, [pc.chest] against her back, and are welcomed with a brief kiss as Anno smiles at you over her shoulder.");

	output("\n\n<i>\"It feels weird,\"</i> she groans, even as one of her hands disappears between her legs. <i>\"It doesn't hurt much, though. I think... I think I'm okay if you start moving.\"</i>");

	output("\n\nMusic to your ears. You plant your hands on Anno's wide hips, holding your ausar lover steady as you slowly withdraw your [pc.cock " + x + "] from her bowels. You're greeted with another whine from her, but this time you're certain it's a sound of pleasure as she fingers herself, back arching and tail raising at the dual sensations vexing her twin holes. A little faster this time, you push back into her, reveling in the tightness and heat of her hole as it welcomes you back in, reforming to the shape of your intruding cock. At the peak of your thrust, Anno's tail shoots straight up and a low, guttural moan tears itself from her lips, a feral sound of pleasure.");

	output("\n\nTaking a chance, you give Anno a relatively tame smack on the ass, just enough to get her big cheeks wobbling... and nearly find yourself cumming as she clenches down impossibly tight, her every muscle going wild in response to your sudden assault. It takes every ounce of willpower to keep Anno from milking the cum right out of you, and even then you're left gasping for breath after the vice-like pressure relents from your [pc.cock " + x + "].");

	output("\n\n<i>\"Oooh, that felt good,\"</i> Anno purrs, tail flicking up to brush the tip of your nose. You catch the very tip in your teeth, giving it a playful shake - and feeling the ramifications in your cock as her ass jiggles in response. Shooting you a grin over her shoulder, Anno reaches back and grabs one of her own cheeks, holding herself open and inviting for you. <i>\"Keep it coming, boss. I'm starting to enjoy this...\"</i>");

	output("\n\nYou nod, and start to move again, pulling out and thrusting in again. You keep it slow at first, watching with marked interest while Anno's face contorts as you hilt her, only for her tongue to roll out in a lusty pant once she's left empty again. Another swat on the ass has her howling, at first a sharp cry of pain that quickly turns into a long, husky moan of sexual thrill. She clamps down on you again, but you've got her stretched out enough that even her crushing grip can't stop you; indeed, you start to piston your hips faster, moving up to a brisk pace that soon has Anno locked in an endless moan of bliss, barely able to support herself under the overwhelming sensation of your assfucking. The desire to cum is almost too much to bear.");
	processTime(15+rand(5));
	pc.lust(100)
	clearMenu();
	addButton(0,"Cum",cumInYerAusarShapedButtslot,undefined,"Cum","Go ahead and blow into Anno's ass like this.");
	addButton(1,"AnnoOnTop",cumWithAnnoOnTop,undefined,"Anno On Top","Suggest to Anno that she get on top until you blow in her ass.");
}

//Cum
function cumInYerAusarShapedButtslot():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO_NUDE");
	userInterface.showName("\nANNO");
	var x:int = pc.cockThatFits(chars["ANNO"].analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("No reason to hold back the inevitable. You give Anno one last slap on the ass and slam yourself deep inside, just in time to get the full effect of her muscles going wild around your cock, milking you for all you're worth. You don't try to resist your body's urges as Anno works you, instead reveling in the tightness of her quivering passage, savoring the warmth and wetness and exhilarating in the feeling of your cum rushing up through your [pc.cock " + x + "], hurtling into the dark embrace of Anno's bowels. Your whole body lurches forward when the first orgasmic wave of bliss hits you, nearly throwing you over as your own excitement is left to run rampant.");

	output("\n\nYour [pc.cock " + x + "] spasms as a thick load of [pc.cum] blasts out and into Anno's ass. She yelps at the sudden");
	if(chars["ANNO"].analVirgin) output(", unfamiliar sensation as she takes her very first load of spunk up the ass // sensation");
	output(", and her ass clenches even harder - you’re practically seeing stars as your [pc.cumNoun]-nozzle pumps her ass full of spooge. By the time you're done, you are gasping for breath, barely able to feel your dick, while Anno is stretched out over the crate, fingering herself as you recover.");

	output("\n\n<i>\"That wasn't so bad,\"</i> she admits as you withdraw from her, leaving a tiny trickle of seed drooling from her abused hole.");

	output("\n\n<i>\"I don't think I'd mind losing again, if that's your scheme, boss,\"</i> Anno adds with a wink as you stagger off, collecting your [pc.gear] and leaving her to finish herself off.");
	processTime(4);
	chars["ANNO"].analVirgin = false;
	if(chars["ANNO"].ass.loosenessRaw < 2) chars["ANNO"].ass.loosenessRaw = 2;
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Anno on Top
function cumWithAnnoOnTop():void
{
	clearOutput();
	author("Savin");
	userInterface.showBust("ANNO_NUDE");
	userInterface.showName("\nANNO");
	output("Time for a change of pace. Between hilt-deep thrusts into your ausar lover's spasming ass, you catch her attention with a gentle hair-pull and whisper into one of her towering canid ears, <i>\"What do you think about getting on top for a bit?\"</i>");

	output("\n\nAnno gives you a quizzical look before a small grin plays across her lips. <i>\"I can try,\"</i> she says, her voice trailing off into a little moan as you pull yourself out of her and saunter back, sliding down to sit against the other crate. Slowly, Anno stands up, taking her time to look over her shoulders at her backside, even reaching back to spread her cheeks - clearly for your benefit.");

	output("\n\n<i>\"God, I feel </i>loose<i> now...\"</i> she teases, turning on a heel and stepping out of her bunched-up uniform, long legs carrying her to you in a single stride. Another turn and a little bending gives you an faceful of ass, her big cheeks practically enveloping your [pc.face]. She gives her hips a wiggle, and you're immediately drawn into a reverse-motorboat as her cheeks rumble around you, blacking out your world in a haze of jiggling ass-flesh. You grab the ausar's big hips, trying to stop her, but only earn yourself a faceful of fem-lube from her overeager pussy as it grinds back against your face.");

	output("\n\nAnno only stops when she's good and ready - and you're good and filthy. Casting a wink over her shoulder, the snowy-haired babe shimmies down to her knees, planting herself just over your diamond-hard member, trapping the [pc.cockHead " + x + "] of your [pc.cock " + x + "] between the cheeks of her ass, kissing the rim of her still-open hole.");

	output("\n\n<i>\"Hold onto me,\"</i> Anno says, leaning forward and bracing her hands against your [pc.feet]. You do as she asks, locking your hands back on her hips and holding her steady as she slowly starts to descend onto your dick. A small groan escapes your lips as your cock compresses, squeezed smaller by the sheer grip of your lover's ass as she takes you. Anno moans, biting her lip as she tries to slide down your slick rod, but the going is slow again. Still, she's suddenly picked up a little motivation in the change of positions, and makes an effort to wiggle her hips for you, actively clenching and unclenching her muscles as she goes down, making it a truly pleasurable trip until you're buried as deep as you'll go into that sweet ausar ass.");

	output("\n\nAnno gives a groan, grinding her ass into your lap as she settles in, readjusting to your size inside her. You give her a moment, but before long find yourself pushing up against her full cheeks, urging her to start herself moving. <i>\"Okay, okay,\"</i> she says, steeling herself as she begins to rise, slowly dragging inch after inch of your member back through the wringing ring of her ass. Now it's your turn to wail, crying out as Anno slowly begins to bounce on your cock: with her taking the lead, lifting herself up and down all with her legs, her ass is almost painfully snug, making her work for every inch of cockflesh she gets. To ease her journey, you reach around the turgid length of your [pc.cock " + x + "] and slip a few fingers into the sodden slit of her sex, easily parting her pussy's lips to slide into the channel of her cunt. Anno lets out a surprised growl, clenching hard until you push another set of knuckles through her, firmly lodging your hand in her cunt. This time when she comes down on your rod, she's also getting a pussy-full of fist, stretching both her holes out until you can feel your hand almost caressing your cock, separated by only a thin wall of flesh. You're quickly rewarded by a fresh trickle of her feminine juices, flowing around your hand.");

	output("\n\nAnno flashes you a grin, and starts to move faster. With something to take her mind off the incessant pressure on her poor");
	if(chars["ANNO"].analVirgin) output(", virginal");
	output(" asshole, her movements becomes steadier, more confident, until it feels like she's finally hit her stride, riding you like a champ. Now, though, that familiar need begins to rise again in your loins, the nearly-averted orgasm from before coming back with a vengeance. You don't know if you can hold out again, but perhaps you don't need to for long: you can hear Anno's pleasured pants and gasps, her breath and heartbeat quickening as she gets truly into the quasi-double-penetration going on. Just a little more, and you might not be the only one who cums.");

	output("\n\nYou urge Anno faster, using your free hand to help lift her hind-end at the bottom of every bounce. Together, you're making a chorus of sexy goans and low, sensual moans, rising toward the inevitable crescendo as your orgasms both approach inexorably, rushing forward to the point of no return. With a final cry of pleasure, Anno slams herself down on your rod, taking you to the hilt and wrist at once, and that's all she wrote: you cum the moment you feel her cheeks press into your [pc.crotch], blasting her bowels with a double load of held-back cum; her muscles go wild when her climaxes moments later, milking your cock for every last drop as her pussy tries to swallow your fist, trapping you in her spasming channel as she unleashes a torrent of fem-cum that leaves a puddle spreading between your [pc.legs].");

	output("\n\nBreathing a sigh of relief, Anno collapses back into your arms, finally releasing your hand from the vice-like grip of her pussy. You wrap your arms around her, holding the ");
	if(chars["ANNO"].analVirgin) output("analy-deflowered ");
	output("ausar tight as she recovers from her ordeal. She leans back and plants a little kiss on your cheek, even as she reaches down and gives your wilting [pc.cock " + x + "] a tug, just enough to pull you out of her abused anus... and let a trickle of spunk drool back out of her gaping ring, splattering onto the floor.");

	output("\n\n<i>\"That wasn't so bad after all...\"</i> Anno murmurs, snuggling back against you. <i>\"Good thing I don't have to sit down to do my job.\"</i>");
	processTime(9);
	pc.orgasm();
	chars["ANNO"].analVirgin = false;
	if(chars["ANNO"].ass.loosenessRaw < 2) chars["ANNO"].ass.loosenessRaw = 2;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// {PC Must have a Grey Goo Sample on-hand}
function beginTheGoozookeningHas():void
{
	clearOutput();
	author("Savin");
	showBust("ANNO");
	userInterface.showName("\nANNO");
	
	output("<i>\"Hey, you're pretty techie, right?\"</i> you say by way of opening as you dig into your pack.");
	output("\n\nAnno shrugs. <i>\"Literal rocket scientist here, so... kinda? Whatcha need?\"</i>");
	output("\n\nYou pull out the vial of gray goo you extracted from one of the lusty mecha-babes and hand it over to Anno. <i>\"Think you could do something with this?\"</i>");
	output("\n\n<i>\"Gray goo?\"</i> she asks quizzically, looking the sample over. <i>\"Uh... I can burn it for you. I think I've got an incinerator unit around here somewhere...\"</i>");
	output("\n\n<i>\"Something </i>useful<i>,</i>\"</i> you correct, planting a defensive hand on the sample before she can toss it in the furnace.");
	output("\n\nShe shrugs. <i>\"Oh. Well... let me think. Uh, I guess I could try and refactor a goo-launcher to shoot grey goo. Would need to build a custom AI-reset in, something to reprogram the sample into crawling up something's cooch when you fire it. Plus I'd have to rebuild the magazine well, or just kajigger it to fire right from the vial. Tell you what, boss: gimme a goo-gun -- I sell them, but can't give it to you for free, sorry -- and a thousand credits for spare parts and I could probably whip something together.\"</i>");

	processTime(1);
	
	clearMenu();
	
	var pGoovolver:Goovolver = new Goovolver();
	
	if (pc.hasItem(pGoovolver) || pc.rangedWeapon is Goovolver)
	{
		if (pc.credits >= 1000)
		{
			addButton(0, "Upgrade", gimmeAGoozooka, false, "Upgrade", "Pay 1000 credits to upgrade your Goovolver into a Goozooka.");
		}
		else
		{
			addDisabledButton(0, "Upgrade", "Upgrade", "You need at least a thousand credits to upgrade your Goovolver.");
		}
	}
	else
	{
		var pGooCost:int = pGoovolver.basePrice * anno.sellMarkup * pc.buyMarkdown;
		
		if (pc.credits >= pGooCost + 1000)
		{
			addButton(0, "Upgrade", gimmeAGoozooka, true, "Upgrade", "Pay " + String(pGooCost + 1000) + " credits to buy a Goovolver and pay for the parts Anno needs to upgrade it.");
		}
		else
		{
			addDisabledButton(0, "Upgrade", "Upgrade", "You need " + String(pGooCost + 1000) + " credits to buy a Goovolver and pay for the parts Anno needs to upgrade it.");
		}
	}
	
	addButton(1, "Nope", annoMainMenu);
}

function gimmeAGoozooka(buyGoovolverToo:Boolean = false):void
{
	clearOutput();
	author("Savin");
	showBust("ANNO");
	userInterface.showName("\nANNO");

	output("<i>\"Alright! Now we're in business!\"</i> Anno grins as you hand over the goo-slinging revolver and the spare credits. <i>\"Just gimme a few minutes to do the work, alright?\"</i>");

	output("\n\nYou nod, and find something vaguely seat-worthy among the junk-piles lining the shop. Anno slips out through the backdoor, and into her workshop. Soon, you can hear the clanking and buzzing of her at work, though the minutes begin to drag on and on before she finally returns, carting what might, once, have been a goovolver. Now, though, it looks more like a grenade launcher, with a hugely oversized barrel and a break-action rather than a cylinder. A flickering computer has been bolted onto the side of the gun next to the trigger, with several flashing LED screens allowing you to program your gooey projectiles.");

	output("\n\n<i>\"Try this on for size,\"</i> Anno smirks, handing the heavy weapon over. <i>\"Just make sure you actually have enough gray goo canisters, boss. This thing can't shoot galotian charges anymore.\"</i>");

	if (silly)
	{
		output("\n\n<i>\"Where did the ones already loaded in there go?\"</i> you ask her whilst taking stock of the weapon for yourself.");
		
		output("\n\n<i>\"Shh. No questions now. Only dreams.\"</i>");
	}

	// Take da fee
	var pGoovolver:Goovolver = new Goovolver();
	
	if (buyGoovolverToo == false)
	{
		pc.credits -= 1000;
		if (pc.hasItem(pGoovolver)) pc.destroyItem(pGoovolver, 1);
		else if (pc.rangedWeapon is Goovolver) pc.rangedWeapon = new Rock();
	}
	else
	{
		var pGooCost:int = pGoovolver.basePrice * anno.sellMarkup * pc.buyMarkdown;
		pc.credits -= (pGooCost + 1000);
	}
	
	pc.destroyItem(new GrayMicrobots());

	pc.createKeyItem("Goozooka", 0, 0, 0, 0, "This modified Goovolver was built by the ausar tech specialist Anno Dorna for you. Rather than normal galotians, this heavy cannon fires vials of gray goo at your enemies, re-programmed to go straight for an enemy's most sensitive spots. Consumes a vial of gray goo per shot!");
	output("\n\n<b>(Key Item Gained: Goozooka -</b> This modified Goovolver was built by the ausar tech specialist Anno Dorna for you. Rather than normal galotians, this heavy cannon fires vials of gray goo at your enemies, re-programmed to go straight for an enemy's most sensitive spots. Consumes a vial of gray goo per shot!<b>)</b>");
	
	processTime(15);
	
	//[Try on Anno] [Leave]
	clearMenu();
	
	// I'm implying that Anno left the sample you gave her loaded into the thing
	addButton(0, "Try on Anno", goozookaRaepsForAnnoButts);
	addButton(1, "Leave", mainGameMenu);
}

function goozookaRaepsForAnnoButts():void
{
	clearOutput();
	author("Savin");
	showBust("ANNO");
	userInterface.showName("\nANNO");

	//{+Mischevious, -1 Goo Sample}
	pc.addMischievous(1);
	pc.destroyItem(new GrayMicrobots(), 1);

	output("When Anno turns to get back to her job, you quietly break open the back of your new goo-launcher and slot in the vial of goo. With a mischievous grin, you level the cannon at Anno's hind end and flick the button on the computer beside the trigger.");

	output("\n\nHearing the little 'click', Anno turns to look at you... just in time to see you pull the trigger. There's a loud pneumatic hiss as the gun discharges, sending a big gray blob straight at Anno's ass. She shrieks as she's slammed up against the wall by the impact, and then again as a tiny gray googirl coalesces right on the little bubble of her butt sticking back through her catsuit.");

	output("\n\nA tiny voice cheers, <i>\"Oooh! You're cute... wanna fuck?\"</i> before the gray goo drills her way through the ass of Anno's uniform and vanishes from sight. Anno immediately goes rigid, eyes wide and tail sticking straight out as the little goo finds something sensitive under that suit of hers and gets to work. You lean back and enjoy the show as Anno desperately wiggles her way out of her uniform's top, trying to get out her bottom before you can <i>see</i> the blob of a googirl squirming around her hip and into her pussy. There's a momentary pause before Anno goes cross-eyed and flops down onto the counter, helpless but to moan and wiggle her hips as the goo takes advantage of her.");

	output("\n\nOh yeah. This is gonna be fun.");

	processTime(2);
	
	pc.lust(10);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

function insideSteeleTechPostPlanetCrack():Boolean
{
	clearOutput();
	author("Savin");
	showBust("ANNO");
	userInterface.showName("\nANNO");
	//Inside Descriptor (First Time)
	if(flags["MET_ANNO"] == undefined)
	{
		output("The inside of the shop is an absolute wreck. Piles of junk are scattered around in complete disarray, wall panels and lighting fixtures are hanging by threads of loose wire, and sparks occasionally fly from tears in the bulkhead. The shop clearly took a beating when the ship went orbital.");
		output("\n\nA snowy-haired ausar woman is moving between the wreckage with a clipboard, apparently trying to reorganize the battered shop. She’s clad in the skin-tight black and yellow uniform Dad issued a few years ago. It hugs her curves nicely, even if her bushy white tail is hiding her backside from view.");
		//Meeting Anno First Time AFTER PlanetCrack
		addButton(0,"Ausar",firstTImeAnnoPostPlanetCrackNeverMetTheBitchBeforeIunnoWhatsUpWithThisFunctionName);
	}
	//Inside Descriptor (Repeat)
	else
	{
		output("The Steele Tech shop is a bigger wreck than ever; it’s more of a death trap than a storefront now. Piles of junk are scattered around in complete disarray, wall panels and lighting fixtures are hanging by threads of loose wire, and sparks occasionally fly from tears in the bulkhead. The shop clearly took a beating when the ship went orbital.");
		//{PC has met Anno before, first time back in the shop:}
		if(flags["MET_ANNO_POST_SPLOSION"] == undefined)
		{
			firstTimeBackAfterPlanetSplosionsButMetAnnoBefore();
			return true;
		}
		output("\n\nAnno is sitting behind a counter with a compact holdout pistol and a bottle of whiskey shamelessly placed atop it. She grins weakly at you. <i>\"Hey, boss. What's up?\"</i>");
		addButton(0,"Anno",repeatAnnoApproach);
	}
	return false;
}

//Meeting Anno First Time AFTER PlanetCrack
//[Ausar]
function firstTImeAnnoPostPlanetCrackNeverMetTheBitchBeforeIunnoWhatsUpWithThisFunctionName():void
{
	clearOutput();
	author("Savin");
	showBust("ANNO");
	userInterface.showName("\nANNO");
	output("You step closer to the ausar woman, clearing your throat to get her attention. She looks up with a start, turning to face you. <i>\"Oh thank God! Pleeeaaassse tell me you're the company rep coming in to tell me I can get off this bucket! Pleasepleaseplease!\"</i>");
	output("\n\n<i>\"Woah, slow down,\"</i> you start as the snowy-haired ausar goes all puppy-dog eyed at you.");
	output("\n\n<i>\"Wait, no, shit!\"</i> she says, leaning in and sniffing at you. <i>\"Holy shit! You're... you're not Victor's kid, are you?\"</i>");
	output("\n\nYou nod.");
	output("\n\n<i>\"I'M SAVED!\"</i> she cheers, rushing up and throwing her arms around your neck. <i>\"I thought you guys had forgot about me out here, but I get the CEO in person! And... and wait.\"</i>");
	output("\n\nThe ausar woman picks up her datapad and scrolls through it hurriedly. <i>\"Shit. That memo, right... You're not here to get me out of here, are you?\"</i> she sighs, shoulders slumping. <i>\"Sorry about that, boss. Shouldn't have gotten my hopes up. I'm the planetary manager for your dad's company. Well, not PLANETARY anymore, huh? Uh, anyway.\"</i>");
	output("\n\n<i>\"By the way: we all got the memo after Victor passed on. I can give you a fair discount on our public inventory, but otherwise we're to treat you just like anyone else until otherwise notified.\"</i>");
	output("\n\nShe hesitates a moment before tucking the pad under her arm and putting a surprisingly familiar hand on your shoulder. <i>\"Sorry about your old man, by the way. The 'verse is a lesser place without him. The name's Anno, by the way,\"</i> she says, extending a fluffy hand to you. <i>\"Anno Dorna. Planetary manager for the company here.\"</i>");
	flags["MET_ANNO_POST_SPLOSION"] = -1;
	flags["MET_ANNO"] = 1;
	processTime(2);
	annoMainMenu();
}

//{PC has met Anno before, first time back in the shop:}
function firstTimeBackAfterPlanetSplosionsButMetAnnoBefore():void
{
	author("Savin");
	showBust("ANNO");
	userInterface.showName("\nANNO");
	output("\n\nYou've barely made it through the door to the Steele Tech shop when you hear the tell-tale click of a gun leveling at you. Your eyes go wide when you see Anno behind the counter, a pistol aimed square at your chest.");
	output("\n\nA tense moment passes... before Anno lowers her weapon. <i>\"Shit, boss. I thought you were dead,\"</i> she sighs, holstering her sidearm on her hip and collapsing against the back wall. <i>\"I saw you go out, right before... fuck.\"</i>");
	output("\n\nAnno shakes her head, looking out of the shop window to the debris-cluttered corridor. <i>\"Sorry. I'm just... I'm glad you're alright, [pc.name].\"</i>");
	output("\n\nYou fully enter the shop, and ");
	//if notsex'd anno:
	if(annoSexed() > 0) output("put a reassuring hand on the ausar girl's shoulder");
	else output("sweep Anno up into a tight hug. She goes rigid in your arms a moment, surprised, before relaxing into your embrace");
	output(". <i>\"Thanks.\"</i>");
	output("\n\nShe sighs and sits back behind the counter. <i>\"So. Something tells me the planet rush is just about over for Tarkus.\"</i>");

	//if Nice:
	if(pc.isNice()) output("\n\n<i>\"Ouch,\"</i>");
	else if(pc.isMischievous()) output("\n\n<i>\"What makes you say that?\"</i>");
	else output("\n\n<i>\"No, really?\"</i>");
	output(" you answer.");

	output("\n\n<i>\"What's there to even come here for, now? I thought it was a shithole before, but now... the planet's gone, and the raskvel don't have shit to offer aside from cockshines for the galaxy. Damn it, I might as well pack up shop. Fuck your dad, and fuck this post. I want to go home!\"</i>");
	output("\n\nAfter a moment of pouting, she groans, <i>\"I don't suppose you need a warp-field expert on your crew, boss? Hell, I can do mechanical engineering, too. Just get me the fuck off the tub before it vents us all into space. I'm begging you!\"</i>");
	flags["MET_ANNO_POST_SPLOSION"] = 1;
	processTime(3);
	//Join Crew or Hold Up
	clearMenu();
	// addDisabledButton(0, "Join Crew", "Join Crew", "Whoah there, space cowboy! This encounter isn't coded yet.");
	addButton(0, "Join Crew", joinCrewPlanetCrackerVersion, undefined, "Join Crew", "Invite Anno to join your crew.");
	addButton(1, "Hold Up",holdOnAnno,undefined,"Hold Up","You aren't ready to take her on as crew just yet.")
}

function joinCrewPlanetCrackerVersion():void
{
	clearOutput();

	author("Savin");
	showBust("ANNO");
	showName("\nANNO");

	output("“<i>So, you want off this rust bucket?</i>” you ask, leaning over the counter. ");
	
	output("\n\nAnno perks up, ears and tail twitching. “<i>W-what? Really?</i>”");
	
	output("\n\nYou nod. “<i>I could use an engineer of your caliber, you know.");
	if (pc.isNice()) output(" And I feel bad about my dad’s company just leaving you here, even after the planet exploded and all.");
	output(" Besides, you’re not doing the company much good in a shop nobody visits.</i>”");
	
	output("\n\n“<i>Hey, I-</i>” Anno starts to protest, stopping when you give her a knowing wink. “<i>... I guess you’re right! But I can’t get Corporate to approve my transfer requests, boss. I’d LOVE to come with you, but unless you’ve gotten the whole CEO thing sorted out, I’d lose my job. Not that I exactly have a high job satisfaction right now or anything, but I like not being homeless, too.</i>”");

	clearMenu();
	// [Nevermind] [Help Her] [She Wants It]
	addButton(0, "Nevermind", annoMainMenu, undefined, "Nevermind", "Not right now.");
	addButton(1, "Help Her", joinCrewPlanetCrackerVersionHelpHer, undefined, "Help Her", "You'll be CEO some day. You'll just give Anno her job back later - and better!");
	addButton(2, "She Wants It", joinCrewPlanetCrackerVersionSheWantsIt, undefined, "She Wants It", "Play on Anno's desires. She wants off this rock, and you want the cute little ausar bitch aboard your ship. Everybody wins.");
}

function joinCrewPlanetCrackerVersionHelpHer():void
{
	clearOutput();

	author("Savin");
	showBust("ANNO");
	showName("\nANNO");
	
	pc.addNice(1);

	output("“<i>Hey, come on,</i>” you say with a smile. “<i>I’m going to be the C.E.O. of the whole damn company soon. I’ll just give you your job back when I finish Dad’s quest. In the meantime, you can stay on my ship.</i>”");
	
	output("\n\n“<i>R-really?</i>” she says, eyes lighting up. “<i>You mean it?</i>”");
	
	output("\n\nYou nod.");
	if (pc.isNice()) output(" “<i>Cross my heart.</i>”");
	
	output("\n\nBefore you can blink, Anno’s lunged over the counter, arms wrapped around your neck. “<i>Thankyouthankyouthankyou!</i>” she cries, squeezing you tightly enough that you start to choke. “<i>Holy shit you’re the best boss ever!</i>” ");
	
	output("\n\nShe finally lets go before you start seeing stars, grinning from ear to ear. “<i>You won’t regret it! I promise! I’m going to get my things - I’ll meet you on the ship, alright?</i>”");
	
	output("\n\nYou nod as Anno vanishes, scurrying off to her quarters.");
	
	//{PC is put back in hall outside Steele Tech. Can no longer access shop.}
	flags["ANNOS_SHOP_CLOSED"] = 1;
	flags["ANNO_CREWMEMBER"] = 1;
	clearMenu();
	addButton(0, "Next", move, "212");
}

function joinCrewPlanetCrackerVersionSheWantsIt():void
{
	clearOutput();

	author("Savin");
	showBust("ANNO");
	showName("\nANNO");

	pc.addMischievous(1);

	output("“<i>Come on, Anno,</i>” you say, smiling. “<i>You want off this rust bucket, don’t you?</i>”");
	
	output("\n\n“<i>Y-yeah, but-</i>”");
	
	output("\n\n“<i>Then what’s the problem? You’re not a slave to the company. You can do whatever you want. If you want to come with me on awesome adventures, then quit this stupid desk job and get your things.</i>” ");
	
	// PC hasn’t fucked Anno
	if (!annoSexed())
	{
		output("\n\nShe thinks about it for a long moment, chewing her lip, tail tucked between her legs. Finally, she sighs. “<i>I... I can’t do that, [pc.name]. God, I want to, but... Victor put me here for a reason. I can’t just quit. Not after everything he’s done for me.</i>”");
	
		output("\n\nYou sigh, but nod your understanding. Maybe you need another approach.");
		
		// Back to talk menu
		clearMenu();
		addButton(0, "Next", annoTalkMenu);
	}
	else
	{
		// PC HAS fucked Anno
		output("\n\nShe thinks about it for a long moment, chewing her lip, tail swishing faster with every passing moment. Finally, she grins up at you. “<i>For any other spacer, coming in here to sweep me off my feet, I’d tell ‘em to get fucked. For you... well, maybe you can get fucked too,</i>” she winks playfully, leaning in over the counter to give you a good look at her ample chest. ");
		
		output("\n\n“<i>Alright! Let’s do it, boss. You and me against the stars!</i>” Anno grins, extending a hand. You firmly shake it. “<i>I’ll go get my stuff, boss. Meet you ship-board!</i>”");
		
		output("\n\nYou nod as Anno vanishes, scurrying off to her quarters. ");
		//{PC is put back in hall outside Steele Tech. Can no longer access shop.}
		clearMenu();
		flags["ANNOS_SHOP_CLOSED"] = 1;
		addButton(0, "Next", move, "212");
	}
}

//Hold On
function holdOnAnno():void
{
	clearOutput();
	author("Savin");
	showBust("ANNO");
	userInterface.showName("\nANNO");
	output("<i>\"Keep your chin up, Anno,\"</i> you say, patting the miserable scientist between her big, fluffy ears. <i>\"You've got a job to do.\"</i>");
	output("\n\n<i>\"Ugh. I know,\"</i> Anno sighs, but still nuzzles her head up against your palm. <i>\"I'm just scared, boss. We lost some people when the boat went orbital. Lost that little bat kid. A fuckin' kid, [pc.name]. I swear to God I heard her getting sucked out when we lost atmosphere.\"</i> She shudders. <i>\"I don't want to be next. This clanker is barely holding together. I mean, it crashed for a reason, right?\"</i>");
	output("\n\n<i>\"Shit. Nevermind me, boss. I'm a big girl, I'll take care of myself. Anyway, you came here for something, or just to check on me?\"</i>");
	processTime(1);
	annoMainMenu();
}

function joinCrewPlanetFineVersion():void
{
	clearOutput();
	author("Savin");
	showBust("ANNO");
	showName("\nANNO");

	output("“<i>So, Anno,</i>” you say, leaning up against the counter. She looks");
	if (player.tallness > anno.tallness + 6) output(" up");
	else if (player.tallness < anno.tallness - 6) output(" down");
	output(" at you, ears perking. “<i>What would you saying about leaving this rust bucket behind?</i>”");
	
	output("\n\n“<i>What do you mean?</i>” she asks, cocking her head to the side. “<i>Did Corporate finally approve my transfer request?</i>” ");
	
	output("\n\nYou chuckle. “<i>Not exactly. What I’m saying is: come with me. I’ve got room for one more on my ship, especially someone with your talents");
	if (annoSexed()) output(", not to mention looks");
	output("</i>”");
	
	output("\n\nShe grins. “<i>Ah, wish I could, boss. But that memo made it pretty clear that I can’t give you");
	if (annoSexed()) output(" too much");
	output(" special treatment. I certainly can’t just run away with you, romantic as that might be. I’d lose my job in a heartbeat. Besides, who’d man the shop - the interns?</i>”");
	
	output("\n\n“<i>You have interns?</i>”");
	
	output("\n\n“<i>Exactly!</i>”");
	if (annoSexed())
	{
		output(" She sighs, rubbing her temples. “<i>Look, boss, I’d like to come with you. I really would. But Corporate would have my ass if I left, and I don’t feel like being out of a job - even a job here on a backwater shithole.</i>”");
	
		output("\n\n“<i>Ah,</i>” you say, a bit saddened by the rejection.");
	
		output("\n\nAnno blanches at your reaction, her ears and tail all tucking down as she frowns. A moment later, though, she gets a coy grin and leans in as if to whisper. “<i>Actually,</i>” she starts, voice seductive and dripping with sexuality. “<i>I’ve been doing some very delicate work. Classified work. But if you helped me finish, then... I’d have no reason to stick around on Tarkus, and Corporate might approve my transfer. To your ship.</i>”");
	
		output("\n\n“<i>Oh?</i>” ");
	
		output("\n\n“<i>Mmhm,</i>” she says, still grinning. “<i>Let me know if you’re interested, boss - but get your things in order first. It could be dangerous.</i>”");

		if (pc.isMischievous() && pc.libido() >= 66) output("\n\n“<i>I love a dangerous woman.</i>”");
		flags["ANNO_MISSION_OFFER"] = 1;
	}
	
	// {Take player to talk menu proper. Add "Mission"}
	clearMenu();
	addButton(0, "Next", annoTalkMenu, undefined);
}

function joinCrewMissionComplete():void
{
	clearOutput();
	author("Savin");
	showBust("ANNO");
	showName("\nANNO");

	output("“<i>So what’s the verdict?</i>” you ask, leaning over the counter toward Anno. ");
	
	output("\n\nShe beams at you, her bushy tail swishing happily behind her. “<i>Corporate just got back to me, actually. Let’s just say they’re </i>very<i> pleased with the outcome. They’ve got some eggheads from R&D en-route to start going through Nova’s gray goo research");
	if (flags["DECK13_GRAY_PRIME_DECISION"] == 1) output(", and they’ve got the first cyber-bodies in tow, too. Should be able to transfer the captain and deck officers within the day");
	output(". I forwarded some of my preliminary analyses of the gray goo, and we’ve started talking about product applications. Projections are hopeful, " + pc.mf("Mr.", "Ms.") + " Steele.</i>”");
	
	output("\n\n“<i>And?</i>”");
	
	output("\n\n“<i>And...</i>” Anno says, turning her holoterminal around so you can see it. “<i>I have an approved transfer notice, roving merchant credentials, and inter-systems weapons licenses coming through now. In other words, we’re good to go!</i>”");
	
	output("\n\nYour lover hops over the counter and throws her arms around your neck, squeezing you tightly. Laughing happily, you embrace the eager ausar and grab a handful of her jiggly butt through her catsuit until she squeals with delight. ");
	
	output("\n\n“<i>Alright, alright, let me get my things,</i>” Anno says, slipping out of your grasp with a wink. “<i>I’ll meet you up at your ship, alright?</i>”");
	
	// PC is put back in hall outside Steele Tech. Can no longer access shop.

	flags["ANNOS_SHOP_CLOSED"] = 1;
	flags["ANNO_CREWMEMBER"] = 1;

	currentLocation = "212";

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

function annoTalkAboutDaMission():void
{
	clearOutput();
	author("Savin");
	showBust("ANNO");
	showName("\nANNO");

	output("“<i>Alright,</i>” you say, leaning across the counter toward the eager ausar. “<i>Let’s talk about this work of yours.</i>” ");
	
	output("\n\n“<i>Alright! Now we’re talking!</i>” Anno beams, waving you around the counter and booting up her holoterminal. You step up beside Anno, and are greeted by the sight of a highly detailed 3D projection of what could only be the <i>Nova</i> itself. It truly is a massive ship, now that you can see it in full: longer than a Coalition dreadnought and twice as thick around. Anno’s rigged the display to show power distribution, heat spread, and other various technical minutiae");
	if (pc.characterClass = GLOBAL.CLASS_ENGINEER || pc.IQ() >= 0.75) output(", but one thing stands out immediately to you: there’s a huge energy draw coming from somewhere in the bowels of the ship");
	output(".");
	
	output("\n\n“<i>You see it, right?</i>” Anno says, jabbing a white-furred finger into the display, towards");
	if (pc.characterClass = GLOBAL.CLASS_ENGINEER || pc.IQ() >= 0.75) output(" the");
	output(" a");
	output(" section of the ship that seems to be drawing an inordinate amount of power. “<i>Nobody lives there. There’s nothing. It doesn’t even show up on any of the raskvel maps, and they’ve been just about everywhere. I had to crack open old hard-copy schematics from the bridge just to find power lines and air ducts going there, and reconstructed my digital layout from that. It’s a ghost deck, completely off the radar. Deck 13.</i>”");
	
	output("\n\n“<i>A ghost deck?</i>”");
	
	output("\n\nShe nods, and presses a button that zooms your view close in on the deck, giving you a cross-section view of it. “<i>It’s an old, old Earth custom, I found out. Skipping floor 13 on buildings, decks on ship. Unlucky number. Nobody even noticed it wasn’t there: Deck 13 in the stair wells and elevators just leads to a mechanical closet, every time. Nothing to look at but old tools. But in the center of the deck? There’s something MASSIVE drawing power from all over the ship.</i>”");
	
	output("\n\n“<i>Alright. So what? What’s that got to do with your work?</i>”");
	
	output("\n\nAnno fidgets. “<i>Well... I don’t know, honestly. I don’t even know WHY I’m here, except that your dad wanted me here. But I can guess: this ship is human, very, very old, and very, very advanced for what it is. My best guess is that the </i>Nova<i> was a generation ship: basically what we all did before the warp gates came around. Load a bunch of people up in a ship with lots of supplies and catapult them towards a habitable star system. But where’s the crew? The </i>Nova<i> was a ghost ship before it crashed, as far as I can tell: no bodies, nothing. And every computer and databank on the ship is either deadlocked or wiped.");
	
	output("\n\n“<i>Something </i>happened<i> to the crew, boss. Something bad.</i>”");
	
	output("\n\nShe sighs and turns off the display. “<i>Listen. My girlfriend Kaede and I went poking around in a chunk of the </i>Nova<i> that broke off on impact. A big section of the ship. And there was... something inside it. Something alive, or close enough to it. I’ve got some theories, boss, but... I need to see what’s on that ghost deck to be sure. Help me get in there, and we’ll find out what really happened to the Nova. You in?</i>”");

	//[I'm In] [Not Yet]
	clearMenu();
	addButton(0, "I'm In", annoMissionNotYet);
	addButton(1, "Not Yet", )
}

function annoMissionNotYet():void
{
	clearOutput();
	author("Savin");
	showBust("ANNO");
	showName("\nANNO");

	output("“<i>Not right now.</i>”");
	
	output("\n\n“<i>O-oh,</i>” Anno says, tail tucking downward. “<i>Right. Sure. No problem. Lemme know if you change your mind.</i>”");

	clearMenu();
	addButton(0, "Next", annoTalkMenu);
}

function annoMissionImIn():void
{
	clearOutput();
	author("Savin");
	showBust("ANNO");
	showName("\nANNO");

	output("“<i>Alright. I’m in,</i>” you say, extending a hand to Anno.");
	
	output("\n\n“<i>Fuck yeah!</i>” she grins, shaking it. “<i>Come with me; I think I have a way in. Though it’ll be tricky.</i>”");
	
	output("\n\nAnno quickly gathers a few things before you leave: a compact little holdout pistol, which she tucks into her boot; a heavy-duty grappling gun and rope; and a small set of tools from under her desk. Loaded up like a proper adventurer, she gives you a thumbs up and leads the way out of the shop and up towards the hangar deck...");

	flags["ANNO_MISSION_OFFER"] = 2;

	// [NEXT]
	clearMenu();
	addButton(0, "Next", move, "DECK 13 AIRLOCK");
}

function annoBonusCombatAttackShit():void
{
	//	Anno has the following attacks/abilities in all combats:
	// Add to combat view:
	output("\nAnno’s crouched just over an arm’s length away, her compact holdout held close at a low-ready as she waits for an opportunity to fire. Her bushy tail is tucked in tight, ears lowered against her head as she moves from cover to cover, ducking around incoming attacks.\n");

	// Targetting Computers
	// Increases player accuracy temporarily
	if (rand(4) == 0 && !pc.hasStatusEffect("Sensor Link"))
	{
		annoSensorLinkBuff();
	}
	// HP Boost
	// Restores 10% HP.
	else if (pc.HP()/pc.HPMax() <= 0.5 && !pc.hasStatusEffect("HP Boost CD"))
	{
		annoHPBoost();
	}
	// Sneak Attack
	else if (foes[0].hasStatusEffect("Stunned") || foes[0].hasStatusEffect("Blind"))
	{
		var bonusDamage:int = anno.level * 2;
		if (foes[0].hasStatusEffect("Stunned") && foes[0].hasStatusEffect("Blind"))
		{
			bonusDamage += anno.level;
		}

		annoRegularAttack(bonusDamage);
	}
	// Regular attack
	else
	{
		annoRegularAttack();
	}
}

function annoSensorLinkBuff():void
{
	output("\nAnno levels her left wrist at");
	if (foes[0].plural) output(" one of");
	else output(" the");
	output(" " + foes[0].short + "and taps a key on her tiny computer. A visible targeting reticle forms around your opponent");
	if (foes[0].plural) output("s");
	output(", linking up with your own equipment in the process. <b>Accuracy increased!</b>\n");

	pc.createStatusEffect("Sensor Link", 5, 0, 0, 0, false, "Radio", "Anno has linked her equipments targetting systems with yours, improving your combat accuracy.", true, 0);
}

function annoHPBoost():void
{
	output("\nAnno runs up to you and passes her wrist computer over your shoulder, uploading an advanced program to your onboard microsurgeons. Your wounds start to knit together in no time!");

	var hpGained:int = pc.HPMax()*0.1;

	output(" <b>Gained " + hpGained + " health!</b>\n");

	pc.HP(hpGained);

	pc.createStatusEffect("HP Boost CD", 5, 0, 0, 0, true, "", "", true, 0);
}

function annoRegularAttack(bonusDamage:int = 0):void
{
	output("\nAnno levels her holdout pistol and fires off a quick shot");

	if (rangedCombatMiss(anno, foes[0]) output(", though she misses her target.");
	else
	{
		output(", landing a solid hit");
		if (foes[0] is GrayPrime || foes[0] is GigaGoo) output(" on the goo");
		else output(" on one");
		output("!");

		if (bonusDamage > 0) output(" Her attack is super-effective while her target is incapacitated!");

		genericDamageApply(14 + bonusDamage, anno, foes[0], GLOBAL.KINETIC);
	}
	output("\n");
}

function deck13AirlockFunc():Boolean
{
	if (flags["DECK13_AIRLOCK_ENTERED"] == undefined)
	{
		flags["DECK13_AIRLOCK_ENTERED"] = 1;

		clearOutput();
		author("Savin");
		showBust("ANNO");
		showName("\nANNO");

		output("The grappling gun CLANGs against the outer hull, and a moment later you and Anno are rocketing up the side of the ship towards the mysterious Deck 13. You come to a stop level with an old, rusty airlock. It’s at just such an angle that it would be invisible from the surface, and small enough to not be spotted at range.");

		output("\n\n“<i>I knew it,</i>” Anno says, pulling up her map of the ship on a wrist computer. “<i>Here we are. Deck 13, and nowhere near any of those maintenance closets. Something’s on the other side of this hatch, boss. Something that doesn’t want to be found.</i>”");

		output("\n\nShe pulls a small wire from her wrist and plugs it into a dim readout beside the airlock. A moment later, the display flickers to life, beeping weakly as Anno restores power to it. “<i>Almost.... got it!</i>” she says, quickly followed by a pneumatic hiss as the hatch slides open. ");

		output("\n\n“<i>Alright, we’re in!</i>” she cheers, leaping from the grappling gun’s rope and into the airlock. You follow close behind, soon finding yourself choking on centuries’ worth of kicked-up dust. You cover your mouth and wave your arms through the thick mist until it finally settles down. ");

		output("\n\n“<i>Doesn’t look like anybody’s been this way for an age,</i>” Anno says. Even as she speaks, though, she draws the holdout from her boot and racks the slide. “<i>Come on. The power drain is coming from the north.</i>”");

		clearMenu();
		addButton(0, "Next", mainGameMenu);

		return true;
	}
	else
	{
		author("Savin");
		showBust("ANNO");
		showName("\nANNO");

		if (flags["ANNO_MISSION_OFFER"] == 2)
		{
			output("\n\nAnno is poking around among the space suits, muttering to herself about the age of everything here.");

			addButton(0, "Space Suits", annoSpaceSuits);
		}
		return false;
	}
}

function annoSpaceSuits():void
{
	clearOutput();
	author("Savin");

	output("You lean in close to examine the space suits sitting idle on the side of the airlock. There's a dozen of them, all in pristine condition for their age. Each bears the <i>Nova</i>'s emblem proudly on its breast, as well as a smaller set of markings indicating that the spacers who would have worn these were citizens of the United States of America, sponsored by the Bell-Isle/Grunmann corporation.");

	output("\n\n“<i>Either of those names sound familiar to you?</i>” Anno asks, squinting at the I.D. plates. “<i>I recognize the second one, at least: those gray-goo creatures outside. If you muck around in their programming, they insist they were made by Bell-Isle/Grunmann. Maybe... maybe they were part of the ship’s original cargo? But why the hell would anyone take gray-goo into space?</i>”");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

function deck13SecurityFunc():void
{
	if (flags["DECK13_SECURITY_ENTERED"] == undefined)
	{
		clearOutput();
		author("Savin");
		flags["DECK13_SECURITY_ENTERED"] = 1;

		output("As you make your way out of the airlock, you're suddenly blinded by a bright white light. You flinch, trying to regain your senses as a booming metallic voice shouts: \"<i><b>INTRUDERS DETECTED. PASSENGER REGISTRY: UNAVAILABLE. IDENTITIES UNCONFIRMED. LAY DOWN YOUR WEAPONS OR YOU WILL BE PURGED</i></b>.\"");

		output("\n\nYour vision finally clears, revealing the unmistakable sight of security droids beneath an array of spotlights, each packing a laser pistol aimed right at you. \"<i>What the fuck?</i>\" Anno gasps, \"<i>How the... how the hell are a bunch of droids still functioning? Shit... looks like they're not kidding!</i>\"");

		output("\n\nBefore you can react, Anno squeezes the trigger of her sidearm. An almost silent crack echoes through the corridor, and one of the droids crumples to its knees. The others instantly start squeezing their triggers, hurling red bolts of energy downrange at you! ");

		clearMenu();
		pc.createStatusEffect("Annoquest Helper AI", 0, 0, 0, 0, true, "", "", true, 0);
		addButton(0, "Fight!", startCombat, "securitydroids");
		return true;
	}
	else
	{
		author("Savin");
		output("\n\nAnno is scanning the destroyed droids, salvaging what remains of their onboard systems for Steele Tech.")

		return false;
	}
}

function securityDroidAI():void
{
	if (!pc.hasStatusEffect("Blind") && rand(5) == 0) securityDroidFlashbang();
	else if (!foes[0].hasStatusEffect("Blind") && !foes[0].hasStatusEffect("Stunned") && rand(3) == 0) securityDroidChargeShot();
	else securityDroidLaserBarrage();
}

function securityDroidLaserBarrage():void
{
	//Laser Barrage
	//Lots of moderate laser attacks
	output("\nSeveral of the drones lock onto you and let loose with a hail of laser bolts.");
	
	var attacks:int = 2 + rand(2);

	for (var i:int = 0; i < attacks; i++)
	{
		rangedAttack(foes[0], pc, true, 1);
	}
	processCombat();
}

function securityDroidChargeShot():void
{
	//Charge Shot
	//Two moderate laser shots (as above) + one HEAVY one
	output("\nAmid several other drones lighting you up, one steps to the forefront, its laser pistol glowing red-hot as it charges up a power shot!");

	rangedAttack(foes[0], pc, true, 1);
	rangedAttack(foes[0], pc, true, 1);

	// Heavy attack
	if (rangedCombatMiss(foes[0], pc))
	{
		output(" You tumble to the side, ducking out of the way just in time to avoid a face-melting energy blast");
		if (silly) output(" to the, uh, face");
		output(".");
	}
	else
	{
		output(" You stagger back as the heavy laser bolt slams into your chest, burning into your defenses and leaving you smoking like a sausage!");

		genericDamageApply(30, foes[0], pc, GLOBAL.LASER);
	}

	output("\n");
	processCombat();
}

function securityDroidFlashbang():void
{
	// Flashbang
	// Blind, possibly Stun attack
	output("\nOne of the drones pulls a small, cylindrical grenade from its slender steel hip and lobs it at the pair of you!");

	if(foes[0].aim()/2 + rand(20) + 6 > pc.reflexes()/2 + 10 && !pc.hasStatusEffect("Blind"))
	{
		pc.createStatusEffect("Blind",3,0,0,0,false,"Blind","Accuracy is reduced, and ranged attacks are far more likely to miss.",true,0);
		output(" You aren’t able to shield yourself in time as the flash grenade goes off with a deafening BANG, leaving you <b>blinded</b>!");
	}
	else
	{
		output(" You cover your eyes just in time to avoid the flash as the stun grenade goes off with a deafening BANG!");
	}
	processCombat();
}

function lossToSecurityDroid():void
{
	// PC and Anno Lose to the Droid
	clearOutput();
	author("Savin");
	showName("LOSS:\nSEC. DROIDS");
	showBust("SECURITYDROIDS");

	output("You hear a horrible scream to your side. You pause in your fight just long enough to look, and see Anno crumpled on the ground, motionless. Oh, no.... You turn back, grabbing your [pc.rangedWeapon] to take the murderous drones down... only to see one of their gun barrels leveled at your forehead.");

	output("\n\n<i>ZAP</i>.");

	output("\n\n<b>Game over.</b>");

	clearMenu();
	addDisabledButton(0, "Game Over", "Game Over", "Roll credits etc.");
}

function victoryOverSecurityDroid():void
{
	// PC and Anno Wreck the Droids
	clearOutput();
	author("Savin");
	showName("VICTORY:\nSEC. DROIDS");
	showBust("SECURITYDROIDS");

	output("“<i>FuckyoufuckyouFUCKYOU!</i>” Anno screams while firing her gun again and again into the last droid standing. It shudders and stumbles back under the impacts as her shots blow through its armored skeleton. She fires until the gun clicks empty, and still keeps pulling the trigger of the empty handgun until the robotic aggressor finally collapses, utterly destroyed.");

	output("\n\nHesitantly, you put a hand on Anno’s shoulder. She just about jumps out of her skin, and for a moment, you’re glad her gun’s run empty. Anno takes a deep breath and pulls you close, into a tight hug. “<i>Fuck, [pc.name]. I didn’t... holy shit, they were going to KILL us.</i>”");

	output("\n\n“<i>We got ‘em first, though,</i>” you answer, ruffling the hair between her perky ears. ");

	output("\n\n“<i>Yeah. We did,</i>” she says, not quite smiling. Anno pulls a fresh magazine out and reloads her handgun before tucking it away again.");
	if (pc.IQ() >= 0.75 || pc.characterClass == GLOBAL.CLASS_MERCENARY) output(" For such a little gun, it sure seemed to pack a punch... and was suppressed, too. Might be worth a look some time.");

	genericVictory();
}

function deck13ArmoryFunc():void
{
	if (flags["DECK13_ARMORY_ENTERED"] == undefined)
	{
		clearOutput();
		author("Savin");
		output("“<i>An armory? I guess that makes sense on a big ship like this,</i>” Anno says as you approach the door. Unlike most doors on the ship - and across the galaxy - it doesn’t slide out of the way when you step up. You just about hit your face against it.");
		
		output("\n\n“<i>Must be bolted from the inside. Mechanical lock, not digital,</i>” she adds while poking at the console beside the door. It refuses to activate. “<i>Sorry, boss, forgot to bring my lockpicks with me. Hmm... hey, check it out,</i>” she says, pointing up.");
		
		output("\n\nYour eyes follow her up to the ceiling. And an air vent.");

		clearMenu();
		if (pc.tallness < 5 * 12 && !pc.isTaur())
		{
			output(" “<i>Think you can get through there, boss? I’ll give you a boost.</i>”");
			addButton(0, "Get Boost", deck13GetBoosted);
		}
		else
		{
			output(" “<i>Think you could give me a boost up there, boss? I’m small enough; might be able to crawl through and hop down inside.</i>”");
			addButton(0, "Boost Anno", deck13BoostAnno)
		}

		if (pc.characterClass = GLOBAL.CLASS_SMUGGLER)
		{
			addButton(1, "Pick Locks", deck13ArmoryPickLocks);
		}
		else
		{
			addDisabledButton(1, "Pick Locks", "Smugglers probably carry the kind of tools around for this kinda job...");
		}

		addButton(2, "Leave", move, "DECK 13 SECURITY CHECKPOINT");

		return true;
	}
	else
	{
		author("Savin");

		output("Anno is poking around in the robotic guards, murmuring to herself about their manufacture.");
	}

	if (flags["DECK13_TAKEN_PISTOL"] == undefined || flags["DECK13_TAKEN_RIFLE"] == undefined) addButton(0, "Weapon Racks", deck13WeaponRacks);
	addButton(1, "Robots", deck13Robots);

	return false;
}

function deck13ArmoryPickLocks():void
{
	clearOutput();
	author("Savin");

	output("“<i>You might have forgotten,</i>” you say, pulling out your lockpicks. “<i>I don’t leave home without ‘em.</i>”");
	
	output("\n\n“<i>Oh. Well, uh, go ahead,</i>” Anno says, waving you forward. You crouch down in front of the lock and slide your picks home, moving them with expert skill born out of years of training in the U.G.C.’s underbelly. And you thought Dad making you get a job was dumb... ");
	
	output("\n\nThe lock clicks, and the door slides open. “<i>There we go!</i>” you announce, sliding your picks back into your pocket and stepping through.");

	deck13ArmoryEntry();
}

function deck13BoostAnno():void
{
	clearOutput();
	author("Savin");

	output("“<i>Alright,</i>” you say, locking your fingers just under the vent. “<i>Up you go.</i>”");
	
	output("\n\n“<i>Right. Glad I didn’t wear a skirt,</i>” she jests with a grin, stepping up into your hand and scrambling up to the vent. She quickly pulls the grating off, tosses it aside, and crawls in. The last thing you see is Anno’s feet and tail wriggling as she squirms her way into the vent.");
	
	output("\n\nA moment passes. A long moment. ");
	
	output("\n\nJust as you’re starting to get worried, yet hear a loud CLICK from the door, followed by loud rusty squeal as the old door slides open. Behind it, Anno’s beaming. “<i>Fuck yeah! Teamwork!</i>” she cheers, following up her exclamation with a high five.");

	deck13ArmoryEntry();
}

function deck13GetBoosted():void
{
	clearOutput();
	author("Savin");

	output("“<i>Alright, boost me,</i>” you say. Anno laces her fingers together and does so as soon as you hop up into her hand, lifting you up over her shoulder to the vent. She passes you up a screwdriver from her kit, which you’re able to use to handily remove the grate. With that gone, you slip up into the air vent. Cramped as it is, your slight build enables you to easily squirm through the claustrophobic, dusty vent; a minute later, you come to another grate leading straight down past the door. You shift forward, kick the grate out, and plummet to the ground. ");
	
	output("\n\nThe door’s right there, and is indeed bolted from this side. You pull the lock, and are instantly greeted by a rush of light from the corridor. “<i>Everything go alright, boss?</i>” Anno asks, looking at your now-dust-covered visage.");

	deck13ArmoryEntry();
}

function deck13ArmoryEntry():void
{
	output("\n\nWith the door open, you turn your attention to what’s in the room as Anno flips the lights on. When they come on, you just about have a heart attack: there are a dozen robots in here, just like the ones from outside! ");
	
	output("\n\nBut they’re not moving. When the initial <i>oh shit</i> moment passes, you realize that they’re just shells: empty, deactivated droids hanging from what amounts to meat hooks from the ceiling, waiting for orders. Probably waiting for centuries. ");
	
	output("\n\n“<i>Hell of an armory,</i>” Anno says, poking at one of the dusty chrome husks. “<i>There are a few dozen of ‘em in here... don’t suppose you need a robot army, boss? Or, more accurately, I don’t suppose the </i>Nova<i> does? My guess is these shells are tied to the onboard computers. Basic white blood cells of a starship. Better keep them offline for now, unless you want another fight.</i>”");

	//[NEXT] to room description
	flags["DECK13_ARMORY_ENTERED"] = 1;
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

function deck13WeaponRacks():void
{
	clearOutput();
	author("Savin");

	output("You step up to the weapon racks at the back of the room. There are several weapons bolted to the wall, but a few are lying out, just ripe for the taking...");

	clearMenu();
	if (flags["DECK13_TAKEN_PISTOL"] == undefined)
	{
		addButton(0, "Nova Pistol", function():void
		{
			flags["DECK13_TAKEN_PISTOL"] = 1;
			quickLoot([new NovaPistol()]);
		});
	}

	if (flags["DECK13_TAKEN_RIFLE"] == undefined)
	{
		addButton(1, "Nova Rifle", function():void
		{
			flags["DECK13_TAKEN_RIFLE"] = 1;
			quickLoot([new NovaRifle()]);
		});
	}

	addButton(14, "Back", mainGameMenu);
}

function deck13Robots():void
{
	clearOutput();
	author("Savin");

	output("You step up to the squads of robotic guards on standby, hanging from the ceiling by hooks in their backs. The ship is probably supplying them with a bit of power; they seem to be functional and in great condition for their age, but are just... inactive. If you had some serious tech, you could probably reactivate them under your control: you’d need a secure long-range wireless network, an A.I. taskmaster, and more. <b>Well outside the scope of your work for now.</b>");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

function deck13ElevatorFunc():void
{
	if (flags["DECK13_COMPLETE"] != undefined)
	{
		clearOutput();
		output("You step up to the elevator and press the call button. Immediately, the doors slide open, but no car comes. ");
		
		output("\n\n“<i>Someone must have done an override,</i>” Anno says with a shrug, peering into the elevator shaft. “<i>Keeps anybody from accidentally wandering through. I think this one goes right up to the docking bay... yeah, it goes right by the shop, too. Maybe we can hitch a ride when we’re done here -- I’m pretty good at getting around lockouts like this.</i>”");

		clearMenu();
		addButton(0, "Next", move, "DECK 13 SECURITY CHECKPOINT");
		return true;
	}
	else
	{
		output("You're in the central elevator shaft, looking out into the empty security checkpoint. This can take you back up to the main floor of the <i>Nova</i>, or up to the docks.");
		addButton(0, "Docks", move, "???"); // Need an elevator "room" to add near the docks -- there's words about a non-functional elevator up there
		addButton(1, "Main Deck", move, "???"); // Dunno where this would shit you out.
		return false;
	}
}

function deck13ReactorRoomFunc():void
{
	variableRoomUpdateCheck();
	if (flags["DECK13_REACTOR_DOOR_OPEN"] == undefined)
	{
		output("\n\nNot far past the security checkpoint is a long tunnel marked “<i>Secondary Reactor Bay.</i>” The way forward, however, is sealed: a huge blast door has slid down, blocking your passage.");
		
		output("\n\n“<i>There’s a loose access panel over there,</i>” Anno says, pointing it out. “<i>Might be able to squeeze through there.</i>”");
	}
	else
	{
		output("\n\nThis corridor runs between the elevator checkpoint and the reactor deck below. The door is now open, allowing easy access between the two points of interest. ");
	}
	return false;
}

function deck13VentAccessShaftFunc():void
{
	//First time PC attempts access
	output("\n\n“<i>Alright, let’s see what we’ve got here,</i>” Anno says, grabbing the loose panel hanging off of the hull. “<i>Might be able to squeeze through all the wires. Heh, reminds me of working on the warp gates back at Akkadi. For such huge fucking things, you’d be amazed how cramped they are. Wires everywhere, have to bend over all the time when you’re working. Not that I mind bending over for work, if you know what I mean,</i>” she says with a wink, yanking the panel off and tossing it up against the wall. It clangs and clatters as it drops, the sound echoing through the chamber. ");

	output("\n\nAnno winces at the commotion, covering her big ears. When it finally dies down, she peeks into the shaft. “<i>Yeah, I think I can get through there. Let me just-</i>” she starts to say, before the back of the access panel explodes. You stumble back, covering your eyes as shrapnel goes flying and... and a great big fucking gray hand reaches up through the hole, grabs Anno by the head, and sucks her through like a noodle. She doesn’t even have time to scream.");

	output("\n\nHoly fuck.");

	clearMenu();
	addButton(0, "Jump In", move, "DECK 13 SHIELD CONTROL");
}

function deck13ShieldControlFunc():void
{
	if (flags["DECK13_SHIELD_CONTROL_ENTERED"] == undefined)
	{
		flags["DECK13_SHIELD_CONTROL_ENTERED"] = 1;

		output("Oh shit, oh shit, oh shit. “<i>ANNO!</i>” you scream, leaping through the hole in the bulkhead and into the darkness below...");
		
		output("\n\nYou land with a splash. You feel like you fell forever, that you should have splattered all over the deck below... but instead, you scramble up amid a floor full of... shit, you can’t see! The room’s pitch-black, but you <i>feel</i> something gel-like squirming around your [pc.feet], as if you’d landed in a pool full of gelatin. It’s only a few inches deep, though, and you’re able to stand without too much trouble despite being bit unsteady with this squirming goop all around you, below your [pc.feet]. ");
		
		output("\n\n“<i>Anno!</i>” you repeat, desperately flailing your hands around in the dark.");
		
		output("\n\n“<i>Here!</i>” the ausar answers from not that far away. The room echoes with your voices and the squelching sound of footsteps over the goop on the ground. “<i>This gooey shit broke my fall.... I’m alright, boss.</i>” ");
		
		output("\n\n“<i>Hey, who’re you calling shit?</i>” an indignant third voice pouts. ");
		
		output("\n\n{If Silly: “<i>Oh, shit,</i>” Anno says.}");
		
		output("\n\nSuddenly, the lights blast on full-force, nearly blinding you once again. As you squint and recoil, a silvery, goo-like girl drops down from the ceiling, plopping wetly onto the deck. {If PC has encounter Grey Goo before: “<i>You instantly recognize the familiar, silvery figure of a gray goo... but this one is different. More human. It stands on two long, well-formed legs that run from a pair of tall boots up into a knee-length skirt of goo it’s grown around itself, with a tight blouse tucked into it -- also made of goo -- that strains against a pair of perky, large breasts that aren’t nearly as comically over-stated as her sisters’ are. Her hair is almost real-looking, with fully textured individual strands running down her back in a tight ponytail. If it weren’t for the swirling, moving gray sheen that makes up her entire body, she could easily pass for a human woman, maybe twenty five years of age. Young, tall, athletic, almost grave.</i>”");
		
		output("\n\nelse, new para.");
		
		output("\n\n“<i>Gray goo!</i>” Anno snaps, drawing down on the feminine figure before you. You cock an eyebrow, also drawing your [ranged.Weapon]. “<i>They’re all over Tarkus, boss. Try and drain you dry of sex-juice. But they’re normally all big-titted bimbos. This one’s... different,</i>” she says, looking the creature up and down. ");
		
		output("\n\nIt stands on two long, well-formed legs that run from a pair of tall boots up into a knee-length skirt of goo it’s grown around itself, with a tight blouse tucked into it -- also made of goo -- that strains against a pair of perky, large breasts that aren’t nearly as comically over-stated as her sisters’ are. Her hair is almost real looking, with fully textured individual strands running down her back in a tight ponytail. If it weren’t for the swirling, moving gray sheen that makes up her entire body, she could easily pass for a human woman, maybe twenty five years of age. Young, tall, athletic, almost grave.}");
		
		output("\n\n“<i>It’s almost human,</i>” Anno says, staring at the goo. Then, louder, “<i>Sorry sweetheart, we’ve got work to do. Go molest somebody else.</i>”");
		
		output("\n\n“<i>Almost human? Jeez, what’d I ever do to you...</i>” the goo scowls, crossing her arms under her rack; her whole body jiggles slightly as she takes a step forward. “<i>Now who the fuck are you, exactly?</i>”");
		
		output("\n\nAnno blinks. “<i>Anno Dorna. This is [pc.name] Steele. We’re looking into a power draw from this deck.</i>”");
		
		output("\n\n“<i>Ah,</i>” the goo says, her scowl softening into an almost-apologetic frown. “<i>Honestly, I’m surprised nobody noticed before now. It’s been an age.</i>”");
		
		output("\n\nShe sighs, reaching down into the sea of... of gray goo around your feet. So that’s what that was. From the gunk on the floor, the goo-girl draws a long, straight-edged saber as if from thin air, the goo around you forming into the weapon as she draws it. “<i>I’m sorry about this. Really, I am.</i>”");
		
		output("\n\nAnno doesn’t hesitate for a second. She squeezes the trigger of her handgun, sending a bullet straight through the goo’s head. It splatters like a watermelon, smearing across the bulkhead behind her in a wet rain of gooey brain-matter. The rest of her body staggers forward, slumps to its knees, and flops to the ground. In the blink of an eye, it dissolves into the goo on the deck. ");
		
		output("\n\n“<i>Bitch,</i>” Anno spits, starting toward the consoles flickering around the room. “<i>Fucking weird. I’ve never seen a goo act like that before. She was smart. Way smarter than the ones outside.</i>”");
		
		output("\n\n“<i>I’ll take that as a compliment,</i>” the goo’s voice says, as if from all around you. ");
		
		output("\n\nYou spin on a heel, coming face to face with the goo again as she rises from the sea of gray behind you, reforming with her head quite intact and a deadly look in her steel-gray eyes. ");
		
		output("\n\nUh-oh. ");

		clearMenu();
		pc.createStatusEffect("Annoquest Helper AI", 0, 0, 0, 0, true, "", "", true, 0);
		addButton(0, "Fight!", startCombat, "grayprime");
		return true;
	}
	else
	{
		if (flags["ANNO_MISSION_OFFER"] == 2) output("\n\nAnno is slumped against one of the bulkheads, catching her breath after the fight with the gray prime.");

		addButton(0, "Shields", deck13Shields);
		addButton(1, "Breach", deck13Breach);

		if (flags["DECK13_SAMPLES_TAKEN"] < 3) addButton(2, "Goo Sample", deck13GooSample);

		return false;
	}
}

function grayPrimeAI():void
{
	//Basic combat routine: She focuses on her sword-swings at first. As she falls in HP or starts to build up lust, she'll proc Lust Clones and Tentacles more often, though still mostly relying on physical attacks. 
}

//Goo Sword
function grayPrimeGooSword():void
{
//One heavy physical attack
	output("\nThe gray goo adapts an almost-textbook duelist's pose before she lunges at you, her razor-sharp saber cutting through the air towards your neck! Her first thrust drives you and Anno apart, cutting neatly between the two of you. Even as Anno riddles the goo's back with bullets, the monstrous woman pirouettes and brings her blade back around at you.");

	if (combatMiss(foes[0], pc))
	{
		output(" You duck back, evading the goo's sword strike. Before she can swing again, Anno gets a shot off, blasting the goo's sword into pieces... only for it to reform a moment later, once you're safely away.")
	}
	else
	{
		output(" You duck back just in time, turning what might have been a mortal blow into a stinging graze. She isn't playing around!");

		var damage:int = foes[0].damage(false) + foes[0].aim()/2;
		damage *= (100 + (15-rand(30))/100;
		genericDamageApply(damage, foes[0], pc, GLOBAL.KINETIC);
	}
	processCombat();
}

//Goo Grapple
function grayPrimeGooGrapple():void
{
//Restrain attack. Inflicts Lust over time.
	Suddenly, the sea of gray erupts around you! A half dozen thick, squirming gray tentacles surge up from the deck, lashing out at your limbs!
	//Hit: Two of the tentacles wrap tightly around your wrists{, while two more grab your legs, lifting you up from the ground! //elseif taur// while the rest grapple your inhuman lower half, raising you up from the deck until your [pc.legs] are dangling}. Another tentacle emerges, squirming toward your mouth; others crawl across your body, seeking out your other hole{s}. Across the room, Anno is suffering the same fate, tendrils of gray wrapping around her limbs, tearing at her sheer catsuit to get at her pussy and tits. 
	//Miss: Just as the tentacles are about to grab you, half of them explode in showers of goop as Anno levels her gun at them, firing dangerously close to your head. You duck as the others writhe and retreat under a hail of fire.

	//PC Doesn't Escape: The tentacles around you tighten, their tips pressing through your lips and squirming through your [pc.gear]. One slips down and rubs its slippery, hard tip against the ring of your [pc.asshole], demanding entry. "Just relax," the goo-girl leers, content to watch for now. "This doesn't have to be so bad for you."
	//PC doesn't Escape 2: You give a cry of pain as one of the tentacles slips into your ass, squirming through your anal ring and into the tightly clenched passage. Another tendril of gray slips between your [pc.legs], caressing your {[pc.cock] /andor/ [pc.cunt]}, rubbing against the tender flesh. "Don't struggle," the goo coos, "Just let it happen..."
	//PC doesn't Escape 3: Fuuuuck! The tendril in your ass is going wild, squirming like mad through your sensitive passage as its twin{s} molest your sex{es}, {[one] wrapping around your cock like a forceful hand} {while another is} {slipping into your [pc.cunt], spreading you wide on the thick, gooey rod}. "There we go," the goo-girl says, hands planted on her hips. She moans softly as her tendrils fuck you. "Oh, that's good... just like that... give me all your juices. God, it's been so looong."
	//PC doesn't Escape 4+: The tentacles continue to molest you, holding you tightly as they fuck you like a sex puppet!

	//PC Escapes: Finally, you tear yourself off the tentacles, flopping down onto the layer of gooey coating that covers the deck. The goo scowls, raising her sword again. "Damn it. Why won't you just go down!" she shrieks. "I don't want to kill you, but if you won't surrender, then I swear I will! What I'm doing is too important!"
}

//Force Punch
function grayPrimeForcePunch():void
{
	//One moderate physical, chance of knockdown
	The goo-girl leaps forward, her off-hand visibly enlarging and hardening as she hurtles toward you for what's going to be a world-rocking punch!
	Hit: Her fist slams into you like a freighter, cracking into your face and sending you plummeting to the ground. Oh, fuck, that hurt! [PC is knocked down]
	Miss: You knock her fist aside at the last moment, letting her momentum carry her through to the deck. Just when she tries to rise up, Anno leaps in with a roundhouse kick that takes the bitch's head clean off! Of course, she reforms a moment later across the room, looking no worse for wear. 
}

//Lustful Clones
function grayPrimeLustfulClones():void
{
	//The Gray Prime creates 1d4+1 stripper clones. Each makes a light lust attack each turn until destroyed. Basically Mirror Image but worse. 
	The goo-girl takes a step back from you and Anno, dropping her sword and instead moving her fingers up to the buttons on her blouse, pulling them apart with a flourish to let her ample rack bounce free: two perfectly formed, glistening wet orbs of nanomachine flesh that look too good to not squeeze and grope. "Why don't you just surrender? I could use a few tough new sources of lubricant..." she teases, shifting to emphasize her cleavage and jiggling it at you. As she does so, several mounds of gray goo arise from the deck, slowly forming into new goo-girls. Each is a near-perfect clone of the first, though butt-naked and with greatly overstated busts, hips, and asses, all of which are almost cartoonishly big. The new girls smile and shake what their programmer gave them, wiggling their hips and cupping their tits at you.

{Add to Combat Descript: "There are X Lust Clones remaining, teasing you with their bountiful gray bodies, all but inviting you to just drop everything and submit to pleasures of the flesh!"}
{Add button to menu: "Attack Clone"}
}

//Clone Tease Attack
function grayPrimeCloneLustAttack():void
{
	One of the lust clones shakes her hips and titties at you, trying to entice you into sex! {You resist her advances! // +X Lust!}
}

//Attack Clone
function grayPrimeAttackLustClone(target:Creature):void
{
You leap forward and punch one of the lust clones teasing you. She gives a terrified gasp as you attack her, though one hit is easily enough to splatter her brainpan across the deck. The lifeless goo corpse collapses into the sea of gray, absorbed back into the mass. 
}

//Attack on Anno
function grayPrimeAttackAnno():void
{
//Chance to disable help from Anno for a turn
	The goo turns her attention from you to your companion. Anno takes an unsure step back, leveling her gun at the goo and firing as it advances. The goo-girl dodges with inhuman ability, crumbling to dust where Anno shoots, only to reform inches from the ausar!
	//Hit: The gray goo's hand lashes out, grabbing Anno by the neck and slamming your companion up against the bulkhead, choking her. Anno thrashes out, punching the goo square in the face... only for its face to deform around her fist, letting it pass straight through and hardening around it, trapping Anno's hand. "Almost human, was it? I'LL SHOW YOU ALMOST HUMAN!"
	//Miss: Anno leaps out of the way as the goo-girl lunges for her! "Bitch!" the goo shouts. "I'm not almost human! I'M MORE HUMAN THAN YOU ARE."
	"I'm an ausar, you stupid cunt!"

Anno Grappled:
	Anno struggles against the gray goo's assault, trying to escape her death-grasp.

Next Turn, Anno's action:
	"Anno finally brings her gun to bear and fires, pumping her entire magazine into the goo\'s tits. The gray body explodes in a rain of goop, only to reform a moment later across the room as Anno slams a new mag into her holdout. \"I\'m fine, I\'m fine!\" Anno groans, rubbing at her throat, now visibly bruising."
}

function victoryOverGrayPrime():void
{
	// HP Victory
	if (foes[0].HP() <= 1 && flags["GRAY_PRIME_DEFEATED_VIA_HP"] < 2)
	{
		if (flags["GRAY_PRIME_DEFEATED_VIA_HP"] == undefined) flags["GRAY_PRIME_DEFEATED_VIA_HP"] = 0;
		flags["GRAY_PRIME_DEFEATED_VIA_HP"]++;
		
		clearOutput();
		author("Savin");
		showBust("GRAYPRIME");
		showName("FIGHT:\nGRAY PRIME");

		output("“<i>No,</i>” the goo groans, staggering back under your withering barrage of attacks the hail of bullets from Anno’s gun. “<i>No, I can’t... my work is too important. I’ve given everything for this... EVERYTHING. YOU WILL </i>NOT<i> STOP ME! YOU WILL </i>NOT<i>!</i>” the goo screams, suddenly finding her second wind. Goo wriggles forward from the floor and walls, adding itself to her mass, repairing the damage you’ve done to her. She looks as good as new in the blink of an eye.");
		
		output("\n\n“<i>I will not fall here. Not to you!</i>” the goo says, drawing her sword again.");
		
		output("\n\n“<i>You’ve got to be fucking kidding me!</i>” Anno says, ramming a new magazine into her gun. “<i>How do we kill this bitch!?</i>”");
		
		output("\n\nThe goo sneers. “<i>I am trillions upon trillions of machines... a thousand intelligences.... And you can’t kill what’s already dead.</i>”");
		
		output("\n\n“<i>Oh, shit.</i>”");

		// {Goo returned to FULL HEALTH}
		foes[0].HP(foes[0].HPMax());
		addButton(0, "Next", combatMainMenu);
	}
	else if (foes[0].HP() <= 1 && flags["GRAY_PRIME_DEFEATED_VIA_HP"] == 3)
	{
		clearOutput();
		author("Savin");
		showBust("GRAYPRIME");
		showName("FIGHT:\nGRAY PRIME");

		output("“<i>FUCKING DIE! DIE ALREADY!</i>” Anno screams, firing her gun again and again and again into the retreating mass of gray goo, blowing fist-sized holes through its body with every shot. Still, it doesn’t fall -- not for long. ");
		
		output("\n\n“<i>You’re good,</i>” the gray goo says in the momentary respite as Anno reloads. “<i>But I... I don’t want to die. Not when I’m so close... I will not...</i>”");
		
		output("\n\nBefore Anno can try and kill her again, the goo all throughout the room surges, lifting up and swirling around. You grab your companion and hit the deck as a room full to bursting with nanomachines comes alive, swirling into the shape of a giant fist connected to the gray goo. With it, she punches down the door in the side of the room and leaps out, into the reactor chamber and away from you.");
		
		output("\n\n“<i>What the...</i>” Anno breathes, struggling to her feet. “<i>What the hell was that thing?</i>”");
		
		output("\n\n“<i>I don’t know,</i>” you say, helping her up. “<i>But I don’t think we’ve seen the last of it.</i>”");

		genericVictory();
	}
	// Lust victory
	else if (foes[0].lust() >= foes[0].lustMax())
	{
		clearOutput();
		author("Savin");
		showBust("GRAYPRIME");
		showName("FIGHT:\nGRAY PRIME");

		output("“<i>No... stop...</i>” the goo groans as you continue to tease it. As you close the distance, you’re surprised to see her breasts, hips, and ass visibly enlarging, starting to fill out to the proportions of the “<i>regular</i>” gray goo. “<i>I don’t want to... I don’t want to become like them,</i>” the goo cries, stumbling back, clutching at her rack as if she could hold it in, restrain it from growing. ");
		
		output("\n\nBefore you can finish the job, she lunges at you, slamming her shoulder against you and throwing you back into Anno. The two of you go tumbling as the desperate goo-girl grabs the hatch to the reactor bay and leaps through it, fleeing from your sexual onslaught.");
		
		output("\n\n“<i>What did she mean ‘like them’?</i>” Anno mumbles as you help her up to her feet. “<i>What was that thing, even?</i>”");
		
		output("\n\n“<i>I don’t know,</i>” you say. “<i>But I don’t think we’ve seen the last of it.</i>”");

		// [Room Menu Go]
		genericVictory();
	}
}

function lossToGrayPrime():void
{
	clearOutput();
	author("Savin");
	showBust("GRAYPRIME");
	showName("LOSS:\nGRAY PRIME");

	output("“<i>What the hell!?</i>” Anno shouts beside you, firing again and again into the seemingly unstoppable goo-girl. Every bullet blows chunks out of the jiggling gray mass of her body, enough to kill any living thing outright; this monster just shrugs it off as her body reforms into perfect shape a moment later, as if she’d never been hit at all. “<i>She won’t go fucking down!</i>”");
	
	output("\n\nJust as Anno says that, though, one of her bullets blows the goo’s head off. The glistening gray body staggers forward, shudders, and collapses into the sea of goo at Anno’s feet. The ausar blinks, breathing hard. She stares at the locked-back slide of her empty gun. Behind her, the mass of gray goo squirms and rises, filling out into the shape of the unkillable goo. ");
	
	output("\n\nBefore you have a chance to warn her, Anno lets out a high scream as the gray goo surges around her to wrap around her with thick tentacles. Her arms and legs are grabbed first, splaying her out and lifting her off the ground. Another, more slender tentacle breaks off from the rest of the bunch so that it can slither up like a snake towards Anno’s face. She struggles, of course, and writhes in the tentacles’ grasp without finding purchase to escape. Her every movement is easily countermanded by the tentacles’ grasp. ");
	
	if (!(pc.meleeWeapon is EmptySlot()) && !(pc.meleeWeapon is Rock())) output("\n\nYou move to help, grabbing your [pc.meleeWeapon] and lunging at the tentacle mass growing from the deck");
	else output("\n\nYou move to help and lunge at the tentacle mass growing from the deck");
	output(" -- only for another gray vine to snap at you and throw you back against the far bulkhead. Your world spins, stars exploding in your vision as you slump down to the ground, barely conscious after the massive blow. Through the haze, though, you’re able -- if not forced -- to watch the tentacles drag Anno through the air, tearing at her catsuit until it’s nothing but shreds hanging from her writhing body. The slender one at her face presses against her lips, not waiting for her to relent but simply pouring through at the microscopic level and slowly forcing her mouth open from the inside. ");
	
	output("\n\nShe screams as more tentacles begin to molest her: grabbing at her breasts, squeezing the fleshy orbs, and planting their blunted heads to suck at her nipples. Others spread her legs wide and unceremoniously plunge into both her holes at once. Her voice is silenced by more tentacles clogging her throat, filling the ausar’s every hole with enough gray goo to stretch her to the breaking point. ");
	
	output("\n\nAs the goo fucks Anno, the gray girl herself reforms not more than an arm’s reach from you, rising out of the deck like a swimmer from a pool. She smiles as she materializes, taking one long-legged stride towards you. You weakly lift your [pc.rangedWeapon] towards her, but find your hand knocked aside by a tentacle that leaps up from the sea of goo around her. ");
	
	output("\n\n“<i>It’s a pity you found us,</i>” she says, almost a bit sadly as her tentacles wrap around your wrists, pulling you to your feet -- and further still, lifting you up off the deck. “<i>Hm. Some of us don’t want to kill you, it seems. Perhaps you can be still useful.</i>”");
	
	output("\n\nYou open your mouth to voice a question, but instead immediately are granted a taste of gray goo: one of the goo-girl’s tentacles rushes forward the moment your lips part, flooding into your mouth. You struggle against the probing tentacle of gray, but it’s relentless, squirming and shifting its shape to slide through no matter how tightly you squeeze your lips and throat. You can feel more tentacles rising, slithering up your [pc.legs], squirming through your [pc.gear], slowly stripping you down.");
	if (!(pc.meleeWeapon is Rock()) && !(pc.rangedWeapon is Rock()) output(" Your weapons are tossed aside with a flick of a tentacle, contemptuously batted aside into the sea of goo, leaving you defenseless.");
	output(" You moan around the tentacle in your mouth as a");
	if (pc.hasVagina() && pc.hasCock())
	{
		output(" writhing mass of tentacles reach up, eagerly probing and poking at your [pc.crotch] and [pc.asshole]. Several of the smaller ones wrap around [pc.eachCock], jerking and stroking and caressing every inch of your ample cockflesh. Other tentacles tease your womanhood");
		if (pc.vaginas.length > 1) output("s");
		output(", brushing and tickling your [pc.clits] until you’re too wet to prevent their entrance. Your ass, too, suffers the same fate as the rest of you: a single thick tentacle presses against it, so wet and so slender at the tip that you can’t clench hard enough to keep it in you. In the blink of an eye, you’re being speared from both ends, tendrils of gray goo writhing madly inside you.");
	}
	else if (pc.hasVagina() && !pc.hasCock())
	{
		if (pc.vaginas.length == 1) output(" pair of");
		else output(" mass of");
		output(" thick, drooling-wet tentacles squirm up your bare lower body, their destinations obvious. Instinctively, your body winces and clenches as the gooey probes find your holes. They press against you incessantly, shrinking down and pushing against you until you’re physically incapable of withstanding them. The tentacles wring a scream from you as they penetrate you, filling your holes with a flood of cold wetness that’s soon writhing inside you.");
	}
	else
	{
		output(" single long, slender tendril slithers between the cheeks of your [pc.butt], spreading you apart with alacrity. Oh, no.... You brace yourself as best you can as the cold, slippery goo-tentacle presses against your [pc.asshole]; it doesn’t take long to spread you open. You give a shrill, desperate cry as the tentacle squirms into you, writhing through your anal passage as more and more gray goo enters you.");
	}

	output("\n\n“<i>You’re lucky,</i>” the goo-girl coos as her tentacles fuck you and your ausar companion, filling every hole on offer. “<i>Lucky that gray goo needs a certain kind of lubrication to work right. Biological, warm, fresh. Nothing on Tarkus like it, even in this whole junkyard of a planet, except good old fashioned sex juice. Well, not unless you want to get deadly, anyway. But then you’re just a one-time meal, and where’s the use in that.... when we could have you forever?</i>” ");
	
	output("\n\nYour eyes go wide, but the goo surging into your mouth prevents you from speaking -- or doing much more than moan and gag as you’re viciously throat-fucked. Strangely, you’re not having any problem breathing around the gray tentacle rammed stomach-deep into you -- almost like you can breathe through it. You don’t have much time to consider the implications of that, though, before the tentacles around your lower half start really pumping, moving faster and faster into your spread-open hole");
	if (pc.hasVagina()) output("s");
	output(".");
	
	output("\n\nSlowly, the tentacles heft you and Anno through the air, moving your restrained limbs like puppets’ as you go -- which only serves to drive the hole-filling tendrils deeper as you’re dragged through a hatch, into the reactor bay. The reactor is thrumming noisily, surrounded by servers and hard-drives and computers that look like they’ve been ripped right out of the ship, or else harvested from the junkyard outside. You don’t have more than a moment to look at them, though, before your gaze is forcefully turned toward a huge vat at the edge of the chamber. ");
	
	output("\n\nA vat filled to the brim with gray goo. ");
	
	output("\n\n“<i>We need lubricants to keep functioning,</i>” your captor explains as she walks, followed closely by the pool of tentacle-rapey goo that’s holding you and Anno. “<i>Normally the wild raskvel outside, or the occasional sydian, are enough. Still, they’re a hassle to hunt down and fuck. Takes so much time out of the day... now that </i>you’re<i> here, well, maybe I can really get some work done. Waste not, want not.</i>”");
	
	output("\n\nThe tentacles inside you speed up, squirming and writhing in mad, worming motions that have your insides bulging in response, using your body like a well-trained whore’s. You’re physically dangled over the vat of goo as the gray girl wheels off the top, revealing a veritable ocean of the stuff. It gurgles and bubbles in response to the light -- and the dripping of your sexual fluids into it as the pounding tentacles lift you over it. An amorphous bubble of goop reaches up from the vat, squirming as you and your ausar companion draw near it. ");
	
	output("\n\nThe sea of goo binding you shifts up, and crawling up the wall of the vat to merge with its larger mirror. Oh, no.... You brace for impact, squeezing your eyes shut as you’re plunged bodily into the vat. The gray is soft as butter when you fall into it, the tentacles inside you merging with the surrounding host until you barely notice them as independent entities anymore: goo positively floods your body, pouring into you like water. You struggle, gasping for breath -- and finding it. After a moment, you have no trouble breathing at all, as if the goo is pumping oxygen into you. You manage to calm down once you catch your breath, blind and immobile in the vat, but still alive. You try and move your arm, but find yourself held fast, spread eager in the heart of the vat. You call out for Anno, and get no response -- you can’t hear anything, even if you actually managed to speak through the goo. ");
	
	output("\n\nSuddenly, you feel a rush of pleasure through your now-helpless body. An impossible, overwhelming shock of sensation assailing your every hole, filling you from the inside out as every inch of your body is tormented by the lusty micromachines. Your orgasm is as instantaneous as it is intense, pleasure driving your mind wild as you cum and cum and cum into your gooey prison, feeding the microbes that lube they so desperately seem to need. ");
	
	output("\n\nYou shudder as shockwaves of pleasure tear through you, pumping out every moment of orgasm from you that the goo possibly can, drawing your climax out... and out... and out... until you start to think it will never end. That the pumping goo inside you will keep you cumming and cumming forever, hours turning into days into weeks of unending orgasm.");
	
	output("\n\nThat’s exactly what they do.");


	output("\n\n<b>GAME OVER</b>");

	clearMenu();
	addDisabledButton(0, "GAME OVER", "Game Over", "Roll end credits.");
}

function deck13Breach():void
{
	clearOutput();
	author("Savin");

	output("You look up to the great big hole in the overhead, through which you and Anno fell. Doesn’t look like there’s any way of getting back up there. ");

	if (flags["ANNO_MISSION_OFFER"] == 2) output("\n\n“<i>I'm surprised I didn't break a leg falling through,</i>” Anno muses. “<i>Wish I'd bothered to reload the stupid grappling gun when we came in.</i>”");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

function deck13Shields():void
{
	clearOutput();
	author("Savin");

	output("You step up to the most important-looking console in the room, labeled “<i>Shield Control.</i>” There’s still some power to the console here.");

	if (flags["ANNO_MISSION_OFFER"] == 2) output("\n\n“<i>Hey, is this... the shields are still working? I guess that explains why the </i>Nova<i> didn’t burn up in atmo, but still. We should probably turn them on while we’re down here. Wouldn’t hurt, anyway, and if something happens... better safe than sorry, right?</i>”");

	output("\n\nIt would just be a button press to route power to the shields. Do so?");

	clearMenu();
	addButton(0, "Yes", deck13TurnOnShields);
	addButton(1, "Leave", mainGameMenu);
}

function deck13TurnOnShields():void
{
	clearOutput();
	author("Savin");

	output("“<i>Bringing shields online,</i>” a soft computer voice says as you push the big ON button.");
	
	output("\n\nNothing really happens after that, other than the screen informing you that the shields are back online.");
	
	if (flags["ANNO_MISSION_OFFER"] == 2) output("\n\n“<i>Guess we’ll just have to take it on faith. Hopefully we’ll never need ‘em anyway.</i>”");

	flags["DECK13_SHIELDS_ON"] = 1;
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

function deck13GooSample():void
{
	clearOutput();
	author("Savin");

	output("You look around at the mass of slick gray goo still splattered on the walls and identify a particularly large plot of it. You draw a small vial from your pack and take a sample of it -- could be useful later. <b>You acquired a Gray Goo sample!</b>");

	if (flags["DECK13_SAMPLES_TAKEN"] == undefined) flags["DECK13_SAMPLES_TAKEN"] = 0;
	flags["DECK13_SAMPLES_TAKEN"]++;

	quickLoot([new GrayMicrobots()]);
}

function deck13SecondaryReactorFunc():Boolean
{
	author("Savin");

	if (flags["DECK13_SECONDARY_ENTERED"] == undefined)
	{
		flags["DECK13_SECONDARY_ENTERED"] = 1;

		deck13FinalFormIntro();

		return true;
	}
	else
	{
		if (flags["DECK13_FINAL_FORM"] == undefined)
		{
			output("\n\nSeveral large vats and tubes along the edge of the room are filled to the brim with gray goo, sitting idle.")
		}

		return false;
	}
}

function deck13FinalFormIntro():void
{
	clearOutput();
	author("Savin");
	showName("\nGRAY PRIME");
	showBust("GRAYPRIME");

	output("You and Anno approach the hatch leading into the secondary reactor. The snowy ausar readies her holdout and gives you a slight nod. Together, you shove the door open and charge in after the strange gray goo. ");
	
	output("\n\nShe isn’t hard to find.");
	
	output("\n\nThe reactor room you enter is monolithic, easily taking up half the deck with thrumming power converters and a glowing fusion reactor dominating the center of the expansive room, surrounded by vats and tubes filled with gray goo. Several wires lead directly from the reactor to dozens of computer banks, servers, and hard drives scattered all through the room, like half the computers aboard the ship were all pulled and clustered around the reactor. Every device is beeping and blinking rhythmically, drawing power right from the secondary reactor itself. The heat in the room is oppressive, almost overwhelming, with so many devices running on max and clustered together. You break out in a sweat almost immediately as the heat hits you like a brick wall. ");
	
	output("\n\nSlumped against the reactor control panel is the goo-girl, breathing hard after your encounter and surrounded by a writhing, swirling lake of bubbling gray goo at her feet. She spins around as you and Anno approach, her sword forming out of her hand as she does so. Anno raises her gun, but the goo doesn’t advance. Not yet, at least. ");

	output("“<i>That’s close enough,</i>” the goo says, wincing");
	if (flags["GRAY_PRIME_DEFEATED_VIA_HP"] == 3) output(" as if in pain");
	else output(" at her enlarged, lust-addled bust's heaving");
	output(" and waving you back with her sword. ")

	output("“<i>I’m sorry... I’m sorry I tried to kill you,</i>” she breathes, unsteadily rising to her feet, leaning heavily against the control panel. “<i>I didn’t... I... I panicked. But I can’t let you stop what I’m doing. I can’t let you.</i>”");
	
	output("\n\n“<i>And what is it you’re doing?</i>” you ask, reaching over and slowly lowering Anno’s gun for her. The ausar bristles, but doesn’t resist. ");
	
	output("\n\nShe hesitates a moment, then sighs. “<i>I’m trying to save my crew.</i>”");
	
	output("\n\nHer crew...?");

	//Talk Menu:
	deck13GrayPrimeTalkMenu();
}

function deck13GrayPrimeTalkMenu():void
{
	clearMenu();
	addButton(0, "Her Crew", deck13GrayPrimeTalkCrew);
	if (flags["DECK13_CREW_TALK"] != undefined)
	{
		addButton(1, "The Nova", deck13GrayPrimeTalkNova);
		addButton(2, "Her Work", deck13GrayPrimeTalkWork);
		addButton(3, "Gray Goo", deck13GrayPrimeTalkGoo);
		addButton(4, "Done", deck13GrayPrimeTalkDone);
	}
	else
	{
		addDisabledButton(1, "The Nova", "The Nova", "Talk to the Gray Prime about her crew first.");
		addDisabledButton(2, "Her Work", "Her Work", "Talk to the Gray Prime about her crew first.");
		addDisabledButton(3, "Gray Goo", "Gray Goo", "Talk to the Gray Prime about her crew first.");
		addDisabledButton(4, "Done", "Done", "Talk to the Gray Prime about her crew first.");
	}
}

function deck13GrayPrimeTalkCrew():void
{
	clearOutput();
	author("Savin");
	showName("\nGRAY PRIME");
	showBust("GRAYPRIME");

	flags["DECK13_CREW_TALK"] = 1;

	output("“<i>What do you mean, ‘your crew’?</i>” you ask, looking between the cybernetic girl and the myriad computers laid out around the reactor. ");
	
	output("\n\nThe gray goo waves her sword around the reactor bay. “<i>This is... this is all that’s left of them. The </i>Nova<i> carried thousands. Ten thousand, four hundred and twenty eight souls borne into the void. Deep space exploration, maybe colonization if she’d found a good planet. Something better than Tarkus, at least. We would have settled a world, another beacon of humanity in the stars, ready to wait for the next wave centuries later.</i>”");
	
	output("\n\n“<i>You said ‘we,’</i>” Anno says. “<i>Were you... part of the ship’s computer, I guess? Primitive doctor bots that had a loooong time to gain sentience?</i>” ");
	
	output("\n\nThe goo eyes Anno, a look of immense sadness crossing her eyes. “<i>No. I... we... are human.");
	if (pc.isHuman() || pc.isHalfHuman()) output(" Just as human as you are.</i>”");
	
	output("\n\n“<i>What?</i>” you and Anno say at once, staring at the glistening metallic maiden. ");
	
	output("\n\nShe gives a wry chuckle under her breath and locks eyes with you. “<i>Did you ever notice that there were no bodies on the </i>Nova<i>? All those cryo beds, thousands and thousands of them... and not a single body.</i>” She sighs. “<i>There was a malfunction aboard the </i>Nova<i>, right out of the gate: a gas leak in the cryo system. We hadn’t even left Sol before the crew was dead. We were dust long before the old girl crashed here.</i>”");
	
	output("\n\nAnno turns to you. “<i>I... I think I believe it, boss. Old colony ships, they were fire and forget. Death sentences half the time, just load a bunch of people in a primitive starship and slingshot it into space. There are dozens of them still floating, even now that the gates are up, still looking for a habitable world. It wasn’t that uncommon for something to just... go wrong.</i>”");
	
	output("\n\n“<i>No, it wasn’t,</i>” the goo says. “<i>But we went anyway. Hundreds of ships, millions of souls eager to explore the galaxy. Who’d have thought we just needed to wait a couple centuries for you ausar to give us the gates?</i>” ");
	
	output("\n\n“<i>Maybe. But that doesn’t explain... well,</i>” Anno says, looking the gray woman up and down.");
	
	output("\n\nThe goo shrugs. “<i>We had an experimental tech with us. Courtesy of these bastards,</i>” she indicates the Bell-Isle/Grunmann patch on her shoulder. “<i>These little gray nanobots. Every one of us had an injection of them, supposed to keep us healthy and working when we got to... wherever we were going. They were also supposed to keep us </i>mentally<i> healthy, and that’s what got us. Every one of us died with a lace of grey bots copying our brains, just enough to fill a syringe. That was all that was left of us. But when this old bucket crashed, we woke up all the same.</i>”");
	
	output("\n\n“<i>Oh my god,</i>” Anno breathes.");
	
	output("\n\n“<i>So this is the crew. This clump of goo around us, plus databanks. It took us years to start uploading ourselves... to transfer from this fucking goo onto the network. But that’s worse. We humans, we can’t exist without a body... it’s suffering, just being digital. So now we’re making more goo. Digital platforms. Almost unkillable.</i>” ");
	
	output("\n\n“<i>And who were you?</i>” you ask, indicating the goo herself.");
	
	output("\n\n“<i>There... there is no ‘me.’</i>” she says. “<i>This body is made up of several thousand different intelligences working together. Most of the crew is synched through this platform. The ones not wandering around the ship net, or getting torn up as mind-numbing security bots trying to make you leave.</i>”");
	
	output("\n\nShe sighs. “<i>But I know what you meant. You’re seeing and hearing Captain Victoria Morrow. I, she, still leads us. I don’t even know if there is an ‘us’ anymore. It’s gotten so hard to think over the years. Individually, anyway. Like we’re all slowly melding into one. I becomes we, when there aren’t any barriers left.</i>”");
	
	output("\n\n“<i>A gestalt,</i>” Anno suggests.");
	
	output("\n\nThe goo nods. “<i>Maybe. For now, you can call us... me... Nova.</i>”");

	deck13GrayPrimeTalkMenu();
	removeButton(0);
}

function deck13GrayPrimeTalkNova():void
{
	clearOutput();
	author("Savin");
	showName("\nGRAY PRIME");
	showBust("GRAYPRIME");

	output("“<i>Tell me about the ship,</i>” you say, indicating the massive chamber around you.");
	
	output("\n\n“<i>I am the ship,</i>” Nova says simply. “<i>When we were... uploaded to the net, the crew became intrinsically tied to the ship’s internal network. I can </i>feel<i> it. Every deck, every sensor, every raskvel or sydian wandering its halls. The ship’s security net should have kept us safe, helped to direct and coordinate the crew. While I’m logged into the network, it’s so acute that it reminisces of touch and sound and smell. I could tell you anything about it, any bit of minutia. But what’s to tell? You know everything, I’m sure: she’s old, and she’s had her back broken. I don’t know what caused us to crash. We might have just flown right into the planet. The raskvel have done a good job fixing the old boat up, though; I’ll give them that. She might even be spaceworthy, if they found some way of launching the ship into orbit.</i>”");
	
	output("\n\nNova gives the reactor console an affectionate, almost motherly pat.");

	deck13GrayPrimeTalkMenu();
	removeButton(1);
}

function deck13GrayPrimeTalkWork():void
{
	clearOutput();
	author("Savin");
	showName("\nGRAY PRIME");
	showBust("GRAYPRIME");

	output("“<i>So what’s this work you didn’t want us to see?</i>”");
	
	output("\n\nNova sighs, turning from you to the mess of computers and hardware around. “<i>I’ve been trying to find a way out for centuries. Out of this... un-death. I don’t think we, the crew, will survive much longer like this, all jumbled together on the network and mixed together as primordial goo. We’re losing our sense of self. We needed new bodies, so we tried to take them: there were plenty of robots on Tarkus, but all too primitive to support a real human mind. ");
	
	output("\n\n“<i>So I’ve turned to the goo. We can make more of it, even if programming it is a nightmare. I wanted to make new bodies for the crew, one for every crewman, each with a strong enough network to host a living mind. It hasn’t entirely been a success, but I’m so close I can taste it. The goo on the planet are very nearly human. They just need a little more structural work, a little help in the right direction, and they’ll be ready.</i>”");
	
	output("\n\nShe smiles, ever so slightly. “<i>In short, I’m playing creator. To a whole new race on Tarkus.</i>”");
	
	output("\n\n“<i>Wait a minute,</i>” Anno says. “<i>I get that, but now that the U.G.C. is here, why not just ask for help? Cyber tech has come so far in the last few hundred years, and we’ve got rigs so advanced you’d think they’re human if nobody told you.</i>”");
	
	output("\n\nNova sighs. “<i>To be frank, we’ve been afraid. We don’t want some network analyst poking around in our brains, or worse, just getting dissected by the government the moment they realize what we are. We just want to live in peace.</i>”");
	
	output("\n\nAnno turns to you, leaning");
	if (pc.tallness > anno.tallness + 6) output(" up");
	else if (pc.tallness < anno.tallness - 6) output(" down");
	else output(" over");
	output(" to whisper in your ear. “<i>I know Steele Tech isn’t a cyberware company, but... we could help, couldn’t we? I’ve got enough pull in R&D to get the ball rolling, bring in some test rigs. It would take time, but it’s got to be better than... than this.</i>”");

	deck13GrayPrimeTalkMenu();
	removeButton(2);
}

function deck13GrayPrimeTalkGoo():void
{
	clearOutput();
	author("Savin");
	showName("\nGRAY PRIME");
	showBust("GRAYPRIME");

	output("“<i>So, what’s the deal with the gray goo outside?</i>” you ask. ");
	
	output("\n\nAnno adds, “<i>They’re... nothing like you, that’s for sure.</i>” ");
	
	output("\n\n“<i>They were... accidents. Early experiments,</i>” Nova says. “<i>Gray goo operate by network intelligence. A host of very, very simple V.I.s link together to form a more coherent computer without taking up too much space. The ones you’ve seen outside were my first attempts to create new bodies for the crew. We created vats of gray goo, programmed them to assume human shapes, and then... then we realized that the network intelligence got smarter with size. It turned out that when we linked up enough new goo to form a body, the V.I.s powering them got almost as smart as people. Sentient, at any rate. Downloading into their bodies would kill the V.I., and we... we aren’t desperate enough to commit murder like that.</i>”");
	
	output("\n\n“<i>Except on us,</i>” Anno says, glowering. ");
	
	output("\n\nNova shrugs. “<i>Two people are a necessary evil. Ten thousand is unacceptable. We’ve been trying to find a way to keep the gray from networking, but every time we do, they refuse to form proper bodies. Just this sea of goop.</i>” She waves her hands around the pool at her feet.");
	
	output("\n\n“<i>But you’re in a body,</i>” you say, eyeing the captain’s silvery doppelganger. ");
	
	output("\n\n“<i>A body shared by the majority of the crew, taking thousands and thousands of us just to put together one functioning body. We’re all trapped in here together, until I can find us a way out... new bodies capable of supporting us.</i>”");

	deck13GrayPrimeTalkMenu();
	removeButton(3);
}

function deck13GrayPrimeTalkDone():void
{
	clearOutput();
	author("Savin");
	showName("\nGRAY PRIME");
	showBust("GRAYPRIME");

	output("“<i>I’ve heard enough.</i>”");
	
	output("\n\nNova nods, pushing herself up from the console, trying to stand on two feet again. “<i>Alright. What are you going to do then: will you help us?</i>”");
	
	output("\n\nLooking to you, Anno whispers, “<i>I’ll back you up whatever you decide, boss.</i>”");

	clearMenu();
	addButton(0, "Help: Bodies", deck13DecisionBodies, undefined, "Help: Bodies", "Agree to help Nova find new bodies for her crew. Steele Tech can get them started.");
	addButton(1, "Help: GrayGoo", deck13DecisionGoo, undefined, "Help: GrayGoo", "Shout some sense into Nova. The gray goo aren't worth saving. Just download into goo bodies and be done with it.");
	addButton(2, "Stop Her", deck13DecisionStopHer, undefined, "Stop Her", "Steele Tech could make a mint off the gray goo research she's done, and not have to pay a dime... if you kill the bitch.");
	addButton(3, "Anno?", deck13DecisionAskAnno, undefined, "Ask Anno", "Ask Anno what she thinks.");
	addButton(4, "Leave");
}

function deck13DecisionBodies():void
{
	clearOutput();
	author("Savin");
	showName("\nGRAY PRIME");
	showBust("GRAYPRIME");

	pc.addNice(5);

	output("“<i>Alright, I’ll help you,</i>” you say, lowering your weapon. “<i>My Dad was a powerful man. Anno here works for his company’s Research and Development group. They’ll be able to help you.</i>” ");
	
	output("\n\nNova looks almost dumbfounded when you give your answer. “<i>R-really? You’d do that for us?</i>”");
	
	output("\n\nAnno nods. “<i>I’ll put in a call to R&D when I get back to the shop. They could be here in a matter of days, with at least a few cybernetic bodies. Advanced enough to hold onto your minds. If you’d be willing to share your research on the gray goo, we could probably work out a pay scheme to start fitting the whole crew with cyber bodies over the next year or so. With so many, it’s going to be a challenge, but... it’s doable. Definitely.</i>” ");
	
	output("\n\n“<i>I don’t know what to say... other than yes. And thank you!</i>” Nova smiles, for the first time. “<i>I never thought someone would be willing -- or able -- to help us like that. Not in a million years. Ten thousand cyber bodies has to be a fortune</i>”");
	
	if (pc.isMischievous())	output("\n\n“<i>Call it the company’s charity for the year. It’ll all come off on taxes anyway,</i>” you chuckle.");
	else output("\n\n“<i>SteeleTech can afford it,</i>” you answer simply. “<i>Especially if we can find a way to monetize the gray goo.</i>”");
	
	output("\n\n“<i>I see,</i>” Nova says, still smiling. Her sword vanishes, disintegrating as she steps forward. “<i>Most... no, </i>all<i> of the crew would like to convey a message.</i>”");
	
	output("\n\nShe steps up, hesitant at first, then lunges forward, wrapping her arms around you and pulling you into a tight hug. You chuckle and return the gesture, feeling the slippery gray goo of her bosom squeeze and squish against your [pc.chest]. ");
	
	output("\n\n“<i>Alright, alright,</i>” Anno says, holstering her gun. “<i>C’mon, boss. Let’s call this in.</i>”");
	
	output("\n\nYou nod, and tell Nova to hold on: this nightmare is almost over. “<i>I’ll unlock the elevator for you,</i>” she adds finally. “<i>We’ll see you again, I hope.</i>”");

	// {Return PC and Anno to Steele Tech shop}
	flags["ANNO_MISSION_OFFER"] = 3;
	flags["DECK13_GRAY_PRIME_DECISION"] = 1;
	flags["DECK13_REACTOR_DOOR_OPEN"] = 1;

	clearMenu();
	addButton(0, "Next", deck13BackAtTheShop);
}

function deck13DecisionGoo():void
{
	clearOutput();
	author("Savin");
	showName("\nGRAY PRIME");
	showBust("GRAYPRIME");

	pc.addHard(5);

	output("“<i>So you’re saying you’d rather have your crew sit here suffering while inflicting those brain-dead bimbos on the rest of the planet?</i>” you say, scowling at Nova. She visibly recoils. “<i>What the hell kind of captain were you?</i>”");
	
	output("\n\n“<i>It was a decision by all of us!</i>” she snaps. “<i>We signed up on this mission -- all of us! -- to create life. To spread the human race across the stars in peace, not to commit genocide.</i>”");
	
	output("\n\n“<i>Fucking hypocrite,</i>” you answer. “<i>You’d kill two living, breathing people just to keep your secret, but you’re afraid to press the ‘delete’ button on some soulless fucking robots?</i>”");
	
	if (pc.accessory is TamWolf || pc.accessory is TamWolfDamaged)
	{
		output("\n\n“<i>[pc.Master]?</i>” Tam-wolf whines.");
	
		output("\n\n“<i>Not you, boy.</i>”");
	}
	
	output("\n\n“<i>So what, you think that’s it?</i>” Nova says, planting her hands on her hips. “<i>We have to pick between us and them? No. That’s why we’ve been doing this work... for so long. There has to be a better way.</i>”");
	
	output("\n\n“<i>Then where is it? You’ve had </i>centuries<i> to work on this, and what do you have to show for it?</i>”");
	
	output("\n\nNova winces. “<i>But we-</i>”");
	
	output("\n\n“<i>But nothing! If you want to save your crew, it’s time to help yourselves -- nobody else will.</i>”");
	
	output("\n\nNova shudders, gray flesh quivering as her arms wrap around herself. “<i>I don’t... then what does that make us? What kind of monsters would we be...?</i>”");
	
	output("\n\n“<i>The kind that saves their crew. That’s a captain’s duty, Nova.</i>”");
	
	output("\n\nShe hesitates a moment, then turns away from you. Back to the console. “<i>You’re right... I know that. I’ve just been deluding myself all this time. Too afraid to do what I have to do.</i>”");
	
	output("\n\nNova pauses again, her hand hovering over the console. As if to herself, she says, “<i>I am the CAPTAIN. I don’t care what any of you say: I’m making a decision. It’s final. I’m saving you bastards whether you like it or not.</i>” A moment passes in silence. Slowly, the captain’s hands descend on the console and begin working.");
	
	output("\n\nMoments later, the vats of gray goo begin churning, drooling out thick clumps of the stuff from a nozzle onto the deck. Bouncy gray girls begin forming, just like the creatures found outside Novahome: all with huge tits and asses bouncing around as they look about, surveying their new surroundings. When the first have finished coalescing from their composite goop, Nova steps away from the console and approaches them, reaching a hand out to the nearest gray goo-girl.");
	
	output("\n\n“<i>Hi!</i>” the first-made goo says, adopting a huge grin as Nova nears her, oblivious to her imminent fate. “<i>Wow! You’re super pretty! Are we going to be friends?</i>”"); // ;;;;;;_;;;;;;;
	
	output("\n\nNova merely reaches a hand out, and plants it on the gray’s chest. The bubbly goo-girl goes suddenly rigid, her eyes crossing as Nova uploads one of the crew to her. A mere second goes by, and it’s over. The gray girl shifts and shudders, reforming herself into the image of a tall, athletic man clad in a tight spacer uniform, bearing the Bell-Isle/Grunmann patches, just like Nova.");
	
	output("\n\n“<i>Captain,</i>” he says, a solemn grin on his face, extending a hand to Nova. ");
	
	output("\n\nShe takes it, shaking it vigorously. “<i>Good to have you back, Jameson.</i>” Turning to you, Nova says, “<i>That’s it, then. It works. It’ll take a long time, but... but the crew will have new bodies, now. I suppose I should thank you for talking me out of my cowardice.</i>” ");
	
	output("\n\n“<i>I think we’re done here, boss,</i>” Anno says, putting a hand on your shoulder. “<i>I got what I came for, and I think the crew here’s going to be okay.</i>”");
	
	output("\n\nNova nods. “<i>We will be. Hopefully we’ll be leaving soon. Start catching flights back... well, I don’t know if any of us have homes to go back to,</i>” she sighs. “<i>I’ll unlock the elevator for you.</i>”");
	
	output("\n\nYou nod, and follow Anno topside.");

	// {Return PC and Anno to Steele Tech shop}
	flags["ANNO_MISSION_OFFER"] = 3;
	flags["DECK13_GRAY_PRIME_DECISION"] = 2;
	flags["DECK13_REACTOR_DOOR_OPEN"] = 1;

	clearMenu();
	addButton(0, "Next", deck13BackAtTheShop);
}

function deck13DecisionAskAnno():void
{
	clearOutput();
	author("Savin");
	showName("\nANNO");
	showBust("ANNO");

	output("“<i>Thoughts?</i>” you whisper, turning to Anno.");
	
	output("\n\nThe ausar girl shrugs. “<i>I don’t know, boss. They </i>did<i> try to kill us, but... God, can you imagine? Dying in your sleep, waking up centuries later as just a pile of goo. I’m amazed they’re not MORE crazy. We could help them. Steele Tech has the resources to provide cyberwear for them, though it’d be expensive. Could cut a deal with them for their gray goo tech, try and make a buck off of it in exchange. I could think of a dozen ways to use it, aside from just as mushy sexbots.");
	
	output("\n\n“<i>So yeah. Could make a deal about that, if you want. That’s what I’d do. To play devil’s advocate, though, you could take one from your uncle Max’s playbook and just steal their research. Would be a pretty big dick move, but Steele Tech would make a mint off it for nothing.</i>”");

	removeButton(3);
}

function deck13DecisionStopHer():void
{
	clearOutput();
	author("Savin");
	showName("\nGRAY PRIME");
	showBust("GRAYPRIME");

	output("You level your [pc.rangedWeapon] at Nova. Anno follows suit, her holdout steady with the goo’s head. ");
	
	output("\n\n“<i>What... what’re you?</i>” she starts, raising her sword. “<i>I knew this would happen. Fine. Let’s finish this.</i>”");
	
	output("\n\nRather than charging at you, though, Nova spins on a heel and throws her sword behind her... right into the biggest vat of bubbling gray goo. The glass pane in front of it shatters, and goo comes spilling out like a tidal wave across the floor. Anno puts a round right through Nova’s head, but too late: her sea of goo and the new floor are already racing to meet one another. They merge, waves gray goo spilling across each other... and growing. The captain-facsimile reforms, larger now, growing by the second as more and more goo flows into her. You and Anno both take a step back as Nova grows giantesque, towering over you in a monolithic conglomerate of gray goo.");
	
	output("\n\n“<i>YOU WILL NOT STOP ME FROM SAVING MY CREW,</i>” Nova booms, her hand lashing out... and punching into the reactor. Immediately, the lights flash red as a thick, green gas begins pouring out, starting to fill the chamber you’re in.");
	
	output("\n\n“<i>Oh, shit. Boss, run!</i>” Anno snaps, grabbing you by the arm and booking it towards a personnel elevator in the back of the room, leading back up to the deck you came in on. You hit the UP button, just as gas starts to reach your feet. ");
	
	output("\n\n“<i>HAVE A LITTLE TASTE OF WHAT KILLED US,</i>” the mammoth Nova booms, stomping towards the lift. You and Anno raise your weapons as the giga-goo closes in.");

	clearMenu();
	pc.createStatusEffect("Annoquest Helper AI", 0, 0, 0, 0, true, "", "", true, 0);
	addButton(0, "Next", startCombat, "gigagoo")
}

function gigaGooAI():void
{

}

//Goo Punch
function gigaGooPunch():void
{
//One moderate physical attack, no dodge chance. Chance to stun.
	Nova rears her massive fist back and swings, a straight punch right into the face of the cart. Bits of her gooey fingers are shorn off as she slams herself through the slim bars around the elevator, smashing into you! You and Anno are slammed back against the wall by the force of the blow, drowning in a sea of gray bots as her fingers drip away, though they reform a moment later. {<b>You’re stunned by the overwhelming force of the blow!</b>}
}

//Sword Thrust
function gigaGooSwordThrust():void
{
//One MASSIVE physical hit.
	Nova’s sword swings back, her whole body leaning into the blow as she lunges forward to drive the sword straight through the open face of the lift!
	Hit: You cry out in pain as the immense goo-sword strikes you, tearing through the ancient steel of the elevator cart with ease. 
	Miss: You and Anno duck apart, letting the sword plunge into the wall between the two of you. The rising elevator cart quickly cuts it off of the mass and lets it pour off the sides... only to reform a moment later. 
}

//Cage Rattle
function gigaGooCageRattle():void
{
//Several light physical attacks, chance of knockdown in failed Reflex save. 
	Nova reaches up and grabs the top of the elevator to hold it in place and push downward, trying to drive you into the rising cloud of gas below. The car shakes and shudders as she fights against the motor to hold you down. {<b>The rocking of the cage knocks you flat on your ass! You’re prone!</b>}
}

function loseToGigaGoo():void
{
	clearOutput();
	author("Savin");
	showBust("GIGAGOO");
	showName("LOSS:\nGIGA GOO");

	output("“<i>YOU SHOULD HAVE LET US WORK,</i>” Nova roars, reaching through the elevator’s lips and grabbing you and Anno, squeezing you together in one of her massive fists. You can already feel the life being crushed out of you before the monolithic goo-girl throws you down to the deck below, ending your life as a crushed husk in a haze of poison gas.");
	
	output("\n\n<b>GAME OVER</b>");

	clearMenu();
	addDisabledButton(0, "Game Over", "GAME OVER", "Roll end credits etc.");
}

function victoryOverGigaGoo():void
{
	clearOutput();
	author("Savin");
	showBust("GIGAGOO");
	showName("VICTORY:\nGIGA GOO");

	output("Finally, the elevator locks into position and the huge blast door slides open. Still firing, Anno steps off the elevator, slowly stepping back as she unloads on the monstrous goo-girl. With a roar of rage, Nova rips the elevator cart aside and reaches her arm into the corridor, nearly knocking you off your [pc.feet]. You scramble back, Anno in tow as the goo adjusts her size, body deforming as she claws her way into the hall. ");
	
	output("\n\n“<i>Run! Elevator, now!</i>” Anno shouts before sprinting away. You follow, hurtling back down the hall where you came from. Behind you, a cloud of green gas rolls into the corridor, following the oversized gray arm reaching after you. Anno gets there a moment ahead of you. The ausar slams her fist against the call button before turning and firing over your head at the oncoming goo fist, blasting its fingers apart before they can close around you. The elevator door slides open onto an empty shaft: no cart. ");
	
	output("\n\n“<i>Leap of faith, boss. Let’s go!</i>” ");
	
	output("\n\nFuck. You give Anno a final nod and get a running start, leaping into the elevator shaft and grabbing onto the cable. You swing it back just enough to avoid Nova’s hand closing in on you. Her hand grabs the side of the door, pulling the rest of her body through the corridor until her face is pressed against the door. Nova opens wide, forcing her head through as if to bite right into you.");
	
	output("\n\n“<i>EAT THIS!</i>” Anno shouts, firing her gun at the door... and hitting a control panel on the inside of the shaft. The door slides closed with a WHOOSH, cleanly slicing the goo’s head off. With a cry, it plummets into the darkness below, vanishing into the lower decks.");
	
	output("\n\n“<i>Oh, shit.</i>” Anno sighs, holstering her gun and grabbing the cable with both hands. “<i>That was close. Hope you’re ready for a climb, boss.</i>”");

	// {Back to Steele Tech}
		// {Return PC and Anno to Steele Tech shop}
	flags["ANNO_MISSION_OFFER"] = 3;
	flags["DECK13_GRAY_PRIME_DECISION"] = 3;
	flags["DECK13_REACTOR_DOOR_OPEN"] = 1;

	clearMenu();
	addButton(0, "Next", deck13BackAtTheShop);
}

function deck13BackAtTheShop():void
{
	clearOutput();
	author("Savin");
	showName("DECK 13\nEPILOGUE");
	showBust("ANNO");

	output("<b>Some time later, you return to the Steele Tech outpost</b>... ");
	
	output("\n\nAnno sighs heavily as she all but stumbles through the door, wiping the sweat off her brow on the back of her sleeve. “<i>Holy shit, boss. That was... not was I was expecting,</i>” she says, shooting you a wry grin as she dumps her gun, remaining mags, and tools on the counter and zips down the front of what’s left of her half-shredded catsuit.");
	
	if (flags["DECK13_GRAY_PRIME_DECISION"] == 3)
	{
		output("\n\n“<i>Fucking bitch was crazy. Can you imagine, all those years cooped up as nothing more than a handful of gooey robots? I’d feel bad for them if not for the whole murder-rape-kill thing.</i>”");
	}
	else
	{
		output("\n\n“<i>I’m glad we were able to help those people... nobody deserves to spend an eternity like that. Even if they did try to kill us first.</i>”");
	}
	output(" Anno hits a button under the counter as she speaks, causing shutters to fall over the shop windows and the door to bolt. Once done, she shrugs completely out of her top, letting the material bunch around her waist. You watch with interest as the buxom ausar moves, bending to put her gear away as she talks. “<i>I’ll be interested to see their research data on the gray goo");
	if (flags["DECK13_GRAY_PRIME_DECISION"] == 3) output(", once the gas clears off that deck, anyway");
	output(". Could make the company a mint on the sex-bot market, if not elsewhere.");
	if (flags["DECK13_GRAY_PRIME_DECISION"] == 1) output(" Easily enough to cover the cost of a few thousand civvie-model cyber bodies. Well, probably.");
	output("</i>”");
	
	output("\n\nAnno locks her gun back under her workspace and, in the same motion, shimmies out of the rest of her clothes, letting the well-worn catsuit drop to the floor. “<i>We do good work, boss,</i>” she adds, walking over and planting a kiss on your cheek. “<i>I’m going to hit the showers before I call the company and tell them what happened.</i>”");
	
	output("\n\nHer hand trails across your hip as she turns and sashays toward the back door down to her quarters, hips a-sway and tail curling up as she walks. She stops in the doorframe, one arm on it, the other on her waist, and grins over her shoulder. “<i>You coming?</i>” ");

	// [Yes] [No]

	currentLocation = "303";
	clearMenu();

	if (pc.hasVagina() || pc.hasCock()) addButton(0, "Yes" annoPostQuestSexytimes);
	else addDisabledButton(0, "Yes", "Accept Offer", "You need some form of genitalia to accept Annos offer.");

	addButton(1, "No", annoPostQuestSexytimesRefusedWhatAreYouGayOrSomethin);
}

function annoPostQuestSexytimes():void
{
	clearOutput();
	author("Savin");
	showName("DECK 13\nEPILOGUE");
	showBust("ANNO");

	output("\n\n“<i>Wouldn’t miss it,</i>” you grin,");
	if (pc.tallness > 5 * 12) output(" sweeping Anno up off her feet and carrying the giggling, tail-wagging bundle of horny ausar down the stairs.");
	else output(" rushing after the snowy ausar and grabbing a handful of her ass as you walk. She swishes her tail playfully across your face, letting it drape around your shoulders, holding you close as you slip into her apartment.");
	
	output("\n\nThe two of you stumble down the rest of the stairs, hands and lips all over each other. Anno’s back meets a bulkhead just beside her bathroom and her legs wrap around you. Meeting her desire, you kiss your way down her neck and then the full mounds of her tits to bring your lips around one of her stiffening teats. The canine-like girl moans, back arching when your [pc.tongue] laps over the pebbly ring of her areola. You pause there, slowly circling her nipple and lavishing it with your tongue until the little point is diamond-hard. Your hand drifts down her side, fingers teasing across the sensitive flesh of her inner thigh until her breath catches; Anno bites her lip, trying not to cry out. One hand grip slips between her legs to the sodden gulf of her sex, already slick with her excitement. Your fingers brush along her lower lips, sending a shiver up the horny ausar’s body. A low, husky moan reaches your ears, and Anno’s arms wrap around you to pull you tightly against her. You let go of her breast in acceptance of a tongue-filled kiss, punctuated by one of your fingers penetrating her sex and sliding into the wet channel of Anno’s pussy. ");
	
	output("\n\n“<i>Slow... slow down,</i>” she moans with fluttering eyelashes. Probing into her, you tease the tender inner walls of her cunt. Her muted protests are practically an invitation: you push another finger in and spread ‘em wide, letting the natural juice dribble down into the palm of your hand. Anno blushes and squirms as you tease her, leaving her neck open for you to kiss and nibble on. You drink deeply of her scent while you do; the heady mix of sex and sweat and her sweet, lavender hair leaves you breathless, desperate for more.");
	if (pc.hasCock() && pc.isCrotchGarbed()) output(" [pc.EachCock] pulls desperately against your [pc.armor], swelling with your own mounting need. One of Anno’s hands brushes across it, gently cupping your turgid bulge and starting to tug you out of your gear.");
	else if (pc.hasCock() && !pc.isCrotchGarbed())
	{
		output(" Your unclad [pc.cocksLight] swell");
		if (pc.cocks.length == 1) output("s");
		output(" with your own mounting need, hard and hot against Anno’s bare thigh, so close to penetration you can almost feel the heat welling off of her sultry sex. One of her hands wraps around your turgid member, gently stroking it as she pulls your [pc.gear] away.");
	}
	else if (pc.hasVagina()) output(" Your own [pc.cunts]");
	if (pc.vaginas.length > 1) output(" are");
	else output(" is");
	output(" boiling with need, running slick with excitement as you drink in your lover’s scent. You give a little moan as Anno finally returns the favor, one of her white-clad hands brushing aside your [pc.gear] and tracing across the lips of your [pc.cunt].");
	output(" Breathless, Anno desperately pulls your [pc.gear] off to let it clatter to the floor before giving you a push through the bathroom door. ");
	
	output("\n\nYou all but tumble into the shower stall, and a blind, snow-furred hand clumsily reaches out towards the dial, cranking the water on around you. You gasp as the first gout of hot water splashes over you, only to find yourself shoved up against the wall of the stall as Anno frees herself from your grasp and takes charge, slipping down to her knees and spreading your [pc.legs] apart. ");
	
	// Cockwielder Variant
	if (pc.hasCock())
	{
		output("\n\nYou can’t suppress a groan as Anno’s fingers wrap around your dripping member, using the flowing water as lube to quickly pump up and down your swelling length and jacking your [pc.cock] until it’s nice and hard. Her cheek nuzzles against your [pc.crotch] while her tongue reaches out to caress");
		if (pc.balls > 0) output(" your [pc.balls]");
		else output(" the base of your [pc.cock]");
		output(", one long lick carrying her along the long shaft of your cock and straight to the crown. Anno looks up and shoots you a grin before wrapping her lips around your cockhead");
		// I'm intentionally trying to be as inclusive as possible here, I dunno if we wanna convert some of these to && etc.
		if (pc.cocks[pc.biggestCockIndex()].hasFlag(GLOBAL.FLAG_BARBED) || pc.cocks[pc.biggestCockIndex()].cType == GLOBAL.TYPE_FELINE) output(", brushing her tongue across the bumps and ridges of your feline-like member");
		else if (pc.cocks[pc.biggestCockIndex()].hasFlag(GLOBAL.FLAG_BLUNT) || pc.cocks[pc.biggestCockIndex()].cType == GLOBAL.TYPE_EQUINE || pc.cocks[pc.biggestCockIndex()].hasFlag(GLOBAL.FLAG_FLARED)) output(", her jaw straining to encompass your flared equine girth");
		output(". One of your hands settles atop Anno’s head, stroking the mat of wet hair between her perky ears as she teases your crown, gently urging her onwards. ");
		
		output("\n\nShe resists for a long, obstinate moment, content to merely suckle from your turgid member and lavish its tip with her tongue. Her hand continues to pump your length, too, moving with such speed and skill that it isn’t long before Anno gets a nice, thick drop of pre right on her waiting tongue. She pulls herself off you, licking her lips as water cascades down over her face, and she cups the full mounds of her tits toward the shower head to let it get them nice and soaked. Winking at you, the ausar reaches up and grabs the little bar of soap from the dish and, squeezing her breasts together with her shoulders, starts to wash them down, scrubbing every inch of supple titflesh until they’re covered in suds and bubbles. As she works, her lips lock back around your crown, sliding down your slippery shaft; she’s not going to let you go soft while she gets ready! You’re treated to a spectacular view of Anno on her knees: her big blue eyes lock with yours as she sucks you off, her tits glistening beneath your length as she rubs them down. ");
		
		output("\n\nFinally satisfied that her chest is as slippery as can be, Anno gives you a sultry wink and leans up, dropping your [pc.cock] from her lips to her cleavage in one smooth motion. Her hands lock around her perfect mounds, squeezing them tightly around your wet-and-ready cock. “<i>Like it?</i>” she asks with a grin, not waiting for an answer before rocking her shoulders back and forth and letting your member slide through the slippery grasp of her cleavage. It nearly pops out but for her quick-acting fingers, which keep you nice and trapped in her heaving bosom. Her kneeling legs start to power her motions as she slowly rises and falls back, taking your cock with her as she moves, guiding it through every inch of her slippery, hot, soapy rack: your crown pokes out between them one moment, just long enough for her to kiss and lick your [pc.cockHead], before vanishing back into her sudsy tits again the next. ");
		
		output("\n\n“<i>The best thing about shower sex: the mess is self cleaning,</i>” she says, more than a hint of suggestion in her voice. She’s moving faster now, all but bouncing on her knees. Her eyes never leave yours, totally focused on you even as she starts moaning and panting, working hard to get you off. Trapped as you are between two hot, slick mounds of sexy ausar tit, you soon feel the rising heat of impending and inescapable pleasure welling in your loins. Anno sees it in your eyes and redoubles her efforts, pumping away at your desperately clenching [pc.cock] until you can’t hold back anymore. ");
		
		output("\n\n“<i>Come on, boss. Make a mess,</i>” Anno urges, leaving her mouth wide-open at that last syllable, just as you let loose the first jet of jizz through the gap between her boobs. That first ribbon of [pc.cumColor] doesn’t quite hit her mouth, instead splattering over her cheek -- and vanishing a moment later as the hot, still-liquid load is washed away by the powerful spray of the showerhead. Another jet of spunk sprays over her chin, then the next is caught between her tits, filling the valley of Anno’s cleavage with your hot, creamy seed as she continues to pump you, still moving all through your orgasm and using her tits to milk every last drop from you. ");
		
		output("\n\nWhen your climax passes, you’re left slumped against the shower stall’s wall and trying to catch your breath. Anno licks an errant bit of cum from her cheek as she stands, letting the water clear the rest for her. With a little wiggle of her hips, Anno makes her way to the front of the stall and plants her hands on the ceramic tiles, shifting her legs wide apart and raising her tail invitingly to give you a good look at the still-slightly parted lips of her sex. ");
	}
	else
	// Cuntcommander Variant
	{
		output("\n\nAnno breathes out while she shimmies down, her chest rocking with an exhalation that lands hot and humid across your bare sex. You shiver with delight when the rush of warm air brushes across the water-slick lips of your [pc.cunt]. Slowly, she brings her cheek in to rest against your thigh, hands resting on your [pc.hips] to steady your body. You need it, too: you only notice how you’re shivering in anticipation when you’re suddenly stopped and forced to hold still in Anno’s firm grasp. ");
		
		output("\n\nWith tantalizing slowness, Anno lets her tongue loll out, the tip just grazing your thigh before making its way across the mound of your vulva and brushing along to just the crest of your clit before breaking off and starting again: damn tease! You stifle a moan as she does it again, this time just flicking across the lip of your buzzer’s hood to send an electric shock of pleasure through you that sets every nerve afire with desire. Your hand drifts instinctively to the wet mess of snowy hair atop Anno’s head, trying to guide her in; she resists for now, instead content to tickle and tease your thigh and lips while never quite making full contact. ");
		
		output("\n\nYou’re soon approaching your limit: your [pc.legs] are trembling, feeling like masses of jelly that quiver helplessly at Anno’s touch, ready to give at the slightest sexual stimulation. With a wolfish grin, Anno locks eyes with you and gives you a knowing wink before letting her tongue do the talking. A shock of pleasure surges through your body when Anno’s tongue finally gives you want you want -- what you need -- gliding across the full swell of your [pc.clit]. You can’t hold in a low, husky moan, squirming at the sensation of her oral assault; she answers with more licks across your blood-swollen buzzer. ");
		
		output("\n\nWithout Anno and the wall supporting you, you’re sure you’d collapse under the overwhelming pleasure. Despite that, the hand planted between Anno’s ears instinctively pulls her inward, mashing the ausar’s face against your [pc.cunt] to try getting more and more from her probing tongue. Gigging, Anno gives it to you: she traces her tongue from your clit down into the folds of your pussy, parting your lips and slipping in. Your head rolls back, eyes squeezed shut as Anno explores your [pc.cunt], licking across your tender walls, letting your muscles squeeze around her, happily lapping up your flowing excitement as she works. She’s relentless, slurping and lapping minute after minute, never giving you a moment’s respite. Her fingers dig into your [pc.hips], holding you fast as she delves into your sex with a long tongue that tastes your deepest recesses. Your free hand drifts upwards,");
		if (pc.biggestTitSize() > 0) output(" cupping one of your [pc.breasts]");
		else output(" caressing your flat chest");
		if (pc.nipplesPerBreast > 0) output(" and pinching the [pc.nipple] there with a squeeze on the tender mound that’s just forceful enough that you can’t help but cry out.");
		else output(".");
		output(" You’re desperate for pleasure now, hips bucking on Anno’s tongue. If she doesn’t back off soon, you won’t be able to stop yourself from cumming... ");
		
		output("\n\nThat seems to be Anno’s plan. You’re moaning like a bitch in heat now while your juices mix with the running water of the shower between your [pc.legs], trickling hot down your thighs between Anno’s rhythmical licks and kisses across your sex. You’re soon reaching your limit, voice breaking higher and higher into lusty moans and cries, even begging Anno for release. She’s eager to grant it, barely acknowledging your cries but for one look up at you to lock eyes with you and hold your gaze firmly, making you watch as she brings you to the brink of orgasm. ");
		
		output("\n\nFinally, you can take no more. With a shrill cry of feminine pleasure, you let your ausar lover bring you over the edge. Sexual bliss overtakes your every nerve, your body afire with desire while Anno feverishly eats you out with a tongue that moves faster and faster as you surrender to ecstasy. Shudders and shakes rock your body, their force nearly enough to make you go limp with exhaustion by the time your orgasm passes. Your prolonged moment of passion leaves Anno’s face awash with your juices -- which quickly wash away as the downpour continues from the shower head. With a little wiggle of her hips, Anno makes her way to the front of the stall and plants her hands on the ceramic tiles, shifting her legs wide apart and raising her tail invitingly to give you a good look at the still-slightly parted lips of her sex. ");
	}
	
	// Combine for Great Ausar Rugmunching
	output("\n\nHer intent is clear, and as the aftershocks of your climax pass, you figure you owe the lusty slut a reward for her efforts. You step after her, one short stride putting you right behind the drenched, dripping curl of her up-raised tail. You let your hands wander across her body: they start at her shoulders and slide slowly down, making sure to sensuously rub at the right spots as they go. Your fingers slip around her ribs and up her chest to cup the slippery mounds of her tits, giving them an affectionate little squeeze. Anno moans at this, her back arching and her hips squirming back against your [pc.crotch] while you massage her big breasts, letting your fingers sink into her soft, pliant flesh. Her nipples stiffen between your digits, and you feel your lover being wracked by a full-body shudder as you roll the twin points between your fingertips. Teasing and squeezing, you keep up the pressure on Anno’s breasts until her breath is coming out in shuddering gasps and her sodden figure is trembling at your every touch. You can only imagine the sultry gulf forming between her legs by now as the ausar’s plentiful excitement mixes with the hot water of the shower into a glistening, inviting delta. ");
	
	output("\n\nYou’re on your [pc.knees] before you know it, and hands reach out to grope an altogether different pair of soft mounds. You spread her cheeks apart, trying to ignore the flick of her tail across the bridge of your nose. With a squeeze of her ass, you earn a moan and a tail-wiggle from the ausar babe, ending with her back-end perched atop your head like a hat, finally giving you unimpeded access to her ample rear. More importantly, you’ve now got a straight shot to the slick slit of her sex and are able to see the glistening lips of Anno’s pussy beading with a mixture of water and her own ample juices. ");
	
	output("\n\n“<i>Fuuuck,</i>” Anno moans, voice low as you draw a pair of fingers along the lip of her cunt, only just stopping yourself from penetrating her again. You watch with glee as a thin trickle of lubricant runs from her hole and drools across your fingertips in answer to your constant teasing. You snatch the little bead up, acting before the shower can wash it away, and lick it from your fingertips. Your breath catches at the potent, sweet taste of your lover’s passion. That does it -- that one taste kicks your instincts into high gear and drives away the last of your restraint. You bury yourself between Anno’s plush cheeks to thrust your [pc.tongue] deep between her parted lips, desperate for more of that wonderful sweetness. ");
	
	output("\n\nAnno gasps and moans as you tongue-fuck your way into her, worming your way through her lips and into the slick, eager passage beyond them. Her walls squeeze around you, instinctively repelling you at first, but then seeming to urge you in deeper as you drive against them. You give the lusty slut everything you have to give, pushing in deep and lavishing her squirming walls with oral affection. You’re rewarded with Anno’s cute moans and an ever-increasing flow of her sweet nectar, beads of it rolling across your tongue and nose only to vanish into the running water. As you lick through the valley of her womanhood, Anno’s back slowly begins to arch. Her whole body slinks down the slick wall of the stall, bending over to let you delve ever deeper into her sex. ");
	
	output("\n\n“<i>Ah... I think we’re going to need </i>another<i> shower after this,</i>” Anno remarks with a grin, rocking her hips back against you and giving you a facefull of wet ass on top of everything. You give her big cheeks a playful squeeze, holding her back before you drown in her slippery backside. Anno coos happily as the new angle brings you deeper inside her, and even moreso when you let one of your hands slip from her behind to venture up between her legs and tease your fingertips across the bud of her stiff little clitty. Now <i>that</i> gets her going: a few minutes of that and her moans are reaching an ever-higher pitch. The movements of her hips become more desperate, frantic for your every touch. Her juices practically pour across your [pc.tongue] as her body prepares for a thick, knotty ausar cock that isn’t coming. You lap up every drop you can, sending waves of palpable pleasure through Anno’s quivering body until she’s practically a puddle of fuck on the shower floor that’s barely able to keep herself upright. ");
	
	output("\n\n“<i>Just a... just a little more, boss,</i>” Anno whines, slumping against the stall wall and cupping a breast while trying to wring out every bit of stimulation she can before she utterly succumbs to you. It isn’t long until she does: a few more moments pass before a sudden shiver takes her, starting with a vicious clamp around your tongue as her muscles contract and continuing with a hard squeeze once the first waves of orgasm pass through her. You keep licking all through it, giving the ausar a steady stream of consistent motions to ground herself on as she rides though a wet, hot climax that ends with her panting and gasping for breath, giggling all the while as you tease at her most sensitive spots. ");
	
	output("\n\nThe next few minutes are spent in quiet afterglow. The two of you help each other wash away the sweat and scent of sex. You take turns scrubbing all those hard-to-reach spots for each other, though that only ends with Anno pressed against the wall, your lips on hers as you blindly search for the shower handle. The water finally abates to leave you in a cloud of mist that clings to your bodies, keeping you nice and hot as you enjoy each other for a last few moments. ");
	
	output("\n\nFinally, though, you step out of the shower and towel down. When you’re done, Anno wraps hers around her hair and ears, in order to leave herself bare and on full display for you. “<i>Thanks, boss. I needed that,</i>” she says with a wink, leaning in to give you a peck on the cheek. “<i>I’m going to go put in my after-action report to Corporate. Pop into the shop whenever, and we’ll see what happens.</i>” ");
	
	output("\n\nWith that, Anno grabs a fresh catsuit out of her closet and slips out of sight, which leaves you to collect your scattered [pc.gear] and return topside.");

	player.orgasm();
	anno.orgasm();

	processTime(20+rand(5));
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

function annoPostQuestSexytimesRefusedWhatAreYouGayOrSomethin():void
{
	clearOutput();
	author("Savin");
	showName("DECK 13\nEPILOGUE");
	showBust("ANNO");

	output("“<i>Alright, suit yourself,</i>” Anno shrugs. “<i>I’ll be back in a few... hopefully with an approved transfer notice.</i>”");
	
	output("\n\nShe sashays off, disappearing down the stairs.");

	processTime(30+rand(5));
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}