/*Shekka's Widget Warehouse
//Your one-stop shop for saucy Raskvel funtimes.
//Author: Fenbroxo

/*Notes & Plans:
Last name potentially Mechflai.
Small B-cup, though she doesn't wear a bra.
3'7". Dicks over 14" long can't bottom out in her without some kind of elasticization upgrade. Perhaps Sparrow Brand Flexibility Serum?
Red skin (the color of Stowaway's Scalia (sorry, Savin) [why.jpg]), pink hair (dyed?)
Deep purple vagina. Aft clit is slightly bigger than fore, leading to preference for doggystyle. Nipples eggplant colored.
Tongue is unusually long (8") and the same color as her cooch.
Pink eyes. Vertically slit like a reptile.
"Hair" (pink) is on the long side with a bit of a mane.
Has a subdermal vibrator implanted in her tail. "I'm my own sex toy!"
Tech fetishist (not in the sexual sense. Loves all the gadgetry from the rest of the universe).
Hates "The Mess" and feels like it's just a setup to scout raskvel for sexual slavery under the guise of providing food.
A bit flighty emotionally but cares deeply for her people.
Wears a welding mask and a JoyCo jumpsuit (think Miranda's hexagon-butt suit from ME2 but super thin for maximum camel toe and nip display.
Ears almost reach the floor, and decorated with chiming piercings. Stealth is not her strong suit.
Tail wags when happy.
Nearly infertile - only ever lays one to two eggs that are never fertilized.
Sells a hoverboard (reduces movement times) and other gadgets
*/

public function showShekka(nude:Boolean = false):void
{
	userInterface.showBust("SHEKKA" + (nude ? "_NUDE" : ""));
	userInterface.showName("\nSHEKKA");
}
public function shekkaBustDisplay(nude:Boolean = false):String
{
	return ("SHEKKA" + (nude ? "_NUDE" : ""));
}

// Widget Warehouse Description
public function widgetWarehouseBonusFuntimes():Boolean
{
	output("Reddish dust filters down from the improvised rafters of this small, warehouse-like structure. The door snaps shut behind you with the audible hiss you’d expect from a high-efficiency starship hatch in spite of its placement in a ramshackle hut. Ancient, rusted bins and buckets are stacked into wobbly pillars, each holding mechanical parts, circuits and devices in far better shape than themselves. The light from a dozen fixtures of various designs and luminances shines off the stored machine parts brightly enough to make you shield your eyes as you look around. Leaning against the far wall like an exhausted soldier is an improvised workbench. Why, its middle is built on the back of a torso from a hollowed-out construction droid.");
	output("\n\nThere can be no doubt; you’re in an engineer’s workshop.");

	//Planet cracking dungeon followup:
	if(flags["TARKUS_BOMB_TIMER"] <= 0 && flags["TARKUS_BOMB_TIMER"] != undefined && flags["PLANET_3_UNLOCKED"] == undefined)
	{
		shekkaMidDeal();
		return true;
	}
	if(shekkaIsCrew())
	{
		output("\n\nYou recruited Shekka. <b>She’s in your ship, not this shop!</b>");
	}
	//Shekka's Room Appearance Blurb
	//Not met
	else if(flags["MET_SHEKKA"] == undefined)
	{
		output("\n\nCrackles and zaps from welding equipment silhoutte the distinctive figure of a long-eared raskvel at work. Her rounded, egg-bearing hips identify her as a female of the species long before anything else. She doesn’t seem to be paying attention to you just yet, but you could easily get her attention. This is supposed to be a shop, right?");
		addButton(0,"Mechanic",approachShekka);
	}
	//Met
	else 
	{
		output("\n\nShekka seems to be busy welding together parts from a dozen disparate machines into something new and different. Her tail wags back and forth while she works, brushing against her nearly floor-dragging ears and causing the piercings embedded in them to chime musically.");
		addButton(0,"Shekka",approachShekka);
	}
	return false;
}

// Accidental pregnancy hotfix
public function shekkaPregnancyHotfix():void
{
	clearOutput();
	showBust("SHEKKA");
	showName("SHEKKA\nFIXED!");
	
	chars["SHEKKA"].pregnancyData = new Array();
	for (var i:int = 0; i < 4; i++)
	{
		chars["SHEKKA"].pregnancyData.push(new PregnancyData());
	}
	output("<b>Shekka’s pregnancy issue has been resolved.</b>\n\n");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function approachShekka(back:Boolean = false):void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	
	if(pc.hasStatusEffect("Raskvel Prophylactic"))
	{
		output("The mechanic waves you away. <i>“Come back when you don’t stink like a rotting gark!”</i>");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	if(flags["SHEKKA_ISSUES"] == 5 && !pc.hasStatusEffect("Shekka_Pay_CD")) 
	{
		shekkaCureTalk();
		return;
	}
	if(flags["SHEKKA_ISSUES"] == 6 && !pc.hasStatusEffect("Shekka_Cure_CD"))
	{
		theCureIsReadyShekka();
		return;
	}
	if(flags["SHEKKA_ISSUES"] == 7 && MailManager.isEntryViewed("shekkaFollowerUnlockEmail"))
	{
		shekkaJoinCrewOffer();
		flags["SHEKKA_ISSUES"] = 8;
		return;
	}
	//Approach Introductions
	if(flags["MET_SHEKKA"] == undefined)
	{
		flags["MET_SHEKKA"] = 1;
		output("You noisily clear your throat to get her attention.");
		output("\n\nShe doesn’t react.");
		output("\n\n<i>“Excuse me, miss?”</i> you try again.");
		output("\n\nNothing but the loud hiss of her welder.");
		//Nice
		if(pc.isNice()) output("\n\nSighing, you call out, <i>“Miss! Are you open?”</i>");
		//Mischievous
		else if(pc.isMischievous()) output("\n\nSmirking, you tap her on the shoulder.");
		//Hard
		else output("\n\nFrowning, you yell, <i>“What kind of shopkeep doesn’t keep an eye out for customers!?”</i>");

		//Merge
		output("\n\nThe little mechanic nearly jumps out of her jumpsuit (a feat you would have thought impossible prior) and screams, <i>“Eyaaaaaaaaah!”</i> Her torch flies from suddenly nerveless fingers, but the safety kicks in, disabling it before the arcing electrical discharges can transform the workshop into a blazing inferno.");
		output("\n\nYou step back from the tiny, gasping figure with its face hidden behind a welding mask. Are all raskvel this jumpy?");
		output("\n\n<i>“Damnit, you nearly gave me a heart attack! Do ya’ just go about scaring harmless folk for your own sick pleasure, or did you not see me working here?”</i> She rounds on you, lifting her mask to reveal luminous pink eyes, a button nose, and unruly, salmon-tinted feathers in place of hair. She inhales sharply at the sight of you, interrupting her own tirade, <i>“Well... hello there, offworlder. Pardon my rudeness; I thought you might be a youngling with a bit too much time on his hands. I have to chase them out of my shop at least twice a rotation, it seems.”</i> The raskvel smiles sheepishly before extending her hand. <i>“The name’s Shekka, and this here’s my shop. Nice to meet ya.”</i>");
		output("\n\nYou shake the diminutive girl’s hand and introduce yourself. Then, you muse aloud, <i>“This whole shop is yours?”</i>");
		output("\n\n<i>“You betcha,”</i> she reports, her grin widening into a sassy smile. <i>“Don’t underestimate what one of us small folk can accomplish.");
		if(pc.tallness <= 50) output(" I suppose you wouldn’t though. Always nice to get to talk to someone eye to eye, if you catch my meaning.");
		output("”</i> Turning away, she reaches for the torch and unintentionally gives you an eyeful of her wide-hipped derriere, framed by a broad thigh-gap that gives you a decent look at an alien camel-toe through the thin fabric of her white, hexagon-patterned jumpsuit. The clang of the tool being set on her half-finished project draws your attention back up before you get caught staring.");
		output("\n\n<i>“I’m the best gadget dealer in all of Novahome. Whether it’s a custom-built repair from the scrapheap or an order from a core-based megacorp, I’ve got what you need,”</i> Shekka proudly declares. <i>“What can I help you with?”</i>");
	}
	else if(back)
	{
		output("Is there something else you would like to do with Shekka?");
	}
	//Repeat Approach
	else
	{
		output("You call out her name, and Shekka immediately steps away from her current project. The welding mask pops up out of the way to reveal a smiling face below. <i>“Welcome back, [pc.name]. Got a purchase to make or did you want to jabber a bit?”</i>");
	}
	//Menu
	shekkaMainMenu();
}

public function shekkaMainMenu():void
{
	clearMenu();
	addButton(0,"Appearance",shekkaAppearance,undefined,"Appearance","Review what Shekka looks like in detail.");
	if(flags["SHEKKA_ISSUES"] != undefined && flags["SHEKKA_ISSUES"] >= 2 && flags["SHEKKA_ISSUES"] < 5) 
	{
		if(pc.hasStatusEffect("Shekka_Pay_CD")) addDisabledButton(1,"Fund Project","Fund Project","You’ll need to wait a bit before you get back to Shekka on this.");
		else addButton(1,"Fund Project",shekkaFundProjectTalk,undefined,"Fund Project","Shekka might need some money to get her pet project going...");
	}
	else if(flags["SHEKKA_ISSUES"] == 7 && !MailManager.isEntryUnlocked("shekkaFollowerUnlockEmail")) addDisabledButton(1,"Cure","Cure","You’ll need to wait a while before you can get any more information on the cure.");
	else if(flags["SHEKKA_ISSUES"] == 7 && MailManager.isEntryUnlocked("shekkaFollowerUnlockEmail")) addDisabledButton(1,"Cure","Cure","You’ll need to wait a while before you can get any more information on the cure.");
	else if(flags["SHEKKA_ISSUES"] == 8 && !shekkaRecruited()) addButton(1,"Join Crew",shekkaRepeatJoinCrew,undefined,"Join Crew","Invite Shekka to join your crew.");
	else if(MailManager.isEntryViewed("shekkaFollowerIntroMail") && (flags["SHEKKA_ISSUES"] == undefined || flags["SHEKKA_ISSUES"] == 1)) addButton(1,"Talk",raskvelCureQuestShekkaTalk,undefined,"Talk","Talk with Shekka about the Raskvel.");
	else addButton(1,"Talk",talkToShekka,undefined,"Talk","Talk to Shekka about a range of topics.");
	if(pc.lust() >= 33)
	{
		if(flags["TIMES_SEXED_SHEKKA"] == undefined) addButton(2,"Flirt",shekkaFlirtSexMenu,undefined,"Flirt","Flirt with Shekka in hopes of getting some action.");
		else addButton(2,"Sex",shekkaFlirtSexMenu,undefined,"Sex","See if Shekka is up for some sex.");
	}
	else
	{
		if(flags["TIMES_SEXED_SHEKKA"] == undefined) addDisabledButton(2,"Flirt","Flirt","You aren’t turned on enough to try for sex right now.");
		else addDisabledButton(2,"Sex","Sex","You aren’t turned on enough to be interested in sex.");
	}
	addButton(5,"Buy", shekkaShop);
	addButton(6,"Sell", shekkaShop, true);
	if(pc.hasStatusEffect("Rusted Emitters")) addButton(7,"Fix Emit.",fixMyEmittersShekka,undefined,"Fix Emit.","See if Shekka can possibly fix your sydian-damaged shield emitters.");
	else addDisabledButton(7,"Fix Emit.","Fix Emit.","Your shield emitters are totally undamaged. Don’t worry about it.");
	if(pcHasJunkPrize() && flags["SHEKKA_SCRAP_DISABLED"] == undefined) addButton(8,"Sell Prize",shekkaGetsSoldRaskShitz,undefined,"Sell Prize","Try to sell off the sweet loot you bought from the gang of raskvel males.");
	else addDisabledButton(8,"Sell Prize","Sell Prize","You haven’t found any special salvage to sell.");
	if(peacekeeperTalkAvailable()) addButton(9,"Peacekeepers",shekkaPeacekeeperTalk);
	
	if(shekkaRecruited()) addButton(13, "Join Crew", shekkaRejoinCrew, undefined, "Join Crew", "Ask Shekka to rejoin your crew and move back into your ship.");
	
	addButton(14,"Back",mainGameMenu);
}

public function shekkaShop(sell:Boolean = false):void
{
	shopkeep = chars["SHEKKA"];

	if(!shekkaIsCrew())
	{
		chars["SHEKKA"].keeperBuy = "<i>“I’d like to buy something,”</i> you offer. <i>“What have you got for sale?”</i>\n\nShekka spreads her arms to encompass her entire shop. <i>“Just about anything you see is for sale, but you probably don’t have much interest in buying your gadgets by the part. I’ve got a few items that seem pretty popular among you rushers. One second.”</i> She fiddles with a slim, sparking device atop her workbench to little effect. Growling, she grabs a wrench and whacks it. A flickering, holographic menu displays her wares and their prices. <i>“There we go!”</i>\n";
		//List prices and whatnot. Back should go back to Shekka's main menu.
		//Sell Menu
		chars["SHEKKA"].keeperSell = "Shekka remarks, <i>“I’ll buy if it’s something worth using.”</i>\n";
		chars["SHEKKA"].keeperGreeting = "Shekka shrugs. <i>“Well, what do you want then?”</i>\n";
	}
	else
	{
		chars["SHEKKA"].keeperBuy = "<i>“Still holding onto your shop’s inventory?”</i> you ask. <i>“There was some nice stuff there.”</i>\n\nShekka tosses an ear over her shoulder and puffs out her tiny chest. <i>“You betcha! You don’t just throw out quality items like that... even if you have to pack them into every spare crevice you can find. Besides, if Rushers wanted that stuff when I was on Tarkus... well I figured we might need to make use of it.”</i> She fiddles with a slim, sparking device to little effect. Growling, she grabs a wrench and whacks it. A flickering, holographic menu displays her wares and their prices. <i>“There we go! I still gotta charge you, so I can keep stocking up with the latest and greatest. You’re loaded anyhow, so what’s it matter?”</i>\n";
		//List prices and whatnot. Back should go back to Shekka's main menu.
		//Sell Menu
		chars["SHEKKA"].keeperSell = "Shekka remarks, <i>“Really? I thought you had... I dunno, infinite money! I can probably spare a few credits, but there’s gotta be a better place for you to offload...”</i>\n";
		chars["SHEKKA"].keeperGreeting = "Shekka shrugs. <i>“Well, what do you want then?”</i>\n";
	}
	
	chars["SHEKKA"].inventory = [];
	
	chars["SHEKKA"].inventory.push(new Cargobot());
	if(pc.level >= 7) chars["SHEKKA"].inventory.push(new FZRFireSuppressionSystem());
	if(synthSheathAvailable() && CodexManager.entryUnlocked("SynthSheath")) chars["SHEKKA"].inventory.push(new HorseCock());
	chars["SHEKKA"].inventory.push(new Hoverboard());
	chars["SHEKKA"].inventory.push(new RogueRags());
	chars["SHEKKA"].inventory.push(new ScrapShield());	
	if(shekkaIsCrew()) chars["SHEKKA"].inventory.push(new ShekkasCatsuit());
	chars["SHEKKA"].inventory.push(new Smartclothes());
	chars["SHEKKA"].inventory.push(new StrangeCollar());
	chars["SHEKKA"].inventory.push(new ExpandedBackpackI());
	
	if(!sell) buyItem();
	else sellItem();
}

public function fixMyEmittersShekka():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("<i>“One of the sydians did a number on my shield emitters. You think you could fix them?”</i>");
	output("\n\nShekka circles you, looking your equipment over with a practiced eye before blurting out, <i>“Oh, wow! The projector is all corroded, and I can see some degradation of the cabling here and here!”</i> She jabs a finger into your side and your chest before launching herself onto your back to get at your shield projector directly. You stumble around the shop under the surprise weight, trying to catch yourself on the piles of junk. Shekka’s hands seem to be everywhere at once, and she never stops streaming technobabble into your ears.");
	output("\n\nYou interrupt her. <i>“Can you fix it?”</i>");
	if(pc.hasHair()) output("\n\nRuffling your [pc.hair]");
	else output("\n\nRubbing your head for good luck");
	output(", she declares, <i>“A simple job like this? You bet your ass I can.”</i> She slows her excited scrambling. <i>“Oh, and I guess it should cost... 50 credits? Gotta make a living, you know.”</i>");
	output("\n\nWill you pay her 50 credits to fix your emitters?");
	//[Yes/No]
	clearMenu();
	if(pc.credits >= 50) addButton(0,"Yes",shekkaActuallyFixesEmitters,undefined,"Yes","Pay Shekka 50 creds to fix your emitters.");
	else addDisabledButton(0,"Yes","Yes","You can’t afford to have her fix your emitters.");
	addButton(1,"No",turnDownEmitterFixingFromShekka,undefined,"No","Turn down getting your emitters fixed for right now.");
}

public function shekkaActuallyFixesEmitters():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("<i>“Sure thing.”</i> You transfer the credits as fast as you can with sixty pounds of rambunctious alien prodding you everywhere. It’s tough to keep track of her, but you’re pretty sure that she crawls around your middle at one point. A second later, she’s hanging down by your [pc.butt] with her feet clutching tightly to your head. You try not to blush from her intimate closeness.");
	output("\n\nBefore you know it, your emitters are fixed and the sassy mechanic is springing off of you. <i>“A pleasure as always, [pc.name]. You be sure and come back to me if you have any more sydian problems, okay?”</i>");
	output("\n\nYou nod, uncomfortably aware of the residual warmth she left behind while she snaps her welding mask back into place and resumes working.");
	//+lust
	pc.lust(5);
	//-50creds
	pc.credits -= 50;
	//2m pass
	processTime(2);
	pc.removeStatusEffect("Rusted Emitters");
	clearMenu();
	if(shekkaIsCrew()) addButton(0,"Next",approachCrewShekka,true);
	else addButton(0,"Next",mainGameMenu);
}
public function turnDownEmitterFixingFromShekka():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("Finally managing to get a grip on the rambunctious mechanic, you peel her off and lower her to the floor, uncomfortably aware of how her body had been pressing into yours. <i>“Not right now. I might have the credits to spare later, though.”</i>");
	output("\n\nShekka shrugs and smiles. <i>“Suit yourself. Something else you want?”</i>");
	//+lust
	pc.lust(5);
	processTime(1);
	//Main menu
	if(shekkaIsCrew())
	{
		clearMenu();
		addButton(0,"Next",approachCrewShekka,true);
	}
	else shekkaMainMenu();
}

//Appearance Screen
public function shekkaAppearance():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("From Shekka’s distinctively long ears to egg-bearing hips that easily dwarf her narrow shoulders, she is a prime example of a healthy raskvel woman. Her feathery plumage is long for her species, down past the nape of her neck and dyed into a comely pink mane. A twist of wire wraps some of the feathers together into a tight cord that hangs down the side of her face for simple ornamentation. Just above it, her ears emerge. They’re long and floppy, as you’ve come to expect, and dangle down to her ankles. She has perhaps the biggest ears of any raskvel you’ve met, and they are so heavily pierced that her every movement is accompanied by musical chiming.");
	output("\n\nShekka’s face features two pink, slitted eyes, a button nose, and large but uncared for lips. She could really doll herself up if she desired, but it’s clear that the inquisitive raskvel has interests beyond her own potential beauty. Her smile is still quite winsome, and her large eyes make you question if you’d be able to turn her down if she were to beg for something.");
	output("\n\nThe rest of her body, including her hands, feet and tail, is covered in a white, hex-patterned jumpsuit bearing the symbol the Aegis Shipyards LLC over one B-cup breast. In spite of the full body cover, she manages to make it look absolutely lewd. Her nipples stick out as if shrink-wrapped, and her lush netherlips appear enhanced rather than covered by the nano-weave fabric. You can even make out the twin bumps of her front and rear clits! Given the intelligent gleam in her eyes, you can only assume that she doesn’t care much for modesty. One doesn’t simply “forget” to wear underwear with a garment like that.");
	if(flags["TIMES_SEXED_SHEKKA"] != undefined) output("\n\nYou know from experience that her pussy and tongue are both a deep, vibrant purple, while her nipples are a lighter eggplant shade. Her scales are pale red from the top of her head to her toes.");
	else output("\n\nYou can only guess at the coloration of her alien genitalia, but one thing you can tell is that her scales are a pale red in hue. Likely the pigmentation continues below the neckline of her jumpsuit. You’d have to talk her out of it if you wanted to confirm, though.");
	//No new paragraph:
	output(" All together, her narrow form only takes up a little over three and a half feet of space. They do say big things can come in small packages, however.");
	clearMenu();
	addButton(0,"Next",approachShekka);
}

//Talk
public function talkToShekka():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	trace("SHEKKA TALKS:" + flags["SHEKKA_TALK_COOLDOWN"]);
	//Good to talk [First Time]
	if(flags["SHEKKA_TALK_COOLDOWN"] == undefined)
	{
		flags["SHEKKA_TALK_COOLDOWN"] = 6;
		output("Shekka smiles. <i>“You sure you’re a real rusher? The rest of them buy what they need and ");
		if(flags["TARKUS_DESTROYED"] == 1) output("fly off to their next destination without looking at me twice.");
		else output("charge out into the wilderness without looking at me twice.");
		output(" If you spend too much time schmoozing with the locals, how do you expect to make a fortune?”</i> She blinks innocently. <i>“That’s not to say that I don’t mind your company. I just don’t want to cost you anything more than what I actually charge.”</i>");
		output("\n\nYou inform her that you only have to beat one person out there. Even then, you’ll get to go up against " + chars["RIVAL"].mf("him","her") + " a lot more before this is all over.");
		output("\n\n<i>“Great! I was wanting to take a break anyway. Got something in mind?”</i> Shekka asks with a tilt of her head. Her ears softly jingle.");
	}
	//Talked Within The Past Six Hours
	else if(flags["SHEKKA_TALK_COOLDOWN"] != 0)
	{
		output("Shekka shakes her head. <i>“Sorry, [pc.name], but I’ve got a lot of work to get done around here. I can’t very well sit around chatting all day!”</i> She brushes a bound strand of feathers out of her eyes. <i>“We can still do business if you need something.”</i>");
		//Main menu with talk disabled
		shekkaMainMenu();
		removeButton(1);
		addDisabledButton(1,"Talk","Talk","You’ll have to wait a while until Shekka has time to talk once more.");
		return;
	}
	//Repeat Good To Talk
	else
	{
		flags["SHEKKA_REPEAT_TALKED"] = 1;
		flags["SHEKKA_TALK_COOLDOWN"] = 6;
		output("Shekka grins. <i>“You know, if you keep visiting me like this, I’m going to think you’re developing a raskvel kink.”</i> She whispers, <i>“You wouldn’t be the first.”</i> You start to answer, but she cracks up with infectious laughter. <i>“Relax, [pc.name], it’s not a big deal. As a species, we, well... we like to fuck - a lot. It’s a fact. If you put together a chart of the sluttiest races in the galaxy, we’d be in the top twenty five percent, if not higher.”</i> She snorts, <i>“I guess we’re getting popular, in a way. I can’t say I really mind.”</i>");
		output("\n\nThe tiny mechanic puts a hand on her hip, cocking it to the side. <i>“I assume that if you wanted to talk about how easy we are, you would’ve been a little flirtier. Anyway... what did you want to talk about?”</i>");
	}
	//Didn't return out? TALK MANU!
	clearMenu();
	addButton(0,"Tarkus",talkToShekkaAboutTarkus,undefined,"Tarkus","Ask Shekka about Tarkus to find out more about it from a local’s point of view.");
	if(flags["SHEKKA_TALKED_TARKUS"] != undefined) addButton(1,"Raskvel",talkToShekkaAboutRaskvel,undefined,"Raskvel","Ask about Shekka’s race, the raskvel.");
	else addDisabledButton(1,"Raskvel","Raskvel","You’ll need to talk about Tarkus before getting into a discussion about its inhabitants.");
	if(flags["SHEKKA_TALKED_RASKVEL"] != undefined) addButton(2,"Her Plan",shekkasPlanDiscussion,undefined,"Her Plain","Discuss Shekka’s plan in detail.");
	else addDisabledButton(2,"Her Plan","Her Plan","You’ll need to talk to Shekka about her people, the raskvel, before learning about her plan.");
	if(flags["SHEKKA_TALKED_TARKUS"] != undefined) addButton(3,"Novahome",talkToShekkaAboutNovahome,undefined,"Novahome","Inquire about the Novahome in detail.");
	else addDisabledButton(3,"Novahome","You’ll need to ask about Tarkus first.");
	if(flags["SHEKKA_TALKED_TARKUS"] != undefined) addButton(4,"The Wastes",talkToShekkaAboutTheWastes,undefined,"The Wastes","Ask Shekka about the wastes and what they’re like.");
	else addDisabledButton(4,"The Wastes","The Wastes","You’ll need to ask about Tarkus in general first.");
	if(flags["SHEKKA_TALKED_NOVAHOME"] != undefined) addButton(5,"Her Shop",talkToShekkaAboutHerShop,undefined,"Her Shop","Ask Shekka about her shop.");
	else addDisabledButton(5,"Her Shop","Her Shop","You’ll need to ask about the Novahome before asking about her shop.");
	if(flags["SHEKKA_TALKED_HERSHOP"] != undefined) addButton(6,"Herself",talkToShekkaAboutHerself,undefined,"Herself","Ask Shekka about herself.");
	else addDisabledButton(6,"Herself","Herself","You’ll need to ask about Shekka’s shop before asking about her personally.");
	addButton(7,"The Mess",talkToShekkaAboutTheMess,undefined,"The Mess","Ask Shekka about the nearby food place, “The Mess.”");
	addButton(14,"Back",approachShekka);
}

//Tarkus
public function talkToShekkaAboutTarkus():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	if(flags["TARKUS_DESTROYED"] == undefined) 
	{
		output("You mention that you’d like to hear more about Tarkus from a local’s perspective.");
		output("\n\n<i>“That’s... a smart question, [pc.name],”</i> Shekka observes. <i>“Most people that stop to ask me something are either trying to make a joke at my expense or wanting to know if our vaginal secretions are acidic.”</i> She rolls her eyes. <i>“I even had someone asking me if goo-girls were likely to gum up artificial genitalia. I told him no, of course. Any cybernetic dick worth its cock-mustard would be built to handle a little aqueous loving.”</i>");
		output("\n\nThere is no way you can avoid cocking an eyebrow to such a fact.");
		output("\n\n<i>“Pshhh, if that makes your carburetor sputter, I’ve got some stories for you!”</i> Shekka teases while walking over to her workbench. She leans against it like an old friend. <i>“But you wanted to hear about Tarkus, so I might as well stick to the topic at hand.”</i>");
		output("\n\nYou ");
		if(pc.isNice()) output("smile and");
		else if(pc.isMischievous()) output("grin and");
		else output("coldly");
		output(" agree.");
		output("\n\n<i>“I can tell you what my people know, which is about as limited as a sexbot’s vocabulary, unfortunately. We’ve never been much for record-keeping,”</i> the raskvel notes, <i>“but so far as we can tell, Tarkus is put together from two different half-planets of about the same size and composition. We figure the gabilani must have trashed them both and then picked up the pieces rather than jumping out of system. There’s more than a few asteroid belts out there thanks to them.”</i> She sighs. <i>“They might be the only ones on this rust ball more destructive than my own people.”</i>");
		output("\n\n<i>“What do you mean?”</i> you ask.");
		output("\n\nSighing even more heavily, Shekka goes on, <i>“Most raskvel don’t really... What’s the word you humans have for it? Oh! Plan! They don’t really plan ahead. If a tribe is already straining their food supply, they’ll keep on fucking like nobody’s business. If there’s no more room in the warrens for any more of us, they’ll just keep laying eggs and kick out the least popular among them.”</i> She puffs out her cheeks in frustration. <i>“We’re the same way with machines too. Put a radiation-spewing reactor a few miles away from a tribe, and in a few weeks we’ll either have it fixed or be dying from radiation poisoning.”</i>");
		output("\n\nReally? You can’t help but look a little incredulous.");
		output("\n\nShekka nods. <i>“Really. We can’t help it. When we see something broken - the more technological the better - we get almost like this itch in the back of our heads. We have to go poke around it, prod it, and try to fix it. It’s impossible not to! And then when we do fix something?”</i> She sags a little bit against the bench, her fingers gripping it hard. <i>“It’s almost as good as sex. Not as passionate or pleasure-filled, but the satisfaction... ohhh, the satisfaction. You ever have a nice meal after having to go hungry for a while? Turning something from garbage into a working, productive machine is at least twice that good.”</i> Her pink, slitted eyes twinkle. <i>“Why do you think I’m here, making my living fixing and selling gadgets?”</i>");
		output("\n\nYou tell her she ought to consider lowering her prices.");
		output("\n\n<i>“Not on your life, [pc.name]. I’m the best mechanic in Novahome, and you’re nuts if you think that I’m going to cheapen my skills just because I get a thrill out of practicing them!”</i> She shakes her head. <i>“Anyways, the gabilani fucked this planet up something fierce. Some of ‘em live in the filth around us, but a fair portion of them moved up into their space station. Now they just make us mine up resources or enslave us while the rest of us try to make a living off their garbage.”</i> Scowling, Shekka pushes off her workbench and paces. <i>“They treat us like animals.”</i>");
		output("\n\nA gout of steam issues forth from a device that looks like little more than tangled pipes strapped to a display, startling the both of you. Shekka straightens, though her shoulders seem burdened by unspoken responsibility. <i>“Looks like duty calls, [pc.name]. Talk later, ‘kay?”</i>");
	}
	else
	{
		output("You mention that you’d like to hear about Tarkus from a local’s perspective, now that it’s gone.");
		output("\n\n<i>“That’s... an uncomfortable question, [pc.name],”</i> Shekka quietly answers. <i>“It was our our home - our cradle. We didn’t just live on it, it shaped us into what we are today, and now... now it’s gone.”</i> The short-statured mechanic shivers. <i>“In a way, it feels wrong that we survived when Tarkus died. She was a shit-heap, but she was our shit-heap.”</i>");
		output("\n\nYou nod");
		if(!pc.isAss()) output(" understandingly");
		else output(", hoping she’ll hurry along");
		output(".");
		output("\n\nShekka fiddles with an oversized wrench that has a shotgun embedded into the handle. <i>“I won’t lie, we picked up a lot of negative traits surviving on the ol’ junk-ball, but it didn’t deserve to die for them.”</i> Shaking her head, the pink-haired woman sighs. <i>“They say it was pirates too. Some plot to sneak a mining operation at the core that went tits up.”</i> She spits. <i>“We blamed the gabilani at first, too. Turns out they were as fucked by this as us. Their space station took a pretty good beating from the debris.”</i>");
		output("\n\nYou’ve heard about that, but you wanted to know more about life on the planet.");
		output("\n\nShekka reads your look, and explains, <i>“I can tell you what my people know, but that’s about as limited as a sexbot’s vocabulary. We’ve never been much for record keeping, you see.”</i> She gestures around her shop. At first, you respond with confusion. Then, you see what she means; there isn’t a single scribble or note anywhere aside from company stamps on machinery. <i>“So far as we can tell, Tarkus was put together from two different half-planets of about the same size and composition. We figure the gabilani must have trashed them both and then picked up the pieces rather than jumping out of system. There’s more than a few asteroid belts out there thanks to them.”</i> She sighs. <i>“And now one more is added to the list. Damn pirates.”</i>");
		output("\n\nSighing even more heavily, Shekka goes on, <i>“Most raskvel don’t really... What’s the word you humans have for it? Oh! Plan. They don’t really plan ahead. If a tribe is already straining their food supply, they’d keep on fucking like nobody’s business. If there’s no more room in the warrens, they’d just keep laying eggs and kick out the least popular among them. Of course, that’s not an option now. We need a better solution before we starve.”</i> She puffs out her cheeks in frustration. <i>“We’re the same way with machines too. Put a radiation-spewing reactor a few miles away from a tribe, and in a few weeks we’ll either have it fixed or be dying from radiation poisoning.”</i>");
		output("\n\nReally? You can’t help but look a little incredulous.");
		output("\n\nShekka nods. <i>“Really. We can’t help it. When we see something broken - the more technological the better - we get almost like this itch in the back of our heads. We have to go poke around it, prod it, and try to fix it. It’s impossible not to! And then when we do fix something?”</i> She sags a little bit against the bench, her fingers gripping it hard. <i>“It’s almost as good as sex. Not as passionate or pleasure-filled, but the satisfaction... ohhh, the satisfaction. You ever have a nice meal after having to go hungry for a while? Turning something from garbage into a working, productive machine is at least twice that good.”</i> Her pink, slitted eyes twinkle. <i>“Why do you think I’m here, making my living fixing and selling gadgets?”</i>");
		output("\n\nYou tell her she ought to consider lowering her prices.");
		output("\n\n<i>“Not on your life, [pc.name]. I’m the best mechanic in Novahome, and you’re nuts if you think that I’m going to cheapen my skills just because I get a thrill out of practicing them!”</i> She shakes her head. <i>“Anyways, the planet’s gone now. All that’s left of us are the ones living in this ship, and maybe a few over in the gabilani station.");
		output("\n\nA gout of steam issues forth from a device that looks like little more than tangled pipes strapped to a display, startling the both of you. Shekka straightens, though her shoulders seem burdened by unspoken responsibility. <i>“Looks like duty calls, [pc.name]. Talk later, ‘kay?”</i>");
	}
	flags["SHEKKA_TALKED_TARKUS"] = 1;
	processTime(15+rand(10));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Raskvel
