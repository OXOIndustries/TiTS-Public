// 9999 - The first time you go into the shop, Haswell's quest on Mhen'ga should close off. Too late, fool!

/*
NEVRIE_QUEST states:
undefined/0 - not started
1 - started
*/
public function nevrieQuestComplete():Boolean
{
	if (9999 == 0) return true;
	return false;
}

public function nevrieHeader():void
{
	showName("\nNEVRIE");
	showBust("NEVRIE");
	author("Savin");
}

public function myrellionBiotechExteriorAddition():Boolean
{
	if (!nevrieQuestComplete())
	{
		output("\n\nA sign has been posted outside the Xenogen outpost, reading in big, bold red letters:");
		output("\n\nTHE DOCTOR IS <i><b>OUT</b></i>!");
	}

	return false;
}

public function myrellionBiotechInteriorAddition():Boolean
{
	output("\n\n");
	if (flags["MET_NEVRIE"] == undefined) output("A bronze-skinned woman with a pair of small horns poking out through her blue hair");
	else output("Nevrie");
	output(" is sitting behind the desk, her oddly-arched bare feet propped up on it while she reads the information flickering across her displays and munches on a sack of " + RandomInCollection("gummy candy", "salty pork rinds", "potato chips", "miniature cookies", "chocolate-covered pretzels") + ".");

	// 9999 - button to move to lab room - locked until nevrieQuestComplete()
	
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

	// 9999 - doc menu
}

public function myrellionMeetNevrie():void
{
	clearOutput();
	nevrieHeader();
	showName("XENOGEN\nBIOTECH");

	output("You wander up to the desk, and the blue-haired alien sitting behind it. {if Stellar Tether done: Now that you think of it, she’s got more than a passing resemblance to that hermaphroditic mercenary guarding the bomb back on Tarkus. Same species, perhaps?} She looks up from her data-screens like she’s just noticing your presence for the first time.");
	
	output("\n\n<i>“‘Sup,");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" nerd");
	else if (pc.characterClass = GLOBAL.CLASS_MERCENARY) output(" tough " + pc.mf("guy", "girl"));
	else output(" fly"+pc.mf("boy", "girl"));
	output(". Name’s Nevrie. Welcome to Xenogen and all that. If you want to check out the mods and stuff we’ve got for sale, you’ve come to the right place. Wanna talk to the actual brains, though, you’re out of luck. I’m pretty sure I’m the only one here right now, except the lab robots.”</i>");
	
	output("\n\nYou introduce yourself, and think of what to ask her.");

	flags["MET_NEVRIE"] = 1;
	myrellionNevrieMenu();
}

public function myrellionNevrieApproach():void
{
	clearOutput();
	nevrieHeader();

	output("\n\nYou wander up to the desk, and the blue-haired alien sitting behind it. Nevrie gives you a slight nod as you approach, tossing the bag of junk food she was munching on into a drawer under her desk. <i>“Welcome back,");
	if (flags["FUCKED_NEVRIE"] == undefined) output(" " + pc.mf("mister", "miss") + " Steele");
	else output(" [pc.name]");
	output(". Anything I can do for you");
	if (flags["FUCKED_NEVRIE"] == undefined) output("?”</i>");
	else output("... or </i>to<i> you?”</i> she says with a flirtatious smile.");

	myrellionNevrieMenu();
}

