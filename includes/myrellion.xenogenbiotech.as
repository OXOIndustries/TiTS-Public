import classes.Creature;

/*
NEVRIE_QUEST states:
undefined/0 - not started
1 - started
2 - samples handled to nevrie
3 - lab room unlocked
4 - met the doc

McAllister stuff:
MCALLISTER_MYR_TFS:
undefined/0 = not started
1 = ready but not properly been introduced to the test subjects
2 = met the test subjects, hybrid stuff available

MCALLISTER_MYR_HYBRIDITY:
undefined/0 = not started
1 = talked about hybridity
2 = paid the fee (7 days tracked by MCALLISTER_MYR_HYBRIDITY_START)
3 = 7 days over, pc has been given data (keyItem: Orange Myr Data)
4 = pc has talked with juro about the data (removeItem: orange myr data)

*/

public function nevrieHeader(isNude:Boolean = false):void
{
	showName("\nNEVRIE");
	if (!isNude)showBust("NEVRIE");
	else showBust("NEVRIE_NUDE");
	author("Savin");
}

public function mcallisterHeader():void
{
	showName("DOCTOR\nMCALLISTER");
	showBust("MCALLISTER");
	author("Savin");
}

public function mcallisterMyrGirlsHeader():void
{
	showName("MCALLISTER\n& MYR GIRLS");
	showBust("MCALLISTER", "REDMYR", "GOLDMYR"); // 9999 check this
	author("Savin");
}

public function mcallisterIsIn():Boolean
{
	if (flags["NEVRIE_SAMPLES_TIMESTAMP"] != undefined && GetGameTimestamp() >= flags["NEVRIE_SAMPLES_TIMESTAMP"] + (4 * 60)) return true;
	return false;
}

public function myrellionBiotechInteriorAddition():Boolean
{
	output("\n\n");
	if (flags["MET_NEVRIE"] == undefined) output("A bronze-skinned woman with a pair of small horns poking out through her blue hair");
	else output("Nevrie");
	output(" is sitting behind the desk, her oddly-arched bare feet propped up on it while she reads the information flickering across her displays and munches on a sack of " + RandomInCollection("gummy candy", "salty pork rinds", "potato chips", "miniature cookies", "chocolate-covered pretzels") + ".");

	if (flags["NEVRIE_QUEST"] == undefined || flags["NEVRIE_QUEST"] < 3)
	{
		flags["NAV_DISABLED"] = NAV_WEST_DISABLE;
	}
	
	// Disable Haswells quest
	flags["JULIANS_QUEST_DISABLED"] = 1;
	
	if (flags["MET_NEVRIE"] == undefined) addButton(0, "Secretary", myrellionMeetNevrie);
	else addButton(0, "Nevrie", myrellionNevrieApproach);

	return false;
}

public function myrellionLabAddition():Boolean
{
	output("\n\n");
	if (flags["MET_MCALLISTER"] == undefined) output("A huge, bearded man");
	else output("Doctor McAllister");
	output(" is standing near the back of the lab, talking with several assistants gathered around a beeping device.");

	if (flags["MET_MCALLISTER"] == undefined) addButton(0, "Bearded Man", mcallisterMeeting, undefined, "Bearded Man", "The barrel-chested, bearded fellow must be Doctor McAllister. Time to go meet him.");
	else addButton(0, "McAllister", approachMcallister, undefined);
	
	return false;
}

public function myrellionMeetNevrie():void
{
	clearOutput();
	nevrieHeader();
	showName("XENOGEN\nBIOTECH");

	output("You wander up to the desk, and the blue-haired alien sitting behind it.");
	
	// iirc the det is never removed from the players inventory once collected, and it's the only simple marker I can find
	// for "player has specifically encountered Kaska"
	if (pc.hasKeyItem("Kaska's Detonator")) output(" Now that you think of it, she’s got more than a passing resemblance to that hermaphroditic mercenary guarding the bomb back on Tarkus. Same species, perhaps?");
	
	output(" She looks up from her data-screens like she’s just noticing your presence for the first time.");
	
	output("\n\n<i>“‘Sup,");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" nerd");
	else if (pc.characterClass == GLOBAL.CLASS_MERCENARY) output(" tough " + pc.mf("guy", "girl"));
	else output(" fly"+pc.mf("boy", "girl"));
	output(". Name’s Nevrie. Welcome to Xenogen and all that. If you want to check out the mods and stuff we’ve got for sale, you’ve come to the right place. Wanna talk to the actual brains, though, you’re out of luck. I’m pretty sure I’m the only one here right now, except the lab robots.”</i>");
	
	output("\n\nYou introduce yourself, and think of what to ask her.");

	flags["MET_NEVRIE"] = 1;
	processTime(3 + rand(2));
	myrellionNevrieMenu();
}

public function myrellionNevrieApproach():void
{
	clearOutput();
	nevrieHeader();

	if (flags["NEVRIE_QUEST"] == 2 && mcallisterIsIn())
	{
		flags["NEVRIE_QUEST"] = 3;

		output("You step up to the desk and ask Nevrie if her boss has finally shown up.");
		
		output("\n\n<i>“Yeah, he’s in the back. Head on through the door - the lab’s right at the end of the hall.”</i>");
		if (pc.IQ() < 30 || pc.isBimbo()) output(" With a playful smirk, she adds <i>“Try not to get lost.”</i>");

		//Unlock lab room. Add [Bearded Man] to it. 
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}

	output("You wander up to the desk, and the blue-haired alien sitting behind it. Nevrie gives you a slight nod as you approach, tossing the bag of junk food she was munching on into a drawer under her desk. <i>“Welcome back,");
	if (flags["FUCKED_NEVRIE"] == undefined) output(" " + pc.mf("mister", "miss") + " Steele");
	else output(" [pc.name]");
	output(". Anything I can do for you");
	if (flags["FUCKED_NEVRIE"] == undefined) output("?”</i>");
	else output("... or </i>to<i> you?”</i> she says with a flirtatious smile.");

	processTime(3 + rand(2));
	
	myrellionNevrieMenu();
}

public function myrellionNevrieMenu(cFunc:Function = null):void
{
	clearMenu();

	if (cFunc != myrellionNevrieShop) addButton(0, "Shop", myrellionNevrieShop, undefined, "Shop", "Ask to see the shop's inventory.");
	else addDisabledButton(0, "Shop");

	if (cFunc != myrellionNevrieHerRace)
	{
		if (flags["NEVRIE_TALK_RACE"] == undefined) addButton(1, "Her Race", myrellionNevrieHerRace, undefined, "Her Race", "Ask Nevrie about her race.");
		else addButton(1, "Her Race", myrellionNevrieHerRace, undefined, "Her Race", "Ask Nevrie to tell you about the dzaan again.");
	}
	else addDisabledButton(1, "Her Race"); 

	if (cFunc != myrellionNevrieDiscount)
	{
		if (flags["NEVRIE_SHOPPED"] == undefined) addDisabledButton(2, "Discount", "Discount", "You should probably check out the prices she's offering to begin with before you start begging for a discount!");
		else if (flags["NEVRIE_DISCOUNT"] == undefined) addButton(2, "Discount", myrellionNevrieDiscount, undefined, "Discount", "Maybe you could convince Nevrie here to give you a discount....");
		else addButton(2, "Discount", myrellionNevrieDiscount, undefined, "Discount", "Try and wrangle the shop's prices down, though something tells you you'll be using your mouth to do more than smooth-talk....");
	}
	else addDisabledButton(2, "Discount");

	if (flags["NEVRIE_QUEST"] == undefined)
	{
		if (cFunc != myrellionNevrieCoworkers) addButton(3, "Coworkers?", myrellionNevrieCoworkers, undefined, "Coworkers?", "Ask Nevrie about the co-workers she mentioned. How come she's the only person in the store?");
		else addDisabledButton(3, "Coworkers?");
	}
	else if (flags["NEVRIE_QUEST"] == 1)
	{
		if (pc.hasKeyItem("Red Myr Blood")) addButton(3, "Blood Vial", myrellionNevrieBloodVial, undefined, "Blood Vial", "Hand over a vial of red myr blood to Nevrie. Maybe you can finally get things moving about this myr gene-mod.");
		else addDisabledButton(3, "Blood Vial", "Blood Vial", "You'd need a blood sample to hand first...");
	}
	
	addButton(14, "Leave", mainGameMenu);
}

public function myrellionNevrieShop(isDiscount:Boolean = false):void
{
	clearOutput();
	nevrieHeader();

	flags["NEVRIE_SHOPPED"] = 1;

	if (isDiscount)
	{
		nevrie.sellMarkup = 1.0;
	}
	else
	{
		nevrie.sellMarkup = 1.2;
	}

	processTime(8 + rand(2));

	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	shopkeep = nevrie;
	shopkeepBackFunctor = myrellionNevrieShopBack;

	buyItem();
}

public function myrellionNevrieShopBack():void
{
	clearOutput();
	nevrieHeader();
	
	output("Finished with the display, you spin it back around to face Nevrie.");
	output("\n\n<i>“So, anything else I can do for you [pc.name]?”</i> she asks.");
	
	myrellionNevrieMenu();
}