public function talkToShekkaAboutRaskvel():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	//Unlocked via Tarkus Chat
	output("You ask her if she’d like to talk more about her race, the raskvel.");
	output("\n\n<i>“Seems a little narcissistic, but if you really want, I suppose I could jabber about my people a little,”</i> Shekka answers with an exaggerated shrug of her tiny shoulders. She gestures for you to follow and starts milling around pillars of buckets and parts, rambling all the while. <i>“Near as I see it, we’re a byproduct of ");
	if(flags["TARKUS_DESTROYED"] == undefined) output("this metallic dustball your people have ");
	else output("the metallic dustball your people had ");
	output("christened Tarkus.”</i> She stops at an oversized bucket and roots around inside it for a part. Her feet flail in the air when she dives a little too deeply and nearly falls in, but she keeps talking all the same.");
	output("\n\n<i>“We figure we probably started out on the other half of the planet; there");
	if(flags["TARKUS_DESTROYED"] == undefined) output("’s");
	else output("was");
	output(" a lot more of us over there. The farther you ");
	if(flags["TARKUS_DESTROYED"] == undefined) output("get ");
	else output("got ");
	output("from the divide - that’s the space where the planet halves ");
	if(flags["TARKUS_DESTROYED"] == undefined) output("meet ");
	else output("met");
	output("- the less of us ");
	if(flags["TARKUS_DESTROYED"] == undefined) output("you tend to ");
	else output("you would ");
	output("run into, at least on ");
	if(flags["TARKUS_DESTROYED"] == undefined) output("this side");
	else output("the side Novahome was on");
	output(". Over there ");
	if(flags["TARKUS_DESTROYED"] == undefined) output("we’re ");
	else output("we were ");
	output("as thick as fermites in a ruined girder,”</i> Shekka explains while climbing her way out of the bin and searching around for another, still working on something. <i>“Not just us either.");
	if(flags["LAPLOVE"] != undefined)
	{
		output(" The Lapinara ");
		if(flags["TARKUS_DESTROYED"] == undefined) output("are");
		else output("were");
		output(" the same way. Maybe we both came from the same ancestor, I don’t know. There’s enough similarities to make you wonder, right?");
	}
	else output(" Seems like every species on planet’s wired up for junking. Makes you wonder, right?");
	output("”</i>");
	output("\n\nYou find yourself nodding, though Shekka is too busy examining serial numbers on power converters to see.");
	output("\n\n<i>“Anyhow, like I was saying, I think we’re the way we are because of the way Tarkus ");
	if(flags["TARKUS_DESTROYED"] == undefined) output("is. It’s");
	else output("was. It was");
	output(" a terribly dangerous place filled with poisons, radiation, and machinery that’s as likely to rust away as kill you. And us? ");
	output("We’re able to identify plenty of poisons by scent alone. We’re immune to half a dozen others. We can cope with radiation better than most, and we breed almost as fast as we mature. Oh, and there’s the bit about us being naturally inclined to tinker and repair with just about anything you put in front of us.”</i> She comes up with a gleaming cylinder and smiles, first at it, then you.");
	output("\n\nThose do seem to be traits well matched to surviving in a place like ");
	if(flags["TARKUS_DESTROYED"] == undefined) output("this");
	else output("that");
	output(". You tell her as much.");
	output("\n\nShekka shakes her head sadly while hooking her prize on a thin belt attached to her jumpsuit. <i>“Yeah, good for surviving ");
	if(flags["TARKUS_DESTROYED"] == undefined) output("here");
	else output("there");
	output(", but not so good for making it on our own. Focusing on fixing things is great when you’ve got a race like the gabilani leaving broken tech left and right, but what happens if we ");
	if(flags["TARKUS_DESTROYED"] == undefined) output("want");
	else output("have");
	output(" to make our own start somewhere? Without something to fix, we’re more likely to laze around and fuck than do anything productive. Then what? We overpopulate and starve ourselves out.”</i> The little mechanic sighs heavily. <i>“Sorry if I’m getting a little bit grim, but I’ve been thinking about this a lot");
	if(flags["TARKUS_DESTROYED"] != undefined) output(" since.... You know");
	output(".”</i>");
	output("\n\n<i>“I don’t mind,”</i> you reply. <i>“I did want to learn about your people, remember?”</i>");
	output("\n\nSmiling, the short-statured alien places her hands on her significant hips and says, <i>“Well aren’t you a breath of contaminant-free air.”</i> She turns to walk in another direction, crooking a finger your way to indicate that you should keep up. ");
	if(pc.tallness < 50) output("Luckily, you’re short enough to slip after without having to duck under a low arch of well-stacked light fixtures.");
	else output("You have to duck under an arch of well-stacked light fixtures to follow.");
	output(" <i>“So, yeah... ");
	if(flags["TARKUS_DESTROYED"] == undefined) output("we’re");
	else output("we were");
	output(" ideal for surviving on Tarkus, but not for mastering it. We just don’t seem to have that creative spark that the gabilani are so flush with or the inherent need for greatness that so drives the terrans.”</i>");
	output("\n\nTrailing off as she navigates through a web of charging cables, the sad-eyed raskvel looks for a battery among hundreds. <i>“I never really thought about this kind of stuff until we found Novahome, and even then, I never dwelled on it till the rush found us. It was hard enough just to survive, you know?”</i>");
	output("\n\nYou give an understanding nod while trying to puzzle out what she’s working on.");
	output("\n\n<i>“Now it’s all I can think about - aside from finding new tech to fiddle with. If we don’t do something fast, we’re going to wind up as little more than slaves, either to the gabilani or the rest of the universe.”</i> You think you see a little moisture pooling at the corner of one slitted eye, but she wipes her hand past it before you can be sure. <i>“Naturally, I realized that we were broken, and it suddenly made sense why I was thinking about this so much.”</i>");
	output("\n\nYou retort, <i>“But how could you fix yourselves? That seems impossible, or at least improbable.”</i>");
	output("\n\nShekka plucks a battery from a charging bay and hooks it on her belt before straightening to look you dead in the eye. <i>“It’s that or give up, and I don’t give up.”</i>");
	output("\n\n<i>“Well, how do you propose to fix an entire species?”</i> It seems a task far beyond a simple mechanic.");
	output("\n\nShekka starts off again, her tail looping over your [pc.butt] to tug you along after her. <i>“I didn’t know at first, but your extranet gave me the idea.”</i> She clicks her tongue. <i>“That’s a fantastic piece of work, let me tell you. A galactic network of data exchange at near synchronous speeds is quite the panty-soaking technological feat. Luckily, I don’t wear any.”</i> She turns to wink slyly at you. Her footsteps have almost carried her back to her workbench, specifically a part of it that houses a powered-down robot.");
	output("\n\nSetting the gathered components next to this obvious side project, the raskvel tries to hide her blushing from you. It isn’t that obvious, but you can pick out a certain crimson brightness on her pale red cheeks. <i>“When it comes down to it, we’re all basically biological machines. Sure, we have more freedom than a ‘bot, but ultimately we’re still prisoners to our body’s drives. A few terrans may manage chastity, but most can’t. We’re better about some things but worse about lots of others. Ya know?”</i>");
	output("\n\nShekka pries open an access panel, not even bothering to wait for a response before continuing. <i>“Well, you guys - the rest of the universe, I guess - has been working on gene modifications for centuries. Why else do you think the median terran and ausar phallus sizes have increased so rapidly?”</i> She rearranges some wires and inserts the power converter. <i>“All I want to do is put that to work. See if I can broaden our drive to fix into a desire to create. Tamp down our breeding instincts a little, too. If we’re not dying by the thousands to freak ");
	if(!silly) output("industrial");
	else output("gasoline fight");
	output(" accidents, there’s no need to have so many kids. Maybe we could just tweak down the number of eggs we lay at a time.”</i>");
	output("\n\nShaking her head, the girl skillfully tightens something inside the machine’s chest cavity. <i>“Anyway, the point is that if we can scrape together enough credits, maybe we can get a modification package put together that will fix us. That way, we can do more than fuck, eat and kill ourselves on dangerous tech.”</i> She snaps the battery into robot and closes the hatch. <i>“Just like this robot. It was out there killing people.”</i> Her finger flicks the activation stud. <i>“Now it’s going to be somebody’s bodyguard.”</i>");
	output("\n\nYou step back in alarm, a hand on your " + pc.meleeWeapon.longName + " just in case something goes wrong once it’s activation sequence completes. The barrel-chested machine jolts upright, deadly blades at the end of its arms folding into narrow fingers. <i>“Shekkatech B.D. Guard at your service. Master designation not found. Who is my master?”</i> Its flickering amber eyes search around the room.");
	output("\n\nShekka clicks the machine off for now. <i>“He still needs a little more work on his circuits, but he’s getting there.”</i> Looking up at you, she admits, <i>“I didn’t think you’d stick around through all of that, to be honest, but that’s my plan.”</i> She looks like she’s expecting judgement or reproach, but when none comes, she breaks into a smile. <i>“It’ll be expensive as all hell, I know. The elders see the wisdom in it, though. We figure in a few years, we’ll have the credits stored up. We just have to keep your megacorps from ruining our little ");
	if(flags["TARKUS_DESTROYED"] == undefined) output("haven");
	else output("lifeboat");
	output(" until then.”</i>");
	output("\n\nTaking you by the ");
	if(pc.tallness >= 84) output("[pc.leg]");
	else if(pc.tallness >= 70) output("[pc.hip]");
	else if(pc.tallness >= 60) output("waist");
	else output("[pc.chest]");
	output(", Shekka plants an affectionate kiss on your ");
	if(pc.tallness >= 84) output("[pc.skinFurScales]");
	else if(pc.tallness >= 70) output("hip");
	else if(pc.tallness >= 60) output("arm");
	else if(pc.tallness >= 55) output("shoulder");
	else output("cheek");
	output(". <i>“Thanks for listening. I could probably talk about our the plan all day long, but I should really get back to work on one of my bigger commissions. Cya around, [pc.name].”</i>");
	//Unlocks "Her Plan"
	processTime(15+rand(5));
	flags["SHEKKA_TALKED_RASKVEL"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Her Plan
//Unlocked via "Raskvel"
public function shekkasPlanDiscussion():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("<i>“Your plan’s pretty ambitious. Do you mind telling me a little more about it?”</i> you question.");
	output("\n\nShekka shrugs noncommittally. <i>“I suppose. There’s still a lot I’m not sure about myself.”</i>");
	output("\n\nYou ask, <i>“Like?”</i>");
	output("\n\n<i>“Well... for starters, there’s the ethical quandaries it brings to the table,”</i> Shekka explains while wringing her hands. <i>“Anything we do isn’t likely to have that big of an effect on adults treated with it, since our thought patterns and drives are fairly developed and entrenched. We wouldn’t really be changing our way of life at all, but we would be essentially reprogramming our youngs’ mental processes. Even if it’s for the better, it gives me the willies knowing that I’d be responsible for widespread, biological mind control.”</i>");
	output("\n\nShivering, the little alien wraps her arms around herself, looking very small and more than a little out of her element. <i>“Then I remind myself that I’m just trying to fix the fucked up drives that mother nature gave us. That’s enough to get me to sleep at night, but I still toss and turn thinking about it. Who am I - or even the elders - to judge something like this? By my own admission, we’re pretty fucked up as a race.”</i> She nervously fidgets, grabbing hold of one of her ears and lifting it in front of her, holding onto it like a life preserver.");
	//Bimbo
	if(pc.hasPerk("Ditz Speech") || pc.hasPerk("Brute Speech")) 
	{
		output("\n\nYou ");
		if(pc.hasPerk("Ditz Speech")) output("giggle");
		else output("chuckle");
		output(" and try to come up with something to comfort the little thing. She’s so cute when she’s worried! <i>“");
		if(pc.hasPerk("Ditz Speech")) output("Like, don’t worry about any of that! You sound super smart, and you like, totally care about them! That’s what’s important and stuff!");
		else output("Heh, don’t worry too much about it, babe. You definitely sound like you’re doing what’s best for them.");
		output("”</i>");
	}
	//Nice
	else if(pc.isNice())
	{
		output("\n\nYou put a hand on her shoulder and pull her into a tight hug. <i>“Someone always has to decide these kinds of things. Better it be someone who cares about the morality of her choices than a cold-hearted politician.”</i>");
	}
	//Mischievous
	else if(pc.isMischievous())
	{
		output("\n\nYou lean down and poke your finger against the tip of her nose. <i>“I know this is serious, but you sound like you’ve got all the angles figured. You shouldn’t stress too hard over life - you’ll never make it out alive.”</i> You neglect to mention that you heard something to that effect in an ancient movie.");
	}
	//Hard
	else output("\n\nYou cross your arms and look her square in the eye. <i>“I don’t see the problem here. You don’t have any other choice if you want your people to chart their own destiny.”</i>");
	output("\n\nShekka swallows noisily. ");
	if(flags["TARKUS_DESTROYED"] != undefined)
	{
		output("<i>“I know, I know, but the worst part... the worst part is how Tarkus biting it has made this so much easier.”</i> Twisting the middle of one ear, she continues, <i>“I used to agonize about the wilder tribes and convincing them to join us... or the effects of unmodified raskvel wildly outbreeding those of us that took the improvements.”</i>");
		output("\n\nThe mechanic pulls her welding mask off and examines it, unwilling to meet your gaze. <i>“Surviving when so many millions died is bad enough. Finding out that a part of you, even a tiny one, is pleased by that is worse... like knowing that you’re running on fouled oil that you can’t even change.”</i> She puts her visor aside and looks up at you, tears clearly beading in her eyes. <i>“I’m sorry. I shouldn’t have burdened you with that. I’m not sure why I even said that to you. You don’t want to hear to hear my rambles.”</i> Each sentence is spoken more quietly than the last until the mechanic gives up on speach entirely and sags against ");
		if(pc.tallness >= 60) output("your [pc.leg]");
		else output("you");
		output(", openly weeping.");
		if(pc.isNice())
		{
			output("You put an arm around her, holding her tight. Her sobs, now that they’re coming, come in fits and awkward, stuttering cries. She gasps for air every now and then, clinging to you like a wreck survivor to an emergency oxygen tank.");
		}
		else if(pc.isMischievous())
		{
			output("You put an arm around and try to lighten the mood, joking that if she didn’t feel that way. Her sobbing only intensifies, coming in fits and awkward, stuttering cries. She gasps for air like a fish out of water, clinging as her emotions overwhelm her.")
		}
		else
		{
			output("You stand there, looking down at her as she shudders and shakes. <i>“You’re not going to accomplish anything by wasting time on tears.”</i>");
		}
		output("\n\nEventually, she breaks away, slapping her visor back onto her head and down before you can get a look at her tear-stained scales. <i>“Thanks for not freaking out, [pc.name]. I should work.”</i>");
		output("\n\nIt’d be good to give her some time.");
	}
	else 
	{
		output("<i>“I know, I know, but it’s good to consider all the options. The worst part of it all is that even if we get a treatment designed, we won’t be able to force all the tribes to take it. Those of us in Novahome shouldn’t be a problem - we can see the problems first hand now that we have the rest of the galaxy to measure against, but the wilders won’t accept something like this. Nor are we the type to force it on them.”</i> Dropping her ear, she starts drumming on the countertop as she thinks. <i>“The wilders will outbreed the civilized raskvel dozens to one, and I fear that outside of well-defended towns like this one, there will be no change.”</i>");
		output("\n\nYou think aloud, <i>“Though your civilized brothers and sisters would be better able to put down roots and develop their own safe havens. They might get a little watered down through crossbreeding, but once they established proper towns and farming, they’d outlive the wilders by a massive margin.”</i>");
		output("\n\nShekka nods. <i>“That’s the best case scenario anyway. We’ll have to see how it all pans out in the long run.”</i> She runs a hand through her feathers to buy her time to gather her thoughts. <i>“If I keep talking about this, I’m probably going to start rambling about interstellar philosophy. Maybe it’s best we wrapped this up for now.”</i>");
	}
	flags["SHEKKA_TALKED_PLAN"] = 1;
	processTime(15+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Novahome
//Unlocked via "Tarkus"
public function talkToShekkaAboutNovahome():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("You ask about Novahome.");
	output("\n\n<i>“Oh isn’t it just the best!”</i> Shekka throws her arms up in the air and practically dances in place, revealing the flighty side that most of her race seem to spend all their time exposing. <i>“It’s way better than living in some smoky hole in the ground, fighting the sydians or rogue bots every rotation. ");
	if(flags["TARKUS_DESTROYED"] != undefined) output("It even saved us from the death of our planet. ");
	else output("Hell, it’s hard enough to keep the parasit" + (flags["LAPLOVE"] != undefined ? "ic lapinara":"es") + " from tunneling into our homes, looking for warm bodies to inseminate. We might like laying eggs, but we want them to be our own!");
	output("”</i> She puffs her chest out in pride, clearly outlining the curves of her small bosom for all to see. Her nipples stick out like tiny, sore thumbs, begging to be tweaked or touched. You restrain yourself for now, wanting to hear the rest of her words.");
	output("\n\nShekka explains, <i>“I was pretty young when my tribe moved in. I can still remember huddling in a leaky old cave around the warmth of a dozen half-repaired generators at night. Luckily, one of our neighboring tribes, the Gyss, found the Nova while foraging. They wanted to make it their home, but there were too many sydians inside for them to take on their own, not to mention all the aquiara inside.”</i>");
	output("\n\n<i>“Aquiara?”</i> you wonder.");
	output("\n\n<i>“Sorry, the translators are still playing catch-up with some of our slang. I’m surprised you understand so many of the idioms I’ve been throwing out,”</i> Shekka dutifully apologizes. <i>“I think most rushers have taken to calling them... gray... goo? Something like that.”</i>");
	output("\n\nYou tip your head to let her know that you understand now.");
	output("\n\nShekka smirks. <i>“So anyway, the Nova was full of sydians and gray goo. Rather than fighting each other, they had actually settled into an odd sort of symbiosis. The rust monsters were in a paradise of food, of course. They used their secretions to render the metals digestible. At the same time, the gray goo already in the ship found another use for them: lubricant and protein supply. Somehow, they got the sydians to keep their corrosive tendrils away from them, and in exchange, they served sexually in every way.”</i>");
	output("\n\nThe little alien giggles, her eyes a little wistful. <i>“Apparently the goo got so good at fucking the sydians that they all but stopped breeding with each other, content to let the pliant artificial creatures service them while they lounged around, consuming untouched metals from the interior of the ship.”</i> As an aside, she adds, <i>“That’s why so many of the hatches in here are corroded shut. Too many sydians lived here for too long, and all the original tech in central Novahome was eaten or ruined as well.”</i>");
	output("\n\nYou say, <i>“So how did you guys take over?”</i>");
	output("\n\nShekka smirks. <i>“They got complacent. That’s how! Most of the sydians inside the Nova were old by the time we found it. If they had brought in new blood or produced their own offspring, we would’ve never stood a chance.”</i> Shekka pulls a wrench off the table and gestures with it, mock fighting. <i>“Our tribe, the Gyss, and the Plo banded together our best warriors and took it overnight.”</i>");
	output("\n\nYou frown. They killed all the sydians?");
	output("\n\nThe raskvel’s confident expression slips, and she puts up her hands while shaking her head. <i>“No-no-no, we didn’t even kill any of them. We did drive most of them off, but a few of the less combative ones wanted to stay. The gray goo had to go, though. We get off on birthing eggs more than sex alone, so we weren’t going to slip into the same trap as those metal-eaters.”</i>");
	output("\n\n<i>“All of them?”</i> you ask.");
	output("\n\n<i>“Well... most of them,”</i> Shekka admits. <i>“The sydians that stayed behind kept their “wives” and “husbands” of course. We made them swear to stop eating the ship itself, and we give them machinery that’s too far gone to fix instead. They’re kind of like our own garbage disposals, albeit ones that you can talk to or bed down for a fun, inter-species three-way.”</i>");
	output("\n\nYou chuckle at that. <i>“Maybe I should go visit them sometime, then.”</i>");
	output("\n\nShekka looks you up and down and suggests, <i>“If you do, bring me too. I could use a good lay.”</i>");
	output("\n\n<i>“Is that so?”</i> you ask with an appraising glance. Are her nipples sticking out a little further? It’s hard to tell, but her camel-toe has definitely grown a little deeper.");
	output("\n\nShe smirks. <i>“It is, but as soon as I finish this story, I’ve got work to do. Any potential eggs can keep until then.”</i>");
	output("\n\nYou nod");
	if(pc.lust() >= 75 || pc.libido() >= 75) output(", a little sad that you won’t get to peel her out of her jumpsuit right now");
	output(".");
	output("\n\n<i>“So we took the Novahome, but it took us the better part of a decade to get it built up to where it is now. There weren’t even any working power plants back then, and the electrical systems were fried. ");
	if(flags["TARKUS_DESTROYED"] == undefined) output("We’re still trying to get the west half of the ship lit properly.”</i> Shekka gestures towards a window in her “little” workshop. <i>“It won’t be long now till we get most of the ship up and running - even the engines. Unfortunately, when this thing crashed, all the repulsors along the underside were completely decimated. It won’t be going orbital without a few years of excavation and repairs.”</i>");
	else output("We’re still trying to get the west half of the ship lit properly.”</i> Shekka gestures towards a window in her “little” workshop. <i>“We got the engines up and running, and life support barely going. You might say life support is on life support until we can get some more parts in. The Nova can’t even land anywhere sub-orbital. The repulsors along the underside were totally decimated when she crashed.”</i>");
	output("\n\n<i>“Since it crashed,”</i> you start, <i>“was there any evidence of the original crew?”</i>");
	output("\n\nShekka shakes her head. <i>“None. The place was empty except for the goo and the sydians. There weren’t even skeletons anywhere. We knew it was alien from the alphabets being used, but until we got linked into the rest of the galaxy, we had no idea who made it.”</i> She points at a bulkhead with terran-style lettering. <i>“Turns out it was " + (pc.isHuman() ? "you" : "the") + " humans. She was some kind of exploratory science vessel, launched well before the first gates were discovered or placed. They built her to last, and she did. It’s just... something happened to her crew, and without guidance, the whole mess must have crashed down onto Tarkus.”</i>");
	output("\n\nShekka sighs and pats the wall affectionately. <i>“The </i>Nova<i> is Novahome now. She’s our home. Maybe someday she’ll be the first capital ship in the raskvel navy, once we get ourselves sorted out.”</i>");
	output("\n\nYou wouldn’t mind seeing that.");
	output("\n\nSmiling, the mechanic turns back to her work. <i>“I really should get some of these job orders done. Just give me a holler if you need to buy anything, okay?”</i> She flips her welding mask down and sparks her torch.");
	processTime(15+rand(5));
	flags["SHEKKA_TALKED_NOVAHOME"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//The Wastes
//Unlocked after talking about Tarkus
public function talkToShekkaAboutTheWastes():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("<i>“Could you tell me about the wastes?”</i> you ask.");
	output("\n\nShekka takes off her welding mask, a somber look on her pink-topped visage. <i>“Yeah, though there isn’t much to tell");
	if(flags["TARKUS_DESTROYED"] == undefined) output(", I think. It’s hot in the sun and cold in the night. Actual food is scarce - finding healthy plants is like discovering buried treasure, and seeds are guarded with our lives. We can usually rig up small underground fields to feed ourselves, but once there’s enough of us in a tribe, we wind up either leaving eggs in the wilds or kicking out a few unlucky souls.”</i> She shudders. <i>“It’s a pretty horrible life, to be honest.”</i>");
	else output(" since Tarkus died. It was hot in the sun and cold at night. Actual food was scarce. Finding healthy plants was like discovering buried treasures, and seeds were guarded with our lives. We managed to rig up small, underground fields to feed ourselves, but once enough of us were born, we’d wind up leaving eggs in the wilds or kicking out a few unlucky souls.”</i> She shudders. <i>“It was a pretty horrible life to be honest. I pray we can overcome our instincts before we wind up overpopulating Novahome.”</i>")
	output("\n\n<i>“It sounds awful.”</i>");

	if(flags["TARKUS_DESTROYED"] == undefined) output("\n\n<i>“It is,”</i> Shekka agrees. <i>“You’ve got to forage for supplies without raising the ire of the other tribes or running into something worse, like a thirsty goo or an irritable sydian. Bam!”</i> She pounds one fist into the other out of nowhere. <i>“You lose a whole day worth of foraging and wind up laying in the dirt, holes stretched. Sure, you got your rocks off, but you’re left hungry, empty-handed, and alone.”</i>");
	else output("\n\n<i>“It was,”</i> Shekka agrees. <i>“You had to forage for supplies without raising the ire of other tribes or running into something worse, like a thirsty goo or an irritable sydian. Bam!”</i> She pounds one fist into the other out of nowhere. <i>“You’d lose a whole day worth of foraging and wind up laying in the dirt, holes stretched. Sure, you’d get your rocks off, but you’d be left hungry, empty-handed, and alone.”</i>");
	output("\n\nYou mention that it sounds a little like your own experiences with the planet rush.");
	output("\n\nThe corner of the little alien’s mouth quirks up at that. <i>“Really?”</i>");
	output("\n\nYou nod. <i>“Really.”</i> You then proceed to detail some of your previous adventures in sordid detail.");
	output("\n\n<i>“Damn,”</i> the reddish raskvel mutters, <i>“I guess you haven’t had it too easy either.”</i> She taps her chin, thinking. ");
	if(flags["TARKUS_DESTROYED"] == undefined) output("<i>“There’s other areas like the wastes that are just about as bad if not worse. For one, there’s the scything glades. Trees grow there, metallic, predatory trees that lash out at anything that comes too close with razor-sharp blades. There’s usually a few safe paths through them, but you’d best keep your wits about you if you don’t want to wind up cut to ribbons with your blood used as fertilizer.”</i>");
	else output("<i>“There were other areas like the wastes that were just about as bad if not worse. For one, there was the scything glades. Trees grew there, metallic, predatory trees that lashed out at anything that came to close with razor-sharp blades. There were usually a few safe paths through them, but you had to keep your wits about you if you didn’t want to wind up cut to ribbons with your blood used for fertilizer.”</i>");
	output("\n\n<i>“That’s terrifying!”</i>");
	output("\n\nShekka ticks off her fingers, counting in her head. ");
	if(flags["TARKUS_DESTROYED"] == undefined) output("<i>“Then there’s the Oil Sea. It isn’t really just oil either. It’s full of liquid metals, pollutants, corrosives, and the like. The place has been swarming with the goos since we kicked them out of Novahome. I guess the lubricants and moisture there have helped them reproduce.”</i> She moves on to the next finger. <i>“Watch out around the iron ridges too. All these metal plates make it the perfect place for ambushes. Our tribe never really went there" + (flags["LAPLOVE"] != undefined ? " - there’s lapinara and worse aplenty.":"") + "”</i>");
	else output("<i>“Then there was the Oil Sea. It wasn’t just oil either. It was full of liquid metals, pollutants, corrosives, and the like. That place swarmed with gray goos once we kicked them out of Novahome. I guess the lubricants and moisture helped them to reproduce.”</i> She moves on to the next finger. <i>“The iron ridges were tricky too: all metal plates and perfect places to ambush. Our tribe never really went there" + (flags["LAPLOVE"] != undefined ? " - there were lapinara and worse aplenty":"") + ".”</i>");
	output("\n\nYou make a mental note about that and thank her for the intel.");
	if(flags["TARKUS_DESTROYED"] == undefined) output("\n\n<i>“Just don’t get caught in a storm, and you’ll be fine. They don’t happen often, but the metal flakes will cut you to ribbons in minutes if you’re out in the open,”</i> Shekka warns. <i>“Make sure you’ve always got an eye on a potential bolt-hole. You’ll do fine, [pc.name]. You’ve got a good head on you");
	else output("\n\n<i>“You didn’t want to get caught in a storm either. They didn’t happen often, but the metal flakes would cut you to ribbons in minutes if you were out in the open,”</i> Shekka warns. <i>“You had to always keep an eye out for a bolt-hole. You would’ve done fine, [pc.name]. You’ve got a good head on you");
	if(pc.hasPerk("Ditz Speech")) output(", I think...");
	output(".”</i> She turns away from you, and busies herself putting her mask back on. <i>“That’s it. You be safe ");
	if(flags["TARKUS_DESTROYED"] == undefined) output("out here");
	else output("in your travels");
	output(", and I’ll try not to lose any fingers to my welding torch. Deal?”</i>");
	output("\n\nDeal.");
	processTime(15+rand(5));
	flags["SHEKKA_TALKED_WASTES"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Her Shop
//Unlocked after asking about the Nova{home}
public function talkToShekkaAboutHerShop():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("<i>“How about this shop?”</i> you casually inquire.");
	output("\n\nShekka runs a hand along her workbench lovingly. <i>“She’s not much, but she’s mine. I moved in back before our tribes grew to fill this place to the brim, so getting a decent-sized area classified as mine wasn’t that hard. I just had to build the shop here.”</i> She knocks a wrench on the wall. <i>“Turns out that if you aren’t bumping uglies all day, you can get a lot done!”</i>");
	output("\n\nYou smirk. <i>“Is that much of a problem for you?”</i>");
	output("\n\nThis time, you get a blush out of the little mechanic. The crimson glow practically radiates through her scales and colors her jumpsuit pink! <i>“Well, yes and no.”</i>");
	output("\n\nYou cross your arms. <i>“Which is it?”</i>");
	output("\n\nShekka frowns and rants, <i>“It’s complicated, okay! And it’s personal, too. Besides, you wanted to know about my shop!”</i>");
	output("\n\nYou put your hands up and apologize. You didn’t mean to pry.");
	output("\n\n<i>“Just... ask me about that stuff later, okay?”</i> Shekka pouts more than a little. It’s obvious she’d prefer to stick to the topic at hand.");
	output("\n\n<i>“Sure thing,”</i> you answer. <i>“So, you built this place yourself?”</i>");
	output("\n\n<i>“Is it that obvious?”</i> Shekka looks about nervously, explaining, <i>“We aren’t exactly the best at construction, but the Nova is already sheltering us from the elements. All I needed to do was make it secure enough to be considered my private space.”</i>");
	output("\n\nUpon closer inspection, it’s clear you wouldn’t want to live in a place like this, but as far as Tarkusian homes go, it’s one of the better ones. <i>“It could use a little work.”</i>");
	output("\n\nShekka puffs her cheeks out before exhaling, deflating under your scrutiny. <i>“Yeah, I guess so, but it’ll have to do for now. I’ve gotta bank up all the credits I can, which means not spending any more than I have to on frivolous stuff like pretty walls or a watertight roof.”</i> Folding her arms across her insignificant chest, she continues. <i>“I do well enough for myself here anyway. None of the other builds are any better, and it’s enough to count as a permanent address for ordering goods from the core.”</i>");
	output("\n\nYou wonder aloud, <i>“You order from the core?”</i>");
	output("\n\nLeaning against her workbench a little more comfortably, Shekka nods. <i>“Yeah, when I think I’ll be able to resell it at a premium. A lot of you rushers will pay pretty well for some core comforts");
	if(flags["TARKUS_DESTROYED"] == undefined) output(", and Tarkus is pretty rough on clothes");
	output(". Keeping some smartclothes in stock has been one of the best ideas I’ve had for my profit margins. Between them, custom repairs and selling whatever else I can get working, business has been pretty good.”</i>");
	output("\n\n<i>“What about taxes?”</i> you ask.");
	output("\n\nShekka smirks. <i>“Tarkus isn’t officially a member planet of the U.G.C. We aren’t paying them squat... yet. Our own people aren’t really much for governing constructs like taxes either. The elders know I’m putting my money into the tribe’s wellbeing, and they do what they can to make sure I’m going to be successful. It’s a simpler way, and it works for now.”</i>");
	output("\n\nYou scratch your chin and ask, <i>“Your tribes seem pretty big now. Is that kind of informal structure going to hold up on a larger scale?”</i>");
	output("\n\n<i>“Probably not,”</i> Shekka thinks aloud, <i>“but it’s working now. Hopefully by the time that becomes a problem we’ll have new generations of more level-headed thinkers to help us figure out a better answer.”</i>");
	output("\n\n<i>“Procrastination isn’t a solution.”</i>");
	output("\n\nShekka snorts, <i>“Yeah, but you’ve got to crawl before you can walk.”</i> The little alien seems uncomfortable with her lack of a decent solution, fidgeting nervously in place, but she declines to offer up a better answer, instead saying, <i>“Look, I should get back to work. We can talk later.”</i>");
	processTime(15+rand(5));
	flags["SHEKKA_TALKED_HERSHOP"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Her
//Unlocked after asking about her shop.
public function talkToShekkaAboutHerself():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("You ask her about her love life, as it were. She did tell you that you could ask about it later, after all.");
	output("\n\nShekka’s nipples visibly perk, and her cleft gets a little more noticeable under the painted-on veneer of her jumpsuit. To her credit, she manages not to blush this time. <i>“Well... yeah, I can talk about that stuff, if you really want to hear the sordid details.”</i>");
	output("\n\nYou smile");
	if(pc.hasPerk("Ditz Speech") || pc.hasPerk("Brute Speech"))
	{
		output(", barely suppressing a");
		if(pc.hasPerk("Ditz Speech")) output("n airheaded giggle");
		else output(" brutish chuckle");
	}
	if(pc.isNice()) output(" warmly");
	output(".");
	output("\n\n<i>“All right, all right... so, like I said before, it’s kind of complicated,”</i> Shekka starts haltingly, speaking with greater speed and confidence as she finally opens up about it. <i>“I love sex and egg-laying about as much as the next raskvel, but I spend a LOT less time fucking than the rest of us.”</i> Her shoulders slump, and she leans more heavily against her bench for support. The effect is so startling that you almost wonder if she’s suddenly become more susceptible to gravity. <i>“It’s not entirely by choice either....”</i> She fidgets nervously.");
	output("\n\n<i>“What is it?”</i> you ask, trying to contain your piqued curiosity. As an afterthought, you add, <i>“Surely it can’t be that bad. I’ve seen plenty of sexual weirdness out there. A little thing like you isn’t going to shock me.”</i>");
	output("\n\nBrushing a strand of tightly-wrapped feathers away from her watery eyes, Shekka looks up at you curiously. A smile spreads across her features when she sees the genuine expression on your face. <i>“Thanks, but.... Well, there’s really no other way to say it. I think I’m infertile.”</i>");
	output("\n\nYou tilt your head to the side quizzically and ask why that would stop her from having sex.");
	output("\n\n<i>“It isn’t as simple for us as it might be for you - sex isn’t just about the physical pleasure with us,”</i> Shekka tries to explain, gesticulating wildly. <i>“Pregnancy and – more specifically – laying are a near universal kink for my people, and once a male realizes that a tryst isn’t going to turn you into a belly-immobilized egg-factory, he loses interest pretty quickly. If I’m lucky, I’ll make one or two unfertilized eggs after a good fuck. That’s it.”</i> Her arms drop limply to her sides. <i>“My suitors dropped off pretty quickly when word got around.”</i>");
	if(!pc.isAss()) output("\n\nThat’s awful!");
	else output("\n\nThat’s pretty understandable.");
	output(" <i>“Can’t you just buy a gene mod or treatment to fix yourself?”</i>");
	output("\n\nThe little mechanic shakes her head sadly, her ears chiming sad musical notes. <i>“Not yet. Not safely, anyway. It’ll be a little while yet until the pharmaceutical companies have finished unwinding the details of our genome to see which products are safe for us and which could kill or mutate us. If I took the wrong thing, I could wind up producing eggs until I rupture my abdomen or making ones that are too big for the thickness of their shells. The potential problems are endless.”</i> She shudders, <i>“I can wait. Besides, my sterility has had some upsides.”</i>");
	output("\n\nThat’s more like the attitude you’d expect from one of her species: always looking for the upsides. <i>“Oh?”</i>");
	output("\n\nShekka nods eagerly. <i>“It’s a lot easier to take a long view when you’re not throwing your [pc.legOrLegs] in the air every hour or two. I never would have been this successful if I was lazing around between layings trying to entice the boys into swelling me up with more eggs.”</i> She waggles a finger in your direction. <i>“That sort of thing is all too common for a lot of girls, and if you were to ask them, they couldn’t be happier. I’d imagine that’s true with all the endorphins swimming around inside them.”</i>");
	output("\n\n<i>“Is that a note of jealousy I hear in your voice?”</i> you question.");
	output("\n\n<i>“A little bit, maybe, but just because they’re riding a biological high doesn’t mean I’m going to join them any time soon.”</i> She shakes her head, saying, <i>“My work and helping to chart a course for my people’s future... those are fulfillment on a whole different level. Besides, I still get to take the occasional egg-break when a big, strong offworlder decides to pack me full of cum.”</i> Shekka shivers, her eyes half closing at a fond memory. <i>“Those kui-tan sure know how to fill a womb!”</i>");
	output("\n\nYour ");
	if(pc.lust() >= 70) output("lust");
	else output("discomfort");
	output(" must show, because Shekka smirks. <i>“I laid three whole eggs that time! You should’ve seen it; I almost got as big as some of my sisters, and the laying... oh the laying!”</i> Her whole body shivers, and her nipples are as big as you’ve seen them, wholly engorged. Shekka fans herself to try and cool off. <i>“The point is that most of you rushers don’t care whether I produce eggs or not. It’s just two of us together, reveling in the pleasures of each others’ bodies.”</i> The diminutive handywoman pitchers her voice into a low whisper, <i>“Besides, I get a naughty thrill in knowing that big, strong aliens");
	if(pc.PQ() >= .75 && pc.tallness >= 60) output(" like you");
	output(" choose me over the fertile ones. To ");
	if(pc.PQ() >= .75 && pc.tallness >= 60) output("you");
	else output("them");
	output(" I must seem a little more restrained, sane maybe.”</i>");
	output("\n\nShe makes a good point.");
	output("\n\nShekka gives her hips a sexy little wiggle and gloats, <i>“Oh, the icy glares I get from the younger ones that don’t know me better. That keeps me cool on the hottest, most sweltering days. They treat me better once they learn about all the things I’m trying to do for our people, but I still get a thrill out of it. It’s nice to feel desired.”</i>");

	//Hasn't fucked Shekka
	if(flags["TIMES_SEXED_SHEKKA"] == undefined)
	{
		output("\n\n<i>“What about you, [pc.name]?”</i> Shekka asks, a hand on her egg-bearing hips. <i>“You’ve spent an awful lot of time talking to me. You want to turn this talk break into something a little more physically demanding?”</i> She strides forward, hypnotically undulating her wide hips before pressing herself against you. <i>“This conversation has got my motor revving, and I think");
		if(pc.hasCock()) output(" your dipstick would be just the thing to check my oil....");
		else output("you might want to feel the vibrations....");
		output("”</i>");
	}
	//Fucked Shekka
	else
	{
		output("\n\nShekka advances on you, her tremendous hips swaying, her ears jingling and bouncing to the timing of her hypnotic undulations. She presses herself against you, saying <i>“And your desire is as sweet as the dew from a perfectly repaired moisture devaporator.”</i> Her hand squeezes a cheek affectionately, <i>“I’m starting to think you asked me about this just to get my motor revved up again.”</i> She grabs your hand and presses it between her large thighs. The suit audibly squishes as it deforms around your fingers. She whispers, <i>“It worked. Wanna fuck?”</i>");
		//Same choices as unsexed. Sex is always available this way!
	}
	flags["SHEKKA_TALKED_HERSELF"] = 1;
	processTime(15+rand(5));
	pc.lust(5+rand(3));
	clearMenu();
	addButton(0,"Yes",yesShekkaLetsFuck,undefined,"Yes","Consent to sex with Shekka.");
	addButton(1,"No",noShekkaLetsNotFuck,undefined,"No","Try to talk your way out of sex with Shekka.");
}

//Yes -> Sex Menu
public function yesShekkaLetsFuck():void
{
	//Sex menu hooo!
	shekkaSexMenu();
	//Cut back button if some catch-all scenes get added (Here's looking at you, Savin)
	addButton(14,"Back",approachShekka);
}
public function noShekkaLetsNotFuck():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	//Bimbo No
	if(pc.hasPerk("Ditz Speech"))
	{
		output("You start to say no, but then you remember how like, totally awesome sex is. And then, you’re fantasizing about all the sexual gymnastics you could do with the little slut, your hypersexed mind putting nine out of ten brain cells towards plotting the best vector for a quick fuck.");
		//To sex menu!
		shekkaSexMenu();
		addButton(14,"Back",approachShekka);
		//make sure to strip back button when some catchalls are written
		return;
	}
	//No
	else if(pc.lust() < pc.lustMax())
	{
		output("You extricate yourself from the press of her excited body with more than a little difficulty");
		if(pc.lust() >= 75) output(", fighting down the rising tide of lust within you");
		output(". <i>“Not now, Shekka. I think we both have things we need to do be doing besides fucking ourselves silly.”</i>");
		output("\n\nPouting, Shekka takes a deep breath, then another. <i>“Right... right... okay, that’s fine. You’re definitely right.”</i> She brushes herself down, shuddering a little bit when her hands pass over her nipples. <i>“I should work.”</i> She turns away from you with a disheartened sigh, flipping her welding mask back into place.");
		processTime(1);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	//Alt No
	else
	{
		output("You attempt to extricate yourself from the press of her excited body, but she’s so close and rubbing so pleasantly against you. Your will gives out under the weight of an ocean of ardor.");
		//(Sex menu anyway!)
		shekkaSexMenu();
		addButton(14,"Back",approachShekka);
		//make sure to strip back button when some catchalls are written
		return;
	}
}

//The Mess
//Always available.
public function talkToShekkaAboutTheMess():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("You ask about that food place next door, the Mess.");
	output("\n\n<i>“Fuck that place!”</i> Shekka snarls at you, baring her teeth savagely, <i>“Fuck them, fuck that bullshit catering company, and fuck the people that are dumb enough to eat there!”</i>");
	output("\n\n<i>“Whoah, wait, what?”</i>");
	output("\n\nShekka jabs her finger into your ");
	if(pc.tallness >= 84) output("[pc.leg]");
	else if(pc.tallness >= 60) output("[pc.hip]");
	else output("chest");
	output(". <i>“That place and the company that runs it are everything that’s wrong with Novahome right now! Did you know we found a hydroponics bay that’s capable of feeding the entire ship and then some? All we need are the hands to work it, but why bother producing healthy food when you can sit around screwing, then lounge around the Mess until someone hands you edible slop?”</i>");
	output("\n\nYou offer, <i>“Surely offering cheap food isn’t that bad?”</i>");
	output("\n\nScowling, the little raskvel shakes her head. <i>“That’s not all they’re doing. I’m sure of it. They can’t be turning a profit on food with rates like that. Personally, I think the whole thing is a front for illegal slave trade. They lure us in with cheap food, then sort through the cam footage for the sexiest, sluttiest rask. So many of us wind up getting lost or killed in the wastes that no one asks questions when someone leaves... no one except me.”</i>");
	output("\n\nOh, so she has evidence? You ask her about it.");
	output("\n\n<i>“Nothing concrete, but a couple of my friends have disappeared - all pretty girls, one at a time. It started with my friend Chass. She told me that they had offered her some pretty good pay to wait tables at an off-world restaurant they ran. I told her to call me once she settled in, and she hasn’t. It’s as if she’s vanished. The same thing happened to another friend, Jalie. She got a job offer and vanished not long after. None of her mates have heard from her. I’m pretty sure they’re being turned into slaves or indentured servants, probably shipped off world for training,”</i> Shekka explains with a scowl plain on her face. <i>“I’d love to get some hard evidence on them, but I just can’t seem to get anything solid. They won’t even let me in the building anymore, and any evidence of their wrongdoing is likely kept behind locks I haven’t been able to hack. Besides, I can’t afford to get caught too deep in their operation. If I get myself captured and turned into a sex slave... there’ll be no one left to save them.”</i>");
	output("\n\nShekka paces back and forth. <i>“So for now, we have to play the slow game. If we can get enough bodies working the hydroponics bay, we can put them out of business with free, good food. With no customers, they’ll have no reason to stay and they’ll leave for greener pastures.”</i> She snaps her fingers. <i>“Maybe you could keep your eyes open if you’re over there too. There’s got to be something we can use against them!”</i>");
	output("\n\nYou aren’t too sure about that, but you don’t want to dissuade her while she seems so hopeful.");
	output("\n\n<i>“Just don’t get complacent in there. They’re not good people,”</i> she warns before returning to her work.");
	output("\n\nYou promise to keep your wits about you.");
	processTime(15+rand(5));
	flags["SHEKKA_TALKED_THE_MESS"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Flirt -> Sex
public function shekkaFlirtSexMenu():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	processTime(1);
	//First Time
	if(flags["TIMES_SEXED_SHEKKA"] == undefined)
	{
		//No talks done yet.
		if(flags["SHEKKA_TALKED_HERSELF"] == undefined && flags["SHEKKA_TALKED_HERSHOP"] == undefined && flags["SHEKKA_TALKED_TARKUS"] == undefined && flags["SHEKKA_TALKED_NOVAHOME"] == undefined && flags["SHEKKA_TALKED_WASTES"] == undefined && flags["SHEKKA_TALKED_RASKVEL"] == undefined && flags["SHEKKA_TALKED_PLAN"] == undefined && flags["SHEKKA_TALKED_THE_MESS"] == undefined)
		{
			output("Putting on your winningest smile, you size up the little mechanic. She wouldn’t wear something so exposing if she wasn’t looking for a fuck, would she? Her pert little nipples are like tiny cherries, just waiting to be plucked.");
			output("\n\nShe must see the look in your eye, because before you can utter a single word, she shakes her head. <i>“Much as my pussy would love to be let out for a little playtime, I have a lot of work to get done. Maybe once we know each other a little better I’ll be able to make some time, okay?”</i> She licks her lips before turning back to her work.");
			clearMenu();
			addButton(0,"Next",mainGameMenu);
			return;
		}
		//Know her well enough to succeed
		else
		{
			output("You let your face slowly spread into a grin as you look");
			if(pc.tallness >= 60) output(" down");
			output(" at Shekka. Surprisingly aware, the little mechanic grins back, sashaying up to you before you can utter a single word. <i>“I know that look,”</i> she says, <i>“You wanna fuck.”</i> Wrapping her tail up the back of your [pc.leg], Shekka presses herself against you. <i>“You know what?”</i> She pauses long enough for you to fumble for a response before going on. <i>“I do too.”</i> Her face splits into a lusty smile, her eyes tracing down your [pc.belly] to your crotch.");
			output("\n\nWell, this is a welcome twist. <i>“Shall we?”</i> you ask while considering the sexual options your petite lover’s body offers.");
		}
	}
	//Repeat Intro
	else
	{
		if(chars["SHEKKA"].lust() >= 33)
		{
			output("<i>“How about we take a little recreational break?”</i> you offer.");
			output("\n\nShekka puts her hands on her considerable hips. <i>“Why, Captain Steele, are you propositioning me?”</i> Her lips split into a wide grin. <i>“Because that would be an absolute delight.”</i> The lithe, little alien practically slithers up against your [pc.leg], her tail cupping against your [pc.butt]. <i>“A girl has needs, after all.”</i>");
			output("\n\nWell, she’s feeling feisty at the moment. What are you going to do with her?");
		}
		//Shekka isn't turned on
		else
		{
			output("<i>“How about we take a little recreational break?”</i> you offer.");
			output("\n\nShekka smirks openly. <i>“Give it a rest, tiger. My body might be up for an all-day marathon fuck, but I’ve got things I need to get done.”</i> She twirls in low, gives your crotch an affectionate squeeze and pivots back to her work in the blink of an eye. <i>“A little later maybe.”</i>");
			clearMenu();
			addButton(0,"Next",mainGameMenu);
			return;
		}
	}
	//Didn't get returned? QUICK, SEX MENU!
	shekkaSexMenu();
	addButton(14,"Back",approachShekka);
}

public function shekkaSexMenu():void
{
	clearMenu();
	
	var cumQ:Number = (pc.hasCock() ? pc.cumQ() : 0);
	
	if(pc.hasCock())
	{
		if(pc.cockThatFits(chars["SHEKKA"].vaginalCapacity()) >= 0) addButton(0,"Fuck Her",bendShekkaOverHerWorkbenchAndHaveHerFixWhileYouBang,undefined,"Fuck Her","Bend Shekka over her desk and fuck her while she tries to keep working.");
		else addDisabledButton(0,"Fuck Her","Fuck Her","You don’t have a dick small enough to fit her.");
	}
	else addDisabledButton(0,"Fuck Her","Fuck Her","You need to have a penis in order to bend her over her desk and fuck her.");
	if(pc.hasVagina()) addButton(1,"Tribadism",tailbadism,undefined,"Tribadism","A little bit of tribadism with the raskvel’s tail in the middle for added texture.");
	else addDisabledButton(1,"Tribadism","Tribadism","Tribadism requires you to have a vagina.");
	//Big Dick Ear Shenanigans
	//big dick requirement in tandem with a minimum height requirement of around 5'6" (5-6 feet)
	//Requires 500mLs fo cum
	//trace("CURRENT CUM RESERVE AT SHEKKA'S SEX MENU: " + pc.currentCum() + " MAX CUM: " + pc.maxCum() + " FULLNESS: " + pc.ballFullness + " EJACULATION AMOUNT: " + cumQ);
	if(pc.hasCock() && pc.biggestCockVolume() > chars["SHEKKA"].vaginalCapacity() && pc.tallness >= 60 && cumQ >= 500) 
		addButton(2,"Big Dick",hugeEarShekkaFaps,undefined,"Big Dick Shenanigans","Use your oversized member on the small mechanic. She’s gotta have some way to please it, right?");
	else if(pc.tallness < 60) addDisabledButton(2,"Big Dick","Big Dick Shenanigans","You aren’t tall enough for this.");
	else if(cumQ < 500) addDisabledButton(2,"Big Dick","Big Dick Shenanigans","Your dick isn’t productive enough for this. You’ll need a bit more cum on tap!");
	else addDisabledButton(2,"Big Dick","Big Dick Shenanigans","This scene requires a large dick, a height of above five feet, and large volume of cum.");

	//MilkQ over 1000
	if(pc.milkQ() >= 1000 && pc.isLactating()) addButton(3,"FeedMilk",shekkaMilkDranking,undefined,"FeedMilk","Feed her some of the copious milk you’re carrying around.");
	else addDisabledButton(3,"FeedMilk","Feed Shekka Some Milk","You need to be lactating quite heavily to satisfy the little raskvel with your teats alone.");
	//Upgraded sexbots time!
	if(StatTracking.getStat("contests/shekka sexoff losses") + StatTracking.getStat("contests/shekka sexoff wins") > 5)
	{
		addButton(4,"Robots",shekkaSexbotsMarkTwo,undefined,"Robots","Shekka looks to have some upgraded the sexbots in her shop. You could see if she wants to ride them again.")
	}
	//Old saxbots
	else addButton(4,"Robots",chooseShekkasSexBats,undefined,"Robots","There’s some weird-looking robots sitting in her shop that definitely look built for sex. You could see about using them with Shekka.")
}


//Bend Her Over Her Workbench And Make Her Work It
public function bendShekkaOverHerWorkbenchAndHaveHerFixWhileYouBang():void
{
	clearOutput();
	userInterface.showBust("SHEKKA_NUDE");
	userInterface.showName("\nSHEKKA");
	var x:int = pc.cockThatFits(chars["SHEKKA"].vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	var y:int = -1;
	if(pc.cockTotal() > 1) y = pc.cockThatFits2(chars["SHEKKA"].vaginalCapacity());
	output("You turn her back around towards her bench. <i>“Why don’t you go ahead and keep doing your job. Let me do all the work.”</i> Your fingers trace up her spine to her neck where a small, hidden clasp resides. Once you find it, you artfully twist your thumb and index finger, releasing the catch and revealing her jumpsuit’s seam. The fabric parts slowly, opening just enough to let her pale crimson flesh peek through, the light sparkling off glossy scales as they’re exposed. <i>“Go ahead and fix something.”</i>");
	output("\n\nShekka, usually sassy and quick to react, looks at you uncertainly. Her tail swishes back and forth nervously, but she does as you ask, grabbing parts from all over her workbench into a small pile before you. A moment later, her confident smile returns. She presses her large rump back against you, curling her tail around your side so as not to interfere with the soft, sensuous press of her buttocks against your package. With just an earnest flex, her cheeks squeeze your [pc.cocks] harder.");
	output("\n\nOhhh, that feels nice. Blood surges to your genitals, and your breath shortens as your heartbeats accelerate. Grunting softly, you grab hold of her slowly releasing suit by its edges and tug, baring her shoulders in an instant. The edge of the fabric catches on her nipples, revealing the soft, eggplant-colored areolae a second before the tips of her nipples pop out over the edge. From there, it’s easy to peel the obstructing garment down past Shekka’s bare belly to her hips. The fit is much tighter there, and the press of her ass against your [pc.cocks] makes choosing between continuing to grind against her or getting her out of her clothes an agonizingly difficult decision.");
	output("\n\n<i>“What’s the matter?”</i> Shekka wonders, applying some ED-80 to some rusted screws to help loosen them. <i>“Having a little trouble with unwrapping me?”</i>");
	if(pc.hasCock() || pc.hasVagina()) 
	{
		output(" She brings her tail up");
		if(pc.legCount > 1) output(" between");
		else output(" around");
		output(" your [pc.legOrLegs] to slide alongside ");
		if(pc.balls > 0) output("your [pc.sack]");
		else if(pc.hasVagina()) output("[pc.oneVagina]");
		else output("your [pc.base " + x + "]");
		output(".");
	}
	else output(" She curls her tail around to tease your [pc.asshole], the tip circling around the edge of your ring.");
	if(!pc.isNude()) output(" <i>“You haven’t even gotten yourself naked yet.”</i>");
	//Not naked yet
	if(!pc.isNude())
	{
		output("Shuddering, you respond to her critique by stepping back and tearing out of your [pc.gear] in seconds, piling the obstructing equipment on the bench just out of her reach. You ask, <i>“How’s that?”</i> though it’s revealed as a prideful hypothetical when your nude form presses back against hers.");
	}
	//Merge
	output("\n\nYou press your [pc.cocks] harder against her - hard enough ");
	if(pc.cockTotal() > 1) output("for one ");
	output("to feel her clenching ring. Shifting the angle, you thread yourself lower between her thighs, pressing your length against the bump of her rear clit, feeling the suit sink into her slit around you as you tease her. Shekka’s busy motions on the table slow before being interrupted by an instinctive twitch of pleasure. The sound of her moan is muffled by her tightly-closed lips, but you hear it nonetheless.");
	output("\n\n<i>“What’s the matter?”</i> it’s your turn to ask. <i>“No wonder you’re so worried about sex interfering with your work. All it takes is a little rub on one of your knobs to interrupt you.”</i>");
	output("\n\nShekka picks up the screwdriver she just dropped and grits her teeth. <i>“It... it just slipped is all!”</i> She goes back to work, pausing to whimper every now and again when [pc.oneCock] grinds against her clitty in a particularly delicious way. <i>“I’ll fix this before you figure out how to... mmm... fuck my pussy.”</i> She glances over her shoulder to stick her tongue out at you and wink. That lengthy tongue shivers across her lips sensuously on the next thrust before she turns away once more. The little slut is egging you on!");
	output("\n\nTaking one hand off her skin-tight suit, you press your palm to her [shekka.belly], sliding it down to her mons from the opposite side of your slowly thrusting dick. You find the bump of her second clit and press your middle finger down, swiping it back and forth across the pleasure-sensitive bud.");
	output("\n\nShekka barks, <i>“Fuck, [pc.name]! Ung! T-take it easy, oooookay?”</i> Her gratuitous hips give a sexy wiggle, wanting more.");
	if(silly) output(" Those hips don’t lie.");
	output("\n\n<i>“Are you sure?”</i> You press and rub her from both sides, still peeling her out of her jumpsuit with your free hand while she twitches and bucks. The alabaster fabric rolls halfway down her ass before catching between your paired forms. The front is hooked by your busily gyrating finger as well. Somehow she hasn’t lost her grip on her screwdriver. She’s even managed to pop the cover off the item she’s working on; it’s a flashlight, albeit an archaically designed one.");
	output("\n\n<i>“Y-y-yes,”</i> Shekka answers, dropping her tool not because of the overwhelming feelings coming from her thighs but because she’s finished with it. It’s hard to tell if she was answering your question or merely giving voice to her pleasure. Upon reflection, you realize that it doesn’t really matter much either way. Your [pc.cocks] ");
	if(pc.cockTotal() == 1) output("is as hard as a titanium bar");
	else output("are as hard as titanium bars");
	output(", and there’s no way you’re going to pass up on your raskvel honey’s pussy.");
	output("\n\nYou pull away from the fidgeting mechanic. Her hands are shaking as she swaps components, and her breath is as ragged as an endurance runner’s. She’s still managing to do her work, though. The jumpsuit gives way around her hips, stretching before rolling down her scaly hips. It clings to her sopping-wet slit in liquid-assisted defiance before finally breaking away, carrying a glossy sheen as a momento of its time wedged into her crotch. You grunt in appreciation of the fine ass you’ve revealed while you push her clothing to the ground.");
	output("\n\nShekka’s tail pats the side of your face, right on your cheek, and she purrs, <i>“Mmmm, good " + pc.mf("boy","girl") + ", but I think I might get this repaired before you can cum inside me.”</i> The naughty little limb snakes down your neck to your chest then around to your [pc.butt]. It slaps you for good measure. <i>“If this is the best you’ve got, maybe I should just let you at me the whole damn day. I could get so much done before you even wring a single orgasm out of my dripping... wet... cunt.”</i> She steps further apart to show you just how wet she’s become.");
	output("\n\nOh wow, is it ever. Her violet lips are absolutely sopping. Beads of clear lubricant hang from her labia like rain clings to a spider’s web. Plump and engorged, her meaty vulva is begging for a fuck. Both her clits are jutting out from between the soaked lips, and droplets hang on slick strands from them, sometimes releasing to patter on the floor. A small puddle has formed beneath the juicy raskvel, matching the one in her suit, proof of just how badly she needs you to fuck her.");
	output("\n\nIt’s too much: her taunting words, the tantalizing gates of pleasure so close that can feel the heat steaming off of them, and the submissive, bent-over pose. Even if you were determined not to fuck her, you couldn’t stop your [pc.hips] from lurching forward. You couldn’t stop your [pc.cock " + x + "] from spreading them wide");
	if(y >= 0) output(" or your [pc.cock " + y + "] from battering into her tight asshole");
	output(". You certainly wouldn’t be capable of holding back the growl that rips its way out of your throat as your body asserts its primal need to fuck and breed the female its been presented with.");
	output("\n\nShekka’s legs slam against the table as you take her from behind, pressing on her hard enough that she winds up pressing her tits around her project and sending her tools scattering away. Her lips cling to your piston like oiled cylinder walls, and as you really start to give it to her they only seal tighter around you. Every forceful thrust is accompanied by lurid squelches, every cock-hilting thrust matched by affectionate, muscular squeezes from Shekka’s box. The impacts cause you to bump her rearward clit repeatedly, and she moans each time. These raskvel were made to be fucked from any angle; no matter how you take them, one of their clits will be happily sparking.");
	pc.cockChange(true,false);
	output("\n\nYou settle into an easy musical rhythm. Her swaying, pierced ears provide a pleasant jingling background while her staccato moans provide proof positive that she’s getting the hard fucking she wanted. Shekka’s petite body feels almost entirely wrapped around your [pc.cock " + x + "] even though such a thing is impossible. Her tail is wrapped around your waist encouragingly, helping you to thrust into her as hard as absolutely possible. If you weren’t so caught up in the moment, you might be worried that you would bruise her thighs against the workbench. She wouldn’t let you stop, though. She’d tell you to get back to work. After all, she’s working.");
	output("\n\nIt’s hard to tell if she’s still working, actually. She did manage to pull the cylindrical device out from between her perky tits. Damn, her nipples look hard. And she seems to be trying to do something with it, but she keeps throwing back her head and moaning. Her free hand keeps dropping screws and scrabbling against the workbench’s unforgiving surface. Shekka might have made some good progress on her toy, but there’s no way she’s going to finish it in this condition.");
	output("\n\nShe’s little more than a slutty mess of fuckjuice and pleasure now - a tingling bundle of nerves spasming around your ");
	if(y >= 0) output("doubled dicks");
	else output("[pc.cock " + x + "]");
	output(" in an effort to please you. Her tongue lolls out of her mouth. There’s at least half a foot of organ there, leading you to wonder what a blowjob from the little gadget-slut would be like. Holding her by the hips, you pound away, feeling her start to orgasm underneath you, gushing fluid over your [pc.knot " + x + "]");
	if(y >= 0) output(" and clenching around your [pc.cock " + y + "] with her pucker");
	output(". Right now, she’s the perfect little sextoy, and you’re using her like one.");
	output("\n\nFuck, she’s getting tighter every time! It’s actually starting to get hard to pull out of her, and the soaking-wet girl goo bathing you is challenging you to erupt. No, worse than that, her whole body is begging for a thick wad of your [pc.cumNoun]");
	if(y >= 0) output(" - even her ass");
	output(".");
	output("\n\nShekka babbles in a brief interlude between orgasms, <i>“Fucking fuck me! Cum!”</i> Of course, her pink eyes roll back and a second later, her words transform into poorly enunciated “yes”es and “ahh”s of pleasure. Bending low over top of her, you feel the rising heat inside you, signaling that your own release is soon at hand. You wrap an arm under her chest, lifting her up to press against your [pc.chest]. Grabbing tight, your palm encircles her breast, and you bottom out one last time");
	var knot:Boolean = false;
	var knots:Boolean = false;
	if(pc.hasKnot(x)) knot = true;
	if(y >= 0)
	{
		if(pc.hasKnot(y)) knot = true;
		if(pc.hasKnot(x)) knots = true;
	}
	if(knot) 
	{
		output(", your expanding knot");
		if(knots) output("s");
		output(" slipping in");
	}
	output(".");
	
	var cumQ:Number = pc.cumQ();
	
	//The knots have it
	if(knot)
	{
		output("\n\nThe feeling of seating yourself deeply inside her and being locked in place by your expanding biology only makes your climax that much hotter.");
		if(knots) output(" Doing that to both her holes at once is even better.");
		if(cumQ < 10)
		{
			output(" Dribs and drabs of [pc.cum] leak out from your ");
			if(y >= 0) output("doubled dicks");
			else output("[pc.cock " + x + "]");
			output(", oozing in thin flows into her oh-so-receptive body. You run out long before the ecstasy subsides. Perhaps you should let your [pc.balls] rest a bit in between orgasms.");
		}
		else if(cumQ < 25)
		{
			output(" Spurts of [pc.cum] splatter into her waiting body with explosive eagerness, your [pc.hips] twitching a little further forward with each successive ejaculation.");
		}
		else if(cumQ < 250)
		{
			output(" Thick blobs of [pc.cumNoun] explode out of you one after another, bathing Shekka’s interior");
			if(y >= 0) output("s");
			output(" in a thick coat of your [pc.cumColor] love. You hold position, secure in the knowledge that your knot");
			if(knots) output("s");
			output(" will pin every drop inside her.");
		}
		else if(cumQ < 2000)
		{
			output(" Massive blobs of [pc.cum] pour out of you, so voluminous that each barely has time to finish before the next ejaculation is erupting like a volcano. Poor Shekka’s body is absolutely filled with your [pc.cumColor] seed.");
			if(y >= 0) output(" Her belly even rounds from the combined injections.");
		}
		else
		{
			output(" Gigantic blasts of [pc.cum] force their way into Shekka’s eager tunnel");
			if(y >= 0) output("s");
			output(" packing ");
			if(y >= 0) output("them ");
			else output("it ");
			output("full with the first few injections. The next ones, sealed in by your knot");
			if(y >= 0) output("s");
			output(", swell her [shekka.belly] with added weight, giving her a positively pregnant appearance.");
			if(!knots && y >= 0) output(" Sadly, you don’t have knots to plug both sides, and waves of hot-pumping [pc.cumNoun] vent out over one of your [pc.cocks].");
			if(cumQ >= 5000) output(" Her wobbly, spunk-stuffed tummy grows so big that you worry for her health, but by then the fluid distention widens her passage enough for streams of it to sluice out over your crotch, venting the pressure.");
		}
		output("\n\nYou go limp, your ardor spent, but your knot");
		if(knots) output("s hold");
		else output(" holds");
		output(" you secure inside of her, giving you time to appreciate the outlines of her shoulderblades and the natural fragrance of her feathery hair.");
	}
	//No knot for you, come back next year.
	else
	{
		output("\n\nHer wet, milking walls coax you to a glorious a climax");
		if(y >= 0) output(", and the way her asshole is tugging at your dick doesn’t hurt either");
		output(". ");
		if(cumQ < 10) 
		{
			output("Dribs and drabs of [pc.cum] leak out from your ");
			if(y >= 0) output("doubled dicks");
			else output("[pc.cock " + x + "]");
			output(", oozing in thin flows into her oh-so-receptive body. You run out long before the ecstasy subsides. Perhaps you should let your [pc.balls] rest a bit in between orgasms.");
		}
		else if(cumQ < 25) 
		{
			output("Spurts of [pc.cum] splatter into her waiting body with explosive eagerness, your [pc.hips] twitching a little further forward with each successive ejaculation.");
		}
		else if(cumQ < 250)
		{
			output("Thick blobs of [pc.cumNoun] explode out of you one after another, bathing Shekka’s interior");
			if(y >= 0) output("s");
			output(" in a thick coat of your [pc.cumColor] love. You hold position, feeling some of it slop back out around your [pc.cock " + x + "], ");
			if(pc.balls == 0) output("running down your [pc.leg].");
			else output("clinging to your [pc.sack] to make it shine with sex.");
		}
		else if(cumQ < 2000)
		{
			output("Massive blobs of [pc.cum] pour out of you, so voluminous that each barely has time to finish before the next ejaculation is erupting like a volcano. Poor Shekka’s body is absolutely filled with your [pc.cumColor] seed.");
			if(y >= 0) output(" Her belly even rounds from the combined injections.");
		}
		else
		{
			output("Gigantic blasts of [pc.cum] force their way into Shekka’s eager tunnel");
			if(y >= 0) output("s");
			output(" packing ");
			if(y >= 0) output("them ");
			else output("it ");
			output(" full with the first few injections. The next ones, heavy as they are, swell her [shekka.belly] with added weight, giving her a positively pregnant appearance. Waves of excess, hot-pumping [pc.cumNoun] vent out over your [pc.cocks] as you continue to ejaculate, sluicing down your ");
			if(pc.balls > 0) output("[pc.balls]");
			else output("[pc.leg]");
			output(".");
			if(pc.hasCockFlag(GLOBAL.FLAG_FLARED)) output(" Your flared tip makes sure a fair portion of it shoots directly against her cervix.");
		}
		output("\n\nYou go limp, your ardor spent and your softening length");
		if(y >= 0) output("s");
		output(" slipping halfway out of her. You take the moment to appreciate the shapeliness of her shoulder blades and the natural scent of her feathery hair air.");
	}
	//Merge
	output("\n\nAfter a while of holding her like this, she comes down from her own plateau and cranes her head around to look at you, smiling. It isn’t a mere sated smile either - the kind that telegraphs just how well fucked she’s been. No. It’s a gloating, knowing smile. She flicks a switch on the flashlight, and a beam of incandescent light illuminates her work area. Shekka gently pushes you back with her feet, letting your soaked [pc.cocks] fall away. She pulls herself up onto her workbench, rubbing her belly, a slightly vacant look in her eyes. <i>“I think we both won that little competition.”</i>");
	output("\n\n<i>“Oh?”</i> you say while wiping up.");
	output("\n\nShekka nods, giggling, her hand still on her belly. <i>“Fuck yes. Cumming and fixing something? That was nirvana. We have got to do this again sometime. I’ll try and score a bunch more broken things to fix, and we can do this every time.”</i>");
	output("\n\nYou shrug, unable to hide the grin on your face. Your [pc.cum] is pooling between her legs on her bench, and she hasn’t noticed. <i>“Sure thing, babe.”</i>");
	output("\n\nShekka doesn’t even bother cleaning herself up. She just starts tugging on her jumpsuit, making sure it’s tight enough against her swollen crotch to hold in every drop. Judging by the audible squish it makes as it presses against her nethers, you can only assume it caught a fair amount of liquid action itself. She doesn’t comment on it, instead mentioning something about washing up after work, but you think she might just like the feel of her pussy swimming in it.");
	processTime(30);
	fuckedShekka();
	shekka.loadInCunt(pc,0);
	if(y >= 0) shekka.loadInAss(pc);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//Tribadism Around A Vibrating Tail
public function tailbadism():void
{
	clearOutput();
	userInterface.showBust("SHEKKA_NUDE");
	userInterface.showName("\nSHEKKA");
	var x:int = rand(pc.totalVaginas());
	output("<i>“Let’s have a little bit of girlish fun, just you and me,”</i> you offer, flicking a sign on the door to read <i>“Closed.”</i>");
	output("\n\nShekka’s tail gently swats your [pc.butt] before you finish. <i>“Sure thing, but we’ll have to see if you can keep up with me.”</i>");
	output("\n\nSpinning about, you ");
	if(pc.tallness >= 72) output("drop low to ");
	output("grab her around the waist, pulling her into a surprise kiss - your payback for her tail’s probing. Her lips are soft against your own, compressed down by the force of the kiss, but her long, sinuous tongue winds into your own mouth, its pernicious wiggling inciting your [pc.tongue] into a dance. You grab her by the back of the neck, the pink feathers of her hair soft between your fingers, and press her closer, tighter, her budding breasts against your [pc.chest].");
	output("\n\nShekka’s fingers are no less busy");
	if(!pc.isNude()) output(", moving amidst your [pc.gear], separating it from your [pc.skinFurScales] with deft contortions of her fingers");
	else output(", moving over your [pc.skinFurScales]");
	output(", crawling over your body to your [pc.nipples]. They gently tweak them while her tongue curls around your own, filling your mouth with inch after inch of the pliable organ. You stumble around the room from junkpile to junkpile. Your [pc.legOrLegs] unsteadily wobble");
	if(pc.legCount == 1) output("s");
	output(" as you try to focus on twisting tongues and the slim fingers prodding at your");
	if(!pc.isNude()) output(" increasingly nude");
	output(" form.");

	output("\n\nThe raskvel rides you like a bucking bronco, taking you to the ground once your excitement overwhelms your motor control. She breaks the kiss at last with a satisfied sigh. Her lips are glossy with shared saliva, and her meager chest is heaving with panting breaths. Shekka grins and raises a finger to the neckline of her jumpsuit. <i>“Just a little bit of girlish fun.”</i> The suit parts, a line opening up down the center of her chest. She ");
	if(pc.biggestTitSize() < 1) output("greedily caresses your own, letting her fingernail dig in just a little.");
	else output("greedily gropes your tits, squeezing and caressing the orbs impulsively.");
	output(" <i>“Just a little bit.”</i>");

	output("\n\nThe slowly opening divide in the alabaster fabric widens with torturous slowness, but it affords you a detailed view of Shekka’s reddish scales and well-formed breasts. You grab hold of it on both sides and tug. It gives as if there was never anything holding it at all, allowing you to yank it down to her flared hips in an instant. The raskvel’s puffy nipples pebble in the cool air, and you let go of her suit to brush one with your thumb, eliciting a gasp of delight from the tiny alien.");
	output("\n\nShekka giggles and squirms, but she lifts her shapely bottom up off of you to aid you in disrobing her. You tug it down her legs to her knees before giving up on the current positioning and rolling, pinning her underneath you so that you pull the offending garment entirely away. You toss it over your shoulder, and it lands in a shimmery heap, its owner naked and vulnerable below. You echo, <i>“A little fun,”</i> now that you’re above her, your [pc.vaginas] close enough to hers to kiss, the glittering wetness of your anticipation hanging from");
	if(pc.hasClit()) output(" a [pc.clit]");
	else output(" you");
	output(" like a drop of dew.");
	output("\n\nHer tail curls up between your bodies to bar her violet entrance from sight. She giggles playfully, then bucks her hips upward, slamming the slightly-ridged texture of her tail into [pc.oneVagina]. You gasp in surprise and pleasure. The sudden press of her warm body against your entrance is at once tantalizing and mildly painful - more the former than the latter. Then, with a knowing grin, Shekka closes her eyes, an expression of pleased focus on her features.");
	//Happened before
	if(flags["TIMES_TAILVIBED_WITH_SHEKKA"] != undefined)
	{
		output("\n\nYou remember the vibrator in her tail a second before it activates, but nothing could prepare you for how good her scales feel buzzing against your puffy, aroused entrance.");
	}
	//Not before
	else output("\n\nYou look on in confusion, but her tail answers your unspoken question with a powerful, throbbing buzz, vibrating wildly against your puffy, aroused entrance. It obviously has some kind of implant that lets it shake so... so... well.");
	//Merge
	output("\n\nA high pitched whimper slips from your lips while your [pc.hips] react to the pleasure with an instinctive, powerful thrust, pinning the ");
	if(pc.tallness >= 55) output("smaller");
	else output("equally small");
	output(" mechanic to the ground with your creaming-wet pussy, wrapping half of her tail with your folds. On the other side, her immensely engorged labia spread until you can feel them kissing around the trembling intruder. Both pussies lock into a sopping-wet embrace around her vibrating tail; you barely seem to be different creatures. Where once there were two aroused beings, there remains only a single, writhing beast of sapphic desire.");
	output("\n\nThe buzz quiets, drowned in a sea of feminine lubricants, but you are far from idle. Supporting yourself with one hand, you reach for one of Shekka’s breasts, grabbing on for dear life. It’s soft and supple, blushing hotly. You can feel the little raskvel’s tiny heart hammering in her chest as you squeeze. The eager pushes and prods of her own fingers against your [pc.chest] abate. Instead, her arms close around your neck and pull you into her, kissing you once more. Her nails dig into your back, but your sense of pain is deadened by the white hot bar of pleasure assailing your loins.");
	output("\n\nDamn, Shekka’s tongue is long. She could probably loop it around your tonsils if she wanted to, but she seems content to slide it against your mouth’s muscle, curling and squeezing it, sometimes constricting, boa-like around it. You lose yourself in the tangle of limbs, the ecstasy of one body pressed against another and the constant vibrations torturing your");
	if(pc.hasClit()) output(" [pc.clit]");
	else output(" inner walls");
	output(" with pleasure. The room seems to be spinning.... Wait, it is spinning!");
	output("\n\nShekka pins you flat on your back, but that frees you enough to reach down and grab her ass, to feel her cheeks twitch and her muscles dance when a spasm of uncontrollable sexual energy convulses through her hips. She squirms, moaning into you. Your hands pull her harder against you, increasing the force of the tremors wracking your cunt - and hers. The scaley slut screams into your mouth and finally breaks the kiss, shrieking into your shoulder as she cums. Her juices spatter over your [pc.legOrLegs] like rain from a typhoon. It’s all you can do to steady her thrashing form from tumbling to the floor while avoiding a cunt-wrenching cum all your own.");
	output("\n\nNervelessly fluttering, Shekka’s fingers telegraph her orgasm directly into your ");
	if(pc.biggestTitSize() >= 1) output("breasts");
	else output("chest");
	output(", catching on your [pc.nipples] and pressing into the soft, nerve-packed tips. You close your eyes and grit your teeth, holding yourself back from the edge by sheer force of will. The petite beauty above twists and wiggles through euphoric spasms, secure in your arms, juicing twat still pressed to yours around the intrusive wiggling of her tail. You press your lips to hers in a tender kiss, and she slowly stills, only occasionally trembling through aftershocks.");
	output("\n\nStill holding tight to her, you feel the heated waves of ecstasy fluttering in your nethers, as irresistible as the ocean tides. The cunt-clenching tsunami crashes over your crumbling wall of willpower, bathing everything in tidepools of pleasure. Your eyes roll back a second before Shekka’s clear. The crafty girl acts as soon as she realizes what’s going on. Her tail, once a passive participant for you to grind against, slithers into your [pc.vagina " + x + "], still vibrating. Your convulsing, bliss-filled walls clamp onto it. You can feel the vibrations carry through your pliant, clinging flesh");
	if(pc.hasClit()) output(" all the way to your [pc.clits]");
	output(".");
	if(pc.hasCock()) 
	{
		output(" Your [pc.cocks], pinned between the two of you, spurt");
		if(pc.cockTotal() == 1) output("s");
		output(" your [pc.cum] between your slick, squirming forms, simultaneously forgotten and yet adding another layer of bliss to your overpowering release.");
	}
	//Cuntchange
	pc.cuntChange(x,5,true,true,false);
	output("\n\nYou twist on the floor, the raskvel riding you, pumping you wildly. The air fills with the high-pitched sounds of your passion and the scent of your mixed secretions almost seems to steam the air around your sweaty, entwined bodies. Shekka pulls partway out to hold her tip against");
	if(pc.hasClit()) output(" [pc.oneClit]");
	else output(" your lips");
	output(", and the vibrating length drives your consciousness away in an explosion of ecstasy.");
	processTime(40+rand(10));
	pc.orgasm();
	chars["SHEKKA"].orgasm();
	clearMenu();
	addButton(0,"Next",shekkaGrindsFinish);
}

//Next
public function shekkaGrindsFinish():void
{
	clearOutput();
	userInterface.showBust("SHEKKA_NUDE");
	userInterface.showName("\nSHEKKA");
	output("You come to feeling wet and sticky all over, a small form perched atop you. Its brilliant, exuberant eyes blink at you, and your groggy mind identifies it as Shekka. She giggles, kissing you on the lips once more before standing up and offering a hand");
	if(pc.tallness >= 60) output(", a gesture that’s almost comical given the size difference");
	output(".");
	output("\n\n<i>“Wow,”</i> you pant, still a little stunned.");
	//Never had vibrations before
	if(flags["TIMES_TAILVIBED_WITH_SHEKKA"] == undefined)
	{
		flags["TIMES_TAILVIBED_WITH_SHEKKA"] = 0;
		output("\n\nShekka beams. <i>“Subdermal vibrator implant.”</i>");
		output("\n\nThere’s no hiding your surprise.");
		output("\n\n<i>“What? You don’t have those back home?”</i>");
		output("\n\n<i>“No,”</i> you answer. At least, you’re pretty sure you don’t. You haven’t seen one before, anyway.");
		output("\n\nShe waggles her wiggly little appendage. <i>“Well, it’s nice, isn’t it?”</i>");
		output("\n\nIt is indeed.");
	}
	//Had 'em before
	else
	{
		output("\n\nShekka smirks as you get up on");
		if(pc.legCount == 1) output(" your");
		output(" wobbly [pc.legOrLegs]. <i>“It was only a little fun....”</i>");
		output("\n\nYou roll your eyes. <i>“It’s a good thing you’re not any bigger then! I’m not sure I could handle any more of you vibrating like that.”</i>");
	}
	//Merge
	output("\n\nGathering your [pc.gear], you and the little raskvel make yourselves as decent as you can, though the scent of your recent lovemaking hangs heavy in the air around you. Anyone with a keen sense of smell will be sure to smell the evidence of your recent tryst, no doubt. Before you flip the sign back to mark the shop as being open, Shekka gives you a wink. Then, her welding mask flips closed, and she goes back to work.");
	flags["TIMES_TAILVIBED_WITH_SHEKKA"]++;
	fuckedShekka();
	//Pass 70-80 minutes
	processTime(30+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function fuckedShekka():void
{
	if(flags["TIMES_SEXED_SHEKKA"] == undefined) flags["TIMES_SEXED_SHEKKA"] = 0;
	flags["TIMES_SEXED_SHEKKA"]++;
}

//Big Dick Ear Shenanigans
//big dick requirement in tandem with a minimum height requirement of around 5'6" (5-6 feet)
//Requires 500mLs fo cum
public function hugeEarShekkaFaps():void
{
	clearOutput();
	userInterface.showBust("SHEKKA_NUDE");
	userInterface.showName("\nSHEKKA");
	author("Kirbu");
	if(shekkaIsCrew()) author("Kirbu + SKoW");
	
	output("You lean in against the diminutive mechanic, close enough for your pulsing bulge to get her attention. The gesture is as subtle as a cargo ship tumbling through lower orbit. Shekka motions for you to ");
	if(pc.isNude()) output("strip and ");
	output("get down on the ground, a request you happily see to in short order. ");
	if(shekkaIsCrew()) output("As inconvenient as it would be, part of you wants to spring for a rug in the engine room as the floor chills your [pc.ass]. Thankfully your comfort isn’t a long-term issue once your raskvel dance partner is back in clear view, situated between your [pc.legs].");
	else output("The warehouse floor is cool on your [pc.butt], and it takes a bit to get comfortable as you prop up on your lower arms. Comfort isn’t all that big a priority once your raskvel dance partner is back in clear view, situated between your [pc.legOrLegs].");
	output("\n\nWhereas you ");
	if(pc.isNude()) output("rid yourself of gear and ");
	output("clambered down in almost record time, Shekka is more concerned with taking her time on a proper show. The reptilian handywoman’s seductive gaze effortlessly hooks you in as her hands reach back to undo her jumpsuit. ");

	if(!shekka.hasCock())
	{
		output("Each enticing inch of the fabric curtain clings desperately to her fine, crimson scales before surrendering its captives to bounce back in freedom. A tail skimming across your [pc.skin] in pace with the strip-tease adds a subtle physicality to the presentation; it’s enough for your rocket to prepare to launch.");
	}
	else
	{
		output("Each enticing inch of the fabric curtain clings desperately to her fine, crimson scales. Before her suit gets a chance to release its captive curves, it’s held up by the little Rask’s growing horse-cock before before it finally surrenders the captive curves to freedom.");
		output("\n\nSweet pebbly nipples stick out, adding to the visual temptations, but the moment her tail skims across your gradually-warming [pc.skinFurScalesNoun] in pace with the strip-tease it adds adds a subtle physicality to the presentation. If you weren’t horny now this is enough for your rocket to prepare to launch.");
	}
	output("\n\nShekka’s spectacle has made it down to her waist by this point, far enough along for your [pc.cockBiggest] to display its true fury. ");
	if(flags["TIMES_SHEKKA_KIRBUED"] == undefined) 
	{
		output("The monument’s scale begins to dawn on the rask, her once-sensual expression fading to one of contemplative frustration. You’re worried when she drops the act entirely, haphazardly untangling her clothing from her legs and tossing it aside. With a perplexed, furrowed brow, Shekka focuses intently on the twitching colossus, no doubt seriously considering the undertaking.");
		output("\n\nReality refuses to wane, however, and her face deflates with a defeated sigh. Shekka slumps forward, ");
		if(pc.biggestCockLength() < 20) output("resting her chin down on your [pc.cockHeadBiggest]");
		else output("resting a cheek on the side of your [pc.cockBiggest]");
		output(". Funnily enough, your titanic rod appears to have no trouble propping up the sixty pound alien as she leans ");
		if(pc.biggestCockLength() < 20) output("on");
		else output("against");
		output(" it.");
	}
	else
	{
		output("Thankfully your broad-reared Raskvel honey is now no longer a stranger to the monumental size of your [pc.cocks]. She leans bodily on ");
		if(pc.cockTotal() > 1) output("one of your members");
		else output("your member");
		output(", ");
		if(pc.biggestCockLength() < 20) 
		{
			output("resting her chin down on ");
			if(pc.cockTotal() == 1) output("your");
			else output("a");
			output(" [pc.cockHeadBiggest].");
		}
		else
		{
			output("resting a cheek on the side of ");
			if(pc.cockTotal() == 1) output("your");
			else output("a");
			output(" [pc.cockBiggest].");
		}
	}

	output("\n\n<i>“You realize this hunk of meat ");
	if(pc.biggestCockLength() < 30) output("is almost as tall as me");
	else if(pc.biggestCockLength() < 46) output("is as tall as me");
	else if(pc.biggestCockLength() < 100) output("completely eclipses me");
	else output("can be seen from outer space");
	output(", right?”</i> Shekka concedes, the brunt of her scale more evident than ever. The scaley alien leans further ");
	if(pc.biggestCockLength() < 20) output("onto");
	else output("into");
	output(" your penis. ");
	if(shekka.hasCock()) output("Her prick presses against your own like a core of heat, oozing pre freely into your musky exterior. ");
	output("It’s clear to both of you that your massive member won’t be finding a home between the raskvel’s impressive thighs, but the alien isn’t ready to throw in the towel quite yet.");
	output("\n\nHer warm body feels quite nice pushing into your third leg; it’s certainly enough to keep your sexual engines idling contently. Shekka’s head twists a little as she thinks, causing her soft ears to brush against your torso. The long, floppy tracts of thin skin and scale are lazily resting along your belly. Curiously, you raise a hand up to feel one. The moment your thumb brushes along the fine, velvety underside, a shiver races up your lover’s tiny spine. She grasps onto your [pc.cockBiggest] to steady herself, the overwhelming tingle proving quite effective.");
	output("\n\n<i>“Find something you like there?”</i> the miniature mechanic teases. You hold the ear up to her, hoping the gesture is enough to convey what you have in mind.");
	if(flags["TIMES_SHEKKA_KIRBUED"] == undefined) output(" It takes her a moment to get on your wavelength. Slowly, but surely, her perplexion makes ways for sly arousal.");
	else output(" Shekka seems excited for a repeat ear-ride on the fuck-train to cumsville. Her body grinds hard enough against you that you can feel every contour of her lightly-scaled flesh against your veins.");
	if(shekka.hasCock()) output(" Her cock seems to agree, judging by how it throbs eagerly, even while she gently frots against you.");
	output("\n\n<i>“Ah, feeling like getting extra frisky, don’t you?,”</i> Shekka whispers as her tail resumes its sensuous stroking of your inner thigh. The creative raskvel puts the tips of her ears in each of her hands and blissfully glides them down your tower to its foundation. The interplay of her cold, metal piercings mingling with warm, pliable skin is a surprising touch - one that distracts you from their pointier features.");
	output("\n\nA firm weave of thin velour skin embraces your [pc.cockBiggest]. Her ears ");
	if(pc.biggestCockLength() < 20) output("easily");
	else if(pc.biggestCockLength() < 30) output("just barely");
	else output("almost");
	output(" leave no square inch of your turgid sausage to the open elements. As world-rocking as the fine flesh burrito feels, the sight of the perfectly symmetric zigzag of crimson scales is equally impressive. If you weren’t so attached to it, you’d imagine the fine phallus would be better suited in an art gallery. Let no one say the little craftswoman doesn’t live up to her profession.");
	output("\n\nThe charged heat emanating from your cock seeps into the woman’s lithe listeners. There’s no helping at least smirking as she visibly tries to keep from succumbing to the electricity flowing through her, too keen on making adjustments on her masterpiece. By the time Shekka is complete, she’s left with only a few free inches of skin planting her face extraordinarily close to your plump and exposed [pc.cockHeadBiggest]. Just the way she wants it, you imagine; the eccentric little deviant took extra care to tuck in some of the makeshift sheathe right ");
	var x:int = pc.biggestCockIndex();
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output("underneath the broad expanse of your flare");
	else if(pc.cocks[x].hasFlag(GLOBAL.FLAG_TAPERED)) output("atop the barest limits of your tapered tip");
	else output("underneath your mushroom top");
	output(".");
	output("\n\n<i>“Well, what do you think?”</i> she asks. As you breathlessly voice your approval, Shekka moves in on your enshrouded meat. Her pert, little breasts do what little they can to flank your scale-covered shaft. Supple, leathery feet go to work on your ");
	if(pc.balls > 0) output("[pc.balls]");
	else output("taint");
	output(", skillfully treading the fine line between rough and considerate handling of your sensitive flesh. Once those tender arms grasp soundly to the amalgamation of cock and raskvel ear, it’s certain your brain has bought itself a sweet new home up on cloud nine.");
	output("\n\nThe whistle blows, signaling the factory workers to go to work. They prep the station with a surge of pre, sending the fluid out the production lines, down the pulsing slopes and into the visiting alien outside. The sensation of your liquid seeping down over your smokestack and Shekka’s curtains pushes the leathery alien to grind in even closer against you, straining your mighty dick’s otherwise proud skyward salute. The unending geyser isn’t content just coating the rask’s shivering ears and drills away to the throbbing candy center.");
	output("\n\nBy the time Shekka’s kissing and licking away at your mountaintop, you’ve spurted enough lube for her tight bind to begin shifting against your slick flesh. And shift it does. The movement isn’t much, but its all-encompassing nature means your genital’s every nerve ending gets to ride the electric high. The cocktail of writhing alien flesh and embrace slamming into your dick from every direction easily outdoes any imaginable onahole.");
	output("\n\nYour arms’ attempt to prop you up by this point has become a meager one. They ache with the longing to reach out and assist in the penis parade. However, they turn to putty the moment you even try and reach towards the action. Your frustrated grabbers can only clutch at whatever flesh or object they can find nearby, eager for their opportunity to get tagged in to the action.");
	output("\n\nFor whatever pleasure coaster you seem to be riding, Shekka’s must be going at least twice its speed. Unyielding rivers of pre have completely soaked her ears at this point. Their snug hold around your cock remains steadfast, but they still rub ever so slightly along your length. Turns out those smooth, velvety strokes are lightning on delicate raskvel senses. Each vertical centimeter traversed tickles millions of sensitive nerves all along the insides of Shekka’s luxurious ears. They send the alien into uncontrollable shivers, her tethered head pulling your cock one way and another.");
	output("\n\nThe lost, little tail has long since given up its thoughtful caress of your body by now. Instead, the appendage is anxious to shove its way into any available cavity. Its fervent search starts by prodding at your [pc.butt]. Pressed against the ");
	if(shekkaIsCrew()) output("solid warehouse floor");
	else output("chill metal of your ship’s floor");
	output(", however, the hope of anal exploration dims and vanishes with each fruitless poke and press. Defeat’s bitter taste is short lived when the desperate pioneer decides to make for familiar lands. Shekka spikes her tail right down her moist, quivering toolbox. For a brief moment, you imagine the thing was vibrating, but the suspicion instantly dissolves for more pressing concerns.");

	output("\n\nWith feminine plumbing issues resolved, Shekka’s writhing conquest atop your [pc.cockBiggest] has escalated. Frequent shifts between impassioned grinding and lovemaking to your buzzing cockhead are chipping away at your foundation. Eventually your epic [pc.cockNounSimple " + x + "] can no longer triumphantly withstand the onslaught of attention, and as your restraint withers to be replaced with naught but the urgent need to orgasm, your seemingly endless prick finally plummets towards your waiting [pc.arms] like a felled tree.");

	output("\n\nA deliciously moist thud welcomes Shekka and your captive cock to your [pc.fullChest], their combined sweat and pre spreading along the countryside in due time. Your hands’ hardships can finally come to an end with this wondrous turn of events. They seize the opportunity quite literally; your rather enthusiastic grasp swarms the raskvel’s backside, pressing both alien and dick hard against you. It makes for a scrumptious sandwich of writhing flesh and emotion, one that only tips all involved closer to that ever-approaching boiling point.");
	output("\n\nDespite being closer to your head, your wistful technician’s attention remains faithful to your cocooned cock. In between a flurry of moans, grunts and gasps, she can’t help but suckle and sup at your exposed [pc.cockHeadBiggest] while the rest of her body writhes and rubs against both her electric, soggy ears and your pulsating, excited manhood. The most you can do is squirm underneath her and explore her backside. You find it hard to subconsciously decide between squeezing the alien tight or exploring any curves and crevices your fingers come across. What isn’t happening is your trek making its way to her more private locales; ");
	if(shekkaIsCrew()) 
	{
		if(shekka.hasCock()) output("your lover has them enraptured by a hungrily thrusting tail, adding the lurid slosh of sexual juices to the musky atmosphere. Likewise there is no way to wrap your [pc.hands] around her throbbing futa-cock while it’s pinned between your dick and Shekka’s entire form.");
		else output("your lover has them enraptured by a hungrily thrusting tail, adding the lurid slosh of sexual juices to the musky atmosphere.");
	}
	else output("the alien has them locked tight with a firm, unyielding grasp.");
	output("\n\nTime passes. The broiling mass of glistening flesh has cooked to perfection. The cascade of pre, sweat and feminine drippings coating and soaking into every last surface in a two foot radius is impressive. It may as well resemble little more than an arid desert compared to your churning payload, however. Between your vehement lover’s work and the everlasting ear insulation, your climax has found it difficult to work itself out; all the preparatory fluid in the world doesn’t seem to have done enough. But the pressure deep within your loins has grown painfully powerful. You shudder and convulse, breath caught in the back of your throat as you build up the strength for your release to overcome all obstacles before it.");
	output("\n\nYou’ve seen little more of Shekka than her pink plumage brushing against you, but it’s easy to imagine her sultry expression smearing its way around your cock. That pulsing insistence in your prostate");
	if(pc.balls > 0 && pc.ballDiameter() >= 2) output(" and the tremendous weight of your [pc.balls]");
	output(" batters at your sensibility like a ram, robbing you of the ability to do little more than wordlessly urge her on with unconscious thrusts of your hips.");
	output("\n\nThe pressure mounts.");
	output("\n\nEach moist, little suckle, smooch and sweep across the sensitive tip of your pole is a cattle prod to your pleasure sensors.");
	output("\n\nThe pressure mounts.");
	output("\n\nThe leathery full-body grope almost equals the dual layers of skin and scale entwined around your [pc.cockBiggest] in sheer encompassment. Your pseudo second skin still shifts ever-so-slighty against your charged [pc.skin] sending megawatts of passion through both of your tender, dripping bodies.");
	output("\n\nThe pressure mounts.");

	output("\n\nBy now your body rocks tenuously on the borders between pleasure and pain; the tension stimulating your genitalia’s every nerve manhandles your every thought. You press Shekka hard against your body, magnifying her already fervent grinding and grappling. Her head explores each of its limited movement opportunities atop your fuck-stick; each tug and stretch culminates in another divine dick direction.");

	output("\n\n");
	if(pc.balls > 1) output("Your [pc.balls] are beyond their breaking point, quaking with otherworldly intensity. ");
	else output("Your [pc.balls] are beyond its breaking point, quaking with otherworldly intensity. ");
	output("Any hope this orgasm could go on being denied any further is utterly quashed. ");
	
	var cumQ:Number = pc.cumQ();
	if(cumQ < 3000) output("Gallons");
	else if(cumQ < 10000) output("Waves");
	else if(cumQ < 20000) output("Tides");
	else if(cumQ < 25000) output("Tsunamis");
	else output("Planet-sized discharges");
	output(" of [pc.cum] strongarm their way up your mighty passage. It takes a few more mighty convulsions for your flesh volcano to spew forth, meeting Shekka head on.");
	output("\n\nThe spunky raskvel takes your offering in stride, downing a few mouthfuls with unrelenting rapture as she slams her face just short of being inside your dick. Your orgasm outpaces her consumption after a few more spasms. She recoils back, still taking the brunt of your climax face-first. Her cum-soaked ears still wrapped tightly around your [pc.cockBiggest], Shekka manages to pull your twitching gusher back up off your body. The wonderful gesture only works to spread your seed even further, ");
	if(shekkaIsCrew()) output("cascading");
	else output("recoiling");
	output(" off the alien’s face back down to you and parts nearby.");
	if(cumQ < 6000) output(" Her iron will cracks slightly under your ceaseless cum assault, causing her to cough and sputter against your convulsing hose.");
	else output("You swear her cracked voice pierces through the haze of pleasure swirling around your senses. For all the scaled woman has been through in her life, it still must be hard to fathom just how much jism you can pump out.");

	output("\n\nA deep breath signals the end of your rush, and your Shekka-shrouded sheathe plummets back down upon your [pc.fullChest] with an amazingly moist smack. She just about smashes what little oxygen you’d gulped down right back out of you. Speaking of the little cock accessory, her face is still buried into your [pc.cockHeadBiggest]. She’s fairly motionless. save for a hint of twitching down by her groin. It’s hard to believe how tight of a grip she’s managed to maintain around your member. A little life pops out of her through her toes, once more prodding at your ");
	if(pc.balls > 0) output("relaxing [pc.sack]");
	else output("traumatized taint");
	output(". You decide to leave her be and bask in the sizzling afterglow for a few moments.");
	pc.orgasm();
	chars["SHEKKA"].orgasm();
	processTime(20);
	clearMenu();
	addButton(0,"Next",pageTwoOfShekkaStuffs);
}

// next page
public function pageTwoOfShekkaStuffs():void
{
	clearOutput();
	userInterface.showBust("SHEKKA_NUDE");
	userInterface.showName("\nSHEKKA");
	author("Kirbu");
	output("<i>“I’m... I’m not through.”</i>");
	output("\n\nYour pleasure stasis bubble abruptly bursts. Evidently, plenty of energy is still bouncing about within your blue-collar partner. Shekka’s sopping wet forehead glides against your beating cockflesh, giving you the first sight of anything besides feather since the completion of her ear weave. You only get a really good look at her eyes. Normally thin reptilian slits, you’re instead surprised to find her pupils ");
	if(!shekkaIsCrew()) output("have dilated quite wide.");
	else output("have dilated into broad pools of harsh ship-light.");
	output(" Has the raskvel found herself caught up in some sexual euphoria, you wonder?");
	output("\n\nYou don’t get a good look at the pink peepers before they sink back towards your ample crotch harvest. Shekka makes a tiny sigh before raising her right hand to point at something.");
	output("\n\n<i>“Locker over there. Middle one. Should be...”</i> she takes a moment to breathe in deep through her button nose, <i>“Should be a suit ‘bit bigger than you. Hurry up.”</i>");
	output("\n\nGlancing down her shaky little arm, you indeed spot the container in question. It’s a little perturbing to not get to enjoy your post-sex cuddle! Nevertheless, you jumpstart your idle motor skills to get up and over the few feet across the clutter workspace. It’s made more difficult just with the copious amounts of spunk and sweat spread about you. Once it’s clear you’ll be able to get your ass up off the ground, Shekka reorients her sturdy grasp off your [pc.cockBiggest] to around your waist.");
	output("\n\nYour mind slowly unravels its way through post-coitus relaxation, granting you the cognitive ability to start at empathizing with the clingy raskvel. As enchanted as she was - and still is - by her sensitive ears soaking in your genital heat and such, it dawns on you that this dance was a bit one-sided. Even with her tail wedged up inside her cunt, Shekka never seemed to be pushed beyond a tingling tickle. Her passionate grinding didn’t leave much more to be desired on your end, at least. It wasn’t evident at the time, but you figured the second that appendage of hers found its happy home that your alien fuckbuddy would have seen to her own amusement. Or ");
	if(shekka.hasCock()) output("her meaty, new-grown pole would go off, or ");
	output("something.");
	output("\n\nBut, no. She rode along the edge, content but unfulfilled. A mist of fading pleasure may very well be obscuring you from whatever it is she’s pushing towards. What isn’t obscured is the rather amusing sight dangling in front of you. The way Shekka’s looks now, it’d be easy to forget her typically vibrant, outgoing demeanor. Now it just looks like a cock-obsessed raskvel with a wet ear fetish is bashfully digging her face into your meat, her legs suspended uselessly above the ground as her tail limply hangs out from between them. There’s really no telling what to make of it.");
	output("\n\nAnyway, you eventually make the awkward journey to your destination, meekly pushing away the clutter to get at the locker’s innards. Inside you find a rather large hazmat suit of some sort. There’s a few of them, actually, each of varying sizes. The lion’s share are more along the lines of what you would expect for the tiny alien race. What would she need these for? Why would she even have this many? The sound of Shekka drawing in another large whiff of air through her nostrils breaks the mental line of questioning.");

	output("\n\n<i>“Put it on,”</i> she manages to say on her exhale. <i>“Leave the... leave the helmet.”</i>");
	output("\n\n<i>“But aren’t you-”</i>");
	output("\n\n<i>“Just get it on,”</i> Shekka interrupts, giving you another clear shot at the abnormally wide slits you spotted earlier. It finally sinks in as you pull the heavy suit out from its resting spot. Rather, you smell it. The heady musk of your passionate fuck has the funky little workaholic in an intoxicating rut. Ears soaked with sweat and cum. Head locked inches away from warm, turgid cockflesh. Sweltering, passionate bodies rubbing and grinding against one another for fuck knows how long. Her nasal cavities have been trapped in a dramatically aromatic cloud of steamy copulation, one so potent that the enraptured raskvel can hardly work herself up without amping it up.");
	output("\n\nYou’re happy to oblige on her sex scent-fueled climax! Besides, for what it’s worth, she still feels really fucking good with those lithe, moist, velvety listeners wrapped tightly around your towering passion. It’s a little hard and awkward aligning all involved legs to the appropriate legging - you’ve certainly put on some weight. It’s a rare occasion that makes you thankful for a generous lathering of sexual fluids, making it simple for you and your carry-on luggage to glide effortlessly into the heavy environmental protection.");
	output("\n\nThe wrinkled, rough inner lining is a little coarse against your tender, soaked " + pc.skinNoun(false) + ". It’s certainly nowhere as satisfying as the flurry of fine scales and oases of delicate flesh slowly writhing atop your [pc.crotch]. Sensations go down in importance once you work the suit up to your shoulders; this bastard’s heavy! Is this thing supposed to be protection from radiation or medieval weaponry? It takes a bit of doing just to get your arms into the hefty sleeves. All this time, your raskvelian cock sleeve is clinging to your bare waist doing little more than slowly, slightly undulating against you and your cock");
	if(shekka.hasCock()) output(", her own hermaphroditic musk intensifying as she grinds her equine meat against your own");
	output(".");
	output("\n\n<i>“Go lie down,”</i> Shekka whispers, still unflinching. Her breath is hot and heavy against your sensitive cock-top. You spend a few more moments trying to get the arm situation under control before seeing to the next phase. The thought of returning to ");
	if(!shekkaIsCrew()) output("the warehouse floor");
	else output("the cold floor of your ship");
	output(" isn’t very alluring, so you glance around to try and find a decent resting spot. ");
	if(!shekkaIsCrew()) output("There’s little more than a plethora of stools and benches");
	else output("There’s not much for furniture down here");
	output("; a junky-looking recliner in a corner seems your best bet.");

	output("\n\nYou awkwardly trundle on over to the chair, pushing away whatever random scrap is tossed atop it. The weighty suit makes the simple task cumbersome enough, but your crotch-bound lover makes your escapade even more stiff and clunky. Eventually the seat’s free for you to flop down atop it, kicking up a cloud of dust. You try and lean against the back of the seat only for it to give out on you. You seize up for a moment before resting at fairly elevated angle.");
	output("\n\nThis isn’t exactly your sexiest moment.");
	output("\n\nThe inadequacies don’t last long, thankfully. Shekka raises her head up from being buried deep into your [pc.cockHeadBiggest]. Thick, numerous strands of cum, sweat and whatever else form a tingly spiderweb between her head and yours. Her eyes are no less wide than they were before. But the silent, little alien has a glimmer of warm, mischievous fun in her expression now. For as cold and determined as she’s been up until now, it sets you at ease to see her enjoying herself. You were worried your cock had hypnotized her!");
	output("\n\nHer presence is short lived. Shekka seals herself within your suit with one large, swift motion along the front zipper. You’re alone, staring at your lumpy front side and left wondering how the rask is carrying on. One other thing is quickly dawning on you as well: this suit is hot as hades! Tarkus isn’t exactly a winter wonderland to begin with, nor does your frugal wonder mechanic seem all in that interested in investing in central air conditioning.");
	output("\n\nYour already sexually slick body is sweating up a storm. Just as you’re about to start squirming about in the uncomfortable recliner, the bundle of alien writhes to life! Shekka is taking in deep breaths; from the sounds of it, her nose is doing all the work. A few moments later, she starts grinding against your [pc.cocks]");
	if(pc.balls > 0) output(" and [pc.balls]");
	output(". It’s slow, but forceful.");

	output("\n\nThere was a time where you had actually forgotten about the ear-sheath wrapped tightly around your dick. That time has long since passed; the velvet flaps of skin feel just as heavenly on your swollen member as ever. ");
	if(shekka.hasCock()) output("Slick, wet, dribbling cock presses and slides over every aching, pleasure-drunk inch of your own. ");
	output("Shekka’s newfound sense of action works its way down into her tail, next. It rubs and writhes between your thighs, slightly vibrating during its pound-fest upon the horny technician’s toolbox. Soon, her whole body is on fire, sliding and grinding against your moist, sensitive... everything!");
	output("\n\nYour covered fingers dig into the ratty armrests. Your body is melting under the scaley, well-lubricated piston. The sounds of her heavy, muffled breathing fill the ");
	if(shekkaIsCrew()) output("engine room");
	else output("warehouse");
	output(". The back of your throat seems to be where your own reactions are caught. The stew of sexual funk broiling within your suit has you at a fever pitch, your head left poking out of the potent pressure cooker. If not for Shekka’s hard fury raining almighty spears of bliss upon your every fiber of being, you’d be caught in the midst of one hell of a sauna.");
	output("\n\nYou can’t even begin to fathom how your enthusiastic cock sleeve must be holding up sealed away in your coitus kiln. Her every breath is just another packed punch of sexual smog against her senses. You catch little whiffs every now and then escaping from the loose seal at your neck; it’s strong stuff to say the very, very least. The mere hint of the musky bouquet alone is re-energizing your drive, invigorating your spirit to match that of the one humping away atop you.");
	output("\n\nFriction has become a distant myth for your slippery sweetheart by now. The finely-scaled body never ceases its awe-inspiring conquest of your senses, numbing them to fine paste of pleasure. Her jizz-soaked ears tug at your [pc.cockBiggest] with each thrash of her head, ensuring your colossal cock never exits a state of constant caress. What’s more, each time the feral hurricane is pulled back to her post, her mouth ravages your sensitive cockhead. Greedy licks, kisses and sucks have laid your twitching flesh bare. ");
	if(shekka.hasCock()) output("Lower down, the artificial hermaphrodite’s rod smears its wet-hot love over your [pc.sheathBiggest]. ");
	output("The clutching cacophony of sex paired with ongoing fragrant bursts brushing against your delicate senses paralyzes you.");
	output("\n\nYour second climax certainly feels more powerful than the first. Encased away in the protective suit, you have no idea just how much each of your planet-trembling spasms is shooting out. But Shekka knows. Your liquid convulsions are the final piece to her passionate puzzle. Long, muffled moans eek out of the oppressive outfit. A new, almost searing hot liquid blasting along your thighs completes the symphony. The raskvel has reached balmy nirvana");
	if(shekka.hasCock()) output(", complete with an oozy, creamy release of semi-equine bliss.");
	output("\n\nHer wailing tremors go on for some time beyond your powerful encore performance. It’s to be expected; the contumacious rabbit-lizard has spent most of her time teetering on the edge of euphoria. Each of her thrusts drop in intensity, the raskvel’s buzzing tail barely able to muster the strength to prod at her quivering cunt. The vice grip around your penis weakens. Soon, her entire body is limp against your twitching, spent soul. Just two pounding heartbeats are all that remain, laced with faint hums of satisfaction.");
	output("\n\nThe afterglow is radiant. The warm soup of sexual fluids encased within the light yellow suit washes gently against your tender flesh. It’s hard to imagine a damp heat feeling all the more sweet. Shekka’s labored breathing hits your ears. The raskvel is overdosing on the aroma, you reckon. Freeing her would probably be the best next step, but your muscles don’t seem to willing to cooperate. So the two of you baste just a little longer.");
	pc.orgasm();
	chars["SHEKKA"].orgasm();
	processTime(10);
	clearMenu();
	addButton(0,"Next",pageThreeOfShekkaStuffs);
}

public function pageThreeOfShekkaStuffs():void
{
	clearOutput();
	userInterface.showBust("SHEKKA_NUDE");
	userInterface.showName("\nSHEKKA");
	author("Kirbu");
	output("An untold amount of time later, Shekka squirms to life, slowly reaching towards the inward slider of your zipper. The undoing is much less enthusiastic than the opposite action had been. A visible haze flees from the scene, the potent, heady love kissing you on the nose. There’s a bit of worry deep in your chest that this musk will drive you right back to a third round! The relatively cool air dancing across your tender flesh calms your nerves, however. Though your soul may be willing, your body could use a little time off.");
	output("\n\nShekka leans back off your body with a satisfied groan. The light glistens off her moist scales. Strands of sexual fluids hopelessly cling to her, more resembling a butterfly hurriedly pulling away from its cocoon than anything. Her celebration is short lived; your [pc.cockBiggest] smacks her in the face as she pulls back. She honestly managed to forget that her ears are still tangled around your fuck stick. The two of you share a warmhearted laugh at her goof. You both are still riding down from your sexual scent-fueled high. Shekka pokes her head up past your limp club, gleefully staring at you with her widened eyes.");
	//first time:
	if(flags["TIMES_SHEKKA_KIRBUED"] == undefined)
	{
		flags["TIMES_SHEKKA_KIRBUED"] = 0;
		output("\n\n<i>“Wow,”</i> she sighs, <i>“I think I may have a new interest...”</i> The astounded alien tucks her knees in ");
		if(pc.balls > 0) output("under your [pc.balls]");
		else output("against your taint");
		output(" and starts to unravel herself from around your dick.");
		output("\n\n<i>“I figured this hot hunk of sausage would feel mighty well rubbing against these sensitive things,”</i> Shekka admits, proudly patting your delicate cock. Her ears resemble plump cumrags.");
		output("\n\n<i>“What I didn’t figure was getting whalloped by smell of all things.”</i> She pauses for a second to shake her head in disbelief, <i>“Smashed up against you. Ears soakin’ up all the fun. A switch in my brain just flipped.”</i>");
		output("\n\nThe last of your jizz-soaked cock-covering departs, exposing your pruned skin. A moist tingle encompasses your tired tower now. Shekka continues, still admiring your worn ego.");
		output("\n\n<i>“I must sound like a little rask that dropped her first egg.”</i> She squishes an ear to her face, taking in a long drag that interrupts with a self-conscious laugh, <i>“I can’t tell you the last time I felt like this. ...Like a little rask.”</i>");
		output("\n\nThe little rask notices you gazing intently into her eyes. Her face contorts for a second before she catches on.");
		output("\n\n<i>“My eyes are dilated, aren’t they?”</i> You nod, causing her to snicker and shake her head again. <i>“That’s how you know this is genuine. Shit, I must have looked like a burnt out gush-addict to you.”</i>");
	}
	else output("\n\n<i>“Still just as amazing,”</i> she chuckles. By the way she’s blinking her eyes, you figure she knows they’re dilated again.");
	//Merge:
	output("\n\nShekka runs her hands deep down into the suit, dragging through the remaining rivers of fun collected within. <i>“I’m betting this’ll be a bitch to clean up. They make these things to hold shit out, not in.”</i>");
	output("\n\nSpeaking of which, being out of that suit is definitely high on your wish list. You’re careful not to go spilling any of the funky fun as you slide your wet, naked body out of the thing. Shekka isn’t as careful, wadding the mess up as best she can and hauling it over to a little pile of various other garments to be dealt with. She merely shrugs uncaringly when you point out the mess. ");
	if(shekkaIsCrew()) output("The whole ship");
	else output("Her whole warehouse");
	output(" is rich with the perfume of your ");
	if(hours > 22 || hours < 4) output("late night");
	else if(hours < 10) output("morning");
	else if(hours <= 12) output("late morning");
	else if(hours < 4) output("afternoon");
	else if(hours <= 6) output("late afternoon");
	else if(hours <= 9) output("evening");
	else output("night");
	output(". Some spillage must not present that much of an issue.");
	output("\n\nIt doesn’t take long for you to dry off");
	if(!pc.isNude()) output(" and get redressed");
	output(". As much as you’d love to soak in the festivities like your raskvel friend, you imagine it best to at least try and get presentable before taking on Tarkus again.");
	output("\n\nShekka’s much less concerned. She slipped on her jumpsuit with nary a care. And by the way her dripped ears are draped around her like a couple of scarfs, you figure she wants to bask in the glory for whatever time she has left.");
	if(shekka.hasCock()) output(" Her cock bulges the front obscenely.");
	fuckedShekka();
	pc.applyCumSoaked();
	flags["TIMES_SHEKKA_KIRBUED"]++;
	processTime(55+rand(100));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//MilkQ over 1000
public function shekkaMilkDranking(inBed:Boolean = false):void
{
	clearOutput();
	//By Tanini
	author("Tanini");
	userInterface.showBust("SHEKKA_NUDE");
	userInterface.showName("\nSHEKKA");

	output("As you observe the shapely Raskvel female in front of you, you can’t help but notice her plump, uncared-for lips. While the rest of her face is nice enough, you can’t help but focus on those inviting lips. Oh how you’d love to stuff something between them.");
	output("\n\n<i>“You’re lookin’ pretty full there, tits,”</i> the smirking raskvel woman observes, raising her hand and cupping her own meager breasts through the front of her skin tight work suit. The mention of your tits brings your attention back to them and how heavy and full they are. Your eyes begin to wander back toward her lips but are instead treated to the beginnings of a strip-tease. The little slut is sensuously peeling away her tight suit to egg you on. The skintight material drags over her obvious nipples as it slowly reveals her pale red scales and perky b-cups.");
	output("\n\n");
	if(!pc.isChestExposed()) output("Not to be left behind you reach up and remove your own [pc.chestCovers], revealing your own chest and stepping forward.");
	else output("Not to be outdone, you arch your back to emphasize your own chest, stepping forward to fill her view with your fluid-heavy mammaries.");
	output(" In an instant, the lively mechanic is on you, her arms wrapped around your waist as her momentum topples your unprepared form onto your [pc.butt]. In your new position on the floor, you can feel her face pressed between your [pc.fullChest]. The sensation of aching fullness in your exposed, swollen teats is too much for you to bear, and you reach down, taking hold of her head in your hands, pressing her face to your bosom. Her feathery red hair tickles your hands.");
	output("\n\nWith her big, red, reptilian eyes so close, she can’t help but see the budding beads of [pc.milk] on your [pc.nipples]. You moan as you feel her hot breath on them, your arousal rising even more as she pushes down on your [pc.chest] to pull her face away, squishing your heavy chest against you in the process. The resultant streams of [pc.milk] are enough to pull a laugh from the mechanic as you soak her palms in cream. <i>“");
	if(!shekkaIsCrew()) output("One of those milky rushers, are you?”</i> she asks with a hearty laugh, watching you moan beneath her. <i>“I’ll have to have some extra fun with you for making a lake in my workshop - after I milk you dry that is.”</i>");
	else output("How great that my captain is a milky rusher!”</i> she cheers with a hearty laugh, watching you moan beneath her. <i>“I’ll have to have some extra fun with you for making a lake in " + (!inBed ? "my engine room" : "your bedroom") + " - after I milk you dry that is.”</i>");
	pc.lust(10);
	processTime(5);
	clearMenu();
	addButton(0,"Next",shekkaMilkDrankingPartII, inBed);
}


public function shekkaMilkDrankingPartII(inBed:Boolean = false):void
{
	clearOutput();
	//By Tanini
	author("Tanini");
	userInterface.showBust("SHEKKA_NUDE");
	userInterface.showName("\nSHEKKA");
	
	var x:int = -1;
	var cumQ:Number = 0;

	output("You can’t think of a better plan at the moment, and you pull Shekka into a forceful kiss, your [pc.lips] mashed roughly against hers. You let out a slutty moan into the kiss as she pinches your streaming nipples, the added stimulation sparking surges of pleasure all down your spine. ");

	//No new PG
	//IF GIRL
	//[If(hasVagina=true & hasPenis = false)
	if(pc.hasVagina() && !pc.hasCock()) 
	{
		output("[pc.EachVagina] is soaked from all the arousal, and as ");
		if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("the raskvel breaks the kiss and looks into your [pc.eyes], you note that hers have dilated to the size of dinner plates. She drools a little as her hips desperately roll against your own, grinding her needy pussy against your hungry body. Streams of silky, alien lubricant drizzle everything below your waist.");
		else
		{
			output("she breaks the kiss and looks into your [pc.eyes] you find yourself desperately rolling your [pc.hips] and grinding your needy body up into her pussy");
			if(pc.hasTail()) output(", your [pc.tails] pressed under your [pc.butt] to the");
			if(!shekkaIsCrew()) output(" hard workshop");
			else output(" " + (!inBed ? "hard engine room" : "bedroom"));
			output(" floor, wiggling uselessly");
			output(".");
		}

		output("\n\nSliding her wide hips backwards on your stomach, her dual clits dragging over your sensitive [pc.skinFurScales], she positions herself and then leans down, finally giving you what you so eagerly desire. Smiling, she wraps those plump lips of hers around your [pc.nipple], her weight and the fluid weight in your chest enough to hold you pinned and writhing to the floor. Your [pc.chest] floods her mouth with [pc.milk] as she sucks it down, the flow so intense that her cheeks bulge, streams spilling from the corners from her mouth, and she has to pull back a few seconds later. As she gulps down the huge mouthful of lactic nourishment, the heavy streams of your [pc.milk] only intensify.");
		output("\n\nYou find yourself screaming under her squeezing and massaging palms as the stimulation of your [pc.chest] continues to set your body off. You barely notice when you hear a faint hum coming from down below. Your soaked, neglected pussy squirts [pc.girlCum] as Shekka’s tail glides over it and moves to her own quim, adding her moans to a growing chorus of screams. Somehow the little tip is vibrating like a high-" + (isAprilFools() ? "dogecoin" : "credit") + " sex toy.");
		if(flags["TIMES_TAILVIBED_WITH_SHEKKA"] == undefined) output(" You don’t have time to think about how her tail could be doing that on its own as you feel her lips wrap around your over-sensitive nipple again.");
		else output(" You don’t have time to remember the vibrating implant she has in her tail; her lips are wrapping around your over-sensitive nipple once more, rendering thought impossible.");

		output("\n\nYour [pc.hips] slap against her and her vibrating tail as she milks you more, the satisfaction of releasing the pressure in your [pc.chest] making getting you off harder than you could have fathomed a scant few moments before. Lucky for you, Shekka doesn’t stop, draining your [pc.chest] and alternating between each gushing nipple until her little belly bulges out slightly and her stomach is full. Yet even though your breasts have calmed down from their heavy, streaming flow, you’re still not empty.");
		output("\n\nLeaning back and grinding her wet pussy and vibrating tail on you, Shekka smiles and slaps your [pc.chest], giggling to herself as you moan. <i>“Oh don’t quit on me yet, hot stuff. I’m gonna milk these puppies dry. You just give me a second to find a little toy of mine and I’ll take good care of your sexy jugs,”</i> she says with a naughty smirk on her reptilian features. Standing up and moving her feathers out of her eyes, she turns and scurries off into her shop.");
		output("\n\nIn her absence, your fingers slip down to your [pc.vagina], rubbing your neglected honeypot as you wait, drenching your sexy palms. But she’s not gone for long, returning with an odd pair of gloves on her hands. You notice she’s inches deep on her tail vibrator and leaking like a faucet, though you shouldn’t be talking when you’re nearly swimming in your own [pc.milk]. You don’t notice her straddling you again, so busy are you with all your thinking.");
		output("\n\nYou do notice when you feel her hands on your [pc.chest], squeezing your [pc.nipples] and pulling, but something’s different. Something is making your entire chest tingle, and looking down at her strange gloves, you get an idea of just what it is. Shekka smiles as she lets the shock gloves pulse a surge into your sensitive nipples causing your already painful arousal to intensify, even as you buck your hips and drench your thighs with [pc.girlCumNoun], silent screams gripping you as you thrash like a bronco, making the smaller woman bounce her big, egg-bearing hips on you.");
	}
	//Herm
	//[if(hasVagina=true & hasPenis=true)
	else if(pc.hasVagina() && pc.hasCock())
	{
		x = rand(pc.cocks.length);
		
		output("Your [pc.vaginas] ");
		if(pc.vaginaTotal() == 1) output("is");
		else output("are");
		output(" soaked from all the arousal, and your [pc.cocks] ");
		if(pc.vaginaTotal() == 1) output("is");
		else output("are");
		output(" throbbing ridiculously hard. As ");
		if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("the raskvel breaks the kiss and looks into your [pc.eyes], you note that hers have dilated to the size of dinner plates. She drools a little as her hips desperately roll against your own, grinding her needy pussy against your hungry body. Streams of silky, alien lubricant drizzle everything below your waist.");
		else 
		{
			output("she breaks the kiss and looks into your [pc.eyes], you find yourself desperately rolling your [pc.hips] and grinding your needy body up into her pussy");
			//if(hasTail=true)
			if(pc.hasTail()) output(", your [pc.tails] pressed under your [pc.butt] to the");
			if(!shekkaIsCrew()) output(" hard workshop");
			else output(" " + (!inBed ? "hard engine room" : "bedroom"));
			output(" floor, wiggling uselessly");
			output(".");
		}

		output("\n\nSliding her broad, raskvel hips backwards on your stomach, her dual clits dragging over your sensitive [pc.skin], she positions herself and then leans down, finally giving you what you so eagerly desired. Smiling, she finally wraps those plump lips of hers around your [pc.nipple], her weight and the fluid weight in your chest enough to hold you pinned to the floor. Raising her wide, egg bearing hips, she manages to sink her hot sex on your [pc.cock " + x + "], moaning into your [pc.chest] as she does so. Your [pc.fullChest] floods her mouth with [pc.milk] as she sucks it down, the flow so intense that her cheeks bulge, milk spilling from the corners from her mouth, and she has to pull back a few seconds later. With her body upright and no longer stimulating your [pc.chest], your base instincts kick in and you pound your [pc.cock " + x + "] up into her hot, double clitted twat. As she gulps down the huge mouthful of lactic nourishment, the heavy streams of your [pc.milk] only intensify. Not even all the bouncing will slow them.");
		output("\n\nYou find yourself screaming under her squeezing and massaging palms as the stimulation of your [pc.fullChest] continues to set your body off. You barely notice as you hear a faint hum coming from lower down. Your soaked, neglected [pc.vaginas] squirt");
		if(pc.totalVaginas() == 1) output("s");
		output(" your lubricant as Shekka’s tail glides over ");
		if(pc.totalVaginas() == 1) output("it");
		else output("them");
		output(" and moves to her own quim, adding her moans to your chorus of screams. You can’t help but notice as her tail joins in on the fun, slipping into her stretched pussy along with your [pc.cock " + x + "] and beginning to vibrate, getting you off almost instantly inside of her, ");
		
		cumQ = pc.cumQ();
		if(cumQ < 25) output("filling her with your respectable load.");
		else if(cumQ < 500) output("giving her egg bearing womb a nice cum bath.");
		else if(cumQ < 2500) output("drenching her pussy and you cock with your prodigious load. The sheer volume bulges her litte tummy against you.");
		else 
		{
			output("blasting her womb with your ridiculous load of spunk. The sheer volume bulges her and drenches your ");
			if(pc.balls > 0) output("[pc.balls]");
			else output("crotch");
			output(" and the fluid covered floor below you with [pc.cum]");
		}
		output(". You don’t have time to think about how her tail could be doing that on its own, as you feel her lips wrap around your over-sensitized [pc.nipple] again.");

		output("\n\nYour [pc.hips] slap up into her and her vibrating tail as she milks you more, the satisfaction of releasing the pressure in your [pc.chest] making getting you off harder than you could have fathomed before. Lucky for you, Shekka doesn’t stop, draining your [pc.chest] and alternating between each breast until her little belly bulges out slightly, and her stomach is full. Yet even though your breasts have calmed down from their heavy, streaming flow, you’re still not empty.");
		output("\n\nLeaning back and grinding her wet pussy and vibrating tail on you and your still pulsating [pc.cock " + x + "], Shekka smiles and slaps your [pc.chest], giggling to herself as you moan. <i>“Oh don’t quit on me yet, hot stuff. I’m gonna milk these puppies dry. You just give me a second to find a little toy of mine, and I’ll take good care of your sexy jugs,”</i> she says with a naughty smirk on her pale red, reptilian features. Standing up and moving her feathers out of her eyes, she turns and scurries off into her shop.");
		output("\n\nIn her absence, your fingers slip down to your [pc.vagina], rubbing as you wait and drenching your palms. Your other hand slips down to your [pc.cocks], fingers wrapping around ");
		if(pc.cockTotal() == 1) output("your");
		else output("one");
		output(" turgid shaft and gliding over its overstimulated length. Yet, she’s not gone for long, returning with an odd pair of gloves on her hands. You notice she’s inches deep on her tail vibrator and leaking like a faucet, though you shouldn’t be talking when you’re nearly swimming in your own [pc.milk]. With all the thinking you’ve managed, you don’t notice her straddling you again.");
		output("\n\nYou do notice when you feel her hands on your [pc.fullChest], squeezing your [pc.nipples] and pulling, but something’s different. Something is making your entire chest tingle, and looking down at her strange gloves, you get an idea of just what it is. Shekka smiles as she lets the shock gloves pulse a surge into your sensitive [pc.nipples] causing your already painful arousal to intensify even as you buck your hips and drench your thighs with femcum, silent screams gripping you as you thrash like a bronco, making the smaller woman bounce her big, egg-bearing, Raskvel hips on you.");
	}
	//Male
	//[if(hasVagina!=true & hasPenis=true)]
	else
	{
		x = rand(pc.cocks.length);
		
		output("[pc.EachCock] is throbbing ridiculously hard, and as ");
		if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("the raskvel breaks the kiss and looks into your [pc.eyes], you note that hers have dilated to the size of dinner plates. She drools a little as her hips desperately roll against your own, grinding her needy pussy against your hungry body. Streams of silky, alien lubricant drizzle everything below your waist.");
		else
		{
			output("she breaks the kiss and looks into your [pc.eyes], you find yourself desperately rolling your [pc.hips] and grinding your needy body up into her pussy, ");
			if(pc.hasTail()) output("your [pc.tail] pressed under your [pc.butt] to the");
			if(!shekkaIsCrew()) output(" hard workshop");
			else output(" " + (!inBed ? "hard engine room" : "bedroom"));
			output(" floor, wiggling uselessly");
			output(". You can’t help but run your [pc.cocks] over her clits, getting her nice and wet while you drench ");
			if(pc.cockTotal() > 1) output("a");
			else output("your");
			output(" needy length in her nectar.");
		}

		output("\n\nSliding her wide, egg bearing Raskvel hips backwards on your stomach, her dual clits dragging over your sensitive [pc.skinFurScales], she positions herself and then leans down, finally giving you what you so eagerly desires. She finally wraps those plump lips of hers around your [pc.nipple] with a smile, her weight and the fluid weight in your chest enough to hold you pinned there on the floor. Raising her wide, egg bearing hips, she manages to sink her hot sex on your [pc.cock " + x + "], moaning into your [pc.chest] as she does so. Your [pc.chest] floods her mouth with [pc.milk] as she sucks it down, the flow so intense that her cheeks bulge, milk spilling from the corners from her mouth, and she has to pull back a few seconds later. With her body upright and no longer stimulating your [pc.chest], your base instincts kick in, and you pound your [pc.cocks] up into her hot, double clitted twat. As she gulps down the huge mouthful of lactic nourishment, the heavy streams of your [pc.milk] only intensify.");
		output("\n\nYou find yourself screaming under her squeezing and massaging palms as the stimulation of your [pc.chest] continues to set your body off. You barely notice when you hear a faint hum coming from lower down. You can’t help but notice as her tail joins in on the fun, slipping into her stretched pussy along with your [pc.cock " + x + "] and beginning to vibrate, getting you off almost instantly inside of her ");
		
		cumQ = pc.cumQ();
		if(cumQ < 25) output("filling her with your respectable load.");
		else if(cumQ < 500) output("giving her egg bearing womb a nice cum bath.");
		else if(cumQ < 2500) output("drenching her pussy and your cock with your prodigious load. The sheer volume bulges her litte tummy against you.");
		else
		{
			output("blasting her womb with your ridiculous load of spunk. The sheer volume bulges her and drenches your ");
			if(pc.balls > 0) output("[pc.balls]");
			else output("crotch");
			output(" and the fluid covered floor below you with [pc.cum]");
		}
		output(". You don’t have time to think about how her tail could be doing that on its own, just the feel of her lips wrapping around your over-sensitized [pc.nipple] again.");
		output("\n\nYour [pc.hips] slap up into her and her vibrating tail as she milks you more, the satisfaction of releasing the pressure in your [pc.chest] making getting you off harder than you could have fathomed before. Lucky for you, Shekka doesn’t stop, draining your [pc.chest] and alternating between each breast until her little belly bulges out slightly, and her stomach is full. Yet, even though your breasts have calmed down from their heavy, streaming flow, you’re still not empty.");
		output("\n\nLeaning back and grinding her wet pussy and vibrating tail on you and your still pulsating [pc.cock " + x + "], Shekka smiles and slaps your [pc.chest], giggling to herself as you moan. <i>“Oh don’t quit on me yet, hot stuff. I’m gonna milk these puppies dry. You just give me a second to find a little toy of mine and I’ll take good care of your sexy jugs,”</i> she says with a naughty smirk on her pale red, reptilian features. Standing up and moving her feathers out of her eyes, she turns and scurries off into her shop.");
		output("\n\nIn her absence, your hand slips down to your [pc.cocks], fingers wrapping around your turgid shaft and gliding over its overstimulated length. Yet she’s not gone for long, returning with an odd pair of gloves on her hands. You notice she’s inches deep on her tail vibrator and leaking like a faucet, though you shouldn’t be talking when you’re nearly swimming in your own [pc.milk]. With all the thinking you’ve managed, you don’t notice her straddling you again.");
		output("\n\nYou do notice when you feel her hands on your [pc.chest], squeezing your [pc.nipples] and pulling, but something’s different. Something is making your entire chest tingle, and looking down at her strange gloves, you get an idea of just what it is. Shekka smiles as she lets the shock gloves pulse a surge into your sensitive [pc.nipples] causing your already painful arousal to intensify, even as you buck your hips and drench your thighs, her pussy, and her deliciously vibrating tail with [pc.cum], silent screams gripping you as you thrash like a bronco, making the smaller woman bounce her big, fertile, Raskvel hips on you.");
	}
	output("\n\nThe sexy, red, Raskvel rides you for half an hour, happily getting the pair of you off with her hot pussy and those amazing gloves, completely draining your chest. You two have so much fun she forgets to punish you before she turns her head to see the clock. <i>“Fuck! Got carried away,”</i> she says, moving off of you in a rush and pulling on her almost shrink-wrapped suit after falling over on dismount.");
	if(!inBed) output(" <i>“Look, [pc.name], I had a ton of fun, but I really have to get back to work. I’m a busy girl, you know. You get on out of here and I’ll clean this up. We’ll worry about punishing you later.”</i>");
	output("\n\nShe leaves you with that last comment, flashing a smile and slapping your [pc.butt]");
	if(!inBed) output(" before rushing off to presumably pick up some cleaning supplies");
	output(". You pull on your [pc.gear]");
	if(!inBed) output(" and head out");
	output(", feeling sated and much less chest heavy.");
	processTime(31+rand(10));
	pc.orgasm();
	pc.milked(pc.milkFullness);
	fuckedShekka();
	chars["SHEKKA"].orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Shekka's fuckfest: you think this is a game!?
//opening
//choose [robots] from sex menu
public function chooseShekkasSexBats():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA");
	showName("\nSHEKKA");
	//First time
	if(flags["SEEN_SHEKKAS_SEXBOTS"] == undefined)
	{
		flags["SEEN_SHEKKAS_SEXBOTS"] = 1;
		output("<i>“What are those?”</i> you ask, pointing to a pair of robotic bodies sitting in one of the corners. Shekka takes one look at them and rolls her eyes.");
		output("\n\nShe walks over to the twin machines, pausing to wait for you to follow. When you get there, she pulls off a tarp that had been keeping the dust off their lower halves. The two robots appear to be well built, albeit with a relatively simple looking design and humanoid bodies. In place of hands, they have soft-looking suction cups. Between each of the robots legs is a cock-like appendage coated in bristly-looking hairs.");
		output("\n\n<i>“These things?”</i> Shekka snorts in derision. <i>“They’re a gift from the other raskvel, if you can call it that.”</i> There’s no hiding the look of derision on her face.");
		output("\n\n<i>“You don’t sound real happy about it,”</i> you observe.");
		output("\n\nThe wide-hipped mechanic puts her hands on her considerable hips and cocks her head at you. <i>“Why should I be?”</i> She pantomimes exaggeratedly, impersonating other raskvel. <i>“Oh, lets get Shekka some sexbots! She can’t have real eggs, so why not keep her busy with cheap androids!”</i>");
		output("\n\nDid they really say that?");
		output("\n\nDropping her arms, the little thing pouts. <i>“No... but they were thinking it. Normally they use these things as a kind of recreational method of dispute settlement. Two girls want to settle an argument over some sweet loot or a boy without coming to blows? Rig up two of these, and whoever cums first loses. Ostensibly, they gave them to me as a thank you for all the great work I’ve done here in Novahome, but they just don’t want me soaking up THEIR sperm.”</i> She scoffs. <i>“Little nymphomaniac sluts.”</i>");
		output("\n\nYou chuckle.");
		output("\n\nHesitantly, a smile tugs at the corner of her mouth. <i>“Did you want to try them?");
		if(!pc.hasVagina()) output(" I know you don’t have a proper pussy or anything, but they’ll work on an ass if you want.");
		output("”</i> Her skin darkens in a blush. <i>“I mean, if I’m going to use them, it might as well be with an interested off-worlder. What better way to thumb my nose at those skanks than to get my rocks off with you instead of alone? That’ll really make their carburetors sputter.”</i> She wiggles her hips. <i>“So what do you say? Up for an old-fashioned, robotic fuck contest?”</i>");
		processTime(2);
		clearMenu();
		addButton(0,"Yes",youBetIllSexbotWithYouShekka);
		addButton(1,"No",nahNoSexbotsForMeShekka);
	}
	//repeat
	else
	{
		output("You ask Shekka if she’d be up for another game with the robots. She smiles, her tail beginning to wag faster than normal. She rushes over to the game floor, ears chiming musically as she throws you your controller and gets ready for the game. The two of you undress and kneel before your respective robots, hands on the “GO/FORFEIT” buttons and ready to start.");
		processTime(1);
		clearMenu();
		addButton(0,"Next",pressGoForFirstGenShekkaSaxbots,undefined,"Go","Start using Shekka’s sexbots with her. It’s a battle to the orgasm!");
	}

}
//Nah
public function nahNoSexbotsForMeShekka():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA");
	showName("\nSHEKKA");
	output("You somehow manage to resist her temptations, telling her that maybe you’ll try out the machines some other time. Shekka pouts for a moment, but brings you back to the main part of the store.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//You bet
public function youBetIllSexbotWithYouShekka():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	output("<i>“You’ve got yourself a game!”</i> you reply with a nod.");
	output("\n\n<i>“Awesome! I’ll get the controllers. I’m sure I left them somewhere near here,”</i> she says, turning and rummaging through a box of machine parts. Her tail wags excitedly, and her ear piercings chime constantly as she shifts through the container. Despite her previous indifference, she seems very excited to try out the robots with you.");
	output("\n\n<i>“Here they are!”</i> she says, pulling two wide remotes with what looks like eleven buttons each. You note that there are two rows of five smaller, multicolored buttons with one larger white button at the top. She tosses one to you and you catch it, looking it over. It’s not too heavy and looks simple enough to use, though you suppose it would have to be considering the circumstances of its use. Shekka gets down in front of the first robot, grinning at you as she pulls her jumpsuit down over her hips, pointing her butt toward the fuzzy-looking cock.");
	output("\n\nYou reach out and brush the bristly-looking fuzz, only to find it pliant and soft to the touch. You kneel and ");
	if(!pc.isNude()) output("pull away your [pc.gear] until there’s enough space for the robot and breathing room for you.");
	else output("position your [pc.butt] in the robot’s path, steeling yourself for what’s to come in this “game.”");
	output(" Shekka places her finger above the large white button, and you follow her lead, noticing some faded text beneath it labels it as the “GO/FORFEIT” button. This should be fun.");
	clearMenu();
	addButton(0,"Next",pressGoForFirstGenShekkaSaxbots,undefined,"Go","Start using Shekka’s sexbots with her. It’s a battle to the orgasm!");
}
/*		
		Game mechanics

		10 button choices, you choose 4 options and then the game ends. Whoever has the most lust buildup at the end loses. In case of a tie the pc wins if their combat lust was lower than 50 and loses if its above at the start.

		Vibrate: causes 10 lust points, shekka chooses smooth
		smooth: causes 5 lust points, shekka chooses hard
		warm: causes 10 lust points, shekka chooses spin
		tickle: causes 15 lust points, shekka chooses chill
		chill: causes 5 lust points, shekka chooses warm
		wet: causes 5 lust points, shekka chooses tickle
		stimulate: causes 10 lust points, shekka chooses sticky
		Spin/drill: causes 5 lust points, shekka chooses stimulate
		hard: causes 10 lust points, shekka chooses wet
		sticky: causes 5 lust points, shekka chooses vibrate
		Forfeit: automatic loss whenever pressed.*/

public function sexBotMenu1(arg:int = 0):void
{
	clearMenu();
	if(arg == 0) addDisabledButton(0,"Vibrate");
	else addButton(0,"Vibrate",vibrateFirstGenSaxbots,undefined,"Vibrate","Activate the vibrate function on Shekka’s ‘bot.");
	if(arg == 1) addDisabledButton(1,"Smooth");
	else addButton(1,"Smooth",smoothSexbotFirstGen,undefined,"Smooth","Activate the smooth function on Shekka’s ‘bot.");
	if(arg == 2) addDisabledButton(2,"Warm");
	else addButton(2,"Warm",warmSexbotFirstGen,undefined,"Warm","Activate the warming function on Shekka’s ‘bot.");
	if(arg == 3) addDisabledButton(3,"Tickle");
	else addButton(3,"Tickle",sexbotTickleFirstGen,undefined,"Tickle","Activate the tickle function on Shekka’s ‘bot.");
	if(arg == 4) addDisabledButton(4,"Chill");
	else addButton(4,"Chill",chillOutShekkaFirstGen,undefined,"Chill","Activate the chill function on Shekka’s ‘bot.");
	if(arg == 5) addDisabledButton(5,"Wet");
	else addButton(5,"Wet",wetShekkaFirstGen,undefined,"Wet","Activate the wet function on Shekka’s ‘bot.");
	if(arg == 6) addDisabledButton(6,"Stimulate");
	else addButton(6,"Stimulate",stimulateShekkaWithFirstGenSaxbot,undefined,"Stimulate","Activate the electro-shock function on Shekka’s ‘bot.");
	if(arg == 7) addDisabledButton(7,"Spin");
	else addButton(7,"Spin",drillShekkaWithFirstGenSaxbot,undefined,"Spin","Activate the spin function on Shekka’s ‘bot.");
	if(arg == 8) addDisabledButton(8,"Hard");
	else addButton(8,"Hard",hardSexbotOnShekkaFirstGen,undefined,"Hard","Activate the firmness function on Shekka’s ‘bot.");
	if(arg == 9) addDisabledButton(9,"Sticky");
	else addButton(9,"Sticky",stickyUpShekkaFirstGen,undefined,"Sticky","Activate the sticky function on Shekka’s ‘bot.");
	
	addButton(14,"Forfeit",pcLosesToShekkasSaxbots,undefined,"Forfeit","Give up and cum right now.");
	if(chars["SHEKKA"].lust() >= chars["SHEKKA"].lustMax())
	{
		clearMenu();
		addButton(0,"Next",pcBeatsShekkaAtSexbots);
	}
	else if(pc.lust() >= pc.lustMax())
	{
		clearMenu();
		addButton(0,"Next",pcLosesToShekkasSaxbots);
	}
}

public function sexbotRound(arg:int = 0):Number
{
	if(!pc.hasStatusEffect("Shekka_Sexbot_Round")) pc.createStatusEffect("Shekka_Sexbot_Round",0,0,0,0,true,"","",false,0);
	else if(arg != 0) pc.addStatusValue("Shekka_Sexbot_Round",1,arg);
	return pc.statusEffectv1("Shekka_Sexbot_Round");
}

//Press go
public function pressGoForFirstGenShekkaSaxbots():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	output("<i>“You ready over there?”</i> you ask, looking over to Shekka to make sure she’s all set. She nods, her finger positioned over the go button. You smile, returning your attention to your own remote. <i>“Three. Two. One. Go!”</i>");
	output("\n\nOn go, the both of you press your start buttons. You feel the robot’s suction cups attach snugly to your hips, shivering as it lines its mechanical cock up with your [pc.vagOrAss]. A stream of liquid washes over your backside. You assume it’s some kind of lube designed to compensate for potential unlubricated clients, ");
	if(pc.wetness() < 2 || (!pc.hasVagina() && pc.ass.wetness() <= 2)) output("and you’re thankful for the feature.");
	else output("not that you need it.");

	output("\n\nThe robot penetrates you, beginning to hump rhythmically into your depths. You slowly let yourself acclimate to the thrusting. As it currently is, the robot seems to be sexing you in the least arousing way possible, assumedly so the game doesn’t end too quickly. You glance at Shekka and see her appraising her choice of buttons. If you want the first move you’d better decide quickly.");
	if(pc.hasVagina()) pc.cuntChange(0,20,true,true,false);
	pc.buttChange(20,true,true,false);
	sexBotMenu1(-1);
}

//Vibrate: 
public function vibrateFirstGenSaxbots():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	if(sexbotRound() <= 0) output("First,");
	else if(rand(2) == 0) output("Next,");
	else output("Then,");
	output(" you click the bright red button labeled “Vibrate.” You glance at Shekka to gauge her reaction. The red shortstack is gasping with pleasure, and you see her sexy hips begin to tremble. A soft buzzing emanates from behind her whenever the robotic dick is pulled back. Judging from her expression, the vibration must be rather effective. The momentary respite of its pulling out is replaced seconds later by the eye-crossing pleasure of the vibrating rod inside her.");
	output("\n\n<i>“So. That’s. How. You. Want. To. Play,”</i> she says between thrusts, pressing a button on her controller. You brace yourself, expecting a challenging fight to keep a cap on your lust. You’re both relieved – and slightly disappointed – when no such ordeal occurs. The cock simply becomes smoother and pistons a little faster. It feels better than the ordinary dicking you’d been getting, but still leaves a lot to be desired.");
	output("\n\n<i>“Aww. That’s. No fun,”</i> Shekka whines with a frown. She can’t hold up for long though, soon returning her attention to the feeling of her cunt being vibrated. Your [pc.vagOrAss] itches with what you can only imagine is jealousy of her <i>“good fortunes.”</i> One thing you can be sure of is that you came out on top, for this choice at least.");
	processTime(1);
	chars["SHEKKA"].lust(10);
	pc.lust(5);
	sexbotRound(1);
	sexBotMenu1(0);
}

	//smooth:
public function smoothSexbotFirstGen():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	if(sexbotRound() <= 0) output("First,");
	else if(rand(2) == 0) output("Next,");
	else output("Then,");
	output(" you choose the baby blue button labeled <i>“Smooth.”</i> Shekka looks as excited as the thought of her writhing on that robot makes you feel. Sadly, her eager smile fades. The chiming of her ears is the only cheery sound coming from her as she crosses her arms and gives you an incredulous look. You can see the robotic cock slapping into her, setting her hips to jiggling, but it doesn’t seem to be having as much of an effect as you’d hoped.");
	output("\n\n<i>“Was that supposed to be effective? Here, I’ll show you a good choice,”</i> she says, and you hardly have time to brace yourself before she hits her button. The cilia-covered cock pumping into you seems to have become nearly twice as thick and solid. You gasp to try and regain your breath as the diamond-hard rod fills you again and again. Your senses return slowly but surely as you adjust.");
	output("\n\n<i>“You win. This round!”</i> you slur between the massive pole’s poundings. She grins smugly as the cocks return to their unaided forms. The reset gives you a moment of rest before the next choice is made, and you’re glad for it. Another minute of that might’ve put you in a bad spot for the competition as a whole.");
	processTime(1);
	chars["SHEKKA"].lust(5);
	pc.lust(10);
	sexbotRound(1);
	sexBotMenu1(1);
}

//warm: 
public function warmSexbotFirstGen():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	output("This time you’re too slow to get the first move. As you decide which button to press, you hear Shekka shout triumphantly. You feel the machine’s thrusts slow as its cock begins to spin softly inside you. Either your machine is broken, or you’ve lucked out and got an easy setting. If it was moving a degree or two faster it might feel a bit better, but for now with the added slow pace it just feels nice and pleasent.");
	output("\n\n<i>“Aww, you’re supposed to be writhing in pleasure,”</i> she says with an obviously faked pout. You give her a whimsical smile and hit the button labeled <i>“Warm.”</i> The effects are immediate. The scarlet shortstack’s face flushes even redder than normal. Her fists clench as she falls to her elbows. You can see her eyes beginning to glaze over as she resists the temptation of cumming.");
	output("\n\n<i>“Ahhh. So h-hot,”</i> she says quietly, <i>“melting”</i> down to the floor and resting her face against the cool tiles. Her ears jingle softly against the metallic ground. You smile as the slowly spinning cock inside you rotates, but a part of you wants what she’s getting. After a moment, she recovers enough to be back up, searching her remote for an adequate revenge.");
	processTime(1);
	chars["SHEKKA"].lust(10);
	pc.lust(5);
	sexbotRound(1);
	sexBotMenu1(2);
}

//tickle
public function sexbotTickleFirstGen():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	if(sexbotRound() <= 0) output("First,");
	else if(rand(2) == 0) output("Next,");
	else output("Then,");
	output(" you decide to hit the heavily faded pink button labeled <i>“Tickle.”</i> The effects are immediately noticeable. Shekka shouts with pleasure, and for a second you think you might have won. She manages to calm down a little though, but with every thrust her breath gets a little heavier. You notice that every time the robotic cock enters her, the cilia play with both of her clits, brushing and rubbing them until she’s about ready to cry out.");
	output("\n\nDespite her predicament she manages to hit a button on her remote. You gasp as the mechanical rod inside your [pc.vagOrAss] cools considerably. It’s not an unpleasant level of cold, but it manages to cool you off nicely. You feel alert and ready for what you’ll have to endure next, which you’re sure isn’t the reaction she was hoping for.");
	output("\n\nShekka looks like she’s about to speak, but is forced to bite it back as the thrusting pole’s feelers tickle at her pair of clits. You grin, appraising your options for the next choice and waiting for the pleasant chill to wear off. Shekka barely manages to stay on her game, looking incredibly relieved when the machines revert to their normal setting.");
	processTime(1);
	chars["SHEKKA"].lust(15);
	pc.lust(5);
	sexbotRound(1);
	sexBotMenu1(3);
}

//chill: 
public function chillOutShekkaFirstGen():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	if(sexbotRound() <= 0) output("First,");
	else if(rand(2) == 0) output("Next,");
	else output("Then,");
	output(" you choose to press the icy blue button labeled <i>“Chill.”</i> Shekka lets out a satisfied breath and snuggles back into the cock. That’s not quite the reaction you were hoping for. She lets her head rest on her hands, smiling thoughtfully at you from her spot. You’re sure she’s thinking about her victory, and that thought steels you for what’s to come.");
	output("\n\nAt least until she presses her button. As soon as she lifts her finger your [pc.vagOrAss] is flooded with heat. You feel your [pc.legOrLegs] tense, leading to the eventual flush of your whole body as warmth surges through you. For a moment you feel like giving up on the spot, but recover quickly. The temperature feels good, but it’s not enough to drive you mad that easily. You smile at the peppy mechanic, giving her a determined stare.");
	output("\n\n<i>“I won’t give up that easily!”</i> you tell her with renewed resolve. She grins back, checking over her options. The chilly dicking seems to be giving her more time to think. Perhaps if you play the game again it might not be the best choice to use against her. You return your attention to your remote, hoping you won’t have another mistake like that.");
	processTime(1);
	chars["SHEKKA"].lust(5);
	pc.lust(10);
	sexbotRound(1);
	sexBotMenu1(4);
}
//wet: 
public function wetShekkaFirstGen():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	if(sexbotRound() <= 0) output("First,");
	else if(rand(2) == 0) output("Next,");
	else output("Then,");
	output(" you notice the wavy blue button labeled as <i>“Wet.”</i> You see Shekka coo softly as the robotic cock pistons into her a little faster, letting out splashes of juice with each slap of her child bearing hips. Her pert B-cups bounce beneath her as she’s fucked, and her long ears chink against the ground musically. Mesmerized by her eggplant-colored nipples, you lose your chance to be prepared for what’s coming.");
	output("\n\nAt first you don’t notice much of a change, but soon you’re in a fight for your dignity with the effects of her choice. With every push and pull the tiny cilia tickle at the entrance to your [pc.vagOrAss]. Everything within reachable distance of your hole is caressed and lightly prodded, causing shocks of pleasure to run through your system. A burning need arises within you, but you somehow manage to stifle it.");
	output("\n\n<i>“Keep pressing buttons like that, and I’ll have this in the bag in no time,”</i> Shekka teases with a satisfied smile. You try to think of a retort, but are too busy holding back the itch in your loins. You manage to hold out until the cock reverts to its normal form, but for your victory’s sake you hope there aren’t any more buttons like that.");
	processTime(1);
	chars["SHEKKA"].lust(5);
	pc.lust(15);
	sexbotRound(1);
	sexBotMenu1(5);
}

//stimulate: 
public function stimulateShekkaWithFirstGenSaxbot():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	if(sexbotRound() <= 0) output("First,");
	else if(rand(2) == 0) output("Next,");
	else output("Then,");
	output(" you jab the button labeled <i>“Stimulate.”</i> Shekka practically jumps off the robot cock with a pleasurable yip, and you see her give a short moan every time it hilts inside her. Her body shivers and tenses oddly as she tries to adjust to whatever kind of <i>“stimulation”</i> is happening. Judging by her reaction, you guess it’s some kind of shock treatment. She fails the first couple times trying to press her button, fingers shot off course by errant muscle twitches.");
	output("\n\nWhen she finally does, you feel the cock inside you take on a gooey feeling. When it tries to pull out, it pulls on you for a moment before sliding out. It seems to have become sticky. You can appreciate the thought on this one, but the machine doesn’t bring justice to the feeling. Maybe if an actual living thing had a dick like this it’d be worth it, but for now it just gives you a gladly accepted advantage.");
	output("\n\n<i>“You hanging in there?”</i> you tease the pint-sized mechanic. Shekka looks at you and sticks her tongue out as she jumps from the shock. You see her squeeze one of her B-cup breasts and tweak the nipple, her competitive smile temporarily turning to one of lust. If things keep going this way you might be able to win this game.");
	processTime(1);
	chars["SHEKKA"].lust(10);
	pc.lust(5);
	sexbotRound(1);
	sexBotMenu1(6);
}

//drill: 
public function drillShekkaWithFirstGenSaxbot():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	if(sexbotRound() <= 0) output("First,");
	else if(rand(2) == 0) output("Next,");
	else output("Then,");
	output(" your finger lands on a swirly green button with <i>“Drill”</i> written underneath it. Shekka yips in surprise as the cock that’s pounding into her begins to rotate slowly. She tenses for a moment, but settles down quickly. If you didn’t know better, you’d assume she was disappointed at how unarousing this setting was for her.");
	output("\n\n<i>“I was hoping it’d start spinning faster, but I guess not...”</i> she says, perusing her remaining selection of buttons. She spins her finger slowly before letting it land on one of the choices. You gasp as lust runs through your body like a shock of energy. With every tap of the robots hips against your own, your [pc.vagOrAss] quakes in electric bliss. You doubt you could get used to something like this.");
	output("\n\n<i>“Thinkin’ of giving up yet?”</i> Shekka taunts playfully, gyrating her hips around the rotating cock inside her. What you wouldn’t give to have something easy like that at the moment. You reign in the coursing lust and appraise your remaining choices. One of these buttons has got to have the rosey scaled mechanic quivering in orgasm.");
	processTime(1);
	chars["SHEKKA"].lust(5);
	pc.lust(10);
	sexbotRound(1);
	sexBotMenu1(7);
}

