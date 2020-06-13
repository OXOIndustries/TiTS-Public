//Aurora created by Magic Ted.
/*
Exterior

(Original; 	//#13 NOVAHOME
  rooms["213"] = new RoomClass(this);
    rooms["213"].roomName = "\nNOVAHOME";
    rooms["213"].description = "The Nova’s internal lighting flickers gently with its own asynchronous rhythm. To the east, the illumination is brighter and more steady. You estimate the ship’s powerplants are located in the aft of the ship, near its engines, and the power conduits are in less than pristine condition. Further west, where the corridor ends, it’s even dimmer, oddly reminiscent of just minutes after sunset. On what you figure is the north side of the hallway is a large tear in the wall, as if made by an explosion. If it was it’s since been cleaned up, giving a you a comfortably spacious, if makeshift, door to enter the dimly lit room.")

Note: Add barrier to entry for nudists. Error text saying someone stares them down and points to a “Stay chaste" or something sign I dunno

if(!pc.isNude())

(Add to exterior description) As you eye the entrance you here a feminine grunt from an elderly looking raskvel woman, who points upwards to a dangling sign as she passes by. A childish drawing of a dangling bat with the phrase ‘Stay chaste please!’ is written. <b>Looks like you’ll need to get on a real suit, not your birthday one.</b>

(Gray out NORTH BUTTAN)

(If Tarkus is asplode, you fukken asshole)

Blahblah. On what might as well be the northern side of the hallway there is what appears to be a hastily welded over wall, several large sheets of metal haphazardly fused with one another and the wall to make a seal. Being that you’re <i>breathing</i>, it’s surprisingly functional.

(If met Aurora) Aurora’s workshop was behind it, once, but now it’d lead into the unhealthy recesses of space. While she’s a smart kid and probably got through it just fine, she’s not here. Even if you did try to look for her in the mess of ship she’s probably far too busy keeping it running, such as it is.

Interior

	//??. Aurora’s Shopee
    rooms["AURORA’S SHOP"] = new RoomClass(this);
    rooms["AURORA’S SHOP"].roomName = "MECHANIST’S\nSHOP";
    rooms["AURORA’S SHOP"].description = "";
    rooms["AURORA’S SHOP"].southExit = "213";
    rooms["AURORA’S SHOP"].planet = "PLANET: TARKUS";
    rooms["AURORA’S SHOP"].system = "SYSTEM: REDACTED";
    rooms["AURORA’S SHOP"].addFlag(GLOBAL.INDOOR);
    rooms["AURORA’S SHOP"].addFlag(GLOBAL.COMMERCE);
*/

public function auroroMessInRoomText(slot:int = 1):void
{
	if(flags["TARKUS_DESTROYED"] != undefined && flags["MET_AURORA"] != undefined/* && flags["DECK13_SHIELDS_ON"] == 1*/)
	{
		output("\n\nIn a quiet corner of the too-large room you see a familiar dangling figure enjoying a peach. Looks like Aurora is about the same as ever.");
		addButton(slot,"Aurora",approachAurora);
	}
}

public function approachAuroraPostTarkusBoom():void
{
	clearOutput();
	author("Magic Ted");
	auroraBust();
	//da first time
	//yo yo she be hangin’ out wings snuggled around her gnawing away on a fuzzy peach man get a load of this bat so fukken kawaii
	if(flags["AURORA_SEEN_AFTER_SPLOSION"] == undefined)
	{
		flags["AURORA_SEEN_AFTER_SPLOSION"] = 1;
		output("Admittedly, you were a little worried about the bat");
		if(pc.isAss()) output(", even if it was just out of curiosity");
		output(". Any fears that you might have fostered were quickly abated by her dangling appearance in the mess - she is a clever little cookie. Honestly, Aurora is probably <i>used</i> to a few cataclysmic explosions here or there. Just maybe not to this scale.");
		output("\n\nAurora looks just as perky as ever as she dangles off a ruined ceiling light while eagerly gorging herself on a particularly fuzzy-looking peach, unconcerned with the steady dripping mess that falls to the floor. She doesn’t even notice you, still far too engrossed in her tasty bit of fruit to so much as open her eyes. She’d always felt on ease on the <i>Novahome</i>; even if it is all there is now, there’s no need to keep an literal eye out for trouble.");
		output("\n\nAs you distract yourself you lose the chance to get the ‘jump’ on her. One of her ears twitches around her pressed-up goggles as she peeks a golden eye open, and then the other. The voracious bat is practically beaming around that fruit as she makes it disappear in a few hungry swipes down her maw, no longer taking the time to savor her lunch.");
		output("\n\n<i>“<b>Hello!</b>”</i> She hasn’t lost her voice");
		if(pc.isAss()) output("; regrettably");
		output(". “You’re safe! That’s good. Things got a bit, er, different around here, huh.” Not even the world crumbling out beneath her would tarnish this girl’s eternal peppiness. Despite having her livelihood lost to a vacuum, she looks to be about the same - you can even see the tools strapped to her person from around her blanketing wings.");
		output("\n\n<i>“I gotta go get to work soon, but do you need something?”</i> Busy bat, huh.");
	}
	//Repeat
	//bat is hangin’ out and waves when you approach, fukken bat god damn
	else
	{
		output("As you approach, Aurora becomes much more lively. By the time you make it over to her, that peach treat she was gnawing on has completely disappeared! The bat-mechanist is all smiles, giving you her full attention. <i>“Hey! I’m just finishing up; what do you need?”</i>");
	}
	//Menu calls show up already since this is called within the normal approachAurora
}

public function auroraBonus():Boolean
{
	output("The cavernous room is dimly lit with swaying, hanging lamps similar to a gloomy and moonlit night on a much more <i>habitable</i> world, still bright enough to make out vague details. The room isn’t a comfortable one, claustrophobic with the stacks of shelves, boxes and half-ruined devices haphazardly placed about with little rhyme or reason, or the signs of damaged hull that seem especially prevalent here, making it hard to get around. If that wasn’t enough to make you on edge, the thick, heady scent of char permeates the room, making your senses reel and head dizzy as you try to keep it all together.");
	if(pc.isCrotchExposed())
	{
		auroraBust();
		author("Fenoxo");
		output("\n\nAs soon as you step inside, a howling, screeching alarm goes off. Did you trigger some kind of anti-intrusion system? The sound of a fist hitting metal jars you out of your reverie, and you at last identify the inhuman tone as coming from ");
		if(flags["MET_AURORA"] == undefined) output("the small bat-girl in the back of the chamber.");
		else output("Aurora.");
		output(" Her knuckles have depressed a big, red button, and she screeches, <i>“Creep!”</i> as a mechanism in the wall kicks into gear.");
		output("\n\nIn the blink of an eye, a giant metallic palm swings out of the wall on strength from a dozen pneumatic cylinders, bowling you right out the doorway. A shrill voice chases you, calling, <i>“Put some pants on!”</i>");
		output("\n\n<b>It looks like you need clothes to go in that shop....</b>");
		applyDamage(new TypeCollection( { unresistablehp: 1 }, DamageFlag.BYPASS_SHIELD ), null, pc, "minimal");
		clearMenu();
		addButton(0,"Next",move,"213");
		return true;
	}
	output("\n\nThe one saving grace is also one of its biggest (if structural) flaws; there’s a massive tear in the far away wall, exposing the room to the outside and, most importantly, fresh air. The outside light is a lovely appeal to comfort, too. Musing, you realize it’s all rather reminiscent to a cave.");
	output("\n\nDespite the mess, it’s rather easier to find the shopkeeper in all her batty, kid-mechanist glory as she zooms about the room while doing her upside down work, causing the rubbery rigging clinging to the ceiling to stretch and the metal rafters to groan under her modest weight. It’d be a lot safer for her to come to you instead of trying to mimic her behavior, so you figure it’d be prudent to get her attention.");

	// [Aurora] [South]
	if(flags["MET_AURORA"] == undefined) addButton(0,"Bat-Kid",approachAurora);
	else addButton(0,"Aurora",approachAurora);
	return false;
}

