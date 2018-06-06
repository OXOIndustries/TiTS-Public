/* Mewmazons galore
 * this spaghetti by master pasta chef lighterfluid
 * 
 * flogs:
 *  SHIZZY_TRAP_ENCOUNTERED
 *   -ammount of times you've seen shizzyspezzodysseyencounter()
 *  SHIZZY_YAMMI_AT_TRAP
 *   -1 if yammi was there when player met shizzy
 *  SHIZZY_MET
 *   - 1 if pc investigated the trap
 *  SHIZZY_CUNT_SNAKE_RECIPE
 *   - 1 if player tried the fried snake, 0 if they chickened out
 *  SHIZZY_ANNO_MENTIONED_AKKADI
 *   - had anno's follower talk about akkadi
 *  SHIZZY_NOMMED_MIKA
 *   - did u breathed when meeting her?
*/

public function shizzyTimezone():int
{
	if (hours < 4) return 3;
	else if (hours < 12) return 1;
	else if (hours < 20) return 2;
	else return 3;
}

public function shizzyTrapAvailable():Boolean
{
	return flags["SHIZZY_MET"] == undefined && flags["STELLAR_TETHER_CLOSED"] != undefined && (flags["SHIZZY_TRAP_ENCOUNTERED"] == undefined || flags["SHIZZY_TRAP_ENCOUNTERED"] <= 4);
}

public function showShizuya(nekkid:Boolean=false, showauthor:Boolean=true):void
{
	if (showauthor) author("QuestyRobo");
	
	showName("\nSHIZUYA");
	//showBust("SHIZUYA" + (nekkid ? "_NUDE" + ""));
}

public function showMika(lood:Boolean = false):void
{
	showName("\nMIKA");
	showBust((lood ? "MIKA_NUDE" : "MIKA"));
}

/*
 * Yammi stuf
*/

public function shizzyCuntRecipeGet():void
{
	clearMenu();
	clearOutput();
	yammiFollowerDisplay();
	author("QuestyRobo");
	
	output("You see Yammi standing in front of the oven, mulling over something. You walk up and look over her shoulder, seeing a line of long, fried foods, covered and stuffed with fruit.");
	output("\n\n<i>\"Oh, hey boss, I was just wondering what I should do with these.\"\n\n\"What are they?\"</i>");
	output("\n\n<i>\"Cunt snakes. You've been to Mhen'ga a good bit, so you've probably seen them. Apparently some people... eat them, without the 'bits' of course.");
	if (flags["SHIZZY_YAMMI_AT_TRAP"] == 1) output(" Adelline told me it's kind of a thing that some of the more eccentric vanae do, and apparently it's actually pretty good, so she gave me the recipe...");
	else output(" I was out getting ingredients and I met this... big woman who said she knew you. We talked for a bit, and when I mentioned that I cooked for you, she gave me this recipe.");
	output(" I can get them from the same guys I get the Ginder Fish from, so it's not hard to come by.\"</i>");
	output("\n\n<i>\"Sounds... odd.\"\n\n\"Yeah, kinda. I mean, it sounds good, it's seasoned well, it smells great, but it is a bit weird.\"\n\n\"Have you tried it?\"\n\n\"Yeah, it's good, but I'm not sure if you'd like it enough for me to really commit too much to it.\"</i>");
	output("\n\nDo you want to try it?");

	addButton(0, "Yes", shizzyStillInADream, undefined, "Yes", "Give it a go.");
	addButton(1, "No", shizzyCuntSnakesAreFriendsNotFood, undefined, "No", "No thanks. <i>She probably won't be serving this if you don't try it.</i>");
}

public function shizzyStillInADream():void
{
	clearOutput();
	yammiFollowerDisplay();
	author("QuestyRobo");
	
	output("You pick up a knife and fork and start to cut off a piece. There's a flakey, satisfying crunch as you carve through the fried skin. It's not tough or dry. In fact, despite the crunch, it's very easy to get through. The flesh is tender, almost like cutting through a layer of butter, and there's a nice, juicy squelch when you cut through the fruit in the middle. You pick up the small piece that you've cut for yourself, making sure to keep it over the plate so that the copious juices don't drip all over the floor.");
	output("\n\nShe wasn't kidding when she said it smelled good. It's very sweet, but not overwhelmingly so, and with an undertone of what smells like roasted pork. You bite into it, finding it almost candy-like in sweetness at first, then you get into the meat. It's an explosion of savoriness; for as little meat as there is, it feels like you just chewed a thick, over-seasoned steak. Somehow, though, the sweetness of the fruit and sweet crust manage to balance it out perfectly.");
	output("\n\nThe softness and the balance of sweetness and savoriness makes it seem more like a dessert than a main course, and it's pretty easy to forget exactly what it is.");
	output("\n\n<i>\"So, are we putting this on the menu?\"\n\n\"I'd say so.\"</i>");
	output("\n\n<i>\"Great! Just a heads up, these come with the aphrodisiac venom separate, so if you want that extra kick, just ask.\"</i> You nod, realizing that you've been eating without thinking, and the plate is empty, save a few crumbs and splatters of juice.");
	output("\n\nYammi chuckles. <i>\"Alright, boss, anything else?\"</i>");
	output("\n\n<b>Yammi will now cook Fried and Stuffed Cunt Snake</b>");
	
	processTime(30);
	
	flags["SHIZZY_CUNT_SNAKE_RECIPE"] = 1;
	
	yammiFollowerMenu();
}

public function shizzyCuntSnakesAreFriendsNotFood():void
{
	clearOutput();
	yammiFollowerDisplay();
	author("QuestyRobo");
	
	output("<i>\"No, that's weird.\"</i>\n\nYammi sighs. <i>\"Oh well, not everything is going to work out.\"</i> She takes the plate and scrapes the food off into the garbage. <i>\"Anyway, boss, did you want anything else?\"</i>");

	processTime(1);
	
	flags["SHIZZY_CUNT_SNAKE_RECIPE"] = 0;
	
	yammiFollowerMenu();
}

public function shizzyCuntSnakeEat():void
{
	clearMenu();
	clearOutput();
	yammiFollowerDisplay();
	author("QuestyRobo");
	
	output("<i>\"Coming right up, boss. Do you want the " + (silly ? "juice" : "venom") + " or no?\"</i>");
	
	addButton(0, "Yes", shizzyCuntSnakeNom, true, "Yes", "Get a dose of that venom.");
	addButton(1, "No", shizzyCuntSnakeNom, false, "No", "Have it normal.");
}

public function shizzyCuntSnakeNom(venom:Boolean):void
{
	clearMenu();
	clearOutput();
	yammiFollowerDisplay();
	author("QuestyRobo");

	output("Yammi comes in and puts down a plate of sizzling, fried Cunt Snake. The smell wafts up and tickles your nostrils. It's a familiar sweetness with an undertone of savory meat that takes your tastebuds back to your first sampling. Your mouth waters slightly as you recall the taste. You dig in, hearing the satisfying crunch of your fork through the flakey crust, and the squelch as you hit the veritable fruit stuffed in the center.");
	output("\n\nYou tear into the dish, carving out a large piece and eating it in one bite, savoring the perfect blend of salty and sweet, before taking another bite.");
	if (venom) output(" You feel the venom working its magic on you. It's not as potent as getting it direct from the source, but enough that a constant flow of blood is flowing to your [pc.crotch].");
	output(" By the time you even realize, you've already polished off the plate. You can't believe it's snake!");
	
	processTime(15);
	eatHomeCooking(100);
	if (venom)
	{
		if (pc.hasStatusEffect("Fried Cunt Snake")) pc.setStatusMinutes("Fried Cunt Snake", 24 * 60);
		//10 libido, 20 min lust
		else pc.createStatusEffect("Fried Cunt Snake", 10, 20, 0, 0, true, "", "", false, 24 * 60);
	}
	
	addButton(0, "Next", yammiFollowerMenu);
}

/* 
 * Initial encounter starts heeeere
 * thas all
 */

public function shizzySpezzOdysseyEncounter(destination:String):void
{
	clearMenu();
	clearOutput();
	author("QuestyRobo");
	showName("DISTRESS\nSIGNAL");
	
	if (flags["SHIZZY_TRAP_ENCOUNTERED"] == undefined)
	{
		output("Your ship's navigation system takes you on a different path than usual; apparently there's some kind of disturbance on the main route. It's out of the way, but still seems safe, though rarely traveled. There's even a few very picturesque sights along it. A bright, dazzling nebula in particular catches your eye. You think you could just sit for hours and watch the shades of purple and blue swirl around each other in their mesmerizing dance.");
		output("\n\nIt's moments like this when you really appreciate this whole quest. You'd probably never see any of this from behind a desk at Steele Tech. As you're taking it in, your comms pick up a distress signal. It's too garbled to decipher anything beyond them being stranded. The message seems to be automated, which could mean that either the people sending it aren't doing so well, or it's a trap.");
	}
	else
	{
		output("Nobody ever said interstellar travel was fun. You find yourself on the same route you're always on, seeing the same things. Your mind drifts back to that side path you took; it didn't take that much longer than your normal route, and you barely got to explore. The tourist inside you is screaming at you to go see more of it, and you can't ignore [pc.him] anymore.");
		output("\n\nYou take your time to observe more this time. In addition to the nebula there's also a binary star system consisting of a larger star and a white dwarf star. Matter from the large star has accreted into a series of beautiful rings and tails around the dwarf star.");
		output("\n\nYou could just sit here for hours and watch these wonderful sights, but just as you're getting comfortable, the comm rings up. It's a distress signal, the same one from before. If this is a trap, it's a damn persistent one. Or maybe there really are people who need your help.");
	}
	
	var invTooltip:String;
	var leaveTooltip:String;
	if (pc.isAss())
	{
		invTooltip = "Who cares if it's a trap? You'll get through it, you always do.";
		leaveTooltip = "You have better things to do than put your ass on the line like that.";
	}
	else
	{
		invTooltip = "You can't let uncertainty stop you from doing the right thing.";
		leaveTooltip = "It's too much of a risk; better hope it's actually a trap.";
	}
	
	if (pc.isBro()) invTooltip += " Maybe there'll even be some hotties to reward you for your heroism.";
	
	IncrementFlag("SHIZZY_TRAP_ENCOUNTERED");
	
	output("\n\nWhat do you do?");
	
	addButton(0, "Investigate", shizzyInvestigateTrap, destination, "Investigate", invTooltip);
	addButton(1, "Leave", shizzyAdmiralAkbarThisBitch, destination, "Leave", leaveTooltip);
}

public function shizzyAdmiralAkbarThisBitch(destination:String):void
{
	clearMenu();
	clearOutput();
	author("QuestyRobo");
	
	output("You decide to ignore the signal and return to your business. You take one last look into the beautiful nebula before getting back to the helm and piloting to your destination.");
	
	addButton(0, "Next", flyToWrapper, destination);
}

public function shizzyInvestigateTrap(destination:String):void
{
	clearMenu();
	clearOutput();
	author("QuestyRobo");
	
	var canFix:Boolean = pc.characterClass == GLOBAL.CLASS_ENGINEER || pc.intelligence() > pc.intelligenceMax()*.8;
	
	output("If there really is someone in danger, then it's worth risking the possible trap. Just in case, though, you take a route that keeps you closer to the nebula. The concentration of plasma and scattered material will make you harder to detect.");
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" You remember that from some of the technical manuals you read.");
	else output(" One of your buddies from back in the day taught you that, saved your ass a few times already.");
	output("\n\nEventually you get close enough to be able to see the ship. It's an old Pyrite Industries freighter. Probably broke down out here. Pyrite ships aren't exactly known for their reliability, especially as they get up there in age. You pull out of the nebula's range and try and open a comm channel. As you'd expect, the ship's communication systems are down. Time for a rescue mission.");
	output("\n\nThe second you start to close in, your sensors pick up an unknown weapon's discharge, and before you can react, you're hit. The whole ship shudders from the impact, the projectile seeming to go right through your shields. Lights dim, power failure warnings start blasting before fading out. Soon you're down to nothing but emergency life support and a few lights.");
	
	if (annoIsCrew())
	{
		showAnno();
		
		output("\n\nAnno comes barreling into the bridge, pulls out a maintenance panel from the wall and starts to work.");
		output("\n\n<i>\"What just hit us?\"</i> You ask, thinking she might know a bit more about this stuff than you.");
		output("\n\n<i>\"If it blew through the shields like that, then it was at least a Class 3 EMP shell. Which means we need to get the fuck out of here. That's military-grade shit, boss; if they have that level of tech, then we don't want to mess with th-\"</i> A sudden flurry of sparks cuts her off, as smoke starts billowing out of the hole. Anno comes out, coughing up a fit as she starts cursing in irritation.");
		output("\n\n<i>\"I'm guessing we're fucked now?\"</i>");
		output("\n\n<i>\"Yep!\"</i>");
		output("\n\nAnother shock rocks the ship. This time it doesn't feel like an explosion, and you hear noises coming from the airlock.");
		output("\n\n<i>\"Well, at least they're boarding us instead of just blowing us up. I'll go grab some weapons and meet you at the airlock. If we're lucky, their bark is a lot worse than their bite.\"</i> She dashes out as another series of small quakes ring out. You grab your [pc.weapon] and head to the airlock ahead of her.");
	}
	else
	{
		if (canFix) output("\n\nYou pull off a maintenance panel and get to work, seeing if there's any way to restore at least some power. Shit, this is bad; some of the wiring and circuitry is already burned out. You try and rewire it to bypass the damaged parts, but only manage to make things worse. You're not getting out of this with any quick repairs, and there's no time to do anything in-depth.");
		else output("\n\nYou're way out of your depth with any of this. Things are broke, shit doesn't work, and you have no idea where to start, how to start, or what you'd even start doing.");
		output("\n\nAnother shock rocks the ship. This time it doesn't feel like an explosion, and you hear noises coming from the airlock. They've docked with your ship. At least they didn't just blow you to bits. You grab your [pc.weapon] and set off for the airlock. Hopefully you'll have a better chance fighting them in person.");
	}
	
	addButton(0, "Next", shizzyIntroductionPartZero, destination);
}