public function myrellionNevrieHerRace():void
{
	clearOutput();
	nevrieHeader();

	output("<i>“I haven’t seen many of your species around,”</i> you say, eying the horned woman and the jagged plates growing out of her arms, brow, and hands. <i>“");
	if (flags["NEVRIE_TALK_RACE"] == undefined) output("Would you mind telling me about your species?");
	else output("Could you tell me about your species again?");
	output("”</i>");
	
	output("\n\nNevrie thinks about it for a second before saying <i>“Sure. First off, my species is called the dzaan, from the sunny paradise of Heloith IV. Well, the marketing pamphlets call it that, anyway. We didn’t call it that, and it’s not much of a paradise. It’s </i>alright<i>, I guess. Of course, I didn’t grow up there, so maybe my patriotism needs a little freshening up. Anyway, it’s a big, humid jungle planet. Offworlders have built a lot of resorts and villas on the planet; hired a lot of us dzaan to work there, which was probably a decent upgrade from being tribals if you didn’t mind a little forced prostitution.”</i>");
	
	output("\n\nYou grimace at that, and Nevrie sighs. <i>“Sorry, I’m a downer. You wanted to know about my species, though. Not a whole lot to say, really. We’re mostly similar to humans, really. A lot of other races can’t tell us apart, though we stand on the balls of our feet and our spines are shaped a little differently; the biggest difference is the keratin.”</i>");
	
	output("\n\nShe reaches up and taps her finger on one of her tiny little horns. <i>“Us alphas have growths like these all over. Little plates, horns, whatever. Have ‘em instead of body hair. Betas have spots and stripes instead, kinda like natural tattoos.”</i>");
	
	output("\n\n<i>“So what’s the difference between alphas and betas?”</i> you ask, admiring the blue-haired beauty’s horns. <i>“Just cosmetics?”</i>");
	
	output("\n\nNevrie grins and leans back in her chair and pats her crotch, running a hand from her thick upper thigh around an unmistakable bulge. <i>“Well, us dzaan come in two types. One also cums in the other,”</i> she chuckles. <i>“Dzaan alphas like me are hermaphrodites. Betas are just straight-up females, and there’s a whole lot more of them than alphas. You can imagine why humans gave us the alpha/beta names, too. Harems, dominance, you name it, we’ve done it. Helps that alphas have drugged-up semen that our betas get addicted to.”</i>");
	
	if (flags["FUCKED_NEVRIE"] != undefined)
	{
		output("\n\n<i>“Wait what?”</i> you stammer, glancing between the succulent cock you’ve enjoyed before and its owner.");
	
		output("\n\nNevrie rolls her eyes. <i>“Relax. I take pills to suppress it, [pc.name]. Most non-dzaan freak out about getting addicted to dick, who’d have thought? Figured it would be better if I pre-empted any, uh, uncomfortable scenarios and just made sure it couldn’t happen. So we’re fine. Right?”</i>");
	
		output("\n\nYou let out a long breath and nod your head. Wish she’d told you that ahead of time, though.");
	}
	else
	{
		output("\n\n<i>“Addictive cum,”</i> you muse. <i>“That’s gotta be pretty interesting.”</i>");
	
		output("\n\nNevrie shrugs. <i>“Wouldn’t know. I take pills to suppress it, since I mostly hang out with non-dzaan. Turns out most people don’t like finding out a one-night fling just turned into a lifetime commitment to sucking my dick.”</i>");
	}

	output("\n\nWith a sigh, the secretary straightens up and tosses a small candy into her mouth from her desk. <i>“Anyway,”</i> she says between chews, <i>“those’re the highlights. We’re not that interesting compared to, like, a nyrea or one of the myr.”</i>");

	if (flags["NEVRIE_TALK_RACE"] == undefined) flags["NEVRIE_TALK_RACE"] = 0;
	flags["NEVRIE_TALK_RACE"]++;

	processTime(5 + rand(5));
	myrellionNevrieMenu(myrellionNevrieHerRace);
}

public function myrellionNevrieDiscount():void
{
	clearOutput();
	nevrieHeader();

	if (flags["FUCKED_NEVRIE"] == undefined)
	{
		output("Flashing the bronze beauty your most charming smile, you ask if it’d be possible to maybe lower some of those prices she was offering.");
		
		output("\n\n<i>“Ugh. Blow me,”</i> she chuckles, rolling her eyes and flicking her fingers at her crotch. Now that you look thataway, you can see a tell-tale bulge in her skinny jeans. Maybe she meant that literally...");

		// [Blow Her] [Nevermind]
		clearMenu();
		addButton(0, "Blow Her", myrellionNevrieBlowjerb);
		addButton(1, "Nevermind", myrellionNevrieMenu, myrellionNevrieDiscount);
	}
	else
	{
		output("<i>“So how about that discount?”</i> you ask with a coy smile, leaning in on Nevrie’s desk.");
		
		output("\n\nShe cocks an eyebrow... and you’re fairly sure you see a hint of a tent being pitched in her jeans. <i>“Just couldn’t resist coming back for more, huh?”</i> she teases, glancing between the product screen and her own inviting body. <i>“Well, I guess I could hook you up again, if you don’t mind crawling under my desk and proving you’re still worth it.”</i>");
		
		output("\n\nOh, you’re <i>definitely</i> worth it.");

		clearMenu();
		addButton(0, "Blow Her", myrellionNevrieBlowjerb);
		addButton(1, "Nevermind", myrellionNevrieMenu, myrellionNevrieDiscount);
	}
}

public function myrellionNevrieBlowjerb():void
{
	clearOutput();
	nevrieHeader();

	output("You grin at her and take a step around the side of the desk. <i>“Well, if you insist.”</i>");

	if (flags["FUCKED_NEVRIE"] == undefined)
	{
		output("\n\nHer eyes widen as you approach. <i>“Uh, hey, I didn’t </i>actually<i> mean I’d give you a discount for sucking my dick.”</i>");

		output("\n\nYou give her a look and reach down to her crotch, giving the bulge between her legs an appreciative squeeze. Nevrie groans and arches her back, legs squirming around your firm but gentle hold. <i>“H-hey, what... you... oooh, that feels good...”</i>");
	}
	else
	{
		output("\n\n<i>“Oh, I do,”</i> Nevrie says, leaning back in her chair and patting her groin invitingly. <i>“A little pleasure for a few credits isn’t a bad deal, after all.”</i>");
		
		output("\n\nYou follow the guidance of her hands, reaching down to cup her package through her tight-hugging jeans. She gives you an appreciative groan, arching her back into the firm ministrations of your talented fingers. <i>“Oh, that’s good... just like last time.”</i>");
	}

	output("\n\nYou grin, glad that Nevrie approves of your sensuous touch. Squeezing and cupping and caressing the inside of her thighs, you slowly meander your way down between the horny alien’s legs and");
	if (pc.hasKnees()) output(" slip down onto your knees");
	else output(" crouch down on your bestial lower body");
	output(", all but crawling underneath Nevrie’s desk. Your fingers brush across her zipper, bulging under the tumescing heft of her hermaphroditic member. With great care, you work the zipper down until the bronze crown of the secretary’s cock is poking out, ripe for the tasting.");

	output("\n\n<i>“Ohh, fuck,”</i> she groans as your [pc.tongue] caresses her cockhead, wrapping under the modest shaft behind her tip and guiding it towards your [pc.lips]. <i>“You just get right down to it, don’t you?”</i>");

	output("\n\nOpening wide for");
	if (pc.isTreated() || pc.isBimbo()) output(" her cute little girl-cock");
	else output(" the hot slab of girl-cock at the tip of your tongue");
	output(", you give Nevrie a lascivious wink and gulp down the first inches of her petite member. She’s got maybe six inches to her name, just enough to give you a nice mouth-filling prick to suckle on while planting your lips against her crotch, and the great big pair of balls still tucked under her pants. Now <i>those</i> look even more succulent than her dick.");

	output("\n\nSuppressing a little smile, you reach into Nevrie’s pants and fish out her cum-swollen sack. Your partner moans loudly when your hands wrap around her nads, putting just enough of a squeeze on them to make her prick throb in your mouth, drooling a drop of pre onto the back of your tongue. You roll Nevrie’s full sack between your fingers, enjoying the weight of them: you can all but hear the musky alien spunk roiling inside them, waiting to surge out and splatter your face with hot seed.");

	output("\n\nThe thought of it makes you suck a little more fiercely, eagerly working for your lover’s orgasm - and the sizable discount that entails.");

	output("\n\nNevrie’s fingers dig viciously into the arms of her chair, legs alternating between squeezing your shoulders and scrabbling on the cold, smooth floor, desperately trying to find purchase that refuses to be found. Her oddly-shaped feet eventually settle for groping at your back, pulling you deeper into her crotch.");

	output("\n\nWell, if that’s the way she wants to play.... You spit her throbbing member out of your mouth and lick your way down its underside, noisily slurping your way to the taut skin of her balls. You pucker your lips around a particular patch and give it a gentle pull, sucking just enough on it that when you let go, it makes a satisfyingly wet <i>pop</i>. Nevrie sucks in a sharp breath, arching her long back and squirting a thick glob of pre-cum onto your cheek.");

	output("\n\n<i>“Heh. Dirty "+pc.mf("boy", "girl") + ",”</i> she laughs, leaning down to a run a finger through the seed-stain on your face, smearing the dollop of her pre across your face - and planting a nice, fragrant helping of it right under your nose. You’ve got little choice but to breathe deep of the intoxicating aroma, letting it arouse your senses and drive you deeper into your lusty rut. You continue to worship at the altar of Nevrie’s churning balls, suckling and kissing and rolling them between your lips. With every moment of attention you lavish upon her sack, Nevrie’s fat cock twitches and spurts more of that wonderful-smelling juice onto your face, milked out by your incessant oral ministrations.");

	output("\n\nShe’s so close now, and just from getting those big nuts of her played with!");

	output("\n\n<i>“Not... not so much. Gonna... gonna...”</i>");
	
	output("\n\nYou grin up at her and just keep doing what you’re doing, letting your tongue and lips tease her balls and shifting your [pc.face] to balance her throbbing shaft front and center, waiting for her to splatter you with all that pent-up cum.");

	output("\n\nShe doesn’t make you wait long.");

	output("\n\nNevrie grunts a curse out and throws her head back in a cascade of blue hair, trying desperately not to scream out her pleasure as you drive her over the edge. Her cock leaps to full mast, suddenly turgid with oncoming spunk, and gives one last, powerful throb on the tip of your nose before it erupts in a geyser of creamy whiteness. You " + pc.mf("chuckle", "giggle") + " as Nevrie’s spunk splatters across your face and [pc.hair], bathing you in delightful, musky warmth.");

	output("\n\n<i>“Ugh,”</i> Nevrie groans, collapsing back in her chair with a gasp. While she does so, her prick continues to spurt and drool onto your face, right up until you wrap your lips around her crown and give it a coaxing little suck - just enough to draw out the last of her load onto the tip of your [pc.tongue]. You swallow it greedily, licking up what you can from your [pc.lips] and cheeks before Nevrie finally chuckles and hands you some tissues from a drawer.");

	output("\n\nWhile you’re getting cleaned up, the alien vixen reclines in her chair and puts her feet up, clearly sated - and clearly none too eager to bother stuffing her dick back in her pants, content to let her package rest on the cusp of her fly as she catches her breath. You pull yourself up from under her desk, giving her dick one last affectionate pat before asking if she wouldn’t mind fulfilling her end of the bargain.");

	output("\n\n<i>“Oh, I guess,”</i> she yawns lazily, using her toes to strike a few holographic keys and spin the display around to face you. <i>“There you go: employee discount. One session only, though. Gotta get more blowjobs... balljobs? Whatever... out of you somehow.”</i>");

	if (silly) output("\n\nIf you didn’t know any better, you’d say you’re getting exploited!");
	else if (pc.isBimbo()) output("\n\nSilly girl, you’d have done <i>that</i> anyway!");

	pc.loadInMouth(nevrie);

	processTime(10+rand(5));

	flags["NEVRIE_DISCOUNT"] = 1;
	flags["FUCKED_NEVRIE"] = 1;
	
	processTime(10 + rand(5));

	clearMenu();
	addButton(0, "Next", myrellionNevrieShop, true);
}