public function auroraBust():void
{
	userInterface.showName("\nAURORA");
	userInterface.showBust("AURORA");
}

//Aurora
public function approachAurora():void
{
	clearOutput();
	author("Magic Ted");
	auroraBust();
	if(pc.isCrotchExposed())
	{
		author("Fenoxo");
		/*
		output("As soon as you step inside, a howling, screeching alarm goes off. Did you trigger some kind of anti-intrusion system? The sound of a fist hitting metal jars you out of your reverie, and you at last identify the inhuman tone as coming from ");
		if(flags["MET_AURORA"] == undefined) output("the small bat-girl in the back of the chamber.");
		else output("Aurora.");
		output(" Her knuckles have depressed a big, red button, and she screeches, <i>“Creep!”</i> as a mechanism in the wall kicks into gear.");
		output("\n\nIn the blink of an eye, a giant metallic palm swings out of the wall on strength from a dozen pneumatic cylinders, bowling you right out the doorway. A shrill voice chases you, calling, <i>“Put some pants on!”</i>");
		output("\n\n<b>It looks like you need clothes to go in that shop....</b>");
		*/
		
		output("As soon as you approach the bat, a howling, screeching alarm goes off all around you. What the--?! Seemingly out of nowhere, she quickly draws an intimidating-looking flare gun, heavily holding it with both hands. Making certain to aim the firearm directly between your eyes, she screeches, <i>“Creep!”</i> You hear the click of the depressed trigger followed by a loud, pneumatic hiss.");
		output("\n\nYour vision is suddenly obscured by what appears to be a giant, red punching glove before your world goes entirely black and you are instantly knocked off your [pc.feet] and pushed out of the room. A shrill voice chases you, calling, <i>“Put some pants on!”</i>");
		output("\n\n<b>It looks like you need to be wearing some clothes before talking to her....</b>");
		
		applyDamage(new TypeCollection( { unresistablehp: 1 }, DamageFlag.BYPASS_SHIELD ), null, pc, "minimal");
		clearMenu();
		if(currentLocation == "301") addButton(0,"Next",move,"212");
		else addButton(0,"Next",move,"213");
		return;
	}
	//First meeting
	if(flags["MET_AURORA"] == undefined)
	{
		flags["MET_AURORA"] = 1;
		output("Standing in the clear space by the “door”, you wave down the small, dangling worker as she scurries about the rafters, quickly getting her attention. Two golden orbs surprisingly pierce the darkness as the girl turns to face you from across the room, pausing in place and causing her to rock back and forth from the sudden stop. She remains quiet for a length of time, long enough that you start to think you might have done something wrong - that is, until she comes bursting over. Zeroing onto you faster than you ever could in the same position, she dodges a tall shelf or two in the process, something made all the more impressive by the fact that she was upside down the entire time!");

		output("\n\nThough, now that you can see her better, that was probably a given.");

		output("\n\nThe girl’s radiant, golden eyes stare into your own at conveniently perfect eye-to-eye level, with a giant smile on her pudgy, fuzzy cheeks disarming any nervousness. She’s definitely a <i>girl</i>! A youthful little upstart that probably has little business being here, let alone being evidently unsupervised. You decide to keep that thought to yourself for now. She’s a rather beastial thing and very certainly some sort of bat-morph, body covered in a dark brown fuzzy down with claw-like feet and fingers coming from her wide spanning, leathery wings midjoint. Despite her cute humanoid face she probably isn’t modded, “just” an alien. She’s much too young for anything like that.");
		output("\n\nAs you gauge her, your thoughts start drifting away from concern about her absent chaperone to simply how her hair stays “down” despite her dangling nature until she speaks.");

		output("\n\n<i>“<b>Hello</b>!”</i> God, she’s loud and giddy. Pearly whites on full display, she’s the full exaggeration of a good salesman. <i>“<b>Welcome</b>! Can I help you?”</i> Uh. While you hesitate, you go ahead and ask what this place is. <i>“It’s my shop! Where I tinker with stuff! And sell other stuff, too. You know. </i>Business<i>.”</i>");

		output("\n\nUh huh. Perhaps you should get someone... <i>taller</i>. <i>“So, uh, is there anyone else I could-”</i>");

		if (silly) output("\n\n<i>“My parents are deaaaaad!!!”</i> \n\n Of course they are. <i>They</i> couldn’t resist that.");
		else output("\n\n <i>“Nope! It’s just me. Just. <b>Me</b>.”</i> Her eyes widen as she stares across to you, unblinking and you quickly start to get the feeling this is probably a regular, irritable question.");

		output("\n\nUh, okay. <i>“What do you have available here, then?”</i>");

		output("\n\n<i>“<b>Glad you asked</b>! I have all sorts of </i>gizmos<i> and </i>gadgets<i> that I find and rig together from the junk! They bring me lots of junk! Sometimes they ask me to repair certain stuff, too! I got the engines working and the forward artillery cannon operational!”</i> Wait, this hunk of scrap is loaded? <i>“It’s not supposed to be!”</i> Scratching your head, you start to realize this kid might not be fibbing, something that gets no small amount of credit as the kid in question idly fiddles with a tinkered object that looks remarkably like a plumbing-valve between her wings.");

		output("\n\n<i>“Could you narrow it down some? I don’t really need ship-”</i>");

		output("\n\n<i>“I make weapons, too! And armor and normal stuff. For aspiring scavengers and stalwart captains");
		if(silly) output(" and aspiring indie bands");
		output("!”</i>");

		output("\n\nNow that’s a lot more useful to you!");

		output("\n\n<i>“My name’s Aurora, by the way! Feel free to just come in whenever. I sleep here! It’s comfortable.”</i> Yeah, cave-like indeed. <i>“Oh! But I don’t take anything, you have to go somewhere else to sell. Even if it’s good scrap and stuff! Or fruit. I’m not supposed to take fruit from strangers...”</i>");
		output("\n\nNow you’ve met Aurora, one of the techies of Novahome.");
		processTime(4);
	}
	//Tarkus boomed!
	else if(flags["TARKUS_DESTROYED"] != undefined)
	{
		approachAuroraPostTarkusBoom();
	}
	//After first time
	else
	{
		output("Staying put in your safe bastion, you wave down the kid-mechanistic from whatever she was doing and she’s all too happy to comply, running along the rafters to dangle in front of you with a bright, fangy smile; <i>“<b>Hello</b>!”</i>");
		output("\n\nFolding her wings and “hands” in what you can only describe as a business formal fashion, despite those thick, pushed up welding goggles and bits of grease and mechanical filth dotting her fur. Aurora cocks her head to the side, <i>“Whacha need?”</i>");
		processTime(1);
	}
	//menu hurr
	auroraBaseMenu();
}

