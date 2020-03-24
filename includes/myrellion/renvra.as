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

public function showRenvra(nude:Boolean = false):void
{
	showName("\nRENVRA");
	if(nude) showBust("RENVRA_NUDE");
	else showBust("RENVRA");
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
		else if(pc.isBimbo()) output(".”</i> You’re starting to get the feeling she doesn’t like you very much. What a meanie....");
		else output(".”</i>");
		//+Lust 
		pc.changeLust(3);
	}
	else
	{
		output("You approach the gruff halfbreed quartermaster, coughing to get her attention. She rounds on you, hands firmly planted on her hips.\n\n<i>“What, spacer? Got something to sell off");
		if(flags["RENVRA_SEXED"] != undefined) output(" -- or were you hoping to browse the... back room inventory again");
		output("?”</i>");
	}
	renvraMenu();
}

public function renvraMenu():void
{
	clearMenu();
	if(pc.lust() >= 33) 
	{
		if(flags["RENVRA_RACE_TALK"] == 1) addButton(0,"Fuck Her",fuckHerYouNancy,0,"Fuck Her");
		else addDisabledButton(0,"Fuck Her","Fuck Her","You don’t know her well enough for that.");
	}
	else addDisabledButton(0,"Fuck Her","Fuck Her","You aren’t aroused enough for sex.");
	addButton(1,"Sell Items",sellItemsToRenvra);
	addButton(2,"Talk:Race",talkToRenvraAboutHerRaceBecauseSheIsBasicallyAnEndgameCoCCharacter,undefined,"Talk: Her Race","Ask Revnra about herself, and what exactly she is.");
	if(flags["RENVRA_SEXED"] != undefined) addButton(3,"Talk:HerSex",askRenvraAbootHerSex,undefined,"Talk: Her Sex","Ask Revnra about her biology in particular.");
	else addDisabledButton(3,"Talk:HerSex","Talk: Her Sex","You’ve got to get a little more up close and personal with her before asking about that.");
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
	if(flags["MET_NYREA_ALPHA"] != undefined || flags["MET_NYREA_BETA"] != undefined) output(" <i>“Especially since most of the ones I’ve seen so far have been pretty hostile.”</i>");

	output("\n\nRenvra plants her hands firmly on her hips. <i>“That right? There’s not a lot of nyrea in the Federation, but we’re here. The biggest nyrean cities are north and across the ocean, back in our home territory. It’s not like the lone huntresses and little villages you’ll see around here, but powerful matriarchs with harems bigger than an infantry company. When the Federation formed, some of the matriarchs wanted in on it. Smart enough to realize they’re going to survive a lot longer with us than against us.”</i>");
	output("\n\nIf that’s the case, you have to say, you’re surprised there aren’t more halfbreeds like Renvra running around.");
	output("\n\n<i>“Oh, there’s a damn good reason we’re so rare,”</i> Renvra answers with a predatory grin.");
	//if Codex: Nyrea unlocked: 
	if(CodexManager.entryViewed("Nyrea")) 
	{
		output(" Considering her mother’s ovipositor had barbs on it, it isn’t hard to imagine why.");
		output("\n\nRenvra laughs. <i>“Lucky for my sex life, I didn’t inherit the nice, comfortable ring of spikes on my dick.”</i>");
		//Fucked
		if(flags["RENVRA_SEXED"] != undefined)
		{
			output("\n\nYou chuckle and say that you’re happy Renvra’s spike-free. Makes her much easier to deal with.");
			output("\n\n<i>“Easy to deal with?”</i> she snorts. <i>“Why don’t we step out back find out how true that is?”</i>");
		}
		//if unfucked and codex unlocked: 
		else
		{
			output("\n\nYou have to admit, one of those huge, pussy-stretching nyrean cocks must be pretty popular without those intimidating -- if surprisingly soft and harmless -- barbs on the tip.\n\nRenvra gives you an amused look and shifts her weight, emphasizing the hefty package between her legs. <i>“You’d be right. And as it so happens, I’m overdue for a smoke break... if you want to see exactly what I’m packing, that is.”</i>");
			output("\n\nThe way she’s looking at you, the implication is anything but subtle. Looks like this horny halfbreed wouldn’t mind a roll in the proverbial hay afterall....");
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
			output("\n\nGlancing between her and her package, you ask if Renvra herself has spikes on her cock. You get an amused look from the halfbreed, and she shifts a bit to emphasize her bulge.");
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
	else addDisabledButton(0,"Fuck Her","Fuck Her","You aren’t aroused enough for sex.");
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
	showRenvra(true);
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
	// Combine:
	output("In the blink of an eye, Renvra’s uniform hangs limply from her shoulder, revealing the hefty swells of her F-cup breasts, each tipped with a rose-red nipple that stiffens under your gaze. She shrugs her shirt off, leaving herself with hands planted in her hips, black eyes wandering over your body. You slip off your [pc.gear] and go to her, pulling the halfbreed tight against yourself and grabbing one of her tits. Your fingers disappear into the startlingly soft boobflesh, a stark and pleasant contrast to the hardened woman they’re attached to. Renvra’s feelers twitch through her short hair, and her chitinous hands wrap around your waist. You gasp as her fingers brush your bare ass, squeezing your cheeks hard enough to make you groan.");

	output("\n\nThe moment your mouth is open, her lips are hot against yours, her tongue thrusting in between them. You melt into the surprise attack, squeezing Ren’s breasts and ass in turn, exploring every inch of her body until your hands find the loops of her belt. You yank it down with a single, rough motion, dropping her pants down around her ankles. More than a foot of thick, half-hard, horse-shaped ovipositor drops free between her legs. The thankfully spine-free flare of her ovicock throbs with anticipation, and its X-shaped slit glistens with a viscous pink moisture.");

	output("\n\nRen breaks the kiss a moment after you free her shaft, grinning ");
	if(pc.tallness >= 78) output("up ");
	else if(pc.tallness <= 66) output("down ");
	output(" at you.");
	if(renvra.cumQualityRaw >= 100)
	{
		output(" “<i>You still owe me a warm hole for this load of fertile eggs, spacer,</i>” she says seriously, stroking her massive prick.");
	}
	//if PC has a dick: 
	else if(pc.hasCock()) 
	{
		output(" <i>“So, what’s it going to be, spacer? Want a piece of my ass, or are you thinking about a");
		if(pc.hasVagina()) output(" pussy");
		else output("n ass");
		output(" full of this bad boy?”</i> she teases, stroking her massive prick.");
	}
	//elseif no dick:
	else output(" <i>“Ready to take this big bastard, spacer?”</i> she teases, stroking her massive prick.");

	pc.changeLust(20);
	processTime(4);
	clearMenu();
	if(pc.hasCock()) addButton(0,"FuckHerButt",buttFuckRenvra,undefined,"Buttfuck Her","Flop Renvra’s oversized cock out of the way and sink your dick in her tight ass.");
	else addDisabledButton(0,"FuckHerButt","Buttfuck Her","You need a penis to be able to put it in her butt.");
	addButton(1,"Bend Over",bendItLikeBeckhamForRenvra,undefined,"Bend Over","Bend over Renvra’s desk and let her fuck your [pc.vagOrAss] with her ovipositor-cock.");
	if((pc.hasCock() && pc.cockThatFits(renvra.cockCapacity(0)) >= 0) || pc.hasHardLightEquipped() || "PCHasDildo" == "9999") 
	{
		if(pc.hasCock() && pc.cockThatFits(renvra.cockCapacity(0)) >= 0) addButton(2,"Urethra Fuck",fuckRenvrasUrethra,undefined,"Urethra Fuck","Fuck Renvra by sticking your dick in her ovipositor’s slit. Cumming down her cock is likely to fertilize her eggs.");
		else if(pc.hasCock() && pc.cockThatFits(renvra.cockCapacity(0)) >= 0) addButton(2,"Urethra Fuck",fuckRenvrasUrethra,undefined,"Urethra Fuck","Diddle Renvra with your hardlight strap-on in her dick. She’s not liable to care about your lust once the sex toy gets her off, though.");
		else addButton(2,"Urethra Fuck",fuckRenvrasUrethra,undefined,"Urethra Fuck","Diddle Renvra with a dildo in her dick. She’s not liable to care about your lust once the sex toy gets her off, though.");
	}
	else if(pc.hasCock() && pc.cockThatFits(renvra.cockCapacity(0)) < 0) addDisabledButton(2,"Urethra Fuck","Urethra Fuck","Your cock is too big and you don’t own a suitable sex toy!");
	else addDisabledButton(2,"Urethra Fuck","Urethra Fuck","You don’t have a suitable sex toy or a cock!");

	if(flags["MADE_RENVRA_BEG"] == 2 && renvra.cumQualityRaw >= 100) addDisabledButton(3,"MakeHerBeg","MakeHerBeg","Renvra looks at you warily. She probably still hasn’t nutted or knotted since the last time you backed her up, and isn’t about to let you do it again.");
	else if(flags["RENVRA_SEXED"] != undefined) addButton(3,"MakeHerBeg",makeRenvraBegYouSillyBillySlut,undefined,"MakeHerBeg","‘Encourage’ the ball-busting battle-axe to be a little nicer to you by edging her until she’s broken-down and desperate to cum - mercy is optional.");
	else addDisabledButton(3,"MakeHerBeg","MakeHerBeg","Renvra looks like she’s itching to fuck you - she’s not going to accept being teased and toyed with right now.");

	if(flags["MADE_RENVRA_BEG"] == 2 && renvra.cumQualityRaw >= 100) addButton(4,"Dbl.Trouble",renvraDoubleTrouble,undefined,"Double Trouble","Renvra’s so backed-up from your shenanigans that her girthy egg-cock could probably put <i>two</i> batches of kids in you.");
	else addDisabledButton(4,"Dbl.Trouble","Double Trouble","Renvra looks impatient, like she wants to blow her load and get back to work - try some teasing and denial and maybe you can get her ‘full’ attention.");
}

//Bend Over
//Bend over Renvra’s desk and let her fuck your [pc.vagOrAss] with her ovipositor-cock. 
public function bendItLikeBeckhamForRenvra():void
{
	clearOutput();
	showRenvra(true);
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
	if(pc.hasVagina()) x = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);

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
	showRenvra(true);
	var x:int = -1;
	if(pc.hasVagina()) x = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);
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
	showRenvra(true);
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

	output("\n\nRenvra pats your [pc.butt] and shifts most of her weight up onto the desk. <i>“");
	if(renvra.cumQualityRaw < 100) output("Don’t worry, they’ll dissolve in a little while. Unless that nyrea-boy I found the other day managed to fertilize them, that is...");
	else output("Hope you’re ready to carry my kids - after what you did before, I’m almost certainly knocked up...");
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
	imbibeVenomEffects();
	
	processTime(14);
	flags["RENVRA_SEXED"] = 1;
	pc.changeLust(20);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Take Spunk]
