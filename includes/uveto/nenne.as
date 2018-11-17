import classes.Items.Recovery.HealingPoultice;
import classes.Items.Combat.AphroDaisy;
import classes.Items.Transformatives.KorgonneSnacks;

//Overview:
//This is my (B, the one and only!) submission for the Korg’ii hold: a shopkeeper by the name of Nenne.

//Nenne is an older Korgonne; Fenoxo had written that if he were to do the shopkeeper, he’d write an older, infertile lady. Nenne is a MILF and knows her way around her own body, and while she’s a bit older, she’s not exactly a granny. I was kind of going for a Dogmom-sort-of feel for her: thick, experienced, and sensual. She doesn’t have the energy she used to have, but she knows that sex isn’t a race, although you both want to cross the finish line.

//As a shopkeep, she offers a number of herbal items, as well as a transformative to turn the PC into a Korgonne themselves. She also sells a once-per-combat healing poultice and ‘explosion weed bombs.’ This will be my first attempt at writing a shopkeeper – I hope it goes well!


//She’s sexable, of course, with at least one scene per gender (and maybe a third for characters with no gender, I haven’t decided yet. Especially if I only have a max wordcount of 10,000). The Korg’ii Hold doesn’t accept credits until the PC has completed a quest involving the princess, so, in order to get any of Nenne’s items, you’ll have to entertain her for a little bit. This doesn’t necessarily mean sex, but she definitely wouldn’t say no. The more items you get for free, the more you have to entertain her.

/*
NENNE_SEX_CREDITS	- Number of sex credits banked up
NENNE_FREEBIES		- Number of free items boughted~
nenneItemCost()		- Number of sex credits needed for a freebie
NENNE_TAKES_CREDS	- If you've talked to Nenne about taking credits
*/

public function showNenne(nude:Boolean = false):void
{
	var nudeS:String = "";
	if(nude) nudeS = "_NUDE";
	showBust("NENNE" + nudeS);
	author("B");
	showName("\nNENNE");
}

public function nenneItemCost():Number
{
	if(flags["NENNE_FREEBIES"] == undefined) return 1;
	else if(flags["NENNE_FREEBIES"] + 1 > 7) return 7;
	else return flags["NENNE_FREEBIES"] + 1;
}

// The PC enters a shop called ‘Herbs & Happy’ for the first time
// (scene: Herbs And Happy)
public function herbsAndHappyBonus():Boolean
{
	if(flags["MET_NENNE"] == undefined)
	{
		showNenne();
		output("You enter what appears to be a shop, chiseled into the stone of the Korg’ii hold; outside is a simple, finger-painted sign displaying some grass, or perhaps herbs, followed by some alien text that you had difficulty translating. You surmised it to be some kind of herbal shop – perhaps this place offers natural medicines and the like? Only one way to find out.");
		output("\n\nThe room just beyond the entrance is a little cozier than you had anticipated: it is little more than a foyer for a larger residential apartment. Another opening to your right, chiseled into the stone, leads and bends into where the shopkeeper must live. Before you is a crude stone chair that’s a little small, but the seat’s been carefully smoothed and rounded to provide as much comfort as possible; behind it is a number of small holes, carefully drilled and pockmarked into the stone, where mosses, herbs, plants, grasses and vines are stored and spill out of.");
		output("\n\nStanding before all of that is a Korgonne, fussing beneath the holes in the walls, carefully sorting the spilled greens with her pawed hands. She turns to look at her customer, and you see the greying lines around the mouth of her snout and the frayed, limp tips of her ears. She’s clearly a bit older than some of the other Korgonne around the hold.");
		output("\n\n<i>“Hello!”</i> she says, finishing up her task before properly tending to you as her customer. <i>“");
		if(!korgiTranslate()) output("Name of Nenne, welcoming you to Herbs And Happy!");
		else output("My name is Nenne, and welcome to Herbs And Happiness!");
		output("”</i>");
		output("\n\nNenne moves a little slower than you’ve seen most Korgonne move, but you attribute that to her apparent age. Her disposition is nonetheless as cheerful and excited as you’ve come to expect from a Korgonne.\n\nYou introduce yourself to the older Korgonne with a smile.\n\n<i>“");
		if(!korgiTranslate()) output("I can being of help for you, [pc.name]?");
		else output("How can I help you today, [pc.name]?");
		output("”</i>");
		flags["MET_NENNE"] = 1;
		processTime(2);
		herbsAndHappyMenu();
		return true;
	}
	// The PC enters Herbs & Happy, subsequent times
	else
	{
		showBust("NENNE");
		output("You return to your favorite apothecary within the Korg’ii hold. Sitting on the simple stone chair, weaving strands of ivy into braids to sell, is Nenne; she hums to herself in absent-minded contentment, but as soon as you enter the room, she places her plants in their appropriate slot and stands to greet you.");
		addButton(0,"Nenne",approachNenne);
	}
	// end scene (scene: Herbs And Happy)
	return false;
}

public function approachNenne(back:Boolean = false):void
{
	clearOutput();
	showNenne();
	if(back) output("What else would you like to do with Nenne?");
	else
	{
		output("<i>“");
		if(!korgiTranslate()) output("Happy at seeing you again, [pc.name]!");
		else output("It’s good to see you again, [pc.name]!");
		output("”</i> she says, her long tail swishing from side to side behind her. <i>“");
		if(!korgiTranslate()) output("I can being of help for you?");
		else output("How can I help you today?");
		output("”</i>");
	}
	//[=Appearance=][=Shop=][=Talk=][=Leave=]
	herbsAndHappyMenu();
}

public function herbsAndHappyMenu():void
{
	clearMenu();
	addButton(0,"Appearance",nenneAppearance,undefined,"Appearance","Take a look at her.");
	addButton(1,"Shop",shopNennes);
	addButton(2,"Talk",talkToNenne,undefined,"Talk","Speak, girl!");
	addButton(14,"Leave",mainGameMenu);
}

//[=Appearance=]
// (scene: Nenne’s Appearance)
public function nenneAppearance():void
{
	clearOutput();
	showNenne();
	output("Nenne stands at about five feet tall, using antiquated Imperial measurements, which is about average for a Korgonne. Her fur is silvery-white, but her age is beginning to catch up to her and some of her illustrious silver fur has been dulled to a plain, boring grey.");
	output("\n\nHer eyes are as sharp as ever; they watch your every movement and drink in every facet of your form with pale-green irises around horizontal pupils. Her face is slightly angular compared to the button-snouts of the rest of the Korgonne, but only just, and is still capped with the same round, buttoned black nose as all the others.");
	output("\n\nThe fur around her mouth, and cupping underneath her eyes, have long, thick streaks of grey; her shoulder-length hair has turned duller and darker compared to her brighter fur; and the rounded tips of her ears are flayed and unkempt with loose ends. Her teeth are still healthy, but are mildly discolored with time. Her hands remain steady, but the fur is matted and grey starting at the wrist and going to her fingers – her left hand is even missing a bit of fur.");
	output("\n\nDespite all the signs of her age, she is far from over the hill, and she carries herself like she knows it. Her fur maintains its silver sheen throughout most of her body and is well-groomed along her limbs and torso, up to her neck. Her stance is wide, to go with her breeder’s hips – it’s obvious that she’s had more than a few pups of her own in her time, and she carries her body like she’s not done yet. A pair of thick, heavy breasts sit high on her chest that you’d ballpark to be double D’s, each capped with a black pebbly nipple; time has given them a little bit of sag, but they’re holding up fairly well, considering.");
	output("\n\nHer thighs are just slightly wider than her shoulders, giving her a plush, soft rump that bounds with her every step; she clearly doesn’t care to keep her bum especially tight, and it’s expanded behind her slightly. A tail sprouts just above her generous behind, reaching down to the floor beneath her, and with fur making her tail appear as thick around as her leg. Between her legs rests her Korgonne cooch; the fur around it is naturally darker than the rest of her, but still grey, and it’s difficult to see if it’s showing any signs of age or wear-and-tear on its own. From where you’re standing, it appears to be a model Korgonne vagina.");
	output("\n\nYou can’t see it from here, but you assume she has a butthole beneath her tail and placed between her copious cheeks, right where it belongs.");
	// end scene (scene: Nenne’s Appearance)
	clearMenu();
	addButton(0,"Next",approachNenne,true);
}

//[=Shop=]
// Grey out all options except [=AcceptCredit?=] if the PC is coming straight here from the main menu, and the Korg’ii hold does not yet accept credits.
// (scene: H&H Inventory)
public function shopNennes():void
{
	clearOutput();
	showNenne();
	output("You tell Nenne that you’re here to browse, and you’d like to see what she has available for you.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Yes! Plants of many good uses; poultices to pain-away and poisons for itching and burning. Also, plenty vitamins for... keeping nice fur,”</i> she says with a wink. <i>“Browse, please!");
	else output("Of course! I have herbs and plants for plenty of everyday uses; I offer poultices that can help ease pain on your skin, or, if you’re out in the cold, I can offer you some poisons to help protect yourself from predators. And, if you’re interested, I have some all-natural vitamins that will... keep your fur nice and clean,”</i> she says with a wink. <i>“Feel free to browse all you like.");
	output("”</i>");

	//[=Poultice=][={Transformative}=][=Itchy Weed=][=Hot Moss=][=AphroDaisy=][=AcceptCredit?=][=Back=]
	clearMenu();
	addItemButton(0, new AphroDaisy(), buyFreebieNenneItem,new AphroDaisy());
	addItemButton(1, new HealingPoultice(), buyFreebieNenneItem,new HealingPoultice());
	addItemButton(2, new KorgonneSnacks(), buyFreebieNenneItem,new KorgonneSnacks());
	if(nenneFreebies() == 0) 
	{
		output("\n\n<b>You can’t get any items for free right now...</b>");
		setButtonDisabled(0);
		setButtonDisabled(1);
		setButtonDisabled(2);
	}
	if(flags["NENNE_SEX_CRED_OFFER"] != undefined && !korgiiCredits()) 
	{
		if(silly) addButton(5,"Credits?",nenneAcceptCredits,undefined,"Accept Credits?","Nenne’s offered you any one thing in her shop for free, provided you fuck her hot, Korgonne-milf ass until she’s a quivering, senseless mush on the floor.");
		else addButton(5,"Credits?",nenneAcceptCredits,undefined,"Accept Credits?","Nenne’s offered you any one thing in her shop for free, provided you ‘satisfy’ her craving for some ‘conversation.’");
	}
	else if(korgiiCredits() && flags["NENNE_TAKES_CREDS"] != undefined) addButton(5,"Use Credits",nenneAcceptCredits,undefined,"Use Credits","Nenne accepts " + (isAprilFools() ? "dogecoin" : "credit") + " in her store, but she’s still willing to trade you something of hers in exchange for a bit of attention.");
	else addButton(5,"Credits?",nenneAcceptCredits,undefined,"Accept Credits?","Ask Nenne if she accepts credits as a form of economy in her shop.");

	addButton(14,"Back",approachNenne,true);
}
public function nenneFreebies():Number
{
	if(nenneItemCost() <= flags["NENNE_SEX_CREDITS"]) return 1;
	return 0;
}

public function buyFreebieNenneItem(arg:ItemSlotClass):void
{
	clearOutput();
	showNenne();
	output("Nenne hands you your chosen item with a blush and a wink.\n\n");
	quickLoot(arg);
	flags["NENNE_SEX_CREDITS"] = 0;
	IncrementFlag("NENNE_FREEBIES");
	eventQueue.push(shopNennes);
}

