//Delilah Gets Some TiTS

/*Outline / Notes
After the player breaks Delilah in on Tarkus, Beth will complete her feminization process and sell her to Kally on New Canadia Station. Any last vestige of Del’s willpower is utterly erased, and when the PC meets her there, she’s completely given into the cock-lusting whore Beth always knew was inside her.

Once you meet her and have some fun, it’ll be possible to give her a SynthSheath and upgrade her to Horsecock Shemale. Cuz why not.
*/

public function showDelString(nude:Boolean = false):String
{
	var bust_Append:String = "";
	if(nude) bust_Append = "_NUDE";
	// Trap
	if(MailManager.isEntryUnlocked("del_moved_light"))
	{
		return ("DELILAH_BOY" + bust_Append);
	}
	// Shemale
	else if(MailManager.isEntryUnlocked("del_moved"))
	{
		if(del.hasCock(GLOBAL.TYPE_EQUINE)) return ("DELILAH_SHEMALE_HORSE" + bust_Append);
		return ("DELILAH_SHEMALE" + bust_Append);
	}
	// Default
	else
	{
		return ("DELILAH" + bust_Append);
	}
	return "";
}
public function showDel(nude:Boolean = false):void
{
	showName("\n" + ((!MailManager.isEntryUnlocked("del_moved") && !MailManager.isEntryUnlocked("del_moved_light")) ? "DELILAH" : "DEL"));
	showBust(showDelString(nude));
}
//Content Pack Intro
//PC gets an email from Del, about a month after having “broken her in” on Tarkus. Once email is sent, remove Del from Tarkus.

//From: Del Crawford (Delray.Crawford.136572@Galnet.org)
//To: [pc.email]@SteeleTech.corp
//Subject: Change of Venue
public function delEmailString():String 
{
	return "Hi! I don’t know if you remember me with your big important space adventures and all, but I’m Delilah, the bartender from The Mess’s lounge on Tarkus. You helped show me what Bethany Carver was trying to (even though she was a bitch about it!) - mostly by putting me over the bar ;)\n\nSo I just wanted to let you know I’ve left Tarkus. Carver did some more procedures on me, and then sold me off to some kui-tan lady on a space station above Vesperia. I just landed a couple hours ago, and I’m about to go on my first shift. If you get a chance... it’d mean a lot if you stopped by. You helped me really <i>get used</i> to/at my old job, so maybe you could do the same again?\n\nHugs and kisses!\n\t~Del\n\n<i>Attached to the bottom of the email is a set of Warp Gate coordinates that mark the way to Canadia Station, high over Vesperia - a coreward planet colonized by humans centuries ago. What’s she doing way out there?</i>";
}
public function delLightEmailString():String
{
	return "Hi! I don’t know if you remember me, what with your big important space adventures and all, but I’m Del. The bartender from Tarkus. Carver told me to write you and thank you: apparently you convinced her not to modify me anymore, and sell me to someone that’ll take better care of me. So thank you. Thank you so much!\n\nShe’s just sold me to some kui-tan woman who owns a bar near Vesperia. I’m en-route there now. She seems nice, actually...\n\nIf you’re ever in system, come by Canadia Station. Your drinks are on me. :)\n\nBest,\n\tDelray Crawford\n\n<i>Attached to the bottom of the email is a set of Warp Gate coordinates that mark the way to Canadia Station, high over Vesperia - a coreward planet colonized by humans centuries ago.</i>";
}

//Del @ Kui Country Lounge
//Add to bar description if PC hasn’t met Del here before:
public function delBonus(num:Number):Number
{
	if(flags["MET_DEL_SHEMALE"] == undefined)
	{
		output("\n\nThere’s a chocolate-skinned beauty in a maid’s outfit prancing around the bar with a server’s tray balanced on her shoulder. She flashes most everyone who she brings a drink to a pink-lipped smile. A messy head of blonde-dyed hair bounces behind her, drawing your attention to a black leather collar around her neck.");
		//[Waitress]
		addButton(num,"Waitress",delCanadiaMeeting,undefined,"Waitress","That waitress looks awfully familiar. Could that be... Del?");
	}
	//Add to bar once PC has met ShemaleDel:
	else
	{
		output("\n\nDelilah is prancing around the bar, serving customers with her usual cheer. For someone who used to be so miserable, you take a small measure of pride seeing how happy she seems now. Seeing you standing around the bar, Del gives you a wink and, leaning over to serve a drink, a wiggle of her plumped-up booty that makes her short skirt ride high enough to show off her panties.");
		//Horsecock: 
		if(chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output(" Her massive equine member wiggles flaccidly between her legs, almost begging for someone to come over and give her a stroke.");
		addButton(num,"Delilah",delCanadiaMeeting,undefined,"Delilah","Del’s making her rounds, serving drinks with a shake of her hips and a smile on her lips. She keeps looking your way, though, clearly hoping you’ll give her some of the personal attention she craves...");
	}
	return num + 1;
}

//[Waitress]
//That waitress looks awfully familiar. Could that be... Del?
//First time only.
public function delCanadiaMeeting():void
{
	clearOutput();
	showDel();
	
	if(flags["TOOK_DELILAHS_BUTTGINITY"] != undefined && chars["DELILAH"].analVirgin) chars["DELILAH"].analVirgin = false;
	
	if(flags["MET_DEL_SHEMALE"] == undefined)
	{
		output("That couldn’t be Del, could it? She’s about the right height, same hair and chocolatey skin, same outfit... but you definitely don’t remember the crossdressing slave being so bouncy. Literally and figuratively: this girl’s packing some serious meat in her trunk, jiggling with every step, and her maid’s blouse is buttoned down enough to show off some serious cleavage. This girl’s gotta be packing D-cups at the very least, practically spilling out of her shirt.");
		output("\n\nShe must have caught you staring, because when you manage to pry your eyes off her tits, she’s flashing you a toothy, pink-lipped smile from across the room. The waitress sets her drink tray down and sashays your way, swaying your womanly hips seductively, her high heels clicking along the deck.");
		output("\n\n<i>“Oh my god, I didn’t think you’d actually come!”</i> she says, biting her lip as she closes the last few feet between you. <i>“Hi! Long time no see.”</i>");
		output("\n\nYou blink, staring at the bubbly girl right up through her ");
		if(pc.tallness >= 84) output("getting up on her tip-toes and ");
		//PC is 4 ft. or less:
		else if(pc.tallness < 48) output("leaning down and ");
		//else:
		else output("leaning in and ");
		output("planting a kiss on your cheek. You’re treated to a mix of sweet perfume and the smell of alcohol on her breath, lingering on your senses as she steps back, looking at you expectantly.");
		output("\n\n<i>“D-Del?”</i> you finally realize, wide-eyed. <i>“You look...”</i>");
		output("\n\n<i>“Like a woman?”</i> she finishes for you, planting her hands on her much-wider hips and thrusting out her deliciously expansive bust until her shirt threatens to pop. <i>“Yeah. Got you to thank for that. That bitch back on Tarkus had been pushing hard for me to let her <b>really</b> transform me, but I fought hard to stop her. Then you showed up, showed me what it was like to get treated like a woman... and I figured if people would be doing </i>that<i> to me all the time, then why bother fighting? All these transformations just make getting fucked by ");
		if(pc.mf("m","f") == "f")
		{
			if(pc.hasCock()) output("smoking hot futa babes");
			else output("strong women who know what they want");
		}
		else
		{
			if(pc.femininity >= 45) output("cute little twinks like me");
			else output("big strong men");
		}
		output(" that much better.”</i>");


		output("\n\nWell, it’s good to see she’s ");
		//hard/brute:
		if(pc.isAss() || pc.isBro()) output("finally accepted her place.");
		else if(pc.isMischievous()) output("started to have some fun with all this!");
		else output("made peace with her situation.");
		output(" You’ve gotta ask, though: if Beth did all that to get Del into her current form, what’s she doing all the way out here now?");

		output("\n\nThe waitress shrugs, leaning back on one of the nearby tables. <i>“Dunno. As soon as I got these beauties bolted on”</i> - she cups her ample chest, bouncing her tits in her hands - <i>“she said I was ‘finished,’ and she put me up for sale the very next day. Really weird. The owner of this place, Kally, picked me up on a contract auction on a whim I guess. I’m really just startin’ out here, but it’s already a heck of a lot better than that butthole of a planet I was on!”</i>");
		output("\n\nShe shudders in remembrance, but quickly returns her doe-eyed gaze to you. <i>“So, now that you’re here... wanna get a drink? Or maybe make me feel <b>really</b> welcome...”</i>");
		flags["MET_DEL_SHEMALE"] = 1;
		//Del’s menu here
		processTime(4);
	}
	else
	{
		output("<i>“Hey, ");
		if(pc.isBimbo()) output("cutie");
		else if(pc.isBro() || pc.isAss()) output("slut");
		else output("Del");
		output(",”</i> you say, grabbing a handful of Delilah’s plump rump under her skirt. She murmurs a sultry little moan and sidles up to you, pressing her chest against your arm.");
		if(chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output(" Her artificial equine member jumps with a rush of excitement, thumping softly against your [pc.leg].");
		output("\n\n<i>“Hey yourself!”</i> she purrs. <i>“Thirsty? Or just horny? I can take care of either... or both.”</i>");
		output("\n\nDel gives you a wink, waiting for your desire.");
		processTime(2);
		
	}
	//[Drink] [Talk] [Sex]
	//if has SynthSheath: [Give Item]
	delVesperiaMenu();
}

public function delBacksies():void
{
	clearOutput();
	showDel();
	output("Del shrugs, breasts jiggling. <i>“Is there anything else I can help you with?”</i>");
	delVesperiaMenu();
}

public function delVesperiaMenu():void
{
	clearMenu();
	addButton(0,"Drinks",drinkFromDel,undefined,"Drinks","Get a drink from the slutty waitress.");
	addButton(1,"Talk",talkToDel,undefined,"Talk","Sit and chat with Del.");
	if(pc.lust() >= 33) addButton(2,"Sex",sexWithKallysDel,undefined,"Sex","Take Del to pound town.");
	else addDisabledButton(2,"Sex","Sex","You aren’t aroused enough for that.");
	addButton(14,"Leave",mainGameMenu);
}

//Drink
//Get a drink from the slutty waitress.
public function drinkFromDel():void
{
	clearOutput();
	showDel();
	output("You tell Del you’re feeling thirsty, alright.");
	output("\n\n<i>“A drink? Sure, here’s what we’ve got on tap,”</i> Del says, flipping a handpiece out of her skirt’s pocket and projecting the menu across her cleavage, making sure you have to stare right at her softly moving breasts to pick out your drink of choice. <i>“See anything you want?”</i>");
	//Same drink choices as Kally has. If it’s before 18:00, add [Body Shots] option.
	kallyDrinkDisplay();
	delDrinkMenu();
}

public function delDrinkMenu():void
{
	clearMenu();
	if(pc.credits >= 6) 
	{
		if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) addButton(0,"*Doe-Eyed D",delDrinkPurchase,"Doe-Eyed Draught","Doe-Eyed Draught","Doe-Eyed Draught is a local microbrew produced in-house and flavored with our special additive. The warm amber beer bears a slight, hoppy flavor with a hint of almond. Sure to have you looking doe-eyed after a few drinks! 14% alcohol equivalency by volume.\n\nPrice: 6 Credits");
		else addDisabledButton(0,"*Doe-Eyed D","*Doe-Eyed Draught","That marking is suspicious. You should ask the bartender about it.");
	}
	else addDisabledButton(0,"*Doe-Eyed D","*Doe-Eyed Draught","You can’t afford that.\n\nPrice: 6 Credits");
	if(pc.credits >= 7) 
	{
		if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) addButton(1,"*N. Nookie",delDrinkPurchase,"Nutty Nookie","Nutty Nookie","A rich, nutty beer with a flavor that’s best described as chocolatey. Nutty Nookie’s aren’t for the faint of heart, as they contain 13% alcohol equivalency by volume and a generous helping of our secret ingredient to lend it a thicker, warmer afterglow.\n\nPrice: 7 Credits");
		else addDisabledButton(1,"*N. Nookie","Nutty Nookie","That marking is suspicious. You should ask the bartender about it.");
	}
	else addDisabledButton(1,"*N. Nookie","Nutty Nookie","You can’t afford that.\n\nPrice: 7 Credits");
	if(pc.credits >= 10) 
	{
		addButton(2,"V. Vapor",delDrinkPurchase,"V. Vapor","Vesperian Vapor","Like its namesake, a Vesperian Vapor is a light, crisp drink with a hint of citrous flavor hiding just beneath its bubbly effervescence. Contains 7% alcohol by volume.\n\nPrice: 10 Credits");
	}
	else addDisabledButton(2,"V. Vapor","Vesperian Vapor","You cannot afford that.\n\nPrice: 10 Credits");
	if(pc.credits >= 12) 
	{
		addButton(3,"Royal Red",delDrinkPurchase,"Royal Red","Royal Red","A foamy, crimson-colored beer with a bitter taste and the faintest hint of cherry. Royal Red is a common beer brewed locally on Vesperia. Contains 8% alcohol by volume.\n\nPrice: 12 Credits");
	}
	else addDisabledButton(3,"Royal Red","Royal Red","You cannot afford that.\n\nPrice: 12 Credits");
	if(pc.credits >= 20) 
	{
		addButton(4,"P. Pilsner",delDrinkPurchase,"Pneumatic Pilsner","Pneumatic Pilsner","Has a kick like a launch catapult and an afterglow like an engine nozzle. Imported from breweries on Tallax. 16% alcohol by volume.\n\nPrice: 20 Credits");
	}
	else addDisabledButton(4,"P. Pilsner","Pneumatic Pilsner","You cannot afford this.\n\nPrice: 20 Credits");
	if(pc.credits >= 22) 
	{
		if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) addButton(5,"*Kui Creamer",delDrinkPurchase,"Kui Creamer","Kui Creamer","Incredibly creamy with a mild sweetness that goes just right with a cold night by a warm fire. Kui Creamers are taken as a pair of shots. 21% alcohol equivalency by volume, with a concentration of our secret ingredient that’ll leave your heart fluttering.\n\nPrice: 22 Credits");
		else addDisabledButton(5,"*Kui Creamer","Kui Creamer","That marking is suspicious. You should the bartender about it.");
	}
	else addDisabledButton(5,"*Kui Creamer","Kui Creamer","You cannot afford this.\n\nPrice: 22 Credits");
	if(pc.credits >= 100 && hours < 18)
	{
		addButton(6,"Body Shots",bodyShotsWithDel,undefined,"Body Shots","Yeah, you see something you want alright.")
	}
	else if(hours >= 18) addDisabledButton(6,"Body Shots","Body Shots","It’s too busy to do this right now.");
	else addDisabledButton(6,"Body Shots","Body Shots","You cannot afford this.\n\nPrice: 100 Credits.");
	addButton(14,"Back",delBacksies);
}

public function delDrinkPurchase(drink:String):void
{
	clearOutput();
	showDel();
	var special:Boolean = false;
	switch(drink)
	{
		case "Doe-Eyed Draught":
			pc.imbibeAlcohol(28);
			special = true;
			addLoveyDoveWithAlcohol();
			pc.credits -= 6;
			break;
		case "Nutty Nookie":
			pc.imbibeAlcohol(26);
			special = true;
			addLoveyDoveWithAlcohol();
			pc.credits -= 7;
			break;
		case "V. Vapor":
			pc.imbibeAlcohol(14);
			pc.credits -= 10;
			break;
		case "Royal Red":
			pc.imbibeAlcohol(16);
			pc.credits -= 12;
			break;
		case "Pneumatic Pilsner":
			pc.imbibeAlcohol(32);
			pc.credits -= 20;
			break;
		case "Kui Creamer":
			pc.imbibeAlcohol(42);
			special = true;
			addLoveyDoveWithAlcohol();
			pc.credits -= 22;
			break;
	}
	output("You swipe the creds over to Del. He swiftly rushes off to make your drink, returning with ");
	if(drink != "Kui Creamer") output("an ice cold glass of " + drink);
	else output("shot glasses of " + drink);
	output(". ");
	switch(drink)
	{
		case "Kui Creamer":
			output("You take them one after the other, surprised at how pleasant they taste. There’s no real alcoholic kick, just the smooth heat of Kally’s creamy drinks.");
			break;
		case "Nutty Nookie":
			output("It goes down slow but smooth, leaving you with a warm, rich feeling settling into your stomach.");
			break;
		case "V. Vapor":
			output("It’s a lovely drink that you can take your time with, swirling the beverage around in your glass in between sips.");
			break;
		case "Royal Red":
			output("The thick head clings to your upper lip with every sip, but you lap it up after every swallow. It’s bitter, just like the drink, and subtly flavorful.");
			break;
		case "Doe-Eyed Draught":
			output("You suck down a long pull of the opaque amber beverage. It’s good. Damned good. You take another few swallows before slapping it down and belching, remembering your manners too late to excuse yourself. The bartender grins.");
			break;
		case "Pneumatic Pilsner":
			output("You knock back a gulp of it and nearly screw up your face from the sharp, alcoholic kick. It feels like it uses your tonsils for a punching bag and sandpapers the inside of your throat, leaving both raw from the intense beating. Nevertheless, as you drink it, you begin to appreciate the warm glow spreading through your body.");
			break;
	}
	processTime(4);
	delVesperiaMenu();
}

//[Body Shots]
//Yeah, you see something you want alright
//Costs 100 Credits

