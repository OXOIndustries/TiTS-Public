public function kressiaSurvivalShopEntryFunc():Boolean
{
	author("Savin");
	showBust("ANARRIE", "SHIARE");

	output("\n\n");
	if (flags["MET_ANARRIE"] == undefined) output("A red myr woman in a long coat");
	else output("Anarrie");
	output(" is sitting behind the counter, alternating between helping customers who’re interested in some of the shop’s more militant wares and reading passages from an oversized, leather - bound tome whenever she can catch a moment’s respite.");
	if (flags["MET_ANARRIE"] != undefined)
	{
		if (flags["FUCKED_ANARRIE"] == undefined) output(" Seeing you browsing through the shop, Anarrie gives you a friendly nod.");
		else output(" Seeing you looking her way, Anarrie’s cheeks flush with a hint of crimson. She gives you a slight smile and a nod.");
	}

	output("\n\n");
	if (flags["MET_SHIARE"] == undefined) output("An extraordinarily busty gold myr girl");
	else output("Shiare");
	output(" is working behind the register, usually handling small silver and gold coins unless the occasional offworlder wanders through, forcing her to switch over to an oddly out-of-place electronic chit-reader sitting to her side. With every motion, the buxom ant’s enormous rack jiggles and bounces, barely constrained by her simple tank-top and the straining bra underneath.");
	if (flags["MET_SHIARE"] != undefined)
	{
		if (flags["FUCKED_SHIARE"] == undefined) output(" Shiare flashes you an oddly flirtatious wink while she works. The longer you look her way, the more her movements seem to favor making her oversized bust move suggestively.");
		else output(" Catching your eye, the busty ant-babe wiggles her hips and curls one of her sets of arms under her bust to heft it up for your inspection. Her saucer-like nipples press against her clothing, tenting out her tank top in the most inviting way. Shiare gives you a sultry wink as your gaze wanders over all she’s got on display for you.");
	}

	addButton(0, "Ant Girls", kressiaSurvivalShopAntGirls);

	return false;
}

public function kressiaSurvivalShopMenu():void
{
	clearMenu();
	
	// Apply Discounts
	if(pc.hasStatusEffect("Kressia Survival Shop Discount")) chars["ANARRIE"].sellMarkup = 0.75;
	else chars["ANARRIE"].sellMarkup = 1.2;
	shopkeep = anarrie;

	addButton(0, "Shop", buyItem, undefined, "Buy", "Buy stuff.");
	addButton(1, "Talk", kressiaSurvivalShopTalk, undefined, "Talk", "Ask the ant-girl owners some questions.");
	//addButton(2, "Discount?", null);
	addButton(2,(flags["DISCOUNT_SEXED_SURVIVAL_SHOP"] == undefined ? "Flirt" : "Sex"), discountFlirtsFromPolyants);

	addButton(14, "Back", mainGameMenu);
}

public function kressiaSurvivalShopHeader(nude:Boolean = false):void
{
	showName("KRESSIA\nSURVIVAL SHOP");
	author("Savin");
	if(!nude) showBust("ANARRIE", "SHIARE");
	else showBust("ANARRIE_NUDE","SHIARE_NUDE");
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
	
	output("\n\nAnarrie just scowls. <i>“ANYway, I wandered into Kressia, just in time to see the first waves of you... what do you call yourselves - planet-rushers? - coming in from the airfield. They were so completely in awe of the city: ‘an underground civilization, what will they think of next?’ Ha. None of them had done cave exploration before, and here I was at the nexus of the airfield, the trenches, and the biggest access to the deep caves there is for miles around. There were plenty of empty storefronts around, and I knew a little about being a merchant, so... I wrote Shiare and told her to pack her bags. Money to be made.”</i>");
	
	output("\n\n<i>“What she didn’t say is that this place was going to be a fixer-upper,”</i> Shiare adds, waving one of her four arms around the shop. <i>“A bomb went off just down the street, so we didn’t have any windows, the walls were banged up...”</i>");
	
	output("\n\n<i>“But we made it work,”</i> Anarrie finishes with a smile. <i>“Anybody who’s thinking about going out in No Myr’s Land learns pretty quick to stop in here first. Trust me, you don’t wanna go out there without one of our minesweepers to clear the path, or a good flare gun to light the way.”</i>");

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
	
	if (pc.isDependant(Creature.DEPENDANT_MYRVENOM))
	{
		output("\n\nYou might have an idea...");
	}

	kressiaSurvivalShopTalkMenu();
	addDisabledButton(3, "Venom Vials");
}

