//Overview:
//This is my (B, the one and only!) submission for the Korg’ii hold: a shopkeeper by the name of Nenne.

//Nenne is an older Korgonne; Fenoxo had written that if he were to do the shopkeeper, he’d write an older, infertile lady. Nenne is a MILF and knows her way around her own body, and while she’s a bit older, she’s not exactly a granny. I was kind of going for a Dogmom-sort-of feel for her: thick, experienced, and sensual. She doesn’t have the energy she used to have, but she knows that sex isn’t a race, although you both want to cross the finish line.

//As a shopkeep, she offers a number of herbal items, as well as a transformative to turn the PC into a Korgonne themselves. She also sells a once-per-combat healing poultice and ‘explosion weed bombs.’ This will be my first attempt at writing a shopkeeper – I hope it goes well!


//She’s sexable, of course, with at least one scene per gender (and maybe a third for characters with no gender, I haven’t decided yet. Especially if I only have a max wordcount of 10,000). The Korg’ii Hold doesn’t accept credits until the PC has completed a quest involving the princess, so, in order to get any of Nenne’s items, you’ll have to entertain her for a little bit. This doesn’t necessarily mean sex, but she definitely wouldn’t say no. The more items you get for free, the more you have to entertain her.

// The PC enters a shop called ‘Herbs & Happy’ for the first time
// (scene: Herbs And Happy)
public function herbsAndHappyBonus():void
{
	author("B!");
	if(flags["MET_NENNE"] == undefined)
	{
		output("You enter what appears to be a shop, chiseled into the stone of the Korg’ii hold; outside is a simple, finger-painted sign displaying some grass, or perhaps herbs, followed by some alien text that you had difficulty translating. You surmised it to be some kind of herbal shop – perhaps this place offers natural medicines and the like? Only one way to find out.");
		output("\n\nThe room just beyond the entrance is a little cozier than you had anticipated: it is little more than a foyer for a larger residential apartment. Another opening to your right, chiseled into the stone, leads and bends into where the shopkeeper must live. Before you is a crude stone chair that’s a little small, but the seat’s been carefully smoothed and rounded to provide as much comfort as possible; behind it is a number of small holes, carefully drilled and pockmarked into the stone, where mosses, herbs, plants, grasses and vines are stored and spill out of.");
		output("\n\nStanding before all of that is a Korgonne, fussing beneath the holes in the walls, carefully sorting the spilled greens with her pawed hands. She turns to look at her customer, and you see the greying lines around the mouth of her snout and the frayed, limp tips of her ears. She’s clearly a bit older than some of the other Korgonne around the hold.");
		output("\n\n<i>“Hello!”</i> she says, finishing up her task before properly tending to you as her customer. <i>“");
		if(!korgiTranslate()) output("Name of Nenne, welcoming you to Herbs And Happy!");
		else output("My name is Nenne, and welcome to Herbs And Happiness!");
		output("”</i>");
		output("\n\nNenne moves a little slower than you’ve seen most Korgonne move, but you attribute that to her apparent age. Her disposition is nonetheless as cheerful and excited as you’ve come to expect from a Korgonne. You introduce yourself to the older Korgonne with a smile. <i>“");
		if(!korgiTranslate()) output("I can being of help for you, [pc.name]?");
		else output("How can I help you today, [pc.name]?");
		output("”</i>");
		flags["MET_NENNE"] = 1;
		processTime(2);
		herbsAndHappyMenu();
	}
	// The PC enters Herbs & Happy, subsequent times
	else
	{
		output("You return to your favorite apothecary within the Korg’ii hold. Sitting on the simple stone chair, weaving strands of ivy into braids to sell, is Nenne; she hums to herself in absent-minded contentment, but as soon as you enter the room, she places her plants in their appropriate slot and stands to greet you.");
		addButton(0,"Nenne",approachNenne);
	}
	// end scene (scene: Herbs And Happy)
}

public function approachNenne(back:Boolean = false):void
{
	clearOutput();
	showNenne();
	if(back) output("What else would you like to do with Nayna?");
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

	addButton(14,"Back",approachNenne,true);
}