public function auroraBaseMenu(disabledButton:int = -1):void
{
	clearMenu();
	if(disabledButton == 0) addDisabledButton(0,"Shop");
	else addButton(0,"Shop",shopAtAuroras,undefined,"Shop","See what the kid has for sale.");
	if(disabledButton == 1) addDisabledButton(1,"Talk");
	else addButton(1,"Talk",auroraTalkMenu,undefined,"Talk","Ask Aurora a few questions.");
	if(disabledButton == 2) addDisabledButton(2,"LookAround");
	else 
	{
		
		if(flags["TARKUS_DESTROYED"] != undefined) addDisabledButton(2,"LookAround","LookAround","Aurora’s shop is gone. Any hope you had of scoping out her cool gadgets is gone along with her workshop.");
		else addButton(2,"LookAround",lookAroundAurorasShop,undefined,"Look Around","Look around Aurora’s shop for anything interesting.");
	}
	if(pcHasJunkPrize()) addButton(3,"Sell Prize",tryToHawkRaskShitToAurora,undefined,"Sell Prize","Try to sell off the sweet loot you bought from the gang of raskvel males.");
	else addDisabledButton(3,"Sell Prize","Sell Prize","This merchant isn’t interested in whatever you’re considering to be a prize.");

	addButton(14,"Back",mainGameMenu);
}

//Talk
public function talkToAurora():void
{
	clearOutput();
	author("Magic Ted");
	auroraBust();
	output("Glancing behind her into the gloomy mess of her shop, you start to get a few curious thoughts. Just what is a child doing out here all on her lonesome, looking relatively unattended? Her wares might be pretty good stuff for what she has to work with out here, but what about her? This is hardly a healthy environment for much of anyone, let alone a displaced kid. Before you can actually go to speak, however, she does; <i>“What do you want to talk about, then?”</i> Aurora is quick to duck her head and glance to the side awkwardly afterwards, giving you a brief reprieve from the constant gaze of her golden eyes. <i>“Er, everyone gets all quiet and curious when they want to chat, so...”</i>");
	output("\n\nIt takes her a moment to wash away the self-brought anxiety while reassuring her that she was right and soon after she’s just as attentive as before - and staring yet again. Er.");
	output("\n\nJust what did you want to ask about?");
	processTime(1);
	auroraTalkMenu();
}

public function auroraTalkMenu(disabledButton:int = -1):void
{
	clearMenu();
	if(flags["TARKUS_DESTROYED"] == undefined)
	{
		if(disabledButton == 0) addDisabledButton(0,"About Her");
		else addButton(0,"About Her",askAuroraAboutHerself);
		if(disabledButton == 1) addDisabledButton(1,"About Work");
		else addButton(1,"About Work",askAuroraAboutWork);
		if(disabledButton == 2) addDisabledButton(2,"AboutRaskvel");
		else addButton(2,"AboutRaskvel",askAuroraAboutRaskvel);
		if(disabledButton == 3) addDisabledButton(3,"AboutSpecies");
		else addButton(3,"AboutSpecies",askAuroraAboutHerSpecies);
		if(disabledButton == 4) addDisabledButton(4,"AboutNovahome");
		else addButton(4,"AboutNovahome",askAuroraAboutNovahome);
		
	}
	else
	{
		if(disabledButton == 0) addDisabledButton(0,"HowAreYou?");
		else addButton(0,"HowAreYou?",howIsAuroraPostSplosion,undefined,"HowAreYou?","You could ask her how she’s doing - her life had quite the upheaval recently.");
		if(disabledButton == 1) addDisabledButton(1,"Survival");
		else addButton(1,"Survival",howdAuroraSurviveSplosions,undefined,"Survival","Aurora had a practically outdoors workshop and spent plenty of time flying around the planet - how’d she make it back?");
		if(disabledButton == 2) addDisabledButton(2,"Nova?");
		else addButton(2,"Nova?",whatHappenedToZeShip,undefined,"How’s this bucket doing? You don’t recall her being space-capable.");
		if(disabledButton == 3) addDisabledButton(3,"What Now?");
		else addButton(3,"What Now?",whatNowBrownCow,undefined,"What are you going to do now?");
	}
	addButton(14,"Back",approachAurora);
}

//About her
public function askAuroraAboutHerself():void
{
	clearOutput();
	author("Magic Ted");
	auroraBust();
	output("Asking about Aurora herself is a easy start....");
	output("\n\nYou go for the easy question and simply ask about <i>her</i>, interested in what such an out-of-place girl is doing somewhere like this.");
	output("\n\n<i>“Me, huh? Yeah, I get that a lot, too... Well!”</i> Aurora takes in a deep breath, puffing out her fuzzy cheeks rather adorably as she prepares for a routine response; <i>“I’m Aurora! I am a machinist and tinker stuff people bring in from the wastes and fix stuff and build new stuff out of broken stuff! I’ve been out here since I remember - but not here-here, we moved twice - and I don’t know who my parents are. I’m an orphan! The raskvel here take care of me and are pretty nice. B-Better than their own kids, actually...”</i> Distracting herself from the tangent, she deflates and starts to consider the thought in the back of her frenzied mind before perking back to attention. <i>“Oh! And I don’t know what I am and I don’t want to leave, especially to confederates! They just wanna </i>science<i> me...”</i>");
	output("\n\n<i>“Anything else?”</i> While she distracted herself by going off tangent, you get the feeling that this routine response is a pretty regular one. She even glossed over some of the mellow portion of her “backstory” without even a hint of remorse, something irregular for someone emotionally young.");
	output("\n\nStill trying to process the rush of information, you shake your head, satisfied.");
	//Talk menu minus about her
	processTime(2);
	auroraTalkMenu(0);
}

//About work
public function askAuroraAboutWork():void
{
	clearOutput();
	author("Magic Ted");
	auroraBust();
	output("You see a workshop, but what does she actually do around here?");
	output("<i>“What do I do here, huh? I fix stuff, durr. And make stuff! Usually I make new stuff out of broken stuff, really.”</i> Aurora muses, slowly starting to sway back and forth in a gesture that might almost be considered thoughtful for a bat, or simply idling childishly. After a moment of this silence, she excitedly extends her “hands” forward, where she was already clutching some mechanism that looked suspiciously like a plumbing valve. <i>“Like this thing! I don’t know what it was originally, but now I am making it to regulate an atomical engine board to help steady the wubs!”</i>");
	output("\n\n...The what?");
	output("\n\nJust as fast as she got excited, Aurora’s mood turns dim in response to your bewilderment. Swelling pride turns into craven embarrassment as she anxiously squirms, wiggling from the ceiling not unlike a worm. <i>“W-Well, I don’t know all the terms, okay! They’re in big books and reading is </i>hard<i>.”</i>");
	output("\n\nShaking your head, you try to shift the subject to what <i>else</i> she does then just operate a machine shop. By herself.");
	output("\n\n<i>“Oh, well. I do all kinds of stuff for the rask! Like... build stuff! They bring scrap and junk back that they can’t use or got frisked by the rusties, and I help them by making it work again! And usually other stuff, like making new stuff out of old stuff that works good! Ooh, like I got the lighting to work again from a doohickey! At least it usually works... I kinda preferred when it didn’t, though. Um. Oooh! Sometimes I carry people, too! Cuz they’re super light so I just pick them up by the shoulders or the ears or the legs or wherever really and go voosh! They usually start screaming, but it’s to help them! Like if they get stuck in sludge or a pit or a sludge pit! They’re just afraid of flying for some reason.”</i> As excitable as ever, Aurora is practically beaming with those out of place fangs on full display, bouncing in place like a yo-yo.");
	output("\n\nYou’re certain she makes her keep here and probably well beyond that, too. Someone like her really deserves better in life, but it also doesn’t seem like she wants to leave. You muse over the possibility for a moment until you’re brought back out of it by the girl’s ever present, soul-searching stares and decide not to leave the impatient kid waiting.");
	processTime(3);
	auroraTalkMenu(1);
}

