public function kressiaSurvivalShopEntryFunc():Boolean
{
	author("Savin");
	showBust("ANARRIE", "SHIARE");

	output("\n\n");
	if (flags["MET_ANARRIE"] == undefined) output("A red myr woman in a long coat");
	else output("Anarrie");
	output(" is sitting behind the counter, alternating between helping customers who're interested in some of the shop's more militant wares and reading passages from an oversized, leather - bound tome whenever she can catch a moment's respite.");
	if (flags["MET_ANARRIE"] != undefined)
	{
		if (flags["FUCKED_ANARRIE"] == undefined) output(" Seeing you browsing through the shop, Anarrie gives you a friendly nod.");
		else output(" Seeing you looking her way, Anarrie's cheeks flush with a hint of crimson. She gives you a slight smile and a nod.");
	}

	output("\n\n");
	if (flags["MET_SHIARE"] == undefined) output("An extraordinarily busty gold myr girl");
	else output("Shiare");
	output(" is working behind the register, usually handling small silver and gold coins unless the occasional offworlder wanders through, forcing her to switch over to an oddly out-of-place electronic chit-reader sitting to her side. With every motion, the buxom ant's enormous rack jiggles and bounces, barely constrained by her simple tank-top and the straining bra underneath.");
	if (flags["MET_SHIARE"] != undefined)
	{
		if (flags["FUCKED_SHIARE"] == undefined) output(" Shiare flashes you an oddly flirtatious wink while she works. The longer you look her way, the more her movements seem to favor making her oversized bust move suggestively.");
		else output(" Catching your eye, the busty ant-babe wiggles her hips and curls one of her sets of arms under her bust to heft it up for your inspection. Her saucer-like nipples press against her clothing, tenting out her tank top in the most inviting way. Shiare gives you a sultry wink as your gaze wanders over all she's got on display for you.");
	}

	addButton(0, "Ant Girls", kressiaSurvivalShopAntGirls);

	return false;
}

public function kressiaSurvivalShopMenu():void
{
	clearMenu();
	
	shopkeep = anarrie;

	addButton(0, "Shop", buyItem, undefined, "Buy", "Buy stuff.");
	addButton(1, "Talk", kressiaSurvivalShopTalk, undefined, "Talk", "Ask the ant-girl owners some questions.");
	//addButton(2, "Discount?", null);
	addButton(14, "Back", mainGameMenu);
}

public function kressiaSurvivalShopHeader():void
{
	showName("KRESSIA\nSURVIVAL SHOP");
	author("Savin");
	showBust("ANARRIE", "SHIARE");
}

public function kressiaSurvivalShopAntGirls():void
{
	clearOutput();
	showBust("ANARRIE", "SHIARE");
	showName("KRESSIA\nSURVIVAL SHOP");
	author("Savin");

	if (flags["KSS_ENTERED"] == undefined)
	{
		output("You meander through the cozy little shop and up to the counter where the mis-matched pair of myr women are working. Seeing you approach, the red-plated one stands up - with effort, you notice, and leaning pretty heavily on a simple metal cane. Still, despite a momentary grimace while she was getting to her feet, the red myr woman gives you a disarmingly friendly smile.");
		
		output("\n\n<i>“Welcome to our shop, star-walker. I’m Anarrie Viirkan, the proprietor, and this is my wife Shiare,”</i> she says, sweeping an arm towards the curvaceous honeypot working the register who gives you a wave while her other three arms man-handle a huge metal can through the electronic register for another human explorer. <i>“If you’d like to see any of our display items, or need any help, don’t hesitate to ask either one of us.”</i>");
		
		output("\n\n<i>“If you find anything you want, just bring it on over here,"); 
		if (pc.isMasculine()) output(" handsome");
		else output(" hot stuff");
		output(",”</i> the gold myr, Shiare, chimes in. With a wink, she adds <i>“I’ll treat you right!”</i>");
		
		output("\n\nAnarrie chuckles, though you see her insectile antennae twitch furtively in her wife’s direction. <i>“So, anything I can show you?”</i>");
	}
	else
	{
		if (flags["FUCKED_ANARRIE"] == undefined) output("<i>“Welcome back, star-walker,”</i> Anarrie says, leaning on her cane and standing. <i>“Looking for anything in particular today?”</i>");
		else output("<i>“Oh, hey, Steele,”</i> Anarrie says, hefting herself up to her feet and giving you a broad smile. <i>“Just here to shop today, or did you have... something else in mind?”</i>");
	}

	flags["KSS_ENTERED"] = 1;
	flags["MET_ANARRIE"] = 1;
	flags["MET_SHIARE"] = 1;
	
	//Shop Menu
	kressiaSurvivalShopMenu();
}

public function kressiaSurvivalShopTalk():void
{
	clearOutput();
	kressiaSurvivalShopHeader();

	output("<i>“Mind if I ask you something?”</i> you say, leaning over the counter to look Anarrie in the eye. Her eyes are black, insectile, largely featureless save for the glint of firelight reflecting in them.");
	
	output("\n\nShe blinks once, a bit surprised by your sudden closeness, but nods. <i>“Sure. Ask away.”</i>");

	kressiaSurvivalShopTalkMenu();
}

