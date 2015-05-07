import classes.Characters.PlayerCharacter;
import classes.PregnancyData;
/*Renvra
Half-Nyrean Shopkeeper

Character Notes
NCO in the Federation Army. Acts as logistical support for the occupation force, and has contracted with several offworld suppliers. Is interest in buying almost anything: if the Federation can't find a use for it, they can sell it. 
Pays a HUGE premium for FutureTech weapons and armor. 
She's abrasive, curt, and dryly snarky. Feels she has the weight of the entire Occupation on her shoulders, and it leaves very little room for faffing about. 
Never seen combat. Her service has entirely logistical and organizational. 
Joined the Federation Army not to vote, but to prove herself. Civilized nyrea, especially ones of mixed birth, have a hard time in Federation society. Seen as reckless cowboys who had no self control. 
Myr girls who like it are constantly all over her dick, which lacks the spines of a fullborn nyrea, and cums a moderate aphrodisiac(!). She's got a pretty big cock anyway, though, and a hefty bulge. 
Renvra is a functional hermaphrodite, but in a different way. She's only got a cock and balls, but her balls hold a pair of eggs, which she oviposits when she knots somebody. When not knotting, she cums an aphrodisiac-laden semen. Potentially, she could end up fertilizing her own eggs that way. Attack of the Clones, etc. 
Spiky, spiny red hair cropped short. Black eyes. Big, sensitive feelers. F-cup breasts, milky.*/

public function showRenvra():void
{
	showName("\nRENVRA");
	showBust("RENVRA");
	author("Savin");
}

public function renvraBonus():Boolean
{
	//Inside Room Descript
	output("The storefront here is quite small, made smaller still by crates upon crates of equipment both local and futuristic stacked to the ceiling inside. Several Scarlet Federation soldiers are scurrying around, cataloguing items, talking to offworlders, and carrying heavy loads between the shop floor and the back room. A glance through the curtain shows a much, much larger chamber beyond this one, where the workers have more room to deal with the massive inflow of inventory.");
	output("\n\n");
	if(flags["MET_RENVRA"] == undefined) 
	{
		output(" A tall, muscular woman behind the counter is shouting at several subordinates with a booming, commanding voice that sends them running for cover at the slightest mistake. She sighs, running a hand through her spine-like hair, and turns to you with an inquisitorial glance. You can immediately tell she’s not a red myr -- at least, not fully. (Part nyrea, maybe?)");
		addButton(0,"Shopkeep",approachRenvra);
	}
	else {
		output(" Renvra is standing behind the counter, snapping orders to her subordinates between curt conversations with other offworlders. ");
		if(flags["RENVRA_SEXED"] != undefined) output("She seems to soften -- if only a bit -- in light of your presence. She sneaks a smile at you, and her feelers instinctively lean your way.");
		else output("She gives you a curt nod, no more than she does any of the other dozen or so offworlders crowded the trade station.");
		addButton(0,"Renvra",approachRenvra);
	}
	return false;
}

public function approachRenvra():void
{
	clearOutput();
	showRenvra();
	//First Meeting
	if(flags["MET_RENVRA"] == undefined)
	{
		//+Lust 
		pc.lust(3);
		flags["MET_RENVRA"] = 1;
		output("You approach the angry-looking Scarlet Federation soldier behind the counter and ask if she’s the officer in charge here.");
		output("\n\n<i>“Officer?”</i> she snorts contemptuously, <i>“I work for a living, " + pc.mf("mister","missy") + "!”</i>");
		output("\n\nThe woman -- clearly not an officer -- crosses her arms beneath her... very expansive chest. Much larger than any of the other troopers’ you’ve seen patrolling around the city, that’s for certain, and the way she moves her arms makes her uniform strain around it. Seeing where your eyes are going, she growls savagely and shifts her weight back on her heels, which makes something very different strain against the front of her pants.");
		if(pc.isBimbo()) output(" Oh, baby, you want some of that monster!");

		output("\n\n<i>“I’m Sergeant Renvra, and yes, I’m in charge here. Did you want something, offworlder?”</i> she finally says, snapping your attention back to her face.");
		output("\n\nBlinking, you ");
		if(pc.isMischievous()) output("remind her that the sign outside said for offworlders to inquire within. So you’re inquiring. She rewards your wit with a completely unamused look.");
		else output("say that you saw the sign outside.");

		output("\n\n<i>“First time here? Alright, then, listen up. ");
		if(pc.isBimbo()) output(" I’m only going to say this once. For you, I’ll try and use small words.");
		output(" The Federation sets up trading posts like this in every city we conquer. We buy just about anything: scrap metal, medical supplies, food. Anything can help the war effort, and we’re willing to pay for it. Especially from you offworlders. High Command’s authorized us to pay very, very handsomely for functional alien weapons tech. Any questions?”</i>");

		output("\n\nThat’s one way to get a leg up on the enemy, you suppose. After a moment’s thought, you ask <i>“");
		if(pc.isBimbo()) output("So, like, do you sell stuff and... uh... stuff?”</i> Trying to keep your eyes off that package of hers is getting deliciously difficult.");
		else output("Do you sell anything here?”</i>");

		output("\n\n<i>“We do. To Federation troops. I’m not authorized to sell our stock to civilians. If you’re here to shop, I suggest you head across the park. Or head up to the manor house and tell the colonel you’d like to enlist, first. I’m sure she could find a use for you");
		if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output(",”</i> she says, and you think she just might be sincere.");
		else if(pc.isBimbo()) output(". You’re starting to get the feeling she doesn’t like you very much. What a meanie....");
		else output(".");
	}
	else
	{
		output("You approach the gruff halfbreed quartermaster, coughing to get her attention. She rounds on you, hands firmly planted on her hips.\n\n\"<i>What, spacer? Got something to sell off");
		if(flags["RENVRA_SEXED"] != undefined) output(" -- or were you hoping to browse the... back room inventory again");
		output("?");
	}
	renvraMenu();
}

public function renvraMenu():void
{
	clearMenu();
	if(pc.lust() >= 33) 
	{
		if(flags["RENVRA_RACE_TALK"] == 1) addButton(0,"Fuck Her",fuckHerYouNancy,0,"Fuck Her");
		else addDisabledButton(0,"Fuck Her","Fuck Her","You don't know her well enough for that.");
	}
	else addDisabledButton(0,"Fuck Her","Fuck Her","You aren't aroused enough for sex.");
	addButton(1,"Sell Items",sellItemsToRenvra);
	addButton(2,"Talk:Race",talkToRenvraAboutHerRaceBecauseSheIsBasicallyAnEndgameCoCCharacter,undefined,"Talk: Her Race","Ask Revnra about herself, and what exactly she is.");
	if(flags["RENVRA_SEXED"] != undefined) addButton(3,"Talk:HerSex",askRenvraAbootHerSex,undefined,"Talk: Her Sex","Ask Revnra about her biology in particular.");
	else addDisabledButton(3,"Talk:HerSex","Talk: Her Sex","You've got to get a little more up close and personal with her before asking about that.");
	addButton(14,"Leave",mainGameMenu);
}