public function myrellionNevrieMenu(cFunc:Function = null):void
{
	clearMenu();

	if (cFunc != ) addButton(0, "Shop", myrellionNevrieShop, undefined, "Shop", "Ask to see the shop's inventory.");
	else addDisabledButton(0, "Shop");

	/*
	if (cFunc != myrellionNevrieHerRace)
	{
		if (flags["NEVRIE_TALK_RACE"] == undefined) addButton(1, "Her Race", myrellionNevrieHerRace, undefined, "Her Race", "Ask Nevrie about her race.");
		else addButton(1, "Her Race", myrellionNevrieHerRace, undefined, "Her Race", myrellionNevrieHerRace, undefined, "Her Race", "Ask Nevrie to tell you about the dzaan again.");
	}
	else
	*/
	addDisabledButton(1, "Her Race"); // 9999 - Not finished yet. Savin, pls.

	if (cFunc != myrellionNevrieDiscount)
	{
		if (flags["NEVRIE_SHOPPED"] == undefined) addDisabledButton(2, "Discount", "Discount", "You should probably check out the proces she's offering to begin with before you start begging for a discount!");
		else if (flags["NEVRIE_DISCOUNT"] == undefined) addButton(2, "Discount", myrellionNevrieDiscount, undefined, "Discount", "Maybe you could convince Nevrie here to give you a discount....");
		else addButton(2, "Discount", myrellionNevrieDiscount, undefined, "Discount", "Try and wrangle the shop's prices down, though something tells you you'll be using your mouth to do more than smooth-talk....");
	}
	else addDisabledButton(2, "Discount");

	if (flags["NEVRIE_QUEST"] == undefined)
	{
		if (cFunc != myrellionNevrieCoworkers) addButton(3, "Coworkers?", myrellionNevrieCoworkers, undefined, "Coworkers?", "Ask Nevrie about the co-workers she mentioned. How come she's the only person in the store?");
		else addDisabledButton(3, "Coworkers?");
	}

	if (cFunc != ) addButton(4, "SpecialStock", );
	addDisabledButton(4, "SpecialStock");
}

public function myrellionNevrieShop(isDiscount:Boolean = false):void
{
	clearOutput();
	nevrieHeader();

	flags["NEVRIE_SHOPPED"] = 1;

	output("You tell Nevrie you’d like to see what the Xenogen store has in stock.");
	
	output("\n\n<i>“Sure thing,”</i> she answers, spinning one of the holodisplays around so you can read it. <i>“Punch in whatever you want from the inventory list here, and one of the cargo bots will fetch it from storage.”</i>");
	
	output("\n\nWhile you peruse the shop’s holographic wares, Nevrie leans back in her swivel chair and pulls the bag of snacks she was eating earlier back out of the drawer and resumes munching, only occasionally shooting a glance your way.");

	processTime(8 + rand(2));

	clearMenu();
	// 9999 - don't forget discount handling!
	addButton(14, "Back", myrellionNevrieMenu, myrellionNevrieShop);
}

/* 9999
public function myrellionNevrieHerRace():void
{
	clearOutput();
	nevrieHeader();

"I haven't seen many of your species around," you say, eying the horned woman and the jagged plates growing out of her arms, brow, and hands. "{Would you mind telling me about your species? //Could you tell me about your species again?}"

Nevrie thinks about it for a second before saying "Sure. First off, my species is called the dzaan. 

GET FEN TO DO DZAAN CODEX PL0X
}
*/

public function myrellionNevrieDiscount():void
{
	clearOutput();
	nevrieHeader();

	if (flags["NEVRIE_DISCOUNT"] == undefined)
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

	if (flags["NEVRIE_DISCOUNT"] == undefined)
	{
		output("\n\nHer eyes widen as you approach. <i>“Uh, hey, I didn’t </i>actually<i> mean I’d give you a discount for sucking my dick.");

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

	output("\n\nSuppressing a little smile, you reach into Nevrie’s pants and fish out her cum-swollen sack. Your partner moans loudly when your hands wrap around her nads, putting just enough of a squeeze on them to make her prick throb in your mouth, drooling a drop of pre onto the back of your tongue. You roll Nevrie’s full sack between your fingers, enjoying the weight of them: you can all but her the musky alien spunk roiling inside them, waiting to surge out and splatter your face with hot seed.");

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
	
	output("\n\nShe gives a dreamy sigh and leans back in her chair, crossing a leg over the other. <i>“I don’t know when Doc. McAllister’s gonna be back. And when he does, he probably won’t stick around long. Keeps saying he can’t find one of the red ants to get samples from. Don’t know how expects to find a red myr between a goldie Queen’s tits, but whatever. I guess the hospital and the Red embassy don’t feel like helping.");
	
	output("\n\n<i>“If you want to talk to Doc. McAllister, maybe </i>you<i> should go find the stupid samples. Otherwise, I guess I’ll just have to sit here getting paid to do nothing all day. Woe is me.”</i>");
	
	output("\n\nYou suppose subtlety isn’t one of Nevrie’s strong suits.");

	flags["NEVRIE_QUEST"] = 1;

	processTime(5+rand(3));

	myrellionNevrieMenu(myrellionNevrieCoworkers);
}