//hard: 
public function hardSexbotOnShekkaFirstGen():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	output("Shekka takes the advantage for this round, hitting a button and focusing on you to make sure she can see the fruits of her decision. You feel a cool rush followed by a liquid slipperiness. Juicy splashes squirt from your passage as the robotic rod releases a watery liquid. You wait to see if anything fun happens before showing a little disappointment. If you had been the one to design this game, the thing would’ve at least released some kind of aphrodisiac.");
	output("\n\nThe crimson cutie looks warily at you, tensing up to protect herself from your next choice. You wag your finger in an eeny-meeny-miny-mo motion over your selection, eventually settling on a granite-painted button labeled <i>“Hard.”</i> As the robot pulls out of Shekka’s tensed body, you see its cilia form together into a solid-looking covering. As it pistons forward, it shatters her wall of defenses, knocking the air from her lungs. She gasps and moans as the titanic rod tenderizes her pussy. ");
	output("\n\n<i>“Good! So g-good!”</i> she manages as she’s pounded again and again. If you keep this up, victory will be yours in no time. You wiggle your hips against the wet pole pistoning into you, surprised it hasn’t slipped out yet. The pint-sized repair-girl’s focus is broken, and she grips her remote tightly to stop herself from pushing it away. Looks like this round is your victory.");
	processTime(1);
	chars["SHEKKA"].lust(10);
	pc.lust(5);
	sexbotRound(1);
	sexBotMenu1(8);
}