//continue from Discount?
//requires having bought 2-3 items
public function discountFlirtsFromPolyants():void
{
	clearOutput();
	kressiaSurvivalShopHeader();
	author("Gardeford");
	if(silly) author("Gardenforks");
	
	if(flags["DISCOUNT_SEXED_SURVIVAL_SHOP"] == undefined)
	{
		output("<i>“What would you say to showing me some of your more, </i>personal<i> equipment?”</i> you ask, leaning over the counter and giving Anarrie a coy smile. She raises an eyebrow, regarding you with a not insignificant amount of confusion.");
		output("\n\n<i>“Uh, everything we have available is on display. I don’t think there’s anything in back that isn’t displayed up fr-”</i> she begins, suddenly stopping and blushing fiercely. <i>“Oh, you don’t mean the inventory, do you.”</i>");
		output("\n\nYou shake your head, and the veteran ant gives an understanding nod. She looks around awkwardly, trying to speak but unable to find the right words. For a second you worry that you may have crossed a boundary a bit too early, but you notice Shiare coming over from the other register. The curvy honeypot hugs her wife from behind, stopping her fumbling with a firm grip.");
		output("\n\n<i>“Come on, it’ll be fine. [pc.HeShe]’s a cutie anyway. Isn’t that exactly what you’ve been looking for? I’ll get [pc.himHer] ready, you just go back and make yourself comfortable,”</i> she says calmly, tracing a finger around the smooth skin beneath Anarrie’s shoulder. The red myr’s nervousness melts away, and she gives the two of you a determined look before standing.");
		output("\n\n<i>“S-sure. I’ll see you both shortly,”</i> she states awkwardly, taking her cane and disappearing into the back of the store. Once she’s out of sight, Shiare turns to face you, a serious gaze replacing her usual kind smile. When she speaks, it’s with a much sharper edge than you’ve ever heard from her.");
		output("\n\n<i>“Look, Ana has a hard time with this kind of stuff. I had to all but carry her to the bedroom and pry her legs open with a crowbar the first time we had sex. She’s expressed interest in having another person involved, but unfortunately the poor thing has no idea how to make that happen. It seems like she’s perfectly okay with you, but I’d appreciate any requests you have going through me, okay?”</i> she explains, waiting patiently for your answer.");
		output("\n\n<i>“");
		if(pc.isBimbo()) output("Oh definitely! I wouldn’t want her to, like, be uncomfortable");
		else if(pc.isNice()) output("Sure! Anything that would make her more comfortable");
		else if(pc.isMischievous()) output("I suppose, if you don’t mind spoilers");
		else output("Works for me");
		output(",”</i> you reply in earnest. A familiar smile returns to Shiare’s face upon hearing your response.");

		output("\n\n<i>“Great! I have some possibilities to recommend, but I’m open to ideas if you have any. Ana really wants to see me get tied up and fucked as hard as possible, and while that isn’t the highest on my list of fetishes, I can get into it if it makes her happy,”</i> she confides before leaning in a bit closer.");
		output("\n\n<i>“She’s even talked about watching me get milked! That’s the thing about reds: after you peel away their uptight shell, they’re just as lusty as any of us golds. Maybe even more so,”</i> she states quietly, giving you a salacious wink.");
		output("\n\n<i>“So, " + pc.mf("Mister","Miss") + " Steele. What did you have in mind?”</i>");
		processTime(4);
		pc.changeLust(20);
	}
	//Repeat
	//choose sex from the main shop menu
	else
	{
		output("You wait for the store to be emptied of customers before walking up to Shiare and asking if her and Anarrie have time for some off-duty fun. She answers your question with a devilish smile before directing her gaze to Ana. The crimson plated ant-girl flushes, nodding and heading to the bedroom in the back of the store.");
		//Hardlight Voyeur intro - requires sum milkin sluuuuts
		if(flags["HARDLIGHT_ANT_PROC"] == 1 && pc.hasHardLightStrapOn())
		{
			hardlightVoyeurForAntSlooooots();
			return;
		}
		output("\n\n<i>“Just let me close up shop and we can talk ‘business,’”</i> Shiare replies, sauntering over to the door and flipping a small wooden sign before locking it. The curvaceous honeypot’s body language shifts as she turns, giving you a seductive grin as she returns to your side.");
		output("\n\n<i>“Well, " + pc.mf("Mister","Miss") + " Steele. What did you have in mind?”</i>");
		processTime(4);
		pc.changeLust(5);
	}
	survivalShopSexMenu();
}

public function survivalShopSexMenu():void
{
	clearMenu();
	//[milking](Tie Shiare up and milk her in front of her wife, teasing Anarrie all the while)
	if((pc.isTaur() && pc.cockThatFits(chars["ANARRIE"].vaginalCapacity(0)) >= 0) || (!pc.isTaur() && (pc.cockThatFits(chars["ANARRIE"].vaginalCapacity(0)) >= 0 || pc.hasHardLightEquipped()))) addButton(0,"Milking",milkingShiareCuckoldBullshit,undefined,"Milking","Tie Shiare up and milk her in front of her wife, teasing Anarrie all the while.");
	else if(pc.isTaur()) addDisabledButton(0,"Milking","Milking","To do this as a tauric creature, you need a penis that fits inside her.");
	else addDisabledButton(0,"Milking","Milking","You need a penis or a hardlight strap-on that fits inside her.");
	//[ambush](Maybe you and Shiare can help Anarrie get over some of her shyness)
	if(pc.hasGenitals()) addButton(1,"Ambush",anarrieAmbush,undefined,"Ambush","Maybe you and Shiare can help Anarrie get over some of her shyness?");
	else addDisabledButton(1,"Ambush","Ambush","You need genitals in order to do this.");
	//[hardlight voyeur](Let Shiare use your hardlight strapon)[never mind](actually you have other things to do right now)
	if(flags["ANT_PANTIES_SHARED"] != undefined && pc.hasHardLightStrapOn()) addButton(2,"HL Voyeur",antPowerOverwhelming,undefined,"Hardlight Voyeur","Let Shiare use your hardlight strapon.");
	
	addButton(14,"Back",kressiaSurvivalShopAntGirls);
}
public function survivalShopSexDiscount():void
{
	if(!pc.hasStatusEffect("Kressia Survival Shop Discount")) pc.createStatusEffect("Kressia Survival Shop Discount", 0, 0, 0, 0, true, "", "", false, 1440);
	else pc.setStatusMinutes("Kressia Survival Shop Discount", 1440);
	mainGameMenu();
}

