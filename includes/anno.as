import classes.Items.Guns.Goovolver;
import classes.Items.Miscellaneous.GrayMicrobots;
//Steele Tech Shop (Tarkus)
//Dogsloots 'r' Us

function annoSexed(arg:int = 0):int {
	if(flags["ANNO_SEXED"] == undefined) flags["ANNO_SEXED"] = 0;
	if(arg != 0) flags["ANNO_SEXED"] += arg;
	return flags["ANNO_SEXED"];
}

//Outside Descriptor
//output("Set into the wall of the main corridor through the <i>Nova</i> is a smallish shop bearing your name: a neon \"Steele Tech\" hangs above the door, the last \"e\" on your name flickering pitifully every few moments. A dusty window into the shop shows stacks of salvaged tech from the wastes outside, mostly old machine parts, though there are a few weapons and useful bits with glowing holo-price tags hovering over them.");
function steeleTechBonusFunction():Boolean
{
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
	else chars["ANNO"].keeperBuy = "<i>\"Wanna take a look through the catalogue? Victor said I could give you a pretty nice discount.\"</i>\n";
	buyItem();
}
function annoShopSetup():void
{
	author("Savin");
	userInterface.showBust("ANNO");
	userInterface.showName("\nANNO");
	shopkeep = chars["ANNO"];
	chars["ANNO"].keeperBuy = "<i>\"Wanna take a look through the catalogue? Victor said I could give you a pretty nice discount.\"</i>\n";
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
	addButton(0,"Next",annoShootsResults);
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
	output("With Anno panting happily, bent over the counter with her ass in the air and tail waggily freely behind her, you figure the perky little ausar's in for a special treat.");
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
	if(annoSexed() == 0)
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

	output("\n\nSyri cocks an eyebrow at you. <i>\"Why do... right, billionaire playboy,\"</i> she rolls her eyes. <i>\"Tell that pussy-stealing harpy she can write </i>me<i> whenever she feels like it. I haven't exactly changed email addresses.\"</i>");
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
	output("<i>\"So, what do you think of Nova?\"</i> you ask, gesturing out the shop front to the derelict spaceship around you.");
	output("\n\n<i>\"Honestly? Scares the hell out of me,\"</i> Anno says, matter-of-factly. <i>\"The decks creak, pipes and wires break all the time... I'm amazed we have power. And more amazed that when we do, the reactor doesn't go nuclear. I wouldn't be surprised if I wake up one morning as a pile of ash. And that's on a good day.\"</i>");
	output("\n\nAnno shudders. <i>\"Sorry to be a downer, boss. It's not the worst gig in the world: at least I'm not stationed on Galotia or something. Still, this ship's seen better days, even putting aside the crash. I'm not sure if the Nova got shot down or just fell into the planet's gravity well, but this place is </i>ancient<i>, and I don't use the word lightly. I'm still poking around, doing some research on it. I know its human, but I couldn't extranet search up a trace of it. At least, from before the rushers found it. No departure records, no crew manifest, no record of who owned it... I've turned up something about a Bell-Isle-stroke-Grunmann company from the robo-goo-things outside after I net-hacked a few of them, but other than that... nothing. Every computer onboard is either slagged or wiped, and I can't recover anything. The only databanks I've come across are deadlocked. I tried connecting to the reactor's computer, and got my rig fried for my trouble.\"</i>");
	output("\n\n<i>\"Something's seriously wrong with this ship,\"</i> she concludes. And quieter, she adds, <i>\"When my computer burnt out, I heard... God, it was like the wails of the damned. This place is a tomb.\"</i>");
	output("\n\n<i>\"Woah.\"</i>");
	output("\n\n<i>\"Yeah,\"</i> Anno sighs. <i>\"It's like something out of a horror movie, but so far we're just in the tense part, before the jump scares. There's even been some disappearances, you know? That Shekel girl or whatever across the way's been screaming about it, just about starting a riot... but she's not wrong. I don't think its slavers, though. The pioneers woke this ship up when they landed, and now?\"</i>");
	output("\n\n<i>\"Anyway, I probably sound like a nut job, huh? Let's just say this place gives me the creeps, boss. You ask me: bomb the </i>Nova<i> from orbit.\"</i>");
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
	output("<i>\"So, how's business these days?\"</i> you ask, giving a nod towards the widget shop across the way.");
	output("\n\nAnno's eyes dart around the storefront, mostly devoid of customers, and shrugs. <i>\"Could be better. The Mess keeps most of the spacers close by, but they're the only ones buying, pretty much. Which is fine, I guess: we're more of a research station than a shop, anyway. And it leaves me with plenty of free time.\"</i>");
	output("\n\nYou give her a little nudge and ask about the competition.");
	output("\n\n<i>\"Well... there's Skezza's junk hut across the corridor. Or was it Shella? Shekka? Shekka! She's mostly selling shit the raskvel salvage from Nova or the wasteland outside, and most of what I've bought from her just breaks or explodes. For a race supposedly all about fixing things over building them, you'd think I could walk down the hall without a shield belt on. Wouldn't buy from her again, but she seems pretty cute, so... I dunno. I just wanna give her a hug every time I see her.\"</i>");
	output("\n\nYou chuckle at the thought, but Anno just sighs. <i>\"Honestly, I kind of think... no, I </i>know<i> I'm wasted out here. I've got a fucking PhD, but I'm manning a store on... on fucking TARKUS of all places. Thanks for giving me responsibility and all, I appreciate that - I really do - but seriously. It smeeeeelllsssss heeeerrreeeee.\"</i>");
	output("\n\nYou pat Anno reassuringly on the shoulder as she pouts.");
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