public function kressiaSurvivalShopTalkMenu():void
{
	clearMenu();
	addButton(0, "Her Wife", kressiaSurvivalShopTalkHerWife, undefined, "Her Wife", "Ask Anarrie about her gold myr lover.");
	addButton(1, "Fed. Army", kressiaSurvivalShopTalkFedArmy, undefined, "Federation Army", "Ask Anarrie about her experience in the Federation military. Red myr do love their war stories...");
	addButton(2, "Her Shop", kressiaSurvivalShopTalkHerShop, undefined, "Her Shop", "So how did Anarrie end up all the way out in Kressia and running a store?");
	addButton(3, "Venom Vials", kressiaSurvivalShopTalkVenomVials, undefined, "Venom Vials", "You see several vials filled with a frothy pink liquid, quite blatantly labeled ‘Red Venom’. Maybe you could ask about that...");

	addButton(14, "Back", kressiaSurvivalShopMenu);
}

public function kressiaSurvivalShopTalkHerWife():void
{
	clearOutput();
	kressiaSurvivalShopHeader();

	output("<i>“So, how’d you and Shiare get together?”</i> you ask. <i>“Is she-”</i>");

	output("\n\n<i>“She’s not a trench wife,”</i> Anarrie says firmly. <i>“She married me by choice, not at gunpoint, if that’s what you wanted to know. Not every Gold-Red couple has to be like that, you know.”</i>");

	output("\n\nFrom over at the other counter, you hear Shiare chuckle. <i>“You don’t have to be defensive, Ana. It’s not exactly a hard assumption to make.”</i>");

	output("\n\nAnarrie puts her hands up and sighs. <i>“Sorry. I just get so sick of that question. We both do. I met Shiare before the war even started - the firm she was working for was doing contract work in a border town. I was in the Federation border guard, and we’d go into town sometimes when we got off duty. Both countries claimed it, neither enforced it. Understand?”</i>");

	output("\n\n<i>“We met in a bar and hit it off,”</i> Shiare laughs, finishing up a customer and flashing you a smile. <i>“That was a couple years before the war, though. We were just bored kids looking to have some fun in the couple of off hours we could scrounge up. I’d only just gotten out of the Thollum, really, when we met. Young and in love,”</i> she giggles, her body moving in a way that makes her enormous tits bounce seductively under the confines of her shirt.");

	output("\n\nAnarrie nods. <i>“Federation took over the town in the first week of the war. Shiare’s been in our territory for, what, seven years now? Long enough that she was granted citizenship well before you aliens started showing up. Right before we got married, too.”</i>");

	output("\n\nYou look over at the buxom honeypot and raise an eyebrow. <i>“You wanted to be a Federation citizen?”</i>");

	output("\n\nShe answers with a playful giggle. <i>“Sure! We’re all going to be eventually, the way things turned out. I figured I might as well get ahead of the curve and apply. Besides, it’s hard to get a job when you’re a ‘conquered foreigner.’”</i>");

	output("\n\nYou’d say that’s an awfully defeatist attitude, but the way she’s talking, Shiare’s pretty much switched teams completely.");

	output("\n\n<i>“So when’d you two actually get married?”</i> you ask.");

	output("\n\nAnarrie and Shiare exchange a look, and the red warrior answers: <i>“Just after I was discharged. About half a year before the first star-walkers arrived, I’d say.”</i>");

	output("\n\n<i>“And happy ever since,”</i> Shiare adds, bouncing over to wrap a set of arms around her wife’s shoulders - which has the almost certainly intentional side effect of planting her prodigious rack right on top of Anarrie’s head. The red woman grins and blushes, clearly not minding her new-found headgear.");

	kressiaSurvivalShopTalkMenu();
	addDisabledButton(0, "Her Wife");
}

public function kressiaSurvivalShopTalkFedArmy():void
{
	clearOutput();
	kressiaSurvivalShopHeader();

	output("<i>“Mind telling me a little about your army days?”</i> you prompt, figuring the veteran ant’s probably got a few stories to tell.");
	
	output("\n\nInstead of opening up about exploits, Anarrie adjusts her grip on her cane and says, <i>“I’d rather not, if it’s all the same to you. I think about it enough on my own time, thanks.”</i>");
	
	output("\n\nShe taps her cane against her left leg, which answers with a dull metallic <i>thump!</i>. There’s something very final about the gesture that does not invite further inquiry.");

	kressiaSurvivalShopTalkMenu();
	addDisabledButton(1, "Fed. Army");
}

