
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
	moveTo("SHIP INTERIOR");
	showLocationName();
	clearBust();
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
		//AddLogEvent("<b>New Email From Wet & Waiting (Wet.N.Waiting@GalLink.org)!</b>", "passive");
		MailManager.unlockEntry("the_masque", GetGameTimestamp());
		MailManager.readEntry("the_masque", GetGameTimestamp());
	}
	
	//// Adds “Poe A” to navigation list
	processTime(3);
	flags["HOLIDAY_OWEEN_ACTIVATED"] = GetGameTimestamp();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function flyToPoeAConfirm():void
{
	clearOutput();
	showName("POE A\nCONFIRM?");
	
	output("Recalling what you’ve read in the invitation letter, the parties held at this location may have a tendency to get way out of hand, <b>resulting in permanent consequences.</b>");
	output("\n\nYou should only proceed if you are definitely sure you want to travel here.");
	
	clearMenu();
	addButton(0, "Continue", flyTo, "Poe A", "Fly to Poe A", "I can handle the consequences!");
	addButton(14, "Nevermind", flyMenu);
}
public function flyToPoeA():void
{
	author("Adjatha");
	showBust("POE_A");
	output("Electing to have a little fun, you set a course for Poe A and before long, the planet looms before you on the display. It’s not particularly large, for a civilized world, but the traffic for landing vehicles is a little ridiculous. Thousands of craft are coming in every minute, with no sign of the influx slowing down. They’re from all over the galaxy too, even models you’ve never heard of before. Taking your place in the landing queue, you look around at some of the other visitors, eyes watering with envy as you spot a few ships that probably cost as much as this whole planet. Apparently the stories of stars slumming it up during the festival weren’t exaggerated!");
	
	processTime(5);
}

//Planetfall
////Plays when the player selects Poe A from their navigation list.
public function landingOnPoeA():void
{
	generateMap();
	
	clearOutput();
	showName("\nLANDING...");
	showBust("POE_A");
	author("Adjatha");
	output("When you finally get the chance to land, your ship is shepherded into a city-sized parking lot, automated vessels whipping back and forth to pick up visitors and speed them to the party. From what you read, the whole planet is virtually one big scene, so when an empty cart swings around to give you a lift, you tell the craft to take you to the west end of Craven city. Might as well start by seeking out your accidental host.");
	output("\n\nAt the command, the small cart swings its doors closed, sealing you in with a hissing lock. A port opens up and in the blink of an eye, the entire interior is flooded with cushioning foam, leaving your surprised body half out of your seat. With a lurching sense of acceleration, the transport sets out at top speed, your body presumably protected from the wild speeds by the foam around you. Not exactly the most comfortable way to travel, but you’ve had worse. Before long, the craft halts, your semi-solid prison deteriorating into a frothy, bubbly lather that leaves you clean and disinfected, ready to party. The door slides open and the city boils into view.");
	output("\n\nA wall of sound nearly drives you back into the transport the second you step out. A writhing mass of bodies fills nearly every inch of available street space, men and women screaming, singing, dancing, and drinking as far as the eye can see. The main thoroughfare just a short distance away has a slow parade of huge, garish floats making their way through the sea of revelers, statues of memorable movie monsters - and more than a few obscure ones too - atop each one. Some move with animatronic stiffness, bending and waving to the people below them, grinning with needle-point teeth and beckoning them to come onto the float with an array of blood-stained weapons. No one seems deterred by the horrors though, as they climb atop the wheeled displays with drunken delight, posing in mock defiance of the behemoths before laughing and leaping back into the crowd with the reckless confidence of the inebriated.");
	output("\n\nVirtually every building has its windows thrown open, with yet more celebrants leaning out or piling onto reinforced balconies. High above the press of the ground, these merrymakers attend to other impulses, couples or whole groups pressed together tightly, their moans of delight lost in the deafening bedlam of the festival. Some of the revelers above toss colored streamers into the air, letting the spiralling paper slowly float down in a dizzying array of color. Others throw small trifles to those riding the floats - plastic necklaces of glittering beads, in most cases, though more than a few fling lacy articles of clothing to coax more party goers to their rooms.");
	output("\n\nAfter taking in the sheer spectacle for a few minutes, you step forward to join in the fun, only to find your way blocked by a small mob of revelers who have turned to you and stare silently. The heat and fun of the festival cools considerably in the cold gazes of these stationary sentinels. You back away and try a different street, but run into the same problem. Fearing that you may have accidentally broken some unwritten rule of The Masque, you start to look up details when it hits you. You don’t have a costume! Literally every single person around you is wearing some kind of mask or decorative dress and it was just so universal that you didn’t give it any thought. Most people probably bring their own costume, but there’s gotta be some stores on-world who can help you out.");
	output("\n\nThere are plenty, as it turns out, but every single one of them are closed, sold out, or more commonly, both. Frustratingly, it seems you’re a bit unprepared for this year and, coming so close to the end of the season, just about everything’s gone. Unwilling to leave empty handed, you turn off the main streets and start wandering some of the less crowded alleys, trying to ask revelers for directions in the quieter sections, only to be greeted by the same icy hush of the others. Before long, you start feeling a bit discouraged by all the stonewalling and you seek out an alley with lit signs but no silent, judging, masked faces to dishearten you further.");
	
	pc.shower();
	
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
	clearMenu();
	addButton(0,"Talk",talkToHoliday);
	addButton(1,"Costumes",holidayCostumeMenu);
	addButton(14,"Leave",leaveLikeABitch);
}
public function holidayCostumeMenu():void
{
	clearMenu();
	
	var btnSlot:int = 0;
	if(pc.credits >= 1000)
	{
		addButton(btnSlot++,"GoblinSuit",goblinCostume,undefined,"Goblin","You could dress up as some kind of fantasy goblin.\n\nPrice: 1000 credits");
		
		addButton(btnSlot++,"Helmet",metroidMaskParody,undefined,"Helmet","This helmet looks pretty spacy! Rad!\n\nPrice: 1000 credits");
		
		if(!pc.hasGenitals()) addDisabledButton(btnSlot++,"Armor","Armor","Looks like that outfit is for people with genitalia.");
		else addButton(btnSlot++,"Armor",greenArmor,undefined,"Armor",("There’s a suit of dark green armor on the rack, with a black bodysuit underneath holding the skimpy green plates together. You’re pretty sure it’s modeled after some video game character." + (flags["MET_SYRI"] == undefined ? "" : ".. didn’t you see Syri playing as this chick once?") + " The armor’s probably not real, but it’ll make a decent enough cosplay for a night on the town!\n\nPrice: 1000 credits"));
		
		if(pc.isTaur()) addDisabledButton(btnSlot++,"HorseSuit","HorseSuit","It looks like the bottom half of a centaur... though you have a tauric lower half already.");
		else if(pc.isPregnant()) addDisabledButton(btnSlot++,"HorseSuit","HorseSuit","It looks like the bottom half of a centaur. To avoid complications, you probably shouldn’t wear this while pregnant.");
		else if(pc.hasGenitals() && flags["UNLOCKED_JUNKYARD_PLANET"] != undefined) addButton(btnSlot++,"HorseSuit",centaurBunsBunsBuns,undefined,"Horse Suit","It looks like the bottom half of a centaur. Must be robotic.\n\nPrice: 1000 credits");
		else addDisabledButton(btnSlot++,"HorseSuit","HorseSuit","You need to have made it to the second planet (and have genitals) for this choice.");

		//Spider Suit
		if(pc.isPregnant()) addDisabledButton(btnSlot++,"SpiderSuit","Spider Suit","A warning label mentions that this costume contains substances harmful to pregnant individuals. Damn!");
		else addButton(btnSlot++,"SpiderSuit",spiderSuitApproach,undefined,"Spider Suit","A forgotten pile of black armor attached to a gray body suit sits crumpled in the corner of the room. You’re not really sure what it is.\n\nPrice: 1000 credits");

		if(pc.isPregnant()) addDisabledButton(btnSlot++,"MetalReptile","Metal Reptile","A warning label mentions that this costume contains substances harmful to pregnant individuals. Damn!");
		else addButton(btnSlot++,"MetalReptile",metalReptileCostume,undefined,"Metal Reptile","There’s some kind of bodysuit - covered in metallic scales - laying atop one of the boxes. Looks like it could be pretty badass...\n\nPrice: 1000 credits");

		if(pc.hasVagina()) addDisabledButton(btnSlot++,"Hero Garb","Hero Garb","This clothing features a very male cut. It even includes a warning label suggesting that females and hermaphrodites should not wear it. Weird.");
		else if(pc.isTaur()) addDisabledButton(btnSlot++,"Hero Garb","Hero Garb","Your unconventional body type would never fit into the costume.");
		else if(!pc.hasCock()) addDisabledButton(btnSlot++,"Hero Garb","Hero Garb","This clothing features a very male cut. You’ll need a phallus to properly fill it out.");
		else addButton(btnSlot++,"Hero Garb",heroGarbCostume,undefined,"Hero Garb","A forest green pointed hat droops over the head of a mannequin, with a matching green tunic and white tights. A pair of brown leather boots and gauntlets lay strewn across the floor.\n\nPrice: 1000 credits");

		addButton(btnSlot++,"KnottyNurse",becomeANaughtyNurse,undefined,"Knotty Nurse",knottyNurseTooltip());
		
		if(CodexManager.entryUnlocked("Cockvines")) addButton(btnSlot++,"GreenBikini",chooseCockvineBikini,undefined,"Green Bikini","What seems to be a green-colored bikini stuffed between the other outfits.\n\nPrice: 1000 credits");
		else addDisabledButton(btnSlot++,"Locked","Locked","You are not familiar with this yet.");
	}
	else
	{
		addDisabledButton(btnSlot++,"GoblinSuit","GoblinSuit","You can’t afford this junk. Crap.");
		addDisabledButton(btnSlot++,"Helmet","Helmet","You can’t afford this junk. Crap.");
		addDisabledButton(btnSlot++,"Armor","Armor","You can’t afford this junk. Crap.");
		addDisabledButton(btnSlot++,"HorseSuit","Horse Suit","You can’t afford this junk. Crap.");
		addDisabledButton(btnSlot++,"Spider Suit","Spider Suit","You can’t afford this junk. Crap.");
		addDisabledButton(btnSlot++,"MetalReptile","Metal Reptile","You can’t afford this junk. Crap.");
		addDisabledButton(btnSlot++,"Hero Garb","Hero Garb","You can’t afford this junk. Crap.");
		addDisabledButton(btnSlot++,"KnottyNurse","Knotty Nurse","You can’t afford this junk. Crap.");
		if(CodexManager.entryUnlocked("Cockvines")) addDisabledButton(btnSlot++,"GreenBikini","Green Bikini","You can’t afford this junk. Crap.");
		else addDisabledButton(btnSlot++,"Locked","Locked","You are not familiar with this yet.");
	}
	//Poe A - Bondage Kitty
	if(pc.isTaur()) addDisabledButton(btnSlot++,"Black Cat","Black Cat","This wouldn’t fit your body type.");
	else addButton(btnSlot++,"Black Cat",selectTheBlackCatCostume,undefined,"Black Cat","A whole crate full of brushed steel briefcases with the picture of a black cat on them. Could be a pretty cute outfit!\n\nPrice: ???");
	
	addButton(14,"Back",holidayMenu);
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
	output("\n\nShaking her head so vigorously that it proves her horns aren’t part of a costume, she sits down on one of the unpacked crates. Crossing one leg over the other, she places a finger to her lips, idly flicking at one of her piercings. <i>“So, deal with the devil time. You need a costume, I need some money, and this crap ain’t gonna sell itself. What’re ya buyin’?”</i>");
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
	pc.taint(5);
	processTime(44);
	
	var tailCnt:Number = pc.tailCount;
	var tailGen:Number = GLOBAL.TAIL_GENITAL_NONE;
	if (pc.hasTailCock()) tailGen = GLOBAL.TAIL_GENITAL_COCK;
	else if (pc.hasTailCunt()) tailGen = GLOBAL.TAIL_GENITAL_VAGINA;
	var tailGenArg:Number = pc.tailGenitalArg;
	var tailGenCol:String = pc.tailGenitalColor;
	
	pc.removeTails();
	if(tailCnt <= 0) pc.tailCount = 1;
	else pc.tailCount = tailCnt;
	pc.tailType = GLOBAL.TYPE_DEMONIC;
	pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
	pc.addTailFlag(GLOBAL.FLAG_LONG);
	if (tailGen == GLOBAL.TAIL_GENITAL_COCK) pc.addTailFlag(GLOBAL.FLAG_TAILCOCK);
	if (tailGen == GLOBAL.TAIL_GENITAL_VAGINA) pc.addTailFlag(GLOBAL.FLAG_TAILCUNT);
	pc.tailGenital = tailGen;
	pc.tailGenitalArg = tailGenArg;
	pc.tailGenitalColor = tailGenCol;
	
	if(pc.hairLength < 12) pc.hairLength = 12;
	pc.hairColor = "pink";
	pc.hairType = GLOBAL.HAIR_TYPE_REGULAR;
	
	var hornLen:Number = pc.hornLength;
	
	pc.removeHorns();
	pc.horns = 2;
	if(hornLen < 2) pc.hornLength = 2;
	else if(hornLen > 8) pc.hornLength = 8;
	else pc.hornLength = hornLen;
	pc.hornType = GLOBAL.TYPE_DEMONIC;
	
	pc.earType = GLOBAL.TYPE_DEMONIC;
	if(pc.earLength < 2) pc.earLength = 2;
	if(pc.earLength > 6) pc.earLength = 6;
	
	pc.eyeColor = "glowing amber";
	pc.eyeType = GLOBAL.TYPE_DEMONIC;
	
	pc.shiftWings(GLOBAL.TYPE_SMALLDEMONIC, 4);
	
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
	addButton(0,"Buy It",chooseDatGobboCostume,undefined,"Buy It","Costs 1000 credits.");
	addButton(14,"Back",holidayCostumeMenu);
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
	else output("asking what you’re supposed to do with your equipment. <i>“Man, you can’t wear a backpack or a tablet under a bodysuit,”</i>");
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
	clearBust();
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
	pc.applyCumSoaked();
	pc.applyCumSoaked();
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
	if(pc.cumflationEnabled())
	{
		pc.maxOutCumflation("mouth", pp);
		pc.maxOutCumflation("ass", pp);
	}
	pc.applyCumSoaked();
	pc.applyCumSoaked();
	pc.applyCumSoaked();
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
	output("\n\n<i>“I work for Customs, so I snuck you out of there before either side could grab you.”</i> She blushes, glancing away from the screen. <i>“It’s the least I could do, after you... Well, anyway. Some pink-haired chick helped too. Said she’d hide the costume and had a bunch of clothes in your size. Even handed off the claim ticket for that ship I put you on. I don’t know who you really are, but you’ve got some good friends. You probably want to stay off-world for a while, at least till all that shit we did blows over.”</i> She gnaws at her lips, chest rising in a regretful sigh. <i>“Well, if I don’t see you again, I just wanted to say I, uh... bye,”</i> she finishes, lamely, looking embarrassed. The video cuts out after that, leaving you with more questions than before.");
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
	else pc.hipRatingRaw += 2;
	pc.taint(10);
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
	addButton(0,"Buy It",samusCostumeGo,undefined,"Buy It","Costs 1000 credits.");
	addButton(14,"Back",holidayCostumeMenu);
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
	var i:int = 0;
	for(i = 0; i < pc.bRows(); i++)
	{
		pc.breastRows[i].breastRatingRaw++;
		pc.breastRows[i].breastRatingRaw++;
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
	var i:int = 0;
	for(i = 0; i < pc.bRows(); i++)
	{
		pc.breastRows[i].breastRatingRaw++;
		pc.breastRows[i].breastRatingRaw++;
	}
	pc.buttRating(1);
	pc.hipRating(1);

	output("\n\nHoliday’s saying something, but whatever, she’s just jealous of how good your [pc.butt] looks in this shiny blue costume. Sliding into it fully and zipping the skin-tight bodysuit up to the neck, you give an exhibitionary twirl, running your hands up your [pc.hips] and over your [pc.breasts]. Your [pc.nipples] ");
	if(pc.hasLipples()) output("plump up");
	else output("stiffen");
	output(" under the blue latex and you give them a little extra attention, circling your thumbs across their peaks, your glistening globes jiggling with the thrill of your sexy costume. Everyone’s going to love it, you’re just sure!");

	output("\n\n<i>Squeeeee...</i>");

	//[Pc.breasts & PC.ass increase 1 step without outputting any text.]
	for(i = 0; i < pc.bRows(); i++)
	{
		pc.breastRows[i].breastRatingRaw++;
		pc.breastRows[i].breastRatingRaw++;
		pc.breastRows[i].breastRatingRaw++;
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
	for(i = 0; i < pc.bRows(); i++)
	{
		pc.breastRows[i].breastRatingRaw++;
		pc.breastRows[i].breastRatingRaw++;
		pc.breastRows[i].breastRatingRaw++;
		pc.breastRows[i].breastRatingRaw++;
		pc.breastRows[i].breastRatingRaw++;
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
	
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	pc.loadInMouth(pp);
	pc.loadInAss(pp);
	pc.loadInMouth(pp);
	pc.loadInAss(pp);
	if(pc.cumflationEnabled())
	{
		pc.maxOutCumflation("mouth", pp);
		pc.maxOutCumflation("ass", pp);
	}
	pc.buttChange(400);
	pc.intelligence(-1);
	pc.libido(5);
	output("\n\nBeing a bounty hunter is awesome, you think, as darkness overtakes you.");
	if(pc.milkMultiplier < 100) pc.milkMultiplier = 100;
	pc.milked();
	processTime(45);
	pc.applyCumSoaked();
	var cumQ:Number = 0;
	if(pc.hasCock()) {
		cumQ = pc.cumQ();
		if(cumQ >= 1000) pc.applyCumSoaked();
		if(cumQ >= 5000) pc.applyCumSoaked();
		if(cumQ >= 10000) pc.applyCumSoaked();
	}
	if(pc.hasVagina()) {
		cumQ = pc.girlCumQ();
		if(cumQ >= 1000) pc.applyPussyDrenched();
		if(cumQ >= 5000) pc.applyPussyDrenched();
		if(cumQ >= 10000) pc.applyPussyDrenched();
	}
	for(var x:int = 0; x < 25; x++) { pc.orgasm(); }
	clearMenu();
	addButton(0,"Next",bountyHuntEpilogue);
}

public function bountyHuntEpilogue():void
{
	clearOutput();

	output("When you wake, the familiar hum of your ship surrounds you, nearly lulling you back to sleep. A splitting headache, however, rouses you back to the waking world. Groaning, you cradle your poor aching noggin and take stock of yourself. What happened? You got a mask from that weird demon girl that seemed like some kind of military hardware. You put a little goo thing on your head. You... released an unknown organism and let it have its way with you? The little goo thing grew to eight times its size? Uh, that’s probably not good.");
	output("\n\nYou shuffle over to a monitor and check your status. Seems like the autopilot was programed to get to a minimum safe distance from the planet. Punching up the local news feed, stories flood in about some floating green and red parasite that looks all too familiar. <i>“...attaches itself to your head, draining the victim’s brain power and inflating their feminine sexual characteristics. Do not, I repeat, do not approach this creature. Tales of cold-based weapons proving effective are entirely apocryphal at this time. Government representatives are claiming this is...”</i>");
	output("\n\nYour attention is pulled away from the report as you glance down, taking in the full scope of your experience. Your [pc.breasts] practically block off your view of the rest of your body, wobbling with heavy, flushed weight. Glancing at your side, your [pc.ass] seems so plump, it’s practically globular. You reach up and brush a long, golden lock of hair from your eye for a second, before reaching behind you and pulling a long, lustrous mane of blonde over one shoulder, stunned by the volume of your [pc.hair].");

	output("\n\nWhen you glance back up at the monitor, the reporter has a little green blob on her head that wiggles and vibrates in pulsing squeaks. Her bust has grown four or five cups and is on the verge of busting out of her top. Her hair grows before you eyes, fading from brown to blonde to platinum white. Her expression of shock quickly becomes one of oozing, sexual delight as her lips puff into a thick, whorish pucker and her eyes soften to a pale and empty blue. Switching the news feed off, you take stock of your own transformations. It’s a good thing you had that helmet on! Who knows how much more of a bimbo-bloated sex doll you would’ve turned into if that thing had been parked right on top of you all night! You entertain the thought of trying to turn in Holiday for keeping dangerous organisms in crates and boxes, but considering your own role in their release was more than just incidental, decide that would be a very bad idea. Plus, she did get you off-world before the shit really hit the fan.");

	output("\n\nAnd, you realize with a groan, maybe the prop she meant for you to grab was the blue latex suit, not the multiplying brain parasite under it. Oops.");
	// Kiro stand-in, for consistency!
	pc.loadInAss(chars["KIRO"]);
	pc.loadInMouth(chars["KIRO"]);
	if(pc.femininity < 70) pc.femininity = 70;
	if(pc.lipMod < 5 && pc.femininity >= 90) pc.lipMod++;
	if(pc.lipMod < 5) pc.lipMod++;
	pc.taint(10);
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
	pc.taint(10);
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
//Tooltip: There’s a suit of dark green armor on the rack, with a black bodysuit underneath holding the skimpy green plates together. You’re pretty sure it’s modeled after some video game character.{.. didn’t you see Syri playing as this chick once?} The armor’s probably not real, but it’ll make a decent enough cosplay for a night on the town!
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
	addButton(0,"Buy It",chooseToBeMissChief,undefined,"Buy It","Costs 1000 credits.");
	addButton(14,"Back",holidayCostumeMenu);
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

	output("\n\nYou roll your eyes but play along, striking a heroic position with muscles flexed and chest thrust-out. To your surprise and delight, the bodysuit flexes even harder than you could have, bulging around the arms and thighs like some sort of muscle suit. You look totally ripped, and totally stacked too! Holiday steps out of your way, letting you take a look in the mirror: you’re positively amazonian now, looking tall and powerful and heroic... and like you could wrestle anybody who crossed you down and smother them in your rockin’ tits.");

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
	clearBust();
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

	output("\n\nShe blinks, eyes wide. The crowd of revelers gets a little thicker around you, murmuring and watching with interest - and a few tented trousers - as you squeeze the mis-matched couple tight enough to make them squirm. You take the tiny pressure of the kaithrit’s boy-cock pressing into your shin as your answer from him, but the ausar girl... well, she’s got a lot less to show for herself, you take the initiative, grabbing her ass through the seat of her skin-tight bell-bottoms, squeezing so hard she jumps in your grasp. Her tail starts swishing hard, but she forcefully looks away from you, grabbing her boy-toy’s hand and trying to pull him back.");

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
		if(pc.hairColor != "auburn") pc.hairColor = "auburn";
		if(pc.hairLength < 14) pc.hairLength = 14;
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

	output("\n\n<i>“Damn, girl,”</i> you smile, grabbing her by the waist and pulling her close. <i>“That outfit is on fire!”</i>");

	output("\n\nShe giggles, drawing your eyes up to the slender red mask she’s wearing, shrouding a pair of big eyes with red contacts in. <i>“Thanks, gorgeous!”</i> the dragon-babe answers back, ");
	if(!pc.hasCock()) output("slipping her hands firmly onto your butt. One of them slinks a little lower, teasing a claw around your unprotected [pc.vagOrAss] until the sensation makes you gasp, so tense on the edge of penetration that your mouth hangs open.");
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
	halloweenShipMove();
	//showName("THE\nSHIP");
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

	output("\n\nSashaying past the front desk, you punch the elevator and check the room number you got. Room 2505, near the top of the towering mega-structure. It’s a long ride up, giving you plenty of time to strip off the excess armor plates in your costume, leaving nothing but the squeezing cups of the boob plate hefting up your tits, and the bikini-bottom hugging your breeder’s hips and decidedly not covering your crotch. The walls of the elevator are reflective enough for you to get a good look at yourself again, sexy beast that you are. You lick your lips and cup a tit under your costume armor, shivering with delight at the sensation. Even through the suit, you can feel pretty much everything, the sweat and oil on your skin, the heat from your body, the beat of your heart. It’s so lifelike, you can easily forget you’re wearing it.");

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
	output("\n\nHoliday flicks her earlobe with her thumb, impatiently waiting for you to make your selection. <i>“You gonna spend all night looking the gift horse in the mouth or go party? Centaur’s aren’t real common choices - real expensive. I’d normally charge way more, but... I’m saving on having to store it all year till next Masque.”</i> Her eyes flick to the door, then back to you. <i>“Not to rush you, but I’d like to close up and join the party.”</i>");
	output("\n\nWould you like to buy the centaur body or something else?");
	processTime(2);
	clearMenu();
	addButton(0,"Buy It",buyTaurSuit,undefined,"Buy It","Costs 1000 credits.");
	addButton(14,"Back",holidayCostumeMenu);
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
	clearBust();
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
	output("\n\nThe thought that you’re not really a centaur, just a [pc.raceShort] in a costume doesn’t even come to mind, ");
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
	pc.taint(10);
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
	//Tallness boost to 6' if below.
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
	pc.removeTails();
	pc.tailCount = 1;
	pc.tailType = GLOBAL.TYPE_EQUINE;
	pc.addTailFlag(GLOBAL.FLAG_LONG);
	if(arg == 1 || arg == 3)
	{
		//22" horsecock.
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
	showBust(daneBustDisplay(true),"HOLIDAY_HORSE");
	output("That sounds like consent to you. You wiggle your rump, smearing long lines of glistering horse-lube across the loincloth dividing you and the four-armed ausar, marinating his wriggling phallus in slippery pheromones. A big boy like him is going to need lots of lube to help carry all his sperm into your womb. Your achingly empty crevasse clenches, hollow and needy. Grinding harder against him, you pin Dane between a rock and a wet place.");
	output("\n\nFour powerful hands press back against your straining haunches, shifting your bulk enough to give the musclebound merc some breathing room - breathing room he’s all too happy to spend yanking the silk curtain from between your bodies. The slimy garment lands on a cheering human’s head, momentarily muffling her jubilation, but you pay it no mind. Without the condom-tight fabric stretched between Dane’s cock and your gushing nethers, his phallus is free to plunge into your waiting gates, spearing through the entrance with the force of a striking snake.");
	//CuntChange
	pc.cuntChange(0,chars["DANE"].cockVolume(0));

	output("\n\nIt feels like a normal ausar cock at first. The tapered tip lets it slide with ease, quickly broadening into a sturdy base, the kind you’d imagine could lift your hind legs off the ground with a single frenzied hump, and that’s only the beginning. Dane’s knot, the anchor of his pillar of cock, stretches you wide open. It’s pleasant, really. Your body is built to be stuffed with bigger dicks than this, so the swollen lump in the base is nothing more than erotic bonus.");
	output("\n\nAll things considered, it’s a pretty good start to your evening.");
	output("\n\nThe knot pushes deeper. Your eyes widen in surprise as the bulb burrows into your passage, leaving your lips hanging cutely agape behind. There’s no time to puzzle over this most recent development, not when Dane is spooling near-equine lengths of prick into your quim. Another knot pushes in, and your legs tremble, making your hooves slip and slide in the puddle you’ve made below. Your alien partner holds you upright, keeping you from spilling entirely to the ground. He literally saves your ass, if only so that he can hold his hips against it and continue to deep-dick you.");
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
	clearBust();
	showName("MORNING\nAFTER");
	output("You wake up with a pounding headache back on your ship, and out in space. You don’t remember anything about taking off - letting Holiday ride your back and slap your ass while Dane has you up against the wall? Sure, but nothing about the trip back to your ship. Heck, you’re even pretty sure a white-furred ausar lass had a scoreboard to keep track of how many creampies you got. You came harder than ever, but you’re feeling pretty sore now.");
	output("\n\nIt isn’t until you check your ship’s logs that you stumble upon some clarity. There’s a new message, one you didn’t put in there. You hit play, bringing it up on the main screen. A cute, white-furred kaithrit pops up on screen, waving nervously.");
	output("\n\n<i>“Hey, I don’t know what you were on about when you said that the whole centaur thing was just a costume. I mean... damn, you must have been slipped something at the bar. It’s pretty obvious you got some high-quality mods to produce that piece of work.”</i> He chuckles and looks behind himself at your slumbering form. <i>“You might not remember me from the party. It was pretty fun - you can fuck like a goddamn freighter, by the way - but shit got real there at the end.”</i>");
	output("\n\nThe kaithrit rubs his distended crotch and sighs. <i>“You were super out of it by the time the cops busted up the party. You should’ve seen the gear those Peacekeepers were fitted with. They looked more like soldiers than officers of the law. From what I heard while me and that pink-haired girl were dragging you out the back, they were looking for some thief that made off with a bunch of symbiosis tech. Crazy shit, right?”</i> He tucks his hair behind a flicking cat ear and smiles.");
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
	output("No matter how hard you search, you can’t find a single catch or release. Worse still, attempts to peel away the border between your top and bottom half hurts. You can’t even feel your old lower half anymore - just the four, hoof-capped limbs below. It’s as if that equine shape has become a part of you for good. Is that what the Peacekeepers meant by symbiosis tech? Are you a centaur forever?");
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
	output("\n\n<i>“...nice,”</i> the shrink-wrapped taur-girl exhales. She twists her humanoid half to be underneath your arm, then jerks in alarm, flicking her eyes at her sister. <i>“Are we...”</i>");
	output("\n\n<i>“...going into heat?”</i> Both pause, considering, seemingly unaware that they’re pressing more and more of their bodies against you, smothering you in their nubile embraces. <i>“Yes... I think so.”</i> They share another meaningful look while a reptilian tail snakes between your hind legs to fondle your swollen balls.");
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
	output("\n\n<i>“Of course. Drinks will be on me if you put on a good enough show.”</i> The bovine bar-wench squishes her quartet of tits together to show just what kind of drinks she plans to dispense.");
	output("\n\nMa’andi laughs airily, drunk on her own heat and who knows what else. Her tail caresses the underside of your turgid beast-cock. <i>“But which one of us gets to be a mommy first?”</i>");
	output("\n\nWhich one will have the honor of receiving your prime load?");
	processTime(10);
	pc.lust(200);
	clearMenu();
	//[Ma’andi] [Sa’andi]
	addButton(0,"Ma’andi",fuckLeithansAsTaur,"Ma'andi","Ma’andi","She’s the one in the black spandex getup.");
	addButton(1,"Sa’andi",fuckLeithansAsTaur,"Sa'andi","Sa’andi","You’d prefer the sister in the lace.");
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
	clearBust();
	showName("HOURS\nLATER...")
	output("Your memories of the night are an indistinct blur of fucking and drinking, sometimes simultaneously. Sa’andi and Ma’andi seemed insatiable at first, but after two or three cream fillings each, they settled right down, passed out in the corner like two drunken, six-legged angels.");
	output("\n\nMore disturbing is the fact that you woke up onboard your ship... and that you aren’t on the planet any longer. You don’t remember anything about setting out into space - rearing up on a table and letting a galotian squeeze your load out onto Holidays tits? Sure, but nothing about the trip back to your ship. Heck, you’re even pretty sure that Ma’andi snuck her tail up your ass while you were mounting some white-furred ausar lass.");
	pc.buttChange(250);
	output(" You came harder than ever, but you’re feeling pretty sore now.");
	output("\n\nIt isn’t until you check your ship’s logs that you stumble upon some clarity. There’s a new message, one you didn’t put in there. You hit play, bringing it up on the main screen. A cute, white-furred kaithrit pops up on screen, waving nervously.");
	output("\n\n<i>“Hey, I don’t know what you were on about when you said that the whole centaur thing was just a costume. I mean... damn, you must have been slipped something at the bar. It’s pretty obvious you got some high-quality mods to produce that piece of work.”</i> She chuckles and looks behind herself at your slumbering form. <i>“You might not remember me from the party. It was pretty fun - you can fuck like a goddamn freighter, by the way - but shit got real there at the end.”</i>");
	output("\n\nThe kaithrit rubs her belly and sighs. <i>“You were super out of it by the time the cops busted up the party. You should’ve seen the gear those Peacekeepers were fitted with. They looked more like soldiers than officers of the law. From what I heard while me and that pink-haired girl were dragging you out the back, they were looking for some thief that made off with a bunch of symbiosis tech. Crazy shit, right?”</i> She tucks her hair behind a flicking cat ear and smiles.");
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
	output("No matter how hard you search, you can’t find a single catch or release. Worse still, attempts to peel away the border between your top and bottom half hurts. You can’t even feel your old lower half anymore - just the four, hoof-capped limbs below. It’s as if that equine shape has become a part of you for good. Is that what the Peacekeepers meant by symbiosis tech? Are you a centaur forever?");
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
	clearBust();
	showName("HOURS\nLATER...");
	output("Your memories of the night are an indistinct blur of humping, drinking, and cumming. No matter how times you did your best to paint the bar, you never got more than a few hands on your cock, draining your oozy horse-cock into laughing mouths or sloshing cups. You aren’t even sure how many times you came, just that your balls ache like they’ve been pumped dry.");
	output("\n\nMore disturbing is the fact that you woke up onboard your ship... and that you aren’t on the planet any longer. You don’t remember anything about setting out into space - rearing up on a table and letting a galotian squeeze your load out onto Holidays tits? Sure, but nothing about the trip back to your ship. Heck, you’re even pretty sure that a curvy leithan snuck her tail up your ass while you were spanked by some white-furred ausar lass.");
	pc.buttChange(250);
	output(" You came harder than ever, but you’re feeling pretty sore now.");
	output("\n\nIt isn’t until you check your ship’s logs that you stumble upon some clarity. There’s a new message, one you didn’t put in there. You hit play, bringing it up on the main screen. A cute, white-furred kaithrit pops up on screen, waving nervously.");
	output("\n\n<i>“Hey, I don’t know what you were on about when you said that the whole centaur thing was just a costume. I mean... damn, you must have been slipped something at the bar. It’s pretty obvious you got some high-quality mods to produce that piece of work.”</i> She chuckles and looks behind herself at your slumbering form. <i>“You might not remember me from the party. It was pretty fun - you can cum like a void-cursed geyser with the right encouragement, right show-pony?”</i>");
	output("\n\nThe kaithrit rubs her belly and burps. <i>“You were super out of it by the time the cops busted up the party. You should’ve seen the gear those Peacekeepers were fitted with. They looked more like soldiers than officers of the law. From what I heard while me and that pink-haired girl were dragging you out the back, they were looking for some thief that made off with a bunch of symbiosis tech. Crazy shit, right?”</i> She tucks her hair behind a flicking cat ear and smiles.");
	output("\n\n<i>“Lucky for you, I work in customs. Between me and your friend, Christmas or Halloday or whatever she called herself, we got you back to your ship, and I’ll be sending you off world in a minute. You seemed too nice, and well... submissive to do anything wrong. Don’t let the other girls be too mean to you out there, okay?”</i> The kaithrit nervously smiles. <i>“Oh, and your friend says she stashed your stuff in the compartments under your bunk. Uhmm... goodbye, in case I don’t see you again, you sexy centaur, you.”</i>");
	output("\n\nBlushing one last time, the cat-girl cuts off the recording, leaving you alone with your thoughts.");
	output("\n\nWait! <b>You’re still wearing the costume...</b>");
	processTime(450);
	clearMenu();
	addButton(0,"Next",maleTaurSubCostumeFinale);
}

public function maleTaurSubCostumeFinale():void
{
	clearOutput();
	output("No matter how hard you search, you can’t find a single catch or release. Worse still, attempts to peel away the border between your top and bottom half hurts. You can’t even feel your old lower half anymore - just the four, hoof-capped limbs below. It’s as if that equine shape has become a part of you for good. Is that what the Peacekeepers meant by symbiosis tech? Are you a centaur forever?");
	output("\n\nWell, at least you’ll be well-equipped to mate with some mares, if they’ll let you near their pussies. Maybe they’ll let you flood a few milkers to prove your worth...");
	output("Something seems a little off about that thought, but the mental image of a half-dozen girls crouching beneath you, giggling while they handle your jizz-swollen orbs has your cock threatening to rear its flaring head all over again, and who are you gonna find to help you get off in the cold void of space?");
	output("\n\n<b>Looks like you’re a horny");
	if(!pc.hasVagina()) output(", male");
	output(" centaur now.</b>");
	pc.lust(50);
	halloweenShipMove();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//New Poe A Costume

//Spider Suit
//A forgotten pile of black armor attached to a gray body suit sits crumpled in the corner of the room. You’re not really sure what it is. 
public function spiderSuitApproach():void
{
	clearOutput();
	showHoliday();
	author("Magikarpfever");
	output("Shunted in the corner of the room is some sort of gray body suit. It’s obviously meant for a woman, judging by the flattering lines and padded, hyper-detailed breasts." + pc.mf(" You could probably pull it off, for a laugh if nothing else, so long as you don’t mind dressing up like a girl...","") + " There are strange black protrusions covering most of the surface of the fabric, looking a bit like armor. Hanging from the backside is a large oval like object. Upon closer inspection it resembles a shiny spider’s abdomen. The entire ensemble is a sexy take on terran arachnids. Surprisingly, the fabric itself is slippery and feels inhumanly smooth, not at all like the cheap polyster you were expecting. On the other hand the armor is also smooth but hard and durable.");
	output("\n\nHoliday, who was idly checking on her sharp, pointed nails, looks puzzled at your interest in the garb.");
	output("\n\n<i>“Huh, didn’t know I even had that,”</i> she comments.");
	output("\n\nYou try to ask her exactly what that is but she isn’t able to give you a good answer. <i>“It’s a uh...spider? Yeah spider costume. I think. Pretty sure it can conform to all body types too.”</i>");
	output("\n\nYou’re slightly perturbed that she doesn’t even know what it is, especially given the shady atmosphere of her store. Though you can’t deny the obvious quality of the costume.");

	output("\n\nWould you like to buy the spider suit, or look at another costume?");

	processTime(5);
	clearMenu();
	addButton(0,"Buy It",buyDatSpoidahCostume,undefined,"Buy It","Costs 1000 credits.");
	addButton(14,"Back",holidayCostumeMenu);
}

public function buyDatSpoidahCostume():void
{
	clearOutput();
	showHoliday();
	author("Magikarpfever");
	flags["HOLIDAY_OWEEN_PURCHASE"] = "spider suit";
	pc.credits -= 1000;
	output("You put on the chitinous plates first, sliding your legs into the stretchy fabric and pulling it into place. The elastic nature of it is astounding, conforming to every crevice with relative ease. It covers your legs within an onyx coating of shiny chitin. The plates slide all the way down to your [pc.feet] where it tapers off into a tall black heel, akin to sexy high heeled boots. In between the segmented plates is delightfully smooth gray skin. Pleased with the results, you shrug on the sleeves. You marvel at how you the glittery arachnid exoskeleton swathes your arms in beautiful plates. While you stroke the chitin you immediately notice that you can still feel touch, as if touching the skin beneath the suit. Laughing at the absurdity of it all, you accidentally knock a trinket off Holiday’s counter with your big spherical spider abdomen. Whoops, guess you forgot about that.");
	output("\n\n<i>“Hey you better watch it or else you’ll be paying for more than just the suit,”</i> Holiday grumbles. Whatever you pushed off must not be that important as she doesn’t even make a move to pick it up.");

	output("\n\nYou would have made a move to clean it up but the sight of your abdomen has you mesmerized. It’s pretty big, easily about the size of a beachball. However it doesn’t impede your movement, in fact you feel like you were born to have it. Now you can more efficiently tie up your prey. Wait where did that thought come from? Chalking it up to getting into character, you start to scuttle out the door until Holiday stops you with a shout.");
	output("\n\n<i>“Don’t you want the top?”</i> she asks, holding up a skimpy black bra.");
	//come back to this forced boobages
	output("\n\nYou shake your head, wanting everyone to see the bountiful breasts of your costume, capped with two puffy dusky nipples. The chitin, in contrast to the exposed flesh, makes it all the more noticeable. Holiday shrugs and tosses the bra under the counter. You swear you see two fangs, glistening in the overhead lighting as she grins at you.");

	output("\n\n<i>“Well have fun, don’t do anything I wouldn’t do!”</i> she tells you.");

	processTime(3);
	clearMenu();
	addButton(0,"Next",buyDatSpoidahCostumeNext);
}
public function buyDatSpoidahCostumeNext():void
{
	clearOutput();
	showBust("SAERI_FAIRY");
	showName("OUT ON\nTHE TOWN");
	author("Magikarpfever");
	
	output("Not even gracing Holiday with a glance back you strut your way through the masses of sweaty bodies. Wave after wave of sultry smells fill every olfactory gland you have. <i>All of these delicious bodies just begging to be tied up</i>. That sudden odd desire has your head spinning; questioning why that intrusive thought arose does nothing to quell a dizzying headache. In fact the migraine turns nauseating, and you stumble into a nearby alleyway so you don’t fall over anyone. Luckily it starts to fade rather quickly, pain washing away as quickly as it came.\n\nYou blink in surprise as you find that the tunnel vision vanished as well. Wait has your vision always been this good? Scanning over the writhing bodies, you can practically count the beads of sweat that trail down exposed skin. A small part of your mind tries raise an alarm, but you suddenly don’t really care.\n\nOnlookers that notice you part like the red sea so you can get through. They seem gobsmacked by your domineering form, and why shouldn’t they be? Compared to you, they’re like little flies, begging to be caught in your web. An innate urge begins to rise, an incomprehensible need for a ripe little pet. Though they can’t just be anyone, only the best will suffice. You aren’t very impressed with the selection you see. There’s so much variety but still, none of them will do.");

	output("\n\nGrowing impatient, you spot a club near the end of the street. It seems like a good place to start so you begin the trek towards it. Luckily you don’t have much trouble getting to it due to your agile nature. The smell of sex bombards you as soon as you enter the booming club. Electric music produces a dance-worthy beat as the lights on the floor shifts in an array of colors. It isn’t much different than outside, albeit more condensed. Still, you trust your instincts so you gracefully sit down on one of the stools and hail the bartender for a drink.\n\nThe Ausar working the counter breaks out in a cold sweat when he sees you, eyes locked onto your form. It takes an impatient quip from you to knock him out of his stupor. He quickly makes your drink and slides it to you, obviously wanting to please you. When you thank him he visibly sags in relief and his tail begins to whip back and forth. As you pull out a credit chip he shakes his head, cementing the fact that you will not have to pay for any drinks. You pat him on the head and coo at him for being such a good puppy, so eager to please. For a few moments you sit and savor the sweet drink, scoping out the crowded club with your four eyes.");
	output("\n\nJust than, as you’re sipping your drink, you spot her. Dancing amongst the crowd is a blue skinned Saeri. Her long pink ponytail sways while she dances in sync to the beat. She’s wearing something akin to a fairy outfit, a short puffy dress that has multicolored flowers blooming from the light green fabric. Small high heels click and spin as those gorgeous legs take your breath away. Red eyes meet intense violet ones when she spots you. She freezes for a second, the dance floor forgotten in favor of the dominating spider she sees before her. Nervously she walks over to you until she takes a seat beside you. A tuck of her hair between her ear and the bashful fluttering of her long eyelashes is all you really need.");
	output("\n\n<i>“What would you like from me, little one?”</i> you ask artfully.");

	output("\n\nThe Saeri squirms in her seat, the quartet of iridescent wings fluttering in response to the sudden movement. You don’t give her a chance to respond as you take her by the chin and press a deep kiss into those plump lips of hers. Chitinous arms wrap around her slender waist, pulling the butterfly girl closer into the embrace. Tongues clash in a heated battle, each nip you take of her lower lip has it grow more heated. Starry pink eyes, now glazed with desire, burn for more. Knowing what you have to do, you guide your lover out a back door, lips still locked together as you fumble with her dress.");

	output("\n\nThe air compared to the inside is cooler, your nipples now erect from a combination of arousal and new found sensitivity. You press her against the brick wall of the club, her body relatively light and easy to play with. The tantalizing sapphire nipples that dot her pert breasts grow even harder between your graceful fingers. Blue skin flushes into a deep indigo color and her tender nubs protrude out thanks to your treatment. The poofy dress she was wearing now sits on the alleyway ground, forgotten in the midst of unbridled lust. Thoughts of your abdomen, still heavy with silk, bring a wicked smile to your face. You make quick work of binding your prey, shooting silky strands of web to bind her arms above her head and leave her legs strapped wide apart, revealing her gleaming cunt. Her wet muff feels warm to the touch, puffy and already leaking. You start to tease it, rubbing at it until her clit is exposed. Small squeaks start to tumble out of the Saeri’s mouth as you gently roll your fingers around her clit.");

	output("\n\nA startled cry pierces the air as your fingers suddenly plunge into her sodden sex. The soft walls around it pulse around your skilled hand, delightfully hot and tight from your sudden intrusion. With your other hand, you continue to rub at the clit so you can coerce her vagina to loosen up. The Saeri is now panting wildly, streaks of sweat rolling across her body. Your tongue slithers out of your mouth, taking a few seconds to fully extend out of your mouth, and starts to coat her crotch in a thick layer of saliva. She shudders at the wetness and cries out again as you keep going further, and further, and further inside her cavernous vagina. Your efforts are followed by her unprompted yell, resulting in a sharp slap on her ripe derriere.");
	output("\n\n<i>“Do not utter a sound unless I command it,”</i> you warn her.");
	output("\n\nHanging her head in shame she apologizes, whispering a soft, <i>“Forgive me, Mistress.”</i>");

	output("\n\nThe slap seems to have increased her lust faster than stimulating her clit. Her pulsating hole sucks your fingers in, begging for you to stimulate its G spot. You have no trouble finding it, evident by the Saeri starting to buck her hips against your fingers. There’s an unspoken plea for you to go faster, so you do just that. Every gentle caress is abandoned, your fingers sliding in and out at a rapid pace. Frantic huffs cue your prey’s oncoming climax. By the way her legs begins to press against her silky bindings you doubt she’ll be able to hold out for long.\n\nFinally the waves of euphoric pleasure reaches its peak. With watery eyes, she begs you to let her cum. Since she’s been a good little butterfly, you give her permission with a slight nod. In a burst of girl-cum her eyes roll back and she convulses in ecstasy. She’s seemingly lost to a indescribable array of pleasure. Finally she winds down, breathing hard and looking at you like your a Goddess. You embrace your prey, rewarding her with small whispers of approval.\n\nShe did a good job after all, waiting for permission to climax. She sinks into your arms, resting her head on your ample bosom.");
	output("\n\nJust then, a figure runs up to you, a familiar full-figured demon who is somehow managing a remarkable pace considering she’s wearing high heels. Her heaving breasts threaten to spill out of her tight nurse top, bouncing up and down with each step. When she makes it up to you she regards the scene curiously, a mix of mischievousness and arousal gracing her feminine features.");
	output("\n\n<i>“I was wondering where you’ve been. Listen we gotta-”</i> You don’t allow her to finish. Setting your Saeri back into her silky confines you prowl toward her, your fangs glittering dangerously despite the low light. Holiday backs away a few steps but the prominent bulge in her skirt is enough to show her burgeoning arousal.");

	output("\n\n<i>“How about you listen to me pet,”</i> you purr, getting closer and closer with each step. <i>“Why don’t you let me wrap you up in my beautiful silk. I promise it’ll be worth your while...”</i>");

	processTime(55);
	pc.libido(1);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",spiderCostumePart2);
}

public function spiderCostumePart2():void
{
	clearOutput();
	showBust("SAERI_FAIRY", "HOLIDAY_HORSE");
	author("Magikarpfever");
	output("Before she can even react you shoot a stream of web to swathe her legs in your silk. With her long legs now indisposed, she falls to the ground, barely being able to catch herself with her hands. She pushes her luxurious hair out of her face to reveal a look of complete disbelief. Any attempt to push back against the ground is met with another shot of web until her arms are also cocooned. Holiday struggles against the bonds, but it’s a half-hearted attempt at best. You walk toward her at a brutally slow pace, each step emphasized by the click of your natural high-heels. Soon you’re looming over her, watching her squirming cease as you lean down. In a surprisingly soft gesture, you stroke the smooth skin of her cheeks. Gradually your hands trail down, all the way to her sizable breasts. Both are moving up and down more rapidly than normal, Holiday’s breathing amped up a notch, whether it’s from running to the alley or the sudden position she found herself in.");

	output("\n\nOnly needing a flick of a finger to undo her top pillowy cushions burst from their confines. The milky skin surrounding bright pink aerolae are just begging to be licked. However you’re not the one who’s going to do the licking. You stride back to your Saeri, who is watching wide eyed at the scene before her. With relative ease, you cut her down from the wall and embrace her again. She gladly accepts it, almost purring as you stroke her head. Not above a whisper, you explain to her what you want to do. When you let go of her she tentatively walks over to the tied up Holiday and hunkers down so you can see her cute little behind. Following your orders she begins lapping at the demon-nurse’s breasts, sliding her tongue down and around her nipples. Holiday groans at the treatment, sticking up her chest so the Saeri has better access. Your pet expertly swirls her tongue around her tender nubs, giving them each a tiny nip. By this point Holiday is visibly panting, the tent in her skirt now almost vertical.");
	output("\n\n<i>“Yo-you know, I thought, I... I-d be tied up by Peacekeepers, th-though this...this is loads better,”</i> she stammers.");

	output("\n\nYou grin at her state, relishing at the fact that she is barely able to speak. In a low whisper you give another order to your pet, urging her to pick up the pace. She goes through with the order with flying colors. The Saeri plants a kiss on Holiday’s shapely lips, gradually deepening it until you can basically hear their greedy sucking and the exchange of spit. When she stops, she wipes a stray strand of saliva from her lips and begins to remove Holiday’s skirt. The flimsy piece of cloth is quickly torn away, revealing a throbbing horse-cock. Veins bulge from within its pink exterior, and its large size makes you wonder how she managed to hide it. You gently move your pet aside, giving her a quick pat on the head for doing such a good job. Aligning your crotch to her dick, you show her a gleaming new spider cunt, hidden in an encasing of chitin until now.");
	output("\n\nThrough gritted teeth Holiday lets out a groan. <i>“Just fuck me already!”</i>");

	output("\n\nYou tut at her vulgar display, crossing your arms to readily show your displeasure. The demon picks up on it and through bared teeth she begs for release. <i>“Please, please fuck me... Mistress.”</i>");
	output("\n\nAlthough it’s not a perfect display of submissiveness you decide to look past it. She did say please after all. Since your spider-cunt is already soaking wet from earlier, you have no trouble sliding her tip in, followed by the rest of it’s girthy length. It’s only halfway through when you already feel a heavy warmth permeate your vagina. You groan in satisfaction, its veiny ribs massaging your walls in all the right places. Resisting the urge to rut against it like a wild animal, you slowly start to move, rocking yourself up and down at a steady pace. Holiday is clearly enjoying herself, eyes wide and jaw slack. Her hips jerk with need, trying to make you go faster. Stars begin to permeate your vision and soon you feel yourself speeding up the process despite yourself. Since it’s so long, it finds your G-spot with relative ease. You barely manage to stop a cry of pleasure ripping from your throat as it hits it just right. At last the oncoming eruption of bliss hits you in full force. Your eyes stare blankly at the sky as you experience an indescribable euphoria. Holiday, who reached her climax as well, blasts your cunt with thick streams of horse-cum. It goes on and on for what feels like an eternity until you both finally wind down from the intense orgasm. You are left panting, grinning madly, until you suddenly black out.");
	processTime(30);
	pc.libido(2);
	pc.orgasm();

	clearMenu();
	addButton(0,"Next",spiderCostumeOutro);
}

public function spiderCostumeOutro():void
{
	clearOutput();
	halloweenShipMove();
	author("Magikarpfever");
	showName("THE\nHANGOVER...");
	output("You wake up in your ship with a splitting headache");

	if(pc.eyeType != GLOBAL.TYPE_ARACHNID) 
	{
		output(", the lights burning your four eyes-wait four? Scrambling to find a reflective surface you manage to spot a small mirror sitting on your side table. Seems like you’ve undergone a drastic metamorphosis, four red eyes stare back at you eerily from within the mirror");
		pc.eyeType = GLOBAL.TYPE_ARACHNID;
		pc.eyeColor = "red";
	}
	output(".");
	if(!pc.hasChitin() || pc.skinTone != "gray" || pc.scaleColor != "black")
	{
		output(" It looks like");
		if(pc.skinTone != "gray")
		{
			output(" your entire body is bathed in a pool of liquid gray ink");
			if(!pc.hasChitin()) output(" as glossy black chitin plates grow along its surface");
			else if(pc.scaleColor != "black") output(" as your chitin pigment darkens to a glossy black");
		}
		else if(!pc.hasChitin()) output(" your body is affected as glossy black chitin plates grow along the surface of your gray skin");
		else output(" the pigment of your chitin gradually darkens until it is a glossy black");
		output(". Even,");
		pc.skinType = GLOBAL.SKIN_TYPE_CHITIN;
		pc.clearSkinFlags();
		pc.addSkinFlag(GLOBAL.FLAG_SMOOTH);
		pc.skinTone = "gray";
		pc.scaleColor = "black";
	}
	else output(" Your chitin seems unchanged by the costume. No surprise, given that it was a perfect match. Still,");
	if(pc.hairColor != "black")
	{
		output(" your hair is now an elegant shiny black, cascading down your back and ending right at your spider-like abdomen. In addition,");
		pc.hairColor = "black";
		pc.hairLength = pc.tallness/2;
		pc.hairType = GLOBAL.HAIR_TYPE_REGULAR;
	}
	else if(pc.hairLength < pc.tallness/2)
	{
		pc.hairLength = pc.tallness/2;
		output(" your hair has lengthened, cascading down your back and ending right at your spider-like abdomen. In addition,");
	}
	if(pc.tailType != GLOBAL.TYPE_ARACHNID && pc.tailCount != 1)
	{
		output(" that spider-like abdomen remains, hanging off your butt, heavy with webbing.");
	}
	else
	{
		output(" it was kind of nice to feel more spider-like than you already are.");
	}
	pc.tailType = GLOBAL.TYPE_ARACHNID;
	pc.tailCount = 1;
	pc.clearTailFlags();
	pc.addTailFlag(GLOBAL.FLAG_CHITINOUS);
	pc.addTailFlag(GLOBAL.FLAG_SMOOTH);
	if(pc.faceType != GLOBAL.TYPE_ARACHNID)
	{
		output(" Examining your teeth you see that you now have shiny white fangs protruding from your pearly whites.");
		if(pc.hasMuzzle()) output(" <b>Where’d your muzzle go?</b>");
		pc.clearFaceFlags();
		pc.faceType = GLOBAL.TYPE_ARACHNID;
	}
	output(" What in the void happened last night?");
	
	if(pc.hasCock())
	{
		output("\n\nOh shit, your [pc.cocks]! <b>");
		if(pc.cockTotal() == 1) output("It’s gone");
		else output("They’re gone");
		if(pc.balls > 0) output("... along with your [pc.balls]");
		output("!");
		output("</b> In " + (pc.cockTotal() == 1 && pc.balls <= 0 ? "its" : "their") + " place is that <b>single, slippery spider-slit!</b>");
		pc.removeCocks();
		pc.removeVaginas();
	}
	else if(pc.totalVaginas() > 1)
	{
		output("\n\nOh shit! <b>You only have one vagina now</b>... that strange spidery slit remains as evidence of your costumed indiscretions.")
		pc.removeVaginas();
	}
	else if(!pc.hasGenitals())
	{
		output("\n\nMore interesting still is the <b>spider-like vagina that you’ve gained!</b>");
	}
	else if(pc.hasVaginaType(GLOBAL.TYPE_ARACHNID))
	{
		output("\n\nAt least your spidery vagina is unchanged. You suppose that’s one of the perks of matching your costume to your pre-existing mods.");
	}
	else
	{
		pc.removeVaginas();
	}

	output("\n\nLuckily your codex begins blinking, signaling you have an unread video message. When you open it up you see a familiar looking Saeri regarding you fondly.");

	output("\n\n<i>“Hi! I had a great time at the club...you’re a perfect dom. Not sure if you remember, but the threesome we had with the demon chick was amazing! It got pretty crazy when those Peacekeepers stormed into the alleyway and knocked you out. Somehow the demon lady managed to get us to safety, looks like she’s some sort of illegal mod dealer or something. Though given how amazing she is in bed I think I can look past that.”</i> She giggles cutely at that before continuing. <i>“Anyways I hope I’ll see you again someday... goodbye Mistress.”</i>");

	output("\n\nOnce the video ends you’re left alone with your thoughts. From what you gathered Holiday’s ‘costumes’ are actually illegal mods. You should be mad, but honestly your new spider body feels like something you should have been born with. Maybe you should find Holiday and thank her for the new body. You’re sure she’d appreciate being bound up and subjected to your sexy ministrations again.");
	if(pc.femininity < 75) pc.femininity = 75;
	pc.earType = GLOBAL.TYPE_SYLVAN;
	pc.earLength = 3;
	pc.reflexes(2);
	pc.intelligence(2);
	pc.physique(-2);
	pc.willpower(-1);
	//Remove extra boobers
	if(pc.bRows() > 1)
	{
		while(pc.bRows() > 1)
		{
			pc.removeBreastRow(1,1);
		}
	}
	//Set limb types:
	pc.armType = GLOBAL.TYPE_ARACHNID;
	pc.clearArmFlags();
	pc.addArmFlag(GLOBAL.FLAG_CHITINOUS);
	pc.legType = GLOBAL.TYPE_ARACHNID;
	pc.legCount = 2;
	pc.clearLegFlags();
	pc.addLegFlag(GLOBAL.FLAG_CHITINOUS);
	pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
	pc.addLegFlag(GLOBAL.FLAG_HEELS);
	//DD boobers
	if(pc.breastRows[0].breastRatingRaw < 5) pc.breastRows[0].breastRatingRaw = 5;
	//Tongue
	pc.tongueType = GLOBAL.TYPE_ARACHNID;
	pc.addTongueFlag(GLOBAL.FLAG_LONG);
	pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
	//No testes
	pc.balls = 0;
	//Set up new spidergina.
	if(!pc.hasVagina()) pc.createVagina();
	pc.vaginas[0].type = GLOBAL.TYPE_ARACHNID;
	pc.vaginas[0].wetnessRaw = 2;
	pc.vaginas[0].hymen = false;
	pc.vaginalVirgin = false;
	pc.libido(2);
	//Load 'er up!
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	pp.createPerk("Fixed CumQ",2500,0,0,0);
	pc.loadInCunt(pp, 0);
	pc.taint(10);
	processTime(8*40);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*
SaurmorianCostume for Poe A
By Aullama
Note(s)
Create perk: Igneous Heart - Your fiery spirit keeps you warm in frigid climates, but you are more prone to catching fire. //PC is immune to cold weather effects, but gains an additional +10% chance of being burned from Burn sources/damage.
//Fen note: NOAP
*/

//[MetalReptile]
//Add to Holiday's costume selection
//There’s some kind of bodysuit - covered in metallic scales - laying atop one of the boxes. Looks like it could be pretty badass...

public function metalReptileCostume():void
{
	clearOutput();
	showHoliday();
	author("Aullama");
	output("A closer look reveals it to be a black bodysuit made from a tight, latex-like material. It’s a little difficult to get a good look, though, with the vast majority of the piece covered in large silver scales from the open neckline down to the claws of its feet and tip of a long tail; the inner thighs, crotch, belly, and chest are left with less coverage, though. As you turn it this way and that, however, the scales seem to almost shift between looking thick and bulky, to smooth and sleek - a trick of the light, surely. Either way, the costume has an air of primal - almost prehistoric - pride, and <i>passion</i>.");
	output("\n\nHoliday rolls her eyes at the costume you’ve picked out, less than enthused by your selection. <i>“Ugh, that one. It’s just some suit fashioned after some coreworld peoples, that’s it - a saurmorian, I think. Kinda boring if you ask me. Like, I guess it looks cool, but why not get a gryvain or an ausar one too while you’re at it?”</i> She flicks her earlobe with her thumb, eyeing you impatiently, <i>“Okay look, I guess it might be alright on you, if you decide to buy it. Give you that whole lithe, streamlined look, or like a big and bulky lizard thing. Not to mention it’ll change to match your [pc.skinFurScalesNoun] color. I think. But if you could, ya know, hurry up soon, that’d be great...”</i>");
	output("\n\nWould you like to buy the suit covered in primal scales, or select another?");

	processTime(3);
	clearMenu();
	//[Buy]
	addButton(0,"Buy It",saurmorianSuitBuy,undefined,"Buy It","Costs 1000 credits.");
	addButton(14,"Back",holidayCostumeMenu);
}

//[Buy]
public function saurmorianSuitBuy():void
{
	clearOutput();
	showHoliday();
	author("Aullama");
	flags["HOLIDAY_OWEEN_PURCHASE"] = "saurmorian suit";
	pc.credits -= 1000;
	output("A getup of a coreworld race? Well, it may not necessarily be a unique look in that regard, but it <i>is</i> still a costume - and a fairly good one at that. That settles it then, it’ll work; this outfit should have just enough pizazz to get through those silent and staring walls of people. After a quick payment, Holiday absently waves to a curtained off part of the room, <i>“Just get changed over there, I guess.”</i>");
	output("\n\nThe confusion must be written on your face, as she smirks at your hesitation. <i>“What? ");
	if(!pc.isNude()) output("You really expect to keep your things on under a tight fit like </i>that<i>?");
	else output("You really expect to lug your stuff around with a costume like </i>that<i>?");
	output("”</i> She scoffs, her tone feeling more than a little condescending, <i>“You’d look all bumpy, and the suit’s colors would get all fucked up. I see ya got a head, should probably use it once in awhile, you know?”</i>");

	output("\n\nYou protest, unsure of what to do with your gear, only to be shushed by the sketchy demoness. <i>“Oh shhushushshush! Shh... You can leave your things here with me. I’ll look after it all until you’re done with the party,”</i> she coos, cocking her head to the side, <i>“Don’t you trust me?”</i> You suddenly hear a grating - or a scratching - sound come from one of the crates behind her, accompanied by a threatening growl. Holiday’s eyes dart from side to side in alarm before locking back onto you, biting her lip innocently.");

	output("\n\nYou haven’t met very many people less trustworthy than this woman, but the alternative is another long trip back to your ship and your time to enjoy the festivities is running out. Fuck it, you decide. Grabbing your costume in both arms, you head to the curtained corner - only for Holiday to gasp and tell you to wait, shoving a lizard mask matching the outfit into your arms - then ");
	//pcIsNOTnude:
	output("stripping off your equipment and ");
	output("opening the constantly shifting suit. A sturdy zipper runs down one side, from shoulder to hip, and makes slipping into the costume a rather awkward ordeal. It doesn’t help that the interior feels different from the latex like exterior; the odd, almost fleshy texture sticking to your [pc.skinFurScalesNoun]. Surprisingly, as the bodysuit stretches and conforms to your shape, the mass covering of metal scales seems unaffected. In fact, as you look down at yourself, they appear more properly aligned and layered - much more natural. Eyeing the mask next, you’re impressed by how lifelike it seems. From the razor teeth and wide, floppy tongue hidden behind warm lips along a reptilian snout, it paints a scary picture - though the holes for your eyes and a lack of any obvious mechanization for the jaws give a stark contrast. You wriggle into it easily enough - though the same weird insides don’t feel quite right against your [pc.hair] - and make some minute adjustments before turning to the mirror nearby, in the hopes of finding some way of attaching the mask to the rest of the costume while you take it all in.");

	//ifMasculine:
	if(pc.mf("b","") == "b")
	{
		output("\n\nWhat greets your eyes is a large, muscular figure, with a menacing snout and girded from head to toe in thick scales. Was the costume always like this?");

		output("\n\nYou take a moment to flex in front of your reflection, amazed at the iron hard muscles bulging underneath the outfit’s scales. There’s a momentary fizzing along your face that leaves it feeling a little numb, and you try to work your jaw inside the mask - only for the maw of the mask itself to follow your movements. Woah! The same feeling can be felt just above your ass - that looks rather chiseled and perky in the suit - and the heavy tail behind you begins adjusting and swaying to your movements. Drawing a clawed hand over your head and the exceptionally dense scales that run all the way down your back and tail, you’re shocked even further with how well you can <i>feel</i> everything through the suit. You chuckle to yourself - trying to wrap your head around this incredible feat of technology - but only see pride in the face grinning within the mirror. Pride, power, and a confidence bordering on arrogant. It’s a good look. Speaking of looks, you want to hear Holiday’s praise for your reptilian majesty, and make your way out from behind the curtain.");

		output("\n\nThe pink haired demoness turns a disinterested glance to you, but quickly goes wide eyed as she checks you out, having to crane her head back in the process. <i>“Oh fuck,”</i> she can’t help but spout, <i>“You look ready to take on the world, and party while you do... and maybe punch through a wall. Please don’t punch any of my walls.”</i>");
	}
	else
	{
		output("\n\nWhat greets your eyes is a lithe, sleek figure, with an elegant snout and gracefully gilded from head to toe in beautiful scales. Was the costume always like this?");
		output("\n\nYou twist and stretch in front of the mirror, amazed at the flexibility you have within the outfit as you drink in the long, lean physique, curvy hips and round, perky rump. Odd, you don’t remember being <i>this</i> flexible. You’re unable to mull over it, however, when your thoughts are interrupted by a fizzing sensation that leaves your face and tailbone feeling alarmingly numb. Your hands instinctively dart to the affected areas, gingerly rubbing feeling back in, and you gasp as you seem to do just that - except you can feel <i>through</i> the suit. The mask even follows your every movement, mirroring your attempts at flexing and working your face’s muscles; your senses and nerves seem focused on the bodysuit, you muse as you open and close the mask’s reptilian maw. What an amazing feat of technology this costume is! Regardless of your silly confusions and revelations, the image in the mirror always manages a confident demeanor. You swell with pride at what you see - but pride tamed and refined by an overpowering sense of dignity. You almost feel as if you are nobility personified. Satisfied, you exit from the curtained off area.");
		output("\n\nHoliday casually glances your way, her eyes quickly going wide as she lets out a low whistle. <i>“Hot damn,”</i> she blurts, <i>“Looking like that, you’re going to be turning all kinds of heads.”</i>");
	}
	processTime(6);
	clearMenu();
	addButton(0,"Next",saurmorianTimes2);
}

public function saurmorianTimes2():void
{
	clearOutput();
	author("Aullama");
	//pc is changed to the following:
	if(pc.mf("m","") == "m")
	{
		pc.femininity = 0;
		pc.tallness = 96;
		pc.tone = 100;
		pc.thickness = 100;
		pc.hipRatingRaw = 4;
		pc.buttRatingRaw = 4;
		pc.hairLength = 0;
		pc.hornType = GLOBAL.TYPE_DRACONIC;
		pc.horns = 4;
		pc.hornLength = 18;
		pc.skinFlags = [GLOBAL.FLAG_THICK];
		pc.skinType = GLOBAL.SKIN_TYPE_SCALES;
		pc.scaleColor = "silver";
		pc.earType = GLOBAL.TYPE_LIZAN;
		pc.eyeType = GLOBAL.TYPE_NAGA;
		pc.tongueType = GLOBAL.TYPE_CANINE;
		pc.tongueFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_SQUISHY];
		pc.armType = GLOBAL.TYPE_LEITHAN;
		pc.armFlags = [GLOBAL.FLAG_SCALED];
		pc.faceType = GLOBAL.TYPE_LIZAN;
		pc.faceFlags = [GLOBAL.FLAG_MUZZLED];
		pc.legType = GLOBAL.TYPE_GRYVAIN;
		pc.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_SCALED];
		pc.tailType = GLOBAL.TYPE_LIZAN;
		pc.tailCount = 1;
		pc.tailFlags = [GLOBAL.FLAG_THICK,GLOBAL.FLAG_SCALED,GLOBAL.FLAG_LONG];
		//pc gains Igneous Heart perk
		//Fen: Noap.
		//pc gains +5 physique, -4 reflexes}
		pc.physique(4);
		pc.reflexes(-4);
	}
	//ifFeminine:
	else
	{
		if(pc.femininity < 75) pc.femininity = 75;
		pc.tallness = 84;
		pc.tone = 40;
		pc.thickness = 20;
		pc.hipRatingRaw = 4;
		pc.buttRatingRaw = 4;
		pc.hairLength = 0;
		pc.hornType = GLOBAL.TYPE_DRACONIC;
		pc.horns = 4;
		pc.hornLength = 12;
		pc.skinFlags = [GLOBAL.FLAG_SMOOTH];
		pc.skinType = GLOBAL.SKIN_TYPE_SCALES;
		pc.scaleColor = "silver";
		pc.earType = GLOBAL.TYPE_LIZAN;
		pc.tongueType = GLOBAL.TYPE_CANINE;
		pc.tongueFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_SQUISHY];
		pc.armType = GLOBAL.TYPE_LEITHAN;
		pc.armFlags = [GLOBAL.FLAG_SCALED,GLOBAL.FLAG_SMOOTH];
		pc.faceType = GLOBAL.TYPE_LIZAN;
		pc.faceFlags = [GLOBAL.FLAG_MUZZLED,GLOBAL.FLAG_SMOOTH];
		pc.legType = GLOBAL.TYPE_GRYVAIN;
		pc.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_SCALED,GLOBAL.FLAG_SMOOTH];
		pc.tailType = GLOBAL.TYPE_LIZAN;
		pc.tailCount = 1;
		pc.tailFlags = [GLOBAL.FLAG_SMOOTH,GLOBAL.FLAG_SCALED,GLOBAL.FLAG_LONG];
		//pc gains Flexible perk
		//Fen: Noap.
		//pc gains Igneous Heart perk
		//Fen: Norper
		//pc gains +2 reflexes, +3 willpower}
		pc.reflexes(2);
		pc.willpower(3);
		pc.physique(-4);
	}
	pc.taint(10);
	output("The unholy nurse coos as she leans in to examine you more closely, your own gaze following hers as she seems to take interest in the black material of the bodysuit. You gasp as, in the more scale-free bits of your chest and [pc.belly], it rapidly shifts to [pc.skinColor]. The rippling, tidal fashion in which it changes is a little unsettling - the ill-fitting giggle it draws out of Holiday even more so.");
	output("\n\n<i>“Oh please, it’s just the chameleon weave kicking in.”</i> There’s a pause as the pink haired demoness’ eyes travel downward, and her lips pucker in a small, bemused smirk. <i>“Well well, isn’t that something.”</i>");
	output("\n\nHuh? What is she looking at now?");
	output("\n\nYou look past your [pc.chest] to your crotch; is that a...");
	processTime(5);
	clearMenu();

	addButton(0,"Cock",saurmorianCockBoi);
	addButton(1,"Cunt",saurmorianVaginaBoi);
	addButton(2,"Both",saurmorianHermBoi);
}

public function saurmorianCockBoi():void
{
	clearOutput();
	author("Aullama");
	output("It is! Right on your groin sits a thick sheath of supple, scaly skin. Below, two heavy orbs are encompassed by the same soft hide, gently swaying between your legs with every movement. Reaching a clawed hand down to marvel at the plush spheres, you can’t help but let out a pleased sigh as you roll them in your palm - it feels <i>much</i> better than it has any right to. The warm tingling from your touch extends to inside your sheath, and you pull your hand back in alarm. There’s almost a sense of swelling, and stretching, from within the phallic hidey-hole - within <i>you</i> - but you shove that to the back of your mind with a moan as your sheath parts, sensitive flesh bulging around the unfamiliar head to an unfamiliar cock. Looks like this thing was made to have the whole male package, for some reason. You don’t remember seeing any of this before putting it on, but you’re hardly complaining...");
	output("\n\nSeveral fingersnaps bring your attention away from your loins and back to Holiday.");
	output("\n\n<i>“Oh wow. Ok, before you spend the night fapping the moment you put on a... uh, costume... let’s at least get you out into the crowd or something, not making a mess of my shop,”</i> she huffs, wrapping the end of her tail above your weighty balls and leading you right to the door. The feeling of her tail coiled around you and squeezing with every step pulls grunts of pained pleasure from your core, but this only seems to amuse the demonic nurse.");
	output("\n\nJust before the exit, she turns to you with a knowing smirk, leaning into you and boldly grabbing hold of your soft sack. <i>“Mmm, I’d warn you about having something like these out in the open, up for grabs, but you probably did that on purpose. You knew that saurmorians had such luxurious balls, didn’t you? People won’t be able to resist,”</i> she coos, and giggles as she feels your alien cock lurch further from its sheath, pressing into her arm, <i>“Well, aren’t you quite the dino-slut. Maybe we’ll run into each other out there.”</i> She releases you with one last teasing squeeze, dashing around you and giving you a hard shove out the door - which almost slams on your tail. The shop’s lights are out barely a moment later.");

	//pc's genitals changed to following:
	pc.cocks = [];
	pc.createCock();
	(pc.cocks[0] as CockClass).cockColor = RandomInCollection(["dark red","dark blue","purple","black"]);
	(pc.cocks[0] as CockClass).cType = GLOBAL.TYPE_SAURIAN;
	(pc.cocks[0] as CockClass).cLengthRaw = 10;
	(pc.cocks[0] as CockClass).cThicknessRatioRaw = 1.5;
	(pc.cocks[0] as CockClass).cockFlags = [GLOBAL.FLAG_BLUNT,GLOBAL.FLAG_SHEATHED,GLOBAL.FLAG_RIBBED];
	pc.balls = 2;
	pc.ballSizeRaw = 7;
	pc.ballEfficiency = 10;
	pc.refractoryRate = 5;
	pc.removeVaginas();

	processTime(3);
	clearMenu();
	addButton(0,"Next",saurmorianHalloweenAfterStuff);
}

//[Cunt]
public function saurmorianVaginaBoi():void
{
	clearOutput();
	author("Aullama");
	output("It is! Between your legs sits a lush, puffy vagina; so perfectly plump, it looks like it was designed for making the most enticing cameltoe - no matter what you’re wearing - and inviting as many teasing gropes and squeezes as possible. In fact, you can’t resist slipping a clawed hand down, gliding your fingers over your smooth vulva. You coo to the luxurious feel of your bodysuit’s lower lips - why it has any and why you can feel through them like they’re your own really don’t matter right now - and hiss as a small bud peaks out from its hood atop your mound, sending intense surges through your body as the sensitive bundle of nerves grinds and schlicks against your palm. You don’t remember seeing any of this before putting it on, but you’re hardly complaining...");
	output("\n\nSeveral fingersnaps bring your attention away from your loins and back to Holiday.");
	output("\n\n<i>“Oh wow. Okay, before you spend the night fapping the moment you put on a... uh, costume... let’s at least get you out into the crowd or something, not making a mess of my shop,”</i> she huffs, wrapping her tail around your thigh and pulling you towards the exit, her spaded tip prodding and toying with your luscious cunt. The feeling of that cursed tail persistently teasing your petite button with every step draws gasps of forced pleasure past your lips, but this only seems to amuse the demonic nurse.");
	output("\n\nJust before the exit, she turns to you with a knowing smirk, leaning into you and boldly squeezing your plump mound between two fingers, her thumb gently teasing your clit. <i>“Mmm, I’d warn you about having something like this out in the open, up for grabs, but you probably did that on purpose. You knew that saurmorians had such exquisite cunts, didn’t you? People won’t be able to resist,”</i> she coos, and giggles as she feels your dainty pearl stiffen further against her thumb and lavish amounts of your arousal drip through her fingers, <i>“Well, aren’t you quite the dino-slut. Maybe we’ll run into each other out there.”</i> She releases you with one last teasing squeeze, dashing around you and giving you a hard shove out the door - which almost slams on your tail. The shop’s lights are out barely a moment later.");

	//pc's genitals changed to following:
	pc.vaginas = [];
	pc.createVagina();
	(pc.vaginas[0] as VaginaClass).vaginaColor = pc.skinTone;
	(pc.vaginas[0] as VaginaClass).clits = 1;
	(pc.vaginas[0] as VaginaClass).type = GLOBAL.TYPE_HUMAN;
	(pc.vaginas[0] as VaginaClass).loosenessRaw = 0;
	(pc.vaginas[0] as VaginaClass).wetnessRaw = 4;
	(pc.vaginas[0] as VaginaClass).vagooFlags = [GLOBAL.FLAG_RIBBED,GLOBAL.FLAG_PUMPED]; //slightly pumped if not already, or fully if already slightly pumped
	pc.clitLength = 0.5;
	(pc.vaginas[0] as VaginaClass).bonusCapacity = 100;
	//if elasticity is less than 5, set to 5
	if(pc.elasticity < 5) pc.elasticity = 5;
	//remove any additional vaginas, and all cocks}
	pc.removeCocks();
	pc.balls = 0;

	processTime(3);
	clearMenu();
	addButton(0,"Next",saurmorianHalloweenAfterStuff);
}

public function saurmorianHermBoi():void
{
	clearOutput();
	author("Aullama");
	output("Oh fuck! This outfit seems equipped with both male <i>and</i> female genitals; right on your groin sits a thick sheath of supple, scaly skin with two heavy orbs hanging below, and between your legs sits a lush, puffy vagina - out of sight, but definitely not out of mind. Reaching a clawed hand down to marvel at the plush spheres, you can’t help but let out a pleased sigh as you roll them in your palm - it feels <i>much</i> better than it has any right to. The warm tingling from your touch extends to inside your sheath, and you pull your hand back in alarm. There’s almost a sense of swelling, and stretching, from within the phallic hidey-hole - within <i>you</i> - but you shove that to the back of your mind with a moan as your sheath parts, sensitive flesh bulging around the unfamiliar head to an unfamiliar cock. Behind your bulging sack, you can feel a dainty bud poking out from atop your cunt. Looks like this thing was made to have the entire package <i>and more</i> for some reason. You don’t remember seeing any of this before putting it on, but you’re hardly complaining...");
	output("\n\nSeveral fingersnaps bring your attention away from your loins and back to Holiday.");
	output("\n\n<i>“Oh wow. Ok, before you spend the night fapping the moment you put on a... uh, costume... let’s at least get you out into the crowd or something, not making a mess of my shop,”</i> she huffs, wrapping her tail above your weighty balls and leading you right to the door, her spaded tip toying with your petite clit. The feeling of her tail coiled around you - squeezing and prodding with every step - pulls grunts of pained pleasure from your core, but this only seems to amuse the demonic nurse.");
	output("\n\nJust before the exit, she turns to you with a knowing smirk, leaning into you and boldly grabbing hold of your soft sack. <i>“Mmm, I’d warn you about having something like these out in the open, up for grabs, but you probably did that on purpose. You knew that saurmorians had such luxurious balls and cunts, didn’t you? People won’t be able to resist,”</i> she coos, and giggles as she feels your alien cock lurch further from its sheath, pressing into her arm, <i>“Well, aren’t you quite the dino-slut. Maybe we’ll run into each other out there.”</i> She releases you with one last teasing squeeze, dashing around you and giving you a hard shove out the door - which almost slams on your tail. The shop’s lights are out barely a moment later.");

	//pc's genitals changed to following:
	pc.cocks = [];
	pc.createCock();
	(pc.cocks[0] as CockClass).cockColor = RandomInCollection(["dark red","dark blue","purple","black"]);
	(pc.cocks[0] as CockClass).cType = GLOBAL.TYPE_SAURIAN;
	(pc.cocks[0] as CockClass).cLengthRaw = 10;
	(pc.cocks[0] as CockClass).cThicknessRatioRaw = 1.5;
	(pc.cocks[0] as CockClass).cockFlags = [GLOBAL.FLAG_BLUNT,GLOBAL.FLAG_SHEATHED,GLOBAL.FLAG_RIBBED];
	pc.balls = 2;
	pc.ballSizeRaw = 7;
	pc.ballEfficiency = 10;
	pc.refractoryRate = 5;
	
	pc.vaginas = [];
	pc.createVagina();
	(pc.vaginas[0] as VaginaClass).vaginaColor = pc.skinTone;
	(pc.vaginas[0] as VaginaClass).clits = 1;
	(pc.vaginas[0] as VaginaClass).type = GLOBAL.TYPE_HUMAN;
	(pc.vaginas[0] as VaginaClass).loosenessRaw = 0;
	(pc.vaginas[0] as VaginaClass).wetnessRaw = 4;
	(pc.vaginas[0] as VaginaClass).vagooFlags = [GLOBAL.FLAG_RIBBED,GLOBAL.FLAG_PUMPED]; //slightly pumped if not already, or fully if already slightly pumped
	pc.clitLength = 0.5;
	(pc.vaginas[0] as VaginaClass).bonusCapacity = 100;
	//if elasticity is less than 5, set to 5
	if(pc.elasticity < 5) pc.elasticity = 5;

	processTime(3);
	clearMenu();
	addButton(0,"Next",saurmorianHalloweenAfterStuff);
}

public function saurmorianHalloweenAfterStuff():void
{
	clearOutput();
	showBust("SAURMORIAN_WOMAN");
	showName("\nPARTY!");
	author("Aullama");
	output("A shiver runs down your spine as you feel the wind’s caress through the bodysuit, causing your scales to rattle against each other. Right, you’re still effectively naked... You cast a glance back towards Holiday’s store, but quickly turn away with a dismissive huff; oh well, let prying eyes look upon your regal form, then, ");
	if(pc.exhibitionism() < 33) output("regardless of how embarrassing");
	else output("especially given how exciting");
	output(" it’ll be. You make your way back to the main streets and, steeling yourself, " + pc.mf("stomp","stride") + " into the crowd with your head held high - which isn’t that difficult, with everyone seeming at least a head shorter than you. Though with so many bodies virtually pressing together as parade floats go by - some swaying with one another, others grinding and squirming against each other, against <i>you</i> - you’re soon panting heavily as your ");
	if(pc.exhibitionism() < 33) output("shameful ");
	output("arousal mounts, and your body feels hotter and hotter in a sea of condensed, musky warmth.");

	output("\n\nIn your growing excitement, the thought of opening the bodysuit to cool off completely escapes you.");

	//hasCockFromCostume:
	if(pc.hasCock())
	{
		output("\n\nWith every beat of your heart, more alien cock lurches and slides forth from your crotch to sway enticingly as you move, bobbing in time with the bouncing sack between your legs. That primal member thickens, hardens, growing more erect with every lustful glance cast its way. You moan once the blunt tip starts throbbing, and suddenly realize you’re flinging generous amounts of pre everywhere with your motions.");
	}
	if(pc.hasVagina()) 
	{
		output("\n\nYou flush furiously as you try to move among the crowd, every careful step accompanied by juicy schlicks and sparks of pleasure as those plump lips between your thighs grind, slip, and slide against each other. All too soon, [pc.girlCum] begins trickling down your thighs and dripping onto the ground. With the scent of more feminine excitement in the air, you quickly have the attention of many sharp noses and snouts.");
	}
	output("\n\nAnd just like that, those curious glances turn to devilish gropes, tender caresses, more than a few probes and slaps and - it’s too much! But you resist the urge to jump after every grabby reveler - an alien sense of pride keeps you from settling with the easiest lay - and instead continue following the crowd. Your eyes scan the masses, but you just can’t find someone that can match your inner fire... Or something. It completely escapes you that what you’re looking for is another saurmorian.");
	output("\n\n<i>Fuck</i>, your blood feels hot enough to boil!");
	output("\n\nAnd then you see it; a flash of silver, and a feminine figure enters a dark, almost derelict building. <i>Who the fuck was that, and why were they so alluring</i>?");
	output("\n\nAfter ducking and dodging through the crowds, edged and tormented by libidonous hands, you finally find yourself in front of that ominous structure. This building stands out to you, seeming different from any you’ve seen so far, but you can’t pinpoint why... Curious at this sight - every other building you can see is either closed, or filled with party goers - and figuring you might as well try to meet the enchanting figure you saw before, you’re drawn inside. The moment your tail-tip is in, the automatic doors close shut behind you, muffling and then silencing any outside noise.");
	output("\n\nFeeling somewhat off ever since putting on this costume, frustrated by teasing strangers, and even now horny out of your mind, you find yourself struggling to care when you casually turn back and, lo and behold; the door’s locked! Isn’t that great. There’s no sign of anyone nearby and now would be a good time to relieve some stress, you figure, and spend a moment searching for the suit’s zipper.");
	output("\n\nYou can’t find it. Your chest heaves in a sigh. That’s odd... The place seems less like a store or a club, you note as you look around, and more like a chapel... no, a <i>cathedral</i>. On the far end, past numerous piles of debris and rubble, you spot the altar; a great stone slab, marred by only the barest of chips and cracks. Strangely, every statue within sight is ruined except for one. An incredibly cute and attractive gargoyle of some sort hunches over limbs shackled in restraints of gold, as stock still as the very rubble surrounding her.");
	output("\n\n<i>“You shouldn’t be here,”</i> a sharp, feminine voice rings out from behind you.");
	output("\n\nYour claws grind against the ground as you whirl on the spot, almost tripping yourself. A great gasp escapes you once you see the voice’s owner; a tall, lithe figure stands before you, the feminine body covered in elegant silver scales that mark her as saurmorian. Though, now that you’re allowed a good look, you notice more matronly curves than you feel is usual for a saurmorian, her chest capped with luscious globes that bulge against her monokini of a uniform. It hugs her closely, complimenting her curves on an otherwise still-sleek form. Her reptilian face shows the beginnings of the lines of age and stress, lending her brilliant green eyes a hint of wisdom.");
	output("\n\nMistaking your silence for confusion, she crosses her arms over her chest, compressing those perfect mounds. <i>“You’re disobeying my orders. Everyone onboard was told-”</i> she suddenly growls, noticing your nudity for the first time, <i>“-oh for... You’re even violating the dress code.”</i> Her tail begins to sway in agitation, but quickly settles as she looks you over, raising an eyebrow instead. <i>“Oh I see; drink the tapwater or something, did you?”</i> she quips, cocking a curvy hip.");
	output("\n\nRather taken aback, you struggle for a response - you’re not under her command, let alone an actual <i>saurmorian</i>. But anything you say falls on deaf ears.");
	output("\n\nTaking a token look around, the imposing woman swiftly strips of her regalia, baring the silky obsidian hide of her torso and nethers - her plump slit already weeping with excitement - as well as letting her perky, motherly breasts free! <i>“This will come back to bite me in the ass, but </i>fuck it<i>. I haven’t cut loose in years,”</i> she mutters, both for you and herself you think. She orders you to approach, and in a flash the both of you are clinging to each other.");
	output("\n\nShe eyes your crotch hungrily.");
	if(pc.isHerm()) output("\n\nThe only question is; which will she choose?");
	processTime(35);
	clearMenu();
	//[Cock] //requires cock
	//[Cunt] //requires cunt
	if(pc.hasCock() && !pc.hasVagina()) addButton(0,"Next",zeLadyLikesZeCawk);
	else if(pc.hasVagina() && !pc.hasCock()) addButton(0,"Next",vaginaSaurmorianFun);
	else
	{
		addButton(0,"Cock",zeLadyLikesZeCawk);
		addButton(1,"Cunt",vaginaSaurmorianFun);
	}
}

//[Cock]
public function zeLadyLikesZeCawk():void
{
	clearOutput();
	showName("\nSEX!");
	author("Aullama");
	output("A moan slips past your lips as your prehistoric penis rubs against a smooth thigh, the delicate friction causing your flagging erection to surge back to life - and a pleased coo from the sultry saurmorian as she feels your hardening length. Her emerald eyes meet your [pc.eyes] in a smoldering gaze as she runs her hands along your sides, claws tracing metal scales. Letting out a breathy exhale, she glides down your body; her soft flesh sending delightful sensations up your spine. Upon reaching your groin, she slips her hot cleavage around your member.");
	output("\n\nThe pretty lizard quickly has you rock hard and practically gushing pre between her tits as she milks your ribbed prick, every practiced undulation creating yet more wet and slick perfection. You clutch onto her shoulders, grunting as your hips twitch and jerk to meet her jiggling rack. All that time wandering around, being teased and edged by strangers, and now finding this mystery woman has left you incredibly sensitive, and all too soon you’re reaching your peak - a dense tension growing tighter in your abdomen.");
	output("\n\nNoticing your predicament, she slows down her movements and squeezes her breasts even tighter around your pulsating rod, and asks in a steady voice, <i>“Oh shit, you almost as pent up as I am, aren’t you...? I know you need to cum. I know you want to burst load after juicy load between my tits - the lovely tits of your commanding officer I might add - and just glaze my entire body. I know this because you’re </i>going to do it<i>.”</i> She’s right; her tone will allow nothing else, and you moan and gasp as - with one last thrust - you hilt yourself against those picture-perfect breasts, your middle clenching and spasming as your sloshing balls pull close.");
	output("\n\nYou throw your head back with a roar of ecstasy as your bloated cock goes off like a geyser. The first pulse of molten seed drenches the officer’s torso, the next splashing off her neck and jaw - and you just keep going, like a kui-tan that hasn’t cum in weeks. Your reptilian mistress coos with every jerk and twitch of your prick, soon resorting to strained grunts as she all but grinds her body into you.");
	output("\n\nShe abruptly shoves against you, hard, and sweeps your legs out from under you. You yelp, slamming onto your back with a loud <i>thunk</i> and the next thing you know, a cum drenched, lust crazed saurmorian matron straddles your waist with your still-spurting shaft clenched tightly in her hand. Lining the blunt head up with her swollen vulva, she idly grinds the tip back and forth as she eyes you thoughtfully. <i>“Mmm, when was the last time you had a titjob from a kinsman, kinsman? Or... have you ever?”</i> She shakes her head, <i>“Not like it matters. As far as anyone is concerned, it’s just me here, and you’re </i>all mine<i>.”</i> Grabbing your snout, she tenderly tilts your nose back, baring your throat for her other hand to cling to the same moment she drops her hips, spreading her thick labia and impaling herself on your shaft.");
	output("\n\nThe matron’s breath hitches as your loins meet, her curvy body twitching and lurching in uncontrollable spasms. Sweet smelling femcum splashes past your rod, dousing both of your lower bodies in her feminine musk. Eventually, she stops her writhing and squirting and collapses atop you, panting from her full body orgasm. <i>“Ohhhh fuck I missed this...”</i> she coos, reaching up and affectionately caressing your snout with both hands, <i>“Should I get you a change of station? So you can serve directly-”</i> her cunt clenches on your primal penis, a mix of femcum and [pc.cum] splattering your sheath, <i>“-under me. Maybe promote you to my second. Be on hand whenever I. Need. You.”</i> She starts rolling her hips with every syllable, her gentle hands turning possessive, clinging to you fiercely. <i>“Or maybe. Even. M-make you. My o-one. Have-you-locked-up. All mine!”</i> Once again you feel molten pleasure flow out from your clenching cum tanks, the greedy saurmorian’s pussy - just like your rod - is lined with thick ribs and ridges that tug and pull for more cum. The only thing you can do is give in.");
	output("\n\nShe hisses with steamy breath to the feeling of your seed pouring almost straight into her womb, her lithe but curvy body going taut as she experiences another mind shattering climax. You flood her womb with yet another thick burst of seed as she thrashes on top of you, her taut tummy getting slightly rounder before [pc.cumColor] streams are forced out between your cock and her stretched walls.");
	if(pc.hasVagina()) output(" You whimper as you feel hot runnels drip down the lips of your neglected cunt, all but forgotten by the cock hungry mistress.");
	output("\n\nLooking back down at you, she hums and drags her claws down your [pc.chest]. <i>“Hmm, I know. I can’t keep you,”</i> she moans. Her hot breath washes over you as she draws her soft tongue down your jaw, stopping to nuzzle her face against yours before whispering, <i>“But. We. Are. Not. Done.”</i>");
	output("\n\nHer hand clenches tight around your throat, cutting off your breath.");
	pc.cockChange();
	//pc is Cum Soaked and Pussy Drenched
	pc.applyCumSoaked();
	pc.applyPussyDrenched();
	processTime(60);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",saurmorianSaulMorian);
}

//[Cunt]
public function vaginaSaurmorianFun():void
{
	clearOutput();
	showName("\nSEX!");
	author("Aullama");
	output("A deceitfully soft smile spreads across her snout, and her clawed hands cup your own muzzle. <i>“I’m always willing to be of service to those under my command, but I’m only going to do so if you are able to service me in turn...”</i> she murmurs. As if to make her point clear, she slips a hand atop your head and gently presses down. You acquiesce, and slowly make your way down her body at her insistence.");
	output("\n\nAs you pass those glorious tits, a perky, onyx colored nipple demands your attention. Homing in on the pert bud, your tongue darts out with a slick sound to smack it and the surrounding titflesh. The matron lets out a gasp that sends her chest bouncing, surprised but hardly displeased. All at once the direction she’s pressing you completely shifts as she releases some of the most lecherous moans you’ve ever heard and shoves your face against her breast. Your tongue is shoved straight back into your maw - followed by a mouthful of jiggly boob. You reflexively try to pull back, but the domineering woman holds you close. With a moan, you give in to her motherly presence. You feel increasing amounts of [pc.girlCumNoun] drip down your thighs");
	if(pc.hasCock()) output(", and off-[pc.cumColor] precum leak from your blunt tip");
	output(" as your arousal rises, but you keep your hands locked on your partner.");

	output("\n\n<i>“Oh yessssss,”</i> she hisses, rolling her head back as she savors the moment, <i>“You know just how to get an old matron going, don’t you? Of course you do... You’ve probably had your eyes on these ever since you were assigned to me.”</i> She frees a hand to grope and squeeze her unattended breast as you suckle away, momentarily devolving into bestial grunts and growls of pleasure that send vibrations through her chest. ");
	//pcChestSize>=3: 
	if(pc.biggestTitSize() >= 3) 
	{
		output("Her emerald gaze, meanwhile, is turned to your own [pc.chest], squishing and grinding into her midriff. <i>“Hmmm, you look to have had more than a few clutches yourself,”</i> she hums, reaching down and caressing a [pc.nipple]. You moan and lean into her touch");
		if(pc.isLactating()) output(", [pc.milk] leaking from your [pc.milkyNipple] and over the saurmorian matron’s hand and middle. She paws harder at your teat and sneers down at you. <i>“Maybe more than a few </i>recently<i>,”</i> she hisses cooly");
		output(". ");
	}
	output("You’re abruptly pulled away from the precious boob, strands of saliva bridging to your panting maw, and pushed to the ground; landing on your back with a hard <i>thunk</i>.");

	output("\n\n<i>“That’s enough of that. You look quite thirsty, and I could use a drink,”</i> she husks, rubbing her slick thighs together as a sweet scent saturates the air. Knowing where this is going, you part your thighs for your saurmorian mistress and cling to her round ass as she slithers onto you.");

	output("\n\nWedging between you and the floor, her armored tail lifts you closer to her swollen pussy, the jerky motions smearing your snout against her soaked thigh and sliding up until your nose bumps her lips. Licking your lips, you’re pleased to discover she tastes just as sweet as she smells, with only a slight tang. Delicious! You eagerly flop your soft tongue onto her mons and, slowly, draw your oral muscle over her clit and along her smooth labia as savor her flavor. And again-");

	output("\n\nAs soon as your canine-like tongue returns to her clit, the matron above you half screams half roars in ecstasy, arms and legs gripping you tightly, and she writhes and thrashes uncontrollably. The older woman’s juicy pussy gushes her tasty femcum onto your tongue with every contraction, your throat bobbing as you happily gulp down the liquid ambrosia that hasn’t drenched your face. A few last hard thrusts against your snout and growls of exertion, and then she’s limply rolling off of you.");

	output("\n\nBefore you can move, she’s holding up a clawed hand in a bid for you to stay still as she catches her breath, chest heaving. <i>“I didn’t forget you. Just... Just give me a moment,”</i> she rasps. Once she calms her breathing, she crawls towards you on hands and knees as her movements turn from flaccid to sultry. Slithering between your legs, her hands part your thighs further so she can take in your own puffy, wet cunt, her nostrils flaring excitedly.");

	output("\n\nHer claws draw a gasp from you as they trace your entrance, ");
	if(pc.hasCock()) output("a spurt of pre lurching onto your [pc.belly] ");
	output("and she giggles quite girlishly at your reaction. <i>“Oh my scales - I don’t know your name, but I hope to get your station changed soon. I could just keep you, with the way you eat pussy; and you certainly are <b>cute</b>!”</i> the saurmorian coos, seeming to not realize you hardly licked twice. Her claws continue running up and down your lower lips, the slick friction setting your nerves alight. Sliding those fingers in to the first knuckle, the lizardly matron takes a moment to test your slit; lightly twisting and turning her digits while dragging them up and down, expertly following along as your hips twitch and jerk. Your moans and gasps start echoing throughout the cathedral as you begin to surrender to her touch. She then spreads your entrance wide - seeming to ignore your pleasured cries - and her chest rumbles appreciatively as your [pc.girlCum] freely streams from your tunnel, soaking her hands further.");
	output("\n\nThere’s a pause, as if she’s waiting for your sizzling nerves to calm. But as soon as you cast her a curious glance, the saurmorian officer hilts both fingers and mashes her thumb against your clit. You scream as you’re forced over the edge, your ribbed vagina clenching <i>hard</i> on her thrusting digits and drenching her arm in [pc.girlCum] with full body contractions");
	if(pc.hasCock()) output(", while your sloshing balls clench tightly against you and your thick fuckstick surges with seed, drenching your [pc.belly] and [pc.chest] with ever increasing shots of cum");
	output(".");

	output("\n\nBut she doesn’t stop. Your curvy mistress continues thrusting in and out of your soaked quim and strumming your petite clit, and you arch your back more with thunderous climax she brings you to. Reaching up, she abruptly clenches tightly around your windpipe.");

	output("\n\n<i>“Oh no, cutie,”</i> she growls, <i>“We. Are. Not. Done.”</i>");

	//pc is Pussy Drenched {and Cum Soaked if they have a cock}
	pc.applyPussyDrenched();
	if(pc.hasCock()) pc.applyCumSoaked();
	processTime(60);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",saurmorianSaulMorian);
}

//[Next] //Epilogue
public function saurmorianSaulMorian():void
{
	clearOutput();
	halloweenShipMove();
	author("Aullama");
	showName("\nAFTERMATH");
	output("Things get quite fuzzy after that; the saurmorian matron uses you, <i>toys</i> with you, again and again as the cathedral gradually becomes saturated with your steamy exertions. Loud groups of people dressed as angels and demons of numerous kinds enter the large building, and <i>that</i> is when the night got out of hand. Your reptilian mistress didn’t care, and must have continued playing with your body, you’re pretty sure. Drinks were passed around. Maybe. More than a few of your new friends joined in. Maybe. And you think you recall a pink-haired demon joining the fun; she kind of looked like Holiday. Everything else...");
	output("\n\nYour head hurts trying to put everything together, and you sit up - hissing as sore muscles protest. Shaking yourself awake, you look around and find yourself... back on your ship? Strange; you’re back in your quarters, ship idling in space, and even your equipment was returned. Noticing a new message in your logs, you hit play, the face of a cute, white haired kaithrit greeting you once you bring it up on the main screen.");
	output("\n\nThere’s a pause as she glances around, before giving a nervous wave, <i>“Hi. You uh, probably don’t remember me - it got pretty wild, and you were really out of it - but partying with you was a blast. Even though things got serious by the end...”</i> She chews her lip, thinking over her words. <i>“I have no idea where you got that bodysuit, but... regardless, that was an incredible piece of tech you got your hands on. Nor do I know why one was made after a saurmorian, but it seemed to have spooked somebody; GPD eventually stormed the place, followed by SBC security.”</i>");
	output("\n\n<i>“Lucky for you I work for Customs. I was able to get you out before you were snatched up. I owed you anyways, after you...”</i> she coughs and fans herself, a blush spreading across her cheeks, <i>“...uh, did the thing. Whatever. Yeah. This pink-haired babe helped as well. Said she’d take care of the costume and get you things to wear. She seemed to have everything covered. Looks like you’ve got some nice people watching over you, whoever you are.”</i> She starts, jumping as if suddenly remembering something she forgot. <i>“Oh yeah! That saurmorian that was riding you all night? She uh, got held up by the GPD, but I wouldn’t worry about her coming after you or anything. Hell if I know what rank she had, but she looked pretty sharp; I’m almost certain she knew you weren’t actually one of hers, and it’s probably enough of a scandal on her end without stirring up any trouble. Anyways, um... I’m pretty bad at this, but if I don’t see you again, bye!”</i> She stares for a moment, looking a little self conscious, but the video ends before it can get awkward.");
	output("\n\nWell fuck. At least Holiday didn’t rob you blind; she gave you your shit back. You sigh as you reach for the suit’s zipper, but find nothing. Right, she said Holiday took the costume back didn’t she? But why do you still have the mask on? Unless...");
	output("\n\nLooking down, you see the same sight from last night; hard silver scales, clawed hands and feet, armored tail, everything.");
	output("\n\n<b>Looks like you’re a " + pc.mf("tanky","elegant") + " lizard now. A saurmorian.</b>");
	processTime(75);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Poe A costume
//Garb of the Hero (description)- A forest green pointed hat droops over the head of a mannequin, with a matching green tunic and white tights. A pair of brown leather boots and gauntlets lay strewn across the floor. [If PC has read Syri's book about fantasy] You remember hearing Syri talking about how dreamy the character was. Maybe it will make you look great too?
//Price: 1000 credits

//Requirements- humanoid/ non-taur body, male genitalia, no female genitalia

//Garb of the hero
public function heroGarbCostume():void
{
	clearOutput();
	showHoliday();
	author("Fenrirskoll");
	output("Next to the rack of costumes, you see a mannequin sporting a green and white outfit. The costume seems sort of childish, but also heroic. ");
	//If PC has read Syri’s book about fantasy
	if(flags["SYRI_FANTASY_TALKED"] != undefined) output("You remember Syri spending hours talking about the character, and the sort of fantasy adventures he went on (not to mention all the girls fawning over him). ");
	output("The material feels much softer than it looks, but at the same time it’s a bit thicker and heavier. You guess the costume is more for LARPing than a going to a party. The leather is also unblemished and high quality. Whoever made this had good tastes!");

	output("\n\nHoliday seems to pop out from behind the costume. <i>“Hello-o? Terra to Steele? Have you picked a costume yet? I gotta close up soon!”</i> Looking at the costume, she gets an almost hungry grin and leers at you. <i>“Thinking about going into some dungeons full of monsters to ‘save’ some damsels? Or maybe you just want to ‘slay’ the monsters?”</i>");

	output("\n\nWould you like to buy the garb of the hero, or select another costume?");

	processTime(3);
	clearMenu();
	addButton(0,"Buy It",buyDatHeroCostumeYo,undefined,"Buy It","Costs 1000 credits.");
	addButton(14,"Back",holidayCostumeMenu);
}

//Buy it
public function buyDatHeroCostumeYo():void
{
	clearOutput();
	showHoliday();
	author("Fenrirskoll");
	flags["HOLIDAY_OWEEN_PURCHASE"] = "garb of the hero";
	pc.credits -= 1000;
	output("<i>“I’ll take it,”</i> you say as you transfer her the credits.");
	output("\n\nShe smiles, <i>“Much obliged. You can get changed here.”</i> You look at her gobstruck. <i>“...What?”</i> she explains, <i>“We don’t have any changing rooms. Besides, no one is here, and since the costume comes with a prop, I’ll be too busy looking for it. Now hurry your ass up! The night is getting on, the party is raging, and I have to start packing this crap up!”</i> You watch her ass wiggle as she disappears behind a stack of boxes. You only had qualms about changing in front of her because the party isn’t the only thing that is raging. Your [pc.cockBiggest] tool is pointing up towards your [pc.belly] as you begin to remove your clothes and don the new ones.");
	output("\n\nThe white tights stretch effortlessly to fit you");
	if(!(pc.lowerUndergarment is EmptySlot) || !(pc.upperUndergarment is EmptySlot)) 
	{
		output(", but you notice that your underthings are visible under them and make your outfit look unflattering");
	}
	output(". You decide to go without, and maybe even give others something to look at with these form-fitting clothes. You shimmy into the over-sized forest green tunic, cinching the tool-belt tightly onto your waist. The boots slide on nicely but you worry about the quality of the leather... As you strap on your gauntlets, you notice a tingling sensation in your arms now, as well as your legs from before. Perhaps they’re too small and your blood is not flowing correctly? You should’ve asked Holiday if she had this outfit in a size up.");

	output("\n\nYou look at the final piece of the outfit, the hat. It looks a bit silly, and you’re curious as to how it going to stay on your head with no way to secure it. You shrug and shove your head into the hat, and to your surprise it’s a perfect fit! It must have some sort of special grips around the edge. You’re starting to feel a bit like a real hero, with such an outfit you’ll be unbeatable, you think to yourself.");

	output("\n\n<i>“Lookin’ good, Hero!”</i> Startled, you jolt from the sudden noise and end up slipping on your gear on the floor, banging your head. You look up to see see Holiday standing there holding two swords in sheaths. <i>“Get up! We don’t have all night!”</i> You scramble back a few feet before jumping up ready to run from the now armed demoness. <i>“Relax!”</i> she says in response to your reaction. <i>“These are just the props I mentioned, they aren’t even real! I forgot that there were two swords but you can only have one. And don’t worry about your clothes and things, I’ll look after them.”</i>");

	//[Take the longsword] [Take the shortsword]
	processTime(5);
	clearMenu();
	addButton(0,"Longsword",takeTheLongswordHero);
	addButton(1,"Shortsword",shortswordCrushingIt);
}

//Longsword (Path A)
public function takeTheLongswordHero():void
{
	clearOutput();
	showName("BEAUTIFUL\nSWORD");
	author("Fenrirskoll");
	output("The blue handled long sword looks very familiar. You’ve seen it a few times before. But this edition looks a bit... Well, more sexual. The pommel looks like a big pair of testes and the handle looks like a phallus with a yellow jewel at the tip. The sheath is a simple blue design with gold embossing. Is this the sword you pick, or do you want the other?");

	processTime(1);
	clearMenu();
	addButton(0,"Yes",yesTakeTheLongsword);
	addButton(1,"Shortsword",shortswordCrushingIt);
}

//[Yes]
public function yesTakeTheLongsword():void
{
	clearOutput();
	showName("BEAUTIFUL\nSWORD");
	author("Fenrirskoll");
	output("You find it hard to speak as you gaze at the swords. Instead, as if by instinct both your hands reach out and grab the long sword from her, effortlessly attaching the sheath onto your belt. You pull the sword out of your sheath and take a few play swings with it on the mannequin. You nod at Holiday and tuck a stray lock of golden hair behind your ear. ");
	//if hair isn’t blonde- 
	if(pc.hairColor != "blonde") output("You’re not blonde... It must be the dim lighting playing tricks on your eyes! ");
	output("You open your mouth to ask but Holiday begins pushing you out of the store. <i>“No more talking, you have a carnival to get to and I’ve got stuff to do.”</i> With a final shove she slams the door behind you and flips her sign to closed. You sigh, wishing she would practice better customer service skills, but decide to get to the festivities.");

	processTime(1);
	clearMenu();
	addButton(0,"Next",yesTakeTheLongswordNext);
}
public function yesTakeTheLongswordNext():void
{
	clearOutput();
	showBust("YZZA");
	showName("\nPARTY!");
	author("Fenrirskoll");

	output("You step into the crowds on the main street, eager to find some fun. Trying to stand out more in a sea of cool costumes, you puff out your chest to look more heroic");
	if(pc.biggestTitSize() > 1) 
	{
		output(" to give more of a show, your ");
		if(pc.hasDickNipples()) output("[pc.nippleCocks]");
		else output("[pc.nipples]");
		output(" hardened and very visible");
	}
	output(". You feel your tights getting tighter as you go, although oddly enough, your tunic begins to fit better. But as you walk you realize that people step back when they see you walking by. You guess it’s because they don’t want to get hit with the sword, accidentally or not. You decide to return your weapon back to its sheath.");
	if(pc.tallness < 62) output(" These boots must have a platform function, because you are able to see people at eye level. You guess that no one would take a short hero seriously.");
	else if(pc.tallness < 67) output(" These boots must add a few inches, probably to make the wearer look more heroic and imposing.");
	else output(" You must have really banged your head hard back there, because you are seeing things from a lower point of view.");

	output("\n\nAs you walk by you see a few people casting glances at your crotch. One kaithrit girl’s eyes visibly widen, even behind her zombie mask, as she makes an audible gasp. Her ausar boyfriend’s mouth drops and he starts to pant, his tail whacking the cape of his vampire costume. You hear a kui-tan lady dressed as a manticore let out a wolf whistle before slapping your ass with her tail. Lots of girls and even a few men seem to be biting their lips in lust while leering at you. As you navigate through the crowd, you let out a series of apologetic hand motions, but people don’t seem to mind grazing against your body. As you get deeper into the crowd, you could almost swear people are trying to get in your way just to cop a feel or two. You glance down to see that your form-fitting tights seem to be really accenting your package");
	if(pc.biggestCockLength() < 12) output(" making it look larger than you remember");
	output(". You smile and begin to strut with more confidence, enjoying the new attention.");

	output("\n\nYou hear a muffled yell down an alleyway and the sound of a scuffle. If you really wanted to play the part of a hero, now is your chance! You turn and run down the alley, intent on helping the girl who screamed. Down the path some ways, almost hidden by the shadows, you see a large (mostly)-naked female gryvain.... But something is off about her. Her scales are red, not a natural color for gryvains, and she only has two wings. Maybe a gryvain morph? She wears an extravagant armor of golden scales adorned with faceted rubies, more show than protection, leaving her supple breasts out and her stomach open to touch. The bottom half lies on the floor in a crumpled heap, forgotten. You hear the sound of metals scraping as you see her bangles and anklets rubbing against the pavement with every twitch of her body.");

	output("\n\nHer muscles bulge as she pins her prey to the ground, her large breasts envelope her prey’s face, while her drooling twat is doing its best to get any kind of stimulation it can. You are so distracted by her looks that it isn’t until a moment later that you register her prey is actually a person. You step forward and let out a loud cry to catch her attention. The gryvain morph turns to you, bothered by the interruption. <i>“Get lost kid, can’t you see we are having a moment?”</i> Your words catch in your throat, but not from fear as you manage to step towards her menacingly. The dragoness drops her prey to the floor and stands up straight, towering over you.");
	//if height is over than 84 inches-
	if(pc.tallness > 84) output(" You’re are sure you are supposed to be seeing her eye to eye, but all you are getting is an eyeful of her breasts.");
	output(" Her horns, although small for gryvains, look sharp and imposing. <i>“Unless you want to take her place, you’ll scram,”</i> she growls. You let out a grunt, puff your chest out, and thrust your crotch forward in challenge. If she wants to fuck, you’ll fuck her into submission. Besides, what better way to slay a dragon than with a sword?");

	output("\n\nThe dragoness pushes you down with a lunge and pins your arms down with one hand. Her free hand roughly claws at your clothes trying to tear them to pieces. After realizing just how durable your tunic is, she pulls it above your head and uses it to bind your hands. Now with the use of both hands she can get those tights off your body. Finally free of the compressing fabric, your tool excitedly pops out");
	if(pc.cocks[pc.biggestCockIndex()].cType != GLOBAL.TYPE_HUMAN) output(" and you are shocked to see it’s become a human’s dick!");
	else output(".");
	if(pc.skinTone != "fair") output(" You are surprised to see that all your skin has become fair! Maybe it’s just the bad lighting?");

	output("\n\nThe dragoness licks you with her long forked tongue starting from the stomach, up your chest");
	if(pc.biggestTitSize() >= 1) output(", through the valley");
	output(", up your neck until her mouth is right next to your ear. <i>“What a tasty offering you make. I’m going to enjoy this battle.”</i> Out of the corner of your eye you see her smirk before biting your ear. OW! That hurts! Seems she like to play rough. ");
	if(pc.earType != GLOBAL.TYPE_SYLVAN) output(" The pain dulls after a few seconds, and you realize that the pain is oddly further away from your head than you would expect. Did your ears get longer?");
	output(" The dragoness pulls back and leers at you, her eyes meeting yours. <i>“It’s Yzza, by the way. So you know what name to scream out as I fuck you into the pavement.”</i>");

	output("\n\nYzza straddles you, mashing her twat on the underside of your tool, and begins to grind onto you. You try your best to take control of the situation, but her size and the lack of your hands makes it hard to do much of anything. She slides up and down your length, the sheer amount of pussy juice drenches your privates and drips down your thighs, soaking the ground beneath you. <i>“Just to make sure you are ready for me, how about I pump you full of my dragon venom?”</i> Reaching over to a mostly empty bottle under the pants of her armor, she grips the neck and bring it to her lips. You see the remaining few drops enter her mouth. Her tongue swirls it on her her teeth before she bends over and bites your neck hard enough to break the skin. She holds her bite and you feel a warmth spread through your body. Your muscles don’t listen to your commands as they should, and your shaft hardens to an almost aching level. Raising her hips, she decides to get to the main event and lines up your tip with her hungry hole. She slams her hips down unceremoniously, completely hilting herself on you. She feels like a hot, raging inferno as her pussy clenches on the new intruder.");
	pc.cockChange();

	output("\n\nA moan reverberates from her throat into your neck before she lets go, tongue lolling out. <i>“How are you liking the myr venom, hun?”</i> she purrs. <i>“Not enough to mess you up, but just enough to help get the show going.”</i> She starts to ride you, occasionally bucking hard, her strong hips pounding yours into the sopping wet ground. She rides you relentlessly");
	if(pc.hasDickNipples()) output(" while sucking your [pc.nippleCocks]");
	output(", her hands groping everything they can, leaving behind small scratches, all the while moaning harder than a starved galotian promised gallons of cum. Judging by the size of the bottle and how little there was left, she must have dosed herself with a lot of the venom... This might actually be a good thing. You figure that she might be stronger and in control for now, but she will have less stamina and won’t outlast you in this battle.");

	output("\n\nShe pulls your tied arms up over her head and around her neck while shoving a tit in your mouth. You suck on it as hard as you can, you nibble and bite and tug as your hips gyrate beneath her, trying to bring her closer and closer to her orgasm. You feel your own coming closer and closer, and you worry that you will blow before she does, even with all the venom in her system. Just when you are ready to give in and rut like an animal, a sudden choking sensation grips you. Her tail had snuck its way up during the frantic fucking and was now wrapped around your windpipe. You almost begin to black out when you feel her pussy tighten like a vice around your dick as she lets out a blissful yell. She shakes and twitches as her hungry snatch milks you for all you’re worth, and the sensation is too much to disappoint.");
	if(pc.cumQ() < 300) output(" You stop holding back and cum, holding her tight against you as you spurt deep into her.");
	else if(pc.cumQ() < 10000) output(" No longer able to hold back, you push as deep as you can into her and let loose, painting every bit inside of her white with your cum. She coos happily as her belly develops a paunch from the amount you are unloading in her.");
	else output(" The dam breaks inside of you and torrents of cum come spurting out of you. A normal girl would had been forced off your rod by the sheer amount of jizz and the force at which it comes out. Instead, her eyes roll back in her head and a deep satisfied moan escapes her as cum geysers back out of her snatch around your dick.");
	output(" Her tail loosens as she rolls off you, tired and panting, but satisfied. She quickly falls asleep from exhaustion allowing you to sit up and nurse your bruised pelvis.");

	output("\n\nIt isn’t until now that you remember the girl Yzza had subdued and you look up to see if she’s still there. You are met with a sight that brings blood rushing back to your spent dick. You see a pretty, blonde haired human, sitting propped up against a wall, dressed in what you assume to be beautiful regal attire. But you aren’t quite sure as her top has been pulled down to reveal a pair of B cup breasts and her dress has been hiked up to allow access to her nether regions. Her legs are spread wide open, two fingers buried up to the knuckle in her pussy, her other hand roughly massaging one of her breasts. She must have been forced to drink myr venom too and has been enjoying the show from the moment you’ve freed her.");

	output("\n\nHer eyes meet yours and she smiles alluringly. Pulling her fingers out of her quim she instead uses them to spread her lips invitingly. <i>“Come get your reward, hero.”</i>");

	output("\n\nYou crawl forward, casting aside your remaining clothes aside from your hat. Seeing a warm waiting hole drives you, the effects of the venom still coursing through your veins. Your body moves on its own and soon you are on top of her, lining up your cum coated dick and sliding in. Her pussy is hot, but is like a candle compared to Yzza’s furnace. She grabs you by the back of your head and mashes her mouth together with yours. When you pull back, another surge of warmth begins to spread in your body, and you realize she must have still had in mouth a significant amount of the lewd venom.");

	output("\n\nYou hips begin to move on their own, finding renewed vigor from this second dose. Hiking her dress up higher, you lift her legs up over your shoulders, allowing you to plunge deeper into her depths. Her nails claw at your back, urging you on. Still sensitive from your previous encounter, you slam your hips in and cum inside. A small part of your mind is glad and wants you to lie back and rest. You <i>“slayed”</i> the dragon and <i>“saved”</i> the princess. It’s time to rest.");

	output("\n\nHer moaning voice and luscious folds only drive the lust addled side of your brain more though. Only pausing to flip her over you continue to fuck her like a rutting animal, going harder and faster each passing thrust. The cum in her pussy begins to mix with her juices, and your efforts cause it to froth and leak down her legs, making a small puddle underneath her.");

	output("\n\nFrom behind you you hear <i>“I can’t believe you two are fucking without me!”</i> Yzza pulls into view a bit fatigued, winded, huffing and pouting. You don’t stop even when she begins to approach the two of you. To be honest, you CAN’T stop. Something primal drives you and you can’t force yourself to pull out except to thrust back in. She kneels next to you and whispers in your ear <i>“I don’t like being left out.”</i> She crawls under the princess and grabs her by the hair, forcing her down to lick her slit. The girl laps hungrily as you plow into her from behind.");

	output("\n\nYou feel a sudden pressure at your back door. Something wet is pressing on your ring! Yzza catches your eye and winks and you realize her tail, soaked in your juices and the princess’, is trying to force its way inside. Unable to do anything but hump like a mindless animal, you let it in. She slides it in slowly and holds it stiff for a while, having you fuck yourself on her tail as you fuck the nice piece of ass in front of you. As you get close again she grins and you know you are in for it. Her tail begins to thrash inside of you, stirring up your insides and poking your prostate. You try to hold out, but the feeling is too much, you can’t help but cum even stronger than last time.");

	output("\n\nYou begin to lose track of everything as the threesome continues on and on.");

	processTime(120);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",wakeUpAfterLongsword);
}

public function wakeUpAfterLongsword():void
{
	clearOutput();
	halloweenShipMove();
	author("Fenrirskoll");
	showName("\nAFTERMATH");
	output("You awake the next day naked on the cold floor. You get up, nursing a throbbing headache, you feel almost hung over. What strikes you as odd though is that you aren’t in the alleyway anymore, but on your ship. You shuffle to the cockpit feeling sore and notice you are no longer even in orbit around Poe A anymore.");

	output("\n\nA blinking light shows on your dash, notifying you of an unread message you’ve received. You open it up and you see a vid of the blonde girl lying next to a gravid, but sleeping Yzza. She smiles and waves <i>“Hey hero! I’m sorry about my girlfriend Yzza. She finally had earned enough to get her all her mods and they came out just like she wanted. Quite a feat considering all the experimentation people have to do to get transformations right... Anyway, we had decided to celebrate by putting them to good use! Hearing of a strong aphrodisiac on the extranet, I’d gotten us a bottle of myr venom to use.... It didn’t go so well. Yzza dosed herself up too much and got really aggressive.”</i> She rubs the back of her head sheepishly (probably where she got pulled by her hair last night you think to yourself) <i>“I swear she isn’t normally like that!”</i>");

	output("\n\n<i>“So... you are probably wondering what you are doing on your ship, aren’t you? Well this pink demon girl showed up, she looked kinda stressed. She said she knew you and that you needed to get off world quickly. We were about to call bull, that is until we heard a commotion out on the street. Sounded a lot like armed soldiers and they sounded pissed. So Yzza carried you, I carried your things, and oddly the demon chick made sure to pick up every piece of your costume and carry that. She led us to your ship, we helped you on, and she programed a flight path for you. She also promised to send this video for me to ‘daddy’.”</i> She rubs her belly without thinking, her eyes unfocus for the slightest second, but go back to normal.");

	output("\n\nShe smiles at the camera, giggling. <i>“We don’t mind. In fact, it was great! I don’t think you’ll be able to trace this video, we removed any location data so you’d be safe from the police. If you want to find us agai-name’s Ash-and our coordina-”</i> She sounded like she had more to say but the video cuts off after a few data corruptions make the last few minutes incomprehensible static.");

	output("\n\nYou take a look in the mirror and see all the new changes. You’ve come to accept them, and figure that even if you don’t like it you can always get new mods. That must have been some serious tech to cause all these changes. No wonder armed men were after Holiday....");

	output("\n\nYou shrug, deciding you’ve been away from your quest for far too long, and that you should get back to it or your cousin might beat you to the goal.");

	//End of path A
	applyLongswordChanges();
	processTime(60*10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Shortsword (Path B)
public function shortswordCrushingIt():void
{
	clearOutput();
	showName("SHORT\nSWORD");
	author("Fenrirskoll");
	output("In Holiday’s hand is a small sword in a simple brown colored sheath. The sword is comically small, it seems more like a toy than an actual sword. The hilt and guard look to be made out of a soft material, with a cloth wrap covering the hilt. A sparkly pink gem acts as the pommel. Is this the sword you choose, or do you want the other?");

	processTime(2);
	clearMenu();
	addButton(0,"Take It",shortSwordTakingTime);
	addButton(1,"Longsword",takeTheLongswordHero);
}

public function shortSwordTakingTime():void
{
	clearOutput();
	showName("SHORT\nSWORD");
	author("Fenrirskoll");
	output("A little embarrassed, you can’t bring yourself to admit you want the small blade. Instead, you just look at the small sword like hypnotized. Holiday smirks when she sees you unable to speak your mind, she grabs the shortsword and fixes it to your belt, did she really do that for you? You feel all flushed, because she read into you like an open book. You pull it out of the sheath and see the silver looking blade. It looks so real, although you couldn’t do any damage with it even if you wanted to.");
	output("\n\n<i>“Cute choice”</i> she says, snaking her hand to the lower part of your back. Her hand lingers on your ass for a second, almost as if debating whether or not to do something more. Ultimately, she gives a quick, although gentle spank and moves to your shoulders. With a heave, Holiday begins moving you out of the store. <i>“C’mon. Time for you to leave. I’ve got stuff to do and I can’t have you here being a distraction. Maybe if I finish early....”</i> She bites her lip for a second, but shakes her head as she pushes you out the door. <i>“Have fun!”</i> She slaps your ass one last time, much harder than the last time, her eyes focused on your ass. Realizing that she’s leering, she slams the door on you and changes the sign to closed.");

	processTime(1);
	clearMenu();
	addButton(0,"Next",shortSwordTakingTimeNext);
}
public function shortSwordTakingTimeNext():void
{
	clearOutput();
	showBust("ASYS");
	showName("\nYOINK!");
	author("Fenrirskoll");

	output("You make your way back to the main streets, ass still burning from the slap. You rub your stinging cheek, and delight in ");
	if(pc.buttRating() < 10) output("how accentuating the tights are. They make your ass look and feel large and plush. No wonder Holiday couldn’t keep her hands off!");
	else output("how nice the tights look on your ass. No wonder a lot of girls wear leggings and tights. You can’t blame Holiday for wanting to appreciate it.");

	output("\n\nYour tunic, ");
	if(pc.biggestTitSize() < 2) output("much the same as your tights, seems to enhance your non-existent chest. You look down and see that it pushes your chest together to make small lumps, you’d wager about a B cup.");
	else output("on the other hand, seems to constrict your breasts. You figure they must have a binding effect to make you appear a bit less female like. It doesn’t make your breasts look any smaller than a B cup, though.");

	output("\n\nWhen you arrive, the festival is still going strong. A little hesitant to get partying, you dive into the crowd. A few people on the edge of the crowd notice you and immediately wolf whistle. You look back to see a pack of guys, Ausar and humans from what you can tell (it’s hard with all the costumes). They are all catcalling you, trying to wave you down and one even pantomiming fucking you. All of them calling you names like sugar and baby, don’t they notice you are a boy? ");
	if(pc.biggestCockLength() <= 3) output("You look down and see the outline of your penis is there, but the tights just don’t have the same effect on your crotch as it does your ass. If anything, it makes it look like you have a very small pouch down there.");
	else output("You take notice that your tights actually seem to constrict your package, making it look like a cute tiny pouch. You realize that from a distance you probably look like a girl... Or someone who wants to be one.");

	output("\n\nYou sigh, deciding to go to more of an intimate setting to try your luck at a one on one meeting. Seeing a bar in the distance, you decide you could go for a drink, and begin to head for it. The constant jostling and moving people make it hard to fully register everything that’s happening, but more than a few times you feel a wandering hand grab your ass, grope your thighs, or cop a feel of your package. You hear a few girls giggle in the crowd and you are sure you make out the words <i>“tiny”</i> and <i>“cute”</i> from the general noise of the crowd. You blush and pick up your speed, eager to get to your destination, not without a warm feeling settling in your little chest.");

	output("\n\nPanting and sweating from the effort of trying to navigate the crowd, you finally make it to the door of the bar. Regaining your composure, you sheath your sword, and head inside. You are immediately relieved, although busy and lively, the atmosphere in here is a bit more controlled. The room is chillier than outside, you figure it’s to help keep the drinks (and the patrons) cool. As you look around taking in the sights, you are stunned. The entire bar is illuminated in black lights and glow sticks. The drinks on the menu are written in phosphorescent ink, and you see the bartender and a few other people dressed in clothes and painted in inks that all glow different colors in the UV lights.");

	output("\n\nYou now notice that almost everyone glowing from the UV (with a few exceptions) are employees, and the customers are the ones wearing glowsticks around their wrists and necks. You glance next to you and find a basket filled with wearable glowsticks, with a note saying <i>“Customers must glow! 3 per customer! Compatible with most tech to change color!”</i> You take your three, activate them, finding them all start a yellow color, and put them around your wrists and neck.");

	output("\n\nYou step up to the bar and find that your head barely makes it above the counter. ");
	if(pc.tallness < 62) output("You figured that it would be taller than you. These boots must add some inches to your height!");
	else output("You must have hit your head bad back at Holiday’s! You are sure you are supposed to be taller than this! Maybe you’re just exhausted, a drink could help fix that, maybe....");
	output(" The bartender, a white furred ausar dressed as a schoolgirl whose fur is glowing a cool blue, come over to you. <i>“What’ll you have darling?”</i> You read the menu, and see that there are a few specials today. One of them seems really odd, it’s described as a sweet milk drink mixed with a little alcohol. Gripped by some courage, you decide to be adventurous and try it, there’s little alcohol in it, but that’s still a lot right?");

	output("\n\nYou try your best to ask the bartender for the drink, but no matter what you try, the words don’t come out. You can make grunts and sounds, but no words. You begin to get frustrated when a saeri comes over, almost naked and covered head to toe in glowing paint, around her waist is a pair of shorts made of leaves. The paint makes her glow a pale blue, with purple accents. Her wings give off a bubblegum pink glow, making her look like a pixie or a fairy. She’s a little over a head taller than you, but she seems friendly.");

	output("\n\n<i>“Having trouble? What can I do to help?”</i> she asks kindly. You point out the drink you’d like on the menu. <i>“One Chateau Ausaril... Make that two. Fresh as possible”</i> she adds, throwing the bartender a wink. You pull out your codex to pay, but the saeri waves you off. <i>“Don’t worry, I’ll put it on my tab. My treat.”</i> The ausar behind the counter nods, making note of it on the register before getting two mason jars out. The bartender unbuttons her shirt to reveal two large, heaving tits with no bra. Attaching a milker to each breast, she fills up the mason jars quickly before putting her girls away. The two of you sit down at the bar, and you are glad to be off your feet after so much walking.");

	output("\n\nThe fairy girl takes her jar and raises it up in mock toast, before taking a swig. She motions for you to the same and you hesitantly raise the jar up to your lips. You take a sip, and when the wonderfully sweet taste hits your tongue you almost can’t stop yourself from downing the entire thing. You stop halfway through, not wanting to let on how much you like the comforting drink, feeling you would appear childish to crave the milky liquid so much. <i>“My name’s Asys”</i> she says, smiling at your enthusiasm. Laying a hand on your thigh, she points at you with her jar. <i>“Keep drinking if you like, little boy, no need to be shy. These aren’t that expensive, since they are on sale for The Masque.”</i> To reassure you, she downs the rest of her drink and orders another two.");

	output("\n\nAfter your third one you begin to get dizzy. The drink was so refreshing and sweet, you forgot it was alcoholic. With the room starting to spin a bit you nearly fall out of your stool. Thankfully, Asys catches and steadies you. <i>“We need to get you to a room.”</i> you look at her quizzically, bars don’t have rooms! Guessing what you are thinking, she responds <i>“This isn’t a normal bar, more like an old-timey tavern. The owners figured they’d ‘make bank’ if they added rooms for drunks to stay in. Drink, get drunk, stay the night, pay for drinks and board in the morning. C’mon! I already have a room.”</i>");

	output("\n\nShe gets up and scoops you up into her arms like if you were a princess. She’s surprisingly strong! As she walks you to her room in the back of the bar, you notice how gentle she’s being with you. Still feeling the effects of the alcohol you rest your head against her cushy breast to ground yourself. The feeling of her soft skin and her body heat seem to be causing another reaction too. Your constricted penis begins to tent your tights, and you blush, hoping that the hem of your tunic hides your erection. Instead of what you would expect to see, your thighs adapt to your shaft, separating your balls and your cock, revealing a small erection.");

	output("\n\nYou sigh in relief when you make it to her room. She stops briefly to unlock the door by bumping her card key on her hip against the lock. As she carries you in the lights turn on. It’s a nice, dark red, giving you enough light to see by but not enough to blind you after coming out of such a low-light place. She bumps the door shut with her butt and places you on the bed. She no longer glows in this light, instead having more of an inky black look. <i>“You can’t go to bed fully clothed, especially in ones so sweaty!”</i> She chides, and begins working your boots off. You carefully take your bracers and your hat off, not wanting to upset her. You hesitate at your tunic, not wanting to go nude on a girl you just met, but a stern look from her has you pulling it off.");

	output("\n\nHer hands start running along your arms, feeling your small muscles. She places a hand down on your stomach and slides her hands up gently. <i>“You’re so soft, but muscular too,”</i> she remarks. Her hands slip upwards and meet some resistance, your arm is covering your small protruding lumps. With a firm, but gentle grip she removes your arm from your chest, letting her other hand slide up and onto your breast. <i>“No need to hide these. See! Don’t be shy. They seem to like me”</i> she remarks as your puffy nipples harden under her attention.");

	output("\n\nShe pulls in close, whispering huskily right into your ear. <i>“They’re not the only things that like me. I noticed your little stiffy in the hall. It was quite cute and flattering.”</i> She pulls back, and in non-frightening yet commanding tone says <i>“Stand up! Take off your pants and present yourself to me.”</i>");

	output("\n\nFollowing directions, you gently stand and pull your tights off, exposing your stiff dick and jiggling ass to her. ");
	if(pc.biggestCockLength() > 3) output("It really did shrink! ");
	output("She stands next to you, grabbing your ass with one hand while gripping your package with the other. The hand on your ass gropes and squeezes, almost like a shopper checks a fruit for quality. She slaps your ass and watches the jiggles ripple through your flesh. Content with the result, she kneels down now to examine your cock. Her hand pulls back your foreskin before letting it go. Under her intense stare, it starts twitching releasing a drop of pre. Looking happy, she gathers it on one of her fingers. Raising her hand up to her mouth, she tastes her finger in an exaggerated way. The way she sucks on her finger and moans makes your twitch again, releasing even more pre-cum. She smiles and giggles, before getting off her knees, and gathers the pre with two fingers this time. She holds them up to your lips and utters a single word: <i>“Suck”</i>.");

	output("\n\nYou take her fingers in your mouth, eager to not disappoint. Your taste fills your mouth and you swirl your tongue over her fingers, trying your best to clean them. The depraved act heats you up inside, which in turn makes a few surprisingly high pitched moans come from your throat. She retracts her fingers from your mouth, leaving a trail of saliva and pre connecting them to your lolling tongue.");

	output("\n\n<i>“Such a good slut,”</i> she remarks, before she walks over to her luggage and opens it up. She rummages inside for a few seconds, making you fidget nervously at what she might pull out. She finds it, and pull it out with a flourish. It’s a purple buttplug, a bit long at 5 inches, a bit wider too, but proportional. The base is a nice pink jewel in the shape of a heart. <i>“Good sluts get rewards!”</i>");

	output("\n\nShe makes a gratuitous display of lubricating it, pulling out a bottle and letting it slowly drip over the tip. She inches closer, gripping your hip with her free hand. She pulls you in for a kiss, her tongue invading your mouth and easily dominating yours. As you kiss, she presses the plug up against your star, kissing you harder when she finds resistance. After time, and a little effort, the tip slips in. She slowly plunges it in, and boy, are you glad she used so much lube on it. You moan into the kiss as you feel it enter inch by inch. By the time it’s fully in, you feel so stuffed. Your erection has never felt so hard before this, spurred on by the feeling in your ass.");

	output("\n\nShe ends the kiss with a slap on your ass, making it tense around the toy stuffed in there. Directing you, she sits you on the edge bed, and kneels in front of you. She holds your member in front of her mouth, letting her warm breath roll over it, before giving it a small kiss on the tip. She gives you a coy look before swallowing your entire tool, an easy feat considering your size. You blush, both from pleasure and from embarrassment.");

	output("\n\nShe pulls off your dick with a (relatively) long lick and grabs your dick tight with two fingers, making you hide your face in shame. <i>“Nuh-uh, no hiding your face. My little slut shouldn’t act shy when she’s feeling good.”</i> You uncover your face and open your eyes to look at her. Content, she goes back to enveloping your small tool in her mouth, constantly keeping eye contact. Her tongue rolls around your entire cock, and she’s able to keep on sucking, not having to come up for air because you barely reach the back of her tongue. Under her ministrations and her watchful gaze, you quickly reach your boiling point. She reads you like a book, feeling your body tensing, and ups the intensity of her blowjob. With so much stimulation, you cum, body rocking from the sensation as you grip her hair tight.");
	if(pc.balls <=1 || pc.ballDiameter() <= 0.5) output(" You don’t unload that much semen, your small tight balls not able to produce that much cum.");
	else output(" You feel all your semen unloading into her voracious mouth, you also feel your nutsack tightening seriously and your testes now appear even smaller than cherries.");

	output("\n\nShe pulls your dick out of her mouth, a strong, constant suction cleaning your dick along the way. Grabbing your head, she pulls you into a kiss where she transfers your load, from her mouth to yours. <i>“Hold it”</i> she commands. <i>“Savor it. It’s a small load so you need to drink it all little boy.”</i> You hold your mouth open, rolling the load of cum around with your tongue, letting the taste coat your tastebuds. You begin to swish it in your mouth for a few seconds, making sure that all your mouth can taste the delicious semen, before she finally commands you to swallow. You close your mouth and gulp avidly the precious liquid, before opening your mouth and showing proof to her. You feel really nice, you would drink more, but from a ‘tap’ this time.");

	pc.loadInMouth(pc);

	output("\n\nShe pets your head as reward, playing with your hair and stroking your scalp in a way that sends shivers down your spine. <i>“Good girl!”</i> She coos. <i>“You’re such a good little sissy. Eager to please, hungry for cum. But it was risky for you to cum without telling me first. You could have wasted your precious meal. I’ll let it slide this time but don’t pull that on me again honey.”</i> She pushes you down on the bed and fits two fingers in your mouth. <i>“Get these nice and wet for me.”</i> While you suck on her fingers and liberally coat them with saliva, she slowly twists the plug out. Once finished removing the plug, you let out a sharp and sudden gasp. Her free hand gently grasps your full shaft with two fingers. <i>“You can’t even really call this a dick! More of a large clit. There’s no way you can qualify as a man. I mean just look at this ass!”</i> She pulls her fingers out of your mouth, and pops them up your back door. They don’t compare to the plug in length or girth, but their ability to move and tease your prostate makes you cry out in pleasure.");

	output("\n\n<i>“See, only a woman would feel that good from having their ass penetrated.”</i> She thrusts in and out your ass with her fingers, constantly hitting your prostate with each push in. Her other hand grabs your tiny balls and strokes you off at the same time. The amount of pleasure you are feeling forces you to thrust your womanly hips in the air and hold it, your back arched tightly and fingers gripping the sheets firmly. She taunts and teases you, bringing you to the edge and then stopping.");

	output("\n\nIt’s not until you you can’t control your voice at all from the pleasure that she orders you to cum. She intensifies her stroking and directs your tool so you spurt a pathetic amount of fluid onto your face. You collapse on the bed, panting, and Asys stands at the foot of the bed. <i>“Don’t pass out now. We’ve only been focusing on you. It’s time for sissy’s mother to have a little fun with her girl.”</i>");

	output("\n\nYou look up, tired and confused. She only responds by pulling her shorts down. Underneath you see compression underwear, helping keep a large bulge hidden. She tugs her panties down, and up pops up her own large dick. At your current size, her eight-inch long and two-inch thick monster put yours to shame. She moves it around hypnotically and it makes you drool, mesmerized.");

	output("\n\n<i>“See. I’m more of a man than you are. You should be the one pleasing me.”</i> She beckons you, and you rise. <i>“Open wide”</i> she says, sounding like a mom feeding her little sissy boy a piece of cake. You follow her command, and she places the tip of her dick in your mouth. <i>“You know what to do.”</i> You can’t help but worship her cock. It fills your vision, and the smell of her arousal fills your nostrils, clouding your mind. For a few blissful minutes, there is nothing in the world but you and her wonderful cock. That is until Asys grips you by the hair and pulls you off of her now slimy saliva coated dick. <i>“I’ve been ordering you to stop for a while now, but you didn’t listen”</i> she chides. Seeing your lust addled face though and the look of wanton lust in your eyes she adds <i>“I can’t punish you for being over eager though. But you nearly ruined your reward! Lie back, raise your legs up and wait for me to give it to you.”</i>");

	output("\n\nYou quickly scurry up on the bed, raising your legs up as high as you can manage and reaching towards her with your arms spreading your boycunt. She climbs on you, lines her rod with your waiting hole, and smacks it up against you repeatedly, making your hips instinctively rock back to get a better feel. You eagerly wait for her to plunge into you and ravish you, the thought of it sends a wave of pleasure to your prick. You use your hands to spread the hole open for Asys, and with a smirk, she finally pushes in. She takes her time, each inch entering excruciatingly slow. Your hands attempt to grab her and your legs wrap around her, trying to pull her in faster. She resists you, denying the instant gratification you crave.");

	output("\n\nA satisfied groan escapes from your throat when she finally hilts you. She coos, praising you for taking it all, before slowly moving. She grinds into you, making sure you feel her entire tool, and stretching you out for the fuck to come. You pull up and try to wiggle your way up and down her cock, but she grips your shoulder tightly and pushes you back down, punctuated by a firm <i>“No.”</i> For an eternity, you feel like she sits perfectly still within you, and every twitch and pulse is mesmerising. When she does begin thrusting, each push elicits a small moan from you. The room is soon filled with constant moaning, as she ramps her speed up. She’s stopped focusing on making you feel good, and instead is using you more like a living ona-hole.");

	output("\n\nShe groans as she gets close, it keeps growing in intensity until she finally lets out a loud, low pitched moan of her own. She unloads deep inside you, almost as if she can lay claim on you with the act. The feeling of hot cum coating your insides triggers your own orgasm, your little dick spurting out a few ropes on her belly, as if accepting her ownership. You relax on the bed, ass still clenching around her cock as exhaustion begins to take you. <i>“Don’t fall asleep now, the night is not nearly over,”</i> she says, beginning to gently hump your ass again. <i>“We have to go at least a few more rounds...”</i> You smile, feeling her motherly shaft growing in your cocksleeve. You close your eyes.");

	processTime(100);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",trappyHeroAftermath);
}

public function trappyHeroAftermath():void
{
	clearOutput();
	halloweenShipMove();
	author("Fenrirskoll");
	showName("\nAFTERMATH");
	output("You wake up the next morning, tucked gently in bed, nursing a small hangover and a sore ass, although you find the sensation strangely pleasant. You are surprised to see it’s your own bed on your ship and not the one in Asys’ room. You pull yourself up and stumble to your cockpit. You check your nav data and find that you are no longer even in orbit of Poe A. Looking around confused, you see a blinking message notification. Pulling it up, you see it’s a video file, and you decide to play it.");

	output("\n\nAsys is on screen, sitting next to your sleeping form in your bed. She winks at the camera. <i>“Hello little boy. I’d love to chat it up, but your pink haired friend tells me this has to be quick. We were having so much fun when she somehow managed to break into our room. By that time in the night, your entire skin was covered in cum, so much so that she almost didn’t recognize you. She grabbed your costume, said she was a friend of yours and some bad men were out for you. We ran out the fire escape and from the looks of it, those bad men were armed to the teeth. Just who did you piss off?”</i>");

	output("\n\nShe pets your sleeping head. <i>“Carrying you was a pain! You were slippery and hard to keep a grip on. Your friend.... What was her name? Holly? Hallow...? Anyway, she led the way to your ship. She put in some nav data while I cleaned you off, said your stuff was under your bunk, and told me I had just a few minutes to leave a message so I made this and left you a small gift in your ass. That was a wonderful night. I definitely won’t forget it”</i> she says, holding a up a pic of her over you, her cock deep inside and you coated in cum passed out. <i>“Don’t forget you belong to me my honey. Here’s hoping we meet again someday!”</i> The video cuts out there. You reach your ass to find it’s still leaking the Saeri’s cum....");

	output("\n\nYou get up, looking in the mirror, examining the changes done to you. The costume must have been some serious tech to do these kinds of changes. You wonder who Holiday must have stolen it from to get armed men after you.");

	output("\n\nDonning your gear, you sit down at the controls of your ship, deciding that you had enough of a break. It’s high time to get back to adventuring, and see if you can’t beat your cousin to some pods.");
	applyShortswordChanges();
	
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	pp.createPerk("Fixed CumQ",2500,0,0,0);
	pc.loadInAss(pp);
	
	processTime(8*60);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Changes
//Path A (longsword)
public function applyLongswordChanges():void
{
	var x:int = pc.biggestCockIndex();
	if(pc.cocks[x].cLength() < 12) pc.cocks[x].cLengthRaw = 12;
	//If hair is not blond
	pc.hairType = GLOBAL.HAIR_TYPE_REGULAR;
	pc.hairColor = "blond";
	//If hair is below 6 inches
	if(pc.hairLength < 6) pc.hairLength = 6;
	//If skin is not fair
	if(pc.skinTone != "fair") pc.skinTone = "fair";
	//If penis is not human
	if(pc.cocks[x].cType != GLOBAL.TYPE_HUMAN) pc.cocks[x].cType = GLOBAL.TYPE_HUMAN;
	//If ears are not sylvan
	if(pc.earType != GLOBAL.TYPE_SYLVAN) 
	{
		pc.earType = GLOBAL.TYPE_SYLVAN;
		pc.earLength = 2;
	}
	//If eyes are not blue
	pc.eyeColor = "blue";
	//If Height is not 5’7" (67 inches)
	pc.tallness = 67;
	pc.taint(10);
}

//Path B (shortsword)
public function applyShortswordChanges():void
{
	var x:int = pc.biggestCockIndex();
	//If height is not 5’2" (62 inches)
	if(pc.tallness != 62) pc.tallness = 62;
	//If breast size isn’t B cup
	if(pc.breastRows[0].breastRating < 2) pc.breastRows[0].breastRatingRaw = 2;
	//If skin is not fair
	if(pc.skinTone != "fair") pc.skinTone = "fair";
	if(pc.cocks[x].cLength() != 3) pc.cocks[x].cLengthRaw = 3;

	//If testicle size isn’t .5 inches
	if(pc.balls < 2) pc.balls = 2;
	if(pc.ballDiameter() < 0.5) pc.ballSizeRaw = 1.6;
	//If penis type isn’t human
	if(pc.cocks[x].cType != GLOBAL.TYPE_HUMAN) pc.cocks[x].cType = GLOBAL.TYPE_HUMAN;
	//If ass rating is below 10
	if(pc.buttRating() < 10) pc.buttRatingRaw = 10;
	//If hips rating is below 15
	if(pc.hipRating() < 15) pc.hipRatingRaw = 15;
	//If muscle tone general rating is not 26
	if(pc.tone != 26) pc.tone = 26;
	//If thickness rating is not 41
	if(pc.thickness < 41) pc.thickness = 41;
	pc.hairType = GLOBAL.HAIR_TYPE_REGULAR;
	pc.hairColor = "blond";
	//If hair is below 6 inches
	if(pc.hairLength < 6) pc.hairLength = 6;
	//If femininity is below 20
	//Femininity raises to 20
	if(pc.femininity < 20) pc.femininity = 20;
	//If ears aren’t sylvan
	//Ears become sylvan (2 inches)
	if(pc.earType != GLOBAL.TYPE_SYLVAN) 
	{
		pc.earType = GLOBAL.TYPE_SYLVAN;
		pc.earLength = 2;
	}
	pc.eyeColor = "blue";
	//If lip rating is below 4
	//Fen note: trying to keep this from going overboard :3
	if(pc.lipMod < 2) pc.lipMod = 2;
	pc.taint(10);
}

//Poe A - Bondage Kitty
//Black Cat
//non-taur players
//Mouseover description
//A whole crate full of brushed steel briefcases with the picture of a black cat on them. Could be a pretty cute outfit!

public function selectTheBlackCatCostume():void
{
	clearOutput();
	author("Adjatha");
	showHoliday();
	output("The crate containing the black cat cases has pried open, but none of the contents seem to have been disturbed. The professional appearance of the steel and the stylized picture of the dark-furred feline seems a bit out of the ordinary for this place. Picking one up, you’re a bit surprised by just how heavy the case really is. What kind of costume is this?");
	output("\n\nThe spaded tip of a long tail taps you on the shoulder, nearly making you drop the briefcase. <i>“Hey, whatcha got there?”</i> Holiday asks, craning her neck forward. <i>“Oh, it’s a big case of Not For Sale. Yeah, that’s a good one. Sure is a shame just how Not For Sale it is, though. Geez. What can you do? Probably put it back and buy something else.”</i> She’s smiling, but the only thing you can see between those ruby lips is just how sharp her teeth are.");
	output("\n\nShe seems weirdly insistent about this costume. Why’s she so defensive about these? You’d ask, but you doubt she’d give you a straight answer.");
	output("\n\nWhat will you do?");
	processTime(4);
	clearMenu();
	//[Steal It] [Back]
	addButton(0,"Steal It",stealTheBlackCatCostume,undefined,"Steal It","Would you dare to?");
	addButton(14,"Back",holidayCostumeMenu);
}

public function stealTheBlackCatCostume():void
{
	clearOutput();
	author("Adjatha");
	showHoliday();
	output("A case full of Not For Sale? Why, it’s just what you wanted! These things tend to be priceless, which is just another way of saying ‘free.’ But first, to direct Ms. Holiday’s attention elsewhere...");
	output("\n\nCraning your neck, you hold a palm to your ear. <i>“Is that a siren?”</i> you ask, idly. Holiday raises an eyebrow, you you catch a twitch of movement in her eyes as she glances back at the entrance.");
	output("\n\n<i>“How odd,”</i> you continue. <i>“What could they be looking for? Probably just rounding up some drunks,”</i> you conclude with a shrug.");
	output("\n\n<i>“Yeah... probably,”</i> the pale-skinned nurse agrees, hand reaching down to her side as if checking for a firearm. Finding only her own hip, the devilishly-dressed vendor chews her lower lip.");
	output("\n\n<i>“You know, I think I forgot something in the backroom,”</i> she announces, taking long strides across the storage floor. As she leaves, her tail whips back and forth in agitation, curling around the door frame as she moves out of sight.");

	//Nice
	if(pc.isNice()) output("\n\nLeft alone, you consider leaving some credits for her, but there’s no sense in drawing her attention to the theft. If you spend too long explaining yourself, you’ll miss the whole affair! You’ll definitely have to come back and pay her later, though. It’s the right thing to do.");
	//Mischievous
	else if(pc.isMischievous()) output("\n\nLeft alone, you consider that either that girl is supremely easy to trick or she’s got a guilty streak a light year long. Well, either way, time to take this little box off her hands and give her one less thing to worry about when the UGC catch up with her. You grab the costume and sneak out the front, with no one the wiser.");
	//Mean
	else output("\n\nIt’s just as well she left. This way you won’t have to get more forceful. To be honest, you’ve had just about enough of this crazy chick’s attitude. You’re not some rube, fresh from Terra, to be intimidated by thinly veiled threats. <i>“Lucky that I’ve got places to be and people to do,”</i> you chuckle as you grab one of the briefcases and push your way out of the dark little costume shop.");

	//Merge
	flags["HOLIDAY_OWEEN_PURCHASE"] = "black cat costume";
	processTime(6);
	clearMenu();
	addButton(0,"Next",yoinkDatCatCostume);
}

public function yoinkDatCatCostume():void
{
	clearOutput();
	clearBust();
	author("Adjatha");
	showName("TRY\nIT ON...");
	output("Taking your new acquisition a few blocks down from Holiday’s store, you duck into a back alley to pop open the cold metal case. It hisses with a rush of misty coolant as the pressure seal disengages. Lifting the lid to survey your purloined outfit, it seems the majority of the briefcase’s weight came from its steel exterior. The contents are primarily just charcoal grey foam with custom recesses cut into it to accommodate the costume, such as it is.");
	output("\n\nAs far as ensembles go, this one is pretty bare bones. You pull out two latex mittens, vaguely shaped like exaggerated, cartoon paws. They’re twice the size of your fists and seem to be stuffed with some kind of squishy lining. Setting those down, you move on to the tail. This also seems to be black latex, but one end has a shiny plastic teardrop the size of a peach on it. A butt plug.");
	if(pc.isBimbo()) output(" You start giggling with anticipation.");
	else output(" Of course. You suppose it’d be too much to ask for a simple, non-kinky costume.");

	output("\n\nAs for the mask itself, it’s a full sized affair, to be fitted over your entire head. There are strings on the back to cinch it snugly into place, eyeholes to let you see, and a narrow air hole right in the center of its feline mouth. The thing is made of the same oiled latex as the other pieces, but with an internal structure of thin, strong wires that leave the thing feeling more like a helmet than a mask.");

	if(pc.IQ() >= 30) output("\n\nYou rub the glistening surface of the kitty’s triangular ears. Considering the special case, it seems pretty obvious that this isn’t just a typical party mask. The overall bondage fetish feel you’re getting from it makes you think she may filched all those cases from a very kinky club. There’s certainly a risk that somebody might realize the mask is stolen but, you do need a costume and Holiday probably won’t appreciate a second visit.");

	output("\n\nYou lift the black cat mask up over your head, wiggling it until the eyeholes are in place and fumble with the back, pulling the strings tight. You kind of expected the thing to be a bit suffocating, but it’s actually surprisingly easy to breathe through the narrow kitty mouth. It must be holding on to the cold from its storage, because the latex feels a bit chilly.");

	output("\n\nA quick glance shows that no one is around, so you strip off your [pc.gear] to try on the rest of the outfit. Grasping the tail and, with a small gulp, you push the stopper into your [pc.asshole]. A chill, just like the one on the helmet, floods your [pc.ass] as the molded plastic pops into place. You shiver and turn to the paw gloves, which slide on easily enough. A quick flex reveals that your finer motor controls are almost impossible with the big, globe-like pads swallowing up your fingers. Hopefully you won’t have to defuse anything for the next few hours.");

	processTime(45);
	clearMenu();
	addButton(0,"Next",goToPartyAsBondageKitty);
}

public function goToPartyAsBondageKitty():void
{
	clearOutput();
	author("Adjatha");
	showName("\nPARTY!");
	output("Outfitted as best as the costume allows, you take a moment to admire yourself in the mirror-like, oiled shine of your own paws. The clinging cold has left you shivering slightly, despite the nervous excitement throbbing across your [pc.skinfurscales]. Your [pc.nipples] are stiff from the open air, while your flushed cheeks are hidden behind the cloying, empty smile of your kitty mask. Blossoms of lusty heat bloom in your [pc.chest], speeding up your heart rate and sending prickles of anxious delight tickling down your spine.");

	output("\n\nSomething about your situation is positively intoxicating. You find yourself giggling");
	if(pc.hasVagina()) output(" and your [pc.vagina] moistening");
	output(" as you admire the anonymous sex kitten in your reflective black rubber");
	if(pc.hasCock()) output(", your [pc.cocks] already rigid despite the cold");
	output(". ");
	if(pc.exhibitionism() < 33) output(" You spend a minute trying to get your equipment back on, but find the task impossible with your huge paw-gloves. If you’re going out, you’ll have to do so without any clothes!");
	else if(pc.exhibitionism() < 66) output(" You’re a little surprised by how turned on you’re getting at the thought of walking amongst so many strangers, your nude body brazenly on display.");
	else output(" Never one to need a reason to flaunt your body, you spend a bit longer posing for yourself than you intended, shaking away the fantasies in order to get to the good stuff.");
	output(" Maybe you could just play with yourself a bit, before heading out into the crowd? Get the night started off right.");

	output("\n\nThe task proves a difficult one, however. The mittens on your hands are weirdly tight and every time you try to pull them off, a fresh wave of coldness seems to pour out of the plug in your ass. You try to pull that bit first, but it proves even more difficult, as the slick latex slides with a lubricated squeak, virtually frictionless. You feel a bit light-headed as you ineffectually tug at toy tail with your mittened hands. Every pull seems to suck the heat from your body, but does nothing to remove the chilly ornament. Despite everything, though, beads of sweat start to roll down your shoulders and over your [pc.chest].");

	output("\n\nAfter a few minutes of this, you’re feeling as if you’ve been drugged. You’re light as air and radiating heat like a rutting animal. Completely forgetting about the plug in your ass, you stroke the plush black of your paws down your hips, savoring the narcotic bliss of every latex touch. You glance at your gear and, lust-drunk, decide to just leave it all here. You can worry about it in the morning. For now, you’ve got to find somebody to fuck or you may go mad.");

	output("\n\nClad only in the black cat fetish costume, you step out of the alley and make your way toward the crowded streets of the Masque. Some small part of you seems to be whispering about the dangers of walking in an unfamiliar city on an unfamiliar planet in nothing but a mask and a pair of paw-shaped gloves, but not very urgently. The little worried voice is smothered under the surprised laughter, the shocked gasps, and the encouraging hoots that bubble up from those you strut past.");

	output("\n\n");
	if(pc.exhibitionism() < 66) output("The thrill of nervous excitement briefly wrestles with your sense of shame before delight at all the attention overcoming your embarrassment. Before long, you’re striding through crowded streets as if it were perfectly normal to be without a stitch of clothing. ");
	output("Just like the cat you’re dressed as, you remain heedless to both the scandalized outcries and the coaxing hollers. Your heart pounds in your chest, but outwardly you’re cool and detached, radiating indifferent sexuality with each languid stride. Taking care to keep your [pc.hips] sashaying and your [pc.ass] prominent, you swing the costume’s tail in sweeping arcs that flick teasingly at those around you. The city’s in full revelry and you move through it like a " + pc.mf("king","queen") + " among " + pc.mf("his","her") + " subjects.");

	output("\n\nMore than once, particularly bold onlookers go for a handful and you’re all too pleased to accept their slavish devotion. Strangers of all sorts, their faces hidden by masks both fantastic and ghoulish, surround and grope your [pc.skinFurScales], emboldened by anonymity while the less brave look on. Some stroke fingertips over your [pc.chest] and pinch your exposed [pc.nipples] with wicked glee.");
	if(pc.balls > 1) output(" Others make for the orbs swinging from your hips, cupping your [pc.balls] in their palms and laughing in nervous arousal at the effect it has on you.");
	output(" More than a few give stinging slaps to your [pc.ass] while others give your costume’s tail a tug, provoking an orgasmic moan from you but never quite dislodging the plug. As some leave, new onlookers take their places and you paw playfully at each, purring and encouraging them to greater and greater audacity as they lustfully fawn over you.");

	processTime(30);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",prowlingAboutAsBondageKitty);
}

public function prowlingAboutAsBondageKitty():void
{
	clearOutput();
	author("Adjatha");
	showName("ON THE\nPURR-OWL");
	output("Your prowl continues for an hour or more, time a dimly remembered relic from before you embraced the liberating revelry of the masquerade. Glancing about to take in the lingering stares of the latest hungry eyes, you catch a figure darting into a narrow alley just a short distance ahead. You’re struck by two things about this girl: the first is just how bright her green eyes are. They’re nearly a glowing neon, maybe from a bio-luminescent gene mod. The second is that she seemed to be in a costume just like your own. Warmth flutters in your chest. At first all you can feel is an irrational sense of jealousy at the green-eyed girl for wearing your costume, but gradually the needle fades to a more benign desire to give her a longer, appraising inspection. Perhaps you could get her out of that costume with a little sensual persuasion?");
	output("\n\nYou head for the alley and are just in time to see a service door further down close with a muffled boom. There doesn’t seem to be any signs or identification along the walls or door, but you know well enough that all the best clubs don’t have advertisements anyway. Slinking up, you press an ear to the door, but can hear only your own exhibition-buzzed heartbeat. Rubbing your inner thighs with thick, pliant paws, you cast a gaze back to the crowded main streets. Compared to the raw belligerence of the well-lit public spaces, this alley seems positively intimate, muffling your needy, whining moans to the barest of whimpers.");
	output("\n\nStill, you just have to catch that other girl. Thoughts of Holiday and the costumes’ prior owners bubble up, but are lost in the panting, steamy haze of your feline hunt. Heedless of disturbing the private silence, you pound on the door as best as your puffy latex paws will allow, adopting a striking pose for the doorman. When the heavy steel opens, a tall, well-built kaithrit in a red velvet mask peers out, audibly gasping at the sight of you. You’re a bit disappointed it isn’t the green-eyed girl, but you still get a sense of gratification at his speechlessness. Without waiting for an invitation, you move past him with a nonchalant air, as if you had been expected all along. The weight of his eyes on your swinging tail and [pc.ass] is so delightfully intense that it leaves you grinning under your cat mask, delighted by the power of your raw sexuality.");
	output("\n\nThe entry hallway opens up into a warehouse filled with huge, sealed crates. A number of other kaithrit stand about, frozen in mid-task by your entrance, each wearing a red velvet mask identical to the doorman’s. There seems to be no sign of the girl who came in before you. There is no music, no dancing, no drinks, and no bartender. This has got to be the worst club you’ve ever gone into.");
	output("\n\nTwo men exchange whispers, pointing to your mask while one of the women shakes her head in disbelief. <i>“You guys fuckin’ with me?”</i> she asks of her companions, glancing between them.");
	output("\n\nA fourth cat, this one a fiery redhead, comes around the corner. She’s masked, like the others, and wearing a seemingly identical uniform, but hers is stretched to the very limits of the glossy material by eye-popping curves. Turning to you, she puts her fists on her expansive hips and looks you up and down appraisingly. <i>“Something we can help you with, honey?”</i> she asks in a soft, motherly voice.");
	output("\n\nRefusing to let yourself be put out by the lack of decent service at this club, you leap up onto one of the nearby crates and trace your paws along the edge of your makeshift seat. Since they seem a bit disorganized, you let the question hang in the air and instead use this chance to study your hosts. You don’t recognize the colors of their uniforms and they don’t have an insignia, so they must be small time - probably local. Maybe they’re going for an industrial look?");
	output("\n\nTheir spokesperson eyes you with a look of amused disbelief, her arms folded under her chest. And what a chest it is! You’re not sure what her outfit is made of, but given the tension it’s under, you wouldn’t be surprised to find out it’s used in spaceship hulls. Between the jaw-dropping bust and her staggering hips, the bimbo-bodied kitty looks like she just walked off of a particularly unrealistic pinup calendar. Despite her unbelievable endowments, her most striking feature has to be her ginger hair, which falls in fierce tresses atop her shoulders and spills down her back like a wildfire. The auburn kaithrit flicks both of her tails back and forth in apparent approval of what she sees.");
	output("\n\nA moaning cry filters into the silent room from some back room and it occurs to you that this is a different sort of club from the one you at first assumed. It takes another look around before you notice a number of empty, steel briefcases, just like the one you got from Holiday. You should probably ask about that but...");
	output("\n\nGinger gives you a look that drives all of the blood in your head south. You’ll worry about the other costumes later.");
	processTime(34);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",kittyPlaytime);
}

public function kittyPlaytime():void
{
	clearOutput();
	author("Adjatha");
	showName("\nPLAYTIME");
	output("The red-headed bombshell purrs as she pushes her companions to one side. <i>“Don’t wait up,”</i> she teases them as she slides her fingertips across your fake tail, giving it a faint tug. <i>“Come along, kitty, it’s long past time I had fresh cream.”</i>");
	output("\n\nTaking your time to follow Ginger into a back room, you’ve got plenty of time to admire her voluptuous figure. Her proportions are far more generous than a typical kaithrit, with hips double the width of her shoulders and breasts just as overstated. The clinging, skin-tight material of her russet uniform seems at the verge of catastrophic collapse with every swaying step. Twin, amber tails lay across her bottom, tracing a heart-shape around her thick ass that gives you all manner of ideas.");
	output("\n\nWhen you reach the back room, you don’t even bother closing the door behind you. Practically pouncing on the stacked feline, you flip her around and push her up against a wall, your paws perched on her shoulders as you fixate on her enormous chest. <i>“Dear me, quite an affectionate one, aren’t you?”</i> You run your hands over her chest, appreciating the oceaning sway of their heft as you press and squeeze with latex paws.");
	//no dick
	if(!pc.hasCock())
	{
		output("\n\n<i>“Oh, but something’s missing,”</i> the curvy cat pouts, looking at the canvas of your loins. <i>“Never fear, I’ve got the right accessory for your costume.”</i>");
		output("\n\nGinger produces a small, hand-held device that looks like a cross between a pistol and a hot glue gun. She jams the barrel against your pelvis and squeezes, sending a spike of numbness through your lower body.");
		if(pc.isNice()) output(" How kind of her, to help out with your costume. Everybody on this planet is so helpful!");
		else if(pc.isMischievous()) output(" You normally don’t go for injections on the first date, but it’s not as if your mask will let you do much in the way of arguments.");
		else output(" You’re about to knock the device from her hand and deck her for the injection, but given how puffy your paws are, you’d probably just make a damned fool of yourself. Still, you’ll remember that. One good turn deserves another, you silently vow.");

		output("\n\nThe numbness makes the following few minutes almost surreal. Before your eyes, a bulge sprouts at ");
		if(pc.legCount > 1) output("the junction of your [pc.legs]");
		else output("in your loins");
		if(pc.hasVagina()) output(", just above your clit");
		output(". The bump is barely bigger than a welt at first, but grows outward, filling and expanding as your flesh is reconfigured. After just minutes, a fully developed feline phallus has sprouted on your body, seven inches long and already throbbingly erect. By the time the numbing agent wears off, the suppressed pleasure of the transformation surges over your protests. Your body trembles but you remain upright, barely biting back a whorish moan.");
		output("\n\n<i>“Much better,”</i> Ginger confirms and with as horny as you are, you’re in no position to disagree.");
		pc.createCock();
		pc.cocks[0].cLengthRaw = 7;
		pc.shiftCock(0,GLOBAL.TYPE_FELINE);
		pc.cocks[0].cockColor = "black";
	}
	output("\n\nYour manhood stiffens as you push her to her knees, allowing your girth to throb against her warm, over-filled chest. Leaning forward, cock-first, her bosom bulges at the edges of the suit, warm and soft against you.");

	output("\n\nThe maternal catgirl apparently approves of your lustful, though clumsy probing and strokes the side of your [pc.cockBiggest] with the backside of her fingers. <i>“Is my outfit in your way, darling? Let me take care of that for you.”</i> Ginger raises her long-nailed pinkie finger and pokes a hole in the center of her uniform’s front, right where her bust juts out the furthest. You almost expect the whole thing to tear apart, but miraculously it holds together, squeezing her absurdly massive breasts so tightly that her tensed cleavage is visible even through the fresh pinhole. She carefully guides your [pc.cockHeadBiggest] to the breach, stroking the bulge of your cumvein with her thumb as she does so.");

	output("\n\n<i>“Mmmm... that’s right. My breasts are so eager to taste you, sweety. Not just an inch or two, but everything you’ve got,”</i> she mews. <i>“It takes an oil rub-down to fit in this...”</i> she runs her hands over her body, moaning, <i>“too tight costume. I’m as wet up above as down below,”</i> she confesses. <i>“All for you,”</i> Her whispering draws you closer and closer while she looks up at you with big, yellow irises, her slitted pupils wide and welcoming.");

	output("\n\nWith a purr of your own, you push forward, forcing the small hole in her suit wider and wider as you feed your length in. Just as she promised, Ginger’s cleavage is seeped in warm lubrication, as pliant as a pussy. ");
	if(pc.biggestCockLength() > 12) output("Even when you reach the deepest depth of her cleavage, the slick embrace of her tits simply sends you seamlessly sliding up toward her collar. ");
	output("The heated gasp she gives at your penetration makes you wonder just how sensitive her melons could possibly be. When you hug her curves a touch tighter, the woman’s shocked shiver and gratified smile tells you all you really need to know.");

	output("\n\nThe warm, squeezing tension of her mammary embrace makes you wish you could sink your fingers into the supple flesh, but you make due with your rubber-bound paws. Gentle rocking becomes more ardent thrusting as your [pc.cockBiggest] plumbs the depths of Ginger’s heaving chest. Even with the milfy woman’s wobbling cleft greased up, you find the tension of her prodigious peaks tight enough that you start to put your hips into every plunging stroke. Sumptuous slapping sounds accompany your accelerated pace as you drive the swollen bulk of your shaft again and again into the pussy’s pendulous peaks.");

	output("\n\nDrips of pre-cum begin to ooze out with greater frequency and are worked into her supple skin with each skin-slapping movement. The busty catgirl drags her fingers across your [pc.hips], cooing and murmuring encouragement while licking her plump lips with unabashed delight. Your capacity to hold back crumbles and you go all out, fucking Ginger’s extensive acreage with everything you’ve got. Her shoulder slam back against the wall and she opens her mouth in an ‘O’ of surprise as you mercilessly fuck her tender cleavage. Your inches vanish and reappear from the slick embrace of her tits, the sheer tidal ripples of your impacts tearing at the overstressed seams of her uniform, splitting at her hips and revealing oiled, lightly freckled skin beneath.");

	output("\n\nShe reaches forward and locks her fingers behind the small of your back as you bury your [pc.cocks] in the ragged hole you’ve made in her top. Clutching tightly, the slutty feline holds your pulsing flesh in the torrid pocket of her mountainous breasts. The plug inside your [pc.asshole] feels all too firm as your muscles tense, grinding your prostate down on the hard, slightly chilly plastic. The tickling tension at your peak turns to a faint prickling before your resistance is washed away by the gushing lust that overflows from your loins.");

	output("\n\nYour orgasm pours out of you in pulsing, trembling waves. Your breath catches in your throat and muscles tense as the [pc.cumVisc] culmination of your night reaches its climactic release. The anal plug deep inside you, the feeling of strangers staring and touching you, the thrill of meeting and fucking an anonymous sex kitten... it all floods your mind as your body pulls every last bit of wild bliss into gushing spurts that fill the tight confines of Ginger’s uniform. Spunk floods her cleavage almost immediately, while excess washes back over your [pc.cockBiggest].");

	if(pc.cumQ() >= 2000) output("\n\nThe first, excited moments pass as your liquid lust washes Ginger’s breasts in enough hot jizz to re-oil her ample skin. You pump again, some excess spilling out of the hole while more finds its way to the rest of her uniform. She laughs in disbelief as more and more cum fountains from your mast, stretching out her already stuffed fabric. The skin-tight outline of her body overflows and rounds as you make a bloated condom of her outfit.");
	if(pc.cumQ() >= 20000) output("\n\nGritting your teeth and pumping still, you use both paws and whatever strength is left in your frame to keep fucking through the almost paralyzing pleasure of the kaithrit’s panting hold. Her suit brims with your heat, trickles spilling out at every tear your zealous pounding has torn, but it’s not enough. The volume of your ceaseless eruptions far outpace the drainage and, before you know what’s happening, the entire front of Ginger’s uniform bursts open like a popped balloon! The stunned cat is drenched from head to toe in your [pc.cumColor] seed, fat globs still bubbling up from the freckled vale of her semen-saturated mounds.");
	processTime(40);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",postGasmKittyFun);
}

public function postGasmKittyFun():void
{
	clearOutput();
	author("Adjatha");
	showName("\nOH NO!");
	output("Ginger laughs and apologizes as she goes to get a new outfit, sloshing with every step she takes. You let the girl go, dazedly wondering if you can do this every year. Basking in the afterglow of your bliss, your gaze wanders around the utilitarian surroundings that you initially ignored. Just like the main area, storage seems to be the primary purpose of this room. Seemingly identical crates line the walls, a single red sticker slapped over the sealed seam. The notations on the stickers are meaningless to you, but you do notice one of the boxes hasn’t been shut just yet. Curiosity impels you and with a bit of effort, you manage to hoist up the lid, letting it swing open.");
	output("\n\nThe interior is lined with plush foam, like a sunken bed, and occupied by a black latex sex doll. The doll looks to have been designed with a catgirl theme, her supple curves glistening in the dull illumination of the overhanging lights. Her hands and feet are shaped like large, plush mittens with cartoonish paws rather than fingers and toes. Her arms are braced up to squeeze her breasts together, while her knees are parted in a wide, accommodating fashion to give full access to the shiny mound of her lube-slick, latex vulva. The doll’s head has two triangular cat ears and the slight bulge of a muzzle. Though her mouth is a wide O-shape, a plastic tube has been inserted into it, connecting the doll to a faintly hissing tank tucked into the foam. Her eyes...");
	output("\n\nYou start backwards. The dolls eyes are covered by curved lenses without a pupils or sclera, like screens of solid color. The color of the doll’s eyes are the most striking neon green you’ve ever seen. Unmistakable, in fact. They shine with a bio-luminescence you recall seeing not too long ago. You look down at the mittens covering your own hands and find them a perfect match for the ones on the doll.");
	output("\n\nYou pull the tube from her mouth and grab the green-eyed girl’s shoulders, shaking her desperately. The only response she gives is a moaning, dream-like sigh.");
	output("\n\n<i>“So, I assume you’re with that pink-haired bitch?”</i>");
	output("\n\nYou swing about to find a half-dozen crimson masked kathrit standing in the doorway. They’re not armed, but their expressions are unfriendly enough to broadcast their intentions without weapons. Ginger’s traded in her ruined uniform for a skimpy thong. She’s still smiling, but her friendly expression seems much darker.");
	output("\n\n<i>“How would " + pc.mf("he","she") + " have gotten one of the suits if " + pc.mf("he","she") + " wasn’t?”</i> one of the cats asks, rhetorically. <i>“That succubus made off with nearly everything we had left.”</i>");
	output("\n\n<i>“What do I do with you?”</i> Ginger wonders aloud. <i>“If you’re working for devil-girl and came back to try to steal from us again, I suppose we could pump you for information. Maybe you didn’t. I hardly think it matters now. Either way, let’s get you into something more comfortable.”</i>");
	processTime(10);
	clearMenu();
	addButton(0,"Next",actualEscapeTimeFromKittyHell);
}
public function actualEscapeTimeFromKittyHell():void
{
	clearOutput();
	author("Adjatha");
	showName("\nDISASTER!");

	output("Your eyes dart around the room, sobering up from the lingering euphoria to the very real danger you seem to have found yourself in. You weigh your chances on rushing the group, but without any weapons, you’d be pulled down in no time. You check the paw mittens, but they’re still tightly clinging to your wrists, the plush manacles resisting any efforts to free your hands. Maybe you can talk your way out of this?");
	output("\n\n<i>“Listen,”</i> you start, hands upraised.");
	output("\n\nGinger produces a palm-sized remote and jams her thumb down on one of the buttons. An electrical stimulation buzzes from the plug in your [pc.asshole], interrupting you and knocking you to the ground. Panting, you struggle to take stock of yourself. The surge seems to have dulled your senses, because all you felt was a tightness and a lightning-swift crackle of pleasure. A sweet ache from your loins draws your attention downward and you’re a little startled to see that you seem to have creamed yourself from the shock.");
	output("\n\nEverything feels tight, so you wriggle, trying to stretch out your sore muscles and notice a thick layer of black latex spreading out from the mittens on your hands. Like a melting candle, the slick jet coating oozes down your arms and engulfs your shoulders. You paw at it, but the latex seems solid despite its liquid advance across your [pc.skinFurScales]. You reach back, trying to pull the debilitating tail from your [pc.butt], but it seems as fixed as ever. The kaithrit are in different places as well, talking among themselves. How much time did you lose?");
	output("\n\n<i>“[pc.HeShe] came to?”</i> one notices, turning his attention to you.");
	output("\n\n<i>“Tough [pc.boyGirl],”</i> Ginger coos, looking you up and down with barely restrained lust. <i>“A shame we don’t have time for another round,”</i> she bemoans, jabbing the button once more.");
	output("\n\nYou clench as sparking white fills your eyes and time leaps forward in an instant again. The kaithrit have all started loading the coffin-like crates into shipping containers, closing up the green-eyed girl’s box and dragging an empty one into the room. For you, no doubt.");

	output("\n\nYou seem to have fallen on your side, the latex covering nearly your entire upper body. Your vision is fuzzy and your eyes can’t seem to focus until you remember the lenses on the other girl. A ring inserted into your mouth holds your jaw open for ease of use. The thick rubber hugs your [pc.chest] and belly like a triple-thick skin, adding plush, exaggerated curves on top of your natural body shape. Wiggling your behind, you find ");
	if(pc.tailCount == 0)
	{
		output("a second cat tail seems to have grown from your spine. It’s a perfect match to the artificial one still locked in your rump, completing your kaithrit appearance.");
		pc.tailCount = 1;
	}
	else 
	{
		output("your [pc.tails] ");
		if(pc.tailCount == 1) output("has");
		else output("have");
		output(" changed as well. Now, ");
		if(pc.tailCount == 1) output("it is");
		else output("they are");
		output(" little more than ");
		if(pc.tailCount == 1) output("a clone");
		else output("clones");
		output(" of the artificial tail still plugged into your rump.");
	}
	pc.tailType = GLOBAL.TYPE_FELINE;
	pc.clearTailFlags();
	pc.addTailFlag(GLOBAL.FLAG_LONG);
	pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
	output(" Feeling at your face, you’re a bit surprised to find the mask has been removed, but the feline appearance remains! The latex has molded you into a kaithrit sex doll, through and through.");

	output("\n\nYou struggle to speak, but the ring-gag and exhaustion from your rapid transformation has left your voice little more than a squeaking sigh. Through the lingering paralysis, you vaguely wonder if Holiday stole these suits from the villainous kaithrit to keep them from doing this to others, or for her own private use. It really doesn’t matter now, you suppose.");

	output("\n\nFour of the slavers lift you into one of the coffin-like crates, hooking the air tube to your mouth and swinging the lid shut. The wheezing puff of the faintly sweet gas fills your lungs and the soft cradle of foam squeezes you almost comfortingly. Alone in the darkness, your limbs numbing from what must be anesthetic, you feel the gentle, irresistible hands of sleep drag you down, into oblivion.");

	processTime(10);
	pc.orgasm();
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",wakeUpAfterKittySlavePackup);
}

public function wakeUpAfterKittySlavePackup():void
{
	clearOutput();
	halloweenShipMove();
	author("Adjatha");
	showName("\nAFTERMATH");
	output("You can’t be sure how much time has passed, but you’re roused by the sudden removal of your air tube. Gasping for fresh air like a " + pc.mf("man","woman") + " saved from the brink of drowning, you lunge upwards. Blinking at the light around you, it takes a few minutes before you realize you’re still in the warehouse where you had been captured. Somehow, you assumed the red masked kaithrit would’ve sold you off to live out your days as a sex doll somewhere in the galaxy.");
	output("\n\n<i>“Who? What? What’s happened?”</i> you ask. Or rather, you try to ask. The ring holding your jaw open seems to warp your words into little more than a string of pathetic mews. You bat at your mouth, but your paw-hand does nothing to remove the gag or restore your voice.");
	output("\n\nA pair of hands reach around from behind you, carefully removing the blurring lenses from your eyes and the meowing ring from your mouth. Warm arms hold your wrists and with a strong yank, pries the paw gloves free in one go. You’re not terribly pleased to find that your hands are covered by the same black latex that has crept everywhere else on your body, but you’re still relieved to have fingers back just the same. Your savior leans forward, pressing her cheek against yours, almost intimately.");
	output("\n\n<i>“You might feel some pressure,”</i> Holiday whispers.");
	output("\n\nWith a sudden jerk and a moist pop, she draws the latex tail from your ass in one go. You draw in your breath, expecting the pain of removal any moment, but all you feel is a shuddering relief at being free of the paralyzing costume. You quickly search your body for some seam, so you can finally take all this latex off. The sensation of your fingers playing across the glistening black, however, is far too acute for this to still be a costume.");
	output("\n\n<i>“Well, for what it’s worth, I think this look works for you,”</i> Holiday muses, tapping her lower lip with a gloved index finger. <i>“Anyway, off you go. Quick quick, like a bunny.”</i> She motions dismissively towards the door, gathering up the various implements of your costume, packing them away in another steel briefcase. <i>“Ah... a kitty I guess.”</i>");
	output("\n\n<i>“Wait, how did you find me? How did you even get in here? What happened to the kaithrit? What about the other dolled victims?”</i> You ask in a breathless flurry, your head swimming. You have more questions - so many more - but those will do for a start.");
	output("\n\nThe devil girl sighs, going about her work while responding. <i>“I can count, you know? I saw one of these things was missing, so I went looking for you. It wasn’t very hard to follow the trail of people still talking about a nudist with a cat fetish walking across the city.”</i>");
	output("\n\n<i>“As for the rest,”</i> Holiday gestures to the other crates in the warehouse, <i>“don’t worry about them. The fuzz will be here sooner than I’d like. I’ll be on my way once you, you know, pay me for that costume.”</i>");
	output("\n\n<i>“Pay you? I was almost a sex doll! I don’t even have my money on me! Where did all the cats go? Where’s the... red... head...”</i> Your eyes might be deceiving you, but a pile of discarded clothes in the corner looks awfully like Ginger’s torn suit. Lying on top of it are a pair of cybernetic kathrit ears and tails, exactly the color of Ginger’s hair.");
	output("\n\n<i>“Hey,”</i> Holiday shoves you to get your attention. <i>“You’re lookin’ pretty woozy there... hey are you all right?”</i> Your vision swims as your body gives out. <i>“I’m not getting paid, am I?”</i> Holiday asks as you go limp.");
	output("\n\nWhen you come to, you’re back on your own ship. Vague memories of the costume vendor and sex slaver kaithrit bubble up, but it feels distant and hazy. It’s as if the whole night had been nothing but a bad dream. Stretching, you notice your reflection in one of the reflective surfaces of your vessel. A black, latex cat stares back at you, ears, tail, and all.");

	output("\n\nIt seems you’re stuck with this stroke of bad luck after all.");
	processTime(5*60);
	extraCatTFForCatCostume();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function extraCatTFForCatCostume():void
{
	//Player's skin type becomes Black Latex
	pc.skinType = GLOBAL.SKIN_TYPE_LATEX;
	pc.clearSkinFlags();
	pc.addSkinFlag(GLOBAL.FLAG_SMOOTH);

	//Player gain a cat tail / existing tail changes into a cat tail
	//HANDLED IN SCENE

	//Player's ears become cat ears
	pc.earType = GLOBAL.TYPE_FELINE;

	//Player's hips, thighs, and butt increase by 2
	if(pc.hipRating() < 25) pc.hipRating(2);
	if(pc.buttRating() < 25) pc.buttRating(2);
	//Player's elasticity increases by 5
	if(pc.elasticity < 10) 
	{
		pc.elasticity += 5;
		if(pc.elasticity > 10) pc.elasticity = 10;
	}
	//Increase Exhibitionism by 25%
	for(var i:int = 0; i < 15; i++) { pc.exhibitionism(2); }
	pc.taint(10);
}

//Req's genitals

//Tooltip
public function knottyNurseTooltip():String
{
	return "The “Knotty Nurse” outfit seems ordinary in everything but name: a white, rubber dress that barely reaches the hips, latex thigh-high boots, and a scandalously revealing crotchless thong, complete with tiny white and green crosses. You presume the typo a result of a botched translation, but could it be indicative of something more? None of the other accessories help you explain. You’ll just have to pony up the 1,000 credits to find out.\n\nPretty steep for a typical costume.";
}

//Take it
public function becomeANaughtyNurse():void
{
	clearOutput();
	showHoliday();
	author("Fenoxo Fenbro");
	output("<i>“This one,”</i> you announce, grabbing the combination medical outfit-slash-slutwear out of a box.");
	output("\n\nHoliday smiles wickedly, fangs flashing. <i>“That’s a real winner, if I do say so myself.”</i> She plays with the hem of the skirt, slipping a thumb through the thong’s crotch-hole, wiggling it around mischievously. <i>“A little sluttier than mine, even. You’ll be beating boys off with a stick.... Or just beating boys off. I’m 95% sure that’s what the latex gloves are for.”</i> The demonic shopkeep takes a step back and gestures at a nook between a few crates. <i>“Same deal as everything else. 1000 credits and it’s yours for the night.”</i>");
	processTime(2);

	//Buy or not
	clearMenu();
	addButton(0,"Buy It",buyDatNaughtyNurse);
	addButton(14,"Back",holidayCostumeMenu);
}

public function buyDatNaughtyNurse():void
{
	clearOutput();
	showHoliday();
	author("Fenoxo Fenbro");
	flags["HOLIDAY_OWEEN_PURCHASE"] = "Knotty Nurse outfit";
	pc.credits -= 1000;
	output("<i>“I’ll take it!”</i> You wire the credits over, excited to match the theme established by the sexy demonic shopkeeper.");
	output("\n\nHoliday flicks her eyes down to a projected display and nods curtly. <i>“That’ll do it.”</i> She jerks her thumb over her shoulder toward a pile of enormous crates. <i>“You can change over there. Just stash your stuff, and I’ll keep any bums from running off with it. Nobody wants to party with the [pc.boyGirl] carrying around a backpack full of heavy ordnance.”</i> She tilts her head to the side, pink hair cascading cat-like, yellow eyes. <i>“You trust me, right... buddy?”</i> The crate she’s sitting on lets out a deep, rumbling growl, which she silences with a crunching blow from her knuckles on the container’s reinforced lid.");
	output("\n\nHoliday seems about as trustworthy as a starving dog at a butcher’s shop, but you don’t really have any alternative if you plan to enjoy the party. Grabbing the costume, you admire the way it shimmers in the dim light and duck behind the crates.");
	if(!pc.isNude()) output(" You’ll have to strip to squeeze into the slinky number, but that’s par for the course with these kinds of things. You shuck your gear and turn to examine the slutwear in detail.");
	output("\n\nThe short sleeved, hip-length dress-slash-coat turns out to be made from some next-generation material that combines the glossy sheen of latex with the oh-so-comfortable smoothness of silk. A generous cut ensures the wearer’s breasts won’t just be on display - they’ll be presented for inspection. The fit is so clingy and tight that it can’t possibly be worn with a bra");
	if(pc.biggestTitSize() < 3) output(", not that you need one");
	else if(pc.isChestExposed()) output(". Good thing you already stripped");
	output(".");

	output("\n\nYou slip it on as carefully as possible. Its slinky nature demands you to pull harder to stretch it over every inch of your body like a second skin, yet no matter how hard you work to get it on, it doesn’t strain in the slightest. Stranger still is the complete lack of wrinkles. Stuck on your shoulders, it compresses into a smooth, if ill-fitting, band. Once you grunt and tug it down over your [pc.chest], a flawless expanse of medical-grade white reveals itself, framing a deep");
	if(pc.biggestTitSize() < 3) output(", cleavage-enhancing");
	output(" cut. The space-age garment tingles against your [pc.nipples] until they’re fully erect, exposed in stark relief by the glossy veneer.");
	output("\n\nYou flush. Maybe it’s the revealing clothing or the debauched nature of the world-wide party, but you’re definitely feeling a bit randy. Ignoring the swelling emotion for now, you tug the dressy top’s edge across the crest of your [pc.hips] - low enough to stretch across the curves of your [pc.butts] but high enough to leave your crotch completely unguarded. That, you suppose, is the job of the panties, still on the hangar.");
	output("\n\nThis thong could hardly qualify as panties. The back covers less than nothing, maybe your asshole on a good day. It’s more anal floss than actual underwear. The front is even worse: a sheer, cross-embossed triangle with a slit down the middle for casual entry.");
	if(pc.hasCock()) output(" For you, it’s more of an escape hatch for cock.");
	output(" The costume doesn’t come with pants. It wouldn’t look right with them anyway. The included thigh-highs and panties are as much modesty as you’re going to get, and here on Poe A, that’s probably ");
	if(pc.exhibitionism() >= 66 || pc.isBimbo()) output("fantastic");
	else output("fine");
	output(".");
	if(pc.exhibitionism() >= 50 && pc.hasGenitals())
	{
		output(" You fan yourself at the thought of how much you’ll have on display, how everyone you see is going to see your ");
		if(pc.hasCock()) output("[pc.cocks]");
		else output("[pc.vaginas]");
		output(" hanging out there, ready to be touched and grabbed.");
	}
	output("\n\nPulling the panties up reveals them to made of the same material as the top, only in with cross-shaped patterns that never seem to distort no matter how they curve around your [pc.hips]. The thong slips across your [pc.skinFurScales] with ease, gentle tingles of delight radiating up your nerves from contact with the exotic fabric. As it snugs up into your crotch, you whimper softly, ");
	if(pc.exhibitionism() < 33) output("hoping Holiday doesn’t notice");
	else if(pc.exhibitionism() < 66) output("wondering if Holiday will notice");
	else output("disappointed Holiday is missing the show");
	output(". It feels better than they have any right to. A thong should be a little uncomfortable. A strip of fabric wedged into your crack should at least take some getting used to. Instead, it’s like wearing a tongue across your [pc.asshole], one that gently slides back and forth with your every movement.");
	output("\n\nThe front is better, somehow.");

	//Cock
	if(pc.hasCock())
	{
		output("\n\nAdjusting your [pc.cocks] so that ");
		if(pc.cockTotal() == 1) output("it spills");
		else output("they spill");
		output(" out the opening instead of being compacted into a phallic singularity reminds you of slipping into a sex-toy. The gap in the fabric shouldn’t give you an erotic thrill. It shouldn’t be like donning a silk cock-ring, but it does. It does all that and so much more");
		if(pc.balls > 0) output(", cupping your [pc.balls], the gusset easily expanding to create an attractive looking pouch for your pouch, made to cradle weighty sacks beneath a gloss of feminine appeal.");
		else if(pc.hasVagina())
		{
			output(", the gusset clinging tightly to your folds, shrink-wrapping your feminine genitalia so tightly that even the [pc.clits] ");
			if(pc.totalClits() == 1) output("is");
			else output("are");
			output(" visible through the thin, reflective slut-wear.");
		}
		else output("tickling your taint like a lover’s curious fingers.");
	}
	//No cock-but-pussy
	else if(pc.hasVagina())
	{
		output("\n\nGranted, well-fit undies ought to be nice against your [pc.vaginas], but these panties take it to a whole ‘nother level. It’s like shrink-wrapping your lips, the shimmering rubber-fabric molding to display every detail of your labia and [pc.clits], tantalizing your nerves with the exotic texture so delightfully that you don’t even care that the crotch-opening is sitting up a little too high to expose anything. You tug the hem up, but it slides right back down into place: your pussy ensconced and a patch of bare [pc.skinFurScalesNoun] visible. Weird.");
		output("\n\nYou’ll complain to Holiday about it later.");
	}
	//Merge
	//Single leg/Goo
	if(pc.legCount == 1) output("\n\nNext up are the thigh-high stockings. After laughing a bit, you toss them aside. They’d never fit you.");
	//Else
	else
	{
		output("\n\nNext up are the thigh-high stockings. Just like everything else, they’re made of that same not-latex and feel like oiled silk as they slide up your [pc.legs]. A shiver of pleasure tickles up your spine once they’re snug.");
		if(pc.isTaur())
		{
			output(" It looks a little weird with the ");
			if(pc.legCount < 4) output("shape of your lower body");
			else output("number of legs you’re packing");
			output(", but better than if you didn’t wear them at all.");
		}
		output(" Every curve and feature is painted in glossy, flawless black, artificial and sterile as a V-Ko’s lips.");
	}
	output("\n\nA white hat in an ancient-looking style completes the ensemble. It pinches your scalp as you get it situated, but a few accents remain, begging for your attention. The first is a stylish belt with a comically undersized first-aid kit, intended to be worn on your hip. It has no latch or opening. The only notable feature is a button that causes a condom to slide out of a slot in the side when pressed - evidence of the kind of medical help you’ll be giving tonight. <i>Protection is an important at these kind of events.</i>");
	output("\n\nThe last accent is a pair of garters ringed with holsters for medipens of blue-tinted fluid. Block lettering declares them to be “Knotty Boosters.” At least the typos are consistent. You suspect you’ll be a real hit with the ausars in the crowd tonight....");
	processTime(25);
	pc.lust(35);
	clearMenu();
	addButton(0,"Next",dressedInKnotSuccess);
}

public function dressedInKnotSuccess():void
{
	clearOutput();
	showHoliday();
	author("Fenoxo Fenbro");
	output("<i>“Looking good,”</i> Holiday quips with a wicked smile. <i>“Give me a twirl. Let me have a look at my goods.”</i> Her eyes flick down to your");
	if(pc.balls > 0 || pc.hasVagina()) output(" partially");
	output(" exposed loins. <i>“Your goods too, I guess. Let’s see the rumpus.”</i> She gestures impatiently.");
	output("\n\nWith a small laugh, you spin about, the hem of your skirt fluttering highlight how the panties cling to your almost-bared loins, the cheeks of your ass exposed");
	if(pc.tailCount > 0) output(", your [pc.tails] bouncing through a gap in the behind");
	output(". The motion tugs on your little hat, and you feel that pinch");
	if(pc.hasHair()) output(" in your [pc.hair]");
	else output(" on your head");
	output(" again. Then, vertigo. Bouncing off a crate, you catch yourself at the last second, wobbling unsteadily before regaining your balance.");
	output("\n\n<i>“Looks like you’re ready to party!”</i> Holiday decides, nodding in confirmation of her own declaration. She guides you out the door and sends you on the way with a smack on your bared ass. <i>“Don’t do anything I wouldn’t do!”</i> she offers as her parting advice. The door slams shut, then clicks as a bolt slams into place. Another lock follows. And another after that. Then the lights go out.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",knottyPartyI);
}

public function knottyPartyI():void
{
	clearOutput();
	clearBust();
	showName("\nOUCH!");
	author("Fenoxo Fenbroxo");
	output("Delighting in the lingering sting of Holiday’s palm on your ass, you totter out into the streets");
	if(pc.legCount > 1 && !pc.hasHooves()) output(", for the first time noticing the heels at the bottom of the latex-like stockings");
	output(".");

	output("\n\nIt isn’t long before you trip over a pothole and fall, hard. This time, there’s no crate to stop your tumble. Just hard pavement. You crash hard, elbow-first. The asphalt scrapes long streams of fire up your arm. Crying out in pain, you roll on the side, cradling your bloody injury and cursing whoever decided a condom dispenser would be more practical than a proper first-aid kit.");
	output("\n\nYou sit up and examine the damage. It’s not that bad, as scrapes go. The bleeding is already slowing. The pain, on the other hand, seems even worse than before. In a moment of weakness, you consider the <i>“Knotty Boosters”</i> strapped to your [pc.leg]. They look like real medipens - painless injectors capable of delivering microsurgeons, drugs - you name it. You doubt whoever made this put any actual healing items in the costume... but party drugs? One of those might take the edge off.");

	//high IQ
	if(pc.IQ() >= 66) output("\n\nYou know better. It’s more than obvious that dosing yourself with a mystery fluid is a terrible idea. Nevertheless, entirely unjustified confidence in this plan wells up in your breast, a certainty in heretofore unseen medical instincts.");
	//Med IQ
	else if(pc.IQ() >= 33) output("\n\nBizarrely you don’t think twice about your actions. An innate trust in the contents of the medipens swells in your heart, giving you the confidence to trust your heretofore unseen medical instincts.");
	//Low IQ
	else output("\n\nThat sounds like a pretty great idea to you. You came here to party right? Yeah, and what kind of nurse would you be if you didn’t treat <i>somebody</i> with these cool looking medical supplies?");
	//merge IQs. Still in no-dick variant.
	output("\n\n<i>‘Pfffshilt.’</i> You don’t feel a thing, well aside from a slight rush of warmth twisting its way up your arm, into your neck... all over really. You blink a few times, slipping the spent pen back into its holster. That warmth concentrates on your scrapes, which you note are surprisingly starting to heal. Or at least you think they are. The drugs are really kicking in, making your eyes cross and your nose itch. Sneezing violently, you giggle and try to keep from tipping back over. It’s harder than expected, especially when your head is all muzzy, and you’re so... so... <i>warm.</i>");

	//Primary dick not dog
	if(pc.hasCock())
	{
		output("\n\nHead lolling, you sneeze again, hard enough to jerk you all the way down in your [pc.hips]. <i>Fuuuck, you’re hard down there.</i> You pump your hips experimentally, every small thrust making your [pc.cocks] a little more rigid, a little more excited and ready to go. You reach down, not even bothering to look");
		if(pc.cockTotal() > 1) output(", grabbing the topmost and wrapping your fingers tight");
		else output(", fingers wrapping tight");
		output(" about the ");
		if(pc.cocks[0].thickness() >= 3) output("colossal girth");
		else if(pc.cocks[0].thickness() >= 1) output("girth");
		else output("narrow shaft");
		output(". The ");
		if(pc.hasArmFlag(GLOBAL.FLAG_PAWS)) output("paw-pads-");
		else output("skin-");
		output("to-skin contact is electric. It’s exactly what you need. You’re horny, and you <i>deserve to ");
		if(pc.hasArmFlag(GLOBAL.FLAG_PAWS)) output("paw");
		else output("get");
		output(" off.</i>");

		output("\n\nHow convenient that your panties came with an opening for your cock");
		if(pc.balls > 0) output(" and a lovely pouch to cradle your [pc.balls] in slippery latex");
		output("! You don’t even have to undress!");

		output("\n\nDizzy with pleasure, you set to work jacking yourself off. No more than four or five pumps into it, and you’re already dribbling pre. The slick river trickles into and over your fingers in such volume that you’re smearing it over your entire cock, shining it until it rivals your synthetic slut-wear. It bubbles and froths from the frenetic tempo of your jacking. The flesh of your " + pc.cockDescript(0) + " is strangely tight. It’s certainly harder than any time in recent memory, skin taut and quivering like a pulled bowstring. You can’t think of the last time you were this horny.");
		output("\n\n<i>What was in that pen?</i>");

		//Blunt
		if(pc.cocks[0].hasFlag(GLOBAL.FLAG_BLUNT)) 
		{
			output("\n\nMarvellously, your frantic strokes never seem to catch on the rim of your ");
			if(pc.cocks[0].hasFlag(GLOBAL.FLAG_FLARED)) output("flare");
			else output("blunted head");
			output(". It’s a smooth back-and-forth glide, eliciting gasps of delight with every sordid caress.");
		}
		//Pointed
		else if(pc.cocks[0].hasFlag(GLOBAL.FLAG_TAPERED)) output("\n\nMarvellously, your pointed tip allows your frantic strokes to glide from [pc.knot] to pointed tip without pause. It’s such a perfect shape - easy to fondle and easy to slip inside a willing entrance. Your smooth back-and-forth glide has you gasping with delight at every sordid caress.");
		//else
		else output("\n\nMarvellously, your frantic strokes never seem to catch on the rim of your [pc.cockHead]. It’s a smooth back-and-forth glide, like you’re tapered to more easily slip inside the first willing partner you can find. Gasping in delight with every sordid caress, you don’t long reflect on the strangeness of the situation.");
		//Merge dicktip variants
		//Sub 12" grow to 14"
		if(pc.cocks[0].cLength() < 12)
		{
			output("\n\nThe pleasure continues to mount; each stroke offers a slightly longer buzz of erotic pleasure than what came before. As a matter of fact, even your hazy cognition notices that the tempo of your unsubtle, crotch-slapping strokes sounds like it’s slowing, not because you’re tiring of the act - anything but! There’s just <i>too much dick</i> to traverse in a timely manner.");
			if(pc.cocks[0].cLength() < 7) output(" You adore the feeling of finally having a decent amount of cock to fondle.");
			else output(" You adore the feeling of having even more cock to fondle.");
			output(" This is how masturbation should feel.");
		}
		//Sub 20" fun
		else if(pc.cocks[0].cLength() < 20)
		{
			output("\n\nThe pleasure continues to mount as you luxuriate in the rapid, crotch-slapping strokes. You’re thankful to be so blessedly, perfectly endowed. You’re big enough to truly revel in the act of masturbation, but not so big that you can’t fit inside a partner, should the need arise. Of course, you might ruin your partners for lesser beings, but that’s the point, isn’t it?");
		}
		//Hyper
		else
		{
			output("\n\nThe pleasure continues to mount as you luxuriate in long strokes that only the hyper-endowed can truly enjoy. You notice through your drug-fuzzed perception that the thrilling sensations are getting sharper, hotter on the heels of the previous strokes. There’s less surface to cover but just as many nerves.");
		}
		//Merge - new PG
		output("\n\nBlinking confusedly, you yank your head up for a look, intending to watch your orgasm.");
		var cColor:String = "none";
		var cType:Number = -1;
		if(pc.hasCock())
		{
			cColor = pc.cocks[0].cockColor;
			cType = pc.cocks[0].cType;
		}
		if(!pc.hasCock() || cType != GLOBAL.TYPE_CANINE) 
		{
			output(" What you see shocks you to your core: <b>");
			if(cType == -1 || (cType != GLOBAL.TYPE_CANINE && cColor != "bright red")) output("a bright red, tapered dick");
			else if(cColor != "bright red") output("a bright red dick");
			else output("a canine-style tapered tip");
			output("!</b>");
		}
		if(pc.hasCock() && (pc.cocks[0].cLength() < 12 || pc.cocks[0].cLength() >= 20))
		{
			if(!pc.hasCock() || cType != GLOBAL.TYPE_CANINE) output(" It’s");
			else output(" Your shaft is");
			if(pc.cocks[0].cLength() < 12) output(" longer");
			else if(pc.cocks[0].cLength() >= 20) output(" shorter");
			if(!pc.hasCock() || cType != GLOBAL.TYPE_CANINE) output(" too");
			output("!");
		}
		if(pc.hasCock() && (pc.cocks[0].cLength() >= 12 && pc.cocks[0].cLength() < 20) && cType == GLOBAL.TYPE_CANINE) 
		{
			output(" It’s beautiful. " + num2Text(pc.cocks[0].cLength()) + " inches of glossy crimson cock quivering in the moment before orgasm. You really do have the perfect cock.");
		}
		else
		{
			output(" The bestial-looking member looks to be");
			if(!pc.hasCock() || pc.cocks[0].cLength() < 12) output(" a little over a foot long - maybe fourteen inches");
			else output(" shorter, but well over a foot long - maybe eighteen inches worth");
			output("? It’s beautiful, all that glossy cock quivering in the moment before orgasm.");
		}

		// no knot
		if(!pc.hasKnot(0)) output("\n\nTwisting spasms rocket through your prong as you pass over the edge, distorting the flesh near the base, bulging the crimson length out in a cruelly oversized parody of a dog’s knot, rounding it wider and wider. You can feel your [pc.cum] pumping and surging, but it doesn’t emerge just yet, not while your animalistic endowment is still growing. You grab the bulb with both hands and squeeze, nearly whiting out from the pleasure. Long arcs of canine-tainted seed spray through the air as you soak yourself in newly-christened doggie cum.");
		// knot
		else output("\n\nSpasms of bliss rocket through you as you finally pass over the edge, your [pc.knot] inflating, then inflating some more... then again. No [pc.cum] emerges, not while your canid anatomy is swelling. You whimper like a lost puppy as your knot attains whole new levels of engorgement, and when you can take it no more, you grab hold with both hands and nearly white out from the pleasure. Long arcs of canine-style seed boil out of your body in high-pressure shots, raining down to soak you in voluminous strings of doggie cum.");

		//Merge
		output("\n\nWringing your newborn dog-dick in both hands, you milk it for every drop of relief it will offer");
		if(pc.balls == 0) output(", not even noticing the way a fresh pair of balls fills out a stretchy patch of thong just below");
		output(". You’re too focused on your cock to care about the mess, or being seen, or anything but pumping every droplet of spunk from your transformed bitch-breeder. <i>‘It’s important to release any pent-up fluids,’</i> you realize. <i>‘A well-milked cock is a healthy cock... and a cum-stuffed cunt is more than a cure for depression. It’s practically a cure-all... one you should be sharing, not wasting all over yourself!’</i>");
		output("\n\nYou lick your hand clean and regard your thick, canine cock. It glistens with a sheen of dribbling cum, still hard and ready to go. You can already feel yourself filling back up with tension, but you’re a nurse, aren’t you? Surely you can find a patient or two in need of a little vitamin D. Or three. You feel like you could solve the whole planet’s problems; you just need to talk the right people into letting you give them an ‘injection’.");
		output("\n\nThe costume’s name finally makes sense; <b>you truly are a knotty nurse!</b>");
	}
	//No dick
	else
	{
		output("\n\nHead lolling, you sneeze again, hard enough for your body to jerk the whole way down to your [pc.hips]. <i>Fuuuck, you’re warm down there.</i> You pump your hips experimentally, every small thrust turning up the heat suffusing your loins. Reaching down, you don’t bother to look, rubbing yourself through the gap in the panties, fingers slipping deep into the frictionless fabric to press on the tenderest, tightest parts of you.");
		output("\n\nYour body presses back. A mound of [pc.skin] gives your fingers something to rub or stroke. Dizziness finally overwhelms you as blood shifts south, your heart beating hard. You collapse onto your back and hump your hand. It’s the only thing that seems to make sense. Groaning, you swivel your pelvis rapidly, grinding <i>something</i> into your palm. It’s firm and hard, and it feels <i>so good</i> to touch that you’re compelled to squeeze and tug on it, helping it grow longer and heavier.");
		output("\n\nIt’s like... jacking off, like you’re a horny teen tugging [pc.himHer]self off for the very first time. Like you don’t even know what you’re doing, but your body is compelling you to do <i>something</i>. Powerful urges grab you by the wrist and bide you to stroke faster and harder. You moan in ecstatic delight as the pleasure mounts alongside your inflating flesh, whimpering as you look down and catch sight of exactly what you’re playing with.");
		output("\n\nIt’s a cock. <b>You have a cock.</b> Not just any cock. A <i>big</i>, knotty one - undeniably canine.");
		if(pc.isAusar()) output(" You aren’t even an ausar, but it’s there all the same.");
		output(" It’s tall enough for you to admire every detail of its angular tip, fire-engine red and visibly pulsating, every heartbeat carrying it a millimeter higher. At its base, a soft-furred sheath has formed, neatly hidden beneath the opening in your panties. You can scarcely believe the bloated knot would ever slip back inside it, and it’s <i>still swelling</i>.");

		output("\n\nTongue lolling, you arch your back. Powerful, animalistic instincts grab hold of your fingers and drag them down to the knot, squeezing it. Lightning bolts of canine bliss erupt from the tender orb, washing over your body in convulsions of ecstasy. A second later, molten spurts of relief well out of your tumescent bitch-breaker, cascading across your vinyl-wrapped ");
		if(pc.biggestTitSize() >= 1) output("tits");
		else output("chest");
		output(". Dribbles of aromatic cum wash down the sides of the bizarre costume like drops of rain on a windshield, leaving nothing behind but the fabric’s own gloss and the lingering scent of orgasmic passion.");

		output("\n\nWringing your newborn dog-dick in both hands, you milk it for every drop of relief it will offer");
		if(pc.balls == 0) output(", not even noticing the way a fresh pair of balls fills out a stretchy patch of thong just below");
		output(". You’re too focused on your cock to care about the mess, or being seen, or anything but pumping every droplet of spunk from your foot-long bitch-breeder. <i>‘It’s important to release any pent-up fluids,’</i> you realize. <i>‘A well-milked cock is a healthy cock... and a cum-stuffed cunt is more than a cure for depression. It’s practically a cure-all... one you’re now equipped to dispense with all the ardor of a rutting laquine!’</i>");
		output("\n\nYou lick your hand clean and regard your thick, canine cock. It glistens with a sheen of dribbling cum, still hard and ready to go. You can already feel yourself filling back up with tension, but you’re a nurse, aren’t you? Maybe you can find a lonely girl with a vitamin ‘D’ deficiency...");
		output("\n\nThe costume’s name finally makes sense; <b>you truly are a knotty nurse!</b>");
	}
	//TO ZE NEXT PART
	processTime(25);
	pc.orgasm();
	pc.lust(40);
	clearMenu();
	addButton(0,"Next",knottyPartyII);
}

public function knottyPartyII():void
{
	clearOutput();
	showName("\nPARTY!");
	author("Fenoxo Fenbruxumis");
	output("You’re a bit wobbly post-orgasm, but your gait steadies as you make your way back to the festivities. Your costume is flawless, showing no signs of the recent semen-shower, though you suppose you still smell faintly of sex. Crinkling your nose, you giggle when you realize the scent will help you fit in that much better.");
	output("\n\nBreezing through the crowds seems second nature. When hands fall on your brazenly exposed cock, you playfully offer a full-body check-up. When girls blush and turn away, you lean on their shoulders and inform them that you’re a professional and know how to keep things confidential. More than once, you think you’ve found a patient, but the party-folk appear more interested in flirting than being <i>medically serviced</i> for the time being.");
	output("\n\nWearing your friendliest smile, you try to ignore the increasingly heavy-feeling weight between your [pc.thighs] as you ensure that everyone is healthy, happy, and not at all in need of being fucked into unconsciousness. Being a nurse at parties like this is a challenging job, but someone has to do it. Looking down at your drooling dog-dick, you nod to yourself. You’re the best [pc.manWoman] for the job.");
	output("\n\n<i>“Heyyyyyy,”</i> a too-relaxed voice purrs from below. <i>“Thaaaats... a biiiig... dick.”</i>");
	output("\n\nA naked ");
	if(!CodexManager.entryUnlocked("Rodenians")) 
	{
		output("mouse-girl that your Codex identifies as a rodenian");
		CodexManager.unlockEntry("Rodenians");
	}
	else output("rodenian");
	output(" is staring at your still-erect length from below, licking her lips. She’s a petite thing with wide eyes, huge ears, and lipstick that looks to have been smudged by far too many blowjobs. Neon-glowing beads drape her neck and wrists, proudly displaying the absolutely whorish numbers of party favors she’s indulged in. More concerning are the dozens of cum-stains dotting her fur and the vacant look in her eyes, like she’s not seeing anything else but your dick.");

	//Read codex
	if(!CodexManager.entryViewed("Rodenians")) output("\n\nYou know from the Codex article about how suggestible rodenians can be after a good fuck.");
	//Not read
	else output("\n\nA quick skim of your Codex informs you that rodenian anatomy actually locates their vaginas in their ears or all places, and that sex leaves them in a hyper-suggestible state.");
	//Merge no new pg
	output(" Someone must have done a number on this one. The poor girl can’t even seem to remember how to get what she wants. She’s just staring at your rosey shaft and babbling, <i>“I... waaaant it. Waaaant that cock.”</i> She points at it, head nodding like a dashboard toy. <i>“Mmmm... suck caaaaawwwwk all niiight... beads... beads-r-goooood.”</i>");
	output("\n\nIn your professional opinion, she’s still out of it from her last lay, but not nearly enough for you to reverse the damage from a night’s worth of debauchery and sluttifying commands. If you don’t intercede, she’s going to wind up someone’s personal toy. Fortunately your fat knot could open her psyche up for easy repair. You just have to fuck her juicy ear-cunts a bit first.");
	output("\n\nYou’re just about to give her the treatment she so desperately needs, which is also sort of what she’s asking for you anyway, when you hear a cry of distress from across the street. A group of revelers struggles to drag their unconscious friend away from feverishly masturbating ausar woman, modded to stand over eight feet tall. Her small horns and enormous, milk-seeping breasts hint at bovine modifications");
	if(pc.isTreated()) output(", Treated by the smell of it");
	output(". <i>“I swear to God, if one of you limp-dick party-bitches can’t step up to the plate, I’m going to murder someone!”</i>");

	output("\n\nTypical hellhound breeding hysteria. A rare but potentially difficult side effect of New Texas’s “Treatment”. As a knotty nurse, you won’t even need any medical impliments to calm her down. Just a little time between her thighs, and perhaps another “Knotty Booster.”");
	output("\n\nTwo women, both in dire need of medical attention. Do you try to help the abused rodenian try to find her way back to normalcy, or stop the rampaging hell-hound before she kills someone?");

	processTime(55);
	pc.lust(40);
	clearMenu();
	//[Rodenian] [Hellhound]
	addButton(0,"Hellhound",knottyNurseHellhound);
	addButton(1,"Rodenian",knuttyNurseRodenian);
}

public function knottyNurseHellhound():void
{
	clearOutput();
	showBust("HELLHOUND");
	showName("\nHELLHOUND!");
	author("Fenoxo Fenbutt");
	output("You step closer to the hellhound, your drooling dog-dick waggling in anticipation while you anonymously report the rodenian’s location to the local Peacekeepers. That handled, you raise your voice. <i>“Over here!”</i>");
	output("\n\nThe dark-furred ausar growls, but at the sight of your exposed, bright-red tool, her expression softens - slightly. <i>“You expect me to fuck that toothpick?”</i> Bodies go flying as she thrusts her way through the crowd, muscled abs and oiled-up tits glistening. <i>“You couldn’t satisfy a virgin kaithrit, let alone a real woman.”</i> She grabs her crotch, scooping up a handful of the fragrant, gooey girl-cum. A sudden slap impacts your cheek, staggering you. Pain and pussy-musk dizzy your senses as the horny beast bears down on you, pinning you to the hard asphalt.");
	output("\n\n<i>“Oof!”</i> you cry, immense thighs on either side of your [pc.chest], that sodden pussy heavier than a bag of bricks. Your dick threads through her muscled, bubbly butt-cheeks, savagely squeezed by the muscles’ errant flexings.");
	output("\n\n<i>“That’s what I thought. You’re about to bust a nut all over my back.”</i> Her tail swishes back and forth across your taut, bound balls. <i>“How are you supposed to keep it up long enough to satisfy me.”</i> She bends low, almost double, to look you in the eye. <i>“How the fuck are you going to take care of </i>me<i>, little nurse?”</i>");
	output("\n\n<i>“Try me.”</i> The wheezing declaration sounded better in your head than it came out. Nevertheless, the violent woman seems appeased.");
	output("\n\n<i>“Better not be pulling my tail, bitch.”</i> The ausar vaults up... and down, straight onto your dick with an audible squelch. Her capacious cunny swallows you whole, double-wide knot and all. Pussy-juices and leftover cum splatter across your legs from the brutal impact. Her well-used passage squeezes down hard, swaddling you in cummy folds that vacillate unbelievably between vice-tight and sloppy whorishness.");
	pc.cockChange();
	output("\n\n<i>“Hrmmph!”</i> the hellhound growls, springing up into the air only to slam back down a moment later, cunt fluttering beautifully. <i>“You call this a dick?”</i> She slaps you across the face, hard, mid-thrust. <i>“I can barely notice it.”</i> Reaching behind her, she grabs a fistful of your balls and gives a threatening squeeze. <i>“You think these little nuggets are going to please me?”</i> The pressure rises until the ausar grows bored of seeing you squirm and turns to your [pc.nipples], barely concealed by the slutty uniform. <i>“You’re more fun to torment than fuck.”</i> Hundreds of pound of well-muscled fuck-beast settle on top of you. <i>“Let’s see how long it takes you to bruise...”</i>");
	//[Next]
	processTime(10);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",knottyNurseHellhoundII);
}

public function knottyNurseHellhoundII():void
{
	clearOutput();
	showBust("HELLHOUND");
	showName("KNOTTY\nCURE-ALL");
	author("Fenoxo Fenbutt");
	output("<i>“Wait!”</i> you beg, throwing up your arms.");
	output("\n\nThe amazonian ausar grimaces. <i>“What now? How many times are you going to waste my time tonight?”</i> She drags her hips back and forth, hard, bodily grinding you against the pavement with nothing but her cunt. <i>“Why couldn’t you have just been a decent dildo?”</i>");
	output("\n\nYou grab two of the medipens from the holster around your thigh. <i>“It’ll be worth it. I promise!”</i> Or so you hope. Jabbing them against your thighs, you hear the faint hiss of them unloading their tainted payload into your bloodstream.");
	output("\n\nThe buxom bitch riding high on your dick watches impassively, lips halfway pulled into a snarl. <i>“I’m waiting.”</i>");
	output("\n\n<i>“One...se-s-s-s-sss...”</i> you stutter, trailing off as your thoughts and plans splinter off into a dozen whirling pools of indifferent, half-thought fantasies, each lewder and rauncher than the last. You try to focus on the ausar’s heaving, perfect breasts, but they split into a quartet of milky mammaries, their nipples stirring swirls in the fabric of space with her every breath. Looking higher, you see two perfect faces scowling down at you, fangs bared.");
	output("\n\n<i>“A fucking junkie. I should’ve known.”</i>");
	output("\n\nA bonfire of pleasure chooses that moment to light in your loins, bringing with it a profusion of flesh-altering growth. Your bitch-embedded boner quakes inside the angry mynx’s channel, culminating in a single, potent, cunt-straining flex. This time, it isn’t the hellhound’s well-used twat muscling down on you, but you muscling it open, stretching those filthy folds wide enough that there’s no doubt she can feel it. Panting, you lip your chops and howl and pleasure, cock still growing.");
	output("\n\n<i>“Wha-wha....”</i> The dark-furred dog-girl whimpers in confusion and mounting satisfaction. As your cock-tip threads deeper into her channel, pressing up to kiss her cervix, she pauses, tail wagging happily. <i>“H-how?”</i>");
	output("\n\nYou’re in no position to answer, not with every thought warring over which way you should fuck her and your body unable to do anything but lie there and make your dick even bigger. Your sack joins in on the fun. Weight floods your balls as the expanding nuts fill with more seed than they can comfortably hold. Rounder and rounder they grow. Your poor thong balloons, then snaps back, shimmery fabric compressing into a ball-flossing strip. The ausar’s wagging tail tickles the raw, sensitive skin with maddening brush strokes.");
	output("\n\n<i>“G-g-god, it’s still getting bigger!”</i> Squirming madly, the giant of a woman tips forward, catching herself on her palms at the last second. Her cushiony breasts slap together around your head, blocking your vision of anything but creamy smooth skin and the dark crevasse of her cleavage. Whiffs of milk tickle your nose as the amazon’s pleasured squirming causes her to lactate uncontrollably.");
	output("\n\nYou gasp, weak everywhere except where it counts, feeling your red, turgid mast continue to burrow deeper into her, stretching the mutated ausar’s cervix deep. It bulges through the skin of her otherwise taut belly, letting you feel your length climb higher, the knot inflating wider by the second. It’s fat enough to ruin a lesser woman, and you’re not even cumming yet. The idea of you finally achieving release and feeling your knot grab hold solidifies as the high fades. <i>You have to break in this rebellious bitch.</i>");
	output("\n\n<i>“Oh yeah!”</i> the hellhound growls, gingerly moving her hips. <i>“That’s a dick!”</i> She pulls your head into her cleavage her crotch begins to rock once more, dragging the knot through the lust-slicked tunnel. <i>“Guess those drugs were good for something after all.”</i> Leaning back, she lets her dripping milk splatter your face. <i>“You’re gonna make me cum, hot stuff.”</i> She laps the milk from your face like a kaithrit slut. <i>“You’re gonna make me cum, and this monster dick-”</i> She gives it a squeeze through the taut skin of her abdomen. <i>“-is going to fall in love with my cunt.”</i>");
	output("\n\nMaybe it’s the residual chemicals in your bloodstream, but you can understand the sentiment. Now that your cock is bigger, it can more clearly register the hellhound’s affections, its veiny surface giving her a proper rod to grip. Those lush cuntlips may as well be stroking your brain for how clearly you feel the electric lust coursing through you. Your vision seems tinged pink, filled with lovely breasts and the brunette’s all-too appealing smile, everything painted beneath a layer of cock-massaging pussy-pleasure.");
	output("\n\n<i>“Now you’re acting like a proper dildo,”</i> the oversized bitch coos, really starting to get into it. Her hips lift up and slap down again and again, ravishing herself on your bright red rod. She pounds away at your crotch like it owes her money. It’d hurt if you won’t so well-endowed now, your plumped up dog-cock robbing her of momentum with unceasing friction every step of the way. <i>“Just fucking cum already!”</i> Her cunt squeezes you tight, begging you to dump your hot load directly into her womb. <i>“You know you can’t help yourself with a real bitch like me.”</i>");
	output("\n\nIt’s true. You swoon when her tits swing low once more, cock throbbing needfully, your balls taut and heavy. As you begin to suckle, drinking deeply of her milk, ardor rising apace with the size of your knot, you feel lightheaded and euphoric.");
	output("\n\n<i>“Oh! It’s coming, isn’t it?”</i> The hellhound arches her back, yanking a milk-squirting nipple from your mouth, hips pressing powerfully downward to take you to the hilt. She grabs you by the shoulders for more leverage, wanting you deeper. Growls of ecstasy well up from her enormous, jiggling chest as her cervix ever-so-slightly parts for your tip. Her eyes roll back from the pleasure of finally having her itch scratched. <i>“F-f-fuck I’m cumming?”</i> She seems confused by the answering passion.");
	output("\n\nThe first eruption of seed into her waiting womb is exactly what you both needed. Muscles quivering and straining, you feel the next jet rushing through you, liters of fluids racing through chemically-enhanced biological piping in seconds. It bursts into the ausar’s overdeveloped womb unrestrained, thick enough to cling to her walls and copious enough to plump her middle.");
	output("\n\nThe hellhound falls slack, dribbling milk, her pussy still milking you. Sublime groans pour out of her in an unceasing display of feminine satisfaction. Every rope of cum you drizzle into her womb is demarcated in squeaks of delight. It’s exactly what she needs, and now that you can feel your overworked balls draining, exactly what you needed as well. You lie in the middle of the cheering crowd, shooting lance after lance of canine-flavored seed into that fertile bitch’s cunt.");
	output("\n\n<i>“Ohhhhhhh yeaaahhhhh,”</i> the ausar purrs, stroking your head. She plants kiss after kiss on your [pc.lipsChaste], pussy still powerfully milking your cock. <i>“Breed me, you big, walking dick.”</i> She ravishes you in gentle, confused attention, thick thighs quivering against yours. She wiggles, trapped by your bowling ball of a knot, reproductive system pried wide open. The gurgles of gushing fluids bring smiles to both your faces as your eyes drift closed, heedless to the growing orgy around you...");

	processTime(40);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",knottyNurseEpilogue);
}

//[Rodenian]
public function knuttyNurseRodenian():void
{
	clearOutput();
	showBust("RODENIAN");
	showName("\nRODENIAN");
	author("Fenoxo Fenbutt");
	output("You step closer to the rodenian, your drooling dog-dick waggling an inch away from her face to hold her attention while you log an anonymous tip to the local peacekeeping unit.");
	output("\n\n<i>“Suck-and-fuck orrrr.... Fuck-then-suck?”</i> The vulnerable mouse-girl glances up you questioningly, then back down at your dick. She licks her lips, fingers fidgeting with her beads.");
	output("\n\n<i>“Fuck then fuck some more,”</i> you answer, scanning the area. There! An empty holobooth. It’s covered in graffiti, but once the privacy shroud and noise dampeners kick in, you’ll have some alone time.");
	output("\n\nNodding happily, your short-statured slut bounces eagerly. Her beads clack noisily. <i>“I loooove cock.”</i> She nuzzles up to your length, whiskers tickling the turgid prick. <i>“Cock makes me happy. I’m a happy girl.”</i> The words fall out of her seemingly by rote. <i>“Will you bang me into your stupid, pregnant cock-holster?”</i>");
	output("\n\nFinding the woman under all the suggestions won’t be easy. <i>“Sure thing, sweetheart.”</i> You grab her by the hair and press her well-used muzzle harder into your crotch, her nose digging into the fabric of your medical-grade thong. <i>“Atta girl. Let’s go in the holobooth for a little privacy, ya?”</i>");
	output("\n\n<i>“Okay,”</i> the rodenian murmurs, sniffing your crotch like it’s candy. <i>“But get some in my fur so everyone can see what a good little rat-slut I am.”</i>");
	output("\n\n<i>“Of course,”</i> you promise. <i>“I’ll cake your face in it.”</i>");
	processTime(10);
	clearMenu();
	addButton(0,"Next",knuttyNurseRodenianIPt5);
}

public function knuttyNurseRodenianIPt5():void
{
	clearOutput();
	showBust("RODENIAN");
	showName("\nRODENIAN");
	author("Fenoxo Fenbutt");
	output("The inside of the holobooth is trashed. Keys are ripped from the console. The cushions are ripped and stained from hard use and the casual cruelty of inebriated strangers. A diagonal crack splits the screen into three pieces that flicker dully, straining to show a centuries old user interface. You’re surprised it works at all.");
	output("\n\n<i>“Mmmm, gonna get me some cock,”</i> the mouse-girl says as she grabs your bright-red boner in both hands. She’s a little more lucid now, away from the crowd, more intent satisfying her endless thirst for phallus. <i>“So convenient.”</i> She fondles your knot, circling a finger around the edge of your cock-exposing thong. <i>“Amazing. Why so many people hide their dicks away, I’ll never understand. I used to, I guess, but cocks... wow.”</i> Her voice is rich with wonder as she crosses her eyes to take in the sight of your leaky dick-head. <i>“They’re the most beautiful things in the universe... and the juices that come out of them.”</i> She shudders, tail curling around her torso. <i>“Wow. I’m addicted to it.”</i>");
	output("\n\nYou try hard to maintain an air of professionalism, but it’s hard when you’ve got such an eager tramp pawing at your insatiable doggie-dick. <i>“I can see that. How long have you... loved penises like this?”</i>");
	output("\n\n<i>“Umm...”</i> The rodenian’s nose scrunches up as she racks her brain. You can almost see the forgotten connections firing in her head. <i>“A few hours I guess? This nice galotian helped me understand how nice it is to cum.”</i> She cups your ");
	if(pc.balls > 0 && pc.ballDiameter() >= 5) output("tightly ");
	output("compressed balls, a mischievous look on her face. <i>“I get it now, though. Cocks </i>are<i> amazing. They deserve to be sucked and fucked at every opportunity.”</i> She licks a dollop of pre-cum your tip, pupils visibly dilating. <i>“And cum is </i>soooo<i> good. After the party, I’m going to move to a kui-tan colony so I can have it for every meal... I’ll be the best cum-dump on the whole planet. So good I’ll get enough to bathe in it.”</i>");
	output("\n\nYour balls squeeze tight at the suggestion, much to the delight of the petite rodenian.");
	output("\n\n<i>“Oooh, you liked that, didn’cha? You like it when the rat slut talks about gargling semen?”</i> She sucks another squirt of pre from the tip of your dick, shivering in delight. <i>“Or would you rather put it in my ears, where it belongs? Fuck me until my ears are just cups full of jizz and your every word becomes my gospel truth? I bet you’d like that, wouldn’t you?”</i>");
	output("\n\nYou moan. It’s not a conscious choice, simply a reaction to finally get your rabidly erect cock in the hands of someone who is finally going to use it. And that someone is slurping on your tip like a milky teat.");
	output("\n\n<i>“Mmhmmm,”</i> the slutty mouse purrs, diving deeper. Strokes of her tiny tongue ravish your underside. She tilts her head to the side, rotating around to lick whole new swathes of cock, showing off every skill her dick-sucking crash-course has lent.");
	output("\n\nA name. You should really ask her name. You grab her by the ears and thrust forward, burying your length up to the knot in her sinfully sweet lips. <i>“W-what’s your name?”</i>");
	output("\n\nThe rodenian looks up at you from around your bestial tool in blank-eyed confusion, still licking. She makes a chittering, purring sound deep in your throat that vibrates through your flesh.");
	output("\n\nYou grab hold of her by the ears, struggling with the desire to bury your bone to the hilt, but your better sense asserts itself; you’ll get to ravage her soon enough. Yanking back, you drag her off your cock. It isn’t easy, not with how she sucks. Her cheeks hollow and her lips stretch out, fighting for every inch of dick, battling to hang on with every ounce of sensuality in her phallus-obsessed form. The ‘pop’ of her mouth’s vacuum-seal finally breaking carries more disappointment than you thought possible. <i>“Awww...”</i>");
	output("\n\nYou stare down at your eager cock-slut. She licks her lips and turns her head slightly, ear flaring back to let you look inside at the fattened folds of her strangely-positioned cunt. It’s smeared with juice. Holding yourself back takes every ounce of your ");
	if(pc.WQ() <= 25) output("exceedingly weak ");
	else if(pc.WQ() >= 75) output("impressive ");
	output("willpower. <i>“Your name.”</i>");

	output("\n\nThe mouse grabs the edge of her ear and yanks it hard, spreading the entrance further open, a web of translucent arousal the only thing in your way. <i>“Slut.”</i>");
	output("\n\n<i>“What?”</i> you rock back, but her dick hand grabs your dick to keep you from slipping away.");
	output("\n\n<i>“Slut. Bitch,”</i> the rodenian rattles them off with casual carnality, every word making her blush harder and smile broader. <i>“Whore. Toy.”</i> She jacks you, smearing her spit over every inch. <i>“My name’s whatever you want to call me. Just put your dick in already. Pleeeeeeaaase?”</i>");
	processTime(25);
	clearMenu();
	addButton(0,"Next",knuttyNurseRodenianII);
}

public function knuttyNurseRodenianII():void
{
	clearOutput();
	showBust("RODENIAN");
	showName("\nRODENIAN");
	author("Fenoxo Fenbutt");
	output("You can’t ignore a voice in need, not when you’re this hard, this anxious to let off another load. Howling in concern and arousal, you grab the rodenian in your hands and press your canine cunt-destroyer to her sodden slit, staggering as it all but pulls you in. She’s seen more than enough action tonight to loosen her up, and the first eight inches go in without issue.");
	output("\n\n<i>“Cooooooock,”</i> the horny fuck-toy moans. <i>“Mmmmmm~!”</i>");
	output("\n\nLooking down, you see her mouth hanging open, tongue flopping around. As you mount her, you realize that she’s almost completely limp, letting you manhandle her however you like. The knot presses to her perverse pussy before you know it, and the whorishly groaning mouse shows no signs of discomfort. She’s staring up at you, sidelong, adoringly. A bit of drool leaks from her maw as her stare gradually loses focus, eyes distant and far away.");
	output("\n\n<i>“Are you okay?”</i> You can’t keep the concern out of your voice.");
	output("\n\n<i>“Yeaaaaaahhh...”</i> The rodenian makes an attempt to swallow, then resumes vacantly drooling. <i>“Okayyyyy...”</i>");
	output("\n\nThat was... fast. Looking down, you realize you’re still sort of idly fucking her, then shrug. She doesn’t seem to mind. In fact, judging by the quivering of her passage and the spreading flush on her cheeks, she quite likes it. You pound away for a minute or two, getting used to the unusual position, the way her hair bounces against your [pc.thighs], making sure you angle yourself properly to really press on her hedonary gland.");
	output("\n\nTreatment will require her to be as impressionable as possible. <i>“Fuck, your ear-cunts feel nice.”</i> You can hardly hold the compliment in.");
	output("\n\n<i>“Ear-cunts... feel niiiiiice...”</i> the rodenian echoes, nodding floppily, twisting her tugging passage around your boner.");
	output("\n\nNot a very difficult suggestion for her to internalize, but it gives you some clue to her mental state. Still, you can do more. If you’re going to cure her, you’ll need your knot properly squeezing her hedonary gland. <i>“Relax. This is going to feel very, very good.”</i> You stroke the back of her head, then yank out, bracing yourself. <i>“Trust me. I’m a professional.”</i> Thrusting back in, you bury your bone to hilt, your knot slipping inside with a lewd-sounding squelch. Neck bulging from how deep you’ve taken her, the rodenian squeaks, tail lashing behind her.");
	output("\n\nHer expression goes completely vacant in the exact moment that you start to cum. Seed sprays into her vaginal ducts, wicking away to her alien wombs as you try to remember what you were going to do.... Oh! Her name. You rock back and forth, really grinding your knot in there, as you consider your options.");
	output("\n\nYou could try to re-establish her old name, re-name her yourself, or let her live the rest of her life as ‘Toy,’ now and forever.");

	processTime(10);
	pc.lust(50);
	clearMenu();
	addButton(0,"Old Name",knuttyNurseRodenianIII,"nice");
	addButton(1,"Suzy",knuttyNurseRodenianIII,"mischievous");
	addButton(2,"Toy",knuttyNurseRodenianIII,"hard");
}

public function knuttyNurseRodenianIII(choice:String):void
{
	clearOutput();
	showBust("RODENIAN");
	showName("\nRODENIAN");
	author("Fenoxo Fenbutt");
	//Pick her name - misch
	if(choice == "mischievous")
	{
		pc.addMischievous(10);
		flags["RODENIAN_MINDFUCK"] = 1;
		output("<i>“I’m going to call you Suzy,”</i> you proclaim. <i>“Sounds good?”</i>");
		output("\n\n<i>“Soooo good,”</i> the rodenian echos, wiggling happily. Her tunnel squeezes down, milking a fresh rope from your canid prong.");
		output("\n\nSmirking in self-satisfaction, you set to work impregnating her wombs and mind with equal ease. <i>“It’s such a pretty name.”</i> You wiggle your hips, hammering at her trance-inducing gland. <i>“The prettiest name you’ve ever heard, and it’s all yours.”</i> You grab her skull in both hands and jackhammer for the inch or so that your bulge-locked boner will allow you to move, cumming harder and hotter. <i>“It’s a sexy name. Just like you, Suzy.”</i>");
		output("\n\nSuzy wobbles bonelessly. If you didn’t have your hands and knot to immobilize her, she’d already be on the floor. <i>“Sexy-suzy!”</i>");
		output("\n\n<i>“Yeah, feel all that cum I’m pumping into you?”</i> Canine orgasms are so long. You feel like it’s never going to end! <i>“It’s not just cum. It’s a whole identity.”</i> You stroke a finger along the thin edge of her mousey ear, reveling in your mind-fucking metaphor. <i>“The more I shoot into you, the more you become Suzy.”</i> You feel a bit guilty, but your cock doesn’t mind. The next ejaculation feels longer and harder than the one that preceded it. <i>“Such a sexy, sweet Rodenian girl.”</i>");
		output("\n\nThe mind-fucked mouse whispers, <i>“Sexy.”</i>");
		output("\n\n<i>“Yes you are, Suzy. You’re desirable.”</i> More orgasmic throbs deposit thick loads into her, slowly draining down to fill up the wombs in her tits. They already look bigger, swollen with jizz. <i>“You’re confident.”</i> Her ear-pussy, slick and wet, wrings your cock hard. <i>“Flirty!”</i> It feels almost like she’s squeezing the words out of you. <i>“Saucy and... Ah! S-smart! Too smart to fuck anybody but the best!”</i>");
		output("\n\nNodding, Suzy inadvertently wrings your bestial phallus, twisting her pliant flesh back and forth, back and forth. <i>“Toooo smart!”</i>");
		output("\n\n<i>“But you </i>love<i> cum, don’t you, Suzy?”</i>");
		output("\n\nSuzy quivers at that, making a half-hearted effort to reach for your balls. She almost makes it.");
		output("\n\n<i>“Yeah you do. You told me all about it.”</i> You bounce her head against your crotch, squirting and cumming in ecstasy. <i>“And now it’s cum that’s fixing you - that’s turning you from a worthless cum-rag into a lovely girl: a Suzy.”</i>");
		output("\n\n<i>“Ahm... I’m Suzy.”</i> Her shoulders slump, a great deal of tension vanishing with that confession. <i>“Suzy slooty Suzy Suzy!”</i>");
		output("\n\nResting your balls against her cheek, you quietly shush her sing-song nonsense. <i>“That’s right, Suzy. You’re not just any old slut. You’re Suzy. You love cum, but you know if you let any old schmuck pump it into your head, they’ll fuck you up. So you guard your ears carefully. It’s better to taste the cum on your tongue anyway. Because you do so love the taste of cum, don’t you?”</i>");
		output("\n\nSuzy licks her lips, savoring the trace amounts of sperm caked into her fur. <i>“...love it.”</i>");
		output("\n\n<i>“You love it so much that the taste drives you wild. It makes you so wet, so deliriously horny that a few swallows can make you orgasm. With a big enough load, you’ll be in danger of blacking out from mouthgasms.”</i> You tug the edge of her ear hard, grinding your ");
		if(pc.hasFur()) output("furry ");
		output("crotch against her sensitive membrane. <i>“You </i>prefer<i> it in your mouth, actually. The orgasms feel so much better when they’re purely based on cum-swallowing.”</i>");
		output("\n\nSuzy whimpers, <i>“Ah! C-can you p-put it in my mooouth? Pleaaaase?”</i> Her mouth opens wide, tongue extended whorishly.");
		output("\n\n<i>“Not yet,”</i> you explain, <i>“not till the knot lets go.”</i> You grind it harder into her, breaking down any remaining inhibitions in order to help you reshape her. <i>“Feeling that sticky goo lingering in your maw, clinging to your teeth is so satisfying.”</i> You shove a finger in her mouth to pacify her, and she sucks it hard. <i>“And a layer of spunk in your throat is absolutely sublime. You love it so much that you don’t even have a gag reflex anymore, do you?”</i> With a rough thrust, you press two digits against the back of her throat, creating a muffled ‘glulk’ sound.");
		output("\n\nThe poor, mind-fucked rodenian shakes in shock from the unexpected insertion, but calms after a second, hollowing her cheeks to keep sucking. Just like that, a powerful neurological instinct is shut down.");
		output("\n\n<i>“That’s right. You love deepthroating, Suzy. It’s your favorite sex-act. You love cock-sucking so much that your ardor will be clear to any future lovers. And Suzy, you’ll be so good at displaying that ardor, at draining the balls of any boy you decide to bang solely with your lips, tongue, and hungry, milking throat.”</i> She sucks your knuckles into her mouth while you talk, earning another thick flow of jism from your approving knot. Through the ecstatic haze, you realize you might need to walk it back a bit before you fuck her up worse...");
		output("\n\nSuzy doesn’t seem to mind...");
		output("\n\nNo! You’re a nurse, and it’s your job to help people out. You gave her a name, and this whole oral-focused thing can work! <i>“Now I know you might be tempted by how great oral feels, Suzy. You might feel the temptation to end every night chugging some stranger’s jizz, but you want more than that.”</i> Sighing happily as the last of your orgasm wicks into her ear, you add, <i>“You want love. You want someone to trust and to cherish, someone you can let dump a hot load into your ears every now and then, in between blowjobs.”</i>");
		output("\n\nSuzy’s eyes roll back in what you assume is orgasmic bliss.");
		output("\n\n<i>“So you’re going to go home, doing everything you can to keep all these party sluts out of your ears, and you’re going to sleep the night off.”</i> You tug back once, but your dick is far too swollen to slip free just yet. <i>“And when you wake up, you’re going to be Suzy through and through. Everything else that got put in your head tonight will have been pushed out by all this cum.”</i> You gently squeeze her sloshing, cum-filled breasts. <i>“And you’ll be flirty, maybe a little slutty, but you’ll also be smart.”</i> You try again, straining your hips until Suzy whimpers. <i>“You’ll know how to be prim and proper - maybe even want to sometimes.”</i>");
		output("\n\nSuzy gasps, letting your fingers out of her mouth at last.");
		output("\n\nWith both hands, you finally manage to extract your cunt-stretching bone from the Rodenian’s creampied ear-pussy. You’re still hard and ready to go serve your next patient. Better wrap this one up. <i>“You might find out that there’s another name for you, on your ID or something. That’s fine. You can use that one, but you know you’ll always be Suzy. You’ll be the girl with an orgasmic tongue and the brains to get what she wants out of life. Now get going, girl.”</i>");
		output("\n\nSuzy blinks her eyes slowly, still quite relaxed and suggestible. <i>“But you said I could taste your cock?”</i> She stretches, heavy tits jiggling as she purses her lips with the all allure of a professional escort. <i>“Please?”</i>");
		output("\n\nYour cum-stained dick vanishes into her maw in that instant, wreathed in the voracious mouse-girl’s thirsty licks and eager sucking. If she minds the residual taste of her pussy, it doesn’t show. In fact, you can see the puffy slits in her ears trembling as her throat bobs, quivering in sympathetic orgasm. Minutes pass with nothing but the lovely caress of her maw and the quiet slurps of her attentions. It feels like it’s never going to end.");
		output("\n\n<i>“S-suzy?”</i> You breathlessly prod. <i>“We need to go.”</i>");
		output("\n\nSliding back with exquisite slowness, her cheeks hollowed whorishly, the rodenian puckers her lips until they pop free of your pointed tip. <i>“Yeah, that’s fine.”</i> She shivers. <i>“I got what I needed. See you around, you horny bitch you!”</i> She kisses your dick and darts out of the booth, tail wiggling into the distance.");
		output("\n\nNow, that you’re properly warmed up, it’s time for your next patient...");
		processTime(30);
		pc.orgasm();
	}
	//Toy - asshole choice
	else if(choice == "hard")
	{
		pc.addHard(10);
		output("<i>“Your name is Toy,”</i> you insist. <i>“You might have been called something else before, but your name is Toy. Not slut. Not whore. Not breeder-bitch.”</i>");
		output("\n\n<i>“Tooooyyyyy,”</i> the rodenian echoes. Her tunnel squeezes down, milking a fresh rope from your canid prong.");
		output("\n\nYou shiver. <i>“Yes, Toy. Because you after tonight, a part of you will always want to be a cock-hungry bedroom toy... but only a part of you, Toy.”</i> You stroke her hair while your cock drools more seed into her fertile passage. <i>“Because the best Toys are ones that can take care of themselves. The best toys don’t act like toys all the time. They seem like normal people. They hold down jobs or take care of houses, or even raise children! They have thoughts and opinions about things when they aren’t embedded on their owner’s cock, and you are that kind of toy, Toy.”</i>");
		output("\n\nToy giggles. <i>“I’m the best?”</i>");
		output("\n\n<i>“You’re the best.”</i> You work your knot back and forth, rubbing it on her sensitive walls, squeezing her until she’s even more suggestible. <i>“You’re the best toy, the kind that wakes up in the morning and takes good care of herself so she can find a loving owner.”</i> Humping her head, you pour suggestions and [pc.cumNoun] into her in equal measure. <i>“You don’t need to throw yourself at every dick on the planet because to you, serving one or two dicks perfectly is a far better rush.”</i> You grind your knot in hard for emphasis. <i>“Like right now.”</i>");
		output("\n\n<i>“Yesss,”</i> Toy hisses pawing at her slowly expanding breasts. <i>“Gooood toy.”</i> Her tail lashes behind her in orgiastic glory.");
		output("\n\n<i>“You’re going to find yourself one or two amazing people that you can trust, and then you’re going to be their Toy. Not a cheap, public set of holes. You’ll be a top of the line dick-pleaser, but only that special someone - or someones.”</i> You shove your thumb in her other ear and squeeze down against her hedonary gland to ensure she’s at the absolute apex of suggestibility. <i>“Once we’re done, you’re going to get your shit together, and you’re going to make sure the only cocks that go near your ears are ones that belong to people you love and trust.”</i>");
		output("\n\nThe submissive rodenian whimpers, drool puddling in her tits.");
		output("\n\n<i>“And all the love of cum and cocks that you’ve felt tonight - it’ll come out for that special person.”</i> You pull your thumb out and stuff it in her mouth, making her savor the taste of her own pussy. <i>“You’ll be a whore for them, a slut for them, or a pregnancy obsessed broodmother - whatever they want. You’ll cum from the taste of their cum. You’ll be intoxicated by their scent. And your pussies will soak themselves at the possibility of sex.”</i>");
		output("\n\nNodding stupidly, Toy twists her aural passage about your fat, jizz-drooling cock, distracting the both of you with hellish pleasure.");
		output("\n\n<i>“Because you’re Toy.”</i>");
		output("\n\n<i>“‘Cause I’m... Toy.”</i>");
		output("\n\nYou resume fingering her, shaking with how good it feels to dump ounce after ounce of canine cum into her so-fuckable ears. <i>“And because you’re a toy, you can turn that off. You’re only a slut when the situation calls for it. When the dick in your face belongs to someone you like and trust. If some asshole in a bar whips out his cock, you won’t even notice it. To you, his crotch will be a barren, humiliating wasteland.”</i> You rock your hips, feeling her lips strain about your bulb for a moment before you relent. <i>“Of course, if you love and trust someone... what will you be?”</i>");
		output("\n\n<i>“A fucktoy.”</i> Toy sounds confident now.");
		output("\n\nYou pet her affectionately, letting the last few ribbons of spunk drain into her fertile passage. <i>“Exactly. And in public or with someone else, what will you be?”</i>");
		output("\n\n<i>“Normal,”</i> Toy groans, shuddering as she climaxes. <i>“I’ll be so normal. Not a slut! Respectable and desired!”</i>");
		output("\n\n<i>“That’s right.”</i> You shudder and yank back harder this time, your knot popping free. A trickle of [pc.cumGem] dangles from the tip, connected to her creampied ear-cunt. <i>“Now you’re going to cover up your ears and go right back to wherever you’re staying, and go to bed.”</i> You wipe your cock on her nose. She barely seems to notice. <i>“Good toy.”</i>");
		output("\n\nThe mouse shivers. <i>“Yahhh... I’m tired. I should cover my ears and go home.”</i>");
		output("\n\n<i>“And Toy?”</i>");
		output("\n\n<i>“Yeeaaah?”</i>");
		output("\n\n<i>“Knots are the sexiest feature a cock can have and your favorite thing to masturbate to.”</i> You felt strangely compelled to say it, but you don’t really regret it. More knot-lovers is a positive for the galaxy.");
		output("\n\n<i>“You know it. Alright... thanks for uh... helping me figure that stuff out, nurse!”</i> The newly renamed mouse disappears into the night. Hopefully she’ll find someone to take care of her.");
		processTime(30);
		flags["RODENIAN_MINDFUCK"] = 2;
		pc.orgasm();
	}
	//Old name - nice choice
	else
	{
		pc.addNice(10);
		flags["RODENIAN_MINDFUCK"] = 0;
		output("<i>“You do have a name,”</i> you instruct. <i>“A lovely name.”</i>");
		output("\n\n<i>“Lovely name,”</i> the rodenian echoes. Her tunnel squeezes down, milking a fresh rope from your canid prong.");
		output("\n\nYou shiver. <i>“It is lovely. It’s the one you had before tonight. The one you used before this party. It’s the most important name you’ve ever been called.”</i>");
		if(pc.tailCount > 0) output(" [pc.Tails] lashing behind, y");
		else output("Y");
		output("ou grind your crotch against her head, fingers scrabbling through her slick fur. <i>“Stars, it’s lovely. Just like your cunt.”</i> Whoops! You shudder, still squirting. <i>“They’re both lovely. Your name and your cunts.”</i> Fuck it - you’re trying! <i>“You have a beautiful name, and no matter what anybody calls you, it will always be your name.”</i> You grind your knot in hard for emphasis. <i>“What’s your name?!”</i>");
		output("\n\n<i>“Luraaaa!”</i> the mouse-girl screams, quivering in mind-breaking (or repairing?) climax. <i>“Lura. I’m Lura.”</i>");
		output("\n\n<i>“That’s right,”</i> you coo, calming. Rushes of orgasmic pleasure surge through you as your [pc.cum] continues to slide into her pussy. <i>“You’re Lura. Not slut. Not toy. Not whore.”</i> You pant. If you had known medical care could be so satisfying, you would’ve went to medical school. <i>“You can BE a whore in the bedroom if you want.”</i> It’s so hard not to give in to the raw sensuality of the situation, to make her a horny, dripping cum-puppet. <i>“And you love big, knotty dicks more than any other kind of dick.”</i> Your bulging bitch-breaker swells in approval. <i>“But you’re more than a cock-holster. You’re a... a...”</i> you whimper, spurting and quivering, taut as a bowstring.");
		output("\n\nLura supplies, <i>“...reaaaallyyyy goooood cock-holster?”</i>");
		output("\n\n<i>“NO!”</i> You scream it, pounding your dick as deep as you can. <i>“You’re a PERSON. You have thoughts and wants and dreams and desires. You might love cock. You might even get off to tasting sperm, but that’s just one part of you.”</i> You stuff your thumb into her other ear, pressing around inside her passage till you find the sweet spot that makes her eyes cross. <i>“You’re only a slutty little cock-mop for guys and herms that have </i>earned<i> it. You won’t throw yourself on dick you see. You won’t even like every dick you see.”</i>");
		output("\n\nLura’s petite mouse-tits swell with the sheer volume of seed you’re dumping inside. Canine orgasms last so long!");
		output("\n\n<i>“But when you find someone who treats you well, who you know you can trust... then you can be the sluttiest little nympho. They might not have an enormous knot like mine.”</i> You flex your abdominal muscles, forcing your dick to throb hard. <i>“But that’s fine. The more you like someone, the more you’ll like their cock. And you can ignore cocks if you need to. I’m fucking that sluttiness deep down into a gutter where it won’t bother you unless you want it to... unless you’re comfortable with it, and you have a wonderful partner that you can trust.”</i>");
		output("\n\n<i>“Yeeeaaaaahhh...”</i> Lura nods, wringing a few more squirts of seed from your overworked shaft.");
		output("\n\nYou shudder from head to toe. Helping out feels almost as good as the climax. <i>“But you’ll always have a thing for dog-dicks.”</i> You can’t help but be a little <i>naughty</i>. <i>“Those big glistening knots drive you wild. If you masturbate, it’ll be with an ausar toy, the fatter the better.”</i>");
		output("\n\n<i>“Knooooots...”</i> the mouse-slut squirms wildly, clearly cumming. Bliss seems her only emotion.");
		output("\n\n<i>“Yes, you love the knots... but only when you’re horned up and turned on. You’re pretty, and talented, and self-actuated. You’re so picky about who you bed. You’re only horny when you’re comfortable with a partner... when you trust them.”</i>");
		output("\n\nLura nods vigorously, and you nearly collapse from the twistling friction assaulting your cock.");
		output("\n\n<i>“You trust me completely.”</i> You can’t help yourself. At least it’s getting a little easier to think now that your balls are mostly drained. <i>“You are driven. And confident.”</i> You press harder with both your cock and your thumb. You want these suggestions to last. <i>“After tonight, you’re going to think long and hard at what you want out of life - besides cock. And you’re going to figure out how to get it. You’ll make sure nobody takes advantage of your ears again until you find someone you can love. Someone you can love besides me.”</i>");
		output("\n\n<i>“...love you?”</i> Lura looks up, eyes glistening.");
		output("\n\nYour dick slips out of her ear at long last, oozing seed and cuntjuice down its shapely, animalistic length. <i>“Falling in love with your medical professional is perfectly normal, but you should find someone better for you.”</i>");
		output("\n\nLura shivers and nods. After a second, she sucks your rigid, feral dick into her mouth, cleaning it.");
		output("\n\nYou let her, for a time, instructing her to go back to where ever she’s staying, get a shower, and have the best night’s sleep.");
		output("\n\n<i>“Kayyyy,”</i> Lura giggles wobbling around as more of your seed drains into her tits. <i>“You’re a super good doctor-nurse-lady-person. I’m gonna go sleep... and then...”</i> She pauses, struggling to think after such a potent fucking. <i>“Then I’m going to figure out what I want out of life and go get it. Yeaaaahh... Byes!”</i> She wobbles out with her hands over her ears.");
		output("\n\nGood girl.");
		output("\n\nJudging by how hard you still are, you can still help someone else...");
		processTime(30);
		pc.orgasm();
	}
	clearMenu();
	addButton(0,"Next",knottyNurseEpilogue,true);
}

public function knottyNurseEpilogue(rodenian:Boolean = false):void
{
	clearOutput();
	halloweenShipMove();
	showName("\nHUNGOVER");
	author("Fenoxo Fenho");
	output("<b>Some time later...</b>");
	output("\n\nYou wake up to the feeling of your spunk-stained sheets clinging irritatingly to your crotch. Peeling back the musky bedding, you rub the sleep from your eyes and look around.");
	output("\n\nYou’re back in your bedroom, but you don’t really recall how you got here. You remember the ");
	if(rodenian)
	{
		output("rodenian - and your attempts to help pull her out of a life of sexual servitude");
		if(flags["RODENIAN_MINDFUCK"] == 2) output(", for better or worse");
	}
	else output("hellhound - and your bruising attempts to bring an end to her hysteria. Turns out the bitch really did just need a hard dicking..");
	output(". After... the night is a blur of bodies and sex, occasionally interspersed with vaguely medical-sounding advice. Just trying to remember it gives you a massive headache.");
	output("\n\nFortunately, the buzzing of a message on your Codex distracts you from further reflection. You pop it open to see a cute, white-furred kaithrit, her small mouth turned down in a worried frown. Her green eyes shift back and forth, checking to see if anybody’s around while she records her message. <i>“Hi,”</i> she starts, her voice low and conspiratorial. <i>“You might not remember me from the party - you were pretty out of it. That’d actually be for the best. Partying with you was awesome, but things got pretty heavy by the end.”</i>");
	output("\n\nThe girl on the recording pauses, a shadow passing by rapidly, indistinct voices muttering from a short distance away. <i>“Look, I don’t know where you got that costume, but it turns out that was some pretty serious tech. They’re saying it’s for ‘experimental sex therapy,’ but if how you were acting is any indication, prostitution seems more likely. Somebody must’ve recognized it, because a bunch of fuckers in dark suits started swarming just ahead of the GPD.”</i>");
	output("\n\n<i>“I work for Customs, so I snuck you out of there before either side could grab you.”</i> She blushes, glancing away from the screen. <i>“It’s the least I could do, after you... Well, anyway. Some pink-haired chick helped too. Said she’d hide the costume and had a bunch of clothes in your size. Even handed off the claim ticket for that ship I put you on. I don’t know who you really are, but you’ve got some good friends. You probably want to stay off-world for a while, at least till all that shit we did blows over.”</i> She gnaws at her lips, chest rising in a regretful sigh. <i>“Well, if I don’t see you again, I just wanted to say I, uh... bye,”</i> she finishes, lamely, looking embarrassed. The video cuts out after that, leaving you with more questions than before.");
	output("\n\nWell, at least Holiday gave you your stuff and your ship back. Even if her costume was more than you were expecting. Shaking your head, you go to dress");
	if(!pc.hasFur() && !pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) output(" and realize that your nose sticks pretty far into view. <b>You have a canine muzzle in addition to your fur!</b>");
	else
	{
		if(pc.hasFur()) output(" and realize you’re completely naked.");
		else output(" and realize <b>your covered from head to toe in fur");
		if(!pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) output(" with a canine muzzle to boot");
		if(!pc.hasFur()) output("!</b>");
	}
	if(pc.femininity < 75 || pc.breastRows[0].breastRatingRaw < 4)
	{
		output("\n\nYou rush to the mirror to check for other changes.");
		if(pc.femininity < 75) output(" <b>Your face is different! Softer, more feminine,</b> with nicely plump lips that promise gentle kisses to sooth your hurts... You shake your head, fighting off the residual thoughts. That costume really did a number on your head, but at least it’s fading.");
		if(pc.breastRows[0].breastRatingRaw < 4) output(" Extra weight hangs from your chest, the better to fill a skimpy nurse’s top. You wager <b>that you have D-cups</b> now.");
	}
	output(" The costume itself is gone, along with its “Knotty Boosters”. Probably Holiday reclaiming her apparently illegal merchandise.");
	output("\n\nYou look down at <b>your bitch-breaking dick and its enormous knot.</b> Damn, that was one hell of a costume.");
	processTime(6*60);
	for(var x:int = 0; x < 10; x++) { pc.orgasm(); }

	applyKnottyNurseTF();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function applyKnottyNurseTF():void
{
	if(!pc.hasCock())
	{
		pc.createCock();
	}
	pc.shiftCock(0,GLOBAL.TYPE_CANINE);
	pc.cocks[0].cockColor = "bright red";
	if(pc.cocks[0].cLength() < 12) pc.cocks[0].cLengthRaw = 14;
	if(pc.cocks[0].cLength() >= 20) pc.cocks[0].cLengthRaw = 18;
	if(pc.cocks[0].knotMultiplier < 2) pc.cocks[0].knotMultiplier = 2;
	if(!pc.hasFur()) 
	{
		pc.clearSkinFlags();
		pc.skinType = GLOBAL.SKIN_TYPE_FUR;
		pc.addSkinFlag(GLOBAL.FLAG_FURRED);
		pc.furColor = "black";
	}
	if(pc.femininity < 75) pc.femininity = 75;
	if(pc.breastRows[0].breastRatingRaw < 4) pc.breastRows[0].breastRatingRaw = 4;
	if(!pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED))
	{
		pc.clearFaceFlags();
		pc.faceType = GLOBAL.TYPE_CANINE;
		pc.addFaceFlag(GLOBAL.FLAG_MUZZLED);
		pc.addFaceFlag(GLOBAL.FLAG_FURRED);
	}
	pc.tongueType = GLOBAL.TYPE_CANINE;
	pc.taint(10);
}


// Cockvine Bikini
public function chooseCockvineBikini():void
{
	clearOutput();
	showHoliday();
	author("TosakunoKishi");
	
	output("You sift through a row of outfits, ranging from standing costumes to the more exotic, before finding what looks like a simple green bikini. Upon closer inspection, you find that it’s made of an odd material. The top is connected to the bottom, by what looks to be a series of intertwining strings, and are comprised of what looks to be a vine. You turn it around and see the distinct tip of a cockvine folding at the back of the top. Your gaze is drawn down and widens as you see a plethora of cockvines bundled up and tied to the bottom, which is also a vine curving around the groin and rear.");
	output("\n\nThe vines masquerading as coverings would only just keep your unmentionables hidden from public view. If you wore this, nearly every inch of your body would be on display for all to look at. But that wouldn’t too bad, you suppose, at least for one night. It’s a party after all.");
	output("\n\nA small tug pulls apart the top, but the second you put the ends close to each other, it locks together instantly. You assume it must be magnets or a proximity chip of some kind. A quick experiment reveals the same to be true for the bottom. Making it easy to put on and remove. Pretty useful for bedroom shenanigans.");
	output("\n\nHoliday files her nails noisily, impatiently waiting for you to make your selection. Noticing you’ve picked something out, she leans forward to see what you’ve got. <i>“Oh, yeah, that’s a cockvine bikini. Don’t worry, they’re not real,”</i> she states, seeing your deepening frown, <i>“It’s a great conversation starter and feels real good on the skin, I assure you. Now are you gonna buy it or not? Kinda wanna join the party before it ends.”</i>");
	if(pc.isMan()) output("\n\n<i>“Oh, yeah, that’s a genuine faux cockvine bikini. Though it’s usually meant for someone with curves, if you catch my drift?”</i> She sighs at your lack of reaction, <i>“Well, I suppose it’d make a great conversation starter. Now are you gonna buy it or not? I kinda wanna join the party before it ends.”</i>");
	output("\n\nDo you buy the cockvine bikini, or select another?");
	
	processTime(2);
	// [Buy]
	clearMenu();
	addButton(0, "Buy It", buyCockvineBikini);
	addButton(14, "Back", holidayCostumeMenu);
}
public function buyCockvineBikini():void
{
	clearOutput();
	showHoliday();
	author("TosakunoKishi");
	
	flags["HOLIDAY_OWEEN_PURCHASE"] = "cockvine bikini";
	pc.credits -= 1000;
	
	output("You suppose you could act like the victim of a cockvine orgy. That’d freak people out and get you through those creepy stares from before, right? If nothing else, you’ll be a conversation piece. <i>“I’ll take it.”</i>");
	output("\n\nHoliday smirks and has you transfer the credits to a dubious-looking holdings account. Has she never even heard of the bank? <i>“Great. You can change here since I bet you want to enjoy the Masque just as much as me. And if you go back to your ship to change, I doubt you’ll be back in time for the festivities.”</i>");
	output("\n\nYou protest. What are you supposed to do with your");
	if(pc.hasArmor() || pc.hasUpperGarment() || pc.hasLowerGarment() || pc.hasWeapon())
	{
		if(pc.hasArmor() || pc.hasUpperGarment())
		{
			output(" [pc.upperGarments]");
			if(pc.hasLowerGarment() && !pc.hasWeapon()) output(" and");
		}
		if(pc.hasLowerGarment())
		{
			if((pc.hasArmor() || pc.hasUpperGarment()) && pc.hasWeapon()) output(",");
			output(" [pc.lowerGarment]");
		}
		if(pc.hasWeapon())
		{
			if(pc.hasArmor() || pc.hasUpperGarment() || pc.hasLowerGarment()) output(" and especially your");
			output(" [pc.weapon]");
		}
	}
	else output(" gear");
	output("? This costume doesn’t exactly include a rucksack to carry your stuff.");
	output("\n\nHoliday rolls her eyes, <i>“Nobody goes to the Masque with a bunch of explorer gear. Unless that’s what you’re going as.”</i> She sits herself upon a crate and runs a critical eye up and down your body, <i>“That won’t work with that costume though,");
	if(pc.hasArmor() || pc.hasUpperGarment()) output(" [pc.upperGarments]");
	else output(" gear");
	output(" over a bikini? Give me a break.”</i>");
	output("\n\nYou suppose she has a point.");
	output("\n\n<i>“I’ll watch your shit for you. Just stick it in a corner, come back after you’re done partying, and then you’ll be on your merry way,”</i> Holiday tilts her head and pouts at you, fluttering her cat-like yellow eyes, <i>“Can’t you trust little ole me?”</i> A nearby crate gives a well-timed rumble that almost sounds like a laugh, before Holiday sharply kicks its reinforced side, quieting whatever is within.");
	output("\n\nYou’ve met pirates who are more trustworthy than she is, yet you have little in the way of options. Walking back to your ship, with those stares lingering on you again, is far from desirable. Not to mention the time it’d take. At least if you take up Holiday’s offer, your stuff should be safe and you can head out and have a bit of fun before everything’s over. You really should enjoy yourself while you can.");
	
	processTime(3);
	
	clearMenu();
	addButton(0, "Next", wearCockvineBikini);
}
public function wearCockvineBikini():void
{
	clearOutput();
	showHoliday();
	author("TosakunoKishi");
	
	output("Stripping becomes an awkward affair with the demonic nurse’s bright, lecherous eyes following your every move. You swear you can feel her eyes devouring your body, but each glance in her direction shows her to be diligently checking her nails. Those stares outside must’ve gotten to you. With a shake of your head, you push your paranoia aside and begin putting on your costume.");
	output("\n\nYou pull open the top and bottom and step into them. Almost immediately, they snap into place around you. For a moment, you feel them squirm, as if they were living things trying to find the best way to conform to your body. You hold in a moan as they incidentally move over your sensitive areas. They settle before long and you’re wearing a cockvine bikini.");
	output("\n\nWow, that feels weirdly nice. You expected a bikini made from cockvine to feel bulky and unpleasant, but the vines around your [pc.breasts] and your [pc.crotch] are surprisingly pleasant. They’re strangely warm, like they’re alive, however you ignore that in favor of making sure everything fits all right. You untie the cockvine bundle to make sure it looks good.");
	if(pc.isMan()) output("\n\nYou laugh at how absurd you probably look, wearing this outfit clearly meant for a girl. Yet you can’t deny how nice it is on your masculine form. Even your cock" + (pc.cocks.length == 1 ? "" : "s") + (pc.balls > 1 ? " and balls" : "") + " feel" + ((pc.cocks.length == 1 && pc.balls <= 1) ? "s" : "") + " almost at home in the poor excuse for underwear. Though you’re not sure how you feel about having so much of your ass on display in the Masque. Who knows who might get the wrong idea? But it would make a good way of luring people away. You frown; where’d that thought come from?");
	else if(pc.isWoman()) output("\n\nYou sigh at how the lower vine seems to hug your curves, somehow accentuating them as if it were coercing your fat into doing so. An inspection of your back shows that your ass cheeks are on full display, sending a wave of concern and excitement through you at who might sneak a grope here and there, or entice others to follow them. Especially since the makeshift underwear seems to push your cheeks out. It’d probably be a good way to lure people away. You frown; where’d that thought come from?");
	else if(pc.isHerm()) output("\n\nYou giggle at how poorly the lower garment conceals your [pc.crotch]. You’d look more at home on a stripper’s stage with how much of your figure you’re showing off, but this is the Masque after all. People were probably showing off much worse. Though that raises a problem with your ass, of which only your anus is concealed. Some might get the wrong idea about that. Maybe even try and take advantage. But that’s fine, just means you can lure them away easier. You frown; where’d that thought come from?");
	else output("\n\nWow, this bikini hugs you in all the right places. To some extent, it almost feels like it was grafted onto your skin. Even your smooth groin feels almost sexy like this, as does your ass. Someone might even be tempted to cop a feel tonight. You blush at the thought, but nod to yourself, thinking that it would be the perfect way to get people to a more secluded spot where you can have some fun. You frown; where’d that thought come from?");
	output("\n\nWhen you’re finished getting it on, the bikini honestly looks great on you. It hugs you in all the right ways, accentuating every aspect of your body without going overboard. The strings connecting the top and bottom together practically seem to be a part of you, so tight against your body that you can’t even pinch them without getting your skin. You suppose that’s to be expected for something made to highlight a girl’s figure.");
	output("\n\nYou look around yourself just to make absolutely certain that nothing is amiss, then notice what looks like a necklace nearby. You pick it up and discover that it also resembles a cockvine. It must be a part of the costume. You shrug and unclasp it in exactly the same way as the bikini, then put it around your neck. Almost instantly, it snaps shut and pulls taut around your throat, like a choker. You feel a little discomfort, but it soon passes, and you pin the uneasiness down to the perverted nurse’s lingering gaze.");
	output("\n\nYou attempt to adjust your outfit a little more just to make sure it’s perfect, but Holiday interrupts you, <i>“Sweetie, you look fine. Now can you get out and have some fun, so I can do the same?”</i> She cocks an expectant eye at you and you sigh in return. Holiday isn’t exactly the most courteous shopkeeper you’ve met. Maybe a dick in her mouth would make her a little nicer? Your frown returns at the thought and how suddenly it surged. You must be getting horny.");
	output("\n\n<i>“Yeah, yeah, I’m going.”</i> You say and strut pass Holiday, then immediately yelp as her hand comes cracking down upon your ass. You crane your neck about to see a distinct handprint on your left butt cheek, then glare up at Holiday. She smirks lustfully back at you.");
	output("\n\n<i>“Sorry, but I like to inspect my customers before they leave. Makes my job all the more satisfying,”</i> she explains, though it doesn’t sound all that convincing. Regardless, you sigh and let her have her fun. Holiday’s inspection is more invasive than any medical professionals, as her eyes seem to consume every detail and her hands refuse to leave your skin for more than a few seconds. But you can’t deny that her hands feel pretty good, especially when she gropes your ass and [pc.groin].");
	output("\n\nHer ‘inspection’, though you suspect it’s just an excuse for her to feel you up, carries on for another minute or so, <i>“I thought you wanted to get to the Masque?”</i> You inquire. Holiday waves a hand at you, as if swatting away your query. She takes another audacious grope of your groin and ass, then steps back.");
	output("\n\n<i>“Sorry, couldn’t resist. Now get out and get fucked, cockvine whore,”</i> she insults with a, you assume, good-natured grin. You roll your eyes at her and head out, but not before teasing her with a shimmy of your hips, <i>“Such a tease. Don’t do anything I wouldn’t do!”</i>");
	
	processTime(16);
	pc.lust(15);
	
	clearMenu();
	addButton(0, "Next", cockvineBikiniNext);
}
public function cockvineBikiniNext():void
{
	clearOutput();
	clearBust();
	showName("\nOUCH!");
	author("TosakunoKishi");
	
	output("The streets are packed tight with people dressed in all manner of costumes. Some of them are dressed as goblins, though you can tell it’s just a paintjob, and others are floating around as fairies, using what must be temporary wing grafts. There are even some who have completely abandoned the idea of modesty and are walking around with only stockings and maybe a thong to cover their skin. You notice that no one is dressed like you, bringing a smile to your lips at how unique a choice you’ve made.");
	output("\n\nThe others also seem to have taken notice of your unique get-up, as many pause and turn to stare at you. You notice that some lean in to whisper to one another, eyes still locked to you. There’s no way to know what they’re murmuring about, but you’d like to think they’re jealous of your outfit and body.");
	output("\n\nIt’s a little embarrassing to have so many sets of eyes watching your every move, and yet it feels no more intrusive than Holiday’s stares had, though it’s also a vast improvement over the dodgy looks you received beforehand. You return the looks with a self-assured smile, glad that the evening seems to be on the right track.");
	output("\n\nBut that quickly changes when you feel a strange prick above your rear. You look back, but find nothing there, then it happens again. Yet you’re certain that nothing’s there. Another prick startles you and worry begins to set in. It’s not painful, but certainly uncomfortable and unnerving, especially when you swear you can feel something moving under your skin. You start to lose sensation in your lower back, as if someone had applied anaesthetic. What the hell is going on?");
	output("\n\nYou reach down and grasp at the makeshift underwear, hoping that it’s the cause of the prickly, numbing sensation. You try to remove it, but find yourself incapable of doing so as it tightens around you, earning a gasp as it grips your [pc.crotch]. Another prick is followed by another, though you barely feel them now and simply stumble along. You look around in the hopes that someone will help, but they’ve all moved on from you and are heading away to enjoy the festivities. Those that do meet your gaze, look away quickly so as not to get involved.");
	output("\n\nEventually, you find an unobstructed wall to lean against and do so. Maybe you caught something? With all the viruses in the universe, there’s bound to be something that causes prickly sensations, followed by numbed nerve endings. You go to pull out your codex, hoping it would have the answers, but find nothing. Oh yeah, you left it at Holiday’s shop. You look back, but you can’t see it from how far you’ve walked.");
	output("\n\nFinally, after what felt like ten pricks in total, you start to regain sensation in your back. Immediately afterwards, you start to twitch wildly and can’t help but giggle and groan, almost as if your nerves were being played with by tiny, inquisitive hands. Tingles run up your spine before long, then across the rest of your body. Then nothing. The numbness and tingling are both gone.");
	output("\n\nYou turn and look down at your rear once again, hoping to find something you missed last time. Instead, you’re astounded to see that the once green cockvines have taken on your [pc.skinColor] skin color, except those that form the bikini itself. The cockvines then unfold themselves to your surprise, flaring out to make sure you keep your balance. Their skin looks exactly like yours, though it has an almost leathery quality to it. The vines end in a purple tip, from which you can see a clear fluid bubbling over.");
	output("\n\nYou should probably head back to Holiday and get her to sort this mess out. Although, this might just be a temporary mod like those girls with wings you saw before. In that case, wouldn’t it be more fun to mingle? What do you do?");
	
	processTime(45);
	pc.lust(25);
	
	// Tails
	pc.removeTails();
	pc.tailType = GLOBAL.TYPE_COCKVINE;
	pc.tailCount = 10;
	pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
	pc.addTailFlag(GLOBAL.FLAG_LONG);
	pc.tailGenital = GLOBAL.TAIL_GENITAL_NONE;
	pc.tailGenitalArg = GLOBAL.TYPE_COCKVINE;
	pc.tailGenitalColor = "green";
	pc.taint(10);
	if(rand(5) == 0) pc.addTailFlag(GLOBAL.FLAG_RIBBED);
	
	clearMenu();
	addButton(0, "Holiday", cockvineBikiniEvent, "go holiday", "Holiday’s Store", "Return to Holiday’s store and ask Holiday what is going on.");
	addButton(1, "Mingle", cockvineBikiniEvent, "go mingle", "Go Mingle", "Continue with the festivities.");
}
public function cockvineBikiniEvent(response:String = ""):void
{
	clearOutput();
	author("TosakunoKishi");
	clearMenu();
	
	var i:int = 0;
	var cumQ:Number = 0;
	
	switch(response)
	{
		case "go holiday":
			clearBust();
			showName("HOLIDAY’S\nSTORE...");
			
			output("The surprises keep coming as you tense muscles you never knew you had and the vines respond. Holiday did say the bikini was made from cockvines, but never said if they were dead. Were they just dormant, waiting for a poor schmuck like yourself to put them on? Experimentally, you try to tense different muscles, discovering which ones affect which cockvine or cock-tails as they are now. A couple of them rub against each other of their own accord and you feel a burst of pleasure dart up your spine.");
			output("\n\nThat was intense! And there’s ten of them! You could probably really have some fun with these things. But you steel yourself against the sensations and resolve to get to Holiday’s store. You could get into serious trouble if you don’t do anything fast.");
			
			processTime(2);
			flags["COCKVINE_BIKINI_EVENT"] = 1;
			
			addButton(0, "Next", cockvineBikiniEvent, "holiday store");
			break;
		case "go mingle":
			clearBust();
			showName("\nGO MINGLE...");
			
			output("However, that’s the least of your worries as you tense muscles you never knew you had and the vines respond. Holiday did say the bikini was made from cockvines, but never said if they were dead. Were they just dormant, waiting for a poor schmuck like yourself to put them on? Experimentally, you try to tense different muscles, discovering which ones affect which cockvine - or cock-tails as they are now. A couple of them rub against each other of their own accord and you feel a burst of pleasure dart up your spine.");
			output("\n\nThat was intense! And there’s ten of them! You could probably really have some fun with these things. And where better to do that, than at a party? With that in mind, and lust boiling in your bloodstream, you head to the loudest place you can find.");
			
			processTime(2);
			flags["COCKVINE_BIKINI_EVENT"] = 2;
			
			addButton(0, "Next", cockvineBikiniEvent, "mingle scene");
			break;
		case "holiday store":
			showBust("HOLIDAY");
			showName("\nHOLIDAY...");
			
			output("You backtrack through the streets; however, they seem so different to you now. Whereas before, you were met by creepy glares and then by awe and lust, now you are met by next to nothing. What few people are outside, quickly head in the opposite direction, toward a building where you can practically smell the debauchery taking place. A pang of want strikes you at the thought of what you could be doing there.");
			output("\n\nBut you persevere over your desires, though you’re not sure if you can do that for much longer. These new tails of yours seem to have minds of their own, as they constantly rub against each other or your sensitive areas, but they never put you over the edge. You’d like to think it’s because you’re managing to assert your will over them, but part of you feels that they’re just teasing you. Waiting for that moment you lose control to go completely wild.");
			output("\n\nHoliday’s shop comes into view and relief swarms through you. Maybe you’re not too late and she can take care of this? You unconsciously grin out of hope and feel a tingle at the back of your neck, leading to your arm moving to touch it out of instinct. Yet there’s nothing there, nothing except that choker... Oh no.");
			output("\n\nYou start running to the shop, however the sudden panic causes you to lose your balance. Or was it the cockvines? You can’t say for certain, but you trip nonetheless and fall");
			if(pc.biggestTitSize() >= 20) output(" right onto your [pc.chest]");
			else output(" flat on your face");
			output(". Thankfully you don’t injure yourself, but you’re losing time. You charge back to your feet and adopt a full-on sprint, though you do pay closer attention to your plethora of tails. Which would explain why you slow down suddenly and are forced to bite back a lewd moan.");
			output("\n\nThey really do have minds of their own, you realize, as they start twining around one another. You feel pleasure as they brush their tips against each other, nuzzling affectionally with their neighbors, while those left out seek the rest of your body. They massage your skin, dripping tips pressing against you while the long bodies work their fluid into your flesh. You hate to admit it, but it feels good.");
			output("\n\nMaybe you can just wait here for a little bit? These cockvines don’t seem to be hurting you in any way, quite the opposite really. What’s a few more minutes?");
			if(pc.willpower() > 15)
			{
				output("\n\nYou shake your head and continue onward, gritting your teeth and asserting your will over the parasites. Each step is another tax on your resolve, the collection of tails constantly sending twinges of desire and pleasure throughout your very being. Holiday had better fix this before you do something you’ll regret. At worst you’d end seducing some poor lass or get plastered all over the extranet.");
				output("\n\nIt wouldn’t be all bad you suppose, maybe you could make a living as an Ultraporn star?");
				output("\n\nThankfully, you don’t have to linger on the thought for long as you see Holiday leaving her store. You rush over, hope briefly pushing your arousal away from your mind, and get her attention with a small shout.");
				output("\n\n<i>“Oh, hello, sweetie. Enjoying the costume?”</i>");
				output("\n\nYou glare at her. It’s clear as a neutron star in the void that she knows full well what’s happened.");
				output("\n\n<i>“Fine, fine. I should’ve told you about the temporary side effects.”</i> That gives you pause.");
				output("\n\n<i>“Temporary?”</i>");
				output("\n\n<i>“Yes, temporary. Just kick back and relax, okay, honey?”</i> Holiday reaches forward and gives a cockvine a gentle pat, sending tremors of lust through you, <i>“Now, if you’ll excuse, I’ve got some fun to have.”</i> Holiday walks away, leaving you to watch her go. Your eyes are inevitably drawn to her ass as it sways side to side almost hypnotically, and you lick your lips.");
				output("\n\nYou feel your muscles move, yet again of their own accord, and a cockvine turned tail slithers into your view. They’re just temporary, so why not indulge a little? There should be time to join the party. You turn to head back and join the depravity no doubt taking place, but pause when you see someone approaching. They’re clearly feminine and very obviously stacked just from the look of their silhouette. You squint and see that she is dressed as a laquine. Were it not for her human face, you’d think she is one.");
				output("\n\nYou decide to approach her and see if the rumors you’ve heard about laquines are true.");
				
				pc.lust(5);
			}
			else
			{
				output("\n\nYou nod your head leisurely and find a wall to relax against, letting them rub your body while the others work your arousal higher and higher. The sensations are intoxicating to say the least, burgeoning subtly and piling more pleasure upon you. Your hands start to roam towards your [pc.groin].");
				output("\n\nYou’re interrupted when you hear a door slam shut and look up to see Holiday hastily leaving her store, heels clicking on the hard floor below. Shit! You missed her. What now? Before you can make your mind up, you hear worried chattering nearby and look around. Your eyes quickly fix themselves on the source; a young girl dressed as a laquine.");
				output("\n\nShe could practically pass for one, if her face was less human. Though she still has a fine coat of violet fur with a thicker mass adorning her head, which is the color of moss. You eye her up and down and notice that she seems to be in a similar predicament as you, for her legs are clenched together and she looks uneasy. Did she get her costume from Holiday too?");
				output("\n\nYou decide to investigate and approach her. Maybe even see if everything you’ve heard about laquines is true.");
				
				pc.lust(25);
			}
			
			processTime(12);
			
			addButton(0, "Next", cockvineBikiniEvent, "lila sex");
			break;
		case "lila sex":
			showBust("LILA");
			showName("HORNY\nGIRL");
			
			output("You saunter up to the girl, sashaying your hips unconsciously and causing your cacophony of tails to sway with your sides.");
			if(pc.biggestTitSize() < 4) output(" The bikini top feels snug against your petite chest, accentuating your slight mounds.");
			else if(pc.biggestTitSize() < 41) output(" The bikini top feels great as it bounces with your abundant breasts, rubbing and enticing your nipples to an " + (pc.hasErectNipples() ? "erect" : "aroused") + " state.");
			else output(" You’re amazed that the bikini top can contain your tits as well as it does, without feeling too tight and even rubbing your nipples delightfully as your boobs bounce heavily with every step.");
			// Female Variation:
			if(!pc.hasCock())
			{
				output("\n\nThe girl takes notice of you when she glances in your direction and her eyes widen when she sees your [pc.cockTails]. You can’t help but grin at her reaction.");
				output("\n\nIt’s to be expected of course, what with your gorgeous figure and the promise of one hell of a night. You eventually come to a stop in front of her, neither of you two saying a word as you size the other up. She’s even hotter up close, and not just because she’s only wearing a skimpy halter top and a pair of short shorts.");
				output("\n\nHer breasts are large and well-rounded, sitting proudly on her chest. Her waist is neither too thin, nor too large, resting perfectly on the realm between them, and leads wonderfully into her wide, motherly hips - though she looks no older than you are - and you can only assume her ass is equally as glorious. The human-laquine girl doesn’t appear to have any discernible bulge in her shorts either and, after a quick inhale, you’re pretty certain she’s in heat.");
				output("\n\nOh this could be a lot of fun, you think as your " + (pc.hasVagina() ? "[pc.pussy]" : "fresh vagina") + " flush" + (pc.vaginas.length <= 1 ? "es" : "") + " with desire and your tails leak more than usual. But you ignore that in favor of continuing to study your soon-to-be acquaintance. You bring your eyes up to her face and note the flush to her cheeks, coming through despite her rosy fur, while also enjoying her cute features and notably pouting lips. Her eyes are large, also, helping to accentuate her cuteness.");
				output("\n\n<i>“Hi,”</i> she breaks the silence first, eyes flitting around nervously. It’s obvious that she’s trying to focus on anything but your tails.");
				output("\n\n<i>“Hi. What’s the matter?”</i> You ask, despite being quite sure of the issue. Her pheromones are practically dripping from her, despite not being a full laquine. She must’ve gotten a temporary mod for the evening.");
				output("\n\n<i>“Well, I uh, was going to go talk to a costume seller. She, um, sold me this costume and I... it’s having some weird side e...”</i> she trails off and you soon see why; one of your cock-tails decided to sneak up on the poor thing, pressing its drooling tip against her ass and confirming that it is, indeed, as large as her hips suggest.");
				output("\n\n<i>“Her name wouldn’t happen to be ‘Holiday’ would it?”</i> You ask, acting like nothing happened. She responds in kind, especially when she swats at her rear but hits only thin air. Your new tails are amazingly quick.");
				output("\n\n<i>“Y-yes, how’d you know?”</i>");
				output("\n\n<i>“I got my costume from her too. Don’t worry, the effects just temporary,”</i> you assure her, voice practically gushing with comfort and warmth and inextinguishable desire.");
				output("\n\n<i>“Really? That’s a relief. I don’t know how laquines do it. This heat is unbearable,”</i> the girl says, visibly relaxing now. You inwardly smirk in assured victory and lean in closer to her.");
				output("\n\n<i>“From what I hear, they fuck. A lot.”</i> You make no effort at hiding your intentions now and the girl picks up on them, looking into your eyes with her own, showing her desire is still tainted by worry. You glance down briefly and notice that her face looks slightly more protrusive than before, as if she were turning into a full laquine. Before you can focus on that aspect however, you decide to be a little more aggressive.");
				output("\n\nThe girl yelps as you step forward and reach around her to grasp a luscious cheek in your hand. She doesn’t pull away, however. In fact, she leans into your hand and takes a long, deep breath through her nose.");
				output("\n\n<i>“My name’s Lila.”</i> She whispers to you and you answer in kind, before you both forego any further speech in favor passionately kissing the other. You soon have your tongue in her mouth, fencing with her own as your hands rove across her curvaceous figure, while hers find a pair of your cock-tails. The contact feels heavenly, stronger now than when they were rubbing against each other. Because you’ve accepted them?");
				output("\n\nYou decide that it doesn’t matter and focus on the feeling of the Lila’s lips and tongue and the way her hands grip your myriad of cocks. She doesn’t seem to know which pair to settle on, moving from one set to another, stroking them to elicit a moan from you. It isn’t long before you’re both short of breath, heads touching and panting lustfully.");
				output("\n\nOne of you suggests taking this to somewhere more private, but that idea quickly loses steam when your cock-tails hook around her shorts and tear them off. Lila doesn’t seem to mind and resumes making out with you, only hungrier than before. Probably because one of your tails is rubbing against her sopping wet snatch.");
				output("\n\nIt isn’t long before your cock-tails grow impatient. You can’t blame them, if your pussy wasn’t concealed you’d probably be fingering it right now. As if in response, you gasp into her mouth as the vines acting as your clothing seem to come alive and rub against your sensitive nipples and drooling cunt. This bikini might just have been the best purchase of your life. You might have to put it on again some time.");
				output("\n\nLila moans against your lips, pressing closer against you. You sink your fingers into her ass, relishing the expansive softness. A cock-tail presses its tip against her opening, covering itself in her juices. Your breath hitches in your throat as you await the penetration, eager to indulge in more of what this costume has to offer. But the vine never goes in. What’s it waiting for?");
				output("\n\nThen you realize that its waiting for you. Maybe you’ve got more control over these things than you thought? Or maybe they’re toying with you? In the end, it makes no difference and you send it ramming up into the laquine’s waiting pussy. She cries out against your lips in the way only a virgin can, however it only takes another thrust for her to moan hungrily.");
				output("\n\nThis feels amazing! Her wet folds ripple around your invading cock-tail, milking it for the constantly leaking pre-cum, even as you sink almost a foot of your parasitic member into her. You soon come to a stop against her cervix, but it’s merely a pause in your journey. Without a word, you pull back and she raises her hips, then you both work in unison to send your bulbous tip into her deepest depths. Now you’ve just got to claim her womb properly. And you have just the idea.");
				output("\n\nYou step away from the laquine and see that her human features are gone, replaced entirely by the race she was pantomiming as. But you pay it only a sparing glance, before you send the remainder of your cocks into action. Four tendrils coil around her limbs and pull her into the air, holding her in taut bondage, while a pair encircle her heaving tits. That leaves three more and you know exactly where you’re putting them.");
				output("\n\nShe seems to know as well, as she opens her mouth wide. Strings of saliva connects her lips and her tongue lips out lewdly, while she angles her hips just so that her ass is slightly more presented. Her eyes, blazing hotly with her rampant lust, zero in on you for a brief moment to plead for more. You’re no longer interested in restraining your temporary cock-tails and so you acquiesce to her desire.");
				output("\n\nYou plug her mouth with a single tendril, sending it straight down her throat and ripping a ragged gag from the restrained laquine, who humps against the lower cockvine. A dazed grin spreads across your face at the sensations coursing through your new limbs and dancing across your nerves, straight to your brain. Your many cock tendrils pull her closer to you, presenting her bound tits to you, and your mouth goes into action before you can think. You latch onto Lila’s nipple.");
				output("\n\nSatisfaction radiates from both of you as her pleasure rises like an ancient rocket. Your cockvines thrust in and out of her orifices, piling yet more delicious ecstasy upon your already taxed mind. You can feel it building within you, clenching in your gut, an orgasm like you’ve never heard of. Just a little further and you’ll cum. Of that you’re certain.");
				output("\n\nLila starts squirming, drawing your attention back to her. Your eye immediately falls to her lower body, where her pussy squelches with every thrust of your parasitic prick and drools like a waterfall of fem-cum, and where her untouched ass resides. You smirk knowingly and send a cock charging forth, its sloppy tip immediately penetrating her willing asshole. Her anal walls spread wide around your lustful tendril.");
				output("\n\nA little further... You send your myriad of members into a frenzy, trying your hardest to achieve that elusive orgasm. The sloppy sounds of your dick plundering her pussy, thrusting so deep that you’re fucking her womb and filling it with your pre-seed - combined with her lurid moans and gags and the sheer decadence of fucking her tight ass - should be enough to send you spiralling into an abyss of ecstasy.");
				output("\n\nBut none. What gives? You go so far as to reach grab a hold of your own tails, jerking them off in hopes of pushing yourself over the edge. Nothing.");
				output("\n\nBefore frustration can set in, you spot a lone cock-tail out of the corner of your eye. The little bastard is keeping you from cumming, <i>“Fine,”</i> you sigh and the tentacle immediately slips beneath you. You feel the vine masquerading as underwear moves to the side, giving free access to your own sopping cunt" + (pc.vaginas.length <= 1 ? "" : "s") + ".");
			}
			// Herm Variation:
			else
			{
				output("\n\nThe girl takes notice of you when she glances in your direction and her eyes widen when she sees your [pc.cockTails]. Her eyebrows raise when she also spies the bulge in your crotch. You can’t help but grin at her reaction.");
				output("\n\nIt’s to be expected of course, what with your gorgeous figure and the promise of one hell of a night. You eventually come to a stop in front of her, neither of you two saying a word as you size the other up. She’s even hotter up close, and not just because she’s only wearing a skimpy halter top and a pair of short shorts.");
				output("\n\nHer breasts are large and well-rounded, sitting proudly on her chest. Her waist is neither too thin, nor too large, resting perfectly on the realm between, and leads wonderfully into her wide, motherly hips - though she looks no older than you are - and you can only assume her ass is equally as glorious. The human-laquine girl doesn’t appear to have any discernible bulge in her shorts either and, after a quick inhale, you’re pretty certain she’s in heat.");
				output("\n\nOh this could be a lot of fun, you think as your [pc.cocks] swell" + (pc.cocks.length == 1 ? "s" : "") + " with desire and your tails leak more than usual. But you ignore that in favor of continuing to study your soon-to-be acquaintance. You bring your eyes up to her face and note the flush to her cheeks, coming through despite her rosy fur, while also enjoying her cute features and notably pouting lips. Her eyes are large, also, helping to accentuate her cuteness.");
				output("\n\n<i>“Hi,”</i> she breaks the silence first, eyes flitting around nervously. It’s obvious that she’s trying to focus on anything but your tails, but ends up lingering on your bulbous crotch.");
				output("\n\n<i>“Hi. What’s the matter?”</i> You ask, despite being quite sure of the issue. Her pheromones are practically dripping from her, despite not being a full laquine. She must’ve gotten a temporary mod for the evening, not that it matters. You can feel your dick hardening with every breath.");
				output("\n\n<i>“Well, I uh, was going to go talk to a costume seller. She, um, sold me this costume and I... it’s having some weird side e...”</i> she trails off and you soon see why; one of your cock-tails decided to sneak up on the poor thing, pressing its drooling tip against her ass and confirming that it is, indeed, as large as her hips suggest.");
				output("\n\n<i>“Her name wouldn’t happen to be ‘Holiday’ would it?”</i> You ask, acting like nothing happened. She responds in kind, especially when she swats at her rear but hits only thin air. Your new tails are amazingly quick.");
				output("\n\n<i>“Y-yes, how’d you know?”</i>");
				output("\n\n<i>“I got my costume from her too. Don’t worry, the effects just temporary,”</i> you assure her, voice practically gushing with comfort and warmth and inextinguishable desire.");
				output("\n\n<i>“Really? That’s a relief. I don’t know how laquines do it. This heat is unbearable,”</i> the girl admits, visibly relaxing now. You inwardly smirk in assured victory and lean in closer to her, pressing your lower body closer. She glances down at you, the blush on her cheeks deepening slightly.");
				output("\n\n<i>“From what I hear, they fuck. A lot.”</i> You make no effort at hiding your intentions now and the girl picks up on them, looking into your eyes with her own and showing that her desire is still tainted by worry. You glance down briefly and notice that her face looks slightly more protrusive than before, as if she were turning into a full laquine. Muzzle and all. Before you can focus on that aspect however, your body demands you to be more aggressive.");
				output("\n\nThe girl yelps as you press closer and reach around her to grasp a luscious cheek in your hand. She doesn’t pull away, however. In fact, she leans into your hand and takes a long, deep breath through her nose. You feel an almost indefinable wiggle against your scarcely protected member" + (pc.cocks.length == 1 ? "" : "s") + ".");
				output("\n\n<i>“My name’s Lila.”</i> She whispers to you and you answer in kind, before you both forego any further speech in favor passionately kissing the other. You soon have your tongue in her mouth, fencing with her own as your hands rove across her curvaceous figure, while one of hers finds one of your cock-tails. The contact feels heavenly, stronger now than when they were rubbing against each other.");
				output("\n\nHer other hand slips your dick" + (pc.cocks.length == 1 ? "’s" : "s’") + " meagre protection aside and grips" + (pc.cocks.length == 1 ? "" : " one of") + " your hardening shaft" + (pc.cocks.length == 1 ? "" : "s") + ". The tiny furs on her fingers offer the softest caress amidst her tight hold, and brush gently over you as she masturbates your length. She moans into your mouth as you reach full erection, clearly pleased by what you’re packing.");
				output("\n\nYou groan at the touch, but focus on the feeling of the Lila’s lips and tongue and the way her hands grip your myriad of cocks. She doesn’t seem to know where to settle, sometimes grasping your main cock and a tail, then wrapping both hands around your front, and occasionally curling her fingers around a pair of cock-tails. It isn’t long before you’re both short of breath, heads touching and panting lustfully.");
				output("\n\nOne of you suggests taking this to somewhere more private, but that idea quickly loses steam when your cock-tails hook around her shorts and tears them clean off. Lila doesn’t seem to mind and resumes making out with you, only hungrier than before. Probably because one of your tails is rubbing against her sopping wet snatch, while she grinds back against it.");
				output("\n\nIt isn’t long before your cock-tails grow impatient. You can’t blame them, if you weren’t preoccupied with her face, you’d be fucking her at this very moment. As if in response, you gasp into her mouth as your top seemingly comes alive and, expertly, rubs against your stiff nipples. This bikini might just have been the best purchase of your life. You might have to put it on again some time.");
				output("\n\nLila moans against your lips, pressing closer against you. You sink your fingers into her ass, relishing the expansive softness. A cock-tail presses its tip against her opening, covering itself in her juices. Your breath hitches in your throat as you await the penetration, eager to indulge in more of what this costume has to offer. But the vine never goes in. What’s it waiting for?");
				output("\n\nThen you realize that its waiting for you. Maybe you’ve got more control over these things than you thought? Or maybe they’re toying with you? In the end, it makes no difference and you adjust your hips, then spear into her with your primary prick. She cries out against your lips in the way only a virgin can, however it only takes another thrust for her to moan hungrily.");
				
				pc.cockChange();
				
				output("\n\nThis feels amazing! Her wet folds ripple around your invading cock, milking it for the constantly leaking pre-cum, even as you sink");
				if(pc.cocks[0].cLength() > 12) output(" almost a foot of");
				output(" your member into her. You soon come to a stop against her cervix, but it’s merely a pause in your journey. Without a word, you pull back and she raises her hips, then you both work in unison to send your [pc.cockHead] into her deepest depths. Now you’ve just got to claim her womb properly. And you have just the idea.");
				output("\n\nYou step away from the laquine and see that her human features are gone, replaced entirely by the race she was pantomiming as. But you pay it only a sparing glance, before you send the remainder of your cocks into action. Four tendrils coil around her limbs and pull her into the air, holding her in taut bondage, while a pair encircle her heaving tits. That leaves four more and you know exactly where you’re putting them.");
				output("\n\nShe seems to know as well, as she opens her mouth wide. Strings of saliva connects her lips and her tongue lolls out lewdly, while she angles her hips just so that her ass is slightly more presented. Her eyes, blazing hotly with her rampant lust, zero in on you for a brief moment to plead for more. You’re no longer interested in restraining your temporary cock-tails and so you acquiesce to her desire.");
				output("\n\nYou plug her mouth with a single tendril, sending it straight down her throat and ripping a ragged gag from the restrained laquine, who bucks against you in obvious need. A dazed grin spreads across your face at the sensations coursing through you and dancing across your nerves, straight to your brain. Your many cock tendrils pull her closer to you, presenting her bound tits to you, and your mouth goes into action before you can think. You latch onto Lila’s nipple.");
				output("\n\nSatisfaction radiates from both of you as her pleasure rises like an ancient rocket. Your cockvine and [pc.cock] thrust in and out of her orifices, piling yet more delicious ecstasy upon your already taxed mind. You can feel it building within you, clenching in your gut, an orgasm like you’ve never heard of. Just a little further and you’ll cum. Of that you’re certain.");
				output("\n\nLila starts squirming, drawing your attention back to her. Your eye immediately falls to her lower body, where her pussy squelches with every thrust of your parasitic prick and drools like a waterfall of fem-cum, and where her untouched ass resides. You smirk knowingly and send a cock charging forth, its sloppy tip immediately penetrating her willing asshole. Her anal walls spread wide around your lustful tendril.");
				output("\n\nTwo to go... Well, there’s one hole that seems all too eager for extra attention. Without so much as slowing your thrusts, you place one of your few remaining tendrils at her already full pussy. Her juices squirt from her with every thrust of your hips, while her walls clench tight around you, dousing your cocks in her fem-cum. You barely think of it before the cockvine stretches her hole wider than should be possible and rams up alongside your main prick. The added friction only makes it better.");
				output("\n\nA little further... You send your myriad of members into a frenzy, trying your hardest to achieve that elusive orgasm. The sloppy sounds of your dicks plundering her pussy, thrusting so deep that you’re fucking her womb and filling it with your pre-seed - combined with her lurid moans and gags and the sheer decadence of fucking her tight ass - should be enough to send you spiralling into an abyss of ecstasy.");
				output("\n\nWithin her pussy, your cockvine begins to spiral. It twists around inside of her, wetly rubbing against your member as Lila’s snatch continues dousing both of your phalli. Pleasure burgeons with every thrust, both from your rhythmic fucking and the erratic pace of your cock-tail. You practically slide in and out of her as her juices all but gush with each move you make. Your stomach tenses whenever you hilt inside of her, the wet slap of flesh on flesh adding to the experience, and you know your climax is upon you.");
				output("\n\nBut then nothing happens. You can feel it building rapidly, about to explode, but still nothing. So, you go so far as to grab a hold of your own tails, jerking them off in hopes of pushing yourself over the edge. Nothing.");
				output("\n\nBefore frustration can set in, you spot a lone cockvine out of the corner of your eye. The little bastard must be keeping you from cumming. For what? Then you notice that it’s poised at your feminine sex. <i>“Fine,”</i> you sigh and the tentacle immediately slips beneath you. You feel the vine masquerading as underwear moves to the side, giving free access to your own sopping cunt" + (pc.vaginas.length <= 1 ? "" : "s") + ".");
			}
			// If experienced:
			if(pc.hasVagina() && !pc.vaginalVirgin) output(" You yelp and moan as " + (pc.vaginas.length <= 1 ? "your orifice" : " one of your orifices") + " is penetrated deeply with one swift thrust.");
			// If Virgin/was male:
			else output(" You yelp and moan as <b>your virginity is taken in one forceful thrust</b>.");
			output("\n\nNow this is what you’ve been craving!");
			output("\n\nCockvine-tails binding and stuffing a laquine is fine and all, but having your pussy fucked by your own appendage is an experience in and of itself. Your hips start bucking against the invader, mimicking Lila’s moves with eerie precision. You can practically feel your juices running down your thigh, but it’s nothing compared to your lover as her fem-cum all but gushes around your cock.");
			output("\n\n<i>“Cum, cum, cum!”</i> The words are almost completely muffled, but her moans more than convey them to you. They’re not necessary, of course, you fully intended to cum inside of her from the second you gave into your new desires. It doesn’t matter that you’re acting like an animal, or rather like a nest of cockvines, trapping your prey and fucking her without concern for her own pleasure. Only that it feels amazing and it’ll only get better.");
			output("\n\nAnd if Lila or yourself gets pregnant from this... better still.");
			
			processTime(24);
			pc.lust(1000);
			flags["LILA_VIRGINITY_TAKEN"] = 1;
			
			addButton(0, "Next", cockvineBikiniEvent, "lila cum");
			break;
		case "lila cum":
			showBust("LILA");
			showName("\nLILA");
			
			output("On that thought, you feel something snap inside of you. Your cock-tails go rigid after one final, uterus filling, bowel stretching, throat taxing thrust each. Lila gives a muffled scream as she gets the last push she needed, cumming hard enough that her eyes roll back in her head and her entire body goes slack in");
			// Female Variation:
			if(!pc.hasCock())
			{
				output(" the cockvines. You’re too caught up in your own climax to pay her any mind.");
				output("\n\nYou feel a rush course through your many cocks, each of them bulging slightly with what you know to be a serious amount of cum. Every inch that the liquid travels only sends more trills of unyielding pleasure straight to your mind. Your tongue lolls out in mindless bliss. Then you finally cum.");
				output("\n\nEach spurt comes with enough force to make an audible, wet noise even through your and the laquine’s flesh. Both of your snatches clamp down around the spraying tendrils, locking them inside and refusing to allow even a drop of cum to escape. And there’s a lot of cum. Even Lila’s instinctive swallows aren’t able to keep up, as thick streams of white bubble out from her stuffed maw. Her ass similarly leaks jizz even as it undulates around you.");
				output("\n\nYou both feel it as the sheer amount begins to expand your wombs. Before long, there’s a noticeable paunch to each of your bellies, one that visibly expands with each spurt. The pressure is too much for your weakened cervixes and begins to flow back out, leaking down the still cumming cockvine. There’s no doubt that you’re both pregnant from this. Even Sterilex might not work with this much seed.");
				output("\n\nThe other cockvines aren’t left out, far from it. It seems that they’ve made it their mission to paint the two of you with semen, as half train their gushing tips at you and the other half aims at Lila. You can’t hate it. Or love it for that matter. Cumming with ten different cocks and your pussy simultaneously is overwhelming to say the least. It’s a miracle you can stand.");
				output("\n\nWithout any concern for your mental state or Lila’s the vines decide that one orgasm simply isn’t enough. You jolt back to reality as you feel the cock inside of you start moving once more, all the while still cumming like a high-pressured hose. Lila doesn’t seem to care. Her moans merely resume where they had dwindled once, resurging with greater fervor. You would appreciate how voracious laquines are, but quickly lose all cognitive ability as your cocks work to another climax.");
				output("\n\nIt’s just as powerful as the last one, gushing seed in and onto you and Lila. Before long, both of your features are completely plastered in cum. No one would recognize you as anything more than humanoid blobs of jizz with what looks like heavily pregnant bellies, despite being filled with nothing more than semen.");
			}
			// Herm Variation:
			else
			{
				output(" your cock-tails’ grip. You’re too caught up in your own climax to pay her any further attention.");
				output("\n\nYou feel a rush course through your many cocks, each of them bulging slightly with what you know to be a serious amount of cum. Every inch that the liquid travels only sends more trills of unyielding pleasure straight to your mind. Your tongue lolls out in mindless bliss. Then you finally cum.");
				output("\n\nEach spurt comes with enough force to make an audible squelch even through your and the laquine’s flesh. Both yours and Lila’s snatches clamp down around the spraying endowments, locking them inside and refusing to allow even a drop of cum to escape. And there’s a lot of cum. Even Lila’s instinctive swallows aren’t able to keep up, as thick streams of white bubble out from her stuffed maw. Her ass similarly leaks jizz even as her anus undulates around you.");
				output("\n\nYou both feel it as the sheer amount begins to expand your wombs. Before long, there’s a noticeable paunch to each of your bellies, which visibly expand with each spurt. The pressure is too much for your weakened pelvic muscles and begins to flow back out, leaking down the still cumming cockvine. Lila’s remains strong, however, and refuses to give up on even a single drop. Even her vaginal canal keeps hungrily milking your dicks.");
				output("\n\nThere’s no doubt that you’re both pregnant from this. Even Sterilex might not work with this much seed.");
				output("\n\nThe other cockvines aren’t left out, far from it. It seems that they’ve made it their mission to paint the two of you with semen, as half train their gushing tips at you and the other half aims at Lila. You can’t hate it. Or love it for that matter. Cumming with ten different cocks and your pussy simultaneously is overwhelming to say the least. It’s a miracle you can stand.");
				output("\n\nWithout any concern for your mental state or Lila’s the vines decide that one orgasm simply isn’t enough. You jolt back to reality as you feel the cock inside of you start moving once more, all the while still cumming like a high-pressured hose. Lila doesn’t seem to care. Her moans merely resume where they had once dwindled, resurging with greater fervor. You would appreciate how voracious a laquine’s sex drive is, but you quickly lose all cognitive ability as your plethora of phalli work to another climax.");
				output("\n\nEven your own member" + (pc.cocks.length == 1 ? " is" : "s are") + " made to cum, as the cockvine inside Lila’s snatch frots against you. After cumming so recently, you’re unable to hold back for long. Your head falls back and your hangs open in a soundless cry, as a second orgasm crushes every facet of your mind.");
				output("\n\nIt’s just as powerful as the last one, gushing seed in and onto you and Lila. Before long, both of your features are completely plastered in cum. No one would recognize you as anything more than humanoid blobs of jizz with what looks like heavily pregnant bellies, despite being filled with nothing more than semen.");
			}
			output("\n\nThis is too much... the world dims around you and your thoughts begin to slow to a crawl... there’s nothing... just cum... and cum... and more cum...");
			
			processTime(32);
			pc.applyCumSoaked();
			pc.applyPussyDrenched();
			if(pc.hasCock()) {
				cumQ = pc.cumQ();
				if(cumQ >= 1000) pc.applyCumSoaked();
				if(cumQ >= 5000) pc.applyCumSoaked();
				if(cumQ >= 10000) pc.applyCumSoaked();
			}
			if(pc.hasVagina()) {
				cumQ = pc.girlCumQ();
				if(cumQ >= 1000) pc.applyPussyDrenched();
				if(cumQ >= 5000) pc.applyPussyDrenched();
				if(cumQ >= 10000) pc.applyPussyDrenched();
			}
			for(i = 0; i < 10; i++) {
				pc.orgasm();
				pc.exhibitionism(2);
			}
			
			addButton(0, "Next", cockvineBikiniEvent, "aftermath");
			break;
		case "mingle scene":
			showBust("SELINA");
			showName("\nPARTY!");
			
			output("The nearest party location is just what you expected and more. It’s loud, music pumping through its walls and seeming to pulsate in the ground beneath you. You can see lights flashing through the windows and hear, under the throbbing beat, the unmistakable sounds of ignited passions. The building itself is large and otherwise bland, but that no doubt made it perfect for such a party.");
			output("\n\nOutside, you see people in dozens of costumes milling about, some making out and others already doing the dirty deed in plain view. A perfect stage for your new army of leaking, bulbous-tipped tails you wield. You feel your new muscles being pulled in nearly every direction, as if the cock-tails you’ve acquired can’t decide where to go. You smirk and decide that you shouldn’t prolong this any more than you already have.");
			output("\n\nA couple of girls stop groping one another to turn and watch you. With a smouldering grin, you pass them and somehow know that their eyes are following your every step. You pause and look back to find them trailing a few feet behind you. Your grin widens, then tenses slightly as your nostrils flare at a peculiar scent in the air.");
			output("\n\nYou look around in curiosity. You’ve ended up in a warehouse, though you see no sign of lifting equipment or storage, only an endless ocean of people. It’s almost daunting to see so many different costumes and species. Maybe the smell’s due to all the chemicals in the air? Or the sheer amount of copulation around you? Surely so many different races in one room would have such an effect?");
			output("\n\nYou feel your puss" + (pc.vaginas.length <= 1 ? "y" : "ies") + " grow moist as you breathe it in. Your cock-tails react as well, growing even more antsy and brushing against random passers-by, not that they seem to mind after giving a gentle pat of affection. Then you realize that, while you’ve been standing there trying to discern this odour, you’ve gathered something of a crowd. They’re all looking at you intently, and said intent is hardly difficult to read in their gaze.");
			// Female Variation:
			if(!pc.hasCock())
			{
				output("\n\nIt’s not a combined effort, you realize as their attention seems squarely placed upon you. You glance around just in time to see an ausar girl take a long breath through her nose. Immediately, her face flushes and her eyes grow slightly cloudy, but are focused on you.");
				output("\n\nSo that’s what it is; a pheromone. You aren’t sure how the bikini is suddenly giving off such an effective aroma, but you’re certainly not about to waste such an opportunity to be the heart of an orgy, especially since you’ve got nearly a dozen phalli for the moment. They’re all connected to you, transmitting the touch of curious onlookers - and the pleasure of the brazen few that lick your swaying cockheads - to your brain. Even without your new pheromones or augmented lust, you doubt you would be able to resist for very long.");
				output("\n\nThen why bother holding back? You saunter through the crowd, parting them like a sea of burgeoning decadence that will only rise when you join in. Men and herms have their cocks out, hard as stone, stroking themselves or having their partners do so, while the women are eagerly groping their tits or teasing their pussies. If your pheromones are this potent in such a huge room, then you shudder to think what’ll happen in a confined space.");
				output("\n\nAbove you, lights flash with smouldering reds and pinks, inspiring passion in those who have yet to have their attention captured by you. With so many people suddenly losing interest in their prior debauchery, the DJ notices the lack of enthusiasm and lowers the music out of his own curiosity, which, in turn, invites the other party-goers to investigate.");
				output("\n\nYou look around with a lavish grin and run your tongue over your lips, eying groups and individuals with a predatory hunger. Your tails sway idly, restrained only by the promise of what is to come. There’re so many options before you. So many, in fact, that you doubt you could feasibly choose. Your instincts haven’t led you astray yet.");
				output("\n\nWhy choose one or two or three or four? When you could take the entire party.");
				output("\n\nYou reach back and unclasp your makeshift underwear, freeing your tits and puss" + (pc.vaginas.length <= 1 ? "y" : "ies") + " to the onlookers. The vines slither around the back and adhere to the curve of your spine and waist, making sure you can’t lose them. Several onlookers lick their lips and concentrate on your assets with an almost eerie focus. Not that you particularly mind, it’s only natural what with your pheromones.");
				output("\n\nWith every inch of your body on display, you strut through the masses. They part before you, as if you were a goddess and they unworthy to be in your presence. It’s invigorating, and to say nothing of how many of those around seem on the verge of cumming. But not by your own hand.");
				output("\n\nAnd that’s simply unacceptable.");
				output("\n\nYou spot a girl almost obscured by a pair of horse-morphs and point to her. She is one of the few that hasn’t touched themselves, though you can read that she wants to; it’s blatant in the way her eyes devour your visage. The horse-morphs turn to her and push her forward, chuckling good-naturedly. The girl, you notice, is a kaithrit. Her ears twitch and her tails sway nervously, but her cheeks are a deep red. How adorable, especially with her heterochromia eyes; one blue and the other green.");
				output("\n\nShe’s wearing a loose, summery shirt over her prodigious chest and shorts that barely cover her, equally shapely, ass. Your eye wonders over the rest of her figure, drinking every detail just to hype yourself for what’s to come. She has a svelte frame, typical of her species, but her breasts are enormous things, dominating her chest and even her tiny abdomen. But her hips aren’t to be overlooked as they flare out provocatively. Her hands move to cover herself when she notices you looking, making you grin widely.");
				output("\n\nYour cock-tails become fixated upon her as well. You sashay toward her until you stand directly before the kaithrit, who stares at you with a mixture of lust, fear and reverence. Just as she should, but you wish to enjoy yourself and that means stripping away her hesitance in the one way you know how.");
				output("\n\nShe opens her mouth - perhaps to introduce or excuse herself - however you silence her with a single fluid motion; a cockvine shoots out, slithers down her shirt, and tears it away. The crowd around you finally makes a sound, one of excitement mixed with pleasure from several others. You look at the kaithrit, beaming with unmistakable intent.");
				output("\n\n<i>“What’s your name?”</i> You inquire, even as you reach down and hook your thumbs in her shorts. Your tails coil around her wrists to keep her from interrupting. She struggles against them, but a mixture of their natural strength and your pheromones keep her from breaking free. In the meanwhile, you marvel at how soft her skin feels and how squishy her sides are. She must have used some high-level mods to get her fat to distribute like this.");
				output("\n\nShe’s a perfect cuddle partner, you realize and almost laugh. Perhaps you should abscond with this girl and use her as your personal body pillow on your adventures? You decide against doing so, for now at least. There’re far more interesting things to do. For instance, a member of the crowd breaks free and takes hold of one of your cocks. They then start kissing and licking it, effectively making out of with the tendril. You shrug and offer half of your tails to the masses.");
				output("\n\nThey are immediately beset upon and you can’t help but moan at the delicious symphony of sensations. You can feel a pair of large breasts wrap around a tip, while another person shyly jerks and licks another vine as two others greedily take your cocks down their throats. Someone can’t handle any foreplay and simply slides your phallus into their ass. You return your focus to the kaithrit, who’s looking behind you at the five cock-tails you still have free.");
				output("\n\n<i>“I’m going to use them on you, kitty,”</i> you tease and lean forward until her ears tickle your nose, <i>“I’m going to fuck your cunt, your ass, your mouth, your tits, and maybe your navel if I feel like it,”</i> with every aspect of her body named, you slide your hands across it, lingering to grope her ass and tits. She grows tense, yet you can tell it’s not out of fear.");
				output("\n\n<i>“Selina,”</i> the kaithrit finally mewls.");
				output("\n\n<i>“Pretty name, too bad I’m going to make you forget it,”</i> you pull back and see her eyes go wide at your statement, before a moan slips from her lips. While talking, you had stripped her of her final piece of clothing, putting her delightfully bald crotch on display. With such a tempting sight, a cock-tail quickly takes advantage and penetrates her. You hold the others back, wanting something else first.");
				output("\n\nYou gently push Selina onto her back, cockvine leisurely thrusting in and out of her soaked snatch. Her hips roll with every slight movement, humping against your parasitic cock to drive it deeper. An unnecessary action, as you always intended to take her as deeply as possible. However, before that, you move to stand over her face with your own drooling cunt on display, and gracefully fall to your knees. She gets the idea immediately and you gasp and moan when her feline-like tongue runs across your folds.");
				output("\n\nYou sink down fully onto her face and dig your clit against her nose. If she minds having her sinuses full of your snatch, then it doesn’t show, as Selina devours your cunny like a traveller dying of thirst. That deserves a reward, you think and move another tail to just below your fist. She feels its leaking, bulbous tip against her voluptuous ass cheeks and raises her hips high up for you. It’s always the quiet ones, you chuckle in amusement and spear her ass on your sinuous member.");
				output("\n\nThe party goes into full swing now, as entire groups of people form off and start their own orgies. The cock-tails you leant the others are all fucking them now, taking the anal sluts so deeply that you wonder why your dicks haven’t come out of their mouths yet. Those with more traditional tastes buck their hips against your tendrils as their wombs are fucked, stuffing the organ with your cock and pre-cum.");
				output("\n\nAnd you’re the center of it all. Even as you ride Selina’s face and fuck her two lower holes, several people are on you constantly. You can feel their hands caressing your skin, groping your tits, lightly fingering your ass, and on your unused tails. Time to change that, you decide and stand up. Selina mewls helplessly and tries to reach up, but quickly falters when an orgasm tears through her.");
				output("\n\nYou turn to the people who were worshipping you and smirk. You sit down and go to lean back. On cue, one of them finds a bundle of clothes and uses them to make a pillow for you. Is this how it feels to be a queen? You can’t imagine it’s very different.");
				output("\n\nBefore making any further decisions, you put your remaining three tails in action. One spears Selina’s mouth, causing a sound between a gag and a moan, while another lays itself between her tits. Selina quickly pushes her basketball sized mounds together for you, while your final cock hovers over Selina’s navel.");
				output("\n\nMaybe that’s a bit too kinky, though? Perhaps you should just double-stuff her ass or pussy, give one of them an extra huge load of cum?");
			}
			// Herm Variation:
			else
			{
				output("\n\nTheir attention seems squarely placed upon you. You glance around just in time to see an ausar girl take a long breath through her nose. Immediately, her face flushes and her eyes grow slightly cloudy, but are focused on you.");
				output("\n\nSo that’s what it is; a pheromone. You aren’t sure how the bikini is suddenly giving off such an effective aroma, but you’re certainly not about to waste an opportunity to be the heart of an orgy, especially since you’ve got nearly a dozen phalli for the moment. They’re all connected to you, transmitting the touch of curious onlookers - and the pleasure of the brazen few that lick your swaying cockheads - to your brain. Even without your new pheromones or augmented lust, you doubt you would be able to resist for very long.");
				output("\n\nThen why bother holding back? You saunter through the crowd, parting them like a sea of burgeoning decadence that will only rise when you join in. Men and herms have their cocks out, hard as stone, stroking themselves or having their partners do so, while the women are eagerly groping their tits or teasing their pussies. If your pheromones are this potent in such a huge room, then you shudder to think what’ll happen in a confined space.");
				output("\n\nAbove you, lights flash with smouldering reds and pinks, inspiring passion in those who have yet to have their attention captured by you. With so many people suddenly losing interest in their prior debauchery, the DJ notices the lack of enthusiasm and lowers the music out of his own curiosity, which, in turn, invites the other party-goers to investigate.");
				output("\n\nYou look around with a lavish grin and run your tongue over your lips, eying groups and individuals with a predatory hunger. Your tails sway idly, restrained only by the promise of what is to come. There’re so many options before you. So many, in fact, that you doubt you could feasibly choose.");
				output("\n\nBut why choose one or two or three or four? When you could take the entire party. Your instincts haven’t led you astray yet.");
				output("\n\nYou reach back and unclasp your makeshift underwear, freeing your tits and " + (pc.isErect() ? "fully-" : "half-") + "erect prick" + (pc.cocks.length == 1 ? "" : "s") + " to the onlookers. The vines slither around the back and adhere to the curve of your spine and waist, making sure you can’t lose them. Several onlookers lick their lips and concentrate on your assets with an almost eerie focus. Not that you particularly mind, it’s only natural what with your pheromones.");
				output("\n\nWith every inch of your body on display, you strut through the masses. They part before you, as if you were a goddess and they were unworthy to be in your presence. It’s invigorating, and to say nothing of how many of those around seem on the verge of cumming. But not by your own hand.");
				output("\n\nAnd that’s simply unacceptable.");
				output("\n\nYou spot a girl almost obscured by a pair of horse-morphs and point to her. She is one of the few that hasn’t touched themselves, though you can read that she wants to; it’s blatant in the way her eyes devour your visage. The horse-morphs turn to her and push her forward, chuckling good-naturedly. The girl, you notice, is a kaithrit. Her ears twitch and her tails sway nervously, but her cheeks are a deep red. How adorable, especially with her heterochromia eyes; one blue and the other green.");
				output("\n\nShe’s wearing a loose, summery shirt over her prodigious chest and shorts that barely cover her, equally shapely, ass. Your eye wonders over the rest of her figure, drinking every detail just to hype yourself for what’s to come. She has a svelte frame, typical of her species, but her breasts are enormous things, dominating her chest and even her tiny abdomen. But her hips aren’t to be overlooked as they flare out provocatively. Her hands move to cover herself when she notices you looking, making you grin widely.");
				output("\n\nYour cock-tails become fixated upon her as well. You sashay toward her until you stand directly before the kaithrit, who stares at you with a mixture of lust, fear and reverence. Just as she should, but you wish to enjoy yourself and that means stripping away her hesitance in the one way you know is guaranteed to work.");
				output("\n\nShe opens her mouth - perhaps to introduce or excuse herself - however you silence her with a single fluid motion; a cockvine shoots out, slithers down her shirt, and tears it away. The crowd around you finally makes a sound, one of excitement mixed with pleasure from several others. You look at the kaithrit, beaming with unmistakable intent.");
				output("\n\n<i>“What’s your name?”</i> You inquire, even as you reach down and hook your thumbs in her shorts. Your tails coil around her wrists to keep her from interrupting. She struggles against them, but a mixture of their natural strength and your pheromones keep her from breaking free. In the meanwhile, you marvel at how soft her skin feels and how squishy her sides are. She must have used some high-level mods to get her fat to distribute like this.");
				output("\n\nShe’s a perfect cuddle partner, you realize and almost laugh. Perhaps you should abscond with this girl and use her as your personal body pillow on your adventures? You decide against doing so, for now at least. There’re far more interesting things to do. For instance, a member of the crowd breaks free and takes hold of one of your cocks. They then start kissing and licking it, effectively making out with the tendril. You shrug and offer half of your tails to the masses.");
				output("\n\nThey are immediately beset upon and you can’t help but moan at the delicious symphony of sensations. You feel a pair of large breasts wrap around a tip, while another person shyly jerks and licks another vine as two others greedily take your cocks down their throats. Someone can’t handle any foreplay and simply slides a phallus into their ass. You return your focus to the kaithrit, who’s looking behind you at the five cock-tails you still have free.");
				output("\n\nWhen she notices you looking, she quickly brings her gaze down. It’s no better, however, as she spots your [pc.cockBiggest].");
				output("\n\n<i>“I’m going to use everything on you, kitty,”</i> you tease and lean forward until her ears tickle your nose, <i>“I’m going to fuck your cunt, your ass, your mouth, your tits, and maybe your navel if I feel like it,”</i> with every aspect of her body named, you slide your hands across it, lingering to grope her ass and tits. She grows tense, yet you can tell it’s not out of fear.");
				output("\n\n<i>“Selina,”</i> the kaithrit finally mewls.");
				output("\n\n<i>“Pretty name, too bad I’m going to make you forget it,”</i> you pull back and see her eyes go wide at your statement, before a moan slips from her lips. While talking, you had stripped her of her final piece of clothing, putting her delightfully bald crotch on display. With such a tempting sight, a cock-tail quickly takes advantage and penetrates her. You hold the others back, wanting something else first.");
				output("\n\nYou gently push Selina onto her back, cockvine leisurely thrusting in and out of her soaked snatch. Her hips roll with every slight movement, humping against your parasitic cock to drive it deeper. An unnecessary action, as you always intended to take her as deeply as possible. However, before that, you move to stand over her face with your rock-hard prick at the ready, then lower yourself until your member is poised at her mouth. She gets the idea immediately and you gasp and moan when her feline-like tongue runs across your urethra.");
				output("\n\nYou lean forward and impale her maw. She doesn’t seem to care as her cheeks hollow, sucking on you and gulping down your pre-cum. That deserves a reward, you decide and move another tail to just below your first. She feels its leaking, [pc.cockHead] against her voluptuous ass cheeks and raises her hips high up for you. It’s always the quiet ones, you chuckle in amusement and spear her ass on your sinuous member.");
				output("\n\nThe party goes into full swing now, as entire groups of people form off and start their own orgies. The cock-tails you leant the others are all fucking them now, taking the anal sluts so deeply that you wonder why your dicks haven’t come out of their mouths yet. Those with more traditional tastes buck their hips against your tendrils as their wombs are fucked, stuffing the organ with your cock and pre-cum.");
				output("\n\nAnd you’re the center of it all. Even as you fuck Selina’s face and ram into her two lower holes, several people are on you constantly. You can feel their hands caressing your skin, groping your tits, lightly fingering your ass, and on your unused tails. Time to change that, you resolve and stand up. Your cock slides out of the kaithrit’s mouth with strings of saliva and pre connecting you to her lips. Selina mewls helplessly and tries to reach up, but quickly falters when an orgasm tears through her.");
				output("\n\nYou turn to the people who were worshipping you and smirk. You sit down and go to lean back. On cue, one of them finds a bundle of clothes and uses them to make a pillow for you. Is this how it feels to be a queen? You can’t imagine it’s very different.");
				output("\n\nBefore making any further decisions, you put your remaining three tails in action. One spears Selina’s mouth, causing a sound between a gag and a moan, while another lays itself between her tits. Selina quickly pushes her basketball sized mounds together for you, while your final cock hovers over Selina’s navel.");
				output("\n\nMaybe that’s a bit too kinky, though? Perhaps you should just double-stuff her ass or pussy, give one of them an extra huge load of cum?");
			}
			
			processTime(24);
			
			addButton(0, "DP Pussy", cockvineBikiniEvent, "mingle pussy");
			addButton(1, "DP Ass", cockvineBikiniEvent, "mingle ass");
			addButton(2, "Fuck Navel", cockvineBikiniEvent, "mingle navel");
			break;
		case "mingle pussy":
		case "mingle ass":
		case "mingle navel":
			showBust("SELINA", "VIOLA");
			showName("\nPARTY!");
			
			switch(response)
			{
				case "mingle pussy": output("You decide to leave her belly button alone and, instead, force your tendril up her already stuffed snatch. Selina doesn’t mind in the slightest, as her walls clamp down around the twin invaders in another blissful climax. You drive the new addition deep into her, until her womb is forced to accommodate two of your leaking dicks. They coil about inside of her, stretching the organ more than should be possible. But this is a place of utter debauchery, you wouldn’t be surprised if everyone here is modded."); break;
				case "mingle ass": output("You decide to leave her belly button alone and, instead, force your tendril up her already stuffed asshole. Selina cries out at the sudden extra penetration; her juices continue flowing without end, however, leaving no mystery as to whether she enjoys this. You probe her anus deeper and deeper until your new cock has caught up to the first, then you force them further. They curl about her insides, writhing ecstatically at the warm, velvety innards constricting around them."); break;
				case "mingle navel": output("You’re sure she’s open to new experiences, so you decide to send your tendril surging into her navel. Were it not for ultraporn, you wouldn’t even know about such a thing, but you’re glad you did. It feels so similar to her ass and yet so different. Tight as a vice, but shallow enough to only just encapsulate the tip of your cock-tail. Selina gives cry of shock at the strange penetration, then quickly adjusts and even cums again from how insane this all is."); break;
			}
			output("\n\nYou place your full attention, or as close as you can get while fucking six different people all at once, on the group gawking at you. They look disappointed, but you have an easy solution to that. For all this action, your main body is still left wanting for attention, and they’re going to help with that. You beckon to a girl, who eagerly bounds over to you, looking like a puppy ready to get a treat. The analogy works, since she looks to be half-ausar.");
				output("\n\nWithout a word, you spread your legs and gesture to " + (pc.vaginas.length <= 1 ? "your pussy" : "one of your pussies") + ". She understands immediately and, tongue lolling out, she mashes her face into your crotch. You moan at her fervor, feeling her nose dig into your lustful clit and her long, slobbery tongue hungrily lap at your folds. It isn’t long before your thighs are damp with a mixture of your juices and her saliva.");
			// Female Variation:
			if(!pc.hasCock())
			{
				output("\n\nA snap of your fingers later and a couple of kui-tans, who look so similar you assume they’re sisters, come over and kneel on either side of you. The only difference you see between them is that one is a herm and the other is pure female, though both are clearly beside themselves with lust. The herm in particular is visibly pent-up, judging by how large and swollen her scrotum is. You grin at them both and lean back further, then you point to the female kui-tan.");
				output("\n\n<i>“You, on my face. And you,”</i> you point to her sister, <i>“Between my tits, now.”</i>");
				output("\n\nThey could have been prisoners of war for how quickly they acted upon your commands. In less than a second, your vision is consumed by fur and a rapidly descending heart-shaped cunt, while your abdomen is straddled and a hard, knotty prick is laid between your breasts. You almost giggle at the feeling of their fuzzy thighs against your skin.");
				output("\n\nYour mouth is soon preoccupied tasting the kui-tans juices. A delightfully copious surge of tangy sweetness floods your taste buds when she spontaneously cums, causing you to swallow rapidly even as your tongue and lips work her sensitive snatch. Her sibling is already hard at work fucking your tits, rubbing her large furry balls on you with each thrust of her hips. Pre-cum gushes from her tip to create a river of semen running down your torso.");
				output("\n\nSelina is not to be outdone, however. She uses her elbows to keep her tits together, while her hands wrap around the cock in her mouth, twisting up and down its length to earn as much of your sweet, sticky pre as possible. You hear her gulping it down over the slick sounds of the kui-tan on your face, no doubt hoping to turn you on as much as possible.");
				output("\n\nIt works and you eventually push the ausar girl away from your pussy. Despite all the stimulation bombarding your senses, you’ve yet to cum yourself, but you have a good idea of what might solve that. You look around and spot exactly what you need. There, amidst the writhing orgies and flying cumshots, is just the thing you needed; someone with a massive cock.");
				output("\n\nThe amalgamation of races is a stunner in every way. Even ignoring her unique aspects, her hair is a fiery red and runs down to her tailbone, her lips are full, pouty and luscious, while her waist accentuates her already huge tits, all four of them, and her hips promise either an easy birth or a serious dicking. There’s no doubt that her ass is equally spectacular.");
				output("\n\nWhen the jumbled mixture of species sees your gaze, she immediately breaks away and heads over, hooved feet clicking loudly on the floor. The closer she gets, you more clearly you see that she really is an amalgamation of alien races. You glimpse a vagina beyond her turgid cock and taut scrotum, one that looks distinctly like a raskvel’s with its dual clits. Not that it makes a difference, all you’re interested in is the dick. It, like the rest of this perplexing person, is a cacophony of races.");
				output("\n\nThe tip is flared and flat like a common terran equine, but only slightly further down you see little spines spread out like a kaithrit’s. Then there’s the trio of knots lining its impressive shaft, leading to the sheath. Its size doesn’t suit a biped such as her, as it looks like it could shame any kind of taur with ease.");
				output("\n\nYou pat the kui-tan on your face and she gets up with a sigh of regret, <i>“So, tell me, how big is that thing?”</i>");
				output("\n\nThe multi-racial herm flushes and looks away in embarrassment, <i>“Just shy of thirty inches.”</i>");
				output("\n\n<i>“And the balls?”</i>");
				output("\n\n<i>“Depends...”</i>");
				output("\n\n<i>“You,”</i> your attention turns to the herm sister, who, fortunately, has yet to cum. She snaps to attention with a yelp, <i>“Cum in their mouth,”</i> you gesture to your lover-to-be. You notice that their eyes light up your command, then turn wide when the kui-tan follows your order, <i>“What’s your name?”</i> You ask the new arrival.");
				output("\n\n<i>“Uh, Viola,”</i> she answers just as her knew kui-tan friend manages to bend them down and hilt her cock in Viola’s throat. The kui-tan must have been on edge, since she cums almost immediately afterwards. You idly watch as Viola swallows with what looks like practised ease, then turn your attention back to the kui-tan above you. She lowers herself back onto your face and you resume your feast.");
			}
			// Herm Variation:
			else
			{
				output("\n\nYou spy a tiny raskvel female masturbating with abandon just a few feet away. She notices you looking at her and promptly hops over, hands never leaving her cunt. When she comes to a stop in front of you, all it takes is a gesture to " + (pc.cocks.length == 1 ? "your cock" : "one of your cocks") + " and she understands. The raskvel stands over your erection and moves her hands to rest them on your [pc.belly], then sinks down so that your dick slips into her needful snatch.");
				
				pc.cockChange();
				
				output("\n\nA glance and snap of your fingers later and a couple of kui-tans, who look so similar you can only assume they’re sisters, come over and kneel on either side of you. The only difference you see between them is that one is a herm and the other is pure female, though both are clearly beside themselves with lust. The herm, in particular, is visibly pent-up, judging by how large and swollen her scrotum is. You grin at them both and lean back further, then you point to the female kui-tan.");
				output("\n\n<i>“You, on my face. And you,”</i> you point to her sister, <i>“Between my tits, now.”</i>");
				output("\n\nThey could have been prisoners of war for how quickly they acted upon your commands. In less than a second, your vision is consumed by fur and a rapidly descending heart-shaped cunt, while your abdomen is straddled and a hard, knotty prick is laid between your breasts. You almost giggle at the feeling of their fuzzy thighs against your skin.");
				output("\n\nYour mouth is soon preoccupied tasting the kui-tans juices. A delightfully copious surge of tangy sweetness floods your taste buds when she spontaneously cums, causing you to swallow rapidly even as your tongue and lips work her sensitive snatch. Her sibling is already hard at work fucking your tits, rubbing her large furry balls on you with each thrust of her hips. Pre-cum gushes from her tip to create a river of semen running down your torso.");
				output("\n\nThe raskvel notices this and decides to up her game. She adjusts so that she is crouching over you, shifts about to get her center of gravity just right, then begin to drive her hips up and down your dick like a jackhammer. With every descent, she grinds her dual clits against your groin. Wet slaps fill the air around you, a near match for the hordes of party-goers fucking and cumming and screaming throughout it all. The tiny alien’s grunts rise in fervor, then crest in a throat scarring screech of bliss. And yet, throughout it all, she never stops moving.");
				output("\n\nSelina is not to be outdone, however. She uses her elbows to keep her tits together, while her hands wrap around the cock in her mouth, twisting up and down its length to earn as much of your sweet, sticky pre as possible. You hear her gulping it down over the slick sounds of the kui-tan on your face, no doubt hoping to turn you on as much as possible.");
				output("\n\nIt works and you eventually push the ausar girl away from your pussy, but leave the bouncing raskvel. Despite all the stimulation bombarding your senses, you’ve yet to cum yourself, but you have a good idea of what might solve that. You look around and spot exactly what you need. There, amidst the writhing orgies and flying cumshots, is just the thing you needed; someone with a massive cock.");
				output("\n\nYou’ve no idea if they just couldn’t decide on a costume or if they went a little crazy with the mods, as they have triangular ears like a fox-morph’s, the mask-like marking of a kui-tan around their feline eyes, and a dual set of wolfish tails above their digitigrade horse legs. Their chest is dominated by two rows of breasts, each as big as your head and capped by what look to be dick-nipples.");
				output("\n\nNone of that matters though, what does is getting this specimen away from the group of whores desperately pining for their cock. You can’t blame them, of course.");
				output("\n\nThe amalgamation of races is a stunner in every way. Even ignoring her unique aspects, her hair is a fiery red and runs down to her tailbone, her lips are full, pouty and luscious, while her waist accentuates her already huge tits, all four of them, and her hips promise either an easy birth or a serious dicking. There’s no doubt that her ass is equally spectacular.");
				output("\n\nWhen the jumbled mixture of species sees your gaze, she immediately breaks away and heads over, hooved feet clicking loudly on the floor. The closer she gets, you more clearly you see that she really is an amalgamation of alien races. You glimpse a vagina beyond her turgid cock and taut scrotum, one that looks distinctly like a raskvel’s with its dual clits. Not that it makes a difference, all you’re interested in is the dick. It, like the rest of this perplexing person, is a cacophony of races.");
				output("\n\nThe tip is flared and flat like a common terran equine, but only slightly further down you see little spines spread out like a kaithrit’s. Then there’s the trio of knots lining its impressive shaft, leading to the sheath. Its size doesn’t suit a biped such as her, as it looks like it could shame any kind of taur with ease.");
				output("\n\nYou pat the kui-tan on your face and she gets up with a sigh of regret, <i>“So, tell me, how big is that thing?”</i>");
				output("\n\nThe multi-racial herm flushes and looks away in embarrassment, <i>“Just shy of thirty inches.”</i>");
				output("\n\n<i>“And the balls?”</i>");
				output("\n\n<i>“Depends...”</i>");
				output("\n\n<i>“You,”</i> your attention turns to the herm sister, who, fortunately, has yet to cum. She snaps to attention with a yelp, <i>“Cum in her mouth,”</i> you gesture to your lover-to-be. You notice that her eyes light up your command, then turn wide when the kui-tan follows your order, <i>“What’s your name?”</i> You ask the new arrival.");
				output("\n\n<i>“Uh, Viola,”</i> she answers just as her knew kui-tan friend manages to bend them down and hilt her cock in Viola’s throat. The kui-tan must have been on edge, since she cums almost immediately afterwards. You idly watch as Viola swallows with what looks like practised ease, then turn your attention back to the kui-tan above you. She lowers herself back onto your face and you resume your feast.");
			}
			
			processTime(36);
			pc.lust(1000);
			
			addButton(0, "Next", cockvineBikiniEvent, "mingle cum");
			break;
		case "mingle cum":
			showBust("VIOLA", "SELINA");
			showName("\nPARTY!");
			
			output("Viola interrupts after her own feast ends, knocking the kui-tan over and presenting her incredible hybrid cock to you. Your eyes immediately dart to her far more conspicuous aspect; her balls. The kui-tan DNA in her system did its job marvellously.");
			// Female Variation:
			if(!pc.hasCock())
			{
				output("\n\nYou widen your legs until you’re practically doing the splits and you all hear it as " + (pc.vaginas.length <= 1 ? "your drenched pussy" : "one of your drenched pussies") + " opens wide. The strength of your pheromones increases massively, causing both you and Viola to inhale sharply. Her face flushes a deep red and her breaths deepen. You nod towards your spread thighs and Viola smirks cockily. Apparently the kui-tan’s cum and your heady musk drown out nervousness.");
				output("\n\nViola quickly kneels between your thighs and you gasp as her monumental cock brushes against your opening. A flicker of nervousness flashes through your mind at the sheer scale of her member, but it quickly passes as Viola pushes against you. You don’t know if she could read the anxiety on your face or if she was simply impatient, but it’s welcome nonetheless. You force yourself up and wrap your arms around her neck.");
				output("\n\nViola leans down until her lips are nearly against your ear, <i>“Tell me you want it. Tell me you want my huge dick up your flower pussy.”</i> You frown at that remark; you push it aside, however, and focus on what you want at that moment; a hard fucking.");
				output("\n\n<i>“You know I do. Now fuck me until I’m satisfied or we’re in a coma,”</i> you growl. Viola chuckles in return. Your inhale catches in your throat and your eyes go wide as you’re suddenly speared on her immense shaft. Her flared head spreads your inner walls wider than you thought possible, ceaselessly pushing into you until she comes to a barrier.");
				if(!pc.hasVagina()) output("\n\nViola doesn’t hesitate and <b>rams past your hymen</b>. You squeak at the sharp stab of pain, but quickly recover as she pushes deeper into you. She inevitably penetrates your furthest depths, bulging out from your stomach as if about to leap from your chest like an ancient alien monster. The difference here is that you’re left without agony and instead bathed in burgeoning ecstasy. This is exactly the fucking that you needed.");
				else output("\n\nViola doesn’t hesitate and <b>rams through the lone wall</b>. It barely seemed to register to her that she just pushed into your womb, shoving her meat deeper and deeper, until she comes to the back of your uterus. She only keeps shoving herself deeper into you so that her oversized dick bulges from your belly, as if it’s an ancient alien monster about to leap from your chest. The difference is that you’re not in agony, but rather bathed in your burgeoning ecstasy. This fucking is exactly what you needed.");
				output("\n\nYou moan throatily when your clit mashes into Viola’s crotch. You could swear that you’ve never felt this full before. Certainly, you’ve never been so turned on or in such a state of prolonged bliss. Having ten separate cocks being pleasured apparently does that sort of thing. Piling a hyper-dicked alien hybrid fucking you on top of that would seem like overkill, except you couldn’t care less. Overkill, normal kill, so long as you keep Viola’s dick inside of you, it doesn’t matter.");
				output("\n\nViola takes the fact that she hilted inside of you as a signal to really move. Your grip around her neck tightens to a death throttle, for her movements put all her powerful lower body into action. Every muscle those horse legs possess works to saw her giant spire of cock in and out of you, the spines giving just enough resistance to tug on your cervix and dripping canal. Sparks of pleasure blast through you with every thrust as her slowly inflating knots open your pussy wide.");
				output("\n\nAs you’re bouncing atop her with every rise of her hips, you gasp when your nipples are suddenly engulfed in a pair of hot mouths. You glance down and see the kui-tan sisters are back and suckling on you, while their hands jerk the base of your cock-tails. It’s a small pleasure compared to everything else, but welcome all the same.");
				output("\n\nThe world begins to fade around you. None of it’s important compared to the ten pussies you’re fucking and the hyper-sized member plunging your depths. You vaguely register that you’re moaning and shouting, driving Viola to fuck you harder, yet it seems so far away. Like a dream.");
				output("\n\nYour mind hazes over and you lose yourself in the pleasure. There’s nothing else but the rapid thrusts of yours and Viola’s cocks, the sloppy sounds of pussies being pounded voraciously, and the sensations they all bring. You don’t know if you even exist right now. For all you know or care, you could be a simple stream of consciousness, a person, an animal, or all three.");
				output("\n\nThen everything implodes on itself and it’s all silent. You’re aware that nothing has ceased, but it’s like you’re separate from everything. Only then for the silence to explode into a supernova, one which enveloped you in a roaring inferno that should have burned you alive. Instead, it sent you spiralling into a bottomless abyss where nothing except bliss exists.");
				output("\n\nThe orgy comes back into focus as you experience possibly the ultimate orgasm. You see and hear people of all races achieve a lesser climax, their ejaculate flying high into the air, onto or into partners, and pouring out on the floor. Then there’s you. All ten of your cocks swell massively and you feel it as your semen pours through them. A new viscous warmth surrounds your members as your many pricks flood your lovers’ orifices.");
				output("\n\nViola cums mere seconds after your climax starts. Even as your pussy collapses around her, she keeps thrusting until it’s too much for her. The hybrid roars as she mashes her crotch against yours, sinking every inch of her monstrous cock inside. Her knots jump in size, locking you two together, as the first of many spurts blast into you like cannon-fire. Your orgasm reignites at that moment, brighter than even before, as your womb inflates to a round orb in mere seconds.");
				output("\n\nIt keeps swelling bigger and bigger. You quickly lose track of it as your mind fades to a blissful darkness. The last thing you remember seeing is your stomach forcing Viola to lay down, and the last feeling is that of her seed spilling out past her enormous knots. You have no idea how you didn’t burst from all that jizz being packed into you.");
			}
			// Herm Variation:
			else
			{
				output(" You smirk up at her and glance to your lower body, then pull the kui-tan back onto your face.");
				output("\n\nYou widen your legs until you’re practically doing the splits and you all hear it as your drenched pussy opens wide. The strength of your pheromones increases massively, causing both you and Viola to inhale sharply. Her face flushes a deep red and her breaths deepen. You nod towards your spread thighs and Viola smirks cockily. Apparently the kui-tan’s cum and your heady musk drown out nervousness.");
				output("\n\nThe raskvel on your dick slows considerably as she cums powerfully. Every breath she takes seems to make her pussy clench tighter around your cock, milking it and squirting juices all over your thighs and belly. She lazily glances back and sees Viola, or, more specifically, Viola’s member. The tiny alien sighs when she realizes that it’s not to be used on her. She then resumes her bouncing, though she’s slower than before. Exhaustion must be setting in.");
				output("\n\nFortunately, the situation is remedied by a horny Samaritan. You don’t see who it is, but appreciate it when they remove the tired raskvel and take her place. Whoever it is, their pussy is tighter than the last. This stranger then picks up with the former alien left off and starts squatting on your prick, rising and fall rapidly.");
				output("\n\nViola kneels between your thighs and you gasp as her monumental cock brushes against your opening. A flicker of nervousness flashes through your mind at the sheer scale of her member, but it quickly passes as Viola pushes against you. You don’t know if she could read the anxiety on your face or if she was simply impatient, but it’s welcome nonetheless.");
				output("\n\nViola leans around the girl on your dick, though you can’t see her with your vision consumed in kui-tan pussy, <i>“Tell me you want it. Tell me you want my huge dick up your flower pussy.”</i> You frown at that remark; you push it aside, however, and focus on what you want at that moment; a hard fucking. You lift the kui-tan to respond.");
				output("\n\n<i>“You know I do. Now fuck me until I’m satisfied or we’re in a coma,”</i> you growl. Viola chuckles in return. Your inhale catches in your throat and your eyes go wide as you’re suddenly speared on her immense shaft. Her flared head spreads your inner walls wider than you thought possible, ceaselessly pushing into you until she comes to a barrier.");
				if(!pc.hasVagina()) output("\n\nViola doesn’t hesitate and <b>rams past your hymen</b>. You squeak at the sharp stab of pain, but quickly recover as she pushes deeper into you. She inevitably penetrates your furthest depths, bulging out from your stomach as if about to leap from your chest like an ancient alien monster. The difference here is that you’re left without agony and instead bathed in burgeoning ecstasy. This is exactly the fucking that you needed.");
				else output("\n\nViola doesn’t hesitate and <b>rams through the lone wall</b>. It barely seemed to register to her that she just pushed into your womb, shoving her meat deeper and deeper, until she comes to the back of your uterus. She only keeps shoving herself deeper into you so that her oversized dick bulges from your belly, as if it’s an ancient alien monster about to leap from your chest. The difference is that you’re not in agony, but rather bathed in your burgeoning ecstasy. This fucking is exactly what you needed.");
				output("\n\nYou moan throatily when your clit mashes into Viola’s sheath. You could swear that you’ve never felt this full before. Certainly, you’ve never been so turned on or in such a state of prolonged bliss. Having ten separate cocks being pleasured apparently does that sort of thing. Piling a hyper-dicked alien hybrid fucking you on top of that would seem like overkill, except you couldn’t care less. Overkill, normal kill, so long as you keep Viola’s dick inside of you, it doesn’t matter.");
				output("\n\nViola takes the fact that she hilted inside of you as a signal to really move. You grip the kui-tan’s thighs until she yelps in pain, for Viola’s movements put all her powerful lower body into action. Every muscle those horse legs possess works to saw her giant spire of cock in and out of you, the spines giving just enough resistance to tug on your cervix and dripping canal. Sparks of pleasure blast through you with every thrust as her slowly inflating knots open your pussy wide.");
				output("\n\nAs you’re forcibly rocked back and forth by the ferocity of her onslaught, you gasp when your nipples are suddenly engulfed in a single, wet maw. You glance down and see the kui-tan’s herm sibling is back and suckling on you, while her hands jerk the base of your cock-tails. It’s a small pleasure compared to everything else, but welcome all the same.");
				output("\n\nThe world begins to fade around you. None of it’s important compared to the near dozen pussies you’re fucking and the hyper-sized member plunging your depths. You vaguely register that you’re moaning and shouting, driving Viola to fuck you harder, yet it seems so far away. Like a dream.");
				output("\n\nYour mind hazes over and you lose yourself in the pleasure. There’s nothing else but the rapid thrusts of yours and Viola’s cocks, the sloppy sounds of pussies being pounded voraciously, and the sensations they all bring. You don’t know if you even exist right now. For all you know or care, you could be a simple stream of consciousness, a person, an animal, or all three.");
				output("\n\nThen everything implodes on itself and it’s all silent. You’re aware that nothing has ceased, but it’s like you’re separate from everything. Only then for the silence to explode into a supernova, one which enveloped you in a roaring inferno that should have burned you alive. Instead, it sent you spiralling into a bottomless abyss where nothing except bliss exists.");
				output("\n\nThe orgy comes back into focus as you experience possibly the ultimate orgasm. You see and hear people of all races achieve a lesser climax, their ejaculate flying high into the air, onto or into partners, and pouring out on the floor. Then there’s you. All ten of your cocks swell massively and you feel it as your semen pours through them. A new viscous warmth surrounds your members as your many pricks flood your lovers’ orifices.");
				output("\n\nViola cums mere seconds after your climax starts. Even as your pussy collapses around her, she keeps thrusting until it’s too much for her. The hybrid roars as she mashes her crotch against yours, sinking every inch of her monstrous cock inside. Her knots jump in size, locking you two together, as the first of many spurts blast into you like cannon-fire. Your orgasm reignites at that moment, brighter than even before, as your womb inflates to a round orb in mere seconds.");
				output("\n\nIt keeps swelling bigger and bigger. You quickly lose track of it as your mind fades to a blissful darkness. The last thing you remember seeing is your stomach forcing Viola to lay down, and the last feeling is that of her seed spilling out past her enormous knots. You have no idea how you didn’t burst from all that jizz being packed into you.");
			}
			
			processTime(64);
			pc.applyCumSoaked();
			pc.applyPussyDrenched();
			if(pc.hasCock()) {
				cumQ = pc.cumQ();
				if(cumQ >= 1000) pc.applyCumSoaked();
				if(cumQ >= 5000) pc.applyCumSoaked();
				if(cumQ >= 10000) pc.applyCumSoaked();
			}
			if(pc.hasVagina()) {
				cumQ = pc.girlCumQ();
				if(cumQ >= 1000) pc.applyPussyDrenched();
				if(cumQ >= 5000) pc.applyPussyDrenched();
				if(cumQ >= 10000) pc.applyPussyDrenched();
			}
			for(i = 0; i < 10; i++) {
				pc.orgasm();
				pc.exhibitionism(2);
			}
			
			addButton(0, "Next", cockvineBikiniEvent, "aftermath");
			break;
		case "aftermath":
			halloweenShipMove();
			showName("\nAFTERMATH");
			
			output("You awake in your bed and groggily look around.");
			output("\n\n<i>“What happened?”</i> You ask the air around you and sit up, then you notice your codex beside you and grab it, seeing that you’ve got a new message. You open it and a hologram erupts before you, showing a girl that you vaguely recognize.");
			// [If you chose to go to Holiday’s Shop rather than Mingle]
			if(flags["COCKVINE_BIKINI_EVENT"] == 1)
			{
				output("\n\nIt takes a few seconds, but you do recall her name is Lila and what you did to her. The good news is that she doesn’t seem mad at you.");
				output("\n\n<i>“Hey there beautiful,”</i> she begins, fluttering her eyelashes at you, <i>“That was one hell of a fucking night. Damn, I can’t even remember how many times I came. Or how many times you did,”</i> she leans away from the camera, then, and shows you her stomach. It’s huge! Massive, even, dominating her frame. But how? She couldn’t be pregnant already?");
				output("\n\n<i>“This is all cum! And I’ve been draining since last night. Guess whatever it is that turned me into a laquine did something extra. And I don’t think it’ll wear off,”</i> you grimace at that, recalling that you told her the changes she experienced were only temporary, <i>“But don’t worry,”</i> she says, predicting your reaction, <i>“I love it! I’m horny all the time, but that’s fine. Maybe it’s my new biology or something, but I’m even looking forward to being pregnant! And I bet I am after that.”</i>");
				output("\n\n<i>“Anyway,”</i> she continues with a calming pat of her tumescent middle, <i>“I’m sending this because I found this,”</i> she lifts a circle of green, which you recognize as the choker from last night, <i>“I don’t remember all the details, but I got this off you and tried it on. Well, now I also have these,”</i> Lila turns around and shows that she has a series of slits down her back. She tenses and several cock-tipped tentacles slither out.");
				output("\n\n<i>“Turns out, this ‘choker’ administers something called ‘Cerespirin’ into the bloodstream. It’s not sold anywhere, not legally anyway. Long story short is that it basically turns people who use it into a mixture of plant and their DNA. Like a dryad. But...”</i> Lila hesitates and glances at the choker, then back to the camera, <i>“It reacted to something messing with your DNA at the time. Which would probably be those cockvines... by the way give them a kiss for me would you?”</i>");
				output("\n\nJust get on with it, you silently growl in worry.");
				output("\n\n<i>“So, uh, you’re a mutant dryad. You should probably get yourself checked out more thoroughly. Oh and one more thing,”</i> Lila blushes under her fur, <i>“If you’re ever planet-side again, hit me up, alright? Bye.”</i>");
			}
			// [If PC chose Mingle rather than go to Holiday’s store]
			else if(flags["COCKVINE_BIKINI_EVENT"] == 2)
			{
				output("\n\nIt takes a few seconds, you eventually remember her name is Viola and some of the events surrounding your meeting. You’re not surprised that she’s beaming at you.");
				output("\n\n<i>“Hey there, [pc.name]. Sorry I couldn’t be there, but things started getting out of hand after some feds showed up. We snuck you out in case anything was wrong. And turns out it was,”</i> Viola’s face fell at that and she turns to someone off camera. They slide into frame beside Viola and you recognize them as the kaithrit, Selina.");
				output("\n\n<i>“Right, so while we were getting you away. I accidentally pulled this off you,”</i> Selina explains and holds up a green circle, which you recognize as the choker you were wearing last night, <i>“I’ve got a few friends who know a few things - let’s leave it at that - and they taught me some stuff. Basically, this thing administers an illegal mod called ‘Cerespirin’, which effectively turns users into dryads.”</i>");
				output("\n\nYou go to look away, but pause when she continues, <i>“The only problem is that there was something messing with your DNA at the same time. I.E. those glorious cocks of yours. I don’t think it necessarily did anything harmful, but you’re not an average dryad that’s for sure. Not that I minded at all,”</i> Selina stands and shows the camera that her stomach is noticeably swollen.");
				output("\n\n<i>“That’s all spunk, by the way,”</i> Viola adds, <i>“Speaking of which, you might be in the same predicament. My cum is pretty thick after all. But don’t worry, I’m fully sterile. Otherwise I’d have a hundred kids by now.”</i>");
				output("\n\n<i>“Anyway, you might want to get yourself checked on properly. Just in case something’s up, though I don’t think you’re in any danger,”</i> Selina advises with a warm grin, which changes to a joking grimace. You quickly see why when you spot Viola’s unforgettable member pop up.");
				output("\n\n<i>“Thanks for introducing us,”</i> Viola says quickly and the hologram dies just as she lifts Selina high.");
			}
			processTime(315);
			
			addButton(0, "Next", cockvineBikiniEvent, "finish");
			break;
		case "finish":
			clearBust();
			showName("\nAFTERMATH");
			
			output("You immediately check yourself over, reaching back to grab at the bikini vines. They unclasp easily enough, but won’t be removed from your back. A twist of your head and you see that they’ve merged with your flesh, blending perfectly into your green skin. Green?!");
			output("\n\nYou look everywhere on your body and see that your skin has turned a dark shade of green, with what looks like ivy winding its way up your arms, though you spot what looks like cockvine seedlings sprouting. Your codex acts as a mirror as you inspect your face, finding that your eyes are a solid emerald, no pupils, and the whites are yellow now. Your hair has turned purple and you spot what looks like a red orchid, with tiny cockvines at its center, blooming from the side of your head.");
			output("\n\nWhat else has changed? You frantically inspect your groin.");
			if(pc.isMale()) {
				output("\n\nYou sigh in relief, finding that your [pc.cocks] " + (pc.cocks.length == 1 ? "is" : "are") + " still there, despite it being a deep shade of green. You then reach past " + (pc.cocks.length == 1 ? "it" : "them") + " and gasp");
				if(pc.femininity < 65) output(", only now registering how feminine your voice has become,");
				output(" at the sensation of touching your new, orchid vagina. You are relieved that you haven’t sprouted something like a dozen tentacles down there at least");
				if(pc.breastRows[pc.biggestTitRow()].breastRatingRaw < 5) {
					output(", and feel a new weight on your chest. Of course, you grew boobs as well. Bright side, they’re large and buoyant");
					if(pc.buttRatingRaw < 5) output(". As is your ass");
				}
				else if(pc.buttRatingRaw < 5) output("... although your ass is a bit heftier now");
				output(".");
			}
			else if(pc.isSexless()) {
				output("\n\nYou gasp in shock");
				if(pc.femininity < 65) output(", now registering how feminine your voice has become,");
				output(" at the sensation of touching your new, orchid vagina. You sigh in relief that you haven’t sprouted something like a dozen tentacles down there");
				if(pc.breastRows[pc.biggestTitRow()].breastRatingRaw < 5) {
					output(", and notice an odd weight on your chest. Of course, you grew boobs as well. Bright side, they’re large and buoyant");
					if(pc.buttRatingRaw < 5) output(". As is your ass");
				}
				else if(pc.buttRatingRaw < 5) output("... although your ass is a bit heftier now");
				output(".");
			}
			else if(pc.isFemale())
			{
				output("\n\nYou sigh in relief that you haven’t grown a cock or something. You’ve heard plenty of stories about transformative items doing that, even when they’re not meant to.");
				if(pc.vaginas.length == 1) output(" Your pussy, however, has changed a great deal. It now resembles an orchid, with petals framing your opening and has cute freckles dotting your clit. At least it looks pretty.");
				else output(" Your pussies, however, have changed a great deal. They now resemble orchids, with petals framing each opening and have cute freckles dotting their clits. At least they look pretty.");
			}
			else {
				output("\n\nYou sigh in relief that everything if still there, though your [pc.cocks] " + (pc.cocks.length == 1 ? "is" : "are") + " turned a deep shade of green. Hopefully your pussy hasn’t changed much. You move your member" + (pc.cocks.length == 1 ? "" : "s") + " aside and see that your " + (pc.vaginas.length == 1 ? "snatch has turned into a flower of sorts" : "vaginas have each turned into flowers of sorts") + ", gorgeous petals frame " + (pc.vaginas.length == 1 ? "your" : "each") + " pussy. They’re almost like a target for horny cocks. Speaking of which...");
			}
			output("\n\nHaving inspected your equipment, you then turn your attention to the most memorable aspect of last night; the cockvines. They’re still there. And now that your attention is on them, you can feel twinges of desire teasing at the back of your mind. You make them move separately, then all together, and find that you have a fair amount of control over them. For now, at least.");
			output("\n\n<b>You’ve become a mutant dryad!</b>");
			
			applyMutantDryadTF();
			processTime(5);
			pc.lust(15);
			
			addButton(0, "Next", mainGameMenu);
			break;
		default:
			output("ERROR: No scene!");
			addButton(0, "Next", mainGameMenu);
			break;
	}
}
public function applyMutantDryadTF():void
{
	var i:int = 0;
	// Changes after the Masque:
	// Becomes a Mutant Dryad (or just dryad if mutant part is unnecessary or too strenuous).
	// Remain the same height.
	if(pc.femininity < 65) pc.femininity = 65;
	// Irises become a solid, oak green, no pupils. Sclera turns amber.
	pc.eyeType = GLOBAL.TYPE_COCKVINE;
	pc.eyeColor = "oak green";
	// Hair color turns purple with a red orchid blooming from one side.
	if(pc.hairLength < 6) pc.hairLength = (6 + rand(3));
	pc.hairColor = "purple";
	pc.removeStatusEffect("Hair Flower");
	pc.createStatusEffect("Hair Flower", 1, 0, 0, 0, true, "", "red", false);
	// Skin turns to green.
	pc.skinType = GLOBAL.SKIN_TYPE_PLANT;
	pc.skinTone = "dark green";
	pc.clearSkinFlags();
	pc.addSkinFlag(GLOBAL.FLAG_SMOOTH);
	// Arms
	pc.armType = GLOBAL.TYPE_FLOWER;
	pc.clearArmFlags();
	// If breasts are <DD grow to DD
	for(i = 0; i < pc.bRows(); i++)
	{
		if(pc.breastRows[i].breastRatingRaw < 5) pc.breastRows[i].breastRatingRaw = 5;
	}
	// If ass rating is <5 goes to 5.
	if(pc.buttRatingRaw < 5) pc.buttRatingRaw = 5;
	// If hip rating is <10 make it 10.
	if(pc.hipRatingRaw < 10) pc.hipRatingRaw = 10;
	// If virility is <200% increase to 200%
	if(pc.cumQualityRaw < 2) pc.cumQualityRaw = 2;
	// If cum production is <1000% increase to 1000%
	if(pc.refractoryRate < 10) pc.refractoryRate = 10;
	// No external changes to any cocks or balls. Except size.
	if(pc.hasCock())
	{
		// If cock is <10 inches – grow 4 inches
		for(i = 0; i < pc.cockTotal(); i++)
		{
			if(pc.cocks[i].cLengthRaw < 10) pc.cocks[i].cLengthRaw += 4;
			else pc.cocks[i].cLengthRaw += 2;
			if(pc.hasPerk("Mini")) pc.cocks[i].cLengthRaw -= 2;
			if(pc.hasPerk("Hung")) pc.cocks[i].cLengthRaw += 2;
			pc.cocks[i].cockColor = "green";
		}
	}
	// If balls diameter is <5 inches – grow 2 inches
	if(pc.ballDiameter() < 5)
	{
		pc.ballSizeRaw += (2 * Math.PI);
		if(pc.balls > 0 && pc.hasPerk("Bulgy")) pc.ballSizeRaw += (1 * Math.PI);
	}
	// If PC doesn’t have a vagina, grow an orchid vagina with hymen.
	var flowerColor:String = RandomInCollection(["purple", "pink", "white"]);
	if(!pc.hasVagina()) pc.createVagina();
	
	var ppCockvine:Cockvine = new Cockvine();
	ppCockvine.impregnationType = "CockvinePregnancy";
	ppCockvine.cumQualityRaw = 2.0;
	ppCockvine.createPerk("Fixed CumQ", 9000, 0, 0, 0);
	
	var ppViola:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!ppViola.hasCock()) ppViola.createCock();
	ppViola.shiftCock(0, GLOBAL.TYPE_EQUINE);
	ppViola.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
	ppViola.cocks[0].addFlag(GLOBAL.FLAG_NUBBY);
	ppViola.cocks[0].cLengthRaw = 30;
	ppViola.cocks[0].knotMultiplier = 1.5;
	ppViola.createPerk("Fixed CumQ", 50000, 0, 0, 0);
	ppViola.createPerk("Fixed GirlCumQ", 1000, 0, 0, 0);
	
	for(i = 0; i < pc.totalVaginas(); i++)
	{
		if(pc.vaginas[i].type != GLOBAL.TYPE_FLOWER) pc.shiftVagina(i, GLOBAL.TYPE_FLOWER);
		pc.vaginas[i].vaginaColor = flowerColor;
		
		if(flags["COCKVINE_BIKINI_EVENT"] == 1)
		{
			pc.cuntChange(i, pc.tailCockVolume(), false);
			pc.loadInCunt(pc, i);
			pc.loadInCunt(ppCockvine, i);
		}
		if(flags["COCKVINE_BIKINI_EVENT"] == 2 && i == 0)
		{
			pc.cuntChange(i, ppViola.cockVolume(0), false);
			pc.loadInCunt(ppViola, i);
			pc.girlCumInMouth(ppViola);
		}
	}
	// Reason: The choker was administering a constant supply of Cerespirin into the PC, which had a reaction to the cockvines merging with the PC.
}

