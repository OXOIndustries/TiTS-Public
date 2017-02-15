//Delilah Gets Some TiTS

/*Outline / Notes
After the player breaks Delilah in on Tarkus, Beth will complete her feminization process and sell her to Kally on New Canadia Station. Any last vestige of Del’s willpower is utterly erased, and when the PC meets her there, she’s completely given into the cock-lusting whore Beth always knew was inside her.

Once you meet her and have some fun, it’ll be possible to give her a SynthSheath and upgrade her to Horsecock Shemale. Cuz why not.
*/

public function showDel(nude:Boolean = false):void
{
	var bust_Append:String = "";
	if(nude) bust_Append = "_NUDE";
	if(!MailManager.isEntryUnlocked("del_moved"))
	{
		showName("\nDEL");
		showBust("DELILAH" + bust_Append);
	}
	else
	{
		showName("\nDELILAH");
		showBust("DELILAH_SHEMALE" + bust_Append);
	}
}
//Content Pack Intro
//PC gets an email from Del, about a month after having <i>“broken her in”</i> on Tarkus. Once email is sent, remove Del from Tarkus.

//From: Del Crawford (Delray.Crawford.136572@Galnet.org)
//To: [pc.email]@SteeleTech.corp
//Subject: Change of Venue
public function delEmailString():String 
{
	return "Hi! I don’t know if you remember me with your big important space adventures and all, but I’m Delilah, the bartender from The Mess’s lounge on Tarkus. You helped show me what Bethany Carver was trying to (even though she was a bitch about it!) - mostly by putting me over the bar ;)\n\nSo I just wanted to let you know I’ve left Tarkus. Carver did some more procedures on me, and then sold me off to some kui-tan lady on a space station above Vesperia. I just landed a couple hours ago, and I’m about to go on my first shift. If you get a chance... it’d mean a lot if you stopped by. You helped me really <i>get used</i> to/at my old job, so maybe you could do the same again?\n\nHugs and kisses!\n\t~Del\n\n<i>Attached to the bottom of the email is a set of Warp Gate coordinates that mark the way to Canadia Station, high over Vesperia - a coreward planet colonized by humans centuries ago. What’s she doing way out there?</i>";
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
	if(drink == "Doe-Eyed Draught") 
	{
		pc.imbibeAlcohol(28);
		special = true;
		addLoveyDoveWithAlcohol();
		pc.credits -= 6;
	}
	else if(drink == "Nutty Nookie") 
	{
		pc.imbibeAlcohol(26);
		special = true;
		addLoveyDoveWithAlcohol();
		pc.credits -= 7;
	}
	else if(drink == "V. Vapor") 
	{
		pc.imbibeAlcohol(14);
		pc.credits -= 10;
	}
	else if(drink == "Royal Red")
	{
		pc.imbibeAlcohol(16);
		pc.credits -= 12;
	}
	else if(drink == "Pneumatic Pilsner") 
	{
		pc.imbibeAlcohol(32);
		pc.credits -= 20;
	}
	else if(drink == "Kui Creamer") 
	{
		pc.imbibeAlcohol(42);
		special = true;
		addLoveyDoveWithAlcohol();
		pc.credits -= 22;
	}
	output("You swipe the creds over to Del. She swiftly rushes off to make your drink, returning with ");
	if(drink != "Kui Creamer") output("an ice cold glass of " + drink);
	else output("shot glasses of " + drink);
	output(". ");
	if(drink == "Kui Creamer") output("You take them one after the other, surprised at how pleasant they taste. There’s no real alcoholic kick, just the smooth heat of Kally’s creamy drinks.");
	else if(drink == "Nutty Nookie") output("It goes down slow but smooth, leaving you with a warm, rich feeling settling into your stomach.");
	else if(drink == "V. Vapor") output("It’s a lovely drink that you can take your time with, swirling the beverage around in your glass in between sips.");
	else if(drink == "Royal Red") output("The thick head clings to your upper lip with every sip, but you lap it up after every swallow. It’s bitter, just like the drink, and subtly flavorful.");
	else if(drink == "Doe-Eyed Draught") output("You suck down a long pull of the opaque amber beverage. It’s good. Damned good. You take another few swallows before slapping it down and belching, remembering your manners too late to excuse yourself. The bartender grins.");
	else if(drink == "Pneumatic Pilsner") output("You knock back a gulp of it and nearly screw up your face from the sharp, alcoholic kick. It feels like it uses your tonsils for a punching bag and sandpapers the inside of your throat, leaving both raw from the intense beating. Nevertheless, as you drink it, you begin to appreciate the warm glow spreading through your body.");
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
	output("\n\nYour trained trap takes your hand, guiding you over to one such shadowy corner where a table and chairs are pressed against the wall, hidden from view - as comfortable as Del might be with getting creamed by a dozen men in public, you guess the owner isn’t so keen on you two disrupting her business. ");
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
	output("\n\nThe taste of your trappy lover is sweeter than the ambrosia she trickles into your mouth, but you lap that up all the same, running your tongue from her crotch to her navel in long, steady licks. Del shivers, ");
	if(!pc.hasHair()) output("caressing your scalp");
	else output("running her fingers through your [pc.hair]");
	output(" and squeezing her slender legs around your shoulders. Her ");
	if(chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("drooling equine dick");
	else output("girly little prick");
	output(" throbs under her skirt, squirting all over her thighs.");

	output("\n\n<i>“W-why am I getting off on this so much?”</i> she giggles, crossing her ankles behind your back, pulling your [pc.face] into her liquored-up belly. <i>“Whatever! Just don’t stop ‘till this bottle’s empty.”</i>");
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
	pc.lust(33);
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
	output("\n\nDel visibly shudders. <i>“Sure, if you really want. Ugh, just thinking about that big-titted skank makes my skin crawl. She’s a slaver - like, an actual real slaver - I’m sure of it. The way the other girls I was with talked about her, she’d constantly be trying to screw you into going deeper and deeper into debt. Make you buy mods, pay huge prices for rent... you’re supposed to give debtees a way to pay their way to freedom, but she’s just like any stupid corporation: she’ll fuck you until you’re hers forever.”</i>");
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
	output("\n\n<i>“I don’t know,”</i> she says, shrugging lightly. <i>“Kind of? I still have a lot of debt to pay off, and when I do... I don’t exactly have a lot going for me, you know. Guess I’d have to move back in with my parents for a little bit, find a job somewhere, or go work for them. Just ‘till I get back on my feet.”</i>");
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
	if(pc.hasVagina()) addButton(1,"Face Sitting",sitOnDelsFaceAtKallys,undefined,"Face Sitting","Sit on Del’s Face.");
	else addDisabledButton(1,"Face Sitting","Face Sitting","You need a vagina to really enjoy this.");
	addButton(14,"Back",delCanadiaMeeting);
}

//Fuck Her Ass
public function fuckDelsAss():void
{
	clearOutput();
	showDel(true);
	currentLocation = "CANADA7";
	generateMap();
	var x:int = pc.cockThatFits(chars["DELILAH"].analCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("<i>“How about you let me play with this new ass of yours?”</i> you say, grinning lustfully at the curvy bimbo-body pressed up against you. <i>“For old time’s sake.”</i>");
	output("\n\n<i>“How ‘bout just for ‘I’m horny as hell’s’ sake?”</i> she giggles, grinding against you in excitement at the prospect of another taste of your bitch-breaking cock. At your word, she obediently slips out of your lap and back to the baths, spinning around to present her hindquarters to you, getting more than a few cat-calls from her customers as she makes ready for her upcoming ordeal. Her chocolate-hued cheeks flush as she slips her hands up under her skirt... and slips her panties right down. Tossing the pink silk aside, she chews her lips, awaiting your command. ");
	if(chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("Her massive equine endowment throbs half-hard between her legs, dangling out from under her skirt.");
	else output("Del moans breathlessly, rubbing at her tiny prick through her skirt, eeking out some pleasure for herself while you enjoy the show.");

	output("\n\nYou reach forward and under her skirt, groping her ass with both hands. Using your thumbs, you spread her chubby cheeks, revealing the dark little cock-hole nestled between them. Her dick throbs under your inspection, drooling a little streak of white onto the hem of her skirt. Cute. You snake one of your thumbs into her crack, gently pressing it against her well-used hole - just enough to make her gasp and get nice and hard, but not enough to actually spread her open. Not that it would take much, considering how much cock this trap-slut’s seen since you first met.");
	output("\n\n<i>“You’re gonna want to get me ready,”</i> you suggest, giving her a playful slap that sets her bubbly cheeks jiggling.");
	output("\n\nDel spins on her high heels and grins. <i>“Yes, " + pc.mf("sir","ma’am") + "!”</i>");
	output("\n\nShe eagerly drops to her knees, already oh so eager for a taste of your cock. She opens wide, ready to recieve your package. You step forward, tossing your equipment onto a bench and grabbing your [pc.cock " + x + "]. A few fast strokes have you at the ready, the turgid shaft of your prick looming over the trappy whore’s face, your crown practically pushing against her lips. She only manages to hold herself back for a few seconds before her tongue stretches out, caressing the crown of your cock.");
	output("\n\n<i>“My favorite snack! Mmm, I love the taste of your cock...”</i> she purrs, nuzzling the shaft of your [pc.cock] affectionately as her tongue lavishes it with affection. <i>“The first... and the best...”</i> she adds happily, planting a kiss on the tip. You shudder as the sensation of her tongue on your most sensitive flesh snakes through your body, and you’re forced to grip a rail to support yourself, [pc.legs] shaky under the startlingly skilled ministrations of the trappy slut.");
	output("\n\n<i>“Juuust like that,”</i> you moan through clenched teeth, trying to control yourself. Your fingers snake through the whore’s blonde-dyed hair, coaxing her on as she licks and kisses at the underside of your member, slowly but surely working herself up to taking it wholesale. ");
	if(pc.balls > 1) output("But first, she lets a hand wander free up one of your [pc.legs], caressing the tender flesh slowly as she works up to your base, hands cupping your swinging sack, rolling your nads between her dainty little fingers. The slutty, dusky whore grins up at you, her mouth trailing kisses down your girthy length until she can lap at your [pc.balls], lavishing your hefty nuts with the tip of her eager tongue before opening wide and swallowing them up, suckling on your gonads like a pair of teats. You groan and shudder, trying not to cum as your sexy shemale slut sucks on your sack like the pro she’s turned out to be.");

	output("\n\nFinally, the cock-craving whore makes her way back up to the crown of your cock, slowly opening her lips to welcome in your manhood and ");
	if(chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("spreading her knees to giver her hands access to her throbbing equine hardon. She’s well and truly used to everyone in the bar oggling her horsecock, just like they do to her mistress, so she shows no shame in wrapping both hands around her member and stroking it from flare to medial ring.");
	else output("blatantly spreading her legs, one hand fully disappearing under her skirt and up her wanton hole in preparation, teasing her tiny masculinity from behind and making it jump in response. The surge of her erection wholly throws back the hem of her skirt, leaving her cock for all to see");
	output(". You guide her forward, easing her lips around the swell of your schlong, shuddering as you feel her wet, warm embrace wrapping around you, sucking and squeezing oh so wonderfully. Gods, she was born for this! You stifle a little moan as she ");
	if(pc.cocks[x].cLength() < 12) output("takes you to the hilt, your [pc.cock " + x + "] vanishing down her throat");
	else output("sucks up every inch she can manage, choking down more than a foot of cockmeat before finally giving in, her throat utterly bulging with your massive girth stretching her pussy-like gullet wide.");

	output("\n\n<i>“Good little slut,”</i> you coo, stroking her bleach-blonde hair. <i>“You’ve gotten so good at this. I bet Kally just loves you.”</i>");

	output("\n\nShe murmurs a response, muffled by the thick cock in her mouth into an unintelligible babble that sends trickles of pre-slick drool down her chin. You chuckle and pat her on the head, reassuring her as to what a good little cocksucker she is as you gently guide her back from your prick until just the crown is spearing her lips. You give her a little push, pressing her back against the hard front of the bench as you shift forward, getting ready to get a right proper cock-shining. With her head against the solid wood, there’s nowhere for her to recoil as you slam your hips forward, thrusting your prick into her mouth");
	if(pc.balls > 1)
	{
		if(pc.cocks[x].cLength() >= 12) output(" until her throat is bulging with your massive meat, so much crammed down her that she looks ready to burst");
		else output(" until your [pc.balls] slap her chin");
	}
	output(". The trap-slut gags and cries out as she’s suddenly and violently face-fucked, but the growing crowd around the two of you cheers as you fill her mouth with cock.");

	output("\n\nThe trappy bartender’s got little to do but sit and take it, slumping against the bench as you hold her head steady, using and abusing her mouth as your own personal warm, wet cocksleeve. Your thrusts soon have the poor lady-boy drooling freely, spittle rolling down her chin and onto the ");
	if(!chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("tiny tent");
	else output("massive, throbbing shaft");
	output(" of her cock, which she’s now feverishly working, abandoning any masquerade of restraint under the punishing beat of your oral assault. You grin down at the dickgirl whore as she jacks off, too horny to stop herself.");

	output("\n\nWith your cock sufficiently slathered with her spit, and with Del herself all nice and hard and ready to fuck, you steadily slow your pelvic thrusting, finally stopping with the head of your cock on her lips.");

	output("\n\n<i>“Kiss it,”</i> you command, holding the shemale slut’s gaze as your cock sits of the swell of her lower lip expectantly.");

	output("\n\nDel doesn’t hesitate, planting a tongue-filled parting kiss on the crown of your cock. She wraps her lips around the head one last time, making sure to slather it with her tongue. By the time she’s through, a thick sheen of spit’s glazed across your tender flesh, bridges of it still connecting you to the dusky slave-girl.");

	output("\n\nWith your cock nice and lubed up thanks to Delilah’s succulent little mouth, you grab the slender girly-boy by the shoulder and heft her up onto the bench, letting her ample ass press hotly onto the polished wood. She gives you a questioning look... until your hands slip up her slender legs, hooking through the hem of her skirt and gently pulling it off, leaving her bare to the world. Or at least, the growing circle of interested spectators, many of whom are pitching tents ");
	if(!chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("by the time the bartender’s tiny little cock pops free,");
	else output("much like Del’s own horsecock, which is");
	output(" left to hang flag-pole like as you push her down and spread her legs to give yourself a clear shot to the real prize on offer. You hoist her legs over your shoulders and step up to the plate, your [pc.cock " + x + "] dropping into the crevasse between her thigh and groin before dragging down to the gently-parted crack of her succulent little ass.");

	output("\n\n<i>“Go on,”</i> Del coos, wiggling her hips enticingly as your crown presses into her dark star, practically being drawn in by her well-used hole, <i>“I’m soooo ready for it. Ram it on in!”</i>");

	processTime(21);
	pc.lust(50);
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

	stretchDelilahsButt();
	pc.cockChange();

	output("\n\nBut that’s the last kindness you’re going to show this wanton whore’s little pucker. You draw yourself only half-way out before slamming back home, thrusting back with all the force your [pc.hips] can muster, sending shockwaves through the flesh of the lusty slut’s bubble butt. Her prick jumps in response to your next thrust, hopping straight up and twitching visibly as a bead of creamy white beads at its tip. You consider giving her a little tug to help her along, but then... that’d defeat the purpose! This slut’s supposed to be a little anal whore, so by God that’s what she’ll be. You reaffirm your grip on her broad hips and start pounding with a vengeance, faster and harder until Del’s whining and moaning with every push, crying her pleasure aloud with utter abandon. You can barely reconcile the bashful little trap you met back on Tarkus with this moaning, giggling whore, spilling cum all over her own belly as you pound her ass.");
	output("\n\nBetween the sloppy blowjob she gave you and now the tight, wringing grip of the shemale’s cock-draining boypussy, you don’t know how long you’re going to hold out. Her ass feels like a vice, so tight around your [pc.cock " + x + "] that it’s nearly painful, yet with every thrust you can feel the twitch and spasm of her muscles as her little sphincter tries to push you out or draw you in, you’re never sure. Either way, it’s making a tight, wet, squirming hole for you to fuck, ushering you inexorably towards your now-inevitable orgasm.");
	output("\n\nYou feel your cock swelling inside her, cum rushing through your [pc.cock " + x + "] towards the waiting receptacle of the trap-whore’s wanton hole. She seems to sense the oncoming climax, and responds with a shrill yelp of pleasure, her own cock twitching madly, so close yet so far from orgasm. She reaches up and grabs your shoulders, clutching tightly at you as you flood her bowels with cum. Shockwaves of pleasure tear through your body as [pc.cumColor] ropes let loose from your [pc.cock], smearing the trap’s rectal walls with your sticky seed. Your [pc.hips] piston away, thrusting you as deep into her ass as you can go before you’ve finished, making sure to bust your nut straight into her spasming colon, giving it a taste of cum before you’re finally finished.");
	output("\n\nYou shudder with an absolute contentment, panting heavily as your cock starts to deflate in Delilah’s well-fucked ass. Before you can get comfortable, though, the sultry slut gives you a gentle push back, popping your prick free of her gaping asshole amidst a backwash of spent seed. Grinning hungrily, Del slips down off the bench and onto her knees, wrapping both her hands around your half-soft cock.");
	output("\n\n<i>“Don’t wanna waste any of the good stuff,”</i> she grins, flicking her tongue around the glaze of [pc.cum] still clinging to your [pc.cockHead " + x + "]. You shiver and grab the bench, trying to keep steady footing as the cum-hungry dickgirl spit-shines your rod, bobbing her head up and down your length until she’s cleaned off every last drop of your [pc.cum]. Once your dick is glistening-clean, Del gets down on all fours and starts wiping the spent spunk off the floor, her clothes, and her own cock... really just the entire, messy splatter-zone you two have left. She happily slurps up every drop, no matter where it’s been or who it’s from. More than one of the gathered onlookers adds to the mess, too - busting their own loads over Del’s back, her face, or just onto the floor for her to clean up - and she’s never looked happier.");
	output("\n\nIt doesn’t take long before somebody’s hoisted her back onto the bench and thrust into her still-open asshole, using your cum as lube to ream her hard. You give Del a little wink and step back, collecting your gear and leaving her to satisfy her owner’s horny patrons.");
	processTime(20);
	pc.orgasm();
	
	timesDelilahSexed(1);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sit on Del’s Face
//Now works for [pc.vagOrAss " + x + "]. PC still needs a gender tho.

public function sitOnDelsFaceAtKallys():void
{
	clearOutput();
	showDel(true);
	author("Savin");
	currentLocation = "CANADA7";
	generateMap();
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());

	output("You grin lustily at the feminized beauty pressed up against you, letting your hands wander down her back and over her jiggly behind. As nice as her ass is, your eyes fix on another prize: her full, pink-hued lips, glistening in the sultry light of the rustic lodge.");
	output("\n\n<i>“Why don’t you get up on the bar for me, cutey?”</i>");
	output("\n\nThe bartender babe blushes, practically melting into your arms, all but begging to be shown her proper place underneath you once again. <i>“Miss Kally said I had to stop doing that in the common area, but the baths are okay... This way.”</i>");
	output("\n\nYou follow behind, slapping her on the ass to speed her on her way. Neither of you pays much attention to the doorway as you pass through it, only each other and a nearby bench that’s just the right height. She obediently clambers up onto it, getting more than a few cat-calls from lounging bathers as she makes ready for her upcoming ordeal, cheeks flushed bright red as she slips her hands up under her skirt... and slips her panties right down. Tossing the pink silk aside, she chews her lips, awaiting your command and trying not to ");
	//hosscawk;
	if(chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("draw too much attention to the pillar of meat starting to get hard between her legs.");
	else output("give away the fact that her little knee-skirt is tenting something awful.");

	output("\n\nYou step forward, tossing your equipment on a bench and hopping up behind the effeminate bartender, giving her a little push onto her back. She gives a little gasp as she flops down, legs spreading reflexively, giving you easy access to the tight, dark hole between them. But that’s just an added bonus. You’re much more interested in her cute little mouth...");

	output("\n\nYou crawl up her svelte, buxom body, slowly pulling up her skirt to leave her groin and hips bare. The ");
	if(!chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("tiny little cock");
	else output("hefty equine erection");
	output(" she’s packing ends up pointing skyward like a flagpole, and its owner squirms and moans as you leave her prick exposed to the bar crowd, now slowly gathering around you. Looks like you’ve got an audience!");
	if(pc.exhibitionism() >= 66) output(" Hot.");
	else output(" Oh well... you’ll just have to try and perform regardless!");
	output(" You plant your [pc.knees] on the trap’s shoulders, pinning her down to the bench for a moment as you ditch the last of your gear, making a bit of a show if it for your new fans - especially as you get down towards your groin. You can already feel the heat welling up inside you, eagerly awaiting a taste of the submissive little slut’s tongue");
	if(!pc.isCrotchExposed() && !pc.isAssExposed()) output(", and as the last bits of your equipment fall aside, it’s a sweet relief to let it kiss the cool air.");

	output("\n\nThat’s not the only thing that’s going to be kissing it, either. You let a pair of fingers slink down to your ");
	if(x >= 0) output("[pc.cunt " + x + "], spreading the lips of your labia wide just shy of the trap’s chin, almost close enough to let your excitement drool down into her lips.");
	else output("[pc.asshole], fingering your rim and pushing in against your own dark star, just to the knuckle, before withdrawing and presenting your ass to the slutty bartender.");

	output("\n\nDel blushes, licking her lips. <i>“I love the taste of ");
	if(x >= 0) output("your pussy juices");
	else output("another slut’s ass");
	output(", [pc.Master],”</i> she coos, eyes transfixed by your slit”</i>}. Slowly, her tongue slips out from her dark lips, one long slurp across your [pc.vagOrAss " + x + "]. You shudder as the sensation of her tongue on your most sensitive flesh snakes through your body, and you’re forced to grip the bench to support yourself, [pc.legs] shaky under the startlingly skilled ministrations of the trappy slut. Maybe in her previous life, she might have been pretty popular with the ladies...");
	if(x < 0) output(" Or maybe the jocks at her school just used her to tongue-clean them enough that she got good at it. Would explain a lot.");
	output("\n\nYou let yourself give a little moan as the trap-slut goes down on you, tongue delving deep ");
	if(pc.hasVagina()) output("between your folds");
	else output("into your [pc.asshole]");
	output(". <i>“That’s it, girl... Now, why don’t we have you do the alphabet?”</i>");

	output("\n\n<i>“Mmhm!”</i> Del grins, going to work immediately, putting her hard-earned skills to use without much more prompting than that. What a good ");
	if(x >= 0) output("rug-muncher");
	else output("ass-licker");
	output(" you’ve made!");

	output("\n\nNice and slow, your subby slut starts to do as you commanded, tongue working out a great big <i>“A”</i> inside your [pc.vagOrAss " + x + "]. You glance over your shoulder, to the rigid stiffy poking out from beneath the hem of Deliliah’s skirt. Something in your memory jogs a thought about positive reinforcement, and you reach under the bench to pick up the feather duster hanging on a nail. Nice. You reach behind your [pc.hips], teasing along her flat stomach until you feel the soft feathers brushing the silky skirt... and then something nice and hard.");

	output("\n\nDelilah reacts instantly, legs twitching and tongue freezing as you brush her ");
	if(!chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("little cock");
	else output("growing pillar of horsemeat");
	output(". <i>“Who told you to stop?”</i>");

	output("\n\nIn return, you stop your brush mid-stroke, the head of her cock entombed in a bed of feathers. With a soft groan, the trappy bartender starts to move her tongue again, forming <i>“M”</i> and <i>“N,”</i> the tops of those letters treading awful close to your ");
	if(x >= 0) output("[pc.clit]");
	else output("prostate");
	output(", sending shivers up your spine. You return the favor, circling her cock with your duster, even reaching back to tease her balls and thighs when she gets to a delightfully slow <i>“Q”</i> and <i>“R.”</i>");
	output("\n\n<i>“You just keep getting better at this,”</i> you grin, taking pride in your work in breaking Del in, molding her into this submissive, horny whore. <i>“Now, make me cum, and I’ll do the same for you.”</i>");
	output("\n\nThat’s all the encouragement she needs to lunge for <i>“Z,”</i> tongue working deeper and deeper into your [pc.vagOrAss " + x + "]");
	var wetness:Number = 0;
	if(x >= 0) wetness = pc.wetness(x);
	else wetness = pc.ass.wetness();
	if(wetness >= 3) output(", face getting more and more drenched with your excitement ");
	output("as her talented tongue works its wonders. You decide to give her a little reward, relaxing yourself and letting go, trying to cum by the time she hits that final letter. [pc.Hips] bucking and chest heaving with your quickening breath, you find yourself on the precipice before you know it, and just as her tongue forms the back of the <i>“Z,”</i> your [pc.vagOrAss " + x + "] starts to contract, all but trapping her tongue between its walls as your start to climax, throwing your head back with a cry of pleasure");
	if(wetness >= 4) output(" as Delilah’s face is plastered with girlcum");
	output(".");
	output("\n\nBut you’re not letting her off the hook this early. Shuddering, you try to recover yourself as the dickgirl’s head rests back, thinking herself done. Not quite!");
	output("\n\n<i>“That was the English alphabet,”</i> you grin, swinging around to a reverse-cowgirl post over her head. <i>“Now let’s see about the Ausar alphabet.”</i>");
	output("\n\nYour thighs are nice and drenched, but it doesn’t stop your oral protege from going back to work, now half-mad from lust and pleasure as you start back on her cock, one hand wrapping around her ");
	if(!chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("tiny little trap-sack");
	else output("black, veiny horseballs");
	output(" as the other dusts off her glans, wiping away the accumulated pre-seed on its tip. The two of you soon come to something of a rhythm: for every curve of the flowing ausar script, another squeeze of the sack or a flick of the featherduster. Your pace picks up as she gets closer and closer to the edge, hips twitching up as you squeeze and massage her balls, steadily milking out what promises to be a nice, big load from the trappy fuck-slut.");
	output("\n\nWhen she cums, it’s everything you were hoping it would be. With a cry and a buck of her hips, the cock in your hand erupts into a geyser of spooge, drenching the duster and your fingers in a nice, thick layer of creamy spunk. She gives a final gasp and slumps back, having finally achieved a sweet release. You swing your [pc.hips] back around, looking down on her blissed-out face, cum-dumped featherduster still in hand.");
	output("\n\n<i>“You got me dirty,”</i> you chide, putting a spunky fingertip to her lips. She opens wide for you. <i>“You gotta clean up after yourself, little girl.”</i>");
	output("\n\n<i>“Delicious,”</i> she grins, tongue lapping up her salty seed like a good little whore. You make sure your hands are spotless before swinging off the bench, hiking her legs off the edge to put her ass in the air for the next customer. She gives a sharp cry of pleasure as she’s quickly speared on a glistening dick, leaving you to get your gear and catch your breath.");
	processTime(45);
	pc.orgasm();
	
	timesDelilahSexed(1);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*OLD Sit on Del’s Face - CODED BEFORE SAVIN ACTUALLY FINIHSED IT.
public function sitOnDelsFaceAtKallys():void
{
	clearOutput();
	showDel();
	output("You grin lustily at the feminized beauty pressed up against you, letting your hands wander down her back and over her jiggly behind. As nice as her ass is, your eyes fix on another prize: her full, pink-hued lips, glistening in the sultry light of the rustic lodge.");
	output("\n\n<i>“Why don’t you get up on the bar for me, cutey?”</i>");
	output("\n\nThe bartender babe blushes, practically melting into your arms, all but begging to be shown her proper place underneath you once again. She obediently clambers up onto the bar, getting more than a few cat-calls from her customers as she makes ready for her upcoming ordeal, cheeks flushed bright red as she slips her hands up under her skirt... and slips her panties right down. Tossing the pink silk aside, she chews her lips, awaiting your command and trying not to ");
	if(chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("draw too much attention to the pillar of meat starting to get hard between her legs.");
	else output("give away the fact that her little knee-skirt is tenting something awful.");
	output("\n\nYou step forward, tossing your equipment onto the bar and hopping up behind the effeminate bartender, giving her a little push onto her back. She gives a little gasp as she flops down, legs spreading reflexively, giving you easy access to the tight, dark hole between them. But that’s just an added bonus. You’re much more interested in her cute little mouth...");
	output("\n\nYou crawl up her svelte, buxom body, slowly pulling up her skirt to leave her groin and hips bare. The ");
	if(!chars["DELILAH"].hasCock(GLOBAL.TYPE_EQUINE)) output("tiny little cock");
	else output("hefty equine erection");
	output(" she’s packing ends up pointing skyward like a flagpole, and its owner squirms and moans as you leave her prick exposed to the bar crowd, now slowly gathering around you. Looks like you’ve got an audience! ");
	if(pc.exhibitionism() >= 66) output("Hot.");
	else output("Oh well... you’ll just have to try and perform regardless!");
	output(" You plant your [pc.knees] on the trap’s shoulders, pinning her down to the bar for a moment as you ditch the last of your gear, making a bit of a show if it for your new fans - especially as you get down towards your groin. You can already feel the heat welling up inside you, eagerly awaiting a taste of the submissive little slut’s tongue");
	if(!pc.isCrotchExposed() && !pc.isAssExposed()) output(", and as the last bits of your equipment fall aside, it’s a sweet relief to let it kiss the cool air");
	output(".");

	output("\n\nThat’s not the only thing that’s going to be kissing it, either. You let a pair of fingers slink down to your [pc.vagina], spreading the lips of your labia wide just shy of the trap’s chin, almost close enough to let your excitement drool down into her lips.");
	//if 1-4:
	if(flags["DEL_FACESAT"] == undefined || flags["DEL_FACESAT"] < 5) output(" <i>“Wait... you... you really want me to... to...”</i> she sputters indignantly, trying to hide the little tentpole between her slender legs");
	else output(" She blushes, licking her lips. <i>“I love the taste of your pussy juices, mistress,”</i> she coos, eyes transfixed by your slit”</i>");
	output(". Slowly, her tongue slips out from her dark lips, one long slurp across your [pc.cunt]. You shudder as the sensation of her tongue on your most sensitive flesh snakes through your body, and you’re forced to grip the bar to support yourself, [pc.legs] shaky under the startlingly skilled ministrations of the trappy slut. Maybe in her previous life, she might have been pretty popular with the ladies...");
	output("\n\nYou let yourself give a little moan as the trap-slut goes down on you, tongue delving deep between your folds. <i>“That’s it, girl... Now, why don’t we have you do the alphabet?”</i>");

	if(flags["DEL_FACESAT"] == undefined)
	{
		output("\n\n<i>“Hrm?”</i> the bartender murmurs, voice muffled in your muff.");
		output("\n\n<i>“The alphabet, dumb slut! Use your tongue to make the letters. Of every alphabet you know.”</i>");
	}
	//2-4th time:
	else if(flags["DEL_FACESAT"] < 4)
	{
		output("\n\n<i>“Again?”</i> Deliliah groans, coming up for air, <i>“I think I got the idea.”</i>");
		output("\n\nYou tsk your tongue. <i>“Fine, then maybe you’d rather I bend you over this bar and see if that duster will fit up your pussy, huh?”</i>");
		output("\n\n<i>“Alright, alright,”</i> she cries, getting to work.");
	}
	//5th+ time:
	else
	{
		output("\n\n<i>“Mmhm!”</i> Del grins, going to work immediately, putting her hard-earned skills to use without much more prompting than that.");
	}
	output("\n\nNice and slow, your subby slut starts to do as you commanded, tongue working out a great big <i>“A”</i> in the lips of your [pc.vagina]. You glance over your shoulder, to the rigid stiffy poking out from beneath the hem of Deliliah’s skirt. Something in your memory jogs a thought about positive reinforcement, and you reach under the bar to pick up the feather duster hanging on a nail. Nice. You reach behind your [pc.hips], teasing along her flat stomach until you feel the soft feathers brushing the silky skirt... and then something nice and hard.");
	output("\n\nDelilah reacts instantly, legs twitching and tongue freezing as you brush her little cock. <i>“Who told you to stop?”</i>");
	output("\n\nIn return, you stop your brush mid-stroke, the head of her cock entombed in a bed of feathers. With a soft groan, the trappy bartender starts to move her tongue again, forming <i>“M”</i> and <i>“N”</i>, the tops of those letters treading awful close to your [pc.clit], sending shivers up your spine. You return the favor, circling her cock with your duster, even reaching back to tease her balls and thighs when she gets to a delightfully slow <i>“Q”</i> and <i>“R.”</i>");

	if(flags["DEL_FACESAT"] == undefined) output("\n\n<i>“Getting the hang of this, aren’t you?”</i> you grin, taking the time to stroke the lady-boy’s hair. <i>“Keep this up, and I might just let you cum.”</i>");
	else output("\n\n<i>“You just keep getting better at this,”</i> you grin, taking pride in your work on Beth’s newest toy. <i>“Now, make me cum, and I’ll do the same for you.”</i>");

	output("\n\nThat’s all the encouragement she needs to lunge for <i>“Z,”</i> tongue working deeper and deeper into your [pc.vagina], face getting more and more drenched with your excitement as her talented tongue works its wonders. You decide to give her a little reward, relaxing yourself and letting go, trying to cum by the time she hits that final letter. [pc.Hips] bucking and chest heaving with your quickening breath, you find yourself on the precipice before you know it, and just as her tongue forms the back of the <i>“Z,”</i> your [pc.cunt] starts to contract, all but trapping her tongue between its walls as your start to climax, throwing your head back with a cry of pleasure as Delilah’s face is plastered with girlcum.");
	output("\n\nBut you’re not letting her off the hook this early. Shuddering, you try to recover yourself as the trap’s head rests back, thinking herself done. Not quite!");
	output("\n\n<i>“That was the English alphabet,”</i> you grin, swinging around to a reverse-cowgirl post over her head. <i>“Now let’s see about the Ausar alphabet.”</i>");
	output("\n\nYour thighs are nice and drenched, but it doesn’t stop your oral protege from going back to work, now half-mad from lust and pleasure as you start back on her cock, one hand wrapping around her tiny little trap-sack as the other dusts off her glans, wiping away the accumulated pre-seed on its tip. The two of you soon come to something of a rhythm: for every curve of the flowing ausar script, another squeeze of the sack or a flick of the featherduster. Your pace picks up as she gets closer and closer to the edge, hips twitching up as you squeeze and massage her balls, steadily milking out what promises to be a nice, big load from the trappy whore-to-be.");
	output("\n\nWhen she cums, it’s everything you were hoping it would be. With a cry and a buck of her hips, the cock in your hand erupts into a geyser of spooge, drenching the duster and your fingers in a nice, thick layer of creamy spunk. She gives a final gasp and slumps back, having finally achieve a sweet release. You swing your [pc.hips] back around, looking down on her blissed-out face, cum-dumped featherduster still in hand.");
	if(flags["DEL_FACESAT"] == undefined || flags["DEL_FACESAT"] < 4)
	{
		output("\n\n<i>“Wh-what are you...”</i> she starts to ask, but realization dawns as your cum-blasted hand looms over her mouth.");
		output("\n\n<i>“You got me dirty,”</i> you chide, putting a spunky fingertip to her lips, which she quickly seals. <i>“You gotta clean up after yourself, little girl.”</i>");
		output("\n\nShe resists, but your insistent pressure on her lips finally forces her to relent, and she’s soon slurping up her own cum off your fingers, much to the delight of the crowd now gathered around you (many of whom are sporting tents of their own, clearly ready to get in on the action when you’re done). You make sure your hands are spotless before swinging off the bar, hiking her legs off the edge to put her ass in the air for the next customer. She gives a sharp cry as she’s quickly speared on a dick, leaving you to get your gear and catch your breath.");
	}
	else
	{
		output("\n\n<i>“You got me dirty,”</i> you chide, putting a spunky fingertip to her lips. She opens wide for you. <i>“You gotta clean up after yourself, little girl.”</i>");
		output("\n\n<i>“Delicious,”</i> she grins, tongue lapping up her salty seed like a good little whore. You make sure your hands are spotless before swinging off the bar, hiking her legs off the edge to put her ass in the air for the next customer. She gives a sharp cry of pleasure as she’s quickly speared on a dick, leaving you to get your gear and catch your breath.");
	}
	IncrementFlag("DEL_FACESAT");
	processTime(45);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
*/