public function bodyShotsWithDel():void
{
	clearOutput();
	showDel();
	output("<i>“I see something I want alright,”</i> you grin, reaching forward and grabbing the slutty waitress’s tits in both hands. She gasps, then smiles, and wiggles her shoulders, making her boobs jiggle in your grasp.");
	output("\n\n<i>“I thought you might say that,”</i> she giggles, reaching back to the bar and grabbing a bottle off the shelf. She and Kally exchange a look, and when their gazes turn towards the bar, you notice that this early in the day, there’s almost nobody around. That, and the dim lighting of the cozy taven’s corners, make a perfect combination for you and Del to get naughty, just like old times.");
	output("\n\nYour trained " + (MailManager.isEntryUnlocked("del_moved") ? "shemale" : "trap") + " takes your hand, guiding you over to one such shadowy corner where a table and chairs are pressed against the wall, hidden from view - as comfortable as Del might be with getting creamed by a dozen men in public, you guess the owner isn’t so keen on you two disrupting her business. ");
	if(pc.exhibitionism() >= 66) output("Too bad... but you suppose you can let a cheap thrill like a backwater audience pass you by this time.");
	else output("Not that you’re complaining.");
	output(" Smiling seductively, Del shimmies up onto the table and leans back, legs spread ");
	if(chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("so that her massive prick can dangle down, almost reaching the floor. You delight in seeing a trickle of white already forming at the flared head of her femme-cock. That’s almost worth a drink right there...");
	else output("to reveal the ever-so-slightly tented panties under her skirt, stained with an excited little drop of pre.");
	output(" Oh, she must be desperate for your touch if she’s that hard already!");

	output("\n\nSlowly, sensually, Del starts unbuttoning her blouse, groping her tits and running her palms down her tight belly as she goes. Her stiff, chocolate-brown nipples peek out before long as her shirt falls aside on her shoulders, leaving all that flawless flesh on display for you, begging to be touched. Who’re you do deny a body so perfectly sculpted to be a " + pc.mf("","wo") + "man’s plaything? You join her in running your hands across her bare flesh, cupping her breasts and pinching her dark teats. A pair of gold rings run through them, inviting you to tug on them by their very presence. Del gasps and moans, rolling her head back and biting her lips to keep from drawing every gaze in the place to her quivering, half-bare body.");
	output("\n\n<i>“B-Beth really upped the sensitivity on those!”</i> she shivers. <i>“O-oh God, don’t stop!”</i>");
	output("\n\nYou grin down at her, watching her ");
	//horsecock: 
	if(chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("equine erection thump heavily against your [pc.leg]. A squirt of musky white cream splatters across your [pc.foot], and that’s just the dam breaking: cum keeps pouring out, first in a deluge and then in a steady trickle of aftershots. Del grabs her mouth, muffling an orgasmic cry as she dumps a stallion’s load all over your [pc.legs].");
	else output("tiny little bitch-clit strain so hard against her panties that you can’t help but yank them down, letting her cock pop free. It’s so much smaller than when you first met, but it’s just as hard as it’s ever been, and with a few more tweaks and squeezes on her pierced nipples she’s squirming and leaking all over your [pc.legs]. You don’t get a <i>proper</i> orgasm from her, but by the time you’ve had your fill of her perky tits, Del’s thighs are covered in a sheen of sweet shemale cream.");
	output("\n\nNow that you’ve gotten the over-sensitive dickgirl more than ready, it’s time for the main course. You pop the cork on the bottle Del brought with her and hand it to her, telling your slutty server that you’re thirsty.");
	output("\n\n<i>“Yes " + pc.mf("sir","ma’am") + "!”</i> she smiles, shivering as a particularly thick bit of cum leaks from her dick. Del leans back again, propping herself up on an elbow and squeezing her tits together with her shoulder. Once positioned, she upends the bottle, pouring a steady trickle of clear liquor through the cleft between her tits and down her belly. You lean on down, licking clean a stray strand of Del’s jizz off the rim of her navel before the river of booze reaches your [pc.tongue].");
	output("\n\nThe taste of your " + (MailManager.isEntryUnlocked("del_moved") ? "bimbo" : "trappy") + " lover is sweeter than the ambrosia she trickles into your mouth, but you lap that up all the same, running your tongue from her crotch to her navel in long, steady licks. Del shivers, ");
	if(!pc.hasHair()) output("caressing your scalp");
	else output("running her fingers through your [pc.hair]");
	output(" and squeezing her slender legs around your shoulders. Her ");
	if(chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("drooling equine dick");
	else output("girly little prick");
	output(" throbs under her skirt, squirting all over her thighs.");

	output("\n\n<i>“W-why am I getting off on this so much?”</i> she giggles, crossing her ankles behind your back, pulling your [pc.face] into her liquored-up belly. <i>“Whatever! Just don’t stop till this bottle’s empty.”</i>");
	output("\n\nYou grin up at her, drawing your [pc.tongue] along the underside of a breast, then around a rock-hard nipple. You loop your tongue through her ring piercing, giving it a tug until Delilah redirects the flow of liquor down her tits. You don’t really bother drinking it anymore; the booze is a bonus on top of tongue-bathing the dusky slut, teasing her over-tender flesh until she’s gasping and her dick is squirting again.");
	output("\n\nDel lets the bottle clatter on the table, grabbing her mouth to keep herself from squealing in pleasure. Her cock’s a leaking faucet now, pouring out the content of her ");
	if(chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("hefty black horseballs");
	else output("trappy pouch");
	output(" all over the floor. You just hook your fingers through her other ring and tease the perky teat underneath it, making her scream with orgasmic pleasure into her hands. You can almost feel the eyes burrowing into your back from across the bar, watching you and the topless transgirl, but ");
	if(pc.exhibitionism() >= 66) output("that only makes her sensual cries all the sweeter!");
	else output("you’re in too deep to stop now!");

	output("\n\nYou make sure Delilah drains every last drop onto the floor, teasing her until her balls are utterly spent and her cock is limp as a noodle between her sweat-and-booze-slicked thighs. When she’s finally finished, Del collapses back on the table, breathing hard; you spend the next few minutes licking her clean, leaving her half-naked body glistening in the dim, sultry light of your less-than-private retreat.");

	output("\n\n<i>“Oh my god,”</i> Del groans, rubbing her face. <i>“My balls huuuurt.”</i>");
	output("\n\nYou laugh drunkenly and slap her thigh, telling her to get dressed - people are staring.");
	output("\n\n<i>“Let ‘em,”</i> she laughs, sitting up and running a hand through her messy blonde hair. <i>“I should go take a shower or something. Thanks for emptying my nuts, [pc.name]. Maybe next time you’ll give my ass a little attention, huh?”</i>");
	if(pc.hasCock()) output("\n\nOh yeah. You’re coming for that ass next.");

	processTime(25);
	pc.changeLust(33);
	pc.imbibeAlcohol(42);
	addLoveyDoveWithAlcohol();
	pc.credits -= 100;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Talk
//Sit and chat with Del
public function talkToDel():void
{
	clearOutput();
	showDel();
	output("You pull up a seat next to Del and lean back on the bar. <i>“Got a few minutes to chat?”</i>");
	output("\n\n<i>“For you? I guess I can make time,”</i> she grins, sliding into your lap and putting an arm around your shoulders. <i>“As long as we do something fun after.”</i>");
	output("\n\nWell, that sounds like a deal...");
	processTime(2);
	delVesperiaTalkMenu();
}

public function delVesperiaTalkMenu(arg:int = -1):void
{
	clearMenu();
	addButton(0,"Kally",askDelAbootKally,undefined,"Kally","Ask about the Lodge’s owner, and Del’s new mistress.");
	addButton(1,"Beth Carver",bethCarverDiscussionWithDel,undefined,"Beth Carver","Now that Del’s free, what can she tell you about her old mistress.");
	addButton(2,"Herself",delTalksAboutHerself,undefined,"Herself","Now that Del’s in better shape, maybe she could tell you a little bit about herself?");
	addButton(3,"Future",askDelAboutTheDel,undefined,"Future","Ask Del what she plans to do if and when she gets free.");
	addButton(14,"Back",delBacksies);
	if(arg != -1) addDisabledButton(arg,"Talk Over","Talk Over","You just finished that talk.");
}
//Kally
//Ask about the Lodge’s owner, and Del’s new mistress.
public function askDelAbootKally():void
{
	clearOutput();
	showDel();
	output("<i>“So what do you think of your new mistress?”</i>");
	output("\n\nDel puts a finger to her chin, thinking for a few moments. <i>“Well, Miss Kally actually gives me a pretty fair shake, unlike that bitch back on Tarkus. Ugh! She even pays me enough that I can squirrel away a little for myself every month. Plus, she’s the one who finished what you started. I don’t know if she was even trying, but she helped make sure there was nothing left of the old, hairy dude-Del in me.”</i>");
	output("\n\n<i>“At first, I thought I was saving up for a masculizer once I got free, but... about the hundreth time I was on my knees, coughing up one of Kally’s enormous loads all over these huge tits of mine, blowing my own load all over my thighs while I’m getting hammered off all that sweet, boozey kui-cream going down my throat...”</i> Del pauses, visibly shuddering... and tenting the front of her miniskirt. <i>“Well, I realized I don’t wanna go back. Not after you showed me how to be a woman.”</i>");
	output("\n\nShe smiles mischeviously and reaches behind the counter, taking out a big black box nearly the size of her forearm. <i>“So I blew all that money I’d saved up on the biggest dildo on the station. That way even after Miss Kally’s done giving me a cum-snack, my boy-pussy never has to be without something big and thick stretching it open. Speaking of which,”</i> she smirks, spinning on a high heel and grinding her plump ass into your crotch. <i>“What do you say about helping me break it in? Or just breaking me in again... Miss Kally’s nice and all, but my first cock’ll always be the best.”</i>");
	processTime(8);
	delVesperiaTalkMenu(0);
}

//Beth Carver
//Now that Del’s free, what can she tell you about her old mistress.
public function bethCarverDiscussionWithDel():void
{
	clearOutput();
	showDel();
	output("<i>“Since you’re out from under her thumb now, mind telling me more about that woman, Carver?”</i>");
	output("\n\nDel visibly shudders. <i>“Sure, if you really want. Ugh, just thinking about that big-titted skank makes my skin crawl. She’s a slaver - like, an actual real slaver - I’m sure of it. The way the other girls I was with talked about her, she’d constantly be trying to screw you into going deeper and deeper into debt. Make you buy mods, pay huge prices for rent... you’re supposed to give debtors a way to pay their way to freedom, but she’s just like any stupid corporation: she’ll fuck you until you’re hers forever.”</i>");
	output("\n\nIf that’s the case, why’d Carver let her get away?");
	output("\n\n<i>“It was... weird. After I finally caved and let her pump me full of feminizers, she said I was ‘finished’ right after, and just sold me out of the blue. It’s like... like the whole point of her having bought me and done all this to me was to make me into a cock-hungry slut of a girl just for the sake of it. Maybe she gets off on it?”</i>");
	output("\n\nDel giggles at the thought. <i>“I wish I knew more about that bitch, though. Her whole operation was so skeezy, but I don’t have any actual proof of what she was doing. If I did, I’d be at the Peacekeeper office before you could blink!”</i>");
	output("\n\n<i>“Anything else you can tell me?”</i>");
	output("\n\nShe pauses to think for a moment more, then shrugs. <i>“I’m sorry, [pc.name]. Wish I could be more helpful!”</i>");
	processTime(9);
	delVesperiaTalkMenu(1);
}

//Herself
	//Now that Del’s in better shape, maybe she could tell you a little bit about herself?
public function delTalksAboutHerself():void
{
	clearOutput();
	showDel();
	output("<i>“Me?”</i> Del grins when you ask her. <i>“Took you long enough to get curious! Let’s see, I was born on Sorrexia, but I went to school on Librim. It’s a huge metropolis planet, cities as far as the eye can see, with some of the best art schools in the galaxy. That’s what I was there for: art. Well, starship electronics systems originally, but I hated it so much that after three years I finally just had to switch majors. Of course, that meant I was going way over my scholarships, so...”</i>");
	output("\n\n<i>“So that’s how you and Carver got involved.”</i>");
	output("\n\nShe nods sadly. <i>“Yeah. I figured I could pay off a loan right after I got outta college. Sell a few pieces, or start taking commissions, but things didn’t really work out. Maybe I was a little naive thinking I could afford a place on Librim, and my studies, and... yeah. It didn’t take long to run up way more debt than I could pay off. But hey, at least I had someone like you to help me learn to work off my debt with my asshole. Way better tips for takin’ dicks than serving drinks.”</i>");
	output("\n\nAlright, well, <i>“Enough about slavery, then. Tell me more about <b>you</b>.”</i>");
	output("\n\n<i>“What more is there to say? I, um, I like painting and I’m a pretty decent bartender - and a pretty decent lay, thanks to you. I’ve got an older brother out in the Rush, a sensor technician on a little independant scout ship. Umm... my folks run a computer shop back on Sorrexia! I dunno, what else did you wanna hear?”</i>");
	output("\n\nThat’ll do for now. You guess Del doesn’t have much to say when it doesn’t involve suckin’ or fuckin’.");
	processTime(8);
	delVesperiaTalkMenu(2);
}

//Future
//Ask Del what she plans to do if and when she gets free.
public function askDelAboutTheDel():void
{
	clearOutput();
	showDel();
	output("<i>“So, now that you have a decent mistress, are you starting to get some plans for the future?”</i>");
	output("\n\n<i>“I don’t know,”</i> she says, shrugging lightly. <i>“Kind of? I still have a lot of debt to pay off, and when I do... I don’t exactly have a lot going for me, you know. Guess I’d have to move back in with my parents for a little bit, find a job somewhere, or go work for them. Just till I get back on my feet.”</i>");
	output("\n\nYou nod. <i>“And after that?”</i>");
	output("\n\n<i>“Well, I’d like to get back to painting,”</i> she laughs. <i>“Maybe take up cum as my new medium: ");
	if(chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("I’ve got pretty much an infinite supply now!");
	else output("Considering how good I am at getting it now, it’s not like I’d ever run out!");
	output("”</i>");
	output("\n\nDel giggles at her own joke, but something tells you she’s not <i>entirely</i> kidding. You suppose stranger things have been committed to canvas...");
	output("\n\n<i>“Other than that... maybe I oughtta join one of those ‘People for the Ethical Treatment of Slaves’ groups. Having been on the wrong end of one of these evil debt-slave contracts has definitely given me a new perspective on how shitty people with power can be to people without. What happened to me coulda been a lot worse... at least I ended up enjoying it in the end. Thanks to you, anyway. I can’t imagine if I hadn’t.”</i>");
	processTime(7);
	delVesperiaTalkMenu(3);
}

//Sex
//Take Del to pound town.
public function sexWithKallysDel():void
{
	clearOutput();
	showDel();
	output("You grab a rough handful of Del’s plumped-up ass, pulling the dusky shemale against you. She’s so used to being man-handled by you that all you get is a gasp and a giggle as her hands play across your [pc.chest].");
	output("\n\n<i>“Ooh! Hey there,”</i> she purrs, reaching down to grab your crotch. <i>“Find something you want?”</i>");
	processTime(2);

	clearMenu();
	if(pc.hasCock())
	{
		if(pc.cockThatFits(chars["DELILAH"].analCapacity() + 200) >= 0) addButton(0,"Buttfuck Her",fuckDelsAss,undefined,"Buttfuck Her","Fuck her ass.");
		else addDisabledButton(0,"Buttfuck Her","Buttfuck Her","You’re too big to fuck her ass.");
	}
	else addDisabledButton(0,"Buttfuck Her","Buttfuck Her","You need a penis");
	if(pc.hasVagina()) addButton(1,"Face Sitting",sitYoBootyOnDelsFacebooty,undefined,"Face Sitting","Sit on Del’s Face.");
	else addDisabledButton(1,"Face Sitting","Face Sitting","You need a vagina to really enjoy this.");

	if(del.hasCock(GLOBAL.TYPE_EQUINE)) addButton(2,"Giddyup Del!",giddyupDel,undefined,"Giddyup Del!","Take your newly horse-equipped shemale slut and her big, equine dick out for some slutty fun.");
	//Give Delilah a Horsedick
	//If the PC has a SynthSheath in their inventory, add [Horsecock?] to Del’s talk menu
	else
	{
		if(pc.hasItemByClass(HorseCock)) addButton(2,"HorseCock?",giveDelilahAHorsedick,undefined,"Horse-Cock?","Poor Delilah’s dick is barely more than a bitch-clit now, and you’ve got this equine dick-sheathe in your pack. Maybe you could give Del an upgrade?");
		else addDisabledButton(2,"HorseCock?","Horse-Cock?","You need to have an item that can give her a horse-dick for this.");
	}
	if(pc.mf("him","her") == "her" && !pc.analVirgin && pc.hasCock()) addButton(5,"Public Use",delSlutTraining,undefined,"Public Use","Kallly’s customers look a little pent up! You and Del could take care of them all with your asses, just like old times.");
	else if(pc.mf("him","her") != "her" || pc.analVirgin || !pc.hasCock()) addDisabledButton(5,"Public Use","Public Use","Slut training requires you to be feminine, dick-equipped, non-anal virgin so that you can show Delilah how it’s done.");
	else addDisabledButton(5,"Public Use","Public Use","It’s a little early in the day to be getting into something like this.");

	addButton(14,"Back",delCanadiaMeeting);
}

//Fuck Her Ass
public function fuckDelsAss():void
{
	clearOutput();
	showDel(true);
	moveTo("CANADA7");
	var x:int = pc.cockThatFits(chars["DELILAH"].analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("<i>“How about you let me play with this new ass of yours?”</i> you say, grinning lustfully at the curvy bimbo-body pressed up against you. <i>“For old time’s sake.”</i>");
	output("\n\n<i>“How ‘bout just for ‘I’m horny as hell’s’ sake?”</i> she giggles, grinding against you in excitement at the prospect of another taste of your bitch-breaking cock. At your word, she obediently slips out of your lap and back to the baths, spinning around to present her hindquarters to you, getting more than a few cat-calls from her customers as she makes ready for her upcoming ordeal. Her chocolate-hued cheeks flush as she slips her hands up under her skirt... and slips her panties right down. Tossing the pink silk aside, she chews her lips, awaiting your command. ");
	if(chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("Her massive equine endowment throbs half-hard between her legs, dangling out from under her skirt.");
	else output("Del moans breathlessly, rubbing at her tiny prick through her skirt, eeking out some pleasure for herself while you enjoy the show.");

	output("\n\nYou reach forward and under her skirt, groping her ass with both hands. Using your thumbs, you spread her chubby cheeks, revealing the dark little cock-hole nestled between them. Her dick throbs under your inspection, drooling a little streak of white onto the hem of her skirt. Cute. You snake one of your thumbs into her crack, gently pressing it against her well-used hole - just enough to make her gasp and get nice and hard, but not enough to actually spread her open. Not that it would take much, considering how much cock this " + (MailManager.isEntryUnlocked("del_moved") ? "shemale" : "trap") + "-slut’s seen since you first met.");
	output("\n\n<i>“You’re gonna want to get me ready,”</i> you suggest, giving her a playful slap that sets her bubbly cheeks jiggling.");
	output("\n\nDel spins on her high heels and grins. <i>“Yes, " + pc.mf("sir","ma’am") + "!”</i>");
	output("\n\nShe eagerly drops to her knees, already oh so eager for a taste of your cock. She opens wide, ready to receive your package. You step forward, tossing your equipment onto a bench and grabbing your [pc.cock " + x + "]. A few fast strokes have you at the ready, the turgid shaft of your prick looming over the " + (MailManager.isEntryUnlocked("del_moved") ? "bimbo" : "trappy") + " whore’s face, your crown practically pushing against her lips. She only manages to hold herself back for a few seconds before her tongue stretches out, caressing the crown of your cock.");
	output("\n\n<i>“My favorite snack! Mmm, I love the taste of your cock...”</i> she purrs, nuzzling the shaft of your [pc.cock] affectionately as her tongue lavishes it with affection. <i>“The first... and the best...”</i> she adds happily, planting a kiss on the tip. You shudder as the sensation of her tongue on your most sensitive flesh snakes through your body, and you’re forced to grip a rail to support yourself, [pc.legs] shaky under the startlingly skilled ministrations of the " + (MailManager.isEntryUnlocked("del_moved") ? "bimbo" : "trappy") + " slut.");
	output("\n\n<i>“Juuust like that,”</i> you moan through clenched teeth, trying to control yourself. Your fingers snake through the whore’s blonde-dyed hair, coaxing her on as she licks and kisses at the underside of your member, slowly but surely working herself up to taking it wholesale. ");
	if(pc.balls > 1) output("But first, she lets a hand wander free up one of your [pc.legs], caressing the tender flesh slowly as she works up to your base, hands cupping your swinging sack, rolling your nads between her dainty little fingers. The slutty, dusky whore grins up at you, her mouth trailing kisses down your girthy length until she can lap at your [pc.balls], lavishing your hefty nuts with the tip of her eager tongue before opening wide and swallowing them up, suckling on your gonads like a pair of teats. You groan and shudder, trying not to cum as your sexy shemale slut sucks on your sack like the pro she’s turned out to be.");

	output("\n\nFinally, the cock-craving whore makes her way back up to the crown of your cock, slowly opening her lips to welcome in your manhood and ");
	if(chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("spreading her knees to giver her hands access to her throbbing equine hardon. She’s well and truly used to everyone in the bar oggling her horsecock, just like they do to her mistress, so she shows no shame in wrapping both hands around her member and stroking it from flare to medial ring.");
	else output("blatantly spreading her legs, one hand fully disappearing under her skirt and up her wanton hole in preparation, teasing her tiny masculinity from behind and making it jump in response. The surge of her erection wholly throws back the hem of her skirt, leaving her cock for all to see");
	output(". You guide her forward, easing her lips around the swell of your schlong, shuddering as you feel her wet, warm embrace wrapping around you, sucking and squeezing oh-so-wonderfully. Gods, she was born for this! You stifle a little moan as she ");
	if(pc.cocks[x].cLength() < 12) output("takes you to the hilt, your [pc.cock " + x + "] vanishing down her throat");
	else output("sucks up every inch she can manage, choking down more than a foot of cockmeat before finally giving in, her throat utterly bulging with your massive girth stretching her pussy-like gullet wide.");

	output("\n\n<i>“Good little slut,”</i> you coo, stroking her bleach-blonde hair. <i>“You’ve gotten so good at this. I bet Kally just loves you.”</i>");

	output("\n\nShe murmurs a response, muffled by the thick cock in her mouth into an unintelligible babble that sends trickles of pre-slick drool down her chin. You chuckle and pat her on the head, reassuring her as to what a good little cocksucker she is as you gently guide her back from your prick until just the crown is spearing her lips. You give her a little push, pressing her back against the hard front of the bench as you shift forward, getting ready to get a right proper cock-shining. With her head against the solid wood, there’s nowhere for her to recoil as you slam your hips forward, thrusting your prick into her mouth");
	if(pc.balls > 1)
	{
		if(pc.cocks[x].cLength() >= 12) output(" until her throat is bulging with your massive meat, so much crammed down her that she looks ready to burst");
		else output(" until your [pc.balls] slap her chin");
	}
	output(". The " + (MailManager.isEntryUnlocked("del_moved") ? "bimbo" : "trap") + "-slut gags and cries out as she’s suddenly and violently face-fucked, but the growing crowd around the two of you cheers as you fill her mouth with cock.");

	output("\n\nThe " + (MailManager.isEntryUnlocked("del_moved") ? "busty" : "trappy") + " bartender’s got little to do but sit and take it, slumping against the bench as you hold her head steady, using and abusing her mouth as your own personal warm, wet cocksleeve. Your thrusts soon have the poor lady-boy drooling freely, spittle rolling down her chin and onto the ");
	if(!chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("tiny tent");
	else output("massive, throbbing shaft");
	output(" of her cock, which she’s now feverishly working, abandoning any masquerade of restraint under the punishing beat of your oral assault. You grin down at the dickgirl whore as she jacks off, too horny to stop herself.");

	output("\n\nWith your cock sufficiently slathered with her spit, and with Del herself all nice and hard and ready to fuck, you steadily slow your pelvic thrusting, finally stopping with the head of your cock on her lips.");

	output("\n\n<i>“Kiss it,”</i> you command, holding the shemale slut’s gaze as your cock sits of the swell of her lower lip expectantly.");

	output("\n\nDel doesn’t hesitate, planting a tongue-filled parting kiss on the crown of your cock. She wraps her lips around the head one last time, making sure to slather it with her tongue. By the time she’s through, a thick sheen of spit’s glazed across your tender flesh, bridges of it still connecting you to the dusky slave-girl.");

	output("\n\nWith your cock nice and lubed up thanks to Delilah’s succulent little mouth, you grab the " + (MailManager.isEntryUnlocked("del_moved") ? "busty shemale" : "slender girly-boy") + " by the shoulder and heft her up onto the bench, letting her ample ass press hotly onto the polished wood. She gives you a questioning look... until your hands slip up her slender legs, hooking through the hem of her skirt and gently pulling it off, leaving her bare to the world. Or at least, the growing circle of interested spectators, many of whom are pitching tents ");
	if(!chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("by the time the bartender’s tiny little cock pops free,");
	else output("much like Del’s own horsecock, which is");
	output(" left to hang flag-pole like as you push her down and spread her legs to give yourself a clear shot to the real prize on offer. You hoist her legs over your shoulders and step up to the plate, your [pc.cock " + x + "] dropping into the crevasse between her thigh and groin before dragging down to the gently-parted crack of her succulent little ass.");

	output("\n\n<i>“Go on,”</i> Del coos, wiggling her hips enticingly as your crown presses into her dark star, practically being drawn in by her well-used hole, <i>“I’m soooo ready for it. Ram it on in!”</i>");

	processTime(21);
	pc.changeLust(50);
	clearMenu();
	addButton(0,"Next",delGetsButtplowedAtKallysPart2,x);
}

public function delGetsButtplowedAtKallysPart2(x:int):void
{
	clearOutput();
	showDel(true);
	output("You figure the little whore can have it her way this once. You wrap your hands around her quaking hips and push in; one slow, long stroke that tears a shriek of wild pleasure from her as you spear her on your [pc.cock " + x + "], thrusting deep into her writhing ass. Her back arches, voice breaking as you fuck yourself deep into her little asshole, until ");
	if(pc.cocks[x].cLength() >= 13) output("her stomach is bulging from the massive, throbbing prick buried in her, stretching her asshole until she’s apt to break in half");
	else if(pc.balls > 1) output("your [pc.balls] slap against her cheeks, your shaft fully buried");
	else output("your hips press into hers, your shaft fully buried");
	output(". She cries out, fingers digging into the edge of the bench as you settle inside her, giving her a few seconds to adjust to your girth before you start to move.");
	
	pc.cockChange();
	
	output("\n\nBut that’s the last kindness you’re going to show this wanton whore’s little pucker. You draw yourself only half-way out before slamming back home, thrusting back with all the force your [pc.hips] can muster, sending shockwaves through the flesh of the lusty slut’s bubble butt. Her prick jumps in response to your next thrust, hopping straight up and twitching visibly as a bead of creamy white beads at its tip. You consider giving her a little tug to help her along, but then... that’d defeat the purpose! This slut’s supposed to be a little anal whore, so by God that’s what she’ll be. You reaffirm your grip on her broad hips and start pounding with a vengeance, faster and harder until Del’s whining and moaning with every push, crying her pleasure aloud with utter abandon. You can barely reconcile the bashful little trap you met back on Tarkus with this moaning, giggling whore, spilling cum all over her own belly as you pound her ass.");
	
	if(flags["TOOK_DELILAHS_BUTTGINITY"] == undefined && chars["DELILAH"].analVirgin) output("\n\n<b>You have taken Del’s anal virginity!</b>");
	stretchDelilahsButt(true);
	
	output("\n\nBetween the sloppy blowjob she gave you and now the tight, wringing grip of the shemale’s cock-draining boypussy, you don’t know how long you’re going to hold out. Her ass feels like a vice, so tight around your [pc.cock " + x + "] that it’s nearly painful, yet with every thrust you can feel the twitch and spasm of her muscles as her little sphincter tries to push you out or draw you in, you’re never sure. Either way, it’s making a tight, wet, squirming hole for you to fuck, ushering you inexorably towards your now-inevitable orgasm.");
	output("\n\nYou feel your cock swelling inside her, cum rushing through your [pc.cock " + x + "] towards the waiting receptacle of the " + (MailManager.isEntryUnlocked("del_moved") ? "bimbo" : "trap") + "-whore’s wanton hole. She seems to sense the oncoming climax, and responds with a shrill yelp of pleasure, her own cock twitching madly, so close yet so far from orgasm. She reaches up and grabs your shoulders, clutching tightly at you as you flood her bowels with cum. Shockwaves of pleasure tear through your body as [pc.cumColor] ropes let loose from your [pc.cock], smearing the " + (MailManager.isEntryUnlocked("del_moved") ? "shemale" : "trap") + "’s rectal walls with your sticky seed. Your [pc.hips] piston away, thrusting you as deep into her ass as you can go before you’ve finished, making sure to bust your nut straight into her spasming colon, giving it a taste of cum before you’re finally finished.");
	output("\n\nYou shudder with an absolute contentment, panting heavily as your cock starts to deflate in Delilah’s well-fucked ass. Before you can get comfortable, though, the sultry slut gives you a gentle push back, popping your prick free of her gaping asshole amidst a backwash of spent seed. Grinning hungrily, Del slips down off the bench and onto her knees, wrapping both her hands around your half-soft cock.");
	output("\n\n<i>“Don’t wanna waste any of the good stuff,”</i> she grins, flicking her tongue around the glaze of [pc.cum] still clinging to your [pc.cockHead " + x + "]. You shiver and grab the bench, trying to keep steady footing as the cum-hungry dickgirl spit-shines your rod, bobbing her head up and down your length until she’s cleaned off every last drop of your [pc.cum]. Once your dick is glistening-clean, Del gets down on all fours and starts wiping the spent spunk off the floor, her clothes, and her own cock... really just the entire, messy splatter-zone you two have left. She happily slurps up every drop, no matter where it’s been or who it’s from. More than one of the gathered onlookers adds to the mess, too - busting their own loads over Del’s back, her face, or just onto the floor for her to clean up - and she’s never looked happier.");
	output("\n\nIt doesn’t take long before somebody’s hoisted her back onto the bench and thrust into her still-open asshole, using your cum as lube to ream her hard. You give Del a little wink and step back, collecting your gear and leaving her to satisfy her owner’s horny patrons.");
	processTime(20);
	pc.orgasm();
	
	timesDelilahSexed(1);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sit on Del's Face
//Now works for [pc.vagOrAss]. PC still needs a gender tho.
public function sitYoBootyOnDelsFacebooty():void
{
	clearOutput();
	showDel(true);
	author("Savin");
	moveTo("CANADA7");
	output("You grin lustily at the feminized beauty pressed up against you, letting your hands wander down her back and over her jiggly behind. As nice as her ass is, your eyes fix on another prize: her full, pink-hued lips, glistening in the sultry light of the rustic lodge.");
	output("\n\n<i>“Why don’t you get up on the bar for me, cutey?”</i>");
	output("\n\nThe bartender babe blushes, practically melting into your arms, all but begging to be shown her proper place underneath you once again. <i>“Miss Kally said I had to stop doing that in the common area, but the baths are okay... This way.”</i>");
	output("\n\nYou follow behind, slapping her on the ass to speed her on her way. Neither of you pays much attention to the doorway as you pass through it, only each other and a nearby bench that’s just the right height. She obediently clambers up onto it, getting more than a few cat-calls from lounging bathers as she makes ready for her upcoming ordeal, cheeks flushed bright red as she slips her hands up under her skirt... and slips her panties right down. Tossing the pink silk aside, she chews her lips, awaiting your command and trying not to ");
	//hosscawk;
	if(chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("draw too much attention to the pillar of meat starting to get hard between her legs.");
	else output("give away the fact that her little knee-skirt is tenting something awful.");

	output("\n\nYou step forward, tossing your ");
	if(pc.isAssExposed()) output("gear");
	else output("[pc.assCovers]");
	output(" onto the bar and hopping up behind the effeminate bartender, giving her a little push onto her back. She gives a little gasp as she flops down, legs spreading reflexively, giving you easy access to the tight, dark hole between them. But that’s just an added bonus. You’re much more interested in her cute little mouth...");

	output("\n\nYou crawl up her svelte, buxom body, slowly pulling up her skirt to leave her groin and hips bare. The ");
	if(!del.hasCock(GLOBAL.TYPE_EQUINE)) output("tiny little cock");
	else output("hefty equine erection");
	output(" she’s packing ends up pointing skyward like a flagpole, and its owner squirms and moans as you leave her prick exposed to the bar crowd, now slowly gathering around you. Looks like you’ve got an audience!");

	if(pc.exhibitionism() >= 66) output(" Hot.");
	else output(" Oh well... you’ll just have to try and perform regardless!");
	output(" You plant your ");
	if(pc.legCount > 1 && pc.hasKnees()) output("[pc.knees] ");
	else output("[pc.legs] ");
	output("on the " + (MailManager.isEntryUnlocked("del_moved") ? "shemale" : "trap") + "’s shoulders, pinning her down to the bar for a moment as you ditch the last of your gear, making a bit of a show if it for your new fans - especially as you get down towards your groin. You can already feel the heat welling up inside you, eagerly awaiting a taste of the submissive little slut’s tongue");
	if(!pc.isChestExposed()) output(", and as the last bits of your equipment fall aside, it’s a sweet relief to let it kiss the cool air.");

	output("\n\nThat’s not the only thing that’s going to be kissing it, either. You let a pair of fingers slink down to your ");
	if(x >= 0) output("[pc.cunt " + x + "], spreading the lips of your labia wide just shy of the " + (MailManager.isEntryUnlocked("del_moved") ? "bimbo" : "trap") + "’s chin, almost close enough to let your excitement drool down into her lips.");
	else output("[pc.asshole], fingering your rim and pushing in against your own dark star, just to the knuckle, before withdrawing and presenting your ass to the slutty bartender.");

	output("\n\nDel blushes, licking her lips. <i>“I love the taste of ");
	if(x >= 0) output("your pussy juices");
	else output("another slut’s ass");
	output(", [pc.master],”</i> she coos, eyes transfixed by your ");
	if(x >= 0) output("slit");
	else output("ring");
	output(". Slowly, her tongue slips out from her dark lips, one long slurp across your [pc.vagOrAss " + x + "]. You shudder as the sensation of her tongue on your most sensitive flesh snakes through your body, and you’re forced to grip the bar to support yourself, [pc.legs] shaky under the startlingly skilled ministrations of the " + (MailManager.isEntryUnlocked("del_moved") ? "bimbo" : "trappy") + " slut. Maybe in her previous life, she might have been pretty popular with the ladies...");
	if(x < 0) output(" Or maybe the jocks at her school just used her to tongue-clean them enough that she got good at it. Would explain a lot.");

	output("\n\nYou let yourself give a little moan as the " + (MailManager.isEntryUnlocked("del_moved") ? "bimbo" : "trap") + "-slut goes down on you, tongue delving deep ");
	if(x >= 0) output("between your folds");
	else output("into your [pc.asshole]");
	output(". <i>“That’s it, girl... Now, why don’t we have you do the alphabet?”</i>");
	output("\n\n<i>“Mmhm!”</i> Del grins, going to work immediately, putting her hard-earned skills to use without much more prompting than that. What a good ");
	if(x >= 0) output("rug-muncher");
	else output("ass-licker");
	output(" you’ve made!");

	output("\n\nNice and slow, your subby slut starts to do as you commanded, tongue working out a great big <i>“A”</i> inside your [pc.vagOrAss " + x + "]. You glance over your shoulder, to the rigid stiffy poking out from beneath the hem of Deliliah’s skirt. Something in your memory jogs a thought about positive reinforcement, and you reach under the bar to pick up the feather duster hanging on a nail. Nice. You reach behind your [pc.hips], teasing along her flat stomach until you feel the soft feathers brushing the silky skirt... and then something nice and hard.");

	output("\n\nDelilah reacts instantly, legs twitching and tongue freezing as you brush her ");
	if(del.hasCock(GLOBAL.TYPE_EQUINE)) output("little cock");
	else output("growing pillar of horsemeat");
	output(". <i>“Who told you to stop?”</i>");

	output("\n\nIn return, you stop your brush mid-stroke, the head of her cock entombed in a bed of feathers. With a soft groan, the " + (MailManager.isEntryUnlocked("del_moved") ? "busty" : "trappy") + " bartender starts to move her tongue again, forming <i>“M”</i> and <i>“N,”</i> the tops of those letters treading awful close to your ");
	if(x >= 0) output("[pc.clit]");
	else output("prostate");
	output(", sending shivers up your spine. You return the favor, circling her cock with your duster, even reaching back to tease her balls and thighs when she gets to a delightfully slow <i>“Q”</i> and <i>“R.”</i>");
	output("\n\n<i>“You just keep getting better at this,”</i> you grin, taking pride in your work in breaking Del in, molding her into this submissive, horny whore. <i>“Now, make me cum, and I’ll do the same for you.”</i>");
	output("\n\nThat’s all the encouragement she needs to lunge for <i>“Z,”</i> tongue working deeper and deeper into your [pc.vagOrAss]");

	var wet:Boolean = false;
	if(pc.wetness(x) > 0) wet = true;
	if(wet) output(", face getting more and more drenched with your excitement ");
	output("as her talented tongue works its wonders. You decide to give her a little reward, relaxing yourself and letting go, trying to cum by the time she hits that final letter. [pc.Hips] bucking and chest heaving with your quickening breath, you find yourself on the precipice before you know it, and just as her tongue forms the back of the <i>“Z,”</i> your [pc.vagOrAss] starts to contract, all but trapping her tongue between its walls as your start to climax, throwing your head back with a cry of pleasure");
	if(pc.isSquirter() && x >= 0) output(" as Delilah’s face is plastered with girlcum");
	output(".");

	output("\n\nBut you’re not letting her off the hook this early. Shuddering, you try to recover yourself as the dickgirl’s head rests back, thinking herself done. Not quite!");

	output("\n\n<i>“That was the English alphabet,”</i> you grin, swinging around to a reverse-cowgirl post over her head. <i>“Now let’s see about the Ausar alphabet.”</i>");

	output("\n\nYour thighs are nice and drenched, but it doesn’t stop your oral protege from going back to work, now half-mad from lust and pleasure as you start back on her cock, one hand wrapping around her ");
	if(!del.hasCock(GLOBAL.TYPE_EQUINE)) output("tiny little trap-sack");
	else output("black, veiny horseballs");
	output(" as the other dusts off her glans, wiping away the accumulated pre-seed on its tip. The two of you soon come to something of a rhythm: for every curve of the flowing ausar script, another squeeze of the sack or a flick of the featherduster. Your pace picks up as she gets closer and closer to the edge, hips twitching up as you squeeze and massage her balls, steadily milking out what promises to be a nice, big load from the " + (MailManager.isEntryUnlocked("del_moved") ? "bimbo" : "trappy") + " fuck-slut.");
	output("\n\nWhen she cums, it’s everything you were hoping it would be. With a cry and a buck of her hips, the cock in your hand erupts into a geyser of spooge, drenching the duster and your fingers in a nice, thick layer of creamy spunk. She gives a final gasp and slumps back, having finally achieved a sweet release. You swing your [pc.hips] back around, looking down on her blissed-out face, cum-dumped featherduster still in hand.");
	output("\n\n<i>“You got me dirty,”</i> you chide, putting a spunky fingertip to her lips. She opens wide for you. <i>“You gotta clean up after yourself, little girl.”</i>");
	output("\n\n<i>“Delicious,”</i> she grins, tongue lapping up her salty seed like a good little whore. You make sure your hands are spotless before swinging off the bar, hiking her legs off the edge to put her ass in the air for the next customer. She gives a sharp cry of pleasure as she’s quickly speared on a dick, leaving you to get your gear and catch your breath.");

	processTime(24);
	pc.orgasm();
	timesDelilahSexed(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Giddyup Del!
//Requires you’ve given Del a horsewanger-danger-bo-banger.
public function giddyupDel():void
{
	clearOutput();
	showDel(true);
	author("Savin");
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	output("Though you’re holding Del close, running your hands over her svelte, sweetly feminine body, your attentions wander to something unmistakably masculine starting to press against your [pc.leg], wafting up the musky, bestial scent of animalistic arousal. All you need do is reach down and grab it, wrapping your fingers around the stiffening shaft of equine meat hanging brazenly from underneath Del’s skirt. Even if she wanted to, Delilah couldn’t pack such a majestic beast-cock into that slutty little number she’s wearing, so she’s shamelessly letting it swing free, just like her owner.");
	output("\n\nNow that she’s close to her favorite lay, the horsecock’d hussie is getting nice and hard, even without your direct attention. Feeling you assertively grab her animal-cock, squeezing the soft, silky skin between your fingers, draws a submissive moan from the shemale in your arms. You feel her dick throb with unabashed need, drooling a little streak of white over your wrist.");
	output("\n\n<i>“This thing still good for more than flopping around while you get fucked?”</i> you whisper into her ear, slowly stroking her under her skirt. Del shudders and gasps, biting her lip to hold back another moan before someone else hears her.");
	output("\n\nWhen she finally composes herself, it’s with a husky, heavy breath. <i>“You wanna take a ride ");
	if(silly) output("on my little pony");
	else output("on this big ol’ stallion");
	output("? Nobody here ‘cept the taurs ever seem interested in something so big! Heh, puts my old dick to shame, and I still can’t get any pussy.”</i>");
	output("\n\nYou nod, whispering into Del’s ear all the dirty things you could think of doing with a huge cock like hers. After all, you didn’t <i>just</i> give that piece of equipment to her to see it wobble around while she takes it in the ass. That’s just a bonus. A very sexy bonus.");
	output("\n\nDel’s cheeks are already flushed by the time you’re done. It’s nice to see you can still find a way now and then to embarrass the cock-craving dickgirl. You hook a hand under her ass and give it a squeeze, telling her to lead the way to somewhere where her mistress won’t mind her making a mess.");
	output("\n\n<i>“I know the perfect place,”</i> she whispers, taking your hand and leading you into the Lodge’s restroom.");

	//set location to be gloryhole room.
	moveTo("CANADA6");

	output(" It’s a unisex affair, with several stalls across from sanitation stations. She hurriedly leads you into a very deliberately chosen stall, and you soon see why: cushions are scattered all over the floor, drawing your attention to several industrial drains and a distinct lack of actual toilet. And, a moment later, to the holes drilled in the sides of the stall, just about cock-sized...");
	output("\n\nDel flashes you a grin and flops down on the pile of cushions, sighing as she settles into her pillowy nest. <i>“I come here sometimes when I get a, um, a ‘craving’ for some nice cum and Kally’s too busy to have some fun,”</i> she admits. <i>“The regulars’ve gotten used to following me in here when I go on break, I think. Hope you don’t mind if I tend to any extra dicks that pop in?”</i>");
	output("\n\nOf course not. You training Del to be a good public cum-dump, after all. Far be it for you to stand between her and her life’s purpose.");
	output("\n\n<i>“Just as long as I have most of your attention,”</i> you add, slinking down over your slutty prize and planting a kiss on her pink lips. While your down there, you play your hands up her maid uniform’s blouse, unbottoning it and slipping your hands in to find those big breasts Beth bolted onto her chest. Delilah gasps when your fingers find her dusky nips, teasing the golden rings now pierced through them, and you feel the pillar of horsemeat between her legs jump, thumping against your thigh. Something wet comes with it, smearing across your [pc.skinFurScales] and leaving you with a heady, masculine aroma that seems far too virile, too <i>manly</i> to be coming from the big-titted bimbo under you.");
	output("\n\nYou lick your lips, looking down at the dickgirl under you with a hungry, predatory smile. You need the source of that man-musk inside of you, pumping the contents of her churning black balls into your [pc.vagOrAss " + x + "]. Greedy for her cock now, you rip Del’s shirt open and yank her panties off, freeing every inch of aromatic beast-dick into your waiting hands. You grasp her by the medial ring, pumping Del’s shaft with slow, deliberate strokes. It doesn’t take long until the flared crown twitches, spitting out another thick, steaming glob of pearly horse-cum that drools back down her shaft. A little flick of your wrist and dance of your fingers, and you’re easily able to spread the stuff all across the silky beast-flesh, lubing Del up with her own pre.");
	output("\n\n<i>“That feels good. Too good!”</i> Del moans, bucking her hips and thrusting her dick into your hands. As tight as your holding her, and as lubed as she is, your hand might as well be a mare’s drooling pussy the way she starts hammering.");
	output("\n\n<i>“Someone’s horny,”</i> you chide, taking your hands completely off Del’s cock. There’s a good two or three seconds afterwards of her haplessly thrusting into the air, dick bobbing about under its own weight, before she fully realizes she’s wasting her breath.");
	output("\n\n<i>“W-what?”</i> she whines, eyes popping open and looking up at you, wide and needy. <i>“I can’t help it! You’re too good at handjobs!”</i>");
	output("\n\nIs that all? She’s not a dirty, horny whore who gets off on being on bottom?");
	output("\n\nShe mewls, <i>“I-I am! I am!”</i>");
	output("\n\nThen wouldn’t she much rather have that obscene cock of hers inside someone, rutting and breeding like the animal she is?");
	output("\n\nDel nods breathlessly, groping weakly at your [pc.hips], trying to urge you into taking her member.");
	output("\n\n<i>“Good girl,”</i> you coo, happy she remembers her place. Slowly, deliberately, you rise up on your [pc.knees] and position the cum-soaked flare of Del’s dick against your [pc.vagOrAss " + x + "]. With barely a squeeze, a wet, sticky mess spreads out down your thighs and all over your ");
	if(x >= 0) output("twat’s lips");
	else output("asscheeks");
	output(", making sure you’re more than amply prepared for the coming ");
	if(silly) output("horsecockalypse");
	else output("stretching");
	output(". Del moans and shudders underneath you, twitching with pleasure as you milk her dick for all that sweet, slick pre-cum.");

	output("\n\nJust as you’re about to drop down on Del’s shaft, you hear the restroom door bang open, followed by a long slither-scrape on the polished floor. You blink and crane your neck down, glancing under the divider as whoever - or whatever - just came in enters the stall adjacent to yours. All you can see is a long, sinuous mass of scales, a serpentine body that’s easily a couple yards from tapered tail to a broad, undulating body that rises out of view. Some kind of naga, you guess.");
	output("\n\nThere’s a feminine grunt from the other side of the of the divider, and you hear a buckle coming undone. Del flashes you a giddy little grin and props herself up on her elbows, suddenly more interested in your neighbor than the [pc.vagOrAss " + x + "] pressing against the flare of her synth-dick. You reach down and grab the glittering chain between Del’s nipple-rings, giving them a rough tug to reclaim your cock-craving lover’s attentions. Del yelps, arching her back and squirting a thick spurt of seed all over your [pc.leg].");
	output("\n\nThe snake-woman on the other side of the partition takes notice, and you hear some scraping about on the other side. <i>“Oh, someone in ‘zere?”</i> she says, <i>“Good! I hope you are hungry, ‘cause I ‘ave not cum in days.”</i>");
	output("\n\nA skirt-like garment drops heavily to the floor, and a moment later, a pair of red, bulbous dicks poke through the padded gloryhole. They’re clearly attached to the same person, sprouting from one point just under their thick bases and spreading out in a ‘V’ shape to a pair of tapered crowns. Del doesn’t waste a moment in reaching up and wrapping her fingers around one dick, and her plumped-up pink lips on the other.");
	output("\n\n<i>“Oh my!”</i> the naga gasps. <i>“Very good, chere.”</i>");
	output("\n\nYes, very good. You give Del’s nips another tug, twisting her chain around in your hand until she has to rise up, nearly jamming those big, jiggly tits of hers into your [pc.belly]. She desperately tries to keep working the naga’s double dicks, but now you’ve got her rapt attention back, eyes wide and staring");
	if(pc.biggestTitSize() >= 1) output(" at your [pc.breasts]");
	output(".");

	output("\n\n<i>“S-sorry,”</i> she whispers, putting her free hand on yours.");

	processTime(25);
	clearMenu();
	addButton(0,"Next",rideDelCowboy,x);
}

public function rideDelCowboy(x:int):void
{
	clearOutput();
	showDel(true);
	author("Savin");
	output("That’s more like it. You steady Del’s obscene cock between your [pc.legs] and start lowering yourself down, letting her flared horse’s crown");
	if(x >= 0) output(" spread your pussylips, opening your wet-and-ready flower and slowly gliding in");
	else output(" press against your ass. You slowly, deliberately relax your anal muscles, letting yourself open up and swallow the first inches of Del’s slick shaft");
	output(". The stretch is incredible - the feeling of being split apart on a stallion’s cock, forcing your body to distend and spread around its massive girth. You draw in a sharp breath, trying to muffle a moan, but the irresistible pressure forces one from your lips no matter how hard you try to hold back.");
	if(x >= 0) pc.cuntChange(x,del.cockVolume(0));
	else pc.buttChange(del.cockVolume(0));

	output("\n\n<i>“Don’t have <b>too</b> much fun, chere,”</i> the naga laughs. As she does, you hear new footfalls - several of them, in fact, marching in perfect sync towards the stall on the other side of yours. Unlike the naga’s deliberate disrobement, whoever’s on the other side of the second divider doesn’t waste any time in pushing... something... through the gloryhole. Not a dick, per se, but it quickly becomes clear all those feet belong to a ‘taur: a big, puffy black donut hole of an ass and a pair of huge, melon-sized fuzzy balls poke through, huge enough to block sight of his dick.");
	output("\n\n<i>“Hey, Del,”</i> a soft male voice says from the ‘taur’s side of the divide. <i>“Got a hand free for me?”</i>");
	output("\n\nDelilah pops her mouth off one of the naga’s cocks just long enough to chirp, <i>“Sure, Dustin! Just make sure you got a rubber on for my snack!”</i>");
	output("\n\nThe ‘taur boy chuckles and wiggles his hips, making the enormous pair of gonads sway from side to side. <i>“Always!”</i>");
	output("\n\nYour " + (MailManager.isEntryUnlocked("del_moved") ? "bimbo" : "trappy") + " partner gives you a wink and sets to work: she switches her mouth and one hand around on the naga’s cocks and reaches up with her other hand, running her fingers through the thin, silky-soft fur on the taur’s balls. Their owner moans and clatters his deer-like feet on the tiles, his pitch rising higher as Del starts gently squeezing and caressing his balls, rolling the melons in her hand with all the loving affection you expect from such a broken-in cumslut.");
	output("\n\nDelilah’s right at home worshipping three masculinities all at once, and you... well, there’s nowhere you’d rather be right now than bottoming out on Del’s massive dick, feeling your body desperately squeezing around her mass. The horse-hung shemale doesn’t need to do much at all to give you your pleasure: she bucks and rocks her hips, thrusting her massive dong into your [pc.vagOrAss " + x + "] with lightning-quick strokes, splattering your thighs and the cushions beneath you with a steady stream of her freely-flowing pre");
	if(x >= 0) output(" and the pussy-juices she’s fucking out of you");
	output(".");

	output("\n\nSkilled cock-sucker as she is, it isn’t long before Del’s not the only one hosing the stall with spunk.");

	output("\n\nThe naga next door gasps, and the divider shudders as her hands grab at it, trying to steady herself. You can see her reptilian dicks bulging and throbbing through the gloryhole, though, and a second later Del’s cheeks bulge with a sudden rush of fluids, and a single quick spurt of pearly spooge shoots from the reptilian dick in her hand. Del gasps as the money-shot splats on her face, smearing all over her lips and cheeks and running in thick, drooling ropes that leak down her neck into a nice, thick pearl necklace.");
	output("\n\n<i>“Yum!”</i> Del purrs, licking her neon-pink lips clean of the naga’s cumshot. Her eyelids flutter, and you feel the biggest throb yet come through her cock. You moan, putting a hand on your [pc.belly], feeling her dick moving inside your distended ");
	if(x >= 0) output("womb");
	else output("bowels");
	output(".");

	output("\n\nIs she going to cum from <i>getting cummed on</i>? Your eyes go wide, and sure enough, a moment later you feel a rush of heat pouring into your [pc.vagOrAss " + x + "]. Del yelps and arches her back, accidentally squeezing the taur-boy’s balls enough that you hear his dick slapping his chest on the other side with a whinney of pained pleasure.");

	output("\n\nDel’s synthetically grown horse-balls much have been packed to the brim with cum, because a half-second after her first shot fills you, your belly is swelling with her equine load. More cum spills out of your gaping hole, pooling under Del’s ass and leaking into the drain. The dusky slut curses under her breath, gasping and moaning as she empties her balls into you, and the naga pumps a pair of built-up loads all over her face.");

	output("\n\n<i>“I’m glad you like,”</i> the naga pants. Her twin snake-cocks start slowly softening, retracting through the gloryhole into their owner’s cloaca. <i>“You’ve a very lovely mouth!”</i>");
	output("\n\nDel trembles from the compliment - or maybe just the last bits of cum leaking onto her tits - and shifts her mouth and free hand to the big-balled ‘taur on the other side. It takes a little adjustment, but Del hefts herself up and you put your arms around her, helping to hold her up while she works. Her hands each wrap around one of the ‘taur’s cum-swollen balls, and her tongue lances out, pressing insistently against that big, black donut of an asshole until it disappears into the puffy ring. You hear a moan from the other side, and the whole divide shudders with the impact of a pony-man’s hindquarters. Guess he likes a little anal attention!");
	output("\n\nYou squeeze your arms around Del’s shoulders and focus your attentions back on what’s important: getting off. Your belly’s full of sloshing, steamy cum, making your belly jiggle every time you bounce on Del’s dick - but that only adds to the experience of getting fucked by her stallion’s member.");
	if(pc.biggestTitSize() >= 1 && !pc.canLactate()) output("\n\nYou pull Del’s face into your tits, burying her in a marshmallow hell that bounces and jiggles with every buck of your [pc.hips]. She struggles to keep tongue-fucking her tauric customer’s ass, but her hands are as steady as ever, working to massage his engorged gonads with all the fervor of a hopeless cumslut.");
	else if(pc.biggestTitSize() >= 1) output("\n\nYou’ve got a better job for Del’s mouth than pleasuring centaur booty. You grab her by the back of the head and pop her off of Dustin’s butt and onto your [pc.nipple]. Del sucks in a breath in surprise, but the action just causes [pc.milk] to bead around your teat. Del starts drinking without further prompting, suckling on your [pc.breast] and working her ‘taur’s balls with equal fervor.");

	output("\n\nYou close your eyes and rest your head against Del’s slender shoulders, letting your body take care of everything on instinct. Delilah’s still nice and hard inside you, unable to lose her post-coital hardon with your ");
	if(x >= 0) output("pussy");
	else output("ass");
	output(" squeezing and milking her. Not while her balls have any of that sweet horsy cream still in ‘em anyway! It doesn’t take long before you get everything you wanted from the " + (MailManager.isEntryUnlocked("del_moved") ? "shemale" : "trap") + "-stallion: you cum, hard, screaming your pleasure into Del’s dirty blonde hair and ruffled uniform. You’re vaguely aware of another huge burst of hot spunk plowing into your ");
	if(x < 0) output("bulging gut");
	else output("cum-packed womb");
	output(", forcing a backwash of steamy cream to pour out around her throbbing cock; a high-pitched whine comes from somewhere nearby, and you feel Del’s arm muscles working hard on Dustin’s balls. The metal divider shudders and shakes as the ‘taur boy finds his climax too, all from Del’s skillful fingers.");

	output("\n\nWhen you come down off your orgasmic high, you let the exhausted weight of your cum-stuffed body drag you down into the cushion-pile - and crushing Del underneath you. She moans and squirms, and you feel a wet, sliding slab of meat finally pop free of your [pc.vagOrAss]. You sigh as your body starts to resume its proper shape, nuzzling into Del’s ample chest while you catch your breath.");
	output("\n\nBefore you can get up again, you hear a rubbery <i>pop!</i> from the other stall, and then something big, soft, and heavy plops onto the back of your head. You grab it before Del manages to, and find yourself looking at a pumpkin-sized condom filled to bursting with pony-spunk.");
	output("\n\n<i>“Th-thanks Dusty!”</i> Del calls as the tauric boy clops his way out of the restroom. <i>“See ya in a bit.”</i>");
	output("\n\nNow seemingly alone with each other in the restroom, Del makes grabby hands at the stuffed condom. You flash a dirty grin down at her and deftly pop the latex package, spilling its contents all over Del’s bare chest and face.");
	output("\n\n<i>“Drink up!”</i> you command, pouring ‘taur-cum all over the subby shemale. Obediently, she opens her mouth and lets you empty the remaining contents of the condom directly down her throat. She swallows eagerly, enjoying what’s left of her well-earned snack.");
	output("\n\nOnce you’re done, you stagger up and grab your gear, leaving Del in a veritable lake of spooge to clean herself up.");
	output("\n\nThen again, as you’re leaving you make way for a gang of a half-dozen ausar men going past you into the restroom. Maybe Del’ll be occupied for a while longer...");
	processTime(24);
	pc.orgasm();
	if(x >= 0) pc.loadInCunt(del, x);
	else pc.loadInAss(del);
	timesDelilahSexed(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Give Delilah a Horsedick
//If the PC has a SynthSheath in their inventory, add [Horsecock?] to Del’s talk menu
//Tooltip: Poor Delilah’s dick is barely more than a bitch-clit now, and you’ve got this equine dick-sheathe in your pack. Maybe you could give Del an upgrade?
public function giveDelilahAHorsedick():void
{
	clearOutput();
	showDel(true);
	author("Savin");
	if(flags["DEL_HORSE_OFFERED"] == undefined)
	{
		output("You nonchalantly run a hand up Delilah’s leg, teasing your fingers on her thigh before reaching up under her short little skirt. The bartender’s eyes go wide when you go further, wrapping your hand around her package. It’s easy to do: she doesn’t have much left below the belt, just a little pouch of nuts and a tiny, soft prick that’s maybe the length of your thumb when its soft. Your hand wraps around the entirety of her equipment, squeezing just enough to make Del’s back go rigid, and she gasps. Her dick twitches against your palm, instinctual arousal rising at your touch.");
		output("\n\n<i>“Mmm, hey there,”</i> she murmurs, nuzzling her cheek into your [pc.chest]. <i>“You know that’s not good for much these days. Why don’t you let me use my mouth or ass for you instead?”</i>");
		output("\n\n<i>“Tempting,”</i> you say, rubbing your thumb along her slowly stiffening bitch-clit. <i>“But what if we gave this an upgrade?”</i>");
		output("\n\nAnother squeeze makes Delilah gasp, and she shudders visibly. <i>“W-what do you mean?”</i>");
		output("\n\nYou swing your pack off your shoulder and flip open the top, revealing the enormous synthetic dick you’re toting around. Del’s eyes go wide, taking in the equine majesty flopping around in your backpack. She reaches down and touches it, moving hesitantly as if half-expecting it to jump up at grab her. Running her fingers along its life-like synth-flesh, Del looks up at you with questioning eyes. <i>“What is it?”</i>");
		output("\n\n<i>“A present,”</i> you tell her with a grin. <i>“Something to give you a little masculinity back.”</i>");
		output("\n\nShe blushes, and you feel her small cock getting rock-hard in your hand. <i>“So like, a strapon?”</i>");
		output("\n\n<i>“Kinda! Wouldn’t you like to be able to fuck <b>and</b> get fucked sometime? Double the pleasure, double the fun.”</i>");
		output("\n\n<i>“That </i>sound<i> fun,”</i> Del says after a moment’s though. <i>“But wasn’t the whole point of... of everything you and Beth and everyone else did to make me all girly? Doesn’t that, like, defeat the purpose?”</i>");
		output("\n\nWell, that might’ve been Carver’s purpose. You, though... you have your own designs for the slutty little shemale.");
		output("\n\nDel spends a few moments more thinking things over before she gets a big, dopey smile. <i>“Okay! You talked me into it. This thing’s way bigger than what I was packin’ in the first place... but I got a condition.”</i>");
		output("\n\nYou cock an eyebrow. <i>“Oh?”</i>");
		output("\n\nShe nods, and a clever smirk spreads on her plump pink lips. <i>“If I put this on, I’m gonna fuck ya! Fair’s fair, right?”</i>");
		output("\n\nWell... what else were you gonna give her a horsecock for?");
		flags["DEL_HORSE_OFFERED"] = 1;
	}
	//Second Attempt+
	else
	{
		output("<i>“Hey, Del,”</i> you say, setting your pack down on the barstool next to you. <i>“Thought any more about my offer?”</i>");

		output("\n\n<i>“Huh?”</i> she says, blinking.");

		output("\n\nYou flip open the top of your pack and nod towards the synthetic horsecock still set aside for her. Del blushes and squirms in your lap, gazing at the massive horse-dong with appreciable awe. You can tell she wants it, tenting herself under her skirt... though maybe she’s thinking about getting reamed by it more than wearing it herself.");
		output("\n\n<i>“Whadda ya say?”</i> you whisper into her ear, reaching under her skirt to tease what’s left of her pathetic little masculinity.");

		output("\n\nShe thinks for a moment, trying not to squirm too much under your teasing. <i>“I think my offer from last time stands,”</i> she finally says, giving you a surprisingly cocky grin... which evaporates a second later when your fingers roll her trappy little pouch between them. <i>“I-if you want me to put that on, I want a shot at your ");
		if(!pc.hasVagina()) output("ass");
		else output("pussy");
		output(".”</i>");
		output("\n\nDoesn’t seem like the usually-subby slut’s willing to budge on that...");
	}
	processTime(6);
	clearMenu();
	addButton(0,"Accept",acceptHorseplowDelPlayButtStuffCunnyPlowWhatAmIEvenWritingAnymore);
	addButton(1,"Refuse",refuseToGetHorseWeenedByDell);
}

//Refuse
//Del doesn’t get to make demands of you!
public function refuseToGetHorseWeenedByDell():void
{
	clearOutput();
	showDel(true);
	author("Savin");
	output("Oh, no. You were more interested in seeing Del fuck <i>other</i> people... or maybe just having a big, floppy horsecock wiggling around while she takes it in the ass.");
	output("\n\n<i>“Well,”</i> Del huffs, taking her hand off the synth-sheath. <i>“Since you’re not my [pc.master], I guess I’m not taking it.”</i>");
	output("\n\nYou stare at Del for a long moment - long enough for her to squirm and avert her eyes from you. You don’t stop massaging her dick, though, until she’s trembling and chewing her lip. Finally, Del says, <i>“L-look, I’ve never gotten to actually <b>fuck you</b>, have I? Despite all the stuff you’ve done to me! If you want to put a giant dick on me, I wanna use it to bang the person I... I...”</i>");
	output("\n\nShe chokes on her words, squirming; at first you think it might be something she’s trying to say, but a sudden throb of her dick and a wet, sticky feeling in your palm quickly informs you otherwise. You evacuate from under Del’s skirt, and sure enough, that’s a smear of white all over your hand. You give Del a cross look and present your hand expectantly, so close to her face that she has to pull back to avoid you literally rubbing her nose in it. But she knows what you expect and, after a moment of glancing around at the bar’s patrons to see if anybody’s watching, Del quickly licks you clean and swallows her still-hot load.");
	output("\n\n<i>“Del!”</i> her owner barks from the other side of the bar. <i>“Table six needs you!”</i>");
	output("\n\nDel hops out of your lap and straightens out her skirt. <i>“Sorry, [pc.name]. Maybe we can have this discussion again later...”</i>");
	output("\n\nShe gives you a wink and skips off to help one of Kally’s customers.");
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Accept
//Fair’s fair, after all. Hook Del up with a huge horsecock, and then let her test it out on your [pc.vagOrAss].
public function acceptHorseplowDelPlayButtStuffCunnyPlowWhatAmIEvenWritingAnymore():void
{
	clearOutput();
	showDel(true);
	author("Savin");

	output("<i>“I think we can work with that,”</i> you say, patting Del’s thigh. <i>“Let’s get you attached to your new horsey friend here.”</i>");
	output("\n\nDel hops out of your lap and takes your hand. <i>“‘Kay! Let’s go to the baths and try it on. Um, miss Kally! I’m gonna go on break for a minute!”</i>");
	output("\n\nThe kui-tan babe behind the bar gives an exaggerated roll of her eyes and waves Del off. Squeezing your hand tight, Del leads you into the onsen behind the lodge’s main room, which seems empty for the moment. Perfect for what Del intends to do, you figure");
	if(pc.exhibitionism() >= 66) output("... as much fun as a whole crowd watching Del destroy your [pc.vagOrAss] might be");
	output(". You take the synthetic horsecock out of your pack and set it on one of the benches, then help Del to disrobe. You’re give yourself leave to play with her body as you do so, pressing your [pc.chest] into her back and groping at her breasts, flicking her nipple-rings cupping the huge, heavy mounds of boobflesh spilling out of her shirt. Del just moans and wiggles out of her clothes, content to let you play with her, right until your hands wander down to her ass.");
	output("\n\n<i>“Hey now,”</i> she purrs, gently batting your hand away from her supple hindquarters. <i>“That’s not on the table today. Nuh-uh!”</i>");
	output("\n\nOooh, somebody’s getting lippy, are they? You can’t have this one break in your routine undoing all the work you put into Delilah so far; she’s too perfect just the way she is. So, you ");
	if(silly) output("grab her by the boypussy");
	else output("thrust a pair of dry fingers into her well-used cock-holster");
	output(", making her shriek. Her little dick goes rock hard and, a few seconds of finger-fucking later, you grin with unrepentant glee as a little trickle of white pours out of her foreskin-wrapped crown onto the floor.");
	output("\n\n<i>“Fuckfuckfuckohfuck!”</i> Del cries, instinctively bouncing her big ol’ butt on your fingers. <i>“Okay! Okay! I’m still your little buttslut. I am!”</i>");
	output("\n\n<i>“Promise?”</i> you whisper into her ear, pushing a third finger in and rubbing against her prostate. Cum just keeps pouring out of her cock, drooling down her thighs as her dick bobs and wiggles.");
	output("\n\nShe nods emphatically, reaching back and wrapping her hands around your [pc.butt] - she knows better than to touch her dick when it’s her ass getting pleasured. You whisper that maybe she’s still a good girl after all, and slowly slide your fingers out of her ass. She shudders the moment your digits pop free, knees quaking at the sudden vacancy. Poor girl looks like what she really needs right now is a nice, hard dicking... but you relent, for now.");
	output("\n\n<i>“Sit down,”</i> you command, patting the bench next to where you’ve set your pack down. Del does so, and with a little nudging, spreads her legs wide open and leans back. She doesn’t so much as blush or flinch as you kneel down in front of her bare nethers, well used to your touch as she is by now, and her eyes remain firmly affixed to the flopping horsecock in your hands as you heft it up and align the hollow base above the balls with Del’s slowly-wilting bitch-clit.");
	output("\n\nThere’s little fanfare in connecting the simulated stallion schlong to the slutty shemale slave. You press the base of the shaft to Del’s crotch and hold it there a moment. A second later, the equine erection throbs, a bead of white forming at its crown. Del gasps and moans, throwing her head back and digging her nails into the wood of the bench. The horsedick stiffens in your grasp, and its owner trembles as you start to stroke her.");
	output("\n\n<i>“I... I can feel it,”</i> Del gasps, staring with wide eyes at the hardening horsecock between her legs. <i>“What is this thing!?”</i>");
	output("\n\n<i>“Your new dick,”</i> you assure her, flicking your wrist from medial ring to flared, throbbing cockhead. You can feel veins pulsing just beneath the surface, pulsing with heat and lust; a heady, masculine aroma starts to make itself known, wafting up from the winking cum-vein in the heart of her flare.");
	output("\n\nYou drink deep of the smell, letting the powerful, alpha-male smell permeate the heavy sauna air around you. Every sense but that of sight tells you that your face is pressing up against the crotch of some titan of manhood, ");
	//been to NT: 
	if(flags["LANDED_ON_TEXAS"] != undefined) output("like a hulking New Texan bull is waiting for you to do the only thing you’re there for: suck him dry");
	else output("waiting for you to suck him dry");
	output(". Somewhere deep in the back of your mind, some chemical compulsion responds: without so much as thinking, you find yourself leaning down and flicking your tongue across the slit, lapping at the thick stud-cream bubbling up from. Del yelps, chest heaving at the unfamiliar sensation; you just give her a wink and thrust your [pc.tongue] deeper, opening up her horsey dong and slurping up all that sweet pre.");

	output("\n\nThat’s the stuff! You wrap both hands around Del’s cock and open wide, swallowing as much of her length as you can and pumping what’s left over. More and more hot, sticky cum pumps down your throat, deposited directly into your stomach. You feel Del’s hands gripping your [pc.hair], her legs wrapping around your shoulders... but all you can see is hot, thick cock desperately in need of sucking.");
	output("\n\n<i>“It feels so real!”</i> Del moans, rocking her hips to push just a little more horsedick down your throat. <i>“Like it’s... like I’m... I’m... I’m cumming!”</i>");
	output("\n\nYour eyes go wide as the synth-sheath swells in your throat, momentarily blocking your airway with its bestial girth, before a deluge of cum surges through it and down your gullet. There’s no choice but to take it; every last, steaming drop of horsey cream shoots straight into your belly. You feel that glorious liquid weight slosh and settle inside you, straining your insides with all the contents of Del’s new, shiny black balls. Only when you’ve swallowed the " + (MailManager.isEntryUnlocked("del_moved") ? "bimbo" : "trappy") + " babe’s first, massive load - and you’re so full of cum that it’s leaking out your mouth, and you’re seeing stars from being choked with dick - only then does Del’s cock slowly start to soften, letting you get a gasp of musk-laden air as her horsecock starts to pull itself free of your throat.");
	output("\n\nYou expect to hear Del comment, or at least keep babbling on like before, but when you’re finally able to reorient yourself and detatch yourself from her equine penis you find that she’s collapsed on her back in a panting heap of sweaty, sexually overwhelmed dickgirl. You laugh - which causes a fair bit of warm cream to trickle down your chin - and take a seat next to Del, gently teasing her nipples and new equine sheath as she comes down from her orgasmic high.");
	output("\n\nA few minutes later, still breathing hard and trembling at your touches, Del manages to murmur: <i>“S-so how do I take it off?”</i>");
	output("\n\nYou grin down at her and tell her that she doesn’t. This is hers, forever and ever.");

	processTime(25);
	del.shiftCock(0,GLOBAL.TYPE_EQUINE);
	showDel(true);
	del.ballSizeRaw = 7;
	del.cumMultiplierRaw = 30;
	del.ballEfficiency = 60;
	timesDelilahSexed(1);
	pc.loadInMouth(del);
	//move PC to Onsen.
	moveTo("CANADA7");
	
	if(!CodexManager.entryUnlocked("SynthSheath"))
	{
		output("\n\nYour Codex beeps with a warning about how this device may irreversibly alter ones biology. You grimace ruefully at the device before regarding Del’s enhanced genitalia.");
		CodexManager.unlockEntry("SynthSheath");
	}
	
	output("\n\n");
	pc.destroyItemByClass(HorseCock);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Slut Training 2: Electric Fuckaloo
//Same requirements as on Tarkus. New option name: [Public Use] under Del’s sex menu. Only available in the evenings.
//Tooltip: Kallly’s customers look a little pent up! You and Del could take care of them all with your asses, just like old times.

public function delSlutTraining():void
{
	clearOutput();
	showDel(true);
	author("Savin");
	output("<i>“What do you see out there?”</i> you ask Del, nodding towards the bar.");
	output("\n\nThere’s a good crowd of people building up in the bar now, a healthy mix of local ‘taurs and humanoid spacers passing through the system. You can practically smell all the dicks locked away in too-tight pants or under bestial bodies, pent up from hours or days alone in space, unable to find sweet release. The poor things... they <i>need</i> someone to give them some relief.");
	output("\n\nDelilah looks around, pursing her lips. <i>“Um... a bunch of meese-people?”</i>");
	output("\n\nYou give her plump little ass a squeeze and tell her to look closer at all those bulging crotches and animalistic loins. Del gulps, eyes wandering from cock to cock, doubtless flooding her mind with thoughts of what she could be doing to all those needy men and futas.");
	output("\n\n<i>“What should we do for all these poor, neglected dicks?”</i> you murmur into her ear, nibbling at the lobe. <i>“And what can they do for us?”</i>");
	output("\n\nDel shivers, and you can see ");
	if(del.hasCock(GLOBAL.TYPE_EQUINE)) output("her mottled horsecock start to throb with excitement");
	else output("her little trap-clit start to tent the hem of her skirt");
	output(". She doesn’t need any further prompting once you’ve got her imagination going wild. The slutty shemale hops out of your lap and grabs your hand, leading you over to the door connecting Kally’s lodge to the onsen behind it. When you get to the door, Del gives a sharp whistle over her shoulder and bends down, wiggling her ass into the lodge. You give her rump a spank and a squeeze, drawing every eye in the place to Del’s dusky derriere. Not wanting to let you feel left out, Del grabs your [pc.butt] and kneads the flesh in her fingers");
	if(pc.isAssExposed()) output(", threatening to sink a finger into your [pc.asshole] before the fun even starts");
	output(".");
	output("\n\nYou give a wink to a pair of particularly-interested looking moose-boys in the corner and then sashay into the springs, arm in arm with Del, both your asses shaking for the crowd. The wordless invitation is obvious, and before you’re halfway to the benches, you can hear several chairs scraping the floor back in the lodge and a herd of footfalls coming your way. While you still have Dell all to yourself, you shive the chocolate beauty up against one of the walls and tear her slutty little uniform off, letting those big breasts of hers fall into your waiting hands. You thrust your mouth against hers, letting your tongue play across her bubblegum-painted lips whilst your fingers tweak and tease her pierced nipples, urging your cock-craving companion to full hardness in a matter of moments.");
	if(del.hasCock(GLOBAL.TYPE_EQUINE)) output(" Her mammoth erection thumps heavily against your [pc.leg], drooling pre along your [pc.skinFurScales].");

	output("\n\nLeave Del pressed against the wall, breathless and rock-hard, you drop your ");
	if(!pc.isAssExposed()) output("[pc.assCovers]");
	else output("equipment");
	output(" and stretch out over the bench, ass in the air and wiggling at her. <i>“C’mere and get me ready, sweetheart.”</i>");

	//move to onsen.
	moveTo("CANADA7");

	processTime(14);
	clearMenu();
	addButton(0,"Next",delSlootybuttTrainingJr);
}

public function delSlootybuttTrainingJr():void
{
	clearOutput();
	showDel(true);
	author("Savin");
	output("You cast a glance over your shoulder to watch your impromptu audience start shuffling in from the bar, gratified to see several tented trousers among the gathering of humans, ‘taurs, and a smattering of other core-ward races. Now for a little audience participation...");
	output("\n\nYou reach back and give yourself a slap on the ass, drawing a sharp breath at the gratifying snap of pain, and the motion of your jiggling cheeks as they recoil from the blow. Your hand moves in, spreading your cheeks wide so everyone can get a good look at your [pc.asshole], shamelessly on display and already craving cock. You can <i>feel</i> the need in your loins and hole, hungry for the familiar taste of cock inside you, pounding you into the steamy, unforgiving wood of the bench, stretching your slutty hole wide open.");
	output("\n\nYour mouth is watering. And oh <i>god</i> is your cock hard.");
	output("\n\n<i>“Come on already,”</i> you whisper to Del with another wiggle of your [pc.hips]. <i>“They’re waiting!”</i>");
	output("\n\n<i>“Sorry, I was hypnotised for a second there!”</i> the whorish bartender says with a lascivious smile, slipping down onto her knees behind you and spreading your cheeks open with her hands. You give a little shudder of pleasure as Delilah’s tongue slurps along from the ");
	if(pc.balls == 0) output("base of your [pc.cock]");
	else output("back of your [pc.balls]");
	output(" up to the tight-clenched hole of your [pc.asshole].");

	output("\n\n<i>“Riiiight there,”</i> you purr, winking at a nearby patron as Del’s tongue caresses your rim. You try and relax yourself, breathing steady as her wet appendage’s tip puts a bit of pressure on you. Not enough to truly penetrate, but certainly enough to spread your sphincter open around her, letting her drool soak into your hole. Your breath catches as you feel the first rivulet of lubricant enter you. Your fingers dig into the wood, gripping the rim of the bar tight as you struggle to contain your moans, letting Del get you ready for the main event.");
	output("\n\nYou let your hand stroke through your slutty protege’s golden hair, urging her on until your [pc.legs] are shaking and her tongue is slipping into your ass, slathering you with spit. In her lust, she even reaches around your quaking [pc.legs], finding the crown of your [pc.cock] and squeezing it. A long, loud moan escapes your lips, high and feminine as your prick gets teased by her small, deft hands. Oh... if you’re not careful, you may find your fun over before it begins. You hate to do it, but... with a heavy sigh, you push Del back, leaving yourself with a hollow, empty feeling in your backside.");
	output("\n\nYou quickly return the favor, spitting onto your palm and slathering up a few fingers. Del deftly takes her place at your side, close enough that your hips are pressing together, and accepts your fingers into her dark hole with a gratified moan. You watch her dick throb and leak underneath her, demonstrating her readiness to be ass-fucked for all to see. Some of the growing crowd cheers or jeers, telling you to go deeper, or for her to take it like the bitch she is. Del flushes darkly and wags her ass");
	if(del.hasCock(GLOBAL.TYPE_EQUINE)) output(", making her hefty erection wobble pendulously under her");
	output(", inviting anybody with the balls to come and take her.");

	output("\n\nAtta girl! For good measure, you reach back and spread yourself open, showing off your lubed-up pucker to the crowd as well. <i>“Alright, boys... come and get it!”</i>");
	output("\n\nYou hear a clatter-clop of hooves behind you, and a masculine voice growls <i>“Hope you’re used to Vesperians, sunshine.”</i>");
	output("\n\n<i>“I’m used to big dicks!”</i> you quip back, winking your [pc.asshole] at him. <i>“So don’t hold back.”</i>");
	output("\n\n<i>“Whatever you say. Might wanna grab holda something,”</i> the moose-man says. You take his advice, wrapping your knuckles around the wood of the bench and trying to open wide to receive a bestial package right up mainstreet. The moose delivers on his promise a heartbeat later, hiking his forelegs up onto the bench on either side of your shoulders and slamming a flat, flared head of dickmeat against your wet-and-ready asshole. One buck of his cervidac hips and he’s inside you, spearing your hole open and burying inch after exquisite inch of meat into your [pc.asshole].");
	pc.buttChange(700);
	output("\n\nThe sheer girth of dick sliding into you forces a moan from your [pc.lips]. Your back arches and gut bulges, meekly accepting the ‘taur-man’s cock until he fleshy sheath is pressed into your [pc.butt]. You hear a feral roar of pleasure from on high, booming down from the bull’s commanding position. Despite your bravado, his cock is filling you up completely, pressing hard against your prostate and grinding against it with every breath its owner takes. Your [pc.cock] throbs and leaks onto the bench, painfully hard from your willing submission.");
	output("\n\nYou squeeze down on the intruding member, giving the moose-taur a nice, tight, wet hole to thrust into - and he does so with gusto. A few slow, even strokes to start you off, and then he’s pounding away at you, hammering his crotch into your ass, forcing you into the bench with every smack of flesh-on-flesh. You moan, crying out as his meaty prick stretches you wide, putting just enough pressure on that wonderful bud inside your clenching hole to make your [pc.cock] squirt with every thrust, bobbing as your hips are rocked by the impact of his cock slamming back into your ass-sheath again and again.");

	output("\n\nIt doesn’t take long before the man’s grunting with effort, thrusts becoming quick and erratic as your well-trained hole milks him. With a roar, the ‘taur buries himself deep, grabbing the wall to steady himself as pleasure rocks his massive body; you clamp your muscles down as hard as you can to give him as pleasurable a release as possible. You both heave a sigh as you feel the familiar flood of spooge into your ass, and it takes everything you have not to give in and start masturbating just at the wonderfully full, wet, hot sensation of seed spilling into your boypussy.");

	output("\n\nPanting, the moose-man stumbles back, throbbing beast-cock slathered with his own cum as it flops out of you. You push back a little as he withdraws, and shudder as you feel a deluge of his hot, creamy spunk drool out of your hole, pooling between your wide-spread [pc.legs]. God, there’s so much! It feels as though your ass is a fire hydrant, expunging the ‘taur’s massive load all over yourself until your [pc.belly] returns to normal proportions.");
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.createPerk("Fixed CumQ",7000,0,0,0);

	pc.loadInAss(pp);
	output("\n\nThat’s the stuff! You give Del a sultry wink as the first of many men leaves you, only to be quickly replaced by a second: a tapered, pointed dick that feels like a kui-tan’s, or maybe a fox’s. A sultry woman’s voice tells you to raise that rump in the air.");
	output("\n\n<i>“Oh yeah! Fuck me!”</i> your purr, even as her cock’s halfway inside you, using the previous tenant’s spunk as a thicker, longer-lasting lube to slide easily into your unopposing depths. As the hermaphrodite hilts herself inside you, you can’t hold back a long, moaning <i>“Ooohhh fuck.”</i>");
	pc.buttChange(350);
	output("\n\nBeside you, you hear a girly cry of pleasure; a quick glance shows you Del biting her lip and thrusting her hips back against a human man’s crotch, taking a dick of her own, hard enough to make her rock forward with every thrust. She catches you looking and flashes you a lusty smile - one that just draws you over, locking lips with your fellow living cum-rag.");
	output("\n\nWhen you’re done, you pull yourself up onto your elbows as the futa babe gets to ass-fucking you, tearing off what remains of your [pc.gear] to get at your [pc.chest] and tweaking one of your stiff nipples to add to your pleasure. From this angle, you can see well over a dozen patrons of the bar have wandered in, with more on the way, forming a line behind you. Everyone’s eager to get their turn at your [pc.asshole]! Now there’s a thought you can relish for a while. Between lewd moans and husky words of encouragement to your current butt-lover, you whistle over to another man in the crowd, wiggling a finger until he’s in front of you, cock flopping out of his jeans. You twist a bit to get a good angle on the juicy-looking cock on display, brushing your fingertips up the turgid length until your hand is wrapped around it, guiding it toward your mouth.");
	output("\n\nAs your tongue lashes out toward the man’s prick, your eyes roll back at the wonderful, earthy taste of cock. You feel yourself trembling as you take the dick into your mouth, wrapping your [pc.lips] around the head and tasting the salty flavor. You guide your third john in, opening wide to let him bury himself in your mouth, even as number two’s pounding away at your other hole. You lose yourself into the mindless bliss of the double-team, eyes fluttering closed as you let your cock-wielding customers use your body as they like. You barely even notice this time as the futa fucking your ass cums, spraying your colon with another load of seed to ease the entrance of the next.");
	output("\n\nDel, ever the precocious whore, sees that you’re going two for two, and decides to do the same. She motions over a dainty-looking deer-taur boy and has him prop up on the bench, clapping his hooves on the wood, and a long, thin shaft of deer-meat slips out of a sheath - and right into Delilah’s puffy pink lips.");
	output("\n\nAs Del settles into her spit-roasting routine, you feel another john blow his load inside your own [pc.asshole], filling you with such an abundance of creamy spunk that as soon as he fumbles his cock out of your ass, you’re instantly leaking gooey whiteness down your thighs and onto the floor. Maybe it was another ‘taur? You’re losing track. Either way, you give a dreamy sigh and lean onto your arms, meekly accepting another cock in both your holes at once. This is the life... and watching your slutty protege taking after you so well... that just makes it all the sweeter.");
	processTime(30);
	pc.orgasm();
	pc.loadInAss(pp);
	clearMenu();
	addButton(0,"Next",delSlootybuttTrainingSrTheDoombringer);
}

public function delSlootybuttTrainingSrTheDoombringer():void
{
	clearOutput();
	author("Savin");
	showName("DEL\n& KALLY");
	showBust(showDelString(true),"KALLY_NUDE");
	output("You reach out and take Del’s hand, lacing your fingers through the dusky whore’s as she’s filled with almost as much cock as you are. Her muscles are going crazy, chest heaving and back arching as she’s fucked hard and fast, pounding her into the hardwood with you. That a girl. You turn your attention back to your own lucky customers, slipping a few fingers into the dark star of the man plunging into your open mouth, giving him a thrill and a quick cumshot that leaves your face fully plastered with spunk.");

	output("\n\n<i>“What’s going on here, huh?”</i> a familiar kui-tan’s voice coos from behind you. You cast a glance over your shoulder, just as you feel the familiar surge of cum flooding your bowels, and your current butt-lover stumbles back, letting you leak his load onto the floor. Kally’s standing behind him, giving the human boy a slap on the rump and sauntering up to where you and Del are splayed out, asses up and hungry for more.");
	output("\n\n<i>“H-hi, Kally,”</i> Del moans, spitting up a load of cum and letting her current john stumble off. <i>“Just enter-ah!-entertaining the customers!”</i>");
	output("\n\nThe human dick-girl plowing Del’s ass laughs, <i>“Enter’s right!”</i> and goes balls deep, slapping Del’s ass hard enough to make her shriek.");
	output("\n\nKally tsks her tongue and crosses her arms under her prodigious bust, making her low blouse strain around the heaving, furry titflesh. You can practically smell her arousal wafting up from under her tented skirt, though; she might be playing the mistress, but she’s hiding a boner that makes your mouth water.");
	output("\n\n<i>“[pc.name] and me just aren’t enough for you? Oh, Delilah,”</i> Kally teases, reaching down and grabbing one of Del’s butt cheeks. A few moments later, the futa girl working the dusky butt-slut’s ass cums, adding her load to the multi-colored mess leaking out of Del’s gaping asshole. Kally delivers a playful smack to the plump, dusky buttocks, making cum squirt out and splatter all over the floor. All your partner can do is moan and leak, wiggling her ass invitingly towards the crowd of spacers and their needy hardons.");
	output("\n\n<i>“Sorry?”</i> Del ventures, her question training off into a gasp as another guy saunters up to take his turn on her.");
	output("\n\nKally puts up a hand, gently pushing him back. <i>“No you’re not,”</i> she teases, swinging around and planting both hands on Del’s girly hips. <i>“You know you love it.”</i>");
	output("\n\nIt isn’t long before Kally’s going balls-deep in her personal cock-sleeve, packing Del’s ass with modded horseween. Good girl.");

	//Kiro on station + Threesomes unlocked w/ Kally:
	if(kiroKallyThreesomes() > 0 && roamingKiroAvailable())
	{
		showName("DEL, KIRO,\n& KALLY");
		showBust(showDelString(true),"KIRO_NUDE","KALLY_NUDE");
		output("\n\n<i>“Oh, hey there angel,”</i> another familiar voice says, just as you’re feeling an eruption of cum into your ass.");
		output("\n\nA fuzzy paw plants itself on your [pc.butt], drawing your attention back around to a red dress and a massive pillar of horsemeat flopping onto your cum-soaked rump. <i>“And hey, sis,”</i> Kiro adds, leaning over and swapping spit with her older sister. The incestuous affection sends a rapid series of throbs through Kiro’s equine cock, and you feel pre leak onto your [pc.skinFurScales], pooling in the little valley of your arched back.");
		
		output("\n\nNot breaking the kiss, Kiro unceremoniously rears back and plants her flared cockhead against your [pc.asshole], drooling some nice, cool lube around your rim from her ever-present stash before pushing inwards. There’s a moment of blinding, stretching agony, and then your mind is assaulted by waves of ecstasy crashing down on your anal g-spot. You cum screaming, throwing your head back in a primal cry of sissy delight. [pc.CumNoun] splatters your thighs, leaking from your rock-hard dick. Your [pc.balls] clench");
		if(pc.balls <= 1) output("es");
		output(", emptying onto the floor before Kiro’s even half-buried in your poor ass. She makes that deer-boy from before seem positively tiny, the way her over-sized ");
		if(silly) output("ogre-cock");
		else output("horse-dick");
		output(" stretches and molds your ass to fit her. You can easily imagine Del’s feeling the exact same sensation, and like you, she’s cumming her poor brains out on her minstress’s member.");
		pc.buttChange(kiro.cockVolume(0));
		pc.orgasm();

		output("\n\nThe tanuki pirate doesn’t waste much time with you: she’s got full, heavy nuts and a line behind her, all cheering or jeering, both driving her to go hard on your ass. It feels like a freight ship trying to dock with your guts at half of Lightspeed... with the pilot drunk and getting a blowie at the same time. Your knuckles go white hanging onto the wood of the bench, and your whole body rocks forward from the force of the tanuki’s thrusts, bouncing you in place and battering your [pc.legs] with her hefty swinging nutsack.");
		output("\n\nIt isn’t all that long before you’ve got a lake of nuki-cream swelling your belly up, making it hang dangerously low to the ground while Kiro stumbles back, nuts deflated to half their prior size. Between her and her sister... and all the folks who you’ve milked with your mouth while the kui-tans were having their fun... you’re surrounded by a veritable lake of spooge.");
		pc.loadInAss(kiro);
		kiro.orgasm();
	}
	//Kaede on Canadia Station:
	//+Kaede Exhibitionism
	else if(kaedeCouldBeOnNewCanadaRepeats())
	{
		showName("DEL, KALLY,\n& KAEDE");
		showBust(showDelString(true),"KAEDE_NUDE","KALLY_NUDE");
		kaedeIncreaseExhibitionism(10);
		
		if(flags["KAEDE_DEL_TRAINING"] == undefined) output("\n\n<i>“Oh my god!”</i>");
		else output("\n\n<i>“Again!?”</i>");
		output("\n\nYou cast a glance to the door, and see Kaede standing just inside wrapped in nothing by a towel that leaves her alabaster cleavage and long, slender legs bare. Her ginger tail thumps wetly on the slicked floor, unintentionally dipping into the puddles of spunk spreading out from you and Del.");
		output("\n\n<i>“[pc.name]?”</i>");
		output("\n\nWeakly, you prop yourself up and wave at Kaede, spitting a wad of cum out as you do so. She blushes, but she doesn’t back away. Fighting against your cock-craving instincts, you push the next <i>“customer”</i> away from your [pc.butt] and crook a finger towards the nearly naked half-ausar. Kaede’s cheeks are flushed red, but she’s too ");
		if(flags["KAEDE_DEL_TRAINING"] == undefined) output("bewildered");
		else output("turned on");
		output(" to refuse. She paces over and, once she’s within arm’s reach, you just grab the front of her towel and give it a yank.");

		output("\n\nKaede yelps, tail tucking between her legs to cover her crotch, and her arms wrap around her chest. Her eyes are like saucers, furtively glancing around the crowd, and her cheeks burn crimson. Poor thing! But you can see her pretty red rocket drilling into her fur, rock hard despite herself.");

		output("\n\n<i>“Why don’t you join us?”</i> you purr.");

		// Kaede has VERY high Exhibitionism:
		if(flags["KAEDE_EXHIBITIONISM"] != undefined && flags["KAEDE_EXHIBITIONISM"] >= 66)
		{
			output("\n\nYou pat the space on the bench between yourself and Del, and the two of you scoot apart to give Kaede a space to present herself to the audience. She blinks at you, but you can see her knees knocking, tail twitching under all the gazes wandering over her suddenly naked frame. After a moment, Kaede drops her arms and lets her tail wag off on its own, chewing her lip and nervously glancing about. Folks in the crowd wolf-whistle and catcall, and some even rub their lovely hardons in her direction, ready to get a taste of that sweet halfbreed booty.");
			output("\n\n<i>“You’re a terrible influence!”</i> Kaede whispers, crawling up between you and Del, grabbing your [pc.breast] and giving you a wink. <i>“God, what’s Anno gonna think if she finds out...”</i>");
			output("\n\n<i>“It’ll be our little secret,”</i> you promise her, leaning over and trading a long, tongue-filled kiss with your friend. While you’re busy, somebody runs a hand through the crack of your ass, scooping up some of the still-steaming spunk deposited by your last anal lover and splats it into Kaede’s bare rump, smearing it into her asshole with his fingers before dropping trou and plowing in. Kaede yelps, grabbing your hand as her first dick of the night sinks into her tight little tail-hole.");
		}
		// Kaede has moderate or less Exhib:
		else
		{
			output("\n\nYou wiggle your ass at Kaede, spreading your cum-drenched cheeks wide to give her a look at your gaping cocksleeve. Embarrassed as she might be, the bashful pup can’t pass up a chance at your ass, and you know it. Indeed, she’s only able to feign resistance for a few moments before her tail wags itself out of the way and she scoots behind you, looking bashfully at the other johns lined up for a taste of you or Del. Someone gives her a slap on the ass, making her stumble into your [pc.butt]. She ends up grabbing your flanks for support, and soon after, the last of her hesitation melts away; you feel her dick flop into the crack of your ass, slowly aligning with your hole.");
			output("\n\nKaede’s tapered crown rubs around the rim of your [pc.asshole], collecting a little bit of the excess leaking out of you before she pushes in. There’s no contest in terms of size: the dicks that came before her have all but ruined you, leaving you utterly agape and ready for anything - you could easily let Kaede’s knot snuggle right in, but for now, you find yourself contented by the familiar feeling of her length growing inside you, thickening towards its bitch-breaking base.");
			output("\n\n<i>“Geez, [pc.name],”</i> Kaede groans, bumping her crotch against your [pc.butt]. <i>“I guess I gotta get here before the centaurs, huh?”</i>");
			output("\n\nYou flash her a wink over your shoulder and squeeze down, plying all your experienced muscles to pleasure Kaede’s cock. No amount of prior pounding is gonna keep you from making sure your half-ausar lover gets off! You let her thrust in, then trap her deep inside, massaging her length from crown to knot with steady clenches. You hear her gasp with pleasure, and her hips start moving faster.");
			output("\n\nNobody’s ever accused Kaede of keeping a lady waiting. It isn’t long before she’s moaning and digging her fingers into your [pc.hips], pounding away at your gripping asshole until her knot’s swollen and cum is leaking from her pointy cockhead.");
			output("\n\nSuddenly, Kaede screams, and you feel her emptying her balls into your [pc.asshole]. You glance back in time to see a pair of Del’s fingers pistoning into Kaede’s ass, milking her prostate right over the edge of climax. Her knot spreads your rim, plugging your ass so none of her creamy orgasm can escape. When she’s finished, the ginger pup flops over on your back, moaning and twitching as Del’s fingers work her hole, and <i>your</i> ass drains her dry.");
			output("\n\nWhen she’s finally done, Kaede staggers off you, breathing hard. Your eyes go wide and your breath catches in your throat when her knot, still mostly turgid, pops out of your abused behind. Blushing furiously, the ginger ausar rushes off to get cleaned up.");
			
			var ppKaede:PregnancyPlaceholder = getKaedePregContainer();
			pc.loadInAss(ppKaede);
			pc.buttChange(20);
		}
		flags["KAEDE_EXHIBITIONISM"] += 2;
		if(flags["KAEDE_EXHIBITIONISM"] >= 100) flags["KAEDE_EXHIBITIONISM"] = 100;
	}
	processTime(25);
	//I think it's safe to assume we can just toss a bucket of these calls at the PC here.
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",slootyDelBootyBangingTrainingTrapPCEpilogue);
}

public function slootyDelBootyBangingTrainingTrapPCEpilogue():void
{
	clearOutput();
	showDel(true);
	author("Savin");
	if(silly) author("Slavin");
	output("You lick up a few drops of cum off your cheeks during your short reprieve before a large, moose-bodied tauric woman steps up and unleashes a mammoth member in front of you: two feet of solid tapered shaft that nearly knocks you cold with the sheer <i>smell</i> of it, so rich and manly and... and when did you start sucking it? Your eyes just about roll up as your lips slurp up as much of this massive moose-member as you can get, doing everything in your power to kill off your gag reflex as your jaw stretches out to accommodate it. You look up to the hermaphroditic woman, unable to see her face under the bulk of her bestial body. Her chest heaves, breathing heavily, and you can hear faint moans echoing from high above you. Her small hooves click and stomp on the bench, giving voice to the small relays of pleasure coursing through her undercarriage.");
	output("\n\nThe four-legged babe puts a hand on your [pc.butt], cooing softly as you manhandle the majority of her mammoth member into your mouth. You reach down and cup her heavy balls, practically able to feel them churning with pent-up seed, straining against their furry sack. It takes a moment for you to realize you’re trembling with excitement at the thought of her emptying those thick, meaty nads down your throat, bloating your belly with cum until you look ");
	if(!pc.isPregnant() && pc.bellyRating() < 20) output("positively pregnant");
	else output("even more pregnant than you are");
	output(". Slowly, though, it dawns on you that hogging this magnificent cock all for yourself would just be too greedy. And besides, Del’s line is getting awfully thin.");

	output("\n\nYou tap Del’s shoulder, breaking her out of her ass-fuck induced reverie. She blinks and twists around to snuggle up under your arm, rocking forward with every thrust her current john delivers to her plump rear. Wrapping your arm around her, you whisper into her ear how such a huge, virile dick deserves all the attention the two of you can give it.");

	output("\n\nYour dusky protege understands implicitly, reaching up and locking lips with the slender crown of the deer-like dick. You slide up the futa’s shaft, running your [pc.tongue] up to her fuzzy balls. Cupping them, you gently massage the mountee’s cum-factories, feeling just how full those swinging grapefruits are, churning with a desperate need to release - to fertilize a bitch, or at least, Del’s throat. You squeeze and knead the fleshy sacks, helping their towering owner to work up as big a load as possible. Hardly a task for such huge, virile balls... or a ‘taur so backed up as she feels!");
	output("\n\n<i>“You’ve got skills, sluts,”</i> you hear from somewhere high above. <i>“You suck cock almost as well as you take it! Keep this up and I’m gonna... I’m gonna...”</i>");
	output("\n\n<i>“Cum!”</i> you finish, suckling on her shaft. The veiny pillar of deer-meat throbs between your [pc.lips], swelling with a rush of seed. A moment later, Del’s cheeks bulge, and you hear her choking and gagging on the deluge of cum pouring down her throat. The little slut squirms, trying desperately to swallow down the moose-girl’s ample load, and failing gloriously. Cum bubbles up from her lips and spills down her chim, splattering across her tits.");
	output("\n\nDrenched in the futa-moose’s musky load, the poor sissy slut can’t help but cream herself, getting off on the sheer submission to such a majestic cock. Her [del.cock] squirts onto the floor, painting her thighs with her own wasted cream, meekly communicating her climax to the whole room. The man currently buttfucking her just laughs and spanks her, enjoying the reflexive clenches and contractions of her cock-holster around his dick. It isn’t long before he adds his load to the sea of spunk backed up in Delilah’s poor, abused bowels, letting the excess leak down across her [del.balls] and onto the floor.");
	output("\n\nBetween the lewd show Del and the mighty moose-girl are putting on and the ever-present feeling of being fucked, the constant pressure on your backdoor pleasure-buzzer and the churning in your [pc.balls], you can’t hold out for long. You look back at the john currently balls-deep in your ass and, in the most seductive voice you can manage while drooling cum from two holes and just about to bust your own nut, moan out, <i>“Cum with me! Shoot your load deep inside! Make me cum!”</i>");
	output("\n\nThat gets him excited. The man grabs your [pc.hips] and plows in, thrusting fast and hard until you’re both moaning openly, and you can feel the familiar, rising pleasure of an anal orgasm riding up on you. You grip the bar as tight as you can, focusing entirely on the ass-spearing pleasure and the sight of Del being fucking into a quivering pile of " + (MailManager.isEntryUnlocked("del_moved") ? "bimbo" : "trappy") + " lust. Oh, you could get used to this...");
	output("\n\nYou reward your ardent lover with a high, girly whine of pleasure as he fills you with a thick wad of man-goo, joining the lake already backed up in your [pc.asshole], and finally let yourself cum. As soon as your relax yourself, you feel a surge of [pc.cum] rushing through your [pc.cock], explosively splattering on the side of the bar as the cum’s fucked out of your from behind. Moaning like the whore you are, you ride out the orgasm to the beat of the buttfucking, smearing your thighs and the wood of the bar with your messy orgasm, enjoying every moment of cumming like a proper girl.");
	output("\n\nYou give a self-pleasured shudder as the last cock pulls slowly out of your cum-stuffed backdoor, letting spooge leak out like a waterfall as your still-twitching muscles work out all that backlogged spunk. You collapse atop the bench, barely sensate, just keeping your eyes open long enough to watch Del’s belly suddenly swell as the moose-girl stomps around the pair of you and mounts her, slamming into Del’s unsuspecting ass...");

	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.createPerk("Fixed CumQ",2000,0,0,0);
	processTime(45);
	pc.orgasm();
	pc.loadInAss(pp);

	clearMenu();
	addButton(0,"Next",delSlutTrainingEpilogue2);
}

public function delSlutTrainingEpilogue2():void
{
	clearOutput();
	showDel(true);
	output("<b>Time passes...</b>");
	output("\n\nYou lost count of how many men (and women!) have used your body. At least thirty; probably more. Someone got on their holoband and called their friends over after the line got thinned out, and pretty soon you and Del were swimming in an ocean of spooge coating yourselves and the onsen. You can’t feel your [pc.legs] anymore... but in a good, contented, tired-from-getting-your-brains-fucked-out sort of way. You lie with your back atop the bar, your [pc.legs] spread almost to your ears as the last man standing finishes himself inside you. You give an approving gasp, nearly joining him - though you’ve already cum on yourself enough for one day, perhaps: your [pc.chest] is completely soaked, with rivulets running off your bare body to stain the hardwood below you.");
	output("\n\nWith a grunt, the last john of the day pulls out of you, still leaking cum, and wipes himself off on your thigh. You give him a wink and blow a kiss after him before collapsing back, trying to catch your breath. Delilah’s beside you still, though you’re not sure if she’s still conscious: that moose-babe pretty much ruined her, and only other ‘taurs of various kinds have used her since. But she’s certainly gotten her daily fill of dickings for the moment. You lean over and give her a peck on the cheek before unsteadily clambering off the bench and searching for your gear. Nice and cum-soaked...");
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.createPerk("Fixed CumQ",1000,0,0,0);

	processTime(45);

	pc.applyCumSoaked();
	for(var x:int = 0; x < 10; x++)
	{
		pc.orgasm();
		pc.loadInAss(pp);
	}
	timesDelilahSexed(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Stopping Shemalification
//Add [Carver] to Del’s Tarkus menu after you’ve borked Del at least once.
//[Carver]
//Have Del let you behind the bar so you can have a chat with her owner.
public function delCarverTalkForWorstDel():void
{
	clearOutput();
	showDel();
	author("Savin");
	if(flags["MET_BETH_CARVER"] == undefined)
	{
		output("You lean across the bar and plant a hand on Del’s shoulder, pointing to the door behind the bar with the hand that doesn’t quickly find itself tweaking one of her little nipples. <i>“");
		if(pc.isNice()) output("Can I go see your boss?");
		else if(pc.isMischievous()) output("Mind if I see the big-titted stripper back there?");
		else output("I’m gonna hop over and go talk to your boss, kay?");
		output("”</i>");

		output("\n\n<i>“K-kay?”</i> Del squeaks, squirming back as you ");
		if(pc.tallness < 60) output("haul yourself up onto the counter and jump over");
		else if(pc.isTaur()) output("gingerly lift a leg up and over the bar");
		else output("hop the counter");
		output(". You saunter on past her and through the door, leaving the " + (MailManager.isEntryUnlocked("del_moved") ? "bimbo" : "trappy") + " bartender calling something about there being a gate for the bar right next to her.");

		output("\n\nThe door slides open at your touch, revealing a short hallway leading to a curtain of beads hanging from an hatchway whose door has been removed entirely. A rich, coffee-and-cinnamon aroma drifts out from the back room, mixing with a faint hint of sex that hangs in the air. You rap your knuckles on the metal bulkhead beside the curtain, peering through the slender gaps between them as you do so to get a glimpse of what might await you inside.");
		output("\n\n<i>“Enter,”</i> a commanding female voice snaps from inside, a mixture of sensuality and sovereign demand that leaves no room for question; no time for second-guesses. You brush through the curtain and step into Bethany Carver’s domain.");
		processTime(5);
		clearMenu();
		addButton(0,"Next",delCarverTalkForWorstDel2);
	}
	else
	{
		repeatCarverApproach();
		return;
	}
}

public function showBethCarver():void
{
	showName("BETH\nCARVER");
	showBust("BETH");
}

public function delCarverTalkForWorstDel2():void
{
	clearOutput();
	showBethCarver();
	author("Savin");
	output("The woman herself sits facing you from behind a crescent-shaped mahogany desk, polished to a shine and occupied with only a single projector band that stretches across its length, surrounding the entrepreneuress with a bevy of flickering yellow holograms displaying byzantine charts and finances. Carver glances up from her work for only the briefest moment before nodding to a plush leather chair facing hers - the only other piece of furniture in the room.");
	output("\n\nUnless you want to count the half-dozen naked bodies lounging around Carver’s legs as furniture, anyway. She certainly seems to, ignoring their quiet moans and plaintive caresses of her legs as if they weren’t there. You recognize humans, ausar, laquine, and even a gryvain amongst them - all of them are svelte and buxom, and all of them have small, naked dicks brazenly on display. The harem look up at you with wide eyes full of wonder, and not a small amount of lust as their gazes wander across your body. You quickly become keenly aware of a myriad of eyes settling on your loins");
	if(pc.biggestTitSize() >= 1) output(" and breasts");
	output(", ");
	if(pc.isCrotchExposed() || pc.isChestExposed()) output("drinking in the sights of your bare flesh.");
	else output("undressing you in their minds.");

	output("\n\nIt takes you a moment to shake the overwhelming lust emanating from the harem lounging around Carver’s legs; you awkwardly step around the chair and seat yourself, waiting for their owner to acknowledge you.");
	output("\n\nThe slave-mistress leaves you waiting for a long, slow minute. You’re sure she could have stopped her work a dozen times in that span, but she lets you wait until she’s good and ready. As she works, you are inevitably drawn to her nearly-naked body: her large, full breasts covered by heart-shaped pasties that don’t quite cover the entirety of her nipples, the heavy mounds rising and falling slowly and evenly with her breath. If you were a lesser " + pc.mf("","wo") + "man, you’d be squirming by the time she finally disengages the holograms and leans forward onto the desk, steepling her fingers.");
	output("\n\n<i>“" + pc.mf("Mister","Miss") + " Steele,”</i> Carver says simply, a faint smile playing across her purple lips. <i>“You want something.”</i>");
	output("\n\nIt’s a statement, not a question.");
	processTime(3);
	clearMenu();
	//[Delilah] [Tarkus Op] [Leave]
	carverMainMenu();
}

//Tarkus Op
//Talk with Carver about her operation here on Tarkus.
//One time only.
public function talkToCarverAboutTarkusOp():void
{
	clearOutput();
	showBethCarver();
	author("Savin");
	output("<i>“Tell me about your operation here,”</i> you say, gesturing back towards the bar, and the Mess beyond it. <i>“A woman like yourself doesn’t come all the way out here to open a bar.”</i>");
	output("\n\nCarver smirks, ever so slightly. <i>“No, I didn’t. This is one of several dozen business ventures I control within Rush Space. ");
	//PC has purchased Reaha:
	if(reahaRecruited()) output("I believe you’re familiar with my cathouse on Tavros. ");
	output("The Mess and its associated bar are relatively minor among my holdings, but it is out of the way and serves as a convenient place to pimp out my low-risk investments.”</i>");
	output("\n\nYou blink.");
	output("\n\n<i>“Delilah. She’s an investment... a work in progress. The most recent to work here; not the first or the last by any means. When I’m done breaking her will, molding her into a perfect willing cocksleeve for every john that pops a boner in sight of her... I’ll finish her gene mods and sell her off. You won’t even notice when it’s a different sissy slut taking her place behind the bar in a few weeks.”</i>");
	output("\n\nCold. <i>“So, you’re using this place as somewhere to break in slaves?”</i>");
	output("\n\nCarver mocks offense, putting a hand to her chest and leaning back in her chair. <i>“For indentured servants, Steele. Not slaves. That would be illegal.”</i>");
	output("\n\nShe chuckles smugly and leans back in her leather chair, crossing one bare leg over the other. <i>“Tell me, Steele: what’s your take on the indenture trade?");
	//Reaha Freed:
	if(reahaFree()) output(" From what I hear, you haven’t been keeping a tight leash on your own purchases.");
	output("”</i>");

	processTime(7);
	//[It’s Wrong] [No Opinion] [It’s Fine]
	clearMenu();
	addButton(0,"It’s Wrong",talkToCarverAboutTarkusBEINWRONG,undefined,"It’s Wrong","Slavery is wrong, yo.");
	addButton(1,"No Opinion",talkToCarverAboutTarkusNOOPINION,undefined,"No Opinion","Be polite you guess.");
	addButton(2,"It’s Fine",talkToCarverAboutTarkusITSFINE,undefined,"It’s Fine","Slavery is fine.");
}

//[Its Wrong]
//+Kindness
public function talkToCarverAboutTarkusBEINWRONG():void
{
	clearOutput();
	showBethCarver();
	author("Savin");
	output("<i>“Slavery is wrong,”</i> you tell her. It might masquerade as legal, but ultimately she and every other filthy slave-hawker in the galaxy are keeping people against their will.");
	output("\n\nA faint frown twitches in the corner of Carver’s mouth. <i>“They’re not slaves, Steele. Then again, I don’t expect someone of your means to understand the struggles of those with nothing. Any mistake you make, and your daddy’s company can come to your rescue... someone like Delilah, though? One mistake can ruin them for life. What I do is a step up from destitution, having to choose between food or your next hit from whatever drug eases the pain of existence. The people I take in, they’re directionless... hopeless... without someone to guide them. To show them who they really are.”</i>");
	output("\n\nSo what, Carver thinks she’s doing this people a kindness?");
	output("\n\n<i>“Do I look kind to you, Steele? No? I’m an entrepreneur, and I can’t stand to see people going to waste. Delilah would have gone her entire life in utter mediocrity, unremarkable and unremembered. I’m building her into something worthwhile, something worth the air she breathes. Something that people <b>desire</b>.”</i>");
	output("\n\n<i>“Not everyone is born with animal magnetism, or the talent to carve themselves a legend,”</i> Carver adds, locking eyes with you. <i>“My business is human recycling, turing the discarded flesh of the galaxy into instruments of the most exquisite pleasure. No one who empties their balls in Delilah’s whorish ass will ever forget her... I can’t say the same for someone who subjected themselves to the art she tried to peddle before I took her in.”</i>");
	flags["CARVER_TARKUS_TALK"] = 1;
	pc.addNice(5);
	processTime(6);
	clearMenu();
	carverMainMenu();
}

//[No Opinion]
//+Misch
public function talkToCarverAboutTarkusNOOPINION():void
{
	clearOutput();
	showBethCarver();
	author("Savin");
	output("You shrug, and tell her you haven’t put much thought into it. Carver’s business is what it is.");
	output("\n\n<i>“A position wiser than it seems,”</i> Carver smirks. <i>“What I do is a business: nothing more, nothing less. Getting sentimental over sl- servants - is foolish. Delilah and her kind are human refuse, the discarded and the forgotten of the galaxy. I take them in, mold them into instruments of the most exquisite pleasure, and release them into the galaxy. I make them worth... anything. Without someone to guide them, to give their lives purpose, people like her would waste away in obscurity.”</i>");
	output("\n\n<i>“But what I do is not gentle, or kind,”</i> she continues. <i>“To be reborn means to be reshaped, body and mind alike.”</i>");
	output("\n\nCarver reaches down and gently strokes the hair of one of the naked dick-girls fawning over her. The slut gasps at the unexpected touch, and Carver’s touch runs downward, across a synthetic breast and stroking a shriveled, effete cock. The girl stiffens and cries out; you see white cockmilk leak out from between her mistress’s fingers, drawn out with a single caress.");
	output("\n\n<i>“Existing for nothing but pleasure isn’t the worse thing this galaxy has to offer,”</i> Carver says, sitting back in her chair and regarding her semen-soaked hand. <i>“Far from it. And someone like you, someone who gallivants across the galaxy sampling all its strange pleasures for yourself... you understand that better than most. You might make a good trainer yourself, if you tried. You’ve done wonders with Delilah already.”</i>");
	output("\n\nWhile she speaks, Carver reaches down and wipes the cum off onto the breast of the gryvaini slave leaning against her desk, making the dragoness lick her fingers clean. <i>“But that’s a conversation for another time.”</i>");
	flags["CARVER_TARKUS_TALK"] = 0;
	pc.addMischievous(5);

	processTime(6);
	carverMainMenu();
}

//[It’s Fine]
//+Hard
public function talkToCarverAboutTarkusITSFINE():void
{
	clearOutput();
	showBethCarver();
	author("Savin");
	output("You shrug. The way Carver conducts slavery is fine - these people signed up for it, after all.");
	output("\n\nCarver nods and smiles. <i>“Good. I’m glad we see eye to eye, Steele. The business I run is a net positive for the galaxy, whether or not the sluts themselves realize it. Each and every one of them was mediocre, a waste of flesh and breath, before I took them in. Gave them purpose. Molded them into instruments of the most exquisite pleasure. And they benefit from that, too... before long Delilah will enjoy taking cock a hundred times more intensely than any one john that enjoys her body.”</i>");
	output("\n\nCarver reaches down and gently strokes the hair of one of the naked dick-girls fawning over her. The slut gasps at the unexpected touch, and Carver’s touch runs downward, across a synthetic breast and stroking a shriveled, effete cock. The girl stiffens and cries out; you see white cockmilk leak out from between her mistress’s fingers, drawn out with a single caress.");
	output("\n\n<i>“Existing for nothing but pleasure isn’t the worse thing this galaxy has to offer,”</i> Carver says, sitting back in her chair and regarding her semen-soaked hand. <i>“Far from it. And someone like you, someone who gallivants across the galaxy sampling all its strange pleasures for yourself... you understand that better than most. You might make a good trainer yourself, if you tried. You’ve done wonders with Delilah already.”</i>");
	output("\n\nCarver chuckles and leans back, rubbing the submissive’s sticky cum between her fingers.");
	flags["CARVER_TARKUS_TALK"] = -1;
	if(pc.hasCock()) 
	{
		output(" After a moment, she glances up at you and crooks a spunk-slick finger at you, beckoning you closer...");
		processTime(6);
		clearMenu();
		//[Approach] [Stay Back]
		addButton(0,"Approach",getAnHJFromCarver,undefined,"Approach","There’s an offer hanging in the air. See where this goes.");
		addButton(1,"Stay Back",stayBackFromCarver,undefined,"Stay Back","Don’t take her up on... whatever she’s offering.");
	}
	else
	{
		processTime(6);
		output("\n\nCarver reaches down and wipes the cum off onto the breast of the gryvaini slave leaning against her desk, making the dragoness lick her fingers clean. <i>“But that’s a conversation for another time.”</i>");
		carverMainMenu();
	}
}

//[Stay Back]
//Don’t take her up on... whatever she’s offering.
public function stayBackFromCarver():void
{
	clearOutput();
	showBethCarver();
	output("You keep your seat, letting the tension of the moment pass without acknowledgement. Carver shakes her head and reaches down, smearing the cum onto the hair of one of the sluts still fawning over her, wiping herself clean in the girl’s amber locks.");
	output("\n\n<i>“I suppose that’s a conversation for another time. Did you need something else, Steele?”</i>");
	processTime(2);
	carverMainMenu();
}

//[Approach]
//There’s an offer hanging in the air. See where this goes.
public function getAnHJFromCarver():void
{
	clearOutput();
	showBethCarver();
	output("You stand up and take a seat on the edge of Carver’s desk, close enough that she can reach out and touch you. ");
	if(pc.isCrotchExposed()) output("She does so, reaching forward with her cum-slathered hand and wrapping her slender digits around your [pc.cock].");
	else output("She brushes your [pc.lowerGarment] out of the way with her clean hand and grasps your [pc.cock] with the cum-soaked one, pulling your prick out and gently caressing it.");
	output("\n\nYou gasp at the unexpected contact. Carver smirks up at you, leaning back into her plush leather seat and moving her wrist with slow, even motions. The sissy slave’s cum acts as more than competent lube, letting Carver’s sinfully soft fingers glide across your stiffening cockflesh with ease.");
	output("\n\n<i>“I’m hard on my property... but I can be very good to my friends, Steele,”</i> Carver purrs. <i>“Especially my powerful friends. And I don’t just mean your company. You’re an adventurer, an influencer, the kind of person who can shape the fate of planets... whether you want to or not. There’s a galaxy of opportunities out here for you, if you only know where to look.”</i>");
	output("\n\nAs she speaks, Carver’s hand starts moving faster, pumping your shaft with quickening ardor. Acting on animal instinct, your hands grab at the edge of the desk, digging in until your knuckles turn white. You have to fight not to cum in a matter of seconds, struggling against a clenching pressure boiling up in your loins.");
	output("\n\n<i>“But I can see you’re... occupied right now. Perhaps after I’m finished with Delilah and Tarkus, you and I can have a longer discussion about future partnerships?”</i>");
	output("\n\nYou try to accept, but all that comes out is a moan. Without thinking, you babble something about cumming; you bite your lip to cut yourself off, trying to keep some dignity in your pleasure. The buxom woman doesn’t pay you any mind, but just keeps milking your cock with that insistent, even motion of hers, steadily carving through your resistance until your [pc.cock] throbs, and ");
	//small cumVol: 
	if(pc.cumQ() < 25) output("a stream of cockmilk leaks out around Carver’s fingers, dripping into her lap. She smirks up at you and rubs the rest of your nut out onto her thighs and belly.");
	else if(pc.cumQ() < 500) output("a thick, creamy load of [pc.cum] spurts out from between her fingers, splattering all over her bare breasts. Carver laughs and chews one of her purple lips, jacking her wrist faster until your throbbing erection’s dumped the full volume of your load all over the woman’s chest and belly.");
	else output("a jet of pent-up spunk erupts all over her, splattering Carver’s face, chest, and belly with a deluge of [pc.cum]. She keeps massaging your [pc.cock] until every last drop of your monumental load has poured over her body.");
	output(" She makes no effort to hide the fact that she enjoys being covered in your seed.");

	output("\n\nWhen you’ve finished emptying your [pc.balls], Carver releases your dick and reclines in her chair. Without prompting, the myriad sluts crowded around the bottom of the desk crawl up onto Carver, licking and kissing her cum-soaked body clean.");
	output("\n\n<i>“Will that be all, Steele,”</i> she asks with a smile.");

	processTime(15);
	flags["CARVER_HANDJOBBED_U"] = 1;
	pc.orgasm();
	carverMainMenu();
}

//Delilah
//Talk to Carver about Delilah
public function talkToCarverAbootDel():void
{
	clearOutput();
	showBethCarver();
	author("Savin");
	output("<i>“Let’s talk about Del,”</i> you prompt.");
	output("\n\nCarver nods. <i>“She’s a good girl. Reluctant, but shows promise with a bit of training. I doubt it will be much longer before she’s broken in enough to allow me to finish her conversion. The profit from her sale should be more than enough to cover what I’ve invested in her already.”</i>");
	output("\n\nSo, that’s her plan, then? Turn Del into a willing femboy and then just sell her off again?");
	output("\n\n<i>“Femboy?”</i> Carver chuckles. <i>“The girl you see outside is just part of what I have planned for her. Once she’s accepted the pleasure of taking cock and her resolve to fight me has withered, I’ll continue to modify her. I think Delilah would look good with D-cups, don’t you? Though that dick of hers is still much too big for a proper sissy, so that will have to be atrophied further.”</i>");
	output("\n\n<i>“You’re going to turn her into a woman?”</i>");
	output("\n\nCarver shrugs and gestures down to the harem at her feet. <i>“Most of one. As you can see, I like my whores to keep their cocks. Keep them shriveled and soft, leaking cum at the slightest touch without ever even thinking about getting hard. It’s the ultimate physical form of submission, and the truest sign of a consumate buttslut. Besides, sissy-clits are in vogue in holoporn this century.”</i>");
	output("\n\nSo the “offer” Carver made you to use Del... that was part of breaking the trap’s resolve?");
	output("\n\n<i>“It was; and still is. But if learning this shatters <b>your</b> resolve... well, there are plenty more wealthy sex-addicts blowing through this backwater planet. Del just seems to like you the best.”</i>");
	output("\n\nMaybe you could use that to your advantage, and have a say in Del’s fate...");
	processTime(7);
	//[Release Del] [Feminize Del] [Leave Del Be] [No Comment]
	clearMenu();
	addButton(0,"Release Del",releaseDelSlootypuffJr,undefined,"Release Del","Tell Carver she should release Del. Maybe you could pay for her freedom?");
	addButton(1,"Feminize Del",feminizeDelPlease,undefined,"Feminize Del","Tell Carver that you support her feminizing Del further.");
	addButton(2,"Leave Del Be",leaveDelBe,undefined,"Leave Del Be","Tell Carver to leave Del the way she is: you like her as a sissy trap.");
	addButton(3,"No Comment",noComment,undefined,"No Comment","Carver knows best for her property. Leave this topic alone.");
}

//No Comment
//Carver knows best for her property. Leave this topic alone.
public function noComment():void
{
	clearOutput();
	showBethCarver();
	author("Savin");
	output("You change the topic. You’re not ready to make a decision right now.");
	carverMainMenu();
}

//[Leave Del Be]
//+Kind. Del will no longer ever leave Tarkus.
//Tell Carver to leave Del the way she is: you like her as a sissy trap.
public function leaveDelBe():void
{
	clearOutput();
	showBethCarver();
	author("Savin");
	output("<i>“What if I asked you to leave Del as she is?”</i> you venture. <i>“I like her already.”</i>");
	output("\n\nCarver raises an eyebrow, ever so slightly. <i>“Do you, now? That’s good. She’s surprisingly popular merchandise, I admit... but I’ve made such plans for turning her into a big-titted bimbo. It would be such a waste to leave her as she is.”</i>");
	output("\n\nWould it, though? You tell her that having Delilah stay the same would certainly encourage you to keep returning to the Tarkus, even if using Del doesn’t stay free forever.");
	output("\n\n<i>“Interesting. I’ll consider it, " + pc.mf("mister","miss") + " Steele,”</i> Carver says. <i>“In the meantime, please feel free to continue");
	if(pc.hasCock()) output(" sodomizing");
	else output(" enjoying");
	output(" my property to your heart’s content. Now, was there anything else?”</i>");
	flags["CARVER_DEL_TALK"] = 1;
	pc.addNice(10);
	processTime(5);
	carverMainMenu();
}

//[Feminize Del]
//Tell Carver that you support her feminizing Del further.
//Immediately start the 30-day shemalification countdown.
public function feminizeDelPlease():void
{
	clearOutput();
	showBethCarver();
	author("Savin");
	output("<i>“And I’d like </i>her<i> best with a big pair of tits,”</i> you say with a grin, eying up Carver’s nearly-bare bosom. They must be, what, F-cups? So soft, and perky for their size, too...");
	output("\n\nThe slave-mistress smiles and crosses her arms under her chest, an overt - and oh-so-effective - attempt to emphasize the heavy chest-pillows that have captured your attention. <i>“I thought you might. When Del’s transformation is complete, I’ll make sure she sends you a message so you can keep in touch. I mostly sell these sluts to other businessmen, so I’m sure you and her next owner can come to some sort of arrangement.”</i>");
	output("\n\nAnd you can’t just buy Del yourself?");
	output("\n\n<i>“Sorry, Steele,”</i> Carver chuckles. <i>“I can only sell top-shelf merchandise to accredited debt consolidators and traders. Plus, you don’t own a brothel as far as I know, and someone like Delilah needs an audience. If you’re interested in big-breasted slaves, though, I suggest you visit my bordello on Tavros Station sometime. Kat, the manager, moves some open-contract property from time to time.”</i>");
	output("\n\n<i>“Now, was there anything else?”</i>");
	processTime(6);
	pc.addHard(5);
	flags["CARVER_DEL_TALK"] = 2;
	carverMainMenu();
}

//[Release Del]
//+Kindness. In 30 days, move Del to Canadia Station, but still as a Trap (see next section).
//Tell Carver she should release Del. Maybe you could pay for her freedom?
public function releaseDelSlootypuffJr():void
{
	clearOutput();
	showBethCarver();
	author("Savin");
	output("<i>“No,”</i> Carver says, cutting you off before you’ve even halfway explained what you want. <i>“I do not free my servants before their contracts have expired. Nor will I sell them to someone who will. Indentured servitude is a punishment, but it’s also an opportunity, Steele - a chance for the galaxy’s human refuse to become something better than they were. Delilah was going nowhere in her life before I took her in. When I’m done with her, she’ll be one of the galaxy’s best cum-dumps. It’s something, at least.”</i>");
	output("\n\nYou scowl, sinking back into your chair. Dammit.");
	output("\n\n<i>“At least don’t modify her anymore,”</i> you venture. <i>“I like her just the way she is, and you know she likes me, too.”</i>");
	output("\n\nCarver chuckles, a gesture that makes her enormous breasts quake hypnotically. <i>“No, that won’t do at all... but I suppose, if another debt-trader wanted to purchase her contract from me before Delilah finally caves and lets me finish her treatments, well... just for you, perhaps I’ll let her go for a premium. I can’t guarantee what her next owner will do with her, or if they’ll allow you to keep visiting her, but I suppose that won’t be my problem.”</i>");
	output("\n\n<i>“In the meantime, feel free to keep visiting Del. It might still be your last chance before she finds herself with a nice pair of tits.”</i>");
	output("\n\nThat’s... something, you guess...");
	processTime(6);
	pc.addNice(10);
	flags["CARVER_DEL_TALK"] = 3;
	carverMainMenu();
}

//Leave
//Take your leave of Beth Carver.
public function doneSuckingUpToBethsBoobers():void
{
	clearOutput();
	showBethCarver();
	author("Savin");
	output("<i>“I’ll be heading out,”</i> you tell her, standing.");
	output("\n\nCarver nods, slowly, watching every move you make with sultry eyes. <i>“Of course, captain. I’ll be here... for now. Please enjoy my servants and refreshments while you remain on Tarkus.”</i>");
	processTime(2);
	clearMenu();
	flags["MET_BETH_CARVER"] = 1;
	addButton(0,"Next",mainGameMenu);
}

//PC returns to Carver after 1st meeting
public function repeatCarverApproach():void
{
	clearOutput();
	showBethCarver();
	output("You pass by Delilah without a word, heading through the door behind the bar and into Carver’s office. The beaded curtains part around your shoulders, revealing the mistress’s office, much as you remember it.");
	output("\n\n<i>“Captain,”</i> the woman behind the polished oak desk says, giving you the faintest incline of her head. <i>“What is it you desire?”</i>");
	carverMainMenu();
}

public function carverMainMenu():void
{
	clearMenu();
	if(flags["CARVER_DEL_TALK"] == undefined) addButton(0,"Del",talkToCarverAbootDel,undefined,"Del","Talk to Carver about Delilah.");
	else addDisabledButton(0,"Del","Del","You’ve already made your opinion clear on this matter.");

	if(flags["CARVER_TARKUS_TALK"] == undefined) addButton(1,"Tarkus Op",talkToCarverAboutTarkusOp,undefined,"Tarkus Operation","Talk with Carver about her operation here on Tarkus.");
	else addDisabledButton(1,"Tarkus Op","Tarkus Operation","You’ve already spoken about the Tarkus operation.");

	addButton(14,"Leave",doneSuckingUpToBethsBoobers);
}

//Adding Trap Del to NC Station
public function shittyDelBonus(num:Number):Number
{
	output("\n\nYou recognize Del sauntering around the bar, waiting on tables and manning the bar when the owner is busy elsewhere. He’s wearing a slick black waiter’s outfit with a slick red tie, pinned with some sort of glowing holographic button. There’s almost no trace of the slutty femboy you met on Tarkus: Del’s voice is a touch deeper, and his movements carry a masculine confidence that would have seemed comical before; now, it suits him just fine. Still, his figure is slight and effeminate, with wide hips and soft curves that almost beg for a squeeze or a grope.");
	//[Del]
	addButton(num,"Del",approachVesperianTrapDel);
	return (num+1);
}

public function approachVesperianTrapDel():void
{
	clearOutput();
	showDel();
	author("Savin");
	//First Time Interact:
	if(flags["MET_VESPERIAN_DEL"] == undefined)
	{
		output("You head over to the dusky waiter and put a hand on his shoulder, getting his attention. Del turns, ready to ask what you need... before he recognizes you, and his eyes brighten.");
		output("\n\n<i>“[pc.name]!”</i> he grins, throwing his arms around you and giving you a tight hug. <i>“I can’t believe you came! How’s it going?”</i>");
		output("\n\nDel motions over to one of the unoccupied tables in his section, taking a seat across from you. You ");
		if(pc.isTaur()) output("plop your bestial hindquarters down beside the table");
		else if(pc.isNaga()) output("coil yourself into a sitting position facing him");
		else output("swing yourself into a chair facing him");
		output(" and ask him how he’s been. What happened since the last time you spoke?");

		output("\n\n<i>“I’m good. Real good!”</i> he grins. <i>“The woman who bought me, Kally... she’s been great. After that bitch Carver, I was pretty terrified this whole indentured servitude thing was going to be an unending nightmare, but whatever you said to her must have changed her mind. And thank God, it turns out there’s actually decent people in the slave market. She’s been great so far, letting me get back into some decent clothes, and doing decent work. I haven’t had to fuck anybody I don’t want to, and heck, Kally herself hasn’t even tried to get in my pants. Not that I’d mind if she asked...”</i>");
		output("\n\nHe chuckles and lazily tucks a lock of blonde hair behind a ear. <i>“It almost feels like a normal life again. All thanks to you and that silver tongue! Kally’s even helping me put some money away to clear out my debt. It’ll be awhile, but eventually...”</i>");
		output("\n\n<i>“That’s great,”</i> you tell him. The two of you spend the next little while chatting, with Del seeming happier by the minute. Eventually, though, the kui-tan behind the bar calls for him, cutting your conversation short. Del slips away with a smile, reminding you that drinks are on him for what you did for him.");
		output("\n\nLooks like you did some good in the galaxy this time...");
		processTime(5);
		flags["MET_VESPERIAN_DEL"] = 1;
	}
	//Repeat Interactions
	else
	{
		output("You go over to Del and tap him on the shoulder, getting his attention.");
		output("\n\n<i>“Hey, [pc.name]!”</i> he grins, setting his drink tray down. <i>“Good to see you. What’s up?”</i>");
		//Del only sells drinks; no other interact options cuz lol. The first drink you get from her is free; all further drinks are heavily discounted.
		processTime(1);
	}
	delTrapMenu();
}

public function delTrapMenu():void
{
	clearMenu();
	addButton(0,"Buy A Drink",drinkFromTrapDel);
	addButton(14,"Leave",mainGameMenu);
}

//Drink
//Get a drink from the slutty waitress.
public function drinkFromTrapDel():void
{
	clearOutput();
	showDel();
	output("You tell Del you’re feeling thirsty, alright.");
	output("\n\n<i>“A drink? Sure, here’s what we’ve got on tap,”</i> Del says, flipping a handpiece out of his shirt pocket and projecting the menu across his deliciously flat chest, making sure you have to stare right at his soft pecs to pick out your drink of choice. <i>“See anything you want?”</i>");
	//Same drink choices as Kally has. If it’s before 18:00, add [Body Shots] option.
	kallyDrinkDisplay();
	delTrapDrinkMenu();
}

public function delTrapDrinkMenu():void
{
	clearMenu();
	if(flags["MET_VESPERIAN_DEL"] == 1)
	{
		if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) addButton(0,"*Doe-Eyed D",delTrapDrinkPurchase,"Doe-Eyed Draught","Doe-Eyed Draught","Doe-Eyed Draught is a local microbrew produced in-house and flavored with our special additive. The warm amber beer bears a slight, hoppy flavor with a hint of almond. Sure to have you looking doe-eyed after a few drinks! 14% alcohol equivalency by volume.\n\nPrice: FREE Credits");
		else addDisabledButton(0,"*Doe-Eyed D","*Doe-Eyed Draught","That marking is suspicious. You should ask the bartender about it.");
		if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) addButton(1,"*N. Nookie",delTrapDrinkPurchase,"Nutty Nookie","Nutty Nookie","A rich, nutty beer with a flavor that’s best described as chocolatey. Nutty Nookie’s aren’t for the faint of heart, as they contain 13% alcohol equivalency by volume and a generous helping of our secret ingredient to lend it a thicker, warmer afterglow.\n\nPrice: FREE Credits");
		else addDisabledButton(1,"*N. Nookie","Nutty Nookie","That marking is suspicious. You should ask the bartender about it.");
		
		addButton(2,"V. Vapor",delTrapDrinkPurchase,"V. Vapor","Vesperian Vapor","Like its namesake, a Vesperian Vapor is a light, crisp drink with a hint of citrous flavor hiding just beneath its bubbly effervescence. Contains 7% alcohol by volume.\n\nPrice: FREE Credits");
		
		addButton(3,"Royal Red",delTrapDrinkPurchase,"Royal Red","Royal Red","A foamy, crimson-colored beer with a bitter taste and the faintest hint of cherry. Royal Red is a common beer brewed locally on Vesperia. Contains 8% alcohol by volume.\n\nPrice: FREE Credits");
		
		addButton(4,"P. Pilsner",delTrapDrinkPurchase,"Pneumatic Pilsner","Pneumatic Pilsner","Has a kick like a launch catapult and an afterglow like an engine nozzle. Imported from breweries on Tallax. 16% alcohol by volume.\n\nPrice: FREE Credits");
		
		if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) addButton(5,"*Kui Creamer",delTrapDrinkPurchase,"Kui Creamer","Kui Creamer","Incredibly creamy with a mild sweetness that goes just right with a cold night by a warm fire. Kui Creamers are taken as a pair of shots. 21% alcohol equivalency by volume, with a concentration of our secret ingredient that’ll leave your heart fluttering.\n\nPrice: FREE Credits");
		else addDisabledButton(5,"*Kui Creamer","Kui Creamer","That marking is suspicious. You should the bartender about it.");
	}
	else
	{
		if(pc.credits >= 6) 
		{
			if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) addButton(0,"*Doe-Eyed D",delTrapDrinkPurchase,"Doe-Eyed Draught","Doe-Eyed Draught","Doe-Eyed Draught is a local microbrew produced in-house and flavored with our special additive. The warm amber beer bears a slight, hoppy flavor with a hint of almond. Sure to have you looking doe-eyed after a few drinks! 14% alcohol equivalency by volume.\n\nPrice: 6 Credits");
			else addDisabledButton(0,"*Doe-Eyed D","*Doe-Eyed Draught","That marking is suspicious. You should ask the bartender about it.");
		}
		else addDisabledButton(0,"*Doe-Eyed D","*Doe-Eyed Draught","You can’t afford that.\n\nPrice: 6 Credits");
		if(pc.credits >= 7) 
		{
			if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) addButton(1,"*N. Nookie",delTrapDrinkPurchase,"Nutty Nookie","Nutty Nookie","A rich, nutty beer with a flavor that’s best described as chocolatey. Nutty Nookie’s aren’t for the faint of heart, as they contain 13% alcohol equivalency by volume and a generous helping of our secret ingredient to lend it a thicker, warmer afterglow.\n\nPrice: 7 Credits");
			else addDisabledButton(1,"*N. Nookie","Nutty Nookie","That marking is suspicious. You should ask the bartender about it.");
		}
		else addDisabledButton(1,"*N. Nookie","Nutty Nookie","You can’t afford that.\n\nPrice: 7 Credits");
		if(pc.credits >= 10) 
		{
			addButton(2,"V. Vapor",delTrapDrinkPurchase,"V. Vapor","Vesperian Vapor","Like its namesake, a Vesperian Vapor is a light, crisp drink with a hint of citrous flavor hiding just beneath its bubbly effervescence. Contains 7% alcohol by volume.\n\nPrice: 10 Credits");
		}
		else addDisabledButton(2,"V. Vapor","Vesperian Vapor","You cannot afford that.\n\nPrice: 10 Credits");
		if(pc.credits >= 12) 
		{
			addButton(3,"Royal Red",delTrapDrinkPurchase,"Royal Red","Royal Red","A foamy, crimson-colored beer with a bitter taste and the faintest hint of cherry. Royal Red is a common beer brewed locally on Vesperia. Contains 8% alcohol by volume.\n\nPrice: 12 Credits");
		}
		else addDisabledButton(3,"Royal Red","Royal Red","You cannot afford that.\n\nPrice: 12 Credits");
		if(pc.credits >= 20) 
		{
			addButton(4,"P. Pilsner",delTrapDrinkPurchase,"Pneumatic Pilsner","Pneumatic Pilsner","Has a kick like a launch catapult and an afterglow like an engine nozzle. Imported from breweries on Tallax. 16% alcohol by volume.\n\nPrice: 20 Credits");
		}
		else addDisabledButton(4,"P. Pilsner","Pneumatic Pilsner","You cannot afford this.\n\nPrice: 20 Credits");
		if(pc.credits >= 22) 
		{
			if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) addButton(5,"*Kui Creamer",delTrapDrinkPurchase,"Kui Creamer","Kui Creamer","Incredibly creamy with a mild sweetness that goes just right with a cold night by a warm fire. Kui Creamers are taken as a pair of shots. 21% alcohol equivalency by volume, with a concentration of our secret ingredient that’ll leave your heart fluttering.\n\nPrice: 22 Credits");
			else addDisabledButton(5,"*Kui Creamer","Kui Creamer","That marking is suspicious. You should the bartender about it.");
		}
		else addDisabledButton(5,"*Kui Creamer","Kui Creamer","You cannot afford this.\n\nPrice: 22 Credits");
	}
	addButton(14,"Back",approachVesperianTrapDel);
}

public function delTrapDrinkPurchase(drink:String):void
{
	clearOutput();
	showDel();
	var special:Boolean = false;
	var bill:Boolean = true;
	if(flags["MET_VESPERIAN_DEL"] == 1)
	{
		flags["MET_VESPERIAN_DEL"] = 2;
		bill = false;
	}
	switch(drink)
	{
		case "Doe-Eyed Draught":
			pc.imbibeAlcohol(28);
			special = true;
			addLoveyDoveWithAlcohol();
			if(bill) pc.credits -= 6;
			break;
		case "Nutty Nookie":
			pc.imbibeAlcohol(26);
			special = true;
			addLoveyDoveWithAlcohol();
			if(bill) pc.credits -= 7;
			break;
		case "V. Vapor":
			pc.imbibeAlcohol(14);
			if(bill) pc.credits -= 10;
			break;
		case "Royal Red":
			pc.imbibeAlcohol(16);
			if(bill) pc.credits -= 12;
			break;
		case "Pneumatic Pilsner":
			pc.imbibeAlcohol(32);
			if(bill) pc.credits -= 20;
			break;
		case "Kui Creamer":
			pc.imbibeAlcohol(42);
			special = true;
			addLoveyDoveWithAlcohol();
			if(bill) pc.credits -= 22;
			break;
	}
	output("You ");
	if(bill) output("swipe the creds over to Del");
	else output("make your order");
	output(". He swiftly rushes off to make your drink, returning with ");
	if(drink != "Kui Creamer") output("an ice cold glass of " + drink);
	else output("shot glasses of " + drink);
	output(". ");
	switch(drink)
	{
		case "Kui Creamer":
			output("You take them one after the other, surprised at how pleasant they taste. There’s no real alcoholic kick, just the smooth heat of Kally’s creamy drinks.");
			break;
		case "Nutty Nookie":
			output("It goes down slow but smooth, leaving you with a warm, rich feeling settling into your stomach.");
			break;
		case "V. Vapor":
			output("It’s a lovely drink that you can take your time with, swirling the beverage around in your glass in between sips.");
			break;
		case "Royal Red":
			output("The thick head clings to your upper lip with every sip, but you lap it up after every swallow. It’s bitter, just like the drink, and subtly flavorful.");
			break;
		case "Doe-Eyed Draught":
			output("You suck down a long pull of the opaque amber beverage. It’s good. Damned good. You take another few swallows before slapping it down and belching, remembering your manners too late to excuse yourself. The bartender grins.");
			break;
		case "Pneumatic Pilsner":
			output("You knock back a gulp of it and nearly screw up your face from the sharp, alcoholic kick. It feels like it uses your tonsils for a punching bag and sandpapers the inside of your throat, leaving both raw from the intense beating. Nevertheless, as you drink it, you begin to appreciate the warm glow spreading through your body.");
			break;
	}
	processTime(4);
	delTrapMenu();
}