//About Raskvel
public function askAuroraAboutRaskvel():void
{
	clearOutput();
	author("Magic Ted");
	auroraBust();
	output("It’s got to be weird being raised by Raskvel. What’s her opinion on her caretakers?");
	output("\n\n<i>“Huh? Them? Well, they’re nice enough. Some of them get weird and evasive around me but I think that’s cuz they get all fiddly and adult-y all the time and I’m not one! They’re pretty quick to grow up, but not me-eeee! It makes it kinda lonely. But I have scrap and stuff to make </i>all<i> the time so it’s cool!”</i> After she flails her arms around in emphasis, Aurora takes a bit more somber of a tone, <i>“Nah. They’re great. Sometimes I wish I were more at my supposed home, but they’re my family, and they love me, and I love them. Never had an issue!”</i>");
	output("\n\nIt’s nice to know that there is still good in the universe. Even if that good are tiny little things that hump every (adult, at least) thing that moves.");
	processTime(2);
	auroraTalkMenu(2);
}

//About species
public function askAuroraAboutHerSpecies():void
{
	clearOutput();
	author("Magic Ted");
	auroraBust();
	output("Just what is she, anyway?");
	output("\n\n<i>“<b>No idea</b>!”</i> Her rather boisterous start probably would have caught you off guard if you didn’t already know how loud she tended to get on the drop of a hat. <i>“No one knows! People keep asking and then they try to offer to take me away to somewhere nice but I know they really just wanna stick me in a lab and poke me with science forks and stuff to see how I work and why. And that’s lame! Nyeeeh!”</i> Childishly, Aurora sticks her pink little tongue out at you in playful rebellion. <i>“But no one knows what I’m supposed to be, or where I came from. Which sucks. I had a mom and dad and stuff, probably!”</i>");
	output("\n\nCurious, you bring up your codex to see if it has any information on her - and sure enough, you’re given an error message in short order. Not only is there no information, but she’s also too young to actually <i>generate</i> information on her. It’s all inconclusive, at least with your hardware.");
	output("\n\nBy the time you slip the device away again the mechanist is already blabbing again. <i>“I know I’m a vegetarian! Fruits are awesome and meat is lame, which is good cuz there really isn’t any out here. Bleh. But they don’t let me in hydroponics... and that I can kinda see in the dark and I have </i>really<i> good hearing like whoa and I can fly, durr, and stuff. And I like the dark, too, but light is </i>okay<i>. I guess.”</i>");

	//*** Silly modo:
	if(silly) output("\n\nYou’ve gathered in short order that yes, she is indeed some sort of alien Bat morph of some kind, with characteristics similar to a bat. A fruit bat, if you <i>really</i> wanted to be precise. But no one can just go out and say she’s a fruit bat alien for <i>reasons</i>. Also like, ten years old, so who cares?");
	//***Else modo:
	else output("\n\nNodding, you muse over the information idly, trying to make heads or tails of it. Sounds like whatever she is, she’s awfully similar to that of a bat in basic features. Which was pretty obvious by her appearance alone. Still, the information isn’t really useful to you.");
	//*** Merge modo!
	output("\n\n<i>“Oh hey! You’re one of those people all flying about space and exploring and planting flags on everything like you own it now, right? If you find folks like me, could you let me know about it or something? I mean... This is my home now and all that, but it’d be nice to know. Ya know?”</i>");
	output("\n\nYou can’t make any promises, but you’ll see what you can do");
	if(silly) output(", knowing that this isn’t actually a quest hook");
	output(".");
	processTime(4);
	auroraTalkMenu(3);
}

//About Novahome
public function askAuroraAboutNovahome():void
{
	clearOutput();
	author("Magic Ted");
	auroraBust();
	output("How about the place she calls home?");
	output("\n\n<i>“The </i>Nova<i>? Well, everyone here calls it the Novahome to be cute and stuff, but... well, it’s something. I’ve put a lot of work into this thing! I’m kinda the only one actually making progress most of the time. Those rusties made a mess of things; I only got the reactor working after people figured out this is a humie ship! There are a lot of parts about, but it’s best to match them up! A few cones of the engines are working now, too, so whenever we suddenly need to go nowhere fast with a bunch of fire we can!”</i> Er. <i>“Whenever this landed it was still working enough that it had a controlled fall, otherwise it woulda gotten all burnt up racing through atmosphere and lawndarted instead of skidding, or at least fell on its side. So all the damage is just on the bottom and even that’s pretty much nothing. They’re made for this sort of thing!”</i>");
	output("\n\n<i>“Most of the issues is actually software and stuff. Even the rusties went for bigger, non-important stuff, like doors and the smaller ones nibbled on pipes like candy bars. But the computers! I dunno anything about computers, but that Steele Tech lady sure does, so whenever I find one she always comes racing over, but always gets annoyed cuz it doesn’t work on the inside, I guess. Sometimes I follow her cuz the hallways are tall and people don’t notice me and she gets all fidgety like every noise is out to get her. It’s funny!”</i>");
	output("\n\n<i>“Please don’t stalk my employees.”</i>");
	output("\n\n<i>“Oh. Um. Well! Lately I’ve mostly been working in here cuz everything we need is </i>mostly<i> working. Still, I like it. It’s comfy and there are a bunch of holes in it, too, so I can just pop in and out real fast. Everyone else has to walk and they whiiiine about it. Heh.”</i> Smug bat.");
	output("\n\nWill she ever be space capable again?");
	output("\n\n<i>“<b>Nope</b>! The rusties ate through most of the important air pipes and, among other things, the reactor is all messed up and never really could put out enough! Even if you somehow replaced all that, though, the hull is brittle and torn with age and the whole crashing thing. Rusties, too, durr. I’m no rocket scientist, but I am pretty sure she’d just break in half from the weight if we tried tossing her up, full speed ahead. Nothing is really in good shape to cannibalize, either - space is a bad place! You want prime stuff out in space. A bunch of uppity people second guess me, though, and have this whole dream of taking the ‘home’ out of ‘Novahome’, but it won’t happen. Besides, then they’d need more than just me!”</i>");
	output("\n\nYou nod, curtly. By your gathering Aurora is pretty much the self-appointed chief engineer on this junk, if only because no one else has the skills for it. How <i>she</i> has the skills for it, though, is a mystery in of itself. Nonetheless, it sounds like she keeps her head out of other people’s affairs and just works on the ship, not having much to say for the various people in it. Which isn’t surprising coming from a kid.");
	processTime(3);
	auroraTalkMenu(4);
}

//====================
//POST SPLOSION TALKS!
//====================
//How are you?
//Tooltip: You could ask her how she’s doing - her life had quite the upheaval recently.
public function howIsAuroraPostSplosion():void
{
	clearOutput();
	author("Magic_Ted");
	showBust("AURORA");
	showName("\nAURORA");
	output("<i>“I’m good!”</i> Aurora’s response is pretty much immediate, almost sounding trained in its efficiency. After a quiet moment between the two of you, the girl sheepishly continues, swaying from her lamp. <i>“Um. I’m fine, really. I keep busy! There’s a lot of work to do and I’ve been using all the junk to make stuff work right! I got all the engines going earlier!”</i>");
	output("\n\nThat’s... great, but what about <i>her</i>?");
	output("\n\nThe girl’s childish energy becomes less pronounced, and she grows awkward, wiggling in place as she struggles to talk about herself. Or avoid it. <i>“I’m fine. Really! I just went from selling stuff to not selling stuff... doing the same thing either way!”</i>");
	output("\n\nIt’s pretty obvious she doesn’t want to go into any more detail about it and you’re in no position to press it. She probably lost people just like everyone else.");
	processTime(4);
	auroraTalkMenu(0);
}