//Take a load of Renvra’s aphrodisiac-laden semen right in the womb. 
public function takeAShotOJizzInZeWomb(x:int = -1):void
{
	clearOutput();
	showRenvra(true);
	output("<i>“That’s what I like to hear!”</i> Renvra growls, shifting her stance back slightly, bringing her nyrean knot away from the lips of your cunt. <i>“Just lie back and relax, spacer. I’ll get you nice and full of my young...”</i>");

	output("\n\nOn the cusp of responding, you find yourself being hauled up by Renvra’s startlingly strong arms. She hefts you up and flips you onto your back, letting your [pc.legOrLegs] wrap around her. She kisses you, pulling you tight as you feel the contractions of her hefty member start, and the flood of pink, creamy pre growing thicker inside your stretched-out hole.");
	output("\n\n<i>“Here we go,”</i> she moans, speaking in perfect cadence with her thrusts. <i>“Get ready!”</i>");
	output("\n\nYou’re as ready as you’re going to be, and tell her as much with another orgasmic scream, letting your body carry you to the peaks of pleasure as its filled with a sudden, massive load of aphrodisiacs. Every touch seems to send you shivering and screaming to climax again");
	if(pc.hasClit()) output(", and Renvra’s pounding thrusts make your whole body feel as sensitive as [pc.oneClit], awash in sensation");
	else output(" and again");
	output(". Your hands instinctively go to your [pc.belly], wandering across the taut flesh there as you’re filled with your lover’s wonderfully thick semen.");
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
	imbibeVenomEffects();
	
	pc.orgasm();
	renvra.orgasm();
	
	processTime(10);
	pc.changeLust(15);
	flags["RENVRA_SEXED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Take Eggs]
//Tell Ren to pump you full of eggs instead. They’re <i>probably</i> not fertilized...
public function takeSomeEggs(x:int = -1):void
{
	clearOutput();
	showRenvra(true);
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
	showRenvra(true);
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

	output("\n\nAfter a few thrusts, you’re able to settle into a comfortable, if leisurely, pace of fucking. The strain fades from Renvra’s voice, replaced by little moans of pleasure. Her tongue lolls out of her mouth, lapping at the creamy lake forming between her breasts, slurping up her own aphrodisiacs. You’re not sure if she just gets off on it, or if she’s as susceptible to her own venomous spunk as you are. Either way, she slurps up a mouthful of it, then pulls you in for a kiss, snowballing the creamy pink slime to you. You accept the gift without thinking, and instantly feel the pleasurable burn of the chemicals working their way into your body, even before you swallow. Hilting yourself in Renvra, you push her flush against the wall and kiss her again, letting your hands roam across her breasts, the shaft of her cock, to the swelling knot at its base.");

	output("\n\nThe moment your fingers wrap around Ren’s bitch-breaker, she throws her head back with a primal cry of pleasure. A few vigorous strokes keeps her moaning, and sets off a chain reaction through her body that ends with her heavy balls throbbing against the shaft of your prick and a jet of pink cream spraying up from her thick ovicock, blasting Renvra straight in the chin and raining down on her tits.");
	output("\n\n<i>“Gah! Fuck!”</i> she shouts, fingers clutching at your shoulders as she cums. <i>“Stroke it! Strokeitstrokeitstrokeit.”</i>");
	output("\n\nYou do as you’re bid, massaging the turgid knot and pumping her equine-like shaft. In turn, Renvra’s ass clenches hard around your thrusting [pc.cock], desperately trying to milk the cum from you. With the sight of Ren creaming herself to urge you on, it’s an attempt you’re quite willing to accommodate. You hook your hands under her legs and ram yourself home in her, letting yourself go utterly under her anal ministrations.");
	output("\n\nRen sucks in a sharp breath as the first gouts of [pc.cumNoun] spray into her");
	if (pc.hasKnot()) output(", spurred on by the sudden impact of your [pc.knot] pounding her wide open, tying the two of you together");
	output(". Short, frantic thrusts bring you deeper into her, working out every drop of spooge you can fill her with. By the time you’re done, Renvra’s left panting against the wall, her hands cradling the throbbing shaft of her deflating cock against her belly. She’s a mess of her own pink spunk, smearing across her chest and shoulders and dripping down onto her desk.");
	output("\n\n<i>“What a mess,”</i> she laughs, rolling her head back and closing her eyes. A plated finger flicks through the pink cream on one of her tits, bringing it up to her mouth to be cleaned off. After a moment’s enjoyment of her own taste, Ren reaches into a shelf nearby, pulls out a fairly thick towel, and begins to clean herself off -- even as you’re still ");
	if(!pc.hasKnot()) output("buried");
	else output("knotted");
	output(" inside her.");

	var cumQ:Number = pc.cumQ();
	output("\n\n");
	if(pc.hasKnot(0)) output("You’ve not much choice but to stay there while she cleans up while your [pc.knot] slowly deflates. By the time you’re able to extricate yourself from Renvra’s tight ass, she’s as clean as she’s liable to get without a shower - you can still see a few errant traces of pink spooge clinging to her pale skin, and beads of nectar still stand at the tips of her crimson teats. Even so, she gives you a surprisingly playful push off and picks up her shirt, starting to button it up.");
	else 
	{
		output("You slip yourself out of Renvra’s ass, nice and slow.");
		if(cumQ < 20) output(" You enjoy the sight of her hole gaped in your wake, though your [pc.cum] isn’t the least bit visible.");
		else if(cumQ < 75) output(" The moment you part, though, you’re treated to the sight of her [pc.cum]-glazed rectum, gleaming in the light.");
		else if(cumQ < 150) output(" The moment you part, though, you’re treated to the sight of a stream of your [pc.cum] running down her leg, her insides thoroughly coated in it.");
		else if(cumQ < 500) output(" The moment you part, though, you’re treated to the sight of a few streams of [pc.cum] pouring down her legs, the rest of it puddled in her gaped-out hole.")
		else if(cumQ < 1000) output(" The moment you part, though, you’re treated to a veritable waterfull of your seed racing out after you, splattering onto the floor.");
		output("\n\n<i>“Ugh,”</i> Renvra groans, finishing with her own load before flicking the towel down between her legs to clean up your mess as well. When she’s done, she tosses the towel into a waste basket with a contemptuous grunt and picks up her shirt, careful to avoid the puddle of spunk you’ve left on the floor. As she gets dressed, you hear her muttering about getting her trench wives to clean it up later.");
	}
	// Combine
	output("\n\n<i>“Well, I think that’s a long enough smoke break,”</i> Renvra says, flashing you a slight grin over her shoulders as she pulls her pants up and works at her belt. It looks like a herculean effort to shove that much cock back into such tight pants.");
	output("\n\nAs you gather your [pc.gear], Ren steps over to you, grabbing your chin and pulling you up to look her in the eye. <i>“Let’s do this again,”</i> she says, quickly pressing her lips to yours. <i>“I’ve had much worse distractions.”</i>");
	output("\n\nHigh praise, coming from her. ");
	output("\n\nRenvra releases you and turns on a heel towards the door. Finishing with your own gear, you follow her back out to the trading post’s main floor.");
	processTime(23);
	if(pc.hasKnot(0)) processTime(20);
	pc.milkInMouth(chars["RENVRA"]);
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
	output(" the moment you’ve gotten your gear out of the way. Your back arches as pleasure washes over you, brought on by the first egg starting its lengthy journey out of your");
	if (pregSlot == 3) output(" bowels");
	else output(" womb");
	output(".");

	output("\n\nYou curl up and spread your [pc.legOrLegs], giving your young charges as easy an access to the open air as you can. All there is to do after that is sit back and push. Your body convulses, the strange sensation of stretching pleasure overwhelming your senses.");
	if (pc.hasCock() || pc.hasVagina()) output(" You instinctively begin masturbating, unable to resist the alien pleasure.");
	else output(" You futilely rub at your over-sensitive groin, trying to coax some relief from your bare crotch.");
	output(" The first egg starts pushing through you, slowly but surely reaching");
	if (pregSlot == 3) output(" your [pc.asshole]");
	else output(" the lips of your pussy");
	output(". The stretch is incredible,");
	
	var tGape:Number = 0;
	
	if (pregSlot == 3) tGape = pc.ass.looseness();
	else tGape = pc.vaginas[pregSlot].looseness();
	
	if (tGape < 5)
	{
		output(" forcing you to push like you’ve never pushed before to squeeze the egg through the");
		if (pregSlot == 3) output(" ring of your ass");
		else output(" lips of your cunt");
	}
	else
	{
		output(" but nothing you can’t handle with your incredibly well-loosened hole");
	}
	output(". The egg squeezes out with a wet “POP,” rolling out of you and onto the ground in a pool of pink nyrean fluids.");
	
	output("\n\nYou shiver as you lay the first egg of the clutch, dropping the egg down");
	if(pc.legCount > 1) output(" between");
	output(" your [pc.legOrLegs]. You sigh in relief, your belly noticeably shrunken. But it’s not empty yet, and you soon feel another shift in your swollen gut.");
	if (pData.pregnancyQuantity == 2) output(" The");
	else output(" A");
	output(" second egg begins its descent, refusing to let you recover after the first. Your");
	if (pregSlot == 3) output(" ass");
	else output(" sex");
	output(" spasms and quivers as the next egg moves, and you grunt and push it out, letting the soon-to-be born nyrea join its sibling.");
	if (pData.pregnancyQuantity == 3) output(" Another egg follows");
	else if (pData.pregnancyQuantity > 3) output(" More eggs follow");
	if (pData.pregnancyQuantity >= 3) output(", sliding out of you easily compared to the first."); 

	output("\n\nYou spend minutes laying your nyrean eggs, dropping a clutch of "+ num2Text(pData.pregnancyQuantity) +" total eggs. When the final egg pops out, you flop onto your back, breathing hard. That took damn near everything out of you, and you find yourself nearly passing out after your ordeal. Before you do, however, you realize that you’ll probably need to do... something about this clutch of eggs. You tap on your Codex and review the nyreas’ entry. They’ll be helpless for several weeks, so you can’t exactly leave them here. You flip over to your comms and call in a pickup for the eggs - thank God that Dad left you that nursery back on Tavros. A drone arrives a few minutes later, collects the eggs, and hands you a receipt before carting them back home.");

	output("\n\n<b>"+ pData.pregnancyQuantity +" nyrea will soon be waiting for you back at the nursery.</b>");

	if (pData.pregnancyType == "RenvraEggPregnancy")
	{
		output("\n\nAt least, they’re three-quarters nyrea.");
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
	AddLogEvent("You note that your swollen belly is shifting awkwardly, and you’re starting to feel very... wet. Your motherly instincts tell you that you’ll be giving birth very, very soon.", "words");
}

public function renvraBellyrubs():void
{
	if (flags["Renvra Full Pregnancy Bellyrub Supression"] == undefined) flags["Renvra Full Pregnancy Bellyrub Supression"] = 0;
	
	if (flags["Renvra Full Pregnancy Bellyrub Supression"] < days && rand(100) < 2)
	{	
		flags["Renvra Full Pregnancy Bellyrub Supression"] = days;
		var m:String = "";
		
		if (InPublicSpace() && (kGAMECLASS.hours > 4 && kGAMECLASS.hours < 22))
		{
			m = "As you walk through town, people occasionally walk up to you, asking to feel your belly or how far along you are. You don’t have the heart to tell them you’re full of alien eggs."
			if (pc.isBimbo() || pc.isTreated() || pc.isPuppyorKitten())
			{
				m += " Besides, people rubbing all over you feels super good!";
			}
			AddLogEvent(m);
		}
		else
		{
			m = "You stop yourself, seemingly at random, and plant a hand soothingly over your [pc.belly]. Your children inside you shift slightly, making your";
			if (pc.statusEffectv1("Renvra Full Pregnancy Bellyrubs") == 3) m += " stomach rumble";
			else m += " belly tremble";
			m += ". It’s surprisingly nice to just rub your belly, enjoying the fullness of it."
			AddLogEvent(m);
		}
	}
}

public function renvraPregnancyMessage1():void
{
	clearOutput();
	author("Savin");
	
	output("You feel... ill. You slump against a nearby wall, clutching at your [pc.belly]. Ugh, what the...");

	output("\n\nYou double over and puke, hucking your lunch all over the ground. You spend several minutes hurling before you’re able to stand. Geez, shouldn’t your nanomachines be able to keep you from getting just a little cold or something?");
	
	processTime(10);
	
	addNextButton(mainGameMenu);
}

public function renvraPregnancyMessage2():void
{
	clearOutput();
	author("Savin");
	
	output("You’re not even surprised when you end up puking today.");

	output("\n\nYou don’t feel <i>bad</i>, per se. But something’s fucking wrong. That’s for sure.");

	output("\n\nWith a groan, you slump against the wall and pull out your Codex. A few moments of scanning, extranet searching, and cursing pretty much solidifies in your mind: you’re pregnant. With a clutch of part-myr, part-nyrea, and part-human as well. Well look at you, Daddy’s " + pc.mf("boy","girl") + "! He sure would be proud you’re well on your way to leaving your trail of galactic bastards just like your old man.");
	
	processTime(10);
	
	addNextButton(mainGameMenu);
}

public function renvraPregnancyMessage3():void
{
	AddLogEvent("Your belly is bulging slightly, the first visible signs of pregnancy. Your halfbreed spawn seem to be behaving... not that differently from human offspring so far. At least you’re not getting horribly sick in the mornings anymore!");
}

public function renvraPregnancyMessage4():void
{
	AddLogEvent(ParseText(" You’re really starting to show, now. Anybody who looks your way can see you’re obviously pregnant, and you’ve had to adjust your [pc.gear] to make room for your bloated gut. Every so often, you feel a slight movement under your [pc.skinFurScales] as your growing young shift or move. Occasionally, you could swear you feel them kick!\n\nFrom time to time, you find your hands wandering down to your belly, idly caressing your swollen form."));
}

public function renvraPregnancyMessage5():void
{
	AddLogEvent("You find your hands wandering to your belly more and more -- as much to support the growing weight you’re bearing as to caress the home of your unborn children.\n\nYou’re so heavily showing now that you can’t go much of anywhere without people staring. It won’t be long now... maybe just a few weeks more!");
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
		
		AddLogEvent("Your breasts are starting to feel a little heavier as your body prepares for its coming young. While you’re already lactating, your rate of production seems to be increasing in preparation.");
	}
	else
	{
		var m:String = ParseText("You notice that your [pc.chest]");
		if (pc.biggestTitSize() < 1 || pc.totalBreasts() == 1) m += " is";
		else m += " are";
		m += " starting to grow, swelling with the beginnings of milk production. You find someplace quiet and pull your gear off, cupping your";
		if (tBoobies) m += " freshly engorged";
		m += ParseText(" breasts and squeezing out a trickle of [pc.milk] from your teat.\n\n<b>It appears you’re lactating now!</b>");
		
		AddLogEvent(m);
	}
}

public function renvraFullPregnancyEnds(pregSlot:int):void
{
	var pData:PregnancyData = pc.pregnancyData[pregSlot];
	var cpData:PregnancyData = new PregnancyData();
	cpData.loadSaveObject(pData.getSaveObject());
	var inShip:Boolean = InShipInterior();
	var inPublic:Boolean = (InPublicSpace() || rooms[currentLocation].planet.toLowerCase().indexOf("station") != -1 || rooms[currentLocation].hasFlag(GLOBAL.INDOOR));
	
	clearOutput();
	author("Savin");
	
	if (inPublic || inShip)
	{
		output("You feel a rumble in your gut, strong enough to make you nearly double over. Oh, God.... ");

		output("\n\nYour hands grab your gut, and instantly feel something shifting just under your gravid flesh. The children inside you are moving, straining against your gut in a desperate bid to escape. With a panicked cry, you feel your water break, a flood of wetness splashing down your thighs as your offspring get ready to come into the world!");

		output("\n\nShit!");

		output("\n\nYou");
		if (!inShip) output(" grab your Codex and dial an emergency medical alert, summoning an ambulance from the nearest hospital");
		else 
		{
			if (shipLocation == "TAVROS HANGAR") output(" grab your Codex and dial Tavros station’s emergency medical alert, summoning an ambulance from the nearest hospital.");
			else output(" punch your ship to maximum LightDrive speed, and set a course for Tavros station. You’ve got just enough willpower left to forward an emergency medical alert to the dock, making sure an ambulance will be there when you arrive.");
		}

		output("\n\nIt isn’t long before you’re in an ambulance, several V-KO droids looming over you as you’re carted to a medical station. The last thing you see is a mask being placed over your face, and one of the droids telling you to be calm -- you’ll be fine soon.");

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
		output(" The first child’s crown starts pushing out of you, slowly but surely reaching the lips of your pussy. The stretch is incredible,");
		var tGape:Number;
		if (pregSlot == 3) tGape = pc.ass.looseness();
		else tGape = pc.vaginas[pregSlot].looseness();
		if (tGape < 5) output(" forcing you to push like you’ve never pushed before to squeeze the newborn through the lips of your cunt");
		else output(" but nothing you can’t handle with your incredibly well-loosened hole");
		output(". After several minutes of screaming, grunting, and shouting... the first of your newborn children squeezes out with a wet “POP,” flopping out of you and onto the ground in a pool of pink nyrean fluids.");

		output("\n\nYou shiver as you give birth");
		if (pData.pregnancyQuantity == 1) output(" for the very first time");
		else output(" to the first of what must be even more children");
		output(", reaching down while you can and collecting the squalling newborn and bringing it to your breast. It cries out, thrashing its tiny, chitinous arms around until you bring its mouth to your [pc.nipple].");

		output("\n\nYou sigh in relief as your first young suckles. Your belly is noticeably shrunken");
		if (pData.pregnancyQuantity == 1)
		{
			output(". You’re left to recover from your... surprisingly pleasurable ordeal. You suppose if Renvra’s seed is filled with aphrodisiacs, it’s not entirely beyond the pale that your birthing fluids would be too. Weird, but it kept things from being painful, to say the least.");
			
			output("\n\nAfter spending a good long while making sure your child is wrapped up and well-fed from your breast, you set it aside for a moment and pull out your Codex. You flip over to your comms and call in a pickup for the infant -- thank God that Dad left you that nursery back on Tavros. A drone arrives a few minutes later, collects the newborn, and hands you a receipt before cart your offspring back home.");
		}
		else
		{
			output(", but it’s not empty yet, and you soon feel another shift in your swollen gut. The second of your young begins its descent, refusing to let you recover after the first. Your sex spasms and quivers as the next child follows its "+ (rand(10) == 0 ? "brother" : "sister") +", and you grunt and push it out, letting the soon-to-be born nyrea join its sibling.");

			if (pData.pregnancyQuantity > 2)
			{
				output("\n\nAnother follows suit");
				if (pData.pregnancyQuantity > 3) output(", and another");
				output(". Before long you’ve got your arms completely full of crying, suckling nyrean babies. You thought these were supposed to come in eggs! Gah!");
			}
			
			output("\n\nAfter spending a good long while making sure each of your children is wrapped up and well-fed from your breast, you set them aside for a moment and pull out your Codex. You flip over to your comms and call in a pickup for the infants -- thank God that Dad left you that nursery back on Tavros. A drone arrives a few minutes later, collects the newborns, and hands you a receipt before carting them back home.");
		}
		
		output("\n\n<b>" + num2Text(pData.pregnancyQuantity) + " nyrea-myr-human hybrid" + (pData.pregnancyQuantity == 1 ? "" : "s") + " will soon be waiting for you back at the nursery.</b> You’re going to have to find a name for whatever race you’ve");
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

	output("\n\nA local medical droid approaches when you’ve woken up, saying that you’ve recently given birth -- congratulations! You now have " + pData.pregnancyQuantity + " new child");
	if (pData.pregnancyQuantity > 1) output("ren");
	output(", who in accordance with your Emergency Medical Profile (when did you set <i>that</i> up?), have been delivered to Tavros Station’s nursery.");

	if (pc.isBimbo()) output("\n\nAww, you don’t even get to see them!?");

	output("\n\nYou dismiss the droid and grab your [pc.gear] from a nearby bin, taking the opportunity to get dressed. Whatever drug they gave you is powerful as hell, and you’re more than able to walk out of the med station and return to your ship in a few minutes.");

	processTime(10);
	
	//Put PC back at ship tile.
	clearMenu();
	addButton(0, "Next", enterShip);
}

//Fuck her Urethra
//stick dick/dildo into her ovipositor - add Renvra egg fertilization chance to up odds of fertilized eggs next time PC is knotted, more if PC cums inside
//should count as ‘fucking’ Renvra for purposes of unlocks

//tooltip: {(has suitable cock)Fuck Renvra by sticking your dick in her ovipositor’s slit. Cumming down her cock is likely to fertilize her eggs./(only dildo)Diddle Renvra with a dildo in her dick. She’s not liable to care about your lust once the sex toy gets her off, though.}
//disabled tooltip, too big & no dildo: Your cock is too big and you don’t own a suitable sex toy!
//disabled tooltip, no cock or dildo: You don’t have a suitable sex toy or a cock!
public function fuckRenvrasUrethra():void
{
	clearOutput();
	showRenvra(true);
	author("Zeikfried");
	//PC's gotta have a dilo.
	// 0 = dildo
	var dildo:int = 0;
	// 2 = dick.
	if(pc.hasCock() && pc.cockThatFits(renvra.cockCapacity(0)) >= 0) dildo = 2
	// 1 = hardlight
	else if(pc.hasHardLightEquipped()) dildo = 1;

	//(bimbo)
	if(pc.isBimbo()) 
	{
		output("<i>“Sure,”</i> you giggle");
		//(no nudes)
		if(!pc.isNude()) output(", removing your [pc.gear] with a sexy flourish");
		output(", <i>“but is that ");
		if(pc.hasCock()) output("bad boy");
		else output("big bastard");
		output(" ready for me?”</i>");

		output("\n\nRenvra advances on you with a feral sound, rubbing her egg-cock’s flare against your [pc.belly]. ");
		if(!pc.hasScales() && !pc.hasChitin()) output("A wave of arousal spreads through your nerves from the smear of slightly-pink pre-cum. ");
		output("You wrap a hand around the end of her dick, and her throaty growl intensifies. <i>“I’m ready to stick this in any hole you want filled,”</i> she says huskily.");
		//(not vis. preg and has cunt)
		var nBelly:Number = pc.bellyRating();
		var nToneMod:Number = (pc.thickness - pc.tone);
		if(nToneMod < 0) nToneMod = 0;
		nToneMod /= 5;
		nBelly += nToneMod;
		if(pc.hasVagina() && (!pc.isPregnant() || (pc.isPregnant() && nBelly < 10))) output(" <i>“Put my get in your belly, too.”</i>");
		output(" Your [pc.vagOrAss] burns, imploring you to forget your plans and accept her offer, but you resist the fog of fuck-lust pressing at your consciousness.");
		if(pc.libido() > 80) output(".. barely.");

		output("\n\n<i>“That sounds fun,”</i> you say, licking your [pc.lips], <i>“but I had something else in mind.”</i> You raise her prick to your mouth and plant a kiss on the tip. As she shivers and squeezes another dot of pre-cum free, you dip your [pc.tongue] deeply into the hole.");

		output("\n\n<i>“Wha-at might that be?”</i> Renvra grunts, knees buckling as your oral muscle probes her stretched urethra. You pull out with a shiver of your own, closing your eyes until the venomous tingle in your mouth dies down.");

		output("\n\n");
		
		if(dildo == 0) 
		{
			output("You take your dildo from your equipment. ");
		}
		else if(dildo == 1)
		{
			output("You pick up your [pc.lowerUndergarment] and produce the lewd sex toy hidden within. ");
		}
		output("<i>“I’m gonna stick ");
		if(dildo == 2) output("my dick in here and squirt my jizz down your big, sexy cock,”</i> you announce, eyes twinkling. <i>“Won’t that be fun?”</i>");
		else output("my little toy in here and watch you nut,”</i> you announce. <i>“You’ll like it.”</i>");
		output(" Your tongue slides right back into Renvra’s slit after you finish talking. You hope that’ll be enough to break down her resistance - the taste of her venom-laced pre-cum is getting you off already.");
		output("\n\nRenvra shudders and her mouth falls open, reply dead in her throat, as you lap at the insides of her slippery, egg-depositing slit. For at least half a minute all you can hear are groans. You pull your [pc.tongue] out one final time and look up at her with your best seduction face. It feels like a long time that you stare at her, trying to seem self-assured but inwardly burning, on the verge of capitulating. <i>“F-fine,”</i> she grudgingly says, at last. <i>“Do it already.”</i>");
	}
	//(high emp/nice, no bimbo)
	else if(pc.isNice())
	{
		output("<i>“Well, actually, I was wondering if maybe I could... make you feel like a woman,”</i> you suggest.");
		output("\n\nRenvra looks hard at you. <i>“That doesn’t even make any sense. Either you take my eggs or a bellyful of my get,”</i> she answers. <i>“I don’t mind bending over for a big confident dick, either... but you don’t qualify, right now.”</i>");
		output("\n\n<i>“Hey, don’t be like that,”</i> you say, soothingly, while reaching for her tool. <i>“You like having something inside you, so... I thought maybe I’d just change up the hole.”</i> As the rough, spongy flare of her cock glides under your palm, you slip a digit into the moist, pink ‘X’ that is her opening. Renvra shudders and a wave of cozy heat radiates from your fingertip as her pre-cum swells up.");
		output("\n\n<i>“Ah-ahh,”</i> she groans. <i>“You want to finger-fuck me?”</i>");
		output("\n\n<i>“No,”</i> you answer with a coquettish look, <i>“I think ");
		if(dildo == 2) output("I’d like to put some of my, ah, ‘get’ in </i>your<i> belly.”</i> You rub your crotch against Renvra’s flare, making sure she feels the tip of your [pc.cock] pressing at her slit.");
		else 
		{
			output("I’ll use something with a bit more length.”</i> You produce ");
			if(dildo == 0) output("your dildo");
			else output("the futuristic strap-on programmed into your [pc.lowerUndergarment]");
			output(" with a flourish and rub it against Renvra’s slit.");
		}
		output("\n\nThe mixed-breed bitch squirms, half-heartedly twisting her flare in your hot grip while you start to unfasten your [pc.gear]. You slide a thumb over her urethra and then sink it in, all while staring at her with an expression of cherubic innocence. <i>“All right,”</i> she says, slumping down in acceptance. You smile and cast aside your equipment.");
	}
	//(else not nice and not bimbo)
	else
	{
		output("<i>“I can do that shit with my ");
		if(flags["FUCKED_SYRI_COUNT"] != undefined) output("pet ausar");
		else output("butler")
		output(",”</i> you taunt. <i>“Since I came all the way out here, why don’t you make it more interesting?”</i>");

		output("\n\nRenvra doesn’t answer right away, though her eyes harden. <i>“What do you have in mind?”</i> she eventually asks, grudgingly.");
		output("\n\nYou grab her flare with a hand and caress the tip with your thumb, trying to get her guard down. She eventually leans back and relaxes into it once you start stroking the shaft as well, producing a glob of pinkish pre-cum that sends a hot tingle through your unprotected skin. Sliding your thumb inside her slick, nerve-packed urethra causes her to shudder with pleasure.");
		output("\n\n<i>“I’m going to stick ");
		if(dildo == 2) output("my dick");
		else output("a toy");
		output(" in here,”</i> you announce abruptly.");

		output("\n\nRenvra jerks upright. <i>“No way!”</i> she grunts, trying to withdraw.");
		output("\n\n<i>“Don’t be a sissy,”</i> you scold");
		if(dildo == 0) output(", taking out your dildo");
		else if(dildo == 1) output(", materializing the strap-on programmed into your [pc.lowerUndergarment]");
		output(". <i>“You pass eggs through here. Well, think about it - ");
		if(dildo == 2) output("my penis");
		else output("this");
		output(" isn’t any wider. And you’re already getting off with just my thumb... aren’t you?”</i> You slip the digit in again, ringing her irregular cum-slit. Renvra’s jaw slackens when you scrape your thumb against the inside.");
		output("\n\n<i>“Ahh! Okay, fine!”</i> the bitchy halfbreed concedes.");
		output("\n\n<i>“Damn right,”</i> you smile, removing your [pc.gear].");
	}
	//cock branch - preferred if available
	if(dildo == 2)
	{
		var x:int = pc.cockThatFits(renvra.cockCapacity(0));
		if(x < 0) x = pc.smallestCockIndex();
		output("\n\nRenvra sighs resignedly as you ");
		if(pc.isTaur()) output("press your chest to hers, smushing her F-cups while you try blindly to line up your cocks. She reaches down and holds her knotted tool in place for you with a superior smirk.");
		else output("steady her fat shaft and prepare to penetrate with [pc.oneCock].");
		output(" Her attitude doesn’t last much longer than it takes to slide your [pc.cockHead " + x + "] into her; after a few inches of your hot flesh scraping along her pre-slicked urethra, her knees buckle and she falls onto her ass. You almost do the same from the aphrodisiac heat of her myr cum but manage to stay upright, acutely aware that you’ll lose control of the fuck the moment you show weakness.");
		
		renvra.cockHoleChange();
		
		output("\n\n<i>“Oh fabulous fortune,”</i> she groans. <i>“It feels like I’m knotting and the egg won’t come out.”</i> You wonder what that experience is like for a nyrea, and if she means that she’s enjoying it. The latter question, at least, is answered quickly. <i>“More!”</i> she demands, pawing feebly at your [pc.hips].");
		output("\n\nObliging with a grin, you slide the final few inches into her. ");
		if(!pc.isTaur()) output("Gripping her wide-stretched flare in two hands, y");
		else output("Y");
		output("ou withdraw and thrust back in, feeling your [pc.cockNoun " + x + "] submerge in a wave of pre-cum that rushed up as you pulled out. The halfbreed’s slimy secretion starts the nerves in your prick to sizzling as it squishes around your crown and out of her slit.");
		output("\n\n<i>“Uhn!”</i> cries Renvra. <i>“Yes!”</i> She leans back, fat tits a-wobbling, and snakes a hand under her tight ass. You thrust obliviously into her egg-sized gash, enjoying the odd, four-ridged feel on your [pc.cockNoun " + x + "] and the view of her huge, quivering rack, not thinking too hard, when you feel a wall of hot liquid against your [pc.cockHead " + x + "]. You stop thrusting, look down at Renvra, and finally notice that half of her hand is actually inside her asshole. She must be so deep that she’s able to stimulate her prostate!");
		output("\n\n<i>“Cuh-ming!”</i> she moans, thrusting so hard against your prick that her slit slides up to ");
		if(pc.balls > 0) output("your [pc.sack]");
		else output("your base");
		output(".");
		if(pc.isTaur()) 
		{
			output(" You’re helpless to stop it as her burning load slurps along your [pc.cock " + x + "] and douses your ");
			if(pc.balls > 0) output("[pc.balls]");
			else output("[pc.thighs]");
			output(" with the drug-laced cum squirting around the edges.");
		}
		//(high emp)
		else if(pc.isNice()) 
		{
			output(" Eager to see her get off but not as eager to have your crotch coated in a huge load of myr aphrodisiac venom, you grab her shaft and thrust against it as well, plugging enough of her cock-hole with your body that only a little jizz is able to leak out and lick at your ");
			if(pc.balls > 0) output("[pc.balls]");
			else if(pc.hasVagina()) output("[pc.vaginas]");
			else output("taint");
			output(".");
		}
		//(else)
		else output(" As the heat climbs your [pc.cock], a devilish idea flits through your head. You squeeze Renvra’s flare so tightly with your hands that not another drop of her venomous load is able to leak out of her slit, pump though she may.");

		output("\n\n<i>“Gah!”</i> she yowls, frustrated. <i>“Let it out, let me cum! I’m going to fertilize my own eggs if I can’t let it all out!”</i> She jerks and shifts, trying to pull free, but you stymie her by sliding forward just after she slides back; with Renvra going crazy trying to blow the jammed-up remainder of her lust-inducing drug-jizz on you, your [pc.cockNoun " + x + "] is getting double the strokes for half the thrusts.");

		output("\n\n<i>“You’re going to have fertilized eggs either way,”</i> you grunt, hilting in her egg-slit. Renvra’s eyes widen as ");
		if(pc.balls > 0) 
		{
			output("she feels your [pc.sack] tighten against her flare and ");
		}
		output("your first squirt of [pc.cum] bubbles from your [pc.cockHead " + x + "].");
		
		var cumQ:Number = pc.cumQ();
		//(li’l and med cum)
		if(cumQ < 200) output(" It’s hardly enough to turn the tide of Renvra’s ejaculation, and you can only imagine your poor spunk swirling and mixing with hers inside her throbbing cock.");
		//(big cum)
		else 
		{
			output(" Your body beats Renvra’s for potency, hands down, and you faintly feel the nerve-tweaking venom recede from your [pc.cockHead " + x + "] as your load pushes the halfbreed’s back, past the deflated knot and into her body. Her balls swell and swell as your [pc.balls]");
			if(pc.balls <= 1) output(" empties");
			else output(" empty");
			output(", until her scrotum is stretched against the floor by your [pc.cumNoun] like a big jiggly water balloon.");
		}
		output(" Spent, you lower yourself onto Renvra’s cushy breasts for a rest.");
		output("\n\n<i>“Shit, spacer,”</i> she says");
		if(cumQ >= 400) output(", prodding at her swollen, sloshing purse");
		output(". <i>“If you don’t come back and let me lay this monster load in you, I’m sending a bounty hunter to </i>bring<i> you back.”</i>");

		output("\n\nYou rest a few minutes more and then get up, sliding your [pc.cockNoun " + x + "] free with a ‘sllluck’. A river of mixed sperm runs from the end of her dick.");
		if(pc.isNice()) output(" <i>“Sure,”</i>");
		else output("<i>“We’ll see,”</i>");
		output(" you say, winking playfully. Renvra flushes red, and you leave her there");
		if(cumQ >= 10000) output(", pinned to the floor by a sack full of your spunk");
		output(".");

		//end, large lib/sens increase for taurs, minute lib/sens increase for others, adjust lust and time
		pc.slowStatGain("libido",1);
		processTime(33);
		pc.orgasm();
		//improve odds of fertilized eggs for next Renvra laying by 40-100% percent depending on PC cum and adjust dialogue in sex menu/old laying scene
		if(renvra.cumQualityRaw < 8)
		{
			renvra.cumQualityRaw += 4;
			renvra.cumQualityRaw += Math.round(pc.virility());
		}
	}
	//dildo branch
	else
	{
		if(dildo == 1) output("\n\nYou display your underwear sensually, hanging the garment in front of your crotch and wiggling the fake penis with a shake from your hips. Sporting a grin, you ");
		else output("\n\nYou grin and ");
		output("plug Renvra’s drooling egg-gash with the toy, making sure to angle it just a little wrongly so the tip scrapes against her ovipositor’s insides. She groans as inch after inch invades her shaft, and a flood of pink, pearly pre-cum erupts from the tip - for a moment, you think she may have ejaculated from the penetration alone, but the volume is not enough.");
		
		renvra.cockHoleChange(0);
		
		output("\n\n<i>“More...”</i> she sighs breathlessly, wrapping her hands around her fat tool and starting to thrust through her fists. You figured on having to do the work yourself, but Renvra’s enthusiasm for the lewd sounding surprises you; you settle for holding the dildo in place for her to engulf with her monstrous, veiny almost-horsecock, watching closely and trying different angles each thrust to find one that hits the sweet spot, while half-interestedly ");
		if(!pc.isTaur() && pc.hasVagina()) output("frigging [pc.oneVagina]");
		else if(!pc.isTaur() && pc.hasVagina()) output("stroking [pc.oneCock]");
		else output("tweaking your [pc.nipple]");
		output(" with your other hand. The pre-cum from her erstwhile egg-layer is now so pervasive that the surface of her cock gleams pink and a puddle is gathering on the floor.");
		output("\n\n<i>“She’s really into this,”</i> you think to yourself, a moment before she suddenly blows her load. A sloppy ring of rich, rosy drug-cum squirts into the air around the base of the toy, soaking your hand and wracking your arm with a mini-gasm of its own.");
		output("\n\n<i>“Gotta cum, gotta let it out,”</i> Renvra grunts, <i>“gotta cum!”</i> The semen-slicked toy escapes from your grip before you can pull it out");
		if(!pc.isNice()) output(" - though, you weren’t going to anyway - ");
		else output(", ");
		output("and the herm’s thrashing thrusts quickly take it out of your reach. <i>“Uhhhn,”</i> she moans, torn between pervertedly pumping her hips and trying to grab the dildo from the end of her impossibly far-away cockhead. <i>“Nooo...”</i>");

		output("\n\nYou fold your hands primly and wait for the half-myr’s obstructed jizz fountain to shut off, wishing a little that it were inside you instead. It’s surprisingly long before she winds down - the alien’s body must allow extra orgasm time when an egg or other object is stuck in the pipe. Gradually, her monster cock deflates enough that Renvra can ");
		if(dildo == 0) output("grab the dildo, and she flings it at you in a huff.");
		else output("grab your [pc.lowerUndergarment], which she flings at you in a huff.");
		output("\n\n<i>“That looked fun,”</i> you say conversationally, watching her slit ooze a river of pinkish cum.");
		output("\n\n<i>“Fuck you,”</i> she answers, though not with any particular fire. <i>“It was amazing. Never mind that I’m probably knocked up with my own children now.”</i>");
		output("\n\n<i>“Well,”</i> you rejoin, ");
		if(pc.exhibitionism() >= 50)
		{
			output("thrilling as her gaze falls on your ");
			if(pc.hasCock()) output("throbbing, drooling [pc.cocksLight]");
			else if(pc.hasVagina()) output("[pc.vaginas]");
			else output("heaving chest");
			output(", ");
		}
		output("<i>“Maybe I’ll have to help you with that.”</i> The nyrean mutt glances up at you, and you wink at her. You collect your things and exit before she can make the demand right then and there.");
		if(pc.libido() >= 66) 
		{
			if(dildo == 1) output(" Still, a small part of you considers putting your underwear back on, squishing and sopping with Renvra’s drugged semen.");
			else output(" Still, a small part of you wonders if pregnancy might be worth it just to masturbate with the drug-covered toy in your hand.");
		}
		//end, big lust gain, pass time
		pc.changeLust(50+rand(25));
		processTime(13);
		//improve odds of fertilized eggs in next Renvra laying by ~30% and adjust dialogue
		if(renvra.cumQualityRaw < 8) renvra.cumQualityRaw += 3;
	}
	flags["RENVRA_SEXED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Make the Bitch Beg
//avail. after the PC has fucked her with one of Savin’s options or ‘Fuck her Urethra’
//PC can optionally deny her orgasm, disabling this scene and enabling ‘Double Trouble’

//tooltip: ‘Encourage’ the ball-busting battle-axe to be a little nicer to you by edging her until she’s broken-down and desperate to cum - mercy is optional.
//disabled tooltip, hasn’t fucked normally: Renvra looks like she’s itching to fuck you - she’s not going to accept being teased and toyed with right now.
//disabled tooltip, denied orgasm: Renvra looks at you warily. She probably still hasn’t nutted or knotted since the last time you backed her up, and isn’t about to let you do it again.

public function makeRenvraBegYouSillyBillySlut():void
{
	clearOutput();
	showRenvra(true);
	author("Zeikfried");
	//(first time bimbo)
	if(flags["MADE_RENVRA_BEG"] == undefined) 
	{
		if(pc.isBimbo())
		{
			output("<i>“How come you’re so mean?”</i> you ask vacantly, pursing your [pc.lips].");
			output("\n\nRenvra shrugs and continues to rub her package, aiming the cum-slit towards your lewd mouth. <i>“Got nothing to say ‘bout that, spacer, ‘cept that it’s everyone else who seems to need things from me, not the other way around.”</i>");
			output("\n\nYou consider this for a moment even as your hand automatically takes hold of the cock in front of you and starts to stroke. <i>“So if you ever needed something from someone, you’d be nicer to them?”</i>");
			output("\n\n<i>“Sure, I guess,”</i> the half-myr says absently, leaning into your palm as a splat of pre-cum drools onto the floor. <i>“But that’s not... ungh, likely.”</i>");
		}
		//(first time nice)
		else if(pc.isNice())
		{
			output("<i>“You know, you could be kinder to me,”</i> you say, ignoring Renvra’s proposition. <i>“I don’t see a lot of other people in here bothering to spend time with you.”</i>");
			output("\n\n<i>“Fuck ‘em,”</i> Renvra replies curtly, ignoring your ignoring and stroking her dick more. <i>“And fuck you if you think I need you. You’re the one who wanted a piece of this.”</i> A glob of pre-cum surfaces, and she jabs her flare at you, half-attempting to splatter you with it. <i>“And now you got it. So get it.”</i>");
			output("\n\n<i>“Come on,”</i> you persist, brushing away her cock, which just wobbles back. <i>“You do need me. Or do you have some other lover who’s actually interested in you and not just your sperm?”</i>");
			output("\n\n<i>“Hah, so now you’re interested in me?”</i> she challenges. <i>“If that were true, I might indeed be nicer to you.”</i>");
		}
		//(first time not nice not bimbo)
		else
		{
			output("<i>“You’re a real bitch, Renvra,”</i> you say, watching her work the meaty shaft.");
			output("\n\n<i>“Knew that already, spacer,”</i> she retorts, still masturbating. <i>“I figure I’ll learn how to be nice when someone actually has something I need, and not the other way around.”</i>");
			output("\n\n<i>“And does ");
			if(!pc.hasCock()) 
			{
				output("the only ");
				if(pc.hasVagina()) output("pussy");
				else output("ass");
				output(" you can get that’s not attached to some child-crazy myr");
			}
			else output("the only dick you don’t have to wait a year for");
			output(" count?”</i>");
			output("\n\nA dribble of pre-cum slips from her ‘X’-shaped slit. <i>“A little,”</i> she admits. <i>“But I’ll get over it if you decide to go fuck yourself.”</i>");
		}
	}
	//(repeat any)
	else
	{
		output("<i>“I just wanna play with it again,”</i> you say sweetly, holding up a hand and working your fingers sensually. Renvra looks hard at you, half mistrust and half desire.");
		output("\n\n<i>“Fine,”</i> she says, thrusting her almost-equine egg-cock toward you. <i>“You know what happens if you jerk me around.”</i>");
	}
	output("\n\nHer hard exterior melts away as you grab a handful of her. Running one hand along the underside of her slut-stretching tool, you wrap the other around the flare, working the ring with your thumb. Renvra smiles dumbly as you switch to rolling your palm over the tip, smearing her pre-cum around.");
	output("\n\n<i>“That’s good,”</i> she sighs. You switch up again and trace an ‘X’ over her cross-shaped slit. Her breath hitches, and with it her chest, setting her magnificent breasts a-jiggle. <i>“Keep this up and I’ll cum without even putting it in.”</i>");
	output("\n\n<i>“Is that unusual?”</i> you ask, demurely.");
	output("\n\nRenvra only grunts as you pass her pre-glazed flare through your open fist, masturbating it with a soft ‘sllup’ sound. Her hips get into it, jerking forward as you stroke down. You allow her to fuck your palm, waiting for her to quiver and shake as though she’s about to finish. As she begins to tremble with ecstasy, you stop and remove your hand.");
	output("\n\n<i>“Ungh...”</i> she blurts. <i>“I was almost there.”</i>");
	output("\n\n<i>“Lie on your back,”</i> you say, changing the subject.");
	if(pc.isNaga()) output(" You spread your coils out, making a cozy hammock.");

	output("\n\nRenvra complies, getting down so fast that it causes her prick to wag in the air. The brief delay doesn’t satisfy you, and you take all the time in the world to lower yourself onto her, making sure to give her a sexy eyeful of your ");
	if(!pc.isNude()) output("chest and crotch, flexing so that everything you have bulges under your [pc.gear]. Finally, you face away and straddle her. A hand begins to slide up your [pc.thigh].");
	else
	{
		output("[pc.chest], caressing your [pc.skinFurScales] and covering your nipples playfully before turning around. You then bend over and allow her to glimpse your [pc.crotch]");
		if(pc.hasCock()) output(", making sure she sees just how much pre-cum drips from your own stiff [pc.cocksLight].");
		else if(pc.hasVagina()) output(", letting her get a good glimpse of your [pc.vaginas] and the drooling girl lube.");
		else output(".");
	}
	output(" Renvra licks her lips in anticipation and begins to grope you, sliding a hand up your [pc.thigh]. ");
	if(pc.isNaga()) output("Her arms are restricted suddenly when you wrap your serpentine body around her torso.");
	else output(" Her arms are pinned under your [pc.legOrLegs] suddenly as you throw your weight atop her.");
	output("\n\n”</i>Hey...”</i> she mumbles, taken aback.");
	output("\n\n<i>“No touching,”</i> you admonish, shaking your [pc.butt] at her. Your hand slips back around the secret herm’s cock, and this time you bring it to your [pc.lips], softly kissing the flare. Renvra’s egg-slit twitches and contracts wetly from the affection just under your nose, suggesting itself as your target.");
	output("\n\nYou part your [pc.lips] slowly, allowing ever-increasing wisps of breath to roll over Renvra’s tip, making sure her imagination runs wild about what’s coming. When she’s so tense that you can feel her chest lifting you and her nipples jab into you like eager little dog’s noses, you pop as much of the fat, equine flare into your mouth as you can.");
	output("\n\n<i>“Yeah! Do it!”</i> cries Renvra, as the drug-like myrrish pre-cum numbs your lips and teeth. You suckle the end like a milky breast, feeling dollops of her male lube squeeze from her slit and into your mouth. Your [pc.tongue] slides forward, searching out the leaking opening ");
	if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("and dipping its tip inside to ring the entrance.");
	else output("and plunging down her drooling, egg-stretched passage. An obstruction blocks your path, and you can only guess that it’s her prostate or some other such sexual organ. Waggling the end of your tongue against it seems to make her delirious with rutting frenzy.");
	output("\n\n<i>“Almost there,”</i> the halfbreed repeats. You pull your tongue from her and resume stroking the shaft, far enough down the base that she can’t quite get closer to climax even though she obviously enjoys it. Your mouth burns with venom, ");
	if(pc.hasCock())
	{
		output("and the pre-cum you’ve ");
		if(pc.isCrotchGarbed()) output("dripped through your [pc.lowerGarment] and ");
		output("smeared between Renvra’s breasts with your [pc.cocks]");
	}
	else if(pc.hasVagina())
	{
		output("and the lubrication dripping ");
		if(pc.isCrotchGarbed()) output("through your [pc.lowerGarment] ");
		output("from your [pc.vaginas] and wetting Renvra’s breasts");
	}
	else output("and the racing of your blood through your crotch");
	output(" is proof of your own lust. Renvra tries to pump her hips to get your fist high enough that her flare is engaged, but you carefully control your strokes, intent on tormenting her right up to the verge of insanity.");
	output("\n\n<i>“Use your mouth again!”</i> the self-obsessed hybrid demands.");
	output("\n\n" + pc.mf("Chuckling","Giggling") + " audibly, you kiss her flare once, then twice, before pulling back. She moans happily at the pressure of your lips, intensifying her pumps to scrape harder when they touch. You poke your tongue out again, diddling the very end of her slit in a charged reminder of the pleasure you visited on it before, and slide your hands up. Renvra jumps on the chance to once again satisfyingly fuck your fists with the nerve-laden end of her ovipositor. It’s not long that she’s at it before she’s sweating and moaning like a male whore at the end of a hen party. Her hands work and clench, trapped beneath you, and you can only guess at the roiling load of junk her body is getting ready to push out after your sadistic edging.");
	output("\n\n<i>“Gonna cum!”</i> she grunts, as the veins in her cock are pressed to the skin by the dilating passageway within.");
	output("\n\nYou stop moving. She continues trying to pump her hips, so you pull your hands away, leaving her to fuck air.");
	output("\n\n<i>“What... don’t stop!”</i> the half-myr moans. <i>“I’m almost there! I can feel it!”</i>");

	output("\n\n");
	if(pc.isBimbo())
	{
		output("<i>“Then, let’s savor that yummy feeling,”</i> you say, enjoying an envious flutter in your own ");
		if(pc.hasCock()) output("[pc.cocksLight]");
		else output("[pc.vagOrAss]");
		output(".");
	}
	output("<i>“Isn’t it a nice feeling?”</i> you ask, pulling deeply from your self-control to seem unflappably aloof despite your inflamed hands and heaving chest.");
	output("\n\n<i>“If I don’t cum now, my eggs will be basting in my own get! I’ll have a fertilized load for sure!”</i> Renvra cries. <i>“Finish!”</i>");
	output("\n\nYou sit up and look dead in her eyes. <i>“Oh. You </i>need<i> me to finish you off now.”</i>");
	output("\n\n<i>“If you weren’t pinning my arms, I’d have rubbed it out already!”</i> she gripes, trying to escape you again. Her rod-like shaft bobs uselessly, stiff as a straight whiskey and flinging pre-cum everywhere but unable to finish unaided.");
	output("\n\n<i>“So you </i>need<i> me to stop pinning your arms?”</i>");
	output("\n\nRenvra winces as your weighted words finally sink through. <i>“Yes...”</i> she says, biting her cruel tongue. <i>“Please.”</i>");
	processTime(16);
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Finish Her",mortalKombatFINISHHER,undefined,"Finish Her","Jack the half-myr’s egg-cock to climax.");
	addButton(1,"Deny Her",denyDatMyrBitchYo,undefined,"Deny Her","Prevent the half-myr from climaxing, causing her eggs to swim in her backed-up cum.");
}

//Finish Her
//space bar or quick select should default to this
//tooltip: Jack the half-myr’s egg-cock to climax.
public function mortalKombatFINISHHER():void
{
	clearOutput();
	showRenvra(true);
	author("Zeikfried");
	output("You stare at her for a time, enough that a note of pleading enters her deranged expression. Winking, you reach out and grab the end of her ovipositor, then resume stroking. Renvra’s hips pump into your fist one last time as a throaty howl escapes, and a positive spray of spunk bursts from the slit of her abused cock. The pink geyser soaks her desk, the room, and her thighs, and your hand burns with arousal as cum drools over it.");
	output("\n\nRenvra’s orgasm continues for almost thirty seconds - her ruddy red dick keeps squirting out aftershocks well after the lion’s share of her load is soaking into the floor. You lackadaisically work globs of cum through her flare with your finger as you watch her. Her eyes are unfocused, her mouth hangs open, and a little drool is pooling... she’s clearly out of it until her climax ends.");
	//(first time)
	if(flags["MADE_RENVRA_BEG"] == undefined)
	{
		output("\n\nIt takes a minute before she can speak. <i>“Fuck... what’s your problem, spacer? You think you’re funny?”</i>");
		output("\n\n<i>“I was just");
		if(pc.isBimbo()) output(", like,");
		output(" proving a point,”</i> you reply.");
		if(pc.isBimbo()) output(" <i>“You know?”</i>");
		output("\n\n<i>“Well, point not taken,”</i> Renvra snaps. <i>“Don’t think you’re special just because you have hands. I can jerk my cock myself as soon as you get off of me. Speaking of which, get the fuck off of me.”</i>");
		if(pc.isBimbo()) output("\n\n<i>“But it feels sooo much better when someone else does it,”</i> you say with conviction. Dismounting, you make sure she gets a good glimpse of your [pc.crotch].");
		else output("\n\n<i>“I’m sure it’s just as good when you do it,”</i> you say, climbing off of the half-myr.");
		output("\n\nRenvra makes to answer, but you point at the corner of her mouth. She touches it, and starts when she feels the drool she left while cumming her brains out through her dick. You grin as she colors with mild embarrassment.");
		output("\n\n<i>“Okay,”</i> she admits, calming down. <i>“Maybe.”</i>");
	}
	else
	{
		output("\n\nRenvra takes a while to recover again, leaving free you to dismount and stretch. <i>“Fuck... I’m still not sure how I feel about that, but it blows my mind how good it is to come that much,”</i> she says eventually, staring at the ceiling.");
		output("\n\nYou wipe the corner of her mouth with your thumb. <i>“Looked like fun to me,”</i> you tease gently.");
	}
	output(" Packing up, you pick your way out of the office");
	if(pc.libido() < 50) output(" while dodging the puddles of myr jizz");
	else
	{
		output(", enjoying the feeling of myr jizz squishing ");
		if(pc.hasToes()) output("through your toes.");
		else output("under your [pc.footOrFeet].");
	}
	//end, add lust, pass more time than usual, no change in Renvra fertility or sex buttons
	flags["MADE_RENVRA_BEG"] = 1;
	flags["RENVRA_SEXED"] = 1;
	renvra.orgasm();
	pc.changeLust(5);
	processTime(7);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Deny Her
//tooltip: Prevent the half-myr from climaxing, causing her eggs to swim in her backed-up cum.
public function denyDatMyrBitchYo():void
{
	clearOutput();
	showRenvra(true);
	author("Zeikfried");
	output("You stare at her for a while, watching her fuck-crazed expression. First resentment and then desperation creep into it as you sit indolently atop her, ignoring her so-precariously-close cock. <i>“Mmm... no,”</i> you decide.");
	output("\n\nRenvra’s eyes bulge. <i>“Fuck you! This isn’t funny!”</i>");
	if(pc.isBimbo()) output("\n\n<i>“You’re really mean to me,”</i> you pout. <i>“I want to play with your big dick some more, but you hurt my feelings.”</i>");
	else if(pc.isNice()) output("\n\n<i>“I don’t feel great about this, but when we’re close and you still treat me like a disposable hole, it hurts,”</i> you say earnestly. <i>“You need to know the feeling.”</i>");
	else output("\n\n<i>“You don’t need anything from me, right?”</i> you spit. <i>“I’ll just sit here.”</i>");
	output("\n\n<i>“Ugh,”</i> she groans. <i>“Come onnnn, you wanted it!”</i>");
	output("\n\nYou fold your arms and lean away from her twitching prong. <i>“Guess I’m the only one.”</i>");
	output("\n\nRenvra continues to thrust uselessly into the air and curse you, drooling pink pre from her horsecock-alike, aching to make contact with something. It takes a long time, but eventually it goes half-limp as her temper winds down, and you can risk releasing her. She practically throws you off as soon as you shift your weight.");
	output("\n\n<i>“You’re an asshole,”</i> she says, defeatedly rubbing her scrotum. <i>“I’m pregnant now... you made me pregnant. I can feel it in my egg sack. And I still have so much cum that my organs are swimming. Before anything else, you better take care of that.”</i>");
	//(bim or high lib)
	if(pc.isBimbo() || pc.libido() >= 80) output("\n\nThe thought makes you weak. <i>“I can live with that,”</i> you whisper. <i>“Want to start now?”</i>");
	else output("\n\n<i>“So... you </i>need<i> to lay your eggs in my hole?”</i> you say, tapping your lips in mock thought.");
	output("\n\n<i>“GET OUT!”</i> Renvra roars. You ");
	if(!pc.isNice()) output("blow her a kiss and ");
	output("leave obediently before she starts throwing military hardware at you.");
	flags["MADE_RENVRA_BEG"] = 2;
	//end, lower empathy, gain lust, pass more time than usual
	//raise Renvra’s egg fertility to 100% for next layin
	//disable ‘Make the Bitch Beg’ and enable ‘Double Trouble’, adjust dialogue in sex menu prompt/egging scene as above, also possibly disable Savin’s ‘Buttfuck Her’ if you want
	renvra.cumQualityRaw = 100;
	pc.changeLust(-8);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Double Trouble
//up to you if you wanna make this unavailable until PC talks about kids with Renvra
//only enabled after ‘Make the Bitch Beg’ orgasm denial option, disabled again after one play
//Renvra busts a nut in PC’s vagOrAss and then eggs the ass, potentially causing double pregnancy

//tooltip: Renvra’s so backed-up from your shenanigans that her girthy egg-cock could probably put <i>two</i> batches of kids in you.
//disabled tooltip: Renvra looks impatient, like she wants to blow her load and get back to work - try some teasing and denial and maybe you can get her ‘full’ attention.
public function renvraDoubleTrouble():void
{
	clearOutput();
	showRenvra(true);
	author("Zeikfried");
	var x:int = -1;
	if(pc.hasVagina()) 
	{
		var nonPregWombsFit:Array = [];
		var nonPregWombs:Array = [];
		for(var i:int = 0; i < pc.vaginas.length; i++)
		{
			if(!pc.isPregnant(i))
			{
				if(pc.vaginalCapacity(i) >= renvra.cockVolume(0)) nonPregWombsFit.push(i);
				nonPregWombs.push(i);
			}
		}
		
		if(nonPregWombsFit.length > 0) x = nonPregWombsFit[rand(nonPregWombsFit.length)];
		else if(nonPregWombs.length > 0) x = nonPregWombs[rand(nonPregWombs.length)];
		else
		{
			x = pc.cuntThatFits(renvra.cockVolume(0));
			if(x < 0) x = rand(pc.totalVaginas());
		}
	}
	if(pc.isBimbo()) 
	{
		output("<i>“Oh, are you going to shove that monster in my ");
		if(x >= 0)
		{
			if(pc.looseness(x) < 2) output("poor little");
			else if(pc.looseness(x) < 4) output("hot");
			else output("big, wet");
			output(" pussy");
		}
		else
		{
			if(pc.looseness(x) < 3) output("poor little");
			else output("hot");
			output(" asshole");
		}
		output("?”</i> you ask, faking concern.");
		output("\n\n<i>“Yeah, and you’re gonna deserve it too, after what you did to me last time,”</i> Renvra answers, gritting her teeth in a sick grin. <i>“And I’m not gonna stop there. Hope you’re ready to carry my eggs, because you’re not getting out of here until I knot in your ");
		if(pc.buttRating() < 5) output("cute");
		else if(pc.buttRating() < 10) output("round");
		else output("big, jiggly");
		output(" butt.”</i>");

		output("\n\nYou smile, slightly turned on by her assertiveness, and start to remove your [pc.gear]. <i>“That sounds hot... were you waiting just for me? Thinking a lot about my punishment? Imagining me bent over and bound, presenting my needy ");
		if(x >= 0) output("pussy and ");
		output("asshole for you to ravage, helpless to stop you from filling me with whichever load you decided to deposit first?”</i>");
		output("\n\nHer ovipositor-cock swells visibly and a pinkish tint begins to spread over the tip - she’s definitely picturing it now, at least. Completely nude, you lean over her desk and present yourself just like you described. The half-myr’s eyes cloud. and Renvra clumsily makes her way over to you, jabbing her equine member into your [pc.butt] with the jerky motions of a cock so aroused that it’s on autopilot.");
	}
	else if(pc.isNice())
	{
		output("<i>“Are you thinking to pay me back for what happened before?”</i> you ask.");
		output("\n\n<i>“Of course I am,”</i> Renvra answers, smiling cruelly.");
		output("\n\n<i>“You can’t really be mad that I’d like to be treated a bit better. I mean, we are lovers,”</i> you assert.");
		output("\n\n<i>“Nah, I don’t care that much,”</i> she says. <i>“Truth is, I almost lost my mind with how good you were... right up until you fucked me over. But these fertilized eggs have to go somewhere.”</i> Her wicked smile returns. <i>“And I’ve been saving up that big batch of my get to ");
		if(x >= 0) output("stuff in your belly - I think you’re gonna be carrying a lot of my kids when you leave here.”</i>");
		else output("plug the hole with - just on the fraction of a chance that the eggs weren’t already fertile.”</i>");

		output("\n\nShe strokes her lengthy rod with relish, spreading the rosy pre-cum around so that it promises to set your nerves afire when it enters you. The anticipation shoots through you and down to your [pc.vagOrAss " + x + "], pulling your blood in its wake");
		if(!pc.isCrotchExposed() && !pc.isAssExposed()) output(", and you strip off your [pc.gear] dubiously");
		else output(", and you pat yourself on the back for dressing so... conveniently");
		output(", bending over the desk and hoping she’s as forgiving as she says... or else, your ass is in for a world of pain.");
	}
	else
	{
		output("<i>“Still toting that load?”</i> you ask, playfully.");
		output("\n\nStormclouds gather in Renvra’s expression. <i>“Yeah I fucking am. Thanks for the reminder, but I never forgot I owed you this monster dose.”</i>");
		output("\n\n<i>“Well, I only came back for it because you’re so unfailingly polite,”</i> you retort.");
		output("\n\n<i>“Yuk it up, spacer,”</i> says Renvra, jerking her dick with maybe a bit too much enthusiasm. <i>“I’m coming for that ass.”</i> She approaches menacingly as you remove your [pc.gear], bend over the desk, and waggle your [pc.butt] at her.");
	}
	output("\n\nRenvra’s hands lock onto your [pc.hips], claw-like, and her blood-engorged flare makes contact. Your body threatens to buckle as the her alien pre-cum leaves a perfect print of her tip, etched in drugged heat on your sensitive flesh.");
	output("\n\n<i>“I hope you had your fill of foreplay last time,”</i> Renvra says, pushing slowly forward. <i>“Because I did.”</i> ");
	if(!pc.isTaur()) output("Your hand reaches automatically for the huge cock as it begins to spread your hole, trying ineffectually to grip the slippery, pre-coated shaft, but is no match for either her enthusiasm or your own desire. ");
	output("With a pleased hum from the halfbreed, the spongy flare slides past your opening. She stops briefly to savor the first taste of your [pc.vagOrAss " + x + "], and you can feel more pre-cum spurt from her slit as the heat of your body begins to move her again.");
	output("\n\nRenvra, despite her words, seems to be set on torturing you with the inch-by-inch insertion of her agonizingly hot cock. Your [pc.chest]");
	if(pc.biggestTitSize() < 1 || pc.totalBreasts() == 1) output(" is");
	else output(" are");
	output(" pressed into the desk as the sheer length of her unyielding, egg-laying rod forces your body into a more complementary position - your [pc.butt] is sticking pervertedly in the air, and you clumsily shove papers and office supplies out of the way and onto the floor, trying to give yourself a flat, even surface to push back from when the inevitable thrusting begins.");
	output("\n\nA sloppy splat of pre-cum hits ");
	if(x >= 0) output("your cervix");
	else output("the deepest part of your colon");
	output(", leaving a trail of heat where it slid down your passage");
	var tooSmall:int = 0;
	if(x >= 0 && pc.vaginalCapacity(x) < renvra.cockVolume(0)) tooSmall = 2;
	else if(x < 0 && pc.analCapacity() < renvra.cockVolume(0)) tooSmall = 2;
	//Not too small - check to see if respectable.
	if(tooSmall == 0)
	{
		if(x >= 0 && pc.vaginalCapacity(x) < renvra.cockVolume(0) * 1.7) tooSmall = 1;
		else if(x < 0 && pc.analCapacity() < renvra.cockVolume(0) * 1.7) tooSmall = 1;
	}
	if(tooSmall == 2) 
	{
		output(", but Renvra continues pushing. <i>“You’re so fuckin’ shallow, spacer,”</i> she grunts, trying to force her tool deeper. You wince with pain-tinged pleasure as her drug-dripping flare smears venom ");
		if(x >= 0) output("on the entrance to your womb");
		else output("into the wall of your intestine");
		output(". <i>“No wonder you’re so good at handjobs - can’t hardly take a cock like a respectable nyrea.”</i>");
	}
	//(cap between 6-10in)
	else if(tooSmall == 1) output(", and Renvra gives one last token push, smearing venom around. <i>“Respectable,”</i> she says grudgingly, stirring her equine member inside you to intensify the drug delivery. <i>“For an off-worlder. No nyrea boy would be such a shameless slut if his cunt were this shallow.”</i>");
	else 
	{
		output(", and Renvra’s ballsack tickles your ");
		if(x >= 0 && pc.vaginas[x].clits > 0) output(pc.clitDescript(x));
		else if(x >= 0) output("labia");
		else output("taint");
		output(". <i>“Damn, it’s unusual to find such a good breeding slut outside the Federation camps,”</i> she says, squeezing your [pc.butt] in appreciation.");
	}
	// vag or anal stretch check
	if(x >= 0) pc.cuntChange(x,renvra.cockVolume(0));
	else pc.buttChange(renvra.cockVolume(0));

	output("\n\n");
	if(pc.isBimbo() || pc.libido() >= 80) output("You twerk your ass mercilessly at Renvra to caress her cockflesh with your hot passageway, less interested in whatever jingoist crap she has to say than in her magnificent tool thrusting into you as soon as possible. Renvra’s knees buckle as her flare catches a stroke from your insides.");
	else 
	{
		output("<i>“You’re just sheltered,”</i> you say");
		if(pc.isNice())
		{
			output(" politely, remembering some of the extreme bulges and toys you’ve seen");
			if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output(" and smuggled");
			output(".");
		}
		else output(" artlessly, trying to prick her pride.");
	}
	output("\n\nThe half-myr seems piqued. <i>“I hope you’re ready for that belly full of get,”</i> she grunts, sliding her hands from your [pc.hips] to your ");
	if(pc.isTaur()) output("abdomen");
	else output("waist");
	output(". You tense with excitement, anticipating what comes next. Renvra slides back out all the way to the flare, leaving a throbbing, horsecock-shaped void of arousal where your insides have been smeared with her myrrish pre.");
	if(pc.isBimbo() || !pc.isNice())
	{
		output("\n\n<i>“I’ve been ready,”</i> you tease. <i>“I was wondering when you’d get serious");
		if(pc.isBimbo()) output(" and punish my poor, abused hole");
		output(".”</i>");
	}
	//(nice)
	else output("\n\n<i>“I’m ready,”</i> you respond, nervously.");

	output("\n\n<i>“Good,”</i> says Renvra, leaning in. <i>“Because I’ve been so close to blowing since your little stunt that I could nut to a picture of an open purse.”</i> The herm slides her cock home again, more quickly this time, and then draws it out. You can feel the truth of her statement in your [pc.vagOrAss " + x + "] - her thick, horse-like tool is swollen with so much blood that you can feel the raised veins on its surface even through the heat haze of your intensifying high. She pumps, faster and faster, working your stretched hole so hard that it hardly has time to register the waves of pleasure and dumping her perverted pre-cum in you by the ounce.");
	output("\n\nHer statement sets your brain alight with fantasy; imagining the huge load of aphrodisiac she’s about to pump into you is making your [pc.vagOrAss " + x + "]");
	var wetHole:Boolean = false;
	if(x >= 0 && pc.wetness(x) >= 3) wetHole = true;
	else if(x < 0 && pc.ass.wetness() >= 2) wetHole = true;
	if(wetHole) output(" gush with sopping lube");
	else output("burn with eagerness");
	output(", wetly clamping down on her fat egg-prick and tormenting her sensitive flare every time she withdraws.");
	if(wetHole) output(" A splat of your fluid hits the floor audibly as Renvra’s cock forces it out with one final, violent thrust.");

	output("\n\n<i>“Fuuck!”</i> moans your lover, just before your insides light up. Waves of myr jizz pour into your [pc.vagOrAss " + x + "] as Renvra ejaculates, making your stretched cavity feel like a bottle of liquid fire. Your [pc.belly] swells as the myr mutt’s overstocked sexual organ delivers more than a double load of addictive spooge, pain completely erased by the incomparable arousal. You clench and thrash in climax, forced right into the same ecstasy as Renvra by the power of stroke after stroke of her alien sperm");
	if(pc.isNaga()) output("; your serpentine tail even wraps around her body, squeezing her with a vigor she either doesn’t notice or doesn’t care enough about to stop cumming");
	output(".");

	output("\n\nThe desk creaks as Renvra spends her wad and collapses onto you. The pressure of the half-myr’s heavy breasts ");
	if(pc.biggestTitSize() >= 1) output("crushing yours might be un");
	else output("might be quite ");
	output("pleasant, but you can’t even parse it with your head swimming in cum-induced delirium. More than once, a red fuzz encroaches on your vision and you almost slip into unconsciousness from overstimulation.");
	output("\n\n<i>“...Hey!”</i> shouts Renvra, slapping your face gently. You blink the fuzz away and try to slow down your mind to focus on her. <i>“You’re not done yet,”</i> she says. A lump pushes against your swollen ");
	if(x >= 0) output("labia");
	else output("anus");
	output(" and you look down, only to see the alien rubbing her bulging ballsack on it, equine ovipositor swaying in the air. The red delirium returns as you watch her egg-spewing cock swell from half-hard to fully erect again, and a voice cuts into your racing thoughts.");
	output("\n\n<i>“Time for the other load,”</i> Renvra announces. She lines her flare up with your [pc.asshole]");
	if(x < 0) output(" again");
	output(". Your muscles won’t even respond when you tell them to clench; the hybrid’s cock slides back into you, spreading your pucker wide and squirting aftershocks of cum into your gut that only make your drug trip worse. ");
	if(pc.analCapacity() < renvra.cockVolume(0)) output("The euphoria-inducing jizz makes you feel like jelly all over - you’re so slack that Renvra’s able to go past your usual capacity and jam her whole length into you with only a little effort.");
	else output("Even without the muscle-relaxing power of the half-myr’s venom-laced jizz, your deep asshole could easily take Renvra’s cock right down to the knot - with it, she slides in so fast that her egg-balls slap loudly against your [pc.butt].");
	pc.buttChange(renvra.cockVolume(0));

	output("\n\nIt gradually becomes clear that Renvra is thrusting once again... though, with your mind racing through tens of fantasies every minute, it feels like the pumps come only once an hour. The tip-off comes to you by the way the consciousness-dilating myr sperm sloshes and rolls in your ");
	if(x >= 0 && !pc.isPregnant(x)) output("womb");
	else output("belly");
	output(" every time your lover slams her egg-cock home - eventually, you complete the equation and realize that Renvra has been pounding your [pc.asshole] for long enough that her super-stiff dick is trembling and ready to burst with another load. <i>“One more push,”</i> grunts a voice from a universe away.");
	output("\n\nYour eyes widen as something other than lust finally takes hold: the very faintest, whispering protests of pain. Renvra’s knot pounds at your [pc.asshole], knocking politely yet insistently for admission. Whether you want it inside or not is irrelevant; with your body completely unresponsive, the only thing that matters is pure physics, and your stretched pucker is beaten-up and wet enough that it’s only a matter of time before... pop! The alien’s fleshy organ is inside you.");
	output("\n\n<i>“Fuck yeah,”</i> says Renvra. <i>“Gonna put these eggs where they should’ve gone all along.”</i> Lips press against your back as your lover leans into position to deliver a gut-busting load of fertile ova, and Renvra’s hands slide up your chest");
	if(pc.biggestTitSize() >= 1) output(", grasping and squeezing your [pc.chest] forcefully");
	output(". <i>“You made them, now... take... </i>responsibility<i>!”</i>");

	output("\n\nThe half-myr’s voice raises to a screech as eggs begin to rocket through her phallus. Her knot bulges arhythmically, pounding like a heart in a panic as lump after lump distends the flesh and shuttles down the shaft to impact in your guts with a bow wave of hot cum just ahead of it. Time unravels around you again as Renvra’s second load washes over you, and you quickly find yourself unable to count the eggs or do anything that isn’t drooling and thinking of the semen inside you spreading out infinitely and fertilizing new galaxies. Twenty eggs? Fifty? All the eggs that have ever existed in reality seem to be multiplying in your gut as your triple-dose of myr sperm expands your consciousness to infinite fuck-scenes, remembered and imagined, until it collapses to a black hole of all-consuming pleasure and you pass out.");
	output("\n\nRenvra seems to be moving her mouth and trying to get your attention, but in your new existence as a universe teeming with life and sex, you don’t have time to listen to her. In fact, you can’t hear her anyway...");
	processTime(55);
	pc.orgasm();
	pc.orgasm();
	//place ’Next’ here if desired
	clearMenu();
	addButton(0, "Next", renvraSuperCumPartII, x);
}

public function renvraSuperCumPartII(x:int = -1):void
{
	clearOutput();
	showRenvra(true);
	author("Zeikfried");
	output("The door clicks and your eyes flutter open. Renvra is standing there, smirking at you.");
	output("\n\n<i>“Awake now, spacer?”</i> she asks.");
	output("\n\nYou realize you’re still bent over her desk. Your gut throbs and moving brings a twinge of dull ache; you try to stand up but you’re practically glued to the furniture by sticky pink slime. Your belly sloshes, and the enormous loads of Renvra’s sexual fluids that were pumped into you come back in an aggravating flash.");
	output("\n\n<i>“Not that you don’t look hot draped on my desk with my cum drooling from your hole");
	if(pc.hasVagina()) output("s");
	output("...”</i> the half-myr begins, brushing your [pc.skinFurScales] with her fingers almost affectionately, <i>“...but you should ");
	if(!pc.isNude()) output("throw some " + pc.mf("pants","panties") + " on and ");
	output("get the fuck out - people in the neighborhood are starting to wonder why they never saw you leave the store.”</i>");
	output("\n\nYou nod dumbly, still high as a kite on myr venom, and collect your gear. Renvra steps aside as you move to take the door handle, but then grabs you and pulls you into a kiss.");
	output("\n\n<i>“Come back soon,”</i> she whispers.");
	//end, adjust lust, pass lots of time (over an hour, pref 3+), raise libido and sens
	pc.libido(1);
	processTime(125);
	//preg calc for Renvra vaginal pregnancy if vag present/not pregnant, bypass calc for guaranteed anal (egg) pregnancy
	//disable ‘Double Trouble’ button and re-enable ‘Make the Bitch Beg’ as well as any other scenes disabled
	//need guaranteed preggers for cunt if not already pregnant and guaranteed fertilized egg pregnancy for asshole. 
	renvra.impregnationType = "RenvraFullPregnancy";
	if (x >= 0) pc.loadInCunt(renvra, x);
	renvra.impregnationType = "RenvraEggPregnancy";
	pc.loadInAss(renvra);
	renvra.orgasm();
	imbibeVenomEffects();
	//Set her back to normal, disable double trubble
	flags["MADE_RENVRA_BEG"] = 1;
	flags["RENVRA_SEXED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