public function myrellionNevrieCoworkers():void
{
	clearOutput();
	nevrieHeader();

	output("<i>“So, where </i>is<i> everyone else?”</i> you ask, looking around the empty storefront. <i>“You can’t really be the only person here?”</i>");
	
	output("\n\nNevrie answers with a disgruntled grunt, crossing her arms under her ample bust. <i>“I pretty much am, actually. My boss, Doctor McAllister, is </i>supposed<i> to be running this place, but he keeps going off with all his ‘research assistants’”</i> - Nevrie pauses to make a pair of exaggerated air quotes around the term - <i>“to the gold ant-girl city under us. Gildenmere. He says he’s trying to collect blood samples of the myr races for his work, but I’m pretty sure he’s just cruising between different parties with those gigantic tittymonsters the golden ones call queens.”</i>");
	
	output("\n\n<i>“Oh? What makes you say that?”</i>");
	
	output("\n\nShe chuckles. <i>“Aside from the spring in his step every time he goes off on an ‘expedition,’ you mean? The golds are basically lining up for a chance to suck his dick. They think he’s going to be the ‘savior of their people’ or something. Really it’s because he’s the one who convinced Xenogen’s board of directors to throw their weight into that big murder-death-fleet hanging out in space that’s keeping the locals from blowing themselves - and all of us - up.”</i>");
	
	output("\n\nYou urge her to continue. Given an open ear to complain at, she seems quite happy to oblige. <i>“It’s dumb, if you ask me. He’s convinced the honeypot ants are going to be the next big thing in cosmetic gene-mods for chicks: every babe in the galaxy will line up to make it so her tits are constantly swelling with milk or honey or whatever until they’re so big she can’t move.”</i>");
	
	output("\n\nAfter a moment’s consideration, Nevrie laughs and adds, <i>“Well, I’d take a pass on it, anyway. Wouldn’t mind getting my hands on a couple of girls modded like that for my harem. Uh, if I had a harem, anyway. Someday!”</i>");
	
	output("\n\nShe gives a dreamy sigh and leans back in her chair, crossing a leg over the other. <i>“I don’t know when Doc. McAllister’s gonna be back. And when he does, he probably won’t stick around long. Keeps saying he can’t find one of the red ants to get samples from. Don’t know how she expects to find a red myr between a goldie Queen’s tits, but whatever. I guess the hospital and the Red embassy don’t feel like helping.");
	
	output("\n\n<i>“If you want to talk to Doc. McAllister, maybe </i>you<i> should go find the stupid samples. Otherwise, I guess I’ll just have to sit here getting paid to do nothing all day. Woe is me.”</i>");
	
	output("\n\nYou suppose subtlety isn’t one of Nevrie’s strong suits.");

	flags["NEVRIE_QUEST"] = 1;

	processTime(5+rand(3));

	myrellionNevrieMenu(myrellionNevrieCoworkers);
}

public function myrellionNevrieBloodVial():void
{
	clearOutput();
	nevrieHeader();

	output("<i>“Here you go,”</i> you say, fishing the blood vial out of your pack and planting it on Nevrie’s desk.");
	
	output("\n\nThe blue-haired alien blinks in surprise, swinging her feet off her desk and snatching the offered vial up. <i>“Wow, you actually went out and got it! Lemme just run this in the back and make sure it’s viable. Hang on a sec for me.”</i>");
	
	output("\n\nYou nod, and Nevrie hops out of her chair for, as far as you can remember, the first time since you met her. She disappears through the back door, and after a while you hear a machine whirring, beeping, and spit out something. Nevrie comes back after that with a smile on her face and a dataslate tucked under an arm.");
	
	output("\n\n<i>“Everything checks out, [pc.name]. This sample should be more than enough for Doc. McAllister to synthesize for his precious mod. He’ll be back in a couple hours, I guess. If you want to talk to him feel free to wait around for a bit. Take a nap in our luxurious lobby chairs; I’ll let you know when Doctor McAllister’s in.”</i>");

	pc.removeKeyItem("Red Myr Blood");

	flags["NEVRIE_QUEST"] = 2;
	flags["NEVRIE_SAMPLES_TIMESTAMP"] = GetGameTimestamp();
	
	processTime(3 + rand(2));

	myrellionNevrieMenu();
}

public function mcallisterMeeting():void
{
	clearOutput();
	mcallisterHeader();

	flags["MCALLISTER_MEETING_TIMESTAMP"] = GetGameTimestamp();

	output("The clustered scientists look up in almost comic unity when they finally notice the outsider amongst them. The lab assistants regard you with cool curiosity, like you’re another specimen to gawk at. After a moment, the towering man in the middle of them gives you a broad smile from beneath his curly moustache.");
	
	output("\n\n<i>“Ah, you must be [pc.name] Steele, eh?”</i> he says, thrusting his hand out at you. <i>“Doctor Byron McAllister, at your service. I hear we’ve got you to thank for find us a red myrmedion sample. Good on you for that - you’re advancing the cause of science, my " + pc.mf("boy", "girl") + ".”</i>");
	
	output("\n\nYou return the smile and shake the jolly bearded man’s hand, thinking to yourself he looks more like a lumberjack than a scientist.");
	if (flags["MET_DR_HASWELL"] != undefined) output(" He’s certainly nothing like that other Xenogen doctor you’ve worked with, Dr. Haswell.");
	
	output("\n\n<i>“So, anything I can do for you, "+pc.mf("Mr.","Ms.") +" Steele?”</i>");

	flags["MET_MCALLISTER"] = 1;

	processTime(3 + rand(2));
	
	//To McAllister's dialogue menu
	mcallisterMenu();
}

public function approachMcallister():void
{
	clearOutput();
	mcallisterHeader();

	if (flags["MCALLISTER_MYR_HYBRIDITY"] == 2 && GetGameTimestamp() >= (flags["MCALLISTER_MYR_HYBRIDITY_START"] + (7 * 24 * 60)))
	{
		//New key item get: Orange Myr Data
		pc.createKeyItem("Orange Myr Data");
		flags["MCALLISTER_MYR_HYBRIDITY"] = 3;

		output("<i>“Ah, [pc.name],”</i> McAllister says with a broad smile as you approach. <i>“Just who I wanted to see. Things have come along swimmingly... better than I expected, in fact.”</i>");
		
		output("\n\nHe reaches into his pocket and produces a single pill, wrapped in clear plastic wrap, and presses it into your hand. You look it over, eying the orange and white stripes on it. Is this...?");
		
		output("\n\n<i>“Finished enough for testing!”</i> McAllister declares proudly. <i>“Likely still a few tweaks to make, but nothing to be done before I see it in action. It’s certainly safe for human consumption... and for myr consumption as well. Ah, and here, take this as well.”</i>");
		
		output("\n\nThe doctor hands you a data chit, and explains that it’s loaded with the full specifications to reproduce the orange myr gene mod he’s made for you. Any geneticist could easily use the data there to start mass producing the pills.");
		
		output("\n\nYou thank the good doctor and jab the data chit into your Codex and upload its contents to the Steele Tech server, with an attached <i>“suggestion”</i> that the company consider getting into the xeno-genemod business.");
		
		output("\n\nNow all you need to do is find somebody to start distributing the stuff...");

		processTime(3 + rand(2));
		
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		output("<i>“Steele!”</i> McAllister booms as you approach, vigorously shaking your hand. <i>“What can I do for you, eh?”</i>");
		mcallisterMenu();
	}
}

public function mcallisterMenu(cFunc:Function = null):void
{
	clearMenu();

	if (flags["MCALLISTER_MYR_TFS"] == undefined)
	{
		if (flags["MCALLISTER_MEETING_TIMESTAMP"] <= (GetGameTimestamp() - (24 * 60))) addButton(0, "Myr TFs", mcallisterMyrTFs, undefined, "Myr Transformations", "Check in on the myr transformations McAllister was supposed to be working on.");
		else addDisabledButton(0, "Myr TFs", "Myr Transformations", "You probably need to give Dr. McAllister more time to work.");
	}
	else if (flags["MCALLISTER_MYR_TFS"] == 1)
	{
		addButton(0, "Meet Them", mcallisterMyrTFsMeetThem, undefined, "Meet Them", "Meet the very first faux-myr girls.");
	}
	else
	{
		if (flags["MCALLISTER_MYR_HYBRIDITY"] == undefined)
		{
			addButton(0, "Myr Hybrid", mcallisterMyrHybrids, undefined, "Myr Hybridity", "That meet and greet with the myr girls got you thinking about something...");
		}
		else if (flags["MCALLISTER_MYR_HYBRIDITY"] == 1)
		{
			if (pc.credits < 20000)
			{
				if (cFunc != mcallisterMyrHybridsII) addButton(0, "Myr Hybrid", mcallisterMyrHybridsII, undefined, "Myr Hybridity", "Talk to McAllister about your hybrid myr idea again.");
				else addDisabledButton(0, "Myr Hybrid");
			}
			else
			{
				addButton(0, "Research", mcallisterMyrHybridResearch, undefined, "Research", "Cough up the fee for McAllisters research.");
			}
		}
		else if (flags["MCALLISTER_MYR_HYBRIDITY"] == 2)
		{
			addDisabledButton(0, "Research"); // 9999 use button tooltip as a progress display?
		}
	}

	if (cFunc != mcallisterMyrQueens)
	{
		if (flags["MCALLISTER_GOLD_MYR_TALK"] != undefined) addButton(1, "Myr Queens", mcallisterMyrQueens, undefined, "Myr Queens", "Ask Dr. McAllister about his treatment by the Queens of the Gilden Republic. They seem quite infatuated by him...");
		else addDisabledButton(1, "Myr Queens", "Myr Queens", "You should probably have a chat with Dr. McAllister about the Gold Myr in general first...");
	}
	else addDisabledButton(1, "Myr Queens");

	if (cFunc != mcallisterGoldMyr) addButton(2, "Gold Myr", mcallisterGoldMyr, undefined, "Gold Myr", "Ask Dr. McAllister what he thinks about the gold myr.");
	else addDisabledButton(2, "Gold Myr");

	if (cFunc != mcallisterRedMyr) addButton(3, "Red Myr", mcallisterRedMyr, undefined, "Red Myr", "Ask Dr. McAllister what he thinks about the red myr.");
	else addDisabledButton(3, "Red Myr");

	if (cFunc != mcallisterXenogen) addButton(4, "Xenogen", mcallisterXenogen, undefined, "Xenogen Biotech", "Ask Dr. McAllister about the mega-corporation he works for.");
	else addDisabledButton(4, "Xenogen");

	addButton(14, "Back", mainGameMenu);
}