//How’d you make it?
//Tooltip; Aurora had a practically outdoors workshop and spent plenty of time flying around the planet - how’d she make it back?
public function howdAuroraSurviveSplosions():void
{
	clearOutput();
	author("Magic_Ted");
	showBust("AURORA");
	showName("\nAURORA");
	output("<i>”What, you doubted me?”</i> Right from the onset you knew Aurora was going to be pretty smug and prideful about this. The girl adopts a cheeky grin as she puffs her chest out. <i>“Of course I got back! I’m clever and stuff! When the planet started shaking and crumbling I was outside with a few spare parts from a wrecked converter. I knew something was off cuz the wind was getting all weird and the junk felt way lighter so I darted home!”</i> Every so often Aurora pauses for a few seconds, trying to remember just how it went down. Or perhaps she’s making some stuff up here and there to embellish it. She is, like, twelve. That should be a given.");
	output("\n\n<i>“The sky got weird by the time I got back and the air was thin, like I was </i>wa-aaay<i> up. So I figured something had happened to the artificial tether and we were all doomed! So I hopped in the mini-pod that no one wanted and hid! I was scared. Then everything started getting sucked out of the workshop and the pod got flung out and was spinning around. Everything was terrible!”</i>");
	output("\n\n<i>”But the pod had fuel in it and worked, just like I said! So I got it turned on-”</i> Aurora’s intrepid retelling becomes a bit muted as she mumbles something about ‘eventually’, though like any good storytelling bard, her aside is brief, leaving her to continue boasting. <i>“- and I flew to the </i>Novahome<i>! I even caught someone - she’s fine - and I crashed into one of the bays before the doors got shut.”</i>");
	output("\n\nYou blink. That’s a bit dramatic. Actually, why didn’t she just run into the <i>Novahome</i> when she had the chance instead of hiding in the pod?");
	output("\n\n<i>“<b>Cuz</b>! It’s a piece of junk!”</i>");
	output("\n\nOh. That’s fair.");
	processTime(7);
	auroraTalkMenu(1);
}

//What happened to the ship?
//Tooltip: How’s this bucket doing? You don’t recall her being space-capable.
public function whatHappenedToZeShip():void
{
	clearOutput();
	author("Magic_Ted");
	showBust("AURORA");
	showName("\nAURORA");
	output("<i>“<b>She wasn’t</b>! But we fixed her up really quick. </i>Really<i> quick.”</i>");
	output("\n\nYou can imagine! Still, you’re curious about the details.");
	output("\n\n<i>“Well, bunch of us played a part. When the world started shaking and cracking everyone started freaking out.”</i>");
	//When rusties get </i>really<i> terrified it turns out they throw up! So they chucked up all that metal they were eating below deck, reinforcing the cheeseholes and conveniently sealing it off! It’s still not safe to go down there, but it doesn’t bow under pressure now.”</i>
	//Mildly disgusting. 
	output("\n\n<i>“The raskvel work pretty fast, too! They always do. Everything got welded off and sealed up right by the time I got back in again! Little gremlins, I swear. The meteorite shields kept all the debris from doing any more damage, too, but we didn’t have any air-systems. So we worked on it! That scared-y dog-lady with the guns apparently had a bunch of blueprints about the ship on her and she shoved it on us when she was done screaming! Then she went back to screaming. I gave a bunch of the readouts she found to Colesno cuz he knows computers and stuff. I knew he’d do it, even if we never see each other - cuz he’s short, durr. He and Shekka got the power generator working and we found a bunch of backup life-support systems! So we have air and it’s warm and stuff! Comfier than before, even!”</i>");
	output("\n\n<i>“With all that important stuff done we hooked up the engines and thrusters properly and established a safe orbit! Still collecting junk floating around, too. She can’t really go fast and I don’t really feel safe with her being in space to begin with, but the </i>Novahome<i> is cruising just fine!”</i>");
	output("\n\nYou’re rather surprised by their collective ingenuity and you find yourself happy for them. At least they can take care of themselves.");
	processTime(6);
	auroraTalkMenu(2);
}

//What now?
//Tooltip: What are you going to do now?
public function whatNowBrownCow():void
{
	clearOutput();
	author("Magic_Ted");
	showBust("AURORA");
	showName("\nAURORA");
	output("<i>”Uh... I dunno.”</i> Surprised that she doesn’t have her usual gusto, you wait for the girl to collect her thoughts on the subject. <i>“I don’t think this can last very long... They need a planet. And sun! And I wanna stretch my wings!”</i> Naturally, she does just that, threatening to clothesline a pair of unsuspecting patrons who are just tall enough to be in the way.");
	output("\n\n<i>“But my family is here! Even if some of them are gone now... so until they go, Imma stay! I don’t have anywhere else to go, after all!”</i> While her reservations about the idea are obvious in her tone, she seems pretty dedicated to it nonetheless.");
	output("\n\nYou briefly muse over what could be done with the girl. She doesn’t have any real family beyond the community, but you figure they still take care of her just fine. She’s growing up, too. The thought of offering to take her under your wing - partly as a employee of Steele Tech, with all the junk she could ever want or even working aboard your ship - crosses your mind, but you squash the thought just as quickly. You don’t want a emotional then-teen to learn of your grisly involvement and have some kid mad-scientist after you. Besides, she said it herself; she didn’t want to leave.");
	output("\n\nYou sigh. Maybe after this company-chasing business is actually over with you could do something about these people. Until then, though, you have an adventure to finish.");
	output("\n\nMaybe with less fuckups.");
	output("\n\nYou break out of your reverie with Aurora’s golden eyes staring you down, impatiently swaying side to side as she waits for you to snap to again.");
	processTime(6);
	auroraTalkMenu(3);
}

//Look around
// Basically a catch all for one off MAD SCIENCE! jokes and such that the PC couldn’t rightfully fit in their pocket. Like a howitzer. Or a death ray laser gun that is simply way to illegal and prone to murderous explosions. Or a pocket watch.
public function lookAroundAurorasShop():void
{
	clearOutput();
	author("Magic Ted");
	auroraBust();
	output("You glance around the gloomily lit shop, cat-like curiosity starting to mount towards silhouettes that you can barely make out of the shadows. Aurora isn’t selling everything here, of course, or at least not offering them to you. You can’t help but wonder-");
	output("\n\n<i>“<b>Curious</b>?!”</i> - Oh geez your ears - <i>“I’ve got lots of stuff lying around! Some of it works! Some. Little bit. Ten of them work as intended, too, which is great! But those usually get shipped out cuz I sell them or put them somewhere for the rask and stuff. But I like talking about my work! A lot of people are scared to come in here, thinking they might get hurt or irradiated or explode. But they won’t! Probably.”</i> Giddy at the possibility of showing off, Aurora clasps her fingers together and bounces enough that you’re actually worried she’ll lose her grip on the rafters. <i>“Feel free to point anything out, alright?”</i>");
	output("\n\nPut on the spot, you start to scan over the subtle shapes for anything that catches your eye....");
	processTime(2);
	lookAroundShopMenu();

}

public function lookAroundShopMenu(disabledButton:int = -1):void
{
	clearMenu();
	if(disabledButton == 0) addDisabledButton(0,"Raygun");
	else addButton(0,"Raygun",aurorasRayGunThing);
	if(disabledButton == 1) addDisabledButton(1,"Cannon");
	else addButton(1,"Cannon",aurorasCannonThing);
	if(disabledButton == 2) addDisabledButton(2,"Pocketwatch");
	else addButton(2,"Pocketwatch",aurorasPocketWatchThing);
	if(disabledButton == 3) addDisabledButton(3,"Aircraft");
	else addButton(3,"Aircraft",aurorasAircraftThing);
	if(disabledButton == 4) addDisabledButton(4,"Cylinder");
	else addButton(4,"Cylinder",aurorasGlowingCylinder);
	addButton(14,"Back",approachAurora);
}