//sticky: 
public function stickyUpShekkaFirstGen():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	if(sexbotRound() <= 0) output("First,");
	else if(rand(2) == 0) output("Next,");
	else output("Then,");
	output(" your attention lands on the button labeled <i>“Sticky.”</i> When you press it, Shekka gives an uncomfortable exclamation and looks at you. She appears to be being pulled with the robot as it humps, stuck to its dick like adhesive tape. She frowns, looking over her buttons to find payback. You lose a bit of your confidence when she seems to find what she’s looking for.");
	output("\n\n<i>“This is what you get for giving me the worst option of the bunch,”</i> she says with a mocked evil laugh. She hits a button that sends you into a world of pleasure. The robotic cock in your [pc.vagOrAss] begins vibrating rhythmically. The force is enough to set your [pc.butt] to ");
	if(pc.tone > 50) output("shuddering");
	else output("jiggling");
	output(". You coo numbly as you are ravaged by a buzzing fuckstick.");
	output("\n\nYou barely manage to pull yourself together and return your attention to the remote. You think you can hold on at least until this shivering pleasure cruise is over. The rosey scaled mechanic smiles smugly, jerking back and forth on her sticky fun trip. Hopefully your next choice is a little more effective, and you have time to choose before she’s ready.");
	processTime(1);
	chars["SHEKKA"].lust(5);
	pc.lust(10);
	sexbotRound(1);
	sexBotMenu1(9);
}