//[={Transformative}=]
//// Tooltip: According to Nenne, this little plant, when ingested, promotes healthy fur growth and maintenance. You’re sure that eating the local fauna would do much more to you than that....\n\nCost: 15 Credits
//// I was told not to write much about the Korgonne transformative, so this placeholder a little more bare-bones than usual.
//
//[=Itchy Weed=]
//// Tooltip: When any part of this weed makes contact with any part of a person’s body, whether they’re skin, fur, or scales, it causes an intense, itchy sensation on the afflicted area. The weed is wrapped in a white fabric; the fabric is safe to touch, but the binding is very fragile and will come undone with enough force – such as, say, when it makes contact with a body once it’s thrown.\n\nDoes {x} Kinetic damage over {x} turns\n\nCost: 75 Credits
//// I always get laughed at when I try to balance combat stuff, so I’ll leave this item’s effects up to Fen. I was thinking that it would be a less-effective, but cheaper, alternative to the Hot Moss.
//
//[=Hot Moss=]
//// Tooltip: This dark-green moss is kept in a clear capsule; the plant is slightly submerged in a yellowish, sloshing oil. The moss itself doesn’t emanate any heat, but when it makes contact with any skin, fur, or scale, it releases oil that causes an igniting sensation on the body. The sensation doesn’t last long, but worsens over time. Hot Moss is the most dangerous organic weapon available to the Korg’ii, and must be handled with care. <i>Keep away from eyes and genitals.</i>\n\nDoes {x} Burning Damage that increases over time\n\nCost: 125 Credits
//// I was thinking that this item does Burning damage that increases over time until, I dunno, turn four or five, when it stops working all together. That’s not up to me, though, of course.
//


//[=AcceptCredit?=]
// Tooltip: Ask Nenne if she accepts credits as a form of economy in her shop.
// Tooltip (already selected; does not accept credit): Nenne’s offered you any one thing in her shop for free, provided you ‘satisfy’ her craving for some ‘conversation.’
// Tooltip (already selected; does not accept credit; Silly Mode on): Nenne’s offered you any one thing in her shop for free, provided you fuck her hot, Korgonne-milf ass until she’s a quivering, senseless mush on the floor.
// Tooltip (already selected; accepts credit): Nenne accepts credit in her store, but she’s still willing to trade you something of hers in exchange for a bit of attention.
// (scene: H&H Credit)
public function nenneAcceptCredits():void
{
	// Continue here if she does not.
	if(!korgiiCredits())
	{
		clearOutput();
		showNenne();
		output("As you browse along Nenne’s wares, you notice that each little hole that houses her plants and herbs has a number of little scratches beneath them. They don’t look informative enough to be names or descriptions, so you surmise them to be price tags. But all you have are credits. You turn to her and ask if she accepts them.");
		flags["NENNE_SEX_CRED_OFFER"] = 1;
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Credits? What those?");
		else output("What are credits?");
		output("”</i> she asks, her eyes narrowing in confusion. Well, that answers that. You explain that, unfortunately, credits are all you have, and if she can’t accept them, then you don’t have much business here.");
		output("\n\nShe hums in thought, folding one arm beneath her large breasts and resting the other on top of it, and her chin on her wrist. Her eyes scan you from head to toe, her tail swishing absently behind her as she considers your plight.");
		output("\n\n<i>“");
		if(!korgiTranslate()) 
		{
			output("You cute");
			if(pc.race() != "korgonne") output(". For an alien");
			output(",");
		}
		else
		{
			output("You know, you’re awfully cute");
			if(pc.race() != "korgonne") output(". For an off-world alien");
			output(",");
		}
		output("”</i> she says out-of-turn, her eyes blatantly studying your body. <i>“");
		if(!korgiTranslate()) output("Dealing: no need trade. Giving planties for free! But, something done for me.");
		else output("I’ll make you a deal. We don’t need to trade anything; I’ll give you anything in my stock for free. But you need to do something for me in return.");
		output("”</i>");
		output("\n\nGiven what you know about the Korgonne, and how Nenne is damn-near humping you with her eyes, you can guess what she might want from you in exchange. Still, you play along; you relax your body and lean against a stony wall, and ask her what you could <i>possibly</i> offer her in return.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Nenne lonely old Korgonne. Nobody enjoy talky talk no more; nobody appreciate Nenne’s... ‘company.’ You time being with Nenne, and Nenne reward with free herb or plant. Good hearing?");
		else output("Nobody ever comes to my shop to speak with me anymore. I haven’t had a good sit-down conversation with anyone in years, much less have anyone enjoy what... ‘good company’ an experienced Korgonne like myself can ‘provide.’ If you spend some time with me, I’ll give you any one thing from my selection for free. Sound good to you?");
		output("”</i>");

		output("\n\nWhile she’s saying she just wants to enjoy a decent company, you’re also hearing her undertones loud and clear. If you want something for free from Nenne, you’ll need to ‘satisfy’ her ‘need’ for some good ‘conversation.’ That doesn’t sound like such a bad deal to you.");
		clearMenu();
		addButton(0,"Next",approachNenne,true);
	}
	// Continue here if she does.
	else
	{
		shopkeep = chars["NENNE"];
		
		flags["NENNE_TAKES_CREDS"] = 1;

		shopkeep.keeperBuy = "As you browse along Nenne’s wares, you notice that each little hole that houses her plants and herbs has a number of little scratches beneath them. They don’t look informative enough to be names or descriptions, so you surmise them to be price tags. But all you have are credits. You turn to her and ask if she accepts them.\n\n<i>“";
		if(!korgiTranslate()) shopkeep.keeperBuy += "Princess saying to me that " + (isAprilFools() ? "dogecoin" : "credit") + " is good!";
		else shopkeep.keeperBuy += "Tribe says credits are good for trade now thanks to Nayna,";
		shopkeep.keeperBuy += "”</i> Nenne says, smiling toward you. <i>“";
		if(!korgiTranslate()) shopkeep.keeperBuy += "Okay to taking herbs if I am okay to taking credits. Good trade!";
		else shopkeep.keeperBuy += "It’s still not my preferred economy, but if it’s good for the princess, then it’s good for me.";
		shopkeep.keeperBuy += "”</i>";

		shopkeep.keeperBuy += "\n\nShe pulls forward, one finger trailing down your arm gently as her eyes lock onto yours. <i>“";
		if(!korgiTranslate()) shopkeep.keeperBuy += "But trading in together-time still offer good, cuteness";
		else shopkeep.keeperBuy += "But my offer to give you something for free in exchange for some time together is still on the table, cutie,";
		shopkeep.keeperBuy += "”</i> she says, her voice low and dripping with sensuality.";

		shopkeep.keeperBuy += "\n\nIf you’re in the mood to make something else of hers drip, and get some stock of hers for free, then it’s good to know that the offer is still there.\n";
		buyItem();
	}
	// end scene (scene: H&H Credit)
}

//[=Talk=]
// (scene: Speak, Girl)
public function talkToNenne():void
{
	clearOutput();
	showNenne();
	output("You stand before Nenne’s inventory, browsing it casually for a moment, before you glance back to the shopkeeper. She eyes you patiently, waiting for you to make your decision, and when your eyes meet hers, she smiles, her tail wagging expectantly behind her.");
	output("\n\nYou could try striking up a conversation with her, if you’d like.");

	//[=Family=][=The Shop=][=Uveto=][=Flirt=][=Back=]
	// end scene (scene: Speak, Girl)
	clearMenu();
	addButton(0,"Family",nenneFamilyTalk,undefined,"Family","You don’t think it’d be unfair of you to guess that Nenne’s had a pup or two of her own. Why not ask her about her family?");
	addButton(1,"The Shop",theShopNenneTalk,undefined,"The Shop","Ask Nenne about her shop. How did she come to sell all-natural medicines and poisons in the Korg’ii hold?");
	addButton(2,"Uveto",nenneUvetoTalk,undefined,"Uveto","Ask Nenne what an experienced Korgonne like herself thinks about Uveto, and what opinions she has about the universe, if any.");
	addDisabledButton(3,"Flirt","Flirt","Maybe talk to her a little before jumping straight to the fuck-offers.");
	if(silly) addButton(4,"BellyRub!",nenneBellyRub,undefined,"Belly Rub!","Ask if Nenne knows who a good girl is.");
	else addDisabledButton(4,"BellyRub!","BellyRub!","You aren’t feeling <i>silly</i> enough for this. Maybe there’s an option somewhere to correct that!");
	addButton(5,"PB Cookie",peanutButterNenne,undefined,"PB Cookie","You wonder how much Nenne would like to have a peanut butter cookie.");
	addButton(14,"Back",approachNenne,true);
}

//[=Family=]
// Tooltip: You don’t think it’d be unfair of you to guess that Nenne’s had a pup or two of her own. Why not ask her about her family?
// (scene: Nenne’s Family)
public function nenneFamilyTalk():void
{
	clearOutput();
	showNenne();
	output("You ask the older Korgonne if she has any family. You have a hard time believing that such an attractive Korgonne such as herself would be living alone.");
	output("\n\n<i>“Charmer,”</i> she replies, sticking her tongue out at you. <i>“");
	if(!korgiTranslate()) output("Nenne lovey-dovey mommy; three pups, all time-same born, grown bigly!");
	else output("I’m a proud, loving mother, with three fully-grown pups. Triplets, as a matter of fact,");
	output("”</i> she says happily, her tail wagging in delight at the thought of her family. <i>“");
	if(silly) output("Two tramps and a lady");
	else if(!korgiTranslate()) output("Two boylies, one girly");
	else output("Two boys and a girl");
	output(". ");
	if(!korgiTranslate()) output("All big now; boys watchdogs at Korg’ii big-door and girl groom for fee at low floor. Living not with mommy many days, but visiting can often!");
	else output("They’re all fully grown now; the boys are watchmen at the gate and my little girl provides some grooming services at the lower levels of the hold. They’ve left my nest some time ago, now, but they visit me whenever they can.");
	output("”</i>");

	output("\n\nYou ask her if there’s a Mister Nenne around in the hold. At the question, Nenne sighs wistfully, yet her expression sours, giving you two distinct bodily answers. <i>“");
	if(!korgiTranslate()) output("No having mate of forever with Nenne. Puppy father in the holding, but want nevering to make official.");
	else output("I don’t have a permanent mate, no. The father of my puppies lives in the hold, but he never wanted to make our love an official thing.");
	output("”</i> She slouches slightly, the fur on the back of her neck standing on end at the thought. <i>“");
	if(!korgiTranslate()) output("Guess afraid being of committing to Nenne and puppies. Afraid being of family beginning. Knowing don’t; knowing want don’t. Healthy being to leaving behind.");
	else output("I guess he was afraid of committing to me and our kids. Maybe he just didn’t want a family. I don’t know, and I don’t want to know. It’s healthier for me and my kids to leave him out of our lives.");
	output("”</i>");

	output("\n\nYou know better than to ask more about ‘Mister Nenne,’ so you try and change the subject back to her. Has she since tried looking for other mates in the hold?");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Times of few");
	else output("A few times");
	output(",”</i> she answers, heaving a gentle sigh. <i>“");
	if(!korgiTranslate()) output("Mate finding harder when puppies already having. Mates notting to want provide for puppies of aren’t own. Puppies older, but Nenne so is; now mates notting to want older Korgonne for mate.");
	else output("Finding a mate of your own is a little harder when you already have pups. Mates usually don’t want to provide for pups that aren’t their own. And now, my pups are old enough to take care of themselves, but I’m older too; and nobody wants to mate with an older Korgonne.");
	output("”</i> She looks down at her belly, rubbing at it with one paw gently. <i>“");
	if(!korgiTranslate()) output("Unknowing if Nenne can birth giving again. Too old.");
	else output("I don’t know if I’m too old to give birth again at this point anyway.");
	output("”</i>");

	output("\n\nYou’ve stepped on one mine after another with the topic, so you decide to try and diffuse the situation. Knowing that Korgonne appreciate physical contact, you gently lay your hand on her scalp and give it a rub. You tell her that she’s a beautiful Korgonne, and if she tries, you’re sure she can find another mate that appreciates her for her. There’s bound to be someone in the hold that would enjoy the company of a motherly, experienced Korgonne like herself.");

	output("\n\nShe leans against your head, her tail wagging furiously behind her at your encouragement. <i>“");
	if(!korgiTranslate()) output("Too hoping right.");
	else output("I hope you’re right, too.");
	output("”</i> Her eyes meet yours, and they narrow seductively; her tail stops its rampant swishing and slows to a much more casual pace. <i>“");
	if(!korgiTranslate()) output("Closer being then thinking for both us.");
	else output("Maybe they’re a little closer than we both think.");
	output("”</i>");

	output("\n\n<i>“Maybe,”</i> you respond, understanding exactly what she means.");
	flags["NENNE_FAMILY"] = 1;
	// end scene (scene: Nenne’s Family); grey out all options, including [=Back=], except [=Flirt=]
	processTime(20);
	if(pc.hasGenitals())
	{
		if(pc.lust() >= 33) addButton(3,"Flirt",flirtWithNenne,undefined,"Flirt","Nenne’s not hard on the eyes. Why not let her know as much?");
		else addDisabledButton(3,"Flirt","Flirt","You aren’t turned on enough for that right now.");
	}
	else addDisabledButton(3,"Flirt","Flirt","It seems a little silly to flirt with her while you don’t have any proper genitals.");
	addDisabledButton(0,"Family","Family","You already discussed that.");
}