//Ray gun looking thing
public function aurorasRayGunThing():void
{
	clearOutput();
	author("Magic Ted");
	auroraBust();
	output("What’s that thing that looks suspiciously like a cartoon handheld ray gun hanging there?");
	output("\n\nWith your vague prompting Aurora quickly scampers over to one of the racks where a host of various knick knacks and half built devices and scrap hang. The only one that stands out is the rather colorful thing dangling by its hilt, which looks very much like some “alien raygun” that you’d find little green men waving around in cartoons and other fanciful things. It looks like a toy, which wouldn’t really be out of place in Aurora’s repertoire if she didn’t seem a little above that sort of thing. At least you could tease her about it.");
	output("\n\n<i>“This? It’s my ray gun!”</i> Chirps the bat, holding the maybe-toy with remarkable trigger discipline for a youth. <i>“Someone found it and brought it to me! But it was empty and just had a speaker in it for some reason, so I fixed it! Now it works properly!”</i>");
	output("\n\nA sickening knot starts to form in your stomach as nosiness gets the best of you, feeling endangered despite her childish smile. <i>“How so?”</i>");
	output("\n\nImmediately, you regret asking as she swings her arm out to the side and brandishes the “weapon” in full, pointing the brightly colored object towards the open rift in the ship’s hull that then leads outside. Suddenly your senses go dizzy, body quaking and simultaneously clamming up like you’re about to puke, and it isn’t until the effect subsides a brief few seconds later that you’re able to gather what just happened. The weapon must have fired a brilliant emerald beam of some sort as wisps still linger in the path. The actual damage the weapon made is all too clear outside, where a big pile of useless, rusty scrap metal now has a molten hole the size of a doorway, still caving in on itself from gravity.");
	output("\n\nNaturally, Aurora herself didn’t seem phased by her “little” blaster whatsoever and was once again oblivious, giddily smiling towards you even as you recollect yourself, ears still ringing. <i>“See! I’m not quite sure how it worked before, so I just used whatever I could get to fit. It took a while! But now it can fire forever and it’s pretty great! It still has some issues, and I kinda like it so it’s not on sale. Sorry if you were interested!”</i>");
	output("\n\nThis girl will be a terror on the galaxy when she grows up...");
	processTime(2);
	lookAroundShopMenu(0);
}

//Cannon looking thing
public function aurorasCannonThing():void
{
	clearOutput();
	author("Magic Ted");
	auroraBust();
	output("There’s a thing over there that looks a awful lot like a old cannon....");
	output("\n\nThis is like a treasure hunt in a mad scientist’s lair! One shape in particular literally peeks out from the heaps of misused wreckage and assorted paraphernalia at a relatively shallow angle, betraying its rather noticeable size, almost like... A cannon?");
	output("\n\n<i>“A howitzer, actually! C’mon, even I know that!”</i> Comes the rapid, if teasing, reply for a question you hadn’t even realized you said out loud. <i>“But it’s too ruined to work too well, and you’d need like, shells and stuff to do all the </i>actual<i> work. So I fiddled with it some! I use it as a trash bin now!”</i> Sensible recycling? <i>“Uh huh! When I find something just too ruined or I mess up too bad I just toss it down the barrel and then when something is about to explode I toss it in the pan and it goes out the hole in the wall!”</i> This sounds both terrifying and exceedingly dangerous, as well as simply counterproductive. Why not just toss it outside to begin with? <i>“It’s fine! It’s never failed and I’ve been doing it for a month! Besides, tossing it is a hassle and can scratch the paint whenever someone gets around to prettying up the hull. Gotta make a routine! Besides, I don’t want those rusties below sniffing around and figuring out I got all this quality junk! Keeping it hidden, quiet.”</i> ...O-oookay.");
	processTime(2);
	lookAroundShopMenu(1);
}

//Pocketwatch looking thing
public function aurorasPocketWatchThing():void
{
	clearOutput();
	author("Magic Ted");
	auroraBust();
	output("Something just hanging on the wall there... It looks like a antique pocket watch.");
	output("\n\nIn a fit of amusement, you point out a golden clasp dangling by an equally golden chain on one of the racks of the room, the slight shine making it stand out among the gray and deprecated things hanging beside it. <i>“What’s that?”</i>");
	output("\n\n<i>“A pocket watch!”</i>");
	output("\n\nOh. Well then-");
	output("\n\n<i>“It’s not for sale, though! I use it to regulate voltage when I’m working.”</i> Aurora continues, cutting you off and completely ignoring your now newly founded bewilderment. While you wait, subtly giving her time to explain in further detail, she doesn’t take the hint, evidently finished speaking on the topic.");
	processTime(2);
	lookAroundShopMenu(2);
}
//That aircraft
public function aurorasAircraftThing():void
{
	clearOutput();
	author("Magic Ted");
	auroraBust();
	output("It’s hard to be certain with the sheer amount of stuff layered between you and it, but that’s definitely a cockpit attached to a miniature aerodynamic frame you see crammed in one corner.");
	output("\n\nIt takes you far longer than it really should for you to notice the vehicle settled in the corner of the room, rather cleaned up without any wayward items piled on top of it. The fact that it’s so well presented actually has your eyes sliding off it when you’re looking for something catching! Still, you can’t exactly make out the details past that it’s relatively narrow, smooth with a faux-glass looking cockpit that you yourself just might be able to cram into.");
	output("\n\n<i>“That’s a minipod! It even works, too! But there isn’t a lot of fuel for it, so I just keep it lying around here. Everyone else is too scared to try to fly it! I dunno why, but then again the raskvel always panic when I pick them up and take them somewhere!”</i> Nodding rapidly, the oblivious Aurora is all smiles before continuing. <i>“Besides, I can just fly anyway! And probably faster!”</i> The bat shifts, moving her wings from the visage of a noble cape to instead outstretching them in either direction. It’s a rather impressive wingspan, barely able to fit in the junk-less bastion of the room you both are in! She flaps them twice as part of her stretch and bellows cool air over you before slowly retracting them, balling them to her sides again.");
	output("\n\n<i>“Interested in buying it?”</i> The question comes as a bit of a surprise given the device didn’t appear like it was on sale, but nonetheless you mull the offer in your head. You don’t know if the minipod is compatible for <i>you</i>, let alone your ship. You could get a professional and <i>safer</i> model from any sort of dealer in a more Core-oriented system, anyway. Looking a lot less retro, too. You diplomatically decline even if you’re not sure you could ever actually get a frown out of her.");
	output("\n\n<i>“O-ooookay!”</i>");
	processTime(2);
	lookAroundShopMenu(3);
}