public function mcallisterXenogen():void
{
	clearOutput();
	mcallisterHeader();

	output("<i>“Tell me a little about Xenogen,”</i> you prompt, glancing around the high-tech lab as you do so. This pre-fab research outpost looks about as well-stocked as any of the labs your toured back at Steele Tech in the core. Impressive, to say the least.");
	
	output("\n\nHe smiles broadly, though you can see a couple of the research assistants clustered around him roll their eyes with exasperation. <i>“Xenogen’s the largest and most advanced xenobiology research firm, and produces the highest-quality gene therapy modifications in the galaxy. We produce cosmetics, of course, but also more meaningful therapies: treatments to cure ailments, help colonists adjust to alien habitats and strange new worlds, ways for people to fit their mental images of themselves they otherwise never would. That’s all the reward in the world right there, isn’t it ladies?”</i>");
	
	output("\n\nHis gaggle of female assistants dutifully nod their heads.");
	
	output("\n\n<i>“In all seriousness, Xenogen is the company that makes sure young worlds like Mhen’ga and Myrellion have a fair chance. They don’t have a lot to offer the galaxy at large, at least without being exploited, but the recent trend in cosmetic gene therapies means every race has something the rest of the galaxy wants: their appearance. People will pay top dollar back in the core to look like these newly-discovered races: it’s something of a fad amongst the wealthy, and every therapy we design broadens the horizon for everyone’s self-fulfillment. If you want to mix fanfir draconic traits with honey-laden myr and the tremendous musculature of a thraggen, then that’s your right.”</i>");
	
	output("\n\n");
	if ((pc as Creature).isMischievous()) output("Cheekily, you ask if that’s why there’s a fleet in orbit around Myrellion.");
	else output("<i>“So is that why there’s a fleet in orbit?”</i>");
	
	output("\n\nMcAllister balks at that, but quickly turns that into a boisterous laugh. <i>“I suppose it is! I was part of the first team that discovered Myrellion here, just on the brink of nuclear war. The two races were ready to destroy each other - there wouldn’t be much for us to study, to mimic in cosmetics, if they managed to glass the planet, would there? The corporate executives jumped on the idea to sell the public we’re saving the myr race, of course, after I convinced them the gold myr could provide a smash hit gene therapy. I didn’t expect that much of a response - the whole fleet business - but it’s certainly kept the peace. That’s a net good, isn’t it?”</i>");
	
	output("\n\nYou suppose that’s true.");

	processTime(10 + rand(5));
	mcallisterMenu(mcallisterXenogen);
}

public function mcallisterRedMyr():void
{
	clearOutput();
	mcallisterHeader();

	output("<i>“What do you think about the red myr?”</i>");
	
	output("\n\n<i>“Not much to tell,”</i> McAllister responds, lacking his prior jovialness. <i>“At least, not that you probably haven’t gathered already. The reds are the aggressor race in this world war we’ve stopped. Violent by nature, value dispassion and determination over expression and artistry. Heh, that sounds awfully condemning when I say it out loud, doesn’t it? I’m sure they’re not that bad, but there’s little enough for me to latch onto with them. I’m sure their natural venom, lethargic and lust-inducing as it is, will make an excellent modification. They’re also considerably stronger, physically, than gold myr - who themselves are stronger than humans on average. Finding a way to harness their strength would certainly be popular, perhaps have military applications.”</i>");
	
	output("\n\n<i>“All thanks to you, of course.”</i>");
	
	output("\n\nCurious, you ask <i>“What was stopping you from getting a red myr’s blood anyway? There’s a whole embassy of them just down the street.”</i>");
	
	output("\n\nHe laughs at that, crossing his burly arms across his chest. <i>“They stonewalled me. Hard. That Nehzara would barely talk to me, said I was ‘in league’ with the Gilden Republic. Save a woman’s planet, and look at the gratitude she shows. Ha! Even the Golds couldn’t help with it, said they couldn’t force a prisoner of war into it. Something tells me they’d just rather not have a galaxy full of wanna-be Reds running around. Can hardly blame them.”</i>");
	
	output("\n\nDelightfully racist.");
	
	output("\n\n<i>“So, any redeeming traits you can see in the Reds?”</i> you ask.");
	
	output("\n\nMcAllister grunts and runs a hand through his curly red beard. <i>“As I said, they’re strong, and their venom will be a popular cosmetic treatment... maybe have some medical uses. But of the people themselves? They’re hard workers, make no mistake, and loyal to a fault. I’ve never heard one speak ill of her kin or country. First I thought they’d all been, I suppose brainwashed, but... I don’t believe that’s the case. Be it culture or nature, they are remarkably loyal and steadfast creatures. Admirable, I suppose, in their way.”</i>");

	processTime(5 + rand(5));
	mcallisterMenu(mcallisterRedMyr);
}

public function mcallisterGoldMyr():void
{
	clearOutput();
	mcallisterHeader();

	flags["MCALLISTER_GOLD_MYR_TALK"] = 1;

	output("<i>“What do you think about the gold myr? Nevrie mentioned you’re quite fond of them.”</i>");
	
	output("\n\nMcAllister chuckles, and several of his research assistants suddenly look rather uncomfortable. <i>“I suppose I am! To say they’re grateful to me would be quite the understatement. After all, I saved their nation - their world, really. Every Queen in the republic is trying to honor me in her own way: feasts and galas and all but begging me to sire offspring with them. I’m the toast of Gildenmere now.”</i>");
	
	output("\n\nWith a chuckle, he adds <i>“No wonder the damn Reds hate me.”</i>");
	
	output("\n\n<i>“The Golds really must love you,”</i> you say");
	if (pc.libido() >= 66) output(" a bit jealous of those offers the queens have made him");
	output(".");
	
	output("\n\n<i>“Like I said, I saved their race. With a little help from Xenogen, and then the Confederate fleet. The Golds were on the verge of total defeat before the First Contact fleet found them, and gave both sides enough of a pause to stop them from going nuclear. They’ve been losing this war of theirs for seven years, getting crushed by the Red Federation’s onslaught. City after city fell, until they were pushed back to the walls of their capital. We’re standing on top of the last bastion of Gold civilization, you know. The last real stronghold they have left.”</i>");
	
	output("\n\nHe sighs, and scratches at his beard. <i>“I pity them, really. The gold myr have an amazing culture, as much about sensuality and passion as it is artistry and camaraderie. Imagine, a race with no mothers and fathers as we’d understand them, only brothers and sisters that raise each other generation by generation. It’s quite fascinating, the culture and social structure they’ve developed around generational and sibling bonds. I can only imagine the Confederacy’s sociologists are going to have a field day when things calm down here.”</i>");
	
	output("\n\nOf that, you have no doubt.");

	processTime(5 + rand(5));
	mcallisterMenu(mcallisterGoldMyr);
}

public function mcallisterMyrQueens():void
{
	clearOutput();
	mcallisterHeader();

	output("<i>“So, you’re in pretty good with the Gold queens, huh?”</i>");
	
	output("\n\n<i>“To say the least!”</i> McAllister laughs - a rumbling, jolly sound that has his long beard swaying from his jowels. <i>“They’ve been incredibly accommodating, not to mention impeccable hosts. There’s something quite amazing, attending what feels like a Victorian manor dinner where your hostess is mid-coitus all the while, and gives birth before the main course is even through.”</i>");
	
	output("\n\nHe laughs again, clapping one of the nearby assistants on the shoulder when she visibly blushes. <i>“Truly incredibly, the way this species reproduces. Similar to earth insects in many ways, but distinctly different from any sapient hive species encountered so far. I can only imagine the value of a therapy that would emulate the body and reproductive abilities of a myr Queen. Ah yes, I know a few gravidophiles back home who will be keenly interested in whatever I eventually come up with to replicate the Queen’s physiology. Yes, that will be quite the seller...”</i>");
	
	output("\n\n<i>“And they’re all behind you making myr gene therapies?”</i>");
	
	output("\n\n<i>“Absolutely!”</i> McAllister says with a broad smile. <i>“While a gene mod will never make you </i>truly<i> a member of another race, it’s close enough to fool most passive scans, much less the human eye. More importantly, if you go full bore on them, they can allow you to breed true with your template race...”</i>");
	
	output("\n\nSo that’s what it’s all about! <i>“The myr need a better way to breed, right?”</i>");
	
	output("\n\nHe nods. <i>“The golds need men and more queens, of course. The reds as well, perhaps even more desperately, and part of the terms of the cease fire necessitate that both red and gold therapies be worked on concurrently. Hence the delay in work until you intervened. I’m not sure if both sides were stonewalling it, or hoping we’d cave and just make one of their mods closer. I can’t imagine - isn’t having the mods done what they both wanted?”</i>");
	
	output("\n\nMcAllister sighs and shakes his head. <i>“But yes, in the end, it’s all about rebuilding their populations. I should think I’m offering a better way than what Ambassador Juro wants, turning Myrellion into a kui-tan colony where the furry bastards can put a race full of cocks to use on a race almost completely lacking them. As much as I’d like to see the kui-tan spread, the myr should be protected as they are, not used as breeding stock for other species.”</i>");

	processTime(5 + rand(5));
	mcallisterMenu(mcallisterMyrQueens);
}

public function mcallisterMyrTFs():void
{
	clearOutput();
	mcallisterHeader();

	output("<i>“So, how’s work on the myr mods going?”</i>");
	
	output("\n\n<i>“Brilliantly!”</i> McAllister grins, motioning to one of his research assistants. She walks over to the far wall and pushes a buzzer, which causes a shutter to rise beside her. An adjacent room is revealed behind it, spartan and clinically white. Several machines are surrounding a bed in its center, where a pair of nude young women are sitting: one red myr, and one gold. Another pair of researchers are standing over them, busily working on datapads and checking the machines.");
	
	output("\n\nAfter a second, you notice the two myr girls are holding hands.");
	
	output("\n\n<i>“Our first two volunteers,”</i> McAllister explains. <i>“The drug’s still in the earliest stages, of course, but the results are beyond even my expectations. I don’t mean to brag, but it’s damn fine work if I do say so myself.”</i>");
	
	output("\n\nYou have to admit, it’s incredibly convincing work.");
	
	output("\n\nSeeing your reaction, McAllister’s grin widens. <i>“Care to meet our subjects? I’m sure our newly-made Red would love to meet the " + pc.mf("man","woman") + " responsible for her... insectification.”</i>");

	flags["MCALLISTER_MYR_TFS"] = 1;

	processTime(5 + rand(5));
	
	//[Meet Them] [No Thanks]
	clearMenu();
	addButton(0, "Meet Them", mcallisterMyrTFsMeetThem, undefined, "Meet Them", "Meet the very first faux-myr girls.");
	addButton(1, "No Thanks", mcallisterMenu, undefined, "No", "Continue talking with McAllister.");
}

