//Steele Tech Shop (Tarkus)
//Dogsloots 'r' Us

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
	chars["ANNO"].keeperBuy = "<i>\"So, about that discount...\"</i>\n\n<i>\"Of course. Right this way, " + pc.mf("Mr.","Ms") + " Steele,\"</i> Anno says, guiding you to the register.";
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
	if(flags["ANNO_SEXED"] == undefined)
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
	if(pc.hasStatusEffect("Rusted Emitters")) addButton(4,"Fix Emit.",fixMyEmittersShekka,undefined,"Fix Emit.","See if Shekka can possibly fix your sydian-damaged shield emitters.");
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

/*9999 items 2 add
Hammer Carbine
	Attack: +2
	Damage: 14 Kinetic
	Tooltip: A questionably civilian-legal modification of the popular Hammer pistol, the Hammer Carbine features a folding stock for greater accuracy, an expanded magazine, and a three-round burst trigger mod, greatly increasing damage-per-hit over its smaller cousin.

Laser Carbine
	Attack: +3
	Damage: 12 Energy
	Tooltip: The Reaper Mk.5 Laser Carbine is currently the service rifle of the Terran Coalition Expeditionary Force, the main force of Earth's military. Produced with an integrated holographic scope and digital heads-up display, the Reaper Mk.5 is a sturdy, balanced rifle suitable for a variety of combat scenarios.

EMP Grenade
	Tooltip: Used by soldiers and police officers to quickly neutralize shielded or robotic opponents, modern EMP grenades temporarily fry electronics. Though individually expensive, these little babies pretty much pay for themselves when you're up against a heavily shielded enemy or an assassin droid!

TS-T Armor Plating
	{From debug room. Why not!}

Goovolver
	{Also from debug room :3}

ZK Rifle
	{Since you can't get one if you don't do GurobotQuest}
*/

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
	addDisabledButton(0,"Yes","Yes","This shit isn't coded yet.");
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
	addDisabledButton(0,"Sex","Sex","This isn't in the game yet.");
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
	addButton(0,"Anno",askAbootAnnoz,undefined,"Anno","Ask her about herself.");
	addButton(1,"Novahome",novaHomeTalk,undefined,"Novahome","Ask her about the Nova.");
	addButton(2,"Locals",talkToSyriAboutTheLocals,undefined,"Locals","Ask her about the locals.");
	addButton(3,"Lovers?",anyoneSpecial,undefined,"Lovers?","Ask Anno if she has any lovers.");
	addButton(4,"Business?",howsBusiness,undefined,"How's Business?","Ask Anno about how business is at her shop.");
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

	//If PC has sex'd Anno:
	if(flags["ANNO_SEXED"] != undefined)
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
	if(pc.hasCock()) output("Come on, we even have the same cup size. Imagine two identical pairs of tits, big and soft and all over your [pc.cockBiggest], jacking you off together until you bust a big, thick nut all over our faces... watching us lick it off each other, maybe turns into kissing, groping, until you bend us over and take us together, still in each others' arms...");
	else output("Imagine yourself bent over, face buried in Anno's big, perky tits, your hands all over the sensitive little teats of hers as I fuck you from behind, pounding you extra hard cuz you've got your grubby, terran hands on my sister... until maybe my cock slips, and suddenly I'm doing her, pounding her wet, sloppy little bitch-hole while you watch.");
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
	if(flags["ANNO_SEXED"] != undefined) output("It might be a little too late for this question, but... ");
	output("You ask Anno if there's anyone special in her life. She laughs, <i>\"What're you, trying to sell me the Good Book or something?\"</i>");
	output("\n\nYou cock an eyebrow at her. <i>\"Sorry. Uh, well... kind of? I've got a girlfriend, Kaede, but we're kind of in an on-again-off-again sort of place right now. Plus we've always been in an open relationship, so don't worry... I'm not out of your reach yet, " + pc.mf("Mr.","Ms.") + " Steele!\"</i> she teases, giving you a wink.");
	output("\n\nYou follow up, asking her to tell you about the special lady.");
	output("\n\n<i>\"Kaede? Oh, I met her while I was doing grad work at Ausaril Tech. Go jackals! I was a few years older than her, but we hit it off... dated for a couple years till she had to withdraw. She was actually through here just a few weeks ago, helping me with some things: we had a run-in with some mercs and raskvel. Fun times. Anyway, she's a freighter captain, independent. Cute, nerdy, with curves in all the right places... plus a big dick, which is, you know, pretty great.");
	processTime(2);
	if(pc.hasCock())
	{
		//if PC has a bigger cock than 8in, has sex'd Anno:
		if(pc.biggestCockLength() > 8 && flags["ANNO_SEXED"] != undefined) output(" I mean, not as big as </i>yours<i>, but still.");
	}
	output("\"</i>");
	clearMenu();
	addButton(0,"Threeway",threeWayAnno,undefined,"Threeway","Ask her if she's up for threeways sometime.");
	//[Leave] [Threeway?]  If NotSex'd & PC is girl: [Into Girls?] PC is shemale/futa: [Into Dickgirls?]
	//If NotSex'd & PC is girl: [Into Girls?]
	if(pc.hasVagina() && !pc.hasCock() && flags["ANNO_SEXED"] == undefined)
	{
		//[Into Girls?]
		addButton(1,"Into Girls?",intoGirlsAnno,undefined,"Into Girls?","Ask her if she's into girls.");
	}
	//PC is shemale/futa: [Into Dickgirls?]
	else if(pc.hasCock() && pc.mf("he","she") == "she" && flags["ANNO_SEXED"] == undefined)
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