public function shizzyIntroductionPartZero(destination:String):void
{
	clearOutput();
	showShizuya();
	author("QuestyRobo");
	
	var canFix:Boolean = pc.characterClass == GLOBAL.CLASS_ENGINEER || pc.intelligence() > pc.intelligenceMax()*.8;
	var knowImplant:Boolean = flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_BOOKWORM || pc.intelligence() > pc.intelligenceMax()*.9;
	
	output("As soon as you reach the airlock, the doors slam open and a massive explosion rings from them, knocking you to ground and disorienting you. Your [pc.weapon] is blown clear and your vision is cut off by a large cloud of smoke, but you can make out a large figure stepping toward you from the airlock. Before it even gets through the doors, it begins to speak in a distinctly female voice.");
	if (flags["SHIZZY_TRAP_ENCOUNTERED"] == 1) output("\n\n<i>\"Well well well, ya fell for that one quick, didn't ya? I thought you were supposed to be smart? Well, doesn't matter much, you're gonna tell me what I need to know or else this won't be-\"</i>");
	else output("\n\n<i>\"Ya sure took your sweet fucking time! I was starting to think that you'd figured it out, but here we are. Now, you're going to tell me everything, or else this won't be-\"</i>");
	output("\n\nA loud clang rings out as the figure that was talking screams and falls forward, splitting the leftover smoke from the explosion as she impacts the floor.");
	output("\n\n<i>\"WINSTON, YOU AND MIKA WERE SUPPOSED TO FIX THAT LOOSE STRUT!\"</i> She screams at a large, scruffy looking huskar man.");
	output("\n\n<i>\"There's a hell of a lot more broken in this old piece of shit than that strut, give me a break!\"</i> The man replies in a deep voice.");
	output("\n\n<i>\"Yeah, we barely got this thing in shape for today.\"</i> Another female voice says. You can't see this one. She must be pretty far back there.");
	output("\n\n<i>\"Fiiiiiine, sorry.\"</i> The first woman says as she picks herself up off the ground. As she stands up, you realize that, sweet fuck, she's tall!");
	if (brynnIntroduced()) output(" She's about on par with Brynn, maybe even taller. Of course, it doesn't seem to matter how many eleven foot tall people you see, it never stops being surprising.");
	else output(" At about eleven feet, by your estimation, she's about the tallest normal person you've seen so far.");
	output("\n\n<i>\"I knew we should have just let Mika rip the ship open and drag him out.\"</i>");
	if (pc.isFeminine()) output(" Wait, him?");
	output("\n\n<i>\"Please don't encourage her, Shizuya.\"</i> A calm, but stern toned voice calls out. The woman steps into view, revealing herself, and");
	if (flags["MET_VANAE_HUNTRESS"] != undefined || flags["MET_VANAE_MAIDEN"] != undefined) output(" you recognize her as one of the Vanae. A weird thing you see immediately is that she seems to have a working pair of eyes. Though, on closer inspection, her eyes appear to be cybernetic, or at least enhanced in some way.");
	else output(" you don't quite recognize her species, but your codex beeps out that she's something called a vanae. Weird, it says their eyes are vestigial, but her’s seem to be working fine, must be implants or something.");
	output(" <i>\"You know that would have been far too risky.\"</i>");
	output("\n\n<i>\"You mean it would have been far too fun?\"</i> The unseen woman calls out, mockingly.");
	output("\n\n<i>\"Ugh.\"</i> The vanae grunts out, not paying any more thought to the comment. <i>\"Now, captain, your plan worked; are you going to stop beating yourself up over it now?\"</i> She says to the tall woman, smiling expectantly.");
	output("\n\n<i>\"It was a pretty bad plan, honestly. I'm surprised it worked!\"</i> The tall woman says, somewhat dejectedly in response. The vanae's smile quickly disappears, and she just grunts out again. While nobody's looking at you, you quietly reach for your [pc.weapon]. You're not sure if you can take three of them, and probably a lot more from the sounds deeper in, but you're not willing to go out without a fight. A shot suddenly lands between your hand and your weapon just as you get within reach. The huskar is holding a large handgun, twirling and flipping it around his finger.");
	output("\n\n<i>\"Good grief, did you really think I wouldn't see that? You kids today aren't that bright. Back in my day we kept emergency grenades up our asses; it worked great, until Jenkins had to ruin everything. Remember kids, loose anuses sink ships, literally in this case.\"</i> What the hell is he talking about?");
	output("\n\n<i>\"You know I only have so many grunts I can make in a row before my throat starts to hurt?\"</i> The vanae quips.");
	output("\n\n<i>\"Wow, Adelline makes a joke! Anyone see a flying pig around here? If you do, tell that fucker he owes me two-hundred credits.\"</i> The two get into a back-and-forth scuff, trying to one-up each other. You'd think the huskar would be distracted by this, but the way he aims his gun at you when you try to move says otherwise. The tall woman has mostly been engrossed in their conversation, but the occasional glances in your direction tell you that she's also still keenly aware of you.");
	
	if (pc.femininity >= 60)
	{
		output("\n\nShe looks over at you with a puzzled look on her face. <i>\"Aren't ya supposed to be a guy?\"</i>");
		output(pc.mf("\n\n<i>\"I am.\"\n\n\"Okay, okay, I see.\"</i>", "\n\n<i>\"Says who?\"\n\n\"I mean, whatever.\"</i>"));
	}
	
	output("\n\nShe turns to you fully, an act that seems to signal to her arguing companions that it's time to get serious. <i>\"Alright Judau, you know exactly why we're here. Your contact already squealed on ya, told us you knew where to find one of the bigwigs of the operation. It'd work a lot better for ya if you just spilled it right now.\"</i>");

	if (pc.short.toLowerCase() == "judau") output(" Contacts? Bigwigs? What is she talking about?");
	else output(" Who the hell is Judau? What is she even talking about?");
	if (pc.isNice()) output("\n\n<i>\"Um, I think you have the wrong person. I have no idea what you're talking about.\"</i>");
	else if (pc.isMisch()) output("\n\n<i>\"Wow, you know I really appreciate you frying my ship because you can't get your facts straight.\"</i>");
	else if (pc.isAss()) output("\n\n<i>\"Bitch, what are you even talking about?\"</i>");

	output("\n\n<i>\"Don't try and weasel out of this! We knew you'd be coming by this route, who the hell else would?\"\n\n\"What do you mean?\"\n\n\"What do ya mean what do I mean? This route is only safe for a very small amount of time, and only smugglers like you, and bitches like us who have to be on your ass, keep track of that.\"</i> Say what? Before she can say anything else, the huskar man comes up to her and begins whispering in her ear.");
	output("\n\n<i>\"What?\"\n\n\"I SAID THAT'S " + pc.short.toUpperCase() + " STEELE!\"</i> The man comically yells.");
	output("\n\n<i>\"I DIDN'T MEAN TO SCREAM IT!\"</i> The woman replies.");
	output("\n\n<i>\"I KNOW!\"</i> Winston screams back. The large woman raises her hands like she's about to throttle him, but slams them into her own face instead. She holds her double face-palm for at least a minute, occasionally shrieking into her palms. Eventually she slides her hands down off her face.");
	output("\n\n<i>\"Okay. Okay, okay, okay, okay, okay, O. FUCKIN'. KAY! This is why you don't let me come up with the plans.\"</i> She says, looking back at her other crew members. Adelline keeps up a disappointed scowl while Winston just blows a quick raspberry. She turns back to you.");
	output("\n\n<i>\"Ya okay, buddy? You can probably figure out that there was, uh, a little mix up here.\"</i> You stand up and stare at her, wordlessly and angrily. <i>\"I guess we owe ya an explanation huh?\"</i> Damn right they do! Part of you wants to lay into them, but you also realize that they still massively outgun you, so you need to take this carefully.");

	if (annoIsCrew())
	{
		showBust("SHIZUYA", "ANNO");
		output("\n\nSuddenly Anno bursts out from behind you, brandishing what looks like the biggest rifle she could find. <i>\"Don't worry [pc.name], I got your ba-\"</i> Anno stops, staring at the woman with a confused look on her face, as if she's trying hard to remember something. The woman has the same look, but she quickly perks up and starts to speak.");
		output("\n\n<i>\"Anno? Is that you? Holy crap, I haven't seen you since... well, ya know.\"</i> Anno takes a few more moments surveying, before everything seems to click. <i>\"Shizuya?\"</i> She hesitantly asks. The woman nods enthusiastically in response. <i>\"Wh-what the hell did you do to yourself? Better yet, why did you attack us?\"</i> She raises her gun up, leveling it at Shizuya.\n\n");
		if (annoIsHuskar()) output("<i>\"What did I do to myself? Look at you, all, uh... umm...\"</i> She devolves into gibberish as she looks over Anno's new curves, utterly lost until Anno feins a loud cough and draws the kaithrit's attention back to the husky's heavy gun. ");
		output("Shizuya sighs.");
		output("\n\n<i>\"Look, it's really complicated; we thought you were someone else, so we kinda jumped the gun here.\"</i> Anno still looks a bit unconvinced, and only slightly lowers her weapon. Suddenly the weapon is yanked from her hands and, before she can react, a box of tools is shoved in its place. Looking down, you all see a small, dark skinned cowgirl in front of Anno. How did she get there without you seeing?");
		output("\n\nYou take the time to examine her. She can't be any taller than about four and a half feet, though she certainly manages to pack a lot into her small frame. The loose-fitting, black tank top she wears lets you see how ripped her arms and back are. They flex with an unnatural strength, and several odd bulges and metal protrusions tell you that she's had some augmentation done. Her short, black hair is tied up into a small ponytail, letting you see one more augment going down her neck.");
		output("\n\nIt's a thin metallic strip leading from her head to a small set of openings at the base of her neck.");
		if (knowImplant) output(" You remember reading about something like this not too long ago. It's a form of power armor interface, used to provide the user with quick, accurate control over larger power armor frames. You don't recall reading about a price, but you'd certainly think that it would be out of the reach of a bunch of normal bounty hunters.");
		else output(" You're certainly not well-versed enough in this kind of thing to really know what they're for, but it looks way too expensive for a bunch of bounty hunters.");
		output(" Then again, they've already shown that they have some access to some pretty beefy hardware.");
		output("\n\n<i>\"Come on then, we're not getting this heap fixed up by standing around.\"</i> The little lady says, aggravatedly. Anno tries to say something, but the little cowgirl just walks off, carrying her own toolbox. Anno's eyes dart between you and her, trying to decide what to do. Shizuya chimes in. <i>\"Relax, I'm not gonna do anything bad back here, and Mika's not gonna bite ya unless you ask.\"</i>");
		output("\n\nAnno still seems a bit flustered about the situation. not sure how to go about dealing with it. <i>\"HEY SNOWY, THE SHIP ISN'T FIXING ITSELF. GET YOUR ASS OVER HERE!\"</i> Anno jumps at the sudden shout from Mika, letting out an irritated growl before finally deciding to go with her.");
	}
	else
	{
		if (pc.tallness < 5 * 12 + 2) output("\n\nYou see a dark skinned cowgirl walking out from behind the rest of them. She's about on par with you, in terms of height. She's carrying a large toolbox, and has an irritated look on her face. She approaches you surprisingly quickly and quietly; if she weren't near eye-to-eye with you, you might not even notice her coming up.");
		else output("\n\nA sudden tug on your leg brings your attention to a little, dark skinned cowgirl at your feet.");
		output("\n\nYou take the time to examine her. She can't be any taller than about four and a half feet, though she certainly manages to pack a lot into her small frame. The loose-fitting, black tank top she wears lets you see how ripped her arms and back are. They flex with an unnatural strength, and several odd bulges and metal protrusions tell you that she's had some augmentation done. Her short, black hair is tied up into a small ponytail, letting you see one more augment going down her neck.");
		output("\n\nIt's a thin metallic strip leading from her head to a small set of openings at the base of her neck.");
		if (knowImplant) output(" You remember reading about something like this not too long ago. It's a form of power armor interface, used to provide the user with quick, accurate control over larger power armor frames. You don't recall reading about a price, but you'd certainly think that it would be out of the reach of a bunch of normal bounty hunters.");
		else output(" You're certainly not well-versed enough in this kind of thing to really know what they're for, but it looks way too expensive for a bunch of bounty hunters.");
		output(" Then again, they've already shown that they have some access to some pretty beefy hardware.");
		output("\n\n<i>\"Hey, do you know how to fix this heap up?\"</i>");
		if (canFix) output("\n\nYou explain that you've never <i>really</i> gotten too deep into how to fix it up, but you could...\n\n<i>\"Ugh, nevermind, don't have time to teach a noobie.\"</i>" + (pc.isAss() ? " Little cunt." : ""));
		else output("\n\nYou tell her that you have no fucking clue.\n\n<i>\"Figures.\"</i> She rolls her eyes.\n\n");
		if (pc.tallness < 5 * 12 + 2) output("You hear a soft squealing from behind her, and see Shizuya staring at you, delightedly.\n\n<i>\"Soooooooo cute!\"</i> She whispers under her breath. The little cowgirl goes red on hearing that. ");
		output("She hoists her toolbox and goes into your ship.");
	}
	
	addButton(0, "Next", shizzyIntroductionPartEins, destination);
}

public function shizzyIntroductionPartEins(destination:String):void
{
	clearOutput();
	showName("\nWINSTON");
	showBust("WINSTON", "SHIZUYA");
	author("QuestyRobo");
	
	output("Here you are, face to face with the strange intruders. For people who must be professionals, given the hardware they have, they're very... What's a nice word for dysfunctional? Winston and Adelline are back at arguing. What they're arguing about escapes you, and Shizuya too, apparently.");
	if (silly) output(" She's taken to squatting on the floor and cracking open a bottle of vodka. She takes a big sip before offering some to you.\n\n<i>\"Cyka blyat.\"</i> What? <i>\"Want some?\"\n\n\"No thanks.\"\n\n\"Suit yourself, comrade.\"</i>");
	else output(" She's taken to sitting on the floor and cracking open a soda. She takes a big sip before offering some to you.\n\n<i>\"Want some?\"\n\n\"No thanks.\"\n\n\"Suit yourself.\"</i>");	
	output("\n\nA blonde gryvain woman interrupts the argument, dragging Adelline away, leaving Winston all by himself. Without anything else to do, he comes over to you and introduces himself.");
	output("\n\n<i>\"Winston Seabook, nice to meet you.\"</i> He extends his hand out, and you meet his gesture, if only to not make this too awkward.");
	output("\n\nYou take the time to look him over: He's a tall man, a little over seven feet and very grizzled despite his youthful energy, easily over fifty from his looks. His hair is short and blonde, and an equally short, well-trimmed beard wraps around his squared jaw-line. His eyes are a piercingly bright shade of blue, almost white. He's definitely muscular, built like a small tank, with a washboard stomach that you could probably grate cheese on. The biggest thing to note, however, is the massive amount of scars across his body.");
	output(" The arm he's shaking your hand with is covered in large bald spots along its blonde fur, giving way to various burns and scars. The simple white tank top he sports is low cut enough for you to see a large gash just below his neck, barely visible under his fluffy, blonde mane. And, lastly, his other arm is completely bandaged up, small glints of metal showing between the wrappings. His massive tail is extremely large and fluffy. Unlike the rest of him, it looks pristine, groomed, and incredibly soft.");
	if (pc.characterClass == GLOBAL.CLASS_MERCENARY) output("\n\nWait, Seabook? Why does that name sound familiar? Oh wait, you remember! He was a big shot at one of the larger merc companies, back in the day. No wonder he was so accurate.");
	output("\n\n<i>\"So, Steele's kid, huh?\"\n\n\"Yeah? You knew him?\"</i>");
	output("\n\n<i>\"Naaaaaaaaaah, I just looked you up a few minutes ago after I thought this didn't seem right. I thought Steele Tech made ice cream or some shit, but I guess they do other stuff.\"</i> You get the impression that he's not being completely honest.");
	output("\n\n<i>\"Questions, comments, suggestions? We got plenty of time to kill.\"</i>");

	addButton(0, "Him", shizzyAskWinstonHim, undefined, "Him", "Who is he?");
	addButton(1, "Them", shizzyAskWinstonThem, destination, "Them", "Who are they?");
	addDisabledButton(2, "No", "No", "You should at least ask who they are.");
}

public function shizzyAskWinstonHim():void
{
	clearOutput();
	author("QuestyRobo");
	
	if (pc.characterClass == GLOBAL.CLASS_MERCENARY)
	{
		output("<i>\"Seabook, huh? I know that name.\"</i>");
		output("\n\n<i>\"Oh boy, you're going to bring it up aren't you?\"</i> Bring what up? Wait, was there something? You never really paid much attention to him beyond the basics. Oh right, he...");
		output("\n\n<i>\"So what if I blew my boss's head off and collapsed Emeraude overnight in a sea of blood and bullets? People do bad shit all the time. Why I bet you haven't even paid your taxes, have you?\"</i> Oh, yeah, that was the thing. Wait, taxes? Are you supposed to pay those? <i>\"In all seriousness, I had good damn reasons to do what I did.\"</i>");
		output("\n\n<i>\"Which are?\"</i>");
		output("\n\n<i>\"I said we had time to kill, not time to stuff in a burlap sack, drag down to the river, and hold it down until the bubbles stop.\"</i> ... Wow. <i>\"You want to keep talking about this now, or are we moving on?\"</i>");
		output("\n\n<i>\"Yeah, let's just move on.\"</i>");
	}
	else
	{
		output("<i>\"You're a pretty good shot; military, merc?\"</i>");
		output("\n\n<i>\"Oh, I scaled the tallest peaks of the most dangerous planets in order to find the greatest gunmen to teach me their ways. But it turned out that they either didn't live up there, or they were ungodly expensive; so I just became a merc and learned from there.\"</i>");
		output("\n\n<i>\"You just have a story for everything, don't you?\"</i>");
		output("\n\n<i>\"Not <b>everything</b>, but I've got some killers if you want to know where the bathroom is. It's not all bullshit either. I did climb a mountain, once, and the fucker up there was charging an arm a leg, and probably about a fifth of a gallbladder for lessons.\"</i>");
		output("\n\n<i>\"Alright alright, let's get to some actual questions.\"</i>");
	}
	
	output("\n\n<i>\"Okay, what's with the arm?\"</i>");
	output("\n\n<i>\"Ah, you see my father was a warm-blooded spaceican who loved wearing black and had an unreasonable hatred of sand. One day we were playing on the rafters of one of his factories and he cut it off with his laser sword.\"</i>");
	output("\n\n<i>\"... Can you give a serious answer for once.\"</i>");
	output("\n\n<i>\"Well that'd just ruin the illusion wouldn't it? Don't want people thinking I'm smart or something.\"</i> This is getting maddening!");
	output("\n\n<i>\"Okay, where are you from?\"</i>");
	output("\n\nYou ask, expecting another nonsense answer. <i>\"Melkia, it's a huskar colony in the Gilgamesh system.\"</i> Wow, a straight answer for once.");
	output("\n\n<i>\"Yep, my mom was a dickgirl, and I was born out of my dad's asshole.\"</i> Well, it was nice while it lasted.");

	addDisabledButton(0, "Him");
}

public function shizzyAskWinstonThem(destination:String):void
{
	clearOutput();
	author("QuestyRobo");
	
	output("<i>\"So, who are all of you?\"</i>");
	output("\n\n<i>\"All of me? Well, I'm all of me, unless you mean my little me, in which case you need to wash your brain of such lewd thoughts, young " + pc.mf("lad.\"</i>", "lady.\"</i>"));
	if (pc.isNice()) output(" You scream internally, but keep a polite face.");
	else if (pc.isMisch()) output(" You start mock laughing. Very loudly. He joins you. It's fun.");
	else output(" You grunt in irritation, giving him your best \"I'm going to punch you\" stare.");
	
	output("\n\n<i>\"No really, who are all of you?\"</i>");
	output("\n\n<i>\"Ummmmm, I want to say bounty hunters, I guess that's right, sort of. What we're doing here isn't exactly standard operating procedure, if you know what I mean.\"</i>");
	output("\n\n<i>\"I don't.\"</i>");
	output("\n\n<i>\"Kid, it's fucking complicated. We're members of Black Iron. You heard of 'em? Probably not, wouldn't take you as someone to get involved in that kind of stuff. Big JAF and UGC affiliated PMC, basically we do the military's bitch work when they don't feel like sending their own guys in. Right now, can't say too much, that means trying to find a guy who's most likely dead, because some admiral pissed himself over some new drug or some shit.\"</i>");
	output("\n\n<i>\"That sounds like something the UGC should be handling themselves.\"</i>");
	output("\n\n<i>\"It does, doesn't it? The way they see it, finding the guy or guys is secondary to making sure the drug doesn't spread around too much. They've got a ton of guys on that, so they figured why not call in those disposable chumps to do the heavy lifting? Besides, all they're thinking right now is that some son of a bitch stumbled on data that he really shouldn't have. If that's right, then they've probably spread it around so much that knocking off just one or two guys isn't going to cut it.\"</i>");
	output("\n\n<i>\"Why bother then?\"</i>");
	output("\n\n<i>\"Like I said, one of the admirals on the board thinks that it might be something bigger, again, can't tell you details. He's got the board curious enough to look into it, but not enough to really commit too many resources to make a real effort. Our boss has a pretty personal stake in finding out who's behind this, too.\"</i>");
	output("\n\n<i>\"How so?\"</i>");
	output("\n\n<i>\"Let's just say these guys haven't exactly made many friends, with anyone. Slippery shits.\"</i>");
	output("\n\n<i>\"What happens when you find them?\"</i>");
	output("\n\n<i>\"If we confirm that someone else created and distributed the drug, then we call in the cavalry, and get a nice bonus. If by some miracle the fucker is alive, ho boy, shit gets complicated. Cause he's supposed to be dead, and everyone's been going on like he's dead, so if he's not, that throws a lot of shit out.\"</i>");
	output("\n\n<i>\"Would you guys fit into that?\"</i>");
	output("\n\n<i>\"Eh, probably not. I'd hope we would, be better than paperwork, but the UGC isn't gonna let a bunch of nobodies and an old psycho handle a big job, are they? Oh well.\"</i>");
	
	addDisabledButton(1, "Them");
	addButton(2, "No", shizzyEnoughQuestionsAlreadyJeez, destination, "No", "No more questions.");
}