//Talk: Her Race
//Ask Renvra about herself, and what exactly she is.
public function talkToRenvraAboutHerRaceBecauseSheIsBasicallyAnEndgameCoCCharacter():void
{
	clearOutput();
	showRenvra();
	output("You have to ask, <i>“You don’t look like your average myr...”</i> ");
	output("\n\n<i>“Did you work that out for yourself?”</i> she laughs. <i>“Half nyrea. On my mother’s side. Don’t ask how that worked out -- I imagine it was awkward and painful.”</i>");
	output("\n\n<i>“Didn’t expect to see anything but myr here,”</i> you say, looking around at all the Federation troops moving around you.");
	//if fought a nyrea before:
	if(9999) output(" <i>“Especially since most of the ones I’ve seen so far have been pretty hostile.”</i>");

	output("\n\nRenvra plants her hands firmly on her hips. <i>“That right? There’s not a lot of nyrea in the Federation, but we’re here. The biggest nyrean cities are north and across the ocean, back in our home territory. It’s not like the lone huntresses and little villages you’ll see around here, but powerful matriarchs with harems bigger than an infantry company. When the Federation formed, some of the matriarchs wanted in on it. Smart enough to realize they’re going to survive a lot longer with us than against us.”</i>");
	output("\n\nIf that’s the case, you have to say, you’re surprised there aren’t more halfbreeds like Renvra running around.");
	output("\n\n<i>“Oh, there’s a damn good reason we’re so rare,”</i> Renvra answers with a predatory grin.");
	//if Codex: Nyrea unlocked: 
	if(9999) 
	{
		output(" Considering her mother’s ovipositor had barbs on it, it isn’t hard to imagine why.");
		output("\n\nRenvra laughs. <i>“Lucky for my sex life, I didn’t inherit the nice, comfortable ring of spikes on my dick.”</i>");
		//Fucked
		if(flags["RENVRA_SEXED"] != undefined && 9999 == 0)
		{
			output("\n\nYou chuckle and say that you’re happy Renvra’s spike-free. Makes her much easier to deal with.");
			output("\n\n<i>“Easy to deal with?”</i> she snorts. <i>“Why don’t we step out back find out how true that is?”</i>");
		}
		//if unfucked and codex unlocked: 
		else
		{
			output("\n\nYou have to admit, one of those huge, pussy-stretching nyrean cocks must be pretty popular without those intimidating -- if surprisingly soft and harmless -- barbs on the tip.\n\nRenvra gives you an amused look and shifts her weight, emphasizing the hefty package between her legs. \"<i>You'd be right. And as it so happens, I'm overdue for a smoke break... if you want to see exactly what I'm packing, that is.</i>\"");
			output("\n\nThe way she's looking at you, the implication is anything but subtle. Looks like this horny halfbreed wouldn't mind a roll in the proverbial hay afterall....");
		}
	}
	else 
	{
		output("\n\n<i>“Reason?”</i>");
		output("\n\n<i>“Dick. Spikes,”</i> Renvra answers flatly. <i>“On us girls. The boys have pussies.");
		if(silly) output(" They say God has a sense of humor.");
		output("”</i>");
		//Unfucked & locked codex
		if(flags["RENVRA_SEXED"] == undefined) 
		{
			output("\n\nGlancing between her and her package, you ask if Renvra herself has spikes her on cock. You get an amused look from the halfbreed, and she shifts a bit to emphasize her bulge.");
			output("\n\n<i>“Wanna find out, offworlder? I’m overdue for a break.”</i>");
		}
		else
		{
			output("\n\nYou chuckle and say that you’re happy Renvra’s spike-free. Makes her much easier to deal with.");
			output("\n\n<i>“Easy to deal with?”</i> she snorts. <i>“Why don’t we step out back find out how true that is?”</i>");
		}

	}
	flags["RENVRA_RACE_TALK"] = 1;
	processTime(6);
	clearMenu();
	if(pc.lust() >= 33) addButton(0,"Fuck Her",fuckHerYouNancy,0,"Fuck Her");
	else addDisabledButton(0,"Fuck Her","Fuck Her","You aren't aroused enough for sex.");
	if(flags["RENVRA_SEXED"] != undefined) addButton(1,"Her Sex",askRenvraAbootHerSex,undefined,"Ask Renvra about her biology in paricular.");
	else addDisabledButton(1,"Her Sex","Her Sex","You must have had intercourse with her to unlock this discussion.");
	//[Fuck Her] [Her Sex] [Leave]
	addButton(14,"Leave",mainGameMenu);
}

//Her Sex
//Must have fucked Renvra before.
//Ask Renvra about her biology in particular.
public function askRenvraAbootHerSex():void
{
	clearOutput();
	showRenvra();
	output("Given the very... unique biology her mother race possesses, you have to ask what sex Renvra herself is. After all, you’ve seen her with a cock, balls, breast, no cunt. Does that make her a female of her race, or what?");
	output("\n\nSeeing that you’re not taking her up on her offer, Renvra deflates a bit. Glancing at her co-workers, she gives you a slight nod towards the back room. You follow her back to her office again, and she closes the door behind you. Whatever she’s got to say, she clearly doesn’t want her comrades to hear.");
	output("\n\n<i>“For one thing, I’m a woman. For another, I’m a functional hermaphrodite. Neither of my parents were -- myr and nyrea don’t have normally-occurring hermaphrodites. But me? You’ve seen me cum that pink shit, feels like red myr venom? Found out the hard way it’s actually semen. But I can lay eggs, too, just like a nyrea. Just need to knot my pecker in someone, and out they come.”</i>");
	output("\n\nA hermaphrodite without a cunt?");
	if(silly) output(" What a twist!");

	output("\n\n<i>“You don’t seem eager to share that,”</i> you say, indicating the closed door.");
	output("\n\n<i>“No. I’m not,”</i> she snaps, crossing her arms. <i>“I’m not eager to find out how the law is going to view a hermaphrodite, especially when the population’s so depleted after the war. I’d prefer not to end up in a breeding camp, gilded cage though it is. Especially since I’d probably be siring and bearing children in equal measure.”</i>");
	output("\n\nSo she just wants to escape having kids?");
	output("\n\nRen shrugs when you suggest it. <i>“I’ve sired children, like I said. A few breeder women I’ve served with have convinced me, when they didn’t want to wait their turn for a drone, or their post made them miss their chance. You should see the breeding schedules back home: they’re an incomprehensible mess, and there’s no room for a rain check. If you miss your chance, you’re going to be waiting a year or more for the next chance to climb on a dick. What I </i>don’t<i> want is to be on my back all day, every day, for the rest of my life fucking every horny breeder who comes my way.”</i>");
	processTime(4);
	//[Kids] [Leave]
	clearMenu();
	addButton(0,"Kids",askRenvraAboutKids);
	addButton(14,"Leave",mainGameMenu);
}

//Kids
//PC must have a cunt. 
//Ask Renvra what she’d think of having kids with you. Chances are, opening this line of conversation is going to end with you getting a pussyfull of venom-spunk. 
public function askRenvraAboutKids():void
{
	clearOutput();
	showRenvra();
	output("<i>“So, what if </i>I<i> convinced you,”</i> you tease, slipping closer to Renvra and grabbing a handful of her ass through her uniform.");
	output("\n\nHer package shifts visibly under her clothes, straining against your thigh. <i>“Oh, good, aliens traveled all the way across space and the first thing they want to do is have my babies. It’s comforting to know life works the same everywhere,”</i> she groans, rolling her eyes. <i>“If you want a bellyfull of my get, you’re welcome to ‘em.”</i>");
	output("\n\n<i>“That was... easy.”</i>");
	output("\n\nThe halfbreed in your arms snorts and slips a hand ");
	if(!(pc.armor is EmptySlot)) output("under your [pc.armor]");
	else if(pc.isCrotchGarbed()) output("under your [pc.lowerUndergarment]");
	else output("between your [pc.thighs]");
	output(" and brushes her fingers along the cleft of your sex. <i>“What? You’d think you’d realize by now... I’m easy.”</i>");
	
	flags["RENVRA_KIDS_TALK"] = 1;

	//Fem sex scene here, starting at {combine} under Fuck Her. 
	clearMenu();
	addButton(0,"Next",fuckHerYouNancy,-1);
}

//Sell Items
public function sellItemsToRenvra():void
{
	clearOutput();
	showRenvra();
	shopkeep = chars["RENVRA"];
	sellItem();
	//Insert sale interface.
}

//Finished Selling
//output("\n\n<i>“That all? Alright, we’ll find a way to make use of it,”</i> Renvra says, handing her new inventory off to a few of her underlings. You tell her to pay you in credits, and swipe your Codex over a scanner on the register. She taps a button, and you watch as your bank account’s total shoots up.");
//output("\n\n<i>“Anything else you find out there, bring it in. There’s not much we can’t find a use for,”</i> Renvra says, closing down the terminal. ");
//back to store tile

//output("\n\nNo Sale");
//output("\n\n<i>“Seriously? Quit screwing around, spacer,”</i> Renvra sneers, crossing her arms as the register shuts down. ");
//output("\n\n//back to store tile.");