public function mcallisterMyrTFsMeetThem(fromRootMenu:Boolean = false):void
{
	clearOutput();
	mcallisterHeader();

	flags["MCALLISTER_MYR_TFS"] = 2;

	if (fromRootMenu)
	{
		output("<i>“Let’s go talk to those test subjects of yours.”</i>");
	}
	else
	{
		output("<i>“Sure. Let’s go.”</i>");
	}

	output("\n\n<i>“Outstanding. Follow me, "+pc.mf("Mr.","Ms.")+" Steele,”</i> he grins, putting a bear-paw of a hand around your shoulder and guiding you towards a side door. His gaggle of assistants dutifully follow at your heels, typing away on their datapads. A short jaunt through a hallway takes you to a bog-standard decontamination machine, where McAllister tells his assistants to wait before guiding you inside.");
	
	output("\n\nThe decon. chamber’s computer beeps at you as it seals up. <i>“Please remove all clothing and equipment and place them in the bin.”</i>");
	
	output("\n\nCompletely nonchalantly, McAllister starts to undo the buttons on his lab coat, lets it fall to the ground, and starts to unbuckle his belt.");
	if (pc.isNude()) output(" You chuck your [pc.gear] into the bin and wait for the doctor to join you in nudity.");
	else if (pc.libido() < 70 || pc.exhibitionism() < 66)
	{
		output(" You feel a blush come over you as you realize you’re going to have to disrobe not just in front of Doctor McAllister, but the dozen or so female assistants standing placidly just outside the glass. You can feel their eyes on you, taking you in like just another specimen to study.");
	
		output("\n\nTaking a breath to steady yourself, you turn away from them and start to disrobe. You quickly pull off your [pc.gear] and and the rest of your equipment, stuffing it all into a bin that appears in the side of the chamber.");
	}
	else
	{
		output(" You follow suit, eagerly stripping out of your [pc.gear]. Grinning to yourself, you give the onlooking gaggle of researches a bit of a show while you disrobe, alternatively bending over and turning to face them for a full frontal assault. To your delight, several of them blush and look away; others stare wide-eyed at your [pc.crotch].");
	}
	
	output("\n\nAs you’re working, you can’t help but catch a few sidelong looks at the burly doctor beside you. He really <i>does</i> look more like a lumberjack than a science nerd: broad-chested, hairy as hell, with arms and legs bulging with muscle. And then, of course, there’s the member hanging down between his legs. McAllister must have had some modwork done to make that monster: it’s easily a foot long at half mast, fundamentally human in shape but bestial in size. You easily imagine him satisfying the titans that are the gold queens who constantly proposition him.");
	
	output("\n\nFor his part, McAllister pointedly ignores you. Whether out of disinterest or politeness, you can’t say.");
	
	output("\n\nWhen everything’s stowed away, leaving you and Doc. McAllister alone and naked together, the decon. computer beeps again and starts to leak a transluscent white mist into the chamber. It burns your skin ever so slightly, just enough to let you know that its boiling away the grime from your body, and leaving you feeling clean and tingly. When its finished, a second bin opens on the other side of the chamber. McAllister takes out a simple white robe from the bin, pulls it on, and tosses another to you. The garment automatically adjusts to your body as you pull it on,");
	if (pc.thickness <= 7) output(" retracting");
	else output(" expanding");
	output(" to a skin-tight fit.");
	
	output("\n\nWearing what looks like a mix between a labcoat, bodysuit, and robe, you’re finally allowed to cycle through the chamber and into the holding room with the pair of test subjects.");
	
	clearMenu();
	addButton(0, "Next", mcallisterMeetThemII);
}

public function mcallisterMeetThemII():void
{
	clearOutput();
	mcallisterHeader();

	output("<i>“Ladies! How are we doing");
	if (hours >= 4 && hours <= 12) output(" this morning");
	else if (hours >= 19 && hours < 4) output(" tonight");
	else output(" today");
	output("?”</i> McAllister says, rubbing his hands together excitedly. <i>“Are you both feeling alright?”</i>");
	
	output("\n\n<i>“Great!”</i> the faux-red beams, running a hand up her svelte, naked body until she’s cupping one of her perky breasts. She barely puts any pressure at all on it before a bead of myr nectar wells up on the tip of her nipple, staining her chitin-black digits. She giggles and makes a bit of a show of licking the nectar from her fingers.");
	
	output("\n\nThe other myr nods, running a hand through her long golden hair. Her other arm busies itself supporting her very, very generous bosom: while the wanna-be red isn’t exactly petite, her gold companion is absolutely stacked, rocking a honey-swollen rack that must be at least in the H-cup region.");
	
	output("\n\n<i>“The last round of mods did this to us,”</i> the gold says, pointing a plated finger at her companion’s leaky bosom. <i>“There’s so much coming out now, we can barely keep up with it!”</i>");
	
	output("\n\nOne of the researchers hovering nearby scribbles something down on her datapad. <i>“Everything seems alright, Doctor McAllister. Vitals are normal, no rejection of the therapy. We have noticed some... interesting side effects, however.”</i>");
	
	output("\n\n<i>“Oh?”</i> the doctor says, putting a protective hand on the red girl’s shoulder.");
	
	output("\n\n<i>“Nothing too serious. An increase in stamina, slightly lowered eyesight and capacity for color differentiation... markedly increased libido and tactile sensitivity.”</i>");
	
	output("\n\nMcAllister laughs heartily. <i>“Is that so? Well, I’m sure we can rectify the second symptom, though the others might be a beneficial effect. Put a note on my desk to work on separating those secondary effects from the main therapy.”</i>");
	
	output("\n\n<i>“Yes, doctor,”</i> she says obediently, typing a bit on her datapad before heading towards the chamber doors. The other researcher follows her out, sealing you and Doctor McAllister in with the pair of faux-myr.");
	
	output("\n\nYou turn to see if the researchers appear back in the lab, but find that there’s a simple mirror hanging on the wall, showing you your reflection. A hiss from the side of the room draws you attention, just in time to see a white sheet of metal dropping down over where the decontamination chamber door was, leaving you in a featureless white box of a room with only a simple touchscreen beside the door to remind you where it was a moment ago.");
	
	output("\n\nWith nothing else to distract you, your attention turns to the pair of faux-myr sitting in front of you. McAllister picks up a chart from the end of one of their beds and starts to examine it and the monitor machines surrounding them, but doesn’t say anything more. Maybe he’s giving you the opportunity to talk to the girls?");

	//[Next]
	clearMenu();
	addButton(0, "Next", mcallisterMeetThemIII);
}

public function mcallisterMeetThemIII():void
{
	clearOutput();
	mcallisterHeader();

	output("<i>“Hey there,”</i> you say, smiling at the pair of colorful ant-girls. Their attention immediately fixes on you, and they both return your smile.");
	
	output("\n\n<i>“Hi!”</i> the red myr says, still fondling herself. Your eyes are immediately drawn to to pink peak of her teat, beading with golden moisture. She grins up at you. <i>“Haven’t seen you before. Are you one of Doctor McAllister’s assistants?”</i>");
	
	if (pc.isMasculine()) output("\n\n<i>“Can’t be,”</i> the gold giggles. <i>“He’s a dude! And... pretty handsome, too!”</i>");
	else output("\n\nThe gold myr giggles in a way that makes her huge, fleshy bust quiver in her arms. <i>“No way, she’s too cute to be a another scientist!”</i>");
	
	output("\n\nYou introduce yourself: <i>“I’m [pc.name] Steele, the one who helped Doctor McAllister finish the red myr therapy.”</i>");
	
	output("\n\nThe red-plated girl gets a suitably excited expression, <i>“Oh, that was </i>you<i>. Thank you so much! I’m totally going to be staying red after all this: I’ve felt </i>amazing<i> since we started the trial.”</i>");
	
	output("\n\n<i>“Me too!”</i> the gold adds. <i>“I’ve been in a bunch of gene-mod trials before, but I’ve never felt this way before. It’s like my skin’s a thousand times more sensitive... even the chitin feels like one big clit all over!”</i>");
	
	output("\n\nAfter a second, she suddenly gasps and blushes, realizing what she just said. The red has to cover her mouth to keep from bursting out laughing, and ends up wrapping one of her arms around her golden sister, pulling the other girl tight - which seems to prove just how sensitive she really is. The gold gives a little moan and squeezes her legs together, but can’t hide the quick stiffening of her saucer-sized teats.");
	
	output("\n\n<i>“That would be the side effects Doctor Pratchet mentioned,”</i> McAllister chuckles. <i>“Must have ratcheted up their sensitivity a notch too high... or accidentally flooded them with red venom... hmm...”</i>");
	
	output("\n\n<i>“I think the, uh, sensitivity is just right,”</i> the red says. You watch her crimson digits sneak around from the gold’s shoulder down to one of her honey-swollen boobs and give it a playful squeeze. The other ant-girl gives a gasp, and squirts a healthy dose of nectar over her red twin’s fingertips.");
	
	output("\n\n<i>“Oh... oh gosh,”</i> the gold gasps breathlessly, clenching her legs tight around what you assume to be a pussy in full bloom, <i>“The libido thing... it’s </i>really<i> intense.”</i>");
	
	output("\n\nThe red smiles, and reaches her other arm around to cup a second handful of honey-tit. <i>“Come on, you know you love it... I heard you moaning when you were milking yourself into that pump they gave us. You came just from that!”</i>");
	
	output("\n\nDoctor McAllister looks up from his... whatever he’s doing... and his eyes widen slightly when he sees what the two myr girls are getting up to - or rather, what the red is getting up to with the hapless, squirming gold’s tits. With a gasp, the gold flops onto her back, too numbed by pleasure to keep herself upright; the red’s on her in an instant, planting her hands straight on top of her fellow ant’s big, soft breasts and digging her hands into the supple boobflesh.");
	
	output("\n\nHeightened libido your ass. These girls are positively sex-crazed.");
	
	output("\n\nNot that that’s really unusual out here on the frontier, per se, but still.");
	
	output("\n\n<i>“Feeling a little antsy, are you girls?”</i> McAllister chuckles, setting the dataslate down and running a hand through the lusty red’s short hair.");
	
	output("\n\n<i>“That was </i>awful<i>,”</i> the red giggles, moaning and leaning into McAllister’s hand. <i>“You owe us one for that!”</i>");
	
	output("\n\nThe gold manages to finally work up the energy to say something intelligable: <i>“And your friend, [pc.name], too!”</i>");
	
	output("\n\nThe red pries one of her hands off of the other ant’s breast, only to grab the front of Doctor McAllister’s robe-coat, pulling it open and grabbing his modded cock. From beneath the red-plated babe, the goldie reaches one of her long, chitinous legs out to the front of your robe and starts to tug at the belt holding it closed.");

	//[Go Along] [No, thanks]
	clearMenu();

	if (!pc.hasCock() && !pc.hasVagina())
	{
		addButton(0, "No, Thanks", mcallisterMeetThemNoThanks, undefined, "No, Thanks", "You'd rather not get in on a McAllister-Ant foursome. Get out whilst you can.");
	}
	else
	{
		if (pc.hasCock() && pc.hasVagina())
		{
			addButton(0, "Join (Cock)", mcallisterMyrGirlsCocky, undefined, "Go Along", "Well, if she insists. Toss your robe aside and hop onto the pair of lusty ant-babes.");
			addButton(1, "Join (Vag)", mcallisterMyrGirlsCunty, undefined, "Go Along", "Well, if she insists. Toss your robe aside and hop onto the pair of lusty ant-babes. You'll probably also get a taste of McAllister's great big cock on the way.");
			addButton(2, "No, Thanks", mcallisterMeetThemNoThanks, undefined, "No, Thanks", "You'd rather not get in on a McAllister-Ant foursome. Get out whilst you can.");
		}
		else
		{
			if (pc.hasCock()) addButton(0, "Go Along", mcallisterMyrGirlsCocky, undefined, "Go Along", "Well, if she insists. Toss your robe aside and hop onto the pair of lusty ant-babes.");
			else addButton(0, "Go Along", mcallisterMyrGirlsCunty, undefined, "Go Along", "Well, if she insists. Toss your robe aside and hop onto the pair of lusty ant-babes. You'll probably also get a taste of McAllister's great big cock on the way.");
			addButton(1, "No, Thanks", mcallisterMeetThemNoThanks, undefined, "No, Thanks", "You'd rather not get in on a McAllister-Ant foursome. Get out whilst you can.");
		}
	}
}