public function shizzyEnoughQuestionsAlreadyJeez(destination:String):void
{
	clearMenu();
	clearOutput();
	showShizuya();

	output("<i>\"Well, I don't have much to do around here. I'll come back if I think of something else stupid to say.\"</i> With that, he walks back through the airlock, striking a pose that seems genuinely thoughtful.");

	output("\n\nThat just leaves you and Shizuya. Many awkward minutes filled with nothing but the occasional clatter of metal as " + (annoIsCrew() ? "Anno and Mika work" : "Mika works") + " on getting your ship back in working order. Shizuya finishes her drink in short order, and just sits and stares at you.");
	output("\n\nYou finally have time to just look over the massive kaithrit. She has short, unkempt red hair, parted by a pair of cat ears, one of which has a large chunk of it missing. She also has a pair of large ram horns that wrap around behind her head. Her face has several noticeable scars across it. They're not fully faded yet, so they must be recent. Her eyes fade from green to red as they approach her slitted iris, though the red is very slight.");
	output("\n\nHer body is clad in thick military padding, the kind of stuff you'd see on SWAT officers. It hides most of the features you could make out on her body, except for the unmistakable curve of her massive breasts. She's wearing a skirt too, and upon closer examination, what appeared to be pants are actually thigh highs, with a heavily bulging pair of panties peeking out.");

	if (pc.tallness < 5 * 12 + 2)
	{
		output("\n\nShe looks incredibly happy as she looks over your diminutive size. It's not predatory or condescending, instead she radiates a sort of protective adoration, like she could sweep you up in her arms and protect you from anything.\n\n<i>\"Wanna hop up, little " + pc.mf("guy", "girl") + "?\"</i>");
		if (pc.isBimbo())
		{
			var args:Array = new Array(destination, 3);
			addButton(0, "Yes", shizzyIntroductionPartEinsEpilogue, args);
			if (silly) for (var i:int = 0; i <= 14; ++i) addButton(i, "YES", shizzyIntroductionPartEinsEpilogue, args);
		}
		else
		{
			addButton(0, "Yes", shizzyIntroductionPartEinsEpilogue, new Array(destination, 2));
			addButton(1, "No", shizzyIntroductionPartEinsEpilogue, new Array(destination, 1));
		}
	}
	else addButton(0, "Next", shizzyIntroductionPartEinsEpilogue, new Array(destination, 0));
}