//Fuck Her
//Unlocked via Her Race talk. Once unlocked, add [Fuck Her] to Renvra’s main menu (lust willing, of course). 
public function fuckHerYouNancy(fromRaceTalk:int = 0):void
{
	clearOutput();
	showRenvra();
	if(fromRaceTalk == 1) 
	{
		output("<i>“Lets,”</i> you say, nodding towards the back room.");
		output("\n\nRenvra’s thin, red lips twitch into something that might be a smile. <i>“I guess I did have a smoke break coming up, after all.”</i> Turning to one of her subordinates, she tells the other girl to <i>“mind the shop for few minutes,”</i> before hooking her hand ");
		if(!(pc.armor is EmptySlot)) output("through your [pc.armor]");
		else output("under your arm");
		output(" and hurriedly pulling you through the curtain. Renvra leads you through a short span of the back room, to a small office with shaded windows and <i>“Quartermaster”</i> printed on the door. She unlocks it and leads you in, her hands already moving to the buttons on her uniform.\n\n");
	}
	//from Storemenu: 
	else if(fromRaceTalk == 0)
	{
		output("You step a little closer to the halfbreed shopkeeper and ask if she’s got another smoke break coming up.");
		output("\n\nShe gives you a look and smirks, <i>“I guess I must have just missed mine. Must be working too hard. Think you could give a girl a light?”</i>");
		output("\n\nYou play along, saying that you’d be happy to. Renvra tells one of her subordinates to mind the shop for a few minutes before hooking her hand ");
		if(!(pc.armor is EmptySlot)) output("through your [pc.armor]");
		else output("under your arm");
		output(" and hurriedly pulling you through the curtain. Renvra leads you through a short span of the back room, to a small office with shaded windows and <i>“Quartermaster”</i> printed on the door. She unlocks it and leads you in, her hands already moving to the buttons on her uniform.\n\n");
	}
	//{Combine:}
	output("In the blink of an eye, Renvra’s uniform hangs limply from her shoulder, revealing the hefty swells of her F-cup breasts, each tipped with a rose-red nipple that stiffens under your gaze. She shrugs her shirt off, leaving herself with hands planted in her hips, black eyes wandering over your body. You slip off your [pc.gear] and go to her, pulling the halfbreed tight against yourself and grabbing one of her tits. Your fingers disappear into the startlingly soft boobflesh, a stark and pleasant contrast to the hardened woman they’re attached to. Renvra’s feelers twitch through her short hair, and her chitinous hands wrap around your waist. You gasp as her fingers brush your bare ass, squeezing your cheeks hard enough to make you groan.");

	output("\n\nThe moment your mouth is open, her lips are hot against yours, her tongue thrusting in between them. You melt into the surprise attack, squeezing Ren’s breasts and ass in turn, exploring every inch of her body until your hands find the loops of her belt. You yank it down with a single, rough motion, dropping her pants down around her ankles. More than a foot of thick, half-hard, horse-shaped ovipositor drops free between her legs. The thankfully spine-free flare of her ovicock throbs with anticipation, and its X-shaped slit glistens with a viscous pink moisture.");

	output("\n\nRen breaks the kiss a moment after you free her shaft, grinning ");
	if(pc.tallness >= 78) output("up ");
	else if(pc.tallness <= 66) output("down ");
	output(" at you.");
	//if PC has a dick: 
	if(pc.hasCock()) 
	{
		output(" <i>“So, what’s it going to be, spacer? Want a piece of my ass, or are you thinking about a");
		if(pc.hasVagina()) output(" pussy");
		else output("n ass");
		output(" full of this bad boy?”</i> she teases, stroking her massive prick.");
	}
	//elseif no dick:
	else output(" <i>“Ready to take this big bastard, spacer?”</i> she teases, stroking her massive prick.");

	pc.lust(20);
	processTime(4);
	clearMenu();
	if(pc.hasCock()) addButton(0,"FuckHerButt",buttFuckRenvra,undefined,"Buttfuck Her","Flop Renvra’s oversized cock out of the way and sink your dick in her tight ass.");
	else addDisabledButton(0,"FuckHerButt","Buttfuck Her","You need a penis to be able to put it in her butt.");
	addButton(1,"Bend Over",bendItLikeBeckhamForRenvra,undefined,"Bend Over","Bend over Renvra’s desk and let her fuck your [pc.vagOrAss] with her ovipositor-cock.");
}

//Bend Over
//Bend over Renvra’s desk and let her fuck your [pc.vagOrAss] with her ovipositor-cock. 
public function bendItLikeBeckhamForRenvra():void
{
	clearOutput();
	showRenvra();
	output("The sight of all that cockmeat on display is too much to resist, and you quickly find yourself sinking down onto your [pc.knees], putting yourself on level with the one-eyed monster between Renvra’s legs.");
	output("\n\n<i>“Gonna get me nice and ready, are you?”</i> she coos, stroking the girthy shaft. <i>“Good idea...”</i>");
	output("\n\nThe sheer length of Ren’s shaft demands that you wrap your hands around the crown, helping to hold it rigid while it would otherwise droop under its own mammoth weight. In your grasp, though, it’s easy to angle her X-shaped cumslit right to your lips. A hungry beast all its own, your [pc.tongue] slithers past your [pc.lips] to caress Renvra’s crown, probing the four folds of her flared cockhead. To your delight, the thick flaps of flesh at the crown part easily, granting you unobstructed access to the halfbreed’s sensitive insides.");
	output("\n\n<i>“Hey, what’re you-”</i> she says, cut off by a gasp of pleasure as you lick along the inside of her cock. Made for laying fist-sized eggs as much as fucking you full of her sweet seed, Renvra’s cock is a muscular, hollow tube that admits your entry without resistance, letting you probe ");
	if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("inches into her alien cock");
	else output("your inhumanly long tongue deep into her, straight down the shaft. She almost doubles over as you get down into her, lapping at places she’s never had touched before");
	output(". <i>“Fuck, that feels weird. The good kind of weird... but really, really weird.”</i>");

	output("\n\nYou wink up at her, and keep on licking. Slowly, you start to take the actual shaft into your mouth, opening wide to admit the girthy flare. ");
	if(pc.isBimbo()) output("You gobble up every inch of that delicious cock you can get, taking it straight down your throat and eager for more. Overwhelmed by your eager advance, Renvra’s left gasping and groaning, cupping one of her breasts and guiding your head further down her shaft. Now this is a cock that could really sate your appetites -- for a few minutes, anyway!");
	else output("You strain to take more than the first few inches of Ren’s cock, however. She’s simply too thick to go down your throat, and too long to fully bury between your lips. Still, you busy yourself as best you can with whatever parts of her dick you can get at, slathering her crown with a thick coat of spit.");
	output(" Your efforts are rewarded by a strange taste flooding onto your [pc.tongue], carried back into your mouth by its lapping motions. You find your heartbeat quickening, and your cheeks flushing darker than even the act of sucking cock in a back room might warrant.");

	output("\n\nSeeing your [pc.skinFurScales] darken, Renvra laughs and pats your head. <i>“A little aphrodisiac, courtesy of my myr half. Just a little more direct than their spit, that’s all...”</i>");

	output("\n\nYou try desperately to ignore the burning desire spreading through your body. Still, ");
	if(!pc.hasCock() && !pc.hasVagina()) output("the skin of your sexless crotch reddens, drawing down one of your hands to helplessly stroke it, trying to get some measure of pleasure from yourself");
	else if(pc.hasCock())
	{
		output("your cock jumps to attention, throbbing powerfully");
		if(pc.legCount > 1) output(" between your [pc.legs]");
		output(". You reach down and stroke it, urgently beating your meat while you can, knowing full well Renvra won’t be touching it");
	}
	else output("[pc.eachVagina] reddens, its lips flushing with unbidden chemical lust. You reach down to your nether lips, stroking them and smearing your eager excitement around. The more lube the better, you suppose...");
	output(".");

	output("\n\nAfter a few moments, Ren’s chitinous hands find their ways to your shoulders and pull you off her cock -- just by an inch, leaving you close enough to still bridge the distance between your lips and her flare with thick trails of spittle laced with pink. Your thoughts are awash in lust, hazy save for the overwhelming need for that big, beautiful, ");

	var x:int = -1;
	if(pc.hasVagina()) x = pc.findEmptyPregnancySlot();

	if(x < 0) output("ass");
	else output("pussy");
	output("-stretching cock of hers deep inside you.");

	output("\n\nOnce she’s plied your lips from her shaft, you look up at her with big, needy eyes... before turning your attentions to the desk pushed up against the wall beside you. As quick as you can, you sweep aside the collected paperwork and junk on the desktop and flop yourself down over it, chest down and ass up for her.");

	output("\n\n<i>“Now that’s what I like to see,”</i> Renvra growls, grabbing your [pc.butt] and sinking her plated fingers into you.");
	if(pc.isBimbo()) 
	{
		output(" <i>“Come all the way across the galaxy to spread your [pc.legOrLegs] for any alien with a big enough cock to fill that ");
		if(x >= 0) output("[pc.vagina " + x + "]");
		else output("[pc.asshole]");
		output(" of yours, huh? You spacers are really something... but I guess I could get used to it.”</i>");
	}
	else output(" <i>“The way you spacers act sometimes, I’m starting to think you’ve all come halfway across the galaxy just for alien cock, huh?”</i>");

	output("\n\nYou moan needily, ignoring Renvra’s teasing chastisement in favor of wiggling your [pc.hips] invitingly, pressing your ass back against Ren’s crotch. She chuckles and squeezes your backside a little harder, shifting her legs to align herself with the ");
	if(x >= 0) output("[pc.vagina " + x + "]");
	else output("[pc.asshole]");
	output(" on offer. Your body tenses, knuckles going white on the table edge as you feel Renvra sidle up behind you, and then the girthy flare of her ovicock pressing against the ");
	if(x >= 0) output("lips");
	else output("rim");
	output(" of your ");
	if(x >= 0) output("[pc.vagina " + x + "]");
	else output("[pc.asshole]");
	output(".");

	output("\n\nWith a nice, thick sheen on spit-lube and excess aphrodisiac coating her cockhead, Ren pushes forward with a slow, steady confidence. You clutch at the table, mouth twisting open in a husky moan of pleasure as the halfbreed’s massive ovipositor-slash-horsecock slides into your ");
	if(x >= 0) output("[pc.vagina " + x + "]");
	else output("[pc.asshole]");
	output(". Ren’s voice joins your own, groaning and cupping a breast as she eases her hips forward.");

	output("\n\nYou feel like you’re being ");
	var capacity:Number = 0;
	if(x >= 0) capacity = pc.vaginalCapacity(x);
	else capacity = pc.analCapacity();
	//if tight:
	if(capacity < 150) output("torn apart");
	else if(capacity < 350) output("stretched to the absolute limit");
	//elseif Treated Bimbo:
	else if(pc.isTreated() && pc.isBimbo()) output("fucked by a big, hung New Texan bull");
	//if Kiro-sized cocksleeve:
	else output("used the way your well-stretched hole was meant to be");
	output("! Renvra’s movements are unyielding, refusing to accept anything less than fully burying her monstrously-large member in your ");
	if(x >= 0) output("cunt");
	else output("asshole");
	output(". Your belly stretches to accommodate it, distending into a cock-shaped bulge by the time her egg-laden balls slap against ");
	if(pc.balls == 0) output("your behind");
	else if(pc.balls == 1) output("your own churning orb");
	else output("your own churning orbs");
	output(".");
	if(x >= 0) pc.cuntChange(x,400,true,true,false);
	else pc.buttChange(400);
	clearMenu();
	addButton(0,"Next",getRenvraFuckedPart2);
}