public function mcallisterMyrGirlsCocky():void
{
	clearOutput();
	mcallisterHeader();

	var selCock:int = pc.biggestCockIndex();

	output("Grinning, you let the amorous faux-myr do what she wants - which is, predictably, pulling your robe open and grabbing your [pc.cock "+selCock+"] between the arches of her plated feet. Your breath catches when she does so, wrapping your prick in a smooth, cool vice that feels more like latex than insectile chitin. The gold-hued babe gives you a smile and starts to move her feet, jerking you off in the same motions that bring you staggering forward towards the red’s upturned ass.");
		
	output("\n\nThe red myr, for her part, seems content to straddle the gold’s prone form and worship the shaft of McAllister’s cock, running her envenomed tongue from his base to his crown, guiding him towards her full red lips. As she does so, you’re treated to a view of her rosy twat winking at you from between wiggling cheeks, starting to bead with her mounting arousal. Her golden partner’s feet angle your rod up towards that slavering hole, getting you nice and hard by the time your [pc.cockHead "+selCock+"] is brushing the red’s lower lips.");
	
	output("\n\nThat finally draws the faux-red’s attention off of McAllister’s cock, getting her to look back over her shoulder at you. Around a mouthful of dick, she murmurs <i>“You’re the one who got me these mods. The least I could do is let you enjoy the results!”</i>");
	
	output("\n\nNow that’s an invitation! You grab her hips and ease yourself forward, letting your crown part the lips of her sex and kiss the wet, hot passage between them. She moans, and beneath her, the gold giggles and wraps her legs around your backside, pulling you deeper into her partner’s salacious slit. With that kind of urging, you find yourself gliding into the myr’s cunt: you feel its wet, squirming walls part like hot velvet around your [pc.cockHead "+selCock+"] and wrap around your shaft, squeezing oh so tight.");
	
	output("\n\n<i>“How about you let your friend here in on the action, too?”</i> McAllister laughs, drawing your attention for the first time since you earned the myrs’ attentions. As he speaks, he gently pushes the red girl’s head off his cock - no mean feat, considering how much he was just shoving down her throat - and lets the crown flop onto the gold-painted lips of the other ant-girl. She opens wide, almost languidly, like it’s the most natural thing in the word to accept the doctor’s spit-slick human shaft. McAllister’s hips start to pump forward, driving his footlong prick down her throat until the front of it bulges with his sheer size. The doctor starts to thrust in and out, fucking her mouth like a welcoming cunt and forcing up rivulets of spit and gagging moans from the golden’s mouth.");
	
	output("\n\nNow lacking a cock to suck, your red partner finds something else to keep her busy: a pair of big, jiggling golden tits. With a purr dripping with relish and anticipation, the red babe wraps her lips around the gold’s saucer-sized teats and starts to suck. You can see her cheeks bulging a second later, trying to keep up with the sudden surge of nectar flooding into her mouth. Grinning to yourself, you give her a slap on the ass, making that rosy butt jiggle - and making her gulp down what looks like a gallon of backed-up nectar straining her cheeks. She all but spews honey over the other myr’s balloon-like tit, giving you a look over her shoulder... that you answer with another open-handed swat and going");
	if (pc.balls > 0) output(" balls-deep");
	else output(" to the hilt");
	output(" in her sodden box.");
	
	output("\n\n<i>“Oh, God, yeah,”</i> the red moans, nectar drooling from the corners of her mouth, mixed with the ruddy pink lust venom you helped her attain. <i>“Do that </i>again<i>!”</i>");
	
	output("\n\nLooks like she likes it rough! You rear back and hammer home again, pounding her pussy with slow, powerful blows that make her whole body bounce with the impacts. She moans and grunts, breathing hard until her mouth ends up stuffed with McAllister’s prick again, muffling her voice behind inches of cockmeat. In so doing, the doctor frees the golden faux-myr’s mouth, letting her beg <i>“H-how about showing me a little love down there? I think... I think I’m starting to feel the venom working.”</i>");
	
	output("\n\nFair’s fair. At the climax of one of your thrusts into the red’s twat, you pull all the way out and switch your angle down to the golden mound between the lower myr’s legs - unlike her pureblooded counterparts, the modded beauty still has her cute little pussy right where it belongs - though you can also see a bulbous abdomen hanging off the bed beneath her, tipped with a puffy sex of its own. You ignore the abdominal slit for now, letting your [pc.cock] droop down and nestle into the valley of her main twat, hugged by a pair of flush lips until your hips rock your [pc.cockHead "+selCock+"] in line with her hole. You glide in easily, even smoother than into the red’s - you get the feeling this girl’s seen some meaty dicks before, maybe even McAllister’s.");
	
	output("\n\n<i>“Mmm,”</i> the gold coos, rolling her head back as you ease into her wide open and welcoming pussy. <i>“That’s what I needed! More... give me more!”</i>");
	
	output("\n\nYou happily oblige, starting with short, fast strokes into her that instantly reward you with a symphony of sultry moans and a squirt of pussy-juices that splatters against your thighs. Doesn’t take much to get this buxom slut going! You grab her legs and hike them up around your shoulders, letting you pound your way deep inside her, faster and harder, making her bubble butt quake with every hip-thrust.");
	
	output("\n\n<i>“I’d say the mod’s looking pretty successful about now,”</i> McAllister laughs, sucking in a sharp breath as the red beauty cups his balls and gives them a playful squeeze. <i>“It’d almost be a shame to change it any more.”</i>");
	
	output("\n\n<i>“You could - ah, yes! - tune the sensitivity down a little,”</i> the gold says, barely able to finish her thought as you hilt her.");
	
	output("\n\nThe red grunts and reaches back to plunge a couple of plated fingers into her tragically vacant gash. <i>“Speak for yourself. This is </i>amazing<i>! Sex has never felt like this before!”</i>");
	
	if (pc.isBro() || pc.isTreatedMale()) output("\n\nThat’s cuz she’s never had sex with <i>you</i> before!");
	
	output("\n\nSounds like an invitation to switch back to railing her, but before you can transition from gold to red, you hear McAllister grunt and buck his hips against the red’s lips. She grunts and gasps, and you see her throat bulging with a sudden influx of the doctor’s spunk; the red ends up gagging and coughing some of it up, and earns herself the last couple of squirts right on her cheeks when McAllister staggers back, pulling out of her spasming maw.");
	
	output("\n\nThe doctor gives a sated sigh and slumps against the back wall, cum still beading at the tip of his modded prick. The red giggles, licking the spooge off her lips - until the gold grabs her partner’s cheeks and pulls her in for a tongue-filled kiss, helping herself to the bounty of white cream staining her pale flesh. They stay entwined for just a moment, before the kiss is broken, and two pairs of bright eyes are suddenly, attentively looking to you.");
	
	output("\n\n<i>“I wonder what [pc.heShe] tastes like?”</i> the gold coos, licking up a little of McAllister’s spooge that had drooled onto her chin.");
	
	output("\n\nThe other ant giggles, still vigorously fingering herself. <i>“I dunno... but I want to find out!”</i>");
	
	output("\n\nYou smile at them and pull out of the gold’s pussy, stepping back as they start to crawl seductively towards you. They’re off the bed in the blink of an eye, moving towards you with feline grace until their hands are caressing your [pc.legs] and their mouths are situated on either side of your [pc.cock "+selCock+"], tongues reaching out to taste you - and the mixed veneer of their pussyjuices still coating your cock.");
	
	output("\n\nA couple of experimental licks end up with you leaning back against the mirror, struggling to");
	if (pc.hasFeet()) output(" stay on your feet");
	else output(" stay upright");
	output(" as the girls lavish your cock with their tongues and hands: they alternate licking you from base to crown, jerking you off wherever their tongues aren’t working");
	if (pc.balls > 0) output(" and cupping your balls, occasionally kissing and sucking your [pc.balls], churning the pent-up seed inside them");
	output(". The red ends up with her lips locked around your [pc.cockHead "+selCock+"] while the gold tends to your underside, thoroughly tongue-bathing all "+pc.cocks[selCock].cLength()+" inches of cockflesh.");
	
	output("\n\nUnder that kind of treatment, you can’t keep the girls from their prize for long. Sensing that you’re reaching your limit, the red pops off your cockhead, drool still bridging her lips to your crown; her golden partner joins her just as your [pc.cock "+selCock+"] starts to swell, seed rushing through its passage to meet their welcoming lips.");
	
	output("\n\n<i>“Gonna... gonna...”</i> you grunt, grabbing both their heads and angling them up to meet your gaze.");
	
	output("\n\n<i>“Cum on already!”</i> the red teases, licking her envenomed tongue across your glans, giving you a potent surge of lust - just in time for you to splatter her lips with [pc.cumColor] spunk! The girls all but fight over your cock after that, angling it onto one of their faces, then the other, then wrapping two pairs of lips around the head to try and suck your remaining load down. They drain you like pros, sucking up every last drop of seed you have to offer them until their faces are covered, and their mouths seem entirely painted with [pc.cumColor].");
	
	output("\n\n<i>“That was nice,”</i> the gold coos, running her tongue along the length of your cumslit. <i>“Maybe this new, uh, libido isn’t so bad.”</i>");
	
	output("\n\nThe other myr laughs, resting her head on the golden’s shoulder. <i>“I know, right!”</i> Turning to you, she adds, <i>“And thanks again for helping with the mods. I </i>really<i> like them.”</i>");
	
	output("\n\n<i>“Me too!”</i> the other confirms, flashing you a cum-stained smile.");
	
	//[Next] //To Combine
	clearMenu();
	addButton(0, "Next", mcallisterMeetThemGoAlongII);
}