//Pc wins
public function pcBeatsShekkaAtSexbots():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	output("As you prepare the next button, you hear Shekka’s moans grow louder. A quick glance reveals that she has been reduced to hugging the remote to her chest, pressing it tightly against her pert B-cups. The act presses multiple buttons at once, and a small speaker instructs her to only press them one at a time. The words are lost on her, however, as she bucks her hips against the mechanical cock. Her well pierced ears jingle wildly as she reverse humps.");
	output("\n\n<i>“Ooooo. C-cumming!”</i> she shouts, her whole body tensing as the robot bottoms out inside her. You watch as her legs and toes splay out, the suction cups holding her butt in the air as it shudders with bliss. Her eyes roll back into her head, and her long tongue falls out of her mouth, followed by a number of moans and gasps.");
	output("\n\n<i>“I win!”</i> you exclaim before letting the ordeal get the better of you. You let out a satisfied victory moan as your [pc.vagOrAss] clamps tightly around the robotic cock");
	if(pc.hasCock()) output(", [pc.eachCock] blasting the floor with a load of [pc.cum]");
	output(". When the robots finally release the two of you, you crawl over to Shekka and give her a kiss that she returns weakly. You mention that you’ll have to try this again some time, and maybe next time she’ll win.");
	output("\n\nShe punches you in the shoulder as you get up and gather your gear. You offer to help her clean up, but she says she’ll get it herself. Playing the game with her was help enough.");
	processTime(4);
	pc.removeStatusEffect("Shekka_Sexbot_Round");
	pc.orgasm();
	chars["SHEKKA"].orgasm();
	fuckedShekka();
	clearMenu();
	StatTracking.track("contests/shekka sexoff wins");
	addButton(0,"Next",mainGameMenu);
}

