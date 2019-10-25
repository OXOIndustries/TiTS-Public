/*
 Flaggy flags:
ARDIA_CREW: 1 for in ship, 0 for recruited but off the ship, -1 for freed
ARDIA_DOMME_LEVEL: 0-10, measures dommeness. Overridden by ARDIA_IMMUNE, if not undefined.
*/
import classes.Items.Toys.Bubbles.ArdiasCum;

// No longer placeholder func. Yay.
public function ardiaIsCrew():Boolean
{
	return flags["ARDIA_CREW"] == 1;
}

public function ardiaRecruited():Boolean
{
	return flags["ARDIA_CREW"] >= 0; // make sure this works with undefined later!!!
}

public function ardiaInZhengShi():Boolean
{
	return flags["ARDIA_CREW"] == undefined;
}

public function showArine(nude:Boolean = false):void
{
	showName("\nARINE");
	showBust(arineBustDisplay(nude));
}

public function arineBustDisplay(nude:Boolean):String
{
	return "";
}

public function showArdiaAndMom(nude:Boolean = false):void // nude will probably never be used but best make sure
{
	showName("ARDIA\nAND MOTHER");
	showBust(ardiaBustDisplay(nude), arineBustDisplay(nude));
}

public function getArine():Creature
{
	var arine:Creature = new PregnancyPlaceholder();
	arine.removeCocks();
	arine.cocks.push(ardia.cocks[0]);
	arine.createPerk("Fixed CumQ", 5000);
	return arine;
}

public function ardiaDommeLevel(arg:int = 0, apply:Boolean = false):int { return ardiaDomLevel(arg, apply); }
public function ardiaDomLevel(arg:int = 0, apply:Boolean = false):int
{
	if (flags["ARDIA_DOMME_LEVEL"] == undefined) flags["ARDIA_DOMME_LEVEL"] = 0;

	if (immuneToArdia()) return flags["ARDIA_DOMME_LEVEL"];
	if (!addictedToArdia()) return flags["ARDIA_DOMME_LEVEL"];

	if (apply) flags["ARDIA_DOMME_LEVEL"] = arg;
	else if (!apply) flags["ARDIA_DOMME_LEVEL"] += arg;

	if (flags["ARDIA_DOMME_LEVEL"] < 0) flags["ARDIA_DOMME_LEVEL"] = 0;

	var maxArdiaDomme:int = (ardiaInZhengShi() ? 3 : 10);
	if (flags["ARDIA_DOMME_LEVEL"] > maxArdiaDomme) flags["ARDIA_DOMME_LEVEL"] = maxArdiaDomme;

	return flags["ARDIA_DOMME_LEVEL"];
}

public function ardiaWithdrawal():Boolean
{
	return pc.hasStatusEffect("Dzaan Withdrawal");
}

public function immuneToArdia():Boolean
{
	return flags["ARDIA_IMMUNE"] != undefined;
}

public function ardiaHugeBalls():Boolean
{
	return ardia.ballSize() >= 17;
}

public function ardiaGetToTheChoppaIMeanShip():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");
	processTime(4);

	output("Now that you've freed both major groups of slaves, that's probably the most you can hope to really accomplish in terms of abolitionism on Zheng Shi. But you can think of one slave that still needs to be rescued, and that's Ardia herself.");
	output("\n\nThe caramel beauty smiles and hefts herself to her feet. <i>\"Really? That's.... that's great! I've been low-key terrified somebody's going to come in here and realize Argy here's been passed out for who knows how long. Maybe they just don't like him very much. Either way, I'm ready to go when you are!\"</i>");
	output("\n\n<i>\"How about now?\"</i>");
	output("\n\nShe giggles and bounces, a gesture that makes her huge tits and fat balls quake hypnotically beneath her skin-tight slave jumper. You can't pry your eyes off her until she's finally stopped moving, blue lips drawn back in an irrepressible smirk. She offers you a hand up, and when you take it, she pulls you into a fierce hug. <i>\"Thank you! Go on, [pc.name], lead the way!\"</i>");
	output("\n\nYou do so, stepping over the still-subdued thraggen's stomach and leading the chubby dzaan by the hand out onto the forge's main floor. With the L.D.C. and his cronies put in their place, you don't think you'll have too much trouble getting back to the spacedock. The jumpers, at least, give you a wide berth; the rest of the pirates must think you're one of them, leading a slave girl off for your own lascivious purpose.");
	output("\n\nInstead, you take her straight down to the docks, where your ship is parked and waiting.");

	if (shits["SHIP"] is Sidewinder) // 9999 CHANGE THIS WHEN SHIPS GET BETTER
	{
		output(" Adria skids to a stop as soon as she lays eyes upon it, almost pitching forward on the balls of her feet. <i>\"T-t-that's the pirate's special ship, innit?\"</i>");
		output("\n\n<i>\"Was,\"</i> you tell her. Their leader didn't need it anymore after you sent him hop-hopping off. Now, it's yours.");
		output("\n\nArdia lets out a sharp whistle, looking your new flagship up and down. <i>\"That's a heck of a ship. Wanna show me around?\"</i>");
		output("\n\nAbsolutely.");
	}
	else
	{
		output(" <i>\"Nice ship,\"</i> she muses, glancing it up and down. <i>\"Reminds me of one my folks used to own.\"</i>");
		output("\n\nGood, then she'll feel right at home. ");
		output("\n\nArdia gives you a half-smile and marches towards the airlock. <i>\"Maybe, but why don't you show me around anyway?\"</i>");
	}

	moveTo(shipLocation);

	addButton(0, "Next", meetTheArdiaMILF);
}

public function meetTheArdiaMILF():void
{
	clearMenu();
	clearOutput();
	showArdiaAndMom();
	author("Savin");
	processTime(7);

	output("You spend the next several minutes escorting Ardia around");
	if (crew(true) > 0) output(" and introducing her to the crew");
	output(". She clings tight to your arm all the while, as if she's afraid some hidden pirate is primed to leap from the shadows and drag her back into captivity. You're sure she's anxious to get off this station, and indeed, as soon as you've finally brought her up to the bridge, the dzaan gives you an apologetic smile and asks, <i>\"Hey, c-can I borrow your comms? I wanna call my folks, let 'em know I'm okay.\"</i>");
	output("\n\nYou nod and bring them up for her. A few taps later and your ship's being connected to Hauâ Mai, accompanied by a jaunty tropical logo advertising some large resort. When the connection finalizes, the screen wipes over to a reclining view of a tall, bottom-heavy dzaan dressed in a low-cut business blouse that absolutely flatters her amazonian figure. Like your companion, she's got rich dark skin and sports a vibrant cut of green hair.");
	output("\n\n<i>\"Yes, hello -- Ardia! Darling!\"</i> the woman gasps, dropping a martini glass to shatter on the floor. <i>\"You're okay, thank all the gods. Where have you been?\"</i>");
	output("\n\nArdia sniffles and smiles at the camera, <i>\"I'm okay, mom! I'm alright now. Captain [pc.name] Steele here saved me from a whole space station full of pirates. We're just getting ready to leave, but I wanted you to know I'm okay.\"</i>");
	output("\n\nYou can see tears welling up in her mother's eyes, but the older alpha wipes them away with the back of a gloved hand. <i>\"I'm so glad. You have no idea how worried I was, especially when we never got any kind of ransom notice. Your mother and I were beginning to fear the worst...\"</i>");
	output("\n\n<i>\"Yeah, apparently you were right... I'm prime pleasure slave stock. They weren't interested in letting me go. Just thank Captain Steele for rescuing me before anything really bad happened.\"</i>");
	output("\n\n<i>\"A-ah, yes, of course. Thank you so much, captain,\"</i> her mother sighs, glancing over to you for the first time. <i>\"Truly, words can't express my gratitude for bringing my baby girl back to me. I hope, at least, I'll be able to thank you in person when you arrive...\"</i>");
	output("\n\nAssuming that you don't want Ardia to stick around...");

	moveTo("SHIP INTERIOR");

	addButton(0, "Recruit", (addictedToArdia() ? takingYourAlphaCumDispenserOnYourSpessAdventure : takingArdiaOnYourSpessAdventure), undefined, "Recruit Ardia", "Add the chubby alpha alien to your crew. Only amazing things will come of having a dickgirl with chemically addictive cum aboard.");
	if (addictedToArdia()) addDisabledButton(1, "Don't", "Don't", "You couldn't possibly say goodbye to the dusky dickgirl. You can't live without her cum...");
	else addButton(1, "Don't", ifYouLoveArdiasCockYouGottaLetHerGo, undefined, "Don't", "Bye, Ardia.");
}

public function takingArdiaOnYourSpessAdventure():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");
	processTime(2);

	output("<i>\"Actually,\"</i> you say, setting a hand on Ardia's waist. The dzaan girl gasps, but she doesn't pull away. Indeed, her far-too-tight jumpsuit strains around a sudden growth between those deliciously thick thighs. <i>\"I was about to offer Ardia a place on the crew here...\"</i>");
	output("\n\nThe chubby dzaan's eyes snape wide open. <i>\"W-wh-really!?\"</i>");
	output("\n\nYou flash her a grin. One that her mother isn't returning.");
	output("\n\n<i>\"Now listen here, captain, I just got my baby girl back. You can't just take her galavanting across the stars after all she's been through -- she needs to come home to momma. Don't you, darling?\"</i>");
	output("\n\nArdia cuts a glance between you and her mother's imposing glare, squirming on the spot. Her teeth work over one of her big blue lips for a moment before she finally works out a response. <i>\"I, uh, I'm fine, mom! Really! Totally, one-hundred-percent hunkey dorey. I'll be home soon, I promise! But I'm gonna hang around with, um... my new captain here. I want to see the stars the way you used to: out here and in person!\"</i>");
	output("\n\nHer mother tuts at her, crossing her arms in a way that makes her cleavage nearly spill out of her power suit. <i>\"Ardia, you can't form a harem if you're in some space scallywag's yourself. That's not how this works. You're an alpha, for gods' sake! Learn to act like one.\"</i>");
	output("\n\nArdia blushes, looking pointedly away. <i>\"[pc.name] doesn't have to be addicted to me. I like [pc.himHer] just fine the way [pc.heShe] is.\"</i>");
	output("\n\n<i>\"Ugh! Always with this backwards idealism. Get that [pc.raceShort] addicted to your dick, or you might as well have just stayed with the pirates. I swear, no alpha-daughter of mine is-\"</i>");
	output("\n\nArdia taps the console, cutting the call off. <i>\"Oops. Bad connection.\"</i>");
	output("\n\nYou both laugh, and Ardia falls back into one of the bridge chairs beside the captain's console. <i>\"So! Where to now, captain?\"</i>");
	output("\n\nWhere to indeed?");

	flags["ARDIA_CREW"] = 1;

	addButton(0, "Next", mainGameMenu);
}

public function takingYourAlphaCumDispenserOnYourSpessAdventure():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");
	processTime(2);

	output("<i>\"Uh, actually...\"</i> Ardia cuts in, shifting awkwardly once her mom's attention snaps back to her. <i>\"I, um, kinda got a beta situation here. I think I'm gonna stay out here in Rush Space for a little bit, see the galaxy. I'll be back to visit soon, though, I promise.\"</i>");
	output("\n\nWhen she says <i>\"beta,\"</i> Ardia's hand snakes out to grab your [pc.ass], a gesture that instantly makes you tremble with excitement. You're instantly aware of your alpha's smell, the musk of her slowly-stiffening cock as her hands dig into you. Oh, the idea of traveling with her at your help makes you positively giddy.");
	output("\n\nHer mother smiles softly, looking at the two of you together. <i>\"Ah, I see now. I wish I could convince you both to just come home, then, but I understand. I was a free spirit when I was younger, too...\"</i>");
	output("\n\n<i>\"Y-you're okay with it?\"</i> Ardia says, jaw hanging open.");
	output("\n\n<i>\"Oh, darling, you're an alpha. I've been waiting for you to start growing your harem since you came of age. At least I can rest easy knowing your very first beta's such a strong specimen. Your children will be godly.\"</i>");
	output("\n\nYou can't help but smile at the butterflies in your stomach that idea brings up.");
	output("\n\nArdia's mom smirks and leans back, biting a viridian lip. <i>\"Oh, yes, I think your be-- Captain Steele -- agrees with me. Well, don't let me keep you, darling. Come home soon so I can just smother you in love, alright?\"</i>");
	output("\n\n<i>\"I-I will, mom,\"</i> Ardia says, blushing fiercely as the comms cut. She turns to you with a nervous smile, hand still resting firmly on your rear. <i>\"Oh, gods, that was... that was a thing. I expected more freaking out. Or, uh... I mean, I'm glad she likes you...\"</i>");
	output("\n\nSame.");
	output("\n\nArdia quickly looks around the bridge, chewing on a nail. Maybe she's trying to fight down the growing bulge against the front of her jumpsuit? Oh, you need to get her out of that soon. Your alpha should never be wearing the garments of a slave, should she?");
	output("\n\n<i>\"S-so... is this the part where you give me a blowie to welcome me aboard?\"</i> she laughs, grinding those deliciously thick thighs together. Her nervous titter almost makes it sound like she's joking, but you've got a hunger to sate...");

	flags["ARDIA_CREW"] = 1;

	addButton(0, "Yes", succSomeArdiaDong);
	addButton(1, "Not yet...", mainGameMenu);
}

public function ifYouLoveArdiasCockYouGottaLetHerGo():void
{
	clearMenu();
	clearOutput();
	showArdiaAndMom();
	author("Savin");
	processTime(2);

	output("<i>\"Of course,\"</i> you tell her mother, hopping into the captain's seat and strapping in. <i>\"I'll have her home shortly.\"</i>");
	output("\n\nYou cut the call and tell Ardia to take a seat. As soon as she straps up, the seatbelt disappears between her cleavage, and she gives you a thumbs up. <i>\"I'll plug in the nav data for Hauâ Mai... there we go. All set.\"</i> ");
	output("\n\nAs soon as she gives you the all-clear, you ease your ship up and out of Zheng Shi's docks and back out to the stars. A quick jaunt through the Warp Gate network takes you to your freedwoman's homeworld, a lush jungle plant that's greener than primordial earth and, according to passive scans, absolutely teeming with life -- including several million dzaan, concentrated around a few large coastal cities and then scattered sparsely throughout the other side of the planet. ");
	output("\n\n<i>\"You're gonna love my mom,\"</i> Ardia comments as you descend through the thick, wet atmosphere. <i>\"Well, she's gonna love <b>you</b>, anyway, my gallant, charming rescuer. Hauâ Mai might be a simple world, but we pay our debts. I promise you that.\"</i>");
	output("\n\nShe gives you an approach vector that leads you to a sprawling, high-class resort on the oceanside, resting atop a hill on a great sandy beach. There's a landing pad on the roof of the tallest residential tower, and Ardia tells you to put 'er down there. By the time you've landed, powered down, and make your way out the airlock with the former captive in tow, there's a group of dzaan waiting on the pad to meet you. Ardia's sire leads the group of a half-dozen armed guards, and is accompanied by an exaggeratedly-fertile-figured female of their race wearing transparent silks and a great many jewels and piercings, including a pair of huge golden rings from her barely-concealed nipples. The woman hangs off of the alpha's arm, face streaked with tears of joy.");
	output("\n\n<i>\"My baby!\"</i> the woman cries, rushing forward and scooping Ardia up off the ground the moment your companion steps off the ramp. <i>\"Oh thank the gods, you're alright. My sweet little baby...\"</i>");
	output("\n\nWhile mother and daughter bawl all over each other, your turn your attention to the more taciturn alpha in the power suit. Even she's a bit misty-eyed, but she takes a deep breath and steps up, offering a hand to you. <i>\"Thank you, captain, for returning my daughter. My only alpha child... I can't express my gratitude enough, but please... at least accept our credits and hospitality as a start.\"</i>");

	if (flags["ARDIA_CREW"] == undefined) flags["ARDIA_CREW"] = -1;

	addButton(0, "Thanks!", getYourRewardHookersYouHeroYou, undefined, "Thanks!", "You'd be happy to take the family up on their hospitality. After all, how often do you get to spend a night in an expensive resort owned by deliciously thick dickgirls? You're definitely gonna end up playing with some of them if you stay...");
	addButton(1, "No Thanks", justDidItForTheDzaanBootyAlphaMom, undefined, "No Thanks", "You don't need any reward, and you'll be on your way.");
}

public function justDidItForTheDzaanBootyAlphaMom():void
{
	clearMenu();
	clearOutput();
	showArdiaAndMom();
	author("Savin");
	processTime(2);

	output("You shake the alpha dzaan's hand but tell her that you'll have to decline her rewards. You were just doing what's right.");
	output("\n\n<i>\"That just makes me wish you'd stay all the more, but... thank you all the same, captain,\"</i> Ardia's sire says with a smile. She squeezes your hand tight and then releases you, letting you return to your ship. You wish Ardia the best before leaving her on the landing pad in the arms of her folks.");
	output("\n\nYou do good work, Steele.");

	shipLocation = "SPACE";

	//Big +Kindness.
	pc.addNice(10);

	addButton(0, "Next", (ardiaIsCrew() ? itsPartyTimeAtArdiamomLand : mainGameMenu));
}

public function getYourRewardHookersYouHeroYou():void
{
	clearMenu();
	clearOutput();
	showArdiaAndMom();
	author("Savin");
	processTime(15);

	var ardiaPrice:int = 35000;

	output("You give the tall, amazonian alpha's hand a squeeze and tell her that you'd be honored to accept. This is a beautiful world she's built her empire on, and just looking at the gathering of curvaceous brown aliens surrounding you, it's populated by beautiful people too. Her dark lips spread into a warm smile, and again, the alpha wipes mist from her eyes.");
	output("\n\n<i>\"Gallant <b>and</b> perceptive. By the by, you may call me Arine. This resort belongs to me, and as long as you're here, everyone will treat you like royalty. Food, drink, gaming, women... you'll see why we dzaan are called the queens of pleasure. But first, credits. A princess's bounty is only fitting for the return of my daughter.\"</i>");
	output("\n\nArine takes a palm-sized Codex from her blazer pocket and swipes across the screen towards you. Your own device beeps a moment later, announcing that you've received an instant transfer of <b>" + ardiaPrice + " credits.</b> You thank her and pocket the device, letting the bottom-heavy amazon escort you to the elevator. On the way, she explains the layout of the resort, telling you where the all gambling halls, 5-star restaurants, and beta bordellos are. Pools and sandy beaches are everywhere and always open, not to mention always full of beautiful dzaan and exotic visitors all looking for companionship.");
	output("\n\nIt seems this place is a wealthy play[pc.boyGirl]'s paradise. You give the happy family some space to hug and cry on each others' shoulders, taking the lift down into the bright lights and chaotic noise of the resort's main entertainment plaza. You're subsumed in a glittering gala of flashing holos and gambling machines churning out credit chits; the thunders roar of cheers from betting tables as high-stakes games bear fruit; the beat of heavy bass from the music playing above you, and the shaking hips of dancers in cages suspended high above the floors.");

	pc.credits += 35000;
	
	addButton(0, "Next", itsPartyTimeAtArdiamomLand);
}

public function itsPartyTimeAtArdiamomLand():void
{
	clearMenu();
	clearOutput();
	showArdiaAndMom();
	author("Savin");
	processTime(60+rand(121));

	output("The next hours are a blur. You drink, dance, gamble, flirt, letting yourself get cozy with several beta dzaan who wear next to no clothing and too much perfume. Or maybe you're just getting enchanted by the pheromones of dzaan-pussy after so much time cooped up with Ardia, and now hundreds of her people, each more beautiful than the last. You feel ready to lose yourself completely between one particularly lush barfly's thighs when someone taps on your shoulder, insistently rousing you from your buzzed stupor until you swing around from the " + (silly ? "roo-lette" : "roulette") + " to face another dzaan, this one wearing a uniform of short black skirt and red vest -- and no undershirt, leaving a remarkable amount of boobage fighting to pop her buttons.");
	output("\n\nShe smiles demurely despite your disorderly state, bowing deeply enough that you can stare straight into her cleavage. <i>\"Mistress Arine invites you to supper with her family in the master penthouse. It would be her honor if you would attend.\"</i>");
	output("\n\nWell, who are you to refuse such a generous offer? You tell the attendant that you'll be there shortly and stagger off to the nearest restroom to try and shake off the worst of your buzz. A few minutes later and you've poured yourself into the packed main elevator and pushed the button for the top penthouse. The press of bodies in the confined glass cylinder around you thins out with every floor you pass, slowly but surely emptying out until you're the only one left inside, and the floor counter's ticking to its ends. ");
	output("\n\nFloor 80: the master penthouse. The elevator slides open to reveal a shining marble hallway decorated by genuine canvas paintings and ancient iron blades hanging from the walls. Seems like somebody here's a collector of antiques. A pair of guards, wearing the same uniform as those you met on the roof, wait at the end of the short hall on either side of a set of marble steps and a double door. These ones have machine pistols slung on oversized holsters, though, and are wearing mirrored shades to hide their eyes. It seems after the pirate incident, Ardia's family is taking security a little more seriously.");
	output("\n\nThe guards push open the doors for you, revealing a decadent gold-hued foyar richly adorned with glass chandeliers and far more exotic paintings. A rich scent of perfume hangs on the room as you step inside, billowing up from countless candles ensconced along the walls, illuminating the wall and all their expensive decorations.");
	output("\n\n<i>\"[pc.name]!\"</i>");

	addButton(0, "Next", itsStillPartyTimeAndStillArdiasMom);
}

public function itsStillPartyTimeAndStillArdiasMom():void
{
	clearMenu();
	clearOutput();
	showArdiaAndMom();
	author("Savin");

	output("You turn to a set of stairs leading up, just in time to see Ardia coming down. She's shed her [ardia.armor] and taken one hell of a bath, blue hair hanging wetly onto the shoulders of a pretty burgundy dress that's trying its darndest to wrap around the prodigious expanse of her bosom. ");
	output("\n\n<i>\"Hey, [pc.name]!\"</i> she says, smiling as she descends the last steps. Despite walking only on the balls of her bare feet (and despite the heft of her voluptuous body) she moves with the fluid grace, and a fluid jiggle of her chest and ass that's prime to hypnotize. " + (ardiaDomLevel() < 7 ? "She gives you a big hug and takes your arm, pulling you towards an open side door" : "She grabs your ass in both hands and pulls you in, assailing your lips with a firm kiss before leading you towards an open side door by your butt") + " -- the dining room, dominated by a long table covered in gold cloth and set with shimmering silver. A hotel employee in the same overly-revealing vest as you saw downstairs is filling up champagne glasses at three places with a bubbly red native liquor.");
	output("\n\n<i>\"Is your mother not coming?\"</i> you ask your " + (flags["ARDIA_PARTIED"] != undefined ? "lovely companion." : "chunky rescue."));
	output("\n\nShe gives you a quizzical look, azure lips scrunching up. <i>\"Huh? What would she be here for?\"</i>");
	output("\n\nThe attendant scurries past you and out the door, her job completed, and Ardia guides you to one of the three places set at the head of the table, across from her own. You'd think to challenge the point, but then again, you're the guest in the house. Her sire likely has many other wives to consider, going by her talk over comms earlier. Perhaps she doesn't want to make the others jealous?");
	output("\n\n<i>\"");
	if (flags["ARDIA_PARTIED"] == undefined) output("So,\"</i> you venture, glancing around the luxurious apartment, <i>\"you grew up here, huh?\"</i>\n\n<i>\"Uh-huh!\"</i> Ardia nods, leaning forward in her seat and cradling her chin in her hands. <i>\"Me and all my sisters. ");
	output("My family's owned this resort for almost two hundred years... and thanks to you, I'll be around to inherit it. I know the penthouses are kind of gaudy by Terran standards, but on this planet, you have to show your wealth for everybody to see. Whether its how many credits you have or how many betas are in your harem, you've gotta flaunt what you've got. That's just dzaan culture.\"</i>");
	output("\n\n<i>\"Is that why you're always about to burst out of your clothes?\"</i>");
	output("\n\nYour companion's cheeks flush a little, but she doesn't deny the charge. <i>\"")
	if (ardiaDomLevel() < 7) output("On Hauâ Mai, it's traditional for alpha dzaan to wear... almost nothing, really. Our pastoral tribe chieftains still walk around with their balls in a hammock and not much else! It's... really something.\"</i>");
	else
	{
		output("Traditional garb for Hauâ Mai alphas is basically nothing but a ball-bra and chest wrap. The size of your nuts is a mark of virility. If you cover up, it means you've got something to hide... and only an alpha who's willing to let 'em swing proud has any chance of getting herself a harem. It worked for you, didn't it?\"</i>");
		output("\n\nYou can't deny, the sight of her intoxicating balls was a big turn on. Enough to lead you to sucking on her [ardia.cock] like it's your job every day. Maybe there's something to it after all?");
	}
	output("\n\n<i>\"Still, as large as mine are, I honestly think my chest is my best asset. So, you know... flaunt what you've got!\"</i>");
	output("\n\nShe laughs, hard enough to make her tits nearly spill out of her dress. You can catch glimpses of her chocolate teats when she exhales, and on the inhale, she nearly bursts the seams. Catching you looking only makes her smile more, and Ardia leans in on the table, resting the bottoms of her tits on the hardwood. <i>\"See what I mean?\"</i>");
	if (ardiaDomLevel() >= 7) output("\n\nFuck yeah you do. It takes every ounce of willpower to not just crawl under the table right now.");
	output("\n\nYour attention is snapped away from Ardia as her sire saunters through the door, hips swaying wildly with her alien gait. She's wearing the same sexy blazer as before, and her long green hair has been pulled back into a ponytail that swings behind hers. Now that you've got a chance to really look at her, you can see that she's got a body shape damn similar to Ardia's, with the same jiggling brown behind and impossibly wide hips all wrapped up in a miniskirt that's hugging her frame tightly. Unlike her daughter, Arine's wearing heeled boots that make her feet look a little more natural, and where Ardia's chunky and busty, her sire's lean and amazonian, with wiry muscles visible beneath the thin fabric of her blouse and jacket. ");
	output("\n\nYou can't help but wonder if she's got the same kind of <i>\"traditional\"</i> dress under her skirt that Ardia was talking about. There's only the faintest outline of her alpha-cock pressed against the front of the garment, and her balls are just out of sight. ");
	output("\n\n<i>\"I'm glad you made it, Captain Steele,\"</i> Arine smiles, striding towards the head of the table. On her way, she leans down to plant a small kiss on the top of her daughter's head, eliciting a smile from her before the arch-alpha takes her seat. <i>\"Have you been enjoying your stay so far?\"</i>");
	output("\n\nYou have to admit: it's been a blast so far. It's easy to see what she meant about being queens of pleasure: the sheer amount of food, games, and beautiful harlots on the grounds is out of this world. It's a paradise planet in every sense of the phrase.");
	output("\n\n<i>\"Good! Very good. I'll give my betas your regards for their leal service, then.\"</i>");
	if (flags["ARDIA_PARTIED"] != undefined)
	{
		output("\n\n<i>\"Your... betas?\"</i>");
		output("\n\nShe grins devilishly. <i>\"Why of course. Every dzaan working at the resort is my beta. What's a female dzaan to do without an alpha to sate her cravings. I give every female here the meaning she needs in her life: employment, a home, a family, a love... I'm a full service employer.\"</i>");
		output("\n\nImpressive. Feeding that many addicted sluts must take a real toll on her.");
	}
	output("\n\nArine smirks into her champagne glass. <i>\"Now then, a toast: to my heir's return!\"</i>");
	output("\n\n<i>\"I'll drink to that!\"</i> Ardia giggles. She raises her own glass up as well, looking to you expectantly. You clink yours to theirs and drink deep of the rich red liquor. It's fruity and sharp and goes down easy, but leaves your [pc.tongue] tingling afterwards. Your two companions follow your lead, draining their glasses dry. Ardia moans softly into it, like it's the sweetest thing she's ever tasted.");
	output("\n\n<i>\"Ahh! That's so good. You just can't get tirres anywhere else!\"</i>");
	output("\n\nHer sire chuckles. <i>\"Yes, I imagine pirates and star-raiders don't stock our native brews. Not as though we'd sell to them if they asked...\"</i>");
	output("\n\nOf course. Considering the family's experience with pirates, you'd expect nothing less.");
	output("\n\nArine smirks at you over the top of her glass. A moment later, a pair of servants walk into the room with great silver platters balanced on their shoulders, bearing piping hot platters of meat and fresh vegetables glistening with moisture. The betas spread the smorgasbord around, heaping food on your plates -- and as they do, they gracefully bend over or sway their hips towards their alpha, putting on a little show less for you and more for their addictor. Arine watches with overt interest, eyes wandering between two full bosoms and asses that threaten to spill out of the girls' skirts.");
	output("\n\nArdia seems largely oblivious to the display, like it's so inherently <i>blasé</i> to her that it's beneath notice. Yet you can't draw your eyes away from all the keratin-marked dark flesh on display, all the curves barely restrained by their skimpy uniforms. And you know Arine sees you looking at her wives; there's no way an alpha like her doesn't.");
	output("\n\nAnd yet, you wonder if it's an unwelcome perversion...");

	//Set time to 18:00
	var minutesToPass:int = ((24+18)*60 - 60*hours - minutes) % (24*60);
	processTime(minutesToPass);

	addButton(0, "Next", continueRichingItUpWithArdiasMom);
}

public function continueRichingItUpWithArdiasMom():void
{
	clearMenu();
	clearOutput();
	showArine();
	author("Savin");

	output("By the time you've finished your meal, you feel full and sleepy. The alcohol you've been guzzling all day feels like it's come home to roost in your eyelids, and your hands rest heavily on your [pc.belly]. Ardia's in much the same boat, smiling faintly at you across the table as dinner settles. Arine, though, has settled her chin in her hands, viridian lips pressed into a little smirk as she watches you and her daughter. ");
	output("\n\nAll through dinner, she's kept relatively quiet... and yet her presence has remained imposing, eying you over every bite like a stalking predator. After her wives clear the table, repeating the same performative sway and bounce as before, the matron of the paradise rises to her feet and takes one of them by the shoulder. <i>\"Why don't you go and prepare a room for Captain Steele here. Our best suite, if you please.\"</i>");
	output("\n\n<i>\"Of course, mistress,\"</i> the beta smiles, nuzzling into Arine's arm for a moment before hefting up the dish-laden platter.");
	output("\n\n<i>\"You look like you're ready to pass out, captain,\"</i> she adds as her betas scurry off. <i>\"I hope you didn't party <b>too</b> hard.\"</i>");
	output("\n\nYou're not sure there is such a thing, surrounded by so many beautiful women. But you are definitely feeling the consequences of your day of excess. At least you can still walk... you're pretty sure. A little unsteadily, you fight your way up to your [pc.feet] and thank the ladies for their hospitality. But, indeed, it's time for you to get to bed.");
	output("\n\nArine smiles and wraps an arm around your shoulders, guiding you to the door. <i>\"Of course, captain. Your suite will be the one just below ours -- one floor down. Make yourself at home and help yourself to the bar and fridge. No surprise bills here. If there's anything you need, anything at all -- even if you just want someone to tuck you in -- don't hesitate to ask.\"</i>");

	//Advance time 1 hour, grant Buzzed and a slight +thickness boost
	pc.instaBuzzed();
	processTime(60);
	var newThick:Number = Math.min(pc.thickness + 3, pc.thicknessMax());
	if (pc.thicknessUnlocked(newThick)) pc.thickness = newThick;
	else output("\n\n<b>" + pc.thicknessLockedMessage() + "</b>");

	addButton(0, "I'm Fine", dzaanMommiesAreForCuddlingNotFucking, undefined, "I'm Fine", "You don't need anything.");
	addButton(1, "Tuck Me In", moreLikeFuckMeInAmiriteBois, undefined, "Oh, you'd <b>very much</b> like to have a big, alpha amazon tuck you in at night...");
}

public function dzaanMommiesAreForCuddlingNotFucking():void
{
	clearMenu();
	clearOutput();
	showArine();
	author("Savin");
	processTime(13*60);

	if (ardiaIsCrew())
	{
		output("You tell her you'll be fine as you swagger out of the apartment and back to the elevator. Arine tsks her tongue as you leave, leaning against the wall with pursed lips and hungry eyes as you take your leave. The elevator trip's short and sweet, but even still, by the time you're taking a key from a staffer waiting outside and fumbling your way into the door, you can feel the demanding embrace of sleep clawing at you. ");
		output("\n\nWith a mighty yawn, you toss your kit onto one of the elegant wooden chairs you pass by in the kitchenette and head straight for the master bed at the back. You're sure there's an amazing view from the bay windows overlooking the beach, but you're too damn tired to care -- you just plant your face in your bed and let sleep overwhelm you, dragging you into blackness.");
		output("\n\n<b>You sleep deeply tonight...</b>");
		output("\n\nYou wake up to light streaming in through the windows, and the faint  of cheers and laughter from outside. A glance at your Codex tells you that you've slept until noon the next day, and boy do you feel every hour of it. With a yawn, you force yourself up out of bed, through the shower, and go grab your kit from where it fell. You can't shake the groggy feeling hanging over you, but at least you've come away well-rested for once. It's hard to really quantify to kind of toll the Rush has had on your body and mind since it began, but damn it feels like you needed all that sleep and then some. ");
		output("\n\nIt's another hour or so before you can drag yourself out of the suite and towards the elevator. One of Arine's servants is standing at attention beside it, and you tell her to convey your appreciation for the night of quiet relaxation to her alpha, but it's time for you to take your leave. The maid-uniformed beta gives you an understanding nod and calls the elevator for you; soon enough, you're boarding your ship and getting ready for takeoff. ");
		output("\n\nArdia's already sitting in the captain's chair, dressed back in her skin-tight jumper and smiling. <i>\"Welcome back, [pc.name]. Ready to get underway?\"</i>");
		if (ardiaDomLevel() < 7) output("\n\nYou scoot her out of your chair and assume your rightful place, only for the big wanna-be alpha to plant her fat ass right back in your lap, hooking an arm around your shoulders and snuggling in. <i>\"Ready for liftoff, captain!\"</i>\n\nDamn right. Back to the adventure!");
		else output("\n\n<i>\"Aye aye captain,\"</i> you grin, sitting yourself right in Ardia's lap and grabbing the controls. Ready for liftoff!");
	}
	else
	{
		output("You tell her you'll be fine as you swagger out of the apartment and back to the elevator. Arine tsks her tongue as you leave, leaning against the wall with pursed lips and hungry eyes as you take your leave. The elevator trip's short and sweet, but even still, by the time you're taking a key from a staffer waiting outside and fumbling your way into the door, you can feel the demanding embrace of sleep clawing at you.");
		output("\n\nWith a mighty yawn, you toss your kit onto one of the elegant wooden chairs you pass by in the kitchenette and head straight for the master bed at the back. You're sure there's an amazing view from the bay windows overlooking the beach, but you're too damn tired to care -- you just plant your face in your bed and let sleep overwhelm you, dragging you into blackness.");
		output("\n\n<b>You sleep deeply tonight...</b>");
		output("\n\nYou wake up to light streaming in through the windows, and the faint  of cheers and laughter from outside. A glance at your Codex tells you that you've slept until noon the next day, and boy do you feel every hour of it. With a yawn, you force yourself up out of bed, through the shower, and go grab your kit from where it fell. You can't shake the groggy feeling hanging over you, but at least you've come away well-rested for once. It's hard to really quantify to kind of toll the Rush has had on your body and mind since it began, but damn it feels like you needed all that sleep and then some.");
		output("\n\nIt's another hour or so before you can drag yourself out of the suite and towards the elevator. One of Arine's servants is standing at attention beside it, and you tell her to convey your appreciation for the night of quiet relaxation to her alpha, but it's time for you to take your leave. The maid-uniformed beta gives you an understanding nod and calls the elevator for you; soon enough, you're boarding your ship and getting ready for takeoff.");
		output("\n\nJust as you're about to dust off, the landing pad door opens again, and Ardia comes running out. She doesn't make an effort to stop your leaving; you've made it clear that the Rush is no place for a spoiled rich girl, alpha dzaan or not. Instead, she just waves and smiles, blowing kisses as you lift off. The last you see of this paradise world is Ardia's plump blue lips pursed, brown curves jiggling as the exhaust billows past her.");
	}

	ardiaFamilyVisitWrapup();
}

public function moreLikeFuckMeInAmiriteBois():void
{
	clearMenu();
	clearOutput();
	showArine(true);
	author("Savin");
	processTime(5);

	var cockIdx:int = (pc.hasCock() ? rand(pc.cocks.length) : -1);
	var vagIdx:int = (pc.hasVagina() ? rand(pc.vaginas.length) : -1);

	output("Well, since she's offering, and so very close...");
	output("\n\nYou slip an arm around the beautiful alpha amazon's broad hips, unabashedly running your fingers over the tight clothing hugging her muscular ass. What her daughter, sitting cozy in the other room, doesn't see can't hurt her. Arine doesn't so much as flinch, though you can't say the same for the beast that's thus-far been hidden between her legs as the front of her suit tightens. Grinning, you tell her that a tuck-in is <b>exactly</b> what you need after all your harrowing adventures. ");
	output("\n\n<i>\"I shouldn't be surprised that a " + pc.mf("handsome", "cute") + " young [pc.boyGirl] would still need mommy to look after [pc.himHer],\"</i> Arine purrs, escorting you to the elevator. She gives the beta attendant outside it a slap on the rear and an instruction to make sure her daughter gets to bed safe and sound. The last you see of the master suite, at least for tonight, is a jealous hint of a smile from the beta as the doors close.");
	output("\n\n... And then Arine's on you, shoving you back against the cold metal wall and tearing into your " + (pc.hasArmor() ? "[pc.armor]" : "gear") + ", ripping it off while her lips and tongue run wild over your neck and shoulders. You gasp, but that only invites the amazon's tongue straight down your throat as she all but lifts you off the floor, pinning you between unyielding steel and warm, heavy titflesh. Her power suit is coming off piece by piece, leaving heeled shoes and her jacket on the elevator as she manhandles you out the door and towards the suite below her own.");
	output("\n\nYou only get a few glances at the place -- it's nice, well furnished, even has a little kitchen -- but your vision is swallowed up by caramel boob and a long mane of green hair spilling down as the alpha peels her low-cut blouse off entirely. You feel a bed slam into your back, and you sink into soft sheets and warm blankets while thick, meaty thighs come up and staddle your [pc.hips]. You manage to get your head up off the bed just long enough to see Arine's pants sailing over her shoulders, leaving her bare save for a thick black strap around her waist, holding up a hardlight garment that's straining around what exactly makes this amazon an alpha:");
	output("\n\nHer cock is rock hard, easily a foot long and covered in circular ridges of smooth keratin from just beneath the crown all the way down to the base.");
	if (flags["ARDIA_PARTIED_SEX"] == undefined)
	{
		output(" What really draws your eyes, though, are what hang below. Arine's balls are clearly unnatural -- that much you can tell at a glance. Even for a dzaan, even after seeing the outline of Ardia's huge cumtanks straining around the tight latex of her slave's jumper when you first met, these things are massive. They're swollen to the size of watermelons, the skin taut and veiny, and an obvious liquid weight causes them to sway with every breath she takes.");
		output("\n\n<i>\"It takes a lot to keep so many betas fed,\"</i> Arine admits, running a hand over the hardlight garment restraining her cum-stuffed nuts. <i>\"But being an alpha is all about sacrifice... even sacrificing your normal body to better care for your betas. I hope you like big girls.\"</i>");
	}
	else output(" Her huge kui-tan-like sack sways heavily with every breath, practically overflowing with aphrodisiac cum.");
	output("\n\nArine gives you a lustful smirk and flicks a little buckle on the front of her panties, causing the hardlight strap to flicker out of existence. Her oversized balls spill out onto your thighs, " + (pc.hasCock() ? "pinning your own [pc.cock " + cockIdx + "] to your [pc.belly]" : "dragging up your belly") + " and her hand wraps around her breeding pole, stroking it from stem to crown. Her other hand runs sensually up her hard stomach and ripped abs, stopping on one of her large breasts to flick a platinum ring pierced through it, a matched twin to the other boob and bound to it by a taut silver chain.");
	output("\n\n<i>\"Now then!\"</i> she moans, biting a viridian lip and smirking down at you. A fierce hunger burns in her eyes as her arms grip your shoulders and pushes you straight back down into the bed where you belong. <i>\"Let mommy take care of everything...");
	if (pc.hasCock()) output(" All I want you to worry about is whether I pamper that [pc.cock " + cockIdx + "], or if you want your [pc.vagOrAss " + vagIdx + "] stuffed so full you can't fucking move.");
	output("\"</i>");
	
	//Offer [Get Ridden] and [Get Fucked] options if PC has a cock; else, go directly to Get Fucked with a [Next] button. 
	if (pc.hasCock())
	{
		addButton(0, "Get Ridden", yeahArdiasMomShookMeAllNightLong, cockIdx, "Get Ridden", "Let Arine ride you all night long.");
		addButton(1, "Get Fucked", arineGonnaDoYourButteh, vagIdx, "Get Fucked", "Spread your legs and let Arine fuck you all night long.");
	}
	else addButton(0, "Next", arineGonnaDoYourButteh, vagIdx);
}

public function yeahArdiasMomShookMeAllNightLong(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showArine(true);
	author("Savin");
	processTime(7+rand(9));

	output("<i>\"P-pamper my cock, mommy.\"</i>");
	output("\n\nThe words come out of your mouth before you can even think, spilling out while a blush burns your cheeks and your [pc.cock " + cockIdx + "] stands at full attention... or would, if it weren't trapped under the heavy weights of Arine's nuts, rubbed between belly and ballsack. Every time she breathes, the taut curves of her tanks slide up your length.");
	output("\n\nShe smiles. <i>\"For you, anything. Even something so unbecoming of such a powerful alpha.\"</i>");
	output("\n\nArine laughs, halting the movement of her wrist up and down her own rock-hard shaft. Instead, she starts to move the big, meaty hips of hers, swaying forward and back with slow, steady self-assurance. She doesn't need to hurry, doesn't need to work you like some cheap whore on the clock. Arine just rocks her hips like a dancer, gyrating sensually -- and every single movement she makes ripples down through her liquid-sloshing sack. Your hands practically disappear into the feathery bedding as the sensation of that much quaking weight bearing down on your dick hits you. It's almost as good as a <b>pussy</b>, tight but yielding, molding around every contour of your dick as she rides you. ");
	output("\n\n<i>\"A kui-tan trader taught me this,\"</i> she murmurs, as casually as if talking about any other transaction. <i>\"Hers were all fuzzy and soft. They were lovely, but needed so much lube to keep from burning. I think this technique was really made for a dzaan, don't you think?\"</i>");
	output("\n\nAs if she needed to emphasize the point, Arine runs both hands down the smooth, succulent flesh of her balls, gently kneading the oversized orbs. Her cock responds in kind, trembling before finally leaking a long, thick rope of pre straight down into her testicular cleavage. She chuckles and thumbs the juicy excess down, letting it spill across the surface of your cock and disappear under her sack. <i>\"Of course, a little lube doesn't ever hurt...\"</i>");
	output("\n\nFor the first time, you notice her breath is coming a little quicker now. The tight chain running between Arine's breasts shakes and strains as her pace starts to increase, accompanying a further rain of pre-droplets, each of which deftly makes its way down the polished-smooth surface of her pillow balls and onto your own flesh. The alpha, satisfied, presses her balls together around your [pc.cock " + cockIdx + "], tightening the squeeze as her hips finally start <b>really</b> moving, undulating atop you. ");
	output("\n\nHer cock bobs and throbs, squirting more and more as her humping steadily picks up, until finally you hear the alpha gasp, and you feel a thick, wet rope squirt across your [pc.chest]. The second and third eruptions spill down onto her balls and your [pc.cock " + cockIdx + "], splattering your dick in pearly white cream, which her balls quickly spread all down your length. She doesn't pause as she cums, doesn't so much as break pace, even as she moans and grabs her tits, hooking fingers through her rings and twisting them. She never touches her dick, though -- that's just a faucet for lubricants, an unnecessary addition to her worshipful dominance of your dick. ");
	output("\n\n<i>\"I don't care for endurance...\"</i> Arina admits, panting. <i>\"It doesn't help feed a hundred hungry beta-bitches all craving your cum. But I'm about to produce ten times as much as I've just spent while your cock tickled my sack. An orgasm is just a moment's pleasure, but being able to fuck all night, that's real stamina.\"</i>");
	output("\n\nShe leans back on her knees, admiring your cum-soaked stomach and pearl-slathered rod. <i>\"Ah, that's a beautiful sight. A beautiful cock, too. Can I taste it?\"</i>");

	addButton(0, "Next", aintNewTexasButArineStillRidesLikeACowgirl, cockIdx);
}

public function aintNewTexasButArineStillRidesLikeACowgirl(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showArine(true);
	author("Savin");
	processTime(7+rand(9));

	output("Mommy doesn't need to ask permission, and she doesn't wait for you response. Arine sinks down and wraps her green lips around your [pc.cockHead " + cockIdx + "], peeling your member off your gut and making every inch slowly disappear down her throat. Her big, red eyes stay locked on you all the while, watching your face with obvious fascination -- and a little lusty pride -- as the pleasure makes itself manifest on your [pc.face]. Her throat's every bit as tight as the squeeze of ball and stomach was, but twice as wet between saliva and seed.");
	output("\n\nShe comes up for air more than a minute after first sinking down on you, and her lips come away smeared with her own cum -- and no small amount of your pre, too. She licks them clean, winks, and sucks down again. This time, her throat muscles ripple along your schlong with unnatural speed, tightening and releasing in a chaotic cacophony that makes your back arch off the bed, and leaves your [pc.legs] squeezing desperately around Arine's shoulders, muscles firing wildly.");
	output("\n\nYou cum. There's no way around it, no avoiding it, just a simple, animal need to release all your seed into that welcoming hole. Arine kisses your base and stares deep into your eyes as you release into her mouth -- or more accurately, straight down her throat. Her muscles keep working the entire time, milking out as much of your precious spunk as she can before letting the shaft go free.");
	output("\n\nAnd then you see something change between her legs. Her balls quake, trembling, and start to swell. Arine moans, releasing your cock from her lips, and shudders as her testicles are filled with a surge of additional seed. She wasn't lying -- her overproductive testes grow wildly, filling with cum, and thick streams of it leaks from her softening member onto the sheets between your legs.");
	output("\n\n<i>\"Oh, gods, give me strength...\"</i> she sighs, pulling herself up to her knees. Her still-leaking cock rubs against your own, both softening post-orgasm, and both still leaking all over each other as she returns to her first position. This time, she grabs her dick in both hands as she starts to piston her hips forward, sliding her now-engorged balls over your member. The weight's so great, and the wetness so complete, that you can't do a damn thing but sink into the bed and moan like used whore, groaning in over-stimulation so quickly after your orgasm.");
	output("\n\nArine doesn't start slow this time. She rocks hard on you, bouncing on her knees and slamming her hips forward, making those huge nuts quake and sway over you. Tightness is replaced by speed and juicy lube, letting her power-ride your cock as long as she wants. Every bit of lube she uses up is quickly replaced by her own leaking tool as the motions keep milking more and more from her; you're not sure if she's having discreet orgasms anymore so much as has devolved into constant, overwhelming pleasure that keeps her fighting for more.");
	pc.cockChange();
	output("\n\nAnd it feels <b>amazing</b>, a cascade of pleasure and cum-soaked decadence that leaves you helpless under her, a babe in her hands that she can do whatever she pleases with. And what she wants is your cum -- every. Single. Drop of it. You can't help but climax to this kind of treatment, adding your own ejaculation to hers and earning soft coos and an adoring smile.");
	output("\n\n<i>\"You're doing good. Mommy's proud of you! Let it all out for me...\"</i>");
	output("\n\nYou do. You can't help it. Every drop is hers to take, milked out by the weight of her quaking ballsflesh. Time loses all meaning -- even if you had a clock, and the presence of mind to wonder, your attention is completely dominated by the hypnotic bounces of Arine's breasts, the liquid jiggling of her testicles over you, and the bouncing spray of her cock's never-ending orgasm.");

	pc.orgasm();

	addButton(0, "Next", smthSmthArineIsStillRidingMaaaan, cockIdx);
}

public function smthSmthArineIsStillRidingMaaaan(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showArine(true);
	author("Savin");
	processTime(40+rand(51));

	output("At some point, after three dry orgasms and a hoarse croak of begging her to stop, Arine finally stopped. You remember being dragged into the showers, you definitely remember her washing every inch of your body with her soaped-up breasts and balls, and the clean, pressed sheets waiting for you as the mighty amazon carried you back to bed.");
	output("\n\nWhen you wake up the next morning, Arine's plump lips are wrapped protectively around your [pc.cock " + cockIdx + "], her hands tenderly wrapped around your " + (pc.balls > 0 ? "balls" : "thighs") + ". The amazon is nestled against you, body pressed tight to your leg, but you don't smell the overwhelming potency of cum in the air anymore. It seems anything else wasted in the night went straight down her throat. The size of her sack, only slightly reduced from when she first unveiled it, only confirms as much.");
	output("\n\nShe moans softly when you stir, propping herself up on an elbow and releasing your soft girth from her green lips. <i>\"Good morning, captain,\"</i> Arine, purrs, tracing a finger up your length and onto her nipple chain. <i>\"How are you feeling?\"</i>");
	output("\n\nDrained. Relaxed. Contented. Exhausted. Well-rested. It's hard to put to words. ");
	output("\n\nShe smiles. <i>\"Perfect. Then stay here and rest. My betas will bring you breakfast in bed. They'll have your ship cleaned and refueled by the time you're done, and then you can be off...");
	if (ardiaIsCrew()) output(" and I'll be here, should you wish to return. Merely ask my daughter. Take care of her, and mommy will always take care of you.");
	output("\"</i>");
	output("\n\nArine lifts herself off the bed, gloriously naked, caramel skin glistening in the morning light as it streams through the windows. You watch her with abject lust, even drained as you are, as her thick ass and fat balls sway to her dzaanic gait. Arine dresses and leaves in silence, save for a slap of her ass when she bends over to collect her shirt, and moments later, a group of betas arrive with platters of steaming food... all as naked as their mistress, led by Ardia's mother.");
	output("\n\nIt seems that the pampering isn't quite over.");

	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	IncrementFlag("ARDIA_PARTIED_SEX");

	ardiaFamilyVisitWrapup();
}

public function arineGonnaDoYourButteh(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showArine(true);
	author("Savin");
	processTime(7+rand(9));

	output("<i>\"Fuck me hard, mommy,\"</i> you moan. The words come unbidden, unthinking, and your cheeks burn with embarrassment the moment you realize what you've said.");
	output("\n\nArine just smirks down at you, biting a dark viridian lip as a throb works from her caramel crown all the way through the fat mountains of her balls. With her hands braced on your shoulders, pinning you on the bed, your view of her body is otherwise entirely dominated by the huge jugs hanging down from her chest, swaying as she breathes.");
	output("\n\nAnd then they're all over your face, burying you in boobflesh as the amazonian matron comes down on you hard. Your [pc.legs] spread wide around her trunk-like thighs, instinctively submitting to the huge amazon -- and making way for that keratin-coated cock of hers to press between your cheeks, blindly groping for your [pc.vagOrAss " + vagIdx + "]. ");
	output("\n\n<i>\"I'll treat you so right, baby,\"</i> she coos, shaking her shoulders so that pounds and pounds of tit jiggle around your [pc.face]. <i>\"Just relax that " + (vagIdx < 0 ? "ass" : "pussy") + " for me. Find a nipple to latch onto if you can...\"</i>");
	output("\n\nBoth your arms are already flailing around, grabbing at Arine's chest. Following her soothing commands seems second nature, an automatic response that guides both your hands down to dusky teats and squeezes. She gasps, sudden enough to send another wave of quakes straight down her chest, and then your [pc.lips] are spreading around a pebbly promontory, [pc.tongue] desperately lapping at it. ");
	output("\n\n<i>\"Such a good [pc.boyGirl],\"</i> Arine sighs. One of her big, strong hands wraps around the back of your head, pushing you up into her boob. The other plays its fingers daintily down your [pc.chest], tweaking one of your own teats before sliding further and further south. You can't help but moan into your mouthful of titty as her fingers find your [pc.vagOrAss " + vagIdx + "] and sink into it without hesitation, stirring you up and spreading you open. ");
	output("\n\nYou moan with anticipation, [pc.legs] and arms wrapping around Arine's whole body, as the rounded tip of Arine's dick is guided towards your entrance. You feel it coming a mile away, sliding up your thigh before finally nestling " + (vagIdx < 0 ? "into your rim" : "between your folds") + ", holding just on the verge of penetration. You can practically feel her smiling, muscles tensing -- and then she's inside you. Arine's hips slam forward, crashing against your thighs and plowing her fat rod straight to the hilt in your [pc.vagOrAss " + vagIdx + "]. If not for the nipple wedged in your mouth, you know you'd be screaming, telling the whole resort that you're getting railed by its mistress.");
	pc.holeChange(vagIdx, getArine().cockVolume(0));
	output("\n\nShe laughs, a husky sound you can barely hear from between her breasts. <i>\"That's right. Take it all... be mommy's good little cocksock.\"</i>");
	output("\n\nHer fat, churning balls slap heavily against your [pc.butt]. Both massive orbs quake as pre leaks freely from her crown, smearing your walls between shallow thrusts. The keratin nubs all along her length grind on your tender insides, enough to make you arch off the bed and bury your face as deep in Arine's cleavage as you can. For the first time, you notice her breath is coming a little quicker now. The tight chain running between Arine's breasts shakes and strains as her pace starts to increase, accompanying a further flood of pre, packing your " + (vagIdx < 0 ? "bowels" : "womb") + " with the burning tingle of dzaanic seed. The alpha moans as her hips finally start <b>really</b> moving, undulating atop you. ");
	output("\n\nHer cock throbs inside you, squirting more and more as her humping steadily picks up, until finally you hear the alpha gasp, and you <b>feel</b> a thick, wet rope shoot inside you. The second and third eruptions spill out of you and down onto her balls, staining the sheets with pearly white cream. She doesn't pause as she cums, doesn't so much as break pace, even as she moans and grabs her tits, hooking fingers through her rings and twisting them. Finally, she hilts herself inside you one more time, burying every inch in your [pc.vagOrAss " + vagIdx + "] and roaring with pleasure.");
	output("\n\nWhen her orgasm subsides, and you're left gasping on the edge of your own, world blackened in the darkness of alpha amazon tits, you hear her laugh. And her hips start moving again. ");
	output("\n\n<i>\"I don't care for endurance...\"</i> Arina admits, panting. <i>\"It doesn't help feed a hundred hungry beta-bitches all craving your cum. But I'm about to replace what I just spent ten times over. An orgasm is just a moment's pleasure, but being able to fuck all night... that's <b>real</b> stamina.\"</i>");
	output("\n\nShe leans back on her knees, admiring your cum-soaked nethers and her own pearl-slathered rod. <i>\"Ah, that's a beautiful sight. A beautiful " + (vagIdx < 0 ? "ass" : "pussy") + ", too. Can I taste it?\"</i>");

	addButton(0, "Next", arineContinuesDoingYouIntoBedOrSomething, vagIdx);
}

public function arineContinuesDoingYouIntoBedOrSomething(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showArine(true);
	author("Savin");
	processTime(7+rand(9));

	output("Mommy doesn't need to ask permission, and she doesn't wait for your response. Arine sinks down and plants her hands on your thighs, finally freeing you from marshmallow hell as she delves between your [pc.legs]. Even as her cum is still leaking from your spread entrance, you feel her plump green lips kiss your " + (vagIdx < 0 ? "rim" : "lower lips") + ", running her tongue around just inside. She's practically slurping her own cum from your battered [pc.vagOrAss " + vagIdx + "], cleaning you out with deep swirls of her tongue.");
	output("\n\nAnd then you see something change between her legs. Her balls quake, trembling, and start to swell. Arine moans, pulling back from your " + (vagIdx < 0 ? "ass" : "slit") + ", and shudders as her testicles are filled with a surge of additional seed. She wasn't lying -- her overproductive testes grow wildly, filling with cum, and thick streams of it leaks from her softening member onto the sheets between your legs.");
	output("\n\n<i>\"Oh, gods, give me strength...\"</i> she sighs, pulling herself up to her knees. Her still-leaking cock rubs against your [pc.leg], hardening again as her nuts grow ever-larger. This time, she grabs her dick in both hands as she starts to piston her hips forward, dragging her now-engorged balls up the sheets until they're resting on your thighs. The weight's so great, and the wetness so complete, that you can't do a damn thing but sink into the bed and moan like a used whore, groaning in over-stimulation as the alpha matron sheathes herself in you again.");
	output("\n\nArine doesn't start slow this time. She rocks hard on you, bouncing on her knees and slamming her hips forward, making those huge nuts quake and sway over you. Her ridged cock plows into your [pc.vagOrAss " + vagIdx + "] on a bed of cum and fresh pre, hard enough to make your body rock back in the bed. This time she doesn't smother you in boob, but rather looms over you in her full dzaanic majesty, showing every inch of sweat-slicked caramel skin and churnings ballsflesh.");
	output("\n\n<i>\"Just lie back and moan for me,\"</i> your domina coos between thrusts. <i>\"Don't hold anything back. Cum as much as you want.\"</i>");
	output("\n\nYou do. You can't help it. Her cock hits just the right place, and your whole body becomes a supernova of ecstasy, orgasm rocking you from head to toe. Time loses all meaning -- even if you had a clock, and the presence of mind to wonder, your attention is completely dominated by the hypnotic bounces of Arine's breasts, the liquid jiggling of her testicles slapping your ass, and the feeling of intense, all-consuming fullness as she cums again.");
	output("\n\nAnd again. And again.");
	output("\n\nEventually, you realize Arine doesn't have discrete orgasms anymore; she's just a fire hose spraying the weight of her swollen nads inside you, making your body stretch and deform to take the never-ending flood of cum. Your stomach gets puffy, and then rises off your body, growing like a pregnant slut's. And it feels <b>good</b>. You cum as much from the stretch and the fullness as you do from the dzaan matron's cock spearing you -- and she knows just how to make your body melt around every thrust.");

	if (vagIdx < 0) pc.loadInAss(getArine());
	else pc.loadInCunt(getArine(), vagIdx);
	IncrementFlag("ARDIA_PARTIED_SEX");

	addButton(0, "Next", itsAGoodThingArinesBedsAreSturdy, vagIdx);
}

public function itsAGoodThingArinesBedsAreSturdy(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showArine(true);
	author("Savin");
	processTime(40+rand(51));

	output("At some point, after you look 12 months pregnant and can barely do more than beg her to stop filling you, Arine finally stopped. You remember being dragged into the showers, you definitely remember her washing every inch of your body with her soaped-up breasts and balls, and the way her strong hands massaged your stomach until gallons of her cum had poured down your thighs, emptying your ragged " + (vagIdx < 0 ? "bowels" : "womb") + " spurt by spurt. Clean, pressed sheets were waiting for you as the mighty amazon carried you back to bed.");
	output("\n\nWhen you wake up the next morning, Arine's breasts are serving as your pillows, and her cock is sheathed protectively in your [pc.vagOrAss " + vagIdx + "]. Her hands stroke your [pc.hair] slowly, lovingly, even as she throbs inside you. But you don't smell the overwhelming potency of cum in the air anymore. It seems anything else wasted in the night is packed securely in your body. The size of her sack, only slightly reduced from when she first unveiled it, only confirms as much.");
	output("\n\nShe moans softly when you stir, propping herself up on an elbow and slipping herself out of you, cock half-hard and glistening. <i>\"Good morning, captain,\"</i> Arine, purrs, tracing a finger up your cheek and onto her nipple chain. <i>\"How are you feeling?\"</i>");
	output("\n\nDrained. Relaxed. Contented. Exhausted. Well-rested. It's hard to put to words.");
	output("\n\nShe smiles. <i>\"Perfect. Then stay here and rest. My betas will bring you breakfast in bed. They'll have your ship cleaned and refueled by the time you're done, and then you can be off...");
	if (ardiaIsCrew()) output(" and I'll be here, should you wish to return. Merely ask my daughter. Take care of her, and mommy will always take care of you.");
	output("\"</i>");
	output("\n\nArine lifts herself off the bed, gloriously naked, caramel skin glistening in the morning light as it streams through the windows. You watch her with abject lust, even drained as you are, as her thick ass and fat balls sway to her dzaanic gait. Arine dresses and leaves in silence, save for a slap of her ass when she bends over to collect her shirt, and moments later, a group of betas arrive with platters of steaming food... all as naked as their mistress, led by Ardia's mother.");
	output("\n\nIt seems that the pampering isn't quite over.");

	ardiaFamilyVisitWrapup();
}

public function ardiaFamilyVisitWrapup():void
{
	//To space. Add Home Cooking status for like 3 days, remove any negative statuses like sore/exhausted/cum-covered as if you'd slept and showered.
	if(pc.hasStatusEffect("Home Cooking"))
	{
		if (pc.statusEffectv1("Home Cooking") < 50) pc.setStatusValue("Home Cooking", 1, 50);
		if (pc.getStatusMinutes("Home Cooking") < 3*24*60) pc.setStatusMinutes("Home Cooking", 3*24*60);
	}
	else pc.createStatusEffect("Home Cooking", 50, 0, 0, 0, false, "Icon_Cooking", "While you are well fed, you recover more while resting.", false, 3*24*60);
	sleepHeal();
	pc.shower(); // Include rinsing? 9999
	IncrementFlag("ARDIA_PARTIED");

	addButton(0, "Next", mainGameMenu);
}

public function ardiaCrewBlurbs(btnSlot:int = 0, showBlurb:Boolean = true):String
{
	// Ardia not there goes here

	addButton(btnSlot, "Ardia", ardiaCrewApproach);

	if (!showBlurb) return "";

	switch (ardiaDomLevel())
	{
		default: case 0:
			if (rand(3) == 0) return "\n\nArdia is currently sitting in her room, typing away on her holoscreen. She's juggling a half-dozen social media services at once by the looks of things, keeping in touch with all her friends.";
			else if (rand(2) == 0) return "\n\nYour alpha companion is sprawled out in the middle of your ship, enjoying some quality time with a handheld game and a beer. She smiles whenever you walk by, though her eyes never leave her screen.";
			else return "\n\nArdia's standing in the galley with her head buried in the fridge, grazing off your supply of snacks and soft drinks. She's humming to herself all the while, inhumanly wide hips swaying side to side to her own melody.";
			break;
		case 1: case 2: case 3: case 4:
			if (rand(3) == 0) return "\n\nArdia is following you around as you meander about the ship, trying to learn all she can about its operation. Every once in a while, though, your bodies brush -- and you feel a little tingle run through you when you realize those fat, heavy orbs are so close that you can just reach out and fondle them. When you do, Ardia doesn't seem to mind at all...";
			else if (rand(2) == 0) return "\n\nYour alpha companion is sprawled out in the middle of your ship, enjoying some quality time with a handheld game and a beer. She smiles whenever you walk by, reaching up to cop a feel or stretching out to entice you with those beautiful tits of hers.";
			else return "\n\nArdia's standing in the galley with her head buried in the fridge, grazing off your supply of snacks and soft drinks. She's humming to herself all the while, inhumanly wide hips swaying side to side to her own melody.";
			break;
		case 5: case 6: case 7: case 8: case 9:
			if (rand(3) == 0) return "\n\nArdia's never far away, it seems. Even when she isn't emptying her balls down your throat, and you're not craving your fill from them, she seems to be a constant shadow on your heels. Ardia follows you from station to station, observing your command with interest and nodding as you work, as if she's giving her approval to your remaining authority.";
			else if (rand(2) == 0) return "\n\nArdia is sitting in your bedroom, lounging naked for all to see. Her [ardia.balls] are resting atop her thick thighs, and her [ardia.cock] is pinned by its own half-hard weight against her soft belly. She's playing with a little handheld at the moment, as if her reclining body is enough to tempt you" + (crew(true) > 1 ? " -- or anybody else on the crew --" : "") + " to come and take your fill of her addictive presence.\n\nIt's a hard thing to resist...";
			else return "\n\nArdia's sitting on the arm of your captain's chair, as if she's awaiting your attention... or considering how her fat balls are hanging out of her [ardia.armor], rubbing all over your seat, maybe she's just marking her territory with her scent. Either way, the aroma in the air is mouth-watering...";
			break;
		case 10:
			if (rand(3) == 0) return "\n\nArdia is sitting on the bridge at the moment, her broad ass planted in your captain's chair. One of her legs is crossed over the other, letting the fat weight of her [ardia.balls] hang over the edge. She doesn't need a captain's rod when she has those to keep you in line. You may be the captain in name still, but you know who's calling your shots now. If you want to take command at the moment, you'll just have to sit on her lap... right where you belong.";
			else if (rand(2) == 0) return "\n\nArdia is sitting in your bedroom, lounging naked for all to see. Her [ardia.balls] are resting atop her thick thighs, and her [ardia.cock] is pinned by its own half-hard weight against her soft belly. She's playing with a little handheld at the moment, as if her reclining body is enough to tempt you" + (crew(true) > 1 ? " -- or anybody else on the crew --" : "") + " to come and take your fill of her addictive presence.\n\nIt takes every ounce of self-control not to just cum from the scent of her on the air, especially when she glances out the hatch and smiles seductively at you.";
			else return "\n\nArdia is lounging in the galley with her suit's zippers down as she grazes in the fridge, cooling her beautiful bronze skin off as she eats. She's bent over at the moment with her mareish flanks aimed in your direction, fat balls swinging heavily as she hums and sways her hips. You can't help yourself but slip in behind her every time you walk past, planting worshipful kisses on her gonads or licking the sweat from her thick thighs and plump asscheeks. She doesn't need to acknowledge your efforts; your alpha is above such things when she's busy; all the encouragement you need to see is the occasional twitch in her [ardia.cock] and the sweet musk drifting off her body.";
			break;
	}
}

public function ardiaCrewApproach():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");
	processTime(1);

	switch (ardiaDomLevel())
	{
		case 0:
			output("You head over to Ardia's quarters and give a knock on the metal bulkhead beside her open door. She glances up from her holos with a smile. <i>\"Heyya, captain. What can I do for you?\"</i>");
			break;
		case 1: case 2: case 3: case 4: case 5: case 6:
			output("You wander up to the open door of Ardia's quarters and give the big beauty a hello, prompting her to wave you in with a smile. <i>\"Hey, [pc.name],\"</i> she says, leaning in to plant a little kiss on your cheek. <i>\"How're you holding up\"</i>");
			if (ardiaWithdrawal())
			{
				output("\n\nYou manage a smile back, but you can feel your body trembling as you drink in the succulent orbs of her fat balls straining the front of her skin-tight suit. You can't exactly say you're holding up great... you need your fix.");
				output("\n\n<i>\"Oh, you poor thing,\"</i> Ardia sighs, shifting her thick thighs behind her potent sack. <i>\"Don't push yourself so long without me... I'm right here. Just say the word and I'll help.\"</i>");
				output("\n\nStars, those balls are so thick and full... so heavy with her addictive seed... it'd be so easy to just let her push you down so you can suck her dry.");
			}
			else output("\n\n<i>\"Good,\"</i> you tell her. Even still, as she saunters a little closer and traces her hand up your arm, you can't help your eyes from wandering down to her [ardia.balls]. They're so full, so heavy with her addictive cream... it'd be so easy to just fall to your [pc.knees] and suck her dry.");
			break;
		case 7: case 8: case 9:
			output("You walk up to Ardia's door and knock beside the open hatch, earning a <i>\"Come in,\"</i> from inside. You do so, coming over to where the big bronze beauty is reclining and lowering yourself on your [pc.knees] before your alpha. Poetically, her juicy balls and life-affirming rod are just inches from your face as she rises to her feet.");
			output("\n\n<i>\"Hello there, [pc.name],\"</i> she smiles, running a hand across your [pc.hairNoun]. Eventually she hooks a finger beneath your chin, lifting your gaze longingly off her balls and up to her face. <i>\"Mmm, I can tell you need something, my beta. Don't be shy; I'm here for you no matter what.\"</i>");
			break;
		case 10:
			output("You've barely made it through Ardia's doors before your whole body is flushed and trembling, and the moment your beautiful alpha tells you to come inside, you hurry in and fall to your [pc.knees] before her, nestling your [pc.face] against her succulent nuts, cursing the sheer latex separating her beautiful bronze ballsflesh from your lips.");
			output("\n\nArdia giggles above you, stroking your head gently. <i>\"Hello, my beta,\"</i> she purrs, shifting her thick thighs apart so that you can bury more of your face against her sack. <i>\"Oh I love seeing you come in here, practically drooling for me. It's so... so <b>fucking hot</b>.\"</i>");
			output("\n\nYou can feel the truth in her words in the steady beat of her heart and the stiffening of her [ardia.cock] beneath her clothing. It rubs against your cheek, so tantalizingly close that you can't help but flick your tongue out, running it across your alpha's crown under her fly. Ardia giggles sweetly. <i>\"Come now, beta, tell your alpha what you want. Is it just my cock, or maybe you'd actually like to talk for once... before you suck.\"</i>");
			break;
	}

	ardiaCrewMenu();
}

public function ardiaCrewMenu(cleer:Boolean = false):void
{
	if (cleer) clearMenu();

	addButton(0, "Talk", ardiaCrewTalks, undefined, "Talk", "See if Ardia's up for a chat.");
	addButton(1, "Sex", (flags["SEXED_ARDIA"] != undefined || immuneToArdia() ? timeToBangYourDzaanCrewmate : areYouSureYouWantToBangArdia));
	if (flags["CREWMEMBER_SLEEP_WITH"] == "ARDIA") addButton(2, "No Sleep With", ardiaGTFOOfMyBed, undefined, "Don't Sleep With Ardia", "Tell Ardia you'd like to sleep alone for now.");
	else if (flags["SEXED_ARDIA"] == undefined) addDisabledButton(2, "Sleep With", "Sleep With Ardia", "You need to be banging Ardia in order to sleep with her. Time to level up that relationship!");
	else addButton(2, "Sleep With", getADzaanButtWarmerInYourBed, undefined, "Sleep With Ardia", "Invite Ardia to sleep in your quarters.");
	addButton(3, "Crew Status", discussArdiasEmploymentOptions, undefined, "Crew Status", "Talk with Ardia about her role on the crew.");
	addButton(4, "Appearance", ardiaAppearanceScreen);
	if (addictedToArdia()) addButton(5, "Get Cum", youGotAnyMoreOfThemCummiesArdia, undefined, "Get Cum", "Ask Ardia for a little pick-me-up to go. Can't go having withdrawals while you're adventuring, can you?");
	if ((flags["ARDIA_TALKS"] & 3) == 3) addButton(9, "Her Folks", seeIfArdiaWillLendYouHerMommy, undefined, "Her Folks", "Ask Ardia to take you to her parents' resort world.");
	addButton(10, "Fill Nuts", function():void{if(ardia.ballFullness < 100)ardia.ballFullness = 100;ardiaCrewApproach();});
	addButton(12, "+ Dom", function():void{ardiaDomLevel(1);ardiaCrewApproach();});
	addButton(13, "- Dom", function():void{ardiaDomLevel(-1);ardiaCrewApproach();});
	addButton(14, "Back", crew);
}

public function ardiaCrewTalks():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");
	processTime(1);

	output("You ask Ardia if " + (ardiaDomLevel() < 7 ? "she wouldn't mind talking for a bit." : "you could just chat for once."));
	output("\n\n<i>\"Hmm? Of course, " + (ardiaDomLevel() < 4 ? "captain. What's on your mind?\"</i>" : "my beta. Though if you get me monologuing like a real alpha, you might have to feed yourself while we talk!\"</i> she giggles."));

	ardiaCrewTalkMenu();
}

public function ardiaCrewTalkMenu(topic:int = -1):void
{
	addButton(0, "Her World", ardiaExplainsHowToPronounceHauaMai, undefined, "Her World", "Ask Ardia about her homeworld, the resort planet of Hauâ Mai.");
	addButton(1, "Her Family", youTotallyDontWantToGushAboutArine, undefined, "Her Family", "Ask Ardia about her folks and siblings.");
	addButton(2, "Her Goals", whatComesNextOtherThanArdiasBalls, undefined, "Her Goals", "Ask Ardia about what she wants to accomplish in life.");
	if (flags["SEXED_ARDIA"] == undefined) addDisabledButton(3, "Transformations", "Transformations", "You need to fuck Ardia at least once to even think about transforming her for your pleasure...");
	else addButton(3, "TFs", giveArdiaAMod, undefined, "Transformations", "See if there's anything you have on-hand that would make Ardia even hotter...");
	addButton(14, "Back", ardiaCrewMenu, true);

	switch (topic)
	{
		case 0: addDisabledButton(0, "Her World"); break;
		case 1: addDisabledButton(1, "Her Family"); break;
		case 2: addDisabledButton(2, "Her Goals"); break;
	}
}

public function ardiaExplainsHowToPronounceHauaMai():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");
	processTime(2+rand(2));

	output("<i>\"You grew up on Hauâ Mai?\"</i> you ask, broaching the topic of her homeworld. ");
	output("\n\nArdia just nods evenly, like she's only half paying attention to your question. <i>\"Well, yeah, my family's been there since we first colonized the planet like a thousand years ago. Eventually some humans realized how beautiful the planet was, so an ancestor of mine opened up a resort. Elevated ourselves to defacto nobility, I guess, on account of everybody else still living in villages out in the provinces. Many dzaan dislike technology and chafe in bigger cities. Especially alphas; we need open spaces and warm air on our naked bodies!\"</i>");
	output("\n\n<i>\"That planet seems perfect for you, then,\"</i> you muse.");
	output("\n\nShe nods eagerly. <i>\"That it is. Hauâ Mai is almost exactly like our species' homeworld. It's hot and wet and beautiful, just like dzaan are! Endless beaches and deep jungles for us to play it, and as much fresh fruit as you can carry on every tree. It's a paradise, and without lifting a finger, there's enough to sustain our people forever, the way most dzaan live.\"</i>");
	output("\n\nSeems like Ardia has nothing but glowing praise for her homeworld. Rather a rare trait, you've found since you launched this quest of yours. <i>\"Were you happy there?\"</i>");
	output("\n\n<i>\"Oh, absolutely. I was pampered and spoiled in every way, so that certainly helped, but even a rich girl like me can tell when I'm surrounded by perfection. I think most of the population was happy, at least on our part of the planet. The further you get from the coast, though, the harder things get -- less commerce from other worlds means less wealth, means living more and more primitive. Some tribes near the equatorial rain forest are barely more advanced than cave-dwellers, without access to medicine or even the extranet. That's how I ended up getting dzaan-napped by those slavers; those of us on the coastlands send missions out to the boonies to try and help them. You know, medicine and sanitation and food. That sorta thing. Of course, the villages are also basically defenseless against anyone with space-age tech, so slavers and other scum can victimize them with impunity. Even knowing that, they refuse to modernize. Like it's a price they're willing to pay for their way of life...\"</i>");
	output("\n\nYou take it she doesn't agree with the sentiment.");
	output("\n\nArdia scowls. <i>\"Of course not! It's an alpha's responsibility to take care of her betas, to protect and cherish them. I understand wanting to keep a traditional way of life, but you can't put your comfort above your responsibilities. If you won't do whatever it takes to keep your betas safe, you're a pathetic excuse of an alpha; an alpha in name only!\"</i>");
	if (ardiaDomLevel() > 4)
	{
		output("\n\nThe idea of your big, chunky alpha protecting you from harm <b>does</b> make you grin, despite yourself. As much as you've come to love being crushed beneath her big, beautiful body and feeling her cock dominate your every hole... you're pretty sure that when push comes to shove, you're always going to be your alpha's bodyguard. Always have been, always will be.");
		output("\n\nArdia blushes, but it fades when you reach in and put a hand on her stomach to stroke it reassuringly. You love her just the way she is.");
	}
	else if (ardiaDomLevel() > 0)
	{
		output("\n\nSo if that's how Ardia feels about an alpha's role, you have to give her a little teasing, reaching down to squeeze the dzaan's plump belly. Shouldn't she be a big, strong warrior-babe if she's gonna be a guardian for her harem?");
		output("\n\nYour lover's cheeks darken, and she quickly diverts her eyes to an interesting part of bulkhead off to the side. <i>\"I... well, I don't really have a harem to worry about yet, so... you know, I haven't really had to get in shape. But when I'm ready to settle down, I will! Don't doubt it for a second: I'll be the biggest, most ripped alpha amazon you've ever seen!\"</i>");
		output("\n\n<i>\"How could I doubt you?\"</i> you grin, jiggling her gut.");
		output("\n\nShe huffs, blushing harder. <i>\"S-stoooop! I like being chubby while I can...\"</i>");
		output("\n\nSo do you.");
	}

	flags["ARDIA_TALKS"] |= 1;

	ardiaCrewTalkMenu(0);
}

public function youTotallyDontWantToGushAboutArine():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");
	processTime(2+rand(2));

	output("<i>\"How's your family doing?\"</i> you ask.");
	output("\n\n<i>\"Good. Better, now that they know I'm safe,\"</i> she smiles. <i>\"The whole family were freaked out beyond belief when I was taken by those damn pirates, and rightly so! Most dzaan that get taken like I did don't come back, doomed to spend the rest of their lives as pleasure-slaves to disgusting aliens like that big green bastard you saved me from. Every since I came aboard, my mother has been writing me basically every day... if I don't answer in a couple hours, she loses her damn mind. Can't really blame her, but it's kind of annoying having my alerts blow up if I take a long nap.\"</i>");
	output("\n\nShe laughs and smiles, leaning back in her chair. <i>\"It's a good feeling, though... knowing my folks care so much.\"</i>");
	output("\n\n<i>\"Would you tell me about them?\"</i>");
	output("\n\n<i>\"My folks? Sure, I suppose. You met my sire -- what a human would call a father -- when I first came aboard. Arine, her name is. My mother's Farahn, one of the first betas my sire bound... though certainly not the last! I had hundreds of moms back at the resort, all pitching in to help raise me. One of the best parts about being a dzaan kid is all the love you get. Especially from the betas that don't have kids of their own yet.\"</i>");
	output("\n\n<b>Yet</b> sounds like the operative word there. <i>\"I guess you have a lot of siblings?\"</i>");
	output("\n\nArdia howls with laughter. <i>\"A lot? Yeah, I guess! Try a hundred. My pop's got the resources to keep up by far the largest harem on Hauâ Mai, and all the kids that entails. Condoms and birth control are considered... barbaric, I guess... among tribal dzaan. Like it's proof that the alpha isn't strong enough hunter or whatever to provide for her family. My family came from that, and I guess the idea carried across when we civilized ourselves. Sooo yeah, the part of the grounds reserved for the harem is just crawling with my half-sisters. At least the ones that haven't found their own alpha yet.\"</i>");
	output("\n\n<i>\"And you're the only alpha among them?\"</i>");
	output("\n\nShe nods proudly. <i>\"Yep! Pop's one and only. I dunno if it's something in the water or what, but all my half-sisters -- and my full sisters, too -- are betas. At least I don't have to worry about inheritance, cuz my folks are getting too old to have more kids, and I'm still the only heir.\"</i>");
	output("\n\nThat sure explains why her folks pampered her so much. ");
	output("\n\n<i>\"Do your sisters ever get jealous of you? Sounds like there are older ones, after all.\"</i>");
	output("\n\n<i>\"Sure,\"</i> she shrugs, <i>\"but age doesn't have anything to do with it. At least on Hauâ Mai, inheritance is only to alphas, and it's split between siblings. If I had any younger alpha-sisters, I'd have to fight 'em if I wanted to own the whole resort, make them subservient... or more likely, just share stock in the place, cuz y'know, I'm a lover, not a fighter. Plus running that place is a lot of work; I wouldn't mind sharing the load.\"</i>");
	if (ardiaWithdrawal()) output("\n\nYou wouldn't mind a load of her cum right now, speaking of which, but you force yourself to keep focused. You can reward yourself with giving her a blowjob later.");
	output("\n\nArdia sighs and folds her hands over her stomach. <i>\"But do they get jealous? I don't... I don't think so. They're betas, they know their place. My folks raised them right. My sisters have never been anything but sweet to me, probably cuz they know there's a good chance I'm gonna be taking care of 'em some day. The ones that don't move out to with an alpha of their own, or head out to the stars to find their fortunes.\"</i>");
	output("\n\n<i>\"Is that common for dzaan -- becoming Rushers?\"</i>");
	if (pc.hasKeyItem("Kaska's Detonator")) output(" You remember Kaska, of course, but she seemed very different from Ardia and her family.");
	output("\n\n<i>\"I... I dunno, honestly. Kind of doubt it. Most dzaan still live like tribals, and those of us that don't almost all come from places like my folks' resort. I don't think there's a lot of us that come up rough-and-tumble, ready to take on the stars on our own. Then again, there's probably a loooot of dzaan born in slavery, so maybe those that escape become spacers like you? Like me, too, I guess!\"</i>");
	output("\n\nArdia grins and faux-flexes, which only makes her curvy frame jiggle.");

	flags["ARDIA_TALKS"] |= 2;

	ardiaCrewTalkMenu(1);
}

public function whatComesNextOtherThanArdiasBalls():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");
	processTime(2+rand(2));

	//DM 10 Vers.
	if (ardiaDomLevel() >= 10)
	{
		output("You clearly remember your beloved alpha talking about her 'missionary work' back before she took you into her harem, and so you ask: <i>\"What do you want to do when we're done with this probe chase, mistress?\"</i>");
		output("\n\n<i>\"You mean when you're done playing hero and find me your inheritance?\"</i> she counters, though her lips form a gentle smile. <i>\"I'm just teasing, my love. I won't take that hard-earned reward from you. Just knowing that you <b>would</b> pile every credit up at my feet without a second thought is enough to get my [ardia.cock] rock-hard. My precious beta...\"</i>");
		output("\n\nYou find yourself blushing, eyes transfixed on her dick as a little throb works up her shaft beneath her [ardia.armor]. <i>\"But you're asking what I want to do long term, hmm? I don't know... but I know it involves you. Maybe a few other betas I'll pick up along the way. I'll need to go home at some point and tend to my parents' business -- they'll want to retire eventually, and my sisters need <b>somebody</b> to take care of them. Maybe if I'm a good girl, the resort will get 'a Steele Tech property' as a byline under the big neon nameplate. You'll use all your quadrillionaire money to buy me out, right? Let me move on in and set up <b>my</b> CEO's office right in yours... or your can make yours under my desk where you belong!\"</i> ");
		output("\n\nThat would be a sight to see, you have to admit. Dad's high profile office on the top floor of Steele Tower is all glass walls and floor, too, so everyone in the building (and all the paparazzi) would know right where Daddy's heir ended up. You could leave all the hard work to Ardia while you sit between her thighs, nuzzling up to her fat sack, only coming up for air to put your signature on your alpha's orders. Of course, you'd need" + (celiseIsFollower() ? " Celise and" : "") + " a whole gaggle of other galotians to work as the janitorial staff, because there'd be <b>so much</b> of your cum spilling on the floor from nine to five that you'd risk blotting out the glass without someone to slurp it all up.");
		output("\n\nThe way your alpha's suit's tightening around her ample curves and potent cock, you're pretty sure you're both on the same wavelength. <i>\"Yeah,\"</i> she murmurs. <i>\"I'd like that... hell, we could just buy up my whole homeworld. Who needs to go working for betas when I could just buy a whole planet full of dzaan bitches ready to work my shaft? Custom says, if you own the land, you're the alpha... until somebody makes <b>you</b> their beta. With you around, I'd like to see any hut-dweller flintspear try.\"</i>");
		output("\n\nFor Ardia, you'd fight off the whole planet. She smiles at the notion, crooking a finger until you scoot forward and nuzzle into your alpha's big beefers, feeling her warmth and heartbeat through her skin-tight suit. Ardia's legs wrap around you, holding you tight and stroking your [pc.hair]. <i>\"Soon, babe... it won't be long before you get to blast your dumb cousin and we can plant our flag on your pop's empire. I'll be with you every step of the way.\"</i>");
	}
	//DM less than 10 Variant:
	else
	{
		output("You clearly remember Ardia talking about her 'missionary work' back before she was kidnapped by pirates, and so you ask her if she'd like to talk about her work. ");
		output("\n\n<i>\"Sure! It's been a while since I had the chance to talk somebody's ear off about it,\"</i> Ardia says, smiling. She takes a seat, squeezing those huge hips into her chair. Guess this might be a long one, then; you follow suit, plopping down on Ardia's bed across from her as she thinks up the best place to start. ");
		output("\n\n<i>\"So, most dzaan on Hauâ Mai live in tribal villages in the jungles. They don't care that we started as a space colony, they went right back to living like primitives the second they could. I'll never really understand them, but... I guess it's how our people have always lived. Even on our homeworld, urban dzaan like me are a pretty small minority. At least, that's what my folks say.\"</i>");
		output("\n\nAnd she wanted to help the villagers?");
		output("\n\nArdia nods slowly. <i>\"Yeah. We brought them medical supplies, mostly, but also food and insta-shelters when the weather turned bad. That's all we ever wanted to do... but of course, it's dangerous. Pirates love grabbing tribal dzaan, and if they catch a missionary in the process, then that's just as good for them. Still, helping our poorer sisters is the right thing to do no matter how dangerous it is to us. If I could go back in time and change anything... I wouldn't. It was worth doing... and worth meeting you, too.\"</i>");
		output("\n\nYou feel a little blush coming on, so you quickly change the subject, asking her if she plans to keep helping tribal dzaan now that she's free again.");
		output("\n\n<i>\"Sure!\"</i> she laughs. <i>\"I'd love to. That's what I'm doing in my quarters most of the time when you're off doing your space cowboy thing. I run a website for organizing mission trips, taking donations, that kinda thing. I made it for a university class Freshman year, but it just kinda... took off, I guess? I didn't even know it was actually online at first, until my inbox just <b>exploded</b> with alerts in class one day. Apparently some beta liberation activist found it and shared to all her followers. I kinda got swept up into actually doing missionary work after that.\"</i>");
		output("\n\n<i>\"Not that I'm complaining!\"</i> she hurries to add. <i>\"Like I said, I love the work. If we can't convince the tribals to come into the cities, then they've got to have help from us urban dzaan or they're totally at the mercy of mother nature... and slavers, too.\"</i>");
		if (pc.isAss()) output("\n\nSounds like she she be making all these dzaan her betas. Just make 'em come to heel and live where they're safe.\n\nArdia shrugs. <i>\"Would that I could. But even a rich girl like me can't support a whole planet's worth of betas.\"</i>");
		else output("\n\nWouldn't it be better for everyone if her tribal cousins came into the city, then? Why do they hate civilization so much?\n\nArdia shrugs. <i>\"Who knows. General misanthropy, or some spiritual significance. Every tribe I've talked to has had a different answer.\"</i>");
		output("\n\n<i>\"So... is that all you see yourself doing?\"</i> you ask.");
		output("\n\n<i>\"Not <b>all</b>.\"</i> Ardia smirks, looking you up and down with a hungry glint in her eye. <i>\"I'm on your crew, aren't I? I've got all this space adventurer stuff to do now... and when we're done, and you've gone off and claimed your fortune or whatever, then I've got my folks' resort to go be an heiress of. Nowhere near as cool as this whole Steele Tech thing, but it does mean a lot to me. And I can help even more people with all those resources...\"</i>");
		output("\n\nWell, that seems to give you a good idea of what Ardia's going to be doing with herself when it's all said and done.");
	}

	flags["ARDIA_TALKS"] |= 4;

	ardiaCrewTalkMenu(2);
}

public function increaseTheArdiaDonut():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Savin");
	processTime(4+rand(7));

	output("<i>\"Hey, buttslut,\"</i> you grin, taking another dose of anusoft out of your pack. <i>\"Look what I've got for you!\"</i>");
	output("\n\nArdia gasps when she sees what you're holding, and immediately you can see her [ardia.cock] twitch beneath her skin-tight suit. <i>\"F-fuck me, [pc.name], another one? But I've already use that stuff... my butt rubs on its own ring every time I take a step, like my asscheeks are huge vibrators teasing the rim. What would a <b>second</b> dose of that anal ambrosia do?\"</i>");
	output("\n\n<i>\"Well, there's only one way to find out,\"</i> you tease, wiggling the bottle hypnotically in front of her. ");
	output("\n\nArdia bites her lip for a moment, cutting her eyes between you and the anusoft, before finally sighing and grabbing her zipper. <i>\"You better promise to fuck my ass every chance you get, [pc.name]. If you don't, I think I'm gonna go crazy just feeling that much booty grinding around back there...\"</i>");
	output("\n\nOh, that's an oath you're all too eager to keep. Ardia needs no more convincing to peel herself out of her latex jumper, letting her hardening " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "horsecock" : "cock") + " flop out and slap the front of her taut sack. Those [ardia.balls] are going to be emptying in just a moment, so you take the opportunity to close the distance and give them a healthy squeeze and grope while you can, feeling just how full your lover's cumbarrels are. She gasps, moaning into your [pc.chest] and wobbling on the balls of her feet. It's easy to give her a little push back onto the bed, making her fat thighs spread and lifting her sack up onto her soft stomach. ");
	output("\n\nHer nuts are hefty enough to pin her [ardia.cock] down beneath their weight, keeping her alpha's tools out of the way while you brush your fingers along the dusky lips of her quim, picking up a little lube before finally getting down to the dark, dank donut between her cheeks. Her whole body tenses the second your fingers brush along her raised rim, and you give an involuntary grin as the equine-like rump winks hungrily at you, practically sucking your fingers in. It's soft and tender to the touch, easy to push around and squeeze, feeling like a perfect extension of Ardia's callipygian mountains.");
	output("\n\nBut it could be so much more.");
	output("\n\nYou squeeze the contents of the anusoft dose directly onto the plump ring of Ardia's already-tender donut, watching it twitch and then open, revealing the black channel inside just long enough for some of the cream to seep inside. You don't even need to touch her for the anusoft to take effect, like her whole body craves it and is desperate to respond to the changes. Ardia whimpers, leaking pre onto herself as her black donut starts to grow, swelling softly and flowering open, leaving itself slightly agape so that you can effortlessly slip two fingers inside her and wiggle them around, only just touching her inner walls.");
	output("\n\nWhen you do, though, Ardia squeals. her [ardia.cock] jumps with a rush of lust, hard enough to overpower the weight of her balls -- and sending the two fat orbs slapping down against her own anal mound in the process. Just that stimulation alone pushes her over the edge, making her keratin-edged cock erupt all over her tits. She thrashes, back arching as her anal orgasm milks her prostate all over her chest and face, treating your fingers to a front-row experience of her silken fuckhole clenching wildly around them. It feels like you're surrounded by soft, wet sponge though -- she's practically incapable of being <i>tight</i> now, of strangling a cock being her sphincter's muscles. Now Ardia's ass exists only to pleasure thrusting spears, to meekly accept every hard rod that presses against her. " + (pc.hasCock() ? "Your cock" : "The first cock she sees") + " is going to positively <i>melt</i> into her... and just having her ring teased is probably going to make her cum her brains out from now on.");
	output("\n\nOh, this is going to be <b>fun</b>.");

	pc.lust(35+pc.libido()/2);
	ardia.ass.delFlag(GLOBAL.FLAG_PUMPED);
	ardia.ass.addFlag(GLOBAL.FLAG_HYPER_PUMPED);
	pc.destroyItemByClass(Anusoft);

	if (ardiaInZhengShi()) ardiaMenu();
	else ardiaCrewMenu();
}

public function makeMyDzaanBallsGrow():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Savin");
	processTime(17);

	output("You slip a tin of Nuki Nutbutter out of your pack and present it to Ardia. She quirks an eyebrow and takes it, eyes drawn instantly to the little cartoon raccoons on the side. <i>\"Oh, I bet I can guess what this does. My folks used to do real good business with this kui-tan cargo company, and the girl that ran it, she'd always show up with these huge beanbags swinging in her overalls. Said she'd 'saved up' for her favorite masseuses. All twenty of them. Must have been part of her payment... or maybe that was the delivery!\"</i>");
	output("\n\nSo Ardia knows what kui-tan are all about. That'll save you having to explain what Nuki Nutbutter does.");
	output("\n\nShe grins and nods. <i>\"So you want me to use some of this, huh? What are you planning");
	if (addictedToArdia())
	{
		output(", my precious beta?\"</i>");
		output("\n\nStaring down at Ardia's plump package, your desires couldn't be more clear. You want her balls to be massive barrels of cum for you to suck down. You want to spend days nestled between your alpha's thick thighs, mouth mounted on her [ardia.cock] and suckling from it like your own personal fountain. You want to be able to subsist on nothing but her cum for days, to feel gallons of it sloshing around in your belly all at once.");
		output("\n\nThe zipper on the front of Ardia's [ardia.armor] tears open with the force of her sudden erection, and her [ardia.cock] slaps heavily against your thigh. <i>\"F-fuck, that's a hot mental image... you really know how to get my heart racing, don't you, my little cumslut?\"</i>");
		output("\n\nYou'd be a poor beta if you didn't...");
	}
	else if (pc.hasCock() && flags["ARDIA_BUTTLOVED"] != undefined)
	{
		output(", huh?\"</i>");
		output("\n\nYou grin and take a step forward, letting Ardia feel your [pc.cock] pressing against her skin-tight suit as your hands grab both her fat asscheeks in hand and squeeze her close. <i>\"I want to watch you squirt <b>gallons</b> of your drugged-up spunk all over the sheets when I fuck you from behind. That's what I'm planning.\"</i>");
		output("\n\nHer cheeks darken, but from your position, you're able to feel the throb of Ardia's [ardia.cock] responding to the idea... and you're pretty sure you can feel her [ardia.asshole] twitching too. It's not like it's a one-sided venture here: Ardia loves getting fucked, and there's no way blowing kui-tan sized loads all over herself and your quarters isn't going to feel amazing for her. Hey, if she ever actually gets herself one of those dzaan harems, she'll be able to fuck the whole lot of them one after the other and never worry about going dry.");
		output("\n\n<i>\"Maybe someday, I can fuck you into one of your harem girls,\"</i> you add, squeezing her butt. <i>\"Milk your huge balls dry into some slut until she looks positively pregnant... and then just roll her aside for the next harem-babe to take her place.\"</i>");
	}
	else
	{
		output(", [pc.name]?\"</i>");
		output("\n\nYou're not planning anything... you just think it would be incredibly hot if an alpha-to-be like her was walking around with barrel-sized balls, able to bathe you and anybody else she fucks with gallons of cum. She could keep dozens of betas satisfied all at once with kui-tan balls! Plus, you have to admit, the idea of getting a one-girl bukkake from her is pretty tantalizing.");
	}
	output("\n\nArdia regards the bottle, then you, and slowly takes a deep breath. <i>\"You make a real compelling argument... I mean, it's basically the same argument that kui-tan trader made to my sire when she hocked her a vial of this stuff.\"</i>");
	if (flags["ARDIA_PARTIED_SEX"] == undefined)
	{
		output("\n\nYou blink. Wait, Ardia's <b>dad</b> has nuki nuts too?");
		output("\n\nYour lover giggles, rolling the bottle in her hand. <i>\"Sure she does! She has, like, way over a hundred betas she has to keep satisfied, all addicted to her dick. She can't possibly handle that many naturally -- nobody can! -- so she made some arrangements with that trader to make sure she could have all the betas she needed to run her resort with nothing but family. Sure, pop spends most of her weekends hooked up to an auto-milker bottling the stuff up for everyone, but she says it was the best decision she ever made. If I'm gonna take her place some day, I guess I ought to go ahead and make the plunge too.\"</i>");
	}
	else
	{
		output("That's true, Arine did have some massive balls that seemed to swell with nigh-infinite seed. Makes sense -- she'd need nuts that nuki'd to be able to feed a hundred or more lusty betas, not to mention cockhungry spacers that worm their way into her good graces.");
		output("\n\n<i>\"Sure, pop spends most of her weekends hooked up to an auto-milker bottling the stuff up for everyone, but she says it was the best decision she ever made. If I'm gonna take her place some day, I guess I ought to go ahead and make the plunge too.\"</i>");
		output("\n\nNow all you can think about is the two of them pressing their massive nuts together, letting you " + (pc.hasCock() ? "fuck their balls-cleavage" : "bath in the fountains of their combined ejaculate") + ". Damn it...");
	}
	output("\n\n<i>\"So... you want it?\"</i> you ask, eyeing the alpha's pouch through her [ardia.armor]. Her cock throbs, suffusing the air between you with aromatic musk. ");
	output("\n\nFinally, she grins and pushes the bottle back towards you. <i>\"Heck yeah I do. And you're gonna smear it on for me, aren't you? After all, you'd better get real familiar with manhandling my balls, cuz I'm gonna be relying on you to keep me from getting so swollen I can't walk. At least until I get a nice, big harem someday. \"</i>");
	output("\n\nDone deal. ");
	output("\n\nYou let Ardia wiggle out of her jumpsuit while you busy yourself squirting the contents of the bottle out onto your hands, rubbing them together to warm the cream up for her. When you're done, you cut your eyes up to see a vast expanse of naked brown beauty sprawling out on her bed, legs spread and half-hard cock rubbing on her belly. Her fist-sized nuts dangle between her head-crushing thighs, swaying heavily. If you weren't about to make Ardia one step closer to a kui-tan, you'd say they were damn big already... but compared to what they <b>could</b> be, they've barely dropped.");
	output("\n\nYou bite your lip to keep from smiling too much while you slip down on your [pc.knees] between her legs, letting your cream-covered hands find their way onto the taut chocolate skin of her sack. Ardia gasps, moaning softly as your fingers start slowly, steadily working all around her balls. ");
	output("\n\nThe sudden sensation of cold cream smearing across her ballsflesh sends a shiver up your lover's spine, and her [ardia.cock] throbs against her belly. Pre spills from her crown, pooling " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "between her tits" : "into her belly button") + ", assailing you with the musky aroma of " + (addictedToArdia() ? "your" : "the") + " alpha's arousal. Ohh, that's nice. You lean in and take a whiff, feeling your nerves fire all the way down to your loins; there's no way your [pc.skin] isn't burning red with lust now.");
	output("\n\nYou give her balls a squeeze, massaging the thick brown paste over every inch of Ardia's gonads. Her balls quake and wobble, showing you the pleasure and the building anticipation working through your lover's body: your heart is all aflutter thinking about watching her nuts swell up, growing so heavy and full that she can barely move -- everyone who comes near your beloved Ardia will be able to see how absolutely, explosively pent up she is, ready to unleash the flood at a touch... ");
	output("\n\nThen again, with you around, she's not likely to have that problem very often.");
	output("\n\nFor the moment, though, Ardia's balls just feel <b>weighty</b>. Her [ardia.cock] throbs urgently, basting in a lake of its own pre until you take it in hand and give it a stroke. Just that little motion makes your lover lurch upright as what feels like a gallon of spooge churns just below the surface of her balls, fighting to escape. The fat brown sacks swell visibly, forcing her to clench her thighs around your head and her cumtanks, fighting to keep from erupting at just the first touch.");
	output("\n\nAlready, her sack feels impossibly taut, far bigger than before. Fuller.");
	output("\n\nYou crave the sight of her balls swelling further, but at the same time, you can't help yourself anymore -- you need to finish what you've started. With a hungry howl, you bury your face into Ardia's fat nuts, sucking and kissing while your hands knead every inch to either side. Well after the nanomachine paste has run its course, you're content to just dig in and enjoy the sensation of it. Ardia's virile, chemical-laden sack feels so much more malleable, like working your fingers through putty, or the outside of a beanbag. Ooohh, that's nice...");
	output("\n\nWhile you're slaving away on her taut bronze skin, Ardia grabs her own [ardia.cock] in both hands and starts slowly riding them up and down her length. <i>\"F-fuck, they feel so good!\"</i> Ardia groans, shaking her hips to make her balls quake in your hands. <i>\"Like they're as soft as my ass now!\"</i>");
	output("\n\nSoft, and full... and <b>big</b>! Her balls have to still be growing, overflowing around your fingers and churning with internal production. She's gotta be close to cumming, and you're gonna make it absolutely rain when she does. ");
	output("\n\nSure enough, a few moments later, you hear your lover's pleasured cries reach their peak. Her thighs quiver all around you, slapping your cheeks hard while her hands pump away on her shaft. You content yourself with the musky aroma permeating the air, inhaling Ardia's ballsweat and pre like the hungry slut you are.");
	if (!addictedToArdia()) output(" Wait... are you? Oh, hell, who cares... you just want Ardia's cum all over you right now.");
	output(" You use your hands to rub her balls all over your cheeks, pressing your face as deep into her testicular cleavage as you can get while you lick and slurp her to orgasm. When it happens, you feel it in your [pc.face] before you feel the rain of [ardia.cum] splattering down on you, thick globs of dzaan alpha-cream exploding all over your back.");
	if (addictedToArdia()) output(" Oh, hell, you can't waste all that precious seed! You instantly leap up and attach your [pc.lips] to her [ardia.cockHead], using your hands to milk out every drop while you hungrily swallow and swallow some more.");
	output(" Only when her explosive climax has completely finished, and only little trickles of tainted aftershot are leaking from Ardia's slit, do you let yourself fall back and take your first breath of fresh air in what seems like an eternity.");
	output("\n\nArdia doesn't have the willpower to speak at this point; she's just plastered on her back in a lake of her own cum, breathing hard. You slowly pull yourself up onto the bed beside her and nuzzle yourself up into her cream-stained tits.");
	output("\n\nYou made a great decision today.");

	ardia.createPerk("'Nuki Nuts", 0, 1, 0, 0, "Permanent ability allowing your gonads to swell with excess seed.");
	pc.destroyItemByClass(NukiNutbutter);
	ardia.orgasm();
	ardiaDomLevel(1);

	if (ardiaInZhengShi()) ardiaMenu();
	else ardiaCrewMenu();
}

public function neverEnoughArdiaNutbutter():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Savin");
	processTime(10+rand(11));

	var beta:Boolean = ardiaDomLevel() > 3;

	output("You love watching Ardia's balls swell up, slowly inflating with the sheer output of her over-productive testes. But it's been a little too slow for you now -- you can't wait for her body to passively churn out enough cum to swell those beauties up to barrel sized. It's the era of instant gratification, and even biology is going to yield to your spur-of-the-moment desires. So you pull out another vial of nutbutter and present it to Ardia.");

	if (beta)
	{
		output("\n\n<i>\"Mistress, may I massage your balls with this?\"</i> you ask sweetly. ");
		output("\n\n<i>\"More 'nuki cream?\"</i> Ardia muses, eying the stuff. <i>\"But [pc.name], my sweet beta, I've already got swelling balls. What do you want to do with that?\"</i>");
		output("\n\n<i>\"F-fill them up with your cum so I can suck it out?\"</i>");
		output("\n\nShe grins. <i>\"Well, if that's what you want... what kind of alpha would I be if I said no?\"</i>");
	}
	else
	{
		output("\n\n<i>\"Those [ardia.balls] of yours aren't nearly as full and huge as they could be,\"</i> you tell your dzaanish lover. <i>\"How about you let me fix that?\"</i>");
		output("\n\nArdia blinks at the bottle, reaching down to cup her still-plump sack in both hands. <i>\"Y-you want 'em bigger? Seriously?\"</i>");
		output("\n\nOh yeah. And she's going to love every second of it, from the first balls massage to the last orgasm you milk out of her.");
		output("\n\nShe bites her lip, thinking for just a moment more before nodding. <i>\"Okay... if you promise you won't just leave me waddling around with two barrels between my legs. I want you to fuck every drop right back out, you hear?\"</i>");
		output("\n\nThat's a promise easily kept.");
	}
	output("\n\nArdia sighs and steps back starting to pull down the zipper of her jumpsuit. You take the opportunity to empty the container of nutbutter into your hands and rub them together, warming the nanomachine-laced cream up before you start smearing it all over your lover's taut ballsflesh. ");
	output("\n\nWhen you're done, you cut your eyes up to see a vast expanse of naked brown beauty sprawling out on her bed, legs spread and half-hard cock rubbing on her belly. Her [ardia.balls] dangle between her head-crushing thighs, swaying heavily. You know they can be bigger, though -- thanks to her altered biology, there's practically no limit to have absolutely <b>huge</b> you nuts can swell. All you can do is give them a little top off.");
	output("\n\nYou bite your lip to keep from smiling too much while you slip down on your [pc.knees] between her legs, letting your cream-covered hands find their way onto the taut chocolate skin of her sack. Ardia gasps, moaning softly as your fingers start slowly, steadily working all around her balls. ");
	output("\n\nThe sudden sensation of the cream smearing across her ballsflesh sends a shiver up your lover's spine, and her [ardia.cock] throbs against her belly. Pre spills from her crown, pooling " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "between her tits" : "into her belly button") + " and assailing you with the musky aroma of " + (beta ? "your" : "the") + " alpha's arousal. Ohh, that's nice. You lean in and take a whiff, feeling your nerves fire all the way down to your loins; there's no way your [pc.skin] isn't burning red with lust now.");
	output("\n\nYou give her balls a squeeze, massaging the thick brown paste over every inch of Ardia's swollen gonads. Her balls quake and wobble, showing you the pleasure and the building anticipation working through your lover's body: your heart is all aflutter thinking about watching her nuts swell up even larger, growing so heavy and full that she can barely move -- everyone who comes near your beloved Ardia will be able to see how absolutely, explosively pent up she is, ready to unleash the flood at a touch... ");
	output("\n\nThen again, with you around, she's not likely to have that problem very often.");
	output("\n\nYou drink deep of Ardia's scent, nestling your face into the cleavage between her balls as the soft flesh absorbs the drugged cream. She moans sweetly, arching her back off the bed -- and making her dick wobble like a flagpole over your head, splattering your [pc.hair] with a sudden rush of pre. You keep going, sucking and nibbling on " + (beta ? "your alpha" : "the dzaan") + "'s tight balls until you can feel them <b>churning</b> just beneath the surface; her testes are going into overdrive, flooding the sack around them with an abundance of virile, narcotic spooge.");
	output("\n\nIndeed, you can feel her balls start to engorge in your hands, swelling bigger as your dexterous fingers rub more and more sweet cream into her skin. Ardia's thighs tremble, tightening around your [pc.face] while her [ardia.cock] spews obscenely overhead. You feel the constant pitter-patter of discharge hitting your shoulders and drooling down your back -- and that's just the excess, the little drips and dollops that get forced up her iron-hard shaft wholly by accident. ");
	output("\n\nThe real fun hasn't even started.");
	output("\n\nYou finally pry yourself off of Ardia's nuts when they've grown a solid 10% over what they were, swaying heavily from the bedside with liquid weight. Your hands stay firmly attached to those bountiful melons, though, gently kneading the flesh to stimulate her continued production while your mouth ventures upwards.");
	if (beta)
	{
		output("\n\n" + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "It takes a bit of awkward repositioning, but you're soon able to get your [pc.lips] around Ardia's throbbing black horsecock." : "You deftly wrap your [pc.lips] around Ardia's keratin-ribbed pride, whirling the crown with your tongue to clean up the film of salty pre.") + " The alpha's hands gently guide you, slowly but firmly pushing you down on her cock. Her legs clench around your shoulders as you kiss her loins; your throat bulges around her [ardia.cock], and pre flows in a constant stream down your throat.");
		output("\n\n<i>\"That's a good beta,\"</i> Ardia giggles, gently rolling her hips against your mouth. <i>\"Gods, my balls feel so full right now... I don't think I can hold myself back from just blowing it all down your throat. Not that you'd complain, would you?\"</i>");
		output("\n\nNo, no you would not.");
		output("\n\nWith that kind of reward on offer, you instinctively start to move, bobbing your head up and down your mistress's length. Every time you go back down on her, your throat swells with cock and cum, leaving you in a lusty haze until you come back up for air -- and then you just end up seeing your alpha's heaving tits, quaking hypnotically with every breath, and you can't help yourself by slip back down on her length. ");
		output("\n\nAnd again... and again. You keep sucking your alpha's cock, letting your hunger -- your addicted craving -- consume you. Your eyes roll closed and your hands sink into Ardia's soft balls; your brain just turns off, letting instinct and cum-drunk lust take over. You don't stop until her [ardia.cock] is throbbing between your [pc.lips], and the deluge of cum squirting straight into your stomach is getting so thick and intoxicating that you're halfway drunk on your sated addiction already.");
		output("\n\nAnd <b>then</b> she cums. Her massive hips thrust up from the bed, driving her cock straight into the back of your throat. She howls with pleasure, slamming her fat ass down on the bed and back up against as cum rushes up in waves through her dick. You don't even get the luxury of tasting it, of rolling the thick cream around with your [pc.tongue] -- no, this load is going straight down your throat, shooting directly into your stomach. Every drop is like an I.V. of her addictive cream shot straight in your veins, overpowering your senses and leaving your mind a haze of lust. Your body's entirely on autopilot now, sucking as hard as it can while you slump back on your [pc.knees].");
		output("\n\n<i>\"F-f-fuuuuuck,\"</i> Ardia bellows, falling back against the bed. <i>\"Take it, you beta slut! Take it by the gallon!\"</i>");
		output("\n\nYour stomach's certainly swelling with her tanuki-sized load; maybe gallons isn't too much of an overstatement. Whether it's a few drops or a truckload, though, you swallow it all just as eagerly. ");
		output("\n\nShe's almost halfway through her nut before you realize you can't breathe; that your throat's completely sealed by cock and cum. You gag on it for the first time, alerting Ardia to your sudden plight. It takes her a moment to stop laughing before she finally takes your shoulders and pulls you off her rod, letting loose a spray of wasted cum that spatters your [pc.chest]. You gasp for breath -- and then dive down to lap up all the excess drooling from your alpha's slit. ");
		output("\n\n<i>\"Take it easy... there's plenty more where that came from!\"</i> Ardia laughs, patting your head.");
		output("\n\nShe reaches down and hefts up her sack, showing off how full they still are -- noticeably bigger than before you applied the nutbutter, even after her guts-filling orgasm. <i>\"See? You're gonna have you work cut out for you draining these girls, so don't go so hard. I'll always be here for you... and your cravings.\"</i>");
		output("\n\nYour heart flutters, and she knows it; Ardia smiles and leans down to kiss you, wiping away some of the mess from your cheeks. <i>\"Now go take a shower or something. You're a mess!\"</i>");
		ardia.ballFullness += 100;
		ardia.orgasm();
		pc.applyCumSoaked();
	}
	else
	{
		output("\n\nYou crawl up her body and lock lips with the chubby <i>\"alpha,\"</i> letting her taste her own ballsmusk on your [pc.tongue]. She moans throatily, wrapping her arms and thighs around you to hold you against her doughy-soft body. The throb of her [ardia.cock] against your [pc.belly], smearing pre into your [pc.skinFurScales]... you can't help but feel yourself flush with arousal anew.");
		output("\n\nYou break away only reluctantly. Give her a few minutes to let those big, fat balls settle down and you'll be back to fuck her properly.");
		ardia.ballFullness += 100;
	}

	pc.destroyItemByClass(NukiNutbutter);

	if (ardiaInZhengShi()) ardiaMenu();
	else ardiaCrewMenu();
}

public function areYouSureYouWantToBangArdia():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");
	processTime(2);

	output("You're not one to beat around the bush, especially with a beautiful dickgirl sitting in front of you in latex so tight that you can see every vein of her cock and pebble on the rings of her areola. If Ardia's going to be serving on your crew, you'd better get this out of the way.");
	output("\n\nYou flash her your best Steele smile and ask Ardia if she's like to join her captain and get a little hands-on experience with your helm -- if she knows what you mean.");
	output("\n\nArdia snickers, though you see an immediate twitch in her fat bulge at the suggestion. <i>\"Don't you know, you're supposed to wine and dine a girl first, captain! Then again, I think we've been through more together than a dinner date's ever likely to get anybody. Now I'd say something about paying off a debt or whatever, but that would imply you're the only one who'd be enjoying our, uh, hands-on experience.\"</i>");
	output("\n\nThose blue lips of hers purse for a moment while she drinks you in with her eyes, big tits straining the front of her jumpsuit. <i>\"Just one thing, captain... I'd feel awful not mentioning it ahead of time. You know I'm a dzaan. An <b>alpha</b> dzaan.\"</i>");
	output("\n\nShe pats her crotch for emphasis, halfway cupping one of the fist-sized gonads swaddled in its latex bodysheath. <i>\"That means, for almost every species out there... my jizz is incredibly addictive. As in, one creampie and you're hooked. If I bust a nut on your thigh or in a condom, or you get some on your hands after a prone bone, it shouldn't be much more than a quick tingle all over. In the stone age, my ancestors used the addiction to keep huge harems; there's only one or two alphas born for every ten females, after all, but I guess evolution says they needed to keep rivals from stealing their girls. Either way... I just want to warn you that if things get too hectic or intense, there's no way to be a hundred-percent safe. If that doesn't put you off, though...\"</i>");
	output("\n\nShe grins and stands, pinching one of her zippers and starting to slide it down. ");
	output("\n\nIt's a good question, though. Are you willing to risk becoming Ardia's beta for the chance at that thick ass and fat balls?");

	addButton(0, "Hell Yes", function ():void
	{
		clearMenu();
		clearOutput();
		showArdia();
		author("Savin");
		processTime(1);
		output("<i>\"I'll risk it,\"</i> you say, swaggering a little closer to the chunky alpha-babe. She grins and starts running the zipper on her suit all the way down, revealing more and more flawless bronzed skin and heavy curves. You can't help but lick your lips as the full, monumental expanse of Ardia's deep cleavage is revealed, quaking subtly in its latex prison as her arms keep working down and down, all the way to her hefty package. ");
		output("\n\nArdia's cock isn't all that much to look at, by galactic standards, but the haft is ribbed by little keratin nubs, and it bobs above a swinging sack stretched taut around two balls, each individually larger than Ardia's fist. The moment her zipper unleashes them, the pair of them come spilling out of her suit, swaying and slapping her thighs. You can almost <i>hear</i> them churning, full of addictive liquid weight.");
		output("\n\n<i>\"W-well, here I am,\"</i> Ardia smiles, peeling the suit off her shoulders and down her thighs. <i>\"Now wh-\"</i>");
		output("\n\nYou cut her off by taking her cheeks in hand, kissing her fiercely. Ardia's little keratin-coated cock jumps in surprise, a rush of blood flooding it and her cheeks in equal measure.");
		output("\n\nNow... how do you want her?");
		ardiaSexMenu();
	}, undefined, "Hell Yes", "You're willing to risk it for her.");

	addButton(1, "Hell No", function ():void
	{
		clearMenu();
		clearOutput();
		showArdia();
		author("Savin");
		processTime(1);
		output("You take a step back, suddenly enough that Ardia's fingers flinch right off her zipper. <i>\"Thanks for the warning,\"</i> you say. <i>\"Maybe I ought to rethink this then...\"</i>");
		output("\n\n<i>\"Y-yeah,\"</i> Ardia sighs, slumping back into her chair. <i>\"Probably smart. If, you know, you value your independence. I'm not gonna be, you know, offended or anything. I totally get not wanting to sleep with an alpha dzaan, whether you're a top or a bottom. Unfortunately it's really hard to keep up with any kind of suppressant regime here on the frontier; too expensive, too unreliable. So... I guess that's that, then.\"</i>");
		output("\n\nSeems so, for now. If Ardia isn't going to suppress her addictive qualities, perhaps you could find some way to make yourself immune to it?");
		ardiaCrewMenu();
		flags["DONT_WANT_ARDIA_ADDICTION"] = 1;
	}, undefined, "Hell No", "You're not willing to take that risk. Not yet, anyway.");
}

public function timeToBangYourDzaanCrewmate():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");
	processTime(1+rand(3));

	switch (ardiaDomLevel())
	{
		default: case 0:
			output("You sidle up to the chunky dzaan and suggest that as beautiful as she is, she'd look a lot better out of that jumper and on the bed.");
			output("\n\n<i>\"Think so, huh?\"</i> Ardia grins, pushing her shoulders together in a way that makes her huge tits swell up even larger under her suit, straining the latex so much that you're afraid it's going to split down the center. Before it can, you step up and grab the zipper, yanking it down around her melons. The second all of that glorious bronze cleavage is exposed, Ardia hooks her arms around you and pulls you in, mashing your [pc.face] straight between her tits. You're buried in sweaty, jiggly boobsflesh, and when she shakes her shoulders, the mountainous mammaries slap your cheeks.");
			output("\n\nBefore you end up completely trapped in there, you grab Ardia's ass in both hands, squeezing until she gasps -- and her cock slaps your thigh through her pants, ready to burst out from its latex prison. You'd best free it, huh? You work your hands around her inhumanly thick thighs, squeezing and groping until you get to her crotch and find her zipper again. One good yank brings it down enough for her [ardia.cock] to slip out, but it takes a couple good yanks to free her [ardia.balls], letting them swing out and slap your thighs.");
			output("\n\nThe rest of her [ardia.armor] comes off easily enough, but only when your lover kicks the bunched latex away and steps back are you finally able to come up for air from between her succulent tits.");
			output("\n\nShe reaches down and wraps a hand around her [ardia.cock], stroking slowly while she catches her breath.");
			output("\n\nLooks like you've got the initiative.");
			break;
		case 1: case 2: case 3:
			output("You sidle up to the big beautiful alpha-amazon and suggest that as beautiful as she is, she'd look a lot better out of that jumper and on top of you.");
			output("\n\n<i>\"Funny, I was just thinking the same thing!\"</i> she giggles. <i>\"You do all the dangerous stuff out there, the least I can do is make it so you don't have to worry about anything when you get back. Come to momma, [pc.name]. Let me take good care of you.\"</i>");
			output("\n\nYou hardly need her to offer twice. Ardia takes her zipper in hand and slides it down, pushing her shoulders together to create an incredible depth of cleavage as more and more flawless brown flesh comes into view. She crooks a finger, and that's all the invitation you need to come over and plant your face in your lover's breasts, motorboating the vast valley between her boobs as she works her zipper further and further down. ");
			output("\n\n<i>\"You really love 'em, don't you?\"</i> Ardia laughs. You feel her dick pressing against you as she holds you close, and you quickly work to free the craving-sating tool, letting all that cockflesh spill out into your hands. Her [ardia.balls] wiggle out a few moments later, slapping her thighs heavily. All that liquid weight inside sways and bounces, ready to come pouring out at a moment's notice. ");
			output("\n\nFinally, Ardia peels the rest of her jumpsuit off and kicks it aside, leaving her bare and erect, pressed up against your body. <i>\"Okay, captain... how do you want it?\"</i>");
			break;
		case 4: case 5: case 6:
			output("You give your big beautiful alpha a demure smile and ask if there's anything you could do to service her. You can practically <b>smell</b> how pent up she is, and it's your duty as her beta to relieve all the tension from her [ardia.balls], after all.");
			output("\n\n<i>\"Well, aren't you attentive!\"</i> Ardia chuckles. <i>\"How am I ever supposed to expand my harem when I have a perfect beta like you tending to my every whim, hmm? Are you trying to keep me all to yourself?\"</i>");
			output("\n\nYou don't need to answer, but instead slip down on your [pc.knees] in front of your mistress and nuzzle into her silky-soft thigh. One good inhalation and your heart starts hammering in your chest, sniffing out your alpha's intoxicating aroma even through all that shiny latex wrapping her plush figure. Ardia sighs softly and " + (pc.hasHair() ? "musses your hair" : "pats your head") + "... and then her hand's slipping from your scalp to the zipper around her crotch, running it along its track. The arousing aroma redoubles the moment the zipper opens, and it takes a force of will not to just dive into your alpha's fly to fish out that majestic life-giving member of hers. ");
			output("\n\nInstead, you wait like a good beta, watching awe as your mistress slowly peels herself out of her latex uniform. First she bares those titanic mounds on her chest, letting the shadows fall over you. ");
			output("\n\n<i>\"You still love these, don't you?\"</i> you murmurs, bouncing on the balls of her feet to make her breasts bounce. They clap heavily against her chest, but you can barely peel your eyes off her package to appreciate the jiggling display. <i>\"I used to think my tits were my best assets, but now... now I'm starting realize what really makes me special. What makes me an <b>alpha</b>.\"</i>");
			output("\n\nShe grins and pats her crotch, starting to work the zipper there again, all the way around her cock. Your mouth is open and waiting for her [ardia.cock] when she finally allows it to spill out, smacking heavily against your [pc.lips]. Her [ardia.balls] falls into your waiting hands a moment later, and you eagerly run your tongue from her crown to the cleavage between your alpha's heavy gonads, sucking and kissing every inch of flawless bronze flesh.");
			output("\n\n<i>\"Ohhh, such a good beta,\"</i> she coos. <i>\"All you can think about is getting your fix, huh? Poor thing.\"</i>");
			output("\n\nShe shrugs out of the last of her clothing, leaving her body bare and glistening, begging for your touch... and her cock slips from your lips, dangling down between her thick thighs. <i>\"So... how are you going to serve your alpha, hmm?\"</i>");
			break;
		case 7: case 8: case 9: case 10:
			output("You fall to your [pc.knees] in front of your beloved mistress, nuzzling your [pc.face] into her succulent package. Your arms instantly wrap around her broad flanks, holding your alpha tight. ");
			output("\n\n<i>\"Aww, sweet little beta,\"</i> Ardia coos, patting your head. <i>\"Do you need momma to give you your fix? Or has my cock been out of your mouth so long you just can't stand it?\"</i>");
			output("\n\nIs there a difference? Does it matter? All you know is that you desperately crave your mistress's [ardia.cock] deep inside you. Pathetically, you paw at the front of her jumper, telling her wordlessly exactly what you want. Of course, your benevolent, beloved alpha is willing to feed your hunger. She quickly undoes the zipper around your crotch, letting that majestic member of hers slip out from its latex prison and directly into your waiting mouth. You bob your head straight down her length before she's even half-hard, cupping her [ardia.balls] in both hands and massaging those precious cum-factories while you suckle on their shaft. ");
			output("\n\n<i>\"So hungry! Good!\"</i> Ardia croons. Her voice has grown a little fiercer, though, and as her hands settle on your shoulders, you know you've set fire to her lusts. <i>\"Let me help you get it all.\"</i>");
			output("\n\nThe busty amazon shoves you down on your back, forcing you to bear all her weight as she sits down hard on your [pc.chest] and thrusts her [ardia.cock] straight down your throat. You gag and gasp for the air she's just knocked out of you, but your alpha just grins and grabs her tits, starting to free them from their latex restraints. <i>\"Come on, beta bitch. Get your fill of my seed. If you make me cum before I can finish undressing, maybe I'll even fuck you, too. Would you like that?\"</i>");
			output("\n\nYou nod desperately around your mouthful of alpha-dick and go to work. You suck, kiss, lick, and bob, using every tool at your disposal to worship your mistress's cock. She takes her time slowly working her zippers down between her hefty tits, freeing them from their latex prisons. They come out with a heavy bounce, swaying and clapping together as your alpha shakes her shoulders out of the uniform. ");
			output("\n\nBy the time she's bunched her latex up around her waist, starting to shake her hips free of it, you can feel Ardia's [ardia.cock] throbbing between your [pc.lips]. All you can do is work yourself up and down her length, battering the back of your throat with the crown her of cock, while the chunky amazon finally manages to work her latex uniform around her inhumanly broad hips and down her trunk-like thighs. ");
			output("\n\nFinally, Ardia has to lift her legs to get the garment down past her knees -- and in so doing, she perforce has to thrust deep down your throat. In that moment, you've got so much more muscle to work with, forming a perfect glove around every inch of cock your beloved alpha feeds you. You clench as hard as possible, squeezing her dick as it drags through your gullet -- and it leaves Ardia twitching and gasping by the time she's freed her first leg.");
			output("\n\n<i>\"O-okay, beta. Getting real close now. Can you earn yourself a fuck?\"</i>");
			output("\n\nYou answer by bracing, focusing yourself as Ardia hikes her leg and thrusts in again. Every muscle works in concert to milk her, rippling all the way from her crown to your [pc.lips] and squeezing her like a wet silken glove. Your alpha moans, pumping her hips against your mouth hard enough to make you see stars -- and to make her [ardia.balls] fall into the gulf of your neck, pressing your throat down around her cock with their liquid weight. ");
			output("\n\nAnd that weight is starting to move, churning as you suck Ardia's cock as hard as you can. Just as she's about to free her last foot and deprive you of your fix, you close your eyes and put your back into it, ravishing her pride until your alpha's crying out your name, and you can feel her dick swelling between your lips. ");
			output("\n\nYou don't even get to taste her orgasm, because it shoots straight down your throat and into your waiting stomach. Ardia's thigh thighs clench around you, and her hips piston down to drive herself balls-deep between your lips. Even bypassing your mouth entirely, her orgasm still sets off a chain reaction of addicted bliss all throughout your body; everything goes tingly as warmth spreads from your belly to your extremities, potent enough to make your vision swim for a moment. You'd stopped thinking a long time ago, and your mind remains a blank haze as your alpha's [ardia.cock] oozes its fat wad directly down your throat.");
			output("\n\nArdia pulls out with a wet grinding sound, slapping her crown on your cheek to dry it. <i>\"Oh yeah,\"</i> she groans, grabbing your shoulders and pulling you up. <i>\"That's got me started alright. Consider this fuck well-earned!\"</i>");
			if (flags["ARDIA_CHOICE"] != undefined) ardiaSexMenu();
			else addButton(0, "Next", ardiaChoosesTheSexiness);
			return;
	}

	ardiaSexMenu();
}

public function ardiaSexMenu():void
{
	var domArdia:Boolean = ardiaDomLevel() > 3;

	addButton(0, "Blow Her", succSomeArdiaDong, undefined, "Blow Her", "Get your lips wrapped around that big, fat " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "equine" : "dzaan") + " cock and suck 'till you get what you need.");
	if (domArdia)
	{
		addButton(1, "Get Plowed", buttsAndArdiasGalore, undefined, "Get Plowed", "Let Ardia shove you down and plow your asshole.");
		addButton(8, "Ride Her Dick", vaginaRouter, [rideArdiaLikeAHorseOrSomething, ardia.cockVolume(0), 1, 0], "Ride Her Dick", "Ardia's dick always looks so hot, hanging between those thick thighs and backed by her hefty balls, but those huge tits are just so snuggleable... how can you choose! But what if you could get her cock inside you <b>and</b> get your hands all over those boobs?");
	}
	else addButton(1, "Prone Bone", penisRouter, [ardiaOnTheGroundReadyToGetPound, pc.biggestCockVolume() + 1, false, 0], "Prone Bone", "Put Ardia on her stomach and rail her juicy ass as deep as you can!");
	if (!pc.hasCock()) addDisabledButton(2, "Rvs Cowgirl", "Reverse Cowgirl", "You'd need something that Ardia can ride!");
	else addButton(2, "Rvs Cowgirl", gettingRiddenByArdia, rand(pc.cocks.length), "Reverse Cowgirl", "Ask Ardia to crush your pelvis and drain your [pc.balls] with that ass.");
	addButton(3, "Get Titfuck", penisRouter, [doinSomeDzaanTiddies, pc.biggestCockVolume() + 1, false, 0], "Get Titfuck", "Ask Ardia to wrap those pillowy jugs around your dick.");
	addButton(4, "Get Missionary", ardiaShutsTheLightForProcreation, rand(pc.vaginas.length+1)-1, "Get Missionary", "Snuggle into Ardia's bed, spread your [pc.legs] for her, and let your thick-as-a-brick alpha fuck you full of her intoxicating semen.");
	addButton(5, "Rim Her", nomSumArdiaButt, undefined, "Rim Her", "Lick and kiss Ardia's " + (ardia.hasPlumpAsshole() ? (ardia.ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED) ? "plump, " : "") + "sensitive" : "dark") + " chocolate asshole.");
	addButton(6, "Ball Worship", succSomeArdiaNuts, undefined, "Ball Worship", (domArdia ? "Polishing your alpha-to-be's ballsack should remind her of what you are, and what you're going to be to her." : "A dzaan alpha's nutsack is a sex-organ on par with her cock. Show Ardia just how good you are at appreciating it."));
	addButton(7, "Facesitting", areYouPCEnoughToBeArdiasChair, undefined, "Facesitting", (ardiaDomLevel() < 4 ? "The savory crescent of Ardia's dusky pussy is tucked away behind her balls and between her thighs. If you want a taste of it, then getting <b><i>under<i></b> the thickness would be more prudent than getting down with it." : "Your beauteous alpha's soft pussy needs as much attention as her male side does. She'll enjoy it. Besides, it's not like you won't be sucking her nuts while you're under there."));
}

public function ardiaChoosesTheSexiness():void
{
	if (rand(6) < 2) RandomInCollection(ardiaShutsTheLightForProcreation, rideArdiaLikeAHorseOrSomething)(rand(pc.vaginas.length+1)-1);
	else RandomInCollection(buttsAndArdiasGalore, succSomeArdiaNuts, succSomeArdiaDong, nomSumArdiaButt, areYouPCEnoughToBeArdiasChair)();
}

public function succSomeArdiaDong():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Wsan");
	processTime(20+rand(36));

	if (ardiaDomLevel() < 4)
	{
		output("<i>\"I think you need some release, there,\"</i> you say, eyeing Ardia's " + (ardia.hasPerk("'Nuki Nuts") ? "plump, juicy" : "enormous spunk-filled") + " balls. <i>\"Just sit on the edge of the bed and let me handle everything, okay?\"</i>");
		output("\n\n<i>\"Uh, uh huh,\"</i> Ardia murmurs, seating herself and spreading her legs. <i>\"Thanks, [pc.name]. You're the best.\"</i>");
		output("\n\n<i>\"Can't let my favorite little alpha go with her needs unmet,\"</i> you say, grinning as you kneel before her. A gentle touch to her thick thighs and she's spreading them for you, unveiling the wonderful sight that lies between them.");
		output("\n\nYour mouth is watering even before the pheromones hit your nose. The sight of her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "enormous she-stallion" : "thick, keratin-covered alpha") + " cock, already engorged and pulsing while the excitement of anticipation drives her onwards to a full erection before you've even touched her, is delightful. The lustful scent of her obvious arousal is every bit as titillating as watching her fat prick pumping with blood, ready to fuck whichever of her mates she deigns to offer it to.");
		output("\n\nOf course, the dynamic between you and her is a little different -- " + (ardiaDomLevel() < 2 ? "and that's just how you like it." : "though you've been considering otherwise.") + " Ardia is <i>yours</i>, and this big, beautiful studcock of hers is for you to service for fun. The noisy moans she makes and the jiggles of her fertile body are a nice cherry on top. Even now she's looking down at you with hopefulness written all over her pretty face, and that's just too cute to pass up.");
		output("\n\n<i>\"Aaah,\"</i> Ardia sings when your [pc.lips] make lingering contact with the underside of her swollen, veiny shaft, stroking against her intimidating cumvein. <i>\"Mmm.\"</i>");
		output("\n\nYou plant kisses along the length of her rock-hard dick until you reach the tip and let your [pc.tongue] loll from your slutty mouth, wrapping it around the " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "flared head of her equine cock" : "swollen head of her pride") + " and giving her a soft, loving suck. Ardia trembles and lets out a gasp of longing right before you slip back downwards, towards her " + (ardia.hasPerk("'Nuki Nuts") ? (ardiaHugeBalls() ? "gargantuan nuts, each bigger than your head" : "outrageously oversized gonads") : "bulging balls") + ". Her disappointment is palpable -- but she gets over it very quickly when you begin to suck on the warm, sweaty orbs hanging there.");
		output("\n\nThey shift and flex in her");
		if (ardia.hasPerk("'Nuki Nuts"))
		{
			output(" gigantic sack, her pheromones washing over you as you play with them.");
			if (flags["USED_SNAKEBYTE"] != undefined)
			{
				output("\n\nOnly the miracle of Snakebyte allows you to do what you do next. Ardia lets out a loud, horny groan of relief as your jaw stretches wide around her massive gonads and one of them slips into your mouth, receiving a suckling she couldn't get anywhere else.");
				output("\n\n<i>\"Oh, <b>god</b>, [pc.name]!\"</i> Ardia grunts. <i>\"Mmmngh!\"</i>");
				output("\n\nYou relish in her reactions, reaching up to stroke her stiff, throbbing " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "horse" : "dzaan") + "cock while you concentrate the whole of your attentions on taking Ardia's overfull balls. Your thorough tongue cleans her of the lust-tainted sweat her body exudes, lapping it up straight from her nutsack and then popping her other impossibly large testicle into your mouth to ensure total coverage. Soon enough she's panting so hard she's almost whining in need, fresh sweat breaking out across her body anew while she clutches at the sheets in desperate need./else: Without the option to suck her into your mouth owing to her impossible size, you do the next best thing -- clean every single last drop of her sweat off her flexing nutsack with your soft, loving tongue. She shivers in appreciation when you start in on her, fingers clutching at the sheets while you lick up every droplet of the pheromone-tainted lust elixir her body exudes.");
				output("\n\n<i>\"Oh, ooohhh,\"</i> Ardia moans, her head tilting upwards in joy. " + (flags["SEXED_ARDIA_SUCK"] == undefined ? "<i>\"Oh, I've <b>never</b> been treated like this…\"</i>" : "<i>\"Oh, Steele, that's <b>wonderful</b>...\"</i>"));
				output("\n\nYou'd just wanted to tease her a little but now that you're down here, you don't mind staying for a while. Your hands come up to stroke her stiff, throbbing {dzaancock/horsecock} while you concentrate the whole of your attentions on servicing her, running your tongue up the sensitive skin between her absurdly large balls and drinking in her adorable, lustful grunts and moans. Soon enough she's almost whining with need, desperate to blow her load.");
			}
		}
		else
		{
			output(" smooth, taut sack, each testicle permeating your tongue with her warmth as you play with them. They're so incredibly suckable you just can't help yourself -- stretching your jaw wide you take one between your lips and let it roll into your mouth, gently massaging her with your tongue and the insides of your cheeks. She tastes so good you can scarcely believe it.");
			output("\n\n<i>\"Oh, ooohhh,\"</i> Ardia moans, her head tilting upwards in joy. " + (flags["SEXED_ARDIA_SUCK"] == undefined ? "<i>\"Oh, I've <b>never</b> been treated like this…\"</i>" : "<i>\"Oh, Steele, that's <b>wonderful</b>...\"</i>"));
			output("\n\nYou'd just wanted to tease her a little but now that you're down here, you don't mind staying for a while. Your hands come up to stroke the stiff, throbbing " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "horse" : "dzaan") + "cock while you concentrate the whole of your attentions on taking Ardia's overfull balls, sucking one of them into your mouth and gleaning every last pheromone-tainted droplet of sweat from her shiny skin. Soon you've got her panting so hard she's sweating anew, a fresh sheen of slickness breaking out across her skin, and she's clutching the sheets in needy desperation.");
		}
		output("\n\n<i>\"P-please, [pc.name],\"</i> she moans, clenching her butt so hard she almost rises off the bed. <i>\"I c-can't take much m-more of- uh! Of what you're doing to me!\"</i>");
		output("\n\n<i>\"Hmmhh, fine,\"</i> you murmur, smiling up at her as you pop her nuts free of your mouth, dripping with warm saliva. <i>\"Let's see.\"</i>");
		output("\n\nWhat you find at the tip of her rigid cock is testament to just how much she's been enjoying your efforts. A nice dollop of translucent precum gleams at her cockhole, an excess of it beginning to drip down her underside. You put a stop to that with your sweeping tongue, watching Ardia shudder in relief as you address her immediate concerns. Seeing her respond to your touch is always so cute and endearing but what you really want to see on her face now is the expression of ecstasy she makes when she cums, and cums <i>hard</i>.");
		output("\n\n<i>\"Okay, Ardia,\"</i> you breathe, carefully licking away the drop of precum at her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "flared head." : "swollen tip.") + (ardia.hasPerk("'Nuki Nuts") ? (ardiaHugeBalls() ? "<i>\"Lean back and think about how good it's going to feel letting out every last thick drop of seed in those enormous balls of yours right down my tight little throat.\"</i>" : "<i>\"Lean back and think about blowing those big, thick loads right down my tight little throat.\"</i>") : "<i>\"Lean back and think about nutting right down my tight little throat.\"</i>"));
		if (flags["USED_SNAKEBYTE"] != undefined) output("\n\nYou open your mouth as wide as you can and dive down her" + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? " stellar" : "") + " length, your earlier efforts at lubrication ensuring you slide right down her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "giant equine cock. Your sensitive throat traces over each and every criss-crossed vein of her thick, hard shaft until you've got her so tightly sheathed within you can feel her heartbeat pounding in your ears." : "pulsating cock. Its usual juicy plumpness is all but gone and in its place is a hard, straining pole that oh-so-badly needs to <i>cum</i>, so tightly sheathed within your sensitive throat you can feel every last detail of it right down to the beat of Ardia's heart.") + " Ardia's voice rises an octave or two and you grin to yourself, knowing just how incredibly satisfying this is going to be for her.");
		output("\n\nRather than crudely sinking yourself between her shaking thighs over and over, though, you <i>work</i> her into it. There's no sense in not making use of the carnal techniques available to you when your throat is so sensually gifted, after all. After ten seconds of hot, tight massaging with her cock buried in your throat Ardia is almost screaming in bliss on every exhale and after twenty, she goes silent as her mouth stretches open and her wide hips rise off the bed.");
		output("\n\n" + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "The moment you feel her meaty flare thickening inside the depths of your throat, you push her down and plant your lips against her groin right as her cumvein begins to throb. Perfect timing. It thrums" : "You push her down and <b>now</b> you drop yourself until she's balls-deep between your lips, and that's when you feel it. Perfect timing. Her cumvein begins to throb and pound") + " against your tongue as untold amounts of alpha semen begins to warm your insides, a lazy smile settling across your features while you keep up the squeezing and milking while she blows her load.");
		output("\n\n<i>\"-- hh -- Oh, FUCK-\"</i> Ardia gasps haltingly, fingers splayed against the bed and trying to push herself up into you while you keep her fixed in place. <i>\"Hh- nnnnnnnhhhhh! Nnngggh!\"</i>");
		output("\n\nStars, it's so <i>thick</i>! You reach down to grab her twitching balls and rub them, stoking her to even further heights as she throws her head back and lets out a long, high-pitched scream of ecstasy and release. <i>Streams</i> of virile dzaan spunk jet into your stomach, your reddened cheeks hollowing as you suck load after slick load from her wildly throbbing cock, your throat coiling around her from base to tip.");
		output("\n\n<i>\"Oooohhhh, god! You're milking me!\"</i> Ardia cries out, her entire body shaking in orgasmic delight. <i>\"Uh! Fffuh! I c-can't stop cuh- cumming!\"</i>");
		if (ardiaHugeBalls())
		{
			output("\n\nAnd thanks to the nutbutter, she's not about to stop any time soon. You gleefully suck and constrict around her bulging, throbbing cock as it spews hot seed down your gullet and listen to her howl in pleasure, mattress creaking beneath her as she cums her brains out. Your stomach begins to round and sag with the sheer amount of dzaan sperm it's taking on, the excess sloshing inside you until you look positively pregnant.");
			output("\n\nThere's so much of it you don't even really need to try. With your lips laid at her groin in a gentle kiss, you slightly relax your throat and squeeze around her swollen, gushing " +  (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "flare" : "cockhead") + " as the river of hot jizz spills into you. Your hands cup and stroke her enormous, overproductive balls, gently stroking her as if to reward her for a job well done.");
			output("\n\nBy the time she finishes you've taken on what feels like twenty pounds of Ardia's semen, all tightly contained in your overtaxed stomach. You give her a last affectionate squeeze and pull yourself off the end of her cock with your throat held tight, squeezing out any last droplets and leaving her flopping length coated in saliva but otherwise totally clean. She immediately falls backwards onto the bed, panting and covered in sweat.");
		}
		else if (ardia.hasPerk("'Nuki Nuts"))
		{
			output("\n\nAnd thanks to the nutbutter, she's not about to stop any time soon. You gleefully suck and constrict around her bulging, throbbing cock as it spews hot seed down your gullet and listen to her howl in pleasure, mattress creaking beneath her as she cums her brains out. Your stomach begins to round and sag with the sheer amount of dzaan sperm it's taking on, the excess sloshing inside you until you look positively pregnant.");
			output("\n\nArdia's thick thighs close in on your head and squeeze while she groans in utter bliss, her giant balls flexing and shaking against your chin with every massive ejaculation. You can hardly believe just how much of her there is -- nutbutter or not, she clearly has a natural aptitude for this. That fat, sweaty sack resting against your face has more than enough spunk in it to feed a couple of betas, that's for sure.");
			output("\n\nBy the time she finishes you've taken on what feels like several pounds of Ardia's semen, all tightly contained in your overtaxed stomach. You give her a last affectionate squeeze and pull yourself off the end of her cock with your throat held tight, squeezing out any last droplets and leaving her flopping length coated in saliva but otherwise totally clean. She immediately falls backwards onto the bed, panting and covered in sweat.");
		}
		else output("\n\nYou swallow down every sticky rope of her warm spunk, feeling it settle in your stomach as it's washed down by ever more sperm, splattering down the back of your throat until, at last, she runs dry. You give her a last affectionate squeeze and pull yourself off the end of her cock with your throat held tight, squeezing out any last droplets and leaving her flopping length coated in saliva but otherwise totally clean. She immediately falls backwards onto the bed, panting and covered in sweat.");		
		output("\n\n<i>\"Ooohhh…\"</i> she moans, putting her arm across her eyes. <i>\"Fuuuck…\"</i>");
		output("\n\n<i>\"Mmm,\"</i> you purr, licking your lips and standing" + (ardia.hasPerk("'Nuki Nuts") ? " with one hand on your swollen stomach. <i>\"Just <b>look</b> what you did to me, you sexy thing.\"</i>" : ". <i>\"You taste every bit as delicious as you look.\"</i>"));
		output("\n\n<i>\"[pc.name]...\"</i> Ardia sighs weakly, holding her arms out as if to embrace you.");
		output("\n\nYou climb atop her and lie down, putting your head next to hers and snuggling as her hands come to rest on your back. She's so nice and warm and soft.");
		output("\n\n<i>\"That was quite the 'release',\"</i> you tease her, rubbing the back of her head.");
		output("\n\n<i>\"God, that was <b>amazing</b>,\"</i> she murmurs, nuzzling into you. <i>\"My head just went white and I couldn't stop cumming… mm. Thanks, [pc.name].\"</i>");
		output("\n\n<i>\"Don't worry,\"</i> you say, settling in for a nap against her. <i>\"We'll do it again soon.\"</i>");
		output("\n\n<i>\"Mmm, looking forward to it already,\"</i> she whispers, and then she's asleep. You suppose the exertion must've taken a lot out of her -- Ardia's not really the type for strenuous physical activity, after all. Leaving her future betas hungry isn't going to be a concern, though. You can already tell.");
		output("\n\nYou carefully extricate yourself from the sprawl of your lover's limbs and slip out of bed an hour later, a little more rested and a little less full.");

		pc.lust(20+pc.libido()/10);
	}
	else if (ardiaDomLevel() < 7)
	{
		output("<i>\"I want something to drink,\"</i> you say, gaze wholly fixated on her plump, juicy balls and the thick length hanging above them. <i>\"Mind if I help myself to some alpha cum?\"</i>");
		output("\n\n<i>\"Oh, be my guest,\"</i> Ardia says, grinning as she lies back on the bed and crooks a finger at you. <i>\"Come here, [pc.name]. Get a nice taste of my nuts.\"</i>");
		output("\n\nYou crawl towards her and lay top her wonderfully smooth legs, resting your cheek against her " + (ardia.hasPerk("'Nuki Nuts") ? (ardiaHugeBalls() ? "enormous ballsack" : "oversized ballsack") : "warm, bulging ballsack") + " before turning and giving her a long, hard lick from bottom to top.");
		output("\n\n<i>\"Mmmmmh, that's right,\"</i> she sighs, placing a hand on your head. She doesn't exert any force because she knows she doesn't need to. <i>\"Good [pc.boyGirl], keep going.\"</i>");
		output("\n\nSoon, though, your insatiable hunger for hot alpha sperm drives you to start suckling at the base of Ardia's " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "immense horsecock" : "fat dzaan cock") + " as she smiles down at you knowingly, " + (pc.hasHair() ? "ruffling your [pc.hair]" : "rubbing your scalp") + ". She bites her lip and moans as you draw closer and closer to her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "big, fat flare" : "swollen cockhead") + ", already drooling precum, your [pc.tongue] lashing against her firm cumvein as if to pay respects before it's thrumming between your [pc.lips].");
		output("\n\n<i>\"Ohohh, god, [pc.name],\"</i> Ardia groans, her voluptuous breasts bouncing as she leans back into her soft pillows. <i>\"You really know how to work a cock with that tongue of yours.\"</i>");
		output("\n\n<i>\"Thanks,\"</i> you say with a feral grin, <i>\"but I haven't shown you anything yet, <b>alpha</b>.\"</i>");
		output("\n\nClosing your eyes, you open your jaw until your lips stretch around her head and let your tongue caress the underside of her sensitive glans, sucking gently as you work your way down her shaft. " + (flags["USED_SNAKEBYTE"] != undefined ? "You've got so many nice oral tricks to show her with your enhanced throat, you might as well take your time and spread them out." : "You've got so much time to spend together, after all -- you might as well go slow.") + " The violent shudder that runs through Ardia's body and the deep moan that spills from her lips is all the incentive you need to keep going.");
		output("\n\n" + (flags["USED_SNAKEBYTE"] != undefined ? "Taking her proud " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "stallionhood" : "manhood") + " deeper is effortless, though the pleasure it gives your alpha when you tighten up on her is immeasurable." : "You suck her proud " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "stallionhood" : "manhood") + " as deep as you can, watching her reaction and shivering in delight.") + " The way she arches her back and squeezes her deliciously hard nipples between her fingers as you suck her off is intoxicating, and even without any real conscious effort on your part you soon find yourself doing your utmost to bring her to the height of ecstasy. For some reason, you just <b>need</b> to see her cum as hard as she fucking can.");
		output("\n\nTo that end, you perform for her. " + (flags["USED_SNAKEBYTE"] != undefined ? "Sucking " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "on her medial ring while the depths of your throat coil around and massage her saliva-covered cockhead before you thrust yourself all the way into her groin," : "at the base of her cock while you massage her saliva-covered cockhead before") + " mashing your nose against her soft caramel skin and letting your gullet undulate down her turgid length until you can feel the heat of precum dribbling and spurting from her tip. Glancing up at her from between her juicy thighs" : "You blow her as hard as you can, the descent of your stroking hand followed by your stretched-wide lips until you're working her hands-free, diving down to her balls to suck at her. Glancing upwards") + " you see her gazing down at you with reddened cheeks and lust upon her pretty lips; fuck, she's so <i>pretty</i> -- you want to see that gorgeous face twisted into the bliss of orgasm, to feel her incredible release.");
		output("\n\nYour hands naturally drift downwards to start stroking her flawless nuts while you facefuck yourself, getting her balls-deep into your gullet " + (flags["USED_SNAKEBYTE"] != undefined ? "and squeezing your throat around her sensitive head before tightening up and" : "before") + " dragging yourself <i>aaaall</i> the way back to the top. Ardia's loving it. Her back arches fiercely with every thrust, sweat breaking out across her bodacious body, and eventually you push her past a mental tipping point.");
		output("\n\n<i>\"Okay,\"</i> she gasps, panting as she takes ahold of your head with both hands. <i>\"I have to cum <b>now</b>.\"</i>");
		output("\n\nThen she's doing it all herself, rolling her broad hips across the bed and moaning out loud as she fucks your gullet, unable to hold herself back. Somewhere inside of you a deep, dark satisfaction settles over your consciousness and you mentally take a back seat, allowing this studly alpha specimen to utterly ravage you with her rock-hard penis. It feels so <i>right</i> for her to be doing so.");
		output("\n\nHer labored panting grows louder and more desperate, taking on another tone altogether -- she's <i>dominating</i> you, holding you down longer and making you drink her deeper with every thrust until she starts to throb between your lips. " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "Her plump cockhead begins to flare, pumping with blood until it feels so wide you're not sure she'll even be able to pull it out of you" : "Her swollen cockhead is dribbling so much precum the back of your throat is coated in it, and those giant balls of hers only promise more") + ". You can hardly wait.");
		output("\n\n<i>\"Oh, fuck! FUCK!\"</i> Ardia howls, slamming her hips into you and holding you at her groin. <i>\"Nnnggghhh!\"</i>");
		output("\n\nAn energetic stream of spunk courses down your throat as you " + (flags["USED_SNAKEBYTE"] != undefined ? "expertly milk it out of her, contracting your throat around the base of her cock and wringing it all the way to the tip buried deep inside. She screams in utter bliss with every ejaculation, shuddering and scratching at the mattress as she forcefully empties her quaking balls right into your stomach courtesy of your impressively modified biology." : "swallow it down, doing your best to time it and hasten the arrival of your alpha's seed. She groans in ecstasy with every ejaculation, shivering as she empties her jiggling nuts right into your stomach.") + " Right as another geyser of spunk jets into the growing pool of it in the pit of your tummy, you gaze up at her face.");
		output("\n\nShe's the picture of femininity. Twisted in beautiful agony and covered in a thin sheen of sweat, Ardia's countenance right now makes you feel like you've achieved your ultimate goal. She bites down on her bottom lip as yet another hefty load spurts down the length of her beastly cock, splattering against the back of your beta throat and dripping downwards.");
		output("\n\nYou stay there and hold her, hands firmly planted on her thighs and her dick embedded deeply in your throat, until you're absolutely certain she's done cumming. Even then, you stay down and suck on her until she groans and gently pries you off, leaving you drooling and panting at her waist.");
		output("\n\n<i>\"Oh, [pc.name],\"</i> she says, smiling. <i>\"What's the matter, didn't get enough alpha cum the first time?\"</i>");
		output("\n\n<i>\"It's… it tastes good,\"</i> you murmur, gazing up at her. Was she <i>always</i> this beautiful? <i>\"Thank you, alpha.\"</i>");
		output("\n\nShe blinks. <i>\"No problem. You know I'm always here for you, [pc.name].\"</i>");
		output("\n\n<i>\"Uh huh,\"</i> you say, smiling wide. <i>\"I'm going to take a rest…\"</i>");
		output("\n\n<i>\"Okay,\"</i> Ardia replies, reaching out and dabbing the bedsheet at your lips to clean you off before she gives you a smile. <i>\"Have a good sleep, cutie. Oh, and uh, watch the extra weight. Trust me, I know.\"</i>");
		output("\n\nYou somehow drag yourself back to your room with your tummy unbelievably swollen courtesy of Ardia's sperm, still warm and reminding you of just how good she tasted. Even now her scent lingers on your breath, and you can't help but notice just how horny that's making you... maybe if you get some sleep it'll go away on its own.");
		//leave player with high lust
		pc.lust(60+pc.libido()/4);
	}
	else if (ardiaDomLevel() < 10)
	{
		output("<i>\"Can I,\"</i> you start, glancing nervously at the outline of Ardia's dick through her suit, <i>\"can I suck your cock?\"</i>");
		output("\n\n<i>\"Sure you can,\"</i> Ardia replies with a grin. <i>\"Come lie down, [pc.name]. Let's put those pretty dicksucking lips of yours to the test.\"</i>");
		output("\n\nYou climb onto Ardia's bed with her and let the fluffy domme position you above her, sitting on her curvaceous chest with your [pc.thighs] to either side of her body and staring down at the delicious-looking " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "horsecock hanging from her sheath" : "dzaan cock between her legs") + ". Fuck, your mouth is watering already -- too slow to wipe it away in time, you let some drool run from the corner of your mouth and spatter onto her thickening length. Ardia snickers quietly.");
		output("\n\n<i>\"What's the matter, [pc.name]?\"</i> she teases you gently, lifting her hips up until the pheromonal musk surrounding her alpha cock makes your eyes roll back in your head. <i>\"See something you liiiike?\"</i>");
		output("\n\n<i>\"Uh-a-alpha…\"</i> you groan, feeling every bit like a pet on a leash. You don't dare to beg for it, but you communicate the wish all the same.");
		output("\n\n<i>\"Aww. Maybe I'm being too mean,\"</i> Ardia says, reaching down and patting your head. Then she places her free hand at the other side of your head, and suddenly you find yourself positioned directly above her thickly erect meat. <i>\"Open up, beta!\"</i>");
		output("\n\nYou stretch your jaw as far as it'll go and almost collapse in relief as you feel the");
		if (ardia.hasCock(GLOBAL.TYPE_EQUINE)) output(" flared");
		output(" head of your alpha's penis touching then penetrating your [pc.lips], spreading them wide around its rock-hard surface. Your [pc.tongue] instinctively begins to worship the underside as you let out a deep groan of contentment, treasuring what's to come.");
		output("\n\n<i>\"There you go, good <b>[pc.boyGirl]</b>,\"</i> she murmurs firmly, stroking your head. <i>\"Take it all in, there you go. Remember, good betas don't gag.\"</i>");
		output("\n\nThat's what you are -- a good beta. " + (flags["USED_SNAKEBYTE"] != undefined ? "As it happens, you've very deliberately enhanced yourself so as to avoid gagging and ruining a lover's blowjob ever again -- and that's why Ardia croons in pleasure as she inexorably pushes you down to the base of her throbbing" + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? " equine" : "") + " cock. You're so capable you've ensured she's going to use you to the utmost, and that's just how you prefer it." : "You desperately grip your thumbs so as to avoid gagging, doing your utmost to prevent ruining your lover's blowjob -- and just barely succeed, shuddering in bliss as your lips press against the soft flesh of Ardia's crotch. She feels like a pole in your throat."));
		if (pc.isHerm()) output("\n\n<i>\"Oh, you're hard </i>and<i> wet,\"</i> Ardia comments, pressing her jiggly tits up into your [pc.cocks] and letting your [pc.pussies] drool onto her caramel skin. <i>\"Bet I can make you cum with both at the same time without even trying.\"</i>");
		else if (pc.hasCock()) output("\n\n<i>\"Oh, you're as hard as steel,\"</i> Ardia comments, pressing her jiggly tits up into your [pc.cocks]. <i>\"Bet I can make you cum without trying.\"</i>");
		else if (pc.hasVagina()) output("\n\n<i>\"Oh, you are dripping wet,\"</i> Ardia comments, no doubt feeling your [pc.pussies] drooling on her jiggly tits. <i>\"Bet I can make you cum without trying.\"</i>");
		else output("\n\n<i>\"So curious,\"</i> Ardia purrs below you. <i>\"You can't get off, but you want to spend all of your time getting me off instead. You're almost </i>too<i> perfect, [pc.name]...\"</i>");
		output("\n\n<i>\"Mmmmhgl,\"</i> you gurgle around her cock, reaching down to stroke her balls. <i>\"Mmmh…\"</i>");
		output("\n\nThe well-endowed alpha rolls her massive hips just once and you feel the weight of her thick, veiny meat slide into the deepest recesses of your throat, spurting a little bit of precum as if to mark her depth before it recedes once more. Then she's back inside you, and suddenly your hands are balling into fists and your eyes are rolling back in your head as the soft, loving dzaan girl begins to fuck your face in earnest. Her high-pitched feminine moans are all you can hear, senses finely tuned so as to focus entirely on your alpha at the detriment of everything else.");
		output("\n\nBut who cares about everything else? All that matters is the way Ardia feels when she spears you to the hilt, the way she groans in ecstasy as you suck at her base");
		if (flags["USED_SNAKEBYTE"] != undefined) output(" and squeeze down around her cock");
		output(", the way her beautiful thighs shake in joy when her cockhead brushes across your tongue. You wish you had <i>more</i> time to spend with her, to suck her cock, and to gulp down her potent seed.");
		output("\n\nReally, the more time you spend with her the less you find yourself thinking about the probe and the more you find yourself wishing you were between her legs or having her between your" + (pc.hasVagina() ? "s" : " asscheeks") + ". You'd tell her you love her if you weren't so preoccupied with " + (flags["USED_SNAKEBYTE"] != undefined ? "sucking" : "trying not to choke") + " on her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "enormous horsecock" : "big dzaan cock") + ", and besides, she already knows. Why else would you so willingly be skewered upon her gorgeous dick?");
		output("\n\n<i>\"Fucking <b>stars</b> that's good,\"</i> Ardia sighs forcefully, pumping you hard enough to make drool shoot from the corners of your mouth and run down her underside. <i>\"Mmf! Ugh! God, Steele!\"</i>");
		output("\n\nHer staggering cock begins to throb, " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "its flared head pumping up within you" : "its swollen head dribbling precum") + " while the sweaty alpha strains and pants, working harder and faster to fuck your beta mouth. She's <i>right</i> on the verge of orgasm, and you couldn't be any more eager to receive it.");
		output("\n\n<i>\"Yes, yes, yes, YES!\"</i> Ardia screams at the top of her lungs, forcing you down onto her pulsing cock and wrapping her immense thighs around your head, locking you in place. <i>\"Oh, GOD!\"</i>");
		output("\n\nYou cum violently as hot seed gushes up into your throat and down into your stomach, " + (flags["USED_SNAKEBYTE"] != undefined ? "just barely retaining enough presence of mind to milk her with your abilities. She screams again in outright ecstasy when you do, encouraging you to obediently continue" : "your mind washed away by the surging river of thick alpha spunk. She grunts and groans in ecstasy, pumping your obedient mouth") + " while your [pc.hips] jerk and buck in sympathetic pleasure, driven onwards by your instincts.");
		if (flags["USED_SNAKEBYTE"] != undefined) output("\n\nYou drink down every last drop without spilling a single bit, the perfect beta, and when you realize the enormity of your performance you suffer a second weaker orgasm right there and then. Your alpha must be <i>so</i> proud of you! When you feel her affectionately rub your head, you almost faint between her legs.");
		else output("\n\nSome of the excess inevitably bursts from your nostrils, but you drink down every last bit you can manage and extend your tongue to catch the rest. It tastes and feels so good you'll be damned if you let any of it escape, and when you feel your alpha affectionately rub your head in approval you almost faint on the spot from pleasure.");
		output("\n\n<i>\"Aren't you a good little beta cumtank?\"</i> Ardia whispers to you. <i>\"Yes you are, yes you are.\"</i>");
		output("\n\n" + (pc.hasTail() && pc.tailType == GLOBAL.TYPE_CANINE ? "Your [pc.tails] " + (pc.hasTails() ? "wag" : "wags") : "You take steady breaths") + " as she slowly withdraws from your abused fuckhole, allowing you to suck your own saliva up from her glorious cock and leave her shining clean. Pulling you down onto the bed from atop her and flashing you a grateful smile, she hops up and re-dresses herself, flicking her hair out of her face and sighing in happiness.");
		output("\n\n<i>\"That was fantastic, [pc.name],\"</i> she tells you, rubbing your [pc.ears]. <i>\"Such a good [pc.boyGirl]. Make sure you swing by my room any time you get hungry for my cum again, cutie.\"</i>");
		output("\n\n<i>\"Sure,\"</i> you say, smiling up at her. <i>\"Thank you, alpha.\"</i>");
		output("\n\nYou head back to your own room and lie on your bed cradling your obscenely seed-swollen stomach, half-torn between rest and intense masturbation. In the end, you decide masturbating is pointless when your alpha can so effortlessly get you off and fall into a dreamstate involving bouncing up and down on Ardia's lap, and awaken sometime later feeling somewhat recovered from your ravaging.");
		pc.orgasm();
	}
	else
	{
		// SEXED_ARDIA_SUCK_FULLSUB 1 if done scene, 2 if with snakebyte
		output("<i>\"Please let me suck your cock,\"</i> you moan, instinctively dropping to your knees before her and staring at her big, beautiful cock unabashed. <i>\"Your alpha cum feels so good...\"</i>");
		if (flags["SEXED_ARDIA_SUCK_FULLSUB"] == undefined)
		{
			output("\n\n<i>\"Well, that's too bad,\"</i> Ardia says airily, waving you off. <i>\"You can't suck my dick, [pc.name].\"</i>");
			output("\n\nYou're heartbroken. Before your racing mind can settle on a strategy to allow you your request, though, Ardia is standing above you with a thoughtful look on her pretty face.");
			output("\n\n<i>\"A-alpha?\"</i> you say hopefully.");
			output("\n\n<i>\"I'm not really in the mood for slow and sensual right now, [pc.name],\"</i> she says, smiling down at you. <i>\"I just want to pound the fuck out of a wet, warm hole balls-deep until I cum. So -- if you <b>really</b> want it -- prove your mouth can be that hole.\"</i>");
			output("\n\nYour eyes widen slightly as you realize what she's saying. She doesn't want you to service her -- she wants you to spread your lips and fuck your beta face like you're a whore for her to use. Well, that's easy! Anything for your alpha…");
			output("\n\n<i>\"Good [pc.boyGirl],\"</i> Ardia mutters, gripping her thickening cock and grinning fiercely as you open your mouth wide, [pc.tongue] lolling out and drool dripping from its length. <i>\"That's more like it…\"</i>");
			flags["SEXED_ARDIA_SUCK_FULLSUB"] = 1;
		}
		else output("\n\n<i>\"You know the drill, don't you?\"</i> Ardia says, smiling at you.\n\nYou do.");
		output("\n\nYou sit still, the very picture of obedience as Ardia sashays towards you with veiny dick in hand. She pauses in front of you -- just long enough to press her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "obscene equine length" : "fat dzaan cock") + " against your face as if to leave a sweaty imprint. Unable to help yourself, you greedily lick at the");
		if (ardia.hasCock(GLOBAL.TYPE_EQUINE)) output(" leathery");
		output(" base before she steps <i>over</i> you, her hefty balls " + (ardia.hasPerk("'Nuki Nuts") ? (ardiaHugeBalls() ? "swinging into your midsection." : "impacting your [pc.chest].") : "smacking you in the chin."));
		output("\n\n<i>\"<b>Don't</b> lick them,\"</i> she warns you, reaching down and taking ahold of your [pc.hair] to tilt your face upwards and away from her musky sack. <i>\"Remember, [pc.name]. You're just my cumtank for now. I don't want you to do anything except get fucked.\"</i>");
		output("\n\nOf course. You close your eyes as she bends at her considerable hips, aligning her meaty length with your [pc.lips] -- and then slides herself home into her warm, wet cocksheath.");
		output("\n\n<i>\"Oohhh, god,\"</i> Ardia grunts, her grip tightening on you. <i>\"That's perfect.\"</i>");
		if (flags["USED_SNAKEBYTE"] == undefined)
		{
			output("\n\nYou feel an intense burst of pride at her statement, but it was a foregone conclusion: you've shaped yourself to be the best deepthroating cockslut you possibly can be, and of course your beloved alpha has the right to use your incredible abilities as she sees fit. You don't show even a <i>hint</i> of gagging or being uncomfortable as she dips her hips lower and groans in joy, reaching all the way down your gullet until her soft groin bumps into your nose. " + (flags["SEXED_ARDIA_SUCK_FULLSUB"] != 2 ? "Slowly, gently, you tighten your throat around her blessed shaft until you're certain you have the perfect tightness for your alpha's bulky dick. You'll have to remember this feeling for later." : "Adjustment is unnecessary -- you've memorized what your alpha's bulky dick requires and had already prepared yourself the moment she displayed her desire to use you."));
			output("\n\n<i>\"Nnh- fuck,\"</i> she curses under her breath, raising her hips before lowering them again. <i>\"Oh, fuck, Steele. I'm going to have to find more of what you took and give it out to every other beta I have in the future. Scratch that -- <b>you're</b> going to have to find more and supply them. Nnmmm… I know you're up to the job.\"</i>");
			flags["SEXED_ARDIA_SUCK_FULLSUB"] = 2;
		}
		else
		{
			output("\n\nYou feel an intense burst of pride at her statement, revelling in her words of praise as her cockhead seeks out your tonsils and pushes past them. Suppressing your gag reflex as best you can, you wait until Ardia has herself wholly sheathed in your throat before you let it go and cough, tightening up on her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "immense length." : "keratin-covered dick."));
			output("\n\n<i>\"Ungh! That's right, choke on my dick,\"</i> she groans, raising her hips and fucking you as you shiver in lust. <i>\"G-god, I hope every beta is as much of a fucking whore as you are.\"</i>");
		}
		output("\n\nYou don't bother to nod and risk disturbing your alpha's rhythm as she gradually withdraws from your tight, wet fuckhole and then thrusts herself balls-deep with a guttural moan, a spurt of precum erupting from her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "flared head" : "swollen tip") + " and sticking to the back of your throat.");
		if (pc.isHerm()) output("\n\nYour [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " so outrageously hard you can barely resist cumming right then and there, your eyes crossing in unrestrained pleasure while Ardia begins to plow you in earnest. It only takes a few heavy thrusts for [pc.cum] to spurt in hot, eager streams from your " + (pc.hasCocks() ? "cocktips" : "cocktip") + " while [pc.girlCum] streams from your [pc.pussies] to coat the floor of her room in beta arousal.");
		else if (pc.hasCock()) output("\n\nYour [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " so outrageously hard you can barely resist cumming right then and there, your eyes crossing in unrestrained pleasure while Ardia begins to plow you in earnest. It only takes a few heavy thrusts for [pc.cum] to spurt in hot, eager streams from your " + (pc.hasCocks() ? "tips" : "tip") + ", " + (pc.isCrotchExposed() ? "splattering across the floor of her room." : "soaking through your [pc.underGarments]."));
		else if (pc.hasVagina()) output("\n\nYour [pc.pussies] " + (pc.hasCocks() ? "are" : "is") + " so wet and sensitive you can barely resist cumming right then and there, your eyes crossing in unrestrained pleasure while Ardia begins to plow you in earnest. It only takes a few heavy thrusts for [pc.girlCum] to " + (pc.isSquirter() ? "begin squirting from your overeager cunny, spraying" : "spill from your overeager cunny, coating") + " the floor of her room with beta arousal.");
		else output("\n\nThe inexorable feeling of nigh-orgasm that you're so used to by now brushes up against your mind like a familiar friend, its gentle caress juxtaposed by the heavy thrusts of Ardia beginning to plow you in earnest. Your [pc.nipples] are so hard they stand out like diamond studs, your neck swelling with her cock while you hold yourself steady and let her fill you out.");
		output("\n\n<i>Stars</i>, it feels so good to " + (pc.hasGenitals() ? "cum with your alpha inside you" : "have your alpha inside you") + ". With every rough penetration you feel more and more fulfilled, your purpose sweeping your consciousness away until there's naught left but a living, breathing fucktoy for Ardia to ravage to her hearts content.");
		if (pc.isHerm()) output(" More and more warm jizz bubbles and spills from your flexing " + (pc.hasCocks() ? "dicks" : "dick") + " to join the pussy-puddle below");
		else if (pc.hasCock()) output(" More and more warm jizz bubbles and spills from your flexing " + (pc.hasCocks() ? "dicks" : "dick"));
		else if (pc.hasVagina()) output(" A puddle forms below you");
		else output(" A wet gurgle of pleasure escapes your throat");
		output(" while she rides you, testament to your utter servility in your queen's presence.");
		output("\n\n<i>\"Nngh! Fucking hell,\"</i> Ardia pants open-mouthed, plump thighs quaking on either side of your head. <i>\"When this is all done I'm gonna keep you on a goddamn leash! Mmmfh! Fuck! Gonna need you available whenever I want a tight - nrrgh! Little sheath!\"</i>");
		output("\n\nThat sounds <i>wonderful</i>, but the majority of your attention is focused on the way the huffing alpha's beautiful cock is fattening deep in your gullet, " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "her cockhead swelling and spilling preseed until it feels so wide she won't even be able to pull it out of you" : "her cockhead swelling angrily until you're certain of it") + ". She's about to cum, and you're going to be ready when she does.");
		output("\n\n<i>\"Hhhnnnh!\"</i> Ardia strains, her balls drawing tighter and tighter against her underside as sweat flies from her body. <i>\"Oh, gghh-\"</i>");
		output("\n\nYou time it perfectly. " + (flags["USED_SNAKEBYTE"] != undefined ? "Embracing the capabilities of your enhanced throat, you swallow hard as your alpha blows her first ungodly load and create a concentric ring of muscle that follows in its wake, ensuring she gets every drop of it right into your stomach. The deep, animalistic moan of pleasure Ardia makes when you milk every following ejaculation from her overtaxed balls is all the payment you'll <i>ever</i> need, the instinctual and continuous orgasms not withstanding." : "Opening your throat, you allow her ungodly loads to flow freely down your gullet and explode right into your stomach, earning an appreciative growl from above in recognition of your service as a cumdump. The release of your alpha feels better than any orgasm you could ever have."));
		output("\n\nShe pants and grunts, standing on her tiptoes and squeezing your head between her thighs while warm jizz travels down her throbbing cock and bursts forth from her tip like a fountain. Each individual load she expels is absolutely loaded with potent alpha sperm, and the more of it you take in the more your grip on proper conduct slips. It starts as a slow, greedy slide up and down her cock as a consequence of temptation -- but by the time you've sucked down half a gallon of Ardia's jizz, you're noisily facefucking yourself up against her crotch and gurgling in glee when you receive another mindblowing explosion of her seed in your stomach. It doesn't seem like she minds.");
		output("\n\nShe pulls you off her with a satisfied sigh, several strands of saliva snapping as they stretch from her cock to your lips and deeper, leaving your mouth gaping open as if you expect more. Instead she wipes herself off, zips herself up, and gives you a smile.");
		output("\n\n<i>\"Thanks, [pc.name], you're such a beautiful, wonderful beta. I love you so much,\"</i> she says, patting you on the head. <i>\"Remember how to ask for a blowjob in the future, okay?\"</i>");
		output("\n\n<i>\"Nhh huh,\"</i> you mumble, looking up at her dreamily from your knees, your stomach obscenely swollen with her drugged seed.");
		output("\n\n<i>\"Good [pc.boyGirl],\"</i> Ardia soothes. <i>\"Head back to your room and rest for a moment, okay? If you stick around here your pheromones are going to drive me fucking crazy, and you probably have a couple of things you need to do before I sit on your face for a week straight. Right?\"</i> She crooks a grin at you. <i>\"Don't answer that.\"</i>");
		output("\n\nYou stagger back to your room and fall into your bed, sated beyond belief. Sleep finds you with one protective hand on your cum-bloated tummy and the other splayed out on the mattress, twitching as you dream of Ardia taking you whichever way she deigns to. You reawaken more functional but still hopelessly in love, your eyes drawn to the door as if Ardia is going to walk through it with that sexy, confident smile on her face.");
		output("\n\nMaybe if you wait here long enough she will, but otherwise you'll have to stand up and find her yourself.");
		if (pc.hasGenitals()) pc.orgasm();
		else pc.maxOutLust();
	}

	pc.loadInMouth(ardia);
	ardia.orgasm();
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_SUCK");

	addButton(0, "Next", mainGameMenu);
}

public function ardiaOnTheGroundReadyToGetPound(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Savin");
	processTime(4+rand(7));

	output("There's so many things to lust after on this big, beautiful alpha-slut: those huge fuckable tits, a round stomach ripe for cuddling, her [ardia.balls] and dangling cock, hardening as your eyes play over her naked body. But staring at her head-on, the best part's out of sight.");
	output("\n\n<i>\"Somehow I don't think you're eager to jump on my dick, captain,\"</i> Ardia giggles, biting a baby-blue lip. <i>\"Maybe you're a little more interested in this...?\"</i>");
	output("\n\nShe turns around, planting her hands on the side of her bed and thrusting her fat behind back at you, swaying side to side.");
	if (ardia.hasPlumpAsshole()) output(" Her plump black donut sticks out between the bronze mounts, winking its finger-wide opening at you. You settle your hands on her cheeks, and your fingers immediately sink into her callipygian flesh. The urge to delve in and put your lips on that modded pucker is irresistible; you bury your face in her crack and thrust your [pc.tongue] out, running it all around the loose ring and straight down the channel inside. Ardia doesn't really <b>need</b> lube anymore... your anusoft has taken care of that... but that [ardia.asshole] is just too pretty not to kiss.");
	else
	{
		output(" Her dark little star is almost hidden between the mountainous summits of her bronze asscheeks, and you have you get both hands on that ass and spread it open to get a good look at her. Pretty as it is, you know it could be <b>better</b>... juicier. You peel yourself out of that callipygian ass, only to find a bottle of lube waiting for you in Ardia's hand.");
		output("\n\n<i>\"Figured you were gonna rail my ass,\"</i> she smirks.");
		output("\n\nYou lean in, kiss your ever-thoughtful lover, and slip the bottle from her fingers and straight down between her cheeks. One good squeeze empties its entire contents squirt into her crack, smearing her dusky ring and, with a little help from your thumbs, her inner inches as well. Ardia moans, rocking forward against the bed as you smear the thick gel around until you're well and truly satisfied -- and her cock is dripping pre down her thigh.");
	}
	output("\n\nGrinning at the beautiful sight on display, you give Ardia a little push forward. She happily follows your lead, sprawling out onto the bed and snuggling up to her pillows (and pillowy tits) while you mount her from behind, straddling the tall peaks of her ass and letting your [pc.cock " + cockIdx + "] finally slap down into the wet and ready channel between them. Ardia's own [ardia.cock] throbs as your crown prods the back of her " + (ardiaHugeBalls() ? "overflowing" : (ardia.ballSize() < 15 ? "large" : "huge")) + " sack, squirting a little pre straight into her sheets.");
	output("\n\nHer asshole quivers, practically begging for your cock. You're eager to please, and quickly shift your [pc.hips] up the brown bergs until your [pc.cockHead " + cockIdx + "] is pressing into her [ardia.asshole]. She gasps, tensing, and moans whorishly as you start to slowly press your hips in.");
	if (addictedToArdia()) output("\n\n<i>\"W-what a pathetic alpha I am,\"</i> she gasps, biting her lip as your dick sinks into her [ardia.asshole]. <i>\"Sire'd be so ashamed, watching me let my beta sodomize me... but gods, it feels so good...\"</i>");
	else output("\n\n<i>\"M-maybe being an alpha's overrated,\"</i> she sighs, biting her lip as your dick sinks into her [ardia.asshole]. <i>\"Other alpha dzaan don't know what they're missing...\"</i>");
	output("\n\nYeah, she's a real " + (silly ? "snowflake" : "thing of beauty") + ". You lean into her, pressing your [pc.chest] into Ardia's back and wrapping your arms up under her chest. Those big ol' tits feel every bit as soft and squeezable as her ass, and your fingers vanish into the broad planes of bronze flesh in the blink of an eye. You blindly search for a pair of nipples to play with while your [pc.cock " + cockIdx + "] slides ever-deeper into Ardia's " + (ardia.hasPlumpAsshole() ? "soft, spongy asshole" : "tight little rear") + ". Ardia's anal muscles ripple around the first inches of your dick, as if her body's trying to suck you deeper in. You can feel the chubby dickgirl's prostate throbbing against your undercarriage, grinding on your vein inch after inch.");
	output("\n\nArdia is moaning and gasping by the time you've finally " + (pc.cockVolume(cockIdx) <= ardia.analCapacity() ? "hilted her ass." : "buried as much dick in her ass as can fit."));
	if (pc.balls > 0) output(" Your [pc.balls] slap heavily against her own fat sack, causing a ripple to spread through all that taut bronze ballsflesh.");
	else output(" Her fat, taut ballsack quivers as your cock stirs her insides up, swelling with potent seed.");
	output(" Her poor [ardia.cock] is trapped under her soft belly, and it's left to your imagination how much it must be throbbing and leaking down there in its chubby prison. As your [pc.hips] slap into her ass, her whole body rocks forward in the bed, and those wonderful cheeks bounce on the backswing.");
	pc.cockChange();
	output("\n\n<i>\"Oh, <b>captain</b>,\"</i> she croons, biting her lip while you start sawing your hips on back. <i>\"My ass just feels divine...\"</i>");
	output("\n\nYes it does.");

	addButton(0, "Next", ardiaOnTheGroundReadyToGetPoundPartTwo, cockIdx);
}

public function ardiaOnTheGroundReadyToGetPoundPartTwo(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Savin");
	processTime(20+rand(36));

	output("You give those mountainous tits of hers a squeeze and leverage yourself back, all the way until your [pc.cockHead " + cockIdx + "] is kissing her");
	if (ardia.hasPlumpAsshole()) output(" puffy");
	output(" rim. Of course, the whole reason you put Ardia in this position is because of how hard and deep you can fuck her like this; how you can leverage your entire body to drive your cock straight up her ass every time. Grinning to yourself, you make good on that proposition and slam yourself home.");
	output("\n\nArdia arches her back and howls your name. The heady smell of dzaanic pre fills the air as her excitement spills from her [ardia.cockHead] and into the sheets, and you watch as those heavy nads of her shudder with pleasure. Oh yeah, that's her weak spot alright. A couple more strokes like that and she'll be cumming her brains out.");
	if (addictedToArdia()) output(" It's hard to keep yourself from pulling out and rolling the big, busty beauty over and licking her stomach clean. No, this time <b>you're</b> on top!");
	output(" You dig your fingers into the wanna-be alpha's tits and start thrusting, burying your dick into her welcoming ass as hard as you can.");
	output("\n\nHer fat ass shakes and bounces with every thrust, giving you plenty of cushion as your [pc.hips] slam against it. The bed shudders under the force of the assault, creaking audibly to the same tempo that you pound its owner's " + (ardia.hasPlumpAsshole() ? (ardia.ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED) ? "thick donut" : "plump black ass") : "lush behind") + ". Sure enough, within moments you can feel her anal channel start squeezing wildly, and Ardia's dusky nipples stiffen even more in your hands, grinding into your palms as her tits keep quivering. You thrust deep, battering the little pleasure-bud just behind Ardia's anal walls, and feel her orgasm coming long before it hits.");
	output("\n\n<i>\"Ah, w-wait, my sheets!\"</i> ");
	output("\n\nWhen she cums, it's accompanied by an aromatic aura that leaves your [pc.knees] weak and your [pc.cock " + cockIdx + "] throbbing. Ardia's balls tremble behind her, and your hands come away coated in the thick, fragrant cream shooting up between her tits. You can only imagine how thoroughly her belly and underboobs are being smeared, but considering how massive the alpha's nuts are... it's probably a damn swimming pool down there.");
	if (celiseIsCrew()) output(" Celise will be thrilled, at least.");
	output("\n\nYou go harder on her ass while she's still squirting, and ease up for slow, deep strokes as flood dies down. Her [ardia.asshole] keeps drawing you back with every thrust, practically sucking you in so it can milk you in return. It's an easy thing to let her do it: feeling her ass cumming around you already pushed you to the edge, and your breath's coming hot and ragged into the dzaan's neck, fingers tightening around her slippery tits. ");
	output("\n\n<i>\"O-ohh, that feels so good,\"</i> Ardai moans, nuzzling into her pillow. <i>\"My ass feels ten times more sensitive now... oh, gods, I'm gonna cum again if you don't finish soon.\"</i>");
	output("\n\nYou grin and nip at the top of a pointed ear, telling her that she's welcome to cum as much as she wants. Milking out all that sweet, narcotic cream is half the fun of taking her like this, after all.");
	output("\n\nArdia giggles, but you can feel her muscles clench as you tease her ear and nipples. It doesn't ease up, and pretty soon you're gritting your teeth and moving your hips faster, slapping them up against Ardia's plush rear until the tightness forming in your loins is too much to bear. ");
	output("\n\n<i>\"C-come on...\"</i> Ardia groans, pushing back against you for once. <i>\"Let's cum together this time!\"</i>");
	output("\n\nAn offer too good to pass up. You hilt yourself and let it all spill out -- straight into the chubby dickgirl's ass. She groans and sighs, using her muscles to wring out all that [pc.cumNoun] while the now-familiar scent of dzaanic spunk redoubles. Cum starts to leak out between her tits and thighs, splattering on the floor in creamy cascades" + (addictedToArdia() ? " that you have to force yourself not to go lick clean then and there." : "."));
	output("\n\n<i>\"[pc.name],\"</i> your lover moans, eyes rolling shut. <i>\"Can we stay like this... I love the feeling of you on top of me... and if I get up I'm gonna have to take a shower.\"</i>");
	if (addictedToArdia()) output("\n\nLicking the floor clean of her cum might be a little shameful, but you're happy to clean <b>her</b>. With a grin, you tell your big alpha that you'll take care of that... but for now, you're content to nestle your head into her back and enjoy the feeling of her warmth and softness.");
	else output("\n\nNow that sounds like a fine idea, indeed.");

	pc.orgasm();
	ardia.orgasm();
	if (addictedToArdia()) pc.loadInMouth(ardia);
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_PRONE");
	IncrementFlag("ARDIA_BUTTLOVED");

	addButton(0, "Next", mainGameMenu);
}

public function buttsAndArdiasGalore():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Savin");
	processTime(20+rand(36));

	if (ardiaDomLevel() < 4)
	{
		output("<i>\"So... you've been staring at my dick a while...\"</i> Ardia laughs shyly, running a hand down her soft belly towards her crotch. <i>\"You want me fuck you, huh?\"</i>");
		output("\n\n<i>\"That's right.\"</i> You slink forward and wrap your arms around the chunky alpha's broad hips. <i>\"I want you inside me.\"</i>");
		output("\n\nShe giggles and leans back against her desk, groping at the drawer until she finds a little bottle of lube and palms it off on you. <i>\"Wanna get me ready? Cuz I've had my eyes on your ass... i-if that's okay, I mean.\"</i>");
		output("\n\nOh yeah. That's <b>exactly</b> what you want.");
	}
	else if (ardiaDomLevel() < 7)
	{
		output("<i>\"Mmmm, hey, I've got a little craving you could maybe help me with,\"</i> Ardia admits, leaning back against her desk. <i>\"Wanna help your alpha out?\"</i>");
		output("\n\nYou nod eagerly. Always.");
		output("\n\n<i>\"Good,\"</i> she purrs, reaching into the drawer and pulling out a bottle of lube. <i>\"Rub my dick down with this so I can fuck your ass nice and hard.\"</i>");
		output("\n\nO-oh.");
	}
	else
	{
		output("<i>\"Now that you've warmed me up... and I've got plenty of lube all over my dick... what's a girl to do? Oh! I know: how about I fuck your ass? I'd ask if you wanna be your alpha's anal cock-cozy for the rest of the day, but the way you're already drooling");
		if (pc.hasCock()) output(" and getting hard again");
		output(", you don't need to answer. I know.\"</i>");
		output("\n\nArdia grins wickedly and grabs your [pc.butt] in both hands, pulling you closer -- right into the deep valley of her cleavage. <i>\"There's a good [pc.boyGirl]. So ready for me that I can feel you trembling with excitement. So... get on the bed and present that ass for your alpha.\"</i>");
	}

	if (ardiaDomLevel() < 7)
	{
		output("\n\nYou shimmey");
		if (!pc.isCrotchExposed()) output(" out of your [pc.covers] and");
		output(" onto your [pc.knees] before your glorious alpha dzaan, Her bare, bronze beauty is fully on display for you, with a half-hard cock and [ardia.balls] resting heavily against her thick thighs. You squirt the bottle's contents out into your open palm and rub your hands together, coating yourself with the slimy slick substance and then going in for the alpha's low-hanging fruit. With all the eagerness of a costly courtesan, you wrap your hands around your lover's [ardia.cock], working the lube in over every keratin-nubbed inch before wrapping both around her [ardia.cockHead] and slathering the rest of the bottle all over her crown. By the time you're done, thick white pre is already beading from her cumslit, smearing over your fingers and mixing with the lube clinging to her.");
		output("\n\n<i>\"Ohh, that's good. Got me nice and hard!\"</i> Ardia giggles, stroking herself. <i>\"Now turn around and show me that ass, [pc.name]!\"</i>");
	}

	//Combine all:
	output("\n\nYou hurry to comply with Ardia's demand, prostrating yourself across the bed and pulling her pillows under your head. A second later and you feel her big, strong hands slapping your cheeks, digging her fingers in and spreading them apart. A shiver runs through your body from tailbone to fingers as your [pc.asshole] is exposed to the open air. The thick, meaty girth of Ardia's [ardia.cock] slaps down into your ass-cleavage. Her [ardia.cockHead] grinds against your dark rim, rubbing pre all around your clenching entrance.");
	output("\n\n<i>\"Bite down on something,\"</i> Ardia teases, pressing herself against your ring. <i>\"Cuz I'm going balls deep in this booty. It's just too good to pass up.\"</i>");
	output("\n\nYou snuggle into the pillows and squeeze your eyes shut while the pressure builds against your rosebud. The big, busty amazon squeezes your cheeks even harder, enough to force a moan from your [pc.lips] before she's even inside you. Instinctively your body pushes back against her cock, shuddering as your ass slowly spreads open and admits the first inch of rock-hard dickmeat. And when she <b>does</b> force her crown through your [pc.asshole], oh, you're a one-[pc.manWoman] chorus. Ardia pushes herself in inch by inch, slowly at first and then ramming the last half of herself in hard once you've opened up. Her [ardia.balls] slap against your thighs, viscerally signalling that she's fully sheathed herself inside.");
	pc.buttChange(ardia.cockVolume(0));
	output("\n\nOnce buried, she pauses for a long moment, savoring the feeling of your ass's clench-and-push. A growly purr escapes the back of her throat, and her hands knead your cheeks like baker's dough. " + (addictedToArdia() ? "<i>\"That's good, my beta... your ass feels like it was made just for me. Keep those muscles working, cuz I'm gonna start moving.\"</i>" : "Ardia moans softly, giving you both a chance to adjust to her presence inside you. <i>\"You feel so good... oh, it's moments like this that I realize how good my pops has it with her harem. I wanna spend all day like this, with your ass wrapped around my dick. Can we just do that? Well, maybe after I'm done fucking you...\"</i>"));
	output("\n\nA shiver of anticipation works its way through you, and clearly Ardia feels it. Her cock throbs, squirting thick rivers of precum inside you -- and assaulting your body with all that wonderfully intoxicating buzz that comes with it. You're head's swimming in moments, eyes crossing as the drug works its way into your system.");
	if (immuneToArdia()) output(" Even immunized as you are from the addictive qualities, it's still a rush every time your chunky lover creams inside you! Hell, just her random boners are enough to suffuse the air all through the cabin most of the time; getting a full dose of pre straight up the tailpipe is damn near overwhelming.");
	output("\n\n<i>\"So... I think I've calmed down enough that I won't nut on the second thrust. How 'bout you, [pc.name]? Hehe, just kidding... you can cum as much as you want! That just makes it hotter.\"</i> ");
	output("\n\nYou feel a desperate warmth spread through your loins, like your body's responding to the implicit invitation to " + (pc.hasCock() ? "paint the bedsheets" : "cum for her") + ", but you desperately try and fight it back. You can't run yourself ragged already -- not before she's even started moving! Ardia giggles behind you and gives your [pc.butt] a little slap, just enough to make your cheeks quake as she starts to slowly draw herself out of you. The back-stoke's just as good as the thrust, it turns out, and your rim hugs every veiny, throbbing inch of [ardia.cock] right to her [ardia.cockHead]. She lets you taste the thickest part of her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "flare" : "mushroom-shaped cockhead") + " for a moment before slamming herself right back into her cocksleeve where she belongs. Your whole body rocks forward as her fat balls and thick thighs impact your rear, pounding you down into the bed.");
	output("\n\nOh, stars, that's the stuff! You're moaning like a whore in no time at all, panting and shaking your hips as your " + (ardiaDomLevel() < 4 ? "lover" : "alpha") + " fucks you. The sound of her balls " + (silly ? "clapping your cheeks" : "slapping against your ass") + " echoes through the cabin, and pretty soon, your orgasmic cries are adding to the cacophony.");
	if (pc.hasCock()) output(" Your [pc.cock] paints your thighs, spilling [pc.cum] in milky ropes to the beat of Ardia grinding down on your prostate.");
	output(" Your [pc.asshole] clenches, hungrily devouring every thrust as your muscles go wild around the alpha's cock. <i>\"Oh, that's nice... I love this ass! I want more of it!\"</i> your lover pants, <i>\"Work it for me, [pc.name]!\"</i>");
	output("\n\nYour orgasm's doing that with aplomb. Ardia doesn't show the slightest bit of mercy as she plows you, thrusting in straight through your climax like it's for her pleasure, not yours. The bed starts creaking underneath you, protesting the rough treatment it's receiving on your behalf. The mattress shudders every time Ardia comes down on you with all her prodigious size, thrusting her [ardia.cock] into your ass like a battering ram... and then the springs push you right back up her cock as soon as she starts to withdraw. ");
	output("\n\n<i>\"Yeah, move those hips!\"</i> your lover laughs, bringing her palm down hard across your cheeks. <i>\"Keep this up and I'm gonna... I'll..\"</i>");
	output("\n\nArdia bites her lip and moans, sinking her hands into your [pc.hips]. You can feel that she's trying to hold back, but there's still a veritable flood of cream spilling into your pre-basted bowels. Your eyes cross, and everything goes hazy as more and more necrotic spooge fills you, packing your [pc.belly] full before she's even properly cum. She can't keep her cool for long, though, and before your orgasm's entirely played out, before you're done trembling and gasping for breath, your big beautiful " + (ardiaDomLevel() < 4 ? "lover" : "alpha") + " holds your flanks fiercely and pulls you backwards as she thrusts, completely sheathing her [ardia.cock] in your [pc.asshole]. Her [ardia.balls] clench, tensing against your [pc.butt] as they feed her dick what feels like a gallon -- no, more than that! -- of steamy-hot dzaanic cum. Your whole lower body feels numb, buzzing with overwhelming pleasure as the narcotics flood your system.");
	output("\n\nBeing filled so completely, pumped full of so much of your lover's cum, it's... beyond compare. Your abused body goes limp in Ardia's arms, sliding forward onto the bed as your stomach swells and bears you down. As you go ragged, Ardia leans in over you, pressing those massive bronze tits into your back and wrapping her arms around your chest.");
	if (pc.biggestTitSize() >= 3) output(" Her hands grab your tits, wrists crossed, and pull you tight against her pillowy tits.");
	output("\n\n<i>\"Your ass is heavenly...\"</i> Ardia murmurs into your [pc.ear]. <i>\"I'm not pulling out... the thought of a second going by without your [pc.asshole] wrapped around my cock is too much to bear. I love it too much.\"</i> ");
	output("\n\nYou feel tender kisses tracing up your neck, but you're riding far too high on the rush of her cum to do anything but moan. Ardia murmurs sweet nothings as she hefts herself up into bed over you, smothering the back of your head in her cleavage all the while. <i>\"Let's stay like this... I'm not even going soft, either. Hope you've got room for more.\"</i>");
	output("\n\nFor Ardia? Always...");

	pc.loadInAss(ardia);
	pc.orgasm();
	ardia.orgasm();
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_PLOWED");

	addButton(0, "Next", mainGameMenu);
}

public function gettingRiddenByArdia(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Savin");
	processTime(10+rand(11));

	if (ardiaDomLevel() < 4) output("<i>\"You want me to be on top, don't you?\"</i> Ardia teases, biting her lip. <i>\"I guess I ought to assume my rightful place as an alpha... but that [pc.cock " + cockIdx + "] is just too tantalizing to pass up. Whatever will I do?\"</i>");
	else output("<i>\"I think it's time for me to be on top,\"</i> Ardia grins, planting her hands on her hips. <i>\"Oh, but that [pc.cock " + cockIdx + "]... how can even an alpha bitch like me pass that up?\"</i>");
	output("\n\nYou've got an idea for that. Giving Ardia a salacious smirk, you saunter back to the bed and pat your thighs, urging the big beauty to follow you. She comes with swaying hips and balls, [ardia.cock] hardening in her hand while the other plants itself on your chest and gives you a little push.");
	output("\n\n<i>\"Good idea,\"</i> she says, pinning you down on the bed. The big beauty slowly runs her hand down your [pc.chest] and between your [pc.legs], letting the tips of her fingers dance around the [pc.knotOrBase " + cockIdx + "] of your cock. <i>\"Mmm, this [pc.cock " + cockIdx + "] is so nice... Oh goddess I'm actually salivating! What kind of alpha am I if I get so worked up seeing dick?\"</i>");
	output("\n\nConsidering her own rock-hard erection, bobbing under its own hefty weight mere inches from your shaft, she's a pretty damn hung one. Ardia just grins at that and reaches for her desk, fumbling around for the bottle of lube in the drawer. She up-ends the bottle over your swaying pole and squeezes out a glob of cool, thick gel over your [pc.cockHead " + cockIdx + "]. She just keeps pouring until your crown is glistening, but rather than rubbing it in, your lover pulls the bottle back... and shoves it straight down the valley between her mountainous asscheeks. ");
	output("\n\nYou watch with wide eyes as the chunky alpha leaves the lube bottle wedged in there and turns around, planting her hands on your [pc.knees]. She thrusts her ass out at you, and it wobbles weightily above your crotch as she sways her hips from side to side. ");
	output("\n\n<i>\"Go on and give it a squeeze,\"</i> Ardia purrs, bouncing on her heels. <i>\"We're gonna need <b>all</b> of that lube.\"</i>");
	output("\n\nWith pleasure. You lean up and sink your hands into Ardia's prodigious bum, revelling in how sinfully soft it is. Her flesh quakes like gel, rippling around your fingers as you clap her cheeks back and forth. Ardia bites her lip and wiggles her hips, redoubling the effect. Every time her broad mountains come crashing back together, the bottle of lube ejaculates straight down her crack, smearing her [ardia.asshole] and the backside of her [ardia.balls] with a thick glaze of slickness. It barely takes any time at all to empty the whole container out onto her bronze flanks, and soon they're glistening in the cabin's light. ");
	output("\n\nArdia leans forward, and you spread her asscheeks as far as they'll go, showing off her lubed-up ass. Your thumbs inch forward, rubbing at " + (ardia.hasPlumpAsshole() ? "her puffy mound" : "her dark entrance") + ". Oh, that's gonna be heaven around your dick.");
	output("\n\n<i>\"Now you just lay back,\"</i> your lover commands. <i>\"Wouldn't want you getting hurt.\"</i>");
	output("\n\nHurt? You " + (ardiaDomLevel() < 4 ? "reach up and slap her cheek, reminding her who's captain. Ardia just grins over her shoulder and leans back, searching blindly for your crown with her asshole." : "swear your [pc.cock " + cockIdx + "] throbs with the 'threat' of Ardia going all out on you. Oh, yes please, thank you ma'am."));
	output("\n\nThe moment your [pc.cockHead " + cockIdx + "] slides into the ring of Ardia's ass, the big amazon bites her lip and pushes down <b>hard</b>. A wonderful burst of pain and pleasure hits you as the alpha babe comes crashing down full-force on your hips, smashing your thighs deep into her jiggly ass and taking your dick straight to the " + (pc.cockVolume(cockIdx) > ardia.analCapacity() ? "deepest depths" : "hilt") + " on the first go. She throws back her head with a howl, grabbing her own tits as her cock and balls bounce. <i>\"Oh, yeah, that's good!\"</i> she laughs. <i>\"Fuck, I can feel it in my chest.\"</i>");
	pc.cockChange();
	output("\n\nArdia grinds her hips from side to side, letting you feel all her prodigious weight bearing down on you. Her ass ripples inside and out with the motion, leaving you a squirming, gasping mess beneath the now-dominant dzaan before she finally shows mercy and starts to rise back up your shaft, dragging your [pc.cock " + cockIdx + "] back through every inch of that [ardia.asshole]. In the wake of that first thrust, your body's left feeling <b>flattened</b> and limp, barely able to do more than reach out for more of that perfect ass.");
	output("\n\n<i>\"Still want more?\"</i> she says, grinning over her shoulder. <i>\"Well don't blame me if you can't walk in the morning...\"</i>");

	addButton(0, "Next", gettingRiddenByArdiaButMore, cockIdx);
}

public function gettingRiddenByArdiaButMore(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Savin");
	processTime(10+rand(16));

	output("You don't have the chance to answer before Ardia comes crashing down once more. The sound of her flesh cracking against your [pc.skin] echoes through your cabin, and the bed creaks and shudders beneath you when her ass pounds down on you. It's an intoxication pain, feeling your pelvis being smashed again... and again... and again, each time taking your [pc.cock " + cockIdx + "] deep inside her silky-tight depths. Ardia's [ardia.balls] slap against your thigh every time she hilts herself, and her [ardia.cock] bounces and leaks white pre all over itself. You're sure your [pc.cockHead " + cockIdx + "] is grinding on her prostate something fierce, but you can barely feel anything past your waist now -- it's all a hellish barrage of pleasure, exploding every time her booty slams into you. ");
	output("\n\nIt's inevitable that you explode, too. ");
	output("\n\nYou moan and thrash weakly, feeling your dick be subsumed into the soft, warm embrace of Ardia's ass. Her [ardia.asshole] practically sucks the [pc.cum] straight out of your dick, taking fat wads of it deep in her bowels between every bounce. She giggles, grinning over her shoulder as your [pc.cock " + cockIdx + "] throbs inside her. <i>\"Ohh, that feels creamy... thanks for the extra lube!\"</i>");
	output("\n\n<i>\"W-wait don't-\"</i>");
	output("\n\nArdia rises on your cock, taking you to the crown. Your [pc.cum] spills down your shaft and smears around her rim, mixing with the slick glaze still clinging to you both from when you started. Ardia only keeps you outside her long enough for you to get a good look at her ass before crashing it back down on you. Your [pc.cock " + cockIdx + "] throbs with over-stimulation, enough to make you scream with pleasure and arch your back straight off the bed -- but your [pc.hips] remain firmly entrenched in the bed, a waiting target for Ardia's butt to come crush once more. ");
	output("\n\n<i>\"I'd be, unf, a pitiful alpha -- ahh! -- if I just <b>let</b> you cum in me!\"</i> your " + (ardiaDomLevel() < 4 ? "lover" : "mistress") + " huffs between bounces. <i>\"Not without getting me off first anyway!\"</i>");
	output("\n\nObviously you deserve this punishment. How absolutely thoughtless, letting yourself cum before your " + (ardiaDomLevel() < 4 ? "lover" : "mistress") + ". It's only right that she use you like a dildo until she gets off as well. She just keeps " + (silly ? "twerking" : "working") + " that booty, faster now that you've added a second layer of lube for her to work with. She takes you in shallow, rapid strokes, trying to keep your [pc.cockHead " + cockIdx + "] grinding just inside her entrance so you can keep rubbing her pleasure-bud.");
	output("\n\nYou can <b>hear</b> her pre splattering the deck between her feet, flicking from her bouncing rod in thick, sloppy ropes. You can <b>feel</b> how close she is by the way her [ardia.asshole] wrings your cock, desperately squeezing around you every time Ardia hilts you. And you can <b>smell</b> the commanding fragrance of her cum filling the air, intoxicating in its richness. Oh, stars, you...");
	output("\n\n<i>\"A-Ardia!\"</i> you squeal " + pc.mf("like a girl", "like the bitch you are") + " as your [pc.cock " + cockIdx + "] throbs and squirts straight into her darkest depths. The big dzaan gasps, and her own [ardia.cock] jumps to attention as the first shots of your second orgasm hit her right in her anal g-spot. A moment later and her fat cock's mirroring your own, throwing thick lances of pearly seed so far that it splatters on the far wall and streams streaks across the floor. ");
	output("\n\n<i>\"F-f-fuuuuck!\"</i>");
	output("\n\nArdia comes down on you one last time, hard enough to nearly trigger another defensive orgasm. Her broad flanks all but envelop your hips, lodging your dick as deep as it'll go inside her while you both finish blowing your loads. You can just glimpse Ardia's tongue lolling out of her mouth, and her huge brown tits quaking as she struggles to catch her breath. Stars, what a sight... it's enough to let you ignore the aching throb in your thighs and pelvis. Oh, that's gonna hurt in the morning...");
	output("\n\nWhen Ardia's finally finished shooting her " + (silly ? "goo" : "cum") + " all over the room, she just sighs and lets herself fall backwards, burying you underneath a mountain of chunky alpha. <i>\"Oh yeah... you make a good pillow,\"</i> she murmurs, grinding her hips in. " + (pc.hasKnot(cockIdx) ? "No matter how much she tries, though, your cock remains firmly lodged inside her, ensuring not a drop of cum is wasted... at least from the second orgasm... and the inevitable third at this rate. She finally just huffs and nuzzles into you, content to let you stay and cream her ass again as her muscles tremble in the aftershocks." : "It takes a good half-minute for her to finally work your softening tool out of her, dislodging it amidst a deluge of jizz that pours down onto the floor and stains her sheets."));
	output("\n\nYou're not getting up any time soon...");

	//Apply Sore condition
	soreDebuff(5);
	pc.orgasm();
	ardia.orgasm();
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_RVS");
	IncrementFlag("ARDIA_BUTTLOVED");

	addButton(0, "Next", mainGameMenu);
}

public function doinSomeDzaanTiddies(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Savin");
	processTime(15+rand(21));

	output("Letting your eyes wander all over the beautiful bronze babe in front of you, your eyes keep coming, inevitably, back to those titanic chocolate mountains thrust proudly forth from her chest. Ardia's elfin ears flick back and forth as you silently drink in all those intoxicating curves... and pretty soon, you see her [ardia.cock] start twitching too, slowly lifting off her [ardia.balls] to point accusingly at you. <i>\"Don't just stare... come on, I know you wanna put your face in 'em,\"</i> she sighs, wrapping an arm under her rack and bouncing them -- and act that takes visible effort thanks to their sheer heavenly size. ");
	output("\n\nIf she's offering, you aren't saying no. You saunter forward, slip your arms around her prodigious hips, and plant your [pc.face] straight into the deep valley of cleavage she's made for you. Ardia gasps, then giggles, using her free hand to grab the back of your head and push you deeper in. <i>\"Mmm. Don't mind the boner... they're sensitive.\"</i>");
	output("\n\nAnd you'd heard bigger meant <i>less</i> tender. Well, if that's the case... you tighten your grip around the alpha's middle and shake your head " + (pc.catDog("a", "b", false) == "b" ? "like a wet dog" : "as hard as you can") + ", sending ripples out through your lover's expansive chest. You earn a series of little gasps and moans as you making her titties quake around your cheeks -- and you echo the sentiment every time all that plump flesh comes cracking back down on your face, smothering you in boobflesh. What magnanimous god dared to make a woman so <b>soft</b>!?");
	output("\n\nYou'd give thanks if you could form words at all down there in the dzaan's rack. Instead, you content yourself with motorboating her even harder while your hands dig into her thick ass and your thighs grind up against her stiffening cock. A few more moments of that and Ardia makes a feral sound in the back of her throat and grabs you in both arms, pulling you tight against her -- hard enough to make her [ardia.cock] lance straight up into her own tits, and bury your head so deep between them that you can taste her arousal.");
	output("\n\n<i>\"I told you they're sensitive!\"</i> she complains, suddenly pushing you back. You teeter on your " + (pc.isNaga() ? "coils" : "heels") + " before tumbling back onto the bed, [pc.legs] spread and [pc.cock " + cockIdx + "] jutting straight into the air. <i>\"Gods, you're gonna make me cum just playin' with my tits! That's no fair...\"</i>");
	output("\n\nArdia plants her hands on her hips and stares down at you, ignoring the two pillars of throbbing, pre-slicked meat bobbing between you. Finally, her eyes wander down to your [pc.cock " + cockIdx + "], and a little smile spreads across her azure lips. <i>\"But it's pretty flattering how much you love my boobs. I wonder... can you make me cum just from teasing them? Let's find out.\"</i>");
	output("\n\nShe grins, swaying those mareish hips side to side as she saunters up and slips down onto her knees at the edge of the bed. The alpha hefts her tits up, taking one in each hand and wrapping her palms around her caramel teats. You just watch wide-eyed over your [pc.belly] as your [pc.cock " + cockIdx + "] disappears between her pillowy titties. Ardia gives a little gasp and bites her lip, eyes narrowing as she wraps herself all the way around your dick. ");
	output("\n\n<i>\"That's better,\"</i> she giggles, swaying her shoulders from side to side. <i>\"Ohhh, yeah, still feels good... let's get started.\"</i>");
	output("\n\nYou're about to <b>finish</b> if she doesn't take it easy. Just her wiggling around is enough to batter your dick with fifty pounds of quaking titflesh, as tight as any pussy and so much more lively the way every inch of her cleavage ripples all around you. It's almost like you're fucking a galotian, so creamy and soft, hugging you from step to crown. ");
	output("\n\n<i>\"Just gonna tuck my dick between my thighs here... okay,\"</i> Ardia sighs, adjusting herself -- and making her tits wobble around you until she's pinched her legs together and sits back on her heels. She sighs and wraps her arms around the vast expanse of her bust, pressing the two chocolate mountains together around your [pc.cock " + cockIdx + "]. Slowly, hesitantly, Ardia starts to rise on her knees, dragging your dong through the tight embrace of her tits until she's as tall as she can get, and your [pc.cockHead " + cockIdx + "] is almost ready to fall out of her underboob. She makes it an agonizing wait to get there, though, taking seconds to cover every single inch along the way.");
	output("\n\n" + (addictedToArdia() ? "<i>\"Aren't you the one who's supposed to be sucking down <b>my</b> cum?\"</i> Ardia teases" : "<i>\"Normally betas are the ones who end a session with a mouthful of cum,\"</i> Ardia laughs") + ", sinking steadily back down your length. <i>\"How'd I talk myself into this...\"</i>");
	output("\n\nYou don't know, you don't care, all you want it more. Desperately, you thrust your [pc.hips] up into that magnificent cleavage, slapping her undercarriage and driving yourself " + (pc.hasKnot(cockIdx) ? "knot" : (pc.balls > 0 ? "balls ": "base")) + "-deep into alpha-boob. <i>\"W-woah!\"</i> Ardia gasps, clenching her shoulders together lest her tits pop out of her hands. That just makes a more tempting target for your [pc.hips] to crash into a second time. Her boobs bounce out of her hands this time, flying free a moment before she can grab her nipples and pinch them back together on your backstroke. She comes right back down on your shaft, and it feels every bit as intense as a girl riding you cowgirl. Her tits quake all around you, slapping every inch of cockflesh with silky-soft boob.");
	output("\n\nYou're both moaning, backs arches as you succumb to your own brands of pleasure. Ardia's tits must be even more sensitive than she claims -- you can smell the heady, earthy scent of dzaanic seed heavy in the air, spilling down her thighs as she gets closer and closer to orgasm. Her blue lips hang open, letting loose a constant chorus of little gasps and whines every time your [pc.cockHead " + cockIdx + "] thrusts up into her creamy cleavage. When you insist on still moving your hips, trying to plow her tits despite being in the passive seat here, Ardia just huffs and presses her tits down on you, pinning you on the bed. With that annoyance suppressed, your alpha lover decides instead to push and pull on her tits, moving them <b>around</b> your [pc.cock " + cockIdx + "] rather than just up and down. Her shoulders swing side to side, forth and back, wringing your dick between so much pillowy boob that your orgasm is simply inevitable, a foregone conclusion that her overbearing titfuck hasted to its end. ");
	output("\n\nA few more moments of this treatment and you're digging your fingers into the sheets and gripping your thighs around Ardia's shoulders. Another few wiggles and you're crying her name, and a fat rope of [pc.cum] is shooting up from between her boobs. It geysers up in the air, only to fall back and splatter across the tops of her tits, pooling messily into her cleavage even as the next shot fires. ");
	output("\n\nArdia bites her lip and works her tits even harder, using your cum as lube to get those tits moving 'till you've shot every drop of your wad between them. Her chest's a wet, sticky mess by the time you're empty... and she greedily licks up up, thrusting her tongue down into her tits to lap up your wasted seed.");
	output("\n\nAs she's polishing off your crown with noisy slurps, you finally manage to prop yourself up on your elbows and put together a few coherent words. <i>\"W-what about you...? Are you gonna cum?\"</i>");
	output("\n\nThe chunky alpha just laughs. <i>\"Oh, I did. Twice!\"</i>");
	output("\n\nShe reaches down between her legs, and her hand comes back plastered in white. <i>\"See? My tits are still tingling, too. If I keep slurping, I might make it thrice.\"</i>");
	output("\n\nYou flop back with a laugh of your own. Bigger really is better...");

	pc.orgasm();
	ardia.orgasm();
	ardia.orgasm();
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_TITS");

	addButton(0, "Next", mainGameMenu);
}

public function ardiaShutsTheLightForProcreation(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Savin");
	processTime(15+rand(21));

	if (ardiaDomLevel() < 7)
	{
		output("<i>\"Mmmm,\"</i> Ardia murmurs, sauntering up and wrapping her arms around your [pc.hips], pulling you close enough that you can feel her [ardia.cock] jamming into your thigh, dragging its crown across your [pc.skinFurScales]. <i>\"You're " + pc.mf("handsome", "beautiful") + "... but you'd look even better on that bed with your [pc.legs] spread for me. Wanna indulge a girl?\"</i>");
		output("\n\nOh, you very much so do. Giving Ardia a parting kiss, you slink back from her and onto the bed, rolling onto your back so you can see your big, beautiful lover coming. ");
	}
	else
	{
		output("<i>\"On the bed. Now,\"</i> your alpha commands, wrapping her hand around her [ardia.cock]. <i>\"Spread your [pc.legs] for me, beta. It's time to give me your [pc.vagOrAss " + vagIdx + "].\"</i>");
		output("\n\nYour heart flutters at the command, practically leaping into your throat -- and your body leaps to its [pc.feet], scurrying over to the bed. Ardia follows you with slow, confident strides, stroking herself back to hardness while you crawl into her bed. <i>\"That's what I like to see,\"</i> she murmurs. <i>\"Gods, you're beautiful. But you're gonna be even moreso when you're covered in my cum.\"</i>");
	}
	output("\n\nArdia plants a knee on the edge of the bed and runs a hand up your [pc.leg], slowly at first, and then roughly when she delves into the depths between. Two of her fingers roughly probe against your [pc.vagOrAss " + vagIdx + "], hard enough to make you claw the bedsheets. Her [ardia.cock] drags up onto the bed, followed slowly by the massive heft of her [ardia.balls]. The other hand plants itself on your [pc.belly], slowly teasing and squeezing its way right up to your [pc.chest] to squeeze and pinch your nipple. You gasp, and clench, and then suddenly Ardia's fingers are inside you, forcing their way inside to stretch your fuckhole out in preparation for the dicking to come. ");
	output("\n\nWhile she's vigorously fingering you, Ardia finishes mounting the bed and shoves her knees up under your [pc.butt], hefting your behind off the bed and into her lap. Her cock slaps heavily against your belly, grinding into your [pc.skinFurScales] as the chunky dickgirl situates herself. When she's satisfied, she gives you a little smile and pulls her hand free, patting your thigh on the way out.");
	if (vagIdx < 0)
	{
		output("\n\n<i>\"Oh, I almost went in dry. That could have hurt!\"</i> she giggles, giving your ass a little slap like somehow it's your fault. <i>\"Better lube up before I fuck your ass raw, huh?\"</i>");
		output("\n\nArdia gives you a wicked little grin and reaches for her desk -- and act that ends with one of her massive tits mashed into your face, completely blackening your world in jiggling boobflesh. It's a privilege to be so utterly smothered, and you open wide to accept a chocolate-hued nipple. Ardia just makes a pleased little sound in the back of her throat, and you feel something cool and wet splat onto your [pc.belly]. The meaty heat of her [ardia.cock] flops into the growing smear on your gut and rubs itself in, accompanied by even more or the slick lubricant. ");
		output("\n\n<i>\"That'll do it,\"</i> she laughs, giving a couple of playful thrusts over your slicked-up belly. <i>\"Oh, I'm gonna savor every moment of this.\"</i>");
	}
	output("\n\nA moment later, and Ardia's [ardia.cockHead] is pressed against your still-gaping entrance, rubbing wetly back-and-forth. <i>\"Ready?\"</i> she asks, already pushing her hips in. Ardia doesn't give you time to respond -- by the time you've opened your mouth, she's already inside you, and all that spills forth from your [pc.lips] is a cry of absolute pleasure. Your [pc.vagOrAss " + vagIdx + "] hugs her [ardia.cock], hungrily taking every inch of your " + (ardiaDomLevel() < 4 ? "lover" : "alpha") + "'s cock. Star's that's good! It's so filling, a thick knot of meat in your gut that makes your head swim and your heart hammer.");
	if (vagIdx < 0) pc.buttChange(ardia.cockVolume(0));
	else pc.cuntChange(vagIdx, ardia.cockVolume(0));
	output("\n\nBy the time Ardia's thick thighs clap against your ass, fully sheathing herself inside you, you're already a gasping, moaning mess.");
	if (pc.hasCock()) output(" Your [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " drooling all over your [pc.belly]. You're not sure if you just came, or if Ardia's milked out an orgasm's worth of pre already. Either way, your whole lower body feels numb.");
	if (vagIdx < 0) output(" Your pussy clenches madly around Ardia's rock-hard rod, at once trying to fight back against the sudden penetration and desperately craving even more of her. Either way, all the juices flooding out of your cunt are making it easy for her to slide in and out.");
	else output(" Thanks to the lube Ardia glazed herself with, at least that sudden penetration didn't hurt, but damned if your ass isn't clenching like mad around her anyway. Every muscle in your tailhole fights to help her as she slides herself slowly out... and is twice as hungry to pull her back in when she thrusts again.");
	output("\n\n<i>\"Oh, well, this hole's awfully eager!\"</i> Ardia grins, running her hands up and down your hips. <i>\"Feel like you're sucking me in. " + (ardiaDomLevel() < 4 ? "What a good beta, making your alpha feel so welcome inside you. I'm going to reward you you so, so handsomely..." : "Do you want to be my beta that badly... or are you just love fat alpha cock that much?") + "\"</i>");
	output("\n\nYou can't put words to your response, and so you just moan for your lover, rolling your eyes back as she starts to move. She gives you slow, grinding thrusts for now, making you feel out each and every inch of her [ardia.cock] on the backstroke before driving herself back in hard enough to make you squeal. Her hands grip your [pc.legs] hard, refusing to allow you an inch of movement back every time her own hips come home again, each blow harder than the last. ");
	if (ardiaDomLevel() < 7) output("\n\nIt's not long before you start feeling a thick, wet heat spreading through your loins -- dzaanic pre, heady and intoxicating, leaking from the alpha's thick rod. The sensation is enough to make your head swim, setting all your pleasure-sensors aflame with lust for alpha cock.");
	else
	{
		output("\n\nThe sensation of being fucked -- no, of being <b>used</b> like the plaything you are -- is enough to leave you a drooling mess. Your hands grab at Ardia's, pleading with your alpha to pound you harder. She fixes you with a wicked smile and gives you exactly what you want: her tempo picks up, becoming a vigorous fucking that leaves her [ardia.balls] slapping against your [pc.butt] with every thrust. That's it -- that's what you need, what you <b>crave</b>! ");
		output("\n\nYou cum for her. You can't resist the pleasure of service, the allure of being the perfect cocksleeve for your alpha. Orgasm rocks your body between her rough, deep thrusts -- and act so expected and inevitably that Ardia only acknowledges it with a smirk and a leaking throb inside you, giving you your first taste of her sweet, intoxicating seed.");
	}	
	output("\n\nArdia starts sliding her hands up your flanks, not content to just leave you blissed-out beyond comprehension from the opening salvos. She leans in as her hands ride higher, and her heavy breasts press into your [pc.chest], so big that they make it difficult for their owner to lean in and kiss you. She gives it her all, though, practically humping you in her efforts to get in and lock lips with you, driving her [ardia.cock] deeper and deeper into your [pc.vagOrAss " + vagIdx + "].");
	output("\n\nWhen she finally manages to get your [pc.lips] entangled with her own, your bodies are pressed so tight together that you can hardly tell where yours ends and hers begins. All you know is pleasure, the wonderful submission of being hammered by your alpha over and over again, of being used like her personal fuckdoll. You can't help but cum, {hascock: painting the underside of Ardia's stomach [pc.cumColor]. Thick ropes squirt up between the dzaan-babe's tits, enough to make her giggle obscenely between kisses. //hasCunt: Your pussy draws her in as deep as it can, craving her cum even as your own juices are spattering her thighs.} ");
	output("\n\n<i>\"Hnnn, fuck, [pc.name]...\"</i> Ardia sighs, <i>\"I'm gonna cum in you, okay? Gonna fill that " + (vagIdx < 0 ? "ass" : "pussy") + " up!\"</i>");
	output("\n\nYou'd be begging her to, if you could actually form words in your state. Instead, you moan and wrap yourself around your alpha lover as the first thick ropes of her seed erupt inside your [pc.vagOrAss " + vagIdx + "]. Ardia's breath burns at your neck as she grunts and pants, humping hard against you while those cum-swollen balls unload their narcotic payload. " + (addictedToArdia() ? "You feel the rush of her inside you, the sudden elation of being filled by your alpha... and you cum again from sheer exaltation. You are <b>right</b> where you were meant to be..." : "Even unaddicted you still feel a rush of elation from the sudden, utterly-filling cumshot.") + " The scent of her jizz fills the cabin's atmosphere before you can blink, overwhelming you 'till your mouth's watering and your [pc.vagOrAss " + vagIdx + "] is aching with numbing pleasure. Oh stars you just might cum again...");
	output("\n\nBy the time you come to your senses, Ardia's resting on her elbows, smiling down at you. Her tits completely block your view down your body, but you can feel her hips slowly, lovingly grinding against your [pc.butt], working out the last little drops of her creamy cum. ");
	output("\n\n<i>\"You're");
	if (ardiaDomLevel() < 4) output(" so fucking hot right now. Oh gods... a girl could get used to this");
	else if (ardiaDomLevel() < 7) output(" really beautiful when you're leaking my cum");
	else output(" the best cum-rag an alpha could ask for");
	output(",\"</i> she chuckles, reaching in for another kiss. <i>\"Let me stay like this a while... or maybe until my balls are empty. I think I like that idea more.\"</i>");
	output("\n\nYes ma'am.");

	if (vagIdx < 0) pc.loadInAss(ardia);
	else pc.loadInCunt(ardia, vagIdx);
	pc.orgasm();
	ardia.orgasm();
	if (vagIdx < 0) pc.loadInAss(ardia);
	else pc.loadInCunt(ardia, vagIdx);
	ardia.orgasm();
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_MISSIONARY");

	addButton(0, "Next", mainGameMenu);
}

public function nomSumArdiaButt():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Wsan");
	processTime(15+rand(21));

	if (ardiaDomLevel() < 4)
	{
		output("<i>\"Bend over, cutie,\"</i> you tell Ardia. <i>\"Let me at that big beautiful rear of yours.\"</i>");
		output("\n\n<i>\"O-oh, okay,\"</i> Ardia says, eyes wide and cheeks red as she turns to present herself to you. Her curvaceous ass jiggles slowly as she bends at the hips, shifting her weight. <i>\"Is this better…?\"</i>");
		output("\n\n<i>\"Sure is,\"</i> you mutter, zeroing in on your prize. That " + (ardia.hasPlumpAsshole() ? (ardia.ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED) ? "big, soft fuck-ring" : "plump, protruding ring") : "sweet sensitive pucker") + " between her plush, squeezable buttcheeks -- but first, some teasing seems appropriate.");
		output("\n\nArdia moans quietly as you place your hands on her considerable waist and pull her in, planting a kiss on her round behind. You can feel her shiver at the intimate touch and that only motivates you further, kissing her all over while you draw closer to the eventuality of planting your lips on her " + (ardia.hasPlumpAsshole() ? (ardia.ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED) ? "dark chocolate donut" : "soft donut") : "cute little asshole") + ". Her entire body tenses in anticipation while you hover above it, your [pc.lips] less than an inch from her butt as you breathe hot air on her.");
		output("\n\nThough you can't see her face you can picture your squishy d'zaan lover biting her prominent lower lip and waiting, and you're not one to disappoint. Pushing forward you plant your lips on " + (ardia.hasPlumpAsshole() ? (ardia.ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED) ? "the thick caldera of her protruding butthole" : "the ridged caldera of her raised pucker") : "the dark creased folds of her puckered butthole") + " and kiss her with the passion of lust. The deep, contented groan you hear slip from Ardia's mouth is every bit as arousing as you'd imagined, your");
		if (pc.isHerm()) output(" [pc.cocks] growing hard and your [pc.pussies] dripping wet with arousal.");
		else if (pc.hasCock()) output(" [pc.cocks] growing hard.");
		else if (pc.hasVagina()) output(" [pc.pussies] growing wet with arousal.");
		else output(" core tensing as unfamiliar pleasure runs through you.");
		output("\n\nReaching around for the barest of touches, you run your finger along the long cumvein running up the underside of her half-hard " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "equine cock" : "d'zaan cock") + " and discover she's already dripping precum all over the floor. She gasps and her meaty shaft bounces up at your touch, teased into action before you withdraw your exploratory hand. You'll let her cum in time but it won't be with something as plain as a handjob.");
		output("\n\nRefocusing your intentions on the pliant orifice beneath your lips, you let your [pc.tongue] dip into the very border of the opening and enjoy Ardia's shaky sighs of happiness. " + (pc.hasLongTongue() ? "She doesn't at all expect the intrusion of your long, warm oral organ deep into her asshole, the " + (pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE) ? "prehensile muscle stroking" : "writhing muscle lashing") + " against her enormous prostate until you take her so thoroughly she might as well be impaled on your face." : "She's more than a little surprised when the tip of your warm oral organ slides into her asshole, flicking up and down and licking her all over. You can just barely reach the tantalizing surface of her enormous prostate, and you use that to your advantage."));
		output("\n\n<i>\"Oohhh! Ggguuh- f-fu- stars!\"</i> Ardia pants, her plentiful thighs trembling with the pleasure. <i>\"Oh- Ooohhhh-\"</i>");
		output("\n\nThough her body tightens up in automatic reflex, it serves only to bring your exploratory tongue in closer contact with her sensitized insides. Ardia's hips begin to shake and quiver as she gasps, crying out in bliss while you plunge your tongue in and out of her saliva-dripping hole. It doesn't take long for you to get the reaction you're looking for.");
		output("\n\n<i>\"Fuckfuckfuckf- gghhnng-\"</i> Ardia groans, her entire backside tensing up and then relaxing. A continuous stream of pearly translucent semen spurts from her hanging cock, drooling all over the floor while you " + (pc.hasLongTongue() ? "roll your tongue over her swollen prostate with gentle teasing motions." : "teasingly lap at her swollen prostate with the very tip of your tongue.") + " Her almost feral grunts of ecstasy are like music to your ears.");
		output("\n\nKept trapped in a state of continuous prostate orgasm, Ardia begins to groan louder and louder until she's cumming so hard you almost feel bad. Her plump body has broken out in sweat as she struggles to maintain her shaky footing, hands on her knees and massive ass thrust out to ensure you can keep doing what you're doing. It's about time you give her some proper reprieve.");
		output("\n\n<i>\"Oh-\"</i> she gasps as you place your hand on her half-limp cock and begin jerking her to hardness, squeezing the " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "thick, swollen flare" : "meaty head") + " until she's thrusting her expansive hips in time with you. <i>\"Oh! Oh! Oh, fuck, [pc.name]!\"</i>");
		output("\n\nThick, sticky wads of cream-white cum begin to pump intermittently from the end of her pulsating cock, her asshole tightening around your tongue as she tries her hardest to have a 'real' orgasm. Ardia's voice comes in short, halting gasps while you roughly jack her off, her pulsing balls emptying themselves of load after gooey load. Her pitch climbs higher and higher until, at last, she crests the peak and lets out a long, lingering moan of utter satisfaction.");
		if (addictedToArdia()) output("\n\nYou quickly replace your tongue with two fingers and swing around to her front, grabbing her throbbing cock and feeding it between your lips to get all of that thick, delicious cream pumped right down your throat. Oh, stars, you can feel the alpha seed satisfying your basest desires already… milking her like this was oh-so-worth it. With one hand gently squeezing her bloated nuts and the other wringing her cock out, you empty Ardia's cumtanks right down your gullet until you've drunk your fill, the excess leaking out around your cream-stained lips as you stand, brushing your d'zaan lover's hair out of her face and leaning in to kiss her.");
		else output("\n\nYou gleefully provoke her into ejaculating enormous, backed-up gushes of potent d'zaan seed onto the floor, wasting every last drop while she suffers through a tremendous climax. With one hand gently squeezing her bloated nuts and the other wringing her pulsing cock dry, you empty Ardia out until there's nothing left and stand back up, brushing her sweaty hair out of her face and leaning in to kiss her.");
		output("\n\n<i>\"Oh, St- mmh-\"</i> Ardia starts, her surprise evident but quickly fading as her eyes flutter closed and she plants her hands on your [pc.hips]. She kisses you back, her flagging cock hanging between your [pc.thighs] as you wrap your tongue around hers. <i>\"Mmmmm…\"</i>");
		output("\n\nYou part with a soft intake of breath and smile, rubbing your thumb over her puffy bottom lip to clear away the mixed saliva.");
		output("\n\n<i>\"Thanks for a good time, Ardia,\"</i> you tell her. <i>\"You're the cutest.\"</i>");
		output("\n\n<i>\"A-any time,\"</i> she murmurs, blushing. <i>\"I'll be here, [pc.name].\"</i>");
		output("\n\nYou give her a wave and step outside.");
	}
	else if (ardiaDomLevel() < 7)
	{
		processTime(30+rand(91));
		output("<i>\"Ardia… your ass deserves some worship,\"</i> you murmur, your hands caressing her broad hips and squeezing her [ardia.ass].");
		output("\n\n<i>\"It does, does it?\"</i> Ardia says, smiling. <i>\"Well, then. I guess you would know best, wouldn't you? Go right ahead.\"</i>");
		output("\n\nYou slip around to her curvy rear as she spreads her powerful legs for you, exposing her hanging nutsack and half-limp cock -- but as delicious of a sight as they are, they're not what you're here for right now. Instead you plant your hands on her jiggly asscheeks and spread them,");
		if (pc.isHerm()) output(" your [pc.cocks] growing hard and your [pc.pussies] becoming wet");
		else if (pc.hasCock()) output(" your [pc.cocks] growing hard");
		else if (pc.hasVagina()) output(" your [pc.pussies] becoming wet");
		else output(" your mind going blank");
		output(" in an instant at the sight of her flawless asshole. You kiss her ass a few times but your glittering eyes linger on her " + (ardia.hasPlumpAsshole() ? (ardia.ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED) ? "delicious raised chocolate ring" : "dark chocolate ring") : "dark creased folds") + ", and before a few seconds have passed you can't resist any longer.");
		output("\n\n<i>\"Ooohhh,\"</i> Ardia groans as you grip her trembling ass and indulge yourself in running your [pc.tongue] right up her pucker before prying it open and dipping deeper inside. <i>\"Ungh! Oh, <b>Steele</b>!\"</i>");
		output("\n\nYou dig deeper into her hot, wet insides as her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "equine shaft" : "thick dzaan dick") + " bounces upwards, sticky translucent precum dripping from the tip well before your tongue comes into electrifying contact with her enormous prostate. The moment it does, though, the reaction is immediate. Ardia tightens up and lets out a long-lasting groan as a thick glob of creamy cum splatters the floor, followed up by an everlasting stream of hot, gooey precum. Fuck -- you want some of that for yourself, but you're in too deep to consider stopping now.");
		output("\n\nInstead you reach over her expansive hips and start giving her bulging cock a loving reacharound, jerking the plump alpha off as she groans indulgently. You pleasure her without end until she's completely relaxed, sighing and moaning as you work her up from a prostate orgasm to a massive, mindblowing climax. Each oral ministration incites her to spew out yet more potent preseed, pooling on the ground as her cock hardens and grows, throbbing with pleasure.");
		output("\n\n<i>\"G-guhhff, fuck,\"</i> Ardia pants. She's sweating hard now, the bliss of continual prostate stimulation taxing her body. <i>\"Oh, I can <b>feel</b> it -- fuck, fuck, fuck-!\"</i>");
		output("\n\nThe closer she gets the harder she squeezes down on you, saliva dripping down her underside as she pants and huffs, getting closer by the second. When a tremor runs up from her calves through her arched spine, you know exactly what to do. Swapping your tongue for two massaging fingers in the midst of Ardia's impending orgasm, you greedily suck the " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "swelling flare" : "pulsing head") + " of the alpha's dick into your mouth right before she blows her top.");
		output("\n\n<i>\"Oh, FUCK!\"</i> she roars, grabbing your head and squeezing. It's like you've got your face under a running faucet. The flow of her sticky precum halts, then suddenly your cheeks are full of thick, hot spooge and the excess is being rapidly pumped down your unprepared throat. Your eyes bulge in surprise as the alpha lets loose her backed-up loads into your stomach, your throat swelling just to contain them. <i>\"Ohhh! Nnnnh!\"</i>");
		output("\n\nShe uses you like a condom, your tummy splashing and swelling with the sheer weight of Ardia's forceful ejaculations, each gigantic load immediately joined by its successor. Her womanly hips buck even as you keep your fingers trained against her prostate and rub her from the inside, stimulating her beyond the boundary of any regular orgasm. Teeth grit, she strains and strains, cumvein bloating with impossible volumes of dzaan semen before it erupts against the back of your throat and spews into your overtaxed belly.");
		output("\n\nBy the time she finishes and stumbles back, collapsing on the bed, you look like the beta cumslave you actually are. Thick white seed dribbles from the corners of your [pc.lips] as you fight to swallow the remnants down, the insides of your mouth and your throat all painted in the shade of Ardia's potent spooge. Already you can feel it delighting your senses, lulling you into a sense of complete and utter complacency.");
		output("\n\nA sensation of worshipful love falls over your mind, the desire to comfort your amazing alpha in her exhaustion overcoming any other feelings you might have. Leaning forward, you take her oversized ballsack in your hands and lift her gorgeous gonads to your mouth, closing your eyes and sucking them clean of sweat inch by inch. If the quiet moans coming from her mouth are any indication, she appreciates the attention at least as much as you do.");
		output("\n\n<i>\"Ooooh, [pc.name]...\"</i> Ardia moans, her hand finding the top of your head and rubbing you affectionately as you tend to her. " + (ardiaDomLevel() == 4 ? "<i>\"I love being with you.\"</i>" : "<i>\"You are such a good beta.\"</i>"));
		output("\n\n<i>\"Thank you, alpha,\"</i> you gurgle, mouth full of her balls. <i>\"Mmph- nmm.\"</i>");
		output("\n\n<i>\"Just keep working down there,\"</i> she sighs in happiness. <i>\"You've got a belly full of alpha cum, don't you? I'll let you know when you can stop.\"</i>");
		output("\n\nWhat if she doesn't tell you to stop? Well… you don't think you'd mind. You can feel the warmth of thick, fresh seed radiating from her bulging balls already, another massive load brewing inside these big, beautiful orbs ready for a daring beta to suck down and swallow. Taking a deep, wishful breath and inhaling her wonderful alpha musk, you can only hope she unloads it into you later today.");
		output("\n\n<i>\"Okay, [pc.name], that's enough,\"</i> Ardia says softly, your alpha's words cutting through the pink haze that's settled over your brain. <i>\"Good work, beta.\"</i>");
		output("\n\nThose words… they feel every bit as good as her cock. <i>\"Thank you, alpha,\"</i> you murmur, rising from between her legs and looking around. <i>\"How long was I…?\"</i>");
		output("\n\n<i>\"Sucking my balls and licking my cock?\"</i> Ardia suggests, looking over the top of her book with a smirk. When did she get that? <i>\"Dunno, a couple hours. You looked like you were having fun.\"</i>");
		output("\n\nA couple hours? You shake your head but try as you might, you can't clear the desire buzzing in the background of your mind. Instead your eyes track back to the tip of your alpha's cock and you bend back down to suck the drooling precum right off the glans. Your alpha grunts in approval and, free from the bondage to think for yourself for a moment, you step outside the room and leave her to reading. Wiping your mouth, you look around the ship.");

		pc.loadInMouth(ardia);
	}
	else if (ardiaDomLevel() < 10)
	{
		processTime(45+rand(121));
		output("<i>\"You want to lick my asshole? Go ahead,\"</i> Ardia says, a grin spreading across her pretty face as she turns around and bends over. <i>\"Fuck, you are <b>such</b> a beta, Steele.\"</i>");
		if (pc.isHerm()) output("\n\nYour [pc.cocks] grow impossibly hard as your [pc.pussies] begin to drip with arousal");
		else if (pc.hasCock()) output("\n\nYour [pc.cocks] grow impossibly hard");
		else if (pc.hasVagina()) output("\n\nYour [pc.pussies] grow dripping wet");
		else output("\n\nYour body is intoxicated");
		output(" at the mention of the difference in your status, impaling your ego on the " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "big, beautiful flare of the alpha's massive cock." : "thick, swollen head of the alpha's fat cock.") + " You feel like the biggest bitch in the whole wide universe as you kneel behind her with your legs apart and a hand on each plump asscheek, your alpha's " + (ardia.hasPlumpAsshole() ? (ardia.ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED) ? "plush, sensitive" : "soft ridged") : "soft little") + " asshole on full display. You can't possibly hold yourself back at this point.");
		output("\n\nYou press your face into her jiggly ass and plant your [pc.lips] directly on her pucker, giving your alpha's rear a deep, loving kiss while she purrs in contentment. Your [pc.tongue] slips out and deep into her behind, " + (pc.hasLongTongue() ? "the length of it ensuring you can get <i>right</i> up against her massive prostate and worship it with tender licks and laps." : "the tip just barely reaching her massive prostate and licking it as much as possible.") + " Reaching forward and around your lover's giant hips, you gently take her drooling, half-hard " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "horsecock" : "dzaancock") + " and rub her, stimulating her thickening shaft to a strong, full erection.");
		output("\n\n<i>\"Nn- aah… that's <b>good</b>. Good beta,\"</i> Ardia sighs in pleasure. <i>\"Keep that up and I'll let you catch my cum in your mouth.\"</i>");
		output("\n\nJust the promise of it is almost enough to make you " + (!pc.isCrotchExposed() && pc.hasGenitals() ? "cum in your [pc.lowerGarments]" : "cum on the spot") + ", your [pc.hips] jerking upwards");
		if (pc.hasCock()) output(" and precum beading at the tip of your swollen " + (pc.hasCocks() ? "cocks" : "cock"));
		else if (pc.hasVagina()) output(" and a stream of arousal dripping from your desire-inflamed " + (pc.hasVaginas() ? "cunts" : "cunt"));
		output(" before you restrain yourself. This moment is about <i>her</i>, about your alpha, and you're best off remembering that. The heady groan of erotic approval from up above when you begin to stroke her prostate is all you need to hear.");
		output("\n\n<i>\"Uuh… fuck, there's so much,\"</i> she moans gently, looking down at all the clear, sticky precum spilling from the tip of her rock-hard erection. <i>\"Mmm… bet you'd love to lap all this up, wouldn't you? Get me off properly and you can.\"</i>");
		output("\n\nYou pant and huff, inhaling the sweaty musk of Ardia's lovely nutsack hanging below you while you work your tongue in and out of the alpha shestud's asshole. It feels so right for you to be here serving her, slaving away to please her any way you can. Holding her jiggly asscheeks apart, you slide the warm wetness of your saliva-covered tongue deep inside her and get a deep groan of satisfaction from above as your reward.");
		if (pc.isHerm()) output("\n\n[pc.Cum] shoots from the tip of your throbbing " + (pc.hasCocks() ? "cocks" : "cock") + ", spurting onto the floor and dribbling down your shaft while your [pc.pussies] " + (pc.hasVaginas() ? "clench and " + (pc.isSquirter() ? "squirt" : "drip") : "clenches and " + (pc.isSquirter() ? "squirts" : "drips")) + "all over the ground.");
		else if (pc.hasCock()) output("\n\n[pc.Cum] shoots from the tip of your throbbing " + (pc.hasCocks() ? "cocks" : "cock") + ", spurting onto the floor and dribbling down your " + (pc.hasCocks() ? "shafts." : "shaft."));
		else if (pc.hasVagina()) output("\n\nYou cum right then and there" + (pc.isSquirter() ? ", squirting all over the floor and spattering your [pc.thighs]." : "."));
		else output("\n\nYou ignore it completely, too involved in licking and sucking on your alpha's pucker to even care. Instead you notice Ardia's " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "big equine" : "thick dzaan") + " cock getting even bigger and harder, then dimly realize she's talking to you.");
		output("\n\n<i>\"Did you just <b>cum</b>? You did, didn't you?\"</i> Ardia laughs, incredulous. <i>\"And you didn't even notice. What a dutiful beta you are.\"</i>");
		output("\n\n<i>\"Mmmhfm,\"</i> you affirm, feeling her meaty cockflesh throb between your fingers. <i>\"Mmmm.\"</i>");
		output("\n\n<i>\"Good [pc.boyGirl], good [pc.boyGirl],\"</i> the alpha stud sighs happily, shuddering. <i>\"Keep working for that orgasm, Steele. Think about how <b>good</b> it's going to feel pumping into your stomach… mmmm...\"</i>");
		output("\n\n<i>\"Mmmmphhk,\"</i> you groan, eyes rolling in your head. Fuck <i>air</i>, you need to feel your alpha's cock. Shoving your face into her ass and reaching forward with your other hand, you begin jacking her off hard enough to have her thrust her beautiful behind into your face. It doesn't take long for her to start grunting in what you know to be pre-orgasm pleasure.");
		output("\n\n<i>\"Oh, fuck, that's it,\"</i> Ardia groans, her thick thighs quivering and pulling inward. <i>\"Come here and get your reward, little beta.\"</i>");
		output("\n\nYou pull your tongue from the squeezing, saliva-dripping recesses of her asshole and switch to the alpha's front just in time. Seizing you by your " + (pc.hasHorns() ? "[pc.horns]" : (pc.hasHair() ? "[pc.hair]" : "skull")) + " she forces her swollen, pulsing cock down your throat and throws her head back with a dominant cry of release, unleashing an overexcited spray of alpha sperm down your yawning gullet.");
		output("\n\n<i>\"Ah! Aaaahh, <b>good</b> beta,\"</i> she growls possessively, pulling you into her groin until your dripping lips are securely planted at the base of her throbbing shaft. The steady rhythm of her thick cumvein beating against your tongue is almost hypnotic, lulling you into placidity while you gaze upwards and admire Ardia's beauty while she grunts, emptying her balls into you. <i>\"That's right, suck it aaaallll down. You don't want your precious ship to get dirty, do you, Captain? You'd better be a good little cumtank for me…\"</i>");
		output("\n\nYou want nothing more. Your entire brain is alight with a syrupy mix of desire and pleasure, your eyes locked with Ardia's as she grins down at you, the sheer display of her overwhelming dominance over your form extending you a pleasure you could never have discovered on your own. It's thanks only to this beautiful alpha that you can achieve this kind of ecstatic peak, and you know it. Bringing your hands up to her asscheeks, you cup and squeeze them while she works out every last drop of thick, sticky sperm into your hot little belly.");
		output("\n\n<i>\"There we go, isn't that right?\"</i> Ardia murmurs, stroking your head. <i>\"I'll bet you feel so much better with your stomach full of my cum, don't you, Steele?\"</i>");
		output("\n\nYour nod is slow, dull and nonverbal but it gets the message across.");
		output("\n\n<i>\"That's right,\"</i> she coos. <i>\"Just hold me in your throat and feel it all slosh around inside you for a while, [pc.name]. Do you want to finger my asshole?\"</i> she offers. <i>\"If you work my prostate right you can have even more!\"</i>");
		output("\n\nThe ensuing groan that morphs into a giggle is one of the sexiest things you've ever heard, and the smile that breaks out on her face as she slowly works her broad hips back and forth against your middle finger is even sexier. You're going to be here for a long time -- but when the trickle of concentrated sperm wells up from her quivering balls and splatters against the back of your spunk-slick throat, you lose all sense of time's passage. Instead you focus on hollowing your cheeks against your alpha's cockflesh and chugging down hot spunk, just like a beta should.");
		output("\n\n--");
		output("\n\nYou come to in a daze, snapping back to consciousness lying on your own bed. A stream of gooey cum runs from the corner of your mouth as you roll over to get up and your first instinct is to clap your hand over your lips and swallow it back, groaning in ecstasy as it rolls down your throat. Oh, <i>stars</i> -- you've never known such fulfillment. You find your codex lying next to you and, glancing at it, note the idle screen is set to… a picture of you, eyes rolled back and streaming spooge from your nose while your lips make contact with what is very obviously Ardia's groin.");
		output("\n\nIt takes you quite some time to get back up, though in truth most of the motivation springs from the fact you know your alpha is still onboard.");

		pc.loadInMouth(ardia);
	}
	else
	{
		processTime(15+rand(46));
		output("<i>\"Would you like it if I worshipped your ass, alpha?\"</i> you ask, eyes shining with fervor.");
		output("\n\n<i>\"Sure,\"</i> Ardia says with a shrug. <i>\"Lie down and let me grab a condom, [pc.name].\"</i>");
		output("\n\nYou don't know why either of those things are happening but far be it from you to question your beautiful alpha. Lying down on Ardia's bed while she fishes an XL condom from her bedside drawer, you're soon presented with the sight of the flawless d'zaan kneeling above your face like she's going to sit on it -- a prospect you can hardly wait to enjoy.");
		output("\n\n<i>\"I'm going to let you tonguefuck my asshole for as long as you like, [pc.name],\"</i> Ardia says, slowly wiggling her enormous ass from side to side. The sight is tantalizingly erotic. <i>\"And afterwards you can drink every last drop of alpha semen I spill into this condom. Doesn't that sound nice?\"</i>");
		output("\n\n<i>\"Yes, alpha,\"</i> you whisper.");
		output("\n\n<i>\"And I mean <b>every</b> drop, beta,\"</i> she says, looking back at you with a devious grin. <i>\"You'd better be prepared.\"</i>");
		output("\n\nThen her " + (ardia.hasPlumpAsshole() ? (ardia.ass.hasFlag(GLOBAL.FLAG_HYPER_PUMPED) ? "big, soft" : "plump") : "soft, sensitive") + " asshole is pressed to your tongue and you're desperately making out with her rear, swirling your tongue around the entrance before delving deeper into her hot, slick insides. You immediately seek out her enormous prostate, stimulating it with " + (pc.hasLongTongue() ? "gentle, loving caresses" : "the very tip of your tongue") + " while you hug her thunderous thighs. This is everything you could ever ask for.");
		output("\n\n<i>\"Aaaaahhh,\"</i> Ardia sighs in satisfaction, parked securely on your face as she reaches for her handheld. <i>\"Nnrgh… This is the fucking life…\"</i>");
		output("\n\nShe relaxes atop you as precum begins to slowly trickle and pump into the condom affixed to her meaty cock, " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "equine flare" : "swollen head") + " pulsing intermittently while the labors of your warm, wet tongue fulfill her needs. The minute tremors and quiet moans of indulgence from above you ring in your head like the peal of a bell, more rewarding than she could possibly know. Truth be told, you don't even need the promise of getting to drink her cum -- just being here for her to work off her needs is enough.");
		output("\n\nThe minutes pass by in relative silence broken only by the sound of you tonguing Ardia's pliant asshole, dipping in and out to stimulate her sensitive insides while she toys with her codex. Eyes closed and with a sweaty faceful of your overendowed alpha, you don't even notice your own");
		if (pc.isHerm()) output(" orgasms. [pc.cum] rolls down your stiff, swollen " + (pc.hasCocks() ? "shafts" : "shaft") + " unannounced, [pc.femcum] " + (pc.isSquirter() ? "squirts" : "drips") + " from your clenching " + (pc.hasVaginas() ? "pussies," : "pussy,"));
		else if (pc.hasCock()) output(" wasted orgasm. [pc.cum] rolls down your stiff, swollen " + (pc.hasCocks() ? "shafts" : "shaft") + " unannounced");
		else if (pc.hasVagina()) output(" empty orgasm. [pc.femcum] " + (pc.isSquirter() ? "squirts" : "drips") + " from your clenching " + (pc.hasVaginas() ? "pussies" : "pussy"));
		else output(" body rebelling against its biology, trying to orgasm and finding nothing. Your [pc.hips] buck once");
		output(" and your alpha doesn't deign to make mention of it. A beta's pleasure is, of course, secondary to hers.");
		output("\n\n<i>\"Ooohhh, this is going to be a thick load,\"</i> Ardia gloats, grinding her ass into your face. <i>\"Work it, beta. Watching you drink all this is going to- nngh! Going to be so much fun!\"</i>");
		output("\n\nShe's getting closer -- as if she wasn't telling you, you can <i>feel</i> it in the way she shifts and shivers, squeezes and sighs, and you're only too eager to make it happen. Pulling her down on top of you and cutting off your air, you thrust your dripping tongue into her asshole and kiss her as hard as you can.");
		output("\n\n<i>\"Oh, that <b>passion</b>,\"</i> she groans, her legs beginning to tense up. <i>\"H-here it comes... nnnnnggghh!\"</i>");
		output("\n\nArdia's plump thighs squeeze your head as she cums, jets of thick, hot alpha spunk filling the condom. At the sound of the latex stretching and your alpha's melodious groans of exertion, you discover you were lying to yourself -- you <i>do</i> need that delicious, creamy alpha seed, and you need it <i>bad</i>. A muffled moan escapes your lips as Ardia relaxes and sighs, setting you free of your leg-induced bondage.");
		if (ardia.hasPerk("'Nuki Nuts")) output("\n\n<i>\"Oh, you poor beta,\"</i> she murmurs, bending over to pat your [pc.thigh]. <i>\"Don't worry -- I'm putting on a second one -nnh! Right now. Just in time, too, you're really making me cum! You just ignore my cock and focus on my ass, okay? Remember, a reward feels <b>so</b> much better if you work for it.\"</i>");
		else output("\n\n<i>\"Oh, you poor beta,\"</i> she murmurs, bending over to pat your [pc.thigh]. <i>\"Don't worry -- I'm still- nnh! Still working on filling this one to capacity, babe. You just ignore my cock and focus on my ass, okay? Remember, a reward feels <b>so</b> much better if you work for it.\"</i>");
		output("\n\nShe's right, and of course she is. She's the big, beautiful alpha with her fat cock and gorgeous balls, and you're tongue-deep in her quivering asshole. Right now she's <i>everything</i> to you, and the desirous little shiver that runs down your spine at the thought of wholesale swallowing down her thick cum straight from her used condoms is only proof. Stars, you can hardly wait, but your alpha was very specific. She told you to focus on her soft, delicious chocolate asshole and not the- the " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "thick, meaty, sweat-covered hulk of an equine <i>studcock</i> hanging" : "amazing keratin-coated article of a stud's cock") + " between her wonderful thighs, backed by the enormous balls splayed across your [pc.chest]. And that's what you're doing, right down to the letter.");
		output("\n\nYou tonguefuck her to yet another strong, long-lasting orgasm that has your alpha weak in the knees, moaning in pleasure while she fills yet another condom up with roiling spunk. She says nothing to you as you get increasingly desperate, excitement mounting until at last, she lifts herself off your face and lets you get some fresh air. The alpha pheromones swirl through your mind, evaporating any cogent thought you had prior.");
		output("\n\n<i>\"Sorry, [pc.name]. I just wanted to feel what it was like when my beta started to get… frantic,\"</i> Ardia says, smiling down at you. <i>\"Are you ready for a drink?\"</i>");
		output("\n\n<i>\"Please,\"</i> you moan, reaching up for her as she takes your hand. <i>\"I need your alpha cum.\"</i>");
		output("\n\n<i>\"Oh, I <b>like</b> hearing that,\"</i> she purrs. <i>\"Here. Open your mouth, 'Captain'... time to swallow my spunk.\"</i>");
		output("\n\nShe slices the tip off the bulging condom off with a fingernail and puts it to your mouth, slowly upending it as you drink in the thick, sticky jizz. It tastes different when you don't suck it straight from her cock, but it's a flavor you're already learning to love. The still-warm cream rolls down your gullet as your alpha hoods her eyes and coos in approval, watching your throat bob and work to get it all in.");
		output("\n\n<i>\"Oh, yes,\"</i> Ardia whispers, biting her bottom lip. <i>\"You like that, don't you? Working so hard for big, generous alpha loads. That's what you get off to, isn't it?\"</i>");
		output("\n\n<i>\"Mmhhmm,\"</i> you gurgle, not wanting to nod lest you spill even a single drop. <i>\"Glk- mmgbl.\"</i>");
		output("\n\n<i>\"Ssshh… just swallow it all down, Steele. There's still another condom to go, don't forget,\"</i> she says, smiling wide. Reaching down, she rubs your already-pudgy tummy. <i>\"Oh, it's warm. Hmmhh… what a wonderful little cumtank you are. Better than the condoms, aren't you?\"</i>");
		output("\n\nThis time you're too dazed to even reply, your eyes crossing as the pleasure of drinking alpha seed overwhelms your brain. All you know is how to swallow and how to breathe and right now, the second one doesn't seem as important.");
		output("\n\n<i>\"Good [pc.boyGirl],\"</i> Ardia murmurs, letting you lick the remnants out of the first condom as she brings up the second. <i>\"Ready?\"</i>");
		output("\n\nYou surprise her by reaching up and wrapping your [pc.lips] around the opening and sawing it loose with your teeth, letting the fresh contents spill across your tongue and into your open mouth. An approving chuckle resounds in your ears, though you don't really know where from. It's all you can do to focus on what's right in front of you: a pipe bursting with hot, thick alpha semen.");
		output("\n\nBy the time you've swallowed it all down, you're awash in bliss. Ardia watches trails of her sperm leak from the corners of your upturned lips as you smile up at her, writhing invitingly on her bed.");
		output("\n\n<i>\"God, fuck, watching you like this has gotten <b>me</b> in the mood,\"</i> Ardia mutters, reaching down to grip her thickly erect cock before gently slapping your thigh. <i>\"Lie on your stomach, you cumdrunk beta slut. I'm going to pound the fuck out of you.\"</i>");
		output("\n\nGiggling, you turn yourself over and moan in decadent ecstasy as she forces herself into your [pc.vagOrAss]. Oh, stars, you're cumming already…");

		pc.loadInMouth(ardia);
		pc.orgasm();
		ardia.orgasm();

		addButton(0, "Next", function():void
		{
			clearMenu();
			clearOutput();
			showArdia(true);
			author("Wsan");
			processTime(30+rand(91));

			output("When you rediscover conscious thought, everything is a little confusing. You're still in Ardia's room but everything is moving and shifting, blurring before your very eyes, and there's heavy panting in your ear. It's only when she hilts herself and lets out a groan before biting the back of your neck that you figure it all out, the throb of her turgid cock sending bolts of pleasure up your spine. Your back arches so hard you throw your head over her shoulder, a high-pitched moan of utter slutty pleasure spilling from your parted lips as alpha cum pumps inside you anew.");
			output("\n\n<i>\"Uh! Fuck,\"</i> Ardia curses, gripping your waist with her sweaty hands. <i>\"Still not enough… god, you are so fucking sexy...\"</i>");
			output("\n\nHow long have you been here… it doesn't matter. You're being bounced up and down on your alpha's stiff, upright cock -- nothing else is important. You pant laboriously as she fills you with cum over, and over, and over until she finally drains herself dry and pulls you off her with an exhausted groan, arm wrapped around your swollen midriff.");
			output("\n\n<i>\"Fuh… fuck,\"</i> she moans, pulling you closer. <i>\"Come here.\"</i>");
			output("\n\nShe takes your lips, kissing you so deeply your eyes flutter fully open, your tongue wrapped up in hers before you can even realize what's going on. The sheer passion of your alpha enthralls you, capturing your heart and mind so thoroughly you can't help but orgasm at the feeling of it. Neither of you pay the slightest hint of attention to it, too intent on sucking on each other's tongues to even notice. You fall deeper and deeper into her grip, loosening your hold onto reality until a hand{has hair: in your [pc.hair]/else: on the back of your head} drags you back to gaze at your alpha lover, your tongue still hanging out of your mouth and drooling spit.");
			output("\n\n<i>\"God <b>damn</b> I love making you look like this,\"</i> Ardia growls possessively before rolling onto her back and heaving a sigh. <i>\"Go nap in your room, [pc.name]. I think we both need some… fresh air. Otherwise I'm liable to keep you in here for the fucking week.\"</i>");
			output("\n\nYou kiss her on the cheek and happily pad back to your room trailing cum down your [pc.legs] the whole way, collapsing on your bed and passing into an undisturbed sleep before your heavy head even hits the pillow.");
			output("\n\nUpon awakening, you find everything has gone back to more-or-less normal -- the same universe you've always lived in, albeit duller-looking and less fun than it was a few hours ago. But of course, you know who you can go and see to fix that...");

			pc.loadInMouth(ardia);
			pc.orgasm();
			ardia.orgasm();
			pc.loadInMouth(ardia);
			ardia.orgasm();
			IncrementFlag("SEXED_ARDIA");
			IncrementFlag("SEXED_ARDIA_RIM");

			addButton(0, "Next", mainGameMenu);
		});
		return;
	}

	ardia.orgasm();
	pc.maxOutLust();
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_RIM");

	addButton(0, "Next", mainGameMenu);
}

public function succSomeArdiaNuts():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("William");
	processTime(2+rand(4));

	if (ardiaDomLevel() < 4)
	{
		output("Ardia's balls have been on your mind since they struck your [pc.thigh]. Nothing a dzaan alpha could be packing is more important than her nuts. The elfin hermaphrodite's seed is an addictive narcotic");
		if (ardiaDomLevel() > 0) output(" as you're intimately aware");
		output(", but the mesmerizing wobble is on another level entirely, fixing the desire to fondle them in your mind. " + (ardiaDomLevel() == 0 ? "You're not hooked to her like some simpering beta... but you want to get your [pc.hands] on those. You got her all hot and bothered, it's the least you could do." : "You <b>must</b> warm those fleshy spheres between your [pc.hands], mix up some of that delectable cum. A hit of it is just what you need to quell that tingling urge in the back of your mind."));
		output("\n\nThe chubby alpha expresses glee in mirthy vocals - you peck her on the lips, caress her hip, all while sinking deep into the gulf of her smothering thighs. Ardia's ham-legs close up, tucking you into an embrace of infinite warmth. <i>\"Oooh...\"</i> she coos, peering around her [ardia.cockNoun]. The sheer heat of her musky shelter squeezes inhibition from your brain");
		if (pc.isBimbo() || pc.isDependant(Creature.DEPENDANT_CUM)) output("; you smooch her rod from center mass to leaky peak, swirling your tongue over her urethral slit to draw out a scrumptious, gooey taste of herm-pre.");
		else if (pc.libido() < 33) output(". You take a quiet whiff of her member, a feeling of security following her pheromones into your mind.");
		else if (pc.libido() < 66) output("; you give her [ardia.cockHead] a kiss of drooling desire, filling your nostrils with the scent of hypnotizing herm.");
		else output(" - you give her undergirth a long, loving lick, slurping at the tip and pulling away as a glob of precum expands on her [ardia.cockHead].");
		output(" <i>\"You've got a really sensual side, captain! So, what are you going to do down there?\"</i>");
		if (pc.isBimbo()) output("\n\n<i>\"Duh!\"</i> You grin dreamily, swooning before the words even leave your mouth. <i>\"Suck your big and yummy balls of course!\"</i>");
		else if (pc.isBro()) output("\n\nYou stroke a finger across one testicle, giving her <i>the look.</i>");
		else if (pc.isNice()) output("\n\n<i>\"I'm going to show your balls the love they deserve,\"</i> you say, cupping a testicle affectionately.");
		else if (pc.isMisch()) output("\n\n<i>\"Suck your nuts.\"</i> The answer is delivered coyly and mischievously, but it is sincere.");
		else output("\n\n<i>\"Let me worry about that,\"</i> you say, exhaling over her testicles.");
		output("\n\n<i>\"I'm happy to be part of this plan!\"</i> Ardia giggles, leaning back and pushing her crotch out. <i>\"By all means, [pc.name], dig in!\"</i>");
	}
	else if (ardiaDomLevel() < 7)
	{
		output("Something about Ardia's words nags at you - <i>how will you serve her?</i> Why does that make you fret? You look straight into the dzaan alpha's sapphire eyes. Her irises widen in excitement, and you're pulled into a cerulean heaven without borders of any kind. A soothing warmth spreads over you. The waiting herm smiles, and you dive down figuratively and literally, nestling yourself between cushiony thighs larger than your head. They scissor you into a protective embrace that puts you beneath her [ardia.cock] - its " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "equine" : "nubby") + " shape casts a ponderous phallic shadow over your [pc.face].");
		output("\n\nYou gaze at her balls and lick your [pc.lipsChaste]. You crane your head up, depth of field making her mast a downright hypnotizing expression of sexuality - you lick them again. Then you meet her eyes once more, find another, even hotter atmosphere. <i>\"Looking a little cock-drunk, [pc.name]. Maybe I should say ball-drunk, though?\"</i> Ardia laughs, stroking your [pc.hairNoun]. She's not wrong: you <i>are</i> a little dizzy being this close to her. <i>\"If you're trying to get me off with acting talent, it's working so far! I'd love to see how you perform on a pole. Maybe I should get one installed, or maybe we could visit a club someday? I bet you'd love the chance to show your alpha how you can dance!\"</i>");
		output("\n\nHer touch spurs you into action - you cup her testicles reverently, blinking, leaning close to gently nuzzle your head into the center of her purpose-affirming scrotum once again. Nose-deep in her testicular heath, you turn to the left and inhale. Ardia's alpha-scent permeates your being, reminding you just how important it was you put yourself " + (pc.hasKnees() ? "on your knees" : "in this position") + ", prepare to orally satisfy her. You turn to the right and exhale, luxuriating in the sumptuous heat and vibration of a gratified domme.");
		if (pc.isBimbo() || pc.isDependant(Creature.DEPENDANT_CUM)) output(" You smooch, lick, suck, rub, whatever! Her balls are so perfect and round, always heavy with cum. Refractory periods are a downright myth to dzaan, and you <b>love that!</b> You should really answer when spoken to, though. Minding your manners is important, but you still whimper.");
		if (pc.libido() < 33) output(" Before giving your answer, you plant a lovely kiss on each nut before looking up, lips tingling with submissive bliss.");
		else if (pc.libido() < 66) output(" You steal a long, thirsty lick across both heavy nuts, turning to answer with a saliva-coated grin.");
		else output(" You lick and lap at her 'nads, mopping and kissing until they're consecrated in sloppy affection - it takes you much too long to give an answer, and when you realize your mistress is waiting for one, you feel terrible.");
		if (pc.isBimbo()) output("\n\n<i>\"I wanna suck your balls!\"</i> you tell her in the most plaintive voice you've ever used, batting your eyelashes and smiling from ear to [pc.ear]. <i>\"I want aaaaall your cum, mistress!\"</i>");
		else if (pc.isBro()) output("\n\n<i>\"I'll take care of these,\"</i> you murmur, rubbing one of her nuts.");
		else if (pc.isNice()) output("\n\n<i>\"I want to show you how much I love these,\"</i> you declare, invariably getting distracted by the heft and wobble of your alpha's balls again. <i>\"I want to see them when I sleep.\"</i>");
		else if (pc.isMisch()) output("\n\n<i>\"I want to see these every time I think about you.\"</i> You cock your head and stare longingly at Ardia's balls again, smirking.");
		else output("\n\n<i>\"I just want these,\"</i> you say simply. Your infatuation with Ardia's balls is such that just by looking at them you feel a supernatural relief.");
		output("\n\nWatching you demur to her nutsack gets the buxom beauty all atitter. Ardia pats your head with soft praises, <i>\"Good [pc.boyGirl].\"</i> It probably won't be long before you lack the wherewithal to make such an admittance so pleasing to her. <i>\"Go ahead, [pc.name].\"</i> She breathes a subtle balm into the air. <i>\"They're all yours. Worship them like a beta should.\"</i> You feel the percussive beat of your heart everywhere. <i>\"Service your alpha.\"</i>");
	}
	else
	{
		output("Patiently, you wait in the nexus of Ardia's thighs, the very center of your alpha-mistress' attentions. Loyally, you fix your eyes to her [ardia.cockNoun], knowing your place. You lick your lips to tantalize her, shift your [pc.hips] back so that she can see your [pc.ass]");
		if (pc.hasBreasts()) output(" - the motion thrusts your heaving breasts forward. Erect [pc.nipplesNoun] jut out, shaking just out of her view");
		output(". You inhale, shivering from the flecks of cum clinging to the sensitive places in your mouth. You can't imagine going an hour without her taste on your tongue, let alone her undivided attention.");
		output("\n\n<i>\"[pc.name].\"</i>");
		output("\n\nYou look up, devotion glowing in your [pc.eyes]. You're so excited, so ready to be used. It's a satisfying and oh-so refreshing emotion to be ordered around, to be so <i>useful</i> to your mistress! The speed at which you and Ardia have embraced your roles always hits like a freighter when you remember it. Void, One... meeting her has been the best thing to ever happen to you.");
		output("\n\n<i>\"My beta,\"</i> she hums, patting you on the head, rewarding your affection");
		if (pc.hasEmoteEars()) output(" with plenty of ear scritches");
		output(". <i>\"Look here.\"</i> You follow her fingers to the wonderfully engorged " + (ardia.hasPerk("'Nuki Nuts") ? "mountains" : "apples") + " of her ballsack. <i>\"All of my harem should know how to bring my balls to a mirror shine, but it will be the performance of my favorite nut-servant that shows them how to serve me. . [pc.HeShe] won't get any rewards otherwise.\"</i> ");
		output("\n\nArdia trills playfully; you close the distance, pursing your [pc.lips] into an oh against one, inhaling every molecule of her savory redolence, blushing passionately. <i>\"Clean them, polish them - you'll be doing this for me every day when we settle down from this task of yours.\"</i> You believe it, and you so badly wish that day was <b>NOW!</b> <i>\"Begin, [pc.name]. Let me know that my best beta will lead [pc.hisHer] future harem-mates by <b>verrrry</b> thirsty example.\"</i>");
		output("\n\nYou breathe in that fine sexual bouquet - it's never enough. There's no other fragrance like Ardia's. No matter how sexually amped someone gets, their odor will always be pungent and sour in comparison. You kiss a spot you know tickles her fancy every time, smear yourself in sticky obedience until your head swims. She's given you permission, not that you needed it. You, [pc.name] Steele, are a beta. You repeat the action, and she grunts with delight, eager to flood your throat with fresh cum - she wants to give it to you, but you have to earn it; you suck so hard on her testicle that a staticy fizz builds in your mind. You could do this all day. ");
		output("\n\nIn fact, you will.");
	}

	pc.maxOutLust();

	addButton(0, "Next", continueLickingArdiaNut);
}

public function continueLickingArdiaNut():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("William");
	processTime(15+rand(6));

	output("Ardia's addictive musk enters your mouth seconds before you plant your [pc.lipsChaste] to her right nut, orally fondling the contents as you set your [pc.tongue] to the important task of ball worship. The heat of her throbbing cock resting on your head combined with the taste of salt - pre and sweat blended - conjures up a shudder of bodily euphoria. You cast a curtain of saliva over the eastern moon of her harem-maker, descending into the crevice at the center and diving down to the tautened bottom of her weighty sack by the tip of your servile organ.");
	// ardia Hyper Balls
	if (ardiaHugeBalls())
	{
		output("\n\nArdia's balls were acutely receptive to the liberal application of 'nuki nutbutter, plumping into massive moons capable of feeding entire cities of betas. Each nut is twice the size of your head, and both together could smother your entire upper half if they weren't causing planetary catastrophes from being jostled. All you want to do is <i>hug them.</i> They engulf you, draw you deeper into a dark, quiet, pulsating realm. You hear her heartbeat, you hear yours. You swear you hear the gurgle of fluid ecstasy behind the smooth, cum-taut surface of these casks. You lick, but it's half-hearted - you're simply too enraptured by the radiant <i>glow</i> of these balls.");
		output("\n\nWhen someone said that space was the final frontier, they probably weren't wrong, but in the 32nd century the final frontier seems to be the pillowy expanse of herm-scrotum far too large for anyone else to carry around. Even a leithan would be immobilized and begging for help trying to carry this burden. Not " + (ardiaDomLevel() < 4 ? "Ardia" : "your alpha") + ", though. Dzaan were meant to have nuts this glorious. These over-sexed spheres are so engorged that they can't be contained by clothing, and that's not an embarrassment.");
		output("\n\nFar from it. Big balls are wonderful, they're <b>not meant to be contained.</b> Alphas need to show their prospective betas the feracity that will sustain them as part of legendary harems. This plump goddess' nutsack is a future celebrity in its own right. The universe itself will express shock and awe, go quiet so as to recognize the supremacy that exists within it. Once Ardia's ready, these will be the brazenly-exposed secrets to her unprecedented dynastic success.");
		output("\n\nWrithing, feeling horny and needy, you throw your soul into the act of nut-polishing. Minutes pass and you cover barely half of one tight testicle in saliva. Oh your mouth waters powerfully, and there's a monstrous scent in the air to help with that, but you're just one [pc.raceShort]. You're one slobbering [pc.boyGirl] against a breeder's girthy horizon. <i>Challenge fucking accepted.</i> You need to make them feel good, and if that means swimming against the " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "inky" : "caramel") + " tides then that's what you're going to do. You can use your arms to part the rich oceans, smear your fealty across this empress' package.");
		output("\n\nYou kiss, you suck, you pull, and you <i>wear</i> these bloated nuts because it's what you need to do.");
		if (pc.hasLongTongue()) output(" Good thing you have a longer tongue than most! Everyone in her harem's going to need <i>at least</i> that!");
		output(" Ardia is a fluttering, moaning thing above you, beholden to the raw sensual pleasure you visit upon her plush balls one avid, luscious lick at a time. By the time you've reached the end of a once-scopeless stretch of glistening testicular terrain, you're also wearing your spittle as sort of a hood and mask combo. Extreme thirst drips from your chin and cheeks, and then you're looking up the next mountain, knowing you have a long and gainful climb ahead.");
	}
	// ardia Regular Balls
	else
	{
		output("\n\nInstinct and obedience shift your body into a more appropriate shape, making " + (ardiaDomLevel() < 4 ? "Ardia's" : "your goddess'") + " balls the jewels in your crown. You weigh them, hold them overhead, set them at the center of your mind, body, and sight, and lick with panting desire, tracing circuits around the underside of her spunk-generators. Seeking out pliable and unpolished inches requires you cross your eyes. You groan too, " + (ardiaDomLevel() < 4 ? "adding your voice to the symphony of pleasure conducted at the point of your slavering muscle." : "it's impossible not to. You want to show your mistress how eager you are to please her, to feel her love leap up from these twin vessels, splash your cheeks and pump your belly full of liquid divinity."));
		// pc No SnakeByte (append, no new PG)
		if (flags["USED_SNAKEBYTE"] == undefined)
		{
			output(" The juicy girth of both balls is too big to take past your [pc.lips], so you do the next logical thing: suck on them. Spreading your [pc.lipColor] suckers to their absolute limit, you bounce and jiggle her cum-pillows with gasps capable of decompressing a starship. <i>\"Mmyuss... that's the stuff, [pc.name]. " + (ardiaDomLevel() < 3 ? "That's how you make others jealous" : "That's how you're going to get my other betas to work harder. Make sure tooooh... to practice that") + "!\"</i>");
			output("\n\nLifting them proves to be an impossible task");
			if (pc.hasLongTongue()) output(", even with your amount of tongue-flesh");
			output(". The futa babe's ripe nuts obey the laws of gravity rather than the sinuous interloper paying depthless homage to their bottomless power. It's difficult to provide adequate service to supremely proportioned herms, but it's your ingenuity that freed Ardia and by the One it's your ingenuity that will find ways to appease her! You glory in the refreshing breaths you take of air permeated with fecund dzaan, inhaling so hard that you bring her balls into a moist embrace, carrying them with your [pc.lips] in a sucking kiss that grips as fiercely as a milker.");
		}
		// pc SnakeByte (append, no new pg)
		else
		{
			output("\n\nWith the single-mindedness of a tailor-made cock-sleeve, you put things like <i>\"too big\"</i> out of mind by stretching your Snakebyte-augmented jaw open and swallowing one of the plump amazon's orbs into your mouth, washing the queen-sized testicle at the center of your wet hole, bouncing and jiggling it around in your possessive dampness. <i>\"" + (flags["SEXED_ARDIA_NUTSHIP_SNEK"] == undefined ? "Woah... [pc.name]... h-how do youuu ohohhhh... that's awesome! [pc.name], you've gotta... do both... oh yyyesssss...!" : "I love those things you can do! Mmfff, [pc.name], that's just amazing... oh Goddess, it's like you're trying to persuade me to keep you as my only " + (ardiaDomLevel() < 3 ? "lover" : "beta") + "!") + "\"</i>");
			output("\n\nAfter thoroughly sloshing one tremulous nut you do the same for the other, pulling it into the swampy wonder located between throat, cheek, and tongue to wash it, impassioned gurgles bubbling up around the spunk-sphere. There's that deliciously perverse flutter in your heart when you see Ardia's face widen with gratification, oboe-noted pleasure in her heavy exhalations. Nothing she does can adequately convey her appreciation and gratitude for this, but you're okay with that. Just seeing and feeling her squirm, knowing you can do that to her at any time... now that's something to smile about!");
			flags["SEXED_ARDIA_NUTSHIP_SNEK"] = 1;
		}
	}
	output("\n\nFrom the ground of her left testicle you rise on the perfect curve of virile girth, drooling over the hypnotic measurement too big for one shaky palm. A burning-hot blush sweeps across your [pc.face] when Ardia grasps for your [pc.hairNoun], pressing you nose-first into her royal bulgehood with a thigh-clenching groan. <i>\"" + (ardiaDomLevel() < 3 ? "Hehe, just saw a little opportunity! How about some more kisses while you're there?" : "Kiss them again, [pc.name]. I love when you leave little marks behind.") + "\"</i>");
	output("\n\nYou obediently pucker your lips into a slavish pout and lay on one, two, more than you can count. Eyes dilated, you help churn the butter mixing inside her rotund 'nads, trembling from the tickle of your own spit and the gourmet taste of wanton hedonism. <i>\"Mmm, I love that part right there, give me a lick down the middle, too... yeaaahhh...\"</i> Your [pc.fingers] begin to sink into the doughy flesh of Ardia's ballsack, and your face becomes part of the milking effort - you flex your neck left and right, using your [pc.skinFurScalesNoun] like a testicular mop. <i>\"Ooh- oh! That's the spot!\"</i> The alpha's testicles swaddle you in a heavenly blanket of shifting ballflesh swollen out with goopy semen.");
	if (ardia.hasCock(GLOBAL.TYPE_EQUINE)) output("\n\nObtaining a sturdy horse-cock has lent Ardia's fluctuant balls a different kind of texture. Instead of the soft, cocoa-colored flesh that begged to be squeezed, her beta-generators are engloved in a thick, leathery sheath to match the black equine slab throbbing on your [pc.hairNoun]. They have a firm quality that doesn't wrinkle, that remains smooth and shiny throughout your obeisant ministrations. They taste virile, and thanks to her animalistic endowment, they have a small ingredient that lingers on your palate, something feral and bestial... befitting one who claims mates. You can almost see your reflection in the epicurean gloss, too, twisting and contorting as they clench and contract.");
	else output("\n\nThe pliable warmth of Ardia's supple spheres invites a deeper exploration. Just a little grip strength and you're submerged in an ocean of undulating umber, touching the simmering surface of a powerful spermy prize you can't possess. Her silky balls squirm and wobble to give room; tracts of seed-glutted softness squish between your [pc.fingers] into large, suckable excesses of skin delineated by the occasional wrinkle and rippled by the brisk beat of her racing heart. The flavor of her swelling virility seats itself firmly on your palate, whispering promises of assured procreation to your primitive side in return for obeisance.");
	// pc Not Taur, Has Genitals, DM 4+
	if (ardiaDomLevel() > 3 && pc.hasGenitals() && !pc.isTaur())
	{
		output("\n\n<i>\"[pc.name],\"</i> Ardia hums, <i>\"why don't you see to your own needs, too?\"</i> You feel a foot press near your groin, delivering a subtle command to debase yourself.");
		if (pc.isHerm())
		{
			output(" You realize just how hard your [pc.cocksIsAre] stretching, aching for contact that you quickly provide");
			if (!pc.isCrotchExposed()) output(", fishing " + (pc.hasCocks() ? "them" : "it") + " out of your gear");
			output(" - your [pc.pussies] too!");
		}
		else if (pc.hasVagina()) output(" Bursts of sensitivity and pleasure crack through your groin when you instinctively" + (pc.isCrotchExposed() ? "" : " pry your clothing away and") + " fit a finger or three in your [pc.pussies], stirring the heady juices streaming from needed contact.");
		else output(" The rigid strain in your [pc.cocks] becomes apparent - how long have you ignored yourself for Ardia? You set about it" + (pc.isCrotchExposed() ? "" : ", exposing your crotch to the air") + " and pumping your [pc.cocksLight] for all they're worth.");
		output("\n\n<i>\"Good beta,\"</i> she purrs, clutching you tighter. <i>\"Moan for me. I want to feel your voice on my balls and through my cock.\"</i> She's moaning herself with your lusty vocals fanning through her maleness, even to the cunt fit snug behind her beefy plumpness. You service her and yourself with rough urgency, faps and slaps echoing off the bedroom walls. Oaken fingers massage your scalp and [pc.ears], and the erotic hit of tension-draining release adds another twitching wire to the tangled web in your brain.");
		if (ardiaDomLevel() > 6) output("\n\nVigorous masturbation follows. <i>\"Yes, [pc.name]. Consider this your reward - cum for your mistress. Show her how you really.\"</i> If you were groaning one octave deeper than you'd sound like someone in the orthopedic surgeon's waiting room. <i>\"" + (pc.hasCock() ? "Focus on your cock. When you stroke from the top down, lick me from the bottom up. What you feel right now is exactly how you make me feel, and it's fucking awesome, [pc.name]!" : "Pinch your [pc.clit], then stick two fingers in as deep as they'll go. When you do, kiss my balls. What you feel when you do that... oh yes! That's <b>exactly</b> how I feel, [pc.name]!") + "\"</i> Endorphins rush at her instructions, every word a guide on how to better please her and yourself all at once! You thrill at the orders given as you allow yourself to sink deep into this shudderingly pleasant state that loves to obey.");
	}
	output("\n\nHer pheromonal scent is indescribably potent. Honeyed richness clings to the roof of your mouth, reaches high in your nose, spins your head on a haze of sweetness. You become aware of all the leaking precum when you feel the ambrosia trickle past your lip - you lap it up, use it to lubricate the next kiss and suck, the next fervorous tonguing. Self-control dissolves into a luxurious fuzz the longer you tend the dzaan's flavorful balls, coveting the spunk inside. While you make that bed and lie on it, you consider this: every drop of her seed is more valuable than any stud's, be they New Texan, another alpha, doesn't matter. These are the delightfully sticky nuts of a woman with the potential to dominate the galaxy.");
	output("\n\n<b>It's that taste.</b>");
	if (ardiaDomLevel() < 3) output(" It gets to you, tantalizes you with the promise of a life in blissful subservience, a horny future buzzing with energy that gives singular purpose and unshakable peace of mind. You want it. Part of you fears losing your individuality if you ingested too much, but a much more significant part of you rattles the cage, demands you open your mind and your mouth, accept a big, fertile load and let your tongue swim through the creamy shallows. Ardia has no malicious intent, that's why succumbing to it feels like it would be right. You're in the place all her betas will be, demonstrating an attentiveness anyone would crave from a loyal, hard working servant. <i>You deserve the reward bloating her bronze plums.</i>");
	else if (ardiaDomLevel() < 6) output(" It's your treat - a plentiful treat that enhances your passion. That which never depletes reinforces just how right it is to be here, how good the decision was to accept her dominance. You're her first and most important beta. All you have to do is take this a little further and you'll be the shining star of her harem, showing the rest how it's done, how to properly please their mistress. And, stars, you love that idea so much it makes your [pc.thighs] quiver...!");
	else output(" It's enrapturing. You're serving her in the way that an alpha's betas must always perform, sliding your hands across juicy fields of fecund nutflesh. What's inside, what you're working so very hard to get, is a guarantee. It's an affirmation of who you are and what you'll become. The more you think about it, the wetter your worship gets and the harder she strokes her stiff cock. Of course you're trembling. The anticipation and excitement here is electric, it's mutual... maybe even symbiotic. You can't wait to explore what it truly means to be a beta as soon as this damnable quest for inheritance is over. But, fuck... why wait? It's so hard to care about doing anything else when you're beholden to a glorious woman whom requires your presence and love on a daily basis...");
	if (ardiaDomLevel() < 7)
	{
		if (ardiaDomLevel() < 4) output("\n\n<i>\"Oh, ffffaaah, [pc.name]! Keep that up and I'll... oofff!\"</i> You gasp when Ardia's legs shutter, clamping to your back in a pretzel shape and forcing you as deep as her meaty sack will allow. <i>\"Gonna c-cum... You're sooo good at this! If I ever get any betas I'll have to hope they're half as talented as you are!\"</i> Everything goes dark as you devote yourself to the elastic skin of her pressure-tightened ballsack. If you squeezed them right now, she'd probably cum, and it would be undeniably grand. <i>\"Mm... [pc.name]... I love this... I don't think I can-\"</i>");
		else output("\n\n<i>\"Mmmaaaahhh, that's... goodness, [pc.name]! Just a bit more!\"</i> Ardia tightens up and you're clenched in the lower body of an amazon who knows what she wants. She's so close to accepting her dominance, just as you are very, very close to accepting your submission to her. <i>\"Lick that spot again, there... right there! Yes! That's that beta's touch I've been waiting for! FFfFff.... If you want your reward, it's coming! Oh, f-f-fuck!\"</i>");
		output("\n\nYou push forward, licking up the livid shaft of Ardia's keratin-lined rigor, swirling the smooth alien outcroppings before locking with her one open eye. The sight of you in your depraved position is what knocks her on her ass in the figurative sense. She emits a girlish squawk and arches back, ardent lust surging up from her musk-furnaces in a visible and physical gush of satiety. The drenched apples tighten and squeeze, stuffing her shaft with overwhelming libido.");
		output("\n\nBefore she erupts, you have a split second to decide if you want to let her cum inside...");

		addButton(0, "Inside", takeALoadOffArdiasBalls, undefined, "Inside", (ardiaDomLevel() < 4 ? "Taking this load will be fine. Right? It's the polite thing to do." : "It'd be such a waste not to swallow!"));
		addButton(1, "Outside", dzaanNecklacesAreAllTheRage, undefined, "Outside", "Probably best not to become <i>too</i> addicted to a Dzaan...");
	}
	else
	{
		output("\n\n<i>\"Incredible, absolutely incredible, [pc.name]! This... ummff... there... there...! Thissss...\"</i> Ardia hisses through clenched teeth, grasping your head and batting her [ardia.cock] against it. The sizzling-hot girth of her dick strikes you like a bolt of lightning, and then she's taking hold of you like she would a favorite sex-toy. Conflagration stirs in her loins, setting fire to everything in your little world. The busty amazon pries her shimmery sapphire eyes open, husking at her suck-slut, <i>\"Open your mouth, and receive a beta's reward!\"</i>");
		output("\n\nPure delight leaps in your gut when you obey, thoughtlessly, uncaringly. You exist for her comfort - she shoves in, flattening everything on her path. Your addicted maw makes every accommodation for its owner's cock, stepping aside so that she has the pleasure of sinking into your throat. Ardia thrusts in and out, mashing her splendid sack to your chin faster, and faster.");

		addButton(0, "Next", takeALoadOffArdiasBalls);
	}
}

public function takeALoadOffArdiasBalls():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("William");
	processTime(7+rand(4));

	if (ardiaDomLevel() < 7) output("Throwing caution to the wind you slide up and go down on Ardia's [ardia.cockNoun], skewering yourself on the veiny inches of her hot cock. You suck it down with your cheeks and let it widen your" + (flags["USED_SNAKEBYTE"] != undefined ? " ribbed" : "") + " throat. That beautiful moment when orgasm rushes, that anticipation, is all the more vivid and exciting knowing that you're sucking down addictive bliss" + (immuneToArdia() ? " - being immunized doesn't change the fact that her sperm is special, that it turns anyone who takes it into the perfect subby cum-dump" : "") + ". There's that slight tremble, that ecstatic scream, and then the unspeakable rush of being filled.");
	else output("Ardia sheds a few pounds in her violent need to facefuck you, to help you get all that satiating seed. The amazon works fastidiously, jackhammering her [pc.raceShort] beta's clamped suck-hole with her hot and slimy [ardia.cockNoun], flinging spit and pre in her vicious drive to swell her dopey fuck-slut with euphoria. Her fingers dig into your skull while her [ardia.cockHead] dives to your belly, twitching. That delay before orgasm truly hits, that delicious and too-small period between work and reward, of maximum anticipation. This is the prelude to being a well-fed beta, and the submissive quivers that run through you serve to heighten your cottony glory.");
	// ardia Hyper Balls (used nutbutter once)
	if (ardia.hasPerk("'Nuki Nuts"))
	{
		output("\n\nLodged deep in your throat, Ardia's cock bulges with the torrential onrush of liquid tension. It's like being at the center of the action in a disaster movie - the mythological outpouring of seed crashes into you like rods from god, and there's only so much your stomach can take in the initial spurting. It shoots past the narrow band of your stomach and fills your outwardly-groaning belly to the limits of forced evolution. Or adaptation, one of the two. It's kind of hard to think with all that narcotic spooge pneumatically pumping into your innards with gusto and dominant aplomb.");
		output("\n\nThe crushing weight of the buxom alpha's male orgasm take its toll, and you become frightfully aware of just how large her glistening balls are, how much sperm can fit in there, and how most if not all of that magnificent reservoir is saturating your gut. Even before the liberal appliance of nutbutter, Ardia had the perfect pair, but now it's even more perfect. Indeed, having your intestines forcefully violated, your suckling throat flooded, your nasal passages filled to spurting like leaky faucets, that's what perfection is in this day and age. No matter how hard you gulp you can't keep it down, it is technically impossible. It comes at you so fast that you don't get to enjoy the wonderful, fuzzy euphoria that comes with ingesting a dzaan's seed until the gushing gallons relent.");
		output("\n\nEjaculate storms out of your mouth when Ardia pushes you back with her foot, sending you to the ground and on your back while she stands and takes direct command of her juicy [ardia.cockNoun], spunking her brains out. She pumps her rod and fondles her oversized 'nads, discharging vein-destroying loads of fresh, bubbly, heavenly, addictive, pure alabaster spunk on your body. By the third emission you're more cum than [pc.raceShort], able to do nothing but absent-mindedly ooze gloppy semen from every hole and spasm helplessly on a beta's deserved high and help rub the thick lotion into your flesh.");
		// ardia Giga Balls (used nutbutter twice, add-on to Hyper)
		if (ardiaHugeBalls())
		{
			output("\n\nBut if you thought she was done, you were dead wrong. Ardia shambles forward and practically falls over your head, sliding through your oral orifice and past all the cooling loads to pump out the remnants of her extended climax. Delicate hands caress your [pc.skinFurScales]. Fresh release plumps you a second time, adding to your curves in a way that only a dedicated alpha mate could. Sticky seed fills every nook again, though this assisted orgasm lacks all the physicality of her former ardor. In fact, you get to taste it this time. She thrusts back, fills your cheeks, then thrusts forward. The enjoyment you feel is thorough and oh-so palpable.");
			if (ardiaDomLevel() < 4) output("\n\nMaybe being her beta wouldn't be so bad...");
			else output("\n\nBeing a beta is great.");
		}
		output("\n\n<i>\"Ahhh... that was an experience!\"</i> Ardia coos, brushing sweat-greased hair from her face. In all the action her hair band had jimmied loose. Man, she looks great with it all down. <i>\"" + (ardiaDomLevel() < 3 ? "[pc.name], you're just the best. Carrying all this around is worth it just to have you sucking it all out! Hope you enjoyed your meal, because I'll always have plenty! If you want, of course, hehe." : "You, as my beta, are worth this burden, [pc.name]. I'll carry any weight if you make me feel that every time. Mmm... I think I really am spoiled.") + "\"</i>");

		pc.applyCumSoaked();
	}
	// ardia Regular Balls
	else
	{
		output("\n\nSinful palpitations portend the");
		if (ardia.hasCock(GLOBAL.TYPE_EQUINE)) output(" belly-deep");
		output(" eruption of " + (ardiaDomLevel() < 3 ? "Ardia's" : "your alpha's") + " phallus. You fit your mouth into a vacuum seal around her shaft, sheerest bliss bubbling through her urethra and exploding into your gut. Rippling esophageal muscles feel the heavy force of heat splashing into them, forcing the unfucked nerves into a clench of total surprise. The buxom goddess twists about in lurid orgasm, ballooning your neck with male fervor, addictive even without the sense of taste supporting it. Glistening nuts churn and gurgle, rubbing up and down your chin with pulsations of rutting overdrive. The second you feel her spooge careen into your gut, the fuzz-inducing jizz ascends or descends through the rest of you. Streams spurt through the rock-hard cock holstered to the hilt in your jaw, bracing your maw open a little wider as it crams you full of phallus-fattening volume.");
		if (ardiaDomLevel() > 3) output(" Your masturbations produce success, but your pleasure is a distant second to the importance of Ardia's.");
		output("\n\nArdia squeals her narcotic spunk deep down your throat, shallowly thrusting her keratin-cropped girth forward in something resembling a kegel twitch to maximize your servings. Fresh, frothy sperm saturates your core, flooding with gravid intensity. It demands you adapt, start expanding to house it all - you give a whimper of disappointment as the alabaster treat crawls back up, nowhere else to go. For someone of Ardia's size, keeping every drop down " + (pc.isDependant(Creature.DEPENDANT_ANY) ? "would be a feat, but you're dedicated to nut, and with cock-milking gulps you <b>do</b> prevent it from leaking. The groan in your neck is legendary, as is your adoration for the thick, hot cum permeating your innards." : "is next to impossible. There's just too much that you can't help but dribble a little of it down your mouth, and with that fat cock pressing your tongue down, there's no saving the trickling goop."));
		output("\n\nWith your tummy swollen out, Ardia's [ardia.cockNoun] withdraws, freeing your airway and intensifying the wonder which surrounds you. Your mind is awash with... things. It's a bed made of pure cotton spanning the far reaches of your cognition. Getting up from it would be like trying to get up for your soul-crushing nine-to-five. Fortunately, you don't need to get up. You have a messy, cum-flecked cock softening against your [pc.face] and a strong, feminine hand stroking your [pc.hairNoun] and neck for a job well done.");
		if (ardiaDomLevel() < 4) output("\n\n<i>\"Thanks for that, [pc.name]. That was just the best!\"</i>");
		else if (ardiaDomLevel() < 7) output("\n\n<i>\"If you can do that every day... ahhh, geez... you're really gonna make it hard to please a harem when you're so good!\"</i>");
		else output("\n\n<i>\"Good beta. [pc.name], it pleases me to no end that you're so capable. Even before you became mine, I always appreciated that spark of eagerness you had. I'm so glad it's not been muffled under all that cum, hehe.\"</i>");
	}

	pc.loadInMouth(ardia);
	ardia.orgasm();
	if (ardiaDomLevel() > 3) pc.orgasm();

	addButton(0, "Next", ardiaNutshipWrapup);
}

public function dzaanNecklacesAreAllTheRage():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("William");
	processTime(7+rand(4));

	output("Ardia may be a little disappointed you won't be swallowing, but she'll enjoy cumming. Nobody else could work her balls like that, bring her to this heavenly orgasm. You tease them a little more, then interlock a [pc.hand] with hers to help pump that [ardia.cockNoun] towards explosive finale. Her spunk-vein fattens in real-time, swelling beyond capacity to handle a sublime output. You feel it throb, grow a bit bigger and harder, even warmer. You feel your palm pushed back by the torrential strength of her surging spooge, and gladly assume a position that ensures full coverage and the best splatter..");
	// ardia Hyper Balls (used nutbutter once)
	if (ardia.hasPerk("'Nuki Nuts"))
	{
		output("\n\nWhen Ardia's [ardia.cockNoun] detonates, it isn't like any orgasm you've ever seen. It bounces up and down, throbbing out a titan's breeding reservoir from those two overfull jizz-casks. It all happens so fast you can't believe you managed to shut your eyes and close your mouth before you started getting spunked in the crushing, tectonic weight of an alpha dzaan's hyper-alpha climax. The plump beauty is nothing but screams and moans as her body flings massive, seed-packed pillars of slurry-thick spooge your way, festooning you in an alabaster blanket from which there's no discerning the [pc.raceShort] underneath.");
		output("\n\nYou had your chance to catch what didn't hit your face, but the brutality of her seeding has only just begun. You're shoved back to the ground by the ferocity of her orgasm, unable to do more than spread yourself akimbo and make a little angel out of the massive puddle you're becoming part of. Anyone who steps in here now will see the captain of the ship and think them a galotian turned white with the amount of steaming-hot slosh smothering [pc.himHer]. Ardia pumps her rod for all its worth, staining her room in voluminous nut, no end to the climax in sight.");
		output("\n\nThere's simply so much of it that even though you've not ingested any, it still seeps into your pores, dribbles past your nostrils. That gets you just a tiny bit high, and the effect, for how diluted and minimal it is, is superior to that of being claimed so assertively.");
		// ardia Giga Balls (used nutbutter twice, add-on to Hyper)
		if (ardiaHugeBalls()) output("\n\nYou start to worry for Ardia's health and safety when you realize she's still cumming, still firing across the room. You're not sure your ship needed a spermy aesthetic the likes of which she's deploying, but you knew the risks when you slathered her nuts in kui-tan butter. While you feel another puddling quantity of jizz flow over you, you think to yourself how good it feels to have someone able to give you a nice, sticky bath once in a while. Maybe next time you should try swallowing it? See how long you last?");
		if (ardiaDomLevel() < 4) output("\n\n<i>\"Oh fffuck, fuck... [pc.name]... getting off like that's gonna take a lifetime to get used to... whew!\"</i>");
		else output("\n\n<i>\"Well, at least I know my harem won't be wanting for their reward. Goodness, it's going to take a long time to adjust to this...\"</i>");
	}
	// ardia Regular Balls
	else
	{
		output("\n\nArdia's [ardia.cockNoun] offers a moment to catch your breath and shut your eyes before the first thick rope of pearly spooge smashes against your cheek, and then the next lassos across and around your temple. Gallons of dzaan jizz spurt in heavy streams, bloating the shape of the cock you genuflect for. You remind yourself to keep your mouth closed, but the touch of her heavenly rain to your [pc.skinFurScales] still makes you feel slightly high, fuzzy, and very euphoric, much more than simply being marked in a herm's spooge can do.");
		output("\n\nYou don't cum through this. Your [pc.hands] need to be up to catch anything that doesn't hit your face. Fresh sperm continually jets even without her addled input, lacquering your trembling form in a subby slut's rightful reward. Even after all's said and done and it reduces to a flexing dribble, her balls don't look the least bit diminished. They still look fondleable and suckable, tempting as always, but you don't want to touch them. You'd get your mess all over them. Really, that'd be silly, after you spent so long cleaning them!");
		if (ardiaDomLevel() < 4) output("\n\n<i>\"Uff... that's the stuff. Hehe, you look good covered in cum, [pc.name]. Hope you'll wanna do that again soon!\"</i>");
		else output("\n\n<i>\"Now you look a proper beta. Is that why you ignored your meal? Just wanted to look like a prize harem [pc.boyGirl]? That's okay! You looking like this is great once in a while!\"</i>");
	}

	pc.applyCumSoaked();

	addButton(0, "Next", ardiaNutshipWrapup);
}

public function ardiaNutshipWrapup():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("William");
	processTime(2+rand(4));

	if (ardiaDomLevel() < 7)
	{
		output("You stay coupled with Ardia for an indiscernible time. There's just something so pleasant about being the center of a big, plush amazon's affections that you, understandably, don't want to disentangle from. Eventually, however, she has to shrug back into her suit and zip up. Besides, it's not like you can't get at that whenever you want!");
		output("\n\n<i>\"Don't be a stranger, " + (ardiaDomLevel() < 4 ? "captain" : "[pc.name]") + "!\"</i> she trills playfully, brimming with satisfaction. You don't make it halfway to your feet before she's hugging and groping you, purring in a voice that can't be taken as anything other than an invitation for a good time next time. <i>\"You speak some real magic with those lips of yours, and I'm gonna probably be asking about that again sometime soon!\"</i>");
		output("\n\nYou just might accommodate! For now, time to get back to things that aren't playing around with a dzaan alpha.");
		if (ardiaDomLevel() > 3) output(" Woe is you.");
	}
	else
	{
		output("Just because your mistress cums once doesn't mean your work is done. Betas work all day, every day, for the rest of their lives. Today is just an opportunity to put in for some endurance training when the time comes to assume your role. Your body and brain will be full of memories that will help you in the years to come, thirstily servicing your alpha goddess and concerning yourself with discovering horizons of pleasure with a zeal that none could match. While you suck down the sixth load and smear the seventh into your face, you spare a rare thought to how you ended up here, and how storybook fairytale this seems.");
		output("\n\nNot only did you rescue Ardia from a terrible fate, you became her beta, found your owner, your alpha, your eternal provider. She'll take you with her wherever she goes. You'll make everyone else seethe with envy. They'll gaze dumbly as you guzzle down enough cum to impregnate a metropolis. They'll cum just by watching you cum from glorying in the raunchy debasement.");
		output("\n\nThe bulging [ardia.cockNoun] you service never softens. It stays hard, slithers inside you, embodies the very future you stand to inherit. Steele Tech, you've come to learn, never mattered. Your real future is being your alpha's favored cock-socket, her favored beta, her eager, submissive slut. You and she will experience sensation that has never been felt before. ");
		output("\n\nAs her phallus flexes inside, rewarding your slavering succulence with yet more coursing power, you fall back, this orgasm wiping your mind with ecstatic pleasure. Ardia stands over you, wringing out her loads onto your face. You wear her seed like a second skin. You quickly rub it in, collecting it into thick globs around your erogenous zones. Every second that follows fills your mind with a new scene of depravity for you to anticipate and one day hope to act out. What you're seeing - you lick your lips, savoring that magical high - is a beta's dearest wish.");
		output("\n\nSoothing contentment replaces urgency, and you find yourself sitting on Ardia's bed, completely soaked in her offerings." + (pc.isNude() ? "" : " She's dressed you up even, making sure you go about your day with her sticky stain ever-present.") + " What the elfin alien whispers in your ear makes you happy. You don't need to understand it to agree with it, to love it. She hugs you close, keeping you there for an even longer time, prolonging the wondrous high swaddling you in a dzaan's heaven.");
		output("\n\n<i>\"Well, [pc.name], I believe you still have plenty to do that isn't sucking my cock.\"</i> Ardia pats you on the back of the head, waking you from your dreamy stupor. <i>\"As much as I'd like you to stay right here, we both know that's not yet possible.\"</i>");
		output("\n\nYou whine, reluctantly standing. The swampy heat of her drying cum is everywhere on your body.");
		output("\n\n<i>\"None of that, [pc.name],\"</i> Ardia giggles. <i>\"You're a captain - for now. And you need to act like it. You have my permission to see to your affairs. The only way you're going to make me happy is by getting your ducks in a row, or however that Terran adage goes.\"</i>");
		output("\n\nShe slaps you on the ass to send you on your way.");
	}

	IncrementFlag("SEXED_ARDIA_NUTSHIP");

	addButton(0, "Next", mainGameMenu);
}

public function rideArdiaLikeAHorseOrSomething(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Savin");
	processTime(20+rand(26));

	if (ardiaDomLevel() < 4)
	{
		output("You flash Ardia a cheeky little grin and run your hands up her meaty chest, letting your fingers play across the pebbly peaks. <i>\"How about you lay down and let me take care of everything?\"</i> you suggest, giving her a squeeze.");
		output("\n\nShe blushes a bit, but you can feel her [ardia.cock] thump against your thigh a moment later. You give her a little push towards the bed, slapping her ass as she turns. Now <b>that</b> makes her dick really jump!");
	}
	else if (ardiaDomLevel() < 7)
	{
		output("<i>\"How about I let you be on top this time?\"</i> Ardia smirks, eying you hungrily. <i>\"I wanna see you bounce on my dick. I know you want to, too.\"</i>");
		output("\n\nShe really can read you like an open book, can't she?");
	}
	else
	{
		output("<i>\"Ah, I'm kind of feeling lazy now,\"</i> Ardia sighs, running her hand down the length of her [ardia.cock], eyes wandering all over you. <i>\"Think I'm gonna lie down. And you're gonna sit on my lap, [pc.name].\"</i>");
		output("\n\nYes ma'am.");
	}
	output("\n\nArdia grins and saunters over to the bed, kicking her bodysuit off to the side as she passes by. Her hand trails over your cheeks, thumb brushing your [pc.lipsChaste], and then she's sprawling out on the bed, nestling her head into the pillows and letting her legs spread open over the edge. Her [ardia.balls] hang over the edge, " + (ardiaHugeBalls() ? "pillowing onto the ground between her feet" : "swaying in the shadow of her stiffening pole") + ". She runs her hands over the hefty mountains jutting up from her chest, kneading her own bronze flesh while you follow her up to the bed. Your hands instinctively travel down, running your fingers over the taut ballsflesh and feeling how hot and full they are -- so heavy with cum that your fingers all but disappear into her.");
	output("\n\nHer thick prick wobbles, stiffening as your hands work into her balls. You know full well you could easily slip down and just worship those fat nads all day, but you've got a hunger inside you that only cock can sate. And so you only give her majestic balls a cursory bit of worship, enough to get them churning up all the sweet, rich cum inside before you move up onto the bed with her. Ardia's big, strong mitts plant themselves on your [pc.hips], digging her fingers into your ass while you position yourself over her. The swaying pillar of her [ardia.cock] slaps against your butt, rubbing into the crack of your ass. You can <b>smell</b> the pre beading up from her cumslit before you feel it spattering onto your [pc.skinFurScales], rolling down your cheeks. Nice and slimy, and the scent is so sweet... your heart hammers with anticipation.");
	if (vagIdx < 0)
	{
		output("\n\n<i>\"Don't get too ahead of yourself,\"</i> Ardia laughs, giving your butt a firm squeeze. <i>\"We're both gonna regret you going in dry. There's lube in the desk.\"</i>");
		output("\n\nYou quickly reach into her drawer, find one of the many travel bottles packed in there, and upend it onto the crown of your " + (ardiaDomLevel() < 4 ? "lover" : "alpha") + "'s [ardia.cock]. She draws in a sharp breath, digging her nails into you as the cool liquid pours over her rod. Oops! You quickly slip a hand back there and start to work it in, warming the lubricants up and helping her get back to full mast with equal devotion. Only when her dick's trembling under its own weight and leaking more of her radiant white cream do you consider your job finished and toss the now-empty bottle aside.");
	}
	output("\n\nArdia gives you a nice, low moan and bites her lip, letting her eyes wander all over your [pc.chest]. <i>\"Okay, I'm ready for you, " + (ardiaDomLevel() < 7 ? "[pc.name]. Go ahead and take me." : "slut. Time to get on your alpha's cock.") + "\"</i> With her encouragement, you rise up on your [pc.knees] and wiggle your hips until you feel her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "broad flare" : "thick crown") + " pressing into your [pc.vagOrAss " + vagIdx + "]. Resting your hands on Ardia's soft stomach, you give Ardia a lusty little smile and push yourself down. There's a moment of resistance, a brief second where your body instinctively fights against the fat dick between your thighs, and then she's inside you, slowly spreading you open around her girth.");
	if (vagIdx < 0) pc.buttChange(ardia.cockVolume(0));
	else pc.holeChange(vagIdx, ardia.cockVolume(0));
	output("\n\nYou close your eyes and sink down her thick, veiny shaft, all the way down until your [pc.butt] is resting on the dzaan's plush thighs.");
	if (ardia.hasCock(GLOBAL.TYPE_EQUINE)) output(" Your [pc.stomach] stretches around her lengthy synthcock, staining to accomodate all of that equine meat. Ardia gives you a thoroughly impressed look and runs her hands up your flanks and over your distended stomach. Her fingers practically can touch her dick through you, groping at her broad flare's outline in your [pc.skin]. <i>\"So fuckin' hot...\"</i> she murmurs, and you feel her throb inside you, leaking thick ropes of pre into your [pc.vagOrAss " + vagIdx + "].");
	else output(" Her fat, nubbed dzaan-cock fills you up wonderfully, grinding those keratin peaks against your sensitive inner walls enough to leave you moaning and trembling. Your [pc.vagOrAss " + vagIdx + "] clenches around her base, trapping her inside you as fat ropes of pre start beading up from her.");
	output("\n\nYou take a deep breath, letting Ardia's dick -- and the first intoxication drops of pre -- settle inside you. You can only stomach a balls-deep insertion for a few moments before your lusts demand your rise, pushing in on Ardia's belly and hefting yourself up off her lap. Her hands stay firmly wrapped around you, guiding you straight up her shaft till you're near" + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? " to the medial ring" : "ly halfway up") + " before you feel all that amazonian strength suddenly coming to bear, and your [pc.butt] comes slapping back down on her lap. You can't stop yourself from moaning, from praising your " + (ardiaDomLevel() < 4 ? "lover" : "alpha") + "'s name to the heavens as her cock buries itself deep inside you.");
	if (pc.hasCock()) output(" Your [pc.cock] flops full-force onto Ardia's stomach, spattering your own pre across her button. She laughs and mops it up with a thumb, sucking it clean with a lewd moan of her own. <i>\"Delicious. Make more for me! Shoot it out all over me...\"</i>");
	output("\n\nIt takes all your willpower not to just cum right then and there, and you muster that up only because you know Ardia's nowhere close herself. You've got so much more work to do, no matter how damn good she's making you feel. So you grit your teeth and move your hands up, grabbing the alpha's expansive rack as you start to force yourself up again. ");
	output("\n\n<i>\"Ohhh, yeah, I love having them played with,\"</i> Ardia murmurs, putting her hands over yours. <i>\"The nips especially. Go ahead: pinch and squeeze to your heart's content.\"</i>");
	output("\n\nYou do so with aplomb, kneading those big brown boobs with all the vigor of a master baker while your [pc.hips] ride that big, dominant alpha cock. Every time it plows back into your [pc.vagOrAss " + vagIdx + "], it's an explosive, all-consuming pleasure. The keratin nubs all along her length tease and grind your insides, hitting every sensitive spot along the way. It barely takes any time at all for your [pc.legs] to go numb and shaky, but luckily, you've got Ardia's hands wrapped under your [pc.butt] to keep you moving at the perfect pace for " + (ardiaDomLevel() < 4 ? "the rock-hard alpha-babe." : "your perfect alpha."));
	output("\n\n<i>\"You make a good onahole at least,\"</i> she laughs. <i>\"A-ah, and you squeeze down, too! Maybe better than a fucktoy after all.\"</i>");
	output("\n\nWow she knows how to really sweet-talk you, doesn't she? You redouble your efforts to massage Ardia's tits, determined to make the big girl cum, too. It's taking everything you've got to resist the urge yourself, so time's of the essence. With hands and " + (vagIdx < 0 ? "ass" : "pussy") + " working in tandem, maybe... maybe you can level the playing field. Deep breaths now...");
	output("\n\nWhile Ardia hefts you up and pulls you down on that magnificent cock, your hands assail her peaks with renewed vigor, and you use your inner muscles to work her shaft as much as you can. Clench, squeeze, fight against her pulling out; you barely notice when Ardia's hands cinch around your waist and start pounding you up and down, but you <b>do</b> feel it when that slow dribble of pre in your [pc.vagOrAss " + vagIdx + "] becomes a torrent, a never-ending flood of intoxicating cream that smears all over your inner walls. The more of her drugged-up spooge leaks into your " + (vagIdx < 0 ? "bowels" : "womb") + ", the more desperate you desire to get Ardia off -- to feel those [ardia.balls] of hers empty inside you, geysering their creamy load until you look" + (pc.isPregnant() ? " even more" : "") + " pregnant. Oh, stars, just thinking about it is enough to nearly set you off!");
	output("\n\n<i>\"Okay! Okay! Ease up a little...\"</i> Ardia groans. Despite her please, she arches her back and thrusts her tits up into your hands. Your fingers all but disappear into the " + (silly ? "vast tracts of land" : "plush boobflesh") + ", and her [ardia.cock] slams into you even harder than before. She's getting close. Just a little more and she'll be on the edge. Just keep focusing... keeping worshiping her tits and using what little control you still have over your lower body to be the perfect cocksleeve for your " + (ardiaDomLevel() < 4 ? "lover." : "mistress."));
	output("\n\nShe's so close that you can practically <b>taste</b> her cum.");
	output("\n\n<i>\"Hnng! Okay, fuck, I'm -- oh, gods here it comes! Hold on!\"</i>");
	output("\n\nArdia says the word, and you cum in an instant. Your");
	if (pc.hasCock()) output(" [pc.cock] erupts in a spray of [pc.cum] across the dzaan's soft stomach and heaving tits, coating them [pc.cumColor] while your");
	output(" [pc.vagOrAss " + vagIdx + "] goes wild around her [ardia.cock], hungrily devouring every inch in the instant before she fills you. The first shot of the beautiful alpha's cum almost knocks you right back off her, and your hands instinctive go to your [pc.belly] as it starts to fill out with the contents of Ardia's heavy sack.");
	output("\n\nYour mind goes blank, a haze of lust-addled contention as Ardia's cum floods your " + (vagIdx < 0 ? "bowels" : "womb") + " and squirts back onto her thighs as the excess overflows. Her nails rake your [pc.hips], holding you down on her while her own hips thrust up against your [pc.butt], fucking more and more of her creamy cum " + (vagIdx < 0 ? "up your tailpipe" : "into your pussy") + ". Your own orgasm just helps to milk that intoxicating spooge out, and when it passes, you're left feeling limb and boneless. You slump forward into the alpha babe's big tits, burying your face in her cleavage while the last of her own climax drools into your [pc.vagOrAss " + vagIdx + "].");
	output("\n\nArdia grins and wraps her arms around you, smiling down at you. <i>\"" + (ardiaDomLevel() < 7 ? "Wow, being on bottom's pretty alright. I came like crazy... and so did you. Whew, I'm not even going soft. How 'bout you just snuggle up, huh?\"</i>" : "Hmm, using you like that's pretty fun. Barely have to work, and I came like crazy. What a good beta you are!\"</i>\n\nYour heart flutters at the praise. Mistress really does love you!"));
	output("\n\nYou nuzzle into Ardia's chest and let your eyes lid closed, enjoying the feeling of her hard shaft throbbing inside you in a sea of cum.");

	if (vagIdx < 0) pc.loadInAss(ardia);
	else pc.loadInCunt(ardia, vagIdx);
	ardia.orgasm();
	pc.orgasm();
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_RIDE");

	addButton(0, "Next", mainGameMenu);
}

public function areYouPCEnoughToBeArdiasChair():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("William");
	processTime(3+rand(6));

	if (ardiaDomLevel() < 4)
	{
		if (pc.isBimbo()) output("You'd <i>love</i> to suck Ardia off, and with cum on the brain you nearly give an answer that'll have you guzzling jizz in two shakes of a " + (CodexManager.entryUnlocked("Rodenians") ? "rodenian" : "rat") + "'s tail. But then you realize the dzaan's a fully-equipped herm. There's a juicy pussy hidden behind her package, tucked away in a hard-to-reach place. <i>\"Ummm...\"</i> you ramble, playfully gripping the plump alpha's derriere and rubbing your own twat. Graphic possibilities race through your oversexed mind until you latch onto the most exciting: <i>\"So why don't you let me eat your pussy out? Even better, you can sit on my face! And let me tell you, I've got a thing for big butts, and I can't lie!\"</i>");
		else if (pc.isBro()) output("You look to the [pc.cock] between your legs, then to Ardia's, then at her ass - you haven't moved your hand from the round globe at all. She has a pussy. You can smell it. You could fuck it, but you'd rather taste it for now. Afterwards, maybe you'll fuck her. <i>\"I'm going to eat your pussy. Hard.\"</i>");
		else if (pc.isNice()) output("Estrus need rises on the back of Ardia's masculine musk, the fragrant hint of pussy juiced up and ready for action. It's tucked away in the nexus between her thighs and behind her nutsack. <i>\"I want you to sit on me.\"</i> You blush, squeezing her left ass cheek. <i>\"And I want to lick your pussy until it\"</i>");
		else if (pc.isMisch()) output("With a bend of the arm and a flex of the wrist, you deliver a playful spank to Ardia's ripe derriere. Her sodden pussy must have appreciated it, because its pheromonal output has noticeably strengthened. <i>\"I think I'd love to get this on my face,\"</i> you grin. <i>\"You can pretend to be captain while you're squealing my name.\"</i>");
		else output("At some point you stopped looking into Ardia's eyes and staring down at her ass, gripping it too. The aroma of pussy rises from between her massive legs. Creamy torrents of female need drizzle down tracts of pillowy flesh, the sign of a cunt gone wild. <i>\"I'm gonna eat you out, and you're going to get to sit on me. You'll love it.\"</i>");
		if (flags["SEXED_ARDIA_LICK"] == undefined)
		{
			output("\n\nDisbelief twinkles in Ardia's cool blue eyes. Her lips spread into an 'oh' of surprise. <i>\"You want me to... sit on you, [pc.name]?\"</i> She blinks; you nod. <i>\"I dunno, I'm pretty big! You sure you're gonna be okay down there? I mean, you could just bend me over if you wanted a taste that bad.\"</i>");
			output("\n\nNo can do. Your idea's better.");
			output("\n\n<i>\"Hehe, okay.\"</i> She grips your shoulder. The amount of strength in her wrist sends an excited thrill up your spine. <i>\"Make yourself cozy, [pc.name].\"</i> Her playful shove sends you sprawling along the edge of her mattress, scrabbling at the sheets. <i>\"Because it's gonna take a real good tonguing to get you out from under all this.\"</i>");
		}
		else
		{
			output("\n\nArdia's lips bend into a silly grin. <i>\"That's lewd, [pc.name]. But hey, I'm not gonna say no to getting a chance to sit down <b>and</b> get off 'cuz of it!\"</i> She grabs you by the shoulder and pushes you towards the bed. <i>\"Get comfy. I think it's gonna be a bit hard to breathe, but you knew the risks!\"</i>");
		}
	}
	else if (ardiaDomLevel() < 7)
	{
		if (pc.isBimbo()) output("<i>\"Weeelll, ummm, you know, like...\"</i> You stumble over words, fighting against the urge to get orally or vaginally stuffed on top of your wonderful addiction to the tastiest jizz in the universe. <i>\"You've got a pussy 'n I really like pussy!\"</i> Ardia giggles at your none-too-subtle peek at her ass. <i>\"And uh, I'd do a great job if you sat on me!\"</i>");
		else if (pc.isBro()) output("The longer you stare at her cock the more yours fades into the background. You're not good enough to fuck your alpha. But you are, however, good enough to be her one and only seat. <i>\"Sit on me, so I can eat your pussy,\"</i> you grunt.");
		else output("You're so distracted by the pheromonal cornucopia that your rational thinking begins to fail. Emotions and images substitute for abstract thought: you're blowing your alpha, getting screwed sloppy for the third time... and then you see her sitting on you. That's it! <i>\"This dick usually gets all the attention...\"</i> You blush, squeezing her [ardia.cockNoun] tenderly. <i>\"How about you sit your pussy on my lips? I think it needs me more than your cock does.\"</i>");
		if (flags["SEXED_ARDIA_LICK"] == undefined)
		{
			output("\n\nArdia's brow stretches, one eye quirked in deep thought. <i>\"Facesitting, [pc.name]? And I thought you'd ask to be smothered in these tits!\"</i> Your perception fails to register the plump dzaan's motions, and now you're ear-deep in sumptuous bronze boobies. <i>\"Yes, I think that's a good idea. There's a lot of pussy to lick, and you'll have my balls to keep you company.\"</i>");
			output("\n\nThe entire room spins as you're whirled in the direction of her bed, losing your balance and landing face-first on the mattress. <i>\"Ready or not, [pc.name], this ass won't be moving until you're soaked in cum.\"</i>");
		}
		else
		{
			output("\n\nArdia sweeps you into an alpha's embrace, pressing her lips to yours in a cool kiss. Her eyes close with yours, and for a few long moments you delight in one another's bodies. She rubs at the back of your head while you squeeze her mountainous butt.");
			output("\n\nYou don't have time to catch your breath; when your lips part, she throws you towards her bed. <i>\"That's the kind of kissing I expect down there. Get ready, my beta, because you're going to be under me for more than a few orgasms.\"</i>");
		}
	}
	else
	{
		output("\n\nArdia " + (pc.hasHair() ? "gathers up a few strands of your [pc.hair] and playfully tousles them" : "shifts a hand over your smooth head") + ". It puts a smile on her face when you audibly slurp a string of dribbling spunk past your [pc.lipsChaste]. Your alpha's breathy tittering sets her naked curves to an incessant jiggle. <i>\"Lie back on my bed, [pc.name]. After that performance, I think I need to sit down... and what better place to rest my butt than my 'captain's' face?\"</i>");
		output("\n\nYour eyes barely have time to widen from the glee of being ordered around: a taste of your Mistress' pussy?  bimbo: Yay!/ bro: Fuck yeah./ else: Wouldn't miss it!}");
		output("\n\nBy the time you've crawled over to the mattress and sprawled out on the duvet, Ardia's already " + (pc.hasLegs() ? "at your [pc.legs]" : "at your crotch") + ". For a moment you think she'll hike you up and fuck you into a mindless heap, but she's too in control for that. You're about to be her throne, and,");
		if (pc.isHerm()) output(" cock and pussy juices leaking from your herm-hood");
		else if (pc.hasVagina()) output(" [pc.girlCumNoun] streaming down your [pc.thighs]");
		else if (pc.hasCock()) output(" [pc.cumNoun] leaking from your [pc.cockHeads]");
		else output(" sweat dripping down your [pc.skinFurScalesNoun]");
		output(", you love that idea more than life itself.");
	}

	pc.maxOutLust();

	addButton(0, "Next", thingsAreLookingUpIntoArdiasPussy);
}

public function thingsAreLookingUpIntoArdiasPussy():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("William");
	processTime(15+rand(21));

	output("Crawling closer, Ardia sits up on her knees and pivots until the umber horizon of her mountainous ass is hovering above, thick with caloric accumulation. The dzaan domme arches forward, opening her callipygian fissure and parting the planet-sized aft quarters poised to smother you. Deep inside the crack is her asshole, and further down is the fat shape of her pussy, gleaming with fervor. A thundercrack of a sexy spank later and those dessert bowls are clapping together like a buffet table in an earthquake. <i>\"");
	if (ardiaDomLevel() < 4) output("C'mere, [pc.name], give it a big squeeze. Might as well, right? Not like you'll be able to move your arms once you're getting busy.");
	else if (ardiaDomLevel() < 7) output("Touch me, [pc.name]. Show your alpha how much you appreciate her.");
	else output("Grab my ass and <b>worship me,</b> [pc.name].");
	output("\"</i>");
	output("\n\nYour heart goes ballistic when your [pc.arms] reach out for the herm's flanks. Buttery smooth mounds squish between your questing fingers, enveloping (en-butt-ening?) them on their southward journey. Ardia's wide-flared hips swivel in small circles, caressed by palms roaming to the bubble-shaped underside of her ass. It's so round and plump, and you shudder to think of what might happen if the dzaan really put this moneymaker to work. All the wiggling and rubbing distorts the terrain of her curvaceous backside, smushing the rotund cheeks together in alluring patterns that beg you to " + (ardiaDomLevel() < 4 ? "slap it." : "grab tighter."));
	output("\n\nArdia coos and moans, gradually sinking down. It's not long before your entire world is dark chocolate amazon. You wisely inhale just before your [pc.face] is utterly flattened by the well-fed goddess, disappearing into your " + (ardiaDomLevel() < 4 ? "crewmate" : "alpha") + "'s behind. Glorious, wobbly thighs massage your features while her ass wriggles to the left and right. Nestled at the ceiling of her taint, some of the chunkiest BBW buns of all time settle around your jaw and pin your shoulders. At the mercy of her rump's clenching whimsy, the temperature rises, as does the scent of potent cunt.");
	if (ardiaDomLevel() < 4)
	{
		output("\n\n<i>\"" + (flags["SEXED_ARDIA_LICK"] == undefined ? "Oh wow, this feels great!" : "Mmmmm, there's something just <b>right</b> about this!") + "\"</i> Ardia's rippling cushions squirm all over, and you revel in it, knowing you're getting closer to that wet slit. <i>\"Hey [pc.name]!\"</i> A hand rubs the top patch of your head, cratered into the bed. It's the only clue to your existence. Thank goodness you're not claustrophobic! <i>\"Make sure you get my balls too, okay? No need to answer! I know you're a bit uh, muffled, hehe.\"</i>");
		output("\n\nInterestingly, a low background music fills the room overlaid by filtered sound effects and energized voice samples. You're pretty sure a foley artist isn't hiding under the bed, so you can only assume that Ardia's turned on a video game to play while she gets off!");
		output("\n\nShe shifts backwards until you're at the lower point of her pussy. Steaming estrus kisses your [pc.lips], and your mouth fills with saliva at the thought of finally getting to suckle at it. <i>\"Alrighty, lemme just... oh, sorry if I'm taking so long! This is such a great position to be in!\"</i> Her slick, flexing quim glides over the bridge of your nose, yet all the weight keeps you from acting. <i>\"Ahh, theeeere, that'll do.\"</i> Subtly, the stern yet sensual enclosure loosens. You're completely trapped, and her horny muff is there, aching for contact. <i>\"There you go, have at it [pc.name]!\"</i>");
	}
	else if (ardiaDomLevel() < 7)
	{
		output("\n\n<i>\"" + (flags["SEXED_ARDIA_LICK"] == undefined ? "Wow, this is something new. I'm so glad my first beta is already teaching me things I'd have never considered before!" : "Mmmffff, ohh yessss, this never gets old.") + "\"</i> Trapped beneath Ardia's cushions, you squeal affirmatively, if just to let her know you're happy she's happy. Sadly, her creamy vagina is too far to reach, and the crushing proportions of amazon ass prevent you from servicing it. <i>\"Don't forget, [pc.name],\"</i> she pats the tiny bit of your head sticking out from her enormous posterior, <i>\"my balls need attention, too.\"</i>");
		output("\n\nScreams of recorded identifiable only as pornographic in origin can be heard. The distance tells you they're from a TV. Is she watching smut while she gets off?");
		output("\n\nA series of light shocks that can only be interpreted as masturbation thud through her loins. The unpolished bulb of her clitoris throbs on the other end, <i>needing</i> licked. <i>\"[pc.name]. When I move back, I'm smashing your face into my pussy. Don't disappoint your Mistress now, she's about to get <b>very</b> comfortable.\"</i> The slippery treasure trove secreted behind her masculine side moves closer, sweeping across your nose and then back, the final adjustment in your domme's preparations. Suffocating on twinned musks, her command reaches you: <i>\"Lick me.\"</i>");
	}
	else
	{
		output("\n\nSo far Ardia seems less interested in receiving cunnilingus than she is humping and grinding. She's practically twerking, pounding every detail of meaty thighs into your consciousness. Forwards, backwards, up and down, your Mistress bounces as if trying to coax out every possible tip at happy hour. <i>\"In the future, this may be a fantastic way to punish a beta who acts out of turn. But for you, [pc.name]?\"</i> The next impact of her lush buttocks is stunningly pleasurable, rattling you all the way to your [pc.footOrFeet]. <i>\"It'll always be a reward. When I need to be present at your board meetings, when I need to rest in public, you'll be my chair. Not every alpha has her own throne, you know.\"</i>");
		output("\n\nLurid, digitized voices echo off the walls, instantly recognizable as being from a holo. There's your Mistress' voice, but then there's yours. A graphic recording of your obedience to her replays, adding a shameful frisson to this entire event. As you wait for permission to serve, you blush fiercely, picking out <i>that</i> moment in the din where you came very hard.");
		output("\n\nMercifully, the buffeting ceases. Ardia's scent lingers everywhere, a peachy, mouthwatering flavor that complements the taste of her balls. The engorged button of her clit gently pulses on your lower lip. The soft, glistening plumpness of her pussy spreads, emitting hot torrents of feminine desire. Before you're totally masked in the silken sheen, you hear, <i>\"You may begin, [pc.name]. Your alpha requires her beta's attention.\"</i> Audible slaps of vigorous cock-jerking thud on the other side of her pelvis. <i>\"Lick.\"</i>");
	}
	output("\n\nYour [pc.tongue] lashes out, plastering its taste buds to the slopes of Ardia's pussy. The exterior lips are deliciously wet, a little rubbery and unforgiving compared to the rest of her. Simmering ambrosia rains down your enmeshed visage, intensifying your thirst. Lapping like a parcher dog, you drink in Ardia's boiling relief, whipping at clusters of vulnerable nerves surrounding her oozing vulva. When you're giving your tongue a break, you're rolling that bubblegum clit between your [pc.lips], smattering kisses wherever possible.");
	output("\n\nInterestingly, perhaps because you're safely tucked away, you find yourself motivated to suck as obscenely as possible. Dizzying rushes of goo spill into your gullet. You can scarcely breathe. Every shiver of discomfort swaddles your nose further into the chubby folds of Ardia's florid vagina, quivering in anticipation. The buzz of oxygen deprivation and the tingle of submission to petal-perfect pussy wreak havoc on your mental state, and that's <i>before</i> you drive your [pc.tongue] into her dewy delta" + (pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED) ? ", injecting her libido with aphrodisiac-laced saliva." : "."));
	output("\n\n<i>\"O-Oh!\"</i>");
	output("\n\nWetness spreads around your muscle as it weaves across the most sensitive places in a woman's body. What little control you had evaporates when Ardia clamps down and gravity pulls on her crotch. Her puffy cunt takes your entire organ to the root, branding it in female orgasm. Burningly pleasurable sensations alight across your oral membranes, spreading to the rest of your cranium in short order. Beads of girlcum drizzle for an eternity until you're able to yank free, drawing flows of hot girlcum from her vivid tightness.");
	output("\n\nYou start over, eager to experience that raw pleasure again. Ardia's rosy innards are already flushing with renewed purpose.");
	if (pc.hasLongTongue()) output(" Groaning woozily, you deploy the maximum length of your modified tongue, going the mile in refreshed amazon puss, chasing the redolent flavors of deliciously aroused dzaan, touching secret places she'd never allow just <i>anyone</i> to get near.");
	output("\n\nOne ravenous thrust of the neck must have pleased her opposing anatomy, you realize, because her cum-generators have begun to churn. Sliding your tongue over, you mop the herm's backsack");
	if (pc.hasLongTongue()) output(", internally giggling at whatever her reaction must be to seeing that long, serpentine flesh slithering out of its enclosure and curling around her scrotum");
	output(". Fresh seed sloshes inside the sensitized spunk stash, churning with an angry gurgle. The gravid nuts rise up and contract - you know you're doing well.");
	output("\n\nIn light of the third explosive orgasm, you become so attuned to Ardia's musk you could find her whilst blindfolded in a room of pregnant laquines. Sudden, deep thrusts and testicular exhibitions mix up enough pleasure that you're sure you've got her riding a hyperlane of endless eroticism. Burrowing deep, you cause her to cum again. You swoon, feeling cold and numb everywhere, wondering if she can ever be satisfied.");
	output("\n\nThe vacancy of your mindspace is occupied by carnal experience. It seeps from her pliant hole. You devolve from a [pc.raceShort] into a wiggling tongue, vaguely happy for life to be so simple, flexing inside slickness and passion, the recipient of this indelible affection screaming her diaphragm hoarse. If your eyes weren't rolled back, they would be now: climax tears through your slackened body.");
	if (pc.hasGenitals())
	{
		output(" Fluids squirt, you can feel it, but you have no sense for the volume. Ardia's constant gratification wrings gouts of");
		if (pc.isHerm()) output(" [pc.cumNoun] and [pc.girlCumNoun]");
		else if (pc.hasCock()) output(" seed");
		else output(" lady-spooge");
		output(" from your ecstatically spasming form. Heaven.");
	}
	else output(" Starbursting heat blossoms through your body, purging discomfort and chill. Tiny spasms wrack you, little shows of submission on a metaphysical level.");

	pc.loadInMouth(ardia);
	ardia.orgasm();
	pc.orgasm();
	pc.applyCumSoaked();

	addButton(0, "Next", almostDoneEatingArdiaFromBelow);
}

public function almostDoneEatingArdiaFromBelow():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("William");
	processTime(10+rand(16));

	output("Surprisingly, you haven't passed out. You know it's true, because you can feel Ardia above, lazily rubbing her ass all over, rubbing her copious girljizz into your pores. It actually makes you " + (pc.hasGenitals() ? "spurt" : "spasm") + " a bit. " + (ardiaDomLevel() < 4 ? "Having this ass any time you want is an absolute fucking delight." : "Being useful to your alpha in any way hits you with pleasure. This is no different.") + " After wringing out the last of her harem-ready libido, Ardia deigns to lift herself, revealing the amusingly debased form of you, her " + (ardiaDomLevel() < 4 ? "'captain'" : "beta") + ", panting, lapping woozily at [pc.hisHer] lips. " + (ardiaDomLevel() < 4 ? "She shuts down her game shortly after." : "The porn flickers off at roughly the same time."));
	output("\n\n" + (ardiaDomLevel() < 7 ? "<i>\"That was soooo good!\"</i> Ardia trills playfully" : "<i>\"That was a splendid effort\"</i> Ardia praises") + ", pulling you up into a sitting position. Sadly, you can't shake the feelin that a part of you is missing. A very large part. <i>\"I'm quite lucky you're great at licking pussy, [pc.name]. I always thought I'd end up focusing on my cock, but you " + (ardiaDomLevel() < 4 ? "really know how to make a girl love being the top!" : "have a talent for making an alpha love her place on top.") + "\"</i>");
	if (ardiaDomLevel() < 7)
	{
		output("\n\nThe two of you bask in the warm afterglow, cleaning up the room. There's a few cum stains on the floor that get cleaned up in due time.");
		if (ardiaDomLevel() > 3) output(" A beta serves unquestioningly, of course.");
		output(" A slap on the ass sends you on your way. <i>\"Don't be a stranger, [pc.name]. We need to do that again!\"</i>");
	}
	else
	{
		output("\n\n<i>\"But,\"</i> Ardia follows up, her intonation hitting those tell-tale beta-commanding chords. <i>\"My room is a mess. You may leave... after you've cleaned it.\"</i>");
		output("\n\nBefore you can nod, Mistress shoves you to the floor, using a foot to keep you down in your attempt to rise again. <i>\"On your hands and knees, using your mouth. It doesn't suit you to waste my treat, [pc.name].\"</i>");
		output("\n\nThe thought of protesting never enters your mind. Quite the opposite: you're scooping all the viscous puddles of narcotic seed together and lapping up the drink, panting as the scintillating rush of total addiction fills your mouth with that indescribable wonder. Her foot eventually withdraws, so that she can watch you obey unhindered. The sounds of your slurping taper down to tiny smacks and slow, lurid swishes of tongue around the lip, seeking every alabaster fleck. Only when all the sperm is gone does Ardia bid you to stand.");
		output("\n\n<i>\"Good [pc.boyGirl].\"</i> She hugs and kisses you. <i>\"Come back whenever you're missing an alpha's touch, [pc.name]. Hopefully your mission will conclude, and we can focus on what really matters between us.\"</i>");
		output("\n\nOh, you certainly hope so...");
	}

	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_LICK");

	addButton(0, "Next", mainGameMenu);
}

public function getADzaanButtWarmerInYourBed():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");
	processTime(2);

	if (ardiaDomLevel() < 4)
	{
		output("There's no need to beat around the bush with Ardia on this topic, considering you're already sleeping together in the general sense of the term. You nod towards your quarters and ask the chunky dzaan if she'd like to start spending her nights with you. ");
		output("\n\n<i>\"Would I?\"</i> she laughs. Ardia grins at you, biting her lip. <i>\"I was starting to think you'd never ask. I make a great pillow, you know! I'm really just underutilized on the crew if you aren't using me as one.\"</i>");
		output("\n\nYour lovers sways forward on the balls of her feet, running her hands up her soft stomach and over her luscious tits, barely contained by her straining bodysuit. <i>\"I'll go take a few things over, then! I hope you'll find me comfortable tonight, captain...\"</i>");
		output("\n\nShe gives you a wink and grabs her bag, squeezing past you to make her way to your quarters.");
	}
	else if (ardiaDomLevel() < 7)
	{
		output("Your eyes wander across your alpha's ample curves, drinking in her body hungrily. The idea of her being with you at all hours is as intoxicating as her seed, and your imagination runs wild with the idea of resting your head on that sinfully soft body of hers, holding her tight at night. ");
		output("\n\n<i>\"Something on your mind, babe?\"</i> Ardia asks, smiling sweetly. <i>\"Your [pc.knees] are wobbling.\"</i>");
		output("\n\nYou blink, snapping yourself back to the present. You blush softly and say that you were, in fact, thinking about her: that you'd really like it if she'd spend her nights with you from now on.");
		output("\n\n<i>\"Oh, <b>that</b>'s what you were staring about!\"</i> she giggles. <i>\"Thinking of all the ways you could use me as your personal pillow, captain? Want to rest your head on my belly or snuggle up between my tits after you get your dose from my cock every night?\"</i>");
		output("\n\nYou nod eagerly. That's <b>exactly</b> what you were hoping for.");
		output("\n\nArdia grins, running a hand up her soft belly and onto her tits. Her skin-tight bodysuit is stretched taut around her ample assets, glistening in the light like it's all oiled up. <i>\"Well if you want me, captain, I'm more than happy to oblige. Look forward to me being your personal pillow tonight... though you might wake up under <b>me</b> if you're really lucky.\"</i>");
		output("\n\nShe gives you wink and grabs her pack, heading towards your quarters with a wide sway in her hips. Damn, you love to watch her go...");
	}
	else
	{
		output("<i>\"Mistress,\"</i> you begin, letting your eyes wander across your alpha's ample curves, drinking in her body hungrily. The idea of her being with you at all hours is as intoxicating as her seed, and your imagination runs wild with the idea of her having all-night access to your body, fucking you any way she pleases whenever the slightest hint of horniness reaches her majestic member. <i>\"Will you please sleep with me?\"</i>");
		output("\n\n<i>\"Will I?\"</i> your alpha echoes softly, smiling at you with predatory hunger. <i>\"Hmmm. Of course I want to be close to you, my beta. But I think it's more like... you're going to sleep with me. Or under me, anyway. Maybe I'll sleep with my cock in your ass all night, or you can use my balls and thighs as a pillow while my morning wood's sheathed in your throat. Does that sound like what you want, beta?\"</i>");
		output("\n\nYou nod eagerly. It's everything you could ever ask for.");
		output("\n\nArdia smirks, biting her lip as she looks you up and down. You know she's undressing you in her mind; her sheer bodysuit offers no modesty when her [ardia.cock] starts to stiffen beneath it. <i>\"Alright,\"</i> she drawls, running two fingers along her hardening girth. <i>\"Your quarters, tonight. Make sure you've got plenty of lube... or don't.\"</i>");
	}

	flags["CREWMEMBER_SLEEP_WITH"] = "ARDIA";

	ardiaCrewMenu();
}

public function ardiaGTFOOfMyBed():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");
	processTime(1);

	output("You tell Ardia that you'd like to sleep by yourself for a bit. She understands, right? ");
	output("\n\nArdia huffs, folding her hands over her stomach. <i>\"Oh? Tired of having to make room for me? Tsk, alright, I'll let you get away this time. " + (ardiaDomLevel() < 7 ? "Just keep your door open for me. I might get lonely,\"</i> she giggles." : "But you'd better keep that ass open for me. I may decide to pay you a visit if I wake up horny for beta butt."));

	flags["CREWMEMBER_SLEEP_WITH"] = undefined;

	ardiaCrewMenu();
}

public function ardiaSleep():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");

	output("Ardia's already in your quarters when you head to bed, laying naked on her back with her handheld blasting light onto her face. Her fat balls are resting on top of her thighs, with her [ardia.cock] flopped back on her marshmallow-soft belly, shifting every time its owner breathes. Ardia smiles softly as you enter, glancing up as you start to strip down and put away your gear.");
	if (ardiaDomLevel() < 7)
	{
		output(" By the time you're ready to crawl in, Ardia's set her game aside and propped herself up one elbow, patting her stomach invitingly with the other. ");
		output("\n\nYou're not going to say no to that. You slip into bed with your chocolate lover, giving her a loving kiss before sliding down to rest your [pc.face] against the pillowy bronze skin of Ardia's belly. She moans softly, stroking your [pc.hair] as you nestle in against her. The shaft of her [ardia.cock] throbs gently, tantalizingly close to your face -- so much so that you soon find yourself enraptured by its sweet, intoxicating aroma. Even freshly washed, her musk leaves your mouth drooling and your thoughts come sluggishly. You just want to close your eyes and breathe deep, content in Ardia's tender embrace...");
	}
	else
	{
		output(" Ardia watches you hungrily every step of the way, and by the time you're ready to crawl in beside her, your alpha's [ardia.cock] is already getting hard. You don't need any instruction: you know exactly where you're sleeping tonight. You kiss your way down your mistress's chest and belly, making your way down to your pillows with a kiss on her crown for good measure. She gasps softly, smiling down as you bypass her dick entirely and make for her [ardia.balls]. Her fat orbs are so soft and succulent, overflowing your fingers as you hook your hands beneath then and bury your face in her sack. ");
		output("\n\nThe thick, musky scent of addictive seed churning beneath the surface is enough to instantly numb your mind. Your body takes over in its stead, opening wide to get your lips around as much taut ballsflesh as possible. Your [pc.tongue] laps along her skin, tasting the sweat and lust building up in the folds between her testicles. They're so big and full that they can comfortably support the whole weight of your head, and like resting it on a waterbed, your pillows jiggle softly as you settle in and let your mouth go about its sultry business. Her hardening cock flops forward under its own hardening weight, draping over your [pc.face]. Whatever willpower you might have had crumbles to dust the moment a dollop of pre " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "splatters on your back." : "trickles down your cheeks.") + " You lose yourself in worshipping your mistress's nuts all night long, as close to the source of your addiction as you can get...");
	}

	flags["ARDIA_SLEEPWITH_DOMORNING"] = 1;

	sleep(false);
}

public function ardiaWantsToDoMorningThings():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Wsan");
	processTime(15+rand(26));

	if (ardiaDomLevel() < 4)
	{
		output("Your eyes crack open and the first thing you notice is how <i>warm</i> you are in your bed, the temperature perfectly tuned so as to prevent getting up. Sighing pleasantly as you stretch your [pc.legOrLegs] out, you shift your head and see the source of your happiness: Ardia is cuddled up to you, like a big, loveable heated pillow. Her sleeping face is adorable, her pointy little nose twitching as she snoozes.");
		output("\n\nIt's about time to get up, though you could let her sleep in.");

		addButton(0, "Kiss Awake", onlyARushersKissCanWakeTheSleepingDzaan, undefined, "Kiss Awake", "Kisses! So many kisses for your cute d'zaan lover.");
		addButton(1, "Suck Awake", onlyYouCanPreventArdiasMorningWood, undefined, "Suck Awake", "What better way to wake someone up than with some loving oral sex?");
		addButton(2, "Let Her Sleep", function():void
		{
			clearMenu();
			clearOutput();
			showArdia();
			author("Wsan");
			output("Awww. Ardia's just too cute to disturb right now. Gingerly extracting yourself from bed, you slip out down the side to avoid lifting the blankets and letting a rush of cold air wake her. A big smile persists on your face as you start to head about your day, knowing Ardia is enjoying her beauty sleep uninterrupted.");
			addButton(0, "Next", mainGameMenu);
		}, undefined, "Let Her Sleep", "Look at that face. You can't bring yourself to wake her.");
	}
	else if (ardiaDomLevel() < 7)
	{
		output("You're stirred awake by your plump dzaan bedmate's stretching, your eyelids fluttering open as she rubs up against you. You're rapidly roused to full wakefulness when you feel Ardia's musky, bulging nuts against your [pc.thigh] and the hardness of her [ardia.cock], already dripping precum on your leg. The smell that billows up from beneath the warm blankets makes you groan, drool running from your [pc.lips].");
		output("\n\n<i>\"Good morning, [pc.name],\"</i> Ardia whispers, looking at you with quiet desire. <i>\"Do you want to… pay your respects to your alpha?\"</i>");
		output("\n\nThere's a note of hopefulness in her voice. She <i>is</i> beautiful, even at this hour, and that fat morning wood laid against you is extremely tempting…");

		addButton(0, "Suck Off", getBreakfastFromArdia, undefined, "Suck Her Off", "Give your alpha's hard cock some much-needed oral relief.");
		addButton(1, "Ride Cowgirl", vaginaRouter, [takeArdiaOnAMorningRide, ardia.cockVolume(0), 1, 0], "Ride Cowgirl", "Straddle your alpha's wide, womanly hips and ride her fat " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "equine" : "dzaan") + " cock like there's no tomorrow.");
		if (pc.cockThatFits(ardia.vaginalCapacity()) < 0) addDisabledButton(2, "Fuck Her", "Fuck Her", "You'd need a penis that fits to fuck Ardia.");
		else addButton(2, "Fuck Her", penisRouter, [fuckThatAlphaArdiaWhileSheStillLetsYou, ardia.vaginalCapacity(0),false,0], "Fuck Her", "Service your alpha with your cock.");
		addButton(3, "No Thanks", getBreakfastForArdiaInstead, undefined, "No Thanks", "You'll just bring her breakfast instead.");
	}
	else if (ardiaDomLevel() < 10 || rand(5) < 2) // DM7-10
	{
		if (rand(2) == 0) ardiaWakingYouUpButtFirst();
		else todaysBreakfastIsArdiasCum();
	}
	else // Extra DM10 only scenes
	{
		if (pc.hasVagina() && rand(3) == 0) PCPussyMeetsArdiaMorningWood(rand(pc.vaginas.length));
		else if (rand(2) == 0) ardiaMorningFaceFuck();
		else ardiaMorningButtfuck();
	}

	flags["ARDIA_SLEEPWITH_DOMORNING"] = undefined;
}

public function onlyARushersKissCanWakeTheSleepingDzaan():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Wsan");
	processTime(5+rand(6));

	output("You nuzzle up to Ardia, smiling as you press your face into her neck and plant a slow, soft kiss on her caramel skin, gently running your hand over her stomach to hold her. Brushing your [pc.lipsChaste] along her jaw and peppering her with kisses, you gradually pull her into you as she begins to stir, her eyelashes fluttering as her bright blue eyes become aware of the world once more.");
	output("\n\n<i>\"Good morning,\"</i> you whisper to her, at last putting your lips to hers. <i>\"Mmm…\"</i>");
	output("\n\n<i>\"Mm- hmm,\"</i> Ardia sighs, her eyes falling closed once more as she wraps her arms around your back and settles back. <i>\"Mmn.\"</i>");
	output("\n\nYou run your hand up from her hips to her face, skimming her skin as your fingertips brush her hair back out of her pretty features. A beatific smile begins to spread across Ardia's face and soon, she can't help but pull back and giggle, hugging you tight" + (pc.hasTail() && pc.tailType == GLOBAL.TYPE_CANINE ? " as your [pc.tails] " + (pc.hasTails() ? "wag" : "wags") + " under the sheets." : "."));
	output("\n\n<i>\"Good morning, [pc.name],\"</i> she whispers back. <i>\"Thanks for waking me up.\"</i>");
	output("\n\n<i>\"I'm going to get some breakfast,\"</i> you murmur, kissing her right on the nose. <i>\"Do you want me to bring you some?\"</i>");
	output("\n\n<i>\"Oh, I could use some of that Terran coffee you introduced me to,\"</i> she says, ears wiggling eagerly. <i>\"I-if it's not too much trouble.\"</i>");
	output("\n\nYou sit with Ardia and spend your breakfast chatting to her with a smile, passing the time as she takes small sips from her warm coffee. Afterwards, you head about your day -- but not before you watch the blushing d'zaan get dressed. That body is <i>divine</i>, and you tell her as much as you give her a last kiss on the lips to start the day off right. Her cheeks are still burning as you leave the room. What a cutie!");

	addButton(0, "Next", mainGameMenu);
}

public function onlyYouCanPreventArdiasMorningWood():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Wsan");
	processTime(15+rand(16));

	output("You burrow into the blankets, working your way down towards the grand prize -- and what a prize it is. Ardia hardly stirs as you lay your hands on her hot, fat balls and lean in to affectionately kiss her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "thick, half-hard horsecock." : "chubby, half-hard d'zaan cock.") + " A grin spreads across your face -- <i>this</i> part of her is definitely awake and ready for you. It throbs and hardens against your [pc.lips] almost immediately, " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "black" : "caramel") + " skin stretching taut as her erection surges to life.");
	output("\n\nYour breath comes hot and heavy under the sheets as you lay your lips on her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "flared" : "swollen") + " tip and slowly run your [pc.tongue] across its underside, licking all around the sensitive head and smiling at the instant response of her body. How close can you get to swallowing her cum before she wakes up? You're going to find out.");
	output("\n\nGently climbing atop her and spreading your [pc.legs] to either side of her gorgeous body, you close your eyes and begin to dreamily bob your head up and down, taking her cockhead into your mouth and hollowing your cheeks. Ardia sighs in her sleep, spreading her arms out like a starfish, and you have to stop yourself from " + pc.mf("laughing.", "giggling.") + " You can only imagine what she's dreaming of but you're secure in the knowledge that whatever it is, an even better one awaits her in the waking world.");
	output("\n\nYou moan in pleasure as you start to suck her cock in earnest, unable to hold yourself back. You her to feel good so badly and it feels so good to indulge that urge, you're soon blowing her as hard as you can with your hands planted squarely on either side of her enormous breasts. She begins to stir and grunt, her plump nipples hardening as you give her the best you've got, delicious precum spilling into your cheeks and disappearing down your throat.");
	output("\n\n<i>\"Nnnhh,\"</i> Ardia moans, fingers twitching as she weakly grips the sheets. <i>\"St-Stee… le…\"</i>");
	output("\n\nIs she dreaming about <i>you</i>? Now <i>you're</i> the one blushing as you suck her cock, edging her closer to orgasm by the second if the " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "flaring" : "frenetic throbbing") + " in your throat is any indication, thinking only of your adorable d'zaan lover. When your lips " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "pop around her medial ring" : "come in contact with her soft groin") + ", that's all the help she needs -- Ardia comes awake with a loud, erotic moan and a flex of her plump, juicy thighs, and in the next second you're gulping down a thick, steady flow of d'zaan semen.");
	output("\n\nYou shift your hands to her gigantic balls and massage them as she shakily lifts the blanket, panting as she discovers just what's going on, then letting her head fall back on the pillow with a groan of ecstasy. Her big, curvy ass jiggles as she instinctively rocks her hips up and down, fucking her spunk down your gullet and painting your insides a delightful shade of creamy white. You're in heaven, sucking the heady loads right from her pulsating balls while you stimulate them to produce ever more. This is the best morning wakeup ever…");
	output("\n\n<i>\"Oooohhhnnh,\"</i> Ardia moans as you pop off her softening cock, at last freed from the warm confines of your mouth. She shivers into the mattress, letting out a deep, contented sigh. <i>\"Th-thank you so much for the wake-up call, [pc.name]...\"</i>");
	output("\n\nIt takes you a few seconds of swallowing to get the reply out -- her first load in the morning is so <i>virile</i> -- but you manage it in the end. <i>\"Ngh- no problem, Ardia. Do you want some breakfast? I'll bring you some.\"</i>");
	output("\n\n<i>\"Toast, please,\"</i> Ardia says, waking up a little more at the prospect of tasty Terran treats. <i>\"A-and butter, if that's okay.\"</i>");
	output("\n\n<i>\"Sure,\"</i> you say, smiling up at her. You plant a kiss right on her tummy as she giggles and rub her affectionately as you hop out of bed, " + (pc.isNaga() ? "slithering" : "padding") + " away to bring your lover breakfast in bed.");
	output("\n\nShe looks so happy to see you return that you can't help but keep her company as she happily devours the toast, shining like the sun. What a cutie. You make sure to catch her from behind as she's dressing and give her a hug and a kiss, pulling her against you for some loving contact before you head off to start your day.");

	pc.loadInMouth(ardia);
	ardia.orgasm();
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_WAKEUP");

	addButton(0, "Next", mainGameMenu);
}

public function getBreakfastFromArdia():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Wsan");
	processTime(15+rand(16));

	output("You duck down beneath the blankets as a smile spreads across Ardia's face, the dzaan lying back down on her pillow and dragging her leg back to expose the entirety of herself to you. Stars, you feel so grateful to be able to wake up to this every morning. Mostly blind in the darkness of under the covers, you gently place your hands on her " + (ardia.hasPerk("'Nuki Nuts") ? "gigantic cumtanks" : "seed-filled balls") + " and guide yourself by hand to the " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "flared equine head" : "swollen, sensitive head") + " of her cock.");
	output("\n\nOh, fuck, she tastes so good. Ardia lets out a muted groan from above the covers as your [pc.lips] slowly, worshipfully, wrap around her fat cockhead and your [pc.tongue] works her glans. You trace a trail all around the tip, flicking it across her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "protruding nozzle" : "little cumslit") + " and getting a taste of hot, salty precum for your efforts. That's all the motivation you need to take it a little deeper, hollowing your cheeks and sucking hard for more.");
	output("\n\nIf there's something that makes Ardia uniquely gifted as an alpha, it might be her ability to stay hands-off and let you work for her enjoyment. She begins letting out pleasured moans as you bob your head, gently taking her into your gullet and letting her bulging head get romantically acquainted with the back of your throat. The little spurt of warm precum that sticks in your esophagus and slowly rolls down is all the positive feedback you desire.");
	output("\n\n<i>\"Juuust a little more, [pc.name],\"</i> Ardia sighs, her hips rolling a little. <i>\"Mmmngh…\"</i>");
	output("\n\nAt that, you suppress your gag reflex and work down to the base of her thick" + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? ", veiny horsecock, pressing your lips into her sheath and taking deep inhales of her musky, feral scent." : " dzaancock, your tongue snaking out to lap at her sweaty balls.") + " It doesn't take long. With a groan of ecstasy Ardia cums, her rock hard dick pulsating between your lips as warm jism shoots down your throat, locking you in carnal worship.");
	output("\n\nYou suck and swallow, groping her nutsack and massaging her gently pumping balls, exhorting them to give you every last delicious drop. Rope after rope spews into your stomach" + (ardia.hasPerk("'Nuki Nuts") ? ", spurting continuously until it feels like you're drinking down a hot, sticky river of spunk that leaves your dizzied mind sated and your roiling belly full." : " until you feel full of her, drinking the essence of your alpha until she's sated.") + " You slowly emerge from underneath the covers, eyes half-lidded and gazing desirously at your alpha's beautiful features.");
	output("\n\n<i>\"You missed a spot,\"</i> your lover murmurs, leaning in to kiss you. <i>\"Mmm…\"</i>");
	output("\n\nHer tongue deftly wraps around yours, rolling over it and playing with you until Ardia pulls back and sighs happily.");
	output("\n\n<i>\"Would you mind getting me some food and coffee, [pc.name]?\"</i> she asks, smiling and gently squeezing your [pc.nipple]. <i>\"I'd like a few minutes to rest after that.\"</i>");
	output("\n\nYou hop to it. Now that your alpha's given you your breakfast, the least you can do is fetch hers. Once she's well fed and sitting upright in bed, you go about your day happy and fulfilled.");

	pc.loadInMouth(ardia);
	ardia.orgasm();
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_WAKEUP");

	addButton(0, "Next", mainGameMenu);
}

public function takeArdiaOnAMorningRide(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Wsan");
	processTime(60+rand(121));

	output("Pulling the blankets up, you sleepily roll on top of Ardia and push until she's lying flat on her back, smiling up at you. With her hands on your [pc.hips] she guides you back, lifting her butt until the head of her cock catches in the entrance of your [pc.vagOrAss " + vagIdx + "] -- then roughly pulling you down onto it, grinning wide as she does. You let out a deep, pleasured groan as");
	if (pc.isHerm()) output(" your [pc.cocks] " + (pc.hasCocks() ? "harden" : "hardens") + ", standing straight up while arousal drips from your pussy around her shaft.");
	else if (pc.hasCock()) output(" your [pc.cocks] " + (pc.hasCocks() ? "harden" : "hardens") + ", standing straight up in less than a second.");
	else if (vagIdx >= 0) output(" arousal drips from your pussy around her shaft.");
	else output(" her rock hard shaft sinks into your bowels, the veins stimulating all sorts of sensitive nerves.");
	output(" <i>Fuck</i>, that feels good.");
	if (vagIdx < 0) pc.buttChange(ardia.cockVolume(0));
	else pc.cuntChange(vagIdx, ardia.cockVolume(0));
	output("\n\n<i>\"Think you can move, [pc.name]?\"</i> Ardia asks, teasing you. <i>\"Or are you going to make your alpha do all the work?\"</i>");
	output("\n\nYou respond by raising your hips and sliding back down, moaning in happiness as your alpha fills you once more. Rolling back and forth, you fuck yourself on Ardia's stiff " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "equine" : "dzaan") + " cock while she links her hands behind her head, content to relax and watch you work for her pleasure. You're only too happy to let her enjoy the respect your alpha truly deserves.");
	output("\n\nOf course, having the beta ride [pc.hisHer] alpha's penis comes with a downside -- namely, that you are going to cum far, far before she does. You spend upwards of half a minute writhing atop her and gasping");
	if (pc.isHerm()) output(" while [pc.cum] splatters across her smooth stomach, Ardia deigning to run her finger through it and give her digit a cursory lick. She runs her tongue along her sexy lips, grinning at you.\n\n<i>\"I think mine probably tastes better to you than vice versa, but who knows?\"</i> she says, shrugging her shoulders casually and settling back. <i>\"Maybe wasted beta seed is an acquired taste. Your pussyjuice, though… that's the good stuff.\"</i>");
	else if (pc.hasCock()) output(" while [pc.cum] splatters across her smooth stomach, Ardia deigning to run her finger through it and give her digit a cursory lick. She runs her tongue along her sexy lips, grinning at you.\n\n<i>\"I think mine probably tastes better to you than vice versa, but who knows?\"</i> she says, shrugging her shoulders casually and settling back. <i>\"Maybe wasted beta seed is an acquired taste.\"</i>");
	else if (pc.hasVagina()) output(" while your pussy clenches up on her and spatters her smooth groin in [pc.girlCum]. Ardia runs her finger along your pussylips and rubs it up your [pc.clit " + vagIdx + "], making you grit your teeth and groan deeply before she drags her finger through a small puddle of your juices and pops it into her mouth.\n\n<i>\"That's good,\"</i> she says casually, winking at you. <i>\"Perhaps beta pussyjuice tastes nicer to alphas. Makes sense to me.\"</i>");
	else output(", trying to control yourself and failing utterly until Ardia reaches up and tweaks your [pc.nipples].\n\n<i>\"Forgetting why you're up there?\"</i> she asks, smiling casually. <i>\"A little respect, Steele.\"</i>");
	output("\n\nYou do your utmost to return yourself to milking her, flexing your core and moaning as you drag yourself up and down her engorged cock, " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "your " + (pc.hasVagina() ? "pussylips" : "ring") + " stretching wide to accept her medial ring every time you bottom out." : "biting your lip every time her keratin nubs rub against your oversensitive " + (vagIdx >= 0 ? "walls." : "insides.") + " You stare down at her in wonder and adoration. No wonder betas so readily serve their alphas -- she's not even <i>doing</i> anything…"));
	output("\n\n<i>\"That's right,\"</i> she murmurs, smiling confidently up at you. <i>\"You want that alpha sperm, don't you?\"</i>");
	output("\n\n<i>\"Yes,\"</i> you moan, letting your head fall as your hands squeeze her tummy for grip. <i>\"Oh, god, Ardia…\"</i>");
	output("\n\n<i>\"I'm close, you know,\"</i> Ardia promises, flexing her cock inside you. The effect is <i>very</i> noticeable. <i>\"Just a bit more, [pc.name].\"</i>");
	output("\n\nOh, stars -- fuck it! Crying out in need, you begin to slam your [pc.hips] into her groin as it rises to meet you, a savage grin breaking out on your alpha's face. The loud slap of your [pc.ass] bouncing off her plump body echoes in your room, precum spurting up into your stretched-taut orifice until finally, with a straining grunt, Ardia blows her load.");
	output("\n\nHer [ardia.balls] tighten and pulse against your shivering ass, " + (ardia.hasPerk("'Nuki Nuts") ? "her overloaded 'nuki nuts" : "her bulging balls") + " working furiously to pump piping hot alpha cum right up into your " + (vagIdx >= 0 ? "[pc.womb " + vagIdx + "]" : "bowels") + " in dense ropes. She cums time and time again, groaning in bliss as you just try to keep your seating, gasping open-mouthed as sweat drips from your face, your [pc.stomach] tightening with pleasure in time with her ejaculations. She's so <i>virile</i>!");
	output("\n\n" + (ardia.hasPerk("'Nuki Nuts") ? "Your tummy swells with the sheer weight of her immense loads, liquid mass giving you a misshapen baby bump." : "The warmth of her loads suffuses your core until it feels like your midriff is twice as hot as any other part of your body, your brain swimming in the ecstasy of fullness.") + " You feel a lusty pride amidst the orgasmic rapture; that's <i>your</i> alpha's cum, and it's right where it belongs. You couldn't be happier.");
	output("\n\n<i>\"The way you just lose yourself when I tell you I'm going to cum is hotter than any other part of being your alpha,\"</i> Ardia murmurs to you, cupping your cheek. <i>\"<b>Such</b> a good beta.\"</i>");
	output("\n\n<i>\"Th-thank you,\"</i> you manage haltingly, your pupils dilating as you start to realize all over again what a direct injection of alpha semen feels like. <i>\"O-oh, f-f-fuhck, alpha…\"</i>");
	output("\n\n<i>\"Good [pc.boyGirl],\"</i> she whispers, patting her big, soft breasts. <i>\"Lie down.\"</i>");
	output("\n\nYou collapse into her arms as she guides you downwards, lying atop her as the sensation of complete and utter submission washes over you. The sacred bond between an alpha and her lucky beta is one you'll be sure to never, ever betray, and when you gaze lovingly up at Ardia you can see her smiling back at you.");
	output("\n\n<i>\"I love yooouuu,\"</i> you moan quietly.");
	output("\n\n<i>\"I love you too, darling,\"</i> Ardia says, stroking your [pc.hair] as your eyes fall closed. <i>\"Get some rest, you've earned it.\"</i>");
	output("\n\n--");
	output("\n\nYou awaken a couple of hours later, still warm and decidedly unclean -- but <i>extremely</i> satisfied. You feel like you could take on the world right now with your alpha backing you up. Sighing happily, you spreadeagle in your bed and stretch, feeling the fatigue drain from your muscles. Time to get up.");

	if (vagIdx < 0) pc.loadInAss(ardia);
	else pc.loadInCunt(ardia, vagIdx);
	ardia.orgasm();
	pc.orgasm();
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_WAKEUP");

	addButton(0, "Next", mainGameMenu);
}

public function fuckThatAlphaArdiaWhileSheStillLetsYou(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Wsan");
	processTime(45+rand(61));
	
	output("<i>\"Oh? How should I read into this?\"</i> Ardia teases you as you straddle her legs, holding her [ardia.cock] firmly while you lay your [pc.cock " + cockIdx + "] against the heat of her cunt. <i>\"Come on, then. Show your big, <b>bad</b> alpha how much of a stud you are, [pc.name].\"</i>");
	output("\n\nYou slowly slide your [pc.cockHead " + cockIdx + "] into Ardia's tight, juicy slit and groan with pleasure as she squeezes down on you, spreading her plump thighs. She's so warm and wet inside you have to stop yourself from going all-out right from the start, reminding yourself that your alpha comes -- and cums -- first. An appreciative, erotic moan comes from her lush lips as you gradually push deeper, stimulating her sensitive walls.");
	pc.cockChange();
	output("\n\nWith one hand on her fat prick and lovingly rubbing it, you use the other to gently glide your thumb over her erect clit. The little bulging button is well hidden beneath her enormous balls but you know your alpha, and learning how to best please her is the joy of any obedient beta. Her happy groan when you press into her erect pleasure buzzer resounds in your mind, lighting up your pleasure centres.");
	output("\n\n<i>\"Juuust like that,\"</i> she coos, rolling her hips and laying her head back. <i>\"Aah…\"</i>");
	output("\n\nYou feel the sticky liquid heat of Ardia's precum rolling over your grasping fingers as you slowly jack her off, matching the pace of your swinging hips and clit-massaging thumb. After a few minutes of caring worship she's shivering in bliss, her pussy clinging to you with every full-body clench of her muscles. It feels like she's trying to milk the cum out of you.");
	output("\n\n<i>\"Ah! [pc.name], you're gonna make me cum,\"</i> Ardia pants, lifting her considerable hips. <i>\"Don't let your alpha's seed go to waste!\"</i>");
	output("\n\nThe prospect of feeling her ejaculate all that stored-up jism into your mouth is too much to pass up. You lean forward and bend down to catch the swollen " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "flare" : "head") + " of her cock <i>just</i> in time -- right as the slow drip of her precum halts and her shaft thickens, throbbing between your [pc.lips].");
	output("\n\n<i>\"Oh! Oh, fuck, yes,\"</i> Ardia groans, grasping the sheets wildly, crumpling them up. <i>\"Hnnngh! Nnnnnn-\"</i>");
	output("\n\nThe sensation of your alpha's thick, warm jizz spraying into your mouth and filling your cheeks combined with the way her dripping pussy clenches up on you are, separately, more than enough to make you cum. Combined, they force you to orgasm instantly and violently, driving your beta instincts wild. You pull out of the vicegrip of her clasping cunt and, spraying wasted seed all over your sheets, force yourself down to the very base of her pulsating shaft.");
	output("\n\nYou can't tell if the delighted airy laugh is real or imagined but honestly, you're not paying attention to that. You're paying attention to the way her thick, hard and hot shaft pulses and throbs in your throat, each load spurting down your gullet and splattering into your stomach as your alpha's thighs come to squeeze your head from either side. She keeps you there, wriggling and rubbing as the ecstasy of orgasm courses through her, your eyes rolling upward in sheer joy.");
	output("\n\nYour own orgasm forgotten, you wrap your arms around her shaking legs and ensure she doesn't need to hold you down -- you'll stay here until she's squirted the very last drop of her delicious and vitally important alpha seed into your stomach or until you pass out from lack of air. Fortunately it doesn't come to that, your grinning lover dragging you up her pulsating penis to allow you a brief, gasping breath of air before pushing you back down and parking you <i>right</i> up against her sweaty, musky balls.");
	output("\n\nIt feels like you've died and gone to heaven.");
	output("\n\nBy the time she pulls out with a satisfied groan, you're ruined. A bubbly mixture of saliva and semen drips from your chin, mouth open and gasping in pleasure. Ardia sits up and stretches, humming as she turns this way and that to work out all the kinks, then graces you with a happy smile.");
	output("\n\n<i>\"Thanks for the fuck, [pc.name]. You're a great lay,\"</i> she tells you. <i>\"I bet you could make any girl happy with technique like that!\"</i> ");
	output("\n\nDizzy and addicted as you are, it's hard to tell if any of that really happened… the last twenty minutes are a drunken blur in your head, but the end result is undeniable. Your alpha came hard, and that's what matters. Bending down, she kisses you on the top of the head and springs off the bed, breasts jiggling. ");
	output("\n\n<i>\"I'm going to get myself some breakfast,\"</i> Ardia announces. <i>\"I guess you're not going to need any… oh, before I go,\"</i> she says, turning back as if she's suddenly realized something, <i>\"can you clean me off?\"</i>");
	output("\n\nShe holds out her half-hard cock, absolutely coated from thick, " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "half-sheathed base to swollen, flared tip" : "keratin-covered base to swollen head") + " in a slurry of your juices and her wildly addictive alpha semen. You don't even need to think about it.");
	output("\n\nAlready kneeling, you mindlessly lean forward and suck her as hard as you can, greedily swallowing her offerings until she's satisfied with the job you've done. Flashing you a grateful smile, she gets dressed and leaves to grab some food. You, on the other hand, crawl back up onto the bed and pant, still deep within the grasp of Ardia's chemical bond, the invisible chain binding you to her. Your eyes flutter closed as the intense, fiercely satisfying pleasure of submission courses through you, " + (pc.hasVagina() ? "your " + (pc.hasCocks() ? "cocks" : "cock") + " slowly standing upright and your " + (pc.hasVaginas() ? "pussies" : "pussy") + " gradually becoming wetter even as you fall back to sleep." : "your " + (pc.hasCocks() ? "cocks" : "cock") + " slowly standing upright even as you fall back to sleep."));
	output("\n\n--");
	output("\n\nWhen you awaken, you can feel the dried semen all over your [pc.skinFurScales]. Strangely enough, you don't really mind -- it's dirty, but it's Ardia's. Smiling fondly as you gaze up at the ceiling, you allow yourself a sigh of happiness and a few extra seconds of rest before you hop out of bed, ready to take on the day. You'll have to thank her later.");

	ardia.loadInCunt(pc);
	ardia.orgasm();
	pc.orgasm();
	pc.applyCumSoaked();
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_WAKEUP");

	addButton(0, "Next", mainGameMenu);
}

public function getBreakfastForArdiaInstead():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Wsan");
	processTime(15+rand(16));

	output("<i>\"U-um,\"</i> you say haltingly, pupils dilating slightly as you stare open-mouthed at her cock. <i>\"I'll- I'll just get you some, some breakfast…\"</i>");
	output("\n\n<i>\"Breakfast?\"</i> Ardia chirps, ears perking up and twitching. <i>\"Oh, that sounds wonderful, actually.\"</i> She leans back, packing the pillows so she can sit up in bed and smiling at you. <i>\"Bring me some toast and coffee, then. I missed coffee.\"</i>");
	output("\n\nYou hop to it, trying your damnedest not to think of that veiny, <i>thick</i> -- stars, she was only half-hard at the time -- penis of hers, entertaining the notion that you could live without it. Your distracted, fumbling attempts to wrangle breakfast result in a slight mess of output, but it's the best you can do right now. You serve your alpha breakfast in bed, hopping back into the warm blankets to join her.");
	output("\n\n<i>\"Oh, you didn't get any for yourself?\"</i> Ardia notes, munching away happily. <i>\"You must not be very hungry this morning, huh [pc.name]? It's okay, I'm just happy you're with me.\"</i>");
	output("\n\nShe puts her arm around your shoulders and hugs you close, pulling you into her plush, feminine body. You spend the next few minutes cuddled up to her in utter bliss while she eats, polishing off her breakfast and leaning in to give you an affectionate kiss.");
	output("\n\n<i>\"Thanks for the food, [pc.name],\"</i> she says, " + (pc.hasHair() ? "ruffling your [pc.hair]." : "rubbing your head.") + " <i>\"I'm gonna get up but you swing by and say hi if you're feeling needy, okay? I'm here for you.\"</i>");
	output("\n\nShe kisses you again and dresses, leaving the room. You lie in bed for a few moments, wondering why your");
	if (pc.isHerm()) output(" [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " so hard and your [pc.pussies] " + (pc.hasVaginas() ? "are" : "is") + " so wet");
	else if (pc.hasCock()) output(" [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " so hard");
	else if (pc.hasVagina()) output(" [pc.pussies] " + (pc.hasVaginas() ? "are" : "is") + " so wet");
	else output(" insides are so hot");
	output(" before you remember the sight you woke up to. Those fat, seed-filled balls… fuck, you're going to have to masturbate to get this out of your head, or better yet, go see her as soon as you can.");
	output("\n\nYou roll out of bed, hungry in more ways than one.");

	pc.lust(20+pc.libido()/5);

	addButton(0, "Next", mainGameMenu);
}

public function ardiaWakingYouUpButtFirst():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Wsan");
	processTime(40+rand(16));

	output("You're awoken by a soft, rhythmical motion, your eyes slowly fluttering open as you slide up and down the mattress -- only to find Ardia, smiling down at you from a few inches away. Her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "enormous horsecock" : "stiff d'zaan cock") + " is half-hilted in your [pc.asshole], and you realize your pleasant fading dream was startling close to reality.");
	pc.buttChange(ardia.cockVolume(0));
	output("\n\n<i>\"Hello, my lovely beta,\"</i> Ardia murmurs, leaning in to kiss your cheek. As her weight sinks down on you, her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "flared" : "swollen") + " cockhead slips even deeper into your intestine and you moan in pleasure, knowing you're right where you want to be. <i>\"I thought I would start your day off right with a quick load from your Alpha. Is that what you want?\"</i>");
	output("\n\n<i>\"Y-yes,\"</i> you sigh happily, clutching the sheets and spreading your [pc.legs] to allow her easier access. <i>\"Yes, please…\"</i>");
	output("\n\n<i>\"I thought so,\"</i> she whispers, gently squeezing your [pc.nipple]. <i>\"You do deserve it. Lucky for you, I've been having sex with your asshole for a few minutes now -- I'm close to cumming, [pc.name]...\"</i>");
	output("\n\nYou can see it in her eyes. She knows, and she knows that you know. She just wants you to ask for it, to bare your depraved need for her, to show her your vulnerability. You can't think of anything hotter.");
	output("\n\n<i>\"Fuck me,\"</i> you moan, gripping the cheeks of your [pc.ass] tightly and pulling them apart. <i>\"Pound me until you cum!\"</i>");
	output("\n\n<i>\"That's right,\"</i> Ardia sighs, rocking her massive hips as you begin to moan in need. <i>\"Good [pc.boyGirl].\"</i>");
	output("\n\nHaving your alpha's cock sliding smoothly into your asshole, knowing it's going to explode in a mess of thick, creamy d'zaan jizz, is unlike any kind of pleasure you've ever experienced. A deep, feral groan of animal need escapes your lips as she mating presses you into the mattress, her " + (ardiaHugeBalls() ? "enormous seed-filled cumtanks" : "fat, seed-filled testicles") + " smacking against you so hard it's all you can hear save for your lover's sexy grunts.");
	output("\n\n<i>\"Getting- close,\"</i> Ardia pants in your ear, holding her forehead to yours as she meets your eyes, your faces flushed and dripping with sweat while her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "cockhead flares" : "cock throbs") + " deep in your ass. <i>\"Take it!\"</i>");
	output("\n\nShe kisses you with a savage need as her hips grind upwards into your groin and suddenly you're in heaven, eyes rolling back as her tongue invades your mouth and you");
	if (pc.isHerm()) output(" both cum all over your own stomach " + (pc.isSquirter() ? "and squirt into her tightening nutsack" : "and with your empty pussy"));
	else if (pc.hasCock()) output(" cum all over your own stomach");
	else if (pc.hasVagina()) output((pc.isSquirter() ? " squirt all over her tightening nutsack" : " cum with your empty pussy"));
	else output(" cum with her");
	output(", thick, drug-laden alpha seed jetting upwards into your insides. She pulls back and clenches her jaw, slamming her cum-pumping cock balls-deep in your " + (pc.hasPlumpAsshole() ? "puffy ring" : "slutty ass") + " while you let out the loudest screams of ecstasy of your life, wrapping your arms and " + (pc.hasLegs() ? "lower body" : "legs") + " around her back and hips.");
	output("\n\nYou pass out from the rapturous pleasure and instantly come to as another massive load splatters into your bowels, ensuring your servile submission to your alpha. Waves of unmatched bliss roll across the landscape of your brain, disrupting any and all thought process not devoted to your one and only, your true love. By the time Ardia pulls back to get a good look at her beta whore's face, your pupils are dilated enough for her to see her reflection in them.");
	output("\n\nShe grins, sweat dripping from chin down onto her voluptuous breasts. <i>\"Good morning, [pc.name].\"</i>");
	output("\n\n<i>\"Th- thank you, alpha,\"</i> you manage to gasp, your heart hammering in your chest as complete and utter fulfillment washes over you. <i>\"Oh, stars, thank you so much…\"</i>");
	output("\n\nArdia allows you to clean her half-hard cock off in the shower, down on your hands and knees and looking up at her beautiful blue eyes while you obediently hollow your cheeks and suck out every last drop of delicious jizz from her cockhole. Stroking your [pc.hair] as the warm water courses over your sweaty bodies, she hums a quiet tune while she washes her top half off. You, of course, lick clean the bottom half.");
	output("\n\n<i>\"Careful now, cutie,\"</i> she warns you good-naturedly as you begin to suck her cock deeper into your mouth, moaning while");
	if (pc.isHerm()) output(" your [pc.cocks] " + (pc.hasCocks() ? "harden" : "hardens") + " and your [pc.pussies] " + (pc.hasVaginas() ? "begin" : "begins") + " dripping on the shower floor.");
	else if (pc.hasCock()) output(" your [pc.cocks] " + (pc.hasCocks() ? "harden." : "hardens."));
	else if (pc.hasVagina()) output(" your [pc.pussies] " + (pc.hasVaginas() ? "begin" : "begins") + " dripping on the shower floor.");
	else output(" you gently massage her thighs.");
	output(" <i>\"Nnn… get me hard again and you're going to have to take care of me before you leave.\"</i>");
	if (pc.isHerm()) output("\n\nA tiny bit of precum spurts and dribbles down the underside of your rigid " + (pc.hasCocks() ? "penises" : "penis") + ", your " + (pc.hasVaginas() ? "pussies" : "pussy") + " tightening");
	else if (pc.hasCock()) output("\n\nA tiny bit of precum spurts and dribbles down the underside of your rigid " + (pc.hasCocks() ? "penises" : "penis"));
	else if (pc.hasVagina()) output("\n\nYour " + (pc.hasVaginas() ? "pussies" : "pussy") + " automatically tighten");
	else output("\n\nYour eyes go wide");
	output(" at the declaration. Grabbing her jiggly asscheeks, you begin tilting your head and throating Ardia's cock as enthusiastically as you can, endeavoring to convince your alpha to stay behind and give you what you want. She giggles, smiling knowingly as she tilts her head upwards and shampoos her lovely blue hair.");
	output("\n\nArdia finally exits your room half an hour later in search of breakfast, humming happily with a spring in her step. You lay spreadeagled on your bed with her semen dripping from the corners of your mouth, your [pc.tongue] slowly lapping at the trails as they spatter onto your pillow while you lazily");
	if (pc.isHerm()) output(" jack your " + (pc.hasCocks() ? "cocks" : "cock") + " off to a weak, depleted orgasm and then swallow, your " + (pc.hasVaginas() ? "pussies" : "pussy") + (pc.isSquirter() ? " squirting into the sheets." : " clenching up in sympathetic pleasure."));
	else if (pc.hasCock()) output(" jack yourself off to a weak, depleted orgasm and then swallow.");
	else if (pc.hasVagina()) output(" fingerfuck your pussy to a weak orgasm and then swallow.");
	else output(" hold the warm, salty cum in your mouth before swallowing.");
	output(" What a perfect start to your day.");

	pc.loadInAss(ardia);
	if (pc.hasCock()) pc.applyCumSoaked();
	pc.orgasm();
	ardia.orgasm();
	pc.loadInMouth(ardia);
	pc.orgasm();
	ardia.orgasm();
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_WAKEUP");

	addButton(0, "Next", mainGameMenu);
}

public function todaysBreakfastIsArdiasCum():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Wsan");
	processTime(15+rand(16));

	output("You awaken to a familiar sensation of warmth drooling between your [pc.lips] and a comforting hand running " + (pc.hasHair() ? "through your [pc.hair]" : "over your head") + ". You open your eyes to find Ardia sitting on your chest smiling lovingly down at you, gently squeezing precum from her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "enormous equine cock" : "keratin-covered cock") + " into your mouth. You open your lips wide for her and she murmurs in approval, caressing your face as she slides the tip across your cum-lubed tongue.");
	output("\n\n<i>\"Good [pc.boyGirl],\"</i> Ardia whispers. <i>\"Take care of my morning wood and you can go back to sleep.\"</i>");
	output("\n\nNot likely. You bring your hands to her immense hips and grip her, closing your eyes as you raise your head of the pillow to suck the " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "thick flared head" : "swollen head") + " of her beautiful alpha cock. Ardia lifts her head and groans in elation, a fresh stream of pre-seed spewing down your throat.");
	output("\n\n<i>\"Ooohhhh, Steele… you're quick on the uptake,\"</i> Ardia sighs. <i>\"That's one of the things I'll always love about you.\"</i>");
	output("\n\nLove is all you can feel as your alpha's veiny cock gently slides into the entrance of your throat, your [pc.tongue] eagerly lapping at the underside and ensuring every inch of her gets the worship she so deserves. " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "An erotic thrill runs through you when her medial ring pops past your subservient lips, the thickening leathery base entering your mouth as you stretch your jaw wide for her. Stars, the precum spurting down your throat feels <i>so</i> fucking good! Even the feeling of her flare gently" : "You gurgle in happiness as you take her all the way to the base, your chin coming to rest against her " + (ardia.hasPerk("'Nuki Nuts") ? (ardiaHugeBalls() ? "gargantuan" : "enormous seed-filled") : "big, shapely") + " nuts. Even just the feeling of her bulging cockhead") + " rubbing your esophagus sets you alight with blazing desire.");
	if (flags["USED_SNAKEBYTE"] != undefined) output("\n\nThanks to the SnakeByte not only can you take " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "the massive, desire-swollen shaft of your alpha's horsecock deep into your throat" : "your alpha's desire-swollen shaft deep in your throat") + " but you can massage her all throughout. Decadent groans leak from your lover's lips as you tighten and squeeze around her, wringing her from sensitive tip to bulging base with your mouth comfortably planted at her groin kissing her plush body. The pleasure of serving her is so prominent in your spinning mind there's no room for anything else, and it's that which drives you forward, hands groping at her big, soft butt while she moans in pleasure.");
	else output("\n\nYou choke down " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "the massive, desire-swollen shaft of your alpha's horsecock" : "your alpha's desire-swollen shaft") + " as she drives it into your throat, your teary eyes rolling in pleasure. Nothing feels as good as when she takes charge of you, plunging her thick, cum-spurting cock into your desirous holes. The pleasure of serving her drives you to grab her big, soft ass and squeeze, pulling her into you in a silent display of submission.");
	output("\n\n<i>\"Oohhhh, fuck,\"</i> Ardia groans deeply, her face upturned as she lazily humps your lips. <i>\"Here we go -- make sure to suck it all down like a good beta…\"</i>");
	output("\n\nWith your mouth pressed firmly to her groin Ardia lets out a loud, erotic moan, her rock-hard shaft throbbing violently");
	if (ardia.hasCock(GLOBAL.TYPE_EQUINE)) output(" as her flare flowers within you");
	output(". Not even a second passes before your throat is suddenly <i>full</i> of thick, creamy alpha seed, pumping down into your stomach with such dominant force you cum " + (pc.hasLowerGarment() ? "in your undergarments." : "on the spot.") + " Your neck ebbs and swells with every hot load dumped into it, your insides churning as they're filled with Ardia's spunk.");
	if (ardiaHugeBalls()) output("\n\n<i>\"Oohhhh, <b>god</b>!\"</i> Ardia moans, taking your head in her hands. <i>\"Drink it, you fucking beta cumtank -- uh! Nnnn- nnngh!\"</i>\n\nHelpless and unwilling to resist, you lie on your back and let your alpha pump your stomach so full of her potent sperm that it swells with liquid weight, rising further by the second. Panting and sweaty, she thrusts into the recesses of your throat and flexes her cock as what must surely be the last few remainders of hot cum work their way down your esophagus in sticky globs and splatter into the rest. By now you're cognizant of nothing but the continual warmth gracing your insides but luckily, nothing else matters anyway.");
	else if (ardia.hasPerk("'Nuki Nutbutter")) output("\n\nYour alpha's prodigious output continues without pause, your hands slipping down to rest atop her enormous pulsing balls. Her sack is drawn tight around them, each amazingly overlarge testicle working hard to send a flowing river of warm, sticky spunk down your obedient throat. You silently thank your alpha over and over, gazing up at her in ardent worship as she grunts and groans in exertion. How blessed you are to be here and receive the entirety of her lusts.");
	output("\n\nWhen she finally pulls out, you dimly realize your alpha is allowing you to breathe again. You take one long, shuddering gasp and then another as she inspects her handiwork with a smug grin, rubbing your " + (ardia.hasPerk("'Nuki Nutbutter") ? (ardiaHugeBalls() ? "absurdly distended stomach with a dominant, possessive hand." : "swollen, semen-filled stomach with a possessive hand.") : "semen-filled stomach with an affectionate hand."));
	output("\n\n<i>\"<b>Look</b> at you,\"</i> Ardia sighs happily. <i>\"Oh, [pc.name]. I'm so happy we met.\"</i>");
	output("\n\nYou are too, but you can't think of any way to possibly express it other than swallowing down every last remnant of delicious, sticky seed stuck to your throat and left in your cheeks.");
	output("\n\n<i>\"Mmm, I'll leave you to it,\"</i> she whispers, stroking your face. <i>\"I can get myself breakfast and besides, it doesn't look like you'll need any. Don't worry, I'll have just as much for you the next time. See you soon, my beta.\"</i>");
	output("\n\nArdia hops out of bed, gets dressed and leaves the room for food well before you regain control of your senses. You come to in a puddle of your own " + (pc.hasCock() ? "seed" : "juices") + " and sweat with a deep sense of admiration and fulfillment lingering in your fuzzy head. It feels like your thoughts are trying to penetrate a blanket, but it doesn't matter. Nothing matters except for how hard your alpha got off.");
	output("\n\nIt's some time before you manage to drag yourself out of bed" + (ardia.hasPerk("'Nuki Nuts") ? ", weighed down by alpha cum as you are." : "."));

	if (pc.hasCock()) pc.applyCumSoaked();
	if (pc.hasVagina()) pc.applyPussyDrenched();
	pc.loadInMouth(ardia);
	pc.orgasm();
	ardia.orgasm();
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_WAKEUP");

	addButton(0, "Next", mainGameMenu);
}

public function PCPussyMeetsArdiaMorningWood(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Wsan");
	processTime(10+rand(11));

	output("The first thing you feel when you wake up is the delightful sensation of your pussylips stretching around a very hard, very familiar " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "equine" : "dzaan") + " penis. You groan and spread your [pc.thighs] as a heavy weight bears down on you, pressing you into the bed while your [pc.pussy " + vagIdx + "] swallows inch after inch of " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "thick, veiny horsecock" : "fat, swollen cock") + ", your lover's breath hot on your neck. She playfully bites down on you, just hard enough for you to feel her canines digging into your [pc.skinFurScales], and you let out a surprised moan as you feel yourself grow wetter.");
	pc.holeChange(vagIdx, ardia.cockVolume(0));
	output("\n\n<i>\"Oh, I think [pc.heShe] <b>likes</b> it,\"</i> Ardia growls, sliding one hand under your arching back to caress you before you sink back into the mattress beneath her. <i>\"It's nice having you here to handle my morning wood, [pc.name].\"</i>");
	output("\n\n<i>\"A-alpha!\"</i> you gasp, grabbing at her jiggling behind. Oh, <i>stars</i>, you can feel her muscles tense every time she bottoms out inside you -- that's <i>good</i>. <i>\"Oh, god, alpha, fuck me harder!\"</i>");
	output("\n\n<i>\"That's for <b>me</b> to decide, little beta,\"</i> she murmurs in your [pc.ear], slowly running her tongue along its surface before gently biting down on it. <i>\"Rrrh.\"</i>");
	output("\n\n<i>\"Y-yes, alpha,\"</i> you squeak, trembling under her erotic caress. <i>\"Just, please, don't stop…\"</i>");
	output("\n\n<i>\"Needy cumtank,\"</i> Ardia replies, grinning against your cheek. <i>\"Don't worry, [pc.name]. I'm not going to stop until I've emptied my balls into your " + (pc.isPregnant(vagIdx) ? "ruined cunt" : "womb") + ".\"</i>");
	output("\n\nThe promised prospect is so enticing you suffer an orgasm on the spot, " + (pc.hasCock() ? "shuddering as your stuffed-full cunny tightens around your alpha's dick and your [pc.cocks] " + (pc.hasCocks() ? "shoot" : "shoots") + " [pc.cum] between the two of you." : "your stuffed-full cunny tightening around your alpha's dick and full-bodied shivers running up your spine.") + " Ardia laughs in your face, pulling back and smiling smugly down at you.");
	output("\n\n<i>\"You like that idea, don't you, [pc.name]?\"</i> she teases. <i>\"I thought you might.\"</i>");
	output("\n\nThen she thrusts herself balls-deep into your wet, squeezing pussy and you scream in delight, welcoming her in with enthusiastic clenches so hard they make her grunt in pleasure, dragging your pleated walls along on her outstroke and slamming herself home with her reinsertion. Throwing your head back and moaning like a whore you let your hands drift up her back to clutch at her while she pounds you out like a wild animal, eager to seed her slutty mate.");
	output("\n\nThe excitement of being pounced upon and ravaged by your alpha to start your day has you so worked up you just can't seem to <i>stop cumming</i>. Every single slick, tight push of her incredible cock into your" + (pc.looseness(vagIdx) < 3 ? "tight little" : (pc.looseness(vagIdx) < 5 ? "well-fucked" : "whore")) + " pussy sends a shock of electricity up your spine that makes you arch your back and squirt juices all down her shaft, your mouth open wide as irresistible pleasure wells up in your abdomen. She <i>knows</i> what she's doing to you, too, and when she gently wraps her hand around your throat you welcome it with such desperate, tongue-lolling need her smile looks like a shark's.");
	output("\n\n<i>\"Such a submissive little beta,\"</i> Ardia coos, her soft tone juxtaposing just how fucking hard she's humping you into the bed. <i>\"Good [pc.boyGirl]! Ready - nnhgh! To get some alpha cum?\"</i>");
	output("\n\n<i>\"Y-yes,\"</i> you manage, barely getting the words past your [pc.lips] as her fingers stroke your neck. <i>\"P-please!\"</i>");
	output("\n\nYou sink into the mattress with a gasping moan of pleasure, your beloved alpha driving herself so deeply into you that her pulsing cock is all you can think about. It's so fucking <b>thick</b> and <b>hard</b> you can't hope to control yourself and you begin raising your [pc.hips] into the air to meet her on the downstroke, crying out in rapturous bliss with every rough penetration until you're left silently gaping, sucking wind until Ardia reverses her grip on your neck and pulls you up into her for a kiss.");
	output("\n\nYour eyes roll backwards as her tongue wraps around your own and the dam bursts below, piping hot alpha semen pumping up into your [pc.womb " + vagIdx + "]. Orgasm after orgasm wracks your body, Ardia's arms wrapping around your jerking, shuddering form and pressing you into her hefty breasts while she grunts and cums in your spasming cunt, dragging you up and down the bed as she delivers on her promise. You almost black out from pleasure in her arms, your [pc.tongue] lolling from your mouth as you're bred by the domineering alpha dzaan, and when she collapses on top of you with a satisfied grunt you cum once more at the sensation of your purpose being served.");
	output("\n\n<i>\"T-thank you,\"</i> you whisper, embracing her as warm semen trickles from between your shaking thighs. <i>\"Thank you, alpha…\"</i>");
	output("\n\n<i>\"Good beta,\"</i> Ardia murmurs, hugging you back. <i>\"Don't you love the feeling of being filled with your alpha?\"</i>");
	output("\n\n<i>\"I love you,\"</i> you mumble, rubbing her back and squeezing her half-hard penis between your slippery, cum-coated walls. <i>\"I love your cock, and your cum, and your body. I love everything about you, alpha.\"</i>");
	output("\n\n<i>\"Well, now,\"</i> she replies, warmth in her voice. <i>\"I love you too, beta. Do you want the next load in your cunt or your mouth?\"</i>");
	output("\n\n<i>\"Both,\"</i> you moan throatily, and then Ardia is fucking the thoughts out of your head before you can even gather them.");

	pc.loadInCunt(ardia, vagIdx);
	pc.orgasm();
	ardia.orgasm();
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_WAKEUP");

	addButton(0, "Next", function():void
	{
		clearMenu();
		clearOutput();
		author("Wsan");
		processTime(5+rand(6));
		output("You come to in your bed, still soaking wet and with seed trickling from every orifice. You've been so well-used you can hardly stand, and yet you manage it -- motivated by the thought that were you to get up and walk around your ship, you could find Ardia and settle down between her thighs. To think that a single person could make all of your wildest dreams come true...");
		addButton(0, "Next", mainGameMenu);
	});
}

public function ardiaMorningFaceFuck():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Wsan");
	processTime(10+rand(11));

	output("Your sleep is disturbed by a very familiar sensation -- that of your alpha's " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "massive horsecock" : "thick cock") + " slipping into the warm tightness of your throat.");
	output("\n\n<i>\"Uh! God,\"</i> you dimly hear Ardia mutter. <i>\"Just what morning wood needs. I'm stiffer than a fucking board.\"</i>");
	output("\n\nShe's right. In a roundabout way you're actually <i>proud</i> of her for being so fucking hard as she thrusts her swollen penis so deep down your gullet it feels like she's about to enter your stomach, her full-figured balls resting on your [pc.chest] while she takes a few seconds just to appreciate the feeling of having you wrapped around her. A long, slow sigh escapes her lips as you feel a small spurt of warmth flower somewhere deep inside you, and then she's pulling back.");
	output("\n\nEither she doesn't notice you're awake or doesn't care, and you don't mind either way. The faint glow of artificial light bathes your [pc.skinFurScales] before your vision goes black again and your alpha's groin is pressed roughly against your upturned nose, her soft grunting filling your ears as she starts to rock her immense hips back and forth. You sink into your pillows with every thrust, [pc.nipples] growing hard");
	if (pc.hasCock()) output(" and [pc.cocks] growing harder");
	else if (pc.hasVagina()) output(" and [pc.pussies] growing wet");
	output(" while Ardia pounds you out like a toy.");
	output("\n\n<i>\"Mm! Still sleeping- uh! Down there, [pc.name]?\"</i> Ardia whispers, her cumvein throbbing ominously against your [pc.lips] as she flexes in your throat. <i>\"It's okay. You don't- nnnhh- need to do anything.\"</i>");
	output("\n\nYou have no intention of doing anything to disturb the alpha's use of your mouth as a masturbation aid until the time comes to swallow her seed. To disturb her sensual rhythm would be a disservice to <i>both</i> of you, and besides -- as her grunts grow louder and rougher and her balls-deep thrusts grow harder, you're getting closer and closer to what promises to be an explosive orgasm. With her hands out against the wall Ardia continues slamming your slickening face, saliva dripping from the corners of your mouth as her turgid cock spreads you wide.");
	output("\n\n<i>\"Ah,\"</i> she breathes, stopping for one moment to slip a hand under the back of your head and cradle you. <i>\"Mmm… getting close.\"</i>");
	output("\n\nYou can hardly wait. She starts to lift you to meet the downswing of her hips, skullfucking you hard enough to make you gurgle and slurp unbidden, her grit-teeth groaning filling your ears as the " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "flared head of her stallion cock begins to pump and grow deep within you, filling and stretching your throat with its proud presence." : "swollen head of her keratin-covered cock throbs and brushes against the back of your throat, leaving a trail of smeared precum in its wake.") + " Oh, she's so <b>close</b>...");
	output("\n\nThe alpha doesn't bother announcing to you when she cums. Instead your first indication of her immense orgasm is the explosion of heat in your stomach, followed soon after by a lengthy moan of bliss from your beloved. She draws back and resheathes herself as deep as she can within you, holding you flush against her beautiful caramel skin while her trembling cumvein surges with life. One hot, thick load after another fires down your throat as her enormous balls shift in her sack, fighting against gravity to pull their cum-filled weight taut against her underside.");
	output("\n\nMet with such a vigorous orgasm, you can't help but respond in kind.");
	if (pc.isHerm()) output(" [pc.Cum] <i>streams</i> from your " + (pc.hasCocks() ? "cocks" : "cock") + ", shooting up your [pc.stomach] as it fills with mindbreaking alpha seed and your pussy " + (pc.isSquirter() ? "squirts" : "drips") + " down your [pc.thighs].");
	else if (pc.hasCock()) output(" [pc.Cum] <i>streams</i> from your " + (pc.hasCocks() ? "cocks" : "cock") + ", shooting up your [pc.stomach] as it fills with mindbreaking alpha seed and soaking " + (pc.hasBreasts() ? "the undersides of your [pc.breasts]." : "your chest."));
	else if (pc.hasVagina()) output(" [pc.girlCum] " + (pc.isSquirter() ? "squirts down your [pc.thighs]" : "drips down your underside") + " as you strain not to be noticed.");
	else output(" So incredibly provoked by your alpha's overwhelming control over you, the orgasm you experience is unlike anything else.");
	output(" You try and keep the jerky movement of your [pc.hips] to a minimum, fighting against your instincts to ensure you can keep hollowing your cheeks in an earnest effort to encourage your alpha to give you more of her heavenly sperm. Even so, you can't deny yourself of the debauched pleasure that is cumming your brains out in time with your wonderful alpha's ejaculations.");
	output("\n\nIt feels like minutes before the steady coursing river of Ardia's sticky jizz slows to a trickle, and then to a halt. You close your eyes as if to feign being asleep when she leans back to inspect you, letting your head drop to the pillow -- and then your eyelids flutter open again as she moves you, dragging you down the bed. Incredibly, it looks like she plans to go back to sleep with her half-hard cock still sheathed inside you, your purpose as a cockwarmer not yet wholly served.");
	output("\n\n<i>\"Hnight,\"</i> she mumbles drowsily, rubbing your scalp as she drifts off and you're left with an enormous penis swelling your neck out beneath the blankets.");
	output("\n\nYou, on the other hand, are far too excited to possibly get any sleep. This is <i>exactly</i> how a beta should be treated, and now your");
	if (pc.isHerm()) output(" puss" + (pc.hasVaginas() ? "y is" : "ies are") + " soaking and your cock" + (pc.hasCocks() ? "s are" : " is") + " so fucking hard it hurts to flex. Slowly, cautiously, you wrap one hand around your" + (pc.hasCocks() ? " biggest" : "") + " shaft and slide the fingers on your other hand right up into your muff,");
	else if (pc.hasCock()) output(" cock" + (pc.hasCocks() ? "s are" : " is") + " so fucking hard it hurts to flex. Slowly, cautiously, you reach downwards and begin to jerk yourself off,");
	if (pc.hasVagina()) output(" puss" + (pc.hasVaginas() ? "y is" : "ies are") + " so soaking wet you can't resist. Slowly, cautiously, you reach downwards and begin to fingerfuck yourself,");
	else output(" body desires the same treatment. Slowly, cautiously, you reach down between your [pc.legs] and begin to fingerfuck your asshole,");
	output(" eyes rolling in your head as you bring yourself to an orgasm so powerful you have to fight not to scream around Ardia's cock. She doesn't even shift in her sleep, and with the alpha's cock still held securely in your throat, you see no reason not to masturbate to the feeling again. And again. And again. And again. And again.");
	output("\n\nWhen Ardia finally awakens, she glances down to find you with");
	if (pc.isHerm()) output(" one hand around " + (pc.hasCocks() ? "a" : "your") + " half-hard cock and the other thrust deep inside your sloppy cunt, fucking yourself with the drained strength of a nymphomaniac inspired by the strength of an alpha's dick.");
	else if (pc.hasCock()) output((pc.longestCockLength() > 7 ? " two hands around your half-hard cock" : (pc.hasCocks() ? "both hands around half-hard cocks" : "one hand around your half-hard cock")) + " and absentmindedly jerking yourself off, breathing hard from your nose while you pleasure yourself to the strength of your alpha's dick.");
	else if (pc.hasVagina()) output(" your entire fist inside your sloppy cunt, fucking yourself with the drained strength of a nymphomaniac inspired by the strength of an alpha's dick.");
	else output(" your entire fist inside your [pc.asshole], fucking yourself with the drained strength of a nymphomaniac inspired by the strength of an alpha's dick.");
	output("\n\n<i>\"Good morning,\"</i> you hear from above you, and the murmured words of the voice you recognize to be your alpha's snaps you out of your reverie. Glancing upwards, you find her propped up on an elbow and smiling down at you. <i>\"You look like you've been busy.\"</i>");
	output("\n\nYou pause, unsure of whether or not it's disrespectful to keep going. Her smile widens into a grin, and she nods down at you as her prick begins to stiffen in your throat once more.");
	output("\n\n<i>\"Get on your back, [pc.name],\"</i> she coos comfortingly. <i>\"I'll make you cum so much harder than you can manage with your hands.\"</i>");
	output("\n\nYou breathe a sigh of thankfulness from your [pc.nose] as she rolls over on top of you, stretching her arms out and moaning as she begins to placidly hump your face. Your hands fall away from your nethers as she buoys you away, your eyes falling closed as you feel yourself begin to orgasm once more. True love feels like an alpha's thick cock impaling you, pinning you to the bed beneath her beautiful body...");

	pc.loadInMouth(ardia);
	pc.orgasm();
	ardia.orgasm();
	if (pc.hasCock()) pc.applyCumSoaked();
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_WAKEUP");

	addButton(0, "Next", function():void
	{
		clearMenu();
		clearOutput();
		author("Wsan");
		processTime(5+rand(6));
		output("When you finally awaken, Ardia is nowhere to be seen but you have a <i>hefty</i> reminder of her remaining in your stomach. You're half-tempted to just remain in bed stroking your swollen, cum-filled belly, but you have a job to do and an alpha dick to pleasure. Stumbling to your [pc.feet], you slip out of bed.");
		addButton(0, "Next", mainGameMenu);
	});
}

public function ardiaMorningButtfuck():void
{
	clearMenu();
	clearOutput();
	showArdia(true);
	author("Wsan");
	processTime(10+rand(11));

	output("You lazily awaken to the feeling of being rolled onto your stomach, your face sinking into your soft, warm pillow.");
	output("\n\n<i>\"Hmmh… Ardia?\"</i> you murmur into the fluff. <i>\"'Zat you?\"</i>");
	output("\n\nThen you feel her " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "massive horsecock" : "fat dzaan cock") + " poking at your [pc.asshole].");
	output("\n\n<i>\"Here's your wakeup call, beta,\"</i> Ardia whispers in your ear, leaning over your back as her big breasts come to rest upon your [pc.skinFurScales]. <i>\"Good morning!\"</i>");
	output("\n\nShe thrusts into your " + (pc.ass.looseness() < 3 ? "tight little ring" : (pc.ass.looseness() < 5 ? "warm fuckhole" : "gaped whore asshole")) + " so hard you scream into the pillow, biting down to keep yourself sane. The next thrust and she sinks all the way to " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "her medial ring then that too is being shoved into your tortured tailhole, your stomach bulging outward with her flare pressing up into it." : "the base, shoving herself balls-deep into your tortured tailhole, her cockhead imprinted on your stomach.") + " Before you can even reconcile the pleasure with the pain, your alpha starts roughly fucking you from above.");
	pc.buttChange(ardia.cockVolume(0));
	output("\n\n<i>\"Oohhhhh! <b>Alpha!</b>\"</i> you scream, wrapping your arms around your pillow and hugging it for dear life. <i>\"Oh! Oh! Fuck!\"</i>");
	output("\n\nShe responds only by grunting as she pushes your head back down into the pillow, riding you with her wide, womanly hips rolling and slamming her engorged dick between your " + (pc.buttRating() < 3 ? "tight cheeks" : (pc.buttRating() < 5 ? "jiggling asscheeks" : "curvy, jiggling asscheeks")) + ". Stars, her morning wood feels like a fucking iron rod inside you! To make matters worse");
	if (pc.hasCock()) output(" you can feel her swollen cockhead grinding against your prostate hard enough that you're already dribbling and spurting precum up your [pc.stomach], pressed into your own hot, sticky mess.");
	else if (pc.hasVagina()) output(" you can feel yourself getting so wet your [pc.thighs] are being rubbed through your own hot, sticky mess, pressed downwards into your sheets.");
	else output(" you can feel yourself approaching that familiar sensation of <i>wanting</i> to cum but never quite getting there; the frustration of sexlessness filling you every bit as much as your alpha's sturdy cock.");
	output("\n\nArdia keeps you held down and fucks you until, at last, the pleasure outweighs the pain so severely you can hardly focus on anything but the way you feel when her beautiful cock is balls-deep in your guts. <i>Now</i> you begin to tighten up, to moan, to writhe beneath her in outright ecstasy as she firmly puts you in your place, reminding you of the role a beta serves. The precum drooling into your bowels is so warm and placating you find yourself enthralled, arching your back and holding your [pc.ass] up for her to pound.");
	if (pc.hasGenitals())
	{
		output("\n\nYour orgasm is hard, powerful, and totally ignored by the sweat-dripping alpha as she fucks you hard enough to make the bed creak.");
		if (pc.isHerm()) output(" [pc.GirlCum] spurts and drips from your [pc.pussies] and [pc.cum] shoots from your [pc.cocks], staining your sheets");
		else if (pc.hasCock()) output(" [pc.Cum] shoots from your [pc.cocks], staining your sheets and covering the mattress in spunk");
		else output(" [pc.GirlCum] spurts and drips from your [pc.pussies]");
		output(" while you cry out in joy, your clenching asshole tightening up around Ardia's thrusting penis as if to massage and milk her.");
	}
	else output(" The feeling of near-orgasm heightens until it reaches a peak, your core tightening up and your body rolling like a wave as you cry out in frustrated pleasure into your pillow. Your sweat-dripping alpha ignores you completely as she fucks you hard enough to make the bed creak, thrusting into your clenching asshole while you seek that last little bit of bliss that never arrives. Instead you tremble, sweat and moan in a faux delight that bubbles beneath the surface and never boils over, leaving you with nothing but your lover's eventual release to look forward to.");
	output("\n\nWith all your rhythmic, wanton clenching and sexual moans, your alpha's orgasm arrives right on your heels. With a loud groan of satisfaction Ardia shoves herself to the hilt and blows her load so violently it feels like a fountain of warmth in your stomach. Grunting in your ear, she grinds herself into your cheeks as her meaty cock throbs and expels " + (ardia.hasPerk("'Nuki Nuts") ? (ardiaHugeBalls() ? "gallons of thick alpha seed from her two gargantuan balls, each big enough to feed an army of betas." : "what must be a gallon of alpha seed from her two enormous balls, each bigger than your head and virile enough to stud a legion.") : "every drop of alpha seed in those two big balls of hers, each taut and sweaty."));
	output("\n\nThe attention is all you need. You cum over and over as her orgasm continues, desperately jerking and squeezing down on her in the hopes of getting just a drop more of her blessed jizz, your stomach rounding out with the sheer amount of it. She affectionately rubs your [pc.hair] --");
	output("\n\nAnd then she's gone, pulling out and leaving you there with your asshole gaped and quivering, spurting her cum in the wake of such rough treatment. Your head spins with the warmth you feel in your bowels and your heart -- you don't think you could love her any more than you do right at this moment...");

	pc.loadInAss(ardia);
	pc.orgasm();
	ardia.orgasm();
	IncrementFlag("SEXED_ARDIA");
	IncrementFlag("SEXED_ARDIA_WAKEUP");

	addButton(0, "Next", mainGameMenu);
}

public function discussArdiasEmploymentOptions():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");
	processTime(1);

	output("<i>\"Can we talk about the ship? How you're fitting in?\"</i>");
	output("\n\nArdia smiles. <i>\"Of course. I'm loving every second of being aboard. All the adventure and the exploration, seeing the stars!");
	if (ardiaDomLevel() == 0) output(" And I couldn't have picked a better captain to lead me!");
	else if (ardiaDomLevel() < 7) output(" And having my very first beta with me all the while... I'm so glad we get to experience this together!");
	else output(" And to have you take me on this journey... I'm so glad I met you.");
	output(" Your ship is practically a second home already.\"</i>");

	if (ardiaDomLevel() < 3) addButton(0, "Boot Off", function():void
	{
		clearMenu();
		clearOutput();
		showArdia();
		author("Savin");
		processTime(1);

		output("<i>\"So,\"</i> you venture, leaning against the side of the doorframe. <i>\"What would you say to taking some shore leave?\"</i>");
		output("\n\nArdia huffs softly, crossing her arms. <i>\"Trying to put some distance between us, or just reshuffling your crew for now? Heh, don't answer that. I wouldn't mind spending some time with solid-er ground under my feet. I can call a transport and head to Tavros, spend some time at the beach away from home...\"</i>");
		output("\n\nWithout further ado, Ardia begins packing her bags -- what few possessions she's accrued since coming aboard are easily stowed, and she sends out a ping to a taxi service to take her where she needs to go. In short order, you're with her at the airlock, saying that you'll see her later. She gives you a parting hug and is on her way, carried off to Tavros by the shuttle.");

		flags["ARDIA_CREW"] = 0;

		addButton(0, "Next", mainGameMenu);
	}, undefined, "Boot Off", "You need Ardia to take her leave from the ship. Maybe you can meet her back at Tavros later?");
	else addDisabledButton(0, "Boot Off", "Boot Off", "You're too addicted to Ardia's succulent seed to even think about asking her to leave. You can't imagine your life without her now...");
	//addButton(1, "Uniform"); // Sav Note: Uniform will be coming later; involves Milly Threeways.
	addButton(14, "Back", ardiaCrewMenu, true);
}

//Find Ardia at the Beach Entrance
//Same room as Alex is in, add an Ardia button. TT: "Ardia's on the beach somewhere. Have the clerk put out a PA call for her."
public function getArdiaBackOnYourShip():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");
	processTime(3+rand(4));

	output("You saunter up to the bikini-clad clerk and ask her to put out a PA for your friend Ardia; you need to speak to her. A few minutes later and the chunky dzaan is sauntering out of the beach section, wearing an impossibly-strained sling bikini that covers as little as possible. Each of her fat nuts hangs out of the string, swaying pendulously as she walks. Every spare gaze in the room is on her in an instant.");
	output("\n\n<i>\"Hey, captain,\"</i> she smirks, swaying those big hips right up to you and pressing her chest up against yours, reaching past your shoulder for a towel. <i>\"Got good news for me?\"</i>");

	if (flags["INFINITE_CREW"] == undefined && (shits["SHIP"] == undefined ? 3 : shits["SHIP"].shipCrewCapacity()) <= crew(true)) addDisabledButton(0, "Recruit Ardia", "Recruit Ardia", "Your crew capacity is full up. Dismiss somebody else first.");
	else addButton(0, "Recruit Ardia", function():void
	{
		clearMenu();
		clearOutput();
		showArdia();
		author("Savin");
		processTime(1);

		output("<i>\"Ready to come back aboard?\"</i> you ask her.");
		output("\n\n<i>\"Since the moment I disembarked, captain,\"</i> Ardia grins, giving you a wink and wobbling a few steps back. <i>\"Let me grab my pack and get dressed. I'll meet you back on the ship!\"</i>");
		output("\n\nShe hops off with a spring in her step -- one that leaves you staring at all those jiggling curves as she vanishes into the changing rooms.");

		flags["ARDIA_CREW"] = 1;

		addButton(0, "Next", mainGameMenu);
	}, undefined, "Recruit Ardia", "Bring Ardia back aboard your ship.");

	addButton(1, "Not Yet", function():void
	{
		clearMenu();
		clearOutput();
		showArdia();
		author("Savin");
		processTime(1);

		output("You shake your head and tell her that you just wanted to check in and make sure everything's alright.");
		output("\n\n<i>\"Aww. Well, happy to report that I'm having a blast at the beach. Don't need to worry about me, captain.\"</i>");
		output("\n\nShe gives you a wink and wraps her towel around herself before heading back to the beach.");

		addButton(0, "Next", mainGameMenu);
	}, undefined, "Not Yet", "You just came to say hi.");
}

public function youGotAnyMoreOfThemCummiesArdia():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");

	if (ardiaDomLevel() < 7)
	{
		processTime(1);
		output("You ask Ardia if she wouldn't mind giving you a little of that creamy dick-milk to go. You don't want to be disabled by your cravings while out adventuring, after all.");
		output("\n\n<i>\"How positively lewd,\"</i> she giggles, biting her lip. <i>\"Lucky for you, I know just what kind of adventurous soul my favorite beta is. I'm way ahead of you, [pc.name].\"</i>");
		output("\n\nArdia reaches back into her desk and withdraws a tied-off condom from her drawer, swaying it side-to-side like a pendulum for your inspection. As befitting a lady so testicularly gifted as she is, it's a big, fat polyp of spunk, sloshing weightily inside the latex bubble. A blue lipstick mark on one side lets everyone know exactly whose beta you are, too.");
		output("\n\n<i>\"Just don't use it as an excuse not to come by my quarters as often,\"</i> Ardia teases. <i>\"Now go on and do your space hero thing. I'll be here!\"</i>\n\n");
	}
	else
	{
		processTime(8+rand(8));
		output("You tell your mistress that you're getting ready to head out on your next adventure, and ask if she'd be so kind as to give you some of her cum for the road. It wouldn't do to have her beta being overwhelmed by your enemies in the midst of a craving, would it?");
		output("\n\n<i>\"Hmm, no, I suppose not. Well, then, my precious beta... help yourself to my boundless bounty!\"</i>");
		output("\n\nArdia bites her lip and grins down at you. Her legs spread apart as she reaches into her desk, withdrawing an unopened condom, and tosses it at you. <i>\"Don't expect me to do all the work for you.\"</i>");
		output("\n\nYou offer up your heartfelt thanks to your ever-generous alpha and get to work, hurriedly pulling down her zippers so that her slowly-hardening [ardia.cock] can spring forth into your waiting mouth. It's so natural to just wrap your [pc.lips] around your alpha's pole, to worship it with your [pc.tongue] and take it deep down your throat that you almost forget the point of this exercise -- not that you think Ardia would mind getting back-to-back blowjobs until you get your head on straight. ");
		output("\n\nYou've bobbed up and down her throbbing length half a dozen times before you manage to sum up with willpower necessary to peel yourself off your alpha's cock and tear into the condom wrapper. You hurriedly draw the latex sheathe down her pillar of spit-slick cockmeat");
		if (ardia.hasCock(GLOBAL.TYPE_EQUINE)) output(", wrapping the highest few inches, at least, before running out of condom entirely");
		output(". Ardia moans softly, leaning back in her chair and running a big, strong hand over your head while the other pinches a nipple and squeezes the fat tit underneath.");
		output("\n\n<i>\"Aww, I was hoping you'd just lose yourself in my musk again,\"</i> she laughs, hooking a meaty thigh around your shoulder. <i>\"So I guess I'll just have to drown you in my thickness instead.\"</i>");
		output("\n\nYou babble wordless thanks as your mistress's thighs wrap around your face, submerging you in jiggly brown skin that slaps your cheeks and pins your [pc.ears]. The thick, heady aroma of dzaanic cock and pre assaults you with renewed furor, making your head swim.");
		if (pc.hasCock()) output(" Your own [pc.cock] hardens painfully, craving the feeling of your mistress pinning you down and fucking your ass until you cum all over yourself.");
		else if (pc.hasVagina()) output(" Your cunt drools with desire, craving the feeling of your mistress's cock pounding away at it.");
		output(" Oh, stars, that's so good...");
		output("\n\nYour mouth slides straight down Ardia's condom-wrapped cock without a second thought, opening your throat for every throbbing inch. Mistress coos with delight, squeezing her thighs together to hold you down. The thought of struggling, of fighting for breath instead of more cock, doesn't even enter your mind. No, all you need is your alpha's sweetly salty seed; oxygen is overrated. Only when your eyes are pulsing with darkness does Ardia grab your [pc.hair] and pull you back up, releasing you from the iron hold of her legs just long enough for you to suck in a deep breath -- full of cockmusk as it is. Your eyes roll up and drool leaks freely around your [pc.lips] as your alpha shoves you back down on her dick again and again.");
		output("\n\nShe's got you balls-deep when she finally cums, letting you feel the first ripples in her [ardia.balls] with your [pc.lips], and then gag as her pole swells inside your throat, stretching you right out to your well-accustomed limit. Instead of pumping a thick, steaming helping of her cum straight into your stomach, though, you're forced to hold your breath as the latex sheathe around Mistress's cock bloats and swells with every hard-earned spurt of spooge. You can feel it growing inside you, stretching you out until Ardia finally grabs your [pc.hair] and shoves you back, dragging the bloated condom out with a lurid, wet squelch. ");
		output("\n\n<i>\"Th-there's my [pc.boyGirl],\"</i> she sighs, yanking the condom off her [ardia.cock] and tying it off. You quickly swoop in to clean all the excess off of her drooling crown while she secures your future meal, planting a lewd kiss on the side that leaves its blue mark for all to see.");
		output("\n\nYou thank her profusely for the honor as she hands it off to you.\n\n");
	}

	quickLoot(new ArdiasCum());
}

public function seeIfArdiaWillLendYouHerMommy():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");
	processTime(3);

	if (ardiaDomLevel() < 7) output("<i>\"So, Ardia, how about we go see your folks?\"</i> you suggest, leaning against her doorframe. The thought of getting to see her lush resort of a homeworld is damn enticing. <i>\"I know I do.\"</i>");
	else output("<i>\"Would you like to visit your parents, mistress?\"</i> you offer up, trying to disguise how much you want to see that lush resort world of theirs.");
	output("\n\n<i>\"Oh, you want to spend a day being pampered and adored by a sea of chocolate beta babes?\"</i> Ardia giggles, leaning back in her chair and flashing you a smirk. <i>\"I mean, I don't blame you... it's kind of like paradise compared to all the danger and darkness out here on the frontier. C'mon, I'll plug in the coordinates.\"</i>");
	output("\n\nScore. You follow Ardia along to the bridge and help her program your ship's nav computer, back towards the Confederate core. ");
	output("\n\nA quick jaunt through the Warp Gate network takes you to your companion's homeworld, a lush jungle plant that's greener than primordial earth and, according to passive scans, absolutely teeming with life -- including several million dzaan, concentrated around a few large coastal cities and then scattered sparsely throughout the other side of the planet. ");
	if (flags["ARDIA_PARTIED"] == undefined)
	{
		output("\n\n<i>\"You're gonna love my mom,\"</i> Ardia comments as you descend through the thick, wet atmosphere. <i>\"Well, she's gonna love <b>you</b>, anyway, my gallant, charming rescuer. Hauâ Mai might be a simple world, but we pay our debts. I promise you that.\"</i>");
		output("\n\nShe gives you an approach vector that leads you to a sprawling, high-class resort on the oceanside, resting atop a hill on a great sandy beach. There's a landing pad on the roof of the tallest residential tower, and Ardia tells you to put 'er down there. By the time you've landed, powered down, and make your way out the airlock with the former captive in tow, there's a group of dzaan waiting on the pad to meet you. Ardia's sire leads the group of a half-dozen armed guards, and is accompanied by an exaggeratedly-fertile-figured female of their race wearing transparent silks and a great many jewels and piercings, including a pair of huge golden rings from her barely-concealed nipples. The woman hangs off of the alpha's arm, face streaked with tears of joy.");
		output("\n\n<i>\"My baby!\"</i> the woman cries, rushing forward and scooping Ardia up off the ground the moment your companion steps off the ramp. <i>\"Oh thank the gods, you're alright. My sweet little baby...\"</i>");
		output("\n\nWhile mother and daughter bawl all over each other, your turn your attention to the more taciturn alpha in the power suit. Even she's a bit misty-eyed, but she takes a deep breath and steps up, offering a hand to you. <i>\"Thank you, captain, for returning my daughter. My only alpha child... I can't express my gratitude enough, but please... at least accept our credits and hospitality as a start.\"</i>");

		// As per recruitment
		addButton(0, "Thanks!", getYourRewardHookersYouHeroYou, undefined, "Thanks!", "You'd be happy to take the family up on their hospitality. After all, how often do you get to spend a night in an expensive resort owned by deliciously thick dickgirls? You're definitely gonna end up playing with some of them if you stay...");
		addButton(1, "No Thanks", justDidItForTheDzaanBootyAlphaMom, undefined, "No Thanks", "You don't need any reward, and you'll be on your way.");
	}
	else
	{
		output("\n\nShe gives you an approach vector that leads you to a sprawling, high-class resort on the oceanside, resting atop a hill on a great sandy beach. There's a landing pad on the roof of the tallest residential tower, and Ardia tells you to put 'er down there. By the time you've landed, powered down, and make your way out the airlock with the former captive in tow, Arine is waiting for you, accompanied by an exaggeratedly-fertile-figured female of their race wearing transparent silks and a great many jewels and piercings, including a pair of huge golden rings from her barely-concealed nipples. The motherly beta hangs off of Arine's arm, smiling wide as Ardia disembarks and runs over into her embrace.");
		output("\n\n<i>\"Welcome back, captain,\"</i> the alpha says as her daughter and wife hug and kiss each other's cheeks. She extends a hand to you " + (flags["ARDIA_PARTIED_SEX"] != undefined ? ", but the moment you take it, you find yourself pulled in tight, face mashed down into the dick-milf's own cleavage. <i>\"I look forward to seeing you in the penthouse tonight... but" : "and shakes yours vigorously. <i>\"Thank you for continuing to keep my wayward heir safe. As thanks,") + " while me and the girl get caught up, please enjoy the island's every hospitality. My harem will take such good care of you every minute you're here, don't you worry.\"</i>");
		output("\n\nNow that's an offer that's impossible to refuse. This is a beautiful world she's built her empire on, and just looking at the gathering of curvaceous brown aliens surrounding you, it's populated by beautiful people too. It seems this place is a wealthy play[pc.boyGirl]'s paradise. You give the happy family some space, taking the lift down into the bright lights and chaotic noise of the resort's main entertainment plaza. You're subsumed in a glittering gala of flashing holos and gambling machines churning out credit chits; the thunders roar of cheers from betting tables as high-stakes games bear fruit; the beat of heavy bass from the music playing above you, and the shaking hips of dancers in cages suspended high above the floors.");

		//As per [Thanks!]'s midway next point. Proceed as normal until the [Tuck Me In] [I'm Fine] decision point. Tuck Me In proceeds as normal but I'm Fine has new text: 
		addButton(0, "Next", itsPartyTimeAtArdiamomLand);
	}
}

public function addAnnosArdiaAddictionButton(btnSlot:int):void
{
	if (!ardiaIsCrew()) return;
	if (!annoIsCrew()) return;
	if (flags["DONT_WANT_ARDIA_ADDICTION"] == undefined && !addictedToArdia()) return;
	else if (flags["DZAAN_CURE_ARRIVAL"] != undefined) return;
	else if (immuneToArdia()) return;
	else if (ardiaDomLevel() < 7) addButton(btnSlot, "Dzaan Cure", annoPlsHelpMeSuckArdiasCock, undefined, "Dzaan Addiction Cure", (addictedToArdia() ? "If you want to end your addiction to Ardia's cock, a scientist like Anno might be able to help you." : "You want to get it on with Ardia, but that addiction business isn't your jam. Maybe a sexy scientist like Anno can help you out?"));
	else addDisabledButton(btnSlot, "Dzaan Cure", "Dzaan Addiction Cure", "You could never bring yourself to sever your intimate bond with Mistress. <b>You are too far down the rabbit hole to ever recover</b>.");
}

public function annoPlsHelpMeSuckArdiasCock():void
{
	clearMenu();
	clearOutput();
	showBust(annoBustDisplay(), ardiaBustDisplay());
	showName("ANNO\nAND ARDIA");
	author("Savin");
	processTime(3);

	if (addictedToArdia())
	{
		output("Anno's a genius and a multi-disciplinarian science slut -- maybe she can help you with your growing concerns about Ardia -- specifically, your addiction to her cock. There's no way to couch that topic any other way, but as you start to explain your problem to the snowy ausar, you don't see any judgement in her eyes. Just concern.");
		output("\n\n<i>\"Well, I'm not a biologist or a chemist,\"</i> she says after a while, tapping her chin with a gloved finger. <i>\"This isn't exactly my specialty... but considering your options, I'm glad you came to me. I'll do what I can to help.\"</i>");
		output("\n\nThat's a relief. But what can she do? ");
		output("\n\n<i>\"Well, truth be told, I've been eyeing that big chunk of an amazon ever since you brought her on board. Unlike some people, though, I think for five seconds before I " + (silly ? "succ" : "suck") + ". Might have already talked to one of my old Akkadi underlings from the BioScience department and got him to cough up something about individualized immunity treatments. Should be retroactive, but I haven't been keen on testing that myself. Guess we'll have to see how you take to it.\"</i>");
		output("\n\n<i>\"One problem though,\"</i> Anno chuckles, reaching under her desk and pulling out a beaker and a vial of clear gel. <i>\"We're gonna need some of the source material.\"</i>");
		output("\n\nBefore you can entire realize what she's asking, Anno pokes her head out the hatch and whistles sharply. <i>\"Hey, Ardia. C'mere a second, will ya?\"</i>");
		output("\n\nA few moments later and the towering brown beauty is standing in the doorway, looming a solid foot over the ausar girl and with tits thrusting so far out ahead that Anno has to either duck under them or lean back to talk over them. ");
		output("\n\n<i>\"Heeey, big stuff,\"</i> Anno grins, getting up on her tip-toes and resting her arms on the shelf of Ardia's over-boob. Her tail beats rapidly around her, slapping the dzaan's thighs. <i>\"I hear you and [pc.name] have gotten a very <b>special</b> relationship since you've come aboard...\"</i>");
		output("\n\nArdia gives the " + (annoIsHuskar() ? "huskar" : "ausar") + " a confident smirk, planting her hands on her hips. <i>\"Sure, that's one way to say it. [pc.name] went and addicted [pc.himHer]self to my dick. So... which one of us are you jealous of?\"</i>");
		output("\n\n<i>\"Both of you,\"</i> Anno purrs, leaning in on your mistress's massive rack. When Ardia doesn't flinch, Anno gives one of the alpha's tits a playful squeeze and continues. <i>\"Oh, don't get me wrong, I've been fantasizing about climbing these mountains here since you joined the crew. Except I've got a dozen other lovers that'd all be pretty upset if I got myself addicted. Lucky for us, I've got a solution.\"</i>");
		output("\n\nArdia's brow furrows. <i>\"I'm not gonna start taking suppressants. [pc.name] can't go craving now...\"</i>");
		output("\n\nAnno tuts her tongue, moving her other hand down to start massaging Ardia's chest. Like a second sense, your eyes are instantly drawn to your alpha's crotch as her [ardia.cock] starts to throb, straining against the front of her uniform.");
		output("\n\n<i>\"Well, Doctor Dorna, you've got something on your mind then...?\"</i>");
		output("\n\nAnno grins, tail wagging as the towering amazon's hands reach down to grab her ass, practically lifting her off the deck. Before it gets out of reach, though, Anno grabs the bottle of lube off her desk and upends it into her palm. She makes a tight fist, coating her fingers in the stuff and grinning at the alpha.");
		output("\n\n<i>\"Well first... I need a sample of that narcotic nut-juice I've heard so much about. Think you can hook me up?\"</i>");
		output("\n\n<i>\"Maybe,\"</i> Ardia smirks. <i>\"What did you have in mind, Doctor?\"</i>");
		output("\n\n<i>\"Anno. Please.\"</i> Your science pup wags her tail and reaches up with her unlubed hand, pinching the zipper of Ardia's suit. <i>\"I'm still working on my doctorate... of proctology. Now let's get you out of that suit so I can earn my degree.\"</i>");
	}
	else
	{
		output("So there's no really tactful way to couch your predicament, so you just come out and tell her the issue -- that you want to fuck Ardia, but you're afriad those addictive fluids of hers will get the better of you. Maybe there's something Anno can do to help?");
		output("\n\nShe snickers at your awkward explanation, but she doesn't make fun of you more than that. Guess a turbo-slut like Anno can't throw too many rocks from inside her glass house. ");
		output("\n\n<i>\"Well, that's certainly a predicament. I guess you could say you're between a nut and a hardon, huh?\"</i> she giggles. <i>\"Well, I'm neither a biologist or a chemist, but I appreciate you coming to me with all your scientific problems. The confidence of one of the galaxy's soon-to-be most powerful " + pc.mf("men", "women") + " is a heady drug! Speaking of drugs, I'm sure there's some addiction-suppressant hypos around for dzaan, even if they aren't necessarily a common race off their homeworlds. Can't our big ol' chunkazon use something over the counter?\"</i>");
		output("\n\nYou explain that Ardia's worried about irregular supplies and cost -- that one missed day could accidentally set off a life-time of cock-addiction you aren't necessarily volunteering for. Anno nods sagely, taking that in stride. <i>\"Right, makes sense actually. I'd hate to have my sex life dictated by shipping and supply lines that barely exist yet. Even Kaede can't guarantee delivery to other ships on the frontier; too many variables. I don't think a big company like Galactic Postal is going to overnight to us.\"</i>");
		output("\n\n<i>\"So you see the problem?\"</i>");
		output("\n\nShe nods. <i>\"Sure, sure. Well like I said, this isn't exactly my area of expertise, but I bet I can tap an old friend at Akkadi to whip us up something. First though, we're gonna need a, uh, 'sample' of the substance in question.\"</i>");
		output("\n\nBefore you can question the science pup, she hops out of her chair and sticks her head out of her quarters' hatch, whistling sharply. <i>\"Ardia! C'mere a second, will ya?\"</i>");
		output("\n\nA few moments later and the towering brown beauty is standing in the doorway, looming a solid foot over the ausar girl and with tits thrusting so far out ahead that Anno has to either duck under them or lean back to talk over them. ");
		output("\n\n<i>\"Heeey, big stuff,\"</i> Anno grins, getting up on her tip-toes and resting her arms on the shelf of Ardia's over-boob. Her tail beats rapidly around her, slapping the dzaan's thighs. <i>\"I hear you and [pc.name] are having some chemical imbalances.\"</i>");
		output("\n\nArdia blinks, cheeks flushing as much from the blunt query as Anno's handsiness. <i>\"Uh, well, y-yeah I guess you could say that. [pc.name] doesn't wanna risk getting addicted to me, and-\"</i>");
		output("\n\n<i>\"No problem,\"</i> Anno beams, leaning into the bigger woman. <i>\"I'm on the job!\"</i>");
		output("\n\nArdia blinks. <i>\"Really?\"</i>");
		output("\n\n<i>\"Really! Ain't no problem ausar science can't solve. Just one catch: I'mma need some of that sweet narcotic nut-batter of yours. Need to genetically analyze it, make sure the brew's gonna be a hundred-percent effective for the boss here.\"</i>");
		output("\n\nArdia's blush only darkens, and she's biting a blue lip and rubbing her hands together by the time Anno's finished her over-sexed spiel. You can't help but notice that one of Anno's legs has snuck forward, rubbing the front of her thigh against the skin-tight bodysuit wrapped all around her newest test subject. ");
		output("\n\nArdia takes a nervous step backwards, sudden enough that Anno almost pitches forward before recovering her footing. The big dzaan glances between the two of you and laughs helplessly. <i>\"Okay, okay. I guess I'll go find a jar or something...\"</i>");
		output("\n\nAnno doesn't miss a beat, reaching into her desk and taking out a bottle of what can only be lube. She squirts an overly ambitious glob into a gloved hand and makes a fist, working it all in between the fingers. <i>\"Pshhh, nobody likes jackin' it into a beaker, big girl. Just zip down that jumper and I'll take care of you real quick.\"</i>");
		output("\n\n<i>\"Y-you, uh, you don't have to, Doctor Dorna,\"</i> Ardia laughs, taking another step back. <i>\"Really, it's okay...\"</i>");
		output("\n\n<i>\"Just Anno, please,\"</i> your science pup purrs, swaying those breeder's hips as she follows Ardia's retreat. <i>\"And it's no bother.\"</i>");
		output("\n\nArdia's twitching cock underneath her bodysuit, at the very least, responds to the sultry words. Its owner, flustered and red-faced, just blurts out <i>\"W-what kind of doctor are you again?\"</i>");
		output("\n\nAnno pulls her glove down and makes it snap, sending rivulets of lube running down her palm. <i>\"I'm about to be a doctor of proctology,\"</i> she says with a wicked grin. <i>\"Now zip already, before your boner rips your suit.\"</i>");
	}

	flags["DONT_WANT_ARDIA_ADDICTION"] = undefined;

	addButton(0, "Next", annoPlayingAtProctologist);
}

public function annoPlayingAtProctologist():void
{
	clearMenu();
	clearOutput();
	showBust(annoBustDisplay(), ardiaBustDisplay(true));
	showName((silly ? "\nSCIENCE!" : "ANNO\nAND ARDIA"));
	author("Savin");
	processTime(15);

	output("Anno hops back from Ardia as the enormous amazon relents and starts to disrobe, drawing her zipper straight through her cleavage and down to her belly. The smaller ausar watches appreciatively as Ardia wiggles her shoulders out of her " + (ardia.armor is EmptySlot ? "blue and orange" : "Steele Tech") + " jumper, a gesture that makes her mountainous tits sway heavily from side to side. Anno's all but licking her lips by the time the dzaan's caramel nipples pop free, and her tail's wagging up as storm when Ardia's [ardia.cock] is finally freed from the tight confines of the bodysuit. ");
	output("\n\nAnno grabs the hardening pillar of alpha-meat in her lubed-up glove the second it's able to pop free, wrapping black latex-clad fingers all the way around it. <i>\"Theeeere we go,\"</i> she purrs, running her thumb over the " + (ardia.hasCock(GLOBAL.TYPE_EQUINE) ? "medial ring. <i>\"Woah, what a big fella you got here. What's [pc.name] been giving you, hmm? Synthsheathes? Even if it's not the original, I bet this feels just as good, doesn't it?\"</i>" : "keratin nubs. <i>\"Aww, it's so cute! Big by ausar standards, but on a girl your size, it looks just about perfect.\"</i>"));
	output("\n\nArdia bites a lip, suppressing a little moan as Anno starts working the shaft. The big dzaan leans back against the desk, hefting that callipygian booty up onto the shelf of it and spreading her legs while Anno gets down to business. Her gloved hand maneuvers from the base of Ardia's shaft all the way up to her [ardia.cockHead], rubbing the slit until the first little white beads of pre start to appear. The dzaan's knuckles wrap around the edge of the desk, clenching as Anno starts pumping her arm up and down the pillar, twisting her wrist around so that every inch of dark flesh is completely coated with the glistening lubricants. ");
	output("\n\nWhen it is, Anno gives you a subtle wink and slides her hand all the way down the shaft and under Ardia's [ardia.balls], cupping each of the fat sacks on her way. She walks her fingers under Ardia's swaying nuts, vanishing behind the thick orbs. Doesn't take a genius to realize she wasn't kidding about earning that proctology degree. While she's getting her hand in position, Anno shifts around on her knees until she's able to scoop Ardia's dong up between her tits ");
	output("\n\nThe sexy scientist squeezes her shoulders, wrapping those " + (annoIsHuskar() ? "huge" : "double D") + " tits around Ardia's cock before rising on her knees. Your chunky dzaan gasps, rocking back on the desk as Anno rides her chest right up the pipes. As soon as the ausar reaches the peak, standing tall on her knees and grinning up at her partner, you see her buried arm move hard and fast up between the thickset alpha's thighs. ");
	output("\n\n<i>\"Wh-aahhh!\"</i> Ardia yelps. Her knuckles whiten, and her overly ample rack bounces hard enough to come clapping down on her chest. Anno's arm just keeps vanishing up into her ass, assaulting the depths of the alpha's doughy booty. The dick wedged between Anno's titties throbs and swells in answer to the prostate probing, and before long the first streams of pre start rolling off her [ardia.cockHead] and splattering onto the tops of Anno's breasts. Keeping herself elbow-deep inside the alpha, Anno leans back to grab a beaker from her desk and tries to wedge it over Ardia's crown, ready to collect the fresh sample... only to realize that from the position she's set herself in, most of the goods are just going to leak out around the edges.");
	output("\n\n<i>\"Damn it, you need a knot, big girl,\"</i> Anno laughs, tossing the pre-soaked glass aside. <i>\"Okay, plan B!\"</i>");
	output("\n\nShe reaches into her desk and pulls out a condom, snug in its fresh wrapper. With only one hand to work with, though, she can't exactly get the condom out and onto its target -- but goings hands free is no obstacle for a tuboslut like Anno. She just nips the corner of the wrapper between her teeth and then sucks the entire thing into her mouth. You blink, watching Anno's jaw work a moment before she opens wide and bobs her head straight down Ardia's [ardia.cock]. What's she up to now?");
	output("\n\nSo much for not getting herself addicted, you think, until her lips meander back up Ardia's length, leaving sheer latex stretched taut over the skin in their wake. When she finally makes it back to the crown, Anno spits out the empty wrap and grins. <i>\"There we go. That'll catch every drop.\"</i>");
	output("\n\n<i>\"D-damn!\"</i> Ardia gasps, staring wide-eyed down at Anno. <i>\"You're really something else.\"</i>");
	output("\n\nAnno plants a kiss on the alpha's crown, wags her tail, and pushes her arm further into Ardia's ass. The big dzaan's breeding pole wobbles in its prison of pillowy ausar tits, and you can see the vein of the condom start to fill with pre in the span of seconds. The prostate pounding seems to be having more effect on filling the condom than Anno's titfucking, which only motivates the bouncing pup to thrust deeper and faster. Before long, Ardia's panting grows to a fevered pace, making her massive tits bounce hypnotically as she's vigorously sodomized. Her cock throbs and leaks, making the vein bulge and balloon out.");
	output("\n\nSuddenly, the dzaan tenses, throwing her head back and biting her lip, eyes closed. Anno's almost up to her elbows inside her, pumping hard until the dam finally breaks. Ardia howls and kicks her legs, crushing Anno's head between those pillowy thighs as the first jet of cum erupts into the already-packed balloon sloshed over her crown. The cumvein expands exponentially as Ardia's [ardia.balls] empty into it, shooting fat wads each larger than even the most virile human's. ");
	output("\n\nAnno giggles and shakes her shoulders, using her tits to milk out all the more creamy alpha cum. Ardia screams her name, devolving into a wordless cry of pleasure as her balls empty into the bloated condom, swelling it until the latex bubble is as big around as Anno's head and slapping her cheeks with every aftershot. ");
	output("\n\n<i>\"Beautifully done, Ardia!\"</i> Anno laughs, pinching the condom shut around her crown and starting to pull the sheath off. The alpha's cock wobbles heavily when she finally releases it, only wilting enough to drool leakage all over Anno's tits on the way down. The lusty pup shakes her shoulders one last time, giving the alpha a final thrill that makes her whole body shudder. When Anno finally stands up and frees her arm from its anal explorations, Ardia just slumps back on her desk and pants, like the only thing that'd been keeping her upright was the arm.");
	output("\n\n<i>\"I'll send this to my friend at Akkadi and see about that infusion,\"</i> Anno says with a wink, dumping the contents of the condom into a beaker and sliding that into some sort of device under her desk. There's a loud whirring and spinning sound, followed by a pleasant little ping as it settles down. <i>\"All done. Should have the results in a day or two. I'll come chew your ear when I've got something.\"</i>");
	if (ardiaDomLevel() > 0)
	{
		output("\n\nYou thank Anno for the help, but after watching all that mouthwatering action, you've got to go service your mistress. You can't resist the chemical compulsion.");
		output("\n\nAnno watches with muted concern as you slid down on your [pc.knees] between your alpha's slick thighs and start tending to her limp cock, cleaning all that glazed cum off with your tongue.");
		output("\n\n<i>\"Oh, [pc.name]....\"</i>");
		processTime(30+rand(46));
		pc.maxOutLust();
	}
	else
	{
		output("\n\n<i>\"Thanks for the help, Anno. I'll leave you to it,\"</i> you say, patting Ardia' bare thigh on your way out.");
		if (silly) output(" <i>\"We'll bang, okay?\"</i>");
	}

	flags["DZAAN_CURE_ARRIVAL"] = GetGameTimestamp() + 2*24*60 + rand(24*60+1);

	addButton(0, "Next", mainGameMenu);
}

public function annoHasYourDzaanDrugs():void
{
	clearMenu();
	clearOutput();
	showAnno();
	author("Savin");
	processTime(2);

	output("<i>\"Hey, boss!\"</i>");
	output("\n\nYou turn around just in time to see Anno bouncing over, a small plastic case in hand. <i>\"Got a sec to talk? Specifically about your plus-sized problem.\"</i>");
	output("\n\n<i>\"Sure. You got something for me?\"</i>");
	output("\n\n<i>\"You know it,\"</i> she grins, presenting the case. <i>\"Who's a good girl?\"</i>");
	output("\n\nShe is, absolutely. Anno presents for headpats and you deliver them in spades, scratching all around those bushy white ears while accepting her new chemical concoction. By the time you're done, Anno's cheeks are flushed and her tail's wagging hard enough to slap the bulkheads audibly.");
	output("\n\nYou pop the case open and look inside while your snowy science-slut recovers from the scratches. Inside are a pair of small black hyposprays, utterly unremarkable except for Ardia's name printed on a sticky label attached to each.");
	output("\n\n<i>\"Just put one of those on your arm and press the button. You won't feel a thing... literally. Even if you've got a craving for Ardia's cum, that should dissipate in a matter of moments. And it'll inoculate you against further addictions... to Ardia. Not any other dzaan. So don't go around sucking some other alpha's dick without precautions, 'kay?\"</i>");
	output("\n\nAnd the second one's for Anno, you assume. She grins at the insinuation and takes one of the sprays, putting it against her wrist. <i>\"Very perceptive! After that last encounter, I'm itching for another crack at her crack... or to get mine around that fat cock. She's such a sweetie, despite all that alpha-bitch nonsense, and there's a <b>lot</b> to love about that body of hers. Talk about yummy.\"</i>");
	if (annoIsHuskar()) output("\n\nConsidering Anno's more voluminous proportions now, you guess it's no surprise that she's got a taste for bigger girls.");
	output("\n\nIf you didn't know better, you'd start to think Anno was a bit of a chubby chaser...");
	output("\n\nShe just grins and presses the button, making the spray hiss softly as it delivers its curative directly into her veins. <i>\"See? Easy peasy. No side effect ei-- oooh, whew, okay a little nausea but that'll pass. N-nothing to worry about. Uh... I'll see you later boss, I'm just... I'm gonna go get acquainted with the sink real quick.\"</i>");
	output("\n\nAnno staggers off in a hurry, leaving you alone with her concoction...");

	flags["DZAAN_CURE_ARRIVAL"] = undefined;

	addButton(0, "Next", (addictedToArdia() ? gotAFewThingsToExplainToArdia : giveAnotherMeaningToSafeSexWithArdia));
}

public function giveAnotherMeaningToSafeSexWithArdia():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");
	processTime(3);

	output("Well, Anno's certainly filled you with confidence in her concoction. Still, a little nausea is a small price to pay to get at that sweet slab of amazonian dzaan without risking your sense of self on an errant cumshot. Okay, enough beating around the bush -- you press the hypo against your skin and discharge it.");
	output("\n\nJust as with Anno, you feel fine a moment, then are hit with a brief wave of sickness that nearly makes you retch. The sensation passes after a few minutes, though, and you're left splashing water over your face in your quarters when a pensive knock comes on your door.");
	if (pc.isNice()) output("\n\n<i>\"Come in,\"</i> you groan,");
	else if (pc.isMisch()) output("\n\n<i>\"Nobody's home,\"</i> you groan,");
	else output("\n\n<i>\"Enter,\"</i> you say,");
	output(" grabbing a towel.");
	output("\n\nThe door slides open a moment later, revealing the familiar figure of the lady of the hour, the object of your carnal desires. You give Ardia your smoothest smile and toss the towel over your shoulder, beckoning her over. ");
	output("\n\n<i>\"Hey, captain. Doctor D- I mean, uh, Anno, said you wanted to talk to me? She looked pretty sick... is everything okay?\"</i>");
	output("\n\nMore than okay. In fact, you tell her that you've got some good news. Thanks to her 'donation' to Anno's research the other day, you've got a powerful chemical immunizer to her cum's addictive properties. Theoretically, it should be safe for you to enjoy each other's intimate company now.");
	output("\n\nArdia gasps, bouncing on the balls of her feet. Her tits bounce under their latex restraints, quaking hypnotically. <i>\"Really? That's great! I've never heard of something like that, but Anno's pretty darn smart. If she says it'll work, I trust her. So does that mean...?\"</i>");
	output("\n\nYeah, that's what it means. You step forward and pull the meaty dzaan in, sinking both hands into that lush ass of hers. She gasps, but you can feel her cock snapping to attention, straining against its latex sheath against your thigh. <i>\"C-captain...\"</i>");
	output("\n\n<i>\"[pc.name],\"</i> you whisper, kneading your fingers into the dzaan's skin-tight jumper. Your hands quickly make their way to her zippers, pulling them down so you can feast your eyes for the first time on all those beautiful bronze curves. You can't help but lick your lips as the full, monumental expanse of Ardia's deep cleavage is revealed, quaking subtly in its latex prison as her arms keep working down and down, all the way to her hefty package.");
	output("\n\nArdia's cock isn't all that much to look at, by galactic standards, but the haft is ribbed by little keratin nubs, and it bobs above a swinging sack stretched taut around two balls, each individually larger than Ardia's fist. The moment her zipper unleashes them, the pair of them come spilling out of her suit, swaying and slapping her thighs. You can almost <i>hear</i> them churning, full of addictive liquid weight.");
	output("\n\n<i>\"W-well, here I am,\"</i> Ardia smiles, peeling the suit off her shoulders and down her thighs. <i>\"Now wh-\"</i>");
	output("\n\nYou cut her off by taking her cheeks in hand, kissing her fiercely. Ardia's little keratin-coated cock jumps in surprise, a rush of blood flooding it and her cheeks in equal measure. ");
	output("\n\nNow... how do you want her?");

	immunizePCToArdia();

	ardiaSexMenu();
}

public function gotAFewThingsToExplainToArdia():void
{
	clearMenu();
	clearOutput();
	showArdia();
	author("Savin");
	processTime(2);

	output("Well, you've gone through all the trouble already. Guess it's time to sever your connection to your mistress -- to Ardia, damn it -- once and for all. You press the hypo to your skin and hit the tab, releasing all the freedom-giving drugs straight into your system. A wave of heat flushes through you body, spreading from your arm all the way to your heart and then out through your veins like quicksilver -- but the hotflash only lasts a moment, leaving you beading with sweat and dry-mouthed. " + (ardiaWithdrawal() ? "The hunger for cum that's been in the back of your mind for God-knows how long, though, suddenly feels like a faint memory, barely worth remembering." : "That latent hunger, always at the back of your mind, threatening to boil up and send you running for Ardia's sweet cock... that sensation eases its grip in your mind.") + " You blink, <b>trying</b> to recall the craving, but find your mind comes up as empty as a newborn's.");
	output("\n\nThat was... easy? Effortless, almost. You don't know what you expected, but what you've gotten is a wave of relief. You slump against one the bulkheads, breathing deep. The air feels cleaner... fresher...");
	output("\n\nAnd then you hear a hatch opening behind you, and your head starts swimming all over again.");
	output("\n\n<i>\"Hey, babe,\"</i> Ardia smiles, sauntering up and giving your [pc.butt] a playful slap. Her hand lingers, squeezing your rump. <i>\"You look down. Cravin' your fix of my cum, is it?\"</i>");
	output("\n\nNo, it's definitely not that, though as Ardia pushes herself up against your back, wrapping her arms protectively around you, you're reminded just how powerful your connection was... and is. It might not be a chemical compulsion anymore, but this chunky amazon's presence is still enough to make your heart flutter, it seems.");
	output("\n\n<i>\"...You okay?\"</i>");
	output("\n\nYou nod, turning in your alpha's... <i>no</i>, your lover's... arms and facing her. There's no way she won't realize that you've broken her addictive hold over you, so it's best that you tell her... right?");

	addButton(0, "Tell Her", function():void
	{
		clearMenu();
		clearOutput();
		showArdia();
		author("Savin");
		processTime(1);
		output("<i>\"Better than okay,\"</i> you tell her with a smile. <i>\"With a little help from Anno, I cured my addiction to you.\"</i>");
		output("\n\n<i>\"W-what?\"</i> Ardia blinks. <i>\"You did what? Why? I thought... I thought you loved it. I mean, you <b>chose</b> it. I never forced it on you, so why?\"</i>");
		output("\n\nIn short order, you explain the how and why of your cure, but reaffirm that it doesn't mean you hate Ardia all of a sudden -- if you did, you wouldn't have chosen to become her beta in the first place. Rather, you just don't like what your relationship's become, and how dependant on her you were. It's time to get back to something like normal, and with Anno's cure, you can have that again. ");
		output("\n\nBy the time you're done talking, Ardia's eyes are glued to the floor, and she's crossed her arms around herself, hugging them up under her rack. Her tapered ears droop, too, giving her an utterly scolded look. But when you finish, she bites an azure lip and gives you a resolute nod of understanding.");
		output("\n\n<i>\"I get it,\"</i> she says evenly. <i>\"My [pc.boyGirl]'s done playing beta... done being <b>mine</b>.\"</i>");
		output("\n\nArdia forces herself to smile. <i>\"I was getting used to having my little starter harem, but I'd rather be as far from a slaver as possible than be rolling in hot Steele ass. If you... if you think what you've done is best for you, then that's what I want, too. I only ever want the best for my betas.\"</i>");
		output("\n\nEven if that means not being her beta anymore?");
		output("\n\n<i>\"<b>Especially</b> then.\"</i>");
		output("\n\nShe sighs and takes a step back, looking you up and down. <i>\"So... back to the way things were, when we first me. I'll try and tone it back... but don't expect me to suddenly turn all submissive and demure, unless you <b>really</b> make a good case for it.\"</i>");
		output("\n\nThe 'in bed' is implicit, you guess. Well, it seems like Ardia's going to be a good sport about this after all.");
		output("\n\n<b>You are no longer addicted to Ardia, and she is no longer as dominant as she was.</b>");
		flags["ARDIA_DOMME_LEVEL"] = 0;
		immunizePCToArdia();
		addButton(0, "Next", mainGameMenu);
	}, undefined, "Tell Her", "Tell Ardia what you've done. <b>This will undo the dominant streak Ardia's built up.</b>");
	addButton(1, "Fake It", function():void
	{
		clearMenu();
		clearOutput();
		showArdia(true);
		author("Savin");
		processTime(1);
		output("<i>\"Y-yeah... just craving my alpha's cum real bad,\"</i> you murmur, reaching down to put a hand around one of this fat cum-tanks swinging between Ardia's thighs. ");
		output("\n\n<i>\"That's what I thought. Poor thing!\"</i> your alpha sighs, reaching for her zipper and leading you back towards her quarters. <i>\"Come on, let me make everything better...\"</i>");
		immunizePCToArdia();
		addButton(0, "Suck Her", succSomeArdiaDong);
	}, undefined, "Fake It", "Fake It Till You Make It. Just pretend that everything's as it was with Ardia. <b>This will leave Ardia's scenes as they were, \"pretend\" mental effects included, but her dominance score will no longer advance, as you cannot sink further into addictive cumsluttery.</b>");
}

public function immunizePCToArdia():void
{
	if (pc.hasStatusEffect("Dzaan Addicted")) pc.removeStatusEffect("Dzaan Addicted");
	if (pc.hasStatusEffect("Dzaan Withdrawal")) pc.removeStatusEffect("Dzaan Withdrawal");
	if (pc.hasStatusEffect("Beta's Satisfaction")) pc.removeStatusEffect("Beta's Satisfaction");

	flags["ARDIA_IMMUNE"] = 1;
}