public function getRenvraFuckedPart2():void
{
	clearOutput();
	showRenvra();
	var x:int = -1;
	if(pc.hasVagina()) x = pc.findEmptyPregnancySlot();
	//if Bimbo:
	if(pc.isBimbo()) 
	{
		output("<i>“Oh, yeah! Fuck me!”</i> you moan, wiggling happily around Renvra’s ");
		if(x >= 0) output("pussy-");
		else output("ass-");
		output("straining dick. That’s the stuff!");
	}
	//else:
	else output("<i>“Oh, fuck,”</i> you manage to grunt out, the first coherent thought you’ve put together since the first inches of her girthy cock speared you.");

	output("\n\n<i>“That’s the plan,”</i> your lover sneers, adjusting her grip up to your [pc.hips] and starting to move again. She drags herself out slowly, but her sheer length only allows her a fraction of its length without having to step back with it. Rather than shift her stance, Ren seems content to pound you in short, forceful thrusts. Her hips hammer against your [pc.butt], making the cheap metal desk supporting your weight shift forward with the impact. Between that and all the drug-laden pre her alien cock is pumping into you, filling your body with burning desire, you don’t have a snowball’s chance to hold back. You scream, a wail of absolute and unrepentant pleasure as you’re hammered into the climactic throes of orgasm.");

	if(pc.hasCock())
	{
		output("\n\n[pc.EachCock] throbs and lets loose, spraying a jet of [pc.cumNoun] onto the floor and the front of Ren’s desk. One of Renvra’s hands reaches down to grab your spasming rod, pumping your cock through your climax. Between her slick, chitinous hand and the feeling of her titanic erection stretching your ");
		if(x >= 0) output("pussy");
		else output("ass");
		output(", you’re left limp and moaning, putty in the halfbreed’s hands. Even after your orgasm abates, nothing more than a trickle of spunk drooling from your [pc.cockHeads], she continues to fuck you.");

	}
	output("\n\nRenvra’s both insatiable and unrelenting, plowing through your orgasm without a moment’s hesitation. The sounds of flesh slapping, hard and wet, echo deafeningly throughout the office. The only other sound you can focus on is the tensing breath of your halfbreed lover, growing more and more ragged as she pounds your ");
	if(x >= 0) output("[pc.vagina " + x + "]");
	else output("[pc.asshole]");
	output(". Your instincts scream out in preparation for her nearing climax.");
	processTime(6);
	pc.orgasm();

	//if the PC is either preggers already, hasn’t talked about kids with Ren, or doesn’t have a cunt:
	if((x >= 0 && pc.isPregnant(x)) || flags["RENVRA_KIDS_TALK"] == undefined || x < 0)
	{
		//This should end the scene
		getEggsInShit(x);
	}
	//if PC has a cunt, not already pregnant, AND talked to Renvra about kids before: 
	else
	{
		output("\n\nBetween ass-rattling thrusts, Renvra manages to grunt out <i>“You want this, spacer? A belly full of seed?”</i>");
		output("\n\nFlashing you a wicked smile, she leans in close, near enough that you can feel her breasts against your back, and her breath hot on your [pc.ear]. <i>“I do. I wanna see your belly bulging with my spawn... spreading them across the stars...”</i>");
		clearMenu();
		//[Take Spunk]
		addButton(0,"Take Spunk",takeAShotOJizzInZeWomb,x,"Take Spunk","Take a load of Renvra’s aphrodisiac-laden semen right in the womb.");
		//[Take Eggs]
		addButton(1,"Take Eggs",takeSomeEggs,x,"Take Eggs","Tell Ren to pump you full of eggs instead. They’re <i>probably</i> not fertilized...");
	}
}