//[=Belly Rub!=]
// hide this button unless Silly Mode is on
// Tooltip: Ask if Nenne knows who a good girl is.
// (scene: Belly Rub)

public function nenneBellyRub():void
{
	clearOutput();
	showNenne();
	author("B");
	output("You look Nenne over; at her tired grey fur and her slightly-bent posture. She’s getting up there in years a little bit. You bet that, if there’s any one thing that Nenne would enjoy more than anything, it would be to feel young again. And sure, you could fuck her, but you have something a little more immediate in mind.");
	output("\n\n<i>“Hey Nenne,”</i> you ask her. Her ears perk up at the sound of her name, and her tail begins swishing quickly behind her. <i>“Who’s a good girl?”</i>");
	output("\n\nNenne tilts her head, her mouth shut as she contemplates the question. <i>“");
	if(!korgiTranslate()) output("‘Good-being’ perspective matters, supposing");
	else output("I suppose the matter of what is ‘good’ is a matter of perspective");
	output(",”</i> she answers, choosing her words carefully. <i>“");
	if(!korgiTranslate()) output("Unright of Nenne judging to anyone of goodness of them. Gooding for Nenne not being gooding of others, might.");
	else output("It wouldn’t be right of me to judge whether anyone is good. What is good by me and my perspective might not be good by others.");
	output("”</i>");
	output("\n\nYou step forward, stepping beside Nenne. You ignore her philosophical answer and ask again. <i>“Who’s a good girl, Nenne?”</i>");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Asking then, gooding of not? Classic problem: okay to stealing of bread to feeding family of starved? Intent to committing gooding of not matters more than action? Where law of word more meaning than law of spirit?");
	else output("But then you have to ask, what is ‘evil?’ It’s a classic problem: is it alright to steal a loaf of bread to feed a starving family? Does the intent to commit evil matter more than the evil act itself? When and where does the word of the law beat the spirit of the law?");
	output("”</i>");

	output("\n\n<i>“It’s you!”</i> you announce suddenly!");
	output("\n\n<b><i>“Really?!”</i></b> Nenne nearly shouts, her eyes lighting up in surprise and pure glee. Her tail wags furiously behind her in surprise, completely elated at the news that she is, in fact, a good girl.");
	output("\n\nYou launch your attack, bringing your hand to Nenne’s belly, and vigorously start rubbing it with your open palm. At first, Nenne is surprised, but then her left leg starts to kick furiously; her tongue lolls out of her mouth and she begins panting and laughing in surprise.");
	output("\n\nShe quickly loses her balance with her kicking leg; you use your other hand to brace her and ease her to the floor of her shop gently. Now that she’s laying on her back, you use both hands to rub at her slightly-flabby belly, everywhere from just above her crotch to just below her breasts, getting your ticklish hands everywhere in between.");
	output("\n\n<i>“It’s you! Yes, Nenne, it’s you!”</i> you repeat loudly, watching her leg kick impiously. Nenne leans her head back, her tongue wagging in the air and her tail thrashing ecstatically underneath her. Joining her left leg, her two arms paw aggressively at nothing above her, all while panting in happy exhaustion at the tactile sensations you’re bombarding her with.");
	output("\n\nAfter a few minutes of this, you give the exhausted old Korgonne a break, removing your hands from her worn belly. She lays on the floor for a moment longer, her limbs still twitching in delight, before her eyes blink open and lock onto yours.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("You too good!");
	else output("You’re good too!");
	output("”</i> she says happily, drawing her tongue back into her mouth. It takes her another moment to roll onto her shaky limbs, and then another to pull herself back up. <i>“");
	if(!korgiTranslate()) output("Knowing didn’t Korgonne could doing that! Liked! Afraiding not to doing again!");
	else output("I didn’t know the Korgonne could do that! I liked it a lot; don’t be afraid to give me another one!");
	output("”</i>");
	flags["NENNE_BELLY_RUBS"] = 1;
	// end scene (scene: Belly Rub); grey out all options, including [=Back=], except [=Flirt=]
	processTime(20);
	if(pc.hasGenitals())
	{
		if(pc.lust() >= 33) addButton(3,"Flirt",flirtWithNenne,undefined,"Flirt","Nenne’s not hard on the eyes. Why not let her know as much?");
		else addDisabledButton(3,"Flirt","Flirt","You aren’t turned on enough for that right now.");
	}
	else addDisabledButton(3,"Flirt","Flirt","It seems a little silly to flirt with her while you don’t have any proper genitals.");
	addDisabledButton(4,"BellyRub!","BellyRub!","You already discussed that.");
}


//[=The Shop=]
// Tooltip: Ask Nenne about her shop. How did she come to sell all-natural medicines and poisons in the Korg’ii hold?
// (scene: Nenne’s Shop)
public function theShopNenneTalk():void
{
	clearOutput();
	showNenne();
	output("You ask Nenne how she got into practicing botany and how she came to selling her all-natural wares. There aren’t a lot of plants in Uveto to begin with; getting into the practice must have been a challenge.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Fewer hardships than thinking!");
	else output("It actually wasn’t as hard as you’d think,");
	output("”</i> she starts, taking a seat and folding her paws beneath her muzzle. <i>“");
	if(!korgiTranslate()) output("Planet white and cold, not green and warm. Thinking plants hard of finding not wrong. Korg’ii hold much different!");
	else output("Sure, Uveto is snowy and cold rather than verdant and warm. You’re not wrong in thinking that plants are difficult to find. But the environment is different in the Korg’ii hold.");
	output("”</i> To demonstrate, she reaches for one of her wares, a long, spindly vine growing straight out of one of the holes in the wall, and gives it a tug. The vine becomes taut, but doesn’t yield – because it’s rooted in place.");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("If planet no living good for planties, expecting Korgonne to living here, how? Or living of any? Korg’ii hold living good place for all!");
	else output("If Uveto couldn’t support plantlife, how would you expect the Korgonne to survive here? Or anything, for that matter? The Korg’ii hold is a good place to live, not just for us, but for plants, too.");
	output("”</i> She strokes idly at the warm walls of her living space, and wordlessly invites you to do the same. You place your hand on the Savicite wall, next to her paw. <i>“Warmth,”</i> she says. <i>“");
	if(!korgiTranslate()) output("Good ground for Korgonne; good air for Korgonne; water plenty for Korgonne. All good for plantings too!");
	else output("The ground here is soft; the air is warm; and there’s plenty of water to go around. Wherever you can find Korgonne, you can find plant life.");
	output("”</i>");

	output("\n\nShe straightens herself and reestablishes eye-contact with you once more. <i>“");
	if(!korgiTranslate()) output("And Nenne!");
	else output("As for me,");
	output("”</i> she begins, answering your other question, <i>“");
	if(!korgiTranslate()) output("plant-studying very smart-making for Nenne! Many plant do many things; good learning for which plant doing one thing and other plant doing other thing. Very learning! Help Korg’ii with plant-learning!");
	else output("I just found botany to be interesting. Different plants interact with us in different ways, and I was always interested in why this moss burns to the touch, while the pollen from this flower elicits a hormonal response. No other Korg’ii has taken up the hobby like I have, and this is a good way to share my knowledge with the hold.");
	output("”</i>");

	output("\n\nYou ask Nenne if the rest of the hold feels similarly. The Korgonne are an industrious race that show respect and favoritism to its hardest workers; how well is Nenne treated for her chosen profession?");

	output("\n\n<i>“");
	if(!korgiTranslate()) output("Okay. Maybe not as many lovings or attentions as others. Fishing, mining, guarding, all many lovings and attentions. Never wanting for anything, Nenne, but plant-knowings not wanting as many as others.");
	else output("Alright, I guess. My botany isn’t as well-respected as some other professions, maybe; fishing, mining, and protecting the royalty or the hold all get the real adoration. I’ve never been treated poorly or anything, and I’ve never wanted for anything in particular, but nobody in the hold shares my appreciation for Uveto’s plantlife.");
	output("”</i>");
	output(" She lovingly strokes at the same ivy vine, her paw curling down the green stem delicately. <i>“");
	if(!korgiTranslate()) output("Okay with this! Decision making for Nenne made ago-ago.");
	else output("I’m fine with it, though, and I understand that I’m the odd one out among the Korgonne. I made my decision a long time ago.");
	output("”</i>");

	output("\n\nYou can’t think of anything else specific to the shop and her profession to ask Nenne about. She smiles at you, wagging her tail. <i>“");
	if(!korgiTranslate()) output("Asking is being thanked! Nenne love alien for curiousness; Korg’ii not being of curious asking anymore. Ask again, will tell!");
	else output("Thanks for asking, by the way! I appreciate your curiosity; it’s so rare nowadays for a Korg’ii to ask me about my profession. I’d love to tell the story again if you’d ask!");
	output("”</i>");
	flags["NENNE_SHOP_TALK"] = 1;
	// end scene (scene: Nenne’s Shop); grey out all options, including [=Back=], except [=Flirt=]
	processTime(20);
	if(pc.hasGenitals())
	{
		if(pc.lust() >= 33) addButton(3,"Flirt",flirtWithNenne,undefined,"Flirt","Nenne’s not hard on the eyes. Why not let her know as much?");
		else addDisabledButton(3,"Flirt","Flirt","You aren’t turned on enough for that right now.");
	}
	else addDisabledButton(3,"Flirt","Flirt","It seems a little silly to flirt with her while you don’t have any proper genitals.");
	addDisabledButton(1,"The Shop","The Shop","You already discussed that.");
}

//[=Uveto=]
// Tooltip: Ask Nenne what an experienced Korgonne like herself thinks about Uveto, and what opinions she has about the universe, if any.
// (scene: Nenne’s Uveto)
public function nenneUvetoTalk():void
{
	clearOutput();
	showNenne();
	output("You ask Nenne what her opinion is on her home planet, Uveto. You wonder what opinions a native Korgonne has about a planet that most would consider inhospitable at best and uninhabitable at worst.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Home many cold, but home is home");
	else output("Uveto may be a cold place, but it’s home");
	output(",”</i> she shrugs, unsure of how to articulate her answer. <i>“");
	if(!korgiTranslate()) output("Rumors come to ears of Nenne. Alien here standing in shop! Worlds of newing and different can visited being, but Nenne dream only; never try visiting herself.");
	else output("Rumors had come to the hold about offworlders visiting Uveto, and I have an alien standing in my shop right now! It’s exciting to think that there are worlds other than Uveto out there, but I’ve never entertained the idea of visiting them; that’s a dream best left for the pillows.");
	output("”</i>");

	output("\n\nShe twirls the silvery fur on her head for a moment, pondering her next words. <i>“");
	if(!korgiTranslate()) output("Life not difficult. Easier living where-else, but Nenne happy here living; cold, cramping, and existing only Korgonne and native others, so lonely can be having. Nenne many years living, and learn that adventuring life not always home-away; family becomes adventure-ending, also adventure-beginning. Okay with that.");
	else output("Life on Uveto isn’t difficult. It may be easier to live elsewhere, but I’m happy living here in the hold. Sure, it can be cold, cramped, and there isn’t much company apart from other Korgonne and the other Uvetan natives, so it can get a little lonely, knowing there’s a whole other universe out there. But when you live for as long as I have, you learn that life’s adventures aren’t always away from home; starting a family may be the end of one adventure, but it’s the beginning of another. And I’m okay with that.");
	output("”</i>");

	output("\n\n");
	//if {PC has no offspring}
	if (StatTracking.getStat("pregnancy/total births") <= 0) output("You hadn’t considered that. You promise Nenne that you’ll take her wise words to heart if you ever have a kid.");
	//if {PC has any offspring}
	else output("You suppose that your circumstances are different from Nenne’s: your adventures didn’t really change when you had your first child. If anything, they only got more exciting.");
	output(" You ask her if she’d explore the stars if she were ever given the chance; to see if she would enjoy planets and ecosystems other than Uveto’s.");

	output("\n\nShe rubs at the underside of her muzzle with her paw for a moment, humming in thought at the question. <i>“");
	if(!korgiTranslate()) output("Foolish, no saying. Full of universe, places of new, experiences of new. Saying of puppies only to have new adventures unfair! Nenne enough old to holding leave; enough young to star exploring. Chapter of new being in life of Nenne!");
	else output("It’d be foolish of me to say no. The universe is big, with new places to explore and new experiences to have. It’s not fair to say that only the pups can have new adventures! I’m old enough to leave the hold, and I’m young enough to explore the stars. It could be a new chapter in my life!");
	output("”</i> Her eyes narrow playfully on yours and her mouth curls into a sly smirk. <i>“Why? ");
	if(!korgiTranslate()) output("Question to ask for Nenne soon?");
	else output("Are you trying to ask me something?");
	output("”</i>");

	output("\n\nYou tell her that, if your ship is ever in need of an apothecary, you’ll know the first woman to ask. <i>“");
	if(!korgiTranslate()) output("Easy finding of Nenne!");
	else output("You’ll know where to find me,");
	output("”</i> she answers with a wink.");
	flags["NENNE_UVETO_TALK"] = 1;
	// end scene (scene: Nenne’s Uveto); grey out all options, including [=Back=], except [=Flirt=]
	// If Nenne turns out to be popular enough, this should be a decent hook to make her a crewmate in an expansion.
	processTime(20);
	if(pc.hasGenitals())
	{
		if(pc.lust() >= 33) addButton(3,"Flirt",flirtWithNenne,undefined,"Flirt","Nenne’s not hard on the eyes. Why not let her know as much?");
		else addDisabledButton(3,"Flirt","Flirt","You aren’t turned on enough for that right now.");
	}
	else addDisabledButton(3,"Flirt","Flirt","It seems a little silly to flirt with her while you don’t have any proper genitals.");
	addDisabledButton(2,"Uveto","Uveto","You already discussed that.");
}

//[=Flirt=]
// Tooltip: Nenne’s not hard on the eyes. Why not let her know as much?
// (scene: Flirt With Nenne)
public function flirtWithNenne():void
{
	clearOutput();
	showNenne();
	output("You lean against the stony wall of Nenne’s cramped apartment and eye her slowly, from her eyes to her ankles, drinking in her every curve and the way her breasts pool against her crossed arms. You ask her if there’s anything more an experienced Korgonne like herself could teach you.");
	output("\n\nShe hums gently to herself, her eyes narrowing on yours. Your tone isn’t lost on her, and she returns the body language, undressing you with her eyes and biting her lip at what she imagines. <i>“Plenty,”</i> she answers simply. <i>“");
	if(!korgiTranslate()) output("Planting not only good trick of Nenne.");
	else output("Herbalism isn’t my only specialty, darling.");
	output("”</i>");

	output("\n\nYou tell her that you’re eager to learn more. You’re excited to see what more Nenne can teach you.");

	output("\n\nAn unfamiliar scent slowly begins to permeate the room. You’re not positive of its origin, but you know that it smells... pretty damn good. For the look on Nenne’s face, she isn’t affected by the musk, but she knows that you are.");

	output("\n\nNenne turns on the spot, showing her backside to you; her tail slowly swishes from side to side, flashing you one asscheek, then the other, as she lazily regards you. She puts one hand against a stony doorframe and she looks over her shoulder, one eye on you. <i>“");
	if(!korgiTranslate()) output("Following Nenne. Teaching of you many ‘lessons of life’ and new. If you ready.");
	else output("Follow me, and I’ll teach you some new ‘life lessons.’ If you think you’re ready for them.");
	output("”</i>");

	output("\n\nShe’s giving you an opportunity to back out, if you’d rather. It’d be tough to say no to <i>that,</i> but the option is there.");

	processTime(10);
	pc.lust(15);
	//[=Follow=][=Stay=]
	// end scene (scene: Flirt With Nenne); increase Lust by 15
	clearMenu();
	if(!silly)
	{
		addButton(0,"Follow",nenneFollowPresex,undefined,"Follow","You’re ready for whatever life lessons Nenne has in store for the both of you....");
		addButton(1,"Stay",shouldIStayOrShouldIGoNowIfIStayThereWithBeTroubleIfIGoThereWillBeNenne,undefined,"Stay","You’re not sure you’re ready for the rigors of Nenne’s teaching methods for now. Maybe next time.");
	}
	else
	{
		addButton(0,"Follow",nenneFollowPresex,undefined,"Follow","You’re ready to plow that MILF Korgonne ass like a field; to knead it like bread dough; to pound it like cake; to verb it like a noun!");
		addButton(1,"Stay",shouldIStayOrShouldIGoNowIfIStayThereWithBeTroubleIfIGoThereWillBeNenne,undefined,"Stay","...but, abstinence can be a good choice as well.");
	}
}


//[=Stay=]
// Tooltip: You’re not sure you’re ready for the rigors of Nenne’s teaching methods for now. Maybe next time.
// Tooltip (silly mode): ... but, abstinence can be a good choice as well.
// (scene: Rejected)
public function shouldIStayOrShouldIGoNowIfIStayThereWithBeTroubleIfIGoThereWillBeNenne():void
{
	clearOutput();
	showNenne();
	output("You pinch the bridge of your nose and exhale sharply. Perhaps you had jumped the gun a little bit, and you got a little ahead of yourself. You apologize to Nenne and tell her as much.");
	output("\n\nShe ‘humphs’ once in disappointment, and swishes her tail in agitation. The musk from before wafts toward you in a sudden wave, but you maintain your position. <i>“");
	if(!korgiTranslate()) output("Okay. Coming back to Nenne when older is being.");
	else output("Suit yourself. Feel free to visit again when you’re ready to be a bit more of a " + pc.mf("","wo") + "man.");
	output("”</i>");

	// end scene (scene: Rejected); display main menu
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[=Follow=]
// Tooltip (not silly): You’re ready for whatever life lessons Nenne has in store for the both of you....
// Tooltip (silly): You’re ready to plow that MILF Korgonne ass like a field; to knead it like bread dough; to pound it like cake; to verb it like a noun!
// (scene: Nenne Pre-Sex)
public function nenneFollowPresex():void
{
	clearOutput();
	showNenne(true);
	output("You take up Nenne on her offer and step forward. She smiles at you, her snout curling in the corners, and extends a hand to you; you take it, and she squeezes your palm gingerly. She gives your arm a gentle tug as she leads you deeper into her living quarters; from the way her bum bounds with her peppy steps and the way the musk from earlier hefts toward you with her gait, she’s excited to get some attention.");
	output("\n\nWhat you enter is a small personal area: it contains a bed with simple fabrics containing some kind of fluffy down (perhaps Korgonne shavings? Is that weird?), and a table with two more stone chairs, their seats smoothed to perfection to contain almost any bottom. There’s a simple fire pit with a lit fire and a number of stone bowls nearby; above the pit and etched into the wall are large circular grooves bored deep into the stone, similar to her storefront, containing several kitchen tools. Atop the fire is a deep bowl with high edges, and sounds like bubbling water inside it.");
	output("\n\n<i>“Sit,”</i> she instructs, motioning to the chairs. You pick the further one and get yourself comfortable.");
	output("\n\nNenne reaches into one of the large compartments and withdraws a pawful of mushy, crumbly plants; she gives it a quick sniff, then drops it into the pot. <i>“");
	if(!korgiTranslate()) output("Drink of making for us. Special ingredient is moss! Idea ever have by alien?");
	else output("I’m going to make a drink for us both. The secret ingredient is this moss. Does your kind have something similar?");
	output("”</i> She pulls a stirring stick out from among her bowls and gives the water in the pot a few stirs.");
	output("\n\n You reply that there is a drink that’s shared all over the universe called ‘tea.’ It involves adding special plants to boiling water; what type of plant, and how much you use, can change how strong the tea is and its taste.");
	output("\n\nNenne hums affirmatively as you answer her. <i>“");
	if(!korgiTranslate()) output("Good word. Tea having by us! Special Korg’ii tea, growing moss along deep Savicite. Experience making much better!");
	else output("That’s a good word; we’ll be drinking some of this ‘tea’ today. It’s a Korg’ii specialty, made with a thick type of moss that grows along deep-rooted Savicite. It’ll make our experience much better.");
	output("”</i> She taps the end of her stirring stick against the rim of the pot, and then puts it back. Satisfied that her concoction is complete, she pulls two stone bowls out from their shelves, and, careful not to burn herself, dips their edges into the water, filling them with the tea.");
	output("\n\nShe gives you your bowl first, then sets one out for herself. <i>“");
	if(!korgiTranslate()) output("Tea helping nerves with ease. Changes you, goodly in ways. World experienced newly; make feelings more sharply, smells more smelly, tastes more tasty.");
	else output("This tea will help ease your nerves. It’ll change the way you experience the world, in a good way: you’ll feel things more sharply; you’ll smell things more strongly; and you’ll taste things more intensely.");
	output("”</i> She gives her bowl a blow to cool the liquid, and takes a quick sip. <i>“");
	if(!korgiTranslate()) output("Tasting of good already! Trying of you!");
	else output("And, it tastes pretty good! You should give it a try.");
	output("”</i>");

	output("\n\nYou grip the bowl, careful to not let the heat hurt your hands, and mimic her, blowing away the steam to cool the liquid, before tipping it to your [pc.lipsChaste]. It tastes a little earthier than you had expected – unprocessed and unfiltered, straight from the Savicite it was harvested from. It goes down smooth; you can barely feel the moss in the water as it slides into your mouth.");
	output("\n\nYou ask Nenne if the tea has any side effects. Is there any reason to <i>not</i> drink the tea? <i>“");
	if(!korgiTranslate()) output("Lazy making. Good feels and good smells, but energy having none to feeling or smelling. Relaxing for goodly; adventuring for badly. Removing from Korg’ii unallowing.");
	else output("It’ll make you lethargic. You’ll be able to feel all these good feelings and smell all these amazing smells, but you won’t have the inclination to do much feeling or smelling. It’s a good tea to have to relax with, but you really shouldn’t have it if you’re thinking of doing any adventuring. We’re not allowed to take it outside the Korg’ii hold.");
	output("”</i>");

	if(!pc.isCrotchExposed() && !pc.isChestExposed())
	{
		output("\n\nNenne eyes you once more, from your collar to your [pc.feet], noting your clothing. <i>“");
		if(!korgiTranslate()) output("Noting, should removing be of clothing. Difficulty removing later if not!");
		else output("On that note, you should probably take your clothes off now. It’ll be a little tough to do it later if you don’t.");
		output("”</i> You do as she recommends and strip naked; Nenne’s eyes are on you the entire time, her eyes quenched for a show as her mouth grows parched despite the tea. When you’re good and naked, you resume your tea time with her.");
	}
	output("\n\nYou two continue your tea time and make short talk while you wait for the effects of the tea to kick in. You don’t talk about anything really substantial, and it doesn’t take long for the tea to work its magic: before long, your senses begin to change:");
	output("\n\nYour peripheral vision gets blurry and unfocused, though your primary vision grows sharper and more precise. Your hearing gets a little blurred, and you have a harder time making out some of the nuances in Nenne’s speech, making it sound to you like she’s slurring her words. You feel the warmth of the apartment’s air against your skin and the heat from your bowl emanate toward you. The taste of the tea explodes against your tongue, lighting up every bud along its length. And, most importantly, the musk from earlier... it overshadows the tea easily and pervades your nostrils, controlling where your face looks, where your eyes focus, and which sounds you hear.");
	output("\n\nNenne recognizes all the symptoms, and, with a warm smile, gently takes your hand in hers. <i>“");
	if(!korgiTranslate()) output("Timing be for lessons to you,");
	else output("It’s time for your first lesson,");
	output("”</i> she says as she stands, lifting your arm with her.");

	output("\n\nYour body is lazy and uncooperative; your head (and your crotch) wants to follow Nenne, but your arm is heavy and your legs are stiff; you feel as though you weigh twice as much as you do when you muster the strength to stand, and so much as moving forward is as arduous as a workout. You’d collapse beneath yourself if it didn’t mean moving your body to the floor.");

	output("\n\nThankfully, Nenne understands, and from the way she moves her own body, she’s experiencing something similar. You only need to move a few steps, thankfully enough, before Nenne flops you onto her soft bed, face-up – and she flops onto you.");

	processTime(30);
	pc.lust(60);
	clearMenu();
	addButton(0,"Next",nenneIsMakingYouTripBalls);
	// end scene (scene: Nenne Pre-Sex); increase Lust by 60
}
public function nenneIsMakingYouTripBalls():void
{
	clearOutput();
	showNenne(true);
	// (scene: Foreplay With Nenne)
	output("You’re entirely conscious of Nenne and the things she does to you; just because your body is slow doesn’t mean your mind is. The older Korgonne has straddled your [pc.hips], her moist cunt grinding against your groin, slickening your body with her musky, heady lube. She hisses inwardly with every grind against you, but only slightly; the air rushes through her teeth like a whisper – a whisper that tells you that she’s enjoying you, and is excited to enjoy you further.");
	output("\n\nHer paws travel along your arms delicately, tickling at your [pc.skinFurScales]; every gentle brush is like an electric shock into your amped senses, telling you where precisely she’s touching you, and how hard. It goes from your arms, to the [pc.hips] she’s sensually humping against, to the weight of her breasts against your own; her hard, pebbly nipples poke teasingly against you, drawing straight lines against your [pc.chest] with her every hump.");
	output("\n\nHer other hand travels up to your head, holding you in place while her snout dips into the crease of your neck to gently lap at you there. Her breathing is steady and her ministrations, even under the effects of the tea, are very deliberate and precise, knowing exactly how erogenous your entire body is, and teasing each part of you as specifically as she can. She breathes through her nose, taking in your scent with each lungful, knowing that the sound of her breathing adds to the symphony that is your sex, and her playful yet detailed cloys along your body are her playing the instrument of your body.");
	output("\n\n<i>“Touch me,”</i> Nenne says – not as a command, nor as a request, but as a suggestion. The words enter your ears a little muffled, like before, so it takes you a moment to understand them. You were so immersed in surrendering yourself to her expertise that you forgot to return the favor, and as soon as the thought enters your head, you comply.");
	output("\n\nYour fingers ruffle through Nenne’s shaggy fur; your tips dig into the bristles and lightly scratch at her skin underneath. You’re directionless, at least compared to her: all you concern yourself with is the sensation of Nenne’s fur against you. The movement reminds you of wavy grass during a windy day; your palms travel along her back, groping and pulling gently at her fur wherever they land.");
	output("\n\nNenne giggles at your aimlessness, and continues with what she’s doing, allowing you to explore her, as long as you stay gentle about it. Her body’s muscles have grown a little loose with her age, and you grip onto clumps of muscle and fur with relative ease, massaging them between your fingers before letting go and searching for a new spot to grope. Each time you massage a new spot of hers, you, almost on reflex, take a breath through your nose, easing her scent into your nostrils, and when you’re done, you shudder out an exhale.");
	output("\n\nNenne’s fingers travel down your body, to the fat of your thigh; she returns the gesture and pulls at what she finds there, cooing in delight at the thick, sensual muscle of your leg, and how close she is to your nethers. You, with your position, have a much easier time bee-lining for the real bulls-eye: one hand remains beneath her shoulderblades, marveling at the fluffy texture of her upper back, while the other shamelessly cups a thick handful of Korgonne MILF ass.");
	output("\n\n<i>“Wait,”</i> she says, and again, it’s neither a command nor a request. You do as she asks, and you stop your groping for a moment; your lazy, unfocused eyes land on hers, looking into her pale-green eyes for a moment. You both lay there, just watching, for some time: you feel her heartbeat through her thick fur and thicker breast; her breath comes out in easy huffs, the wind tickling you down your [pc.chest]. And you two just watch one another.");
	output("\n\nNenne breaks the silence, leaning in and planting her mouth against yours. It takes you a moment to reciprocate the kiss; her tongue floods into your mouth, flopping against yours with a languid sensuality, and you lick and suck at it slowly, appreciating its every nuance and flavor. Nenne hums in delight at what she feels and what she tastes; her breeder’s hips rock gently against you as you suck at her tongue, her tail swishing in time with every other heartbeat.");
	output("\n\nWhen she pulls away, the sensation of her tongue in your mouth lingers for a moment yet. Her green eyes lock onto yours, and then she plants several kisses around the edges of your face, humming delightedly as she goes. When she gets back to your mouth, she plants another, longer kiss on your [pc.lipsChaste], then boops your nose with her own.");
	output("\n\n<i>“Ready?”</i> she asks.");
	processTime(30);
	pc.lust(30);
	//[=Next=]
	// end scene (scene: Foreplay With Nenne); increase Lust by 30; go to (scene: Fuck Nenne)
	clearMenu();
	addButton(0,"Next",fuckNenneProperStart);
}

// (scene: Fuck Nenne)
// If the PC is pure male or pure female, 50/50 chance to play either the 69 scene, or the scene with their gender. If the PC is herm, split the odds 33/33/33.
public function fuckNenneProperStart():void
{
	if((pc.hasCock() && !pc.hasVagina()) || (!pc.hasCock() && pc.hasVagina()))
	{
		if(rand(2) == 0) nenneGets69();
		else if(pc.hasCock()) penisRouter([maleOrHermAndNotDoingOral, 900000000, false]);
		else nenneFemaleOrHermNoOralSlorral();
	}
	else if(pc.isHerm())
	{
		if(rand(3) == 0) nenneFemaleOrHermNoOralSlorral();
		else if(rand(2) == 0) penisRouter([maleOrHermAndNotDoingOral, 900000000, false]);
		else nenneGets69();
	}
	else
	{
		clearOutput();
		showName("\nERROR");
		output("How the fuck did this happen? You don’t have any genitals at all?");
	}
}

// 69 scene
public function nenneGets69():void
{
	clearOutput();
	showNenne(true);
	output("You think you mumble something in reply, but any noise you make is muffled quickly when Nenne shuffles forward, her heavy breasts suddenly filling your view. She lifts a nipple to your mouth, and you feel yourself move on instinct; there’s a nipple in front of you, and the automatic response was to suckle. So you do.");
	output("\n\nNenne coos and pats your head, brushing her heavy, motherly breasts in front of you in time with the motions of your [pc.lips] and [pc.tongue]. You feel her shoulders shuffle a bit, and then the boob in front of you is replaced with the other. The fur of her tit is soft against your face; you’re sent to some other world, laying on Nenne’s bed with her wonderful, warm, soft, smooth, delicious body pressed against her, and the steady beat of her heart provides enough white noise to relax you almost to the point of falling asleep.");
	output("\n\nThen, just as you were really beginning to settle – on this bed, wrapped in the warm blanket that is Nenne’s body, her hefty boob in your mouth – Nenne breaks the fantasy once again and moves her body up yours. Your vision swims with Nenne’s belly, then her navel, and then with the V of her pelvis. The pheromone stench of her Korgonne snatch permeates your nostrils even harder than it has been before, and your instincts are given a new directive.");
	output("\n\nYou’re too slow, though. This may be a habit with you while you’re under the effects of her tea. One of Nenne’s thick thighs lifts above your head, and then the other; her fluffy tail drapes over your head, swishing against your scalp in excitement, before she leans forward, and your lip-to-lip once again with her black, vintage Korgonne cunt, her juices leaving a wet streak across the valley of your [pc.chest].");
	output("\n\nYou’re taken aback at first. Not so much by the sight or the smell of what might be the wettest, most attractive pussy in the world (you’re not sure if that’s the tea talking), but the feel of a mouth on your ");
	if(pc.hasCock()) 
	{
		output("[pc.cock]. You hadn’t realized exactly how horny you were until you felt some stimulation; your neglected dick, which is hard as diamonds and leaking pre-cum like a leaky faucet, finally gets some attention with a thirsty Korgonne tongue bathing it. You feel everything she does with pinpoint clarity: her tongue wraps around your shaft and strokes it like a warm, wet, gentle hand, before making a pass over your [pc.cockHead] to lap at the pre that’s bubbled up there");
		if(pc.balls > 0) output(". One of her experienced hands travels lower, its palm rubbing against the inside of your thigh before looping around to your [pc.balls], her dull claws tickling at your [pc.skinFurScales] while she palms her [pc.sack] in smooth, constant circles");
		output(".");
	}
	else
	{
		if(pc.hasVagina()) output("[pc.vagina]. You hadn’t realized exactly how horny you were until you felt some stimulation; your neglected pussy, wet as an ocean and dripping your feminine lube in lines down your thighs, finally gets some attention with a hungry Korgonne mouth resting hot and eager against your vulva. You feel everything she does with pinpoint clarity: her tongue makes a long stride, top to bottom, along your [pc.vagina], reaching up to your [pc.clit] before lunging deep inside your body. Her tongue bloats and twists inside you, testing every hidden spot Nenne could think to look for your G-spot, drinking your [pc.girlCum] like an eager pup all the while.");
	}
	output("\n\nThe sensations make you cross-eyed, and you have an even harder time focusing on what’s going on in front of you, but even your drug- and lust-addled mind understands that this is a two-person operation and that Nenne needs something in return for her effort. You wrap your arms up and around the small of her back, marveling at the softness of her fur and body for a moment, before lifting your head and diving in.");
	output("\n\nAt first, you miss almost completely and wind up spearing Nenne’s cunt with your nose. Nenne shivers in lust and a throaty groan escapes her, even occupied as her mouth is, and you get a huge, deep whiff of her distilled pheromones; her juices cling to your nose and upper lip when you pull away, ensuring that it’s all you smell for some time. Your body and instincts properly motivated, you try again, aligning the folds of her pussy with your [pc.lipsChaste].");
	if(!pc.hasCock() && pc.hasVagina()) output("\n\nYou try to mimic Nenne’s technique, by twisting and fattening your [pc.tongue] inside her to find the special spot inside her that will dissolve her.");
	else if(pc.hasCock()) output("\n\nYour technique is rather aimless and undecided, now that you’re tongue-deep inside the motherly Korgonne.");
	output(" Any technique you try to maintain falls apart after a moment in favor of simply enjoying everything that is Nenne: her body on top of yours, gyrating in time with your motions, and her particular, tangy, earthen taste coating your mouth with every gush of her cunt across your [pc.tongue]. It reminds you a little bit of the plants that she offers for sale: all-natural.");

	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("\n\nYour fuzzy mind doesn’t register exactly how deep into Nenne you’ve gone until you feel something like a block against the tip of your tongue. You briefly consider trying to push past it, but your mind messily rationalizes that you’re not supposed to be hitting anything. Either Nenne is a virgin – which is unlikely – or you’ve gone too deep. Still, from the way Nenne’s body quivers in barely-controlled pleasure on top of you as your [pc.tongue] wriggles around, maybe ‘too deep’ is actually ‘exactly deep enough.’");

	output("\n\nTime is a nebulous concept to you right now. There is only you and Nenne, and all the tactile sensations you’re providing each other. Eating her out becomes an autonomous, rewarding act that you don’t even register that you’re doing after a while: you wag your tongue inside her snatch, and you’re rewarded with another gush of her potent ichor and another ");
	if(pc.hasCock()) output("squeeze and suck on your [pc.cock]");
	else if(pc.hasVagina()) output("drive of her own tongue into your [pc.vagina]");
	output(". And when your orgasm hits, you don’t register the buildup: you’re just lying there, eating our your Korgonne MILF, and suddenly, you’re cumming.");

	output("\n\nThat said, your orgasm is a lot stronger than you remember any recent orgasm of yours: ");
	if(pc.hasCock()) 
	{
		output("your [pc.cock] swells suddenly in Nenne’s maw, and you feel every pulse of your veins massaging every little muscle in your dick to usher every single drop of your [pc.cum] up");
		if(pc.balls > 0) output(" from your [pc.balls] and");
		output(" out your bloated [pc.cockHead], which is lodged comfortably in Nenne’s moist mouth");
		if(pc.cumQ() < 400) output(". She doesn’t let a drop out of her mouth, and she moans in delight at the [pc.cumFlavor] taste dressing her buds; her expert tongue coils around your shaft and lets your squirming [pc.cock] squirt into the back of her mouth, and when she’s got a mouthful, she withdraws slightly, dragging her tongue along your [pc.skinFurScales] so she can swish your jizz around before swallowing to make room for some more");
		else 
		{
			output(". Experienced as she is, she wasn’t accounting for a load as large as yours, but despite that, it’s clear that this isn’t the first time she’s had to deal with a full-course meal. She chugs your [pc.cumFlavor] jizz like she’s a sorority sister with something to prove: she grunts in between thick mouthfuls, breathing through her nose deeply to keep from exhausting herself as she swallows load after load after load. Despite your immensity, she, like the master she is, still doesn’t lose a single drop, even as her belly begins to stiffen and round out from what you have to offer. And throughout it all, her tongue coils around your shaft, milking and squeezing you for even more. She doesn’t get such a great meal often, clearly, and she wants this one to count");
		}
	}
	else if(pc.hasVagina()) output("your [pc.vagina] clamps down on the invasive tongue inside it, and you feel every pulse of your veins stimulating your every vaginal muscle to rhythmically milk Nenne’s tongue for every drop of cum it wishes it could spurt. You feel your body tighten, and you feel yourself produce more [pc.girlCum] in a hurry, soaking Nenne’s snout down to her neck. The muscles in your [pc.legs] spasm involuntarily, shaking with pleasure; if you had the strength to lift them, you’d have wrapped them around her shoulders so you could use your [pc.feet] to push her deeper into your body. Waves of pleasure emanate from your [pc.crotch], rolling up your [pc.belly] and into your heart");
	output(".");

	output("\n\nLost as you are in your pleasure, your mouth still runs on its scripted, automatic motions, bringing Nenne to her own orgasm, and you don’t realize that she’s cumming until you nearly sputter own her own girl cum. Once you’re aware of it, you’re aware of how her fluids flush against the bumpy tastebuds of your [pc.tongue] and how it fills the miniscule gaps between your teeth. The taste is more of the same, but far more potent and concentrated; it’s like you had bottled Nenne’s flavor and distilled it into cum. Her breathing is ragged and tough, and her thick thighs shake in restrained pleasure on either side of her head as her pussy spasms on your mouth.");
	output("\n\nYou pay no heed to any of that. As sharp as your senses are, your lazy mind registers only three things: that you’re cumming; that she’s cumming; and that if you keep doing what you’re doing to her snatch, she’s likely going to cum more, and if she cums more, you’re probably going to cum more.");
	output("\n\nMay as well get your money’s worth out of her.");
	pc.girlCumInMouth(chars["NENNE"]);
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",freebieNenneScene);	
}

// Continue here if the PC is male or herm and is not doing oral
public function maleOrHermAndNotDoingOral(x:int = 0):void
{
	clearOutput();
	showNenne();
	//var x:int = pc.cockThatFits(600);
	//if(x < 0) x = rand(pc.cockTotal());
	
	output("Your hands idly grope and massage at the thick of Nenne’s back while she takes the initiative – mostly out of necessity, because if it were up to you, you’d simply lay there and enjoy the warmth of her body and the way her motherly curves press against you. Her soft paw travels between you two, tickling at your [pc.belly] as she searches your tingling loins for her prize.");
	output("\n\nYour [pc.cock " + x + "] is hard as could be between you two, and you hadn’t noticed it until now, too distracted by the tastes, smells, and sensations of everything else. As soon as her hand finds your [pc.knot " + x + "], you involuntarily lurch your [pc.hips] upward in pleasure, suddenly desperate to penetrate the hole that is her open palm.");
	output("\n\n<i>“Shh,”</i> she whispers gently, her free hand reaching up to stroke your [pc.hair]. You try your best to contain yourself, but it’s not happening: once you realized just how horny you were, your mind became focused on doing anything to alleviate the bombardment of pleasure Nenne started giving you, and all from little more than a warm, soft paw on your cock. Not even a sensitive part of your cock, either.");
	output("\n\nNenne giggles, enjoying the bucking ride you’re giving her, and you aren’t even inside her: your [pc.cock " + x + "] juts upward, trapped in the thick meat of her ass, your [pc.cockHead " + x + "] prodding up ");
	if(pc.cocks[x].cLength() <= 6) output("and jabbing lightly at Nenne’s asshole.");
	else if(pc.cocks[x].cLength() < 12) output("and poking along the base of her tail.");
	else output("and brushing along the underside of her raised tail.");

	output("\n\nPre-cum dribbles from you, sliding down the [pc.skin] of your shaft, and you feel every exciting moment of that droplets life: your senses are so hyper-tuned that you felt it bubble up from your loins, and you felt it seep from your tip, and you feel it drip its way slowly back down to the crease where your cock meets your ");
	if(pc.balls > 0) output("[pc.sack]");
	else output("crotch");
	output(". And you feel when Nenne scoops it between her fingers and use that little drop as lube.");

	// Continue here if the PC cock fits
	if(pc.cockThatFits(chars["NENNE"].vaginalCapacity()) >= 0)
	{
		output("\n\nThen, a light pinch, as Nenne adjusts her grip on you and gives you a light tug. Your [pc.cock " + x + "] is pulled along the tight, warm valley of her hefty bottom, until it finds something warmer and tighter: the pre that Nenne had used to lube your shaft is washed with the feminine juices that’s practically spilling from her pursed pussy lips. With a light downward thrust from her hips, you’ve entered her.");
		pc.cockChange();
		output("\n\nNenne hums in delight at feeling such a virile cock properly penetrate her; her breath comes out in feral sputters from the sides of her jowls, and she clenches on top of you. The paw that snaked you inside her loops up to your shoulder, gripping it loosely. Despite her easygoing pace and her expertise touch and directions, her body must have forgotten what a good fucking felt like after so long. You’re not sure you have the control over your body to give her the fucking she deserves, beyond whatever you do instinctually and automatically; you hope that it’ll be enough for her all the same.");
		output("\n\nWhenever Nenne lifts herself up and off your [pc.cock " + x + "], you lay still, allowing the cool air of the room to simmer off your hard dick for the precious moment it’s exposed until Nenne squats herself back down. When she does, your [pc.hips] thrust upward, jabbing yourself into her as deeply as you can");
		if(pc.hasKnot(x)) output("; a few more thrusts like that, with how ‘ready’ you both are, and you’ll be tied to her in no time");
		output(".");

		output("\n\nEvery time your bodies meet, you clench, squeezing at Nenne’s back and holding her closer to your own body. And she responds in kind: your every joining is met with Nenne whimpering like a puppy and her paws – one at your shoulder and the other at your scalp – unintentionally pulling you closer to her. You’re both inextricably wrapped around each other, and each thrust only reinforces your embrace.");

		output("\n\nYou bury your face into Nenne’s neck, lightly nipping at the fur and skin you find there and breathing her scent in deeply, mixing her earthy Korgonne scent with her overdriven pheromones to incentivize your body to fucking her harder. She hums in appreciation, and returns the favor, by extending her flat tongue and giving you a languid lick along your own neck, her breath coming out raspy and haggard into your ears, letting you know that you’re <i>fucking</i> her.");

		output("\n\nIt’s tough to tell exactly how long you’ve spent with her since you’ve started – there are no windows in her apartment or her store, and even if there were, in your state of mind, it wouldn’t have mattered. All that <i>does</i> matter is that you and Nenne are together, and that the tea she’s given you is letting you experience everything that is Nenne and what she’s doing with you:");

		output("\n\nYou feel her walls cling to your every centimeter when you push in or out, every nerve and cell alighting at the touch; you hear the gentle ‘schlep’ every time you slide against each other");
		if(!pc.hasKnot(x)) output(", and the gentle clap when your bodies meet at your base");
		else output(", and the tight, sort-of-peeling sound when her tunnel stretches slightly to accommodate your [pc.knot " + x + "]");
		output("; and every time you pull apart, a new wave of her Korgonne pheromones wafts through the air and into your nose, bringing you closer–");

		output("\n\nBefore you know it, you’re there. You were much closer than you had realized, and you weren’t focused on the buildup within you as you fucked Nenne. A large rush starts from inside you, building and bubbling up your shaft; with some emergency, you push once more");
		if(!pc.hasKnot(x)) output(", hilting you entirely inside Nenne’s body, as deeply as you can reach");
		else output(", your [pc.knot " + x + "] obstructing you for a moment before your insistence, and Nenne’s willingness and physical encouragement, welcomes you inside her");
		output(". You breathe a sigh of relief, knowing that you and your cum are exactly where you need to be.");

		if(pc.cumQ() < 400) output("\n\nYour [pc.cum] floods into Nenne in elongated spurts, jetting up your [pc.cock " + x + "] and bloating it. You can feel yourself expand from the inside of yourself, and likewise you can feel Nenne squeezing down on you from the outside, her own body convulsing in orgasmic pleasure as she wordlessly, physically begs you for your seed. Though most of your jizz disappears into Nenne’s womb, right where she wants it, you can feel some of your [pc.cum] backwash against you; that won’t do, and you thrust into her again, offering another heady spurt, which Nenne accepts graciously into herself.");
		else output("\n\nNenne is momentarily snapped out of her sexual reverie when you burst inside her, your load filling her to the brim in one mere spurt. You feel your enormous quantity bloat your cock from its inside, which in turn causes Nenne’s cunt to feel all the more tighter around you, coaxing more and more out of your body. She gasps in surprise, and then her body tenses in a rolling orgasm; her fur bristles on end when you fill her welcoming womb to its limit, and your [pc.cum] rushes back onto you, backwashing your [pc.cock " + x + "] and squirting from the union between you in long, sprinkling bouts.");
	}
	// Continue here if the PC cock doesn't fit
	else
	{
		output("\n\nNenne hums to herself, a little in lust and a little in frustration, as she bucks her own motherly hips backward. You feel a light pinch at your [pc.knot " + x + "] as she gives your [pc.cock " + x + "] a pull, and your gargantuan shaft bends and pulls against her pelvis, but it’s clear that no matter how high she raises her hips, she’s not going to be able to align your tip with her entrance.");
		output("\n\n<i>“Big boy,”</i> she whispers breathlessly as she attempts again and again to find the summit of your mountain, to no avail. Your mind is foggy, and you’re too dumb to do much more than continue to stroke at the thick of her back and enjoy the sensations of her paw trying to guide your immensity somewhere. Whenever she shifts her body or tries to pull your rod beneath her, all she does is make you harder and stiffer.");
		output("\n\nFinally, she sighs in exasperation and gives up. <i>“");
		if(!korgiTranslate()) output("Idea having with Nenne");
		else output("I have another idea");
		output(",”</i> she whispers, and instead of trying to find some purchase with your log, she gently lowers herself until her crotch is pressed wetly against yours.");

		output("\n\nYou both rest there for a moment – you run your fingers through the older woman’s fluffy fur and you listen to the steady beat of her excited heart reverberating through your ribs. Whenever she shuffles a little bit, you feel her every strand of excited, bristly fur shift against your [pc.skinFurScales]; if you had the patience and the sense, you could count them as they move against you. And when she leans backward, pressing her snatch against your tumescent rod, you feel the radiating heat from her body, and the drip of her moisture against your exposed flesh.");

		output("\n\nWith her pussy against you, she slowly lifts herself up, dragging her pussy along you and pulling at the skin of your [pc.cock " + x + "], spreading the heat of her pussy along you and warming your nerves with her motions. When she falls back down, her slide is slickened with her own juices, and when she lands on your pelvis, a little bit more squirts from the union between you, pooling at your [pc.knot " + x + "]");
		if(pc.balls > 0) output(" and dripping down to the skin of your [pc.sack]");
		output(".");
		output("\n\nYou feel your dick nestle against the giving fur of her fluffy, lifted tail; your senses are so hyper-tuned that, when a drop of pre-cum bubbles at your tip, you can feel it take the long, storied journey up your entire length, ushered forward by working nerves and undulating muscles; you feel your [pc.cockHead " + x + "] spread just slightly to allow the tangy fluid out from within you; and when it dribbles all the way down, you feel each nerve that your own preseed dresses as it passes by, until it slips between you and Nenne, where it becomes indistinguishable from itself and her own soaking hot juices.");
		output("\n\nIt’s tough to tell exactly how long you’ve spent with her since you’ve started – there are no windows in her apartment or her store, and even if there were, in your state of mind, it wouldn’t have mattered. All that <i>does</i> matter is that you and Nenne are together, and that the tea she’s given you is letting you experience everything that is Nenne and what she’s doing with you:");
		output("\n\nMost of your [pc.cock " + x + "] is left cold and exposed to the air of her apartment, but you’re bombarded with a number of tertiary sensations to make up for the lack of stimulation your [pc.cockHead " + x + "] is getting: namely, whenever Nenne takes a drag of her pussy against you, you feel another spurt of your pre-cum spill from your tip; another gush of juices from her humping cunny, followed quickly by a thick waft of her pheromones, making you harder and leakier; and whenever she makes a completed pass along your length, she lets out a shuddering, helpless, lustful sigh, her breath tickling your neck and playing like music to your ears.");
		output("\n\nIt all amounts to an impending orgasm that somehow snuck up on you: you were so engrossed on everything else with Nenne that you weren’t paying any attention to your own incoming orgasm, and before you know it, it hits you <i>hard.</i> A rush starts within you and your loins, bubbling and building beneath your big dick: your [pc.hips] thrust upward impiously, trying to penetrate into nothing as your [pc.cum] rockets up the thick tube of your cock, and, unimpeded, your seed blasts from you and into the air.");

		if(pc.cumQ() < 400)
		{
			output("\n\nOnce your [pc.cum] ends its long slog climbing the tower of your tool, it blasts from your [pc.cockHead " + x + "] in quick, heady bursts, your jizz arcing through the air slightly before most of it catches on Nenne’s extended tail. What doesn’t, rains down across her back, painting her silvery thick fur with splotches of sticky white. And once she feels your seed douse down her back, you feel her heart begin to race and her body begin to shake; she adds to your cascade of cum with a blast of her own feminine juices, inundating your [pc.knot " + x + "] with her essence, unable to withhold herself.");
		}
		else output("\n\nYour [pc.cum] rockets up your shaft and erupts from the volcano that is your hardened cock: like a force of nature, your jizz showers down on you both, audibly splashing onto Nenne’s extended tail and across her back, raining onto her spine and in between your clenched fingers. Your [pc.hips] jerk and hump upwards throughout it all; one thrust, timed with another explosion of cum, arcs your jizz so high that it splats against the stony ceiling of her apartment.\n\nSoaked in the torrent of your quantity, Nenne grunts aloud, and another, hotter splash of liquid graces your [pc.knot " + x + "], the scent of her pheromones adding to the musk that comes with your [pc.cum]. Her body shakes and her heart rate accelerates, all after you had started, and she calms down well before you end.");
	}
	// Merge here
	output("\n\nYou two relax into each other, inviting each other into the blissful afterglow of some damn good sex. Your arms and hands feel stiff; you haven’t really moved them much since they locked behind Nenne’s back, and you stretch them both downward to give her thick rump a loving grope. And Nenne, in turn, moans into your ear before licking at the sweat and salt that’s accumulated on your cheek, neck, and forehead. You both squirm against each other, loving the grinding feel of your two bodies together.");
	output("\n\nThat said, you’re still under the effects of her tea");
	if(pc.hasKnot(x)) output(", and your [pc.knot " + x + "] is still lodged tightly against her quim");
	output(". Your mind is hazy and unfocused, but even you would know to not let a good thing pass.");
	output("\n\nYou start rolling your [pc.hips] against her some more, rousing you both. Might as well get your money’s worth out of her....");

	if(pc.cocks[x].cLength() < 14) chars["NENNE"].loadInCunt(pc, 0);

	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",freebieNenneScene);
}


// Continue here if the PC is female or herm and is not doing oral
public function nenneFemaleOrHermNoOralSlorral():void
{
	clearOutput();
	showNenne(true);
	output("Your hands remain mostly still at Nenne’s back, groping at the thick fur and skin there, massaging her body as she frots against you. Her pheromones permeate the air of her room, and your [pc.vaginas] ");
	if(pc.totalVaginas() > 1) output("are wetter than they’ve");
	else output("is wetter than it’s");
	output(" been since you can remember, but your lust sits backseat to all your other sensations, including how soft and warm and plush Nenne feels atop you; the way her erect nipples dig into your own; and the way her heavy boobs squish and mold around your [pc.chest] and the way her belly rubs against yours.");

	output("\n\nNenne grinds her body against you, rocking herself in rhythm-less waves; you have no energy or wherewithal to move with her, which is perhaps for the best, because you don’t have to spend the brainpower on moving and instead use it on the divinity of having the older, experienced Korgonne massage every part of your body with every part of hers. Her weighty boobs lay on your ribs, rocking you and moving you every time she pushes this way or that, and you delightedly-and-lazily go along with her, letting her decide the flow of your sex.");

	output("\n\nYou can feel everything that Nenne does to you: the tea has made your senses so hyper-tuned that nothing that has to do with your older Korgonne lover or what she’s doing to you escapes you. You could count each individual bristle of fur against your body if you had the patience (and cognizance). When her lustful breath washes down your neck and against your ear, you feel the [pc.skinFurScales] she breathed on get moist. When she rocks in one direction just a little too forcefully, you can feel her boobs misalign against you; one hard, delicious, black nipple slips just a bit off-center before her next motion corrects it.");
	if(pc.hasCock()) 
	{
		output(" Your [pc.cocks], hard as could be, ");
		if(pc.totalCocks() > 1) output("are");
		else output("is");
		output(" wedged snuggly between your bodies; with every push forward, a thick dollop of pre-cum jets from you, coating your [pc.belly] and messing up the order on Nenne’s fur.");
	}

	output("\n\nWith one particularly deep-reaching push backward, Nenne’s cunt collapses wholly onto yours, her labia overlapping your own and your [pc.clits] kissing hers rather suddenly and intensely. You instinctually wince in pleasure, drawing a huge, deep breath through your nose and clenched teeth and sucking in more of her pheromones; your arms, so far relatively idle, stiffen at her back and hold the older puppy against you tightly. You think you moan out her name, but somewhere in your mind, you know you just moaned gibberish at best.");

	output("\n\nNenne has the same reaction and nearly pauses her humping against you, so shocked and paralyzed with pleasure as she was. She collects herself after a moment, and continues fucking you the way only another woman can: with her every wave backward, your [pc.vagina] is covered from top to bottom in the mingling juices and flowered petals of Nenne’s own pussy; with your sensitivity, you could map her every outer contour, fold, and blemish using nothing but your genitals against hers, and the more Nenne fucks you, the more you think that you’re already committing it to memory.");

	output("\n\nTime has little meaning between you two as it goes on, and even if there were a window in Nenne’s apartment, you would have paid no attention to the passage of time. All that matters in your universe right now is that you have a wonderful Korgonne on top of you, fucking both of your brains out, and whatever the tea’s done to you, you hope it doesn’t stop for some while yet. After all, you still need to–");

	output("\n\nAs soon as you think about your orgasm, your pussy <i>explodes</i> in ecstasy, sending your [pc.girlCum] out in exaggerated squirts, up and against Nenne’s own cunt. You didn’t realize how close you were; all you were focused on were all the tertiary motions that Nenne was doing with you. And as soon as your realize what’s happening, it’s far too overpowering to ignore: your voice leaves your throat in a single raspy groan and your arms clench even tighter behind Nenne, holding her tighter to you, while your [pc.hips] buck upward, intent on getting some phantom cock to drive deeper inside it and seed your overjoyed ovaries.");

	output("\n\nYour body shivers in pleasure in time with the cumming waves emanating from your loins. Every time you shake uncontrollably against Nenne, she responds in kind, and her own cunt convulses with you, adding her pheromone-laced girl-jizz to the growing mess in between you both. She holds her breath until her lungs burn, and she coughs out in pleasured yips whenever another, weaker orgasm rips through her body, and the cycle repeats.");
	output("\n\nJust as you weren’t sure when it would begin, you aren’t sure when it ended. One moment, you were having the wildest orgasm of your life (that you can remember), and the next, it’s over; you and Nenne lie in a satiated puddle of Korgonne");
	if(pc.race() != "korgonne") output(" and [pc.race]");
	output(", panting and quivering against each other, riding out the sexual high between you. Your arms are stiff and tired from holding onto Nenne so tightly; she returns the affection by licking at your neck, cleaning you of the accumulated sweat there.");

	output("\n\nThat said... you might be coming down from your <i>sexual</i> high, but whatever effects the tea’s had on you is still in full swing. You splay your fingers through the thick silver fur on Nenne’s back and marvel at how each individual strand bends and coils around your fingers.");
	output("\n\nYou give Nenne a kiss on the check and buck your [pc.hips] up against her sensually, letting her know that you wouldn’t mind a round two. Might as well make every second count....");

	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",freebieNenneScene);
}

// (scene: Freebie)
public function freebieNenneScene():void
{
	clearOutput();
	showNenne(true);
	IncrementFlag("NENNE_SEX_CREDITS");
	output("It takes several hours for your body to metabolize the effects of the tea. You aren’t totally sure what happened after your first round – whether you and Nenne had a second-or-more round and what you two did during it – but what you know for sure is that, gods <i>damn</i>, you are feeling <i>great!</i>");
	output("\n\nYou sit on the edge of Nenne’s bed, reacquainting yourself with the usual sensations of your limbs and body and attuning your mind to calm down from its hypersensitivity. Nenne, meanwhile, has either metabolized her tea entirely already, or she’s close enough that she can function on a higher level at an earlier time than you. Either way, she’s bounding around the apartment like a woman that just got laid for the first time in years, happily collecting your gear for you and offering you some food and water to get your strength back.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Love making of alien from different of Korgonne! Tasty body, different to Nenne.");
	else output("Making love with an alien is so much different from the Korgonne! Mmm, your body is so different and tasty to me.");
	output("”</i> She licks at her chops for emphasis, and you idly recall that she licked at your neck an awful lot during your lovemaking. <i>“");
	if(!korgiTranslate()) output("And [pc.name] behave good timing of whole! Nenne letting of direction and pace. Good; maybe not of Nenne pace-keeping with loving of younger.");
	else output("And you behaved so well for me the whole time, [pc.name]! You let me control the direction and the pace the whole time. Which is good; I’m not sure if I could handle keeping up with the younger, faster generation.");
	output("”</i>");
	output("\n\nYou let her dote over you for a while. She showers you with affection and accolades – she must have been <i>really</i> pent up.");

	// Continue here if the PC has earned an item
	if(nenneItemCost() <= flags["NENNE_SEX_CREDITS"])
	{
		output("\n\nAfter having recuperated and getting your affects in order, you stand from Nenne’s bed for the first time in what feels like an eternity. Nenne, of course, is at your side the whole time. <i>“");
		if(!korgiTranslate()) output("And, forgetting Nenne of not. Stock item of Nenne’s taking for good for you. Stock of any!");
		else output("And, I haven’t forgotten my promise. Feel free to take any of my stock for this. Anything!");
		output("”</i>");

		output("\n\nShe reaches out with a paw, lightly grasping your hand in it, as her green eyes lock onto yours. Her eyes narrow into crescents as she smiles lovingly at you. <i>“");
		if(!korgiTranslate()) output("[pc.name] good being to Nenne. By-coming and again-doing soon; welcome always in shop.”</i>");
		else output("You’ve been good to me, [pc.name]. Come by again soon, okay? You’ll always be welcome in my shop.”</i>");
	}
	// Continue here if the PC needs to fuck Nenne s’more
	else
	{
		output("\n\nAfter having recuperated and getting your affects in order, you stand from Nenne’s bed for the first time in what feels like an eternity. Nenne, however, is busy tending to her fire pit, likely to make herself something easier to drink. You clear your throat loudly – didn’t she promise you something...?");
		output("\n\nAt your question, Nenne smiles wryly at you. <i>“");
		if(!korgiTranslate()) output("[pc.name] returning keep to Nenne. Wanting items of free visits of every! Nenne promise mating for item of free...");
		else output("You keep coming back to me, [pc.name]. You’re always looking for a free hand out every time you visit! I</i> did <i>promise you something for free in exchange for mating with me...");
		output(".”</i> She stops, licking her chops once more. <i>“");
		if(!korgiTranslate()) output("<b>Never Nenne saying once only.</b>");
		else output("</b>I never said only once.</b>");
		output("”</i>");

		output("\n\nShe returns to what she’s doing, letting her coy invitation hanging in the air. You know she’s not trying to be malicious – she’s just horny and wants a bit more from you. <i>“");
		if(!korgiTranslate()) output("Next mating, Nenne generous maybe more. Finding of one way!");
		else output("Next time we mate, maybe I’ll be a little more generous. Only one way to find out.");
		output("”</i>");
		output("\n\nLooks like you’re not getting a freebie this time, but if you really want one that badly, it won’t be hard to convince her....");
	}
	// end scene (scene: Freebie); advance clock by two hours; if the PC has earned a free item, display the shop’s menu and reduce all costs to 0 credits; else, display a [=Next=] button and place the PC one square outside of Herbs & Happy
	// I’ll admit that I kind of got lost as to how to create some kind of economy between the PC and Nenne when it came to free items, so I just resorted to more sex. In order to get a free item, the PC needs to have sex with Nenne, and how many times the PC needs to fuck her increases by one with each item they get (up to a maximum of five times before Nenne finally gives the PC something). So, the first time, they get a free item after fucking her once; then, they need to fuck her twice for another free item; then three times; etc.
	IncrementFlag("SEXED_NENNE");
	processTime(180+rand(20));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[=PeanutButter=]
// Add this option to Nenne’s talk menu if Silly Mode is activated
// Tooltip: You wonder how much Nenne would like to have a peanut butter cookie.
// Continue from here if this is the first time the PC is giving Nenne a cookie
public function peanutButterNenne():void
{
	clearOutput();
	showNenne(true);
	author("B!");
	if(flags["NENNE_COOKIES"] == undefined)
	{
		output("As the conversation moves on, you hear what sounds like a quiet rumbling, or even a purring, coming from nearby. <i>“Sorry,”</i> Nenne says sheepishly, scratching at her ears. <i>“");
		if(!korgiTranslate()) output("Eat time while ago; eat time of next not for time of many. Hungry am!");
		else output("It’s been a while since breakfast, and it’ll be a little bit of time until lunch. I guess I’m a little hungrier than I thought.");
		output("”</i>");
		output("\n\nYou ask if any of the plants she offers make for a decent meal. <i>“");
		if(!korgiTranslate()) output("Can, but not time of all. Unfilling and hard taste too. Korg’ii more for meats than planties.");
		else output("They can be, but they usually aren’t. They also aren’t very filling and they can be hard on the palette. Korg’ii like myself are more for meats than we are for plants.");
		output("”</i>");
		output("\n\nRecognizing her plight and sympathizing, you reach into your ");
		if(!silly) output("pocket");
		else output("convenient, trans-dimensional, portable hammerspace");
		output(" and rummage around for the provisions you know you have with you. You don’t have a lot, but among your wares is a small baggie, and inside it is a pair of homemade peanut butter cookies. Oh yeah! You forgot that you had those!");
		output("\n\nYou pull out the baggie and offer one of the cookies to Nenne. <i>“");
		if(!korgiTranslate()) output("Is food? Never before of seeing. Alien food good for Korg’ii?");
		else output("That’s food? I’ve never seen anything like it before. Is your alien food good for us Korg’ii?");
		output("”</i> You answer that there isn’t a creature in this universe that doesn’t love peanut butter cookies. They’re among the most delicious treats that you and your kind are capable of producing.");

		output("\n\n<i>“");
		if(!korgiTranslate()) output("Will try!");
		else output("Sure, I’ll give it a try,");
		output("”</i> Nenne says, outstretching her paw. You remove one of the two cookies and give it to her; she turns it over in her paw and gives it a sniff, investigating it and frowning when miniscule bits crumble to her floor. The cookie itself isn’t very large and would likely only give her a mouthful if she ate the whole thing at once – so, without any further delay, she shoves the whole thing into her maw.");
	}
	// Continue from here for subsequent cookie-givings
	else
	{
		output("As the conversation moves on, you hear what sounds like a quiet rumbling, or even a purring, coming from nearby. You eye Nenne suspiciously; she smiles sheepishly back at you, her hands behind her back, as she tries to maintain her innocence.");
		output("\n\nYou ask Nenne if she’s had a chance to eat properly today. <i>“");
		if(!korgiTranslate()) output("Yessing! Never Nenne skip meals; important for fur of quality keeping and health!");
		else output("Yes, of course! I’d never intentionally skip any meals; a good diet is important for maintaining proper fur quality and health.");
		output("”</i> She rocks forward on her heels, leaning towards you. <i>“Buuuuuuuuuut, ");
		if(!korgiTranslate()) output("last eat time many ago-ago, and next eat time many waits from now. Having any... treats for Nenne to eat for waiting?");
		else output("breakfast was a long time ago, and lunch won’t be for a little while yet. Do you have any... treats to give me to tide me over until then?");
		output("”</i>");
		output("\n\nYou smirk and say that you might just have the thing. As soon as your hand reaches into your ");
		if(!silly) output("pocket");
		else output("convenient, trans-dimensional, portable hammerspace");
		output(", Nenne’s nipples become erect and she begins to salivate. As soon as you withdraw yet another peanut-butter cookie (you had more in there than you realized!) and offer it to her, she snatches it from your hand and unceremoniously crams the whole thing into her mouth.");
	}
	// Merge here
	output("\n\nAs soon as her mouth closes and her teeth skewer into the pastry, the response is immediate: her eyes widen and her pupils dilate, and her knees begin to buckle. Nenne loses her balance; she leans backward, her hand searching for the nearest wall to lean against. Her fur stands on end; her tail straightens behind her; her black nipples become hard as stone, jutting obscenely into the cool air of her apartment; and viscous juice drips from her cunt.");
	output("\n\nA throaty groan escapes her, muffled through the flaky cookie resting idle and half-eaten in her mouth. She breathes deeply through her nose as her eyes roll upward, back into her skull. Her jaw moves slightly, biting into it once more, and she falls to both knees: her motherly hips thrust forward, into the air, fucking at some invisible cock while her pussy spews her feminine cum forward, splashing along the floor in front of her.");
	output("\n\nHer breathing increases with her pulse as she frantically tries to maintain control of her own body. One hand is still against the wall, while her other paws ineffectually at her breast, squeezing at her nipple and kneading at the taut flesh with whatever strength is still with her. Her legs splay so widely that she’s nearly doing the splits; her soaking wet pussy soon touches onto the floor, and when it does, another spasm rockets up and down her body, and she frantically fucks her own floor in animalistic, unrestrained pleasure.");
	output("\n\nHer jaw moves once more, biting into the cookie, and her mouth soon goes slack; her tongue lolls from her mouth, leaking spittle and chewed bits of cookie out onto her breasts and across her neck. Her hips roll forward, harshly dragging the petals of her pussy against the chiselled stone floor of her shop and leaving trails of her hot liquid for her to slide back across. She humps the floor with raw abandon, and every time she completes a circuit, she shivers in delight and sprays a fresh coat down beneath her.");
	output("\n\nFinally, she swallows what bit of peanut butter cookie she hasn’t drooled back onto herself. As soon as the delicious treat slides down her throat, her upper body loses its strength as all energy and motor functions rush to between her legs. Her body visibly ripples and shivers as she cums one final time in front of you, legs nearly parallel to the floor and her pussy plugged snugly against it, the fluids rising up just slightly to meet her drippy, needy vagina. She goes silent and still, save for the occasional, pleasurable aftershocks that make her twitch, from the fat of her thighs up to her belly and heavy boobs.");
	output("\n\nAfter a moment, her eyes roll back down from behind her skull – and then they un-cross, focusing in front of her. It takes her a moment to recognize where she was and what she was doing; she first looks at her weary arms, then down across her belly and to the floor beneath her. She says nothing and makes no expression when she recognizes the lustful mess she made beneath herself.");
	output("\n\nYou ask Nenne if she enjoyed the treat you gave her.");
	output("\n\nHer hair is haggard and messy around her eyes and ears, and her mouth hangs agape as she tries to catch her breath. You can tell that she understood the question, but it takes her longer than you think she realizes to answer you.");
	output("\n\n<i>“Uh,”</i> she begins, still heaving as she comes down from her multiple orgasms, <i>“yes. ");
	if(!korgiTranslate()) output("Wanting not to be selfish, but... if more having, maybe giving to Nenne? Enjoy would being of another treat.");
	else output("I don’t want to sound selfish or anything, but... if you have any more, maybe you could give it to me? I’d, uh, enjoy having another treat.");
	output("”</i>");
	output("\n\nYou tell her that if you ever happen to have another peanut butter cookie, you’ll be sure to think of her.");
	processTime(10);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	IncrementFlag("NENNE_COOKIES");
}