//Milking
//Must have cock that fits if taur.
public function milkingShiareCuckoldBullshit():void
{
	clearOutput();
	kressiaSurvivalShopHeader(true);
	author("Gardeford");
	if(silly) author("Gerbil Ford");

	var x:int = pc.cockThatFits(chars["ANARRIE"].vaginalCapacity(0));
	
	output("<i>“I think I’d like to make your wife’s milking fantasies come true,”</i> you tell her, reaching down and squeezing one of her amber orbs through the thin cloth layer of her tank top. A look of fiery defiance crosses her features, softening only when she glances to the back room. When she replies, it’s with an exasperated tone.");
	output("\n\n<i>“Fine. Might as well get it over with");
	if(flags["MILKED_SHIARE"] != undefined) output("... though last time wasn’t so bad");
	output(",”</i> she relents, ");
	if(flags["MILKED_SHIARE"] == undefined) output("throwing up her hands in defeat");
	else output("mumbling the last bit under her breath");
	output(". You follow closely as she leads you to the back of the shop, admiring the small house they have behind the storefront. At least, the few parts of it you get to see before you arrive at the couple’s shared bedroom. Anarrie is seated in a comfortable looking leather chair next to their soft looking queen bed, already completely naked save the natural corset formed by her chitin.");

	if(flags["MILKED_SHIARE"] == undefined) output("\n\n<i>“O-okay, I’m ready,”</i> the red myr utters in a quiet voice, still nervously hiding her body. This is the first time you’ve seen her prosthetic leg uncovered, and it looks outright bulky tacked onto the rest of her slender frame.");
	else output("\n\nThe red myr brims with anticipation, eyeing the two of you expectantly as she prepares to masturbate. Compared to the first time you did this, she is much more brazen, fully baring her nude body to you.");
	output(" You wait patiently while Shiare fishes through a box in the corner to find the right equipment, eventually coming up with a variety of bondage gear.");

	output("\n\n");
	if(flags["MILKED_SHIARE"] == undefined) output("<i>“Ana got some fancy offworld tools for you to tie me up with, didn’t want me to be uncomfortable with something I don’t normally do. This extranet thing you starwalkers have is marvelous! She’d never work up the courage to buy this kind of stuff in Kressia,”</i> she says, holding up a set of binding ribbons that dangle from her fingers. Her wife glares, but doesn’t deny her teases.");
	else output("<i>“Here they are! When Ana first bought these I thought they were a waste of money, but after testing them out with you I’ve changed my mind. I think I might even order myself one of those <i>“hardlight strapons.”</i> I’ve seen on the net,”</i> she says, directing a blush-inducing gaze at her wife.");
	output("\n\nShe dumps the contents of the chest onto the bed, revealing a wide array of kinky sex toys. Looking through the variety of choices, your eyes fall on a TamaniCorp multi-function bondage ball. These things can work like simple ball or ring gags, but can also form varying levels of latex coverings up to a full body-suit. You’ve seen a few video’s extolling their virtues in the bedroom. For now, though, you think a simple ball gag will be good enough.");
	output("\n\nYou pluck the silvery orb out of the pile and motion for Shiare to open her mouth, grinning when she bites hard on the device. Ribbons of latex spring from the metallic globe, uniting at the back of her neck to secure the ballgag. The gold myr grins around the sphere and makes a gesture with each of her four hands, the pinkie fully outstretched and the pointer finger curving down at the digits. Anarrie breaks out into a fit of giggles, prompting you to raise an eyebrow.");
	output("\n\n<i>“It’s an insult we use here, saying your antennae are broken. Kind of like some of you starwalkers do with your middle fingers,”</i> she explains when she recovers from her bout of laughter. So that’s how she wants to play, is it? You turn back to the array of items, rummaging through until you come out with a four leaf clover shaped quartet of cuffs. An instruction card at the bottom declares it to be a set of <i>“extra strength adjustable binding cuffs, multiarm version 4”</i>, with a guide for the different power levels.");
	output("\n\nYou pull Shiare’s arms into the restraints one by one, locking all four behind her back. Now all that’s left is the milking. There’s a fancy milking machine in the assortment of toys, but you think she deserves a ");
	if(pc.isNice()) output("more caring touch");
	else if(pc.isMischievous()) output("hands on approach");
	else output("firm hand");
	output(". Your constrained companion growls threateningly as you pull the front of her tank top down, the shoulder straps stretching taut as they pull her auric orbs tight against her body.");

	output("\n\n<i>“");
	if(pc.isBimbo()) output("Don’t worry, I’m an accomp... comple... I’m really good at taking shirts off!");
	else if(pc.isNice()) output("Don’t worry. I won’t rip the shirt,");
	else if(pc.isMischievous()) output("Hush you, I’m not gonna rip your shirt,");
	else output("Quiet down! I won’t rip the damn thing,");
	output("”</i> you assure her. Now the only thing left between you and a sticky sweet honey treat is the confining material of her bra. You contemplate tearing the offending garment away, but a soft moan from Anarrie catches your attention. The crimson plated myr is poised on the edge of her seat, trying to keep her breath steady as she watches you undressing her wife. If she wants a show, you suppose you could take it slow for a little while.");
	output("\n\nYou gradually tug the plush brassiere up, inching it over her bountiful breasts until they drop with a bounce into the open air. The nectar in her jiggling G-cups glows in the dim light, practically shimmering as they move. Ana looks on hungrily as you firmly grasp the sun-kissed cleavage, massaging and kneading until beads of honey begin to appear. Before the golden liquid’s flow can get out of hand, you look around for something to contain it. A sizeable vase on the nightstand looks about the right size for now, so you pause your ministrations for long enough to grab the pot, pulling a few cave mushrooms out as you do.");
	output("\n\nShiare looks back at you over her shoulder, fidgeting in her restraints and cocking an eyebrow. A coy grin is all the response you give, making a show of ");
	if(!pc.isCrotchExposed()) output("removing your [pc.lowerGarment]");
	else output("brushing your hands over your lower body");
	output(". ");
	if(x >= 0) output("Your [pc.cocks] spring to attention, ready to penetrate the ant-girl’s ample abdomen");
	else if(pc.hasHardLightEquipped()) output("You pull out your [pc.lowerUndergarment], feeling the jolting pleasure as it connects to your nerves");
	else output("You pull a silvery strapon from the bondage gear. It’s no hardlight, but it’ll do for now");
	output(". The candied ant’s breath quickens as you crawl steadily closer behind her, mounting in a gasp as you push her into a better position. Her bust hangs over the edge of the bed, giving Anarrie a perfect view of her wife’s helplessness.");

	if(!pc.isTaur())
	{
		output("\n\nYou grip the begrudging sub’s twitching abdomen, lining yourself up with her glistening slit. Just as she begins to voice what you assume is a complaint, you let ");
		if(x >= 0) output("your [pc.cock " + x + "]");
		else if(pc.hasHardLightEquipped()) output("your [pc.lowerUndergarment]");
		else output("the silvery metal strapon");
		output(" penetrate her. Attempted objections die in her throat, replaced by a drawn out moan. You can’t see her face from behind, but all four of her hands clench into fists, straining in their restraints as you begin to slowly grind your hips.");
	}
	//Taur with cock that fits:
	else
	{
		output("\n\nYou steady the begrudging sub’s abdomen, climbing over her prone form until she lies directly beneath your tauric frame. Heated breaths grace your foreleg as she tries to turn to see what you’re doing. An attempted complaint catches in her throat as you thrust forward, burying every inch of your [pc.cock " + x + "] into her accommodating passage. Tense fingers grasp at your underbelly, ");
		if(!pc.hasFur() && !pc.hasFeathers()) output("sliding uselessly over your smooth [pc.skinFurScalesNoun]");
		else output("unable to find a grip in your [pc.skinFurScalesNoun]");
		output(".");
	}
	if(x >= 0) pc.cockChange();
	output(" The voyeuristic red myr stares on hungrily, trying to match your thrusts with the speed of her fingers.");

	output("\n\nVice-like pressure compresses your ");
	if(x >= 0) output("[pc.cock " + x + "]");
	else if(pc.hasHardLightEquipped()) output("[pc.lowerUndergarment]");
	else output("strapon");
	output(" in rhythmic intervals, and you struggle to increase the speed of your pistoning. ");
	if(x >= 0 || pc.hasHardLightEquipped())
	{
		output("The primal heat of her inner walls ");
		if(silly) output("cooks your hotdog,");
		else output("flows into your body,");
		output(" filling you with a portion of her need.");
	}
	output(" Salacious juices soak your [pc.skinFurScales] as you buck your hips, and you hear a rapturous moan every time your thrusts brush her clit. Her chitin coated legs splay out in uncontrollable passion, pushing the bed-sheets in two conflicting directions.");
	//cock taur
	if(pc.isTaur())
	{
		output("\n\nYour senses are overwhelmed by the wondrous pressure of Shiare’s inner walls, and you bury yourself in her passage before you cum. A drawn out moan escapes her gagged mouth as ");
		if(pc.cumQ() < 100) output("a surge of your [pc.cum] pulses in.");
		else output("ropes of [pc.cumColor] jizz coat her insides.");
		output("\n\n<i>“So, how does it feel seeing your wife turned to a breeding bitch?”</i> you tease, near to doubling the speed of Anarrie’s breathing. She stares wide-eyed, shifting between your gaze and Shiare’s vacuous face. You reach out, grasping one of her A-cups roughly in one hand as you pull your [pc.cock " + x + "] from it’s gold myr cunt-sheath. Her heart thunders in her chest as you draw closer, and she raises her head to meet your eyes.");
		output("\n\n<i>“Or perhaps you wish it was you?”</i> you ask, pushing her nimble fingers aside to masturbate her yourself. The already edging red myr gasps as you push her over a waterfall of bliss, falling back into her chair as her muscles clench periodically. Tiny antennae are the only things left moving, twitching cutely at their surroundings. You turn back and kneel at the edge of the bed.");
	}
	//cock and hardlight
	else if(pc.hasHardLightEquipped() || x >= 0)
	{
		output("\n\nThe friction of Shiare’s inner walls kindles the lust building inside you, Igniting it in a rapturous blaze. You pull yourself as deeply into her alien cunt as you can before you cum, ");
		if(x < 0) output("quivering ecstatically");
		else if(pc.cumQ() < 100) output("spurting [pc.cumColor] into her depths");
		else if(pc.cumQ() < 1000) output("filling her with [pc.cumGem] fluid");
		else output("continuing to thrust until your [pc.cum] overflows");
		output(". The Gold myr’s tethered arms tense mightily, nearly pulling the binding cuffs apart with ecstasy enhanced strength. Her body goes limp as the energy leaves it, the cuffs snapping snuggly back into place.");
		output("\n\nYou pull yourself away from the sticky situation, Moving around to ");
		if(!pc.isNaga()) output("kneel");
		else output("coil");
		output(" by the edge of the bed. Desire would be too weak a word to describe the look Anarrie gives you as you approach. Hunger might be better, or pure uncontained yearning. She sits in a puddle of her own juices, legs shuddering as she continues to mindlessly masturbate herself. Tiny antennae jerk cutely in your direction, sensing things you can’t imagine.");
	}
	//boring strapon
	else
	{
		output("\n\nA flutter of orgasmic contractions run through Shiare’s body, starting in her abdomen and spreading through her limbs. The extraordinary pressure inside her alien cunt renders you incapable of pulling out, so you make do with massaging the softer parts of her body. With every burst of euphoric vigor, her arms pull the binding cuffs apart. Eventually her strength weakens, leaving her lying in a state of utter relaxation.");
		output("\n\nYour attention is torn from the supine slut, drawn to the moans of her wife. The crimson plated myr sings lyrics of lust as she cums, nearly slipping off her chair as her butt slides over the puddle of juices beneath it. Impulse bound digits continue to rub her soaked pussy, senses too overloaded to stop them. Meanwhile, you turn back to ");
		if(!pc.isNaga()) output("kneel");
		else output("coil");
		output(" by the bed.");
	}
	//merge
	output("\n\nShiare is slumped over the edge of the bed, head held just high enough to get a good look at you. Eyes that focused sharply minutes ago now struggle to fixate on your stationary body. You reach out, cupping her chin in one hand and undoing the clasp on her ball-gag. The metallic sphere drops free, trailing saliva until it hits the ground. Its exhausted gold owner takes a few deep breaths to recover herself.");
	output("\n\n<i>“Ready for milking?”</i> you ask, placing the evacuated flowerpot beneath her honey filled teats. Droplets of saccharine sweetness pepper the vase, leaking from containment in small streams. The docile ex-dom gives you a drained sound of compliance, laying her head against your [pc.chest]. You run your fingers along the underside of her breasts before firmly gripping each, massaging the supple orbs until the streams of honey begin to thicken. Shiare coos as you tap her reserves, antennae bumping your neck at odd intervals as they flutter about.");
	output("\n\nWhen your vessel is almost overflowing with golden milk, you cease your stimulation. You grasp the container, turning to face Anarrie once more. The red myr veteran can’t decide whether to focus on you or the pitcher of her wife’s honey. Dark irises flit between the two with pained longing.");
	output("\n\n<i>“Want some?”</i> you ask, coating a finger with the sugary liquid before seductively cleaning it. The sweet taste fills your mouth, bringing a current of relaxing warmth along with it. Ana nods, attention caught fully by the honey-filled pot. The closer you bring it, the further she leans forward in her attempt to reach it faster. Despite this, she makes no attempt to grab at it, keeping her hands crossed in her lap.");
	output("\n\nJust before her lips touch the nectar rich vessel, you tip it a little too far, spilling the amber elixir over her exposed body. A deluge of tawny sap cascades down her body, parting around the stark points of her nipples. The mass of sensation is apparently too much for her frazzled nerves, and she clenches her teeth, sucking in air as she cums for the second time. Her gasp escapes in a roar of sound, raw pleasure mixed with intoxicated attempts at speech.");
	output("\n\n<i>“Oops,”</i> you remark with a grin, dropping the now emptied container at her feet. Formerly pale skin looks almost bronze under the slick honey coating you’ve given her, glowing softly in the bedroom’s light.");
	output("\n\n<i>“Hey, [pc.name]! Could you undo these things for me? I wanna, err, can’t let you have all the fun?”</i> Shiare asks from the bed, looking a lot more lucid than she was a few minutes prior. You stride up, inputting the release key on her cuffs. Her arms fall free, staying on the bed for a few moments as she collects her strength. Finally she pushes herself up, rubbing her wrists before walking to stand before her wife.");
	output("\n\nThe strength-sapped red myr stirs at the presence, eyes fluttering and lips curving into a smile. The unorthodox pair share a single, simple kiss before the curvy honeypot returns her attention to you.");
	output("\n\n<i>“I think I’ll let her sleep for a bit; I can man the store alone for at least the time it takes her to shower when she wakes,”</i> she grins, gesturing for you to follow her back to the main shopping front. You grab your [pc.gear] and follow, leaving the crimson ant girl to rest.");
	processTime(120);
	IncrementFlag("MILKED_SHIARE");
	IncrementFlag("DISCOUNT_SEXED_SURVIVAL_SHOP");
	if(x < 0 && pc.hasHardLightEquipped() && flags["HARDLIGHT_ANT_PROC"] == undefined) flags["HARDLIGHT_ANT_PROC"] = 1;
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",survivalShopSexDiscount);
}