public function getEggsInShit(x:int = -1):void
{
	output("\n\n<i>“Brace yourself,”</i> Renvra grunts through clenched teeth, battering the growing swell of her knot against your ");
	if(x >= 0) output("[pc.vagina " + x + "]");
	else output("[pc.asshole]");
	output(". Oh, shit....");
	output("\n\nYou dig your fingers into the desk, biting your lip almost hard enough to draw blood as the knotty ovipositor slams against your clenching hole, demanding entrance. Another thrust has your ");
	if(x >= 0) output("[pc.vagina " + x + "]");
	else output("[pc.asshole]");
	output(" stretching wide, sucking up the knot to the halfway point... and then swallowing its whole, massive girth.");

	output("\n\nYou can’t bring yourself to scream this time. Your eyes just go wide, and your body flops limply on the desk, ragdoll-like as the huge knot penetrates you. The bitch-breaking bulge feels like it’s the size of a coconut, and is just as hard as it slides through your well-lubed passage.");
	output("\n\nSomething else hits you a moment later, stretching the already tremendous girth of cockflesh inside you even more. The lump rolls through Renvra’s shaft, ushered out by a thick stream of wetness that squirts from her flared crown into your thoroughly-fucked hole. You try to squirm, to move back against the knotted shaft, even to speak -- but your body refuses every command, completely overwhelmed by lust-drug and pleasure. All you can do is lay limp and take Renvra’s eggs.");
	output("\n\nYour lover moans as the first egg squirts out of her equine-shaped ovipositor and into your ");
	if(x < 0) output("bowels");
	else output("womb");
	output(", quickly following it with another squirt of aphrodisiacs and, a few jerky thrusts later, the second egg.");

	output("\n\n<i>“Fuck yeah. Take ‘em, slut,”</i> Ren grunts, slapping her hips against your ass. Her now-flaccid balls tease your thighs, dangling emptily now that her eggs have shot into you. She’s breathing hard now, fingers digging painfully into your waist. As the second of the two eggs settles inside you, Ren gives an exhausted grunt and flops down on top of you, her heavy breasts pressing into your back.");
	if(pc.hasCock()) output(" The hand that had been locked around your cock slips off, coming to rest on your [pc.butt].");

	output("\n\n<i>“Not... not bad,”</i> she murmurs, still trying to catch her breath. <i>“Now if only all you spacers were such ");
	if(pc.isBimbo()) output("eager");
	else output("willing");
	output(" cocksleeves... we might really get somewhere.”</i>");

	output("\n\nYou try to chuckle, but only succeed in shifting the alien eggs inside you around. You put a hand on your belly and groan.");

	output("\n\nRenvra pats your [pc.butt] and shifts most of her weight up onto the desk. <i>“Don’t worry, they’ll dissolve in a little while. Unless that nyrea-boy I found the other day managed to fertilize them, that is...");
	//if talked about kids before:
	if(flags["RENVRA_SEXED"] == undefined) output(" If that happens, well... I have to admit, there’s something a little </i>exciting<i> about spreading my get to the stars,”</i> she laughs. As if to emphasize her point, the knot straining your hole throbs mightily.");
	else output(".”</i>");

	output("\n\nAfter a few pleasurable minutes of being tied tightly together, Ren’s bitch-breaker finally deflates enough to allow her to slip out of you. She does so with a moan, and unleashes of a torrent of pent-up pink spooge in the process that floods down onto the concrete floor. The eggs, sealed in by all that drying spunk, stay nice and tight where their owner left them.");
	output("\n\n<i>“Yuck,”</i> Ren sneers, patting your behind affectionately and taking a wide step around the puddle to grab a towel from a drawer nearby. You watch her clean up, drying off her dick and thighs before turning her attention to you. It’s hard not to wince as the warrior woman leans back into your abused backside, but she’s surprisingly tender as she wipes away the mess she’s made of you.");
	output("\n\nWhen she’s satisfied, Ren tosses the towel into a waste bin and grabs her clothes. While she’s pulling on her shirt and searching for her belt, you stagger up to your [pc.feet] and rub your sore ");
	if(x >= 0) output("pussy");
	else output("butt");
	output(". For a warlike race of domineering ant-people, the myr sure are... exactly as rough in the sack as you might have expected, you suppose. You’re gonna be wobbling around for a while after that kind of fucking, especially with a couple of eggs shifting around in your now-bulging ");
	if(x >= 0) output("womb");
	else output("belly");
	output(".");

	output("\n\n<i>“Well, I think that’s a long enough smoke break,”</i> Renvra says, flashing you a slight grin over her shoulders as she pulls her pants up and works at her belt. It looks like a herculean effort to shove that much cock back into such tight pants. ");

	output("\n\nAs you gather your [pc.gear], Ren steps over to you, grabbing your chin and pulling you up to look her in the eye. <i>“Let’s do this again,”</i> she says, quickly pressing her lips to yours. <i>“I’ve had much worse distractions.”</i>");

	output("\n\nHigh praise, coming from her.");
	output("\n\nRenvra releases you and turns on a heel towards the door. Finishing with your own gear, you follow her back out to the trading post’s main floor.");

	//There’s a 10% chance that the PC’s going to get fertilized nyrea eggs. See Pregshit, below. 
	if (x >= 0) pc.loadInCunt(renvra, x);
	else pc.loadInAss(renvra);
	
	pc.orgasm();
	renvra.orgasm();
	
	processTime(14);
	flags["RENVRA_SEXED"] = 1;
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Take Spunk]
//Take a load of Renvra’s aphrodisiac-laden semen right in the womb. 
public function takeAShotOJizzInZeWomb(x:int = -1):void
{
	clearOutput();
	showRenvra();
	output("<i>“That’s what I like to hear!”</i> Renvra growls, shifting her stance back slightly, bringing her nyrean knot away from the lips of your cunt. <i>“Just lie back and relax, spacer. I’ll get you nice and full of my young...”</i>");

	output("\n\nOn the cusp of responding, you find yourself being hauled up by Renvra’s startlingly strong arms. She hefts you up and flips you onto your back, letting your [pc.legOrLegs] wrap around her. She kisses you, pulling you tight as you feel the contractions of her hefty member start, and the flood of pink, creamy pre growing thicker inside your stretched-out hole.");
	output("\n\n<i>“Here we go,”</i> she moans, speaking in perfect cadence with her thrusts. <i>“Get ready!”</i>");
	output("\n\nYou’re as ready as you’re going to be, and tell her as much with another orgasmic scream, letting your body carry you to the peaks of pleasure as its filled with a sudden, massive load of aphrodisiacs. Every touch seems to send you shivering and screaming to climax again, and Renvra’s pounding thrusts make your whole body feel as sensitive as [pc.oneClit], awash in sensation. Your hands instinctively go to your [pc.belly], wandering across the taut flesh there as you’re filled with your lover’s wonderfully thick semen.");
	output("\n\nWhen she’s finally spent, Renvra gives a weak moan and falls forward, head collapsing into your [pc.chest]. You smile and run a hand through her spine-like hair, stroking her as her cock twitches and drools inside you.");
	output("\n\n<i>“There’s nothing in the world like that,”</i> Ren finally manages to say, reaching up to cup your [pc.breastNoun], fingers squeezing one of your [pc.nipples]. Slowly, she starts to withdraw from you, stepping back to pull the huge length of her ovicock from your slit. She does so with a moan, and unleashes of a torrent of pent-up pink spooge in the process that floods down onto the concrete floor. Still, you can feel more than enough of her lust-riddled spunk sloshing around deep inside you that you’re sure her swimmers have a fair chance of reaching their goal.");
	output("\n\n<i>“Yuck,”</i> Ren sneers, patting your thigh affectionately and taking a wide step around the puddle to grab a towel from a drawer nearby. You watch her clean up, drying off her dick and thighs before turning her attention to you. It’s hard not to wince as the warrior woman leans back into your abused sex, but she’s surprisingly tender as she wipes away the mess she’s made of you.");
	output("\n\nWhen she’s satisfied, Ren tosses the towel into a waste bin and grabs her clothes. While she’s pulling on her shirt and searching for her belt, you stagger up to your [pc.feet] and rub your sore ");
	if(x >= 0) output("pussy");
	else output("butt");
	output(". For a warlike race of domineering ant-people, the myr sure are... exactly as rough in the sack as you might have expected, you suppose. You’re gonna be wobbling around for a while after that kind of fucking... and you’re sure if she has her way, you’ll be waddling with a swollen belly full of her offspring before long.");
	output("\n\n<i>“Well, I think that’s a long enough smoke break,”</i> Renvra says, flashing you a slight grin over her shoulders as she pulls her pants up and works at her belt. It looks like a herculean effort to shove that much cock back into such tight pants.");
	output("\n\nAs you gather your [pc.gear], Ren steps over to you, grabbing your chin and pulling you up to look her in the eye. <i>“Let’s do this again,”</i> she says, quickly pressing her lips to yours. <i>“Especially when you’ve birthed this clutch for me... I’ve got plenty more for you.”</i>");
	output("\n\nRenvra releases you and turns on a heel towards the door. Finishing with your own gear, you follow her back out to the trading post’s main floor.");

	renvra.impregnationType = "RenvraFullPregnancy";
	if (x >= 0) pc.loadInCunt(renvra, x);
	else pc.loadInAss(renvra);
	renvra.impregnationType = "RenvraEggPregnancy";
	
	pc.orgasm();
	renvra.orgasm();
	
	processTime(10);
	pc.lust(15);
	flags["RENVRA_SEXED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Take Eggs]
//Tell Ren to pump you full of eggs instead. They’re <i>probably</i> not fertilized...
public function takeSomeEggs(x:int = -1):void
{
	clearOutput();
	showRenvra();
	output("You desperately shake your head. You’re not to keen on the idea of playing mother to Ren’s offspring just now!");
	output("\n\nShe grunts, but nods. <i>“Fine. I won’t force it on you. More than enough myr clamouring for my spunk as it is. But you’re getting a bellyful of my eggs, though. Consider it a tax for getting my hopes up.”</i>");
	output("\n\nFair trade, you suppose....");
	//Go to egg-laying scene, above.
	getEggsInShit(x);
}

//Buttfuck Her
//Flop Renvra’s oversized cock out of the way and sink your dick in her tight ass. 
public function buttFuckRenvra():void
{
	clearOutput();
	showRenvra();
	output("You answer Ren’s unsubtle question by wrapping your hands under her firm ass and pulling her off the ground. She gasps and laughs, her legs wrapping around your waist and arms around your neck. An unsteady step takes the two of you up against a wall, pressing Renvra’s back against it. She moans as your mouth finds one of her rosy nipples, and her back arches into your embraces as you lick and kiss and gently suckle. After a few moments of that treatment, you start to feel a trickle of a candy-sweet moisture beading from her teat, and you’re eager to drink it down. It tastes wonderful!");
	output("\n\n<i>“You’re lucky I’m not like other reds,”</i> Renvra laughs, stroking your [pc.hair] while you suckle from her. <i>“Most would punch you right in the face for that...”</i>");
	output("\n\nShe rolls her eyes when you look up at her -- a strange sight with round, pitch-black eyes like hers. You answer her exasperated gesture by switching from one breast to the other, greedily suckling the halfbreed’s sweet nectar just as fast as you can get it. The more your [pc.tongue] teases her teats, though, the more urgently you can feel the huge slab of ovipositing meat between her legs throb. A trickle of hot, creamy pink pre drools down your [pc.leg], leaking from the halfbreed’s apple-sized gonads and through her pony-sized pecker. You shift slightly, hefting Renvra’s weight up onto the edge of her desk, and grab her cock by the shaft.");
	output("\n\nThough it’s a bit awkward from your current positions, you heft her dick up from dangling between her legs, and flop its shaft onto her belly. The crown settles perfectly into the valley of her cleavage, and happily spurts a little dribble of pink pre onto her tits. Putting on a bit of a show, Renvra moves her shoulders in a way that squeezes her tits together around her cock, giving herself an impromptu titfuck as your attentions move downward.");
	output("\n\nWith her weight settled on the desk, your hands are free to cup and squeeze Renvra’s tight ass, caressing the muscular curve of it until your wandering ministrations reach the gulf between her legs. You cup her pseudo-balls, letting two egg-filled sacs roll between your fingers. Gently, you lift them up and out of the way, revealing the small, dark ring of Ren’s asshole. Seeing its target, your own [pc.cock] jumps to attention, and a few tentative strokes bring it to full hardness. Ren’s legs tense around your waist, pulling you a little closer until your [pc.cockHead] is pressed flush against her backdoor.");
	output("\n\n<i>“Hold on a second, spacer,”</i> she growls, just as you’re getting ready to take the plunge. Her chitinous hand leaves your shoulder, just long enough to wipe her fingers across the flared head of her over-sized equine ovipositor, wiping up some of the creamy pink aphrodisiac leaking from her X-shaped slit. You shiver as she smears the warm, dark fluid across the crown of your cock, and the sudden rush of pleasure sets your nerves ablaze.");
	output("\n\n<i>“A little aphrodisiac lube,”</i> she chuckles. <i>“Courtesy of my myr half.”</i>");
	output("\n\nKinky. And very, very pleasant, too. Your heartbeat quickens as the venomous cum seeps into you, filling you with chemical lust right at the very source. With a treatment like that, there’s no holding back from easing your [pc.hips] forward and thrusting into Renvra’s ass.");
	output("\n\n<i>“Gah!”</i> she gasps as your [pc.cockHead] spears her hole. <i>“Fuck, fuck fuck... oh, I never get used to that...”</i>");
	output("\n\nSqueezing her breast, you remind Ren that she volunteered for this. She laughs, rolling her head back and moaning like an animal while you sink your prick into her. It’s slow going thanks to her tightness, inch after agonizing inch making her moan and groan. More than once, trickles of her motherly bounty spurt from her red teats of their own accord, and her own cock throbs powerfully between her breasts, spewing a sizable lake of pre into her cleavage before you’re ");
	if(pc.cockVolume(0) < 300) output("hilted in her");
	else output("as deep as your own monstrous member will allow you to go");
	output(".");
	pc.cockChange();

	output("\n\nRenvra’s breathing hard, and her back slumps heavily against the wall behind the desk. <i>“Agh. Fuck that’s... that’s tight. I’ll never understand how normal girls take these things.”</i>");

	output("\n\nYou both ");
	if(silly) output("have a bit of a giggle");
	else output("laugh");
	output(" at that, letting Ren spend a few necessary moments adjusting to your girth inside her. For the time being, you’re content to enjoy the feeling of her muscular anal walls clenching around your shaft, inadvertently massaging you as they try to repulse your advance. You feel like you could cum easily just from that, the raw tightness and heat of Renvra’s asshole.");

	output("\n\nAfter a while, Ren leans back against the wall and gives you a slight nod. <i>“Alright... go ahead. I’m as ready as I’m going to be.”</i>");

	output("\n\n");
	if(pc.isNice()) output("You lean and give her a reassuring kiss -- one she’s more than happy to reciprocate as you start to move your hips");
	else output("You dig your hands into Ren’s slender hips and start to withdraw from her");
	output(". Her legs cling tightly to you as you pull out, slowly but surely, to the tip before gliding back in again. It’s easier going the second time, thanks to the slimy trail of pink lust-cum and a little extra looseness you’ve ensured in her.");

	output("\n\nAfter a few thrusts, you’re able to settle into a comfortable, if leisurely, pace of fucking. The strain fades from Renvra’s voice, replaced by little moans of pleasure. Her tongue lolls out of her mouth, lapping at the creamy lake forming between her breasts, slurping up her own aphrodisiacs. You’re not sure if she just gets off on it, or if she’s as susceptible to her own venomous spunk as you are. Either way, slurps up a mouthful of it, then pulls you in for a kiss, snowballing the creamy pink slime to you. You accept the gift without thinking, and instantly feel the pleasurable burn of the chemicals working their way into your body, even before you swallow. Hilting yourself in Renvra, you push her flush against the wall and kiss her again, letting your hands roam across her breasts, the shaft of her cock, to the swelling knot at its base.");

	output("\n\nThe moment your fingers wrap around Ren’s bitch-breaker, she throws her head back with a primal cry of pleasure. A few vigorous strokes keeps her moaning, and sets off a chain reaction through her body that ends with her heavy balls throbbing against the shaft of your prick and a jet of pink cream spraying up from her thick ovicock, blasting Renvra straight in the chin and raining down on her tits.");
	output("\n\n<i>“Gah! Fuck!”</i> she shouts, fingers clutching at your shoulders as she cums. <i>“Stroke it! Strokeitstrokeitstrokeit.”</i>");
	output("\n\nYou do as you’re bid, massaging the turgid knot and pumping her equine-like shaft. In turn, Renvra’s ass clenches hard around your thrusting [pc.cock], desperately trying to milk the cum from you. With the sight of Ren creaming herself to urge you on, it’s an attempt you’re quite willing to accommodate. You hook your hands under her legs and ram yourself home in her, letting yourself go utterly under her anal ministrations.");
	output("\n\nRen sucks in a sharp breath as the first gouts of [pc.cumNoun] spray into her");
	if (pc.hasKnot()) output(", spurred on by the sudden impact of your [pc.knot] pounding her wide open, tying the two of you together");
	output(". Short, frantic thrusts bring you deeper into her, working out every drop of spooge you can fill her with. By the time you’re done, Renvra’s left panting against the wall, her hands cradling the throbbing shaft of her deflating cock against her belly. She’s a mess of her own pink spunk, smearing across her chest and shoulders and dripping down onto her desk.");
	output("\n\n<i>“What a mess,”</i> she laughs, rolling her head back and closing her eyes. A plated finger flicks through the pink cream on one of her tits, bringing it up to her mouth to be cleaned off. After a moment’s enjoyment of her own taste, Ren reaches into a shelf nearby, pulls out a fairly thick towel, and begins to clean herself off -- even as you’re still ");
	if(pc.cockVolume(0) < 300) output("buried");
	else output("knotted");
	output(" inside her.");

	output("\n\n");
	if(pc.hasKnot(0)) output("You’ve not much choice but to stay there while she cleans up while your [pc.knot] slowly deflates. By the time you’re able to extricate yourself from Renvra’s tight ass, she’s as clean as she’s liable to get without a shower - you can still see a few errant traces of pink spooge clinging to her pale skin, and beads of nectar still stand at the tips of her crimson teats. Even so, she gives you a surprisingly playful push off and picks up her shirt, starting to button it up.");
	else 
	{
		output("\n\nYou slip yourself out of Renvra’s ass, nice and slow.");
		if(pc.cumQ() < 20) output(" You enjoy the sight of her hole gaped in your wake, though your [pc.cum] isn't the least bit visible.");
		else if(pc.cumQ() < 75) output(" The moment you part, though, you're treated to the sight of her [pc.cum]-glazed rectum, gleaming in the light.");
		else if(pc.cumQ() < 150) output(" The moment you part, though, you're treated to the sight of a stream of your [pc.cum] running down her leg, her insides thoroughly coated in it.");
		else if(pc.cumQ() < 500) output(" The moment you part, though, you're treated to the sight of a few streams of [pc.cum] pouring down her legs, the rest of it puddled in her gaped-out hole.")
		else if(pc.cumQ() < 1000) output(" The moment you part, though, you’re treated to a veritable waterfull of your seed racing out after you, splattering onto the floor.");
		output("\n\n<i>“Ugh,”</i> Renvra groans, finishing with her own load before flicking the towel down between her legs to clean up your mess as well. When she’s done, she tosses the towel into a waste basket with a contemptuous grunt and picks up her shirt, careful to avoid the puddle of spunk you’ve left on the floor. As she gets dressed, you hear her muttering about getting her trench wives to clean it up later.");
	}
	//{Combine}
	output("\n\n<i>“Well, I think that’s a long enough smoke break,”</i> Renvra says, flashing you a slight grin over her shoulders as she pulls her pants up and works at her belt. It looks like a herculean effort to shove that much cock back into such tight pants.");
	output("\n\nAs you gather your [pc.gear], Ren steps over to you, grabbing your chin and pulling you up to look her in the eye. <i>“Let’s do this again,”</i> she says, quickly pressing her lips to yours. <i>“I’ve had much worse distractions.”</i>");
	output("\n\nHigh praise, coming from her. ");
	output("\n\nRenvra releases you and turns on a heel towards the door. Finishing with your own gear, you follow her back out to the trading post’s main floor.");
	processTime(23);
	if(pc.hasKnot(0)) processTime(20);
	pc.orgasm();
	flags["RENVRA_SEXED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function renvraEggnancyEnds(pregSlot:int):void
{
	clearOutput();
	author("Savin");
	
	var pData:PregnancyData = (pc.pregnancyData[pregSlot] as PregnancyData);
	
	output("You feel a rumble in your gut, strong enough to make you nearly double over. Oh, God.... Your hands grab your gut, and instantly feel something shifting just under your gravid flesh. The eggs inside you are moving, straining against your gut in a desperate bid to escape. With a panicked cry, you slump down to the ground and strip off your [pc.gear]. A distinct wetness pools out of your");
	if (pregSlot == 3) output(" [pc.asshole]");
	else output(" [pc.cunt]");
	output(" the moment you've gotten your gear out of the way. Your back arches as pleasure washes over you, brought on by the first egg starting its lengthy journey out of your");
	if (pregSlot == 3) output(" bowels");
	else output(" womb");
	output(".");

	output("\n\nYou curl up and spread your [pc.legOrLegs], giving your young charges as easy an access to the open air as you can. All there is to do after that is sit back and push. Your body convulses, the strange sensation of stretching pleasure overwhelming your senses.");
	if (pc.hasCock() || pc.hasVagina()) output(" You instinctively begin masturbating, unable to resist the alien pleasure.");
	else output(" You futilely rub at your over-sensitive groin, trying to coax some relief from your bare crotch.");
	output(" The first egg starts pushing through you, slowly but surely reaching");
	if (pregSlot == 3) output(" your [pc.asshole]");
	else output(" the lips of your pussy");
	output(". The stretch is incredible, ");
	
	var tGape:Number;
	
	if (pregSlot == 3) tGape = pc.ass.looseness();
	else tGape = pc.vaginas[pregSlot].looseness();
	
	if (tGape < 5)
	{
		output(" forcing you to push like you've never pushed before to squeeze the egg through the");
		if (pregSlot == 3) output(" ring of your ass");
		else output(" lips of your cunt");
	}
	else
	{
		output(" but nothing you can't handle with your incredibly well-loosened hole");
	}
	output(". The egg squeezes out with a wet “POP,” rolling out of you and onto the ground in a pool of pink nyrean fluids.");
	
	output("\n\nYou shiver as you lay the first egg of the clutch, dropping the egg down");
	if(pc.legCount > 1) output(" between");
	output(" your [pc.legOrLegs]. You sigh in relief, your belly noticeably shrunken. But it's not empty yet, and you soon feel another shift in your swollen gut.");
	if (pData.pregnancyQuantity == 2) output(" The");
	else output(" A");
	output(" second egg begins its descent, refusing to let you recover after the first. Your");
	if (pregSlot == 3) output(" ass");
	else output(" sex");
	output(" spasms and quivers as the next egg moves, and you grunt and push it out, letting the soon-to-be born nyrea join its sibling.");
	if (pData.pregnancyQuantity == 3) output(" Another egg follows");
	else if (pData.pregnancyQuantity > 3) output(" More eggs follow");
	if (pData.pregnancyQuantity >= 3) output(", sliding out of you easily compared to the first."); 

	output("\n\nYou spend minutes laying your nyrean eggs, dropping a clutch of "+ num2Text(pData.pregnancyQuantity) +" total eggs. When the final egg pops out, you flop onto your back, breathing hard. That took damn near everything out of you, and you find yourself nearly passing out after your ordeal. Before you do, however, you realize that you'll probably need to do... something about this clutch of eggs. You tap on your Codex and review the nyreas' entry. They'll be helpless for several weeks, so you can't exactly leave them here. You flip over to your comms and call in a pickup for the eggs -- thank God that Dad left you that nursery back on Tavros. A drone arrives a few minutes later, collects the eggs, and hands you a receipt before carting them back home.");

	output("\n\n<b>"+ pData.pregnancyQuantity +" nyrea will soon be waiting for you back at the nursery.</b>");

	if (pData.pregnancyType == "RenvraEggPregnancy")
	{
		output("\n\nAt least, they're three-quarters nyrea.");
		if (silly || pc.isMischievous()) output(" Close enough for government work, right?");
	}
	
	processTime(30);
}

public function renvraMessageHandler():void
{
	if (pc.hasStatusEffect("Renvra Full Pregnancy Almost Due"))
	{
		renvraAlmostDue();
		pc.removeStatusEffect("Renvra Full Pregnancy Almost Due");
	}
	if (pc.hasStatusEffect("Renvra Full Pregnancy Message 5"))
	{
		renvraPregnancyMessage5();
		pc.removeStatusEffect("Renvra Full Pregnancy Message 5");
	}
	else if (pc.hasStatusEffect("Renvra Full Pregnancy Message 4"))
	{
		renvraPregnancyMessage4();
		pc.removeStatusEffect("Renvra Full Pregnancy Message 4");
	}
	else if (pc.hasStatusEffect("Renvra Full Pregnancy Message 3"))
	{
		renvraPregnancyMessage3();
		pc.removeStatusEffect("Renvra Full Pregnancy Message 3");
	}
	else if (pc.hasStatusEffect("Renvra Full Pregnancy Message 2"))
	{
		eventQueue.push(renvraPregnancyMessage2);
		pc.removeStatusEffect("Renvra Full Pregnancy Message 2");
	}
	else if (pc.hasStatusEffect("Renvra Full Pregnancy Message 1") && hours < 9 && (rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) || rooms[currentLocation].hasFlag(GLOBAL.INDOOR)))
	{
		eventQueue.push(renvraPregnancyMessage1);
		pc.removeStatusEffect("Renvra Full Pregnancy Message 1");
	}
	else if (pc.hasStatusEffect("Renvra Milky Titties Go"))
	{
		if (flags["Supress Renvra Milky Titties"] == undefined && (!pc.canLactate() || pc.milkRate < 10 || pc.biggestTitSize() <= 1))
		{
			flags["Supress Renvra Milky Titties"] = rand(6) + 2;
			eventQueue.push(renvraMilkyTittiesGo);
		}
		else
		{
			if (flags["Supress Renvra Milky Titties"] > 0)
			{
				flags["Supress Renvra Milky Titties"]--;
			}
			else
			{
				flags["Supress Renvra Milky Titties"] = undefined;
			}
		}
	}
	
	if (pc.hasStatusEffect("Renvra Full Pregnancy Bellyrubs"))
	{
		renvraBellyrubs();
	}
}

public function renvraAlmostDue():void
{
	eventBuffer += "\n\nYou note that your swollen belly is shifting awkwardly, and you're starting to feel very... wet. Your motherly instincts tell you that you'll be giving birth very, very soon. ";
}

public function renvraBellyrubs():void
{
	if (flags["Renvra Full Pregnancy Bellyrub Supression"] == undefined) flags["Renvra Full Pregnancy Bellyrub Supression"] = 0;
	
	if (flags["Renvra Full Pregnancy Bellyrub Supression"] < days && rand(100) < 2)
	{	
		flags["Renvra Full Pregnancy Bellyrub Supression"] = days;
		
		if (InPublicSpace() && (kGAMECLASS.hours > 4 && kGAMECLASS.hours < 22))
		{
			eventBuffer += "\n\nAs you walk through town, people occasionally walk up to you, asking to feel your belly or how far along you are. You don't have the heart to tell them you're full of alien eggs.";
			if (pc.isBimbo() || pc.isTreated() || pc.race().indexOf("ausar") != -1 || pc.race().indexOf("kaithrit") != -1) eventBuffer += " Besides, people rubbing all over you feels super good!";
		}
		else
		{
			eventBuffer += "\n\nYou stop yourself, seemingly at random, and plant a hand soothingly over your [pc.belly]. Your children inside you shift slightly, making your";
			if (pc.statusEffectv1("Renvra Full Pregnancy Bellyrubs") == 3) eventBuffer += " stomach rumble";
			else eventBuffer += " belly tremble";
			eventBuffer += ". It's surprisingly nice to just rub your belly, enjoying the fullness of it."
		}
	}
}

public function renvraPregnancyMessage1():void
{
	clearOutput();
	author("Savin");
	
	output("You feel... ill. You slump against a nearby wall, clutching at your [pc.belly]. Ugh, what the...");

	output("\n\nYou double over and puke, hucking your lunch all over the ground. You spend several minutes hurling before you're able to stand. Geez, shouldn't your nanomachines be able to keep you from getting just a little cold or something?");
	
	processTime(10);
	
	addNextButton(mainGameMenu);
}

public function renvraPregnancyMessage2():void
{
	clearOutput();
	author("Savin");
	
	output("You're not even surprised when you end up puking today.");

	output("\n\nYou don't feel <i>bad</i>, per se. But something's fucking wrong. That's for sure.");

	output("\n\nWith a groan, you slump against the wall and pull out your Codex. A few moments of scanning, extranet searching, and cursing pretty much solidifies in your mind: you're pregnant. With a clutch of part-myr, part-nyrea, and part-human as well. Well look at you, Daddy's " + pc.mf("boy","girl") + "! He sure would be proud you're well on your way to leaving your trail of galactic bastards just like your old man.");
	
	processTime(10);
	
	addNextButton(mainGameMenu);
}

public function renvraPregnancyMessage3():void
{
	eventBuffer += "\n\nYour belly is bulging slightly, the first visible signs of pregnancy. Your halfbreed spawn seem to be behaving... not that differently from human offspring so far. At least you're not getting horribly sick in the mornings anymore!";	
}

public function renvraPregnancyMessage4():void
{
	eventBuffer += "\n\nYou're really starting to show, now. Anybody who looks your way can see you're obviously pregnant, and you've had to adjust your [pc.gear] to make room for your bloated gut. Every so often, you feel a slight movement under your [pc.skinFurScales] as your growing young shift or move. Occasionally, you could swear you feel them kick!\n\nFrom time to time, you find your hands wandering down to your belly, idly caressing your swollen form.";
}

public function renvraPregnancyMessage5():void
{
	eventBuffer += "\n\nYou find your hands wandering to your belly more and more -- as much to support the growing weight you're bearing as to caress the home of your unborn children.\n\nYou're so heavily showing now that you can't go much of anywhere without people staring. It won't be long now... maybe just a few weeks more!";
}

public function renvraMilkyTittiesGo():void
{
	var tBoobies:Boolean = false;
	var tMilky:Boolean = false;
	
	if (pc.biggestTitSize() <= 1)
	{
		pc.breastRows[0].breastRatingRaw += rand(3) + 1;
		tBoobies = true;
	}
	
	if (!pc.canLactate())
	{
		tMilky = true;
		
		pc.milkMultiplier = 75;
		pc.milkFullness = 75;
		
		if (pc.milkRate < 10)
		{
			pc.milkRate = 10;
		}
	}
	
	if (tBoobies == false && tMilky == false && pc.milkRate < 10)
	{
		pc.milkRate = 10;
		
		eventBuffer += "\n\nYour breasts are starting to feel a little heavier as your body prepares for its coming young. While you're already lactating, your rate of production seems to be increasing in preparation.";
	}
	else
	{
		eventBuffer += "\n\nYou notice that your [pc.chest] is starting to grow, swelling with the beginnings of milk production. You find someplace quiet and pull your gear off, cupping your";
		if (tBoobies) eventBuffer += " freshly engorged";
		eventBuffer += " breasts and squeezing out a trickle of [pc.milk] from your teat.\n\n<b>It appears you're lactating now!</b>";
	}
}

public function renvraFullPregnancyEnds(pregSlot:int):void
{
	var pData:PregnancyData = pc.pregnancyData[pregSlot];
	var cpData:PregnancyData = new PregnancyData();
	cpData.loadSaveObject(pData.getSaveObject());
	
	clearOutput();
	author("Savin");
	
	if (InPublicSpace() || currentLocation == "SHIP INTERIOR")
	{
		output("You feel a rumble in your gut, strong enough to make you nearly double over. Oh, God.... ");

		output("\n\nYour hands grab your gut, and instantly feel something shifting just under your gravid flesh. The children inside you are moving, straining against your gut in a desperate bid to escape. With a panicked cry, you feel your water break, a flood of wetness splashing down your thighs as your offspring get ready to come into the world!");

		output("\n\nShit!");

		output("\n\nYou");
		if (currentLocation != "SHIP INTERIOR") output(" grab your Codex and dial an emergency medical alert, summoning an ambulance from the nearest hospital");
		else output(" punch your ship to maximum LightDrive speed, and set a course for Tavros station. You've got just enough willpower left to forward an emergency medical alert to the dock, making sure an ambulance will be there when you arrive.");

		output("\n\nIt isn't long before you're in an ambulance, several V-KO droids looming over you as you're carted to a medical station. The last thing you see is a mask being placed over your face, and one of the droids telling you to be calm -- you'll be fine soon.");

		clearMenu();
		addButton(0, "Next", renvraFullPregnancyPublicII, cpData);
		return;
	}
	else
	{
		output("You feel a rumble in your gut, strong enough to make you nearly double over. Oh, God....");

		output("\n\nYour hands grab your gut, and instantly feel something shifting just under your gravid flesh. The children inside you are moving, straining against your gut in a desperate bid to escape. With a panicked cry, you slump down to the ground and strip off your [pc.gear]. You feel your water break, a flood of wetness splashing down your thighs as your offspring get ready to come into the world! Your back arches as pleasure washes over you, brought on by the first shifting mass of a body starting its lengthy journey out of your womb.");

		output("\n\nYou curl up and spread your [pc.legOrLegs], giving your young charges as easy an access to the open air as you can. All there is to do after that is sit back and push. Your body convulses, the strange sensation of stretching pleasure overwhelming your senses.");
		if (pc.hasVagina() || pc.hasCock()) output(" You instinctively begin masturbating, unable to resist the alien pleasure.");
		else output(" You futilely rub at your over-sensitive groin, trying to coax some relief from your bare crotch.");
		output(" The first child's crown starts pushing out of you, slowly but surely reaching the lips of your pussy. The stretch is incredible,");
		var tGape:Number;
		
		if (pregSlot == 3) tGape = pc.ass.looseness();
		else tGape = pc.vaginas[pregSlot].looseness();
		if (tGape < 5) output(" forcing you to push like you've never pushed before to squeeze the newborn through the lips of your cunt");
		else output(" but nothing you can't handle with your incredibly well-loosened hole");
		output(". After several minutes of screaming, grunting, and shouting... the first of your newborn children squeezes out with a wet “POP,” flopping out of you and onto the ground in a pool of pink nyrean fluids.");

		output("\n\nYou shiver as you give birth");
		if (pData.pregnancyQuantity == 1) output(" for the very first time");
		else output(" to the first of what must be even more children");
		output(", reaching down while you can and collecting the squalling newborn and bringing it to your breast. It cries out, thrashing its tiny, chitinous arms around until you bring its mouth to your [pc.nipple].");

		output("\n\nYou sigh in relief as your first young suckles. Your belly is noticeably shrunken");
		if (pData.pregnancyQuantity == 1) output(". You're left to recover from your... surprisingly pleasurable ordeal. You suppose if Renvra's seed is filled with aphrodisiacs, it's not entirely beyond the pale that your birthing fluids would be too. Weird, but it kept things from being painful, to say the least.");
		else
		{
			output(", but it's not empty yet, and you soon feel another shift in your swollen gut. The second of your young begins its descent, refusing to let you recover after the first. Your sex spasms and quivers as the next child follows its "+ (rand(10) == 0 ? "brother" : "sister ") +", and you grunt and push it out, letting the soon-to-be born nyrea join its sibling.");

			if (pData.pregnancyQuantity > 2)
			{
				output("\n\nAnother follows suit");
				if (pData.pregnancyQuantity > 3) output(", and another");
				output(". Before long you've got your arms completely full of crying, suckling nyrean babies. You thought these were supposed to come in eggs! Gah!");
			} 
		}

		output("\n\nAfter spending a good long while making sure each of your children is wrapped up and well-fed from your breast, you set them aside for a moment and pull out your Codex. You flip over to your comms and call in a pickup for the eggs -- thank God that Dad left you that nursery back on Tavros. A drone arrives a few minutes later, collects the newborns, and hands you a receipt before carting them back home.");

		output("\n\n<b>" + pData.pregnancyQuantity + " nyrea-myr-human hybrids will soon be waiting for you back at the nursery.</b> You're going to have to find a name for whatever race you've");
		if (StatTracking.getStat("pregnancy/renvra kids") == 0) output(" just created");
		else output(" just added to");
		output("!");
	}
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function renvraFullPregnancyPublicII(pData:PregnancyData):void
{
	clearOutput();
	author("Savin");
	
	output("<b>Hours pass...</b>");

	output("\n\nYou wake up in a sterile room, feeling very... light and empty, for the first time in months! You feel great, too! ");

	output("\n\nA local medical droid approaches when you've woken up, saying that you've recently given birth -- congratulations! You now have " + pData.pregnancyQuantity + " new child");
	if (pData.pregnancyQuantity > 1) output("ren");
	output(", who in accordance with your Emergency Medical Profile (when did you set <i>that</i> up?), have been delivered to Tavros Station's nursery.");

	if (pc.isBimbo()) output("\n\nAww, you don't even get to see them!?");

	output("\n\nYou dismiss the droid and grab your [pc.gear] from a nearby bin, taking the opportunity to get dressed. Whatever drug they gave you is powerful as hell, and you're more than able to walk out of the med station and return to your ship in a few minutes.");

	processTime(10);
	
	//Put PC back at ship tile.
	clearMenu();
	addButton(0, "Next", move, "SHIP INTERIOR");
}