//Glowing cylinder
public function aurorasGlowingCylinder():void
{
	clearOutput();
	author("Magic Ted");
	auroraBust();
	output("You can’t feel too safe with something over in the corner giving off a yellowish glow, especially in such a ramshackle hole-in-the-wall place as this.");
	output("\n\nIt’s difficult to make out through the other sources of more natural light in the room, but off in the corner, around piles of other junk obstructing the way, there is a squat looking cylindrical device, the panels of which give off an industrial, yellowish glow. The light looks similar to some ornate lamp or an insect trap, and seeing it in such a run down and <i>dangerous</i> sort of workshop like this, made you suspicious and on edge. Just what was that...?");
	output("\n\n<i>“It’s a power generator! Durr, what else glows like that and looks all generator-y? I use it so I don’t make a short on the </i>Nova<i>’s power supply! It’s pretty, uh, janky. Both of ‘em... and quit looking at it like that, it won’t explode or something! Hmph.”</i> It looks like she caught your skeptical look. Nonetheless all it takes is a sheepish little grin to temper her again. <i>“Besides, it’s not even on!”</i>");
	output("\n\n<i>“... Why is it glowing then?”</i>");
	output("\n\n<i>“<b>No idea</b>!”</i>");
	output("\n\nNow you’re unsure whether or not Aurora is trying to fuck with you despite that big, fangy cheshire smile growing over her face. It’s hard to read someone when they’re upside down. Either way, she didn’t appear too worried about it, and she was the one who had every right to be, so you decide not to press the topic any further.");
	processTime(4);
	lookAroundShopMenu(4);
}

//Shop
// This is all an outright copy of how Carl’s shop works, minus the quest. Base screen, item layout with tooltips, character chatter, purchase button. Maybe the tooltip could be placed in the chatter portion instead of before, but that’s pedantic stuff. Prices and actual stats are up to you, of course, Fenoxo. As always we pretend we care about vague game balance and have a mind for it. :3
public function shopAtAuroras():void
{
	clearOutput();
	author("Magic Ted");
	auroraBust();
	if(flags["TARKUS_DESTROYED"] != undefined)
	{
		output("You realize how dumb that question is as Aurora just stares at you for a long moment, not even wiggling around to keep lively. Once she feels like you’ve felt an appropriate amount of shame - that is, after two seconds - she speaks in a deadpan tone; <i>“Sell what, exactly? I don’t exactly have a supply anymore. Everything I get is for the </i>Novahome<i> now, weirdo.”</i>");
		output("\n\nYou apologize quickly, and she goes back to her regular high spirits in no time.");
		processTime(1);
		auroraBaseMenu(0);
		return;
	}
	output("Upon announcing your interest in her purchasable wares you practically have to avert your eyes from the ensuing adorable giddiness. Those golden eyes sparkle ");
	if(silly) output("with the glow of <i>capitalism</i> ");
	output("as her idle smile turned into a downright fangy beam, bouncing in place. <i>“Good! I like getting money! It pays for things.”</i>");
	output("\n\nIn short order, she silently takes you off to the side where a simple whiteboard hangs on the wall. She swings it rightside up so you can read it, and you look over the chicken-scratch writing Aurora has provided. It reads off like a menu at a restaurant: a bunch of names and titles with little context provided for you to pick from as well as helpful prices - in credits, naturally.");
	output("\n\nAurora looks “down” to you expectantly all the while, of course.");
	processTime(1);
	clearMenu();
	addAuroraItemButton(0, new RocketHammer());
	addAuroraItemButton(1, new Electrogun());
	//addAuroraItemButton(2, new ChoppyThing());
	addAuroraItemButton(3, new ProtectiveJacket());
	addAuroraItemButton(4, new TrashArmor());
	addAuroraItemButton(5, new AimEyepiece());
	addButton(14,"Back",auroraBaseMenu);
}
public function addAuroraItemButton(btnSlot:int, item:ItemSlotClass):void
{
	var tooltip:String = "Take a closer look at this item.";
	switch(item.longName)
	{
		case "rocket hammer": tooltip = "Ask Aurora about her rocket hammer."; break;
		case "electrogun": tooltip = "Ask Aurora about her electrogun. You suppose it’s an electricity based weapon, given the name."; break;
		case "choppy thing": tooltip = "Ask Aurora about the weird  “Choppy Thing.”"; break;
		case "protective jacket": tooltip = "Ask Aurora about a jacket with protective qualities."; break;
		case "ancient space suit": tooltip = "Ask Aurora about something called “Trash Armor.”"; break;
		case "aim-assisting eyepiece": tooltip = "Ask Aurora about her aim-assisting eyepiece."; break;
	}
	addButton(btnSlot, item.shortName, auroraBuyTalk, item, StringUtil.toDisplayCase(item.longName), tooltip);
}
public function getAuroraPrice(item:ItemSlotClass):Number {
	return Math.round(item.basePrice);
}