public function mcallisterMyrGirlsCunty():void
{
	clearOutput();
	mcallisterHeader();
	
	var selCunt:int = (pc as Creature).biggestVaginaIndex();

	output("You let the amorous gold have her way with you, pulling the front of your robe open and guiding you towards the bed she and her crimson companion are splayed out on. You join the giggling beauties on the bed, giving them a gentle push apart and crawling in between them. The ant babes moan and giggle as you join them, running your hands along their legs and thighs, brushing your fingertips through the clefts of a pair of sultry pussies as you go.");
		
	output("\n\nThe girls both moan when your hands tease their cunts, arching them back and pushing back against your digits until you end up sliding into both of them at once, going knuckles-deep into the lusty sluts. You start to thrust, stirring up their insides until their voices for a chorus of moans and cries, their chitinous fingers digging into the sheets and brightly-painted lips so wide and inviting for the doctor’s perusal.");
	
	output("\n\nWith a hand on each girl’s head, right between her antennae, McAllister pops his cock out of the red’s venom-drooling maw and angles it toward the gold’s plump cockpillows. Her tongue reaches out for it, accompanied by a groan of blatant hunger until she’s guiding the doctor’s footlong shaft into her mouth. He buries himself to the hilt, nice and slow, until his balls are resting against the gold’s chin, and her throat is bulging with the sheer size of her lover’s shaft. Lucky girl, getting it from front and back at once...");
	
	output("\n\nGetting just a little bit jealous, you lean in and plant a half-kiss on the golden faux-myr’s lips, and on McAllister’s shaft. He gives you a big grin from beneath his bushy beard, accompanied by a grunt of approval as you lick and suck your way down from his base to the hefty swells of his balls. Your [pc.tongue] flicks out to caress his sack, wrapping around one of the cum-swollen nads and sucking gently - just enough to make him suck in a breath and thrust a little harder into the goldie’s mouth.");
	
	output("\n\nAfter a moment of pouting, the red ant on the other side of you decides she wants in on the proceedings. She starts to crawl over you, and you end up squirming and grunting underneath her as the horny ant-girl’s tits mash into the back of your head. She reaches up to lick her way across the doctor’s chest, spreading her venom across his nipples, and up into a full-mouthed kiss.");
	
	output("\n\nSince the two of them are having fun, you decide to borrow the buxom honeypot out from the bottom of your little fuck pile. She pops her lips off of McAllister’s dick and languidly rolls onto her back, cupping her hands under her pendulous rack. Grinning coyly, she asks <i>“Want a drink, [pc.name]?”</i>");
	
	output("\n\nShe better believe you do.");
	
	output("\n\nReturning her smile, you pick one of her swollen orbs and wrap your [pc.lips] around her golden teat, suckling gently until a flow of sweet, syrupy nectar drools into your mouth. She moans, arching her back and filling your cheeks with your lactic bounty, starting off with a trickle and ramping up to a flood. Your hands wander across her body as you suckle, slipping fingers into her pussy or squeezing her other breast, even reaching down to caress her insectile abdomen, and tease a finger around her second pussy.");
	
	output("\n\n<i>“Having fun there?”</i> McAllister asks, drawing your eyes to him - and his cock pistoning into the cunt of the cute little red ant, lying on her back with her legs wrapped around his hips.");
	
	output("\n\nYour gold-plated partner groans, running a hand through her flaxen hair. <i>“Nursing is so... so weird. So good!”</i>");
	
	output("\n\nMcAllister laughs, but the faux-ant whose tit is stuffed in your mouth blushes and asks you <i>“Would you... would you mind switching. To the other breast, I mean.”</i>");
	
	output("\n\nYou give her a thumbs up and do as she asks, quickly coaxing out a second tap of nectar from her other boob. Seeing her opportunity, the red hefts herself up onto her elbows and latches onto the tit you’d just released, sucking down nectar to the beat of McAllister’s cock pounding her pussy.");
	
	output("\n\nTo be honest, you’re starting to feel a little left out.");
	
	output("\n\nDeciding you’ve got enough nectar churning around in your stomach, you pop off of the goldie’s tit and slip up onto your [pc.knees] over the moaning ant-girls. After a bit of adjusting, you end up with your [pc.cunts] hovering just over the faux-myrs’ faces. Their eyes light up, clearly eager to return the favors you’ve been doing them, and you quickly have a pair of tongues running all across your thighs and crotch, narrowing in on your eager cunt.");
	
	output("\n\n<i>“That’s more like it,”</i> you groan, running a hand through both ant-girls’ hair and guiding them towards your [pc.cunt "+selCunt+"].");
	
	output("\n\n<i>“Hope you like venom,”</i> the red coos, running her tongue to the very bottom of your sex, circling it there and leaving a heady dose of her pink-tinged saliva on your pussylips.");
	// 9999 - red myr venom?
	if (pc.hasCock()) output(" As she does so, the gold’s hands reach up and caress your [pc.cock], latex-smooth fingers gripping you tight and starting to piston.");
	output(" The girls both smile up at you, playing their lips and tongues around your sex, never quite penetrating you. Still, the sensation’s almost overwhelming with the red’s venom starting to seep into you, to set your sex afire with lust.");
	
	output("\n\nYou assure the red you like her venom very much... but you’d rather have it deep inside than just skirting the edge of your cunt. The myr girls give each other a look, then nod in agreement. Their bright eyes turn back to you a moment later, and before you can blink you’ve got fingers spreading your slit wide open admiting a pair of probing tongues that bury themselves to the hilt inside you, licking their way across every sensitive inch of cuntflesh they can get at on the way in.");
	
	output("\n\nYour heart races, threatening to burst from your chest as the red venom takes hold of you. It’s all you can do to grab the headboard and dig your fingers in, trying not to cum after so little time... and so much pleasure.");
	
	output("\n\n<i>“Doing okay there?”</i> McAllister asks, barely audible over the sounds of your moans, and the faux-myrs’ eager slurps.");
	
	output("\n\nYou nod over your shoulder, unable to form words while a pair of writhing muscles are squirming all over your G-spot. He laughs, and you hear the wet sounds of him unsheathing his cock from whichever myr pussy he was going balls-deep in at the time. A look over your shoulder shows him meandering up the bed, hands all over the buxom ants... and then your [pc.butt]. Your eyes go wide as another pair of fingers slides in between your [pc.legs] drilling in alongside the babes eating you out.");
	
	output("\n\n<i>“N-no,”</i> you manage to moan, already feeling that it’s too late. <i>“Gonna... gonna cum!”</i>");
	
	output("\n\nThe girls giggle excitedly, and you feel McAllister’s fingers pump into you faster, his other hand soothingly on your shoulder. You let out a whimpering whine, and feel the last of your willpower crumble to dust in the arms of your three amorous lovers. Orgasm hits you a moment later, setting your body to shuddering and squirting, bathing the myr in your juices. They squeal happily and lick at their lips, making their enjoyment lewdly clear as your body convulses in waves of pleasure.");
	
	output("\n\nWhen the orgasm passes, you slump forward against the headboard, resting your head against the wall and gasping for breath. <i>“Oh, fuck,”</i> you breathe, chest heaving. One of the myr girls reaches up to cup your chest while the other plants her hands on your hips, fingers caressing your [pc.butt].");
	
	output("\n\nIt takes you a moment to distinguish the bulbous heft of a cockhead joining the fingers caressing you. You gasp, but find yourself wiggling your [pc.hips] invitingly, spurred on by the intoxicating touch of red venom to accept any new pleasure you can grab.");
	
	output("\n\nTaking your movements as silent encouragement, the doctor moves ahead until his cockhead is grazing the envenomed, drooling lips of your twat. You suck in a sharp breath, letting it out with a moan as he eases into you. The myr girls giggle and coo, running their hands across your body, caressing your [pc.chest] and [pc.hips], doing all they can to heighten your pleasure while McAllister penetrates you.");
	pc.cuntChange(selCunt, 250, true, true, false); // 9999 - volume
	
	output("\n\nHis cock might have <i>looked</i> big at first, but feeling it spreading your [pc.cunt "+selCunt+"] apart makes it feel like you’re taking a horse’s shaft, a massive, thick length of dick that");
	if (pc.vaginas[selCunt].looseness() >= 4) output(" fills even your stretched-out sex");
	else output(" stretches you in wondrous ways");
	output(", making you scream with pleasure.");
	
	output("\n\n<i>“That a " + pc.mf("boy","girl") + ",”</i> McAllister grunts, grabbing at your [pc.chest] as he rapidly hilts himself inside you. One of your hands immediately falls to your [pc.belly], feeling the lump of his monumental cock battering against your gut, stretching you out with its sheer inhuman size.");
	
	output("\n\nMcAllister starts to move after that, fucking you with quick, hard thrusts that leave your [pc.butt] quivering with every movement. Seeing you rendered passive by the big man hammering you, the myr girls guide your head down towards their quartet of ample, nectar-swollen breasts. Your lips find the red myr’s teat first, and she arches her back and moans, squirting her syrupy nectar into your eager mouth. The taste is distinctly different than that of the faux-gold - it’s not as sweet, but has a richer and creamier taste to it. Your taste buds swoon as you gobble it down, loving every moment of the alien taste.");
	
	output("\n\nA moment later and you’ve got the gold’s bronze teat stuffed in beside the other ant’s crimson peak, squirting her honey-sweet lactic bounty into your mouth as well. The girls squabble playfully for position, but eventually just ending up groping each other, which only leads into kissing.");
	
	output("\n\n<i>“I’m starting to think this mod’s just about perfect,”</i> McAllister laughs as the two myr caress and kiss each other. <i>“That Colonel Nehzara and the Queens would all be doing flips if they could see this, eh?”</i>");
	
	output("\n\nYou have to admit, even wracked by pleasure as you are, you can see the ironic beauty of a pair of modded myr making love like the two of them are. It’s sweet as honey, in its way.");
	
	output("\n\nStill, you don’t have time to ruminate on Myrellion race politics while you’re taking a great big cock. A hip-thrust that nearly knocks your head into the wall snaps you back to the moment, and you let out a husky moan");
	if (pc.hasCock()) output(" while the myr girls reciprocate McAllister’s thrusts by jacking your shaft");
	if (pc.hasCock() && pc.cocks.length > 1) output("s");
	output(". The doctor’s pace picks up, subtly at first, letting you adjust to him, but soon he’s pounding you like a jackhammer. You’re keenly aware of his breath becoming more ragged, and his cock twitching and throbbing more and more inside you - he’s getting close!");
	
	output("\n\nThen again, so are you. Though you’re still on the heels of the first climax, you can feel the telltale contractions starting in your [pc.cunt], squeezing tight around McAllister’s shaft. All you can do is grip the headboard and hold on for dear life while McAllister and the myr take you for a hell of a ride.");
	
	output("\n\nMcAllister grunts and hilts himself in you, burying his unnaturally long prick into your quivering slit and unleashing a torrent of seed. A gasp rends its way out of your mouth, but nothing else: no scream of pleasure, no lewd moans... all you can manage is a silent bulge of your eyes - and your [pc.belly] - as you take the doctor’s load.");
	if (pc.hasCock()) output(" As if to balance your body out, your [pc.cock] erupts across the myr girls’ faces, slathering the faux-ants with [pc.cumNoun]. They take it eagerly, mouths open and giggling.");
	
	output("\n\nSo much for the sterile feeling of the lab.");
	
	output("\n\nYou slump forward, breathing hard as McAllister’s cock slides wetly out of you, drooling spunk onto the bed... and into the myr girls’ bellies.");
	
	output("\n\n<i>“Oh! That was nice,”</i> the gold coos, running her tongue along the length of your twat, fingers rubbing the belly-coating of spunk she’s getting. <i>“Maybe this new, uh, libido isn’t so bad.”</i>");
	
	output("\n\nThe other myr laughs, resting her head on the golden’s shoulder. <i>“I know, right!”</i> Turning to you, she adds, <i>“And </i>thank you<i> for helping with the mods. I </i>really<i> like them.”</i>");
	
	output("\n\n<i>“Me too!”</i> the other confirms, flashing you a cum-stained smile.");

	clearMenu();
	addButton(0, "Next", mcallisterMeetThemGoAlongII);
}