public function shizzyIntroductionPartEinsEpilogue(args:Array):void
{
	clearMenu();
	clearOutput();
	showShizuya();
	author("QuestyRobo");
	
	var destination:String = args[0];
	var choice:int = args[1];
	
	//PC said yes
	if (choice >= 2)
	{
		//PC is bimbo
		if (choice == 3)
		{
			output("Cuddle sense tingling! Must engage hugs! You fly into her arms as soon as she finishes talking, helping her unzip her padded shirt so that you can get at her big ol' titties! Once they're exposed, you shove yourself between them, feeling the warmth of being so engulfed spread throughout you. You beam at each other, relishing the feeling of closeness.");
			output("\n\n<i>\"You're so precious.\"\n\n\"So are you!\"</i> You reply as you settle in.");
		}
		else
		{
			output("Why not? You walk up to the towering kitty woman, presenting yourself to be picked up. She reaches for you, but stops halfway. <i>\"Hold on a sec.\"</i> She zips down her shirt, revealing a canyon of cleavage. <i>\"There ya go, best seat in the house.\"</i> She presses her breasts together for emphasis.");
			if (pc.hasCock())
			{
				output(" Your [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " rock hard at the thought of being nestled in that bountiful boobage. She gives you a cheshire smile as she looks at your");
				if (pc.isCrotchGarbed()) output(" bulge.");
				else output(" blatantly exposed " + (pc.hasCocks() ? "dicks" : "dick"));
			}
			output("\n\nShe grabs you, hoisting your diminutive frame easily, and plants you in her boobs. You have to squirm a bit in order to get yourself fully embedded in her tits.");
		}
		output("\n\nIt's undeniably comfortable, like being engulfed in a big, soft bed that's also giving you a gentle massage. A combination of her heavy heartbeats and full-body purring creates an effect not too dissimilar to a massage chair, working out all of your built up stress and aches. It's comfy as shit, to make it short.");
		output("\n\nYou sigh as you settle in. You could live in these tits.\n\n");
	}
	//PC said no, but cuddles were offered
	else if (choice == 1) output("She looks very disappointed as you tell her, no. <i>\"Come oooooon, you'd love it!\"\n\n\"No.\"</i> She huffs at your response, begrudgingly accepting that she won't be able to snuggle with your bad self.\n\n");

	output("About an hour passes, very uneventfully. The only thing keeping you busy has been small bouts of inconsequential chatter between you and Shizuya; You learned that she likes to cook, that she's married and her wife recently gave birth to twins, and many less wholesome things about how much she loves bondage. Hot.");
	output("\n\nEventually the lights start to flicker back to life. You check your codex and see that system power is at 40%. It's not enough to get the ship back moving, but enough for the main systems to kick back in.");
	if (annoIsCrew()) output(" They've been at this for a while , maybe you should check up on them?");
	else output( "She's been at this for a while , maybe you should check up on her?");
	
	//PC in tittays
	if (choice >= 2)
	{
		output("\n\nShizuya has fallen asleep by this point, content to cuddle with you until the ship's fixed. You reach up and give her face a few taps to wake her up.");
		output("\n\n<i>\"Hmm, huh? What's up, is the ship fixed?\"</i> You tell her that it's not, but you wanted to go check up to see how it's going. <i>\"Hmmmm, sure, I need to go get something set up anyway.\"</i> She lifts you out and sets you on the ground, getting ready to go back into her own ship.");
	}
	else
	{
		output("\n\nShizuya has been messing around with her codex for the past hour, looking up various things, chatting with friends.You give her the heads up that you're going to check and see how things are going with the repairs.");
		output("\n\n<i>\"Oh, ok. Um, I'll be back, gotta get some things set up on the ship.\"</i> She gets to her feet and gets ready to go back to her ship.");
	}
	
	output("\n\n<i>\"What are you getting ready?\"</i>");
	output("\n\n<i>\"Gonna get the kitchen fired up to cook some 'sorry I almost blew up your ship' food.\"</i> Well then, that sounds pretty nice. Adelline comes back before Shizuya can even get to the entrance of the airlock.");
	output("\n\n<i>\"I'm afraid that'll have to wait, the kitchen is in no condition to be doing anything.\"</i> Shizuya freezes, first in confusion, and then anger.");
	output("\n\n<i>\"Wh-what the? How did... It was Tiffa again, wasn't it?\"</i> Adelline nods in response. <i>\"Is she still using her pussy to store plasma cartridges?\"</i>");
	output("\n\n<i>\"Of course she is.\"</i> Adelline dryly responds. From out of the airlock, another voice echos out.");
	output("\n\n<i>\"See kids, loose assholes! Well, vaginas in this case.\"</i> It's Winston; of course it is.");
	output("\n\n<i>\"Did anyone ask you for input!?\"</i> Adelline yells out, angrily.");
	output("\n\n<i>\"Addy, I promised the kid I'd come back if I had something stupid to say. I'm a man of word, so here I am.\"</i> Adelline grunts out again, noticeably straining to get it out. Guess she wasn't joking, earlier.");
	output("\n\n<i>\"Well fuck. Are the food stores at least okay?\"</i>");
	output("\n\n<i>\"Yes, they were untouched in the blast.\"</i>");
	output("\n\n<i>\"Perfect!\"</i> Shizuya turns back to you. <i>\"You've got a kitchen, right?\"</i> Of course you do. <i>\"Great, we'll cook here! Just let me get everything together and I'll be back.\"</i> She darts off before you can say anything.");
	output("\n\nWell, looks like your kitchen is going to be getting some use.");
	if (yammiIsCrew()) output(" You hope Yammi won't mind having some extra cooks in the kitchen.");
	output(" Oh well, off to find");
	if (annoIsCrew()) output(" Anno and Mika.");
	else output(" Mika.");
	
	addButton(0, "Next", shizzyIntroductionPartII, destination);
}

public function shizzyIntroductionPartII(destination:String):void
{
	clearOutput();
	author("QuestyRobo");
	
	if (annoIsCrew())
	{
		showBust("ANNO", "MIKA");
		showName("ANNO\nAND MIKA");
		
		output("You find Anno working on an open panel on the floor. There's another panel at the top of the wall that's been removed, and it looks like Mika is in that one. Occasionally she'll ask Anno to pass her a tool or take one away. Anno spots you across the hall, waving you over with an exhausted smile.");
		output("\n\n<i>\"Hey, boss, repairs are coming along great. We should be back up and running in another hour.\"</i> A rattling comes from up above, getting closer. An arm comes out of the open panel.");
		output("\n\n<i>\"Hey, Snowy, pass me the bolt extractor.\"</i> Anno rummages through Mika's toolbox and pulls out the tool, passing it up to Mika.");
		output("\n\n<i>\"Hey, do you still need that wire welder?\"</i> Anno says as Mika takes the tool. A moment passes before Mika returns with a small welding kit, which she passes down.");
		output("\n\n<i>\"Thanks.\"</i>");
		output("\n\nAnno gets back to work on her panel. <i>\"It's a good thing she's here, I hate trying to squeeze in up there.\"</i>");
		output("\n\n<i>\"So, she's been alright?\"</i>");
		output("\n\n<i>\"A little pushy, but yeah, she's alright.\"</i> She closes in on you and starts to whisper. <i>\"She's cute as fuck too. Have you seen " + (silly ? "dat" : "her") + " ass? Mhmm!\"</i> She gives an okay sign for emphasis. <i>\"So, what's been happening with you?\"</i> You explain all the things that Shizuya told you. <i>\"A wife and kids? That woman works fast, doesn't she? Never took her for a charmer, but I guess she's had some 'changes' since then.\"</i> She bites her lip a bit at that. <i>\"Say, wanna help me talk these girls into some 'dessert'?\"</i>");
		output("\n\n<i>\"I'm not deaf, you know.\"</i> Mika interrupts before you can answer, hoping out of the wall. <i>\"What's there to talk into? You wanna fuck, I'm down to fuck.");
		if (pc.femininity <= 40) output(" Weeeell, maybe [pc.he]'ll need to do some talking.");
		output(" But, we got a job to do , sex comes later.\"</i> Anno feigns a huff as Mika picks up her toolbox and starts walking over to the next point of repair. The pale pup is almost shameless in ogling her ass as she walks. You can't blame her, even in the baggy cargo pants Mika is wearing, her ass manages to make a noticeable indent, and jiggles like two perfectly molded gelatin domes.");
		output("\n\nYou're both so captivated that you don't even notice when she looks back at you.");
		if (pc.isNice()) output(" You and Anno both go red, a slight look of shame coming over your faces, though you're pretty sure Anno is faking it.");
		else if (pc.isMisch()) output(" You and Anno immediately look away, pretending like you weren't looking.");
		else output(" Anno looks away, but you keep looking, even giving her a thumbs up on that delicious rump.");
		output(" She looks mad, but the way she starts swaying her hips says that she's actually enjoying the attention.");
		output("\n\n<i>\"Better get moving, lot of stuff left to fix. Hey, if you don't have anything else to do, why don't you come with? We could use the help.\"</i> Why not? You help Anno finish up here before moving on. On the way there, you decide to finally ask Anno how she knows Shizuya.");
		if (flags["SHIZZY_ANNO_MENTIONED_AKKADI"] != undefined) output("\n\n<i>\"Remember when I told you I got my own team for the warp gate project at Akkadi? She was one of them.");
		else output("\n\n<i>\"It's a long story, but the gist of it is; back at Akkadi I got on a project to upgrade the tech used in warp gates, got my own team and everything. She was one of the people who got assigned to my team.");
		output(" She was a lot different back then, I'd say she was just a bit taller than Mika, skinny as a rail too. Not much to really say; she was nice, fun, knew what she was doing, could hold her drinks like a machine. Stars, I remember this time we were out celebrating a big find in our research, and this nine or ten-foot Treated guy was harassing us. She challenged him to a drinking contest, and she drank him so far under the table that he could barely speak. The look on his face was priceless!\"</i>");
		output("\n\n<i>\"Sounds like you had fun, what happened?\"</i>");
		output("\n\nShe sulks a bit at your question.");
		if (flags["SHIZZY_ANNO_MENTIONED_AKKADI"]) output("\n\n<i>\"You remember what I told you, the project went wrong, really wrong.");
		else output("\n\n<i>\"The project went bad, really bad. We got pushed into testing the tech on people before it was ready. A few people died, and some might have even got it worse.");
		output(" Everyone got shaken up at that, but I think Shizuya took it the worst. Her boyfriend was one of the people who went through, poor guy didn't even come out the other side.\"</i>");
		output("\n\nOuch. <i>\"She must have been devastated.\"</i>");
		output("<i>\"She spent a week combing over the data, even after the rest of us gave up on finding them. Best conclusion we came up with is that they just never rematerialized right, and their particles got scattered into space. After that she just quit, said she couldn't take it anymore. Looking back, it might have been better if I'd gone with her like I was thinking, but that was when I was too naive to realize that the higher-ups didn't give two shits about actually learning from mistakes.\"</i>");
		output("\n\nJeez...");
		output("\n\n<i>\"Sorry for getting so down, it's a bit of a sore subject");
		if (flags["SHIZZY_ANNO_MENTIONED_AKKADI"]) output(", you probably know that already");
		output(". I don't know what happened after she left; she said she'd stay in touch, but this is the first time I've seen or heard from her since. I can see why, now.\"</i>");
		output("\n\nMika stops ahead of you and starts to examine some of the damage. <i>\"Anno, I'm going to need you to fix the R218 and C902 circuits. Steele, you stay here and help me out with this.\"</i> Anno nods before moving over to a distant circuit panel, leaving you alone with Mika.");
		output("\n\nAt least you think Mika is here. You turn around after watching Anno turn a corner to see that the little twerp is nowhere in sight. You wonder where she went, only to realize all too late that she's somehow managed to climb up into an open vent, and she jumps out as soon as you notice. There's no way you could duck out of the way of such a large object before it connects with your face, and you're send tumbling to the ground, Mika's dusky ass cheeks blocking out everything else.");
		output("\n\n<i>\"Must be getting pretty hungry. How about we stop for a quick meal? Don't worry about Anno, I prepared enough for both of you.\"</i>");
		output("\n\nHer fat, chocolate pussy is pressed right up against your nose, drooling obscene amounts of pheromone-laden girlcum down your face.");
	}
	else
	{
		showMika();
		
		output("As you move into the hall, you're surprised to see that Mika isn't there. Her tools are laying against the wall, and there's an open panel in ceiling, but you don't see her anywhere. You decide to take a closer look at her toolbox. It has all the usual things you'd expect, some specialty equipment, from the looks of it, and... candy? There's a <i>ton</i> of candy and other sweets sitting in what seems to be their own dedicated section of the box.");
		output("\n\nYou reach into the box, just to see if it's some kind of joke. Suddenly you hear a loud rumbling from above, moving towards you. You look up just in time to get a face-full of ass as Mika drops down onto you.");
		output("\n\n<i>\"Trying to steal my sweets, huh? Well, you're going to have to eat dinner before you get dessert!\"</i> What, dinner? It takes you a second to recover, and when you do, you realize that she's not wearing pants!");
		output("\n\nYour nose is pressed right against her mons, only the thin, red fabric of her thong sitting between them. The curve of her huge, black ass dominates your vision as it jiggles like two fat bowls of jelly.");
	}
	
	if (pc.hasGenitals()) addButton(0, "Inhale", shizzyMikaNomNomNom, destination, "Inhale", "​Take a deeeep whiff of that good shit.");
	else addDisabledButton(0, "Inhale");
	if (!pc.isTreated() || !pc.hasGenitals()) addButton(1, "Push Off", shizzyNoMikas, destination, "Push Off", "Nope");
}

public function shizzyMikaNomNomNom(destination:String):void
{
	clearMenu();
	clearOutput();
	showMika(true);
	author("QuestyRobo");
	
	if (pc.isTreated()) output("The scent of her sex seems to briefly skip your sense of smell and instead takes a shortcut right to your brain. Your Treated instincts spring into action, taking charge like an army general during a surprise attack. There's a wet, ready cunt that hasn't been filled yet! Get your lazy ass in gear, maggot! Your [pc.tongue] darts out, removing the cloth blockade with masterful speed and driving itself in.");
	else output("If you weren't convinced Mika was Treated before, the overpowering musk is making damn sure that you are. Every nerve in your body lights up and stands to attention; it's fucking time! Your [pc.tongue] moves out of your mouth on its own, slapping and flailing against her thong-covered cooch in a desperate attempt to get at the sweet honeypot. It's a sloppy procedure, but your lust-fueled flailing eventually moves her pussy-soaked thong out of the way and digging into her.");

	output("\n\n<i>\"Gooood, you're just a natural pussy eater aren't you? Is the taste of it so addicting that your mouth feels dry when you haven't had a muff to munch on? Is the smell burning into your brain so that you never have to go without it?\"</i>");
	output("\n\nYou want to respond; whether to deny it or gleefully accept your devotion to pleasing pussy is beyond your lust-drugged mind to decide. But you can't respond. Every muscle in your mouth is dedicating itself to driving your [pc.tongue] into the choco-cow's cunt.");

	if (pc.hasCock())
	{
		output("\n\nYour [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " straining ");
		output((pc.isCrotchGarbed() ? "against your " + (pc.hasLowerGarment() ? "[pc.lowerGarment]" : "[pc.armor]") : "in the air"));
		output(", jealous of the privileged position that your tongue has. Mika takes eager note of your hardening member" + (pc.hasCocks() ? "s" : "") + ", extending out a foot to stroke [pc.oneCock].");
		
		if (pc.isCrotchGarbed())
		{
			output("\n\nHer dainty, dark toes expertly move across the bulge in your " + (pc.hasLowerGarment() ? "[pc.lowerGarment]" : "[pc.armor]") + ", teasing the sensitive flesh until pre starts " + (pc.cumQ() < 8000 ? "collecting at your tip." : "soaking through."));
			output("\n\nJust when you think she's going to make you cum in your pants, she pulls off and yanks your clothes off with a graceful flourish, letting your tool" + (pc.hasCocks() ? "s" : "") + " spring out, flinging " + (pc.cumQ() < 8000 ? "faint drops" : "a splash") + " of off-[pc.cumColor] pre onto your [pc.belly].");
		}
		
		output("\n\n<i>\"Oh ho, someone's a little overeager. Let me guess.\"</i> Mika brings her foot up to your [pc.cockHead]. <i>\"You want this naughty boy inside me instead of your tongue?\"</i> She flicks your head with her toe. The impact is a sublime mix of pain and pleasure, causing another " + (pc.cumQ() < 8000 ? "drop of pre to roll" : "spurt of pre to fly") + " out of your eager urethra. You begin to thrust your [pc.hips] on instinct, as your [pc.tongue] probes even deeper into her depths. Her Treated pheromones have you on full breed mode, thrusting anything getting stimulation in a desperate bid to sow your seed.");
		output("\n\n<i>\"Yeah, you want in, don't you?\"</i> She starts stroking you, while you start eating her out faster. <i>\"You want my tight, fertile pussy squeezing around your ");
		if (pc.longestCockLength() < 8) output("little");
		else if (pc.longestCockLength() < 12) output("fat");
		else if (pc.longestCockLength() < 18) output("big");
		else if (pc.longestCockLength() < 26) output("giant");
		else output("fuck-huge");
		output(" cock?\"</i> You both go faster. <i>\"You want me to scream your name in pleasure while I'm cumming my brains out around you?\"</i> Faster. <i>\"Your [pc.balls] tightening up from the sensation, brewing up a big, fat, fertile load at the thought of knocking up a curvy, Treated slut.\"</i> Oh stars, you're so close! And so's she.");
		output("\n\nYour tongue is shooting in and out of her like a piston, drawing out fat splatters of girlcum with each thrust. It's like eating a warm, ripe watermelon, so delicious and juicy that it's worth having your face soaked in it, and soaked it is. You feel like you're laying under a small, pulsing waterfall, each splash soaking your face and sense in a wash of pheromone-laced ambrosia. The runoff pools below you, soaking into your [pc.hair] and back, ensuring that you'll reek of her cunt for at least the rest of the day.");
		output("\n\n<i>\"Mmmh, feel how wet I am? Fuck, I'm just crying out to be bred! And you'd love to do it. You'd love to fill me with fertile cum, to watch my belly swell up with your cum, knocking me up withyour little brats.\"</i> FUCK, you can't take it anymore! <i>\"Cum, breeding slut!\"</i> Mika lifts off of you in a flash, leaving your tongue slurping at empty air. Before you can react, she's already on your [pc.oneCock], pressing it down against your [pc.belly] with her foot.");
		output("\n\n<i>\"Cum!\"</i>");

		if (pc.cumQ() < 8000) output("\n\nYou moan out loud as you unload on yourself, splattering streaks of [pc.cumColor] across your front. An errant drop hits your tongue, giving you a taste of your own [pc.cumFlavor] [pc.cumNoun].");
		else if (pc.cumQ() < 40000) output("\n\nYour urethra bulges enough to lift her foot up a bit as it transports your fertile cargo. Jets of [pc.cum] spray from your overworked cock, painting you in waves of [pc.cumColor] as Mika laughs at your obscene output.");
		else
		{
			output("\n\nMassive sperm-packed bulges obscenely distend your urethra. The curvaceous cowgirl notices this and presses her toe down on your cumvein, hard enough to stop your seed in its tracks. You groan out loud as your release is halted, fat floods of [pc.cum] melding together as they desperately seek an exit. In less than a minute the bottom half of your urethra is swollen beyond reason, pulsing and throbbing, begging for release. Even with that, there's enough leeway for your cum to shoot out with force and volume that puts most men to shame, and it's just the leakage.");
			output("\n\n<i>\"You know, you and Shizuya should get together sometime, fill a galotian swimming pool or something.\"</i> She lifts her foot off, allowing the outrageous backup to finally release. Your [pc.cock] lifts up from the sheer strain of unloading its cargo, the blood rushing to it acting like helium in a balloon. [pc.cum] flies out of you like water from a firehose. It slams against the ceiling before raining down on you in a torrent of [pc.cumNoun].");
			output("\n\nThe blasts are so heavy, so intense that you feel your middle tightening up all over again. You cry out as you cum again in the middle of your orgasm. Your [pc.cumColor] sprays with renewed force, and your [pc.balls] pulse with such force that " + (pc.balls > 1 ? "they start" : "it starts") + " to hurt. You cum and cum until the ceiling looks more like the floor of a New Texas brothel, and the actual floor looks like a kiddy pool.");

		}
		
		output("\n\nAs you recover from your orgasm, you hear a small whirring noise. You look over and see Mika holding a small, handheld vacuum cleaner. The device effortlessly sweeps up all of your cum, leaving you" + (pc.cumQ() >= 40000 ? " and the rest of the hall" : "") + " spotless. <i>\"These things are expensive, but they're damn worth it.\"</i>");
	}
	else
	{
		output("\n\nYour [pc.pussy] is absolutely soaked at this point, and Mika knows. Her hand works over your mons, massaging your outer lips");
		if (pc.isCrotchGarbed()) output(" through your " + (pc.hasLowerGarment() ? "[pc.lowerGarment]" : "[pc.armor]") + ". She dutifully removes the offending clothing, leaving your cunt to taste the open air");
		output(". She takes stock of your desperate honeypot, admiring how your [pc.clits] raise" + (pc.totalClits() > 1 ? " from their hoods and pulse" : "s from its hood and pulses") + " for attention.");
		output("\n\n<i>\"Horny, are you? Well, I'm a fair woman, do a good job down there and I'll return the favor.\"</i> She pats your [pc.hips] as if to say, chop chop.");
		output("\n\nAs if anything could sway you from pleasing her fragrant cunt, now you just have incentive to do it better. You move your lower lip over to envelope her pulsating clitty. It's easy to find, with how big it is, and you're able to settle into a rhythm of thumbing it as you eat her out. A satisfied moan of approval rings out from the curvy cow, and her position begins to shift. She bends forward, laying herself across your body in order to get at your [pc.pussy]. Her body is delightfully warm, and surprisingly soft, not to mention the pleasant tingle of her dribbling milk on your [pc.belly].");
		output("\n\nMika's hot breath finally falls on your honeypot, sending shivers up your over-sensitive body. Her big, cow-like tongue slaps over your outer lips, trying to batter its way inside. You moan out loud as she slips inside you, her wide tongue curling up into a thick, fleshy cylinder that pounds you as well as any cock. She facefucks you, stopping whenever you lose your rhythm, training you to keep collected under pressure. After a short time, you and her are perfectly synchronized, fucking each other like a well-oiled machine.");
		output("\n\nYour ministrations become faster, more frantic; you can practically see your climax racing toward you, and you welcome it with open arms. Your muscles tense up, pleasurable spasms shooting through your body, congregating at your [pc.pussy]. Your inner muscles milk Mika's tongue, trying desperately to milk out phantom spunk.");

		if (pc.wettestVaginalWetness() <= 2) output(" Your [pc.girlcum] is quickly swept away by the fat cow tongue, absorbed like water into a sponge.");
		else if (pc.wettestVaginalWetness() <= 4) output(" Your [pc.girlCum] messily splatters out around Mika's probing tongue. Your climax takes on a very wet sound profile as splatters of [pc.girlCumNoun] go flying with each plunge the coercive cow takes.");
		else if (pc.wettestVaginalWetness() <= 6) output(" Mika moans out as your excessive [pc.girlCum] splatters out with enough force to soak her face. She's so enamored with your output that she takes her tongue to lap up your excessive juices, moaning as she savors your flavor, before diving back in.");
		else output(" You spray [pc.girlCum] like a broken faucet nailing her face with a shot so voluminous that it looks like she just dipped her head in a [pc.girlCumNoun] pool. She seems shocked for a second, but quickly overcomes it as she dives onto your firehose-like womanhood, wrapping her lips around it so she can get every last drop.");
		
		output("\n\nYour tongue is shooting in and out of her like a piston, drawing out fat splatters of girlcum with each thrust. It's like eating a warm, ripe watermelon, so delicious and juicy that it's worth having your face soaked in it, and soaked it is. You feel like you're laying under a small, pulsing waterfall, each splash soaking your face and sense in a wash of pheromone-laced ambrosia.");
		output("\n\nThe run-off pools below you, soaking into your [pc.hair] and back, ensuring that you'll reek of her cunt for at least the rest of the day.");
		output("\n\nMika rolls off of you, fully satiated, panting lightly with exertion. You both lay there, enjoying the afterglow of your sixty-nining. Eventually Mika pops up, lazily reaches over to her bag, and pulls out a cloth. She moves back on you, straddling your prone form. She takes the cloth and starts to wipe off your face, slowly, sensually; she moves her face closer and closer as she pays particular attention to your [pc.lips], tracing the shape of your mouth.");
		output("\n\nShe's so close now, you can feel her breath mix with yours. It's so warm and passionate... you could almost- oh. She takes the cloth out of the way and locks lips with you, tasting her own flavor that's still heavy on your breath. You tie your tongues together as you engage in a quick, post-sex make-out session. She parts lips curtly, wiping the rest of her juices from your face before hopping off. <i>\"Nice work.\"</i>");
	}
	
	flags["SHIZZY_NOMMED_MIKA"] = 1;
	
	if (pc.isCrotchGarbed()) output("\n\nYou and her both redress.");
	else output("\n\nShe redresses.");
	output(" As she's putting her pants back on, she makes sure to catch them just under her fat cheeks, jiggling her curvy rump in your direction. <i>\"You've got a great mouth; I'd love to see if the rest of you lives up.\"</i> She gives her booty a quick slap before picking her tools back up.");

	pc.orgasm();
	
	output("\n\n<i>\"Anyway, if you're wondering how shit's going, I'd say I'm about forty percent done. I think I should be able to get you up and flying in another hour.\"</i> Well that's good. Getting this whole thing behind you will be a huge relief. <i>\"If you don't have anything else to do, you might as well come along. Maybe you'll knock a few minutes off.\"</i> Well, it's that or just standing around some more. You follow her to the next point of repair, ready to assist the diminutive mechanic.");

	addButton(0, "Next", shizzyIntroductionPartSorf, new Array(destination, true));
}

public function shizzyNoMikas(destination:String):void
{
	clearMenu();
	clearOutput();
	showMika();
	author("QuestyRobo");
	
	output("As tempting as it is, you're not in the mood for this. You grab the little cowgirl and lift her off. She resists at first, but acquiesces when she realizes that you're not going to go for it anyway. <i>\"Dull ass.\"</i> She grabs her pants and pulls them back up in a single stroke before picking her tools back up. Rude.");
	
	output("\n\n<i>\"Anyway, if you're wondering how shit's going, I'd say I'm about forty percent done. I think I should be able to get you up and flying in another hour.\"</i> Well that's good. Getting this whole thing behind you will be a huge relief. <i>\"If you don't have anything else to do, you might as well come along. Maybe you'll knock a few minutes off.\"</i> Well, it's that or just standing around some more. You follow her to the next point of repair, ready to assist the diminutive mechanic.");

	addButton(0, "Next", shizzyIntroductionPartSorf, new Array(destination, false));
}

public function shizzyIntroductionPartSorf(args:Array):void
{
	clearMenu();
	clearOutput();
	showMika();
	author("QuestyRobo");
	
	var destination:String = args[0];
	var ate:Boolean = flags["SHIZZY_NOMMED_MIKA"] != undefined;
	
	output("You spend the next few minutes doing small things; passing along tools, bringing up the ship's blueprint when she needs it, generally just making sure things go smoothly. After about half an hour, Mika is soaked in sweat and calls a break.");
	output("\n\nShe settles down against a wall, pulling out a big, long, chocolate coated bismarck. It's as long as her torso, and thick as her arm. She looks down at the rich pastry with reverence, a bead of drool forming at her mouth. She pops the pastry down against her own chocolate tits, putting the tip tantalizingly close to her mouth. A soft moan escapes her lips as her breath goes ragged.");
	output("\n\nHer wide tongue teases the tip of the confection, slurping up a mouthful of chocolate, with much more still to go. Her tonguing grows more frantic as she becomes more fixated on getting more sweet sugar. Her arms close around the perverse dessert as she pulls it closer to her lips. She kisses the \"crown\" of the pastry, shuddering as she starts to work her way down.");
	output("\n\nShe starts to deepthroat the oversized pastry, moaning as her senses are overwhelmed by sweetness, and chocolate-tinged spittle seeps out the corners of her mouth. You have to admit, the sight of it is getting you hot under the collar, and that's almost certainly the point. That doesn't mean she isn't enjoying it, though. Her nipples are practically spearing through her top, dribbling enough milk to soak through her top and send sprays of white milk rolling down her body.");
	output("\n\nHer chest is heaving hard, her motions are growing quicker. Her moans grow louder and more fevered as she reaches a crescendo. Her arms squeeze harder, and her head motions stop as she bites down. A spray of thick white cream spills across her face, making it look like she's just gotten out of a New Texas bukkake party. It takes her a second to swallow the near foot of bismarck in her mouth; when she finishes, she gasps, both for breath and in contentment. Did she really cum from doing that?");
	output("\n\nMika pants heavily as she recovers from her sugar-induced orgasm. <i>\"Did you like that, pervert?\"</i> She huffs, as a huge grin spreads over her face.");
	output("\n\n<i>\"Obviously not as much as you.\"</i> You jab. She chuckles before getting back to eating her pastry.");

	if (ate)
	{
		output("\n\nHalfway through, she reaches back into her bag and pulls out another doughnut, tossing it to you. <i>\"You ate your dinner like a good [pc.boygirl] so here's dessert.\"</i>");
		if (pc.isNice()) output(" Oh, that's nice. You thank the dusky shortstack, and start chowing down.");
		else if (pc.isMisch()) output(" That's nice and all, but you were expecting a bit more of a 'dessert'. <i>\"Later, can't go around fucking too much while I'm on the clock. So get your ass ready for later!\"</i> Oh, sounds like fun.");
		else output(" What, just one? <i>\"It's a reward for eating me out, you cock, take it or leave it.\"</i> You stare each other down, but eventually you back down, just wanting to enjoy your sweet.");
	}
	else
	{
		output("\n\nYou stare at her as she eats her pastry, silently asking her to share. At least it was silent until your stomach opens its yap and growls out. She glares at you. <i>\"You ain't having my sweets. Here.\"</i> She reaches into her bag, pulls a giant plastic container of salad, and throws it at you. <i>\"Tiffa gave me that crap, said I don't eat well; moron. You can have it.\"</i> Well, better than nothing.");
	}
	
	output("\n\nYou finish your snack quickly, as does she. She gives herself a nice, long stretch, reaches into her bag, grabs a drink, and reclines back. <i>\"Soooo, you're Victor's kid?\"</i> She asks as she takes a big gulp of her drink.");
	output("\n\n<i>\"Yeah" + (pc.isAss() ? ", what's it to you" : "") + "?\"</i> Of course it's not like dad was a nobody, but it's still a weird thing to ask.");
	output("\n\n<i>\"Nah. I just saw him he had his little 'meetings' with my parents. And yeah, I mean exactly what you think I mean. You know, I could introduce you to at least two of your sisters. There's probably more than that, that bitch never kept track of who belonged to who after a while.\"</i>");
	output("\n\nNot the most flattering way to talk about her mother, you comment.");
	output("\n\n<i>\"Yeah, it's almost like there's a reason for that, but you're not my shrink.\"</i>");
	output("\n\nOkay, that's going to a awkward place, time to change subjects.");
	output("\n\n<i>\"So, those are some nice implants.\"</i>");
	output("\n\nHer expression lights up at your statement. <i>\"Hell yeah they are! Back on that dump, New Texas, I never thought I'd get real ones. It's a power armor interface, and of course the strength mods to go with them.\"</i> She flexes her arm, showing off her natural muscles, as well as some faintstreaks of soft, blue light that must be her mods. <i>\"And I'm not talking about some cheap, standard issue crap, I'm talking XV-class battlesuits, baby!\"</i> She's almost drooling as she gushes over tech specs.");
	if (pc.isMisch()) output(" Wow, pastries, robots, what doesn't this chick get off to?");
	output("\n\n<i>\"Oh man, oh man, oh man! I got this big-ass autocannon, tested it out on a decommissioned cruiser, and I blew a big hole in the hull in like four shots. Oh, and I can mount this plasma cannon on the shoulder, and the payload on that thing is fan-fucking-tastic. You can joke all you want about me getting off to this, but when you feel the heat and vibration coming off a plasma railcannon, and then watch that bright flash arc through the air before melting everything in a 50 meter radius, you gotta beg your body not to get turned on.\"</i>");
	output("\n\nHer hand is actually moving down her pants... She's really getting off from this! <i>\"What's that look? You're telling me that you've never put an L31 gatling laser between your legs and set it to low so you could feel the vibration and heat on your pussy while it shreds an old, abandoned barn to charred pieces? You never hooked a vibrator to a ZK rifle so that it shook every time you shot it? You never saddled a bomb disposal cylinder while an explosive went off inside? Fuckin' weirdo.\"</i>");
	output("\n\nYou don't even have a response to that, just... wow. <i>\"It's a joke, you know... except the first one, that's just something I like to do on weekends. It's not always barns, just whatever old building I can find that nobody gives a crap about anymore.\"</i>");
	if (pc.isNice()) output("\n\n<i>\"That's, uh, great. It's nice to have hobbies.\"</i>");
	else if (pc.isMisch()) output("\n\n<i>\"Yeeeeeah, that makes it <b>so</b> much better!\"</i>");
	else output("\n\n<i>\"What the fuck is wrong with you?\"</i>");
	output("\n\n<i>\"Bahahahaha! Alright, enough screwing around, back to work!\"</i> Anything's better than falling deeper into this madness.");
	
	addButton(0, "Next", shizzyIntroductionPartForParting, destination);
}

public function shizzyIntroductionPartForParting(destination:String):void
{
	clearOutput();
	author("QuestyRobo");
	
	if (annoIsCrew())
	{
		showName("SHIZUYA\nAND CREW");
		showBust("SHIZUYA_NUDE", "ANNO");
		
		output("Anno meets back up with you after fixing the circuits, and the three of you get to work");
		if (pc.characterClass != GLOBAL.CLASS_ENGINEER && pc.intelligence() < pc.intelligenceMax()) output(", though you're not exactly much help, given your inexperience with this sort of thing");
		output(". As you're finishing up, you hear a loud rumbling coming down the hallway. Quickly you realize that it's Shizuya, carting several large coolers and crates on a dolly. She waves at you as she approaches, stopping in front of you in order to chat.");
		output("\n\n<i>\"Suuuuuuuuuuuuuuuup?\"</i> She scans across the three of you, looking for a response.");
		output("\n\n<i>\"Wow, that's a lot of food. Are you cooking for your whole crew or something?\"</i> Anno says, 	ogling Shizuya's curves. She's changed out of her combat gear into a simple T-shirt and skirt outfit that leaves very little to the imagination as they hug tightly to her curves. Her ass juts out like a drink tray, and it firmly jiggles with even the slightest movement. Her tits are obviously too big for her shirt; it's stretched so thin that it's almost see-through. And that's not even mentioning her bulge. Ho boy! You'd consider her mauve skirt generously spacious, even with her ass pushing out so obviously, but nothing could hide that mound of fuckmeat. It's so busy that it's impossible to make out anything other than the fact that her balls are gigantic, and she's got quite a bit extra down there.");
		output("\n\nYou and Anno are so busy tracing her curves, and \"curves\", that you don't even answer. Anno seems especially enamored, to the point where she struts up to Shizuya, shamelessly eyeing her crotch.");
		output("\n\n<i>\"Oh, we're doing good. Saaaay, you've got a lot of food there...\"</i> She snuggles up to Shizuya, the size difference making it so that she's face-to-face with the increasingly strained bulge. Both of their faces are flushed by this point, and Anno is visibly panting. Suddenly Anno grabs one of the amazon's giant balls, roughly groping and squeezing it through the thin fabric of her skirt. <i>\"Do you have any dessert in there? Because you've got a looot down here, and trust me when I say that me and [pc.name] can get really, <b>really</b> hungry.\"</i>");
		output("\n\nYou wonder what's gotten into Anno, until a powerful smell hits your nostrils.");
		if (pc.isTreated()) output(" Blood rockets to your [pc.crotch] as some of the most potent pheromones you've ever smelled assault your senses. Your brain is about to overload; it's like standing next to a New Texas orgy and not getting to join in!");
		else output(" The smell almost burns your nose, and that feeling trails its way through your body, spreading heat through your body, and each time you inhale, the heat gets worse.");
		if (pc.hasCock()) output(" Your [pc.cocks] rocket" + (pc.hasCocks() ? "s" : "") + " to full hardness, and then some, already starting to drool a bit of pre.");
		if (pc.hasVagina()) output(" You feel your [pc.pussy] clench, soaking itself in preparation for penetration, " + (pc.isBimbo() ? "that you really want to happen as soon as possible!" : "that you really hope isn't going to happen right now, in the middle of fixing your ship."));
		output("\n\nIt gets even worse when the intoxicating giant lets out a weak moan as something rockets into her skirt with a loud tearing sound. Your [pc.eyes] go wide, as do Anno's at the sight of two massive bulges tenting Shizuya's skirt. Her breathing is ragged, and her eyes are glassing over. Her hidden cocks are spraying cum with the ferocity of what would be a mind-breaking orgasm for any normal person, but the slightly translucent texture of it tells you that it's only pre. Though, it's certainly thicker than most pre you've seen.");
		output("\n\nAnno's hands dart from just fondling her through her skirt, to almost throwing it off to get at the real prize. You can see everything now; four massive balls that Anno can't even fit in her hands, and two giant, dark red horsecocks, covered in feline-like nubs. Anno strokes along the bottom shaft, slowing down when she goes over the nubs to make sure that they're especially stimulated.");
		output("\n\n<i>\"For me, Shizuya? You shouldn't have! You always were a good coc-cook, so generous with your portions, too! Ooooh, you're brewing up a big load of 'dessert' here, aren't you? How about you share?\"</i>");
		output("\n\nHer pupils are like the pinpricks of an addict looking at another fix; her skin's completely flushed and covered in a thick layer of sweat, and her hand is like a blur as she vigorously jacks off Shizuya. The reasonable part of your brain is screaming at you that this is going too far, that Anno's too far in, and this needs to stop. But the rest of your mind and body is so saturated in lusty pheromones that those thoughts are immediately filtered into an irresistible desire to get on your knees and start sucking down the ever thickening shots of cum rolling out of her twinned slits.");
		output("\n\nHer shots are rapidly gaining in thickness, volume, and velocity. Any hint of translucency is gone, leaving you wondering if she's already cumming, or if she's just that potent. The amazon was whimpering meekly at Anno's advances before, but that's quickly starting to change. The hesitant panting and soft moans are being replaced with an almost bestial, throaty pant. Her glassed over eyes are starting to gain a new focus, but rather than her normal clarity, it's a kind of predatory stare, like a leopard that's just spotted its prey. The red hints near her iris are even starting to expand, converting her jade pupils a piercing shade of crimson.");
		output("\n\nHer hand begins to move, jerkily, slowly finding their way toward Anno's head. Your white-haired companion is far too lost to notice, even when one of Shizuya's massive hand is resting right on her head. Anno is practically worshiping the oversized catgirl's cock and balls, polishing both with the kind of reverence that one would expect out of a devotee polishing a statue of their god. Shizuya's other hand clenches, the reason unknown. She's about to do something, when Anno suddenly drops to the floor.");
		output("\n\nYou completely forgot Mika was even here. Somehow she's not affected by the pheromones, and seems to have had enough of this. She's dragging Anno away by the ankle as she tries her best to kick and scream. When they're far enough away, she takes a small bottle out of her pocket, uncorks the top, and- SWEET VOID, THAT STINKS! All the arousal drains out of your body like you were a faucet that just burst open. It's so bad that you nearly throw up on the spot, and Anno and Shizuya react the same way.");
		output("\n\n<i>\"Well, that was fun, but I don't think [pc.name] over here would appreciate their ship getting flooded, and I ain't about to refix all the shit you short out.\"</i> Shizuya is gagging, but she manages to cough out a \"thanks\" before getting on her way.");
		output("\n\nA few minutes pass before you and Anno recover. Mika, however, seems completely unaffected by all of it. <i>\"Yeah, Shizuya can be a bit of a walking biohazard sometimes. If I didn't get an implant that let me turn off my sense of smell, I'd probably be her cocksleeve most of the time... Not that I'd mind that, but, ya know...\"</i> She blushes hard at that last admission. <i>\"A-anyway, I carry around some strong smelling salts to diffuse these sorts of situations. Impromptu orgies are nice, but productivity and shit is more important.\"</i>");
		output("\n\nAnno stares at you, wordlessly, wide-eyed, silently apologizing for getting so carried away. You pat your pup on the head, and Mika joins you. The pats give way to some light ear scritching, followed by heavier ear scritching, until she's nothing but a pile of content floof in your hands.");
		output("\n\n<i>\"Hmm, you've a well trained pet here, Steele. Glad she's not one of those ausar who get really uptight about the pet stuff. That means we can have a </i>lot<i> of fun together.\"</i> Anno perks up at that.");
		if (flags["ANNO_PETPLAYED"] != undefined) output(" She does love her pet play, after all.");
		else output(" You didn't know she was into that kind of thing. Maybe you should follow up on that?");
		output(" <i>\"Anyway, back to work, guys.\"</i>");
	}
	else
	{
		showName("SHIZUYA\nAND CREW");
		showBust("SHIZUYA", "MIKA");
		
		output("The repairs go a bit slow with just the two of you, but you manage to get at least this section done in a decent amount of time. Just when you finish, you hear something barreling down the hall. You turn to see Shizuya carting several crates and coolers behind her. She waves at you as she closes in, a big smile on her face.");
		output("\n\n<i>\"Yoooooooooooooooooooooooooooooooo!\"</i> She holds until coming to a stop in front of you. <i>\"How's it comin' along?\"</i>");
		if (pc.tallness < 5 * 12 + 2) output(" Her eyes are lit up like supernovas as she looks down on you. <i>\"Must be hard for ya two little cuties to fix this big ship all by yourselves. I could hold off on the food for a bit, keep ya company for a while.\"</i> She looks very excited at the prospect, a little too much, and looking down makes it plain why she is.");
		else output(" She's practically beaming at the two of you, radiating a sense of happiness, excitement, and... something that you can't quite place. <i>\"Hmm, you guys must be getting pretty lonely doin' this all by yourselves. Maybe I could, uh, hang around with you guys for a bit?\"</i> That's a little spontaneous; doesn't she have to prepare the food? Why would she... oh, you see pretty clearly why.");
		output("\n\nShe's changed out of her military gear into a much more casual outfit; a black T-shirt with some faded writing on it, and a long, mauve skirt that's not even close to being able to hide what's inside. " + (pc.tallness < 8 * 12 ? "You're face-to-face with" : "You look down and see") + " a massive, throbbing tent in her skirt, pulsing almost violently as you notice it.");
		output("\n\nMika sees it too, but seems composed and unsurprised, despite the obvious flush spreading across her face. <i>\"Nice try, but no, we're not gonna get anywhere if we're just sucking you off all day.\"</i>");
		output("\n\n<i>\"Come ooooooon! I was stressin' out so much today that I forgot my morning session! I got one for each of you.\"</i> You hear a faint tearing noise coming from her busy bulge. She yelps and quickly grabs at it, compressing it to try and keep a flood of cock from spilling out of her panties. It doesn't work, and almost immediately two massive tents throw up her skirt, pointing right at the two of you.");
		if (pc.isBimbo()) output("\n\nYummy! You reach out and grab one of the bulges, causing the flustered feline to groan out loud. It's just not right to leave a big old cock hanging like that! You give her a few quick strokes, admiring how quickly her skirt is soaked in off-white pre. Pheromones are rolling off her like water off of the rocks at the bottom of a waterfall. You lift up her skirt and squee when you see the feast on offer. A thick, blunt flare with a deliciously drooling cum-slit, attached to a nubbed horsecock that's obscenely thick and deliciously long. Its twin is staring Mika right in the face, but she's not sucking it, for some reason.");
		else 
		{ 
			output("\n\nA sudden rush of pheromones hits you, as if her springing erections were catapults trying to break down your mental walls and siege your senses. Shudders run down your whole body, followed by pulses of sensual heat as your body grows more aroused by the second. You try and pull yourself back, but your body isn't listening, and instead you find your hand has found its way to one of her moist tents while you weren't paying attention! It's almost impossible to pull off, every time you try, another burst of pheromones drowns out the thought.");
			output("\n\nYour grip quickly turns into an impromptu handjob, causing the dick that you're grabbing to absolutely coat the front of her skirt, driving you even further into your lust-hazed cock milking. Your jerks grow so frantic that you start to lift her skirt up. It's unintentional at first, but once you catch a peek of her cock, something snaps. Before you know it, you've flipped up her dress, revealing two of the biggest horsecocks you've ever seen! Endless, fat, nub covered inches stretch out behind a wicked looking flare, and a cumslit that's leaking like a faucet.");
			output("\n\nYour mouth feels dry, like you haven't had a drink in hours, and you're face to face with a spraying fountain. You want to put your lips around it, you <i>need</i> to taste it! Despite what's happening to you, Mika seems completely unphased. She seems interested in the amazon's phallus, but not compelled to do anything with it, like you are.");
		}
		output("\n\nMika reaches into her pocket and pulls out a small vial.");
		if (pc.isBimbo()) output(" Oh, maybe she just wanted to get some lube before she dug in. That's a lot of dick for such a little mouth, after all.");
		else output(" It's small and black, and you can't tell what's in it. There's a handwritten label on it, but it's hard to read from this far away.");
		output(" She casually uncorks the vial, and then just stands there, holding it up. You wonder what she's... GODS AND STARS, THAT SMELL! It's like someone rolled a family of skunks into a ball and threw them at your face!");
		output("\n\nAny hint of arousal drains from your body as you struggle not to gag. Shizuya has retreated to the other side of the hall, covering her mouth and nose with both hands.");
		output("\n\n<i>\"Bad kitty, bad! No blowies, go make food!\"</i> Mika screams, waving the vial at Shizuya. She whimpers, grabs her cart, and scurries off to the kitchen.");
		output("\n\nIt takes you a minute to recover, even then, your eyes are still watering. Mika, however, seems unaffected by it. <i>\"Yeah, Shizuya can be a bit of a walking biohazard sometimes. If I didn't get an implant that let me turn off my sense of smell, I'd probably be her cocksleeve most of the time... Not that I'd mind that, but, ya know...\"</i> She blushes hard at that last admission. <i>\"A-anyway, I carry around some strong smelling salts to diffuse these sorts of situations. Impromptu orgies are nice, but productivity and shit is more important. On that note, let's get back to work.\"</i>");
	}

	output("\n\nThe last of the repairs go pretty quickly, the smell of food gradually filling the halls of the ship; It starts simple with the unmistakable smell of cooking meat, followed by frying potatoes, a myriad of spices, and finally an array of sweet smells. It makes the rest of the repairs much more pleasant, at least until your stomach starts rumbling.");
	output("\n\nThe repairs don't go uninterrupted, and you soon see Adelline and Winston coming down the hall, arguing, as they seem to usually do.");
	output("\n\n<i>\"I keep telling you, no amount of peanut butter can block a bullet, and I don't believe your ridiculous story.\"</i>");
	output("\n\n<i>\"Addy, I've been at this shit for forty-two fucking years, and I'm telling you, Roddy blocked a machine gun by covering himself in two feet of peanut butter!\"</i>");
	output("\n\n<i>\"You spin these ridiculous tales every day, and no one ever believes you. Why are you so indignant about this one?\"</i>");
	output("\n\n<i>\"BECAUSE IT'S TRUE, DAMMIT; and so are at least...\"</i> Winston pauses for thought. <i>\"Forty - eight percent of the other ones.\"</i> Truly enlightening conversations these people get up too. The husky huskar looks at you intently as he passes by. <i>\"Kiddo, stock up on peanut butter, that shit can save your ass.\"</i>");
	output("\n\n<i>\"Please pay no attention to him.\"</i>");
	output("\n\n<i>\"NO, pay all of the attention to me! She likes to think that she knows everything, but she hasn't been through the shit I have. Forty-two years, kid! Forty-two years of learning to kill; I've survived on paper, climbed mountains with sporks, killed twenty people with a pool set, skinned a");
	if (silly) output(" space deer with a melon rind, you young whipersnappers");
	else output(" conovian hopper with a melon rind, you people"); 
	output(" don't get to TELL me what's possible!\"</i>");
	output("\n\nAn awkward silence falls over all of you. Through it all, Winston retains the same, indignant look. A few moments pass before Winston starts reaching into one of the large pockets of his pants. He pulls out a small jar of peanut butter and places it in your hand. <i>\"Stay safe...\"</i> And he, and Adelline just continue on their way, not saying another word.");

	addButton(0, "Next", shizzyIntroductionPartTimeJobForAFiver, destination);
}

public function shizzyIntroductionPartTimeJobForAFiver(destination:String):void
{
	clearOutput();
	
	output("Finally, it's done. With the flip of a few switches, the engines whur back to life, and all seems well. " + (annoIsCrew() ? "All" : "Both") + " of you take a well deserved rest. Several people come back and forth from the ship. Some of them are people you recognize, others not so much.");
	output("\n\nA dark skinned human girl in some very skimpy, egyptian looking outfit strikes up a conversation with Winston. You're out of earshot, but the flirtatious looks, and the kiss when they finish, tell you that that's probably his girlfriend. She's pretty flat up top, but damn does she have it going on down below. She walks up and past you, giving you a casual \"hey\" in an... almost masculine voice... That's not a girl, is it?");
	output("\n\nBefore you can think about that, Shizuya comes rushing up to you, buck naked except for an apron with a cartoon cat in a chef hat on it. <i>\"Miiiiiiika, I need ya milk!\"</i> Mika stares at her with a scowl and a blush.");
	output("\n\n<i>\"Why mine? You've got plenty!\"</i> Indeed, you can see large damp spots on her apron where her big nips are tenting it; and another one down near her crotch, but you don't think she's using that 'milk' for cooking. " + (pc.isBimbo() ? "You wish she would, though." : "At least you hope she's not."));
	output("\n\n<i>\"Yours is sweeter than mine, and I want this sauce to be sweet to compliment the meat.\"</i> She looks over at you" + (annoIsCrew() ? " and Anno. <i>\"You two" : ". You") + " can come too, it's your kitchen after all.\"</i> Well, why not, you're going to be eating whatever she's making, so you might as well see it beforehand.");
	output("\n\nShizuya books it back to the kitchen, keeping you and Mika" + (annoIsCrew() ? " and Anno" : "") + " in tow. Being behind her naturally gives you a great view of her ass. Her natural sway, even when rushing, exaggerates the already massive bulk. It's a strange contrast to see how muscular her back is, and then her ass is almost like a bowl of jelly with how violently it jiggles.");
	output("\n\nYou're so transfixed by it, that you don't notice when she stops and thrusts her booty at you. Instinctively, you put your hands out to block the incoming object. They sink in as they collide with dozens of pounds of assflesh. She's looking back at you with a sly grin and, with a single clench, her booty goes from jelly to iron. Your hands almost bounce right off, as the plush-posteriored feline sticks her tongue out, slightly. Very funny.");
	output("\n\n<i>\"Lotta control back there, wanna try it out?\"</i> Umm...");
	output("\n\n<i>\"Come on, Shizzy, we're starving here. Save the fucking for after dinner.\"</i> Mika already has her top off, letting her big, chocolate tits flail free, and letting you see that her freckles spread to more than just her face.");
	output("\n\n<i>\"Okaaaay... Can I get both of you" + (annoIsCrew() ? " and Anno" : "") + " along for it?\"</i> She looks at you with a mixture of lust and disappointment.");
	output("\n\n<i>\"If " + (annoIsCrew() ? "they say" : "[pc.he] says") + " yes, of course. I've been meaning to test out some new techniques.\"</i> Mika says, off-hand.");

	if (annoIsCrew())
	{
		output("\n\nShizuya glances over at Anno, who's been staying a bit further back, probably to avoid what happened earlier. <i>\"Sure, I'd love to pick up where we left off; privately, of course.\"</i> Shizuya blushes at the mention of the incident earlier.");
		output("\n\n<i>\"I'm really sorry 'bout that whole thing. My pheromones get really thick if I get pent up, and then you started rubbing me like that and... Ya know I lose it pretty easy these days.\"</i>");
		output("\n\n<i>\"You don't have to say sorry, just make sure you only lose it at the right time from now on.\"</i> They give each other knowing, lustful smiles, which quickly turn to you.");
	}
	else output("\n\nThey both stare at you with hunger in their eyes, like predators looming over" + (pc.tallness >= 5 * 12 + 2 ? ", or under, in Mika's case," : "") + " their trapped prey.");

	output("\n\nBefore you can respond, the group starts moving again, picking up the pace after your lusty little detour.");
	output("\n\nYou open the door to the kitchen and see Adelline" + (yammiIsCrew() ? " and Yammi" : "") + " working the stoves. There's a massive pile of food already prepared behind " + (yammiIsCrew() ? "her" : "them") + " piles of steaks of various cut, all dripping with juices; baked potatoes, cut open and stuffed with an overflowing amount of sour cream, chives, melted cheese, bacon bits, and fried onions; a massive pot of steaming stew, full of various meats and vegetables; a salad bowl that Mika could probably comfortably sleep in filled with fruits and vegetables that you haven't even seen before, but look absolutely delicious; and lastly, a plate of strange kebobs, garnished with odd-looking, sliced fruit.");
	output("\n\n<i>\"There you are. Did you stop to jerk off, again?\"</i> Adelline is focusing on you now, but she's not missing a beat.");
	if (flags["MET_VANAE_HUNTRESS"] != undefined || flags["MET_VANAE_MAIDEN"] != undefined) output(" Not really surprising; you know first hand how dextrous they are without using their eyes.");
	else output(" You guess living without eyes, they'd get pretty good at doing things without them.");
	output("\n\n<i>\"Noooooo! Well... maybe almost, but I need to get food ready, and save up for the after-dinner special.\"</i> She gives her balls a quick squeeze, and moans in surprise as a spray of pre slams against the ground below her. <i>\"Okay, okay, too much!\"</i> She brings out her codex and pulls something up. You can't see what it is, but whatever it is causes her to grimace, and her burgeoning erections to wilt instantly.");
	output("\n\n<i>\"Bleh, better. Anyway, come on Mika, we need four cups.\"</i>");
	output("\n\n<i>\"Yeah, yeah.\"</i> The miniscule moo follows Shizuya over to the stove. Shizuya lifts her up onto the counter, where she gets to work milking herself into a measuring cup.");
	
	if (yammiIsCrew())
	{
		output(" As Shizuya takes back over, Yammi finishes up and comes up to you.");
		output("\n\n<i>\"Hey boss, how are you doing?\"</i> You're fine, but she seems a bit winded. <i>\"Oh, I'm fine, just a lot of cooking, and, uh, dealing with Shizuya.\"</i>");
		output("\n\n<i>\"Dealing?\"</i>");
		output("\n\n<i>\"Yeah, she was really pent up when she rushed in here. Don't worry, you work on New Texas long enough, you either learn to deal with situations like that well, or you get used to raising a lot of kids, and I can tell you that I'm not a mom.\"</i> She seems to be almost boasting about that.");
		output("\n\n<i>\"She's magic I tell ya.\"</i> Shizuya is incredibly cheery, doing a little dance in place as she continues to cook. Occasionally she leans over and takes a drink from Mika's dribbling teats as she sits on the edge of the counter.");
		output("\n\n<i>\"I mean, we did, kind of, clog up the wash sink and make a mess, but we cleaned it up... eventually.\"</i> Yammi seems a bit sheepish as she says that, and looking over her shoulder, there are still some large, white puddles strewn about. <i>\"... Mostly... Don't worry, none of it is in the food, I think.\"</i>");
	}
	else 
	{
		output("As Shizuya takes back over, Adelline seems like she's taking a break, or at least taking out some time to speak with you...");
		output("\n\n<i>\"Apologies for the delay. When I arrived here, I found our dear Shizuya desperately trying to unclog the wash sink, clean up her 'mess', and prepare the food. Though, I must say, she did a better job than I expected. Unfortunately, she also spoiled her dinner.\"</i> She shoots a piercing stare at the libidinous feline, who turns her head in shame as she tries to stifle a loud burp. <i>\"Fortunately, I've ensured that none of it got into the food.\"</i>");
	}		
	
	if (pc.isBimbo()) output("\n\n<i>\"Aww, all that yummy cum... Can I have some anyway?\"</i> Shizuya's cat-like pupils go wide at that, and she flashes you a huge smile, two thumbs up, and some enthusiastic nodding, followed by a light pat on her exposed sack. Yay, cum" + (silly ? "mies!" : "!"));
	output((yammiIsCrew() ? "\n\nYammi" : "\n\nAdelline") + " finishes her brief break and gets back to work, leaving you to just sit and watch them prepare the food. The " + (yammiIsCrew() ? "three" : "two") + " seem to be in perfect sync as they pass from pan to pot and back again; turning meat, stirring sauces, and putting vegetables on to fry. One particularly impressive move is when Shizuya flips a pair of steaks from a pan into a bowl of caramelized onions, and Adelline pours a pan of sauce over them, as soon as they land, without even looking.");

	if (annoIsCrew())
	{
		output("\n\nAnno seems to be amused by the situation as well. <i>\"Holy crap, Shizuya, I remember when you tried that before, the steaks landed right on your head!\"</i> She's chuckling and smiling as she recounts the story.");
		output("\n\n<i>\"Maaan, I thought my hair caught fire, and I was like 'oh fuck, I'm gonna die, I'm gonna die!' Yikes. But yeah, Adelline taught me some stuff. I can flip and throw and toss and all that shit. You want me to teach ya? I might be a little hard since you're, like, half my size and probably like a third as heavy since you don't have anything big down there... Yet...\"</i>");
		output("\n\n<i>\"What's that supposed to mean?\"</i> Anno says, half confused, half amused.");
		output("\n\n<i>\"Come oooooooooon, you've never thought about it?\"</i> There's an obvious tent in her apron now, and she's so distracted that she almost drops a pan of fried rice.");
		output("\n\n<i>\"Not seriously, I can just " + (flags["ANNO_OWNS_LIGHT_STRAPON"] == undefined ? "get a" : "use my") + " strap-on for that.\"</i>");
		output("\n\n<i>\"Pfft, it's not the same.\"</i> She huffs.");
		if (flags["ANNO_OWNS_LIGHT_STRAPON"])
		{
			output("\n\n<i>\"Good enough for me.\"</i> Anno pats her crotch in satisfaction.");
			output("\n\n<i>\"But is it good enough for me?\"</i> Shizuya cocks her ass toward Anno, takes one of her hands, and spreads her cheeks open, revealing her " + (silly ? "bootyhole" : "anus") + " and her big, puffy pussy, dripping with thick, off-white juices.");
			output("\n\n<i>\"Mmmmh, we'll have to see about that later, won't we?\"</i>");
		}
		output("\n\n<i>\"Oh, anyway, guess what I brought over?\"</i> Shizuya motions to a crate on the far side of the kitchen. Anno raises an eyebrow and goes over to open the crate.");
		output("\n\nAs she lifts the lid, Anno yells out in excitement. <i>\"Sweet stars, is this what I think it is!?\"</i>");
		output("\n\nShizuya pulls out a massive bottle full of a clear, bubbling liquid. <i>\"Hell yeah, genuine General Grindguttz' Pussy Burner, classified as a lethal poison on thirteen different planets.\"</i> It certainly looks the part; every small shake Anno makes causes the liquid to bubble up like it's about to blow up the bottle, and on closer inspection, the liquid that looked clear from a distance is actually a roiling soup of faint, translucent colors.");
		output("\n\n<i>\"Last time we had this... fuck, I don't even remember what we did, but you don't wake up in a busted C-982 with half a ton of juiced oranges without something cool happening, right? Of course I felt like I got kicked in the head by a recoiling railgun for a week afterwards, so I'm probably going to pass on this.\"</i> She brings the bottle up to her nose, and recoils after just a small sniff. <i>\"Oh, Void! I forgot how strong this stuff smelled! I didn't even take the top off!\"</i>");
		output("\n\n<i>\"Yeah, the vapors on that stuff are like breathing vodka, it's fuckin' awesome. All this Treatment stuff really bumped up my tolerance, so I can actually drink that stuff straight now.\"</i>");
		output("\n\n<i>\"Hoo boy, and I was just telling [pc.name] earlier about that time you outdrank that big asshole.\"</i> Shizuya snickers at that.");
		output("\n\n<i>\"Hey, cap, did she mention how they had to pour me into a taxi after, because I couldn't feel my legs? And that was me winning, you should've seen the other guy!\"</i>");
		output("\n\nThe two spend the next half an hour reminiscing about the past. There's happy stories, funny ones, and a few sad ones that cap off the mood. A hearty handshake brings the spirits back up, and a smile to their faces.");
		output("\n\n<i>\"All that's behind us, though. A new start, for both of us, let's just keep making the best of it!\"</i> A little cheesy, but a very nice sentiment. <i>\"Anyway, food's done! We're gonna serve up on our ship, since I have to feed the crew, and you probably don't want a mob of weirdos running around your ship. Grab a cart and let's get going.\"</i>");
	}
	else
	{
		if (pc.isNice()) output("\n\n<i>\"That's impressive!\"</i>");
		else
		{
			output("\n\n<i>\"Are you trying to show off?\"</i> You ask.\n\n<i>\"... Maaaaaaybe, you like it?\"</i>"); 
			if (pc.isMisch() && silly) output("\n\n<i>\"Hey, that was pretty good.\"\n\n\"I have crippling depression.\"\n\n\"Seriously?\"\n\n\"No, that was an earlier draft, I'm pretty well off now.\"</i>"); 
			else output("\n\n<i>\"Meh.\"\n\n\"Feh.\"\n\n\"Bleh.\"\n\n\"Heh.\"</i>");
		}
		output("\n\n<i>\"Gonna be a bit longer here, so, uh, wanna talk some more? I can... ya know... say things, about stuff... that I did.\"</i> That sounds... descriptive. <i>\"I mean, I kind of already told you all the interesting stuff a bit ago. Well, the interesting stuff that I'm comfortable with.\"</i>");
		output("\n\n<i>\"Bad stuff?\"</i>");
		output("\n\n<i>\"Yeeeeeeeeah. It's, like, the stuff before I got all " + (silly ? "swole." : "huge.") +" I mean, I'll tell ya, even if it's kind of... weird for me. Gotta spend time somehow, and ya know, I like ya.\"</i> She's known you for less than a day, though. <i>\"I get to like people pretty quick, okay? It's like, I meet people, talk to 'em, and then we're fucking in a few hours. I know it sounds weird, but it just sort of happens that way.\"</i> That does seem to be the way of things, for you, at least. <i>\"So, you want some story time?\"</i>");
		output("\n\n<i>\"Why not?\"</i>");
		output("\n\n<i>\"Ya know, I don't really have time for specifics, but I'll give you the jist of it. I used to be tiny as shit, like, just a bit bigger than Mika. Little baby nerd Shizuya. I grew up on some ass backwards fuckin' Kaithrit colony, don't even remember the name now, got outta there as soon as possible. Reasons and shit. I don't wanna get into it, cause I don't wanna get pissed and ruin the food, boils my fucking blood, I tell ya. Anyway, I did good enough at my new school to get a scholarship to a nice university. I met a guy who was a big wig at a company called Akkadi R&D, apparently he was a professor there and had his own lab just off of campus. Long story short, yadda yadda yadda, He got me a job at Akkadi after I graduated.\"</i>");
		output("\n\n<i>\"That didn't sound so bad.\"</i>");
		output("\n\n<i>\"Oh, we're at the bad part. I got pushed from project to project for a few years before I got put on this big one. Miniaturizing warp gates, big fuckin' deal stuff. That was the best time of my life, I'm telling ya; made great friends, got a boyfriend, felt good about myself for the first time in a long time.\"</i>");
		output("\n\n<i>\"This still sounds pretty...\"</i> You stop as you see tears welling up in her eyes. <i>\"And then it all went fucking wrong. The project went to shit; we tested it too damn early, and almost everyone who went through died... including Roy.\"</i>");
		output("\n\nOh.");
		output("\n\n<i>\"He went in, an... a-and he never came back out. He never came out... It was all my fault! It was all my fault! It was all my...\"</i> Shizuya starts freaking out at the memories, but Adelline quickly puts a stop to it, roughly grabbing her by the shoulders, turning her to face her, and looking her straight in the eye. No words are exchanged, but they don't seem to need to be. Shizuya calms down and wipes the tears from her eyes, before refocusing on cooking.");
		output("\n\n<i>\"S-sorry 'bout that, I-I just thought I could talk about this now. So much has happened since then, but I still can't get over this stuff.\"</i>");
		output("\n\n<i>\"Sorry I brought it up.\"</i>");
		output("\n\n<i>\"No, no, I wanted to talk about it. If I just try and bury it, I'll never really be able to move on. I should be thankin' you for putting up with it. Anywho, uh, let's talk about something else, wind down a bit.\"</i>");
		output("\n\nThe conversation briefly shifts to just casual banter, before quickly dissolving into more bondage talk between her and Mika. You get some really interesting lessons on leashes; good and bad collar materials, proper grip. The conversation stops just as the last of the food is prepared. <i>\"Done and done! Gonna take it over to our ship; gotta feed the crew, and I doubt you want a mob of weirdos running around your ship. Grab a cart and let's get moving.\"</i>");
	}

	addButton(0, "Next", shizzyIntroductionDinner, destination);
}

public function shizzyIntroductionDinner(destination:String):void
{
	clearOutput();
	author("QuestyRobo");
	
	var ate:Boolean = flags["SHIZZY_NOMMED_MIKA"] != undefined;
	
	output("You all make your way down the hall and to the airlock. Once you pass through to her ship, you find not much to get excited about. The wide, tall hallway is mostly steel colored, with some red accents. There's a stack of signs in front of you, with different colored lines going from them, along the walls. One leads to the left, and says \"Hangar elevator\", the other two lead to the right and say, \"Crew Quarters: Block 4\" and \"Mess Hall/Kitchen\". You assume that's where you're going.");
	output("\n\nShizuya pulls out her codex and starts to speak into it. \"Hey guys, food time! Everyone get your asses to the mess hall.\" Her voice echoes throughout the hall, presumably from an intercom system. Faint voices start echoing down the hall, growing steadily louder. Shizuya puts her hand on your shoulder and pushes you along.");
	output("\n\n<i>\"Come on, don't want to get stampeded before we serve up.\"</i> She shepherds you to the mess hall, passing a colorful collection of " + (silly ? "crewmemebers" : "crewmembers") + " on the way. You burst into the mess hall, a group of at least 80 in tow. The mess is certainly big enough, at least; it looks more like a large dance hall with how spacious it is.");
	output("\n\nYou look over and see where the kitchen is. Or, well, where it used to be. They weren't exaggerating when they said a grenade blew up in there; you can hardly make anything out through all the soot. There's a few people in there that were cleaning up, who come out as soon as you enter. One of them approaches you directly, though they're all wearing gas masks, so it's hard to make out her face. A mask can't hide her whole body though, and it's obvious that she's a gryvain. Wings, tail, and scales all on full display, all pitch black, her skin is a chocolate tone, smooth and supple, the darkness contrasted by long, flowing locks of blonde hair. She's also military, a pair of military pips decorating her simple, white shirt.");
	output("\n\nShe removes her gas mask, revealing a pair of piercing, slitted pink eyes, long eyelashes, and supple, black lips. One odd thing you note, is that there's a slight glow emanating from her mouth.");
	output("\n\n<i>\"You must be [pc.name] Steele. Lieutenant Commander Aerowyn Alsmith.\"\n\n\"Military?\"</i>");
	output("\n\n<i>\"Miss Tamaran and crew are actin' under a UGC assignment. As such, an active duty officer of Lieutenant rank or higher is required to be present in order to enforce regulations and make regular progress reports.\"</i>");
	output("\n\n<i>\"Okay, why come up to me, though?\"</i>");
	output("\n\n<i>\"What you did on Tarkus turned a few heads, including mine.");
	if (completedStellarTetherGood()) output(" Ya did good kid:Single-handedly taking out a group of entrenched, heavily armed pirates by yourself. That's the kind of thing that gets people promoted, sometimes more than once. I should know.\"</i>");
	else output(" You may not 'ave been successful, but your bravery, and the fact that you survived at all is impressive. That's worth at least a commendation, a promotion or two if you had succeeded; I know that bit from experience.\"</i>");
	output("\n\nShe points toward the pips on her shirt. <i>\"See that red one? That's the Republic Medal of Valor. I'd recount ya the tale, but it looks like the men don't wanna wait any longer, ey?\"</i> Cheers erupt from behind you, calling for you to get on with the food serving.");
	output("\n\nYou do so with gusto, setting it up buffet style with large plates of food in the middle of one of the larger tables on one side of the room, and setting out enough plates and silverware for everyone. The crew sieges the food table, tearing down the walls of food, and taking the fruits of their conquest to their tables. Thankfully, Shizuya prepared more than enough, and you're able to serve yourself a hearty portion.");
	output("\n\nYour stomach growls heavily as you look at the platter you've prepared for yourself. Your main course is a huge platter of smoked brisket, heavily seasoned and seared, red in the middle, and so moist and tender that your fork almost glides through it. On the side, you have a large bowl of rich, creamy, crisp coleslaw, and one of those baked potatoes from earlier, filled with sour cream, melted cheese of all kinds, chives, and bacon bits, all fried into a nice crust; they're practically overflowing with how stuffed they are. For dessert, you grabbed the last piece of a delicious looking neapolitan cake, with delicious buttercream frosting, and is just delectably moist.");
	if (pc.tallness < 5 * 12 + 2) output("\n\nYou dig in and start eating as much as you possibly can. Unfortunately you bit off more than your tiny body could chew, and you quickly stuff yourself, barely having finished half of your food. Shizuya is sitting across from you, and softly comments on your predicament. <i>\“There there little " + pc.mf("guy", "girl") + ", you don't have to eat all of it, just finish what you want.\"</i> She reaches over and starts petting you. Your body is so heavy with food, that you couldn't work up the strength to get her off, if you wanted too. She stays there for about a minute, before pulling off, and blowing you a soft kiss.");
	else output("\n\nYou dig in and start chowing down. " + (ate ? "You've barely" : "You haven't") + " had a bite to eat since this whole thing started, and you're going to get your fill, damn it! Shizuya watches as you gorge yourself, outpacing you, despite having to deal with her much larger portion. It almost becomes a silent competition between you and her, seeing whose appetite is stronger. You both finish at around the same time, though, ending whatever perceived bout the two of you were in, in a draw.\n\n<i>\"Love that enthusiasm, it's infectious. Suppose that means the food was good?\"\n\n\"Definitely.\"</i>");
	output("\n\nYou recline back in your seat, content to ride out the food coma until the end of this, when you suddenly feel something brush against your leg. You're about to look under the table and see when suddenly");
	if (pc.isCrotchGarbed()) output(" you feel your " + (pc.hasLowerGarment() ? "[pc.lowerGarments]" : "[pc.armor]") + " being yanked down, and a small object placed inside your [pc.anus].");
	else output(" you feel a small object being pushed into your [pc.anus].");
	output(" You jump a bit and quietly yelp, getting immediately shushed by whoever is under the table.");
	output("\n\n<i>\"Initiation time, meat.\"</i> The voice starts speaking softly, and of course it's Mika.\n\nWait, \"initiation?\"");
	output("\n\n<i>\"Yeah " + pc.mf("boi", "gal") + ", time to break you in. I'm going to take what you've got down here, I'mma " + (pc.hasCock() ? "suck" : "eat") + " it like a real Treated bitch, and if you squeal, that vibe is going to make you cum like a firehose in front of everyone. Deal?\"</i>");

	if (pc.hasGenitals() || silly)
	{
		addButton(0, "Yes", shizzyIntroductionHazing, destination);
		if (!pc.isTreated()) addButton(1, "No", shizzyIntroductionNoHazing, destination);
	}
	else addButton(0, "No", shizzyIntroductionNoHazing, destination);
}

//Overly complicated ways to keep this one function because my code has to be tidy dammit
public function shizzyIntroductionHazing(args:*):void
{
	clearMenu();
	clearOutput();
	author("QuestyRobo");
	
	//mode is -1 for herm, 1 for deeks, 2 for pussays and 3 for silly. 0 is for losers.
	var mode:int;
	var destination:String;
	var deek:CockClass;
	var vag:VaginaClass;
	if (args is Array)
	{
		destination = args[0];
		mode = args[1];
	}
	else if (args is String)
	{
		destination = args;
		mode = -1;
	}
	if (mode == -1)
	{
		if (pc.hasCock() && pc.hasVagina())
		{
			output("Which of your bits do you want her to use?");
			addButton(0, "Penis", shizzyIntroductionHazing, new Array(destination, 1));
			return addButton(1, "Vagina", shizzyIntroductionHazing, new Array(destination, 2));
		}
		else if (pc.hasCock())
		{
			mode = 1;
			deek = pc.cocks[pc.longestCockIndex()];
		}
		else if (pc.hasVagina())
		{
			mode = 2;
			vag = pc.vaginas[pc.wettestVaginaIndex()];
		}
		else if (silly) mode = 3;
		else
		{
			output("<b>Something has gone very wrong. Please report this.</b>");
			addButton(0, "Next", flyToWrapper, destination);
		}
	}
	
	if (pc.isTreatedBull() || pc.isAmazon()) output("So, the little girl wants to " + (pc.hasCock() ? "suck your cock" : "eat you out" ) + " huh? Well, who are you to say no to a little after-dinner action. It's a Treated tradition after all, probably.");
	else output("<i>\"Bring it on.\"</i>");
	output(" Mika chuckles happily as she");
	if (pc.hasLowerGarment()) output(" finishes removing your [pc.lowerGarments].");
	else output(" turns her attention to your [pc.crotch].");

	if (mode == 1)
	{
		output("\n\nThe perverse pipsqueak takes stock of your [pc.cocks],");
		if (pc.hasCocks()) output(" juggling your multiple endowments, examining the bouquet you've offered her. Rather than trying to do anything fancy, she just picks out the largest she can take, and pushes your others to the side.");
		else output(" taking it in her hands, making note of its size and shape.");
		
		if (deek.cLength() <= 8 || deek.thickness() < 1.5) output("\n\n<i>\"Hmph, I guess this is a good break from Shizuya, no offense. I mean, if you wanted it bigger, it's not like that's hard.\"</i>");
		else if (deek.cLength() <= 16) output("\n\n<i>\"Nice heft, good shape, prime meat right here.\"</i>");
		else if (deek.cLength() <= 30 || deek.thickness() < 4.5) output("\n\n<i>\"Trying to turn this thing into a club or something? Maybe you and Shizuya should go fencing with these babies, I know she's always wanted to try that.\"</i>");
		else output("\n\nYou hear nothing for a few moments as Mika looks over your mammoth tool. You expect that she's simply awe-struck with the amount of dick that you're packing, but the real reaction you get kind of deflates your ego on that. <i>\"I can work with this. Sorry for the pause, need to do a few jaw stretches. You really should lay off the Virection, you weirdo.\"</i>");
	}
	else if (mode == 2)
	{
		output("\n\nThe tiny tramp softly spreads the lips of your [pc.pussy], dipping one of her little, pudgy fingers into your honeypot. You twitch at the sensation, but the movements of her fingers seem more exploratory than anything fully for your pleasure. She presses against your inner walls, seeing how far they stretch, and makes a heavy, scooping motion as she exits you.");
		if (vag.wetness() <= 3) output("\n\n<i>\"Not bad, I can work this; just gotta warm you up a bit.\"</i>");
		else if (vag.wetness() <= 5) output("\n\n<i>\"Mhm, that's some nice slut wetness you've got down here. Makes me want to break out the strap-on, but that breaks the spirit of the thing.\"</i>");
		else output("\n\n<i>\"Pfft, are you trying to turn yourself into a faucet down here? Am I stealing a meal from some poor galotian? ... Shouldn't have eaten so much...\"</i>");
	}
	else if (mode == 3)
	{
		output(" Mika spies your genital-less state and seems incredibly taken aback, to the point where she crawls out from under the table and stares at you like you just killed a man.");
		output("\n\n<i>\"WHAT THE FU.. UH... UH...\"</i> The world around you turns blue in an instant, everyone around you gone, and Mika replaced with the all too familiar text.");
		output("\"A problem has been detected and TiTS has been shut down to prevent damage to your dong. The system encountered an uncorrectable 'hardware' error.");
		output("\n\nTechnical Information");
		output("\n\n*** STOP: 0x4uk1nn3uter5");
		output("\n\nBeginning dump of physical cummies");
		output("\n\nPhysical cummies dump complete");
		output("\n\nContact your system code dragon or armchair forum coder for further assistance.\"");
		output("\n\nThe struggles of playing a porn game without genitals. At least CoC2 won't have this bullshit. You find and hold down the power button, shutting it all down before rebooting. When everything comes back, you find yourself a few minutes after when you crashed, Mika sitting a few seats down, giving you a very disappointed look.");
		return addButton(0, "Next", shizzyIntroductionEpilouge, destination);
	}
	
	output("\n\nYou sit straight up in your seat, pushing yourself up closer to the table in order to avoid any wandering eyes. Of course, as you look around, the eyes are less wandering, and more following a detailed map to exactly where you are. Mika either told them ahead of time, or you're just that unsubtle. Regardless, you have an audience for this" + (pc.exhibitionism() >= 50 ? ", sweet." : ".") + " Shizuya seems especially excited, giving you a big double thumbs-up from across the table.");
	output("\n\n<i>\"You can do it, man" + (silly ? ", believe in the me that believes in you.\"</i>" : ".\"</i>") + " Um, sure. Before you can really respond, you feel a pair of soft lips around your " + (mode == 1 ? "[pc.cockBiggest]" : "[pc.pussy]") + ", and you know the show's getting started.");

	if (mode == 1)
	{
		output("\n\nBefore you can prepare, Mika slams herself down on your [pc.cockBiggest],");
		if (deek.cLength() <= 16) output(" taking the whole thing to the [pc.sheath].");
		else output(" taking as much of your many inches as her throat will allow.");
		output(" You stifle back a groan, remembering what she told you what would happen if you were too loud. It soon gets much harder to hold back, as the pint-sized cock vacuum uses her throat like a mechanical onahole. She jackhammers herself on your prick, her Treated instincts keeping her from getting tired or needing to breathe too soon. Loud, wet noises ring through the mess hall, and quiet murmurings start to become audible as you continue to be the center of attention.");
		if (pc.exhibitionism() < 50) output("\n\nYou try and ignore all of the eyes on you, but there's just too many! You're breaking out in a cold sweat, it's so embarrassing... but some part of you is enjoying it, pushing you to keep going until the end.");
		else output("\n\nYou push your [pc.chest] out, confidently, revelling in the attention that you're getting, and determined to ride it out until the end.");
		output(" That end might be coming up sooner rather than later. You feel a tightness forming in your gut and [pc.balls] as your body gets ready to release. You're about to boil over, you can practically taste it. She's so relentless, taking your meat over and over again, seemingly uncaring about your imminent orgasm. Seemingly, but not actually.");
		output("\n\nJust when you're about to rush past the point of no return, she stops. She stops with a superhuman suddenness that leaves a bit of residual warmness on your [pc.cockBiggest], that quickly fades as you're exposed to the cold air of the mess hall.");
		output("\n\n<i>\"Did you think it was going to be that easy? No, no, no,");
		if (silly) output(" your punishment must be more severe.");
		else output(" you're far from done here.");
		output(" Don't even think about trying anything, either. I see one hand and that vibe is going to go off like a thraggen cluster mine.\"</i> Damn it, looks like you're in here for the long haul.");
		output("\n\nYou try and calm down, panting as your [pc.cocks]");
		if (pc.cumQ() < 8000) output(" drip");
		else if (pc.cumQ() < 40000) output(" dribble");
		else output(" spray");
		output(" pre onto Mika. You can't see her face, but you can just imagine the grin she has on it, watching you in this state.");
		if (pc.hasVagina()) output(" Even your [pc.pussy] is on the edge, soaking the seat under you");
		if (pc.wettestVaginalWetness() > 5) output(", your [pc.girlCum] running out in voluminous enough amounts to make a small puddle under you and run over the sides");
		output(". You'd think she'd let you rest, that she'd give you some kind of warning before she started up again, but no!");
		output("\n\nWhen your ardor dies down, not even that much, just enough to take you away from the edge, she takes you right back. She grabs your [pc.cockBiggest] and starts jacking it off like she's polishing the barrel of a railgun. You almost yell out again, but manage to choke it down. Can't give up now! She jerks you until you're sent careening toward orgasm, and like before, she stops right before you blow, leaving you to cool off in the cold air.");
		if (pc.balls > 0) output("\n\nMika starts massaging your [pc.balls], gently caressing the sore orbs as more of your pre leaks onto her. ");
		else output("\n\n");
		output("<i>\"Mmh, you're getting really pent up now, aren't you? Yeeeah, I'm gonna pump you up and up until you're ready to fucking explode; and then you're gonna squeal like a little piggy, and I'm going to make you cum ‘til your brain melts into nothing but a pile of cummed-out mush.");
		if (pc.hasPerk("Nuki Nuts")) output(" Oh? I guess I'm pumping you up in more ways than one.\"</i> Oh fuck, you're getting so pent up that your stupid ‘nuki balls are starting to swell up! <i>\"This is going to be a </i>lot<i> more fun than I thought.\"</i>");
		else output("\"</i>");
		output("\n\nYou're already struggling to maintain your composure. The pistoning blowjob, combined with with her constant edging have left you a sweating, panting mess. You hunch over the table, digging your nails into it as you try to distract yourself from her wrapping her tits around your [pc.cockBiggest]; trying to distract yourself from her perfect, warm, chocolatey globes caressing your straining meat, her wide, boiling hot tongue caressing your [pc.cockHead], overheating your [pc.cockColor] skin, until your dick feels like an iron bar fresh out of the smelter. You feel yourself at the peak again, and then feel it snatched away from you, again.");
		output("\n\nYou slam your head against the table, both in frustration and to muffle an involuntary groan as you reach peaks of pleasure that you didn't even know your body could reach without orgasming. You're a complete wreck at this point, babbling and drooling against the table as the whole hall stares on. Shizuya has been staring particularly intently, almost transfixed on your situation. You hear a loud thud and a yelp from Mika.");
		output("\n\n<i>\"Damn it, Shizuya! Why don't you wear fucking panties?\"</i> The meowmazon's face turns red as some of the eyes around you shift to her.");
		output("\n\n<i>\"Sorry. Um, maybe you could do both of us?\"</i> The already unbearable heat under the table suddenly grows in intensity, like someone lit a fire next to your already boiling [pc.crotch]. Your mouth feels so dry from all this heat... so thirsty...");
		output("\n\n<i>\"Hey, do something useful. Go get our friend here some water. Poor " + pc.mf("guy", "girl") + "'s about to pass out over here.\"</i>");
		output("\n\nShizuya pops up, unashamedly flaunting her rock-hard, pre-spewing erections as she hops over to the food table and pours out a big glass of punch. She hurries back over and slams the glass down in front of you, giving you a beaming smile.");
		output("\n\n<i>\"There ya go! Gotta have all the fluids you can for the big finish, whatever happens.\"</i> Mika seems to have stopped long enough to let you drink, and drink you do. You grab the glass and knock it back in seconds, your immense thirst driving you to seek any liquid you can.");
		output("\n\nYou slam the glass down, and let out a loud grunt of satisfaction, immediately followed by a feeling of sudden dread as you realize what you've done.");
		output("\n\n<i>\"I'll let that one slide.\"</i> The tiny tormentor mumbles out as she suddenly grows quiet. For a second, you wonder what she's doing. After that second, you realize exactly what she's doing. All at once, she takes " + (deek.cLength() <= 16 ? "the whole of" : "a large amount of") + " your [pc.cockBiggest] into her mouth");
		if (pc.hasPerk("Nuki Nuts")) output(", her hands darting down to press into your already massively inflated sack, sinking into it like a beanbag chair.");
		else if (pc.balls > 0) output(", her hands darting down to your [pc.balls], giving them a hefty squeeze.");
		else output(".");
		output(" You choke back what must be the biggest moan you could let out, your throat straining, and your resolve waning.");
		output("\n\nShe's back to deepthroating you, and you're sure that she's not going to hold back this time. You try and brace yourself, but there's no way you could, not in this state. All of your muscles are slack from pleasure, your head feels light, it's almost like all of your blood has pooled in your [pc.cocks], making it feel like half of your weight has shifted into your crotch. It feels so bloated, like your skin is an overfilled balloon, and it's going to pop; thankfully, in not nearly as disgusting a way.");
		if (pc.cumQ() < 8000) output("\n\nYou unload into Mika's throat, desperately spraying every drop from your [pc.balls] down her clenching throat. You keep cumming, and cumming, and cumming. Even when you're long empty, your body still tries to expel more cum than you could possibly make without mods. You're so sore... Stars, you won't be able to sit right for a week!");
		else if (pc.cumQ() < 40000) output("\n\nYou fire off into Mika's throat, your [pc.cockBiggest] feeling more like a hose that's been kinked up for an hour, and finally got straightened out. You flood her throat, letting out an inhuman amount of [pc.cum] almost straight into her gut. Of course, she's Treated, so your load is nothing that she can't handle, and she takes as much as you pump out, without complaint. Even your mighty reserves run dry, but that doesn't stop your body from trying to expel more. You clench and pump until your [pc.balls] feel like they've been through a ringer, and then keep going. Oh boy, you're not going to be sitting right for a while.");
		else 
		{
			output("\n\nYou explode like a broken faucet, hosing gallons of [pc.cum] down her throat. She tries her best, and being Treated, her best is pretty damn good, but even her mighty moo tummy can't handle everything you put out, and she eventually lets you out of her sinfully tight, moist mouth, letting you unload right onto her. Shizuya gasps and pushes her crotch further under the table, presumably right into Mika, judging by her reaction.");
			output("\n\n<i>\"Damnit, no!\"\n\n\"Come oooooooooooon! [pc.heShe]'s already basting you, it's just a bit more.\"\n\n\"A bit? You two are going to flood the fucking ship!\"</i> The flustered feline whimpers and backs off, casting lusty eyes around the hall to see if there are any takers.");
			output("\n\nMeanwhile, your [pc.cumColor] flood has gotten large enough that you feel it at your [pc.feet]. There's no end to the flow; it's like the dam keeping your [pc.cum] inside you has completely broken, and every drop is rushing out like a river. You can only imagine how absolutely coated Mika is, or how far the pool of your seed is spreading. You don't even have the energy to lift your head to see for yourself, you just have to take the cat calls and laughing from the people around as indication of it. Stars, you're still going! You probably came again, but your nerves are so overstimulated that all sensation blends together. You're going to be so sore after this.");
		}
	}
	else if (mode == 2)
	{
		output("\n\nYou feel something slowly inserting itself into your honeypot. It's big, thick, and sinfully warm. The" + (vag.hasFlag(GLOBAL.TYPE_EQUINE) ? " immense" : "") + " heat of your [pc.pussy] is almost frigid in comparison. It's her tongue, rolled into a decidedly phallic shape, and cutting through your inner lips like a hot iron, slowly, through butter. You almost moan out as you feel the simmering contact between flesh, the burgeoning heat starting to spread like wildfire in your loins. You catch yourself before you can blow it early, keeping your mouth shut tight, and doing anything to distract yourself.");
		output("\n\nHer tongue continues its trek to your deepest reaches, her upper lip accentuating the pleasure every time she passes a particularly sensitive spot by brushing across your [pc.clit]. She bottoms out after a surprisingly long time. Her tongue is as long as, and much thicker than, most cocks. You feel so full! She holds for a minute, undulating her fuck piston slightly to keep stimulation on you. Just when you feel yourself running up against the edge, she yanks out, liberally splattering your fluids across her face as her tongue drags out a plentiful helping of it. You're left to cool down from the burning fire she stoked in you, your [pc.pussy] still");
		if (vag.wetness() <= 3) output(" dripping");
		else if (vag.wetness() <= 6) output(" drooling");
		else output(" fountaining");
		output(" [pc.girlCum] onto the seat below you.");
		output("\n\nIt's maddening. You almost feel like reaching down and doing it yourself, but you figure she wouldn't like that; and you'd be correct. She closes in on your mons again, getting what must be mere centimeters from your skin, enough that you can feel the vibrations from her voice as she speaks.");
		output("\n\n<i>\"This is </i>mine<i> now, meat. I control it, I say if and when she's good enough to get fucked, and I say when she cums, and how hard, and trust me, when I decide it's time, she's gonna cum </i>hard<i>.\"</i> Terrifying and reassuring at the same time, not like your lust-enamored brain registered much beyond being able to cum.");
		output("\n\nShe keeps your lust momentum going by lapping up the [pc.girlcum] from your outer lips, the heat from her tongue helping to keep the fire of your lust high. It's not enough to keep your lust from waning over time, but that's probably intentional. As soon as you're back to a reasonable level of arousal, you suddenly feel her fingers shoot into your [pc.pussy]. Stubby and plump, but surprisingly dextrous, they work their way into your moist depths, plundering the treasures inside.");
		output("\n\nShe hits your sensitive spots with such speed and accuracy that it can't be guess work. Her Treated instincts combined with her tongue probing earlier seem to have let her plot out a mental map of the pleasurable spots in your cunt, a map that she follows to a tee. Your pleasure shoots up like a rocket as her fingers dance from one sensitive point to another. You almost slam your head into the table in order to stop yourself from crying out. You feel like there's no way she could stop your momentum toward orgasm, but she somehow knows just when to let up so that you stop just before climax.");
		output("\n\nYour crotch is like a swamp at this point. You might not have cum yet, but nobody seems to have told that to your [pc.pussy].");
		if (vag.wetness() <= 3) output((pc.race() != "ausar" ? " You're no ausar" : " You're pretty dry for an ausar") + ", but that hasn't stopped you from leaving a sheet of [pc.girlCum] on the seat, and coating the inside of your [pc.thighs]. You're sure that Mika's face has some splatter on it as well.");
		else if (vag.wetness() <= 5) output(" You really made a mess down there. There's a large puddle on the seat below you, and you can hear stray drops leaking off the sides. Your [pc.thighs] are also soaked and dripping, no doubt contributing to a second puddle under the table. You've probably soaked little Mika too, glazed her in a few layers of [pc.girlCum].");
		else 
		{
			output(" You're fully aware of the torrent you've been letting out. [pc.girlCum] is flowing off the sides of your seat in small waterfalls, collecting in several puddles on the ground. Your [pc.legs] are soaked from top to bottom, dripping so much that a passerby would think you'd just gone swimming. Little Mika is probably drowning down there, though, from the faint giggles you hear, that's not a bad thing. You're still squirting too, like a damaged faucet that won't be turned off.");
			output("\n\n<i>\"Fuck, Steele, is this some kind of threat? You're going to drown me if I don't get you off?\"</i> You might not be thinking that, but your body is definitely sending that sort of message, almost like your womanhood is aiming for her.");
		}
		output("\n\nShizuya has been staring at you the whole time, enraptured by your situation. Her hands have been firmly in her lap, probably to keep her colossal cocks in check.");
		output("\n\n<i>\"Hey Shizzy.\"</i> Mika calls out, snapping Shizuya out of her stupor, and confirming your theory as her hands come up and 'something' impacts the bottom of the table, nearly lifting it up.");
		output("\n\n<i>\"Pay attention, damn it, you almost hit me! Go get [pc.name] some water or something; I feel like I'm draining [pc.him] dry.\"</i> She's not entirely wrong, your mouth feels like a desert, in fact, it feels like most of the liquid in your body is running out your [pc.pussy].");
		output("\n\nShizuya pops out of her seat, nubby horse wangs waving freely in the air as she prances over to the food table. She pours out a tall glass of punch, making sure to wag her bubbly ass in your direction as she does. She has a sex sashay as she comes back and plants the glass in front of you.");
		output("\n\n<i>\"There ya go, sweetie. Best of luck.\"</i> You chug down the glass, drinking it like a " + pc.mf("man", "woman") + " in a desert who just found an oasis. Mika is still lapping up your juices almost right from the source, keeping you from fully calming down as you refresh yourself.");
		output("\n\nAs soon as you're finished, however, you feel her fingers at your entrance again, and you brace for the inevitable. Several more times you're sent hurdling to the finish line, only to stop right at the edge, and get slowly dragged back. Each time, the distance between your climax and when she decides to throw you towards it, grows more and more narrow. Finally, instead of letting you calm down, she keeps her finger on your G-spot, unmoving.");
		output("\n\n<i>\"Good [pc.boyGirl], very good. I think it's time we gave you a nice reward.\"</i> You're almost insensate by this point, panting and drooling as you lay limply on the table, so there's no way you can respond.");
		output("\n\nYou don't really need to respond, it wouldn't matter at this point anyway, she's already in charge. Her finger starts to move again, slowly, methodically. It starts with some simple jittering, putting just the slightest amount of pressure on your G-spot. The intensity grows painfully slowly, not going far enough to take you over the edge, yet. It's driving you crazy! You use whatever strength you have left in order to wiggle your hips into her. Before you can get anywhere with that, you feel a hard slap on the inside of your [pc.thigh], and that last bit of strength jolts out of you.");
		output("\n\n<i>\"Bad, bad, bad, bad, bad!\"</i>");
		output("\n\nYou groan softly in apology as Mika repositions herself, planting her face right up against your [pc.pussy] and one of her fingers on your [pc.clit]. There's no way for you to brace for it. You know exactly what she's going to do, and you're just going to have to sit there and take it. On que, her familiar tongue breaches your nethers once more, while her finger starts strumming your clit like a guitar string during a solo. She tongue-fucks you like a beast in heat, thrusting in and out with a level of speed that you'd only expect out of the most seasoned studs.");
		output("\n\nYou cum instantly, once, twice, thrice, you lose count almost instantly as her heavy treatment, combined with her constant teasing, causes your orgasms to cascade into each other at an accelerating rate. White hot pleasure blends each one into a continuous stream. Your life in this moment is nothing but blinding orgasm, everything else gets pushed out of your thoughts. Friends, family, your mission, everything not to do with the wonderful moo tongue bringing you to new heights of pleasure is cast aside in this blissful moment.");
		output("\n\nYou try and wring her dry, every muscle in your [pc.pussy] working overtime to try and breed you with the phallic object, despite you knowing you're not getting any " + (silly ? "cummies" : "cum") + " out of it.");
		if (vag.wetness() <= 3) output(" She takes every drop you have and more. There's no way for your poor pussy to keep up with her thirst, but the little girl tries its best anyway, splattering any traces of [pc.girlCum] it can dredge up.");
		else if (vag.wetness() <= 6) output(" She keeps up with your productive pussy well. You spray [pc.girlCum] out in large gouts, each one gleefully swept away by her pistoning tongue. You keep pumping out uncontrollably from your back-to-back orgasms. She's not complaining, it's probably thirsty work tongue-fucking with such ferocity.");
		else output(" You spray out massive gouts of [pc.girlCum], so much that she can't possibly keep up, and you can hear your juices splash out around her tongue. You didn't think the sounds from you coupling could get any wetter, but now it sounds more like someone's popping water balloons against your crotch. Mika grunts in irritation, takes her strumming finger away, and presses her whole mouth against your mons, taking your overflow directly into her mouth.");
	}
	
	if (pc.willpower() >= pc.willpowerMax() * .7)
	{
		output("\n\nYou know you can make it through if you just stay strong, but, maybe you just want to have a bit of extra fun?");
		addButton(0, "Strong", shizzyIntroductionHazeThroughItAll, destination);
		addButton(1, "Give Up", shizzyIntroductionFuckThisHazing, destination);
		return;
	}
	
	output("\n\n");
	shizzyIntroductionHazingLoss(destination);
}

public function shizzyIntroductionFuckThisHazing(destination:String):void
{
	clearMenu();
	clearOutput();
	author("QuestyRobo");
	//showBust(dunno);
	
	shizzyIntroductionHazingLoss(destination);
}

public function shizzyIntroductionHazingLoss(destination:String):void
{
	output("You can't hold it back anymore, it's just too much! You let out a wailing moan, so loud that everyone in the mess hall can hear it. As soon as you do, you hear a click, and immediately feel something stirring in your [pc.anus]. It isn't just vibration, there's some kind of wetness that wells up for a second, before seeping into your anal walls, leaving a slight tingling sensation in its wake. You wonder what it just did, until you figure out exactly that. Your [pc.skin] breaks out in goosebumps, and an unbearable heat spreads through your whole body. Your previously slack muscles spring back to life with an overload of energy.");
	output("\n\nYou shoot up from the table, leaving Mika behind as you move around the room in jolts, feeling more like a remote control toy with a broken receiver as surges of energy and pleasure force you to move somewhere, anywhere just to burn off the excess. Your [pc.crotch] feels so heavy and swollen, like you haven't cum in weeks even though Mika just finished draining you dry, and then some; what the hell did she do to you? Another small surge of wetness comes up in your butthole, getting just as quickly absorbed, except instead of just a tingling sensation, it's almost like it's burning a path to your crotch.");
	output("\n\nYou fall onto your back as pleasure builds in you like a balloon attached to an industrial air pump. You can't do anything but scream and pump your hips wildly into the air as you're assaulted by mind bending pleasure.");

	if (pc.hasCock())
	{
		output("\n\nYour [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " so adamantine hard that you can almost see the blood rushing through the coiling, overworked veins.");
		if (pc.hasVagina()) output(" Your [pc.pussy] is just as riled up, feeling like it's swelling to almost double its size from the amount of blood going into it.");
		output("\n\nPre pools at the " + (pc.hasCocks() ? "tips" : "tip") + " of your meat, more than you've ever seen. How can you have more cum, what the fuck did she give you? Heavy contractions start in the bottom of your gut, reverberating into your [pc.balls] and " + (pc.hasCocks() ? "shafts." : "shaft.") + " You feel like a soda can that's been shaken up in a tumble dryer, ready to pop, to fucking explode whether someone opens you or not.");
		output("\n\nIt gets heavier and heavier, until you feel like your crotch is made of lead. Your screams of pleasure devolve into mindless babbling, and then, finally, teeth gritting as you feel something snap, like the rope on a catapult.");
		if (pc.cumQ() < 8000) output(" You hose out [pc.cum] in gouts that are bigger than your entire, usual orgasm. Your [pc.balls] are working overtime to keep up with the demand of your drugged-up libido. It doesn't work completely, and you fire far more blanks than real shots, but you still get out enough to give yourself a nice [pc.cumColor] coating. Whatever she gave you must have skyrocketed your production.");
		else if (pc.cumQ() < 40000) output(" You spray out [pc.cum] like a hose, your urethra working so hard that the contractions come in less than a second after each other. Even your virility can't quite keep up with your drugged-up lusts, and your stream wanes as your [pc.balls] struggle to keep pace, even with what seems like a production boost from whatever is going through you. It doesn't take long for you to absolutely coat yourself in a few layers of [pc.cumColor], and there's more where that came from.");
		else output(" You explode, firing cannon blasts of [pc.cum] with such force that small splatters coat the ceiling. Your continuous climax is so forceful, that rivers of your seed run out from your urethra, in addition to the massive, thick arcs that fly up into the air. You're soaked from above and below as you form a small, [pc.cumColor] lake under you. It feels like so much more than usual. Maybe whatever she put in you is putting your [pc.balls] into overdrive? Doesn't really matter at this point.");
		if (pc.hasVagina())
		{
			output(" Your [pc.pussy] goes off as well,");
			if (pc.wettestVaginalWetness() <= 3) output(" splattering");
			else if (pc.wettestVaginalWetness() <= 6) output(" spraying");
			else output(" hosing");
			output(" down the ground under you, adding to the already copious fluids.");
		}
	}
	else
	{
		output("\n\nYour [pc.pussy] feels, and looks absurdly swollen, like it's just spent a few hours inside a pump. Your hand grabs for it, almost out of instinct, your fingers sinking into the yielding, swollen flesh. The contact is like a lightning bolt striking you, setting you off in an instant. Your back arches off the ground, your whole body paralyzed except for your busy fingers.");
		if (pc.wettestVaginalWetness() <= 3) output(" You rain down [pc.girlCum] onto the ground below you, spraying like a sprinkler as the familiar feeling of back-to-back orgasms returns with a vengeance.");
		else if (pc.wettestVaginalWetness() <= 6) output(" You hose [pc.girlcum] onto the ground below you, firing off like a water gun, creating a small puddle under your feet, as the familiar feeling of back-to-back orgasms returns with a vengeance.");
		else output(" You shoot [pc.girlcum] out with the volume and ferocity of a hose, spraying so hard that your streams scatter on impact, causing a thin rain to fall over you. Your back arches even harder as the pressure from expelling so much lady juice brings you to even further heights of pleasure. You feel like a living water fountain, and the only thing left on your mind is, how many people in this room want to come and help plug you up? Void, if only you had the motor control to speak, you'd start a fuck train right here and now!");
	}

	output("\n\nAs you continue to cum your brains out, you hear a yell ringing out from where you were sitting. <i>\"OH FUCK!\"</i> You dredge up enough control to look over, just in time to catch a huge gout of pearly cum across the [pc.chest]. <i>\"Damnit Shizuya! What's the point in me restraining you if you're just going to cum anyway?\"</i>");
	output("\n\n<i>\"S-s-sorry, it wa-as just so fuckin' h-h-hooooooooooooooot!\"</i> You see Mika, standing on the table, holding Shizuya's hands behind her back, probably to keep her from masturbating, not like it helped. Her cocks are hosing out cum at an amazing rate, already making a good-sized puddle under her feet after only a few seconds. Her eyes are going red again, and she's looking at you, hungrily.");
	output("\n\n<i>\"Fine, have at it. She lost, so she's getting punished anyway.\"</i> Mika lets go of her arms, and immediately Shizuya springs over to you. She holds one of her members toward you, jerking it off to get her flow going at full speed. The other one gets nestled right in her cleavage, where it launches cum with enough force to obscure her vision, and absolutely paint her.");
	output("\n\nShe stands there, painting the booth of you white, as the warm, liquid contact on your hyper-sensitive skin only extends your own orgasm. Eventually, both of you run your course, leaving a small flood on the floor, and a deafening cheer from the crowd around you. Shizuya picks up your slack, coated form, throwing you over her shoulder as she fiddles with her cum-drenched codex.");
	output("\n\n<i>\"It's alright, bud, even when ya lose, everyone wins!\"</i> Your only response is a soft groan. After a minute, a beeping sound starts, and you feel a faint suction on your body. Before your eyes, the cum on the floor starts draining into some unseen mechanism. The same mechanism also seems to suck the fluids straight off your bodies, leaving you and Shizuya squeaky clean.");

	pc.orgasm();
	
	addButton(0, "Next", shizzyIntroductionEpilouge, destination);
}

public function shizzyIntroductionHazeThroughItAll(destination:String):void
{
	clearMenu();
	clearOutput();
	author("QuestyRobo");
	
	output("Despite how drained you are, you hold fast, choking down any noise in order to win. She keeps at you, making you cum several more times, but after a while, even her persistence reaches its end, and she concedes defeat.");
	output("\n\n<i>\"Very good, Steele. Not many people on this ship can say they got through that without my little toy going off. Of course, I'm pretty sure most of them lose on purpose anyway, but whatever.\"</i> She comes up from under the table, next to you, and flashes a thumbs up to the rest of the hall, which erupts in cheering. You see that Shizuya has moved to another table, flanked by two busty women, with a noticeable puddle below them. They also flash you a thumbs up.");

	pc.orgasm();
	
	addButton(0, "Next", shizzyIntroductionEpilouge, destination);
}

public function shizzyIntroductionNoHazing(destination:String):void
{
	clearMenu();
	clearOutput();
	author("QuestyRobo");
	
	output("You tell her no, you don't want to be a part of whatever she's planning down there.");
	output("\n\n<i>\"Bleh, you really are no fun, you know that?\"</i> She spitefully yanks out whatever she put inside of you. It's not hard enough to hurt, but enough to let you know without a doubt that she's upset. A few boos come your way as Mika climbs out from under the table, and the raspberry she blows at you certainly isn't very nice either. That brief period of unpleasantness ends, leaving things to go back to normal.");
	
	addButton(0, "Next", shizzyIntroductionEpilouge, destination);
}

public function shizzyIntroductionEpilouge(destination:String):void
{
	clearOutput();
	author("QuestyRobo");
	
	output("The rest of the day is filled with food, drinks, and getting to know a few of the " + (silly ? "memebers" : "members") + " of the crew. It's an odd bunch to say the least, filled with people of almost every race you can think of. It feels like you could learn a lot about a ton of different cultures just from being here; that is, assuming both of you aren't too drunk to talk coherently, because the drinks, right now at least, flow like water around here, and they're <i>strong</i>. They're the kind of drinks that would knock most people out, and even stuff that would put the unconditioned in the hospital.");
	output("\n\nYou eventually settle into a large lounge, where you" + (annoIsCrew() ? ", Anno" : "") + ", Shizuya, and pals take some time to just shoot the shit, and by the time you decide it's time to part ways, it's already been several hours.");
	output("\n\n<i>\"Well, shit, has it been that long? Alright, guess we better get movin' on here. Addy, you been watching the coms?\"</i>");
	output("\n\n<i>\"Of course, someone has to have been working this whole time. Judau hasn't been seen in... Wait, we might have something. One of our moles just got contacted, Leda-squad is moving in, and is requesting back-up.\</i>");
	output("\n\n<i>\"Fuck yeah!\"</i> Everyone hops up immediately, and excitedly. <i>\"Um, yeah, gotta deal with this. But, uh, you know, if you see us around, ya can stop by anytime.");
	if (annoIsCrew()) output(" You too, Anno. Sorry we couldn't, uh, ya know, today. Offer's still open, 'specially if you bring your friend along.\"</i>\n\nAnno blows Shizuya a quick kiss, before turning to you. <i>\"Looking forward to it. Both of us, I hope.\"</i> ");
	else output("\"</i>\n\n");
	output("With that, you follow Shizuya and company out of the room, parting ways at the hallway as you head back to the airlock, and back to your ship, where you replot your original course, and set off.");
	
	flags["SHIZZY_MET"] = 1;
	if (yammiIsCrew()) flags["SHIZZY_YAMMI_AT_TRAP"] = 1;
	else flags["SHIZZY_YAMMI_AT_TRAP"] = 0;
	
	addButton(0, "Next", flyToWrapper, destination);
}

/*
 * anno things
*/



/* 
 * ship stuf goes here
 */