//Ambush must have genitals
public function anarrieAmbush():void
{
	clearOutput();
	kressiaSurvivalShopHeader(true);
	author("Gardeford");
	if(silly) author("Gargledorks");
	
	output("You ask Shiare how she feels about turning the tables on Anarrie, since she doesn’t seem like the type to enjoy submission. The gilded woman raises an eyebrow, looking you over as she thinks about your proposal.");
	output("\n\n<i>“Firstly, I can enjoy a lot of things if it means Ana is happy, but... I suppose she has been pretty stressed lately. I think she could use a little relaxation,”</i> she agrees, crossing both pairs of arms over her chest.");
	output("\n\n<i>“She’ll be waiting for us back there, butt naked and naive, so it shouldn’t be too tough to get the jump on her.”</i> The lamplight reflects in her dark eyes as quite easily imaginable fantasies run through her head. Snapping out of her thoughts, she pulls you toward the back room. Shiare bounces on her heels, all but humming as you approach the bedroom. Anarrie looks up as you enter, body bared atop a comfy leather chair.");
	output("\n\n");
	if(flags["ANARRIE_AMBUSH"] == undefined) output("<i>“Okay, I’m ready whenever you are,”</i> the red myr says nervously. Her fingers fiddle nervously around the link between her hip and the prosthetic leg, tapping on the metallic attachments to stay calm.");
	else output("The red myr is bright with anticipation, brimming with fervor and ready for a show. Her excitement turns to alarmed surprise when she sees her wife’s hungry grin.");
	output(" Shiare grasps the smaller woman firmly around both her hips and midsection, lifting with a grunt of effort and tossing her onto the queen-sized bed.");

	output("\n\n<i>“Quick, hold her legs!”</i> she shouts to you, quickly positioning herself atop the bewildered red myr’s stomach. You grasp Anarrie’s unmachined leg, not anticipating much resistance from the bulky prosthetic. The eager gold myr restrains her victim, two hands clasped around her wrists, and the second pair fondling her sensitive A-cups.");

	output("\n\n<i>“W-wait! Can’t we talk about this?”</i> Ana asks timidly, not so much struggling as squirming uncomfortably beneath your combined confinement.");

	output("\n\n<i>“Talk? So you can convince me to let you sit in the chair and play with these wonderful breasts all by yourself?”</i> Shiare mocks, taking one of the ant girl’s stiffening nipples between her teeth. The extra pair of arms the gold myr is packing let her easily hold down her crimson companion, all while leaving the first pair free to caress and squeeze. She kisses the bare flesh between chitinous joints, tossing an occasional bite for good measure.");

	output("\n\n<i>“Steele, what’s left of her leg tightens up when she gets too excited. Kiss it better, she likes that,”</i> the auric ant asserts, ");
	if(silly) output("an animalistic avarice");
	else output("a sensual hunger");
	output(" peppering her tone. You nod, shifting the cumbersome limb into a better position before leaning in closer. The scarred surface of her skin is hot on your lips, feeling rough but strangely fragile to the touch.");
	output("\n\nPanicking muscle goes slack in your care, and you hear Anarrie’s tense whimpers fade to relaxed sounds of pleasure. The softness is occasionally interrupted by strained gasps as Shiare’s bites hit sensitive spots. The submissive red myr ceases her resistance, hands grasping the sheets when her partner releases her arms.");
	output("\n\nThe moans swiftly devolve into snorts and giggles as kisses find ticklish spots. You duck out of the way when Shiare pulls Anarrie to the side, hugging her tight and rubbing the smaller girl’s nose with her own. One hand beckons for you to join in and complete the encasing shell, and you slip behind the red myr to compress her in a sandwich of warmth.");
	output("\n\nHer voluptuous bride immediately takes the initiative, one hand brushing her bare skin as it travels to her crotch. The gold myr’s lower pair snake around to caress ");
	if(pc.isTaur()) output("the [pc.skinFurScales] on your belly");
	else if(pc.hasVagina()) output("your [pc.vaginas]");
	else if(pc.hasCock()) output("[pc.eachCock]");
	output(". You hum contentedly in response, following the first hand with your own. Shiare’s fingers thrust into her scarlet sweetheart’s entrance, searching for familiar weak points in her resistance.");

	output("\n\nIn a matter of seconds the red myr shouts in blissful ignorance, venting her body’s pleasure for the world to hear. She arches backward in doing so, her head ");
	if(pc.tallness >= chars["ANARRIE"].tallness + 3) output("pressing into your chest");
	else if(pc.tallness >= chars["ANARRIE"].tallness - 6) output("brushing against your neck");
	else output("bumping against the top of your own");
	output(" before she manages to relax. You muster a greater resistance, but the auric ant-girl’s finesse has you struggling to maintain your composure.");
	output("\n\nAdept hands ");
	if(pc.isTaur()) output("massage your waist while her chitinous feet rub against your sex.");
	else if(pc.hasVagina()) output("explore your insides, curiously searching the new space.");
	else if(pc.hasCock()) output("hug your [pc.cocks], uniformly firm and gentle.");
	output(" The ruby armored girl between you is flush with heat, panting into her wife’s bust as her legs twitch around shifting digits. Shiare runs a loving hand through her hair, making sure to pull her up for air when she needs it.");

	output("\n\nThe expert ministrations suddenly prove too much to handle, and red-hot desire burns through your senses.");
	if(pc.isTaur())
	{
		output(" All that desire culminates in your sex, coating the gold myr’s feet in ");
		if(pc.hasVagina()) output("[pc.femCum]");
		if(pc.isHerm()) output(" and ");
		if(pc.hasCock()) output("[pc.cumNoun]");
		output(".");
	}
	else
	{
		if(pc.hasVagina()) output(" Your insides clamp down tightly as she continues to stir them up, and you join Anarrie in a duet of climactic choruses.");
		if(pc.hasCock()) 
		{
			output(" Lust flows through the conduit of your [pc.cocks], splattering her hands");
			if(pc.cumQ() >= 150) output(", and Anarrie’s back,");
			output(" with [pc.cumNoun].");
		}
	}
	output(" Once the torrent of sensory input dies down, you fall back, trying to cool off after the intense overexertion. Shiare pats and brushes the two of you, at some point coming back to clean you with cool washcloths.");
	output("\n\nYou start awake some time later, alone and naked on the myr couple’s bed. A tall glass of water sits on the nightstand, and you take a few sips to refresh yourself. A tinge of sweetness tickles your tongue, bringing a smile to your lips. You gather your things, replacing your equipment to its rightful state before leaving the room. Shiare waves as you exit the back area and return to the main shop front.");
	output("\n\n<i>“Come back soon, Steele, we’ll be waiting,”</i> She declares with a wink. You see Anarrie blush, trying to maintain her composure as she helps a customer. Other patrons look at you with a hint of jealousy, and you nod at the alluring ants, making your way out of the store and back to the outside world.");
	processTime(300);
	//(pass 5 hours)
	IncrementFlag("ANARRIE_AMBUSH");
	IncrementFlag("DISCOUNT_SEXED_SURVIVAL_SHOP");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",survivalShopSexDiscount);
}