public function mcallisterMeetThemGoAlongII():void
{
	clearOutput();
	mcallisterHeader();

	output("Giving the myr girls a big, exhausted grin, you roll off the bed and reach for your robe. McAllister laughs and rubs his hands vigorously, telling the girls that they have <i>“excellent stamina”</i> and other semi-medical evaluations of their sexual performance. If you didn’t know any better, you’d think this was all just a part of the doctor’s trials...");
	
	output("\n\n<i>“Well, Steele, what did you think?”</i> McAllister says, attention turning to you as he pulls his robe back on. Before you can answer, he claps you hard on the shoulder and guides you towards the decontamination chamber, much to the disappointment of the faux-myr. You try to get a word in edgewise, but the entire time you’re cycling through the chamber, McAllister is rambling on about various aspects of the gene mod he’s crafted: the lack of extra arms on the gold myr, the potency of the red’s venom, how physical changes beget mental changes.");
	
	output("\n\nFor your part, you still can’t get the image of a red and gold myr making love like that out of your mind.");
	
	output("\n\nMcAllister’s gaggle of lab assistants swarm him as soon as you’re out of the chamber, several of them chiding him about this breach or that. He plays them off with a laugh, saying the girls have been under observation long enough... and that he needed to see just how intense their libidos had become. <i>“We’ll lower it for the release batch, but I’d say it’s mostly on par with what we expected. They’re certainly convincing at a glance. Wouldn’t you say, Steele?”</i>");
	
	output("\n\nYou nod as you’re guided back to the main lab. <i>“They sure were...”</i>");

	processTime(60 + rand(15));
	pc.orgasm();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function mcallisterMeetThemNoThanks():void
{
	clearOutput();
	mcallisterHeader();

	output("This might be a little more than you were bargaining for. You slip away, heading towards the decontamination chamber and quickly cycling through it. The handful of research assistants gathered outside give you queer looks as you pass them by, adjusting your gear as you go. You note that the one-way mirror is still open, giving you a front-row view of the proceedings inside. By the time you get out there, you’re treated to a show of Doctor McAllister balls-deep in the cunt of the gold myr girl while the red uses her venom-laced mouth to lick around his nipples, rubbing her pussy all across the gold’s face as she does so. You find the button that changes the position of the screen, and quickly bring it down to give the trio what privacy you can.");

	//[Next]
	currentLocation = "XBMYRELLIONFRONT";
	
	processTime(30 + rand(15));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function mcallisterMyrHybrids():void
{
	clearOutput();
	mcallisterHeader();

	flags["MCALLISTER_MYR_HYBRIDITY"] = 1;

	output("<i>“So I’ve been thinking,”</i> you say, glancing towards the one-way mirror. <i>“Would it be possible to combine the red and gold myr mods?”</i>");
	
	output("\n\n<i>“Combine them?”</i> he echoes, eyes blinking wide, like the question had come completely out of left field. Truth be told, you’d have thought McAllister would have thought of it first. <i>“Well... I suppose you could. That would be a custom job, though, not just mirroring an existing species. Takes a little more work, you know. Although I suppose the myr probably </i>were<i> one race originally, split off several millennia ago. If that is in fact the case, hybridizing their genetics shouldn’t be that difficult. I did notice an overwhelming similarity between the two while I was working, too...”</i>");
	
	output("\n\nMcAllister blinks, looking at you as if snapping out a trance. <i>“Say, what brought this on anyway? And before you ask, this is technically a research lab. You’ll have to talk to an actual company rep if you want designed mods worked out.”</i>");
	
	output("\n\n<i>“No, no,”</i> you assure him. A designer mod isn’t exactly what you had in mind... Instead, you spend a few minutes explaining your take on your meet and greet with his two test subjects: that you saw a red and gold myr making love like they were the best of friends. No coercion, no drugs, nothing but sex-drive and passion brought them together. That, and a little gene work by Doctor McAllister.");
	
	output("\n\n<i>“Ah, yes,”</i> the big man says with a growing grin, stroking his bushy beard. <i>“I think I see what you’re getting at, [pc.name]. Think you can show these myr how moronic their little war is if they see just how similar they really are? Eh, that’s a very... simplistic take on things, don’t you think? As someone who’s spent several weeks in the company of gold myr queens, the local politics are a little more complex than that, I assure you.”</i>");
	
	output("\n\nIs that so? Surely, though - as someone who spends a great deal of quality time with the queens - the good doctor would want to do everything he can to help Myrellion.");
	
	output("\n\nMcAllister sighs and runs his hand through his beard, glancing between you and the gaggle of female assistants at his heels, all waiting with bated breath for his response. <i>“I do, believe me. But if - </i>if<i> - I were to sit down, design, and produce some sort of... hybrid myr treatment... you have to understand that process isn’t cheap. Mostly because I couldn’t do it on Xenogen’s time; I’ve got other responsibilities with the company now that the two main myr transformatives are finished, and more than one of my superiors are starting to talk about moving me to a lab on another world already. I’d effectively have to rent my own lab space from the company.”</i>");
	
	output("\n\n<i>“More importantly, though, you’d have problems of distribution and education.”</i> McAllister says, an almost venomous hiss on the last word. He glances in the direction of the Federation embassy, and adds, <i>“Most myr wouldn’t take it just </i>because<i>, you know. They’ve had seven years to entrench themselves in racial jingoism, especially the reds. Even if you convinced enough myr to take the therapy, you’d actually have to distribute it, and neither of us have the resources to mass produce and distribute expensive gene mods on our own dime.”</i>");
	
	output("\n\nNot on your dime, no... <i>“I introduced myself as Steele, right?”</i> you say");
	if (pc.isTreatedFemale() || pc.isBimbo()) output(" with a playful giggle");
	else output(" with a grin");
	output(". <i>“I might be able to handle that.”</i>");
	
	output("\n\nThe doctor’s eyes widen, and he lets out a croaking laugh. <i>“Ha! I thought you were different than your run of the mill rusher... yeah, if you can get Steele Tech to sponsor the therapy, we’re golden. Assuming Xenogen doesn’t take offense to me doing a little work for the competition, anyway. Heck, it’s a mega corp., it barely remembers I exist unless it needs me. I think I can swing a few off days to work. Tell you what, have your chief of research get in touch me with me and-”</i>");
	
	output("\n\nWith a flush of embarrassment, you cut McAllister off and mention that you don’t exactly have <i>full</i> access to Steele Tech’s resources at the moment. You might be able to talk to some people");
	if (annoIsCrew()) output(", including a head researcher conveniently parked outside on the tarmac");
	output(", but you don’t have the kind of pull to make the company go full force on your pet projects.");
	
	output("\n\n<i>“Ah,”</i> McAllister says. <i>“Well then. If you can somehow convince Steele Tech to run production of the mod - call it a new designer formula, I don’t care - that’ll at least give you a chance of pulling this off. That still leaves you the problems of initial funding and distribution here on Myrellion, though.”</i>");
	
	output("\n\n<i>“What would you need for funding?”</i> you ask.");
	
	output("\n\n<i>“Hrm,”</i> McAllister says, clicking his tongue as he thinks. <i>“Lab fees, equipment, components... if I’m frugal, I could perhaps swing it for 20,000. And then, only because I’ve spent so much time already looking over the myr genome working on the two true therapies for Xenogen. Fairly cheap, as far as research costs go. As for distribution... you’ll have to ask around. That will be the most complex and resource-consuming part of the operation. I’m afraid I don’t have any recommendations on it.”</i>");
	
	output("\n\n20,000 credits? That’s not cheap... you’ll have to think about it.");
	if (pc.credits < 20000) output(" Not that you have that much to begin with anyway.");

	processTime(15 + rand(5));
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function mcallisterMyrHybridsII():void
{
	clearOutput();
	mcallisterHeader();

	output("<i>“Twenty thousand credits, [pc.name],”</i> McAllister says, crossing his arms. <i>“I wish I could go lower, but that’s the minimum for lab costs and my time. And there’s still the problem of distribution... you’ll need to find somebody willing to spread these out to the myr, talk to them about the treatment, if you want to actually make an impact here. If we can at all.”</i>");

	processTime(3);
	
	clearMenu();
	mcallisterMenu(mcallisterMyrHybridsII);
}

public function mcallisterMyrHybridResearch():void
{
	clearOutput();
	mcallisterHeader();

	pc.credits -= 20000;
	flags["MCALLISTER_MYR_HYBRIDITY"] = 2;
	flags["MCALLISTER_MYR_HYBRIDITY_START"] = GetGameTimestamp();

	output("<i>“I’ve got the money,”</i> you tell McAllister, holding up a credit chit. <i>“Let’s do this thing.”</i>");
	
	output("\n\n<i>“Aha, so you do,”</i> he says, taking the chit and swiping it through a tablet. <i>“Excellent! I do have a few sick days saved up here at Xenogen, and Nevrie’s made the arrangements to rent the lab space from them as well. I’ll get started immediately.”</i>");
	
	output("\n\nYou smile at that. <i>“Any ETA on when you’ll be done?”</i>");
	
	output("\n\n<i>“About a week,”</i> McAllister says, handing the tablet off and grabbing a fresh labcoat from a drawer. <i>“Come back in a week, and I should have something for you. Maybe even a few test samples, eh?”</i>");
	
	output("\n\nAwesome. You tell McAllister you’ll check back with him then.");

	processTime(5);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}