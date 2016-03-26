public function isHalloweenish():Boolean
{
	return true;
	//checkDate(day:int, month:int, dayRange:int)
	return checkDate(29, 10, 3);
}

public function showHoliday(arg:String = "normal"):void
{
	showName("\nHOLIDAY");
	if(arg == "nude") showBust("HOLIDAY_NUDE");
	else if(arg == "equine" || arg == "horse") showBust("HOLIDAY_HORSE");
	else if(arg == "trap") showBust("HOLIDAY_TRAP");
	else showBust("HOLIDAY");
}

public function halloweenShipMove():void
{
	currentLocation = "SHIP INTERIOR";
	generateMapForLocation(currentLocation);
	showName("SHIP\nINTERIOR");
}

public function hollidayOweenAlert():void
{
	//Intro
	////Triggers randomly during October while the player is on their ship.
	clearOutput();
	showName("\nALERT");
	author("Adjatha");
	output("A familiar sound alerts you to a new message in your email. Weird, it’s from somebody you don’t recognize. Has somebody sold your address to a scammer? You run a cursory virus scan, but when it comes up clean, the temptation to see the message outweighs the sensible precaution of just deleting it.");
	output("\n\n<i>“Hey, where are you? I thought we agreed to meet up for The Masque? I keep trying to call you, but you’re not answering, so this is my last try. Dude, this shit is wicked. I’m gonna be on the west side of Craven city, but you’ve only got a few days left, so get your ass over here!”</i>");
	
	output("\n\nIt’s signed <i>“Wet & Waiting,”</i> you note with a small smirk. Must’ve been sent to you by accident. You’ve never heard of ‘The Masque,’ but a cursory search solves that problem in a heartbeat. Apparently, it’s some kind of month-long festival on Poe A, a fairly advanced planet you’ve never really given a second thought to. The event started as some kind of Autumn celebration way back when, but now it’s some kind of huge, bacchanalian party. You spend a few minutes browsing some anecdotes of previous years’ carousing and you’ve got to admit, it does sound interesting. Parties that go on all month, the most famous actors and athletes in the galaxy bumping elbows with nobodies, and legendary orgies that have to be seen to be believed.");
	output("\n\nLooking up from the explicit accounts, you eyeball your navigation system thoughtfully. You’ve been working too hard recently - a little break would be good for you. Maybe you can even meet up with ‘Wet & Waiting.’ Then again, <b>things can get out of hand at parties like that - with permanent consequences.</b>");
	
	if (!MailManager.isEntryUnlocked("the_masque"))
	{
		eventBuffer += "\n\n<b>New Email From Wet & Waiting (Wet.N.Waiting@GalLink.org)!</b>";
		MailManager.unlockEntry("the_masque", GetGameTimestamp());
	}
	
	//// Adds <i>“Poe A”</i> to navigation list
	processTime(3);
	flags["HOLIDAY_OWEEN_ACTIVATED"] = GetGameTimestamp();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function flyToPoeA():void
{
	author("Adjatha");
	output("Electing to have a little fun, you set a course for Poe A and before long, the planet looms before you on the display. It’s not particularly large, for a civilized world, but the traffic for landing vehicles is a little ridiculous. Thousands of craft are coming in every minute, with no sign of the influx slowing down. They’re from all over the galaxy too, even models you’ve never heard of before. Taking your place in the landing queue, you look around at some of the other visitors, eyes watering with envy as you spot a few ships that probably cost as much as this whole planet. Apparently the stories of stars slumming it up during the festival weren’t exaggerated!");
	
	processTime(5);
}

//Planetfall
////Plays when the player selects Poe A from their navigation list.
public function landingOnPoeA():void
{
	clearOutput();
	showName("\nLANDING...");
	author("Adjatha");
	output("When you finally get the chance to land, your ship is shepherded into a city-sized parking lot, automated vessels whipping back and forth to pick up visitors and speed them to the party. From what you read, the whole planet is virtually one big scene, so when an empty cart swings around to give you a lift, you tell the craft to take you to the west end of Craven city. Might as well start by seeking out your accidental host.");
	output("\n\nAt the command, the small cart swings its doors closed, sealing you in with a hissing lock. A port opens up and in the blink of an eye, the entire interior is flooded with cushioning foam, leaving your surprised body half out of your seat. With a lurching sense of acceleration, the transport sets out at top speed, your body presumably protected from the wild speeds by the foam around you. Not exactly the most comfortable way to travel, but you’ve had worse. Before long, the craft halts, your semi-solid prison deteriorating into a frothy, bubbly lather that leaves you clean and disinfected, ready to party. The door slides open and the city boils into view.");
	output("\n\nA wall of sound nearly drives you back into the transport the second you step out. A writhing mass of bodies fills nearly every inch of available street space, men and women screaming, singing, dancing, and drinking as far as the eye can see. The main thoroughfare just a short distance away has a slow parade of huge, garish floats making their way through the sea of revelers, statues of memorable movie monsters - and more than a few obscure ones too - atop each one. Some move with animatronic stiffness, bending and waving to the people below them, grinning with needle-point teeth and beckoning them to come onto the float with an array of blood-stained weapons. No one seems deterred by the horrors though, as they climb atop the wheeled displays with drunken delight, posing in mock defiance of the behemoths before laughing and leaping back into the crowd with the reckless confidence of the inebriated.");
	output("\n\nVirtually every building has its windows thrown open, with yet more celebrants leaning out or piling onto reinforced balconies. High above the press of the ground, these merrymakers attend to other impulses, couples or whole groups pressed together tightly, their moans of delight lost in the deafening bedlam of the festival. Some of the revelers above toss colored streamers into the air, letting the spiralling paper slowly float down in a dizzying array of color. Others throw small trifles to those riding the floats - plastic necklaces of glittering beads, in most cases, though more than a few fling lacy articles of clothing to coax more party goers to their rooms.");
	output("\n\nAfter taking in the sheer spectacle for a few minutes, you step forward to join in the fun, only to find your way blocked by a small mob of revelers who have turned to you and stare silently. The heat and fun of the festival cools considerably in the cold gazes of these stationary sentinels. You back away and try a different street, but run into the same problem. Fearing that you may have accidentally broken some unwritten rule of The Masque, you start to look up details when it hits you. You don’t have a costume! Literally every single person around you is wearing some kind of mask or decorative dress and it was just so universal that you didn’t give it any thought. Most people probably bring their own costume, but there’s gotta be some stores on-world who can help you out.");
	output("\n\nThere are plenty, as it turns out, but every single one of them are closed, sold out, or more commonly, both. Frustratingly, it seems you’re a bit unprepared for this year and, coming so close to the end of the season, just about everything’s gone. Unwilling to leave empty handed, you turn off the main streets and start wandering some of the less crowded alleys, trying to ask revelers for directions in the quieter sections, only to be greeted by the same icy hush of the others. Before long, you start feeling a bit discouraged by all the stonewalling and you seek out an alley with lit signs but no silent, judging, masked faces to dishearten you further.");
	clearMenu();
	addButton(0,"Next",holidayoweenPartDues);
}

public function holidayoweenPartDues():void
{
	clearOutput();
	showHoliday();
	author("Adjatha");
	//Go ahead and shut this down to prevent having to do it at the tail of every variant.
	flags["POE_A_DISABLED"] = 1;
	output("As you wander one such backstreet, an illuminated doorway catches your attention. A small, hand-written sign on the outside reads <i>“Holiday Supplies,”</i> and there seems to be a figure moving around in the back room of the otherwise empty store. Figuring it’s worth a shot, you step inside and stride up to the counter, calling out to the owner with a hopeful request. The shadowy figure in the back freezes for a second before slowly, reluctantly coming to the desk. The owner seems to be a young woman, around 6 feet tall, with generous curves and thick, pink hair that frames her angular face like a mane. She has a large number of piercings and a series of elaborate tattoos across her milky skin. Like everyone else on the planet, she’s wearing a costume, dressed in the white and red of a nurse’s uniform, though cut to be more revealing than practical - barely more than a risque swimsuit. Confusingly, she’s also wearing a pair of russet horns and a spaded tail. Maybe she couldn’t decide between a devil and a nurse and just decided to go with both?");
	output("\n\nShe looks at you with a cautious glare, sizing you up while chewing on her lower lip. Seemingly satisfied, she relaxes and leans across the counter, displaying the ample cleavage her costume seems designed to show off. <i>“Sup?”</i>");
	output("\n\nA little off-put, you ask her if she’s still got any costumes for sale.");
	output("\n\n<i>“Costumes?”</i> she asks, with a blank face. Her eyes flutter in surprise. <i>“Uh...”</i> she glances over her shoulder at the backroom. <i>“Yeah? Yeah.”</i> She puts on a smirking grin. <i>“Yeah, we’ve got costumes. Name’s Holiday. This is my... store? Yeah, store. Come to the back and we’ll get you in something.”</i> Suspicious demeanor aside, you follow after the sashaying woman, a little impressed by the life-like movements of her 3-foot long tail. Must be some kind of temporary spinal graft you think, as you enjoy the supple ripeness of her barely covered ass as well.");
	output("\n\nThe back room is mostly filled with sealed crates and unmarked boxes that give off a weird, aromatic smell that seems vaguely familiar but you can’t quite place. There are a number of cheap coat racks with random garments hanging from them without any rhyme or reason. Holiday produces a small, bone pipe from seemingly nowhere and puts what appears to be a piece of incense in it, puffing away as she watches you with private amusement. <i>“<b>Any of them are yours for 1,000 creds.</b> Just let me know if anything catches your eye,”</i> she murmurs.");
	//[Bodysuit] [Costume] [Mask] [Talk] [Leave]
	holidayMenu();
}

public function holidayMenu():void
{
	addButton(0,"Talk",talkToHoliday);
	if(pc.credits >= 1000)
	{
		addButton(1,"GoblinSuit",goblinCostume,undefined,"Goblin","You could dress up as some kind of fantasy goblin.\n\nPrice: 1000 credits");
		addButton(2,"Helmet",metroidMaskParody,undefined,"Helmet","This helmet looks pretty spacy! Rad!\n\nPrice: 1000 credits");
		if(!pc.hasGenitals()) addDisabledButton(3,"Armor","Armor","Looks like that outfit is for people with genitalia.");
		else if(flags["MET_SYRI"] == undefined) addButton(3,"Armor",greenArmor,undefined,"Armor","There's a suit of dark green armor on the rack, with a black bodysuit underneath holding the skimpy green plates together. You're pretty sure it's modeled after some video game character. The armor's probably not real, but it'll make a decent enough cosplay for a night on the town!\n\nPrice: 1000 credits");
		else addButton(3,"Armor",greenArmor,undefined,"Armor","There's a suit of dark green armor on the rack, with a black bodysuit underneath holding the skimpy green plates together. You're pretty sure it's modeled after some video game character... didn't you see Syri playing as this chick once? The armor's probably not real, but it'll make a decent enough cosplay for a night on the town!\n\nPrice: 1000 credits");
		if(pc.isTaur()) addDisabledButton(4,"HorseSuit","HorseSuit","It looks like the bottom half of a centaur... though you have a tauric lower half already.");
		else if(pc.isPregnant()) addDisabledButton(4,"HorseSuit","HorseSuit","It looks like the bottom half of a centaur. To avoid complications, you probably shouldn't wear this while pregnant.");
		else if(pc.hasGenitals() && flags["UNLOCKED_JUNKYARD_PLANET"] != undefined) addButton(4,"HorseSuit",centaurBunsBunsBuns,undefined,"Horse Suit","It looks like the bottom half of a centaur. Must be robotic.\n\nPrice: 1000 credits");
		else addDisabledButton(4,"HorseSuit","HorseSuit","You need to have made it to the second planet (and have genitals) for this choice.");
	}
	else
	{
		addDisabledButton(1,"GoblinSuit","GoblinSuit","You can't afford this junk. Crap.");
		addDisabledButton(2,"Helmet","Helmet","You can't afford this junk. Crap.");
		addDisabledButton(3,"Armor","Armor","You can't afford this junk. Crap.");
		addDisabledButton(4,"HorseSuit","Horse Suit","You can't afford this junk. Crap.");
	}
	addButton(14,"Leave",leaveLikeABitch);
}

//Talk
public function talkToHoliday():void
{
	clearOutput();
	showHoliday();
	author("Adjatha");
	output("As excited as you are to get out there and start partying your brains out, it might be prudent to get to know this woman a bit better. She’s been acting pretty shifty and some of these costumes look sketchy at best. You start by asking Holiday about her business.");
	output("\n\n<i>“This old place? Nah, it’s new. Just moved in, in fact. That’s why I haven’t had a chance to put up all the festive bullshit and flashing neon lights. Probably won’t have time to, either - this whole shebang’s ending before too long, then it’s time to move along.”</i> She transfers her pipe from one side of her mouth to the other, squeezing its bone lip between her teeth. <i>“Moving targets are harder to hit, ya know?”</i>");
	output("\n\nOkay, that didn’t answer anything. You try asking her about the festival. Clearly she’s been here before, since she’s selling costumes for it, even to the point of showing one off.");
	output("\n\nHoliday looks at you with a carefully neutral expression. <i>“Yes,”</i> she replies slowly, <i>“I am showing off a costume. It is a nurse and a demon. It is very popular to dress up like this.”</i> Her eyes dart around the room. <i>“Oh, what a pity, we seem to be out of these. Well, I wouldn’t want to sell you a pre-worn piece, so I guess you’ll have to be something else.”</i>");
	output("\n\nAlright, enough coy games. She’s obviously hiding something. You come right out and explain you’re not GPD and this isn’t an elaborate sting operation. You’re an off-world guest who just needs a costume, so would she please just speak plainly?");
	output("\n\nThe store owner arches an eyebrow, though it’s not clear if she’s impressed by your directness or offended at your tone. She hisses a steady stream of fragrant smoke from between her teeth and curls her lips into a crooked grin. <i>“Okay, but fair warning: the last person who told me they weren’t GPD actually was an undercover agent and they ended up being late.”</i>");
	output("\n\nYou roll your eyes, replying you don’t have a Policeman’s Ball to rush off to.");
	output("\n\n<i>“Not late to the Policeman’s Ball,”</i> she corrects. <i>“Late as in ‘the Late Detective Jack-off.’ So, tourist huh?”</i> She plucks the pipe from her mouth and upends its smoking contents into the palm of one of her hands. Casually, she flicks the ashen lump into her mouth and swallows it, tucking the pipe behind her back. <i>“How mind-numbingly exciting that must be.”</i>");
	output("\n\nYou’re not going to comment about the pipe-thing. You explain a little bit about your family and your job, but she seems more preoccupied in watching the erratic swaying of her own tail than in your backstory.");
	output("\n\n<i>“Yeah, being genetically engineered to do stuff for old fuckers is a pain. Hey, you should leave all that behind and come with me. Ditch these tame-ass parties, find some cool shit elsewhere in the galaxy, and then take it.”</i> She looks up, her yellow eyes studying your reaction. Before you can even speak, she sighs and makes a dismissive motion with her hand. <i>“Eh, forget about it. It’d never work. You’d get bored of living on the run and I’d get bored with not stabbing you in new and exciting places.”</i> Stretching like a cat, she turns in just such a way to show off her thin, curving frame.");
	output("\n\nShaking her head so vigorously that it proves her horns aren’t part of a costume, she sits down on one of the unpacked crates. Crossing one leg over the other, she places a finger to her lips, idly flicking at one of her piercings. <i>“So, deal with the devil time. You need a costume, I need some money, and this crap ain’t gonna sell itself. What’re ya buyin?”</i>");
	processTime(7);
	//[Bodysuit] [Costume] [Mask] [Leave]
	holidayMenu();
	addDisabledButton(0,"Talk","Talk","You just did this.");
}


//[Leave]
public function leaveLikeABitch():void
{
	clearOutput();
	showHoliday();
	author("Adjatha");
	output("Deciding that it’s probably better to try your luck elsewhere, you curtly tell Holiday that you’ve seen enough and head for the door. <i>“Woah, hold up there, ya butt,”</i> she calls out, her tail whipping out and grabbing you by the wrist. <i>“What a cocktease,”</i> she scolds, looking around and snatching a small strip of black cloth from a shelf. <i>“If you’re going back outside, you’ll need something, so just take this mask. No charge - I’ll consider protecting innocent citizens from your sour puss payment enough.”</i>");
	output("\n\nUncertainly, you take the mask from her. Sure enough, it’s a simple black mask designed to cover the eyes and nose, with a band to hold it in place. <i>“Yeah, don’t fall over yourself thanking me,”</i> she mutters, pushing you out the door and locking it behind you. Well, that was weird. But, at least you’ve got a mask! Slipping it on over your [pc.hair], you adjust it a bit and allow yourself a grin. Such a small thing, but apparently it makes all the difference to these people. Trying to remember the path you took, you wind your way through the alleys.");
	output("\n\nJust as you believe you’ve found the right way, you turn a corner and come up inches away from a knot of celebrants, standing in a tight huddle. Noticing you, they turn around, each robed in strange and sickening masks with costumes as hideous as the faces topping them. The empty, leering disguises stare for a long moment before turning to each other, silently affirming some unspoken conviction. Backing up, you glance about and reach for your [pc.weapon]. You don’t want trouble, you explain, you just got lost. A throaty chuckle echoes from behind the masks and is quickly joined by more figures approaching from behind them. A literal mob of frightening fiends in front, you decide this kind of situation calls for the better part of valor and you turn about, running for it.");
	output("\n\nThe veiled natives behind you shout something, but you’re too focused on getting the fuck out of there, your heart pounding in your chest, every corridor you pass seems to vomit more of the ghoulishly disguised figures, their attention firmly fixed on your passage. A shout of alarm rises like a siren as the swarm chasing you grows, the sea of bodies unarmed yet unspeakably dreadful in their single-minded pursuit. Your lungs burn, your [pc.legOrLegs] ache");
	if(pc.legCount == 1) output("s");
	output(", but you push on, unwilling to imagine what might happen if they catch you. Sight blurring and your gasping breath feeding the fire searing your chest, you choose directions at random, navigating the labyrinthian backstreets while the minotaur of a hundred masks seems at your very heels.");
	output("\n\nYour panicked flight is rewarded when, at last, you burst out of the oppressive alleys and into the main streets, your body immediately pressed on all sides by the crush of celebrants. You stop, catching your breath and looking for any trace of your pursuers, but in the garish gaiety of the masquerade, it’s impossible to tell one from another. The more you look at the thousands surrounding you, the more sinister their appearances seem - twisted expressions and monstrous visages with the cold black eyes of dolls or sharks. Suddenly, you don’t feel very much like partying.");
	output("\n\nYou head back to your ship and put as much distance between yourself and The Masque as you can, relaxing only once you’ve done a thorough check to make sure nothing crept aboard while you were gone. When you’re finally sure you’re safe, you recall the black mask you’re still wearing. Tearing it off, the band catches on your horns, spilling some of your pink hair over your eyes.");
	output("\n\nWait a minute.");
	output("\n\nYou twist around, noticing the long, spaded tail wriggling from the base of your spine, twitching with agitation to mirror your mental state. Rushing to a mirror, you see that, sure enough, you’ve acquired some new additions. You’ve got a long, shaggy mane of pink hair that frames two russet horns on either side of your skull, and a tail to match. Just like Holiday had.");
	output("\n\nYou think back on the strange, strangled, chanting cry that the masked creatures had been yelling. Now that you think of it, they may have been saying <i>“GPD! Freeze!”</i> Grabbing the mask and tearing it open, you find a small chip buried in the velvet lining with itty, bitty, tiny prongs barely poking through on the inside.");
	output("\n\nNo wonder they were chasing you: <b>thanks to her sabotaged mask, you look like Holiday!</b>");
	processTime(44);
	if(pc.hasTailCock() || pc.hasTailCunt())
	{
		if(pc.tailGenitalUnlocked(0)) pc.tailGenital = 0;
		if(pc.tailGenitalArgUnlocked(0)) pc.tailGenitalArg = 0;
		if(pc.tailGenitalColorUnlocked("null")) pc.tailGenitalColor = "";
		flags["CUNT_TAIL_PREGNANT_TIMER"] = undefined;
		flags["DAYS_SINCE_FED_CUNT_TAIL"] = undefined;
	}
	if(pc.tailCountUnlocked(1)) pc.tailCount = 1;
	if(pc.tailTypeUnlocked(GLOBAL.TYPE_DEMONIC)) pc.tailType = GLOBAL.TYPE_DEMONIC;
	if(pc.tailFlagsUnlocked([GLOBAL.FLAG_PREHENSILE,GLOBAL.FLAG_LONG]))
	{
		pc.clearTailFlags();
		pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
		pc.addTailFlag(GLOBAL.FLAG_LONG);
	}
	
	if(pc.hairLength < 12 && pc.hairLengthUnlocked(12)) pc.hairLength = 12;
	if(pc.hairColorUnlocked("pink")) pc.hairColor = "pink";
	if(pc.hairTypeUnlocked(GLOBAL.HAIR_TYPE_REGULAR)) pc.hairType = GLOBAL.HAIR_TYPE_REGULAR;
	if(pc.hornsUnlocked(2) && pc.hornTypeUnlocked(GLOBAL.TYPE_DEMONIC))
	{
		pc.removeHorns();
		pc.horns = 2;
		pc.hornLength = 2;
		pc.hornType = GLOBAL.TYPE_DEMONIC;
	}
	if(pc.earTypeUnlocked(GLOBAL.TYPE_DEMONIC)) 
	{
		pc.earType = GLOBAL.TYPE_DEMONIC;
		pc.earLength = 2;
	}
	if(pc.eyeColorUnlocked("glowing amber")) pc.eyeColor = "glowing amber";
	if(pc.eyeTypeUnlocked(GLOBAL.TYPE_DEMONIC)) pc.eyeType = GLOBAL.TYPE_DEMONIC;
	if(pc.wingTypeUnlocked(GLOBAL.TYPE_SMALLDEMONIC)) pc.wingType = GLOBAL.TYPE_SMALLDEMONIC;
	flags["HOLIDAY_OWEEN_LEFT"] = 1;
	halloweenShipMove();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Bodysuit] Goblin - Tamani cameo
public function goblinCostume():void
{
	clearOutput();
	showHoliday();
	author("Adjatha");
	output("Glancing around at some of the costumes, you pull one randomly off the rack - a small green number that seems to be adorned by black straps. It’s unclear what you’re looking at, exactly, but the zipper in the back suggests that this is a bodysuit. The material feels like a soft rubber on the inside, but there’s an unusually yielding sponginess to it that almost makes you think of some high-tech medical science.");
	output("\n\nHoliday flicks her earlobe with her thumb, impatiently waiting for you to make your selection. Noticing you’ve picked one up, she leans forward to see what you’ve got. <i>“Oh yeah. That’s a goblin suit. It came as part of a couples set, along with a ‘ghost’ costume. But... well let’s just say that I’m on a list that I don’t really want to be on, and ‘selling’ too many ghost costumes is a good way to move up from number 11 to number 10.”</i>");
	output("\n\nWould you like to buy the goblin suit, or select another?");
	processTime(4);
	clearMenu();
	//[Goblin] [Costume] [Mask] [Leave]
	addButton(0,"Buy It",chooseDatGobboCostume,undefined,"Buy It","1000 credits.");
	addButton(14,"Back",holidayMenu);
}

public function chooseDatGobboCostume():void
{
	clearOutput();
	showHoliday();
	flags["HOLIDAY_OWEEN_PURCHASE"] = "goblin costume";
	pc.credits -= 1000;
	output("Goblins are spooky, right? This should be enough to get through that creepy wall of stares that frustrated you before. After Holiday collects her payment, she gestures at a curtained corner of the room. <i>“Feel free to change here,”</i> she offers, hoisting herself daintily atop one of the crates and leaning back to rest her head against the wall. <i>“I mean, unless you strip down in public regularly. If that’s your thing, that’s cool, I’m just offering.”</i>");
	output("\n\nYou protest, ");
	if(!pc.isNude()) output("asking what you’re supposed to do with your [pc.gear]. <i>“Man, you can’t wear clothing under a bodysuit,”</i>");
	else output("asking what you're supposed to do with your equipment. <i>“Man, you can’t wear a backpack or a tablet under a bodysuit,”</i>");
	output(" she chides, heels slowly kicking against the crate. <i>“It’d look all lumpy and dumb. Have a little class. I’ll watch your shit for you tonight and you can pick it up after you’re done partying.”</i> She tilts her head to the side, pink hair falling across her cat-like yellow eyes. <i>“Don’t you trust me?”</i> The crate she’s sitting on lets out a deep, rumbling growl, which she silences with a crunching blow from her knuckles on the container’s reinforced lid.");
	output("\n\nYou haven’t met very many people less trustworthy than this woman, but the alternative is another long trip back to your ship and your time to enjoy the festivities is running out. Fuck it, you decide. Grabbing your costume in both arms, you head to the curtained corner,");
	if(!pc.isNude()) output(" stripping out of your [pc.gear] and");
	output(" opening up the rubber-like suit. A large zipper down the front of the costume opens it from neck to crotch, giving you plenty of room to wiggle your way in, the peculiar inner texture sucking at your skin as you stretch it over your [pc.legOrLegs] and hips. It seems a bit small, but luckily it’s got plenty of give, stretching as you slide your arms in and hoist the mask over your face. Shifting it around to get the eye and mouth holes right, you give another wiggling shake to smooth out all the air pockets before grabbing the large, thick loop of the zipper and pulling it up to the neck. The front flaps seal over to hide everything but the zipper itself, which now that you look at it, seems to have been designed to resemble some kind of antique slave collar. Cute.");
	output("\n\nNow that you’re inside, you look around to see what kind of a suit you’ve got. It proves to be less spooky than you were expecting - green skin sure, but supple curves around hefty hips and bountiful breasts that are only barely covered by slick, leather straps. Getting a better look at yourself in the reflection of a shiny steel container, you’re a little surprised to see a woman’s heart-shaped face look back at you, a wry smile curled on her plump emerald lips. Tousled black hair frames your full, dimpled cheeks, a shock of pink wafting above your left eye. Your large, pointed ears are full of silver piercings, studs, earrings, and clasps, while a single ring pierces your left nostril. You play with the ring for a moment, marvelling at the detail in the bodysuit - everything’s so realistic! Not at all the goofy rubber farce you’d been expecting.");
	output("\n\nWhen you step out from behind the curtain, Holiday looks up with an uncharacteristically disarmed grin. Letting out a slow whistle, she arches one eyebrow. <i>“Now there’s a goblin I wouldn’t mind putting through her paces. Come on, sexy, give us a twirl. Let’s see the rumpus.”</i>");
	output("\n\nWith a small laugh, you spin in place, feeling a bit dizzy. The unfamiliar proportions of your costume add so much momentum to your spin that you end up going around a few times before losing your footing and falling on your ass. Still laughing, you rub your rotund rear, ample cheeks smarting from the fleshy impact. Weird that something with so much padding wouldn’t protect you from a tiny fall! Holiday helps you up and you look up at her, a little surprised by how much the shopkeeper towers over you. <i>“Looks like you’re ready to party,”</i> she decides, nodding in confirmation to her own declaration. She guides you out the door and sends you on your way with a smack on the ass. <i>“Don’t do anything I wouldn’t do!”</i> she offers as her parting advice before slamming the door shut, locking it, and turning out all the lights.");
	processTime(15);
	clearMenu();
	addButton(0,"Next",goblinPartTwo);
}

public function goblinPartTwo():void
{
	clearOutput();
	showName("OUT ON\nTHE TOWN");
	author("Adjatha");
	output("Enjoying the lingering sting of Holiday’s slap, you head back to the main streets, noticing that you forgot to grab any shoes. Oh well, you decide, the pavement feels good on your bare soles, and it’s hard enough to walk straight as is! Eventually you find that a swaying sort of strut seems to work best, giving your broad hips plenty of room to swing while offering your head-sized breasts plenty of opportunity to jiggle against the straps barely restraining them. The few people you pass on the way back give you a cursory glance before turning their attention to you entirely, undisguised lust clear even through their masks. You fiddle with the ring-like collar around your neck, contemplating opening the suit just long enough to show them who’s inside, but decide not to break the illusion. Besides, the suit’s slightly warm interior has finally matched the heat of your own body, making it so comfortable you’ve got to give yourself a little grope, squeezing your waist with a delighted giggle.");
	output("\n\nThe parade of the fantastic and grotesque finally comes back into sight and you push your way into the crowded streets, a little surprised by how tall everybody is. Finding yourself more or less at crotch level to the throng, you can’t help but notice the straining fabric of supple hips and eager bulges. Your breath comes faster and you start to think the suit might be getting a little hot, until you wipe some sweat from your brow. Something seems off about that, and you stare at your glistening green fingers for a minute until you’re jostled, knocking the thought out of your head.");
	output("\n\nThe one who bumped you seems to be a kui-tan girl holding some kind of large diorama of a solar system. She’s hoisting a huge, yellow sun in a belt around her waist, with a variety of small planets bobbing around it. She mutters an apology, but your body has already told you what your mind is slowly working its way toward. You move in close again, pressing your palms against the sun and are rewarded with a soft, yielding pressure that sloshes with liquid weight.");
	output("\n\n<i>“Hey, careful down there,”</i> she protests, a little embarrassed by being openly groped. <i>“It took me months to save up enough for this costume.”</i> You look up at the blushing futa girl, a slow smile spreading across your face. Frankly, her costume would look better as a supernova and you tell her as much. A few eavesdroppers nearby chuckle, but the kui-tan turns about, trying to make her way away from the aggressive olive woman.");
	output("\n\nAs she turns her back, you sidestep her huge, bushy tail and wrap your arms around her waist, hands pushing under the sunny latex costume to grab for her fuzzy sheath. She lets out a gasp of surprise and pushes her hands down, to cover up your solar exploration. The pliant folds of her sheath roll and squish under your groping assault and in no time you’re rewarded with the sight of the nuki-girl’s crimson shaft peaking up from under the tawny covering. Squishing your breasts against the small of her back, you stroke the emerging shaft with both hands, coaxing her on with a husky voice that sounds very little like your own.");
	output("\n\nMoaning and unable to resist your needful kneading, she sinks to her knees, the monumental sun resting with wobbling thickness on the ground. Pulling at the straps around your waist, you clear a path for your viridian cooch to breath free, puffy emerald lips swollen with your impatient yearning. You circle around, pulling her hands down to your dense hips and grin with hungry zest. No longer caring about the growing circle of onlookers around the two of you, the kui-tan girl lifts you easily into the air and positions you over the pulsing length of her twelve-inch shaft. Circling your pudgy [pc.legOrLegs] around her waist, you lean forward and nip at one of her nipples through the black fabric of her dress. With a small ‘Eek!’ she loses her grip, dumping your hungry cunt directly onto the girl’s swollen member.");
	output("\n\nA swell of light and heat blinds you momentarily, the suit’s... no, your cunny squeezing down on the throbbing flesh that slid so perfectly into your gap, filling an emptiness you hadn’t realized you’d had before. With a whorish moan of rapture, you pump your hips up and down the shaft, fingers digging into the girl’s fur as you milk her for every ounce of her backed up load. It’s not just the electric pressure of her fat slut-fucker pounding your suckling pussy, nor even the churning heat of your own rolling orgasm alternately robbing you of muscle control and clenching your body in a tight knot of slattern ecstasy. No, the fervid hysteria driving your hips to a piston’s pace is entirely focused on the bloated ballsack beneath you, its fruitful bounty twisting your head into a tangled coil of desperate urgency. You flash the women around you dark looks that both threaten and gloat, your virile prey obediently thrusting womb-deep in your fertile depths.");
	output("\n\nWhen at last her overstocked testicles discharge their torrid load, a geyser of exquisite seed surging into your taut tunnel like a gushing thermal spring, you bite your emerald lip hard enough to draw a trickle of blood, clenching down to hold on for every bucking spout of seething spunk. The kui-tan cries out in the throes of her climax, fingers digging into your breeder’s hips, the force of each contracting cum spurt pushing your upward while she does her best to pull you back down, knotted base inflating too late to keep the two of you locked together. Each spunk blast is more powerful than the last, your gut filling with her buttery spooge, abdomen swelling outward in fattened excess. Scrambling to remain mounted for every last ounce, you lock your ankles and loop your arms under hers, your swollen cunt greedily drinking in pressurized gallons.");
	output("\n\nThe suppressed flow builds within you, cock-milk ballooning your belly until, muscles aching and body trembling from the endless orgasm, your concentration slips and the pressure breaks your embrace. Like a rocket, you launch off of the kui-tan’s supernova, arcing through the air in delirious bliss. The planet’s lower gravity takes you over the heads of the leering onlookers, who are immediately soaked in the splashing spunk of the explosive release. Those directly beneath you are coated in a thick glaze of pearl goo as you fly overhead, spasming slit unable to hold in the nectar bloating your body to spherical proportions.");
	processTime(22);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",gobboPart3);
}

public function gobboPart3():void
{
	clearOutput();
	showName("OUT ON\nTHE TOWN");
	author("Adjatha");
	output("You land surprisingly softer than you would’ve expected, mind still disconnected from the cum overload and your subsequent climax-addled flight. Dazed, you glance around, the figures of the revelers small below you. The vague sense of moment suggests that you must’ve landed on one of the floats slowly parading through the midnight streets. A dumb smile of impregnated bliss on your face, you glance up at the float’s other occupant. It appears to be some kind of massive worm-like creature, a maw of circular teeth at its crown, a ring of long, thin arms around its midsection, its lower body hidden in the body of the float. Vaguely, you recall legends of the Ravenous Blatbugger Beast, some fictional monster so horrible nobody has ever seen it without being swallowed whole.");
	output("\n\nAs if reading your thoughts, the animatronic giant takes notice of the interloper on its platform and reaches down to scoop you up in one massive, spindly claw. You giggle with vertigo as you rise up into the air, the crowd staring and cheering with lunatic revelry. Supposedly, you recall, its victims were swallowed and digested over the course of a thousand years, but how would anybody know, if nobody ever escaped after seeing it? You let out a raucous laugh as the beast drops you into its yawning maw, a tremendous <i>“GULP!”</i> sound playing over some sound system inside the float.");
	output("\n\nYou tumble down the padded interior, dropping down into the innards of the massive puppet and landing atop a pile of previously swallowed ‘victims.’ The men and women under you writhe in drunk delight, sucking and fucking with such single-mindedness that they seem as muddled as you are. Despite the distended gut full of ‘Nuki seed, the breeding lust seizes you immediately, cocks of all shapes and descriptions filling your eyes, their vital cargo driving out all other considerations. You can just about feel the eggs within you aching for fertilization, your inner thighs glistening with the ebbing flow of leaking cream and your own oozing femme cum. It’s not enough to have one; you need all of them. Every cock, stuffing your little goblin body, pumping endless ropes of baby-batter against your swollen eggs until the weight of your impregnation leaves you blind and deaf to the world outside of your body, lost in the perpetual rapture of endless pregnancy.");
	output("\n\nThings go fuzzy as the orgy begins in earnest, and when you finally come to, everything has changed. Groggy and still seeing double, your mind gradually starts putting the pieces of your night back together, though the effort is giving you a migraine. You try to stand, but every muscle in your body aches and it’s all you can do to keep from rolling over and going back to sleep. Concentrating on getting your eyes working seems like a good start, so you blink away the haze and discover that you’re back on your ship. That’s a bit weird, but you could think of worse places to wake up on.");
	processTime(520);
	for(var x:int = 0; x < 40; x++) { pc.orgasm(); }
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	pc.loadInAss(pp);
	pc.loadInMouth(pp);
	pc.loadInAss(pp);
	pc.loadInMouth(pp);
	pc.loadInAss(pp);
	pc.loadInMouth(pp);
	pc.loadInAss(pp);
	pc.loadInMouth(pp);
	clearMenu();
	addButton(0,"Next",gobboEpilogue);
}

public function gobboEpilogue():void
{
	clearOutput();
	showName("MORNING\nAFTER");
	author("Adjatha");
	output("Groping blindly for answers, you notice a small message chip nearby. Shrugging, you grab for it, popping it into your Extranet and hitting play. A small screen pops up, displaying a cute white-furred kaithrit, her small mouth turned down in a worried frown. Her green eyes shift back and forth, checking to see if anybody’s around while she records her message. <i>“Hi,”</i> she starts, her voice low and conspiratorial. <i>“You might not remember me from the party - you were pretty out of it. That’d actually be for the best. Partying with you was awesome, but things got pretty heavy by the end.”</i>");
	output("\n\nThe girl on the recording pauses, a shadow passing by rapidly, indistinct voices muttering from a short distance away. <i>“Look, I don’t know where you got that bodysuit, but it turns out that was some pretty serious tech. They’re saying it’s for ‘experimental rehabilitation therapy,’ but if how you were acting is any indication, total reprogramming seems more likely. Somebody must’ve recognized it, because a bunch of fuckers in dark suits started swarming just ahead of the GPD.”</i>");
	output("\n\n<i>“I work for Customs, so I snuck you out of there before either side could grab you.”</i> She blushes, glancing away from the screen. <i>“It’s the least I could do, after you... Well, anyway. Some pink-haired chick helped too. Said she’d hide the costume and had a bunch of clothes in your size. Even handed off the claim ticket for that ship I put you on. I don’t know who you really are, but you’ve got some good friends. You probably want to stay off-world for a while, at least ‘til all that shit we did blows over.”</i> She gnaws at her lips, chest rising in a regretful sigh. <i>“Well, if I don’t see you again, I just wanted to say I, uh... bye,”</i> she finishes, lamely, looking embarrassed. The video cuts out after that, leaving you with more questions than before.");
	output("\n\nWell, at least Holiday gave you your stuff and your ship back. Even if her costume was more than you were expecting. Shaking your head, you reach for the zipper but find nothing. Oh, that’s right, the kaithrit said that a pink-haired woman took the goblin bodysuit back, didn’t she? Probably Holiday reclaiming her apparently illegal merchandise. But that would mean... you look down at your glistening, emerald skin and wide, brood-mother hips. Damn, that was one hell of a costume.");
	//[Permanent TF effects: Player’s skin color turns green and hips become brood-mother sized. If they have a vagina, the capacity increases greatly.]
	pc.skinTone = "green";
	if(pc.hasVagina()) 
	{
		for(var x:int = 0; x < pc.totalVaginas(); x++)
		{
			pc.vaginas[x].bonusCapacity += 25;
		}
	}
	if(pc.hipRatingRaw < 20) pc.hipRatingRaw = 20;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Mask] Metroid Parody
public function metroidMaskParody():void
{
	clearOutput();
	showHoliday();
	author("Adjatha");
	output("Skipping over the larger costumes, you notice a ruddy orange helmet lying atop one of the numerous unmarked crates. Picking it up, you see with delight that it’s about your size and it even has some neat little flourishes on it. Bundles of tubes connect to the mask, seemingly to keep you cool while wearing it, and a little switch inside makes the green visor glow with a pale light - perfect for finding your way out of these back alleys.");
	output("\n\n<i>“Oh yeah, that old thing,”</i> Holiday remarks. <i>“There was a whole ‘Bounty Hunter’ suit for it, but you wouldn’t believe how dirty the thing was. Dirt, grease, slime, even scorch marks. You’d think the previous owner did nothing but crawl through tubes for a living. Lucky for you, I’ve got an extra flourish that I’ll throw in for free.”</i> She flashes a crooked smile.");
	output("\n\nWould you like to buy the Bounty Hunter Helmet, or select another?");
	//[Helmet] [Costume] [Bodysuit] [Leave]
	processTime(4);
	clearMenu();
	addButton(0,"Buy It",samusCostumeGo,undefined,"Buy It","1000 credits.");
	addButton(14,"Back",holidayMenu);
}

public function samusCostumeGo():void
{
	clearOutput();
	showHoliday();
	author("Adjatha");
	flags["HOLIDAY_OWEEN_PURCHASE"] = "bounty hunter helmet";
	pc.credits -= 1000;
	output("Nodding, you sign over the cost of the costume and loosen the straps on the helmet, lowering it over your");
	if(pc.isBald()) output(" head");
	else output(" [pc.hair]");
	output(" carefully. As the large, oblong shape settles on your shoulders, you re-lace the straps and flick the inner visor switch. Your eyes fill with a white-green light and after blinking away the glare, you’re delighted to find a whole host of diagnostics filtering onto the visor’s screen. The readouts give you info on the ambient temperature, your heart rate, the steady pulse of your brainwaves, and even a selection of alternate display types, such as thermal, x-ray, echolocation, and... a combat display? You flip to that and start trying to puzzle out all the weapon systems it’s claiming you should have. This is some serious military-grade technology!");
	output("\n\nHoliday steps in front of you, breaking your concentration with a tap to your forehead. <i>“Yo, you alive in there?”</i> You grunt a confirmation, somewhat surprised when your voice filters out over some transmission port. <i>“Killer. Now, about that bonus,”</i> she produces a glass canister with heavily reinforced lids at both ends. The ice on at the hinges suggests that it’s a small refrigeration unit, a guess that’s born out when she flicks a switch and unscrews the top. A hiss of cold air pours from the canister and Holiday sets it down carefully on one of the crates, pulling a pair of pink medical gloves over her hands with an echoing snap.");
	output("\n\nWaving your hands and shaking your head, you in no uncertain terms tell her that you’re not going anywhere near whatever medical waste is in that canister. She flicks a glance at you, one eyebrow raised, her lips pursed. She reaches in and pulls out a dark green can with a tab at the top. Popping the tab releases a frothy hiss, but nothing more. She raises the drink to her lips, slurping at the foam with an expression of exasperation. <i>“Keep your panties unknotted, this is just a frosty brew. You’re kinda cutting into my dinner, ya know? The prop’s over there,”</i> she gestures vaguely at a pile of lumpy objects under a shiny blue sheet before turning around and muttering.");
	output("\n\nRolling your eyes at the devil-nurse, you stomp over to the blue latex and toss it aside to find a small glass case with a bright green squeaky toy inside. Flicking the latch, you pull the globular thing out, holding it delicately between two fingers. About 3 inches long and roughly spherical, the toy seems to be made of some gooey gunk that squishes in your fingers, letting out a little <i>‘squeeee’</i> with every poke. Tiny white nodules at what must be the bottom makes it seem like a cross between a pet toy and an especially slimy bug. You can almost make out tiny red orbs inside the green sphere - probably the air bladder that makes the squeaking noise. Well, whatever. It’s not much of an alien for a bounty hunter like yourself, but it’ll have to do. You slap the little guy atop your helmet with a moist plop.");
	output("\n\n<i>Squeeeee...</i>");

	//[PC.breasts & PC.ass increase 1 step without outputting any text]
	for(var x:int = 0; x < pc.bRows(); x++)
	{
		pc.breastRows[x].breastRatingRaw++;
		pc.breastRows[x].breastRatingRaw++;
	}
	pc.libido(5);
	pc.buttRating(1);
	pc.hipRating(1);
	processTime(4);
	clearMenu();
	addButton(0,"Next",bountyHuntsPart2);
}

public function bountyHuntsPart2():void
{
	clearOutput();
	showHoliday("equine");
	author("Adjatha");
	output("Holiday looks up from her liquid dinner, eyes growing wide and her can slipping out of her fingers to clatter on the ground. Gee, what’s she so worked up about? You look behind you, but there’s nothing, of course. Just trying to scare you, probably! You play with your helmet a bit - the visor’s giving you all kinds of weird numbers. Hopefully you didn’t break anything! You shake it around, noticing the blue cloth again. Oh! It’s a suit! Well, that’d look cute on you.");
	if(!pc.isNude()) output(" You begin stripping out of your [pc.gear], freeing your [pc.chest] with giddy excitement.");
	output("\n\n<i>Squeeeee...</i>");

	//[Pc.breasts & PC.ass increase 1 step without outputting any text.]
	for(var x:int = 0; x < pc.bRows(); x++)
	{
		pc.breastRows[x].breastRatingRaw++;
		pc.breastRows[x].breastRatingRaw++;
	}
	pc.buttRating(1);
	pc.hipRating(1);

	output("\n\nHoliday’s saying something, but whatever, she’s just jealous of how good your [pc.butt] looks in this shiny blue costume. Sliding into it fully and zipping the skin-tight bodysuit up to the neck, you give an exhibitionary twirl, running your hands up your [pc.hips] and over your [pc.breasts]. Your [pc.nipples] ");
	if(pc.hasLipples()) output("plump up");
	else output("stiffen");
	output(" under the blue latex and you give them a little extra attention, circling your thumbs across their peaks, your glistening globes jiggling with the thrill of your sexy costume. Everyone’s going to love it, you’re just sure!");

	output("\n\n<i>Squeeeee...</i>");

	//[Pc.breasts & PC.ass increase 1 step without outputting any text.]
	for(var y:int = 0; y < pc.bRows(); y++)
	{
		pc.breastRows[y].breastRatingRaw++;
		pc.breastRows[y].breastRatingRaw++;
		pc.breastRows[y].breastRatingRaw++;
	}
	pc.buttRating(1);
	pc.hipRating(1);

	output("\n\nThe little health meters on your visor are doing some silly things. Some of the lines are going all crazy while others are going way, way down. That’s weird! Stupid helmet. Giving yourself a bonk on the side of the head, the visor switches to heat-vision and you notice with surprise that there’s a little glow coming from a nearby box. You turn to ask Holiday what’s in the box, but she’s not there anymore. Where’d she go off to? Oh well, time to explore the mystery box! You bust it open with");
	if(pc.legType == GLOBAL.TYPE_HUMAN || pc.hasLegFlag(GLOBAL.FLAG_HEELS)) output(" the heel of your foot");
	else output(" a good hit from your [pc.foot]");
	output(" and coo with delight as you see the thing inside is a friendly little pet! You fumble at the visor until the picture goes back to normal, then crouch down to look at the little guy.");

	output("\n\nHoliday’s pet seems to be just over a foot tall, with purple skin and a bird-like beak. Unlike birds, it’s got a long, pointed tail that whips about as it looks at you with glowing red eyes. It’s in some kind of cage, but that simply won’t do! You open the cage and giggle with amazement as it unfurls a pair of wings as large as its body, launching itself into the air, circling you with an unblinking gaze. Folding your arms under your [pc.breasts], you decide to call it Ripply, after the way its wings ripple in the air. The little guy keeps circling you, studying your [pc.ass] with particular focus. What a silly little bird!");
	output("\n\n<i>Squeee!</i>");

	//[Pc.breasts & PC.ass increase 3 steps without outputting any text.]
	for(x = 0; x < pc.bRows(); x++)
	{
		pc.breastRows[x].breastRatingRaw++;
		pc.breastRows[x].breastRatingRaw++;
		pc.breastRows[x].breastRatingRaw++;
		pc.breastRows[x].breastRatingRaw++;
		pc.breastRows[x].breastRatingRaw++;
	}
	pc.buttRating(2);
	pc.hipRating(2);

	output("\n\nOooo, you feel a little woozy. How strange, you’re all off-balance all of a sudden. Ripply flies down to perch on your [pc.ass], obliging you to lean forward so you don’t fall backwards and squish him under your latex-clad rump! Your [pc.breasts] jiggle heavily, the heat of your bodysuit catching up to you. Your visor begins to fog up from the heat of your breath and the weird lines and meters start hurting your head. Pulling the clasps off, you lift the helmet off and set it down. Oh, how weird! The little green blob you put on it is gone - replaced by a much, much bigger version! The big blob is nearly twice the size of your head and seems to be wiggling all by itself. Slowly, it rises up off of the helmet, hovering in the air and trembling its tiny little teeth-legs. A grin spreading across your face, you reach out to poke the funny thing.");

	output("\n\nHoliday leaps out first, a heavy canvas sheet wrapping around the green critter, who squeaks with displeasure. She swings it around, running to a mini refrigeration unit and slamming the blob inside before you can protest. Panting and staring at you like you’re crazy, she snarls something, her tail thrashing wildly. You shrug, helpfully, and offer her a smile.");

	output("\n\nMeanwhile, Ripply seems to have made himself at home between the thick mounds of your cheeks, kneading at your [pc.ass] with tiny, blunt claws. You hear a soft tearing as he manages to pull open one of the seams of your straining bodysuit, the heat of his tiny frame immediately apparent on your exposed posterior. You playfully ask him what he’s up to back there, the question immediately receiving its answer as a thick, rigid protrusion slides through the tear and under your suit. You let out a gasp of surprise and reach");
	if(pc.legCount == 1) output(" around your [pc.thighs]");
	else output(" between your [pc.legs]");
	output(" to guide the little guy out, fingers tracing the throbbing girth of his writhing shaft. The bumpy, ribbed surface actually feels really good, you have to admit, more stroking his length than forcing it out.");

	output("\n\n<i>“No help for it now,”</i> Holiday mutters. <i>“Better just let nature take its course.”</i> Stepping up to you, she gently pushes your head down, lifting your [pc.ass] higher into the air. Ripply lets out a tiny roar and feeds more of his breeding shaft into your suit, its firm head finally locating the entrance to your [pc.asshole]. Liquid oozes from his member, greasing up your cheeks, the warm lube dripping down your [pc.thighs] and spreading his tingling heat through your whole lower body. You squirm in the latex bodysuit, tugging at the too-tight surface straining against your [pc.breasts] ");
	if(pc.hasCock()) output("and your [pc.cocks]");
	output(". You shake your head, hair spilling across your eyes in full, blonde tresses. Has your hair always been");
	if(pc.hairLength < pc.tallness / 1.8)
	{
		output(" that long");
		if(pc.hairColor != "blonde") output("? Or that golden");
	}
	else if(pc.hairColor != "blonde") output(" that golden");
	else output(" like that");
	output("? You giggle, nervously, beginning to think somebody’s playing a trick on you.");
	
	//[pc.hair becomes blonde and grows to ass-length without outputting any text.]
	pc.hairColor = "blonde";
	if(pc.hairLength < pc.tallness / 1.8) pc.hairLength = pc.tallness / 1.8;

	output("\n\nAll worries vanish as Ripply’s swollen shaft pushes its way past your pucker and into your ass, inch by oh-so-thick inch. Biting your lower lip, you can’t help but marvel at the little guy’s determination! Claws buried in the yielding expanse of your hefty heinie, he pumps with single-minded determination, feeding a ribbed shaft longer than he is into your clenching rump. He lets out tiny roars from time to time, but your initial mirth quickly becomes delight as his rigid tool twists and flexes in vibrating segments. Your low moans at the filling pressure upgrade to ecstatic squeals as your body knots in a sudden and irresistible orgasm. As if Ripply had hit a release valve, you shudder and drop to");
	if(pc.hasKnees()) output(" your knees");
	else output(" the ground");
	output(", body clenching and bucking as your climax discharges liquid lust into your suit, bulging the skin-tight latex as your fluids pump into the full-body condom.");
	pc.buttChange(45);

	output("\n\nThe milking, thrusting assault only intensifies as Ripply feeds another six inches into your gut, a second orgasm forcing you to");
	if(pc.legCount == 2) output(" all fours");
	else output(" completely bow down");
	output(", mouth hanging open wordlessly at the suffocating pleasure that leaves your [pc.hair] thrashing back and forth. Holiday drops to her knees and grabs your chin in one pink-gloved hand, your drool running in twin streams down either side of your addled, mindless grin. <i>“You don’t mind if I take a little extra payment for those samples you released, do you?”</i> She asks with a sharp tone that does not invite a response. The nurse pulls aside the bottom of her costume, revealing a small, fleshy sheath at the base of her pelvis. Slowly, a thick, pink glans pushes out, its sloped surface broad and flat like a particularly gifted equine’s member. The hefty shaft swells outward, blobs of pearl spunk bubbling at its throbbing tip.");

	output("\n\nBefore you realize it, you’ve already engulfed the cock-crest in your hungry maw, tongue lashing at the tender meat and teasing the swollen breach to invite yet more of its sticky spunk into your throat. The probing pressure in your posterior drills another orgasm into you, driving you forward to swallow the length of the devil-girl’s cock up to the soft folds of her sheath. Nose squashed against her abdomen, you gulp in rapture as her rod expands in your mouth, pushing past your tonsils and into your gullet. You wrap your arms around her waist, to keep yourself locked in place and her tail circles around your wrists, tying you in the embrace. You lose count of the girl’s inches as she rocks back and forth, driving her raw girth through your bulging throat.");

	output("\n\nAnother orgasm tightens your body at both ends, provoking a roar from Ripply and a gasp from Holiday. The two thrust in time, driving toward meeting in the middle, your body taut and electric, every nerve firing on overdrive. The fluid of your messy and seemingly endless orgasms has filled so much of the body suit that a massive and expanding bubble has formed in the blue latex underneath you, giving you the appearance of heavy, liquid pregnancy. Your [pc.nipples] burn with the friction of the rocking suit, pressure flooding your chest as even they too surrender to the alien assault, milk spewing from your [pc.breasts] in sympathetic response to the gushing orgasms that pile one on top of the other.");

	output("\n\nGradually, darkness builds around the periphery of your eyes, orgasms coming so quickly that it seems you are trapped in one, endless moment. Holiday’s horseshaft fucking your throat in short, quickening strokes, you can feel her thick jizz pumping into your belly just as Ripply’s slut-taming tentacle cock widens to nearly twice its original girth, its narrow cum-slit dilating into a hose that releases a streaming geyser of breeding spunk into your spasming body. The blue latex bodysuit bulges obscenely with the accumulated weight of your climaxes, no longer skin-tight, but almost a huge blueberry, fluid spilling out of the tear between your");
	if(pc.hasLegs()) output(" [pc.legOrLegs]");
	else output(" [pc.butts]");
	output(". Practically swimming in your own lust juices, you surrender to the sweet oblivion of your spit-roasted rapture.");
	pc.buttChange(400);
	pc.intelligence(-1);
	pc.libido(5);
	output("\n\nBeing a bounty hunter is awesome, you think, as darkness overtakes you.");
	if(pc.milkMultiplier < 100) pc.milkMultiplier = 100;
	pc.milked();
	processTime(45);
	for(x = 0; x < 25; x++) { pc.orgasm(); }
	clearMenu();
	addButton(0,"Next",bountyHuntEpilogue);
}

public function bountyHuntEpilogue():void
{
	clearOutput();

	output("When you wake, the familiar hum of your ship surrounds you, nearly lulling you back to sleep. A splitting headache, however, rouses you back to the waking world. Groaning, you cradle your poor aching noggin and take stock of yourself. What happened? You got a mask from that weird demon girl that seemed like some kind of military hardware. You put a little goo thing on your head. You... released an unknown organism and let it have its way with you? The little goo thing grew to eight times its size? Uh, that’s probably not good.");
	output("\n\nYou shuffle over to a monitor and check your status. Seems like the autopilot was programed to get to a minimum safe distance from the planet. Punching up the local news feed, stories flood in about some floating green and red parasite that looks all too familiar. <i>“... attaches itself to your head, draining the victim’s brain power and inflating their feminine sexual characteristics. Do not, I repeat, do not approach this creature. Tales of cold-based weapons proving effective are entirely apocryphal at this time. Government representatives are claiming this is...”</i>");
	output("\n\nYour attention is pulled away from the report as you glance down, taking in the full scope of your experience. Your [pc.breasts] practically block off your view of the rest of your body, wobbling with heavy, flushed weight. Glancing at your side, your [pc.ass] seems so plump, it’s practically globular. You reach up and brush a long, golden lock of hair from your eye for a second, before reaching behind you and pulling a long, lustrous mane of blonde over one shoulder, stunned by the volume of your [pc.hair].");

	output("\n\nWhen you glance back up at the monitor, the reporter has a little green blob on her head that wiggles and vibrates in pulsing squeaks. Her bust has grown four or five cups and is on the verge of busting out of her top. Her hair grows before you eyes, fading from brown to blonde to platinum white. Her expression of shock quickly becomes one of oozing, sexual delight as her lips puff into a thick, whorish pucker and her eyes soften to a pale and empty blue. Switching the news feed off, you take stock of your own transformations. It’s a good thing you had that helmet on! Who knows how much more of a bimbo-bloated sex doll you would’ve turned into if that thing had been parked right on top of you all night! You entertain the thought of trying to turn in Holiday for keeping dangerous organisms in crates and boxes, but considering your own role in their release was more than just incidental, decide that would be a very bad idea. Plus, she did get you off-world before the shit really hit the fan.");

	output("\n\nAnd, you realize with a groan, maybe the prop she meant for you to grab was the blue latex suit, not the multiplying brain parasite under it. Oops.");
	// Kiro stand-in, for consistency!
	pc.loadInAss(chars["KIRO"]);
	pc.loadInMouth(chars["KIRO"]);
	if(pc.femininity < 70) pc.femininity = 70;
	if(pc.lipMod < 5 && pc.femininity >= 90) pc.lipMod++;
	if(pc.lipMod < 5) pc.lipMod++;
	processTime(560);
	halloweenShipMove();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*
Amazon Armor
Summary:
Skimpy boob-plate armor made from the left-overs of a suit of last-gen Coalition combat armor over a bodysuit of chameleon weave. Looks like a cute costume... but it's actually an abandoned military project to give troops "second skins" to beef them up so they could use old power armor. The actual effects turn you into a towering, ripped amazon... but also causes an insatiable urge to sexually dominate, and marked increase in aggression with a commensurate reduction in modesty. Exhibitionism ho~!

Physical Changes:
+10 Current, +5 Max Physique
-5 Current/Max Reflexes

Change skintype to skin.
Increase height to 7'0, or by +12 inches, whichever is a greater change.
+20% Fertility & Virility
+5 Cup Sizes (Up to GG cups)
+2 Hipsize (up to Broodmare-sized)
If PC has cock: Increase cocksize to 12 inches, or +4 inches, whichever is a smaller change.
+Femininity
+20 Tone, or set tone to 75, whichever is a greater change.
-10 Thickness, or set thickness to 25, whichever is a greater change.
+12 inches Hair length (down to ass-length); hair becomes flame-red.


Perk/Mental Changes:
Gain Brute Speech
+20 Libido
+5 Current and Max Willpower
+25 Exhibitionism perk (or enough to get you to be able to go nudist/fap in public, whichever is less)

+Perk: Inhuman Desire
+Perk: Amazon Dominance (Gain a bonus to Tease chance based on Physique)
*/

public function amazonTFShitApplied():void
{
	pc.physique(5);
	pc.reflexes(-3);
	pc.aim(-2);
	if(pc.tallness+12 <= 84) pc.tallness = 84;
	else pc.tallness += 12;
	pc.cumQualityRaw += .2;
	pc.fertilityRaw += .2;
	if(pc.breastRows[0].breastRatingRaw < 17 && pc.breastRows[0].breastRatingRaw + 5 > 17) pc.breastRows[0].breastRatingRaw = 17;
	else pc.breastRows[0].breastRatingRaw += 5;
	if(pc.hipRating() < 20) pc.hipRating(2);
	if(pc.hasCock())
	{
		for(var x:int = 0; x < pc.cockTotal(); x++)
		{
			if(pc.cocks[x].cLengthRaw < 12 && pc.cocks[x].cLengthRaw + 4 > 12) pc.cocks[x].cLengthRaw = 12;
			else pc.cocks[x].cLengthRaw += 4;
			if(pc.hasPerk("Hung")) pc.cocks[x].cLengthRaw += 4;
		}
	}
	if(pc.femininity < 70) pc.femininity = 70;
	if(pc.tone < 75) pc.tone = 75;
	pc.thickness -= 10;
	if(pc.thickness <= 25) pc.thickness = 25;

	pc.willpower(4);
	for(var y:int = 0; y < 18; y++) { pc.exhibitionism(2); }
}


//[Armor]
//Tooltip: There's a suit of dark green armor on the rack, with a black bodysuit underneath holding the skimpy green plates together. You're pretty sure it's modeled after some video game character.{.. didn't you see Syri playing as this chick once?} The armor's probably not real, but it'll make a decent enough cosplay for a night on the town!
public function greenArmor():void
{
	clearOutput();
	showHoliday();
	author("Savin");
	output("Taking a glance at the rack, your eyes are drawn to a costume that would look more at home at the Uritten Games Expo than a masquerade party: a black bodysuit overlaid with metallic green plates on the arms, legs, crotch, and chest. They leave the belly, thighs, and cleavage completely bare, and the boob-plates on the chest are clearly meant for a girl with some serious ballistics. It almost looks like something a soldier would wear, just cut down into a skimpy outfit that draws more lustful gazes than it does enemy fire." + pc.mf(" You’d definitely be masquerading as a hot babe with this on!",""));
	output("\n\nHoliday smirks as she sees you poking at the latex-like bodysuit underneath. <i>“Oh, yeah, the Captain Terra outfit. For all your gun-toting space marine needs. Guns not included. Gotta buy those separate,”</i> she smirks. <i>“Bodysuit will change to match your skin color if you put it on, shape ");
	if(pc.tone >= 66) output("that rockin’ bod");
	else if(pc.tone >= 33) output("that plain belly");
	else output("that flabby ass");
	output(" into something a body builder’d be proud of. If a body builder had huge balloon tits, anyway.”</i>");

	output("\n\nWould you like to buy the amazon-like armor, or look at another costume?");
	processTime(4);
	clearMenu();
	addButton(0,"Buy It",chooseToBeMissChief,undefined,"Buy It","1000 credits");
	addButton(14,"Back",holidayMenu);
}

public function chooseToBeMissChief():void
{
	clearOutput();
	showHoliday();
	author("Savin");
	flags["HOLIDAY_OWEEN_PURCHASE"] = "Captain Terra outfit";
	pc.credits -= 1000;
	output("Well, you wouldn’t call this get-up spooky, but the thought of masquerading as a big, buff amazon in power armor is pretty sexy. You turn to Holiday and give her your payment: you’ve found the perfect costume.");
	output("\n\n<i>“Cool. Feel free to change over there,”</i> she says, pointing to a curtained section of the shop. An impromptu dressing room, you guess. <i>“");
	if(!pc.isNude()) output("Can’t exactly wear your clothes under that bodysuit. Would look awkward, and the chameleon weave would probably turn weird colors. You can leave your stuff here if you want; I’ll take good care of it until you’re done partying. ");
	output("You can pick up your stuff in the morning or whenever.”</i>");

	output("\n\nShe tilts her head to the side, pink hair falling across her cat-like yellow eyes. <i>“Don’t you trust me?”</i> The crate she’s sitting on lets out a deep, rumbling growl, which she silences with a crunching blow from her knuckles on the container’s reinforced lid.");

	output("\n\nYou haven’t met very many people less trustworthy than this woman, but the alternative is another long trip back to your ship and your time to enjoy the festivities is running out. Fuck it, you decide. Grabbing your costume in both arms, you head to the curtained corner,");
	if(!pc.isNude()) output(" stripping out of your [pc.gear] and");
	output(" pulling the slicked-up bodysuit open. The exterior feels just like latex, firm and smooth to the touch, but once you’ve got the suit open, you find the interior is warm to the touch and feels almost fleshy. You set your [pc.gear] aside and pull the black suit over yourself");
	if(pc.isTaur()) output(", though you have to leave off the bottom half, due to your bestial lower body’s shape");
	output(". The green armor plates slide over your body nicely, conforming to your shape everywhere you place them.");
	if(pc.biggestTitSize() < 17) output(" The bodysuit’s internals even come with some nice, silicone inserts to pad out your chest!");
	else output(" The bodysuit’s just stretchy enough to let you slip your huge tits inside, though the green plates squeeze them deliciously together and up, making sure the cleavage you’re showing off is so over the top you might burst out at any moment!");

	output("\n\nYou’re almost ready to go, save for a zipper on the back you can’t quite reach. You slip out of the curtain and present it to Holiday, asking for a hand.");

	output("\n\n<i>“Woah, that suit’s lookin’ good on you,”</i> she comments, grabbing your shoulder and yanking the zipper up to the neck. You wince as the whole suit seems to become suddenly tighter, almost hard to breathe in, before it relaxes a heartbeat later. <i>“Oh, there goes the chameleon weave. Check it out.”</i>");

	output("\n\nYou glance down past your ample boob-plates in time to see the bodysuit’s black surface start changing color, spreading [pc.skinFurScalesColor] patches out from your belly-button out until the whole thing’s the same color as your body underneath. With how close it’s molded against you, even around the neck, it’s barely noticeable that you’re wearing one at all - just the sexy green plates!");

	output("\n\nHoliday grins and pokes one of your abs. <i>“That worked better than I expected. Which is saying something. Come on, strike a pose for me, space marine. Let’s see the goods.”</i>");

	output("\n\nYou roll your eyes but play along, striking a heroic position with muscles flexed and chest thrust-out. To your surprise and delight, the bodysuit flexes even harder than you could have, bulging around the arms and thighs like some sort of muscle suit. You look totally ripped, and totally stacked too! Holiday steps out of your way, letting you take a look in the mirror: you’re positively amazonian now, looking tall and powerful and heroic.... and like you could wrestle anybody who crossed you down and smother them in your rockin’ tits.");

	output("\n\nYou saunter up to the mirror and give another flex like a proper muscle-babe, even reaching down to give yourself a kiss on a bicep. Holiday laughs and puffs on her pipe. <i>“Alright, you’re enjoying that </i>way<i> too much. Go on, get out there or you’ll miss the party,”</i> she laughs, giving you a swat on the ass to grab your attention.");

	output("\n\nThe hit stings way more than it should through your skin-tight bodysuit, and Holiday’s fingers sink into the firm butt you’ve grown deep enough that you can feel them against your skin, as if she was groping you right through it!");

	output("\n\nYou reel in surprise, and find yourself grabbing the edge of the mirror. You feel awfully dizzy all of a sudden, blinking hard. Turning to face Holiday, you find her looking up at you with a grin, carting your gear off into a box. When she’s done, she guides you out the door and sends you on your way with a smack on the ass. <i>“Don’t do anything I wouldn’t do!”</i> she offers as her parting advice before slamming the door shut, locking it, and turning out all the lights.");

	output("\n\nYou stumble out, rubbing at your head a moment. The wooziness fades as soon as you’re out of the shop - maybe you were just getting a little too much of whatever it was she was smoking. You take a deep breath of fresh air, letting the chilly evening breeze wash over you. The suit feels a lot thinner than it did before, providing exactly no insulation from the cold. Better find somewhere warm to party - maybe hit a bar or a club? Or, chuckling to yourself, maybe you ought to find a gym and really fill this suit out. Maybe pick up some hot, sweaty piece of ass while you’re there. Yeah...");

	output("\n\nWith a confident swagger in your step, you head back onto the main streets looking for what trouble you can get into. Not surprisingly, your enhanced physique draws quite a few curious glances from the crowd, which quickly turn into out-and-out stares. Man, you must have just walked out into a crowd of short-shits, too: you’re a");
	if(pc.tallness > 96) output(" great deal");
	else if(pc.tallness > 84) output(" good deal");
	else output(" good head");
	output(" taller than anybody else on the streets! Well, that just makes your costume all the more convincing, and you find yourself pushing through the crowd of little guys and littler ladies, most of whom seem like they’re the perfect size to just bury in your cleavage and walk off with, like a pillaging conqueror claiming her prize. Where’d they get all these short people from?");

	processTime(15);
	pc.lust(15);
	pc.libido(1);

	//[Next]
	clearMenu();
	addButton(0,"Next",barbariannaCosplay);
}

public function barbariannaCosplay():void
{
	clearOutput();
	showName("OUT ON\nTHE TOWN");
	output("You laugh it off and strut your stuff, swaying your hips and affecting all the cool self-assurity that a giant amazon ought to have among a throng of people so much smaller and weaker than you are. The act works better than you could have hoped and soon the crowd is parting for you like the Red Sea, the lustful gazes of dozens of men and women firmly settled on your ultra-generous cleavage, firm ass, and powerful");
	if(pc.legCount == 1) output(" [pc.legNoun]");
	else output(" [pc.legsNoun]");
	output(". You absolutely fucking <b>bask</b> in the erotic attention, tempted to start showing off for the gathering crowd.");
	if(pc.hasCock()) 
	{
		output("\n\nOf course, as you parade down the street in search of something worth your time, you can’t help feeling a little breezier than normal, and something hot and heavy battering your thighs. You cast a glance down, past your impressively enhanced rack, and feel an unbidden flush burn your cheeks as you see your [pc.cocks] hanging free through your <i>“armor”</i>’s groin. Damn, how did you not realize the jumpsuit was crotchless!? The green plate that should have been acting like a codpiece seems to have fallen off at some point, leaving you dangling loose");
		if(pc.balls > 1) output(" and your balls swaying heavily with every step");
		output(". No wonder you’re drawing so much attention... but nobody seems to be stopping you, and frankly... you don’t give a damn. Let ‘em see just how much bigger and meatier <b>your</b> cock is compared to everyone else’s. Damn, every tiny little boy-toy around here ought to be blushing in shame!");
	}
	else if(pc.hasVagina())
	{
		output("\n\nOf course, as you parade down the street in search of something worth your time, you can help feeling a little breezier than normal. That, and your thighs feel a lot wetter than they ought to, like somebody spilled a thimble of hot lube on your crotch. You cast a curious glance down, past the awesome mounds of your enhanced rack, and notice that your [pc.vaginas] ");
		if(pc.totalVaginas() > 1) output("are");
		else output("is");
		output(" completely exposed and flushed as dark as you’ve ever seen ");
		if(pc.totalVaginas() > 1) output("them");
		else output("it");
		output(", drooling with your growing excitement from the attention. How the hell did you not notice this suit was crotchless... and why the fuck would you care? You’ve got the prettiest twat");
		if(pc.totalVaginas() > 1) output("s");
		output(" of any bitch in this place, and everyone deserves to know!");
	}

	output("\n\nYou grab a passerby at random, a cute little kaithrit cat-boy dressed up like a skeleton, with bleached-white hair pulled back in a long ponytail behind him. His tail goes straight up in alarm, especially when you pull him against yourself, making sure that your ");
	if(pc.hasCock()) output("throbbing, naked prick");
	else output("bare, drooling pussy");
	output(" is rubbing against his hip. The way he squirms and purrs is so cute, you could just ");
	if(!pc.hasCock()) output("throw him on the ground and ride him until the sun comes out");
	else output("bend him over and let him know what a real dick’s like");
	output(". And the way his cute little skeleton suit starts tenting, you’re sure he’d enjoy it.");

	output("\n\nAn ausar girl kitted out like... you’re not sure, some kind of ausar pop icon... comes trotting up and grabs the kitty-boy’s other arm, scowling up at you. <i>“Renn, what’re you doing?”</i> she huffs at what you assume to be either her boyfriend or, more likely given how he yelps in surprise and shrinks down at her accusation, personal boy-toy.");

	output("\n\n<i>“Come on, we’re gonna... gonna...”</i> the dolled-up puppy starts, before her eyes settle on you, like she just noticed you’re there. Suddenly her eyes go wide, drawn from your bare crotch up to the tremendous bust pressing into her pet kitty’s face. She just manages a half-hearted <i>“Woah,”</i> still absently tugging on the boy’s shoulder.");

	output("\n\nYou find yourself grinning down at the cute little couple, loving how confident and in command you feel, like you could do anything you wanted and nobody could stop you. Not that they’d want to...");

	output("\n\n<i>“Where you going, babe?”</i> you grin, licking your lips and grabbing the ausar girl in your other arm. She yelps, tail flicking against your [pc.leg]... but she doesn’t exactly put up a fight, at least not against your overpowering strength. Both of them wriggle a little, until you’ve got each of their heads pressed against a big, heavy tit. <i>“Your boyfriend and I were just getting to know each other. You should join us.”</i>");

	output("\n\nShe blinks, eyes wide. The crowd of revelers gets a little thicker around you, murmuring and watching with interest - and a few tented trousers - as you squeeze the mis-matched couple tight enough to make them squirm. You take the tiny pressure of the kaithrit’s boy-cock pressing into your shin as your answer from him, but the ausar girl... well, she’s got a lot less to show for herself, you you take the initiative, grabbing her ass through the seat of her skin-tight bellbottoms, squeezing so hard she jumps in your grasp. Her tail starts swishing hard, but she forcefully looks away from you, grabbing her boy-toy’s hand and trying to pull him back.");

	output("\n\n<i>“Stop being a spoil-sport, babe,”</i> you growl, shifting your grip on her ass to grab her crotch, feeling right through her pants into her damp little mound. Oh, she’s <b>wet</b> all right. Hot damn, she must be smuggling a swamp in her pants. She squeals, pulling hard at her boyfriend’s hand until they both manage to pull out of your grasp; you let them go with a laugh.");

	output("\n\nBut now your blood’s pumping");
	if(pc.hasCock()) output(", especially into your naked prick. You are throbbing hard, your cock thrust forward in front of you like a flagpole.");
	else output(" hard into your needy twat. No way you’re going to be satisfied with just a tease like that.");
	output(" You need satisfaction, <b>now</b>!");

	output("\n\nYou stride down the street in the couples’ wake, as if challenging anybody to step up to you. Of course, all the extra jiggle in your chest draws your attention pretty quick to something that’s gotten lodged in your bikini-armor’s boob-plate. You pluck it out with a curious purse of your lips, and find yourself holding up a slick holo-card, the kind fancy hotels have. There’s a room number on it, with the 1 dotted with a little heart. Did one of them...?");

	output("\n\nOh man, you have got the stuff tonight. You love how much extra confidence this badass body’s giving you... and you love the way everyone’s staring in awe even more. You give the many, many people scoping you out a big, strong smile and decide what to do:");
	processTime(23);
	pc.lust(30);
	pc.libido(1);
	//[Hotel Room] [Party Hard]
	clearMenu();
	addButton(1,"Party Hard",partyHardWivSavin,undefined,"Party Hard","Go to the nearest club, get fucking trashed, and find the sluttiest floozies you can to ride into the ground. You’re making this town yours tonight!");
	addButton(0,"Hotel Room",hotelPartyPartyParty,undefined,"Hotel Room","Follow those cute little pieces of tail back to their hotel room and give ‘em the time of their lives.");
}


//[Party Hard]
//Go to the nearest club, get fucking trashed, and find the sluttiest floozies you can to {pound/ride} into the ground. You’re making this town yours tonight!
public function partyHardWivSavin():void
{
	clearOutput();
	showName("PARTY\nHARD");
	author("Savin");
	output("Fuck ‘em, you’re going to party hard tonight. You start walking to the beat of the cacophonous mixes of music pouring from the planet-wide celebration’s many events, finding a rhythm you can swish your hips to as you try and pick out a club to crash. It doesn’t take you long to find one, appropriately named the <i>Spacer’s Trail</i>, though the second <i>“r”</i> on the glowing holo-advert has been turned off to make sure everyone knows there’s plenty of off-worlder booty to be had. At least, you’re pretty sure that’s what it means!");

	output("\n\nGrinning, you saunter right to the front of the line and grab the bouncer by the collar, hefting the wimpy little human dude up and telling him in no uncertain terms you’re here to get drunk, dance, and fuck until the party’s over. You give his crotch a firm grope for emphasis before shoving him against the brick wall and sauntering in.");

	output("\n\nOne step in, and the bass is hammering so hard your heart hurts in your chest. Lights flash in a dazzling rainbow of colors, almost distracting you from the rancid smells of booze, sex, and sweat intermixing into a heady aroma that has you even more aroused than before. You grab a drink from the bar, free of charge after a couple of already-inebriated bar floozies convince you to pull your top off, letting those huge melons of yours fly free. You casually note that the body suit’s gotten itself a sheen of what looks like sweat now, and the tips of your concealed tits are even graced with [pc.nipples]. Funny, you don’t remember seeing those when you pulled on that part of the costume...");

	output("\n\nOh well. You grin at the drunken sluts, appreciating their gazes drinking in your curvaceous, muscular form... but they’re too easy. ");
	if(pc.hasCock()) 
	{
		output(" Not too easy to have a quick-shot with a few of them, bending one over the bar while a second’s on her knees behind you, servicing your [pc.vagOrAss]. You thrust into the sultry slut’s sodden slit for a few minutes until you leave it overflowing with a virile load of [pc.cumNoun], but only enjoy it as a temporary relief from your raging desires. After you’ve left their companion half-conscious over the bar, drooling juices and murmuring incoherently, none of the others are quite so eager.");
		pc.cockChange();
	}
	else output("Not too easy that you deny the most-hammered of them’s request, though. You’ve soon got her on her back on the bar, your [pc.butt] crushing her face as her tongue explores every inch of your [pc.vagOrAss] while a second girl is bent over her, presenting her twat to you, and a third who’s packing a firm little girl-cock fucks her mouth. You leave them several minutes later in an exhausted heap, and you none the more satisfied than you’d started. You need more than that!");

	output("\n\nYou run your hands through your long, auburn hair");
	if(pc.hairColor != "auburn" || pc.hairLength < 14) 
	{
		output("... which you must have forgotten the suit has. Weird...");
		if(pc.hairColor != "auburn")  pc.hairColor = "auburn";
		if(pc.hairLength < 14)  pc.hairLength = 14;
		if(pc.hairTypeUnlocked(GLOBAL.HAIR_TYPE_REGULAR)) pc.hairType = GLOBAL.HAIR_TYPE_REGULAR;
	}
	output(" before sauntering onto the crowded dance floor, pushing through a throng of inebriated, costumed revelers. You don’t have much of a costume left on now, save for the skin-tight bodysuit");
	if(pc.hasLegs()) output(" and the armored leggings");
	output(", but nobody gives that a second thought now that you’re disguised as a towering, powerful amazon.");

	output("\n\nAn amazon that fuckin’ conquers the dance floor.");

	output("\n\nBarely an hour, you’re covered in sweat and surrounded by an orgiastic crowd that’s loving every second of your exposed body’s performance. You grab the waists of girls and boys and other aliens with equal vigor, grinding their asses or spinning them around to mash faces into your ample cleavage. Nobody goes away from you unsatisfied, but your libido never shrinks; steadily it climbs until you’re breathing hard, heart hammering, body demanding release. You’ve had so much booze that the whole world swims around you, and you’ve made so many poor boys cream themselves against your thighs and hips just by dancing with them that the smell of cum is getting overpowering.");
	pc.libido(2);
	output("\n\nJust as you think the night couldn’t get any better, though, it does. Some poor soul has the audacity to grab your ass between partners, pulling you back a step and grinding a latex-covered crotch against your firm behind.");

	output("\n\nYou spin around, grabbing your would-be partner... and find yourself staring down a beautiful babe in a sultry dragon get up: pale, bare flesh is supplemented by blood-red latex leggings and gloves up to her crotch and elbows, ending in clawed digits, and she’s got on a bikini bottom and a too-tight top that makes her ample cleavage positively <i>pop</i>! A pair of hardlight horns poke up from between locks of rust-colored hair on the top of a headband that culminates in a pair of projected, finned ears like a drake’s. She’s even got a pair of leathery-looking hardlight wings shooting out of her back, beating behind her to the beat of her heart.");

	output("\n\nCompleting the outfit is a swishing red tail covered in faux-scales, moving to the beat of its owner’s bouncing hips. The tail terminates in a hole through her panties, with just enough of a gap to see a furry tail slipping into the latex one");
	//if has ass-fucked Anno:
	if(flags["ANNO_ANALSEXED"] != undefined) output(", and a firm black plug going the other way, knotting the draconic tail firmly in the dancer’s ass");
	output(".");

	output("\n\n<i>“Damn, girl,”</i> you smile, grabbing her by the waist and pulling her clothes. <i>“That outfit is on fire!”</i>");

	output("\n\nShe giggles, drawing your eyes up to the slender red mask she’s wearing, shrouding a pair of big eyes with red contacts in. <i>“Thanks, gorgeous!”</i> the dragon-babe answers back, ");
	if(!pc.hasCock()) output("slipping her hands firmly onto your butt. One of them slinks a little lower, teasing a claw around your unprotected [pc.vagOrAss] until the sensation makes you gasp, so tense on the edge of penetration that your mouth hands open.");
	else output("slipping a hand around to firmly grab your ass... and using the other to gently brush your throbbing erection, cupping the shaft up until it’s pressed against your belly. Then she dances closer, pressing herself against you... and trapping your package between two slick, hot bodies. You moan something like <i>“God, yes!”</i> as she starts to grind, masturbating you with gleeful abandon.");

	output("\n\nYou smile despite yourself, grabbing the smaller girl by the ass and picking her up. She squeals with delight, happily wrapping her legs around your hips and pressing her tits against your [pc.face]. And she never even flinches from her masturbatory movements");
	if(pc.hasVagina()) output(", though she finally plunges a finger into your wanton hole");
	output(", making you throw back your head and howl in pleasure.");

	output("\n\n<i>“What’s your name, hot shot?”</i> you’re forced to ask, slamming her back against a pillar on the dance floor and shoving a hand under her panties.");

	output("\n\nThe dragon-babe squeals as your fingers plunge into a sodden-wet box. She rolls her head back against the concrete before turning to you with a toothy smile. <i>“Who needs names?”</i> she starts, until your wrist pops into her breed-hungry hole. She yelps in delight, hips pumping against you. <i>“Oh, fuck, you’re good... and gorgeous. Hot enough to make a dragon blush!”</i>");

	output("\n\nYou grab her latex top in your teeth and give it a pull, exposing a breast for you to latch onto. She moans, increasing her own movements against you in turn. <i>“Okay! Okay! I’ll give you my name... if I wake up in your bed tomorrow!”</i>");

	output("\n\nThat settles it, then. You put all your weight against her, pinning the slutty drake to the wall as you kiss your way up her tits to her mouth, careful not to disturb her mask as you molest her lips and tongue. ");
	if(pc.hasCock()) output("She grabs your [pc.cock] from between your bodies, starting to stroke with those wonderful latex gloves.");
	else output("She slips two more fingers into your [pc.vagOrAss] for emphasis, pistoning them hard into your greedy hole. If it wasn’t for the angle, you’d be bellowing for her to put the rest in too!");

	output("\n\nBut that’s not getting this hot piece of dragon ass into your ship. You pull her off the wall and throw her over your shoulder, firmly securing her legs and making sure she’s got easy access to your backside, before striding towards the exit. She cries in delight, grabbing your butt in both hands and yelling, <i>“Screw the princess, I guess you’re rescuing this slutty dragon instead!”</i>");

	output("\n\n<i>“So lame!”</i> you tease back, grabbing the first cab that passes by and chucking her in. You give the drone pilot your parking stub and tell it to floor it. The same weird foam shoots out as it accelerates, but not before you’ve pinned your draconic mate to the seat and resumed a hot and heavy session of kisses and gropes that last you all the way back to the vast parking lot to the east.");
	pc.lust(100);
	processTime(85);
	//[Next]
	clearMenu();
	addButton(0,"Next",annoPartyEpiloooogue);
}

public function annoPartyEpiloooogue():void
{
	clearOutput();
	showName("THE\nSHIP");
	author("Savin");

	output("The taxi dumps you off, and this time you grab the girl by the waist, burying her face firmly into your tits as you find your ship, fumble with the security seal, and stumble drunkenly in.");

	output("\n\nA minute later and you’re toppling through the doors of your quarters, spilling the draconic beauty across your bed. She crawls back, beating her leathery wings against the sheets as you ditch what’s left of your armor on the ground and pounce. The girl giggles, legs coiling around your waist as you go in for a savage kiss, tearing at her latex clothes until her tits are bouncing free into your hands, letting you play with her pink teats and sink your fingers into the creamy orbs.");

	output("\n\n");
	//if Anno Recruited:
	if(!annoNotRecruited()) output("<i>“Woah, this place looks...”</i>");
	else if(silly) output("<i>“D-damn, this feels familiar!”</i>");
	else output("<i>“Your [pc.tongue] is fucking--”</i>");
	output(" the girl starts to say, cut off as you lean up and peel her panties off");
	if(flags["ANNO_ANALSEXED"] != undefined) output(", taking the tail-plug with them! She arches her back in a cry of pleasure as the knotted toy is yanked out of her ass, leaving it nice and gaped open!");
	else output(".");
	output(" A fluffy white tail spills out from the latex appendage, spreading across your bed. She’s an ausar!");

	output("\n\nAn ausar with a smooth, pink twat that’s positively drooling with need. You don’t waste a second mashing your face between her legs, lapping up the sweet juices before tongue-thrusting in as deep as you can. Your lover squeals, arching her back and driving her hips against your face. The feeling of latex boots grinding against your bare, sweaty back gives you a thrill, spurring you to furiously tongue-fuck the wanna-be dragon-girl’s pretty pussy until she’s screaming and bucking in your hands, squirting an ungodly amount of aromatic pussy-juice all over your [pc.face]. She fucking loves every second of it, melting like sexual putty in your dominant grasp until you’re pulling her down the bed, planting her rosy lips right under your ");
	if(!pc.hasCock()) output("[pc.vagOrAss]");
	else output("[pc.cock]");
	output(".");

	//if no cock:
	if(!pc.hasCock())
	{
		output("\n\nYou swing your [pc.legOrLegs] around and hike hers up, giving yourself perfect access to her, and her to you. She’s as talented with her tongue as you could hope for from a randy puppy-slut, but with all the fire and passion of a dragon. You return the favor with all your strength, drilling deep into her sodden twat until she’s cumming again and again, bucking and screaming beneath you.");
	}
	else output("\n\nYou thrust your [pc.cock] deep into her mouth, thrusting in until she’s slathered your members with spittle before rolling the randy bitch over and hiking her ass in the air. You thrust in, earning a delighted cry. You yourself howl and grunt with pleasure, vigorously hammering into the tight, sloppy grip of the puppy’s pussy until she’s screaming and cumming, gushing juices down her thighs until your sheets are a mess. You’re going to be sleeping in her scent for weeks... and you’ll love every second of it!");

	//if Anno recruited/met:
	if(flags["MET_ANNO"] != undefined) 
	{
		output("\n\nThe two of you keep going for hours beyond counting, long after the celebrations outside have ended, until the dawn comes and find you leaning against your headboard, gently stroking the ausar-dragon’s rust-red hair. Your cabin has been utterly sullied by the stench of ");
		if(!pc.hasCock()) output("fem-");
		output("cum and the smells of an ausar bitch in the throes of heat, and both your bodies are sheened in sweat and a mix of sweet juices.");

		output("\n\n<i>“Never got your name, lover,”</i> you say as she stirs, yawning and stretching in your arms.");

		output("\n\nShe looks up and smiles prettily at you. She’s buck naked save for the mask now, revealing creamy-white fur on her arms and legs, and a pair of perky white... wait a minute....");

		output("\n\n<i>“Anno?”</i> you say, grabbing the puppy-babe by the shoulders and yanking her mask off.");

		output("\n\nShe yelps. <i>“Hey, you know my... wait... [pc.name]!?”</i> she blinks, eyes wide. <i>“What happened to you? You look totally... totally hot, and strong, and...”</i>");

		output("\n\n<i>“Shush,”</i> you say, pulling");
		if(flags["ANNO_SEXED"] > 0) output(" your lover");
		else if(!annoNotRecruited()) output(" your crew mate");
		else output(" the ausar");
		output(" in for a kiss. <i>“It’s just a suit.”</i>");
		output("\n\nShe murmurs happily, but when you break it, says, <i>“Feels like skin to me,");
		if(flags["ANNO_SEXED"] > 0) output(" babe");
		else output(" boss");
		output(". I think you might have found one of those old synth-suits. The ones that merge with your skin, make you strong enough to use old-school powered armor?”</i>");

		output("\n\nNo, no. You reach back and grab the... the zipper... that should be right on your neck... and isn’t. For a moment, you blanche. And then you realize, fuck it, this was about the best night of your life. If you’re a giant, big-titted amazon now, well, that’s not so bad. Especially if it makes Anno fall for you");
		if(flags["ANNO_SEXED"] != undefined) output(" all over again");
		output(". You hold her close for a while, eventually sending a Codex command to your auto-pilot to take you off-planet once your computer tells you a package arrived earlier in the night, bow-tied and signed by nurse Holiday. How thoughtful....");

		//[Next] //Back to ship menu
	}
	//if NotRecruited Anno:
	else
	{
		output("\n\nThe two of you keep going for hours beyond counting, long after the celebrations outside have ended, well into the morning. By the time you’re done, you’re both utterly exhausted, so weary that sleep takes you nigh instantly. You drift off with your dragon-pup lover held close in your arms, secure in your ownership of her.");
		output("\n\nYet she’s gone when you wake. You stretch, yawning powerfully before looking around. She’s gone, costume and all, but there’s a holocard taped to your dresser, shimmering with a big rosy lipsticked kiss. You pick it up and, rubbing the sleep from your eyes, see what’s on it.");
		output("\n\nTo your surprise, it’s a Steele Tech business card. That peaks your interest, especially when you read who it belongs to:");

		output("\n\n<i>Anno E. Dorna");
		output("\nPlanetary Branch Manager, Tarkus");
		output("\nSteele Tech Applied Sciences Division</i>");

		output("\n\nHuh. You guess she technically lived up to her end of the bargain... you’ll just have to pay her a visit some time soon. You smile to yourself at the thought and reach around your neck for the skinsuit’s zipper - you barely even remembered you were wearing it. You reach back, brushing your fingers around your neck, but... there’s no zipper! Your eyes go wide, searching frantically across your skin, but there’s nothing. No seams, no trace of the tab or train of the zipper. Yet as your fingers run across what should be the suit, you feel every brush and caress as if you were cupping your own flesh.");

		output("\n\nAnd you can’t feel anything beneath it. This outer layer is warm, carries your pulse, and feels sensation as if it <i>were</i> your skin. It even hurts when you pinch it, feels pleasure when you pinch a nipple. Has the amazon suit actually... <b>become your body?</b>");

		output("\n\nIt’s going to take some time to get used to this, but then again, you had a hell of a time last night. Maybe this isn’t a bad deal!");

		//[Next]
		//Back to ship menu
	}
	amazonTFShitApplied();
	processTime(666);
	annoSexed(1);
	anno.orgasm();
	anno.orgasm();
	anno.orgasm();
	anno.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.girlCumInMouth(chars["ANNO"]);
	pc.girlCumInMouth(chars["ANNO"]);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Hotel Room]
//Follow those cute little pieces of tail back to their hotel room and give ‘em the time of their lives.
public function hotelPartyPartyParty():void
{
	clearOutput();
	showName("THE\nHOTEL");
	author("Savin");

	output("Of course those two lovebirds want a piece of you. Who wouldn’t? You start walking to the beat of the cacophonous mixes of music pouring from the planet-wide celebration’s many events, finding a rhythm you can swish your hips to as you head towards the hotel. It’s not hard to find: just down the street you’re already on, flashing its signs in neon colors.");

	output("\n\nYou grin and push your way into the lobby, feeling a rush of warmth as you step inside. The lobby’s full of revelers coming and going, presenting their colorful costumes to each other like plumage. They’re not who you’re here for, though, and as alluring as some of the skimpy, skin-hugging outfits on display might be, you’ve got a pending appointment that demands your full attention.");

	output("\n\nSashaying past the front desk, you punch the elevator and check the room number you got. Room 2505, near the top of the towering mega-structure. It’s a long ride up, giving you plenty of time to strip off the excess armor plates in your costume, leaving nothing but the squeezing cups of the boob plate hefting up your tits, and the bikini-bottom hugging your breeder’s hips and decidedly not covering your crotch. The walls of the elevator are reflective enough for you to get a good look at yourself again, sexy beast that you are. You lick your lips and cup a tit under your costume armor, shivering with delight at the sensation. Even through the suit, you can feel pretty much everything, the sweat and oil on your skin, the heat your your body, the beat of your heart. It’s so lifelike, you can easily forget you’re wearing it.");

	output("\n\nMaybe you can keep the suit on while you fuck? Hell, why couldn’t you - nobody’s taking this off you without a fight until you’ve enjoyed it to the fullest. You smile wide, letting your arousal build until you’re so flushed you can’t stop yourself from reaching down to touch yourself, ");
	if(!pc.hasCock()) output("slipping a few fingers into your twat");
	else output("grabbing your cock and stroking it");
	output(" and grinding your hips against your hand to pass the time. Finally, the elevator dings into place, and you stride out, leaving the half-dozen other people who were riding with you staring with wide eyes, clearly jealous of your amazonian physique.");

	output("\n\nThe room you want’s at the end of the hall, a do-not-disturb sign holo flickering beneath the number panel. You knock, three powerful blows on the metal door, and lean seductively against the frame while you wait. It only takes a moment before you hear someone talking through the door, and the lock slams open. You’re greeted by the kaithrit boy out of costume, just wearing a bathrobe with his hair spilling around his shoulders in loose, platinum curls. The ausar girl’s nowhere in sight, though you can hear the sound of a shower running on full blast through another door.");

	output("\n\n<i>“W-woah,”</i> the kitten mewls, staring up at you. <i>“You’re-”</i>");

	output("\n\n<i>“Yeah I am,”</i> you grin, planting a hand on his chest and shoving him back in the room. You kick the door closed behind you, keeping the cat-boy retreating until he stumbles over the edge of the room’s bed with a yelp of surprise. He tumbles onto his back, and the feeble knot tying his robe together falls apart, letting the heavy cloth sag to the side and reveal a svelte, soft body and a tiny little clit of a cock resting over a firm pouch of balls. How cute!");

	output("\n\nYou grin down at the silver-haired kitten and leap up onto the bed, straddling his slender legs and crushing your own crotch down on his pathetic little pecker. He moans, the shock of it all leaving him completely paralyzed - and completely at your mercy. You grab his shoulders, pinning him down and leaning in until your can keenly smell the faint hints of cologne on his alabaster skin. <i>“Thanks for the card, gorgeous,”</i> you growl, nipping at his feline ear. You can feel his little shaft stiffening against your thigh, rubbing its nubby spines against your bare flesh. No way he can resist you, the way you’re treating him - a little toy like him is just made for this kind of primal domination.");
	output("\n\nStill grinning, you rise up on your [pc.knees] and hook your thumbs under your armored bottom. You hike ‘em down and off, tossing them against the wall and reaching back to the strap securing your boobplates");
	if(pc.hasCock()) output(" even as your [pc.cock] flops down on his belly");
	output(". To your delight, the cat’s hands slip around your bare hips, and his cock stands completely erect, rising up towards you like a flagpole");
	if(pc.balls > 1) output(" until its crown nestles between your [pc.balls]");
	output(".");

	output("\n\nNo need to waste any time: this slut’s ready and at your mercy. ");
	if(pc.hasCock()) 
	{
		output("You grab his flared little hips and flip him over under you, putting the boy-slut face-down on the bed and spreading his cheeks open with your thumb. There’s a pretty pink pucker hidden between them, winking at you right up until you run a spit-slicked finger over it and angle your [pc.cockHead] against it. He moans, twin tails flicking wildly at your face until you plunge in. He goes rigid, gasping loud; you just groan and grit your teeth, forcefully sliding yourself inside. He’s tight, of course, but that doesn’t stop you - you’re too strong, and too horny, to be denied. Your [pc.cock] inches inside, squeezed and caressed by spasming boypussy. Now this is what you’re talking about!");
		pc.cockChange();
	}
	else 
	{
		output("The poor boy’s so hard by now that you don’t have to do much of anything to get him ready; just lift your hips a little, make sure your [pc.vagOrAss] is brushing his throbbing crown, and ease down. He gasps, arching his back beneath you as you take his little rod to the base in one go. The bed quakes beneath you, squeaking almost as loud as your boy-slut’s moaning! Now this is the stuff!");
		pc.cuntChange(0,40);
	}

	output("\n\nIt doesn’t take long to get into the groove, bucking your hips over the squirming kitty-boy as he moans and squirts and cries out in unrestrained pleasure. You’re soon so lost in the moment that you don’t even hear the shower turn off, and you barely register the startled gasp at the tail end of a waft of wet dog-girl and lavender shampoo. You let loose an annoyed grunt and look up when you feel a clawed hand on your shoulder, pulling you from your rightful place smothering the cat-boy in lush cleavage.");

	output("\n\nYou blink and see the busty lil’ slut-puppy, standing buck naked and clearly all cleaned up for you, behind you. How thoughtful! You grab her by the waist and throw her onto the bed beside her boyfriend, watching gleefully as her double-Ds bounce and jiggle like water balloons while she sinks into the bed. She yelps, starts babbling about something until you grab her face and press it into one of your tits, shutting her up with a mouth full of [pc.nipple]");
	if(pc.canMilkSquirt()) output(", and a moment after, a steady helping of [pc.milk]");
	output(". Her eyes flutter, and her tail goes limp behind her. Good doggy!");

	output("\n\nThe cat-boy mewls, pawing a hand at his girl’s plush ass until you sigh");
	if(pc.hasCock()) output(", roll him over around on your cock,");
	output(" and bring him up to your other breast. You can’t decide if these two are just [pc.milkNoun]-obsessed or if they’ve just decided that they ought to give pleasure back as good as you’re giving to the kitten. Fine by you! You move your hips even harder, hammering them against the cat-boy’s crotch while the couple ");
	if(pc.canMilkSquirt()) output("suckles from you");
	else output("kiss and nip at your [pc.nipples]");
	output(". They squirm and wriggle in your grasp at first, but both cat and dog quickly settle down in your arms, moaning lovingly as your pound away at the cat.");

	output("\n\nIt doesn’t take much of that before he cums, ");
	if(pc.hasCock()) output("spraying a thick rope of white cream over his own belly");
	else 
	{
		output("announcing his climax with a shudder, and a wet heat spraying into your [pc.vagOrAss] as he spills his seed. You grin down at him, and he blushes apologetically, still twitching");
		if(pc.hasVagina()) output(" inside you");
	}
	output(". You push him down on his back, dismount him, and turn your attentions towards his lady-friend. She’s still happily tending to your tit, right up until you thrust her on her back and spread her legs. Her tail stands straight up, but you quickly have her at ease when you guide her boyfriend’s face towards her crotch. She’s a musky, murky mess down there already - her pussy’s rosy red and glistening with lube, which the cat-boy’s all too happy to lap up her sweet juices ");
	if(pc.hasCock()) output("while you line your [pc.cock] up with her ruby lips. \n\nHe just keeps licking the whole time, occasionally flicking his tongue across your shaft while you slide into the ausar slut’s sultry depths.");
	else output("while you slip around the bed to plan your [pc.vagOrAss] firmly on the ausar babe’s rosy lips. With her boyfriend busy licking her pussy, she can’t muster the courage to not pass it forward, and soon you’re moaning happily and riding her face, feeling the sloppy wet pup-tongue lap all around your sex.");
	output(" You love every second of using the ausar’s body, letting her ");
	if(pc.hasCock()) output("pussy");
	else output("tongue");
	output(" work wonders while you thrust your hips and grab her tits as hard as you can, fucking her for hours of bestial rutting powered by your new physique.");

	output("\n\nYou change positions again, and again, trading off which of the couple you’re fucking or being fucked by, never letting the cascade of pleasure stop for a moment. The pair belong to you, body and soul, by the time you cum the very first time, already wallowing in a veritable pool of their orgasmic residue. And you’re not done there. Mouths, asses, pussies, and cocks are all on tap for your satisfaction, and you aren’t contented with the pair until you’ve used all they have to offer and more, leaving them gasping and panting, barely sensate after hours of non-stop fucking.");

	output("\n\nWhen you’re finally done, sleep takes you faster than you can blink, still ");
	if(pc.hasCock()) output("buried in the cat-boy’s ass");
	else output("weakly grinding your cunt on the cat-boy’s face");
	output(".");

	if(pc.hasVagina())
	{
		var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
		pc.loadInCunt(pp, 0);
	}

	processTime(77);
	for(var x:int = 0;x < 41;x++) { pc.orgasm(); }

	//[Next]
	clearMenu();
	addButton(0,"Next",hotelRoomFuckEpilogue);
}

public function hotelRoomFuckEpilogue():void
{
	clearOutput();

	output("You wake up to a housekeeping robot gently poking you, asking if you’d like the sheets changed. You blink and start upright, looking around and finding that the room’s largely pristine. There’s no evidence of your lovers: no luggage, clothes, anything. Looks like they packed up and left in the night. You laugh to yourself and tell the ‘bot to do whatever - you’ve got to get back to your ship. Enough diversion from your quest, or you’ll never put [rival.name] where those two sluts where.");
	output("\n\nYou smile to yourself at the thought and reach around your neck for the skinsuit’s zipper - you barely even remembered you were wearing it. You reach back, brushing your fingers around your neck, but... there’s no zipper! Your eyes go wide, searching frantically across your skin, but there’s nothing. No seams, no trace of the tab or train of the zipper. Yet as your fingers run across what should be the suit, you feel every brush and caress as if you were cupping your own flesh.");
	output("\n\nAnd you can’t feel anything beneath it. This outer layer is warm, carries your pulse, and feels sensation as if it <i>were</i> your skin. It even hurts when you pinch it, feels pleasure when you pinch a nipple. Has the amazon suit actually... <b>become your body?</b>");
	output("\n\nIt’s going to take some time to get used to this, but then again, you had a hell of a time last night. Maybe this isn’t a bad deal!");
	output("\n\nYou’ll have to get used to it, it seems. You catch a cab back to your ship, happy to find that Holiday at least dropped your stuff off in the night. Must have found your parking stub with your Codex. Hmm, maybe you ought to go and give the doc a piece of your mind some day.");
	processTime(666);
	amazonTFShitApplied();
	//[Next]//Ship menu
	halloweenShipMove();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Centaur Costume
public function centaurBunsBunsBuns():void
{
	clearOutput();
	showHoliday();
	output("It’s impossible not to notice the elephant in the room - or this case, horse. In between a number of floppy, rubbery bodysuits is the powerful lower half of a terran equine, complete with a tail and four hoof-capped legs. The only thing missing is the beast’s head. Where the neck would begin, there is only an empty hole, perfectly shaped for someone like you to squeeze into. There’s no visible port for a control console. The rubbery-looking interior must be lined with sophisticated sensors to detect the firing of your muscle’s neurons. How else could you get around with it on?");
	output("\n\nHoliday flicks her earlobe with her thumb, impatiently waiting for you to make your selection. <i>“You gonna spend all night looking the gift horse in the mouth or go party? Centaur’s aren’t real common choices - real expensive. I’d normally charge way more, but... I’m saving on having to store it all year ‘til next Masque.”</i> Her eyes flick to the door, then back to you. <i>“Not to rush you, but I’d like to close up and join the party.”</i>");
	output("\n\nWould you like to buy the centaur body or something else?");
	processTime(2);
	clearMenu();
	addButton(0,"Buy It",buyTaurSuit,undefined,"Buy It","1000 credits.");
	addButton(14,"Back",holidayMenu);
}

public function buyTaurSuit():void
{
	clearOutput();
	showHoliday();
	output("It might not be very spooky, but it is imposing. It’d probably get you past all those creepy stares better than something a little less bombastic, and once you rejoin the party, you’ll be sure to be a popular figure. Who wouldn’t want to party with a centaur? <i>“I’ll take it.”</i>");
	output("\n\nHoliday smirks and has you transfer the credits to a dubious-looking holding account. The bank is some rimward corp you’ve never heard of. <i>“Great. You can change here.");
	if(!pc.isCrotchGarbed())
	{
		output(" Unless you plan on dragging four hundred pounds of horse butt all the way home. I doubt you could even fit it in the changing room. Just shuck your bottoms and climb. It won’t work without skin contact");
		if(pc.hasFur() || pc.hasScales() || pc.hasFeathers()) output(", or [pc.skinFurScalesNoun], I guess");
		output(".");
	}
	else output(" That’s not a problem for you, since you’re a nudist or something, right? Just climb on in and let the servos do the rest. It’ll be a lot easier than trying to drag four hundred pounds of horse butt into the little changing room.");
	output("”</i>");

	if(pc.isCrotchGarbed()) output("\n\nYou protest. What are you supposed to do with your [pc.lowerGarments]? This costume doesn’t exactly come with anywhere to store your stuff.");
	else output("\n\nYou protest, wondering where you’re supposed to store your gear. The few pieces of equipment you do keep on your mostly-naked body wouldn’t sit right once your hips are enveloped in the costume. There’s not even any storage compartments to hide your stuff!");
	output("\n\nHoliday huffs, <i>“Well duh! Nobody goes to Masque loaded up with a bunch of explorer’s gear.”</i> She idly kicks a crate. <i>“Unless they’re dressed up as an explorer, but who’s ever heard of a centaur explorer? You’d be better off going as a brainy galotian or a kui-tan nun.”</i>");
	output("\n\nPoint taken.");
	output("\n\n<i>“I’ll watch your shit for you. Just stick it in a corner, and you can pick it up in the morning after you’re done partying.”</i> She tilts her head to the side, pink hair falling across her cat-like yellow eyes. <i>“Don’t you trust me?”</i> The crate she’s sitting on lets out a deep, rumbling growl, which she silences with a crunching blow from her knuckles on the container’s reinforced lid.");
	output("\n\nShe’s about as trustworthy as a prom date’s purity promise, yet you don’t have a lot of other options. Wandering around without a costume seems a good way to flag yourself as a tourist and an easy mark. At least with your stuff in the store, you can get out and have some fun before the party ends for the night. Fuck it; you may as well have some fun.");
	processTime(4);
	flags["HOLIDAY_OWEEN_PURCHASE"] = "equine centaur suit";
	pc.credits -= 1000;
	//[Next]
	clearMenu();
	addButton(0,"Next",horseBodyGoooo);
}

public function horseBodyGoooo():void
{
	clearOutput();
	showHoliday();
	if(pc.isCrotchGarbed()) output("Stripping");
	else output("Getting ready to climb in");
	output(" is made awkward by the demonic nurse’s lecherous eyes. You swear that her eyes are drinking you up like a tall glass of water, but every time you glance in her direction, she’s diligently checking her nails. Maybe your brain’s just playing tricks on you after suffering under all the creepy stares outside. You resolve to put it behind you and approach your new costume.");
	output("\n\nIt looks even bigger up close. You can’t believe you got it so cheap. Even if its locomotors are cheap crap from Plurion 4, it’d still be a steal. The exterior looks like the real deal, too, with life-like fur and a real, horse-hair tail. It even <i>smells</i> sort of like an animal, not at all like a machine of metal, plastic, and rubber. Wow. You brush the coat a few times, and you swear you can feel the chest lift up with a breath. It must have air-pumps and bladders beneath the exterior to mimic the function of a living equine. You glance at Holiday and wonder if she knows just how amazing of a costume she’s selling you.");
	output("\n\nThe medically-attired demon is still checking her nails. Score.");
	output("\n\nPeering inside the opening, you can’t help but feel a little creeped out. It’s pitch black and rubbery, but glossy as if wet. You poke it with a finger to test, and your finger comes away oily. It must be self-lubricating. The artificial flesh jiggles a bit from the contact, sending ripples through the inorganic animal simulacrum like tiny waves. Bizarre.");
	if(attachedMimbranes() > 0)
	{
		output("\n\nWith an audible squeak, your Mimbrane");
		if(attachedMimbranes() == 1) output(" vibrates and quickly detaches itself");
		else output("s vibrate and quickly detach themselves");
		output(" from your naked form, fearfully scurrying out the door... Holiday silently blinks at you for an awkward moment. Well, that’s one way to spook a parasite, you suppose.");
	}
	output("\n\n<i>“You gonna get in or what?”</i> the demonic nurse barks. She drums her heels on the crate. <i>“Take too long, and you’ll miss all the fun!”</i>");
	output("\n\nShe’s right, of course. Every minute you sit in here looking at the suit instead of wearing it is another minute of partying you’ll miss out on. You shimmy down onto the floor and begin to wriggle in. It’d be easier if the thing was propped upright, but lying on its flank like it is means struggling to wiggle yourself into it horizontally on a floor that hasn’t been hit by a cleaning bot in ages. You get your [pc.feet] in without too much issue, shying away from the wet, warm feeling of the interior.");
	output("\n\nThe fibrous, rubbery insides cling to you at first, but the further you push in, the roomier it becomes. It’s quite easy to enter, actually. You slip in your [pc.thighs] and find that it actually feels quite nice against you, almost like having your [pc.legOrLegs] coated in massage oil. The fur-ringed entrance slides higher up your body");
	if(pc.hasGenitals()) output(", cupping your genitalia tightly, and");
	else output(" and");
	output(" enveloping your hips. The oily fibers inside press back against you more firmly, like hundreds of clutching fingertips, preventing you from entering any deeper into the costume. Is this how the suit will support you? You expected to hit a metal support plate or something.");

	output("\n\nAbruptly closing up, the costume seals itself to your [pc.skinFurScales] with a sucking sound lewd enough to make you blush.");
	if(pc.hasFur() || pc.hasScales() || pc.hasFeathers()) output(" Good thing you have [pc.skinFurScalesNoun] to hide it.");
	output(" The inner strands wind tighter and tighter around your [pc.legOrLegs], forming a second skin so tough that it might as well be hardened concrete. It pinches a little, just ");
	if(pc.tailCount == 0) output("above your [pc.butt]");
	else output("below your [pc.tails]");
	output(", at the base of your spine. You try to wiggle a little to work it out, but it does nothing for the white-hot pinch of pain. All your wiggling does is make your [pc.legOrLegs] hot and tired in the encased environment, unwilling to move even if they could. It’s only when you give up on your struggles that the discomfort fades away to nothing. Maybe you just needed to relax?");
	output("\n\nWhatever the answer, you want to get up off the filthy floor. The robotic horse chassis responds on cue, clattering up with surprising immediacy. If you had heard your cacophonous ascension from afar, you would’ve had no idea that those hooves were fakes. They sound just like the real thing. Effortlessly, you will your augmented form to prance in place, drumming out hoofbeats to an almost musical pace. There’s no sense of fatigue or tiredness, just the snappy clop-clop-clop of your new feet pounding out a thunderous beat. Marvelous!");
	output("\n\nYou lean back over your tauric hindquarters and brush your hands against your own fur, discovering with some surprise that you can actually feel the contact of your fingers against your bestial hide. How such a feat is possible is beyond you, but you have little time to ponder the mystery. Holiday’s hands plant themselves on either side of your happily swishing tail and shove you toward the door.");
	output("\n\n<i>“Get your shit on, show pony. I’ve got better things to watch than you trying to dance.”</i> Holiday smacks your ass again for good measure.");
	output("\n\nYou’re uncomfortably aware of just how close she came to your equine anus and wait... is that a... do you have a... ?");
	pc.lust(5);
	processTime(15);
	//[Horsecock] [Horsecunt] [Both]
	clearMenu();
	addButton(0,"Horsecock",horsecockForHorseButts,1);
	addButton(1,"Horsecunt",horsecockForHorseButts,2);
	addButton(2,"Both",horsecockForHorseButts,3);
}

//Horsecock
public function horsecockForHorseButts(config:int = 1):void
{
	clearOutput();
	showHoliday();
	if(config == 1) output("You do! This horse body is fully functional and anatomically correct - for a male horse! You let yourself be lead out the door, enjoying the way your too-heavy balls sway between your hind legs, sending pleasant tingles to your sheath-enclosed cock. It stretches longer within the sheath, threatening to burst forth and dangle out in the open, where anyone could see it. If just thinking about it feels this good, how good must it feel to fuck someone?");
	else if(config == 2) output("You do! This horse body is fully functional and anatomically correct - for a female horse! You let yourself be lead out the door, enjoying the way the full lips of your horsecunt press and rub against one either. You can even feel your clit inside its hood, though your excitement at this discovery is making the cherry-sized pleasure organ begin to swell outside of its quasi-organic encasement. If just thinking about it feels this good, how good must it feel to get fucked?");
	else output("You do! This horse body is fully functional and more than anatomically correct! Both sets of genitalia are there in full form, from weighty swaying balls to plush, wet lips. You can feel the former bouncing between your hind legs and the latter puffing up with excitement at the revelation, revealing a cherry-sized pleasure organ ripe for the touching. If just thinking about it feels this good, how good must centaur sex feel?");

	//MERGE
	output("\n\nWhen Holiday pushes you out the door, you stop to wiggle your ass in her direction, amazed at the astounding levels of sensation this suit is capable of. You’re barely aware of the presence of your real [pc.legOrLegs] at all. You’d probably wind up moving your horse legs instead if you tried to move them around. Not much point in it while they’re locked up in the suit anyway.");
	output("\n\nHoliday brazenly ");
	if(config != 2) output("grabs hold of your centaur sack and rolls the weighty orbs between her fingers");
	else output("caresses your folds and slips a finger in between.");
	output(" <i>“Holy shit, you’re such a fucking ");
	if(config == 2) output("mare slut. Twenty seconds in a centaur costume and you’re already leaking like a faucet. You’d better get a handle on yourself or you’ll wind up seeing just how much jizz a horsecunt can hold.");
	else if(config == 1) output("slutty stallion. Twenty seconds in a centaur costume and you’re already about to pop out of your sheath. Did you pick this one cause you know horses can get off just from slapping their cock into their belly? I bet you can’t even stop yourself from getting hard. Horny taur-[pc.boyGirl] like you’ll probably keep [pc.hisHer] cock on display until [pc.heShe] can find someone to take it, won’t you?");
	else output("hermy slut. Twenty seconds into wearing a centaur costume, and you’re already starting to leak. Hell, your cock’s gonna pop out of that sheath any second. I’d bet you couldn’t go more than a block without fucking someone, but nobody would ever bet against that.");
	output(" Maybe we’ll bump into each other during the festivities, skanky " + pc.mf("stallion","slut") + ".”</i> She breaks away with another familiar caress to your muscular rump, then vanishes back into her shop. The lights go out a moment later.");

	processTime(4);
	clearMenu();
	addButton(0,"Next",taurStreetAdventure,config);
}

public function taurStreetAdventure(config:int = 1):void
{
	clearOutput();
	showName("OUT ON\nTHE TOWN");
	output("The worst part is how right her assessment is. Now that you’re out in the open, prancing down a street, you can’t deny your own mounting arousal.");
	if(pc.hasCock())
	{
		output(" Fuck, your [pc.cocks] should be straining against ");
		if(pc.cockTotal() == 1) output("its");
		else output("their");
		output(" confinement");
	}
	else if(pc.hasVagina())
	{
		output(" Fuck, your [pc.vaginas] should be weeping ");
		if(pc.totalVaginas() > 1) output("their");
		else output("its");
		output(" own lubricating desire into the equine chassis");
	}
	output(" by now, but the feelings emanating from your ");
	if(config == 3) output("hardening horse-cock and increasingly wet horse-pussy");
	else if(config == 1) output("hardening horse-cock");
	else output("increasingly wet horse-pussy");
	output(" overwhelm the ghostly sensation from your half-forgotten crotch.");
	output(" The stares don’t help either. Everywhere you go, there are eyes on you, admiring your costume and your body, probing your horsey crotch with inquisitive stares, wondering just how real your simulated equipment would feel. You have a hunch it would feel very, very real.");

	pc.lust(50);
	//Horsecock!
	if(config == 1)
	{
		output("\n\nThe first indication that you might be in trouble is the feeling of cool air against the flare of your artificial erection. Now that it’s got your attention, you can feel every inch of engorging equine meat filling with blood and surging forth from its protective pocket. The soft lining stroking against your veiny length on its way past only enhances the speed of your erection. In no time flat, your prick is hanging out below your belly, arcing downward in a slight concession to gravity. You shift nervously, wondering if you should head back to your ship for a little relief before you rejoin the festivities.");
		output("\n\nThere are so many eyes on you. Girls and boys alike are staring at the centaur " + pc.mf("stud","slut") + " with [pc.hisHer] cock hanging out. You see more than one costumed woman point you out to a friend and lick her lips. Sweat breaks out on your brow, and you prance nervously in place, feeling your member grow still fuller, lifting until it nearly presses against your belly. Masturbation won’t do, you realize. A cock this hard needs to fuck someone. The cum surging in your balls needs to fill a heated womb.");
		output("\n\nA winking rahn lowers her top and flashes her tits at you, and your dick slaps into your belly loudly enough to get the attention of a few dozen more party-goers. You nearly swoon, amazed at the feeling of your hot animal-pre hanging from your belly. Thick strands of the stuff hang from a widening flare, trailing behind you on the pavement like slime from a slug. Your nostrils flare. There are so many females here who could be <i>bred</i>. They might have to bend over a chair or a table in order to properly offer you their wombs, but that’s such a trifling concern.");
		output("\n\nYour ship forgotten, you clop through the throng of onlookers and toward the sounds of a raucous party. Surely the girls there will be more ready to accept the gift between your legs, unlike the teasing rahn who has already hidden her sweater puppies away beneath her costume’s top.");
	}
	//Horsecunt
	else if(config == 2)
	{
		output("\n\nThe first indication that you might be in trouble is the realization that you can feel every cool breeze against your inky cunt’s entrance. It’s more than a little distracting and only grows worse when your clit emerges from its hood. Every step rubs a hugely swollen lip across the too-pleasant organ, reminding you of how good it would feel to have a cock sawing back and forth through your passage and a pair of powerful hips slamming into your own. You start dripping as soon as the thought makes its way through your mind.");
		output("\n\nAt first, your excessive lubricants drizzle out in a gentle pitter patter. Then you see the onlookers’ eyes. Boys are checking you out and adjusting bulges barely contained by sexy outfits. Girls glance at you and lick their lips. Some of them rub at meaty bulges as well, far less concerned with being seen than their exclusively male or female counterparts. The attention washes through your overheated snatch like a lover’s breath, and in no time flat, thick strands of your juicy horse-cum are dangling from your mare-cunt, sliming the pavement behind you.");
		output("\n\nThoughts of worry are but candles in the full-force gale of your lust, snuffed from your mind by the need for a passionate lover between your thighs. Boy or girl, it doesn’t matter. So long as one of them gives you the rutting you deserve. If not, you can always pin them down with your weighty equine ass, and make you service your slobbering cunny. Just the thought of forcing a kui-tan male against the wall and making him drain every ounce of his virile seed into your womb has you breaking out in a sweat.");
		output("\n\nYou nearly lose it when as beefy-looking ausar in green body paint tugs down his purple shorts to show off a boner big enough to match his muscular frame. He smirks when a gush of girlcum splatters off the ground behind you and puts it away. Fucking tease. You need someone willing to fuck you - or at the very least give you an enthusiastic fisting. Maybe if you go into the bar across the street, you’ll be able to find a suitable partner. The idea of letting Holiday know exactly how much cum your new cunt can hold seems far more appealing than it did a few minutes ago.");
	}
	//Horsecunt and Horsecock
	else
	{
		output("\n\nThe first indication that you might be in trouble is the feeling of cool air against the flare of your artificial erection, now exposed just beyond the edge of your sheath. With that realization comes the knowledge that you can also feel every breeze against your rapidly moistening cuntlips. Sure, they were already wet, but you can feel beads of moisture trickling down them. That sensation feeds right back into your cock, the thought of a wet pussy forcing heartbeat after heartbeat worth of new blood into your swelling erection.");
		output("\n\n");
		if(pc.hasCock()) output("Did getting an erection ever feel this good with your old [pc.cocksNounSimple]?");
		else output("Does getting an erection always feel like this?");
		output(" The surging cockflesh drags its way out of a sheath that suddenly feels almost too tight. The soft interior skin grips your expanding shaft in a velvety caress, one that is agonizingly dragged across every inch of horse dong as it is revealed to the open air - and the other partygoers.");
		output("\n\nDozens of curious onlookers are watching you, admiring your costume, and discovering the show that’s happening just between your hindlegs. Their eyes are like tongues around the rim of your flare, like fingers probing your hungry inner folds. You prance in place while enduring the exquisite pleasure of your own erection, dripping so much girlcum from your plush, swollen quim that it sounds like a rainstorm has broken out behind you.");
		output("\n\nYou whine and immediately abandon the budding idea of returning to your ship to masturbate. There’s no way you could reach your equine organs, not even with a");
		if(pc.hasPerk("Mini")) output(" foot-and-a-half worth of");
		else if(pc.hasPerk("Hung")) output("n over-two-feet long");
		else output(" nearly two foot");
		output(" cock swaying underneath, bowing slightly under its own tremendous weightiness. Besides, it wouldn’t satisfy you like flooding some sexy slut’s womb or letting a brute give your pussy the hard fucking it craves. Maybe you could do both at once, or line a row of girls up underneath you and see how many you can hit with one ejaculation. You’re pretty confident your body could paint all of them.");
		output("\n\nYou’re startled from your lusty reverie by the feeling of your flaring horse-cock slapping into your belly. The impact is loud enough to draw the attention of every sapient in a thirty foot radius. Breaking out in a sweat, you try not to do it again. It felt way too good, like the hard impact of your hips on a mare’s backside. Once you got going, you wouldn’t be able to stop, and the last thing you want to do is waste your seed on a street corner. Although... surely someone would come take advantage of you. Perhaps that virile looking ausar in the green paint and purple shorts would try to knot you.");
		output("\n\nIt’d never work, of course. Your pussy is far too sloppy with lubricant’s and far too elastic for a bitch-breeder like that to lock itself inside. You bet dragging it out would feel magnificent.");
		output("\n\nOh shit, he’s flashing it at you! It really does look good, but so does the big-breasted rahn over that way. While you’re drooling over them from both ends, they both giggle and wander back into the crowd, forgetting the easily teased centaur.");
		output("\n\nIf you’re going to do some quality breeding, you ought to head somewhere where real fucking is happening. All this lewd behavior in the streets is little more than foreplay. You can hear quite a few moans and cheers from a nearby bar. There’s sure to be a few bar skanks ready to service you and a line of eager boys (or herms) aching for a shot at your sopping-wet cunt.");
	}
	processTime(10);
	clearMenu();
	addButton(0,"Next",taurBarAdventures,config);
}

public function taurBarAdventures(config:int = 1):void
{
	clearOutput();
	showName("\nTHE BAR");
	output("The door slides open with a groan and a hiss, a sad, sick parody of the snappy behavior of the entrance to your own ship. Inside is a whole different world. Brilliant holographic light spills across neon-rimmed tabletops while projections of dancers prance above like glowing party gods. Smoke hangs heavy in the air, lending a diffuse, ethereal quality to the atmosphere even as it stings your nostrils and inflames your passions.");
	output("\n\nNo less than three couples are fucking to the thumping beat of the bass-heavy music, breeding upright with smooth sways of their hips and sloppily entwined tongues. Globules of sweat and seed lend the metallic floor a perverse shine and the smoky air a libidinous tone. Bar-girls with nothing more than star-shaped stickers on their numerous nipples pass drinks to waiters and waitresses alike, all clothed in tight leather bottoms and mesh shirts. One of them, a herm with pendulous, unsupported breasts, is milking her dick into a smiling client’s drink. Your flaring nostrils drink in the faint aroma of cinnamon.");
	output("\n\nHow ripe this place is for <i>breeding</i>! So many ");
	if(config == 3) output("virile males and fertile females");
	else if(config == 2) output("virile males");
	else output("fertile females");
	output(", all so open and free with their bodies. Their costumes may as well be paint, so much of their forms are exposed. A quick glance reveals dozens of ");
	if(config != 2) output("unprotected, moist slits, a smorgasbord of cunt awaiting impregnation");
	else output("dozens of gift-wrapped, bulging dicks, a smorgasbord of cock waiting for your decision");
	output(". You push your way through the crowd to the bar. All the dripping you’ve been doing has you parched, and you need refreshments before you show these people what a centaur can do.");
	output("\n\nThe thought that you’re not really a centaur, just a [pc.race] in a costume doesn’t even come to mind, ");
	if(config != 2) output("not when your bulging balls feel like they’re flooding with fresh, thick cum.");
	else output("not when your cunt is promising you the world in exchange for a little penetration.");

	output("\n\nYou order a drink without really paying much attention. Whatever the cutie behind the bar brings you, it’s strong enough to make your head swim and the colors at the edge of your vision bleed apart into miniature rainbows. You slam the transparent aluminum cup down once you finish and wish it made the more satisfying clink a glass vessel would produce.");
	pc.lust(50);
	processTime(6);
	clearMenu();
	//TRANSFORMSHIT HERE
	taurTFs(config);
	//FORK DIS SHIT.
	if(config == 1) 
	{
		output("\n\nNow, are you going to get some breeding done or submissively wait for a woman to take interest?")
		clearMenu();
		addButton(0,"Breed",taurDickSexScene);
		addButton(1,"S.Wait",centaurShitFromAlkahest);
	}
	else if(config == 2) addButton(0,"Next",femaleTaurLadySex);
	else
	{
		output("\n\nSo many choices... <b>Which of your genitalia would you like to use more?</b>");
		addButton(0,"Your Penis",taurDickSexScene);
		addButton(1,"Your Vagina",femaleTaurLadySex);
	}
}

public function taurTFs(arg:int = 1):void
{
	//Strip mimbranes.
	removeMimbranes();
	//1 - dude, 2 chick, 3 herm
	//Get rid of all vagooz and oldcocks	
	pc.removeCocks();
	pc.removeVaginas();
	pc.removeStatusEffect("Genital Slit");
	pc.removeStatusEffect("Uniball");
	pc.balls = 0;
	pc.ballSizeRaw = 3.4;
	//Tallness boost to 6’ if below.
	if(pc.tallness < 72) pc.tallness = 72;
	//Taurbody, ofcourse.
	pc.legType = GLOBAL.TYPE_EQUINE;
	pc.legCount = 4;
	pc.clearLegFlags();
	pc.addLegFlag(GLOBAL.FLAG_FURRED);
	pc.addLegFlag(GLOBAL.FLAG_HOOVES);
	pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
	pc.genitalSpot = 2;
	//Libido to 70 or plus a minimum of 10.
	if(70-pc.libido() < 10) pc.libido(10);
	else pc.libido(70,true);
	//All tails gone.
	if(pc.hasTailCock() || pc.hasTailCunt())
	{
		pc.tailGenital = 0;
		pc.tailGenitalArg = 0;
		pc.tailGenitalColor = "";
		flags["CUNT_TAIL_PREGNANT_TIMER"] = undefined;
		flags["DAYS_SINCE_FED_CUNT_TAIL"] = undefined;
	}
	pc.tailCount = 1;
	pc.tailType = GLOBAL.TYPE_EQUINE;
	pc.clearTailFlags();
	pc.addTailFlag(GLOBAL.FLAG_LONG);
	if(arg == 1 || arg == 3)
	{
		//22”</i> horsecock.
		pc.createCock();
		pc.cocks[0].cLengthRaw = 22;
		pc.cocks[0].cType = GLOBAL.TYPE_EQUINE;
		pc.cocks[0].addFlag(GLOBAL.FLAG_FLARED);
		pc.cocks[0].addFlag(GLOBAL.FLAG_BLUNT);
		pc.cocks[0].addFlag(GLOBAL.FLAG_SHEATHED);
		pc.cocks[0].cockColor = "pink";
		//orange-sized balls.
		pc.balls = 2;
		pc.ballSizeRaw = 13;
		// Perks!
		if(pc.hasPerk("Mini")) pc.cocks[0].cLengthRaw -= 4;
		if(pc.hasPerk("Hung")) pc.cocks[0].cLengthRaw += 8;
		if(pc.hasPerk("Bulgy")) pc.ballSizeRaw += 5;
	}
	if(arg == 2 || arg == 3)
	{
		pc.createVagina();
		pc.vaginas[0].wetnessRaw = 4;
		pc.vaginas[0].loosenessRaw = 1;
		pc.vaginas[0].vaginaColor = "black";
		pc.vaginas[0].hymen = false;
		pc.vaginas[0].bonusCapacity = 50;
		pc.vaginas[0].clits = 1;
		pc.vaginas[0].type = GLOBAL.TYPE_EQUINE;
		pc.clitLength = 1;
		// Perks!
		if(pc.hasPerk("Hung")) pc.clitLength++;
	}
}

public function femaleTaurLadySex():void
{
	clearOutput();
	showDane(true);
	output("<i>“Holy shit... is that you, [pc.name]?”</i> calls a familiar-sounding voice.");
	output("\n\nYou turn suddenly alarmed to see the familiar, four-armed figure of your cousin’s guard dog, Dane. Instead of glowing armor and weapons, he’s wrapped in dozens of glowing bands. The ones on his biceps look like they’d snap off if his mighty muscle bothered to flex. A purple-glowing rope holds a black panel of silk across his groin and an identical weave over his ass, barely protecting his modesty. If the breeze blew the wrong way, you’d be able to see his dick snaking out of his sheath.");
	output("\n\nYou yank your gaze up to the grinning ausar’s face, unsure if you should run. <i>“Dane?! What are you doing here?”</i>");
	output("\n\n<i>“Partying. What’s it look like? Your cousin may be a hard-ass, but even [rival.heShe] has to play by union rules. All work and no play makes Dane a dull boy.”</i> He winks under an eye-covering black mask. Not much of a concealing costume, but in retrospect, neither is your own. ‘Naked centaur’ wouldn’t win many points in the informant protection program. Dane slaps your haunches, startling you from your reverie. <i>“Damn, that’s real isn’t it?”</i> His nostrils flare, and he peers around to eyeball your drooling horse pussy. <i>“It’s a... a good look on you.”</i> His tongue lolls out happily.");
	output("\n\nYou start to explain that it <i>isn’t</i> real. It’s just a costume, but his obvious admiration brings a blush to your cheeks, soothing away your arguments with the warm pleasure of being <i>wanted</i>. <i>“");
	if(pc.isBimbo()) output("Like, t");
	else output("Thanks");
	output(",”</i> you coo, shuffling your thighs to grind your plump pussylips together. The clip-clop of your rearward hooves does a good job of disguising the sound of a fresh gush of bubbling mare broth splattering off the floor. You may have fought him in the past, but there’s no denying the sheer masculinity of the ausar mercenary");
	if(flags["WHUPPED_DANES_ASS_ON_MHENGA"] == undefined) output(", and you won’t soon forget the feeling of his many-knotted cock surging through you");
	output(". He would be a strong stud, surely capable of scratching the itch inside you.");

	output("\n\n<i>“You okay?”</i> The muscled merc looks at you with concern, the twisting undulations beneath his loincloth stilling. <i>“You look hot.”</i> Dane scratches behind his head nervously with one hand and presses the back of another against your forehead. <i>“I mean feverish. Do you need to hit a medical tent? I think I’m out of a job if you kick the bucket.”</i>");
	output("\n\nHow touching, literally and figuratively! He’s worried about you. You lean against him, nearly bowling him over with the additional weight of your new hindquarters. He catches himself on the edge of the bar and wraps two glowing arms around you, one looped about your waist and the other beneath your armpit, holding you aloft. The tips of his fingers are so close to ");
	if(pc.biggestTitSize() >= 1) output("pressing on your [pc.chest]");
	else output("touching your [pc.nipples]");
	output(" that ");
	if(pc.biggestTitSize() >= 1) output("your [pc.nipples]");
	else output("they");
	output(" glow with eager pleasure, delirious with the desire to be touched.");

	output("\n\nYou lick lips that suddenly feel dry and empty, looking back at Dane with a smile. <i>“I’m okay... better than okay, really.”</i> Hormones too potent for any sapient flood your brain with visions of you on the floor, all four legs splayed while Dane humps away at your cum-splattered hindquarters. You lean up to one of his ears and whisper, <i>“I just need to be fucked is all.”</i> Squeezing his crotch, you giggle when his member squirms and thickens against your fingers, distending the shimmery fabric. <i>“");
	if(flags["WHUPPED_DANES_ASS_ON_MHENGA"] == undefined) output("In my pussy this time.");
	else output("I forgot to prepare my ass, but my pussy is ready.");
	output("”</i>");
	output("\n\nDane’s ears twitch. <i>“You sure?”</i>");
	output("\n\nYou turn around and shift your equine hips, pinning him between the bar and haunches, forcing him to feel the broiling heat pouring out of your babymaker. The feeble bit of fabric dividing your bodies insulates him about as well an oven mitt in a volcano, allowing your lurid juices to spill across the rapidly engorging hybrid dick beneath. Inch after inch of turgid erection pours forth, the bulges along his length rubbing past your puffy lips like a knotted rope.");
	output("\n\n<i>“So long...”</i> you whimper.");
	output("\n\nPushing you away, Dane grunts in irritation. <i>“Are you always this brazen? You could have saved us both a bunch of time, back on Mhen’ga...?”</i> He looks around, noting two girls beside you already scissoring and grinding, feeding each other drinks. <i>“Screw it. When in Terran space, do as the Terrans do.”</i>");
	processTime(33);
	pc.lust(200);
	//[Next]
	clearMenu();
	addButton(0,"Next",ladyTaursFuckDane);
}

public function ladyTaursFuckDane():void
{
	clearOutput();
	showName("DANE\n& HOLIDAY");
	showBust("DANE_NUDE","HOLIDAY_HORSE");
	output("That sounds like consent to you. You wiggle your rump, smearing long lines of glistering horse-lube across the loincloth dividing you and the four-armed ausar, marinating his wriggling phallus in slippery pheromones. A big boy like him is going to need lots of lube to help carry all his sperm into your womb. Your achingly empty crevasse clenches, hollow and needy. Grinding harder against him, you pin Dane between a rock and a wet place.");
	output("\n\nFour powerful hands press back against your straining haunches, shifting your bulk enough to give the musclebound merc some breathing room - breathing room he’s all too happy to spend yanking the silk curtain from between your bodies. The slimy garment lands on a cheering human’s head, momentarily muffling her jubilation, but you pay it no mind. Without the condom-tight fabric stretched between Dane’s cock and your gushing nethers, his phallus is free to plunge into your waiting gates, spearing through the entrance with the force of a striking snake.");
	//CuntChange
	pc.cuntChange(0,chars["DANE"].cockVolume(0));

	output("\n\nIt feels like a normal ausar cock at first. The tapered tip lets it slide with ease, quickly broadening into a sturdy base, the kind you’d imagine could lift your hind legs off the ground with a single frenzied hump, and that’s only the beginning. Dane’s knot, the anchor of his pillar of cock, stretches you wide open. It’s pleasant, really. Your body is built to be stuffed with bigger dicks than this, so the swollen lump in the base is nothing more than erotic bonus.");
	output("\n\nAll things considered, it’s a pretty good start to your evening.");
	output("\n\nThe knot pushes deeper. Your eyes widen in surprise as the bulb burrows into your passage, leaving your lips hanging cutely agape behind. There’s no time to puzzle over this most recent development, not when Dane is spooling near-equine lengths of prick into your quim. Another knot pushes in, and your legs tremble, making your hooves slip and slide in in the puddle you’ve made below. Your alien partner holds you upright, keeping you from spilling entirely to the ground. He literally saves your ass, if only so that he can hold his hips against it and continue to deep-dick you.");
	output("\n\nSomewhat cowed by his display of might and control, you kneel down on your forelegs, ceding Dane the authority to use your body as he will, allowing you to focus on the way he’s slowly but steadily filling your cunt. His dick seems endless, revealing more and more knot-like bulges with each passing minute. You look back at him, delirious with pleasure, squeezing down on the wiggling, hybrid cock until the pleasure inflates every orb along the length of his phallus. They open you wider than two rutting pony-boys ever could.");
	output("\n\nDane slaps your ass, keeping ahold of you with his other three hands. <i>“You got a tight cunt for a taur-[pc.boyGirl], you know?”</i> He yanks back, dragging dozens of spherical protrusions against misfiring nerves, then slowly pushes back in. <i>“A guy could get used to this.”</i>");
	output("\n\n<i>“Room for one more?”</i> a high-pitched, mischievous voice calls over the debauched din.");
	output("\n\nYou blink tears of pleasure from your eyes and suck your tongue back into your mouth.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG) && pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output(" It was wetly lapping at one of your [pc.nipples].");
	output(" When did that start? You catch a flash of pink before something heavy, wet, and fragrant slaps onto your face, thick enough to blot out the sight of the newcomer.");

	output("\n\nIt’s a cock. If the smooth skin and veiny ribs didn’t give it away, there’d be no mistaking it. It <i>smells</i> like cock, and not just any cock: a horse-cock. Its heady pheromones fill your nose with their musk and your brain with barnyard romps, the perfect compliment to the sharp scent your cunny is doing its best to flood the bar with.");
	output("\n\nDane grunts something, but you don’t care. Your back half isn’t what’s being discussed here. It’s your mouth, and you’ll decide what goes in it. Or you would if you hadn’t have already swallowed the head. In retrospect, sucking this cock was a pretty great idea. It gives your mouth something to do while your quim is being bred. The taste on your tongue just makes the blaze in your cunt that much hotter, and it gives you the chance to see just who owns this lovely sausage.");
	output("\n\nHoliday waves down. <i>“I’m glad I found you! I tried to dress for the occasion, but this shit won’t stop getting hard, and nobody else had the balls to stretch out their jaw and give it a go.”</i>");
	output("\n\nThe demon nurse from earlier... it’s her fault... her fault you can’t stop thinking about cum in your cunny, spunk pooling between your splayed hind legs, having such a swollen middle that it’s difficult to walk... You shake off the thought of milk spilling down tits, swollen by newfound motherhood, and scowl around her dick. You don’t take it out - perish the thought. With your hands cupping balls a bit too big for the nurse’s slight frame, you give her a scathing rebuke with nothing but your eyes.");
	output("\n\nYou try to, anyhow. It comes out as more of a petulant pout, and the taste of unlicked flesh on your tongue pulls you down Holiday’s length until you’re nearly gagging yourself with your thirst for her dick. You have to close your eyes to focus on handling the monstrous member. It’s too perfect to be mad at really. You keep it warm with your lips while Dane begins to ejaculate against the wall of your cervix, spreading gooey ropes over the entrance to your womb until the whole thing has been thoroughly painted.");
	output("\n\nYou cum, of course. Every lance of hot spunk is the fulfillment of your life’s purpose. It’s the penultimate meaning of the universe, boiled down to two sweaty bodies trading fluids. You might consider it poetic if you weren’t busy using your moans to turn your throat into Holiday’s personal vibrator. If you could think straight. If your mind could process the needs being broadcast on every thought-frequency by your gushy vagina.");
	output("\n\nHoliday doesn’t cum in your throat either. She tastefully saves her load for your cunt. What a peach! You lick Dane clean while she takes her turn, adding her own spunk to what you intend to turn into a melange of breeding juice. It gets a little fuzzy after that, but you’re pretty sure that you get a cock in every hole and every hand at least once.");
	output("\n\nMaybe twice?");
	processTime(66);
	for(var x:int = 0; x < 41; x++)
	{
		pc.orgasm();
	}
	//Kiro used for volume~
	pc.loadInCunt(chars["DANE"], 0);
	pc.loadInCunt(chars["KIRO"], 0);
	pc.loadInCunt(chars["KIRO"], 0);
	pc.loadInCunt(chars["KIRO"], 0);
	pc.loadInCunt(chars["KIRO"], 0);
	pc.loadInMouth(chars["DANE"]);
	pc.loadInMouth(chars["KIRO"]);
	pc.loadInMouth(chars["KIRO"]);
	pc.exhibitionism(2);
	pc.exhibitionism(2);
	pc.exhibitionism(2);
	clearMenu();
	addButton(0,"Next",femTaurCostumeEpilogue);
}

//Epilogue Female
public function femTaurCostumeEpilogue():void
{
	clearOutput();
	showName("MORNING\nAFTER");
	output("You wake up with a pounding headache back on your ship, and out in space. You don’t remember anything about taking off - letting Holiday ride your back and slap your ass while Dane has you up against the wall? Sure, but nothing about the trip back to your ship. Heck, you’re even pretty sure a white-furred ausar lass had a scoreboard to keep track of how many creampies you got. You came harder than ever, but you’re feeling pretty sore now.");
	output("\n\nIt isn’t until you check your ship’s logs that you stumble upon some clarity. There’s a new message, one you didn’t put in there. You hit play, bringing it up on the main screen. A cute, white-furred kaithrit pops up on screen, waving nervously.");
	output("\n\n<i>“Hey, I don’t know what you were on about when you said that the whole centaur thing was just a costume. I mean... damn, you must have been slipped something at the bar. It’s pretty obvious you got some high-quality mods to produce that piece of work.”</i> He chuckles and looks behind himself at your slumbering form. <i>“You might not remember me from the party. It was pretty fun - you can fuck like a goddamn freighter, by the way - but shit got real there at the end.”</i>");
	output("\n\nThe kaithrit rubs his distended crotch and sighs. <i>“You were super out of it by the time the cops busted up the party. You should’ve seen the gear those peacekeepers were fitted with. They looked more like soldiers than officers of the law. From what I heard while me and that pink-haired girl were dragging you out the back, they were looking for some thief that made off with a bunch of symbiosis tech. Crazy shit, right?”</i> He tucks his hair behind a flicking cat ear and smiles.");
	output("\n\n<i>“Lucky for you, I work in customs. Between me and your friend, Christmas or Halloday or whatever she called herself, we got you back to your ship, and I’ll be sending you off world in a minute. On the off chance that... well... I can’t have my baby born in a jail cell, can I?”</i> The kaithrit nervously fidgets. <i>“Oh, and your friend says she stashed your stuff in the compartments under your bunk. Uhmm... goodbye, in case I don’t see you again, you sexy centaur, you.”</i>");
	output("\n\nBlushing one last time, the cat-boy cuts off the recording, leaving you alone with your thoughts.");
	output("\n\nWait! <b>You’re still wearing the costume...</b>");
	processTime(500);
	//[Next]
	clearMenu();
	addButton(0,"Next",finalLadyTaurCostumeEpilogue);
}

public function finalLadyTaurCostumeEpilogue():void
{
	clearOutput();
	showName("SHIP\nINTERIOR");
	output("No matter how hard you search, you can’t find a single catch or release. Worse still, attempts to peel away the border between your top and bottom half hurts. You can’t even feel your old lower half anymore - just the four, hoof-capped limbs below. It’s as if that equine shape has become a part of you for good. Is that what the peacekeepers meant by symbiosis tech? Are you a centaur forever?");
	output("\n\nWell, at least you’ll be well-equipped for riding now. You doubt any sapient this side of the spiral arm would be too big for you, and better still, ");
	if(flags["RESCUE KIRO FROM BLUEBALLS"] == 1) output("your cunt can probably keep up with Kiro now. Just the thought of taking her bitch-breaker of a dick has your pussy on a slow boil.");
	else output("your cunt can squeeze down even tighter on littler dicks. Every little drop counts when you’re questing to fill up the nursery you inherited.");
	output(" Something seems off about those thoughts, but you’re hard pressed to pin it down when your pussy is so puffy and sensitive.");
	output("\n\n<b>Looks like you’re a horny");
	if(!pc.hasCock()) output(", biologically female");
	output(" centaur now.</b>");
	pc.lust(50);
	halloweenShipMove();
	flags["TAURFUCKED_DANE"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//MALE!
public function taurDickSexScene():void
{
	clearOutput();
	showName("LEITHAN\nTWINS");
	output("<i>“Hey there,”</i> ");
	if(CodexManager.entryUnlocked("Leithans")) output("a six-legged vision of lace and curves");
	else output("a curvy leithan draped in white lace");
	output(" starts.");
	output("\n\n<i>“Cutie,”</i> an identical creature in black spandex finishes.");
	output("\n\nYou answer, <i>“");
	if(pc.isBimbo()) output("Like, h");
	else output("H");
	output("ey yourself,”</i> with a bit more leer than you intended. <i>“Nice costumes.”</i>");

	output("\n\n<i>“Thanks,”</i> the white-draped sister answers, running a hand down your back until she’s stroking your equine fur. Her nails are nicely manicured, and scratch an itch you didn’t even know you had.");

	output("\n\nPulsing golden light spills from gaps in the black spandex as the other sidles up to your other side, a lizard-like tail lifting the coarse strands of your own and curling around your muscly ass. <i>“I’ve never seen a leithan like you, with only four legs.”</i>");
	output("\n\n<i>“It’s exotic,”</i> the other purrs into your ear, stroking your [pc.chest] with her other hand.");
	//Unlock leithan codex!
	CodexManager.unlockEntry("Leithans");
	output("\n\nYou didn’t notice at first, but these two smell sort of nice, better than most other pieces of tail in this place. Your cock thickens eagerly and slaps against your belly in approval of these two mares. This body is more than prepared enough to impregnate these two mares, with a little left over to drench their faces and mark them as your own.");
	output("\n\nThe lacy lady stops petting you in order to wrap both arms around your torso, sliding them up and down your abdomen and chest. Her own markings pulse brighter as her cheek nuzzles against you, and the pleasant aroma redoubles. <i>“You seem...”</i>");
	output("\n\n<i>“... nice,”</i> the shrink-wrapped taur-girl exhales. She twists her humanoid half to be underneath your arm, then jerks in alarm, flicking her eyes at her sister. <i>“Are we...”</i>");
	output("\n\n<i>“... going into heat?”</i> Both pause, considering, seemingly unaware that they’re pressing more and more of their bodies against you, smothering you in their nubile embraces. <i>“Yes... I think so.”</i> They share another meaningful look while a reptilian tail snakes between your hind legs to fondle your swollen balls.");
	output("\n\n<i>“We weren’t supposed to for months!”</i> they whine in unison.");
	output("\n\nYou wrap your arms around their shoulders and accidentally settle your palms against their breasts, letting your fingers wrap around the soft titflesh in a brazen assertion of intent.");
	output("\n\n<i>“We should introduce ourselves,”</i> one of the leithans lustily pants.");
	output("\n\n<i>“I’m Ma’andi.”</i> The one in the spandex explains before kissing your cheek. <i>“You smell better than a leithan...”</i>");
	output("\n\nHer sister, peeling some of the lacy frippery out of the way of your nipple-diddling fingertips. <i>“And I’m Sa’andi.”</i> She licks the underside of your ear and shivers.");
	output("\n\n<i>“We’re clutchmates,”</i> they say in unison, <i>“Sorry about the pheromones.”</i>");
	output("\n\nYou take a deep sniff. How couldn’t you? It’s just like the time you were told not to think about a pink");
	if(CodexManager.entryUnlocked("Varmints")) output(" varmint");
	else output(" elephant");
	output(", only this time, you’re inhaling air thick with drugged smoke and potent pheromones instead of imagining an oddly-colored animal. A rope of pre-cum surges out of your cock like a shot from a cannon, slapping into the side of the bar with a wet slap. The two glowing girls giggle, one making a sound between a purr and a chitter while stroking you seductively.");
	output("\n\n<i>“I hope you’re ready to be a father" + pc.mf("","-mommy") + ". We can fuck here, right?”</i> They look to a four-breasted bartender for an answer.");
	output("\n\n<i>“Of course. Drinks will be on me if you put on a good enough show.”</i> The bovine bar-wench squishes her quartette of tits together to show just what kind of drinks she plans to dispense.");
	output("\n\nMa’andi laughs airily, drunk on her own heat and who knows what else. Her tail caresses the underside of your turgid beast-cock. <i>“But which one of us gets to be a mommy first?”</i>");
	output("\n\nWhich one will have the honor of receiving your prime load?");
	processTime(10);
	pc.lust(200);
	clearMenu();
	//[Ma’andi] [Sa’andi]
	addButton(0,"Ma'andi",fuckLeithansAsTaur,"Ma'andi","Ma'andi","She's the one in the black spandex getup.");
	addButton(1,"Sa'andi",fuckLeithansAsTaur,"Sa'andi","Sa'andi","You'd prefer the sister in the lace.");
}

public function leithanSister(arg:String):String
{
	if(arg == "Ma'andi") return "Sa’andi";
	else return "Ma’andi";
}

//(Doesn’t matter which one you pick that much. They’re identical twins!)
public function fuckLeithansAsTaur(arg:String = "M"):void
{
	clearOutput();
	showName("LEITHAN\nSISTERS");
	output("<i>“");
	if(arg == "Ma'andi") output("Ma’andi");
	else output("Sa’andi");
	output(",”</i> you answer, letting go of your chosen mate and circling around behind her. " + leithanSister(arg) + " comes with you, petting your flanks encouragingly while her sister raises her ass up higher into the air, presenting a black-lipped treasure that drips liquid crystal. That crevice smells like ambrosia and winks with whorehouse promises. Bending low, you give it a lick, amazed by its indescribably sexual flavor and bombastic aroma. She’s juicier than an orange and twice as tasty, but if your cock gets any harder it could burst. You reluctantly pull away.");
	output("\n\n" + leithanSister(arg) + " circles around, pulling your tail away, if only to get her trembling hands on your musky, equine nutsack. She moans at the feeling of your heated orbs in her fingertips, bending low to lick the backside of your fragrant scrotum. In between slurps and slobbers she coos, <i>“Fuck my sister. Knock her up.”</i>");
	output("\n\nAs if you needed the encouragement. You’d rebuke her for her arrogance if she wasn’t doing such a lovely job of warming up your spunk, and if you weren’t so entranced by the deluge of pheromones pouring out of her sister’s cunt.");
	output("\n\nYou rear up and lunge forward on instinct, your unfamiliar body behaving as easily as if you had been born in it. The fat flare at the tip of your cock batters " + arg + "’s pussy wide open, spreading her puffy lips wide enough that they won’t soon forget your visit. Barreling on inside, you let the inexorable inertia of hundreds of pounds of horseflesh carry you forward, burying");
	if(pc.hasPerk("Mini")) output(" over a foot");
	else if(pc.hasPerk("Hung")) output(" over two feet");
	else output(" nearly two feet");
	output(" of horsecock into the mare’s wet and willing hole in an instant. Runnels of girl-cum and horse-pre dribble out of her split slit unchecked, slicking your hindlegs as thoroughly as hers.");
	pc.cockChange();
	output("\n\n" + leithanSister(arg) + " comes with you, mouth latched onto your balls, her chin drenched in her sister’s frothing cuntjuices. You can’t see her from this angle, but her tongue doesn’t stop or slow. Either leithans don’t mind semi-incestual intercourse or she’s too turned on by the taste of your nuts to care that she’s lapping up her sister’s lady-love.");
	output("\n\nYou wrap your arms around " + arg + "’s chest, grabbing her more than supple tits and giving them a hearty squeeze. Your fingers nearly disappear into the pliant tits, giving the bartender something to watch as you jiggle them about. " + arg + " groans in ecstasy while your hips pump on autopilot, savaging her backside with brutally powerful thrusts. A lesser creature would be split in half by the tumescent spear, but she wraps you up like a tailored glove, caressing every inch of throbbing hard fuckmeat with excited undulations.");
	output("\n\n" + arg + "’s pleasure doesn’t really factor in as one of your concerns. Placed alongside the throbbing ache in your balls, it’s little more than a mote of dust beside a mountain, but you’re aware of her climaxing all the same. How couldn’t you notice the waves of hot, wet girly goo arcing out from her haunches, painting your balls and her sister’s torso in a layer of gleaming, libidinous excess? Still, you hammer her quivering cunt just the same, rutting her hard. You nip at her neck and ears thoughtlessly, hands seizing powerfully around her torso to further immobilize her.");
	output("\n\nUnashamedly, the bartending bovine steals a kiss from your soon-to-be knocked up mare, frenching her a scant few inches away from you. Their twisting tongues and mashed together lips only inflame your passion, driving you to spear " + arg + " hard enough to jostle them apart. The blushing cow of a bartender kisses you by way of brief apology, but scampers off to mix some other patrons’ drinks a moment later. Maybe if she plays her cards right, you’ll give her a creampie after these two.");
	output("\n\n" + leithanSister(arg) + "’s fingers dig into your haunches, and she twists her head around your weighty globes to give her tongue a little time on your sheath. She bends still lower, dragging pouty lips across your sensitive sheath, catching the edge between her teeth and tugging on it. Your balls quake in her palms, churning and frothing, threatening to discharge their virile load on the spot. She releases you a second later, slapping your ass, spurring you to drive deeper into her sister, to split the gushing girl’s cervix wide and flood her womb with salty love.");
	output("\n\n" + arg + " blubbers and drools all over her tits, so lost in her own need for a thorough spunking that she can’t even bother to beg you for it. No matter. You tear her ");
	if(arg == "Sa'andi") output("lacy coverings");
	else output("spandex suit");
	output(" apart, baring her boobs to everyone in the bar. The bartender actually brings you a drink for that, holding it to your lips so that you can keep mauling her tits and fucking her at the same time. What an angel.");
	output("\n\nAll around you, people are pairing off, grabbing their neighbor’s oozy box or aching cock to trade a little stimulation. Whether it’s the sight alone or the soup of pheromones floating in the air that incites their libidos, they’re going at it all the same. Humans feed galotians. Rahn bang gryvain. Dogs are reaming cats - or at least, ausar are taking advantage of mewling kaithrit.");
	output("\n\nBegging you for your cum, " + arg + "’s cunt clamps down around your dick in the way that only a tauric creature can, massaging you with muscles powerful enough to snap a lesser creature in half. You give it exactly what it wants, thrusting hard into " + arg + ", driving yourself until you’re completely embedded, your flare expanding, surging with blood and need. Your balls clench, and your lightning bolts of bliss course from your crotch up your spine, launching starbursts of ecstasy into your brain.");
	output("\n\nYou can hear your potent ejaculations just as much as you can feel them, pumping what feels like gallons of perverse horsecum into your willing mate. Each wet squelch is encouragement for you to dump yet more inside her, a physical request for you to flood her womb with an extra dose of equine ejaculate.");
	output("\n\nGrabbing " + arg + " by the hair, you claim her lips for yourself, availing yourself of her moaning mouth, twining tongues with the first of what will undoubtedly be many mothers. You pump a final few thrusts into her creampied cunt, only daring to pull out when the sparks of pleasure have fizzled into a dull satisfaction.");
	output("\n\nA daring patron holds a mug beneath " + arg + "’s legs, gathering a cupful of mixed juices for her efforts, and you favor her with a wink, absentmindedly patting your well-fucked mate’s haunches. <i>“I’ll have some for you in a moment.”</i>");
	output("\n\n" + leithanSister(arg) + " lets your still-engorged balls escape her mouth with a pop. <i>“Not before me, I hope.”</i> She reaches past them to squeeze your sheath, making your horsey wiener jump back to full hardness, even while it continues to drool the leftovers of your last climax.");
	output("\n\nThat sounds about right. You knock back the next drink the bartender brings you, and prepare yourself to mount " + leithanSister(arg) + ". After squirting at least a quart of cum into " + arg + ", an indescribable pressure lifts from your mind, departing like a heavy weight. In its place, " + leithanSister(arg) + "’s heady pheromones flood in, augmented by something in the drink. The party won’t end for many hours, and your balls are built to last. You’re sure of it.");
	processTime(45);
	for(var x:int = 0; x < 21; x++)
	{
		pc.orgasm();
	}
	pc.exhibitionism(2);
	pc.exhibitionism(2);
	pc.exhibitionism(2);
	clearMenu();
	addButton(0,"Next",mailTaurCostumeEpilogue);
}

//Epilogue Male
public function mailTaurCostumeEpilogue():void
{
	clearOutput();
	showName("HOURS\nLATER...")
	output("Your memories of the night are an indistinct blur of fucking and drinking, sometimes simultaneously. Sa’andi and Ma’andi seemed insatiable at first, but after two or three cream fillings each, they settled right down, passed out in the corner like two drunken, six-legged angels.");
	output("\n\nMore disturbing is the fact that you woke up onboard your ship... and that you aren’t on the planet any longer. You don’t remember anything about setting out into space - rearing up on a table and letting a galotian squeeze your load out onto Holidays tits? Sure, but nothing about the trip back to your ship. Heck, you’re even pretty sure that Ma’andi snuck her tail up your ass while you were mounting some white-furred ausar lass.");
	pc.buttChange(250);
	output(" You came harder than ever, but you’re feeling pretty sore now.");
	output("\n\nIt isn’t until you check your ship’s logs that you stumble upon some clarity. There’s a new message, one you didn’t put in there. You hit play, bringing it up on the main screen. A cute, white-furred kaithrit pops up on screen, waving nervously.");
	output("\n\n<i>“Hey, I don’t know what you were on about when you said that the whole centaur thing was just a costume. I mean... damn, you must have been slipped something at the bar. It’s pretty obvious you got some high-quality mods to produce that piece of work.”</i> She chuckles and looks behind herself at your slumbering form. <i>“You might not remember me from the party. It was pretty fun - you can fuck like a goddamn freighter, by the way - but shit got real there at the end.”</i>");
	output("\n\nThe kaithrit rubs her belly and sighs. <i>“You were super out of it by the time the cops busted up the party. You should’ve seen the gear those peacekeepers were fitted with. They looked more like soldiers than officers of the law. From what I heard while me and that pink-haired girl were dragging you out the back, they were looking for some thief that made off with a bunch of symbiosis tech. Crazy shit, right?”</i> She tucks her hair behind a flicking cat ear and smiles.");
	output("\n\n<i>“Lucky for you, I work in customs. Between me and your friend, Christmas or Halloday or whatever she called herself, we got you back to your ship, and I’ll be sending you off world in a minute. On the off chance that... well... I can’t have my baby’s daddy rotting in a jail cell, can I?”</i> The kaithrit nervously rubs her belly. <i>“Oh, and your friend says she stashed your stuff in the compartments under your bunk. Uhmm... goodbye, in case I don’t see you again, you sexy centaur, you.”</i>");
	output("\n\nBlushing one last time, the cat-girl cuts off the recording, leaving you alone with your thoughts.");
	output("\n\nWait! <b>You’re still wearing the costume...</b>");
	processTime(450);
	clearMenu();
	addButton(0,"Next",maleTaurCostumeFinale);
}

public function maleTaurCostumeFinale():void
{
	clearOutput();
	output("No matter how hard you search, you can’t find a single catch or release. Worse still, attempts to peel away the border between your top and bottom half hurts. You can’t even feel your old lower half anymore - just the four, hoof-capped limbs below. It’s as if that equine shape has become a part of you for good. Is that what the peacekeepers meant by symbiosis tech? Are you a centaur forever?");
	output("\n\nWell, at least you’ll be well-equipped to mate with some mares");
	if(flags["MET_ELLIE"] != undefined) output(", like Ellie. She’s sure to be down for a quick filling..");
	output(". ");
	if(pc.isBro() || pc.isBimbo()) output("All things considered, that’s not far off from your normal thought processes.");
	else {
		output("Something seems a little off about that thought, but the mental image of ");
		if(flags["MET_ELLIE"] == undefined) output("those two sweet leithans dragging their pregnant bellies");
		else output("Ellie dragging her pregnant belly"); 
		output(" on the ground has your cock threatening to rear its flaring head all over again, and who are you gonna find to knock up in the cold void of space?");
	}
	output("\n\n<b>Looks like you’re a horny");
	if(!pc.hasVagina()) output(", male");
	output(" centaur now.</b>");
	pc.lust(50);
	halloweenShipMove();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function centaurShitFromAlkahest():void
{
	clearOutput();
	showName("THE\nBAR");
	author("Alkahest");
	output("You bite your lip as you trot over to the bar, hooves clacking on the tiles; your heavy, pulsing genitals sway back and forth, sending a pleasant tingling up your back with each jostle of your ponderous sack and prodigious pole. A meandering silvery trail of liquid arousal drools from you as you go. You shudder as you reach the bartop, your swinging equipment coming to a rest, gently throbbing and dripping your shimmering slime in a small pool beneath you. A busty blonde waitress approaches from back of the bar, you ogle her oversized tits straining a tight white t-shirt, your cock seeming to throb even harder if it were possible. She looks you up and down, her eyes resting on your meaty cock for more than a few uncomfortable seconds before pinching one of her turgid nipples, winking seductively and sauntering off to the other side of the bar.");
	output("\n\nYou yelp in surprise as one of the more adventurous woman saunters up behind you and gropes your swaying testicles, drunkenly tugging and rolling the pliant flesh in her hands. A slimy glob of pre-come pours from the flared tip of your throbbing horsecock. With alcohol fueled courage, more and more drunken women of various species approach your backside and appreciatively fondle your aching cock and balls, tugging on your leathery sack and pulling your");
	if(!pc.hasPerk("Mini")) output(" enormous");
	output(" phallus only to release it and watch it ponderously sway back and forth as they giggle at your impotent attempts to contain your arousal and cease their ministrations.");
	output("\n\nYou hear a click and a flash of light illuminates the wall in front of you. Twisting your torso you see one of the ladies torturing your engorged genitals levelling a holocam at your crotch. Your face heats up with embarrassment as the rest of the group strikes a pose with your cock and balls, their lips and tongues questing all over your");
	if(!pc.hasPerk("Mini")) output(" prodigious bulk");
	else output(" equine member");
	output(". Another click and another flash captures your arousal for the extranet to enjoy and the women disperse, giggling and drunkenly weaving their way away from you.");
	output("\n\nYour cock throbs with a dull ache, your foreleg nervously stamping into your pooling pre-cum, splashing the musky goo about. Your eyes quest around the bar for someone to help you with your problem. However, you don’t spy anyone free, everyone else seems to be busy sucking and fucking their own partners. Turning your attention back towards your overwhelming arousal, you moan as you feel your sensitive cock bob up and down, and you stamp your hooves in frustration, your swollen, seed-filled sack jostling and tingling with need. You gasp as your thick horse-cock lightly slaps against the underside of your belly, sending a pleasurable jolt along your spine. You look around in apprehension before discretely thrusting your hips harder and with erotic purpose. Your cock smacks your stomach and you nearly pass out at the sensation of your massive pole overwhelming your senses with pleasure.");
	output("\n\nYou whine and trot in place, thinking of your situation before you sigh and give into your bestial needs. You begin to rhythmically roll your hips, your");
	if(!pc.hasPerk("Mini")) output(" big");
	output(" horsecock flopping around before you find the right rhythm and your cock begins smacking into the underside of your belly. Your huge, heavy nuts tug at your groin with each thrust of your equine backside, and you lick your lips as you feel them churn with their pent up load. You see other bar patrons discreetly and not so discreetly watching you.");
	output("\n\nYou buck your hips harder and harder, your");
	if(!pc.hasPerk("Mini")) output(" massive");
	output(" horsedong bouncing madly and throwing shining ribbons of equine pre in a wide arc before you. Your weighty orbs smack into your haunches with each undulation of your wide backside and tug at your crotch, firing a twinge of pleasure through your body before your cock makes its impact, washing over the eddy of ardor with a wave of sensation. You stroke your furry back and moan as you feel your pleasure mounting higher and higher. You fantasize about countless women, and even some men being mounted by your huge bouncing cock. You can almost feel their ministrations on your thick length before you throw open your eyes and let out a whinny of pleasure.");
	output("\n\nYour big, heavy nuts tense up, and your cock bucks and pulses as a massive load of equine cum flows up your prodigious length and rockets from your flared tip, splattering into the smooth metal of the bar in front of you. Gout after gout of thick horse seed flies from your dick, painting the scene a rich and creamy white. Your forelegs buckle with pleasure and you collapse into your pool of cum, your cock still firing and painting your belly with your liquid ardor. Your whole body tingles as you feel your cock sliding backwards along the floor and back into your sheathe, your deflated balls laying in a lake of your seed. You look up exhaustedly to see the barmaid staring at you exasperatedly, handing you a mop and bucket. You blush before struggling back onto your hooves, taking the offered cleaning implements and mopping up your emissions.");
	//Fen additions:
	output("\n\nMore than one costumed woman applauds your performance, and a giggling galotian tears the mop from your hands, sliding across the puddled spunk and leaving nothing but clean floor in her wake. The color of her body lightens thanks to your voluminous deposit while you watch, spellbound. She burps cutely, then scoots away, drunkenly weaving through the crowd with the mop floating inside her.");
	output("\n\nA raucous voice calls from the back of the room, <i>“Do it again!”</i> and is immediately joined by wolf-whistles and cheers. There’s so many women watching you, and a few guys as well, drooling over the sheer size and virility of your stiffening mast. Someone cups your balls and rolls them in feminine fingers, cooing, <i>“I bet you can give us even more...”</i>");
	output("\n\n<i>SLAP!</i>");
	output("\n\nYour cock thumps off your belly, and you resolve to live up to her expectations. If you can show off an impressive enough cumshot, surely someone will let you impregnate them...");
	for(var x:int = 0; x < 15; x++)
	{
		pc.orgasm();
	}
	pc.exhibitionism(2);
	pc.exhibitionism(2);
	pc.exhibitionism(2);
	clearMenu();
	addButton(0,"Next",maleTaurSubbyEpilogue);
}

//Epilogue Male
public function maleTaurSubbyEpilogue():void
{
	clearOutput();
	showName("HOURS\nLATER...")
	output("Your memories of the night are an indistinct blur of humping, drinking, and cumming. No matter how times you did your best to paint the bar, you never got more than a few hands on your cock, draining your oozy horse-cock into laughing mouths or sloshing cups. You aren't even sure how many times you came, just that your balls ache like they've been pumped dry.");
	output("\n\nMore disturbing is the fact that you woke up onboard your ship... and that you aren’t on the planet any longer. You don’t remember anything about setting out into space - rearing up on a table and letting a galotian squeeze your load out onto Holidays tits? Sure, but nothing about the trip back to your ship. Heck, you’re even pretty sure that a curvy leithan snuck her tail up your ass while you were spanked by some white-furred ausar lass.");
	pc.buttChange(250);
	output(" You came harder than ever, but you’re feeling pretty sore now.");
	output("\n\nIt isn’t until you check your ship’s logs that you stumble upon some clarity. There’s a new message, one you didn’t put in there. You hit play, bringing it up on the main screen. A cute, white-furred kaithrit pops up on screen, waving nervously.");
	output("\n\n<i>“Hey, I don’t know what you were on about when you said that the whole centaur thing was just a costume. I mean... damn, you must have been slipped something at the bar. It’s pretty obvious you got some high-quality mods to produce that piece of work.”</i> She chuckles and looks behind herself at your slumbering form. <i>“You might not remember me from the party. It was pretty fun - you can cum like a void-cursed geyser with the right encouragement, right show-pony?”</i>");
	output("\n\nThe kaithrit rubs her belly and burps. <i>“You were super out of it by the time the cops busted up the party. You should’ve seen the gear those peacekeepers were fitted with. They looked more like soldiers than officers of the law. From what I heard while me and that pink-haired girl were dragging you out the back, they were looking for some thief that made off with a bunch of symbiosis tech. Crazy shit, right?”</i> She tucks her hair behind a flicking cat ear and smiles.");
	output("\n\n<i>“Lucky for you, I work in customs. Between me and your friend, Christmas or Halloday or whatever she called herself, we got you back to your ship, and I’ll be sending you off world in a minute. You seemed too nice, and well... submissive to do anything wrong. Don't let the other girls be too mean to you out there, okay?”</i> The kaithrit nervously smiles. <i>“Oh, and your friend says she stashed your stuff in the compartments under your bunk. Uhmm... goodbye, in case I don’t see you again, you sexy centaur, you.”</i>");
	output("\n\nBlushing one last time, the cat-girl cuts off the recording, leaving you alone with your thoughts.");
	output("\n\nWait! <b>You’re still wearing the costume...</b>");
	processTime(450);
	clearMenu();
	addButton(0,"Next",maleTaurSubCostumeFinale);
}

public function maleTaurSubCostumeFinale():void
{
	clearOutput();
	output("No matter how hard you search, you can’t find a single catch or release. Worse still, attempts to peel away the border between your top and bottom half hurts. You can’t even feel your old lower half anymore - just the four, hoof-capped limbs below. It’s as if that equine shape has become a part of you for good. Is that what the peacekeepers meant by symbiosis tech? Are you a centaur forever?");
	output("\n\nWell, at least you’ll be well-equipped to mate with some mares, if they'll let you near their pussies. Maybe they'll let you flood a few milkers to prove your worth...");
	output("Something seems a little off about that thought, but the mental image of a half-dozen girls crouching beneath you, giggling while they handle your jizz-swollen orbs has your cock threatening to rear its flaring head all over again, and who are you gonna find to help you get off in the cold void of space?");
	output("\n\n<b>Looks like you’re a horny");
	if(!pc.hasVagina()) output(", male");
	output(" centaur now.</b>");
	pc.lust(50);
	halloweenShipMove();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