//Pc loses
public function pcLosesToShekkasSaxbots():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	output("You try to concentrate on the buttons, but all you can focus on is the pounding of your [pc.vagOrAss]. You hardly have time to say anything before your muscles clench in orgasm. You moan loudly as your [pc.vagOrAss] clenches tightly around the robotic cock inside you");
	if(pc.hasCock()) output(", [pc.eachCock] blasting the floor with [pc.cumType] as it hits your prostate");
	output(". You hear it slapping against your [pc.butt] as you cum, which only furthers the effect.");
	output("\n\n<i>“Yes!”</i> you hear shekka yell, throwing her arms up in victory before doubling over in an orgasm of her own. Her ears jingle musically as she’s humped into the heavens. She bites her lower lip and rides out the pleasure as you begin to lose focus. A few seconds later, you feel her lips against yours and kiss back as she helps you up.");
	output("\n\nYou offer to help her clean up, but she replies that playing the game with her was help enough. She’ll clean it after she gets some work done. You gather your gear and head back to whatever you were planning to do before.");
	processTime(4);
	pc.removeStatusEffect("Shekka_Sexbot_Round");
	pc.orgasm();
	chars["SHEKKA"].orgasm();
	fuckedShekka();
	clearMenu();
	StatTracking.track("contests/shekka sexoff losses");
	addButton(0,"Next",mainGameMenu);
}

//Fuckfest II: The fuckening
//Opening
//Choose [round 2] from sex menu.
public function shekkaSexbotsMarkTwo():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	//First time
	if(flags["SEEN_SHEKKAS_NEW_SEXBOTS"] == undefined)
	{
		flags["SEEN_SHEKKAS_NEW_SEXBOTS"] = 1;
		output("As you contemplate what to do, you notice 2 new robots in the back of the store. You give Shekka a questioning look and gesture to them. She averts her gaze slightly, a sheepish smile spreading on her lips.");
		output("\n\n<i>“Well, I figured since we had so much fun with the last set, I’d better get the second set so we can try them out,”</i> she says as she gestures to the new bots. A cursory examination reveals that the cocks on this variety look to be made of liquid metal. The rods are perfectly round, and look more like classic dildos than actual penises. They lack the fuzzy cilia of the last variety, making you wonder what game these ones are designed for.");
		output("\n\n<i>“The first set was designed to use different textures of the same shape. This set adds different shapes to the mix, collected from various races around the universe. I hadn’t even heard of some of them till I looked at the remotes,”</i> she says as she hands you one of the two controllers. Unlike the last pair, these ones seem new and unblemished. The configuration is the same as last time, with the go button positioned above ten effect choices.");
		output("\n\n<i>“So " + pc.mf("Mr.","Ms.") + " Steele, are you up for another challenge?”</i> The over-eager engineer asks, giving you her best puppydog eyes. This time, the thought of declining doesn’t even cross your mind.");
		output("\n\n<i>“You know it,”</i> you reply as you ");
		if(!pc.isNude()) output("begin to take off your [pc.gear] before moving to the sexbot");
		else output("toss your equipment in a pile and move closer to the sexbot");
		output(". These new bots are very much an improvement of the others, with humanoid heads and actual hands instead of suction cups. It makes you wonder how long Shekka had those old bots before you noticed them.");
		output("\n\nYou watch as the raskvel repairwoman strips out of her hex-patterned suit, first uncovering her perky B-cups and then her broad egg laying hips. She steps out of the suit and walks to her robot, ears jingling as she kneels down before it. You get in place and prepare to start the game. This should be fun!");
	}
	//Repeat
	else
	{
		output("You ask Shekka if she’s up for another challenge with the second set of robots. She enthusiastically accepts your challenge, rushing over to them and preparing herself. You follow, removing your [pc.gear] as you go, placing it in a pile next to the duelbots. You kneel in front of your robot and notice the raskvel technician doing the same. The two of you place your hands above the “GO/FORFEIT” buttons and prepare to start.");
	}
	processTime(1);
	clearMenu();
	addButton(0,"Next",pressGoForUpgradedSexbots);
}

	/*Game mechanics

	Same as first game mechanics wise, choose from the 10 options, after 4 choices whoever has the least points loses, tie results in victory if below 50 combat lust, loss if above.

	Ausar: 10 lust points, shekka chooses caithrit
	Tentacle: 10 lust points, shekka chooses anemone
	Caithrit: 5 lust points, shekka chooses lizard
	Human: 5 lust points, shekka chooses goo
	Horse: 10 lust points, shekka chooses mendova
	Anemone: 5 lust points, shekka chooses naleen
	mendova: 5 points, shekka chooses tentacle
	Naleen: 10 points, shekka chooses horse 
	Lizard: 10 points, shekka chooses human
	goo: 15 lust points, shekka chooses ausar*/
public function sexBotMenu2(arg:int = 0):void
{
	clearMenu();
	if(arg == 0) addDisabledButton(0,"Ausar");
	else addButton(0,"Ausar",giveDemAusarCocksAWhorlOnShekkasSexBawts,undefined,"Ausar","Activate the ausar function on Shekka’s ‘bot.");
	if(arg == 1) addDisabledButton(1,"Tentacle");
	else addButton(1,"Tentacle",tentacleShekkaSaxbotMkII,undefined,"Tentacle","Activate the tentacle function on Shekka’s ‘bot.");
	if(arg == 2) addDisabledButton(2,"Kaithrit");
	else addButton(2,"Kaithrit",kaithritShekkaSaxbot,undefined,"Kaithrit","Activate the kaithrit function on Shekka’s ‘bot.");
	if(arg == 3) addDisabledButton(3,"Human");
	else addButton(3,"Human",humanShekkaSaxbot,undefined,"Human","Activate the human function on Shekka’s ‘bot.");
	if(arg == 4) addDisabledButton(4,"Horse");
	else addButton(4,"Horse",horseShekkaSaxbot,undefined,"Horse","Activate the horse function on Shekka’s ‘bot.");
	if(arg == 5) addDisabledButton(5,"Anemone");
	else addButton(5,"Anemone",shekkaAnemoneBot,undefined,"Anemone","Activate the anemone function on Shekka’s ‘bot.");
	if(arg == 6) addDisabledButton(6,"Mendova");
	else addButton(6,"Mendova",mendovaShekkaBot,undefined,"Mendova","Activate the mendova function on Shekka’s ‘bot.");
	if(arg == 7) addDisabledButton(7,"Naleen");
	else addButton(7,"Naleen",naleenSexBotLetsGo,undefined,"Naleen","Activate the naleen function on Shekka’s ‘bot.");
	if(arg == 8) addDisabledButton(8,"Lizard");
	else addButton(8,"Lizard",lizardShekkaBot,undefined,"Lizard","Activate the lizard function on Shekka’s ‘bot.");
	if(arg == 9) addDisabledButton(9,"Goo");
	else addButton(9,"Goo",gooShekkaBot,undefined,"Goo","Activate the goo function on Shekka’s ‘bot.");
	
	addButton(14,"Forfeit",pcLosesToNewShekkaBots,undefined,"Forfeit","Give up and cum right now.");
	if(chars["SHEKKA"].lust() >= chars["SHEKKA"].lustMax())
	{
		clearMenu();
		addButton(0,"Next",pcWinsVsNewShekkaBots);
	}
	else if(pc.lust() >= pc.lustMax())
	{
		clearMenu();
		addButton(0,"Next",pcLosesToNewShekkaBots);
	}
}


//Press go
public function pressGoForUpgradedSexbots():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	output("<i>“You ready over there?”</i> you ask, looking over to Shekka to make sure she’s all set. She nods, her finger positioned over the go button. You smile, returning your attention to your own remote. <i>“Three. Two. One. Go!”</i>");
	output("\n\nOn go, the both of you press your start buttons. You feel humanoid hands grip your [pc.butt], feeling a lot better than the suction cups. The hands do feel softer than your average person, like clouds touching your [pc.skinFurScales]. A stream of liquid washes over your backside once the liquid metal cock is lined up with [pc.vagOrAss]. You assume it’s some kind of lube, designed to protect those with suboptimal natural lubrication, ");
	if(pc.wetness() < 2 || (!pc.hasVagina() && pc.ass.wetness() <= 2)) output("and you’re thankful for the feature");
	else output("not that you need it");
	output(".");
	output("\n\nThe robot penetrates you, beginning to hump rhythmically into your depths. You slowly let yourself acclimate to the thrusting. As it currently is, the robot seems to be sexing you in the least arousing way possible, assumedly so the game doesn’t end too quickly. You glance at Shekka and see her appraising her choice of buttons. If you want the first move you’d better decide quickly.");
	if(pc.hasVagina()) pc.cuntChange(0,20,true,true,false);
	pc.buttChange(20,true,true,false);
	sexBotMenu2(-1);
}

//Ausar: 
public function giveDemAusarCocksAWhorlOnShekkasSexBawts():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	if(sexbotRound() <= 0) output("First,");
	else if(rand(2) == 0) output("Next,");
	else output("Then,");
	output(" you hit the button labeled <i>“Ausar”</i>. The red scaled mechanic gasps with pleasure, and she grunts as the robotic cock inside her expands to fit the shape of an ausar’s dog-cock. Shekka bites her bottom lip, and you can see the edge of a great metallic knot attempt to extract itself from her passage. It fails of course, simply tugging her along for the ride as she clenches her fists in resilience.");
	output("\n\nShekka looks at her options, but before she can hit the one she’d planned to, she jerks off course and her finger lands on another option. She curses and weathers her own challenge. You feel the silvery dick inside your [pc.vagOrAss] begin to shift and change. When it ends, you feel tiny spines tugging at you when it pulls out. You have a feeling this must be a kaithrit impersonation. Without the warmth of a living cock, the spines are just uncomfortable.");
	output("\n\nYou have no trouble resisting the spiny kitty-cock that tugs on your insides. The smooth tipped barbs aren’t painful, but they certainly aren’t winning any awards in the arousal department. You see your raskvel repairwoman partner look noticeably relieved as the cock inside her returns to the basic dildo shape. You feel yours revert a short time later, and resume your decision making for what to choose next.");
	processTime(1);
	chars["SHEKKA"].lust(10);
	pc.lust(5);
	sexbotRound(1);
	sexBotMenu2(0);
}