public function kressiaSurvivalShopTalkHerShop():void
{
	clearOutput();
	kressiaSurvivalShopHeader();

	output("<i>“How’d you end up all the way out here running a shop?”</i> you ask, glancing around the cozy little storefront.");
	if (pc.isMischievous()) output(" <i>“You’re a long way from home, after all.”</i>");
	
	output("\n\nThe red myr woman laughs, leaning back in her chair. <i>“It’s a funny story, actually. Right after I was discharged, a lot of us wounded veterans were offered free airlifts to the region by your Confederacy’s medical company. Xenogen, I think? They were offering those of us who needed it these cybernetic replacements and other wound treatment. Your medical technology is many years more advanced than ours, I have to admit. The people who operated on us worked miracles. When I woke up after they’d finished operating on me, though, almost all of the women I’d come with had already returned home, and there were no more direct transports back to the heartland. Apparently I had some sort of allergic reaction to the anesthetic they gave me, and stayed in a coma for an extra week.”</i>");
	
	output("\n\nShe gives a wry chuckle and rubs at her left knee, which makes a metallic clicking sound under her pants. <i>“When the doctor, some sort of half-horse woman, finally released me, I decided to take advantage of the cease fire that had been declared - and my newfound mobility - to walk for a while. I ended up in Kressia pretty much by accident, just wandering through the trenches. The old battlefields have a weird beauty to them, silent and oppressive. If you ever have the chance to walk through them, do it.”</i>");
	
	output("\n\n<i>“Old battlefields are beautiful? Now that’s morbid,”</i> Shiare says with what must be the myr equivalent of rolling her eyes.");
	
	output("\n\nAnarrie just scowls. <i>“ANYway, I wandered into Kressia, just in time to see the first waves of you... what do you call yourselves - planet-rushers? - coming in from the airfield. They were so completely in awe of the city: ‘an underground civilization, what will they think of next?’ Ha. None of them had done cave exploration before, and here I was at the nexus of the airfield, the trenches, and the biggest access to the deep caves there is for miles around. There were plenty of empty storefronts around, and I knew a little about being a merchant, so... I wrote Shiare and and told her to pack her bags. Money to be made.”</i>");
	
	output("\n\n<i>“What she didn’t say is that this place was going to be a fixer-upper,”</i> Shiare adds, waving one of her four arms around the shop. <i>“A bomb went off just down the street, so we didn’t have any windows, the walls were banged up...”</i>");
	
	output("\n\n<i>“But we made it work,”</i> Anarrie finishes with a smile. <i>“Anybody who’s thinking about going out in No Man’s Land learns pretty quick to stop in here first. Trust me, you don’t wanna go out there without one of our minesweepers to clear the path, or a good flare gun to light the way.”</i>");

	kressiaSurvivalShopTalkMenu();
	addDisabledButton(2, "Her Shop");
}

public function kressiaSurvivalShopTalkVenomVials():void
{
	clearOutput();
	kressiaSurvivalShopHeader();

	output("<i>“Is that ‘red venom’ what I think it is?”</i> you ask, rapping a knuckle on the glass display case, just over the arrangement of pink-filled vials.");
	
	output("\n\nAnarrie answers with a surprisingly nonchalant nod. <i>“It is. The Republic’s Queens outlaw it in their territory as a dangerous drug, but there’s no proscription against its sale now that Kressia is in Federation territory. It’s hard to regulate something any one of us can spit out, after all. Besides, its sale serves a necessary function here, keeping trench wives from going into withdrawal if their mistresses need to leave them alone for a short time, and making sure any addicts can continue to function without having to rely on another woman constantly.”</i>");
	
	if (flags["FUCKED_ANARRIE"] != undefined)
	{
		output("\n\nWith a conspiratorial look around, she bids you to lean down a little closer. When you do, she continues: <i>“Some might think it’s very... let’s say ‘erotic’... to become addicted to a lover’s vital essence, but let’s be honest: it’s not very practical to be constantly reliant on anybody, even your wife.");
	}
	else
	{
		output("\n\nWith a hint of pride, she adds, <i>“");
	}
	output("If there’s anything I try and foster here in my shop, it’s self-reliance. Independence.”</i>");
	
	output("\n\nFrom the other counter, her lover chuckles and says, <i>“Come on, Ana, you’d be helpless without me!”</i>");
	
	output("\n\n<i>“Only emotionally, I’ll have you know,”</i> the red answers with indignation. <i>“Besides, if </i>I<i> wasn’t around, you’d never be able to reach anything on the top shelves.”</i>");
	
	output("\n\nShiare bursts out laughing. <i>“So you’re a glorified stepladder, is that it?”</i>");
	
	output("\n\n<i>“Dammit,”</i> Anarrie huffs, crossing her arms. Turning back to you, she asks <i>“Any more questions?”</i>");
	
	output("\n\nYou have to ask: where does she get all that venom?");
	
	output("\n\n<i>“Let’s just say it’s all made made in-house,”</i> Annarie says, giving you a coy look. <i>“I mix mine with just a touch of soda water and honey to make it frothier and sweeter. It’s been pretty popular since we opened, more so than I would have thought. Especially with you star-walkers. Definitely our most popular item with the aliens that come through. Couldn’t tell you why.”</i>");
	
	if (9999 == 0)
	{
		output("\n\n{if PC is venom-addicted: You might have an idea...}");
	}

	kressiaSurvivalShopTalkMenu();
	addDisabledButton(3, "Venom Vials");
}