//Hardlight Voyeur
//(requires doing milking with the hardlight strapon)
//(first time happens after picking milk for the first time)
public function hardlightVoyeurForAntSlooooots():void
{
	kressiaSurvivalShopHeader();
	author("Gardeford");
	if(silly) author("Gartenfjord");

	output("\n\nOnce Anarrie is out of sight, Shiare turns to face you.");
	output("\n\n<i>“Hey [pc.name], is there any chance I could borrow that thing you used last time? The glowing strapon thing,”</i> She asks, forcing herself to be quiet despite an obvious sense of excitement.");

	output("\n\n <i>“I mean, I’d totally understand if you didn’t want too, but I figured I’d ask. It felt like you were having a lot of fun with that, and ever since then I can’t stop imagining what it would feel like. I’d love to use it on Ana, with you there to supervise of course,”</i> she requests, adding a sultry wink at the end. <i>“What do you say?”</i>");

	output("\n\nIt looks like you have a decision to make...");

	processTime(2);
	clearMenu();
	//[giveHerThePower][ItsAllMine]
	addButton(0,"Give It",antPowerOverwhelming);
	addButton(1,"Keep It",itsMineALLMINEYOUCANTHAVEIT);
}

//All mine
public function itsMineALLMINEYOUCANTHAVEIT():void
{
	clearOutput();
	kressiaSurvivalShopHeader();
	author("Gardeford");
	if(silly) author("Gartenfjord");
	
	output("<i>“Sorry, but I’d rather not. It’s attached to my undergarments, and I’d rather not share them,”</i> you reply. You’d rather be the one using the strapon, and seeing it on someone else doesn’t really interest you. Shiare looks disappointed, but nods.");
	output("\n\n<i>“That’s okay, I thought you might not want to, but hey, I had to ask. Maybe I can hook myself up with one from a trader. You wanna do anything else in the meantime?”</i>");
	//(back to sex menu, voyeur scene removed)
	processTime(1);
	flags["HARDLIGHT_ANT_PROC"] = -1;
	survivalShopSexMenu();
}