//Tentacle: 
public function tentacleShekkaSaxbotMkII():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	if(sexbotRound() <= 0) output("First,");
	else if(rand(2) == 0) output("Next,");
	else output("Then,");
	output(" you press the “Tentacle” button. You’re not sure if it means a specific race, but tentacles are rather universal. The metallic cock inside Shekka elongates and thickens at the base. The robot stops its thrusts, simply letting the silvery tentacle do its magic on the scaly shortstack. The magic in question seems very effective indeed, as Shekka grits her teeth in concentration, her eyes struggling to stay focused.");
	output("\n\nShe manages to keep it up long enough to press a button, and you feel smaller tendrils grow from the tip of the dildo-dick inside you. The thickness doesn’t change a lot, and you feel that something is missing from this equation. The tickling tendrils are all right, but nothing to write home about. Whatever race this is from, they’d better have something snazzy to accompany this shape.");
	output("\n\nOnce again you’re reduced to watching the crimson engineer have fun. Part of you hopes she hits the tentacle button at some point during the game. The sight of her cooing as her hole is ravaged by a writhing coil of cock sends a shiver through your body. Once again she’s given you a free opportunity to make your choice.");
	processTime(1);
	chars["SHEKKA"].lust(10);
	pc.lust(5);
	sexbotRound(1);
	sexBotMenu2(1);
}

//Kaithrit:
public function kaithritShekkaSaxbot():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	if(sexbotRound() <= 0) output("First,");
	else if(rand(2) == 0) output("Next,");
	else output("Then,");
	output(" you click the button labeled “Kaithrit”, and wait eagerly for Shekka’s reaction. When it comes it isn’t quite the reaction you’d hoped for. She gives a yip of discomfort and looks at the robot, and then looks to you. Judging by her look the kittycock option wasn’t a hit for her.");
	output("\n\n<i>“Really? Is that the best you can do? All this feels is uncomfortable,”</i> the deflated technician sighs, resting her hands on her palms as she surveys her options, finally clicking one after building your anticipation. The chromed cock inside your [pc.vagOrAss] splits into two, not growing much, but expanding to twice its former thickness. Your mouth opens soundlessly as the newly formed twincock ravages your passage.");
	output("\n\n<i>“There! That’s what I want to be feeling right now,”</i> she says as you struggle to find your voice. When you finally find it, it comes out as a quiet moan, and your hands clench the sides of your remote. You survey your options, desperate to get to the next option before you lose the game.");
	processTime(1);
	chars["SHEKKA"].lust(5);
	pc.lust(10);
	sexbotRound(1);
	sexBotMenu2(2);
}

//Human: 
public function humanShekkaSaxbot():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	output("While you’re busy pondering your choices, Shekka takes the advantage and picks one first. The stannic dildo inside you grows for a moment, but instead of hardness you feel it soften. It still grows, however, feeling like liquid. You moan loudly as the morphing cock sloshes through your passage. No matter how hard your [pc.vagOrAss] clenches around it, it slides through you unhindered.");
	output("\n\nYou scramble to find a button, hitting the “Human” one as an emergency effort. The raskvel technician smiles at you, looking pleased with herself as her robot pistons its hips against hers. She doesn’t appear to be anywhere near the same state you’re in from her choice. She laughs when she sees your look, as if reading your mind.");
	output("\n\n<i>“Human cocks are much better with the person attached. They’re kinda bland without it, especially at this size,”</i> she says as you weather the storming faux goo-cock inside you. You attempt a witty retort, but can’t talk with the flood of liquid metal sloshing through your [pc.vagOrAss]. You hope there aren’t any other buttons quite this tough to resist.");
	processTime(1);
	chars["SHEKKA"].lust(10);
	pc.lust(5);
	sexbotRound(1);
	sexBotMenu2(3);
}

//Horse: 
public function horseShekkaSaxbot():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	if(sexbotRound() <= 0) output("First,");
	else if(rand(2) == 0) output("Next,");
	else output("Then,");
	output(" you push the button labeled “Horse”. Your choice is a successful one, and you smile as you see the scarlet shortstack bite her bottom lip. Her long ears jingle musically as she’s pounded by the thick metallic horse-dick. Her egg-bearing hips twitch invitingly, each motion creating a new fantasy while you wait for her to press her button.");
	output("\n\nShe manages to hold it together long enough to jam one, and you feel the single robo-dildo in your [pc.vagOrAss] split into a number of smaller thin tendrils. The mini-tentacles feel good, but you think they could stand to be a little thicker, or maybe a little more adventurous. The race this cock belongs to must have prehensile control over these things, or females with extraordinarily sensitive vaginas.");
	output("\n\nFor now, you’re content to sit and listen to the chorus of moans and jingling ear jewelry coming from your partner. The pint-sized mechanic takes the thick, long rod like a champ. You stretch your muscles and yawn, working out the tension of being relatively still for so long. You peruse your choices as you wait for the current one to finish up.");
	processTime(1);
	chars["SHEKKA"].lust(12);
	pc.lust(5);
	sexbotRound(1);
	sexBotMenu2(4);
}

//Anemone: 
public function shekkaAnemoneBot():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	if(sexbotRound() <= 0) output("First,");
	else if(rand(2) == 0) output("Next,");
	else output("Then,");
	output(" your hand comes to the button labeled “Anemone”. While you wonder about whether it means the seafaring plant from tera, Shekka makes her move. She activates her remote before you can reach yours, and you feel the metal rod elongate and grow two bulbous portions along its length. They aren’t quite as thick as knots, so when they pass by the entrance to your [pc.vagOrAss] they pop out and back in, throwing you off balance when you expect to be pulled but slip back.");
	output("\n\nYou hit your anemone button and hope that it’s something special. The contented look on the raskvel technicians face ruins your hopes. She smiles at you and moans softly, her ears sounding like wind chimes. She seems in complete control of what she’s feeling, which isn’t what you want in a competition that focuses on making the opponent lose themselves in lust.");
	output("\n\n<i>“What are you trying to do? Let me win?”</i> Shekka taunts as she watches you struggle. The knobby cock inside you is much better at its job, and you feel like if this dick had the warmth that it would have on a living thing you’d be a goner already. Your competitor squeezes one of her pert B-cups, rubbing the eggplant-colored nipple enticingly.");
	processTime(1);
	chars["SHEKKA"].lust(5);
	pc.lust(10);
	sexbotRound(1);
	sexBotMenu2(5);
}

//Mendova: 
public function mendovaShekkaBot():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	if(sexbotRound() <= 0) output("First,");
	else if(rand(2) == 0) output("Next,");
	else output("Then,");
	output(" you thumb the button labeled “Mendova”. Shekka gasps in pleasure, but her expression turns to a smile after a moment. This was the wrong choice for this game. The crimson tech wiz makes exaggerated moans in an attempt to coax extra feeling from you. As she does so she hits a button on her controller.");
	output("\n\nYou grit your teeth as the metallic pole inside you becomes thicker at the base and lengthens. It becomes a chromed tentacle, churning both your insides and the thoughts in your head. It’s hard to keep your thoughts straight as the offending tendril pounds ");
	if(pc.hasVagina()) output("against your womb");
	else output("deeper into [pc.ass]");
	output(". If this keeps up for much longer you might be in trouble.");
	output("\n\n<i>“If you can’t take it, you should stop going easy on me with your choices,”</i> the rosey-scaled engineer says with a wink. You can only grunt and moan in reply, feeling haggard from the constant dicking. The warm embrace of orgasm looms on the horizon, looking quite inviting.");
	processTime(1);
	chars["SHEKKA"].lust(5);
	pc.lust(10);
	sexbotRound(1);
	sexBotMenu2(6);
}

//Naleen: 
public function naleenSexBotLetsGo():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	if(sexbotRound() <= 0) output("First,");
	else if(rand(2) == 0) output("Next,");
	else output("Then,");
	output(" you see the button labeled “Naleen”. You give Shekka a foolish grin, waving to her. When she notices you and begins to voice a question, you press the button. The scarlet-scaled shortstack’s voice catches in her throat, her question trailing off into pleasure addled mumbling. The now dually knobbed reptile cock in her cunt tugs at her slightly as the thicker portions pop in and out.");
	output("\n\n<i>“What’s the matter, cat got your tongue? Or I guess kitty-naga in this case,”</i> you tease playfully, eyeing your competition’s naked figure as it’s rammed by robotic meat. Shekka manages a laugh, hitting a button on her own remote. You gasp as your robot’s dick thickens and lengthens inside you, topping off with a flared tip. The ridges of the flare tickle at your walls, and the overall thickness doesn’t hurt in the least. It seems this time the both of you have chosen effective buttons.");
	output("\n\nBoth of you ride out the pleasure together. Before your eyes haze with lust, you can see that the raskvel repairwoman’s are just as unfocused. For a moment, the room is filled with the sounds of both of your moans, the robo-flesh slapping against your butts, and the jingling of her ears.");
	processTime(1);
	chars["SHEKKA"].lust(10);
	pc.lust(12);
	sexbotRound(1);
	sexBotMenu2(7);
}

//Lizard: 
public function lizardShekkaBot():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	if(sexbotRound() <= 0) output("First,");
	else if(rand(2) == 0) output("Next,");
	else output("Then,");
	output(" you pick the button labeled “Lizard”, not sure what kind of lizard they’re referring to. Shekka gasps, and when her robot pulls out you see that its dildo-cock has become two shorter and thicker ones. The dual powered option seems to be effective, as the pint-sized engineer grunts and backs her hips further into them.");
	output("\n\nHer pleasure doesn’t prevent her from choosing a button, and you feel the metallic rod in your [pc.vagOrAss] begin to morph shapes. When it ends, it hasn’t changed a lot. Her choice was a simple human dick. Maybe the lizard cock had a bigger effect on her than you had thought. You’re perfectly fine with this situation as it helps you keep your head in the game.");
	output("\n\nA silly part of you wishes you had some popcorn to eat while watching the minute mechanic squirm in ecstasy. Her legs tense with every slap on her ample hips, the robots hands holding fast to her squishy tush. Her teeth clench tightly shut as she resists as best she can. You wish the human dick came with the faculties of its origin race. Without the throbbing and pulsing, it’s not much better than a dildo.");
	processTime(1);
	chars["SHEKKA"].lust(10);
	pc.lust(5);
	sexbotRound(1);
	sexBotMenu2(8);
}

//goo: 
public function gooShekkaBot():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	if(sexbotRound() <= 0) output("First,");
	else if(rand(2) == 0) output("Next,");
	else output("Then,");
	output(" you push the button labeled <i>“Goo”</i>. At first Shekka smiles, but her grin melts after a few seconds, turning into a look of worry, then to one of lust. For a second you think you might have won, as the scaley shortstack collapses, moaning as the goo cock sloshes rapidly inside her. Her tongue lolls from her mouth as the chromed liquid massages both of her clits at once. How she manages to pull herself from the brink to hit her button, you’ll never know.");
	output("\n\nYou feel the dick in your [pc.vagOrAss] hilt, and before you can wonder what’s happening, the base begins swelling until it’s stuck fast inside your hole. You gasp and moan as the robot attempts to tug its way out to no avail, bringing you along for the ride. The knotted cock feels wonderful, causing your muscles to begin tensing.");
	output("\n\n<i>“Is that all you’ve got? This is nothing,”</i> you taunt, somehow managing to bring yourself to a stable state of mind. The smooth-scaled technician recovers as well, but still appears to be having a little trouble as the poundings and massagings of the gooey member whither her defenses.");
	processTime(1);
	chars["SHEKKA"].lust(15);
	pc.lust(10);
	sexbotRound(1);
	sexBotMenu2(9);
}

//Pc wins
public function pcWinsVsNewShekkaBots():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	output("As you contemplate your next choice, you hear Shekka’s breathing become deeper and more lust-filled. You watch as she again clutches the controller against her, muscles locking up as orgasm rocks her body. Now that she’s lost, there’s no harm in helping her along, right? You reach over between the cleft of her ass and tickle her rear clit with your forefingers. This sets her off again, her voice peaking in a shout as her legs splay out around the robot’s hips. Her tail beats against your forearm when it tries to wag.");
	output("\n\n<i>“You just love letting me win, don’t you?”</i> you ask teasingly as you attend to her. She nods weakly as the spasms slow down enough for her to regain motor control. Suddenly, you remember your own pleasure, but it’s too late to keep a cap on it. You squeeze the rosey raskvel’s butt-cushions as you cum, ");
	if(pc.hasCock() && pc.hasVagina()) output("[pc.girlCum] leaking from [pc.eachVagina] as [pc.eachCock] paints the floor [pc.cumColor]");
	else if(pc.hasCock()) output("splattering the floor as [pc.eachCock] blows a load beneath you");
	else output("spattering the robot’s hips with your [pc.girlCum]");
	output(".");

	output("\n\nYou brush one of Shekka’s ears away from her face as you help her off her robot. Her legs shudder weakly, not quite ready to support her. You offer to help clean up the mess you’ve made, but she tells you not to worry about it. She’ll get it later. You gather your gear and return to your previous antics.");
	processTime(4);
	pc.removeStatusEffect("Shekka_Sexbot_Round");
	pc.orgasm();
	chars["SHEKKA"].orgasm();
	fuckedShekka();
	clearMenu();
	StatTracking.track("contests/shekka sexoff wins");
	addButton(0,"Next",mainGameMenu);
}

//Pc loses
public function pcLosesToNewShekkaBots():void
{
	clearOutput();
	author("Gardeford");
	showBust("SHEKKA_NUDE");
	showName("\nSHEKKA");
	output("You try to think of another button to press, but you are unable to blink away the rapidly encroaching haze of lust that creeps into your vision. Oh no! You attempt to hit a button at random, but miss the keypad as spasms rock your body. You cum hard, ");
	if(pc.hasCock() && pc.hasVagina()) output("[pc.girlCum] leaking from [pc.eachVagina] when [pc.eachCock] paints the floor [pc.cumColor]");
	else if(pc.hasCock()) output("splattering the floor when [pc.eachCock] blows a load beneath you");
	else output("spattering the robot’s hips with your [pc.girlCum]");
	output(".");
	output("\n\n<i>“Ooooh,”</i> is all you can manage while the muscles in your [pc.legOrLegs] clamp up, your [pc.vagOrAss] tightening like a vice around the robotic intruder. Shekka cheers in victory before letting herself fall to her own pleasure. She sighs as her toes curl, and her eyes roll back into her head. You both share a moment of mindless bliss before coming back to your senses.");
	output("\n\n<i>“Thanks for playing with me again. Sorry you had to lose,”</i> Shekka says once she’s recovered. She crawls over to you, giving you a kiss before helping you up and finding your gear for you. You offer to help her clean up, but she dismisses it, saying she’ll clean it up later. You equip your things, ready to go on your way.");
	processTime(4);
	pc.removeStatusEffect("Shekka_Sexbot_Round");
	pc.orgasm();
	chars["SHEKKA"].orgasm();
	fuckedShekka();
	clearMenu();
	StatTracking.track("contests/shekka sexoff losses");
	addButton(0,"Next",mainGameMenu);
}

//SHEKKA FOLLOWER XPACK INTRO, BY SomeKindofWizard
//Content/Intro
//The content in here is reliant on having done most of the available Shekka conversations (see her original document for all of that). 
//Once you have completed [Repeat Good To Talk] [Her Plan] a day will pass and you will receive the following Codex mail.
//You also have to have completed the first Probe event, it doesn’t matter if you sold the probe back to her, etc. As expected, if you went through the arduously complicated task of blowing Tarkus the hell up, you can’t do her big plan for the Raskvel. You lose, good day sir.

public function shekkaFollowerIntroEmail():String 
{
	return ParseText("Good Morning, [pc.name],\n\nOr... whatever time it is. I’ve spent the night mulling over a real plan for the Raskvel. Have you ever had insomnia? I tried to lie down and get to sleep, and all my brain could do was start putting all the pieces together.\n\nHow to help my people. I can’t express how many half-baked plans I had to scrap, but I think I know what needs to be done.\n\nOf course, it turns out there aren’t just stumbling blocks; there are giant walls keeping me from what I want to achieve. I understand if this is asking a lot of you, but could we have a talk whenever you have the time?\n\nI cannot think of anyone else more able to help than yourself. And I’m not just talking about getting money off of you! It would be a big weight off of my shoulders knowing I had your support.\n\nThank you for your time.\n\tShekka xxxx\n\t-Shekka’s Widget Warehouse");
	//Reading this email will make the changes to her talk options.
}

//Curing The Raskvel
//Shekka’s talk actions change. The previous options are all gone, and you don’t have to wait in order to talk more with her. You still have [Appearance Screen] [Buy Something] [Flirt>Sex]

//[Talk] //Talk with Shekka about the Raskvel
public function raskvelCureQuestShekkaTalk():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	//The Issue
	//First Time
	if(flags["SHEKKA_ISSUES"] == undefined)
	{
		output("<i>“Hey! There you are!”</i> Shekka all but bounces up to you. There is a peakiness to her eyes that speaks of far too much moving compared to what you would guess is far too little sleep.");
		output("\n\nConsidering the fact that her usually scrap-covered desk is buried beneath an entire V-Machine’s worth of empty cans, that estimate seems to be a rather safe one. You greet her with a wave and she guides you to a couple of stools. Once you’re sat down, Shekka follows suit, wiggling her massive hips and setting her great big ears to jangling musically.");
		output("\n\nAnd then there’s silence. Shekka holds up her hand, mouth half open... and you could swear her brain just shut down. When you snap a finger in front of her face she scowls and pushes it away. <i>“Sorry. I’m just trying to find a good way to put this to words.”</i> She speaks softly, pulling out a thin, beaten-up data pad. She taps through it a little, before swiping over to a series of graphs. She hands it over to you with a concerned frown.");

		if(pc.isBimbo()) output("\n\nIt’s kind of disappointing; you thought she was going to show you something a little more special! No naked men or women, nobody’s fucking... It does look important though. Bigger is probably better, and not many bars are big.");
		//Bro
		else if(pc.isBro()) output("\n\nFuck, what is this nerd shit? With a sigh you look over the graphs, trying to figure some of it out. Looks like... money and names, and something that goes larger and... smaller. Man, you have no idea...");
		//Intelligence stat greater than/equal to 15
		else if(pc.intelligence() >= 15)	output("\n\nFrom the outset, it seems to be a project analysis, the names of some scientists, and their funds. Wait, those are costs. Population projections... time estimates too.");
		//Intelligence stat less than 15
		else output("\n\nIt’s hard to say what you are looking at... there’s something about money projections, a few scientist names.");
		
		//Merge
		output("\n\nShekka takes back the pad with a weak smile, fighting hard to keep a yawn down. Okay, you bite, what exactly is the reason for all of this?");
		output("\n\n<i>“Well, we talked about it before. The short version is that mature adults can’t get fixed up. So instead a treatment has to be given to them that won’t try to alter </i>their<i> thinking patterns... and at the same time pass it on to their children.”</i> She hops off of her stool again, starting to pace from side-to-side. There’s a musical jingle-jangle from her ears as she does so. <i>“If we started giving the treatment to Raskvel children post-birth then honestly it feels kind of... brain-washy. And also, just going to put it out there, I don’t like the idea of sticking needles into eggs. Or babies.”</i>");
		output("\n\nThe next question is of course; where do you come in? She looks uncomfortable when you finally breach the question. <i>“Money is the first thing. I know you might not have any right now, that’s... I understand that. But I know you can make it an awful lot faster than I ever could on this glorified junk-heap.”</i> Before you get a chance to speak up, she shakes her hands in alarm. <i>“I-it’s not just money, [pc.name], really! I... your name is a big deal, scientists will actually </i>listen<i> to me! Even if you can’t help with the money part... would you be willing to sign your name to it, so that I can get to work?”</i>");
		output("\n\nShekka looks at you with earnest desperation, and you smile warmly, holding out a hand. Shekka’s eyes well up with moisture, which is quickly rubbed away. She flips out her quilled hair before slapping her smaller hand into your [pc.hand]. <i>“Th-thank you... I never doubted you for a second...”</i>");
		//Next: Close out the dialogue here so that you have to select Talk again
		processTime(30);
		flags["SHEKKA_ISSUES"] = 1;
		clearMenu();
		addButton(0,"Next",approachShekka,true)
	}
	//Second Time
	else if(flags["SHEKKA_ISSUES"] == 1)
	{
		output("Shekka beams a smile at you, hands idly toying with her data-pad. <i>“Hey [pc.name]! The moment I put your name out I got a whole bunch of response.”</i> she pauses for a moment, clearing her throat uncomfortably. <i>“Not all of it great, but for the most part rather positive. Seems your daddy’s last few years were spent making a good name for himself in genetics-based uplift and some quality of life stuff. I might be able to... uh... use, some of that.”</i>");
		//if Anno’s on your crew
		if(annoIsCrew())
		{
			output("\n\nHuh, maybe your resident puppy-slut Anno might be able to score Shekka the details of a few legitimate Steele Tech scientists...");
		}
		//cont
		output("\n\nYou rock on your heels for a moment, soaking in Shekka’s excitement a little yourself. Hopefully she isn’t getting too far ahead of herself. At the very least it seems promising news. <i>“Of course, while I’m waiting for a few call-backs, how about you and me do something to pass the time?”</i>");
		processTime(2);
		flags["SHEKKA_ISSUES"]++;
		//Next: Jump to Sex Menu
		shekkaSexMenu();
		eventQueue.push(shekkaFundProjectTalk);
	}
}

public function shekkaFundingCost():Number
{
	var cost:Number = 0;
	if(flags["SHEKKA_ISSUES"] == 2) cost = 5;
	else if(flags["SHEKKA_ISSUES"] == 3) cost = 20;
	else if(flags["SHEKKA_ISSUES"] == 4) cost = 10;
	return (cost * 1000);
}

//Fund Project
//After the second time it’s selected “The Issue” turns into “Fund Project”
public function shekkaFundProjectTalk():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	//Fund 1
	if(flags["SHEKKA_PROJECT_FUNDED"] == undefined)
	{
		output("Looking at Shekka now, she doesn’t appear so much ‘bouncy’ as she does bashful, grinding one of her feet into the ground. <i>“Er, hey Steele... I know this is going to be awkward. And I really don’t know how to ask it gently. But... I need credits for this. A solid chunk. At least 5,000. Science doesn’t come free in our universe.”</i>");
		output("\n\nHer ears flap and jingle musically for a moment as her face scrunches in consternation. <i>“There have been some complaints that we’re changing all of our children against their will. It’s... kind of a valid point, I guess. The alternative though is being a bunch of tinker-obsessed-sluts, birthing more children than we can maintain, and getting walked all over by the established UGC races and companies,”</i> as she gets fully invested in her complaints, she stamps her foot a few times. <i>“Never mind that we’re smart. We’re </i>smart<i> for fuck’s sake. We could do and be amazing things if we weren’t being totally destroyed by outdated biology. It’s–uh... right. Sorry. Repeating myself.”</i>");
		output("\n\nLuckily, you had been expecting as much, and you took a look through your reserves while she rants.");
		//Costs 5k credits (fuck i’unno what stuff costs these days, change as you will)
		processTime(5);
		clearMenu();
		if(pc.credits >= shekkaFundingCost()) addButton(0,"Pay 5K",payShekkaForFunding1,undefined,"Pay 5K","Pay 5,000 credits to fund Shekka’s project.");
		else addDisabledButton(0,"Pay","Pay","Helping Shekka with her project will set you back at least 5,000 credits.");
		addButton(1,"Don’t Pay",noPayYetShekkaFund1);
	}
	//Fund 2
	else if(flags["SHEKKA_PROJECT_FUNDED"] == 1)
	{
		//After you paid the first time and a day has passed
		output("You don’t even get a chance to ask how she’s doing; Shekka is already wiggling with barely contained excitement. <i>“[pc.name]! The first data’s been received, I’ve got some stuff to pass around between all the scientists. It’s... it’s looking good, I think. Honestly a lot of it’s going over my head, but preliminary data says I’m not crazy!”</i>");
		output("\n\nPromising news indeed. You ask if she’s going to need more funding, and once more there’s an uncomfortable squirm from the pear-bottom-beauty. <i>“Erhh... yes. I’m afraid so. 20,000. If anything it’s charity work, the most expensive part is loaning out laboratories across the stars.”</i>");
		processTime(4);
		clearMenu();
		if(pc.credits >= shekkaFundingCost()) addButton(0,"Pay 20K",payShekkaForFunding2,undefined,"Pay 20K","Pay 20,000 credits to fund Shekka’s project.");
		else addDisabledButton(0,"Pay","Pay","Helping Shekka with her project will set you back at least 20,000 credits.");
		addButton(1,"Don’t Pay",noPayYetShekkaFund2);
	}
	//Fund 3
	//After you’ve paid a second time and a day has passed.
	else
	{
		output("Shekka looks rather tired now that you look her over. Still, she manages a bright smile in her cluttered little warehouse. <i>“Heeey [pc.name].”</i> she says, plucking up a v-drink and knocking it back in a few gulps. Her tail goes on end at the rush of chemicals, forcing her to shudder a few times. <i>“Blech. Like a kick in the egg-hole, that stuff. Oh! Oh! Look!”</i> she bunny-hops over, waving her datapad at you.");
		output("\n\nNo homescreen to make fun of this time; it appears to be a video. You press the play button and it kicks into place. It’s a cross-section of an egg. Before you have a chance to be utterly horrified, she warns you that it’s a digital render, and to keep on watching. The beginning isn’t particularly interesting; it’s just growing (into an admittedly adorable mini-Rask).");
		output("\n\nAt that point there is a freeze-frame, and a split-off showing a list of numbers.");
		//Int is over 30
		if(pc.IQ() > 70)
		{
			output("\n\nAlthough it takes a few moments to muddle through, you realize it’s a rolling series of estimations on development. There’s a particularly huge hormone gland that now only seems to grow to half of its size. Likewise a number of small tweaks seem to have been added on. You blink and look down at Shekka. Did they just cure all of the known birth defects?");
			output("\n\nHer tail whips around and her ears jingle cheerfully, very obviously proud. <i>“It seemed like a good thing to include while they were at it. Apparently way easier than fixing the brainpower-consuming breed-mania we have.”</i> Huh, shit...");
		}
		//Int is under 30
		else
		{
			output("\n\nSadly you can’t make sense of it all, but Shekka takes the time to patiently point out a bunch of numbers, a half-size hormone gland, and also <i>“for shits and giggles”</i> one of the scientists working on the solution happened to engineer out all of her race’s known birth defects.");
		}
		//Merge
		output("\n\nYou give her a proud hug and ask what she needs next. After a brief moment of nuzzle your [pc.chest] she snaps back to reality. <i>“Uuuuh... right. The cure has been designed, we just need the manufacturing to get it off the ground. Y’know... pay people to distribute it to the many Raskvel out there over the next few weeks. 10,000 credits.”</i>");
		output("\n\n<i>“Weeks? That seems a little quick, to be honest.”</i>");
		output("\n\nShekka snorts at your disbelief. <i>“It’s just one shot and done. I figure all I have to do is put up a free sex sign in front of a nurse’s office and let nature take its course.”</i>");
		clearMenu();
		if(pc.credits >= shekkaFundingCost()) addButton(0,"Pay 10K",payShekkaForFunding3,undefined,"Pay 10K","Pay 10,000 credits to fund Shekka’s project.");
		else addDisabledButton(0,"Pay","Pay","Helping Shekka with her project will set you back at least 10,000 credits.");
		addButton(1,"Don’t Pay",noPayYetShekkaFund3);
	}
}

//Buttons are Pay or Not Yet
//Pay
public function payShekkaForFunding1():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("What’s an " + pc.mf("heir’s", "heiress’") + " fortune between friends? You snatch up the fidgeting Raskvel’s datapad (catching a glimpse of her background image; lewd) and swipe a portion of your codex across it. There’s an affirmative chirp, and your account’s loads are lightened.");
	output("\n\nShekka’s cheeks blush a cute little purple as she reclaims her datapad. <i>“You didn’t see that, right?”</i> Your only response is a toothy grin and a knowing eyebrow wiggle.");
	output("\n\n<i>“A-anyway. Thanks for this, I’ll get this out to a few of them in no time... hopefully we won’t come up against any issues.”</i> She gives your leg a quick hug before scampering over to her workbench, casting an eye over everything in an attempt to get her brain back on track again.");
	output("\n\nWell... you’ve got her back on this, regardless of what crops up.\n\n(<b>You’ll want to check back in a day or so...</b>)");
	//Done: ends conversation. Attempting to select Fund Project again is greyed out for a day.
	clearMenu();
	flags["SHEKKA_PROJECT_FUNDED"] = 1;
	IncrementFlag("SHEKKA_ISSUES");
	pc.createStatusEffect("Shekka_Pay_CD");
	pc.setStatusMinutes("Shekka_Pay_CD",16*60);
	pc.credits -= 5000;
	addButton(0,"Next",approachShekka,true);
	
}

//Not Yet
public function noPayYetShekkaFund1():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Uuuh... well, shit, this is embarrassing. You apologize profusely, trying not to look her in the eyes as her expression grows downcast. You hurriedly promise that you’ll be back with credits as fast as humanly possible. <i>“That’s uh, that’s fine [pc.name]. I believe in you.”</i>");
	//Done: ends conversation
	processTime(2);
	clearMenu();
	addButton(0,"Next",approachShekka,true);
}

//Pay
public function payShekkaForFunding2():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Much like the last time, you’re reaching for her datapad before she even finishes her explanation. There’s a tiny squeak of alarm when you get another eyeful of her home-screen. Looks like it’s changed recently.");
	output("\n\nYou peer over the pad at Shekka, whose face is going bright purple with a vengeance. It <i>is</i> true what they say about Kui-tan herms and Galotians, you guess. Trying not to " + pc.mf("chuckle","giggle") + ", you transfer yet another wad of credits into the poor girl’s flagging wallet. She grumbles and pulls you down for a quick kiss when you hand her pad back. It’s a deep, tongue-filled kiss, ");
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("but you keep it brief to keep your saliva from turning her into a puddle.");
	else output("and you are all too happy to wrestle oral-organs with her for a little longer.");

	output("\n\nAfter breaking away, she takes a slow, deep breath, struggling to get her body back under control. <i>“Don’t tease. And also, thanks again.”</i>\n\n(<b>You’ll want to check back in a day or so...</b>)");

	//Done: ends conversation. Attempting to select Fund Project again is greyed out for a day.
	IncrementFlag("SHEKKA_ISSUES");
	flags["SHEKKA_PROJECT_FUNDED"] = 2;
	pc.createStatusEffect("Shekka_Pay_CD");
	pc.setStatusMinutes("Shekka_Pay_CD",16*60);
	pc.credits -= 20000;
	clearMenu();
	addButton(0,"Next",approachShekka,true);
}

//Not Yet
public function noPayYetShekkaFund2():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Sadly, Shekka can already tell by the wince on your face that money might not be forthcoming straight away. She sighs softly and nods. <i>“Understood... I’m trying to make more cash myself, but unless I go out into the wastes, risking stars-only-know-what unpleasant ends, I’m limited in what I can do here.”</i>");
	output("\n\nNodding, you promise to be back with cash as soon as you can. Wouldn’t do to have progress halt when it’s only gotten going so recently.");
	//Done: ends conversation
	clearMenu();
	addButton(0,"Next",approachShekka,true);
}

public function payShekkaForFunding3():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Biting the bullet again isn’t so bad. You flick Shekka’s screen away from the video and begin another transfer. As soon as your money hits her account, it filters away again automatically, drunk up by operating costs. <i>“I’ve kind of dumped all my savings into it too. But I would feel like a hypocrite if I didn’t. Even with an " + pc.mf("heir","heiress") + " playing sugar-" + pc.mf("daddy","mommy") + "...”</i> She fights down a yawn as she accepts her pad back (before you get another chance to see her home-screen).");
	output("\n\n<i>“Keep this up and I’m going to run out of ways to thank you. Come check back soon, and we’ll have an idea of how this all looks. They’ve gotta produce the actual treatment, and I will be staring at my inbox every hour until it’s done.”</i>");
	output("\n\nInstead of letting the moment draw out with awkward thanks, you lift her up into your arms, pressing her tiny chest against your ");
	if(pc.biggestTitSize() < 1) output("pecs");
	else if(pc.biggestTitSize() < 10) output("own");
	else output("massive mammaries");
	output(". She squeaks in surprise at being manhandled, but a nibble on one of her ears turns that into a happy coo. <i>“Hey, behave. I don’t have the willpower to keep up with my libido right now. Give me a bit, okay?”</i> The look in her eyes is cheerful enough, but there is a tired edge that no amount of chemical stimulant can keep at bay entirely.");
	output("\n\n...Not that it stops her giving your ");
	if(pc.hasCock()) output("cock");
	else output("ass");
	output(" a cheeky squeeze");
	output(".\n\n(<b>Wait a day or so and then check back with her for an update!</b>)");

	//Done: close dialogue. After this, Fund Project is replaced with The Cure.
	processTime(6);
	IncrementFlag("SHEKKA_ISSUES");
	flags["SHEKKA_PROJECT_FUNDED"] = 3;
	pc.createStatusEffect("Shekka_Pay_CD");
	pc.setStatusMinutes("Shekka_Pay_CD",16*60);
	pc.credits -= 10000;
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",approachShekka,true);
}