//[=Poultice=]
//// Tooltip: You can’t see the actual plants and herbs; they’re wrapped tightly in a thin gauze, which is tied shut at the top. You’re supposed to unravel the gauze, then apply the herbs to your body, and keep them in place <i>with</i> the gauze. It’s a bit primitive as far as medicine goes, and it’s too unwieldy to use more than once in a fight, but it’ll do in a pinch.\n\nRestores 25 HP immediately\nRestores an additional 8 HP once per turn if used in combat\nRestores an additional 1 HP every minute if used outside of combat\nRestores 50 HP total\n\nCost: 40 Credits
//
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
//[=AphroDaisy=]
//// Tooltip: This gentle flower with wavy pink petals emits a scent that reminds you of the lust-inducing pheromones of the female Korgonne. One whiff of this is guaranteed to force any opponent to think about something else.\n\nDoes {x} Lust damage\n\nCost: 40 Credits
//
//// end scene (scene: H&H Inventory)

//[=AcceptCredit?=]
// Tooltip: Ask Nenne if she accepts credits as a form of economy in her shop.
// Tooltip (already selected; does not accept credit): Nenne’s offered you any one thing in her shop for free, provided you ‘satisfy’ her craving for some ‘conversation.’
// Tooltip (already selected; does not accept credit; Silly Mode on): Nenne’s offered you any one thing in her shop for free, provided you fuck her hot, Korgonne-milf ass until she’s a quivering, senseless mush on the floor.
// Tooltip (already selected; accepts credit): Nenne accepts credit in her store, but she’s still willing to trade you something of hers in exchange for a bit of attention.
// (scene: H&H Credit)
public function acceptCredits():void
{
	clearOutput();
	showNenne();
	output("As you browse along Nenne’s wares, you notice that each little hole that houses her plants and herbs has a number of little scratches beneath them. They don’t look informative enough to be names or descriptions, so you surmise them to be price tags. But all you have are credits. You turn to her and ask if she accepts them.");

	// Continue here if she does not.
	if(9999)
	{
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
	}
	// Continue here if she does.
	else
	{
		output("\n\n<i>“");
		if(korgiTranslate()) output("Princess saying to me that credit is good!");
		else output("Tribe say credits are good for trade now thanks to Nayna,");
		output("”</i> Nenne says, smiling toward you. <i>“");
		if(korgiTranslate()) output("Okay to taking herbs if I am okay to taking credits. Good trade!");
		else output("It’s still not my preferred economy, but if it’s good for the princess, then it’s good for me.");
		output("”</i>");

		output("\n\nShe pulls forward, one finger trailing down your arm gently as her eyes lock onto yours. <i>“");
		if(!korgiTranslate()) output("But trading in together-time still offer good, cuteness");
		else output("But my offer to give you something for free in exchange for some time together is still on the table, cutie,");
		output("”</i> she says, her voice low and dripping with sensuality.");

		output("\n\nIf you’re in the mood to make something else of hers drip, and get some stock of hers for free, then it’s good to know that the offer is still there.");
	}
	// end scene (scene: H&H Credit)
	//9999
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
	else if(korgiTranslate()) output("Two boylies, one girly");
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

	output("\n\nShe leans into your head, her tail wagging furiously behind her at your encouragement. <i>“");
	if(!korgiTranslate()) output("Too hoping right.");
	else output("I hope you’re right, too.");
	output("”</i> Her eyes meet yours, and they narrow seductively; her tail stops its rampant swishing and slows to a much more casual pace. <i>“");
	if(!korgiTranslate()) output("Closer being then thinking for both us.");
	else output("Maybe they’re a little closer than we both think.");
	output("”</i>");

	output("\n\n<i>“Maybe,”</i> you respond, understanding exactly what she means.");

	// end scene (scene: Nenne’s Family); grey out all options, including [=Back=], except [=Flirt=]
	processTime(20);
	clearMenu();
	addButton(0,"Next",talkToNenne);
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

	// end scene (scene: Nenne’s Shop); grey out all options, including [=Back=], except [=Flirt=]
	processTime(20);
	clearMenu();
	addButton(0,"Next",talkToNenne);
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

	// end scene (scene: Nenne’s Uveto); grey out all options, including [=Back=], except [=Flirt=]
	// If Nenne turns out to be popular enough, this should be a decent hook to make her a crewmate in an expansion.
	processTime(20);
	clearMenu();
	addButton(0,"Next",talkToNenne);
}