public function auroraBuyTalk(item:ItemSlotClass):void
{
	clearOutput();
	author("Magic Ted");
	auroraBust();
	
	switch(item.longName)
	{
		//Rocket Hammer
		case "rocket hammer":
			output("<i>“Oooh, I know right? A name like that just attracts everyone’s attention, huh? I’m proud of it! It’s simple, just a hammer with a rocket attached to it!”</i> Before your imagination can so much as start to whirr Aurora waddles down the rafter and around a rack out of view, coming back with the weapon clutched over her head and nearly touching the ground rather haphazardly.");
			output("\n\n<i>“You hit stuff with it! Durr. It’s too big for anyone here to really use, and I have to admit, it doesn’t work all the time. The ignitor just doesn’t kick! Cuz it gets messed around when you hit stuff with it, probably. Design flaw! But sometimes it does!”</i> Ready to prove it, Aurora slips her clawed feet around one of the nearby dangling lamps, gripping into the metallic shade as she starts to swing the hammer back and forth like a dangerous pendulum. Already, you feel <i>entirely</i> unsafe and you barely recognize that she starts talking again, too focused on potentially avoiding something.");
			output("\n\n<i>“Just press this button in the shaft to activate it! Doesn’t need any fuel or anything, it just takes off! Like... This! This! Hm. This? Thisthisthis-”</i> You want to put a stop to it before she hurts herself or ");
			if(pc.isAss()) output("more importantly, ");
			output("you, but your voice of concern is cut off when it actually <i>does</i> work as intended, to mutual surprise. With a shrill shriek, the accelerant inside comes to life and some sort of flame comes roaring out, sending the poor bat spinning circles on a lamp-based rodeo and endangering anyone’s head at the wrong sort of height - like yours.");
			output("\n\nYou hit the deck before that can happen, and the little show comes to an end in short order, giving you a brief moment to gain your composure as Aurora fights to keep the room from spinning, for her, anyway. <i>“Eh... That was fun. Ah! See! Works perfectly. Sometimes. Want it?”</i>");
			processTime(3);
			// It should be weaker than a actual sledgehammer item, like the one in, say, Molar’s shop, but should have a higher crit chance and higher crit damage. Whether or not it also needs a strength score is up to you boss, but it’s supposed to be relatively lighter - hence the less damage.
			break;
		//Electrogun
		case "electrogun":
			output("<i>“It’s weird! People tend to buy these little things the most out of the usual selection, I dunno why. They’re pretty lame. The raskvel especially love ‘em, cuz they use zappy stuff to ruin people’s personal shields! Then they can hit ‘em with a stick and run with their wallet. Allegedly.”</i>");
			output("\n\nYou watch as Aurora scampers over to the side, taking something off one of the nearby shelves and bringing it back to you for presentation. It looks like a fairly routine, if cheap laser pistol, clad in a dull brown plastic-like casing with the usual pistol appearance. However, instead of a flashy barrel to give it the appearance of a snazzy laser, it’s largely smashed open with metal prongs sticking out every which way as if it had recently exploded.");
			output("\n\nWhich, given the sort of shop you are in, isn’t all that farfetched.");
			output("\n\n<i>“I just changed the emitter so it shoots a electrical charge, mostly forward! It’ll spread out some so it messes with shields and gives people the shakes! But... it kinda runs out of batteries pretty fast, cuz it’s not designed to run so inefficiently. And if you wanna actually... ya know, end something with it, you’re going to be at it for a while...”</i>");
			output("\n\n<i>“So, er, want it?”</i>");
			processTime(2);
			// Bzzt! Should be straightforward, comparable damage to Carl’s guns but uses a anti-shield damage type or something.
			break;
		//Choppy-thing
		case "choppy thing":
			// Tooltip: The mad amalgamation of a variety of ruined, modern day bladed weapons. They’re all fused together in some form of a unwieldy, entirely destructive weapon. The vibrations make your hand go numb when it’s on, though. And no, it wouldn’t be a good idea to use it as a sex aid.
			output("The first entry on the list that you actually have to ask about for context and, it turns out, you really wish you hadn’t. Aurora awkwardly hefts up a extremely unbalanced looking war-axe, the unnecessarily over-sized head of which was made by awkwardly fusing a host of other weapons to it, all merging on a thick, sharpened point. It’s easy to see that many of these “borrowed” weapons are augmented in some way and not merely sharpened bits of metal by the utter mess of wires coiled around the hilt. Various miniature power sources carved into the stalk provide the power. There must be three different thermal and two vibro blades alone!");
			output("\n\n<i>“Find lots of stuff out there, from </i>old<i> stuff to more recent stuff when those weirdo nanomachines or rusties get to adventurers like you and mess with ‘em! I’m not some weirdo with a beard, so I can’t just remake them either... so sometimes I put them together! This one didn’t explode!”</i> It’s pretty telling that she ends her sales pitch with that, but looking at the beautiful, vulgar mess being presented, that’s a pretty important bullet point.");
			output("\n\nBrandishing the weapon and turning it on by a button at the hilt, Aurora barely keeps the now growling, shaking weapon steady in her claws. It vibrates aggressively, little shocks of electricity racing across the miniscule parts in the blades as hissing steam intermixes with it, a mixture of vibro, shocking and heat weaponry coming together among potential others. It looks rather unstable, though despite that the shopkeep doesn’t seem too worried - even as her arm quakes, causing the leather of her lengthy wings to buzz like a softly tapped drum. Besides, the fact that it works at all is rather inspiring to begin with.");
			output("\n\n<i>“So! Interested?”</i>");
			// oh jesus I don’t even know
			processTime(2);
			break;
		//Protective Jacket
		case "protective jacket":
			output("Admittedly, you’re rather surprised about this entry in particular on the listing. Some sort of fashion was a stark departure from the variety of weapons and assorted gizmos in the shop, sparking your suspicions. Still, you aren’t particularly surprised when Aurora comes back with it, the heavy object dangling from her arms. Brown in color, it looks like it was picked up somewhere in the scrap heaps of the planet and then brought back just like everything else lying around, the coat looking worn and stretched with age, use and, more importantly, misuse. It’s bigger than she is, which makes her awkward attempts to bring it over all the more amusing. However, last you checked you’re not some kid, and eyeballing it, you see that it could fit on you pretty well. Yet... why is it jingling?");
			output("\n\n<i>“It’s a jacket!”</i>");
			output("\n\nYes, thank you.");
			output("\n\n<i>“It’s got tons of shaved down and repurposed little bits of metal inside it, like some sorta chain shirt! Or scales! It’ll protect you from hits and make you look good doing it!”</i> Admittedly, it’s pretty ");
			if(!silly) output("good looking");
			else output("swank");
			output(". <i>“It’s nothing special or advanced, but it’s certainly a step up from regular clothing. These things sell like hot cakes, and this one doesn’t even have any holes in it to cut you or anything! Want it?”</i>");
			// Minor armor, minor bonus to sexiness. Because SWANK. Should basically be the safe upgrade from comfortable clothes. I guess if Shekka sells elemental resists, it’d be the TS-T armor that Anno sells for tease-y people.
			processTime(2);
			break;
		//Trash Armor
		case "ancient space suit":
			output("Instead of bringing it to you, this time Aurora tugs at your hand and brings you along into the dark recesses of the shop, guiding you around piles of junk or at the very most relatively shallow ones that you can navigate through without much fear of tripping and catastrophic doom. Shortly after you round one of the lengthy shelves, you understand why. There’s no way Aurora could bring this thing out herself!");
			output("\n\nPropped up on an unseen stand or mannequin, you could have easily mistaken this “armor” for a vending machine or a rather bulky trash can. The dull gray metal resembles a humanoid shape, the limbs looking surprisingly mobile for all its blockiness from the crude-looking metallic slabs. Still, despite the recycled materials, it looks immaculately crafted, not so much of a single weld line visible as if the armor itself was molded this way. Aurora had every right to be beaming proudly beside it as she presented it, despite being the one who named it.");
			output("\n\n<i>“It’s a metal suit! You just wiggle on in it, and you’re protected from just about everything! ...Well, maybe a thousand years ago, but you’re still pretty well off! The joints move just fine, but it’s really heavy! You can’t really go anywhere fast, and you’re probably going to fall over a bunch, and it’s going to be pretty bad on your back, but... It works! And it’s padded inside, too, so it’s pretty comfortable! Sorta. Kinda. It’s not all metal!”</i>");
			output("\n\nIt’s pretty ghetto, but you’re not exactly in a primetime weapons dealer, either. It’s big enough that no raskvel could fit in it, certainly, and Aurora doesn’t really even have arms - no one in the Novahome had any hope of using it, just “upstart adventurers” like you. It looks like it had a surprising amount of effort put into it, you certainly aren’t getting ripped off with it.");
			output("\n\nAurora’s eyes silently ask a question as they stare down to you; want it?");
			// Ha ha haaa. Reflex and sexiness penalty, high defense. Maybe fortifaction?! Whatever that stat is. Probably should have a straight malus for your dexterous stats, as opposed to a cap. Painful on the wallet, though.;
			processTime(3);
			break;
		//Aim assist eyepiece
		case "aim-assisting eyepiece":
			//A squat little thing, placed on your eye like half of a pair of glasses. It operates as a targeting assist, hooking up with the muzzle of a ranged weapon and giving you some flexibility of being able to aim without glaring down the sight of the weapon. The lack of depth perception means it’s only useful shooting across your living room, however.
			output("<i>“It’s an accessory!”</i> Aurora chirps rather immediately, swinging herself to the side to reach for the nearby device. It’s pretty small and easily fits in her small “hand”, most of the mass being a faux-glass display and then some sort of clip on. There isn’t a lot to see, nor do you expect Aurora had a lot of hand in this one. <i>“You place it by your eyes and hook it up to a pistol or something! Then it says where you’re aiming stuff! I used it on a screwdriver once and it got </i>really<i> confused.”</i> Nodding, you muse it over. The lack of depth perception means it wouldn’t be helpful very far, but at the very least you wouldn’t have to constantly aim down the sights of your weapon to get an accurate shot. Good for a scuffle.");
			output("\n\n<i>“Want it? It’s cheeeap.”</i>");
			// It is indeed cheap! Gives +1 aim. Maybe +2.*/
			processTime(1);
			break;
	}
	
	clearMenu();
	if(pc.credits >= getAuroraPrice(item)) addOverrideItemButton(0, item, "Buy", buyFromAurora, item);
	else addDisabledButton(0, "Buy", "Buy", "You cannot afford the " + getAuroraPrice(item) + " credits for this item.");
	addButton(14, "Back", shopAtAuroras);
}

public function buyFromAurora(item:ItemSlotClass):void {
	clearOutput();
	output("You purchase " + item.description + " for " + getAuroraPrice(item) + " credits.");
	pc.credits -= getAuroraPrice(item);
	
	itemScreen = shopAtAuroras;
	lootScreen = shopAtAuroras;
	useItemFunction = shopAtAuroras;
	
	output("\n\n");
	itemCollect([item]);
}