//Empower the ant
public function antPowerOverwhelming():void
{
	clearOutput();
	kressiaSurvivalShopHeader(true);
	author("Gardeford");
	if(silly) author("Gartenfjord");

	//If first time
	if(flags["ANT_PANTIES_SHARED"] == undefined)
	{
		flags["HARDLIGHT_ANT_PROC"] = 2;
		output("<i>“Sure! I don’t mind at all");
		if(!pc.isNice()) output(", as long as I get to watch");
		output(",”</i> you say with a grin. The auric ant claps excitedly and bounces on her heels. She’s forced to use the other pair to stabilize her chest, stopping the honey-full globes from following suit. Her hands do nothing to stop her abdomen, which bounces wildly behind her.");
		output("\n\n<i>“Awesome! So where is it? Oh, and how does it work? Do I just put it on? Will I really be able to feel it?”</i> she barrages you with questions. A raised eyebrow from you has her quieting down a bit and clearing her throat. Embarrassment momentarily clouds her features and she stills her energetic squirming. <i>“Sorry, I’m just really excited about getting to fuck Ana with an </i>actual dick<i>.”</i>");
		output("\n\n<i>“");
		if(pc.isNice()) output("Just be careful");
		else if(pc.isMischievous()) output("go ahead");
		else output("have fun");
		output(", it can be addicting,”</i> you say, pulling the panty-mounted device from your gear. Shiare’s dark eyes shine with excitement, filled with palpable desire. Her upper hands reach out to accept your offering, while her second pair can’t seem to remove her pants quickly enough.");
		output("\n\n<i>“Just put it on like a pair of panties, the sensors will do the rest of the work. From what I know it should work even with your ");
		if(pc.isBimbo()) output("butt-pussy thingie");
		else if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output("unusual physiology");
		else output("different body-type");
		output(",”</i> you explain as the chitin coated ant woman hastily swaps undergarments. Her ivory ass and golden abdomen spill out of the offending garment, giving an alluring wiggle with each movement their owner makes.");
		output("\n\nShiare hits the activator button, and your [pc.hardlightCockNoun] springs to life at her crotch. The sudden glow is a bright contrast on her pale skin, like a sun’s rays on a milky expanse. She touches the hardening member, prodding and rubbing its length with alien curiosity. A frown coats her features as she continues, deepening with each caress.");
		output("\n\n<i>“Why isnt it working? Aren’t I supposed to feel whatever touches it? If ");
		if(pc.hasCock()) output("you lot");
		else output("guys");
		output(" are actually faking it I’ll rejoin the fucking golds,”</i> she grumbles, her strokes gaining ferocity with her words. You begin to warn her about the time the device needs to adjust to her body, but her knees buckle before you get a word out. The surprised woman hardly has time to speak herself before the sensory input catches up with the rest of her body, and a gasp pulls the words back down her throat.");
		output("\n\nHer overwhelmed muscles give her no help as her hand clenches tighter to the phosphorescent phallus, and she sits for a good minute before she can relax enough to let it go. Her breaths remain ragged as she climbs shakily to her feet, and she looks at you with an animalistic mix of hunger and joy. Moments later, the ravenous gaze breaks from you as Shiare turns to the back room.");
		output("\n\n<i>“Honey, I’ve got something to show you,”</i> she says as she steps toward the bedroom, her gait halted by the [pc.hardlightCockNoun] between her legs. Her voice is glazed with a lusty timbre, somewhere between commanding and forthcoming. You jump ahead of the volatilely fervid ant-girl, stepping into the back of the store before she can block the way. This meeting isn’t something you plan to miss.");
		output("\n\nAnnarie startles as you dash into the room, surprised by your sudden entry. She sits in a comfortable looking leather chair beside the end table, bare naked besides the natural corset formed by her chitin. Her hands are pleated in her lap, clenched with nervous energy as they hide her sex from view.");
		output("\n\n<i>“H-hey, I’m ready to start if you are. Where’s Shiare? Do you know what she wanted to sh-”</i> she manages, looking around just as her wife walks through the doorway. One look at the auric woman’s face turns the rest of her sentence into a submissive whimper. She meekly averts her gaze, gawking when it lands on the luminous erection.");
	}
	//repeat
	//choose [voyeur] from menu
	else if(flags["ANT_PANTIES_SHARED"] == 1)
	{
		output("You pull out the hardlight strapon, handing it over to Shiare. She accepts it with a giddy smile, using her lower pair of hands to strip below the waist. As soon as she gets it on, she dashes to the bedroom, arms over her bust to keep it from bouncing too harshly. You follow close behind, catching up with her at the door, where Annarie looks nervously from her chair.");
		output("\n\n<i>“Uhm. Baby, W-wait a sec, I-I need to take my pill this time. I d-don’t wanna-”</i> she starts, words stunted by shaky breathing. Shiare puts a finger to her lips near the end, pulling her face into a comforting embrace.");
		output("\n\n<i>“Shh. It’s okay, I was gonna wait. I got a little carried away last time, but it’s hard to resist sometimes when you’re so cute and helpless. I’m sure just a little bit is okay,”</i> she says, giving the red myr’s hair some reassuring brushes.");
		output("\n\n<i>“No amount is okay. Ever. Leave that stuff for selling to the offworlders,”</i> Ana replies, looking up from the cushiony boob pillow. Her words are harsh, but she seems a little more relaxed in the arms of her lover. She reaches over to the end table, no longer shaking, and picks up a small bottle of pills, taking one of them with a drink of water before turning back with a grin.");
		output("\n\n<i>“Alright, I’m ready,”</i> she says, collecting herself into a more subservient mood.");
	}
	//newgame++(repeat 2 and onward)
	else
	{
		output("You pull out the hardlight strapon, handing it over to Shiare. She accepts it with a giddy smile, using her lower pair of hands to strip below the waist. As soon as she gets it on, she dashes to the bedroom, arms over her bust to keep it from bouncing too harshly. You follow close behind, catching up with her at the door, where Annarie looks nervously from her chair.");
		output("\n\n<i>“Did you take the pill yet!?”</i> she shouts, hunger and lust trickling into her voice.");
		output("\n\n<i>“Yes!”</i> yells the crimson myr, eyes wide with surprise.");
	}
	//merge
	if(flags["ANT_PANTIES_SHARED"] == undefined || flags["ANT_PANTIES_SHARED"] == 1) output("\n\n<i>“On the bed. Now,”</i>");
	else output("\n\n<i>“Then onto the bed with you!”</i>");
	output(" Shiare commands, her voice worn thin by the effort of holding back. The red ant nods, standing immediately and crawling onto the bed. She kneels at its center, rear end presented openly. Her gilded companion strides to her side, squeezing her ample buttocks as the second pair of hands slide sensuously up her back before pushing her deeper into the beds soft mattress. Anarrie coos in response with moans coming in short bursts as her wife rubs the tip of the photonic prick across her glistening mons.");
	output("\n\nWith one smooth, carnal motion, Shiare lets the device’s projection slide into the red myr’s waiting sex, pushing aside her genital walls until the two are linked at the hips. The gold myr is entirely unprepared for the sensation, muttering a few incoherent moans of her own as the arms that hold her up give out. Her hips give a few instinctive bucks before she manages to regain control, laying atop the crimson sub.");
	output("\n\nEven through the form fitting tank top she’s wearing, the buxom honeypot’s curvaceous form devours the smaller woman, leaving only her head and arms visible from the waist up. Desire fueled moans intertwine as she begins to grind slowly into Anarrie’s depths, stopping occasionally for a passionate kiss from the constrained cutie.");
	output("\n\nYou can see the change in Shiare’s manner as the sloppy love making continues. After a few more intense gyrations, she begins to steadily hump in and out of the rosey plated ant-girl. Her pace increases evenly as she continues, settling into a smooth, incremented rise in speed. When one of her wife’s hands attempts to clutch the sheets, she intercepts it from beneath, threading her fingers and clasping them tightly while bringing her other hand around to hold it from the other side. A third slides its way under her, sneaking upon her budding clit and striking with a stirring stroke.");
	output("\n\nAnarrie, in stark contrast with the increased stability of her golden lover, sinks further and further into the throes of lust. Her dark eyes lose their focus, and her skin flushes almost as red as the armored carapace that coats it. Between gasps for breath and moans of pleasure she shouts slurred words your codex appears unable to translate.");
	output("\n\n<i>“Nnn, sorry honey. No safe words this time. I don’t think I could stop if I wanted to,”</i> Shiare apologizes, giving the smaller woman a silencing smooch, biting at her lower lip afterwards. She replies with a prolonged, deep moan, chitinous toes twitching on her non-machined leg. You can practically feel the heat rising from her as she cums, breaths coming in halting gasps through the clenching of overloaded nerves.");
	output("\n\nThe love-happy honeypot growls as the clenching walls bring about her own orgasm. Slippery sex-juice spurts from her abdomen, squirting over the bedsheets and dripping down her legs. She nuzzles into her wife’s crimson locks, drinking in her scent like a sweet merlot. It only takes a minute for her to recover, taking Annarie’s chin between a thumb and finger and turning her into another kiss. The poor girl does her best to reciprocate, letting her tongue loll out to meet the affection.");
	output("\n\nOnce their lips separate, Shiare lifts herself on a quartet of shaking arms. Ana gets a much needed breather, shifting in her passion induced stupor before she’s flipped onto her back by the ravenous gold dom. Perky A-cups shudder cutely with each heaving breath, slick with sweat from the lengthy endeavor. Shiare gazes lovingly at her sub, begining to thumb her clit just as she begins to settle down.");
	output("\n\nShe pauses for a moment to fully undress, Stripping out of her top and supporting maternity bra. Plentiful beads of amber dribble from her honey smeared nipples, coaxed by the exertion and their sudden release. The droplets land on Anarrie’s bare waist, mixing with her sweat into a sweet smelling natural oil.");
	output("\n\nOne pair of her hands rise to her chest, cupping her nipples and squeezing until her fingers drip with sticky-sweet sugar. The syrupy liquid tints her pale skin bronze in the dim light, falling in thick globules to land on Ana’s stomach with a pleasant splatter. She massages the smaller girl’s breasts, teasing her nipples with each movement, before continuing up to her mouth. The still inebriated ant-girl suckles the nectar covered digits, licking them clean until the liquid is replaced entirely with aphrodisiac saliva.");
	output("\n\nDelicious smells permeate the air, almost putting you into a stupor from the sight and smell alone.");
	if(pc.hasCock()) output(" [pc.EachCock]");
	if(pc.isHerm()) output(" and y");
	else if(pc.hasVagina()) output(" Y");
	if(pc.hasVagina()) output("our wettening [pc.vaginas]");
	if(pc.totalGenitals() == 1) output(" reminds");
	else output(" remind");
	output(" you to maybe join in on the couple’s next venture. A sultry moan brings you back to the action as Shiare begins to rock her hips again, pushing the [pc.hardlightCock] into the ravenous red’s depths. This time her movements are much more precise, working the younger woman’s body like a well oiled toy.");

	//first time
	if(flags["ANT_PANTIES_SHARED"] == undefined)
	{
		output("\n\nYears of marriage seems to have given the red myr a good handle her venom production, but in her insensate state that discipline fades. You can see the need begin to crawl into Shiare’s controlled demeanor: the need to fuck until her partner is pregnant. Such a thing is impossible with just a hardlight strapon, but this kind of urgency cares not for reason.");
		output("\n\nShe dives into an animalistic kiss, sucking at the florid ant girl’s tongue and nipping at her neck with the same ferocity as she bucks her hips. Annarie can respond only with moans and unknowable phrases of pleasure, pulling her spouse into an even tighter embrace. The taller woman’s breasts sequester their counterparts completely, slipping around on sweat greased skin. Her own breaths turn to gasps as she pulls in more air to fuel the mechanical thrusting of her hips.");
		output("\n\n<i>“Ana, Ana, Ana, Hnng!”</i> she shouts, tethering her waist as tightly as possible to Annarie’s as her entire being seems to clench in blissful orgasm. If her wife comprehends her words at all, she is unable to respond. A sloppy grin covers her face, tongue lolling onto the pillows and eyes half closed. What used to be a conscious hug has devolved into the unconscious contraction of muscles, binding the two myr together in their now silent euphoria.");
		output("\n\nIn the moments that follow, you worry about whether the both of them have passed out, and what you should do in that case. Shiare answers your question, raising her head and stretching out her arms. She rolls lethargically off her sleeping mate, still connected by a trail of sticky honey that drips from her G-cups.");
		output("\n\n<i>“I think... I think we’re gonna stay here and sleep a while. Here’s your thingy back. We should do something more involved later maybe... yeah, later sounds good though,”</i> she says, sleep weighing her words heavily. She reaches down, sluggishly removing the bikini of the hardlight strapon and handing it back to you. You retrieve the fem-cum soaked garment, making a note to clean it before you use it again");
		if(pc.libido() >= 70 || pc.isBimbo() || pc.isBro()) output(", or maybe not");
		output(".");
		output("\n\nYou leave the two to their rest, going back to your adventure");
		if(pc.lust() < 80) output(", albiet a little hornier than you were before");
		output(".");
		//(pass 2 hours, +40 lust)
		processTime(120);
		pc.changeLust(40);
	}
	//repeat
	else
	{
		output("\n\n<i>“Just keep feeling better, honey. Let me eat you all up,”</i> she whispers in the semiconscious slut’s ear. Unlike the last time, no venomous lust seeps into Shiare’s demeanor when she leans in for a deep kiss. Instead she pulls back, methodically nipping at the red myr’s exposed flesh. Once her lips have covered all the area above the neck she switches to just above the corset, starting beneath Ana’s breasts and working her way up.");
		output("\n\nAll the while her hips shift ever so slightly with each thrust, and each new angle brings a marginally louder moan from her sub. She ceases her nipping to smother the noise, letting her slippery G-cups quiet her tumultuous prey. The ecstatic sounds are softened by pillowy, honeyed flesh. Blissful exclamations are replaced by sucking kisses as Annarie blindly searches for a nipple.");
		output("\n\nWhenever she gets close, Shiare changes her position enough to draw the nectar’s source just out of reach, keeping her enveloped in the warmth of the golden orbs. The younger woman tries to use her hands to help, but her wife easily overpowers her sex-drained muscles. Her movements begin to slacken, but just when you begin to worry the gold myr draws herself up. Ana gasps for air, getting as many breaths as her tired frame can take.");
		output("\n\n<i>“Thats a good girl. Catch your breath and I’ll give you a treat,”</i> Shiare coos, brushing a nipple over the besotten woman’s lips. The golden honey wicks itself into the crimson brim of her mouth, bringing a new energy to her motions as she raises her head to catch the succulent teat. She sucks in too much at first, and the sweet drink pours from the corners of her mouth, leaking down to bedsheets already soaked by the ordeal.");
		output("\n\n<i>“Mmmn, That’s good Ana. So good! Cumming!”</i> she shouts, hilting the [pc.hardlightCock] with one final thrust as thunderous spasms shake her body. The strength in her arms gives out, and she collapses atop her wife. The pair share a mind-numbing silent orgasm, rubbing their noses and pecking at each other’s lips before nestling into a more comfortable position.");
		output("\n\nFor a second you worry about whether the two have fallen asleep, but Shiare pops her head up after a few seconds. She carefully frees herself from the tangle of limbs, carefully lowering Annarie’s head to the pillows. Strings of sweet honey still connect the pair, like the bonds of their connection made solid.");
		output("\n\n<i>“Thanks for that. I know she couldn’t wait to do it again, even if she acts like a doofus sometimes. She gets all anxious if she doesn’t get attention, like she’s worried she won’t get it anymore if she doesn’t take it all now. Here, you can have your strapon back,”</i> she says quietly, brushing the sleeping red myr’s hair while she sleeps. Another hand unhooks the device from around her waist, handing it up to you.");
		output("\n\nYou take the device back, leaving the two to their shared affections. Maybe some place out there a similar connection waits for you.");
		//(pass 2 hours, +20 lust)
		processTime(120);
		pc.changeLust(20);
	}
	IncrementFlag("ANT_PANTIES_SHARED");
	IncrementFlag("DISCOUNT_SEXED_SURVIVAL_SHOP");
	clearMenu();
	addButton(0,"Next",survivalShopSexDiscount);
}