//Not Yet
public function noPayYetShekkaFund3():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Right... sadly a check over your credit balance tells a different tale; you can’t afford to take this kind of hit, at least not right at this moment. Shekka trails her fingers through her feathers and groans, looking even more tired. <i>“Understood. I’ll keep as many of them on hold as I can, but I’m tapped. Come back quick, please [pc.name]?”</i>");
	//Done: ends conversation
	clearMenu();
	addButton(0,"Next",approachShekka,true);
}

//The Cure
//Once the project is funded, you can select a text option for The Cure where Funding used to be. After a week passes, you get a reminder to go and check on how she’s doing.
public function shekkaCureTalk():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	//Not Ready
	output("Shekka yawns and stretches, ears jingle-jangling at your approach. There appears to be a little nestled away selection of chemistry goods, and a bundle of notes. <i>“How’s it going? Uuuuh... not done yet, that’s for sure. But I’ve been thrown a bunch of numbers and figures and seeing what sticks.”</i>");
	output("\n\nThe curvaceous little rask stretches again, jingling from tip-to-tail. <i>“Sadly I don’t exactly have uh... the professional knowledge to synthesize any kind of drug myself. I wouldn’t dare to do something as incredibly challenging as tampering with my people’s DNA.”</i> She spins idly on her stool, plucking up an energy drink and knocking it all back.");
	output("\n\n<i>“Thank you as usual for your support... both monetarily, and, uh... personally.”</i> Shekka pauses for a cheeky wink, tail flicking in your direction. <i>“I’ve got a lot of work to do collating all the stuff people are sending me so far. I wanted to stay involved, so I’m kind of project-leading between all the various scientists... stars and eggs, I swear they can ramble about fucking nonsense.”</i>");
	output("\n\nSounds like Shekka could use a little break. She smirks at that, running a hand through the soft feathers of her hair. <i>“Is that <i>so<i> Steele? You might be right.”</i>\n\n(<b>There might be another week or two of work to do on the cure, but you can pass some time with Shekka for now...</b>)");
	pc.createStatusEffect("Shekka_Cure_CD");
	pc.setStatusMinutes("Shekka_Cure_CD",60*24*7);
	flags["SHEKKA_ISSUES"] = 6;
	processTime(5);
	pc.lust(10);
	//Next: Jump to Sex Menu
	shekkaSexMenu();
}

//Ready
//After a week passes, The Cure is ready, and selecting The Cure option gives you the following
public function theCureIsReadyShekka():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");

	output("Shekka seems to be in abject disbelief, tapping her datapad over and over. <i>“I... I think we’ve done it, Steele. The compound is prepared. It’s out of my hands. A few clinical trials, and then a shake-down of that creepy no-sex doctor on the east-side, and I think we’re there.”</i>");
	output("\n\nWait, a shake-down? Shekka practically vibrates in her seat. <i>“Yeah! Go figure that some of the heavy lifting was done by that Lash creep. I basically had a team just double-checking his stuff incase he was </i>actually<i> trying to just end our race’s ability to reproduce entirely.”</i> she winces for a brief moment. <i>“He tried. Once. Something about getting him sent off to a sex-prison for trying to genophage a whole race kind of put that to a halt.”</i>");
	output("\n\nAn awkward silence stretches at the thought of the anti-sex crazed doctor being pushed into some kind of butt-breeding machine. Yeuch...");
	output("\n\n<i>“I... [pc.name]? Thank you. Thank you for saving my people from themselves. I don’t know yet how this will all turn out, but I’m hopeful!”</i> The pear-shaped, red-scaled beauty rubs at her eyes with one sleeve, suddenly starting to sniffle. <i>“I-I’m sorry, it’s just–”</i>");
	output("\n\nBefore her sniffles get a chance to devolve into fully-fledged sobbing, you haul her up and into your [pc.chest], nuzzling the soft quills of her hair. Shekka gulps down a deep breath, burying her face into you before slowly letting it out again. <i>“Alright, it’s cool. I’m cool. We’re all–meep!”</i> The mechanic’s attempt at pushing away proves entirely fruitless. It’s getting rather tempting to just sit there and enjoy her weight pressed down against you.");
	output("\n\n...Judging by how her luscious booty grinds in your lap, she seems content to sit and soak in the moment too. Those movements eventually fall still, and long before your [pc.legs] even get a chance to fall asleep, the little red Rask starts to snore gently. The problem now is what to do with her; the cheap stool does not make for a good snuggling spot. You slip your hands under her cushy rear-end and stand up, keeping her held up like a lover.");
	//If you have a cock(s)
	if(pc.hasCock())
	{
		output("\n\nThe sheer heat of her resting form has your");
		if(!pc.isErect()) output(" half-hard");
		else if(pc.lust() >= 80) output(" rock hard");
		else output(" tumescent");
		output(" [pc.cocksNounSimple] painfully trapped between you, making it an awkward mess waddling her towards a tiny bunk.");
	}
	//Else
	else output("\n\nYou move slowly and carefully, trying not to jog her with each awkward step towards a tiny bunk.");
	//Merge
	output("\n\nOf course, Shekka’s bed is a tiny (if wide) thing, covered in patched and re-patched blankets. At the very least there’s enough clearance above that you can sit upright on it. You do so, wincing at the dangerous creak of your combined weights on old-fashioned mattress springs.");
	output("\n\nThankfully it holds out, and she soon squirms her way back into comfort while you draw the blankets over her. It wouldn’t be a surprise if she’d barely slept over the past week.");
	//Before 8pm or after//
	if(hours < 20 && hours >= 5) output(" Although it’s a little early to be doing so, you can feel your own eyelids growing heavy at the rhythmic murring of alien snores.");
	else output("To be fair, you could do with a bit of sleep yourself, and there are worse ways to drift off than to the rhythmic murring of alien snores");
	output(".");
	//Next, set clock forwards six hours, change Shekka bust to Naked
	processTime(6*60);
	sleepHeal();
	clearMenu();
	addButton(0,"Next",shekkaCuddleSleepWakeup);
}

public function shekkaCuddleSleepWakeup():void
{
	clearOutput();
	showShekka(true);
	author("SomeKindofWizard");
	output("Something wakes you up, and it takes a few moments for the world to re-orient itself. Soft gasps in your ear and the scent of a horny woman waft into your [pc.nose]. Unconsciously, you shift, and Shekka lets out a little surprised yelp. Apparently at some point she got naked, and you can now see her greedily plumbing her slit with slick digits. <i>“O-oh! [pc.Name], uh... it’s... absolutely what it looks like.”</i>");
	output("\n\nShe nibbles at your neck and purrs sweetly, shock soon forgotten. <i>“I woke up in your lap and you just smelt so </i>good<i>! I had to... uh, sorry.”</i>");
	output("\n\nThere are worse things in the world to wake to... indeed the only issue is that <i>you</i> are");
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) output(" still dressed, and");
	output(" feeling far too warm after waking up buried underneath a horny girl.");
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) 
	{
		output(" You tell her as much, and she busily tears you out of it all, uncaring of how her fem-lube stained digits make a mess of them.");
		if(!(pc.lowerUndergarment is EmptySlot)) output(" A few moments later and your [pc.lowerUndergarment] joins the pile, and");
	}
	output(" Shekka practically drools at the feast of delights on display.");
	
	flags["SHEKKA_ISSUES"] = 7;
	flags["SHEKKA_CURE_TIMER"] = GetGameTimestamp();
	
	clearMenu();
	//If you have a dick and vag, else jump direct to dick/vag
	if(pc.isHerm())
	{
		output("\n\n<i>“Nothing I like more than being able to make a choice, but it all looks so good!”</i>");
		//Menu option; Dick (Jump to Dick)
		//Menu option; Vagina (jump to Vagooter)
		addButton(0,"Dick",cureRewardUseDick);
		addButton(1,"Vagina",vaginaSexWithShekkaOnCureThing);
	}
	else if(pc.hasCock())
	{
		addButton(0,"Next",cureRewardUseDick);
	}
	else if(pc.hasVagina())
	{
		addButton(0,"Next",vaginaSexWithShekkaOnCureThing);
	}
	else
	{
		output("\n\nUnfortunately, you have not genitals to have fun with...");
		
		addButton(0,"Next",mainGameMenu);
	}
}

//Dick (Use largest)
public function cureRewardUseDick():void
{
	clearOutput();
	showShekka(true);
	author("SomeKindofWizard");
	output("An exceptionally long tongue runs over her lips, and a low, throaty ‘murr’ rolls through her like an animal. ");
	var x:int = pc.cockThatFits(shekka.vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	//SmallDick
	if(pc.cocks[x].cLength() < 13) output("Her mouth opens as wide as it possibly can, tongue lolling out to trail gently over the cumslit of your [pc.cockHead " + x + "]. She follows it like an arrow, wrapping her maw around your pecker with an affirmative gulp. Her mouth swallows you whole, tongue lashing your shaft affectionately as her eyes look up at yours for approval.");
	else output("No matter how wide that mouth opens, it only belongs to a little face, but her tongue practically spools out, bathing your cumslit in drool as she drinks in the scent of you. She nuzzles at your shaft with a horny little growl, hands joining in to stroke and rub at you. Her eyes go from your mammoth member to your own [pc.eyes], hunting for confirmation.");

	output("\n\nMoans and groans erupt from her when your [pc.fingers] go through her quills, setting them to standing on end. A familiar buzzing hum joins the orchestra of lurid slurps as the vibrating tip of her tail kicks in, before slipping up beneath her spread legs to grind from top-clitty to bottom. Her affectionate worship of your prick continues like that until your ");
	if(pc.balls > 1) output("[pc.balls] feel as though they’re practically churning with unspent seed.");
	else output("prostate feels like it’s swollen to twice it’s size just trying to dam the reservoir of cum your body produces.");

	output("\n\nUnwilling to see the moment end so soon, you slip your [pc.hands] beneath the red lizard’s arms. Shekka whimpers as you haul her up and away from your cock, but those complaints only last for as long as it takes for you to capture her lips in your own, resting her nectar-dripping cunt flush with the tip of your dick. Her tongue tastes like the musky mixture of pre and saliva, but that is a point past caring once it’s entwined with your own [pc.tongue].");

	//Aphrodisiac tongue
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED))
	{
		output("\n\nIt’s impossible to miss the way her pupils turn to dinner plates, or the way her body-heat seems to double. You press your fingers into her great big ears and give them a grope, earning a high-pitched cry from your now-drugged lover. A practical swamp of sticky-sweet fem-juices splash against your crotch as your aphrodisiac saliva takes hold with a passion.");
		output("\n\nJudging by the way her pussy spreads open like a flower, and her eyes temporarily roll back, you’re fairly certain a wordless orgasm just rocketed its way through her body. It seems hardly fair–you’ve not gotten <i>yours</i> yet–so you plant a firm spank on the broad expanse of her callipygian bootie, reveling in the way it trembles and quivers afterwards. If anything Shekka only whimpers harder into your mouth, sucking on your tongue as much as she can. It’s impossible to wait any longer however, and you line your [pc.cock " + x + "] with her pliant fuck-hole.");
		pc.cockChange();
		output("\n\nYour whole being is swallowed and crushed down on with vice-like intensity by a soaking-wet furnace as your ");
		if(pc.cocks[x].cLength() >= 20) output("prick doesn’t so much as stop. In the same penetration, your [pc.cockHead " + x + "] batters its way past Shekka’s cervix before making its home in the very depths of her womb");
		else output("cock kisses at the entrance to Shekka’s womb, grinding against her cervix. Sadly you can’t quite reach your way into her womb, but the insistent jerks of her hips make it clear that when you cum it’ll be reaching just fine");
		output(". Whether she puts any thought into her motions, or it’s just nerveless instinct, Shekka’s pussy tightens up on every thrust in, and relaxes in time for her to ride forwards, grinding her little tits ");
		if(pc.biggestTitSize() < 1) output("against your own chest.");
		else output("against your far more massive mammaries.");
	}
	//Else
	else
	{
		output("\n\nShe’s a voracious little thing, desperately trying to drink in every detail about you. Her hands grasp at your [pc.chest], and her buzzing tail coils around one of your [pc.legOrLegs] with an affirmative squeeze. It’s enough to urge you on to planting her at the crest of your [pc.cockHead " + x + "] and push her down.");
		output("\n\nYour whole being is swallowed and crushed down on with vice-like intensity by a soaking-wet furnace as your ");
		if(pc.cocks[x].cLength() >= 20) output("prick doesn’t so much as stop. In the same penetration, your [pc.cockHead " + x + "] batters its way past Shekka’s cervix before making its home in the very depths of her womb.");
		else output("cock kisses at the entrance to Shekka’s womb, grinding against her cervix. Sadly you can’t quite reach your way into her womb, but the insistent jerks of her hips make it clear that when you cum it’ll be reaching just fine.");
		output(" Whether she puts any thought into her motions, or it’s just nerveless instinct, Shekka’s pussy tightens up on every thrust in, and relaxes in time for her to ride forwards, grinding her little tits ");
		if(pc.biggestTitSize() < 1) output("against your own chest.");
		else output("against your far more massive mammaries.");		
	}
	//Merge
	output("\n\nYou’ve never woken up with Shekka before, but it would seem her appetites are at their most potent... perfect for a little morning wood action, that’s for sure. She sits upright on one particularly deep thrust, crying out in pleasure and smashing her hips down hard enough to bruise lesser " + pc.mf("men","women") + ". <i>“C’mon [pc.name], I need this! Come! Fucking fill me up and make a mess of my bed!”</i>");
	output("\n\nThe look in her eyes is absolutely fanatic, and again the bed creaks dangerously as you squeeze her hips, holding her still so that you can assault her cunt with jackhammer thrusts. Her moans and cries hit a fevered pitch as she’s brought cascading to orgasm, squirting like a broad-bottomed fountain full of Raskvel sex-juices.");
	output("\n\nThe manic spasms of every wall of her pussy are what finally draw you over the edge as well. Everything tightens up into the singular sensation of your prostate clenching like a wound spring, and every ounce of cum your body can dredge up being ejaculated. Shekka simply collapses onto you, whining and moaning now that she’s already pleasure-screamed herself hoarse.");
	
	var cumQ:Number = pc.cumQ();
	//Knot
	if(pc.hasKnot(x))
	{
		output("\n\nSadly before you get a chance to lock her writhing body to you with your [pc.cock " + x + "]’s blood-engorged knot, a hard jerk of her hips has you growing on the <i>outside</i> of her cum-hungry cunny. Not necessarily a bad thing; now your knot gets to slam into both her front and rear clits at the same time while your cum ");
		if(cumQ < 3000) output("leaks");
		else output("rushes titanically");
		output(" out of her well-abused slit.");
	}
	//No Knot
	else
	{
		output("\n\nShe’s so damnably wet however that it only takes a few errant jerks of her hips to have your cock flopping out of her cum-basted cunt. At the very least you get to ");
		if(cumQ < 2000) output("enjoy the sensation of your mixed cum pooling out beneath you");
		else output("smirk as your seemingly endless reserves have you painting her entire backside with dripping alabaster");
		output(".");
	}
	//Merge
	output("\n\nIt takes at least a few more minutes for the both of you to come crashing down from the sexual high, although Shekka still occasionally twitches in the aftershocks of pleasure. <i>“Sweet fucking stars... I’m not sure what even came over me...”</i> she nuzzles your chest and wipes a little sweat from her brow.");
	output("\n\nAfter you’ve both cooled down properly, and wiped yourselves off, the little Raskvel tiptoes and pulls you down for a quick kiss. <i>“Thank you again, [pc.name]. I’ll uh... I’ll let you know how distribution goes. Okay?”</i> You give her an affirmative nod, a ruffle of her quilly-hair, and return to your adventure.");
	IncrementFlag("TIMES_SEXED_SHEKKA");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Vagina (Use tightest?)
public function vaginaSexWithShekkaOnCureThing():void
{
	clearOutput();
	showShekka(true);
	
	var vIdx:int = pc.tightestVaginaIndex();
	
	output("An exceptionally long tongue runs over her lips, and a low, throaty ‘murr’ rolls through her like an animal. Her hands are moist with her own juices as they squeeze at your thighs, digging into fat and flesh hard enough to sting.");
	output("\n\nNot that you notice one-hundred percent. Most of your attention is taken up by the way Shekka mashes her nose up against your womanhood, nuzzling your [pc.clit " + vIdx + "] out of its hood. Your [pc.hands] run through the downy pink quills of her hair before gripping the bases of her ears like sexual handlebars. The smaller girl moans into your mons as she’s forced to guzzle down the scent of horny [pc.race].");
	output("\n\nIt also proves to drive her a little wilder; her tail flicks around, tip buzzing as she jams it hard into her own cunt with an audible ‘squish’. You indulge in her needs, rolling your hips against her face, moaning loudly and groping her large floppy ears until she’s whining into your slit. <i>“Mnf-more!”</i> she gasps between licks and kisses, before sucking at the lips of your [pc.pussy " + vIdx + "] until they’re plumped up.");
	output("\n\n<i>“C’mon”</i> you moan, squeezing her ears a little harder before rubbing them. Shekka’s muff-muffled moans turn to a cry of surprise, and her tail thrashes about wildly. With a smirk, you tweak her nose <i>“Wait, did you just cum?”</i>");
	output("\n\n<i>“Sh-shut up, [pc.name]... fuck you’re so tasty.”</i> the horny rask mutters, before her tongue slowly unfurls. Your juices are dripping down her chin, mixing with saliva while her expansive hips wiggle. It takes a moment’s effort to draw her tail from her sopping twat, and it vibrates in the open air, dripping her honey freely onto the bed. If the lower lips of your [pc.vagina " + vIdx + "] weren’t already drenched from foreplay, just the sensation of her boiling-hot tongue flicking at your clit would be enough to make you juicier than an Ausar in heat.");
	output("\n\nHer hands finally shift from your thighs, revealing deep red marks where she’d been holding on for dear life. One rests ");
	if(pc.hasCock()) output("at the base of [pc.oneCock] like a sturdy handhold");
	else output("on your [pc.stomach] to keep her body somewhat upright");
	output(", while the other makes for your womanhood. She parts your folds like an opening flower, purring at the sight of freshly-flowing nectar before her tongue begins its work at last.");
	output("\n\nShekka’s tiny mouth opens surprisingly wide as she presses it against your twat once more. Her moans vibrate deep into the core of your womb, and her tongue plunges into your [pc.vagina " + vIdx + "]. For such a small figure, her oral ministrations grind at sensitive walls and folds deep within your body on the perpetual hunt for your g-spot.");
	if(pc.hasCock()) output(" The hand wrapped around your prick begins to jerk slowly. Although it’s obvious her vaginal exploration is the main focus, there’s no reason you can’t enjoy pleasure from both ends.");
	output(" The hand holding the lips of your [pc.pussy " + vIdx + "] apart creeps south, using your wetness for lube to penetrate your puckered [pc.asshole].");

	output("\n\nYour hips jerk a few nerveless times on a particularly attentive lick, and Shekka’s tongue seems to hone in on the sensitive spot. Her lips grind against your [pc.clit " + vIdx + "], her finger bangs your rear, and now her sinuous tongue constantly lashes at an over-active bundle of nerves. Somehow you manage to keep yourself <i>mostly</i> still, lest poor Shekka gets thrown to the bed before reaching your creamy center.");

	//Futa
	if(pc.isHerm()) 
	{
		output("\n\nAll the while the finger grinding in your rear end becomes more and more insistent; it’s too small to reach your prostate, but her dexterous digits still manage to apply some pressure. Thick pre leaks from your cumslit, only to be shaken free by her ravenous handjob. Your body grows flush with tension as you’re pleasured on three fronts by a single girl; even moreso when you catch her eyes looking up at you with earnest hunger.");
		output("\n\nIt becomes impossible to hold back under the onslaught, and your body tightens up so quickly that poor Shekka’s finger and tongue are trapped in your body. Not that the Raskvel’s plight keeps you from crashing hard into a mind-wiping orgasm. Your cunt gushes like a fountain of thick, sweet [pc.girlCum], flooding Shekka’s mouth. With her tongue trapped in your clenching cunny, she struggles to swallow, instead snorting some from her nose. Her surprised expression is soon obscured as your ");
		if(pc.cockTotal() > 1) output("[pc.cocks] join");
		else output("[pc.cock] joins");
		output(" in on the fun ");
		if(pc.cumQ() >= 2000)
		{
			//big cummies//
			output("and go");
			if(pc.cockTotal() == 1) output("es");
			output(" off in thick ropes of potent cock-sauce. Shekka’s face, hair, and ears are liberally coated in your [pc.cum], and a delighted wiggle from her body soon has it trailing down her back and into the crack of her ass.");
		}
		else
		{
			output("and blast");
			if(pc.cockTotal() == 1) output("s");
			output(" upwards before landing on her face. It isn’t a massive load, but catching her right between the eyes does earn a muffled giggle of amusement.");
		}
	}
	//Else
	else
	{
		output("\n\nAll the while the finger grinding in your rear end becomes more and more insistent; there isn’t anything back there for her to tease properly, but having your [pc.asshole] stretched and teased is a welcome addition. Your body grows flush with tension as you’re pleasured on two fronts by a single girl; even moreso when you catch her eyes looking up at you with earnest hunger.");
		output("\n\nIt becomes impossible to hold back under the onslaught, and your body tightens up so quickly that poor Shekka’s finger and tongue are trapped in your body. Not that the Raskvel’s plight keeps you from crashing hard into a mind-wiping orgasm. Your cunt gushes like a fountain of thick, sweet [pc.girlCum], flooding Shekka’s mouth. With her tongue trapped in your clenching cunny, she struggles to swallow, instead snorting some from her nose.");
	}
	//Merge
	output("\n\nShekka gargles noisily, spitting your juices and saliva back onto you as her tongue fights to return to its home. When she finally manages to recover her various bits and pieces, she flops onto your tummy, nuzzling at your ");
	if(pc.tone >= 70) output("abs");
	else output("belly-squish");
	output(" in blank-minded fondness. <i>“Fffuuuck...”</i> eventually comes the groan from her, and you give her a slow pat on the head");
	if(pc.hasCock()) output(", wiping away a little cum");
	output(".");

	output("\n\nAfter you’ve both cooled down properly, and wiped yourselves off, the little Raskvel tiptoes and pulls you down for a quick kiss. <i>“Thank you again, [pc.name]. I’ll uh... I’ll let you know how distribution goes. Okay?”</i> You give her an affirmative nod, a ruffle of her quilly-hair, and return to your adventure.");
	processTime(30);
	IncrementFlag("TIMES_SEXED_SHEKKA");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Progress Emails
//After The Cure is ready, the button greys out, hover-over reads “The Cure is in progress, you’ll have to wait and see.”

//First Children Born
//A week after The Cure is Ready
public function cureProgress1Email():String
{
	return ParseText("Hey [pc.name]! I’ve gotten some decent rest, and <i>finally</i> some of the tension has gone. I’ve just seen the first batch of children born! I know it should have all gone just fine, but I couldn’t help being nervous right up until those eggs hatched.\n\nThe first children are looking happy and healthy. Their parents are very much the same as usual, but soon we’ll see how the kids’ brains develop.\n\nA few of the matrons who were worried we were doing something bad to their children have relaxed at least. Apparently some pornstar said that curing all of their possible defects and helping their children develop would make them all ugly or stupid or something.\n\nIt got surprisingly high traction. Bleh. I’m already missing your company, it’s making me feel grouchy and old. On the plus side, about 1000% more of us are actually going to reach our race’s potential ‘Old Age’. Ever seen a Grandma-Rask? I thought I was going to be the only one to get that far along without a egged-out pussy you could climb into.\n\nI’m just about to curl up in bed with a cup of something warm to drink. I met a nice captain and we fooled around for a bit, but they’ve already up and left now. Stay safe, okay? I’ll keep in touch.\n\nLots of Love,\n\tShekka\n\n(<i>Oh! Now that’s a treat. A little attachment on the mail shows Shekka bent over her bed, ass up in the air, tail-up. Her winking ring and delicious pussy spread wide by her eager fingers.</i>)");
}

//Spelling and Reading Tests
//A week after message one
public function spellingAndReadingTestsMailText():String
{
	return ParseText("Hi [pc.name]. Hopefully not bothering you right now, but look! I’m super fucking proud.\n\n<i>What follows next in the email is a few screencaps of IQ test results. They seem... decidedly average except for one or two.</i>\n\nI know what you’re thinking; except for kid four and eight, that’s pretty average right? Well, most of our IQs look like that. The important part is how we do in practical spelling and reading tests.\n\nDirectly after that statement are a few more screengrabs, one appears to be a former examination block... it’s all surprisingly low. Half of it isn’t even completed. Below that though are a section of properly completed, reasonably well scored exams.\n\nWithout having a big old “time to fuck” button smashed into our thinking meats, it’s pretty hard to get anything done past the biological need to keep our species from getting squashed. These new kids aren’t so attention deficit. They’re <i>concentrating</i>, [pc.name]. How amazing is that?!\n\nSorry, I got carried away. It’s really exciting seeing the future of your people. I mean, eventually the children get to be our future. But, you know, for real.\n\nAnyway, I’ll leave you to whatever you’re balls-deep in. Take care Steele.\n\nLove’n’hugs\n\tShekka\n\n(<i>Another tasty little photo seems to have been thrown on the end of her message. She’s seated on her work-bench, legs spread wide as she cums around a vibrator as thick as your arm. Mnf.</i>)");
}

//Hey...
//Three days after message two
public function lastRaskvelCureEmail():String
{
	return ParseText("Hi [pc.name].\n\nIf I’m honest, I don’t really know how to word this. I’m going to opt for blunt and hope that’s the right way to handle things. My work here on Tarkus feels done. Done and dusted. Children are going to grow up into healthy adults, and lead my people onwards to something bright alongside the UGC. Or maybe just as corrupt as half of it. Regardless? Not really my problem.\n\nI’m just a mechanic, and I enjoy sex even if the end result isn’t going to be kids. These boys and girls are going to grow up and develop the actual skills to rule a people. I’m done growing up, the Cure isn’t going to do anything for me.\n\nAnd I kind of want off of this damned rust-ball. After all you’ve done this may sound like way too much to ask for. But could you allow me to join your ship? I don’t take up much space, and I can fix up any damage faster than anyone. I’d like to go with you, out there where it’s an adventure... and where the adventure is with you.\n\nWhat do you say? Please could you come down and see me?\n\nLots of Love,\n\tShekka");
}

//Join Crew - First Time
//After getting the third email “Hey” from Shekka, returning to her will immediately begin this conversation line.
public function shekkaJoinCrewOffer():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("You step through the threshold into Shekka’s place, noticing a few differences. For one; her usually-cluttered bench is practically spotless, but for a picture-frame that continues to gently flicker through different pictures of young rasks of all shape and color. Perhaps some of the ‘first batch’ of kids.");
	output("\n\nThere’s a clattering sound in the distance and a mutter of <i>“Why the fuck did I keep half of this crap?”</i> You call out into the Widget Warehouse, and there’s an alarmed yelp accompanied by the sounds of a crunching box and falling metal. <i>“I’m okay!”</i>");
	output("\n\nShekka climbs into view, wiping some smeared oil off of her face with a muted ‘blech’. It takes a few moments, but she snaps back to reality. <i>“Oh! Right... you’re probably here to talk about... y’know...”</i> she takes a deep breath and folds her arms beneath a petite chest.");
	output("\n\nShe takes a few more moments to steel herself before continuing, eyes big and earnest. <i>“You’ve been so damned wonderful, and done an amazing thing for my people. I’d like to join up with you... and spend more time with you. I’ll fix up your ship, keep you company... and keep you company.”</i> The extra emphasis on ‘company’ that second time gives you a pretty good idea of what that means.");
	output("\n\n<i>“What do you think?”</i>");
	processTime(20);
	//Two options: Welcome (hovertext: this will invite Shekka to live on your ship)
	//Not Yet (hovertext: turn her down gentle, she’ll wait for you.
	clearMenu();
	addButton(0,"Welcome",welcomeShekkaToTheTeam);
	addButton(1,"Not Yet",noFollowerYetShekka);
}

//Welcome
public function welcomeShekkaToTheTeam():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	//Bimbo
	if(pc.isBimbo()) 
	{
		output("Ohmigosh. Another cutie bootie on the ship? As if you could turn such a thing down! You draw her up into a ");
		if(pc.biggestTitSize()) output("big squishy boob-snuggle");
		else output("firm hug, nuzzling at her feathery hair");
		output(". The poor surprised Raskvel squirms before letting out a relieved sigh, tail squirming around. <i>“Think you could help me pack up some stuff and take it back to your ship?”</i>");
		//Next: Advance time half an hour, change location to ship.
	}
	//Bro
	else if(pc.isBro())
	{
		output("Hah, as if you could turn down an extra nerd on-ship, especially one with such a wonderfully fuckable body as hers. She blushes at your roughly-worded praise, tail wriggling nervously around. <i>“Awesome... think you could put those muscles of use and help me carry some stuff back to the ship?”</i>");
	}
	else
	{
		output("Nothing would make you happier than to have more company on your ship. Hopefully she’ll fit just fine. Shekka bounces happily, ears jangling in time with her excited tail-wiggling. <i>“Woo-hoo! Time to get the fuck off of this worthless trash-heap and hit the stars!”</i> She practically buzzes, and you have to place a hand on her head to keep her from jumping. With a smirk, Shekka looks up and kisses your palm. <i>“Think you could help me carry a few boxes back then? I’m nearly done packing.”</i>");
	}
	//Next: Advance time half an hour, change location to ship.
	processTime(30);
	clearMenu();
	addButton(0,"Next",welcomeShekkaToTheTeam2);
}

public function welcomeShekkaToTheTeam2():void
{
	clearOutput();
	showShekka();
	currentLocation = "SHIP INTERIOR";
	generateMap();
	author("SomeKindofWizard");
	output("<i>“Your ship is so, so neat. Look at the style of it! Your father had great taste.”</i> Shekka says, looking around with no small amount of awe. She rests her hands on her exceptional hips, gears turning behind her eyes.<i>“What happens next? I realize now I don’t really get the whole... entirety of your mission then. Or is it really just one great big sexy party? I’m cool with either.”</i>");
	//You have Anno:
	if(annoIsCrew())
	{
		output("\n\nBefore you respond, there’s a gasp of surprise, and a snowy-white bundle of fur piles past you, pouncing onto Shekka. <i>“Got you! Y–oh. </i>Oh<i>, uh... sorry there Shekka. I thought you were someone else. Some twat’s been trying to salvage a piece of our engine for the past hour and I’ve just about started to consider lethal force.”</i>");
		output("\n\nShekka blinks in disbelief <i>“...I’ve just joined the crew. Hi Anno.”</i>");
		output("\n\nIt’s the curvy pup’s turn to blink a few times, before her tail begins beating hard from side-to-side. <i>“You are going to love adventuring. We can check out all the bars, I can introduce you to my girlfriend! You will have no idea what or who to do first!”</i>");
		output("\n\nWith a sigh, you slip your hands beneath Anno’s arms, lifting her off of the poor stunned girl. She pouts, pulling a puppy-dog-eyes that could melt stone... although her furiously-wagging tail betrays her amusement. Shekka pulls herself up, dusting her ass off. <i>“Way to spoil the moment.”</i>");
		//Next: back to ship menu as normal. Shekka is now in the Crew tab.
	}
	//You don’t have Anno
	else
	{
		output("\n\nYou click your tongue idly and consider all that you’ve gotten up to thus far... it does seem rather more like a highlight-reel of sexual antics as opposed to searching for probes. Shekka rolls her eyes, cracking her knuckles and going for a little exploration. <i>“Well, I might as well get myself settled in. Call me if you need me, [pc.name]... and uh, thank you again.”</i>");
		//Next: back to ship menu as normal. Shekka is now in the Crew tab.
	}
	flags["SHEKKA_RECRUITED"] = 1;
	flags["SHEKKA_ONBOARD"] = 1;
	output("\n\n(<b>Shekka has joined your crew!</b>)");
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Not Yet
public function noFollowerYetShekka():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Her expression sinks, and somehow her hanging ears seem to droop a little more. <i>“Aw... I understand. I won’t make things weird. Just... keep me in mind if you’re ever after a mechanic. Okay? You are still the most amazing person for everything you’ve done.”</i>");
	flags["SHEKKA_RECRUITED"] = 0;
	//Next: back to Shekka’s talk menu, Join Crew is now a button.
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Join Crew
public function shekkaRepeatJoinCrew():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("<i>“Change your mind, [pc.name]? I’d be happy to go whenever.”</i> The shortstack rask smiles softly, flapping her jangling ears out with her hands and ruffling her hair.");
	//Welcome or Not Yet; same as First time
	processTime(2);
	clearMenu();
	addButton(0,"Welcome",welcomeShekkaToTheTeam);
	addButton(1,"Not Yet",noFollowerYetShekka);
}